@interface SBHomeScreenBackdropDarkTintView
- (BOOL)isOpaque;
- (SBHomeScreenBackdropDarkTintView)initWithFrame:(CGRect)a3;
- (void)_updateDarkTintViewHidden;
- (void)beginRequiringBackdropViewForReason:(id)a3;
- (void)beginRequiringLiveBackdropViewForReason:(id)a3;
- (void)endRequiringBackdropViewForReason:(id)a3;
- (void)endRequiringLiveBackdropViewForReason:(id)a3;
- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
@end

@implementation SBHomeScreenBackdropDarkTintView

- (SBHomeScreenBackdropDarkTintView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  v3 = -[SBHomeScreenBackdropViewBase initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBHomeScreenBackdropDarkTintView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    darkTintView = v3->_darkTintView;
    v3->_darkTintView = (UIView *)v5;

    [(UIView *)v3->_darkTintView setAutoresizingMask:18];
    [(UIView *)v3->_darkTintView setHidden:1];
    v7 = v3->_darkTintView;
    v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.8];
    [(UIView *)v7 setBackgroundColor:v8];

    [(SBHomeScreenBackdropDarkTintView *)v3 addSubview:v3->_darkTintView];
  }
  return v3;
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  [(SBHomeScreenBackdropViewBase *)&v4 beginRequiringBackdropViewForReason:a3];
  [(SBHomeScreenBackdropDarkTintView *)self _updateDarkTintViewHidden];
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  [(SBHomeScreenBackdropViewBase *)&v4 beginRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenBackdropDarkTintView *)self _updateDarkTintViewHidden];
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  [(SBHomeScreenBackdropViewBase *)&v4 endRequiringBackdropViewForReason:a3];
  [(SBHomeScreenBackdropDarkTintView *)self _updateDarkTintViewHidden];
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenBackdropDarkTintView;
  [(SBHomeScreenBackdropViewBase *)&v4 endRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenBackdropDarkTintView *)self _updateDarkTintViewHidden];
}

- (void)setBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F42FF0];
  id v9 = a5;
  objc_super v10 = [(SBHomeScreenBackdropViewBase *)self backdropBlurSettings];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBHomeScreenBackdropDarkTintView_setBlurProgress_behaviorMode_completion___block_invoke;
  v11[3] = &unk_1E6AF4A70;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v10, a4, v11, v9);
}

uint64_t __76__SBHomeScreenBackdropDarkTintView_setBlurProgress_behaviorMode_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 440);
  double v2 = (double)(BSFloatIsZero() ^ 1);
  return [v1 setAlpha:v2];
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)_updateDarkTintViewHidden
{
  if ([(SBHomeScreenBackdropViewBase *)self requiresBackdropView]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(SBHomeScreenBackdropViewBase *)self requiresLiveBackdropView] ^ 1;
  }
  darkTintView = self->_darkTintView;
  [(UIView *)darkTintView setHidden:v3];
}

- (void).cxx_destruct
{
}

@end