@interface SUUIGiftItemView
- (BOOL)leftToRight;
- (CGSize)_imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)artistName;
- (NSString)categoryName;
- (NSString)price;
- (NSString)title;
- (SUUIGiftItemView)initWithStyle:(int64_t)a3 item:(id)a4 clientContext:(id)a5;
- (SUUIGiftTheme)theme;
- (SUUIItem)item;
- (SUUIItemArtworkContext)artworkContext;
- (SUUIItemOfferButton)itemOfferButton;
- (SUUIItemState)itemState;
- (UIEdgeInsets)_imageEdgeInsets;
- (UIImage)itemImage;
- (double)_paddingLeading;
- (double)_paddingTrailing;
- (float)userRating;
- (id)_newLabel;
- (id)_subtitleColor;
- (id)_titleColor;
- (id)_userRatingColor;
- (int64_t)giftItemStyle;
- (int64_t)numberOfUserRatings;
- (void)_enumerateMetadataViewsUsingBlock:(id)a3;
- (void)_itemOfferConfirmAction:(id)a3;
- (void)_reloadItemState:(BOOL)a3;
- (void)_reloadSubtitles;
- (void)_reloadUserRatingViews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCategoryName:(id)a3;
- (void)setItemImage:(id)a3;
- (void)setItemState:(id)a3;
- (void)setItemState:(id)a3 animated:(BOOL)a4;
- (void)setLeftToRight:(BOOL)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setPrice:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(float)a3;
@end

@implementation SUUIGiftItemView

- (SUUIGiftItemView)initWithStyle:(int64_t)a3 item:(id)a4 clientContext:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGiftItemView;
  v11 = [(SUUIGiftItemView *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_item, a4);
    v12->_itemStyle = a3;
    objc_storeStrong((id *)&v12->_clientContext, a5);
    [(SUUIGiftItemView *)v12 _reloadUserRatingViews];
    [(SUUIGiftItemView *)v12 _reloadItemState:0];
    v13 = [MEMORY[0x263F82438] sharedApplication];
    v12->_leftToRight = [v13 userInterfaceLayoutDirection] == 0;
  }
  return v12;
}

- (void)dealloc
{
  [(SUUIItemOfferButton *)self->_itemOfferButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftItemView;
  [(SUUIGiftItemView *)&v3 dealloc];
}

- (SUUIItemArtworkContext)artworkContext
{
  objc_super v3 = objc_alloc_init(SUUIItemArtworkContext);
  int64_t itemStyle = self->_itemStyle;
  if ((unint64_t)(itemStyle - 2) < 2)
  {
    id v10 = +[SUUIStyledImageDataConsumer giftResultIconConsumer];
    [(SUUIItemArtworkContext *)v3 setIconConsumer:v10];

    v11 = +[SUUIStyledImageDataConsumer giftResultProductImageConsumer];
    [(SUUIItemArtworkContext *)v3 setNewsstandConsumer:v11];

    uint64_t v9 = +[SUUIProductImageDataConsumer giftResultConsumer];
  }
  else if (itemStyle == 1)
  {
    v12 = +[SUUIStyledImageDataConsumer giftThemeIconConsumer];
    [(SUUIItemArtworkContext *)v3 setIconConsumer:v12];

    v13 = +[SUUIStyledImageDataConsumer giftThemeProductImageConsumer];
    [(SUUIItemArtworkContext *)v3 setNewsstandConsumer:v13];

    v14 = +[SUUIProductImageDataConsumer giftThemePosterConsumer];
    [(SUUIItemArtworkContext *)v3 setPosterConsumer:v14];

    objc_super v15 = +[SUUIProductImageDataConsumer giftThemeLetterboxConsumer];
    [(SUUIItemArtworkContext *)v3 setLetterboxConsumer:v15];

    uint64_t v9 = +[SUUIProductImageDataConsumer giftThemeConsumer];
  }
  else
  {
    if (itemStyle) {
      goto LABEL_8;
    }
    v5 = +[SUUIStyledImageDataConsumer roomIconConsumer];
    [(SUUIItemArtworkContext *)v3 setIconConsumer:v5];

    v6 = +[SUUIStyledImageDataConsumer giftComposeProductImageConsumer];
    [(SUUIItemArtworkContext *)v3 setNewsstandConsumer:v6];

    v7 = +[SUUIProductImageDataConsumer giftComposePosterConsumer];
    [(SUUIItemArtworkContext *)v3 setPosterConsumer:v7];

    v8 = +[SUUIProductImageDataConsumer giftComposeLetterboxConsumer];
    [(SUUIItemArtworkContext *)v3 setLetterboxConsumer:v8];

    uint64_t v9 = +[SUUIProductImageDataConsumer giftComposeConsumer];
  }
  v16 = (void *)v9;
  [(SUUIItemArtworkContext *)v3 setGeneralConsumer:v9];

LABEL_8:
  return v3;
}

- (UIImage)itemImage
{
  return [(UIImageView *)self->_itemImageView image];
}

- (SUUIItemOfferButton)itemOfferButton
{
  itemOfferButton = self->_itemOfferButton;
  if (!itemOfferButton)
  {
    v4 = objc_alloc_init(SUUIItemOfferButton);
    v5 = self->_itemOfferButton;
    self->_itemOfferButton = v4;

    v6 = self->_itemOfferButton;
    v7 = [(SUUIGiftItemView *)self backgroundColor];
    [(SUUIItemOfferButton *)v6 setBackgroundColor:v7];

    [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__itemOfferConfirmAction_ forControlEvents:0x20000];
    [(SUUIGiftItemView *)self addSubview:self->_itemOfferButton];
    itemOfferButton = self->_itemOfferButton;
  }
  return itemOfferButton;
}

- (void)setArtistName:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_artistName != (NSString *)v4)
  {
    v8 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      artistName = self->_artistName;
      self->_artistName = v6;

      uint64_t v4 = [(SUUIGiftItemView *)self _reloadSubtitles];
      uint64_t v5 = (uint64_t)v8;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)setCategoryName:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_categoryName != (NSString *)v4)
  {
    v8 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      categoryName = self->_categoryName;
      self->_categoryName = v6;

      uint64_t v4 = [(SUUIGiftItemView *)self _reloadSubtitles];
      uint64_t v5 = (uint64_t)v8;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)setItemImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_itemImageView image];

  if (v4 != v12)
  {
    itemImageView = self->_itemImageView;
    if (v12)
    {
      if (!itemImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v8 = self->_itemImageView;
        self->_itemImageView = v7;

        uint64_t v9 = self->_itemImageView;
        id v10 = [(SUUIGiftItemView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SUUIGiftItemView *)self addSubview:self->_itemImageView];
        itemImageView = self->_itemImageView;
      }
      -[UIImageView setImage:](itemImageView, "setImage:");
      [(UIImageView *)self->_itemImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)itemImageView removeFromSuperview];
      v11 = self->_itemImageView;
      self->_itemImageView = 0;
    }
    uint64_t v5 = [(SUUIGiftItemView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setItemState:(id)a3
{
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  if (self->_itemState != a3)
  {
    BOOL v4 = a4;
    v6 = (SUUIItemState *)[a3 copy];
    itemState = self->_itemState;
    self->_itemState = v6;

    [(SUUIGiftItemView *)self _reloadItemState:v4];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings != a3)
  {
    self->_numberOfUserRatings = a3;
    [(SUUIGiftItemView *)self _reloadUserRatingViews];
  }
}

- (void)setPrice:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_price != (NSString *)v4)
  {
    v8 = (void *)v4;
    uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:");
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      price = self->_price;
      self->_price = v6;

      uint64_t v4 = [(SUUIGiftItemView *)self _reloadSubtitles];
      uint64_t v5 = (uint64_t)v8;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)setTheme:(id)a3
{
  if (self->_theme != a3)
  {
    uint64_t v4 = (SUUIGiftTheme *)[a3 copy];
    theme = self->_theme;
    self->_theme = v4;

    id v7 = [(SUUIGiftItemView *)self _subtitleColor];
    [(UILabel *)self->_subtitleLabel1 setTextColor:v7];
    [(UILabel *)self->_subtitleLabel2 setTextColor:v7];
    v6 = [(SUUIGiftItemView *)self _titleColor];
    [(UILabel *)self->_titleLabel setTextColor:v6];
    [(UILabel *)self->_userRatingCountLabel setTextColor:v6];
  }
}

- (void)setTitle:(id)a3
{
  id v21 = a3;
  id v4 = [(SUUIGiftItemView *)self title];
  if (v4 != v21 && ([v21 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!v21)
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v13 = self->_titleLabel;
      self->_titleLabel = 0;

LABEL_17:
      [(SUUIGiftItemView *)self setNeedsLayout];
      goto LABEL_18;
    }
    if (titleLabel)
    {
LABEL_16:
      -[UILabel setText:](titleLabel, "setText:");
      goto LABEL_17;
    }
    v6 = [(SUUIGiftItemView *)self _newLabel];
    id v7 = self->_titleLabel;
    self->_titleLabel = v6;

    v8 = self->_titleLabel;
    uint64_t v9 = [(SUUIGiftItemView *)self _titleColor];
    [(UILabel *)v8 setTextColor:v9];

    int64_t itemStyle = self->_itemStyle;
    if ((unint64_t)(itemStyle - 2) < 2)
    {
      v14 = self->_titleLabel;
      objc_super v15 = (void *)MEMORY[0x263F81708];
      v16 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v17 = [v16 userInterfaceIdiom];

      double v18 = 16.0;
      if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v18 = 24.0;
      }
      v19 = v15;
    }
    else
    {
      if (itemStyle != 1)
      {
        if (!itemStyle)
        {
          v11 = self->_titleLabel;
          id v12 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
          [(UILabel *)v11 setFont:v12];
        }
        goto LABEL_15;
      }
      v14 = self->_titleLabel;
      v19 = (void *)MEMORY[0x263F81708];
      double v18 = 15.0;
    }
    v20 = [v19 systemFontOfSize:v18];
    [(UILabel *)v14 setFont:v20];

    [(UILabel *)self->_titleLabel setNumberOfLines:2];
LABEL_15:
    [(SUUIGiftItemView *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
    goto LABEL_16;
  }
LABEL_18:
}

- (void)setUserRating:(float)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    [(SUUIGiftItemView *)self _reloadUserRatingViews];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIGiftItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(SUUIGiftItemView *)self leftToRight];
  [(SUUIGiftItemView *)self _paddingTrailing];
  double v69 = v4;
  if (v7) {
    double v9 = v4 - v8;
  }
  else {
    double v9 = v8;
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
  {
    [(SUUIItemOfferButton *)itemOfferButton frame];
    double v9 = v9 - v11;
  }
  [(SUUIGiftItemView *)self _imageSize];
  double v13 = v12;
  double rect = v14;
  [(SUUIGiftItemView *)self _imageEdgeInsets];
  double v16 = v15;
  double v68 = v17;
  double v19 = v18;
  double v21 = v20;
  BOOL v22 = [(SUUIGiftItemView *)self leftToRight];
  [(SUUIGiftItemView *)self _paddingLeading];
  double v24 = v23;
  if (!v22)
  {
    double v25 = v69 - v23;
    [(UIImageView *)self->_itemImageView frame];
    if (v25 - v26 == 0.0) {
      double v24 = v13;
    }
    else {
      double v24 = v25 - v26;
    }
  }
  float v27 = v16 + (v6 - v16 - v19 - rect) * 0.5;
  double v28 = floorf(v27);
  itemImageView = self->_itemImageView;
  if (itemImageView)
  {
    [(UIImageView *)itemImageView frame];
    double v13 = v30;
    float v32 = (rect - v31) * 0.5;
    -[UIImageView setFrame:](self->_itemImageView, "setFrame:", v24, v28 + floorf(v32));
  }
  uint64_t v77 = 0;
  v78 = (double *)&v77;
  uint64_t v79 = 0x3010000000;
  v80 = "";
  long long v81 = *MEMORY[0x263F00148];
  if ([(SUUIGiftItemView *)self leftToRight])
  {
    v82.origin.x = v24;
    v82.origin.y = v28;
    v82.size.width = v13;
    v82.size.height = rect;
    double v33 = v21 + CGRectGetMaxX(v82);
  }
  else
  {
    [(SUUIGiftItemView *)self _paddingTrailing];
  }
  v34 = v78;
  v78[4] = v33;
  v34[5] = v28;
  [(UILabel *)self->_titleLabel frame];
  double v36 = v35;
  double v37 = v78[4];
  [(SUUIGiftItemView *)self _paddingLeading];
  double v39 = v38;
  [(SUUIGiftItemView *)self _paddingTrailing];
  double v41 = v40;
  BOOL v42 = [(SUUIGiftItemView *)self leftToRight];
  double v43 = v68;
  if (v42) {
    double v43 = v21;
  }
  double v44 = v69 - v39 - v41 - v13 - v43;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v44, 1.79769313e308);
  double v46 = v45;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v37, v36, v44, v45);
  uint64_t v73 = 0;
  v74 = (double *)&v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __34__SUUIGiftItemView_layoutSubviews__block_invoke;
  v72[3] = &unk_265400A28;
  v72[4] = &v73;
  [(SUUIGiftItemView *)self _enumerateMetadataViewsUsingBlock:v72];
  float v47 = (rect - v74[3]) * 0.5;
  v78[5] = v28 + floorf(v47);
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __34__SUUIGiftItemView_layoutSubviews__block_invoke_2;
  v71[3] = &unk_265400A50;
  v71[4] = self;
  v71[5] = &v77;
  *(double *)&v71[6] = v9;
  *(double *)&v71[7] = v44;
  *(double *)&v71[8] = v37;
  *(double *)&v71[9] = v36;
  *(double *)&v71[10] = v44;
  *(double *)&v71[11] = v46;
  [(SUUIGiftItemView *)self _enumerateMetadataViewsUsingBlock:v71];
  if (self->_userRatingCountLabel)
  {
    [(UIImageView *)self->_starRatingImageView frame];
    double v49 = v48;
    double v51 = v50;
    CGFloat v53 = v52;
    double v55 = v54;
    [(UILabel *)self->_userRatingCountLabel frame];
    double v57 = v56;
    if ([(SUUIGiftItemView *)self leftToRight])
    {
      v83.origin.x = v49;
      v83.origin.y = v51;
      v83.size.width = v53;
      v83.size.height = v55;
      CGFloat v58 = CGRectGetMaxX(v83) + 3.0;
      double v59 = v9 - v58;
      double v9 = v58;
    }
    else
    {
      double v59 = v49 + -3.0;
    }
    float v60 = (v55 - v57) * 0.5;
    -[UILabel setFrame:](self->_userRatingCountLabel, "setFrame:", v9, v51 + floorf(v60) + -1.0, v59, v57);
  }
  v61 = self->_itemOfferButton;
  if (v61)
  {
    [(SUUIItemOfferButton *)v61 frame];
    double v63 = v62;
    double v65 = v64;
    if ([(SUUIGiftItemView *)self leftToRight])
    {
      [(SUUIGiftItemView *)self _paddingTrailing];
      double v67 = v69 - v66 - v63;
    }
    else
    {
      [(SUUIGiftItemView *)self _paddingTrailing];
    }
    -[SUUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v67, (rect - v65) * 0.5 + v28, v63, v65);
  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
}

double __34__SUUIGiftItemView_layoutSubviews__block_invoke(uint64_t a1, void *a2, double a3)
{
  [a2 frame];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v6 + 24) + v5 + a3;
  *(double *)(v6 + 24) = result;
  return result;
}

void __34__SUUIGiftItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  [v15 frame];
  double v6 = v5;
  double v8 = v7;
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v12 = *(double *)(v10 + 32);
  double v11 = *(double *)(v10 + 40);
  id v13 = (id)v9[61];
  int v14 = [v9 leftToRight];
  if (v13 == v15)
  {
    if ((v14 & 1) == 0) {
      double v12 = *(double *)(a1 + 64) + *(double *)(a1 + 80) - v6;
    }
  }
  else if (v14)
  {
    double v6 = *(double *)(a1 + 48) - v12;
  }
  else
  {
    double v6 = *(double *)(a1 + 56);
  }
  objc_msgSend(v15, "setFrame:", v12, v11, v6, v8);
  v17.origin.x = v12;
  v17.origin.y = v11;
  v17.size.width = v6;
  v17.size.height = v8;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v17) + a3;
}

- (void)setBackgroundColor:(id)a3
{
  itemImageView = self->_itemImageView;
  id v5 = a3;
  [(UIImageView *)itemImageView setBackgroundColor:v5];
  [(SUUIItemOfferButton *)self->_itemOfferButton setBackgroundColor:v5];
  [(UIImageView *)self->_starRatingImageView setBackgroundColor:v5];
  [(UILabel *)self->_subtitleLabel1 setBackgroundColor:v5];
  [(UILabel *)self->_subtitleLabel2 setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  [(UILabel *)self->_userRatingCountLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftItemView;
  [(SUUIGiftItemView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SUUIGiftItemView *)self _imageEdgeInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SUUIGiftItemView *)self _imageSize];
  double v12 = v11;
  double v14 = v13;
  uint64_t v24 = 0;
  double v25 = (double *)&v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  [(SUUIGiftItemView *)self _paddingTrailing];
  double v16 = v15;
  [(SUUIGiftItemView *)self _paddingLeading];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __33__SUUIGiftItemView_sizeThatFits___block_invoke;
  v23[3] = &unk_265400A78;
  *(double *)&v23[5] = width - v16 - v17 - v12 - v10;
  v23[4] = &v24;
  [(SUUIGiftItemView *)self _enumerateMetadataViewsUsingBlock:v23];
  double v18 = v25[3];
  if (v14 >= v18) {
    double v18 = v14;
  }
  float v19 = v8 + v6 + v18;
  double v20 = ceilf(v19);
  _Block_object_dispose(&v24, 8);
  double v21 = width;
  double v22 = v20;
  result.height = v22;
  result.double width = v21;
  return result;
}

double __33__SUUIGiftItemView_sizeThatFits___block_invoke(uint64_t a1, void *a2, double a3)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + a3 + *(double *)(v6 + 24);
  *(double *)(v6 + 24) = result;
  return result;
}

- (void)_itemOfferConfirmAction:(id)a3
{
  id v5 = +[SUUIItemStateCenter defaultCenter];
  id v4 = (id)[v5 performActionForItem:self->_item clientContext:self->_clientContext];
}

- (void)_enumerateMetadataViewsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, unsigned __int8 *, double))a3;
  v14[0] = self->_titleLabel;
  v14[1] = self->_subtitleLabel1;
  id v5 = self->_subtitleLabel2;
  double v15 = (UIImageView *)v5;
  double v16 = 0;
  long long v12 = xmmword_2568A08A0;
  long long v13 = unk_2568A08B0;
  int64_t itemStyle = self->_itemStyle;
  if (itemStyle == 3 || itemStyle == 2)
  {
    *((void *)&v12 + 1) = 0x4010000000000000;
    double v15 = self->_starRatingImageView;
  }
  else if (!itemStyle)
  {
    *(void *)&long long v13 = 0x4010000000000000;
    double v16 = self->_starRatingImageView;
  }
  unint64_t v7 = 0;
  unsigned __int8 v11 = 0;
  do
  {
    uint64_t v8 = v14[v7];
    if (v8)
    {
      v4[2](v4, v8, &v11, *((double *)&v12 + v7));
      int v9 = v11;
    }
    else
    {
      int v9 = 0;
    }
    if (v7 > 2) {
      break;
    }
    ++v7;
  }
  while (!v9);
  for (uint64_t i = 3; i != -1; --i)
}

- (UIEdgeInsets)_imageEdgeInsets
{
  int64_t itemStyle = self->_itemStyle;
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  if (itemStyle == 2) {
    double v5 = 30.0;
  }
  else {
    double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  }
  if (itemStyle == 1)
  {
    double v6 = 5.0;
  }
  else
  {
    double v4 = v5;
    double v6 = *MEMORY[0x263F834E8];
  }
  if (itemStyle) {
    double v7 = v4;
  }
  else {
    double v7 = 30.0;
  }
  if (itemStyle) {
    double v8 = 9.0;
  }
  else {
    double v8 = 8.0;
  }
  if (itemStyle) {
    double v3 = v6;
  }
  double v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v3;
  return result;
}

- (CGSize)_imageSize
{
  double v3 = [(SUUIGiftItemView *)self artworkContext];
  [v3 imageSizeForItem:self->_item];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (id)_newLabel
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v2 setTextAlignment:4];
  double v3 = [MEMORY[0x263F825C8] orangeColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (double)_paddingLeading
{
  double result = 0.0;
  if (!self->_itemStyle) {
    return 15.0;
  }
  return result;
}

- (double)_paddingTrailing
{
  double result = 0.0;
  if (!self->_itemStyle) {
    return 15.0;
  }
  return result;
}

- (void)_reloadItemState:(BOOL)a3
{
  if (self->_itemStyle == 3)
  {
    BOOL v3 = a3;
    if ([(SUUIItemState *)self->_itemState state])
    {
      unint64_t v5 = [(SUUIItemState *)self->_itemState state];
      [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:v5 == 8];
      if (v5 != 8)
      {
        id v6 = [(SUUIGiftItemView *)self itemOfferButton];
        [(SUUIItemOfferButton *)self->_itemOfferButton setValuesUsingItemOffer:0 itemState:self->_itemState clientContext:self->_clientContext animated:v3];
        [(SUUIItemOfferButton *)self->_itemOfferButton sizeToFit];
      }
    }
    else
    {
      [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];
    }
    [(SUUIGiftItemView *)self setNeedsLayout];
  }
}

- (void)_reloadSubtitles
{
  unint64_t itemStyle = self->_itemStyle;
  switch(itemStyle)
  {
    case 0uLL:
      double v25 = self->_categoryName;
      uint64_t v4 = 480;
      goto LABEL_5;
    case 1uLL:
      double v25 = self->_artistName;
      uint64_t v4 = 416;
LABEL_5:
      double v7 = *(Class *)((char *)&self->super.super.super.isa + v4);
      id v6 = v7;
      goto LABEL_9;
    case 2uLL:
      id v6 = 0;
      uint64_t v8 = 416;
      goto LABEL_8;
    case 3uLL:
      id v6 = 0;
      uint64_t v8 = 408;
LABEL_8:
      double v7 = *(Class *)((char *)&self->super.super.super.isa + v8);
      double v25 = (NSString *)v7;
LABEL_9:
      id v9 = v7;
      unint64_t itemStyle = self->_itemStyle;
      unint64_t v5 = v25;
      break;
    default:
      unint64_t v5 = 0;
      id v6 = 0;
      break;
  }
  uint64_t v26 = v5;
  if (itemStyle > 3)
  {
    double v10 = 0;
  }
  else
  {
    double v10 = [MEMORY[0x263F81708] systemFontOfSize:dbl_2568A08C0[itemStyle]];
  }
  unsigned __int8 v11 = [(UILabel *)self->_subtitleLabel2 text];
  if (v26 != v11 && ([v6 isEqualToString:v11] & 1) == 0)
  {
    subtitleLabel2 = self->_subtitleLabel2;
    if (v26)
    {
      if (!subtitleLabel2)
      {
        long long v13 = [(SUUIGiftItemView *)self _newLabel];
        double v14 = self->_subtitleLabel2;
        self->_subtitleLabel2 = v13;

        [(UILabel *)self->_subtitleLabel2 setFont:v10];
        double v15 = self->_subtitleLabel2;
        double v16 = [(SUUIGiftItemView *)self _subtitleColor];
        [(UILabel *)v15 setTextColor:v16];

        [(SUUIGiftItemView *)self addSubview:self->_subtitleLabel2];
        subtitleLabel2 = self->_subtitleLabel2;
      }
      [(UILabel *)subtitleLabel2 setText:v6];
      [(UILabel *)self->_subtitleLabel2 sizeToFit];
    }
    else
    {
      [(UILabel *)subtitleLabel2 removeFromSuperview];
      uint64_t v17 = self->_subtitleLabel2;
      self->_subtitleLabel2 = 0;
    }
  }
  double v18 = [(UILabel *)self->_subtitleLabel1 text];

  if (v26 != v18 && ![(NSString *)v26 isEqualToString:v18])
  {
    subtitleLabel1 = self->_subtitleLabel1;
    if (v26)
    {
      if (!subtitleLabel1)
      {
        double v20 = [(SUUIGiftItemView *)self _newLabel];
        double v21 = self->_subtitleLabel1;
        self->_subtitleLabel1 = v20;

        [(UILabel *)self->_subtitleLabel1 setFont:v10];
        double v22 = self->_subtitleLabel1;
        double v23 = [(SUUIGiftItemView *)self _subtitleColor];
        [(UILabel *)v22 setTextColor:v23];

        [(SUUIGiftItemView *)self addSubview:self->_subtitleLabel1];
        subtitleLabel1 = self->_subtitleLabel1;
      }
      [(UILabel *)subtitleLabel1 setText:v26];
      [(UILabel *)self->_subtitleLabel1 sizeToFit];
    }
    else
    {
      [(UILabel *)subtitleLabel1 removeFromSuperview];
      uint64_t v24 = self->_subtitleLabel1;
      self->_subtitleLabel1 = 0;
    }
  }
}

- (void)_reloadUserRatingViews
{
  if (self->_numberOfUserRatings < 1 || self->_itemStyle == 1)
  {
    [(UILabel *)self->_userRatingCountLabel removeFromSuperview];
    userRatingCountLabel = self->_userRatingCountLabel;
    self->_userRatingCountLabel = 0;

    [(UIImageView *)self->_starRatingImageView removeFromSuperview];
    starRatingImageView = self->_starRatingImageView;
    self->_starRatingImageView = 0;
  }
  else
  {
    if (!self->_userRatingCountLabel)
    {
      unint64_t v5 = [(SUUIGiftItemView *)self _newLabel];
      id v6 = self->_userRatingCountLabel;
      self->_userRatingCountLabel = v5;

      double v7 = self->_userRatingCountLabel;
      uint64_t v8 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
      [(UILabel *)v7 setFont:v8];

      id v9 = self->_userRatingCountLabel;
      double v10 = [(SUUIGiftItemView *)self _userRatingColor];
      [(UILabel *)v9 setTextColor:v10];

      [(SUUIGiftItemView *)self addSubview:self->_userRatingCountLabel];
    }
    id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v11 setNumberStyle:1];
    [v11 setUsesGroupingSeparator:0];
    long long v12 = self->_userRatingCountLabel;
    long long v13 = NSString;
    double v14 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
    double v15 = [v11 stringFromNumber:v14];
    double v16 = [v13 stringWithFormat:@"(%@)", v15];
    [(UILabel *)v12 setText:v16];

    [(UILabel *)self->_userRatingCountLabel sizeToFit];
    if (!self->_starRatingImageView)
    {
      uint64_t v17 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      double v18 = self->_starRatingImageView;
      self->_starRatingImageView = v17;

      float v19 = self->_starRatingImageView;
      double v20 = [(SUUIGiftItemView *)self backgroundColor];
      [(UIImageView *)v19 setBackgroundColor:v20];

      [(UIImageView *)self->_starRatingImageView setContentMode:7];
      [(SUUIGiftItemView *)self addSubview:self->_starRatingImageView];
    }
    starRatingImageView = +[SUUIRatingStarsCache cacheWithProperties:1];
    double v21 = self->_starRatingImageView;
    double v22 = [starRatingImageView ratingStarsImageForRating:self->_userRating];
    [(UIImageView *)v21 setImage:v22];

    [(UIImageView *)self->_starRatingImageView sizeToFit];
  }

  [(SUUIGiftItemView *)self setNeedsLayout];
}

- (id)_subtitleColor
{
  theme = self->_theme;
  if (theme) {
    [(SUUIGiftTheme *)theme bodyTextColor];
  }
  else {
  BOOL v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  return v3;
}

- (id)_titleColor
{
  theme = self->_theme;
  if (theme) {
    [(SUUIGiftTheme *)theme primaryTextColor];
  }
  else {
  BOOL v3 = [MEMORY[0x263F825C8] labelColor];
  }
  return v3;
}

- (id)_userRatingColor
{
  theme = self->_theme;
  if (theme) {
    [(SUUIGiftTheme *)theme primaryTextColor];
  }
  else {
  BOOL v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  return v3;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (int64_t)giftItemStyle
{
  return self->_itemStyle;
}

- (SUUIItem)item
{
  return self->_item;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (NSString)price
{
  return self->_price;
}

- (SUUIGiftTheme)theme
{
  return self->_theme;
}

- (float)userRating
{
  return self->_userRating;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_subtitleLabel2, 0);
  objc_storeStrong((id *)&self->_subtitleLabel1, 0);
  objc_storeStrong((id *)&self->_starRatingImageView, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end