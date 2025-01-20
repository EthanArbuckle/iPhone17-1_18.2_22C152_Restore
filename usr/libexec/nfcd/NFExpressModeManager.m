@interface NFExpressModeManager
- (id)appletForIdentifier:(id)a3 filtered:(BOOL)a4;
- (void)driverExpressModeEntered:(unsigned __int8)a3;
- (void)driverExpressModeExited;
- (void)driverFieldEntered;
- (void)driverFieldExited;
- (void)driverRequestService:(id)a3;
- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5;
- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4;
- (void)handleTimerExpiredEvent:(id)a3;
- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5;
- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5;
@end

@implementation NFExpressModeManager

- (void)driverFieldExited
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_expressModeState == 5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(5, "%s:%i CLEARING EXPRESS MODE STATE", "-[NFExpressModeManager driverFieldExited]", 2036);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[NFExpressModeManager driverFieldExited]";
      __int16 v8 = 1024;
      int v9 = 2036;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i CLEARING EXPRESS MODE STATE", buf, 0x12u);
    }

    v3->_expressModeState = 0;
    v3->_expressModeType = 0;
  }
  objc_sync_exit(v3);

  [(NFTimer *)v3->_typeFTransactionTimer stopTimer];
  [(NFExpressModeManagerDelegate *)v3->_delegate handleFieldChanged:0];
}

- (void)driverFieldEntered
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BAE0;
  block[3] = &unk_100301C68;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)driverExpressModeEntered:(unsigned __int8)a3
{
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004C6DC;
  v4[3] = &unk_100301BC8;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)driverRequestService:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CB00;
  v7[3] = &unk_100301CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)driverExpressModeExited
{
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DC2C;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (id)appletForIdentifier:(id)a3 filtered:(BOOL)a4
{
  return sub_100047744(self, a3, a4);
}

- (void)handleAppletInactivityTimeout:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  if (v12->_expressModeState - 1 > 1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v12);
      if (class_isMetaClass(Class)) {
        uint64_t v15 = 43;
      }
      else {
        uint64_t v15 = 45;
      }
      ClassName = object_getClassName(v12);
      Name = sel_getName(a2);
      Logger(5, "%c[%{public}s %{public}s]:%i Express mode state is unexpected: %d", v15, ClassName, Name, 2117, v12->_expressModeState);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = object_getClass(v12);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      v21 = object_getClassName(v12);
      v22 = sel_getName(a2);
      unsigned int expressModeState = v12->_expressModeState;
      *(_DWORD *)buf = 67110146;
      int v28 = v20;
      __int16 v29 = 2082;
      v30 = v21;
      __int16 v31 = 2082;
      v32 = v22;
      __int16 v33 = 1024;
      int v34 = 2117;
      __int16 v35 = 1024;
      unsigned int v36 = expressModeState;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Express mode state is unexpected: %d", buf, 0x28u);
    }
  }
  else
  {
    v12->_unsigned int expressModeState = 3;
  }
  objc_sync_exit(v12);

  v24 = [v9 objectForKeyedSubscript:@"applet"];
  v25 = [v24 identifierAsData];
  [(NSMutableDictionary *)v12->_caTransactionInfo setObject:v25 forKeyedSubscript:@"AID"];

  if (v11)
  {
    v26 = +[NSNumber numberWithUnsignedChar:v12->_expressModeType];
    [v11 setObject:v26 forKeyedSubscript:@"expressType"];
  }
  [(NFExpressModeManagerDelegate *)v12->_delegate handleAppletInactivityTimeout:v9 atlData:v10 caData:v11];
}

- (void)handleFelicaStateEvent:(id)a3 appletAID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = sub_100044D88(self, v6);
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 identifierAsData];
    [(NSMutableDictionary *)self->_caTransactionInfo setObject:v9 forKeyedSubscript:@"AID"];
  }
  id v10 = [v12 objectForKeyedSubscript:@"NFServiceProviderID"];

  if (v10)
  {
    id v11 = [v12 objectForKeyedSubscript:@"NFServiceProviderID"];
    [(NSMutableDictionary *)self->_caTransactionInfo setObject:v11 forKeyedSubscript:@"SPID"];
  }
  [(NFExpressModeManagerDelegate *)self->_delegate handleFelicaStateEvent:v12 appletAID:v6];
}

- (void)handleStepUpEvent:(id)a3 forApplet:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (self && self->_expressModeInProgress && !self->_limitedToApplet)
  {
    if (sub_1000452C8((uint64_t)self))
    {
      id v7 = v12;
      id v8 = v6;
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004D870;
      block[3] = &unk_100301CE0;
      block[4] = self;
      v16 = "_handleStepUpEventInExpressMode:forApplet:";
      id v10 = v7;
      id v14 = v10;
      id v11 = v8;
      id v15 = v11;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    [(NFExpressModeManagerDelegate *)self->_delegate handleStepUpEvent:v12 forApplet:v6];
  }
}

- (void)handleTimerExpiredEvent:(id)a3
{
}

- (void)handleTransactionEndEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = +[NSNumber numberWithUnsignedChar:self->_expressModeType];
    [v10 setObject:v11 forKeyedSubscript:@"expressType"];
  }
  id v12 = [v8 applet];

  if (v12)
  {
    v13 = [v8 applet];
    id v14 = [v13 identifierAsData];
    [(NSMutableDictionary *)self->_caTransactionInfo setObject:v14 forKeyedSubscript:@"AID"];
  }
  if (v9)
  {
    id v15 = [v9 objectForKeyedSubscript:@"State"];
    v16 = [v15 objectForKeyedSubscript:@"SPRaw"];

    if (v16)
    {
      v17 = [v15 objectForKeyedSubscript:@"SPRaw"];
      [(NSMutableDictionary *)self->_caTransactionInfo setObject:v17 forKeyedSubscript:@"SPID"];
    }
    v18 = [v9 objectForKeyedSubscript:@"ForceExpressExit"];
    if (self->_expressModeState - 6 <= 2)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v20 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v24 = 45;
        if (isMetaClass) {
          uint64_t v24 = 43;
        }
        v20(5, "%c[%{public}s %{public}s]:%i Not firing end event because express mode transaction is already in ended state", v24, ClassName, Name, 2224);
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
        *(_DWORD *)buf = 67109890;
        int v84 = v27;
        __int16 v85 = 2082;
        v86 = object_getClassName(self);
        __int16 v87 = 2082;
        v88 = sel_getName(a2);
        __int16 v89 = 1024;
        int v90 = 2224;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not firing end event because express mode transaction is already in ended state", buf, 0x22u);
      }

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        __int16 v29 = (void (*)(uint64_t, const char *, ...))v28;
        v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        v75 = object_getClassName(self);
        v77 = sel_getName(a2);
        uint64_t v32 = 45;
        if (v31) {
          uint64_t v32 = 43;
        }
        v29(5, "%c[%{public}s %{public}s]:%i %{public}@", v32, v75, v77, 2225, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = object_getClass(self);
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        unsigned int v36 = object_getClassName(self);
        v37 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v84 = v35;
        __int16 v85 = 2082;
        v86 = v36;
        __int16 v87 = 2082;
        v88 = v37;
        __int16 v89 = 1024;
        int v90 = 2225;
        __int16 v91 = 2114;
        id v92 = v8;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
      }

      goto LABEL_80;
    }
    if (!self->_expressModeInProgress)
    {
LABEL_78:
      [(NFExpressModeManagerDelegate *)self->_delegate handleTransactionEndEvent:v8 atlData:v9 caData:v10];
      if (self->_expressModeInProgress) {
        self->_didPerformExpressTransaction = 1;
      }
LABEL_80:

      if (!self->_expressModeInProgress) {
        goto LABEL_92;
      }
      goto LABEL_81;
    }
    if ([v8 didError] && objc_msgSend(v8, "result") == 61444)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v39 = NFLogGetLogger();
      if (v39)
      {
        v40 = (void (*)(uint64_t, const char *, ...))v39;
        v41 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v41);
        v43 = object_getClassName(self);
        v78 = sel_getName(a2);
        uint64_t v44 = 45;
        if (v42) {
          uint64_t v44 = 43;
        }
        v40(5, "%c[%{public}s %{public}s]:%i Transaction end incompatible", v44, v43, v78, 2233);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v84 = v47;
        __int16 v85 = 2082;
        v86 = object_getClassName(self);
        __int16 v87 = 2082;
        v88 = sel_getName(a2);
        __int16 v89 = 1024;
        int v90 = 2233;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction end incompatible", buf, 0x22u);
      }
      unsigned int v48 = 7;
    }
    else
    {
      if ([v8 didError] && objc_msgSend(v8, "result") == 61445)
      {
        unsigned int v48 = 9;
LABEL_77:
        self->_unsigned int expressModeState = v48;
        goto LABEL_78;
      }
      unsigned int v49 = [v8 didError];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v50 = NFLogGetLogger();
      v51 = (void (*)(uint64_t, const char *, ...))v50;
      if (v49)
      {
        if (v50)
        {
          v52 = object_getClass(self);
          BOOL v53 = class_isMetaClass(v52);
          v54 = object_getClassName(self);
          v79 = sel_getName(a2);
          uint64_t v55 = 45;
          if (v53) {
            uint64_t v55 = 43;
          }
          v51(5, "%c[%{public}s %{public}s]:%i Transaction end failure", v55, v54, v79, 2240);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v56 = object_getClass(self);
          if (class_isMetaClass(v56)) {
            int v57 = 43;
          }
          else {
            int v57 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v84 = v57;
          __int16 v85 = 2082;
          v86 = object_getClassName(self);
          __int16 v87 = 2082;
          v88 = sel_getName(a2);
          __int16 v89 = 1024;
          int v90 = 2240;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction end failure", buf, 0x22u);
        }
        unsigned int v48 = 8;
      }
      else
      {
        if (v50)
        {
          v58 = object_getClass(self);
          BOOL v59 = class_isMetaClass(v58);
          v60 = object_getClassName(self);
          v80 = sel_getName(a2);
          uint64_t v61 = 45;
          if (v59) {
            uint64_t v61 = 43;
          }
          v51(5, "%c[%{public}s %{public}s]:%i Transaction ended", v61, v60, v80, 2244);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v45 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v84 = v63;
          __int16 v85 = 2082;
          v86 = object_getClassName(self);
          __int16 v87 = 2082;
          v88 = sel_getName(a2);
          __int16 v89 = 1024;
          int v90 = 2244;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Transaction ended", buf, 0x22u);
        }
        unsigned int v48 = 6;
      }
    }

    goto LABEL_77;
  }
  if (self->_expressModeState)
  {
    if ([v8 didError] && objc_msgSend(v8, "result") == 61444)
    {
      unsigned int v38 = 7;
    }
    else if ([v8 didError])
    {
      unsigned int v38 = 8;
    }
    else
    {
      unsigned int v38 = 6;
    }
    self->_unsigned int expressModeState = v38;
  }
  [(NFExpressModeManagerDelegate *)self->_delegate handleTransactionEndEvent:v8 atlData:0 caData:v10];
  if (!self->_expressModeInProgress)
  {
    v18 = 0;
    goto LABEL_92;
  }
  v18 = 0;
  self->_didPerformExpressTransaction = 1;
LABEL_81:
  if ([v18 BOOLValue])
  {
    usleep(0x30D40u);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v64 = NFLogGetLogger();
    if (v64)
    {
      v65 = (void (*)(uint64_t, const char *, ...))v64;
      v66 = object_getClass(self);
      BOOL v67 = class_isMetaClass(v66);
      v68 = object_getClassName(self);
      v81 = sel_getName(a2);
      uint64_t v69 = 45;
      if (v67) {
        uint64_t v69 = 43;
      }
      v65(6, "%c[%{public}s %{public}s]:%i ATLEndEventForceExpressExit set - exiting express", v69, v68, v81, 2261);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = object_getClass(self);
      if (class_isMetaClass(v71)) {
        int v72 = 43;
      }
      else {
        int v72 = 45;
      }
      v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v84 = v72;
      __int16 v85 = 2082;
      v86 = v73;
      __int16 v87 = 2082;
      v88 = v74;
      __int16 v89 = 1024;
      int v90 = 2261;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ATLEndEventForceExpressExit set - exiting express", buf, 0x22u);
    }

    sub_100040B4C((uint64_t)self, 0);
  }
LABEL_92:
}

- (void)handleTransactionStartEvent:(id)a3 atlData:(id)a4 caData:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int expressModeState = self->_expressModeState;
  if (expressModeState) {
    BOOL v11 = expressModeState == 5;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unsigned int expressModeState = 2;
    self->_unsigned int expressModeState = 2;
  }
  if ((self->_expressModeType | 4) == 5 && expressModeState == 5)
  {
    [(NFTimer *)self->_typeFTransactionTimer stopTimer];
    [(NFTimer *)self->_typeFTransactionTimer startTimer:0.25];
  }
  v13 = [v17 appletIdentifier];
  sub_100047710(self, v13);
  id v14 = (NFApplet *)objc_claimAutoreleasedReturnValue();
  activeApplet = self->_activeApplet;
  self->_activeApplet = v14;

  if (v9)
  {
    v16 = +[NSNumber numberWithUnsignedChar:self->_expressModeType];
    [v9 setObject:v16 forKeyedSubscript:@"expressType"];
  }
  [(NFExpressModeManagerDelegate *)self->_delegate handleTransactionStartEvent:v17 atlData:v8 caData:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_caTransactionInfo, 0);
  objc_storeStrong((id *)&self->_singlePollAssertionTimer, 0);
  objc_storeStrong((id *)&self->_typeFTransactionTimer, 0);
  objc_storeStrong((id *)&self->_expressModeExitTimer, 0);
  objc_storeStrong((id *)&self->_reactivationTimer, 0);
  objc_storeStrong((id *)&self->_delayExpressTimer, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_storeStrong((id *)&self->_limitedToApplet, 0);
  objc_storeStrong((id *)&self->_configMap, 0);
  objc_storeStrong((id *)&self->_eseConfig, 0);
  objc_storeStrong((id *)&self->_stepUpController, 0);
  objc_storeStrong((id *)&self->_controllerManager, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end