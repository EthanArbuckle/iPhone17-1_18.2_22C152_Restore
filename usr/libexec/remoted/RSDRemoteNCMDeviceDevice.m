@interface RSDRemoteNCMDeviceDevice
- (BOOL)isTrusted;
- (RSDRemoteNCMDeviceDevice)initWithGeneratedName;
- (RSDRemoteNCMDeviceDevice)initWithInterface:(id)a3;
- (unsigned)type;
- (void)attach;
- (void)createBonjourListener;
- (void)createPortListener;
- (void)disconnect;
- (void)needsConnect;
@end

@implementation RSDRemoteNCMDeviceDevice

- (unsigned)type
{
  return 9;
}

- (BOOL)isTrusted
{
  if (self->_researchInfraEnforcementDisabled)
  {
    v3 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Treating ncm host as trusted on research VM", buf, 0xCu);
    }
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RSDRemoteNCMDeviceDevice;
    return [(RSDRemoteDevice *)&v5 isTrusted];
  }
}

- (RSDRemoteNCMDeviceDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B61C++;
  snprintf(__str, 0x20uLL, "ncmhost-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMDeviceDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteNCMDeviceDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(RSDRemoteNCMDeviceDevice *)self initWithGeneratedName];
  objc_super v6 = v5;
  if (v5)
  {
    [(RSDRemoteNCMDevice *)v5 setInterface:v4];
    v7 = v6;
  }

  return v6;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteNCMDeviceDevice;
  [(RSDRemoteDevice *)&v5 attach];
  if (sub_10002D150()) {
    [(RSDRemoteNCMDeviceDevice *)self createBonjourListener];
  }
  long long v3 = [(RSDRemoteNCMDevice *)self interface];
  unsigned int v4 = [v3 is_private];

  if (v4) {
    [(RSDRemoteNCMDeviceDevice *)self createPortListener];
  }
}

- (void)disconnect
{
  long long v3 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  if (self->bonjour_listener)
  {
    unsigned int v4 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling bonjour listener", buf, 0xCu);
    }
    nw_listener_cancel((nw_listener_t)self->bonjour_listener);
  }
  if (self->listener_source)
  {
    objc_super v5 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling port listener", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->listener_source);
  }
  if (self->reestablished_connection) {
    xpc_remote_connection_cancel();
  }
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteNCMDeviceDevice;
  [(RSDRemoteDevice *)&v6 disconnect];
}

- (void)needsConnect
{
  long long v3 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v9, 0xCu);
  }
  self->_researchInfraEnforcementDisabled = sub_1000036E0((void *)qword_10005BD68);
  if (self->reestablished_connection)
  {
    unsigned int v4 = [(RSDRemoteDevice *)self connection];

    objc_super v5 = qword_10005BD68;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for current connection to invalidate before applying reestablished connection", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Applying re-established connection", (uint8_t *)&v9, 0xCu);
      }
      reestablished_connection = self->reestablished_connection;
      self->reestablished_connection = 0;
      long long v8 = reestablished_connection;

      [(RSDRemoteDevice *)self connect:v8];
    }
  }
}

- (void)createBonjourListener
{
  long long v3 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> create bonjour listener start", (uint8_t *)buf, 0xCu);
  }
  if (*(_DWORD *)[(RSDRemoteNCMDevice *)self local_address]
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 1)
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 2)
    || *((_DWORD *)[(RSDRemoteNCMDevice *)self local_address] + 3))
  {
    unsigned int v4 = [(RSDRemoteNCMDevice *)self interface];
    objc_super v5 = sub_10002CF20((int)[v4 index]);

    if (!v5)
    {
      v19 = qword_10005BD68;
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_FAULT)) {
        sub_100037160(v19);
      }
      goto LABEL_16;
    }
    BOOL v6 = nw_parameters_copy_required_interface(v5);
    name = nw_interface_get_name(v6);
    long long v8 = [(RSDRemoteNCMDevice *)self interface];
    int v9 = strncmp(name, (const char *)[v8 name], 0x10uLL);

    if (!v9)
    {
      v10 = (OS_nw_listener *)nw_listener_create(v5);
      bonjour_listener = self->bonjour_listener;
      self->bonjour_listener = v10;

      v12 = self->bonjour_listener;
      if (!v12) {
        sub_100037CF8(&v27, buf);
      }

      v13 = nw_advertise_descriptor_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      if (!v13) {
        sub_100037D74(&v27, buf);
      }
      v14 = v13;

      nw_advertise_descriptor_set_no_auto_rename(v14, 1);
      nw_listener_set_advertise_descriptor((nw_listener_t)self->bonjour_listener, v14);
      v15 = self->bonjour_listener;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100013BC0;
      handler[3] = &unk_100055030;
      handler[4] = self;
      nw_listener_set_new_connection_handler(v15, handler);
      v16 = self->bonjour_listener;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100013D68;
      v24[3] = &unk_100055480;
      v24[4] = self;
      nw_listener_set_state_changed_handler(v16, v24);
      v17 = self->bonjour_listener;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000140F4;
      v23[3] = &unk_1000554A8;
      v23[4] = self;
      nw_listener_set_advertised_endpoint_changed_handler(v17, v23);
      nw_listener_set_queue((nw_listener_t)self->bonjour_listener, (dispatch_queue_t)qword_10005BD60);
      nw_listener_start((nw_listener_t)self->bonjour_listener);
      v18 = qword_10005BD68;
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 138543362;
        *(void *)((char *)buf + 4) = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@> create bonjour listener done", (uint8_t *)buf, 0xCu);
      }

LABEL_16:
      return;
    }
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v22 = [(RSDRemoteNCMDevice *)self interface];
    [v22 name];
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  else
  {
    v20 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@> no inet6 assigned, try again later", (uint8_t *)buf, 0xCu);
    }
    dispatch_time_t v21 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013B70;
    block[3] = &unk_1000550D0;
    block[4] = self;
    dispatch_after(v21, (dispatch_queue_t)qword_10005BD60, block);
  }
}

- (void)createPortListener
{
  long long v3 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener start", buf, 0xCu);
  }
  __int16 v17 = -6753;
  int v16 = -1;
  unsigned int v4 = [(RSDRemoteNCMDevice *)self local_address];
  objc_super v5 = [(RSDRemoteNCMDevice *)self interface];
  int v6 = sub_10001F504(&v16, (__n128 *)v4, &v17, (int)[v5 index], (uint64_t)&unk_100044D94);

  if (v6)
  {
    v7 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_ERROR)) {
      sub_100037EE8((uint64_t)self, v6, v7);
    }
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000144B4;
    block[3] = &unk_1000550D0;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)qword_10005BD60, block);
  }
  else
  {
    int v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v16, 0, (dispatch_queue_t)qword_10005BD60);
    listener_source = self->listener_source;
    self->listener_source = v9;

    v11 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100014504;
    handler[3] = &unk_1000554D0;
    int v14 = v16;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate((dispatch_object_t)self->listener_source);
    v12 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener done", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener_source, 0);
  objc_storeStrong((id *)&self->bonjour_listener, 0);

  objc_storeStrong((id *)&self->reestablished_connection, 0);
}

@end