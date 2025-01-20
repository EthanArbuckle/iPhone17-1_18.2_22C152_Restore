@interface SBAlertControllerVisualStyle
- (SBAlertControllerVisualStyle)init;
- (int64_t)permittedActionLayoutDirection;
- (void)setPermittedActionLayoutDirection:(int64_t)a3;
@end

@implementation SBAlertControllerVisualStyle

- (SBAlertControllerVisualStyle)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBAlertControllerVisualStyle;
  v2 = [(UIAlertControllerVisualStyle *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)SBAlertControllerVisualStyle;
    v2->_permittedActionLayoutDirection = [(UIAlertControllerVisualStyleAlert *)&v5 permittedActionLayoutDirection];
  }
  return v3;
}

- (int64_t)permittedActionLayoutDirection
{
  return self->_permittedActionLayoutDirection;
}

- (void)setPermittedActionLayoutDirection:(int64_t)a3
{
  self->_permittedActionLayoutDirection = a3;
}

@end