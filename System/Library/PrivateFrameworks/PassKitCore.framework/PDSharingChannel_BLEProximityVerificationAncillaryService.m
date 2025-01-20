@interface PDSharingChannel_BLEProximityVerificationAncillaryService
- (BOOL)isRunning;
- (id)_initWithDelegate:(id)a3;
- (id)initAdvertiserDelegate:(id)a3 completion:(id)a4;
- (id)initDetectorWithAdvertisement:(id)a3 remoteDevice:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)_invalidateWithShouldNotify:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
- (void)start;
@end

@implementation PDSharingChannel_BLEProximityVerificationAncillaryService

- (id)_initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PDSharingChannel_BLEProximityVerificationAncillaryService;
  v5 = [(PDSharingChannel_BLEProximityVerificationAncillaryService *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)initAdvertiserDelegate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(PDSharingChannel_BLEProximityVerificationAncillaryService *)self _initWithDelegate:a3];
  if (v7)
  {
    id v8 = objc_alloc_init((Class)PKProximityAdvertiser);
    v9 = (void *)v7[6];
    v7[6] = v8;

    v7[2] = 0;
    id v10 = objc_retainBlock(v6);
    v11 = (void *)v7[7];
    v7[7] = v10;
  }
  return v7;
}

- (id)initDetectorWithAdvertisement:(id)a3 remoteDevice:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = [(PDSharingChannel_BLEProximityVerificationAncillaryService *)self _initWithDelegate:a5];
  if (v11)
  {
    id v12 = objc_alloc((Class)PKProximityDetector);
    v13 = [v9 bluetoothUUID];
    id v14 = [v12 initWithAdvertisingDeviceUUID:v13];
    v15 = (void *)v11[4];
    v11[4] = v14;

    v11[2] = 1;
    id v16 = objc_retainBlock(v10);
    v17 = (void *)v11[5];
    v11[5] = v16;
  }
  return v11;
}

- (void)dealloc
{
  [(PDSharingChannel_BLEProximityVerificationAncillaryService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PDSharingChannel_BLEProximityVerificationAncillaryService;
  [(PDSharingChannel_BLEProximityVerificationAncillaryService *)&v3 dealloc];
}

- (BOOL)isRunning
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_isRunning && !self->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)start
{
  objc_initWeak(&location, self);
  os_unfair_lock_lock(&self->_lock);
  if (self->_isRunning)
  {
    self->_isRunning = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL invalidated = self->_invalidated;
    self->_isRunning = !invalidated;
    os_unfair_lock_unlock(&self->_lock);
    if (!invalidated)
    {
      unint64_t mode = self->_mode;
      if (mode == 1)
      {
        id v8 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting proximity verification detection", buf, 2u);
        }

        detector = self->_detector;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100109934;
        v13[3] = &unk_1007374A8;
        v7 = &v14;
        objc_copyWeak(&v14, &location);
        [(PKProximityDetector *)detector setHandler:v13];
        id v10 = self->_detector;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100109A8C;
        v11[3] = &unk_100737480;
        objc_copyWeak(&v12, &location);
        [(PKProximityDetector *)v10 startDetectingWithDuration:v11 completion:30.0];
        objc_destroyWeak(&v12);
      }
      else
      {
        if (mode) {
          goto LABEL_13;
        }
        v5 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting proximity verification advertising", buf, 2u);
        }

        advertiser = self->_advertiser;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1001097D8;
        v15[3] = &unk_100737480;
        v7 = &v16;
        objc_copyWeak(&v16, &location);
        [(PKProximityAdvertiser *)advertiser startAdvertisingForDuration:v15 completion:30.0];
      }
      objc_destroyWeak(v7);
    }
  }
LABEL_13:
  objc_destroyWeak(&location);
}

- (void)invalidate
{
}

- (void)_invalidateWithShouldNotify:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    id WeakRetained = 0;
    id v6 = 0;
    v7 = 0;
  }
  else
  {
    *(_WORD *)&self->_BOOL invalidated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    id v6 = (void (**)(id, void))objc_retainBlock(self->_advertiseCompletion);
    id advertiseCompletion = self->_advertiseCompletion;
    self->_id advertiseCompletion = 0;

    [(PKProximityAdvertiser *)self->_advertiser endAdvertising];
    advertiser = self->_advertiser;
    self->_advertiser = 0;

    v7 = (void (**)(id, void))objc_retainBlock(self->_detectionCompletion);
    id detectionCompletion = self->_detectionCompletion;
    self->_id detectionCompletion = 0;

    [(PKProximityDetector *)self->_detector endDetecting];
    detector = self->_detector;
    self->_detector = 0;
  }
  os_unfair_lock_unlock(p_lock);
  if (v3) {
    [WeakRetained ancillaryServiceDidTerminate:self];
  }
  if (v7) {
    v7[2](v7, 0);
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_advertiseCompletion, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong(&self->_detectionCompletion, 0);
  objc_storeStrong((id *)&self->_detector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end