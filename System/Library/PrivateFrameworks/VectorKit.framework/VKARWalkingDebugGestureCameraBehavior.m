@interface VKARWalkingDebugGestureCameraBehavior
- (VKARWalkingDebugGestureCameraBehavior)initWithCameraController:(id)a3;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
@end

@implementation VKARWalkingDebugGestureCameraBehavior

- (VKARWalkingDebugGestureCameraBehavior)initWithCameraController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKARWalkingDebugGestureCameraBehavior;
  v5 = [(VKGestureCameraBehavior *)&v8 initWithCameraController:v4];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    v6->super._notifyCameraStateChanges = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v9 = [WeakRetained canvas];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  id v14 = objc_loadWeakRetained((id *)p_controller);
  float v15 = v11 * x;
  float v16 = v13 - y * v13;
  double v17 = a3;
  float v18 = v15;
  float v19 = v16;
  int v20 = 1;
  [v14 pushGesture:&v17];
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  double v10 = [WeakRetained canvas];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12 * v7;
  double v16 = v14 - v6 * v14;
  double v17 = v12 * x;
  double v18 = v14 - y * v14;
  double v19 = vabdd_f64(v16, v18);
  if (vabdd_f64(v15, v17) >= 1.0 || v19 >= 1.0)
  {
    id v21 = objc_loadWeakRetained((id *)p_controller);
    float v22 = v17;
    float v23 = v18;
    float v24 = v15;
    *(float *)v26 = v22;
    *(float *)&v26[1] = v23;
    float v25 = v16;
    *(float *)&v26[2] = v24;
    *(float *)&v26[3] = v25;
    v26[4] = 0;
    [v21 pushGesture:v26];
  }
}

@end