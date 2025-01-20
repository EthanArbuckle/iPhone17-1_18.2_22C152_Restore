@interface PKDiscoveryCallToActionFooterView
- (BOOL)showActivityIndicator;
- (CGSize)_buttonSizeForBounds:(CGRect)a3;
- (CGSize)_iconSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)itemIdentifier;
- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4;
- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4 itemIdentifier:(id)a5;
- (PKDiscoveryCardViewDelegate)delegate;
- (double)_buttonWidthForLabelWidth:(double)a3;
- (id)_descriptionLabelColor;
- (id)_descriptionLabelWithLocalizedDescription:(id)a3;
- (id)_editorialDescriptionLabelFont;
- (id)_titleLabelColor;
- (id)_titleLabelFont;
- (id)_titleLabelWithLocalizedTitle:(id)a3;
- (int64_t)displayType;
- (void)_buttonPressed:(id)a3;
- (void)_loadImageData;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)setCallToActionTappedOverride:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayType:(int64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDiscoveryCallToActionFooterView

- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4 itemIdentifier:(id)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKDiscoveryCallToActionFooterView;
  v11 = [(PKDiscoveryCallToActionFooterView *)&v62 init];
  v12 = v11;
  if (v11)
  {
    id v58 = v10;
    v13 = [(PKDiscoveryCallToActionFooterView *)v11 traitCollection];
    v14 = [v13 preferredContentSizeCategory];
    v12->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v14);

    p_callToAction = (id *)&v12->_callToAction;
    objc_storeStrong((id *)&v12->_callToAction, a3);
    uint64_t v16 = [(PKDiscoveryCallToAction *)v12->_callToAction icon];
    media = v12->_media;
    v12->_media = (PKDiscoveryMedia *)v16;

    v12->_displayType = a4;
    objc_storeStrong((id *)&v12->_itemIdentifier, a5);
    v18 = (void *)MEMORY[0x1E4FB1618];
    v19 = [(PKDiscoveryCallToAction *)v12->_callToAction backgroundColor];
    v20 = objc_msgSend(v18, "pkui_colorWithPKColor:", v19);

    [(PKDiscoveryCallToActionFooterView *)v12 setBackgroundColor:v20];
    v21 = [(PKDiscoveryCallToAction *)v12->_callToAction localizedTitle];
    if (v21)
    {
      uint64_t v22 = [(PKDiscoveryCallToActionFooterView *)v12 _titleLabelWithLocalizedTitle:v21];
      titleLabel = v12->_titleLabel;
      v12->_titleLabel = (UILabel *)v22;

      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_titleLabel];
      uint64_t v24 = [(PKDiscoveryCallToActionFooterView *)v12 _titleLabelWithLocalizedTitle:v21];
      expandedTitleLabel = v12->_expandedTitleLabel;
      v12->_expandedTitleLabel = (UILabel *)v24;

      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_expandedTitleLabel];
    }
    v26 = [*p_callToAction localizedSubtitle];
    if (v26)
    {
      uint64_t v27 = [(PKDiscoveryCallToActionFooterView *)v12 _descriptionLabelWithLocalizedDescription:v26];
      editorialDescriptionLabel = v12->_editorialDescriptionLabel;
      v12->_editorialDescriptionLabel = (UILabel *)v27;

      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_editorialDescriptionLabel];
      uint64_t v29 = [(PKDiscoveryCallToActionFooterView *)v12 _descriptionLabelWithLocalizedDescription:v26];
      expandedEditorialDescriptionLabel = v12->_expandedEditorialDescriptionLabel;
      v12->_expandedEditorialDescriptionLabel = (UILabel *)v29;

      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_expandedEditorialDescriptionLabel];
    }
    v31 = [v9 icon];
    v12->_hasIcon = v31 != 0;

    if (v12->_hasIcon)
    {
      id v32 = objc_alloc(MEMORY[0x1E4FB1838]);
      uint64_t v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      iconImageView = v12->_iconImageView;
      v12->_iconImageView = (UIImageView *)v33;

      v35 = v12->_iconImageView;
      v36 = (void *)MEMORY[0x1E4FB1618];
      v37 = [(PKDiscoveryMedia *)v12->_media backgroundColor];
      v38 = objc_msgSend(v36, "pkui_colorWithPKColor:", v37);
      [(UIImageView *)v35 setBackgroundColor:v38];

      [(UIImageView *)v12->_iconImageView setContentMode:1];
      [(UIImageView *)v12->_iconImageView setAccessibilityIgnoresInvertColors:1];
      if ([*p_callToAction shouldRoundIcon])
      {
        v39 = [(UIImageView *)v12->_iconImageView layer];
        [v39 setCornerRadius:10.0];
        [v39 setCornerCurve:*MEMORY[0x1E4F39EA8]];
        [v39 setMasksToBounds:1];
      }
      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_iconImageView];
    }
    v40 = [v9 localizedButtonText];
    if (v40) {
      BOOL v41 = 1;
    }
    else {
      BOOL v41 = [*p_callToAction action] == 8;
    }
    v12->_hasButton = v41;

    if (v12->_hasButton)
    {
      uint64_t v59 = 0;
      int64x2_t v60 = vdupq_n_s64(2uLL);
      int64x2_t v61 = v60;
      v42 = [[PKContinuousButton alloc] initWithConfiguration:&v59];
      button = v12->_button;
      v12->_button = v42;

      v44 = v12->_button;
      v45 = [MEMORY[0x1E4FB1618] colorWithRed:0.945098039 green:0.941176471 blue:0.968627451 alpha:1.0];
      [(PKContinuousButton *)v44 setTintColor:v45];

      v46 = v12->_button;
      v47 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(PKContinuousButton *)v46 updateTitleColorWithColor:v47];

      v48 = v12->_button;
      v49 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [(PKContinuousButton *)v48 updateActivityIndicatorColorWithColor:v49];

      v50 = v12->_button;
      v51 = [*p_callToAction localizedButtonText];
      [(PKContinuousButton *)v50 setTitle:v51 forState:0];

      [(PKContinuousButton *)v12->_button addTarget:v12 action:sel__buttonPressed_ forControlEvents:64];
      -[PKContinuousButton _setTouchInsets:](v12->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
      [(PKContinuousButton *)v12->_button setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
      [(PKDiscoveryCallToActionFooterView *)v12 addSubview:v12->_button];
    }
    if ([*p_callToAction action] == 8)
    {
      v52 = [*p_callToAction appStoreAppIdentifier];
      if (v52)
      {
        v53 = [PKLinkedApplication alloc];
        v63[0] = v52;
        v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
        uint64_t v55 = [(PKLinkedApplication *)v53 initWithStoreIDs:v54 defaultLaunchURL:0];
        linkedApplication = v12->_linkedApplication;
        v12->_linkedApplication = (PKLinkedApplication *)v55;

        [(PKLinkedApplication *)v12->_linkedApplication addObserver:v12];
        [(PKDiscoveryCallToActionFooterView *)v12 setShowActivityIndicator:1];
        [(PKLinkedApplication *)v12->_linkedApplication reloadApplicationStateIfNecessary];
      }
    }
    if (v12->_hasIcon) {
      [(PKDiscoveryCallToActionFooterView *)v12 _loadImageData];
    }
    [(PKDiscoveryCallToActionFooterView *)v12 setAccessibilityIdentifier:*MEMORY[0x1E4F85328]];

    id v10 = v58;
  }

  return v12;
}

- (PKDiscoveryCallToActionFooterView)initWithCallToAction:(id)a3 displayType:(int64_t)a4
{
  return [(PKDiscoveryCallToActionFooterView *)self initWithCallToAction:a3 displayType:a4 itemIdentifier:0];
}

- (void)layoutSubviews
{
  [(PKDiscoveryCallToActionFooterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  int v11 = [(PKDiscoveryCallToActionFooterView *)self _shouldReverseLayoutDirection];
  if (v11) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  if (v11) {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  v91.origin.double x = v4;
  v91.origin.double y = v6;
  v91.size.double width = v8;
  v91.size.double height = v10;
  CGRect v92 = CGRectInset(v91, 20.0, 0.0);
  double x = v92.origin.x;
  double y = v92.origin.y;
  double width = v92.size.width;
  double height = v92.size.height;
  memset(&slice, 0, sizeof(slice));
  CGRect remainder = v92;
  if (self->_hasIcon)
  {
    [(PKDiscoveryCallToActionFooterView *)self _iconSize];
    CGFloat v19 = v18 + 20.0;
    v93.origin.double x = x;
    v93.origin.double y = y;
    v93.size.double width = width;
    v93.size.double height = height;
    CGRectDivide(v93, &slice, &remainder, v19, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  }
  if (self->_hasButton)
  {
    -[PKDiscoveryCallToActionFooterView _buttonSizeForBounds:](self, "_buttonSizeForBounds:", x, y, width, height);
    CGRectDivide(remainder, &slice, &remainder, v20 + 20.0, v13);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](self->_button, "setFrame:");
  }
  +[PKDiscoveryCardView expandedWidth];
  double v22 = v21;
  +[PKDiscoveryCardView compressedWidth];
  double v24 = v22 - v23;
  int64_t displayType = self->_displayType;
  CGRect v94 = CGRectInset(remainder, 0.0, 4.0);
  double v26 = v94.size.height;
  if (displayType == 1) {
    double v27 = -0.0;
  }
  else {
    double v27 = v24;
  }
  if (displayType == 1) {
    double v28 = v24;
  }
  else {
    double v28 = 0.0;
  }
  double v86 = v94.size.width;
  double v29 = v94.size.width - v28;
  double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v94.size.width - v28, 1.79769313e308);
    if (v32 <= v26)
    {
      double v35 = v32;
      int v33 = 0;
    }
    else
    {
      int v33 = 1;
      -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, v26);
      double v35 = v34;
    }
  }
  else
  {
    int v33 = 0;
    double v35 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v36 = v26;
  double v37 = v26 - v35;
  editorialDescriptionLabel = self->_editorialDescriptionLabel;
  double v88 = v30;
  if (editorialDescriptionLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, 1.79769313e308);
    double v30 = v39;
  }
  if (v30 > v37)
  {
    int v33 = 1;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v29, v37);
  }
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  unint64_t v78 = v41;
  unint64_t v79 = v40;
  unint64_t v76 = v43;
  unint64_t v77 = v42;
  PKContentAlignmentMake();
  double v44 = v27 + v86;
  PKSizeAlignedInRect();
  double v82 = v46;
  double v83 = v45;
  double v80 = v48;
  double v81 = v47;
  expandedTitleLabel = self->_expandedTitleLabel;
  double v50 = v88;
  if (expandedTitleLabel)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](expandedTitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v44, v36);
    double v50 = v51;
  }
  if (self->_expandedEditorialDescriptionLabel) {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_editorialDescriptionLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v44, v36 - v50);
  }
  BOOL v52 = displayType == 1;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  unint64_t v85 = v54;
  unint64_t v87 = v53;
  unint64_t v84 = v55;
  unint64_t v57 = v56;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v63 = v58.n128_f64[0];
  double v64 = v59.n128_f64[0];
  double v65 = v60.n128_f64[0];
  double v66 = v61.n128_f64[0];
  if ((v52 & v33) != 0) {
    double v67 = 0.0;
  }
  else {
    double v67 = 1.0;
  }
  if ((v52 & v33) != 0) {
    double v68 = 1.0;
  }
  else {
    double v68 = 0.0;
  }
  v69 = self->_titleLabel;
  v59.n128_u64[0] = v78;
  v58.n128_u64[0] = v79;
  v61.n128_u64[0] = v76;
  v60.n128_u64[0] = v77;
  PKRectRoundToPixel(v58, v59, v60, v61, v62);
  -[UILabel setFrame:](v69, "setFrame:");
  [(UILabel *)self->_titleLabel setAlpha:v67];
  -[UILabel setFrame:](self->_editorialDescriptionLabel, "setFrame:", v83, v82, v81, v80);
  [(UILabel *)self->_editorialDescriptionLabel setAlpha:v67];
  v70 = self->_expandedTitleLabel;
  v72.n128_u64[0] = v85;
  v71.n128_u64[0] = v87;
  v73.n128_u64[0] = v84;
  v74.n128_u64[0] = v57;
  PKRectRoundToPixel(v71, v72, v73, v74, v75);
  -[UILabel setFrame:](v70, "setFrame:");
  [(UILabel *)self->_expandedTitleLabel setAlpha:v68];
  -[UILabel setFrame:](self->_expandedEditorialDescriptionLabel, "setFrame:", v63, v64, v65, v66);
  [(UILabel *)self->_expandedEditorialDescriptionLabel setAlpha:v68];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 78.0;
  result.double height = v3;
  return result;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4 = a3;
  [(PKDiscoveryCallToActionFooterView *)self setShowActivityIndicator:0];
  char v5 = [v4 isInstalled];

  button = self->_button;
  if (v5)
  {
    double v7 = [(PKDiscoveryCallToAction *)self->_callToAction localizedButtonText];
    [(PKContinuousButton *)button setTitle:v7 forState:0];
  }
  else
  {
    double v7 = PKLocalizedString(&cfstr_ViewButton.isa);
    CGFloat v8 = objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale");
    [(PKContinuousButton *)button setTitle:v8 forState:0];
  }

  [(PKDiscoveryCallToActionFooterView *)self setNeedsLayout];
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  if (((!self->_showActivityIndicator ^ a3) & 1) == 0)
  {
    BOOL v4 = !a3;
    self->_showActivityIndicator = a3;
    -[PKContinuousButton setShowSpinner:](self->_button, "setShowSpinner:");
    button = self->_button;
    [(PKContinuousButton *)button setEnabled:v4];
  }
}

- (void)setCallToActionTappedOverride:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  id callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_id callToActionTappedOverride = v4;
}

- (void)setDisplayType:(int64_t)a3
{
  if (self->_displayType != a3)
  {
    self->_int64_t displayType = a3;
    [(PKDiscoveryCallToActionFooterView *)self setNeedsLayout];
  }
}

- (id)_titleLabelColor
{
  double v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  if ([(PKDiscoveryCallToAction *)self->_callToAction foregroundContentMode] == 2)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemBlackColor];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)_descriptionLabelColor
{
  double v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  if ([(PKDiscoveryCallToAction *)self->_callToAction foregroundContentMode] == 2)
  {
    if (self->_titleLabel) {
      [MEMORY[0x1E4FB1618] systemDarkGrayColor];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemBlackColor];
    }

    double v3 = (void *)v4;
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryCallToActionFooterView;
  id v4 = a3;
  [(PKDiscoveryCallToActionFooterView *)&v20 traitCollectionDidChange:v4];
  char v5 = [(PKDiscoveryCallToActionFooterView *)self traitCollection];
  CGFloat v6 = [v5 preferredContentSizeCategory];

  double v7 = [v4 preferredContentSizeCategory];

  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    CGFloat v10 = v9;
    if (v8 && v9)
    {
      char v11 = [v8 isEqualToString:v9];

      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    titleLabel = self->_titleLabel;
    CGRectEdge v13 = [(PKDiscoveryCallToActionFooterView *)self _titleLabelFont];
    [(UILabel *)titleLabel setFont:v13];

    editorialDescriptionLabel = self->_editorialDescriptionLabel;
    v15 = [(PKDiscoveryCallToActionFooterView *)self _editorialDescriptionLabelFont];
    [(UILabel *)editorialDescriptionLabel setFont:v15];

    expandedTitleLabel = self->_expandedTitleLabel;
    v17 = [(PKDiscoveryCallToActionFooterView *)self _titleLabelFont];
    [(UILabel *)expandedTitleLabel setFont:v17];

    expandedEditorialDescriptionLabel = self->_expandedEditorialDescriptionLabel;
    CGFloat v19 = [(PKDiscoveryCallToActionFooterView *)self _editorialDescriptionLabelFont];
    [(UILabel *)expandedEditorialDescriptionLabel setFont:v19];

    self->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v8);
    [(PKDiscoveryCallToActionFooterView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)_buttonPressed:(id)a3
{
  id callToActionTappedOverride = self->_callToActionTappedOverride;
  if (callToActionTappedOverride)
  {
    char v5 = (void (*)(void))*((void *)callToActionTappedOverride + 2);
    v5();
  }
  else if ([(PKDiscoveryCallToAction *)self->_callToAction action] == 8 {
         && [(PKLinkedApplication *)self->_linkedApplication isInstalled])
  }
  {
    linkedApplication = self->_linkedApplication;
    [(PKLinkedApplication *)linkedApplication openApplication:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained discoveryCardViewCTATapped:self callToAction:self->_callToAction itemIdentifier:self->_itemIdentifier];
  }
}

- (id)_titleLabelWithLocalizedTitle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v7 setText:v5];

  id v8 = [(PKDiscoveryCallToActionFooterView *)self _titleLabelFont];
  [v7 setFont:v8];

  id v9 = [(PKDiscoveryCallToActionFooterView *)self _titleLabelColor];
  [v7 setTextColor:v9];

  [v7 setNumberOfLines:0];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  return v7;
}

- (id)_descriptionLabelWithLocalizedDescription:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v7 setText:v5];

  id v8 = [(PKDiscoveryCallToActionFooterView *)self _editorialDescriptionLabelFont];
  [v7 setFont:v8];

  id v9 = [(PKDiscoveryCallToActionFooterView *)self _descriptionLabelColor];
  [v7 setTextColor:v9];

  [v7 setNumberOfLines:0];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F856E0]];

  return v7;
}

- (id)_titleLabelFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], 2, 0);
}

- (id)_editorialDescriptionLabelFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B0], *MEMORY[0x1E4FB09D8]);
}

- (CGSize)_buttonSizeForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v6 = [(PKContinuousButton *)self->_button titleLabel];
  double v7 = (void *)*MEMORY[0x1E4FB2950];
  id v8 = (void *)*MEMORY[0x1E4FB27B8];
  id v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
  [v6 setFont:v9];

  [v6 setNumberOfLines:1];
  [v6 setTextAlignment:1];
  -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  [(PKDiscoveryCallToActionFooterView *)self _buttonWidthForLabelWidth:36.0];
  double v11 = v10;
  +[PKDiscoveryCardView compressedWidth];
  PKFloatRoundToPixel();
  double v13 = v12;
  -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
  if (v14 >= v11)
  {
    double v11 = v14;
    if (v14 > v13)
    {
      -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 0.0, 8.0, 0.0, 8.0);
      -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
      double v11 = v15;
    }
  }
  if (v11 > v13)
  {
    if (self->_useAccessibilityLayout) {
      double v16 = 13.0;
    }
    else {
      double v16 = 9.0;
    }
    v17 = PKFontForDefaultDesign(v7, v8, 2, 0);
    double v18 = [v17 fontWithSize:v16];

    -[PKContinuousButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 4.0, 16.0, 4.0, 16.0);
    [v6 setNumberOfLines:2];
    [v6 setFont:v18];
    [v6 setLineBreakMode:4];
    objc_msgSend(v6, "sizeThatFits:", v13 + -32.0, height);
    -[PKDiscoveryCallToActionFooterView _buttonWidthForLabelWidth:](self, "_buttonWidthForLabelWidth:");
    double v11 = v19;
  }
  if (self->_useAccessibilityLayout) {
    double v20 = 34.0;
  }
  else {
    double v20 = 28.0;
  }

  double v21 = v11;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (double)_buttonWidthForLabelWidth:(double)a3
{
  return a3 + 32.0;
}

- (CGSize)_iconSize
{
  if ([(PKDiscoveryCallToAction *)self->_callToAction shouldRoundIcon])
  {
    *(double *)&uint64_t v3 = 48.0;
    *(double *)&uint64_t v4 = 48.0;
  }
  else
  {
    [(PKDiscoveryMedia *)self->_media width];
    double v6 = v5;
    [(PKDiscoveryMedia *)self->_media height];
    if (v6 <= v7)
    {
      *(double *)&uint64_t v4 = 48.0;
      PKFloatRoundToPixel();
      uint64_t v3 = v9;
    }
    else
    {
      *(double *)&uint64_t v3 = 48.0;
      PKFloatRoundToPixel();
      uint64_t v4 = v8;
    }
  }
  double v10 = *(double *)&v3;
  double v11 = *(double *)&v4;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_loadImageData
{
  uint64_t v3 = [(PKDiscoveryMedia *)self->_media type];
  if (v3 == 4)
  {
    double v15 = [(PKDiscoveryMedia *)self->_media localAssetURL];
    uint64_t v4 = v15;
    if (v15)
    {
      double v16 = (void *)MEMORY[0x1E4FB1818];
      v17 = [v15 path];
      id v23 = [v16 imageWithContentsOfFile:v17];

      [(UIImageView *)self->_iconImageView setImage:v23];
LABEL_12:

      return;
    }
    id v23 = 0;
LABEL_11:
    [(UIImageView *)self->_iconImageView setImage:v23];
    goto LABEL_12;
  }
  if (v3 == 3)
  {
    uint64_t v4 = [(PKDiscoveryMedia *)self->_media passKitUIImageName];
    double v5 = [v4 pathExtension];
    int v6 = [v5 isEqualToString:@"pdf"];

    if (v6)
    {
      double v7 = [v4 stringByDeletingPathExtension];
      uint64_t v8 = PKPassKitUIBundle();
      uint64_t v9 = [v8 URLForResource:v7 withExtension:@"pdf"];

      [(PKDiscoveryMedia *)self->_media width];
      CGFloat v11 = v10;
      [(PKDiscoveryMedia *)self->_media height];
      CGFloat v13 = v12;
      double v14 = PKUIScreenScale();
      PKUIImageFromPDF(v9, v11, v13, v14);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKUIImageNamed(v4);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  double v18 = PKUIScreenScale();
  double v19 = -[PKDiscoveryMedia imageDataFromCacheWithScale:](self->_media, "imageDataFromCacheWithScale:");
  if (v19)
  {
    iconImageView = self->_iconImageView;
    double v21 = [MEMORY[0x1E4FB1818] imageWithData:v19];
    [(UIImageView *)iconImageView setImage:v21];
  }
  else
  {
    objc_initWeak(&location, self);
    media = self->_media;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke;
    v24[3] = &unk_1E59D04C0;
    objc_copyWeak(&v25, &location);
    [(PKDiscoveryMedia *)media downloadImageDataWithScale:0 shouldWriteData:v24 completion:v18];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithData:");
    id v4 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v5 = WeakRetained[53];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_3;
    v7[3] = &unk_1E59CA870;
    v7[4] = WeakRetained;
    id v8 = v3;
    id v6 = v3;
    [v4 transitionWithView:v5 duration:5242880 options:v7 animations:0 completion:0.300000012];
  }
}

uint64_t __51__PKDiscoveryCallToActionFooterView__loadImageData__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setImage:*(void *)(a1 + 40)];
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDiscoveryCardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_expandedEditorialDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_editorialDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_media, 0);

  objc_storeStrong((id *)&self->_callToAction, 0);
}

@end