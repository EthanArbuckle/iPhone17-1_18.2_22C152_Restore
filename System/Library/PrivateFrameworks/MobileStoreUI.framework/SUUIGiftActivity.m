@interface SUUIGiftActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SUUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4;
@end

@implementation SUUIGiftActivity

- (SUUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftActivity;
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
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263F827E8] imageNamed:@"ShareSheetGift" inBundle:v2];

  return v3;
}

- (id)activityTitle
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"SHARE_SHEET_GIFT_TITLE"];
  }
  else {
  v3 = +[SUUIClientContext localizedStringForKey:@"SHARE_SHEET_GIFT_TITLE" inBundles:0];
  }
  return v3;
}

- (id)activityType
{
  return @"SUUIActivityTypeGift";
}

- (id)activityViewController
{
  v3 = [[SUUIGift alloc] initWithItem:self->_item];
  v4 = [[SUUIGiftViewController alloc] initWithGift:v3];
  [(SUUIGiftViewController *)v4 setClientContext:self->_clientContext];
  [(SUUIGiftViewController *)v4 setGiftDelegate:self];

  return v4;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x263F1CFB0];
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

@end