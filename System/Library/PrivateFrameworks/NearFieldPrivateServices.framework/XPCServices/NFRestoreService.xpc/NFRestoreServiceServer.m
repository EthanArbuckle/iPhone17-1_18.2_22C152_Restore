@interface NFRestoreServiceServer
+ (BOOL)checkCurrentuser;
- (NFRestoreServiceServer)init;
- (void)runService:(id)a3 callback:(id)a4;
@end

@implementation NFRestoreServiceServer

- (NFRestoreServiceServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFRestoreServiceServer;
  v2 = [(NFRestoreServiceServer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nfrestore.messages", 0);
    messageQueue = v2->messageQueue;
    v2->messageQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (BOOL)checkCurrentuser
{
  v2 = getpwnam("mobile");
  if (v2) {
    LOBYTE(v2) = getuid() == v2->pw_uid;
  }
  return (char)v2;
}

- (void)runService:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v10(5, "%c[%{public}s %{public}s]:%i Received request to update FW with options : %@", v13, ClassName, Name, 54, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v16;
    *(_WORD *)v40 = 2082;
    *(void *)&v40[2] = object_getClassName(self);
    *(_WORD *)&v40[10] = 2082;
    *(void *)&v40[12] = sel_getName(a2);
    *(_WORD *)&v40[20] = 1024;
    *(_DWORD *)&v40[22] = 54;
    *(_WORD *)&v40[26] = 2112;
    *(void *)&v40[28] = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received request to update FW with options : %@", buf, 0x2Cu);
  }

  *(void *)buf = 0;
  *(void *)v40 = buf;
  *(void *)&v40[8] = 0x3032000000;
  *(void *)&v40[16] = sub_100002B08;
  *(void *)&v40[24] = sub_100002B18;
  *(void *)&v40[32] = os_transaction_create();
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100002B08;
  v37 = sub_100002B18;
  dispatch_source_t v38 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v17 = v34[5];
  dispatch_time_t v18 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v19 = v34[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002B20;
  handler[3] = &unk_1000041F0;
  handler[4] = self;
  handler[5] = a2;
  dispatch_source_set_event_handler(v19, handler);
  dispatch_resume((dispatch_object_t)v34[5]);
  messageQueue = self->messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C70;
  block[3] = &unk_100004218;
  id v26 = v7;
  v27 = self;
  id v28 = v8;
  v29 = &v33;
  v30 = buf;
  SEL v31 = a2;
  id v21 = v8;
  id v22 = v7;
  dispatch_async(messageQueue, block);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);
}

- (void).cxx_destruct
{
}

@end