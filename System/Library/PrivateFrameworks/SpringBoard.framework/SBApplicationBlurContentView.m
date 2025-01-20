@interface SBApplicationBlurContentView
- (SBApplicationBlurContentView)initWithCoder:(id)a3;
- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3;
- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 icon:(id)a5 targetViewToBlur:(id)a6 initialIconScale:(double)a7;
- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5;
- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5 initialIconScale:(double)a6;
- (SBSceneViewAppIconView)iconView;
- (double)blurDelay;
- (double)iconViewScale;
- (void)_addCompletionBlock:(id)a3 forState:(unint64_t)a4;
- (void)_doAnimationToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4;
- (void)_doBlurGenerationWithCompletion:(id)a3;
- (void)_fireCompletionBlocksForState:(unint64_t)a3;
- (void)_setState:(unint64_t)a3;
- (void)animateToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)generateAndAnimateToBlurredSnapshotWithAnimationFactory:(id)a3 completion:(id)a4;
- (void)generateBlurredSnapshotWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setBlurDelay:(double)a3;
- (void)setIconViewScale:(double)a3;
@end

@implementation SBApplicationBlurContentView

- (SBApplicationBlurContentView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBApplicationBlurContentView.m" lineNumber:90 description:@"initWithCoder: is unavailable for this class."];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:", 0, 0, v6, v7, v8, v9);
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"SBApplicationBlurContentView.m" lineNumber:95 description:@"initWithFrame: is unavailable for this class."];

  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:", 0, 0, x, y, width, height);
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5
{
  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5 initialIconScale:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  id v14 = a4;
  v15 = +[SBIconController sharedInstance];
  v16 = [v15 model];
  v17 = [v16 applicationIconForBundleIdentifier:v14];

  v18 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:](self, "initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:", v14, v17, v13, x, y, width, height, a6);
  return v18;
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 icon:(id)a5 targetViewToBlur:(id)a6 initialIconScale:(double)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v18;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"SBApplicationBlurContentView.m", 109, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v64 = [MEMORY[0x1E4F28B00] currentHandler];
  [v64 handleFailureInMethod:a2, self, @"SBApplicationBlurContentView.m", 110, @"Invalid parameter not satisfying: %@", @"targetViewToBlur" object file lineNumber description];

LABEL_3:
  v66.receiver = self;
  v66.super_class = (Class)SBApplicationBlurContentView;
  v20 = -[SBApplicationBlurContentView initWithFrame:](&v66, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    [(SBApplicationBlurContentView *)v20 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    objc_storeStrong((id *)&v21->_targetViewToBlur, a6);
    p_double width = &v21->_targetViewOriginalSize.width;
    [v19 bounds];
    v21->_targetViewOriginalSize.double width = v31;
    v21->_targetViewOriginalSize.double height = v32;
    v21->_iconViewScale = a7;
    v33 = [(UIView *)v21->_targetViewToBlur superview];

    if (!v33) {
      [(SBApplicationBlurContentView *)v21 addSubview:v21->_targetViewToBlur];
    }
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapStateToCompletionBlocks = v21->_mapStateToCompletionBlocks;
    v21->_mapStateToCompletionBlocks = v34;

    uint64_t v36 = [v16 copy];
    bundleIdentifier = v21->_bundleIdentifier;
    v21->_bundleIdentifier = (NSString *)v36;

    id v38 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v65 = *MEMORY[0x1E4F1DB28];
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v42 = objc_msgSend(v38, "initWithFrame:");
    unblurredRealSnapshotView = v21->_unblurredRealSnapshotView;
    v21->_unblurredRealSnapshotView = (UIView *)v42;

    [(UIView *)v21->_unblurredRealSnapshotView setContentMode:0];
    v44 = [(_UIBackdropViewSettings *)[SBApplicationBlurContentViewBackdropSettings alloc] initWithDefaultValues];
    v45 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F430A8]), "initWithFrame:settings:", v44, v23, v25, v27, v29);
    v46 = v45;
    double v47 = *p_width;
    if (*p_width < v21->_targetViewOriginalSize.height) {
      double v47 = v21->_targetViewOriginalSize.height;
    }
    double v48 = v29;
    double v49 = fmin(fmax(v47 * 85.0 * 0.0009765625, 20.0), 85.0);
    v50 = [(UIView *)v45 outputSettings];
    [v50 setBlurRadius:v49];

    liveBlurView = v21->_liveBlurView;
    v21->_liveBlurView = v46;
    v52 = v46;

    v53 = -[SBApplicationBlurSnapshotGenerationContainerView initWithFrame:]([SBApplicationBlurSnapshotGenerationContainerView alloc], "initWithFrame:", v23, v25, v27, v48);
    snapshotGenerationContainerView = v21->_snapshotGenerationContainerView;
    v21->_snapshotGenerationContainerView = v53;

    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView addSubview:v21->_liveBlurView];
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView setLiveBlurView:v21->_liveBlurView];
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView setRealSnapshotView:v21->_unblurredRealSnapshotView];
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView addSubview:v21->_unblurredRealSnapshotView];
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView addSubview:v21->_liveBlurView];
    v55 = v21->_snapshotGenerationContainerView;
    [(SBApplicationBlurContentView *)v21 bounds];
    -[SBApplicationBlurSnapshotGenerationContainerView setFrame:](v55, "setFrame:");
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView setNeedsLayout];
    [(SBApplicationBlurSnapshotGenerationContainerView *)v21->_snapshotGenerationContainerView layoutIfNeeded];
    [(SBApplicationBlurContentView *)v21 addSubview:v21->_snapshotGenerationContainerView];
    [(UIView *)v21->_liveBlurView setHidden:1];
    uint64_t v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v65, v39, v40, v41);
    unblurredCopySnapshotView = v21->_unblurredCopySnapshotView;
    v21->_unblurredCopySnapshotView = (UIView *)v56;

    [(SBApplicationBlurContentView *)v21 addSubview:v21->_unblurredCopySnapshotView];
    uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v23, v25, v27, v48);
    blurredSnapshotView = v21->_blurredSnapshotView;
    v21->_blurredSnapshotView = (UIView *)v58;

    [(UIView *)v21->_blurredSnapshotView setAlpha:0.0];
    [(UIView *)v21->_blurredSnapshotView setContentMode:0];
    [(SBApplicationBlurContentView *)v21 addSubview:v21->_blurredSnapshotView];
    v60 = [[SBSceneViewAppIconView alloc] initWithIcon:v17];
    iconView = v21->_iconView;
    v21->_iconView = v60;

    [(SBSceneViewAppIconView *)v21->_iconView setAlpha:0.0];
    [(SBApplicationBlurContentView *)v21 addSubview:v21->_iconView];

    [(SBApplicationBlurContentView *)v21 _setState:0];
    [(SBApplicationBlurContentView *)v21 setNeedsLayout];
    [(SBApplicationBlurContentView *)v21 layoutIfNeeded];
    [(SBApplicationBlurContentView *)v21 setOpaque:1];
  }
  return v21;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_mapStateToCompletionBlocks allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SBApplicationBlurContentView _fireCompletionBlocksForState:](self, "_fireCompletionBlocksForState:", [*(id *)(*((void *)&v9 + 1) + 8 * v7++) unsignedIntegerValue]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBApplicationBlurContentView;
  [(SBApplicationBlurContentView *)&v8 dealloc];
}

- (void)generateBlurredSnapshotWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0uLL:
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __70__SBApplicationBlurContentView_generateBlurredSnapshotWithCompletion___block_invoke;
      v5[3] = &unk_1E6AF8068;
      objc_copyWeak(&v7, &location);
      uint64_t v6 = v4;
      [(SBApplicationBlurContentView *)self _addCompletionBlock:v5 forState:0];

      objc_destroyWeak(&v7);
      break;
    case 1uLL:
      [(SBApplicationBlurContentView *)self _doBlurGenerationWithCompletion:v4];
      break;
    case 2uLL:
      [(SBApplicationBlurContentView *)self _addCompletionBlock:v4 forState:2];
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      if (v4) {
        v4[2](v4);
      }
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);
}

void __70__SBApplicationBlurContentView_generateBlurredSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained generateBlurredSnapshotWithCompletion:*(void *)(a1 + 32)];
}

- (void)animateToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0uLL:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __79__SBApplicationBlurContentView_animateToBlurredSnapshotWithFactory_completion___block_invoke;
      v8[3] = &unk_1E6AF6A20;
      objc_copyWeak(&v11, &location);
      id v9 = v6;
      long long v10 = v7;
      [(SBApplicationBlurContentView *)self _addCompletionBlock:v8 forState:0];

      objc_destroyWeak(&v11);
      break;
    case 1uLL:
    case 2uLL:
      [(SBApplicationBlurContentView *)self generateAndAnimateToBlurredSnapshotWithAnimationFactory:v6 completion:v7];
      break;
    case 3uLL:
      [(SBApplicationBlurContentView *)self _doAnimationToBlurredSnapshotWithFactory:v6 completion:v7];
      break;
    case 4uLL:
      [(SBApplicationBlurContentView *)self _addCompletionBlock:v7 forState:4];
      break;
    case 5uLL:
      if (v7) {
        v7[2](v7);
      }
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);
}

void __79__SBApplicationBlurContentView_animateToBlurredSnapshotWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained animateToBlurredSnapshotWithFactory:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)generateAndAnimateToBlurredSnapshotWithAnimationFactory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__SBApplicationBlurContentView_generateAndAnimateToBlurredSnapshotWithAnimationFactory_completion___block_invoke;
  v10[3] = &unk_1E6AF5FC8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBApplicationBlurContentView *)self generateBlurredSnapshotWithCompletion:v10];
}

uint64_t __99__SBApplicationBlurContentView_generateAndAnimateToBlurredSnapshotWithAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateToBlurredSnapshotWithFactory:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)setIconViewScale:(double)a3
{
  if (self->_iconViewScale != a3)
  {
    self->_iconViewScale = a3;
    [(SBApplicationBlurContentView *)self setNeedsLayout];
    [(SBApplicationBlurContentView *)self layoutIfNeeded];
  }
}

- (void)didMoveToWindow
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke;
  v9[3] = &unk_1E6AF4AC0;
  v9[4] = self;
  v3 = (void (**)(void))MEMORY[0x1D948C7A0](v9, a2);
  uint64_t v4 = [(UIView *)self->_targetViewToBlur layer];
  int v5 = [v4 hasBeenCommitted];

  if (v5)
  {
    v3[2](v3);
  }
  else
  {
    id v6 = (void *)*MEMORY[0x1E4F43630];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke_2;
    v7[3] = &unk_1E6AF5300;
    id v8 = v3;
    objc_msgSend(v6, "sb_performBlockAfterCATransactionSynchronizedCommit:", v7);
  }
}

void __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) window];
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    if (!v3[52])
    {
      id v31 = v2;
      uint64_t v4 = [MEMORY[0x1E4F428B8] blackColor];
      [v3 setBackgroundColor:v4];

      int v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "sb_generateSnapshotContentsSynchronously");
      id v6 = [*(id *)(*(void *)(a1 + 32) + 448) superview];
      id v7 = *(void **)(a1 + 32);

      if (v6 == v7) {
        [*(id *)(*(void *)(a1 + 32) + 448) removeFromSuperview];
      }
      id v8 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
      id v9 = [v8 presentationLayer];

      long long v10 = *(void **)(*(void *)(a1 + 32) + 448);
      if (v9)
      {
        id v11 = [v10 layer];
        id v12 = [v11 presentationLayer];
        [v12 bounds];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
      }
      else
      {
        [v10 bounds];
        double v14 = v21;
        double v16 = v22;
        double v18 = v23;
        double v20 = v24;
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", v14, v16, v18, v20);
      double v25 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
      [v25 setContents:v5];

      double v26 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
      double v27 = [v31 screen];
      [v27 scale];
      objc_msgSend(v26, "setContentsScale:");

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", v14, v16, v18, v20);
      double v28 = [*(id *)(*(void *)(a1 + 32) + 464) layer];
      [v28 setContents:v5];

      double v29 = [*(id *)(*(void *)(a1 + 32) + 464) layer];
      v30 = [v31 screen];
      [v30 scale];
      objc_msgSend(v29, "setContentsScale:");

      [*(id *)(*(void *)(a1 + 32) + 472) setHidden:0];
      [*(id *)(a1 + 32) _setState:1];

      v2 = v31;
    }
  }
}

uint64_t __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)layoutSubviews
{
  [(SBApplicationBlurContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_blurredSnapshotView, "setFrame:");
  -[UIView setFrame:](self->_unblurredCopySnapshotView, "setFrame:", v4, v6, v8, v10);
  if (self->_state >= 3) {
    -[SBApplicationBlurSnapshotGenerationContainerView setFrame:](self->_snapshotGenerationContainerView, "setFrame:", v4, v6, v8, v10);
  }
  if (SBReduceMotion())
  {
    double v11 = v8 / self->_targetViewOriginalSize.width;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      double v12 = 1.0 - v11;
    }
    else {
      double v12 = 0.0;
    }
    double v13 = [(UIView *)self->_unblurredCopySnapshotView layer];
    objc_msgSend(v13, "setContentsRect:", v12, 0.0, v11, 1.0);

    double v14 = [(UIView *)self->_unblurredRealSnapshotView layer];
    objc_msgSend(v14, "setContentsRect:", v12, 0.0, v11, 1.0);
  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, self->_iconViewScale, self->_iconViewScale);
  iconView = self->_iconView;
  CGAffineTransform v17 = v18;
  [(SBSceneViewAppIconView *)iconView setTransform:&v17];
  v19.origin.double x = v4;
  v19.origin.double y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  -[SBSceneViewAppIconView sizeThatFits:](self->_iconView, "sizeThatFits:", CGRectGetWidth(v19), 0.0);
  SBRectWithSize();
  -[SBSceneViewAppIconView setBounds:](self->_iconView, "setBounds:");
  double v16 = self->_iconView;
  UIRectGetCenter();
  -[SBSceneViewAppIconView setCenter:](v16, "setCenter:");
}

- (void)_setState:(unint64_t)a3
{
  p_unint64_t state = &self->_state;
  unint64_t state = self->_state;
  if (state != a3)
  {
    unint64_t *p_state = a3;
    double v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(SBApplicationBlurContentView *)(uint64_t)self _setState:v6];
    }

    [(SBApplicationBlurContentView *)self _fireCompletionBlocksForState:state];
  }
}

- (void)_addCompletionBlock:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v13 = v6;
    mapStateToCompletionBlocks = self->_mapStateToCompletionBlocks;
    double v8 = [NSNumber numberWithUnsignedInteger:a4];
    id v9 = [(NSMutableDictionary *)mapStateToCompletionBlocks objectForKey:v8];

    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v10 = self->_mapStateToCompletionBlocks;
      double v11 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];
    }
    double v12 = (void *)MEMORY[0x1D948C7A0](v13);
    [v9 addObject:v12];

    id v6 = v13;
  }
}

- (void)_fireCompletionBlocksForState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  mapStateToCompletionBlocks = self->_mapStateToCompletionBlocks;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  double v7 = [(NSMutableDictionary *)mapStateToCompletionBlocks objectForKey:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = objc_msgSend(v7, "copy", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  id v13 = self->_mapStateToCompletionBlocks;
  double v14 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v13 removeObjectForKey:v14];
}

- (void)_doBlurGenerationWithCompletion:(id)a3
{
  id v5 = a3;
  if (self->_state != 1)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBApplicationBlurContentView.m" lineNumber:384 description:@"State must be possible to begin generating blurred snapshots."];
  }
  [(SBApplicationBlurContentView *)self _setState:2];
  [(SBApplicationBlurContentView *)self _addCompletionBlock:v5 forState:2];
  id v6 = (void *)*MEMORY[0x1E4F43630];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SBApplicationBlurContentView__doBlurGenerationWithCompletion___block_invoke;
  v8[3] = &unk_1E6AF4AC0;
  void v8[4] = self;
  objc_msgSend(v6, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);
}

void __64__SBApplicationBlurContentView__doBlurGenerationWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "sb_generateSnapshotContentsSynchronously");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(*(void *)(a1 + 32) + 488) layer];
  [v2 setContents:v6];

  double v3 = [*(id *)(*(void *)(a1 + 32) + 488) layer];
  [v3 setContentsScale:SBScreenScale()];

  [*(id *)(*(void *)(a1 + 32) + 496) setLiveBlurView:0];
  [*(id *)(*(void *)(a1 + 32) + 472) removeFromSuperview];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 472);
  *(void *)(v4 + 472) = 0;

  [*(id *)(a1 + 32) _setState:3];
}

- (void)_doAnimationToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_state != 3)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBApplicationBlurContentView.m" lineNumber:405 description:@"State must be idle to begin generating blurred snapshots."];
  }
  [(SBApplicationBlurContentView *)self _setState:4];
  [(SBApplicationBlurContentView *)self _addCompletionBlock:v8 forState:4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  uint64_t v9 = (void (**)(void))MEMORY[0x1D948C7A0](v22);
  uint64_t v10 = [(SBApplicationBlurContentView *)self window];
  uint64_t v11 = v10;
  if (v7
    && v10
    && ([v10 isHidden] & 1) == 0
    && ([(SBApplicationBlurContentView *)self isHiddenOrHasHiddenAncestor] & 1) == 0)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F4F898];
    [(SBApplicationBlurContentView *)self blurDelay];
    double v14 = v13;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_2;
    v21[3] = &unk_1E6AF4AC0;
    v21[4] = self;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_3;
    v19[3] = &unk_1E6AF5A50;
    uint64_t v20 = v9;
    [v12 animateWithFactory:v7 additionalDelay:v21 actions:v19 completion:v14];
    [v7 duration];
    long long v16 = [MEMORY[0x1E4F4F898] factoryWithDuration:v15 delay:v15 * 0.5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_4;
    v18[3] = &unk_1E6AF4AC0;
    v18[4] = self;
    [MEMORY[0x1E4F4F898] animateWithFactory:v16 actions:v18 completion:0];
  }
  else
  {
    [(UIView *)self->_blurredSnapshotView setAlpha:1.0];
    [(SBSceneViewAppIconView *)self->_iconView setAlpha:1.0];
    v9[2](v9);
  }
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 464);
  *(void *)(v2 + 464) = 0;

  [*(id *)(*(void *)(a1 + 32) + 496) removeFromSuperview];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 496);
  *(void *)(v4 + 496) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 456);
  *(void *)(v6 + 456) = 0;

  id v8 = *(void **)(a1 + 32);
  return [v8 _setState:5];
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:1.0];
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:1.0];
}

- (SBSceneViewAppIconView)iconView
{
  return self->_iconView;
}

- (double)iconViewScale
{
  return self->_iconViewScale;
}

- (double)blurDelay
{
  return self->_blurDelay;
}

- (void)setBlurDelay:(double)a3
{
  self->_blurDeladouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_snapshotGenerationContainerView, 0);
  objc_storeStrong((id *)&self->_blurredSnapshotView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_liveBlurView, 0);
  objc_storeStrong((id *)&self->_unblurredCopySnapshotView, 0);
  objc_storeStrong((id *)&self->_unblurredRealSnapshotView, 0);
  objc_storeStrong((id *)&self->_targetViewToBlur, 0);
  objc_storeStrong((id *)&self->_mapStateToCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)_setState:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 408);
  unint64_t v10 = *a2 - 1;
  if (v10 > 4) {
    uint64_t v11 = @"0 - Waiting for snapshot";
  }
  else {
    uint64_t v11 = off_1E6B05B80[v10];
  }
  int v12 = 138413058;
  uint64_t v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = a1;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  __int16 v18 = 2112;
  CGRect v19 = v11;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "<%@:%p - %@>: blur view state changed to: %@", (uint8_t *)&v12, 0x2Au);
}

@end