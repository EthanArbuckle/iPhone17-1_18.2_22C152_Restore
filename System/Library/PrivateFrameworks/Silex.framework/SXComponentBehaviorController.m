@interface SXComponentBehaviorController
- (NSMutableSet)behaviorHandlers;
- (SXComponentBehaviorController)initWithViewport:(id)a3 andAnimator:(id)a4;
- (SXViewport)viewport;
- (UIDynamicAnimator)animator;
- (id)existingHandlerForComponentView:(id)a3 behavior:(id)a4;
- (void)registerComponentView:(id)a3 behavior:(id)a4;
- (void)reset;
- (void)setViewport:(id)a3;
- (void)unregisterComponentView:(id)a3;
- (void)update;
- (void)updateComponentView:(id)a3;
- (void)updateHandler:(id)a3;
@end

@implementation SXComponentBehaviorController

- (SXComponentBehaviorController)initWithViewport:(id)a3 andAnimator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXComponentBehaviorController;
  v9 = [(SXComponentBehaviorController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_animator, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    behaviorHandlers = v10->_behaviorHandlers;
    v10->_behaviorHandlers = v11;

    [(SXViewport *)v10->_viewport addViewportChangeListener:v10 forOptions:14];
  }

  return v10;
}

- (void)registerComponentView:(id)a3 behavior:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 component];
  id v8 = (objc_class *)[v6 handlerClassForComponent:v7];

  if (v8)
  {
    v9 = [(SXComponentBehaviorController *)self existingHandlerForComponentView:v11 behavior:v6];
    if (!v9)
    {
      v9 = (void *)[[v8 alloc] initWithComponentView:v11 withBehavior:v6];
      v10 = [(SXComponentBehaviorController *)self behaviorHandlers];
      [v10 addObject:v9];
    }
  }
}

- (void)unregisterComponentView:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [(SXComponentBehaviorController *)self behaviorHandlers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = [v11 componentView];

        if (v12 == v4) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = [(SXComponentBehaviorController *)self behaviorHandlers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if ([v18 isSetup]) {
          [v18 destroyWithBehaviorController:self];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  v19 = [(SXComponentBehaviorController *)self behaviorHandlers];
  [v19 minusSet:v5];
}

- (id)existingHandlerForComponentView:(id)a3 behavior:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(SXComponentBehaviorController *)self behaviorHandlers];
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 componentView];
        if (v13 == v6)
        {
          id v14 = [v12 behavior];

          if (v14 == v7)
          {
            id v9 = v12;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)update
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [(SXComponentBehaviorController *)self viewport];
  int v4 = [v3 isPopulated];

  if (v4)
  {
    id v5 = [(SXComponentBehaviorController *)self viewport];
    [v5 dynamicBounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    id v14 = [(SXComponentBehaviorController *)self viewport];
    [v14 bounds];
    CGFloat v16 = v15 * -2.0;
    v39.origin.CGFloat x = v7;
    v39.origin.CGFloat y = v9;
    v39.size.CGFloat width = v11;
    v39.size.CGFloat height = v13;
    CGRect v40 = CGRectInset(v39, 0.0, v16);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v21 = [(SXComponentBehaviorController *)self behaviorHandlers];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v26 requiresContinuousUpdates]) {
            goto LABEL_9;
          }
          long long v27 = [v26 componentView];
          [v27 absoluteFrame];
          v42.origin.CGFloat x = v28;
          v42.origin.CGFloat y = v29;
          v42.size.CGFloat width = v30;
          v42.size.CGFloat height = v31;
          v41.origin.CGFloat x = x;
          v41.origin.CGFloat y = y;
          v41.size.CGFloat width = width;
          v41.size.CGFloat height = height;
          BOOL v32 = CGRectIntersectsRect(v41, v42);

          if (v32) {
LABEL_9:
          }
            [(SXComponentBehaviorController *)self updateHandler:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v23);
    }
  }
}

- (void)updateComponentView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SXComponentBehaviorController *)self viewport];
  int v6 = [v5 isPopulated];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CGFloat v7 = [(SXComponentBehaviorController *)self behaviorHandlers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v13 = [v12 componentView];

          if (v13 == v4) {
            [(SXComponentBehaviorController *)self updateHandler:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)updateHandler:(id)a3
{
  id v4 = a3;
  if (([v4 isSetup] & 1) == 0) {
    [v4 setupWithBehaviorController:self];
  }
  [v4 updateWithBehaviorController:self];
}

- (void)reset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(SXComponentBehaviorController *)self viewport];
  int v4 = [v3 isPopulated];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(SXComponentBehaviorController *)self behaviorHandlers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v10 isSetup]) {
            [v10 destroyWithBehaviorController:self];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
}

- (UIDynamicAnimator)animator
{
  return self->_animator;
}

- (NSMutableSet)behaviorHandlers
{
  return self->_behaviorHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorHandlers, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end