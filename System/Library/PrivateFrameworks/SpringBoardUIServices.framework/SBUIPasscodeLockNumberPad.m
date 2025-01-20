@interface SBUIPasscodeLockNumberPad
+ (CGSize)_inputButtonCircleSize;
+ (UIEdgeInsets)_inputButtonCircleSpacing;
+ (id)_buttonForCharacter:(int64_t)a3 withLightStyle:(BOOL)a4;
- (BOOL)_holdsAuxiliaryButtonsWithinPadBounds;
- (BOOL)showsBackspaceButton;
- (BOOL)showsCancelButton;
- (BOOL)showsEmergencyCallButton;
- (NSArray)buttons;
- (SBUIButton)backspaceButton;
- (SBUIButton)cancelButton;
- (SBUIButton)emergencyCallButton;
- (SBUIPasscodeLockNumberPad)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (SBUIPasscodeLockNumberPadDelegate)delegate;
- (SBUIPasscodeNumberPadButton)downButton;
- (UIColor)reduceTransparencyButtonColor;
- (double)_auxiliaryButtonCenteringOffset;
- (double)_distanceToTopOfFirstButton;
- (double)ancillaryButtonOffset;
- (id)_fontForAncillaryButton;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_backspaceButtonHit;
- (void)_cancelButtonHit;
- (void)_configureAdditionalButtons;
- (void)_emergencyCallButtonHit;
- (void)_numberPadTouchCancelled:(id)a3 forEvent:(id)a4;
- (void)_numberPadTouchDown:(id)a3 forEvent:(id)a4;
- (void)_numberPadTouchDrag:(id)a3 forEvent:(id)a4;
- (void)_numberPadTouchUp:(id)a3 forEvent:(id)a4;
- (void)_setSnapshotsDisabled:(BOOL)a3;
- (void)_updateAuxiliaryButtonConstraints;
- (void)setAncillaryButtonOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDownButton:(id)a3;
- (void)setReduceTransparencyButtonColor:(id)a3;
- (void)setShowsBackspaceButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBUIPasscodeLockNumberPad

- (NSArray)buttons
{
  return [(TPNumberPad *)self->_numberPad buttons];
}

+ (id)_buttonForCharacter:(int64_t)a3 withLightStyle:(BOOL)a4
{
  if (a3 == 13)
  {
    id v4 = [[SBEmptyButtonView alloc] initForCharacter:13];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    +[SBPasscodeNumberPadButton defaultSize];
    objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  }
  else
  {
    id v4 = (id)[objc_alloc((Class)objc_opt_class()) initForCharacter:a3];
  }
  return v4;
}

- (SBUIPasscodeLockNumberPad)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = (void *)MEMORY[0x1AD0CEF60]();
  for (uint64_t i = 0; i != 12; ++i)
  {
    double v8 = [(id)objc_opt_class() _buttonForCharacter:SBNumberPadCharacters[i] withLightStyle:v3];
    [v5 addObject:v8];
  }
  v9 = [(TPNumberPad *)[SBNumberPadWithDelegate alloc] initWithButtons:v5];
  [(SBNumberPadWithDelegate *)v9 bounds];
  double v11 = v10;
  double v13 = v12;
  [MEMORY[0x1E4FA5F68] pinNumberPadBottomPaddingHeight];
  double v15 = SBUIFloatFloorForMainScreenScale(v14);
  [MEMORY[0x1E4FA5F68] pinNumberPadWidth];
  v125.receiver = self;
  v125.super_class = (Class)SBUIPasscodeLockNumberPad;
  v17 = -[SBUIPasscodeLockNumberPad initWithFrame:](&v125, sel_initWithFrame_, 0.0, 0.0, v16, v13 + v15);
  v18 = v17;
  if (v17)
  {
    id v112 = v5;
    BOOL v115 = v3;
    v17->_useLightStyle = v3;
    [(SBUIPasscodeLockNumberPad *)v17 bounds];
    double v20 = SBUIFloatFloorForMainScreenScale((v19 - v11) * 0.5);
    v111 = v9;
    objc_storeStrong((id *)&v18->_numberPad, v9);
    -[SBNumberPadWithDelegate setFrame:](v18->_numberPad, "setFrame:", v20, 0.0, v11, v13);
    p_numberPad = (id *)&v18->_numberPad;
    [(SBUIPasscodeLockNumberPad *)v18 addSubview:v18->_numberPad];
    v119 = [(SBUIPasscodeLockNumberPad *)v18 _fontForAncillaryButton];
    [v119 pointSize];
    if (v21 <= 7.0) {
      double v22 = 1.0;
    }
    else {
      double v22 = 7.0 / v21;
    }
    uint64_t v23 = +[SBUIButton buttonWithType:1];
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (SBUIButton *)v23;

    v25 = v18->_cancelButton;
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"PASSCODE_CANCEL" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v25 setTitle:v27 forState:0];

    [(SBUIButton *)v18->_cancelButton addTarget:v18 action:sel__cancelButtonHit forControlEvents:64];
    uint64_t v28 = +[SBUIButton buttonWithType:1];
    backspaceButton = v18->_backspaceButton;
    v18->_backspaceButton = (SBUIButton *)v28;

    v30 = v18->_backspaceButton;
    v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"PASSCODE_BACKSPACE" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v30 setTitle:v32 forState:0];

    [(SBUIButton *)v18->_backspaceButton addTarget:v18 action:sel__backspaceButtonHit forControlEvents:64];
    uint64_t v33 = +[SBUIButton buttonWithType:1];
    emergencyCallButton = v18->_emergencyCallButton;
    v18->_emergencyCallButton = (SBUIButton *)v33;

    v35 = v18->_emergencyCallButton;
    v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"PASSCODE_EMERGENCY" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
    [(SBUIButton *)v35 setTitle:v37 forState:0];

    [(SBUIButton *)v18->_emergencyCallButton addTarget:v18 action:sel__emergencyCallButtonHit forControlEvents:64];
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v127[0] = v18->_cancelButton;
    v127[1] = v18->_backspaceButton;
    v127[2] = v18->_emergencyCallButton;
    obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:3];
    uint64_t v38 = [obj countByEnumeratingWithState:&v121 objects:v128 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      v117 = v18;
      v40 = 0;
      uint64_t v114 = *(void *)v122;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v122 != v114) {
            objc_enumerationMutation(obj);
          }
          v42 = *(void **)(*((void *)&v121 + 1) + 8 * j);
          [v42 setUserInteractionEnabled:1];
          [v42 setClipsToBounds:1];
          v43 = [MEMORY[0x1E4F428B8] clearColor];
          [v42 setBackgroundColor:v43];

          if (v115) {
            [MEMORY[0x1E4F428B8] blackColor];
          }
          else {
          v44 = [MEMORY[0x1E4F428B8] whiteColor];
          }
          [v42 setTitleColor:v44 forState:0];

          [v42 setPointerInteractionEnabled:1];
          v45 = [v42 titleLabel];
          [v45 setFont:v119];
          [v45 setLineBreakMode:5];
          [v45 setAdjustsFontSizeToFitWidth:1];
          [v45 setMinimumScaleFactor:v22];
          [(SBUIPasscodeLockNumberPad *)v117 addSubview:v42];
          [v42 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v42 setContentHorizontalAlignment:0];
          LODWORD(v46) = 1144750080;
          [v42 setContentCompressionResistancePriority:0 forAxis:v46];
          v47 = [v42 heightAnchor];
          v48 = [*p_numberPad heightAnchor];
          v49 = [v47 constraintEqualToAnchor:v48 multiplier:0.25];

          LODWORD(v50) = 1144750080;
          [v49 setPriority:v50];
          [v49 setActive:1];
          v51 = [v42 widthAnchor];
          v52 = [*p_numberPad widthAnchor];
          v40 = [v51 constraintEqualToAnchor:v52 multiplier:0.333333333];

          LODWORD(v53) = 1144750080;
          [v40 setPriority:v53];
          [v40 setActive:1];
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v121 objects:v128 count:16];
      }
      while (v39);

      v18 = v117;
    }

    BOOL v118 = [(SBUIPasscodeLockNumberPad *)v18 _holdsAuxiliaryButtonsWithinPadBounds];
    v116 = [*p_numberPad rightAnchor];
    v54 = [(SBUIButton *)v18->_cancelButton rightAnchor];
    v55 = [v116 constraintGreaterThanOrEqualToAnchor:v54];
    v126[0] = v55;
    v56 = [*p_numberPad rightAnchor];
    v57 = [(SBUIButton *)v18->_backspaceButton rightAnchor];
    v58 = [v56 constraintGreaterThanOrEqualToAnchor:v57];
    v126[1] = v58;
    v59 = [(SBUIButton *)v18->_emergencyCallButton leftAnchor];
    v60 = [*p_numberPad leftAnchor];
    v61 = [v59 constraintGreaterThanOrEqualToAnchor:v60];
    v126[2] = v61;
    uint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:3];
    auxiliaryButtonConstrainingConstraints = v18->_auxiliaryButtonConstrainingConstraints;
    v18->_auxiliaryButtonConstrainingConstraints = (NSArray *)v62;

    v64 = v18->_auxiliaryButtonConstrainingConstraints;
    if (v118) {
      [MEMORY[0x1E4F28DC8] activateConstraints:v64];
    }
    else {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v64];
    }
    v65 = (void *)MEMORY[0x1E4F28DC8];
    v66 = _NSDictionaryOfVariableBindings(&cfstr_CancelbuttonEm.isa, v18->_cancelButton, v18->_emergencyCallButton, 0);
    v67 = [v65 constraintsWithVisualFormat:@"[_emergencyCallButton]-(>=10)-[_cancelButton]" options:0x10000 metrics:0 views:v66];
    [v65 activateConstraints:v67];

    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = _NSDictionaryOfVariableBindings(&cfstr_Backspacebutto.isa, v18->_backspaceButton, v18->_emergencyCallButton, 0);
    v70 = [v68 constraintsWithVisualFormat:@"[_emergencyCallButton]-(>=10)-[_backspaceButton]" options:0x10000 metrics:0 views:v69];
    [v68 activateConstraints:v70];

    v71 = [(SBUIButton *)v18->_cancelButton firstBaselineAnchor];
    v72 = [(SBUIButton *)v18->_emergencyCallButton firstBaselineAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v73 setActive:1];

    v74 = [(SBUIButton *)v18->_backspaceButton firstBaselineAnchor];
    v75 = [(SBUIButton *)v18->_emergencyCallButton firstBaselineAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v76 setActive:1];

    [(SBUIPasscodeLockNumberPad *)v18 _auxiliaryButtonCenteringOffset];
    double v78 = v77;
    v79 = [(SBUIButton *)v18->_emergencyCallButton centerXAnchor];
    v80 = [*p_numberPad leftAnchor];
    uint64_t v81 = [v79 constraintEqualToAnchor:v80 constant:v78];
    emergencyButtonConstraintCenterX = v18->_emergencyButtonConstraintCenterX;
    v18->_emergencyButtonConstraintCenterX = (NSLayoutConstraint *)v81;

    LODWORD(v83) = 1144750080;
    [(NSLayoutConstraint *)v18->_emergencyButtonConstraintCenterX setPriority:v83];
    [(NSLayoutConstraint *)v18->_emergencyButtonConstraintCenterX setActive:1];
    v84 = [(SBUIButton *)v18->_cancelButton centerXAnchor];
    v85 = [*p_numberPad rightAnchor];
    double v86 = -v78;
    uint64_t v87 = [v84 constraintEqualToAnchor:v85 constant:v86];
    cancelButtonConstraintCenterX = v18->_cancelButtonConstraintCenterX;
    v18->_cancelButtonConstraintCenterX = (NSLayoutConstraint *)v87;

    LODWORD(v89) = 1144750080;
    [(NSLayoutConstraint *)v18->_cancelButtonConstraintCenterX setPriority:v89];
    [(NSLayoutConstraint *)v18->_cancelButtonConstraintCenterX setActive:1];
    v90 = [(SBUIButton *)v18->_backspaceButton centerXAnchor];
    v91 = [*p_numberPad rightAnchor];
    uint64_t v92 = [v90 constraintEqualToAnchor:v91 constant:v86];
    backspaceButtonConstraintCenterX = v18->_backspaceButtonConstraintCenterX;
    v18->_backspaceButtonConstraintCenterX = (NSLayoutConstraint *)v92;

    LODWORD(v94) = 1144750080;
    [(NSLayoutConstraint *)v18->_backspaceButtonConstraintCenterX setPriority:v94];
    [(NSLayoutConstraint *)v18->_backspaceButtonConstraintCenterX setActive:1];
    v95 = [MEMORY[0x1E4F42D90] mainScreen];
    [v95 bounds];
    double Height = CGRectGetHeight(v130);
    v97 = [MEMORY[0x1E4F42D90] mainScreen];
    [v97 bounds];
    BOOL v98 = Height >= CGRectGetWidth(v131);

    v99 = [*p_numberPad buttons];
    v100 = [v99 objectAtIndex:9];

    id v101 = *p_numberPad;
    [v100 frame];
    objc_msgSend(v101, "convertRect:toView:", v18);
    UIRectGetCenter();
    double v103 = v102;
    [MEMORY[0x1E4FA5F68] pinNumberPadAncillaryButtonOffset:v98];
    double v105 = v103 + v104;
    v106 = [(SBUIButton *)v18->_cancelButton centerYAnchor];
    v107 = [*p_numberPad topAnchor];
    v108 = [v106 constraintEqualToAnchor:v107 constant:v105];
    [v108 setActive:1];

    [(SBUIPasscodeLockNumberPad *)v18 setAncillaryButtonOffset:v105];
    v18->_showsCancelButton = 1;
    v18->_showsBackspaceButton = 0;
    v18->_showsEmergencyCallButton = 1;
    [(SBUIPasscodeLockNumberPad *)v18 _configureAdditionalButtons];
    v109 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v18];
    [(SBUIPasscodeLockNumberPad *)v18 addInteraction:v109];
    v9 = v111;
    [(SBNumberPadWithDelegate *)v111 setDelegate:v18];
    [(SBNumberPadWithDelegate *)v111 setMultipleTouchEnabled:0];
    [(SBNumberPadWithDelegate *)v111 addTarget:v18 action:sel__numberPadTouchDown_forEvent_ forControlEvents:1];
    [(SBNumberPadWithDelegate *)v111 addTarget:v18 action:sel__numberPadTouchUp_forEvent_ forControlEvents:192];
    [(SBNumberPadWithDelegate *)v111 addTarget:v18 action:sel__numberPadTouchCancelled_forEvent_ forControlEvents:256];
    [(SBNumberPadWithDelegate *)v111 addTarget:v18 action:sel__numberPadTouchDrag_forEvent_ forControlEvents:12];

    id v5 = v112;
  }

  return v18;
}

- (void)setDelegate:(id)a3
{
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    [(SBUIPasscodeLockNumberPad *)self _configureAdditionalButtons];
  }
}

- (void)setShowsBackspaceButton:(BOOL)a3
{
  if (self->_showsBackspaceButton != a3)
  {
    self->_showsBackspaceButton = a3;
    [(SBUIPasscodeLockNumberPad *)self _configureAdditionalButtons];
  }
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  if (self->_showsEmergencyCallButton != a3)
  {
    self->_showsEmergencyCallButton = a3;
    [(SBUIPasscodeLockNumberPad *)self _configureAdditionalButtons];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBUIPasscodeLockNumberPad;
  [(SBUIPasscodeLockNumberPad *)&v21 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(SBUIPasscodeLockNumberPad *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      backspaceButton = self->_backspaceButton;
      v22[0] = self->_cancelButton;
      v22[1] = backspaceButton;
      v22[2] = self->_emergencyCallButton;
      double v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 3, 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) titleLabel];
            double v16 = [(SBUIPasscodeLockNumberPad *)self _fontForAncillaryButton];
            [v15 setFont:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v12);
      }

      [(SBUIPasscodeLockNumberPad *)self setNeedsLayout];
    }
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  if (self->_visible != a3)
  {
    BOOL v4 = a4;
    self->_visible = a3;
    BOOL v89 = a4;
    uint64_t v81 = self;
    if (a3)
    {
      id v5 = [(TPNumberPad *)self->_numberPad buttons];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v85 = v5;
      uint64_t v7 = [v5 count];
      if ((unint64_t)(v7 + 2) >= 3)
      {
        uint64_t v8 = 0;
        if ((v7 + 2) / 3uLL <= 1) {
          unint64_t v9 = 1;
        }
        else {
          unint64_t v9 = (v7 + 2) / 3uLL;
        }
        unint64_t v82 = v9;
        do
        {
          double v10 = objc_msgSend(v85, "subarrayWithRange:", v8, 3, v81);
          [v6 insertObject:v10 atIndex:0];

          v8 += 3;
          --v9;
        }
        while (v9);
        unint64_t v11 = 0;
        uint64_t v86 = *MEMORY[0x1E4F39D98];
        uint64_t v12 = (long long *)MEMORY[0x1E4F39B10];
        uint64_t v13 = (long long *)MEMORY[0x1E4F1DAB8];
        BOOL v14 = v89;
        id v83 = v6;
        uint64_t v15 = *MEMORY[0x1E4F39F98];
        do
        {
          uint64_t v16 = 3;
          if (v11 < 3) {
            uint64_t v16 = v11;
          }
          long long v17 = (double *)((char *)&setVisible_animated__rowParametersIn + 24 * v16);
          double v18 = *v17;
          double v19 = v17[1];
          double v20 = v17[2];
          unint64_t v84 = v11;
          objc_super v21 = objc_msgSend(v6, "objectAtIndexedSubscript:");
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          obuint64_t j = v21;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v115 objects:v126 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v116;
            uint64_t v87 = *(void *)v116;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v116 != v24) {
                  objc_enumerationMutation(obj);
                }
                v26 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                if (v14)
                {
                  v27 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
                  uint64_t v28 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
                  [v27 setMass:1.0];
                  [v27 setBeginTime:v20];
                  [v27 setBeginTimeMode:v86];
                  [v27 setStiffness:v18];
                  [v27 setDamping:v19];
                  [v27 setDuration:2.0];
                  [v27 setFillMode:v15];
                  v29 = (void *)MEMORY[0x1E4F29238];
                  CATransform3DMakeScale(&v114, 0.0, 0.0, 1.0);
                  v30 = [v29 valueWithCATransform3D:&v114];
                  [v27 setFromValue:v30];

                  long long v31 = v12[5];
                  long long v110 = v12[4];
                  long long v111 = v31;
                  long long v32 = v12[7];
                  long long v112 = v12[6];
                  long long v113 = v32;
                  long long v33 = v12[1];
                  long long v106 = *v12;
                  long long v107 = v33;
                  long long v34 = v12[3];
                  long long v108 = v12[2];
                  long long v109 = v34;
                  v35 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v106];
                  [v27 setToValue:v35];

                  [v28 setMass:1.0];
                  [v28 setBeginTime:v20];
                  [v28 setBeginTimeMode:v86];
                  [v28 setStiffness:v18];
                  [v28 setDamping:v19];
                  [v28 setDuration:2.0];
                  [v28 setFillMode:v15];
                  [v28 setFromValue:&unk_1EFCEAE28];
                  [v28 setToValue:&unk_1EFCEAE38];
                  v36 = [MEMORY[0x1E4F39B38] animation];
                  [v36 setDuration:2.0];
                  v125[0] = v27;
                  v125[1] = v28;
                  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
                  [v36 setAnimations:v37];

                  [v36 setFillMode:v15];
                  CAFrameRateRange v128 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
                  objc_msgSend(v36, "setPreferredFrameRateRange:", *(double *)&v128.minimum, *(double *)&v128.maximum, *(double *)&v128.preferred);
                  [v36 setHighFrameRateReason:1114125];
                  uint64_t v38 = [v26 layer];
                  [v38 removeAnimationForKey:@"numberPadButton"];

                  uint64_t v39 = [v26 layer];
                  [v39 addAnimation:v36 forKey:@"numberPadButton"];

                  BOOL v14 = v89;
                  uint64_t v13 = (long long *)MEMORY[0x1E4F1DAB8];
                  uint64_t v24 = v87;
                }
                long long v40 = v13[1];
                long long v106 = *v13;
                long long v107 = v40;
                long long v108 = v13[2];
                [v26 setTransform:&v106];
                [v26 setAlpha:1.0];
              }
              uint64_t v23 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
            }
            while (v23);
          }

          id v6 = v83;
          unint64_t v11 = v84 + 1;
        }
        while (v84 + 1 != v82);
      }
      cancelButton = v81->_cancelButton;
      emergencyCallButton = v81->_emergencyCallButton;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v123[0] = cancelButton;
      v123[1] = emergencyCallButton;
      v43 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v123, 2, v81);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v102 objects:v124 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v103;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v103 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = [*(id *)(*((void *)&v102 + 1) + 8 * j) layer];
            [v48 removeAnimationForKey:@"sideButtonsOpacity"];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v102 objects:v124 count:16];
        }
        while (v45);
      }
    }
    else
    {
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id obja = [(TPNumberPad *)self->_numberPad buttons];
      uint64_t v49 = [obja countByEnumeratingWithState:&v98 objects:v122 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v99;
        uint64_t v52 = *MEMORY[0x1E4F39F98];
        double v53 = (long long *)MEMORY[0x1E4F39B10];
        uint64_t v88 = *(void *)v99;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v99 != v51) {
              objc_enumerationMutation(obja);
            }
            v55 = *(void **)(*((void *)&v98 + 1) + 8 * k);
            if (v4)
            {
              [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
              v57 = uint64_t v56 = v50;
              v58 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
              [v57 setMass:1.0];
              [v57 setStiffness:341.02];
              [v57 setDamping:36.93];
              [v57 setDuration:2.0];
              [v57 setFillMode:v52];
              long long v59 = v53[5];
              long long v110 = v53[4];
              long long v111 = v59;
              long long v60 = v53[7];
              long long v112 = v53[6];
              long long v113 = v60;
              long long v61 = v53[1];
              long long v106 = *v53;
              long long v107 = v61;
              long long v62 = v53[3];
              long long v108 = v53[2];
              long long v109 = v62;
              v63 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v106];
              [v57 setFromValue:v63];

              v64 = (void *)MEMORY[0x1E4F29238];
              CATransform3DMakeScale(&v97, 0.0, 0.0, 1.0);
              v65 = [v64 valueWithCATransform3D:&v97];
              [v57 setToValue:v65];

              [v58 setMass:1.0];
              [v58 setStiffness:341.02];
              [v58 setDamping:36.93];
              [v58 setDuration:2.0];
              [v58 setFillMode:v52];
              [v58 setFromValue:&unk_1EFCEAE38];
              [v58 setToValue:&unk_1EFCEAE28];
              v66 = [MEMORY[0x1E4F39B38] animation];
              [v66 setDuration:2.0];
              v121[0] = v57;
              v121[1] = v58;
              v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
              [v66 setAnimations:v67];

              [v66 setFillMode:v52];
              CAFrameRateRange v129 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
              objc_msgSend(v66, "setPreferredFrameRateRange:", *(double *)&v129.minimum, *(double *)&v129.maximum, *(double *)&v129.preferred);
              [v66 setHighFrameRateReason:1114125];
              v68 = [v55 layer];
              [v68 removeAnimationForKey:@"numberPadButton"];

              v69 = [v55 layer];
              [v69 addAnimation:v66 forKey:@"numberPadButton"];

              BOOL v4 = v89;
              uint64_t v50 = v56;
              uint64_t v51 = v88;
            }
            CGAffineTransformMakeScale(&v96, 0.0, 0.0);
            [v55 setTransform:&v96];
            [v55 setAlpha:0.0];
          }
          uint64_t v50 = [obja countByEnumeratingWithState:&v98 objects:v122 count:16];
        }
        while (v50);
      }

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v70 = v81->_emergencyCallButton;
      v119[0] = v81->_cancelButton;
      v119[1] = v70;
      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
      uint64_t v72 = [v71 countByEnumeratingWithState:&v92 objects:v120 count:16];
      if (!v72) {
        goto LABEL_47;
      }
      uint64_t v73 = v72;
      id v85 = v71;
      uint64_t v74 = *(void *)v93;
      uint64_t v75 = *MEMORY[0x1E4F39F98];
      do
      {
        for (uint64_t m = 0; m != v73; ++m)
        {
          if (*(void *)v93 != v74) {
            objc_enumerationMutation(v85);
          }
          double v77 = *(void **)(*((void *)&v92 + 1) + 8 * m);
          double v78 = objc_msgSend(MEMORY[0x1E4F39C90], "animationWithKeyPath:", @"opacity", v81);
          [v78 setMass:1.0];
          [v78 setStiffness:1393.0];
          [v78 setDamping:74.0];
          [v78 setDuration:2.0];
          [v78 setFillMode:v75];
          [v78 setFromValue:&unk_1EFCEAE38];
          [v78 setToValue:&unk_1EFCEAE28];
          v79 = [v77 layer];
          [v79 removeAnimationForKey:@"sideButtonsOpacity"];

          v80 = [v77 layer];
          [v80 addAnimation:v78 forKey:@"sideButtonsOpacity"];
        }
        uint64_t v73 = [v85 countByEnumeratingWithState:&v92 objects:v120 count:16];
      }
      while (v73);
    }
    v71 = v85;
LABEL_47:
  }
}

- (void)_numberPadTouchDown:(id)a3 forEvent:(id)a4
{
  numberPad = self->_numberPad;
  id v6 = a4;
  uint64_t v7 = [v6 touchesForView:numberPad];
  id v11 = [v7 anyObject];

  uint64_t v8 = self->_numberPad;
  [v11 locationInView:v8];
  unint64_t v9 = -[SBNumberPadWithDelegate buttonForPoint:forEvent:](v8, "buttonForPoint:forEvent:", v6);

  if (v9)
  {
    [(SBUIPasscodeLockNumberPad *)self setDownButton:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setHighlighted:1];
    }
    double v10 = [(SBUIPasscodeLockNumberPad *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 passcodeLockNumberPad:self keyDown:v9];
    }
  }
  [(SBUIPasscodeLockNumberPad *)self _setSnapshotsDisabled:1];
}

- (void)_numberPadTouchUp:(id)a3 forEvent:(id)a4
{
  id v5 = a4;
  if (self->_downButton)
  {
    id v11 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBUIPasscodeNumberPadButton *)self->_downButton setHighlighted:0];
    }
    id v6 = [v11 touchesForView:self->_numberPad];
    uint64_t v7 = [v6 anyObject];

    numberPad = self->_numberPad;
    [v7 locationInView:numberPad];
    BOOL v9 = -[SBNumberPadWithDelegate touchAtPoint:isCloseToButton:](numberPad, "touchAtPoint:isCloseToButton:", self->_downButton);
    double v10 = [(SBUIPasscodeLockNumberPad *)self delegate];
    if (v9)
    {
      if (objc_opt_respondsToSelector()) {
        [v10 passcodeLockNumberPad:self keyUp:self->_downButton];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v10 passcodeLockNumberPad:self keyCancelled:self->_downButton];
    }
    [(SBUIPasscodeLockNumberPad *)self setDownButton:0];

    id v5 = v11;
  }
}

- (void)_numberPadTouchCancelled:(id)a3 forEvent:(id)a4
{
  if (self->_downButton)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBUIPasscodeNumberPadButton *)self->_downButton setHighlighted:0];
    }
    id v5 = [(SBUIPasscodeLockNumberPad *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 passcodeLockNumberPad:self keyCancelled:self->_downButton];
    }
    [(SBUIPasscodeLockNumberPad *)self setDownButton:0];
  }
}

- (void)_numberPadTouchDrag:(id)a3 forEvent:(id)a4
{
  if (self->_downButton)
  {
    id v5 = [a4 touchesForView:self->_numberPad];
    id v8 = [v5 anyObject];

    numberPad = self->_numberPad;
    [v8 locationInView:numberPad];
    uint64_t v7 = -[SBNumberPadWithDelegate touchAtPoint:isCloseToButton:](numberPad, "touchAtPoint:isCloseToButton:", self->_downButton);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SBUIPasscodeNumberPadButton *)self->_downButton setHighlighted:v7];
    }
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  [a4 location];
  id v8 = -[SBNumberPadWithDelegate buttonForPoint:forEvent:](self->_numberPad, "buttonForPoint:forEvent:", 0);
  BOOL v9 = v8;
  if (v8)
  {
    double v10 = (void *)MEMORY[0x1E4F42CB0];
    [v8 frame];
    objc_msgSend(v10, "regionWithRect:identifier:", v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v7;
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "identifier", a3);
  id v5 = off_1E5CCBB30;
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (id v5 = &off_1E5CCBB58,
        self,
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_isKindOfClass(),
        v8,
        (v9 & 1) != 0))
  {
    [(__objc2_class *)*v5 _numberPadButtonOuterCircleDiameter];
  }
  uint64_t v10 = objc_opt_class();
  id v11 = v4;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13 && (BSFloatIsOne() & 1) == 0)
  {
    [v13 bounds];
    UIRectCenteredRect();
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:");
    uint64_t v16 = [MEMORY[0x1E4F42CB8] shapeWithPath:v15];
    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v13];
    double v18 = [MEMORY[0x1E4F42CA8] effectWithPreview:v17];
    BOOL v14 = [MEMORY[0x1E4F42CC0] styleWithEffect:v18 shape:v16];
  }
  else
  {
    BOOL v14 = [MEMORY[0x1E4F42CC0] systemPointerStyle];
  }
  objc_msgSend(v14, "set_suppressesMirroring:", 1);

  return v14;
}

+ (CGSize)_inputButtonCircleSize
{
  +[SBPasscodeNumberPadButton _numberPadButtonOuterCircleDiameter];
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)_inputButtonCircleSpacing
{
  +[SBPasscodeNumberPadButton paddingOutsideRing];
  result.right = v5;
  result.bottouint64_t m = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_distanceToTopOfFirstButton
{
  +[SBPasscodeNumberPadButton paddingOutsideRing];
  return result;
}

- (void)setReduceTransparencyButtonColor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = (UIColor *)a3;
  p_reduceTransparencyButtonColor = &self->_reduceTransparencyButtonColor;
  if (self->_reduceTransparencyButtonColor != v5)
  {
    objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(TPNumberPad *)self->_numberPad buttons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 setReduceTransparencyButtonColor:*p_reduceTransparencyButtonColor];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)_setSnapshotsDisabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_snapshotsDisabled != a3)
  {
    self->_snapshotsDisabled = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v4 = [(TPNumberPad *)self->_numberPad buttons];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 layer];
          int v11 = [v10 disableUpdateMask];

          uint64_t v12 = v11 & 0xFFFFFFFD | (2 * self->_snapshotsDisabled);
          long long v13 = [v9 layer];
          [v13 setDisableUpdateMask:v12];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (id)_fontForAncillaryButton
{
  double v2 = (void *)MEMORY[0x1E4F42A30];
  double v3 = SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E4F43780], 16.0);
  return (id)[v2 systemFontOfSize:v3];
}

- (void)_configureAdditionalButtons
{
  cancelButton = self->_cancelButton;
  BOOL v4 = !self->_showsCancelButton || self->_showsBackspaceButton;
  [(SBUIButton *)cancelButton setHidden:v4];
  [(SBUIButton *)self->_backspaceButton setHidden:!self->_showsBackspaceButton];
  [(SBUIButton *)self->_emergencyCallButton setHidden:!self->_showsEmergencyCallButton];
  [(SBUIButton *)self->_emergencyCallButton setExclusiveTouch:1];
  [(SBUIPasscodeLockNumberPad *)self _updateAuxiliaryButtonConstraints];
}

- (void)_cancelButtonHit
{
  id v3 = [(SBUIPasscodeLockNumberPad *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockNumberPadCancelButtonHit:self];
  }
}

- (void)_backspaceButtonHit
{
  id v3 = [(SBUIPasscodeLockNumberPad *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockNumberPadBackspaceButtonHit:self];
  }
}

- (void)_emergencyCallButtonHit
{
  id v3 = [(SBUIPasscodeLockNumberPad *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 passcodeLockNumberPadEmergencyCallButtonHit:self];
  }
}

- (BOOL)_holdsAuxiliaryButtonsWithinPadBounds
{
  unint64_t v2 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 5;
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v2 < 0xFFFFFFFFFFFFFFFELL;
}

- (double)_auxiliaryButtonCenteringOffset
{
  BOOL v3 = [(SBUIPasscodeLockNumberPad *)self _holdsAuxiliaryButtonsWithinPadBounds];
  [(SBNumberPadWithDelegate *)self->_numberPad frame];
  double Width = CGRectGetWidth(v7);
  double v5 = -24.0;
  if (v3) {
    double v5 = -6.0;
  }
  return Width / v5;
}

- (void)_updateAuxiliaryButtonConstraints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(SBUIPasscodeLockNumberPad *)self _auxiliaryButtonCenteringOffset];
  double v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_emergencyButtonConstraintCenterX, "setConstant:");
  double v5 = -v4;
  [(NSLayoutConstraint *)self->_cancelButtonConstraintCenterX setConstant:v5];
  [(NSLayoutConstraint *)self->_backspaceButtonConstraintCenterX setConstant:v5];
  BOOL v6 = [(SBUIPasscodeLockNumberPad *)self _holdsAuxiliaryButtonsWithinPadBounds];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CGRect v7 = self->_auxiliaryButtonConstrainingConstraints;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setActive:", v6, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (SBUIPasscodeLockNumberPadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPasscodeLockNumberPadDelegate *)WeakRetained;
}

- (BOOL)showsBackspaceButton
{
  return self->_showsBackspaceButton;
}

- (BOOL)showsEmergencyCallButton
{
  return self->_showsEmergencyCallButton;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (double)ancillaryButtonOffset
{
  return self->_ancillaryButtonOffset;
}

- (void)setAncillaryButtonOffset:(double)a3
{
  self->_ancillaryButtonOffset = a3;
}

- (SBUIPasscodeNumberPadButton)downButton
{
  return self->_downButton;
}

- (void)setDownButton:(id)a3
{
}

- (SBUIButton)emergencyCallButton
{
  return self->_emergencyCallButton;
}

- (SBUIButton)backspaceButton
{
  return self->_backspaceButton;
}

- (SBUIButton)cancelButton
{
  return self->_cancelButton;
}

- (UIColor)reduceTransparencyButtonColor
{
  return self->_reduceTransparencyButtonColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyButtonColor, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_backspaceButton, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auxiliaryButtonConstrainingConstraints, 0);
  objc_storeStrong((id *)&self->_backspaceButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_cancelButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_emergencyButtonConstraintCenterX, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
}

@end