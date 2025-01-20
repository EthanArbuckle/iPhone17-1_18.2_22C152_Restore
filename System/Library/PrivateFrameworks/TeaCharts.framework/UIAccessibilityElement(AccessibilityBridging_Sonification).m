@interface UIAccessibilityElement(AccessibilityBridging_Sonification)
- (double)tc_accessibilityDataSeriesSonificationDuration;
- (uint64_t)tc_accessibilityDataSeriesGridlinePositionsForAxis:()AccessibilityBridging_Sonification;
- (uint64_t)tc_accessibilityDataSeriesIncludesTrendlineInSonification;
- (uint64_t)tc_accessibilityDataSeriesMaximumValueForAxis:()AccessibilityBridging_Sonification;
- (uint64_t)tc_accessibilityDataSeriesMinimumValueForAxis:()AccessibilityBridging_Sonification;
- (uint64_t)tc_accessibilityDataSeriesName;
- (uint64_t)tc_accessibilityDataSeriesSupportsSonification;
- (uint64_t)tc_accessibilityDataSeriesSupportsSummarization;
- (uint64_t)tc_accessibilityDataSeriesTitleForAxis:()AccessibilityBridging_Sonification;
- (uint64_t)tc_accessibilityDataSeriesType;
- (uint64_t)tc_accessibilityDataSeriesUnitLabelForAxis:()AccessibilityBridging_Sonification;
- (uint64_t)tc_accessibilityDataSeriesValueDescriptionForPosition:()AccessibilityBridging_Sonification axis:;
- (uint64_t)tc_accessibilityDataSeriesValuesForAxis:()AccessibilityBridging_Sonification;
@end

@implementation UIAccessibilityElement(AccessibilityBridging_Sonification)

- (uint64_t)tc_accessibilityDataSeriesName
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesValuesForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesType
{
  return 1;
}

- (uint64_t)tc_accessibilityDataSeriesTitleForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesUnitLabelForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesMinimumValueForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesMaximumValueForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesGridlinePositionsForAxis:()AccessibilityBridging_Sonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesSupportsSummarization
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesSupportsSonification
{
  return 0;
}

- (uint64_t)tc_accessibilityDataSeriesIncludesTrendlineInSonification
{
  return 0;
}

- (double)tc_accessibilityDataSeriesSonificationDuration
{
  return 0.0;
}

- (uint64_t)tc_accessibilityDataSeriesValueDescriptionForPosition:()AccessibilityBridging_Sonification axis:
{
  return 0;
}

@end