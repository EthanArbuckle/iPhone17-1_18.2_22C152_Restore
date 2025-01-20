@interface RSDNCMInterface
- (BOOL)activate;
- (BOOL)address;
- (BOOL)is_private;
- (IONotificationPort)notification_port;
- (OS_dispatch_queue)queue;
- (RSDNCMInterface)initWithService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4 queue:(id)a5;
- (RSDRemoteNCMDevice)device;
- (char)mac_addr;
- (char)name;
- (id)addressed_callback;
- (id)detached_callback;
- (id)inactive_callback;
- (unint64_t)state;
- (unsigned)index;
- (unsigned)notification;
- (unsigned)service;
- (void)addressWithRetry;
- (void)advanceState:(unint64_t)a3;
- (void)deactivate;
- (void)dealloc;
- (void)setAddressed_callback:(id)a3;
- (void)setDetached_callback:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInactive_callback:(id)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setIs_private:(BOOL)a3;
- (void)setMac_addr:(char *)a3;
- (void)setName:(char *)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotification_port:(IONotificationPort *)a3;
- (void)setQueue:(id)a3;
- (void)setService:(unsigned int)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation RSDNCMInterface

- (RSDNCMInterface)initWithService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4 queue:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = 0;
  if (v6 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)RSDNCMInterface;
    v10 = [(RSDNCMInterface *)&v12 init];
    self = v10;
    if (v10)
    {
      [(RSDNCMInterface *)v10 setService:v6];
      IOObjectRetain([(RSDNCMInterface *)self service]);
      [(RSDNCMInterface *)self setState:0];
      [(RSDNCMInterface *)self setNotification_port:a4];
      [(RSDNCMInterface *)self setQueue:v8];
      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)activate
{
  kern_return_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  int v9;
  io_object_t notification;
  uint8_t buf[4];
  const char *v12;

  notification = 0;
  v3 = IOServiceAddInterestNotification([(RSDNCMInterface *)self notification_port], [(RSDNCMInterface *)self service], "IOGeneralInterest", (IOServiceInterestCallback)sub_10002D9FC, self, &notification);
  if (v3)
  {
    v4 = sub_10002D068();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003F2C8(v3, v4);
    }
  }
  else
  {
    [(RSDNCMInterface *)self setNotification:notification];
    v9 = 0;
    if (sub_100011B54([(RSDNCMInterface *)self service], &v9))
    {
      v5 = sub_10002D068();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if ((v9 - 1) > 2) {
          uint64_t v6 = "<unknown>";
        }
        else {
          uint64_t v6 = (&off_100055FC8)[v9 - 1];
        }
        *(_DWORD *)buf = 136446210;
        objc_super v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initial linkstatus: %{public}s", buf, 0xCu);
      }

      if (v9 == 3)
      {
        v7 = sub_10002D068();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "arming the connected device", buf, 2u);
        }

        [(RSDNCMInterface *)self advanceState:1];
      }
    }
  }
  return v3 == 0;
}

- (void)deactivate
{
  if ([(RSDNCMInterface *)self notification])
  {
    IOObjectRelease([(RSDNCMInterface *)self notification]);
    [(RSDNCMInterface *)self setNotification:0];
  }
}

- (BOOL)address
{
  memset(__s1, 170, sizeof(__s1));
  WORD2(v15) = -21846;
  LODWORD(v15) = -1431655766;
  v3 = sub_10002D068();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10003F560();
  }

  if (!sub_100011C78([(RSDNCMInterface *)self service], __s1))
  {
    v13 = sub_10002D068();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003F4F8();
    }

    return 0;
  }
  if (*(unsigned __int16 *)__s1 != 28261 && *(_DWORD *)__s1 != 1768975969) {
    sub_10003F48C(&v16, buf);
  }
  v4 = sub_10002D068();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2082;
    *(void *)v21 = __s1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%p] ifname: %{public}s", buf, 0x16u);
  }

  uint64_t v5 = if_nametoindex(__s1);
  if (!v5) {
    sub_10003F3B8(&v16, buf);
  }
  uint64_t v6 = v5;
  v7 = sub_10002D068();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = self;
    __int16 v20 = 1024;
    *(_DWORD *)v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%p] ifindex: %d", buf, 0x12u);
  }

  BOOL v8 = sub_100012108([(RSDNCMInterface *)self service], (uint64_t)&v15);
  v9 = sub_10002D068();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003F424();
    }

    return 0;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219520;
    v19 = self;
    __int16 v20 = 1024;
    *(_DWORD *)v21 = v15;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = BYTE1(v15);
    __int16 v22 = 1024;
    int v23 = BYTE2(v15);
    __int16 v24 = 1024;
    int v25 = BYTE3(v15);
    __int16 v26 = 1024;
    int v27 = BYTE4(v15);
    __int16 v28 = 1024;
    int v29 = BYTE5(v15);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] MAC Address: %02x:%02x:%02x:%02x:%02x:%02x", buf, 0x30u);
  }

  if (_dispatch_is_multithreaded())
  {
    v11 = strdup(__s1);
    if (!v11)
    {
      do
      {
        __os_temporary_resource_shortage();
        objc_super v12 = strdup(__s1);
      }
      while (!v12);
      v11 = v12;
    }
  }
  else
  {
    v11 = strdup(__s1);
    if (!v11) {
      sub_10003872C(__s1, &v16, buf);
    }
  }
  -[RSDNCMInterface setName:](self, "setName:", v11, v15);
  [(RSDNCMInterface *)self setIndex:v6];
  [(RSDNCMInterface *)self setMac_addr:memdup2_np()];
  return 1;
}

- (void)addressWithRetry
{
  if ((id)[(RSDNCMInterface *)self state] == (id)1)
  {
    ++self->address_tries;
    if ([(RSDNCMInterface *)self address])
    {
      [(RSDNCMInterface *)self advanceState:2];
    }
    else
    {
      if (self->address_tries == 60) {
        sub_10003F5D4();
      }
      dispatch_time_t v3 = dispatch_time(0, 5000000000);
      v4 = [(RSDNCMInterface *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002E0BC;
      block[3] = &unk_1000550D0;
      block[4] = self;
      dispatch_after(v3, v4, block);
    }
  }
}

- (void)advanceState:(unint64_t)a3
{
  unint64_t v5 = [(RSDNCMInterface *)self state];
  if (v5 != a3)
  {
    unint64_t v6 = v5;
    v7 = sub_10002D068();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v31 = self;
      __int16 v32 = 2048;
      unint64_t v33 = v6;
      __int16 v34 = 2048;
      unint64_t v35 = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%p] advancing state from %llu to %llu", buf, 0x20u);
    }

    switch(v6)
    {
      case 0uLL:
        if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
          sub_10003F5F0(&v29, buf);
        }
        return;
      case 1uLL:
        if (a3 - 2 >= 2 && a3) {
          sub_10003F65C(a3, &v29, buf);
        }
        return;
      case 2uLL:
        if (a3 && a3 != 3) {
          sub_10003F6EC(a3, &v29, buf);
        }
        return;
      case 3uLL:
        sub_10003F77C();
      default:
        break;
    }
    [(RSDNCMInterface *)self setState:a3];
    self->address_tries = 0;
    switch(a3)
    {
      case 0uLL:
        BOOL v8 = [(RSDNCMInterface *)self inactive_callback];

        if (v8)
        {
          v9 = [(RSDNCMInterface *)self inactive_callback];
          v10 = [(RSDNCMInterface *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002E4D4;
          block[3] = &unk_100055F88;
          block[4] = self;
          int v27 = v9;
          id v11 = v9;
          dispatch_async(v10, block);

          objc_super v12 = v27;
          goto LABEL_17;
        }
        break;
      case 1uLL:
        v13 = [(RSDNCMInterface *)self queue];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10002E4CC;
        v28[3] = &unk_1000550D0;
        v28[4] = self;
        dispatch_async(v13, v28);
        goto LABEL_19;
      case 2uLL:
        v14 = [(RSDNCMInterface *)self addressed_callback];
        uint64_t v15 = [(RSDNCMInterface *)self queue];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002E4E8;
        v24[3] = &unk_100055F88;
        v24[4] = self;
        int v25 = v14;
        id v11 = v14;
        dispatch_async(v15, v24);

        objc_super v12 = v25;
LABEL_17:

        break;
      case 3uLL:
        uint64_t v16 = [(RSDNCMInterface *)self detached_callback];
        v17 = [(RSDNCMInterface *)self queue];
        v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        __int16 v20 = sub_10002E4FC;
        v21 = &unk_100055F88;
        __int16 v22 = self;
        id v23 = v16;
        v13 = v16;
        dispatch_async(v17, &v18);

        -[RSDNCMInterface setInactive_callback:](self, "setInactive_callback:", 0, v18, v19, v20, v21, v22);
        [(RSDNCMInterface *)self setAddressed_callback:0];
        [(RSDNCMInterface *)self setDetached_callback:0];

LABEL_19:
        break;
      default:
        return;
    }
  }
}

- (void)dealloc
{
  dispatch_time_t v3 = sub_10002D068();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10003F798();
  }

  if ([(RSDNCMInterface *)self name])
  {
    free([(RSDNCMInterface *)self name]);
    [(RSDNCMInterface *)self setName:0];
  }
  if ([(RSDNCMInterface *)self mac_addr])
  {
    free([(RSDNCMInterface *)self mac_addr]);
    [(RSDNCMInterface *)self setMac_addr:0];
  }
  [(RSDNCMInterface *)self setIndex:0];
  if ([(RSDNCMInterface *)self service])
  {
    IOObjectRelease([(RSDNCMInterface *)self service]);
    [(RSDNCMInterface *)self setService:0];
  }
  [(RSDNCMInterface *)self deactivate];
  v4.receiver = self;
  v4.super_class = (Class)RSDNCMInterface;
  [(RSDNCMInterface *)&v4 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)inactive_callback
{
  return self->_inactive_callback;
}

- (void)setInactive_callback:(id)a3
{
}

- (id)addressed_callback
{
  return self->_addressed_callback;
}

- (void)setAddressed_callback:(id)a3
{
}

- (id)detached_callback
{
  return self->_detached_callback;
}

- (void)setDetached_callback:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (IONotificationPort)notification_port
{
  return self->_notification_port;
}

- (void)setNotification_port:(IONotificationPort *)a3
{
  self->_notification_port = a3;
}

- (RSDRemoteNCMDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)is_private
{
  return self->_is_private;
}

- (void)setIs_private:(BOOL)a3
{
  self->_is_private = a3;
}

- (char)mac_addr
{
  return self->_mac_addr;
}

- (void)setMac_addr:(char *)a3
{
  self->_mac_addr = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_detached_callback, 0);
  objc_storeStrong(&self->_addressed_callback, 0);
  objc_storeStrong(&self->_inactive_callback, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end