@interface SBHomeGrabberRotationView
- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3;
- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4 useRotationWrapperViews:(BOOL)a5;
- (SBHomeGrabberView)grabberView;
- (id)_addWrapperViewWithOrientation:(int64_t)a3;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4 rotationSettings:(id)a5;
@end

@implementation SBHomeGrabberRotationView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4 rotationSettings:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    id v9 = [(NSMutableArray *)self->_rotationWrapperViews firstObject];
    if (v5)
    {
      v10 = [(SBHomeGrabberRotationView *)self _addWrapperViewWithOrientation:a3];
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"grabberViewRotationFadeIn-%llu", ++setOrientation_animated_rotationSettings____animationCount);
      v12 = objc_opt_new();
      v13 = objc_opt_new();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke;
      v44[3] = &unk_1E6AF59B8;
      id v14 = v12;
      id v45 = v14;
      id v15 = v13;
      id v46 = v15;
      v47 = self;
      id v16 = v11;
      id v48 = v16;
      v17 = (void *)MEMORY[0x1D948C7A0](v44);
      v28 = (void *)MEMORY[0x1E4F4F898];
      v18 = [(SBFHomeGrabberSettings *)self->_grabberSettings rotationFadeOutAnimationSettings];
      v19 = [v18 BSAnimationSettings];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_2;
      v42[3] = &unk_1E6AF4AC0;
      id v43 = v9;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_3;
      v36[3] = &unk_1E6AF5DF8;
      v36[4] = self;
      id v37 = v16;
      id v38 = v10;
      id v39 = v43;
      id v40 = v14;
      id v20 = v17;
      id v41 = v20;
      id v30 = v14;
      id v29 = v43;
      id v21 = v10;
      id v9 = v16;
      [v28 animateWithSettings:v19 actions:v42 completion:v36];

      [v8 delay];
      double v23 = v22;
      [v8 duration];
      v24 = (void *)*MEMORY[0x1E4F43630];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_5;
      v32[3] = &unk_1E6AF76F8;
      double v35 = v23 + v25;
      id v33 = v15;
      id v34 = v20;
      id v26 = v20;
      id v27 = v15;
      [v24 _performBlockAfterCATransactionCommits:v32];
    }
    else
    {
      SBFTransformFromOrientationToOrientation();
      [v9 setTransform:v31];
    }

    [(SBHomeGrabberRotationView *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)layoutSubviews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(SBHomeGrabberRotationView *)self bounds];
  if (self->_useRotationWrapperViews)
  {
    double v7 = v3;
    double v8 = v4;
    double v9 = v5;
    double v10 = v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = self->_rotationWrapperViews;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15++), "setFrame:", v7, v8, v9, v10, (void)v18);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
  grabberView = self->_grabberView;
  v17 = [(SBHomeGrabberView *)grabberView superview];
  [v17 bounds];
  -[SBHomeGrabberView setFrame:](grabberView, "setFrame:");
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4 useRotationWrapperViews:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SBHomeGrabberRotationView;
  uint64_t v12 = -[SBHomeGrabberRotationView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    rotationWrapperViews = v12->_rotationWrapperViews;
    v12->_rotationWrapperViews = (NSMutableArray *)v13;

    v12->_orientation = 1;
    uint64_t v15 = [SBHomeGrabberView alloc];
    [(SBHomeGrabberRotationView *)v12 bounds];
    uint64_t v16 = -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:](v15, "initWithFrame:settings:shouldEnableGestures:", v11, 1);
    grabberView = v12->_grabberView;
    v12->_grabberView = (SBHomeGrabberView *)v16;

    uint64_t v18 = [MEMORY[0x1E4FA5F28] rootSettings];
    grabberSettings = v12->_grabberSettings;
    v12->_grabberSettings = (SBFHomeGrabberSettings *)v18;

    v12->_useRotationWrapperViews = v5;
    if (v5)
    {
      long long v20 = [(SBHomeGrabberRotationView *)v12 _addWrapperViewWithOrientation:v12->_orientation];
      [v20 addSubview:v12->_grabberView];
    }
    else
    {
      [(SBHomeGrabberRotationView *)v12 addSubview:v12->_grabberView];
    }
  }

  return v12;
}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3
{
  return -[SBHomeGrabberRotationView initWithFrame:settings:](self, "initWithFrame:settings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[SBHomeGrabberRotationView initWithFrame:settings:useRotationWrapperViews:](self, "initWithFrame:settings:useRotationWrapperViews:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenSignalled]
    && [*(id *)(a1 + 40) hasBeenSignalled])
  {
    [*(id *)(*(void *)(a1 + 48) + 432) forgetBackgroundLuminance];
    if ([*(id *)(*(void *)(a1 + 48) + 416) resetAutoHideTimeOnRotation]) {
      [*(id *)(*(void *)(a1 + 48) + 432) resetAutoHide];
    }
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    double v4 = *(void **)(v2 + 432);
    id v6 = [*(id *)(v2 + 416) rotationFadeInAnimationSettings];
    BOOL v5 = [v6 BSAnimationSettings];
    [v4 setHidden:0 forReason:v3 withAnimationSettings:v5];
  }
}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setHidden:1 forReason:*(void *)(a1 + 40) withAnimationSettings:0];
  [*(id *)(*(void *)(a1 + 32) + 432) _removeAllAnimations:1];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 408) firstObject];
  uint64_t v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    [*(id *)(a1 + 48) addSubview:*(void *)(*(void *)(a1 + 32) + 432)];
    [*(id *)(a1 + 32) setNeedsLayout];
  }
  [*(id *)(*(void *)(a1 + 32) + 408) removeObject:*(void *)(a1 + 56)];
  [*(id *)(a1 + 56) removeFromSuperview];
  double v4 = (void *)*MEMORY[0x1E4F43630];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_4;
  v5[3] = &unk_1E6AF6828;
  id v6 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v4 _performBlockAfterCATransactionCommits:v5];
}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_6;
  v3[3] = &unk_1E6AF6828;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  dispatch_time_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)_addWrapperViewWithOrientation:(int64_t)a3
{
  if (self->_useRotationWrapperViews)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(NSMutableArray *)self->_rotationWrapperViews insertObject:v4 atIndex:0];
    SBFTransformFromOrientationToOrientation();
    [v4 setTransform:&v6];
    [(SBHomeGrabberRotationView *)self addSubview:v4];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_rotationWrapperViews, 0);
}

@end