@interface UIPrinterPickerWindow
- (BOOL)_canAffectStatusBarAppearance;
- (id)_roleHint;
@end

@implementation UIPrinterPickerWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (id)_roleHint
{
  return (id)*MEMORY[0x1E4FB3350];
}

@end