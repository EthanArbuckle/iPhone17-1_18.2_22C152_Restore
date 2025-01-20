@interface PUCleanupOverlayViewController
- (BOOL)isHDR;
- (ImmediatePanGestureRecognizer)panGestureRecognizer;
- (NUMediaView)mediaView;
- (NUMutableBrushStroke)brushStroke;
- (PIInpaintMask)brushStrokeExclusionMask;
- (PUCleanupOverlayView)overlayView;
- (PUCleanupOverlayViewController)initWithMediaView:(id)a3 isHDR:(BOOL)a4;
- (PUCleanupOverlayViewControllerDelegate)overlayControllerDelegate;
- (PUCleanupToolBrushView)brushView;
- (PUVFXBrushView)vfxBrushView;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPointerInteraction)mediaViewPointerInteraction;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)touchType;
- (unint64_t)cleanupMode;
- (void)createBrushView;
- (void)enableBrushSizeFeedback:(BOOL)a3;
- (void)fadeOutBrushStrokeWithDuration:(double)a3;
- (void)hovered:(id)a3;
- (void)loadView;
- (void)longPressed:(id)a3;
- (void)mediaViewIsReady;
- (void)panned:(id)a3;
- (void)removeBrushView;
- (void)setBrushStroke:(id)a3;
- (void)setBrushStrokeExclusionMask:(id)a3;
- (void)setBrushView:(id)a3;
- (void)setCleanupMode:(unint64_t)a3;
- (void)setHoverGestureRecognizer:(id)a3;
- (void)setIsHDR:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMediaView:(id)a3;
- (void)setMediaViewPointerInteraction:(id)a3;
- (void)setOverlayControllerDelegate:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTouchType:(int64_t)a3;
- (void)setVfxBrushView:(id)a3;
- (void)tapped:(id)a3;
- (void)updateBrushSizeFeedback;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUCleanupOverlayViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushStrokeExclusionMask, 0);
  objc_storeStrong((id *)&self->_brushView, 0);
  objc_storeStrong((id *)&self->_brushStroke, 0);
  objc_storeStrong((id *)&self->_mediaViewPointerInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_vfxBrushView, 0);
  objc_destroyWeak((id *)&self->_overlayControllerDelegate);
}

- (void)setBrushStrokeExclusionMask:(id)a3
{
}

- (PIInpaintMask)brushStrokeExclusionMask
{
  return self->_brushStrokeExclusionMask;
}

- (void)setIsHDR:(BOOL)a3
{
  self->_isHDR = a3;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (void)setBrushView:(id)a3
{
}

- (PUCleanupToolBrushView)brushView
{
  return self->_brushView;
}

- (int64_t)touchType
{
  return self->_touchType;
}

- (void)setBrushStroke:(id)a3
{
}

- (NUMutableBrushStroke)brushStroke
{
  return self->_brushStroke;
}

- (void)setMediaViewPointerInteraction:(id)a3
{
}

- (UIPointerInteraction)mediaViewPointerInteraction
{
  return self->_mediaViewPointerInteraction;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (ImmediatePanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setMediaView:(id)a3
{
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setOverlayView:(id)a3
{
}

- (PUCleanupOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setVfxBrushView:(id)a3
{
}

- (PUVFXBrushView)vfxBrushView
{
  return self->_vfxBrushView;
}

- (void)setOverlayControllerDelegate:(id)a3
{
}

- (PUCleanupOverlayViewControllerDelegate)overlayControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayControllerDelegate);
  return (PUCleanupOverlayViewControllerDelegate *)WeakRetained;
}

- (unint64_t)cleanupMode
{
  return self->_cleanupMode;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = [a3 view];
  if (v5 == self->_mediaView)
  {
    v6 = [MEMORY[0x1E4FB1AE8] hiddenPointerStyle];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  v8 = [a3 view];
  v9 = v8;
  mediaView = self->_mediaView;
  v11 = v7;
  if (v8 == mediaView)
  {
    v12 = (void *)MEMORY[0x1E4FB1AD8];
    [(NUMediaView *)v8 imageFrame];
    v11 = objc_msgSend(v12, "regionWithRect:identifier:", 0);
  }
  return v11;
}

- (void)updateViewConstraints
{
  v30[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUCleanupOverlayViewController *)self brushView];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(PUCleanupOverlayViewController *)self brushView];
    v6 = [v5 constraints];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v28 = [(PUCleanupOverlayViewController *)self brushView];
      v26 = [v28 widthAnchor];
      v27 = [(PUCleanupOverlayViewController *)self view];
      v25 = [v27 widthAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v30[0] = v24;
      v23 = [(PUCleanupOverlayViewController *)self brushView];
      v21 = [v23 heightAnchor];
      v22 = [(PUCleanupOverlayViewController *)self view];
      v20 = [v22 heightAnchor];
      v19 = [v21 constraintEqualToAnchor:v20];
      v30[1] = v19;
      v18 = [(PUCleanupOverlayViewController *)self brushView];
      v17 = [v18 centerXAnchor];
      v8 = [(PUCleanupOverlayViewController *)self view];
      v9 = [v8 centerXAnchor];
      v10 = [v17 constraintEqualToAnchor:v9];
      v30[2] = v10;
      v11 = [(PUCleanupOverlayViewController *)self brushView];
      v12 = [v11 centerYAnchor];
      v13 = [(PUCleanupOverlayViewController *)self view];
      v14 = [v13 centerYAnchor];
      v15 = [v12 constraintEqualToAnchor:v14];
      v30[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

      [MEMORY[0x1E4F28DC8] activateConstraints:v16];
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)PUCleanupOverlayViewController;
  [(PUCleanupOverlayViewController *)&v29 updateViewConstraints];
}

- (void)removeBrushView
{
  uint64_t v3 = [(PUCleanupOverlayViewController *)self brushView];

  if (v3)
  {
    v4 = [(PUCleanupOverlayViewController *)self brushView];
    [v4 removeFromSuperview];

    [(PUCleanupOverlayViewController *)self setBrushView:0];
  }
}

- (void)createBrushView
{
  uint64_t v3 = [(PUCleanupOverlayViewController *)self brushView];

  if (!v3)
  {
    v4 = [(PUCleanupOverlayViewController *)self vfxBrushView];
    v5 = [v4 superview];

    if (!v5 || ([v5 window], v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
    {
      uint64_t v7 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Cleanup: vfxBrushView not present", v19, 2u);
      }

      uint64_t v8 = [(PUCleanupOverlayViewController *)self view];

      v5 = (void *)v8;
    }
    v9 = [PUCleanupToolBrushView alloc];
    v10 = [(PUCleanupOverlayViewController *)self mediaView];
    v11 = [(PUCleanupToolBrushView *)v9 initWithMediaView:v10 isHDR:[(PUCleanupOverlayViewController *)self isHDR]];
    [(PUCleanupOverlayViewController *)self setBrushView:v11];

    v12 = [(PUCleanupOverlayViewController *)self brushView];
    [v12 setBackgroundColor:0];

    v13 = [(PUCleanupOverlayViewController *)self vfxBrushView];
    v14 = [v13 superview];

    v15 = [(PUCleanupOverlayViewController *)self brushView];
    if (v14)
    {
      v16 = [(PUCleanupOverlayViewController *)self vfxBrushView];
      [v5 insertSubview:v15 belowSubview:v16];
    }
    else
    {
      [v5 addSubview:v15];
    }

    v17 = [(PUCleanupOverlayViewController *)self brushView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(PUCleanupOverlayViewController *)self view];
    [v18 setNeedsUpdateConstraints];
  }
}

- (void)fadeOutBrushStrokeWithDuration:(double)a3
{
  if (a3 == 0.0)
  {
    id v6 = [(PUCleanupOverlayViewController *)self brushView];
    [v6 removeStroke];
  }
  else
  {
    v5 = [(PUCleanupOverlayViewController *)self view];
    [v5 setAlpha:1.0];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__PUCleanupOverlayViewController_fadeOutBrushStrokeWithDuration___block_invoke;
    v8[3] = &unk_1E5F2ED10;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PUCleanupOverlayViewController_fadeOutBrushStrokeWithDuration___block_invoke_2;
    v7[3] = &unk_1E5F2CEE8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:v7 completion:a3];
  }
}

void __65__PUCleanupOverlayViewController_fadeOutBrushStrokeWithDuration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __65__PUCleanupOverlayViewController_fadeOutBrushStrokeWithDuration___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) brushView];
  [v3 removeStroke];
}

- (void)setTouchType:(int64_t)a3
{
  self->_touchType = a3;
}

- (void)mediaViewIsReady
{
  id v3 = [(PUCleanupOverlayViewController *)self view];
  char v4 = [v3 isUserInteractionEnabled];

  if ((v4 & 1) == 0)
  {
    id v5 = [(PUCleanupOverlayViewController *)self view];
    [v5 setUserInteractionEnabled:1];
  }
}

- (void)updateBrushSizeFeedback
{
  id v3 = [(PUCleanupOverlayViewController *)self view];
  int v4 = [v3 isUserInteractionEnabled];

  if (v4)
  {
    id v5 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    [v5 scaledBrushRadiusForTouchType:0];
    float v7 = v6;

    uint64_t v8 = [(PUCleanupOverlayViewController *)self view];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    v13 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    int v14 = [v13 isPortrait];

    v15 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    char v16 = [v15 isIpadLayout];

    if (!v14 || (v16 & 1) != 0)
    {
      double v17 = v10 - v7 + -20.0;
      if (v17 >= v10 + -20.0) {
        double v17 = v10 + -20.0;
      }
      double v18 = v12 * 0.5;
    }
    else
    {
      double v17 = v10 * 0.5;
      double v18 = v12 - v7 + -20.0;
      if (v18 >= v12 + -20.0) {
        double v18 = v12 + -20.0;
      }
    }
    brushView = self->_brushView;
    [(PUCleanupToolBrushView *)brushView drawCursorAtPoint:v17 withRadius:v18];
  }
}

- (void)enableBrushSizeFeedback:(BOOL)a3
{
  BOOL v3 = a3;
  -[PUCleanupToolBrushView setShouldDrawCursor:](self->_brushView, "setShouldDrawCursor:");
  if (v3)
  {
    [(PUCleanupOverlayViewController *)self updateBrushSizeFeedback];
  }
}

- (void)longPressed:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 1)
  {
    int v4 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    id v5 = v4;
    uint64_t v6 = 1;
  }
  else
  {
    if ([v7 state] != 3) {
      goto LABEL_6;
    }
    int v4 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    id v5 = v4;
    uint64_t v6 = 0;
  }
  [v4 toolControllerWantsToShowOriginal:v6];

LABEL_6:
}

- (void)hovered:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCleanupOverlayViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
  [v10 scaledBrushRadiusForTouchType:0];
  float v12 = v11;

  uint64_t v13 = [v4 state];
  switch(v13)
  {
    case 1:
      [(PUCleanupToolBrushView *)self->_brushView setShouldDrawCursor:1];
      brushView = self->_brushView;
      -[PUCleanupToolBrushView drawCursorAtPoint:withRadius:](brushView, "drawCursorAtPoint:withRadius:", v7, v9, v12);
      break;
    case 2:
      [(PUCleanupToolBrushView *)self->_brushView setShouldDrawCursor:1];
      char v16 = self->_brushView;
      id v18 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
      [v18 scaledBrushRadiusForTouchType:0];
      -[PUCleanupToolBrushView drawCursorAtPoint:withRadius:](v16, "drawCursorAtPoint:withRadius:", v7, v9, v17);

      break;
    case 3:
    case 4:
    case 5:
      int v14 = self->_brushView;
      [(PUCleanupToolBrushView *)v14 setShouldDrawCursor:0];
      break;
    default:
      return;
  }
}

- (void)tapped:(id)a3
{
  id v29 = a3;
  if ([v29 state] == 3)
  {
    [(NUMediaView *)self->_mediaView imageFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    mediaView = self->_mediaView;
    uint64_t v13 = [(PUCleanupOverlayViewController *)self view];
    -[NUMediaView convertRect:toView:](mediaView, "convertRect:toView:", v13, v5, v7, v9, v11);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v22 = [(PUCleanupOverlayViewController *)self view];
    [v29 locationInView:v22];
    double v24 = v23;
    double v26 = v25;

    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    v31.x = v24;
    v31.y = v26;
    if (CGRectContainsPoint(v32, v31))
    {
      v27 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
      [v27 hidePromptViewIfNeeded];

      v28 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
      objc_msgSend(v28, "addObjectRemovalAtPoint:", v24, v26);
    }
  }
}

- (void)panned:(id)a3
{
  id v5 = a3;
  if (self->_cleanupMode != 1 || self->_vfxBrushView)
  {
    double v6 = [(PUCleanupOverlayViewController *)self view];
    [v5 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    double v11 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
    [v11 scaledBrushRadiusForTouchType:self->_touchType];
    unsigned int v13 = v12;

    switch([v5 state])
    {
      case 1:
        [(NUMediaView *)self->_mediaView imageFrame];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        mediaView = self->_mediaView;
        double v24 = [(PUCleanupOverlayViewController *)self view];
        -[NUMediaView convertRect:toView:](mediaView, "convertRect:toView:", v24, v16, v18, v20, v22);
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;

        v158.origin.x = v26;
        v158.origin.y = v28;
        v158.size.width = v30;
        v158.size.height = v32;
        v157.x = v8;
        v157.y = v10;
        if (CGRectContainsPoint(v158, v157))
        {
          v33 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          [v33 hidePromptViewIfNeeded];

          id v34 = objc_alloc(MEMORY[0x1E4F7A580]);
          long long v35 = *(_OWORD *)(MEMORY[0x1E4F7A328] + 16);
          v156[0] = *MEMORY[0x1E4F7A328];
          v156[1] = v35;
          LODWORD(v35) = 1045220557;
          LODWORD(v36) = 1.0;
          v37 = objc_msgSend(v34, "initWithRadius:softness:opacity:clipRect:pressureMode:", v156, 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v156[0]), v13)), *(double *)&v35, v36);
          [(PUCleanupOverlayViewController *)self setBrushStroke:v37];

          int64_t touchType = self->_touchType;
          v39 = [MEMORY[0x1E4F91148] globalSettings];
          v40 = v39;
          if (touchType) {
            [v39 subjectExclusionMaskHitRadiusForPencilTouch];
          }
          else {
            [v39 subjectExclusionMaskHitRadiusForDirectTouch];
          }
          double v104 = v41;

          v105 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          objc_msgSend(v105, "originalPointFromOverlayViewPoint:", v8, v10);
          double v107 = v106;
          double v109 = v108;

          v110 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          [v110 subjectExclusionMaskBrushRadiusForScreenSpaceRadius:v104];
          double v112 = v111;

          v113 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          objc_msgSend(v113, "brushStrokeExclusionMaskForStrokeStartingAtImageSpacePoint:withRadius:", v107, v109, v112);
          v114 = (PIInpaintMask *)objc_claimAutoreleasedReturnValue();
          brushStrokeExclusionMask = self->_brushStrokeExclusionMask;
          self->_brushStrokeExclusionMask = v114;

          v116 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          v117 = [v116 transformedImageForBrushStrokeExclusionMask:self->_brushStrokeExclusionMask];

          unint64_t cleanupMode = self->_cleanupMode;
          if (v117)
          {
            if (cleanupMode == 1)
            {
              v119 = [v117 imageByApplyingFilter:@"CIMaskToAlpha"];
              v120 = [MEMORY[0x1E4F1E018] context];
              [v119 extent];
              v121 = (CGImage *)objc_msgSend(v120, "createCGImage:fromRect:", v119);

              [(PUVFXBrushView *)self->_vfxBrushView setMask:v121];
              CGImageRelease(v121);
            }
            v122 = [(PUCleanupOverlayViewController *)self brushView];
            v123 = v122;
            v124 = v117;
          }
          else
          {
            if (cleanupMode == 1) {
              [(PUVFXBrushView *)self->_vfxBrushView setMask:0];
            }
            v122 = [(PUCleanupOverlayViewController *)self brushView];
            v123 = v122;
            v124 = 0;
          }
          [v122 setBrushStrokeExclusionMask:v124];

          if (self->_cleanupMode == 1)
          {
            if (!self->_vfxBrushView)
            {
              v155 = [MEMORY[0x1E4F28B00] currentHandler];
              [v155 handleFailureInMethod:a2 object:self file:@"PUCleanupOverlayViewController.m" lineNumber:291 description:@"Nil brushview"];
            }
            v125 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
            [v125 scaledBrushRadiusForTouchType:self->_touchType];
            double v127 = v126;

            v128 = [(PUCleanupOverlayViewController *)self view];
            v129 = [(NUMediaView *)self->_mediaView _visibleImageRectOverlayView];
            objc_msgSend(v128, "convertPoint:toView:", v129, 0.0, 0.0);
            double v131 = v130;
            double v133 = v132;

            v134 = [(PUCleanupOverlayViewController *)self view];
            v135 = [(NUMediaView *)self->_mediaView _visibleImageRectOverlayView];
            objc_msgSend(v134, "convertPoint:toView:", v135, 0.0, v127);
            double v137 = v136;
            double v139 = v138;

            [(PUVFXBrushView *)self->_vfxBrushView setBrushRadius:sqrt((v139 - v133) * (v139 - v133) + (v137 - v131) * (v137 - v131)) * 4.0];
          }
          float v140 = v8;
          float v141 = v10;
          v142 = [(PUCleanupOverlayViewController *)self brushStroke];
          LODWORD(v143) = 1.0;
          *(float *)&double v144 = v8;
          *(float *)&double v145 = v10;
          objc_msgSend(v142, "appendPoint:", v144, v145, v143);

          if (self->_cleanupMode == 1)
          {
            v146 = [(PUCleanupOverlayViewController *)self view];
            v147 = [(NUMediaView *)self->_mediaView _visibleImageRectOverlayView];
            objc_msgSend(v146, "convertPoint:toView:", v147, v8, v10);
            double v149 = v148;
            double v151 = v150;

            -[PUVFXBrushView startEmissionAtPoint:](self->_vfxBrushView, "startEmissionAtPoint:", v149, v151);
          }
          brushView = self->_brushView;
          v153 = [(PUCleanupOverlayViewController *)self brushStroke];
          [v153 radius];
          -[PUCleanupToolBrushView startStrokeWithPoint:radius:](brushView, "startStrokeWithPoint:radius:", v140, v141, v154);

          [(PUCleanupToolBrushView *)self->_brushView setShouldDrawCursor:0];
        }
        else
        {
          [v5 setEnabled:0];
          [v5 setEnabled:1];
        }
        break;
      case 2:
        v42 = [(PUCleanupOverlayViewController *)self view];
        [v5 locationInView:v42];
        double v44 = v43;
        double v46 = v45;

        float v47 = v44;
        float v48 = v46;
        v49 = [(PUCleanupOverlayViewController *)self brushStroke];
        uint64_t v50 = [v49 pointCount] - 1;

        v51 = [(PUCleanupOverlayViewController *)self brushStroke];
        [v51 pointAtIndex:v50];
        float v53 = v52;
        float v55 = v54;

        if ((float)(v48 - v55) * (float)(v48 - v55) + (float)(v47 - v53) * (float)(v47 - v53) >= 2.0)
        {
          v56 = [(PUCleanupOverlayViewController *)self brushStroke];
          LODWORD(v57) = 1.0;
          *(float *)&double v58 = v44;
          *(float *)&double v59 = v46;
          objc_msgSend(v56, "appendPoint:", v58, v59, v57);

          -[PUCleanupToolBrushView addPointToStroke:](self->_brushView, "addPointToStroke:", v47, v48);
          if (self->_cleanupMode == 1)
          {
            v60 = [(PUCleanupOverlayViewController *)self view];
            v61 = [(NUMediaView *)self->_mediaView _visibleImageRectOverlayView];
            objc_msgSend(v60, "convertPoint:toView:", v61, v44, v46);
            double v63 = v62;
            double v65 = v64;

            -[PUVFXBrushView setBrushPosition:](self->_vfxBrushView, "setBrushPosition:", v63, v65);
          }
        }
        break;
      case 3:
        v66 = [(PUCleanupOverlayViewController *)self view];
        [v5 locationInView:v66];
        double v68 = v67;
        double v70 = v69;

        float v71 = v68;
        v73 = [(PUCleanupOverlayViewController *)self brushStroke];
        uint64_t v74 = [v73 pointCount] - 1;

        v75 = [(PUCleanupOverlayViewController *)self brushStroke];
        [v75 pointAtIndex:v74];
        float v77 = v76;
        float v79 = v78;

        if (v77 == v71)
        {
          float v72 = v70;
          if (v79 == v72) {
            goto LABEL_17;
          }
        }
        v80 = [(PUCleanupOverlayViewController *)self brushStroke];
        LODWORD(v81) = 1.0;
        *(float *)&double v82 = v68;
        *(float *)&double v83 = v70;
        objc_msgSend(v80, "appendPoint:", v82, v83, v81);

        if (self->_cleanupMode == 1)
        {
          v84 = [(PUCleanupOverlayViewController *)self view];
          v85 = [(NUMediaView *)self->_mediaView _visibleImageRectOverlayView];
          objc_msgSend(v84, "convertPoint:toView:", v85, v68, v70);
          double v87 = v86;
          double v89 = v88;

          -[PUVFXBrushView setBrushPosition:](self->_vfxBrushView, "setBrushPosition:", v87, v89);
LABEL_17:
          if (self->_cleanupMode == 1) {
            [(PUVFXBrushView *)self->_vfxBrushView endEmission];
          }
        }
        uint64_t v90 = [(PUCleanupOverlayViewController *)self brushStroke];
        if (!v90) {
          goto LABEL_25;
        }
        v91 = (void *)v90;
        v92 = [(PUCleanupOverlayViewController *)self brushStroke];
        uint64_t v93 = [v92 pointCount];

        if (v93 < 1) {
          goto LABEL_25;
        }
        v94 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
        [v94 brushRadiusForTouchType:self->_touchType];
        int v96 = v95;
        v97 = [(PUCleanupOverlayViewController *)self brushStroke];
        LODWORD(v98) = v96;
        [v97 setRadius:v98];

        if (self->_cleanupMode == 2
          || (+[PUPhotoEditProtoSettings sharedInstance],
              v99 = objc_claimAutoreleasedReturnValue(),
              int v100 = [v99 retouchStrokeDisableObjectStrokes],
              v99,
              v100))
        {
          v101 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          v102 = [(PUCleanupOverlayViewController *)self brushStroke];
          [v101 addStroke:v102 closeAndFillStroke:0];
LABEL_24:

          goto LABEL_25;
        }
        if (self->_cleanupMode == 1)
        {
          v101 = [(PUCleanupOverlayViewController *)self overlayControllerDelegate];
          v102 = [(PUCleanupOverlayViewController *)self brushStroke];
          [v101 addObjectRemovalUsingStroke:v102 exclusionMask:self->_brushStrokeExclusionMask];
          goto LABEL_24;
        }
LABEL_25:
        v103 = self->_brushStrokeExclusionMask;
        self->_brushStrokeExclusionMask = 0;

        [(PUCleanupOverlayViewController *)self setBrushStroke:0];
        break;
      case 4:
      case 5:
        [(PUCleanupOverlayViewController *)self setBrushStroke:0];
        if (self->_cleanupMode == 1) {
          [(PUVFXBrushView *)self->_vfxBrushView endEmission];
        }
        double v14 = self->_brushStrokeExclusionMask;
        self->_brushStrokeExclusionMask = 0;

        [(PUCleanupOverlayViewController *)self setBrushStroke:0];
        [(PUCleanupOverlayViewController *)self fadeOutBrushStrokeWithDuration:0.0];
        break;
      default:
        break;
    }
  }
}

- (void)setCleanupMode:(unint64_t)a3
{
  self->_unint64_t cleanupMode = a3;
  if (a3 == 2)
  {
    double v4 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
    id v5 = v4;
    uint64_t v6 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      double v9 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
      [v9 setEnabled:1];

      double v7 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
      id v10 = v7;
      uint64_t v8 = 1;
      goto LABEL_8;
    }
    if (a3) {
      return;
    }
    double v4 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
    id v5 = v4;
    uint64_t v6 = 0;
  }
  [v4 setEnabled:v6];

  double v7 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  id v10 = v7;
  uint64_t v8 = 0;
LABEL_8:
  [v7 setEnabled:v8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PUCleanupOverlayViewController;
  [(PUCleanupOverlayViewController *)&v20 viewWillDisappear:a3];
  double v4 = [(PUCleanupOverlayViewController *)self mediaViewPointerInteraction];

  if (v4)
  {
    id v5 = [(PUCleanupOverlayViewController *)self mediaView];
    uint64_t v6 = [(PUCleanupOverlayViewController *)self mediaViewPointerInteraction];
    [v5 removeInteraction:v6];

    [(PUCleanupOverlayViewController *)self setMediaViewPointerInteraction:0];
  }
  double v7 = [(PUCleanupOverlayViewController *)self mediaView];
  [v7 setScrollEnabled:1];

  uint64_t v8 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  double v9 = [v8 view];
  id v10 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v9 removeGestureRecognizer:v10];

  double v11 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  unsigned int v12 = [v11 view];
  unsigned int v13 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  [v12 removeGestureRecognizer:v13];

  double v14 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  double v15 = [v14 view];
  double v16 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  [v15 removeGestureRecognizer:v16];

  double v17 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  double v18 = [v17 view];
  double v19 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v18 removeGestureRecognizer:v19];

  [(PUCleanupOverlayViewController *)self setPanGestureRecognizer:0];
  [(PUCleanupOverlayViewController *)self setTapGestureRecognizer:0];
  [(PUCleanupOverlayViewController *)self setHoverGestureRecognizer:0];
  [(PUCleanupOverlayViewController *)self setLongPressGestureRecognizer:0];
  [(PUCleanupOverlayViewController *)self removeBrushView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v37.receiver = self;
  v37.super_class = (Class)PUCleanupOverlayViewController;
  [(PUCleanupOverlayViewController *)&v37 viewWillAppear:a3];
  double v4 = [(PUCleanupOverlayViewController *)self mediaViewPointerInteraction];

  if (!v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    [(PUCleanupOverlayViewController *)self setMediaViewPointerInteraction:v5];

    uint64_t v6 = [(PUCleanupOverlayViewController *)self mediaView];
    double v7 = [(PUCleanupOverlayViewController *)self mediaViewPointerInteraction];
    [v6 addInteraction:v7];
  }
  uint64_t v8 = [[ImmediatePanGestureRecognizer alloc] initWithTarget:self action:sel_panned_];
  [(PUCleanupOverlayViewController *)self setPanGestureRecognizer:v8];

  double v9 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v9 setMaximumNumberOfTouches:1];

  id v10 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v10 setEnabled:0];

  double v11 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v11 setDelegate:0];

  unsigned int v12 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v12 setTouchTypeDelegate:self];

  unsigned int v13 = [(PUCleanupOverlayViewController *)self mediaView];
  double v14 = [v13 _scrollView];
  double v15 = [v14 pinchGestureRecognizer];

  double v16 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v15 requireGestureRecognizerToFail:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapped_];
  [(PUCleanupOverlayViewController *)self setTapGestureRecognizer:v17];

  double v18 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  [v18 setEnabled:0];

  double v19 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  [v19 setDelegate:0];

  objc_super v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel_hovered_];
  [(PUCleanupOverlayViewController *)self setHoverGestureRecognizer:v20];

  double v21 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  [v21 setEnabled:1];

  double v22 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  [v22 setDelegate:0];

  double v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_longPressed_];
  [(PUCleanupOverlayViewController *)self setLongPressGestureRecognizer:v23];

  double v24 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v24 setMinimumPressDuration:1.0];

  double v25 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v25 setAllowableMovement:7.0];

  CGFloat v26 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v26 setEnabled:1];

  double v27 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v27 setDelegate:0];

  CGFloat v28 = [(PUCleanupOverlayViewController *)self mediaView];
  double v29 = [(PUCleanupOverlayViewController *)self panGestureRecognizer];
  [v28 addGestureRecognizer:v29];

  CGFloat v30 = [(PUCleanupOverlayViewController *)self mediaView];
  double v31 = [(PUCleanupOverlayViewController *)self tapGestureRecognizer];
  [v30 addGestureRecognizer:v31];

  CGFloat v32 = [(PUCleanupOverlayViewController *)self mediaView];
  v33 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  [v32 addGestureRecognizer:v33];

  id v34 = [(PUCleanupOverlayViewController *)self mediaView];
  long long v35 = [(PUCleanupOverlayViewController *)self longPressGestureRecognizer];
  [v34 addGestureRecognizer:v35];

  [(PUCleanupOverlayViewController *)self setCleanupMode:self->_cleanupMode];
  double v36 = [(PUCleanupOverlayViewController *)self hoverGestureRecognizer];
  [v36 setEnabled:1];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCleanupOverlayViewController;
  [(PUCleanupOverlayViewController *)&v4 viewDidLoad];
  BOOL v3 = [(PUCleanupOverlayViewController *)self view];
  [v3 setUserInteractionEnabled:0];
}

- (void)loadView
{
}

- (PUCleanupOverlayViewController)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    unsigned int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUCleanupOverlayViewController.m", 108, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PUCleanupOverlayViewController;
  double v9 = [(PUCleanupOverlayViewController *)&v14 init];
  if (v9)
  {
    id v10 = [[PUCleanupOverlayView alloc] initWithMediaView:v8];
    overlayView = v9->_overlayView;
    v9->_overlayView = v10;

    objc_storeStrong((id *)&v9->_mediaView, a3);
    v9->_isHDR = a4;
  }

  return v9;
}

@end