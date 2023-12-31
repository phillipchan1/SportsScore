//
//  SportsScoreWidget.swift
//  SportsScoreWidget
//
//  Created by Phil Chan on 6/16/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), score: 5)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, score: 5)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, score: 5)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let score: Int
}

struct SportsScoreWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Score Tracker Widget")
                .font(.headline)
                .padding()
            Text("Current Score: \(entry.score)")
                .font(.subheadline)
        }
    }
}

struct SportsScoreWidget: Widget {
    let kind: String = "SportsScoreWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SportsScoreWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SportsScoreWidget_Previews: PreviewProvider {
    static var previews: some View {
        SportsScoreWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), score: 5))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
