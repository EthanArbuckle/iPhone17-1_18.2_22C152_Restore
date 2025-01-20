@interface BTVCLinkScanner
- (BOOL)_needActiveScan;
- (BOOL)scanCache;
- (BTVCLinkScanner)initWithType:(int64_t)a3;
- (NSData)payloadFilterData;
- (NSData)payloadFilterMask;
- (NSSet)trackedPeers;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeout;
- (id)advReportReceiveHandler;
- (id)invalidationHandler;
- (id)timeoutHandler;
- (int64_t)scanInterval;
- (int64_t)scanState;
- (int64_t)scanWindow;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_restartIfNeeded;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)_scanEnable:(BOOL)a3;
- (void)_startTimeoutIfNeeded;
- (void)_timeoutTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performUpdate:(id)a3;
- (void)scanEnable:(BOOL)a3;
- (void)setAdvReportReceiveHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadFilterData:(id)a3 mask:(id)a4;
- (void)setScanCache:(BOOL)a3;
- (void)setScanInterval:(int64_t)a3;
- (void)setScanWindow:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setTrackedPeers:(id)a3;
@end

@implementation BTVCLinkScanner

- (BTVCLinkScanner)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BTVCLinkScanner;
  v4 = [(BTVCLinkScanner *)&v8 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v5->_linktType = a3;
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_startRetrier || self->_btvcBonjourLink)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    payloadFilterData = self->_payloadFilterData;
    self->_payloadFilterData = 0;

    payloadFilterMask = self->_payloadFilterMask;
    self->_payloadFilterMask = 0;

    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0;

    ucat = self->_ucat;
    if (ucat)
    {
      if ((ucat->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucat = 0;
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)BTVCLinkScanner;
    [(BTVCLinkScanner *)&v9 dealloc];
  }
}

- (NSString)description
{
  if (self->_invalidateCalled)
  {
    NSAppendPrintF();
    id v3 = 0;
  }
  else
  {
    id v3 = 0;
  }
  if (self->_activeScan)
  {
    NSAppendPrintF();
    id v4 = v3;

    id v3 = v4;
  }
  if (self->_needDups)
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  if (self->_scanCache)
  {
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  if (self->_payloadFilterData || self->_payloadFilterMask)
  {
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }

  return (NSString *)v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)setPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
    sub_100778418((uint64_t)v6, (uint64_t)v7, v8);
  }
  id v9 = [v6 length];
  if (v9 == [v7 length])
  {
    id v10 = [v6 copy];
    id v11 = [v7 copy];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10054138C;
    v14[3] = &unk_100999680;
    v14[4] = self;
    id v12 = v10;
    id v15 = v12;
    id v16 = v11;
    id v13 = v11;
    [(BTVCLinkScanner *)self _invokeBlockActivateSafe:v14];
  }
  else
  {
    [v6 length];
    [v7 length];
    FatalErrorF();
    __break(1u);
  }
}

- (void)setTimeout:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100541448;
  v3[3] = &unk_100998A38;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  [(BTVCLinkScanner *)self _invokeBlockActivateSafe:v3];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100541564;
  v8[3] = &unk_1009A3F38;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCLinkScanner _activateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Activate\n", buf, 0xCu);
  }
  if (self->_invalidateCalled)
  {
    int v15 = -6724;
  }
  else if (self->_startRetrier)
  {
    int v15 = -6721;
  }
  else
  {
    int64_t linktType = self->_linktType;
    if ((unint64_t)(linktType - 1) > 1)
    {
      id v12 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = self->_linktType;
        if (v13 > 2) {
          v14 = "?";
        }
        else {
          v14 = off_1009B48D8[v13];
        }
        *(_DWORD *)buf = 134218242;
        v22 = (const char *)v13;
        __int16 v23 = 2080;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Activate with unsupported type: %ld (%s)\n", buf, 0x16u);
      }
      int v15 = -6735;
    }
    else
    {
      self->_btvcBonjourLinkType = linktType != 1;
      if (self->_btvcBonjourLink) {
        goto LABEL_8;
      }
      id v3 = +[BTVCLinkClient btvcLinkClient];
      objc_super v8 = [v3 addBTVCBonjourLinkDelegate:self];
      btvcBonjourLink = self->_btvcBonjourLink;
      self = (BTVCLinkScanner *)((char *)self + 136);
      self->super.isa = v8;

      if (self->super.isa)
      {
LABEL_8:
        if (!v5) {
          goto LABEL_24;
        }
        id v10 = 0;
        char v11 = 1;
        goto LABEL_22;
      }
      int v15 = -6729;
    }
  }
  id v16 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Activate failed: %d\n", buf, 8u);
  }
  if (v5)
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(), NSLocalizedDescriptionKey);
    v17 = (BTVCLinkScanner *)objc_claimAutoreleasedReturnValue();
    self = v17;
    CFStringRef v18 = @"?";
    if (v17) {
      CFStringRef v18 = (const __CFString *)v17;
    }
    CFStringRef v20 = v18;
    id v3 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v15 userInfo:v3];
    char v11 = 0;
LABEL_22:
    v5[2](v5, v10);
    if ((v11 & 1) == 0)
    {
    }
  }
LABEL_24:
}

- (void)scanEnable:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100541954;
  v6[3] = &unk_100998BB0;
  v6[4] = v4;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);
}

- (void)_scanEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    CFStringRef v20 = "-[BTVCLinkScanner _scanEnable:]";
    __int16 v21 = 1024;
    BOOL v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s scanEnable: %d\n", buf, 0x12u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  startRetrier = self->_startRetrier;
  if (v3)
  {
    if (startRetrier)
    {
LABEL_7:
      [(CURetrier *)startRetrier startDirect];
      goto LABEL_13;
    }
    BOOL v7 = (CURetrier *)objc_alloc_init((Class)CURetrier);
    objc_super v8 = self->_startRetrier;
    self->_startRetrier = v7;

    id v9 = self->_startRetrier;
    if (v9)
    {
      [(CURetrier *)v9 setDispatchQueue:self->_dispatchQueue];
      unint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      int v15 = sub_100541B98;
      id v16 = &unk_1009A0318;
      objc_copyWeak(&v17, &location);
      [(CURetrier *)self->_startRetrier setActionHandler:&v13];
      objc_destroyWeak(&v17);
      startRetrier = self->_startRetrier;
      goto LABEL_7;
    }
    id v12 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = -6729;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### scanEnable failed: %d\n", buf, 8u);
    }
  }
  else
  {
    if (startRetrier)
    {
      [(CURetrier *)startRetrier invalidateDirect];
      id v10 = self->_startRetrier;
      self->_startRetrier = 0;
    }
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink) {
      [(BTVCBonjourLink *)btvcBonjourLink stopScanningForType:1];
    }
    self->_scanStarted = 0;
  }
LABEL_13:
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100541CE8;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
      sub_1007784D4();
    }
    self->_invalidateCalled = 1;
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      id v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    startRetrier = self->_startRetrier;
    if (startRetrier)
    {
      [(CURetrier *)startRetrier invalidateDirect];
      BOOL v7 = self->_startRetrier;
      self->_startRetrier = 0;
    }
    if (self->_linktType == 2)
    {
      [(BTVCBonjourLink *)self->_btvcBonjourLink stopScanningForType:1];
      btvcBonjourLink = self->_btvcBonjourLink;
      if (btvcBonjourLink)
      {
        id v9 = +[BTVCLinkClient btvcLinkClient];
        [v9 removeBTVCBonjourLinkDelegate:self];

        btvcBonjourLink = self->_btvcBonjourLink;
      }
      self->_btvcBonjourLink = 0;
    }
    else
    {
      id v10 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t linktType = self->_linktType;
        if (linktType > 2) {
          id v12 = "?";
        }
        else {
          id v12 = off_1009B48D8[linktType];
        }
        int v16 = 134218242;
        unint64_t v17 = linktType;
        __int16 v18 = 2080;
        uint64_t v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Invalidate unsupported type: %ld (%s)\n", (uint8_t *)&v16, 0x16u);
      }
    }
    self->_scanStarted = 0;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
      sub_1007784A0();
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v14 = self->_invalidationHandler;
    }
    else
    {
      id v14 = 0;
    }
    self->_id invalidationHandler = 0;

    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0;
  }
}

- (void)performUpdate:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100541FF8;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  v4[2](v4);
  id v6 = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100542008;
  v7[3] = &unk_100997450;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10054211C;
    v7[3] = &unk_100999608;
    v7[4] = v5;
    objc_super v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

- (BOOL)_needActiveScan
{
  return 0;
}

- (void)_restartIfNeeded
{
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[BTVCLinkScanner _restartIfNeeded:]";
    __int16 v27 = 1024;
    LODWORD(v28) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s inForce: %d\n", buf, 0x12u);
  }
  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    id v9 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t linktType = self->_linktType;
      if (linktType > 2) {
        char v11 = "?";
      }
      else {
        char v11 = off_1009B48D8[linktType];
      }
      *(_DWORD *)buf = 134218242;
      v26 = (const char *)linktType;
      __int16 v27 = 2080;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Restart unsupported type: %ld (%s)\n", buf, 0x16u);
    }
    uint64_t v13 = qword_100A19FE8;
    if (!os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = -6735;
    id v14 = "Warning: [BTVCLinkScanner] ### RestartIfNeeded failed: %d\n";
    int v15 = v13;
    uint32_t v16 = 8;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  btvcBonjourLink = self->_btvcBonjourLink;
  if (!btvcBonjourLink) {
    return;
  }
  if (self->_scanCache && self->_scanStarted)
  {
    uint64_t v23 = qword_100A19FE8;
    if (!os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v14 = "[BTVCLinkScanner] Scan restart skipped while scan cache scanning\n";
    int v15 = v23;
    uint32_t v16 = 2;
    goto LABEL_20;
  }
  unint64_t v7 = [(BTVCBonjourLink *)btvcBonjourLink state];
  if (v7 == 3)
  {
    if (v3)
    {
      BOOL scanStarted = self->_scanStarted;
    }
    else
    {
      if (self->_scanStarted)
      {
        id v12 = qword_100A19FE8;
        if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Scan restart skipped when unchanged\n", buf, 2u);
        }
        goto LABEL_29;
      }
      BOOL scanStarted = 0;
    }
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
      sub_10077853C();
    }
    if (scanStarted && v3)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
        sub_100778508();
      }
      [(BTVCBonjourLink *)self->_btvcBonjourLink stopScanningForType:self->_btvcBonjourLinkType];
    }
    BYTE1(v24) = self->_scanCache;
    LOBYTE(v24) = self->_needDups;
    -[BTVCBonjourLink startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](self->_btvcBonjourLink, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", self->_btvcBonjourLinkType, self->_payloadFilterData, self->_payloadFilterMask, 0, 10, 0, v24, 0);
    unint64_t v17 = (NSData *)[(NSData *)self->_payloadFilterData copy];
    scanParamFilterData = self->_scanParamFilterData;
    self->_scanParamFilterData = v17;

    uint64_t v19 = (NSData *)[(NSData *)self->_payloadFilterMask copy];
    scanParamFilterMask = self->_scanParamFilterMask;
    self->_scanParamFilterMask = v19;

    self->_scanParamDups = self->_needDups;
    self->_scanParamCache = self->_scanCache;
LABEL_29:
    self->_BOOL scanStarted = 1;
    [(CURetrier *)self->_startRetrier succeededDirect];
    return;
  }
  uint64_t v21 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 5) {
      BOOL v22 = "?";
    }
    else {
      BOOL v22 = off_1009B48A8[v7];
    }
    *(_DWORD *)buf = 136315138;
    v26 = v22;
    id v14 = "[BTVCLinkScanner] Scan start deferred while in Bluetooth state: %s\n";
    int v15 = v21;
    uint32_t v16 = 12;
    goto LABEL_20;
  }
}

- (void)_startTimeoutIfNeeded
{
  if (!self->_timeoutFired && self->_timeout > 0.0 && !self->_timeoutTimer)
  {
    BOOL v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      double timeout = self->_timeout;
      *(_DWORD *)buf = 134217984;
      double v13 = timeout;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Start timeout timer for %f seconds\n", buf, 0xCu);
    }
    id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v5;

    unint64_t v7 = self->_timeoutTimer;
    if (!v7) {
      FatalErrorF();
    }
    unint64_t v8 = (unint64_t)(self->_timeout * 1000000000.0);
    dispatch_time_t v9 = dispatch_time(0, v8);
    dispatch_source_set_timer(v7, v9, v8, v8 >> 2);
    id v10 = self->_timeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1005426B8;
    handler[3] = &unk_100997450;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)_timeoutTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Timeout timer fired\n", v9, 2u);
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    id v8 = self->_timeoutHandler;
  }
  else
  {
    id v8 = 0;
  }
  self->_id timeoutHandler = 0;
}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  id v4 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v6 = btvcBonjourLink == v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    unint64_t v7 = [(BTVCBonjourLink *)v4 state];
    id v8 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_INFO))
    {
      if (v7 > 5) {
        dispatch_time_t v9 = "?";
      }
      else {
        dispatch_time_t v9 = off_1009B48F0[v7];
      }
      int v10 = 136315138;
      char v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[BTVCLinkScanner] Bluetooth state updated: %s\n", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  BOOL v6 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v8 = btvcBonjourLink == v6;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && self->_btvcBonjourLinkType == a4)
  {
    dispatch_time_t v9 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Bluetooth scanning started\n", v10, 2u);
    }
    if (self->_scanState != 1) {
      self->_scanState = 1;
    }
    [(BTVCLinkScanner *)self _startTimeoutIfNeeded];
  }
}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  BOOL v8 = (BTVCBonjourLink *)a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v11 = btvcBonjourLink == v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && self->_btvcBonjourLinkType == a4)
  {
    id v12 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkScanner] ### Bluetooth scan failed: %@\n", (uint8_t *)&v13, 0xCu);
    }
    self->_BOOL scanStarted = 0;
    [(CURetrier *)self->_startRetrier failedDirect];
  }
}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v12 = (BTVCBonjourLink *)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v12 && self->_btvcBonjourLinkType == a4)
  {
    unint64_t v17 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109890;
      v23[1] = a4;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] DiscoverType %d, data:%@ peer:%@ peerInfo:%@\n", (uint8_t *)v23, 0x26u);
    }
    __int16 v18 = [(BTVCLinkScanner *)self advReportReceiveHandler];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      uint64_t v20 = [(BTVCLinkScanner *)self advReportReceiveHandler];
      uint64_t v21 = (void *)v20;
      if (a4 == 1) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 1;
      }
      (*(void (**)(uint64_t, uint64_t, id, id, id))(v20 + 16))(v20, v22, v13, v14, v15);
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  int v5 = a5;
  id v7 = a4;
  BOOL v8 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BTVCLinkScanner] Lose peer device:%@, link type:%d\n", (uint8_t *)&v9, 0x12u);
  }
  [(BTVCLinkScanner *)self _restartIfNeeded:1];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSData)payloadFilterData
{
  return self->_payloadFilterData;
}

- (NSData)payloadFilterMask
{
  return self->_payloadFilterMask;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (int64_t)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(int64_t)a3
{
  self->_scanInterval = a3;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (int64_t)scanWindow
{
  return self->_scanWindow;
}

- (void)setScanWindow:(int64_t)a3
{
  self->_scanWindow = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (NSSet)trackedPeers
{
  return self->_trackedPeers;
}

- (void)setTrackedPeers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPeers, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_payloadFilterMask, 0);
  objc_storeStrong((id *)&self->_payloadFilterData, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_advReportReceiveHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_scanParamPeers, 0);
  objc_storeStrong((id *)&self->_scanParamFilterMask, 0);
  objc_storeStrong((id *)&self->_scanParamFilterData, 0);
  objc_storeStrong((id *)&self->_trackedPeersApplied, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_startRetrier, 0);
}

@end