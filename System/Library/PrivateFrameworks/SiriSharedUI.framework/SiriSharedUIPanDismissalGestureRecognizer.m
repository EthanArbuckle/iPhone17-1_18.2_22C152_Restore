@interface SiriSharedUIPanDismissalGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGPoint)initialPosition;
- (CGRect)_windowBounds;
- (SiriSharedUIPanDismissalGestureRecognizer)initWithCoder:(id)a3;
- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4;
- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4 rtlProvider:(id)a5;
- (SiriSharedUIPanDismissalGestureRecognizerDelegate)dismissalDelegate;
- (double)_contentScaleFactor;
- (id)rtlProvider;
- (int64_t)dismissalStyle;
- (int64_t)initialDirection;
- (void)_handlePanWithRubberBandDownDismissUp:(id)a3 requiredDirection:(int64_t)a4;
- (void)_handlePanWithRubberBandUpDownDismissTrailing:(id)a3 requiredDirection:(int64_t)a4;
- (void)_preventHighlightingUntilGestureFaills;
- (void)_runAnimationsWithPreferredStyle:(id)a3;
- (void)_updatePanGestureRecognizer:(id)a3 changedAnimations:(id)a4 endAnimations:(id)a5;
- (void)panGestureRecognizerDidPan:(id)a3;
- (void)setDismissalDelegate:(id)a3;
- (void)setDismissalStyle:(int64_t)a3;
- (void)setInitialDirection:(int64_t)a3;
- (void)setInitialPosition:(CGPoint)a3;
- (void)setRtlProvider:(id)a3;
@end

@implementation SiriSharedUIPanDismissalGestureRecognizer

- (SiriSharedUIPanDismissalGestureRecognizer)initWithCoder:(id)a3
{
  return [(SiriSharedUIPanDismissalGestureRecognizer *)self initWithDismissalDelegate:0 dismissalStyle:0];
}

- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUIPanDismissalGestureRecognizer;
  v7 = [(SiriSharedUIPanDismissalGestureRecognizer *)&v10 initWithTarget:self action:sel_panGestureRecognizerDidPan_];
  v8 = v7;
  if (v7)
  {
    [(SiriSharedUIPanDismissalGestureRecognizer *)v7 setDismissalDelegate:v6];
    [(SiriSharedUIPanDismissalGestureRecognizer *)v8 setDismissalStyle:a4];
    [(SiriSharedUIPanDismissalGestureRecognizer *)v8 setDelegate:v8];
    [(SiriSharedUIPanDismissalGestureRecognizer *)v8 _preventHighlightingUntilGestureFaills];
  }

  return v8;
}

- (SiriSharedUIPanDismissalGestureRecognizer)initWithDismissalDelegate:(id)a3 dismissalStyle:(int64_t)a4 rtlProvider:(id)a5
{
  id v8 = a5;
  v9 = [(SiriSharedUIPanDismissalGestureRecognizer *)self initWithDismissalDelegate:a3 dismissalStyle:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id rtlProvider = v9->_rtlProvider;
    v9->_id rtlProvider = (id)v10;
  }
  return v9;
}

- (void)panGestureRecognizerDidPan:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int64_t dismissalStyle = self->_dismissalStyle;
  if (dismissalStyle == 2)
  {
    id v7 = v4;
    id v4 = (id)[(SiriSharedUIPanDismissalGestureRecognizer *)self _handlePanWithRubberBandUpDownDismissTrailing:v4 requiredDirection:0];
  }
  else
  {
    if (dismissalStyle != 1) {
      goto LABEL_6;
    }
    id v7 = v4;
    id v4 = (id)[(SiriSharedUIPanDismissalGestureRecognizer *)self _handlePanWithRubberBandDownDismissUp:v4 requiredDirection:1];
  }
  id v5 = v7;
LABEL_6:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_handlePanWithRubberBandDownDismissUp:(id)a3 requiredDirection:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v6 frame];
  id v8 = v7;
  uint64_t v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v5 translationInView:v15];
  v17 = v16;
  v19 = v18;

  *(void *)&v31.origin.x = v8;
  *(void *)&v31.origin.y = v10;
  *(void *)&v31.size.width = v12;
  *(void *)&v31.size.height = v14;
  CGFloat Height = CGRectGetHeight(v31);
  v21 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v5 velocityInView:v21];
  v24 = v23;
  v25 = v22;

  if ([v5 state] == 1)
  {
    *(void *)&self->_initialPosition.x = v8;
    *(void *)&self->_initialPosition.y = v10;
  }
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke;
  v28[3] = &unk_2640E3960;
  objc_copyWeak(v29, &location);
  v29[1] = v8;
  v29[2] = v10;
  v29[3] = v12;
  v29[4] = v14;
  v29[5] = v17;
  v29[6] = v19;
  v29[7] = *(id *)&Height;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke_2;
  v26[3] = &unk_2640E3988;
  objc_copyWeak(v27, &location);
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v17;
  v27[4] = v19;
  v27[5] = v8;
  v27[6] = v10;
  v27[7] = v12;
  v27[8] = v14;
  v27[9] = *(id *)&Height;
  [(SiriSharedUIPanDismissalGestureRecognizer *)self _updatePanGestureRecognizer:v5 changedAnimations:v28 endAnimations:v26];
  objc_destroyWeak(v27);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = *(double *)(a1 + 40);
    double v4 = *(double *)(a1 + 56);
    double v5 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 80);
    id v16 = WeakRetained;
    uint64_t v7 = [WeakRetained initialPosition];
    double v9 = v8;
    double v10 = *(double *)(a1 + 80);
    if (v6 > 0.0) {
      double v10 = SiriSharedUIConstrainValueWithRubberBand(v7, v10, 220.0);
    }
    double v11 = v9 + v10;
    v18.origin.x = v3;
    v18.origin.y = v11;
    v18.size.width = v4;
    v18.size.height = v5;
    double v12 = fmin((CGRectGetMinY(v18) + *(double *)(a1 + 88)) / *(double *)(a1 + 88), 1.0);
    if (v12 >= 0.0) {
      double v13 = v12;
    }
    else {
      double v13 = 0.0;
    }
    v14 = [v16 view];
    objc_msgSend(v14, "setFrame:", v3, v11, v4, v5);

    v15 = [v16 view];
    [v15 setAlpha:v13];

    id WeakRetained = v16;
  }
}

void __101__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandDownDismissUp_requiredDirection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = *(double *)(a1 + 48);
    id v16 = WeakRetained;
    [WeakRetained _contentScaleFactor];
    double v5 = -(SiriSharedUIProjectedTranslationWithVelocity(v3, v4) + *(double *)(a1 + 64));
    double v6 = CGRectGetHeight(*(CGRect *)(a1 + 72)) * 0.5;
    double v7 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 88);
    double v9 = *(double *)(a1 + 96);
    if (v6 >= v5)
    {
      [v16 initialPosition];
      double v10 = v12;
      double v11 = 1.0;
    }
    else
    {
      double v10 = -*(double *)(a1 + 104);
      double v11 = 0.0;
    }
    double v13 = [v16 view];
    objc_msgSend(v13, "setFrame:", v7, v10, v8, v9);

    v14 = [v16 view];
    [v14 setAlpha:v11];

    v15 = [v16 dismissalDelegate];
    [v15 dismissalGestureRecognizerDidFinish:v16 shouldDismiss:v6 < v5];

    id WeakRetained = v16;
  }
}

- (void)_handlePanWithRubberBandUpDownDismissTrailing:(id)a3 requiredDirection:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v7 frame];
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v15 = v14;

  [(SiriSharedUIPanDismissalGestureRecognizer *)self _windowBounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v39 = v9;
  v49.origin.x = v9;
  *(void *)&v49.origin.y = v11;
  *(void *)&v49.size.width = v13;
  *(void *)&v49.size.height = v15;
  double Width = CGRectGetWidth(v49);
  uint64_t v24 = [(SiriSharedUIPanDismissalGestureRecognizer *)self rtlProvider];
  if (!v24)
  {
    if (SiriSharedUILanguageIsRTL()) {
      goto LABEL_3;
    }
LABEL_5:
    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    char v28 = 0;
    double v41 = CGRectGetWidth(v50) - Width;
    goto LABEL_6;
  }
  v25 = (void *)v24;
  v26 = [(SiriSharedUIPanDismissalGestureRecognizer *)self rtlProvider];
  char v27 = v26[2]();

  if ((v27 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  double v41 = 0.0;
  char v28 = 1;
LABEL_6:
  v29 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v6 velocityInView:v29];
  CGRect v31 = v30;
  v33 = v32;

  v34 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v6 translationInView:v34];
  v36 = v35;
  v38 = v37;

  if ([v6 state] == 1
    && (self->_initialDirection = fabs(*(double *)&v33) > fabs(*(double *)&v31),
        self->_initialPosition.x = v39,
        *(void *)&self->_initialPosition.y = v11,
        self->_initialDirection != a4))
  {
    [v6 setState:4];
  }
  else
  {
    objc_initWeak(&location, self);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke;
    v45[3] = &unk_2640E39B0;
    objc_copyWeak(v46, &location);
    v46[1] = *(id *)&v39;
    v46[2] = v11;
    v46[3] = v13;
    v46[4] = v15;
    v46[5] = v36;
    v46[6] = v38;
    char v47 = v28;
    v46[7] = *(id *)&v41;
    v46[8] = *(id *)&Width;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke_2;
    v42[3] = &unk_2640E39D8;
    objc_copyWeak(v43, &location);
    v43[1] = *(id *)&v39;
    v43[2] = v11;
    v43[3] = v13;
    v43[4] = v15;
    v43[5] = v31;
    v43[6] = v33;
    v43[7] = v36;
    v43[8] = v38;
    char v44 = v28;
    v43[9] = *(id *)&Width;
    v43[10] = *(id *)&v41;
    [(SiriSharedUIPanDismissalGestureRecognizer *)self _updatePanGestureRecognizer:v6 changedAnimations:v45 endAnimations:v42];
    objc_destroyWeak(v43);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);
  }
}

void __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = *(double *)(a1 + 40);
    double v4 = *(double *)(a1 + 48);
    double v5 = *(double *)(a1 + 56);
    double v6 = *(double *)(a1 + 64);
    id v25 = WeakRetained;
    uint64_t v7 = [WeakRetained initialDirection];
    if (v7)
    {
      if (v7 == 1)
      {
        if (*(double *)(a1 + 80) <= 0.0) {
          double v8 = -1.0;
        }
        else {
          double v8 = 1.0;
        }
        uint64_t v9 = [v25 initialPosition];
        double v11 = v10;
        double v12 = SiriSharedUIConstrainValueWithRubberBand(v9, fabs(*(double *)(a1 + 80)), 220.0);
        double v13 = v25;
        double v4 = v11 + v8 * v12;
        goto LABEL_23;
      }
    }
    else
    {
      double v14 = *(double *)(a1 + 72);
      double v15 = 0.0;
      if (v14 <= 0.0) {
        double v16 = *(double *)(a1 + 72);
      }
      else {
        double v16 = 0.0;
      }
      double v17 = fmax(v14, 0.0);
      if (*(unsigned char *)(a1 + 104)) {
        double v18 = v16;
      }
      else {
        double v18 = v17;
      }
      [v25 initialPosition];
      double v3 = v18 + v19;
      v27.origin.x = v3;
      v27.origin.y = v4;
      v27.size.width = v5;
      v27.size.height = v6;
      double MinX = CGRectGetMinX(v27);
      if (*(unsigned char *)(a1 + 104)) {
        double v21 = MinX;
      }
      else {
        double v21 = *(double *)(a1 + 88);
      }
      if (*(unsigned char *)(a1 + 104)) {
        double MinX = *(double *)(a1 + 88);
      }
      double v22 = fmin((*(double *)(a1 + 96) - (MinX - v21)) / *(double *)(a1 + 96), 1.0);
      if (v22 >= 0.0) {
        double v15 = v22;
      }
      CGFloat v23 = [v25 view];
      [v23 setAlpha:v15];
    }
    double v13 = v25;
LABEL_23:
    uint64_t v24 = [v13 view];
    objc_msgSend(v24, "setFrame:", v3, v4, v5, v6);

    id WeakRetained = v25;
  }
}

void __109__SiriSharedUIPanDismissalGestureRecognizer__handlePanWithRubberBandUpDownDismissTrailing_requiredDirection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 40);
    double v3 = *(double *)(a1 + 48);
    double v5 = *(double *)(a1 + 56);
    double v6 = *(double *)(a1 + 64);
    id v24 = WeakRetained;
    uint64_t v7 = [WeakRetained initialDirection];
    if (v7)
    {
      if (v7 == 1)
      {
        [v24 initialPosition];
        double v3 = v8;
      }
      uint64_t v9 = 0;
      goto LABEL_14;
    }
    double v10 = *(double *)(a1 + 72);
    [v24 _contentScaleFactor];
    double v12 = SiriSharedUIProjectedTranslationWithVelocity(v10, v11) + *(double *)(a1 + 88);
    int v13 = *(unsigned __int8 *)(a1 + 120);
    double v14 = *(double *)(a1 + 104);
    [v24 initialPosition];
    double v3 = v15;
    if (v13)
    {
      if (v12 < v14 * -0.5) {
        goto LABEL_8;
      }
    }
    else if (v12 > v14 * 0.5)
    {
LABEL_8:
      double v17 = *(double *)(a1 + 104);
      double v16 = *(double *)(a1 + 112);
      double v18 = v16 + v17;
      double v19 = 0.0;
      double v20 = v16 - v17;
      uint64_t v9 = 1;
      if (*(unsigned char *)(a1 + 120)) {
        double v4 = v20;
      }
      else {
        double v4 = v18;
      }
      goto LABEL_13;
    }
    uint64_t v9 = 0;
    double v4 = *(double *)(a1 + 112);
    double v19 = 1.0;
LABEL_13:
    double v21 = [v24 view];
    [v21 setAlpha:v19];

LABEL_14:
    double v22 = [v24 view];
    objc_msgSend(v22, "setFrame:", v4, v3, v5, v6);

    CGFloat v23 = [v24 dismissalDelegate];
    [v23 dismissalGestureRecognizerDidFinish:v24 shouldDismiss:v9];

    id WeakRetained = v24;
  }
}

- (void)_updatePanGestureRecognizer:(id)a3 changedAnimations:(id)a4 endAnimations:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v10 state] == 2) {
    [(SiriSharedUIPanDismissalGestureRecognizer *)self _runAnimationsWithPreferredStyle:v8];
  }
  if ([v10 state] == 3 || objc_msgSend(v10, "state") == 4) {
    [(SiriSharedUIPanDismissalGestureRecognizer *)self _runAnimationsWithPreferredStyle:v9];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(SiriSharedUIPanDismissalGestureRecognizer *)self dismissalDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SiriSharedUIPanDismissalGestureRecognizer *)self dismissalDelegate];
    char v9 = [v8 shouldBeginDismissalGestureRecognizer:self withTouch:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)_preventHighlightingUntilGestureFaills
{
}

- (void)_runAnimationsWithPreferredStyle:(id)a3
{
}

- (double)_contentScaleFactor
{
  v2 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  [v2 contentScaleFactor];
  double v4 = v3;

  return v4;
}

- (CGRect)_windowBounds
{
  v2 = [(SiriSharedUIPanDismissalGestureRecognizer *)self view];
  double v3 = [v2 window];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (SiriSharedUIPanDismissalGestureRecognizerDelegate)dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  return (SiriSharedUIPanDismissalGestureRecognizerDelegate *)WeakRetained;
}

- (void)setDismissalDelegate:(id)a3
{
}

- (int64_t)dismissalStyle
{
  return self->_dismissalStyle;
}

- (void)setDismissalStyle:(int64_t)a3
{
  self->_int64_t dismissalStyle = a3;
}

- (CGPoint)initialPosition
{
  double x = self->_initialPosition.x;
  double y = self->_initialPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  self->_initialPosition = a3;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_initialDirection = a3;
}

- (id)rtlProvider
{
  return self->_rtlProvider;
}

- (void)setRtlProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rtlProvider, 0);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
}

@end