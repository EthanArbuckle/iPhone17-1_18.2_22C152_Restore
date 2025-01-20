@interface SBUIPasscodeLockViewFactory
+ (id)_defaultPasscodeBiometricResource;
+ (id)_passcodeLockViewForStyle:(int)a3 withLightStyle:(BOOL)a4;
+ (id)installTonightPasscodeLockViewForUsersCurrentStyle;
+ (id)lightPasscodeLockViewForStyle:(int)a3;
+ (id)lightPasscodeLockViewForUsersCurrentStyle;
+ (id)passcodeLockViewForStyle:(int)a3;
+ (id)passcodeLockViewForUsersCurrentStyle;
+ (void)_commonInitPasscodeView:(id)a3 forStyle:(int)a4;
+ (void)setPasscodeBiometricResource:(id)a3;
@end

@implementation SBUIPasscodeLockViewFactory

+ (id)passcodeLockViewForUsersCurrentStyle
{
  uint64_t v2 = SBUICurrentPasscodeStyleForUser();
  return +[SBUIPasscodeLockViewFactory passcodeLockViewForStyle:v2];
}

+ (id)passcodeLockViewForStyle:(int)a3
{
  return +[SBUIPasscodeLockViewFactory _passcodeLockViewForStyle:*(void *)&a3 withLightStyle:0];
}

+ (id)lightPasscodeLockViewForUsersCurrentStyle
{
  uint64_t v2 = SBUICurrentPasscodeStyleForUser();
  return +[SBUIPasscodeLockViewFactory lightPasscodeLockViewForStyle:v2];
}

+ (id)lightPasscodeLockViewForStyle:(int)a3
{
  return +[SBUIPasscodeLockViewFactory _passcodeLockViewForStyle:*(void *)&a3 withLightStyle:1];
}

+ (id)installTonightPasscodeLockViewForUsersCurrentStyle
{
  uint64_t v3 = SBUICurrentPasscodeStyleForUser();
  uint64_t v4 = v3;
  switch(v3)
  {
    case 2:
      v7 = SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
      break;
    case 1:
      v5 = [SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad alloc];
      uint64_t v6 = 6;
      goto LABEL_7;
    case 0:
      v5 = [SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad alloc];
      uint64_t v6 = 4;
LABEL_7:
      uint64_t v8 = [(SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad *)v5 initWithLightStyle:0 numberOfDigits:v6];
      goto LABEL_10;
    default:
      v7 = SBUIPasscodeLockViewInstallTonightWithKeyboard;
      break;
  }
  uint64_t v8 = [[v7 alloc] initWithLightStyle:0];
LABEL_10:
  v9 = (void *)v8;
  [a1 _commonInitPasscodeView:v8 forStyle:v4];
  return v9;
}

+ (id)_passcodeLockViewForStyle:(int)a3 withLightStyle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  switch(a3)
  {
    case 2:
      v10 = SBUIPasscodeLockViewLongNumericKeypad;
      break;
    case 1:
      v7 = [SBUIPasscodeLockViewSimpleFixedDigitKeypad alloc];
      BOOL v8 = v4;
      uint64_t v9 = 6;
      goto LABEL_7;
    case 0:
      v7 = [SBUIPasscodeLockViewSimpleFixedDigitKeypad alloc];
      BOOL v8 = v4;
      uint64_t v9 = 4;
LABEL_7:
      uint64_t v11 = [(SBUIPasscodeLockViewSimpleFixedDigitKeypad *)v7 initWithLightStyle:v8 numberOfDigits:v9];
      goto LABEL_10;
    default:
      v10 = SBUIPasscodeLockViewWithKeyboard;
      break;
  }
  uint64_t v11 = [[v10 alloc] initWithLightStyle:a4];
LABEL_10:
  v12 = (void *)v11;
  [a1 _commonInitPasscodeView:v11 forStyle:v5];
  return v12;
}

+ (void)_commonInitPasscodeView:(id)a3 forStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [v6 setStyle:v4];
  id v7 = [a1 _defaultPasscodeBiometricResource];
  [v6 setBiometricResource:v7];
}

+ (void)setPasscodeBiometricResource:(id)a3
{
  id v4 = a3;
  if ((id)_passcodeBiometricResource != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&_passcodeBiometricResource, a3);
    id v4 = v5;
  }
}

+ (id)_defaultPasscodeBiometricResource
{
  if (_defaultPasscodeBiometricResource___once != -1) {
    dispatch_once(&_defaultPasscodeBiometricResource___once, &__block_literal_global_14);
  }
  if (_passcodeBiometricResource) {
    uint64_t v2 = (void *)_passcodeBiometricResource;
  }
  else {
    uint64_t v2 = (void *)_defaultPasscodeBiometricResource__defaultPasscodeBiometricResource;
  }
  return v2;
}

void __64__SBUIPasscodeLockViewFactory__defaultPasscodeBiometricResource__block_invoke()
{
  v0 = [SBUIPasscodeBiometricResource alloc];
  id v3 = +[SBUIBiometricResource sharedInstance];
  uint64_t v1 = [(SBUIPasscodeBiometricResource *)v0 initWithBiometricResource:v3 overrideMatchingAssertionFactory:0];
  uint64_t v2 = (void *)_defaultPasscodeBiometricResource__defaultPasscodeBiometricResource;
  _defaultPasscodeBiometricResource__defaultPasscodeBiometricResource = v1;
}

@end