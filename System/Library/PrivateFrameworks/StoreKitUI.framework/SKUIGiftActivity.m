@interface SKUIGiftActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SKUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4;
@end

@implementation SKUIGiftActivity

- (SKUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftActivity initWithItem:clientContext:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIGiftActivity;
  v9 = [(UIActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v10;
}

- (id)activityImage
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x1E4FB1818] imageNamed:@"ShareSheetGift" inBundle:v2];

  return v3;
}

- (id)activityTitle
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SKUIClientContext *)clientContext localizedStringForKey:@"SHARE_SHEET_GIFT_TITLE"];
  }
  else {
  v3 = +[SKUIClientContext localizedStringForKey:@"SHARE_SHEET_GIFT_TITLE" inBundles:0];
  }

  return v3;
}

- (id)activityType
{
  return @"SKUIActivityTypeGift";
}

- (id)activityViewController
{
  v3 = [[SKUIGift alloc] initWithItem:self->_item];
  v4 = [[SKUIGiftViewController alloc] initWithGift:v3];
  [(SKUIGiftViewController *)v4 setClientContext:self->_clientContext];
  [(SKUIGiftViewController *)v4 setGiftDelegate:self];

  return v4;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x1E4F435A0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithItem:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftActivity initWithItem:clientContext:]";
}

@end