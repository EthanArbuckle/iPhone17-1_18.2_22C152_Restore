@interface STYAbcHelper
- (void)shareSeedDiagnosticsWithABC:(id)a3 tailspinFilenamePrefix:(id)a4;
@end

@implementation STYAbcHelper

- (void)shareSeedDiagnosticsWithABC:(id)a3 tailspinFilenamePrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[STYFrameworkHelper sharedHelper];
  v8 = [v7 sharedSerialQueueAtUtility];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__STYAbcHelper_shareSeedDiagnosticsWithABC_tailspinFilenamePrefix___block_invoke;
  v11[3] = &unk_1E69717D8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __67__STYAbcHelper_shareSeedDiagnosticsWithABC_tailspinFilenamePrefix___block_invoke(uint64_t a1)
{
  v22[7] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4FBA9C8];
  v2 = (void *)MEMORY[0x1E4F28ED0];
  v3 = [*(id *)(a1 + 32) scenario];
  v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "appProcessID"));
  uint64_t v5 = *MEMORY[0x1E4FBA9B0];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  v22[0] = v4;
  v22[1] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4FBA9A8];
  v21[1] = v5;
  v21[2] = v7;
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "scenarioStartTime"));
  v22[2] = v8;
  v21[3] = *MEMORY[0x1E4FBA9A0];
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "scenarioEndTime"));
  uint64_t v10 = *MEMORY[0x1E4FBA988];
  v22[3] = v9;
  v22[4] = v6;
  uint64_t v11 = *MEMORY[0x1E4FBA9B8];
  v21[4] = v10;
  v21[5] = v11;
  v21[6] = *MEMORY[0x1E4FBA9C0];
  v22[5] = *(void *)(a1 + 40);
  v22[6] = v6;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];

  id v13 = [*(id *)(a1 + 32) symptomsSignatureForReport];
  uint64_t v14 = *MEMORY[0x1E4FA8C28];
  v18 = v12;
  uint64_t v19 = v14;
  v17 = @"com.apple.DiagnosticExtensions.tailspin";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  _reportToAbc(v13, v16);
}

@end