@interface TUISystemInputAssistantStyleStandard
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

@implementation TUISystemInputAssistantStyleStandard

- (BOOL)clipsToBounds
{
  return 0;
}

- (BOOL)shouldAnimatePredictionCandidate
{
  return 1;
}

- (double)separatorMargin
{
  return 10.0;
}

- (UIImageSymbolConfiguration)barButtonImageSymbolConfiguration
{
  return 0;
}

- (double)minimumInterBarItemSpace
{
  return 5.0;
}

- (double)barButtonWidth
{
  return 40.0;
}

- (BOOL)useContinuousCornerInHighlight
{
  return 0;
}

- (double)highlightCornerRadius
{
  return 5.0;
}

- (double)highlightMargin
{
  return 6.0;
}

- (UIColor)predictionHighlightColor
{
  return 0;
}

- (UIColor)predictionSeparatorColor
{
  return 0;
}

- (BOOL)drawsPredictionBackdropView
{
  return 0;
}

- (BOOL)enableButtonTintColor
{
  return 0;
}

@end