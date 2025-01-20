@interface NCNotificationRequestRichContentProvider
+ (id)featuredImageFetchQueue;
- (BOOL)_shouldShowContent;
- (BOOL)hasAttachmentImage;
- (BOOL)hasLoadedRichAttachmentImage;
- (BOOL)isCachedAttachmentedImageFeatured;
- (BOOL)isIconVisible;
- (id)thumbnail;
- (void)fetchRichAttachmentImageIsFeatured:(BOOL)a3 withCompletion:(id)a4;
- (void)setCachedAttachmentImageFeatured:(BOOL)a3;
- (void)setIconVisible:(BOOL)a3;
@end

@implementation NCNotificationRequestRichContentProvider

+ (id)featuredImageFetchQueue
{
  if (featuredImageFetchQueue_onceToken != -1) {
    dispatch_once(&featuredImageFetchQueue_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)featuredImageFetchQueue___queue;

  return v2;
}

void __67__NCNotificationRequestRichContentProvider_featuredImageFetchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationRequestRichContentProvider", v2);
  v1 = (void *)featuredImageFetchQueue___queue;
  featuredImageFetchQueue___queue = (uint64_t)v0;
}

- (id)thumbnail
{
  cachedAttachmentImage = self->_cachedAttachmentImage;
  if (cachedAttachmentImage)
  {
    v3 = cachedAttachmentImage;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationRequestRichContentProvider;
    v3 = [(NCNotificationRequestCoalescingContentProvider *)&v5 thumbnail];
  }

  return v3;
}

- (BOOL)hasAttachmentImage
{
  v2 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  v3 = [v2 content];
  v4 = [v3 attachmentImage];

  if (v4) {
    int v5 = [v4 isSymbolImage] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)hasLoadedRichAttachmentImage
{
  return self->_cachedAttachmentImage != 0;
}

- (void)fetchRichAttachmentImageIsFeatured:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, UIImage *, uint64_t))a4;
  if ([(NCNotificationRequestRichContentProvider *)self _shouldShowContent])
  {
    if (self->_cachedAttachmentImage
      && [(NCNotificationRequestRichContentProvider *)self isCachedAttachmentedImageFeatured] == v4)
    {
      v6[2](v6, self->_cachedAttachmentImage, 1);
    }
    else
    {
      objc_initWeak(&location, self);
      if (v4) {
        double v7 = 300.0;
      }
      else {
        double v7 = 200.0;
      }
      v8 = [(id)objc_opt_class() featuredImageFetchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke;
      block[3] = &unk_1E6A91AF0;
      block[4] = self;
      v11[1] = *(id *)&v7;
      v11[2] = (id)0x4069000000000000;
      objc_copyWeak(v11, &location);
      BOOL v12 = v4;
      v10 = v6;
      dispatch_async(v8, block);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

void __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) notificationRequest];
  v3 = [v2 bulletin];
  BOOL v4 = _NCQuickLooksAttachmentImageForNotificationRequest(v3, *(double *)(a1 + 56), *(double *)(a1 + 64), 5.0);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained + 16;
  if (v4)
  {
    objc_storeStrong(v6, v4);
    [WeakRetained setCachedAttachmentImageFeatured:*(unsigned __int8 *)(a1 + 72)];
    id v7 = v4;
  }
  else if (*v6)
  {
    id v7 = *v6;
  }
  else
  {
    v8 = [WeakRetained notificationRequest];
    v9 = [v8 content];
    id v7 = [v9 attachmentImage];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke_2;
  block[3] = &unk_1E6A91AC8;
  id v10 = *(id *)(a1 + 40);
  id v13 = v7;
  id v14 = v10;
  BOOL v15 = v4 != 0;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_shouldShowContent
{
  v3 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  BOOL v4 = [v3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  if (!v5) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }

  return [(NCNotificationRequestCoalescingContentProvider *)self isDeviceAuthenticated];
}

- (BOOL)isIconVisible
{
  return self->_iconVisible;
}

- (void)setIconVisible:(BOOL)a3
{
  self->_iconVisible = a3;
}

- (BOOL)isCachedAttachmentedImageFeatured
{
  return self->_cachedAttachmentImageFeatured;
}

- (void)setCachedAttachmentImageFeatured:(BOOL)a3
{
  self->_cachedAttachmentImageFeatured = a3;
}

- (void).cxx_destruct
{
}

@end