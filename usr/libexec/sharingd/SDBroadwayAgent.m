@interface SDBroadwayAgent
+ (id)sharedAgent;
- (BOOL)_uiShowing;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDBroadwayAgent)init;
- (void)_applePayCardDectected:(id)a3;
- (void)_invalidate;
- (void)_preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4;
- (void)_startUIWithPhysicalCard:(id)a3 activationCode:(id)a4 testInfo:(id)a5;
- (void)activate;
- (void)invalidate;
- (void)lookUpValidAccountWithBroadwayActivationCode:(id)a3 testInfo:(id)a4;
- (void)lookupPhysicalCardWithBroadwayActivationCode:(id)a3 testInfo:(id)a4;
- (void)preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SDBroadwayAgent

+ (id)sharedAgent
{
  if (qword_100980060 != -1) {
    dispatch_once(&qword_100980060, &stru_1008CDB78);
  }
  v2 = (void *)qword_100980068;

  return v2;
}

- (SDBroadwayAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDBroadwayAgent;
  v2 = [(SDBroadwayAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSString)description
{
  id v2 = objc_alloc_init((Class)NSMutableString);
  [v2 appendFormat:@"-- SDBroadwayAgent --"];
  if (byte_1009942CC) {
    uint64_t v3 = "yes";
  }
  else {
    uint64_t v3 = "no";
  }
  [v2 appendFormat:@"Suppressed: %s", v3];

  return (NSString *)v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125F54;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126088;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (BOOL)_uiShowing
{
  return self->_alertHandle != 0;
}

- (void)_applePayCardDectected:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  v5 = [v4 userInfo];

  [(SDBroadwayAgent *)self preparePresentationWithBroadwayActivationCode:v6 testInfo:v5];
}

- (void)preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126294;
  block[3] = &unk_1008CAF18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (byte_1009942CC)
  {
    if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[SDBroadwayAgent lookUpValidAccountWithBroadwayActivationCode:testInfo:](self, "lookUpValidAccountWithBroadwayActivationCode:testInfo:", v8, v6, v8);
  }
  else
  {
    -[SDBroadwayAgent lookUpValidAccountWithBroadwayActivationCode:testInfo:](self, "lookUpValidAccountWithBroadwayActivationCode:testInfo:", v8, v6, v7);
  }
}

- (void)lookUpValidAccountWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v6;
    LogPrintF();
  }
  id v8 = [v7 objectForKeyedSubscript:@"testParams" v13];
  if (v8) {
    char v9 = SFTestFlagsFromString() & 1;
  }
  else {
    char v9 = 0;
  }
  id v10 = [(Class)off_100967E38[0]() sharedInstance];
  id location = 0;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012657C;
  v14[3] = &unk_1008CDBA0;
  char v18 = v9;
  objc_copyWeak(&v17, &location);
  id v11 = v6;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  [v10 defaultAccountForFeature:2 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)lookupPhysicalCardWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v6;
    LogPrintF();
  }
  id v8 = [v7 objectForKeyedSubscript:@"testParams" v16];
  if (v8) {
    unint64_t v9 = SFTestFlagsFromString();
  }
  else {
    unint64_t v9 = 0;
  }
  id v10 = [(Class)off_100967E38[0]() sharedInstance];
  id location = 0;
  objc_initWeak(&location, self);
  char v11 = v9 & 1;
  uint64_t v12 = HIDWORD(v9) & 1;
  if (objc_opt_respondsToSelector())
  {
    id v13 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100126950;
    v21[3] = &unk_1008CDBF0;
    v21[4] = self;
    char v23 = v11;
    char v24 = v12;
    v14 = &v22;
    objc_copyWeak(&v22, &location);
    id v15 = v6;
    v21[5] = v15;
    v21[6] = v7;
    [v10 physicalCardForFeatureIdentifier:2 activationCode:v15 completion:v21];
  }
  else
  {
    if (dword_100967DC8 <= 90 && (dword_100967DC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v13 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100126B9C;
    v17[3] = &unk_1008CDBF0;
    v17[4] = self;
    char v19 = v11;
    char v20 = v12;
    v14 = &v18;
    objc_copyWeak(&v18, &location);
    v17[5] = v6;
    v17[6] = v7;
    [v10 inactivePhysicalCardForFeatureIdentifier:2 completion:v17];
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)_startUIWithPhysicalCard:(id)a3 activationCode:(id)a4 testInfo:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v8) {
    goto LABEL_33;
  }
  if (v26)
  {
    id v10 = [v9 objectForKeyedSubscript:@"physicalCard"];
    if (v10)
    {
      char v11 = [v9 objectForKeyedSubscript:@"physicalCard"];
      id v12 = [v11 unsignedIntegerValue];
    }
    else
    {
      id v12 = [v26 state];
    }

    if (v12 == (id)5 || !v12)
    {
      char v24 = off_100967E50((uint64_t)v12);
      id v13 = NSErrorWithOSStatusF();

      goto LABEL_9;
    }
  }
  if (gSDProxCardsSuppressed
    || [(SDBroadwayAgent *)self _uiShowing]
    || (+[SDStatusMonitor sharedMonitor],
        id v17 = objc_claimAutoreleasedReturnValue(),
        unsigned int v18 = [v17 systemUIFlags] & 0x5C808,
        v17,
        v18))
  {
LABEL_33:
    id v13 = NSErrorWithOSStatusF();
LABEL_9:
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    if (!v13) {
      goto LABEL_28;
    }
LABEL_10:
    if (dword_100967DC8 <= 60 && (dword_100967DC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_28;
  }
  if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize()))
  {
    id v23 = v26;
    id v25 = v8;
    LogPrintF();
  }
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v9];
  [v16 setObject:v8 forKeyedSubscript:@"activationCode"];
  id v14 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SharingViewService" viewControllerClassName:@"BroadwayActivationMainController"];
  id v15 = objc_opt_new();
  [v15 setUserInfo:v16];
  alertHandle = self->_alertHandle;
  if (alertHandle)
  {
    [(SBSRemoteAlertHandle *)alertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
  }
  char v20 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v14, v15, v23, v25);
  v21 = self->_alertHandle;
  self->_alertHandle = v20;

  id v22 = self->_alertHandle;
  if (!v22)
  {
    id v13 = NSErrorWithOSStatusF();
    if (!v13) {
      goto LABEL_28;
    }
    goto LABEL_10;
  }
  [(SBSRemoteAlertHandle *)v22 addObserver:self];
  [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:0];
  if (dword_100967DC8 <= 30 && (dword_100967DC8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v13 = 0;
LABEL_28:
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001271C4;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100127350;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127508;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end