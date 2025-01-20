@interface SUUIRedeemNativeResultsViewController
+ (BOOL)canShowResultsForRedeem:(id)a3;
- (BOOL)extendedMessageIsExpanded;
- (NSOperationQueue)operationQueue;
- (SUUIGiftItemView)itemView;
- (SUUIItemStateCenter)itemStateCenter;
- (SUUIRedeemITunesPassLockup)passbookLockup;
- (SUUIRedeemNativeResultsViewController)initWithRedeem:(id)a3;
- (SUUIRedeemResultMessageView)messageView;
- (SUUITextBoxView)extendedMessageView;
- (SUUITextLayout)extendedMessageTextLayout;
- (UIButton)anotherButton;
- (UIImage)itemImage;
- (UIImageView)headerImageView;
- (double)_tableWidth;
- (id)_anotherButtonSection;
- (id)_emptySection;
- (id)_extendedMessageViewSection;
- (id)_headerImageViewSection;
- (id)_item;
- (id)_itemView;
- (id)_itemViewSection;
- (id)_linksSection;
- (id)_messageViewSection;
- (id)_passbookLearnMoreSection;
- (id)_resultImageViewSection;
- (unint64_t)currentItemStateFlag;
- (void)_extendedMessageAction:(id)a3;
- (void)_openAction:(id)a3;
- (void)_passbookLockupAction:(id)a3;
- (void)_redeemAnotherAction:(id)a3;
- (void)_reloadResultViewMessage;
- (void)_reloadSections;
- (void)_setHeaderImage:(id)a3;
- (void)_setItemImage:(id)a3;
- (void)dealloc;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)loadView;
- (void)redeemResultsView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)setAnotherButton:(id)a3;
- (void)setCurrentItemStateFlag:(unint64_t)a3;
- (void)setExtendedMessageIsExpanded:(BOOL)a3;
- (void)setExtendedMessageTextLayout:(id)a3;
- (void)setExtendedMessageView:(id)a3;
- (void)setHeaderImageView:(id)a3;
- (void)setItemImage:(id)a3;
- (void)setItemStateCenter:(id)a3;
- (void)setItemView:(id)a3;
- (void)setMessageView:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPassbookLockup:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIRedeemNativeResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  return 1;
}

- (SUUIRedeemNativeResultsViewController)initWithRedeem:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUIRedeemNativeResultsViewController;
  v5 = [(SUUIRedeemResultsViewController *)&v21 initWithRedeem:v4];
  if (v5)
  {
    v6 = [v4 items];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = +[SUUIItemStateCenter defaultCenter];
      itemStateCenter = v5->_itemStateCenter;
      v5->_itemStateCenter = (SUUIItemStateCenter *)v8;

      [(SUUIItemStateCenter *)v5->_itemStateCenter addObserver:v5];
      v10 = [v4 downloads];

      if (v10)
      {
        v11 = [v4 downloads];
        if (v11) {
          v12 = v11;
        }
        else {
          v12 = (void *)MEMORY[0x263EFFA68];
        }
        v13 = [MEMORY[0x263EFFA08] setWithArray:v12];
        v14 = NSNumber;
        v15 = [v4 items];
        v16 = [v15 firstObject];
        v17 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "itemIdentifier"));

        if (v17) {
          [(SUUIItemStateCenter *)v5->_itemStateCenter addRelationshipForParentAdamId:v17 withChildAdamIds:v13];
        }
      }
    }
    v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v18;
  }
  return v5;
}

- (void)dealloc
{
  [(UIButton *)self->_anotherButton removeTarget:self action:0 forControlEvents:64];
  [(SUUITextBoxView *)self->_extendedMessageView removeTarget:self action:0 forControlEvents:64];
  v3 = [(SUUIGiftItemView *)self->_itemView itemOfferButton];
  [v3 removeTarget:self action:0 forControlEvents:64];

  itemStateCenter = self->_itemStateCenter;
  v5 = NSNumber;
  v6 = [(SUUIRedeemResultsViewController *)self redeem];
  uint64_t v7 = [v6 items];
  uint64_t v8 = [v7 firstObject];
  v9 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
  [(SUUIItemStateCenter *)itemStateCenter removeRelationshipsForParentAdamId:v9];

  [(SUUIItemStateCenter *)self->_itemStateCenter removeObserver:self];
  [(SUUIRedeemITunesPassLockup *)self->_passbookLockup removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemNativeResultsViewController;
  [(SUUIRedeemNativeResultsViewController *)&v10 dealloc];
}

- (void)loadView
{
  v6 = objc_alloc_init(SUUIRedeemResultsView);
  [(SUUIRedeemResultsView *)v6 setResultsDelegate:self];
  [(SUUIRedeemResultsView *)v6 setContentInsetAdjustmentBehavior:101];
  [(SUUIRedeemNativeResultsViewController *)self setView:v6];
  [(SUUIRedeemNativeResultsViewController *)self _reloadSections];
  v3 = [(SUUIRedeemStepViewController *)self clientContext];
  id v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_VIEW_TITLE" inTable:@"Redeem"];
  }
  else {
  v5 = +[SUUIClientContext localizedStringForKey:@"REDEEM_VIEW_TITLE" inBundles:0 inTable:@"Redeem"];
  }
  [(SUUIRedeemNativeResultsViewController *)self setTitle:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIRedeemResultsViewController *)self redeem];
  v6 = [v5 headerArtworkProvider];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 scale];
    if (v8 == 2.0) {
      [v6 largestArtwork];
    }
    else {
    v9 = [v6 smallestArtwork];
    }

    id v10 = objc_alloc(MEMORY[0x263F7B3A0]);
    v11 = [v9 URL];
    v12 = (void *)[v10 initWithURL:v11];

    v13 = +[SSVURLDataConsumer consumer];
    [v12 setDataConsumer:v13];

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke;
    v26[3] = &unk_265400BC0;
    objc_copyWeak(&v27, &location);
    [v12 setOutputBlock:v26];
    [(NSOperationQueue *)self->_operationQueue addOperation:v12];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  v14 = [(SUUIGiftItemView *)self->_itemView artworkContext];
  v15 = [(SUUIRedeemNativeResultsViewController *)self _item];
  v16 = [v14 URLForItem:v15];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F7B3A0]);
    v18 = [(SUUIRedeemNativeResultsViewController *)self _item];
    v19 = [v14 URLForItem:v18];
    v20 = (void *)[v17 initWithURL:v19];

    objc_super v21 = [(SUUIRedeemNativeResultsViewController *)self _item];
    v22 = [v14 dataConsumerForItem:v21];
    [v20 setDataConsumer:v22];

    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_3;
    v24[3] = &unk_265400BC0;
    objc_copyWeak(&v25, &location);
    [v20 setOutputBlock:v24];
    [(NSOperationQueue *)self->_operationQueue addOperation:v20];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  v23.receiver = self;
  v23.super_class = (Class)SUUIRedeemNativeResultsViewController;
  [(SUUIRedeemNativeResultsViewController *)&v23 viewWillAppear:v3];
}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_2;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setHeaderImage:*(void *)(a1 + 32)];
  }
}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_4;
  v5[3] = &unk_265402A38;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setItemImage:*(void *)(a1 + 32)];
  }
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__SUUIRedeemNativeResultsViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __75__SUUIRedeemNativeResultsViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _item];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 itemIdentifier];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "itemIdentifier", (void)v14);
          uint64_t v12 = [v11 longLongValue];

          if (v12 == v4)
          {
            v13 = [*(id *)(a1 + 32) _itemView];
            [v13 setItemState:v10 animated:1];

            [*(id *)(a1 + 32) _reloadResultViewMessage];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)redeemResultsView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v5 = [(SUUIRedeemResultsViewController *)self redeem];
  uint64_t v6 = [v5 links];

  if ([v6 count])
  {
    uint64_t v7 = [v13 section];
    uint64_t v8 = [(SUUIRedeemNativeResultsViewController *)self view];
    v9 = [v8 sections];
    uint64_t v10 = [v9 count] - 2;

    if (v7 == v10)
    {
      v11 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "row"));
      uint64_t v12 = [v11 URL];

      if (v12) {
        SUUIMetricsOpenURL(v12);
      }
    }
  }
}

- (void)_extendedMessageAction:(id)a3
{
  if (!self->_extendedMessageIsExpanded)
  {
    [(SUUITextBoxView *)self->_extendedMessageView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [(SUUITextLayout *)self->_extendedMessageTextLayout textSize];
    double v11 = v10;
    uint64_t v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      long long v14 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPad;
    }
    else {
      long long v14 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPhone;
    }
    -[SUUITextBoxView setFrame:](self->_extendedMessageView, "setFrame:", v5, v7, v9, v11 + *v14);
    [(SUUITextBoxView *)self->_extendedMessageView setNumberOfVisibleLines:0];
    self->_extendedMessageIsExpanded = 1;
    id v15 = [(SUUIRedeemNativeResultsViewController *)self view];
    [v15 reloadData];
  }
}

- (void)_openAction:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUIRedeemResultsViewController *)self redeem];
  double v6 = [(id)v5 items];
  double v7 = [v6 objectAtIndex:0];

  double v8 = -[SUUIItemStateCenter stateForItemWithIdentifier:](self->_itemStateCenter, "stateForItemWithIdentifier:", [v7 itemIdentifier]);
  LOBYTE(v5) = [v8 state];

  if ((v5 & 4) != 0)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__38;
    objc_super v23 = __Block_byref_object_dispose__38;
    id v24 = [v7 bundleIdentifier];
    double v9 = (void *)v20[5];
    if (v9) {
      goto LABEL_4;
    }
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = objc_alloc_init(MEMORY[0x263F7B330]);
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    v25[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__SUUIRedeemNativeResultsViewController__openAction___block_invoke;
    v16[3] = &unk_265402D60;
    v18 = &v19;
    long long v14 = v10;
    long long v17 = v14;
    [v11 getLibraryItemsForITunesStoreItemIdentifiers:v13 completionBlock:v16];

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    double v9 = (void *)v20[5];
    if (v9)
    {
LABEL_4:
      id v15 = v9;
      SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v15, 0);
      CFRelease(v15);
    }
    _Block_object_dispose(&v19, 8);
  }
}

intptr_t __53__SUUIRedeemNativeResultsViewController__openAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = [v3 valueForProperty:*MEMORY[0x263F7BC80]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  double v7 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v7);
}

- (void)_passbookLockupAction:(id)a3
{
  double v8 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
  uint64_t v4 = [(SUUIRedeemStepViewController *)self clientContext];
  [(SUUIRedeemStepViewController *)v8 setClientContext:v4];

  uint64_t v5 = [(SUUIRedeemStepViewController *)self configuration];
  [(SUUIRedeemStepViewController *)v8 setConfiguration:v5];

  double v6 = [(SUUIRedeemNativeResultsViewController *)self operationQueue];
  [(SUUIRedeemStepViewController *)v8 setOperationQueue:v6];

  double v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(SUUIRedeemNativeResultsViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_redeemAnotherAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(SUUIRedeemNativeResultsViewController *)self navigationController];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    double v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      double v8 = objc_opt_class();
      id v9 = v8;
      *(_DWORD *)uint64_t v13 = 138543618;
      *(void *)&v13[4] = v8;
      *(_WORD *)&v13[12] = 2114;
      *(void *)&v13[14] = objc_opt_class();
      id v10 = *(id *)&v13[14];
      LODWORD(v12) = 22;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      double v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
      free(v11);
      SSFileLog();
    }

    goto LABEL_12;
  }
  [v3 redeemAgainAnimated:1];
LABEL_13:
}

- (id)_anotherButtonSection
{
  if (!self->_anotherButton)
  {
    id v3 = [MEMORY[0x263F824E8] buttonWithType:1];
    anotherButton = self->_anotherButton;
    self->_anotherButton = v3;

    [(UIButton *)self->_anotherButton addTarget:self action:sel__redeemAnotherAction_ forControlEvents:64];
    [(UIButton *)self->_anotherButton setAutoresizingMask:5];
    [(UIButton *)self->_anotherButton setContentHorizontalAlignment:0];
    -[UIButton setContentEdgeInsets:](self->_anotherButton, "setContentEdgeInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    int v5 = self->_anotherButton;
    int v6 = [(SUUIRedeemStepViewController *)self clientContext];
    double v7 = v6;
    if (v6) {
      [v6 localizedStringForKey:@"REDEEM_SUCCESS_REDEEM_AGAIN" inTable:@"Redeem"];
    }
    else {
    double v8 = +[SUUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_REDEEM_AGAIN" inBundles:0 inTable:@"Redeem"];
    }
    [(UIButton *)v5 setTitle:v8 forState:0];

    id v9 = [(UIButton *)self->_anotherButton titleLabel];
    id v10 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v9 setFont:v10];

    [(UIButton *)self->_anotherButton frame];
    double v12 = v11;
    double v14 = v13;
    id v15 = self->_anotherButton;
    [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
    -[UIButton sizeThatFits:](v15, "sizeThatFits:");
    -[UIButton setFrame:](self->_anotherButton, "setFrame:", v12, v14, v16, v17);
  }
  v18 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:self->_anotherButton];
  [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
  double v20 = v19;
  [(UIButton *)self->_anotherButton bounds];
  float v22 = (v20 - v21) * 0.5;
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v18, "setContentInsets:", -2.0, floorf(v22), -2.0, 0.0);
  return v18;
}

- (id)_emptySection
{
  v2 = [SUUIRedeemResultSimpleTableViewSection alloc];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  int v5 = [(SUUIRedeemResultSimpleTableViewSection *)v2 initWithView:v4];

  return v5;
}

- (id)_extendedMessageViewSection
{
  id v3 = [(SUUIRedeemResultsViewController *)self redeem];
  uint64_t v4 = [v3 message];

  if (v4)
  {
    if (!self->_extendedMessageView)
    {
      int v5 = objc_alloc_init(SUUITextBoxView);
      extendedMessageView = self->_extendedMessageView;
      self->_extendedMessageView = v5;

      [(SUUITextBoxView *)self->_extendedMessageView addTarget:self action:sel__extendedMessageAction_ forControlEvents:64];
      -[SUUITextBoxView setContentInsets:](self->_extendedMessageView, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
      double v7 = objc_alloc_init(SUUITextLayoutRequest);
      [(SUUITextLayoutRequest *)v7 setNumberOfLines:3];
      [(SUUITextLayoutRequest *)v7 setFontSize:14.0];
      double v8 = [(SUUIRedeemResultsViewController *)self redeem];
      id v9 = [v8 message];
      [(SUUITextLayoutRequest *)v7 setText:v9];

      [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
      double v11 = v10;
      double v12 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      double v14 = 60.0;
      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        double v14 = 30.0;
      }
      [(SUUITextLayoutRequest *)v7 setWidth:v11 - v14];
      id v15 = [[SUUITextLayout alloc] initWithLayoutRequest:v7];
      extendedMessageTextLayout = self->_extendedMessageTextLayout;
      self->_extendedMessageTextLayout = v15;

      [(SUUITextBoxView *)self->_extendedMessageView setFixedWidthTextFrame:[(SUUITextLayout *)self->_extendedMessageTextLayout textFrame]];
      [(SUUITextBoxView *)self->_extendedMessageView setNumberOfVisibleLines:3];
      [(SUUITextBoxView *)self->_extendedMessageView frame];
      double v18 = v17;
      double v20 = v19;
      if ([(SUUITextLayout *)self->_extendedMessageTextLayout requiresTruncation])
      {
        double v21 = self->_extendedMessageView;
        float v22 = [(SUUIRedeemStepViewController *)self clientContext];
        objc_super v23 = v22;
        if (v22) {
          [v22 localizedStringForKey:@"MORE_BUTTON"];
        }
        else {
        id v27 = +[SUUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
        }
        [(SUUITextBoxView *)v21 setMoreButtonTitle:v27];

        [(SUUITextLayout *)self->_extendedMessageTextLayout truncatedSize];
        double v26 = v28;
      }
      else
      {
        [(SUUITextLayout *)self->_extendedMessageTextLayout textSize];
        double v26 = v25;
        self->_extendedMessageIsExpanded = 1;
      }
      v29 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v30 = [v29 userInterfaceIdiom];

      if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        v31 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPad;
      }
      else {
        v31 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPhone;
      }
      double v32 = v26 + *v31;
      [(SUUITextLayoutRequest *)v7 width];
      -[SUUITextBoxView setFrame:](self->_extendedMessageView, "setFrame:", v18, v20, v33, v32);
    }
    id v24 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:self->_extendedMessageView];
    v34 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v35 = [v34 userInterfaceIdiom];

    if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v36 = 30.0;
    }
    else {
      double v36 = 15.0;
    }
    v37 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v38 = [v37 userInterfaceIdiom];

    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v39 = 30.0;
    }
    else {
      double v39 = 15.0;
    }
    -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v24, "setContentInsets:", -5.0, v36, -3.0, v39);
  }
  else
  {
    id v24 = 0;
  }
  return v24;
}

- (id)_headerImageViewSection
{
  id v3 = [(SUUIRedeemResultsViewController *)self redeem];
  uint64_t v4 = [v3 headerArtworkProvider];

  if (v4)
  {
    if (!self->_headerImageView)
    {
      int v5 = [v4 smallestArtwork];
      id v6 = objc_alloc(MEMORY[0x263F82828]);
      [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
      double v8 = v7;
      [v5 size];
      double v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v8, v9);
      headerImageView = self->_headerImageView;
      self->_headerImageView = v10;

      [(UIImageView *)self->_headerImageView setContentMode:4];
    }
    double v12 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:self->_headerImageView];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)_itemViewSection
{
  id v3 = [(SUUIRedeemNativeResultsViewController *)self _itemView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
  double v9 = v8;
  double v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  double v12 = 60.0;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v12 = 30.0;
  }
  objc_msgSend(v3, "sizeThatFits:", v9 - v12, 1.79769313e308);
  objc_msgSend(v3, "setFrame:", v5, v7, v13, v14);
  id v15 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:v3];
  double v16 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v18 = 30.0;
  }
  else {
    double v18 = 15.0;
  }
  double v19 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v21 = 30.0;
  }
  else {
    double v21 = 15.0;
  }
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v15, "setContentInsets:", 0.0, v18, 0.0, v21);

  return v15;
}

- (id)_messageViewSection
{
  if (!self->_messageView)
  {
    id v3 = objc_alloc_init(SUUIRedeemResultMessageView);
    messageView = self->_messageView;
    self->_messageView = v3;

    double v5 = [(SUUIRedeemResultsViewController *)self redeem];
    double v6 = [v5 inAppPurchase];

    if (v6)
    {
      double v7 = [(SUUIRedeemStepViewController *)self clientContext];
      double v8 = v7;
      if (v7) {
        [v7 localizedStringForKey:@"REDEEM_SUCCESS_MESSAGE_IN_APP" inTable:@"Redeem"];
      }
      else {
      id v11 = +[SUUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_MESSAGE_IN_APP" inBundles:0 inTable:@"Redeem"];
      }
    }
    else
    {
      double v8 = [(SUUIRedeemResultsViewController *)self redeem];
      double v9 = [v8 title];
      double v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        double v12 = [(SUUIRedeemStepViewController *)self clientContext];
        double v13 = v12;
        if (v12) {
          [v12 localizedStringForKey:@"REDEEM_SUCCESS_MESSAGE" inTable:@"Redeem"];
        }
        else {
        id v11 = +[SUUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_MESSAGE" inBundles:0 inTable:@"Redeem"];
        }
      }
    }

    [(SUUIRedeemResultMessageView *)self->_messageView setTitle:v11];
    [(SUUIRedeemNativeResultsViewController *)self _reloadResultViewMessage];
  }
  double v14 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:self->_messageView];
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v14, "setContentInsets:", -5.0, 0.0, -3.0, 0.0);
  return v14;
}

- (id)_resultImageViewSection
{
  id v3 = (void *)MEMORY[0x263F827E8];
  double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v3 imageNamed:@"RedemptionCardStack" inBundle:v4];

  double v6 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
  double v7 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:v6];
  [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
  double v9 = v8;
  [v6 bounds];
  float v11 = (v9 - v10) * 0.5;
  double v12 = floorf(v11);
  double v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  float v15 = 54.0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    float v15 = 27.0;
  }
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v7, "setContentInsets:", -0.0, v12, (float)-v15, 0.0);

  return v7;
}

- (id)_linksSection
{
  v2 = [(SUUIRedeemResultsViewController *)self redeem];
  id v3 = [v2 links];

  if ([v3 count]) {
    double v4 = [[SUUIRedeemResultLinksTableViewSection alloc] initWithLinks:v3];
  }
  else {
    double v4 = 0;
  }

  return v4;
}

- (id)_item
{
  id v3 = [(SUUIRedeemResultsViewController *)self redeem];
  double v4 = [v3 items];
  if ([v4 count])
  {
    double v5 = [(SUUIRedeemResultsViewController *)self redeem];
    double v6 = [v5 items];
    double v7 = [v6 objectAtIndex:0];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_itemView
{
  id v3 = [(SUUIRedeemNativeResultsViewController *)self _item];
  if (v3 && !self->_itemView)
  {
    double v4 = [SUUIGiftItemView alloc];
    double v5 = [(SUUIRedeemStepViewController *)self clientContext];
    double v6 = [(SUUIGiftItemView *)v4 initWithStyle:3 item:v3 clientContext:v5];
    itemView = self->_itemView;
    self->_itemView = v6;

    double v8 = self->_itemView;
    double v9 = [v3 artistName];
    [(SUUIGiftItemView *)v8 setArtistName:v9];

    double v10 = self->_itemView;
    float v11 = [v3 categoryName];
    [(SUUIGiftItemView *)v10 setCategoryName:v11];

    double v12 = self->_itemView;
    if (self->_itemImage)
    {
      -[SUUIGiftItemView setItemImage:](self->_itemView, "setItemImage:");
    }
    else
    {
      double v13 = [(SUUIGiftItemView *)self->_itemView artworkContext];
      uint64_t v14 = [v13 placeholderImageForItem:v3];
      [(SUUIGiftItemView *)v12 setItemImage:v14];
    }
    -[SUUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", [v3 numberOfUserRatings]);
    float v15 = self->_itemView;
    double v16 = [v3 primaryItemOffer];
    uint64_t v17 = [v16 buttonText];
    [(SUUIGiftItemView *)v15 setPrice:v17];

    double v18 = self->_itemView;
    double v19 = [v3 title];
    [(SUUIGiftItemView *)v18 setTitle:v19];

    uint64_t v20 = self->_itemView;
    [v3 userRating];
    *(float *)&double v22 = v21 / 5.0;
    [(SUUIGiftItemView *)v20 setUserRating:v22];
    objc_super v23 = self->_itemView;
    id v24 = -[SUUIItemStateCenter stateForItemWithIdentifier:](self->_itemStateCenter, "stateForItemWithIdentifier:", [v3 itemIdentifier]);
    [(SUUIGiftItemView *)v23 setItemState:v24];

    double v25 = [(SUUIGiftItemView *)self->_itemView itemOfferButton];
    [v25 addTarget:self action:sel__openAction_ forControlEvents:64];
  }
  double v26 = self->_itemView;

  return v26;
}

- (id)_passbookLearnMoreSection
{
  if (!self->_passbookLockup)
  {
    id v3 = [SUUIRedeemITunesPassLockup alloc];
    double v4 = [(SUUIRedeemStepViewController *)self configuration];
    double v5 = [v4 ITunesPassConfiguration];
    double v6 = [(SUUIRedeemStepViewController *)self clientContext];
    double v7 = [(SUUIRedeemITunesPassLockup *)v3 initWithITunesPassConfiguration:v5 clientContext:v6];
    passbookLockup = self->_passbookLockup;
    self->_passbookLockup = v7;

    [(SUUIRedeemITunesPassLockup *)self->_passbookLockup addTarget:self action:sel__passbookLockupAction_ forControlEvents:64];
    [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
    double v10 = v9;
    float v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    double v13 = 60.0;
    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      double v13 = 30.0;
    }
    double v14 = v10 - v13;
    [(SUUIRedeemITunesPassLockup *)self->_passbookLockup frame];
    double v16 = v15;
    double v18 = v17;
    -[SUUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v14, 1.79769313e308);
    -[SUUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v16, v18, v14, v19);
  }
  uint64_t v20 = [[SUUIRedeemResultSimpleTableViewSection alloc] initWithView:self->_passbookLockup];
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v20, "setContentInsets:", 0.0, 30.0, 0.0, 30.0);
  return v20;
}

- (void)_reloadResultViewMessage
{
  id v3 = [(SUUIRedeemNativeResultsViewController *)self _item];
  double v4 = [(SUUIRedeemResultsViewController *)self redeem];
  double v5 = v4;
  if (v3)
  {
    double v6 = [v4 inAppPurchase];

    if (v6)
    {
      double v7 = [(SUUIRedeemResultsViewController *)self redeem];
      uint64_t v8 = [v7 inAppPurchase];
LABEL_4:
      double v39 = (__CFString *)v8;
      goto LABEL_23;
    }
    uint64_t v12 = [v3 itemKind];
    if ((unint64_t)(v12 - 1) > 0x10) {
      double v13 = @"UNKNOWN";
    }
    else {
      double v13 = off_265404190[v12 - 1];
    }
    double v14 = +[SUUIItemStateCenter defaultCenter];
    double v15 = objc_msgSend(v14, "stateForItemWithIdentifier:", objc_msgSend(v3, "itemIdentifier"));
    uint64_t v16 = [v15 state];

    [(SUUIRedeemNativeResultsViewController *)self setCurrentItemStateFlag:[(SUUIRedeemNativeResultsViewController *)self currentItemStateFlag] | v16];
    char v17 = [(SUUIRedeemNativeResultsViewController *)self currentItemStateFlag];
    if ((v17 & 0x44) != 0)
    {
      double v7 = [(SUUIRedeemStepViewController *)self clientContext];
      double v18 = @"REDEEM_SUCCESS_INSTALLED_";
      goto LABEL_14;
    }
    uint64_t v25 = v17 & 3;
    BOOL IsSoftwareKind = SUUIItemKindIsSoftwareKind([v3 itemKind]);
    BOOL v27 = IsSoftwareKind;
    if (v25)
    {
      double v7 = [(SUUIRedeemStepViewController *)self clientContext];
      if (v27) {
        double v18 = @"REDEEM_SUCCESS_INSTALLING_";
      }
      else {
        double v18 = @"REDEEM_SUCCESS_DOWNLOADING_";
      }
LABEL_14:
      double v19 = [(__CFString *)v18 stringByAppendingString:v13];
      if (v7) {
        [v7 localizedStringForKey:v19 inTable:@"Redeem"];
      }
      else {
      double v39 = +[SUUIClientContext localizedStringForKey:v19 inBundles:0 inTable:@"Redeem"];
      }

      goto LABEL_23;
    }
    if (IsSoftwareKind)
    {
      BOOL IsTVOnly = SUUIItemDeviceFamilyIsTVOnly([v3 deviceFamilies]);
      uint64_t v36 = [(SUUIRedeemStepViewController *)self clientContext];
      double v7 = (void *)v36;
      if (IsTVOnly)
      {
        if (v36)
        {
          v37 = @"REDEEM_SUCCESS_TV_INSTALL";
LABEL_36:
          uint64_t v8 = [v7 localizedStringForKey:v37 inTable:@"Redeem"];
          goto LABEL_4;
        }
        uint64_t v38 = @"REDEEM_SUCCESS_TV_INSTALL";
      }
      else
      {
        if (v36)
        {
          v37 = @"REDEEM_SUCCESS_PREPARE_TO_INSTALL";
          goto LABEL_36;
        }
        uint64_t v38 = @"REDEEM_SUCCESS_PREPARE_TO_INSTALL";
      }
    }
    else
    {
      double v7 = [(SUUIRedeemStepViewController *)self clientContext];
      if (v7)
      {
        v37 = @"REDEEM_SUCCESS_PREPARE_TO_DOWNLOAD";
        goto LABEL_36;
      }
      uint64_t v38 = @"REDEEM_SUCCESS_PREPARE_TO_DOWNLOAD";
    }
    uint64_t v8 = +[SUUIClientContext localizedStringForKey:v38 inBundles:0 inTable:@"Redeem"];
    goto LABEL_4;
  }
  double v9 = [v4 credit];

  if (!v9)
  {
    double v39 = &stru_2704F8130;
    [(SUUIRedeemResultMessageView *)self->_messageView setMessage:&stru_2704F8130];
    goto LABEL_24;
  }
  double v10 = [(SUUIRedeemStepViewController *)self clientContext];
  float v11 = v10;
  if (v10) {
    [v10 localizedStringForKey:@"REDEEM_SUCCESS_CREDIT_FORMAT" inTable:@"Redeem"];
  }
  else {
  double v7 = +[SUUIClientContext localizedStringForKey:@"REDEEM_SUCCESS_CREDIT_FORMAT" inBundles:0 inTable:@"Redeem"];
  }

  uint64_t v20 = NSString;
  float v21 = [(SUUIRedeemResultsViewController *)self redeem];
  double v22 = [v21 credit];
  objc_super v23 = [(SUUIRedeemResultsViewController *)self redeem];
  id v24 = [v23 balance];
  double v39 = [v20 stringWithValidatedFormat:v7, @"%@%@", 0, v22, v24 validFormatSpecifiers error];

LABEL_23:
  [(SUUIRedeemResultMessageView *)self->_messageView setMessage:v39];
LABEL_24:
  [(SUUIRedeemResultMessageView *)self->_messageView frame];
  double v29 = v28;
  double v31 = v30;
  messageView = self->_messageView;
  [(SUUIRedeemNativeResultsViewController *)self _tableWidth];
  -[SUUIRedeemResultMessageView sizeThatFits:](messageView, "sizeThatFits:");
  -[SUUIRedeemResultMessageView setFrame:](self->_messageView, "setFrame:", v29, v31, v33, v34);
}

- (double)_tableWidth
{
  id v3 = [(SUUIRedeemNativeResultsViewController *)self traitCollection];
  double v4 = [MEMORY[0x263F82670] currentDevice];
  if ([v4 userInterfaceIdiom]
    || [(SUUIRedeemNativeResultsViewController *)self interfaceOrientation] == 1)
  {
  }
  else
  {
    uint64_t v11 = [v3 verticalSizeClass];

    if (v11 != 2)
    {
      double v7 = 414.0;
      goto LABEL_7;
    }
  }
  double v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v7 = 540.0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 bounds];
    double v7 = v9;
  }
LABEL_7:

  return v7;
}

- (void)_reloadSections
{
  id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(SUUIRedeemResultsViewController *)self redeem];
  double v4 = [v3 thankYouDictionary];

  if (v4)
  {
    double v5 = [(SUUIRedeemNativeResultsViewController *)self _item];

    if (v5)
    {
      uint64_t v6 = [(SUUIRedeemResultsViewController *)self redeem];
      double v7 = [v6 headerArtworkProvider];
      uint64_t v8 = [v7 smallestArtwork];

      if (!v8 || ([v8 size], v9 < 150.0))
      {
        double v10 = [(SUUIRedeemNativeResultsViewController *)self _emptySection];
        uint64_t v11 = [MEMORY[0x263F82670] currentDevice];
        [v11 userInterfaceIdiom];

        __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v12, v55, v10);
      }
      double v13 = [(SUUIRedeemNativeResultsViewController *)self _headerImageViewSection];
      double v14 = [MEMORY[0x263F82670] currentDevice];
      [v14 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v15, v55, v13);
      uint64_t v16 = [(SUUIRedeemNativeResultsViewController *)self _messageViewSection];
      char v17 = [MEMORY[0x263F82670] currentDevice];
      [v17 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v18, v55, v16);
      double v19 = [(SUUIRedeemNativeResultsViewController *)self _itemViewSection];
      uint64_t v20 = [MEMORY[0x263F82670] currentDevice];
      [v20 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v21, v55, v19);
    }
    else
    {
      double v28 = [(SUUIRedeemNativeResultsViewController *)self _emptySection];
      double v29 = [MEMORY[0x263F82670] currentDevice];
      [v29 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v30, v55, v28);
      double v31 = [(SUUIRedeemNativeResultsViewController *)self _resultImageViewSection];
      double v32 = [MEMORY[0x263F82670] currentDevice];
      [v32 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v33, v55, v31);
      uint64_t v8 = [(SUUIRedeemNativeResultsViewController *)self _messageViewSection];
      double v34 = [MEMORY[0x263F82670] currentDevice];
      [v34 userInterfaceIdiom];

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v35, v55, v8);
    }

    uint64_t v36 = [(SUUIRedeemNativeResultsViewController *)self _extendedMessageViewSection];
    v37 = [MEMORY[0x263F82670] currentDevice];
    [v37 userInterfaceIdiom];

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v38, v55, v36);
    double v39 = [(SUUIRedeemNativeResultsViewController *)self _linksSection];
    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, (uint64_t)v39, v55, v39);

    v40 = [(SUUIRedeemNativeResultsViewController *)self _emptySection];
    v41 = [MEMORY[0x263F82670] currentDevice];
    [v41 userInterfaceIdiom];

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v42, v55, v40);
LABEL_18:

    goto LABEL_19;
  }
  double v22 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v24 = [(SUUIRedeemNativeResultsViewController *)self _emptySection];
    uint64_t v25 = [MEMORY[0x263F82670] currentDevice];
    [v25 userInterfaceIdiom];

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v26, v55, v24);
  }
  BOOL v27 = [(SUUIRedeemNativeResultsViewController *)self _item];

  if (v27) {
    [(SUUIRedeemNativeResultsViewController *)self _itemViewSection];
  }
  else {
  v43 = [(SUUIRedeemNativeResultsViewController *)self _resultImageViewSection];
  }
  v44 = [MEMORY[0x263F82670] currentDevice];
  [v44 userInterfaceIdiom];

  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v45, v55, v43);
  v46 = [(SUUIRedeemNativeResultsViewController *)self _messageViewSection];
  v47 = [MEMORY[0x263F82670] currentDevice];
  [v47 userInterfaceIdiom];

  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v48, v55, v46);
  v49 = [(SUUIRedeemNativeResultsViewController *)self _anotherButtonSection];
  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(2.0, (uint64_t)v49, v55, v49);

  if ([(SUUIRedeemStepViewController *)self shouldShowPassbookLearnMore])
  {
    v40 = [(SUUIRedeemNativeResultsViewController *)self _passbookLearnMoreSection];
    v50 = [MEMORY[0x263F82B60] mainScreen];
    uint64_t v51 = [v50 bounds];
    double v52 = 11.0;
    if (v53 > 480.0) {
      double v52 = 30.0;
    }
    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(v52, v51, v55, v40);

    goto LABEL_18;
  }
LABEL_19:
  v54 = [(SUUIRedeemNativeResultsViewController *)self view];
  [v54 setSections:v55];
}

void __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [v7 lastObject];
    if (v9)
    {
      [v9 contentInsets];
      objc_msgSend(v9, "setContentInsets:");
    }
    [v6 contentInsets];
    [v6 setContentInsets:v8 + a1];
    [v7 addObject:v6];
  }
}

- (void)_setItemImage:(id)a3
{
  p_itemImage = &self->_itemImage;
  objc_storeStrong((id *)&self->_itemImage, a3);
  id v6 = a3;
  id v7 = [(SUUIRedeemNativeResultsViewController *)self _itemView];
  [v7 setItemImage:*p_itemImage];
}

- (void)_setHeaderImage:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (UIButton)anotherButton
{
  return self->_anotherButton;
}

- (void)setAnotherButton:(id)a3
{
}

- (SUUITextLayout)extendedMessageTextLayout
{
  return self->_extendedMessageTextLayout;
}

- (void)setExtendedMessageTextLayout:(id)a3
{
}

- (SUUITextBoxView)extendedMessageView
{
  return self->_extendedMessageView;
}

- (void)setExtendedMessageView:(id)a3
{
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (void)setItemImage:(id)a3
{
}

- (SUUIItemStateCenter)itemStateCenter
{
  return self->_itemStateCenter;
}

- (void)setItemStateCenter:(id)a3
{
}

- (SUUIGiftItemView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
}

- (SUUIRedeemResultMessageView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (SUUIRedeemITunesPassLockup)passbookLockup
{
  return self->_passbookLockup;
}

- (void)setPassbookLockup:(id)a3
{
}

- (unint64_t)currentItemStateFlag
{
  return self->_currentItemStateFlag;
}

- (void)setCurrentItemStateFlag:(unint64_t)a3
{
  self->_currentItemStateFlag = a3;
}

- (BOOL)extendedMessageIsExpanded
{
  return self->_extendedMessageIsExpanded;
}

- (void)setExtendedMessageIsExpanded:(BOOL)a3
{
  self->_extendedMessageIsExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passbookLockup, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_extendedMessageView, 0);
  objc_storeStrong((id *)&self->_extendedMessageTextLayout, 0);
  objc_storeStrong((id *)&self->_anotherButton, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end