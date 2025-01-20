@interface SUUIProductPageHeaderView
- (BOOL)isRestricted;
- (NSString)ageBandString;
- (NSString)artistName;
- (NSString)editorialBadge;
- (NSString)inAppPurchasesString;
- (NSString)itemOfferExplanationText;
- (NSString)itemOfferExplanationTitle;
- (NSString)title;
- (SUUIColorScheme)colorScheme;
- (SUUIContentRatingArtworkResourceLoader)contentRatingArtworkLoader;
- (SUUIItemContentRating)contentRating;
- (SUUIItemContentRating)secondaryContentRating;
- (SUUIItemOffer)itemOffer;
- (SUUIItemOfferButton)itemOfferButton;
- (SUUIItemState)itemState;
- (SUUIProductPageHeaderView)initWithClientContext:(id)a3;
- (UIControl)artistButton;
- (UIControl)shareButton;
- (UIImage)headerImage;
- (UIImage)iconImage;
- (double)headerImageHeight;
- (double)userRating;
- (id)contentRatingName;
- (int64_t)numberOfUserRatings;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_finishButtonAnimation;
- (void)_getBottomLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6;
- (void)_getTopLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6;
- (void)_reloadItemOfferButton:(BOOL)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5;
- (void)dealloc;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)setAgeBandString:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setContentRatingArtworkLoader:(id)a3;
- (void)setEditorialBadge:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setHeaderImageHeight:(double)a3;
- (void)setIconImage:(id)a3;
- (void)setInAppPurchasesString:(id)a3;
- (void)setItemOffer:(id)a3;
- (void)setItemOfferExplanationText:(id)a3;
- (void)setItemOfferExplanationTitle:(id)a3;
- (void)setItemState:(id)a3;
- (void)setItemState:(id)a3 animated:(BOOL)a4;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setSecondaryContentRating:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(double)a3;
- (void)sizeToFit;
@end

@implementation SUUIProductPageHeaderView

- (SUUIProductPageHeaderView)initWithClientContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIProductPageHeaderView;
  v6 = [(SUUIProductPageHeaderView *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    if (SUUIUserInterfaceIdiom(v7->_clientContext) == 1)
    {
      v8 = [MEMORY[0x263F827E8] kitImageNamed:@"UIButtonBarAction"];
      v9 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
      shareButton = v7->_shareButton;
      v7->_shareButton = v9;

      LODWORD(v11) = -1.0;
      [(UIButton *)v7->_shareButton setCharge:v11];
      v12 = v7->_shareButton;
      v13 = [(SUUIColorScheme *)v7->_colorScheme secondaryTextColor];
      v14 = v13;
      if (!v13)
      {
        v14 = [(SUUIProductPageHeaderView *)v7 tintColor];
      }
      v15 = [v8 _flatImageWithColor:v14];
      [(UIButton *)v12 setImage:v15 forState:0];

      if (!v13) {
      [(SUUIProductPageHeaderView *)v7 addSubview:v7->_shareButton];
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIItemOfferButton *)self->_itemOfferButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(SUUIItemOfferButton *)self->_itemOfferButton setDelegate:0];
  contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
  if (contentRatingArtworkLoader) {
    [(SUUIContentRatingArtworkResourceLoader *)contentRatingArtworkLoader removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageHeaderView;
  [(SUUIProductPageHeaderView *)&v4 dealloc];
}

- (NSString)ageBandString
{
  return [(UILabel *)self->_ageBandLabel text];
}

- (NSString)artistName
{
  return [(UIButton *)self->_artistButton titleForState:0];
}

- (id)contentRatingName
{
  return [(SUUIItemContentRating *)self->_contentRating contentRatingName];
}

- (NSString)editorialBadge
{
  return (NSString *)[(SUUIBadgeLabel *)self->_editorialBadgeLabel text];
}

- (UIImage)headerImage
{
  return [(UIImageView *)self->_headerImageView image];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

- (NSString)inAppPurchasesString
{
  return [(UILabel *)self->_inAppPurchasesLabel text];
}

- (NSString)itemOfferExplanationText
{
  return [(UILabel *)self->_itemOfferExplanationLabel text];
}

- (NSString)itemOfferExplanationTitle
{
  return [(UILabel *)self->_itemOfferExplanationTitleLabel text];
}

- (void)setAgeBandString:(id)a3
{
  id v19 = a3;
  objc_super v4 = [(SUUIProductPageHeaderView *)self ageBandString];
  char v5 = [v19 isEqualToString:v4];

  id v7 = v19;
  if ((v5 & 1) == 0)
  {
    ageBandLabel = self->_ageBandLabel;
    if (v19)
    {
      if (!ageBandLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v10 = self->_ageBandLabel;
        self->_ageBandLabel = v9;

        double v11 = self->_ageBandLabel;
        v12 = [(SUUIProductPageHeaderView *)self backgroundColor];
        [(UILabel *)v11 setBackgroundColor:v12];

        v13 = self->_ageBandLabel;
        v14 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
        [(UILabel *)v13 setFont:v14];

        v15 = self->_ageBandLabel;
        v16 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v16)
        {
          [(UILabel *)v15 setTextColor:v16];
        }
        else
        {
          v18 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.400000006];
          [(UILabel *)v15 setTextColor:v18];
        }
        [(SUUIProductPageHeaderView *)self addSubview:self->_ageBandLabel];
        ageBandLabel = self->_ageBandLabel;
        id v7 = v19;
      }
      [(UILabel *)ageBandLabel setText:v7];
      [(UILabel *)self->_ageBandLabel sizeToFit];
    }
    else
    {
      [(UILabel *)ageBandLabel removeFromSuperview];
      objc_super v17 = self->_ageBandLabel;
      self->_ageBandLabel = 0;
    }
    uint64_t v6 = [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v6);
}

- (void)setArtistName:(id)a3
{
  id v19 = a3;
  id v4 = [(SUUIProductPageHeaderView *)self artistName];
  if (v4 != v19 && ([v4 isEqualToString:v19] & 1) == 0)
  {
    artistButton = self->_artistButton;
    if (v19)
    {
      if (!artistButton)
      {
        uint64_t v6 = [[SUUILinkButton alloc] initWithArrowStyle:1];
        id v7 = self->_artistButton;
        self->_artistButton = &v6->super;

        v8 = self->_artistButton;
        if (self->_headerImageHeight == 0.0) {
          [(SUUIProductPageHeaderView *)self backgroundColor];
        }
        else {
        v10 = [MEMORY[0x263F825C8] clearColor];
        }
        [(UIButton *)v8 setBackgroundColor:v10];

        double v11 = [(UIButton *)self->_artistButton titleLabel];
        v12 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [v11 setFont:v12];

        v13 = self->_artistButton;
        v14 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v14)
        {
          [(UIButton *)v13 setTitleColor:v14 forState:0];
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.800000012];
          [(UIButton *)v13 setTitleColor:v15 forState:0];
        }
        v16 = self->_artistButton;
        objc_super v17 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v17)
        {
          [(UIButton *)v16 setTitleColor:v17 forState:1];
        }
        else
        {
          v18 = [MEMORY[0x263F825C8] blackColor];
          [(UIButton *)v16 setTitleColor:v18 forState:1];
        }
        [(SUUIProductPageHeaderView *)self addSubview:self->_artistButton];
        artistButton = self->_artistButton;
      }
      -[UIButton setTitle:forState:](artistButton, "setTitle:forState:");
      [(SUUIProductPageHeaderView *)self addSubview:self->_artistButton];
    }
    else
    {
      [(UIButton *)artistButton removeFromSuperview];
      v9 = self->_artistButton;
      self->_artistButton = 0;
    }
    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)setContentRatingArtworkLoader:(id)a3
{
  char v5 = (SUUIContentRatingArtworkResourceLoader *)a3;
  contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
  if (contentRatingArtworkLoader != v5)
  {
    id v7 = v5;
    [(SUUIContentRatingArtworkResourceLoader *)contentRatingArtworkLoader removeObserver:self];
    objc_storeStrong((id *)&self->_contentRatingArtworkLoader, a3);
    contentRatingArtworkLoader = (SUUIContentRatingArtworkResourceLoader *)[(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader addObserver:self];
    char v5 = v7;
  }
  MEMORY[0x270F9A758](contentRatingArtworkLoader, v5);
}

- (void)setColorScheme:(id)a3
{
  char v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v31 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    id v7 = [(SUUIProductPageHeaderView *)self backgroundColor];
    [(SUUIProductPageHeaderView *)self setBackgroundColor:v7];

    artistButton = self->_artistButton;
    v9 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v9)
    {
      [(UIButton *)artistButton setTitleColor:v9 forState:0];
    }
    else
    {
      v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.800000012];
      [(UIButton *)artistButton setTitleColor:v10 forState:0];
    }
    inAppPurchasesLabel = self->_inAppPurchasesLabel;
    v12 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v12)
    {
      [(UILabel *)inAppPurchasesLabel setTextColor:v12];
    }
    else
    {
      v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.400000006];
      [(UILabel *)inAppPurchasesLabel setTextColor:v13];
    }
    ageBandLabel = self->_ageBandLabel;
    v15 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v15)
    {
      [(UILabel *)ageBandLabel setTextColor:v15];
    }
    else
    {
      v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.400000006];
      [(UILabel *)ageBandLabel setTextColor:v16];
    }
    titleLabel = self->_titleLabel;
    v18 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v18)
    {
      [(SUUIProductPageHeaderLabel *)titleLabel setTextColor:v18];
    }
    else
    {
      id v19 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
      [(SUUIProductPageHeaderLabel *)titleLabel setTextColor:v19];
    }
    userRatingLabel = self->_userRatingLabel;
    v21 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v21)
    {
      [(UILabel *)userRatingLabel setTextColor:v21];
    }
    else
    {
      v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
      [(UILabel *)userRatingLabel setTextColor:v22];
    }
    editorialBadgeLabel = self->_editorialBadgeLabel;
    v24 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v24)
    {
      [(SUUIBadgeLabel *)editorialBadgeLabel setBackgroundColor:v24];
    }
    else
    {
      v25 = +[SUUIBadgeLabel defaultBackgroundColor];
      [(SUUIBadgeLabel *)editorialBadgeLabel setBackgroundColor:v25];
    }
    v26 = [MEMORY[0x263F827E8] kitImageNamed:@"UIButtonBarAction"];
    shareButton = self->_shareButton;
    v28 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    v29 = v28;
    if (!v28)
    {
      v29 = [(SUUIProductPageHeaderView *)self tintColor];
    }
    v30 = [v26 _flatImageWithColor:v29];
    [(UIButton *)shareButton setImage:v30 forState:0];

    if (!v28) {
    char v5 = v31;
    }
  }
}

- (void)setContentRating:(id)a3
{
  char v5 = (SUUIItemContentRating *)a3;
  if (self->_contentRating != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_contentRating, a3);
    titleLabel = self->_titleLabel;
    id v7 = [(SUUIItemContentRating *)self->_contentRating contentRatingName];
    [(SUUIProductPageHeaderLabel *)titleLabel setContentRating:v7];

    [(SUUIProductPageHeaderView *)self setNeedsLayout];
    char v5 = v8;
  }
}

- (void)setEditorialBadge:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIBadgeLabel *)self->_editorialBadgeLabel text];
  if (v4 != v15 && ([v4 isEqualToString:v15] & 1) == 0)
  {
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (v15)
    {
      if (!editorialBadgeLabel)
      {
        uint64_t v6 = objc_alloc_init(SUUIBadgeLabel);
        id v7 = self->_editorialBadgeLabel;
        self->_editorialBadgeLabel = v6;

        v8 = self->_editorialBadgeLabel;
        v9 = [(SUUIProductPageHeaderView *)self backgroundColor];
        if (v9)
        {
          [(SUUIBadgeLabel *)v8 setTextColor:v9];
        }
        else
        {
          double v11 = +[SUUIBadgeLabel defaultTextColor];
          [(SUUIBadgeLabel *)v8 setTextColor:v11];
        }
        v12 = self->_editorialBadgeLabel;
        v13 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v13)
        {
          [(SUUIBadgeLabel *)v12 setBackgroundColor:v13];
        }
        else
        {
          v14 = +[SUUIBadgeLabel defaultBackgroundColor];
          [(SUUIBadgeLabel *)v12 setBackgroundColor:v14];
        }
        [(SUUIProductPageHeaderView *)self addSubview:self->_editorialBadgeLabel];
        editorialBadgeLabel = self->_editorialBadgeLabel;
      }
      -[SUUIBadgeLabel setText:](editorialBadgeLabel, "setText:");
    }
    else
    {
      [(SUUIBadgeLabel *)editorialBadgeLabel removeFromSuperview];
      v10 = self->_editorialBadgeLabel;
      self->_editorialBadgeLabel = 0;
    }
    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)setHeaderImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_headerImageView image];

  if (v4 != v12)
  {
    headerImageView = self->_headerImageView;
    if (v12)
    {
      if (!headerImageView)
      {
        id v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v8 = self->_headerImageView;
        self->_headerImageView = v7;

        v9 = self->_headerImageView;
        v10 = [(SUUIProductPageHeaderView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SUUIProductPageHeaderView *)self addSubview:self->_headerImageView];
        headerImageView = self->_headerImageView;
      }
      -[UIImageView setImage:](headerImageView, "setImage:");
      [(UIImageView *)self->_headerImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)headerImageView removeFromSuperview];
      double v11 = self->_headerImageView;
      self->_headerImageView = 0;
    }
    uint64_t v5 = [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setHeaderImageHeight:(double)a3
{
  if (self->_headerImageHeight != a3)
  {
    self->_headerImageHeight = a3;
    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)setIconImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_iconImageView image];

  if (v4 != v12)
  {
    iconImageView = self->_iconImageView;
    if (v12)
    {
      if (!iconImageView)
      {
        id v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v8 = self->_iconImageView;
        self->_iconImageView = v7;

        v9 = self->_iconImageView;
        if (self->_headerImageHeight == 0.0) {
          [(SUUIProductPageHeaderView *)self backgroundColor];
        }
        else {
        double v11 = [MEMORY[0x263F825C8] clearColor];
        }
        [(UIImageView *)v9 setBackgroundColor:v11];

        [(SUUIProductPageHeaderView *)self addSubview:self->_iconImageView];
        iconImageView = self->_iconImageView;
      }
      -[UIImageView setImage:](iconImageView, "setImage:");
      [(UIImageView *)self->_iconImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)iconImageView removeFromSuperview];
      v10 = self->_iconImageView;
      self->_iconImageView = 0;
    }
    uint64_t v5 = [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setInAppPurchasesString:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_inAppPurchasesLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    inAppPurchasesLabel = self->_inAppPurchasesLabel;
    if (v16)
    {
      if (!inAppPurchasesLabel)
      {
        uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        id v7 = self->_inAppPurchasesLabel;
        self->_inAppPurchasesLabel = v6;

        v8 = self->_inAppPurchasesLabel;
        v9 = [(SUUIProductPageHeaderView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_inAppPurchasesLabel;
        double v11 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
        [(UILabel *)v10 setFont:v11];

        id v12 = self->_inAppPurchasesLabel;
        v13 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
        if (v13)
        {
          [(UILabel *)v12 setTextColor:v13];
        }
        else
        {
          id v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.400000006];
          [(UILabel *)v12 setTextColor:v15];
        }
        [(SUUIProductPageHeaderView *)self addSubview:self->_inAppPurchasesLabel];
        inAppPurchasesLabel = self->_inAppPurchasesLabel;
      }
      -[UILabel setText:](inAppPurchasesLabel, "setText:");
      [(UILabel *)self->_inAppPurchasesLabel sizeToFit];
    }
    else
    {
      [(UILabel *)inAppPurchasesLabel removeFromSuperview];
      v14 = self->_inAppPurchasesLabel;
      self->_inAppPurchasesLabel = 0;
    }
    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)setItemOffer:(id)a3
{
  uint64_t v5 = (SUUIItemOffer *)a3;
  p_itemOffer = &self->_itemOffer;
  if (self->_itemOffer != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_itemOffer, a3);
    p_itemOffer = (SUUIItemOffer **)[(SUUIProductPageHeaderView *)self _reloadItemOfferButton:0];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_itemOffer, v5);
}

- (void)setItemOfferExplanationText:(id)a3
{
  id v18 = a3;
  id v4 = [(UILabel *)self->_itemOfferExplanationLabel text];
  char v5 = [v4 isEqualToString:v18];

  id v7 = v18;
  if ((v5 & 1) == 0)
  {
    itemOfferExplanationLabel = self->_itemOfferExplanationLabel;
    if (v18)
    {
      if (!itemOfferExplanationLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v10 = self->_itemOfferExplanationLabel;
        self->_itemOfferExplanationLabel = v9;

        double v11 = self->_itemOfferExplanationLabel;
        id v12 = [(SUUIProductPageHeaderView *)self backgroundColor];
        [(UILabel *)v11 setBackgroundColor:v12];

        v13 = self->_itemOfferExplanationLabel;
        v14 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
        [(UILabel *)v13 setFont:v14];

        id v15 = self->_itemOfferExplanationLabel;
        id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
        [(UILabel *)v15 setTextColor:v16];

        [(SUUIProductPageHeaderView *)self addSubview:self->_itemOfferExplanationLabel];
        itemOfferExplanationLabel = self->_itemOfferExplanationLabel;
      }
      [(UILabel *)itemOfferExplanationLabel setText:v18];
      uint64_t v6 = [(SUUIProductPageHeaderView *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)itemOfferExplanationLabel removeFromSuperview];
      objc_super v17 = self->_itemOfferExplanationLabel;
      self->_itemOfferExplanationLabel = 0;
    }
    id v7 = v18;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)setItemOfferExplanationTitle:(id)a3
{
  id v18 = a3;
  id v4 = [(UILabel *)self->_itemOfferExplanationTitleLabel text];
  char v5 = [v4 isEqualToString:v18];

  id v7 = v18;
  if ((v5 & 1) == 0)
  {
    itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
    if (v18)
    {
      if (!itemOfferExplanationTitleLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v10 = self->_itemOfferExplanationTitleLabel;
        self->_itemOfferExplanationTitleLabel = v9;

        double v11 = self->_itemOfferExplanationTitleLabel;
        id v12 = [(SUUIProductPageHeaderView *)self backgroundColor];
        [(UILabel *)v11 setBackgroundColor:v12];

        v13 = self->_itemOfferExplanationTitleLabel;
        v14 = [MEMORY[0x263F81708] boldSystemFontOfSize:12.0];
        [(UILabel *)v13 setFont:v14];

        id v15 = self->_itemOfferExplanationTitleLabel;
        id v16 = [MEMORY[0x263F825C8] blackColor];
        [(UILabel *)v15 setTextColor:v16];

        [(SUUIProductPageHeaderView *)self addSubview:self->_itemOfferExplanationTitleLabel];
        itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
      }
      [(UILabel *)itemOfferExplanationTitleLabel setText:v18];
      uint64_t v6 = [(SUUIProductPageHeaderView *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)itemOfferExplanationTitleLabel removeFromSuperview];
      objc_super v17 = self->_itemOfferExplanationTitleLabel;
      self->_itemOfferExplanationTitleLabel = 0;
    }
    id v7 = v18;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)setItemState:(id)a3
{
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  if (self->_itemState != a3)
  {
    BOOL v4 = a4;
    uint64_t v6 = (SUUIItemState *)[a3 copy];
    itemState = self->_itemState;
    self->_itemState = v6;

    [(SUUIProductPageHeaderView *)self _reloadItemOfferButton:v4];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings == a3 && self->_userRatingLabel) {
    return;
  }
  self->_numberOfUserRatings = a3;
  if (!self->_userRatingLabel)
  {
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    userRatingLabel = self->_userRatingLabel;
    self->_userRatingLabel = v10;

    id v12 = self->_userRatingLabel;
    v13 = [(SUUIProductPageHeaderView *)self backgroundColor];
    [(UILabel *)v12 setBackgroundColor:v13];

    v14 = self->_userRatingLabel;
    id v15 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    [(UILabel *)v14 setFont:v15];

    id v16 = self->_userRatingLabel;
    objc_super v17 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v17)
    {
      [(UILabel *)v16 setTextColor:v17];
    }
    else
    {
      id v18 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
      [(UILabel *)v16 setTextColor:v18];
    }
    [(SUUIProductPageHeaderView *)self addSubview:self->_userRatingLabel];
    if (self->_numberOfUserRatings) {
      goto LABEL_5;
    }
LABEL_10:
    id v19 = self->_userRatingLabel;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"NO_RATINGS"];
    }
    else {
    id v4 = +[SUUIClientContext localizedStringForKey:@"NO_RATINGS" inBundles:0];
    }
    [(UILabel *)v19 setText:v4];
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_5:
  id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v4 setNumberStyle:1];
  char v5 = self->_userRatingLabel;
  uint64_t v6 = NSString;
  id v7 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
  v8 = [v4 stringFromNumber:v7];
  v9 = [v6 stringWithFormat:@"(%@)", v8];
  [(UILabel *)v5 setText:v9];

LABEL_14:
  [(SUUIProductPageHeaderView *)self setNeedsLayout];
}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    [(SUUIProductPageHeaderView *)self _reloadItemOfferButton:0];
  }
}

- (void)setTitle:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIProductPageHeaderLabel *)self->_titleLabel text];
  if (v4 != v18 && ([v4 isEqualToString:v18] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v18)
    {
      if (!titleLabel)
      {
        uint64_t v6 = objc_alloc_init(SUUIProductPageHeaderLabel);
        id v7 = self->_titleLabel;
        self->_titleLabel = v6;

        [(SUUIProductPageHeaderLabel *)self->_titleLabel setIsPad:SUUIUserInterfaceIdiom(self->_clientContext) == 1];
        v8 = self->_titleLabel;
        if (self->_headerImageHeight == 0.0) {
          [(SUUIProductPageHeaderView *)self backgroundColor];
        }
        else {
        v10 = [MEMORY[0x263F825C8] clearColor];
        }
        [(SUUIProductPageHeaderLabel *)v8 setBackgroundColor:v10];

        double v11 = self->_titleLabel;
        id v12 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v12)
        {
          [(SUUIProductPageHeaderLabel *)v11 setRatingColor:v12];
        }
        else
        {
          v13 = [MEMORY[0x263F825C8] colorWithWhite:0.62745098 alpha:1.0];
          [(SUUIProductPageHeaderLabel *)v11 setRatingColor:v13];
        }
        v14 = self->_titleLabel;
        id v15 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v15)
        {
          [(SUUIProductPageHeaderLabel *)v14 setTextColor:v15];
        }
        else
        {
          id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
          [(SUUIProductPageHeaderLabel *)v14 setTextColor:v16];
        }
        [(SUUIProductPageHeaderView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[SUUIProductPageHeaderLabel setText:](titleLabel, "setText:");
      objc_super v17 = self->_titleLabel;
      v9 = [(SUUIProductPageHeaderView *)self contentRatingName];
      [(SUUIProductPageHeaderLabel *)v17 setContentRating:v9];
    }
    else
    {
      [(SUUIProductPageHeaderLabel *)titleLabel removeFromSuperview];
      v9 = self->_titleLabel;
      self->_titleLabel = 0;
    }

    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)setSecondaryContentRating:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader cachedImageForContentRating:v4 withClientContext:self->_clientContext];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    titleLabel = self->_titleLabel;
    v9[0] = v5;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [(SUUIProductPageHeaderLabel *)titleLabel setSecondaryContentRatingImages:v8];

    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
  else
  {
    [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader loadImageForContentRating:v4 clientContent:self->_clientContext reason:1];
  }
}

- (void)setUserRating:(double)a3
{
  if (self->_userRating != a3 || !self->_userRatingStarsView)
  {
    self->_userRating = a3;
    if (!self->_userRatingStarsView)
    {
      id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      userRatingStarsView = self->_userRatingStarsView;
      self->_userRatingStarsView = v4;

      uint64_t v6 = self->_userRatingStarsView;
      id v7 = [(SUUIProductPageHeaderView *)self backgroundColor];
      [(UIImageView *)v6 setBackgroundColor:v7];

      [(SUUIProductPageHeaderView *)self addSubview:self->_userRatingStarsView];
    }
    id v10 = +[SUUIRatingStarsCache cacheWithProperties:1];
    v8 = self->_userRatingStarsView;
    v9 = [v10 ratingStarsImageForRating:self->_userRating];
    [(UIImageView *)v8 setImage:v9];

    [(UIImageView *)self->_userRatingStarsView sizeToFit];
  }
}

- (NSString)title
{
  return [(SUUIProductPageHeaderLabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  v3 = [(SUUIItemOfferButton *)self->_itemOfferButton layer];
  id v4 = [v3 animationKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    self->_needsLayoutAfterButtonAnimation = 1;
    return;
  }
  [(SUUIProductPageHeaderView *)self bounds];
  double v7 = v6;
  BOOL v8 = SUUIUserInterfaceIdiom(self->_clientContext) == 1;
  if (self->_headerImageView)
  {
    -[SUUIProductPageHeaderView sendSubviewToBack:](self, "sendSubviewToBack:");
    [(UIImageView *)self->_headerImageView sizeToFit];
    [(UIImageView *)self->_headerImageView frame];
    -[UIImageView setFrame:](self->_headerImageView, "setFrame:", 0.0, 0.0);
  }
  double headerImageHeight = self->_headerImageHeight;
  double v10 = 0.0;
  double v11 = headerImageHeight + 0.0 + 15.0;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(UIImageView *)iconImageView frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", 15.0, headerImageHeight + 0.0 + 15.0);
    v107.origin.double x = 15.0;
    v107.origin.double y = headerImageHeight + 0.0 + 15.0;
    v107.size.width = v14;
    v107.size.double height = v16;
    double v10 = CGRectGetMaxX(v107) + 15.0;
  }
  double v17 = v7 + -15.0;
  shareButton = self->_shareButton;
  uint64_t v19 = MEMORY[0x263F00190];
  double MinX = v7 + -15.0;
  if (shareButton)
  {
    [(UIButton *)shareButton frame];
    -[UIButton sizeThatFits:](self->_shareButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v25 = v17 - v21;
    -[UIButton setFrame:](self->_shareButton, "setFrame:", v17 - v21, headerImageHeight + 0.0 + 15.0, v21, v23);
    v108.origin.double x = v25;
    v108.origin.double y = headerImageHeight + 0.0 + 15.0;
    v108.size.width = v22;
    v108.size.double height = v24;
    double MinX = CGRectGetMinX(v108);
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  memset(v93, 0, sizeof(v93));
  v83 = v93;
  double v92 = 0.0;
  long long v90 = 0u;
  long long v91 = 0u;
  double v81 = 0.0;
  v82 = &v90;
  double v26 = MinX - v10;
  [(SUUIProductPageHeaderView *)self _getTopLayoutProperties:&v83 origins:&v82 height:&v81 forWidth:MinX - v10];
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    -[SUUIProductPageHeaderLabel setFrame:](titleLabel, "setFrame:", v10, v11 + *(double *)&v90, v93[0]);
  }
  artistButton = self->_artistButton;
  if (artistButton) {
    -[UIButton setFrame:](artistButton, "setFrame:", v10, v11 + *((double *)&v90 + 1), v94);
  }
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel) {
    -[SUUIBadgeLabel setFrame:](editorialBadgeLabel, "setFrame:", v10, v11 + *(double *)&v91, v97);
  }
  inAppPurchasesLabel = self->_inAppPurchasesLabel;
  if (inAppPurchasesLabel) {
    -[UILabel setFrame:](inAppPurchasesLabel, "setFrame:", v10, v11 + *((double *)&v91 + 1), v100);
  }
  double v31 = dbl_2568A1760[v8];
  ageBandLabel = self->_ageBandLabel;
  if (ageBandLabel) {
    -[UILabel setFrame:](ageBandLabel, "setFrame:", v10, v11 + v92, v103);
  }
  double v33 = v31 + headerImageHeight;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v87 = 0u;
  memset(v86, 0, sizeof(v86));
  v83 = v86;
  uint64_t v85 = 0;
  memset(v84, 0, sizeof(v84));
  v82 = v84;
  double v80 = 0.0;
  [(SUUIProductPageHeaderView *)self _getBottomLayoutProperties:&v83 origins:&v82 height:&v80 forWidth:v26];
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    double v34 = v11 + v81;
    uint64_t v35 = SUUIUserInterfaceIdiom(self->_clientContext);
    double v36 = 7.0;
    if (v35 == 1) {
      double v36 = 11.0;
    }
    goto LABEL_37;
  }
  double v37 = v81 + v80;
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
    double v38 = 11.0;
  }
  else {
    double v38 = 7.0;
  }
  double v39 = v37 + v38;
  uint64_t v40 = SUUIUserInterfaceIdiom(self->_clientContext);
  double v41 = 100.0;
  if (v40 == 1) {
    double v41 = 170.0;
  }
  if (v39 >= v41)
  {
    double v43 = v11 + v81;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v44 = 11.0;
    }
    else {
      double v44 = 7.0;
    }
    double v33 = v80 + v43 + v44;
    double v34 = v11 + v81;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v36 = 11.0;
    }
    else {
      double v36 = 7.0;
    }
LABEL_37:
    double v42 = v34 + v36;
    goto LABEL_38;
  }
  double v42 = v33 - v80;
LABEL_38:
  if (self->_userRatingLabel)
  {
    userRatingStarsView = self->_userRatingStarsView;
    double v46 = v10;
    if (userRatingStarsView)
    {
      char v47 = [(UIImageView *)userRatingStarsView isHidden];
      double v46 = v10;
      if ((v47 & 1) == 0)
      {
        [(UIImageView *)self->_userRatingStarsView frame];
        -[UIImageView setFrame:](self->_userRatingStarsView, "setFrame:", v10, v42 + *((double *)v84 + 1) + 2.0);
        [(UIImageView *)self->_userRatingStarsView frame];
        double v46 = v10 + v48 + 3.0;
      }
    }
    -[UILabel setFrame:](self->_userRatingLabel, "setFrame:", v46, v42 + *((double *)v84 + 1), v87);
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
  {
    [(SUUIItemOfferButton *)itemOfferButton frame];
    double v51 = v50;
    double v53 = v52;
    double v54 = v33 - v52;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
      double v55 = v10;
    }
    else {
      double v55 = v7 - v51 + -15.0;
    }
  }
  else
  {
    double v55 = *MEMORY[0x263F001A8];
    double v54 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v51 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v53 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
  if (itemOfferExplanationTitleLabel && self->_itemOfferExplanationLabel)
  {
    double v78 = v33;
    double v79 = v17;
    double v57 = *(double *)(v19 + 16);
    double v58 = *(double *)(v19 + 24);
    -[UILabel sizeThatFits:](itemOfferExplanationTitleLabel, "sizeThatFits:", v57, v58);
    CGFloat rect = v59;
    double v61 = v60;
    -[UILabel sizeThatFits:](self->_itemOfferExplanationLabel, "sizeThatFits:", v57, v58);
    double v77 = v62;
    double v63 = v61 + v62;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      if (self->_itemOfferButton)
      {
        v109.origin.double x = v55;
        v109.origin.double y = v54;
        v109.size.width = v51;
        v109.size.double height = v53;
        double v10 = CGRectGetMaxX(v109) + 8.0;
      }
      double v64 = v78 - v63;
      double v65 = v79;
    }
    else
    {
      double v10 = 15.0;
      double v64 = v78 + 15.0;
      v66 = self->_itemOfferButton;
      float v67 = (v63 - v53) * 0.5;
      double v68 = v78 + 15.0 + floorf(v67);
      if (v66) {
        double v54 = v68;
      }
      double v65 = v79;
      if (v66) {
        double v65 = v55 + -8.0;
      }
    }
    v110.origin.double x = v10;
    v110.origin.double y = v64;
    v110.size.width = rect;
    v110.size.double height = v61;
    double v69 = v65 - v10;
    -[UILabel setFrame:](self->_itemOfferExplanationLabel, "setFrame:", v10, CGRectGetMaxY(v110), v69, v77);
    -[UILabel setFrame:](self->_itemOfferExplanationTitleLabel, "setFrame:", v10, v64, v69, v61);
  }
  -[SUUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v55, v54, v51, v53);
  userRatingLabel = self->_userRatingLabel;
  if (userRatingLabel)
  {
    [(UILabel *)userRatingLabel frame];
    double x = v111.origin.x;
    double y = v111.origin.y;
    double height = v111.size.height;
    v113.origin.double x = v55;
    v113.origin.double y = v54;
    v113.size.width = v51;
    v113.size.double height = v53;
    if (CGRectIntersectsRect(v111, v113))
    {
      -[SUUIItemOfferButton layoutSizeThatFits:](self->_itemOfferButton, "layoutSizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
      double v75 = v74;
      v112.origin.double x = v55;
      v112.origin.double y = v54;
      v112.size.width = v51;
      v112.size.double height = v53;
      -[UILabel setFrame:](self->_userRatingLabel, "setFrame:", x, y, CGRectGetMaxX(v112) - v75 + -5.0 - x, height);
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProductPageHeaderView;
  [(SUUIProductPageHeaderView *)&v13 setBackgroundColor:v4];
  artistButton = self->_artistButton;
  if (self->_headerImageHeight == 0.0) {
    [(SUUIProductPageHeaderView *)self backgroundColor];
  }
  else {
  double v6 = [MEMORY[0x263F825C8] clearColor];
  }
  [(UIButton *)artistButton setBackgroundColor:v6];

  iconImageView = self->_iconImageView;
  if (self->_headerImageHeight == 0.0) {
    [(SUUIProductPageHeaderView *)self backgroundColor];
  }
  else {
  BOOL v8 = [MEMORY[0x263F825C8] clearColor];
  }
  [(UIImageView *)iconImageView setBackgroundColor:v8];

  titleLabel = self->_titleLabel;
  if (self->_headerImageHeight == 0.0) {
    [(SUUIProductPageHeaderView *)self backgroundColor];
  }
  else {
  double v10 = [MEMORY[0x263F825C8] clearColor];
  }
  [(SUUIProductPageHeaderLabel *)titleLabel setBackgroundColor:v10];

  [(UILabel *)self->_ageBandLabel setBackgroundColor:v4];
  [(UILabel *)self->_inAppPurchasesLabel setBackgroundColor:v4];
  [(SUUIItemOfferButton *)self->_itemOfferButton setBackgroundColor:v4];
  [(UILabel *)self->_itemOfferExplanationLabel setBackgroundColor:v4];
  [(UILabel *)self->_itemOfferExplanationTitleLabel setBackgroundColor:v4];
  [(UILabel *)self->_userRatingLabel setBackgroundColor:v4];
  [(UIImageView *)self->_userRatingStarsView setBackgroundColor:v4];
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (v4)
  {
    [(SUUIBadgeLabel *)editorialBadgeLabel setTextColor:v4];
  }
  else
  {
    id v12 = +[SUUIBadgeLabel defaultTextColor];
    [(SUUIBadgeLabel *)editorialBadgeLabel setTextColor:v12];
  }
}

- (void)sizeToFit
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  [(SUUIProductPageHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = v7 + -30.0;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(UIImageView *)iconImageView frame];
    double v9 = v9 - (v11 + 15.0);
  }
  shareButton = self->_shareButton;
  if (shareButton)
  {
    -[UIButton sizeThatFits:](shareButton, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v9 = v9 - v13;
  }
  memset(v38, 0, sizeof(v38));
  v32 = v38;
  uint64_t v37 = 0;
  memset(v36, 0, sizeof(v36));
  double v30 = 0.0;
  double v31 = v36;
  [(SUUIProductPageHeaderView *)self _getTopLayoutProperties:&v32 origins:&v31 height:&v30 forWidth:v9];
  memset(v35, 0, sizeof(v35));
  v32 = v35;
  uint64_t v34 = 0;
  memset(v33, 0, sizeof(v33));
  double v31 = v33;
  double v29 = 0.0;
  [(SUUIProductPageHeaderView *)self _getBottomLayoutProperties:&v32 origins:&v31 height:&v29 forWidth:v9];
  double headerImageHeight = self->_headerImageHeight;
  double v15 = v30 + 7.0 + v29;
  uint64_t v16 = SUUIUserInterfaceIdiom(self->_clientContext);
  double v17 = 100.0;
  if (v16 == 1) {
    double v17 = 170.0;
  }
  if (v15 >= v17)
  {
    double v19 = v29 + v30 + 15.0 + 7.0 + 5.0;
  }
  else
  {
    uint64_t v18 = SUUIUserInterfaceIdiom(self->_clientContext);
    double v19 = 120.0;
    if (v18 == 1) {
      double v19 = 190.0;
    }
  }
  double v20 = headerImageHeight + v19;
  if (self->_itemOfferExplanationLabel
    && self->_itemOfferExplanationTitleLabel
    && SUUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
    double v21 = *(double *)(MEMORY[0x263F00190] + 16);
    double v22 = *(double *)(MEMORY[0x263F00190] + 24);
    -[UILabel sizeThatFits:](self->_itemOfferExplanationTitleLabel, "sizeThatFits:", v21, v22);
    double v24 = v23 + 0.0;
    -[UILabel sizeThatFits:](self->_itemOfferExplanationLabel, "sizeThatFits:", v21, v22);
    double v26 = v24 + v25;
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton)
    {
      [(SUUIItemOfferButton *)itemOfferButton frame];
      if (v26 < v28) {
        double v26 = v28;
      }
    }
    double v20 = v20 + v26 + 15.0;
  }
  -[SUUIProductPageHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v20);
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  [(SUUIItemOfferButton *)self->_itemOfferButton frame];
  double v5 = v4;
  double v7 = v6;
  -[SUUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v9 = v8;
  double v11 = v10;
  if (SUUIUserInterfaceIdiom(self->_clientContext))
  {
    if (self->_itemOfferExplanationLabel && self->_itemOfferExplanationTitleLabel)
    {
      [(SUUIProductPageHeaderView *)self bounds];
      double v13 = v12;
      [(UILabel *)self->_itemOfferExplanationLabel frame];
      double v15 = v14;
      double v17 = v16;
      double v31 = v18;
      v33.origin.double x = v5;
      v33.origin.double y = v7;
      v33.size.width = v9;
      v33.size.double height = v11;
      double v19 = CGRectGetMaxX(v33) + 8.0;
      double v20 = v13 + -15.0;
      if (v13 + -15.0 - v19 >= v17) {
        double v21 = v17;
      }
      else {
        double v21 = v13 + -15.0 - v19;
      }
      -[UILabel setFrame:](self->_itemOfferExplanationLabel, "setFrame:", v19, v15, v21, v31);
      [(UILabel *)self->_itemOfferExplanationTitleLabel frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v34.origin.double x = v5;
      v34.origin.double y = v7;
      v34.size.width = v9;
      v34.size.double height = v11;
      double v28 = CGRectGetMaxX(v34) + 8.0;
      if (v20 - v28 >= v25) {
        double v29 = v25;
      }
      else {
        double v29 = v20 - v28;
      }
      -[UILabel setFrame:](self->_itemOfferExplanationTitleLabel, "setFrame:", v28, v23, v29, v27);
    }
  }
  else
  {
    [(SUUIProductPageHeaderView *)self bounds];
    double v5 = v30 - v9 + -15.0;
  }
  -[SUUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v5, v7, v9, v11);
  [(SUUIProductPageHeaderView *)self performSelector:sel__finishButtonAnimation withObject:0 afterDelay:1.0];
}

- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  titleLabel = self->_titleLabel;
  id v10 = a4;
  double v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a4;
  double v9 = [v7 arrayWithObjects:&v10 count:1];
  -[SUUIProductPageHeaderLabel setSecondaryContentRatingImages:](titleLabel, "setSecondaryContentRatingImages:", v9, v10, v11);

  [(SUUIProductPageHeaderView *)self setNeedsLayout];
}

- (void)_cancelConfirmationAction:(id)a3
{
  [(SUUIProductPageHeaderView *)self bringSubviewToFront:self->_itemOfferButton];
  itemOfferButton = self->_itemOfferButton;
  [(SUUIItemOfferButton *)itemOfferButton setShowingConfirmation:0 animated:1];
}

- (void)_showConfirmationAction:(id)a3
{
  [(SUUIProductPageHeaderView *)self bringSubviewToFront:self->_itemOfferButton];
  itemOfferButton = self->_itemOfferButton;
  [(SUUIItemOfferButton *)itemOfferButton setShowingConfirmation:1 animated:1];
}

- (void)_finishButtonAnimation
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  if (self->_needsLayoutAfterButtonAnimation)
  {
    self->_needsLayoutAfterButtonAnimation = 0;
    [(SUUIProductPageHeaderView *)self setNeedsLayout];
  }
}

- (void)_reloadItemOfferButton:(BOOL)a3
{
  if (self->_itemOffer && (BOOL v4 = a3, ![(SUUIProductPageHeaderView *)self isRestricted]))
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton)
    {
      double v7 = +[SUUIItemOfferButton itemOfferButtonWithAppearance:0];
      id v8 = self->_itemOfferButton;
      self->_itemOfferButton = v7;

      [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
      [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__showConfirmationAction_ forControlEvents:0x40000];
      double v9 = self->_itemOfferButton;
      id v10 = [(SUUIProductPageHeaderView *)self backgroundColor];
      [(SUUIItemOfferButton *)v9 setBackgroundColor:v10];

      LODWORD(v11) = -1.0;
      [(SUUIItemOfferButton *)self->_itemOfferButton setCharge:v11];
      [(SUUIItemOfferButton *)self->_itemOfferButton setDelegate:self];
      [(SUUIProductPageHeaderView *)self addSubview:self->_itemOfferButton];
      itemOfferButton = self->_itemOfferButton;
    }
    if ([(SUUIItemOfferButton *)itemOfferButton setValuesUsingItemOffer:self->_itemOffer itemState:self->_itemState clientContext:self->_clientContext animated:v4])
    {
      [(SUUIItemOfferButton *)self->_itemOfferButton sizeToFit];
      [(SUUIProductPageHeaderView *)self setNeedsLayout];
    }
  }
  else
  {
    [(SUUIItemOfferButton *)self->_itemOfferButton setDelegate:0];
    [(SUUIItemOfferButton *)self->_itemOfferButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [(SUUIItemOfferButton *)self->_itemOfferButton removeFromSuperview];
    double v5 = self->_itemOfferButton;
    self->_itemOfferButton = 0;
  }
}

- (void)_getTopLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    double v12 = *a3;
    -[SUUIProductPageHeaderLabel sizeThatFits:](titleLabel, "sizeThatFits:", a6, 1.79769313e308);
    *(void *)double v12 = v13;
    *((void *)v12 + 1) = v14;
    *((_OWORD *)v12 + 1) = xmmword_2568A1770;
    *((void *)v12 + 4) = 0x4022000000000000;
    *((unsigned char *)v12 + 40) = 1;
  }
  artistButton = self->_artistButton;
  if (artistButton)
  {
    double v16 = *a3;
    -[UIButton sizeThatFits:](artistButton, "sizeThatFits:", a6, 1.79769313e308);
    *((void *)v16 + 6) = v17;
    *((void *)v16 + 7) = v18;
    *((_OWORD *)v16 + 4) = xmmword_2568A1780;
    *((void *)v16 + 10) = 0x401C000000000000;
    *((unsigned char *)v16 + 88) = 1;
  }
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel)
  {
    double v20 = *a3;
    -[SUUIBadgeLabel sizeThatFits:](editorialBadgeLabel, "sizeThatFits:", a6, 1.79769313e308);
    *((void *)v20 + 12) = v21;
    *((void *)v20 + 13) = v22;
    *((void *)v20 + 14) = 0;
    *((void *)v20 + 15) = 0;
    *((void *)v20 + 16) = 0x401C000000000000;
    *((unsigned char *)v20 + 136) = 1;
  }
  inAppPurchasesLabel = self->_inAppPurchasesLabel;
  __asm { FMOV            V0.2D, #3.0 }
  long long v41 = _Q0;
  if (inAppPurchasesLabel)
  {
    double v29 = *a3;
    -[UILabel sizeThatFits:](inAppPurchasesLabel, "sizeThatFits:", a6, 1.79769313e308);
    *((void *)v29 + 18) = v30;
    *((void *)v29 + 19) = v31;
    *((_OWORD *)v29 + 10) = v41;
    *((void *)v29 + 22) = 0x401C000000000000;
    *((unsigned char *)v29 + 184) = 1;
  }
  ageBandLabel = self->_ageBandLabel;
  if (ageBandLabel)
  {
    CGRect v33 = *a3;
    -[UILabel sizeThatFits:](ageBandLabel, "sizeThatFits:", a6, 1.79769313e308);
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v38 = SUUIUserInterfaceIdiom(self->_clientContext);
    double v39 = 7.0;
    *((void *)v33 + 24) = v35;
    *((void *)v33 + 25) = v37;
    if (v38 == 1) {
      double v39 = 11.0;
    }
    *((_OWORD *)v33 + 13) = v41;
    *((double *)v33 + 28) = v39;
    *((unsigned char *)v33 + 232) = 0;
  }
  uint64_t v40 = *a3;
  SUUIGetLayoutProperties((uint64_t)v40, 5, a4, a5);
}

- (void)_getBottomLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6
{
  if (self->_userRatingLabel)
  {
    int64_t numberOfUserRatings = self->_numberOfUserRatings;
    userRatingStarsView = self->_userRatingStarsView;
    if (numberOfUserRatings)
    {
      [(UIImageView *)userRatingStarsView setHidden:0];
      [(UIImageView *)self->_userRatingStarsView frame];
      double v14 = v13 + 3.0;
    }
    else
    {
      [(UIImageView *)userRatingStarsView setHidden:1];
      double v14 = 0.0;
    }
    double v16 = a6 - v14;
    -[UILabel sizeThatFits:](self->_userRatingLabel, "sizeThatFits:", v16, 1.79769313e308);
    double v15 = *a3;
    if (v16 < v17) {
      double v17 = v16;
    }
    *((double *)v15 + 6) = v17;
    *((void *)v15 + 7) = v18;
    *((void *)v15 + 8) = 0x4000000000000000;
    *((void *)v15 + 9) = 0;
    *((void *)v15 + 10) = 0;
    *((unsigned char *)v15 + 88) = 1;
  }
  else
  {
    double v15 = *a3;
  }
  SUUIGetLayoutProperties((uint64_t)v15, 5, a4, a5);
}

- (UIControl)artistButton
{
  return &self->_artistButton->super;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (SUUIContentRatingArtworkResourceLoader)contentRatingArtworkLoader
{
  return self->_contentRatingArtworkLoader;
}

- (double)headerImageHeight
{
  return self->_headerImageHeight;
}

- (SUUIItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SUUIItemOfferButton)itemOfferButton
{
  return self->_itemOfferButton;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (SUUIItemContentRating)secondaryContentRating
{
  return self->_secondaryContentRating;
}

- (double)userRating
{
  return self->_userRating;
}

- (UIControl)shareButton
{
  return &self->_shareButton->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingStarsView, 0);
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_secondaryContentRating, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferExplanationTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferExplanationLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_inAppPurchasesLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_editorialBadgeLabel, 0);
  objc_storeStrong((id *)&self->_artistButton, 0);
  objc_storeStrong((id *)&self->_ageBandLabel, 0);
}

@end