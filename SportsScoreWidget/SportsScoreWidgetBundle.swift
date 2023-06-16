//
//  SportsScoreWidgetBundle.swift
//  SportsScoreWidget
//
//  Created by Phil Chan on 6/16/23.
//

import WidgetKit
import SwiftUI

@main
struct SportsScoreWidgetBundle: WidgetBundle {
    var body: some Widget {
        SportsScoreWidget()
        SportsScoreWidgetLiveActivity()
    }
}
