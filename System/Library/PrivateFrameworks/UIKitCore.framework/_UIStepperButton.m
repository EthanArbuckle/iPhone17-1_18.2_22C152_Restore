@interface _UIStepperButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (BOOL)isLeft;
- (id)_systemDefaultFocusGroupIdentifier;
- (void)setLeft:(BOOL)a3;
@end

@implementation _UIStepperButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (id)_systemDefaultFocusGroupIdentifier
{
  v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStepperButton;
    v5 = [(UIControl *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (BOOL)isLeft
{
  return self->_left;
}

- (void)setLeft:(BOOL)a3
{
  self->_left = a3;
}

@end