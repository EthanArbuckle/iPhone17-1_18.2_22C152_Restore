@interface BTVCBonjourEndpoint
+ (id)createConnectionParameters;
- (BOOL)initiatedConnection;
- (BOOL)isAdvToBrowserConnection;
- (BOOL)isConnected;
- (BTVCBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6;
- (NSMutableSet)remoteAdvDataSet;
- (NSString)localUniqueIDString;
- (NSString)remoteUniqueIDString;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (OS_nw_endpoint)remoteEndpoint;
- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4;
- (id)didConnectHandler;
- (id)didDisconnectHandler;
- (id)didReceiveDataHandler;
- (void)_handleUUIDHeaders;
- (void)_startConnection;
- (void)cancel;
- (void)receiveNextMessage;
- (void)sendDataMessage:(id)a3 completion:(id)a4;
- (void)setDidConnectHandler:(id)a3;
- (void)setDidDisconnectHandler:(id)a3;
- (void)setDidReceiveDataHandler:(id)a3;
- (void)setInitiatedConnection:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLocalUniqueIDString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteAdvDataSet:(id)a3;
- (void)setRemoteUniqueIDString:(id)a3;
@end

@implementation BTVCBonjourEndpoint

- (BTVCBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BTVCBonjourEndpoint;
  v14 = [(BTVCBonjourEndpoint *)&v25 init];
  v15 = v14;
  if (v14)
  {
    if (v12 && v11 && v13)
    {
      objc_storeStrong((id *)&v14->_queue, a6);
      objc_storeStrong((id *)&v15->_connection, a3);
      nw_endpoint_t v16 = nw_connection_copy_endpoint((nw_connection_t)v15->_connection);
      remoteEndpoint = v15->_remoteEndpoint;
      v15->_remoteEndpoint = (OS_nw_endpoint *)v16;

      if (v15->_remoteEndpoint)
      {
        v15->_isAdvToBrowserConnection = a4;
        objc_storeStrong((id *)&v15->_localUniqueIDString, a5);
        [(BTVCBonjourEndpoint *)v15 _startConnection];
        if (!v15->_isAdvToBrowserConnection)
        {
          v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          remoteAdvDataSet = v15->_remoteAdvDataSet;
          v15->_remoteAdvDataSet = v18;
        }
        goto LABEL_8;
      }
      v21 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid remoteEndpoint ";
        goto LABEL_13;
      }
    }
    else
    {
      v21 = qword_100A19FE8;
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid arguments to BTVCBonjourEndpoint";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
      }
    }
    v20 = 0;
    goto LABEL_15;
  }
LABEL_8:
  v20 = v15;
LABEL_15:

  return v20;
}

- (void)_startConnection
{
  v3 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[BTVCBonjourEndpoint] Started connecting to %@", (uint8_t *)&buf, 0xCu);
  }
  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_queue);
  id location = 0;
  objc_initWeak(&location, self);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  nw_endpoint_t v16 = sub_10004D088;
  v17 = sub_10004CE18;
  id v18 = 0;
  v5 = self->_connection;
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1004F63E0;
  v9 = &unk_1009B2828;
  objc_copyWeak(&v12, &location);
  v10 = self;
  p_long long buf = &buf;
  nw_connection_set_state_changed_handler(v5, &v6);
  [(BTVCBonjourEndpoint *)self _handleUUIDHeaders];
  nw_connection_start((nw_connection_t)self->_connection);
  objc_destroyWeak(&v12);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    nw_endpoint_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_10004D088;
    v19 = sub_10004CE18;
    id v20 = 0;
    v8 = nw_protocol_copy_ws_definition();
    v9 = nw_connection_copy_protocol_metadata(v6, v8);

    v10 = nw_ws_metadata_copy_server_response(v9);
    id v11 = v10;
    if (v10)
    {
      enumerator[0] = _NSConcreteStackBlock;
      enumerator[1] = 3221225472;
      enumerator[2] = sub_1004F6A64;
      enumerator[3] = &unk_1009B2850;
      enumerator[4] = &v15;
      nw_ws_response_enumerate_additional_headers(v10, enumerator);
    }
    id v12 = (void *)v16[5];
    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR)) {
        sub_100773C44();
      }
      id v12 = (void *)v16[5];
    }
    id v7 = v12;

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

- (void)_handleUUIDHeaders
{
  v3 = nw_connection_copy_parameters((nw_connection_t)self->_connection);
  v4 = nw_parameters_copy_default_protocol_stack(v3);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10004D088;
  nw_endpoint_t v16 = sub_10004CE18;
  id v17 = 0;
  iterate_block[0] = _NSConcreteStackBlock;
  iterate_block[1] = 3221225472;
  iterate_block[2] = sub_1004F6CF8;
  iterate_block[3] = &unk_1009B2878;
  iterate_block[4] = &v12;
  nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
  v5 = v13[5];
  if (v5)
  {
    if (self->_isAdvToBrowserConnection)
    {
      id location = 0;
      objc_initWeak(&location, self);
      v6 = v13[5];
      queue = self->_queue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1004F6DC0;
      handler[3] = &unk_1009B28C8;
      objc_copyWeak(&v9, &location);
      nw_ws_options_set_client_request_handler(v6, queue, handler);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      nw_ws_options_add_additional_header(v5, "BTVCBonjourEndpointClientUUIDHeader", [(NSString *)self->_localUniqueIDString UTF8String]);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR))
  {
    sub_100773C78();
  }
  _Block_object_dispose(&v12, 8);
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR))
  {
    sub_100773CAC();
  }
}

- (void)receiveNextMessage
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    id location = 0;
    objc_initWeak(&location, self);
    connection = self->_connection;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1004F70BC;
    v4[3] = &unk_1009B28F0;
    objc_copyWeak(&v5, &location);
    nw_connection_receive_message(connection, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_ERROR))
  {
    sub_100773CE0();
  }
}

- (void)sendDataMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    id v8 = v6;
    id v9 = dispatch_data_create([v8 bytes], (size_t)[v8 length], 0, 0);
    metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
    id v11 = nw_content_context_create("send");
    nw_content_context_set_metadata_for_protocol(v11, metadata);
    connection = self->_connection;
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472;
    completion[2] = sub_1004F752C;
    completion[3] = &unk_1009B2918;
    id v15 = v8;
    id v16 = v7;
    nw_connection_send(connection, v9, v11, 1, completion);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Unable to send message, nil connection";
    id v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6700 userInfo:v13];

    (*((void (**)(id, NSObject *))v7 + 2))(v7, v9);
    goto LABEL_5;
  }
LABEL_6:
}

+ (id)createConnectionParameters
{
  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, &stru_1009B2958);
  v3 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  options = nw_ws_create_options(nw_ws_version_13);
  nw_ws_options_set_auto_reply_ping(options, 1);
  nw_protocol_stack_prepend_application_protocol(v3, options);
  id v5 = nw_interface_create_with_name();
  nw_parameters_require_interface(secure_tcp, v5);

  id v6 = nw_interface_create_with_name();
  nw_parameters_prohibit_interface(secure_tcp, v6);

  return secure_tcp;
}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
}

- (id)didDisconnectHandler
{
  return self->_didDisconnectHandler;
}

- (void)setDidDisconnectHandler:(id)a3
{
}

- (id)didReceiveDataHandler
{
  return self->_didReceiveDataHandler;
}

- (void)setDidReceiveDataHandler:(id)a3
{
}

- (OS_nw_endpoint)remoteEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 40, 1);
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isAdvToBrowserConnection
{
  return self->_isAdvToBrowserConnection;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)localUniqueIDString
{
  return self->_localUniqueIDString;
}

- (void)setLocalUniqueIDString:(id)a3
{
}

- (NSString)remoteUniqueIDString
{
  return self->_remoteUniqueIDString;
}

- (void)setRemoteUniqueIDString:(id)a3
{
}

- (NSMutableSet)remoteAdvDataSet
{
  return self->_remoteAdvDataSet;
}

- (void)setRemoteAdvDataSet:(id)a3
{
}

- (BOOL)initiatedConnection
{
  return self->_initiatedConnection;
}

- (void)setInitiatedConnection:(BOOL)a3
{
  self->_initiatedConnection = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteAdvDataSet, 0);
  objc_storeStrong((id *)&self->_remoteUniqueIDString, 0);
  objc_storeStrong((id *)&self->_localUniqueIDString, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong(&self->_didReceiveDataHandler, 0);
  objc_storeStrong(&self->_didDisconnectHandler, 0);

  objc_storeStrong(&self->_didConnectHandler, 0);
}

@end