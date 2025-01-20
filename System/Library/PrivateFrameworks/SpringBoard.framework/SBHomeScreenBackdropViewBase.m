@interface SBHomeScreenBackdropViewBase
- (BOOL)isOpaque;
- (BOOL)requiresBackdropView;
- (BOOL)requiresLiveBackdropView;
- (SBHomeScreenBackdropViewBase)initWithFrame:(CGRect)a3;
- (SBHomeScreenBackdropViewBaseDelegate)delegate;
- (id)backdropBlurSettings;
- (void)beginRequiringBackdropViewForReason:(id)a3;
- (void)beginRequiringLiveBackdropViewForReason:(id)a3;
- (void)endRequiringBackdropViewForReason:(id)a3;
- (void)endRequiringLiveBackdropViewForReason:(id)a3;
- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SBHomeScreenBackdropViewBase

- (id)backdropBlurSettings
{
  return [(SBFluidSwitcherAnimationSettings *)self->_animationSettings backdropBlurSettings];
}

- (BOOL)requiresLiveBackdropView
{
  return [(NSMutableSet *)self->_liveBackdropViewRequiringReasons count] != 0;
}

- (BOOL)requiresBackdropView
{
  return [(NSMutableSet *)self->_backdropViewRequiringReasons count] != 0;
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBHomeScreenBackdropViewBase.m", 46, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  liveBackdropViewRequiringReasons = self->_liveBackdropViewRequiringReasons;
  if (!liveBackdropViewRequiringReasons)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = self->_liveBackdropViewRequiringReasons;
    self->_liveBackdropViewRequiringReasons = v7;

    id v5 = v10;
    liveBackdropViewRequiringReasons = self->_liveBackdropViewRequiringReasons;
  }
  [(NSMutableSet *)liveBackdropViewRequiringReasons addObject:v5];
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBHomeScreenBackdropViewBase.m", 36, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  backdropViewRequiringReasons = self->_backdropViewRequiringReasons;
  if (!backdropViewRequiringReasons)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = self->_backdropViewRequiringReasons;
    self->_backdropViewRequiringReasons = v7;

    id v5 = v10;
    backdropViewRequiringReasons = self->_backdropViewRequiringReasons;
  }
  [(NSMutableSet *)backdropViewRequiringReasons addObject:v5];
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBHomeScreenBackdropViewBase.m", 62, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_liveBackdropViewRequiringReasons removeObject:v5];
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBHomeScreenBackdropViewBase.m", 56, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_backdropViewRequiringReasons removeObject:v5];
}

- (SBHomeScreenBackdropViewBase)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenBackdropViewBase;
  v3 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[SBAppSwitcherDomain rootSettings];
    uint64_t v5 = [v4 animationSettings];
    animationSettings = v3->_animationSettings;
    v3->_animationSettings = (SBFluidSwitcherAnimationSettings *)v5;
  }
  return v3;
}

- (SBHomeScreenBackdropViewBaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeScreenBackdropViewBaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_liveBackdropViewRequiringReasons, 0);
  objc_storeStrong((id *)&self->_backdropViewRequiringReasons, 0);
}

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)isOpaque
{
  return 0;
}

@end