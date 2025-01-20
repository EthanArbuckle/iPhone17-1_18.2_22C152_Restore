@interface MRDAVReconnaissanceSession
- (MRDAVReconnaissanceSession)initWithRouteUID:(id)a3;
- (NSString)routeUID;
- (NSTimer)timeoutTimer;
- (id)callback;
- (void)_concludeSearchWithRoute:(id)a3;
- (void)_endSearch;
- (void)_routingDataSourcePickableRoutesDidChange:(id)a3;
- (void)_timeoutTimerFired:(id)a3;
- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4;
- (void)cancelSearch;
- (void)dealloc;
- (void)setCallback:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation MRDAVReconnaissanceSession

- (MRDAVReconnaissanceSession)initWithRouteUID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRDAVReconnaissanceSession;
  v5 = [(MRDAVReconnaissanceSession *)&v12 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    routeUID = v5->_routeUID;
    v5->_routeUID = v6;

    v8 = objc_alloc_init(MRDAVRoutingDataSource);
    routingDataSource = v5->_routingDataSource;
    v5->_routingDataSource = v8;

    v5->_searchInProgress = 0;
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_routingDataSourcePickableRoutesDidChange:" name:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:v5->_routingDataSource];
  }
  return v5;
}

- (void)dealloc
{
  [(MRDAVReconnaissanceSession *)self cancelSearch];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDAVReconnaissanceSession;
  [(MRDAVReconnaissanceSession *)&v4 dealloc];
}

- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_searchInProgress) {
    [(MRDAVReconnaissanceSession *)self cancelSearch];
  }
  v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Beginning search with timeout %f", (uint8_t *)&v9, 0xCu);
  }

  self->_searchInProgress = 1;
  self->_timeoutInterval = a3;
  [(MRDAVReconnaissanceSession *)self setCallback:v6];
  v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_timeoutTimerFired:" selector:0 userInfo:0 repeats:a3];
  [(MRDAVReconnaissanceSession *)self setTimeoutTimer:v8];

  [(MRDAVRoutingDataSource *)self->_routingDataSource setDiscoveryMode:3];
}

- (void)cancelSearch
{
  if (self->_searchInProgress)
  {
    v3 = _MRLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Cancelling search for session %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_super v4 = [(MRDAVReconnaissanceSession *)self callback];

    if (v4)
    {
      Error = (void *)MRMediaRemoteCreateError();
      id v6 = [(MRDAVReconnaissanceSession *)self callback];
      ((void (**)(void, void, void *))v6)[2](v6, 0, Error);
    }
    [(MRDAVReconnaissanceSession *)self _endSearch];
  }
}

- (void)_routingDataSourcePickableRoutesDidChange:(id)a3
{
  if (self->_searchInProgress)
  {
    [(MRDAVRoutingDataSource *)self->_routingDataSource pickableRoutesForCategory:0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    id v6 = v4;
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_msgSend(v10, "matchesUniqueIdentifier:", self->_routeUID, (void)v11)) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          id v6 = v4;
          goto LABEL_13;
        }
      }
      id v6 = v10;

      if (!v6) {
        goto LABEL_14;
      }
      [(MRDAVReconnaissanceSession *)self _concludeSearchWithRoute:v6];
    }
LABEL_13:

LABEL_14:
  }
}

- (void)_timeoutTimerFired:(id)a3
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double timeoutInterval = self->_timeoutInterval;
    int v9 = 134217984;
    double v10 = timeoutInterval;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Session timed out after %f seconds", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(MRDAVReconnaissanceSession *)self callback];

  if (v6)
  {
    Error = (void *)MRMediaRemoteCreateError();
    uint64_t v8 = [(MRDAVReconnaissanceSession *)self callback];
    ((void (**)(void, void, void *))v8)[2](v8, 0, Error);
  }
  [(MRDAVReconnaissanceSession *)self _endSearch];
}

- (void)_concludeSearchWithRoute:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found route matching query: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(MRDAVReconnaissanceSession *)self callback];

  if (v6)
  {
    id v7 = [(MRDAVReconnaissanceSession *)self callback];
    ((void (**)(void, id, void))v7)[2](v7, v4, 0);
  }
  [(MRDAVReconnaissanceSession *)self _endSearch];
}

- (void)_endSearch
{
  if (self->_searchInProgress)
  {
    v3 = [(MRDAVReconnaissanceSession *)self timeoutTimer];
    [v3 invalidate];

    [(MRDAVReconnaissanceSession *)self setTimeoutTimer:0];
    [(MRDAVRoutingDataSource *)self->_routingDataSource setDiscoveryMode:0];
    self->_searchInProgress = 0;
  }
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);

  objc_storeStrong((id *)&self->_routingDataSource, 0);
}

@end