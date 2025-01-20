@interface NCDigestFeaturedNotificationContentProvider
+ (id)featuredImageFetchQueue;
- (BOOL)_shouldShowContent;
- (BOOL)hasAttachmentImage;
- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3;
- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3 groupCount:(unint64_t)a4;
- (NCNotificationListComponentDelegate)listComponentDelegate;
- (double)cachedImageSizeRatio;
- (id)defaultActionBlock;
- (id)primaryText;
- (id)thumbnail;
- (unint64_t)appNotificationCount;
- (void)fetchFeaturedAttachmentImageWithSizeRatio:(double)a3 completion:(id)a4;
- (void)setAppNotificationCount:(unint64_t)a3;
- (void)setCachedImageSizeRatio:(double)a3;
- (void)setDefaultActionBlock:(id)a3;
- (void)setListComponentDelegate:(id)a3;
@end

@implementation NCDigestFeaturedNotificationContentProvider

- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3
{
  return [(NCDigestFeaturedNotificationContentProvider *)self initWithNotificationRequest:a3 groupCount:1];
}

- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3 groupCount:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
  result = [(NCNotificationRequestCoalescingContentProvider *)&v6 initWithNotificationRequest:a3];
  if (result) {
    result->_groupCount = a4;
  }
  return result;
}

+ (id)featuredImageFetchQueue
{
  if (featuredImageFetchQueue_onceToken_0 != -1) {
    dispatch_once(&featuredImageFetchQueue_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)featuredImageFetchQueue___queue_0;

  return v2;
}

void __70__NCDigestFeaturedNotificationContentProvider_featuredImageFetchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCDigestFeaturedNotificationContentProvider", v2);
  v1 = (void *)featuredImageFetchQueue___queue_0;
  featuredImageFetchQueue___queue_0 = (uint64_t)v0;
}

- (id)primaryText
{
  v9.receiver = self;
  v9.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
  v3 = [(NCNotificationRequestCoalescingContentProvider *)&v9 primaryText];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    v7 = [v6 content];
    id v5 = [v7 defaultHeader];
  }

  return v5;
}

- (id)thumbnail
{
  cachedFeaturedAttachmentImage = self->_cachedFeaturedAttachmentImage;
  if (cachedFeaturedAttachmentImage)
  {
    v3 = cachedFeaturedAttachmentImage;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
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

- (void)fetchFeaturedAttachmentImageWithSizeRatio:(double)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, UIImage *))a4;
  if ([(NCDigestFeaturedNotificationContentProvider *)self _shouldShowContent])
  {
    if (self->_cachedFeaturedAttachmentImage
      && ([(NCDigestFeaturedNotificationContentProvider *)self cachedImageSizeRatio], v7 == a3))
    {
      v6[2](v6, self->_cachedFeaturedAttachmentImage);
    }
    else
    {
      objc_initWeak(&location, self);
      v8 = [(id)objc_opt_class() featuredImageFetchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke;
      block[3] = &unk_1E6A93270;
      v11[1] = *(id *)&a3;
      block[4] = self;
      objc_copyWeak(v11, &location);
      v10 = v6;
      dispatch_async(v8, block);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56) * 300.0;
  v3 = [*(id *)(a1 + 32) notificationRequest];
  v4 = [v3 bulletin];
  _NCQuickLooksAttachmentImageForNotificationRequest(v4, 300.0, v2, 5.0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  double v7 = WeakRetained;
  if (v5)
  {
    [WeakRetained setCachedImageSizeRatio:*(double *)(a1 + 56)];
    objc_storeStrong(v7 + 17, v5);
  }
  else
  {
    id v8 = WeakRetained[17];
    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      objc_super v9 = [WeakRetained notificationRequest];
      v10 = [v9 content];
      id v5 = [v10 attachmentImage];
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke_2;
  v13[3] = &unk_1E6A93248;
  id v11 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v11;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_shouldShowContent
{
  v3 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  v4 = [v3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  if (!v5) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }

  return [(NCNotificationRequestCoalescingContentProvider *)self isDeviceAuthenticated];
}

- (id)defaultActionBlock
{
  return self->_defaultActionBlock;
}

- (void)setDefaultActionBlock:(id)a3
{
}

- (NCNotificationListComponentDelegate)listComponentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listComponentDelegate);

  return (NCNotificationListComponentDelegate *)WeakRetained;
}

- (void)setListComponentDelegate:(id)a3
{
}

- (unint64_t)appNotificationCount
{
  return self->_appNotificationCount;
}

- (void)setAppNotificationCount:(unint64_t)a3
{
  self->_appNotificationCount = a3;
}

- (double)cachedImageSizeRatio
{
  return self->_cachedImageSizeRatio;
}

- (void)setCachedImageSizeRatio:(double)a3
{
  self->_cachedImageSizeRatio = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listComponentDelegate);
  objc_storeStrong(&self->_defaultActionBlock, 0);

  objc_storeStrong((id *)&self->_cachedFeaturedAttachmentImage, 0);
}

@end