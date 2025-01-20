@interface _NFTagSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)willStartSession;
- (_NFTagSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (unsigned)_hceComplete;
- (void)_handleOneAPDU:(id)a3;
- (void)_printHceCurrentState;
- (void)cleanup;
- (void)didEndSession:(id)a3;
- (void)didStartSession:(id)a3;
- (void)enableWrite:(BOOL)a3 completion:(id)a4;
- (void)endSession:(id)a3;
- (void)getTagContentWithCompletion:(id)a3;
- (void)handleHostCardReaderDetected:(id)a3;
- (void)handleNdefTagRead;
- (void)prioritizeSessionWithCompletion:(id)a3;
- (void)setInitialPayload:(id)a3;
- (void)setTagContent:(id)a3 completion:(id)a4;
- (void)startEmulation:(id)a3 withMessageType:(unsigned int)a4 completion:(id)a5;
- (void)stopEmulationWithCompletion:(id)a3;
@end

@implementation _NFTagSession

+ (id)validateEntitlements:(id)a3
{
  if ([a3 readerInternalAccess])
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
      v7(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring internal reader access", v11, ClassName, Name, 30);
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
      int v32 = 30;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring internal reader access", buf, 0x22u);
    }

    id v15 = objc_alloc((Class)NSError);
    v16 = +[NSString stringWithUTF8String:"nfcd"];
    v23[0] = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:"Not entitled"];
    v24[0] = v17;
    v24[1] = &off_10031B6B8;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v24[2] = v18;
    v23[3] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 31];
    v24[3] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v5 = [v15 initWithDomain:v16 code:32 userInfo:v20];
  }

  return v5;
}

- (_NFTagSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_NFTagSession;
  v6 = [(_NFXPCSession *)&v11 initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:a6];
  if (v6)
  {
    v7 = objc_alloc_init(NFNdefTagAgent);
    tagAgent = v6->_tagAgent;
    v6->_tagAgent = v7;

    v9 = v6->_tagAgent;
    if (v9) {
      v9->_delegate = (NFNdefTagAgentDelegate *)v6;
    }
  }
  return v6;
}

- (void)cleanup
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
    v5(6, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", v9, ClassName, Name, 53);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v10 = NFSharedLogGetLogger();
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
    int v16 = v12;
    __int16 v17 = 2082;
    id v18 = object_getClassName(self);
    __int16 v19 = 2082;
    v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 53;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Terminating session, flagging reads as interrupted.", buf, 0x22u);
  }

  v14.receiver = self;
  v14.super_class = (Class)_NFTagSession;
  [(_NFSession *)&v14 cleanup];
}

- (BOOL)willStartSession
{
  sub_1002535C4();
  v4.receiver = self;
  v4.super_class = (Class)_NFTagSession;
  return [(_NFSession *)&v4 willStartSession];
}

- (void)endSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFTagSession;
  [(_NFXPCSession *)&v3 endSession:a3];
}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFTagSession;
  [(_NFXPCSession *)&v3 prioritizeSessionWithCompletion:a3];
}

- (void)didStartSession:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_NFTagSession;
  [(_NFSession *)&v16 didStartSession:v5];
  if (v5)
  {
    v6 = [(_NFXPCSession *)self remoteObject];
    [v6 didStartSession:v5];
  }
  else
  {
    v7 = objc_alloc_init(NFHceTagReadCALogger);
    tagReadCAuint64_t Logger = self->_tagReadCALogger;
    self->_tagReadCAuint64_t Logger = v7;

    sub_100020768((uint64_t)self->_tagReadCALogger);
    uint64_t v9 = [(_NFXPCSession *)self remoteObject];
    [v9 didStartSession:0];

    v10 = sub_1000B7D78((id *)&self->_tagAgent->super.isa);

    if (v10)
    {
      objc_initWeak(&location, self);
      v14.receiver = self;
      v14.super_class = (Class)_NFTagSession;
      objc_super v11 = [(_NFSession *)&v14 workQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000E53F8;
      v12[3] = &unk_100301E90;
      objc_copyWeak(v13, &location);
      v12[4] = self;
      v13[1] = (id)a2;
      dispatch_async(v11, v12);

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)didEndSession:(id)a3
{
  id v5 = a3;
  if (![(_NFSession *)self didEnd])
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      int v12 = [(_NFXPCSession *)self clientName];
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", v13, ClassName, Name, 109, v12);
    }
    objc_super v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      __int16 v17 = object_getClassName(self);
      id v18 = sel_getName(a2);
      __int16 v19 = [(_NFXPCSession *)self clientName];
      *(_DWORD *)buf = 67110146;
      int v23 = v16;
      __int16 v24 = 2082;
      v25 = v17;
      __int16 v26 = 2082;
      __int16 v27 = v18;
      __int16 v28 = 1024;
      int v29 = 109;
      __int16 v30 = 2112;
      __int16 v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i NFC emulation mode terminated: %@", buf, 0x2Cu);
    }
    sub_1000204B0((uint64_t)self->_tagReadCALogger);
    sub_1000207D8((uint64_t)self->_tagReadCALogger);
    tagReadCAuint64_t Logger = self->_tagReadCALogger;
    self->_tagReadCAuint64_t Logger = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)_NFTagSession;
  [(_NFSession *)&v21 didEndSession:v5];
}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_START", (const char *)&unk_100286819, v6, 2u);
  }

  sub_1000203B0((uint64_t)self->_tagReadCALogger);
  [(_NFTagSession *)self _handleOneAPDU:v4];
}

- (void)handleNdefTagRead
{
  kdebug_trace();
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_END", (const char *)&unk_100286819, buf, 2u);
  }

  tagAgent = self->_tagAgent;
  if (tagAgent && tagAgent->_tagRead)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Tag is read", v11, ClassName, Name, 134);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      id v15 = object_getClassName(self);
      int v16 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v20 = v14;
      __int16 v21 = 2082;
      int v22 = v15;
      __int16 v23 = 2082;
      __int16 v24 = v16;
      __int16 v25 = 1024;
      int v26 = 134;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is read", buf, 0x22u);
    }

    __int16 v17 = [(_NFXPCSession *)self remoteObject];
    [v17 didTagStateChange:2];
  }
}

- (unsigned)_hceComplete
{
  kdebug_trace();
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_HCE_COMPLETE", (const char *)&unk_100286819, buf, 2u);
  }

  tagAgent = self->_tagAgent;
  if (!tagAgent) {
    return 0;
  }
  if (!tagAgent->_tagWritten)
  {
    unsigned int v18 = 0;
LABEL_17:
    if ((__int16)tagAgent->_lastStatus == -28672) {
      goto LABEL_34;
    }
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
      v20(6, "%c[%{public}s %{public}s]:%i Tag had error", v24, ClassName, Name, 152);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      __int16 v28 = object_getClassName(self);
      int v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v36 = v27;
      __int16 v37 = 2082;
      v38 = v28;
      __int16 v39 = 2082;
      v40 = v29;
      __int16 v41 = 1024;
      int v42 = 152;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag had error", buf, 0x22u);
    }

    __int16 v30 = [(_NFXPCSession *)self remoteObject];
    unsigned int v18 = 5;
    [v30 didTagStateChange:5];

    tagAgent = self->_tagAgent;
    if (tagAgent)
    {
LABEL_34:
      if (tagAgent->_isSelected)
      {
        __int16 v31 = [(_NFXPCSession *)self remoteObject];
        unsigned int v18 = 4;
        [v31 didTagStateChange:4];
      }
    }
    return v18;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    v7 = (void (*)(uint64_t, const char *, ...))v6;
    v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    v10 = object_getClassName(self);
    v33 = sel_getName(a2);
    uint64_t v11 = 45;
    if (v9) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Tag was written", v11, v10, v33, 146);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    id v15 = object_getClassName(self);
    int v16 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v36 = v14;
    __int16 v37 = 2082;
    v38 = v15;
    __int16 v39 = 2082;
    v40 = v16;
    __int16 v41 = 1024;
    int v42 = 146;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag was written", buf, 0x22u);
  }

  __int16 v17 = [(_NFXPCSession *)self remoteObject];
  unsigned int v18 = 3;
  [v17 didTagStateChange:3];

  tagAgent = self->_tagAgent;
  if (tagAgent) {
    goto LABEL_17;
  }
  return v18;
}

- (void)_printHceCurrentState
{
  tagAgent = self->_tagAgent;
  if (tagAgent)
  {
    if (!tagAgent->_tagWritten) {
      goto LABEL_37;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i Tag is written", v10, ClassName, Name, 168);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v40 = v13;
      __int16 v41 = 2082;
      int v42 = object_getClassName(self);
      __int16 v43 = 2082;
      v44 = sel_getName(a2);
      __int16 v45 = 1024;
      int v46 = 168;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is written", buf, 0x22u);
    }

    tagAgent = self->_tagAgent;
    if (tagAgent)
    {
LABEL_37:
      if (!tagAgent->_tagRead) {
        goto LABEL_24;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v14 = NFLogGetLogger();
      if (v14)
      {
        id v15 = (void (*)(uint64_t, const char *, ...))v14;
        int v16 = object_getClass(self);
        BOOL v17 = class_isMetaClass(v16);
        unsigned int v18 = object_getClassName(self);
        __int16 v37 = sel_getName(a2);
        uint64_t v19 = 45;
        if (v17) {
          uint64_t v19 = 43;
        }
        v15(6, "%c[%{public}s %{public}s]:%i Tag is read", v19, v18, v37, 176);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = object_getClass(self);
        if (class_isMetaClass(v21)) {
          int v22 = 43;
        }
        else {
          int v22 = 45;
        }
        __int16 v23 = object_getClassName(self);
        uint64_t v24 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v40 = v22;
        __int16 v41 = 2082;
        int v42 = v23;
        __int16 v43 = 2082;
        v44 = v24;
        __int16 v45 = 1024;
        int v46 = 176;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag is read", buf, 0x22u);
      }

      tagAgent = self->_tagAgent;
      if (tagAgent)
      {
LABEL_24:
        if ((__int16)tagAgent->_lastStatus != -28672)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v25 = NFLogGetLogger();
          if (v25)
          {
            int v26 = (void (*)(uint64_t, const char *, ...))v25;
            int v27 = object_getClass(self);
            BOOL v28 = class_isMetaClass(v27);
            int v29 = object_getClassName(self);
            v38 = sel_getName(a2);
            uint64_t v30 = 45;
            if (v28) {
              uint64_t v30 = 43;
            }
            v26(6, "%c[%{public}s %{public}s]:%i Tag error", v30, v29, v38, 180);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v31 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v32 = object_getClass(self);
            if (class_isMetaClass(v32)) {
              int v33 = 43;
            }
            else {
              int v33 = 45;
            }
            v34 = object_getClassName(self);
            v35 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v40 = v33;
            __int16 v41 = 2082;
            int v42 = v34;
            __int16 v43 = 2082;
            v44 = v35;
            __int16 v45 = 1024;
            int v46 = 180;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag error", buf, 0x22u);
          }
        }
      }
    }
  }
}

- (void)_handleOneAPDU:(id)a3
{
  id v4 = a3;
  v105 = v4;
  if ([(_NFSession *)self didEnd])
  {
    kdebug_trace();
    id v5 = NFSharedSignpostLog();
    if (os_signpost_enabled(v5))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_READ_END", (const char *)&unk_100286819, (uint8_t *)&buf, 2u);
    }

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v8 = 43;
      }
      else {
        uint64_t v8 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Session terminated while reading. Exiting.", v8, ClassName, Name, 195);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v11 = NFSharedLogGetLogger();
    int v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      id v15 = object_getClassName(self);
      int v16 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v14;
      __int16 v112 = 2082;
      v113 = v15;
      __int16 v114 = 2082;
      v115 = v16;
      __int16 v116 = 1024;
      int v117 = 195;
      int v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session terminated while reading. Exiting.", (uint8_t *)&buf, 0x22u);
    }
    goto LABEL_83;
  }
  id v110 = 0;
  v103 = [v4 readApduAndReturnError:&v110];
  BOOL v17 = v110;
  if (!v103)
  {
    int v12 = v17;
    if ([v17 code] == (id)62)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v57)
      {
        v58 = object_getClass(self);
        if (class_isMetaClass(v58)) {
          uint64_t v59 = 43;
        }
        else {
          uint64_t v59 = 45;
        }
        v60 = object_getClassName(self);
        v61 = sel_getName(a2);
        v57(6, "%c[%{public}s %{public}s]:%i Tag halted", v59, v60, v61, 202);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v62 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = object_getClass(self);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        v65 = object_getClassName(self);
        v66 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v64;
        __int16 v112 = 2082;
        v113 = v65;
        __int16 v114 = 2082;
        v115 = v66;
        __int16 v116 = 1024;
        int v117 = 202;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag halted", (uint8_t *)&buf, 0x22u);
      }

      v67 = [(_NFXPCSession *)self remoteObject];
      [v67 didTagStateChange:6];

      goto LABEL_82;
    }
    BOOL v68 = [v12 code] == (id)28;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v69 = NFLogGetLogger();
    v70 = (void (*)(uint64_t, const char *, ...))v69;
    if (v68)
    {
      if (v69)
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71)) {
          uint64_t v72 = 43;
        }
        else {
          uint64_t v72 = 45;
        }
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        v70(6, "%c[%{public}s %{public}s]:%i Connection lost", v72, v73, v74, 206);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v75 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_81;
      }
      v76 = object_getClass(self);
      if (class_isMetaClass(v76)) {
        int v77 = 43;
      }
      else {
        int v77 = 45;
      }
      v78 = object_getClassName(self);
      v79 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v77;
      __int16 v112 = 2082;
      v113 = v78;
      __int16 v114 = 2082;
      v115 = v79;
      __int16 v116 = 1024;
      int v117 = 206;
      v80 = "%c[%{public}s %{public}s]:%i Connection lost";
    }
    else
    {
      if (v69)
      {
        v81 = object_getClass(self);
        if (class_isMetaClass(v81)) {
          uint64_t v82 = 43;
        }
        else {
          uint64_t v82 = 45;
        }
        v83 = object_getClassName(self);
        v84 = sel_getName(a2);
        v70(6, "%c[%{public}s %{public}s]:%i Failed to read from remote device, stopping", v82, v83, v84, 208);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v75 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_81;
      }
      v85 = object_getClass(self);
      if (class_isMetaClass(v85)) {
        int v86 = 43;
      }
      else {
        int v86 = 45;
      }
      v87 = object_getClassName(self);
      v88 = sel_getName(a2);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v86;
      __int16 v112 = 2082;
      v113 = v87;
      __int16 v114 = 2082;
      v115 = v88;
      __int16 v116 = 1024;
      int v117 = 208;
      v80 = "%c[%{public}s %{public}s]:%i Failed to read from remote device, stopping";
    }
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, v80, (uint8_t *)&buf, 0x22u);
LABEL_81:

    [(_NFTagSession *)self _hceComplete];
LABEL_82:
    [(NFNdefTagAgent *)self->_tagAgent handleDeselect];
    goto LABEL_83;
  }
  v102 = v17;
  id v18 = [objc_alloc((Class)NFCommandAPDU) initWithData:v103];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19)
  {
    int v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      uint64_t v21 = 43;
    }
    else {
      uint64_t v21 = 45;
    }
    uint64_t v100 = v21;
    int v22 = object_getClassName(self);
    __int16 v23 = sel_getName(a2);
    v19(6, "%c[%{public}s %{public}s]:%i class = %02x ins = %02x  p1 = %d p2 = %d, lc = %u, le = %u", v100, v22, v23, 219, [v18 clss], [v18 instruction], [v18 p1], [v18 p2], [v18 payloadLength], [v18 lengthExpected]);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = object_getClass(self);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    int v101 = v26;
    int v27 = object_getClassName(self);
    BOOL v28 = sel_getName(a2);
    unsigned int v29 = [v18 clss];
    unsigned int v30 = [v18 instruction];
    unsigned int v31 = [v18 p1];
    unsigned int v32 = [v18 p2];
    unsigned int v33 = [v18 payloadLength];
    unsigned int v34 = [v18 lengthExpected];
    LODWORD(buf) = 67111426;
    HIDWORD(buf) = v101;
    __int16 v112 = 2082;
    v113 = v27;
    __int16 v114 = 2082;
    v115 = v28;
    __int16 v116 = 1024;
    int v117 = 219;
    __int16 v118 = 1024;
    *(_DWORD *)v119 = v29;
    *(_WORD *)&v119[4] = 1024;
    *(_DWORD *)&v119[6] = v30;
    __int16 v120 = 1024;
    unsigned int v121 = v31;
    __int16 v122 = 1024;
    unsigned int v123 = v32;
    __int16 v124 = 1024;
    unsigned int v125 = v33;
    __int16 v126 = 1024;
    unsigned int v127 = v34;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i class = %02x ins = %02x  p1 = %d p2 = %d, lc = %u, le = %u", (uint8_t *)&buf, 0x46u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v35)
  {
    int v36 = object_getClass(self);
    if (class_isMetaClass(v36)) {
      uint64_t v37 = 43;
    }
    else {
      uint64_t v37 = 45;
    }
    v38 = object_getClassName(self);
    __int16 v39 = sel_getName(a2);
    int v40 = [v18 payload];
    v35(6, "%c[%{public}s %{public}s]:%i payload: %{public}@", v37, v38, v39, 220, v40);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v41 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = object_getClass(self);
    if (class_isMetaClass(v42)) {
      int v43 = 43;
    }
    else {
      int v43 = 45;
    }
    v44 = object_getClassName(self);
    __int16 v45 = sel_getName(a2);
    int v46 = [v18 payload];
    LODWORD(buf) = 67110146;
    HIDWORD(buf) = v43;
    __int16 v112 = 2082;
    v113 = v44;
    __int16 v114 = 2082;
    v115 = v45;
    __int16 v116 = 1024;
    int v117 = 220;
    __int16 v118 = 2114;
    *(void *)v119 = v46;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i payload: %{public}@", (uint8_t *)&buf, 0x2Cu);
  }
  if ([v18 instruction] == 164 && objc_msgSend(v18, "p1") == 4)
  {
    [(NFNdefTagAgent *)self->_tagAgent handleDeselect];
    v47 = [(NFNdefTagAgent *)self->_tagAgent handleSelect:v18];
    if (v47)
    {
      id v48 = 0;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v89 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v89)
      {
        v90 = object_getClass(self);
        if (class_isMetaClass(v90)) {
          uint64_t v91 = 43;
        }
        else {
          uint64_t v91 = 45;
        }
        v92 = object_getClassName(self);
        v93 = sel_getName(a2);
        v89(6, "%c[%{public}s %{public}s]:%i Failed to find suitable applet", v91, v92, v93, 226);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v94 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = object_getClass(self);
        if (class_isMetaClass(v95)) {
          int v96 = 43;
        }
        else {
          int v96 = 45;
        }
        v97 = object_getClassName(self);
        v98 = sel_getName(a2);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v96;
        __int16 v112 = 2082;
        v113 = v97;
        __int16 v114 = 2082;
        v115 = v98;
        __int16 v116 = 1024;
        int v117 = 226;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed to find suitable applet", (uint8_t *)&buf, 0x22u);
      }

      LOWORD(buf) = -32150;
      id v48 = [objc_alloc((Class)NSData) initWithBytes:&buf length:2];
      v47 = +[NFResponseAPDU responseWithData:v48];
    }
    if ([v47 status] == 36864)
    {
      v99 = [(_NFXPCSession *)self remoteObject];
      [v99 didTagStateChange:1];
    }
  }
  else
  {
    v47 = [(NFNdefTagAgent *)self->_tagAgent handleAPDU:v18];
    [(_NFTagSession *)self _printHceCurrentState];
    id v48 = 0;
  }
  v49 = [v47 data];
  [v105 sendAPDU:v49];

  tagReadCAuint64_t Logger = self->_tagReadCALogger;
  unsigned int v51 = [v103 length];
  if (tagReadCALogger) {
    tagReadCALogger->_rawBytesTx += v51;
  }
  v52 = self->_tagReadCALogger;
  if (v52)
  {
    ++v52->_rawCommandCount;
    v53 = self->_tagReadCALogger;
  }
  else
  {
    v53 = 0;
  }
  v54 = [v47 data];
  unsigned int v55 = [v54 length];
  if (v53)
  {
    v53->_rawBytesRx += v55;
    v53->_wasRead = 1;
  }

  objc_initWeak(&buf, self);
  v109.receiver = self;
  v109.super_class = (Class)_NFTagSession;
  v56 = [(_NFSession *)&v109 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7148;
  block[3] = &unk_100304198;
  objc_copyWeak(&v108, &buf);
  id v107 = v105;
  dispatch_async(v56, block);

  objc_destroyWeak(&v108);
  objc_destroyWeak(&buf);

  int v12 = v103;
LABEL_83:
}

- (void)setInitialPayload:(id)a3
{
}

- (void)startEmulation:(id)a3 withMessageType:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  kdebug_trace();
  uint64_t v10 = NFSharedSignpostLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", (const char *)&unk_100286819, buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)_NFTagSession;
  uint64_t v11 = [(_NFSession *)&v18 workQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E7318;
  v14[3] = &unk_100302278;
  id v16 = v9;
  SEL v17 = a2;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (void)stopEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFTagSession;
  uint64_t v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7B30;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)setTagContent:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_NFTagSession;
  id v9 = [(_NFSession *)&v16 workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E81BC;
  v12[3] = &unk_100302278;
  id v14 = v8;
  SEL v15 = a2;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

- (void)getTagContentWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFTagSession;
  uint64_t v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E86AC;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)enableWrite:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NFTagSession;
  id v8 = [(_NFSession *)&v14 workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E8BBC;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  BOOL v13 = a3;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagReadCALogger, 0);

  objc_storeStrong((id *)&self->_tagAgent, 0);
}

@end