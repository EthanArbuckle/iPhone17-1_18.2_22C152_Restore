@interface MIConnection
+ (void)createConnectionWithXPCObject:(id)a3 withSelector:(SEL)a4 onTarget:(id)a5;
- (MIConnection)initWithType:(unint64_t)a3;
- (MIConnectionDelegate)delegate;
- (unint64_t)type;
- (void)setDelegate:(id)a3;
@end

@implementation MIConnection

- (MIConnection)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIConnection;
  result = [(MIConnection *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (void)createConnectionWithXPCObject:(id)a3 withSelector:(SEL)a4 onTarget:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100002B4C;
  v24 = sub_100002B5C;
  id v9 = v7;
  id v25 = v9;
  id v10 = [v8 methodForSelector:a4];
  v11 = (_xpc_connection_s *)v21[5];
  id v12 = &_dispatch_main_q;
  xpc_connection_set_target_queue(v11, (dispatch_queue_t)&_dispatch_main_q);

  v13 = (_xpc_connection_s *)v21[5];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002B64;
  v15[3] = &unk_1000042D0;
  id v18 = v10;
  id v14 = v8;
  SEL v19 = a4;
  id v16 = v14;
  v17 = &v20;
  xpc_connection_set_event_handler(v13, v15);
  xpc_connection_resume((xpc_connection_t)v21[5]);

  _Block_object_dispose(&v20, 8);
}

- (MIConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MIConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end