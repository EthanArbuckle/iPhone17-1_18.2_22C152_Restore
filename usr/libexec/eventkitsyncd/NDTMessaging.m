@interface NDTMessaging
- (NDTMessaging)initWithIDSServiceName:(id)a3;
- (NDTMessaging)initWithIDSServiceName:(id)a3 logging:(id)a4;
- (NSDictionary)idsOptions;
- (id)_makeMessageFromWireData:(id)a3;
- (id)_makeWireMessageType:(id)a3 content:(id)a4;
- (id)_rawSendData:(id)a3 type:(id)a4 responseIdentifier:(id)a5 error:(id *)a6;
- (id)_rawSendFile:(id)a3 type:(id)a4 responseIdentifier:(id)a5 error:(id *)a6;
- (void)registerMessageType:(id)a3 handler:(id)a4;
- (void)reply:(id)a3 to:(id)a4 completion:(id)a5;
- (void)resume;
- (void)sendMessage:(id)a3 responseHandler:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setCloudFallback:(BOOL)a3;
- (void)setIdsOptions:(id)a3;
- (void)setPriority:(unsigned int)a3;
@end

@implementation NDTMessaging

- (NDTMessaging)initWithIDSServiceName:(id)a3
{
  return [(NDTMessaging *)self initWithIDSServiceName:a3 logging:0];
}

- (NDTMessaging)initWithIDSServiceName:(id)a3 logging:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NDTMessaging;
  id v8 = [(NDTMessaging *)&v20 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v11;

    objc_storeStrong((id *)v8 + 6, a4);
    dispatch_queue_t v13 = dispatch_queue_create("NDTMessaging", 0);
    v14 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v13;

    dispatch_suspend(*((dispatch_object_t *)v8 + 3));
    *((void *)v8 + 5) = 200;
    *((_WORD *)v8 + 28) = 1;
    v21[0] = IDSSendMessageOptionTimeoutKey;
    v21[1] = IDSSendMessageOptionEncryptPayloadKey;
    v22[0] = &off_1000AF2A0;
    v22[1] = &__kCFBooleanTrue;
    v21[2] = IDSSendMessageOptionBypassDuetKey;
    v22[2] = &__kCFBooleanFalse;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    v16 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v15;

    id v17 = [objc_alloc((Class)IDSService) initWithService:v6];
    v18 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v17;

    [*((id *)v8 + 4) addDelegate:v8 queue:*((void *)v8 + 3)];
  }

  return (NDTMessaging *)v8;
}

- (void)registerMessageType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v8 = [a4 copy];
  id v7 = objc_retainBlock(v8);
  [(NSMutableDictionary *)self->_handlers setObject:v7 forKeyedSubscript:v6];
}

- (void)resume
{
  self->_suspended = 0;
  dispatch_resume((dispatch_object_t)self->_q);
}

- (void)setPriority:(unsigned int)a3
{
  int64_t v3 = 200;
  if (a3 == 300) {
    int64_t v3 = 300;
  }
  if (a3 == 100) {
    int64_t v3 = 100;
  }
  self->_priority = v3;
}

- (void)setCloudFallback:(BOOL)a3
{
  self->_cloudFallback = a3;
}

- (id)_makeWireMessageType:(id)a3 content:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dataUsingEncoding:4];
  id v7 = objc_opt_new();
  if (!((unint64_t)[v6 length] >> 32)) {
    [v5 length];
  }
  unsigned int v9 = [v6 length];
  [v7 appendBytes:&v9 length:4];
  [v7 appendData:v6];
  unsigned int v9 = [v5 length];
  [v7 appendBytes:&v9 length:4];
  [v7 appendData:v5];

  return v7;
}

- (id)_makeMessageFromWireData:(id)a3
{
  unsigned int v10 = 0;
  id v3 = a3;
  [v3 getBytes:&v10 range:0, 4];
  v4 = [v3 subdataWithRange:4, v10];
  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
  unsigned int v9 = 0;
  [v3 getBytes:&v9 range:v10 + 4, 4];
  id v6 = [v3 subdataWithRange:NSMakeRange(v10 + 8, v9)];

  id v7 = [[NDTMessage alloc] initWithData:v6];
  [(NDTMessage *)v7 setMsgType:v5];

  return v7;
}

- (id)_rawSendData:(id)a3 type:(id)a4 responseIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  dispatch_queue_t v13 = [(NDTMessaging *)self idsOptions];
  id v14 = [v13 mutableCopy];

  if (v10) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = &__kCFBooleanTrue;
  }
  v16 = &IDSSendMessageOptionExpectsPeerResponseKey;
  if (v10) {
    v16 = &IDSSendMessageOptionPeerResponseIdentifierKey;
  }
  [v14 setObject:v15 forKeyedSubscript:*v16];
  id v17 = +[NSNumber numberWithBool:self->_cloudFallback];
  [v14 setObject:v17 forKeyedSubscript:IDSSendMessageOptionAllowCloudDeliveryKey];

  v18 = [(NDTMessaging *)self _makeWireMessageType:v11 content:v12];

  service = self->_service;
  objc_super v20 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  int64_t priority = self->_priority;
  id v29 = 0;
  unsigned int v22 = [(IDSService *)service sendData:v18 toDestinations:v20 priority:priority options:v14 identifier:&v29 error:a6];
  id v23 = v29;

  os_log_facility = self->_logFacility->os_log_facility;
  BOOL v25 = os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (!v25) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v23;
    v26 = "_rawSendData assigned IDS identifier: %@";
  }
  else
  {
    if (!v25) {
      goto LABEL_12;
    }
    id v27 = *a6;
    *(_DWORD *)buf = 138543362;
    id v31 = v27;
    v26 = "_rawSendData has an error: %{public}@";
  }
  _os_log_impl((void *)&_mh_execute_header, os_log_facility, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
LABEL_12:

  return v23;
}

- (id)_rawSendFile:(id)a3 type:(id)a4 responseIdentifier:(id)a5 error:(id *)a6
{
  id v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = a3;
  dispatch_queue_t v13 = [(NDTMessaging *)self idsOptions];
  id v14 = [v13 mutableCopy];

  if (v11) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = &__kCFBooleanTrue;
  }
  v16 = &IDSSendMessageOptionExpectsPeerResponseKey;
  if (v11) {
    v16 = &IDSSendMessageOptionPeerResponseIdentifierKey;
  }
  [v14 setObject:v15 forKeyedSubscript:*v16];
  id v17 = +[NSNumber numberWithBool:self->_cloudFallback];
  [v14 setObject:v17 forKeyedSubscript:IDSSendMessageOptionAllowCloudDeliveryKey];

  if (v10) {
    CFStringRef v18 = v10;
  }
  else {
    CFStringRef v18 = &stru_1000AB888;
  }
  CFStringRef v33 = @"msgType";
  CFStringRef v34 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  service = self->_service;
  v21 = +[NSURL fileURLWithPath:v12];

  unsigned int v22 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  int64_t priority = self->_priority;
  id v30 = 0;
  LODWORD(service) = [(IDSService *)service sendResourceAtURL:v21 metadata:v19 toDestinations:v22 priority:priority options:v14 identifier:&v30 error:a6];
  id v24 = v30;

  os_log_facility = self->_logFacility->os_log_facility;
  BOOL v26 = os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT);
  if (service)
  {
    if (!v26) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v24;
    id v27 = "_rawSendFile assigned IDS identifier: %@";
  }
  else
  {
    if (!v26) {
      goto LABEL_15;
    }
    id v28 = *a6;
    *(_DWORD *)buf = 138543362;
    id v32 = v28;
    id v27 = "_rawSendFile has an error: %{public}@";
  }
  _os_log_impl((void *)&_mh_execute_header, os_log_facility, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_15:

  return v24;
}

- (void)sendMessage:(id)a3 responseHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  objc_initWeak(&location, self);
  q = self->_q;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013F98;
  v17[3] = &unk_1000A8E50;
  objc_copyWeak(&v22, &location);
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(q, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)reply:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014330;
  block[3] = &unk_1000A8E78;
  id v18 = v8;
  id v19 = self;
  id v21 = v11;
  id v22 = v10;
  id v20 = v9;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(q, block);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a7;
  id v10 = [(NDTMessaging *)self _makeMessageFromWireData:a5];
  id v11 = (void *)os_transaction_create();
  id v12 = [v9 incomingResponseIdentifier];

  if (!v12)
  {
    id v21 = [v9 outgoingResponseIdentifier];
    [v10 setResponseIdentifier:v21];

    handlers = self->_handlers;
    id v23 = [v10 msgType];
    id v24 = [(NSMutableDictionary *)handlers objectForKeyedSubscript:v23];

    if (v24)
    {
      BOOL v25 = dispatch_get_global_queue(0, 0);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100014778;
      v28[3] = &unk_1000A8EA0;
      id v31 = v24;
      id v29 = v10;
      id v30 = v11;
      id v17 = v24;
      dispatch_async(v25, v28);

      id v20 = v31;
      goto LABEL_6;
    }
    os_log_facility = self->_logFacility->os_log_facility;
    if (!os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v27 = "Can't find a handler for this message";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, os_log_facility, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_12;
  }
  outstanding = self->_outstanding;
  id v14 = [v9 incomingResponseIdentifier];
  id v15 = [(NSMutableDictionary *)outstanding objectForKeyedSubscript:v14];

  if (!v15)
  {
    os_log_facility = self->_logFacility->os_log_facility;
    if (!os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v27 = "Incoming reply message but no handler registered.";
    goto LABEL_11;
  }
  id v16 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014760;
  block[3] = &unk_1000A8EA0;
  v36 = v15;
  id v34 = v10;
  id v35 = v11;
  id v17 = v15;
  dispatch_async(v16, block);

  id v18 = self->_outstanding;
  id v19 = [v9 incomingResponseIdentifier];
  [(NSMutableDictionary *)v18 removeObjectForKey:v19];

  id v20 = v36;
LABEL_6:

LABEL_12:
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a8;
  id v13 = a6;
  id v14 = [NDTMessage alloc];
  id v15 = [v11 path];
  id v16 = [(NDTMessage *)v14 initWithFile:v15];

  id v17 = [v13 objectForKeyedSubscript:@"msgType"];

  [(NDTMessage *)v16 setMsgType:v17];
  strcpy((char *)buf, "/tmp/verifier_data.XXXXXX");
  id v18 = v11;
  id v19 = [v18 lastPathComponent];
  mkdtemp((char *)buf);
  id v20 = +[NSString stringWithFormat:@"%s/%@", buf, v19];
  id v21 = v18;
  id v22 = (const char *)[v21 fileSystemRepresentation];

  id v23 = v20;
  link(v22, (const char *)[v23 UTF8String]);

  [(NDTMessage *)v16 setPath:v23];
  id v24 = (void *)os_transaction_create();
  BOOL v25 = [v12 incomingResponseIdentifier];

  if (!v25)
  {
    id v34 = [v12 outgoingResponseIdentifier];
    [(NDTMessage *)v16 setResponseIdentifier:v34];

    handlers = self->_handlers;
    v36 = [(NDTMessage *)v16 msgType];
    v37 = [(NSMutableDictionary *)handlers objectForKeyedSubscript:v36];

    if (v37)
    {
      v38 = dispatch_get_global_queue(0, 0);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100014BDC;
      v41[3] = &unk_1000A8EA0;
      v44 = v37;
      v42 = v16;
      id v43 = v24;
      id v30 = v37;
      dispatch_async(v38, v41);

      CFStringRef v33 = v44;
      goto LABEL_6;
    }
    os_log_facility = self->_logFacility->os_log_facility;
    if (!os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v40 = "Can't find a handler for this message";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, os_log_facility, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
    goto LABEL_12;
  }
  outstanding = self->_outstanding;
  id v27 = [v12 incomingResponseIdentifier];
  id v28 = [(NSMutableDictionary *)outstanding objectForKeyedSubscript:v27];

  if (!v28)
  {
    os_log_facility = self->_logFacility->os_log_facility;
    if (!os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v40 = "Incoming reply message but no handler registered.";
    goto LABEL_11;
  }
  id v29 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014BC4;
  block[3] = &unk_1000A8EA0;
  v48 = v28;
  v46 = v16;
  id v47 = v24;
  id v30 = v28;
  dispatch_async(v29, block);

  id v31 = self->_outstanding;
  id v32 = [v12 incomingResponseIdentifier];
  [(NSMutableDictionary *)v31 removeObjectForKey:v32];

  CFStringRef v33 = v48;
LABEL_6:

LABEL_12:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  os_log_facility = self->_logFacility->os_log_facility;
  if (os_log_type_enabled(os_log_facility, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109634;
    if (v8) {
      int v13 = 89;
    }
    else {
      int v13 = 78;
    }
    v14[1] = v13;
    __int16 v15 = 2114;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, os_log_facility, OS_LOG_TYPE_DEFAULT, "didSend:%c IDS id: %{public}@, error: %{public}@", (uint8_t *)v14, 0x1Cu);
  }
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_logFacility, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_outstanding, 0);
}

@end