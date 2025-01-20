@interface BFFPasscodeInputView
- (BFFPasscodeInputView)initWithFrame:(CGRect)a3;
- (BFFPasscodeInputViewDelegate)delegate;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)footerButton;
- (UIButton)instructionsLinkButton;
- (UILabel)instructions;
- (UIView)footerView;
- (id)passcode;
- (id)passcodeDisplayView;
- (id)passcodeField;
- (void)_instructionsLinkButtonPressed;
- (void)_layoutForBounds:(CGRect)a3;
- (void)footerButtonPressed;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFooterButton:(id)a3;
- (void)setFooterButtonText:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setInstructionsLinkButton:(id)a3;
- (void)setInstructionsLinkText:(id)a3;
- (void)shakePasscode;
@end

@implementation BFFPasscodeInputView

- (BFFPasscodeInputView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BFFPasscodeInputView;
  v3 = -[BFFPasscodeInputView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    instructions = v3->_instructions;
    v3->_instructions = v4;

    v6 = v3->_instructions;
    v7 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_instructions setNumberOfLines:0];
    [(UILabel *)v3->_instructions setTextAlignment:1];
    [(BFFPasscodeInputView *)v3 addSubview:v3->_instructions];
  }
  return v3;
}

- (id)passcode
{
  return 0;
}

- (id)passcodeDisplayView
{
  return 0;
}

- (void)setFooterView:(id)a3
{
  id v8 = a3;
  v5 = [(BFFPasscodeInputView *)self footerView];
  [v5 removeFromSuperview];

  p_footerView = &self->_footerView;
  if (v8)
  {
    objc_storeStrong((id *)p_footerView, a3);
    id v7 = [(BFFPasscodeInputView *)self footerView];
    [(BFFPasscodeInputView *)self addSubview:v7];
  }
  else
  {
    id v7 = *p_footerView;
    *p_footerView = 0;
  }

  [(BFFPasscodeInputView *)self setNeedsLayout];
}

- (void)setFooterButtonText:(id)a3
{
  id v16 = a3;
  v4 = [(BFFPasscodeInputView *)self footerButton];
  if (v16)
  {

    if (!v4)
    {
      v5 = [MEMORY[0x263F824E8] buttonWithType:1];
      [(BFFPasscodeInputView *)self setFooterButton:v5];

      v6 = [(BFFPasscodeInputView *)self footerButton];
      id v7 = [v6 titleLabel];
      id v8 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v7 setFont:v8];

      objc_super v9 = [(BFFPasscodeInputView *)self footerButton];
      v10 = [v9 titleLabel];
      [v10 setNumberOfLines:0];

      v11 = [(BFFPasscodeInputView *)self footerButton];
      v12 = [v11 titleLabel];
      [v12 setTextAlignment:1];

      v13 = [(BFFPasscodeInputView *)self footerButton];
      [v13 addTarget:self action:sel_footerButtonPressed forControlEvents:64];

      v14 = [(BFFPasscodeInputView *)self footerButton];
      [(BFFPasscodeInputView *)self addSubview:v14];
    }
    v15 = [(BFFPasscodeInputView *)self footerButton];
    [v15 setTitle:v16 forState:0];
  }
  else
  {
    [v4 removeFromSuperview];

    [(BFFPasscodeInputView *)self setFooterButton:0];
  }
}

- (void)footerButtonPressed
{
  uint64_t v3 = [(BFFPasscodeInputView *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(BFFPasscodeInputView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v8 = [(BFFPasscodeInputView *)self delegate];
      id v7 = [(BFFPasscodeInputView *)self footerButton];
      [v8 passcodeInput:self tappedFooterButton:v7];
    }
  }
}

- (void)setInstructionsLinkText:(id)a3
{
  id v18 = a3;
  if (v18)
  {
    v4 = [(BFFPasscodeInputView *)self instructionsLinkButton];

    if (!v4)
    {
      v5 = [MEMORY[0x263F824E8] buttonWithType:1];
      [(BFFPasscodeInputView *)self setInstructionsLinkButton:v5];

      char v6 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      id v7 = [(BFFPasscodeInputView *)self instructionsLinkButton];
      id v8 = [v7 titleLabel];
      [v8 setFont:v6];

      objc_super v9 = [(BFFPasscodeInputView *)self instructionsLinkButton];
      v10 = [v9 titleLabel];
      [v10 setNumberOfLines:0];

      v11 = [(BFFPasscodeInputView *)self instructionsLinkButton];
      v12 = [v11 titleLabel];
      [v12 setTextAlignment:1];

      v13 = [(BFFPasscodeInputView *)self instructionsLinkButton];
      [v13 addTarget:self action:sel__instructionsLinkButtonPressed forControlEvents:64];

      v14 = [(BFFPasscodeInputView *)self instructionsLinkButton];
      [(BFFPasscodeInputView *)self addSubview:v14];
    }
    v15 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    [v15 setTitle:v18 forState:0];
  }
  else
  {
    instructionsLinkButton = self->_instructionsLinkButton;
    if (!instructionsLinkButton) {
      goto LABEL_8;
    }
    [(UIButton *)instructionsLinkButton removeFromSuperview];
    v17 = self->_instructionsLinkButton;
    self->_instructionsLinkButton = 0;
  }
  [(BFFPasscodeInputView *)self setNeedsLayout];
LABEL_8:
}

- (void)_instructionsLinkButtonPressed
{
  uint64_t v3 = [(BFFPasscodeInputView *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(BFFPasscodeInputView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(BFFPasscodeInputView *)self delegate];
      [v7 passcodeInputTappedInstructionsLink:self];
    }
  }
}

- (id)passcodeField
{
  return 0;
}

- (void)_layoutForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(BFFPasscodeInputView *)self instructions];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;

  v13 = [(BFFPasscodeInputView *)self instructions];
  double v14 = BFFRoundToPixel_0((width - v10) * 0.5);
  BOOL v15 = BFFIsiPad();
  double v16 = 13.5;
  if (!v15) {
    double v16 = 15.0;
  }
  objc_msgSend(v13, "setFrame:", v14, v16, v10, v12);

  v17 = [(BFFPasscodeInputView *)self instructionsLinkButton];

  if (v17)
  {
    id v18 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v19 = [v18 titleLabel];
    v20 = [(BFFPasscodeInputView *)self footerButton];
    v21 = [v20 titleLabel];
    objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v21, "numberOfLines"), 0.0, 0.0, width, 1.79769313e308);
    double v23 = v22;
    double v25 = *(double *)&v24;
    id v131 = v24;

    double v26 = BFFRoundToPixel_0((width - v23) * 0.5);
    v27 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    objc_msgSend(v27, "setFrame:", v26, 0.0, v23, v25);

    v28 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    [v28 layoutIfNeeded];

    v29 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    v30 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v31 = [v30 titleLabel];
    [v31 _firstBaselineOffsetFromTop];
    double v33 = v32;
    v34 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    v35 = [v34 titleLabel];
    [v35 frame];
    double v36 = height;
    double v37 = x;
    double v38 = y;
    double v39 = v33 + CGRectGetMinY(v134);

    v40 = [(BFFPasscodeInputView *)self instructions];
    [v40 frame];
    double MaxY = CGRectGetMaxY(v135);
    v42 = [(BFFPasscodeInputView *)self instructions];
    [v42 _baselineOffsetFromBottom];
    double v44 = MaxY - v43;
    [v29 scaledValueForValue:30.0];
    double v46 = v44 + v45 - v39;
    CGFloat y = v38;
    double x = v37;
    double height = v36;

    v47 = [(BFFPasscodeInputView *)self instructionsLinkButton];
    objc_msgSend(v47, "setFrame:", v26, v46, v23, *(double *)&v131);
  }
  v48 = [(BFFPasscodeInputView *)self footerButton];

  if (v48)
  {
    v49 = [(BFFPasscodeInputView *)self footerButton];
    [v49 frame];
    CGFloat v51 = v50;
    CGFloat v53 = v52;

    v54 = [(BFFPasscodeInputView *)self footerButton];
    v55 = [v54 titleLabel];
    v56 = [(BFFPasscodeInputView *)self footerButton];
    v57 = [v56 titleLabel];
    objc_msgSend(v55, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v57, "numberOfLines"), 0.0, 0.0, width, 1.79769313e308);
    double v59 = v58;
    double v61 = v60;

    v136.origin.double x = v51;
    v136.origin.CGFloat y = v53;
    v136.size.double width = v59;
    v136.size.double height = v61;
    CGFloat v62 = CGRectGetWidth(v136);
    double v63 = BFFRoundToPixel_0(x + (width - v62) * 0.5);
    v137.origin.double x = x;
    v137.origin.CGFloat y = y;
    v137.size.double width = width;
    v137.size.double height = height;
    CGFloat v64 = CGRectGetMaxY(v137);
    double v65 = BFFRoundToPixel_0(v64 - v61 + -15.0);
    v66 = [(BFFPasscodeInputView *)self footerButton];
    objc_msgSend(v66, "setFrame:", v63, v65, v59, v61);
  }
  v67 = [(BFFPasscodeInputView *)self footerView];

  if (v67)
  {
    v68 = [(BFFPasscodeInputView *)self footerView];
    LODWORD(v69) = 1112014848;
    LODWORD(v70) = 1132068864;
    objc_msgSend(v68, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, 0.0, v69, v70);
    double v72 = v71;
    double v74 = v73;

    double v75 = BFFRoundToPixel_0((width - v72) * 0.5);
    v76 = [(BFFPasscodeInputView *)self footerButton];

    if (v76)
    {
      v77 = [(BFFPasscodeInputView *)self footerButton];
      [v77 frame];
      double v79 = BFFRoundToPixel_0(v78 - v74 + -10.0);
    }
    else
    {
      v138.origin.double x = x;
      v138.origin.CGFloat y = y;
      v138.size.double width = width;
      v138.size.double height = height;
      CGFloat v80 = CGRectGetMaxY(v138);
      double v79 = BFFRoundToPixel_0(v80 - v74 + -10.0);
    }
    v81 = [(BFFPasscodeInputView *)self footerView];
    objc_msgSend(v81, "setFrame:", v75, v79, v72, v74);

    v82 = [(BFFPasscodeInputView *)self footerView];
    [v82 setNeedsLayout];
  }
  uint64_t v83 = [(BFFPasscodeInputView *)self footerButton];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(BFFPasscodeInputView *)self footerView];

    if (v85)
    {
      v86 = [(BFFPasscodeInputView *)self footerView];
      [v86 frame];
      double v88 = v87;
      double v90 = v89;
      double v92 = v91;
      double v94 = v93;

      v95 = [(BFFPasscodeInputView *)self passcodeDisplayView];
      [v95 frame];
      double v96 = CGRectGetMaxY(v139) + 15.0;

      if (v96 >= v90) {
        double v97 = v96;
      }
      else {
        double v97 = v90;
      }
      double v98 = BFFRoundToPixel_0(v97);
      v99 = [(BFFPasscodeInputView *)self footerView];
      objc_msgSend(v99, "setFrame:", v88, v98, v92, v94);

      v100 = [(BFFPasscodeInputView *)self footerButton];
      [v100 frame];
      double v102 = v101;
      double v104 = v103;
      double v106 = v105;
      double v108 = v107;

      v140.origin.double x = v88;
      v140.origin.CGFloat y = v98;
      v140.size.double width = v92;
      v140.size.double height = v94;
      double v109 = CGRectGetMaxY(v140) + 10.0;
      if (v109 < v104) {
        double v109 = v104;
      }
      goto LABEL_24;
    }
  }
  v110 = [(BFFPasscodeInputView *)self footerButton];

  if (v110)
  {
    v111 = [(BFFPasscodeInputView *)self footerButton];
    [v111 frame];
    double v102 = v112;
    double v114 = v113;
    double v106 = v115;
    double v108 = v116;

    v117 = [(BFFPasscodeInputView *)self passcodeDisplayView];
    [v117 frame];
    double v118 = CGRectGetMaxY(v141);

    if (v118 >= v114) {
      double v109 = v118;
    }
    else {
      double v109 = v114;
    }
LABEL_24:
    double v119 = BFFRoundToPixel_0(v109);
    v120 = [(BFFPasscodeInputView *)self footerButton];
    goto LABEL_25;
  }
  v121 = [(BFFPasscodeInputView *)self footerView];

  if (!v121) {
    return;
  }
  v122 = [(BFFPasscodeInputView *)self footerView];
  [v122 frame];
  double v102 = v123;
  double v125 = v124;
  double v106 = v126;
  double v108 = v127;

  v128 = [(BFFPasscodeInputView *)self passcodeDisplayView];
  [v128 frame];
  double v129 = CGRectGetMaxY(v142);

  if (v129 >= v125) {
    double v130 = v129;
  }
  else {
    double v130 = v125;
  }
  double v119 = BFFRoundToPixel_0(v130);
  v120 = [(BFFPasscodeInputView *)self footerView];
LABEL_25:
  id v132 = v120;
  objc_msgSend(v120, "setFrame:", v102, v119, v106, v108);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BFFPasscodeInputView;
  [(BFFPasscodeInputView *)&v3 layoutSubviews];
  [(BFFPasscodeInputView *)self bounds];
  [(BFFPasscodeInputView *)self _layoutForBounds:"_layoutForBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  -[BFFPasscodeInputView _layoutForBounds:](self, "_layoutForBounds:", 0.0, 0.0, a3.width, a3.height);
  char v6 = [(BFFPasscodeInputView *)self footerButton];
  if (v6
    || ([(BFFPasscodeInputView *)self footerView], (char v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v6 frame];
    double height = CGRectGetMaxY(v10) + 15.0;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(BFFPasscodeInputView *)self passcodeField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)isFirstResponder
{
  v2 = [(BFFPasscodeInputView *)self passcodeField];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)BFFPasscodeInputView;
  [(BFFPasscodeInputView *)&v6 resignFirstResponder];
  char v3 = [(BFFPasscodeInputView *)self passcodeField];
  char v4 = [v3 resignFirstResponder];

  return v4;
}

- (void)shakePasscode
{
  v2 = [(BFFPasscodeInputView *)self passcodeField];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  char v3 = (void *)getCASpringAnimationClass_softClass;
  uint64_t v42 = getCASpringAnimationClass_softClass;
  if (!getCASpringAnimationClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    double v36 = __getCASpringAnimationClass_block_invoke;
    double v37 = &unk_26454AB18;
    double v38 = &v39;
    __getCASpringAnimationClass_block_invoke((uint64_t)&v34);
    char v3 = (void *)v40[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v39, 8);
  v5 = [v4 animationWithKeyPath:@"position.x"];
  [v5 setMass:1.20000005];
  [v5 setStiffness:1200.0];
  [v5 setDamping:12.0];
  id CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
  LODWORD(v7) = 1028389654;
  LODWORD(v8) = 990057071;
  LODWORD(v9) = 1059712716;
  LODWORD(v10) = 1.0;
  double v11 = [CAMediaTimingFunctionClass functionWithControlPoints:v7 :v8 :v9 :v10];
  [v5 setTimingFunction:v11];

  [v5 setDuration:0.666999996];
  [v5 setInitialVelocity:0.0];
  double v12 = getkCAFillModeBackwards();
  [v5 setFillMode:v12];

  v13 = NSNumber;
  double v14 = [v2 layer];
  [v14 position];
  double v16 = v15 + 75.0;
  *(float *)&double v16 = v16;
  v17 = [v13 numberWithFloat:v16];
  [v5 setFromValue:v17];

  id v18 = [v2 layer];
  [v18 addAnimation:v5 forKey:@"spring"];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  v19 = (void *)getCABasicAnimationClass_softClass;
  uint64_t v42 = getCABasicAnimationClass_softClass;
  if (!getCABasicAnimationClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    double v36 = __getCABasicAnimationClass_block_invoke;
    double v37 = &unk_26454AB18;
    double v38 = &v39;
    __getCABasicAnimationClass_block_invoke((uint64_t)&v34);
    v19 = (void *)v40[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v39, 8);
  v21 = [v20 animationWithKeyPath:@"position.x"];
  id v22 = getCAMediaTimingFunctionClass();
  LODWORD(v23) = 1054276898;
  LODWORD(v24) = 1058305108;
  LODWORD(v25) = 1.0;
  double v26 = [v22 functionWithControlPoints:v23 :0.0 :v24 :v25];
  [v21 setTimingFunction:v26];

  [v21 setDuration:0.100000001];
  v27 = getkCAFillModeBackwards();
  [v21 setFillMode:v27];

  v28 = NSNumber;
  v29 = [v2 layer];
  [v29 position];
  double v31 = v30 + -75.0;
  *(float *)&double v31 = v31;
  double v32 = [v28 numberWithFloat:v31];
  [v21 setFromValue:v32];

  double v33 = [v2 layer];
  [v33 addAnimation:v21 forKey:@"force"];
}

- (CGSize)intrinsicContentSize
{
  char v3 = [(BFFPasscodeInputView *)self instructions];
  [v3 frame];
  float MaxY = CGRectGetMaxY(v22);
  float v5 = fmaxf(MaxY, 0.0);

  objc_super v6 = [(BFFPasscodeInputView *)self instructionsLinkButton];
  [v6 frame];
  float v7 = CGRectGetMaxY(v23);
  float v8 = fmaxf(v7, v5);

  double v9 = [(BFFPasscodeInputView *)self footerButton];
  [v9 frame];
  float v10 = CGRectGetMaxY(v24);
  float v11 = fmaxf(v10, v8);

  double v12 = [(BFFPasscodeInputView *)self footerView];
  [v12 frame];
  float v13 = CGRectGetMaxY(v25);
  float v14 = fmaxf(v13, v11);

  double v15 = [(BFFPasscodeInputView *)self passcodeField];
  [v15 frame];
  float v16 = CGRectGetMaxY(v26);
  double v17 = fmaxf(v16, v14);

  [(BFFPasscodeInputView *)self bounds];
  double v19 = v18;
  double v20 = v17;
  result.double height = v20;
  result.CGFloat width = v19;
  return result;
}

- (BFFPasscodeInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BFFPasscodeInputViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
}

- (UIButton)instructionsLinkButton
{
  return self->_instructionsLinkButton;
}

- (void)setInstructionsLinkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsLinkButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end