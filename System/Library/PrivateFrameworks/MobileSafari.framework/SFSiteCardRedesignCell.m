@interface SFSiteCardRedesignCell
+ (NSString)reuseIdentifier;
- (BOOL)_titleLabelPrefersMultipleLines;
- (LPLinkMetadata)metadata;
- (NSString)caption;
- (NSString)subtitle;
- (NSString)title;
- (SFSiteCardRedesignCell)initWithCoder:(id)a3;
- (SFSiteCardRedesignCell)initWithFrame:(CGRect)a3;
- (UIImage)badge;
- (UIImage)image;
- (id)focusEffect;
- (void)_updateLayoutForContentSizeChange;
- (void)layoutSubviews;
- (void)setBadge:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCaptionText:(id)a3 icon:(id)a4;
- (void)setImage:(id)a3;
- (void)setImageFromBookmark:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFSiteCardRedesignCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SiteCard";
}

- (SFSiteCardRedesignCell)initWithFrame:(CGRect)a3
{
  v98[19] = *MEMORY[0x1E4F143B8];
  v96.receiver = self;
  v96.super_class = (Class)SFSiteCardRedesignCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFSiteCardRedesignCell *)v3 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    v95 = [(SFStartPageFilledBackgroundCell *)v4 defaultBackgroundConfiguration];
    [v95 setCornerRadius:10.0];
    [(SFSiteCardRedesignCell *)v4 setBackgroundConfiguration:v95];
    v5 = [(SFSiteCardRedesignCell *)v4 contentView];
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v5, "setLayoutMargins:");
    v6 = objc_alloc_init(_SFSiteIconView);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    [(_SFSiteIconView *)v4->_imageView _setContinuousCornerRadius:6.0];
    [(_SFSiteIconView *)v4->_imageView setClipsToBounds:1];
    [(_SFSiteIconView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_imageView];
    v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    textLayoutGuide = v4->_textLayoutGuide;
    v4->_textLayoutGuide = v8;

    [(UILayoutGuide *)v4->_textLayoutGuide setIdentifier:@"SFSiteCardText"];
    [v5 addLayoutGuide:v4->_textLayoutGuide];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v12 = titleFont();
    [(UILabel *)v4->_titleLabel setFont:v12];

    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v13];

    [v5 addSubview:v4->_titleLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    v16 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    v17 = [v16 fontDescriptorWithSymbolicTraits:0];

    v18 = (void *)MEMORY[0x1E4FB08E0];
    [v17 pointSize];
    v19 = objc_msgSend(v18, "fontWithDescriptor:size:", v17);

    [(UILabel *)v4->_subtitleLabel setFont:v19];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:2];
    LODWORD(v20) = 1132068864;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v20];
    v94 = v5;
    [v5 addSubview:v4->_subtitleLabel];
    v21 = [(_SFSiteIconView *)v4->_imageView widthAnchor];
    v22 = [(SFSiteCardRedesignCell *)v4 traitCollection];
    v23 = [v21 constraintEqualToConstant:iconDimension(v22)];
    LODWORD(v24) = 1148682240;
    uint64_t v25 = objc_msgSend(v23, "sf_withPriority:", v24);
    iconDimensionConstraint = v4->_iconDimensionConstraint;
    v4->_iconDimensionConstraint = (NSLayoutConstraint *)v25;

    v27 = [v5 layoutMarginsGuide];
    v70 = (void *)MEMORY[0x1E4F28DC8];
    v93 = [(_SFSiteIconView *)v4->_imageView leadingAnchor];
    v84 = v27;
    v92 = [v27 leadingAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v98[0] = v91;
    v90 = [(UILayoutGuide *)v4->_textLayoutGuide leadingAnchor];
    v89 = [(_SFSiteIconView *)v4->_imageView trailingAnchor];
    v88 = [v90 constraintEqualToSystemSpacingAfterAnchor:v89 multiplier:1.0];
    v98[1] = v88;
    v87 = [(UILayoutGuide *)v4->_textLayoutGuide trailingAnchor];
    v86 = [v27 trailingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v98[2] = v85;
    v83 = [(_SFSiteIconView *)v4->_imageView topAnchor];
    v82 = [v27 topAnchor];
    v81 = [v83 constraintGreaterThanOrEqualToAnchor:v82];
    v98[3] = v81;
    v80 = [(_SFSiteIconView *)v4->_imageView centerYAnchor];
    v79 = [v27 centerYAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v98[4] = v78;
    v77 = [(_SFSiteIconView *)v4->_imageView bottomAnchor];
    v76 = [v27 bottomAnchor];
    v75 = [v77 constraintLessThanOrEqualToAnchor:v76];
    v98[5] = v75;
    v74 = [(UILayoutGuide *)v4->_textLayoutGuide bottomAnchor];
    v73 = [v27 bottomAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v98[6] = v72;
    v71 = [(UILayoutGuide *)v4->_textLayoutGuide topAnchor];
    v69 = [v27 topAnchor];
    v68 = [v71 constraintEqualToAnchor:v69];
    v98[7] = v68;
    v67 = [(UILayoutGuide *)v4->_textLayoutGuide heightAnchor];
    v66 = [(_SFSiteIconView *)v4->_imageView heightAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    LODWORD(v28) = 1148600320;
    v64 = objc_msgSend(v65, "sf_withPriority:", v28);
    v98[8] = v64;
    v98[9] = v4->_iconDimensionConstraint;
    v63 = [(_SFSiteIconView *)v4->_imageView heightAnchor];
    v62 = [(_SFSiteIconView *)v4->_imageView widthAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v98[10] = v61;
    v60 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v59 = [(UILayoutGuide *)v4->_textLayoutGuide leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v98[11] = v58;
    v57 = [(UILabel *)v4->_titleLabel widthAnchor];
    v56 = [(UILayoutGuide *)v4->_textLayoutGuide widthAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v98[12] = v55;
    v54 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v53 = [(UILayoutGuide *)v4->_textLayoutGuide leadingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v98[13] = v52;
    v51 = [(UILabel *)v4->_subtitleLabel widthAnchor];
    v50 = [(UILayoutGuide *)v4->_textLayoutGuide widthAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v98[14] = v49;
    v48 = [(UILabel *)v4->_titleLabel topAnchor];
    v47 = [(UILayoutGuide *)v4->_textLayoutGuide topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:0.0];
    v98[15] = v46;
    v45 = [(UILabel *)v4->_subtitleLabel topAnchor];
    v44 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v29 = [v45 constraintEqualToAnchor:v44 constant:0.0];
    v98[16] = v29;
    v30 = [(UILabel *)v4->_subtitleLabel bottomAnchor];
    v31 = [(UILayoutGuide *)v4->_textLayoutGuide bottomAnchor];
    v32 = [v30 constraintLessThanOrEqualToAnchor:v31];
    v98[17] = v32;
    v33 = [(SFSiteCardRedesignCell *)v4 contentView];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintEqualToConstant:0.0];
    LODWORD(v36) = 1132003328;
    v37 = objc_msgSend(v35, "sf_withPriority:", v36);
    v98[18] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:19];
    [v70 activateConstraints:v38];

    v39 = self;
    v97 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
    id v41 = (id)[(SFSiteCardRedesignCell *)v4 registerForTraitChanges:v40 withAction:sel__updateLayoutForContentSizeChange];

    v42 = v4;
  }

  return v4;
}

- (SFSiteCardRedesignCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSiteCardRedesignCell;
  return [(SFSiteCardRedesignCell *)&v4 initWithCoder:a3];
}

- (void)_updateLayoutForContentSizeChange
{
  v3 = [(SFSiteCardRedesignCell *)self traitCollection];
  [(NSLayoutConstraint *)self->_iconDimensionConstraint setConstant:iconDimension(v3)];

  [(SFSiteCardRedesignCell *)self setNeedsLayout];
}

- (BOOL)_titleLabelPrefersMultipleLines
{
  [(UILabel *)self->_titleLabel bounds];
  double v3 = v2;
  objc_super v4 = titleFont();
  [v4 lineHeight];
  BOOL v6 = v3 >= v5 + v5;

  return v6;
}

- (id)focusEffect
{
  double v2 = (void *)MEMORY[0x1E4FB1788];
  [(SFSiteCardRedesignCell *)self bounds];
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
      v11 = [(SFSiteCardRedesignCell *)self contentView];
      [v11 addSubview:self->_captionLabel];

      double v20 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v25 = [(SFSiteCardSourceView *)self->_captionLabel leadingAnchor];
      double v24 = [(UILayoutGuide *)self->_textLayoutGuide leadingAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v26[0] = v23;
      v22 = [(SFSiteCardSourceView *)self->_captionLabel widthAnchor];
      v21 = [(UILayoutGuide *)self->_textLayoutGuide widthAnchor];
      v19 = [v22 constraintEqualToAnchor:v21];
      v26[1] = v19;
      v18 = [(SFSiteCardSourceView *)self->_captionLabel topAnchor];
      v12 = [(UILabel *)self->_subtitleLabel bottomAnchor];
      v13 = [v18 constraintGreaterThanOrEqualToAnchor:v12 constant:0.0];
      v26[2] = v13;
      v14 = [(SFSiteCardSourceView *)self->_captionLabel bottomAnchor];
      v15 = [(UILayoutGuide *)self->_textLayoutGuide bottomAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v26[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v20 activateConstraints:v17];
    }
  }
  [(SFSiteCardSourceView *)self->_captionLabel setText:v6];
  [(SFSiteCardSourceView *)self->_captionLabel setImage:v7];
}

- (void)setImageFromBookmark:(id)a3
{
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
  double v2 = [(UILabel *)self->_titleLabel text];
  uint64_t v3 = v2;
  if (!v2) {
    double v2 = &stru_1EDA07C28;
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(SFSiteCardRedesignCell *)self setNeedsLayout];
}

- (NSString)subtitle
{
  double v2 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v3 = v2;
  if (!v2) {
    double v2 = &stru_1EDA07C28;
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setSubtitle:(id)a3
{
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)SFSiteCardRedesignCell;
  [(SFSiteCardRedesignCell *)&v2 layoutSubviews];
}

- (void)setMetadata:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  p_metadata = &self->_metadata;
  objc_storeStrong((id *)&self->_metadata, a3);
  id v6 = a3;
  id v7 = [v6 title];
  [(SFSiteCardRedesignCell *)self setTitle:v7];

  uint64_t v8 = [(LPLinkMetadata *)*p_metadata URL];
  v9 = [v8 host];
  v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");
  [(SFSiteCardRedesignCell *)self setSubtitle:v10];

  v11 = [(SFSiteCardRedesignCell *)self traitCollection];
  double v12 = iconDimension(v11);

  imageView = self->_imageView;
  v14 = (void *)MEMORY[0x1E4FB1830];
  v15 = [MEMORY[0x1E4FB1618] systemFillColor];
  v19[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v17 = [v14 configurationWithPaletteColors:v16];

  v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari" withConfiguration:v17];

  -[_SFSiteIconView updateSiteIconViewWithLinkMetadata:requiredImageSize:fallbackIcon:](imageView, "updateSiteIconViewWithLinkMetadata:requiredImageSize:fallbackIcon:", v6, v18, v12, v12);
}

- (UIImage)badge
{
  return self->badge;
}

- (void)setBadge:(id)a3
{
}

- (NSString)caption
{
  return self->caption;
}

- (void)setCaption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->caption, 0);
  objc_storeStrong((id *)&self->badge, 0);
  objc_storeStrong((id *)&self->_iconDimensionConstraint, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end