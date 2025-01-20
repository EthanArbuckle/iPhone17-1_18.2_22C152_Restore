@interface BTVCLinkAdvertiser
- (BTVCLinkAdvertiser)initWithType:(int64_t)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (id)advertiseStateChangedHandler;
- (id)invalidationHandler;
- (int)_preparePayload:(BOOL)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_advertisingEnable:(BOOL)a3;
- (void)_invalidate;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)activateWithCompletion:(id)a3;
- (void)advertisingEnable:(BOOL)a3;
- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 error:(id)a5;
- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)setAdvertiseStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setPayloadFields:(id)a3;
@end

@implementation BTVCLinkAdvertiser

- (BTVCLinkAdvertiser)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BTVCLinkAdvertiser;
  v4 = [(BTVCLinkAdvertiser *)&v8 init];
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
  if (self->_startRetrier)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
    self->_id advertiseStateChangedHandler = 0;

    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    payloadDataCurrent = self->_payloadDataCurrent;
    self->_payloadDataCurrent = 0;

    payloadDataPrevious = self->_payloadDataPrevious;
    self->_payloadDataPrevious = 0;

    payloadFields = self->_payloadFields;
    self->_payloadFields = 0;

    payloadIdentifier = self->_payloadIdentifier;
    self->_payloadIdentifier = 0;

    v10.receiver = self;
    v10.super_class = (Class)BTVCLinkAdvertiser;
    [(BTVCLinkAdvertiser *)&v10 dealloc];
  }
}

- (NSString)description
{
  NSAppendPrintF();
  id v3 = 0;
  v4 = v3;
  if (self->_invalidateCalled)
  {
    objc_super v8 = v3;
    NSAppendPrintF();
    id v5 = v8;

    v4 = v5;
  }
  NSAppendPrintF();
  id v6 = v4;

  return (NSString *)v6;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
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

- (void)setPayloadData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002E344C;
  v13[3] = &unk_100998510;
  v13[4] = v6;
  id v7 = v5;
  id v14 = v7;
  objc_super v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002E34A4;
    v11[3] = &unk_100999608;
    v11[4] = v6;
    v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }

  objc_sync_exit(v6);
}

- (void)setPayloadFields:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002E3688;
  v13[3] = &unk_100998510;
  v13[4] = v6;
  id v7 = v5;
  id v14 = v7;
  objc_super v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002E36E0;
    v11[3] = &unk_100999608;
    v11[4] = v6;
    v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }

  objc_sync_exit(v6);
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
  v8[2] = sub_1002E3800;
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
  id v6 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t linktType = self->_linktType;
    if (linktType > 2) {
      objc_super v8 = "?";
    }
    else {
      objc_super v8 = off_1009A3F78[linktType];
    }
    *(_DWORD *)buf = 136315650;
    v21 = "-[BTVCLinkAdvertiser _activateWithCompletion:]";
    __int16 v22 = 2048;
    unint64_t v23 = linktType;
    __int16 v24 = 2080;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %ld (%s)\n", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int v14 = -6724;
  }
  else if (self->_startRetrier)
  {
    int v14 = -6721;
  }
  else
  {
    int64_t v9 = self->_linktType;
    if ((unint64_t)(v9 - 1) > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
        sub_1007540EC();
      }
      int v14 = -6735;
    }
    else
    {
      self->_btvcBonjourLinkType = v9 != 1;
      if (self->_btvcBonjourLink) {
        goto LABEL_11;
      }
      id v3 = +[BTVCLinkClient btvcLinkClient];
      objc_super v10 = [v3 addBTVCBonjourLinkDelegate:self];
      btvcBonjourLink = self->_btvcBonjourLink;
      self = (BTVCLinkAdvertiser *)((char *)self + 80);
      self->super.isa = v10;

      if (self->super.isa)
      {
LABEL_11:
        if (!v5) {
          goto LABEL_24;
        }
        v12 = 0;
        char v13 = 1;
        goto LABEL_22;
      }
      int v14 = -6729;
    }
  }
  v15 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### Activate failed: %d\n", buf, 8u);
  }
  if (v5)
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(), NSLocalizedDescriptionKey);
    v16 = (BTVCLinkAdvertiser *)objc_claimAutoreleasedReturnValue();
    self = v16;
    CFStringRef v17 = @"?";
    if (v16) {
      CFStringRef v17 = (const __CFString *)v16;
    }
    CFStringRef v19 = v17;
    id v3 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v14 userInfo:v3];
    char v13 = 0;
LABEL_22:
    v5[2](v5, v12);
    if ((v13 & 1) == 0)
    {
    }
  }
LABEL_24:
}

- (void)advertisingEnable:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002E3BCC;
  v6[3] = &unk_100998BB0;
  v6[4] = v4;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);
}

- (void)_advertisingEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL advertisingEnabled = self->_advertisingEnabled;
    *(_DWORD *)buf = 67109376;
    int v23 = advertisingEnabled;
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] _advertisingEnabled:%d inEnable: %d\n", buf, 0xEu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_advertisingEnabled != v3)
  {
    self->_BOOL advertisingEnabled = v3;
    if (v3)
    {
      if (self->_payloadFields)
      {
        BOOL v7 = (CURetrier *)objc_alloc_init((Class)CURetrier);
        startRetrier = self->_startRetrier;
        self->_startRetrier = v7;

        int64_t v9 = self->_startRetrier;
        if (!v9)
        {
          uint64_t v15 = qword_100A19FE8;
          if (!os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 67109120;
          int v23 = -6729;
          char v13 = "Warning: [BTVCLinkAdvertiser] ### scanEnable failed: %d\n";
          int v14 = v15;
          goto LABEL_11;
        }
        [(CURetrier *)v9 setDispatchQueue:self->_dispatchQueue];
        v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472;
        uint64_t v18 = sub_1002E3E54;
        CFStringRef v19 = &unk_1009A0318;
        objc_copyWeak(&v20, &location);
        [(CURetrier *)self->_startRetrier setActionHandler:&v16];
        objc_destroyWeak(&v20);
        [(CURetrier *)self->_startRetrier startDirect];
      }
    }
    else
    {
      [(CURetrier *)self->_startRetrier invalidateDirect];
      objc_super v10 = self->_startRetrier;
      self->_startRetrier = 0;

      [(BTVCBonjourLink *)self->_btvcBonjourLink stopAdvertisingOfType:1];
    }
    uint64_t v11 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = self->_advertisingEnabled;
      *(_DWORD *)buf = 67109120;
      int v23 = v12;
      char v13 = "[BTVCLinkAdvertiser] complete _advertisingEnabled:%d\n";
      int v14 = v11;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, 8u);
    }
  }
LABEL_12:
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E3FA4;
  block[3] = &unk_100997450;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  BOOL v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
    sub_10075422C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  self->_invalidateCalled = 1;
  [(CURetrier *)self->_startRetrier invalidateDirect];
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  int64_t linktType = self->_linktType;
  if (linktType == 2)
  {
    [(BTVCBonjourLink *)self->_btvcBonjourLink stopAdvertisingOfType:1];
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink)
    {
LABEL_9:
      int v14 = +[BTVCLinkClient btvcLinkClient];
      [v14 removeBTVCBonjourLinkDelegate:self];

      btvcBonjourLink = self->_btvcBonjourLink;
    }
  }
  else
  {
    if (linktType != 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
        sub_1007541A8();
      }
      goto LABEL_13;
    }
    [(BTVCBonjourLink *)self->_btvcBonjourLink stopAdvertisingOfType:0];
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink) {
      goto LABEL_9;
    }
  }
  self->_btvcBonjourLink = 0;

LABEL_13:
  uint64_t v15 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
    sub_100754170(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  id invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_id advertiseStateChangedHandler = 0;

  id v25 = self->_invalidationHandler;
  self->_id invalidationHandler = 0;
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
    sub_1007542E8(v3, v5);
  }
  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
      sub_100754264();
    }
    int v8 = -6735;
  }
  else
  {
    btvcBonjourLink = self->_btvcBonjourLink;
    if (!btvcBonjourLink || (id)[(BTVCBonjourLink *)btvcBonjourLink state] != (id)3) {
      return;
    }
    unsigned int v7 = [(BTVCLinkAdvertiser *)self _preparePayload:v3];
    int v8 = v7;
    if (v7 == -6757)
    {
LABEL_14:
      [(CURetrier *)self->_startRetrier succeededDirect];
      return;
    }
    if (!v7)
    {
      if (self->_payloadDataCurrent)
      {
        uint64_t v9 = qword_100A19FE8;
        if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = "no";
          payloadDataCurrent = self->_payloadDataCurrent;
          if (v3) {
            uint64_t v10 = "yes";
          }
          int v13 = 138412546;
          int v14 = payloadDataCurrent;
          __int16 v15 = 2080;
          uint64_t v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Advertise update: data '%@', force %s\n", (uint8_t *)&v13, 0x16u);
        }
        [(BTVCBonjourLink *)self->_btvcBonjourLink stopAdvertisingOfType:self->_btvcBonjourLinkType];
        [(BTVCBonjourLink *)self->_btvcBonjourLink startAdvertisingOfType:self->_btvcBonjourLinkType withData:self->_payloadDataCurrent];
        goto LABEL_14;
      }
      int v8 = -6745;
    }
  }
  BOOL v12 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### RestartIfNeeded failed: %d\n", (uint8_t *)&v13, 8u);
  }
}

- (int)_preparePayload:(BOOL)a3
{
  p_payloadDataCurrent = &self->_payloadDataCurrent;
  if (!self->_payloadDataCurrent)
  {
    int64_t linktType = self->_linktType;
    if (linktType == 2 || linktType == 1)
    {
      objc_storeStrong((id *)&self->_payloadDataCurrent, self->_payloadFields);
    }
    else
    {
      unsigned int v7 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: [BTVCLinkAdvertiser] ### Skipping unsupported payload type\n", v17, 2u);
      }
    }
  }
  if (!a3
    && self->_payloadDataPrevious
    && (-[NSArray isEqual:](*p_payloadDataCurrent, "isEqual:") & 1) != 0)
  {
    int v8 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEBUG)) {
      sub_100754378(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return -6757;
  }
  else
  {
    objc_storeStrong((id *)&self->_payloadDataPrevious, self->_payloadDataCurrent);
    return 0;
  }
}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  uint64_t v4 = (BTVCBonjourLink *)a3;
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
    int v8 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_INFO))
    {
      if (v7 > 5) {
        uint64_t v9 = "?";
      }
      else {
        uint64_t v9 = off_1009A3F90[v7];
      }
      int v10 = 136315138;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[BTVCLinkAdvertiser] Bluetooth state updated: %s\n", (uint8_t *)&v10, 0xCu);
    }
    if (v7 == 3) {
      [(BTVCLinkAdvertiser *)self _restartIfNeeded:1];
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
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
  if (!v8 || self->_btvcBonjourLinkType != a4) {
    goto LABEL_16;
  }
  int64_t advertiseState = self->_advertiseState;
  int v10 = qword_100A19FE8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT);
  if (advertiseState == 2)
  {
    if (v11)
    {
      __int16 v16 = 0;
      uint64_t v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started after being deferred\n";
      uint64_t v13 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    __int16 v15 = 0;
    uint64_t v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started\n";
    uint64_t v13 = (uint8_t *)&v15;
    goto LABEL_12;
  }
  if (self->_advertiseState != 1)
  {
    self->_int64_t advertiseState = 1;
    id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler) {
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 1);
    }
  }
LABEL_16:
}

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
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
    uint64_t v12 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Bluetooth advertising stopped: %@\n", (uint8_t *)&v14, 0xCu);
    }
    if (self->_advertiseState)
    {
      self->_int64_t advertiseState = 0;
      id advertiseStateChangedHandler = (void (**)(id, void))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 0);
      }
    }
  }
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
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
  if (v8 && self->_btvcBonjourLinkType == a4 && self->_advertiseState != 2)
  {
    id v9 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] Bluetooth advertising deferred\n", v11, 2u);
    }
    self->_int64_t advertiseState = 2;
    id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler) {
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 2);
    }
  }
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
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
    uint64_t v12 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] ### Bluetooth advertise failed: %@\n", (uint8_t *)&v14, 0xCu);
    }
    [(CURetrier *)self->_startRetrier failedDirect];
    if (self->_advertiseState != 3)
    {
      self->_int64_t advertiseState = 3;
      id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 3);
      }
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 error:(id)a5
{
  BOOL v8 = (BTVCBonjourLink *)a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v8)
  {
    uint64_t v12 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] DidConnectToPeer: %@, %@\n", (uint8_t *)&v14, 0x16u);
    }
    if (v10)
    {
      uint64_t v13 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v9;
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[BTVCLinkAdvertiser] ### Accept connection from peer %@ failed: %@\n", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (id)advertiseStateChangedHandler
{
  return self->_advertiseStateChangedHandler;
}

- (void)setAdvertiseStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_advertiseStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadFields, 0);
  objc_storeStrong((id *)&self->_payloadDataPrevious, 0);

  objc_storeStrong((id *)&self->_payloadDataCurrent, 0);
}

@end