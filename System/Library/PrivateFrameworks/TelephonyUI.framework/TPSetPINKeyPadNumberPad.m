@interface TPSetPINKeyPadNumberPad
- (Class)numberPadButtonClass;
@end

@implementation TPSetPINKeyPadNumberPad

- (Class)numberPadButtonClass
{
  return (Class)objc_opt_class();
}

@end