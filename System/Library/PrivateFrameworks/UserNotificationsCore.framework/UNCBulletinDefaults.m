@interface UNCBulletinDefaults
+ (id)standardDefaults;
- (UNCBulletinDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation UNCBulletinDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once[0] != -1) {
    dispatch_once(standardDefaults___once, &__block_literal_global_25);
  }
  v2 = (void *)standardDefaults___instance;

  return v2;
}

uint64_t __39__UNCBulletinDefaults_standardDefaults__block_invoke()
{
  standardDefaults___instance = objc_alloc_init(UNCBulletinDefaults);

  return MEMORY[0x270F9A758]();
}

- (UNCBulletinDefaults)init
{
  return (UNCBulletinDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.bulletinboard"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"globalContentPreviewSetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"BBContentPreviewsSetting" toDefaultValue:&unk_270CE1328 options:1];

  v4 = [NSString stringWithUTF8String:"globalAnnounceSetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"BBAnnounceSetting" toDefaultValue:&unk_270CE1328 options:1];

  v5 = [NSString stringWithUTF8String:"globalAnnounceHeadphonesSetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"BBAnnounceHeadphonesSetting" toDefaultValue:&unk_270CE1328 options:1];

  v6 = [NSString stringWithUTF8String:"globalAnnounceCarPlaySetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"BBAnnounceCarPlaySetting" toDefaultValue:&unk_270CE1328 options:1];

  v7 = [NSString stringWithUTF8String:"announceSupportedForHeadphones"];
  uint64_t v8 = MEMORY[0x263EFFA80];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"BBAnnounceSupportedForHeadPhones" toDefaultValue:MEMORY[0x263EFFA80] options:1];

  v9 = [NSString stringWithUTF8String:"announceSupportedForCarPlay"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"BBAnnounceSupportedForCarPlay" toDefaultValue:v8 options:1];

  v10 = [NSString stringWithUTF8String:"pairedVehiclesForCarPlay"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"BBPairedVehiclesForCarPlay" toDefaultValue:v8 options:1];

  v11 = [NSString stringWithUTF8String:"globalScheduledDeliverySetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"BBScheduledDeliverySetting" toDefaultValue:&unk_270CE1328 options:1];

  v12 = [NSString stringWithUTF8String:"globalScheduledDeliveryTimes"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"BBScheduledDeliveryTimes" toDefaultValue:0 options:1];

  v13 = [NSString stringWithUTF8String:"globalScheduledDeliveryShowNextSummarySetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"BBScheduledDeliveryShowNextSummary" toDefaultValue:&unk_270CE1328 options:1];

  v14 = [NSString stringWithUTF8String:"globalNotificationListDisplayStyleSetting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"BBNotificationListDisplayStyleSetting" toDefaultValue:&unk_270CE1328 options:1];

  id v15 = [NSString stringWithUTF8String:"globalSpokenNotificationSetting_deprecated"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"BBSpokenNotificationSetting" toDefaultValue:&unk_270CE1328 options:1];
}

@end