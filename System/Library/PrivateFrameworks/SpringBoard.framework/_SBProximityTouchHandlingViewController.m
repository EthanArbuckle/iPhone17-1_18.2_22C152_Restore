@interface _SBProximityTouchHandlingViewController
- (BOOL)shouldAutorotate;
- (double)statusBarHeight;
- (id)delegate;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (uint64_t)proximitySettings;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)setDelegate:(void *)a1;
- (void)setProximitySettings:(uint64_t)a1;
- (void)setStatusBarHeight:(double *)a1;
@end

@implementation _SBProximityTouchHandlingViewController

- (id)delegate
{
  if (a1)
  {
    v1 = [a1 _view];
    v2 = -[_SBProximityTouchHandlingView delegate](v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setDelegate:(void *)a1
{
  id obj = a2;
  if (a1)
  {
    uint64_t v3 = [a1 _view];
    v4 = (void *)v3;
    if (v3) {
      objc_storeWeak((id *)(v3 + 408), obj);
    }
  }
}

- (void)setStatusBarHeight:(double *)a1
{
  if (a1 && a1[122] != a2)
  {
    a1[122] = a2;
    uint64_t v3 = [a1 _view];
    if (v3) {
      v3[52] = a2;
    }
  }
}

- (void)loadView
{
  uint64_t v3 = [_SBProximityTouchHandlingView alloc];
  v8 = -[_SBProximityTouchHandlingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setOpaque:0];
  v4 = [v8 layer];
  [v4 setHitTestsAsOpaque:1];

  if ([(SBProximitySettings *)self->_proximitySettings colorScreenEdgeWhenObjectInProximity])
  {
    v5 = [v8 layer];
    id v6 = [MEMORY[0x1E4F428B8] systemMintColor];
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    v7 = [v8 layer];
    [v7 setBorderWidth:3.0];
  }
  if (v8) {
    v8[52] = self->_statusBarHeight;
  }
  [(_SBProximityTouchHandlingViewController *)self setView:v8];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (double)statusBarHeight
{
  if (a1) {
    return *(double *)(a1 + 976);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)proximitySettings
{
  if (result) {
    return *(void *)(result + 984);
  }
  return result;
}

- (void)setProximitySettings:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 984), a2);
  }
}

- (void).cxx_destruct
{
}

@end