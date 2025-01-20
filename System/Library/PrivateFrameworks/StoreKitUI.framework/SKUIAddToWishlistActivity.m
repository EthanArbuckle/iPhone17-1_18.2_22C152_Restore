@interface SKUIAddToWishlistActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SKUIAddToWishlistActivity)initWithItem:(id)a3 clientContext:(id)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation SKUIAddToWishlistActivity

- (SKUIAddToWishlistActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAddToWishlistActivity initWithItem:clientContext:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIAddToWishlistActivity;
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
  v3 = [MEMORY[0x1E4FB1818] imageNamed:@"ShareSheetWishList" inBundle:v2];

  return v3;
}

- (id)activityTitle
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SKUIClientContext *)clientContext localizedStringForKey:@"ADD_TO_WISHLIST"];
  }
  else {
  v3 = +[SKUIClientContext localizedStringForKey:@"ADD_TO_WISHLIST" inBundles:0];
  }

  return v3;
}

- (id)activityType
{
  return @"SKUIActivityTypeAddToWishlist";
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x1E4F435A0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3 = +[SKUIWishlist activeWishlist];
  [v3 addItem:self->_item];
  [v3 postChangeNotification];
  [(UIActivity *)self activityDidFinish:1];
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
  v1 = "-[SKUIAddToWishlistActivity initWithItem:clientContext:]";
}

@end