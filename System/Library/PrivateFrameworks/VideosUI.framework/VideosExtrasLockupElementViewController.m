@interface VideosExtrasLockupElementViewController
- (NSString)descriptionTextStyle;
- (VideosExtrasLockupElementViewController)initWithViewElement:(id)a3;
- (void)_configureArtworkViewForImageElement:(id)a3 overlays:(id)a4;
- (void)_configureDescriptionLabelForTextElement:(id)a3;
- (void)_configureSubtitleLabelForTextElement:(id)a3;
- (void)_configureTitleLabelForTextElement:(id)a3;
- (void)_handlePress:(id)a3;
- (void)_prepareLayout;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasLockupElementViewController

- (VideosExtrasLockupElementViewController)initWithViewElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasLockupElementViewController;
  v3 = [(VideosExtrasViewElementViewController *)&v10 initWithViewElement:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(VideosExtrasViewElementViewController *)v3 viewElement];
    v6 = [v5 title];
    v7 = [v6 text];
    v8 = [v7 string];
    [(VideosExtrasLockupElementViewController *)v4 setTitle:v8];
  }
  return v4;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)VideosExtrasLockupElementViewController;
  [(VideosExtrasViewElementViewController *)&v29 viewDidLoad];
  v3 = [(VideosExtrasLockupElementViewController *)self view];
  v4 = (VideosExtrasConstrainedArtworkContainerView *)[[VideosExtrasConstrainedArtworkContainerView alloc] initForAutolayout];
  artworkContainerView = self->_artworkContainerView;
  self->_artworkContainerView = v4;

  [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView setUserInteractionEnabled:1];
  v6 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
  [v6 setUserInteractionEnabled:1];
  [v6 setDimsWhenHighlighted:1];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handlePress_];
  [v28 setMinimumPressDuration:0.0];
  [v28 setAllowableMovement:1.79769313e308];
  [v6 addGestureRecognizer:v28];
  [v3 addSubview:self->_artworkContainerView];
  v7 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
  textContainmentView = self->_textContainmentView;
  self->_textContainmentView = v7;

  [v3 addSubview:self->_textContainmentView];
  v9 = (UILabel *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  LODWORD(v11) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v11];
  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
  [(UIView *)self->_textContainmentView addSubview:self->_titleLabel];
  v12 = (UILabel *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v12;

  LODWORD(v14) = 1148829696;
  [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v14];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
  [(UILabel *)self->_subtitleLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
  [(UIView *)self->_textContainmentView addSubview:self->_subtitleLabel];
  v15 = (UILabel *)[objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v15;

  [(UILabel *)self->_descriptionLabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
  LODWORD(v17) = 1148813312;
  [(UILabel *)self->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v17];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  [(UIView *)self->_textContainmentView addSubview:self->_descriptionLabel];
  double v18 = *MEMORY[0x1E4FB2848];
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v21 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v22 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_titleLabel, self->_textContainmentView, 10, *MEMORY[0x1E4FB2848], v19, v20, v21);
  v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleLabel attribute:4 relatedBy:-1 toItem:self->_textContainmentView attribute:4 multiplier:1.0 constant:0.0];
  v24 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_subtitleLabel, self->_textContainmentView, 10, v18, v19, v20, v21);
  v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_subtitleLabel attribute:4 relatedBy:-1 toItem:self->_textContainmentView attribute:4 multiplier:1.0 constant:0.0];
  v26 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_descriptionLabel, self->_textContainmentView, 10, v18, v19, v20, v21);
  v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_descriptionLabel attribute:4 relatedBy:-1 toItem:self->_textContainmentView attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraints:v22];
  [v3 addConstraint:v23];
  [v3 addConstraints:v24];
  [v3 addConstraint:v25];
  [v3 addConstraints:v26];
  [v3 addConstraint:v27];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VideosExtrasViewElementViewController *)self viewElement];
  v6 = [v5 title];
  [(VideosExtrasLockupElementViewController *)self _configureTitleLabelForTextElement:v6];

  v7 = [(VideosExtrasViewElementViewController *)self viewElement];
  v8 = [v7 subtitle];
  [(VideosExtrasLockupElementViewController *)self _configureSubtitleLabelForTextElement:v8];

  v9 = [(VideosExtrasViewElementViewController *)self viewElement];
  objc_super v10 = [v9 descriptionText];
  [(VideosExtrasLockupElementViewController *)self _configureDescriptionLabelForTextElement:v10];

  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasLockupElementViewController;
  [(VideosExtrasElementViewController *)&v16 viewWillAppear:v3];
  double v11 = [(VideosExtrasViewElementViewController *)self viewElement];
  v12 = [v11 image];
  v13 = [(VideosExtrasViewElementViewController *)self viewElement];
  double v14 = [v13 overlays];
  [(VideosExtrasLockupElementViewController *)self _configureArtworkViewForImageElement:v12 overlays:v14];

  v15 = [(VideosExtrasLockupElementViewController *)self view];
  [v15 bringSubviewToFront:self->_artworkContainerView];
  [v15 bringSubviewToFront:self->_textContainmentView];
  [v15 layoutBelowIfNeeded];
}

- (void)_prepareLayout
{
  v130.receiver = self;
  v130.super_class = (Class)VideosExtrasLockupElementViewController;
  [(VideosExtrasElementViewController *)&v130 _prepareLayout];
  BOOL v3 = [(VideosExtrasLockupElementViewController *)self view];
  if (![(VideosExtrasViewElementViewController *)self embedded])
  {
    v4 = [(VideosExtrasElementViewController *)self backgroundViewController];
    [v4 setVignetteType:3];
  }
  p_artworkSize = &self->_artworkSize;
  self->_artworkSize = (CGSize)*MEMORY[0x1E4F1DB30];
  v6 = [v3 safeAreaLayoutGuide];
  v7 = [v3 safeAreaLayoutGuide];
  v8 = self->_artworkContainerView;
  if (![(VideosExtrasElementViewController *)self isWide])
  {
    v128 = v6;
    v129 = v8;
    v127 = v7;
    if ([(VideosExtrasElementViewController *)self extrasSize])
    {
      if ([(VideosExtrasElementViewController *)self extrasSize] != 1)
      {
        if ([(VideosExtrasElementViewController *)self extrasSize] == 2) {
          long long v24 = xmmword_1E38FDCE0;
        }
        else {
          long long v24 = xmmword_1E38FDCD0;
        }
        CGSize *p_artworkSize = (CGSize)v24;
        double v21 = 15.0;
        double v19 = -15.0;
        double v14 = 25.0;
        double v125 = 30.0;
        double v15 = 20.0;
        double v18 = 0.0;
        uint64_t v16 = 5;
        uint64_t v126 = 6;
        uint64_t v124 = 3;
        uint64_t v13 = 1;
        double v17 = -37.0;
        double v20 = 20.0;
        double v22 = 25.0;
        goto LABEL_16;
      }
      long long v23 = xmmword_1E38FDCF0;
    }
    else
    {
      long long v23 = xmmword_1E38FDD00;
    }
    CGSize *p_artworkSize = (CGSize)v23;
    double v21 = 15.0;
    double v19 = -15.0;
    double v125 = 30.0;
    double v15 = 20.0;
    double v18 = 0.0;
    uint64_t v16 = 5;
    uint64_t v126 = 6;
    uint64_t v124 = 3;
    uint64_t v13 = 1;
    double v17 = -32.0;
    double v14 = 20.0;
    double v20 = 20.0;
    double v22 = 20.0;
    goto LABEL_16;
  }
  BOOL v9 = [(VideosExtrasViewElementViewController *)self embedded];
  double v10 = 435.0;
  if (v9) {
    double v10 = 335.0;
  }
  p_artworkSize->width = 550.0;
  self->_artworkSize.height = v10;
  double v11 = self->_artworkContainerView;

  v12 = self->_artworkContainerView;
  v128 = v11;
  v129 = 0;
  uint64_t v13 = 0;
  double v14 = 0.0;
  double v15 = 25.0;
  uint64_t v16 = 9;
  uint64_t v126 = 5;
  v127 = v12;
  double v17 = -60.0;
  double v18 = 34.0;
  uint64_t v124 = 4;
  double v125 = 40.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = 34.0;
LABEL_16:
  artworkContainerTopConstraint = self->_artworkContainerTopConstraint;
  unint64_t v26 = 0x1E4F28000;
  if (!artworkContainerTopConstraint)
  {
    v27 = (void *)MEMORY[0x1E4F28DC8];
    artworkContainerView = self->_artworkContainerView;
    [v3 safeAreaLayoutGuide];
    objc_super v29 = v3;
    v31 = uint64_t v30 = v13;
    v32 = v27;
    unint64_t v26 = 0x1E4F28000uLL;
    v33 = [v32 constraintWithItem:artworkContainerView attribute:3 relatedBy:0 toItem:v31 attribute:3 multiplier:1.0 constant:0.0];
    v34 = self->_artworkContainerTopConstraint;
    self->_artworkContainerTopConstraint = v33;

    uint64_t v13 = v30;
    BOOL v3 = v29;
    [v29 addConstraint:self->_artworkContainerTopConstraint];
    artworkContainerTopConstraint = self->_artworkContainerTopConstraint;
  }
  [(NSLayoutConstraint *)artworkContainerTopConstraint setConstant:v22];
  artworkContainerXConstraint = self->_artworkContainerXConstraint;
  if (!artworkContainerXConstraint) {
    goto LABEL_22;
  }
  if ([(NSLayoutConstraint *)artworkContainerXConstraint firstAttribute] != v16)
  {
    [v3 removeConstraint:self->_artworkContainerXConstraint];
    v36 = self->_artworkContainerXConstraint;
    self->_artworkContainerXConstraint = 0;
  }
  v37 = self->_artworkContainerXConstraint;
  if (!v37)
  {
LABEL_22:
    v38 = *(void **)(v26 + 3528);
    uint64_t v39 = v13;
    v40 = self->_artworkContainerView;
    [v3 safeAreaLayoutGuide];
    v42 = unint64_t v41 = v26;
    v43 = v40;
    uint64_t v13 = v39;
    v44 = [v38 constraintWithItem:v43 attribute:v16 relatedBy:0 toItem:v42 attribute:v16 multiplier:1.0 constant:0.0];
    v45 = self->_artworkContainerXConstraint;
    self->_artworkContainerXConstraint = v44;

    unint64_t v26 = v41;
    p_artworkSize = &self->_artworkSize;
    [v3 addConstraint:self->_artworkContainerXConstraint];
    v37 = self->_artworkContainerXConstraint;
  }
  [(NSLayoutConstraint *)v37 setConstant:v21];
  artworkContainerWidthConstraint = self->_artworkContainerWidthConstraint;
  if (!artworkContainerWidthConstraint)
  {
    v47 = [*(id *)(v26 + 3528) constraintWithItem:self->_artworkContainerView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    v48 = self->_artworkContainerWidthConstraint;
    self->_artworkContainerWidthConstraint = v47;

    [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView addConstraint:self->_artworkContainerWidthConstraint];
    artworkContainerWidthConstraint = self->_artworkContainerWidthConstraint;
  }
  [(NSLayoutConstraint *)artworkContainerWidthConstraint setConstant:p_artworkSize->width];
  artworkContainerHeightConstraint = self->_artworkContainerHeightConstraint;
  if (!artworkContainerHeightConstraint)
  {
    v50 = [*(id *)(v26 + 3528) constraintWithItem:self->_artworkContainerView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    v51 = self->_artworkContainerHeightConstraint;
    self->_artworkContainerHeightConstraint = v50;

    [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView addConstraint:self->_artworkContainerHeightConstraint];
    artworkContainerHeightConstraint = self->_artworkContainerHeightConstraint;
  }
  [(NSLayoutConstraint *)artworkContainerHeightConstraint setConstant:p_artworkSize->height];
  textLeadingConstraint = self->_textLeadingConstraint;
  if (!textLeadingConstraint) {
    goto LABEL_31;
  }
  if ([(NSLayoutConstraint *)textLeadingConstraint secondAttribute] != v126)
  {
    [v3 removeConstraint:self->_textLeadingConstraint];
    v53 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = 0;
  }
  v54 = self->_textLeadingConstraint;
  if (!v54)
  {
LABEL_31:
    v55 = [*(id *)(v26 + 3528) constraintWithItem:self->_textContainmentView attribute:5 relatedBy:0 toItem:self->_artworkContainerView attribute:v126 multiplier:1.0 constant:v20];
    v56 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = v55;

    [v3 addConstraint:self->_textLeadingConstraint];
    v54 = self->_textLeadingConstraint;
  }
  [(NSLayoutConstraint *)v54 setConstant:v20];
  textTrailingConstraint = self->_textTrailingConstraint;
  if (!textTrailingConstraint) {
    goto LABEL_36;
  }
  v58 = [(NSLayoutConstraint *)textTrailingConstraint secondItem];

  if (v58 != v128)
  {
    [v3 removeConstraint:self->_textTrailingConstraint];
    v59 = self->_textTrailingConstraint;
    self->_textTrailingConstraint = 0;
  }
  v60 = self->_textTrailingConstraint;
  if (!v60)
  {
LABEL_36:
    v61 = [*(id *)(v26 + 3528) constraintWithItem:self->_textContainmentView attribute:6 relatedBy:0 toItem:v128 attribute:6 multiplier:1.0 constant:v19];
    v62 = self->_textTrailingConstraint;
    self->_textTrailingConstraint = v61;

    [v3 addConstraint:self->_textTrailingConstraint];
    v60 = self->_textTrailingConstraint;
  }
  [(NSLayoutConstraint *)v60 setConstant:v19];
  textTopConstraint = self->_textTopConstraint;
  if (!textTopConstraint) {
    goto LABEL_42;
  }
  if ([(NSLayoutConstraint *)textTopConstraint relation] != v13
    || ([(NSLayoutConstraint *)self->_textTopConstraint secondItem],
        v64 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue(),
        v64,
        v64 != v127))
  {
    [v3 removeConstraint:self->_textTopConstraint];
    v65 = self->_textTopConstraint;
    self->_textTopConstraint = 0;
  }
  v66 = self->_textTopConstraint;
  if (!v66)
  {
LABEL_42:
    v67 = [*(id *)(v26 + 3528) constraintWithItem:self->_textContainmentView attribute:3 relatedBy:v13 toItem:v127 attribute:v124 multiplier:1.0 constant:v14];
    v68 = self->_textTopConstraint;
    self->_textTopConstraint = v67;

    [v3 addConstraint:self->_textTopConstraint];
    v66 = self->_textTopConstraint;
  }
  [(NSLayoutConstraint *)v66 setConstant:v14];
  textBottomConstraint = self->_textBottomConstraint;
  if (!textBottomConstraint)
  {
    v70 = *(void **)(v26 + 3528);
    textContainmentView = self->_textContainmentView;
    v72 = [v3 safeAreaLayoutGuide];
    v73 = [v70 constraintWithItem:textContainmentView attribute:4 relatedBy:-1 toItem:v72 attribute:4 multiplier:1.0 constant:v17];
    v74 = self->_textBottomConstraint;
    self->_textBottomConstraint = v73;

    [v3 addConstraint:self->_textBottomConstraint];
    textBottomConstraint = self->_textBottomConstraint;
  }
  [(NSLayoutConstraint *)textBottomConstraint setConstant:v17];
  textHeightConstraint = self->_textHeightConstraint;
  if (v129)
  {
    if (!textHeightConstraint) {
      goto LABEL_50;
    }
    v76 = [(NSLayoutConstraint *)self->_textHeightConstraint secondItem];

    if (v76 != v129)
    {
      [v3 removeConstraint:self->_textHeightConstraint];
      v77 = self->_textHeightConstraint;
      self->_textHeightConstraint = 0;
    }
    if (!self->_textHeightConstraint)
    {
LABEL_50:
      v78 = [*(id *)(v26 + 3528) constraintWithItem:self->_textContainmentView attribute:8 relatedBy:-1 toItem:v129 attribute:8 multiplier:1.0 constant:0.0];
      v79 = self->_textHeightConstraint;
      self->_textHeightConstraint = v78;

      [v3 addConstraint:self->_textHeightConstraint];
    }
    textCenterYConstraint = self->_textCenterYConstraint;
    if (!textCenterYConstraint) {
      goto LABEL_55;
    }
    v81 = [(NSLayoutConstraint *)textCenterYConstraint secondItem];

    if (v81 != v129)
    {
      [v3 removeConstraint:self->_textCenterYConstraint];
      v82 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = 0;
    }
    if (!self->_textCenterYConstraint)
    {
LABEL_55:
      v83 = [*(id *)(v26 + 3528) constraintWithItem:self->_textContainmentView attribute:10 relatedBy:0 toItem:v129 attribute:10 multiplier:1.0 constant:0.0];
      v84 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = v83;

      [v3 addConstraint:self->_textCenterYConstraint];
    }
  }
  else
  {
    if (textHeightConstraint)
    {
      objc_msgSend(v3, "removeConstraint:");
      v85 = self->_textHeightConstraint;
      self->_textHeightConstraint = 0;
    }
    if (self->_textCenterYConstraint)
    {
      objc_msgSend(v3, "removeConstraint:");
      v86 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = 0;
    }
  }
  p_titleVerticalConstraint = &self->_titleVerticalConstraint;
  titleVerticalConstraint = self->_titleVerticalConstraint;
  if (v18 == 0.0)
  {
    if (([(NSLayoutConstraint *)titleVerticalConstraint isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      [v3 removeConstraint:*p_titleVerticalConstraint];
      v89 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = 0;
    }
    v90 = *p_titleVerticalConstraint;
    if (!*p_titleVerticalConstraint)
    {
      uint64_t v91 = [*(id *)(v26 + 3528) constraintWithItem:self->_titleLabel attribute:3 relatedBy:1 toItem:self->_textContainmentView attribute:3 multiplier:1.0 constant:0.0];
      v92 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = (NSLayoutConstraint *)v91;

      [v3 addConstraint:*p_titleVerticalConstraint];
      v90 = *p_titleVerticalConstraint;
    }
    [(NSLayoutConstraint *)v90 setConstant:v18];
  }
  else
  {
    if (([(NSLayoutConstraint *)titleVerticalConstraint isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      [v3 removeConstraint:*p_titleVerticalConstraint];
      v93 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = 0;
    }
    v94 = *p_titleVerticalConstraint;
    if (!*p_titleVerticalConstraint)
    {
      v95 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:self->_titleLabel toView:self->_textContainmentView attribute:3 withTextStyle:*MEMORY[0x1E4FB2908] nonStandardLeading:v18];

      objc_storeStrong((id *)&self->_titleVerticalConstraint, v95);
      [v3 addConstraint:*p_titleVerticalConstraint];
      v94 = v95;
    }
    [(NSLayoutConstraint *)v94 setDefaultSizeConstant:v18];
  }
  p_titleLabel = (id *)&self->_titleLabel;
  v97 = [(UILabel *)self->_titleLabel text];
  uint64_t v98 = [v97 length];

  if (v98)
  {
    uint64_t v99 = 11;
    p_textContainmentView = (id *)&self->_titleLabel;
  }
  else
  {
    p_textContainmentView = (id *)&self->_textContainmentView;
    uint64_t v99 = 3;
  }
  id v101 = *p_textContainmentView;
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    id v103 = [(MPUContentSizeLayoutConstraint *)subtitleBaselineConstraint secondItem];
    if (v103 == v101)
    {
      uint64_t v104 = [(MPUContentSizeLayoutConstraint *)self->_subtitleBaselineConstraint secondAttribute];

      if (v104 == v99) {
        goto LABEL_79;
      }
    }
    else
    {
    }
    [v3 removeConstraint:self->_subtitleBaselineConstraint];
    v105 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_79:
    v106 = self->_subtitleBaselineConstraint;
    if (v106) {
      goto LABEL_81;
    }
  }
  v107 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:self->_subtitleLabel toView:v101 attribute:v99 withTextStyle:*MEMORY[0x1E4FB2950] nonStandardLeading:v15];
  v108 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v107;

  [v3 addConstraint:self->_subtitleBaselineConstraint];
  v106 = self->_subtitleBaselineConstraint;
LABEL_81:
  [(MPUContentSizeLayoutConstraint *)v106 setDefaultSizeConstant:v15];
  v109 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v110 = [v109 length];

  if (v110)
  {
    uint64_t v111 = 11;
    p_titleLabel = (id *)&self->_subtitleLabel;
  }
  else
  {
    v112 = [*p_titleLabel text];
    uint64_t v113 = [v112 length];

    if (v113)
    {
      uint64_t v111 = 11;
    }
    else
    {
      p_titleLabel = (id *)&self->_textContainmentView;
      uint64_t v111 = 3;
    }
  }
  id v114 = *p_titleLabel;
  v115 = [(VideosExtrasLockupElementViewController *)self descriptionTextStyle];
  descriptionBaselineConstraint = self->_descriptionBaselineConstraint;
  if (!descriptionBaselineConstraint) {
    goto LABEL_94;
  }
  id v117 = [(MPUContentSizeLayoutConstraint *)descriptionBaselineConstraint secondItem];
  if (v117 != v114
    || [(MPUContentSizeLayoutConstraint *)self->_descriptionBaselineConstraint secondAttribute] != v111)
  {

    goto LABEL_92;
  }
  v118 = [(MPUContentSizeLayoutConstraint *)self->_descriptionBaselineConstraint textStyle];
  char v119 = [v118 isEqualToString:v115];

  if ((v119 & 1) == 0)
  {
LABEL_92:
    [v3 removeConstraint:self->_descriptionBaselineConstraint];
    v120 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = 0;
  }
  v121 = self->_descriptionBaselineConstraint;
  if (!v121)
  {
LABEL_94:
    v122 = [MEMORY[0x1E4F73A08] constraintWithAutoupdatingBaselineOfView:self->_descriptionLabel toView:v114 attribute:v111 withTextStyle:v115 nonStandardLeading:v125];
    v123 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = v122;

    [v3 addConstraint:self->_descriptionBaselineConstraint];
    v121 = self->_descriptionBaselineConstraint;
  }
  [(MPUContentSizeLayoutConstraint *)v121 setDefaultSizeConstant:v125];
}

- (void)_configureArtworkViewForImageElement:(id)a3 overlays:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
    BOOL v9 = [v8 layer];
    double v10 = [v6 borderColor];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:1.0];
    }
    uint64_t v13 = v12;

    id v33 = v13;
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v33, "CGColor"));
    double v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];
    v34 = v9;
    [v9 setBorderWidth:1.0 / v15];

    v32 = [v6 placeholderURL];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1818], "imageForPlaceholderURL:");
    [v8 setPlaceholderImage:v16];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = v7;
    double v17 = [v7 children];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [v22 resourceImage];
            if (v23)
            {
              long long v24 = (void *)v23;
              [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView setOverlayImage:v23];
              [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView setOverlayScale:0.2];

              goto LABEL_16;
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    v25 = [v6 artworkCatalog];
    unint64_t v26 = [(VideosExtrasLockupElementViewController *)self view];
    v27 = [v26 window];
    v28 = [v27 screen];
    [v28 scale];
    double v30 = v29;

    objc_msgSend(v25, "setFittingSize:", self->_artworkSize.width, self->_artworkSize.height);
    if (v30 == 0.0)
    {
      v31 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v31 scale];
      objc_msgSend(v25, "setDestinationScale:");
    }
    else
    {
      [v25 setDestinationScale:v30];
    }
    [v25 setDestination:self->_artworkContainerView configurationBlock:&__block_literal_global_62];

    id v7 = v35;
  }
}

void __89__VideosExtrasLockupElementViewController__configureArtworkViewForImageElement_overlays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 artworkView];
  [v5 setImage:v4];
}

- (void)_configureTitleLabelForTextElement:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4FB08E8];
    uint64_t v5 = *MEMORY[0x1E4FB2908];
    id v6 = a3;
    id v8 = [v4 preferredFontDescriptorWithTextStyle:v5];
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_titleLabel setTextColor:v7];

    [(UILabel *)self->_titleLabel configureForIKTextElement:v6 fontDescriptor:v8 textStyle:v5];
  }
}

- (void)_configureSubtitleLabelForTextElement:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4FB08E8];
    uint64_t v5 = *MEMORY[0x1E4FB2950];
    id v6 = a3;
    id v8 = [v4 preferredFontDescriptorWithTextStyle:v5];
    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
    [(UILabel *)self->_subtitleLabel setTextColor:v7];

    [(UILabel *)self->_subtitleLabel configureForIKTextElement:v6 fontDescriptor:v8 textStyle:v5];
  }
}

- (void)_configureDescriptionLabelForTextElement:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4FB08E8];
    id v5 = a3;
    id v6 = [(VideosExtrasLockupElementViewController *)self descriptionTextStyle];
    id v10 = [v4 preferredFontDescriptorWithTextStyle:v6];

    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
    [(UILabel *)self->_descriptionLabel setTextColor:v7];

    descriptionLabel = self->_descriptionLabel;
    BOOL v9 = [(VideosExtrasLockupElementViewController *)self descriptionTextStyle];
    [(UILabel *)descriptionLabel configureForIKTextElement:v5 fontDescriptor:v10 textStyle:v9];
  }
}

- (NSString)descriptionTextStyle
{
  unint64_t v2 = [(VideosExtrasElementViewController *)self extrasSize];
  id v3 = (id)*MEMORY[0x1E4FB28D8];
  if (v2 - 3 <= 1)
  {
    id v4 = (id)*MEMORY[0x1E4FB28F0];

    id v3 = v4;
  }
  return (NSString *)v3;
}

- (void)_handlePress:(id)a3
{
  id v24 = a3;
  id v4 = [(VideosExtrasViewElementViewController *)self viewElement];
  char v5 = [v4 isDisabled];

  id v6 = v24;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [v24 state];
    id v8 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v24 locationInView:v8];
    v26.x = v17;
    v26.y = v18;
    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    BOOL v19 = CGRectContainsPoint(v27, v26);
    uint64_t v20 = v19;
    switch(v7)
    {
      case 1:
        double v21 = v8;
        uint64_t v20 = 1;
        goto LABEL_8;
      case 2:
        double v21 = v8;
LABEL_8:
        [v21 setHighlighted:v20 animated:1];
        break;
      case 3:
        if (v19)
        {
          double v22 = [(VideosExtrasViewElementViewController *)self viewElement];
          [v22 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
        }
        goto LABEL_6;
      case 4:
LABEL_6:
        uint64_t v23 = [(VideosExtrasConstrainedArtworkContainerView *)self->_artworkContainerView artworkView];
        [v23 setHighlighted:0 animated:1];

        break;
      default:
        break;
    }

    id v6 = v24;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_textBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_textHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textTopConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerXConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainmentView, 0);
  objc_storeStrong((id *)&self->_artworkContainerView, 0);
}

@end