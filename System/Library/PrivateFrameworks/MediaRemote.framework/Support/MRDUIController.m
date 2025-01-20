@interface MRDUIController
- (MRDUIController)initWithClientObject:(id)a3;
- (MRDUIController)initWithDelegate:(id)a3;
- (MRDUIControllerConnection)connection;
- (id)delegate;
- (id)server;
- (void)bannerDismissed;
- (void)bannerWithIdentifier:(id)a3 postedEvent:(id)a4;
- (void)dealloc;
- (void)dismissAllBanners;
- (void)dismissBannerWithIdentifier:(id)a3;
- (void)invalidate;
- (void)postBannerRequest:(id)a3;
@end

@implementation MRDUIController

- (MRDUIController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(MRDUIController *)self initWithClientObject:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_delegate, v4);
  }

  return v6;
}

- (MRDUIController)initWithClientObject:(id)a3
{
  id v4 = (MRDUIController *)a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDUIController;
  v5 = [(MRDUIController *)&v14 init];
  if (v5)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Initializing direct controller.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v5);
    v7 = [MRDUIControllerConnection alloc];
    if (v4) {
      v8 = v4;
    }
    else {
      v8 = v5;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100170388;
    v12[3] = &unk_1004171D0;
    objc_copyWeak(&v13, (id *)buf);
    v9 = [(MRDUIControllerConnection *)v7 initWithClientObject:v8 invalidationHandler:v12];
    connection = v5->_connection;
    v5->_connection = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Dealloc.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDUIController;
  [(MRDUIController *)&v4 dealloc];
}

- (id)server
{
  v2 = [(MRDUIController *)self connection];
  v3 = [v2 server];

  return v3;
}

- (void)postBannerRequest:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> IPC postBannerWithConfiguration", buf, 0xCu);
  }

  v6 = [(MRDUIController *)self server];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100170600;
  v7[3] = &unk_100415F80;
  v7[4] = self;
  [v6 connectForBannerPresentation:v4 reply:v7];
}

- (void)dismissBannerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> IPC dismissBannerWithIdentifier:%@", buf, 0x16u);
  }

  v6 = [(MRDUIController *)self server];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017079C;
  v7[3] = &unk_100415F80;
  v7[4] = self;
  [v6 revokeBannerWithIdentifier:v4 withReply:v7];
}

- (void)dismissAllBanners
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> IPC dismissAllBanners", buf, 0xCu);
  }

  id v4 = [(MRDUIController *)self server];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100170914;
  v5[3] = &unk_100415F80;
  v5[4] = self;
  [v4 revokeAllBannersWithReply:v5];
}

- (void)bannerWithIdentifier:(id)a3 postedEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218498;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> [MRDRRC] IPC Back bannerWithIdentifier: %@ postedEvent: %@", (uint8_t *)&v10, 0x20u);
  }

  v9 = [(MRDUIController *)self delegate];
  objc_msgSend(v9, "bannerWithIdentifier:postedEvent:", v6, objc_msgSend(v7, "unsignedIntValue"));
}

- (void)invalidate
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> [MRDRRC] IPC invalidated", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MRDUIController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 invalidated];
  }
}

- (void)bannerDismissed
{
  v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] Banner dismissed", v3, 2u);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (MRDUIControllerConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak(&self->_delegate);
}

@end