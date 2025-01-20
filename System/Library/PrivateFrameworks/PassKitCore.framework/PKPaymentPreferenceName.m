@interface PKPaymentPreferenceName
- (BOOL)showPhoneticName;
- (void)setShowPhoneticName:(BOOL)a3;
@end

@implementation PKPaymentPreferenceName

- (BOOL)showPhoneticName
{
  return self->_showPhoneticName;
}

- (void)setShowPhoneticName:(BOOL)a3
{
  self->_showPhoneticName = a3;
}

@end