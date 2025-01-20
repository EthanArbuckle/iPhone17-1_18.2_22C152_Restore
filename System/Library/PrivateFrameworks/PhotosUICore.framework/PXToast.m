@interface PXToast
+ (id)show:(id)a3;
- (BOOL)isShown;
- (NSLayoutConstraint)offscreenConstraint;
- (NSLayoutConstraint)onscreenConstraint;
- (PXToast)initWithConfiguration:(id)a3;
- (UIView)view;
- (double)bottomMargin;
- (void)_dismissAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_handleSwipe:(id)a3;
- (void)_present;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissAnimated:(BOOL)a3 afterDelay:(double)a4;
- (void)setBottomMargin:(double)a3;
- (void)setIsShown:(BOOL)a3;
- (void)setOffscreenConstraint:(id)a3;
- (void)setOnscreenConstraint:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PXToast

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_offscreenConstraint, 0);
  objc_storeStrong((id *)&self->_onscreenConstraint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (BOOL)isShown
{
  return self->_isShown;
}

- (void)setView:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setOffscreenConstraint:(id)a3
{
}

- (NSLayoutConstraint)offscreenConstraint
{
  return self->_offscreenConstraint;
}

- (void)setOnscreenConstraint:(id)a3
{
}

- (NSLayoutConstraint)onscreenConstraint
{
  return self->_onscreenConstraint;
}

- (void)_handleSwipe:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PXToast *)self dismissAnimated:1];
  }
}

- (void)_dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  v7 = [(PXToast *)self view];
  [(PXToastConfiguration *)self->_configuration setContentView:0];
  uint64_t v8 = [v7 window];
  v9 = (void *)v8;
  if (v4 && v8)
  {
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke;
    v21[3] = &unk_1E5DD32A8;
    v21[4] = self;
    id v22 = v9;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5DB7F00;
    id v11 = v7;
    id v18 = v11;
    v19 = v6;
    objc_copyWeak(&v20, &location);
    [v10 animateWithDuration:0x10000 delay:v21 options:v17 animations:0.5 completion:0.0];
    v12 = [v11 layer];
    LODWORD(v13) = 1.0;
    [v12 setOpacity:v13];

    v14 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke_3;
    v15[3] = &unk_1E5DD36F8;
    id v16 = v11;
    [v14 animateWithDuration:0x20000 delay:v15 options:0 animations:0.2 completion:0.0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    [v7 removeFromSuperview];
    [(PXToast *)self setIsShown:0];
    v6[2](v6);
  }
}

uint64_t __46__PXToast__dismissAnimated_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) offscreenConstraint];
  [v2 setActive:1];

  v3 = [*(id *)(a1 + 32) onscreenConstraint];
  [v3 setActive:0];

  BOOL v4 = *(void **)(a1 + 40);
  return [v4 layoutIfNeeded];
}

void __46__PXToast__dismissAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setIsShown:0];
}

void __46__PXToast__dismissAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setOpacity:0.0];
}

- (void)dismissAnimated:(BOOL)a3 afterDelay:(double)a4
{
  objc_initWeak(&location, self);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PXToast_dismissAnimated_afterDelay___block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__PXToast_dismissAnimated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAnimated:*(unsigned __int8 *)(a1 + 40) completionHandler:&__block_literal_global_11_86687];
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (void)setBottomMargin:(double)a3
{
  if (self->_bottomMargin != a3)
  {
    self->_bottomMargin = a3;
    double v3 = -a3;
    id v4 = [(PXToast *)self onscreenConstraint];
    [v4 setConstant:v3];
  }
}

- (void)_present
{
  v47[1] = *MEMORY[0x1E4F143B8];
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0 && ![(PXToast *)self isShown])
  {
    double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v4 = objc_msgSend(v3, "px_firstKeyWindow");

    uint64_t v5 = [(PXToastConfiguration *)self->_configuration sourceView];
    dispatch_time_t v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = (void *)v4;
    }
    id v8 = v7;

    if (!v8) {
      PXAssertGetLog();
    }
    v36 = (void *)v4;
    [(PXToast *)self setIsShown:1];
    BOOL v9 = [(PXToastConfiguration *)self->_configuration contentView];
    if (!v9) {
      BOOL v9 = [[PXToastDefaultContentView alloc] initWithToastConfiguration:self->_configuration];
    }
    [(PXToast *)self setView:v9];
    [v8 addSubview:v9];
    [v8 bringSubviewToFront:v9];
    [(PXToastDefaultContentView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = (void *)MEMORY[0x1E4F28DC8];
    id v11 = [(PXToastDefaultContentView *)v9 widthAnchor];
    [v8 bounds];
    v12 = [v11 constraintLessThanOrEqualToConstant:CGRectGetWidth(v48) + -20.0];
    v47[0] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    [v10 activateConstraints:v13];

    if ([(PXToastConfiguration *)self->_configuration canSwipeToDismiss])
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel__handleSwipe_];
      [v14 setDirection:8];
      [(PXToastDefaultContentView *)v9 addGestureRecognizer:v14];
    }
    v15 = [(PXToastDefaultContentView *)v9 bottomAnchor];
    id v16 = [v8 bottomAnchor];
    [(PXToast *)self bottomMargin];
    id v18 = [v15 constraintEqualToAnchor:v16 constant:-v17];

    v19 = [(PXToastDefaultContentView *)v9 topAnchor];
    id v20 = [v8 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:0.0];

    id v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(PXToastDefaultContentView *)v9 centerXAnchor];
    v24 = [v8 centerXAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v46[0] = v25;
    v46[1] = v21;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    [v22 activateConstraints:v26];

    [v8 layoutIfNeeded];
    v27 = (void *)MEMORY[0x1E4FB1EB0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __19__PXToast__present__block_invoke;
    v42[3] = &unk_1E5DD0F30;
    id v28 = v21;
    id v43 = v28;
    id v29 = v18;
    id v44 = v29;
    id v45 = v8;
    [v27 animateWithDuration:0x20000 delay:v42 options:0 animations:0.5 completion:0.0];
    v30 = [(PXToastDefaultContentView *)v9 layer];
    [v30 setOpacity:0.0];

    v31 = (void *)MEMORY[0x1E4FB1EB0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __19__PXToast__present__block_invoke_2;
    v40[3] = &unk_1E5DD36F8;
    v32 = v9;
    v41 = v32;
    [v31 animateWithDuration:0x10000 delay:v40 options:0 animations:0.2 completion:0.3];
    [(PXToast *)self setOnscreenConstraint:v29];
    [(PXToast *)self setOffscreenConstraint:v28];
    [(PXToastConfiguration *)self->_configuration autoDismissalDelay];
    if (v33 > 0.0)
    {
      double v34 = v33;
      objc_initWeak(&location, self);
      dispatch_time_t v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __19__PXToast__present__block_invoke_3;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v38, &location);
      dispatch_after(v35, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __19__PXToast__present__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:0];
  [*(id *)(a1 + 40) setActive:1];
  v2 = *(void **)(a1 + 48);
  return [v2 layoutIfNeeded];
}

void __19__PXToast__present__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

void __19__PXToast__present__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAnimated:1];
}

- (void)setIsShown:(BOOL)a3
{
  if (self->_isShown != a3)
  {
    self->_isShown = a3;
    uint64_t v4 = (void *)_activeToasts;
    if (a3)
    {
      if (!_activeToasts)
      {
        uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
        dispatch_time_t v6 = (void *)_activeToasts;
        _activeToasts = v5;

        uint64_t v4 = (void *)_activeToasts;
      }
      [v4 addObject:self];
    }
    else
    {
      [v4 removeObject:self];
    }
  }
}

- (PXToast)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXToast;
  dispatch_time_t v6 = [(PXToast *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [v5 bottomMargin];
    -[PXToast setBottomMargin:](v7, "setBottomMargin:");
  }

  return v7;
}

+ (id)show:(id)a3
{
  uint64_t v4 = (void (**)(id, PXToastConfiguration *))a3;
  id v5 = objc_alloc_init(PXToastConfiguration);
  v4[2](v4, v5);

  dispatch_time_t v6 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v5];
  [v6 _present];

  return v6;
}

@end