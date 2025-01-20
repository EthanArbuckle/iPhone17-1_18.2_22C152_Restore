@interface WFApertureIconView
+ (CGSize)opticalAlignmentForSymbol:(id)a3;
+ (id)configurationForSymbol:(id)a3;
+ (id)defaultSymbolConfiguration;
+ (id)downscaledImageForOriginalImage:(id)a3;
+ (id)preferredImageForSymbolName:(id)a3;
- (BOOL)inSiri;
- (BOOL)isEnabled;
- (CALayer)iconBlendedBorderLayer;
- (CGSize)resolution;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)associatedAppBundleIdentifier;
- (UIColor)keyColor;
- (UIColor)keyColorOverride;
- (UIColor)primaryColor;
- (UIColor)symbolColorOverride;
- (UIImageView)iconImageView;
- (UIView)colorView;
- (UIView)colorViewContainer;
- (UIView)iconImageViewContainer;
- (WFApertureIconView)initWithApplicationBundleIdentifier:(id)a3;
- (WFApertureIconView)initWithIcon:(id)a3;
- (WFIcon)icon;
- (id)iconStackPlatterColorForImage:(id)a3;
- (id)symbolColor;
- (int64_t)iconStyle;
- (int64_t)mode;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setBlendedBorderLayerHidden:(BOOL)a3;
- (void)setColorView:(id)a3;
- (void)setColorViewContainer:(id)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3;
- (void)setIcon:(id)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3 associatedAppBundleIdentifier:(id)a4 animated:(BOOL)a5;
- (void)setIconBlendedBorderLayer:(id)a3;
- (void)setIconImage:(id)a3 associatedIcon:(id)a4 style:(int64_t)a5 previousIconStyle:(int64_t)a6 animated:(BOOL)a7;
- (void)setIconImageView:(id)a3;
- (void)setIconImageViewContainer:(id)a3;
- (void)setIconStyle:(int64_t)a3;
- (void)setKeyColorOverride:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setPrimaryColor:(id)a3;
- (void)setResolution:(CGSize)a3;
- (void)setSymbolColorOverride:(id)a3;
@end

@implementation WFApertureIconView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolColorOverride, 0);
  objc_storeStrong((id *)&self->_keyColorOverride, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_colorViewContainer, 0);
  objc_storeStrong((id *)&self->_iconBlendedBorderLayer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImageViewContainer, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (UIColor)symbolColorOverride
{
  return self->_symbolColorOverride;
}

- (UIColor)keyColorOverride
{
  return self->_keyColorOverride;
}

- (void)setIconStyle:(int64_t)a3
{
  self->_iconStyle = a3;
}

- (int64_t)iconStyle
{
  return self->_iconStyle;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setColorView:(id)a3
{
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorViewContainer:(id)a3
{
}

- (UIView)colorViewContainer
{
  return self->_colorViewContainer;
}

- (void)setIconBlendedBorderLayer:(id)a3
{
}

- (CALayer)iconBlendedBorderLayer
{
  return self->_iconBlendedBorderLayer;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageViewContainer:(id)a3
{
}

- (UIView)iconImageViewContainer
{
  return self->_iconImageViewContainer;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setPrimaryColor:(id)a3
{
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setIcon:(id)a3
{
}

- (WFIcon)icon
{
  return self->_icon;
}

- (void)dealloc
{
  v3 = [(WFApertureIconView *)self iconImageView];
  v4 = [v3 layer];
  [v4 removeObserver:self forKeyPath:@"allowsEdgeAntialiasing"];

  v5.receiver = self;
  v5.super_class = (Class)WFApertureIconView;
  [(WFApertureIconView *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFApertureIconView *)self iconImageView];
  uint64_t v12 = [v11 layer];
  if ((id)v12 != v9)
  {
    v13 = (void *)v12;
LABEL_3:

    goto LABEL_4;
  }
  int v14 = [v17 isEqualToString:@"allowsEdgeAntialiasing"];

  if (v14)
  {
    v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    char v16 = [v15 BOOLValue];

    if ((v16 & 1) == 0)
    {
      v11 = [(WFApertureIconView *)self iconImageView];
      v13 = [v11 layer];
      [v13 setAllowsEdgeAntialiasing:1];
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (BOOL)inSiri
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F855C8]];

  return v4;
}

- (void)setSymbolColorOverride:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_symbolColorOverride, a3);
  if ([(WFApertureIconView *)self isEnabled])
  {
    objc_super v5 = [(WFApertureIconView *)self iconImageView];
    [v5 setTintColor:v6];
  }
}

- (id)symbolColor
{
  v3 = [(WFApertureIconView *)self symbolColorOverride];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFApertureIconView *)self primaryColor];
  }
  id v6 = v5;

  return v6;
}

- (void)setKeyColorOverride:(id)a3
{
}

- (UIColor)keyColor
{
  v3 = [(WFApertureIconView *)self keyColorOverride];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFApertureIconView *)self primaryColor];
  }
  id v6 = v5;

  return (UIColor *)v6;
}

- (id)iconStackPlatterColorForImage:(id)a3
{
  id v4 = a3;
  id v5 = [(WFApertureIconView *)self icon];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 bundleIdentifier];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [(WFApertureIconView *)self associatedAppBundleIdentifier];
  }
  id v10 = v9;

  v11 = [(WFApertureIconView *)self primaryColor];
  if ([(WFApertureIconView *)self iconStyle] != 2
    && [(WFApertureIconView *)self iconStyle] != 3
    || !v10
    || !v7 && [(WFApertureIconView *)self iconStyle] == 1)
  {
    goto LABEL_21;
  }
  id v12 = objc_alloc_init(MEMORY[0x263F85160]);
  v13 = [v12 colorsForBundleIdentifier:v10 error:0];
  int v14 = v13;
  if (v13)
  {
    v15 = [v13 backgroundGradient];

    if (v15)
    {
      char v16 = [v14 backgroundGradient];
      id v17 = [v16 baseColor];
      uint64_t v18 = [v17 UIColor];
LABEL_19:

      v11 = (void *)v18;
      goto LABEL_20;
    }
  }
  if (v4)
  {
    char v16 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithPlatformImage:v4];
    id v17 = +[WFJoeColorUtility colorForImage:v16];
    v19 = [v17 UIColor];
    uint64_t v18 = [v19 colorWithAlphaComponent:1.0];

    v11 = v19;
    goto LABEL_19;
  }
LABEL_20:

LABEL_21:
  id v20 = v11;
  Components = CGColorGetComponents((CGColorRef)[v20 CGColor]);
  [v20 _luminance];
  v23 = [MEMORY[0x263F825C8] colorWithRed:(0.5 - v22 + *Components) * 0.3 green:(0.5 - v22 + Components[1]) * 0.3 blue:(0.5 - v22 + Components[2]) * 0.3 alpha:1.0];

  return v23;
}

- (void)setBlendedBorderLayerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFApertureIconView *)self iconBlendedBorderLayer];

  if (!v5 && !v3)
  {
    id v6 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    id v7 = [(WFApertureIconView *)self iconImageView];
    [v7 bounds];
    double v9 = v8;
    id v10 = [(WFApertureIconView *)self iconImageView];
    [v10 bounds];
    -[CALayer setFrame:](v6, "setFrame:", 0.0, 0.0, v9);

    [(CALayer *)v6 setCornerCurve:*MEMORY[0x263F15A20]];
    CGColorRef SRGB = CGColorCreateSRGB(0.247058824, 0.247058824, 0.247058824, 1.0);
    [(CALayer *)v6 setBorderColor:SRGB];
    CFRelease(SRGB);
    [(CALayer *)v6 setCompositingFilter:*MEMORY[0x263F15CB8]];
    iconBlendedBorderLayer = self->_iconBlendedBorderLayer;
    self->_iconBlendedBorderLayer = v6;
  }
  v13 = [(WFApertureIconView *)self iconBlendedBorderLayer];
  int v14 = [v13 superlayer];
  char v15 = (v14 != 0) ^ v3;

  if ((v15 & 1) == 0)
  {
    if (v3)
    {
      id v18 = [(WFApertureIconView *)self iconBlendedBorderLayer];
      [v18 removeFromSuperlayer];
    }
    else
    {
      id v18 = [(WFApertureIconView *)self iconImageView];
      char v16 = [v18 layer];
      id v17 = [(WFApertureIconView *)self iconBlendedBorderLayer];
      [v16 addSublayer:v17];
    }
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_enabled = a3;
  if (a3) {
    [(WFApertureIconView *)self symbolColor];
  }
  else {
  id v6 = objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
  }
  id v7 = v6;
  if (v4)
  {
    double v8 = (void *)MEMORY[0x263F82E00];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__WFApertureIconView_setEnabled_animated___block_invoke;
    v10[3] = &unk_2642A5EC8;
    v10[4] = self;
    id v11 = v6;
    [v8 animateWithDuration:v10 animations:0.2];
  }
  else
  {
    double v9 = [(WFApertureIconView *)self iconImageView];
    [v9 setTintColor:v7];
  }
}

void __42__WFApertureIconView_setEnabled_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  [v2 setTintColor:*(void *)(a1 + 40)];
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(WFApertureIconView *)self mode] != a3)
  {
    self->_mode = a3;
    id v7 = [(WFApertureIconView *)self iconImageViewContainer];
    double v8 = [v7 layer];
    [v8 removeAllAnimations];

    double v9 = [(WFApertureIconView *)self iconImageView];
    id v10 = [v9 layer];
    [v10 removeAllAnimations];

    id v11 = [(WFApertureIconView *)self colorViewContainer];
    id v12 = [v11 layer];
    [v12 removeAllAnimations];

    v13 = [(WFApertureIconView *)self colorView];
    int v14 = [v13 layer];
    [v14 removeAllAnimations];

    char v15 = [(WFApertureIconView *)self iconImageViewContainer];
    char v16 = [v15 layer];
    long long v75 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v95 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v74 = v95;
    long long v96 = v75;
    long long v73 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v97 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v72 = v97;
    long long v98 = v73;
    long long v71 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v93.a = *MEMORY[0x263F15740];
    long long v70 = *(_OWORD *)&v93.a;
    *(_OWORD *)&v93.c = v71;
    long long v69 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v93.tx = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v68 = *(_OWORD *)&v93.tx;
    long long v94 = v69;
    [v16 setTransform:&v93];

    id v17 = [(WFApertureIconView *)self iconImageView];
    id v18 = [v17 layer];
    long long v95 = v74;
    long long v96 = v75;
    long long v97 = v72;
    long long v98 = v73;
    *(_OWORD *)&v93.a = v70;
    *(_OWORD *)&v93.c = v71;
    *(_OWORD *)&v93.tx = v68;
    long long v94 = v69;
    [v18 setTransform:&v93];

    v19 = [(WFApertureIconView *)self colorViewContainer];
    id v20 = [v19 layer];
    long long v95 = v74;
    long long v96 = v75;
    long long v97 = v72;
    long long v98 = v73;
    *(_OWORD *)&v93.a = v70;
    *(_OWORD *)&v93.c = v71;
    *(_OWORD *)&v93.tx = v68;
    long long v94 = v69;
    [v20 setTransform:&v93];

    v21 = [(WFApertureIconView *)self colorView];
    double v22 = [v21 layer];
    long long v95 = v74;
    long long v96 = v75;
    long long v97 = v72;
    long long v98 = v73;
    *(_OWORD *)&v93.a = v70;
    *(_OWORD *)&v93.c = v71;
    *(_OWORD *)&v93.tx = v68;
    long long v94 = v69;
    [v22 setTransform:&v93];

    v23 = [(WFApertureIconView *)self icon];
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    id v25 = v24;

    v26 = [v25 bundleIdentifier];

    if (v26)
    {
      id v27 = v26;
    }
    else
    {
      id v27 = [(WFApertureIconView *)self associatedAppBundleIdentifier];
    }
    v28 = v27;

    if ([(WFApertureIconView *)self iconStyle] != 2
      && [(WFApertureIconView *)self iconStyle] != 3)
    {
      id v41 = 0;
      if (a3 == 1)
      {
LABEL_19:
        v45 = [(WFApertureIconView *)self colorView];
        v46 = [(WFApertureIconView *)self iconStackPlatterColorForImage:v41];
        [v45 setBackgroundColor:v46];

        v47 = [(WFApertureIconView *)self colorView];
        [v47 setHidden:0];

        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __39__WFApertureIconView_setMode_animated___block_invoke_3;
        aBlock[3] = &unk_2642A5EA0;
        aBlock[4] = self;
        v48 = (void (**)(void))_Block_copy(aBlock);
        memset(&v93, 0, sizeof(v93));
        [(WFApertureIconView *)self bounds];
        CGAffineTransformMakeTranslation(&v93, 0.0, v49 * -0.17);
        memset(&v85, 0, sizeof(v85));
        [(WFApertureIconView *)self bounds];
        CGAffineTransformMakeTranslation(&v85, 0.0, v50 * 0.17);
        if (v4)
        {
          dispatch_time_t v51 = dispatch_time(0, 170000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __39__WFApertureIconView_setMode_animated___block_invoke_4;
          block[3] = &unk_2642A58D8;
          block[4] = self;
          v82 = v48;
          CGAffineTransform v83 = v93;
          CGAffineTransform v84 = v85;
          dispatch_after(v51, MEMORY[0x263EF83A0], block);
          v52 = v82;
        }
        else
        {
          v48[2](v48);
          v53 = [(WFApertureIconView *)self iconImageViewContainer];
          CGAffineTransform v80 = v93;
          [v53 setTransform:&v80];

          v52 = [(WFApertureIconView *)self colorViewContainer];
          CGAffineTransform v80 = v85;
          [v52 setTransform:&v80];
        }
LABEL_41:

        return;
      }
LABEL_38:
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __39__WFApertureIconView_setMode_animated___block_invoke_9;
      v79[3] = &unk_2642A5EA0;
      v79[4] = self;
      v66 = (void (**)(void))_Block_copy(v79);
      v48 = v66;
      if (v4)
      {
        v67 = (void *)MEMORY[0x263F82E00];
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        v77[2] = __39__WFApertureIconView_setMode_animated___block_invoke_10;
        v77[3] = &unk_2642A5798;
        v78 = v66;
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __39__WFApertureIconView_setMode_animated___block_invoke_11;
        v76[3] = &unk_2642A5900;
        v76[4] = self;
        [v67 animateWithSpringDuration:4 bounce:v77 initialSpringVelocity:v76 delay:0.5 options:0.0 animations:0.0 completion:0.0];
        v52 = v78;
      }
      else
      {
        v66[2](v66);
        v52 = [(WFApertureIconView *)self colorView];
        [v52 setHidden:1];
      }
      goto LABEL_41;
    }
    if (a3 == 1)
    {
      v29 = [MEMORY[0x263F85308] applicationIconImageForBundleIdentifier:v28 format:0];
      v30 = [v29 UIImage];

      id v31 = objc_alloc(MEMORY[0x263F82828]);
      v32 = [(WFApertureIconView *)self iconImageView];
      [v32 bounds];
      v33 = objc_msgSend(v31, "initWithFrame:");

      [v33 setImage:v30];
      v34 = [v33 layer];
      [v34 setCornerCurve:*MEMORY[0x263F15A20]];

      v35 = [v33 layer];
      v36 = [(WFApertureIconView *)self iconImageView];
      v37 = [v36 layer];
      [v37 cornerRadius];
      objc_msgSend(v35, "setCornerRadius:");

      v38 = [v33 layer];
      [v38 setAllowsEdgeAntialiasing:1];

      [v33 setAlpha:0.0];
      v39 = [(WFApertureIconView *)self iconImageView];
      [v39 addSubview:v33];

      v40 = (void *)MEMORY[0x263F82E00];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __39__WFApertureIconView_setMode_animated___block_invoke;
      v91[3] = &unk_2642A5EA0;
      id v92 = v33;
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __39__WFApertureIconView_setMode_animated___block_invoke_2;
      v87[3] = &unk_2642A5860;
      id v88 = v92;
      v89 = self;
      id v41 = v30;
      id v90 = v41;
      id v42 = v92;
      [v40 animateWithDuration:v91 animations:v87 completion:0.25];
      [(WFApertureIconView *)self setBlendedBorderLayerHidden:0];

      goto LABEL_19;
    }
    v43 = [(WFApertureIconView *)self icon];
    if (v43)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v44 = v43;
      }
      else {
        v44 = 0;
      }
    }
    else
    {
      v44 = 0;
    }
    id v54 = v44;

    v55 = [(WFApertureIconView *)self icon];
    if (v55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v56 = v55;
      }
      else {
        v56 = 0;
      }
    }
    else
    {
      v56 = 0;
    }
    id v57 = v56;

    if (v54
      && ([(WFApertureIconView *)self icon],
          v58 = objc_claimAutoreleasedReturnValue(),
          int v59 = [v58 hasClearBackground],
          v58,
          v59))
    {
      v60 = objc_opt_class();
      v61 = [v54 symbolName];
      id v41 = [v60 preferredImageForSymbolName:v61];

      v62 = [(WFApertureIconView *)self iconImageView];
      [v62 setImage:v41];
    }
    else
    {
      if ([(WFApertureIconView *)self inSiri])
      {
        id v41 = 0;
LABEL_37:
        [(WFApertureIconView *)self setBlendedBorderLayerHidden:1];

        goto LABEL_38;
      }
      v62 = [v57 associatedLogo];
      if (v62)
      {
        v63 = objc_opt_class();
        v64 = [v62 UIImage];
        id v41 = [v63 downscaledImageForOriginalImage:v64];

        v65 = [(WFApertureIconView *)self iconImageView];
        [v65 setImage:v41];
      }
      else
      {
        id v41 = 0;
      }
    }

    goto LABEL_37;
  }
}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __39__WFApertureIconView_setMode_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) iconImageView];
  [v2 setImage:*(void *)(a1 + 48)];
}

void __39__WFApertureIconView_setMode_animated___block_invoke_3(uint64_t a1)
{
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeScale(&v12, 0.76, 0.76, 1.0);
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeRotation(&v11, -0.785398163, 0.0, 0.0, 1.0);
  memset(&v10, 0, sizeof(v10));
  CATransform3DMakeScale(&v10, 1.0, 0.8, 1.0);
  memset(&v9, 0, sizeof(v9));
  CATransform3D a = v11;
  CATransform3D v6 = v10;
  CATransform3DConcat(&b, &a, &v6);
  CATransform3D a = v12;
  CATransform3DConcat(&v9, &a, &b);
  id v2 = [*(id *)(a1 + 32) iconImageView];
  BOOL v3 = [v2 layer];
  CATransform3D a = v9;
  [v3 setTransform:&a];

  BOOL v4 = [*(id *)(a1 + 32) colorView];
  id v5 = [v4 layer];
  CATransform3D a = v9;
  [v5 setTransform:&a];
}

void __39__WFApertureIconView_setMode_animated___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__WFApertureIconView_setMode_animated___block_invoke_5;
  v14[3] = &unk_2642A5798;
  id v15 = *(id *)(a1 + 40);
  [v2 animateWithSpringDuration:4 bounce:v14 initialSpringVelocity:0 delay:0.45 options:0.0 animations:0.0 completion:0.0];
  dispatch_time_t v3 = dispatch_time(0, 60000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v4;
  long long v5 = *(_OWORD *)(a1 + 96);
  long long v10 = *(_OWORD *)(a1 + 80);
  long long v11 = v5;
  long long v6 = *(_OWORD *)(a1 + 128);
  long long v12 = *(_OWORD *)(a1 + 112);
  v7[2] = __39__WFApertureIconView_setMode_animated___block_invoke_6;
  v7[3] = &unk_2642A58B0;
  v7[4] = *(void *)(a1 + 32);
  long long v13 = v6;
  dispatch_after(v3, MEMORY[0x263EF83A0], v7);
}

void __39__WFApertureIconView_setMode_animated___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  dispatch_time_t v3 = [v2 layer];
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v23 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v15 = v23;
  long long v24 = v17;
  long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v25 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v12 = v25;
  long long v26 = v13;
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v19 = *MEMORY[0x263F15740];
  long long v10 = v19;
  long long v20 = v11;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v8 = v21;
  long long v22 = v9;
  [v3 setTransform:&v19];

  long long v4 = [*(id *)(a1 + 32) colorView];
  long long v5 = [v4 layer];
  long long v23 = v15;
  long long v24 = v17;
  long long v25 = v12;
  long long v26 = v13;
  long long v19 = v10;
  long long v20 = v11;
  long long v21 = v8;
  long long v22 = v9;
  [v5 setTransform:&v19];

  long long v6 = [*(id *)(a1 + 32) iconImageViewContainer];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v19 = *MEMORY[0x263F000D0];
  long long v16 = v19;
  long long v20 = v18;
  long long v21 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v14 = v21;
  [v6 setTransform:&v19];

  id v7 = [*(id *)(a1 + 32) colorViewContainer];
  long long v19 = v16;
  long long v20 = v18;
  long long v21 = v14;
  [v7 setTransform:&v19];
}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__WFApertureIconView_setMode_animated___block_invoke_11(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) colorView];
  [v1 setHidden:1];
}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_6(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__WFApertureIconView_setMode_animated___block_invoke_7;
  v7[3] = &unk_2642A5888;
  v7[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 72);
  [MEMORY[0x263F82E00] animateWithSpringDuration:4 bounce:v7 initialSpringVelocity:0 delay:0.55 options:0.5 animations:0.0 completion:0.0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__WFApertureIconView_setMode_animated___block_invoke_8;
  v3[3] = &unk_2642A5888;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v6 = *(_OWORD *)(a1 + 120);
  return [MEMORY[0x263F82E00] animateWithSpringDuration:4 bounce:v3 initialSpringVelocity:0 delay:0.55 options:0.0 animations:0.0 completion:0.0];
}

void __39__WFApertureIconView_setMode_animated___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageViewContainer];
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v4];
}

void __39__WFApertureIconView_setMode_animated___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) colorViewContainer];
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v4];
}

- (void)setMode:(int64_t)a3
{
}

- (void)setIconImage:(id)a3 associatedIcon:(id)a4 style:(int64_t)a5 previousIconStyle:(int64_t)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  v54[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  if (v7)
  {
    if ([(WFApertureIconView *)self mode])
    {
      uint64_t v14 = 1;
    }
    else if (a6 == 1 && a5 == 1)
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke;
  aBlock[3] = &unk_2642A5E40;
  aBlock[4] = self;
  id v16 = v13;
  id v51 = v16;
  int64_t v53 = a5;
  id v17 = v12;
  id v52 = v17;
  long long v18 = (void (**)(void))_Block_copy(aBlock);
  long long v19 = v18;
  switch(v14)
  {
    case 1:
      v32 = (void *)MEMORY[0x263F82E00];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2;
      v48[3] = &unk_2642A5798;
      double v49 = v18;
      [v32 transitionWithView:self duration:5242880 options:v48 animations:0 completion:0.5];
      id v31 = v49;
      goto LABEL_16;
    case 2:
      long long v20 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
      [v20 setName:@"gaussianBlur"];
      [v20 setValue:&unk_26C7D3DD0 forKey:*MEMORY[0x263F15C80]];
      uint64_t v21 = MEMORY[0x263EFFA80];
      [v20 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15C68]];
      [v20 setValue:v21 forKey:*MEMORY[0x263F15C58]];
      [v20 setValue:@"default" forKey:*MEMORY[0x263F15C78]];
      [v20 setValue:@"default" forKey:*MEMORY[0x263F15C60]];
      long long v22 = [(WFApertureIconView *)self iconImageView];
      long long v23 = [v22 layer];
      v54[0] = v20;
      long long v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
      [v23 setFilters:v24];

      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_181;
      v47[3] = &unk_2642A5EA0;
      v47[4] = self;
      [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v47 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.3 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
      dispatch_time_t v25 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_187;
      block[3] = &unk_2642A57E8;
      block[4] = self;
      id v46 = v19;
      dispatch_after(v25, MEMORY[0x263EF83A0], block);

      break;
    case 3:
      long long v36 = *MEMORY[0x263F15740];
      long long v26 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      long long v41 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      long long v42 = v26;
      long long v27 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      long long v43 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      long long v44 = v27;
      long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      long long v39 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      uint64_t v29 = *(void *)(MEMORY[0x263F15740] + 16);
      long long v40 = v28;
      v30 = (void *)MEMORY[0x263F82E00];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_5;
      v35[3] = &unk_2642A5810;
      v35[4] = self;
      uint64_t v37 = v29;
      unint64_t v38 = 0xBF7CAC083126E979;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_6;
      v33[3] = &unk_2642A5838;
      v33[4] = self;
      v34 = v18;
      [v30 animateWithDuration:0x10000 delay:v35 options:v33 animations:0.15 completion:0.0];
      id v31 = v34;
LABEL_16:

      break;
    default:
      v18[2](v18);
      break;
  }
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  [v2 _removeAllRetargetableAnimations:1];

  long long v3 = [*(id *)(a1 + 32) iconImageViewContainer];
  [v3 _removeAllRetargetableAnimations:1];

  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 && *(void *)(a1 + 56) == 1;
  long long v5 = [*(id *)(a1 + 32) iconImageView];
  long long v6 = [v5 layer];
  [v6 setMasksToBounds:v4];

  [*(id *)(a1 + 32) setIconStyle:*(void *)(a1 + 56)];
  BOOL v7 = [*(id *)(a1 + 32) iconImageView];
  [v7 setImage:*(void *)(a1 + 48)];

  long long v8 = [*(id *)(a1 + 32) iconImageView];
  if ([*(id *)(a1 + 32) isEnabled]) {
    [*(id *)(a1 + 32) symbolColor];
  }
  else {
  long long v9 = objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
  }
  [v8 setTintColor:v9];

  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v11 = [*(id *)(a1 + 32) colorView];
  long long v10 = [*(id *)(a1 + 32) iconStackPlatterColorForImage:*(void *)(a1 + 48)];
  [v11 setBackgroundColor:v10];
}

uint64_t __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_181(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  long long v3 = [v2 layer];
  [v3 setValue:&unk_26C7D3DE0 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  BOOL v4 = [*(id *)(a1 + 32) iconImageView];
  [v4 setAlpha:0.0];

  long long v5 = [*(id *)(a1 + 32) iconImageView];
  long long v6 = [v5 layer];
  CATransform3DMakeScale(&v7, 0.87, 0.87, 1.0);
  [v6 setTransform:&v7];
}

uint64_t __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_187(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2_188;
  v5[3] = &unk_2642A5EA0;
  uint64_t v6 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_3;
  _OWORD v4[3] = &unk_2642A57C0;
  v4[4] = v6;
  [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v5 tracking:v4 dampingRatioSmoothing:1.0 responseSmoothing:0.45 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_4;
  v3[3] = &unk_2642A5EA0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v3 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.34 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  [v2 setAlpha:0.4];

  long long v3 = [*(id *)(a1 + 32) iconImageView];
  BOOL v4 = [v3 layer];
  long long v5 = *(_OWORD *)(a1 + 120);
  void v14[4] = *(_OWORD *)(a1 + 104);
  v14[5] = v5;
  long long v6 = *(_OWORD *)(a1 + 152);
  v14[6] = *(_OWORD *)(a1 + 136);
  v14[7] = v6;
  long long v7 = *(_OWORD *)(a1 + 56);
  v14[0] = *(_OWORD *)(a1 + 40);
  v14[1] = v7;
  long long v8 = *(_OWORD *)(a1 + 88);
  v14[2] = *(_OWORD *)(a1 + 72);
  v14[3] = v8;
  [v4 setTransform:v14];

  long long v9 = [*(id *)(a1 + 32) iconImageViewContainer];
  long long v10 = [v9 layer];
  CATransform3DMakeRotation(&a, 1.57079633, 0.0, 1.0, 0.0);
  CATransform3DMakeScale(&v11, 0.94, 0.94, 1.0);
  CATransform3DConcat(&v13, &a, &v11);
  [v10 setTransform:&v13];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([*(id *)(a1 + 32) mode])
  {
    id v7 = [*(id *)(a1 + 32) iconImageView];
    [v7 setAlpha:1.0];
  }
  else
  {
    long long v11 = *MEMORY[0x263F15740];
    uint64_t v12 = *(void *)(MEMORY[0x263F15740] + 16);
    long long v2 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v17 = v2;
    long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v19 = v3;
    long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v15 = v4;
    long long v5 = [*(id *)(a1 + 32) iconImageView];
    long long v6 = [v5 layer];
    uint64_t v13 = 0x3F7CAC083126E979;
    [v6 setTransform:&v11];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_7;
    v10[3] = &unk_2642A5EA0;
    v10[4] = *(void *)(a1 + 32);
    [MEMORY[0x263F82E00] animateWithDuration:v10 animations:0.4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_8;
    v9[3] = &unk_2642A5EA0;
    v9[4] = *(void *)(a1 + 32);
    [MEMORY[0x263F82E00] animateWithSpringDuration:2 bounce:v9 initialSpringVelocity:0 delay:0.9 options:0.5 animations:3.0 completion:0.0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_9;
    v8[3] = &unk_2642A5EA0;
    v8[4] = *(void *)(a1 + 32);
    [MEMORY[0x263F82E00] animateWithSpringDuration:2 bounce:v8 initialSpringVelocity:0 delay:0.9 options:0.6 animations:3.0 completion:0.0];
  }
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) iconImageView];
  [v1 setAlpha:1.0];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) iconImageViewContainer];
  long long v2 = [v1 layer];
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  void v7[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v7[0] = *MEMORY[0x263F15740];
  v7[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v7[3] = v6;
  [v2 setTransform:v7];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_9(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) iconImageView];
  long long v2 = [v1 layer];
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  void v7[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v7[0] = *MEMORY[0x263F15740];
  v7[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v7[3] = v6;
  [v2 setTransform:v7];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2_188(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  id v1 = [v2 layer];
  [v1 setValue:&unk_26C7D3DD0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  id v1 = [v2 layer];
  [v1 setFilters:0];
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconImageView];
  [v2 setAlpha:1.0];

  if (![*(id *)(a1 + 32) mode])
  {
    long long v3 = [*(id *)(a1 + 32) iconImageView];
    long long v4 = [v3 layer];
    long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    void v9[5] = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v9[7] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v9[0] = *MEMORY[0x263F15740];
    v9[1] = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v9[3] = v8;
    [v4 setTransform:v9];
  }
}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  long long v7 = [(WFApertureIconView *)self icon];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    int64_t v9 = [(WFApertureIconView *)self iconStyle];
    id v10 = v6;
    if (v10)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;

      id v14 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
      id v87 = v15;

      id v16 = v14;
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();
      if (v17) {
        long long v18 = v16;
      }
      else {
        long long v18 = 0;
      }
      id v86 = v18;

      id v19 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v20 = v19;
      }
      else {
        long long v20 = 0;
      }
      id v21 = v20;

      int64_t v85 = v9;
      if (isKindOfClass)
      {
        id v22 = objc_alloc_init(MEMORY[0x263F85160]);
        long long v23 = [v19 bundleIdentifier];
        long long v24 = [v22 colorsForBundleIdentifier:v23 error:0];

        id v88 = v21;
        if (v24)
        {
          dispatch_time_t v25 = [v24 backgroundGradient];

          if (v25)
          {
            long long v26 = [v24 backgroundGradient];
            long long v27 = [v26 startColor];
            long long v28 = [v27 UIColor];
            [(WFApertureIconView *)self setPrimaryColor:v28];
LABEL_28:

LABEL_29:
            icon = [v19 associatedLogo];
            if ([(WFApertureIconView *)self inSiri] || !icon)
            {
              uint64_t v48 = v4;
              BOOL v49 = [(WFApertureIconView *)self inSiri];
              uint64_t v50 = 2;
              if (!v49) {
                uint64_t v50 = 0;
              }
              uint64_t v83 = v50;
              v45 = [v19 bundleIdentifier];
              id v51 = [MEMORY[0x263F086E0] mainBundle];
              id v52 = [v51 bundleIdentifier];
              int v53 = [v52 isEqualToString:*MEMORY[0x263F855D0]];

              if (v53)
              {
                id v54 = (void *)MEMORY[0x263F251D0];
                v55 = [v19 bundleIdentifier];
                v56 = [v54 applicationWithBundleIdentifier:v55];

                if ([v56 isHidden])
                {

                  v45 = @"INVALID_BUNDLE_ID";
                }
                uint64_t v4 = v48;
                uint64_t v29 = v86;
              }
              else
              {
                uint64_t v4 = v48;
                uint64_t v29 = v86;
              }
              id v57 = [MEMORY[0x263F85308] applicationIconImageForBundleIdentifier:v45 format:v83];
              id v46 = [v57 UIImage];

              if (!v46)
              {
                long long v73 = getWFGeneralLogObject();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                {
                  long long v74 = [v19 bundleIdentifier];
                  *(_DWORD *)buf = 136315394;
                  long long v97 = "-[WFApertureIconView setIcon:animated:]";
                  __int16 v98 = 2112;
                  v99 = v74;
                  _os_log_impl(&dword_2177E0000, v73, OS_LOG_TYPE_ERROR, "%s Failed to load application icon for bundle ID: %@", buf, 0x16u);
                }
                v66 = v87;
                long long v75 = v88;
                goto LABEL_69;
              }
              int64_t v47 = 1;
            }
            else
            {
              long long v41 = objc_opt_class();
              long long v42 = [icon UIImage];
              long long v43 = [v41 downscaledImageForOriginalImage:v42];

              long long v44 = (void *)MEMORY[0x263F827E8];
              v45 = v43;
              id v46 = objc_msgSend(v44, "imageWithCGImage:", -[__CFString CGImage](v45, "CGImage"));
              int64_t v47 = 3;
              uint64_t v29 = v86;
            }

            id v58 = v19;
            goto LABEL_67;
          }
          v34 = [v24 tintColor];

          if (v34)
          {
            long long v26 = [v24 tintColor];
            long long v27 = [v26 UIColor];
            [(WFApertureIconView *)self setPrimaryColor:v27];
            goto LABEL_29;
          }
        }
        long long v26 = [v87 image];
        long long v27 = +[WFJoeColorUtility colorForImage:v26];
        long long v28 = [v27 UIColor];
        [v28 colorWithAlphaComponent:1.0];
        id v82 = v19;
        id v35 = v6;
        id v36 = v10;
        id v37 = v22;
        v39 = uint64_t v38 = v4;
        [(WFApertureIconView *)self setPrimaryColor:v39];

        uint64_t v4 = v38;
        id v22 = v37;
        id v10 = v36;
        id v6 = v35;
        id v19 = v82;
        goto LABEL_28;
      }
      if (v21)
      {
        uint64_t v29 = v86;
        if ([v19 hasClearBackground])
        {
          [v19 hasClearBackground];
          id v30 = [v21 symbolColor];
          id v31 = [v30 UIColor];
          [(WFApertureIconView *)self setPrimaryColor:v31];
          v32 = v19;
          goto LABEL_64;
        }
LABEL_23:
        v33 = [v29 background];
        unsigned int v84 = v4;
        id v89 = v21;
        if (v33)
        {
          id v30 = v33;
        }
        else
        {
          id v30 = [v21 background];
          if (!v30)
          {
            id v70 = 0;
            goto LABEL_60;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v67 = v30;
        }
        else {
          v67 = 0;
        }
        id v68 = v67;

        id v30 = v30;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v69 = v30;
        }
        else {
          long long v69 = 0;
        }
        id v70 = v69;

        if (v68)
        {
          long long v71 = [v68 color];
          int v72 = 0;
          id v31 = v30;
LABEL_61:
          v76 = [v71 UIColor];
          [(WFApertureIconView *)self setPrimaryColor:v76];

          if (v72)
          {

            long long v71 = v81;
          }

          uint64_t v4 = v84;
          uint64_t v29 = v86;
          v32 = v89;
LABEL_64:

          if (v87)
          {
            id v88 = v32;
            goto LABEL_66;
          }
          if (v32)
          {
            int64_t v9 = v85;
            id v88 = v32;
            if ([v19 hasClearBackground])
            {
              v78 = objc_opt_class();
              v79 = [v32 symbolName];
              CGAffineTransform v80 = [v78 preferredImageForSymbolName:v79];

              int64_t v47 = 2;
              [(WFApertureIconView *)self setIconImage:v80 associatedIcon:v19 style:2 previousIconStyle:v85 animated:v4];

              goto LABEL_46;
            }
          }
          else
          {
            id v88 = 0;
            int64_t v9 = v85;
          }
LABEL_45:
          dispatch_time_t v64 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __39__WFApertureIconView_setIcon_animated___block_invoke;
          block[3] = &unk_2642A5770;
          id v91 = v10;
          id v92 = self;
          int64_t v47 = 1;
          uint64_t v93 = 1;
          int64_t v94 = v9;
          char v95 = v4;
          v65 = (void *)MEMORY[0x263EF83A0];
          dispatch_after(v64, MEMORY[0x263EF83A0], block);

LABEL_46:
          id v19 = 0;
          v66 = 0;
LABEL_68:
          self->_iconStyle = v47;
          v77 = (WFIcon *)v10;
          icon = self->_icon;
          self->_icon = v77;
          long long v75 = v88;
LABEL_69:

          goto LABEL_70;
        }
LABEL_60:
        v81 = [v70 gradient];
        long long v71 = [v81 darkBaseColor];
        id v31 = 0;
        int v72 = 1;
        goto LABEL_61;
      }
      uint64_t v29 = v86;
      if (v17) {
        goto LABEL_23;
      }
      if (v87)
      {
        int v59 = [v87 image];
        v60 = +[WFJoeColorUtility colorForImage:v59];
        v61 = [v60 UIColor];
        v62 = [v61 colorWithAlphaComponent:1.0];
        [(WFApertureIconView *)self setPrimaryColor:v62];

        uint64_t v29 = 0;
        id v88 = 0;
LABEL_66:
        icon = [v19 image];
        id v46 = [icon UIImage];
        id v58 = 0;
        int64_t v47 = 1;
        id v87 = v19;
LABEL_67:

        [(WFApertureIconView *)self setIconImage:v46 associatedIcon:v19 style:v47 previousIconStyle:v85 animated:v4];
        id v19 = v58;
        v66 = v87;
        goto LABEL_68;
      }
    }
    v63 = [MEMORY[0x263F825C8] whiteColor];
    [(WFApertureIconView *)self setPrimaryColor:v63];

    id v88 = 0;
    uint64_t v29 = 0;
    goto LABEL_45;
  }
LABEL_70:
}

void __39__WFApertureIconView_setIcon_animated___block_invoke(uint64_t a1)
{
  +[WFIconViewImageGenerator loadIcon:size:style:](WFIconViewImageGenerator, "loadIcon:size:style:", *(void *)(a1 + 32), 3, 50.0, 50.0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setIconImage:v2 associatedIcon:*(void *)(a1 + 32) style:*(void *)(a1 + 48) previousIconStyle:*(void *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 64)];
}

- (void)setIcon:(id)a3 associatedAppBundleIdentifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(WFApertureIconView *)self setIcon:a3 animated:v5];
  [(WFApertureIconView *)self setAssociatedAppBundleIdentifier:v8];
}

- (void)layoutSubviews
{
  v115[4] = *MEMORY[0x263EF8340];
  v112.receiver = self;
  v112.super_class = (Class)WFApertureIconView;
  [(WFApertureIconView *)&v112 layoutSubviews];
  long long v3 = [(WFApertureIconView *)self iconImageView];
  uint64_t v4 = [v3 layer];
  v115[0] = v4;
  BOOL v5 = [(WFApertureIconView *)self iconImageViewContainer];
  id v6 = [v5 layer];
  v115[1] = v6;
  long long v7 = [(WFApertureIconView *)self colorView];
  id v8 = [v7 layer];
  v115[2] = v8;
  int64_t v9 = [(WFApertureIconView *)self colorViewContainer];
  id v10 = [v9 layer];
  v115[3] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:4];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v108 objects:v114 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v109;
    long long v90 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v92 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v88 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v89 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v86 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v87 = *MEMORY[0x263F15740];
    long long v84 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v85 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v109 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        id v19 = (void *)MEMORY[0x263F08D40];
        if (v18) {
          [*(id *)(*((void *)&v108 + 1) + 8 * i) transform];
        }
        else {
          memset(v107, 0, sizeof(v107));
        }
        long long v20 = objc_msgSend(v19, "valueWithCATransform3D:", v107, v84, v85, v86, v87, v88, v89);
        [v12 addObject:v20];

        long long v103 = v92;
        long long v104 = v90;
        long long v105 = v89;
        long long v106 = v88;
        long long v99 = v87;
        long long v100 = v86;
        long long v101 = v85;
        long long v102 = v84;
        [v18 setTransform:&v99];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v108 objects:v114 count:16];
    }
    while (v15);
  }

  BOOL v21 = [(WFApertureIconView *)self inSiri];
  id v22 = (CGFloat *)MEMORY[0x263F00148];
  if (v21 || ([(WFApertureIconView *)self bounds], v23 > 25.0))
  {
    [(WFApertureIconView *)self bounds];
    double v25 = v24;
    double v27 = v26;
    double v28 = *v22;
    double v29 = v22[1];
  }
  else
  {
    if ([(WFApertureIconView *)self iconStyle] == 2
      && ([(WFApertureIconView *)self icon],
          id v30 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v30,
          (isKindOfClass & 1) != 0))
    {
      v32 = [(WFApertureIconView *)self icon];
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v33 = v32;
        }
        else {
          v33 = 0;
        }
      }
      else
      {
        v33 = 0;
      }
      id v38 = v33;

      long long v39 = [(WFApertureIconView *)self iconImageView];
      [v39 intrinsicContentSize];
      double v25 = v40;
      double v27 = v41;

      [(WFApertureIconView *)self bounds];
      [(WFApertureIconView *)self bounds];
      long long v42 = [(WFApertureIconView *)self traitCollection];
      [v42 displayScale];
      BSPointRoundForScale();

      long long v43 = objc_opt_class();
      long long v44 = [v38 symbolName];

      [v43 opticalAlignmentForSymbol:v44];
      id v37 = [(WFApertureIconView *)self traitCollection];
      [v37 displayScale];
    }
    else
    {
      [(WFApertureIconView *)self iconStyle];
      v34 = [(WFApertureIconView *)self traitCollection];
      [v34 displayScale];
      BSSizeCeilForScale();
      double v25 = v35;
      double v27 = v36;

      [(WFApertureIconView *)self bounds];
      id v37 = [(WFApertureIconView *)self traitCollection];
      [v37 displayScale];
    }
    BSPointRoundForScale();
    double v28 = v45;
    double v29 = v46;
  }
  int64_t v47 = [(WFApertureIconView *)self iconImageViewContainer];
  objc_msgSend(v47, "setFrame:", v28, v29, v25, v27);

  double v93 = v28;
  double v91 = v29;
  if ([(WFApertureIconView *)self iconStyle] == 3)
  {
    int64_t v48 = [(WFApertureIconView *)self mode];
    double v49 = *v22;
    double v50 = v22[1];
    if (!v48)
    {
      v116.origin.double x = *v22;
      v116.origin.double y = v22[1];
      v116.size.double width = v25;
      v116.size.double height = v27;
      CGRect v117 = CGRectInset(v116, -1.0, -1.0);
      double v51 = v27;
      double x = v117.origin.x;
      double y = v117.origin.y;
      double width = v117.size.width;
      double height = v117.size.height;
      v56 = [(WFApertureIconView *)self iconImageView];
      objc_msgSend(v56, "setFrame:", x, y, width, height);
      goto LABEL_29;
    }
  }
  else
  {
    double v49 = *v22;
    double v50 = v22[1];
  }
  v56 = [(WFApertureIconView *)self iconImageView];
  objc_msgSend(v56, "setFrame:", v49, v50, v25, v27);
  double v51 = v27;
LABEL_29:

  id v57 = [(WFApertureIconView *)self iconImageView];
  [v57 bounds];
  v118.origin.double x = v49;
  v118.origin.double y = v50;
  CGRect v119 = CGRectInset(v118, -0.1, -0.1);
  double v58 = v119.origin.x;
  double v59 = v119.origin.y;
  double v60 = v119.size.width;
  double v61 = v119.size.height;
  v62 = [(WFApertureIconView *)self iconBlendedBorderLayer];
  objc_msgSend(v62, "setFrame:", v58, v59, v60, v61);

  v63 = [(WFApertureIconView *)self colorViewContainer];
  objc_msgSend(v63, "setFrame:", v93, v91, v25, v51);

  dispatch_time_t v64 = [(WFApertureIconView *)self colorView];
  objc_msgSend(v64, "setFrame:", v49, v50, v25, v51);

  double v65 = v25 * 0.225;
  v66 = [(WFApertureIconView *)self iconImageView];
  v67 = [v66 layer];
  [v67 setCornerRadius:v65];

  id v68 = [(WFApertureIconView *)self iconBlendedBorderLayer];
  [v68 setCornerRadius:v65];

  long long v69 = [(WFApertureIconView *)self colorView];
  id v70 = [v69 layer];
  [v70 setCornerRadius:v65];

  [(WFApertureIconView *)self bounds];
  double v72 = v71;
  long long v73 = [(WFApertureIconView *)self iconBlendedBorderLayer];
  long long v74 = v73;
  if (v72 <= 25.0)
  {
    long long v75 = [(WFApertureIconView *)self traitCollection];
    [v75 displayScale];
    BSFloatRoundForScale();
    objc_msgSend(v74, "setBorderWidth:");
  }
  else
  {
    [v73 setBorderWidth:0.75];
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v76 = v13;
  uint64_t v77 = [v76 countByEnumeratingWithState:&v95 objects:v113 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v78; ++j)
      {
        if (*(void *)v96 != v79) {
          objc_enumerationMutation(v76);
        }
        v81 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        id v82 = [v12 objectAtIndex:0];
        uint64_t v83 = v82;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        if (v82) {
          [v82 CATransform3DValue];
        }
        v94[4] = v103;
        v94[5] = v104;
        v94[6] = v105;
        v94[7] = v106;
        v94[0] = v99;
        v94[1] = v100;
        v94[2] = v101;
        v94[3] = v102;
        [v81 setTransform:v94];
        [v12 removeObjectAtIndex:0];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v95 objects:v113 count:16];
    }
    while (v78);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (![(WFApertureIconView *)self inSiri])
  {
    id v10 = [(WFApertureIconView *)self icon];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v11 = v10;
      }
      else {
        long long v11 = 0;
      }
    }
    else
    {
      long long v11 = 0;
    }
    id v12 = v11;

    id v13 = [(WFApertureIconView *)self icon];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    if (sizeThatFits__onceToken == -1)
    {
      if (!v12) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_once(&sizeThatFits__onceToken, &__block_literal_global_149);
      if (!v12) {
        goto LABEL_23;
      }
    }
    if ([(WFApertureIconView *)self iconStyle] == 2)
    {
      uint64_t v16 = [v12 symbolName];
      char v17 = unfilledVariantForSymbolName(v16);

      double v9 = 24.0;
      double v7 = 24.0;
      if (([v17 isEqualToString:@"qrcode.viewfinder"] & 1) == 0)
      {
        long long v18 = [(id)objc_opt_class() preferredImageForSymbolName:v17];
        [v18 size];
        double v20 = v19;
        double v9 = v21;

        id v22 = [(id)sizeThatFits__horizontalWidthIncreaseOverrideMapping objectForKeyedSubscript:v17];
        [v22 floatValue];
        double v24 = v23;

        double v7 = v20 + v24;
        if (v7 <= v9)
        {
          if (v7 == v9)
          {
            double v7 = 22.0;
            double v9 = 23.333;
          }
        }
        else
        {
          double v7 = fmin(v7 + 8.0, 28.0);
        }
      }

LABEL_26:
      goto LABEL_27;
    }
LABEL_23:
    double v9 = 24.0;
    double v7 = 27.333;
    if (v15 && [(WFApertureIconView *)self iconStyle] == 3)
    {
      double v25 = (void *)sizeThatFits__horizontalWidthIncreaseOverrideMapping;
      double v26 = [v15 bundleIdentifier];
      double v27 = [v25 objectForKeyedSubscript:v26];
      [v27 floatValue];
      double v29 = v28;

      double v7 = v29 + 22.0;
      double v9 = 23.333;
    }
    goto LABEL_26;
  }
  v32.receiver = self;
  v32.super_class = (Class)WFApertureIconView;
  -[WFApertureIconView sizeThatFits:](&v32, sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;
LABEL_27:
  double v30 = v7;
  double v31 = v9;
  result.double height = v31;
  result.double width = v30;
  return result;
}

void __35__WFApertureIconView_sizeThatFits___block_invoke()
{
  v5[6] = *MEMORY[0x263EF8340];
  v4[0] = @"square.and.pencil";
  v4[1] = @"music";
  v5[0] = &unk_26C7D3D90;
  v5[1] = &unk_26C7D3DA0;
  uint64_t v0 = *MEMORY[0x263F855D8];
  v4[2] = @"apple.keynote";
  _OWORD v4[3] = v0;
  v5[2] = &unk_26C7D3D90;
  v5[3] = &unk_26C7D3DB0;
  uint64_t v1 = *MEMORY[0x263F85558];
  v4[4] = *MEMORY[0x263F854F8];
  void v4[5] = v1;
  void v5[4] = &unk_26C7D3DC0;
  v5[5] = &unk_26C7D3DC0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  long long v3 = (void *)sizeThatFits__horizontalWidthIncreaseOverrideMapping;
  sizeThatFits__horizontalWidthIncreaseOverrideMapping = v2;
}

- (WFApertureIconView)initWithApplicationBundleIdentifier:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F85148];
  id v5 = a3;
  double v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5];

  double v7 = [(WFApertureIconView *)self initWithIcon:v6];
  if (v7) {
    double v8 = v7;
  }

  return v7;
}

- (WFApertureIconView)initWithIcon:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WFApertureIconView;
  id v5 = -[WFApertureIconView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v6 = v5;
  if (v5)
  {
    v5->_mode = 0;
    v5->_iconStyle = 0;
    uint64_t v7 = [MEMORY[0x263F825C8] systemWhiteColor];
    primaryColor = v6->_primaryColor;
    v6->_primaryColor = (UIColor *)v7;

    v6->_enabled = 1;
    [(WFApertureIconView *)v6 setUserInteractionEnabled:0];
    double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    id v10 = [v9 layer];
    [v10 setAllowsEdgeAntialiasing:1];

    long long v11 = [v9 layer];
    [v11 setShadowRadius:6.0];

    id v12 = [v9 layer];
    LODWORD(v13) = 1051931443;
    [v12 setShadowOpacity:v13];

    [(WFApertureIconView *)v6 addSubview:v9];
    objc_storeStrong((id *)&v6->_iconImageViewContainer, v9);
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    [v14 setContentMode:1];
    id v15 = [v14 layer];
    uint64_t v16 = *MEMORY[0x263F15A20];
    [v15 setCornerCurve:*MEMORY[0x263F15A20]];

    char v17 = [v14 layer];
    [v17 setAllowsEdgeAntialiasing:1];

    [v9 addSubview:v14];
    objc_storeStrong((id *)&v6->_iconImageView, v14);
    long long v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    double v19 = [v18 layer];
    [v19 setAllowsEdgeAntialiasing:1];

    [(WFApertureIconView *)v6 insertSubview:v18 atIndex:0];
    objc_storeStrong((id *)&v6->_colorViewContainer, v18);
    double v20 = objc_opt_new();
    [v20 setHidden:1];
    double v21 = [v20 layer];
    [v21 setCornerCurve:v16];

    id v22 = [v20 layer];
    [v22 setMasksToBounds:1];

    float v23 = [v20 layer];
    [v23 setAllowsEdgeAntialiasing:1];

    [v18 addSubview:v20];
    objc_storeStrong((id *)&v6->_colorView, v20);
    double v24 = [(WFApertureIconView *)v6 iconImageView];
    double v25 = [v24 layer];
    [v25 addObserver:v6 forKeyPath:@"allowsEdgeAntialiasing" options:1 context:0];

    [(WFApertureIconView *)v6 setIcon:v4 animated:0];
    if ([(WFApertureIconView *)v6 inSiri])
    {
      dispatch_time_t v26 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__WFApertureIconView_initWithIcon___block_invoke;
      block[3] = &unk_2642A5EA0;
      double v30 = v6;
      dispatch_after(v26, MEMORY[0x263EF83A0], block);
    }
    double v27 = v6;
  }
  return v6;
}

uint64_t __35__WFApertureIconView_initWithIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMode:1 animated:1];
}

+ (id)downscaledImageForOriginalImage:(id)a3
{
  long long v3 = (void *)MEMORY[0x263F82B60];
  id v4 = a3;
  id v5 = [v3 mainScreen];
  [v5 scale];
  CGFloat v7 = v6;
  v11.double width = 36.0;
  v11.double height = 36.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, v7);

  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, 36.0, 36.0);
  double v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

+ (id)preferredImageForSymbolName:(id)a3
{
  id v4 = unfilledVariantForSymbolName(a3);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__WFApertureIconView_preferredImageForSymbolName___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___UIImage_16__0__NSString_8l;
  aBlock[4] = a1;
  id v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (([&unk_26C7D3DF0 containsObject:v4] & 1) != 0
    || ([v4 stringByAppendingString:@".fill"],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v5[2](v5, v6),
        CGFloat v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    CGFloat v7 = v5[2](v5, v4);
  }

  return v7;
}

id __50__WFApertureIconView_preferredImageForSymbolName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v3 = [(id)objc_opt_class() configurationForSymbol:v2];
  id v4 = (void *)MEMORY[0x263F85308];
  [v3 pointSize];
  double v6 = objc_msgSend(v4, "glyphNamed:pointSize:symbolWeight:scaleFactor:", v2, objc_msgSend(v3, "weight"), v5, 4.0);
  CGFloat v7 = [v6 UIImage];

  if (!v7)
  {
    double v8 = (void *)MEMORY[0x263F827E8];
    double v9 = (void *)MEMORY[0x263F82818];
    [v3 pointSize];
    id v10 = objc_msgSend(v9, "configurationWithPointSize:weight:", 5);
    CGFloat v7 = [v8 _systemImageNamed:v2 withConfiguration:v10];
  }
  return v7;
}

+ (CGSize)opticalAlignmentForSymbol:(id)a3
{
  long long v3 = unfilledVariantForSymbolName(a3);
  if (opticalAlignmentForSymbol__onceToken != -1) {
    dispatch_once(&opticalAlignmentForSymbol__onceToken, &__block_literal_global_120);
  }
  id v4 = [(id)opticalAlignmentForSymbol__opticalAlignmentOverrideMapping objectForKeyedSubscript:v3];
  [v4 CGSizeValue];
  double v6 = v5;
  double v8 = v7;

  if (v6 == *MEMORY[0x263F001B0] && v8 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id v10 = [(id)objc_opt_class() configurationForSymbol:v3];
    [v10 pointSize];
    double v12 = v11;

    +[WFSymbolAlignment absoluteOffsetFor:v3 fontSize:v12];
    double v6 = v13;
    double v8 = v14;
  }

  double v15 = v6;
  double v16 = v8;
  result.double height = v16;
  result.double width = v15;
  return result;
}

void __48__WFApertureIconView_opticalAlignmentForSymbol___block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = @"square.and.pencil";
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1.6, -1.3);
  v11[0] = v0;
  v10[1] = @"music";
  uint64_t v1 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -0.3);
  v11[1] = v1;
  v10[2] = @"apple.pages";
  id v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -0.3);
  v11[2] = v2;
  v10[3] = @"apple.numbers";
  long long v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -1.0);
  v11[3] = v3;
  v10[4] = @"star";
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -0.3);
  v11[4] = v4;
  void v10[5] = @"pin";
  double v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, 1.3);
  v11[5] = v5;
  v10[6] = @"alarm";
  double v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -0.3);
  v11[6] = v6;
  v10[7] = @"rocket";
  double v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 0.0, -0.3);
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  double v9 = (void *)opticalAlignmentForSymbol__opticalAlignmentOverrideMapping;
  opticalAlignmentForSymbol__opticalAlignmentOverrideMapping = v8;
}

+ (id)configurationForSymbol:(id)a3
{
  long long v3 = unfilledVariantForSymbolName(a3);
  if (configurationForSymbol__onceToken != -1) {
    dispatch_once(&configurationForSymbol__onceToken, &__block_literal_global_54);
  }
  id v4 = [(id)configurationForSymbol__symbolConfigurationMapping objectForKeyedSubscript:v3];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    if ([v3 containsString:@".circle"]) {
      +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:19.0];
    }
    else {
    id v6 = [(id)objc_opt_class() defaultSymbolConfiguration];
    }
  }
  double v7 = v6;

  return v7;
}

void __45__WFApertureIconView_configurationForSymbol___block_invoke()
{
  v23[20] = *MEMORY[0x263EF8340];
  v22[0] = @"timer";
  double v21 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:19.0];
  v23[0] = v21;
  v22[1] = @"clock";
  double v20 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:19.0];
  v23[1] = v20;
  v22[2] = @"alarm";
  double v19 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:17.0];
  v23[2] = v19;
  v22[3] = @"doc.viewfinder";
  long long v18 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:17.0];
  v23[3] = v18;
  v22[4] = @"headphones";
  char v17 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:16.0];
  v23[4] = v17;
  v22[5] = @"appletvremote.gen4";
  double v16 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:19.0];
  v23[5] = v16;
  v22[6] = @"apple.podcasts";
  double v15 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:19.0];
  v23[6] = v15;
  v22[7] = @"square.and.pencil";
  double v14 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:19.0];
  v23[7] = v14;
  v22[8] = @"music";
  double v13 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:18.0];
  v23[8] = v13;
  v22[9] = @"apple.freeform";
  double v12 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:17.0];
  v23[9] = v12;
  v22[10] = @"apple.pages";
  uint64_t v0 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:18.0];
  v23[10] = v0;
  v22[11] = @"apple.numbers";
  uint64_t v1 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:17.0];
  v23[11] = v1;
  v22[12] = @"apple.keynote";
  id v2 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:18.0];
  v23[12] = v2;
  v22[13] = @"video";
  long long v3 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:17.0];
  v23[13] = v3;
  v22[14] = @"star";
  id v4 = +[WFApertureSymbolConfiguration configurationWithPointSize:7 weight:17.0];
  v23[14] = v4;
  v22[15] = @"pin";
  double v5 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:17.0];
  v23[15] = v5;
  v22[16] = @"note.text";
  id v6 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:18.0];
  v23[16] = v6;
  v22[17] = @"qrcode.viewfinder";
  double v7 = +[WFApertureSymbolConfiguration configurationWithPointSize:6 weight:19.0];
  v23[17] = v7;
  v22[18] = @"rectangle.grid.2x2";
  uint64_t v8 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:17.0];
  v23[18] = v8;
  v22[19] = @"rocket";
  double v9 = +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:16.0];
  v23[19] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:20];
  double v11 = (void *)configurationForSymbol__symbolConfigurationMapping;
  configurationForSymbol__symbolConfigurationMapping = v10;
}

+ (id)defaultSymbolConfiguration
{
  return +[WFApertureSymbolConfiguration configurationWithPointSize:5 weight:15.0];
}

@end