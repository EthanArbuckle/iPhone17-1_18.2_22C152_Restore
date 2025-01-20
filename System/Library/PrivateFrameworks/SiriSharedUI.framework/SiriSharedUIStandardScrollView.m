@interface SiriSharedUIStandardScrollView
- (BOOL)isSemanticContentAttributeRightToLeft;
- (SiriSharedUIStandardScrollView)init;
- (UIEdgeInsets)safeAreaInsets;
@end

@implementation SiriSharedUIStandardScrollView

- (SiriSharedUIStandardScrollView)init
{
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIStandardScrollView;
  return [(SiriSharedUIStandardScrollView *)&v3 init];
}

- (UIEdgeInsets)safeAreaInsets
{
  if ([(SiriSharedUIStandardScrollView *)self contentInsetAdjustmentBehavior] == 2)
  {
    double v3 = *MEMORY[0x263F834E8];
    double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriSharedUIStandardScrollView;
    [(SiriSharedUIStandardScrollView *)&v7 safeAreaInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)isSemanticContentAttributeRightToLeft
{
  return [(SiriSharedUIStandardScrollView *)self semanticContentAttribute] == 4;
}

@end