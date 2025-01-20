@interface PXPhotosViewInteraction
+ (PXPhotosViewInteraction)interactionWithViewModel:(id)a3;
- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3;
- (PXPhotosContentController)contentController;
- (PXPhotosViewInteraction)initWithViewModel:(id)a3;
- (PXPhotosViewInteractionDelegate)delegate;
- (PXPhotosViewModel)viewModel;
- (PXZoomablePhotosInteraction)zoomablePhotosInteraction;
- (id)assetHitTestResultAtPoint:(CGPoint)a3 coordinateSpace:(id)a4;
- (id)assetReferenceAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 inCoordinateSpace:(id)a5;
- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6;
- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4;
- (void)setContentController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setZoomablePhotosInteraction:(id)a3;
- (void)zoomablePhotosInteractionWillBegin:(id)a3;
@end

@implementation PXPhotosViewInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosInteraction, 0);
  objc_destroyWeak((id *)&self->_contentController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXZoomablePhotosInteraction)zoomablePhotosInteraction
{
  return self->_zoomablePhotosInteraction;
}

- (void)setContentController:(id)a3
{
}

- (PXPhotosContentController)contentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentController);
  return (PXPhotosContentController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosViewInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosViewInteractionDelegate *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = [(PXGInteraction *)self view];
  v8 = -[PXPhotosViewInteraction assetHitTestResultAtPoint:coordinateSpace:](self, "assetHitTestResultAtPoint:coordinateSpace:", v7, x, y);

  v9 = [v8 userData];

  return v9;
}

- (void)zoomablePhotosInteractionWillBegin:(id)a3
{
  v3 = [(PXPhotosViewInteraction *)self viewModel];
  id v6 = [v3 dataSourceManager];

  v4 = [v6 dataSource];
  char v5 = [v4 areAllSectionsConsideredAccurate];

  if ((v5 & 1) == 0) {
    [v6 performChanges:&__block_literal_global_4_193578];
  }
}

uint64_t __62__PXPhotosViewInteraction_zoomablePhotosInteractionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceAccurateAllSectionsIfNeeded];
}

- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3
{
  return 1;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6
{
  id v9 = a5;
  id v10 = a3;
  v11 = [(PXGInteraction *)self view];
  v12 = [(PXGInteraction *)self layout];
  v13 = PXRegionOfInterestForAssetReference(v11, v12, v10, (uint64_t *)a4, v9);

  return v13;
}

- (id)assetReferenceAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 inCoordinateSpace:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double y = a3.y;
  double x = a3.x;
  id v12 = a5;
  v13 = [(PXGInteraction *)self view];
  objc_msgSend(v13, "convertPoint:fromCoordinateSpace:", v12, x, y);
  double v15 = v14;
  double v17 = v16;

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__193580;
  v27 = __Block_byref_object_dispose__193581;
  id v28 = 0;
  v18 = [(PXGInteraction *)self view];
  v19 = objc_msgSend(v18, "hitTestResultsAtPoint:padding:passingTest:", 0, v15, v17, top, left, bottom, right);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PXPhotosViewInteraction_assetReferenceAtLocation_withPadding_inCoordinateSpace___block_invoke;
  v22[3] = &unk_1E5DC38C8;
  v22[4] = &v23;
  [v19 enumerateObjectsUsingBlock:v22];

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

void __82__PXPhotosViewInteraction_assetReferenceAtLocation_withPadding_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 identifier];
  v7 = @"PXPhotosLayoutHitTestIdentifierAsset";
  if (v6 == @"PXPhotosLayoutHitTestIdentifierAsset")
  {

    goto LABEL_5;
  }
  int v8 = [(__CFString *)v6 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

  id v9 = v13;
  if (v8)
  {
LABEL_5:
    uint64_t v10 = [v13 userData];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v9 = v13;
    *a4 = 1;
  }
}

- (id)assetHitTestResultAtPoint:(CGPoint)a3 coordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PXGInteraction *)self view];
  objc_msgSend(v6, "hitTestResultsAtPoint:", x, y);
  objc_claimAutoreleasedReturnValue();

  PXFind();
}

uint64_t __69__PXPhotosViewInteraction_assetHitTestResultAtPoint_coordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  v3 = v2;
  if (v2 == @"PXPhotosLayoutHitTestIdentifierAsset") {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];
  }

  return v4;
}

- (void)setZoomablePhotosInteraction:(id)a3
{
  id v9 = (PXZoomablePhotosInteraction *)a3;
  char v5 = self->_zoomablePhotosInteraction;
  id v6 = v9;
  if (v5 != v9)
  {
    v7 = v5;
    char v8 = [(PXZoomablePhotosInteraction *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    [(PXZoomablePhotosInteraction *)self->_zoomablePhotosInteraction setDelegate:0];
    objc_storeStrong((id *)&self->_zoomablePhotosInteraction, a3);
    [(PXZoomablePhotosInteraction *)v9 setDelegate:self];
    id v6 = [(PXGInteraction *)self view];
    [(PXZoomablePhotosInteraction *)v9 setView:v6];
  }

LABEL_5:
}

- (PXPhotosViewInteraction)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosViewInteraction;
  id v6 = [(PXPhotosViewInteraction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

+ (PXPhotosViewInteraction)interactionWithViewModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(PXPhotosViewInteraction *)[PXPhotosViewUIInteraction alloc] initWithViewModel:v3];

  return (PXPhotosViewInteraction *)v4;
}

@end