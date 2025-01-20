@interface NRLinkManagerQuickRelay
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerQuickRelay

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quickRelayManagerDelegate);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);

  objc_storeStrong((id *)&self->_links, 0);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (qword_1001F4B18 != -1) {
    dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B18 != -1) {
      dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
    }
    if (v4) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    id v12 = v14;
    v13 = v8;
    uint64_t v11 = 301;
    v9 = "";
    v10 = "-[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:]";
    _NRLogWithArgs();
  }
  if (self)
  {
    self->_apsConnected = v4;
    self = (NRLinkManagerQuickRelay *)objc_loadWeakRetained((id *)&self->_quickRelayManagerDelegate);
  }
  -[NRLinkManagerQuickRelay apsIsConnected:](self, "apsIsConnected:", v4, v9, v10, v11, v12, v13);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (qword_1001F4B18 != -1) {
    dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B18 != -1) {
      dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
    }
    id v10 = v12;
    id v11 = v6;
    uint64_t v9 = 294;
    v7 = "";
    v8 = "-[NRLinkManagerQuickRelay connection:didReceivePublicToken:]";
    _NRLogWithArgs();
  }
  -[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:](self, "connection:didChangeConnectedStatus:", v12, [v12 isConnected:v7, v8, v9, v10, v11]);
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v12 = sub_100105184();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_6;
    }
LABEL_10:
    id v16 = sub_100105184();
    _NRLogWithArgs();

    goto LABEL_6;
  }
  if (!v7)
  {
    id v14 = sub_100105184();
    int v15 = _NRLogIsLevelEnabled();

    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  if (self)
  {
    uint64_t v9 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

    queue = self->super._queue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    queue = 0;
  }
  id v11 = queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001051D8;
  block[3] = &unk_1001C8868;
  block[4] = self;
  id v18 = v6;
  id v19 = v8;
  dispatch_async(v11, block);

LABEL_6:
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      [(NSMutableSet *)self->_links removeObject:v4];
      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      [0 removeObject:v4];
      queue = 0;
    }
    id v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105384;
    block[3] = &unk_1001C8840;
    block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);

    sub_1001053E4((uint64_t)self);
  }
  else
  {
    id v8 = sub_100105184();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_100105184();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      queue = 0;
    }
    id v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105920;
    block[3] = &unk_1001C8840;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = sub_100105184();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_100105184();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      queue = 0;
    }
    id v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105B64;
    block[3] = &unk_1001C8840;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = sub_100105184();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_100105184();
      _NRLogWithArgs();
    }
  }
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      [(NSMutableSet *)self->_links addObject:v4];
      queue = self->super._queue;
    }
    else
    {
      dispatch_assert_queue_V2(0);
      [0 addObject:v4];
      queue = 0;
    }
    id v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105DC8;
    block[3] = &unk_1001C8840;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = sub_100105184();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v10 = sub_100105184();
      _NRLogWithArgs();
    }
  }
}

- (id)copyStatusString
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init((Class)NSMutableString);
  id v6 = [(NRLinkManagerQuickRelay *)self copyName];
  [v5 appendFormat:@"\nName: %@", v6];

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    [v5 appendFormat:@"\nLinkManager type: %@", StringFromNRLinkType];

    uint64_t state = self->super._state;
  }
  else
  {
    id v11 = (void *)createStringFromNRLinkType();
    [v5 appendFormat:@"\nLinkManager type: %@", v11];

    uint64_t state = 0;
  }
  id v9 = sub_1000AB278(state);
  [v5 appendFormat:@"\nState: %@", v9];

  return v5;
}

- (id)copyName
{
  return @"Link Manager - QuickRelay";
}

- (void)dealloc
{
  if (qword_1001F4B18 != -1) {
    dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B18 != -1) {
      dispatch_once(&qword_1001F4B18, &stru_1001C78F8);
    }
    uint64_t v5 = 89;
    id v6 = self;
    v3 = "";
    id v4 = "-[NRLinkManagerQuickRelay dealloc]";
    _NRLogWithArgs();
  }
  [(NRLinkManagerQuickRelay *)self invalidateManager];
  v7.receiver = self;
  v7.super_class = (Class)NRLinkManagerQuickRelay;
  [(NRLinkManagerQuickRelay *)&v7 dealloc];
}

- (void)invalidateManager
{
  v6.receiver = self;
  v6.super_class = (Class)NRLinkManagerQuickRelay;
  [(NRLinkManager *)&v6 invalidateManager];
  if (self)
  {
    if (self->_pathEvaluator)
    {
      nw_path_evaluator_cancel();
      pathEvaluator = self->_pathEvaluator;
      self->_pathEvaluator = 0;
    }
    apsConnection = self->_apsConnection;
    if (apsConnection)
    {
      [(APSConnection *)apsConnection setDelegate:0];
      uint64_t v5 = self->_apsConnection;
      self->_apsConnection = 0;
    }
  }
}

- (void)cancel
{
  if (self) {
    self->super._uint64_t state = 1004;
  }
}

@end