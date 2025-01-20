@interface ICASFullscreenDrawingToInlineDrawingEvent
+ (AASessionGroup)sessionGroup;
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)eventName;
+ (int64_t)timeDurationGranularity;
+ (int64_t)timestampGranularity;
- (NSDictionary)eventProperties;
@end

@implementation ICASFullscreenDrawingToInlineDrawingEvent

+ (NSString)eventName
{
  return (NSString *)@"FullscreenDrawingToInlineDrawingEvent";
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
  v16[11] = *MEMORY[0x1E4F143B8];
  v15[0] = @"noteData";
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[0] = v14;
  v15[1] = @"noteAccessData";
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[1] = v13;
  v15[2] = @"accountData";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[2] = v2;
  v15[3] = @"drawingData";
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[3] = v3;
  v15[4] = @"startDrawingStrokeData";
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[4] = v4;
  v15[5] = @"endDrawingStrokeData";
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:1];
  v16[5] = v5;
  v15[6] = @"orientationData";
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[6] = v6;
  v15[7] = @"privateUserData";
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[7] = v7;
  v15[8] = @"privateEventData";
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[8] = v8;
  v15[9] = @"drawingConversionData";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[9] = v9;
  v15[10] = @"eventData";
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v16[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:11];

  return (NSDictionary *)v11;
}

@end