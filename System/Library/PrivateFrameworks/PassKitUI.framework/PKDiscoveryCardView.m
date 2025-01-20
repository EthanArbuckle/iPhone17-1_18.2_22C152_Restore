@interface PKDiscoveryCardView
+ (CGSize)compressedSize;
+ (CGSize)expandedSize;
+ (CGSize)miniCompressedSize;
+ (double)compressedHeight;
+ (double)compressedWidth;
+ (double)cornerRadius;
+ (double)expandedHeight;
+ (double)expandedWidth;
- (BOOL)hasSafeAreaInsetOverride;
- (BOOL)isRemoving;
- (CGSize)_miniCardImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoveryArticleLayout)articleLayout;
- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5;
- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 callToActionTappedOverride:(id)a6 isWelcomeCard:(BOOL)a7;
- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 isWelcomeCard:(BOOL)a6;
- (PKDiscoveryCardViewDelegate)delegate;
- (PKDiscoveryCardViewTemplateInformation)cardTemplateInformation;
- (UIEdgeInsets)_currentContentInsets;
- (UIEdgeInsets)safeAreaOverrideInsets;
- (double)_yOffsetToHeadingLabel;
- (id)_dismissButtonColor;
- (id)_headingLabelFont;
- (id)_headingLabelTextColor;
- (id)_titleLabelFont;
- (id)_titleLabelTextColor;
- (id)callToActionTappedOverride;
- (id)dismissAction;
- (int64_t)priority;
- (unint64_t)_titleLabelNumberOfLines;
- (void)_dismissButtonPressed;
- (void)_updateForDisplayType;
- (void)layoutSubviews;
- (void)loadAndUploadImageData;
- (void)setArticleLayout:(id)a3;
- (void)setCallToActionTappedOverride:(id)a3;
- (void)setCardSize:(int64_t)a3;
- (void)setCardTemplateInformation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setDisplayType:(int64_t)a3;
- (void)setHasSafeAreaInsetOverride:(BOOL)a3;
- (void)setRemoving:(BOOL)a3;
- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation PKDiscoveryCardView

+ (double)expandedWidth
{
  unint64_t v2 = PKUIGetMinScreenType();
  v3 = (double *)((char *)&unk_1A0445078 + 8 * v2);
  if (v2 >= 0x14) {
    v3 = (double *)MEMORY[0x1E4F1DB30];
  }
  return *v3;
}

+ (double)expandedHeight
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 0.0;
  if (v2 <= 0xE) {
    return dbl_1A0445118[v2];
  }
  return result;
}

+ (CGSize)expandedSize
{
  [a1 expandedWidth];
  double v4 = v3;
  [a1 expandedHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (double)compressedWidth
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  do
  {
    unint64_t v3 = v2;
    uint64_t v2 = 5;
  }
  while (v3 > 8);
  return dbl_1A0445190[v3];
}

+ (double)compressedHeight
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 0.0;
  if (v2 <= 0xE) {
    return dbl_1A04451D8[v2];
  }
  return result;
}

+ (CGSize)compressedSize
{
  [a1 compressedWidth];
  double v4 = v3;
  [a1 compressedHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (CGSize)miniCompressedSize
{
  [a1 compressedWidth];
  double v3 = 120.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)cornerRadius
{
  return 14.0;
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5
{
  return [(PKDiscoveryCardView *)self initWithArticleLayout:a3 dismissImage:a4 cardTemplateInformation:a5 callToActionTappedOverride:0 isWelcomeCard:0];
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 isWelcomeCard:(BOOL)a6
{
  return [(PKDiscoveryCardView *)self initWithArticleLayout:a3 dismissImage:a4 cardTemplateInformation:a5 callToActionTappedOverride:0 isWelcomeCard:a6];
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 callToActionTappedOverride:(id)a6 isWelcomeCard:(BOOL)a7
{
  v91[2] = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  id v78 = a4;
  id v82 = a5;
  id v79 = a6;
  v90.receiver = self;
  v90.super_class = (Class)PKDiscoveryCardView;
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v17 = -[PKDiscoveryCardView initWithFrame:](&v90, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    p_articleLayout = (id *)&v17->_articleLayout;
    objc_storeStrong((id *)&v17->_articleLayout, a3);
    v18->_priority = [(PKDiscoveryArticleLayout *)v18->_articleLayout priority];
    v18->_isWelcomeCard = a7;
    uint64_t v19 = [v83 card];
    card = v18->_card;
    v18->_card = (PKDiscoveryCard *)v19;

    uint64_t v21 = [v83 miniCard];
    miniCard = v18->_miniCard;
    v18->_miniCard = (PKMiniDiscoveryCard *)v21;

    uint64_t v23 = [(PKDiscoveryCard *)v18->_card backgroundMedia];
    largeCardMedia = v18->_largeCardMedia;
    v18->_largeCardMedia = (PKDiscoveryMedia *)v23;

    uint64_t v25 = [(PKMiniDiscoveryCard *)v18->_miniCard backgroundMedia];
    miniCardMedia = v18->_miniCardMedia;
    v18->_miniCardMedia = (PKDiscoveryMedia *)v25;

    uint64_t v27 = [v82 copy];
    cardTemplateInformation = v18->_cardTemplateInformation;
    v18->_cardTemplateInformation = (PKDiscoveryCardViewTemplateInformation *)v27;

    v18->_displayType = [(PKDiscoveryCardViewTemplateInformation *)v18->_cardTemplateInformation displayType];
    v18->_largeCardTemplate = [(PKDiscoveryCard *)v18->_card largeCardTemplateType];
    v18->_miniCardTemplate = [(PKMiniDiscoveryCard *)v18->_miniCard miniCardTemplateType];
    uint64_t v29 = [(PKDiscoveryCardViewTemplateInformation *)v18->_cardTemplateInformation cardSize];
    v18->_currentCardSize = v29;
    v18->_shouldDisplayAsLarge = v29 == 0;
    v30 = (void *)MEMORY[0x1E4FB1618];
    v31 = [(PKDiscoveryCard *)v18->_card backgroundColor];
    v77 = objc_msgSend(v30, "pkui_colorWithPKColor:", v31);

    v32 = (void *)MEMORY[0x1E4FB1618];
    v33 = [(PKMiniDiscoveryCard *)v18->_miniCard backgroundColor];
    v76 = objc_msgSend(v32, "pkui_colorWithPKColor:", v33);

    v34 = v76;
    if (!v76) {
      v34 = v77;
    }
    if (v18->_shouldDisplayAsLarge) {
      v35 = v77;
    }
    else {
      v35 = v34;
    }
    objc_storeStrong((id *)&v18->_backgroundColor, v35);
    v81 = [(PKDiscoveryCardView *)v18 layer];
    [v81 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v81 setMasksToBounds:1];
    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v15, v16);
    miniCardBackgroundColorView = v18->_miniCardBackgroundColorView;
    v18->_miniCardBackgroundColorView = (UIView *)v36;

    [(UIView *)v18->_miniCardBackgroundColorView setContentMode:2];
    [(UIView *)v18->_miniCardBackgroundColorView setBackgroundColor:v18->_backgroundColor];
    [(PKDiscoveryCardView *)v18 addSubview:v18->_miniCardBackgroundColorView];
    if (v18->_shouldDisplayAsLarge)
    {
      id v80 = [(PKDiscoveryCard *)v18->_card title];
      v38 = [(PKDiscoveryCard *)v18->_card heading];
      [(UIView *)v18->_miniCardBackgroundColorView setHidden:1];
    }
    else
    {
      v39 = [(PKMiniDiscoveryCard *)v18->_miniCard title];
      v40 = [(PKMiniDiscoveryCard *)v18->_miniCard heading];
      if ([v39 length])
      {
        id v80 = v39;
      }
      else
      {
        id v80 = [(PKDiscoveryCard *)v18->_card title];
      }
      if ([v40 length])
      {
        id v41 = v40;
      }
      else
      {
        id v41 = [(PKDiscoveryCard *)v18->_card heading];
      }
      v38 = v41;
    }
    uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v13, v14, v15, v16);
    backgroundImageView = v18->_backgroundImageView;
    v18->_backgroundImageView = (UIImageView *)v42;

    [(UIImageView *)v18->_backgroundImageView setContentMode:2];
    [(UIImageView *)v18->_backgroundImageView setBackgroundColor:v18->_backgroundColor];
    if (!v18->_shouldDisplayAsLarge && !v18->_displayType && !v18->_miniCardTemplate) {
      [(UIImageView *)v18->_backgroundImageView _setContinuousCornerRadius:14.0];
    }
    [(PKDiscoveryCardView *)v18 addSubview:v18->_backgroundImageView];
    if (v38 && [v38 length])
    {
      uint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v13, v14, v15, v16);
      headingLabel = v18->_headingLabel;
      v18->_headingLabel = (UILabel *)v44;

      [(UILabel *)v18->_headingLabel setText:v38];
      v46 = v18->_headingLabel;
      v47 = [(PKDiscoveryCardView *)v18 _headingLabelFont];
      [(UILabel *)v46 setFont:v47];

      v48 = v18->_headingLabel;
      v49 = [(PKDiscoveryCardView *)v18 _headingLabelTextColor];
      [(UILabel *)v48 setTextColor:v49];

      [(UILabel *)v18->_headingLabel setNumberOfLines:1];
      [(UILabel *)v18->_headingLabel setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
      [(PKDiscoveryCardView *)v18 addSubview:v18->_headingLabel];
    }
    if (v80)
    {
      uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v13, v14, v15, v16);
      titleLabel = v18->_titleLabel;
      v18->_titleLabel = (UILabel *)v50;

      [(UILabel *)v18->_titleLabel setText:v80];
      v52 = v18->_titleLabel;
      v53 = [(PKDiscoveryCardView *)v18 _titleLabelFont];
      [(UILabel *)v52 setFont:v53];

      v54 = v18->_titleLabel;
      v55 = [(PKDiscoveryCardView *)v18 _titleLabelTextColor];
      [(UILabel *)v54 setTextColor:v55];

      [(UILabel *)v18->_titleLabel setNumberOfLines:[(PKDiscoveryCardView *)v18 _titleLabelNumberOfLines]];
      [(UILabel *)v18->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
      [(PKDiscoveryCardView *)v18 addSubview:v18->_titleLabel];
    }
    v56 = [(PKDiscoveryCard *)v18->_card callToAction];

    if (v56)
    {
      v57 = [PKDiscoveryCallToActionFooterView alloc];
      v58 = [(PKDiscoveryCard *)v18->_card callToAction];
      v59 = [*p_articleLayout itemIdentifier];
      uint64_t v60 = [(PKDiscoveryCallToActionFooterView *)v57 initWithCallToAction:v58 displayType:0 itemIdentifier:v59];
      ctaFooterView = v18->_ctaFooterView;
      v18->_ctaFooterView = (PKDiscoveryCallToActionFooterView *)v60;

      [(PKDiscoveryCardView *)v18 addSubview:v18->_ctaFooterView];
      if (!v18->_shouldDisplayAsLarge) {
        [(PKDiscoveryCallToActionFooterView *)v18->_ctaFooterView setHidden:1];
      }
    }
    v62 = (void *)MEMORY[0x1E4FB1830];
    v63 = PKDefaultSystemFontOfSizeAndWeight(17.0, *MEMORY[0x1E4FB09E0]);
    v64 = [v62 configurationWithFont:v63];

    v65 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v64];
    v87[0] = 0;
    v87[1] = 0;
    long long v88 = xmmword_1A0444AE0;
    uint64_t v89 = 2;
    v66 = [[PKContinuousButton alloc] initWithConfiguration:v87];
    dismissButton = v18->_dismissButton;
    v18->_dismissButton = v66;

    v68 = v18->_dismissButton;
    v69 = [(PKDiscoveryCardView *)v18 _dismissButtonColor];
    [(PKContinuousButton *)v68 setTintColor:v69];

    [(PKContinuousButton *)v18->_dismissButton setImage:v65 forState:0];
    [(PKContinuousButton *)v18->_dismissButton addTarget:v18 action:sel__dismissButtonPressed forControlEvents:64];
    -[PKContinuousButton _setTouchInsets:](v18->_dismissButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(PKContinuousButton *)v18->_dismissButton sizeToFit];
    [(PKContinuousButton *)v18->_dismissButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [(PKDiscoveryCardView *)v18 addSubview:v18->_dismissButton];
    uint64_t v70 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v18 action:sel_tapGestureRecognized_];
    tapRecognizer = v18->_tapRecognizer;
    v18->_tapRecognizer = (UITapGestureRecognizer *)v70;

    [(PKDiscoveryCardView *)v18 addGestureRecognizer:v18->_tapRecognizer];
    [(PKDiscoveryCardView *)v18 _updateForDisplayType];
    objc_initWeak(&location, v18);
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __123__PKDiscoveryCardView_initWithArticleLayout_dismissImage_cardTemplateInformation_callToActionTappedOverride_isWelcomeCard___block_invoke;
    v84[3] = &unk_1E59D7120;
    objc_copyWeak(&v85, &location);
    id v73 = (id)[(PKDiscoveryCardView *)v18 registerForTraitChanges:v72 withHandler:v84];

    [(PKDiscoveryCardView *)v18 setAccessibilityIgnoresInvertColors:1];
    objc_destroyWeak(&v85);
    objc_destroyWeak(&location);
  }
  return v18;
}

void __123__PKDiscoveryCardView_initWithArticleLayout_dismissImage_cardTemplateInformation_callToActionTappedOverride_isWelcomeCard___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a3;
  id v5 = a2;
  double v6 = [v5 traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  v8 = [v5 traitCollection];

  uint64_t v9 = [v8 legibilityWeight];
  v10 = [v18 preferredContentSizeCategory];
  if (v10 == v7)
  {
    uint64_t v11 = [v18 legibilityWeight];

    if (v11 == v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = WeakRetained[58];
    double v15 = [WeakRetained _headingLabelFont];
    [v14 setFont:v15];

    objc_msgSend(v13[59], "setNumberOfLines:", objc_msgSend(v13, "_titleLabelNumberOfLines"));
    id v16 = v13[59];
    v17 = [v13 _titleLabelFont];
    [v16 setFont:v17];

    [v13 setNeedsLayout];
  }

LABEL_7:
}

- (void)setDisplayType:(int64_t)a3
{
  if (self->_displayType != a3)
  {
    -[PKDiscoveryCardViewTemplateInformation setDisplayType:](self->_cardTemplateInformation, "setDisplayType:");
    self->_displayType = a3;
    [(PKDiscoveryCardView *)self _updateForDisplayType];
    [(PKDiscoveryCardView *)self setNeedsLayout];
  }
}

- (void)setCardSize:(int64_t)a3
{
  if (self->_currentCardSize != a3)
  {
    -[PKDiscoveryCardViewTemplateInformation updateCardSize:](self->_cardTemplateInformation, "updateCardSize:");
    self->_currentCardSize = a3;
    self->_shouldDisplayAsLarge = a3 == 0;
    [(PKDiscoveryCardView *)self _updateForDisplayType];
    [(PKDiscoveryCardView *)self setNeedsLayout];
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(PKDiscoveryCallToActionFooterView *)self->_ctaFooterView setDelegate:v5];
}

- (void)setCallToActionTappedOverride:(id)a3
{
  id v7 = a3;
  double v4 = _Block_copy(v7);
  id callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_id callToActionTappedOverride = v4;

  ctaFooterView = self->_ctaFooterView;
  if (ctaFooterView) {
    [(PKDiscoveryCallToActionFooterView *)ctaFooterView setCallToActionTappedOverride:v7];
  }
}

- (void)layoutSubviews
{
  v158[1] = *MEMORY[0x1E4F143B8];
  [(PKDiscoveryCardView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKDiscoveryCardView *)self _currentContentInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  double v138 = v15;
  double v139 = v11;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  int v19 = [(PKDiscoveryCardView *)self _shouldReverseLayoutDirection];
  CGFloat v144 = v14;
  CGFloat v146 = v12;
  remainder.origin.CGFloat x = v12;
  remainder.origin.CGFloat y = v14;
  CGFloat v140 = v18;
  CGFloat v141 = v16;
  remainder.size.CGFloat width = v16;
  remainder.size.double height = v18;
  if (!self->_headingLabel && self->_miniCardTemplate == 2 && !self->_shouldDisplayAsLarge)
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v21 = (UILabel *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    headingLabel = self->_headingLabel;
    self->_headingLabel = v21;

    uint64_t v23 = self->_headingLabel;
    v24 = [(PKDiscoveryCardView *)self _headingLabelFont];
    [(UILabel *)v23 setFont:v24];

    uint64_t v25 = self->_headingLabel;
    v26 = [(UILabel *)self->_titleLabel text];
    [(UILabel *)v25 setText:v26];

    uint64_t v27 = self->_headingLabel;
    v28 = [(PKDiscoveryCardView *)self _headingLabelTextColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)self->_headingLabel setNumberOfLines:1];
    [(PKDiscoveryCardView *)self addSubview:self->_headingLabel];
  }
  uint64_t v29 = [(UILabel *)self->_titleLabel text];
  v30 = [(UILabel *)self->_headingLabel text];
  uint64_t v31 = [v29 isEqual:v30];

  [(UILabel *)self->_titleLabel setHidden:v31];
  double rect = v10;
  CGFloat v136 = v6;
  double v137 = v8;
  *(double *)v149 = v4;
  if (!self->_shouldDisplayAsLarge && self->_displayType != 1)
  {
    [(PKDiscoveryCallToActionFooterView *)self->_ctaFooterView setHidden:1];
    [(UIView *)self->_miniCardBackgroundColorView setHidden:0];
    [(PKDiscoveryCardView *)self _miniCardImageSize];
    +[PKDiscoveryCardView compressedWidth];
    PKFloatRoundToPixel();
    double v72 = v71;
    PKFloatRoundToPixel();
    uint64_t v133 = v73;
    int64_t miniCardTemplate = self->_miniCardTemplate;
    if (miniCardTemplate == 2 || miniCardTemplate == 1)
    {
      PKContentAlignmentMake();
    }
    else
    {
      double v40 = 0.0;
      double v38 = 0.0;
      double v35 = 0.0;
      double v33 = 0.0;
      if (miniCardTemplate)
      {
LABEL_41:
        miniCardBackgroundColorView = self->_miniCardBackgroundColorView;
        +[PKDiscoveryCardView compressedWidth];
        -[UIView setFrame:](miniCardBackgroundColorView, "setFrame:", v72, v134, v99, 120.0);
        [(UIView *)self->_miniCardBackgroundColorView setClipsToBounds:1];
        CGFloat v36 = v136;
        goto LABEL_8;
      }
      v161.origin.CGFloat x = v4;
      v161.origin.CGFloat y = v136;
      v161.size.CGFloat width = v8;
      v161.size.double height = v10;
      CGRectInset(v161, 16.0, 0.0);
      PKContentAlignmentMake();
    }
    PKSizeAlignedInRect();
    double v33 = v94;
    double v35 = v95;
    double v38 = v96;
    double v40 = v97;
    goto LABEL_41;
  }
  [(PKDiscoveryCallToActionFooterView *)self->_ctaFooterView setHidden:0];
  [(UIView *)self->_miniCardBackgroundColorView setHidden:1];
  +[PKDiscoveryCardView expandedWidth];
  +[PKDiscoveryCardView expandedHeight];
  PKFloatRoundToPixel();
  double v33 = v32;
  PKFloatRoundToPixel();
  double v35 = v34;
  +[PKDiscoveryCardView expandedWidth];
  CGFloat v36 = v6;
  double v38 = v37;
  +[PKDiscoveryCardView expandedHeight];
  double v40 = v39;
LABEL_8:
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v33, v35, v38, v40, *(void *)&v38);
  [(UIImageView *)self->_backgroundImageView setClipsToBounds:1];
  [(PKContinuousButton *)self->_dismissButton sizeToFit];
  v159.origin.CGFloat x = v4;
  v159.origin.CGFloat y = v36;
  v159.size.CGFloat width = v8;
  v159.size.double height = v10;
  CGRectInset(v159, 13.0, 12.0);
  PKSizeAlignedInRect();
  -[PKContinuousButton setFrame:](self->_dismissButton, "setFrame:");
  +[PKDiscoveryCardView compressedWidth];
  PKFloatRoundToPixel();
  if (self->_shouldDisplayAsLarge || self->_displayType == 1) {
    +[PKDiscoveryCardView compressedWidth];
  }
  double v42 = v41 - v139 - v138;
  double v43 = v42 + -32.0;
  uint64_t v44 = self->_headingLabel;
  if (v44)
  {
    -[UILabel sizeThatFits:](v44, "sizeThatFits:", v42 + -32.0, v10);
    CGFloat v46 = v45;
  }
  else
  {
    CGFloat v46 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  memset(&slice, 0, sizeof(slice));
  [(PKDiscoveryCardView *)self _yOffsetToHeadingLabel];
  CGFloat v48 = v47;
  v160.origin.CGFloat y = v144;
  v160.origin.CGFloat x = v146;
  v160.size.double height = v140;
  v160.size.CGFloat width = v141;
  CGRectDivide(v160, &slice, &remainder, v48, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v46, CGRectMinYEdge);
  PKContentAlignmentMake();
  double v145 = v46;
  PKSizeAlignedInRect();
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v43, remainder.size.height);
    CGFloat v59 = v58;
  }
  else
  {
    CGFloat v59 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_headingLabel) {
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  }
  CGRectDivide(remainder, &slice, &remainder, v59, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v61 = v60;
  double v147 = v62;
  double v64 = v63;
  double v66 = v65;
  v67 = [(UILabel *)self->_titleLabel text];
  uint64_t v68 = [v67 length];

  if (v19) {
    uint64_t v69 = 2;
  }
  else {
    uint64_t v69 = 0;
  }
  [(UILabel *)self->_headingLabel setTextAlignment:v69];
  if (!self->_shouldDisplayAsLarge && !self->_displayType)
  {
    int64_t v75 = self->_miniCardTemplate;
    if (v75 == 2)
    {
      [(UILabel *)self->_titleLabel setHidden:1];
      [(UILabel *)self->_headingLabel setTextAlignment:1];
      [(PKDiscoveryCardView *)self _miniCardImageSize];
      PKFloatRoundToPixel();
      CGFloat v101 = v100;
      *(void *)&v163.origin.CGFloat x = v149[0];
      v163.origin.CGFloat y = v136;
      v163.size.CGFloat width = v137;
      v163.size.double height = rect;
      CGRectInset(v163, 0.0, v101);
      PKContentAlignmentMake();
    }
    else
    {
      if (v75 != 1)
      {
        if (v75) {
          goto LABEL_24;
        }
        double v142 = v61;
        PKFloatRoundToPixel();
        double v77 = v76;
        if (v68)
        {
          id v78 = objc_alloc_init(MEMORY[0x1E4FB0860]);
          [v78 setMaximumNumberOfLines:3];
          id v79 = [(UILabel *)self->_titleLabel text];
          uint64_t v148 = *MEMORY[0x1E4FB06F8];
          uint64_t v157 = *MEMORY[0x1E4FB06F8];
          id v80 = [(PKDiscoveryCardView *)self _titleLabelFont];
          v158[0] = v80;
          v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:&v157 count:1];
          objc_msgSend(v79, "boundingRectWithSize:options:attributes:context:", 1, v81, v78, v77, 3.40282347e38);
          double v83 = v82;

          uint64_t v84 = v149[0];
          CGFloat v85 = v136;
          if (v83 <= 62.0 - v145)
          {
            double v114 = v137;
            double v115 = rect;
            CGRect v166 = CGRectInset(*(CGRect *)&v84, 46.0, 29.0);
            CGFloat x = v166.origin.x;
            CGFloat y = v166.origin.y;
            CGFloat width = v166.size.width;
            double height = v166.size.height;
            [v78 setMaximumNumberOfLines:2];
            v116 = [(UILabel *)self->_titleLabel text];
            uint64_t v155 = v148;
            v117 = [(PKDiscoveryCardView *)self _titleLabelFont];
            v156 = v117;
            v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
            objc_msgSend(v116, "boundingRectWithSize:options:attributes:context:", 1, v118, v78, v77, 3.40282347e38);
            double v83 = v119;

            [v78 setMaximumNumberOfLines:1];
            v120 = [(UILabel *)self->_titleLabel text];
            uint64_t v153 = v148;
            v121 = [(PKDiscoveryCardView *)self _titleLabelFont];
            v154 = v121;
            v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
            objc_msgSend(v120, "boundingRectWithSize:options:attributes:context:", 1, v122, v78, v77, 3.40282347e38);
            double v124 = v123;

            v92 = self->_titleLabel;
            if (v83 <= v124)
            {
              [(UILabel *)v92 setNumberOfLines:1];
              double v83 = v124;
              goto LABEL_53;
            }
            uint64_t v93 = 2;
          }
          else
          {
            double v86 = v137;
            double v87 = rect;
            CGRect v162 = CGRectInset(*(CGRect *)&v84, 46.0, 19.0);
            CGFloat x = v162.origin.x;
            CGFloat y = v162.origin.y;
            CGFloat width = v162.size.width;
            double height = v162.size.height;
            v92 = self->_titleLabel;
            uint64_t v93 = 3;
          }
          [(UILabel *)v92 setNumberOfLines:v93];
LABEL_53:
          memset(&v150, 0, sizeof(v150));
          memset(&v149[1], 0, 32);
          v167.origin.CGFloat x = x;
          v167.origin.CGFloat y = y;
          v167.size.CGFloat width = width;
          v167.size.double height = height;
          CGRectDivide(v167, (CGRect *)&v149[1], &v150, v83 + (height - v83 - v145) * 0.5, CGRectMaxYEdge);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          double v50 = v125;
          double v52 = v126;
          double v54 = v127;
          double v56 = v128;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          double v61 = v129;
          double v147 = v130;
          double v64 = v131;
          double v66 = v132;

          goto LABEL_24;
        }
        *(void *)&v165.origin.CGFloat x = v149[0];
        v165.size.double height = rect;
        v165.origin.CGFloat y = v136;
        v165.size.CGFloat width = v137;
        CGRectInset(v165, 46.0, 29.0);
        PKContentAlignmentMake();
LABEL_48:
        PKSizeAlignedInRect();
        double v50 = v110;
        double v52 = v111;
        double v54 = v112;
        double v56 = v113;
        double v61 = v142;
        goto LABEL_24;
      }
      double v142 = v61;
      PKFloatRoundToPixel();
      *(void *)&v164.origin.CGFloat x = v149[0];
      v164.size.double height = rect;
      v164.origin.CGFloat y = v136;
      v164.size.CGFloat width = v137;
      CGRectInset(v164, 16.0, 29.0);
      if (!v68)
      {
        PKContentAlignmentMake();
        goto LABEL_48;
      }
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      double v143 = v102;
      double v147 = v103;
      double v64 = v104;
      double v66 = v105;
      PKContentAlignmentMake();
      double v61 = v143;
    }
    PKSizeAlignedInRect();
    double v50 = v106;
    double v52 = v107;
    double v54 = v108;
    double v56 = v109;
  }
LABEL_24:
  -[UILabel setFrame:](self->_headingLabel, "setFrame:", v50, v52, v54, v56);
  if (v68)
  {
    [(UILabel *)self->_titleLabel setTextAlignment:v69];
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v61, v147, v64, v66);
  }
  uint64_t v70 = [(PKDiscoveryCard *)self->_card callToAction];

  if (v70)
  {
    -[PKDiscoveryCallToActionFooterView sizeThatFits:](self->_ctaFooterView, "sizeThatFits:", v137, rect);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[PKDiscoveryCallToActionFooterView setFrame:](self->_ctaFooterView, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_displayType)
  {
    +[PKDiscoveryCardView expandedSize];
  }
  else if (self->_shouldDisplayAsLarge)
  {
    +[PKDiscoveryCardView compressedSize];
  }
  else
  {
    +[PKDiscoveryCardView miniCompressedSize];
  }
  result.double height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setDismissAction:(id)a3
{
  if (self->_dismissAction != a3)
  {
    double v4 = _Block_copy(a3);
    id dismissAction = self->_dismissAction;
    self->_id dismissAction = v4;

    [(PKDiscoveryCardView *)self _updateForDisplayType];
    [(PKDiscoveryCardView *)self setNeedsLayout];
  }
}

- (void)setCardTemplateInformation:(id)a3
{
  double v4 = (PKDiscoveryCardViewTemplateInformation *)[a3 copy];
  cardTemplateInformation = self->_cardTemplateInformation;
  self->_cardTemplateInformation = v4;

  int64_t displayType = self->_displayType;
  int64_t v7 = [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation displayType];
  if (displayType != v7) {
    self->_int64_t displayType = [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation displayType];
  }
  int64_t currentCardSize = self->_currentCardSize;
  if (currentCardSize == [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation cardSize])
  {
    if (displayType == v7) {
      return;
    }
  }
  else
  {
    int64_t v9 = [(PKDiscoveryCardViewTemplateInformation *)self->_cardTemplateInformation cardSize];
    self->_int64_t currentCardSize = v9;
    self->_shouldDisplayAsLarge = v9 == 0;
  }
  [(PKDiscoveryCardView *)self _updateForDisplayType];

  [(PKDiscoveryCardView *)self setNeedsLayout];
}

- (id)_headingLabelFont
{
  if (self->_shouldDisplayAsLarge || self->_displayType == 1)
  {
    double v2 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B8], *MEMORY[0x1E4FB09D8]);
  }
  else
  {
    double v2 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2798], 2, 0);
  }

  return v2;
}

- (id)_titleLabelFont
{
  if (self->_shouldDisplayAsLarge || self->_displayType == 1)
  {
    double v2 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2988], (NSString *)*MEMORY[0x1E4FB27B8], *MEMORY[0x1E4FB09B8]);
  }
  else
  {
    double v2 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2798], 0x8000, 0);
  }

  return v2;
}

- (unint64_t)_titleLabelNumberOfLines
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (self->_displayType == 1) {
    return 0;
  }
  if (!self->_shouldDisplayAsLarge) {
    return 3;
  }
  double v4 = [(PKDiscoveryCardView *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];

  if (self->_isWelcomeCard && !UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    unint64_t v2 = 3;
  }
  else
  {
    double v6 = [(PKDiscoveryCardView *)self _titleLabelFont];
    int64_t v7 = [(UILabel *)self->_titleLabel text];
    [(PKDiscoveryCardView *)self _currentContentInsets];
    double v9 = v8;
    double v11 = v10;
    +[PKDiscoveryCardView compressedWidth];
    double v13 = v12 - v9 - v11 + -20.0 + 12.0;
    id v14 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    [v14 setMaximumNumberOfLines:2];
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v13, 1.79769313e308);
      double v17 = v16;
    }
    else
    {
      double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    uint64_t v18 = *MEMORY[0x1E4FB06F8];
    uint64_t v28 = *MEMORY[0x1E4FB06F8];
    v29[0] = v6;
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v19, v14, v13, 1.79769313e308);
    double v21 = v20;

    if (v21 >= v17) {
      goto LABEL_13;
    }
    unint64_t v2 = 1;
    [v14 setMaximumNumberOfLines:1];
    uint64_t v26 = v18;
    uint64_t v27 = v6;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v22, v14, v13, 1.79769313e308);
    double v24 = v23;

    if (v21 > v24) {
LABEL_13:
    }
      unint64_t v2 = 2;
  }
  return v2;
}

- (void)_dismissButtonPressed
{
  [(PKContinuousButton *)self->_dismissButton setEnabled:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    double v4 = v7;
    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 discoveryCardViewRemoveTapped:self];

      double v4 = v7;
    }
  }
}

- (void)tapGestureRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    char v6 = objc_opt_respondsToSelector();
    char v5 = v7;
    if (v6)
    {
      [v7 discoveryCardViewTapped:self];
      char v5 = v7;
    }
  }
}

- (UIEdgeInsets)_currentContentInsets
{
  if (self->_displayType == 1)
  {
    double v3 = [(PKDiscoveryCardView *)self superview];
    if (v3)
    {
      double v4 = [(PKDiscoveryCardView *)self superview];
      [v4 safeAreaInsets];
      double top = v5;
      double left = v7;
      double bottom = v9;
      double right = v11;
    }
    else
    {
      [(PKDiscoveryCardView *)self safeAreaInsets];
      double top = v17;
      double left = v18;
      double bottom = v19;
      double right = v20;
    }

    if (self->_hasSafeAreaInsetOverride)
    {
      double top = self->_safeAreaOverrideInsets.top;
      double left = self->_safeAreaOverrideInsets.left;
      double bottom = self->_safeAreaOverrideInsets.bottom;
      double right = self->_safeAreaOverrideInsets.right;
    }
    double v14 = fmax(top, 45.0);
    double v13 = fmax(left, 20.0);
    double v15 = fmax(bottom, 0.0);
    double v16 = fmax(right, 20.0);
  }
  else
  {
    double v13 = 20.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 20.0;
  }
  result.double right = v16;
  result.double bottom = v15;
  result.double left = v13;
  result.double top = v14;
  return result;
}

- (double)_yOffsetToHeadingLabel
{
  double result = 20.0;
  if (self->_displayType == 1) {
    return 0.0;
  }
  return result;
}

- (void)loadAndUploadImageData
{
  if (self->_shouldDisplayAsLarge
    || self->_displayType == 1
    || (p_largeCardMedia = &self->_miniCardMedia, ![(PKDiscoveryMedia *)self->_miniCardMedia type]))
  {
    p_largeCardMedia = &self->_largeCardMedia;
  }
  double v4 = *p_largeCardMedia;
  uint64_t v5 = [(PKDiscoveryMedia *)v4 type];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke;
  aBlock[3] = &unk_1E59DBCA0;
  aBlock[4] = self;
  char v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v5 == 4)
  {
    double v10 = [(PKDiscoveryMedia *)v4 localAssetURL];
    double v8 = v10;
    if (v10)
    {
      double v11 = (void *)MEMORY[0x1E4FB1818];
      double v12 = [v10 path];
      double v13 = [v11 imageWithContentsOfFile:v12];

LABEL_14:
      double v16 = v6[2](v6, v13);

      [(UIImageView *)self->_backgroundImageView setImage:v16];
    }
  }
  else
  {
    if (v5 != 3)
    {
      double v14 = PKUIScreenScale();
      uint64_t v15 = -[PKDiscoveryMedia imageDataFromCacheWithScale:](v4, "imageDataFromCacheWithScale:");
      if (!v15)
      {
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_3;
        v17[3] = &unk_1E59DBCC8;
        objc_copyWeak(&v19, &location);
        double v18 = v6;
        [(PKDiscoveryMedia *)v4 downloadImageDataWithScale:1 shouldWriteData:v17 completion:v14];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        double v8 = 0;
        goto LABEL_15;
      }
      double v8 = (void *)v15;
      uint64_t v9 = [MEMORY[0x1E4FB1818] imageWithData:v15];
      goto LABEL_13;
    }
    double v7 = [(PKDiscoveryMedia *)v4 passKitUIImageName];
    double v8 = v7;
    if (v7)
    {
      uint64_t v9 = PKUIImageNamed(v7);
LABEL_13:
      double v13 = (void *)v9;
      goto LABEL_14;
    }
  }
LABEL_15:
}

id __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 520) && !*(void *)(v4 + 528))
  {
    [(id)v4 _miniCardImageSize];
    [v3 size];
    [v3 size];
    PKFloatRoundToPixel();
    double v6 = v5;
    PKFloatRoundToPixel();
    double v8 = v7;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v7, v6);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_2;
    v12[3] = &unk_1E59DAAB0;
    double v14 = v8;
    double v15 = v6;
    id v13 = v3;
    id v10 = v3;
    id v3 = [v9 imageWithActions:v12];
  }

  return v3;
}

uint64_t __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_4;
  v7[3] = &unk_1E59D0FE0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v8 = v5;
  char v11 = a3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithData:");
    int v4 = *(unsigned __int8 *)(a1 + 56);
    id v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    if (v4)
    {
      [WeakRetained[55] setImage:v5];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4FB1EB0];
      id v7 = WeakRetained[55];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_5;
      v8[3] = &unk_1E59CA870;
      v8[4] = WeakRetained;
      id v9 = v5;
      [v6 transitionWithView:v7 duration:5242880 options:v8 animations:0 completion:0.300000012];
    }
  }
}

uint64_t __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setImage:*(void *)(a1 + 40)];
}

- (CGSize)_miniCardImageSize
{
  int64_t miniCardTemplate = self->_miniCardTemplate;
  if (miniCardTemplate == 2)
  {
    double v4 = 343.0;
    uint64_t v5 = 0x4053000000000000;
LABEL_10:
    double v3 = *(double *)&v5;
    goto LABEL_11;
  }
  if (miniCardTemplate == 1)
  {
    +[PKDiscoveryCardView compressedWidth];
    if (v6 <= 335.0) {
      double v4 = 132.0;
    }
    else {
      double v4 = 152.0;
    }
    uint64_t v5 = 0x405E000000000000;
    goto LABEL_10;
  }
  double v3 = 0.0;
  double v4 = 0.0;
  if (!miniCardTemplate)
  {
    double v3 = 88.0;
    double v4 = 88.0;
  }
LABEL_11:
  result.double height = v3;
  result.CGFloat width = v4;
  return result;
}

- (void)_updateForDisplayType
{
  BOOL shouldDisplayAsLarge = self->_shouldDisplayAsLarge;
  if (self->_shouldDisplayAsLarge)
  {
    titleLabel = self->_titleLabel;
    double v6 = [(PKDiscoveryCard *)self->_card title];
    [(UILabel *)titleLabel setText:v6];

    id v7 = self->_titleLabel;
    id v8 = [(PKDiscoveryCardView *)self _titleLabelFont];
    [(UILabel *)v7 setFont:v8];

    id v9 = self->_titleLabel;
    id v10 = [(PKDiscoveryCardView *)self _titleLabelTextColor];
    [(UILabel *)v9 setTextColor:v10];

    [(UILabel *)self->_titleLabel setNumberOfLines:[(PKDiscoveryCardView *)self _titleLabelNumberOfLines]];
    headingLabel = self->_headingLabel;
    double v12 = [(PKDiscoveryCard *)self->_card heading];
    [(UILabel *)headingLabel setText:v12];

    id v13 = self->_headingLabel;
    double v14 = [(PKDiscoveryCardView *)self _headingLabelFont];
    [(UILabel *)v13 setFont:v14];

    double v15 = self->_headingLabel;
    double v16 = [(PKDiscoveryCardView *)self _headingLabelTextColor];
    [(UILabel *)v15 setTextColor:v16];

    [(PKDiscoveryCallToActionFooterView *)self->_ctaFooterView setHidden:0];
    double v17 = (void *)MEMORY[0x1E4FB1618];
    double v18 = [(PKDiscoveryCard *)self->_card backgroundColor];
    objc_msgSend(v17, "pkui_colorWithPKColor:", v18);
    id v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    p_backgroundColor = &self->_backgroundColor;
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v19;

    [(UIImageView *)self->_backgroundImageView setBackgroundColor:self->_backgroundColor];
  }
  else
  {
    uint64_t v48 = 528;
    if (self->_displayType)
    {
      v22 = self->_titleLabel;
      uint64_t v2 = 408;
      double v23 = [(PKDiscoveryCard *)self->_card title];
      [(UILabel *)v22 setText:v23];

      double v24 = self->_headingLabel;
      uint64_t v25 = [(PKDiscoveryCard *)self->_card heading];
      [(UILabel *)v24 setText:v25];
    }
    else
    {
      uint64_t v25 = [(PKMiniDiscoveryCard *)self->_miniCard title];
      uint64_t v26 = [(PKMiniDiscoveryCard *)self->_miniCard heading];
      uint64_t v27 = self->_titleLabel;
      if ([v25 length])
      {
        [(UILabel *)v27 setText:v25];
      }
      else
      {
        uint64_t v2 = [(PKDiscoveryCard *)self->_card title];
        [(UILabel *)v27 setText:v2];
      }
      uint64_t v28 = self->_headingLabel;
      if (objc_msgSend(v26, "length", 528))
      {
        [(UILabel *)v28 setText:v26];
      }
      else
      {
        uint64_t v2 = [(PKDiscoveryCard *)self->_card heading];
        [(UILabel *)v28 setText:v2];
      }
    }

    uint64_t v29 = self->_titleLabel;
    v30 = [(PKDiscoveryCardView *)self _titleLabelFont];
    [(UILabel *)v29 setFont:v30];

    uint64_t v31 = self->_titleLabel;
    double v32 = [(PKDiscoveryCardView *)self _titleLabelTextColor];
    [(UILabel *)v31 setTextColor:v32];

    [(UILabel *)self->_titleLabel setNumberOfLines:[(PKDiscoveryCardView *)self _titleLabelNumberOfLines]];
    double v33 = self->_headingLabel;
    double v34 = [(PKDiscoveryCardView *)self _headingLabelFont];
    [(UILabel *)v33 setFont:v34];

    double v35 = self->_headingLabel;
    CGFloat v36 = [(PKDiscoveryCardView *)self _headingLabelTextColor];
    [(UILabel *)v35 setTextColor:v36];

    [(PKDiscoveryCallToActionFooterView *)self->_ctaFooterView setHidden:1];
    double v37 = (void *)MEMORY[0x1E4FB1618];
    double v38 = [(PKMiniDiscoveryCard *)self->_miniCard backgroundColor];
    double v39 = objc_msgSend(v37, "pkui_colorWithPKColor:", v38);
    double v40 = v39;
    if (!v39)
    {
      double v41 = (void *)MEMORY[0x1E4FB1618];
      uint64_t v2 = [(PKDiscoveryCard *)self->_card backgroundColor];
      double v40 = objc_msgSend(v41, "pkui_colorWithPKColor:", v2);
    }
    p_backgroundColor = &self->_backgroundColor;
    objc_storeStrong((id *)&self->_backgroundColor, v40);
    if (!v39)
    {
    }
    [(UIImageView *)self->_backgroundImageView setBackgroundColor:*p_backgroundColor];
    if (!*(Class *)((char *)&self->super.super.super.isa + v48) && !self->_miniCardTemplate) {
      [(UIImageView *)self->_backgroundImageView _setContinuousCornerRadius:14.0];
    }
  }
  [(UIView *)self->_miniCardBackgroundColorView setBackgroundColor:*p_backgroundColor];
  [(UIView *)self->_miniCardBackgroundColorView setHidden:shouldDisplayAsLarge];
  [(PKDiscoveryCardView *)self loadAndUploadImageData];
  [(PKDiscoveryCardView *)self setNeedsLayout];
  ctaFooterView = self->_ctaFooterView;
  if (self->_displayType)
  {
    [(PKDiscoveryCallToActionFooterView *)ctaFooterView setDisplayType:1];
    double v43 = 0.0;
    [(UIImageView *)self->_backgroundImageView _setContinuousCornerRadius:0.0];
    [(UIImageView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    [(PKDiscoveryCardView *)self setMaskView:0];
    [(PKDiscoveryCardView *)self setBackgroundColor:self->_backgroundColor];
    dismissButton = self->_dismissButton;
    BOOL v46 = 1;
  }
  else
  {
    [(PKDiscoveryCallToActionFooterView *)ctaFooterView setDisplayType:0];
    +[PKDiscoveryCardView cornerRadius];
    double v43 = v47;
    if (!self->_shouldDisplayAsLarge && !self->_displayType && !self->_miniCardTemplate) {
      [(UIImageView *)self->_backgroundImageView _setContinuousCornerRadius:14.0];
    }
    dismissButton = self->_dismissButton;
    BOOL v46 = self->_dismissAction == 0;
  }
  -[PKContinuousButton setHidden:](dismissButton, "setHidden:", v46, v48);
  [(UILabel *)self->_titleLabel setNumberOfLines:[(PKDiscoveryCardView *)self _titleLabelNumberOfLines]];
  id v49 = [(PKDiscoveryCardView *)self layer];
  [v49 setCornerRadius:v43];
  [v49 setMaskedCorners:15];
}

- (id)_dismissButtonColor
{
  double v3 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  if (self->_shouldDisplayAsLarge
    || (uint64_t v4 = [(PKMiniDiscoveryCard *)self->_miniCard foregroundContentMode]) == 0)
  {
    uint64_t v4 = [(PKDiscoveryCard *)self->_card foregroundContentMode];
  }
  if (v4 == 3)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_9;
    }
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  }
  double v6 = (void *)v5;

  double v3 = v6;
LABEL_9:

  return v3;
}

- (id)_titleLabelTextColor
{
  double v3 = [MEMORY[0x1E4FB1618] systemBlackColor];
  if (self->_shouldDisplayAsLarge
    || (uint64_t v4 = [(PKMiniDiscoveryCard *)self->_miniCard foregroundContentMode]) == 0)
  {
    uint64_t v4 = [(PKDiscoveryCard *)self->_card foregroundContentMode];
  }
  if (v4 == 3)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_9;
    }
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  double v6 = (void *)v5;

  double v3 = v6;
LABEL_9:

  return v3;
}

- (id)_headingLabelTextColor
{
  if (self->_shouldDisplayAsLarge
    || (uint64_t v3 = [(PKMiniDiscoveryCard *)self->_miniCard foregroundContentMode]) == 0)
  {
    uint64_t v3 = [(PKDiscoveryCard *)self->_card foregroundContentMode];
  }
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  uint64_t v5 = [v4 colorWithAlphaComponent:0.5];

  if (v3 == 1)
  {
    double v6 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    uint64_t v7 = [v6 colorWithAlphaComponent:0.5];

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

- (PKDiscoveryArticleLayout)articleLayout
{
  return self->_articleLayout;
}

- (void)setArticleLayout:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDiscoveryCardViewDelegate *)WeakRetained;
}

- (BOOL)isRemoving
{
  return self->_removing;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (PKDiscoveryCardViewTemplateInformation)cardTemplateInformation
{
  return self->_cardTemplateInformation;
}

- (BOOL)hasSafeAreaInsetOverride
{
  return self->_hasSafeAreaInsetOverride;
}

- (void)setHasSafeAreaInsetOverride:(BOOL)a3
{
  self->_hasSafeAreaInsetOverride = a3;
}

- (UIEdgeInsets)safeAreaOverrideInsets
{
  double top = self->_safeAreaOverrideInsets.top;
  double left = self->_safeAreaOverrideInsets.left;
  double bottom = self->_safeAreaOverrideInsets.bottom;
  double right = self->_safeAreaOverrideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3
{
  self->_safeAreaOverrideInsets = a3;
}

- (id)callToActionTappedOverride
{
  return self->_callToActionTappedOverride;
}

- (id)dismissAction
{
  return self->_dismissAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissAction, 0);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_articleLayout, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_ctaFooterView, 0);
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_miniCardBackgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_miniCardMedia, 0);
  objc_storeStrong((id *)&self->_largeCardMedia, 0);
  objc_storeStrong((id *)&self->_miniCard, 0);

  objc_storeStrong((id *)&self->_card, 0);
}

@end