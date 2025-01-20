@interface NavTrayMetrics
+ (id)defaultMetrics;
- (CGSize)expandCollapseImageSize;
- (NSString)endButtonIconTextStyle;
- (NSString)endButtonTextStyle;
- (NSString)expandedTitleTextStyle;
- (NSString)minimizedTitleTextStyle;
- (UIColor)endButtonBackgroundColor;
- (UIColor)endButtonTextColor;
- (UIColor)expandedTextColor;
- (UIColor)minimizedTitleTextColor;
- (UIColor)minimizedValueTextColor;
- (UIColor)pauseButtonBackgroundColor;
- (UIColor)pauseButtonTextColor;
- (double)actionButtonBottomPadding;
- (double)actionButtonInterButtonPadding;
- (double)arrivedTitleContainerHorizontalPadding;
- (double)cornerRadius;
- (double)defaultHorizontalPadding;
- (double)defaultVerticalPadding;
- (double)endButtonFontWeight;
- (double)endButtonHeight;
- (double)endButtonIconFontWeight;
- (double)expandedTitleFontWeight;
- (double)feedbackButtonHeight;
- (double)minimizedHeaderHorizontalPadding;
- (double)minimizedHeaderVerticalPadding;
- (double)minimizedTitleFontWeight;
- (double)minimizedTitleMinimumPointSize;
- (double)minimizedValueInterLabelPadding;
- (double)minimizedValueMinimumPointSize;
- (double)minimizedValueToTitlePadding;
- (int64_t)endButtonIconImageSymbolScale;
@end

@implementation NavTrayMetrics

+ (id)defaultMetrics
{
  if (qword_101610D00 != -1) {
    dispatch_once(&qword_101610D00, &stru_10131D598);
  }
  v2 = (void *)qword_101610CF8;

  return v2;
}

- (double)defaultHorizontalPadding
{
  return self->_defaultHorizontalPadding;
}

- (double)defaultVerticalPadding
{
  return self->_defaultVerticalPadding;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)minimizedHeaderHorizontalPadding
{
  return self->_minimizedHeaderHorizontalPadding;
}

- (double)minimizedHeaderVerticalPadding
{
  return self->_minimizedHeaderVerticalPadding;
}

- (NSString)minimizedTitleTextStyle
{
  return self->_minimizedTitleTextStyle;
}

- (double)minimizedTitleFontWeight
{
  return self->_minimizedTitleFontWeight;
}

- (UIColor)minimizedValueTextColor
{
  return self->_minimizedValueTextColor;
}

- (double)minimizedValueMinimumPointSize
{
  return self->_minimizedValueMinimumPointSize;
}

- (double)minimizedValueToTitlePadding
{
  return self->_minimizedValueToTitlePadding;
}

- (double)minimizedValueInterLabelPadding
{
  return self->_minimizedValueInterLabelPadding;
}

- (UIColor)minimizedTitleTextColor
{
  return self->_minimizedTitleTextColor;
}

- (double)minimizedTitleMinimumPointSize
{
  return self->_minimizedTitleMinimumPointSize;
}

- (NSString)expandedTitleTextStyle
{
  return self->_expandedTitleTextStyle;
}

- (double)expandedTitleFontWeight
{
  return self->_expandedTitleFontWeight;
}

- (UIColor)expandedTextColor
{
  return self->_expandedTextColor;
}

- (CGSize)expandCollapseImageSize
{
  double width = self->_expandCollapseImageSize.width;
  double height = self->_expandCollapseImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)feedbackButtonHeight
{
  return self->_feedbackButtonHeight;
}

- (double)endButtonHeight
{
  return self->_endButtonHeight;
}

- (NSString)endButtonTextStyle
{
  return self->_endButtonTextStyle;
}

- (double)endButtonFontWeight
{
  return self->_endButtonFontWeight;
}

- (NSString)endButtonIconTextStyle
{
  return self->_endButtonIconTextStyle;
}

- (double)endButtonIconFontWeight
{
  return self->_endButtonIconFontWeight;
}

- (int64_t)endButtonIconImageSymbolScale
{
  return self->_endButtonIconImageSymbolScale;
}

- (UIColor)endButtonTextColor
{
  return self->_endButtonTextColor;
}

- (UIColor)endButtonBackgroundColor
{
  return self->_endButtonBackgroundColor;
}

- (UIColor)pauseButtonTextColor
{
  return self->_pauseButtonTextColor;
}

- (UIColor)pauseButtonBackgroundColor
{
  return self->_pauseButtonBackgroundColor;
}

- (double)actionButtonInterButtonPadding
{
  return self->_actionButtonInterButtonPadding;
}

- (double)actionButtonBottomPadding
{
  return self->_actionButtonBottomPadding;
}

- (double)arrivedTitleContainerHorizontalPadding
{
  return self->_arrivedTitleContainerHorizontalPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pauseButtonTextColor, 0);
  objc_storeStrong((id *)&self->_endButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_endButtonTextColor, 0);
  objc_storeStrong((id *)&self->_expandedTextColor, 0);
  objc_storeStrong((id *)&self->_minimizedTitleTextColor, 0);

  objc_storeStrong((id *)&self->_minimizedValueTextColor, 0);
}

@end