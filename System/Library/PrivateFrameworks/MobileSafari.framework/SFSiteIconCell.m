@interface SFSiteIconCell
+ (NSString)reuseIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)visualEffectGroupName;
- (SFSiteIconCell)initWithCoder:(id)a3;
- (SFSiteIconCell)initWithFrame:(CGRect)a3;
- (UIImage)icon;
- (UIView)contextMenuPreviewView;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (id)focusEffect;
- (void)_setAction:(id)a3;
- (void)_setAction:(id)a3 backgroundEffect:(id)a4;
- (void)configureUsingAction:(id)a3 backgroundEffect:(id)a4;
- (void)layoutSubviews;
- (void)setBackdropCaptureView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconFromBookmark:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisualEffectGroupName:(id)a3;
- (void)updateConstraints;
@end

@implementation SFSiteIconCell

- (void)setIconFromBookmark:(id)a3
{
  id v4 = a3;
  [(SFSiteIconCell *)self _setAction:0];
  [(_SFSiteIconView *)self->_iconView setBookmark:v4];
}

- (void)_setAction:(id)a3 backgroundEffect:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(_SFSiteIconView *)self->_iconView action];
  char v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    [(_SFSiteIconView *)self->_iconView setAction:v10 backgroundEffect:v6];
    v9 = [v10 title];
    [(SFSiteIconCell *)self setAccessibilityLabel:v9];
  }
}

- (void)_setAction:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SiteIcon";
}

- (void)setVisualEffectGroupName:(id)a3
{
}

- (void)setBackdropCaptureView:(id)a3
{
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SFSiteIconCell;
  [(SFSiteIconCell *)&v7 layoutSubviews];
  v3 = [(SFSiteIconCell *)self traitCollection];
  uint64_t v4 = objc_msgSend(v3, "sf_alternateUserInterfaceStyle");

  [(UILabel *)self->_titleLabel setOverrideUserInterfaceStyle:v4];
  [(UILabel *)self->_subtitleLabel setOverrideUserInterfaceStyle:v4];
  v5 = [(SFSiteIconCell *)self traitCollection];
  id v6 = objc_msgSend(v5, "sf_alternateTintColor");
  [(UILabel *)self->_titleLabel setTintColor:v6];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(SFSiteIconCell *)self setNeedsLayout];
}

- (SFSiteIconCell)initWithFrame:(CGRect)a3
{
  v53[8] = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)SFSiteIconCell;
  v3 = -[SFSiteIconCell initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(SFSiteIconCell *)v3 setAccessibilityIdentifier:@"SFSiteIconCell"];
    v5 = [(SFSiteIconCell *)v4 contentView];
    id v6 = objc_alloc_init(_SFSiteIconView);
    iconView = v4->_iconView;
    v4->_iconView = v6;

    [(_SFSiteIconView *)v4->_iconView setAllowsDropShadow:1];
    [(_SFSiteIconView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_iconView];
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(_SFSiteIconView *)v4->_iconView bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    iconDimmingView = v4->_iconDimmingView;
    v4->_iconDimmingView = (UIView *)v9;

    +[_SFSiteIcon cornerRadius];
    -[UIView _setContinuousCornerRadius:](v4->_iconDimmingView, "_setContinuousCornerRadius:");
    [(UIView *)v4->_iconDimmingView setAlpha:0.0];
    v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v4->_iconDimmingView setBackgroundColor:v11];

    [(UIView *)v4->_iconDimmingView setAutoresizingMask:18];
    [(_SFSiteIconView *)v4->_iconView addSubview:v4->_iconDimmingView];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    v14 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    v15 = [v14 fontDescriptorWithSymbolicTraits:32770];

    v16 = (void *)MEMORY[0x1E4FB08E0];
    [v15 pointSize];
    v17 = objc_msgSend(v16, "fontWithDescriptor:size:", v15);

    [(UILabel *)v4->_titleLabel setFont:v17];
    [(UILabel *)v4->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v18];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel _setUseShortcutIntrinsicContentSize:1];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v20];
    [v5 addSubview:v4->_titleLabel];
    v21 = [(UILabel *)v4->_titleLabel widthAnchor];
    v22 = [v5 widthAnchor];
    v47 = [v21 constraintEqualToAnchor:v22 multiplier:1.15];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v51 = [(_SFSiteIconView *)v4->_iconView widthAnchor];
    v50 = [(_SFSiteIconView *)v4->_iconView heightAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v53[0] = v49;
    v48 = [(_SFSiteIconView *)v4->_iconView widthAnchor];
    v46 = [v5 widthAnchor];
    v45 = [v48 constraintEqualToAnchor:v46];
    v53[1] = v45;
    v44 = [(_SFSiteIconView *)v4->_iconView centerXAnchor];
    v43 = [v5 centerXAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v53[2] = v42;
    v53[3] = v47;
    v39 = [(UILabel *)v4->_titleLabel centerXAnchor];
    v38 = [v5 centerXAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v53[4] = v37;
    v36 = [(_SFSiteIconView *)v4->_iconView topAnchor];
    v40 = v5;
    v35 = [v5 topAnchor];
    v23 = [v36 constraintEqualToAnchor:v35];
    v53[5] = v23;
    v24 = [(UILabel *)v4->_titleLabel topAnchor];
    v25 = [(_SFSiteIconView *)v4->_iconView bottomAnchor];
    v26 = [v24 constraintEqualToSystemSpacingBelowAnchor:v25 multiplier:1.0];
    v53[6] = v26;
    v27 = [v5 bottomAnchor];
    v28 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    LODWORD(v30) = 1143930880;
    v31 = objc_msgSend(v29, "sf_withPriority:", v30);
    v53[7] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:8];
    [v41 activateConstraints:v32];

    v33 = v4;
  }

  return v4;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)SFSiteIconCell;
  [(SFSiteIconCell *)&v4 updateConstraints];
  v3 = [(UILabel *)self->_subtitleLabel text];
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", [v3 length] == 0);
}

- (SFSiteIconCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSiteIconCell;
  return [(SFSiteIconCell *)&v4 initWithCoder:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFSiteIconCell;
  -[SFSiteIconCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SFSiteIconCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E54EA208;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v5 completion:0];
}

uint64_t __33__SFSiteIconCell_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 640) setAlpha:(double)*(unint64_t *)&a2];
}

- (UIView)contextMenuPreviewView
{
  return (UIView *)self->_iconView;
}

- (id)focusEffect
{
  v2 = (void *)MEMORY[0x1E4FB1788];
  [(_SFSiteIconView *)self->_iconView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  +[_SFSiteIcon cornerRadius];
  uint64_t v12 = *MEMORY[0x1E4F39EA8];

  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", v12, v4, v6, v8, v10, v11);
}

- (NSString)visualEffectGroupName
{
  return [(_SFSiteIconView *)self->_iconView visualEffectGroupName];
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return [(_SFSiteIconView *)self->_iconView backdropCaptureView];
}

- (UIImage)icon
{
  return [(_SFSiteIconView *)self->_iconView image];
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  [(SFSiteIconCell *)self _setAction:0];
  [(_SFSiteIconView *)self->_iconView setImage:v4];

  [(SFSiteIconCell *)self setNeedsLayout];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel) {
    goto LABEL_5;
  }
  if ([v4 length])
  {
    double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v7 = self->_subtitleLabel;
    self->_subtitleLabel = v6;

    [(UILabel *)self->_subtitleLabel _setUseShortcutIntrinsicContentSize:1];
    double v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    double v9 = [v8 fontDescriptorWithSymbolicTraits:0];

    double v10 = (void *)MEMORY[0x1E4FB08E0];
    [v9 pointSize];
    double v11 = objc_msgSend(v10, "fontWithDescriptor:size:", v9);

    [(UILabel *)self->_subtitleLabel setFont:v11];
    [(UILabel *)self->_subtitleLabel setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    [(UILabel *)self->_subtitleLabel setTextAlignment:1];
    uint64_t v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v12];

    [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1148846080;
    [(UILabel *)self->_subtitleLabel setContentHuggingPriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v14];
    v15 = [(SFSiteIconCell *)self contentView];
    [v15 addSubview:self->_subtitleLabel];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(UILabel *)self->_subtitleLabel widthAnchor];
    v28 = [v15 widthAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v30[0] = v27;
    v26 = [(UILabel *)self->_subtitleLabel centerXAnchor];
    v25 = [v15 centerXAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v30[1] = v23;
    v22 = [(UILabel *)self->_subtitleLabel topAnchor];
    v16 = [(UILabel *)self->_titleLabel bottomAnchor];
    v17 = [v22 constraintEqualToAnchor:v16 constant:0.0];
    v30[2] = v17;
    v18 = [v15 bottomAnchor];
    double v19 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19];
    v30[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v24 activateConstraints:v21];
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
LABEL_5:
    [(UILabel *)subtitleLabel setText:v4];
    [(SFSiteIconCell *)self setNeedsLayout];
  }
}

- (void)configureUsingAction:(id)a3 backgroundEffect:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SFSiteIconCell *)self setTitle:&stru_1EDA07C28];
  [(SFSiteIconCell *)self setSubtitle:&stru_1EDA07C28];
  [(SFSiteIconCell *)self _setAction:v7 backgroundEffect:v6];

  [(SFSiteIconCell *)self layoutIfNeeded];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_iconDimmingView, 0);
}

@end