@interface VideosExtrasTableViewCell
- (IKListItemLockupElement)element;
- (VideosExtrasConstrainedArtworkContainerView)artworkContainerView;
- (VideosExtrasTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureForListItemLockupElement:(id)a3 wide:(BOOL)a4;
- (void)prepareForReuse;
- (void)setElement:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VideosExtrasTableViewCell

- (VideosExtrasTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v79[5] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)VideosExtrasTableViewCell;
  v4 = [(VideosExtrasTableViewCell *)&v75 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(VideosExtrasTableViewCell *)v4 setSelectionStyle:0];
    uint64_t v6 = [[VideosExtrasConstrainedArtworkContainerView alloc] initForAutolayout];
    artworkContainer = v5->_artworkContainer;
    v5->_artworkContainer = (VideosExtrasConstrainedArtworkContainerView *)v6;

    v8 = [(VideosExtrasTableViewCell *)v5 contentView];
    [v8 addSubview:v5->_artworkContainer];

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    textContainerView = v5->_textContainerView;
    v5->_textContainerView = (UIView *)v9;

    LODWORD(v11) = 1144750080;
    [(UIView *)v5->_textContainerView setContentHuggingPriority:1 forAxis:v11];
    v12 = [(VideosExtrasTableViewCell *)v5 contentView];
    [v12 addSubview:v5->_textContainerView];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v13;

    LODWORD(v15) = 1144750080;
    [(UILabel *)v5->_titleLabel setContentCompressionResistancePriority:1 forAxis:v15];
    [(UILabel *)v5->_titleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UIView *)v5->_textContainerView addSubview:v5->_titleLabel];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = (UILabel *)v16;

    LODWORD(v18) = 1144750080;
    [(UILabel *)v5->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v18];
    [(UILabel *)v5->_subtitleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UIView *)v5->_textContainerView addSubview:v5->_subtitleLabel];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = v5->_artworkContainer;
    v21 = [(VideosExtrasTableViewCell *)v5 contentView];
    v74 = [v19 constraintWithItem:v20 attribute:10 relatedBy:0 toItem:v21 attribute:10 multiplier:1.0 constant:0.0];

    uint64_t v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_artworkContainer attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    artworkWidthConstraint = v5->_artworkWidthConstraint;
    v5->_artworkWidthConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1148829696;
    [(NSLayoutConstraint *)v5->_artworkWidthConstraint setPriority:v24];
    uint64_t v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5->_artworkContainer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    artworkHeightConstraint = v5->_artworkHeightConstraint;
    v5->_artworkHeightConstraint = (NSLayoutConstraint *)v25;

    LODWORD(v27) = 1148829696;
    [(NSLayoutConstraint *)v5->_artworkHeightConstraint setPriority:v27];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = v5->_textContainerView;
    v30 = [(VideosExtrasTableViewCell *)v5 contentView];
    v73 = [v28 constraintWithItem:v29 attribute:10 relatedBy:0 toItem:v30 attribute:10 multiplier:1.0 constant:0.0];

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = v5->_textContainerView;
    v33 = [(VideosExtrasTableViewCell *)v5 contentView];
    uint64_t v34 = [v31 constraintWithItem:v32 attribute:6 relatedBy:0 toItem:v33 attribute:6 multiplier:1.0 constant:-15.0];
    textTrailingConstraint = v5->_textTrailingConstraint;
    v5->_textTrailingConstraint = (NSLayoutConstraint *)v34;

    v36 = [(VideosExtrasTableViewCell *)v5 contentView];
    v79[0] = v74;
    v79[1] = v5->_artworkWidthConstraint;
    v79[2] = v5->_artworkHeightConstraint;
    v79[3] = v73;
    v79[4] = v5->_textTrailingConstraint;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:5];
    [v36 addConstraints:v37];

    v38 = (void *)MEMORY[0x1E4F28DC8];
    v39 = v5->_artworkContainer;
    v40 = [(VideosExtrasTableViewCell *)v5 contentView];
    v41 = [v38 constraintWithItem:v39 attribute:3 relatedBy:1 toItem:v40 attribute:3 multiplier:1.0 constant:15.0];

    v42 = (void *)MEMORY[0x1E4F28DC8];
    v43 = v5->_artworkContainer;
    v44 = [(VideosExtrasTableViewCell *)v5 contentView];
    v45 = [v42 constraintWithItem:v43 attribute:4 relatedBy:-1 toItem:v44 attribute:4 multiplier:1.0 constant:-15.0];

    v46 = (void *)MEMORY[0x1E4F28DC8];
    v47 = v5->_textContainerView;
    v48 = [(VideosExtrasTableViewCell *)v5 contentView];
    v49 = [v46 constraintWithItem:v47 attribute:3 relatedBy:1 toItem:v48 attribute:3 multiplier:1.0 constant:0.0];

    v50 = (void *)MEMORY[0x1E4F28DC8];
    v51 = v5->_textContainerView;
    v52 = [(VideosExtrasTableViewCell *)v5 contentView];
    v53 = [v50 constraintWithItem:v51 attribute:4 relatedBy:-1 toItem:v52 attribute:4 multiplier:1.0 constant:0.0];

    v78 = v41;
    uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    topConstraints = v5->_topConstraints;
    v5->_topConstraints = (NSArray *)v54;

    v77 = v45;
    uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    bottomConstraints = v5->_bottomConstraints;
    v5->_bottomConstraints = (NSArray *)v56;

    v58 = (void *)MEMORY[0x1E4F28DC8];
    v76[0] = v41;
    v76[1] = v45;
    v76[2] = v49;
    v76[3] = v53;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
    [v58 activateConstraints:v59];

    double v60 = *MEMORY[0x1E4FB2848];
    double v61 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v62 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v63 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v64 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v5->_titleLabel, v5->_textContainerView, 10, *MEMORY[0x1E4FB2848], v61, v62, v63);
    v65 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v5->_subtitleLabel, v5->_textContainerView, 10, v60, v61, v62, v63);
    [(UIView *)v5->_textContainerView addConstraints:v64];
    [(UIView *)v5->_textContainerView addConstraints:v65];
    v66 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [(VideosExtrasTableViewCell *)v5 contentView];
    uint64_t v68 = [v66 constraintWithItem:v67 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:60.0];
    minimumHeightConstraint = v5->_minimumHeightConstraint;
    v5->_minimumHeightConstraint = (NSLayoutConstraint *)v68;

    LODWORD(v70) = 1148829696;
    [(NSLayoutConstraint *)v5->_minimumHeightConstraint setPriority:v70];
    v71 = [(VideosExtrasTableViewCell *)v5 contentView];
    [v71 addConstraint:v5->_minimumHeightConstraint];
  }
  return v5;
}

- (void)configureForListItemLockupElement:(id)a3 wide:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (IKListItemLockupElement *)a3;
  self->_element = v6;
  v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  [(VideosExtrasTableViewCell *)self setBackgroundColor:v7];

  double v8 = 60.0;
  if (v4)
  {
    double v8 = 78.0;
    double v9 = 15.0;
  }
  else
  {
    double v9 = 10.0;
  }
  [(NSLayoutConstraint *)self->_minimumHeightConstraint setConstant:v8];
  [(NSLayoutConstraint *)self->_textTrailingConstraint setConstant:-v9];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v10 = self->_topConstraints;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v135 objects:v140 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v136 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v135 + 1) + 8 * i) setConstant:v9];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v135 objects:v140 count:16];
    }
    while (v12);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  double v15 = self->_bottomConstraints;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v131 objects:v139 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v132;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v132 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v131 + 1) + 8 * j) setConstant:-v9];
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v131 objects:v139 count:16];
    }
    while (v17);
  }

  v20 = [(IKListItemLockupElement *)v6 images];
  v21 = [v20 firstObject];

  uint64_t v22 = &OBJC_IVAR___VUIRentalManager__initialized;
  v128 = v6;
  if (v21)
  {
    v23 = self->_artworkContainer;
    double v24 = [(IKListItemLockupElement *)v6 decorationLabel];

    if (v4) {
      double v25 = 48.0;
    }
    else {
      double v25 = 40.0;
    }
    double v26 = 71.0;
    if (v4) {
      double v26 = 86.0;
    }
    if (v24) {
      double v27 = v26;
    }
    else {
      double v27 = v25;
    }
    [(NSLayoutConstraint *)self->_artworkWidthConstraint setConstant:v27];
    [(NSLayoutConstraint *)self->_artworkHeightConstraint setConstant:v25];
    v28 = [v21 placeholderURL];
    v29 = [MEMORY[0x1E4FB1818] imageForPlaceholderURL:v28];
    v30 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainer artworkView];
    [v30 setPlaceholderImage:v29];
    v31 = [v21 artworkCatalog];
    objc_msgSend(v31, "setFittingSize:", v27, v25);
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __68__VideosExtrasTableViewCell_configureForListItemLockupElement_wide___block_invoke;
    v129[3] = &unk_1E6DFCD88;
    v130 = v6;
    [v31 setDestination:self configurationBlock:v129];
    v32 = [v30 layer];
    id v33 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
    objc_msgSend(v32, "setBorderColor:", objc_msgSend(v33, "CGColor"));

    uint64_t v34 = [v30 layer];
    v35 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v35 scale];
    [v34 setBorderWidth:1.0 / v36];

    v37 = [v30 layer];
    id v38 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v37, "setShadowColor:", objc_msgSend(v38, "CGColor"));

    v39 = (UILabel *)v23;
    v40 = [v30 layer];
    [v40 setShadowRadius:2.0];

    v41 = [v30 layer];
    LODWORD(v42) = 0.5;
    [v41 setShadowOpacity:v42];

    uint64_t v22 = &OBJC_IVAR___VUIRentalManager__initialized;
  }
  else
  {
    v39 = self->_textContainerView;
    [(NSLayoutConstraint *)self->_artworkWidthConstraint setConstant:0.0];
    [(NSLayoutConstraint *)self->_artworkHeightConstraint setConstant:0.0];
  }
  leadingViewConstraint = self->_leadingViewConstraint;
  if (!leadingViewConstraint) {
    goto LABEL_33;
  }
  v44 = [(NSLayoutConstraint *)leadingViewConstraint firstItem];

  if (v44 != v39)
  {
    v45 = [(VideosExtrasTableViewCell *)self contentView];
    [v45 removeConstraint:self->_leadingViewConstraint];

    v46 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = 0;
  }
  if (!self->_leadingViewConstraint)
  {
LABEL_33:
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v48 = [(VideosExtrasTableViewCell *)self contentView];
    v49 = [v47 constraintWithItem:v39 attribute:5 relatedBy:0 toItem:v48 attribute:5 multiplier:1.0 constant:15.0];
    v50 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = v49;

    v51 = [(VideosExtrasTableViewCell *)self contentView];
    [v51 addConstraint:self->_leadingViewConstraint];
  }
  uint64_t v126 = v22[205];
  v52 = *(UILabel **)((char *)&self->super.super.super.super.isa + v126);
  if (v39 == v52 && v52)
  {
    v53 = [(VideosExtrasTableViewCell *)self contentView];
    [v53 removeConstraint:self->_textLeadingConstraint];

    textLeadingConstraint = self->_textLeadingConstraint;
    self->_textLeadingConstraint = 0;
  }
  p_titleLabel = &self->_titleLabel;
  if (v39 != self->_titleLabel && !self->_textLeadingConstraint)
  {
    uint64_t v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(Class *)((char *)&self->super.super.super.super.isa + v126) attribute:5 relatedBy:0 toItem:self->_artworkContainer attribute:6 multiplier:1.0 constant:0.0];
    v57 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = v56;

    v58 = [(VideosExtrasTableViewCell *)self contentView];
    [v58 addConstraint:self->_textLeadingConstraint];
  }
  v125 = v21;
  v123 = v39;
  [(NSLayoutConstraint *)self->_textLeadingConstraint setConstant:v9];
  v59 = *p_titleLabel;
  double v60 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v59 setBackgroundColor:v60];

  double v61 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v59 setTextColor:v61];

  uint64_t v62 = [(IKListItemLockupElement *)v128 title];
  uint64_t v63 = *MEMORY[0x1E4FB28C8];
  v64 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  if (v62) {
    [(UILabel *)v59 configureForIKTextElement:v62 fontDescriptor:v64 textStyle:v63];
  }
  v127 = (void *)v62;
  v122 = v59;
  p_subtitleLabel = &self->_subtitleLabel;
  v66 = self->_subtitleLabel;
  v67 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v66 setBackgroundColor:v67];

  uint64_t v68 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(UILabel *)v66 setTextColor:v68];

  v69 = [(IKListItemLockupElement *)v128 subtitle];
  uint64_t v70 = *MEMORY[0x1E4FB28E0];
  uint64_t v71 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0]];

  if (v69) {
    [(UILabel *)v66 configureForIKTextElement:v69 fontDescriptor:v71 textStyle:v70];
  }
  v124 = (void *)v71;
  v121 = v66;
  v72 = [v127 text];
  uint64_t v73 = [v72 length];

  v74 = [v69 text];
  uint64_t v75 = [v74 length];

  if (v73)
  {
    v76 = &self->_titleLabel;
    v77 = &self->_subtitleLabel;
    if (v75) {
      goto LABEL_56;
    }
  }
  BOOL v78 = v75 != 0;
  if (v73)
  {
    v76 = &self->_titleLabel;
    v77 = &self->_titleLabel;
    if (!v75) {
      goto LABEL_56;
    }
  }
  if (v73) {
    BOOL v78 = 1;
  }
  v76 = &self->_titleLabel;
  v77 = &self->_titleLabel;
  if (!v78 || (!v75 ? (BOOL v79 = 1) : (BOOL v79 = v73 != 0), v76 = &self->_subtitleLabel, v77 = &self->_subtitleLabel, !v79))
  {
LABEL_56:
    v81 = *v76;
    v82 = *v77;
    if (v81 != v82)
    {
      v80 = v82;
      p_topLabelConstraint = &self->_topLabelConstraint;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([(NSLayoutConstraint *)*p_topLabelConstraint firstItem],
            v84 = (UILabel *)objc_claimAutoreleasedReturnValue(),
            v84,
            v84 != v81))
      {
        v85 = [(VideosExtrasTableViewCell *)self contentView];
        [v85 removeConstraint:*p_topLabelConstraint];

        v86 = *p_topLabelConstraint;
        *p_topLabelConstraint = 0;
      }
      v87 = *p_topLabelConstraint;
      if (!v87)
      {
        v87 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:*p_titleLabel relation:0 toView:*(Class *)((char *)&self->super.super.super.super.isa + v126) attribute:3 withTextStyle:v63 multiplier:1.0 nonStandardLeading:28.0];
        objc_storeStrong((id *)&self->_topLabelConstraint, v87);
        v88 = [(VideosExtrasTableViewCell *)self contentView];
        [v88 addConstraint:v87];
      }
      if (!self->_subtitleBaselineConstraint)
      {
        v89 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:*p_subtitleLabel relation:0 toView:*p_titleLabel attribute:11 withTextStyle:v70 multiplier:1.0 nonStandardLeading:19.0];
        subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
        self->_subtitleBaselineConstraint = v89;

        v91 = [(VideosExtrasTableViewCell *)self contentView];
        [v91 addConstraint:self->_subtitleBaselineConstraint];
      }
      p_bottomLabelConstraint = &self->_bottomLabelConstraint;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v93 = [(VideosExtrasTableViewCell *)self contentView];
        [v93 removeConstraint:*p_bottomLabelConstraint];

        v94 = *p_bottomLabelConstraint;
        *p_bottomLabelConstraint = 0;
      }
      v95 = *p_bottomLabelConstraint;
      if (!v95)
      {
        v95 = [MEMORY[0x1E4F73A08] contentSizeAutoupdatingConstraintWithItem:*(Class *)((char *)&self->super.super.super.super.isa + v126) attribute:4 relatedBy:0 toItem:*p_subtitleLabel attribute:11 multiplier:v70 textStyle:1.0 defaultSizeConstant:14.0];
        objc_storeStrong((id *)&self->_bottomLabelConstraint, v95);
        v96 = [(VideosExtrasTableViewCell *)self contentView];
        [v96 addConstraint:v95];
      }
      v97 = v128;
      v99 = v122;
      v98 = v123;
      v100 = v121;
      goto LABEL_85;
    }
    v120 = v69;
    v80 = v81;
  }
  else
  {
    v120 = v69;
    v80 = 0;
  }
  v97 = v128;
  v99 = v122;
  v98 = v123;
  v100 = v121;
  if (self->_subtitleBaselineConstraint)
  {
    v101 = [(VideosExtrasTableViewCell *)self contentView];
    [v101 removeConstraint:self->_subtitleBaselineConstraint];

    v102 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;
  }
  topLabelConstraint = self->_topLabelConstraint;
  if (topLabelConstraint)
  {
    v104 = [(NSLayoutConstraint *)topLabelConstraint firstItem];
    if (v104 == v80)
    {
      int v105 = [(NSLayoutConstraint *)self->_topLabelConstraint isMemberOfClass:objc_opt_class()];

      if (!v105) {
        goto LABEL_77;
      }
    }
    else
    {
    }
    v106 = [(VideosExtrasTableViewCell *)self contentView];
    [v106 removeConstraint:self->_topLabelConstraint];

    v107 = self->_topLabelConstraint;
    self->_topLabelConstraint = 0;

LABEL_77:
    if (self->_topLabelConstraint) {
      goto LABEL_79;
    }
  }
  objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, 10, 0, *(Class *)((char *)&self->super.super.super.super.isa + v126), 10, 1.0, 0.0, v120);
  v108 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v109 = self->_topLabelConstraint;
  self->_topLabelConstraint = v108;

  v110 = [(VideosExtrasTableViewCell *)self contentView];
  [v110 addConstraint:self->_topLabelConstraint];

LABEL_79:
  bottomLabelConstraint = self->_bottomLabelConstraint;
  if (bottomLabelConstraint)
  {
    v112 = [(NSLayoutConstraint *)bottomLabelConstraint secondItem];

    if (v112 != v80)
    {
      v113 = [(VideosExtrasTableViewCell *)self contentView];
      [v113 removeConstraint:self->_bottomLabelConstraint];

      v114 = self->_bottomLabelConstraint;
      self->_bottomLabelConstraint = 0;
    }
    if (self->_bottomLabelConstraint)
    {
      v81 = v80;
      v69 = v120;
      goto LABEL_86;
    }
  }
  objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(Class *)((char *)&self->super.super.super.super.isa + v126), 4, 0, v80, 4, 1.0, 0.0, v120);
  v115 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v116 = self->_bottomLabelConstraint;
  self->_bottomLabelConstraint = v115;

  v87 = [(VideosExtrasTableViewCell *)self contentView];
  [(NSLayoutConstraint *)v87 addConstraint:self->_bottomLabelConstraint];
  v81 = v80;
  v69 = v120;
LABEL_85:

LABEL_86:
  [(VideosExtrasTableViewCell *)self setNeedsUpdateConstraints];
  v117 = [(IKListItemLockupElement *)v97 decorationImages];
  v118 = [v117 firstObject];

  if (v118)
  {
    -[VideosExtrasTableViewCell setAccessoryType:](self, "setAccessoryType:", [v118 accessoryType]);
  }
  else
  {
    v119 = [(IKListItemLockupElement *)v97 checkMark];
    if (v119) {
      [(VideosExtrasTableViewCell *)self setAccessoryType:3];
    }
  }
}

void __68__VideosExtrasTableViewCell_configureForListItemLockupElement_wide___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v10 element];
  v7 = (void *)v6;
  if (v5 && *(void *)(a1 + 32) == v6)
  {
    double v8 = [v10 artworkContainerView];
    double v9 = [v8 artworkView];
    [v9 setImage:v5];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasTableViewCell;
  [(VideosExtrasTableViewCell *)&v9 setHighlighted:a3 animated:a4];
  if (([(VideosExtrasTableViewCell *)self isSelected] & 1) == 0)
  {
    if (a3)
    {
      double v6 = 0.15;
      double v7 = 1.0;
    }
    else
    {
      double v7 = 0.0;
      double v6 = 0.0;
    }
    double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:v7 alpha:v6];
    [(VideosExtrasTableViewCell *)self setBackgroundColor:v8];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasTableViewCell;
  [(VideosExtrasTableViewCell *)&v9 setSelected:a3 animated:a4];
  if (a3)
  {
    double v6 = 0.15;
    double v7 = 1.0;
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
  }
  double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:v7 alpha:v6];
  [(VideosExtrasTableViewCell *)self setBackgroundColor:v8];
}

- (void)prepareForReuse
{
  [(UILabel *)self->_titleLabel setText:0];
  [(UILabel *)self->_subtitleLabel setText:0];
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasTableViewCell;
  [(VideosExtrasTableViewCell *)&v7 prepareForReuse];
  [(VideosExtrasTableViewCell *)self setElement:0];
  v3 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainer artworkView];
  [v3 setPlaceholderImage:0];
  [v3 setImage:0];
  BOOL v4 = [v3 layer];
  [v4 setBorderWidth:0.0];

  id v5 = [v3 layer];
  [v5 setShadowRadius:0.0];

  double v6 = [v3 layer];
  [v6 setShadowOpacity:0.0];

  [(VideosExtrasTableViewCell *)self setAccessoryType:0];
}

- (VideosExtrasConstrainedArtworkContainerView)artworkContainerView
{
  return self->_artworkContainer;
}

- (IKListItemLockupElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  self->_element = (IKListItemLockupElement *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_textTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_artworkHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textSpacerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkSpacerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingViewConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraints, 0);
  objc_storeStrong((id *)&self->_topConstraints, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_artworkContainer, 0);
}

@end