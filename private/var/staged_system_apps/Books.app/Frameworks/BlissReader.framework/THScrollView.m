@interface THScrollView
- (BOOL)disableParentScrollOnFirstOrLastPage;
- (BOOL)handleNaturally;
- (BOOL)isAncestorScrollViewDragging;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)preventBounceAnimation;
- (BOOL)preventChildInducedBounce;
- (BOOL)suspendScrolling;
- (NSArray)deadTouchRectsForPan;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilitySpeakSelectionTextInputResponder;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)parentScrollView;
- (void)dealloc;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDeadTouchRectsForPan:(id)a3;
- (void)setDisableParentScrollOnFirstOrLastPage:(BOOL)a3;
- (void)setHandleNaturally:(BOOL)a3;
- (void)setPreventBounceAnimation:(BOOL)a3;
- (void)setPreventChildInducedBounce:(BOOL)a3;
- (void)setSuspendScrolling:(BOOL)a3;
@end

@implementation THScrollView

- (BOOL)isAncestorScrollViewDragging
{
  objc_opt_class();
  [(THScrollView *)self delegate];
  v3 = (void *)TSUDynamicCast();
  if (v3
    && (objc_msgSend(objc_msgSend(objc_msgSend(v3, "layerHost"), "asiOSCVC"), "isDraggingViaGuidedPan") & 1) != 0)
  {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)THScrollView;
  return [(THScrollView *)&v5 isAncestorScrollViewDragging];
}

- (void)dealloc
{
  [(THScrollView *)self setDeadTouchRectsForPan:0];
  v3.receiver = self;
  v3.super_class = (Class)THScrollView;
  [(THScrollView *)&v3 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v44.receiver = self;
  v44.super_class = (Class)THScrollView;
  id v7 = -[THScrollView hitTest:withEvent:](&v44, "hitTest:withEvent:", a4);
  if ([(THScrollView *)self preventChildInducedBounce])
  {
    v8 = v7;
    while (1)
    {
      while (1)
      {
        id v9 = [v8 superview];
        if (!v9) {
          return v7;
        }
        v8 = v9;
        objc_opt_class();
        v10 = (THScrollView *)TSUDynamicCast();
        [(THScrollView *)self frame];
        double v12 = v11;
        [(THScrollView *)self frame];
        double v14 = v13;
        [(THScrollView *)v10 frame];
        double v16 = v15;
        [(THScrollView *)v10 frame];
        if (v10 == self) {
          break;
        }
        BOOL v18 = v17 >= v14 * 0.9 && v16 >= v12 * 0.9;
        if (v10) {
          goto LABEL_11;
        }
      }
      BOOL v18 = 0;
      if (v10)
      {
LABEL_11:
        if (!v18)
        {
          if ([(THScrollView *)self suspendScrolling]) {
            goto LABEL_13;
          }
          if (v10 == self || ![(THScrollView *)v10 isScrollEnabled])
          {
LABEL_22:
            v19 = self;
            uint64_t v20 = 1;
          }
          else
          {
            objc_opt_class();
            v22 = (void *)TSUDynamicCast();
            if (v22)
            {
              v23 = v22;
              if ([v22 handleNaturally]) {
                goto LABEL_22;
              }
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v25 = [v23 deadTouchRectsForPan];
              id v26 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v41;
                while (2)
                {
                  for (i = 0; i != v27; i = (char *)i + 1)
                  {
                    if (*(void *)v41 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    [*(id *)(*((void *)&v40 + 1) + 8 * i) CGRectValue];
                    CGFloat v31 = v30;
                    CGFloat v33 = v32;
                    CGFloat v35 = v34;
                    CGFloat v37 = v36;
                    -[THScrollView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
                    v46.double x = v38;
                    v46.double y = v39;
                    v47.origin.double x = v31;
                    v47.origin.double y = v33;
                    v47.size.width = v35;
                    v47.size.height = v37;
                    if (CGRectContainsPoint(v47, v46))
                    {
                      [(THScrollView *)self setScrollEnabled:1];
                      return self;
                    }
                  }
                  id v27 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }
              if ([(THScrollView *)v10 isSettledOnFirstOrLastPage]) {
                uint64_t v20 = [v23 disableParentScrollOnFirstOrLastPage] ^ 1;
              }
              else {
                uint64_t v20 = 0;
              }
              v19 = self;
            }
            else
            {
LABEL_13:
              v19 = self;
              uint64_t v20 = 0;
            }
          }
          [(THScrollView *)v19 setScrollEnabled:v20];
          return v7;
        }
      }
    }
  }
  if (![(THScrollView *)self handleNaturally]
    && objc_msgSend(-[THScrollView parentScrollView](self, "parentScrollView"), "preventChildInducedBounce"))
  {
    BOOL v21 = (unint64_t)[(THScrollView *)self pageCount] > 2
       || [(THScrollView *)self disableParentScrollOnFirstOrLastPage];
    [(THScrollView *)self setBounces:v21];
  }
  return v7;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->mPreventBounceAnimation
    && [(THScrollView *)self isPagingEnabled]
    && [(THScrollView *)self isDecelerating]
    && ([(THScrollView *)self isTracking] & 1) == 0)
  {
    [(THScrollView *)self contentOffset];
    double v7 = v6;
    [(THScrollView *)self spi_pageDecelerationTarget];
    double v9 = v8;
    [(THScrollView *)self bounds];
    double v11 = v10;
    [(THScrollView *)self contentSize];
    double v13 = v11 * round(v9 / v11);
    if (v11 + v13 <= v12) {
      double v14 = v13;
    }
    else {
      double v14 = v12 - v11;
    }
    if (x < v14)
    {
      float v15 = v14;
      float v16 = v7;
      float v17 = fminf(v15, v16);
      float v18 = x;
      float v19 = fmaxf(v17, v18);
LABEL_12:
      double x = v19;
      goto LABEL_13;
    }
    if (x > v14)
    {
      float v20 = v14;
      float v21 = v7;
      float v22 = fmaxf(v20, v21);
      float v23 = x;
      float v19 = fminf(v22, v23);
      goto LABEL_12;
    }
  }
LABEL_13:
  v24.receiver = self;
  v24.super_class = (Class)THScrollView;
  -[THScrollView setContentOffset:](&v24, "setContentOffset:", x, y);
}

- (id)parentScrollView
{
  id v2 = [(THScrollView *)self superview];
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  do
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    id v5 = [v3 superview];
    if (!v5) {
      break;
    }
    objc_super v3 = v5;
  }
  while (!v4);
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(THScrollView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_opt_class();
  [(THScrollView *)self delegate];
  float v16 = (void *)TSUDynamicCast();
  if (v16)
  {
    float v17 = v16;
    [v16 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(objc_msgSend(v17, "delegate"), "interactiveCanvasController:expandBoundsForScrollViewHitTesting:", v17, v9, v11, v13, v15);
      double v9 = v18;
      double v11 = v19;
      double v13 = v20;
      double v15 = v21;
    }
  }
  v36.origin.double x = v9;
  v36.origin.double y = v11;
  v36.size.width = v13;
  v36.size.height = v15;
  v35.double x = x;
  v35.double y = y;
  if (CGRectContainsPoint(v36, v35))
  {
    LOBYTE(v22) = 1;
  }
  else if ([(THScrollView *)self clipsToBounds])
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = [(THScrollView *)self subviews];
    id v22 = [v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      id v24 = v22;
      char v25 = 0;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v28 convertPoint:self x:y];
          if (objc_msgSend(v28, "pointInside:withEvent:", a4)) {
            char v25 = 1;
          }
        }
        id v24 = [v23 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
      LOBYTE(v22) = v25;
    }
  }
  return (char)v22;
}

- (BOOL)preventChildInducedBounce
{
  return self->mPreventChildInducedBounce;
}

- (void)setPreventChildInducedBounce:(BOOL)a3
{
  self->mPreventChildInducedBounce = a3;
}

- (NSArray)deadTouchRectsForPan
{
  return self->mDeadTouchRectsForPan;
}

- (void)setDeadTouchRectsForPan:(id)a3
{
}

- (BOOL)suspendScrolling
{
  return self->mSuspendScrolling;
}

- (void)setSuspendScrolling:(BOOL)a3
{
  self->mSuspendScrolling = a3;
}

- (BOOL)handleNaturally
{
  return self->mHandleNaturally;
}

- (void)setHandleNaturally:(BOOL)a3
{
  self->mHandleNaturalldouble y = a3;
}

- (BOOL)disableParentScrollOnFirstOrLastPage
{
  return self->mDisableParentScrollOnFirstOrLastPage;
}

- (void)setDisableParentScrollOnFirstOrLastPage:(BOOL)a3
{
  self->mDisableParentScrollOnFirstOrLastPage = a3;
}

- (BOOL)preventBounceAnimation
{
  return self->mPreventBounceAnimation;
}

- (void)setPreventBounceAnimation:(BOOL)a3
{
  self->mPreventBounceAnimation = a3;
}

- (id)_accessibilityQuickSpeakContent
{
  id v2 = [(THScrollView *)self tsaxValueForKey:@"delegate"];

  return [v2 tsaxValueForKey:@"_accessibilityQuickSpeakContent"];
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  id v2 = [(THScrollView *)self tsaxValueForKey:@"delegate"];

  return [v2 tsaxValueForKey:@"_accessibilitySpeakSelectionTextInputResponder"];
}

@end