@interface E5MLModuleSELFLoggingUtils
+ (id)_buildMetadataWithNlId:(id)a3;
+ (id)_buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5;
+ (id)_generateRandomUUID;
+ (id)logMilCompilationStarted;
+ (id)logMilCompilationStartedWithMetadata:(id)a3;
+ (void)emitEvent:(id)a3;
+ (void)emitEventMilAssetAcquisition:(id)a3 milAssetAcquisitionContextBuilder:(id)a4;
+ (void)emitEventMilAssetAcquisitionWithMetadata:(id)a3 milAssetAcquisitionContextBuilder:(id)a4;
+ (void)logMilCompilationEnded:(id)a3 acquisitionType:(int)a4;
+ (void)logMilCompilationEndedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5;
+ (void)logMilCompilationFailed:(id)a3 acquisitionType:(int)a4 errorCode:(int)a5 errorMessage:(id)a6;
+ (void)logMilCompilationFailedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5 errorCode:(int)a6 errorMessage:(id)a7;
@end

@implementation E5MLModuleSELFLoggingUtils

+ (void)emitEventMilAssetAcquisitionWithMetadata:(id)a3 milAssetAcquisitionContextBuilder:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4FA0C30];
  v8 = (void (**)(id, id))a4;
  id v9 = objc_alloc_init(v7);
  v8[2](v8, v9);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisitionWithMetadata_milAssetAcquisitionContextBuilder___block_invoke;
  v12[3] = &unk_1E65808A0;
  id v13 = v6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v6;
  [a1 emitEvent:v12];
}

void __105__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisitionWithMetadata_milAssetAcquisitionContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEventMetadata:v3];
  [v4 setMilAssetAcquisitionContext:*(void *)(a1 + 40)];
}

+ (void)emitEventMilAssetAcquisition:(id)a3 milAssetAcquisitionContextBuilder:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FA0C30];
  v7 = (void (**)(id, id))a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [a1 _buildMetadataWithNlId:v8];

  v7[2](v7, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisition_milAssetAcquisitionContextBuilder___block_invoke;
  v13[3] = &unk_1E65808A0;
  id v14 = v10;
  id v15 = v9;
  id v11 = v9;
  id v12 = v10;
  [a1 emitEvent:v13];
}

void __93__E5MLModuleSELFLoggingUtils_emitEventMilAssetAcquisition_milAssetAcquisitionContextBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEventMetadata:v3];
  [v4 setMilAssetAcquisitionContext:*(void *)(a1 + 40)];
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

+ (id)_buildMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4FA0C68];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setNlId:v10];

  if (v7) {
    [v11 setTrpId:v7];
  }
  if (v8) {
    [v11 setResultCandidateId:v8];
  }
  [v11 setComponentInvocationSource:0];

  return v11;
}

+ (id)_buildMetadataWithNlId:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FA0C68];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNlId:v4];

  return v5;
}

+ (id)_generateRandomUUID
{
  v2 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", 0, 0);
  [v2 getUUIDBytes:&v5];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v2];

  return v3;
}

+ (void)logMilCompilationFailed:(id)a3 acquisitionType:(int)a4 errorCode:(int)a5 errorMessage:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = (objc_class *)MEMORY[0x1E4FA0C40];
  id v12 = a6;
  id v13 = objc_alloc_init(v11);
  [v13 setAcquisitionType:v8];
  [v13 setErrorCode:v7];
  [v13 setErrorMessage:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__E5MLModuleSELFLoggingUtils_logMilCompilationFailed_acquisitionType_errorCode_errorMessage___block_invoke;
  v16[3] = &unk_1E6580808;
  id v17 = v13;
  id v18 = v10;
  id v14 = v10;
  id v15 = v13;
  [a1 emitEventMilAssetAcquisition:v14 milAssetAcquisitionContextBuilder:v16];
}

void __93__E5MLModuleSELFLoggingUtils_logMilCompilationFailed_acquisitionType_errorCode_errorMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFailed:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

+ (void)logMilCompilationEnded:(id)a3 acquisitionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0C38]);
  [v7 setAcquisitionType:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__E5MLModuleSELFLoggingUtils_logMilCompilationEnded_acquisitionType___block_invoke;
  v10[3] = &unk_1E6580808;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [a1 emitEventMilAssetAcquisition:v8 milAssetAcquisitionContextBuilder:v10];
}

void __69__E5MLModuleSELFLoggingUtils_logMilCompilationEnded_acquisitionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEnded:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

+ (id)logMilCompilationStarted
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0C48]);
  [v3 setModel:1];
  id v4 = [a1 _generateRandomUUID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__E5MLModuleSELFLoggingUtils_logMilCompilationStarted__block_invoke;
  v10[3] = &unk_1E6580808;
  id v11 = v3;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  [a1 emitEventMilAssetAcquisition:v5 milAssetAcquisitionContextBuilder:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __54__E5MLModuleSELFLoggingUtils_logMilCompilationStarted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStartedOrChanged:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

+ (void)logMilCompilationFailedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5 errorCode:(int)a6 errorMessage:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = (objc_class *)MEMORY[0x1E4FA0C40];
  id v14 = a7;
  id v15 = a3;
  id v16 = objc_alloc_init(v13);
  [v16 setAcquisitionType:v9];
  [v16 setErrorCode:v8];
  [v16 setErrorMessage:v14];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __115__E5MLModuleSELFLoggingUtils_logMilCompilationFailedWithMetadata_contextId_acquisitionType_errorCode_errorMessage___block_invoke;
  v19[3] = &unk_1E6580808;
  id v20 = v16;
  id v21 = v12;
  id v17 = v12;
  id v18 = v16;
  [a1 emitEventMilAssetAcquisitionWithMetadata:v15 milAssetAcquisitionContextBuilder:v19];
}

void __115__E5MLModuleSELFLoggingUtils_logMilCompilationFailedWithMetadata_contextId_acquisitionType_errorCode_errorMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFailed:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

+ (void)logMilCompilationEndedWithMetadata:(id)a3 contextId:(id)a4 acquisitionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4FA0C38];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setAcquisitionType:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__E5MLModuleSELFLoggingUtils_logMilCompilationEndedWithMetadata_contextId_acquisitionType___block_invoke;
  v14[3] = &unk_1E6580808;
  id v15 = v11;
  id v16 = v8;
  id v12 = v8;
  id v13 = v11;
  [a1 emitEventMilAssetAcquisitionWithMetadata:v10 milAssetAcquisitionContextBuilder:v14];
}

void __91__E5MLModuleSELFLoggingUtils_logMilCompilationEndedWithMetadata_contextId_acquisitionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setEnded:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

+ (id)logMilCompilationStartedWithMetadata:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA0C48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setModel:1];
  id v7 = [a1 _generateRandomUUID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__E5MLModuleSELFLoggingUtils_logMilCompilationStartedWithMetadata___block_invoke;
  v13[3] = &unk_1E6580808;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [a1 emitEventMilAssetAcquisitionWithMetadata:v5 milAssetAcquisitionContextBuilder:v13];

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __67__E5MLModuleSELFLoggingUtils_logMilCompilationStartedWithMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStartedOrChanged:v3];
  [v4 setContextId:*(void *)(a1 + 40)];
}

@end