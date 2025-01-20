@interface _UIWindowTransformLayer
- (void)addAnimation:(id)a3 forKey:(id)a4;
@end

@implementation _UIWindowTransformLayer

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isEqualToString:@"transform"])
  {
    id v8 = v6;
    window = self->super._window;
    int64_t previousSceneOrientationForCounterRotation = window->_previousSceneOrientationForCounterRotation;
    uint64_t v11 = [(UIWindow *)window _toWindowOrientation];
    uint64_t v12 = [(UIWindow *)self->super._window _fromWindowOrientation];
    if (previousSceneOrientationForCounterRotation)
    {
      v13 = self->super._window;
      int64_t v14 = v13->_previousSceneOrientationForCounterRotation;
      uint64_t v15 = [(UIWindow *)v13 _orientationForRootTransform];
      double v16 = 0.0;
      double v17 = 0.0;
      if (v12 != 1)
      {
        if (v12 == 3)
        {
          double v17 = 1.57079633;
        }
        else if (v12 == 4)
        {
          double v17 = -1.57079633;
        }
        else
        {
          double v17 = 3.14159265;
          if (v12 != 2) {
            double v17 = 0.0;
          }
        }
      }
      if (v14 != 1)
      {
        if (v14 == 3)
        {
          double v16 = 1.57079633;
        }
        else if (v14 == 4)
        {
          double v16 = -1.57079633;
        }
        else
        {
          double v16 = 3.14159265;
          if (v14 != 2) {
            double v16 = 0.0;
          }
        }
      }
      double v18 = 0.0;
      double v19 = 0.0;
      if (v11 != 1)
      {
        if (v11 == 3)
        {
          double v19 = 1.57079633;
        }
        else if (v11 == 4)
        {
          double v19 = -1.57079633;
        }
        else
        {
          double v19 = 3.14159265;
          if (v11 != 2) {
            double v19 = 0.0;
          }
        }
      }
      double v20 = v17 - v16;
      if (v15 != 1)
      {
        switch(v15)
        {
          case 3:
            double v18 = 1.57079633;
            break;
          case 4:
            double v18 = -1.57079633;
            break;
          case 2:
            double v18 = 3.14159265;
            break;
        }
      }
      _UIMakeBasicTransformAnimationUnambiguousWithAngles(v8, 1, 0, v20, v19 - v18);
    }
    else
    {
      _UIMakeBasicTransformAnimationUnambiguousWithOrientations(v8, v12, v11, 0, 0);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)_UIWindowTransformLayer;
  [(_UIWindowTransformLayer *)&v21 addAnimation:v6 forKey:v7];
}

@end