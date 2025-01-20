@interface ICASPdfWorkflowEngagementSummaryEvent
+ (AASessionGroup)sessionGroup;
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)eventName;
+ (int64_t)timeDurationGranularity;
+ (int64_t)timestampGranularity;
- (NSDictionary)eventProperties;
@end

@implementation ICASPdfWorkflowEngagementSummaryEvent

+ (NSString)eventName
{
  return (NSString *)@"PdfWorkflowEngagementSummaryEvent";
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
  v15[10] = *MEMORY[0x1E4F143B8];
  v14[0] = @"privateUserData";
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[0] = v13;
  v14[1] = @"privateEventData";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[1] = v2;
  v14[2] = @"noteData";
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[2] = v3;
  v14[3] = @"noteContentData";
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[3] = v4;
  v14[4] = @"pdfAttachmentData";
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[4] = v5;
  v14[5] = @"pdfStateData";
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[5] = v6;
  v14[6] = @"pdfPageData";
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[6] = v7;
  v14[7] = @"pdfNavIxData";
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[7] = v8;
  v14[8] = @"pdfCollabIxData";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[8] = v9;
  v14[9] = @"eventData";
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4ABC8]) initWithDataType:objc_opt_class() requirement:0];
  v15[9] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];

  return (NSDictionary *)v11;
}

@end