@interface PXRadarConfiguration
- (BOOL)attachmentsIncludeAnyUserAsset;
- (BOOL)isProgressUIAllowed;
- (BOOL)wantsPhotosDiagnostics;
- (BOOL)wantsSystemDiagnostics;
- (NSArray)keywordIDs;
- (NSMutableArray)attachments;
- (NSMutableArray)diagnosticContainers;
- (NSMutableArray)diagnosticProviders;
- (NSMutableArray)legacyTapToRadars;
- (NSMutableArray)screenshots;
- (NSString)description;
- (NSString)title;
- (PXRadarConfiguration)init;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)classification;
- (int64_t)component;
- (void)addAttachment:(id)a3;
- (void)addDiagnosticProvider:(id)a3;
- (void)addLegacyTapToRadar:(id)a3;
- (void)addScreenshot:(id)a3;
- (void)collectDiagnosticsWithCompletionHandler:(id)a3;
- (void)setAttachmentsIncludeAnyUserAsset:(BOOL)a3;
- (void)setClassification:(int64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setComponent:(int64_t)a3;
- (void)setDescription:(id)a3;
- (void)setIsProgressUIAllowed:(BOOL)a3;
- (void)setKeywordIDs:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWantsPhotosDiagnostics:(BOOL)a3;
- (void)setWantsSystemDiagnostics:(BOOL)a3;
@end

@implementation PXRadarConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticContainers, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_legacyTapToRadars, 0);
  objc_storeStrong((id *)&self->_diagnosticProviders, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (NSMutableArray)diagnosticContainers
{
  return self->_diagnosticContainers;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (NSMutableArray)screenshots
{
  return self->_screenshots;
}

- (NSMutableArray)legacyTapToRadars
{
  return self->_legacyTapToRadars;
}

- (NSMutableArray)diagnosticProviders
{
  return self->_diagnosticProviders;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setIsProgressUIAllowed:(BOOL)a3
{
  self->_isProgressUIAllowed = a3;
}

- (BOOL)isProgressUIAllowed
{
  return self->_isProgressUIAllowed;
}

- (void)setWantsPhotosDiagnostics:(BOOL)a3
{
  self->_wantsPhotosDiagnostics = a3;
}

- (BOOL)wantsPhotosDiagnostics
{
  return self->_wantsPhotosDiagnostics;
}

- (void)setWantsSystemDiagnostics:(BOOL)a3
{
  self->_wantsSystemDiagnostics = a3;
}

- (BOOL)wantsSystemDiagnostics
{
  return self->_wantsSystemDiagnostics;
}

- (void)setAttachmentsIncludeAnyUserAsset:(BOOL)a3
{
  self->_attachmentsIncludeAnyUserAsset = a3;
}

- (BOOL)attachmentsIncludeAnyUserAsset
{
  return self->_attachmentsIncludeAnyUserAsset;
}

- (void)setKeywordIDs:(id)a3
{
}

- (NSArray)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setComponent:(int64_t)a3
{
  self->_component = a3;
}

- (int64_t)component
{
  return self->_component;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setDescription:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXRadarConfiguration *)self title];
  [v4 setTitle:v5];

  objc_msgSend(v4, "setComponent:", -[PXRadarConfiguration component](self, "component"));
  objc_msgSend(v4, "setClassification:", -[PXRadarConfiguration classification](self, "classification"));
  v6 = [(PXRadarConfiguration *)self description];
  [v4 setDescription:v6];

  v7 = [(PXRadarConfiguration *)self keywordIDs];
  [v4 setKeywordIDs:v7];

  objc_msgSend(v4, "setAttachmentsIncludeAnyUserAsset:", -[PXRadarConfiguration attachmentsIncludeAnyUserAsset](self, "attachmentsIncludeAnyUserAsset"));
  objc_msgSend(v4, "setWantsSystemDiagnostics:", -[PXRadarConfiguration wantsSystemDiagnostics](self, "wantsSystemDiagnostics"));
  objc_msgSend(v4, "setWantsPhotosDiagnostics:", -[PXRadarConfiguration wantsPhotosDiagnostics](self, "wantsPhotosDiagnostics"));
  objc_msgSend(v4, "setIsProgressUIAllowed:", -[PXRadarConfiguration isProgressUIAllowed](self, "isProgressUIAllowed"));
  v8 = [(PXRadarConfiguration *)self completionHandler];
  [v4 setCompletionHandler:v8];

  v9 = [v4 diagnosticProviders];
  v10 = [(PXRadarConfiguration *)self diagnosticProviders];
  [v9 setArray:v10];

  v11 = [v4 screenshots];
  v12 = [(PXRadarConfiguration *)self screenshots];
  [v11 setArray:v12];

  v13 = [v4 attachments];
  v14 = [(PXRadarConfiguration *)self attachments];
  [v13 setArray:v14];

  v15 = [v4 diagnosticContainers];
  v16 = [(PXRadarConfiguration *)self diagnosticContainers];
  [v15 setArray:v16];

  return v4;
}

- (void)collectDiagnosticsWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXRadarConfiguration *)self diagnosticContainers];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [(PXRadarConfiguration *)self legacyTapToRadars];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) diagnosticDictionary];
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v12 = +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:v6 descriptionName:@"UI-Diagnostics"];
    if (v12)
    {
      v13 = [[PXTapToRadarConcreteDiagnosticContainer alloc] initWithName:@"Legacy"];
      [(PXTapToRadarConcreteDiagnosticContainer *)v13 addAttachment:v12];
      [v5 addObject:v13];
    }
  }
  v14 = [(PXRadarConfiguration *)self diagnosticProviders];
  v15 = (void *)[v14 mutableCopy];

  v16 = [(PXRadarConfiguration *)self diagnosticProviders];
  [v16 removeAllObjects];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__47322;
  v20[4] = __Block_byref_object_dispose__47323;
  v20[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5DB3898;
  aBlock[5] = v20;
  id v17 = v5;
  aBlock[4] = v17;
  v18 = _Block_copy(aBlock);
  v15;
  v18;
  v17;
  v4;
  PXIterateAsynchronously();
}

id __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    v3 = [[PXTapToRadarConcreteDiagnosticContainer alloc] initWithName:@"Errors"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

void __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(a1[4], "px_popFirst");
  if (v4)
  {
    id v5 = [NSString alloc];
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)[v5 initWithFormat:@"%@-%p", v7, v4];

    uint64_t v9 = [[PXTapToRadarConcreteDiagnosticContainer alloc] initWithName:v8];
    [v4 collectTapToRadarDiagnosticsIntoContainer:v9];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E5DB38C0;
    id v16 = a1[6];
    id v12 = a1[4];
    v10 = v9;
    v13 = v10;
    id v14 = a1[5];
    id v15 = v3;
    [(PXTapToRadarConcreteDiagnosticContainer *)v10 finalizeWithCompletionHandler:v11];
  }
  else
  {
    [v3 stop];
  }
}

uint64_t __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = *(void (**)(uint64_t))(v4 + 16);
    id v6 = a3;
    v7 = v5(v4);
    uint64_t v8 = [NSString stringWithFormat:@"diagnostic collection failed with error %@", v6];

    [v7 addAttachmentWithText:v8 name:@"DiagnosticCollectionError"];
  }
  uint64_t v9 = *(void **)(a1 + 32);
  v10 = [*(id *)(a1 + 40) subproviders];
  objc_msgSend(v9, "px_insertObjects:atIndex:", v10, 0);

  [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  v11 = *(void **)(a1 + 56);
  return [v11 next];
}

- (void)addAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRadarConfiguration *)self attachments];
  [v5 addObject:v4];
}

- (void)addScreenshot:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRadarConfiguration *)self screenshots];
  [v5 addObject:v4];
}

- (void)addLegacyTapToRadar:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRadarConfiguration *)self legacyTapToRadars];
  [v5 addObject:v4];
}

- (void)addDiagnosticProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRadarConfiguration *)self diagnosticProviders];
  [v5 addObject:v4];
}

- (PXRadarConfiguration)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXRadarConfiguration;
  v2 = [(PXRadarConfiguration *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_attachmentsIncludeAnyUserAsset = 16777473;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    diagnosticProviders = v3->_diagnosticProviders;
    v3->_diagnosticProviders = v4;

    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    legacyTapToRadars = v3->_legacyTapToRadars;
    v3->_legacyTapToRadars = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    screenshots = v3->_screenshots;
    v3->_screenshots = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    attachments = v3->_attachments;
    v3->_attachments = v10;

    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    diagnosticContainers = v3->_diagnosticContainers;
    v3->_diagnosticContainers = v12;
  }
  return v3;
}

@end