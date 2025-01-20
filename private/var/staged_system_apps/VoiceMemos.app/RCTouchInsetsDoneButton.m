@interface RCTouchInsetsDoneButton
- (int64_t)enabledState;
- (void)_commonInit;
@end

@implementation RCTouchInsetsDoneButton

- (void)_commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)RCTouchInsetsDoneButton;
  [(RCTouchInsetsButton *)&v3 _commonInit];
  self->_enabledState = 0;
}

- (int64_t)enabledState
{
  return self->_enabledState;
}

@end