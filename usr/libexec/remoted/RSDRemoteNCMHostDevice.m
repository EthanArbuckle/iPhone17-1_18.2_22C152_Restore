@interface RSDRemoteNCMHostDevice
- (BOOL)connectable;
- (BOOL)suspended;
- (RSDRemoteNCMHostDevice)initWithGeneratedName;
- (RSDRemoteNCMHostDevice)initWithInterface:(id)a3;
- (RSDRemoteNCMHostDevice)initWithUSBSerialNumber:(const __CFString *)a3;
- (uint64_t)tlsRequirement;
- (unsigned)type;
- (void)attach;
- (void)connected;
- (void)disconnect;
- (void)needsConnect;
- (void)setSuspended:(BOOL)a3;
- (void)setupConnectionTimer;
@end

@implementation RSDRemoteNCMHostDevice

- (unsigned)type
{
  return 8;
}

- (RSDRemoteNCMHostDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B618++;
  snprintf(__str, 0x20uLL, "ncm-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMHostDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteNCMHostDevice)initWithUSBSerialNumber:(const __CFString *)a3
{
  int v4 = (id)a3;
  v5 = [(id)qword_10005BD40 objectForKeyedSubscript:v4];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = [v5 UTF8String];
    long long v8 = qword_10005BD30;
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using previously allocated name %{public}s", buf, 0xCu);
    }
    v14.receiver = self;
    v14.super_class = (Class)RSDRemoteNCMHostDevice;
    v9 = [(RSDRemoteDevice *)&v14 initWithName:v7];
  }
  else
  {
    v10 = qword_10005BD30;
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New device attached, allocating name", buf, 2u);
    }
    v11 = [(RSDRemoteNCMHostDevice *)self initWithGeneratedName];
    v9 = v11;
    if (v11)
    {
      v12 = +[NSString stringWithCString:[(RSDRemoteDevice *)v11 device_name] encoding:4];
      [(id)qword_10005BD40 setObject:v12 forKeyedSubscript:v4];
    }
  }

  return v9;
}

- (RSDRemoteNCMHostDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0;
  int v5 = sub_100011D84((io_registry_entry_t)[v4 service], &cf);
  objc_super v6 = qword_10005BD30;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v11 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "USB Serial Number: %{public}@", buf, 0xCu);
    }
    id v7 = [(RSDRemoteNCMHostDevice *)self initWithUSBSerialNumber:cf];
    CFRelease(cf);
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    [(RSDRemoteNCMDevice *)v7 setInterface:v4];
    v7->fd = -1;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR)) {
    sub_100036F20(v6);
  }
  id v7 = [(RSDRemoteNCMHostDevice *)self initWithGeneratedName];
  if (v7) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteNCMHostDevice;
  [(RSDRemoteDevice *)&v5 attach];
  long long v3 = [(RSDRemoteNCMDevice *)self interface];
  unsigned __int8 v4 = [v3 is_private];

  if ((v4 & 1) == 0) {
    [(RSDRemoteNCMHostDevice *)self setupConnectionTimer];
  }
}

- (void)setupConnectionTimer
{
  if (self->connection_timer) {
    sub_100036F64(&v7, v8);
  }
  long long v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005BD28);
  connection_timer = self->connection_timer;
  self->connection_timer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_super v5 = self->connection_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010C38;
  handler[3] = &unk_1000550D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->connection_timer);
}

- (void)needsConnect
{
  long long v3 = qword_10005BD30;
  if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }
  unsigned __int8 v4 = [(RSDRemoteDevice *)self connection];

  if (v4)
  {
    objc_super v5 = qword_10005BD30;
    if (!os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    objc_super v6 = "%{public}@> already have a connection, skip";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    return;
  }
  uint64_t v7 = [(RSDRemoteNCMDevice *)self interface];
  id v8 = [v7 state];

  if (v8 != (id)2)
  {
    objc_super v5 = qword_10005BD30;
    if (!os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    objc_super v6 = "%{public}@> NCM interface not ready";
    goto LABEL_17;
  }
  if (*(_DWORD *)[(RSDRemoteNCMDevice *)self local_address]
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 1)
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 2)
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 3))
  {
    v9 = [(RSDRemoteNCMDevice *)self interface];
    unsigned __int8 v10 = [v9 is_private];

    if ((v10 & 1) == 0)
    {
      nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      [(RSDRemoteNCMDevice *)self setEndpoint:bonjour_service];

      v12 = [(RSDRemoteNCMDevice *)self endpoint];
      if (!v12) {
        sub_1000370EC(&v38, buf);
      }

      v13 = [(RSDRemoteNCMDevice *)self interface];
      objc_super v14 = sub_10002CF20((int)[v13 index]);

      if (v14)
      {
        v15 = nw_parameters_copy_required_interface(v14);
        name = nw_interface_get_name(v15);
        v17 = [(RSDRemoteNCMDevice *)self interface];
        int v18 = strncmp(name, (const char *)[v17 name], 0x10uLL);

        if (v18)
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          v35 = [(RSDRemoteNCMDevice *)self interface];
          [v35 name];
          _os_log_send_and_compose_impl();

          _os_crash_msg();
          __break(1u);
          return;
        }
        v19 = [(RSDRemoteNCMDevice *)self endpoint];
        nw_connection_t v20 = nw_connection_create(v19, v14);

        v21 = v20;
        if (!v21) {
          sub_1000371A4(&v38, buf);
        }
        v22 = v21;

        xpc_remote_connection_get_failsafe_version_flags();
        id v23 = (id)xpc_remote_connection_create_with_nw_connection();
        if (!v23) {
          sub_100037218(&v38, buf);
        }
        v24 = v23;

        [(RSDRemoteDevice *)self connect:v24];
        connection_timer = self->connection_timer;
        dispatch_time_t v26 = dispatch_time(0, 20000000000);
        dispatch_source_set_timer(connection_timer, v26, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        v31 = qword_10005BD30;
        if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_FAULT)) {
          sub_100037160(v31);
        }
      }

      return;
    }
    if (self->fd != -1)
    {
      objc_super v5 = qword_10005BD30;
      if (!os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      objc_super v6 = "%{public}@> already connecting, skip";
      goto LABEL_17;
    }
    v27 = [(RSDRemoteNCMDevice *)self remote_address];
    v28 = [(RSDRemoteNCMDevice *)self interface];
    uint64_t v29 = sub_10001EFB0(&self->fd, (__n128 *)v27, 0xE59Fu, (int)[v28 index], (uint64_t)&xmmword_100044D80);

    v30 = qword_10005BD30;
    if (v29)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR)) {
        sub_100037074((uint64_t)self, v29, v30);
      }
      [(RSDRemoteDevice *)self connect:0];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      uint64_t fd = self->fd;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100011334;
      v36[3] = &unk_1000553B8;
      v36[4] = self;
      [(RSDRemoteDevice *)self pollConnect:fd onQueue:qword_10005BD28 withLog:qword_10005BD30 completion:v36];
    }
  }
  else
  {
    v33 = qword_10005BD30;
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", buf, 0xCu);
    }
    dispatch_time_t v34 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001132C;
    block[3] = &unk_1000550D0;
    block[4] = self;
    dispatch_after(v34, (dispatch_queue_t)qword_10005BD28, block);
  }
}

- (void)disconnect
{
  long long v3 = qword_10005BD30;
  if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  connection_timer = self->connection_timer;
  if (connection_timer)
  {
    dispatch_source_cancel(connection_timer);
    objc_super v5 = self->connection_timer;
    self->connection_timer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMHostDevice;
  [(RSDRemoteDevice *)&v6 disconnect];
}

- (void)connected
{
  connection_timer = self->connection_timer;
  if (connection_timer) {
    dispatch_source_set_timer(connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)RSDRemoteNCMHostDevice;
  [(RSDRemoteNCMDevice *)&v4 connected];
}

- (BOOL)connectable
{
  if (self->_suspended) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteNCMHostDevice;
  return [(RSDRemoteDevice *)&v3 connectable];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = qword_10005BD30;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v7 = 138543362;
        id v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Suspending", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        int v7 = 138543362;
        id v8 = self;
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

- (void).cxx_destruct
{
}

- (uint64_t)tlsRequirement
{
  v0 = sub_10002D068();
  unint64_t v1 = sub_1000194AC(v0, @"rsd_ncm_tls_requirement", @"ncm-tls-requirement");

  if (v1 <= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = v1;
  }
  BOOL v3 = sub_10002D068();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = sub_100018FBC(v2);
    objc_super v5 = "";
    if (!v1) {
      objc_super v5 = " by default";
    }
    int v7 = 136315394;
    id v8 = v4;
    __int16 v9 = 2080;
    unsigned __int8 v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TLS is %s for NCM peers%s", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

@end