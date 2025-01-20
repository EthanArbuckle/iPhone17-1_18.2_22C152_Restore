@interface RSDRemoteDevice
+ (id)tlsOidsRequiredOfPeer;
- (BOOL)connectable;
- (BOOL)isHost;
- (BOOL)isTrusted;
- (BOOL)negotiateTls;
- (BOOL)tlsEnabled;
- (NSMutableArray)heartbeat_requests;
- (NSMutableSet)device_peers;
- (NSMutableSet)service_listeners;
- (NSMutableSet)services;
- (NSSet)tlsOidsPopulatedOnPeer;
- (OS_xpc_object)device_listener;
- (OS_xpc_object)properties;
- (OS_xpc_object)public_properties;
- (OS_xpc_remote_connection)connection;
- (RSDRemoteDevice)initWithName:(char *)a3;
- (char)device_alias;
- (char)uuid;
- (const)device_name;
- (const)heartbeat_stats;
- (const)local_address;
- (const)remote_address;
- (const)uuidString;
- (id)copyClientDescriptionWithSensitiveProperties:(BOOL)a3;
- (id)description;
- (id)handleReset:(id)a3;
- (id)serviceWithName:(const char *)a3;
- (int)connectToService:(char *)a3 withTcpOption:(id *)a4;
- (int)interface_index;
- (int)latestConnectError;
- (int)listenForService:(char *)a3 port:(char *)a4;
- (unint64_t)device_id;
- (unint64_t)heartbeat_sequence_number;
- (unint64_t)messaging_protocol_version;
- (unint64_t)tlsRequirement;
- (unsigned)state;
- (unsigned)type;
- (void)_resetNow;
- (void)attach;
- (void)connect:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)drainPendedRequests;
- (void)fetchDeviceAlias;
- (void)goodByeWithCallback:(id)a3;
- (void)handleResetGoAhead;
- (void)handshakeCompleted:(unint64_t)a3;
- (void)heartbeatWithCallback:(id)a3;
- (void)invokeWhenConnectable:(id)a3;
- (void)listenForService:(id)a3;
- (void)needsConnect;
- (void)pollConnect:(int)a3 onQueue:(id)a4 withLog:(id)a5 completion:(id)a6;
- (void)refreshServiceListeners;
- (void)reset;
- (void)setBackendProperty:(const char *)a3 withBool:(BOOL)a4;
- (void)setBackendProperty:(const char *)a3 withString:(const char *)a4;
- (void)setBackendProperty:(const char *)a3 withUint:(unint64_t)a4;
- (void)setConnection:(id)a3;
- (void)setDevice_alias:(char *)a3;
- (void)setDevice_id:(unint64_t)a3;
- (void)setDevice_listener:(id)a3;
- (void)setDevice_peers:(id)a3;
- (void)setHeartbeat_requests:(id)a3;
- (void)setHeartbeat_sequence_number:(unint64_t)a3;
- (void)setLatestConnectError:(int)a3;
- (void)setMessaging_protocol_version:(unint64_t)a3;
- (void)setProperties:(id)a3;
- (void)setPublic_properties:(id)a3;
- (void)setService_listeners:(id)a3;
- (void)setServices:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setTlsEnabled:(BOOL)a3;
- (void)setUuid:(char *)a3;
- (void)timesyncWithCallback:(id)a3;
- (void)triggerNeedsConnect;
@end

@implementation RSDRemoteDevice

- (unsigned)state
{
  return self->_state;
}

- (OS_xpc_remote_connection)connection
{
  return self->_connection;
}

- (unint64_t)messaging_protocol_version
{
  return self->_messaging_protocol_version;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%s", self->_device_name];
}

- (RSDRemoteDevice)initWithName:(char *)a3
{
  v4 = [(RSDRemoteDevice *)self init];
  v5 = v4;
  if (v4)
  {
    ++qword_10005B610;
    -[RSDRemoteDevice setDevice_id:](v4, "setDevice_id:");
    [(RSDRemoteDevice *)v5 setHeartbeat_sequence_number:1];
    id v6 = objc_alloc_init((Class)NSMutableSet);
    [(RSDRemoteDevice *)v5 setDevice_peers:v6];

    id v7 = objc_alloc_init((Class)NSMutableArray);
    [(RSDRemoteDevice *)v5 setHeartbeat_requests:v7];

    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    [(RSDRemoteDevice *)v5 setProperties:v8];

    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    [(RSDRemoteDevice *)v5 setPublic_properties:v9];

    [(RSDRemoteDevice *)v5 setLatestConnectError:0xFFFFFFFFLL];
    [(RSDRemoteDevice *)v5 setTlsEnabled:0];
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pended_requests = v5->_pended_requests;
    v5->_pended_requests = v10;

    v5->_device_name = strdup(a3);
    uint64_t v12 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v12;

    *(_WORD *)&v5->_requested_tls = 0;
    v14 = v5;
  }

  return v5;
}

- (unint64_t)tlsRequirement
{
  return 1;
}

+ (id)tlsOidsRequiredOfPeer
{
  return +[NSSet setWithArray:&off_100056F10];
}

- (BOOL)isHost
{
  connection = self->_connection;
  if (connection) {
    LOBYTE(connection) = _xpc_remote_connection_is_server(connection, a2);
  }
  return (char)connection;
}

- (void)setUuid:(char *)a3
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uuid = (char *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    self->_uuid = uuid;
    if (!uuid) {
      sub_100033A5C(&v7, v8);
    }
  }
  uuid_copy((unsigned __int8 *)uuid, (const unsigned __int8 *)a3);
  id v6 = self->_uuid;

  uuid_unparse((const unsigned __int8 *)v6, self->_uuidString);
}

- (const)uuidString
{
  return self->_uuidString;
}

- (BOOL)isTrusted
{
  [(RSDRemoteDevice *)self type];

  return remote_device_type_is_trusted();
}

- (const)heartbeat_stats
{
  return &self->_heartbeat_stats;
}

- (void)dealloc
{
  free(self->_uuid);
  free(self->_device_name);
  free(self->_device_alias);
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDevice;
  [(RSDRemoteDevice *)&v3 dealloc];
}

- (id)serviceWithName:(const char *)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(RSDRemoteDevice *)self services];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_object_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!strcmp((const char *)[v9 name], a3))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)type
{
  unsigned int result = _os_crash();
  __break(1u);
  return result;
}

- (const)remote_address
{
  unsigned int result = (const in6_addr *)_os_crash();
  __break(1u);
  return result;
}

- (const)local_address
{
  unsigned int result = (const in6_addr *)_os_crash();
  __break(1u);
  return result;
}

- (int)interface_index
{
  int result = _os_crash();
  __break(1u);
  return result;
}

- (void)needsConnect
{
}

- (void)pollConnect:(int)a3 onQueue:(id)a4 withLog:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  remote_socket_poll_connect_async();
}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v13 = -1;
  unsigned __int16 v12 = 0;
  int v7 = sub_10001F504(&v13, (__n128 *)[(RSDRemoteDevice *)self local_address], &v12, [(RSDRemoteDevice *)self interface_index], (uint64_t)&unk_100044D94);
  if (v7)
  {
    int v8 = v7;
    xpc_object_t v9 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      __int16 v17 = 2080;
      v18 = a3;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start listener for \"%s\": %{errno}d", buf, 0x1Cu);
    }
    return -1;
  }
  else
  {
    if (asprintf(a4, "%d", v12) < 0) {
      sub_100033AC8(&v14, buf);
    }
    v11 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      __int16 v17 = 2080;
      v18 = a3;
      __int16 v19 = 1024;
      int v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@> listenForService \"%s\" returning port %d", buf, 0x1Cu);
    }
    return v13;
  }
}

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  int v12 = -1;
  unsigned __int16 v6 = atoi(a3);
  int v7 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@> Attempting to connect to service on port %d", buf, 0x12u);
  }
  int v8 = sub_10001EFB0(&v12, (__n128 *)[(RSDRemoteDevice *)self remote_address], v6, [(RSDRemoteDevice *)self interface_index], (uint64_t)a4);
  if (!v8) {
    return v12;
  }
  int v9 = v8;
  id v10 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = self;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@> Unable to open socket to service on port %d: %{darwin.errno}d", buf, 0x18u);
  }
  return -1;
}

- (BOOL)connectable
{
  return [(RSDRemoteDevice *)self state] == 3 && !self->_resetting && !self->_being_reset;
}

- (void)attach
{
  if (![(RSDRemoteDevice *)self type]) {
    sub_100033B50(&v11, buf);
  }
  id v3 = objc_alloc_init((Class)NSMutableSet);
  [(RSDRemoteDevice *)self setService_listeners:v3];

  id v4 = objc_alloc_init((Class)NSMutableSet);
  [(RSDRemoteDevice *)self setServices:v4];

  [(id)qword_10005BCE8 addObject:self];
  id v5 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Attached", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int16 v6 = [(RSDRemoteDevice *)self properties];
    int v7 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG)) {
      sub_100033C2C((uint64_t)self);
    }
    free(v7);
    int v8 = [(RSDRemoteDevice *)self public_properties];
    int v9 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG)) {
      sub_100033BBC((uint64_t)self);
    }
    free(v9);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000084F4;
  v10[3] = &unk_1000550D0;
  v10[4] = self;
  dispatch_async((dispatch_queue_t)qword_10005BCF0, v10);
  sub_1000231BC(self);
}

- (NSSet)tlsOidsPopulatedOnPeer
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = [(RSDRemoteDevice *)self properties];
  id v5 = xpc_dictionary_get_array(v4, "EncryptedRemoteXPCPopulatedOIDs");

  if (v5)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_1000085F0;
    applier[3] = &unk_100055080;
    id v9 = v3;
    xpc_array_apply(v5, applier);
  }
  id v6 = [v3 copy];

  return (NSSet *)v6;
}

- (void)triggerNeedsConnect
{
  if ([(RSDRemoteDevice *)self state] == 5)
  {
    id v3 = qword_10005C018;
    if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v5 = 138543362;
    id v6 = self;
    id v4 = "%{public}@> Device gone, not attempting reconnect";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v5, 0xCu);
    return;
  }
  if ([(RSDRemoteDevice *)self state] == 3)
  {
    id v3 = qword_10005C018;
    if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v5 = 138543362;
    id v6 = self;
    id v4 = "%{public}@> Already connected, not triggering needsConnect";
    goto LABEL_7;
  }

  [(RSDRemoteDevice *)self needsConnect];
}

- (BOOL)negotiateTls
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if ([(RSDRemoteDevice *)self state] == 2)
  {
    id v4 = sub_10001AB48();

    if (v4)
    {
      if ([(RSDRemoteDevice *)self messaging_protocol_version] > 5)
      {
        if ((id)[(RSDRemoteDevice *)self tlsRequirement] != (id)1)
        {
          int v13 = [(id)objc_opt_class() tlsOidsRequiredOfPeer];
          id v9 = +[NSMutableSet setWithSet:v13];

          uint64_t v14 = [(RSDRemoteDevice *)self tlsOidsPopulatedOnPeer];
          [v9 minusSet:v14];

          if ([v9 count])
          {
            if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
              sub_100033D04();
            }
            BOOL v8 = 0;
          }
          else
          {
            BOOL v8 = 1;
          }
          goto LABEL_12;
        }
        int v12 = qword_10005C018;
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
        {
          int v15 = 138543362;
          int v16 = self;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@> TLS is disabled for this backend.", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        int v5 = (void *)qword_10005C018;
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
        {
          id v6 = v5;
          int v15 = 138543874;
          int v16 = self;
          __int16 v17 = 2048;
          unint64_t v18 = [(RSDRemoteDevice *)self messaging_protocol_version];
          __int16 v19 = 1024;
          int v20 = 6;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@> Peer protocol version too low for TLS (%llu < %d).", (uint8_t *)&v15, 0x1Cu);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
    {
      sub_100033C9C();
    }
    BOOL v8 = 0;
    id v9 = 0;
LABEL_12:
    xpc_dictionary_set_string(v3, "MessageType", "StartTls");
    xpc_dictionary_set_BOOL(v3, "YesNo", v8);
    xpc_dictionary_set_uint64(v3, "TlsPolicy", [(RSDRemoteDevice *)self tlsRequirement]);
    id v10 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_send_message();

    goto LABEL_13;
  }
  int v7 = (void *)qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
    sub_100033D6C(self, v7);
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (void)handshakeCompleted:(unint64_t)a3
{
  unint64_t v5 = [(RSDRemoteDevice *)self tlsRequirement];
  if ((a3 == 3 || v5 == 3) && !self->_enable_tls)
  {
    int v7 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> TLS is required by self and/or peer and was not enabled. Connect failed.", (uint8_t *)&v10, 0xCu);
    }
    [(RSDRemoteDevice *)self setState:1];
    BOOL v8 = [(RSDRemoteDevice *)self connection];

    if (v8)
    {
      id v9 = [(RSDRemoteDevice *)self connection];
      xpc_remote_connection_cancel();

      [(RSDRemoteDevice *)self setConnection:0];
    }
  }
  else
  {
    id v6 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> Handshake complete.", (uint8_t *)&v10, 0xCu);
    }
    [(RSDRemoteDevice *)self setState:3];
    [(RSDRemoteDevice *)self connected];
    [(RSDRemoteDevice *)self fetchDeviceAlias];
    sub_1000232BC(self);
    [(RSDRemoteDevice *)self drainPendedRequests];
  }
}

- (id)handleReset:(id)a3
{
  id v4 = a3;
  if (xpc_dictionary_expects_reply())
  {
    self->_being_reset = 1;
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Result", "Ok");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100033E14();
    }
    xpc_object_t reply = 0;
  }

  return reply;
}

- (void)handleResetGoAhead
{
  xpc_object_t v3 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got reset goahead. Cancel this connection and proceed to reset", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [(RSDRemoteDevice *)self connection];

  if (v4)
  {
    unint64_t v5 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_cancel();

    [(RSDRemoteDevice *)self setConnection:0];
  }
}

- (void)connect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RSDRemoteDevice *)self state];
  if (v4)
  {
    if (v5 == 5)
    {
      int v6 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v78 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@> Device already gone, giving up the connection", buf, 0xCu);
      }
      xpc_remote_connection_cancel();
    }
    else
    {
      BOOL v8 = [(RSDRemoteDevice *)self connection];

      if (v8) {
        sub_100033E98(&v72, buf);
      }
      [(RSDRemoteDevice *)self setConnection:v4];
      if (![(RSDRemoteDevice *)self state]) {
        self->_being_reset = 0;
      }
      [(RSDRemoteDevice *)self setState:1];
      if (self->_enable_tls)
      {
        id v9 = sub_10001AB48();
        if (!v9) {
          sub_100033E7C();
        }
        int v10 = v9;
        uint64_t v11 = qword_10005C018;
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v78 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> Applying TLS to RemoteXPC connection.", buf, 0xCu);
        }
        int v12 = [(RSDRemoteDevice *)self connection];
        v67 = _NSConcreteStackBlock;
        uint64_t v68 = 3221225472;
        v69 = sub_10000954C;
        v70 = &unk_100055120;
        v71 = self;
        xpc_remote_connection_set_tls();

        BOOL enable_tls = self->_enable_tls;
      }
      else
      {
        BOOL enable_tls = 0;
      }
      [(RSDRemoteDevice *)self setTlsEnabled:enable_tls];
      [(RSDRemoteDevice *)self refreshServiceListeners];
      xpc_remote_connection_set_target_queue();
      v61 = _NSConcreteStackBlock;
      uint64_t v62 = 3221225472;
      v63 = sub_100001E60;
      v64 = &unk_100055170;
      v65 = self;
      id v45 = v4;
      id v66 = v4;
      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v15, "MessageType", "Handshake");
      xpc_dictionary_set_uint64(v15, "MessagingProtocolVersion", 6uLL);
      xpc_dictionary_set_uuid(v15, "UUID", (const unsigned __int8 *)&xmmword_10005C020);
      xpc_object_t v44 = v15;
      xpc_dictionary_set_value(v15, "Properties", (xpc_object_t)qword_10005C030);
      xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = (id)qword_10005C038;
      id v16 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
      v48 = self;
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v58;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v58 != v18) {
              objc_enumerationMutation(obj);
            }
            int v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            v21 = [(RSDRemoteDevice *)self service_listeners];
            id v22 = [v21 countByEnumeratingWithState:&v53 objects:v75 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v54;
LABEL_28:
              uint64_t v25 = 0;
              while (1)
              {
                if (*(void *)v54 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v53 + 1) + 8 * v25);
                v27 = [v26 service];

                if (v27 == v20) {
                  break;
                }
                if (v23 == (id)++v25)
                {
                  id v23 = [v21 countByEnumeratingWithState:&v53 objects:v75 count:16];
                  if (v23) {
                    goto LABEL_28;
                  }
                  goto LABEL_34;
                }
              }
              id v28 = v26;

              if (!v28) {
                goto LABEL_37;
              }
              v29 = (const char *)[v20 name];
              id v30 = [v28 copyServiceDescription];
              xpc_dictionary_set_value(xdict, v29, v30);

              self = v48;
            }
            else
            {
LABEL_34:

LABEL_37:
              v31 = (void *)qword_10005C018;
              self = v48;
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
              {
                v32 = v31;
                id v33 = [v20 name];
                *(_DWORD *)buf = 138543618;
                v78 = v48;
                __int16 v79 = 2080;
                id v80 = v33;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@> No listener for \"%s\"", buf, 0x16u);
              }
            }
          }
          id v17 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
        }
        while (v17);
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v34 = (id)qword_10005C040;
      id v35 = [v34 countByEnumeratingWithState:&v49 objects:v74 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v50;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v50 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
            v40 = (const char *)[v39 name];
            id v41 = [v39 copyServiceDescription];
            xpc_dictionary_set_value(xdict, v40, v41);
          }
          id v36 = [v34 countByEnumeratingWithState:&v49 objects:v74 count:16];
        }
        while (v36);
      }

      xpc_dictionary_set_value(v44, "Services", xdict);
      xpc_remote_connection_send_message();
      v42 = (void *)xpc_copy_clean_description();
      v43 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v78 = v48;
        __int16 v79 = 2080;
        id v80 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%{public}@> Sending handshake message: %s", buf, 0x16u);
      }
      free(v42);

      id v4 = v45;
    }
  }
  else
  {
    int v7 = qword_10005C018;
    if (v5 == 5)
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v78 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@> Device connection failed, device already gone, giving up", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v78 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection failed", buf, 0xCu);
      }
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009544;
      block[3] = &unk_1000550D0;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)qword_10005BCF0, block);
    }
  }
}

- (void)heartbeatWithCallback:(id)a3
{
  id v4 = a3;
  if ([(RSDRemoteDevice *)self state] == 3
    && ([(RSDRemoteDevice *)self connection],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ([(RSDRemoteDevice *)self messaging_protocol_version])
    {
      uint64_t v6 = [(RSDRemoteDevice *)self heartbeat_sequence_number];
      [(RSDRemoteDevice *)self setHeartbeat_sequence_number:(char *)[(RSDRemoteDevice *)self heartbeat_sequence_number] + 1];
      int v7 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v19 = self;
        __int16 v20 = 2048;
        uint64_t v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Sending heartbeat request %llu", buf, 0x16u);
      }
      self->_heartbeat_stats.times.outstanding_start = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      ++self->_heartbeat_stats.counts.sent;
      xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v8, "MessageType", "Heartbeat");
      xpc_dictionary_set_uint64(v8, "SequenceNumber", v6);
      id v9 = [(RSDRemoteDevice *)self connection];
      id v13 = v4;
      xpc_remote_connection_send_message_with_reply();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        sub_1000345D0();
      }
      int v12 = qword_10005BCF0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100009C18;
      v14[3] = &unk_100055198;
      id v15 = v4;
      dispatch_async(v12, v14);
      xpc_object_t v8 = v15;
    }
  }
  else
  {
    int v10 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@> Heartbeat failed: not connected", buf, 0xCu);
    }
    uint64_t v11 = qword_10005BCF0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009C04;
    block[3] = &unk_100055198;
    id v17 = v4;
    dispatch_async(v11, block);
    xpc_object_t v8 = v17;
  }
}

- (void)timesyncWithCallback:(id)a3
{
  id v4 = a3;
  if ([(RSDRemoteDevice *)self state] == 3
    && ([(RSDRemoteDevice *)self connection],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    unint64_t v6 = [(RSDRemoteDevice *)self messaging_protocol_version];
    int v7 = qword_10005C018;
    if (v6 > 2)
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        dispatch_time_t v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> sending timesync request", buf, 0xCu);
      }
      unint64_t v8 = sub_10000F0AC();
      id v9 = sub_10000F138(v8, (void *)qword_10005C018);
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Timesync");
      xpc_dictionary_set_value(empty, "TimesyncPayload", v9);
      uint64_t v11 = [(RSDRemoteDevice *)self connection];
      id v12 = v4;
      xpc_remote_connection_send_message_with_reply();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        sub_10003473C();
      }
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 43);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000346D4();
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 57);
  }
}

- (void)goodByeWithCallback:(id)a3
{
  id v4 = a3;
  if ([(RSDRemoteDevice *)self type] == 14)
  {
    if ([(RSDRemoteDevice *)self state] == 3
      && ([(RSDRemoteDevice *)self connection],
          unsigned int v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Goodbye");
      int v7 = [(RSDRemoteDevice *)self connection];
      id v8 = v4;
      xpc_remote_connection_send_message_with_reply();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        sub_10003487C();
      }
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 57);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000348E4();
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 43);
  }
}

- (void)disconnect
{
  [(RSDRemoteDevice *)self setState:5];
  xpc_object_t v3 = [(RSDRemoteDevice *)self connection];

  if (v3)
  {
    id v4 = [(RSDRemoteDevice *)self connection];
    xpc_remote_connection_cancel();

    [(RSDRemoteDevice *)self setConnection:0];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned int v5 = [(RSDRemoteDevice *)self service_listeners];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) cancel];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v10 = [(RSDRemoteDevice *)self services];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      dispatch_time_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) cancel];
        dispatch_time_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(RSDRemoteDevice *)self setService_listeners:0];
  [(RSDRemoteDevice *)self setServices:0];
  [(RSDRemoteDevice *)self drainPendedRequests];
  sub_100023430(self);
  [(id)qword_10005BCE8 removeObject:self];
}

- (void)reset
{
  if ([(RSDRemoteDevice *)self state] == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_10003494C();
    }
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000A6E0;
    v3[3] = &unk_1000550D0;
    v3[4] = self;
    [(RSDRemoteDevice *)self invokeWhenConnectable:v3];
  }
}

- (void)refreshServiceListeners
{
  if ((id)[(RSDRemoteDevice *)self tlsRequirement] == (id)3
    && ![(RSDRemoteDevice *)self tlsEnabled])
  {
    long long v19 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@> TLS required and not yet enabled. Postpone listening for services.", buf, 0xCu);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v20 = [(RSDRemoteDevice *)self service_listeners];
    id v21 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * i) cancel];
        }
        id v22 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v22);
    }

    id obj = [(RSDRemoteDevice *)self service_listeners];
    [obj removeAllObjects];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)qword_10005C038;
    id v3 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v27 = *(void *)v33;
      *(void *)&long long v4 = 138543618;
      long long v25 = v4;
      do
      {
        for (j = 0; j != v5; j = (char *)j + 1)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v8 = [(RSDRemoteDevice *)self service_listeners];
          id v9 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v29;
LABEL_10:
            uint64_t v12 = 0;
            while (1)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
              dispatch_time_t v14 = [v13 service];

              if (v14 == v7) {
                break;
              }
              if (v10 == (id)++v12)
              {
                id v10 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
                if (v10) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }
            id v15 = v13;

            if (v15) {
              goto LABEL_21;
            }
          }
          else
          {
LABEL_16:
          }
          long long v16 = (void *)qword_10005C018;
          if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
          {
            long long v17 = v16;
            id v18 = [v7 name];
            *(_DWORD *)buf = v25;
            id v41 = self;
            __int16 v42 = 2080;
            id v43 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@> Trying to listen for new service \"%s\"", buf, 0x16u);
          }
          [(RSDRemoteDevice *)self listenForService:v7];
          id v15 = 0;
LABEL_21:
        }
        id v5 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v5);
    }
  }
}

- (void)_resetNow
{
  if ([(RSDRemoteDevice *)self state] == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_10003494C();
    }
  }
  else
  {
    unint64_t v3 = [(RSDRemoteDevice *)self messaging_protocol_version];
    long long v4 = qword_10005C018;
    if (v3 > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@> About to reset", buf, 0xCu);
      }
      self->_resetting = 1;
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v5, "MessageType", "Reset");
      id v6 = [(RSDRemoteDevice *)self connection];
      xpc_remote_connection_send_message_with_reply();
    }
    else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
    {
      sub_1000349B4();
    }
  }
}

- (void)drainPendedRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE40;
  block[3] = &unk_1000550D0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10005BCF0, block);
}

- (void)invokeWhenConnectable:(id)a3
{
  id v6 = (void (**)(void))a3;
  if ([(RSDRemoteDevice *)self connectable])
  {
    v6[2]();
  }
  else
  {
    pended_requests = self->_pended_requests;
    xpc_object_t v5 = objc_retainBlock(v6);

    [(NSMutableArray *)pended_requests addObject:v5];
    id v6 = v5;
  }
}

- (void)setBackendProperty:(const char *)a3 withUint:(unint64_t)a4
{
  id v7 = [(RSDRemoteDevice *)self properties];
  xpc_dictionary_set_uint64(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_100055250, &qword_100044DC0, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C560))
  {
    uint64_t v8 = [(RSDRemoteDevice *)self public_properties];
    xpc_dictionary_set_uint64(v8, a3, a4);
  }
}

- (void)setBackendProperty:(const char *)a3 withBool:(BOOL)a4
{
  id v7 = [(RSDRemoteDevice *)self properties];
  xpc_dictionary_set_BOOL(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_100055250, &qword_100044DC0, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C560))
  {
    uint64_t v8 = [(RSDRemoteDevice *)self public_properties];
    xpc_dictionary_set_BOOL(v8, a3, a4);
  }
}

- (void)setBackendProperty:(const char *)a3 withString:(const char *)a4
{
  id v7 = [(RSDRemoteDevice *)self properties];
  xpc_dictionary_set_string(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_100055250, &qword_100044DC0, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C560))
  {
    uint64_t v8 = [(RSDRemoteDevice *)self public_properties];
    xpc_dictionary_set_string(v8, a3, a4);
  }
}

- (void)listenForService:(id)a3
{
  id v4 = a3;
  if ([v4 shouldBeExposedToDevice:self])
  {
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = -[RSDRemoteDevice listenForService:port:](self, "listenForService:port:", [v4 name], &v17);
    if (v5 != -1)
    {
      uint64_t v6 = v5;
      if (fcntl(v5, 4, 4) == -1) {
        sub_100034AB0(&v16, buf);
      }
      id v7 = [RSDLocalServiceListener alloc];
      uint64_t v8 = [(RSDLocalServiceListener *)v7 initWithService:v4 forDevice:self withPort:v17 onSocket:v6];
      id v9 = (void *)qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        id v10 = v9;
        id v11 = [v4 name];
        id v12 = [v8 port];
        *(_DWORD *)buf = 138543874;
        long long v19 = self;
        __int16 v20 = 2080;
        id v21 = v11;
        __int16 v22 = 2080;
        id v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@> Listening for \"%s\" on port %s.", buf, 0x20u);
      }
      uint64_t v13 = [(RSDRemoteDevice *)self service_listeners];
      [v13 addObject:v8];

      goto LABEL_9;
    }
    id v15 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100034A1C((uint64_t)self, v15, v4);
    }
  }
  else
  {
    dispatch_time_t v14 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v14;
      *(_DWORD *)buf = 138543618;
      long long v19 = self;
      __int16 v20 = 2080;
      id v21 = [v4 name];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@> Won't expose \"%s\" to the device", buf, 0x16u);
LABEL_9:
    }
  }
}

- (void)fetchDeviceAlias
{
  if (![(RSDRemoteDevice *)self device_alias])
  {
    unint64_t v3 = [(RSDRemoteDevice *)self properties];
    id v4 = xpc_dictionary_get_value(v3, "UniqueDeviceID");

    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        uint64_t v6 = string_ptr;
        uint64_t v7 = [(id)qword_10005C010 valueForKey:@"device_name_map"];
        if (v7)
        {
          CFDictionaryRef v8 = (const __CFDictionary *)v7;
          CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0x8000100u);
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v8, v9);
          if (Value)
          {
            CFStringRef v11 = Value;
            id v12 = (char *)malloc_type_malloc(0x80uLL, 0x18EC0261uLL);
            if (!v12) {
              sub_100034C04(&v13, v14);
            }
            self->_device_alias = v12;
            CFStringGetCString(v11, v12, 128, 0x8000100u);
          }
          CFRelease(v9);
          CFRelease(v8);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
      {
        sub_100034B9C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
    {
      sub_100034B34();
    }
  }
}

- (void)setDevice_alias:(char *)a3
{
  if (a3)
  {
    uint64_t v5 = [(RSDRemoteDevice *)self properties];
    uint64_t v6 = xpc_dictionary_get_value(v5, "UniqueDeviceID");

    if (v6)
    {
      string_ptr = xpc_string_get_string_ptr(v6);
      if (string_ptr)
      {
        CFDictionaryRef v8 = string_ptr;
        CFDictionaryRef v9 = [(id)qword_10005C010 valueForKey:@"device_name_map"];
        if (!v9 || (Mutable = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v9)) == 0) {
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
        CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, v8, 0x8000100u);
        CFDictionarySetValue(Mutable, v12, v11);
        [(id)qword_10005C010 setValue:Mutable forKey:@"device_name_map"];
        [(id)qword_10005C010 synchronize];
        free(self->_device_alias);
        if (_dispatch_is_multithreaded())
        {
          while (1)
          {
            uint64_t v13 = strdup(a3);
            if (v13) {
              break;
            }
            __os_temporary_resource_shortage();
          }
        }
        else
        {
          uint64_t v13 = strdup(a3);
          if (!v13) {
            sub_100034D44(a3, &v14, v15);
          }
        }
        self->_device_alias = v13;
        CFRelease(v12);
        CFRelease(v11);
        CFRelease(Mutable);
        if (v9) {
          CFRelease(v9);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
      {
        sub_100034B9C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
    {
      sub_100034B34();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
  {
    sub_100034CDC();
  }
}

- (const)device_name
{
  return self->_device_name;
}

- (char)device_alias
{
  return self->_device_alias;
}

- (unint64_t)device_id
{
  return self->_device_id;
}

- (void)setDevice_id:(unint64_t)a3
{
  self->_device_id = a3;
}

- (char)uuid
{
  return self->_uuid;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (void)setConnection:(id)a3
{
}

- (int)latestConnectError
{
  return self->_latestConnectError;
}

- (void)setLatestConnectError:(int)a3
{
  self->_latestConnectError = a3;
}

- (unint64_t)heartbeat_sequence_number
{
  return self->_heartbeat_sequence_number;
}

- (void)setHeartbeat_sequence_number:(unint64_t)a3
{
  self->_heartbeat_sequence_number = a3;
}

- (void)setMessaging_protocol_version:(unint64_t)a3
{
  self->_messaging_protocol_version = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (OS_xpc_object)public_properties
{
  return self->_public_properties;
}

- (void)setPublic_properties:(id)a3
{
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSMutableSet)service_listeners
{
  return self->_service_listeners;
}

- (void)setService_listeners:(id)a3
{
}

- (BOOL)tlsEnabled
{
  return self->_tlsEnabled;
}

- (void)setTlsEnabled:(BOOL)a3
{
  self->_tlsEnabled = a3;
}

- (OS_xpc_object)device_listener
{
  return self->_device_listener;
}

- (void)setDevice_listener:(id)a3
{
}

- (NSMutableSet)device_peers
{
  return self->_device_peers;
}

- (void)setDevice_peers:(id)a3
{
}

- (NSMutableArray)heartbeat_requests
{
  return self->_heartbeat_requests;
}

- (void)setHeartbeat_requests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeat_requests, 0);
  objc_storeStrong((id *)&self->_device_peers, 0);
  objc_storeStrong((id *)&self->_device_listener, 0);
  objc_storeStrong((id *)&self->_service_listeners, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_public_properties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_pended_requests, 0);
}

- (id)copyClientDescriptionWithSensitiveProperties:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "device_type", [(RSDRemoteDevice *)self type]);
  xpc_dictionary_set_uint64(v5, "device_id", [(RSDRemoteDevice *)self device_id]);
  xpc_dictionary_set_string(v5, "device_name", [(RSDRemoteDevice *)self device_name]);
  if ([(RSDRemoteDevice *)self device_alias]) {
    xpc_dictionary_set_string(v5, "device_alias", [(RSDRemoteDevice *)self device_alias]);
  }
  xpc_dictionary_set_uint64(v5, "device_messaging_protocol_version", [(RSDRemoteDevice *)self messaging_protocol_version]);
  xpc_dictionary_set_BOOL(v5, "device_tls_enabled", [(RSDRemoteDevice *)self tlsEnabled]);
  if ([(RSDRemoteDevice *)self uuid]) {
    xpc_dictionary_set_uuid(v5, "UUID", (const unsigned __int8 *)[(RSDRemoteDevice *)self uuid]);
  }
  uint64_t v6 = [(RSDRemoteDevice *)self properties];

  if (v6)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7) {
        sub_10003BD4C();
      }
      CFDictionaryRef v8 = [(RSDRemoteDevice *)self properties];
    }
    else
    {
      if (v7) {
        sub_10003BE20();
      }
      CFDictionaryRef v9 = [(RSDRemoteDevice *)self public_properties];

      if (!v9) {
        sub_10003BDB4(&v21, buf);
      }
      CFDictionaryRef v8 = [(RSDRemoteDevice *)self public_properties];
    }
    id v10 = v8;
    xpc_dictionary_set_value(v5, "properties", v8);
  }
  unsigned int v11 = [(RSDRemoteDevice *)self state] - 3;
  if (v11 > 2) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = qword_100044E40[v11];
  }
  xpc_dictionary_set_uint64(v5, "device_state", v12);
  uint64_t v13 = [(RSDRemoteDevice *)self device_listener];

  if (!v13)
  {
    uint64_t v14 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@> Creating device listener", buf, 0xCu);
    }
    xpc_connection_t v15 = xpc_connection_create(0, (dispatch_queue_t)qword_10005BED8);
    [(RSDRemoteDevice *)self setDevice_listener:v15];

    uint64_t v16 = [(RSDRemoteDevice *)self device_listener];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100021354;
    v20[3] = &unk_100054F08;
    v20[4] = self;
    xpc_connection_set_event_handler(v16, v20);

    unint64_t v17 = [(RSDRemoteDevice *)self device_listener];
    xpc_connection_activate(v17);
  }
  id v18 = [(RSDRemoteDevice *)self device_listener];
  xpc_dictionary_set_connection(v5, "endpoint", v18);

  return v5;
}

@end