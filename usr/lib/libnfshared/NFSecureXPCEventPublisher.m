@interface NFSecureXPCEventPublisher
- (BOOL)_sendDictionary:(char)a3 dispatch:;
- (BOOL)qosPropagation;
- (BOOL)sendDictionary:(id)a3;
- (BOOL)syncSendDictionary:(id)a3;
- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 qosPropagation:(BOOL)a4 qos:(unsigned int)a5 xpcConnectionQueue:(id)a6 eventSendQueue:(id)a7;
- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4;
- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 xpcConnectionQueue:(id)a4 eventSendQueue:(id)a5;
- (NSString)serviceName;
- (OS_dispatch_queue)eventSendQueue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (OS_xpc_object)connection;
- (id)_syncSetupConnection;
- (os_unfair_lock_s)connectionLock;
- (unsigned)qos;
- (void)_sendEvent:(char)a3 dispatch:;
- (void)_sendSimpleEvent:(char)a3 dispatch:;
- (void)_sendSimpleEvent:(void *)a3 objectNumber:(char)a4 dispatch:;
- (void)_sendSimpleEvent:(void *)a3 objectString:(char)a4 dispatch:;
- (void)dealloc;
- (void)invalidate;
- (void)sendSimpleEvent:(id)a3;
- (void)sendSimpleEvent:(id)a3 objectNumber:(id)a4;
- (void)sendSimpleEvent:(id)a3 objectString:(id)a4;
- (void)setConnection:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setEventSendQueue:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)syncSendSimpleEvent:(id)a3;
- (void)syncSendSimpleEvent:(id)a3 objectNumber:(id)a4;
- (void)syncSendSimpleEvent:(id)a3 objectString:(id)a4;
@end

@implementation NFSecureXPCEventPublisher

- (void)sendSimpleEvent:(id)a3
{
}

void __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke(uint64_t a1)
{
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = v1 + 4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2;
  v5[3] = &unk_1E65AB840;
  v5[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  os_unfair_lock_lock(v2);
  __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2((uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

- (BOOL)_sendDictionary:(char)a3 dispatch:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    long long v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    BOOL v7 = v6 != 0;
    if (v6)
    {
      -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v6, a3);
    }
    else
    {
      v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      v10 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v10)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(sel__sendDictionary_dispatch_);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v10(3, "%c[%{public}s %{public}s]:%i Invalid dictionary content: %{public}@", v13, ClassName, Name, 245, v5);
        v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v14 = dispatch_get_specific(v8);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v15 = (id)_NFSharedLogClient[(void)v14];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(a1);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v22 = v17;
        __int16 v23 = 2082;
        v24 = object_getClassName(a1);
        __int16 v25 = 2082;
        v26 = sel_getName(sel__sendDictionary_dispatch_);
        __int16 v27 = 1024;
        int v28 = 245;
        __int16 v29 = 2114;
        id v30 = v5;
        _os_log_impl(&dword_1CA51A000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid dictionary content: %{public}@", buf, 0x2Cu);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_sendSimpleEvent:(char)a3 dispatch:
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  if (a1)
  {
    keys[0] = "xpcEventName";
    xpc_object_t values = xpc_string_create((const char *)[a2 UTF8String]);
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v5, a3);
  }
}

- (void)_sendEvent:(char)a3 dispatch:
{
  id v5 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke;
  v12[3] = &unk_1E65AB840;
  v12[4] = a1;
  v14 = sel__sendEvent_dispatch_;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = MEMORY[0x1CB7978C0](v12);
  v8 = (void *)v7;
  if (a3)
  {
    if ([a1 qosPropagation])
    {
      dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, (dispatch_qos_class_t)[a1 qos], -1, v8);
      v10 = [a1 eventSendQueue];
      dispatch_async(v10, v9);
    }
    else
    {
      v11 = [a1 eventSendQueue];
      dispatch_async(v11, v8);
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

- (unsigned)qos
{
  return self->_qos;
}

- (OS_dispatch_queue)eventSendQueue
{
  return self->_eventSendQueue;
}

void __49__NFSecureXPCEventPublisher__sendEvent_dispatch___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _syncSetupConnection];
  if (v2)
  {
    Class Class = object_getClass(*(id *)(a1 + 40));
    if (Class != (Class)MEMORY[0x1E4F14590])
    {
      long long v4 = Class;
      id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific < 4)
      {
        uint64_t v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
        if (v7)
        {
          v8 = object_getClass(*(id *)(a1 + 32));
          BOOL isMetaClass = class_isMetaClass(v8);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 48));
          v38 = xpc_type_get_name(v4);
          uint64_t v12 = 45;
          if (isMetaClass) {
            uint64_t v12 = 43;
          }
          v7(3, "%c[%{public}s %{public}s]:%i Invalid event type: %s", v12, ClassName, Name, 146, v38);
          id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        id v13 = dispatch_get_specific(v5);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v14 = (id)_NFSharedLogClient[(void)v13];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v15)) {
            int v16 = 43;
          }
          else {
            int v16 = 45;
          }
          int v17 = object_getClassName(*(id *)(a1 + 32));
          v18 = sel_getName(*(SEL *)(a1 + 48));
          *(_DWORD *)buf = 67110146;
          int v40 = v16;
          __int16 v41 = 2082;
          v42 = v17;
          __int16 v43 = 2082;
          v44 = v18;
          __int16 v45 = 1024;
          int v46 = 146;
          __int16 v47 = 2080;
          v48 = xpc_type_get_name(v4);
          _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid event type: %s", buf, 0x2Cu);
        }

        goto LABEL_36;
      }
LABEL_37:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    int v35 = [*(id *)(a1 + 32) qosPropagation];
    v36 = NFSharedSignpostLog();
    BOOL v37 = os_signpost_enabled(v36);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFSecureXPCEventPublisher_post_wQOS", (const char *)&unk_1CA5493FD, buf, 2u);
      }

      xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    }
    else
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFSecureXPCEventPublisher_post", (const char *)&unk_1CA5493FD, buf, 2u);
      }

      xpc_connection_send_notification();
    }
  }
  else
  {
    v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v20 >= 4) {
      goto LABEL_37;
    }
    v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v20);
    if (v21)
    {
      int v22 = object_getClass(*(id *)(a1 + 32));
      BOOL v23 = class_isMetaClass(v22);
      v24 = object_getClassName(*(id *)(a1 + 32));
      __int16 v25 = sel_getName(*(SEL *)(a1 + 48));
      v26 = [*(id *)(a1 + 32) serviceName];
      uint64_t v27 = 45;
      if (v23) {
        uint64_t v27 = 43;
      }
      v21(3, "%c[%{public}s %{public}s]:%i Service unavailable: %{public}@", v27, v24, v25, 141, v26);

      v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    int v28 = dispatch_get_specific(v19);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    __int16 v29 = (id)_NFSharedLogClient[(void)v28];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v30)) {
        int v31 = 43;
      }
      else {
        int v31 = 45;
      }
      v32 = object_getClassName(*(id *)(a1 + 32));
      v33 = sel_getName(*(SEL *)(a1 + 48));
      v34 = [*(id *)(a1 + 32) serviceName];
      *(_DWORD *)buf = 67110146;
      int v40 = v31;
      __int16 v41 = 2082;
      v42 = v32;
      __int16 v43 = 2082;
      v44 = v33;
      __int16 v45 = 1024;
      int v46 = 141;
      __int16 v47 = 2114;
      v48 = v34;
      _os_log_impl(&dword_1CA51A000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Service unavailable: %{public}@", buf, 0x2Cu);
    }
  }
LABEL_36:
}

- (BOOL)qosPropagation
{
  return self->_qosPropagation;
}

- (id)_syncSetupConnection
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {
    id v3 = connection;
  }
  else
  {
    id v6 = [(NFSecureXPCEventPublisher *)self serviceName];
    uint64_t v7 = (const char *)[v6 UTF8String];

    mach_service = xpc_connection_create_mach_service(v7, (dispatch_queue_t)self->_xpcConnectionQueue, 2uLL);
    dispatch_block_t v9 = self->_connection;
    self->_connection = mach_service;

    if (self->_connection)
    {
      objc_initWeak(&location, self);
      v10 = self->_connection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke;
      handler[3] = &unk_1E65ABE28;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a2;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_activate(self->_connection);
      id v3 = self->_connection;
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    else
    {
      v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      id v13 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v13)
      {
        Class Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v17 = 45;
        if (isMetaClass) {
          uint64_t v17 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i Invalid connection creation", v17, ClassName, Name, 57);
        v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v18 = dispatch_get_specific(v11);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v19 = (id)_NFSharedLogClient[(void)v18];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = object_getClass(self);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        LODWORD(location) = 67109890;
        HIDWORD(location) = v21;
        __int16 v27 = 2082;
        int v28 = object_getClassName(self);
        __int16 v29 = 2082;
        id v30 = sel_getName(a2);
        __int16 v31 = 1024;
        int v32 = 57;
        _os_log_impl(&dword_1CA51A000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid connection creation", (uint8_t *)&location, 0x22u);
      }

      id v3 = 0;
    }
  }

  return v3;
}

- (BOOL)sendDictionary:(id)a3
{
  return -[NFSecureXPCEventPublisher _sendDictionary:dispatch:](self, a3, 1);
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    xpc_connection_cancel(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)NFSecureXPCEventPublisher;
  [(NFSecureXPCEventPublisher *)&v4 dealloc];
}

- (void)invalidate
{
  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__NFSecureXPCEventPublisher_invalidate__block_invoke;
  v3[3] = &unk_1E65ABE00;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __39__NFSecureXPCEventPublisher_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

void __39__NFSecureXPCEventPublisher_invalidate__block_invoke(uint64_t a1)
{
  v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    xpc_connection_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;
  }
}

void __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_57;
  }
  Class Class = object_getClass(v3);
  if (Class != (Class)MEMORY[0x1E4F145A8])
  {
    id v6 = Class;
    uint64_t v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      dispatch_block_t v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v9)
      {
        v10 = object_getClass(WeakRetained);
        BOOL isMetaClass = class_isMetaClass(v10);
        ClassName = object_getClassName(WeakRetained);
        Name = sel_getName(*(SEL *)(a1 + 40));
        v67 = xpc_type_get_name(v6);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v9(4, "%c[%{public}s %{public}s]:%i Unexpected typed: %s", v14, ClassName, Name, 87, v67);
        uint64_t v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v15 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      int v16 = (id)_NFSharedLogClient[(void)v15];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = object_getClass(WeakRetained);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        v19 = object_getClassName(WeakRetained);
        v20 = sel_getName(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 67110146;
        int v71 = v18;
        __int16 v72 = 2082;
        v73 = v19;
        __int16 v74 = 2082;
        v75 = v20;
        __int16 v76 = 1024;
        int v77 = 87;
        __int16 v78 = 2080;
        v79 = xpc_type_get_name(v6);
        _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected typed: %s", buf, 0x2Cu);
      }

      goto LABEL_57;
    }
LABEL_58:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if (xpc_equal(v3, MEMORY[0x1E4F14520]))
  {
    int v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    int v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v22 >= 4) {
      goto LABEL_58;
    }
    BOOL v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v22);
    if (v23)
    {
      v24 = object_getClass(WeakRetained);
      BOOL v25 = class_isMetaClass(v24);
      v26 = object_getClassName(WeakRetained);
      __int16 v27 = sel_getName(*(SEL *)(a1 + 40));
      int v28 = [(os_unfair_lock_s *)WeakRetained serviceName];
      uint64_t v29 = 45;
      if (v25) {
        uint64_t v29 = 43;
      }
      v23(6, "%c[%{public}s %{public}s]:%i Service interrupted: %@", v29, v26, v27, 73, v28);

      int v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    id v30 = dispatch_get_specific(v21);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    __int16 v31 = (id)_NFSharedLogClient[(void)v30];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = object_getClass(WeakRetained);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      v34 = object_getClassName(WeakRetained);
      int v35 = sel_getName(*(SEL *)(a1 + 40));
      v36 = [(os_unfair_lock_s *)WeakRetained serviceName];
      *(_DWORD *)buf = 67110146;
      int v71 = v33;
      __int16 v72 = 2082;
      v73 = v34;
      __int16 v74 = 2082;
      v75 = v35;
      __int16 v76 = 1024;
      int v77 = 73;
      __int16 v78 = 2112;
      v79 = v36;
      _os_log_impl(&dword_1CA51A000, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service interrupted: %@", buf, 0x2Cu);
    }
    goto LABEL_56;
  }
  if (!xpc_equal(v3, MEMORY[0x1E4F14528]))
  {
    __int16 v31 = xpc_dictionary_get_value(v3, (const char *)*MEMORY[0x1E4F14530]);
    v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v54 >= 4) {
      goto LABEL_58;
    }
    v55 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v54);
    if (v55)
    {
      v56 = object_getClass(WeakRetained);
      BOOL v57 = class_isMetaClass(v56);
      v58 = object_getClassName(WeakRetained);
      v59 = sel_getName(*(SEL *)(a1 + 40));
      string_ptr = xpc_string_get_string_ptr(v31);
      uint64_t v60 = 45;
      if (v57) {
        uint64_t v60 = 43;
      }
      v55(3, "%c[%{public}s %{public}s]:%i %s", v60, v58, v59, 84, string_ptr);
      v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v61 = dispatch_get_specific(v53);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v62 = (id)_NFSharedLogClient[(void)v61];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = object_getClass(WeakRetained);
      if (class_isMetaClass(v63)) {
        int v64 = 43;
      }
      else {
        int v64 = 45;
      }
      v65 = object_getClassName(WeakRetained);
      v66 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v71 = v64;
      __int16 v72 = 2082;
      v73 = v65;
      __int16 v74 = 2082;
      v75 = v66;
      __int16 v76 = 1024;
      int v77 = 84;
      __int16 v78 = 2080;
      v79 = xpc_string_get_string_ptr(v31);
      _os_log_impl(&dword_1CA51A000, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %s", buf, 0x2Cu);
    }

LABEL_56:
    goto LABEL_57;
  }
  BOOL v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v38 >= 4) {
    goto LABEL_58;
  }
  v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v38);
  if (v39)
  {
    int v40 = object_getClass(WeakRetained);
    BOOL v41 = class_isMetaClass(v40);
    v42 = object_getClassName(WeakRetained);
    __int16 v43 = sel_getName(*(SEL *)(a1 + 40));
    v44 = [(os_unfair_lock_s *)WeakRetained serviceName];
    uint64_t v45 = 45;
    if (v41) {
      uint64_t v45 = 43;
    }
    v39(6, "%c[%{public}s %{public}s]:%i Service not available: %@", v45, v42, v43, 75, v44);

    BOOL v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  int v46 = dispatch_get_specific(v37);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  __int16 v47 = (id)_NFSharedLogClient[(void)v46];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = object_getClass(WeakRetained);
    if (class_isMetaClass(v48)) {
      int v49 = 43;
    }
    else {
      int v49 = 45;
    }
    v50 = object_getClassName(WeakRetained);
    v51 = sel_getName(*(SEL *)(a1 + 40));
    v52 = [(os_unfair_lock_s *)WeakRetained serviceName];
    *(_DWORD *)buf = 67110146;
    int v71 = v49;
    __int16 v72 = 2082;
    v73 = v50;
    __int16 v74 = 2082;
    v75 = v51;
    __int16 v76 = 1024;
    int v77 = 75;
    __int16 v78 = 2112;
    v79 = v52;
    _os_log_impl(&dword_1CA51A000, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Service not available: %@", buf, 0x2Cu);
  }
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4;
  v69[3] = &unk_1E65ABE00;
  v69[4] = WeakRetained;
  os_unfair_lock_lock(WeakRetained + 4);
  __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4((uint64_t)v69);
  os_unfair_lock_unlock(WeakRetained + 4);
LABEL_57:
}

void __49__NFSecureXPCEventPublisher__syncSetupConnection__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) connection];
    xpc_connection_cancel(v3);

    objc_super v4 = *(void **)(a1 + 32);
    [v4 setConnection:0];
  }
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4
{
  return [(NFSecureXPCEventPublisher *)self initWithMachPort:a3 xpcConnectionQueue:a4 eventSendQueue:a4];
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 xpcConnectionQueue:(id)a4 eventSendQueue:(id)a5
{
  return [(NFSecureXPCEventPublisher *)self initWithMachPort:a3 qosPropagation:1 qos:33 xpcConnectionQueue:a4 eventSendQueue:a5];
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 qosPropagation:(BOOL)a4 qos:(unsigned int)a5 xpcConnectionQueue:(id)a6 eventSendQueue:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFSecureXPCEventPublisher;
  int v16 = [(NFSecureXPCEventPublisher *)&v21 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceName, a3);
    v17->_qosPropagation = a4;
    v17->_qos = a5;
    objc_storeStrong((id *)&v17->_xpcConnectionQueue, a6);
    objc_storeStrong((id *)&v17->_eventSendQueue, a7);
    v17->_connectionLock._os_unfair_lock_opaque = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__NFSecureXPCEventPublisher_initWithMachPort_qosPropagation_qos_xpcConnectionQueue_eventSendQueue___block_invoke;
    v19[3] = &unk_1E65ABE00;
    v20 = v17;
    os_unfair_lock_lock(&v17->_connectionLock);
    __99__NFSecureXPCEventPublisher_initWithMachPort_qosPropagation_qos_xpcConnectionQueue_eventSendQueue___block_invoke((uint64_t)v19);
    os_unfair_lock_unlock(&v17->_connectionLock);
  }
  return v17;
}

id __99__NFSecureXPCEventPublisher_initWithMachPort_qosPropagation_qos_xpcConnectionQueue_eventSendQueue___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _syncSetupConnection];
}

- (void)syncSendSimpleEvent:(id)a3
{
}

- (void)_sendSimpleEvent:(void *)a3 objectString:(char)a4 dispatch:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    *(_OWORD *)keys = xmmword_1E65ABE48;
    v10[0] = xpc_string_create((const char *)[a2 UTF8String]);
    v10[1] = xpc_string_create((const char *)[v7 UTF8String:v10[0]]);
    xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v8, a4);

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (void)sendSimpleEvent:(id)a3 objectString:(id)a4
{
}

- (void)syncSendSimpleEvent:(id)a3 objectString:(id)a4
{
}

- (void)_sendSimpleEvent:(void *)a3 objectNumber:(char)a4 dispatch:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a1)
  {
    *(_OWORD *)keys = xmmword_1E65ABE58;
    int64_t v8 = [v7 integerValue:[a2 UTF8String]];
    v11[1] = xpc_int64_create(v8);
    xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, v11, 2uLL);
    -[NFSecureXPCEventPublisher _sendEvent:dispatch:](a1, v9, a4);

    for (uint64_t i = 1; i != -1; --i)
  }
}

- (void)sendSimpleEvent:(id)a3 objectNumber:(id)a4
{
}

- (void)syncSendSimpleEvent:(id)a3 objectNumber:(id)a4
{
}

- (BOOL)syncSendDictionary:(id)a3
{
  return -[NFSecureXPCEventPublisher _sendDictionary:dispatch:](self, a3, 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (void)setEventSendQueue:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_eventSendQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end