@interface _VideosExtrasGridHeaderView
- (UILabel)titleLabel;
- (_VideosExtrasGridHeaderView)initWithFrame:(CGRect)a3;
- (void)configureForImage:(id)a3 title:(id)a4 subtitle:(id)a5 style:(id)a6;
@end

@implementation _VideosExtrasGridHeaderView

- (_VideosExtrasGridHeaderView)initWithFrame:(CGRect)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)_VideosExtrasGridHeaderView;
  v3 = -[_VideosExtrasGridHeaderView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_VideosExtrasGridHeaderView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F76ED8]) initForAutolayout];
    artworkView = v4->_artworkView;
    v4->_artworkView = (MPUArtworkView *)v5;

    [(_VideosExtrasGridHeaderView *)v4 addSubview:v4->_artworkView];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v7;

    [(UILabel *)v4->_titleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(_VideosExtrasGridHeaderView *)v4 addSubview:v4->_titleLabel];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v9;

    [(UILabel *)v4->_subtitleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(_VideosExtrasGridHeaderView *)v4 addSubview:v4->_subtitleLabel];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    bottomLabelSpacer = v4->_bottomLabelSpacer;
    v4->_bottomLabelSpacer = (UIView *)v11;

    [(_VideosExtrasGridHeaderView *)v4 addSubview:v4->_bottomLabelSpacer];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsBySizingView:toSize:", v4->_artworkView, 50.0, 50.0);
    artworkSizeConstraints = v4->_artworkSizeConstraints;
    v4->_artworkSizeConstraints = (NSArray *)v13;

    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_artworkView attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:0.0];
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_artworkView attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
    v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_titleLabel attribute:5 relatedBy:0 toItem:v4->_artworkView attribute:6 multiplier:1.0 constant:15.0];
    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_titleLabel attribute:6 relatedBy:-1 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
    v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_subtitleLabel attribute:5 relatedBy:0 toItem:v4->_artworkView attribute:6 multiplier:1.0 constant:15.0];
    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_subtitleLabel attribute:6 relatedBy:-1 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_bottomLabelSpacer attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    v27[0] = v17;
    v27[1] = v19;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    textLeadingConstraints = v4->_textLeadingConstraints;
    v4->_textLeadingConstraints = (NSArray *)v22;

    v24 = [MEMORY[0x1E4F1CA48] array];
    [v24 addObjectsFromArray:v4->_artworkSizeConstraints];
    [v24 addObject:v15];
    [v24 addObject:v16];
    [v24 addObject:v21];
    [v24 addObject:v17];
    [v24 addObject:v18];
    [v24 addObject:v19];
    [v24 addObject:v20];
    [(_VideosExtrasGridHeaderView *)v4 addConstraints:v24];
  }
  return v4;
}

- (void)configureForImage:(id)a3 title:(id)a4 subtitle:(id)a5 style:(id)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  v102 = v12;
  if (v11)
  {
    v15 = [v13 titleColor];
    [(UILabel *)self->_titleLabel setTextColor:v15];

    v16 = (void *)MEMORY[0x1E4FB08E8];
    v17 = [v14 titleDefaultFontAttributes];
    v18 = [v16 fontDescriptorWithFontAttributes:v17];

    titleLabel = self->_titleLabel;
    v20 = [v14 titleTextStyle];
    [(UILabel *)titleLabel configureForIKTextElement:v11 fontDescriptor:v18 textStyle:v20];
  }
  id v100 = v11;
  if (v12)
  {
    v21 = [v14 subtitleColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v21];

    uint64_t v22 = (void *)MEMORY[0x1E4FB08E8];
    v23 = [v14 subtitleDefaultFontAttributes];
    v24 = [v22 fontDescriptorWithFontAttributes:v23];

    subtitleLabel = self->_subtitleLabel;
    objc_super v26 = [v14 subtitleTextStyle];
    [(UILabel *)subtitleLabel configureForIKTextElement:v12 fontDescriptor:v24 textStyle:v26];
  }
  double v27 = 0.0;
  double v28 = 10.0;
  if (v10 && [v14 showsImage])
  {
    v29 = [v10 placeholderURL];
    v30 = [MEMORY[0x1E4FB1818] imageForPlaceholderURL:v29];
    [(MPUArtworkView *)self->_artworkView setPlaceholderImage:v30];
    v31 = [v10 artworkCatalog];
    double v27 = 50.0;
    objc_msgSend(v31, "setFittingSize:", 50.0, 50.0);
    artworkView = self->_artworkView;
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __70___VideosExtrasGridHeaderView_configureForImage_title_subtitle_style___block_invoke;
    v112[3] = &unk_1E6DF6810;
    v112[4] = self;
    [v31 setDestination:artworkView configurationBlock:v112];

    double v28 = 15.0;
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v33 = self->_artworkSizeConstraints;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v108 objects:v119 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v109 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v108 + 1) + 8 * i) setConstant:v27];
      }
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v108 objects:v119 count:16];
    }
    while (v35);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v38 = self->_textLeadingConstraints;
  uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v104 objects:v118 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v105 != v41) {
          objc_enumerationMutation(v38);
        }
        [*(id *)(*((void *)&v104 + 1) + 8 * j) setConstant:v28];
      }
      uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v104 objects:v118 count:16];
    }
    while (v40);
  }

  v43 = [(UILabel *)self->_titleLabel attributedText];
  v101 = v10;
  if ([v43 length])
  {
  }
  else
  {
    v44 = [(UILabel *)self->_titleLabel text];
    uint64_t v45 = [v44 length];

    if (!v45)
    {
      v46 = self->_subtitleLabel;
      v47 = self;
      [v14 subtitleLineHeight];
      double v49 = v95;
      v103 = [v14 subtitleTextStyle];
      uint64_t v50 = 3;
      goto LABEL_26;
    }
  }
  v46 = self->_titleLabel;
  v47 = self->_titleLabel;
  [v14 titleLineHeight];
  double v49 = v48;
  v103 = [v14 titleTextStyle];
  uint64_t v50 = 11;
LABEL_26:
  topLabelConstraint = self->_topLabelConstraint;
  if (!topLabelConstraint) {
    goto LABEL_30;
  }
  v52 = [(MPUContentSizeLayoutConstraint *)topLabelConstraint firstItem];

  if (v52 != v46)
  {
    v53 = (void *)MEMORY[0x1E4F28DC8];
    v117 = self->_topLabelConstraint;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
    [v53 deactivateConstraints:v54];

    v55 = self->_topLabelConstraint;
    self->_topLabelConstraint = 0;
  }
  v56 = self->_topLabelConstraint;
  if (!v56)
  {
LABEL_30:
    v57 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:v46 relation:0 toView:self attribute:3 withTextStyle:v103 multiplier:1.0 nonStandardLeading:v49];
    v58 = self->_topLabelConstraint;
    self->_topLabelConstraint = v57;

    v59 = (void *)MEMORY[0x1E4F28DC8];
    v116 = self->_topLabelConstraint;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    [v59 activateConstraints:v60];

    v56 = self->_topLabelConstraint;
  }
  v99 = v46;
  [(MPUContentSizeLayoutConstraint *)v56 setTextStyle:v103];
  [(MPUContentSizeLayoutConstraint *)self->_topLabelConstraint setDefaultSizeConstant:v49];
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    v62 = [(MPUContentSizeLayoutConstraint *)subtitleBaselineConstraint secondItem];
    if (v62 == v47)
    {
      uint64_t v63 = [(MPUContentSizeLayoutConstraint *)self->_subtitleBaselineConstraint secondAttribute];

      if (v63 == v50) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    [(_VideosExtrasGridHeaderView *)self removeConstraint:self->_subtitleBaselineConstraint];
    v64 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_36:
    if (self->_subtitleBaselineConstraint) {
      goto LABEL_38;
    }
  }
  v65 = (void *)MEMORY[0x1E4F73A08];
  v66 = self->_subtitleLabel;
  v67 = [v14 subtitleTextStyle];
  [v14 subtitleLineHeight];
  v69 = [v65 constraintWithAutoupdatingBaselineOfView:v66 relation:0 toView:v47 attribute:v50 withTextStyle:v67 multiplier:1.0 nonStandardLeading:v68];
  v70 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v69;

  [(_VideosExtrasGridHeaderView *)self addConstraint:self->_subtitleBaselineConstraint];
LABEL_38:
  v71 = [v14 subtitleTextStyle];
  [(MPUContentSizeLayoutConstraint *)self->_subtitleBaselineConstraint setTextStyle:v71];

  [v14 subtitleLineHeight];
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_subtitleBaselineConstraint, "setDefaultSizeConstant:");
  v72 = [(UILabel *)self->_subtitleLabel attributedText];
  if ([v72 length])
  {

LABEL_41:
    v75 = self->_subtitleLabel;
    v76 = [v14 subtitleTextStyle];
    v77 = v100;
    goto LABEL_42;
  }
  v73 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v74 = [v73 length];

  if (v74) {
    goto LABEL_41;
  }
  v96 = [(UILabel *)self->_titleLabel attributedText];
  if ([v96 length])
  {

    v77 = v100;
LABEL_54:
    v75 = self->_titleLabel;
    v76 = [v14 titleTextStyle];
    goto LABEL_42;
  }
  v97 = [(UILabel *)self->_titleLabel text];
  uint64_t v98 = [v97 length];

  v77 = v100;
  if (v98) {
    goto LABEL_54;
  }
  v75 = 0;
  v76 = 0;
LABEL_42:
  bottomLabelSpacerHeight = self->_bottomLabelSpacerHeight;
  if (!bottomLabelSpacerHeight)
  {
    v79 = (void *)MEMORY[0x1E4F73A08];
    bottomLabelSpacer = self->_bottomLabelSpacer;
    [v14 bottomLabelDescender];
    v82 = [v79 contentSizeAutoupdatingConstraintWithItem:bottomLabelSpacer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:v76 textStyle:1.0 defaultSizeConstant:v81];
    v83 = self->_bottomLabelSpacerHeight;
    self->_bottomLabelSpacerHeight = v82;

    v84 = (void *)MEMORY[0x1E4F28DC8];
    v115 = self->_bottomLabelSpacerHeight;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
    [v84 activateConstraints:v85];

    bottomLabelSpacerHeight = self->_bottomLabelSpacerHeight;
  }
  [(MPUContentSizeLayoutConstraint *)bottomLabelSpacerHeight setTextStyle:v76];
  [v14 bottomLabelDescender];
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_bottomLabelSpacerHeight, "setDefaultSizeConstant:");
  bottomLabelConstraint = self->_bottomLabelConstraint;
  if (!bottomLabelConstraint) {
    goto LABEL_48;
  }
  v87 = [(NSLayoutConstraint *)bottomLabelConstraint secondItem];

  if (v87 != v75)
  {
    v88 = (void *)MEMORY[0x1E4F28DC8];
    v114 = self->_bottomLabelConstraint;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    [v88 deactivateConstraints:v89];

    v90 = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = 0;
  }
  if (!self->_bottomLabelConstraint)
  {
LABEL_48:
    v91 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bottomLabelSpacer attribute:3 relatedBy:0 toItem:v75 attribute:11 multiplier:1.0 constant:0.0];
    v92 = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = v91;

    v93 = (void *)MEMORY[0x1E4F28DC8];
    v113 = self->_bottomLabelConstraint;
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
    [v93 activateConstraints:v94];
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomLabelSpacer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_bottomLabelSpacerHeight, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_artworkSizeConstraints, 0);
}

@end