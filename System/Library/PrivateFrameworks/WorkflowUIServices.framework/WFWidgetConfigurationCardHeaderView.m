@interface WFWidgetConfigurationCardHeaderView
- (NSLayoutConstraint)bottomAreaHeightConstraint;
- (UIButton)closeButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelsStackView;
- (UIView)blendedBorderView;
- (WFWidgetConfigurationCardHeaderView)initWithIcon:(id)a3 closeButton:(id)a4 title:(id)a5 subtitle:(id)a6;
- (WFWidgetConfigurationCardHeaderView)initWithRequest:(id)a3;
- (WFWidgetConfigurationCardHeaderViewDelegate)delegate;
- (double)widgetDescriptionTallScriptCompensatedSpacing;
- (void)close;
- (void)setDelegate:(id)a3;
- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIconBorderColor;
- (void)updateIconBorderWidth;
@end

@implementation WFWidgetConfigurationCardHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_blendedBorderView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_bottomAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (double)widgetDescriptionTallScriptCompensatedSpacing
{
  return self->_widgetDescriptionTallScriptCompensatedSpacing;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (UIView)blendedBorderView
{
  return self->_blendedBorderView;
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (NSLayoutConstraint)bottomAreaHeightConstraint
{
  return self->_bottomAreaHeightConstraint;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetConfigurationCardHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetConfigurationCardHeaderViewDelegate *)WeakRetained;
}

- (void)close
{
  id v3 = [(WFWidgetConfigurationCardHeaderView *)self delegate];
  [v3 widgetConfigurationCardHeaderViewDidRequestToClose:self];
}

- (void)updateIconBorderColor
{
  id v3 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1)
  {
    CGColorRef SRGB = CGColorCreateSRGB(0.874509811, 0.874509811, 0.894117653, 1.0);
    v6 = [(WFWidgetConfigurationCardHeaderView *)self blendedBorderView];
    v7 = [v6 layer];
    [v7 setBorderColor:SRGB];

    CFRelease(SRGB);
    v8 = (uint64_t *)MEMORY[0x263F15B70];
  }
  else
  {
    CGColorRef v9 = CGColorCreateSRGB(0.247058824, 0.247058824, 0.247058824, 1.0);
    v10 = [(WFWidgetConfigurationCardHeaderView *)self blendedBorderView];
    v11 = [v10 layer];
    [v11 setBorderColor:v9];

    CFRelease(v9);
    v8 = (uint64_t *)MEMORY[0x263F15CB8];
  }
  uint64_t v12 = *v8;
  id v14 = [(WFWidgetConfigurationCardHeaderView *)self blendedBorderView];
  v13 = [v14 layer];
  [v13 setCompositingFilter:v12];
}

- (void)updateIconBorderWidth
{
  id v10 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
  [v10 displayScale];
  double v5 = v4;
  if (v4 <= 0.0)
  {
    double v7 = 1.0;
  }
  else
  {
    v2 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
    [v2 displayScale];
    double v7 = 1.0 / v6;
  }
  v8 = [(WFWidgetConfigurationCardHeaderView *)self blendedBorderView];
  CGColorRef v9 = [v8 layer];
  [v9 setBorderWidth:v7];

  if (v5 > 0.0) {
}
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFWidgetConfigurationCardHeaderView;
  [(WFWidgetConfigurationCardHeaderView *)&v20 traitCollectionDidChange:v4];
  double v5 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    v8 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835D0]];
    [v8 scaledValueForValue:18.0];
    double v10 = v9;
    v11 = [(WFWidgetConfigurationCardHeaderView *)self labelsStackView];
    [v11 setSpacing:v10];
  }
  uint64_t v12 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];
  uint64_t v14 = [v4 userInterfaceStyle];

  if (v13 != v14) {
    [(WFWidgetConfigurationCardHeaderView *)self updateIconBorderColor];
  }
  v15 = [(WFWidgetConfigurationCardHeaderView *)self traitCollection];
  [v15 displayScale];
  double v17 = v16;
  [v4 displayScale];
  double v19 = v18;

  if (v17 != v19) {
    [(WFWidgetConfigurationCardHeaderView *)self updateIconBorderWidth];
  }
}

- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
  id v4 = [(WFWidgetConfigurationCardHeaderView *)self bottomAreaHeightConstraint];
  [v4 setConstant:a3];
}

- (WFWidgetConfigurationCardHeaderView)initWithIcon:(id)a3 closeButton:(id)a4 title:(id)a5 subtitle:(id)a6
{
  v159[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v156.receiver = self;
  v156.super_class = (Class)WFWidgetConfigurationCardHeaderView;
  uint64_t v14 = -[WFWidgetConfigurationCardHeaderView initWithFrame:](&v156, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v14)
  {
    id v152 = v10;
    v15 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1148829696;
    [v15 setContentHuggingPriority:0 forAxis:v16];
    LODWORD(v17) = 1148829696;
    [v15 setContentHuggingPriority:1 forAxis:v17];
    LODWORD(v18) = 1148829696;
    [v15 setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148829696;
    [v15 setContentCompressionResistancePriority:1 forAxis:v19];
    v155 = v13;
    id v20 = objc_alloc(MEMORY[0x263F82E00]);
    [v15 bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    blendedBorderView = v14->_blendedBorderView;
    v14->_blendedBorderView = (UIView *)v21;

    v23 = [(WFWidgetConfigurationCardHeaderView *)v14 blendedBorderView];
    [v23 setAutoresizingMask:18];

    v24 = [(WFWidgetConfigurationCardHeaderView *)v14 traitCollection];
    [v24 displayScale];
    double v26 = 1.0 / v25;
    v27 = [(WFWidgetConfigurationCardHeaderView *)v14 blendedBorderView];
    v28 = [v27 layer];
    [v28 setBorderWidth:v26];

    uint64_t v29 = *MEMORY[0x263F15A20];
    v30 = [(WFWidgetConfigurationCardHeaderView *)v14 blendedBorderView];
    v31 = [v30 layer];
    [v31 setCornerCurve:v29];

    v32 = [(WFWidgetConfigurationCardHeaderView *)v14 blendedBorderView];
    v33 = [v32 layer];
    [v33 setCornerRadius:8.1];

    [(WFWidgetConfigurationCardHeaderView *)v14 updateIconBorderColor];
    [(WFWidgetConfigurationCardHeaderView *)v14 updateIconBorderWidth];
    v34 = [(WFWidgetConfigurationCardHeaderView *)v14 blendedBorderView];
    [v15 addSubview:v34];

    v35 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v14->_titleLabel;
    v14->_titleLabel = v35;

    v37 = [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    [v38 setText:v12];

    id v154 = v12;
    uint64_t v39 = *MEMORY[0x263F83580];
    v40 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83580]];
    v41 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v39 weight:*MEMORY[0x263F81840]];
    v42 = [v40 scaledFontForFont:v41 maximumPointSize:40.0];
    [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    v43 = id v153 = v11;
    [v43 setFont:v42];

    v44 = [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    [v44 setAdjustsFontForContentSizeCategory:1];

    BOOL v45 = [v12 length] == 0;
    v46 = [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    [v46 setHidden:v45];

    v47 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v14->_subtitleLabel;
    v14->_subtitleLabel = v47;

    v49 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    [v49 setTranslatesAutoresizingMaskIntoConstraints:0];

    v50 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    [v50 setText:v155];

    uint64_t v51 = *MEMORY[0x263F83588];
    v52 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83588]];
    v53 = (void *)MEMORY[0x263F81708];
    v54 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83468]];
    v55 = [v53 preferredFontForTextStyle:v51 compatibleWithTraitCollection:v54];
    v56 = [v52 scaledFontForFont:v55 maximumPointSize:32.0];
    v57 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    [v57 setFont:v56];

    v58 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    [v58 setAdjustsFontForContentSizeCategory:1];

    BOOL v59 = [v155 length] == 0;
    v60 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    [v60 setHidden:v59];

    id v61 = objc_alloc(MEMORY[0x263F82BF8]);
    v62 = [(WFWidgetConfigurationCardHeaderView *)v14 titleLabel];
    v159[0] = v62;
    v63 = [(WFWidgetConfigurationCardHeaderView *)v14 subtitleLabel];
    v159[1] = v63;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:2];
    uint64_t v65 = [v61 initWithArrangedSubviews:v64];
    labelsStackView = v14->_labelsStackView;
    v14->_labelsStackView = (UIStackView *)v65;

    v67 = [(WFWidgetConfigurationCardHeaderView *)v14 labelsStackView];
    [v67 setTranslatesAutoresizingMaskIntoConstraints:0];

    v68 = [(WFWidgetConfigurationCardHeaderView *)v14 labelsStackView];
    [v68 setAxis:1];

    v69 = [(WFWidgetConfigurationCardHeaderView *)v14 labelsStackView];
    [v69 setAlignment:1];

    v70 = [(WFWidgetConfigurationCardHeaderView *)v14 labelsStackView];
    [v70 setSpacing:2.0];

    id v71 = objc_alloc(MEMORY[0x263F82BF8]);
    v158[0] = v15;
    v72 = [(WFWidgetConfigurationCardHeaderView *)v14 labelsStackView];
    v158[1] = v72;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:2];
    v74 = (void *)[v71 initWithArrangedSubviews:v73];

    v75 = v74;
    [v74 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v74 setSpacing:10.0];
    [v74 setAlignment:3];
    v151 = v74;
    [v74 setDistribution:0];
    objc_storeStrong((id *)&v14->_closeButton, a4);
    v76 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    LODWORD(v77) = 1148829696;
    [v76 setContentCompressionResistancePriority:0 forAxis:v77];

    v78 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    LODWORD(v79) = 1148829696;
    [v78 setContentCompressionResistancePriority:1 forAxis:v79];

    v80 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    LODWORD(v81) = 1148829696;
    [v80 setContentHuggingPriority:0 forAxis:v81];

    v82 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    LODWORD(v83) = 1148829696;
    [v82 setContentHuggingPriority:1 forAxis:v83];

    v84 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    [v84 addTarget:v14 action:sel_close forControlEvents:0x2000];

    v85 = (void *)MEMORY[0x263EFF8C0];
    v86 = [(WFWidgetConfigurationCardHeaderView *)v14 closeButton];
    v150 = objc_msgSend(v85, "arrayWithObjects:", v75, v86, 0);

    v87 = (void *)[objc_alloc(MEMORY[0x263F82BF8]) initWithArrangedSubviews:v150];
    [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v87 setSpacing:8.0];
    [v87 setAlignment:1];
    [v87 setDistribution:0];
    [v15 setHidden:v152 == 0];
    [(WFWidgetConfigurationCardHeaderView *)v14 addSubview:v87];
    v88 = objc_opt_new();
    v89 = objc_opt_new();
    [(WFWidgetConfigurationCardHeaderView *)v14 addLayoutGuide:v88];
    [(WFWidgetConfigurationCardHeaderView *)v14 addLayoutGuide:v89];
    v90 = [v88 heightAnchor];
    v91 = [v89 heightAnchor];
    [(WFWidgetConfigurationCardHeaderView *)v14 widgetDescriptionTallScriptCompensatedSpacing];
    uint64_t v92 = objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91);
    bottomAreaHeightConstraint = v14->_bottomAreaHeightConstraint;
    v14->_bottomAreaHeightConstraint = (NSLayoutConstraint *)v92;

    LODWORD(v94) = 1148354560;
    [(NSLayoutConstraint *)v14->_bottomAreaHeightConstraint setPriority:v94];
    v127 = (void *)MEMORY[0x263F08938];
    v149 = v15;
    v148 = [v15 widthAnchor];
    v147 = [v148 constraintEqualToConstant:36.0];
    v157[0] = v147;
    v146 = [v15 heightAnchor];
    v145 = [v15 widthAnchor];
    v144 = [v146 constraintEqualToAnchor:v145];
    v157[1] = v144;
    v142 = [v87 topAnchor];
    v143 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v141 = [v143 topAnchor];
    v139 = [v142 constraintEqualToAnchor:v141];
    v140 = v87;
    v157[2] = v139;
    v137 = [v87 leadingAnchor];
    v138 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v136 = [v138 leadingAnchor];
    v135 = [v137 constraintEqualToAnchor:v136 constant:1.0];
    v157[3] = v135;
    v134 = [v87 bottomAnchor];
    v133 = [v89 topAnchor];
    v132 = [v134 constraintEqualToAnchor:v133];
    v157[4] = v132;
    v130 = [v87 trailingAnchor];
    v131 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v129 = [v131 trailingAnchor];
    v126 = [v130 constraintEqualToAnchor:v129];
    v157[5] = v126;
    v125 = [v88 topAnchor];
    v124 = [(WFWidgetConfigurationCardHeaderView *)v14 topAnchor];
    v123 = [v125 constraintEqualToAnchor:v124];
    v157[6] = v123;
    v128 = v88;
    v120 = [v88 bottomAnchor];
    v121 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v119 = [v121 topAnchor];
    v118 = [v120 constraintEqualToAnchor:v119];
    v157[7] = v118;
    v117 = [v89 bottomAnchor];
    v116 = [(WFWidgetConfigurationCardHeaderView *)v14 bottomAnchor];
    v115 = [v117 constraintEqualToAnchor:v116];
    v157[8] = v115;
    v157[9] = v14->_bottomAreaHeightConstraint;
    v113 = [v88 leadingAnchor];
    v114 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v112 = [v114 leadingAnchor];
    v111 = [v113 constraintEqualToAnchor:v112];
    v157[10] = v111;
    v109 = [v88 trailingAnchor];
    v110 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v108 = [v110 trailingAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v157[11] = v107;
    v95 = v89;
    v122 = v89;
    v106 = [v89 leadingAnchor];
    v96 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v97 = [v96 leadingAnchor];
    v98 = [v106 constraintEqualToAnchor:v97];
    v157[12] = v98;
    v99 = [v95 trailingAnchor];
    v100 = [(WFWidgetConfigurationCardHeaderView *)v14 layoutMarginsGuide];
    v101 = [v100 trailingAnchor];
    v102 = [v99 constraintEqualToAnchor:v101];
    v157[13] = v102;
    v103 = [MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:14];
    [v127 activateConstraints:v103];

    id v11 = v153;
    id v10 = v152;

    id v13 = v155;
    id v12 = v154;

    v104 = v14;
  }

  return v14;
}

- (WFWidgetConfigurationCardHeaderView)initWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 intent];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x263F520A8]) initWithOptions:0];
    double v7 = objc_msgSend(v5, "_intents_bundleIdForLaunching");
    v8 = [v5 appIntentIdentifier];
    double v9 = [v6 actionsForBundleIdentifier:v7 andActionIdentifier:v8 error:0];
    id v10 = [v9 firstObject];

    id v11 = [v10 attributionBundleIdentifier];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      objc_msgSend(v5, "_intents_bundleIdForDisplay");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = v13;

    v15 = v5;
  }
  else
  {

    uint64_t v14 = objc_msgSend(v5, "_intents_bundleIdForDisplay");
    v15 = 0;
  }
  uint64_t v16 = [v4 remoteDeviceIdentifier];
  if (v16)
  {
    double v17 = (void *)v16;
    uint64_t v18 = [v4 remoteAppLocalizedName];
    if (v18)
    {
      double v19 = (void *)v18;
      id v20 = [v4 remoteAppIcon];

      if (v20)
      {
        uint64_t v21 = [v4 remoteAppLocalizedName];
        v22 = [v4 remoteAppIcon];
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  v23 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v14 allowPlaceholder:1 error:0];
  uint64_t v21 = [v23 localizedName];
  v24 = (void *)MEMORY[0x263F85308];
  double v25 = [v4 appBundleIdentifier];
  v22 = [v24 applicationIconImageForBundleIdentifier:v25 format:2];

LABEL_14:
  if ([v4 resolvedWidgetConfigurationStyle] == 1)
  {
    double v26 = 0;
  }
  else
  {
    v27 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:24.0];
    v28 = (void *)MEMORY[0x263F82818];
    uint64_t v29 = [MEMORY[0x263F825C8] lightGrayColor];
    [v28 configurationWithHierarchicalColor:v29];
    v49 = v14;
    v30 = self;
    v32 = v31 = v15;
    v33 = [v27 configurationByApplyingConfiguration:v32];

    v34 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark.circle.fill" withConfiguration:v33];
    v35 = [MEMORY[0x263F824F0] plainButtonConfiguration];
    [v35 setImage:v34];
    objc_msgSend(v35, "setContentInsets:", -12.0, 0.0, 0.0, 0.0);
    double v26 = [MEMORY[0x263F824E8] buttonWithConfiguration:v35 primaryAction:0];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = v31;
    self = v30;
    uint64_t v14 = v49;
  }
  v36 = [v4 widgetDisplayName];
  v37 = v36;
  if (v36)
  {
    id v38 = v36;
  }
  else
  {
    v50 = v22;
    uint64_t v39 = v21;
    v40 = v14;
    v41 = self;
    v42 = v15;
    v43 = [v5 _title];
    v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      id v45 = [v4 fallbackDisplayName];
    }
    id v38 = v45;

    v15 = v42;
    self = v41;
    uint64_t v14 = v40;
    uint64_t v21 = v39;
    v22 = v50;
  }

  v46 = [v22 platformImage];
  v47 = [(WFWidgetConfigurationCardHeaderView *)self initWithIcon:v46 closeButton:v26 title:v38 subtitle:v21];

  return v47;
}

@end