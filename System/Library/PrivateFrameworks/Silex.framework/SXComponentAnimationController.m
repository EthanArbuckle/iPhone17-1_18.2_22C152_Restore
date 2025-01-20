@interface SXComponentAnimationController
- (CADisplayLink)displayLink;
- (CGRect)convertRectForComponent:(id)a3;
- (NSMutableSet)animatingComponents;
- (NSMutableSet)animationHandlersToFinish;
- (NSMutableSet)registeredComponents;
- (SXComponentAnimationController)initWithViewport:(id)a3;
- (SXViewport)viewport;
- (id)animatingHandlerForComponent:(id)a3;
- (id)registeredHandlerForComponent:(id)a3;
- (void)displayLinkTick:(id)a3;
- (void)finishAnimationHandlerAnimated:(id)a3;
- (void)registerComponentView:(id)a3 animation:(id)a4;
- (void)setAnimatingComponents:(id)a3;
- (void)setRegisteredComponents:(id)a3;
- (void)startOrStopDisplayLink;
- (void)startUpdatingAnimationForComponentView:(id)a3;
- (void)stopUpdatingAnimationForComponentView:(id)a3;
- (void)stopUpdatingAnimationForComponentView:(id)a3 finishAnimation:(BOOL)a4;
- (void)unregisterComponentView:(id)a3;
- (void)updateVisibleBounds:(CGRect)a3;
- (void)updateVisibleBoundsIfNeeded;
@end

@implementation SXComponentAnimationController

- (SXComponentAnimationController)initWithViewport:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentAnimationController;
  v6 = [(SXComponentAnimationController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewport, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    registeredComponents = v7->_registeredComponents;
    v7->_registeredComponents = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    animatingComponents = v7->_animatingComponents;
    v7->_animatingComponents = (NSMutableSet *)v10;

    [(SXViewport *)v7->_viewport addViewportChangeListener:v7 forOptions:30];
  }

  return v7;
}

- (void)registerComponentView:(id)a3 animation:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (objc_class *)[v6 handlerClass];
  uint64_t v8 = [(SXComponentAnimationController *)self animatingHandlerForComponent:v10];
  if (!v8) {
    uint64_t v8 = (void *)[[v7 alloc] initWithComponent:v10 withAnimation:v6];
  }
  v9 = [(SXComponentAnimationController *)self registeredComponents];
  [v9 addObject:v8];

  if ([v8 state] == 4 && (objc_msgSend(v8, "animationShouldRepeat") & 1) != 0
    || [v8 state] != 3 && objc_msgSend(v8, "state") != 4)
  {
    [v8 prepareAnimation];
  }
  [(SXComponentAnimationController *)self updateVisibleBoundsIfNeeded];
}

- (void)unregisterComponentView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SXComponentAnimationController *)self registeredComponents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      id v11 = [v10 component];

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    objc_super v13 = [(SXComponentAnimationController *)self registeredComponents];
    [v13 removeObject:v12];

    id v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)startUpdatingAnimationForComponentView:(id)a3
{
  id v6 = [(SXComponentAnimationController *)self registeredHandlerForComponent:a3];
  if (v6)
  {
    id v4 = [(SXComponentAnimationController *)self animatingComponents];
    if (([v4 containsObject:v6] & 1) == 0)
    {
      uint64_t v5 = [v6 state];

      if (v5 == 4) {
        goto LABEL_6;
      }
      id v4 = [(SXComponentAnimationController *)self animatingComponents];
      [v4 addObject:v6];
    }
  }
LABEL_6:
  [(SXComponentAnimationController *)self updateVisibleBoundsIfNeeded];
}

- (void)stopUpdatingAnimationForComponentView:(id)a3
{
}

- (void)stopUpdatingAnimationForComponentView:(id)a3 finishAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  uint64_t v6 = -[SXComponentAnimationController animatingHandlerForComponent:](self, "animatingHandlerForComponent:");
  uint64_t v7 = (void *)v6;
  if (v4 && !v6)
  {
    uint64_t v7 = [(SXComponentAnimationController *)self registeredHandlerForComponent:v12];
  }
  if (v7)
  {
    if ([v7 state] != 4)
    {
      char v8 = [v7 animationShouldRepeat];
      if ((v8 & 1) != 0 || v4)
      {
        if (v8) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v9 = [v7 animation];
        if ([v9 userControllable])
        {

          goto LABEL_12;
        }
        uint64_t v11 = [v7 state];

        if (v11 == 1) {
          goto LABEL_12;
        }
      }
      [v7 finishAnimation];
    }
LABEL_12:
    id v10 = [(SXComponentAnimationController *)self animatingComponents];
    [v10 removeObject:v7];
  }
}

- (void)updateVisibleBoundsIfNeeded
{
  id v6 = [(SXComponentAnimationController *)self viewport];
  if ([v6 isPopulated])
  {
    v3 = [(SXComponentAnimationController *)self viewport];
    if ([v3 appearState] == 2)
    {
    }
    else
    {
      BOOL v4 = [(SXComponentAnimationController *)self viewport];
      uint64_t v5 = [v4 appearState];

      if (v5 != 1) {
        return;
      }
    }
    id v6 = [(SXComponentAnimationController *)self viewport];
    [v6 dynamicBounds];
    -[SXComponentAnimationController updateVisibleBounds:](self, "updateVisibleBounds:");
  }
}

- (void)updateVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v66 = *MEMORY[0x263EF8340];
  double MinY = CGRectGetMinY(a3);
  double v59 = x;
  double v60 = y;
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  double v9 = width;
  v67.size.CGFloat width = width;
  double v10 = height;
  v67.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v67);
  id v12 = [(SXComponentAnimationController *)self viewport];
  [v12 dynamicBounds];
  double v58 = CGRectGetMinY(v68);
  objc_super v13 = [(SXComponentAnimationController *)self viewport];
  [v13 documentSize];
  double v15 = v14;
  long long v16 = [(SXComponentAnimationController *)self viewport];
  [v16 bounds];
  double v18 = v17;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v19 = [(SXComponentAnimationController *)self animatingComponents];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    double v22 = MinY + v11;
    double v57 = v15 - v18;
    uint64_t v23 = *(void *)v62;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v62 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v61 + 1) + 8 * v24);
        v26 = [v25 componentViewToAnimate];
        [(SXComponentAnimationController *)self convertRectForComponent:v26];
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;

        v69.origin.CGFloat x = v59;
        v69.origin.CGFloat y = v60;
        v69.size.CGFloat width = v9;
        v69.size.CGFloat height = v10;
        double v35 = CGRectGetHeight(v69);
        [v25 screenHeightStartOffset];
        CGFloat v37 = v22 - v35 * v36;
        v70.origin.CGFloat x = v28;
        v70.origin.CGFloat y = v30;
        v70.size.CGFloat width = v32;
        v70.size.CGFloat height = v34;
        if (v37 < CGRectGetMinY(v70) || [v25 state] == 4 || objc_msgSend(v25, "state") == 3)
        {
          if ([v25 state] == 1)
          {
            v71.origin.CGFloat x = v28;
            v71.origin.CGFloat y = v30;
            v71.size.CGFloat width = v32;
            v71.size.CGFloat height = v34;
            double MaxY = CGRectGetMaxY(v71);
            v39 = [(SXComponentAnimationController *)self viewport];
            [v39 documentSize];
            double v41 = v40;
            v42 = [(SXComponentAnimationController *)self viewport];
            [v42 bounds];
            double v44 = v43;
            [v25 screenHeightStartOffset];
            double v46 = v41 - v44 * v45;

            if (MaxY > v46) {
LABEL_11:
            }
              [v25 startAnimation];
          }
        }
        else
        {
          v47 = [v25 animation];
          int v48 = [v47 userControllable];

          if (!v48)
          {
            v53 = [(SXComponentAnimationController *)self viewport];
            uint64_t v54 = [v53 appearState];

            if (v54 == 2) {
              goto LABEL_11;
            }
            goto LABEL_22;
          }
          v49 = [(SXComponentAnimationController *)self animationHandlersToFinish];
          char v50 = [v49 containsObject:v25];

          if (v50) {
            goto LABEL_12;
          }
          if ((v58 < v57 || (objc_msgSend(v25, "shouldFinishAtEndOfScrollView", v58) & 1) == 0)
            && (objc_msgSend(v25, "factorForVisibileBounds:andAbsoluteComponentRect:", v59, v60, v9, v10, v28, v30, v32, v34), v51 != 1.0)|| (v52 = objc_msgSend(v25, "animationShouldRepeat"), double v51 = 1.0, (v52 & 1) != 0))
          {
            [v25 updateAnimationWithFactor:v51];
            goto LABEL_12;
          }
          objc_msgSend(v25, "factor", 1.0);
          if (v55 >= 0.95)
          {
            [v25 updateAnimationWithFactor:1.0];
LABEL_22:
            [v25 finishAnimation];
            goto LABEL_12;
          }
          [(SXComponentAnimationController *)self finishAnimationHandlerAnimated:v25];
        }
LABEL_12:
        ++v24;
      }
      while (v21 != v24);
      uint64_t v56 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
      uint64_t v21 = v56;
    }
    while (v56);
  }
}

- (CGRect)convertRectForComponent:(id)a3
{
  id v4 = a3;
  [v4 center];
  double v6 = v5;
  [v4 bounds];
  double v8 = v6 - v7 * 0.5;
  [v4 center];
  double v10 = v9;
  [v4 bounds];
  double v12 = v10 - v11 * 0.5;
  [v4 bounds];
  double v14 = v13;
  [v4 bounds];
  double v16 = v15;
  double v17 = [(SXComponentAnimationController *)self viewport];
  double v18 = [v4 superview];

  objc_msgSend(v17, "convertRect:fromView:", v18, v8, v12, v14, v16);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (id)registeredHandlerForComponent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(SXComponentAnimationController *)self registeredComponents];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 component];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)animatingHandlerForComponent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(SXComponentAnimationController *)self registeredComponents];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 component];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)finishAnimationHandlerAnimated:(id)a3
{
  id v7 = a3;
  id v4 = [(SXComponentAnimationController *)self animationHandlersToFinish];

  if (v4)
  {
    animationHandlersToFinish = [(SXComponentAnimationController *)self animationHandlersToFinish];
    [animationHandlersToFinish addObject:v7];
  }
  else
  {
    id v6 = [MEMORY[0x263EFF9C0] setWithObject:v7];
    animationHandlersToFinish = self->_animationHandlersToFinish;
    self->_animationHandlersToFinish = v6;
  }

  [(SXComponentAnimationController *)self startOrStopDisplayLink];
}

- (void)startOrStopDisplayLink
{
  v3 = [(SXComponentAnimationController *)self displayLink];
  if (v3)
  {
  }
  else
  {
    double v8 = [(SXComponentAnimationController *)self animationHandlersToFinish];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_displayLinkTick_];
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      long long v15 = [(SXComponentAnimationController *)self displayLink];
      long long v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [(CADisplayLink *)v15 addToRunLoop:v12 forMode:*MEMORY[0x263EFF588]];

      long long v13 = v15;
      goto LABEL_9;
    }
  }
  uint64_t v4 = [(SXComponentAnimationController *)self displayLink];
  if (!v4) {
    return;
  }
  double v5 = (void *)v4;
  id v6 = [(SXComponentAnimationController *)self animationHandlersToFinish];
  uint64_t v7 = [v6 count];

  if (v7) {
    return;
  }
  long long v14 = [(SXComponentAnimationController *)self displayLink];
  [v14 invalidate];

  long long v13 = self->_displayLink;
  self->_displayLink = 0;
LABEL_9:
}

- (void)displayLinkTick:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [a3 duration];
  double v5 = v4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(SXComponentAnimationController *)self animationHandlersToFinish];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    double v11 = v5 + v5;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v14 factor];
        if (v15 >= 1.0)
        {
          double v18 = [(SXComponentAnimationController *)self animationHandlersToFinish];
          [v18 removeObject:v14];

          [v14 updateAnimationWithFactor:1.0];
          [v14 finishAnimation];
          char v10 = 1;
        }
        else
        {
          [v14 factor];
          double v17 = v11 + v16;
          if (v17 > 1.0) {
            double v17 = 1.0;
          }
          [v14 updateAnimationWithFactor:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);

    if (v10) {
      [(SXComponentAnimationController *)self startOrStopDisplayLink];
    }
  }
  else
  {
  }
}

- (NSMutableSet)registeredComponents
{
  return self->_registeredComponents;
}

- (void)setRegisteredComponents:(id)a3
{
}

- (NSMutableSet)animatingComponents
{
  return self->_animatingComponents;
}

- (void)setAnimatingComponents:(id)a3
{
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (NSMutableSet)animationHandlersToFinish
{
  return self->_animationHandlersToFinish;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationHandlersToFinish, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_animatingComponents, 0);
  objc_storeStrong((id *)&self->_registeredComponents, 0);
}

@end