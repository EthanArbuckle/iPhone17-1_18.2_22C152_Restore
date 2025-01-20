@interface SFStepperView
+ (id)_buttonsFont;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SFStepperView)initWithCoder:(id)a3;
- (SFStepperView)initWithFrame:(CGRect)a3;
- (SFStepperView)initWithFrame:(CGRect)a3 includingResetButton:(BOOL)a4;
- (_SFDimmingButton)decrementButton;
- (_SFDimmingButton)doneButton;
- (_SFDimmingButton)incrementButton;
- (_SFDimmingButton)resetButton;
- (void)layoutSubviews;
- (void)setLongestTitle:(id)a3 forButton:(id)a4;
@end

@implementation SFStepperView

- (SFStepperView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFStepperView;
  return [(SFStepperView *)&v4 initWithCoder:a3];
}

- (SFStepperView)initWithFrame:(CGRect)a3
{
  return -[SFStepperView initWithFrame:includingResetButton:](self, "initWithFrame:includingResetButton:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFStepperView)initWithFrame:(CGRect)a3 includingResetButton:(BOOL)a4
{
  BOOL v4 = a4;
  v141[3] = *MEMORY[0x1E4F143B8];
  v136.receiver = self;
  v136.super_class = (Class)SFStepperView;
  v5 = -[SFStepperView initWithFrame:](&v136, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    controlsContainer = v5->_controlsContainer;
    v5->_controlsContainer = v6;

    [(UIView *)v5->_controlsContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v5->_controlsContainer setBackgroundColor:v8];

    -[UIView setLayoutMargins:](v5->_controlsContainer, "setLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    [(SFStepperView *)v5 addSubview:v5->_controlsContainer];
    uint64_t v9 = +[_SFDimmingButton buttonWithType:1];
    p_decrementButton = &v5->_decrementButton;
    decrementButton = v5->_decrementButton;
    v5->_decrementButton = (_SFDimmingButton *)v9;

    [(UIView *)v5->_controlsContainer addSubview:v5->_decrementButton];
    if (v4)
    {
      uint64_t v12 = +[_SFDimmingButton buttonWithType:1];
      resetButton = v5->_resetButton;
      v5->_resetButton = (_SFDimmingButton *)v12;

      LODWORD(v14) = 1131413504;
      [(_SFDimmingButton *)v5->_resetButton setContentHuggingPriority:0 forAxis:v14];
      [(UIView *)v5->_controlsContainer addSubview:v5->_resetButton];
    }
    uint64_t v15 = +[_SFDimmingButton buttonWithType:1];
    incrementButton = v5->_incrementButton;
    v5->_incrementButton = (_SFDimmingButton *)v15;

    [(UIView *)v5->_controlsContainer addSubview:v5->_incrementButton];
    uint64_t v17 = +[_SFDimmingButton buttonWithType:1];
    doneButton = v5->_doneButton;
    v5->_doneButton = (_SFDimmingButton *)v17;

    [(_SFDimmingButton *)v5->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFDimmingButton *)v5->_doneButton setTapTargetSideMargin:&unk_1EDA425A0];
    LODWORD(v19) = 1132593152;
    [(_SFDimmingButton *)v5->_doneButton setContentHuggingPriority:0 forAxis:v19];
    [(UIView *)v5->_controlsContainer addSubview:v5->_doneButton];
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [MEMORY[0x1E4FB1618] separatorColor];
    [v20 setBackgroundColor:v21];

    v129 = v20;
    [(UIView *)v5->_controlsContainer addSubview:v20];
    v22 = [(id)objc_opt_class() _buttonsFont];
    BOOL v130 = v4;
    v125 = (id *)&v5->_decrementButton;
    if (v4)
    {
      v141[0] = v5->_incrementButton;
      v141[1] = v5->_resetButton;
      v141[2] = *p_decrementButton;
      v23 = (void *)MEMORY[0x1E4F1C978];
      v24 = v141;
      uint64_t v25 = 3;
    }
    else
    {
      v140[0] = v5->_incrementButton;
      v140[1] = *p_decrementButton;
      v23 = (void *)MEMORY[0x1E4F1C978];
      v24 = v140;
      uint64_t v25 = 2;
    }
    [v23 arrayWithObjects:v24 count:v25];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v132 objects:v139 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v133;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v133 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v31 setTapTargetSideMargin:&unk_1EDA425A0];
          v32 = [MEMORY[0x1E4FB1618] labelColor];
          [v31 setTintColor:v32];

          v33 = [v31 titleLabel];
          [v33 setFont:v22];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v132 objects:v139 count:16];
      }
      while (v28);
    }

    v34 = [(UIView *)v5->_controlsContainer layoutMarginsGuide];
    v128 = [(SFStepperView *)v5 safeAreaLayoutGuide];
    v94 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [*v125 leadingAnchor];
    v120 = [v34 leadingAnchor];
    v122 = v35;
    v118 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v138[0] = v118;
    v36 = [(_SFDimmingButton *)v5->_incrementButton leadingAnchor];
    double v37 = 4.0;
    p_resetButton = (id *)&v5->_decrementButton;
    if (v130)
    {
      p_resetButton = (id *)&v5->_resetButton;
      double v37 = 2.0;
    }
    v116 = [*p_resetButton trailingAnchor];
    v114 = [v36 constraintEqualToSystemSpacingAfterAnchor:v116 multiplier:v37];
    v115 = v36;
    v138[1] = v114;
    v113 = [v129 leadingAnchor];
    v112 = [(_SFDimmingButton *)v5->_incrementButton trailingAnchor];
    v111 = [v113 constraintEqualToSystemSpacingAfterAnchor:v112 multiplier:2.0];
    v138[2] = v111;
    v110 = [(_SFDimmingButton *)v5->_doneButton leadingAnchor];
    v109 = [v129 trailingAnchor];
    v108 = [v110 constraintEqualToSystemSpacingAfterAnchor:v109 multiplier:2.0];
    v138[3] = v108;
    v107 = [(_SFDimmingButton *)v5->_doneButton trailingAnchor];
    v106 = [v34 trailingAnchor];
    v105 = [v107 constraintEqualToAnchor:v106];
    v138[4] = v105;
    v104 = [*v125 topAnchor];
    v103 = [v34 topAnchor];
    v102 = [v104 constraintGreaterThanOrEqualToAnchor:v103];
    v138[5] = v102;
    v101 = [*v125 centerYAnchor];
    v100 = [(_SFDimmingButton *)v5->_doneButton centerYAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v138[6] = v99;
    v98 = [*v125 bottomAnchor];
    v97 = [v34 bottomAnchor];
    v96 = [v98 constraintLessThanOrEqualToAnchor:v97];
    v138[7] = v96;
    v95 = [(_SFDimmingButton *)v5->_incrementButton topAnchor];
    v93 = [v34 topAnchor];
    v92 = [v95 constraintGreaterThanOrEqualToAnchor:v93];
    v138[8] = v92;
    v91 = [(_SFDimmingButton *)v5->_incrementButton centerYAnchor];
    v90 = [(_SFDimmingButton *)v5->_doneButton centerYAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v138[9] = v89;
    v88 = [(_SFDimmingButton *)v5->_incrementButton bottomAnchor];
    v87 = [v34 bottomAnchor];
    v86 = [v88 constraintLessThanOrEqualToAnchor:v87];
    v138[10] = v86;
    v85 = [v129 topAnchor];
    v84 = [(UIView *)v5->_controlsContainer topAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v138[11] = v83;
    v82 = [v129 bottomAnchor];
    v81 = [(UIView *)v5->_controlsContainer bottomAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v138[12] = v80;
    v79 = [v129 widthAnchor];
    v78 = [v79 constraintEqualToConstant:_SFOnePixel()];
    v138[13] = v78;
    v77 = [(_SFDimmingButton *)v5->_doneButton topAnchor];
    v76 = [v34 topAnchor];
    v75 = [v77 constraintGreaterThanOrEqualToAnchor:v76];
    v138[14] = v75;
    v74 = [(_SFDimmingButton *)v5->_doneButton centerYAnchor];
    v73 = [v34 centerYAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v138[15] = v72;
    v71 = [(_SFDimmingButton *)v5->_doneButton bottomAnchor];
    v70 = [v34 bottomAnchor];
    v69 = [v71 constraintLessThanOrEqualToAnchor:v70];
    v138[16] = v69;
    v68 = [(UIView *)v5->_controlsContainer centerXAnchor];
    v67 = [(SFStepperView *)v5 centerXAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v138[17] = v66;
    v65 = [(UIView *)v5->_controlsContainer leadingAnchor];
    v64 = [v128 leadingAnchor];
    v63 = [v65 constraintGreaterThanOrEqualToAnchor:v64];
    v138[18] = v63;
    v62 = [(UIView *)v5->_controlsContainer trailingAnchor];
    v61 = [v128 trailingAnchor];
    v60 = [v62 constraintLessThanOrEqualToAnchor:v61];
    v138[19] = v60;
    v59 = [(UIView *)v5->_controlsContainer bottomAnchor];
    v58 = [v128 bottomAnchor];
    v57 = [v59 constraintLessThanOrEqualToAnchor:v58];
    v138[20] = v57;
    v56 = [(SFStepperView *)v5 bottomAnchor];
    [(UIView *)v5->_controlsContainer bottomAnchor];
    v39 = v127 = v34;
    v40 = [v56 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v39 multiplier:1.0];
    v138[21] = v40;
    v41 = [(UIView *)v5->_controlsContainer bottomAnchor];
    v42 = [(SFStepperView *)v5 bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    LODWORD(v44) = 1112014848;
    v45 = objc_msgSend(v43, "sf_withPriority:", v44);
    v138[22] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:23];
    [v94 activateConstraints:v46];

    if (v130)
    {
      v119 = (void *)MEMORY[0x1E4F28DC8];
      v131 = [(_SFDimmingButton *)v5->_resetButton leadingAnchor];
      v126 = [*v125 trailingAnchor];
      v124 = [v131 constraintEqualToSystemSpacingAfterAnchor:v126 multiplier:2.0];
      v137[0] = v124;
      v123 = [(_SFDimmingButton *)v5->_resetButton topAnchor];
      v121 = [v127 topAnchor];
      v117 = [v123 constraintGreaterThanOrEqualToAnchor:v121];
      v137[1] = v117;
      v47 = [(_SFDimmingButton *)v5->_resetButton centerYAnchor];
      v48 = [(_SFDimmingButton *)v5->_doneButton centerYAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      v137[2] = v49;
      v50 = [(_SFDimmingButton *)v5->_resetButton bottomAnchor];
      v51 = [v127 bottomAnchor];
      v52 = [v50 constraintLessThanOrEqualToAnchor:v51];
      v137[3] = v52;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:4];
      [v119 activateConstraints:v53];
    }
    v54 = v5;
  }
  return v5;
}

+ (id)_buttonsFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  BOOL v4 = objc_msgSend(v3, "monospacedDigitSystemFontOfSize:weight:");

  return v4;
}

- (void)layoutSubviews
{
  [(UIView *)self->_controlsContainer bounds];
  double v3 = CGRectGetHeight(v14) * 0.5;
  BOOL v4 = [(UIView *)self->_controlsContainer layer];
  [v4 setCornerRadius:v3];

  [(MTShadowView *)self->_shadowView maskCornerRadius];
  if (v5 != v3)
  {
    [(MTShadowView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;
  }
  v7 = self->_shadowView;
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F743D0]);
    uint64_t v11 = 1065353216;
    long long v12 = *MEMORY[0x1E4F1DB30];
    uint64_t v13 = 0x4034000000000000;
    uint64_t v9 = (MTShadowView *)[v8 initWithShadowAttributes:&v11 maskCornerRadius:0 continuousCorners:v3];
    v10 = self->_shadowView;
    self->_shadowView = v9;

    [(SFStepperView *)self insertSubview:self->_shadowView atIndex:0];
    v7 = self->_shadowView;
  }
  [(UIView *)self->_controlsContainer frame];
  -[MTShadowView frameWithContentWithFrame:](v7, "frameWithContentWithFrame:");
  -[MTShadowView setFrame:](self->_shadowView, "setFrame:");
}

- (void)setLongestTitle:(id)a3 forButton:(id)a4
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_buttonToLongestStringMap objectForKey:v7];
  if ([v6 length] && !v8)
  {
    id v27 = v6;
    if (!self->_buttonToLongestStringMap)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      buttonToLongestStringMap = self->_buttonToLongestStringMap;
      self->_buttonToLongestStringMap = v9;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v11 = [v7 titleLabel];
    long long v12 = [v11 font];
    [v8 setFont:v12];

    [v8 setHidden:1];
    [(UIView *)self->_controlsContainer addSubview:v8];
    v21 = (void *)MEMORY[0x1E4F28DC8];
    id v26 = [v8 leadingAnchor];
    uint64_t v25 = [v7 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [v8 topAnchor];
    v22 = [v7 topAnchor];
    id v20 = [v23 constraintEqualToAnchor:v22];
    v28[1] = v20;
    uint64_t v13 = [v8 widthAnchor];
    CGRect v14 = [v7 widthAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    v28[2] = v15;
    v16 = [v8 heightAnchor];
    uint64_t v17 = [v7 heightAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v28[3] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v21 activateConstraints:v19];

    [(NSMapTable *)self->_buttonToLongestStringMap setObject:v8 forKey:v7];
    id v6 = v27;
  }
  [v8 setText:v6];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = self;
  controlsContainer = self->_controlsContainer;
  id v8 = a4;
  -[SFStepperView convertPoint:toView:](v6, "convertPoint:toView:", controlsContainer, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](controlsContainer, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (_SFDimmingButton)incrementButton
{
  return self->_incrementButton;
}

- (_SFDimmingButton)decrementButton
{
  return self->_decrementButton;
}

- (_SFDimmingButton)resetButton
{
  return self->_resetButton;
}

- (_SFDimmingButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);
  objc_storeStrong((id *)&self->_incrementButton, 0);
  objc_storeStrong((id *)&self->_buttonToLongestStringMap, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_controlsContainer, 0);
}

@end