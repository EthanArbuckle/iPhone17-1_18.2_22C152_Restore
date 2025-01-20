@interface BKHIDUISensorController
+ (id)sharedInstance;
- (BKDisplayBrightnessController)displayBrightnessController;
- (BKHIDUISensorConfiguring)sensor;
- (BKHIDUISensorController)initWithSensorConfiguration:(id)a3 displayBrightnessController:(id)a4;
- (BKSHIDUISensorMode)launchTimeLockedMode;
- (BKSHIDUISensorMode)prevailingMode;
- (BOOL)supportsProximityLPAEventTransitions;
- (BSCompoundAssertion)observerAssertion;
- (NSMutableDictionary)versionedPIDToClient;
- (OS_dispatch_source)estimatedProxShutoffTimer;
- (id)addSensorModeChangeObserver:(id)a3;
- (id)sensorCharacteristics;
- (unint64_t)requestEstimatedProximityEventsWithTimeout:(double)a3 versionedPID:(int64_t)a4;
- (unsigned)estimatedProxPowerAssertionID;
- (void)_cancelEstimatedProx;
- (void)applySensorMode:(id)a3 requestOrigin:(int64_t)a4;
- (void)proximityDidUnoccludeAfterScreenWake;
- (void)removeModesForVersionedPID:(int64_t)a3;
- (void)requestProximityStatusEventForReason:(id)a3 versionedPID:(int64_t)a4;
- (void)resetCalibration;
- (void)setDisplayBrightnessController:(id)a3;
- (void)setEstimatedProxPowerAssertionID:(unsigned int)a3;
- (void)setEstimatedProxShutoffTimer:(id)a3;
- (void)setLaunchTimeLockedMode:(id)a3;
- (void)setObserverAssertion:(id)a3;
- (void)setPrevailingMode:(id)a3;
- (void)setSensor:(id)a3;
- (void)setVersionedPIDToClient:(id)a3;
@end

@implementation BKHIDUISensorController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevailingMode, 0);
  objc_storeStrong((id *)&self->_estimatedProxShutoffTimer, 0);
  objc_storeStrong((id *)&self->_displayBrightnessController, 0);
  objc_storeStrong((id *)&self->_launchTimeLockedMode, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
  objc_storeStrong((id *)&self->_versionedPIDToClient, 0);

  objc_storeStrong((id *)&self->_sensor, 0);
}

- (void)setPrevailingMode:(id)a3
{
}

- (BKSHIDUISensorMode)prevailingMode
{
  return self->_prevailingMode;
}

- (void)setEstimatedProxPowerAssertionID:(unsigned int)a3
{
  self->_estimatedProxPowerAssertionID = a3;
}

- (unsigned)estimatedProxPowerAssertionID
{
  return self->_estimatedProxPowerAssertionID;
}

- (void)setEstimatedProxShutoffTimer:(id)a3
{
}

- (OS_dispatch_source)estimatedProxShutoffTimer
{
  return self->_estimatedProxShutoffTimer;
}

- (void)setDisplayBrightnessController:(id)a3
{
}

- (BKDisplayBrightnessController)displayBrightnessController
{
  return self->_displayBrightnessController;
}

- (void)setLaunchTimeLockedMode:(id)a3
{
}

- (BKSHIDUISensorMode)launchTimeLockedMode
{
  return self->_launchTimeLockedMode;
}

- (void)setObserverAssertion:(id)a3
{
}

- (BSCompoundAssertion)observerAssertion
{
  return self->_observerAssertion;
}

- (void)setVersionedPIDToClient:(id)a3
{
}

- (NSMutableDictionary)versionedPIDToClient
{
  return self->_versionedPIDToClient;
}

- (void)setSensor:(id)a3
{
}

- (BKHIDUISensorConfiguring)sensor
{
  return self->_sensor;
}

- (void)_cancelEstimatedProx
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100047A38((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeModesForVersionedPID:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100047E9C((uint64_t)self, (id)a3);

  os_unfair_lock_unlock(p_lock);
}

- (void)requestProximityStatusEventForReason:(id)a3 versionedPID:(int64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v8 = v7;
  if (self)
  {
    os_unfair_lock_assert_owner(p_lock);
    if ([(BKSHIDUISensorMode *)self->_prevailingMode proximityDetectionMode] != 5)
    {
      v9 = BKLogUISensor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = 0;
        v10 = "Ignoring request for status event: we're not locked";
        v11 = (uint8_t *)&v23;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if ([(BKSHIDUISensorMode *)self->_prevailingMode estimatedProximityMode])
    {
      v9 = BKLogUISensor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = 0;
        v10 = "Ignoring request for status event: we're in estimated prox mode";
        v11 = (uint8_t *)&v22;
LABEL_11:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([(BKSHIDUISensorMode *)self->_prevailingMode displayState] == (id)3)
    {
      v9 = BKLogUISensor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v10 = "Ignoring request for status event: display state is .InactiveOn";
        v11 = buf;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    versionedPIDToClient = self->_versionedPIDToClient;
    v13 = +[NSNumber numberWithLongLong:a4];
    v14 = [(NSMutableDictionary *)versionedPIDToClient objectForKeyedSubscript:v13];
    v15 = v14;
    if (v14) {
      v14 = (void *)v14[1];
    }
    id v16 = [v14 copy];

    id v17 = [(BKSHIDUISensorMode *)self->_prevailingMode mutableCopy];
    [v17 setPostEventWithCurrentDetectionMask:1];
    v18 = [v17 reason];
    v19 = NSStringFromBSVersionedPID();
    v20 = [v18 stringByAppendingFormat:@" + %@ (pid:%@)", v8, v19];
    [v17 setReason:v20];

    [v17 setVersionedPID:a4];
    sub_1000485DC((uint64_t)self, v17);
    if (v16) {
      sub_1000485DC((uint64_t)self, v16);
    }
    else {
      sub_100047E9C((uint64_t)self, (id)a4);
    }
  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)requestEstimatedProximityEventsWithTimeout:(double)a3 versionedPID:(int64_t)a4
{
  unint64_t v6 = (unint64_t)self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (v6)
  {
    os_unfair_lock_assert_owner(p_lock);
    if ([*(id *)(v6 + 64) proximityDetectionMode] != 5)
    {
      id v8 = BKLogUISensor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "Ignoring request for estimated prox events: we're not locked";
        goto LABEL_24;
      }
LABEL_7:

      unint64_t v6 = 2;
      goto LABEL_8;
    }
    if ([*(id *)(v6 + 64) displayState] == (id)3)
    {
      id v8 = BKLogUISensor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "Ignoring request for estimated prox events: display state is .InactiveOn";
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    dispatch_time_t v11 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    uint64_t v12 = *(void *)(v6 + 56);
    v13 = BKLogUISensor();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Restarting estimated prox timer with timeout %gs", buf, 0xCu);
      }

      dispatch_source_set_timer(*(dispatch_source_t *)(v6 + 56), v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      unint64_t v6 = 1;
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting estimated prox timer with timeout %gs", buf, 0xCu);
      }

      if ([(id)v6 estimatedProxPowerAssertionID])
      {
        v15 = BKLogUISensor();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          unsigned int v30 = [(id)v6 estimatedProxPowerAssertionID];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Trying to enable estimated proximity events, but we already have a power assertion taken out with id: %d", buf, 8u);
        }
      }
      else
      {
        LODWORD(handler[0]) = 0;
        LODWORD(v31[0]) = 1;
        int v16 = IOPMAssertionDeclareSystemActivity();
        id v17 = BKLogUISensor();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "-[BKHIDUISensorController _locked_requestEstimatedProximityEventsWithTimeout:versionedPID:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s - Unable to take estimated prox power assertion - returned %#x", buf, 0x12u);
          }

          uint64_t v19 = 0;
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = handler[0];
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Acquired estimated prox power assertion with id: %d", buf, 8u);
          }

          uint64_t v19 = LODWORD(handler[0]);
        }
        [(id)v6 setEstimatedProxPowerAssertionID:v19];
      }
      uint64_t v20 = sub_100047CD4(v6, (void *)a4, 1);
      v21 = (id *)v20;
      if (v20)
      {
        __int16 v22 = *(void **)(v20 + 8);
        id v23 = v22;
        objc_storeStrong(v21 + 2, v22);
      }
      else
      {
        id v23 = 0;
      }
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100048C58;
      v35 = &unk_1000F6BA0;
      id v36 = v23;
      int64_t v37 = a4;
      id v24 = v23;
      v25 = +[BKSHIDUISensorMode buildModeForReason:@"estimatedProx" builder:buf];
      sub_1000486EC((uint64_t)v21, v25);
      sub_100047F64(v6, *(void **)(v6 + 64));
      v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      dispatch_source_set_timer(v26, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100048CF4;
      handler[3] = &unk_1000F8E50;
      handler[4] = v6;
      v27 = v26;
      v33 = v27;
      dispatch_source_set_event_handler(v27, handler);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100048DA4;
      v31[3] = &unk_1000F8E78;
      v31[4] = v6;
      dispatch_source_set_cancel_handler(v27, v31);
      v28 = *(void **)(v6 + 56);
      *(void *)(v6 + 56) = v27;
      v29 = v27;

      dispatch_resume(v29);
      unint64_t v6 = 0;
    }
  }
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)addSensorModeChangeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    id v7 = +[BSCompoundAssertion assertionWithIdentifier:@"BKUISensor.prox-observers"];
    id v8 = self->_observerAssertion;
    self->_observerAssertion = v7;

    observerAssertion = self->_observerAssertion;
  }
  v9 = [(id)objc_opt_class() description];
  v10 = [(BSCompoundAssertion *)observerAssertion acquireForReason:v9 withContext:v5];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)applySensorMode:(id)a3 requestOrigin:(int64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  sub_1000485DC((uint64_t)self, v7);

  if (a4 == 1 && self->_launchTimeLockedMode)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048FF4;
    block[3] = &unk_1000F8E78;
    block[4] = self;
    if (qword_100122EB8 != -1) {
      dispatch_once(&qword_100122EB8, block);
    }
    id v8 = (id)qword_100122EC0;
    sub_1000485DC((uint64_t)self, v8);

    launchTimeLockedMode = self->_launchTimeLockedMode;
    self->_launchTimeLockedMode = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)proximityDidUnoccludeAfterScreenWake
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BKHIDUISensorConfiguring *)self->_sensor proximityDidUnoccludeAfterScreenWake];

  os_unfair_lock_unlock(p_lock);
}

- (void)resetCalibration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BKHIDUISensorConfiguring *)self->_sensor resetCalibration];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return [(BKHIDUISensorConfiguring *)self->_sensor supportsProximityLPAEventTransitions];
}

- (id)sensorCharacteristics
{
  id v3 = objc_alloc_init((Class)BKSMutableHIDUISensorCharacteristics);
  [(BKHIDUISensorConfiguring *)self->_sensor updateCharacteristics:v3];

  return v3;
}

- (BKHIDUISensorController)initWithSensorConfiguration:(id)a3 displayBrightnessController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKHIDUISensorController;
  v9 = [(BKHIDUISensorController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_sensor, a3);
    objc_storeStrong((id *)&v10->_displayBrightnessController, a4);
    uint64_t v11 = +[BKSHIDUISensorMode buildModeForReason:@"backboardd launch" builder:&stru_1000F6B18];
    launchTimeLockedMode = v10->_launchTimeLockedMode;
    v10->_launchTimeLockedMode = (BKSHIDUISensorMode *)v11;

    os_unfair_lock_lock(&v10->_lock);
    sub_1000485DC((uint64_t)v10, v10->_launchTimeLockedMode);
    os_unfair_lock_unlock(&v10->_lock);
  }

  return v10;
}

+ (id)sharedInstance
{
  if (qword_100122EA8 != -1) {
    dispatch_once(&qword_100122EA8, &stru_1000F6AD8);
  }
  v2 = (void *)qword_100122EB0;

  return v2;
}

@end