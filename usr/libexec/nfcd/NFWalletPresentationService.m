@interface NFWalletPresentationService
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)assert:(unint64_t)a3 isFirst:(BOOL *)a4;
- (BOOL)deassert:(unint64_t)a3 isLast:(BOOL *)a4;
- (BOOL)fieldDetectRequested;
- (BOOL)forceNotifyFieldDetectPresentmentWithFieldNotification:(id)a3 walletDomain:(unint64_t)a4;
- (BOOL)isAsserted:(unint64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)notifyFieldDetectPresentmentWithFieldNotification:(id)a3;
- (id)dumpState;
- (id)walletBundleIdentifier;
- (unint64_t)walletDomain;
- (void)notifyPresentmentFieldExit;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentWithUserInfo:(id)a3 completion:(id)a4;
@end

@implementation NFWalletPresentationService

- (void)notifyPresentmentFieldExit
{
  if (self) {
    referenceCounter = self->_referenceCounter;
  }
  else {
    referenceCounter = 0;
  }
  obj = referenceCounter;
  if (sub_100003184(obj, 1uLL))
  {
LABEL_10:

    return;
  }
  if (self) {
    v4 = self->_referenceCounter;
  }
  else {
    v4 = 0;
  }
  unsigned __int8 v5 = sub_100003184(v4, 2uLL);

  if ((v5 & 1) == 0)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self) {
      walletPresentationEventPublisher = obj->_walletPresentationEventPublisher;
    }
    else {
      walletPresentationEventPublisher = 0;
    }
    v7 = walletPresentationEventPublisher;
    sub_100001EE8((uint64_t)v7);

    objc_sync_exit(obj);
    goto LABEL_10;
  }
}

- (BOOL)isAsserted:(unint64_t)a3
{
  if (self) {
    self = (NFWalletPresentationService *)self->_referenceCounter;
  }
  return sub_100003184(self, a3);
}

- (BOOL)assert:(unint64_t)a3 isFirst:(BOOL *)a4
{
  v6 = self;
  if (self) {
    self = (NFWalletPresentationService *)self->_referenceCounter;
  }
  unsigned int v7 = sub_100003184(self, a3);
  if (v6) {
    uint64_t referenceCounter = (uint64_t)v6->_referenceCounter;
  }
  else {
    uint64_t referenceCounter = 0;
  }
  int v9 = sub_10000BB4C(referenceCounter, a3);
  v10 = v6;
  objc_sync_enter(v10);
  if (v6) {
    walletPresentationEventPublisher = v10->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  v12 = walletPresentationEventPublisher;
  objc_sync_exit(v10);

  if (((v7 | v9 ^ 1) & 1) == 0)
  {
    if (a3 == 1)
    {
      sub_100057DD8(v12);
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if (!a3) {
      sub_100003914(v12);
    }
  }
  if (a4) {
LABEL_12:
  }
    *a4 = v7 ^ 1;
LABEL_13:

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v44 = a3;
  id v7 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 130);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v51 = v16;
    __int16 v52 = 2082;
    v53 = object_getClassName(self);
    __int16 v54 = 2082;
    v55 = sel_getName(a2);
    __int16 v56 = 1024;
    int v57 = 130;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  objc_initWeak(&location, v7);
  if (self)
  {
    v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFWalletPresentationInterface];
  }
  else
  {
    v17 = 0;
  }
  [v7 setExportedInterface:v17];

  [v7 setExportedObject:self];
  [v7 setRemoteObjectInterface:0];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100055174;
  v47[3] = &unk_100301E90;
  objc_copyWeak(v48, &location);
  v47[4] = self;
  v48[1] = (id)a2;
  [v7 setInvalidationHandler:v47];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000553D0;
  v45[3] = &unk_100301E90;
  objc_copyWeak(v46, &location);
  v45[4] = self;
  v46[1] = (id)a2;
  [v7 setInterruptionHandler:v45];
  sub_1001E3954(v7);
  unsigned __int8 v18 = sub_1001E3C9C(v7);
  if (v18)
  {
    [v7 resume];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        uint64_t v21 = 43;
      }
      else {
        uint64_t v21 = 45;
      }
      v22 = object_getClassName(self);
      v43 = sel_getName(a2);
      id v23 = [v7 processIdentifier];
      uint64_t v24 = sub_1001E3884(v7);
      v25 = (void *)v24;
      unsigned __int8 v26 = v18;
      v27 = v22;
      uint64_t v28 = v21;
      if (v24) {
        v29 = *(void **)(v24 + 8);
      }
      else {
        v29 = 0;
      }
      id v30 = v29;
      v19(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) does not entitle to access service", v28, v27, v43, 162, v23, v30);
      unsigned __int8 v18 = v26;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      unsigned int v36 = [v7 processIdentifier];
      uint64_t v37 = sub_1001E3884(v7);
      v38 = (void *)v37;
      if (v37) {
        v39 = *(void **)(v37 + 8);
      }
      else {
        v39 = 0;
      }
      id v40 = v39;
      *(_DWORD *)buf = 67110402;
      int v51 = v33;
      __int16 v52 = 2082;
      v53 = v34;
      __int16 v54 = 2082;
      v55 = v35;
      __int16 v56 = 1024;
      int v57 = 162;
      __int16 v58 = 1024;
      unsigned int v59 = v36;
      __int16 v60 = 2114;
      id v61 = v40;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) does not entitle to access service", buf, 0x32u);
    }
  }
  objc_destroyWeak(v46);
  objc_destroyWeak(v48);
  objc_destroyWeak(&location);

  return v18;
}

- (void)presentWithUserInfo:(id)a3 completion:(id)a4
{
  id v37 = a3;
  id v7 = (void (**)(void))a4;
  v38 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v11 = 43;
    }
    else {
      uint64_t v11 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = sub_1001E3884(v38);
    v15 = [v14 debugDescription];
    v9(6, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 179, v15);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    uint64_t v21 = sub_1001E3884(v38);
    v22 = [v21 debugDescription];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)id v40 = v18;
    *(_WORD *)&v40[4] = 2082;
    *(void *)&v40[6] = v19;
    *(_WORD *)&v40[14] = 2082;
    *(void *)&v40[16] = v20;
    __int16 v41 = 1024;
    int v42 = 179;
    __int16 v43 = 2112;
    id v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
  }
  id v23 = +[NSDate now];
  uint64_t v24 = NFSharedSignpostLog();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "[XPC]presentWithCompletion:", (const char *)&unk_100286819, buf, 2u);
  }

  v25 = self;
  objc_sync_enter(v25);
  if (v25) {
    walletPresentationEventPublisher = v25->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  v27 = walletPresentationEventPublisher;
  sub_100056FD0(v27);

  objc_sync_exit(v25);
  uint64_t v28 = NFSharedSignpostLog();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "[XPC]presentWithCompletion:", (const char *)&unk_100286819, buf, 2u);
  }

  v29 = [v37 NF_numberForKey:@"SignpostBeginTime"];
  if (v29)
  {
    id v30 = NFSharedSignpostLog();
    if (os_signpost_enabled(v30))
    {
      id v31 = [v29 unsignedLongLongValue];
      *(_DWORD *)buf = 134349056;
      *(void *)id v40 = v31;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "WalletPresentTotalDuration", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }
  }
  [v23 timeIntervalSinceNow];
  double v33 = v32;
  BOOL v34 = v32 < -0.5;
  v35 = NFSharedLogGetLogger();
  unsigned int v36 = v35;
  if (v34)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)id v40 = 0x3FE0000000000000;
      _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "Exceed %{public}f time limit", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)id v40 = "-[NFWalletPresentationService presentWithUserInfo:completion:]";
    *(_WORD *)&v40[8] = 2050;
    *(double *)&v40[10] = -v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s signalPresentation interval=%{public}f", buf, 0x16u);
  }

  v7[2](v7);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"walletDomain"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NFWalletPresentationService;
    unsigned __int8 v5 = [super automaticallyNotifiesObserversForKey:v4];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a5;
  if (off_100344CB0 == a6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i change=%@", v16, ClassName, Name, 221, v11);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v24 = v19;
      __int16 v25 = 2082;
      unsigned __int8 v26 = object_getClassName(self);
      __int16 v27 = 2082;
      uint64_t v28 = sel_getName(a2);
      __int16 v29 = 1024;
      int v30 = 221;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i change=%@", buf, 0x2Cu);
    }

    [(NFWalletPresentationService *)self willChangeValueForKey:@"walletDomain"];
    [(NFWalletPresentationService *)self didChangeValueForKey:@"walletDomain"];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)NFWalletPresentationService;
    [(NFWalletPresentationService *)&v22 observeValueForKeyPath:a3 ofObject:a4 change:v11 context:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounter, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_walletPresentationEventPublisher, 0);

  objc_storeStrong((id *)&self->_presentmentService, 0);
}

- (unint64_t)walletDomain
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    walletPresentationEventPublisher = v2->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  id v4 = walletPresentationEventPublisher;
  unint64_t v5 = [(NFWalletPresentationEventPublisher *)v4 walletDomain];

  objc_sync_exit(v2);
  return v5;
}

- (id)walletBundleIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    walletPresentationEventPublisher = v2->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  id v4 = walletPresentationEventPublisher;
  unint64_t v5 = sub_100056E18(v4);

  objc_sync_exit(v2);

  return v5;
}

- (BOOL)notifyFieldDetectPresentmentWithFieldNotification:(id)a3
{
  id v4 = a3;
  if (self) {
    uint64_t referenceCounter = self->_referenceCounter;
  }
  else {
    uint64_t referenceCounter = 0;
  }
  v6 = referenceCounter;
  if (sub_100003184(v6, 1uLL))
  {
    BOOL v7 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (self) {
    v8 = self->_referenceCounter;
  }
  else {
    v8 = 0;
  }
  unsigned __int8 v9 = sub_100003184(v8, 2uLL);

  if ((v9 & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (self) {
      walletPresentationEventPublisher = v6->_walletPresentationEventPublisher;
    }
    else {
      walletPresentationEventPublisher = 0;
    }
    id v11 = walletPresentationEventPublisher;
    BOOL v7 = sub_100058140((uint64_t)v11, v4);

    objc_sync_exit(v6);
    goto LABEL_12;
  }
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)forceNotifyFieldDetectPresentmentWithFieldNotification:(id)a3 walletDomain:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    uint64_t referenceCounter = self->_referenceCounter;
  }
  else {
    uint64_t referenceCounter = 0;
  }
  v8 = referenceCounter;
  if (sub_100003184(v8, 1uLL))
  {
    BOOL v9 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (self) {
    v10 = self->_referenceCounter;
  }
  else {
    v10 = 0;
  }
  unsigned __int8 v11 = sub_100003184(v10, 2uLL);

  if ((v11 & 1) == 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (self) {
      walletPresentationEventPublisher = v8->_walletPresentationEventPublisher;
    }
    else {
      walletPresentationEventPublisher = 0;
    }
    uint64_t v13 = walletPresentationEventPublisher;
    BOOL v9 = sub_10005893C((uint64_t)v13, v6, a4);

    objc_sync_exit(v8);
    goto LABEL_12;
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)deassert:(unint64_t)a3 isLast:(BOOL *)a4
{
  if (self)
  {
    if (sub_100149F1C((uint64_t)self->_referenceCounter, a3))
    {
      uint64_t referenceCounter = self->_referenceCounter;
LABEL_4:
      if ((sub_100003184(referenceCounter, a3) & 1) == 0)
      {
        if (a4) {
          *a4 = 1;
        }
        BOOL v9 = self;
        objc_sync_enter(v9);
        if (self) {
          walletPresentationEventPublisher = v9->_walletPresentationEventPublisher;
        }
        else {
          walletPresentationEventPublisher = 0;
        }
        unsigned __int8 v11 = walletPresentationEventPublisher;
        objc_sync_exit(v9);

        if (a3 == 1)
        {
          sub_100057E8C(v11);
        }
        else if (!a3)
        {
          sub_100057F40((id *)&v11->super.isa);
        }
      }
      return 1;
    }
  }
  else
  {
    char v13 = sub_100149F1C(0, a3);
    uint64_t referenceCounter = 0;
    if (v13) {
      goto LABEL_4;
    }
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v18 = 45;
    if (isMetaClass) {
      uint64_t v18 = 43;
    }
    v15(3, "%c[%{public}s %{public}s]:%i Missing assertion (%lu)", v18, ClassName, Name, 321, a3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v25 = v21;
    __int16 v26 = 2082;
    __int16 v27 = object_getClassName(self);
    __int16 v28 = 2082;
    __int16 v29 = sel_getName(a2);
    __int16 v30 = 1024;
    int v31 = 321;
    __int16 v32 = 2048;
    unint64_t v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing assertion (%lu)", buf, 0x2Cu);
  }

  return 0;
}

- (BOOL)fieldDetectRequested
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    walletPresentationEventPublisher = v2->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  id v4 = walletPresentationEventPublisher;
  objc_sync_exit(v2);

  if ([(os_unfair_lock_s *)v4 walletDomain] == (id)2
    || [(os_unfair_lock_s *)v4 walletDomain] == (id)1)
  {
    unint64_t v5 = sub_100056E18(v4);
    BOOL v6 = [v5 lengthOfBytesUsingEncoding:4] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)dumpState
{
  v3 = objc_opt_new();
  id v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    walletPresentationEventPublisher = v4->_walletPresentationEventPublisher;
  }
  else {
    walletPresentationEventPublisher = 0;
  }
  BOOL v6 = walletPresentationEventPublisher;
  objc_sync_exit(v4);

  if (v4) {
    uint64_t referenceCounter = (unsigned __int8 *)v4->_referenceCounter;
  }
  else {
    uint64_t referenceCounter = 0;
  }
  v8 = sub_10014A1F8(referenceCounter);
  [v3 setObject:v8 forKeyedSubscript:@"AssertRefCounters"];

  BOOL v9 = sub_100059100((uint64_t)v6);

  [v3 setObject:v9 forKeyedSubscript:@"EventPublisher"];

  return v3;
}

@end