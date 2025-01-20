@interface SBHAddWidgetSheetAppCollectionViewCell
- (BOOL)imageViewHasVisualStyling;
- (BOOL)imageViewRequiresVisualStyling;
- (BOOL)isSeparatorAlignedToLabels;
- (BOOL)isSeparatorVisible;
- (BOOL)textLabelHasVisualStyling;
- (MTVisualStylingProvider)visualStylingProvider;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)iconHeightConstraint;
- (NSLayoutConstraint)iconWidthConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)separatorLeadingConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSString)detailText;
- (SBHAddWidgetSheetAppCollectionViewCell)initWithFrame:(CGRect)a3;
- (SBIconImageInfo)iconImageInfo;
- (UIImageView)imageView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UIStackView)horizontalStackView;
- (UIStackView)verticalStackView;
- (UIView)separatorView;
- (double)contentHorizontalSpacing;
- (id)_detailTextLabelFont;
- (id)_textLabelFont;
- (int64_t)_uiHIFontStyle;
- (unint64_t)_textLabelNumberOfLines;
- (unint64_t)addWidgetSheetStyle;
- (void)_contentSizeCategoryDidChange;
- (void)_updateAppearanceForFocus;
- (void)_updateSeparatorLeadingConstraint;
- (void)_updateTableViewStyle;
- (void)_updateVisualStylingForImageView;
- (void)_updateVisualStylingForTextLabel;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3;
- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setContentHorizontalSpacing:(double)a3;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailTextLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHorizontalStackView:(id)a3;
- (void)setIconHeightConstraint:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconWidthConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewHasVisualStyling:(BOOL)a3;
- (void)setImageViewRequiresVisualStyling:(BOOL)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setSeparatorAlignedToLabels:(BOOL)a3;
- (void)setSeparatorLeadingConstraint:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextLabelHasVisualStyling:(BOOL)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation SBHAddWidgetSheetAppCollectionViewCell

- (SBHAddWidgetSheetAppCollectionViewCell)initWithFrame:(CGRect)a3
{
  v83[2] = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  v3 = -[SBHAddWidgetSheetAppCollectionViewCell initWithFrame:](&v77, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)v3 contentView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    [(UIImageView *)v4->_imageView setContentMode:1];
    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_imageView];
    v8 = [(UIImageView *)v4->_imageView widthAnchor];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 iconImageInfo];
    uint64_t v9 = objc_msgSend(v8, "constraintEqualToConstant:");
    iconWidthConstraint = v4->_iconWidthConstraint;
    v4->_iconWidthConstraint = (NSLayoutConstraint *)v9;

    v11 = [(UIImageView *)v4->_imageView heightAnchor];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 iconImageInfo];
    uint64_t v13 = [v11 constraintEqualToConstant:v12];
    iconHeightConstraint = v4->_iconHeightConstraint;
    v4->_iconHeightConstraint = (NSLayoutConstraint *)v13;

    v15 = (void *)MEMORY[0x1E4F28DC8];
    v83[0] = v4->_iconWidthConstraint;
    v83[1] = v4->_iconHeightConstraint;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    [v15 activateConstraints:v16];

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v17;

    v19 = v4->_textLabel;
    v20 = [(SBHAddWidgetSheetAppCollectionViewCell *)v4 _textLabelFont];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v4->_textLabel setNumberOfLines:[(SBHAddWidgetSheetAppCollectionViewCell *)v4 _textLabelNumberOfLines]];
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v21;

    v23 = v4->_detailTextLabel;
    v24 = [(SBHAddWidgetSheetAppCollectionViewCell *)v4 _detailTextLabelFont];
    [(UILabel *)v23 setFont:v24];

    v25 = v4->_detailTextLabel;
    v26 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v4->_detailTextLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailTextLabel setHidden:1];
    id v27 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v82[0] = v4->_textLabel;
    v82[1] = v4->_detailTextLabel;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    uint64_t v29 = [v27 initWithArrangedSubviews:v28];
    verticalStackView = v4->_verticalStackView;
    v4->_verticalStackView = (UIStackView *)v29;

    [(UIStackView *)v4->_verticalStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_verticalStackView setAxis:1];
    [(UIStackView *)v4->_verticalStackView setAlignment:1];
    [v5 addSubview:v4->_verticalStackView];
    id v31 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v81[0] = v4->_imageView;
    v81[1] = v4->_verticalStackView;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    uint64_t v33 = [v31 initWithArrangedSubviews:v32];
    horizontalStackView = v4->_horizontalStackView;
    v4->_horizontalStackView = (UIStackView *)v33;

    [(UIStackView *)v4->_horizontalStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_horizontalStackView setAxis:0];
    [(UIStackView *)v4->_horizontalStackView setAlignment:3];
    [v5 addSubview:v4->_horizontalStackView];
    v35 = [(UIStackView *)v4->_horizontalStackView leadingAnchor];
    v36 = [v5 leadingAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36 constant:v4->_contentInsets.leading];
    leadingConstraint = v4->_leadingConstraint;
    v4->_leadingConstraint = (NSLayoutConstraint *)v37;

    v39 = [(UIStackView *)v4->_horizontalStackView trailingAnchor];
    v40 = [v5 trailingAnchor];
    uint64_t v41 = [v39 constraintEqualToAnchor:v40 constant:-v4->_contentInsets.trailing];
    trailingConstraint = v4->_trailingConstraint;
    v4->_trailingConstraint = (NSLayoutConstraint *)v41;

    v43 = [(UIStackView *)v4->_horizontalStackView topAnchor];
    v44 = [v5 topAnchor];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 contentInsets];
    uint64_t v45 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v45;

    v47 = [(UIStackView *)v4->_horizontalStackView bottomAnchor];
    v48 = [v5 bottomAnchor];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 contentInsets];
    uint64_t v50 = [v47 constraintEqualToAnchor:v48 constant:-v49];
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v50;

    v80[0] = v4->_leadingConstraint;
    v80[1] = v4->_trailingConstraint;
    v52 = (void *)MEMORY[0x1E4F28DC8];
    v80[2] = v4->_topConstraint;
    v80[3] = v4->_bottomConstraint;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];
    [v52 activateConstraints:v53];

    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v54;

    [(UIView *)v4->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v56 = v4->_separatorView;
    v57 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v56 setBackgroundColor:v57];

    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 setSeparatorVisible:1];
    [v5 addSubview:v4->_separatorView];
    v74 = (void *)MEMORY[0x1E4F28DC8];
    v75 = [(UIView *)v4->_separatorView trailingAnchor];
    v76 = v5;
    v58 = [v5 trailingAnchor];
    v59 = [v75 constraintEqualToAnchor:v58];
    v79[0] = v59;
    v60 = [(UIView *)v4->_separatorView bottomAnchor];
    v61 = [v5 bottomAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    v79[1] = v62;
    v63 = [(UIView *)v4->_separatorView heightAnchor];
    v64 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v64 scale];
    v66 = [v63 constraintEqualToConstant:1.0 / v65];
    v79[2] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
    [v74 activateConstraints:v67];

    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 _updateSeparatorLeadingConstraint];
    id v68 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 setSelectedBackgroundView:v68];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 _updateAppearanceForFocus];
    [(SBHAddWidgetSheetAppCollectionViewCell *)v4 _updateTableViewStyle];
    v69 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v69 addObserver:v4 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    v70 = self;
    v78 = v70;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    id v72 = (id)[(SBHAddWidgetSheetAppCollectionViewCell *)v4 registerForTraitChanges:v71 withAction:sel__contentSizeCategoryDidChange];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  [(SBHAddWidgetSheetAppCollectionViewCell *)&v4 dealloc];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHAddWidgetSheetAppCollectionViewCell *)self addWidgetSheetStyle] != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
    [(SBHAddWidgetSheetAppCollectionViewCell *)&v5 setHighlighted:v3];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  [(SBHAddWidgetSheetAppCollectionViewCell *)&v3 prepareForReuse];
  self->_isFocused = 0;
  [(UILabel *)self->_textLabel setText:0];
  [(UILabel *)self->_detailTextLabel setText:0];
  [(UIImageView *)self->_imageView setImage:0];
  [(SBHAddWidgetSheetAppCollectionViewCell *)self setSeparatorVisible:1];
  [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateAppearanceForFocus];
  [(SBHAddWidgetSheetAppCollectionViewCell *)self setUserInteractionEnabled:1];
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  if (self->_addWidgetSheetStyle != a3)
  {
    self->_addWidgetSheetStyle = a3;
    [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateTableViewStyle];
  }
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateTableViewStyle];
  }
}

- (void)_updateTableViewStyle
{
  unint64_t addWidgetSheetStyle = self->_addWidgetSheetStyle;
  objc_super v4 = [(SBHAddWidgetSheetAppCollectionViewCell *)self contentView];
  objc_super v5 = v4;
  if (addWidgetSheetStyle)
  {
    [v4 _setContinuousCornerRadius:12.0];
    v6 = [(SBHAddWidgetSheetAppCollectionViewCell *)self selectedBackgroundView];
    v7 = v6;
    double v8 = 12.0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v9];

    [v5 _setContinuousCornerRadius:0.0];
    v6 = [(SBHAddWidgetSheetAppCollectionViewCell *)self selectedBackgroundView];
    v7 = v6;
    double v8 = 0.0;
  }
  [v6 _setContinuousCornerRadius:v8];

  [(SBHAddWidgetSheetAppCollectionViewCell *)self _contentSizeCategoryDidChange];
  separatorView = self->_separatorView;
  if (addWidgetSheetStyle) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !self->_separatorVisible;
  }
  uint64_t v12 = v11;
  [(UIView *)separatorView setHidden:v12];
}

- (void)setSeparatorAlignedToLabels:(BOOL)a3
{
  if (self->_separatorAlignedToLabels != a3)
  {
    self->_separatorAlignedToLabels = a3;
    [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateSeparatorLeadingConstraint];
  }
}

- (void)_updateSeparatorLeadingConstraint
{
  separatorLeadingConstraint = self->_separatorLeadingConstraint;
  if (separatorLeadingConstraint)
  {
    [(NSLayoutConstraint *)separatorLeadingConstraint setActive:0];
    objc_super v5 = self->_separatorLeadingConstraint;
    self->_separatorLeadingConstraint = 0;
  }
  v6 = [(UIView *)self->_separatorView leadingAnchor];
  BOOL separatorAlignedToLabels = self->_separatorAlignedToLabels;
  if (self->_separatorAlignedToLabels)
  {
    [(UILabel *)self->_textLabel leadingAnchor];
  }
  else
  {
    v2 = [(SBHAddWidgetSheetAppCollectionViewCell *)self contentView];
    [v2 leadingAnchor];
  double v8 = };
  uint64_t v9 = [v6 constraintEqualToAnchor:v8];
  v10 = self->_separatorLeadingConstraint;
  self->_separatorLeadingConstraint = v9;

  if (!separatorAlignedToLabels)
  {

    double v8 = v2;
  }

  BOOL v11 = self->_separatorLeadingConstraint;
  [(NSLayoutConstraint *)v11 setActive:1];
}

- (void)setDetailText:(id)a3
{
  -[UILabel setText:](self->_detailTextLabel, "setText:");
  detailTextLabel = self->_detailTextLabel;
  [(UILabel *)detailTextLabel setHidden:a3 == 0];
}

- (NSString)detailText
{
  return [(UILabel *)self->_detailTextLabel text];
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double top = a3.top;
  if (a3.leading != self->_contentInsets.leading
    || a3.top != self->_contentInsets.top
    || a3.trailing != self->_contentInsets.trailing
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    [(NSLayoutConstraint *)self->_leadingConstraint setConstant:a3.leading];
    [(NSLayoutConstraint *)self->_trailingConstraint setConstant:-trailing];
    [(NSLayoutConstraint *)self->_topConstraint setConstant:top];
    bottomConstraint = self->_bottomConstraint;
    [(NSLayoutConstraint *)bottomConstraint setConstant:-bottom];
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(NSLayoutConstraint *)self->_iconWidthConstraint setConstant:v10];
    iconHeightConstraint = self->_iconHeightConstraint;
    [(NSLayoutConstraint *)iconHeightConstraint setConstant:v9];
  }
}

- (void)setContentHorizontalSpacing:(double)a3
{
  [(UIStackView *)self->_horizontalStackView setSpacing:a3];
  [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateSeparatorLeadingConstraint];
}

- (double)contentHorizontalSpacing
{
  [(UIStackView *)self->_horizontalStackView spacing];
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = a3;
  double v5 = [v8 nextFocusedItem];

  if (v5 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    double v6 = [v8 previouslyFocusedItem];

    if (v6 != self) {
      goto LABEL_6;
    }
    BOOL v7 = 0;
  }
  self->_isFocused = v7;
  [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateAppearanceForFocus];
LABEL_6:
}

- (void)_updateAppearanceForFocus
{
  if (self->_isFocused)
  {
    id v11 = [(SBHAddWidgetSheetAppCollectionViewCell *)self tintColor];
    double v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    double v4 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    BOOL v5 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    double v3 = [MEMORY[0x1E4FB1618] labelColor];
    double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStylingProvider);
    BOOL v5 = WeakRetained != 0;
  }
  BOOL v7 = [(SBHAddWidgetSheetAppCollectionViewCell *)self selectedBackgroundView];
  [v7 setBackgroundColor:v11];

  id v8 = [(SBHAddWidgetSheetAppCollectionViewCell *)self textLabel];
  [v8 setTextColor:v3];

  double v9 = [(SBHAddWidgetSheetAppCollectionViewCell *)self imageView];
  [v9 setTintColor:v3];

  double v10 = [(SBHAddWidgetSheetAppCollectionViewCell *)self detailTextLabel];
  [v10 setTextColor:v4];

  [(SBHAddWidgetSheetAppCollectionViewCell *)self setTextLabelHasVisualStyling:v5];
  if ([(SBHAddWidgetSheetAppCollectionViewCell *)self imageViewRequiresVisualStyling]) {
    [(SBHAddWidgetSheetAppCollectionViewCell *)self setImageViewHasVisualStyling:v5];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStylingProvider);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      objc_storeWeak((id *)&self->_visualStylingProvider, obj);
      [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateAppearanceForFocus];
    }
    else
    {
      [(SBHAddWidgetSheetAppCollectionViewCell *)self setTextLabelHasVisualStyling:0];
      [(SBHAddWidgetSheetAppCollectionViewCell *)self setImageViewHasVisualStyling:0];
      objc_storeWeak((id *)&self->_visualStylingProvider, 0);
    }
    BOOL v5 = obj;
  }
}

- (void)setTextLabelHasVisualStyling:(BOOL)a3
{
  if (self->_textLabelHasVisualStyling != a3)
  {
    self->_textLabelHasVisualStyling = a3;
    [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateVisualStylingForTextLabel];
  }
}

- (void)setImageViewHasVisualStyling:(BOOL)a3
{
  if (self->_imageViewHasVisualStyling != a3)
  {
    self->_imageViewHasVisualStyling = a3;
    [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateVisualStylingForImageView];
  }
}

- (void)setImageViewRequiresVisualStyling:(BOOL)a3
{
  if (self->_imageViewRequiresVisualStyling != a3)
  {
    self->_imageViewRequiresVisualStyling = a3;
    if (a3) {
      [(SBHAddWidgetSheetAppCollectionViewCell *)self _updateAppearanceForFocus];
    }
    else {
      -[SBHAddWidgetSheetAppCollectionViewCell setImageViewHasVisualStyling:](self, "setImageViewHasVisualStyling:");
    }
  }
}

- (void)_updateVisualStylingForTextLabel
{
  id v4 = [(SBHAddWidgetSheetAppCollectionViewCell *)self visualStylingProvider];
  double v3 = [(SBHAddWidgetSheetAppCollectionViewCell *)self textLabel];
  if (self->_textLabelHasVisualStyling)
  {
    [v4 automaticallyUpdateView:v3 withStyle:1];
  }
  else
  {
    [v4 stopAutomaticallyUpdatingView:v3];
    objc_msgSend(v3, "mt_removeAllVisualStyling");
  }
}

- (void)_updateVisualStylingForImageView
{
  id v4 = [(SBHAddWidgetSheetAppCollectionViewCell *)self visualStylingProvider];
  double v3 = [(SBHAddWidgetSheetAppCollectionViewCell *)self imageView];
  if (self->_imageViewHasVisualStyling)
  {
    [v4 automaticallyUpdateView:v3 withStyle:2];
  }
  else
  {
    [v4 stopAutomaticallyUpdatingView:v3];
    objc_msgSend(v3, "mt_removeAllVisualStyling");
  }
}

- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)self textLabel];
  [v5 setText:v4];
}

- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)self imageView];
  [v5 setImage:v4];

  [v5 setHidden:0];
}

- (int64_t)_uiHIFontStyle
{
  if (self->_addWidgetSheetStyle == 1) {
    return 1;
  }
  else {
    return 4;
  }
}

- (id)_textLabelFont
{
  double v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  int64_t v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)self _uiHIFontStyle];
  double v6 = [(SBHAddWidgetSheetAppCollectionViewCell *)self traitCollection];
  BOOL v7 = [v6 preferredContentSizeCategory];
  id v8 = [v3 preferredFontForTextStyle:v4 hiFontStyle:v5 contentSizeCategory:v7];

  return v8;
}

- (id)_detailTextLabelFont
{
  double v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  int64_t v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  BOOL v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:1 contentSizeCategory:v6];

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  v2 = [(SBHAddWidgetSheetAppCollectionViewCell *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  if (v3)
  {
    if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)_contentSizeCategoryDidChange
{
  id v6 = [(SBHAddWidgetSheetAppCollectionViewCell *)self textLabel];
  double v3 = [(SBHAddWidgetSheetAppCollectionViewCell *)self _textLabelFont];
  [v6 setFont:v3];

  objc_msgSend(v6, "setNumberOfLines:", -[SBHAddWidgetSheetAppCollectionViewCell _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  unint64_t v4 = [(SBHAddWidgetSheetAppCollectionViewCell *)self detailTextLabel];
  int64_t v5 = [(SBHAddWidgetSheetAppCollectionViewCell *)self _detailTextLabelFont];
  [v4 setFont:v5];

  [(SBHAddWidgetSheetAppCollectionViewCell *)self setNeedsLayout];
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (BOOL)isSeparatorAlignedToLabels
{
  return self->_separatorAlignedToLabels;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)imageViewRequiresVisualStyling
{
  return self->_imageViewRequiresVisualStyling;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStylingProvider);
  return (MTVisualStylingProvider *)WeakRetained;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIStackView)horizontalStackView
{
  return self->_horizontalStackView;
}

- (void)setHorizontalStackView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)iconWidthConstraint
{
  return self->_iconWidthConstraint;
}

- (void)setIconWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)separatorLeadingConstraint
{
  return self->_separatorLeadingConstraint;
}

- (void)setSeparatorLeadingConstraint:(id)a3
{
}

- (BOOL)textLabelHasVisualStyling
{
  return self->_textLabelHasVisualStyling;
}

- (BOOL)imageViewHasVisualStyling
{
  return self->_imageViewHasVisualStyling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_destroyWeak((id *)&self->_visualStylingProvider);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end