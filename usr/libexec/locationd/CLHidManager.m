@interface CLHidManager
- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CLHidManagerDelegate)delegate;
- (HIDManager)manager;
- (NSMutableArray)clientDevices;
- (OS_dispatch_queue)delegateQueue;
- (id)createDeviceForMatchingDictionary:(id)a3;
- (id)getClientDeviceMatchingDict:(id)a3;
- (id)getClientDeviceMatchingHIDDevice:(id)a3;
- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3;
- (id)registerForDeviceMatching:(id)a3;
- (void)activateClientDevice:(id)a3;
- (void)dealloc;
- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)setClientDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterForDeviceMatching:(id)a3;
- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4;
@end

@implementation CLHidManager

- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CLHidManager;
  v6 = [(CLHidManager *)&v15 init];
  if (v6)
  {
    v6->_clientDevices = (NSMutableArray *)objc_opt_new();
    v6->_delegate = (CLHidManagerDelegate *)a3;
    v6->_delegateQueue = (OS_dispatch_queue *)a4;
    v7 = (HIDManager *)[objc_alloc((Class)HIDManager) initWithOptions:8];
    v6->_manager = v7;
    [(HIDManager *)v7 setDeviceMatching:&__NSDictionary0__struct];
    [(HIDManager *)v6->_manager setDispatchQueue:v6->_delegateQueue];
    manager = v6->_manager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100AC00F8;
    v14[3] = &unk_1022DC028;
    v14[4] = v6;
    [(HIDManager *)manager setDeviceNotificationHandler:v14];
    [(HIDManager *)v6->_manager activate];
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022DC098);
    }
    v9 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [(HIDManager *)v6->_manager devices];
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_1022DC098);
      }
      id v12 = [(HIDManager *)v6->_manager devices];
      int v16 = 138412290;
      id v17 = v12;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHidManager initWithDelegate:queue:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  [(HIDManager *)self->_manager cancel];
  [(HIDManager *)self->_manager close];

  [(NSMutableArray *)self->_clientDevices removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)CLHidManager;
  [(CLHidManager *)&v3 dealloc];
}

- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AC0264;
  block[3] = &unk_1022DC050;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async((dispatch_queue_t)[(CLHidManager *)self delegateQueue], block);
}

- (id)createDeviceForMatchingDictionary:(id)a3
{
  id v5 = -[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:](self, "getHidDeviceFromEnumeratedDevicesMatching:");
  v6 = [(CLHidManager *)self getClientDeviceMatchingDict:a3];
  if (!v6)
  {
    v6 = [[CLHidDevice alloc] initWithHidDevice:v5 matchingDict:a3];
    [(NSMutableArray *)[(CLHidManager *)self clientDevices] addObject:v6];
    [(CLHidManager *)self activateClientDevice:v6];
    if (!v5) {
      return v6;
    }
    goto LABEL_3;
  }
  if (v5) {
LABEL_3:
  }
    [(CLHidManager *)self sendMonitorUpdateForDevice:v6 added:1];
  return v6;
}

- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[CLHidManager getClientDeviceMatchingHIDDevice:](self, "getClientDeviceMatchingHIDDevice:");
  if (v7)
  {
    id v8 = v7;
    if (v4)
    {
      [v7 setHidDevice:a3];
      [(CLHidManager *)self activateClientDevice:v8];
    }
    else
    {
      [v7 setHidDevice:0];
    }
    [(CLHidManager *)self sendMonitorUpdateForDevice:v8 added:v4];
  }
}

- (void)activateClientDevice:(id)a3
{
  if ([a3 hidDevice])
  {
    [objc_msgSend(a3, "hidDevice") setDispatchQueue:-[CLHidManager delegateQueue](self, "delegateQueue")];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100AC04D0;
    v5[3] = &unk_1022DC078;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = self;
    [objc_msgSend(a3, "hidDevice") setInputReportHandler:v5];
    [objc_msgSend(a3, "hidDevice") open];
    [objc_msgSend(a3, "hidDevice") activate];
  }
}

- (id)getClientDeviceMatchingDict:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(CLHidManager *)self clientDevices];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "matching"), "isEqual:", a3))
        {
          if (qword_102418FD0 != -1) {
            dispatch_once(&qword_102418FD0, &stru_1022DC098);
          }
          id v10 = qword_102418FD8;
          if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = a3;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[CLHidManager], matched CLHidDevice for %@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102418FD0 != -1) {
              dispatch_once(&qword_102418FD0, &stru_1022DC098);
            }
            int v17 = 138412290;
            id v18 = a3;
            id v12 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHidManager getClientDeviceMatchingDict:]", "%s\n", v12);
            if (v12 != (char *)buf) {
              free(v12);
            }
          }
          return v9;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(HIDManager *)[(CLHidManager *)self manager] devices];
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v22;
  while (1)
  {
    uint64_t v7 = 0;
LABEL_4:
    if (*(void *)v22 != v6) {
      objc_enumerationMutation(obj);
    }
    id v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [a3 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (!v9) {
      break;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(a3);
      }
      if (![[objc_msgSend(objc_msgSend(v8, "propertyForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v12)), "isEqual:", objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v12)))])break; {
      if (v10 == (id)++v12)
      }
      {
        id v10 = [a3 countByEnumeratingWithState:&v17 objects:v29 count:16];
        if (v10) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    if ((id)++v7 != v5) {
      goto LABEL_4;
    }
    id v5 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
    id v8 = 0;
    if (!v5) {
      return v8;
    }
  }
LABEL_18:
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022DC098);
  }
  long long v13 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[CLHidManager], matched device for %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022DC098);
    }
    int v25 = 138412290;
    id v26 = a3;
    long long v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  return v8;
}

- (id)getClientDeviceMatchingHIDDevice:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(CLHidManager *)self clientDevices];
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v15 = *(void *)v21;
  do
  {
    uint64_t v6 = 0;
LABEL_4:
    if (*(void *)v21 != v15) {
      objc_enumerationMutation(obj);
    }
    uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [v7 matching];
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (!v9) {
      break;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      if (![[objc_msgSend(objc_msgSend(a3, "propertyForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v12)), "isEqual:", objc_msgSend(objc_msgSend(v7, "matching"), "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v12)))] boolValue])break; {
      if (v10 == (id)++v12)
      }
      {
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10) {
          goto LABEL_8;
        }
        return v7;
      }
    }
    if ((id)++v6 != v5) {
      goto LABEL_4;
    }
    id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    uint64_t v7 = 0;
  }
  while (v5);
  return v7;
}

- (id)registerForDeviceMatching:(id)a3
{
  return [(CLHidManager *)self createDeviceForMatchingDictionary:a3];
}

- (void)unregisterForDeviceMatching:(id)a3
{
  id v4 = [(CLHidManager *)self clientDevices];

  [(NSMutableArray *)v4 removeObject:a3];
}

- (CLHidManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDManager)manager
{
  return self->_manager;
}

- (NSMutableArray)clientDevices
{
  return self->_clientDevices;
}

- (void)setClientDevices:(id)a3
{
}

@end