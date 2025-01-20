@interface PNPWizardScratchpadView
- (BOOL)_viewIsPartOfStylusCanvasView:(id)a3;
- (BOOL)isDrawing;
- (BOOL)showingToast;
- (CGPoint)pointForFirstTool;
- (PNPWizardScratchpadView)initWithFrame:(CGRect)a3;
- (PNPWizardScratchpadViewDelegate)delegate;
- (id)_selectedInk;
- (id)_selectedInkView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)step;
- (void)_animateAdjustmentSliderAppearance:(id)a3;
- (void)_animateInkChange:(id)a3;
- (void)_animateLayoutChange:(id)a3;
- (void)_canvasViewWillBeginDrawing:(id)a3;
- (void)_deselectAllInks;
- (void)_dismissToastNotification;
- (void)_initializeToastViewIfNecessary;
- (void)_inkViewPressed:(id)a3;
- (void)_selectInkAtIndex:(int64_t)a3;
- (void)_showToastNotificationAndAnimateStrokeAway;
- (void)_showToastNotificationWithInitialAnimation;
- (void)_triggerShowToastTimer;
- (void)canvasViewDidBeginDrawing:(id)a3;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)clearCanvas;
- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4;
- (void)layoutSubviews;
- (void)prepareCanvasViews;
- (void)setDelegate:(id)a3;
- (void)setIsDrawing:(BOOL)a3;
- (void)setShowingToast:(BOOL)a3;
- (void)setStep:(unint64_t)a3;
- (void)viewWillMoveToSuperview:(id)a3;
@end

@implementation PNPWizardScratchpadView

- (void)layoutSubviews
{
  backgroundView = self->_backgroundView;
  [(PNPWizardScratchpadView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  canvasView = self->_canvasView;
  [(PNPWizardScratchpadView *)self bounds];
  -[PNPWizardScratchpadCanvasView setFrame:](canvasView, "setFrame:");
  fingerDrawingCanvasView = self->_fingerDrawingCanvasView;
  [(PNPWizardScratchpadView *)self bounds];
  -[PNPWizardScratchpadCanvasView setFrame:](fingerDrawingCanvasView, "setFrame:");
  v6 = self->_backgroundView;
  v7 = [MEMORY[0x263F1C550] scratchpadBackgroundColor];
  [(UIView *)v6 setBackgroundColor:v7];

  toolsBackgroundPillView = self->_toolsBackgroundPillView;
  v9 = [MEMORY[0x263F1C550] toolBackgroundColor];
  [(UIView *)toolsBackgroundPillView setBackgroundColor:v9];

  [(UIView *)self->_toolsBackgroundPillView setAlpha:0.91];
  v10 = (void *)MEMORY[0x263F1C478];
  [(PNPWizardScratchpadView *)self bounds];
  v11 = objc_msgSend(v10, "bezierPathWithRect:");
  v12 = (void *)MEMORY[0x263F1C478];
  [(PNPWizardScratchpadView *)self bounds];
  v13 = objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:");
  v14 = [v13 bezierPathByReversingPath];
  [v11 appendPath:v14];

  frameLayer = self->_frameLayer;
  id v62 = v11;
  -[CAShapeLayer setPath:](frameLayer, "setPath:", [v62 CGPath]);
  v16 = self->_frameLayer;
  id v17 = [MEMORY[0x263F1C550] platterContainerColor];
  -[CAShapeLayer setFillColor:](v16, "setFillColor:", [v17 CGColor]);

  v18 = [(NSMutableArray *)self->_inkViews firstObject];
  [v18 intrinsicContentSize];
  double v20 = v19;

  unint64_t v21 = [(NSMutableArray *)self->_inkViews count];
  unint64_t v22 = [(NSMutableArray *)self->_inkViews count];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  if ([(NSMutableArray *)self->_inkViews count])
  {
    uint64_t v27 = 0;
    double v63 = v20 + 16.0;
    double v64 = v20 * (double)v21 + ((double)v22 + -1.0) * 16.0;
    do
    {
      v28 = [(NSMutableArray *)self->_inkViews objectAtIndex:v27];
      [(PNPWizardScratchpadView *)self bounds];
      double v30 = v29 + -30.0;
      +[PNPWizardScratchpadInkView preferredHeight];
      double v32 = v31;
      double v33 = v30 - v31;
      [v28 intrinsicContentSize];
      double v35 = v34 + 16.0;
      [(PNPWizardScratchpadView *)self bounds];
      double v37 = v63 * (double)v27 + (v36 - v64) * 0.5;
      objc_msgSend(v28, "setFrame:", v37, v33, v35, v32);
      v66.origin.CGFloat x = x;
      v66.origin.CGFloat y = y;
      v66.size.CGFloat width = width;
      v66.size.CGFloat height = height;
      if (CGRectIsNull(v66))
      {
        CGFloat height = v32;
        CGFloat width = v35;
        CGFloat y = v33;
        CGFloat x = v37;
      }
      else
      {
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.CGFloat width = width;
        v67.size.CGFloat height = height;
        v69.origin.CGFloat x = v37;
        v69.origin.CGFloat y = v33;
        v69.size.CGFloat width = v35;
        v69.size.CGFloat height = v32;
        CGRect v68 = CGRectUnion(v67, v69);
        CGFloat x = v68.origin.x;
        CGFloat y = v68.origin.y;
        CGFloat width = v68.size.width;
        CGFloat height = v68.size.height;
      }

      ++v27;
    }
    while (v27 < (unint64_t)[(NSMutableArray *)self->_inkViews count]);
  }
  UIRectInset();
  UIRectInset();
  -[UIView setFrame:](self->_toolsBackgroundPillView, "setFrame:");
  [(UIView *)self->_toolsBackgroundPillView _setContinuousCornerRadius:12.0];
  v38 = [(PNPWizardScratchpadView *)self _selectedInkView];
  [(PNPWizardInkWeightControl *)self->_inkWeightControl intrinsicContentSize];
  [v38 frame];
  UIRectCenteredXInRect();
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  if (self->_inkWeightControlVisible) {
    double v45 = 19.0;
  }
  else {
    double v45 = 9.0;
  }
  [v38 frame];
  -[PNPWizardInkWeightControl setFrame:](self->_inkWeightControl, "setFrame:", v40, v46 - (v44 + v45), v42, v44);
  double v47 = 0.8;
  if (!self->_inkWeightControlVisible) {
    double v47 = 0.0;
  }
  [(PNPWizardInkWeightControl *)self->_inkWeightControl setAlpha:v47];
  [(PNPWizardScratchpadToast *)self->_toastView intrinsicContentSize];
  [(PNPWizardScratchpadView *)self bounds];
  v48 = [(PNPWizardScratchpadView *)self traitCollection];
  [v48 displayScale];
  uint64_t v61 = v49;
  UIRectCenteredIntegralRectScale();
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;

  -[PNPWizardScratchpadToast setFrame:](self->_toastView, "setFrame:", v51, v53, v55, v57, v61);
  toastView = self->_toastView;
  BOOL v59 = [(PNPWizardScratchpadView *)self showingToast];
  double v60 = 1.0;
  if (!v59) {
    double v60 = 0.0;
  }
  [(PNPWizardScratchpadToast *)toastView setAlpha:v60];
}

- (CGPoint)pointForFirstTool
{
  v3 = [(NSMutableArray *)self->_inkViews firstObject];
  [v3 bounds];
  -[PNPWizardScratchpadView convertRect:fromView:](self, "convertRect:fromView:", v3);
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (void)_animateLayoutChange:(id)a3
{
  id v4 = a3;
  [(PNPWizardScratchpadView *)self setNeedsLayout];
  double v5 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke;
  v9[3] = &unk_264DA56A0;
  v9[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke_2;
  v7[3] = &unk_264DA5800;
  id v8 = v4;
  id v6 = v4;
  [v5 _animateUsingDefaultTimingWithOptions:4 animations:v9 completion:v7];
}

uint64_t __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __48__PNPWizardScratchpadView__animateLayoutChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateInkChange:(id)a3
{
  id v4 = a3;
  [(PNPWizardScratchpadView *)self setNeedsLayout];
  double v5 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__PNPWizardScratchpadView__animateInkChange___block_invoke;
  v9[3] = &unk_264DA56A0;
  v9[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__PNPWizardScratchpadView__animateInkChange___block_invoke_2;
  v7[3] = &unk_264DA5800;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:4 delay:v9 usingSpringWithDamping:v7 initialSpringVelocity:0.475 options:0.0 animations:0.8 completion:0.0];
}

uint64_t __45__PNPWizardScratchpadView__animateInkChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __45__PNPWizardScratchpadView__animateInkChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateAdjustmentSliderAppearance:(id)a3
{
  id v4 = a3;
  [(PNPWizardScratchpadView *)self setNeedsLayout];
  double v18 = 0.0;
  long long v16 = 0u;
  long long v17 = 0u;
  PNPWizardScratchpadOpacitySliderAnimationParameters((uint64_t)&v16);
  id v5 = objc_alloc(MEMORY[0x263F1C5A0]);
  id v6 = (void *)[v5 initWithControlPoint1:v16 controlPoint2:v17];
  id v7 = objc_alloc(MEMORY[0x263F1CB78]);
  id v8 = (void *)[v7 initWithDuration:v6 timingParameters:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke;
  v15[3] = &unk_264DA56A0;
  v15[4] = self;
  [v8 addAnimations:v15];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke_2;
  v13 = &unk_264DA5AB0;
  id v14 = v4;
  id v9 = v4;
  [v8 addCompletion:&v10];
  objc_msgSend(v8, "startAnimation", v10, v11, v12, v13);
}

uint64_t __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __62__PNPWizardScratchpadView__animateAdjustmentSliderAppearance___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v5 = [(PNPWizardScratchpadView *)self _selectedInk];
  id v6 = [v5 identifier];

  if (v6 == (void *)*MEMORY[0x263F14CA0])
  {
    previousMarkingToolIndeCGFloat x = self->_previousMarkingToolIndex;
  }
  else
  {
    self->_previousMarkingToolIndeCGFloat x = self->_selectedInkIndex;
    previousMarkingToolIndeCGFloat x = [(NSMutableArray *)self->_inkViews count] - 1;
  }
  [(PNPWizardScratchpadView *)self _selectInkAtIndex:previousMarkingToolIndex];
  [(PNPWizardScratchpadView *)self _animateLayoutChange:0];
  if (v8) {
    v8[2]();
  }
}

- (void)_deselectAllInks
{
}

uint64_t __43__PNPWizardScratchpadView__deselectAllInks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0];
}

- (void)_selectInkAtIndex:(int64_t)a3
{
  if (!self->_isDrawing)
  {
    [(PNPWizardScratchpadView *)self _deselectAllInks];
    self->_selectedInkIndeCGFloat x = a3;
    id v5 = [(NSMutableArray *)self->_inkViews objectAtIndex:a3];
    [v5 setSelected:1];

    canvasView = self->_canvasView;
    id v7 = [(PNPWizardScratchpadView *)self _selectedInk];
    [(PNPWizardScratchpadCanvasView *)canvasView setInk:v7];
  }
}

- (id)_selectedInkView
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  inkViews = self->_inkViews;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PNPWizardScratchpadView__selectedInkView__block_invoke;
  v5[3] = &unk_264DA5AF8;
  v5[4] = &v6;
  [(NSMutableArray *)inkViews enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__PNPWizardScratchpadView__selectedInkView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 selected])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_selectedInk
{
  id v3 = [(PNPWizardScratchpadView *)self _selectedInkView];
  id v4 = [v3 ink];
  [(PNPWizardInkWeightControl *)self->_inkWeightControl value];
  BSIntervalValueForFraction();
  double v6 = v5;
  id v7 = (void *)MEMORY[0x263F14B48];
  uint64_t v8 = objc_msgSend(v4, "identifier", 0xBFF0000000000000, 1, 0x3FF0000000000000, 1);
  id v9 = [v4 color];
  uint64_t v10 = [v7 inkWithIdentifier:v8 color:v9 weight:v6];

  return v10;
}

- (void)_inkViewPressed:(id)a3
{
  id v13 = a3;
  id v4 = [v13 view];
  uint64_t v5 = [(NSMutableArray *)self->_inkViews indexOfObject:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    [v13 locationInView:v4];
    uint64_t v7 = objc_msgSend(v4, "pointInside:withEvent:", 0);
    [v4 setPressed:0];
    if ([v13 state] == 1 || objc_msgSend(v13, "state") == 2)
    {
      [v4 setPressed:v7];
      if ([v13 state] == 3) {
        char v8 = v7;
      }
      else {
        char v8 = 0;
      }
      if ((v8 & 1) == 0)
      {
LABEL_16:
        [(PNPWizardScratchpadView *)self _animateInkChange:0];
LABEL_17:
        v12 = [(PNPWizardScratchpadView *)self delegate];
        [v12 scratchPadViewHadInteractionEvent:self];

        goto LABEL_18;
      }
    }
    else
    {
      if ([v13 state] == 3) {
        int v9 = v7;
      }
      else {
        int v9 = 0;
      }
      if (v9 != 1) {
        goto LABEL_17;
      }
    }
    uint64_t v10 = [(PNPWizardScratchpadView *)self _selectedInk];
    id v11 = [v10 identifier];

    if (([v11 isEqual:*MEMORY[0x263F14CA0]] & 1) == 0) {
      self->_previousMarkingToolIndeCGFloat x = self->_selectedInkIndex;
    }
    [(PNPWizardScratchpadView *)self _selectInkAtIndex:v6];

    goto LABEL_16;
  }
LABEL_18:
}

- (BOOL)_viewIsPartOfStylusCanvasView:(id)a3
{
  id v4 = (PNPWizardScratchpadCanvasView *)a3;
  BOOL v5 = ([(PNPWizardScratchpadCanvasView *)self->_canvasView containsView:v4] & 1) != 0
    || self->_canvasView == v4;

  return v5;
}

- (void)_showToastNotificationWithInitialAnimation
{
  [(PNPWizardScratchpadView *)self _initializeToastViewIfNecessary];
  [(PNPWizardScratchpadView *)self setShowingToast:0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__PNPWizardScratchpadView__showToastNotificationWithInitialAnimation__block_invoke;
  v3[3] = &unk_264DA56A0;
  v3[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v3 options:0 animations:0.3 completion:0.0];
}

uint64_t __69__PNPWizardScratchpadView__showToastNotificationWithInitialAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingToast:1];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)_initializeToastViewIfNecessary
{
  if (!self->_toastView)
  {
    id v3 = objc_alloc_init(PNPWizardScratchpadToast);
    toastView = self->_toastView;
    self->_toastView = v3;
  }
  BOOL v5 = PencilPairingUIBundle();
  id v6 = [v5 localizedStringForKey:@"USE_APPLE_PENCIL_PROMPT" value:&stru_26ECD9920 table:0];

  [(PNPWizardScratchpadToast *)self->_toastView setText:v6];
}

- (void)_showToastNotificationAndAnimateStrokeAway
{
  [(PNPWizardScratchpadView *)self _initializeToastViewIfNecessary];
  [(PNPWizardScratchpadView *)self setShowingToast:1];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  BOOL v9 = 0;
  id v3 = [(PNPWizardScratchpadCanvasView *)self->_canvasView canvasView];
  id v4 = [v3 drawing];
  BOOL v5 = [v4 _visibleStrokes];
  BOOL v6 = [v5 count] != 0;

  BOOL v9 = v6;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke;
  v7[3] = &unk_264DA5B20;
  void v7[4] = self;
  v7[5] = v8;
  [(PNPWizardScratchpadView *)self _animateLayoutChange:v7];
  _Block_object_dispose(v8, 8);
}

void __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke_2;
  v3[3] = &unk_264DA5B20;
  long long v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
}

uint64_t __69__PNPWizardScratchpadView__showToastNotificationAndAnimateStrokeAway__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) clearDrawingAnimated];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) setShowingToast:0];
  }
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 _animateLayoutChange:0];
}

- (void)_dismissToastNotification
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__PNPWizardScratchpadView__dismissToastNotification__block_invoke;
  v2[3] = &unk_264DA56A0;
  v2[4] = self;
  [(PNPWizardScratchpadView *)self _animateLayoutChange:v2];
}

uint64_t __52__PNPWizardScratchpadView__dismissToastNotification__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) clearDrawingAnimated];
  [*(id *)(a1 + 32) setShowingToast:0];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 _animateLayoutChange:0];
}

- (void)setShowingToast:(BOOL)a3
{
  self->_showingToast = a3;
  [(PNPWizardScratchpadView *)self setNeedsLayout];
}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  if ([(PNPWizardScratchpadView *)self _viewIsPartOfStylusCanvasView:a3])
  {
    long long v4 = [(PNPWizardScratchpadCanvasView *)self->_canvasView ink];
    BOOL v5 = [v4 identifier];
    int v6 = [v5 isEqual:*MEMORY[0x263F14CA0]];

    uint64_t v7 = [(PNPWizardScratchpadView *)self delegate];
    int v8 = [v7 scratchPadViewIsPlayingAnimation:self];

    if (v6) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      [(PNPWizardScratchpadView *)self _selectInkAtIndex:self->_previousMarkingToolIndex];
      [(PNPWizardScratchpadView *)self _animateLayoutChange:0];
    }
  }
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  if ([(PNPWizardScratchpadView *)self _viewIsPartOfStylusCanvasView:a3])
  {
    self->_isDrawing = 1;
    long long v4 = [(PNPWizardScratchpadView *)self delegate];
    [v4 scratchPadViewHadInteractionEvent:self];

    BOOL v5 = [(PNPWizardScratchpadCanvasView *)self->_canvasView ink];
    int v6 = [v5 identifier];
    char v7 = [v6 isEqual:*MEMORY[0x263F14CA0]];

    if ((v7 & 1) == 0)
    {
      [(NSTimer *)self->_showToastTimer invalidate];
      showToastTimer = self->_showToastTimer;
      self->_showToastTimer = 0;

      [(PNPWizardScratchpadView *)self _dismissToastNotification];
    }
  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id v8 = a3;
  if (-[PNPWizardScratchpadView _viewIsPartOfStylusCanvasView:](self, "_viewIsPartOfStylusCanvasView:")) {
    self->_isDrawing = 0;
  }
  if (![(PNPWizardScratchpadView *)self _viewIsPartOfStylusCanvasView:v8]) {
    [(PNPWizardScratchpadView *)self _showToastNotificationAndAnimateStrokeAway];
  }
  long long v4 = [v8 drawing];
  BOOL v5 = [v4 _visibleStrokes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(NSTimer *)self->_showToastTimer invalidate];
    showToastTimer = self->_showToastTimer;
    self->_showToastTimer = 0;
  }
}

- (void)clearCanvas
{
  [(PNPWizardScratchpadCanvasView *)self->_canvasView clearDrawingAnimated];
  [(PNPWizardScratchpadView *)self setShowingToast:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PNPWizardScratchpadView;
  id v8 = -[PNPWizardScratchpadView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  if ([(PNPWizardScratchpadView *)self _viewIsPartOfStylusCanvasView:v8]
    && !objc_msgSend(v7, "pnp_isPencilEvent"))
  {
    -[PNPWizardScratchpadCanvasView convertPoint:fromView:](self->_fingerDrawingCanvasView, "convertPoint:fromView:", self, x, y);
    -[PNPWizardScratchpadCanvasView hitTest:withEvent:](self->_fingerDrawingCanvasView, "hitTest:withEvent:", v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v8;
  }
  uint64_t v10 = v9;

  return v10;
}

- (PNPWizardScratchpadView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)PNPWizardScratchpadView;
  id v3 = -[PNPWizardScratchpadView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  backgroundView = v3->_backgroundView;
  v3->_backgroundView = v4;

  [(PNPWizardScratchpadView *)v3 addSubview:v3->_backgroundView];
  uint64_t v6 = objc_alloc_init(PNPWizardScratchpadCanvasView);
  canvasView = v3->_canvasView;
  v3->_canvasView = v6;

  id v8 = objc_alloc_init(PNPWizardScratchpadCanvasView);
  fingerDrawingCanvasView = v3->_fingerDrawingCanvasView;
  v3->_fingerDrawingCanvasView = v8;

  [(PNPWizardScratchpadCanvasView *)v3->_canvasView setDelegate:v3];
  [(PNPWizardScratchpadCanvasView *)v3->_canvasView setOpaque:0];
  [(PNPWizardScratchpadCanvasView *)v3->_fingerDrawingCanvasView setDelegate:v3];
  [(PNPWizardScratchpadCanvasView *)v3->_fingerDrawingCanvasView setOpaque:0];
  uint64_t v10 = v3->_fingerDrawingCanvasView;
  id v11 = (void *)MEMORY[0x263F14B48];
  uint64_t v12 = *MEMORY[0x263F14CA8];
  id v13 = [MEMORY[0x263F1C550] fingerDrawingInkColor];
  id v14 = [v11 inkWithIdentifier:v12 color:v13 weight:0.2];
  [(PNPWizardScratchpadCanvasView *)v10 setInk:v14];

  [(PNPWizardScratchpadView *)v3 addSubview:v3->_fingerDrawingCanvasView];
  [(PNPWizardScratchpadView *)v3 addSubview:v3->_canvasView];
  uint64_t v15 = [MEMORY[0x263F15880] layer];
  frameLayer = v3->_frameLayer;
  v3->_frameLayer = (CAShapeLayer *)v15;

  long long v17 = [(PNPWizardScratchpadView *)v3 layer];
  [v17 addSublayer:v3->_frameLayer];

  double v18 = v3->_frameLayer;
  id v19 = [MEMORY[0x263F1C550] scratchpadFrameColor];
  -[CAShapeLayer setFillColor:](v18, "setFillColor:", [v19 CGColor]);

  double v20 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  toolsBackgroundPillView = v3->_toolsBackgroundPillView;
  v3->_toolsBackgroundPillView = v20;

  [(PNPWizardScratchpadView *)v3 addSubview:v3->_toolsBackgroundPillView];
  unint64_t v22 = objc_alloc_init(PNPWizardInkWeightControl);
  inkWeightControl = v3->_inkWeightControl;
  v3->_inkWeightControl = v22;

  [(PNPWizardScratchpadView *)v3 addSubview:v3->_inkWeightControl];
  uint64_t v24 = [MEMORY[0x263EFF980] array];
  inkViews = v3->_inkViews;
  v3->_inkViews = (NSMutableArray *)v24;

  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v27 = [[PNPWizardScratchpadInkView alloc] initWithIndex:i];
    v28 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v3 action:sel__inkViewPressed_];
    [v28 setMinimumPressDuration:0.0];
    [(PNPWizardScratchpadInkView *)v27 addGestureRecognizer:v28];
    [(NSMutableArray *)v3->_inkViews addObject:v27];
    [(PNPWizardScratchpadView *)v3 addSubview:v27];
  }
  [(PNPWizardScratchpadView *)v3 _selectInkAtIndex:1];
  v3->_previousMarkingToolIndedouble x = 1;
  double v29 = objc_alloc_init(PNPWizardScratchpadToast);
  toastView = v3->_toastView;
  v3->_toastView = v29;

  [(PNPWizardScratchpadToast *)v3->_toastView setUserInteractionEnabled:0];
  [(PNPWizardScratchpadView *)v3 addSubview:v3->_toastView];
  double v31 = PencilPairingUIBundle();
  double v32 = [v31 localizedStringForKey:@"USE_APPLE_PENCIL_PROMPT" value:&stru_26ECD9920 table:0];

  [(PNPWizardScratchpadToast *)v3->_toastView setText:v32];
  return v3;
}

- (void)prepareCanvasViews
{
  [(PNPWizardScratchpadCanvasView *)self->_fingerDrawingCanvasView prepareCanvasView];
  [(PNPWizardScratchpadCanvasView *)self->_canvasView prepareCanvasView];
  id v3 = [(PNPWizardScratchpadCanvasView *)self->_canvasView drawingGestureRecognizer];
  [v3 setAllowedTouchTypes:&unk_26ECE79D8];

  id v4 = [(PNPWizardScratchpadCanvasView *)self->_fingerDrawingCanvasView drawingGestureRecognizer];
  [v4 setAllowedTouchTypes:&unk_26ECE79F0];
}

- (void)setStep:(unint64_t)a3
{
  self->_step = a3;
  if (a3 == 1) {
    [(PNPWizardScratchpadView *)self _triggerShowToastTimer];
  }
}

- (void)_triggerShowToastTimer
{
  showToastTimer = self->_showToastTimer;
  if (showToastTimer)
  {
    [(NSTimer *)showToastTimer invalidate];
    id v4 = self->_showToastTimer;
    self->_showToastTimer = 0;
  }
  BOOL v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__showToastNotificationWithInitialAnimation selector:0 userInfo:0 repeats:3.0];
  uint64_t v6 = self->_showToastTimer;
  self->_showToastTimer = v5;
  MEMORY[0x270F9A758](v5, v6);
}

- (void)viewWillMoveToSuperview:(id)a3
{
  if (!a3)
  {
    [(NSTimer *)self->_showToastTimer invalidate];
    showToastTimer = self->_showToastTimer;
    self->_showToastTimer = 0;
  }
}

- (unint64_t)step
{
  return self->_step;
}

- (PNPWizardScratchpadViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPWizardScratchpadViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showingToast
{
  return self->_showingToast;
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_showToastTimer, 0);
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_toolsBackgroundPillView, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_inkViews, 0);
  objc_storeStrong((id *)&self->_inkWeightControl, 0);
  objc_storeStrong((id *)&self->_frameLayer, 0);
  objc_storeStrong((id *)&self->_fingerDrawingCanvasView, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end