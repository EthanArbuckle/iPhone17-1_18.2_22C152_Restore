@interface TUIVisibleBoundsObserver
+ (id)newHorizontalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5;
+ (id)newVerticalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5;
- (BOOL)lowerLoadTriggered;
- (BOOL)lowerUnloadTriggered;
- (BOOL)upperLoadTriggered;
- (BOOL)upperUnloadTriggered;
- (TUIDynamicArrayWindowing)window;
- (TUIVisibleBoundsObserver)initWithAxis:(unint64_t)a3 window:(id)a4 layout:(id)a5 offset:(double)a6;
- (double)lowerLoadPosition;
- (double)lowerUnloadPosition;
- (double)upperLoadPosition;
- (double)upperUnloadPosition;
- (void)_updateVisibleMin:(double)a3 max:(double)a4;
- (void)visibleBoundsUpdated:(CGRect)a3;
@end

@implementation TUIVisibleBoundsObserver

+ (id)newHorizontalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAxis:1 window:v9 layout:v8 offset:a5];

  return v10;
}

+ (id)newVerticalWithWindow:(id)a3 layout:(id)a4 offset:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAxis:2 window:v9 layout:v8 offset:a5];

  return v10;
}

- (TUIVisibleBoundsObserver)initWithAxis:(unint64_t)a3 window:(id)a4 layout:(id)a5 offset:(double)a6
{
  id v11 = a4;
  id v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)TUIVisibleBoundsObserver;
  v13 = [(TUIVisibleBoundsObserver *)&v51 init];
  if (v13)
  {
    v14 = (char *)[v12 computedLayoutDirection];
    objc_storeStrong((id *)&v13->_window, a4);
    v13->_axis = a3;
    v15 = [v12 controller];
    objc_storeWeak((id *)&v13->_controller, v15);

    BOOL v16 = a3 == 1;
    v45 = v14;
    if (v14 != (unsigned char *)&def_141F14 + 2) {
      BOOL v16 = 0;
    }
    v13->_flipped = v16;
    id v17 = objc_storeWeak((id *)&v13->_generationHost, v12);
    v13->_generation = (unint64_t)[v12 visibleBoundsGeneration];
    id v47 = v12;

    uint64_t v18 = [v11 windowLowerLoadTriggerChildBoxFlipped:v13->_flipped];
    uint64_t v19 = [v11 windowUpperLoadTriggerChildBoxFlipped:v13->_flipped];
    v20 = [v11 windowLowerUnloadTriggerChildBoxFlipped:v13->_flipped];
    id v48 = v11;
    uint64_t v21 = [v11 windowUpperUnloadTriggerChildBoxFlipped:v13->_flipped];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_controller);
    v46 = (void *)v18;
    v49 = [WeakRetained layoutForModel:v18];

    id v23 = objc_loadWeakRetained((id *)&v13->_controller);
    v24 = (void *)v19;
    v50 = [v23 layoutForModel:v19];

    id v25 = objc_loadWeakRetained((id *)&v13->_controller);
    v26 = [v25 layoutForModel:v20];

    id v27 = objc_loadWeakRetained((id *)&v13->_controller);
    v28 = (void *)v21;
    v29 = [v27 layoutForModel:v21];

    if (a3 == 1)
    {
      if (v45 == (unsigned char *)&def_141F14 + 1)
      {
        v30 = v49;
        if (v49)
        {
          [v49 computedFrame];
          double v31 = CGRectGetMinX(v52) + a6;
        }
        else
        {
          double v31 = NAN;
        }
        id v12 = v47;
        v13->_position.lowerLoad = v31;
        if (v26)
        {
          [v26 computedFrame];
          double v36 = CGRectGetMaxX(v55) + a6;
        }
        else
        {
          double v36 = NAN;
        }
        v33 = v46;
        id v11 = v48;
        v13->_position.lowerUnload = v36;
        if (v50)
        {
          [v50 computedFrame];
          double v38 = CGRectGetMaxX(v57) + a6;
        }
        else
        {
          double v38 = NAN;
        }
        v13->_position.upperLoad = v38;
        if (v29)
        {
          [v29 computedFrame];
          double MinX = CGRectGetMinX(v59);
LABEL_42:
          double v43 = MinX + a6;
LABEL_44:
          v13->_position.upperUnload = v43;
          goto LABEL_45;
        }
      }
      else
      {
        id v11 = v48;
        v30 = v49;
        v33 = v46;
        id v12 = v47;
        if (v45 != (unsigned char *)&def_141F14 + 2)
        {
LABEL_45:
          *(unsigned char *)&v13->_triggered &= 0xF0u;

          goto LABEL_46;
        }
        if (v49)
        {
          [v49 computedFrame];
          double v35 = CGRectGetMaxX(v54) + a6;
        }
        else
        {
          double v35 = NAN;
        }
        v13->_position.lowerLoad = v35;
        if (v26)
        {
          [v26 computedFrame];
          double v41 = CGRectGetMinX(v61) + a6;
        }
        else
        {
          double v41 = NAN;
        }
        v13->_position.lowerUnload = v41;
        if (v50)
        {
          [v50 computedFrame];
          double v42 = CGRectGetMinX(v62) + a6;
        }
        else
        {
          double v42 = NAN;
        }
        v13->_position.upperLoad = v42;
        if (v29)
        {
          [v29 computedFrame];
          double MinX = CGRectGetMaxX(v63);
          goto LABEL_42;
        }
      }
    }
    else
    {
      BOOL v32 = a3 == 2;
      id v11 = v48;
      v30 = v49;
      v33 = v46;
      id v12 = v47;
      if (!v32) {
        goto LABEL_45;
      }
      if (v49)
      {
        [v49 computedFrame];
        double v34 = CGRectGetMinY(v53) + a6;
      }
      else
      {
        double v34 = NAN;
      }
      v13->_position.lowerLoad = v34;
      if (v26)
      {
        [v26 computedFrame];
        double v37 = CGRectGetMaxY(v56) + a6;
      }
      else
      {
        double v37 = NAN;
      }
      v13->_position.lowerUnload = v37;
      if (v50)
      {
        [v50 computedFrame];
        double v39 = CGRectGetMaxY(v58) + a6;
      }
      else
      {
        double v39 = NAN;
      }
      v13->_position.upperLoad = v39;
      if (v29)
      {
        [v29 computedFrame];
        double MinX = CGRectGetMinY(v60);
        goto LABEL_42;
      }
    }
    double v43 = NAN;
    goto LABEL_44;
  }
LABEL_46:

  return v13;
}

- (void)visibleBoundsUpdated:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t axis = self->_axis;
  if (axis == 2)
  {
    double MinY = CGRectGetMinY(a3);
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v13);
  }
  else
  {
    if (axis != 1) {
      return;
    }
    double MinY = CGRectGetMinX(a3);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    double MaxY = CGRectGetMaxX(v12);
  }

  [(TUIVisibleBoundsObserver *)self _updateVisibleMin:MinY max:MaxY];
}

- (void)_updateVisibleMin:(double)a3 max:(double)a4
{
  double lowerLoad = self->_position.lowerLoad;
  if (self->_flipped)
  {
    BOOL v6 = lowerLoad <= a4 && (*(unsigned char *)&self->_triggered & 1) == 0;
    BOOL v7 = self->_position.lowerUnload >= a4 && (*(unsigned char *)&self->_triggered & 2) == 0;
    BOOL v8 = self->_position.upperLoad >= a3 && (*(unsigned char *)&self->_triggered & 4) == 0;
    if (self->_position.upperUnload > a3)
    {
LABEL_15:
      BOOL v9 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    BOOL v6 = lowerLoad >= a3 && (*(unsigned char *)&self->_triggered & 1) == 0;
    BOOL v7 = self->_position.lowerUnload <= a3 && (*(unsigned char *)&self->_triggered & 2) == 0;
    BOOL v8 = self->_position.upperLoad <= a4 && (*(unsigned char *)&self->_triggered & 4) == 0;
    if (self->_position.upperUnload < a4) {
      goto LABEL_15;
    }
  }
  BOOL v9 = (*(unsigned char *)&self->_triggered & 8) == 0;
LABEL_24:
  char triggered = (char)self->_triggered;
  char v11 = triggered & 2;
  if (v7) {
    char v11 = 2;
  }
  char v12 = triggered & 0xF1;
  char v13 = triggered & 4;
  if (v8) {
    char v13 = 4;
  }
  char v14 = triggered & 8;
  if (v9) {
    char v14 = 8;
  }
  *(unsigned char *)&self->_char triggered = v12 | v13 | v11 | v14 | v6;
  if (v9 || v6 || v7 || v8)
  {
    id v15 = +[TUITransaction noAnimationTransaction];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v17 = [WeakRetained transactionCoordinator];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_72AD0;
    v18[3] = &unk_253420;
    v18[4] = self;
    BOOL v19 = v6;
    BOOL v20 = v7;
    BOOL v21 = v8;
    BOOL v22 = v9;
    [v17 scheduleLayoutUpdateWithTransaction:v15 block:v18];

    [v15 commit];
  }
}

- (double)lowerLoadPosition
{
  return self->_position.lowerLoad;
}

- (double)lowerUnloadPosition
{
  return self->_position.lowerUnload;
}

- (double)upperLoadPosition
{
  return self->_position.upperLoad;
}

- (double)upperUnloadPosition
{
  return self->_position.upperUnload;
}

- (BOOL)lowerLoadTriggered
{
  return *(unsigned char *)&self->_triggered & 1;
}

- (BOOL)lowerUnloadTriggered
{
  return (*(unsigned char *)&self->_triggered >> 1) & 1;
}

- (BOOL)upperLoadTriggered
{
  return (*(unsigned char *)&self->_triggered >> 2) & 1;
}

- (BOOL)upperUnloadTriggered
{
  return (*(unsigned char *)&self->_triggered >> 3) & 1;
}

- (TUIDynamicArrayWindowing)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_generationHost);

  objc_destroyWeak((id *)&self->_controller);
}

@end