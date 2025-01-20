@interface ISTouchIDDialogButton
- (int64_t)buttonType;
- (void)setButtonType:(int64_t)a3;
@end

@implementation ISTouchIDDialogButton

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

@end