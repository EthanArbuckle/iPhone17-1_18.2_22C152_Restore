@interface ICASPaletteEngagementEvent
+ (AASessionGroup)sessionGroup;
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)eventName;
+ (int64_t)timeDurationGranularity;
+ (int64_t)timestampGranularity;
- (NSDictionary)eventProperties;
@end

@implementation ICASPaletteEngagementEvent

+ (NSString)eventName
{
  return (NSString *)@"PaletteEngagementEvent";
}

+ (AASessionGroup)sessionGroup
{
  return (AASessionGroup *)[MEMORY[0x1E4F4ABE8] default];
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 1;
}

+ (int64_t)timestampGranularity
{
  v2 = [MEMORY[0x1E4F4ABF8] shared];
  int64_t v3 = [v2 initWithName:@"jitter"];

  return v3;
}

+ (int64_t)timeDurationGranularity
{
  return 0;
}

- (NSDictionary)eventProperties
{
  v14[9] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4ABC8]), "initWithDataType:requirement:", objc_opt_class(), 0, @"noteData");
  v14[0] = v2;
  v13[1] = @"noteAccessData";
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[1] = v3;
  v13[2] = @"accountData";
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[2] = v4;
  v13[3] = @"paletteEngagementData";
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[3] = v5;
  v13[4] = @"palettePositionData";
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[4] = v6;
  v13[5] = @"orientationData";
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[5] = v7;
  v13[6] = @"privateUserData";
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[6] = v8;
  v13[7] = @"privateEventData";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[7] = v9;
  v13[8] = @"eventData";
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v14[8] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:9];

  return (NSDictionary *)v11;
}

@end