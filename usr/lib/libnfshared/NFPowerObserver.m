@interface NFPowerObserver
- (BOOL)registerForEvents;
- (BOOL)willSleep;
- (NFPowerObserver)initWithDelegate:(id)a3;
- (id)delegate;
- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4;
- (void)allowSleep;
- (void)dealloc;
- (void)unregisterForEvents;
@end

@implementation NFPowerObserver

- (NFPowerObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPowerObserver;
  v5 = [(NFPowerObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.stockholm.powerobserver", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (void)dealloc
{
  [(NFPowerObserver *)self unregisterForEvents];
  v3.receiver = self;
  v3.super_class = (Class)NFPowerObserver;
  [(NFPowerObserver *)&v3 dealloc];
}

- (id)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)registerForEvents
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_powerNotificationConnection) {
    return 1;
  }
  io_connect_t v4 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)_NFPowerObserverSystemPowerChanged, &self->_powerNotificationNotifier);
  self->_powerNotificationConnection = v4;
  if (v4)
  {
    IONotificationPortSetDispatchQueue(self->_powerNotificationPort, (dispatch_queue_t)self->_workQueue);
    return 1;
  }
  v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  dispatch_queue_t v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v8)
  {
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(3, "%c[%{public}s %{public}s]:%i Failed to register for PM notifications", v12, ClassName, Name, 67);
    v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v13 = dispatch_get_specific(v6);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v14 = (id)_NFSharedLogClient[(void)v13];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v19 = v16;
    __int16 v20 = 2082;
    v21 = object_getClassName(self);
    __int16 v22 = 2082;
    v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 67;
    _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for PM notifications", buf, 0x22u);
  }

  return 0;
}

- (void)unregisterForEvents
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_powerNotificationConnection)
  {
    io_connect_t v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v6)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i Unregistering Power notifications", v10, ClassName, Name, 82);
      io_connect_t v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    objc_super v11 = dispatch_get_specific(v4);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v12 = (id)_NFSharedLogClient[(void)v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v14;
      __int16 v18 = 2082;
      int v19 = object_getClassName(self);
      __int16 v20 = 2082;
      v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 82;
      _os_log_impl(&dword_1CA51A000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unregistering Power notifications", buf, 0x22u);
    }

    IODeregisterForSystemPower(&self->_powerNotificationNotifier);
    IONotificationPortDestroy(self->_powerNotificationPort);
    IOServiceClose(self->_powerNotificationConnection);
    self->_powerNotificationConnection = 0;
  }
}

- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      uint64_t v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
      if (!v8) {
        return;
      }
      uint64_t v9 = v8;
      uint64_t v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        break;
      }
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v12)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v12(4, "%c[%{public}s %{public}s]:%i Returned %x", v15, ClassName, Name, 99, v9);
        uint64_t v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      int v16 = dispatch_get_specific(v10);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v17 = (id)_NFSharedLogClient[(void)v16];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v19;
        *(_WORD *)v64 = 2082;
        *(void *)&v64[2] = object_getClassName(self);
        __int16 v65 = 2082;
        v66 = sel_getName(a2);
        __int16 v67 = 1024;
        int v68 = 99;
        __int16 v69 = 1024;
        int v70 = v9;
        _os_log_impl(&dword_1CA51A000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned %x", buf, 0x28u);
      }

      return;
    case 1u:
      if (!self->_willSleep)
      {
        v37 = _os_activity_create(&dword_1CA51A000, "system will sleep", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
        *(void *)buf = 0;
        *(void *)v64 = 0;
        os_activity_scope_enter(v37, (os_activity_scope_state_t)buf);
        os_activity_scope_leave((os_activity_scope_state_t)buf);

        self->_willSleep = 1;
        self->_sleepMessageArgument = a4;
        v36 = [(NFPowerObserver *)self delegate];
        [v36 powerObserverSystemWillSleep:self];
        goto LABEL_37;
      }
      __int16 v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v21 >= 4) {
        break;
      }
      __int16 v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v21);
      if (v22)
      {
        int v23 = object_getClass(self);
        BOOL v24 = class_isMetaClass(v23);
        int v25 = object_getClassName(self);
        v60 = sel_getName(a2);
        uint64_t v26 = 45;
        if (v24) {
          uint64_t v26 = 43;
        }
        v22(3, "%c[%{public}s %{public}s]:%i System already sent a will sleep message ! Ignoring will sleep.", v26, v25, v60, 106);
        __int16 v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v27 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v28 = (id)_NFSharedLogClient[(void)v27];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_63;
      }
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v30;
      *(_WORD *)v64 = 2082;
      *(void *)&v64[2] = object_getClassName(self);
      __int16 v65 = 2082;
      v66 = sel_getName(a2);
      __int16 v67 = 1024;
      int v68 = 106;
      v31 = "%c[%{public}s %{public}s]:%i System already sent a will sleep message ! Ignoring will sleep.";
LABEL_62:
      _os_log_impl(&dword_1CA51A000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0x22u);
LABEL_63:

      return;
    case 2u:
      if (self->_willSleep)
      {
        v32 = "system will not sleep";
LABEL_34:
        v33 = _os_activity_create(&dword_1CA51A000, v32, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
        *(void *)buf = 0;
        *(void *)v64 = 0;
        os_activity_scope_enter(v33, (os_activity_scope_state_t)buf);
        os_activity_scope_leave((os_activity_scope_state_t)buf);

        self->_willSleep = 0;
        v34 = [(NFPowerObserver *)self delegate];
        char v35 = objc_opt_respondsToSelector();

        if ((v35 & 1) == 0) {
          return;
        }
        v36 = [(NFPowerObserver *)self delegate];
        [v36 powerObserverSystemHasPoweredOn:self];
LABEL_37:

        return;
      }
      v38 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v39 < 4)
      {
        v40 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v39);
        if (v40)
        {
          v41 = object_getClass(self);
          BOOL v42 = class_isMetaClass(v41);
          v43 = object_getClassName(self);
          v61 = sel_getName(a2);
          uint64_t v44 = 45;
          if (v42) {
            uint64_t v44 = 43;
          }
          v40(4, "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will not sleep message.", v44, v43, v61, 120);
          v38 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v45 = dispatch_get_specific(v38);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v28 = (id)_NFSharedLogClient[(void)v45];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_63;
        }
        v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v47;
        *(_WORD *)v64 = 2082;
        *(void *)&v64[2] = object_getClassName(self);
        __int16 v65 = 2082;
        v66 = sel_getName(a2);
        __int16 v67 = 1024;
        int v68 = 120;
        v31 = "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will not sleep message.";
        goto LABEL_62;
      }
      break;
    case 9u:
      self->_willSleep = 0;
      return;
    case 0xBu:
      if (self->_willSleep)
      {
        v32 = "system will power on";
        goto LABEL_34;
      }
      v48 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v49 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v49 < 4)
      {
        v50 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v49);
        if (v50)
        {
          v51 = object_getClass(self);
          BOOL v52 = class_isMetaClass(v51);
          v53 = object_getClassName(self);
          v62 = sel_getName(a2);
          uint64_t v54 = 45;
          if (v52) {
            uint64_t v54 = 43;
          }
          v50(3, "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will power on message.", v54, v53, v62, 135);
          v48 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v55 = dispatch_get_specific(v48);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v28 = (id)_NFSharedLogClient[(void)v55];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_63;
        }
        v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v57;
        *(_WORD *)v64 = 2082;
        *(void *)&v64[2] = object_getClassName(self);
        __int16 v65 = 2082;
        v66 = sel_getName(a2);
        __int16 v67 = 1024;
        int v68 = 135;
        v31 = "%c[%{public}s %{public}s]:%i System never went to sleep ! Ignoring will power on message.";
        goto LABEL_62;
      }
      break;
    default:
      return;
  }
  __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
}

- (void)allowSleep
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  sleepMessageArgument = self->_sleepMessageArgument;
  self->_sleepMessageArgument = 0;
  if (self->_willSleep)
  {
    uint64_t v5 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)sleepMessageArgument);
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v9)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v9(4, "%c[%{public}s %{public}s]:%i Returned %x", v12, ClassName, Name, 166, v6);
        v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v13 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v14 = (id)_NFSharedLogClient[(void)v13];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = object_getClass(self);
        if (class_isMetaClass(v15)) {
          int v16 = 43;
        }
        else {
          int v16 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v20 = v16;
        __int16 v21 = 2082;
        __int16 v22 = object_getClassName(self);
        __int16 v23 = 2082;
        BOOL v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 166;
        __int16 v27 = 1024;
        int v28 = v6;
        _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned %x", buf, 0x28u);
      }
    }
  }
}

- (BOOL)willSleep
{
  return self->_willSleep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end