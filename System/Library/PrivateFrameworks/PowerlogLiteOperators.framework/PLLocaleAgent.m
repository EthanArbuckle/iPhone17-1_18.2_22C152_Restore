@interface PLLocaleAgent
+ (id)accountingGroupDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (PLLocaleAgent)init;
- (PLNSNotificationOperatorComposition)timeNotification;
- (void)initOperatorDependancies;
- (void)logEventForwardTimeZone;
- (void)logEventForwardTimeZoneWithTrigger:(id)a3;
- (void)logTimeZoneEntry:(id)a3;
- (void)setTimeNotification:(id)a3;
@end

@implementation PLLocaleAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLLocaleAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v25 = @"TimeZone";
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v21 = *MEMORY[0x1E4F92CD0];
  v22 = &unk_1F29F0610;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"LocaleId";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v20[0] = v16;
  v19[1] = @"CountryCode";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v20[1] = v14;
  v19[2] = @"TimeZoneName";
  v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_StringFormat");
  v20[2] = v2;
  v19[3] = @"TimeZoneIsInDST";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v20[3] = v4;
  v19[4] = @"SecondsFromGMT";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v20[4] = v6;
  v19[5] = @"Trigger";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v20[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLLocaleAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLocaleAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_logEventForwardTimeZoneWithTrigger_ name:*MEMORY[0x1E4F1C4F8] object:0];
}

- (void)logEventForwardTimeZone
{
}

- (void)logTimeZoneEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 dictionary];
  v6 = [v4 entryDate];
  [(PLOperator *)self logForSubsystem:@"LocaleMetrics" category:@"TimeZone" data:v5 date:v6];

  v7 = [v4 dictionary];
  v8 = [v4 entryDate];
  [(PLOperator *)self logForSubsystem:@"PPTStorageOperator" category:@"Locale" data:v7 date:v8];

  id v10 = [v4 dictionary];
  v9 = [v4 entryDate];

  [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"Locale" data:v10 date:v9];
}

- (void)logEventForwardTimeZoneWithTrigger:(id)a3
{
  id v15 = a3;
  [MEMORY[0x1E4F1CAF0] resetSystemTimeZone];
  [MEMORY[0x1E4F92A98] resetTimestampFormaterTimezone];
  id v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"TimeZone"];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  v8 = (void *)CFPreferencesCopyValue(@"AppleLocale", @"Apple Global Domain", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  [v7 setObject:v8 forKeyedSubscript:@"LocaleId"];

  [v7 setObject:@"Unavailable" forKeyedSubscript:@"CountryCode"];
  if ([MEMORY[0x1E4F929C0] liteMode])
  {
    v9 = [v5 localeIdentifier];
    [v7 setObject:v9 forKeyedSubscript:@"LocaleId"];

    id v10 = [v5 objectForKey:*MEMORY[0x1E4F1C400]];
    [v7 setObject:v10 forKeyedSubscript:@"CountryCode"];
  }
  v11 = [v4 name];
  [v7 setObject:v11 forKeyedSubscript:@"TimeZoneName"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isDaylightSavingTime"));
  [v7 setObject:v12 forKeyedSubscript:@"TimeZoneIsInDST"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "secondsFromGMT"));
  [v7 setObject:v13 forKeyedSubscript:@"SecondsFromGMT"];

  if (v15)
  {
    v14 = [v15 name];
    [v7 setObject:v14 forKeyedSubscript:@"Trigger"];
  }
  else
  {
    [v7 setObject:@"powerlog" forKeyedSubscript:@"Trigger"];
  }
  [(PLOperator *)self logEntry:v7];
  [(PLLocaleAgent *)self logTimeZoneEntry:v7];
}

- (PLNSNotificationOperatorComposition)timeNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimeNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end