@interface _MLNetworking
- (BOOL)isClient;
- (OS_dispatch_queue)q;
- (OS_nw_connection)connection;
- (OS_nw_listener)listener;
- (OS_nw_parameters)parameters;
- (OS_nw_protocol_stack)protocol_stack;
- (OS_os_log)logType;
- (_MLNetworkOptions)nwOptions;
- (id)initConnection:(id)a3;
- (id)initListener:(id)a3;
- (void)receiveLoop:(id)a3;
- (void)sendData:(id)a3;
- (void)setConnection:(id)a3;
- (void)setListenerReceiveDataCallBack:(id)a3;
- (void)setReceiveDataCallBack:(id)a3;
- (void)startConnection;
- (void)stop;
@end

@implementation _MLNetworking

- (id)initConnection:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_MLNetworking;
  v6 = [(_MLNetworking *)&v23 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.remoteCoreMLClientNetwork", 0);
    v8 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v7;

    uint64_t v9 = +[_MLLog clientFramework];
    v10 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v9;

    v11 = (id *)(v6 + 32);
    objc_storeStrong((id *)v6 + 4, a3);
    char v12 = [v5 useBonjour];
    v13 = (const char *)[*((id *)v6 + 4) networkNameIdentifier];
    if (v12)
    {
      if ([v5 useUDP]) {
        v14 = "_nwcat._udp";
      }
      else {
        v14 = "_nwcat._tcp";
      }
      nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service(v13, v14, "local");
    }
    else
    {
      nw_endpoint_t bonjour_service = nw_endpoint_create_host(v13, (const char *)[*v11 port]);
    }
    v16 = bonjour_service;
    uint64_t v17 = +[_MLNetworkUtilities doInitNetwork:*((void *)v6 + 4)];
    v18 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v17;

    if ([*((id *)v6 + 4) localAddr] || objc_msgSend(*v11, "localPort"))
    {
      if ([v5 useBonjour]) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = [v5 networkNameIdentifier];
      }
      +[_MLNetworkUtilities bindEndPoints:localAddr:localPort:](_MLNetworkUtilities, "bindEndPoints:localAddr:localPort:", *((void *)v6 + 6), v19, [v5 port]);
    }
    nw_connection_t v20 = nw_connection_create(v16, *((nw_parameters_t *)v6 + 6));
    v21 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v20;
  }
  return v6;
}

- (id)initListener:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MLNetworking;
  id v6 = [(_MLNetworking *)&v17 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.remoteCoreMLServerNetwork", 0);
    v8 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v7;

    uint64_t v9 = +[_MLLog serverFramework];
    v10 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v9;

    objc_storeStrong((id *)v6 + 4, a3);
    uint64_t v11 = +[_MLNetworkUtilities doInitNetwork:v5];
    char v12 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v11;

    uint64_t v13 = 0;
    if (([v5 useBonjour] & 1) == 0) {
      uint64_t v13 = [v5 networkNameIdentifier];
    }
    +[_MLNetworkUtilities bindEndPoints:localAddr:localPort:](_MLNetworkUtilities, "bindEndPoints:localAddr:localPort:", *((void *)v6 + 6), v13, [v5 port]);
    nw_listener_t v14 = nw_listener_create(*((nw_parameters_t *)v6 + 6));
    v15 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v14;

    +[_MLNetworkUtilities setupBonjour:name:useBonjour:useUDP:](_MLNetworkUtilities, "setupBonjour:name:useBonjour:useUDP:", *((void *)v6 + 3), [v5 networkNameIdentifier], objc_msgSend(v5, "useBonjour"), objc_msgSend(v5, "useUDP"));
    nw_listener_set_queue(*((nw_listener_t *)v6 + 3), MEMORY[0x263EF83A0]);
    +[_MLNetworkUtilities setupListenerStateChangeHandler:useUDP:](_MLNetworkUtilities, "setupListenerStateChangeHandler:useUDP:", *((void *)v6 + 3), [v5 useUDP]);
  }

  return v6;
}

- (void)startConnection
{
  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_q);
  connection = self->_connection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32___MLNetworking_startConnection__block_invoke;
  v5[3] = &unk_264D52F88;
  v5[4] = self;
  v5[5] = a2;
  nw_connection_set_state_changed_handler(connection, v5);
  nw_connection_start((nw_connection_t)self->_connection);
}

- (void)setReceiveDataCallBack:(id)a3
{
  id v4 = a3;
  [(_MLNetworking *)self startConnection];
  [(_MLNetworking *)self receiveLoop:v4];
}

- (void)setListenerReceiveDataCallBack:(id)a3
{
  id v5 = a3;
  listener = self->_listener;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke;
  handler[3] = &unk_264D52FB0;
  id v9 = v5;
  SEL v10 = a2;
  handler[4] = self;
  id v7 = v5;
  nw_listener_set_new_connection_handler(listener, handler);
  nw_listener_start((nw_listener_t)self->_listener);
}

- (void)sendData:(id)a3
{
  id v5 = a3;
  id v6 = (const void *)[v5 bytes];
  size_t v7 = [v5 length];

  v8 = dispatch_data_create(v6, v7, 0, 0);
  connection = self->_connection;
  SEL v10 = *MEMORY[0x263F14440];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __26___MLNetworking_sendData___block_invoke;
  v11[3] = &unk_264D52FD8;
  v11[4] = self;
  v11[5] = a2;
  nw_connection_send(connection, v8, v10, 1, v11);
}

- (void)receiveLoop:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 3221225472;
  completion[2] = __29___MLNetworking_receiveLoop___block_invoke;
  completion[3] = &unk_264D53028;
  id v9 = v5;
  SEL v10 = a2;
  completion[4] = self;
  id v7 = v5;
  nw_connection_receive(connection, 4u, 0xFFFFFFFF, completion);
}

- (void)stop
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (_MLNetworkOptions)nwOptions
{
  return self->_nwOptions;
}

- (OS_nw_protocol_stack)protocol_stack
{
  return self->_protocol_stack;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (BOOL)isClient
{
  return self->_isClient;
}

- (OS_os_log)logType
{
  return self->_logType;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_protocol_stack, 0);
  objc_storeStrong((id *)&self->_nwOptions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end