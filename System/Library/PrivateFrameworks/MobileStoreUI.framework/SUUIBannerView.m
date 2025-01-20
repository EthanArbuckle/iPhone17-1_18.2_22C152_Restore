@interface SUUIBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)screenshotImages;
- (NSString)artistName;
- (NSString)title;
- (SSLookupItemOffer)itemOffer;
- (SUUIBannerView)initWithFrame:(CGRect)a3;
- (SUUIClientContext)clientContext;
- (SUUIItemState)itemState;
- (UIControl)closeButton;
- (UIControl)itemOfferButton;
- (UIImage)iconImage;
- (float)userRating;
- (id)_newDefaultLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_reloadItemState;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setItemOffer:(id)a3;
- (void)setItemState:(id)a3;
- (void)setScreenshotImages:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(float)a3;
@end

@implementation SUUIBannerView

- (SUUIBannerView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIBannerView;
  v3 = -[SUUIBannerView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIBannerCloseButton);
    closeButton = v3->_closeButton;
    v3->_closeButton = &v4->super;

    [(UIButton *)v3->_closeButton setAdjustsImageWhenHighlighted:0];
    v6 = v3->_closeButton;
    v7 = [MEMORY[0x263F827E8] symbolImageNamed:@"xmark"];
    [(UIButton *)v6 setImage:v7 forState:0];

    -[UIButton setSize:](v3->_closeButton, "setSize:", 11.0, 11.0);
    v8 = v3->_closeButton;
    v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UIButton *)v8 setTintColor:v9];

    [(SUUIBannerView *)v3 addSubview:v3->_closeButton];
    v10 = [MEMORY[0x263F825C8] separatorColor];
    v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      v13 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      separatorView = v3->_separatorView;
      v3->_separatorView = v13;

      [(UIView *)v3->_separatorView setBackgroundColor:v10];
      [(SUUIBannerView *)v3 addSubview:v3->_separatorView];
    }
    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v15;

    [(UIView *)v3->_bottomBorderView setBackgroundColor:v10];
    [(SUUIBannerView *)v3 addSubview:v3->_bottomBorderView];
    v17 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [(SUUIBannerView *)v3 setBackgroundColor:v17];
  }
  return v3;
}

- (NSString)artistName
{
  return [(UILabel *)self->_artistNameLabel text];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

- (UIControl)itemOfferButton
{
  itemOfferButton = self->_itemOfferButton;
  if (!itemOfferButton)
  {
    v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    v5 = self->_itemOfferButton;
    self->_itemOfferButton = v4;

    [(UIButton *)self->_itemOfferButton setHidden:1];
    v6 = [(UIButton *)self->_itemOfferButton titleLabel];
    v7 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v6 setFont:v7];

    [(SUUIBannerView *)self addSubview:self->_itemOfferButton];
    itemOfferButton = self->_itemOfferButton;
  }
  return (UIControl *)itemOfferButton;
}

- (NSArray)screenshotImages
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_screenshotImageViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "image", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setArtistName:(id)a3
{
  id v9 = a3;
  id v4 = [(SUUIBannerView *)self artistName];
  if (v4 != v9 && ([v9 isEqualToString:v4] & 1) == 0)
  {
    artistNameLabel = self->_artistNameLabel;
    if (v9)
    {
      if (!artistNameLabel)
      {
        uint64_t v6 = [(SUUIBannerView *)self _newDefaultLabel];
        uint64_t v7 = self->_artistNameLabel;
        self->_artistNameLabel = v6;

        [(SUUIBannerView *)self addSubview:self->_artistNameLabel];
        artistNameLabel = self->_artistNameLabel;
      }
      -[UILabel setText:](artistNameLabel, "setText:");
      [(UILabel *)self->_artistNameLabel sizeToFit];
    }
    else
    {
      [(UILabel *)artistNameLabel removeFromSuperview];
      v8 = self->_artistNameLabel;
      self->_artistNameLabel = 0;
    }
    [(SUUIBannerView *)self setNeedsLayout];
  }
}

- (void)setClientContext:(id)a3
{
  uint64_t v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    closeButton = self->_closeButton;
    if (*p_clientContext) {
      [(SUUIClientContext *)*p_clientContext localizedStringForKey:@"BANNER_CLOSE_BUTTON"];
    }
    else {
    v8 = +[SUUIClientContext localizedStringForKey:@"BANNER_CLOSE_BUTTON" inBundles:0];
    }
    [(UIButton *)closeButton setAccessibilityLabel:v8];

    [(SUUIBannerView *)self _reloadItemState];
    uint64_t v5 = v9;
  }
}

- (void)setScreenshotImages:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = self->_screenshotImageViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  screenshotImageViews = self->_screenshotImageViews;
  self->_screenshotImageViews = v10;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        id v18 = objc_alloc(MEMORY[0x263F82828]);
        objc_super v19 = objc_msgSend(v18, "initWithImage:", v17, (void)v20);
        [(NSMutableArray *)self->_screenshotImageViews addObject:v19];
        [(SUUIBannerView *)self addSubview:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  [(SUUIBannerView *)self setNeedsLayout];
}

- (void)setIconImage:(id)a3
{
  id v10 = a3;
  id v4 = [(UIImageView *)self->_iconImageView image];

  if (v4 != v10)
  {
    iconImageView = self->_iconImageView;
    if (v10)
    {
      if (!iconImageView)
      {
        uint64_t v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        uint64_t v8 = self->_iconImageView;
        self->_iconImageView = v7;

        [(SUUIBannerView *)self addSubview:self->_iconImageView];
        iconImageView = self->_iconImageView;
      }
      -[UIImageView setImage:](iconImageView, "setImage:");
      [(UIImageView *)self->_iconImageView sizeToFit];
    }
    else
    {
      [(UIImageView *)iconImageView removeFromSuperview];
      uint64_t v9 = self->_iconImageView;
      self->_iconImageView = 0;
    }
    uint64_t v5 = [(SUUIBannerView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setItemOffer:(id)a3
{
  uint64_t v5 = (SSLookupItemOffer *)a3;
  p_itemOffer = &self->_itemOffer;
  if (self->_itemOffer != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_itemOffer, a3);
    p_itemOffer = (SSLookupItemOffer **)[(SUUIBannerView *)self _reloadItemState];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_itemOffer, v5);
}

- (void)setItemState:(id)a3
{
  uint64_t v5 = (SUUIItemState *)a3;
  p_itemState = &self->_itemState;
  if (self->_itemState != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_itemState, a3);
    p_itemState = (SUUIItemState **)[(SUUIBannerView *)self _reloadItemState];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_itemState, v5);
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIBannerView *)self title];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        uint64_t v7 = self->_titleLabel;
        self->_titleLabel = v6;

        uint64_t v8 = self->_titleLabel;
        uint64_t v9 = [MEMORY[0x263F825C8] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        id v10 = self->_titleLabel;
        long long v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:2];
        id v12 = self->_titleLabel;
        uint64_t v13 = [MEMORY[0x263F825C8] labelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIBannerView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      uint64_t v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIBannerView *)self setNeedsLayout];
  }
}

- (void)setUserRating:(float)a3
{
  userRatingStarImageView = self->_userRatingStarImageView;
  if (self->_userRating == a3)
  {
    if (userRatingStarImageView) {
      return;
    }
    goto LABEL_5;
  }
  if (!userRatingStarImageView)
  {
LABEL_5:
    uint64_t v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    uint64_t v7 = self->_userRatingStarImageView;
    self->_userRatingStarImageView = v6;

    [(SUUIBannerView *)self addSubview:self->_userRatingStarImageView];
  }
  self->_userRating = a3;
  id v10 = +[SUUIRatingStarsCache cacheWithProperties:1];
  uint64_t v8 = self->_userRatingStarImageView;
  uint64_t v9 = [v10 ratingStarsImageForRating:self->_userRating];
  [(UIImageView *)v8 setImage:v9];

  [(UIImageView *)self->_userRatingStarImageView sizeToFit];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SUUIBannerView;
  -[SUUIBannerView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  uint64_t v7 = (SUUIBannerView *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    p_closeButton = &self->_closeButton;
    [(UIButton *)self->_closeButton frame];
    CGRect v14 = CGRectInset(v13, -10.0, -30.0);
    v12.CGFloat x = x;
    v12.CGFloat y = y;
    if (CGRectContainsPoint(v14, v12)
      || (p_closeButton = &self->_itemOfferButton, ([(UIButton *)self->_itemOfferButton isHidden] & 1) == 0))
    {
      uint64_t v7 = *p_closeButton;
    }
    else
    {
      uint64_t v7 = self;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  [(SUUIBannerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SUUIBannerView *)self layoutMargins];
  double v12 = v11;
  [(SUUIBannerView *)self layoutMargins];
  double v13 = v4 + v12;
  double v14 = v6 + 0.0;
  double v16 = v8 - (v12 + v15);
  int v17 = [(SUUIBannerView *)self _shouldReverseLayoutDirection];
  [(UIButton *)self->_closeButton frame];
  double v19 = v18;
  double v21 = v20;
  if (v17)
  {
    v192.origin.CGFloat x = v13;
    v192.origin.CGFloat y = v14;
    v192.size.width = v16;
    v192.size.height = v10;
    double v22 = CGRectGetMaxX(v192) - v19 + -10.0;
  }
  else
  {
    double v22 = v13 + 10.0;
  }
  float v23 = (v10 - v21) * 0.5;
  double v24 = floorf(v23);
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v22, v24, v19, v21);
  double v180 = v14;
  *(double *)v181 = v13;
  double v25 = v13;
  double v26 = v14;
  double v27 = v16;
  double v28 = v10;
  if (v17)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v25);
    double v29 = MinX + 10.0;
    v193.origin.CGFloat x = v22;
    v193.origin.CGFloat y = v24;
    v193.size.width = v19;
    v193.size.height = v21;
    double MaxX = CGRectGetMinX(v193);
    double v31 = -9.0;
  }
  else
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v25);
    double v29 = MinX + -10.0;
    v194.origin.CGFloat x = v22;
    v194.origin.CGFloat y = v24;
    v194.size.width = v19;
    v194.size.height = v21;
    double MaxX = CGRectGetMaxX(v194);
    double v31 = 9.0;
  }
  double v32 = MaxX + v31;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(UIImageView *)iconImageView frame];
    double v35 = v34;
    uint64_t v37 = v36;
    double v38 = 0.0;
    if (v17) {
      double v38 = v34;
    }
    double v39 = v32 - v38;
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v32 - v38, 10.0);
    double v40 = 10.0;
    double v41 = v39;
    double v42 = v35;
    uint64_t v43 = v37;
    if (v17)
    {
      double v44 = CGRectGetMinX(*(CGRect *)&v41);
      double v45 = -8.0;
    }
    else
    {
      double v44 = CGRectGetMaxX(*(CGRect *)&v41);
      double v45 = 8.0;
    }
    double v32 = v44 + v45;
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton && ([(UIButton *)itemOfferButton isHidden] & 1) == 0)
  {
    [(UIButton *)self->_itemOfferButton frame];
    double v49 = v47;
    double v50 = v48;
    double v51 = 0.0;
    if (!v17) {
      double v51 = v47;
    }
    double v52 = v29 - v51;
    float v53 = (v10 - v48) * 0.5;
    double v54 = floorf(v53);
    -[UIButton setFrame:](self->_itemOfferButton, "setFrame:", v52, v54);
    double v55 = v52;
    double v56 = v54;
    double v57 = v49;
    double v58 = v50;
    if (v17)
    {
      double v59 = CGRectGetMaxX(*(CGRect *)&v55);
      v60 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v61 = [v60 userInterfaceIdiom];

      double v62 = 5.0;
      if ((v61 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v62 = 30.0;
      }
      double v29 = v59 + v62;
    }
    else
    {
      double v63 = CGRectGetMinX(*(CGRect *)&v55);
      v64 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v65 = [v64 userInterfaceIdiom];

      double v66 = 5.0;
      if ((v65 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v66 = 30.0;
      }
      double v29 = v63 - v66;
    }
  }
  double v179 = v16;
  uint64_t v67 = MEMORY[0x263F001A8];
  double v68 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v69 = *(double *)(MEMORY[0x263F001A8] + 24);
  artistNameLabel = self->_artistNameLabel;
  if (artistNameLabel)
  {
    [(UILabel *)artistNameLabel frame];
    double v72 = v71;
    double v74 = v73;
    v75 = [MEMORY[0x263F82B60] mainScreen];
    [v75 scale];
    double v77 = 1.0 / v76 + 2.0;
  }
  else
  {
    double v77 = 0.0;
    double v74 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v72 = *(double *)(MEMORY[0x263F001A8] + 8);
  }
  itemStateLabel = self->_itemStateLabel;
  *(double *)&v181[1] = v68;
  *(double *)&v181[2] = v69;
  double v79 = v68;
  if (itemStateLabel)
  {
    [(UILabel *)itemStateLabel frame];
    v181[2] = v80;
  }
  double v177 = v79;
  double v81 = v29 - v32;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v29 - v32, 1.79769313e308);
    double v84 = v83;
    v85 = [MEMORY[0x263F82B60] mainScreen];
    [v85 scale];
    double v77 = v77 + 1.0 / v86;
  }
  else
  {
    double v84 = v69;
  }
  double v176 = v84;
  if (([(SUUIItemState *)self->_itemState state] & 4) != 0)
  {
    float v92 = (v10 - (v77 + *(double *)&v181[2] + v74 + v84)) * 0.5;
    double v93 = v84;
    double v94 = (float)(ceilf(v92) + 0.0);
    if (self->_titleLabel)
    {
      double v95 = v32;
      double v96 = v94;
      double v97 = v81;
      double MaxY = CGRectGetMaxY(*(CGRect *)(&v93 - 3));
      v99 = [MEMORY[0x263F82B60] mainScreen];
      [v99 scale];
      double v101 = MaxY + 1.0 / v100;

      *(double *)&v181[1] = v94;
      double v94 = v101;
    }
    if (!self->_artistNameLabel)
    {
      double v106 = v94;
      goto LABEL_55;
    }
    double v102 = v32;
    double v103 = v94;
    double v104 = v81;
    double v69 = v74;
  }
  else
  {
    userRatingStarImageView = self->_userRatingStarImageView;
    if (userRatingStarImageView)
    {
      [(UIImageView *)userRatingStarImageView frame];
      double rect = v88;
      double v69 = v89;
      v90 = [MEMORY[0x263F82B60] mainScreen];
      [v90 scale];
      double v77 = v77 + 1.0 / v91 + 2.0;
    }
    else
    {
      double rect = *(double *)(v67 + 16);
    }
    float v105 = (v10 - (v77 + *(double *)&v181[2] + v74 + v84 + v69)) * 0.5;
    double v106 = (float)(ceilf(v105) + 0.0);
    if (self->_titleLabel)
    {
      v195.origin.CGFloat x = v32;
      v195.origin.CGFloat y = v106;
      v195.size.width = v81;
      v195.size.height = v84;
      double v107 = CGRectGetMaxY(v195);
      v108 = [MEMORY[0x263F82B60] mainScreen];
      [v108 scale];
      double v110 = v107 + 1.0 / v109;

      *(double *)&v181[1] = v106;
      double v106 = v110;
    }
    if (self->_artistNameLabel)
    {
      v196.origin.CGFloat x = v32;
      v196.origin.CGFloat y = v106;
      v196.size.width = v81;
      v196.size.height = v74;
      double v111 = CGRectGetMaxY(v196);
      v112 = [MEMORY[0x263F82B60] mainScreen];
      [v112 scale];
      double v114 = v111 + 1.0 / v113 + 2.0;

      double v94 = v106;
      double v106 = v114;
    }
    else
    {
      double v94 = v72;
    }
    if (!self->_userRatingStarImageView) {
      goto LABEL_54;
    }
    double v115 = -1.0;
    if (v17) {
      double v115 = 1.0;
    }
    double v116 = v115 + v32;
    double v117 = 0.0;
    if (v17) {
      double v117 = rect;
    }
    double v102 = v116 - v117;
    v118 = [MEMORY[0x263F82B60] mainScreen];
    [v118 scale];
    double v103 = v106 + 1.0 / v119;

    -[UIImageView setFrame:](self->_userRatingStarImageView, "setFrame:", v102, v103, rect, v69);
    double v104 = rect;
  }
  double v120 = v102;
  double v121 = v103;
  double v122 = v69;
  double v123 = CGRectGetMaxY(*(CGRect *)(&v104 - 2));
  v124 = [MEMORY[0x263F82B60] mainScreen];
  [v124 scale];
  double v106 = v123 + 1.0 / v125 + 2.0;

LABEL_54:
  double v72 = v94;
LABEL_55:
  if (self->_itemStateLabel) {
    double v126 = v106;
  }
  else {
    double v126 = v177;
  }
  -[UILabel setFrame:](self->_artistNameLabel, "setFrame:", v32, v72, v81, v74);
  -[UILabel setFrame:](self->_itemStateLabel, "setFrame:", v32, v126, v81, *(double *)&v181[2]);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v32, *(double *)&v181[1], v81, v176);
  uint64_t v127 = [(NSMutableArray *)self->_screenshotImageViews count];
  separatorView = self->_separatorView;
  if (separatorView)
  {
    [(UIView *)separatorView frame];
    v129 = [MEMORY[0x263F82B60] mainScreen];
    [v129 scale];
    double v131 = 1.0 / v130;

    -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, 10.0, v131, v10 + -20.0);
    [(UIView *)self->_separatorView setHidden:v127 == 0];
  }
  BOOL v132 = v127 < 1;
  uint64_t v133 = v127 - 1;
  double v134 = *(double *)v181;
  double v135 = v179;
  if (!v132)
  {
    if (v17) {
      double v136 = -15.0;
    }
    else {
      double v136 = 15.0;
    }
    double v137 = v180;
    double v138 = v10;
    if (v17) {
      double v139 = CGRectGetMinX(*(CGRect *)&v134) + 15.0;
    }
    else {
      double v139 = CGRectGetMaxX(*(CGRect *)&v134) + -15.0;
    }
    double v140 = v136 + MinX;
    double v141 = (float)((float)v133 * 15.0);
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    v142 = self->_screenshotImageViews;
    uint64_t v143 = [(NSMutableArray *)v142 countByEnumeratingWithState:&v185 objects:v190 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v186;
      do
      {
        for (uint64_t i = 0; i != v144; ++i)
        {
          if (*(void *)v186 != v145) {
            objc_enumerationMutation(v142);
          }
          [*(id *)(*((void *)&v185 + 1) + 8 * i) frame];
          double v141 = v141 + v147;
        }
        uint64_t v144 = [(NSMutableArray *)v142 countByEnumeratingWithState:&v185 objects:v190 count:16];
      }
      while (v144);
    }

    float v148 = (v139 - v140) * 0.5;
    double v149 = v140 - floorf(v148);
    float v150 = (v139 - v140 - v141) * 0.5;
    double v151 = v140 + floorf(v150);
    if (v17) {
      double v152 = v149;
    }
    else {
      double v152 = v151;
    }
    long long v183 = 0u;
    long long v184 = 0u;
    *(_OWORD *)&v181[3] = 0u;
    long long v182 = 0u;
    v153 = self->_screenshotImageViews;
    uint64_t v154 = [(NSMutableArray *)v153 countByEnumeratingWithState:&v181[3] objects:v189 count:16];
    if (v154)
    {
      uint64_t v155 = v154;
      uint64_t v156 = *(void *)v182;
      do
      {
        for (uint64_t j = 0; j != v155; ++j)
        {
          if (*(void *)v182 != v156) {
            objc_enumerationMutation(v153);
          }
          v158 = *(void **)(v181[4] + 8 * j);
          [v158 frame];
          CGFloat v160 = v159;
          CGFloat v162 = v161;
          float v163 = (v10 - v161) * 0.5;
          CGFloat v164 = floorf(v163);
          objc_msgSend(v158, "setFrame:", v152, v164);
          v197.origin.CGFloat x = v152;
          v197.origin.CGFloat y = v164;
          v197.size.width = v160;
          v197.size.height = v162;
          double v152 = CGRectGetMaxX(v197) + 15.0;
        }
        uint64_t v155 = [(NSMutableArray *)v153 countByEnumeratingWithState:&v181[3] objects:v189 count:16];
      }
      while (v155);
    }
  }
  bottomBorderView = self->_bottomBorderView;
  [(SUUIBannerView *)self bounds];
  double v167 = v166;
  v168 = [MEMORY[0x263F82B60] mainScreen];
  [v168 scale];
  double v170 = v167 - 1.0 / v169;
  [(SUUIBannerView *)self bounds];
  double v172 = v171;
  v173 = [MEMORY[0x263F82B60] mainScreen];
  [v173 scale];
  -[UIView setFrame:](bottomBorderView, "setFrame:", 0.0, v170, v172, 1.0 / v174);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
  uint64_t v5 = [v4 userInterfaceIdiom];

  double v6 = 95.0;
  if (v5 != 1) {
    double v6 = 84.0;
  }
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (id)_newDefaultLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v4 = [(SUUIBannerView *)self backgroundColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [v3 setFont:v5];

  double v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v3 setTextColor:v6];

  return v3;
}

- (void)_reloadItemState
{
  if (!self->_clientContext) {
    return;
  }
  unint64_t v3 = [(SUUIItemState *)self->_itemState state];
  if ((v3 & 4) == 0)
  {
    itemOffer = self->_itemOffer;
    if (!itemOffer)
    {
      id v29 = 0;
      goto LABEL_33;
    }
    double v6 = [(SSLookupItemOffer *)itemOffer price];
    [v6 floatValue];
    float v8 = v7;

    double v9 = self->_itemOffer;
    if (v8 >= 0.00000011921)
    {
      double v11 = [(SSLookupItemOffer *)v9 formattedPrice];
    }
    else
    {
      double v10 = [(SSLookupItemOffer *)v9 actionTextForType:*MEMORY[0x263F7B9A8]];
      double v11 = [v10 uppercaseString];
    }
    if (![v11 length])
    {
      id v29 = 0;
      goto LABEL_29;
    }
    double v16 = [(SSLookupItemOffer *)self->_itemOffer subscriptionType];
    int v17 = [v16 isEqualToString:*MEMORY[0x263F7B9A0]];

    clientContext = self->_clientContext;
    if (v17)
    {
      if (clientContext)
      {
        double v19 = @"BANNER_PRICE_FORMAT_PODCASTS";
LABEL_24:
        uint64_t v20 = [(SUUIClientContext *)clientContext localizedStringForKey:v19];
LABEL_28:
        double v22 = (void *)v20;
        id v29 = [NSString stringWithValidatedFormat:v20, @"%@", 0, v11 validFormatSpecifiers error];

LABEL_29:
        float v23 = self->_clientContext;
        if (v23) {
          [(SUUIClientContext *)v23 localizedStringForKey:@"BANNER_VIEW_BUTTON"];
        }
        else {
        double v14 = +[SUUIClientContext localizedStringForKey:@"BANNER_VIEW_BUTTON" inBundles:0];
        }

        if (v14) {
          goto LABEL_15;
        }
LABEL_33:
        [(UIButton *)self->_itemOfferButton setHidden:1];
        goto LABEL_34;
      }
      double v21 = @"BANNER_PRICE_FORMAT_PODCASTS";
    }
    else
    {
      if (clientContext)
      {
        double v19 = @"BANNER_PRICE_FORMAT";
        goto LABEL_24;
      }
      double v21 = @"BANNER_PRICE_FORMAT";
    }
    uint64_t v20 = +[SUUIClientContext localizedStringForKey:v21 inBundles:0];
    goto LABEL_28;
  }
  double v4 = self->_clientContext;
  if (v4) {
    [(SUUIClientContext *)v4 localizedStringForKey:@"BANNER_ITEM_STATE_INSTALLED"];
  }
  else {
  uint64_t v12 = +[SUUIClientContext localizedStringForKey:@"BANNER_ITEM_STATE_INSTALLED" inBundles:0];
  }
  double v13 = self->_clientContext;
  id v29 = (id)v12;
  if (v13) {
    [(SUUIClientContext *)v13 localizedStringForKey:@"BANNER_OPEN_BUTTON"];
  }
  else {
  double v14 = +[SUUIClientContext localizedStringForKey:@"BANNER_OPEN_BUTTON" inBundles:0];
  }
  if (!v14) {
    goto LABEL_33;
  }
LABEL_15:
  double v15 = [(SUUIBannerView *)self itemOfferButton];
  [v15 setHidden:0];
  [v15 setTitle:v14 forState:0];
  [v15 sizeToFit];

LABEL_34:
  id v24 = v29;
  itemStateLabel = self->_itemStateLabel;
  if (v29)
  {
    if (!itemStateLabel)
    {
      double v26 = [(SUUIBannerView *)self _newDefaultLabel];
      double v27 = self->_itemStateLabel;
      self->_itemStateLabel = v26;

      [(SUUIBannerView *)self addSubview:self->_itemStateLabel];
      id v24 = v29;
      itemStateLabel = self->_itemStateLabel;
    }
    [(UILabel *)itemStateLabel setText:v24];
    [(UILabel *)self->_itemStateLabel sizeToFit];
  }
  else
  {
    [(UILabel *)itemStateLabel removeFromSuperview];
    double v28 = self->_itemStateLabel;
    self->_itemStateLabel = 0;
  }
  [(UIImageView *)self->_userRatingStarImageView setHidden:(v3 >> 2) & 1];
  [(SUUIBannerView *)self setNeedsLayout];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (UIControl)closeButton
{
  return &self->_closeButton->super;
}

- (SSLookupItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (float)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingStarImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_screenshotImageViews, 0);
  objc_storeStrong((id *)&self->_itemStateLabel, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
  objc_storeStrong((id *)&self->_artistNameLabel, 0);
}

@end