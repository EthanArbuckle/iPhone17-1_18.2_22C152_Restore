@interface Browse_CUPS
- (Browse_CUPS)initWithQueue:(id)a3;
- (void)_startWithPort:(unsigned __int16)a3;
- (void)cancel;
- (void)start;
@end

@implementation Browse_CUPS

- (Browse_CUPS)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Browse_CUPS;
  v6 = [(Browse_CUPS *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)_startWithPort:(unsigned __int16)a3
{
  v3 = +[NSString stringWithFormat:@"http://localhost:%d/admin", a3];
  uint64_t v4 = +[NSURL URLWithString:v3];

  id v5 = +[IPPSession globalSession];
  [v5 ippURL:v4];
  objc_claimAutoreleasedReturnValue();

  sub_100060410(v6, 0x4002u, @"browse_CUPS(_startWIthPort)");
}

- (void)start
{
  v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Browse_CUPS: Started", buf, 2u);
  }

  objc_initWeak(&location, self);
  queue = self->_queue;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10006025C;
  v13 = &unk_1000A3CA0;
  objc_copyWeak(&v14, &location);
  id v5 = queue;
  v6 = &v10;
  if (qword_1000C8BD0 != -1) {
    dispatch_once(&qword_1000C8BD0, &stru_1000A3D30);
  }
  *(void *)buf = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100060610;
  v19 = &unk_1000A3D80;
  v7 = v5;
  v20 = v7;
  v8 = v6;
  v21 = v8;
  objc_super v9 = objc_retainBlock(buf);
  if (qword_1000C8BC8) {
    objc_msgSend((id)qword_1000C8BC8, "withPort:", v9, v10, v11, v12, v13);
  }
  else {
    (*((void (**)(uint8_t *, void))v9 + 2))(v9, 0);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Browse_CUPS: Canceling", v6, 2u);
  }

  uint64_t v4 = self->_listener;
  listener = self->_listener;
  self->_listener = 0;

  if (v4) {
    nw_listener_cancel((nw_listener_t)v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end