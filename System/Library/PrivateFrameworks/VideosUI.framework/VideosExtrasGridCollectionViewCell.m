@interface VideosExtrasGridCollectionViewCell
- (IKLockupElement)lockupElement;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (VideosExtrasConstrainedArtworkContainerView)artworkContainer;
- (VideosExtrasGridCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureForLockup:(id)a3 cellStyle:(id)a4;
- (void)configureForLockup:(id)a3 cellStyle:(id)a4 withSizing:(BOOL)a5;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setLockupElement:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VideosExtrasGridCollectionViewCell

- (VideosExtrasGridCollectionViewCell)initWithFrame:(CGRect)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)VideosExtrasGridCollectionViewCell;
  v3 = -[VideosExtrasGridCollectionViewCell initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(VideosExtrasGridCollectionViewCell *)v3 setBackgroundColor:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v6];

    [v5 setTextAlignment:1];
    LODWORD(v7) = 1144750080;
    [v5 setContentHuggingPriority:1 forAxis:v7];
    v8 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v8 addSubview:v5];

    [(VideosExtrasGridCollectionViewCell *)v3 setTitleLabel:v5];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    objc_msgSend(v9, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    [v9 setTextAlignment:1];
    LODWORD(v11) = 1144733696;
    [v9 setContentHuggingPriority:1 forAxis:v11];
    v12 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v12 addSubview:v9];

    [(VideosExtrasGridCollectionViewCell *)v3 setSubtitleLabel:v9];
    uint64_t v13 = [[VideosExtrasConstrainedArtworkContainerView alloc] initForAutolayout];
    artworkContainer = v3->_artworkContainer;
    v3->_artworkContainer = (VideosExtrasConstrainedArtworkContainerView *)v13;

    [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainer setClipsToBounds:1];
    [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainer setShouldBottomAlignArtwork:1];
    uint64_t v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainer attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    artworkContainerWidthConstraint = v3->_artworkContainerWidthConstraint;
    v3->_artworkContainerWidthConstraint = (NSLayoutConstraint *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_artworkContainer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    artworkContainerHeightConstraint = v3->_artworkContainerHeightConstraint;
    v3->_artworkContainerHeightConstraint = (NSLayoutConstraint *)v17;

    v19 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v19 addSubview:v3->_artworkContainer];

    v20 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    v51[0] = v3->_artworkContainerWidthConstraint;
    v51[1] = v3->_artworkContainerHeightConstraint;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [v20 addConstraints:v21];

    v22 = [(VideosExtrasConstrainedArtworkContainerView *)v3->_artworkContainer artworkView];
    [v22 setDimsWhenHighlighted:1];
    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [v22 setBackgroundColor:v23];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    double v26 = *MEMORY[0x1E4FB2848];
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v30 = objc_msgSend(v24, "constraintsByAttachingView:toView:alongEdges:insets:", v5, v25, 10, *MEMORY[0x1E4FB2848], v27, v28, v29);

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    v33 = objc_msgSend(v31, "constraintsByAttachingView:toView:alongEdges:insets:", v9, v32, 10, v26, v27, v28, v29);

    v34 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v34 addConstraints:v30];

    v35 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v35 addConstraints:v33];

    v36 = (void *)MEMORY[0x1E4F28DC8];
    v37 = v3->_artworkContainer;
    v38 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    v39 = objc_msgSend(v36, "constraintsByAttachingView:toView:alongEdges:insets:", v37, v38, 11, v26, v27, v28, v29);

    v40 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v40 addConstraints:v39];

    uint64_t v41 = [objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    spacerView = v3->_spacerView;
    v3->_spacerView = (UIView *)v41;

    v43 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v43 addSubview:v3->_spacerView];

    v44 = (void *)MEMORY[0x1E4F28DC8];
    v45 = v3->_spacerView;
    v46 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    v47 = [v44 constraintWithItem:v45 attribute:4 relatedBy:0 toItem:v46 attribute:4 multiplier:1.0 constant:0.0];

    v48 = [(VideosExtrasGridCollectionViewCell *)v3 contentView];
    [v48 addConstraint:v47];
  }
  return v3;
}

- (void)configureForLockup:(id)a3 cellStyle:(id)a4 withSizing:(BOOL)a5
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(VideosExtrasGridCollectionViewCell *)self setLockupElement:v7];
  v9 = [v7 title];
  v143 = v7;
  v10 = [v7 subtitle];
  v142 = v9;
  double v11 = [v9 text];
  uint64_t v12 = [v11 length];

  v141 = v10;
  uint64_t v13 = [v10 text];
  uint64_t v14 = [v13 length];

  if (v12)
  {
    uint64_t v15 = [v8 titleTextColor];
    v16 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
    [v16 setTextColor:v15];

    uint64_t v17 = (void *)MEMORY[0x1E4FB08E8];
    v18 = [v8 titleDefaultFontAttributes];
    v19 = [v17 fontDescriptorWithFontAttributes:v18];

    uint64_t v20 = [v142 alignment];
    v21 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
    v22 = [v8 titleTextStyle];
    [v21 configureForIKTextElement:v142 fontDescriptor:v19 textStyle:v22];

    v23 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
    uint64_t v24 = [v23 numberOfLines];

    if (v24 >= 3)
    {
      v25 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
      [v25 setNumberOfLines:2];
    }
    if (!v20)
    {
      uint64_t v26 = [v8 defaultTextAlignment];
      double v27 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
      [v27 setTextAlignment:v26];
    }
  }
  if (v14)
  {
    double v28 = [v8 subtitleTextColor];
    double v29 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
    [v29 setTextColor:v28];

    v30 = (void *)MEMORY[0x1E4FB08E8];
    v31 = [v8 subtitleDefaultFontAttributes];
    v32 = [v30 fontDescriptorWithFontAttributes:v31];

    uint64_t v33 = [v10 alignment];
    v34 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
    v35 = [v8 subtitleTextStyle];
    [v34 configureForIKTextElement:v10 fontDescriptor:v32 textStyle:v35];

    v36 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
    uint64_t v37 = [v36 numberOfLines];

    if (v37 >= 3)
    {
      v38 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
      [v38 setNumberOfLines:2];
    }
    if (!v33)
    {
      uint64_t v39 = [v8 defaultTextAlignment];
      v40 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
      [v40 setTextAlignment:v39];
    }
  }
  [v8 imageSize];
  double v42 = v41;
  double v44 = v43;
  -[NSLayoutConstraint setConstant:](self->_artworkContainerWidthConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_artworkContainerHeightConstraint setConstant:v44];
  v45 = [v143 image];
  if (v45 && !a5)
  {
    [v143 overlays];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    v137 = long long v151 = 0u;
    v46 = [v137 children];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v148 objects:v152 count:16];
    uint64_t v140 = v12;
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v149;
LABEL_17:
      uint64_t v50 = 0;
      while (1)
      {
        if (*(void *)v149 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v148 + 1) + 8 * v50);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v48 == ++v50)
        {
          uint64_t v48 = [v46 countByEnumeratingWithState:&v148 objects:v152 count:16];
          if (v48) {
            goto LABEL_17;
          }
          goto LABEL_26;
        }
      }
      uint64_t v52 = [v51 resourceImage];

      if (!v52) {
        goto LABEL_27;
      }
      v53 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
      [v53 setOverlayImage:v52];

      v54 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
      [v54 setOverlayScale:0.3];

      v46 = (void *)v52;
    }
LABEL_26:

LABEL_27:
    v55 = [v45 placeholderURL];
    v56 = [MEMORY[0x1E4FB1818] imageForPlaceholderURL:v55];
    v57 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
    v58 = [v57 artworkView];
    [v58 setPlaceholderImage:v56];

    v59 = [v45 borderColor];
    v60 = v59;
    v61 = v45;
    if (v59)
    {
      id v62 = v59;
    }
    else
    {
      id v62 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
    }
    v63 = v62;

    v64 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
    v65 = [v64 layer];
    id v66 = v63;
    objc_msgSend(v65, "setBorderColor:", objc_msgSend(v66, "CGColor"));

    v67 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
    v68 = [v67 layer];
    v69 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v69 scale];
    [v68 setBorderWidth:1.0 / v70];

    v45 = v61;
    v71 = [v61 artworkCatalog];
    objc_msgSend(v71, "setFittingSize:", v42, v44);
    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = __78__VideosExtrasGridCollectionViewCell_configureForLockup_cellStyle_withSizing___block_invoke;
    v144[3] = &unk_1E6DFA698;
    id v145 = v143;
    v146 = self;
    id v147 = v66;
    id v72 = v66;
    [v71 setDestination:self configurationBlock:v144];

    uint64_t v12 = v140;
  }
  BOOL v73 = v14 != 0;
  if (!(v12 | v14))
  {
    if (self->_topLineHeight)
    {
      v74 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v74 removeConstraint:self->_topLineHeight];

      topLineHeight = self->_topLineHeight;
      self->_topLineHeight = 0;
    }
    if (self->_subtitleLineHeight)
    {
      v76 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v76 removeConstraint:self->_subtitleLineHeight];

      subtitleLineHeight = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;
    }
    spacerTop = self->_spacerTop;
    if (!spacerTop) {
      goto LABEL_51;
    }
    v79 = [(NSLayoutConstraint *)spacerTop secondItem];
    artworkContainer = self->_artworkContainer;

    if (v79 != artworkContainer)
    {
      v81 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v81 removeConstraint:self->_spacerTop];

      v82 = self->_spacerTop;
      self->_spacerTop = 0;
    }
    if (!self->_spacerTop)
    {
LABEL_51:
      v90 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spacerView attribute:3 relatedBy:0 toItem:self->_artworkContainer attribute:4 multiplier:1.0 constant:0.0];
      v91 = self->_spacerTop;
      self->_spacerTop = v90;

      v92 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v92 addConstraint:self->_spacerTop];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v93 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v93 removeConstraint:self->_spacerHeight];

      spacerHeight = self->_spacerHeight;
      self->_spacerHeight = 0;
    }
    v95 = self->_spacerHeight;
    if (!v95)
    {
      v96 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spacerView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      v97 = self->_spacerHeight;
      self->_spacerHeight = v96;

      v98 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v98 addConstraint:self->_spacerHeight];

      v95 = self->_spacerHeight;
    }
    [(NSLayoutConstraint *)v95 setConstant:10.0];
    goto LABEL_83;
  }
  v138 = v45;
  if (!v12 || !v14)
  {
    if (!v12) {
      BOOL v73 = 1;
    }
    if (!v73)
    {
      v85 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
      uint64_t v14 = [v8 titleTextStyle];
      v87 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
      uint64_t v88 = [v8 titleTextStyle];
      goto LABEL_58;
    }
    if (v12)
    {
      v85 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      if (v14)
      {
        v85 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
        uint64_t v86 = [v8 subtitleTextStyle];
        goto LABEL_44;
      }
      v85 = 0;
    }
    v87 = 0;
    v89 = 0;
    goto LABEL_59;
  }
  v83 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
  [v83 setNumberOfLines:1];

  v84 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
  [v84 setNumberOfLines:1];

  v85 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
  uint64_t v86 = [v8 titleTextStyle];
LABEL_44:
  uint64_t v14 = v86;
  v87 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
  uint64_t v88 = [v8 subtitleTextStyle];
LABEL_58:
  v89 = (void *)v88;
LABEL_59:
  v99 = self->_topLineHeight;
  if (!v99) {
    goto LABEL_63;
  }
  v100 = [(MPUContentSizeLayoutConstraint *)v99 firstItem];

  if (v100 != v85)
  {
    v101 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v101 removeConstraint:self->_topLineHeight];

    v102 = self->_topLineHeight;
    self->_topLineHeight = 0;
  }
  v103 = self->_topLineHeight;
  if (!v103)
  {
LABEL_63:
    v104 = (void *)MEMORY[0x1E4F73A08];
    v105 = self->_artworkContainer;
    [v8 titleFirstBaselineHeight];
    v107 = [v104 constraintWithAutoupdatingBaselineOfView:v85 relation:0 toView:v105 attribute:4 withTextStyle:v14 multiplier:1.0 nonStandardLeading:v106];
    v108 = self->_topLineHeight;
    self->_topLineHeight = v107;

    v109 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v109 addConstraint:self->_topLineHeight];

    v103 = self->_topLineHeight;
  }
  [(MPUContentSizeLayoutConstraint *)v103 setTextStyle:v14];
  [v8 titleFirstBaselineHeight];
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_topLineHeight, "setDefaultSizeConstant:");
  v110 = self->_subtitleLineHeight;
  if (v85 == v87)
  {
    if (v110)
    {
      v120 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v120 removeConstraint:self->_subtitleLineHeight];

      v121 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;
    }
  }
  else
  {
    if (!v110) {
      goto LABEL_69;
    }
    v111 = [(MPUContentSizeLayoutConstraint *)v110 firstItem];

    if (v111 != v87)
    {
      v112 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v112 removeConstraint:self->_subtitleLineHeight];

      v113 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;
    }
    v114 = self->_subtitleLineHeight;
    if (!v114)
    {
LABEL_69:
      v115 = (void *)MEMORY[0x1E4F73A08];
      [v8 subtitleFirstBaselineHeight];
      v117 = [v115 constraintWithAutoupdatingBaselineOfView:v87 relation:0 toView:v85 attribute:11 withTextStyle:v89 multiplier:1.0 nonStandardLeading:v116];
      v118 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = v117;

      v119 = [(VideosExtrasGridCollectionViewCell *)self contentView];
      [v119 addConstraint:self->_subtitleLineHeight];

      v114 = self->_subtitleLineHeight;
    }
    [(MPUContentSizeLayoutConstraint *)v114 setTextStyle:v89];
    [v8 subtitleFirstBaselineHeight];
    -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_subtitleLineHeight, "setDefaultSizeConstant:");
  }
  p_spacerHeight = &self->_spacerHeight;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v123 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v123 removeConstraint:*p_spacerHeight];

    v124 = *p_spacerHeight;
    *p_spacerHeight = 0;
  }
  v125 = *p_spacerHeight;
  if (!v125)
  {
    v126 = (void *)MEMORY[0x1E4F73A08];
    spacerView = self->_spacerView;
    [v8 textFirstBaselineToBottom];
    v125 = [v126 contentSizeAutoupdatingConstraintWithItem:spacerView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:v14 textStyle:1.0 defaultSizeConstant:v128];
    objc_storeStrong((id *)&self->_spacerHeight, v125);
    v129 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v129 addConstraint:*p_spacerHeight];
  }
  [(NSLayoutConstraint *)v125 setTextStyle:v14];
  [v8 textFirstBaselineToBottom];
  -[NSLayoutConstraint setDefaultSizeConstant:](v125, "setDefaultSizeConstant:");
  v130 = self->_spacerTop;
  if (!v130) {
    goto LABEL_81;
  }
  v131 = [(NSLayoutConstraint *)v130 secondItem];

  if (v131 != v85)
  {
    v132 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v132 removeConstraint:self->_spacerTop];

    v133 = self->_spacerTop;
    self->_spacerTop = 0;
  }
  if (!self->_spacerTop)
  {
LABEL_81:
    v134 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spacerView attribute:3 relatedBy:0 toItem:v85 attribute:12 multiplier:1.0 constant:0.0];
    v135 = self->_spacerTop;
    self->_spacerTop = v134;

    v136 = [(VideosExtrasGridCollectionViewCell *)self contentView];
    [v136 addConstraint:self->_spacerTop];
  }
  v45 = v138;
LABEL_83:
}

void __78__VideosExtrasGridCollectionViewCell_configureForLockup_cellStyle_withSizing___block_invoke(void **a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  v6 = [v19 lockupElement];
  if (a1[4] == v6)
  {
    id v7 = [v19 artworkContainer];
    id v8 = [v7 artworkView];
    [v8 setImage:v5];

    v9 = [a1[5] artworkContainer];
    v10 = [v9 artworkView];
    double v11 = [v10 layer];
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(a1[6], "CGColor"));

    uint64_t v12 = [a1[5] artworkContainer];
    uint64_t v13 = [v12 artworkView];
    uint64_t v14 = [v13 layer];
    uint64_t v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
    [v14 setBorderWidth:1.0 / v16];

    uint64_t v17 = [a1[5] artworkContainer];
    v18 = [v17 layer];
    [v18 setBorderWidth:0.0];
  }
}

- (void)configureForLockup:(id)a3 cellStyle:(id)a4
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasGridCollectionViewCell;
  -[VideosExtrasGridCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  id v5 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainer artworkView];
  [v5 setHighlighted:v3];
}

- (void)prepareForReuse
{
  v17.receiver = self;
  v17.super_class = (Class)VideosExtrasGridCollectionViewCell;
  [(VideosExtrasGridCollectionViewCell *)&v17 prepareForReuse];
  BOOL v3 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
  v4 = [v3 layer];
  [v4 setBorderWidth:0.0];

  id v5 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
  objc_super v6 = [v5 artworkView];
  id v7 = [v6 layer];
  [v7 setBorderWidth:0.0];

  id v8 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
  v9 = [v8 artworkView];
  [v9 setPlaceholderImage:0];

  v10 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
  double v11 = [v10 artworkView];
  [v11 setImage:0];

  uint64_t v12 = [(VideosExtrasGridCollectionViewCell *)self artworkContainer];
  [v12 setOverlayImage:0];

  uint64_t v13 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
  [v13 setText:0];

  uint64_t v14 = [(VideosExtrasGridCollectionViewCell *)self titleLabel];
  [v14 setAttributedText:0];

  uint64_t v15 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
  [v15 setText:0];

  double v16 = [(VideosExtrasGridCollectionViewCell *)self subtitleLabel];
  [v16 setAttributedText:0];
}

- (IKLockupElement)lockupElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockupElement);
  return (IKLockupElement *)WeakRetained;
}

- (void)setLockupElement:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (VideosExtrasConstrainedArtworkContainerView)artworkContainer
{
  return self->_artworkContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkContainer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_lockupElement);
  objc_storeStrong((id *)&self->_spacerTop, 0);
  objc_storeStrong((id *)&self->_spacerHeight, 0);
  objc_storeStrong((id *)&self->_subtitleLineHeight, 0);
  objc_storeStrong((id *)&self->_topLineHeight, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_spacerView, 0);
}

@end