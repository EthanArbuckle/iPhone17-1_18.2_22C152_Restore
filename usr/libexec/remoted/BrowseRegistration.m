@interface BrowseRegistration
- (BOOL)canceled;
- (BrowseRegistration)initWithRequest:(id)a3;
- (OS_xpc_object)connection;
- (unsigned)type;
- (void)cancel;
- (void)deliverDevice:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation BrowseRegistration

- (BrowseRegistration)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(BrowseRegistration *)self init];
  if (v5)
  {
    [(BrowseRegistration *)v5 setType:xpc_dictionary_get_uint64(v4, "device_type")];
    v6 = xpc_dictionary_get_remote_connection(v4);
    [(BrowseRegistration *)v5 setConnection:v6];

    v7 = [(BrowseRegistration *)v5 connection];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100022CE4;
    handler[3] = &unk_100054F08;
    v8 = v5;
    v12 = v8;
    xpc_connection_set_event_handler(v7, handler);

    [(id)qword_10005BEE0 addObject:v8];
    v9 = v8;
  }
  return v5;
}

- (void)deliverDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  if (v5 == [(BrowseRegistration *)self type] || [(BrowseRegistration *)self type] == 0xFFFF)
  {
    v6 = [(BrowseRegistration *)self connection];
    v7 = sub_100018430(v6);

    v8 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Delivering device (client=\"%s\")", (uint8_t *)&v12, 0xCu);
    }
    free(v7);
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    v10 = [(BrowseRegistration *)self connection];
    sub_100022F50(v4, v10, v9);

    v11 = [(BrowseRegistration *)self connection];
    xpc_connection_send_message(v11, v9);
  }
}

- (void)cancel
{
  if (![(BrowseRegistration *)self canceled])
  {
    [(BrowseRegistration *)self setCanceled:1];
    [(id)qword_10005BEE0 removeObject:self];
    v3 = [(BrowseRegistration *)self connection];
    id v4 = sub_100018430(v3);

    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEBUG)) {
      sub_10003C388();
    }
    free(v4);
    unsigned int v5 = [(BrowseRegistration *)self connection];
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472;
    barrier[2] = sub_100023138;
    barrier[3] = &unk_1000550D0;
    barrier[4] = self;
    xpc_connection_send_barrier(v5, barrier);
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end