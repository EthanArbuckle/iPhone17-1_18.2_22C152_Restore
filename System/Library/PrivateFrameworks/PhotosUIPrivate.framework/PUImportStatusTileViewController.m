@interface PUImportStatusTileViewController
- (BOOL)_isPerformingChanges;
- (PUAssetViewModel)assetViewModel;
- (void)_updateIfNeeded;
- (void)_updateStatusView;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)performChanges:(id)a3;
- (void)setAssetViewModel:(id)a3;
- (void)set_isPerformingChanges:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUImportStatusTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_successView, 0);
}

- (void)set_isPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)applyLayoutInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportStatusTileViewController;
  [(PUTileViewController *)&v7 applyLayoutInfo:a3];
  v4 = [(PUTileViewController *)self view];
  [v4 bounds];
  double MidX = CGRectGetMidX(v8);
  [v4 bounds];
  double MidY = CGRectGetMidY(v9);
  -[UIView setCenter:](self->_successView, "setCenter:", MidX, MidY);
  -[UIView setCenter:](self->_errorView, "setCenter:", MidX, MidY);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUImportStatusTileViewController *)self assetViewModel];

  if (v8 == v7 && [v6 importStateChanged])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PUImportStatusTileViewController_viewModel_didChange___block_invoke;
    v9[3] = &unk_1E5F2ED10;
    v9[4] = self;
    [(PUImportStatusTileViewController *)self performChanges:v9];
  }
}

uint64_t __56__PUImportStatusTileViewController_viewModel_didChange___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 184) && (*(unsigned char *)(*(void *)(result + 32) + 176) & 1) != 0)
  {
    v1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"-[PUImportStatusTileViewController viewModel:didChange:]_block_invoke"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PUImportStatusTileViewController.m", 162, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  *(void *)(*(void *)(result + 32) + 168) |= 1uLL;
  return result;
}

- (void)_updateStatusView
{
  if (![(PUTileViewController *)self isViewLoaded]) {
    return;
  }
  v3 = [(PUImportStatusTileViewController *)self assetViewModel];
  uint64_t v4 = [v3 importState];

  id v19 = [(PUTileViewController *)self view];
  [v19 bounds];
  double MidX = CGRectGetMidX(v21);
  [v19 bounds];
  double MidY = CGRectGetMidY(v22);
  successView = self->_successView;
  if (v4 == 2)
  {
    if (!successView)
    {
      PXImportBadgeViewForTypeAndSelectable();
      id v8 = (UIView *)objc_claimAutoreleasedReturnValue();
      CGRect v9 = self->_successView;
      self->_successView = v8;

      -[UIView setCenter:](self->_successView, "setCenter:", MidX, MidY);
      [v19 addSubview:self->_successView];
      successView = self->_successView;
    }
    [(UIView *)successView setHidden:0];
    p_progressIndicatorView = (id *)&self->_progressIndicatorView;
    progressIndicatorView = self->_progressIndicatorView;
  }
  else
  {
    [(UIView *)successView setHidden:1];
    p_progressIndicatorView = (id *)&self->_progressIndicatorView;
    progressIndicatorView = self->_progressIndicatorView;
    if (v4 == 1)
    {
      if (!progressIndicatorView)
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        id v13 = *p_progressIndicatorView;
        id *p_progressIndicatorView = (id)v12;

        v14 = [MEMORY[0x1E4FB1618] whiteColor];
        [*p_progressIndicatorView setColor:v14];

        [v19 bounds];
        objc_msgSend(*p_progressIndicatorView, "setFrame:");
        [*p_progressIndicatorView setAutoresizingMask:18];
        [v19 addSubview:*p_progressIndicatorView];
        progressIndicatorView = (UIActivityIndicatorView *)*p_progressIndicatorView;
      }
      [(UIActivityIndicatorView *)progressIndicatorView setHidden:0];
      [*p_progressIndicatorView startAnimating];
      errorView = self->_errorView;
      goto LABEL_15;
    }
  }
  [(UIActivityIndicatorView *)progressIndicatorView setHidden:1];
  [*p_progressIndicatorView stopAnimating];
  errorView = self->_errorView;
  if (v4 == 3)
  {
    if (!errorView)
    {
      PXImportBadgeViewForTypeAndSelectable();
      v16 = (UIView *)objc_claimAutoreleasedReturnValue();
      v17 = self->_errorView;
      self->_errorView = v16;

      -[UIView setCenter:](self->_errorView, "setCenter:", MidX, MidY);
      [v19 addSubview:self->_errorView];
      errorView = self->_errorView;
    }
    uint64_t v18 = 0;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v18 = 1;
LABEL_16:
  [(UIView *)errorView setHidden:v18];
}

- (void)_updateIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PUImportStatusTileViewController _updateIfNeeded]"];
      [v5 handleFailureInFunction:v6, @"PUImportStatusTileViewController.m", 82, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PUImportStatusTileViewController *)self _updateStatusView];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[PUImportStatusTileViewController _updateIfNeeded]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, @"PUImportStatusTileViewController.m", 86, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
}

- (void)performChanges:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL v5 = [(PUImportStatusTileViewController *)self _isPerformingChanges];
  [(PUImportStatusTileViewController *)self set_isPerformingChanges:1];
  v4[2](v4);

  [(PUImportStatusTileViewController *)self set_isPerformingChanges:v5];
  if (!v5)
  {
    [(PUImportStatusTileViewController *)self _updateIfNeeded];
  }
}

- (void)setAssetViewModel:(id)a3
{
  BOOL v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__PUImportStatusTileViewController_setAssetViewModel___block_invoke;
    v7[3] = &unk_1E5F2ED10;
    v7[4] = self;
    [(PUImportStatusTileViewController *)self performChanges:v7];
  }
}

uint64_t __54__PUImportStatusTileViewController_setAssetViewModel___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 184) && (*(unsigned char *)(*(void *)(result + 32) + 176) & 1) != 0)
  {
    v1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"-[PUImportStatusTileViewController setAssetViewModel:]_block_invoke"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PUImportStatusTileViewController.m", 63, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  *(void *)(*(void *)(result + 32) + 168) |= 1uLL;
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportStatusTileViewController;
  [(PUTileViewController *)&v5 viewDidLoad];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportStatusTileViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [(PUImportStatusTileViewController *)self performChanges:v4];
  v3 = [(PUTileViewController *)self view];
  [v3 setUserInteractionEnabled:0];
}

uint64_t __47__PUImportStatusTileViewController_viewDidLoad__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 184) && (*(unsigned char *)(*(void *)(result + 32) + 176) & 1) != 0)
  {
    v1 = [MEMORY[0x1E4F28B00] currentHandler];
    v2 = [NSString stringWithUTF8String:"-[PUImportStatusTileViewController viewDidLoad]_block_invoke"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PUImportStatusTileViewController.m", 48, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  *(void *)(*(void *)(result + 32) + 168) |= 1uLL;
  return result;
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportStatusTileViewController;
  [(PUTileViewController *)&v4 becomeReusable];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PUImportStatusTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUImportStatusTileViewController *)self performChanges:v3];
}

uint64_t __50__PUImportStatusTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetViewModel:0];
}

@end