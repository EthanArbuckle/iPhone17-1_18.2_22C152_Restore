@interface RMInternalServiceHandler
- (RMConnectionEndpoint)endpoint;
- (RMConnectionListener)listener;
- (RMInternalServiceHandler)initWithEndpoint:(id)a3 managedListener:(id)a4;
- (void)dealloc;
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)setEndpoint:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation RMInternalServiceHandler

- (RMInternalServiceHandler)initWithEndpoint:(id)a3 managedListener:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RMInternalServiceHandler;
  v8 = [(RMInternalServiceHandler *)&v10 init];
  if (v8)
  {
    sub_100015E24(v6, v8);
    [(RMInternalServiceHandler *)v8 setEndpoint:v6];
    [(RMInternalServiceHandler *)v8 setListener:v7];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(RMInternalServiceHandler *)self endpoint];
  sub_100015E24(v3, 0);

  [(RMInternalServiceHandler *)self setEndpoint:0];
  v4.receiver = self;
  v4.super_class = (Class)RMInternalServiceHandler;
  [(RMInternalServiceHandler *)&v4 dealloc];
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100006634;
  v39[3] = &unk_100024A40;
  v39[4] = self;
  id v13 = a6;
  id v40 = v13;
  v14 = objc_retainBlock(v39);
  if ([v11 isEqualToString:@"RMSpiGetNumClients"])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x2020000000;
    v43 = 0;
    listener = self->_listener;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000674C;
    v36[3] = &unk_100024A68;
    p_long long buf = &buf;
    v37 = v14;
    [(RMConnectionListener *)listener traverseEndpointsAsynchronously:v36];

LABEL_5:
    _Block_object_dispose(&buf, 8);
    goto LABEL_6;
  }
  if ([v11 isEqualToString:@"RMSpiDisconnectAllClients"])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x2020000000;
    v43 = 0;
    v16 = self->_listener;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100006820;
    v33[3] = &unk_100024A68;
    v35 = &buf;
    v34 = v14;
    [(RMConnectionListener *)v16 traverseEndpointsAsynchronously:v33];

    goto LABEL_5;
  }
  if ([v11 isEqualToString:@"RMSpiListClients"])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    v43 = sub_1000068FC;
    v44 = sub_10000690C;
    id v45 = (id)objc_opt_new();
    v17 = self->_listener;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100006914;
    v30[3] = &unk_100024A68;
    v32 = &buf;
    v31 = v14;
    [(RMConnectionListener *)v17 traverseEndpointsAsynchronously:v30];

    _Block_object_dispose(&buf, 8);
  }
  else if ([v11 isEqualToString:@"RMSpiDisconnectClient"])
  {
    id v29 = 0;
    v18 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v29];
    id v19 = v29;
    if (v18)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v42 = 0x2020000000;
      v43 = 0;
      v20 = self->_listener;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000069D0;
      v25[3] = &unk_100024A90;
      id v26 = v18;
      v28 = &buf;
      v27 = v14;
      [(RMConnectionListener *)v20 traverseEndpointsAsynchronously:v25];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v24 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
      ((void (*)(void *, const __CFString *, void *))v14[2])(v14, @"RMSpiError", v24);
    }
  }
  else
  {
    if (qword_10002C548 != -1) {
      dispatch_once(&qword_10002C548, &stru_100024AB0);
    }
    v21 = qword_10002C550;
    if (os_log_type_enabled((os_log_t)qword_10002C550, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unknown message: %@", (uint8_t *)&buf, 0xCu);
    }
    v22 = +[NSError errorWithDomain:@"RMSpiError" code:-699 userInfo:0];
    v23 = +[NSKeyedArchiver archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
    ((void (*)(void *, const __CFString *, void *))v14[2])(v14, @"RMSpiError", v23);
  }
LABEL_6:
}

- (RMConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (RMConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end