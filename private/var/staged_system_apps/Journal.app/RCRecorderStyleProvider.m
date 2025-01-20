@interface RCRecorderStyleProvider
+ (id)sharedStyleProvider;
- (double)activityWaveformRunningAverageDuration;
- (double)activityWaveformTimeWindowDuration;
- (double)dynamicIslandStatusMessageDisplayLength;
- (double)platterCheckmarkHeightMultiplier;
- (double)platterCompactLeadingViewHeightMultiplier;
- (double)platterCustomLeadingViewHeightMultiplier;
- (double)platterCustomLeadingViewLeadingPadding;
- (double)platterCustomLeadingViewToTrailingViewMinimumPadding;
- (double)platterEmptyViewToCheckmarkTransitionDuration;
- (double)platterMinimalViewWidth;
- (double)platterMinimalWaveformViewHeight;
- (double)platterStopButtonHeight;
- (double)platterStopButtonStateTransitionDuration;
- (double)platterWaveformMinimumRoundedSliceWidthPerSide;
- (double)platterWaveformPercentageOfRoundedSlices;
- (double)platterWaveformSlicePadding;
- (double)platterWaveformSliceScaleFactorForExpandedMode;
- (double)platterWaveformSliceWidth;
- (double)platterWaveformWidthCompact;
- (id)_platterTimeLabelFontWithTextStyle:(id)a3 traitCollection:(id)a4;
- (id)platterKeyColor;
- (id)platterStatusMessageStateTimeLabelColor;
- (id)platterTimeLabelCompactModeFontForTraitCollection:(id)a3;
- (id)platterTimeLabelCustomModeFontForTraitCollection:(id)a3;
- (id)platterWaveformActiveSliceColor;
- (id)platterWaveformInactiveSliceColor;
- (id)platterWaveformStatusMessageSliceColor;
- (unint64_t)platterCompactViewSliceCount;
- (unint64_t)platterMinimalViewSliceCount;
@end

@implementation RCRecorderStyleProvider

+ (id)sharedStyleProvider
{
  if (qword_100815DD8 != -1) {
    dispatch_once(&qword_100815DD8, &stru_100790D38);
  }
  v2 = (void *)qword_100815DD0;

  return v2;
}

- (double)activityWaveformTimeWindowDuration
{
  return 2.0;
}

- (double)activityWaveformRunningAverageDuration
{
  [(RCRecorderStyleProvider *)self activityWaveformTimeWindowDuration];
  return v2 + 0.5;
}

- (id)platterKeyColor
{
  return +[UIColor colorWithRed:0.9988 green:0.271 blue:0.2263 alpha:1.0];
}

- (id)platterStatusMessageStateTimeLabelColor
{
  return [(RCRecorderStyleProvider *)self platterWaveformStatusMessageSliceColor];
}

- (id)platterTimeLabelCustomModeFontForTraitCollection:(id)a3
{
  return [(RCRecorderStyleProvider *)self _platterTimeLabelFontWithTextStyle:UIFontTextStyleTitle3 traitCollection:a3];
}

- (id)platterTimeLabelCompactModeFontForTraitCollection:(id)a3
{
  return [(RCRecorderStyleProvider *)self _platterTimeLabelFontWithTextStyle:UIFontTextStyleSubheadline traitCollection:a3];
}

- (id)_platterTimeLabelFontWithTextStyle:(id)a3 traitCollection:(id)a4
{
  v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 compatibleWithTraitCollection:a4];
  [v4 pointSize];
  v5 = +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:");

  return v5;
}

- (double)platterStopButtonHeight
{
  return 57.0;
}

- (double)platterStopButtonStateTransitionDuration
{
  return 1.0;
}

- (double)dynamicIslandStatusMessageDisplayLength
{
  return 3.0;
}

- (unint64_t)platterMinimalViewSliceCount
{
  return 10;
}

- (unint64_t)platterCompactViewSliceCount
{
  return 16;
}

- (double)platterWaveformSliceWidth
{
  return 1.6;
}

- (double)platterWaveformSlicePadding
{
  return 1.2;
}

- (double)platterWaveformSliceScaleFactorForExpandedMode
{
  return 2.3;
}

- (double)platterWaveformPercentageOfRoundedSlices
{
  return 0.3;
}

- (double)platterWaveformMinimumRoundedSliceWidthPerSide
{
  return 5.0;
}

- (double)platterWaveformWidthCompact
{
  unint64_t v3 = [(RCRecorderStyleProvider *)self platterCompactViewSliceCount];
  [(RCRecorderStyleProvider *)self platterWaveformSliceWidth];
  double v5 = v4;
  [(RCRecorderStyleProvider *)self platterWaveformSlicePadding];
  return v6 * (double)v3 + (double)v3 * v5;
}

- (id)platterWaveformActiveSliceColor
{
  return +[UIColor colorWithRed:1.0 green:0.349019608 blue:0.345098039 alpha:1.0];
}

- (id)platterWaveformInactiveSliceColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.3];
}

- (id)platterWaveformStatusMessageSliceColor
{
  return +[UIColor systemWhiteColor];
}

- (double)platterEmptyViewToCheckmarkTransitionDuration
{
  return 0.3;
}

- (double)platterCompactLeadingViewHeightMultiplier
{
  return 0.53;
}

- (double)platterCustomLeadingViewLeadingPadding
{
  return 18.0;
}

- (double)platterCustomLeadingViewHeightMultiplier
{
  return 0.55;
}

- (double)platterCustomLeadingViewToTrailingViewMinimumPadding
{
  return -5.0;
}

- (double)platterMinimalWaveformViewHeight
{
  return 20.0;
}

- (double)platterCheckmarkHeightMultiplier
{
  return 0.7;
}

- (double)platterMinimalViewWidth
{
  return 45.0;
}

@end