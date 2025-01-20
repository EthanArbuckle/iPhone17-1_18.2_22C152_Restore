@interface SBPinchInteractionProgress
- (SBPinchInteractionProgress)initWithPinchGesture:(id)a3 minPinchScale:(double)a4;
- (UIPinchGestureRecognizer)pinchGesture;
- (double)minPinchScale;
- (void)_handlePinchGesture:(id)a3;
- (void)_updatePinchScale:(double)a3;
@end

@implementation SBPinchInteractionProgress

- (SBPinchInteractionProgress)initWithPinchGesture:(id)a3 minPinchScale:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPinchInteractionProgress;
  v8 = [(UIInteractionProgress *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pinchGesture, a3);
    [v7 addTarget:v9 action:sel__handlePinchGesture_];
    v9->_pinchInterval.start.value = 1.0;
    v9->_pinchInterval.start.inclusive = 1;
    *(_DWORD *)(&v9->_pinchInterval.start.inclusive + 1) = 0;
    *((_DWORD *)&v9->_pinchInterval.start.inclusive + 1) = 0;
    v9->_pinchInterval.end.value = a4;
    v9->_pinchInterval.end.inclusive = 1;
    *(_DWORD *)(&v9->_pinchInterval.end.inclusive + 1) = 0;
    *((_DWORD *)&v9->_pinchInterval.end.inclusive + 1) = 0;
    [v7 scale];
    -[SBPinchInteractionProgress _updatePinchScale:](v9, "_updatePinchScale:");
  }

  return v9;
}

- (double)minPinchScale
{
  return self->_pinchInterval.end.value;
}

- (void)_handlePinchGesture:(id)a3
{
  id v10 = a3;
  id v4 = [(SBPinchInteractionProgress *)self pinchGesture];

  v5 = v10;
  if (v4 == v10)
  {
    uint64_t v6 = [v10 state];
    if (v6 == 4)
    {
      [v10 removeTarget:self action:sel__handlePinchGesture_];
    }
    else
    {
      if (v6 != 3)
      {
        BOOL v7 = v6 == 2;
        v5 = v10;
        if (!v7) {
          goto LABEL_13;
        }
        [v10 scale];
        -[SBPinchInteractionProgress _updatePinchScale:](self, "_updatePinchScale:");
LABEL_12:
        v5 = v10;
        goto LABEL_13;
      }
      [v10 velocity];
      [v10 removeTarget:self action:sel__handlePinchGesture_];
      if (!BSFloatGreaterThanFloat())
      {
        v8 = self;
        uint64_t v9 = 1;
        goto LABEL_11;
      }
    }
    v8 = self;
    uint64_t v9 = 0;
LABEL_11:
    [(UIInteractionProgress *)v8 endInteraction:v9];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_updatePinchScale:(double)a3
{
  [(SBPinchInteractionProgress *)self minPinchScale];
  if (BSFloatGreaterThanFloat())
  {
    $DCA72CBAB2CDF67DA9370D0153CCCF3D start = self->_pinchInterval.start;
    $DCA72CBAB2CDF67DA9370D0153CCCF3D end = self->_pinchInterval.end;
    BSIntervalFractionForValue();
    double v5 = v4;
    [(UIInteractionProgress *)self percentComplete];
    if ((BSFloatEqualToFloat() & 1) == 0) {
      [(UIInteractionProgress *)self setPercentComplete:v5];
    }
  }
  else
  {
    uint64_t v6 = [(SBPinchInteractionProgress *)self pinchGesture];
    [v6 removeTarget:self action:sel__handlePinchGesture_];

    [(UIInteractionProgress *)self endInteraction:1];
  }
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (void).cxx_destruct
{
}

@end