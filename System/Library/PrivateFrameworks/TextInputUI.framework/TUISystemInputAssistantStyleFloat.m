@interface TUISystemInputAssistantStyleFloat
- (BOOL)clipsToBounds;
- (BOOL)drawsPredictionBackdropView;
- (BOOL)enableButtonTintColor;
- (BOOL)shouldAnimatePredictionCandidate;
- (BOOL)useContinuousCornerInHighlight;
- (UIColor)predictionHighlightColor;
- (UIColor)predictionSeparatorColor;
- (UIImageSymbolConfiguration)barButtonImageSymbolConfiguration;
- (double)barButtonWidth;
- (double)highlightCornerRadius;
- (double)highlightMargin;
- (double)minimumInterBarItemSpace;
- (double)separatorMargin;
@end

@implementation TUISystemInputAssistantStyleFloat

- (BOOL)clipsToBounds
{
  return 1;
}

- (BOOL)shouldAnimatePredictionCandidate
{
  return 0;
}

- (double)separatorMargin
{
  return 13.0;
}

- (UIImageSymbolConfiguration)barButtonImageSymbolConfiguration
{
  return (UIImageSymbolConfiguration *)[MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:19.0];
}

- (double)minimumInterBarItemSpace
{
  return 15.0;
}

- (double)barButtonWidth
{
  return 36.0;
}

- (BOOL)useContinuousCornerInHighlight
{
  return 1;
}

- (double)highlightCornerRadius
{
  return 10.0;
}

- (double)highlightMargin
{
  return 0.0;
}

- (UIColor)predictionHighlightColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondarySystemFillColor];
}

- (UIColor)predictionSeparatorColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (BOOL)drawsPredictionBackdropView
{
  return 1;
}

- (BOOL)enableButtonTintColor
{
  return 1;
}

@end