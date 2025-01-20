@interface _UIViewServiceDummyPopoverBackgroundView
+ (BOOL)wantsDefaultContentAppearance;
+ (UIEdgeInsets)contentViewInsets;
+ (double)arrowBase;
+ (double)arrowHeight;
- (CGSize)_shadowOffset;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)arrowOffset;
- (unint64_t)arrowDirection;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowOffset:(double)a3;
@end

@implementation _UIViewServiceDummyPopoverBackgroundView

+ (double)arrowHeight
{
  return 0.0;
}

+ (double)arrowBase
{
  return 0.0;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)wantsDefaultContentAppearance
{
  return 0;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)arrowOffset
{
  return self->arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  self->arrowOffset = a3;
}

- (unint64_t)arrowDirection
{
  return self->arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->arrowDirection = a3;
}

@end