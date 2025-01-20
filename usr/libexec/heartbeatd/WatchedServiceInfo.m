@interface WatchedServiceInfo
+ (int)processWatchCommand:(id)a3;
- (BOOL)hasHeartbeatRef:(unint64_t)a3 pid:(int)a4;
- (NSString)descriptionOverride;
- (NSString)hostClient;
- (NSString)hostID;
- (NSString)peerName;
- (NSString)serviceName;
- (NSUUID)serviceInstanceID;
- (OS_dispatch_source)procExitSource;
- (WatchedServiceInfo)initWithWatchCommand:(id)a3;
- (double)serviceStartTime;
- (id)description;
- (int)ourFD;
- (int)theirPID;
- (unint64_t)heartbeatRef;
- (void)dealloc;
- (void)invalidate;
- (void)logService:(const char *)a3;
- (void)setDescriptionOverride:(id)a3;
- (void)setHeartbeatRef:(unint64_t)a3;
- (void)setHostClient:(id)a3;
- (void)setHostID:(id)a3;
- (void)setOurFD:(int)a3;
- (void)setPeerName:(id)a3;
- (void)setProcExitSource:(id)a3;
- (void)setServiceInstanceID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceStartTime:(double)a3;
- (void)setTheirPID:(int)a3;
@end

@implementation WatchedServiceInfo

+ (int)processWatchCommand:(id)a3
{
  id v3 = a3;
  v4 = [[WatchedServiceInfo alloc] initWithWatchCommand:v3];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      v9 = "Failed to allocate service.";
      v10 = (uint8_t *)&v13;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_11:
    int v8 = -1;
    goto LABEL_12;
  }
  uint64_t v5 = xpc_dictionary_get_remote_connection(v3);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v9 = "Failed to retrieve message from service.";
      v10 = (uint8_t *)&v12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = (_xpc_connection_s *)v5;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "HB_PARAM_REF", [(WatchedServiceInfo *)v4 heartbeatRef]);
    xpc_connection_send_message(v6, reply);
  }
  [(WatchedServiceInfo *)v4 logService:"Watching"];

  int v8 = 0;
LABEL_12:

  return v8;
}

- (WatchedServiceInfo)initWithWatchCommand:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)WatchedServiceInfo;
  uint64_t v5 = [(WatchedServiceInfo *)&v43 init];
  if (!v5) {
    goto LABEL_50;
  }
  bzero(buffer, 0x401uLL);
  objc_initWeak(&location, v5);
  id v6 = objc_alloc_init((Class)NSUUID);
  v7 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v6;

  if (!*((void *)v5 + 4))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed to create UUID.";
LABEL_21:
    uint32_t v19 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
    goto LABEL_23;
  }
  TMGetKernelMonotonicClock();
  *((double *)v5 + 3) = v8;
  if (v8 <= 0.0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed to query monotonic clock time.";
    goto LABEL_21;
  }
  xpc_dictionary_get_remote_connection(v4);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5[3] = xpc_connection_get_pid(v9);

  if (!v5[3])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed to query remote PID.";
    goto LABEL_21;
  }
  string = xpc_dictionary_get_string(v4, "HB_PARAM_HOSTID");
  if (!string)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    unsigned int v21 = v5[3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v21;
    v18 = "Failed to query HOST ID from client pid %d";
    goto LABEL_31;
  }
  id v11 = [objc_alloc((Class)NSString) initWithCString:string encoding:4];
  __int16 v12 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v11;

  if (!*((void *)v5 + 5))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v45 = string;
    v18 = "Failed to create string for %{public}s.";
    goto LABEL_28;
  }
  *((void *)v5 + 2) = mach_absolute_time();
  int v13 = xpc_dictionary_dup_fd(v4, "HB_PARAM_FD");
  v5[2] = v13;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    unsigned int v22 = v5[3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v22;
    v18 = "Failed to retrieve valid FD from client pid %d.";
LABEL_31:
    uint32_t v19 = 8;
    goto LABEL_22;
  }
  if (!sub_100001444(v13))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed setting _ourFD options";
    goto LABEL_21;
  }
  uint64_t v14 = sub_100004D84(v5[2]);
  v15 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v14;

  if (!*((void *)v5 + 7))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v18 = "Failed to get _peerName from socket.";
    goto LABEL_21;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "HB_PARAM_THEIRFD");
  if (!uint64 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown client FD.", buf, 2u);
  }
  if (proc_pidinfo(v5[3], 11, 1uLL, buffer, 1025))
  {
    v17 = "Unknown process";
  }
  else
  {
    v17 = buffer;
    v23 = rindex(buffer, 47);
    if (v23) {
      v17 = v23 + 1;
    }
  }
  v24 = xpc_dictionary_get_string(v4, "HB_PARAM_CLIENTNAME");
  if (v24) {
    v25 = v24;
  }
  else {
    v25 = "Unknown client";
  }
  id v26 = [objc_alloc((Class)NSString) initWithUTF8String:v25];
  v27 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v26;

  if (!*((void *)v5 + 6))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v45 = v25;
    v18 = "Failed to create string for %{public}s.";
    goto LABEL_28;
  }
  v28 = xpc_dictionary_get_string(v4, "HB_PARAM_HOSTNAME");
  if (v28) {
    v29 = v28;
  }
  else {
    v29 = "Unknown host";
  }
  id v30 = [objc_alloc((Class)NSString) initWithUTF8String:v17];
  v31 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v30;

  if (!*((void *)v5 + 8))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v45 = v17;
    v18 = "Failed to create string for %{public}s.";
LABEL_28:
    uint32_t v19 = 12;
    goto LABEL_22;
  }
  id v32 = objc_alloc((Class)NSString);
  v33 = (objc_class *)objc_opt_class();
  id v34 = [v32 initWithFormat:@"<%s: %p> [client=%@ '%s' (%@ %@)] [fd=%d] [pid=%d (%@ fd=%d)] [hb=%lld]", class_getName(v33), v5, *((void *)v5 + 6), v29, *((void *)v5 + 5), *((void *)v5 + 7), v5[2], v5[3], *((void *)v5 + 8), uint64, *((void *)v5 + 2)];
  v35 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v34;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100007F40((uint64_t)v5);
  }
  dispatch_source_t v36 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)v5[3], 0x80000000uLL, (dispatch_queue_t)qword_100010C08);
  v37 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v36;

  v38 = *((void *)v5 + 10);
  if (v38)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000060B4;
    handler[3] = &unk_10000C6D0;
    objc_copyWeak(&v41, &location);
    dispatch_source_set_event_handler(v38, handler);
    dispatch_resume(*((dispatch_object_t *)v5 + 10));
    +[HostWatcher addService:v5 forHostID:*((void *)v5 + 5)];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
LABEL_50:
    v20 = v5;
    goto LABEL_51;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v18 = "Failed to create dispatch source.";
    goto LABEL_21;
  }
LABEL_23:
  objc_destroyWeak(&location);
  v20 = 0;
LABEL_51:

  return v20;
}

- (void)dealloc
{
  [(WatchedServiceInfo *)self logService:"Deallocating service watcher"];
  int ourFD = self->_ourFD;
  if (ourFD != -1)
  {
    shutdown(ourFD, 2);
    close(self->_ourFD);
    self->_int ourFD = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WatchedServiceInfo;
  [(WatchedServiceInfo *)&v4 dealloc];
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  [(WatchedServiceInfo *)self logService:"Invalidating service watcher"];
  id v3 = qword_100010C08;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006238;
  v4[3] = &unk_10000C6D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)description
{
  id v3 = [(WatchedServiceInfo *)self descriptionOverride];

  if (v3)
  {
    objc_super v4 = [(WatchedServiceInfo *)self descriptionOverride];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WatchedServiceInfo;
    objc_super v4 = [(WatchedServiceInfo *)&v6 description];
  }

  return v4;
}

- (void)logService:(const char *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    objc_super v6 = a3;
    __int16 v7 = 2114;
    double v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (BOOL)hasHeartbeatRef:(unint64_t)a3 pid:(int)a4
{
  return [(WatchedServiceInfo *)self heartbeatRef] == a3
      && [(WatchedServiceInfo *)self theirPID] == a4;
}

- (unint64_t)heartbeatRef
{
  return self->_heartbeatRef;
}

- (void)setHeartbeatRef:(unint64_t)a3
{
  self->_heartbeatRef = a3;
}

- (double)serviceStartTime
{
  return self->_serviceStartTime;
}

- (void)setServiceStartTime:(double)a3
{
  self->_serviceStartTime = a3;
}

- (NSUUID)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (void)setServiceInstanceID:(id)a3
{
}

- (int)ourFD
{
  return self->_ourFD;
}

- (void)setOurFD:(int)a3
{
  self->_int ourFD = a3;
}

- (int)theirPID
{
  return self->_theirPID;
}

- (void)setTheirPID:(int)a3
{
  self->_theirPID = a3;
}

- (NSString)hostID
{
  return self->_hostID;
}

- (void)setHostID:(id)a3
{
}

- (NSString)hostClient
{
  return self->_hostClient;
}

- (void)setHostClient:(id)a3
{
}

- (NSString)peerName
{
  return self->_peerName;
}

- (void)setPeerName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)descriptionOverride
{
  return self->_descriptionOverride;
}

- (void)setDescriptionOverride:(id)a3
{
}

- (OS_dispatch_source)procExitSource
{
  return self->_procExitSource;
}

- (void)setProcExitSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procExitSource, 0);
  objc_storeStrong((id *)&self->_descriptionOverride, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_hostClient, 0);
  objc_storeStrong((id *)&self->_hostID, 0);

  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
}

@end