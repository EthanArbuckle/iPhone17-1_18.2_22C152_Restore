@interface PUMessageActivity
+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PXActivityItemSourceController)itemSourceController;
- (id)activityViewController;
- (void)_prepareWithMomentShareLink:(id)a3;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUMessageActivity

- (void).cxx_destruct
{
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (void)performActivity
{
  v3 = [(PUMessageActivity *)self itemSourceController];
  if ([v3 momentSharePublishAttempted]
    && ([v3 publishedURL], v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Share Sheet: Immediately failing Message activity for missing moment share URL", buf, 2u);
    }

    [(UIActivity *)self activityDidFinish:0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUMessageActivity;
    [(UIActivity *)&v6 performActivity];
  }
}

- (id)activityViewController
{
  v3 = [(PUMessageActivity *)self itemSourceController];
  if ([v3 momentSharePublishAttempted]
    && ([v3 publishedURL], v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to get anything to share to Messages. Skipping compose presentation", buf, 2u);
    }

    v5 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUMessageActivity;
    v5 = [(UIMessageActivity *)&v8 activityViewController];
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUMessageActivity *)self itemSourceController];
  objc_super v6 = [v5 publishedURL];

  if (v6)
  {
    v7 = [v5 publishedURL];
    [(PUMessageActivity *)self _prepareWithMomentShareLink:v7];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PUMessageActivity;
    [(UIMessageActivity *)&v22 prepareWithActivityItems:v4];
  }
  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(PUMessageActivity *)self itemSourceController];
  v10 = [v9 assetItemSources];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) asset];
        v16 = [v15 uuid];
        [v8 addObject:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  v17 = [(UIMessageActivity *)self messageComposeViewController];
  [v17 setPhotoIDs:v8];
}

- (void)_prepareWithMomentShareLink:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (PLIsMobileSlideShow())
    {
      uint64_t v5 = PXMessageForMomentShareURL();
      if (v5)
      {
        objc_super v6 = (void *)v5;
        v18.receiver = self;
        v18.super_class = (Class)PUMessageActivity;
        [(UIMessageActivity *)&v18 prepareWithActivityItems:MEMORY[0x1E4F1CBF0]];
        v7 = PLSharingGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v8 = objc_msgSend(v4, "pl_redactedShareURL");
          *(_DWORD *)buf = 138543362;
          long long v21 = v8;
          _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Share Sheet: Staging Live Bubble for moment share URL: %{public}@", buf, 0xCu);
        }
        v9 = [(UIMessageActivity *)self messageComposeViewController];
        [v9 setMessage:v6];

        goto LABEL_16;
      }
      uint64_t v11 = PLSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_msgSend(v4, "pl_redactedShareURL");
        *(_DWORD *)buf = 138543362;
        long long v21 = v12;
        uint64_t v13 = "Share Sheet: Unable to create MSMessage for URL: %{public}@. Falling back to plain link";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v11 = PLSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_msgSend(v4, "pl_redactedShareURL");
        *(_DWORD *)buf = 138543362;
        long long v21 = v12;
        uint64_t v13 = "Share Sheet: Live Bubbles not supported. Sending moment share URL as text: %{public}@";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
        _os_log_impl(&dword_1AE9F8000, v14, v15, v13, buf, 0xCu);
      }
    }

    id v19 = v4;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    v17.receiver = self;
    v17.super_class = (Class)PUMessageActivity;
    [(UIMessageActivity *)&v17 prepareWithActivityItems:v6];
LABEL_16:

    goto LABEL_17;
  }
  v10 = PLSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Share Sheet: Missing URL to share via Messages", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)PUMessageActivity;
  [(UIMessageActivity *)&v16 prepareWithActivityItems:MEMORY[0x1E4F1CBF0]];
LABEL_17:
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PUMessageActivity;
  if (![(UIMessageActivity *)&v19 canPerformWithActivityItems:a3]) {
    return 0;
  }
  id v4 = [(PUMessageActivity *)self itemSourceController];
  uint64_t v5 = [v4 assets];
  objc_super v6 = [v5 firstObject];
  v7 = [v6 photoLibrary];

  if (v7)
  {
    int v8 = PXCMMHasSendAndReceiveCapabilities();
  }
  else
  {
    v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v5 count];
      *(_DWORD *)buf = 138412546;
      long long v21 = v4;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Share Sheet: PUMessageActivity had a nil photo library from itemSourceController: %@, number of assets: %lu", buf, 0x16u);
    }

    int v8 = 0;
  }
  int v12 = [v4 itemSourcesSupportMomentShareLinkCreation];
  char v13 = [v4 shouldUseMomentShareLinkInMessagesIfThresholdMet];
  if (PLCPLIsExceedingPrimarySyncQuota())
  {
    uint64_t v14 = PLSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet: User's account is exceeding CPL quota, but still showing Messages as an iCloud Link option, so we can show a proper error message if they choose it.", buf, 2u);
    }
  }
  os_log_type_t v15 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v16 = [v15 cmmShareSheetBehavior];

  if (v16 == 3) {
    char v17 = 1;
  }
  else {
    char v17 = v13;
  }
  if (v8 & v12) == 1 && (v17) {
    char v9 = 1;
  }
  else {
    char v9 = [(id)objc_opt_class() canPerformActivityAsIndividualItemsInSourceController:v4];
  }

  return v9;
}

+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assetItemSources];
  unint64_t v5 = [v4 count];

  uint64_t v6 = [v3 preferredPreparationType];
  v7 = [MEMORY[0x1E4F906A0] sharedInstance];
  unint64_t v8 = [v7 maxMessagesAssetLimit];

  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  return v9 || v5 <= v8;
}

@end