@interface SKUIStorePagePinnedBackdropDecorationView
- (SKUIStorePagePinnedBackdropDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation SKUIStorePagePinnedBackdropDecorationView

- (SKUIStorePagePinnedBackdropDecorationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIStorePagePinnedBackdropDecorationView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIStorePagePinnedBackdropDecorationView;
  v16 = -[SKUIStorePagePinnedBackdropDecorationView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
    backdropView = v16->_backdropView;
    v16->_backdropView = (_UIBackdropView *)v17;

    [(_UIBackdropView *)v16->_backdropView setAutoresizingMask:18];
    v19 = v16->_backdropView;
    [(SKUIStorePagePinnedBackdropDecorationView *)v16 bounds];
    -[_UIBackdropView setFrame:](v19, "setFrame:");
    [(SKUIStorePagePinnedBackdropDecorationView *)v16 addSubview:v16->_backdropView];
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4FB1FE8], "settingsForStyle:", -[_UIBackdropView style](v16->_backdropView, "style"));
    backdropStyleDefaultSettings = v16->_backdropStyleDefaultSettings;
    v16->_backdropStyleDefaultSettings = (_UIBackdropViewSettings *)v20;

    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIStorePagePinnedBackdropDecorationView *)v16 setBackgroundColor:v22];
  }
  return v16;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  [v4 transitionProgress];
  double v6 = v5;
  unsigned int v7 = [v4 hidesBackdropView];
  if (v6 <= 0.00000011920929) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = [(_UIBackdropView *)self->_backdropView inputSettings];
  uint64_t v10 = [v4 backdropStyle];
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = v10;
    if ([(_UIBackdropView *)self->_backdropView style] != v10)
    {
      [(_UIBackdropView *)self->_backdropView transitionToPrivateStyle:v11];
      objc_msgSend(MEMORY[0x1E4FB1FE8], "settingsForStyle:", -[_UIBackdropView style](self->_backdropView, "style"));
      uint64_t v12 = (_UIBackdropViewSettings *)objc_claimAutoreleasedReturnValue();
      backdropStyleDefaultSettings = self->_backdropStyleDefaultSettings;
      self->_backdropStyleDefaultSettings = v12;
    }
  }
  if (v8 != [(_UIBackdropView *)self->_backdropView isHidden])
  {
    if (!v8 || ([v4 backdropColor], (uint64_t v14 = [(_UIBackdropView *)self->_backdropView setHidden:v8];
    {
      uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
    }
    backgroundView = self->_backgroundView;
    if (!backgroundView)
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(SKUIStorePagePinnedBackdropDecorationView *)self bounds];
      uint64_t v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
      v18 = self->_backgroundView;
      self->_backgroundView = v17;

      [(UIView *)self->_backgroundView setAutoresizingMask:18];
      [(SKUIStorePagePinnedBackdropDecorationView *)self insertSubview:self->_backgroundView atIndex:0];
      backgroundView = self->_backgroundView;
    }
    [(UIView *)backgroundView setHidden:v8 ^ 1];
    [(UIView *)self->_backgroundView setBackgroundColor:v14];
  }
  [(UIView *)self->_backgroundView setAlpha:v6];
  v19 = [(_UIBackdropView *)self->_backdropView groupName];
  double v20 = 1.0 - v6;
  if (1.0 - v6 <= 0.00000011920929)
  {
    uint64_t v22 = objc_msgSend(v4, "backdropGroupName", v20);
    v23 = (void *)v22;
    objc_super v24 = @"_SKUIStorePagePinnedBackdropGroupName";
    if (v22) {
      objc_super v24 = (__CFString *)v22;
    }
    v21 = v24;
  }
  else
  {
    v21 = 0;
  }
  if (v19 != v21 && (-[__CFString isEqualToString:](v19, "isEqualToString:", v21, v20) & 1) == 0) {
    [(_UIBackdropView *)self->_backdropView setGroupName:v21];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings blurRadius];
  double v26 = v25;
  double v27 = v6 * v25;
  [v9 blurRadius];
  double v29 = vabdd_f64(v27, v28);
  if (v29 >= 1.0 || (vabdd_f64(v26, v27) <= 1.0 ? (BOOL v30 = v29 <= 0.00000011920929) : (BOOL v30 = 1), !v30)) {
    [v9 setBlurRadius:v27];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings saturationDeltaFactor];
  double v32 = v6 * v31;
  [v9 saturationDeltaFactor];
  if (vabdd_f64(v32, v33) > 0.00000011920929) {
    [v9 setSaturationDeltaFactor:v32];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings darkeningTintAlpha];
  double v35 = v6 * v34;
  [v9 darkeningTintAlpha];
  if (vabdd_f64(v35, v36) > 0.00000011920929) {
    [v9 setDarkeningTintAlpha:v35];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings grayscaleTintAlpha];
  double v38 = v6 * v37;
  [v9 grayscaleTintAlpha];
  if (vabdd_f64(v38, v39) > 0.00000011920929) {
    [v9 setGrayscaleTintAlpha:v38];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings colorBurnTintAlpha];
  double v41 = v6 * v40;
  [v9 colorBurnTintAlpha];
  if (vabdd_f64(v41, v42) > 0.00000011920929) {
    [v9 setColorBurnTintAlpha:v41];
  }
  [(_UIBackdropViewSettings *)self->_backdropStyleDefaultSettings colorTintAlpha];
  double v44 = v6 * v43;
  [v9 colorTintAlpha];
  if (vabdd_f64(v44, v45) > 0.00000011920929) {
    [v9 setColorTintAlpha:v44];
  }
  v46.receiver = self;
  v46.super_class = (Class)SKUIStorePagePinnedBackdropDecorationView;
  [(SKUIStorePagePinnedBackdropDecorationView *)&v46 applyLayoutAttributes:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropStyleDefaultSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end