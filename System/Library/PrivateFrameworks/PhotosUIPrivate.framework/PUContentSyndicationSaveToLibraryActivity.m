@interface PUContentSyndicationSaveToLibraryActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PXActivityItemSourceController)itemSourceController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)performActivity;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUContentSyndicationSaveToLibraryActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (void)performActivity
{
  v3 = [MEMORY[0x1E4F90090] sharedInstance];
  int v4 = [v3 preventActualSaveToLibraryBehavior];

  if (v4)
  {
    [(UIActivity *)self activityDidFinish:0];
  }
  else
  {
    v5 = [(PUContentSyndicationSaveToLibraryActivity *)self itemSourceController];
    v6 = [v5 assets];
    v7 = PXFilter();
    v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_2;
    v13[3] = &unk_1E5F2ED10;
    id v14 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_3;
    v10[3] = &unk_1E5F2D4B8;
    id v11 = v14;
    v12 = self;
    id v9 = v14;
    [v8 performChanges:v13 completionHandler:v10];
  }
}

void __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = (id)objc_msgSend(MEMORY[0x1E4F38F28], "creationRequestForAssetFromGuestAsset:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_4;
  block[3] = &unk_1E5F2DCD0;
  char v8 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke_4(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v19 = a1;
    id obj = *(id *)(a1 + 32);
    uint64_t v1 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v16 = 0;
      uint64_t v18 = *(void *)v21;
      uint64_t v3 = *MEMORY[0x1E4F90B98];
      uint64_t v4 = *MEMORY[0x1E4F56560];
      uint64_t v5 = *MEMORY[0x1E4F56558];
LABEL_4:
      uint64_t v6 = 0;
      uint64_t v7 = 9;
      if (v16 > 9) {
        uint64_t v7 = v16;
      }
      uint64_t v8 = v16 - v7;
      while (1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v6);
        long long v10 = (void *)MEMORY[0x1E4F56658];
        v24[0] = v4;
        id v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        v24[1] = v5;
        v25[0] = v12;
        v25[1] = v9;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
        [v10 sendEvent:v3 withPayload:v13];

        if (!(v8 + v6)) {
          break;
        }
        if (v2 == ++v6)
        {
          v16 += v6;
          uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v2) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    a1 = v19;
    BOOL v14 = *(unsigned char *)(v19 + 48) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:", v14, v16);
}

uint64_t __60__PUContentSyndicationSaveToLibraryActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

- (id)activityViewController
{
  uint64_t v3 = [MEMORY[0x1E4F90090] sharedInstance];
  int v4 = [v3 preventActualSaveToLibraryBehavior];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Save to Library Prevented" message:@"Saving to Library is currently disabled via our internal settings (for debugging)." preferredStyle:1];
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __67__PUContentSyndicationSaveToLibraryActivity_activityViewController__block_invoke;
    uint64_t v12 = &unk_1E5F2DCA8;
    objc_copyWeak(&v13, &location);
    uint64_t v7 = [v6 actionWithTitle:@"OK" style:0 handler:&v9];
    objc_msgSend(v5, "addAction:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

void __67__PUContentSyndicationSaveToLibraryActivity_activityViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activityDidFinish:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v3 = [(PUContentSyndicationSaveToLibraryActivity *)self itemSourceController];
  BOOL v4 = [v3 unsavedSyndicatedAssetCount] != 0;

  return v4;
}

- (id)_systemImageName
{
  return @"square.and.arrow.down";
}

- (id)activityTitle
{
  uint64_t v2 = [(PUContentSyndicationSaveToLibraryActivity *)self itemSourceController];
  uint64_t v3 = [v2 assets];
  if ([v3 count] == 1)
  {
    BOOL v4 = [v3 firstObject];
    uint64_t v5 = [v4 mediaType];

    uint64_t v6 = @"ITEM";
    if (v5 == 1) {
      uint64_t v6 = @"PHOTO";
    }
    if (v5 == 2) {
      uint64_t v6 = @"VIDEO";
    }
    uint64_t v7 = v6;
    uint64_t v8 = [@"SYNDICATION_SAVE_TO_LIBRARY_ACTIVITY_TITLE_" stringByAppendingString:v7];
    uint64_t v9 = PULocalizedString(v8);
  }
  else
  {
    PXFilter();
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXMediaTypeForAssets();
    [(__CFString *)v7 count];
    uint64_t v8 = PXLocalizationKeyForMediaType();
    uint64_t v10 = PXLocalizedString();
    uint64_t v9 = PULocalizedStringWithValidatedFormat(v10, @"%lu");
  }
  return v9;
}

uint64_t __58__PUContentSyndicationSaveToLibraryActivity_activityTitle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90B20];
}

@end