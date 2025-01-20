@interface SFSiteCardCell
+ (NSString)reuseIdentifier;
- (LPLinkMetadata)metadata;
- (NSString)caption;
- (NSString)subtitle;
- (NSString)title;
- (SFSiteCardCell)initWithCoder:(id)a3;
- (SFSiteCardCell)initWithFrame:(CGRect)a3;
- (UIImage)badge;
- (UIImage)image;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (id)focusEffect;
- (void)_updateVibrancy;
- (void)setBackdropCaptureView:(id)a3;
- (void)setBadge:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCaptionText:(id)a3 icon:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageFromBookmark:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFSiteCardCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SiteCard";
}

- (SFSiteCardCell)initWithFrame:(CGRect)a3
{
  v112[18] = *MEMORY[0x1E4F143B8];
  v111.receiver = self;
  v111.super_class = (Class)SFSiteCardCell;
  v3 = -[SFSiteCardCell initWithFrame:](&v111, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageCellBackgroundEffectViewWithShadow:", 1);
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v4;

    v6 = [(SFSiteCardCell *)v3 defaultBackgroundConfiguration];
    [v6 setCustomView:v3->_backgroundEffectView];
    [v6 setCornerRadius:10.0];
    [(SFSiteCardCell *)v3 setBackgroundConfiguration:v6];
    v55 = v6;
    v104 = [(SFSiteCardCell *)v3 contentView];
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v104, "setLayoutMargins:");
    v7 = objc_alloc_init(_SFSiteIconView);
    imageView = v3->_imageView;
    v3->_imageView = v7;

    [(_SFSiteIconView *)v3->_imageView _setContinuousCornerRadius:3.0];
    [(_SFSiteIconView *)v3->_imageView setClipsToBounds:1];
    [(_SFSiteIconView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v104 addSubview:v3->_imageView];
    v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    textLayoutGuide = v3->_textLayoutGuide;
    v3->_textLayoutGuide = v9;

    [(UILayoutGuide *)v3->_textLayoutGuide setIdentifier:@"SFSiteCardText"];
    [v104 addLayoutGuide:v3->_textLayoutGuide];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v11;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v13 = *MEMORY[0x1E4FB27B0];
    [(UILabel *)v3->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    v14 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    v15 = [v14 fontDescriptorWithSymbolicTraits:32770];

    v16 = (void *)MEMORY[0x1E4FB08E0];
    [v15 pointSize];
    v17 = objc_msgSend(v16, "fontWithDescriptor:size:", v15);

    [(UILabel *)v3->_titleLabel setFont:v17];
    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v18];

    [v104 addSubview:v3->_titleLabel];
    v19 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    subtitleEffectView = v3->_subtitleEffectView;
    v3->_subtitleEffectView = v19;

    [(UIVisualEffectView *)v3->_subtitleEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v104 addSubview:v3->_subtitleEffectView];
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v21;

    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_subtitleLabel setMaximumContentSizeCategory:v13];
    v23 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    v24 = [v23 fontDescriptorWithSymbolicTraits:0];

    v25 = (void *)MEMORY[0x1E4FB08E0];
    [v24 pointSize];
    v26 = objc_msgSend(v25, "fontWithDescriptor:size:", v24);

    [(UILabel *)v3->_subtitleLabel setFont:v26];
    [(UILabel *)v3->_subtitleLabel setLineBreakMode:5];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:1];
    v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v27];

    v28 = [(UIVisualEffectView *)v3->_subtitleEffectView contentView];
    [v28 addSubview:v3->_subtitleLabel];

    v105 = [v104 layoutMarginsGuide];
    v56 = (void *)MEMORY[0x1E4F28DC8];
    v103 = [(_SFSiteIconView *)v3->_imageView leadingAnchor];
    v102 = [v105 leadingAnchor];
    v101 = [v103 constraintEqualToAnchor:v102];
    v112[0] = v101;
    v100 = [(UILayoutGuide *)v3->_textLayoutGuide leadingAnchor];
    v99 = [(_SFSiteIconView *)v3->_imageView trailingAnchor];
    v98 = [v100 constraintEqualToSystemSpacingAfterAnchor:v99 multiplier:1.0];
    v112[1] = v98;
    v97 = [(UILayoutGuide *)v3->_textLayoutGuide trailingAnchor];
    v96 = [v105 trailingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v112[2] = v95;
    v94 = [(_SFSiteIconView *)v3->_imageView topAnchor];
    v93 = [v105 topAnchor];
    v92 = [v94 constraintGreaterThanOrEqualToAnchor:v93];
    v112[3] = v92;
    v91 = [(_SFSiteIconView *)v3->_imageView centerYAnchor];
    v90 = [v105 centerYAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v112[4] = v89;
    v88 = [(_SFSiteIconView *)v3->_imageView bottomAnchor];
    v87 = [v105 bottomAnchor];
    v86 = [v88 constraintLessThanOrEqualToAnchor:v87];
    v112[5] = v86;
    v85 = [(UILayoutGuide *)v3->_textLayoutGuide topAnchor];
    v84 = [v105 topAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v112[6] = v83;
    v82 = [(UILayoutGuide *)v3->_textLayoutGuide bottomAnchor];
    v81 = [v105 bottomAnchor];
    v80 = [v82 constraintLessThanOrEqualToAnchor:v81];
    v112[7] = v80;
    v79 = [(_SFSiteIconView *)v3->_imageView widthAnchor];
    v78 = [v79 constraintEqualToConstant:78.0];
    LODWORD(v29) = 1148682240;
    v77 = objc_msgSend(v78, "sf_withPriority:", v29);
    v112[8] = v77;
    v76 = [(_SFSiteIconView *)v3->_imageView heightAnchor];
    v75 = [(_SFSiteIconView *)v3->_imageView widthAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v112[9] = v74;
    v73 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v72 = [(UILayoutGuide *)v3->_textLayoutGuide leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v112[10] = v71;
    v70 = [(UILabel *)v3->_titleLabel widthAnchor];
    v69 = [(UILayoutGuide *)v3->_textLayoutGuide widthAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v112[11] = v68;
    v67 = [(UILabel *)v3->_subtitleLabel leadingAnchor];
    v66 = [(UILayoutGuide *)v3->_textLayoutGuide leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v112[12] = v65;
    v64 = [(UILabel *)v3->_subtitleLabel widthAnchor];
    v63 = [(UILayoutGuide *)v3->_textLayoutGuide widthAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v112[13] = v62;
    v61 = [(UILabel *)v3->_titleLabel topAnchor];
    v60 = [(UILayoutGuide *)v3->_textLayoutGuide topAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v112[14] = v59;
    v58 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v57 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v30 = [v58 constraintEqualToAnchor:v57 constant:2.0];
    v112[15] = v30;
    v31 = [(UILabel *)v3->_subtitleLabel bottomAnchor];
    v32 = [(UILayoutGuide *)v3->_textLayoutGuide bottomAnchor];
    v33 = [v31 constraintLessThanOrEqualToAnchor:v32];
    v112[16] = v33;
    v34 = [(SFSiteCardCell *)v3 contentView];
    v35 = [v34 heightAnchor];
    v36 = [v35 constraintEqualToConstant:0.0];
    LODWORD(v37) = 1132003328;
    v38 = objc_msgSend(v36, "sf_withPriority:", v37);
    v112[17] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:18];
    [v56 activateConstraints:v39];

    v40 = (void *)MEMORY[0x1E4F28DC8];
    v41 = v3->_subtitleLabel;
    v42 = [(UIVisualEffectView *)v3->_subtitleEffectView contentView];
    v43 = objc_msgSend(v40, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v41, v42);
    [v40 activateConstraints:v43];

    [(SFSiteCardCell *)v3 _updateVibrancy];
    v44 = v3->_backgroundEffectView;
    v45 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageBackgroundTraits");
    id v46 = (id)[(UIVisualEffectView *)v44 registerForTraitChanges:v45 withTarget:v3->_backgroundEffectView action:sel_sf_configureAsStartPageBackground];

    v47 = v3->_subtitleEffectView;
    v48 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageBackgroundTraits");
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __32__SFSiteCardCell_initWithFrame___block_invoke;
    v108[3] = &unk_1E54EB540;
    objc_copyWeak(&v109, &location);
    id v49 = (id)[(UIVisualEffectView *)v47 registerForTraitChanges:v48 withHandler:v108];

    captionLabel = v3->_captionLabel;
    v51 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageBackgroundTraits");
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __32__SFSiteCardCell_initWithFrame___block_invoke_2;
    v106[3] = &unk_1E54EB540;
    objc_copyWeak(&v107, &location);
    id v52 = (id)[(SFSiteCardSourceView *)captionLabel registerForTraitChanges:v51 withHandler:v106];

    v53 = v3;
    objc_destroyWeak(&v107);
    objc_destroyWeak(&v109);

    objc_destroyWeak(&location);
  }

  return v3;
}

void __32__SFSiteCardCell_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[83], "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
    WeakRetained = v2;
  }
}

void __32__SFSiteCardCell_initWithFrame___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[81], "sf_configureAsStartPageForegroundWithEffectStyle:", 1);
    WeakRetained = v2;
  }
}

- (SFSiteCardCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSiteCardCell;
  return [(SFSiteCardCell *)&v4 initWithCoder:a3];
}

- (void)_updateVibrancy
{
  [(UIVisualEffectView *)self->_backgroundEffectView sf_configureAsStartPageBackground];
  [(UIVisualEffectView *)self->_subtitleEffectView sf_configureAsStartPageForegroundWithEffectStyle:1];
  captionLabel = self->_captionLabel;

  [(UIVisualEffectView *)captionLabel sf_configureAsStartPageForegroundWithEffectStyle:1];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFSiteCardCell *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)SFSiteCardCell;
  [(SFSiteCardCell *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    backgroundEffectView = self->_backgroundEffectView;
    v7 = [(SFSiteCardCell *)self configurationState];
    [(UIVisualEffectView *)backgroundEffectView sf_setHighlighted:v3 cellState:v7];
  }
}

- (id)focusEffect
{
  v2 = (void *)MEMORY[0x1E4FB1788];
  [(SFSiteCardCell *)self bounds];
  uint64_t v3 = *MEMORY[0x1E4F39EA8];

  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", v3);
}

- (void)setCaptionText:(id)a3 icon:(id)a4
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_captionLabel)
  {
    uint64_t v8 = [v6 length];
    if (v7 || v8)
    {
      v9 = objc_alloc_init(SFSiteCardSourceView);
      captionLabel = self->_captionLabel;
      self->_captionLabel = v9;

      [(SFSiteCardSourceView *)self->_captionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v11 = [(SFSiteCardCell *)self contentView];
      [v11 addSubview:self->_captionLabel];

      v20 = (void *)MEMORY[0x1E4F28DC8];
      v25 = [(SFSiteCardSourceView *)self->_captionLabel leadingAnchor];
      v24 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v26[0] = v23;
      v22 = [(SFSiteCardSourceView *)self->_captionLabel widthAnchor];
      v21 = [(UILayoutGuide *)self->_textLayoutGuide widthAnchor];
      v19 = [v22 constraintEqualToAnchor:v21];
      v26[1] = v19;
      v18 = [(SFSiteCardSourceView *)self->_captionLabel topAnchor];
      v12 = [(UILabel *)self->_subtitleLabel bottomAnchor];
      uint64_t v13 = [v18 constraintEqualToAnchor:v12 constant:8.0];
      v26[2] = v13;
      v14 = [(SFSiteCardSourceView *)self->_captionLabel bottomAnchor];
      v15 = [(UILayoutGuide *)self->_textLayoutGuide bottomAnchor];
      v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
      v26[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v20 activateConstraints:v17];

      [(SFSiteCardCell *)self _updateVibrancy];
    }
  }
  [(SFSiteCardSourceView *)self->_captionLabel setText:v6];
  [(SFSiteCardSourceView *)self->_captionLabel setImage:v7];
}

- (void)setImageFromBookmark:(id)a3
{
}

- (UIImage)badge
{
  return [(UIImageView *)self->_badgeView image];
}

- (void)setBadge:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  badgeView = self->_badgeView;
  if (v4 && !badgeView)
  {
    v24 = [(SFSiteCardCell *)self contentView];
    id v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    id v7 = self->_badgeView;
    self->_badgeView = v6;

    [(UIImageView *)self->_badgeView setClipsToBounds:1];
    [(UIImageView *)self->_badgeView setHidden:1];
    [(UIImageView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 insertSubview:self->_badgeView aboveSubview:self->_imageView];
    [(UIImageView *)self->_badgeView layer];
    uint64_t v8 = v25 = v4;
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.668 alpha:0.6];
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    [v8 setBorderWidth:_SFOnePixel()];
    [v8 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v8 setCornerRadius:4.0];
    objc_msgSend(v8, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v10) = 1025758986;
    [v8 setShadowOpacity:v10];
    [v8 setShadowRadius:3.0];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UIImageView *)self->_badgeView topAnchor];
    v22 = [(_SFSiteIconView *)self->_imageView topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22 constant:-5.0];
    v26[0] = v21;
    v20 = [(UIImageView *)self->_badgeView leadingAnchor];
    v18 = [(_SFSiteIconView *)self->_imageView leadingAnchor];
    v11 = [v20 constraintEqualToAnchor:v18 constant:-5.0];
    v26[1] = v11;
    v12 = [(UIImageView *)self->_badgeView widthAnchor];
    uint64_t v13 = [(UIImageView *)self->_badgeView heightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v26[2] = v14;
    v15 = [(UIImageView *)self->_badgeView widthAnchor];
    v16 = [v15 constraintEqualToConstant:20.0];
    v26[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v19 activateConstraints:v17];

    id v4 = v25;
    badgeView = self->_badgeView;
  }
  [(UIImageView *)badgeView setImage:v4];
  [(UIImageView *)self->_badgeView setHidden:v4 == 0];
}

- (UIImage)image
{
  return [(_SFSiteIconView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (NSString)title
{
  v2 = [(UILabel *)self->_titleLabel text];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_1EDA07C28;
  }
  id v4 = v2;

  return v4;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  v2 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_1EDA07C28;
  }
  id v4 = v2;

  return v4;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)caption
{
  v2 = [(SFSiteCardSourceView *)self->_captionLabel text];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_1EDA07C28;
  }
  id v4 = v2;

  return v4;
}

- (void)setCaption:(id)a3
{
  [(SFSiteCardSourceView *)self->_captionLabel setText:a3];
  captionLabel = self->_captionLabel;

  [(SFSiteCardSourceView *)captionLabel setImage:0];
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)[(UIVisualEffectView *)self->_backgroundEffectView _captureView];
}

- (void)setBackdropCaptureView:(id)a3
{
  id v6 = a3;
  id v4 = [(UIVisualEffectView *)self->_backgroundEffectView _captureView];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIVisualEffectView *)self->_backgroundEffectView _setCaptureView:v6];
  }
}

- (LPLinkMetadata)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);

  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end