@interface PUPhotoEditApertureToolbar
- (BOOL)enabled;
- (BOOL)setNextApertureValue:(BOOL)a3 coarse:(BOOL)a4;
- (BOOL)useTranslucentBackground;
- (CEKApertureSlider)slider;
- (NSString)backdropViewGroupName;
- (PUPhotoEditApertureToolbar)init;
- (PUPhotoEditApertureToolbarDelegate)delegate;
- (UIEdgeInsets)preferredPreviewViewInsets;
- (UILabel)depthEffectLabel;
- (UILabel)valueLabel;
- (double)apertureValue;
- (double)maximumApertureValue;
- (double)minimumApertureValue;
- (double)originalApertureValue;
- (double)sliderWidth;
- (id)_nextApertureValueFromValue:(id)a3 reverse:(BOOL)a4;
- (int64_t)layoutOrientation;
- (void)_apertureSliderDidChangeValue:(id)a3;
- (void)_handleApertureUpdateCoalescerWithContext:(id)a3;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)loadView;
- (void)setApertureValueClosestTo:(double)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepthEffectLabel:(id)a3;
- (void)setDepthIsOn:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setMaximumApertureValue:(double)a3;
- (void)setMinimumApertureValue:(double)a3;
- (void)setOriginalApertureValueClosestTo:(double)a3;
- (void)setSlider:(id)a3;
- (void)setSliderWidth:(double)a3;
- (void)setUseTranslucentBackground:(BOOL)a3;
- (void)setUseTranslucentBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)setValueLabel:(id)a3;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
@end

@implementation PUPhotoEditApertureToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_depthEffectLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apertureUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setDepthEffectLabel:(id)a3
{
}

- (UILabel)depthEffectLabel
{
  return self->_depthEffectLabel;
}

- (void)setSlider:(id)a3
{
}

- (CEKApertureSlider)slider
{
  return self->_slider;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (BOOL)useTranslucentBackground
{
  return self->_useTranslucentBackground;
}

- (double)sliderWidth
{
  return self->_sliderWidth;
}

- (PUPhotoEditApertureToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditApertureToolbarDelegate *)WeakRetained;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4 = [(PUPhotoEditApertureToolbar *)self delegate];
  [v4 apertureToolbarDidStopSliding:self];
}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4 = [(PUPhotoEditApertureToolbar *)self delegate];
  [v4 apertureToolbarDidStartSliding:self];
}

- (void)setDepthIsOn:(BOOL)a3
{
  if (self->_sliderImplementsOffState)
  {
    BOOL v3 = a3;
    id v4 = [(PUPhotoEditApertureToolbar *)self slider];
    [v4 setSliderOn:v3];
  }
}

- (void)setApertureValueClosestTo:(double)a3
{
  id v4 = [(PUPhotoEditApertureToolbar *)self slider];
  [v4 setApertureValueClosestTo:a3];
}

- (void)_apertureSliderDidChangeValue:(id)a3
{
}

- (BOOL)setNextApertureValue:(BOOL)a3 coarse:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(PUPhotoEditApertureToolbar *)self slider];
  v8 = NSNumber;
  [v7 apertureValue];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  if (![v7 includesOffState]) {
    goto LABEL_11;
  }
  v10 = NSNumber;
  [(PUPhotoEditApertureToolbar *)self maximumApertureValue];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  if (v11)
  {
    if (([v7 isSliderOn] & 1) == 0)
    {
      if (!v5) {
        goto LABEL_9;
      }
      id v13 = [(PUPhotoEditApertureToolbar *)self delegate];
      [v13 apertureToolbar:self didUpdateDepthActive:1];
LABEL_18:

LABEL_20:
      [v11 floatValue];
      [v7 setApertureValueClosestTo:v20];
      BOOL v14 = 1;
      goto LABEL_21;
    }
    if ([v9 isEqualToNumber:v11] && !v5)
    {
      v12 = [(PUPhotoEditApertureToolbar *)self delegate];
      [v12 apertureToolbar:self didUpdateDepthActive:0];

      goto LABEL_9;
    }

LABEL_11:
    uint64_t v15 = [(PUPhotoEditApertureToolbar *)self _nextApertureValueFromValue:v9 reverse:v5];
    v11 = (void *)v15;
    if (v4) {
      v16 = (void *)v15;
    }
    else {
      v16 = 0;
    }
    if (v16)
    {
      char v17 = 1;
      while (1)
      {
        char v18 = v17;
        v19 = [(PUPhotoEditApertureToolbar *)self _nextApertureValueFromValue:v11 reverse:v5];

        if (!v19) {
          break;
        }
        id v13 = v19;

        char v17 = 0;
        v11 = v13;
        if ((v18 & 1) == 0) {
          goto LABEL_18;
        }
      }
    }
    if (!v11)
    {
      BOOL v14 = 0;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_21:

LABEL_22:
  return v14;
}

- (id)_nextApertureValueFromValue:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(MEMORY[0x1E4F57D30], "validApertureValues", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    char v8 = 0;
    v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v8)
        {
          id v7 = v12;
          goto LABEL_14;
        }
        char v8 = [v5 isEqualToNumber:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if ((v8 & 1) == 0)
        {
          id v13 = v12;

          v9 = v13;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_14:

  if (v4) {
    BOOL v14 = v9;
  }
  else {
    BOOL v14 = v7;
  }
  id v15 = v14;

  return v15;
}

- (double)apertureValue
{
  v2 = [(PUPhotoEditApertureToolbar *)self slider];
  [v2 apertureValue];
  double v4 = v3;

  return v4;
}

- (void)setOriginalApertureValueClosestTo:(double)a3
{
  id v4 = [(PUPhotoEditApertureToolbar *)self slider];
  [v4 setMarkedApertureValueClosestTo:a3];
}

- (double)originalApertureValue
{
  v2 = [(PUPhotoEditApertureToolbar *)self slider];
  [v2 markedApertureValue];
  double v4 = v3;

  return v4;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    self->_isResizing = v6 != 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PUPhotoEditApertureToolbar_setLayoutOrientation_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E5F2B9D0;
    v11[4] = self;
    [v6 animateAlongsideTransition:0 completion:v11];
    char v8 = [(PUPhotoEditApertureToolbar *)self view];
    [v8 setNeedsUpdateConstraints];

    v9 = [(PUPhotoEditApertureToolbar *)self delegate];
    int v10 = [v9 apertureToolbarShouldRotateLabelsWithOrientation:self];

    if (v10) {
      [(CEKApertureSlider *)self->_slider setTextOrientation:2 animated:1];
    }
  }
}

uint64_t __77__PUPhotoEditApertureToolbar_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 992) = 0;
  return result;
}

- (void)setLayoutOrientation:(int64_t)a3
{
}

- (void)setMaximumApertureValue:(double)a3
{
  id v4 = [(PUPhotoEditApertureToolbar *)self slider];
  [(PUPhotoEditApertureToolbar *)self minimumApertureValue];
  objc_msgSend(v4, "setMinimumApertureValueClosestTo:maximumApertureValueClosestTo:");
}

- (double)maximumApertureValue
{
  v2 = [(PUPhotoEditApertureToolbar *)self slider];
  [v2 maximumApertureValue];
  double v4 = v3;

  return v4;
}

- (void)setMinimumApertureValue:(double)a3
{
  id v6 = [(PUPhotoEditApertureToolbar *)self slider];
  [(PUPhotoEditApertureToolbar *)self maximumApertureValue];
  [v6 setMinimumApertureValueClosestTo:a3 maximumApertureValueClosestTo:v5];
}

- (double)minimumApertureValue
{
  v2 = [(PUPhotoEditApertureToolbar *)self slider];
  [v2 minimumApertureValue];
  double v4 = v3;

  return v4;
}

- (void)setSliderWidth:(double)a3
{
  if (self->_sliderWidth != a3)
  {
    self->_sliderWidth = a3;
    id v3 = [(PUPhotoEditApertureToolbar *)self view];
    [v3 setNeedsUpdateConstraints];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPhotoEditApertureToolbar *)self slider];
  [v4 setEnabled:v3];
}

- (BOOL)enabled
{
  v2 = [(PUPhotoEditApertureToolbar *)self slider];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int useTranslucentBackground = self->_useTranslucentBackground;
  if (useTranslucentBackground == [(_UIBackdropView *)self->_backdropBackgroundView isHidden])
  {
    double v6 = 0.0;
    if (useTranslucentBackground) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
    if (v3)
    {
      if (useTranslucentBackground) {
        double v6 = 1.0;
      }
      [(UIView *)self->_solidBackgroundView setAlpha:v6];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke;
      v11[3] = &unk_1E5F2E0A8;
      v11[4] = self;
      *(double *)&void v11[5] = v7;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke_2;
      v9[3] = &unk_1E5F289B8;
      v9[4] = self;
      char v10 = useTranslucentBackground;
      *(double *)&v9[5] = v7;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:v9 completion:0.2];
    }
    else
    {
      [(_UIBackdropView *)self->_backdropBackgroundView setHidden:useTranslucentBackground == 0];
      solidBackgroundView = self->_solidBackgroundView;
      [(UIView *)solidBackgroundView setAlpha:v7];
    }
  }
}

uint64_t __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __56__PUPhotoEditApertureToolbar__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setHidden:*(unsigned char *)(a1 + 48) == 0];
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 976);
  return [v3 setAlpha:v2];
}

- (UIEdgeInsets)preferredPreviewViewInsets
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double width = self->_cachedSize.width;
  double height = self->_cachedSize.height;
  if (width >= height) {
    double v9 = self->_cachedSize.height;
  }
  else {
    double v9 = self->_cachedSize.width;
  }
  if (width < height) {
    double width = self->_cachedSize.height;
  }
  double v10 = (width + v9 * -1.33333333) * 0.5;
  v11 = [(PUPhotoEditApertureToolbar *)self slider];
  [v11 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;

  if (v13 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v13;
  }
  if (v10 >= v16) {
    double v17 = v10;
  }
  else {
    double v17 = v16;
  }
  int64_t v18 = [(PUPhotoEditApertureToolbar *)self layoutOrientation];
  if (v18 == 2) {
    double v19 = v17;
  }
  else {
    double v19 = v6;
  }
  if (v18 == 1) {
    double v20 = v6;
  }
  else {
    double v20 = v19;
  }
  if (v18 == 1) {
    double v21 = v17;
  }
  else {
    double v21 = v5;
  }
  double v22 = v3;
  double v23 = v4;
  result.right = v20;
  result.bottom = v21;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void)updateViewConstraints
{
  v32[4] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  double v3 = [(PUPhotoEditApertureToolbar *)self view];
  double v4 = [(PUPhotoEditApertureToolbar *)self slider];
  constraints = self->_constraints;
  v28 = [v4 centerXAnchor];
  v27 = [v3 centerXAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v32[0] = v26;
  v25 = [v4 centerYAnchor];
  double v5 = [v3 centerYAnchor];
  double v6 = [v25 constraintEqualToAnchor:v5];
  v32[1] = v6;
  double v7 = [v4 heightAnchor];
  char v8 = [v7 constraintEqualToConstant:110.0];
  v32[2] = v8;
  v29 = v3;
  double v9 = [v3 heightAnchor];
  double v10 = [v4 heightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v32[3] = v11;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  [(NSMutableArray *)constraints addObjectsFromArray:v12];

  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v31[0] = *MEMORY[0x1E4F1DAB8];
  v31[1] = v13;
  v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v31];
  [(PUPhotoEditApertureToolbar *)self sliderWidth];
  if (v14 <= 0.0)
  {
    double v19 = v29;
    double v23 = self->_constraints;
    double v16 = [v29 widthAnchor];
    double v20 = [v4 widthAnchor];
    double v21 = [v16 constraintEqualToAnchor:v20];
    [(NSMutableArray *)v23 addObject:v21];
  }
  else
  {
    double v15 = [v4 widthAnchor];
    [(PUPhotoEditApertureToolbar *)self sliderWidth];
    double v16 = objc_msgSend(v15, "constraintEqualToConstant:");

    LODWORD(v17) = 1144750080;
    [v16 setPriority:v17];
    [(NSMutableArray *)self->_constraints addObject:v16];
    int64_t v18 = self->_constraints;
    double v19 = v29;
    double v20 = [v29 widthAnchor];
    double v21 = [v4 widthAnchor];
    double v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
    [(NSMutableArray *)v18 addObject:v22];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  v30.receiver = self;
  v30.super_class = (Class)PUPhotoEditApertureToolbar;
  [(PUPhotoEditApertureToolbar *)&v30 updateViewConstraints];
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_backdropViewGroupName, "isEqualToString:"))
  {
    double v4 = (NSString *)[v7 copy];
    backdropViewGroupName = self->_backdropViewGroupName;
    self->_backdropViewGroupName = v4;

    double v6 = [(PUPhotoEditApertureToolbar *)self backdropViewGroupName];
    [(_UIBackdropView *)self->_backdropBackgroundView setGroupName:v6];
  }
}

- (void)setUseTranslucentBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_int useTranslucentBackground = a3;
    [(PUPhotoEditApertureToolbar *)self _updateBackgroundAnimated:a4];
  }
}

- (void)setUseTranslucentBackground:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditApertureToolbar;
  [(PUPhotoEditApertureToolbar *)&v9 viewDidLayoutSubviews];
  p_cachedSize = &self->_cachedSize;
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == self->_cachedSize.width && v4 == self->_cachedSize.height && !self->_isResizing)
  {
    double v6 = [(PUPhotoEditApertureToolbar *)self view];
    [v6 bounds];
    p_cachedSize->double width = v7;
    p_cachedSize->double height = v8;
  }
}

- (void)_handleApertureUpdateCoalescerWithContext:(id)a3
{
  [a3 delayNextInvocationByTimeInterval:0.05];
  id v9 = [(PUPhotoEditApertureToolbar *)self delegate];
  double v4 = [(PUPhotoEditApertureToolbar *)self slider];
  [v4 apertureValue];
  double v6 = v5;

  if (!self->_sliderImplementsOffState)
  {
LABEL_6:
    [v9 apertureToolbar:self didChangeValue:v6];
    goto LABEL_8;
  }
  if (v6 != 0.0)
  {
    CGFloat v7 = [(PUPhotoEditApertureToolbar *)self slider];
    char v8 = [v7 isSliderOn];

    if (v8)
    {
      if (([v9 apertureToolbarIsDepthActive] & 1) == 0) {
        [v9 apertureToolbar:self didUpdateDepthActive:1];
      }
      goto LABEL_6;
    }
  }
  [v9 apertureToolbar:self didUpdateDepthActive:0];
LABEL_8:
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [(PUPhotoEditApertureToolbar *)self setView:v3];
  [(CEKApertureSlider *)self->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
  slider = self->_slider;
  [(PUPhotoEditApertureToolbar *)self apertureValue];
  -[CEKApertureSlider setApertureValueClosestTo:](slider, "setApertureValueClosestTo:");
  double v6 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
  backdropBackgroundView = self->_backdropBackgroundView;
  self->_backdropBackgroundView = v6;

  [(_UIBackdropView *)self->_backdropBackgroundView setHidden:1];
  char v8 = [(_UIBackdropView *)self->_backdropBackgroundView layer];
  [v8 setAllowsGroupOpacity:0];

  [(_UIBackdropView *)self->_backdropBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [(_UIBackdropView *)self->_backdropBackgroundView groupName];
  [(PUPhotoEditApertureToolbar *)self setBackdropViewGroupName:v9];

  double v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  solidBackgroundView = self->_solidBackgroundView;
  self->_solidBackgroundView = v10;

  double v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)self->_solidBackgroundView setBackgroundColor:v12];

  [(UIView *)self->_solidBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_backdropBackgroundView];
  [v3 addSubview:self->_solidBackgroundView];
  long long v13 = [(_UIBackdropView *)self->_backdropBackgroundView leadingAnchor];
  double v14 = [v3 leadingAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  double v16 = [(_UIBackdropView *)self->_backdropBackgroundView trailingAnchor];
  double v17 = [v3 trailingAnchor];
  int64_t v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  double v19 = [(_UIBackdropView *)self->_backdropBackgroundView topAnchor];
  double v20 = [v3 topAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  double v22 = [(_UIBackdropView *)self->_backdropBackgroundView bottomAnchor];
  double v23 = [v3 bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(UIView *)self->_solidBackgroundView leadingAnchor];
  v26 = [v3 leadingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(UIView *)self->_solidBackgroundView trailingAnchor];
  v29 = [v3 trailingAnchor];
  objc_super v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(UIView *)self->_solidBackgroundView topAnchor];
  v32 = [v3 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  v34 = [(UIView *)self->_solidBackgroundView bottomAnchor];
  v35 = [v3 bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  [v3 addSubview:self->_slider];
  objc_initWeak(&location, self);
  v37 = (void *)MEMORY[0x1E4F8A220];
  uint64_t v38 = MEMORY[0x1E4F14428];
  id v39 = MEMORY[0x1E4F14428];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __38__PUPhotoEditApertureToolbar_loadView__block_invoke;
  v42[3] = &unk_1E5F28990;
  objc_copyWeak(&v43, &location);
  v40 = [v37 setCoalescerWithLabel:@"PUPhotoEditApertureToolbar._apertureUpdateCoalescer" target:self queue:v38 action:v42];
  apertureUpdateCoalescer = self->_apertureUpdateCoalescer;
  self->_apertureUpdateCoalescer = v40;

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __38__PUPhotoEditApertureToolbar_loadView__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleApertureUpdateCoalescerWithContext:v5];
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditApertureToolbar)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoEditApertureToolbar;
  double v2 = [(PUPhotoEditApertureToolbar *)&v11 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F57D28]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    slider = v2->_slider;
    v2->_slider = (CEKApertureSlider *)v6;

    [(CEKApertureSlider *)v2->_slider setDelegate:v2];
    [(CEKApertureSlider *)v2->_slider addTarget:v2 action:sel__apertureSliderDidChangeValue_ forControlEvents:4096];
    [(CEKApertureSlider *)v2->_slider setSliderVerticalOffset:28.0];
    [(CEKApertureSlider *)v2->_slider setSliderVerticalAlignment:1];
    [(CEKApertureSlider *)v2->_slider setUseTickMarkLegibilityShadows:1];
    if (objc_opt_respondsToSelector())
    {
      char v8 = +[PUPhotoEditProtoSettings sharedInstance];
      int v9 = [v8 apertureSliderHasOffPosition];

      if (v9)
      {
        v2->_sliderImplementsOffState = 1;
        [(CEKApertureSlider *)v2->_slider setIncludesOffState:1];
      }
    }
  }
  return v2;
}

@end