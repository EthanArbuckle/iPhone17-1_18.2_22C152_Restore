@interface UIKeyboardCandidatePocketShadowLayoutAttributes
- (BOOL)drawsShadow;
- (void)setDrawsShadow:(BOOL)a3;
@end

@implementation UIKeyboardCandidatePocketShadowLayoutAttributes

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (void)setDrawsShadow:(BOOL)a3
{
  self->_drawsShadow = a3;
}

@end