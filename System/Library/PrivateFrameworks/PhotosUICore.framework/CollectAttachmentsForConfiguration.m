@interface CollectAttachmentsForConfiguration
@end

@implementation CollectAttachmentsForConfiguration

uint64_t ___CollectAttachmentsForConfiguration_block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) diagnosticContainers];
    objc_claimAutoreleasedReturnValue();
    PXFlatMap();
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

id ___CollectAttachmentsForConfiguration_block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [v2 attachments];
  [v3 addObjectsFromArray:v4];

  v5 = [v2 dictionary];
  if ([v5 count])
  {
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [v2 name];
    v8 = +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:v6 descriptionName:v7];

    if (v8) {
      [v3 addObject:v8];
    }
  }
  return v3;
}

@end