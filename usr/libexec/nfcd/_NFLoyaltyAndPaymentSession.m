@interface _NFLoyaltyAndPaymentSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)readyForVAS;
- (BOOL)useFilteredApplets;
- (_NFLoyaltyAndPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (id)handleAPDU:(id)a3;
- (id)handleSelect:(id)a3;
- (id)hostCardEmulationLog;
- (void)didEndSession:(id)a3;
- (void)handleDeselect;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)setHostCards:(id)a3;
- (void)supportPayment:(BOOL)a3;
@end

@implementation _NFLoyaltyAndPaymentSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 cardModeAccess])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v11, ClassName, Name, 33);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = object_getClassName(a1);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031D398;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 34];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (_NFLoyaltyAndPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_NFLoyaltyAndPaymentSession;
  v6 = [(_NFContactlessPaymentSession *)&v14 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6 hostCardEmulationSupport:1];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = *(void **)(v6 + 387);
    *(void *)(v6 + 387) = v7;

    v9 = objc_alloc_init(NFLoyaltyAgent);
    v10 = *(void **)(v6 + 371);
    *(void *)(v6 + 371) = v9;

    uint64_t v11 = objc_alloc_init(NFHostCardEmulationManager);
    v12 = *(void **)(v6 + 379);
    *(void *)(v6 + 379) = v11;
  }
  return (_NFLoyaltyAndPaymentSession *)v6;
}

- (void)didEndSession:(id)a3
{
  id v4 = a3;
  if (![(_NFSession *)self didEnd])
  {
    id v5 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
    if (v5 && v5[25])
    {
      sub_10003D484(v5);
      v6 = +[_NFHardwareManager sharedHardwareManager];
      id v7 = +[NFRoutingConfig routingOff];
      id v8 = [v6 setRoutingConfig:v7];

      id v5 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
    }
    if (sub_10003D7FC(v5, self)) {
      sub_10003D87C(*(void **)((char *)&self->_loyaltyAgent + 3), self);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_NFLoyaltyAndPaymentSession;
  [(_NFContactlessPaymentSession *)&v9 didEndSession:v4];
}

- (BOOL)useFilteredApplets
{
  id v4 = [(_NFXPCSession *)self connection];
  id v5 = [v4 NF_whitelistChecker];

  unsigned int v6 = [v5 useUnfilteredApplets];
  if (v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Using unfiltered applets!", v12, ClassName, Name, 76);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v19 = v15;
      __int16 v20 = 2082;
      v21 = object_getClassName(self);
      __int16 v22 = 2082;
      v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 76;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using unfiltered applets!", buf, 0x22u);
    }
  }
  return v6 ^ 1;
}

- (void)setHostCards:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFLoyaltyAndPaymentSession;
  unsigned int v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A2818;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (id)hostCardEmulationLog
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 100);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  SEL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    int v19 = object_getClassName(self);
    __int16 v20 = 2082;
    v21 = sel_getName(a2);
    __int16 v22 = 1024;
    int v23 = 100;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v13 = sub_10003DB88(*(id **)((char *)&self->_loyaltyAgent + 3));

  return v13;
}

- (void)supportPayment:(BOOL)a3
{
}

- (BOOL)readyForVAS
{
  v2 = [*(id *)(&self->_emulationActive + 3) hostCards];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)handleSelect:(id)a3
{
  id v4 = [*(id *)(&self->_emulationActive + 3) handleSelect:a3];
  if (v4)
  {
    [*(id *)((char *)&self->_hceManager + 3) removeAllObjects];
    id v5 = [(_NFXPCSession *)self remoteObject];
    [v5 didSelectValueAddedService:1];
  }

  return v4;
}

- (id)handleAPDU:(id)a3
{
  id v4 = [*(id *)(&self->_emulationActive + 3) handleAPDU:a3];
  if (([*(id *)(&self->_emulationActive + 3) isComplete] & 1) != 0
    || [*(id *)(&self->_emulationActive + 3) hasError])
  {
    id v5 = *(NFHostCardEmulationManager **)((char *)&self->_hceManager + 3);
    unsigned int v6 = [*(id *)(&self->_emulationActive + 3) getTransactionEvent];
    [v5 addObject:v6];
  }

  return v4;
}

- (void)handleDeselect
{
  if ([*(id *)((char *)&self->_hceManager + 3) count])
  {
    BOOL v3 = [(_NFXPCSession *)self remoteObject];
    [v3 didPerformValueAddedServiceTransactions:*(NFHostCardEmulationManager **)((char *)&self->_hceManager + 3)];
  }
  id v4 = *(void **)(&self->_emulationActive + 3);

  [v4 handleDeselect];
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
  id v5 = a3;
  if ((sub_10003D7FC(v4, self) & 1) == 0) {
    sub_10003D75C(*(void **)((char *)&self->_loyaltyAgent + 3), self);
  }
  sub_10003DD40(*(void **)((char *)&self->_loyaltyAgent + 3), v5, [(_NFContactlessPaymentSession *)self readyForPayment]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_hceManager + 3), 0);
  objc_storeStrong((id *)((char *)&self->_loyaltyAgent + 3), 0);

  objc_storeStrong((id *)(&self->_emulationActive + 3), 0);
}

@end