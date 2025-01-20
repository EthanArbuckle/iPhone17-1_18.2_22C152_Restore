@interface SpringBoardAlertProxy
- (OS_xpc_object)XPCEndpoint;
- (SpringBoardAlertProxy)initWithMessage:(id)a3;
- (SpringBoardAlertProxyDelegate)delegate;
- (void)_disconnect;
- (void)_handleMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SpringBoardAlertProxy

- (SpringBoardAlertProxy)initWithMessage:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SpringBoardAlertProxy;
  id v5 = [(SpringBoardAlertProxy *)&v29 init];
  if (v5)
  {
    xpc_dictionary_get_value(v4, "2");
    v6 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_endpoint)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.itunesstored.SpringBoardAlertProxy.delegate", 0);
      v10 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v9;

      dispatch_queue_t v11 = dispatch_queue_create("com.apple.itunesstored.SpringBoardAlertProxy", 0);
      v12 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v11;

      v8 = dispatch_get_global_queue(0, 0);
      dispatch_set_target_queue(*((dispatch_object_t *)v5 + 2), v8);
      dispatch_set_target_queue(*((dispatch_object_t *)v5 + 3), v8);
      xpc_connection_t v13 = xpc_connection_create_from_endpoint(v7);
      id v14 = [objc_alloc((Class)SSXPCConnection) initWithXPCConnection:v13];
      v15 = (void *)*((void *)v5 + 6);
      *((void *)v5 + 6) = v14;

      id v16 = objc_alloc_init((Class)SSXPCConnection);
      v17 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v16;

      id v18 = [*((id *)v5 + 4) createXPCEndpoint];
      v19 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v18;

      objc_initWeak(&location, v5);
      v20 = (void *)*((void *)v5 + 6);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10004C1F8;
      v26[3] = &unk_1003A4248;
      objc_copyWeak(&v27, &location);
      [v20 setDisconnectBlock:v26];
      v21 = (void *)*((void *)v5 + 4);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10004C238;
      v24[3] = &unk_1003A4270;
      objc_copyWeak(&v25, &location);
      [v21 setMessageBlock:v24];
      v22 = (void *)SSXPCCreateMessageDictionary();
      [*((id *)v5 + 6) sendMessage:v22];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
      v8 = v5;
      id v5 = 0;
    }
  }
  return (SpringBoardAlertProxy *)v5;
}

- (void)dealloc
{
  [(SSXPCConnection *)self->_inputConnection setMessageBlock:0];
  [(SSXPCConnection *)self->_outputConnection setDisconnectBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)SpringBoardAlertProxy;
  [(SpringBoardAlertProxy *)&v3 dealloc];
}

- (SpringBoardAlertProxyDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_10004C40C;
  v10 = sub_10004C41C;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004C424;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SpringBoardAlertProxyDelegate *)v3;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C508;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C5AC;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_disconnect
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C62C;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004C7C4;
  v11[3] = &unk_1003A3268;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_queue_t v9 = (_xpc_connection_s *)a4;
  dispatch_async(dispatchQueue, v11);
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  xpc_connection_send_message(v9, reply);
}

- (OS_xpc_object)XPCEndpoint
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputConnection, 0);
  objc_storeStrong((id *)&self->_inputEndpoint, 0);
  objc_storeStrong((id *)&self->_inputConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end