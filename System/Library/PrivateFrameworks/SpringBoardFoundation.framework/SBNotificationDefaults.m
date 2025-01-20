@interface SBNotificationDefaults
+ (id)standardDefaults;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBNotificationDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1) {
    dispatch_once(&standardDefaults___once, &__block_literal_global_39);
  }
  v2 = (void *)standardDefaults___instance;
  return v2;
}

uint64_t __42__SBNotificationDefaults_standardDefaults__block_invoke()
{
  v0 = objc_alloc_init(SBNotificationDefaults);
  uint64_t v1 = standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"displayIDsWithBadgingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDisplayIDsWithBadgingEnabled" toDefaultValue:0 options:12];

  v4 = [NSString stringWithUTF8String:"legacyAlarmList"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"AlarmList" toDefaultValue:0 options:1];

  v5 = [NSString stringWithUTF8String:"shouldTestBannerPlayTextTone"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBTestBannerPlaysTextTone" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"dontSuppressForPrivacyWhenUnlocked"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBBulletinDontSuppressForPrivacyWhenUnlocked" toDefaultValue:v6 options:1];

  v8 = [NSString stringWithUTF8String:"alwaysAllowDefaultAction"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBAlwaysAllowDefaultAction" toDefaultValue:v6 options:1];

  v9 = [NSString stringWithUTF8String:"alwaysAllowLongLookGesture"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBAlwaysAllowLongLookGesture" toDefaultValue:v6 options:1];

  id v10 = [NSString stringWithUTF8String:"alwaysSpeakNotifications"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"NCAlwaysSpeakNotifications" toDefaultValue:v6 options:1];
}

@end