@interface APMetricClientConnection
- (APMetricClientConnection)initWithHost:(id)a3 port:(id)a4;
- (NSString)host;
- (NSString)port;
- (OS_nw_connection)clientConnection;
- (id)lineBreakFramer:(id)a3;
- (void)_sendRawData:(id)a3;
- (void)_setupConnection:(id)a3 port:(id)a4;
- (void)send:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setHost:(id)a3;
- (void)setPort:(id)a3;
@end

@implementation APMetricClientConnection

- (APMetricClientConnection)initWithHost:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APMetricClientConnection;
  v8 = [(APMetricClientConnection *)&v11 init];
  v9 = v8;
  if (v8) {
    [(APMetricClientConnection *)v8 _setupConnection:v6 port:v7];
  }

  return v9;
}

- (void)_setupConnection:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v9 = (const char *)[v6 UTF8String];
    v10 = (const char *)[v7 UTF8String];
    secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
    host = nw_endpoint_create_host(v9, v10);
    v13 = nw_connection_create(host, secure_tcp);
    v14 = dispatch_get_global_queue(9, 0);
    nw_connection_set_queue(v13, v14);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10017E5E4;
    handler[3] = &unk_100238978;
    handler[4] = v9;
    nw_connection_set_state_changed_handler(v13, handler);
    nw_connection_start(v13);
    [(APMetricClientConnection *)self setClientConnection:v13];
  }
  else
  {
    secure_tcp = APLogForCategory();
    if (os_log_type_enabled(secure_tcp, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, secure_tcp, OS_LOG_TYPE_ERROR, "hostname or port missing", buf, 2u);
    }
  }
}

- (void)send:(id)a3
{
  id v4 = [(APMetricClientConnection *)self lineBreakFramer:a3];
  [(APMetricClientConnection *)self _sendRawData:v4];
}

- (void)_sendRawData:(id)a3
{
  queue = dispatch_get_global_queue(0, 0);
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  v8 = dispatch_data_create(v6, (size_t)v7, queue, 0);
  v9 = [(APMetricClientConnection *)self clientConnection];
  nw_connection_send(v9, v8, _nw_content_context_default_message, 1, &stru_1002389B8);
}

- (id)lineBreakFramer:(id)a3
{
  if (a3)
  {
    v3 = +[NSMutableData dataWithData:](NSMutableData, "dataWithData:");
    id v4 = +[NSString stringWithFormat:@"\r\n"];
    id v5 = [v4 dataUsingEncoding:4];
    [v3 appendData:v5];

    id v6 = +[NSData dataWithData:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (OS_nw_connection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_clientConnection, 0);
}

@end