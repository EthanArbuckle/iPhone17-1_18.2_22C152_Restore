@interface ICASNotesToPagesEvent
+ (AASessionGroup)sessionGroup;
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)eventName;
+ (int64_t)timeDurationGranularity;
+ (int64_t)timestampGranularity;
- (NSDictionary)eventProperties;
@end

@implementation ICASNotesToPagesEvent

+ (NSString)eventName
{
  return (NSString *)@"NotesToPagesEvent";
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
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"privateUserData";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v9[0] = v2;
  v8[1] = @"privateEventData";
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v9[1] = v3;
  v8[2] = @"notesToPagesContextPathData";
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v9[2] = v4;
  v8[3] = @"eventData";
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return (NSDictionary *)v6;
}

@end