@interface SiriSharedUIExpandablePlatterPanGestureRecognizer
- (BOOL)allowExpandedState;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (SiriSharedUIExpandablePlatterPanGestureRecognizer)initWithExpansionDelegate:(id)a3;
- (SiriSharedUIExpandablePlatterPanGestureRecognizerDelegate)expansionDelegate;
- (double)collapsedHeight;
- (double)expandedHeight;
- (double)initialHeight;
- (double)projectedTranslationWithVelocity:(double)a3 decelerationRate:(double)a4;
- (double)scrollViewContentHeight;
- (void)panGestureRecognizerDidPan:(id)a3;
- (void)setAllowExpandedState:(BOOL)a3;
- (void)setCollapsedHeight:(double)a3;
- (void)setExpandedHeight:(double)a3;
- (void)setExpansionDelegate:(id)a3;
- (void)setInitialHeight:(double)a3;
- (void)setScrollViewContentHeight:(double)a3;
@end

@implementation SiriSharedUIExpandablePlatterPanGestureRecognizer

- (SiriSharedUIExpandablePlatterPanGestureRecognizer)initWithExpansionDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIExpandablePlatterPanGestureRecognizer;
  v5 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)&v8 initWithTarget:self action:sel_panGestureRecognizerDidPan_];
  v6 = v5;
  if (v5)
  {
    [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)v5 setDelegate:v5];
    objc_storeWeak((id *)&v6->_expansionDelegate, v4);
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = 0;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)panGestureRecognizerDidPan:(id)a3
{
  id v41 = a3;
  id v4 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self view];
  [v41 translationInView:v4];
  double v6 = v5;

  v7 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self view];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  uint64_t v16 = [v41 state];
  v17 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self view];
  [v41 velocityInView:v17];
  double v19 = v18;
  double v21 = v20;

  if (v16 == 3)
  {
    [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self projectedTranslationWithVelocity:v21 decelerationRate:SiriSharedUIScrollViewDecelerationRateNormal()];
    double v6 = v6 + v22;
  }
  CGFloat v39 = v9;
  v43.origin.x = v9;
  v43.origin.y = v11;
  v43.size.width = v13;
  v43.size.height = v15;
  double Height = CGRectGetHeight(v43);
  if (self->_allowExpandedState)
  {
    if (self->_expandedHeight >= self->_scrollViewContentHeight) {
      scrollViewContentdouble Height = self->_scrollViewContentHeight;
    }
    else {
      scrollViewContentdouble Height = self->_expandedHeight;
    }
    uint64_t v25 = 3;
  }
  else
  {
    scrollViewContentdouble Height = self->_initialHeight;
    uint64_t v25 = 1;
  }
  if (objc_msgSend(v41, "state", *(void *)&v39) == 1)
  {
    if (fabs(v19) > fabs(v21))
    {
      [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self setState:4];
      goto LABEL_33;
    }
    v30 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self expansionDelegate];
    [v30 expandablePlatterGestureDidBeginWithRecognizer:self];
  }
  else
  {
    if ([v41 state] != 2) {
      goto LABEL_21;
    }
    double v26 = Height - v6;
    BOOL v27 = Height - v6 <= scrollViewContentHeight;
    collapseddouble Height = scrollViewContentHeight;
    if (v27)
    {
      if (v26 < self->_collapsedHeight) {
        collapseddouble Height = self->_collapsedHeight;
      }
      else {
        collapseddouble Height = v26;
      }
    }
    v29 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self view];
    objc_msgSend(v41, "setTranslation:inView:", v29, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

    v30 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self expansionDelegate];
    [v30 expandablePlatterGesture:self trackingGestureDidUpdateHeight:collapsedHeight];
  }

LABEL_21:
  BOOL v31 = [v41 state] == 3;
  v32 = v41;
  if (v31)
  {
    v44.origin.x = v40;
    v44.origin.y = v11;
    v44.size.width = v13;
    v44.size.height = v15;
    double v33 = CGRectGetHeight(v44);
    if (v21 < 0.0 || v33 / scrollViewContentHeight >= 0.5 && v21 == 0.0)
    {
      v45.origin.x = v40;
      v45.origin.y = v11;
      v45.size.width = v13;
      v45.size.height = v15;
      CGFloat v34 = CGRectGetHeight(v45);
      double v35 = self->_collapsedHeight;
      if (v34 > v35) {
        goto LABEL_30;
      }
    }
    else
    {
      double v35 = self->_collapsedHeight;
    }
    uint64_t v25 = 2;
    scrollViewContentdouble Height = v35;
LABEL_30:
    v36 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self expansionDelegate];
    [v36 expandablePlatterGesture:self didCompleteTransitionToStyle:v25 phaseHeight:scrollViewContentHeight];

    v37 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self expansionDelegate];
    [v37 expandablePlatterGestureDidEndWithRecognizer:self];

    v32 = v41;
  }
  if ([v32 state] == 4)
  {
    v38 = [(SiriSharedUIExpandablePlatterPanGestureRecognizer *)self expansionDelegate];
    [v38 expandablePlatterGestureDidEndWithRecognizer:self];
  }
LABEL_33:
}

- (double)projectedTranslationWithVelocity:(double)a3 decelerationRate:(double)a4
{
  return a3 / 5000.0 * a4 / (1.0 - a4);
}

- (double)collapsedHeight
{
  return self->_collapsedHeight;
}

- (void)setCollapsedHeight:(double)a3
{
  self->_collapseddouble Height = a3;
}

- (double)initialHeight
{
  return self->_initialHeight;
}

- (void)setInitialHeight:(double)a3
{
  self->_initialdouble Height = a3;
}

- (double)scrollViewContentHeight
{
  return self->_scrollViewContentHeight;
}

- (void)setScrollViewContentHeight:(double)a3
{
  self->_scrollViewContentdouble Height = a3;
}

- (double)expandedHeight
{
  return self->_expandedHeight;
}

- (void)setExpandedHeight:(double)a3
{
  self->_expandeddouble Height = a3;
}

- (BOOL)allowExpandedState
{
  return self->_allowExpandedState;
}

- (void)setAllowExpandedState:(BOOL)a3
{
  self->_allowExpandedState = a3;
}

- (SiriSharedUIExpandablePlatterPanGestureRecognizerDelegate)expansionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expansionDelegate);
  return (SiriSharedUIExpandablePlatterPanGestureRecognizerDelegate *)WeakRetained;
}

- (void)setExpansionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end