@interface _SBProximityTouchHandlingView
- (double)statusBarHeight;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)setDelegate:(id *)result;
- (uint64_t)setStatusBarHeight:(uint64_t)result;
@end

@implementation _SBProximityTouchHandlingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BSFloatLessThanOrEqualToFloat();
  if (!BSFloatGreaterThanOrEqualToFloat()) {
    goto LABEL_5;
  }
  if (!BSFloatLessThanFloat()) {
    goto LABEL_5;
  }
  v7 = [(_SBProximityTouchHandlingView *)self window];
  v8 = [v7 screen];
  [v8 bounds];
  int v9 = BSFloatLessThanFloat();

  if (v9)
  {
    v10 = -[_SBProximityTouchHandlingView delegate]((id *)&self->super.super.super.isa);
    objc_msgSend(v10, "didHitAllowedRegion:", x, y);

    int v11 = 1;
  }
  else
  {
LABEL_5:
    int v11 = 0;
  }
  v12 = SBLogProximitySensor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double statusBarHeight = self->_statusBarHeight;
    int v16 = 134218752;
    double v17 = x;
    __int16 v18 = 2048;
    double v19 = y;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 2048;
    double v23 = statusBarHeight;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Prox hit test (%g,%g) - hitStatusBar:%{BOOL}u (statusBarHeight:%g)", (uint8_t *)&v16, 0x26u);
  }

  if (v11) {
    v14 = 0;
  }
  else {
    v14 = self;
  }
  return v14;
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 51);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 51, a2);
  }
  return result;
}

- (double)statusBarHeight
{
  if (a1) {
    return *(double *)(a1 + 416);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setStatusBarHeight:(uint64_t)result
{
  if (result) {
    *(double *)(result + 416) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end