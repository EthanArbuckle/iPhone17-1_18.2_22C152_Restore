@interface PTRenderEffectInput
- (float)focusDistance;
- (void)setFocusDistance:(float)a3;
@end

@implementation PTRenderEffectInput

- (float)focusDistance
{
  return self->focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->focusDistance = a3;
}

@end