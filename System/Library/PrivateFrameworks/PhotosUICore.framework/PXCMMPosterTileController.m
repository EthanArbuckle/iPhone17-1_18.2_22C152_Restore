@interface PXCMMPosterTileController
+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5;
- (PXCMMPosterTileController)init;
- (PXCMMPosterTileController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5;
- (UIView)view;
- (void)_updateContent;
- (void)_updateStatusString;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
@end

@implementation PXCMMPosterTileController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterHeaderView, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXViewModelObservationContext == a5)
  {
    if ((v6 & 0x81) == 0) {
      goto LABEL_8;
    }
    id v11 = v9;
    [(PXCMMPosterTileController *)self _updateContent];
    goto LABEL_7;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCMMPosterTileController.m" lineNumber:130 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x2011) != 0)
  {
    id v11 = v9;
    [(PXCMMPosterTileController *)self _updateStatusString];
LABEL_7:
    id v9 = v11;
  }
LABEL_8:
}

- (void)_updateStatusString
{
  v3 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation idleTitle];
  int64_t v4 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation type];
  int64_t v5 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation state];
  if (v4 | v5) {
    BOOL v6 = v5 == 5;
  }
  else {
    BOOL v6 = 1;
  }
  char v8 = v6 || v5 == 6;
  id v9 = [(PXCMMPosterHeaderView *)self->_posterHeaderView viewModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PXCMMPosterTileController__updateStatusString__block_invoke;
  v11[3] = &unk_1E5DAE698;
  id v12 = v3;
  char v13 = v8;
  id v10 = v3;
  [v9 performChanges:v11];
}

void __48__PXCMMPosterTileController__updateStatusString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStatusString:v3];
  [v4 setShowStatusCheckmark:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateContent
{
  uint64_t v3 = [(PXCMMPosterHeaderView *)self->_posterHeaderView viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PXCMMPosterTileController__updateContent__block_invoke;
  v4[3] = &unk_1E5DB9EE0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __43__PXCMMPosterTileController__updateContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  int64_t v5 = [v3 title];
  [v4 setTitle:v5];

  BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 16) subtitle];
  [v4 setSubtitle:v6];

  v7 = [*(id *)(*(void *)(a1 + 32) + 16) posterAsset];
  [v4 setAsset:v7];

  id v8 = [*(id *)(*(void *)(a1 + 32) + 16) posterMediaProvider];
  [v4 setMediaProvider:v8];
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
}

- (UIView)view
{
  posterHeaderView = self->_posterHeaderView;
  if (!posterHeaderView)
  {
    id v4 = [[PXCMMPosterHeaderView alloc] initWithPresentationStyle:0];
    int64_t v5 = self->_posterHeaderView;
    self->_posterHeaderView = v4;

    [(PXCMMPosterTileController *)self _updateContent];
    [(PXCMMPosterTileController *)self _updateStatusString];
    posterHeaderView = self->_posterHeaderView;
  }
  return (UIView *)posterHeaderView;
}

- (PXCMMPosterTileController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXCMMPosterTileController;
  id v11 = [(PXCMMPosterTileController *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    v11->_activityType = a3;
    objc_storeStrong((id *)&v11->_viewModel, a4);
    [(PXCMMViewModel *)v12->_viewModel registerChangeObserver:v12 context:PXViewModelObservationContext];
    objc_storeStrong((id *)&v12->_momentShareStatusPresentation, a5);
    [(PXMomentShareStatusPresentation *)v12->_momentShareStatusPresentation registerChangeObserver:v12 context:PXMomentShareStatusPresentationObservationContext];
  }

  return v12;
}

- (PXCMMPosterTileController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPosterTileController.m", 44, @"%s is not available as initializer", "-[PXCMMPosterTileController init]");

  abort();
}

+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5
{
  +[PXCMMPosterHeaderView preferredHeightForWidth:a4 traitCollection:a5 screen:a3];
  return result;
}

@end