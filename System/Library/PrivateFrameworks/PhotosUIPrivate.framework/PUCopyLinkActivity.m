@interface PUCopyLinkActivity
+ (BOOL)wantsMomentShareLinkForAssetCount:(int64_t)a3;
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUCopyLinkActivity

+ (int64_t)activityCategory
{
  return 0;
}

+ (BOOL)wantsMomentShareLinkForAssetCount:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary", a3);
  char v4 = PXCMMHasSendAndReceiveCapabilities();

  return v4;
}

- (void)performActivity
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(PXActivity *)self itemSourceController];
  char v4 = [v3 publishedURL];

  v5 = PLSharingGetLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v4, "pl_redactedShareURL");
      int v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Copy Link: Got moment share URL: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    PXCopyURL();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Copy Link: Missing URL to copy", (uint8_t *)&v8, 2u);
    }
  }
  [(UIActivity *)self activityDidFinish:v4 != 0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXActivity *)self itemSourceController];
  if (([v5 shouldExcludeLivenessInAllItemSources] & 1) != 0
    || ([v5 shouldExcludeCaptionInAllItemSources] & 1) != 0)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [v5 shouldExcludeAccessibilityDescriptionInAllItemSources] ^ 1;
  }
  v7 = [v5 assets];
  int v8 = [v7 firstObject];
  v9 = [v8 photoLibrary];

  if (v9)
  {
    int v10 = PXCMMHasSendAndReceiveCapabilities();
    LOBYTE(v11) = 0;
    if ([v4 count] && v10)
    {
      v12 = [(PXActivity *)self itemSourceController];
      int v11 = [v12 itemSourcesSupportMomentShareLinkCreation] & v6;
    }
  }
  else
  {
    v13 = PLSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Copy Link: Photo library was nil, so returning NO for canPerform. Item source controller: %@", (uint8_t *)&v15, 0xCu);
    }

    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)_systemImageName
{
  return @"link.icloud";
}

- (id)activityTitle
{
  return PULocalizedString(@"SHARING_COPY_LINK_ACTIVITY_TITLE");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90988];
}

@end