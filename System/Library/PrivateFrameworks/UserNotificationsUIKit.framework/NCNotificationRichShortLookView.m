@interface NCNotificationRichShortLookView
- (BOOL)isAttachmentImageFeatured;
- (id)_newNotificationContentView;
- (id)_richContentView;
- (void)_layoutNotificationContentView;
- (void)setAttachmentImageFeatured:(BOOL)a3;
@end

@implementation NCNotificationRichShortLookView

- (BOOL)isAttachmentImageFeatured
{
  v2 = [(NCNotificationRichShortLookView *)self _richContentView];
  char v3 = [v2 isAttachmentImageFeatured];

  return v3;
}

- (void)setAttachmentImageFeatured:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationRichShortLookView *)self _richContentView];
  [v4 setAttachmentImageFeatured:v3];
}

- (id)_newNotificationContentView
{
  return objc_alloc_init(NCNotificationRichContentView);
}

- (void)_layoutNotificationContentView
{
  BOOL v3 = [(NCNotificationRichShortLookView *)self _richContentView];

  if (v3)
  {
    id v4 = [(NCNotificationShortLookView *)self customContentView];
    [v4 bounds];

    id v5 = [(NCNotificationRichShortLookView *)self _richContentView];
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    objc_msgSend(v5, "setFrame:");
  }
}

- (id)_richContentView
{
  v2 = [(NCNotificationShortLookView *)self notificationContentView];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end