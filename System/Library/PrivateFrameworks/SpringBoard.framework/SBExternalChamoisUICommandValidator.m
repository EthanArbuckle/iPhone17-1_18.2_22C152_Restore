@interface SBExternalChamoisUICommandValidator
- (BOOL)validateCommand:(id)a3;
@end

@implementation SBExternalChamoisUICommandValidator

- (BOOL)validateCommand:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 action];
  if (v4 == sel__handleMoveToOtherDisplayKeyShortcut_)
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 localizedStringForKey:@"MOVE_TO_IPAD_DISCOVERABILITY" value:&stru_1F3084718 table:@"SpringBoard"];
    [v3 setDiscoverabilityTitle:v6];
  }
  return v4 == sel__handleMoveToOtherDisplayKeyShortcut_;
}

@end