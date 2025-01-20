@interface WFCompactDialogAction
+ (id)actionForButton:(id)a3 handler:(id)a4;
- (BOOL)enabled;
- (UIButton)uiButton;
- (WFCompactAppearanceProvider)appearanceProvider;
- (WFDialogButton)dialogButton;
- (id)handler;
- (void)invokeHandler;
- (void)setAppearanceProvider:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setUiButton:(id)a3;
@end

@implementation WFCompactDialogAction

+ (id)actionForButton:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFCompactDialogAction.m", 28, @"Invalid parameter not satisfying: %@", @"dialogButton" object file lineNumber description];
  }
  uint64_t v10 = objc_opt_new();
  v11 = (void *)v10;
  if (v10)
  {
    objc_storeStrong((id *)(v10 + 16), a3);
    uint64_t v12 = [v9 copy];
    v13 = (void *)v11[5];
    v11[5] = v12;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_uiButton, 0);
  objc_storeStrong((id *)&self->_dialogButton, 0);
}

- (id)handler
{
  return self->_handler;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setUiButton:(id)a3
{
}

- (WFDialogButton)dialogButton
{
  return self->_dialogButton;
}

- (void)setAppearanceProvider:(id)a3
{
}

- (void)invokeHandler
{
  v2 = [(WFCompactDialogAction *)self handler];
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (UIButton)uiButton
{
  uiButton = self->_uiButton;
  if (uiButton) {
    goto LABEL_2;
  }
  uint64_t v5 = [(WFCompactDialogAction *)self appearanceProvider];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(WFCompactDialogAction *)self appearanceProvider];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(WFCompactDialogAction *)self appearanceProvider];
      uint64_t v10 = [v9 buttonForWFCompactDialogAction:self];
      v11 = self->_uiButton;
      self->_uiButton = v10;

      uiButton = self->_uiButton;
LABEL_2:
      v3 = uiButton;
      goto LABEL_24;
    }
  }
  uint64_t v12 = (void *)MEMORY[0x263F824E8];
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __33__WFCompactDialogAction_uiButton__block_invoke;
  v90[3] = &unk_2649CB998;
  v90[4] = self;
  v13 = [MEMORY[0x263F823D0] actionWithHandler:v90];
  v14 = [v12 buttonWithType:0 primaryAction:v13];

  v15 = [(WFCompactDialogAction *)self dialogButton];
  v16 = [v15 title];
  [(UIButton *)v14 setTitle:v16 forState:0];

  v17 = [(WFCompactDialogAction *)self dialogButton];
  if ([v17 style] == 1) {
    v18 = (double *)MEMORY[0x263F81828];
  }
  else {
    v18 = (double *)MEMORY[0x263F81840];
  }

  v19 = [(WFCompactDialogAction *)self dialogButton];
  if ([v19 style] == 1) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  uint64_t v20 = [MEMORY[0x263F825C8] whiteColor];
  }
  double v21 = *v18;

  v22 = [MEMORY[0x263F82770] defaultMetrics];
  v23 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
  char v24 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
  v25 = (void *)MEMORY[0x263F81708];
  double v26 = 19.0;
  if ((v24 & 1) == 0) {
    objc_msgSend(v23, "pointSize", 19.0);
  }
  v73 = v23;
  v27 = [v25 systemFontOfSize:v26 weight:v21];
  v28 = [v22 scaledFontForFont:v27];
  v29 = [(UIButton *)v14 titleLabel];
  [v29 setFont:v28];

  v30 = [(UIButton *)v14 titleLabel];
  [v30 setAdjustsFontForContentSizeCategory:1];

  uint64_t v31 = *MEMORY[0x263F83468];
  v32 = [(UIButton *)v14 titleLabel];
  [v32 setMaximumContentSizeCategory:v31];

  [(UIButton *)v14 setTitleColor:v20 forState:0];
  uint64_t v33 = *MEMORY[0x263F15A20];
  v34 = [(UIButton *)v14 layer];
  [v34 setCornerCurve:v33];

  if ([MEMORY[0x263EFFA40] universalPreviewsEnabled]) {
    double v35 = 26.0;
  }
  else {
    double v35 = 25.0;
  }
  v36 = [(UIButton *)v14 layer];
  [v36 setCornerRadius:v35];

  v37 = [(UIButton *)v14 layer];
  [v37 setMasksToBounds:1];

  [(UIButton *)v14 setPointerStyleProvider:&__block_literal_global_15602];
  v38 = [(WFCompactDialogAction *)self dialogButton];
  uint64_t v39 = [v38 style];

  v74 = (void *)v20;
  if (v39 == 1)
  {
    uint64_t v72 = [MEMORY[0x263F824D8] effectWithStyle:1200];
    v40 = [MEMORY[0x263F82DF0] effectForBlurEffect:v72 style:6];
    v41 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v40];
    [(UIButton *)v14 bounds];
    objc_msgSend(v41, "setFrame:");
    [v41 setAutoresizingMask:18];
    [v41 setUserInteractionEnabled:0];
    v42 = [MEMORY[0x263F825C8] blackColor];
    v43 = [v41 contentView];
    [v43 setBackgroundColor:v42];

    [(UIButton *)v14 insertSubview:v41 atIndex:0];
    [(UIButton *)v14 setPointerInteractionEnabled:0];
    v44 = (void *)MEMORY[0x263F823D0];
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __33__WFCompactDialogAction_uiButton__block_invoke_3;
    v87[3] = &unk_2649CB9E0;
    id v45 = v41;
    id v88 = v45;
    v46 = v14;
    v89 = v46;
    v47 = [v44 actionWithHandler:v87];
    [(UIButton *)v46 addAction:v47 forControlEvents:1];

    v48 = (void *)MEMORY[0x263F823D0];
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __33__WFCompactDialogAction_uiButton__block_invoke_5;
    v84[3] = &unk_2649CB9E0;
    id v49 = v45;
    id v85 = v49;
    v50 = v46;
    v86 = v50;
    v51 = [v48 actionWithHandler:v84];
    [(UIButton *)v50 addAction:v51 forControlEvents:16];

    v52 = (void *)MEMORY[0x263F823D0];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __33__WFCompactDialogAction_uiButton__block_invoke_7;
    v81[3] = &unk_2649CB9E0;
    id v82 = v49;
    v53 = v50;
    v83 = v53;
    id v54 = v49;
    v55 = [v52 actionWithHandler:v81];
    [(UIButton *)v53 addAction:v55 forControlEvents:352];

    v56 = (void *)v72;
  }
  else
  {
    v57 = [(WFCompactDialogAction *)self dialogButton];
    uint64_t v58 = [v57 style];

    if (v58 == 2) {
      [MEMORY[0x263F825C8] systemRedColor];
    }
    else {
    v59 = [(UIButton *)v14 tintColor];
    }
    [(UIButton *)v14 setBackgroundColor:v59];

    v60 = (void *)MEMORY[0x263F823D0];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __33__WFCompactDialogAction_uiButton__block_invoke_9;
    v79[3] = &unk_2649CB9E0;
    v79[4] = self;
    v61 = v14;
    v80 = v61;
    v62 = [v60 actionWithHandler:v79];
    [(UIButton *)v61 addAction:v62 forControlEvents:1];

    v63 = (void *)MEMORY[0x263F823D0];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __33__WFCompactDialogAction_uiButton__block_invoke_11;
    v77[3] = &unk_2649CB998;
    v64 = v61;
    v78 = v64;
    v65 = [v63 actionWithHandler:v77];
    [(UIButton *)v64 addAction:v65 forControlEvents:16];

    v66 = (void *)MEMORY[0x263F823D0];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __33__WFCompactDialogAction_uiButton__block_invoke_13;
    v75[3] = &unk_2649CB998;
    v67 = v64;
    v76 = v67;
    v68 = [v66 actionWithHandler:v75];
    [(UIButton *)v67 addAction:v68 forControlEvents:352];

    v56 = v80;
  }

  v69 = self->_uiButton;
  self->_uiButton = v14;
  v70 = v14;

  v3 = self->_uiButton;
LABEL_24:
  return v3;
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeHandler];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_4;
  v3[3] = &unk_2649CC018;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v3 animations:0 completion:0.07];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_6;
  v3[3] = &unk_2649CC018;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v3 animations:0 completion:0.25];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_8;
  v3[3] = &unk_2649CC018;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v3 animations:0 completion:0.25];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_9(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  v3 = [*(id *)(a1 + 32) dialogButton];
  if ([v3 style] == 2) {
    double v4 = 0.0;
  }
  else {
    double v4 = 0.08;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__WFCompactDialogAction_uiButton__block_invoke_10;
  v5[3] = &unk_2649CBF20;
  id v6 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v5 animations:0 completion:v4];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_11(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __33__WFCompactDialogAction_uiButton__block_invoke_12;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.25];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_13(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __33__WFCompactDialogAction_uiButton__block_invoke_14;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.25];
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.699999988];
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.699999988];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) titleLabel];
  [v3 setAlpha:1.0];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 setAlpha:0.5];

  id v3 = [*(id *)(a1 + 40) titleLabel];
  [v3 setAlpha:0.5];
}

void __33__WFCompactDialogAction_uiButton__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 setAlpha:0.5];

  id v3 = [*(id *)(a1 + 40) titleLabel];
  [v3 setAlpha:0.5];
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F82A90] styleWithEffect:a3 shape:0];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  id v5 = [(WFCompactDialogAction *)self uiButton];
  [v5 setEnabled:v3];

  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__WFCompactDialogAction_setEnabled___block_invoke;
    v7[3] = &unk_2649CBF20;
    v7[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0 completion:0.2];
  }
  else
  {
    id v6 = [(WFCompactDialogAction *)self uiButton];
    [v6 setAlpha:0.5];
  }
}

void __36__WFCompactDialogAction_setEnabled___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) uiButton];
  [v1 setAlpha:1.0];
}

@end