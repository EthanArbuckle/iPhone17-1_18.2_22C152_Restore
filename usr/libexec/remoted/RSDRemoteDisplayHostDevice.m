@interface RSDRemoteDisplayHostDevice
- (BOOL)connectable;
- (BOOL)suspended;
- (RSDRemoteDisplayHostDevice)initWithGeneratedName;
- (RSDRemoteDisplayHostDevice)initWithInterface:(id)a3;
- (RSDRemoteDisplayHostDevice)initWithUSBSerialNumber:(const __CFString *)a3;
- (unsigned)type;
- (void)disconnect;
- (void)needsConnect;
- (void)setSuspended:(BOOL)a3;
@end

@implementation RSDRemoteDisplayHostDevice

- (unsigned)type
{
  return 11;
}

- (RSDRemoteDisplayHostDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B62C++;
  snprintf(__str, 0x20uLL, "display-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteDisplayHostDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteDisplayHostDevice)initWithUSBSerialNumber:(const __CFString *)a3
{
  int v4 = (id)a3;
  v5 = [(id)qword_10005BF40 objectForKeyedSubscript:v4];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = [v5 UTF8String];
    long long v8 = qword_10005BF28;
    if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using previously allocated name %{public}s", buf, 0xCu);
    }
    v14.receiver = self;
    v14.super_class = (Class)RSDRemoteDisplayHostDevice;
    v9 = [(RSDRemoteDevice *)&v14 initWithName:v7];
  }
  else
  {
    v10 = qword_10005BF28;
    if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New device attached, allocating name", buf, 2u);
    }
    v11 = [(RSDRemoteDisplayHostDevice *)self initWithGeneratedName];
    v9 = v11;
    if (v11)
    {
      v12 = +[NSString stringWithCString:[(RSDRemoteDevice *)v11 device_name] encoding:4];
      [(id)qword_10005BF40 setObject:v12 forKeyedSubscript:v4];
    }
  }

  return v9;
}

- (RSDRemoteDisplayHostDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0;
  int v5 = sub_100011D84((io_registry_entry_t)[v4 service], &cf);
  objc_super v6 = qword_10005BF28;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v11 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "USB Serial Number: %{public}@", buf, 0xCu);
    }
    id v7 = [(RSDRemoteDisplayHostDevice *)self initWithUSBSerialNumber:cf];
    CFRelease(cf);
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    [(RSDRemoteNCMDevice *)v7 setInterface:v4];
    v7->fd = -1;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_ERROR)) {
    sub_100036F20(v6);
  }
  id v7 = [(RSDRemoteDisplayHostDevice *)self initWithGeneratedName];
  if (v7) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (void)needsConnect
{
  long long v3 = qword_10005BF28;
  if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  id v4 = [(RSDRemoteNCMDevice *)self interface];
  id v5 = [v4 state];

  if (v5 == (id)2)
  {
    if (*(_DWORD *)[(RSDRemoteNCMDevice *)self local_address]
      || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 1)
      || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 2)
      || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 3))
    {
      if (self->fd == -1)
      {
        long long v8 = [(RSDRemoteNCMDevice *)self remote_address];
        v9 = [(RSDRemoteNCMDevice *)self interface];
        uint64_t v10 = sub_10001EFB0(&self->fd, (__n128 *)v8, 0xE59Fu, (int)[v9 index], (uint64_t)&xmmword_100044D80);

        CFTypeRef v11 = qword_10005BF28;
        if (v10)
        {
          if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_ERROR)) {
            sub_100037074((uint64_t)self, v10, v11);
          }
          [(RSDRemoteDevice *)self connect:0];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v18 = self;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
          }
          uint64_t fd = self->fd;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000289C0;
          v15[3] = &unk_1000553B8;
          v15[4] = self;
          [(RSDRemoteDevice *)self pollConnect:fd onQueue:qword_10005BF30 withLog:qword_10005BF28 completion:v15];
        }
      }
      else
      {
        objc_super v6 = qword_10005BF28;
        if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v18 = self;
          id v7 = "%{public}@> already connecting, skip";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
        }
      }
    }
    else
    {
      v13 = qword_10005BF28;
      if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", buf, 0xCu);
      }
      dispatch_time_t v14 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000289B8;
      block[3] = &unk_1000550D0;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)qword_10005BF30, block);
    }
  }
  else
  {
    objc_super v6 = qword_10005BF28;
    if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      id v7 = "%{public}@> NCM interface not ready";
      goto LABEL_13;
    }
  }
}

- (void)disconnect
{
  long long v3 = qword_10005BF28;
  if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteDisplayHostDevice;
  [(RSDRemoteDevice *)&v4 disconnect];
}

- (BOOL)connectable
{
  if (self->_suspended) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayHostDevice;
  return [(RSDRemoteDevice *)&v3 connectable];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    id v5 = qword_10005BF28;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v7 = 138543362;
        long long v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Suspending", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        int v7 = 138543362;
        long long v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Resuming", (uint8_t *)&v7, 0xCu);
      }
      [(RSDRemoteDevice *)self drainPendedRequests];
    }
    self->_suspended = v3;
  }
}

- (BOOL)suspended
{
  return self->_suspended;
}

@end