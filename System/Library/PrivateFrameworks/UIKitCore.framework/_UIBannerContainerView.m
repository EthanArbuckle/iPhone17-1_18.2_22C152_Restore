@interface _UIBannerContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSMutableArray)banners;
- (NSMutableArray)constraints;
- (_UIBannerContainerView)initWithFrame:(CGRect)a3;
- (id)_bannerAnimationToVisible:(BOOL)a3 hiddenValue:(id)a4 visibleValue:(id)a5 withKeyPath:(id)a6;
- (void)_dismissBanner:(id)a3 alongsideAnimations:(id)a4 completion:(id)a5;
- (void)_presentBanner:(id)a3 completion:(id)a4;
- (void)_setBanner:(id)a3 visible:(BOOL)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)setBanners:(id)a3;
- (void)setConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIBannerContainerView

- (_UIBannerContainerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIBannerContainerView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    banners = v3->_banners;
    v3->_banners = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel_statusBarFrameDidChange_ name:@"UIApplicationDidChangeStatusBarFrameNotification" object:UIApp];
  }
  return v3;
}

- (void)_presentBanner:(id)a3 completion:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NSMutableArray *)self->_banners addObject:v6];
  [(UIView *)self addSubview:v8];
  v9 = [MEMORY[0x1E4F1CA48] array];
  objc_super v10 = [v8 leadingAnchor];
  v11 = [(UIView *)self leadingAnchor];
  v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:8.0];
  [v9 addObject:v12];

  v13 = [v8 centerXAnchor];
  v14 = [(UIView *)self centerXAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v9 addObject:v15];

  v16 = [v8 widthAnchor];
  v17 = [v16 constraintLessThanOrEqualToConstant:480.0];
  [v9 addObject:v17];

  v18 = [v8 widthAnchor];
  v19 = [v18 constraintEqualToConstant:480.0];
  LODWORD(v20) = 1147207680;
  v21 = objc_msgSend(v19, "_ui_constraintWithPriority:", v20);
  [v9 addObject:v21];

  v22 = [v8 topAnchor];
  v23 = [(UIView *)self topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];
  LODWORD(v25) = 1147207680;
  v26 = objc_msgSend(v24, "_ui_constraintWithPriority:", v25);
  [v6 setVisibleConstraint:v26];

  v27 = [v8 bottomAnchor];
  uint64_t v28 = [(UIView *)self topAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v6 setHiddenConstraint:v29];

  v30 = [v6 hiddenConstraint];
  [v9 addObject:v30];

  [(UIView *)self setNeedsUpdateConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:v9];
  [(UIView *)self layoutIfNeeded];
  v31 = [v8 _screen];
  v47.origin.x = _UIScreenNativeDisplayExclusionRectForType([v31 _screenType]);
  double y = v47.origin.y;
  LOBYTE(v28) = CGRectIsNull(v47);

  if ((v28 & 1) == 0 && y > 0.0)
  {
    v33 = [v8 layer];
    v34 = [v33 filters];
    uint64_t v35 = [v34 count];

    if (!v35)
    {
      v36 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      [v36 setValue:&unk_1ED3F2338 forKey:@"inputRadius"];
      [v36 setName:@"gaussianBlur"];
      v46[0] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      v38 = [v8 layer];
      [v38 setFilters:v37];
    }
    CGAffineTransformMakeScale(&v45, 0.8, 0.8);
    CGAffineTransform v44 = v45;
    [v8 setTransform:&v44];
  }
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __52___UIBannerContainerView__presentBanner_completion___block_invoke;
  v40[3] = &unk_1E52EAE50;
  objc_copyWeak(&v42, &location);
  id v39 = v7;
  id v41 = v39;
  [(_UIBannerContainerView *)self _setBanner:v6 visible:1 alongsideAnimations:0 completion:v40];

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (void)updateConstraints
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UIBannerContainerView;
  [(UIView *)&v18 updateConstraints];
  v3 = [(UIView *)self window];
  uint64_t v4 = __UIStatusBarManagerForWindow(v3);
  [v4 statusBarHeight];
  double v6 = v5;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_banners;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = v6 + 8.0;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "visibleConstraint", (void)v14);
        [v13 setConstant:v10];

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_dismissBanner:(id)a3 alongsideAnimations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72___UIBannerContainerView__dismissBanner_alongsideAnimations_completion___block_invoke;
  v13[3] = &unk_1E52F0B70;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(_UIBannerContainerView *)self _setBanner:v11 visible:0 alongsideAnimations:v9 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)_bannerAnimationToVisible:(BOOL)a3 hiddenValue:(id)a4 visibleValue:(id)a5 withKeyPath:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a6];
  [v11 setDuration:0.5];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  if (v8) {
    id v12 = v9;
  }
  else {
    id v12 = v10;
  }
  if (v8) {
    id v13 = v10;
  }
  else {
    id v13 = v9;
  }
  [v11 setFromValue:v12];
  [v11 setToValue:v13];
  *(float *)&double v14 = 1.0 / UIAnimationDragCoefficient();
  [v11 setSpeed:v14];

  return v11;
}

- (void)_setBanner:(id)a3 visible:(BOOL)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 visibleConstraint];
  [v13 setActive:v7];

  uint64_t v14 = [v12 hiddenConstraint];
  [(id)v14 setActive:v7 ^ 1];

  id v15 = [v12 view];

  id v16 = [v15 _screen];
  v32.origin.x = _UIScreenNativeDisplayExclusionRectForType([v16 _screenType]);
  double y = v32.origin.y;
  LOBYTE(v14) = CGRectIsNull(v32);

  if ((v14 & 1) != 0 || y <= 0.0)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_2;
    v23[3] = &unk_1E52D9F98;
    objc_super v18 = (id *)v24;
    v24[0] = v10;
    v24[1] = self;
    id v22 = v10;
    +[UIView animateWithDuration:v23 animations:v11 completion:0.5];
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke;
    aBlock[3] = &unk_1E52DC3F8;
    objc_super v18 = &v28;
    id v28 = v10;
    id v19 = v15;
    BOOL v31 = v7;
    id v29 = v19;
    v30 = self;
    id v20 = v10;
    v21 = _Block_copy(aBlock);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __76___UIBannerContainerView__setBanner_visible_alongsideAnimations_completion___block_invoke_155;
    v25[3] = &unk_1E52E8F50;
    id v26 = v11;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v21 tracking:v25 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.08 projectionDeceleration:1.0 animations:0.0 completion:0.0];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = self->_banners;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "view", (void)v13);
        [v10 frame];
        v19.CGFloat x = x;
        v19.CGFloat y = y;
        BOOL v11 = CGRectContainsPoint(v20, v19);

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSMutableArray)banners
{
  return self->_banners;
}

- (void)setBanners:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_banners, 0);
}

@end