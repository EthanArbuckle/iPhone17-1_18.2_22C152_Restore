@interface PNCollectionToStoryDiagnosticsGeneratorWrapper
+ (void)deleteDiagnosticFilesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation PNCollectionToStoryDiagnosticsGeneratorWrapper

+ (void)deleteDiagnosticFilesWith:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__PNCollectionToStoryDiagnosticsGeneratorWrapper_deleteDiagnosticFilesWith_completionHandler___block_invoke;
  v7[3] = &unk_26544F5A0;
  id v8 = v5;
  id v6 = v5;
  +[PNCollectionToStoryDiagnosticsGenerator clearAllFilesWithPhotoLibrary:a3 completionHandler:v7];
}

uint64_t __94__PNCollectionToStoryDiagnosticsGeneratorWrapper_deleteDiagnosticFilesWith_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end