@interface SBFolderBackgroundView
+ (CGSize)folderBackgroundSize;
+ (double)cornerRadiusToInsetContent;
- (SBFolderBackgroundView)initWithFrame:(CGRect)a3;
- (SBFolderBackgroundViewDelegate)delegate;
- (id)_tintViewBackgroundColorAtFullAlpha;
- (unint64_t)concreteEffect;
- (unint64_t)currentEffect;
- (unint64_t)effect;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateBackgroundUserInterfaceStyle;
- (void)_updateCurrentEffect;
- (void)layoutSubviews;
- (void)setCurrentEffect:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEffect:(unint64_t)a3;
- (void)updateTintEffectColor;
@end

@implementation SBFolderBackgroundView

- (void)setEffect:(unint64_t)a3
{
  if ([(SBFolderBackgroundView *)self effect] != a3)
  {
    self->_effect = a3;
    [(SBFolderBackgroundView *)self _updateCurrentEffect];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBFolderBackgroundView *)self updateTintEffectColor];
    v5 = obj;
  }
}

- (SBFolderBackgroundView)initWithFrame:(CGRect)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBFolderBackgroundView;
  v3 = -[SBFolderBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__reduceTransparencyChanged name:*MEMORY[0x1E4FB24A8] object:0];

    [(SBFolderBackgroundView *)v3 _reduceTransparencyChanged];
    v5 = self;
    v11[0] = v5;
    v6 = self;
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v8 = (id)[(SBFolderBackgroundView *)v3 registerForTraitChanges:v7 withTarget:v3 action:sel__updateBackgroundUserInterfaceStyle];
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_tintView, "_setContinuousCornerRadius:");
  [(MTMaterialView *)self->_blurView _setContinuousCornerRadius:a3];
  [(SBFolderBackgroundView *)self _updateCurrentEffect];
}

+ (double)cornerRadiusToInsetContent
{
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v5 = 0;
      int v6 = 0;
      int v7 = 0;
      int v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4FB16C8] currentDevice];
    v22 = v2;
    if ([v2 userInterfaceIdiom] != 1)
    {
      int v5 = 0;
      int v6 = 0;
      int v7 = 0;
      int v8 = 1;
      goto LABEL_11;
    }
  }
  int v8 = v4 ^ 1;
  int v9 = __sb__runningInSpringBoard();
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v2 _referenceBounds];
  }
  int v5 = v9 ^ 1;
  BSSizeRoundForScale();
  uint64_t v10 = MEMORY[0x1E4FA6E50];
  if (v11 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v16 = __sb__runningInSpringBoard();
    uint64_t v3 = (uint64_t)&xmmword_1D81E5000;
    if (v16)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v6 = 0;
        int v7 = 0;
        int v14 = 0;
        double v15 = 77.0;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([(id)v4 userInterfaceIdiom] != 1)
      {
        int v7 = 0;
        int v14 = 0;
        int v6 = 1;
        double v15 = 77.0;
        goto LABEL_26;
      }
    }
    int v6 = v16 ^ 1;
    double v15 = 77.0;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      int v7 = 0;
      int v14 = 0;
      goto LABEL_26;
    }
    uint64_t v3 = __sb__runningInSpringBoard();
    if (v3)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v23 _referenceBounds];
    }
    int v7 = v3 ^ 1;
    BSSizeRoundForScale();
    if (v21 < *(double *)(v10 + 360))
    {
      int v14 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
  }
LABEL_11:
  int v12 = __sb__runningInSpringBoard();
  if (v12)
  {
    BOOL v13 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v13 = [(id)v3 userInterfaceIdiom] == 1;
  }
  int v14 = v12 ^ 1;
  if (v13) {
    double v15 = 53.0;
  }
  else {
    double v15 = 35.0;
  }
LABEL_26:
  if (__sb__runningInSpringBoard())
  {
    BOOL v17 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v18 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v17 = [v18 userInterfaceIdiom] == 1;
  }
  if (v14)
  {

    if (!v7) {
      goto LABEL_31;
    }
  }
  else if (!v7)
  {
LABEL_31:
    if (v6) {
      goto LABEL_32;
    }
    goto LABEL_40;
  }

  if (v6)
  {
LABEL_32:

    if (!v5) {
      goto LABEL_33;
    }
    goto LABEL_41;
  }
LABEL_40:
  if (!v5)
  {
LABEL_33:
    if (!v8) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_41:

  if (v8) {
LABEL_34:
  }

LABEL_35:
  double v19 = 3.0;
  if (v17) {
    double v19 = 2.0;
  }
  return v15 + v19;
}

- (void)_updateCurrentEffect
{
  unint64_t v3 = [(SBFolderBackgroundView *)self currentEffect];
  unint64_t v4 = [(SBFolderBackgroundView *)self concreteEffect];
  [(SBFolderBackgroundView *)self setCurrentEffect:v4];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke;
  v10[3] = &unk_1E6AAD700;
  BOOL v11 = v4 == 2;
  BOOL v12 = v3 == 0;
  BOOL v13 = v3 == 2;
  v10[4] = self;
  v10[5] = v14;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
  if (v4 == 2)
  {
    [(SBFolderBackgroundView *)self updateTintEffectColor];
  }
  else
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    if (v3 != v4 && IsReduceMotionEnabled)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke_2;
      v8[3] = &unk_1E6AAD728;
      v8[4] = self;
      BOOL v9 = v4 == 1;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
      double v7 = 0.0;
      if (v4 == 1) {
        double v7 = 1.0;
      }
      [(MTMaterialView *)self->_blurView setAlpha:v7];
    }
  }
  _Block_object_dispose(v14, 8);
}

- (void)setCurrentEffect:(unint64_t)a3
{
  self->_currentEffect = a3;
}

- (unint64_t)currentEffect
{
  return self->_currentEffect;
}

- (unint64_t)concreteEffect
{
  unint64_t result = [(SBFolderBackgroundView *)self effect];
  if (!result)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (unint64_t)effect
{
  return self->_effect;
}

uint64_t __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke(uint64_t a1)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49) || !*(unsigned char *)(a1 + 50))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 32) + 416) removeFromSuperview];
      uint64_t v2 = *(void *)(a1 + 32);
      unint64_t v3 = *(void **)(v2 + 416);
      *(void *)(v2 + 416) = 0;

      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 408);
      *(void *)(v5 + 408) = v4;

      [*(id *)(*(void *)(a1 + 32) + 408) _setContinuousCornerRadius:*(double *)(*(void *)(a1 + 32) + 424)];
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
    }
  }
  else if (*(unsigned char *)(a1 + 49) || *(unsigned char *)(a1 + 50))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 408) removeFromSuperview];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 408);
    *(void *)(v7 + 408) = 0;

    BOOL v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = objc_msgSend(v9, "sbf_animatedBlurRadiusGraphicsQuality");

    if (v10 == 100) {
      BOOL v11 = @"folderLight";
    }
    else {
      BOOL v11 = @"folderLightSimplified";
    }
    BOOL v12 = @"folderDark";
    if (v10 != 100) {
      BOOL v12 = @"folderDarkSimplified";
    }
    BOOL v13 = (void *)MEMORY[0x1E4FB1E20];
    int v14 = v12;
    char v15 = v11;
    int v16 = [v13 traitCollectionWithUserInterfaceStyle:0];
    v27[0] = v16;
    v28[0] = v15;
    BOOL v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    v27[1] = v17;
    v28[1] = v15;
    v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    v27[2] = v18;
    v28[2] = v14;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

    v20 = (void *)MEMORY[0x1E4F743C8];
    double v21 = SBHBundle();
    v22 = [*(id *)(a1 + 32) traitCollection];
    uint64_t v23 = [v20 materialViewWithRecipeNamesByTraitCollection:v19 inBundle:v21 options:0 initialWeighting:0 scaleAdjustment:v22 compatibleWithTraitCollection:1.0];
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 416);
    *(void *)(v24 + 416) = v23;

    [*(id *)(*(void *)(a1 + 32) + 416) _setContinuousCornerRadius:*(double *)(*(void *)(a1 + 32) + 424)];
    [*(id *)(*(void *)(a1 + 32) + 416) setGroupName:@"SBFolderBackgroundViewBlurGroupName"];
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 416)];
  }
  uint64_t result = [*(id *)(a1 + 32) _updateBackgroundUserInterfaceStyle];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    return [*(id *)(a1 + 32) layoutIfNeeded];
  }
  return result;
}

- (void)updateTintEffectColor
{
  if (self->_tintView)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      unint64_t v3 = [(SBFolderBackgroundView *)self delegate];
      uint64_t v4 = [v3 accessibilityTintColorForBackgroundView:self];
      if (!v4)
      {
        uint64_t v4 = [(SBFolderBackgroundView *)self _tintViewBackgroundColorAtFullAlpha];
      }
    }
    else
    {
      unint64_t v3 = [(SBFolderBackgroundView *)self _tintViewBackgroundColorAtFullAlpha];
      uint64_t v4 = [v3 colorWithAlphaComponent:0.6];
    }
    id v5 = (id)v4;

    [(UIView *)self->_tintView setBackgroundColor:v5];
  }
}

- (void)layoutSubviews
{
  [(SBFolderBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_tintView, "setFrame:");
  blurView = self->_blurView;
  -[MTMaterialView setFrame:](blurView, "setFrame:", v4, v6, v8, v10);
}

+ (CGSize)folderBackgroundSize
{
  double v2 = 400.0;
  double v3 = 400.0;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke_2(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:v1];
}

- (id)_tintViewBackgroundColorAtFullAlpha
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.831372549 alpha:1.0];
}

- (void)_updateBackgroundUserInterfaceStyle
{
  id v4 = [(SBFolderBackgroundView *)self traitCollection];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v4);
  [(UIView *)self->_tintView setOverrideUserInterfaceStyle:v3];
  [(MTMaterialView *)self->_blurView setOverrideUserInterfaceStyle:v3];
}

- (SBFolderBackgroundViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFolderBackgroundViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end