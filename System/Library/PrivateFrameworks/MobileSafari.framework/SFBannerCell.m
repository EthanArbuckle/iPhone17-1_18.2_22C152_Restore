@interface SFBannerCell
+ (NSString)reuseIdentifier;
- (NSString)message;
- (NSString)title;
- (SFBannerCell)initWithCoder:(id)a3;
- (SFBannerCell)initWithFrame:(CGRect)a3;
- (SFBannerCell)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (SFBannerCell)initWithStyle:(int64_t)a3;
- (id)dismissHandler;
- (id)focusEffect;
- (int64_t)bannerStyle;
- (void)_dismiss:(id)a3;
- (void)_updateStyle;
- (void)configureUsingBanner:(id)a3;
- (void)layoutSubviews;
- (void)setBannerStyle:(int64_t)a3;
- (void)setDismissHandler:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"Banner";
}

- (SFBannerCell)initWithStyle:(int64_t)a3
{
  return -[SFBannerCell initWithFrame:style:](self, "initWithFrame:style:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (SFBannerCell)initWithFrame:(CGRect)a3
{
  return -[SFBannerCell initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFBannerCell)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v79[5] = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)SFBannerCell;
  v5 = -[SFBannerCell initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_bannerStyle = a4;
    v7 = [(SFBannerCell *)v5 defaultBackgroundConfiguration];
    uint64_t v8 = +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:0];
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (SFBannerBackgroundView *)v8;

    [(SFBannerBackgroundView *)v6->_backgroundView _setGroupName:0];
    v73 = v7;
    [v7 setCustomView:v6->_backgroundView];
    [v7 setCornerRadius:10.0];
    [(SFBannerCell *)v6 setBackgroundConfiguration:v7];
    v10 = [(SFBannerCell *)v6 contentView];
    v72 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1930], "sf_startPageBannerTitleLabelWithFont:", v72);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v11;

    [(UILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v6->_titleLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    messageLabel = v6->_messageLabel;
    v6->_messageLabel = v13;

    [(UILabel *)v6->_messageLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_messageLabel setNumberOfLines:0];
    [(UILabel *)v6->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(UILabel *)v6->_messageLabel setContentHuggingPriority:1 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v6->_messageLabel setContentCompressionResistancePriority:1 forAxis:v16];
    [v10 addSubview:v6->_messageLabel];
    v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    [(UIButton *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v17 _sf_setMatchesIntrinsicContentSize];
    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v19 = (void *)MEMORY[0x1E4FB1618];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __makeDismissButton_block_invoke_0;
    v75[3] = &unk_1E54EB3B8;
    id v76 = v18;
    id v20 = v18;
    v21 = [v19 colorWithDynamicProvider:v75];
    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    v23 = [v22 imageWithTintColor:v21 renderingMode:1];
    [(UIButton *)v17 setTintColor:v20];
    [(UIButton *)v17 setImage:v22 forState:0];
    [(UIButton *)v17 setImage:v23 forState:1];

    dismissButton = v6->_dismissButton;
    v6->_dismissButton = v17;

    [(UIButton *)v6->_dismissButton addTarget:v6 action:sel__dismiss_ forControlEvents:0x2000];
    v71 = v10;
    [v10 addSubview:v6->_dismissButton];
    v25 = [v10 layoutMarginsGuide];
    v57 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(UIButton *)v6->_dismissButton topAnchor];
    v67 = [v25 topAnchor];
    v65 = [v69 constraintEqualToAnchor:v67];
    v79[0] = v65;
    v63 = [(UIButton *)v6->_dismissButton trailingAnchor];
    v61 = [v25 trailingAnchor];
    v59 = [v63 constraintEqualToAnchor:v61];
    v79[1] = v59;
    v55 = [(UIButton *)v6->_dismissButton bottomAnchor];
    v54 = [v25 bottomAnchor];
    v26 = [v55 constraintLessThanOrEqualToAnchor:v54];
    v79[2] = v26;
    v27 = [(UILabel *)v6->_messageLabel leadingAnchor];
    v56 = v25;
    v28 = [v25 leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v79[3] = v29;
    v30 = [(UILabel *)v6->_messageLabel bottomAnchor];
    v31 = [v25 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v79[4] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:5];
    [v57 activateConstraints:v33];

    v34 = [(UILabel *)v6->_messageLabel topAnchor];
    v35 = [v56 topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v78[0] = v36;
    v37 = [(UIButton *)v6->_dismissButton leadingAnchor];
    v38 = [(UILabel *)v6->_messageLabel trailingAnchor];
    v39 = [v37 constraintEqualToSystemSpacingAfterAnchor:v38 multiplier:1.0];
    v78[1] = v39;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    minimalLayoutConstraints = v6->_minimalLayoutConstraints;
    v6->_minimalLayoutConstraints = (NSArray *)v40;

    v70 = [(UILabel *)v6->_titleLabel topAnchor];
    v68 = [v56 topAnchor];
    v66 = [v70 constraintEqualToAnchor:v68];
    v77[0] = v66;
    v64 = [(UILabel *)v6->_titleLabel leadingAnchor];
    v62 = [v56 leadingAnchor];
    v60 = [v64 constraintEqualToAnchor:v62];
    v77[1] = v60;
    v58 = [(UILabel *)v6->_titleLabel trailingAnchor];
    v42 = [v56 trailingAnchor];
    v43 = [v58 constraintEqualToAnchor:v42];
    v77[2] = v43;
    v44 = [(UILabel *)v6->_messageLabel topAnchor];
    v45 = [(UILabel *)v6->_titleLabel bottomAnchor];
    v46 = [v44 constraintEqualToSystemSpacingBelowAnchor:v45 multiplier:1.0];
    v77[3] = v46;
    v47 = [(UILabel *)v6->_messageLabel trailingAnchor];
    v48 = [v56 trailingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v77[4] = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:5];
    prominentLayoutConstraints = v6->_prominentLayoutConstraints;
    v6->_prominentLayoutConstraints = (NSArray *)v50;

    [(SFBannerCell *)v6 _updateStyle];
    v52 = v6;
  }
  return v6;
}

- (SFBannerCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFBannerCell;
  return [(SFBannerCell *)&v4 initWithCoder:a3];
}

- (void)_updateStyle
{
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_minimalLayoutConstraints, self->_bannerStyle == 0);
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_prominentLayoutConstraints, self->_bannerStyle == 1);
  [(SFBannerBackgroundView *)self->_backgroundView setBannerStyle:self->_bannerStyle];
  [(UIButton *)self->_dismissButton setHidden:self->_dismissHandler == 0];
  [(UILabel *)self->_titleLabel setHidden:self->_bannerStyle == 0];
  int64_t bannerStyle = self->_bannerStyle;
  if (bannerStyle == 1)
  {
    v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    p_messageLabel = &self->_messageLabel;
    [(UILabel *)self->_messageLabel setFont:v10];

    [(UILabel *)self->_messageLabel setTextAlignment:1];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
  }
  else
  {
    if (bannerStyle) {
      return;
    }
    objc_super v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    v5 = [v4 fontDescriptorWithSymbolicTraits:0];

    v6 = (void *)MEMORY[0x1E4FB08E0];
    [v5 pointSize];
    v7 = objc_msgSend(v6, "fontWithDescriptor:size:", v5);

    p_messageLabel = &self->_messageLabel;
    [(UILabel *)self->_messageLabel setFont:v7];

    [(UILabel *)self->_messageLabel setTextAlignment:4];
    v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UILabel *)*p_messageLabel setTextColor:v9];

  UIEdgeInsetsMakeWithEdges();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [(SFBannerCell *)self contentView];
  objc_msgSend(v19, "setLayoutMargins:", v12, v14, v16, v18);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFBannerCell;
  [(SFBannerCell *)&v3 layoutSubviews];
  [(UILabel *)self->_titleLabel frame];
  [(UILabel *)self->_titleLabel setPreferredMaxLayoutWidth:CGRectGetWidth(v4)];
  [(UILabel *)self->_messageLabel frame];
  [(UILabel *)self->_messageLabel setPreferredMaxLayoutWidth:CGRectGetWidth(v5)];
}

- (id)focusEffect
{
  v2 = (void *)MEMORY[0x1E4FB1788];
  [(SFBannerCell *)self bounds];
  uint64_t v3 = *MEMORY[0x1E4F39EA8];

  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", v3);
}

- (void)_dismiss:(id)a3
{
}

- (void)configureUsingBanner:(id)a3
{
  id v20 = a3;
  CGRect v4 = [v20 image];
  if (v4)
  {
    CGRect v5 = (void *)MEMORY[0x1E4F28B18];
    v6 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v4];
    v7 = [v5 attributedStringWithAttachment:v6];

    uint64_t v8 = [v20 title];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      if ([(UIView *)self _sf_usesLeftToRightLayout])
      {
        [v9 appendAttributedString:v7];
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v9 appendAttributedString:v10];

        id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
        double v12 = [v20 title];
        double v13 = (void *)[v11 initWithString:v12];
        [v9 appendAttributedString:v13];
      }
      else
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
        double v15 = [v20 title];
        double v16 = (void *)[v14 initWithString:v15];
        [v9 appendAttributedString:v16];

        double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v9 appendAttributedString:v17];

        [v9 appendAttributedString:v7];
      }
      [(UILabel *)self->_titleLabel setAttributedText:v9];
    }
    else
    {
      [(UILabel *)self->_titleLabel setAttributedText:v7];
    }
  }
  else
  {
    v7 = [v20 title];
    [(UILabel *)self->_titleLabel setText:v7];
  }

  double v18 = [v20 message];
  [(UILabel *)self->_messageLabel setText:v18];

  id v19 = [v20 action];
  [(SFBannerCell *)self setDismissHandler:v19];

  -[SFBannerCell setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v20 userInterfaceStyle]);
  [(SFBannerCell *)self setNeedsLayout];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(SFBannerCell *)self setNeedsLayout];
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)setMessage:(id)a3
{
  [(UILabel *)self->_messageLabel setText:a3];

  [(SFBannerCell *)self setNeedsLayout];
}

- (void)setDismissHandler:(id)a3
{
  CGRect v4 = _Block_copy(a3);
  id dismissHandler = self->_dismissHandler;
  self->_id dismissHandler = v4;

  [(SFBannerCell *)self setNeedsLayout];
}

- (void)setBannerStyle:(int64_t)a3
{
  if (self->_bannerStyle != a3)
  {
    self->_int64_t bannerStyle = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __31__SFBannerCell_setBannerStyle___block_invoke;
    v3[3] = &unk_1E54E9858;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __31__SFBannerCell_setBannerStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyle];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (int64_t)bannerStyle
{
  return self->_bannerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_prominentLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_minimalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end