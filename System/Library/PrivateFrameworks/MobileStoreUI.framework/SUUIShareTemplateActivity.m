@interface SUUIShareTemplateActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SUUIShareTemplateActivity)initWithActivityViewElement:(id)a3 clientContext:(id)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation SUUIShareTemplateActivity

- (SUUIShareTemplateActivity)initWithActivityViewElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShareTemplateActivity;
  v9 = [(UIActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_viewElement, a3);
  }

  return v10;
}

- (id)activityImage
{
  v2 = [(SUUIShareSheetActivityViewElement *)self->_viewElement activityType];
  if ([v2 isEqualToString:@"gift"])
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = @"ShareSheetGift";
LABEL_5:
    v6 = [v4 imageNamed:v5 inBundle:v3];

    goto LABEL_7;
  }
  if ([v2 isEqualToString:@"wishlist"])
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = @"ShareSheetWishList";
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)activityTitle
{
  v3 = [(SUUIShareSheetActivityViewElement *)self->_viewElement activityType];
  if (![v3 isEqualToString:@"gift"])
  {
    if (![v3 isEqualToString:@"wishlist"])
    {
      id v7 = 0;
      goto LABEL_13;
    }
    clientContext = self->_clientContext;
    if (clientContext)
    {
      v5 = @"ADD_TO_WISHLIST";
      goto LABEL_7;
    }
    id v8 = @"ADD_TO_WISHLIST";
LABEL_11:
    uint64_t v6 = +[SUUIClientContext localizedStringForKey:v8 inBundles:0];
    goto LABEL_12;
  }
  clientContext = self->_clientContext;
  if (!clientContext)
  {
    id v8 = @"SHARE_SHEET_GIFT_TITLE";
    goto LABEL_11;
  }
  v5 = @"SHARE_SHEET_GIFT_TITLE";
LABEL_7:
  uint64_t v6 = [(SUUIClientContext *)clientContext localizedStringForKey:v5];
LABEL_12:
  id v7 = (void *)v6;
LABEL_13:

  return v7;
}

- (id)activityType
{
  v2 = [(SUUIShareSheetActivityViewElement *)self->_viewElement activityType];
  if ([v2 isEqualToString:@"gift"])
  {
    v3 = @"SUUIActivityTypeGift";
  }
  else if ([v2 isEqualToString:@"wishlist"])
  {
    v3 = @"SUUIActivityTypeWishlist";
  }
  else
  {
    v3 = 0;
  }

  return v3;
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
  v3 = self->_viewElement;
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SUUIShareTemplateActivity_performActivity__block_invoke;
  v6[3] = &unk_265400890;
  id v7 = v3;
  id v8 = self;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], v6);
}

uint64_t __44__SUUIShareTemplateActivity_performActivity__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SUUIShareTemplateActivity_performActivity__block_invoke_2;
  v3[3] = &unk_265401368;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v3];
}

uint64_t __44__SUUIShareTemplateActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end