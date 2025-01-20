@interface VUIAppLoadingViewController
- (BOOL)loading;
- (void)setLoading:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation VUIAppLoadingViewController

- (void)setView:(id)a3
{
  v4 = (UIView *)a3;
  if (!self->_parentView)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    parentView = self->_parentView;
    self->_parentView = v5;

    [(UIView *)self->_parentView setAutoresizingMask:18];
    v7 = self->_parentView;
    v27.receiver = self;
    v27.super_class = (Class)VUIAppLoadingViewController;
    [(VUIAppLoadingViewController *)&v27 setView:v7];
  }
  if (!self->_loadingView)
  {
    v8 = objc_alloc_init(VUIAppSpinnerView);
    loadingView = self->_loadingView;
    self->_loadingView = v8;

    [(VUIAppSpinnerView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_parentView addSubview:self->_loadingView];
    v10 = [(VUIAppSpinnerView *)self->_loadingView leadingAnchor];
    v11 = [(VUIAppLoadingViewController *)self view];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(VUIAppSpinnerView *)self->_loadingView topAnchor];
    v15 = [(VUIAppLoadingViewController *)self view];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(VUIAppSpinnerView *)self->_loadingView trailingAnchor];
    v19 = [(VUIAppLoadingViewController *)self view];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(VUIAppSpinnerView *)self->_loadingView bottomAnchor];
    v23 = [(VUIAppLoadingViewController *)self view];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    [(VUIAppSpinnerView *)self->_loadingView setAlpha:0.0];
  }
  [(UIView *)v4 setAutoresizingMask:18];
  [(UIView *)self->_parentView addSubview:v4];
  principalView = self->_principalView;
  self->_principalView = v4;
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      dispatch_time_t v4 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke;
      block[3] = &unk_1E6DF3D58;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
      [(UIView *)self->_principalView setAlpha:0.0];
    }
    else
    {
      self->_cancelLoading = 1;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_4;
      v6[3] = &unk_1E6DF3D58;
      v6[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_5;
      v5[3] = &unk_1E6DF5B20;
      v5[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v5 completion:0.25];
    }
  }
}

unsigned char *__42__VUIAppLoadingViewController_setLoading___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[1000])
  {
    v3 = [result view];
    [v3 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 976)];

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_2;
    v5[3] = &unk_1E6DF3D58;
    uint64_t v6 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_3;
    v4[3] = &unk_1E6DF5B20;
    v4[4] = v6;
    return (unsigned char *)[MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.25];
  }
  return result;
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:1.0];
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 992);
  return [v2 setAlpha:1.0];
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 976)];

  v3 = *(void **)(a1 + 32);
  return [v3 setNeedsFocusUpdate];
}

- (BOOL)loading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end