@interface PSSpecifier(PSUIVoiceAndDataDrillDownController)
- (BOOL)isRATModeSpecifier;
@end

@implementation PSSpecifier(PSUIVoiceAndDataDrillDownController)

- (BOOL)isRATModeSpecifier
{
  v2 = [a1 identifier];
  if (v2 == @"VoLTESwitchSpecifierKey")
  {
    BOOL v4 = 0;
  }
  else
  {
    v3 = [a1 identifier];
    BOOL v4 = v3 != @"SASwitchSpecifierKey";
  }
  return v4;
}

@end