@interface NCNotificationRequestFullScreenContentProvider
- (BOOL)isImageAssetLoadingComplete;
- (UIImage)_fullScreenThumbnail;
- (id)_newAvatarView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)icons;
- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4;
- (id)importantText;
- (id)thumbnail;
- (void)_setFullScreenThumbnail:(id)a3;
- (void)loadImageAssetsWithCompletion:(id)a3;
@end

@implementation NCNotificationRequestFullScreenContentProvider

- (void)loadImageAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_imageAssetLoadingComplete)
  {
    v5->_imageAssetLoadingComplete = 1;
    Serial = BSDispatchQueueCreateSerial();
    objc_initWeak(&location, v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke;
    block[3] = &unk_1E6A919C8;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(Serial, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);
}

void __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained notificationRequest];
  id v4 = [v3 attachmentImageWithDimension:84.0];
  [WeakRetained _setFullScreenThumbnail:v4];

  if (*(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke_2;
    v6[3] = &unk_1E6A93248;
    id v5 = *(id *)(a1 + 32);
    v6[4] = WeakRetained;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _fullScreenThumbnail];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRequestFullScreenContentProvider;
  id v4 = [(NCNotificationRequestCoalescingContentProvider *)&v8 copyWithZone:a3];
  v4[128] = self->_imageAssetLoadingComplete;
  uint64_t v5 = [(UIImage *)self->_fullScreenThumbnail copy];
  v6 = (void *)*((void *)v4 + 17);
  *((void *)v4 + 17) = v5;

  return v4;
}

- (id)icons
{
  id v2 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  v3 = [v2 content];
  id v4 = [v3 fullScreenIcons];

  return v4;
}

- (id)importantText
{
  v3 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  uint64_t v4 = [v3 interruptionLevel];

  if (v4 == 2)
  {
    uint64_t v5 = NCUserNotificationsUIKitFrameworkBundle();
    v6 = v5;
    id v7 = @"TIME_SENSITIVE_TEXT";
LABEL_5:
    v10 = [v5 localizedStringForKey:v7 value:&stru_1F2F516F8 table:0];
    v11 = [v10 localizedLowercaseString];

    goto LABEL_7;
  }
  objc_super v8 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  uint64_t v9 = [v8 interruptionLevel];

  if (v9 == 3)
  {
    uint64_t v5 = NCUserNotificationsUIKitFrameworkBundle();
    v6 = v5;
    id v7 = @"CRITICAL_TEXT";
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  uint64_t v7 = [v6 interruptionLevel];

  if (v7 == 3)
  {
    objc_super v8 = [(NCNotificationRequestContentProvider *)self _criticalAlertIconAttributedStringWithImageConfiguration:v5];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)thumbnail
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_imageAssetLoadingComplete)
  {
    v3 = v2->_fullScreenThumbnail;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)NCNotificationRequestFullScreenContentProvider;
    v3 = [(NCNotificationRequestCoalescingContentProvider *)&v6 thumbnail];
  }
  uint64_t v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)_newAvatarView
{
  v3 = [(NCNotificationRequestContentProvider *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 contentProviderTraitCollection:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [NCAvatarView alloc];
  objc_super v6 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  uint64_t v7 = [(NCAvatarView *)v5 initWithNotificationRequest:v6 pointSize:v4 compatibleWithInitialTraitCollection:176.0];

  return v7;
}

- (BOOL)isImageAssetLoadingComplete
{
  return self->_imageAssetLoadingComplete;
}

- (UIImage)_fullScreenThumbnail
{
  return self->_fullScreenThumbnail;
}

- (void)_setFullScreenThumbnail:(id)a3
{
}

- (void).cxx_destruct
{
}

@end