@interface RPNIProximityEstimator
- (NISession)session;
- (NSString)innerRegionName;
- (NSString)outerRegionName;
- (OS_dispatch_queue)dispatchQueue;
- (RPNIProximityEstimator)init;
- (id)_createAndRunSession;
- (id)deviceRegionChangedHandler;
- (int64_t)innerPresencePreset;
- (int64_t)outerPresencePreset;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendSampleForDevice:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setDeviceRegionChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInnerPresencePreset:(int64_t)a3;
- (void)setInnerRegionName:(id)a3;
- (void)setOuterPresencePreset:(int64_t)a3;
- (void)setOuterRegionName:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation RPNIProximityEstimator

- (RPNIProximityEstimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNIProximityEstimator;
  v2 = [(RPNIProximityEstimator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F974;
  v7[3] = &unk_100123AD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FB98;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)sendSampleForDevice:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007FCBC;
  v7[3] = &unk_1001219D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)_createAndRunSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unint64_t innerPresencePreset = self->_innerPresencePreset;
  if (innerPresencePreset <= 1) {
    unint64_t innerPresencePreset = 1;
  }
  self->_unint64_t innerPresencePreset = innerPresencePreset;
  int64_t outerPresencePreset = self->_outerPresencePreset;
  if (!outerPresencePreset) {
    int64_t outerPresencePreset = 5;
  }
  self->_int64_t outerPresencePreset = outerPresencePreset;
  id v5 = [objc_alloc(off_100142100()) initWithName:self->_innerRegionName devicePresencePreset:self->_innerPresencePreset];
  id v6 = [objc_alloc(off_100142100()) initWithName:self->_outerRegionName devicePresencePreset:self->_outerPresencePreset];
  id v14 = 0;
  id v7 = [objc_alloc(off_100142108()) initWithInnerBoundary:v5 outerBoundary:v6 error:&v14];
  id v8 = v14;
  if (!v8)
  {
    if (v7)
    {
      [v7 setAllowedDevices:0];
      session = self->_session;
      self->_session = 0;
      v10 = session;

      [(NISession *)v10 invalidate];
      v11 = (NISession *)objc_alloc_init(off_100142110());
      v12 = self->_session;
      self->_session = v11;

      [(NISession *)self->_session setDelegate:self];
      [(NISession *)self->_session setDelegateQueue:self->_dispatchQueue];
      [(NISession *)self->_session runWithConfiguration:v7];

      id v8 = 0;
    }
    else
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (void)sessionDidStartRunning:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100142088 <= 30)
  {
    id v6 = v3;
    if (dword_100142088 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v20 = a4;
  id v9 = a5;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id deviceRegionChangedHandler = self->_deviceRegionChangedHandler;
  if (deviceRegionChangedHandler)
  {
    v12 = (void (**)(void, void, void))objc_retainBlock(deviceRegionChangedHandler);
    id v13 = [v9 devicePresencePreset];
    int64_t innerPresencePreset = self->_innerPresencePreset;
    if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize()))
    {
      v15 = [v10 name];
      v18 = [v9 name];
      id v19 = v20;
      v17 = v15;
      LogPrintF();
    }
    v16 = [v20 deviceIdentifer:v17 v18 v19];
    ((void (**)(void, void *, BOOL))v12)[2](v12, v16, v13 == (id)innerPresencePreset);

    goto LABEL_10;
  }
  if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize()))
  {
    v12 = [v20 deviceIdentifer];
    LogPrintF();
LABEL_10:
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize()))
  {
    id v6 = v7;
    LogPrintF();
  }
  id v5 = [(RPNIProximityEstimator *)self _createAndRunSession];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v6;
    LogPrintF();
  }
  if (-[NISession isEqual:](self->_session, "isEqual:", v10, v9))
  {
    session = self->_session;
    self->_session = 0;

    id v8 = [(RPNIProximityEstimator *)self _createAndRunSession];
  }
}

- (void)sessionWasSuspended:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142088 <= 30 && (dword_100142088 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [(RPNIProximityEstimator *)self _createAndRunSession];
}

- (int64_t)innerPresencePreset
{
  return self->_innerPresencePreset;
}

- (void)setInnerPresencePreset:(int64_t)a3
{
  self->_int64_t innerPresencePreset = a3;
}

- (NSString)innerRegionName
{
  return self->_innerRegionName;
}

- (void)setInnerRegionName:(id)a3
{
}

- (int64_t)outerPresencePreset
{
  return self->_outerPresencePreset;
}

- (void)setOuterPresencePreset:(int64_t)a3
{
  self->_int64_t outerPresencePreset = a3;
}

- (NSString)outerRegionName
{
  return self->_outerRegionName;
}

- (void)setOuterRegionName:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)deviceRegionChangedHandler
{
  return self->_deviceRegionChangedHandler;
}

- (void)setDeviceRegionChangedHandler:(id)a3
{
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_deviceRegionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_outerRegionName, 0);

  objc_storeStrong((id *)&self->_innerRegionName, 0);
}

@end