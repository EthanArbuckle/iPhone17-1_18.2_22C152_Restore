@interface BKPanGestureRecognizer
- (BKPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (CGPoint)lastLocation;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)startLocationInView:(id)a3;
- (UITouch)trackingTouch;
- (double)leftSideMovementThreshold;
- (double)rightSideMovementThreshold;
- (void)cancelRecognizing;
- (void)dealloc;
- (void)reset;
- (void)setLastLocation:(CGPoint)a3;
- (void)setLeftSideMovementThreshold:(double)a3;
- (void)setRightSideMovementThreshold:(double)a3;
- (void)setTrackingTouch:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation BKPanGestureRecognizer

- (void)dealloc
{
  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKPanGestureRecognizer;
  [(BKPanGestureRecognizer *)&v4 dealloc];
}

- (BKPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKPanGestureRecognizer;
  result = [(BKPanGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_rightSideMovementThreshold = 20.0;
    result->_leftSideMovementThreshold = 20.0;
  }
  return result;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)BKPanGestureRecognizer;
  [(BKPanGestureRecognizer *)&v5 reset];
  [(BKPanGestureRecognizer *)self setTrackingTouch:0];
  v3 = _AEPanGRLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reseting pan gesture", v4, 2u);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AEPanGRLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "touches began event", buf, 2u);
  }

  if (![(BKPanGestureRecognizer *)self state]) {
    [(BKPanGestureRecognizer *)self setTrackingTouch:0];
  }
  v9 = [(BKPanGestureRecognizer *)self trackingTouch];

  if (v9)
  {
    v10 = _AEPanGRLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "tracking touch -- ignoring new touches", buf, 2u);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v23 = v6;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = [v16 window];
          [v16 locationInView:0];
          [v17 convertPoint:0 toWindow:];
          double v19 = v18;
          double v21 = v20;

          v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, v21);
          objc_setAssociatedObject(v16, &unk_18F0B8, v22, (char *)&dword_0 + 1);
        }
        id v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }

    v24.receiver = self;
    v24.super_class = (Class)BKPanGestureRecognizer;
    [(BKPanGestureRecognizer *)&v24 touchesBegan:v11 withEvent:v7];
    id v6 = v23;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BKPanGestureRecognizer *)self trackingTouch];

  if (v8) {
    goto LABEL_2;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (!v15)
  {

LABEL_2:
    id v9 = v6;
    goto LABEL_3;
  }
  id v16 = v15;
  id v59 = v7;
  id v60 = v6;
  id v11 = 0;
  uint64_t v17 = *(void *)v65;
  double v18 = 0.0;
  id v61 = v14;
  v62 = self;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v65 != v17) {
        objc_enumerationMutation(v14);
      }
      double v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      double v21 = objc_getAssociatedObject(v20, &unk_18F0B8);
      v22 = v21;
      if (v21)
      {
        [v21 CGPointValue];
        double v24 = v23;
        double v26 = v25;
        long long v27 = [v20 window];
        [v20 locationInView:0];
        [v27 convertPoint:0 fromWindow:];
        double v29 = v28;
        double v31 = v30;

        double v32 = vabdd_f64(v29, v24);
        v33 = [v20 window];
        [v33 bounds];
        double Width = CGRectGetWidth(v77);

        v35 = [v20 view];
        [v20 locationInView:v35];
        double v37 = v36;

        v38 = &OBJC_IVAR___BKPanGestureRecognizer__rightSideMovementThreshold;
        if (v37 < Width * 0.5) {
          v38 = &OBJC_IVAR___BKPanGestureRecognizer__leftSideMovementThreshold;
        }
        double v39 = *(double *)((char *)&self->super.super.super.isa + *v38);
        if (v32 <= v39)
        {
          double v32 = vabdd_f64(v31, v26);
          if (v32 <= v39) {
            goto LABEL_25;
          }
          v45 = _AEPanGRLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            double v69 = v32;
            __int16 v70 = 2048;
            double v71 = v39;
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "enough movement in a touch %f > %f", buf, 0x16u);
          }

          v41 = _AEPanGRLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v75.x = v24;
            v75.y = v26;
            v46 = NSStringFromCGPoint(v75);
            v76.x = v29;
            v76.y = v31;
            NSStringFromCGPoint(v76);
            v48 = v47 = v11;
            *(_DWORD *)buf = 138412546;
            double v69 = *(double *)&v46;
            __int16 v70 = 2112;
            double v71 = *(double *)&v48;
            _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "start %@ moved %@", buf, 0x16u);

            id v11 = v47;
            id v14 = v61;

            self = v62;
          }
        }
        else
        {
          v40 = _AEPanGRLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            double v69 = v32;
            __int16 v70 = 2048;
            double v71 = v39;
            _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "enough movement in a touch %f > %f", buf, 0x16u);
          }

          v41 = _AEPanGRLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v73.x = v24;
            v73.y = v26;
            NSStringFromCGPoint(v73);
            v43 = v42 = v11;
            v74.x = v29;
            v74.y = v31;
            v44 = NSStringFromCGPoint(v74);
            *(_DWORD *)buf = 138412546;
            double v69 = *(double *)&v43;
            __int16 v70 = 2112;
            double v71 = *(double *)&v44;
            _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "start %@ moved %@", buf, 0x16u);

            self = v62;
            id v11 = v42;
            id v14 = v61;
          }
        }

        if (v32 > v18)
        {
          id v49 = v20;

          double v18 = v32;
          id v11 = v49;
        }
      }
LABEL_25:
    }
    id v16 = [v14 countByEnumeratingWithState:&v64 objects:v72 count:16];
  }
  while (v16);

  id v50 = v14;
  id v6 = v60;
  if (!v11)
  {
LABEL_3:
    v10 = [(BKPanGestureRecognizer *)self trackingTouch];

    id v11 = 0;
    id v12 = 0;
    id v13 = v6;
    if (v10) {
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  v51 = v50;
  v52 = [(BKPanGestureRecognizer *)self trackingTouch];

  if (!v52)
  {
    v53 = _AEPanGRLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v69 = *(double *)&v11;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "Now tracking touch %@", buf, 0xCu);
    }

    [(BKPanGestureRecognizer *)self setTrackingTouch:v11];
  }
  -[BKPanGestureRecognizer setState:](self, "setState:", 1, v7, v60);
  id v13 = +[NSSet setWithObject:v11];

  v54 = [v7 allTouches];
  id v55 = [v54 mutableCopy];

  [v55 removeObject:v11];
  if ([v55 count])
  {
    v56 = _AEPanGRLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v69 = *(double *)&v55;
      __int16 v70 = 2112;
      double v71 = *(double *)&v11;
      _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Ending touches %@. Tracking %@", buf, 0x16u);
    }

    [(BKPanGestureRecognizer *)self touchesEnded:v55 withEvent:v7];
  }

LABEL_37:
  v63.receiver = self;
  v63.super_class = (Class)BKPanGestureRecognizer;
  [(BKPanGestureRecognizer *)&v63 touchesMoved:v13 withEvent:v7];
  id v12 = v11;
LABEL_38:
  v57 = [(BKPanGestureRecognizer *)self trackingTouch];
  if (v57)
  {
  }
  else if ((uint64_t)[(BKPanGestureRecognizer *)self state] >= 1)
  {
    [(BKPanGestureRecognizer *)self setTrackingTouch:v12];
  }
  v58 = [(BKPanGestureRecognizer *)self trackingTouch];

  if (v58 && [(BKPanGestureRecognizer *)self numberOfTouches])
  {
    [(BKPanGestureRecognizer *)self locationOfTouch:0 inView:0];
    -[BKPanGestureRecognizer setLastLocation:](self, "setLastLocation:");
  }
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  [(BKPanGestureRecognizer *)self lastLocation];
  [v4 convertPoint:0 fromView:];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)startLocationInView:(id)a3
{
  id v4 = a3;
  double v5 = [(BKPanGestureRecognizer *)self trackingTouch];
  double v6 = objc_getAssociatedObject(v5, &unk_18F0B8);

  [v6 CGPointValue];
  [v4 convertPoint:0 fromView:];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)cancelRecognizing
{
}

- (double)leftSideMovementThreshold
{
  return self->_leftSideMovementThreshold;
}

- (void)setLeftSideMovementThreshold:(double)a3
{
  self->_leftSideMovementThreshold = a3;
}

- (double)rightSideMovementThreshold
{
  return self->_rightSideMovementThreshold;
}

- (void)setRightSideMovementThreshold:(double)a3
{
  self->_rightSideMovementThreshold = a3;
}

- (UITouch)trackingTouch
{
  return self->_trackingTouch;
}

- (void)setTrackingTouch:(id)a3
{
}

- (CGPoint)lastLocation
{
  double x = self->lastLocation.x;
  double y = self->lastLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->lastLocation = a3;
}

- (void).cxx_destruct
{
}

@end