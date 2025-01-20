@interface PRAttachedAccessoryMonitor
- (BOOL)monitoring;
- (BOOL)startMonitoring;
- (PRAttachedAccessoryMonitor)initWithQueue:(id)a3;
- (id).cxx_construct;
- (id)stateChangedHandler;
- (void)accessoryConnected:(id)a3;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryDisconnected:(id)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryNotify:(id)a3 isAttached:(BOOL)a4;
- (void)initAccessoryListener;
- (void)setMonitoring:(BOOL)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation PRAttachedAccessoryMonitor

- (PRAttachedAccessoryMonitor)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRAttachedAccessoryMonitor.mm", 64, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PRAttachedAccessoryMonitor;
  v7 = [(PRAttachedAccessoryMonitor *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v8->_monitoring = 0;
    uint64_t v9 = objc_opt_new();
    fConnectedACCAccessoryUUIDs = v8->fConnectedACCAccessoryUUIDs;
    v8->fConnectedACCAccessoryUUIDs = (NSMutableSet *)v9;
  }
  return v8;
}

- (BOOL)startMonitoring
{
  if (!self->_monitoring)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100301D2C;
    block[3] = &unk_1008473B0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
    self->_monitoring = 1;
  }
  return 1;
}

- (void)initAccessoryListener
{
  v3 = +[EAAccessoryManager sharedAccessoryManager];
  fAccessoryManager = self->fAccessoryManager;
  self->fAccessoryManager = v3;

  [(EAAccessoryManager *)self->fAccessoryManager registerForLocalNotifications];
  v5 = +[NSNotificationCenter defaultCenter];
  fNotificationCenter = self->fNotificationCenter;
  self->fNotificationCenter = v5;

  v7 = [(EAAccessoryManager *)self->fAccessoryManager connectedAccessories];
  v8 = (id)qword_1008A9E00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v20 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "examining %lu connected accessories", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        -[PRAttachedAccessoryMonitor accessoryNotify:isAttached:](self, "accessoryNotify:isAttached:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), 1, (void)v14);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(NSNotificationCenter *)self->fNotificationCenter addObserver:self selector:"accessoryConnected:" name:EAAccessoryDidConnectNotification object:0];
  [(NSNotificationCenter *)self->fNotificationCenter addObserver:self selector:"accessoryDisconnected:" name:EAAccessoryDidDisconnectNotification object:0];
  objc_super v13 = +[ACCConnectionInfo sharedInstance];
  [v13 registerDelegate:self];
}

- (void)accessoryNotify:(id)a3 isAttached:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 modelNumber];

    if (v8)
    {
      id v9 = [v7 modelNumber];
      sub_100004950(__p, (char *)[v9 UTF8String]);

      if (v31 < 0)
      {
        if (__p[1] == (void *)5)
        {
          v12 = (void **)__p[0];
          if (*(_DWORD *)__p[0] != 942748225 || *((unsigned char *)__p[0] + 4) != 51)
          {
            if (*(_DWORD *)__p[0] != 942748225 || *((unsigned char *)__p[0] + 4) != 52) {
              goto LABEL_25;
            }
LABEL_29:
            int v18 = 2;
            goto LABEL_36;
          }
          goto LABEL_28;
        }
      }
      else if (v31 == 5)
      {
        if (LODWORD(__p[0]) != 942748225 || BYTE4(__p[0]) != 51)
        {
          if (LODWORD(__p[0]) != 942748225 || BYTE4(__p[0]) != 52)
          {
            v12 = __p;
LABEL_25:
            unsigned int v16 = bswap32(*(_DWORD *)v12);
            if (v16 == 1093808440)
            {
              int v17 = *((unsigned __int8 *)v12 + 4) - 48;
            }
            else if (v16 < 0x41323138)
            {
              int v17 = -1;
            }
            else
            {
              int v17 = 1;
            }
            if (v17) {
              int v18 = 999;
            }
            else {
              int v18 = 3;
            }
            goto LABEL_36;
          }
          goto LABEL_29;
        }
LABEL_28:
        int v18 = 1;
        goto LABEL_36;
      }
      int v18 = 999;
LABEL_36:
      unsigned int v29 = v18;
      v19 = sub_100006A00();
      id v20 = (uint64_t *)sub_1003CEB0C((uint64_t)v19);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      if (*v20 != v22)
      {
        do
        {
          v23 = qword_1008A9E00;
          if (os_log_type_enabled((os_log_t)qword_1008A9E00, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = v21;
            if (*(char *)(v21 + 23) < 0) {
              uint64_t v24 = *(void *)v21;
            }
            *(_DWORD *)buf = 136315138;
            v33 = (void **)v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "regulatory,acc,list,%s", buf, 0xCu);
          }
          v21 += 24;
        }
        while (v21 != v22);
      }
      v25 = qword_1008A9E00;
      if (os_log_type_enabled((os_log_t)qword_1008A9E00, OS_LOG_TYPE_DEFAULT))
      {
        v26 = __p;
        if (v31 < 0) {
          v26 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315138;
        v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "regulatory,acc,model,[%s]", buf, 0xCu);
      }
      if (sub_100302CBC(*v20, v20[1], (unsigned __int8 **)__p) != v20[1])
      {
        v27 = qword_1008A9E00;
        if (os_log_type_enabled((os_log_t)qword_1008A9E00, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v33) = v4;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "regulatory,acc,%d", buf, 8u);
        }
        id stateChangedHandler = self->_stateChangedHandler;
        if (stateChangedHandler) {
          (*((void (**)(id, BOOL, void, void))stateChangedHandler + 2))(stateChangedHandler, v4, 0, v29);
        }
      }
      if (v31 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_53;
    }
  }
  objc_super v13 = qword_1008A9E00;
  if (os_log_type_enabled((os_log_t)qword_1008A9E00, OS_LOG_TYPE_ERROR)) {
    sub_10042ECC0(v4, (uint64_t)v7, v13);
  }
LABEL_53:
}

- (void)accessoryConnected:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003023D0;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)accessoryDisconnected:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100302580;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  long long v14 = [v12 objectForKey:kACCProperties_Endpoint_NFC_Type];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v14 intValue];
      uint64_t v16 = 4;
      switch(v15)
      {
        case 'B':
          uint64_t v16 = 8;
          goto LABEL_16;
        case 'C':
          uint64_t v16 = 6;
          goto LABEL_16;
        case 'D':
          uint64_t v16 = 13;
          goto LABEL_16;
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'U':
          goto LABEL_8;
        case 'L':
          uint64_t v16 = 5;
          goto LABEL_16;
        case 'M':
          uint64_t v16 = 12;
          goto LABEL_16;
        case 'S':
          goto LABEL_16;
        case 'T':
          uint64_t v16 = 11;
          goto LABEL_16;
        case 'V':
          uint64_t v16 = 10;
          goto LABEL_16;
        case 'W':
          uint64_t v16 = 7;
          goto LABEL_16;
        default:
          if (!v15) {
            break;
          }
          if (v15 == 57) {
            uint64_t v16 = 9;
          }
          else {
LABEL_8:
          }
            uint64_t v16 = 999;
LABEL_16:
          if (v13)
          {
            [(NSMutableSet *)self->fConnectedACCAccessoryUUIDs addObject:v13];
            sub_100004950(v23, (char *)[v13 UTF8String]);
            *(void *)buf = v23;
            *((_DWORD *)sub_100302D74((uint64_t)&self->fConnectedACCAccessoryTypes, (unsigned __int8 *)v23, (uint64_t)&unk_1004BC2F8, (long long **)buf)+ 10) = v16;
            int v17 = (id)qword_1008A9E00;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = kACCEndpoint_TransportType_Strings[a4];
              sub_10039D144();
              v19 = v22 >= 0 ? &__p : (void **)__p;
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v12;
              __int16 v26 = 2080;
              uint64_t v27 = v18;
              __int16 v28 = 2080;
              unsigned int v29 = v19;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "regulatory,acc,Accessory attached: %@ type: %s, accessory_type: %s.", buf, 0x20u);
              if (v22 < 0) {
                operator delete(__p);
              }
            }

            id stateChangedHandler = (void (**)(id, uint64_t, void, uint64_t))self->_stateChangedHandler;
            if (stateChangedHandler) {
              stateChangedHandler[2](stateChangedHandler, 1, 0, v16);
            }
            if (v24 < 0) {
              operator delete(v23[0]);
            }
          }
          break;
      }
    }
  }
}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableSet *)self->fConnectedACCAccessoryUUIDs member:v4];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      [(NSMutableSet *)self->fConnectedACCAccessoryUUIDs removeObject:v4];
      id v7 = v4;
      sub_100004950(v16, (char *)[v7 UTF8String]);
      id v8 = sub_100003520(&self->fConnectedACCAccessoryTypes.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)v16);
      if (v8)
      {
        uint64_t v9 = *((unsigned int *)v8 + 10);
        sub_1003030B8(&self->fConnectedACCAccessoryTypes.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v8);
      }
      else
      {
        uint64_t v9 = 998;
      }
      id v11 = (id)qword_1008A9E00;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        sub_10039D144();
        id v12 = v15 >= 0 ? &__p : (void **)__p;
        *(_DWORD *)buf = 138412546;
        id v19 = v7;
        __int16 v20 = 2080;
        uint64_t v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "regulatory,acc,Accessory detached: UUID: %@, accessory_type: %s.", buf, 0x16u);
        if (v15 < 0) {
          operator delete(__p);
        }
      }

      id stateChangedHandler = self->_stateChangedHandler;
      if (stateChangedHandler) {
        (*((void (**)(id, void, void, uint64_t))stateChangedHandler + 2))(stateChangedHandler, 0, 0, v9);
      }
      if (v17 < 0) {
        operator delete(v16[0]);
      }
    }
    else
    {
      id v10 = qword_1008A9E00;
      if (os_log_type_enabled((os_log_t)qword_1008A9E00, OS_LOG_TYPE_ERROR)) {
        sub_10042ED60((uint64_t)v4, v10);
      }
    }
  }
}

- (id)stateChangedHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setStateChangedHandler:(id)a3
{
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  sub_10003AD90((uint64_t)&self->fConnectedACCAccessoryTypes);
  objc_storeStrong((id *)&self->fConnectedACCAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->fNotificationCenter, 0);
  objc_storeStrong((id *)&self->fAccessoryManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end