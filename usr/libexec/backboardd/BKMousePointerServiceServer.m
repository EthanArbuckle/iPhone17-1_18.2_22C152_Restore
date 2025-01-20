@interface BKMousePointerServiceServer
- (BOOL)_accessStateForReason:(id)a3 entitlement:(id)a4 logEntitlementOnFailure:(BOOL)a5 usingBlock:(id)a6;
- (id)_perDisplayClientInfoForCurrentConnectionWithDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_pointerDevicesFromIOHIDServices:(id)a3;
- (id)globalDevicePreferences;
- (id)globalPointerPosition;
- (id)normalizedGlobalPointerPosition;
- (id)preferencesForDevice:(id)a3;
- (id)setMousePointerDeviceObservationEnabled:(id)a3;
- (void)_assertModelUpdatesSuppressed:(BOOL)a3 displayUUID:(id)a4 clientDisplayInfo:(id)a5;
- (void)_queue_removeConnection:(id)a3;
- (void)acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 onDisplay:(id)a6 restrictingToPID:(id)a7;
- (void)activateWithMousePointerController:(id)a3;
- (void)applyAssertionParametersOnDisplay:(id)a3 withOptionsMask:(id)a4;
- (void)dealloc;
- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6;
- (void)invalidateButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 onDisplay:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3;
- (void)pointingDevicesDidChange:(id)a3;
- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(id)a6;
- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(id)a6 restrictingToPID:(id)a7;
- (void)setGlobalDevicePreferences:(id)a3;
- (void)setGlobalPointerEventRoutes:(id)a3 forDisplay:(id)a4;
- (void)setGlobalPointerPosition:(id)a3;
- (void)setMousePointerPreferenceObservationEnabled:(id)a3;
- (void)setPointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5;
- (void)setPreferences:(id)a3 forDevice:(id)a4;
- (void)setSuppressAllEvents:(id)a3;
@end

@implementation BKMousePointerServiceServer

- (id)_pointerDevicesFromIOHIDServices:(id)a3
{
  v3 = [a3 bs_compactMap:&stru_1000F5A98];
  v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (id)setMousePointerDeviceObservationEnabled:(id)a3
{
  id v4 = a3;
  v5 = +[BSServiceConnection currentContext];
  unsigned int v6 = [v4 BOOLValue];

  if (v6 == [(NSMutableSet *)self->_deviceObservingConnections containsObject:v5]) {
    goto LABEL_7;
  }
  deviceObservingConnections = self->_deviceObservingConnections;
  if (!v6)
  {
    [(NSMutableSet *)deviceObservingConnections removeObject:v5];
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!deviceObservingConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_deviceObservingConnections;
    self->_deviceObservingConnections = v8;

    deviceObservingConnections = self->_deviceObservingConnections;
  }
  [(NSMutableSet *)deviceObservingConnections addObject:v5];
  v10 = [(BKMousePointerController *)self->_mousePointerController availableDevices];
  v11 = [(BKMousePointerServiceServer *)self _pointerDevicesFromIOHIDServices:v10];

LABEL_8:

  return v11;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = BKLogMousePointer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received Connection: %{public}@", buf, 0xCu);
  }

  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100003D20;
  v12 = &unk_1000F5D58;
  v13 = self;
  id v14 = v6;
  id v8 = v6;
  [v8 configureConnection:&v9];
  [v8 activate:v9, v10, v11, v12, v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferenceObservingConnections, 0);
  objc_storeStrong((id *)&self->_deviceObservingConnections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);

  objc_storeStrong((id *)&self->_mousePointerController, 0);
}

- (BOOL)_accessStateForReason:(id)a3 entitlement:(id)a4 logEntitlementOnFailure:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, BKMousePointerController *, id, void *))a6;
  v13 = +[BSServiceConnection currentContext];
  id v14 = [v13 userInfo];
  uint64_t v15 = objc_opt_class();
  id v16 = v14;
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  unsigned int v19 = [v18 hasEntitlement:v11];
  if (!v19)
  {
    v20 = BKLogMousePointer();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v21)
      {
        v22 = [v13 remoteProcess];
        int v27 = 138543874;
        v28 = v22;
        __int16 v29 = 2114;
        id v30 = v10;
        __int16 v31 = 2114;
        id v32 = v11;
        v23 = "process %{public}@ attempted to %{public}@ but does not have the %{public}@ entitlement";
        v24 = v20;
        uint32_t v25 = 32;
LABEL_15:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, v25);
      }
    }
    else if (v21)
    {
      v22 = [v13 remoteProcess];
      int v27 = 138543618;
      v28 = v22;
      __int16 v29 = 2114;
      id v30 = v10;
      v23 = "process %{public}@ attempted to %{public}@ but is not allowed";
      v24 = v20;
      uint32_t v25 = 22;
      goto LABEL_15;
    }

    goto LABEL_13;
  }
  v12[2](v12, self->_mousePointerController, v18, v13);
LABEL_13:

  return v19;
}

- (void)_assertModelUpdatesSuppressed:(BOOL)a3 displayUUID:(id)a4 clientDisplayInfo:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[BSServiceConnection currentContext];
  id v11 = [v10 remoteProcess];
  id v12 = [v11 pid];

  uint64_t v13 = [v9 modelUpdateAssertion];
  id v14 = (void *)v13;
  if (v6 || !v13)
  {
    id v16 = BKLogMousePointer();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v14)
    {
      if (v17)
      {
        *(_DWORD *)buf = 67109634;
        int v22 = v6;
        __int16 v23 = 1024;
        *(_DWORD *)v24 = v12;
        *(_WORD *)&v24[4] = 2114;
        *(void *)&v24[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Assert model updates suppression change no-op (%{BOOL}u}) by pid:%d for displayUUID: %{public}@", buf, 0x18u);
      }
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 67109378;
        int v22 = (int)v12;
        __int16 v23 = 2114;
        *(void *)v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Assert model updates suppressed by pid:%d for displayUUID: %{public}@", buf, 0x12u);
      }

      mousePointerController = self->_mousePointerController;
      unsigned int v19 = +[NSString stringWithFormat:@"pid %d", v12];
      v20 = [(BKMousePointerController *)mousePointerController suppressPointerModelUpdatesAssertionForDisplay:v8 reason:v19];

      [v9 setModelUpdateAssertion:v20];
    }
  }
  else
  {
    uint64_t v15 = BKLogMousePointer();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v22 = (int)v12;
      __int16 v23 = 2114;
      *(void *)v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Assert model updates no longer suppressed by pid:%d for displayUUID: %{public}@", buf, 0x12u);
    }

    [v14 invalidate];
    [v9 setModelUpdateAssertion:0];
  }
}

- (id)_perDisplayClientInfoForCurrentConnectionWithDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = +[BSServiceConnection currentContext];
  BOOL v7 = [v6 userInfo];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 infoForDisplayUUID:v5 createIfNeeded:v4];

  return v12;
}

- (void)_queue_removeConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = BKLogMousePointer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection: Remove: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  BOOL v6 = +[BSServiceConnection currentContext];
  BOOL v7 = [v6 remoteProcess];
  id v8 = [v7 pid];

  [(BKMousePointerController *)self->_mousePointerController stopRoutingGlobalEventsForPID:v8];
  [(BKMousePointerController *)self->_mousePointerController setEventsDisabled:0 pid:v8];
  id v9 = [v6 userInfo];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v13 perDisplayUUIDInfo];
    [v14 enumerateKeysAndObjectsUsingBlock:&stru_1000F5AD8];
  }
  [(NSMutableSet *)self->_deviceObservingConnections removeObject:v4];
  [(NSMutableSet *)self->_preferenceObservingConnections removeObject:v4];
}

- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F02C;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setGlobalDevicePreferences:(id)a3
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = BKPointerPreferencesEntitlement;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F214;
  v9[3] = &unk_1000F59B0;
  id v10 = v5;
  id v8 = v5;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v6 entitlement:v7 logEntitlementOnFailure:1 usingBlock:v9];
}

- (id)globalDevicePreferences
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10001F358;
  id v11 = sub_10001F368;
  id v12 = 0;
  v3 = NSStringFromSelector(a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F370;
  v6[3] = &unk_1000F58F0;
  v6[4] = self;
  v6[5] = &v7;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v3 entitlement:BKPointerPreferencesEntitlement logEntitlementOnFailure:1 usingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = NSStringFromSelector(a2);
  uint64_t v10 = BKPointerPreferencesEntitlement;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F4B8;
  v13[3] = &unk_1000F5A00;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v9 entitlement:v10 logEntitlementOnFailure:1 usingBlock:v13];
}

- (id)preferencesForDevice:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = sub_10001F358;
  id v18 = sub_10001F368;
  id v19 = 0;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = BKPointerPreferencesEntitlement;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F630;
  v11[3] = &unk_1000F5A50;
  id v13 = &v14;
  v11[4] = self;
  id v8 = v5;
  id v12 = v8;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v6 entitlement:v7 logEntitlementOnFailure:1 usingBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setMousePointerPreferenceObservationEnabled:(id)a3
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = BKPointerPreferencesEntitlement;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F750;
  v9[3] = &unk_1000F5A00;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v6 entitlement:v7 logEntitlementOnFailure:1 usingBlock:v9];
}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = NSStringFromSelector(a2);
  uint64_t v16 = BKPointerHitTestingEntitlement;
  uint32_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  int v27 = sub_10001FAA0;
  v28 = &unk_1000F5A28;
  SEL v34 = a2;
  __int16 v29 = self;
  id v17 = v11;
  id v30 = v17;
  id v18 = v12;
  id v31 = v18;
  id v19 = v13;
  id v32 = v19;
  id v20 = v14;
  id v33 = v20;
  unsigned __int8 v21 = [(BKMousePointerServiceServer *)self _accessStateForReason:v15 entitlement:v16 logEntitlementOnFailure:1 usingBlock:&v25];

  if (v20 && (v21 & 1) == 0)
  {
    NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
    int v22 = +[NSString stringWithFormat:@"missing entitlement: %@", v16, v25, v26, v27, v28, v29, v30, v31, v32];
    v36 = v22;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v23];

    (*((void (**)(id, void, void, void *))v20 + 2))(v20, 0, 0, v24);
  }
}

- (void)setGlobalPointerEventRoutes:(id)a3 forDisplay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSStringFromSelector(a2);
  uint64_t v10 = BKPointerGlobalEventRoutingEntitlement;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001FD38;
  v13[3] = &unk_1000F5A00;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v9 entitlement:v10 logEntitlementOnFailure:1 usingBlock:v13];
}

- (void)invalidateButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 onDisplay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = NSStringFromSelector(a2);
    uint64_t v10 = BKPointerRepositioningEntitlement;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001FEE4;
    v11[3] = &unk_1000F5A00;
    id v12 = v8;
    id v13 = v7;
    [(BKMousePointerServiceServer *)self _accessStateForReason:v9 entitlement:v10 logEntitlementOnFailure:1 usingBlock:v11];
  }
}

- (void)acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 onDisplay:(id)a6 restrictingToPID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14 && v13 && v15)
  {
    id v18 = NSStringFromSelector(a2);
    uint64_t v19 = BKPointerRepositioningEntitlement;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000201DC;
    v21[3] = &unk_1000F59D8;
    int v22 = v17;
    id v23 = v16;
    id v24 = v13;
    uint32_t v25 = self;
    id v26 = v14;
    id v27 = v15;
    [(BKMousePointerServiceServer *)self _accessStateForReason:v18 entitlement:v19 logEntitlementOnFailure:1 usingBlock:v21];

    id v20 = v22;
  }
  else
  {
    id v20 = BKLogMousePointer();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v29 = v13;
      __int16 v30 = 2114;
      id v31 = v15;
      __int16 v32 = 2114;
      id v33 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "nil arguments to acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }
}

- (void)setSuppressAllEvents:(id)a3
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = BKPointerGlobalEventRoutingEntitlement;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002041C;
  v9[3] = &unk_1000F59B0;
  id v10 = v5;
  id v8 = v5;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v6 entitlement:v7 logEntitlementOnFailure:1 usingBlock:v9];
}

- (void)applyAssertionParametersOnDisplay:(id)a3 withOptionsMask:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)[a4 unsignedIntegerValue];
  id v8 = v6;
  id v9 = [v8 length];
  id v10 = (void *)BKSDisplayUUIDMainKey;
  if (v9) {
    id v10 = v8;
  }
  id v12 = v10;

  id v11 = [(BKMousePointerServiceServer *)self _perDisplayClientInfoForCurrentConnectionWithDisplayUUID:v12 createIfNeeded:1];
  [(BKMousePointerServiceServer *)self _assertModelUpdatesSuppressed:(v7 >> 1) & 1 displayUUID:v12 clientDisplayInfo:v11];
}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(id)a6 restrictingToPID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = NSStringFromSelector(a2);
  uint64_t v19 = BKPointerRepositioningEntitlement;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100020748;
  v25[3] = &unk_1000F5988;
  id v26 = v17;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v17;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v18 entitlement:v19 logEntitlementOnFailure:1 usingBlock:v25];
}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = NSStringFromSelector(a2);
  uint64_t v16 = BKPointerRepositioningEntitlement;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100020948;
  v21[3] = &unk_1000F5960;
  id v22 = v14;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v15 entitlement:v16 logEntitlementOnFailure:1 usingBlock:v21];
}

- (void)setPointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NSStringFromSelector(a2);
  uint64_t v13 = BKPointerRepositioningEntitlement;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100020B0C;
  v17[3] = &unk_1000F5938;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v14 = v11;
  id v15 = v9;
  id v16 = v10;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v12 entitlement:v13 logEntitlementOnFailure:1 usingBlock:v17];
}

- (void)setGlobalPointerPosition:(id)a3
{
  [a3 bs_CGPointValue];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  id v9 = NSStringFromSelector(a2);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100020CA8;
  v10[3] = &unk_1000F5910;
  v10[4] = v6;
  v10[5] = v8;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v9 entitlement:BKPointerAutomationEntitlement logEntitlementOnFailure:0 usingBlock:v10];
}

- (id)normalizedGlobalPointerPosition
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v10 = &unk_1000E0DB5;
  v3 = NSStringFromSelector(a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020E40;
  v6[3] = &unk_1000F58F0;
  v6[4] = self;
  v6[5] = &v7;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v3 entitlement:BKPointerAutomationEntitlement logEntitlementOnFailure:0 usingBlock:v6];

  id v4 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", v8[4], v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)globalPointerPosition
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v10 = &unk_1000E0DB5;
  v3 = NSStringFromSelector(a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020F9C;
  v6[3] = &unk_1000F58F0;
  v6[4] = self;
  v6[5] = &v7;
  [(BKMousePointerServiceServer *)self _accessStateForReason:v3 entitlement:BKPointerAutomationEntitlement logEntitlementOnFailure:0 usingBlock:v6];

  id v4 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", v8[4], v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)pointingDevicesDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021070;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)activateWithMousePointerController:(id)a3
{
  objc_storeStrong((id *)&self->_mousePointerController, a3);
  id v5 = a3;
  id v6 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
  queue = self->_queue;
  self->_queue = v6;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002127C;
  v10[3] = &unk_1000F8FB0;
  v10[4] = self;
  id v8 = +[BSServiceConnectionListener listenerWithConfigurator:v10];
  connectionListener = self->_connectionListener;
  self->_connectionListener = v8;

  [(BSServiceConnectionListener *)self->_connectionListener activate];
}

- (void)dealloc
{
  if (self->_connectionListener)
  {
    id v4 = +[NSString stringWithFormat:@"must invoke invalidate before deallocating BKMousePointerServiceServer"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKMousePointerServiceServer.m";
      __int16 v17 = 1024;
      int v18 = 112;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100021464);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKMousePointerServiceServer;
  [(BKMousePointerServiceServer *)&v8 dealloc];
}

@end