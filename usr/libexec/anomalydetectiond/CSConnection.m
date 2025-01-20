@interface CSConnection
- (CSConnection)initWithConnection:(shared_ptr<CLConnection>)a3 message:(shared_ptr<CLConnectionMessage>)a4 delegate:(id)a5;
- (CSConnectionDelegateProtocol)delegate;
- (NSString)name;
- (id).cxx_construct;
- (id)description;
- (int)remotePid;
- (shared_ptr<CLConnection>)connection;
- (void)dealloc;
- (void)sendMessage:(id)a3 withName:(id)a4;
- (void)sendMessage:(id)a3 withName:(id)a4 andReply:(id)a5;
- (void)start;
@end

@implementation CSConnection

- (CSConnection)initWithConnection:(shared_ptr<CLConnection>)a3 message:(shared_ptr<CLConnectionMessage>)a4 delegate:(id)a5
{
  ptr = a3.__ptr_;
  v8 = a4.__ptr_;
  v25.receiver = self;
  v25.super_class = (Class)CSConnection;
  id v9 = [(CSConnection *)&v25 init];
  if (v9)
  {
    if (!*(void *)ptr)
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:v9 file:@"CSConnection.mm" lineNumber:26 description:@"connection cannot be null"];
    }
    if (qword_1003DB720 != -1) {
      dispatch_once(&qword_1003DB720, &stru_1003BB2E8);
    }
    v10 = (id)qword_1003DB728;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CLConnection::getName((uint64_t *)&__p, *(CLConnection **)ptr);
      int v11 = v24;
      v12 = (void **)__p;
      int RemotePid = CLConnection::getRemotePid(*(CLConnection **)ptr);
      p_p = &__p;
      if (v11 < 0) {
        p_p = v12;
      }
      *(_DWORD *)buf = 136315394;
      v27 = p_p;
      __int16 v28 = 1024;
      int v29 = RemotePid;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Creating Connection, name: %s, pid: %d", buf, 0x12u);
      if (v24 < 0) {
        operator delete(__p);
      }
    }

    objc_storeWeak((id *)v9 + 1, v8);
    long long v15 = *(_OWORD *)ptr;
    *(void *)ptr = 0;
    *((void *)ptr + 1) = 0;
    v16 = (std::__shared_weak_count *)*((void *)v9 + 3);
    *((_OWORD *)v9 + 1) = v15;
    if (v16) {
      sub_10000BB9C(v16);
    }
    objc_initWeak((id *)buf, v9);
    [v9 connection];
    v20[1] = _NSConcreteStackBlock;
    v20[2] = (id)3221225472;
    v20[3] = sub_1003248B8;
    v20[4] = &unk_1003B20C8;
    objc_copyWeak(&v21, (id *)buf);
    CLConnection::setDisconnectionHandler();
    if (v23) {
      sub_10000BB9C(v23);
    }
    [v9 connection];
    v19[1] = _NSConcreteStackBlock;
    v19[2] = (id)3221225472;
    v19[3] = sub_100324934;
    v19[4] = &unk_1003B20C8;
    objc_copyWeak(v20, (id *)buf);
    CLConnection::setInterruptionHandler();
    if (v23) {
      sub_10000BB9C(v23);
    }
    [v9 connection];
    objc_copyWeak(v19, (id *)buf);
    CLConnection::setDefaultMessageHandler();
    if (v23) {
      sub_10000BB9C(v23);
    }
    objc_destroyWeak(v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return (CSConnection *)v9;
}

- (void)dealloc
{
  [(CSConnection *)self connection];
  v3 = v6;
  uint64_t v5 = 0;
  v6 = 0;
  if (v3) {
    sub_10000BB9C(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSConnection;
  [(CSConnection *)&v4 dealloc];
}

- (void)start
{
  [(CSConnection *)self connection];
  CLConnection::start(v2);
  if (v3) {
    sub_10000BB9C(v3);
  }
}

- (NSString)name
{
  [(CSConnection *)self connection];
  v3 = __p;
  if (v9) {
    sub_10000BB9C(v9);
  }
  if (__p)
  {
    [(CSConnection *)self connection];
    CLConnection::getName((uint64_t *)&__p, v6);
    if (v10 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    v3 = +[NSString stringWithUTF8String:p_p];
    if (v10 < 0) {
      operator delete(__p);
    }
    if (v7) {
      sub_10000BB9C(v7);
    }
  }

  return (NSString *)v3;
}

- (int)remotePid
{
  [(CSConnection *)self connection];
  if (v6) {
    sub_10000BB9C(v6);
  }
  if (!v5) {
    return -1;
  }
  [(CSConnection *)self connection];
  int RemotePid = CLConnection::getRemotePid(v5);
  if (v6) {
    sub_10000BB9C(v6);
  }
  return RemotePid;
}

- (void)sendMessage:(id)a3 withName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  sub_100007BC0(&__p, (char *)[v6 UTF8String]);
  sub_100325264(&v11);
  if (v10 < 0) {
    operator delete(__p);
  }
  [(CSConnection *)self connection];
  v7 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnection::sendMessage();
  if (v7) {
    sub_10000BB9C(v7);
  }
  if (v9) {
    sub_10000BB9C(v9);
  }
  if (v12) {
    sub_10000BB9C(v12);
  }
}

- (void)sendMessage:(id)a3 withName:(id)a4 andReply:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  sub_100007BC0(&__p, (char *)[v10 UTF8String]);
  sub_100325264(&v16);
  if (v15 < 0) {
    operator delete(__p);
  }
  [(CSConnection *)self connection];
  v12 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v11 = v9;
  CLConnection::sendMessage();
  if (v12) {
    sub_10000BB9C(v12);
  }
  if (v14) {
    sub_10000BB9C(v14);
  }

  if (v17) {
    sub_10000BB9C(v17);
  }
}

- (id)description
{
  [(CSConnection *)self connection];
  if (v7) {
    sub_10000BB9C(v7);
  }
  if (v6)
  {
    v3 = [(CSConnection *)self name];
    objc_super v4 = +[NSString stringWithFormat:@"Connection, name: %@, pid: %d", v3, [(CSConnection *)self remotePid]];
  }
  else
  {
    objc_super v4 = +[NSString stringWithFormat:@"Connection uninitialized."];
  }

  return v4;
}

- (CSConnectionDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSConnectionDelegateProtocol *)WeakRetained;
}

- (shared_ptr<CLConnection>)connection
{
  cntrl = self->_connection.__cntrl_;
  CLConnection *v2 = self->_connection.__ptr_;
  v2[1] = (CLConnection *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLConnection *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_connection.__cntrl_;
  if (cntrl) {
    sub_10000BB9C((std::__shared_weak_count *)cntrl);
  }

  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end