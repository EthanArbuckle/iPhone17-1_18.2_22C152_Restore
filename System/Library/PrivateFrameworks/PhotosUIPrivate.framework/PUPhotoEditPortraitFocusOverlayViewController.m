@interface PUPhotoEditPortraitFocusOverlayViewController
- (BOOL)_isValidRect:(CGRect)a3;
- (CGRect)currentFocusRect;
- (PUPhotoEditPortraitFocusDelegate)portraitFocusDelegate;
- (PUPhotoEditPortraitFocusOverlayViewController)initWithMediaView:(id)a3 isHDR:(BOOL)a4 delegate:(id)a5;
- (PUPhotoEditToolControllerDelegate)delegate;
- (void)focusPointChanged:(CGPoint)a3;
- (void)loadView;
- (void)mediaViewIsReady;
- (void)setDelegate:(id)a3;
- (void)setPortraitFocusDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPhotoEditPortraitFocusOverlayViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_portraitFocusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portraitFocusView, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
}

- (void)setPortraitFocusDelegate:(id)a3
{
}

- (PUPhotoEditPortraitFocusDelegate)portraitFocusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_portraitFocusDelegate);
  return (PUPhotoEditPortraitFocusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditToolControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditToolControllerDelegate *)WeakRetained;
}

- (void)mediaViewIsReady
{
  if (([(PXUIPortraitFocusView *)self->_portraitFocusView drawingEnabled] & 1) == 0)
  {
    [(PXUIPortraitFocusView *)self->_portraitFocusView setDrawingEnabled:1];
    id v3 = [(PUPhotoEditPortraitFocusOverlayViewController *)self view];
    [v3 setNeedsDisplay];
  }
}

- (CGRect)currentFocusRect
{
  id v3 = [(PUPhotoEditPortraitFocusOverlayViewController *)self delegate];
  [v3 toolControllerOriginalImageSize:0];
  double v5 = v4;
  double v7 = v6;

  v8 = [(PUPhotoEditPortraitFocusOverlayViewController *)self portraitFocusDelegate];
  [v8 currentFocusRect];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v33.origin.x = v10;
  v33.origin.y = v12;
  v33.size.width = v14;
  v33.size.height = v16;
  double MidX = CGRectGetMidX(v33);
  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  CGFloat v18 = CGRectGetMidY(v34) * v7;
  v19 = [(PUPhotoEditPortraitFocusOverlayViewController *)self delegate];
  v20 = [(PUPhotoEditPortraitFocusOverlayViewController *)self view];
  objc_msgSend(v19, "toolController:viewPointFromOriginalPoint:view:", 0, v20, MidX * v5, v18);
  double v22 = v21;
  double v24 = v23;

  double v25 = v22 + -37.5;
  double v26 = v24 + -37.5;
  *(double *)&uint64_t v27 = 75.0;
  if (-[PUPhotoEditPortraitFocusOverlayViewController _isValidRect:](self, "_isValidRect:", v25, v26, 75.0, 75.0))
  {
    double v28 = 75.0;
  }
  else
  {
    v35.origin.x = v25;
    v35.origin.y = v26;
    v35.size.width = 75.0;
    v35.size.height = 75.0;
    v32 = NSStringFromCGRect(v35);
    _PFAssertContinueHandler();

    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v27 = *(uint64_t *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v29 = v25;
  double v30 = v26;
  double v31 = *(double *)&v27;
  result.size.height = v28;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)focusPointChanged:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v6 = [(PUPhotoEditPortraitFocusOverlayViewController *)self delegate];
  [v6 toolControllerOriginalImageSize:0];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 / v10;
  double v12 = fabs(v8 / v10);
  if ((unint64_t)(*(void *)&v12 - 0x10000000000000) >> 53 >= 0x3FF
    && (unint64_t)(*(void *)&v12 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    v50.width = v8;
    v50.height = v10;
    v32 = NSStringFromCGSize(v50);
    _PFAssertContinueHandler();
  }
  else
  {
    CGFloat v14 = [(PUPhotoEditPortraitFocusOverlayViewController *)self delegate];
    double v15 = [(PUPhotoEditPortraitFocusOverlayViewController *)self view];
    objc_msgSend(v14, "toolController:originalPointFromViewPoint:view:", 0, v15, x, y);
    double v17 = v16;
    double v19 = v18;

    double v20 = v19 / v10;
    *(double *)v21.i64 = v17 / v8;
    *(double *)&v21.i64[1] = v19 / v10;
    if (v17 / v8 < 0.0 || v17 / v8 > 1.0 || v20 < 0.0 || v20 > 1.0)
    {
      float64x2_t v33 = (float64x2_t)v21;
      double v22 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v46.double x = x;
        v46.double y = y;
        double v23 = NSStringFromCGPoint(v46);
        v47.width = v8;
        v47.height = v10;
        double v24 = NSStringFromCGSize(v47);
        v48.double x = v17;
        v48.double y = v19;
        double v25 = NSStringFromCGPoint(v48);
        v49.double x = v17 / v8;
        v49.double y = v19 / v10;
        double v26 = NSStringFromCGPoint(v49);
        *(_DWORD *)buf = 138413314;
        CGRect v35 = v23;
        __int16 v36 = 2112;
        v37 = v24;
        __int16 v38 = 2048;
        double v39 = v8 / v10;
        __int16 v40 = 2112;
        v41 = v25;
        __int16 v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "Portrait focus rect normalized point outside of bounds: focusPoint: %@, originalSize: %@, aspect: %0.2f, originalPoint: %@, normalizedPoint: %@", buf, 0x34u);
      }
      float64x2_t v27 = vaddq_f64(*MEMORY[0x1E4F8A248], *(float64x2_t *)(MEMORY[0x1E4F8A248] + 16));
      float64x2_t v28 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v27, v33), (int8x16_t)v33, (int8x16_t)v27);
      int8x16_t v21 = vbslq_s8((int8x16_t)vcgtq_f64(v28, *MEMORY[0x1E4F8A248]), (int8x16_t)v28, *MEMORY[0x1E4F8A248]);
    }
    double v29 = *(double *)v21.i64 + -0.1 / v11;
    double v30 = *(double *)&v21.i64[1] + -0.1;
    double v31 = [(PUPhotoEditPortraitFocusOverlayViewController *)self portraitFocusDelegate];
    objc_msgSend(v31, "focusRectChanged:", v29, v30, 0.2 / v11, 0.2);

    [(PXUIPortraitFocusView *)self->_portraitFocusView animateNextRender];
    [(PXUIPortraitFocusView *)self->_portraitFocusView setNeedsDisplay];
  }
}

- (BOOL)_isValidRect:(CGRect)a3
{
  BOOL v3 = 0;
  if (fabs(a3.origin.x) != INFINITY) {
    BOOL v3 = fabs(a3.origin.y) != INFINITY;
  }
  BOOL v4 = 0;
  if (fabs(a3.size.width) != INFINITY)
  {
    BOOL v4 = fabs(a3.size.height) != INFINITY;
    if (a3.size.width < 0.0) {
      BOOL v4 = 0;
    }
    if (a3.size.height < 0.0) {
      BOOL v4 = 0;
    }
  }
  return v3 && v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  id v7 = a4;
  -[PUPhotoEditPortraitFocusOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(PUPhotoEditPortraitFocusOverlayViewController *)self view];
  [v8 setAlpha:0.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5F2B9D0;
  v9[4] = self;
  [v7 animateAlongsideTransition:0 completion:v9];
}

void __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsDisplay];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.2];
}

void __100__PUPhotoEditPortraitFocusOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXUIPortraitFocusView *)self->_portraitFocusView setDrawingEnabled:0];
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  [(PUPhotoEditPortraitFocusOverlayViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  [(PUPhotoEditPortraitFocusOverlayViewController *)&v26 viewDidLayoutSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  [(NUMediaView *)self->_mediaView imageFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(PUPhotoEditPortraitFocusOverlayViewController *)self parentViewController];
  double v13 = [v12 view];
  CGFloat v14 = [(NUMediaView *)self->_mediaView superview];
  objc_msgSend(v13, "convertRect:fromView:", v14, v5, v7, v9, v11);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v27.origin.double x = v16;
  v27.origin.double y = v18;
  v27.size.double width = v20;
  v27.size.double height = v22;
  double v23 = CGPathCreateWithRect(v27, 0);
  [v3 setPath:v23];
  CGPathRelease(v23);
  double v24 = [(PUPhotoEditPortraitFocusOverlayViewController *)self view];
  double v25 = [v24 layer];
  [v25 setMask:v3];
}

- (void)loadView
{
}

- (PUPhotoEditPortraitFocusOverlayViewController)initWithMediaView:(id)a3 isHDR:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v11 = a5;
  double v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    CGFloat v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUPhotoEditPortraitFocusOverlayViewController.m", 26, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  double v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PUPhotoEditPortraitFocusOverlayViewController.m", 27, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditPortraitFocusOverlayViewController;
  double v13 = [(PUPhotoEditPortraitFocusOverlayViewController *)&v20 init];
  CGFloat v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mediaView, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F90878]) initWithMediaView:v10 isHDR:v6];
    portraitFocusView = v14->_portraitFocusView;
    v14->_portraitFocusView = (PXUIPortraitFocusView *)v15;

    [(PXUIPortraitFocusView *)v14->_portraitFocusView setFocusViewDelegate:v14];
  }

  return v14;
}

@end