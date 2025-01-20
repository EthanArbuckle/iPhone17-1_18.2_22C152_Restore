@interface PXStoryTVInfoPanelButton
+ (double)widthForText:(id)a3;
- (BOOL)canBecomeFocused;
- (NSString)text;
- (PXStoryTVInfoPanelButton)initWithFrame:(CGRect)a3;
- (id)elementTintColor;
- (unint64_t)elementControlState;
- (void)_updateAppearance;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setControlState:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)updateFocusState:(id)a3;
@end

@implementation PXStoryTVInfoPanelButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

- (void)_updateAppearance
{
  if ([(PXStoryTVInfoPanelButton *)self isFocused])
  {
    v3 = _PXInfoMenuElementFocusViewColor();
    [(UIView *)self->_focusView setBackgroundColor:v3];
  }
  id v4 = [(PXStoryTVInfoPanelButton *)self elementTintColor];
  [(UILabel *)self->_label setTextColor:v4];
}

- (void)setControlState:(unint64_t)a3
{
  if (!a3)
  {
    v9 = _PXInfoMenuElementNormalColor();
    [(UILabel *)self->_label setTextColor:v9];

    focusView = self->_focusView;
    double v8 = 0.0;
    double v11 = 0.0;
LABEL_9:
    [(UIView *)focusView setAlpha:v11];
    v12 = _PXInfoMenuElementSelectedBackgroundColor();
    [(UIView *)self->_focusView setBackgroundColor:v12];

    v7 = [(UILabel *)self->_label layer];
    LODWORD(v13) = 1.0;
    [v7 setShadowOpacity:v13];
    goto LABEL_10;
  }
  if (a3 == 4)
  {
    if (_PXInfoMenuElementSelectedTextColor_onceToken != -1) {
      dispatch_once(&_PXInfoMenuElementSelectedTextColor_onceToken, &__block_literal_global_59);
    }
    [(UILabel *)self->_label setTextColor:_PXInfoMenuElementSelectedTextColor_color];
    focusView = self->_focusView;
    double v8 = 1.0;
    double v11 = 1.0;
    goto LABEL_9;
  }
  if (a3 != 8) {
    return;
  }
  v5 = _PXInfoMenuElementFocusColor();
  [(UILabel *)self->_label setTextColor:v5];

  [(UIView *)self->_focusView setAlpha:0.0];
  v6 = _PXInfoMenuElementFocusViewColor();
  [(UIView *)self->_focusView setBackgroundColor:v6];

  v7 = [(UILabel *)self->_label layer];
  [v7 setShadowOpacity:0.0];
  double v8 = 1.0;
LABEL_10:

  [(UIVisualEffectView *)self->_backgroundEffectView setAlpha:v8];
  floatingContentView = self->_floatingContentView;
  [(_UIFloatingContentView *)floatingContentView setControlState:a3];
}

- (void)updateFocusState:(id)a3
{
  id v4 = a3;
  [(_UIFloatingContentView *)self->_floatingContentView setControlState:[(PXStoryTVInfoPanelButton *)self elementControlState]];
  v5 = [(PXStoryTVInfoPanelButton *)self elementTintColor];
  [(UILabel *)self->_label setTextColor:v5];

  if ([(PXStoryTVInfoPanelButton *)self isFocused])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke;
    v7[3] = &unk_1E5DD1E08;
    v7[4] = self;
    [v4 addCoordinatedFocusingAnimations:v7 completion:0];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke_2;
    v6[3] = &unk_1E5DD1E08;
    v6[4] = self;
    [v4 addCoordinatedUnfocusingAnimations:v6 completion:0];
  }
}

uint64_t __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v2 = _PXInfoMenuElementFocusViewColor();
  [*(id *)(*(void *)(a1 + 32) + 424) setBackgroundColor:v2];

  v3 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  [v3 setShadowOpacity:0.0];

  [*(id *)(a1 + 32) setControlState:8];
  id v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

uint64_t __45__PXStoryTVInfoPanelButton_updateFocusState___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v2 = _PXInfoMenuElementSelectedBackgroundColor();
  [*(id *)(*(void *)(a1 + 32) + 424) setBackgroundColor:v2];

  v3 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  LODWORD(v4) = 1.0;
  [v3 setShadowOpacity:v4];

  [*(id *)(a1 + 32) setControlState:0];
  v5 = *(void **)(a1 + 32);
  return [v5 layoutIfNeeded];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  id v4 = [(UILabel *)self->_label text];
  if (v4 == v7)
  {
  }
  else
  {
    char v5 = [v4 isEqualToString:v7];

    if ((v5 & 1) == 0)
    {
      [(UILabel *)self->_label setText:v7];
      [(UILabel *)self->_label sizeToFit];
      v6 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
      [v6 bounds];

      PXRectGetCenter();
    }
  }
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (id)elementTintColor
{
  if ([(PXStoryTVInfoPanelButton *)self isFocused]) {
    _PXInfoMenuElementFocusColor();
  }
  else {
  v2 = _PXInfoMenuElementNormalColor();
  }
  return v2;
}

- (unint64_t)elementControlState
{
  if ([(PXStoryTVInfoPanelButton *)self isFocused]) {
    return 8;
  }
  else {
    return 0;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryTVInfoPanelButton;
  [(PXStoryTVInfoPanelButton *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  if ([(PXStoryTVInfoPanelButton *)self isFocused])
  {
    id v7 = [(PXStoryTVInfoPanelButton *)self superview];
    [v7 bringSubviewToFront:self];
  }
  [(PXStoryTVInfoPanelButton *)self updateFocusState:v6];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (PXStoryTVInfoPanelButton)initWithFrame:(CGRect)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PXStoryTVInfoPanelButton;
  v3 = -[PXStoryTVInfoPanelButton initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  p_isa = (id *)&v3->super.super.super.isa;
  if (v3)
  {
    [(PXStoryTVInfoPanelButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa setClipsToBounds:0];
    id v5 = objc_alloc_init(MEMORY[0x1E4FB2110]);
    id v6 = p_isa[51];
    p_isa[51] = v5;

    [p_isa[51] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa[51] setClipsContentToBounds:1];
    [p_isa[51] setClipsToBounds:0];
    [p_isa[51] setShadowRadius:18.0];
    [p_isa[51] setShadowVerticalOffset:10.0];
    [p_isa[51] setShadowOpacity:0.3];
    [p_isa[51] setFocusedSizeIncrease:20.0];
    [p_isa[51] setContinuousCornerEnabled:1];
    [p_isa[51] setCornerRadius:12.0];
    objc_msgSend(p_isa[51], "setContentMotionRotation:translation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 4.0, 4.0);
    id v7 = p_isa[51];
    objc_super v8 = [MEMORY[0x1E4FB1618] clearColor];
    [v7 setBackgroundColor:v8 forState:0];

    id v9 = p_isa[51];
    v10 = _PXInfoMenuElementFocusViewColor();
    [v9 setBackgroundColor:v10 forState:8];

    id v11 = p_isa[51];
    v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [v11 setBackgroundColor:v12 forState:1];

    id v13 = p_isa[51];
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [v13 setBackgroundColor:v14 forState:4];

    v15 = [p_isa[51] visualEffectContainerView];
    [v15 setClipsToBounds:1];

    v16 = [p_isa[51] visualEffectContainerView];
    v17 = [v16 layer];
    [v17 setCornerRadius:12.0];

    uint64_t v18 = *MEMORY[0x1E4F39EA8];
    v19 = [p_isa[51] visualEffectContainerView];
    v20 = [v19 layer];
    [v20 setCornerCurve:v18];

    [p_isa addSubview:p_isa[51]];
    id v21 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v22 = [MEMORY[0x1E4FB14C8] effectWithStyle:4017];
    uint64_t v23 = [v21 initWithEffect:v22];
    id v24 = p_isa[54];
    p_isa[54] = (id)v23;

    [p_isa[54] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa[54] setAlpha:0.0];
    v25 = [p_isa[51] visualEffectContainerView];
    [v25 addSubview:p_isa[54]];

    id v26 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v27 = p_isa[53];
    p_isa[53] = v26;

    [p_isa[53] _setContinuousCornerRadius:12.0];
    v28 = _PXInfoMenuElementFocusViewColor();
    [p_isa[53] setBackgroundColor:v28];

    [p_isa[53] setAlpha:0.0];
    v29 = [p_isa[51] contentView];
    [v29 bounds];
    objc_msgSend(p_isa[53], "setFrame:");

    [p_isa[53] setAutoresizingMask:18];
    [p_isa[53] setClipsToBounds:1];
    v30 = [p_isa[51] contentView];
    [v30 addSubview:p_isa[53]];

    id v31 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v32 = p_isa[52];
    p_isa[52] = v31;

    v33 = [MEMORY[0x1E4FB08E0] systemFontOfSize:30.0 weight:*MEMORY[0x1E4FB09B8]];
    [p_isa[52] setFont:v33];

    v34 = _PXInfoMenuElementNormalColor();
    [p_isa[52] setTextColor:v34];

    [p_isa[51] contentView];
    [(id)objc_claimAutoreleasedReturnValue() bounds];
    PXRectGetCenter();
  }
  return 0;
}

+ (double)widthForText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = *MEMORY[0x1E4FB09B8];
  id v5 = a3;
  id v6 = [v3 systemFontOfSize:30.0 weight:v4];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v12[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v5 sizeWithAttributes:v7];
  double v9 = v8;

  return ceil(v9) + 40.0;
}

@end