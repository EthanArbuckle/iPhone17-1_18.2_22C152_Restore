@interface NRLinkManagerFixedInterface
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerFixedInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedInterfaceName, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);

  objc_storeStrong((id *)&self->_links, 0);
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    [0 reportEvent:2008];
    id v13 = v6;
    queue = 0;
    goto LABEL_10;
  }
  v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  [(NRLinkManager *)self reportEvent:2008];
  if (self->super._state != 1004)
  {
    id v9 = v6;
    queue = self->super._queue;
LABEL_10:
    v11 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100103420;
    block[3] = &unk_1001C8868;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    id v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    _NRLogWithArgs();
  }
LABEL_11:
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v10 = sub_1001036C0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1001036C0();
    _NRLogWithArgs();
    goto LABEL_14;
  }
  [(NRLinkManager *)self reportEvent:2007];
  if (!self)
  {
    [0 removeObject:v4];
    id v7 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    [(NSMutableSet *)self->_links removeObject:v4];
    id v7 = self->super._queue;
LABEL_13:
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100103714;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    _NRLogWithArgs();
  }
LABEL_15:
}

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v11 = sub_1001036C0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1001036C0();
    _NRLogWithArgs();
    goto LABEL_14;
  }
  [(NRLinkManager *)self reportEvent:2006];
  if (!self)
  {
    id v13 = v4;
    v8 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    id v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010402C;
    block[3] = &unk_1001C8840;
    id v15 = v4;
    id v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    _NRLogWithArgs();
  }
LABEL_15:
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v11 = sub_1001036C0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1001036C0();
    _NRLogWithArgs();
    goto LABEL_14;
  }
  [(NRLinkManager *)self reportEvent:2005];
  if (!self)
  {
    id v13 = v4;
    v8 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    id v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010432C;
    block[3] = &unk_1001C8840;
    id v15 = v4;
    id v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    _NRLogWithArgs();
  }
LABEL_15:
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v10 = sub_1001036C0();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1001036C0();
    _NRLogWithArgs();
    goto LABEL_14;
  }
  [(NRLinkManager *)self reportEvent:2004];
  if (!self)
  {
    [0 addObject:v4];
    id v7 = 0;
    goto LABEL_13;
  }
  if (self->super._state != 1004)
  {
    [(NSMutableSet *)self->_links addObject:v4];
    id v7 = self->super._queue;
LABEL_13:
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010464C;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    _NRLogWithArgs();
  }
LABEL_15:
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
  id v6 = [(NRLinkManagerFixedInterface *)self copyName];
  [v5 appendFormat:@"\nName: %@", v6];

  StringFromNRLinkType = (void *)createStringFromNRLinkType();
  [v5 appendFormat:@"\nLinkManager type: %@", StringFromNRLinkType];

  if (self) {
    uint64_t state = self->super._state;
  }
  else {
    uint64_t state = 0;
  }
  id v9 = sub_1000AB278(state);
  [v5 appendFormat:@"\nState: %@", v9];

  if (self)
  {
    [v5 appendFormat:@"\nLinks: %@", self->_links];
    [v5 appendFormat:@"\nFixed Interface: %@", self->_fixedInterfaceName];
    [v5 appendFormat:@"\nLocal Endpoint: %@", self->_localEndpoint];
    peerEndpoint = self->_peerEndpoint;
  }
  else
  {
    [v5 appendFormat:@"\nLinks: %@", 0];
    [v5 appendFormat:@"\nFixed Interface: %@", 0];
    [v5 appendFormat:@"\nLocal Endpoint: %@", 0];
    peerEndpoint = 0;
  }
  [v5 appendFormat:@"\nRemote Endpoint: %@", peerEndpoint];
  return v5;
}

- (id)copyName
{
  return @"Link Manager - FixedInterface";
}

- (void)dealloc
{
  if (qword_1001F4B08 != -1) {
    dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B08 != -1) {
      dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
    }
    id v3 = (id)qword_1001F4B00;
    uint64_t v6 = 97;
    id v7 = [(NRLinkManagerFixedInterface *)self copyName];
    id v4 = "";
    id v5 = "-[NRLinkManagerFixedInterface dealloc]";
    _NRLogWithArgs();
  }
  [(NRLinkManagerFixedInterface *)self invalidateManager];
  v8.receiver = self;
  v8.super_class = (Class)NRLinkManagerFixedInterface;
  [(NRLinkManagerFixedInterface *)&v8 dealloc];
}

- (void)invalidateManager
{
  v2.receiver = self;
  v2.super_class = (Class)NRLinkManagerFixedInterface;
  [(NRLinkManager *)&v2 invalidateManager];
}

- (void)cancel
{
  if (self)
  {
    id v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    [(NRLinkManager *)self reportEvent:2003];
    if (self->super._state == 1004)
    {
      if (qword_1001F4B08 != -1) {
        dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4B08 != -1) {
          dispatch_once(&qword_1001F4B08, &stru_1001C78B0);
        }
        _NRLogWithArgs();
      }
      return;
    }
    self->super._uint64_t state = 1004;
    dynamicStoreRef = self->_dynamicStoreRef;
    if (dynamicStoreRef)
    {
      CFRelease(dynamicStoreRef);
      self->_dynamicStoreRef = 0;
    }
    [(NRLinkManagerFixedInterface *)self invalidateManager];
    links = self->_links;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableSet *)links copy];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) cancelWithReason:@"Cancelling all links"];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (self) {
    id v11 = self->_links;
  }
  else {
    id v11 = 0;
  }
  [(NSMutableSet *)v11 removeAllObjects];
}

@end