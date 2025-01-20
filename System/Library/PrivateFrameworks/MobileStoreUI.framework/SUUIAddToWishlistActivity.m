@interface SUUIAddToWishlistActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SUUIAddToWishlistActivity)initWithItem:(id)a3 clientContext:(id)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation SUUIAddToWishlistActivity

- (SUUIAddToWishlistActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIAddToWishlistActivity;
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
  v3 = [MEMORY[0x263F827E8] imageNamed:@"ShareSheetWishList" inBundle:v2];

  return v3;
}

- (id)activityTitle
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"ADD_TO_WISHLIST"];
  }
  else {
  v3 = +[SUUIClientContext localizedStringForKey:@"ADD_TO_WISHLIST" inBundles:0];
  }
  return v3;
}

- (id)activityType
{
  return @"SUUIActivityTypeAddToWishlist";
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x263F1CFB0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3 = +[SUUIWishlist activeWishlist];
  [v3 addItem:self->_item];
  [v3 postChangeNotification];
  [(UIActivity *)self activityDidFinish:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end