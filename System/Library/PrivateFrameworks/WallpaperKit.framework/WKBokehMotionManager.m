@interface WKBokehMotionManager
- (BOOL)zeroMovementSinceLastFrame;
- (WKBokehMotionManager)init;
- (double)accelerometerUpdateInterval;
- (double)attitude;
- (double)deviceMotionUpdateInterval;
- (double)pitch;
- (double)roll;
- (double)x;
- (double)yaw;
- (double)z;
- (id)initWithCoefficient:(double)a3 threshold:;
- (id)initWithCoefficient:(id)result;
- (id)motionFilterX;
- (id)motionFilterY;
- (id)motionFilterZ;
- (uint64_t)createMotionManager;
- (uint64_t)isDeviceMotionAvailable;
- (uint64_t)setAccelerometerUpdateInterval:(uint64_t)result;
- (uint64_t)setDeviceMotionUpdateInterval:(uint64_t)result;
- (void)_createFilters;
- (void)pauseDeviceMotionUpdates;
- (void)startDeviceAccelerometerUpdates;
- (void)startDeviceMotionUpdates;
- (void)stopDeviceAccelerometerUpdates;
- (void)stopDeviceMotionUpdates;
@end

@implementation WKBokehMotionManager

- (WKBokehMotionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)WKBokehMotionManager;
  result = [(WKBokehMotionManager *)&v3 init];
  if (result)
  {
    result->_referenceFrame = 1;
    result->_attitude.x = 0.0;
    result->_attitude.y = 0.0;
    result->_attitude.z = 0.0;
    result->_attitude.w = 1.0;
    result->_coefficient = 0.02;
  }
  return result;
}

- (id)initWithCoefficient:(id)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)WKBokehMotionManager;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((void *)result + 13) = 1;
      *((void *)result + 4) = 0;
      *((void *)result + 5) = 0;
      *((void *)result + 6) = 0;
      *((void *)result + 7) = 0x3FF0000000000000;
      *((double *)result + 11) = a2;
    }
  }
  return result;
}

- (id)initWithCoefficient:(double)a3 threshold:
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)WKBokehMotionManager;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      *((void *)result + 13) = 1;
      *((void *)result + 4) = 0;
      *((void *)result + 5) = 0;
      *((void *)result + 6) = 0;
      *((void *)result + 7) = 0x3FF0000000000000;
      *((double *)result + 11) = a2;
      *((double *)result + 12) = a3;
    }
  }
  return result;
}

- (double)accelerometerUpdateInterval
{
  if (!a1) {
    return 0.0;
  }
  -[WKBokehMotionManager createMotionManager](a1);
  v2 = *(void **)(a1 + 112);
  [v2 accelerometerUpdateInterval];
  return result;
}

- (uint64_t)createMotionManager
{
  if (result && !*(void *)(result + 112))
  {
    *(void *)(result + 112) = objc_alloc_init(MEMORY[0x1E4F22230]);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (uint64_t)setAccelerometerUpdateInterval:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[WKBokehMotionManager createMotionManager](result);
    v4 = *(void **)(v3 + 112);
    return [v4 setAccelerometerUpdateInterval:a2];
  }
  return result;
}

- (double)deviceMotionUpdateInterval
{
  if (!a1) {
    return 0.0;
  }
  -[WKBokehMotionManager createMotionManager](a1);
  v2 = *(void **)(a1 + 112);
  [v2 deviceMotionUpdateInterval];
  return result;
}

- (uint64_t)setDeviceMotionUpdateInterval:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[WKBokehMotionManager createMotionManager](result);
    v4 = *(void **)(v3 + 112);
    return [v4 setDeviceMotionUpdateInterval:a2];
  }
  return result;
}

- (double)x
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (double)z
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (id)motionFilterX
{
  if (a1)
  {
    a1 = (id *)a1[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)motionFilterY
{
  if (a1)
  {
    a1 = (id *)a1[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)motionFilterZ
{
  if (a1)
  {
    a1 = (id *)a1[18];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)attitude
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (double)roll
{
  if (a1) {
    return *(double *)(a1 + 64);
  }
  else {
    return 0.0;
  }
}

- (double)pitch
{
  if (a1) {
    return *(double *)(a1 + 72);
  }
  else {
    return 0.0;
  }
}

- (double)yaw
{
  if (a1) {
    return *(double *)(a1 + 80);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)isDeviceMotionAvailable
{
  if (result)
  {
    uint64_t v1 = result;
    -[WKBokehMotionManager createMotionManager](result);
    v2 = *(void **)(v1 + 112);
    return [v2 isDeviceMotionAvailable];
  }
  return result;
}

- (BOOL)zeroMovementSinceLastFrame
{
  if (!a1
    || !-[WKBokehInfiniteImpulseResponseFilter zeroGradient](a1[16])
    || !-[WKBokehInfiniteImpulseResponseFilter zeroGradient](a1[17]))
  {
    return 0;
  }
  BOOL v2 = a1[18];
  return -[WKBokehInfiniteImpulseResponseFilter zeroGradient](v2);
}

- (void)_createFilters
{
  if (a1)
  {
    if (!*(void *)(a1 + 128))
    {
      uint64_t v2 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      uint64_t v3 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v2;

      uint64_t v4 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      objc_super v5 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v4;

      uint64_t v6 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v7 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v6;

      uint64_t v8 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v9 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v8;

      uint64_t v10 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v11 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v10;

      uint64_t v12 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v13 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v12;

      uint64_t v14 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v15 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v14;

      uint64_t v16 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v17 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v16;

      uint64_t v18 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v19 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v18;

      uint64_t v20 = +[WKBokehInfiniteImpulseResponseFilter lowpassInertiaFilterWithCoefficient:](*(double *)(a1 + 88));
      v21 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v20;

      int v22 = 3;
      do
      {
        -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*(void **)(a1 + 176), 1.0);
        --v22;
      }
      while (v22);
      double v23 = *(double *)(a1 + 96);
      if (v23 > 0.0)
      {
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 128), v23);
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 136), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 144), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 152), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 160), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 168), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 176), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 184), *(double *)(a1 + 96));
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](*(void *)(a1 + 192), *(double *)(a1 + 96));
        double v24 = *(double *)(a1 + 96);
        uint64_t v25 = *(void *)(a1 + 200);
        -[WKBokehInfiniteImpulseResponseFilter setZeroGradientThreshold:](v25, v24);
      }
    }
  }
}

- (void)startDeviceMotionUpdates
{
  if (a1)
  {
    -[WKBokehMotionManager _createFilters](a1);
    -[WKBokehMotionManager createMotionManager](a1);
    [*(id *)(a1 + 112) setDeviceMotionUpdateInterval:0.0166666667];
    if (*(unsigned char *)(a1 + 120))
    {
      *(unsigned char *)(a1 + 120) = 0;
    }
    else
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      [v2 setMaxConcurrentOperationCount:1];
      objc_initWeak(&location, (id)a1);
      uint64_t v4 = *(void *)(a1 + 104);
      uint64_t v3 = *(void **)(a1 + 112);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __48__WKBokehMotionManager_startDeviceMotionUpdates__block_invoke;
      v5[3] = &unk_1E6377018;
      objc_copyWeak(&v6, &location);
      [v3 startDeviceMotionUpdatesUsingReferenceFrame:v4 toQueue:v2 withHandler:v5];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void __48__WKBokehMotionManager_startDeviceMotionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 gravity];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v3 attitude];
  [v10 quaternion];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v33 = v17;

  uint64_t v18 = [v3 attitude];
  [v18 roll];
  double v32 = v19;

  uint64_t v20 = [v3 attitude];
  [v20 pitch];
  double v22 = v21;

  double v23 = [v3 attitude];

  [v23 yaw];
  double v25 = v24;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v34 = WeakRetained;
    WeakRetained[1] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)WeakRetained + 16), v5);
    v34[2] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 17), v7);
    v34[3] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 18), v9);
    double v27 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 19), v12);
    double v28 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 20), v14);
    double v29 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 21), v16);
    double v30 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 22), v33);
    v34[4] = v27;
    v34[5] = v28;
    v34[6] = v29;
    v34[7] = v30;
    v34[8] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 23), v32);
    v34[9] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 24), v22);
    double v31 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v34 + 25), v25);
    WeakRetained = v34;
    v34[10] = v31;
  }
}

- (void)startDeviceAccelerometerUpdates
{
  if (a1)
  {
    -[WKBokehMotionManager _createFilters]((uint64_t)a1);
    -[WKBokehMotionManager createMotionManager]((uint64_t)a1);
    [a1[14] setAccelerometerUpdateInterval:0.0166666667];
    id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v2 setMaxConcurrentOperationCount:1];
    objc_initWeak(&location, a1);
    id v3 = a1[14];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__WKBokehMotionManager_startDeviceAccelerometerUpdates__block_invoke;
    v4[3] = &unk_1E6377040;
    objc_copyWeak(&v5, &location);
    [v3 startAccelerometerUpdatesToQueue:v2 withHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __55__WKBokehMotionManager_startDeviceAccelerometerUpdates__block_invoke(uint64_t a1, void *a2)
{
  [a2 acceleration];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v11 = WeakRetained;
    WeakRetained[1] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)WeakRetained + 16), v4);
    v11[2] = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v11 + 17), v6);
    double v10 = -[WKBokehInfiniteImpulseResponseFilter filterWithInput:](*((void **)v11 + 18), v8);
    WeakRetained = v11;
    v11[3] = v10;
  }
}

- (void)stopDeviceMotionUpdates
{
  if (result)
  {
    double result = (void *)result[14];
    if (result) {
      return (void *)[result stopDeviceMotionUpdates];
    }
  }
  return result;
}

- (void)pauseDeviceMotionUpdates
{
  if (result)
  {
    uint64_t v1 = result;
    double result = (void *)result[14];
    if (result)
    {
      double result = (void *)[result setDeviceMotionUpdateInterval:10.0];
      *((unsigned char *)v1 + 120) = 1;
    }
  }
  return result;
}

- (void)stopDeviceAccelerometerUpdates
{
  if (result)
  {
    double result = (void *)result[14];
    if (result) {
      return (void *)[result stopAccelerometerUpdates];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionFilterYaw, 0);
  objc_storeStrong((id *)&self->_motionFilterPitch, 0);
  objc_storeStrong((id *)&self->_motionFilterRoll, 0);
  objc_storeStrong((id *)&self->_motionFilterAW, 0);
  objc_storeStrong((id *)&self->_motionFilterAZ, 0);
  objc_storeStrong((id *)&self->_motionFilterAY, 0);
  objc_storeStrong((id *)&self->_motionFilterAX, 0);
  objc_storeStrong((id *)&self->_motionFilterZ, 0);
  objc_storeStrong((id *)&self->_motionFilterY, 0);
  objc_storeStrong((id *)&self->_motionFilterX, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end