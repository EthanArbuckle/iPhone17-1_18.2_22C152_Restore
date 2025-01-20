@interface CDRapportListener
- (CDRapportListener)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (void)_activated;
- (void)_handleEvent:(id)a3;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDRapportListener

- (CDRapportListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDRapportListener;
  v2 = [(CDRapportListener *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014CC4;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014D4C;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014E28;
  v4[3] = &unk_100034EF8;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)dispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_handleEvent:(id)a3
{
  xpc_object_t xdict = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  id v5 = xpc_dictionary_get_string(xdict, "deviceID");
  if (string) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id deviceFoundHandler = (void (**)(id, void *, uint64_t))self->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      v8 = v5;
      if (!strcmp(string, "CompanionAuthenticationDiscovery"))
      {
        v9 = +[NSString stringWithUTF8String:v8];
        deviceFoundHandler[2](deviceFoundHandler, v9, 1);
      }
      else
      {
        if (strcmp(string, "LegacyAppSignInDiscovery")) {
          goto LABEL_11;
        }
        v9 = +[NSString stringWithUTF8String:v8];
        deviceFoundHandler[2](deviceFoundHandler, v9, 2);
      }
    }
  }
LABEL_11:
  if (xpc_dictionary_get_BOOL(xdict, "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (reply) {
      xpc_dictionary_send_reply();
    }
  }

  _objc_release_x1();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceFoundHandler, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end