@interface VTUIProximityTryAgainView
- (NSArray)viewConstraints;
- (UIButton)dismissButton;
- (UILabel)titleLabel;
- (VTPreferences)vtPrefs;
- (VTUIProximityContainerView)containerView;
- (VTUIProximityTryAgainView)initWithFrame:(CGRect)a3;
- (VTUIStyle)vtStyle;
- (void)_setupConstraintsToSize:(CGSize)a3;
- (void)_setupViews;
- (void)setContainerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewConstraints:(id)a3;
- (void)setVtPrefs:(id)a3;
- (void)setVtStyle:(id)a3;
@end

@implementation VTUIProximityTryAgainView

- (VTUIProximityTryAgainView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityTryAgainView;
  v5 = -[VTUIProximityTryAgainView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = +[VTUIStyle sharedStyle];
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    uint64_t v8 = [MEMORY[0x263F85AF0] sharedPreferences];
    vtPrefs = v5->_vtPrefs;
    v5->_vtPrefs = (VTPreferences *)v8;

    [(VTUIProximityTryAgainView *)v5 _setupViews];
    -[VTUIProximityTryAgainView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupViews
{
  v3 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v3;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityTryAgainView *)self addSubview:self->_containerView];
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = self->_titleLabel;
  uint64_t v8 = [(VTUIStyle *)self->_vtStyle proxHeaderFont];
  [(UILabel *)v7 setFont:v8];

  v9 = self->_titleLabel;
  v10 = [(VTUIStyle *)self->_vtStyle proxHeaderColor];
  [(UILabel *)v9 setTextColor:v10];

  [(UILabel *)self->_titleLabel setNumberOfLines:3];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  objc_super v11 = self->_titleLabel;
  v12 = +[VTUIStringsHelper sharedStringsHelper];
  v13 = [v12 uiLocalizedStringForKey:@"TRY_AGAIN_MESSAGE"];
  [(UILabel *)v11 setText:v13];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_titleLabel];
  v14 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v14;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = self->_containerView;
  v17 = self->_dismissButton;
  [(VTUIProximityContainerView *)v16 addSubview:v17];
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v91[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(VTUIProximityTryAgainView *)self safeAreaLayoutGuide];
  v84 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  BOOL v7 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  v9 = +[MGWrapper sharedMGWrapper];
  char v10 = [v9 isDeviceIPad];

  containerView = self->_containerView;
  v85 = v8;
  v82 = v6;
  BOOL v79 = v7;
  if (v10)
  {
    v75 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    v73 = [v6 centerYAnchor];
    v12 = [v75 constraintEqualToAnchor:v73];
    v91[0] = v12;
    v13 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    v14 = [v6 centerXAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v91[1] = v15;
    [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    v17 = v16 = v8;
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidth];
    v18 = objc_msgSend(v17, "constraintEqualToConstant:");
    v91[2] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:3];
    [v16 addObjectsFromArray:v19];

    BOOL v20 = v79;
    if (!v79) {
      goto LABEL_8;
    }
LABEL_6:
    [(VTUIStyle *)self->_vtStyle proxViewHeightPhoneLandscape];
    goto LABEL_9;
  }
  v21 = [(VTUIProximityContainerView *)containerView bottomAnchor];
  v22 = [(VTUIProximityTryAgainView *)self bottomAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v24 = [v21 constraintEqualToAnchor:v22 constant:-v23];
  v90 = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
  [v8 addObjectsFromArray:v25];

  v26 = self->_containerView;
  if (v7)
  {
    v27 = [(VTUIProximityContainerView *)v26 centerXAnchor];
    v28 = [v6 centerXAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v89[0] = v29;
    v30 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [(VTUIStyle *)self->_vtStyle proxViewMaxWidthPhoneLandscape];
    v31 = objc_msgSend(v30, "constraintEqualToConstant:");
    v89[1] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
    [v8 addObjectsFromArray:v32];

    BOOL v20 = v79;
    goto LABEL_6;
  }
  v76 = [(VTUIProximityContainerView *)v26 leadingAnchor];
  v34 = [v6 leadingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v35 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", v34);
  v88[0] = v35;
  v36 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
  v37 = [v6 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxContainerHorizontalVerticalPadding];
  v39 = [v36 constraintEqualToAnchor:v37 constant:-v38];
  v88[1] = v39;
  uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];
  v41 = v8;
  v42 = (void *)v40;
  [v41 addObjectsFromArray:v40];

  BOOL v20 = v79;
LABEL_8:
  [(VTUIStyle *)self->_vtStyle proxViewHeight];
LABEL_9:
  double v43 = v33;
  v44 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
  uint64_t v45 = [v44 constraintEqualToConstant:v43];

  v83 = (void *)v45;
  [v85 addObject:v45];
  vtStyle = self->_vtStyle;
  if (v20)
  {
    [(VTUIStyle *)vtStyle proxLeadingLandscape];
    double v48 = v47;
    [(VTUIStyle *)self->_vtStyle proxTrailingLandscape];
    double v50 = v49;
    [(VTUIStyle *)self->_vtStyle proxPaddingTryAgainTitleLandscape];
  }
  else
  {
    [(VTUIStyle *)vtStyle proxLeading];
    double v48 = v52;
    [(VTUIStyle *)self->_vtStyle proxTrailing];
    double v50 = v53;
    [(VTUIStyle *)self->_vtStyle orbLength];
  }
  double v54 = v51;
  v80 = [(UILabel *)self->_titleLabel topAnchor];
  v77 = [v84 topAnchor];
  v55 = [v80 constraintEqualToAnchor:v77 constant:v54];
  v87[0] = v55;
  v56 = [(UILabel *)self->_titleLabel leadingAnchor];
  v57 = [v84 leadingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57 constant:v48];
  v87[1] = v58;
  v59 = [(UILabel *)self->_titleLabel trailingAnchor];
  v60 = [v84 trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60 constant:-v50];
  v87[2] = v61;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:3];
  [v85 addObjectsFromArray:v62];

  v81 = [(UIButton *)self->_dismissButton centerYAnchor];
  v78 = [v84 topAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonVerticalPaddingTop];
  v74 = objc_msgSend(v81, "constraintEqualToAnchor:constant:", v78);
  v86[0] = v74;
  v63 = [(UIButton *)self->_dismissButton centerXAnchor];
  v64 = [v84 trailingAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonHorizontalPadding];
  v65 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64);
  v86[1] = v65;
  v66 = [(UIButton *)self->_dismissButton widthAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v67 = objc_msgSend(v66, "constraintEqualToConstant:");
  v86[2] = v67;
  v68 = [(UIButton *)self->_dismissButton heightAnchor];
  [(VTUIStyle *)self->_vtStyle proxTrainingDismissButtonWidthOrHeight];
  v69 = objc_msgSend(v68, "constraintEqualToConstant:");
  v86[3] = v69;
  v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:4];
  [v85 addObjectsFromArray:v70];

  [MEMORY[0x263F08938] activateConstraints:v85];
  v71 = [MEMORY[0x263EFF8C0] arrayWithArray:v85];
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v71;
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (VTUIStyle)vtStyle
{
  return self->_vtStyle;
}

- (void)setVtStyle:(id)a3
{
}

- (VTPreferences)vtPrefs
{
  return self->_vtPrefs;
}

- (void)setVtPrefs:(id)a3
{
}

- (VTUIProximityContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSArray)viewConstraints
{
  return self->_viewConstraints;
}

- (void)setViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_vtPrefs, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end