@interface _UIUpdateCycleDebugOverlay
+ (id)instance;
- (void)_updateCompleted;
- (void)addBorderToWindow:(id)a3;
- (void)removeBorderFromWindow:(id)a3;
@end

@implementation _UIUpdateCycleDebugOverlay

+ (id)instance
{
  if (_MergedGlobals_949 != -1) {
    dispatch_once(&_MergedGlobals_949, &__block_literal_global_35);
  }
  v2 = (void *)qword_1EB25F098;
  return v2;
}

- (void)_updateCompleted
{
  _UIUpdateCompletionObservationAddObserver((float **)mainCompletionObservation, (unint64_t)self, 0);
  v3 = (char *)off_1EB256BF8 + 648;
  if (*((_DWORD *)off_1EB256BF8 + 160) != 1) {
    v3 = 0;
  }
  uint64_t v4 = *((void *)v3 + 2);
  if (v4 >= mach_absolute_time())
  {
    if (self->_windowWithBorder)
    {
      -[_UIUpdateCycleDebugOverlay removeBorderFromWindow:](self, "removeBorderFromWindow:");
    }
  }
  else
  {
    id v5 = +[UIWindow _applicationKeyWindow];
    [(_UIUpdateCycleDebugOverlay *)self addBorderToWindow:v5];
  }
}

- (void)addBorderToWindow:(id)a3
{
  uint64_t v4 = (UIWindow *)a3;
  id v5 = v4;
  windowWithBorder = self->_windowWithBorder;
  if (windowWithBorder) {
    BOOL v7 = windowWithBorder == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    -[_UIUpdateCycleDebugOverlay removeBorderFromWindow:](self, "removeBorderFromWindow:");
  }
  v8 = [(UIView *)v5 layer];
  [v8 setBorderWidth:12.0];

  id v9 = +[UIColor redColor];
  uint64_t v10 = [v9 CGColor];
  v11 = [(UIView *)v5 layer];
  [v11 setBorderColor:v10];

  v12 = self->_windowWithBorder;
  self->_windowWithBorder = v5;
}

- (void)removeBorderFromWindow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 layer];
  [v5 setBorderWidth:0.0];

  id v6 = +[UIColor clearColor];
  uint64_t v7 = [v6 CGColor];
  v8 = [v4 layer];

  [v8 setBorderColor:v7];
  windowWithBorder = self->_windowWithBorder;
  self->_windowWithBorder = 0;
}

- (void).cxx_destruct
{
}

@end