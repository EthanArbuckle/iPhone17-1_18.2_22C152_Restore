@interface WFMediaPickerParameterSummaryEditor
- (UIViewController)presentedViewController;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)setPresentedViewController:(id)a3;
@end

@implementation WFMediaPickerParameterSummaryEditor

- (void).cxx_destruct
{
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == 1) {
    return 2;
  }
  else {
    return -1;
  }
}

- (void)mediaPickerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__WFMediaPickerParameterSummaryEditor_mediaPickerDidCancel___block_invoke;
  v3[3] = &unk_264BFDBA0;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __60__WFMediaPickerParameterSummaryEditor_mediaPickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeEditing];
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickMediaItems___block_invoke;
  v8[3] = &unk_264BFD500;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

void __69__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickMediaItems___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) itemsQuery];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = long long v27 = 0u;
  v1 = [v20 filterPredicates];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = *(void *)v25;
    uint64_t v6 = *MEMORY[0x263F11478];
    uint64_t v23 = *MEMORY[0x263F11218];
    uint64_t v21 = *MEMORY[0x263F87290];
    uint64_t v22 = *MEMORY[0x263F872A0];
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v1);
        }
        id v8 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = [v8 property];
            int v10 = [v9 isEqualToString:v6];

            if (v10)
            {
              id v11 = objc_alloc(MEMORY[0x263F86CE0]);
              v12 = [v8 value];
              v13 = v11;
              uint64_t v14 = v22;
            }
            else
            {
              v15 = [v8 property];
              int v16 = [v15 isEqualToString:v23];

              if (!v16) {
                goto LABEL_16;
              }
              id v17 = objc_alloc(MEMORY[0x263F86CE0]);
              v12 = [v8 value];
              v13 = v17;
              uint64_t v14 = v21;
            }
            uint64_t v18 = [v13 initWithMediaType:v14 persistentID:v12];

            v4 = (void *)v18;
          }
          else
          {
            v12 = v8;
            id v8 = 0;
          }
        }
        else
        {
          v12 = 0;
        }

LABEL_16:
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v3) {
        goto LABEL_20;
      }
    }
  }
  v4 = 0;
LABEL_20:

  [*(id *)(a1 + 40) commitState:v4];
  [*(id *)(a1 + 40) completeEditing];
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickPlaybackArchive___block_invoke;
  v8[3] = &unk_264BFD500;
  id v9 = v6;
  int v10 = self;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

void __74__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickPlaybackArchive___block_invoke(uint64_t a1)
{
  id v7 = (id)[*(id *)(a1 + 32) copyWithOptions:8];
  uint64_t v2 = [v7 displayProperties];
  uint64_t v3 = [v2 title];

  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F86CD8]) initWithMediaItemName:v3 playbackArchiveData:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F86CE0]) initWithValue:v5];
  [*(id *)(a1 + 40) commitState:v6];
  [*(id *)(a1 + 40) completeEditing];
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__WFMediaPickerParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke;
  v7[3] = &unk_264BFDA98;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFMediaPickerParameterSummaryEditor;
  id v5 = v4;
  [(WFModuleSummaryEditor *)&v6 cancelEditingWithCompletionHandler:v7];
}

void __74__WFMediaPickerParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedViewController];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) presentedViewController];
    [v4 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F11E48];
  id v6 = a4;
  id obj = (id)[[v5 alloc] initWithSupportedTypeIdentifiers:&unk_26E7C17E0 selectionMode:4];
  [obj setShowsCloudItems:1];
  [obj setShowsItemsWithProtectedAssets:1];
  [obj setShowsCatalogContent:1];
  [obj setAllowsPickingMultipleItems:0];
  [obj setDelegate:self];
  [obj setModalPresentationStyle:7];
  id v7 = [obj popoverPresentationController];
  [v7 setDelegate:self];

  id v8 = [v6 sourceView];
  id v9 = [obj popoverPresentationController];
  [v9 setSourceView:v8];

  [v6 sourceRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [obj popoverPresentationController];
  objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  v19 = [v6 sourceViewController];

  [v19 presentViewController:obj animated:1 completion:0];
  objc_storeWeak((id *)&self->_presentedViewController, obj);
}

@end