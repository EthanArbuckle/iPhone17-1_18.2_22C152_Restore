@interface CRLCanvasRepEnterExitNotifier
- (CRLCanvasRepEnterExitNotifier)initWithInteractiveCanvasController:(id)a3;
- (void)cursorEnteredAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)cursorExitedAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)p_updateEnteredKnobsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)p_updateEnteredRepsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
- (void)updateEnteredExitedRepStateAtPoint:(CGPoint)a3 withPlatformObject:(id)a4;
@end

@implementation CRLCanvasRepEnterExitNotifier

- (CRLCanvasRepEnterExitNotifier)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasRepEnterExitNotifier;
  v5 = [(CRLCanvasRepEnterExitNotifier *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentlyHitReps = v6->_currentlyHitReps;
    v6->_currentlyHitReps = v7;
  }
  return v6;
}

- (void)cursorEnteredAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredKnobsAtPoint:withPlatformObject:](self, "p_updateEnteredKnobsAtPoint:withPlatformObject:", v7, x, y);
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredRepsAtPoint:withPlatformObject:](self, "p_updateEnteredRepsAtPoint:withPlatformObject:", v7, x, y);
}

- (void)updateEnteredExitedRepStateAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredKnobsAtPoint:withPlatformObject:](self, "p_updateEnteredKnobsAtPoint:withPlatformObject:", v7, x, y);
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredRepsAtPoint:withPlatformObject:](self, "p_updateEnteredRepsAtPoint:withPlatformObject:", v7, x, y);
}

- (void)cursorExitedAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->_currentlyExiting = 1;
  -[CRLCanvasKnob cursorExitedKnobAtPoint:withPlatformObject:](self->_overKnob, "cursorExitedKnobAtPoint:withPlatformObject:", v7, x, y);
  overKnob = self->_overKnob;
  self->_overKnob = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_currentlyHitReps;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) cursorExitedAtPoint:v7 withPlatformObject:x, y, (void)v14];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(NSMutableSet *)self->_currentlyHitReps removeAllObjects];
  self->_currentlyExiting = 0;
}

- (void)p_updateEnteredKnobsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_currentlyExiting)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    id v14 = 0;
    [WeakRetained hitKnobAtPoint:0 inputType:&v14 returningRep:x, y];
    v9 = (CRLCanvasKnob *)objc_claimAutoreleasedReturnValue();
    id v10 = v14;

    overKnob = self->_overKnob;
    p_overKnob = &self->_overKnob;
    id v11 = overKnob;
    if (v9 == overKnob)
    {
      -[CRLCanvasKnob cursorMovedAtPoint:withPlatformObject:](v9, "cursorMovedAtPoint:withPlatformObject:", v7, x, y);
      goto LABEL_10;
    }
    if (v9 && v11)
    {
      if (-[CRLCanvasKnob transferCursorInsideStateIfDesiredFromKnob:](v9, "transferCursorInsideStateIfDesiredFromKnob:"))
      {
LABEL_8:
        objc_storeStrong((id *)p_overKnob, v9);
LABEL_10:

        goto LABEL_11;
      }
      id v11 = *p_overKnob;
    }
    -[CRLCanvasKnob cursorExitedKnobAtPoint:withPlatformObject:](v11, "cursorExitedKnobAtPoint:withPlatformObject:", v7, x, y);
    -[CRLCanvasKnob cursorEnteredKnobAtPoint:withPlatformObject:](v9, "cursorEnteredKnobAtPoint:withPlatformObject:", v7, x, y);
    goto LABEL_8;
  }
LABEL_11:
}

- (void)p_updateEnteredRepsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_currentlyExiting)
  {
    v8 = self->_currentlyHitReps;
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentlyHitReps = self->_currentlyHitReps;
    self->_currentlyHitReps = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    uint64_t v12 = [WeakRetained hitRep:1 withPrecision:x, y];

    id v13 = v12;
    id v14 = v13;
    if (v13)
    {
      long long v15 = v13;
      do
      {
        [(NSMutableSet *)self->_currentlyHitReps addObject:v15];
        uint64_t v16 = [v15 parentRep];

        long long v15 = (void *)v16;
      }
      while (v16);
    }
    id v17 = [(NSMutableSet *)v8 mutableCopy];
    [v17 minusSet:self->_currentlyHitReps];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v44;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * (void)v22) cursorExitedAtPoint:v7 withPlatformObject:x, y];
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v20);
    }

    id v23 = [(NSMutableSet *)self->_currentlyHitReps mutableCopy];
    [v23 minusSet:v8];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        v28 = 0;
        do
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * (void)v28) cursorEnteredAtPoint:v7 withPlatformObject:x, y];
          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v26);
    }

    if (v14)
    {
      if ([(NSMutableSet *)v8 containsObject:v14]) {
        [v14 cursorMovedAtPoint:v7 withPlatformObject:x, y];
      }
      id v29 = [(NSMutableSet *)self->_currentlyHitReps mutableCopy];
      [v29 removeObject:v14];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v30 = v29;
      id v31 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v36;
        do
        {
          v34 = 0;
          do
          {
            if (*(void *)v36 != v33) {
              objc_enumerationMutation(v30);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * (void)v34) cursorMovedAtPoint:v7 withPlatformObject:x, y, v35];
            v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          id v32 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
        }
        while (v32);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overKnob, 0);
  objc_storeStrong((id *)&self->_currentlyHitReps, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end