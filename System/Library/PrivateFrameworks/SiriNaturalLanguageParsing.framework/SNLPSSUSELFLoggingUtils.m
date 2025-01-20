@interface SNLPSSUSELFLoggingUtils
+ (id)buildMetadataFromRequestId:(id)a3;
+ (id)buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5;
+ (id)generateRandomUUID;
+ (id)logBackgroundUpdateStarted:(int)a3;
+ (void)emitEvent:(id)a3;
+ (void)emitEventBackgroundUpdate:(id)a3 backgroundUpdateContextBuilder:(id)a4;
+ (void)emitEventUserRequest:(id)a3 userRequestContextBuilder:(id)a4;
+ (void)logBackgroundUpdateEnded:(id)a3 locale:(id)a4 appInfos:(id)a5;
+ (void)logBackgroundUpdateFailed:(id)a3;
+ (void)logUserRequestEnded:(id)a3 triggeredCacheEntryInfos:(id)a4;
+ (void)logUserRequestFailed:(id)a3;
+ (void)logUserRequestStarted:(id)a3;
@end

@implementation SNLPSSUSELFLoggingUtils

+ (void)emitEventBackgroundUpdate:(id)a3 backgroundUpdateContextBuilder:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FA0CA0];
  v7 = (void (**)(id, id))a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [a1 buildMetadataWithNlId:v8 andWithTrpId:0 andWithResultCandidateId:0];

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__SNLPSSUSELFLoggingUtils_emitEventBackgroundUpdate_backgroundUpdateContextBuilder___block_invoke;
  v13[3] = &unk_1E65808A0;
  id v14 = v10;
  id v15 = v9;
  id v11 = v9;
  id v12 = v10;
  [a1 emitEvent:v13];
}

void __84__SNLPSSUSELFLoggingUtils_emitEventBackgroundUpdate_backgroundUpdateContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEventMetadata:v3];
  [v4 setSsuBackgroundRequestContext:*(void *)(a1 + 40)];
}

+ (void)emitEventUserRequest:(id)a3 userRequestContextBuilder:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FA0CC8];
  v7 = (void (**)(id, id))a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [a1 buildMetadataFromRequestId:v8];

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SNLPSSUSELFLoggingUtils_emitEventUserRequest_userRequestContextBuilder___block_invoke;
  v13[3] = &unk_1E65808A0;
  id v14 = v10;
  id v15 = v9;
  id v11 = v9;
  id v12 = v10;
  [a1 emitEvent:v13];
}

void __74__SNLPSSUSELFLoggingUtils_emitEventUserRequest_userRequestContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEventMetadata:v3];
  [v4 setSsuUserRequestContext:*(void *)(a1 + 40)];
}

+ (void)emitEvent:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FA0C60];
  id v4 = (void (**)(id, id))a3;
  id v6 = objc_alloc_init(v3);
  v4[2](v4, v6);

  v5 = [MEMORY[0x1E4F9F9A8] sharedStream];
  [v5 emitMessage:v6];
}

+ (id)buildMetadataFromRequestId:(id)a3
{
  id v4 = [MEMORY[0x1E4FA2AF0] extractRequestLinkData:a3];
  v5 = [v4 nlId];
  id v6 = [v4 trpId];
  v7 = [v4 resultCandidateId];
  id v8 = [a1 buildMetadataWithNlId:v5 andWithTrpId:v6 andWithResultCandidateId:v7];

  return v8;
}

+ (id)buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5
{
  int v7 = 0;
  v5 = [MEMORY[0x1E4FA2AF0] createNLXClientEventMetadataWithNlId:a3 andWithTrpId:a4 andWithResultCandidateId:a5 andWithRequester:&v7];
  return v5;
}

+ (id)generateRandomUUID
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  v2 = [MEMORY[0x1E4F29128] UUID];
  [v2 getUUIDBytes:&v5];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
  [v3 setNamespaceA:0];
  [v3 setLowInt:v5];
  [v3 setHighInt:v6];

  return v3;
}

+ (void)logBackgroundUpdateFailed:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA0CB0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SNLPSSUSELFLoggingUtils_logBackgroundUpdateFailed___block_invoke;
  v8[3] = &unk_1E6580878;
  id v9 = v6;
  id v7 = v6;
  [a1 emitEventBackgroundUpdate:v5 backgroundUpdateContextBuilder:v8];
}

uint64_t __53__SNLPSSUSELFLoggingUtils_logBackgroundUpdateFailed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFailed:*(void *)(a1 + 32)];
}

+ (void)logBackgroundUpdateEnded:(id)a3 locale:(id)a4 appInfos:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4FA0CA8];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 setAppInfos:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__SNLPSSUSELFLoggingUtils_logBackgroundUpdateEnded_locale_appInfos___block_invoke;
  v12[3] = &unk_1E6580878;
  id v13 = v10;
  id v11 = v10;
  [a1 emitEventBackgroundUpdate:v9 backgroundUpdateContextBuilder:v12];
}

uint64_t __68__SNLPSSUSELFLoggingUtils_logBackgroundUpdateEnded_locale_appInfos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnded:*(void *)(a1 + 32)];
}

+ (id)logBackgroundUpdateStarted:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0CB8]);
  [v5 setBackgroundUpdateType:v3];
  id v6 = [a1 generateRandomUUID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SNLPSSUSELFLoggingUtils_logBackgroundUpdateStarted___block_invoke;
  v9[3] = &unk_1E6580878;
  id v10 = v5;
  id v7 = v5;
  [a1 emitEventBackgroundUpdate:v6 backgroundUpdateContextBuilder:v9];

  return v6;
}

uint64_t __54__SNLPSSUSELFLoggingUtils_logBackgroundUpdateStarted___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStartedOrChanged:*(void *)(a1 + 32)];
}

+ (void)logUserRequestFailed:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA0CD8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SNLPSSUSELFLoggingUtils_logUserRequestFailed___block_invoke;
  v8[3] = &unk_1E6580850;
  id v9 = v6;
  id v7 = v6;
  [a1 emitEventUserRequest:v5 userRequestContextBuilder:v8];
}

uint64_t __48__SNLPSSUSELFLoggingUtils_logUserRequestFailed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFailed:*(void *)(a1 + 32)];
}

+ (void)logUserRequestEnded:(id)a3 triggeredCacheEntryInfos:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FA0CD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setTriggeredCacheEntryInfos:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SNLPSSUSELFLoggingUtils_logUserRequestEnded_triggeredCacheEntryInfos___block_invoke;
  v11[3] = &unk_1E6580850;
  id v12 = v9;
  id v10 = v9;
  [a1 emitEventUserRequest:v8 userRequestContextBuilder:v11];
}

uint64_t __72__SNLPSSUSELFLoggingUtils_logUserRequestEnded_triggeredCacheEntryInfos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnded:*(void *)(a1 + 32)];
}

+ (void)logUserRequestStarted:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA0CE8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setExists:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SNLPSSUSELFLoggingUtils_logUserRequestStarted___block_invoke;
  v8[3] = &unk_1E6580850;
  id v9 = v6;
  id v7 = v6;
  [a1 emitEventUserRequest:v5 userRequestContextBuilder:v8];
}

uint64_t __49__SNLPSSUSELFLoggingUtils_logUserRequestStarted___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStartedOrChanged:*(void *)(a1 + 32)];
}

@end