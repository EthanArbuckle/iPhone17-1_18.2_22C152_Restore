@interface PXZoomablePhotosInteraction
- (BOOL)_pinchInteractionShouldBegin;
- (BOOL)handlePinch:(id)a3;
- (BOOL)handleTapOnAssetReference:(id)a3;
- (PXAnonymousView)view;
- (PXZoomablePhotosInteraction)init;
- (PXZoomablePhotosInteraction)initWithZoomablePhotosViewModel:(id)a3;
- (PXZoomablePhotosInteractionDelegate)delegate;
- (PXZoomablePhotosViewModel)viewModel;
- (void)setDelegate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PXZoomablePhotosInteraction

- (void)setView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (PXZoomablePhotosInteraction)initWithZoomablePhotosViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXZoomablePhotosInteraction;
  v6 = [(PXZoomablePhotosInteraction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_eventMonitor, 0);
}

- (PXZoomablePhotosInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXZoomablePhotosInteractionDelegate *)WeakRetained;
}

- (PXAnonymousView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (PXAnonymousView *)WeakRetained;
}

- (PXZoomablePhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)handlePinch:(id)a3
{
  id v5 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  v8 = [(PXZoomablePhotosInteraction *)self viewModel];
  objc_super v9 = [(PXZoomablePhotosInteraction *)self view];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  if (v8)
  {
    [v8 pinchState];
    double v10 = *((double *)&v40 + 1);
    uint64_t v11 = v40;
    uint64_t v12 = *((void *)&v36 + 1);
    uint64_t v13 = v36;
    uint64_t v14 = *((void *)&v38 + 1);
    uint64_t v15 = v37;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v15 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    double v10 = 0.0;
  }
  id v16 = [v8 anchorAssetReference];
  if ([v5 state] == 1)
  {
    [(PXZoomablePhotosInteraction *)self _pinchInteractionShouldBegin];
    [v5 locationInView:v9];
    double v18 = v17;
    double v20 = v19;
    v21 = [(PXZoomablePhotosInteraction *)self delegate];
    objc_msgSend(v21, "zoomablePhotosInteraction:assetReferenceAtLocation:", self, v18, v20);
    objc_claimAutoreleasedReturnValue();

    [v9 bounds];
    PXPointNormalize();
  }
  if ([v5 state] != 2) {
    goto LABEL_12;
  }
  if (v11 <= 2 && fmax(v7 - v10, 0.0) > 0.016)
  {
    [v5 scale];
    PXFloatByLinearlyInterpolatingFloats();
  }
  if ([v8 isPinching])
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__PXZoomablePhotosInteraction_handlePinch___block_invoke;
    v24[3] = &unk_1E5DBDFC8;
    id v25 = v5;
    uint64_t v29 = v14;
    SEL v30 = a2;
    id v26 = v9;
    v27 = self;
    uint64_t v31 = v13;
    uint64_t v32 = v12;
    uint64_t v33 = v15;
    uint64_t v34 = v11 + 1;
    double v35 = v7;
    id v16 = v16;
    id v28 = v16;
    [v8 performChanges:v24];
  }
  else
  {
LABEL_12:
    if (![v8 isPinching])
    {
      BOOL v22 = 0;
      goto LABEL_16;
    }
    [v8 performChanges:&__block_literal_global_134844];
  }
  BOOL v22 = 1;
LABEL_16:

  return v22;
}

void __43__PXZoomablePhotosInteraction_handlePinch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a2 setIsPinching:1];
  [*(id *)(a1 + 32) locationInView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) bounds];
  PXPointNormalize();
}

uint64_t __43__PXZoomablePhotosInteraction_handlePinch___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setIsPinching:0];
}

- (BOOL)_pinchInteractionShouldBegin
{
  uint64_t v3 = +[PXZoomablePhotosSettings sharedInstance];
  if ([v3 enablePinch])
  {
    v4 = [(PXZoomablePhotosInteraction *)self viewModel];
    id v5 = [v4 assetsDataSourceManager];
    double v6 = [v5 dataSource];
    if ([v6 containsAnyItems])
    {
      double v7 = [(PXZoomablePhotosInteraction *)self delegate];
      char v8 = [v7 zoomablePhotosInteractionShouldBegin:self];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)handleTapOnAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXZoomablePhotosInteraction *)self viewModel];
  char v6 = [v5 isDisplayingIndividualItems];

  if ((v6 & 1) == 0)
  {
    double v7 = [(PXZoomablePhotosInteraction *)self viewModel];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PXZoomablePhotosInteraction_handleTapOnAssetReference___block_invoke;
    v9[3] = &unk_1E5DBDFA0;
    id v10 = v4;
    [v7 performChanges:v9];
  }
  return v6 ^ 1;
}

uint64_t __57__PXZoomablePhotosInteraction_handleTapOnAssetReference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoomInToLastRememberedWithAnchorAssetReference:*(void *)(a1 + 32) animated:1];
}

- (PXZoomablePhotosInteraction)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomablePhotosInteraction.m", 32, @"%s is not available as initializer", "-[PXZoomablePhotosInteraction init]");

  abort();
}

@end