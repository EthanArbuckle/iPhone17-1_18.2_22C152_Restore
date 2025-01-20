@interface MRDBannerCenter
- (MRBannerDelegate)delegate;
- (MRBannerRequestRepresentable)activeRequest;
- (MRBannerUIControllable)bannerControllable;
- (MRDBannerCenter)init;
- (MRDBannerCenter)initWithDelegate:(id)a3;
- (void)bannerWithIdentifier:(id)a3 postedEvent:(unint64_t)a4;
- (void)dismissAllBannerRequests;
- (void)dismissBannerWithIdentifier:(id)a3;
- (void)invalidated;
- (void)postBannerRequest:(id)a3;
- (void)setActiveRequest:(id)a3;
- (void)setBannerControllable:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDBannerCenter

- (MRDBannerCenter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRDBannerCenter;
  v5 = [(MRDBannerCenter *)&v8 init];
  if (v5)
  {
    v6 = +[MRDUIControllerProvider bannerUIControllerWithDelegate:v5];
    [(MRDBannerCenter *)v5 setBannerControllable:v6];

    [(MRDBannerCenter *)v5 setDelegate:v4];
  }

  return v5;
}

- (MRDBannerCenter)init
{
  return [(MRDBannerCenter *)self initWithDelegate:0];
}

- (MRBannerRequestRepresentable)activeRequest
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveRequest:(id)a3
{
  id v4 = (MRBannerRequestRepresentable *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeRequest = obj->_activeRequest;
  obj->_activeRequest = v4;

  objc_sync_exit(obj);
}

- (void)postBannerRequest:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 requestIdentifier];
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].BC <%p> postBannerRequest: %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [(MRDBannerCenter *)self activeRequest];

  if (v7)
  {
    objc_super v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(MRDBannerCenter *)self activeRequest];
      int v10 = 134218242;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].BC <%p> already presenting %@, bailing out", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    [(MRDBannerCenter *)self setActiveRequest:v4];
    objc_super v8 = [(MRDBannerCenter *)self bannerControllable];
    [v8 postBannerRequest:v4];
  }
}

- (void)dismissBannerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    objc_super v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].BC <%p> dismissBannerWithIdentifier: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(MRDBannerCenter *)self bannerControllable];
  [v6 dismissBannerWithIdentifier:v4];
}

- (void)dismissAllBannerRequests
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDRRC].BC <%p> dismissAllBannerRequests", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MRDBannerCenter *)self bannerControllable];
  [v4 dismissAllBanners];
}

- (void)bannerWithIdentifier:(id)a3 postedEvent:(unint64_t)a4
{
  id v6 = a3;
  int v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].BC <%p> bannerWithIdentifier: %@ postedEvent: %lu", (uint8_t *)&v9, 0x20u);
  }

  if (!a4) {
    [(MRDBannerCenter *)self setActiveRequest:0];
  }
  objc_super v8 = [(MRDBannerCenter *)self delegate];
  [v8 bannerWithRequestIdentifier:v6 didReceiveEvent:a4];
}

- (void)invalidated
{
}

- (MRBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRBannerUIControllable)bannerControllable
{
  return self->_bannerControllable;
}

- (void)setBannerControllable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerControllable, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_activeRequest, 0);
}

@end