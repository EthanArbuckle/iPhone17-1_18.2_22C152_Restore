@interface PSRestrictionsPINController
+ (BOOL)settingEnabled;
- (BOOL)isNumericPIN;
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)simplePIN;
- (BOOL)validatePIN:(id)a3;
- (PSRestrictionsPINController)init;
- (__CFString)blockTimeIntervalKey;
- (__CFString)blockedStateKey;
- (__CFString)defaultsID;
- (__CFString)failedAttemptsKey;
- (id)pinInstructionsPrompt;
- (id)pinInstructionsPromptFont;
- (id)stringsBundle;
- (id)title;
- (int)pinLength;
- (void)setPIN:(id)a3;
@end

@implementation PSRestrictionsPINController

+ (BOOL)settingEnabled
{
  return [MEMORY[0x1E4F9AA00] settingEnabled];
}

- (PSRestrictionsPINController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSRestrictionsPINController;
  v2 = [(DevicePINController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(PSSpecifier);
    [(PSSpecifier *)v3 setEditPaneClass:objc_opt_class()];
    [(DevicePINController *)v2 setSpecifier:v3];
  }
  return v2;
}

- (id)pinInstructionsPrompt
{
  v3 = [(PSViewController *)self specifier];
  v4 = [v3 propertyForKey:@"screenTimePinEntry"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [(PSRestrictionsPINController *)self stringsBundle];
    v7 = [(DevicePINController *)self stringsTable];
    v8 = [v6 localizedStringForKey:@"PMENTER_SC_PROMPT" value:&stru_1EFB51FD0 table:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSRestrictionsPINController;
    v8 = [(DevicePINController *)&v10 pinInstructionsPrompt];
  }
  return v8;
}

- (id)title
{
  v3 = [(PSViewController *)self specifier];
  v4 = [v3 propertyForKey:@"screenTimePinEntry"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [(PSRestrictionsPINController *)self stringsBundle];
    v7 = [(DevicePINController *)self stringsTable];
    v8 = [v6 localizedStringForKey:@"PMENTER_SC" value:&stru_1EFB51FD0 table:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSRestrictionsPINController;
    v8 = [(DevicePINController *)&v10 title];
  }
  return v8;
}

- (int)pinLength
{
  return 4;
}

- (BOOL)validatePIN:(id)a3
{
  return [MEMORY[0x1E4F9AA00] validatePIN:a3];
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (void)setPIN:(id)a3
{
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 1;
}

- (id)pinInstructionsPromptFont
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v2 pointSize];
  double v4 = v3;

  int v5 = (void *)MEMORY[0x1E4F42A30];
  return (id)[v5 boldSystemFontOfSize:v4];
}

- (__CFString)defaultsID
{
  return @"com.apple.springboard";
}

- (__CFString)failedAttemptsKey
{
  return @"SBParentalControlsFailedAttempts";
}

- (__CFString)blockTimeIntervalKey
{
  return @"SBParentalControlsBlockTimeIntervalSinceReferenceDate";
}

- (__CFString)blockedStateKey
{
  return @"SBParentalControlsBlocked";
}

- (BOOL)simplePIN
{
  return 1;
}

- (BOOL)isNumericPIN
{
  return 1;
}

@end