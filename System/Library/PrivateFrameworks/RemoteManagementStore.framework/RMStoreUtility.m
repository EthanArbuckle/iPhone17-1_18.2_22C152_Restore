@interface RMStoreUtility
+ (BOOL)isValidURL:(id)a3;
+ (id)_passcodeSettingsForUserEnrollmentWithDeclaration:(id)a3;
+ (id)filterForUserEnrollmentWithDeclaration:(id)a3;
@end

@implementation RMStoreUtility

+ (id)filterForUserEnrollmentWithDeclaration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[RMStoreUtility _passcodeSettingsForUserEnrollmentWithDeclaration:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_passcodeSettingsForUserEnrollmentWithDeclaration:(id)a3
{
  id v3 = (void *)MEMORY[0x263F63678];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v5 UUIDString];
  v7 = [v4 payloadMaximumInactivityInMinutes];

  v8 = &unk_2708CB400;
  if (!v7) {
    v8 = 0;
  }
  v9 = [v3 buildWithIdentifier:v6 requirePasscode:&unk_2708CB3B8 requireAlphanumericPasscode:0 requireComplexPasscode:&unk_2708CB3B8 minimumLength:&unk_2708CB3D0 minimumComplexCharacters:&unk_2708CB3E8 maximumFailedAttempts:0 failedAttemptsResetInMinutes:0 maximumGracePeriodInMinutes:0 maximumInactivityInMinutes:v8 maximumPasscodeAgeInDays:0 passcodeReuseLimit:0 changeAtNextAuth:0 customRegex:0];

  return v9;
}

+ (BOOL)isValidURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  uint64_t v5 = [v4 caseInsensitiveCompare:@"https"];

  if (!v5) {
    goto LABEL_6;
  }
  if (![MEMORY[0x263F635A0] permissiveURLSchemes]) {
    goto LABEL_5;
  }
  v6 = [v3 scheme];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"http"];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = [v3 scheme];
  uint64_t v9 = [v8 caseInsensitiveCompare:@"file"];

  if (v9) {
LABEL_5:
  }
    BOOL v10 = 0;
  else {
LABEL_6:
  }
    BOOL v10 = 1;

  return v10;
}

@end