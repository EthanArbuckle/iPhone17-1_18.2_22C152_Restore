@interface BKMousePointerAnnotationController
- (BKDisplayAnnotationController)currentAnnotationController;
- (CADisplay)currentDisplay;
- (id)_stringDescribingContextID:(unsigned int)a3 pid:(int)a4;
- (void)_updateEventsPerSecond;
- (void)dealloc;
- (void)didPostEvent;
- (void)didReceiveEventFromDevice;
- (void)invalidate;
- (void)observeMouseAbsolutePointDidChange:(CGPoint)a3;
- (void)observeMouseAvailabilityDidChange:(BOOL)a3;
- (void)observeMouseButtonMaskDidChange:(unsigned int)a3;
- (void)observeMouseDidEnterContextID:(unsigned int)a3 pid:(int)a4;
- (void)observeMouseDidExitContextID:(unsigned int)a3 pid:(int)a4;
- (void)observeMouseForceDidChange:(double)a3 stage:(unsigned int)a4;
- (void)observeMouseModelPointDidChange:(CGPoint)a3 display:(id)a4 reason:(id)a5;
- (void)observeMouseRelativePointDidChange:(CGPoint)a3;
- (void)observeMouseScrollPhaseDidChange:(unsigned __int16)a3;
- (void)observeMouseTouchCountDidChange:(int64_t)a3;
- (void)setCurrentAnnotationController:(id)a3;
- (void)setCurrentDisplay:(id)a3;
@end

@implementation BKMousePointerAnnotationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnotationController, 0);

  objc_storeStrong((id *)&self->_currentDisplay, 0);
}

- (void)setCurrentAnnotationController:(id)a3
{
}

- (BKDisplayAnnotationController)currentAnnotationController
{
  return self->_currentAnnotationController;
}

- (void)setCurrentDisplay:(id)a3
{
}

- (CADisplay)currentDisplay
{
  return self->_currentDisplay;
}

- (id)_stringDescribingContextID:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4 < 1)
  {
    v9 = +[NSString stringWithFormat:@"ctx:%X", *(void *)&a3];
  }
  else
  {
    uint64_t v5 = *(void *)&a4;
    v6 = BSBundleIDForPID();
    v7 = [v6 stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_1000FD108 options:0 range:10];
    v8 = [v7 stringByAppendingFormat:@" (%d)", v5];

    v9 = +[NSString stringWithFormat:@"ctx:%X -- %@", v4, v8];
  }

  return v9;
}

- (void)observeMouseAvailabilityDidChange:(BOOL)a3
{
  if (!a3) {
    [(BKDisplayAnnotationController *)self->_currentAnnotationController removeAnnotationsForKeyPath:@"mouse"];
  }
}

- (void)observeMouseTouchCountDidChange:(int64_t)a3
{
  uint64_t v4 = self->_currentAnnotationController;
  if (v4)
  {
    v7 = v4;
    if (a3 < 1)
    {
      [(BKDisplayAnnotationController *)v4 removeAnnotationsForKeyPath:@"mouse.touchState"];
    }
    else
    {
      uint64_t v5 = +[NSString stringWithFormat:@"touches:%d", a3];
      v6 = +[BKDisplayAnnotation subannotationWithString:v5];
      [(BKDisplayAnnotationController *)v7 setAnnotation:v6 forKeyPath:@"mouse.touchState"];
    }
    uint64_t v4 = v7;
  }
}

- (void)observeMouseForceDidChange:(double)a3 stage:(unsigned int)a4
{
  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    uint64_t v5 = *(void *)&a4;
    v7 = currentAnnotationController;
    id v9 = +[NSString stringWithFormat:@"force: %.4g stage %u", *(void *)&a3, v5];
    v8 = +[BKDisplayAnnotation subannotationWithString:v9];
    [(BKDisplayAnnotationController *)v7 setAnnotation:v8 forKeyPath:@"mouse.force"];
  }
}

- (void)observeMouseButtonMaskDidChange:(unsigned int)a3
{
  uint64_t v4 = self->_currentAnnotationController;
  v6 = v4;
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v7 = @"primary button down";
      }
      else if (a3 == 2)
      {
        v7 = @"secondary button down";
      }
      else
      {
        v5.i32[0] = a3;
        uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5);
        v8.i16[0] = vaddlv_u8(v8);
        int v9 = v8.i32[0];
        if (v8.u32[0] == 1) {
          CFStringRef v10 = @"button {";
        }
        else {
          CFStringRef v10 = @"buttons {";
        }
        +[NSMutableString stringWithString:v10];
        v19[0] = 0;
        v19[1] = v19;
        v19[2] = 0x2020000000;
        char v20 = 0;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v15 = (void (*)(void *))sub_100060A80;
        v16 = &unk_1000F75F0;
        v18 = v19;
        v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v17 = v7;
        v11 = v14;
        char v21 = 0;
        if (v9)
        {
          unint64_t v12 = 0;
          do
          {
            if (((1 << v12) & a3) != 0)
            {
              v15(v11);
              if (v21) {
                break;
              }
              --v9;
            }
            if (v12 > 0x3E) {
              break;
            }
            ++v12;
          }
          while (v9 > 0);
        }

        [(__CFString *)v7 appendString:@"} down"];
        _Block_object_dispose(v19, 8);
      }
      v13 = +[BKDisplayAnnotation subannotationWithString:v7];
      [(BKDisplayAnnotationController *)v6 setAnnotation:v13 forKeyPath:@"mouse.buttons"];
    }
    else
    {
      [(BKDisplayAnnotationController *)v4 removeAnnotationsForKeyPath:@"mouse.buttons"];
    }
  }
}

- (void)observeMouseDidExitContextID:(unsigned int)a3 pid:(int)a4
{
  currentAnnotationController = self->_currentAnnotationController;
  id v5 = +[NSString stringWithFormat:@"mouse.ctx.%X", *(void *)&a4, *(void *)&a3];
  [(BKDisplayAnnotationController *)currentAnnotationController removeAnnotationsForKeyPath:v5];
}

- (void)observeMouseDidEnterContextID:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v7 = self->_currentAnnotationController;
  if (v7)
  {
    v11 = v7;
    uint8x8_t v8 = +[NSString stringWithFormat:@"mouse.ctx.%X", v5];
    if (v5)
    {
      int v9 = [(BKMousePointerAnnotationController *)self _stringDescribingContextID:v5 pid:v4];
      CFStringRef v10 = +[BKDisplayAnnotation subannotationWithString:v9];
      [(BKDisplayAnnotationController *)v11 setAnnotation:v10 forKeyPath:v8];
    }
    else
    {
      [(BKDisplayAnnotationController *)v11 removeAnnotationsForKeyPath:v8];
    }

    v7 = v11;
  }
}

- (void)observeMouseScrollPhaseDidChange:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v4 = self->_currentAnnotationController;
  if (v4)
  {
    uint8x8_t v8 = v4;
    if (v3)
    {
      uint64_t v5 = BKNSStringFromIOHIDEventPhase();
      v6 = +[NSString stringWithFormat:@"phased scroll (%@)", v5];

      v7 = +[BKDisplayAnnotation subannotationWithString:v6];
      [(BKDisplayAnnotationController *)v8 setAnnotation:v7 forKeyPath:@"mouse.scrollstatus"];
    }
    else
    {
      [(BKDisplayAnnotationController *)v4 removeAnnotationsForKeyPath:@"mouse.scrollstatus"];
    }
    uint64_t v4 = v8;
  }
}

- (void)observeMouseModelPointDidChange:(CGPoint)a3 display:(id)a4 reason:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v22 = (CADisplay *)a4;
  id v10 = a5;
  v11 = self->_currentAnnotationController;
  if (self->_currentDisplay != v22)
  {
    objc_storeStrong((id *)&self->_currentDisplay, a4);
    [(BKDisplayAnnotationController *)self->_currentAnnotationController removeAnnotationsForKeyPath:@"mouse"];
    unint64_t v12 = +[BKDisplayAnnotationController annotationControllerForDisplay:v22];
    currentAnnotationController = self->_currentAnnotationController;
    self->_currentAnnotationController = v12;
  }
  v14 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setSuperBias:](v14, "setSuperBias:", 0.0, 0.0);
  -[BKDisplayAnnotationLocation setPoint:](v14, "setPoint:", x, y);
  v15 = [(BKDisplayAnnotationController *)v11 annotationForKeyPath:@"mouse"];
  v16 = v15;
  if (v15)
  {
    [v15 setLocation:v14];
  }
  else
  {
    v17 = +[BKDisplayAnnotation annotationWithRectangleSize:](BKDisplayAnnotation, "annotationWithRectangleSize:", 48.0, 48.0);
    v18 = objc_alloc_init(BKDisplayAnnotationContainedSubnodeRenderer);
    [v17 setLocation:v14];
    v19 = +[BKDisplayAnnotationStyle pointerStyle];
    [v17 setStyleModifier:v19];

    [v17 setRenderer:v18];
    [v17 setSubnodeScreenEdgeTreatment:2];
    [(BKDisplayAnnotationController *)v11 setAnnotation:v17 forKeyPath:@"mouse"];
  }
  char v20 = +[NSString stringWithFormat:@"%g,%g -- %@", *(void *)&x, *(void *)&y, v10];
  char v21 = +[BKDisplayAnnotation subannotationWithString:v20];
  [(BKDisplayAnnotationController *)v11 setAnnotation:v21 forKeyPath:@"mouse.location"];
}

- (void)observeMouseAbsolutePointDidChange:(CGPoint)a3
{
  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    v6 = currentAnnotationController;
    id v8 = +[NSString stringWithFormat:@"abs: %.4g,%.4g", *(void *)&x, *(void *)&y];
    v7 = +[BKDisplayAnnotation subannotationWithString:v8];
    [(BKDisplayAnnotationController *)v6 setAnnotation:v7 forKeyPath:@"mouse.relpoint"];
  }
}

- (void)observeMouseRelativePointDidChange:(CGPoint)a3
{
  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    v6 = currentAnnotationController;
    id v8 = +[NSString stringWithFormat:@"rel: %.4g,%.4g", *(void *)&x, *(void *)&y];
    v7 = +[BKDisplayAnnotation subannotationWithString:v8];
    [(BKDisplayAnnotationController *)v6 setAnnotation:v7 forKeyPath:@"mouse.relpoint"];
  }
}

- (void)didPostEvent
{
}

- (void)didReceiveEventFromDevice
{
}

- (void)_updateEventsPerSecond
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (v3 - self->_startTime > 1.0)
  {
    currentAnnotationController = self->_currentAnnotationController;
    if (currentAnnotationController)
    {
      int64_t inputEventsPerSecond = self->_inputEventsPerSecond;
      int64_t outputEventsPerSecond = self->_outputEventsPerSecond;
      id v8 = currentAnnotationController;
      int v9 = +[NSString stringWithFormat:@"Hz in:%d / out:%d", inputEventsPerSecond, outputEventsPerSecond];
      id v10 = +[BKDisplayAnnotation subannotationWithString:v9];
      [(BKDisplayAnnotationController *)v8 setAnnotation:v10 forKeyPath:@"mouse.Hz"];
    }
    self->_startTime = v4;
    self->_int64_t inputEventsPerSecond = 0;
    self->_int64_t outputEventsPerSecond = 0;
  }
}

- (void)invalidate
{
  [(BKDisplayAnnotationController *)self->_currentAnnotationController removeAnnotationsForKeyPath:@"mouse"];
  currentAnnotationController = self->_currentAnnotationController;
  self->_currentAnnotationController = 0;

  currentDisplaCGFloat y = self->_currentDisplay;
  self->_currentDisplaCGFloat y = 0;
}

- (void)dealloc
{
  if (self->_currentAnnotationController)
  {
    double v4 = +[NSString stringWithFormat:@"must invalidate BKMousePointerAnnotationController before dealloc"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      unint64_t v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKMousePointerAnnotationController.m";
      __int16 v17 = 1024;
      int v18 = 40;
      __int16 v19 = 2114;
      char v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000613C0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKMousePointerAnnotationController;
  [(BKMousePointerAnnotationController *)&v8 dealloc];
}

@end