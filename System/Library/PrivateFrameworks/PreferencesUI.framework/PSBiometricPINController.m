@interface PSBiometricPINController
- (BOOL)_asyncSetPinCompatible;
- (BOOL)showSimplePINCancelButtonOnLeft;
- (id)stringsBundle;
- (void)setPane:(id)a3;
@end

@implementation PSBiometricPINController

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return +[PSUIBiometricController shouldPresentInModalSheet];
}

- (void)setPane:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSBiometricPINController;
  [(DevicePINController *)&v6 setPane:a3];
  if (![(DevicePINController *)self mode])
  {
    v4 = [(PSBiometricPINController *)self navigationItem];
    v5 = PSLocalizableMesaStringForKey();
    [v4 setTitle:v5];
  }
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (BOOL)_asyncSetPinCompatible
{
  return 1;
}

@end