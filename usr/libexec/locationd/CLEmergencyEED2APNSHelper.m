@interface CLEmergencyEED2APNSHelper
- (APSConnection)apsConnection;
- (CLEmergencyEED2APNSHelper)initWithUniverse:(id)a3 apnsTokenCallback:(id)a4 apnsMessageCallback:(id)a5 apnsReconnectedCallback:(id)a6;
- (CLIntersiloUniverse)fUniverse;
- (OS_dispatch_queue)apsdQueue;
- (id)fAPNSMessageCallback;
- (id)fAPNSReconnectedCallback;
- (id)fAPNSTokenCallback;
- (id)getEEDAPNSEnvironment;
- (id)getEEDAPNSTopic;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)requestAPNSToken;
- (void)setApsConnection:(id)a3;
- (void)setApsdQueue:(id)a3;
- (void)setFAPNSMessageCallback:(id)a3;
- (void)setFAPNSReconnectedCallback:(id)a3;
- (void)setFAPNSTokenCallback:(id)a3;
- (void)setFUniverse:(id)a3;
@end

@implementation CLEmergencyEED2APNSHelper

- (CLEmergencyEED2APNSHelper)initWithUniverse:(id)a3 apnsTokenCallback:(id)a4 apnsMessageCallback:(id)a5 apnsReconnectedCallback:(id)a6
{
  v19.receiver = self;
  v19.super_class = (Class)CLEmergencyEED2APNSHelper;
  v10 = [(CLEmergencyEED2APNSHelper *)&v19 init];
  if (objc_opt_class())
  {
    v10->_fUniverse = (CLIntersiloUniverse *)a3;
    v10->_fAPNSTokenCallback = _Block_copy(a4);
    v10->_fAPNSMessageCallback = _Block_copy(a5);
    v10->_fAPNSReconnectedCallback = _Block_copy(a6);
    if (byte_1024823DF >= 0) {
      v11 = (const char *)&qword_1024823C8;
    }
    else {
      v11 = (const char *)qword_1024823C8;
    }
    v10->_apsdQueue = (OS_dispatch_queue *)dispatch_queue_create(v11, 0);
    v12 = (APSConnection *)[objc_alloc((Class)APSConnection) initWithEnvironmentName:-[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment](v10, "getEEDAPNSEnvironment") namedDelegatePort:@"com.apple.aps.eed" queue:-[CLEmergencyEED2APNSHelper apsdQueue](v10, "apsdQueue")];
    v10->_apsConnection = v12;
    if (!v12)
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1023059D8);
      }
      v13 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection init failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1023059D8);
        }
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper initWithUniverse:apnsTokenCallback:apnsMessageCallback:apnsReconnectedCallback:]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
    }
    [(APSConnection *)v10->_apsConnection setDelegate:v10];
    apsConnection = v10->_apsConnection;
    id v20 = [(CLEmergencyEED2APNSHelper *)v10 getEEDAPNSTopic];
    [(APSConnection *)apsConnection setEnabledTopics:+[NSArray arrayWithObjects:&v20 count:1] ignoredTopics:0];
    [(APSConnection *)v10->_apsConnection setEnableCriticalReliability:1];
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    v15 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,initWithUniverse:apnsTokenCallback,APSConnection not found init failed, early return", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1023059D8);
      }
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper initWithUniverse:apnsTokenCallback:apnsMessageCallback:apnsReconnectedCallback:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    return 0;
  }
  return v10;
}

- (void)dealloc
{
  apsConnection = self->_apsConnection;
  if (apsConnection)
  {
    [(APSConnection *)apsConnection setEnableCriticalReliability:0];
    [(APSConnection *)self->_apsConnection shutdown];

    self->_apsConnection = 0;
  }
  _Block_release(self->_fAPNSTokenCallback);
  self->_fAPNSTokenCallback = 0;
  _Block_release(self->_fAPNSMessageCallback);
  self->_fAPNSMessageCallback = 0;
  _Block_release(self->_fAPNSReconnectedCallback);
  self->_fAPNSReconnectedCallback = 0;
  dispatch_release((dispatch_object_t)self->_apsdQueue);
  v4.receiver = self;
  v4.super_class = (Class)CLEmergencyEED2APNSHelper;
  [(CLEmergencyEED2APNSHelper *)&v4 dealloc];
}

- (void)requestAPNSToken
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = [(CLEmergencyEED2APNSHelper *)self getEEDAPNSTopic];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2,CLEmergencyAPNSHelper,requestAPNSToken,for topic:%@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    [(CLEmergencyEED2APNSHelper *)self getEEDAPNSTopic];
    objc_super v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper requestAPNSToken]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(APSConnection *)[(CLEmergencyEED2APNSHelper *)self apsConnection] requestTokenForTopic:[(CLEmergencyEED2APNSHelper *)self getEEDAPNSTopic] identifier:&stru_10234F018];
}

- (id)getEEDAPNSTopic
{
  sub_1000C7F88(buf);
  LOBYTE(v8) = 0;
  int v2 = sub_1000D2988(*(uint64_t *)&buf[0], "EEDAPNSTest", (BOOL *)&v8);
  if ((_BYTE)v8) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  if (*((void *)&buf[0] + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
  }
  if (!v3) {
    return @"com.apple.eed";
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  objc_super v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = @"com.apple.eed.test";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,getEEDAPNSTopic,APNS EED test mode with topic:%{public}@", (uint8_t *)buf, 0xCu);
  }
  CFStringRef v5 = @"com.apple.eed.test";
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    int v8 = 138543362;
    CFStringRef v9 = @"com.apple.eed.test";
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSTopic]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
    return @"com.apple.eed.test";
  }
  return (id)v5;
}

- (id)getEEDAPNSEnvironment
{
  sub_1000C7F88(buf);
  v10[0] = 0;
  int v2 = sub_1000D2988(*(uint64_t *)buf, "EEDAPNSEnvironmentDevelopment", v10);
  if (v10[0]) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  if (v12) {
    sub_1000DB0A0(v12);
  }
  if (v3)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    objc_super v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,getEEDAPNSEnvironment,APSEnvironmentDevelopment", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1023059D8);
      }
      *(_WORD *)v10 = 0;
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    CFStringRef v5 = (id *)&APSEnvironmentDevelopment;
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    id v6 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2,getEEDAPNSEnvironment,APSEnvironmentProduction", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1023059D8);
      }
      *(_WORD *)v10 = 0;
      CFStringRef v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper getEEDAPNSEnvironment]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    CFStringRef v5 = (id *)&APSEnvironmentProduction;
  }
  return *v5;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  CFStringRef v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v8 = a4;
    __int16 v9 = 2113;
    id v10 = [a4 __imHexString];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceivePublicToken,%{private}@,hexstring,%{private}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    [a4 __imHexString];
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceivePublicToken:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  __int16 v9 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    id v22 = a4;
    __int16 v23 = 2113;
    id v24 = [a4 __imHexString];
    __int16 v25 = 2114;
    id v26 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveToken,%{private}@,hexstring,%{private}@,forTopic,%{public}@", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    int v15 = 138478339;
    id v16 = a4;
    __int16 v17 = 2113;
    id v18 = [a4 __imHexString];
    __int16 v19 = 2114;
    id v20 = a5;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveToken:forTopic:identifier:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (objc_msgSend(a5, "isEqualToString:", -[CLEmergencyEED2APNSHelper getEEDAPNSTopic](self, "getEEDAPNSTopic")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100F2E6D4;
    block[3] = &unk_10229FEB0;
    block[4] = a4;
    block[5] = self;
    dispatch_async((dispatch_queue_t)[-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo") queue], block);
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    id v10 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(CLEmergencyEED2APNSHelper *)self getEEDAPNSTopic];
      *(_DWORD *)buf = 138543618;
      id v22 = a5;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#EED2APNSHelper,connection:didReceiveToken:forTopic,%{public}@,mismatch with expected topic,%{public}@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1023059D8);
      }
      int v15 = 138543618;
      id v16 = a5;
      __int16 v17 = 2114;
      id v18 = [(CLEmergencyEED2APNSHelper *)self getEEDAPNSTopic];
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyEED2APNSHelper connection:didReceiveToken:forTopic:identifier:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  id v6 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = a4;
    __int16 v20 = 2112;
    id v21 = [a4 topic];
    __int16 v22 = 2112;
    id v23 = [a4 token];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveIncomingMessage,%@,topic,%@,token,%@", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    int v12 = 138412802;
    id v13 = a4;
    __int16 v14 = 2112;
    id v15 = [a4 topic];
    __int16 v16 = 2112;
    id v17 = [a4 token];
    __int16 v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveIncomingMessage:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  v7 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a4 userInfo];
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connection:didReceiveIncomingMessage,userInfo,%@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    int v12 = 138412290;
    id v13 = [a4 userInfo];
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connection:didReceiveIncomingMessage:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100F2ED98;
  block[3] = &unk_10229FEB0;
  block[4] = self;
  block[5] = a4;
  dispatch_async([-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo") queue], block);
}

- (void)connectionDidReconnect:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1023059D8);
  }
  objc_super v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2APNSHelper,connectionDidReconnect", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1023059D8);
    }
    __int16 v7 = 0;
    CFStringRef v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyEED2APNSHelper connectionDidReconnect:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100F2F184;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[-[CLIntersiloUniverse silo](-[CLEmergencyEED2APNSHelper fUniverse](self, "fUniverse"), "silo") queue], block);
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (OS_dispatch_queue)apsdQueue
{
  return self->_apsdQueue;
}

- (void)setApsdQueue:(id)a3
{
}

- (CLIntersiloUniverse)fUniverse
{
  return self->_fUniverse;
}

- (void)setFUniverse:(id)a3
{
  self->_fUniverse = (CLIntersiloUniverse *)a3;
}

- (id)fAPNSTokenCallback
{
  return self->_fAPNSTokenCallback;
}

- (void)setFAPNSTokenCallback:(id)a3
{
  self->_fAPNSTokenCallback = a3;
}

- (id)fAPNSMessageCallback
{
  return self->_fAPNSMessageCallback;
}

- (void)setFAPNSMessageCallback:(id)a3
{
  self->_fAPNSMessageCallback = a3;
}

- (id)fAPNSReconnectedCallback
{
  return self->_fAPNSReconnectedCallback;
}

- (void)setFAPNSReconnectedCallback:(id)a3
{
  self->_fAPNSReconnectedCallback = a3;
}

@end