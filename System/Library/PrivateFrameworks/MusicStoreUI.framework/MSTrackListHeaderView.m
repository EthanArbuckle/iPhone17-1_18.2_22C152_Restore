@interface MSTrackListHeaderView
- (CGSize)_sizeThatFitsLabel:(id)a3 size:(CGSize)a4 numberOfLines:(int64_t)a5;
- (MSTrackListHeaderDelegate)delegate;
- (MSTrackListHeaderView)initWithFrame:(CGRect)a3;
- (SUItem)item;
- (UIImage)artworkImage;
- (id)_newGenericSmallFontLabel;
- (void)_hidePurchaseConfirmation;
- (void)_offerButtonAction:(id)a3;
- (void)_performPurchaseAnimation;
- (void)_reloadAlbumLabel;
- (void)_reloadArtistLabel;
- (void)_reloadArtworkView;
- (void)_reloadDisclaimerLabel;
- (void)_reloadItemCountLabel;
- (void)_reloadOfferButton;
- (void)_reloadReleaseDateLabel;
- (void)_setShowingPurchaseConfirmation:(BOOL)a3;
- (void)_showPurchaseConfirmation;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadView;
- (void)setArtworkImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)sizeToFit;
@end

@implementation MSTrackListHeaderView

- (MSTrackListHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSTrackListHeaderView;
  v3 = -[MSTrackListHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__purchasesChangedNotification_ name:*MEMORY[0x263F89780] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F89780] object:0];

  self->_artworkImage = 0;
  self->_item = 0;
  [(UILabel *)self->_albumLabel removeFromSuperview];

  self->_albumLabel = 0;
  [(UILabel *)self->_artistLabel removeFromSuperview];

  self->_artistLabel = 0;
  [(UILabel *)self->_disclaimerLabel removeFromSuperview];

  self->_disclaimerLabel = 0;
  [(UILabel *)self->_itemCountLabel removeFromSuperview];

  self->_itemCountLabel = 0;
  [(UILabel *)self->_releaseDateLabel removeFromSuperview];

  self->_releaseDateLabel = 0;
  [(SUReflectionImageView *)self->_artworkView removeFromSuperview];

  self->_artworkView = 0;
  [(SUItemOfferButton *)self->_offerButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(SUItemOfferButton *)self->_offerButton removeFromSuperview];

  self->_offerButton = 0;
  [(SUTouchCaptureView *)self->_touchCaptureView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(SUTouchCaptureView *)self->_touchCaptureView removeFromSuperview];

  self->_touchCaptureView = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSTrackListHeaderView;
  [(MSTrackListHeaderView *)&v4 dealloc];
}

- (void)reloadView
{
  [(MSTrackListHeaderView *)self _reloadAlbumLabel];
  [(MSTrackListHeaderView *)self _reloadArtistLabel];
  [(MSTrackListHeaderView *)self _reloadArtworkView];
  [(MSTrackListHeaderView *)self _reloadDisclaimerLabel];
  [(MSTrackListHeaderView *)self _reloadItemCountLabel];
  [(MSTrackListHeaderView *)self _reloadOfferButton];
  [(MSTrackListHeaderView *)self _reloadReleaseDateLabel];
  [(MSTrackListHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(MSTrackListHeaderView *)self bounds];
  double v4 = v3;
  artworkView = self->_artworkView;
  if (artworkView)
  {
    [(SUReflectionImageView *)artworkView frame];
    -[SUReflectionImageView setFrame:](self->_artworkView, "setFrame:", 7.0, 7.0);
  }
  double v6 = v4 + -7.0;
  double v7 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  albumLabel = self->_albumLabel;
  if (albumLabel)
  {
    [(UILabel *)albumLabel frame];
    -[UILabel setFont:](self->_albumLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:20.0]);
    -[MSTrackListHeaderView _sizeThatFitsLabel:size:numberOfLines:](self, "_sizeThatFitsLabel:size:numberOfLines:", self->_albumLabel, 2, v6 + -102.0, 1.79769313e308);
    double v46 = v11;
    double v47 = v12;
    double v13 = v12 + 0.0;
    double v42 = 102.0;
  }
  else
  {
    double v13 = 0.0;
    double v46 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v47 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v42 = *MEMORY[0x263F001A8];
  }
  artistLabel = self->_artistLabel;
  if (artistLabel)
  {
    [(UILabel *)artistLabel frame];
    double v16 = v15;
    double v17 = v6 + -102.0;
    double v13 = v13 + v15;
    double v18 = 102.0;
  }
  else
  {
    double v16 = v8;
    double v17 = v9;
    double v18 = v7;
  }
  itemCountLabel = self->_itemCountLabel;
  if (itemCountLabel)
  {
    [(UILabel *)itemCountLabel frame];
    double v44 = v6 + -102.0;
    double v45 = v20;
    double v13 = v13 + v20;
    double v43 = 102.0;
  }
  else
  {
    double v44 = v9;
    double v45 = v8;
    double v43 = v7;
  }
  double v49 = v7;
  double v50 = v8;
  releaseDateLabel = self->_releaseDateLabel;
  double v48 = v6;
  double v22 = v9;
  if (releaseDateLabel)
  {
    [(UILabel *)releaseDateLabel frame];
    double v24 = v23;
    double v25 = v6 + -102.0;
    double v13 = v13 + v23;
    double v7 = 102.0;
  }
  else
  {
    double v25 = v9;
    double v24 = v50;
  }
  offerButton = self->_offerButton;
  if (offerButton)
  {
    [(SUItemOfferButton *)offerButton frame];
    double v22 = v27;
    double v50 = v28;
    double v13 = v13 + v28;
    double v49 = 103.0;
  }
  float v29 = (88.0 - v13) * 0.5;
  double MaxY = fmaxf(floorf(v29) + 7.0, 7.0);
  v31 = self->_artistLabel;
  if (v31)
  {
    -[UILabel setFrame:](v31, "setFrame:", v18, MaxY, v17, v16);
    v52.origin.x = v18;
    v52.origin.y = MaxY;
    v52.size.width = v17;
    v52.size.height = v16;
    double MaxY = CGRectGetMaxY(v52);
  }
  v32 = self->_albumLabel;
  if (v32)
  {
    -[UILabel setFrame:](v32, "setFrame:", v42, MaxY, v46, v47);
    v53.origin.x = v42;
    v53.origin.y = MaxY;
    v53.size.width = v46;
    v53.size.height = v47;
    double MaxY = CGRectGetMaxY(v53);
  }
  v33 = self->_releaseDateLabel;
  if (v33)
  {
    -[UILabel setFrame:](v33, "setFrame:", v7, MaxY, v25, v24);
    v54.origin.x = v7;
    v54.origin.y = MaxY;
    v54.size.width = v25;
    v54.size.height = v24;
    double MaxY = CGRectGetMaxY(v54);
  }
  v34 = self->_itemCountLabel;
  if (v34)
  {
    -[UILabel setFrame:](v34, "setFrame:", v43, MaxY, v44, v45);
    v55.origin.x = v43;
    v55.origin.y = MaxY;
    v55.size.width = v44;
    v55.size.height = v45;
    double MaxY = CGRectGetMaxY(v55);
  }
  v35 = self->_offerButton;
  if (v35)
  {
    -[SUItemOfferButton setFrame:](v35, "setFrame:", v49, MaxY + 2.0, v22, v50);
    v56.origin.x = v49;
    v56.origin.y = MaxY + 2.0;
    v56.size.width = v22;
    v56.size.height = v50;
    double MaxY = CGRectGetMaxY(v56);
  }
  disclaimerLabel = self->_disclaimerLabel;
  if (disclaimerLabel)
  {
    double v37 = 95.0;
    if (MaxY >= 95.0) {
      double v37 = MaxY;
    }
    if (self->_artworkView) {
      double v38 = v37;
    }
    else {
      double v38 = MaxY;
    }
    [(UILabel *)disclaimerLabel frame];
    -[UILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v48 + -7.0, 1.79769313e308);
    v41 = self->_disclaimerLabel;
    -[UILabel setFrame:](v41, "setFrame:", 7.0, v38 + 7.0, v39, v40);
  }
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListHeaderView;
  -[MSTrackListHeaderView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  objc_msgSend((id)-[MSTrackListHeaderView subviews](self, "subviews"), "makeObjectsPerformSelector:withObject:", sel_setBackgroundColor_, a3);
}

- (void)sizeToFit
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(MSTrackListHeaderView *)self layoutIfNeeded];
  [(MSTrackListHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  disclaimerLabel = self->_disclaimerLabel;
  if (disclaimerLabel)
  {
    [(UILabel *)disclaimerLabel frame];
    double v10 = CGRectGetMaxY(v24) + 7.0;
  }
  else
  {
    double v11 = (void *)[(MSTrackListHeaderView *)self subviews];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(SUReflectionImageView **)(*((void *)&v18 + 1) + 8 * i);
          [(SUReflectionImageView *)v16 frame];
          double v17 = CGRectGetMaxY(v25) + 8.0;
          if (v16 == self->_artworkView) {
            double v17 = 103.0;
          }
          if (v10 < v17) {
            double v10 = v17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
    else
    {
      double v10 = 0.0;
    }
  }
  -[MSTrackListHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)_offerButtonAction:(id)a3
{
  if (([(SUItemOfferButton *)self->_offerButton isShowingConfirmation] & 1) != 0
    || ![(SUItemOfferButton *)self->_offerButton shouldShowConfirmation])
  {
    double v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F895D8], "sharedController"), "clientInterface"), "purchaseManager");
    [v4 beginUpdates];
    double v5 = objc_msgSend(v4, "newPurchaseBatchForItems:offers:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", self->_item), 0);
    [v5 setPurchaseManager:v4];
    if ([v4 addPurchaseBatch:v5])
    {
      [(MSTrackListHeaderView *)self _performPurchaseAnimation];
      [(MSTrackListHeaderView *)self _reloadOfferButton];
      [(MSTrackListHeaderView *)self setNeedsLayout];
    }
    else
    {
      [(MSTrackListHeaderView *)self _hidePurchaseConfirmation];
    }

    [v4 endUpdates];
  }
  else
  {
    [(MSTrackListHeaderView *)self _showPurchaseConfirmation];
  }
}

- (void)_hidePurchaseConfirmation
{
}

- (id)_newGenericSmallFontLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  objc_msgSend(v3, "setBackgroundColor:", -[MSTrackListHeaderView backgroundColor](self, "backgroundColor"));
  objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 10.0));
  objc_msgSend(v3, "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.5, 1.0));
  return v3;
}

- (void)_performPurchaseAnimation
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:self->_artworkImage];
  [v5 frame];
  [(SUReflectionImageView *)self->_artworkView frame];
  objc_msgSend(v5, "setFrame:");
  LODWORD(v3) = 1051931443;
  LODWORD(v4) = 1051931443;
  [MEMORY[0x263F89670] performHopAnimationForView:v5 relativeToView:self finalAlpha:v3 scale:v4];
}

- (void)_reloadAlbumLabel
{
  double v3 = (void *)[(SUItem *)self->_item unmodifiedTitle];
  uint64_t v4 = [v3 length];
  albumLabel = self->_albumLabel;
  if (v4)
  {
    if (!albumLabel)
    {
      double v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      self->_albumLabel = v6;
      [(UILabel *)v6 setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_albumLabel setBackgroundColor:[(MSTrackListHeaderView *)self backgroundColor]];
      [(UILabel *)self->_albumLabel setBaselineAdjustment:1];
      -[UILabel setFont:](self->_albumLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:20.0]);
      [(UILabel *)self->_albumLabel setMinimumScaleFactor:0.75];
      [(UILabel *)self->_albumLabel setNumberOfLines:0];
      -[UILabel setTextColor:](self->_albumLabel, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
      [(MSTrackListHeaderView *)self addSubview:self->_albumLabel];
      albumLabel = self->_albumLabel;
    }
  }
  else
  {
    [(UILabel *)albumLabel removeFromSuperview];

    albumLabel = 0;
    self->_albumLabel = 0;
  }
  [(UILabel *)albumLabel setText:v3];
  double v7 = self->_albumLabel;
  [(UILabel *)v7 sizeToFit];
}

- (void)_reloadArtistLabel
{
  double v3 = (void *)[(SUItem *)self->_item artistName];
  uint64_t v4 = [v3 length];
  artistLabel = self->_artistLabel;
  if (v4)
  {
    if (!artistLabel)
    {
      self->_artistLabel = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      [(UILabel *)self->_artistLabel setBackgroundColor:[(MSTrackListHeaderView *)self backgroundColor]];
      -[UILabel setFont:](self->_artistLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:15.0]);
      -[UILabel setTextColor:](self->_artistLabel, "setTextColor:", [MEMORY[0x263F1C550] blackColor]);
      [(MSTrackListHeaderView *)self addSubview:self->_artistLabel];
      artistLabel = self->_artistLabel;
    }
  }
  else
  {
    [(UILabel *)artistLabel removeFromSuperview];

    artistLabel = 0;
    self->_artistLabel = 0;
  }
  [(UILabel *)artistLabel setText:v3];
  double v6 = self->_artistLabel;
  [(UILabel *)v6 sizeToFit];
}

- (void)_reloadArtworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    uint64_t v4 = (SUReflectionImageView *)objc_alloc_init(MEMORY[0x263F89680]);
    self->_artworkView = v4;
    [(SUReflectionImageView *)v4 setReflectionAlphaWhenVisible:0.4];
    -[SUReflectionImageView setFrame:](self->_artworkView, "setFrame:", 0.0, 0.0, 88.0, 88.0);
    [(MSTrackListHeaderView *)self addSubview:self->_artworkView];
    artworkView = self->_artworkView;
  }
  artworkImage = self->_artworkImage;
  [(SUReflectionImageView *)artworkView setImage:artworkImage];
}

- (void)_reloadDisclaimerLabel
{
  double v3 = (void *)[(SUItem *)self->_item disclaimerString];
  uint64_t v4 = [v3 length];
  disclaimerLabel = self->_disclaimerLabel;
  if (v4)
  {
    if (!disclaimerLabel)
    {
      double v6 = [(MSTrackListHeaderView *)self _newGenericSmallFontLabel];
      self->_disclaimerLabel = v6;
      -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
      [(UILabel *)self->_disclaimerLabel setNumberOfLines:0];
      [(MSTrackListHeaderView *)self addSubview:self->_disclaimerLabel];
      disclaimerLabel = self->_disclaimerLabel;
    }
  }
  else
  {
    [(UILabel *)disclaimerLabel removeFromSuperview];

    disclaimerLabel = 0;
    self->_disclaimerLabel = 0;
  }
  [(UILabel *)disclaimerLabel setText:v3];
}

- (void)_reloadItemCountLabel
{
  double v3 = (void *)[(SUItem *)self->_item valueForProperty:@"content-count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (void *)[v3 objectForKey:@"label"];
  }
  else {
    uint64_t v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    itemCountLabel = self->_itemCountLabel;
    if (!itemCountLabel)
    {
      double v6 = [(MSTrackListHeaderView *)self _newGenericSmallFontLabel];
      self->_itemCountLabel = v6;
      [(MSTrackListHeaderView *)self addSubview:v6];
      itemCountLabel = self->_itemCountLabel;
    }
  }
  else
  {
    [(UILabel *)self->_itemCountLabel removeFromSuperview];

    itemCountLabel = 0;
    self->_itemCountLabel = 0;
  }
  [(UILabel *)itemCountLabel setText:v4];
  double v7 = self->_itemCountLabel;
  [(UILabel *)v7 sizeToFit];
}

- (void)_reloadOfferButton
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F895D8], "sharedController"), "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchased:", -[SUItem itemIdentifier](self->_item, "itemIdentifier")) & 1) != 0|| !objc_msgSend((id)objc_msgSend((id)-[SUItem defaultStoreOffer](self->_item, "defaultStoreOffer"), "priceDisplay"), "length"))
  {
    [(SUItemOfferButton *)self->_offerButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [(SUItemOfferButton *)self->_offerButton removeFromSuperview];

    offerButton = 0;
    self->_offerButton = 0;
  }
  else
  {
    offerButton = self->_offerButton;
    if (!offerButton)
    {
      uint64_t v4 = (SUItemOfferButton *)objc_alloc_init(MEMORY[0x263F89610]);
      self->_offerButton = v4;
      [(SUItemOfferButton *)v4 addTarget:self action:sel__offerButtonAction_ forControlEvents:64];
      LODWORD(v5) = -1097229926;
      [(SUItemOfferButton *)self->_offerButton setCharge:v5];
      [(MSTrackListHeaderView *)self addSubview:self->_offerButton];
      offerButton = self->_offerButton;
    }
  }
  [(SUItemOfferButton *)offerButton configureForItem:self->_item offer:[(SUItem *)self->_item defaultStoreOffer]];
  double v6 = self->_offerButton;
  [(SUItemOfferButton *)v6 sizeToFit];
}

- (void)_reloadReleaseDateLabel
{
  int v3 = objc_msgSend((id)-[SUItem defaultStoreOffer](self->_item, "defaultStoreOffer"), "isPreorder");
  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  id v12 = (id)[(SUItem *)self->_item copyReleaseDateStringWithStyle:v4];
  uint64_t v5 = [v12 length];
  releaseDateLabel = self->_releaseDateLabel;
  if (v5)
  {
    if (!releaseDateLabel)
    {
      double v7 = [(MSTrackListHeaderView *)self _newGenericSmallFontLabel];
      self->_releaseDateLabel = v7;
      [(MSTrackListHeaderView *)self insertSubview:v7 atIndex:0];
    }
  }
  else
  {
    [(UILabel *)releaseDateLabel removeFromSuperview];

    self->_releaseDateLabel = 0;
  }
  double v8 = self->_releaseDateLabel;
  double v9 = NSString;
  double v10 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v3) {
    double v11 = @"PRODUCT_PAGE_EXPECTED_RELEASE_DATE";
  }
  else {
    double v11 = @"RELEASE_DATE";
  }
  -[UILabel setText:](v8, "setText:", objc_msgSend(v9, "stringWithFormat:", objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_26EA927B8, 0), v12));
  [(UILabel *)self->_releaseDateLabel sizeToFit];
}

- (void)_setShowingPurchaseConfirmation:(BOOL)a3
{
  [(id)objc_opt_class() defaultAnimationDuration];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke;
  v7[3] = &unk_264CE89C0;
  v7[4] = self;
  BOOL v8 = a3;
  v7[5] = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke_2;
  v6[3] = &unk_264CE89E8;
  v6[4] = self;
  objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:animations:completion:", v7, v6);
}

uint64_t __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) setShowingConfirmation:*(unsigned __int8 *)(a1 + 48) duration:*(double *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutSubviews];
}

void __57__MSTrackListHeaderView__setShowingPurchaseConfirmation___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 480) isShowingConfirmation] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 488) removeTarget:*(void *)(a1 + 32) action:0 forControlEvents:0xFFFFFFFFLL];
    [*(id *)(*(void *)(a1 + 32) + 488) removeFromSuperview];

    *(void *)(*(void *)(a1 + 32) + 488) = 0;
  }
}

- (void)_showPurchaseConfirmation
{
  int v3 = (void *)[(MSTrackListHeaderView *)self window];
  id v4 = objc_alloc(MEMORY[0x263F896D0]);
  [v3 bounds];
  uint64_t v5 = (SUTouchCaptureView *)objc_msgSend(v4, "initWithFrame:");
  self->_touchCaptureView = v5;
  [(SUTouchCaptureView *)v5 addTarget:self action:sel__touchCaptureAction_ forControlEvents:1];
  -[SUTouchCaptureView setPassThroughViews:](self->_touchCaptureView, "setPassThroughViews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_offerButton, 0));
  [v3 addSubview:self->_touchCaptureView];
  [(MSTrackListHeaderView *)self _setShowingPurchaseConfirmation:1];
}

- (CGSize)_sizeThatFitsLabel:(id)a3 size:(CGSize)a4 numberOfLines:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a5 > 1)
  {
    [a3 setNumberOfLines:1];
    objc_msgSend(a3, "sizeThatFits:", width, height);
    double v13 = v12;
    [a3 setNumberOfLines:0];
    objc_msgSend(a3, "sizeThatFits:", width, height);
    double v10 = v14;
    double v16 = v15;
    if ([a3 adjustsFontSizeToFitWidth])
    {
      objc_msgSend((id)objc_msgSend(a3, "font"), "pointSize");
      double v18 = v17;
      [a3 minimumScaleFactor];
      *(float *)&double v19 = v18 * v19;
      double v20 = ceilf(*(float *)&v19);
      if (v16 > v13 + v13 && v18 > v20)
      {
        do
        {
          double v18 = v18 + -1.0;
          objc_msgSend(a3, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", v18));
          objc_msgSend(a3, "sizeThatFits:", width, height);
        }
        while (v23 > v13 + v13 && v18 > v20);
        double v10 = v22;
        double v16 = v23;
      }
    }
    if (v13 * (double)a5 >= v16) {
      double v8 = v16;
    }
    else {
      double v8 = v13 * (double)a5;
    }
  }
  else
  {
    objc_msgSend(a3, "sizeThatFits:", a4.width, a4.height);
    double v10 = v9;
  }
  double v25 = v10;
  result.double height = v8;
  result.double width = v25;
  return result;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
}

- (MSTrackListHeaderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSTrackListHeaderDelegate *)a3;
}

- (SUItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

@end