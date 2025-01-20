@interface SBHAddWidgetDetailSheetTitleView
- (CGSize)intrinsicContentSize;
- (NSDirectionalEdgeInsets)contentInsets;
- (SBHAddWidgetDetailSheetTitleView)initWithIconImageInfo:(SBIconImageInfo *)a3 contentInsets:(NSDirectionalEdgeInsets)a4;
- (SBIconImageInfo)iconImageInfo;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (id)_textLabelFont;
- (unint64_t)_textLabelNumberOfLines;
- (void)_contentSizeCategoryDidChange;
- (void)dealloc;
- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3;
- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation SBHAddWidgetDetailSheetTitleView

- (SBHAddWidgetDetailSheetTitleView)initWithIconImageInfo:(SBIconImageInfo *)a3 contentInsets:(NSDirectionalEdgeInsets)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  CGFloat trailing = a4.trailing;
  CGFloat bottom = a4.bottom;
  CGFloat leading = a4.leading;
  CGFloat top = a4.top;
  v68[2] = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)SBHAddWidgetDetailSheetTitleView;
  v16 = -[SBHAddWidgetDetailSheetTitleView initWithFrame:](&v64, sel_initWithFrame_, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = v16;
  if (v16)
  {
    v16->_iconImageInfo.size.width = top;
    v16->_iconImageInfo.size.height = leading;
    v16->_iconImageInfo.scale = bottom;
    v16->_iconImageInfo.continuousCornerRadius = trailing;
    v16->_contentInsets.CGFloat top = v11;
    v16->_contentInsets.CGFloat leading = v10;
    v16->_contentInsets.CGFloat bottom = v9;
    v16->_contentInsets.CGFloat trailing = v8;
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v17->_imageView;
    v17->_imageView = v18;

    [(UIImageView *)v17->_imageView setContentMode:1];
    [(UIImageView *)v17->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBHAddWidgetDetailSheetTitleView *)v17 addSubview:v17->_imageView];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(UIImageView *)v17->_imageView widthAnchor];
    [(SBHAddWidgetDetailSheetTitleView *)v17 iconImageInfo];
    v22 = objc_msgSend(v21, "constraintEqualToConstant:");
    v68[0] = v22;
    v23 = [(UIImageView *)v17->_imageView heightAnchor];
    [(SBHAddWidgetDetailSheetTitleView *)v17 iconImageInfo];
    v25 = [v23 constraintEqualToConstant:v24];
    v68[1] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    [v20 activateConstraints:v26];

    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v17->_textLabel;
    v17->_textLabel = v27;

    v29 = v17->_textLabel;
    v30 = [(SBHAddWidgetDetailSheetTitleView *)v17 _textLabelFont];
    [(UILabel *)v29 setFont:v30];

    [(UILabel *)v17->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v17->_textLabel setNumberOfLines:[(SBHAddWidgetDetailSheetTitleView *)v17 _textLabelNumberOfLines]];
    [(SBHAddWidgetDetailSheetTitleView *)v17 addSubview:v17->_textLabel];
    v55 = (void *)MEMORY[0x1E4F28DC8];
    v62 = [(UIImageView *)v17->_imageView topAnchor];
    v60 = [(SBHAddWidgetDetailSheetTitleView *)v17 topAnchor];
    v59 = [v62 constraintGreaterThanOrEqualToAnchor:v60 constant:v11];
    v67[0] = v59;
    v58 = [(SBHAddWidgetDetailSheetTitleView *)v17 bottomAnchor];
    v57 = [(UIImageView *)v17->_imageView bottomAnchor];
    v56 = [v58 constraintGreaterThanOrEqualToAnchor:v57 constant:v9];
    v67[1] = v56;
    v54 = [(UILabel *)v17->_textLabel topAnchor];
    v53 = [(SBHAddWidgetDetailSheetTitleView *)v17 topAnchor];
    v52 = [v54 constraintGreaterThanOrEqualToAnchor:v53 constant:v11];
    v67[2] = v52;
    v31 = [(SBHAddWidgetDetailSheetTitleView *)v17 bottomAnchor];
    v32 = [(UILabel *)v17->_textLabel bottomAnchor];
    v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32 constant:v9];
    v67[3] = v33;
    v34 = [(UIImageView *)v17->_imageView centerYAnchor];
    v35 = [(UILabel *)v17->_textLabel centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v67[4] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:5];
    [v55 activateConstraints:v37];

    v61 = (void *)MEMORY[0x1E4F28DC8];
    v63 = [(UIImageView *)v17->_imageView leadingAnchor];
    v38 = [(SBHAddWidgetDetailSheetTitleView *)v17 leadingAnchor];
    v39 = [v63 constraintEqualToAnchor:v38 constant:v10];
    v66[0] = v39;
    v40 = [(UILabel *)v17->_textLabel leadingAnchor];
    v41 = [(UIImageView *)v17->_imageView trailingAnchor];
    v42 = [v40 constraintEqualToSystemSpacingAfterAnchor:v41 multiplier:1.0];
    v66[1] = v42;
    v43 = [(SBHAddWidgetDetailSheetTitleView *)v17 trailingAnchor];
    v44 = [(UILabel *)v17->_textLabel trailingAnchor];
    v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44 constant:v8];
    v66[2] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
    [v61 activateConstraints:v46];

    v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v47 addObserver:v17 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    v48 = self;
    v65 = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    id v50 = (id)[(SBHAddWidgetDetailSheetTitleView *)v17 registerForTraitChanges:v49 withAction:sel__contentSizeCategoryDidChange];
  }
  return v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetTitleView;
  [(SBHAddWidgetDetailSheetTitleView *)&v4 dealloc];
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4FB30D8];
  [(SBHAddWidgetDetailSheetTitleView *)self iconImageInfo];
  double v5 = v4;
  [(UILabel *)self->_textLabel intrinsicContentSize];
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  double v8 = v7 + self->_contentInsets.top + self->_contentInsets.bottom;
  double v9 = v3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetDetailSheetTitleView *)self textLabel];
  [v5 setText:v4];
}

- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetDetailSheetTitleView *)self imageView];
  [v5 setImage:v4];
}

- (id)_textLabelFont
{
  double v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB2950];
  id v5 = [(SBHAddWidgetDetailSheetTitleView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:4 contentSizeCategory:v6];

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_contentSizeCategoryDidChange
{
  id v4 = [(SBHAddWidgetDetailSheetTitleView *)self textLabel];
  double v3 = [(SBHAddWidgetDetailSheetTitleView *)self _textLabelFont];
  [v4 setFont:v3];

  objc_msgSend(v4, "setNumberOfLines:", -[SBHAddWidgetDetailSheetTitleView _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  [(SBHAddWidgetDetailSheetTitleView *)self invalidateIntrinsicContentSize];
  [(SBHAddWidgetDetailSheetTitleView *)self setNeedsLayout];
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

- (SBIconImageInfo)iconImageInfo
{
  return self;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end