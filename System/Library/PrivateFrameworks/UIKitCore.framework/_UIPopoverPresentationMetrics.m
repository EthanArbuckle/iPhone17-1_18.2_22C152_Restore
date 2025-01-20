@interface _UIPopoverPresentationMetrics
+ (id)defaultPopoverMetrics;
- (BOOL)shouldHideArrow;
- (BOOL)shouldUseVisualStyleAnimationControllerForDismissal;
- (BOOL)shouldUseVisualStyleAnimationControllerForPresentation;
- (CGSize)defaultPreferredLargeContentSize;
- (CGSize)defaultPreferredSmallContentSize;
- (double)cornerRadius;
- (void)setCornerRadius:(double)a3;
- (void)setShouldHideArrow:(BOOL)a3;
- (void)setShouldUseVisualStyleAnimationControllerForDismissal:(BOOL)a3;
- (void)setShouldUseVisualStyleAnimationControllerForPresentation:(BOOL)a3;
@end

@implementation _UIPopoverPresentationMetrics

+ (id)defaultPopoverMetrics
{
  if (qword_1EB260590 != -1) {
    dispatch_once(&qword_1EB260590, &__block_literal_global_205);
  }
  v2 = (void *)_MergedGlobals_1043;
  return v2;
}

- (CGSize)defaultPreferredSmallContentSize
{
  double v2 = 320.0;
  double v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldHideArrow
{
  return self->_shouldHideArrow;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setShouldUseVisualStyleAnimationControllerForPresentation:(BOOL)a3
{
  self->_shouldUseVisualStyleAnimationControllerForPresentation = a3;
}

- (void)setShouldUseVisualStyleAnimationControllerForDismissal:(BOOL)a3
{
  self->_shouldUseVisualStyleAnimationControllerForDismissal = a3;
}

- (void)setShouldHideArrow:(BOOL)a3
{
  self->_shouldHideArrow = a3;
}

- (BOOL)shouldUseVisualStyleAnimationControllerForPresentation
{
  return self->_shouldUseVisualStyleAnimationControllerForPresentation;
}

- (CGSize)defaultPreferredLargeContentSize
{
  double v2 = 375.0;
  double v3 = 667.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldUseVisualStyleAnimationControllerForDismissal
{
  return self->_shouldUseVisualStyleAnimationControllerForDismissal;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end