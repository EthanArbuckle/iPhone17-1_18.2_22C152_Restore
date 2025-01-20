@interface SBUIDependencyGestureRecognizer
- (BOOL)_didExceedHysteresisWithTouches:(id)a3;
- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (NSSet)observedControlClasses;
- (SBUIDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)hysteresis;
- (void)setHysteresis:(double)a3;
- (void)setObservedControlClasses:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBUIDependencyGestureRecognizer

- (NSSet)observedControlClasses
{
  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    v4 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v5 = self->_observedControlClasses;
    self->_observedControlClasses = v4;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (void)setObservedControlClasses:(id)a3
{
  id v5 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_observedControlClasses, a3);
    if ([(SBUIDependencyGestureRecognizer *)self isEnabled])
    {
      [(SBUIDependencyGestureRecognizer *)self setEnabled:0];
      [(SBUIDependencyGestureRecognizer *)self setEnabled:1];
    }
  }
}

- (SBUIDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIDependencyGestureRecognizer;
  v4 = [(SBUIDependencyGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  id v5 = v4;
  if (v4)
  {
    [(SBUIDependencyGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(SBUIDependencyGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    v5->_hysteresis = 9.0;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBUIDependencyGestureRecognizer;
  id v6 = a3;
  [(SBUIDependencyGestureRecognizer *)&v10 touchesBegan:v6 withEvent:a4];
  double v7 = _CentroidOfTouches(v6);
  CGFloat v9 = v8;

  self->_initialSceneReferenceLocation.x = v7;
  self->_initialSceneReferenceLocation.y = v9;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SBUIDependencyGestureRecognizer;
  [(SBUIDependencyGestureRecognizer *)&v34 touchesMoved:v6 withEvent:v7];
  if (![(SBUIDependencyGestureRecognizer *)self state]
    && [(SBUIDependencyGestureRecognizer *)self _didExceedHysteresisWithTouches:v6])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v24 = *(void *)v31;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v25 = v10;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v30 + 1) + 8 * v12) view];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v13, "sbui_wantsPriorityOverTargetOfDependencyGestureRecognizer:", self) & 1) != 0)
          {
LABEL_27:

            uint64_t v23 = 3;
            goto LABEL_29;
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v14 = [(SBUIDependencyGestureRecognizer *)self observedControlClasses];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v27;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(v14);
                }
                if (objc_opt_isKindOfClass())
                {

                  goto LABEL_27;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v19 = objc_opt_class();
          id v20 = v13;
          if (v19)
          {
            if (objc_opt_isKindOfClass()) {
              v21 = v20;
            }
            else {
              v21 = 0;
            }
          }
          else
          {
            v21 = 0;
          }
          uint64_t v11 = v24;
          id v22 = v21;

          [v22 cancelTrackingWithEvent:v7];
          ++v12;
        }
        while (v12 != v25);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
        uint64_t v23 = 5;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v23 = 5;
    }
LABEL_29:

    [(SBUIDependencyGestureRecognizer *)self setState:v23];
  }
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(SBUIDependencyGestureRecognizer *)self view];
    id v9 = [v10 window];
  }
  uint64_t v11 = [v9 _window];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v13;
    double y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (BOOL)_didExceedHysteresisWithTouches:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUIDependencyGestureRecognizer *)self view];
  -[SBUIDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, self->_initialSceneReferenceLocation.x, self->_initialSceneReferenceLocation.y);
  double v7 = v6;
  double v9 = v8;
  double v10 = _CentroidOfTouches(v4);
  double v12 = v11;

  -[SBUIDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, v10, v12);
  double v14 = v13 - v7;
  double v16 = v15 - v9;
  if (v14 < 0.0) {
    double v14 = -v14;
  }
  double hysteresis = self->_hysteresis;
  BOOL v18 = v14 > hysteresis;
  double v19 = -v16;
  if (v16 >= 0.0) {
    double v19 = v16;
  }
  BOOL v20 = v19 > hysteresis || v18;

  return v20;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_double hysteresis = a3;
}

- (void).cxx_destruct
{
}

@end