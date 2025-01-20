@interface _NFContactlessPaymentSession
- (BOOL)_authorize:(id)a3;
- (BOOL)_checkActiveAppletCompatibilityWithField:(id)a3;
- (BOOL)_checkActiveVASCompatibilityWithField:(id)a3;
- (BOOL)_checkDeferredActiveAppletCompatibilityWithField:(id)a3;
- (BOOL)_isField:(id)a3 compatibleWithApplet:(id)a4;
- (BOOL)_requiresDeferredActivation:(id)a3;
- (BOOL)allowTransactionsInWiredMode;
- (BOOL)dontWaitForEOT;
- (BOOL)inWiredMode;
- (BOOL)readyForPayment;
- (BOOL)readyForVAS;
- (BOOL)startCardEmulationWithType:(unint64_t)a3;
- (BOOL)startDefaultMode;
- (BOOL)startFieldDetectMode;
- (BOOL)startWiredMode;
- (BOOL)suspendWithInfo:(id)a3;
- (BOOL)useFilteredApplets;
- (_NFContactlessPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6 hostCardEmulationSupport:(BOOL)a7;
- (id)_switchToBestGroupMemberOfHead:(id)a3 forField:(id)a4;
- (id)preloadApplets;
- (unint64_t)defaultEmulationType;
- (unsigned)transactionState;
- (void)_deauthorize;
- (void)_fireFelicaTransactionEndEvent;
- (void)_fireFelicaTransactionStartEvent;
- (void)_performAuthAndStartCardEmulation:(id)a3 fromDeferred:(BOOL)a4 completion:(id)a5;
- (void)_performDeferredAuthIfNeeded:(id)a3;
- (void)_sync_startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4;
- (void)cleanup;
- (void)didEndSession:(id)a3;
- (void)didStartSession:(id)a3;
- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4;
- (void)getAppletsWithCompletion:(id)a3;
- (void)getFelicaAppletState:(id)a3 completion:(id)a4;
- (void)getTransitAppletState:(id)a3 completion:(id)a4;
- (void)handleAppletInactivityTimeout:(id)a3;
- (void)handleDeferredAuthTimeout;
- (void)handleExpressModeExited;
- (void)handleExpressModeStarted;
- (void)handleExpressModeTimeout;
- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4;
- (void)handleFieldChanged:(BOOL)a3;
- (void)handleFieldNotification:(id)a3;
- (void)handleFieldReset;
- (void)handlePendingServerRequest;
- (void)handleRequestService:(id)a3;
- (void)handleSecureElementEndOfOperation;
- (void)handleTimerExpiredEvent:(id)a3;
- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4;
- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4;
- (void)pauseExpressAndStartDefaultModeAfter:(double)a3;
- (void)setActivePaymentApplet:(id)a3 keys:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)setActivePaymentApplets:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)setTransactionState:(unsigned __int8)a3;
- (void)startCardEmulationWithAuthorization:(id)a3 completion:(id)a4;
- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4;
- (void)startExpressModeWithCompletion:(id)a3;
- (void)startHostCardEmulationWithCompletion:(id)a3;
- (void)stopCardEmulationWithCompletion:(id)a3;
- (void)waitForSafeTransactionCompletion;
@end

@implementation _NFContactlessPaymentSession

- (_NFContactlessPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6 hostCardEmulationSupport:(BOOL)a7
{
  v9.receiver = self;
  v9.super_class = (Class)_NFContactlessPaymentSession;
  result = [(_NFXPCSession *)&v9 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6];
  if (result) {
    result->_hostCardEmulationSupport = a7;
  }
  return result;
}

- (void)cleanup
{
  v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessPaymentSession", buf, 2u);
  }

  if ([(_NFSession *)self needsCleanup])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 90);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      v14 = object_getClassName(self);
      v15 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v64 = v13;
      __int16 v65 = 2082;
      v66 = v14;
      __int16 v67 = 2082;
      v68 = v15;
      __int16 v69 = 1024;
      int v70 = 90;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    sub_1002535C4();
    self->_deferredAuthRequested = 0;
    [(_NFContactlessSession *)self setDeferredActivationApplet:0];
    [(NFTimer *)self->_deferredAuthTimer stopTimer];
    [(NFTimer *)self->_restartRoutingTimer stopTimer];
    [(_NFContactlessPaymentSession *)self waitForSafeTransactionCompletion];
    if ([(_NFContactlessSession *)self plasticCardMode])
    {
      [(_NFContactlessPaymentSession *)self startWiredMode];
      v16 = [(_NFContactlessSession *)self secureElementWrapper];
      v17 = [v16 handle];
      unsigned __int8 v18 = [v17 enableGreenCarThreshold:1];

      if ((v18 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v19 = NFLogGetLogger();
        if (v19)
        {
          v20 = (void (*)(uint64_t, const char *, ...))v19;
          v21 = object_getClass(self);
          BOOL v22 = class_isMetaClass(v21);
          v23 = object_getClassName(self);
          v59 = sel_getName(a2);
          uint64_t v24 = 45;
          if (v22) {
            uint64_t v24 = 43;
          }
          v20(6, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", v24, v23, v59, 106);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = object_getClass(self);
          if (class_isMetaClass(v26)) {
            int v27 = 43;
          }
          else {
            int v27 = 45;
          }
          v28 = object_getClassName(self);
          v29 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v64 = v27;
          __int16 v65 = 2082;
          v66 = v28;
          __int16 v67 = 2082;
          v68 = v29;
          __int16 v69 = 1024;
          int v70 = 106;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", buf, 0x22u);
        }
      }
      v30 = [(_NFContactlessSession *)self activeApplet];

      if (v30)
      {
        v31 = [(_NFContactlessSession *)self secureElementWrapper];
        v32 = [(_NFContactlessSession *)self activeApplet];
        v33 = sub_100251A48(v31, 0, v32);

        if (v33)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v34 = NFLogGetLogger();
          if (v34)
          {
            v35 = (void (*)(uint64_t, const char *, ...))v34;
            v36 = object_getClass(self);
            BOOL v37 = class_isMetaClass(v36);
            v57 = object_getClassName(self);
            v60 = sel_getName(a2);
            uint64_t v38 = 45;
            if (v37) {
              uint64_t v38 = 43;
            }
            v35(3, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", v38, v57, v60, 112, v33);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v39 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = object_getClass(self);
            if (class_isMetaClass(v40)) {
              int v41 = 43;
            }
            else {
              int v41 = 45;
            }
            v42 = object_getClassName(self);
            v43 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v64 = v41;
            __int16 v65 = 2082;
            v66 = v42;
            __int16 v67 = 2082;
            v68 = v43;
            __int16 v69 = 1024;
            int v70 = 112;
            __int16 v71 = 2114;
            v72 = v33;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", buf, 0x2Cu);
          }
        }
      }
    }
    if (self->_hasAuthorized) {
      [(_NFContactlessPaymentSession *)self _deauthorize];
    }
    if (self->_delayExpressMode > 0.0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v44 = NFLogGetLogger();
      if (v44)
      {
        v45 = (void (*)(uint64_t, const char *, ...))v44;
        v46 = object_getClass(self);
        BOOL v47 = class_isMetaClass(v46);
        v48 = object_getClassName(self);
        v61 = sel_getName(a2);
        uint64_t v49 = 45;
        if (v47) {
          uint64_t v49 = 43;
        }
        v45(6, "%c[%{public}s %{public}s]:%i Delaying express enablement after transaction", v49, v48, v61, 125);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v50 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = object_getClass(self);
        if (class_isMetaClass(v51)) {
          int v52 = 43;
        }
        else {
          int v52 = 45;
        }
        v53 = object_getClassName(self);
        v54 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v64 = v52;
        __int16 v65 = 2082;
        v66 = v53;
        __int16 v67 = 2082;
        v68 = v54;
        __int16 v69 = 1024;
        int v70 = 125;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delaying express enablement after transaction", buf, 0x22u);
      }

      [(_NFContactlessPaymentSession *)self startWiredMode];
      v55 = [(_NFSession *)self expressModeManager];
      sub_1000471EC(v55, self->_delayExpressMode);
    }
  }
  v62.receiver = self;
  v62.super_class = (Class)_NFContactlessPaymentSession;
  [(_NFContactlessSession *)&v62 cleanup];
  v56 = NFSharedSignpostLog();
  if (os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFContactlessPaymentSession", buf, 2u);
  }
}

- (BOOL)suspendWithInfo:(id)a3
{
  v39.receiver = self;
  v39.super_class = (Class)_NFContactlessPaymentSession;
  BOOL v5 = [(_NFContactlessSession *)&v39 suspendWithInfo:a3];
  if (v5)
  {
    self->_deferredAuthRequested = 0;
    [(_NFContactlessSession *)self setDeferredActivationApplet:0];
    [(NFTimer *)self->_deferredAuthTimer stopTimer];
    [(NFTimer *)self->_restartRoutingTimer stopTimer];
    [(_NFContactlessPaymentSession *)self waitForSafeTransactionCompletion];
    if ([(_NFContactlessSession *)self plasticCardMode])
    {
      [(_NFContactlessPaymentSession *)self startWiredMode];
      v6 = [(_NFContactlessSession *)self secureElementWrapper];
      v7 = [v6 handle];
      unsigned __int8 v8 = [v7 enableGreenCarThreshold:1];

      if ((v8 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v14 = 45;
          if (isMetaClass) {
            uint64_t v14 = 43;
          }
          v10(6, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", v14, ClassName, Name, 155);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = object_getClass(self);
          if (class_isMetaClass(v16)) {
            int v17 = 43;
          }
          else {
            int v17 = 45;
          }
          unsigned __int8 v18 = object_getClassName(self);
          uint64_t v19 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v41 = v17;
          __int16 v42 = 2082;
          v43 = v18;
          __int16 v44 = 2082;
          v45 = v19;
          __int16 v46 = 1024;
          int v47 = 155;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to re-enable GC logic", buf, 0x22u);
        }
      }
      v20 = [(_NFContactlessSession *)self activeApplet];

      if (v20)
      {
        v21 = [(_NFContactlessSession *)self secureElementWrapper];
        BOOL v22 = [(_NFContactlessSession *)self activeApplet];
        v23 = sub_100251A48(v21, 0, v22);

        if (v23)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v24 = NFLogGetLogger();
          if (v24)
          {
            v25 = (void (*)(uint64_t, const char *, ...))v24;
            v26 = object_getClass(self);
            BOOL v27 = class_isMetaClass(v26);
            v36 = object_getClassName(self);
            uint64_t v38 = sel_getName(a2);
            uint64_t v28 = 45;
            if (v27) {
              uint64_t v28 = 43;
            }
            v25(3, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", v28, v36, v38, 161, v23);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v29 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = object_getClass(self);
            if (class_isMetaClass(v30)) {
              int v31 = 43;
            }
            else {
              int v31 = 45;
            }
            v32 = object_getClassName(self);
            v33 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v41 = v31;
            __int16 v42 = 2082;
            v43 = v32;
            __int16 v44 = 2082;
            v45 = v33;
            __int16 v46 = 1024;
            int v47 = 161;
            __int16 v48 = 2114;
            uint64_t v49 = v23;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable plastic card mode: %{public}@", buf, 0x2Cu);
          }
        }
      }
      [(_NFContactlessSession *)self setPlasticCardMode:0];
    }
    if (self->_hasAuthorized) {
      [(_NFContactlessPaymentSession *)self _deauthorize];
    }
    self->_inWiredMode = 0;
    self->_fieldPresent = 0;
    self->_transactionState = 0;
    id v34 = [(_NFContactlessSession *)self setActiveApplet:0];
  }
  return v5;
}

- (unint64_t)defaultEmulationType
{
  if (self->_hostCardEmulationSupport) {
    return 6;
  }
  else {
    return 2;
  }
}

- (id)preloadApplets
{
  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessPaymentSession;
  v2 = [(_NFContactlessSession *)&v6 preloadApplets];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (BOOL)useFilteredApplets
{
  return 1;
}

- (BOOL)readyForPayment
{
  v3 = [(_NFContactlessSession *)self activeApplet];
  if (v3) {
    BOOL hasAuthorized = self->_hasAuthorized;
  }
  else {
    BOOL hasAuthorized = 0;
  }

  return hasAuthorized;
}

- (BOOL)dontWaitForEOT
{
  return self->_dontWaitForEOT;
}

- (BOOL)inWiredMode
{
  return self->_inWiredMode;
}

- (BOOL)readyForVAS
{
  return 0;
}

- (void)didStartSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessPaymentSession;
  -[_NFContactlessSession didStartSession:](&v6, "didStartSession:");
  if (!a3) {
    id v5 = [(_NFContactlessSession *)self setActiveApplet:0];
  }
}

- (void)didEndSession:(id)a3
{
  id v5 = a3;
  if (![(_NFSession *)self didEnd])
  {
    self->_deferredAuthRequested = 0;
    [(NFTimer *)self->_deferredAuthTimer stopTimer];
    deferredAuthTimer = self->_deferredAuthTimer;
    self->_deferredAuthTimer = 0;

    if (self->_restartRoutingTimer)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        unsigned __int8 v8 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v8(6, "%c[%{public}s %{public}s]:%i Unpausing express mode", v12, ClassName, Name, 241);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = object_getClass(self);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v22 = v15;
        __int16 v23 = 2082;
        uint64_t v24 = object_getClassName(self);
        __int16 v25 = 2082;
        v26 = sel_getName(a2);
        __int16 v27 = 1024;
        int v28 = 241;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unpausing express mode", buf, 0x22u);
      }

      [(NFTimer *)self->_restartRoutingTimer stopTimer];
      v16 = [(_NFSession *)self expressModeManager];
      int v17 = v16;
      if (v16) {
        sub_10004360C(v16, 0, 1u);
      }

      restartRoutingTimer = self->_restartRoutingTimer;
      self->_restartRoutingTimer = 0;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)_NFContactlessPaymentSession;
  [(_NFSession *)&v20 didEndSession:v5];
}

- (void)getAppletsWithCompletion:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  objc_super v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_GET_APPLETS", "before dispatch", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)_NFContactlessPaymentSession;
  v7 = [(_NFSession *)&v12 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012EFA0;
  block[3] = &unk_100301D38;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)setActivePaymentApplet:(id)a3 keys:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  kdebug_trace();
  int v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v29 = v13 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "setActivePaymentApplet, auth=%d", buf, 8u);
  }

  v27.receiver = self;
  v27.super_class = (Class)_NFContactlessPaymentSession;
  v16 = [(_NFSession *)&v27 workQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10012F500;
  v21[3] = &unk_100304D28;
  id v25 = v14;
  SEL v26 = a2;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v14;
  dispatch_async(v16, v21);
}

- (void)setActivePaymentApplets:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  kdebug_trace();
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v24 = v10 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "setActivePaymentApplets, auth=%d", buf, 8u);
  }

  v22.receiver = self;
  v22.super_class = (Class)_NFContactlessPaymentSession;
  id v13 = [(_NFSession *)&v22 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100130E40;
  block[3] = &unk_100302250;
  id v20 = v11;
  SEL v21 = a2;
  block[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (void)startCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  kdebug_trace();
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v7 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_AUTH_REQUEST", "startCardEmulationWithAuthorization, auth=%d", buf, 8u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFContactlessPaymentSession;
  id v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100132D60;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)handleDeferredAuthTimeout
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
    v5(5, "%c[%{public}s %{public}s]:%i Deferred authorization timeout", v9, ClassName, Name, 572);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v12;
    __int16 v22 = 2082;
    id v23 = object_getClassName(self);
    __int16 v24 = 2082;
    id v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 572;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deferred authorization timeout", buf, 0x22u);
  }

  id v13 = [(_NFContactlessSession *)self activeApplet];

  if (v13)
  {
    id v14 = [(_NFContactlessSession *)self activeApplet];
    id v15 = [v14 identifier];
    BOOL v19 = v15;
    SEL v16 = +[NSArray arrayWithObjects:&v19 count:1];
    [(_NFContactlessPaymentSession *)self handleTimerExpiredEvent:v16];
  }
  else
  {
    [(_NFContactlessPaymentSession *)self handleTimerExpiredEvent:&off_100322820];
  }
  self->_deferredAuthRequested = 0;
  deferredAuth = self->_deferredAuth;
  self->_deferredAuth = 0;
}

- (void)_sync_startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  kdebug_trace();
  uint64_t v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v7 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_DEFERRED_AUTH_REQUEST", "auth=%d", (uint8_t *)&buf, 8u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v12 = 43;
    }
    else {
      uint64_t v12 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v15 = [(_NFXPCSession *)self clientName];
    Logger(6, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 590, v15);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  SEL v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    BOOL v19 = object_getClassName(self);
    id v20 = sel_getName(a2);
    int v21 = [(_NFXPCSession *)self clientName];
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v18;
    __int16 v63 = 2082;
    int v64 = v19;
    __int16 v65 = 2082;
    v66 = v20;
    __int16 v67 = 1024;
    int v68 = 590;
    __int16 v69 = 2114;
    int v70 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", (uint8_t *)&buf, 0x2Cu);
  }
  self->_deferredAuthRequested = 1;
  if (v7)
  {
    BOOL v22 = !self->_deferredAuth || [v7 isEqual:];
    id v23 = (NSData *)v7;
    p_super = &self->_deferredAuth->super;
    self->_deferredAuth = v23;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v25)
    {
      __int16 v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        uint64_t v27 = 43;
      }
      else {
        uint64_t v27 = 45;
      }
      int v28 = object_getClassName(self);
      BOOL v29 = sel_getName(a2);
      v25(6, "%c[%{public}s %{public}s]:%i No authorization supplied", v27, v28, v29, 601);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    p_super = NFSharedLogGetLogger();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v31;
      __int16 v63 = 2082;
      int v64 = v32;
      __int16 v65 = 2082;
      v66 = v33;
      __int16 v67 = 1024;
      int v68 = 601;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No authorization supplied", (uint8_t *)&buf, 0x22u);
    }
    BOOL v22 = 0;
  }

  kdebug_trace();
  id v34 = NFSharedSignpostLog();
  if (os_signpost_enabled(v34))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_CALLBACK", (const char *)&unk_100286819, (uint8_t *)&buf, 2u);
  }

  v8[2](v8, 0);
  if (self->_deferredAuthTimer)
  {
    if (v22)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35)
      {
        v36 = object_getClass(self);
        if (class_isMetaClass(v36)) {
          uint64_t v37 = 43;
        }
        else {
          uint64_t v37 = 45;
        }
        uint64_t v38 = object_getClassName(self);
        objc_super v39 = sel_getName(a2);
        v35(6, "%c[%{public}s %{public}s]:%i Auth changed", v37, v38, v39, 619);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        v43 = object_getClassName(self);
        __int16 v44 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v42;
        __int16 v63 = 2082;
        int v64 = v43;
        __int16 v65 = 2082;
        v66 = v44;
        __int16 v67 = 1024;
        int v68 = 619;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Auth changed", (uint8_t *)&buf, 0x22u);
      }

      [(NFTimer *)self->_deferredAuthTimer stopTimer];
      [(NFTimer *)self->_deferredAuthTimer startTimer:60.0 leeway:0.5];
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    id v45 = objc_alloc((Class)NFTimer);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100133DD4;
    v60[3] = &unk_100301C18;
    objc_copyWeak(&v61, &buf);
    v59.receiver = self;
    v59.super_class = (Class)_NFContactlessPaymentSession;
    __int16 v46 = [(_NFSession *)&v59 workQueue];
    int v47 = (NFTimer *)[v45 initWithCallback:v60 queue:v46];
    deferredAuthTimer = self->_deferredAuthTimer;
    self->_deferredAuthTimer = v47;

    [(NFTimer *)self->_deferredAuthTimer startTimer:60.0 leeway:0.5];
    objc_destroyWeak(&v61);
    objc_destroyWeak(&buf);
  }
  if (self->_fieldPresent && self->_fieldNotification)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v49)
    {
      v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        uint64_t v51 = 43;
      }
      else {
        uint64_t v51 = 45;
      }
      int v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      v49(6, "%c[%{public}s %{public}s]:%i Field is already present, starting emulation", v51, v52, v53, 626);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v54 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = object_getClass(self);
      if (class_isMetaClass(v55)) {
        int v56 = 43;
      }
      else {
        int v56 = 45;
      }
      v57 = object_getClassName(self);
      v58 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v56;
      __int16 v63 = 2082;
      int v64 = v57;
      __int16 v65 = 2082;
      v66 = v58;
      __int16 v67 = 1024;
      int v68 = 626;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field is already present, starting emulation", (uint8_t *)&buf, 0x22u);
    }

    [(_NFContactlessPaymentSession *)self _performDeferredAuthIfNeeded:self->_fieldNotification];
  }
  else
  {
    [(_NFContactlessPaymentSession *)self startWiredMode];
  }
}

- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFContactlessPaymentSession;
  uint64_t v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100133F44;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFContactlessPaymentSession;
  id v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100134314;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  BOOL v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)startExpressModeWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessPaymentSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013552C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)startHostCardEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessPaymentSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100135CBC;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)stopCardEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFContactlessPaymentSession;
  objc_super v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136438;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLPaymentSession:getFelicaAppletState", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFContactlessPaymentSession;
  SEL v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100136B0C;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLPaymentSession:getTransitAppletState", "in", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)_NFContactlessPaymentSession;
  SEL v10 = [(_NFSession *)&v17 workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001374D8;
  v13[3] = &unk_100302278;
  id v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (BOOL)allowTransactionsInWiredMode
{
  return 0;
}

- (BOOL)_authorize:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  objc_super v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_CALL", "begin", buf, 2u);
  }

  if (![(_NFContactlessPaymentSession *)self startWiredMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v28 = 45;
      if (isMetaClass) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v28, ClassName, Name, 909);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      int v31 = object_getClassName(self);
      v32 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v53 = v30;
      __int16 v54 = 2082;
      v55 = v31;
      __int16 v56 = 2082;
      v57 = v32;
      __int16 v58 = 1024;
      int v59 = 909;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", buf, 0x22u);
    }
    goto LABEL_26;
  }
  if (v5)
  {
    id v7 = [(_NFContactlessSession *)self secureElementWrapper];
    uint64_t v8 = [(_NFSession *)self uid];
    id v9 = [(_NFContactlessSession *)self activeApplet];
    SEL v10 = [v9 instanceACL];
    LODWORD(v8) = sub_1001F22B8(v7, v5, v8, 0, v10);

    if (v8)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v11 = NFLogGetLogger();
      if (v11)
      {
        id v12 = (void (*)(uint64_t, const char *, ...))v11;
        BOOL v13 = object_getClass(self);
        BOOL v14 = class_isMetaClass(v13);
        id v15 = object_getClassName(self);
        uint64_t v49 = sel_getName(a2);
        uint64_t v16 = 45;
        if (v14) {
          uint64_t v16 = 43;
        }
        v12(3, "%c[%{public}s %{public}s]:%i Failed to authorize", v16, v15, v49, 920);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      objc_super v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        id v20 = object_getClassName(self);
        int v21 = sel_getName(a2);
        *(_DWORD *)id buf = 67109890;
        int v53 = v19;
        __int16 v54 = 2082;
        v55 = v20;
        __int16 v56 = 2082;
        v57 = v21;
        __int16 v58 = 1024;
        int v59 = 920;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to authorize", buf, 0x22u);
      }

      kdebug_trace();
      BOOL v22 = NFSharedSignpostLog();
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_APPLET_FAILED", (const char *)&unk_100286819, buf, 2u);
      }
LABEL_26:
      BOOL v33 = 0;
      goto LABEL_27;
    }
    self->_BOOL hasAuthorized = 1;
  }
  v35 = [(_NFContactlessSession *)self secureElementWrapper];
  v36 = [v35 handle];
  unsigned __int8 v37 = [v36 setAlwaysOn:1];

  if ((v37 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      objc_super v39 = (void (*)(uint64_t, const char *, ...))v38;
      v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      int v42 = object_getClassName(self);
      uint64_t v51 = sel_getName(a2);
      uint64_t v43 = 45;
      if (v41) {
        uint64_t v43 = 43;
      }
      v39(3, "%c[%{public}s %{public}s]:%i Failed to set eSE always on", v43, v42, v51, 932);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      int v47 = object_getClassName(self);
      __int16 v48 = sel_getName(a2);
      *(_DWORD *)id buf = 67109890;
      int v53 = v46;
      __int16 v54 = 2082;
      v55 = v47;
      __int16 v56 = 2082;
      v57 = v48;
      __int16 v58 = 1024;
      int v59 = 932;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set eSE always on", buf, 0x22u);
    }
  }
  PLLogRegisteredEvent();
  BOOL v33 = 1;
  kdebug_trace();
  BOOL v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_CALL", "success", buf, 2u);
    BOOL v33 = 1;
  }
LABEL_27:

  return v33;
}

- (void)_deauthorize
{
  kdebug_trace();
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DEAUTHORIZE_CALL", "begin", (uint8_t *)&buf, 2u);
  }

  deferredAuth = self->_deferredAuth;
  self->_deferredAuth = 0;

  if (![(_NFContactlessPaymentSession *)self startWiredMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v21(3, "%c[%{public}s %{public}s]:%i Failed to set mode to wired", v25, ClassName, Name, 953);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    uint64_t v28 = object_getClassName(self);
    BOOL v29 = sel_getName(a2);
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v27;
    *(_WORD *)uint64_t v49 = 2082;
    *(void *)&v49[2] = v28;
    *(_WORD *)&v49[10] = 2082;
    *(void *)&v49[12] = v29;
    *(_WORD *)&v49[20] = 1024;
    *(_DWORD *)&v49[22] = 953;
    int v19 = "%c[%{public}s %{public}s]:%i Failed to set mode to wired";
    goto LABEL_23;
  }
  objc_super v6 = [(_NFContactlessSession *)self secureElementWrapper];
  int v7 = sub_1001F3198(v6);

  if (!v7) {
    goto LABEL_25;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v8 = NFLogGetLogger();
  if (v8)
  {
    id v9 = (void (*)(uint64_t, const char *, ...))v8;
    SEL v10 = object_getClass(self);
    BOOL v11 = class_isMetaClass(v10);
    id v12 = object_getClassName(self);
    id v45 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v11) {
      uint64_t v13 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Failed to deauth", v13, v12, v45, 958);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    objc_super v17 = object_getClassName(self);
    int v18 = sel_getName(a2);
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v16;
    *(_WORD *)uint64_t v49 = 2082;
    *(void *)&v49[2] = v17;
    *(_WORD *)&v49[10] = 2082;
    *(void *)&v49[12] = v18;
    *(_WORD *)&v49[20] = 1024;
    *(_DWORD *)&v49[22] = 958;
    int v19 = "%c[%{public}s %{public}s]:%i Failed to deauth";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&buf, 0x22u);
  }
LABEL_24:

LABEL_25:
  int v30 = [(_NFContactlessSession *)self secureElementWrapper];
  int v31 = [v30 handle];
  unsigned __int8 v32 = [v31 setAlwaysOn:0];

  if ((v32 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v33 = NFLogGetLogger();
    if (v33)
    {
      id v34 = (void (*)(uint64_t, const char *, ...))v33;
      v35 = object_getClass(self);
      BOOL v36 = class_isMetaClass(v35);
      unsigned __int8 v37 = object_getClassName(self);
      int v47 = sel_getName(a2);
      uint64_t v38 = 45;
      if (v36) {
        uint64_t v38 = 43;
      }
      v34(3, "%c[%{public}s %{public}s]:%i Failed to disable eSE always on", v38, v37, v47, 963, buf, *(_OWORD *)v49, *(_OWORD *)&v49[16]);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    objc_super v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      int v42 = object_getClassName(self);
      uint64_t v43 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v41;
      *(_WORD *)uint64_t v49 = 2082;
      *(void *)&v49[2] = v42;
      *(_WORD *)&v49[10] = 2082;
      *(void *)&v49[12] = v43;
      *(_WORD *)&v49[20] = 1024;
      *(_DWORD *)&v49[22] = 963;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to disable eSE always on", (uint8_t *)&buf, 0x22u);
    }
  }
  PLLogRegisteredEvent();
  self->_BOOL hasAuthorized = 0;
  kdebug_trace();
  __int16 v44 = NFSharedSignpostLog();
  if (os_signpost_enabled(v44))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DEAUTHORIZE_CALL", "success", (uint8_t *)&buf, 2u);
  }
}

- (BOOL)startCardEmulationWithType:(unint64_t)a3
{
  kdebug_trace();
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_CE", "start Card Emulation", buf, 2u);
  }

  self->_transactionState = 0;
  v8.receiver = self;
  v8.super_class = (Class)_NFContactlessPaymentSession;
  BOOL v6 = [(_NFContactlessSession *)&v8 startCardEmulationWithType:a3];
  if (v6)
  {
    self->_inWiredMode = 0;
    [(NFTimer *)self->_restartRoutingTimer stopTimer];
  }
  return v6;
}

- (BOOL)startWiredMode
{
  [(_NFContactlessPaymentSession *)self waitForSafeTransactionCompletion];
  kdebug_trace();
  v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_WIRED", "start Wired Mode", buf, 2u);
  }

  if (self->_deferredAuthRequested)
  {
    id v4 = +[_NFHardwareManager sharedHardwareManager];
    id v5 = +[NFRoutingConfig embeddedWiredModeWithFD:2];
    BOOL v6 = [v4 setRoutingConfig:v5];

    BOOL v7 = v6 == 0;
    if (!v6) {
      self->_inWiredMode = 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_NFContactlessPaymentSession;
    if ([(_NFContactlessSession *)&v9 startWiredMode])
    {
      BOOL v7 = 1;
      self->_inWiredMode = 1;
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)startDefaultMode
{
  [(_NFContactlessPaymentSession *)self waitForSafeTransactionCompletion];
  v5.receiver = self;
  v5.super_class = (Class)_NFContactlessPaymentSession;
  BOOL v3 = [(_NFContactlessSession *)&v5 startDefaultMode];
  if (v3) {
    self->_inWiredMode = 0;
  }
  return v3;
}

- (BOOL)startFieldDetectMode
{
  [(_NFContactlessPaymentSession *)self waitForSafeTransactionCompletion];
  kdebug_trace();
  BOOL v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_FD", "start Field Detect Mode", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessPaymentSession;
  BOOL v4 = [(_NFContactlessSession *)&v6 startFieldDetectMode];
  if (v4) {
    self->_inWiredMode = 0;
  }
  return v4;
}

- (void)waitForSafeTransactionCompletion
{
  if (!self->_dontWaitForEOT && !self->_inWiredMode)
  {
    unsigned int transactionState = self->_transactionState;
    if (transactionState == 2)
    {
      uint64_t v49 = [(_NFContactlessSession *)self activeApplet];
      v50 = [v49 moduleIdentifier];
      id v51 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002840E8 length:10];
      int v52 = [v51 NF_asHexString];
      id v53 = [v50 caseInsensitiveCompare:v52];

      if (!v53)
      {
        usleep(0x61A80u);
LABEL_68:
        self->_unsigned int transactionState = 0;
        return;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v55 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v59 = 45;
        if (isMetaClass) {
          uint64_t v59 = 43;
        }
        v55(6, "%c[%{public}s %{public}s]:%i Waiting for RAPDU Sent notification", v59, ClassName, Name, 1058);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        id v61 = object_getClass(self);
        if (class_isMetaClass(v61)) {
          int v62 = 43;
        }
        else {
          int v62 = 45;
        }
        *(_DWORD *)uint64_t buf = 67109890;
        int v87 = v62;
        __int16 v88 = 2082;
        v89 = object_getClassName(self);
        __int16 v90 = 2082;
        v91 = sel_getName(a2);
        __int16 v92 = 1024;
        int v93 = 1058;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for RAPDU Sent notification", buf, 0x22u);
      }

      unsigned int v63 = -10;
      while (1)
      {
        int v64 = [(_NFContactlessSession *)self secureElementWrapper];
        __int16 v65 = [v64 handle];
        unsigned int v66 = [v65 hasSentRAPDU];

        if (v66) {
          break;
        }
        __int16 v67 = [(_NFContactlessSession *)self secureElementWrapper];
        int v68 = [v67 handle];
        int v69 = [v68 hasTransactionEnded];

        if ((v69 & 1) == 0)
        {
          usleep(0x2710u);
          v63 += 10;
          if (v63 >> 1 < 0x9BF) {
            continue;
          }
        }
        goto LABEL_16;
      }
      kdebug_trace();
      v80 = NFSharedSignpostLog();
      if (os_signpost_enabled(v80))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_RADPU_SENT", (const char *)&unk_100286819, buf, 2u);
      }

      usleep(0x30D40u);
    }
    else
    {
      if (transactionState != 4)
      {
LABEL_17:
        BOOL v17 = transactionState > 4;
        int v18 = (1 << transactionState) & 0x16;
        if (!v17 && v18 != 0)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v20 = NFLogGetLogger();
          if (v20)
          {
            int v21 = (void (*)(uint64_t, const char *, ...))v20;
            BOOL v22 = object_getClass(self);
            BOOL v23 = class_isMetaClass(v22);
            __int16 v24 = object_getClassName(self);
            v82 = sel_getName(a2);
            uint64_t v25 = 45;
            if (v23) {
              uint64_t v25 = 43;
            }
            v21(6, "%c[%{public}s %{public}s]:%i Waiting for transaction to end...", v25, v24, v82, 1080);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v26 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = object_getClass(self);
            if (class_isMetaClass(v27)) {
              int v28 = 43;
            }
            else {
              int v28 = 45;
            }
            BOOL v29 = object_getClassName(self);
            int v30 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67109890;
            int v87 = v28;
            __int16 v88 = 2082;
            v89 = v29;
            __int16 v90 = 2082;
            v91 = v30;
            __int16 v92 = 1024;
            int v93 = 1080;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for transaction to end...", buf, 0x22u);
          }

          unsigned int v31 = -50;
          while (1)
          {
            unsigned __int8 v32 = [(_NFContactlessSession *)self secureElementWrapper];
            uint64_t v33 = [v32 handle];
            unsigned int v34 = [v33 hasTransactionEnded];

            if (v34) {
              break;
            }
            usleep(0xC350u);
            v31 += 50;
            if (v31 >> 1 >= 0x9AB)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v35 = NFLogGetLogger();
              if (v35)
              {
                BOOL v36 = (void (*)(uint64_t, const char *, ...))v35;
                unsigned __int8 v37 = object_getClass(self);
                BOOL v38 = class_isMetaClass(v37);
                objc_super v39 = object_getClassName(self);
                v83 = sel_getName(a2);
                uint64_t v40 = 45;
                if (v38) {
                  uint64_t v40 = 43;
                }
                v36(3, "%c[%{public}s %{public}s]:%i Timed out", v40, v39, v83, 1096);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              int v41 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                int v42 = object_getClass(self);
                if (class_isMetaClass(v42)) {
                  int v43 = 43;
                }
                else {
                  int v43 = 45;
                }
                __int16 v44 = object_getClassName(self);
                id v45 = sel_getName(a2);
                *(_DWORD *)uint64_t buf = 67109890;
                int v87 = v43;
                __int16 v88 = 2082;
                v89 = v44;
                __int16 v90 = 2082;
                v91 = v45;
                __int16 v92 = 1024;
                int v93 = 1096;
                int v46 = "%c[%{public}s %{public}s]:%i Timed out";
                int v47 = v41;
                os_log_type_t v48 = OS_LOG_TYPE_ERROR;
LABEL_66:
                _os_log_impl((void *)&_mh_execute_header, v47, v48, v46, buf, 0x22u);
                goto LABEL_67;
              }
              goto LABEL_67;
            }
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v70 = NFLogGetLogger();
          if (v70)
          {
            __int16 v71 = (void (*)(uint64_t, const char *, ...))v70;
            v72 = object_getClass(self);
            BOOL v73 = class_isMetaClass(v72);
            v74 = object_getClassName(self);
            v85 = sel_getName(a2);
            uint64_t v75 = 45;
            if (v73) {
              uint64_t v75 = 43;
            }
            v71(6, "%c[%{public}s %{public}s]:%i transaction has completed", v75, v74, v85, 1088);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v41 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v76 = object_getClass(self);
            if (class_isMetaClass(v76)) {
              int v77 = 43;
            }
            else {
              int v77 = 45;
            }
            v78 = object_getClassName(self);
            v79 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67109890;
            int v87 = v77;
            __int16 v88 = 2082;
            v89 = v78;
            __int16 v90 = 2082;
            v91 = v79;
            __int16 v92 = 1024;
            int v93 = 1088;
            int v46 = "%c[%{public}s %{public}s]:%i transaction has completed";
            int v47 = v41;
            os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_66;
          }
LABEL_67:
        }
        goto LABEL_68;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v5 = NFLogGetLogger();
      if (v5)
      {
        objc_super v6 = (void (*)(uint64_t, const char *, ...))v5;
        BOOL v7 = object_getClass(self);
        BOOL v8 = class_isMetaClass(v7);
        objc_super v9 = object_getClassName(self);
        v81 = sel_getName(a2);
        uint64_t v10 = 45;
        if (v8) {
          uint64_t v10 = 43;
        }
        v6(6, "%c[%{public}s %{public}s]:%i Field lost before End Of Transaction - disabling emulation", v10, v9, v81, 1045);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = object_getClass(self);
        if (class_isMetaClass(v12)) {
          int v13 = 43;
        }
        else {
          int v13 = 45;
        }
        *(_DWORD *)uint64_t buf = 67109890;
        int v87 = v13;
        __int16 v88 = 2082;
        v89 = object_getClassName(self);
        __int16 v90 = 2082;
        v91 = sel_getName(a2);
        __int16 v92 = 1024;
        int v93 = 1045;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field lost before End Of Transaction - disabling emulation", buf, 0x22u);
      }
    }
    BOOL v14 = +[_NFHardwareManager sharedHardwareManager];
    id v15 = +[NFRoutingConfig embeddedWiredModeWithFD:0];
    id v16 = [v14 setRoutingConfig:v15];

LABEL_16:
    unsigned int transactionState = self->_transactionState;
    goto LABEL_17;
  }
}

- (BOOL)_isField:(id)a3 compatibleWithApplet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isTypeF] & 1) == 0 && (objc_msgSend(v6, "rfTechnology") & 3) != 0
    || [v7 isTypeF] && (objc_msgSend(v6, "rfTechnology") & 4) != 0)
  {
    char v10 = 1;
  }
  else
  {
    BOOL v8 = [(_NFSession *)self expressModeManager];
    objc_super v9 = [v7 identifier];
    char v10 = sub_10004F5F4(v8, v9, v6);
  }
  return v10;
}

- (BOOL)_checkActiveAppletCompatibilityWithField:(id)a3
{
  id v5 = a3;
  if ([v5 rfTechnology] == 8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Only ECP found; assumes active applet is compatible with reader",
        v11,
        ClassName,
        Name,
        1125);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)uint64_t buf = 67109890;
      int v94 = v14;
      __int16 v95 = 2082;
      v96 = object_getClassName(self);
      __int16 v97 = 2082;
      v98 = sel_getName(a2);
      __int16 v99 = 1024;
      int v100 = 1125;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only ECP found; assumes active applet is compatible with reader",
        buf,
        0x22u);
    }
    BOOL v15 = 1;
LABEL_75:

    goto LABEL_76;
  }
  id v16 = [(_NFContactlessSession *)self activeApplet];
  unsigned __int8 v17 = [(_NFContactlessPaymentSession *)self _isField:v5 compatibleWithApplet:v16];

  if ((v17 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))v18;
      uint64_t v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      BOOL v22 = object_getClassName(self);
      v83 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(6, "%c[%{public}s %{public}s]:%i Active applet not compatible with current field - checking for group members", v23, v22, v83, 1131);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      *(_DWORD *)uint64_t buf = 67109890;
      int v94 = v26;
      __int16 v95 = 2082;
      v96 = object_getClassName(self);
      __int16 v97 = 2082;
      v98 = sel_getName(a2);
      __int16 v99 = 1024;
      int v100 = 1131;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Active applet not compatible with current field - checking for group members", buf, 0x22u);
    }

    int v27 = [(_NFContactlessSession *)self activeAppletGroupMembers];
    id v28 = [v27 copy];

    if (v28)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v29 = NFLogGetLogger();
      if (v29)
      {
        int v30 = (void (*)(uint64_t, const char *, ...))v29;
        unsigned int v31 = object_getClass(self);
        BOOL v32 = class_isMetaClass(v31);
        v79 = object_getClassName(self);
        v84 = sel_getName(a2);
        uint64_t v33 = 45;
        if (v32) {
          uint64_t v33 = 43;
        }
        v30(6, "%c[%{public}s %{public}s]:%i Group applets: %{public}@", v33, v79, v84, 1135, v28);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      unsigned int v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = object_getClass(self);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        unsigned __int8 v37 = object_getClassName(self);
        BOOL v38 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67110146;
        int v94 = v36;
        __int16 v95 = 2082;
        v96 = v37;
        __int16 v97 = 2082;
        v98 = v38;
        __int16 v99 = 1024;
        int v100 = 1135;
        __int16 v101 = 2114;
        id v102 = v28;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Group applets: %{public}@", buf, 0x2Cu);
      }
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v12 = v28;
    id v39 = [v12 countByEnumeratingWithState:&v88 objects:v92 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v89;
LABEL_36:
      uint64_t v42 = 0;
      while (1)
      {
        if (*(void *)v89 != v41) {
          objc_enumerationMutation(v12);
        }
        int v43 = *(void **)(*((void *)&v88 + 1) + 8 * v42);
        if ([(_NFContactlessPaymentSession *)self _isField:v5 compatibleWithApplet:v43])
        {
          break;
        }
        if (v40 == (id)++v42)
        {
          id v40 = [v12 countByEnumeratingWithState:&v88 objects:v92 count:16];
          if (v40) {
            goto LABEL_36;
          }
          goto LABEL_63;
        }
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v44 = NFLogGetLogger();
      if (v44)
      {
        id v45 = (void (*)(uint64_t, const char *, ...))v44;
        int v46 = object_getClass(self);
        BOOL v47 = class_isMetaClass(v46);
        v80 = object_getClassName(self);
        v85 = sel_getName(a2);
        uint64_t v48 = 45;
        if (v47) {
          uint64_t v48 = 43;
        }
        v45(6, "%c[%{public}s %{public}s]:%i Found compatible group applet: %{public}@", v48, v80, v85, 1141, v43);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v49 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = object_getClass(self);
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        int v52 = object_getClassName(self);
        id v53 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67110146;
        int v94 = v51;
        __int16 v95 = 2082;
        v96 = v52;
        __int16 v97 = 2082;
        v98 = v53;
        __int16 v99 = 1024;
        int v100 = 1141;
        __int16 v101 = 2114;
        id v102 = v43;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found compatible group applet: %{public}@", buf, 0x2Cu);
      }

      uint64_t v54 = [(_NFContactlessSession *)self setActiveApplet:v43];
      if (!v54)
      {
        BOOL v15 = 1;
        BOOL v73 = v12;
        goto LABEL_74;
      }
      v55 = (void *)v54;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v56 = NFLogGetLogger();
      if (v56)
      {
        v57 = (void (*)(uint64_t, const char *, ...))v56;
        __int16 v58 = object_getClass(self);
        BOOL v59 = class_isMetaClass(v58);
        v60 = object_getClassName(self);
        v86 = sel_getName(a2);
        uint64_t v61 = 45;
        if (v59) {
          uint64_t v61 = 43;
        }
        v57(3, "%c[%{public}s %{public}s]:%i Failed to switch to group applet - firing auth failure", v61, v60, v86, 1144);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v62 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        unsigned int v63 = object_getClass(self);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        __int16 v65 = object_getClassName(self);
        unsigned int v66 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v94 = v64;
        __int16 v95 = 2082;
        v96 = v65;
        __int16 v97 = 2082;
        v98 = v66;
        __int16 v99 = 1024;
        int v100 = 1144;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to switch to group applet - firing auth failure", buf, 0x22u);
      }

      __int16 v67 = [(_NFXPCSession *)self remoteObject];
      [v67 didFailDeferredAuthorization];

      [(_NFContactlessPaymentSession *)self startDefaultMode];
    }
LABEL_63:

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v68 = NFLogGetLogger();
    if (v68)
    {
      int v69 = (void (*)(uint64_t, const char *, ...))v68;
      uint64_t v70 = object_getClass(self);
      BOOL v71 = class_isMetaClass(v70);
      v81 = object_getClassName(self);
      int v87 = sel_getName(a2);
      uint64_t v72 = 45;
      if (v71) {
        uint64_t v72 = 43;
      }
      v69(3, "%c[%{public}s %{public}s]:%i No compatible applet found for field: %{public}@", v72, v81, v87, 1155, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v73 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = object_getClass(self);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      v76 = object_getClassName(self);
      int v77 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67110146;
      int v94 = v75;
      __int16 v95 = 2082;
      v96 = v76;
      __int16 v97 = 2082;
      v98 = v77;
      __int16 v99 = 1024;
      int v100 = 1155;
      __int16 v101 = 2114;
      id v102 = v5;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No compatible applet found for field: %{public}@", buf, 0x2Cu);
    }
    BOOL v15 = 0;
LABEL_74:

    goto LABEL_75;
  }
  BOOL v15 = 1;
LABEL_76:

  return v15;
}

- (BOOL)_checkDeferredActiveAppletCompatibilityWithField:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFContactlessSession *)self deferredActivationApplet];
  id v7 = [(_NFContactlessPaymentSession *)self _switchToBestGroupMemberOfHead:v6 forField:v5];

  if (v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      objc_super v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Failed to _switchToBestGroupMember, back to defaultMode : %{public}@", v12, ClassName, Name, 1165, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)uint64_t buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      uint64_t v23 = object_getClassName(self);
      __int16 v24 = 2082;
      uint64_t v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 1165;
      __int16 v28 = 2114;
      uint64_t v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to _switchToBestGroupMember, back to defaultMode : %{public}@", buf, 0x2Cu);
    }

    id v16 = [(_NFXPCSession *)self remoteObject];
    [v16 didFailDeferredAuthorization];

    [(_NFContactlessPaymentSession *)self startDefaultMode];
  }

  return v7 == 0;
}

- (BOOL)_checkActiveVASCompatibilityWithField:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_NFContactlessPaymentSession *)self readyForVAS]
    && [v4 notificationType] == (id)2
    && [v4 terminalMode] < 3;

  return v5;
}

- (void)_performDeferredAuthIfNeeded:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i deferred requested:%d - field:%{public}@", v12, ClassName, Name, 1189, self->_deferredAuthRequested, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    id v16 = object_getClassName(self);
    unsigned __int8 v17 = sel_getName(a2);
    BOOL deferredAuthRequested = self->_deferredAuthRequested;
    *(_DWORD *)uint64_t buf = 67110402;
    int v53 = v15;
    __int16 v54 = 2082;
    v55 = v16;
    __int16 v56 = 2082;
    v57 = v17;
    __int16 v58 = 1024;
    int v59 = 1189;
    __int16 v60 = 1024;
    BOOL v61 = deferredAuthRequested;
    __int16 v62 = 2114;
    id v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i deferred requested:%d - field:%{public}@", buf, 0x32u);
  }

  if (!self->_deferredAuthRequested)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      __int16 v24 = (void (*)(uint64_t, const char *, ...))v23;
      uint64_t v25 = object_getClass(self);
      BOOL v26 = class_isMetaClass(v25);
      int v27 = object_getClassName(self);
      uint64_t v49 = sel_getName(a2);
      uint64_t v28 = 45;
      if (v26) {
        uint64_t v28 = 43;
      }
      v24(6, "%c[%{public}s %{public}s]:%i deferred auth not requested", v28, v27, v49, 1191);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    int v30 = object_getClass(self);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    BOOL v32 = object_getClassName(self);
    uint64_t v33 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v53 = v31;
    __int16 v54 = 2082;
    v55 = v32;
    __int16 v56 = 2082;
    v57 = v33;
    __int16 v58 = 1024;
    int v59 = 1191;
    unsigned int v34 = "%c[%{public}s %{public}s]:%i deferred auth not requested";
    uint64_t v35 = v29;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_34;
  }
  if (!self->_fieldPresent)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v37 = NFLogGetLogger();
    if (v37)
    {
      BOOL v38 = (void (*)(uint64_t, const char *, ...))v37;
      id v39 = object_getClass(self);
      BOOL v40 = class_isMetaClass(v39);
      uint64_t v41 = object_getClassName(self);
      v50 = sel_getName(a2);
      uint64_t v42 = 45;
      if (v40) {
        uint64_t v42 = 43;
      }
      v38(3, "%c[%{public}s %{public}s]:%i no field", v42, v41, v50, 1196);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v43 = object_getClass(self);
    if (class_isMetaClass(v43)) {
      int v44 = 43;
    }
    else {
      int v44 = 45;
    }
    id v45 = object_getClassName(self);
    int v46 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v53 = v44;
    __int16 v54 = 2082;
    v55 = v45;
    __int16 v56 = 2082;
    v57 = v46;
    __int16 v58 = 1024;
    int v59 = 1196;
    unsigned int v34 = "%c[%{public}s %{public}s]:%i no field";
    uint64_t v35 = v29;
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, 0x22u);
LABEL_35:

    goto LABEL_39;
  }
  unsigned int v19 = [(_NFContactlessPaymentSession *)self _checkActiveVASCompatibilityWithField:v5];
  uint64_t v20 = [(_NFContactlessSession *)self activeApplet];

  if (v20) {
    LODWORD(v20) = [(_NFContactlessPaymentSession *)self _checkActiveAppletCompatibilityWithField:v5];
  }
  int v21 = [(_NFContactlessSession *)self deferredActivationApplet];

  if (v21) {
    unsigned int v22 = [(_NFContactlessPaymentSession *)self _checkDeferredActiveAppletCompatibilityWithField:v5];
  }
  else {
    unsigned int v22 = 0;
  }
  if ((v20 | v22 | v19) == 1)
  {
    deferredAuth = self->_deferredAuth;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10013A36C;
    v51[3] = &unk_100304D50;
    v51[4] = self;
    [(_NFContactlessPaymentSession *)self _performAuthAndStartCardEmulation:deferredAuth fromDeferred:1 completion:v51];
    uint64_t v48 = self->_deferredAuth;
    self->_deferredAuth = 0;
  }
LABEL_39:
}

- (void)_performAuthAndStartCardEmulation:(id)a3 fromDeferred:(BOOL)a4 completion:(id)a5
{
  BOOL v87 = a4;
  BOOL v8 = (char *)a3;
  objc_super v9 = (void (**)(id, id))a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v16 = [(_NFXPCSession *)self clientName];
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1228, v16);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    unsigned int v22 = sel_getName(a2);
    uint64_t v23 = [(_NFXPCSession *)self clientName];
    *(_DWORD *)uint64_t buf = 67110146;
    int v94 = v20;
    __int16 v95 = 2082;
    v96 = v21;
    __int16 v97 = 2082;
    v98 = v22;
    __int16 v99 = 1024;
    int v100 = 1228;
    __int16 v101 = 2114;
    id v102 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v24 = NFLogGetLogger();
  if (v24)
  {
    uint64_t v25 = (void (*)(uint64_t, const char *, ...))v24;
    BOOL v26 = object_getClass(self);
    BOOL v27 = class_isMetaClass(v26);
    v85 = object_getClassName(self);
    v86 = sel_getName(a2);
    uint64_t v28 = 45;
    if (v27) {
      uint64_t v28 = 43;
    }
    v25(6, "%c[%{public}s %{public}s]:%i auth: %{public}@", v28, v85, v86, 1229, v8);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v29 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = object_getClass(self);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    BOOL v32 = object_getClassName(self);
    uint64_t v33 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67110146;
    int v94 = v31;
    __int16 v95 = 2082;
    v96 = v32;
    __int16 v97 = 2082;
    v98 = v33;
    __int16 v99 = 1024;
    int v100 = 1229;
    __int16 v101 = 2114;
    id v102 = v8;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i auth: %{public}@", buf, 0x2Cu);
  }

  unsigned int v34 = NFSharedSignpostLog();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", (const char *)&unk_100286819, buf, 2u);
  }

  self->_BOOL deferredAuthRequested = 0;
  [(NFTimer *)self->_deferredAuthTimer stopTimer];
  uint64_t v35 = [(_NFContactlessSession *)self secureElementWrapper];
  v88.receiver = self;
  v88.super_class = (Class)_NFContactlessPaymentSession;
  os_log_type_t v36 = [(_NFContactlessSession *)&v88 activeApplet];
  int v37 = sub_100252724((uint64_t)v35, v36);

  BOOL v38 = +[_NFHardwareManager sharedHardwareManager];
  id v39 = v38;
  if (v37) {
    uint64_t v40 = 2;
  }
  else {
    uint64_t v40 = 1;
  }
  [v38 reconfigureDynamicTransitRF:v40 withOverride:1];

  if (v8)
  {
    if (!v87
      || ([(_NFContactlessSession *)self activeApplet],
          uint64_t v41 = objc_claimAutoreleasedReturnValue(),
          v41,
          v41))
    {
      sub_1002535C4();
      kdebug_trace();
      uint64_t v42 = NFSharedSignpostLog();
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTHORIZE_APPLET", (const char *)&unk_100286819, buf, 2u);
      }

      if (![(_NFContactlessPaymentSession *)self _authorize:v8])
      {
        uint64_t v68 = NFSharedSignpostLog();
        if (os_signpost_enabled(v68))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", "error", buf, 2u);
        }

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v69 = NFLogGetLogger();
        if (v69)
        {
          uint64_t v70 = (void (*)(uint64_t, const char *, ...))v69;
          BOOL v71 = object_getClass(self);
          BOOL v72 = class_isMetaClass(v71);
          BOOL v73 = object_getClassName(self);
          v74 = sel_getName(a2);
          if (v87) {
            int v75 = "yes";
          }
          else {
            int v75 = "no";
          }
          uint64_t v76 = 45;
          if (v72) {
            uint64_t v76 = 43;
          }
          v70(3, "%c[%{public}s %{public}s]:%i Authorization failed.  For deferred - [%s]", v76, v73, v74, 1261, v75);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v77 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = object_getClass(self);
          if (class_isMetaClass(v78)) {
            int v79 = 43;
          }
          else {
            int v79 = 45;
          }
          v80 = object_getClassName(self);
          v81 = sel_getName(a2);
          *(_DWORD *)uint64_t buf = 67110146;
          if (v87) {
            v82 = "yes";
          }
          else {
            v82 = "no";
          }
          int v94 = v79;
          __int16 v95 = 2082;
          v96 = v80;
          __int16 v97 = 2082;
          v98 = v81;
          __int16 v99 = 1024;
          int v100 = 1261;
          __int16 v101 = 2080;
          id v102 = v82;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Authorization failed.  For deferred - [%s]", buf, 0x2Cu);
        }

        id v83 = objc_alloc((Class)NSError);
        __int16 v62 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
        id v63 = +[NSString stringWithUTF8String:"Commmand Error"];
        __int16 v92 = v63;
        int v64 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        __int16 v65 = v83;
        unsigned int v66 = v62;
        uint64_t v67 = 16;
        goto LABEL_78;
      }
    }
  }
  kdebug_trace();
  int v43 = NFSharedSignpostLog();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "START_PAYMENT_EMULATION", (const char *)&unk_100286819, buf, 2u);
  }

  if (![(_NFContactlessPaymentSession *)self startCardEmulationWithType:[(_NFContactlessPaymentSession *)self defaultEmulationType]])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v46 = NFLogGetLogger();
    if (v46)
    {
      BOOL v47 = (void (*)(uint64_t, const char *, ...))v46;
      uint64_t v48 = object_getClass(self);
      BOOL v49 = class_isMetaClass(v48);
      v50 = object_getClassName(self);
      int v51 = sel_getName(a2);
      if (v87) {
        int v52 = " (from) deferred";
      }
      else {
        int v52 = "";
      }
      uint64_t v53 = 45;
      if (v49) {
        uint64_t v53 = 43;
      }
      v47(3, "%c[%{public}s %{public}s]:%i Failed to start%s card emulation", v53, v50, v51, 1272, v52);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v54 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = object_getClass(self);
      if (class_isMetaClass(v55)) {
        int v56 = 43;
      }
      else {
        int v56 = 45;
      }
      v57 = object_getClassName(self);
      __int16 v58 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67110146;
      if (v87) {
        int v59 = " (from) deferred";
      }
      else {
        int v59 = "";
      }
      int v94 = v56;
      __int16 v95 = 2082;
      v96 = v57;
      __int16 v97 = 2082;
      v98 = v58;
      __int16 v99 = 1024;
      int v100 = 1272;
      __int16 v101 = 2080;
      id v102 = v59;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start%s card emulation", buf, 0x2Cu);
    }

    if (self->_hasAuthorized) {
      [(_NFContactlessPaymentSession *)self _deauthorize];
    }
    __int16 v60 = NFSharedSignpostLog();
    if (os_signpost_enabled(v60))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", "error", buf, 2u);
    }

    id v61 = objc_alloc((Class)NSError);
    __int16 v62 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    id v63 = +[NSString stringWithUTF8String:"Stack Error"];
    long long v90 = v63;
    int v64 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    __int16 v65 = v61;
    unsigned int v66 = v62;
    uint64_t v67 = 15;
LABEL_78:
    id v84 = [v65 initWithDomain:v66 code:v67 userInfo:v64];
    v9[2](v9, v84);

    [(_NFContactlessPaymentSession *)self startDefaultMode];
    goto LABEL_79;
  }
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100323140];
  sub_100222D30((uint64_t)NFDailyStatisticsCALogger, @"totalCEEnable");
  int v44 = NFSharedSignpostLog();
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "performAuthAndStartCardEmulation", (const char *)&unk_100286819, buf, 2u);
  }

  if (!v87)
  {
    kdebug_trace();
    id v45 = NFSharedSignpostLog();
    if (os_signpost_enabled(v45))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLIENT_CALLBACK", (const char *)&unk_100286819, buf, 2u);
    }
  }
  v9[2](v9, 0);
LABEL_79:
}

- (id)_switchToBestGroupMemberOfHead:(id)a3 forField:(id)a4
{
  id v6 = a3;
  id v64 = a4;
  id v7 = [(_NFSession *)self workQueue];
  dispatch_assert_queue_V2(v7);

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  __int16 v62 = v6;
  BOOL v8 = [v6 groupMemberIDs];
  id v9 = [v8 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v66;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v66 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        int v14 = [(_NFContactlessSession *)self secureElementWrapper];
        int v15 = sub_1002473C8(v14, v13);

        if (v15)
        {
          id v16 = [(_NFSession *)self expressModeManager];
          uint64_t v17 = [v15 identifier];
          int v18 = sub_10004F5F4(v16, v17, v64);

          if (v18)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v46 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              int v51 = [v15 identifier];
              uint64_t v52 = 45;
              if (isMetaClass) {
                uint64_t v52 = 43;
              }
              v46(6, "%c[%{public}s %{public}s]:%i Applet %{public}@ matches field, switching", v52, ClassName, Name, 1314, v51);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v53 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v54 = object_getClass(self);
              if (class_isMetaClass(v54)) {
                int v55 = 43;
              }
              else {
                int v55 = 45;
              }
              int v56 = object_getClassName(self);
              v57 = sel_getName(a2);
              __int16 v58 = [v15 identifier];
              *(_DWORD *)uint64_t buf = 67110146;
              int v70 = v55;
              __int16 v71 = 2082;
              BOOL v72 = v56;
              __int16 v73 = 2082;
              v74 = v57;
              __int16 v75 = 1024;
              int v76 = 1314;
              __int16 v77 = 2114;
              v78 = v58;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet %{public}@ matches field, switching", buf, 0x2Cu);
            }
            int v44 = [(_NFContactlessSession *)self setActiveApplet:v15];

            BOOL v38 = v62;
            goto LABEL_41;
          }
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v19 = NFLogGetLogger();
          if (v19)
          {
            int v20 = (void (*)(uint64_t, const char *, ...))v19;
            int v21 = object_getClass(self);
            BOOL v22 = class_isMetaClass(v21);
            __int16 v60 = object_getClassName(self);
            id v61 = sel_getName(a2);
            uint64_t v23 = 45;
            if (v22) {
              uint64_t v23 = 43;
            }
            v20(4, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", v23, v60, v61, 1305, v13);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v24 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = object_getClass(self);
            if (class_isMetaClass(v25)) {
              int v26 = 43;
            }
            else {
              int v26 = 45;
            }
            BOOL v27 = object_getClassName(self);
            uint64_t v28 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67110146;
            int v70 = v26;
            __int16 v71 = 2082;
            BOOL v72 = v27;
            __int16 v73 = 2082;
            v74 = v28;
            __int16 v75 = 1024;
            int v76 = 1305;
            __int16 v77 = 2114;
            v78 = v13;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", buf, 0x2Cu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v29 = NFLogGetLogger();
  if (v29)
  {
    int v30 = (void (*)(uint64_t, const char *, ...))v29;
    int v31 = object_getClass(self);
    BOOL v32 = class_isMetaClass(v31);
    uint64_t v33 = object_getClassName(self);
    unsigned int v34 = sel_getName(a2);
    uint64_t v35 = [v62 identifier];
    uint64_t v36 = 45;
    if (v32) {
      uint64_t v36 = 43;
    }
    v30(6, "%c[%{public}s %{public}s]:%i No group members matched the field, using head applet %{public}@", v36, v33, v34, 1319, v35);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v37 = NFSharedLogGetLogger();
  BOOL v38 = v62;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    uint64_t v41 = object_getClassName(self);
    uint64_t v42 = sel_getName(a2);
    int v43 = [v62 identifier];
    *(_DWORD *)uint64_t buf = 67110146;
    int v70 = v40;
    __int16 v71 = 2082;
    BOOL v72 = v41;
    __int16 v73 = 2082;
    v74 = v42;
    __int16 v75 = 1024;
    int v76 = 1319;
    __int16 v77 = 2114;
    v78 = v43;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No group members matched the field, using head applet %{public}@", buf, 0x2Cu);
  }
  int v44 = [(_NFContactlessSession *)self setActiveApplet:v62];
LABEL_41:

  return v44;
}

- (void)handleFieldChanged:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  id v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    CFStringRef v7 = @"OFF";
    if (v3) {
      CFStringRef v7 = @"ON";
    }
    *(_DWORD *)uint64_t buf = 138412290;
    *(void *)int v30 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFTRACE_FIELD_DETECT", "field %@", buf, 0xCu);
  }

  BOOL v8 = [(_NFSession *)self expressModeManager];
  if (v8)
  {
    int v9 = v8[172];

    if (v9)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v11(4, "%c[%{public}s %{public}s]:%i express mode in progress", v15, ClassName, Name, 1331);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = object_getClass(self);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        uint64_t v19 = object_getClassName(self);
        int v20 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        *(_DWORD *)int v30 = v18;
        *(_WORD *)&v30[4] = 2082;
        *(void *)&v30[6] = v19;
        __int16 v31 = 2082;
        BOOL v32 = v20;
        __int16 v33 = 1024;
        int v34 = 1331;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i express mode in progress", buf, 0x22u);
      }
      goto LABEL_23;
    }
  }
  if (!v3)
  {
    if (![(_NFContactlessSession *)self plasticCardMode])
    {
      uint64_t v21 = [(_NFContactlessSession *)self activeApplet];
      if (v21)
      {
        BOOL v22 = (void *)v21;
        uint64_t v23 = [(_NFContactlessSession *)self activeApplet];
        unsigned int v24 = [v23 isTypeF];

        if (v24)
        {
          [(_NFContactlessPaymentSession *)self _fireFelicaTransactionEndEvent];
          transactionStartEvent = self->_transactionStartEvent;
          self->_transactionStartEvent = 0;
        }
      }
    }
    if (self->_deferredAuthRequested)
    {
      id v16 = +[_NFHardwareManager sharedHardwareManager];
      [v16 restartDiscovery];
LABEL_23:
    }
  }
  if (!self->_fieldPresent)
  {
    fieldNotification = self->_fieldNotification;
    self->_fieldNotification = 0;
  }
  self->_fieldPresent = v3;
  v28.receiver = self;
  v28.super_class = (Class)_NFContactlessPaymentSession;
  [(_NFContactlessSession *)&v28 handleFieldChanged:v3];
}

- (void)handleFieldNotification:(id)a3
{
  id v5 = (NFFieldNotification *)a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    CFStringRef v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    BOOL deferredAuthRequested = self->_deferredAuthRequested;
    int v13 = [(_NFContactlessSession *)self deferredActivationApplet];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i deferredAuth = %d : deferredActivation: %{public}@", v14, ClassName, Name, 1360, deferredAuthRequested, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    int v18 = object_getClassName(self);
    uint64_t v19 = sel_getName(a2);
    BOOL v20 = self->_deferredAuthRequested;
    uint64_t v21 = [(_NFContactlessSession *)self deferredActivationApplet];
    *(_DWORD *)uint64_t buf = 67110402;
    int v26 = v17;
    __int16 v27 = 2082;
    objc_super v28 = v18;
    __int16 v29 = 2082;
    int v30 = v19;
    __int16 v31 = 1024;
    int v32 = 1360;
    __int16 v33 = 1024;
    BOOL v34 = v20;
    __int16 v35 = 2114;
    uint64_t v36 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i deferredAuth = %d : deferredActivation: %{public}@", buf, 0x32u);
  }
  fieldNotification = self->_fieldNotification;
  self->_fieldNotification = v5;
  uint64_t v23 = v5;

  v24.receiver = self;
  v24.super_class = (Class)_NFContactlessPaymentSession;
  [(_NFContactlessSession *)&v24 handleFieldNotification:v23];
  [(_NFContactlessPaymentSession *)self _performDeferredAuthIfNeeded:v23];
}

- (void)handleFieldReset
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
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1370);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)uint64_t buf = 67109890;
    int v28 = v12;
    __int16 v29 = 2082;
    int v30 = object_getClassName(self);
    __int16 v31 = 2082;
    int v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 1370;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (self->_transactionState == 1)
  {
    kdebug_trace();
    int v13 = NFSharedSignpostLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_TEAR", (const char *)&unk_100286819, buf, 2u);
    }

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFLogGetLogger();
    if (v14)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
      id v16 = object_getClass(self);
      BOOL v17 = class_isMetaClass(v16);
      int v18 = object_getClassName(self);
      int v26 = sel_getName(a2);
      uint64_t v19 = 45;
      if (v17) {
        uint64_t v19 = 43;
      }
      v15(5, "%c[%{public}s %{public}s]:%i Field loss before end of transaction", v19, v18, v26, 1375);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      uint64_t v23 = object_getClassName(self);
      objc_super v24 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v28 = v22;
      __int16 v29 = 2082;
      int v30 = v23;
      __int16 v31 = 2082;
      int v32 = v24;
      __int16 v33 = 1024;
      int v34 = 1375;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field loss before end of transaction", buf, 0x22u);
    }

    self->_unsigned int transactionState = 4;
  }
}

- (void)handleTimerExpiredEvent:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  id v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AUTH_EXPIRED", (const char *)&unk_100286819, buf, 2u);
  }

  PLLogRegisteredEvent();
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 1388, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(self);
    id v16 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67110146;
    int v51 = v14;
    __int16 v52 = 2082;
    uint64_t v53 = v15;
    __int16 v54 = 2082;
    int v55 = v16;
    __int16 v56 = 1024;
    int v57 = 1388;
    __int16 v58 = 2114;
    id v59 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v17 = (__CFString *)v5;
  id v18 = [(__CFString *)v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v23 = [(_NFContactlessSession *)self activeApplet];
        objc_super v24 = [v23 identifier];
        unsigned int v25 = [v22 isEqualToString:v24];

        if (v25)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v30 = NFLogGetLogger();
          if (v30)
          {
            __int16 v31 = (void (*)(uint64_t, const char *, ...))v30;
            int v32 = object_getClass(self);
            BOOL v33 = class_isMetaClass(v32);
            uint64_t v42 = object_getClassName(self);
            int v44 = sel_getName(a2);
            uint64_t v34 = 45;
            if (v33) {
              uint64_t v34 = 43;
            }
            v31(6, "%c[%{public}s %{public}s]:%i Firing timer expired event for %{public}@", v34, v42, v44, 1391, v22);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v35 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v36 = object_getClass(self);
            if (class_isMetaClass(v36)) {
              int v37 = 43;
            }
            else {
              int v37 = 45;
            }
            BOOL v38 = object_getClassName(self);
            id v39 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67110146;
            int v51 = v37;
            __int16 v52 = 2082;
            uint64_t v53 = v38;
            __int16 v54 = 2082;
            int v55 = v39;
            __int16 v56 = 1024;
            int v57 = 1391;
            __int16 v58 = 2114;
            id v59 = v22;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Firing timer expired event for %{public}@", buf, 0x2Cu);
          }

          int v40 = [(_NFXPCSession *)self remoteObject];
          [v40 didExpireTransactionForApplet:v22];
          __int16 v29 = v17;
          goto LABEL_34;
        }
      }
      id v19 = [(__CFString *)v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  int v26 = [(_NFContactlessSession *)self activeApplet];
  __int16 v27 = [v26 identifier];

  if (v27)
  {
    int v28 = [(_NFContactlessSession *)self activeApplet];
    __int16 v29 = [v28 identifier];
  }
  else
  {
    __int16 v29 = &stru_100309C40;
  }
  int v40 = [(_NFXPCSession *)self remoteObject];
  [v40 didExpireTransactionForApplet:v29];
LABEL_34:

  [(_NFContactlessPaymentSession *)self startDefaultMode];
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectForKeyedSubscript:@"DelayExpressReentry"];

  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"DelayExpressReentry"];
    [v11 doubleValue];
    self->_delayExpressMode = v12 / 1000.0;
  }
  else
  {
    self->_delayExpressMode = 0.0;
  }
  kdebug_trace();
  int v13 = NFSharedSignpostLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_START", "Transaction Start Event", buf, 2u);
  }

  PLLogRegisteredEvent();
  self->_dontWaitForEOT = 0;
  self->_ignoreRFEvents = 0;
  if (v9)
  {
    int v14 = [v9 valueForKey:@"DontWaitForEOT"];
    unsigned int v15 = [v14 BOOLValue];

    if (v15) {
      self->_dontWaitForEOT = 1;
    }
    id v16 = [v9 valueForKey:@"IgnoreRFEvents"];
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v23 = 45;
        if (isMetaClass) {
          uint64_t v23 = 43;
        }
        v19(5, "%c[%{public}s %{public}s]:%i Ignore RF events", v23, ClassName, Name, 1431);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      objc_super v24 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v25 = object_getClass(self);
        if (class_isMetaClass(v25)) {
          int v26 = 43;
        }
        else {
          int v26 = 45;
        }
        __int16 v27 = object_getClassName(self);
        int v28 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v112 = v26;
        __int16 v113 = 2082;
        v114 = v27;
        __int16 v115 = 2082;
        v116 = v28;
        __int16 v117 = 1024;
        int v118 = 1431;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Ignore RF events", buf, 0x22u);
      }

      self->_ignoreRFEvents = 1;
    }
  }
  __int16 v29 = [v9 objectForKeyedSubscript:@"EoTCallbackExpected"];
  unsigned int v30 = [v29 BOOLValue];

  if (v30) {
    self->_endOfTransactionRequired = 1;
  }
  if ([(_NFContactlessSession *)self plasticCardMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFLogGetLogger();
    if (v31)
    {
      int v32 = (void (*)(uint64_t, const char *, ...))v31;
      BOOL v33 = object_getClass(self);
      BOOL v34 = class_isMetaClass(v33);
      __int16 v35 = object_getClassName(self);
      v105 = sel_getName(a2);
      uint64_t v36 = 45;
      if (v34) {
        uint64_t v36 = 43;
      }
      v32(5, "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling start event", v36, v35, v105, 1442);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v37 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      int v40 = object_getClassName(self);
      uint64_t v41 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v112 = v39;
      __int16 v113 = 2082;
      v114 = v40;
      __int16 v115 = 2082;
      v116 = v41;
      __int16 v117 = 1024;
      int v118 = 1442;
      uint64_t v42 = "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling start event";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v42, buf, 0x22u);
      goto LABEL_80;
    }
    goto LABEL_80;
  }
  int v43 = [(_NFSession *)self expressModeManager];
  if (v43)
  {
    int v44 = v43[172];

    if (v44)
    {
      long long v45 = [(_NFContactlessSession *)self secureElementWrapper];
      long long v46 = [v8 appletIdentifier];
      int v37 = sub_1002473C8(v45, v46);

      if ([v37 isTypeF]
        && ([(_NFContactlessSession *)self secureElementWrapper],
            long long v47 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v48 = sub_100253528(v47, v37),
            v47,
            (v48 & 1) == 0))
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v73 = NFLogGetLogger();
        if (v73)
        {
          v74 = (void (*)(uint64_t, const char *, ...))v73;
          __int16 v75 = object_getClass(self);
          BOOL v76 = class_isMetaClass(v75);
          __int16 v77 = object_getClassName(self);
          v108 = sel_getName(a2);
          uint64_t v78 = 45;
          if (v76) {
            uint64_t v78 = 43;
          }
          v74(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction start event", v78, v77, v108, 1449);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v56 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_67;
        }
        int v79 = object_getClass(self);
        if (class_isMetaClass(v79)) {
          int v80 = 43;
        }
        else {
          int v80 = 45;
        }
        v81 = object_getClassName(self);
        v82 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v112 = v80;
        __int16 v113 = 2082;
        v114 = v81;
        __int16 v115 = 2082;
        v116 = v82;
        __int16 v117 = 1024;
        int v118 = 1449;
        id v61 = "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction start event";
      }
      else
      {
        unsigned int v49 = [v8 background];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v50 = NFLogGetLogger();
        int v51 = (void (*)(uint64_t, const char *, ...))v50;
        if (!v49)
        {
          if (v50)
          {
            __int16 v62 = object_getClass(self);
            BOOL v63 = class_isMetaClass(v62);
            id v64 = object_getClassName(self);
            v107 = sel_getName(a2);
            uint64_t v65 = 45;
            if (v63) {
              uint64_t v65 = 43;
            }
            v51(6, "%c[%{public}s %{public}s]:%i firing express transaction started state", v65, v64, v107, 1457);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          long long v66 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            long long v67 = object_getClass(self);
            if (class_isMetaClass(v67)) {
              int v68 = 43;
            }
            else {
              int v68 = 45;
            }
            uint64_t v69 = object_getClassName(self);
            int v70 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67109890;
            int v112 = v68;
            __int16 v113 = 2082;
            v114 = v69;
            __int16 v115 = 2082;
            v116 = v70;
            __int16 v117 = 1024;
            int v118 = 1457;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing express transaction started state", buf, 0x22u);
          }

          __int16 v71 = [(_NFXPCSession *)self remoteObject];
          BOOL v72 = [v8 appletIdentifier];
          [v71 didExpressModeStateChange:2 withObject:v72];

          self->_sendExpressModeEnded = 0;
          goto LABEL_80;
        }
        if (v50)
        {
          __int16 v52 = object_getClass(self);
          BOOL v53 = class_isMetaClass(v52);
          __int16 v54 = object_getClassName(self);
          v106 = sel_getName(a2);
          uint64_t v55 = 45;
          if (v53) {
            uint64_t v55 = 43;
          }
          v51(6, "%c[%{public}s %{public}s]:%i ignoring express mode update for background event.", v55, v54, v106, 1454);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v56 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
LABEL_67:

          goto LABEL_80;
        }
        int v57 = object_getClass(self);
        if (class_isMetaClass(v57)) {
          int v58 = 43;
        }
        else {
          int v58 = 45;
        }
        id v59 = object_getClassName(self);
        __int16 v60 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v112 = v58;
        __int16 v113 = 2082;
        v114 = v59;
        __int16 v115 = 2082;
        v116 = v60;
        __int16 v117 = 1024;
        int v118 = 1454;
        id v61 = "%c[%{public}s %{public}s]:%i ignoring express mode update for background event.";
      }
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, v61, buf, 0x22u);
      goto LABEL_67;
    }
  }
  if (self->_inWiredMode
    && ![(_NFContactlessPaymentSession *)self allowTransactionsInWiredMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v94 = NFLogGetLogger();
    if (v94)
    {
      __int16 v95 = (void (*)(uint64_t, const char *, ...))v94;
      v96 = object_getClass(self);
      BOOL v97 = class_isMetaClass(v96);
      v98 = object_getClassName(self);
      v110 = sel_getName(a2);
      uint64_t v99 = 45;
      if (v97) {
        uint64_t v99 = 43;
      }
      v95(5, "%c[%{public}s %{public}s]:%i Suppresing Start Event when in Wired", v99, v98, v110, 1466);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v37 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v100 = object_getClass(self);
      if (class_isMetaClass(v100)) {
        int v101 = 43;
      }
      else {
        int v101 = 45;
      }
      id v102 = object_getClassName(self);
      v103 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v112 = v101;
      __int16 v113 = 2082;
      v114 = v102;
      __int16 v115 = 2082;
      v116 = v103;
      __int16 v117 = 1024;
      int v118 = 1466;
      uint64_t v42 = "%c[%{public}s %{public}s]:%i Suppresing Start Event when in Wired";
      goto LABEL_32;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v83 = NFLogGetLogger();
    if (v83)
    {
      id v84 = (void (*)(uint64_t, const char *, ...))v83;
      v85 = object_getClass(self);
      BOOL v86 = class_isMetaClass(v85);
      BOOL v87 = object_getClassName(self);
      v109 = sel_getName(a2);
      uint64_t v88 = 45;
      if (v86) {
        uint64_t v88 = 43;
      }
      v84(6, "%c[%{public}s %{public}s]:%i firing start transaction callback", v88, v87, v109, 1469);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NSErrorUserInfoKey v89 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      long long v90 = object_getClass(self);
      if (class_isMetaClass(v90)) {
        int v91 = 43;
      }
      else {
        int v91 = 45;
      }
      __int16 v92 = object_getClassName(self);
      int v93 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v112 = v91;
      __int16 v113 = 2082;
      v114 = v92;
      __int16 v115 = 2082;
      v116 = v93;
      __int16 v117 = 1024;
      int v118 = 1469;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing start transaction callback", buf, 0x22u);
    }

    self->_unsigned int transactionState = 1;
    objc_storeStrong((id *)&self->_transactionStartEvent, a3);
    int v37 = [(_NFXPCSession *)self remoteObject];
    [v37 didStartTransaction:v8];
  }
LABEL_80:
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  kdebug_trace();
  id v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_END", "Transaction End Event", buf, 2u);
  }

  PLLogRegisteredEvent();
  id v10 = [v8 valueForKey:@"DontWaitForEOT"];

  if (v10)
  {
    uint64_t v11 = [v8 valueForKey:@"DontWaitForEOT"];
    self->_BOOL dontWaitForEOT = [v11 BOOLValue];

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i ATLEndEventDontWaitForEOT: %d", v18, ClassName, Name, 1487, self->_dontWaitForEOT);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      int v22 = object_getClassName(self);
      uint64_t v23 = sel_getName(a2);
      BOOL dontWaitForEOT = self->_dontWaitForEOT;
      *(_DWORD *)uint64_t buf = 67110146;
      int v142 = v21;
      __int16 v143 = 2082;
      v144 = v22;
      __int16 v145 = 2082;
      v146 = v23;
      __int16 v147 = 1024;
      int v148 = 1487;
      __int16 v149 = 1024;
      LODWORD(v150) = dontWaitForEOT;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ATLEndEventDontWaitForEOT: %d", buf, 0x28u);
    }
  }
  if ([(_NFContactlessSession *)self plasticCardMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      int v26 = (void (*)(uint64_t, const char *, ...))v25;
      __int16 v27 = object_getClass(self);
      BOOL v28 = class_isMetaClass(v27);
      __int16 v29 = object_getClassName(self);
      v132 = sel_getName(a2);
      uint64_t v30 = 45;
      if (v28) {
        uint64_t v30 = 43;
      }
      v26(5, "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling end event", v30, v29, v132, 1491);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_66;
    }
    int v32 = object_getClass(self);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    BOOL v34 = object_getClassName(self);
    __int16 v35 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v142 = v33;
    __int16 v143 = 2082;
    v144 = v34;
    __int16 v145 = 2082;
    v146 = v35;
    __int16 v147 = 1024;
    int v148 = 1491;
    uint64_t v36 = "%c[%{public}s %{public}s]:%i Plastic card mode active - not handling end event";
    goto LABEL_24;
  }
  int v37 = [(_NFSession *)self expressModeManager];
  if (v37)
  {
    int v38 = v37[172];

    if (v38)
    {
      int v39 = [(_NFContactlessSession *)self secureElementWrapper];
      int v40 = [v7 appletIdentifier];
      uint64_t v31 = sub_1002473C8(v39, v40);

      if ([v31 isTypeF]
        && ([(_NFContactlessSession *)self secureElementWrapper],
            uint64_t v41 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v42 = sub_100253528(v41, v31),
            v41,
            (v42 & 1) == 0))
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v62 = NFLogGetLogger();
        if (v62)
        {
          BOOL v63 = (void (*)(uint64_t, const char *, ...))v62;
          id v64 = object_getClass(self);
          BOOL v65 = class_isMetaClass(v64);
          long long v66 = object_getClassName(self);
          v134 = sel_getName(a2);
          uint64_t v67 = 45;
          if (v65) {
            uint64_t v67 = 43;
          }
          v63(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction end event", v67, v66, v134, 1501);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        unsigned int v49 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_65;
        }
        int v68 = object_getClass(self);
        if (class_isMetaClass(v68)) {
          int v69 = 43;
        }
        else {
          int v69 = 45;
        }
        int v70 = object_getClassName(self);
        __int16 v71 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v142 = v69;
        __int16 v143 = 2082;
        v144 = v70;
        __int16 v145 = 2082;
        v146 = v71;
        __int16 v147 = 1024;
        int v148 = 1501;
        __int16 v54 = "%c[%{public}s %{public}s]:%i applet v2.0 - dropping transaction end event";
      }
      else if ([v7 background])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v43 = NFLogGetLogger();
        if (v43)
        {
          int v44 = (void (*)(uint64_t, const char *, ...))v43;
          long long v45 = object_getClass(self);
          BOOL v46 = class_isMetaClass(v45);
          long long v47 = object_getClassName(self);
          v133 = sel_getName(a2);
          uint64_t v48 = 45;
          if (v46) {
            uint64_t v48 = 43;
          }
          v44(6, "%c[%{public}s %{public}s]:%i ignoring express mode update for background event", v48, v47, v133, 1506);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        unsigned int v49 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_65;
        }
        uint64_t v50 = object_getClass(self);
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        __int16 v52 = object_getClassName(self);
        BOOL v53 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v142 = v51;
        __int16 v143 = 2082;
        v144 = v52;
        __int16 v145 = 2082;
        v146 = v53;
        __int16 v147 = 1024;
        int v148 = 1506;
        __int16 v54 = "%c[%{public}s %{public}s]:%i ignoring express mode update for background event";
      }
      else
      {
        uint64_t v55 = [(_NFSession *)self expressModeManager];
        if (v55 && v55[40] >= 6u)
        {
          BOOL sendExpressModeEnded = self->_sendExpressModeEnded;

          if (!sendExpressModeEnded)
          {
            int v57 = [(_NFXPCSession *)self remoteObject];
            uint64_t v58 = [(_NFSession *)self expressModeManager];
            id v59 = (void *)v58;
            if (v58) {
              uint64_t v60 = *(unsigned int *)(v58 + 160);
            }
            else {
              uint64_t v60 = 0;
            }
            id v61 = [v7 appletIdentifier];
            [v57 didExpressModeStateChange:v60 withObject:v61];

            self->_BOOL sendExpressModeEnded = 1;
            goto LABEL_66;
          }
        }
        else
        {
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v72 = NFLogGetLogger();
        if (v72)
        {
          uint64_t v73 = (void (*)(uint64_t, const char *, ...))v72;
          v74 = object_getClass(self);
          BOOL v75 = class_isMetaClass(v74);
          BOOL v76 = object_getClassName(self);
          v135 = sel_getName(a2);
          uint64_t v77 = 45;
          if (v75) {
            uint64_t v77 = 43;
          }
          v73(6, "%c[%{public}s %{public}s]:%i Express transaction already ended - ignoring", v77, v76, v135, 1516);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        unsigned int v49 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_65;
        }
        uint64_t v78 = object_getClass(self);
        if (class_isMetaClass(v78)) {
          int v79 = 43;
        }
        else {
          int v79 = 45;
        }
        int v80 = object_getClassName(self);
        v81 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67109890;
        int v142 = v79;
        __int16 v143 = 2082;
        v144 = v80;
        __int16 v145 = 2082;
        v146 = v81;
        __int16 v147 = 1024;
        int v148 = 1516;
        __int16 v54 = "%c[%{public}s %{public}s]:%i Express transaction already ended - ignoring";
      }
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v54, buf, 0x22u);
LABEL_65:

      goto LABEL_66;
    }
  }
  if (self->_inWiredMode
    && ![(_NFContactlessPaymentSession *)self allowTransactionsInWiredMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v96 = NFLogGetLogger();
    if (v96)
    {
      BOOL v97 = (void (*)(uint64_t, const char *, ...))v96;
      v98 = object_getClass(self);
      BOOL v99 = class_isMetaClass(v98);
      int v100 = object_getClassName(self);
      v137 = sel_getName(a2);
      uint64_t v101 = 45;
      if (v99) {
        uint64_t v101 = 43;
      }
      v97(5, "%c[%{public}s %{public}s]:%i Suppresing End Event when in Wired", v101, v100, v137, 1523);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_66;
    }
    id v102 = object_getClass(self);
    if (class_isMetaClass(v102)) {
      int v103 = 43;
    }
    else {
      int v103 = 45;
    }
    v104 = object_getClassName(self);
    v105 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v142 = v103;
    __int16 v143 = 2082;
    v144 = v104;
    __int16 v145 = 2082;
    v146 = v105;
    __int16 v147 = 1024;
    int v148 = 1523;
    uint64_t v36 = "%c[%{public}s %{public}s]:%i Suppresing End Event when in Wired";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v36, buf, 0x22u);
LABEL_66:

    goto LABEL_67;
  }
  int transactionState = self->_transactionState;
  if (transactionState == 2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v106 = NFLogGetLogger();
    if (v106)
    {
      v107 = (void (*)(uint64_t, const char *, ...))v106;
      v108 = object_getClass(self);
      BOOL v109 = class_isMetaClass(v108);
      v110 = object_getClassName(self);
      v138 = sel_getName(a2);
      uint64_t v111 = 45;
      if (v109) {
        uint64_t v111 = 43;
      }
      v107(6, "%c[%{public}s %{public}s]:%i Transaction already ended, ignoring", v111, v110, v138, 1545);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v31 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_66;
    }
    int v112 = object_getClass(self);
    if (class_isMetaClass(v112)) {
      int v113 = 43;
    }
    else {
      int v113 = 45;
    }
    v114 = object_getClassName(self);
    __int16 v115 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v142 = v113;
    __int16 v143 = 2082;
    v144 = v114;
    __int16 v145 = 2082;
    v146 = v115;
    __int16 v147 = 1024;
    int v148 = 1545;
    uint64_t v36 = "%c[%{public}s %{public}s]:%i Transaction already ended, ignoring";
    goto LABEL_24;
  }
  if (transactionState == 4 && !self->_ignoreRFEvents)
  {
    id v116 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:&off_1003231E0];
    __int16 v117 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];

    if (v117)
    {
      int v118 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];
      [v116 setObject:v118 forKey:@"appletIdentifier"];
    }
    v140 = v116;
    v119 = [[NFContactlessPaymentEndEvent alloc] initWithDictionary:v116];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v120 = NFLogGetLogger();
    if (v120)
    {
      v121 = (void (*)(uint64_t, const char *, ...))v120;
      v122 = object_getClass(self);
      BOOL v123 = class_isMetaClass(v122);
      v131 = object_getClassName(self);
      v139 = sel_getName(a2);
      uint64_t v124 = 45;
      if (v123) {
        uint64_t v124 = 43;
      }
      v121(5, "%c[%{public}s %{public}s]:%i Field Lost before transaction ended: firing: %{public}@", v124, v131, v139, 1541, v119);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v125 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = object_getClass(self);
      if (class_isMetaClass(v126)) {
        int v127 = 43;
      }
      else {
        int v127 = 45;
      }
      v128 = object_getClassName(self);
      v129 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67110146;
      int v142 = v127;
      __int16 v143 = 2082;
      v144 = v128;
      __int16 v145 = 2082;
      v146 = v129;
      __int16 v147 = 1024;
      int v148 = 1541;
      __int16 v149 = 2114;
      v150 = v119;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Field Lost before transaction ended: firing: %{public}@", buf, 0x2Cu);
    }

    v130 = [(_NFXPCSession *)self remoteObject];
    [v130 didEndTransaction:v119];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v83 = NFLogGetLogger();
    if (v83)
    {
      id v84 = (void (*)(uint64_t, const char *, ...))v83;
      v85 = object_getClass(self);
      BOOL v86 = class_isMetaClass(v85);
      BOOL v87 = object_getClassName(self);
      v136 = sel_getName(a2);
      uint64_t v88 = 45;
      if (v86) {
        uint64_t v88 = 43;
      }
      v84(6, "%c[%{public}s %{public}s]:%i firing end transaction callback", v88, v87, v136, 1549);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    NSErrorUserInfoKey v89 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      long long v90 = object_getClass(self);
      if (class_isMetaClass(v90)) {
        int v91 = 43;
      }
      else {
        int v91 = 45;
      }
      __int16 v92 = object_getClassName(self);
      int v93 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v142 = v91;
      __int16 v143 = 2082;
      v144 = v92;
      __int16 v145 = 2082;
      v146 = v93;
      __int16 v147 = 1024;
      int v148 = 1549;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i firing end transaction callback", buf, 0x22u);
    }

    self->_int transactionState = 2;
    uint64_t v94 = [(_NFXPCSession *)self remoteObject];
    [v94 didEndTransaction:v7];
  }
  transactionStartEvent = self->_transactionStartEvent;
  self->_transactionStartEvent = 0;

  [(_NFContactlessPaymentSession *)self _deauthorize];
  if (self->_delayExpressMode <= 0.0) {
    [(_NFContactlessPaymentSession *)self startDefaultMode];
  }
  else {
    -[_NFContactlessPaymentSession pauseExpressAndStartDefaultModeAfter:](self, "pauseExpressAndStartDefaultModeAfter:");
  }
LABEL_67:
}

- (void)pauseExpressAndStartDefaultModeAfter:(double)a3
{
  [(NFTimer *)self->_restartRoutingTimer stopTimer];
  objc_initWeak(&location, self);
  id v6 = objc_alloc((Class)NFTimer);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10013DD0C;
  v23[3] = &unk_1003022A0;
  objc_copyWeak(v24, &location);
  v24[1] = (id)a2;
  v22.receiver = self;
  v22.super_class = (Class)_NFContactlessPaymentSession;
  id v7 = [(_NFSession *)&v22 workQueue];
  id v8 = (NFTimer *)[v6 initWithCallback:v23 queue:v7];
  restartRoutingTimer = self->_restartRoutingTimer;
  self->_restartRoutingTimer = v8;

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v12 = 43;
    }
    else {
      uint64_t v12 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Pausing express mode after ATL transaction", v12, ClassName, Name, 1590);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  unsigned int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    uint64_t v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67109890;
    int v27 = v17;
    __int16 v28 = 2082;
    __int16 v29 = v18;
    __int16 v30 = 2082;
    uint64_t v31 = v19;
    __int16 v32 = 1024;
    int v33 = 1590;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Pausing express mode after ATL transaction", buf, 0x22u);
  }

  uint64_t v20 = [(_NFSession *)self expressModeManager];
  int v21 = v20;
  if (v20) {
    sub_10004360C(v20, 1u, 1u);
  }

  [(NFTimer *)self->_restartRoutingTimer startTimer:a3 leeway:0.5];
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (BOOL)_requiresDeferredActivation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002840F2 length:16];
  id v6 = [v5 NF_asHexString];

  id v7 = [objc_alloc((Class)NSData) initWithBytes:&unk_1002840E8 length:10];
  int v37 = [v7 NF_asHexString];

  id v8 = [v4 moduleIdentifier];
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [v4 groupMemberIDs];
    id v10 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v10)
    {
      id v11 = v10;
      id v34 = v4;
      uint64_t v12 = *(void *)v39;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unsigned int v15 = [(_NFContactlessSession *)self secureElementWrapper];
          id v16 = sub_1002473C8(v15, v14);

          if (v16)
          {
            int v17 = [v16 moduleIdentifier];
            if ([v17 isEqualToString:v6])
            {

LABEL_27:
              BOOL v30 = 1;
              goto LABEL_28;
            }
            uint64_t v18 = [v16 moduleIdentifier];
            unsigned __int8 v19 = [v18 isEqualToString:v37];

            if (v19) {
              goto LABEL_27;
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v21 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v24 = 45;
              if (isMetaClass) {
                uint64_t v24 = 43;
              }
              v21(4, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", v24, ClassName, Name, 1630, v14);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v25 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              int v26 = object_getClass(self);
              if (class_isMetaClass(v26)) {
                int v27 = 43;
              }
              else {
                int v27 = 45;
              }
              __int16 v28 = object_getClassName(self);
              __int16 v29 = sel_getName(a2);
              *(_DWORD *)uint64_t buf = 67110146;
              int v43 = v27;
              __int16 v44 = 2082;
              long long v45 = v28;
              __int16 v46 = 2082;
              long long v47 = v29;
              __int16 v48 = 1024;
              int v49 = 1630;
              __int16 v50 = 2114;
              int v51 = v14;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Got AID %{public}@ from groupMemberIDs, but secureElementWrapper couldn't find it?!", buf, 0x2Cu);
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      BOOL v30 = 0;
LABEL_28:
      id v4 = v34;
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (void)handleSecureElementEndOfOperation
{
  kdebug_trace();
  BOOL v3 = NFSharedSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TX_EOO", "Tx End Of Operation", v4, 2u);
  }

  self->_int transactionState = 3;
}

- (void)handleExpressModeStarted
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
    id v10 = [(_NFSession *)self expressModeManager];
    id v11 = sub_10003EF24(v10);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode entered", v12, ClassName, Name, 1652, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    id v16 = object_getClassName(self);
    int v17 = sel_getName(a2);
    uint64_t v18 = [(_NFSession *)self expressModeManager];
    unsigned __int8 v19 = sub_10003EF24(v18);
    *(_DWORD *)uint64_t buf = 67110146;
    int v25 = v15;
    __int16 v26 = 2082;
    int v27 = v16;
    __int16 v28 = 2082;
    __int16 v29 = v17;
    __int16 v30 = 1024;
    int v31 = 1652;
    __int16 v32 = 2114;
    int v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode entered", buf, 0x2Cu);
  }
  uint64_t v20 = [(_NFSession *)self expressModeManager];
  sub_10003EF24(v20);
  int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  expressType = self->_expressType;
  self->_expressType = v21;

  uint64_t v23 = [(_NFXPCSession *)self remoteObject];
  [v23 didExpressModeStateChange:1 withObject:self->_expressType];
}

- (void)handleExpressModeExited
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
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode exited", v10, ClassName, Name, 1660, self->_expressType);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    expressType = self->_expressType;
    *(_DWORD *)uint64_t buf = 67110146;
    int v20 = v13;
    __int16 v21 = 2082;
    objc_super v22 = v14;
    __int16 v23 = 2082;
    uint64_t v24 = v15;
    __int16 v25 = 1024;
    int v26 = 1660;
    __int16 v27 = 2114;
    __int16 v28 = expressType;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode exited", buf, 0x2Cu);
  }

  int v17 = [(_NFXPCSession *)self remoteObject];
  [v17 didExpressModeStateChange:4 withObject:self->_expressType];

  uint64_t v18 = self->_expressType;
  self->_expressType = 0;

  if (self->_delayExpressMode > 0.0) {
    -[_NFContactlessPaymentSession pauseExpressAndStartDefaultModeAfter:](self, "pauseExpressAndStartDefaultModeAfter:");
  }
}

- (void)handleExpressModeTimeout
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
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i %{public}@ express mode timeout", v10, ClassName, Name, 1674, self->_expressType);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    int v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    expressType = self->_expressType;
    *(_DWORD *)uint64_t buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    __int16 v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 1674;
    __int16 v26 = 2114;
    __int16 v27 = expressType;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ express mode timeout", buf, 0x2Cu);
  }

  if (![(_NFContactlessSession *)self plasticCardMode])
  {
    int v17 = [(_NFXPCSession *)self remoteObject];
    [v17 didExpressModeStateChange:3 withObject:self->_expressType];
  }
}

- (void)handleAppletInactivityTimeout:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Applet activity timeout: %{public}@", v10, ClassName, Name, 1687, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)uint64_t buf = 67110146;
    int v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = object_getClassName(self);
    __int16 v25 = 2082;
    __int16 v26 = sel_getName(a2);
    __int16 v27 = 1024;
    int v28 = 1687;
    __int16 v29 = 2114;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Applet activity timeout: %{public}@", buf, 0x2Cu);
  }

  if (![(_NFContactlessSession *)self plasticCardMode])
  {
    int v14 = [(_NFSession *)self expressModeManager];
    if (v14) {
      BOOL v15 = v14[172] != 0;
    }
    else {
      BOOL v15 = 0;
    }

    id v16 = [(_NFXPCSession *)self remoteObject];
    int v17 = v16;
    if (v15)
    {
      uint64_t v18 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];
      [v17 didExpressModeStateChange:3 withObject:v18];
    }
    else
    {
      [v16 didReceiveActivityTimeout:v5];
    }
  }
}

- (void)handleRequestService:(id)a3
{
  id v5 = (NFContactlessPaymentStartEvent *)a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1706, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)uint64_t buf = 67110146;
    int v75 = v13;
    __int16 v76 = 2082;
    uint64_t v77 = object_getClassName(self);
    __int16 v78 = 2082;
    int v79 = sel_getName(a2);
    __int16 v80 = 1024;
    int v81 = 1706;
    __int16 v82 = 2114;
    uint64_t v83 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (![(_NFContactlessSession *)self plasticCardMode])
  {
    int v14 = [(_NFSession *)self expressModeManager];
    if (!v14 || (int v15 = v14[172], v14, !v15))
    {
      __int16 v35 = [(_NFContactlessSession *)self activeApplet];

      if (v35)
      {
        uint64_t v36 = [(_NFContactlessSession *)self secureElementWrapper];
        int v37 = [(_NFContactlessSession *)self activeApplet];
        unsigned __int8 v38 = sub_100253528(v36, v37);

        if (v38)
        {
          id v39 = objc_alloc((Class)NSMutableDictionary);
          v72[0] = @"appletIdentifier";
          long long v40 = [(_NFContactlessSession *)self activeApplet];
          long long v41 = [v40 identifier];
          v72[1] = @"paymentMode";
          v73[0] = v41;
          v73[1] = &off_10031C1B0;
          unsigned __int8 v42 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
          p_super = [v39 initWithDictionary:v42];

          int v43 = [[NFContactlessPaymentStartEvent alloc] initWithDictionary:p_super];
          transactionStartEvent = self->_transactionStartEvent;
          self->_transactionStartEvent = v43;

          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v45 = NFLogGetLogger();
          if (v45)
          {
            __int16 v46 = (void (*)(uint64_t, const char *, ...))v45;
            long long v47 = object_getClass(self);
            BOOL v48 = class_isMetaClass(v47);
            int v49 = object_getClassName(self);
            __int16 v50 = sel_getName(a2);
            uint64_t v51 = 45;
            if (v48) {
              uint64_t v51 = 43;
            }
            v46(6, "%c[%{public}s %{public}s]:%i transaction started: %{public}@", v51, v49, v50, 1738, self->_transactionStartEvent);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v52 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v53 = object_getClass(self);
            if (class_isMetaClass(v53)) {
              int v54 = 43;
            }
            else {
              int v54 = 45;
            }
            uint64_t v55 = object_getClassName(self);
            __int16 v56 = sel_getName(a2);
            int v57 = self->_transactionStartEvent;
            *(_DWORD *)uint64_t buf = 67110146;
            int v75 = v54;
            __int16 v76 = 2082;
            uint64_t v77 = v55;
            __int16 v78 = 2082;
            int v79 = v56;
            __int16 v80 = 1024;
            int v81 = 1738;
            __int16 v82 = 2114;
            uint64_t v83 = v57;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i transaction started: %{public}@", buf, 0x2Cu);
          }

          uint64_t v58 = [(_NFXPCSession *)self remoteObject];
          [v58 didStartTransaction:self->_transactionStartEvent];
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v59 = NFLogGetLogger();
          if (v59)
          {
            uint64_t v60 = (void (*)(uint64_t, const char *, ...))v59;
            id v61 = object_getClass(self);
            BOOL v62 = class_isMetaClass(v61);
            BOOL v63 = object_getClassName(self);
            __int16 v71 = sel_getName(a2);
            uint64_t v64 = 45;
            if (v62) {
              uint64_t v64 = 43;
            }
            v60(6, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping service request", v64, v63, v71, 1731);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          p_super = NFSharedLogGetLogger();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v65 = object_getClass(self);
            if (class_isMetaClass(v65)) {
              int v66 = 43;
            }
            else {
              int v66 = 45;
            }
            uint64_t v67 = object_getClassName(self);
            int v68 = sel_getName(a2);
            *(_DWORD *)uint64_t buf = 67109890;
            int v75 = v66;
            __int16 v76 = 2082;
            uint64_t v77 = v67;
            __int16 v78 = 2082;
            int v79 = v68;
            __int16 v80 = 1024;
            int v81 = 1731;
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i applet v2.0 - dropping service request", buf, 0x22u);
          }
        }
      }
      else
      {
        p_super = &self->_transactionStartEvent->super;
        self->_transactionStartEvent = 0;
      }
      goto LABEL_29;
    }
    id v16 = [(_NFSession *)self expressModeManager];
    int v17 = sub_10004B700((uint64_t)v16);

    if ([(NSString *)self->_expressType isEqualToString:@"express.transit.cathay"])
    {
      uint64_t v18 = &off_10031C180;
    }
    else
    {
      if (![(NSString *)self->_expressType isEqualToString:@"express.transit.suica"])
      {
        p_super = 0;
        goto LABEL_19;
      }
      uint64_t v18 = &off_10031C198;
    }
    int v19 = [v17 objectForKeyedSubscript:v18];
    p_super = [v19 objectAtIndexedSubscript:0];

LABEL_19:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      int v22 = (void (*)(uint64_t, const char *, ...))v21;
      __int16 v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      __int16 v25 = object_getClassName(self);
      __int16 v26 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v24) {
        uint64_t v27 = 43;
      }
      v22(6, "%c[%{public}s %{public}s]:%i %{public}@ Express transaction started for %{public}@", v27, v25, v26, 1722, self->_expressType, p_super);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      int v31 = object_getClassName(self);
      __int16 v32 = sel_getName(a2);
      expressType = self->_expressType;
      *(_DWORD *)uint64_t buf = 67110402;
      int v75 = v30;
      __int16 v76 = 2082;
      uint64_t v77 = v31;
      __int16 v78 = 2082;
      int v79 = v32;
      __int16 v80 = 1024;
      int v81 = 1722;
      __int16 v82 = 2114;
      uint64_t v83 = (NFContactlessPaymentStartEvent *)expressType;
      __int16 v84 = 2114;
      v85 = p_super;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ Express transaction started for %{public}@", buf, 0x36u);
    }

    id v34 = [(_NFXPCSession *)self remoteObject];
    [v34 didExpressModeStateChange:2 withObject:p_super];

LABEL_29:
  }
}

- (void)handlePendingServerRequest
{
  v6.receiver = self;
  v6.super_class = (Class)_NFContactlessPaymentSession;
  id v4 = [(_NFSession *)&v6 workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013F360;
  v5[3] = &unk_100301C40;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

- (void)_fireFelicaTransactionEndEvent
{
  transactionStartEvent = self->_transactionStartEvent;
  if (!transactionStartEvent) {
    return;
  }
  id v5 = [(NFContactlessPaymentStartEvent *)transactionStartEvent appletIdentifier];
  objc_super v6 = [(_NFContactlessSession *)self activeApplet];
  id v7 = [v6 identifier];
  if ([v5 caseInsensitiveCompare:v7])
  {
    id v8 = [(_NFContactlessSession *)self secureElementWrapper];
    unsigned int v9 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];
    uint64_t v10 = sub_1002473C8(v8, v9);
    unsigned int v11 = [v10 isTypeF];

    if (!v11) {
      return;
    }
  }
  else
  {
  }
  uint64_t v12 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];
  if (v12)
  {
    uint64_t v13 = [(NFContactlessPaymentStartEvent *)self->_transactionStartEvent appletIdentifier];
  }
  else
  {
    int v14 = [(_NFContactlessSession *)self activeApplet];
    uint64_t v13 = [v14 identifier];
  }
  if (v13) {
    int v15 = (__CFString *)v13;
  }
  else {
    int v15 = &stru_100309C40;
  }
  id v16 = [(_NFSession *)self expressModeManager];
  int v17 = sub_10004B64C((uint64_t)v16, 0);

  if (v17 && ([v17 containsObject:v15] & 1) == 0) {
    self->_delayExpressMode = 4.0;
  }
  uint64_t v18 = &OBJC_IVAR___NFECommercePaymentRequest__transactionAmount;
  if (!self->_endOfTransactionRequired)
  {
    felicaEvents = self->_felicaEvents;
    if (felicaEvents && ![(NFFelicaStateEvent *)felicaEvents isEmpty])
    {
      int v22 = [(NFFelicaStateEvent *)self->_felicaEvents asDictionary];
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_100140064;
      v108[3] = &unk_100304D78;
      v108[4] = self;
      v108[5] = a2;
      [v22 enumerateKeysAndObjectsUsingBlock:v108];
    }
    else
    {
      id v43 = objc_alloc((Class)NSMutableDictionary);
      v110[0] = @"appletIdentifier";
      v110[1] = @"type";
      v111[0] = v15;
      v111[1] = &off_10031C1F8;
      v110[2] = @"result";
      __int16 v44 = +[NSNumber numberWithUnsignedShort:0xFFFFLL];
      v111[2] = v44;
      uint64_t v45 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:3];
      int v22 = [v43 initWithDictionary:v45];

      __int16 v46 = [[NFContactlessPaymentEndEvent alloc] initWithDictionary:v22];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        BOOL v48 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v51 = 45;
        if (isMetaClass) {
          uint64_t v51 = 43;
        }
        v48(6, "%c[%{public}s %{public}s]:%i %{public}@", v51, ClassName, Name, 1825, v46);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v52 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v53 = object_getClass(self);
        if (class_isMetaClass(v53)) {
          int v54 = 43;
        }
        else {
          int v54 = 45;
        }
        uint64_t v55 = object_getClassName(self);
        __int16 v56 = sel_getName(a2);
        *(_DWORD *)uint64_t buf = 67110146;
        int v113 = v54;
        __int16 v114 = 2082;
        __int16 v115 = v55;
        __int16 v116 = 2082;
        __int16 v117 = v56;
        __int16 v118 = 1024;
        int v119 = 1825;
        __int16 v120 = 2114;
        v121 = v46;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      int v57 = [(_NFXPCSession *)self remoteObject];
      [v57 didEndTransaction:v46];

      uint64_t v18 = &OBJC_IVAR___NFECommercePaymentRequest__transactionAmount;
    }
    goto LABEL_69;
  }
  if (![(_NFContactlessPaymentSession *)self startWiredMode])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v58 = NFLogGetLogger();
    if (v58)
    {
      uint64_t v59 = (void (*)(uint64_t, const char *, ...))v58;
      uint64_t v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      BOOL v62 = object_getClassName(self);
      id v102 = sel_getName(a2);
      uint64_t v63 = 45;
      if (v61) {
        uint64_t v63 = 43;
      }
      v59(3, "%c[%{public}s %{public}s]:%i failed to set wired mode", v63, v62, v102, 1815);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v64 = object_getClass(self);
      if (class_isMetaClass(v64)) {
        int v65 = 43;
      }
      else {
        int v65 = 45;
      }
      *(_DWORD *)uint64_t buf = 67109890;
      int v113 = v65;
      __int16 v114 = 2082;
      __int16 v115 = object_getClassName(self);
      __int16 v116 = 2082;
      __int16 v117 = sel_getName(a2);
      __int16 v118 = 1024;
      int v119 = 1815;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i failed to set wired mode", buf, 0x22u);
    }
    goto LABEL_69;
  }
  int v19 = [(_NFContactlessSession *)self secureElementWrapper];
  __int16 v20 = [(_NFContactlessSession *)self activeApplet];
  id v109 = 0;
  uint64_t v21 = sub_100253230(v19, v20, &v109);
  int v22 = v109;

  if (v21 && !v22)
  {
    sel = a2;
    uint64_t v106 = v15;
    self->_endOfTransactionRequired = 0;
    __int16 v23 = [[NFContactlessPaymentEndEvent alloc] initWithDictionary:v21];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      __int16 v25 = (void (*)(uint64_t, const char *, ...))v24;
      __int16 v26 = object_getClass(self);
      BOOL v27 = class_isMetaClass(v26);
      BOOL v97 = object_getClassName(self);
      int v100 = sel_getName(a2);
      uint64_t v28 = 45;
      if (v27) {
        uint64_t v28 = 43;
      }
      v25(6, "%c[%{public}s %{public}s]:%i %{public}@", v28, v97, v100, 1791, v23);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v29 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = object_getClass(self);
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      __int16 v32 = object_getClassName(self);
      int v33 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67110146;
      int v113 = v31;
      __int16 v114 = 2082;
      __int16 v115 = v32;
      __int16 v116 = 2082;
      __int16 v117 = v33;
      __int16 v118 = 1024;
      int v119 = 1791;
      __int16 v120 = 2114;
      v121 = v23;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    id v34 = [(_NFXPCSession *)self remoteObject];
    [v34 didEndTransaction:v23];

    __int16 v35 = [(_NFSession *)self expressModeManager];
    uint64_t v36 = [(_NFContactlessSession *)self activeApplet];
    int v37 = [v36 identifier];
    int v38 = sub_100046A30((uint64_t)v35, v37);
    sub_100240214((uint64_t)NFHciTransactionEventCALogger, v21, v38);

    id v39 = [(NFContactlessPaymentEndEvent *)v23 felicaInfo];
    long long v40 = v39;
    if (!v39) {
      goto LABEL_66;
    }
    long long v41 = [v39 objectForKeyedSubscript:@"NFServiceProviderID"];
    if ([&off_10031C1C8 isEqualToNumber:v41])
    {
    }
    else
    {
      uint64_t v77 = [v40 objectForKeyedSubscript:@"NFServiceProviderID"];
      unsigned int v78 = [&off_10031C1E0 isEqualToNumber:v77];

      if (!v78)
      {
        __int16 v95 = [v40 objectForKeyedSubscript:@"NFServiceProviderID"];
        if (([&off_10031C138 isEqualToNumber:v95] & 1) == 0)
        {

          goto LABEL_66;
        }
        uint64_t v96 = [v40 objectForKeyedSubscript:@"NFInStation"];

        if (!v96)
        {
LABEL_66:

          a2 = sel;
          int v15 = v106;
LABEL_67:
          uint64_t v18 = &OBJC_IVAR___NFECommercePaymentRequest__transactionAmount;
          goto LABEL_68;
        }
        int v79 = &off_100323230;
LABEL_65:
        +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:v79];
        goto LABEL_66;
      }
    }
    int v79 = &off_100323208;
    goto LABEL_65;
  }
  v107 = v21;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v66 = NFLogGetLogger();
  if (v66)
  {
    uint64_t v67 = (void (*)(uint64_t, const char *, ...))v66;
    int v68 = object_getClass(self);
    BOOL v69 = class_isMetaClass(v68);
    int v70 = v15;
    __int16 v71 = object_getClassName(self);
    int v103 = sel_getName(a2);
    uint64_t v72 = 45;
    if (v69) {
      uint64_t v72 = 43;
    }
    BOOL v99 = v71;
    int v15 = v70;
    v67(3, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", v72, v99, v103, 1784, v22, v107);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  NFSharedLogGetLogger();
  __int16 v23 = (NFContactlessPaymentEndEvent *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
  {
    uint64_t v73 = object_getClass(self);
    if (class_isMetaClass(v73)) {
      int v74 = 43;
    }
    else {
      int v74 = 45;
    }
    int v75 = object_getClassName(self);
    __int16 v76 = sel_getName(a2);
    *(_DWORD *)uint64_t buf = 67110402;
    int v113 = v74;
    __int16 v114 = 2082;
    __int16 v115 = v75;
    __int16 v116 = 2082;
    __int16 v117 = v76;
    __int16 v118 = 1024;
    int v119 = 1784;
    __int16 v120 = 2114;
    v121 = (NFContactlessPaymentEndEvent *)v22;
    __int16 v122 = 2114;
    uint64_t v21 = v107;
    BOOL v123 = v107;
    _os_log_impl((void *)&_mh_execute_header, &v23->super, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i processEndOfFelicaTransactionForApplet failed: %{public}@ or output dictionary is nil: %{public}@", buf, 0x36u);
    goto LABEL_67;
  }
  uint64_t v18 = &OBJC_IVAR___NFECommercePaymentRequest__transactionAmount;
  uint64_t v21 = v107;
LABEL_68:

LABEL_69:
  if (self->_hasAuthorized)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v80 = NFLogGetLogger();
    if (v80)
    {
      int v81 = (void (*)(uint64_t, const char *, ...))v80;
      __int16 v82 = object_getClass(self);
      BOOL v83 = class_isMetaClass(v82);
      __int16 v84 = object_getClassName(self);
      v104 = sel_getName(a2);
      uint64_t v85 = 45;
      if (v83) {
        uint64_t v85 = 43;
      }
      v81(6, "%c[%{public}s %{public}s]:%i Deauthorizing applet after transaction", v85, v84, v104, 1861);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v86 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v87 = object_getClass(self);
      if (class_isMetaClass(v87)) {
        int v88 = 43;
      }
      else {
        int v88 = 45;
      }
      NSErrorUserInfoKey v89 = object_getClassName(self);
      long long v90 = sel_getName(a2);
      *(_DWORD *)uint64_t buf = 67109890;
      int v113 = v88;
      __int16 v114 = 2082;
      __int16 v115 = v89;
      __int16 v116 = 2082;
      __int16 v117 = v90;
      __int16 v118 = 1024;
      int v119 = 1861;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Deauthorizing applet after transaction", buf, 0x22u);
    }

    [(_NFContactlessPaymentSession *)self _deauthorize];
  }
  int v91 = self->_transactionStartEvent;
  self->_transactionStartEvent = 0;

  __int16 v92 = (objc_class *)objc_opt_new();
  uint64_t v93 = v18[419];
  uint64_t v94 = *(Class *)((char *)&self->super.super.super.super.isa + v93);
  *(Class *)((char *)&self->super.super.super.super.isa + v93) = v92;
}

- (void)_fireFelicaTransactionStartEvent
{
  if (!self->_transactionStartEvent)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    CFStringRef v35 = @"appletIdentifier";
    id v5 = [(_NFContactlessSession *)self activeApplet];
    objc_super v6 = [v5 identifier];
    uint64_t v36 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v8 = [v4 initWithDictionary:v7];

    unsigned int v9 = [[NFContactlessPaymentStartEvent alloc] initWithDictionary:v8];
    transactionStartEvent = self->_transactionStartEvent;
    self->_transactionStartEvent = v9;

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v12(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1875, self->_transactionStartEvent);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      uint64_t v21 = object_getClassName(self);
      int v22 = sel_getName(a2);
      __int16 v23 = self->_transactionStartEvent;
      *(_DWORD *)uint64_t buf = 67110146;
      int v26 = v20;
      __int16 v27 = 2082;
      uint64_t v28 = v21;
      __int16 v29 = 2082;
      int v30 = v22;
      __int16 v31 = 1024;
      int v32 = 1875;
      __int16 v33 = 2114;
      id v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v24 = [(_NFXPCSession *)self remoteObject];
    [v24 didStartTransaction:self->_transactionStartEvent];
  }
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![(_NFContactlessSession *)self plasticCardMode])
  {
    id v7 = [(_NFSession *)self expressModeManager];
    if (!v7 || (int v8 = v7[172], v7, !v8))
    {
      if (!self->_felicaEvents)
      {
        unsigned int v9 = objc_alloc_init(NFFelicaStateEvent);
        felicaEvents = self->_felicaEvents;
        self->_felicaEvents = v9;
      }
      [(_NFContactlessPaymentSession *)self _fireFelicaTransactionStartEvent];
      [(NFFelicaStateEvent *)self->_felicaEvents addStateInfo:v12 appletAID:v6];
    }
  }
  unsigned int v11 = [(_NFXPCSession *)self remoteObject];
  [v11 didFelicaStateChange:v12];
}

- (unsigned)transactionState
{
  return self->_transactionState;
}

- (void)setTransactionState:(unsigned __int8)a3
{
  self->_int transactionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressType, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_felicaEvents, 0);
  objc_storeStrong((id *)&self->_restartRoutingTimer, 0);
  objc_storeStrong((id *)&self->_deferredAuthTimer, 0);
  objc_storeStrong((id *)&self->_deferredAuth, 0);

  objc_storeStrong((id *)&self->_transactionStartEvent, 0);
}

@end