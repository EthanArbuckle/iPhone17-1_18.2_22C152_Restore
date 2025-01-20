@interface SKUIGiftResultViewController
- (SKUIGiftResultViewController)initWithGift:(id)a3 configuration:(id)a4;
- (id)_itemImage;
- (id)_itemView;
- (void)_doneButtonAction:(id)a3;
- (void)_giftAgainAction:(id)a3;
- (void)_setItemImage:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIGiftResultViewController

- (SKUIGiftResultViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftResultViewController initWithGift:configuration:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftResultViewController;
  v8 = [(SKUIGiftStepViewController *)&v13 initWithGift:v6 configuration:v7];
  if (v8)
  {
    v9 = [v7 clientContext];
    v10 = v9;
    if (v9) {
      [v9 localizedStringForKey:@"GIFTING_RESULT_TITLE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"GIFTING_RESULT_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftResultViewController *)v8 setTitle:v11];
  }
  return v8;
}

- (void)dealloc
{
  [(UIButton *)self->_giftAgainButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftResultViewController;
  [(SKUIGiftResultViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v3 = [(SKUIGiftStepViewController *)self giftConfiguration];
  v4 = [v3 clientContext];

  v5 = objc_alloc_init(SKUIGiftResultView);
  id v6 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
  [(SKUIGiftResultView *)v5 setBackgroundColor:v6];

  id v7 = [(SKUIGiftStepViewController *)self gift];
  v8 = [v7 item];

  if (v8)
  {
    v9 = [(SKUIGiftResultViewController *)self _itemView];
    [(SKUIGiftResultView *)v5 setItemView:v9];

    if (v4) {
      [v4 localizedStringForKey:@"GIFTING_RESULT_ITEM_MESSAGE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"GIFTING_RESULT_ITEM_MESSAGE" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftResultView *)v5 setTitle:v11];
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1818] imageNamed:@"RedemptionCardStack" inBundle:v21];
    [(SKUIGiftResultView *)v5 setImage:v10];

    if (v4) {
      [v4 localizedStringForKey:@"GIFTING_RESULT_AMOUNT_MESSAGE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"GIFTING_RESULT_AMOUNT_MESSAGE" inBundles:0 inTable:@"Gifting"];
    }
    v12 = NSString;
    objc_super v13 = [(SKUIGiftStepViewController *)self gift];
    v14 = [v13 totalGiftAmountString];
    v15 = [v12 stringWithValidatedFormat:v11, @"%@", 0, v14 validFormatSpecifiers error];
    [(SKUIGiftResultView *)v5 setTitle:v15];
  }
  v16 = [(SKUIGiftResultView *)v5 giftAgainButton];
  [v16 addTarget:self action:sel__giftAgainAction_ forControlEvents:64];
  if (v4) {
    [v4 localizedStringForKey:@"GIFTING_RESULT_SEND_ANOTHER_BUTTON" inTable:@"Gifting"];
  }
  else {
  v17 = +[SKUIClientContext localizedStringForKey:@"GIFTING_RESULT_SEND_ANOTHER_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v16 setTitle:v17 forState:0];

  [v16 sizeToFit];
  [(SKUIGiftResultViewController *)self setView:v5];
  v18 = [(SKUIGiftResultViewController *)self navigationItem];
  [v18 setHidesBackButton:1];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v19 setAction:sel__doneButtonAction_];
  [v19 setStyle:2];
  [v19 setTarget:self];
  if (v4) {
    [v4 localizedStringForKey:@"GIFTING_DONE_BUTTON" inTable:@"Gifting"];
  }
  else {
  v20 = +[SKUIClientContext localizedStringForKey:@"GIFTING_DONE_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v19 setTitle:v20];

  [v18 setRightBarButtonItem:v19];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUIGiftResultViewController *)self _itemView];
  id v6 = [v5 artworkContext];

  if (v6 && !self->_itemImage)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SKUIGiftResultViewController_viewWillAppear___block_invoke;
    v8[3] = &unk_1E6424128;
    objc_copyWeak(&v9, &location);
    [(SKUIGiftStepViewController *)self loadItemArtworkWithArtworkContext:v6 completionBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftResultViewController;
  [(SKUIGiftResultViewController *)&v7 viewWillAppear:v3];
}

void __47__SKUIGiftResultViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setItemImage:v6 error:v5];
}

- (void)_doneButtonAction:(id)a3
{
}

- (void)_giftAgainAction:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = [(SKUIGiftStepViewController *)self gift];
  id v5 = (void *)[v4 copy];

  [v5 reset];
  id v6 = [SKUIGiftComposeViewController alloc];
  objc_super v7 = [(SKUIGiftStepViewController *)self giftConfiguration];
  v8 = [(SKUIGiftComposeViewController *)v6 initWithGift:v5 configuration:v7];

  id v9 = [(SKUIGiftStepViewController *)self operationQueue];
  [(SKUIGiftStepViewController *)v8 setOperationQueue:v9];

  v10 = [(SKUIGiftResultViewController *)self navigationController];
  v12[0] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 setViewControllers:v11 animated:1];
}

- (id)_itemImage
{
  BOOL v3 = self->_itemImage;
  if (!v3)
  {
    v4 = [(SKUIGiftItemView *)self->_itemView artworkContext];
    id v5 = [(SKUIGiftStepViewController *)self gift];
    id v6 = [v5 item];
    BOOL v3 = [v4 placeholderImageForItem:v6];
  }

  return v3;
}

- (id)_itemView
{
  BOOL v3 = [(SKUIGiftStepViewController *)self gift];
  v4 = [v3 item];

  if (v4 && !self->_itemView)
  {
    id v5 = [SKUIGiftItemView alloc];
    id v6 = [(SKUIGiftStepViewController *)self giftConfiguration];
    objc_super v7 = [v6 clientContext];
    v8 = [(SKUIGiftItemView *)v5 initWithStyle:2 item:v4 clientContext:v7];
    itemView = self->_itemView;
    self->_itemView = v8;

    v10 = self->_itemView;
    v11 = [v4 artistName];
    [(SKUIGiftItemView *)v10 setArtistName:v11];

    v12 = self->_itemView;
    objc_super v13 = [v4 categoryName];
    [(SKUIGiftItemView *)v12 setCategoryName:v13];

    v14 = self->_itemView;
    v15 = [(SKUIGiftResultViewController *)self _itemImage];
    [(SKUIGiftItemView *)v14 setItemImage:v15];

    -[SKUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", [v4 numberOfUserRatings]);
    v16 = self->_itemView;
    v17 = [v4 primaryItemOffer];
    v18 = [v17 buttonText];
    [(SKUIGiftItemView *)v16 setPrice:v18];

    id v19 = self->_itemView;
    v20 = [v4 title];
    [(SKUIGiftItemView *)v19 setTitle:v20];

    id v21 = self->_itemView;
    [v4 userRating];
    *(float *)&double v23 = v22 / 5.0;
    [(SKUIGiftItemView *)v21 setUserRating:v23];
    [(SKUIGiftItemView *)self->_itemView sizeToFit];
  }
  v24 = self->_itemView;

  return v24;
}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)&self->_itemImage, a3);
    [(SKUIGiftItemView *)self->_itemView setItemImage:self->_itemImage];
    id v6 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);

  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftResultViewController initWithGift:configuration:]";
}

@end