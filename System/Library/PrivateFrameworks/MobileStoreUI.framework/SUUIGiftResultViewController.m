@interface SUUIGiftResultViewController
- (SUUIGiftResultViewController)initWithGift:(id)a3 configuration:(id)a4;
- (id)_itemImage;
- (id)_itemView;
- (void)_doneButtonAction:(id)a3;
- (void)_giftAgainAction:(id)a3;
- (void)_setItemImage:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIGiftResultViewController

- (SUUIGiftResultViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftResultViewController;
  v7 = [(SUUIGiftStepViewController *)&v12 initWithGift:a3 configuration:v6];
  if (v7)
  {
    v8 = [v6 clientContext];
    v9 = v8;
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_RESULT_TITLE" inTable:@"Gifting"];
    }
    else {
    v10 = +[SUUIClientContext localizedStringForKey:@"GIFTING_RESULT_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftResultViewController *)v7 setTitle:v10];
  }
  return v7;
}

- (void)dealloc
{
  [(UIButton *)self->_giftAgainButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftResultViewController;
  [(SUUIGiftResultViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v3 = [(SUUIGiftStepViewController *)self giftConfiguration];
  v4 = [v3 clientContext];

  v5 = objc_alloc_init(SUUIGiftResultView);
  id v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(SUUIGiftResultView *)v5 setBackgroundColor:v6];

  v7 = [(SUUIGiftStepViewController *)self gift];
  v8 = [v7 item];

  if (v8)
  {
    v9 = [(SUUIGiftResultViewController *)self _itemView];
    [(SUUIGiftResultView *)v5 setItemView:v9];

    if (v4) {
      [v4 localizedStringForKey:@"GIFTING_RESULT_ITEM_MESSAGE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SUUIClientContext localizedStringForKey:@"GIFTING_RESULT_ITEM_MESSAGE" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftResultView *)v5 setTitle:v11];
  }
  else
  {
    v10 = [MEMORY[0x263F827E8] imageNamed:@"RedemptionCardStack" inBundle:v21];
    [(SUUIGiftResultView *)v5 setImage:v10];

    if (v4) {
      [v4 localizedStringForKey:@"GIFTING_RESULT_AMOUNT_MESSAGE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SUUIClientContext localizedStringForKey:@"GIFTING_RESULT_AMOUNT_MESSAGE" inBundles:0 inTable:@"Gifting"];
    }
    objc_super v12 = NSString;
    v13 = [(SUUIGiftStepViewController *)self gift];
    v14 = [v13 totalGiftAmountString];
    v15 = [v12 stringWithValidatedFormat:v11, @"%@", 0, v14 validFormatSpecifiers error];
    [(SUUIGiftResultView *)v5 setTitle:v15];
  }
  v16 = [(SUUIGiftResultView *)v5 giftAgainButton];
  [v16 addTarget:self action:sel__giftAgainAction_ forControlEvents:64];
  if (v4) {
    [v4 localizedStringForKey:@"GIFTING_RESULT_SEND_ANOTHER_BUTTON" inTable:@"Gifting"];
  }
  else {
  v17 = +[SUUIClientContext localizedStringForKey:@"GIFTING_RESULT_SEND_ANOTHER_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v16 setTitle:v17 forState:0];

  [v16 sizeToFit];
  [(SUUIGiftResultViewController *)self setView:v5];
  v18 = [(SUUIGiftResultViewController *)self navigationItem];
  [v18 setHidesBackButton:1];
  id v19 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v19 setAction:sel__doneButtonAction_];
  [v19 setStyle:2];
  [v19 setTarget:self];
  if (v4) {
    [v4 localizedStringForKey:@"GIFTING_DONE_BUTTON" inTable:@"Gifting"];
  }
  else {
  v20 = +[SUUIClientContext localizedStringForKey:@"GIFTING_DONE_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v19 setTitle:v20];

  [v18 setRightBarButtonItem:v19];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIGiftResultViewController *)self _itemView];
  id v6 = [v5 artworkContext];

  if (v6 && !self->_itemImage)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__SUUIGiftResultViewController_viewWillAppear___block_invoke;
    v8[3] = &unk_265400BC0;
    objc_copyWeak(&v9, &location);
    [(SUUIGiftStepViewController *)self loadItemArtworkWithArtworkContext:v6 completionBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIGiftResultViewController;
  [(SUUIGiftResultViewController *)&v7 viewWillAppear:v3];
}

void __47__SUUIGiftResultViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v12[1] = *MEMORY[0x263EF8340];
  v4 = [(SUUIGiftStepViewController *)self gift];
  id v5 = (void *)[v4 copy];

  [v5 reset];
  id v6 = [SUUIGiftComposeViewController alloc];
  objc_super v7 = [(SUUIGiftStepViewController *)self giftConfiguration];
  v8 = [(SUUIGiftComposeViewController *)v6 initWithGift:v5 configuration:v7];

  id v9 = [(SUUIGiftStepViewController *)self operationQueue];
  [(SUUIGiftStepViewController *)v8 setOperationQueue:v9];

  v10 = [(SUUIGiftResultViewController *)self navigationController];
  v12[0] = v8;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v10 setViewControllers:v11 animated:1];
}

- (id)_itemImage
{
  BOOL v3 = self->_itemImage;
  if (!v3)
  {
    v4 = [(SUUIGiftItemView *)self->_itemView artworkContext];
    id v5 = [(SUUIGiftStepViewController *)self gift];
    id v6 = [v5 item];
    BOOL v3 = [v4 placeholderImageForItem:v6];
  }
  return v3;
}

- (id)_itemView
{
  BOOL v3 = [(SUUIGiftStepViewController *)self gift];
  v4 = [v3 item];

  if (v4 && !self->_itemView)
  {
    id v5 = [SUUIGiftItemView alloc];
    id v6 = [(SUUIGiftStepViewController *)self giftConfiguration];
    objc_super v7 = [v6 clientContext];
    v8 = [(SUUIGiftItemView *)v5 initWithStyle:2 item:v4 clientContext:v7];
    itemView = self->_itemView;
    self->_itemView = v8;

    v10 = self->_itemView;
    v11 = [v4 artistName];
    [(SUUIGiftItemView *)v10 setArtistName:v11];

    objc_super v12 = self->_itemView;
    v13 = [v4 categoryName];
    [(SUUIGiftItemView *)v12 setCategoryName:v13];

    v14 = self->_itemView;
    v15 = [(SUUIGiftResultViewController *)self _itemImage];
    [(SUUIGiftItemView *)v14 setItemImage:v15];

    -[SUUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", [v4 numberOfUserRatings]);
    v16 = self->_itemView;
    v17 = [v4 primaryItemOffer];
    v18 = [v17 buttonText];
    [(SUUIGiftItemView *)v16 setPrice:v18];

    id v19 = self->_itemView;
    v20 = [v4 title];
    [(SUUIGiftItemView *)v19 setTitle:v20];

    id v21 = self->_itemView;
    [v4 userRating];
    *(float *)&double v23 = v22 / 5.0;
    [(SUUIGiftItemView *)v21 setUserRating:v23];
    [(SUUIGiftItemView *)self->_itemView sizeToFit];
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
    [(SUUIGiftItemView *)self->_itemView setItemImage:self->_itemImage];
    id v6 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

@end