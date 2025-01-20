@interface VLFScanningAnimationManager
- (CALayer)layer;
- (CAMediaTimingFunction)timingFunction;
- (VLFScanningAnimationManager)initWithLayer:(id)a3;
- (VLFScanningAnimationManager)initWithLayer:(id)a3 animationDuration:(double)a4 timingFunction:(id)a5;
- (double)animationDuration;
- (id)fadeOutCompletion;
- (id)opacityAnimationWithToValue:(double)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)fadeWithFadeOutCompletion:(id)a3;
- (void)replaceOnGoingFadeOutCompletion:(id)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setFadeOutCompletion:(id)a3;
- (void)setLayer:(id)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation VLFScanningAnimationManager

- (VLFScanningAnimationManager)initWithLayer:(id)a3
{
  id v4 = a3;
  LODWORD(v5) = 1051260355;
  LODWORD(v6) = 1059816735;
  LODWORD(v7) = 1.0;
  v8 = +[CAMediaTimingFunction functionWithControlPoints:v5 :0.0 :v6 :v7];
  v9 = [(VLFScanningAnimationManager *)self initWithLayer:v4 animationDuration:v8 timingFunction:0.35];

  return v9;
}

- (VLFScanningAnimationManager)initWithLayer:(id)a3 animationDuration:(double)a4 timingFunction:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:]";
      __int16 v23 = 2080;
      v24 = "VLFScanningAnimationManager.m";
      __int16 v25 = 1024;
      int v26 = 45;
      __int16 v27 = 2080;
      v28 = "layer != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v10)
  {
    v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:]";
      __int16 v23 = 2080;
      v24 = "VLFScanningAnimationManager.m";
      __int16 v25 = 1024;
      int v26 = 46;
      __int16 v27 = 2080;
      v28 = "timingFunction != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)VLFScanningAnimationManager;
  v11 = [(VLFScanningAnimationManager *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layer, a3);
    v12->_animationDuration = a4;
    objc_storeStrong((id *)&v12->_timingFunction, a5);
  }

  return v12;
}

- (void)fadeWithFadeOutCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = sub_1004B8C0C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Begin a new fade", (uint8_t *)&v21, 2u);
    }

    double v6 = [(VLFScanningAnimationManager *)self layer];
    double v7 = [v6 animationForKey:@"fadeIn"];

    if (v7)
    {
      v8 = sub_1004B8C0C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "There is an on-going fade in animation; removing it first",
          (uint8_t *)&v21,
          2u);
      }

      id v9 = [(VLFScanningAnimationManager *)self layer];
      [v9 removeAnimationForKey:@"fadeIn"];
    }
    [(VLFScanningAnimationManager *)self setFadeOutCompletion:v4];
    id v10 = [(VLFScanningAnimationManager *)self layer];
    v11 = [v10 animationForKey:@"fadeOut"];

    v12 = sub_1004B8C0C();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v21) = 0;
        v14 = "There is an on-going fade out animation; letting it finish with the new completion block";
        v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      if (v13)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Starting a new fade out animation", (uint8_t *)&v21, 2u);
      }

      v12 = [(VLFScanningAnimationManager *)self layer];
      v17 = [(VLFScanningAnimationManager *)self opacityAnimationWithToValue:0.0];
      [v12 addAnimation:v17 forKey:@"fadeOut"];
    }
  }
  else
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      v22 = "-[VLFScanningAnimationManager fadeWithFadeOutCompletion:]";
      __int16 v23 = 2080;
      v24 = "VLFScanningAnimationManager.m";
      __int16 v25 = 1024;
      int v26 = 63;
      __int16 v27 = 2080;
      v28 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_super v20 = +[NSThread callStackSymbols];
        int v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
      }
    }
    v12 = sub_1004B8C0C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      v14 = "Completion block cannot be nil";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
  }
}

- (void)replaceOnGoingFadeOutCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    double v5 = [(VLFScanningAnimationManager *)self layer];
    double v6 = [v5 animationForKey:@"fadeOut"];

    double v7 = sub_1004B8C0C();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Replacing existing fade out completion block", (uint8_t *)&v13, 2u);
      }

      [(VLFScanningAnimationManager *)self setFadeOutCompletion:v4];
    }
    else
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "There is no on-going fade out animation; executing completion block immediately",
          (uint8_t *)&v13,
          2u);
      }

      v4[2](v4);
    }
  }
  else
  {
    id v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      v14 = "-[VLFScanningAnimationManager replaceOnGoingFadeOutCompletion:]";
      __int16 v15 = 2080;
      os_log_type_t v16 = "VLFScanningAnimationManager.m";
      __int16 v17 = 1024;
      int v18 = 88;
      __int16 v19 = 2080;
      objc_super v20 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
    v12 = sub_1004B8C0C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Completion block cannot be nil", (uint8_t *)&v13, 2u);
    }
  }
}

- (id)opacityAnimationWithToValue:(double)a3
{
  double v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v5 setDelegate:self];
  double v6 = [(VLFScanningAnimationManager *)self layer];
  double v7 = [v6 presentationLayer];

  BOOL v8 = [(VLFScanningAnimationManager *)self layer];
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 presentationLayer];
    [v10 opacity];
    float v12 = v11;
  }
  else
  {
    [v8 opacity];
    float v12 = v13;
  }

  double v14 = v12;
  __int16 v15 = sub_1004B8C0C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int16 v27 = 134218240;
    *(double *)&v27[4] = v14;
    *(_WORD *)&v27[12] = 2048;
    *(double *)&v27[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Creating new opacity animation from: %f, to: %f", v27, 0x16u);
  }

  os_log_type_t v16 = +[NSNumber numberWithDouble:v14];
  [v5 setFromValue:v16];

  __int16 v17 = +[NSNumber numberWithDouble:a3];
  [v5 setToValue:v17];

  int v18 = +[NSUserDefaults standardUserDefaults];
  unsigned int v19 = [v18 BOOLForKey:@"VLFSessionScanningAnimationSlowDownKey"];

  if (v19)
  {
    objc_super v20 = sub_1004B8C0C();
    double v21 = 5.0;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    *(_DWORD *)__int16 v27 = 134217984;
    *(void *)&v27[4] = 0x4014000000000000;
    v22 = "Using slow animation duration: %f";
  }
  else
  {
    [(VLFScanningAnimationManager *)self animationDuration];
    double v21 = v23;
    objc_super v20 = sub_1004B8C0C();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    *(_DWORD *)__int16 v27 = 134217984;
    *(double *)&v27[4] = v21;
    v22 = "Using normal animation duration: %f";
  }
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v22, v27, 0xCu);
LABEL_12:

  double v24 = v14 - a3;
  if (v14 - a3 < 0.0) {
    double v24 = -(v14 - a3);
  }
  objc_msgSend(v5, "setDuration:", v24 * v21, *(_OWORD *)v27);
  [v5 setRemovedOnCompletion:0];
  [v5 setFillMode:kCAFillModeForwards];
  __int16 v25 = [(VLFScanningAnimationManager *)self timingFunction];
  [v5 setTimingFunction:v25];

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(VLFScanningAnimationManager *)self layer];
  id v8 = [v7 animationForKey:@"fadeOut"];

  id v9 = sub_1004B8C0C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8 == v6)
  {
    if (v10)
    {
      double v14 = @"NO";
      if (v4) {
        double v14 = @"YES";
      }
      __int16 v15 = v14;
      int v20 = 138412290;
      double v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fade out animation finished: %@", (uint8_t *)&v20, 0xCu);
    }
    os_log_type_t v16 = [(VLFScanningAnimationManager *)self layer];
    [v16 removeAnimationForKey:@"fadeOut"];

    float v13 = [(VLFScanningAnimationManager *)self fadeOutCompletion];
    [(VLFScanningAnimationManager *)self setFadeOutCompletion:0];
    v13[2](v13);
    if (v4)
    {
      __int16 v17 = sub_1004B8C0C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Starting a new fade in animation", (uint8_t *)&v20, 2u);
      }

      int v18 = [(VLFScanningAnimationManager *)self layer];
      unsigned int v19 = [(VLFScanningAnimationManager *)self opacityAnimationWithToValue:1.0];
      [v18 addAnimation:v19 forKey:@"fadeIn"];
    }
  }
  else
  {
    if (v10)
    {
      float v11 = @"NO";
      if (v4) {
        float v11 = @"YES";
      }
      float v12 = v11;
      int v20 = 138412290;
      double v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fade in animation finished: %@", (uint8_t *)&v20, 0xCu);
    }
    float v13 = [(VLFScanningAnimationManager *)self layer];
    [v13 removeAnimationForKey:@"fadeIn"];
  }
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (id)fadeOutCompletion
{
  return self->_fadeOutCompletion;
}

- (void)setFadeOutCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fadeOutCompletion, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end