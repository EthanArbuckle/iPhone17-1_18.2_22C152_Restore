@interface PXCuratedLibraryShowAllActionPerformer
- (PXGLayout)layout;
- (void)performActionWithCompletionHandler:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation PXCuratedLibraryShowAllActionPerformer

- (void).cxx_destruct
{
}

- (void)setLayout:(id)a3
{
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void *))a3;
  v5 = [(PXCuratedLibraryShowAllActionPerformer *)self layout];
  v6 = [v5 rootLayout];
  v7 = [v5 spriteReferenceForObjectReference:self];
  v8 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v9 = objc_msgSend(v8, "zoomLevelInDirection:fromZoomLevel:", 1, -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel"));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v7)
    {
      v11 = @"missing showAllButtonSpriteReference";
      goto LABEL_10;
    }
    if ((unint64_t)(v9 - 5) > 0xFFFFFFFFFFFFFFFBLL)
    {
      [v6 clearLastVisibleAreaAnchoringInformation];
      [v6 setLastHitSpriteReference:v7];
      v15 = [(PXCuratedLibraryActionPerformer *)self viewModel];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E5DBB100;
      id v18 = v15;
      uint64_t v19 = v9;
      id v16 = v15;
      [v16 performChanges:v17];

      v11 = 0;
      v13 = 0;
      uint64_t v14 = 1;
      if (!v4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"unexpected nextZoomLevel %li", v9);
  }
  else
  {
    uint64_t v10 = [[NSString alloc] initWithFormat:@"unexpected libraryLayout %@", v6];
  }
  if (v10) {
    v11 = (__CFString *)v10;
  }
  else {
    v11 = @"unknown reason";
  }
LABEL_10:
  v12 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%@ didn't perform because of %@", buf, 0x16u);
  }

  v13 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCuratedLibraryErrorDomain", 1, @"%@ didn't perform because of %@", self, v11);
  uint64_t v14 = 0;
  if (v4) {
LABEL_13:
  }
    v4[2](v4, v14, v13);
LABEL_14:
}

void __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  [a2 setZoomLevel:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 40) == 4)
  {
    id v3 = [*(id *)(a1 + 32) zoomablePhotosViewModel];
    [v3 performChanges:&__block_literal_global_114380];
  }
}

uint64_t __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resetColumns];
}

@end