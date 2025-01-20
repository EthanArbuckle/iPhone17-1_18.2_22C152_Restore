@interface SBIconWidgetIntroductionPopoverView
+ (CGSize)contentSize:(BOOL)a3;
- (SBIconWidgetIntroductionDelegate)delegate;
- (SBIconWidgetIntroductionPopoverView)initWithDelegate:(id)a3 vertical:(BOOL)a4;
- (UIButton)editButton;
- (UIButton)okButton;
- (UILabel)textLabel;
- (UIView)verticalDividerLine;
- (void)_editButtonTapped:(id)a3;
- (void)_okButtonTapped:(id)a3;
- (void)_setUpViews:(BOOL)a3;
- (void)_updateForUserInterfaceStyle;
- (void)setDelegate:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setOkButton:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setVerticalDividerLine:(id)a3;
@end

@implementation SBIconWidgetIntroductionPopoverView

+ (CGSize)contentSize:(BOOL)a3
{
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && a3)
  {
    double v6 = 120.0;
    double v7 = 320.0;
  }
  else
  {
    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    double v7 = dbl_1D81E7F40[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    double v6 = 74.0;
  }
  result.height = v6;
  result.width = v7;
  return result;
}

- (SBIconWidgetIntroductionPopoverView)initWithDelegate:(id)a3 vertical:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)SBIconWidgetIntroductionPopoverView;
  v8 = [(SBHPopoverView *)&v12 initWithArrowLocation:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    [(SBIconWidgetIntroductionPopoverView *)v9 _setUpViews:v4];
    [(SBIconWidgetIntroductionPopoverView *)v9 _updateForUserInterfaceStyle];
    v10 = v9;
  }

  return v9;
}

- (void)_setUpViews:(BOOL)a3
{
  BOOL v3 = a3;
  v127[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBHPopoverView *)self backgroundView];
  [v4 setUserInteractionEnabled:1];
  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v8 = 14.0;
  }
  else {
    double v8 = 13.0;
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v9 = 22.0;
  }
  else {
    double v9 = 15.0;
  }
  if (v3) {
    double v10 = 40.0;
  }
  else {
    double v10 = 4.0;
  }
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  v115 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v8 weight:*MEMORY[0x1E4FB09D8]];
  id v120 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  objc_msgSend(v4, "addLayoutGuide:");
  BOOL v113 = v3;
  v119 = v4;
  if (v3)
  {
    v101 = (void *)MEMORY[0x1E4F28DC8];
    v13 = [v120 leadingAnchor];
    [v4 leadingAnchor];
    v110 = v116 = v13;
    v106 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v127[0] = v106;
    v14 = [v120 trailingAnchor];
    v15 = [v4 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v127[1] = v16;
    v17 = [v120 bottomAnchor];
    v18 = [v4 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-10.0];
    v127[2] = v19;
    v20 = [v120 heightAnchor];
    v21 = [v20 constraintLessThanOrEqualToConstant:32.0];
    v127[3] = v21;
    v22 = (void *)MEMORY[0x1E4F1C978];
    v23 = v127;
  }
  else
  {
    double v24 = dbl_1D81E7F50[(v12 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    v101 = (void *)MEMORY[0x1E4F28DC8];
    v116 = [v120 widthAnchor];
    v110 = [v116 constraintEqualToConstant:v24];
    v126[0] = v110;
    v25 = [v120 trailingAnchor];
    v14 = [v4 trailingAnchor];
    v106 = v25;
    v15 = [v25 constraintEqualToAnchor:v14];
    v126[1] = v15;
    v16 = [v120 centerYAnchor];
    v17 = [v4 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v126[2] = v18;
    v19 = [v120 heightAnchor];
    v20 = [v4 heightAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:-25.0];
    v126[3] = v21;
    v22 = (void *)MEMORY[0x1E4F1C978];
    v23 = v126;
  }
  v26 = [v22 arrayWithObjects:v23 count:4];
  [v101 activateConstraints:v26];

  double v27 = dbl_1D81E7F60[v7 == 1];
  v117 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09E0]];
  id v28 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v119 addSubview:v28];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  v94 = (void *)MEMORY[0x1E4F28DC8];
  v111 = [v28 centerXAnchor];
  v107 = [v120 centerXAnchor];
  v102 = [v111 constraintEqualToAnchor:v107];
  v125[0] = v102;
  v98 = [v28 centerYAnchor];
  v29 = [v120 centerYAnchor];
  v30 = [v98 constraintEqualToAnchor:v29];
  v125[1] = v30;
  v31 = [v28 widthAnchor];
  v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v32 scale];
  v34 = [v31 constraintEqualToConstant:2.0 / v33];
  v125[2] = v34;
  v35 = [v28 topAnchor];
  v36 = [v120 topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  v125[3] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:4];
  [v94 activateConstraints:v38];

  v112 = v28;
  objc_storeStrong((id *)&self->_verticalDividerLine, v28);
  v39 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v40 = SBHBundle();
  v41 = [v40 localizedStringForKey:@"WIDGET_DISCOVERABILITY_OK" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v39 setTitle:v41 forState:0];

  v42 = [v39 titleLabel];
  [v42 setFont:v117];

  v43 = [v39 titleLabel];
  [v43 setAdjustsFontSizeToFitWidth:1];

  [v39 setAccessibilityIdentifier:@"SBWidgetIntroductionButton-OK"];
  [v119 addSubview:v39];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  v95 = (void *)MEMORY[0x1E4F28DC8];
  v108 = [v39 trailingAnchor];
  v103 = [v120 trailingAnchor];
  v99 = [v108 constraintEqualToAnchor:v103 constant:-v10];
  v124[0] = v99;
  v44 = [v39 widthAnchor];
  v45 = [v44 constraintEqualToConstant:v27];
  v124[1] = v45;
  v46 = [v39 centerYAnchor];
  v47 = [v120 centerYAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  v124[2] = v48;
  v49 = [v39 heightAnchor];
  v50 = [v120 heightAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v124[3] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:4];
  [v95 activateConstraints:v52];

  [v39 addTarget:self action:sel__okButtonTapped_ forControlEvents:64];
  v109 = v39;
  objc_storeStrong((id *)&self->_okButton, v39);
  v53 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v54 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v55 = [v54 userInterfaceIdiom];

  v56 = SBHBundle();
  v57 = v56;
  if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    v58 = @"WIDGET_DISCOVERABILITY_EDIT";
  }
  else {
    v58 = @"WIDGET_DISCOVERABILITY_UNDO";
  }
  uint64_t v59 = [v56 localizedStringForKey:v58 value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  v100 = (void *)v59;
  [v53 setTitle:v59 forState:0];
  v60 = [v53 titleLabel];
  [v60 setFont:v117];

  v61 = [v53 titleLabel];
  [v61 setAdjustsFontSizeToFitWidth:1];

  [v53 setAccessibilityIdentifier:@"SBWidgetIntroductionButton-Edit"];
  [v119 addSubview:v53];
  [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  v90 = (void *)MEMORY[0x1E4F28DC8];
  v104 = [v53 leadingAnchor];
  v96 = [v120 leadingAnchor];
  v92 = [v104 constraintEqualToAnchor:v96 constant:v10];
  v123[0] = v92;
  v62 = [v53 widthAnchor];
  v63 = [v62 constraintEqualToConstant:v27];
  v123[1] = v63;
  v64 = [v53 centerYAnchor];
  v65 = [v120 centerYAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  v123[2] = v66;
  v67 = [v53 heightAnchor];
  v68 = [v120 heightAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  v123[3] = v69;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:4];
  [v90 activateConstraints:v70];

  [v53 addTarget:self action:sel__editButtonTapped_ forControlEvents:64];
  v105 = v53;
  objc_storeStrong((id *)&self->_editButton, v53);
  v71 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  v72 = SBHBundle();
  v73 = [v72 localizedStringForKey:@"WIDGET_DISCOVERABILITY_DESCRIPTION" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [(UILabel *)v71 setText:v73];

  [(UILabel *)v71 setFont:v115];
  [(UILabel *)v71 setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)v71 setMinimumScaleFactor:0.6];
  [(UILabel *)v71 setNumberOfLines:3];
  [v119 addSubview:v71];
  [(UILabel *)v71 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v71 setTextAlignment:1];
  v89 = (void *)MEMORY[0x1E4F28DC8];
  v74 = [(UILabel *)v71 leadingAnchor];
  v93 = [v119 leadingAnchor];
  v97 = v74;
  uint64_t v75 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v9);
  v91 = (void *)v75;
  if (v113)
  {
    v122[0] = v75;
    v76 = [(UILabel *)v71 trailingAnchor];
    [v119 trailingAnchor];
    v88 = v114 = v76;
    v77 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", -v9);
    v122[1] = v77;
    v78 = [(UILabel *)v71 centerXAnchor];
    v79 = [v119 centerXAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    v122[2] = v80;
    v81 = [(UILabel *)v71 bottomAnchor];
    v82 = [v120 topAnchor];
    v83 = [v81 constraintEqualToAnchor:v82 constant:-15.0];
    v122[3] = v83;
    v84 = v122;
  }
  else
  {
    v121[0] = v75;
    v85 = [(UILabel *)v71 trailingAnchor];
    [v120 leadingAnchor];
    v88 = v114 = v85;
    v77 = objc_msgSend(v85, "constraintEqualToAnchor:constant:", -v10);
    v121[1] = v77;
    v78 = [(UILabel *)v71 centerYAnchor];
    v79 = [v119 centerYAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    v121[2] = v80;
    v81 = [(UILabel *)v71 heightAnchor];
    v82 = [v119 heightAnchor];
    v83 = [v81 constraintLessThanOrEqualToAnchor:v82 constant:-8.0];
    v121[3] = v83;
    v84 = v121;
  }
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
  [v89 activateConstraints:v86];

  textLabel = self->_textLabel;
  self->_textLabel = v71;
}

- (void)_updateForUserInterfaceStyle
{
  id v15 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  BOOL v3 = [(SBIconWidgetIntroductionPopoverView *)self textLabel];
  BOOL v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v5 = [v4 resolvedColorWithTraitCollection:v15];
  [v3 setTextColor:v5];

  [v3 _setDrawsAsBackdropOverlayWithBlendMode:2];
  uint64_t v6 = [(SBIconWidgetIntroductionPopoverView *)self verticalDividerLine];
  unint64_t v7 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  double v8 = [v7 resolvedColorWithTraitCollection:v15];
  [v6 setBackgroundColor:v8];

  [v6 _setDrawsAsBackdropOverlayWithBlendMode:2];
  double v9 = [(SBIconWidgetIntroductionPopoverView *)self okButton];
  double v10 = [MEMORY[0x1E4FB1618] linkColor];
  v11 = [v10 resolvedColorWithTraitCollection:v15];
  [v9 setTintColor:v11];

  [v9 _setDrawsAsBackdropOverlayWithBlendMode:2];
  uint64_t v12 = [(SBIconWidgetIntroductionPopoverView *)self editButton];
  v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v14 = [v13 resolvedColorWithTraitCollection:v15];
  [v12 setTintColor:v14];

  [v12 _setDrawsAsBackdropOverlayWithBlendMode:2];
}

- (void)_okButtonTapped:(id)a3
{
  id v3 = [(SBIconWidgetIntroductionPopoverView *)self delegate];
  [v3 acceptWidgetIntroduction];
}

- (void)_editButtonTapped:(id)a3
{
  id v3 = [(SBIconWidgetIntroductionPopoverView *)self delegate];
  [v3 rejectWidgetIntroduction];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void)setOkButton:(id)a3
{
}

- (UIView)verticalDividerLine
{
  return self->_verticalDividerLine;
}

- (void)setVerticalDividerLine:(id)a3
{
}

- (SBIconWidgetIntroductionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconWidgetIntroductionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalDividerLine, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end