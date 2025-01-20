@interface PUMailActivity
+ (BOOL)allowedToModifyEmailAccounts;
+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3;
+ (BOOL)canPerformActivityWithTotalCount:(unint64_t)a3 assetMediaTypeCount:(PXAssetMediaTypeCount *)a4;
+ (BOOL)isMailDropEnabled;
+ (id)_expirationStringForMomentShare:(id)a3;
+ (id)_momentShareLinkActivityItemsForURL:(id)a3 momentShare:(id)a4;
+ (id)_momentShareLinkPrompt;
+ (id)_momentShareLinkSubjectForMomentShare:(id)a3;
+ (id)_momentShareLinkTitleForMomentShare:(id)a3;
+ (void)openEmailAccountPrefs;
- (BOOL)_canPerformForIndividualAssetsWithActivityItems:(id)a3;
- (BOOL)_canPerformWithLink;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_isMailDropEnabled;
- (BOOL)_momentShareLinkDidFail;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_remakerWasCancelled;
- (BOOL)_showTrimViewControllerIfNeededForVideoAsset:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)transcodedVideoFilePath;
- (PUMailActivity)init;
- (PXActivityItemSourceController)itemSourceController;
- (id)activityViewController;
- (id)mailComposeViewController;
- (void)_cleanupRemaker;
- (void)_composeMailForVideo:(id)a3 trimmedFilePath:(id)a4;
- (void)_prepareWithMomentShareLink:(id)a3;
- (void)_pu_cleanup;
- (void)_remakeAndSendVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5;
- (void)_removeTempVideoRemakerFile;
- (void)_setRemakerWasCancelled:(BOOL)a3;
- (void)_showTrimViewControllerForVideo:(id)a3 maximumTrimDuration:(double)a4 trimButtonTitle:(id)a5;
- (void)_transcodeAndSendVideo:(id)a3;
- (void)activityDidFinish:(BOOL)a3;
- (void)cancelRemaking;
- (void)dealloc;
- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4;
- (void)editVideoViewControllerDidCancel:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)remakeVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (void)setItemSourceController:(id)a3;
- (void)setTranscodedVideoFilePath:(id)a3;
- (void)videoRemakerDidBeginRemaking:(id)a3;
- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4;
@end

@implementation PUMailActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSourceController, 0);
  objc_destroyWeak((id *)&self->_shouldTranscodeSingleVideo);
  objc_storeStrong(&self->_remakerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoRemaker, 0);
  objc_storeStrong((id *)&self->_remakerProgressView, 0);
  objc_storeStrong((id *)&self->_editVideoViewController, 0);
  objc_storeStrong((id *)&self->_mailComposeController, 0);
  objc_storeStrong((id *)&self->_videoAssetBeingTrimmed, 0);
  objc_storeStrong((id *)&self->_referenceViewController, 0);
  objc_storeStrong((id *)&self->super._mailComposeViewController, 0);
}

- (void)setTranscodedVideoFilePath:(id)a3
{
}

- (NSString)transcodedVideoFilePath
{
  return (NSString *)self->_itemSourceController;
}

- (void)_setRemakerWasCancelled:(BOOL)a3
{
  BYTE5(self->_strongSelf) = a3;
}

- (BOOL)_remakerWasCancelled
{
  return BYTE5(self->_strongSelf);
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shouldTranscodeSingleVideo);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)editVideoViewControllerDidCancel:(id)a3
{
  mailComposeViewController = self->super._mailComposeViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PUMailActivity_editVideoViewControllerDidCancel___block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [(MFMailComposeViewController *)mailComposeViewController dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __51__PUMailActivity_editVideoViewControllerDidCancel___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 208);
  *(void *)(v2 + 208) = 0;

  v4 = *(void **)(a1 + 32);
  return [v4 activityDidFinish:0];
}

- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  mailComposeViewController = self->super._mailComposeViewController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PUMailActivity_editVideoViewController_didTrimVideoWithOptions___block_invoke;
  v13[3] = &unk_1E5F2ED10;
  v13[4] = self;
  id v6 = a4;
  [(MFMailComposeViewController *)mailComposeViewController dismissViewControllerAnimated:1 completion:v13];
  v7 = [v6 objectForKey:*MEMORY[0x1E4FB3268]];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v6 objectForKey:*MEMORY[0x1E4FB3260]];

  [v10 doubleValue];
  double v12 = v11;

  [(PUMailActivity *)self _remakeAndSendVideoAsset:self->_referenceViewController withTrimStartTime:v9 endTime:v12];
}

void __66__PUMailActivity_editVideoViewController_didTrimVideoWithOptions___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 208);
  *(void *)(v2 + 208) = 0;
}

- (void)activityDidFinish:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  [(UIActivity *)&v4 activityDidFinish:a3];
  [(PUMailActivity *)self _pu_cleanup];
}

- (void)performActivity
{
  if ([(PUMailActivity *)self _momentShareLinkDidFail])
  {
    v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "Share Sheet: Immediately failing Mail activity for missing Moment Share URL", buf, 2u);
    }

    [(PUMailActivity *)self activityDidFinish:0];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PUMailActivity;
    [(UIActivity *)&v4 performActivity];
  }
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (BYTE4(self->_strongSelf))
  {
    BOOL v6 = 1;
    [(PHAsset *)self->_videoAssetBeingTrimmed dismissViewControllerAnimated:1 completion:a5];
    BYTE4(self->_strongSelf) = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUMailActivity;
    return [(UIMailActivity *)&v8 _dismissActivityFromViewController:a3 animated:a4 completion:a5];
  }
  return v6;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v11 = a5;
  if (LOBYTE(self->_strongSelf))
  {
    if ([getMFMailComposeViewControllerClass() canSendMail])
    {
      objc_storeStrong((id *)&self->super._mailComposeViewController, a3);
      double v12 = PLSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet: Mail Activity: Trimming and/or re-transcode single video to an acceptable attachment size...", v21, 2u);
      }

      v13 = [(PUMailActivity *)self itemSourceController];
      v14 = [v13 assets];
      if ([v14 count] == 1)
      {
        v15 = [v14 lastObject];
        if ([v15 isVideo])
        {
          v16 = [v14 lastObject];
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      v18 = objc_msgSend(v16, "pl_managedAsset");
      if (!v18)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"PUMailActivity.m" lineNumber:685 description:@"expect single video"];
      }
      [(PUMailActivity *)self _transcodeAndSendVideo:v16];

      BOOL v17 = 1;
    }
    else
    {
      +[PUMailActivity openEmailAccountPrefs];
      BOOL v17 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PUMailActivity;
    BOOL v17 = [(UIMailActivity *)&v22 _presentActivityOnViewController:v10 animated:v6 completion:v11];
  }

  return v17;
}

- (id)mailComposeViewController
{
  if ([(PUMailActivity *)self _momentShareLinkDidFail] || LOBYTE(self->_strongSelf))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUMailActivity;
    v3 = [(UIMailActivity *)&v5 mailComposeViewController];
  }
  return v3;
}

- (id)activityViewController
{
  if ([(PUMailActivity *)self _momentShareLinkDidFail])
  {
    v3 = 0;
  }
  else if (LOBYTE(self->_strongSelf))
  {
    v3 = self->_videoAssetBeingTrimmed;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUMailActivity;
    v3 = [(UIMailActivity *)&v5 activityViewController];
  }
  return v3;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(PUMailActivity *)self itemSourceController];
  BOOL v6 = [v5 publishedURL];

  if (v6)
  {
    v7 = [v5 publishedURL];
    [(PUMailActivity *)self _prepareWithMomentShareLink:v7];

LABEL_3:
    objc_super v8 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v9 = [(PUMailActivity *)self itemSourceController];
    id v10 = [v9 assetItemSources];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v21 + 1) + 8 * v14) asset];
          v16 = [v15 uuid];
          [v8 addObject:v16];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    BOOL v17 = [(PUMailActivity *)self mailComposeViewController];
    [v17 setPhotoIDs:v8];

    goto LABEL_11;
  }
  if (!LOBYTE(self->_strongSelf))
  {
    v25.receiver = self;
    v25.super_class = (Class)PUMailActivity;
    [(UIMailActivity *)&v25 prepareWithActivityItems:v4];
    goto LABEL_3;
  }
  if (([getMFMailComposeViewControllerClass() canSendMail] & 1) == 0)
  {
    +[PUMailActivity openEmailAccountPrefs];
    goto LABEL_11;
  }
  v18 = (PHAsset *)objc_alloc_init((Class)getMFMailComposeViewControllerClass());
  if (v18)
  {
    v19 = v18;
    [(PHAsset *)v18 setMailComposeDelegate:self];
    [(PHAsset *)self->_videoAssetBeingTrimmed setMailComposeDelegate:0];
    videoAssetBeingTrimmed = self->_videoAssetBeingTrimmed;
    self->_videoAssetBeingTrimmed = v19;

    goto LABEL_3;
  }
LABEL_11:
}

- (void)_prepareWithMomentShareLink:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    BOOL v6 = [v5 librarySpecificFetchOptions];

    id v17 = 0;
    v7 = [MEMORY[0x1E4F391B0] fetchLocalMomentShareFromShareURL:v4 error:&v17 options:v6];
    id v8 = v17;
    if (!v7)
    {
      double v9 = PLSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_msgSend(v4, "pl_redactedShareURL");
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Share Sheet: Mail activity failed to fetch moment share for URL: %{public}@ with error: %@", buf, 0x16u);
      }
    }
    uint64_t v11 = [(id)objc_opt_class() _momentShareLinkActivityItemsForURL:v4 momentShare:v7];
    v16.receiver = self;
    v16.super_class = (Class)PUMailActivity;
    [(UIMailActivity *)&v16 prepareWithActivityItems:v11];
    uint64_t v12 = [(id)objc_opt_class() _momentShareLinkSubjectForMomentShare:v7];
    uint64_t v13 = [(PUMailActivity *)self mailComposeViewController];
    [v13 setSubject:v12];
  }
  else
  {
    uint64_t v14 = PLSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Share Sheet: No Moment Share URL to prepare for Mail activity", buf, 2u);
    }

    v15.receiver = self;
    v15.super_class = (Class)PUMailActivity;
    [(UIMailActivity *)&v15 prepareWithActivityItems:MEMORY[0x1E4F1CBF0]];
  }
}

- (BOOL)_canPerformForIndividualAssetsWithActivityItems:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PUMailActivity;
  unsigned int v4 = [(UIMailActivity *)&v22 canPerformWithActivityItems:a3];
  if (v4)
  {
    BOOL v5 = [(PUMailActivity *)self _isMailDropEnabled];
    BOOL v6 = [(PUMailActivity *)self itemSourceController];
    if (v5)
    {
      BOOL v7 = 0;
      LOBYTE(v8) = 1;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v6 = [(PUMailActivity *)self itemSourceController];
  }
  double v9 = [v6 assets];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    *(_OWORD *)buf = 0u;
    long long v18 = 0u;
    if (v6) {
      [v6 requestAssetsMediaTypeCount];
    }
    uint64_t v11 = objc_opt_class();
    v15[2] = v19;
    v15[3] = v20;
    uint64_t v16 = v21;
    v15[0] = *(_OWORD *)buf;
    v15[1] = v18;
    BOOL v7 = 0;
    int v8 = v4 & [v11 canPerformActivityWithTotalCount:v10 assetMediaTypeCount:v15];
    if (*(void *)&buf[8] == 1 && v10 == 1) {
      BOOL v7 = (void)v18 == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
    LOBYTE(v8) = 0;
  }
LABEL_12:
  if ([v6 shouldShareAsUnmodifiedOriginals])
  {
    LOBYTE(self->_strongSelf) = 0;
  }
  else
  {
    BOOL v12 = [v6 preferredExportFormat] != 1 && v7;
    LOBYTE(self->_strongSelf) = v12;
    if (v12)
    {
      uint64_t v13 = PLSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "Share Sheet: Mail Activity: Single video being shared to Mail without Mail Drop; will attempt to re-transcode "
          "to an acceptable attachment size when sharing",
          buf,
          2u);
      }
    }
  }

  return v8;
}

- (BOOL)_canPerformWithLink
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() _momentShareLinkPrompt];
  v7[0] = v3;
  unsigned int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v6.receiver = self;
  v6.super_class = (Class)PUMailActivity;
  LOBYTE(self) = [(UIMailActivity *)&v6 canPerformWithActivityItems:v4];

  return (char)self;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUMailActivity *)self itemSourceController];
  if ([v5 preferredPreparationType] == 1)
  {
    char v6 = [(PUMailActivity *)self _canPerformWithLink];
  }
  else
  {
    char v6 = [(PUMailActivity *)self _canPerformForIndividualAssetsWithActivityItems:v4];
    BOOL v7 = [v5 assets];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      double v9 = [MEMORY[0x1E4F90068] sharedInstance];
      uint64_t v10 = [v9 cmmShareSheetBehavior];

      uint64_t v11 = [v5 assets];
      BOOL v12 = [v11 firstObject];
      uint64_t v13 = [v12 photoLibrary];

      if (v13)
      {
        char v14 = PXCMMHasSendAndReceiveCapabilities();
        if (v10 == 3) {
          char v15 = v14;
        }
        else {
          char v15 = 0;
        }
        v6 |= v15;
      }
      else
      {
        uint64_t v16 = PLSharingGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138412290;
          long long v19 = v5;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Mail Activity: Photo library was nil, so returning unable to determine if CMM is enabled. Item source controller: %@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }

  return v6;
}

- (BOOL)_momentShareLinkDidFail
{
  uint64_t v2 = [(PUMailActivity *)self itemSourceController];
  if ([v2 momentSharePublishAttempted])
  {
    v3 = [v2 publishedURL];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_composeMailForVideo:(id)a3 trimmedFilePath:(id)a4
{
  id v6 = a4;
  BOOL v7 = self->_videoAssetBeingTrimmed;
  id v8 = a3;
  [(PHAsset *)v7 setMailComposeDelegate:self];
  double v9 = objc_msgSend(v8, "pl_managedAsset");

  uint64_t v10 = [v9 pathForVideoFile];
  uint64_t v11 = [v10 lastPathComponent];
  BOOL v12 = v11;
  if (v6)
  {
    uint64_t v13 = [v11 stringByDeletingPathExtension];

    char v14 = [v6 pathExtension];
    BOOL v12 = [v13 stringByAppendingPathExtension:v14];

    uint64_t v10 = v6;
  }
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v10 options:1 error:0];
  uint64_t v16 = (void *)MEMORY[0x1E4F442D8];
  id v17 = [v10 pathExtension];
  int v18 = [v16 typeWithFilenameExtension:v17];

  long long v19 = [v18 preferredMIMEType];
  [(PHAsset *)v7 addAttachmentData:v15 mimeType:v19 fileName:v12];

  if (BYTE3(self->_strongSelf))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__PUMailActivity__composeMailForVideo_trimmedFilePath___block_invoke;
    v20[3] = &unk_1E5F2E1C0;
    v20[4] = self;
    uint64_t v21 = v7;
    [(PHAsset *)v21 _presentComposeInNewWindowWithCompletion:v20];
  }
  else
  {
    [(MFMailComposeViewController *)self->super._mailComposeViewController presentViewController:v7 animated:1 completion:0];
  }
}

uint64_t __55__PUMailActivity__composeMailForVideo_trimmedFilePath___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to present mail compose in new window. Presenting modally instead.", v4, 2u);
    }

    result = [*(id *)(*(void *)(v2 + 32) + 184) presentViewController:*(void *)(v2 + 40) animated:1 completion:0];
    *(unsigned char *)(*(void *)(v2 + 32) + 252) = 1;
  }
  return result;
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  id v5 = a4;
  if (-[PUMailActivity _remakerWasCancelled](self, "_remakerWasCancelled") || ![v5 length])
  {

    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __59__PUMailActivity_videoRemakerDidEndRemaking_temporaryPath___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __59__PUMailActivity_videoRemakerDidEndRemaking_temporaryPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PUPhotoSharingManager sharedInstance];
  [v2 setRemaking:0];

  [*(id *)(a1 + 32) setTranscodedVideoFilePath:*(void *)(a1 + 40)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[29];
  if (v4)
  {
    (*(void (**)(void, void))(v4 + 16))(v3[29], *(void *)(a1 + 40));
    v3 = *(void **)(a1 + 32);
  }
  [v3 _cleanupRemaker];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = 0;
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PUMailActivity_videoRemakerDidBeginRemaking___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__PUMailActivity_videoRemakerDidBeginRemaking___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), *(id *)(a1 + 32));
  id v1 = +[PUPhotoSharingManager sharedInstance];
  [v1 setRemaking:1];
}

- (void)_removeTempVideoRemakerFile
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(PUMailActivity *)self transcodedVideoFilePath];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [(PUMailActivity *)self transcodedVideoFilePath];
    BOOL v7 = [v5 fileURLWithPath:v6];

    if (v7)
    {
      id v8 = PLShareSheetGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        char v15 = v7;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[PUMailActivity] Removing temporary video remake file at URL: %{public}@", buf, 0xCu);
      }

      [(PUMailActivity *)self setTranscodedVideoFilePath:0];
      double v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v13 = 0;
      char v10 = [v9 removeItemAtURL:v7 error:&v13];
      id v11 = v13;

      if ((v10 & 1) == 0)
      {
        BOOL v12 = PLShareSheetGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          char v15 = v7;
          __int16 v16 = 2114;
          id v17 = v11;
          _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "[PUMailActivity] Failed to clean up temporary video remake file at URL (%{public}@): %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_cleanupRemaker
{
  videoRemaker = self->_videoRemaker;
  self->_videoRemaker = 0;

  remakerProgressView = self->_remakerProgressView;
  self->_remakerProgressView = 0;
}

- (void)remakeVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__PUMailActivity_remakeVideoAsset_withTrimStartTime_endTime_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E5F275F8;
  v18[4] = self;
  id v19 = v12;
  double v22 = a4;
  double v23 = a5;
  id v20 = v14;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __95__PUMailActivity_remakeVideoAsset_withTrimStartTime_endTime_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupRemaker];
  [*(id *)(a1 + 32) _setRemakerWasCancelled:0];
  [*(id *)(a1 + 32) _removeTempVideoRemakerFile];
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 232);
  *(void *)(v3 + 232) = v2;

  objc_msgSend(*(id *)(a1 + 40), "pl_managedAsset");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8A600]) initWithManagedAsset:v10 applyVideoAdjustments:1];
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setDelegate:");
  if (*(double *)(a1 + 64) > 0.0 || *(double *)(a1 + 72) > 0.0)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setTrimStartTime:");
    [*(id *)(*(void *)(a1 + 32) + 224) setTrimEndTime:*(double *)(a1 + 72)];
  }
  id v8 = [*(id *)(a1 + 40) descriptionProperties];
  double v9 = [v8 accessibilityDescription];

  [*(id *)(*(void *)(a1 + 32) + 224) setCustomAccessibilityLabel:v9];
  [*(id *)(*(void *)(a1 + 32) + 224) setMode:2];
  [*(id *)(*(void *)(a1 + 32) + 224) setProgressHandler:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 224) setShouldExportToPhotoDataDirectory:1];
  [*(id *)(*(void *)(a1 + 32) + 224) remake];
}

- (void)_transcodeAndSendVideo:(id)a3
{
  id v4 = a3;
  if (!-[PUMailActivity _showTrimViewControllerIfNeededForVideoAsset:](self, "_showTrimViewControllerIfNeededForVideoAsset:"))[(PUMailActivity *)self _remakeAndSendVideoAsset:v4 withTrimStartTime:0.0 endTime:0.0]; {
}
  }

- (void)cancelRemaking
{
  if (self->_remakerProgressView)
  {
    [(PUMailActivity *)self _setRemakerWasCancelled:1];
    remakerProgressView = self->_remakerProgressView;
    [(PLProgressView *)remakerProgressView cancel];
  }
}

- (void)_remakeAndSendVideoAsset:(id)a3 withTrimStartTime:(double)a4 endTime:(double)a5
{
  id v8 = a3;
  [(PLUIEditVideoViewController *)self->_editVideoViewController removeFromSuperview];
  double v9 = (PLUIEditVideoViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E0]), "initWithFrame:", 0.0, 0.0, 0.0, 45.0);
  editVideoViewController = self->_editVideoViewController;
  self->_editVideoViewController = v9;

  id v11 = [(PUMailActivity *)self itemSourceController];
  id v12 = [v11 activityViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 mailActivity:self displayVideoRemakerProgressView:self->_editVideoViewController];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke;
  v16[3] = &unk_1E5F2D8C0;
  v16[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke_2;
  v14[3] = &unk_1E5F2A1F8;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [(PUMailActivity *)self remakeVideoAsset:v13 withTrimStartTime:v16 endTime:v14 progressHandler:a4 completionHandler:a5];
}

uint64_t __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return [*(id *)(*(void *)(a1 + 32) + 216) setPercentComplete:a2];
}

void __69__PUMailActivity__remakeAndSendVideoAsset_withTrimStartTime_endTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(*(void *)(a1 + 32) + 216) removeFromSuperview];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 216);
  *(void *)(v3 + 216) = 0;

  uint64_t v5 = *(void **)(a1 + 32);
  if (v6) {
    [v5 _composeMailForVideo:*(void *)(a1 + 40) trimmedFilePath:v6];
  }
  else {
    [v5 activityDidFinish:0];
  }
}

- (BOOL)_showTrimViewControllerIfNeededForVideoAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "pl_managedAsset");
  [MEMORY[0x1E4F8ABF0] durationForManagedAsset:v5 applyVideoAdjustments:1];
  double v7 = v6;
  [MEMORY[0x1E4F8A600] maximumDurationForTrimMode:2];
  double v9 = v8;
  if (v7 > v8)
  {
    id v10 = PLLocalizedFrameworkString();
    [(PUMailActivity *)self _showTrimViewControllerForVideo:v4 maximumTrimDuration:v10 trimButtonTitle:v9];
  }
  return v7 > v9;
}

- (void)_showTrimViewControllerForVideo:(id)a3 maximumTrimDuration:(double)a4 trimButtonTitle:(id)a5
{
  double v8 = (UIViewController *)a3;
  mailComposeController = self->_mailComposeController;
  id v10 = a5;
  [(MFMailComposeViewController *)mailComposeController setDelegate:0];
  referenceViewController = self->_referenceViewController;
  self->_referenceViewController = v8;
  id v12 = v8;

  id v20 = [(UIViewController *)v12 pl_managedAsset];
  id v13 = (MFMailComposeViewController *)[objc_alloc(MEMORY[0x1E4F8A5F8]) initWithPhoto:v20 trimTitle:v10];

  [(MFMailComposeViewController *)v13 setDelegate:self];
  id v14 = (void *)MEMORY[0x1E4F1C9E8];
  id v15 = [NSNumber numberWithDouble:a4];
  id v16 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E4FB2A40], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4FB3258], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4FB31E8], 0);
  [(MFMailComposeViewController *)v13 setImagePickerOptions:v16];

  id v17 = self->_mailComposeController;
  self->_mailComposeController = v13;
  uint64_t v18 = v13;

  [(MFMailComposeViewController *)self->_mailComposeController setParentInPopoverException:1];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v18];
  [(MFMailComposeViewController *)self->super._mailComposeViewController presentViewController:v19 animated:1 completion:0];
}

- (BOOL)_isMailDropEnabled
{
  uint64_t v3 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v4 = [v3 disableMailDrop];

  if (v4) {
    return 0;
  }
  if (!BYTE1(self->_strongSelf))
  {
    BYTE2(self->_strongSelf) = [(id)objc_opt_class() isMailDropEnabled];
    BYTE1(self->_strongSelf) = 1;
  }
  return BYTE2(self->_strongSelf) != 0;
}

- (void)dealloc
{
  [(PUMailActivity *)self _pu_cleanup];
  v3.receiver = self;
  v3.super_class = (Class)PUMailActivity;
  [(UIMailActivity *)&v3 dealloc];
}

- (void)_pu_cleanup
{
  mailComposeViewController = self->super._mailComposeViewController;
  self->super._mailComposeViewController = 0;

  [(PUMailActivity *)self _cleanupRemaker];
  [(PUMailActivity *)self _removeTempVideoRemakerFile];
  referenceViewController = self->_referenceViewController;
  self->_referenceViewController = 0;

  [(MFMailComposeViewController *)self->_mailComposeController setDelegate:0];
  mailComposeController = self->_mailComposeController;
  self->_mailComposeController = 0;

  [(PHAsset *)self->_videoAssetBeingTrimmed setMailComposeDelegate:0];
  videoAssetBeingTrimmed = self->_videoAssetBeingTrimmed;
  self->_videoAssetBeingTrimmed = 0;

  BYTE4(self->_strongSelf) = 0;
}

- (PUMailActivity)init
{
  v4.receiver = self;
  v4.super_class = (Class)PUMailActivity;
  uint64_t v2 = [(UIMailActivity *)&v4 init];
  if (v2) {
    BYTE3(v2->_strongSelf) = [getMFMailComposeViewControllerClass() _canSendMailInNewScene];
  }
  return v2;
}

+ (void)openEmailAccountPrefs
{
  if (![a1 allowedToModifyEmailAccounts])
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempted to access restricted account settings" userInfo:0];
    objc_exception_throw(v3);
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F907F0];
  [v2 navigateToDestination:8 completion:0];
}

+ (BOOL)allowedToModifyEmailAccounts
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v20 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __getMCProfileConnectionClass_block_invoke;
    id v15 = &unk_1E5F2E228;
    id v16 = &v17;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v12);
    uint64_t v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  objc_super v4 = [v3 sharedConnection];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v5 = (void *)getMCFeatureAccountModificationAllowedSymbolLoc_ptr;
  uint64_t v20 = getMCFeatureAccountModificationAllowedSymbolLoc_ptr;
  if (!getMCFeatureAccountModificationAllowedSymbolLoc_ptr)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __getMCFeatureAccountModificationAllowedSymbolLoc_block_invoke;
    id v15 = &unk_1E5F2E228;
    id v16 = &v17;
    double v6 = ManagedConfigurationLibrary();
    double v7 = dlsym(v6, "MCFeatureAccountModificationAllowed");
    *(void *)(v16[1] + 24) = v7;
    getMCFeatureAccountModificationAllowedSymbolLoc_ptr = *(void *)(v16[1] + 24);
    uint64_t v5 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    BOOL v8 = [v4 effectiveBoolValueForSetting:*v5] != 2;

    return v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"NSString *getMCFeatureAccountModificationAllowed(void)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PUMailActivity.m", 63, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3
{
  id v4 = a3;
  if ([a1 isMailDropEnabled])
  {
    char v5 = 1;
  }
  else
  {
    double v6 = [v4 assets];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v16 = 0;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      if (v4) {
        [v4 requestAssetsMediaTypeCount];
      }
      BOOL v8 = objc_opt_class();
      v10[2] = v14;
      v10[3] = v15;
      uint64_t v11 = v16;
      v10[0] = v12;
      v10[1] = v13;
      char v5 = [v8 canPerformActivityWithTotalCount:v7 assetMediaTypeCount:v10];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)canPerformActivityWithTotalCount:(unint64_t)a3 assetMediaTypeCount:(PXAssetMediaTypeCount *)a4
{
  unint64_t var0 = a4->var0;
  unint64_t var1 = a4->var1;
  uint64_t v7 = [MEMORY[0x1E4F906A0] sharedInstance];
  unint64_t v8 = [v7 maxMailPhotoLimit];

  if (v8) {
    BOOL v9 = var0 > v8;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v11 = !v9 && var1 < 2;
  if (var0) {
    BOOL v12 = var1 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  return v12 && var1 + var0 >= a3 && v11;
}

+ (BOOL)isMailDropEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v3 = [v2 disableMailDrop];

  if (v3) {
    return 0;
  }
  char v5 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  double v6 = [v5 cachedPrimaryAppleAccount];
  uint64_t v7 = v6;
  if (v6) {
    char v4 = [v6 isEnabledForDataclass:*MEMORY[0x1E4F17B38]];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)_momentShareLinkActivityItemsForURL:(id)a3 momentShare:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PUMailActivity.m", 157, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  BOOL v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [(id)objc_opt_class() _momentShareLinkPrompt];
  uint64_t v11 = [v10 stringByAppendingString:@"\n"];

  PXScaledValueForTextStyleWithSymbolicTraits();
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
  uint64_t v29 = *MEMORY[0x1E4FB06F8];
  v30[0] = v12;
  objc_super v25 = (void *)v12;
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v26 = (void *)v11;
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v13];
  [v9 addObject:v14];
  long long v15 = v8;
  uint64_t v16 = [(id)objc_opt_class() _momentShareLinkTitleForMomentShare:v8];
  if (v16) {
    [v9 addObject:v16];
  }
  uint64_t v27 = *MEMORY[0x1E4FB0720];
  id v28 = v7;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v19 = [v7 absoluteString];
  uint64_t v20 = (void *)[v18 initWithString:v19 attributes:v17];

  [v9 addObject:v20];
  id v21 = [(id)objc_opt_class() _expirationStringForMomentShare:v15];
  if (v21)
  {
    double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F06BE7B8];
    [v9 addObject:v22];
    [v9 addObject:v21];
  }
  return v9;
}

+ (id)_expirationStringForMomentShare:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = v3;
  if (v3 && ([v3 expiryDate], char v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    double v6 = [v4 expiryDate];
    id v7 = PXCMMStringForExpiryDate();

    PXScaledValueForTextStyleWithSymbolicTraits();
    id v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
    uint64_t v12 = *MEMORY[0x1E4FB06F8];
    v13[0] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_momentShareLinkTitleForMomentShare:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    PXCMMTitleAndSubtitleForAssetCollection();
    id v3 = 0;
    id v4 = 0;
    if ([v3 length])
    {
      if (v4)
      {
        char v5 = PXLocalizedString();
        PUStringWithValidatedFormat();
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = v3;
      }
      PXScaledValueForTextStyleWithSymbolicTraits();
      id v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "boldSystemFontOfSize:");
      uint64_t v11 = *MEMORY[0x1E4FB06F8];
      v12[0] = v8;
      BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v9];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (id)_momentShareLinkSubjectForMomentShare:(id)a3
{
  id v3 = a3;
  if (!v3 || (PXCMMTitleAndSubtitleForAssetCollection(), id v4 = 0, 0, !v4))
  {
    PXLocalizedString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_momentShareLinkPrompt
{
  return (id)PXLocalizedString();
}

@end