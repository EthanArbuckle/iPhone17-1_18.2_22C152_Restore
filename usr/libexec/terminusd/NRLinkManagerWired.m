@interface NRLinkManagerWired
- (id)copyName;
- (id)copyStatusString;
- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerWired

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUIDToPeerDictionary, 0);
  objc_storeStrong((id *)&self->_interfaceToLocalAddressDictionary, 0);
  objc_storeStrong((id *)&self->_interfaceToV6Addresses, 0);
  objc_storeStrong((id *)&self->_interfaceToV4Addresses, 0);
  objc_storeStrong((id *)&self->_wiredInterfaceNameList, 0);

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
    block[2] = sub_1000CFEB4;
    block[3] = &unk_1001C8868;
    id v15 = v6;
    v16 = self;
    id v17 = v7;
    id v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
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
    id v10 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000CFBB4();
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
    block[2] = sub_1000D01D4;
    block[3] = &unk_1001C8840;
    void block[4] = self;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
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
    id v11 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000CFBB4();
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
    block[2] = sub_1000D180C;
    block[3] = &unk_1001C8840;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
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
    id v11 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000CFBB4();
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
    block[2] = sub_1000D1B0C;
    block[3] = &unk_1001C8840;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
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
    id v10 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000CFBB4();
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
    block[2] = sub_1000D1E2C;
    block[3] = &unk_1001C8840;
    id v13 = v4;
    v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
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
  id v6 = [(NRLinkManagerWired *)self copyName];
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
    [v5 appendFormat:@"\nLocal state: %@", self->_interfaceToLocalAddressDictionary];
    nrUUIDToPeerDictionary = self->_nrUUIDToPeerDictionary;
  }
  else
  {
    [v5 appendFormat:@"\nLinks: %@", 0];
    [v5 appendFormat:@"\nLocal state: %@", 0];
    nrUUIDToPeerDictionary = 0;
  }
  [v5 appendFormat:@"\nPeer state: %@", nrUUIDToPeerDictionary];
  return v5;
}

- (id)copyName
{
  return @"Link Manager - Wired";
}

- (void)dealloc
{
  if (qword_1001F4A78 != -1) {
    dispatch_once(&qword_1001F4A78, &stru_1001C7400);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4A78 != -1) {
      dispatch_once(&qword_1001F4A78, &stru_1001C7400);
    }
    id v3 = (id)qword_1001F4A70;
    uint64_t v6 = 119;
    id v7 = [(NRLinkManagerWired *)self copyName];
    id v4 = "";
    id v5 = "-[NRLinkManagerWired dealloc]";
    _NRLogWithArgs();
  }
  [(NRLinkManagerWired *)self invalidateManager];
  v8.receiver = self;
  v8.super_class = (Class)NRLinkManagerWired;
  [(NRLinkManagerWired *)&v8 dealloc];
}

- (void)invalidateManager
{
  v5.receiver = self;
  v5.super_class = (Class)NRLinkManagerWired;
  [(NRLinkManager *)&v5 invalidateManager];
  if (self)
  {
    scdynamicStoreRef = self->_scdynamicStoreRef;
    if (scdynamicStoreRef)
    {
      SCDynamicStoreSetDispatchQueue(scdynamicStoreRef, 0);
      id v4 = self->_scdynamicStoreRef;
      if (v4)
      {
        CFRelease(v4);
        self->_scdynamicStoreRef = 0;
      }
    }
  }
}

- (void)cancel
{
  if (self)
  {
    self->super._uint64_t state = 1004;
    [(NRLinkManager *)self reportEvent:2003];
    [(NRLinkManagerWired *)self invalidateManager];
    links = self->_links;
  }
  else
  {
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableSet *)links copy];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) cancelWithReason:@"Cancelling Wired link manager" v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if (self) {
    id v9 = self->_links;
  }
  else {
    id v9 = 0;
  }
  [(NSMutableSet *)v9 removeAllObjects];
}

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v26 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  dispatch_assert_queue_V2(v6);
  if (!v7)
  {
    id v28 = sub_1000CFBB4();
    int v29 = _NRLogIsLevelEnabled();

    if (v29)
    {
LABEL_11:
      id v30 = sub_1000CFBB4();
      _NRLogWithArgs();

      v24 = 0;
      goto LABEL_7;
    }
LABEL_15:
    v24 = 0;
    goto LABEL_7;
  }
  v34.receiver = self;
  v34.super_class = (Class)NRLinkManagerWired;
  objc_super v8 = [(NRLinkManager *)&v34 initManagerWithQueue:v6 managerDelegate:v7];
  if (!v8)
  {
    id v31 = sub_1000CFBB4();
    int v32 = _NRLogIsLevelEnabled();

    if (v32)
    {
      id v33 = sub_1000CFBB4();
      _NRLogWithArgs();
    }
    self = 0;
    goto LABEL_15;
  }
  uint64_t v9 = (uint64_t)v8;
  v8[8] = 5;
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v11 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v10;

  id v12 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v12;

  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  id v15 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v14;

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  id v17 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = v16;

  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = v18;

  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  v21 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v20;

  [(id)v9 reportEvent:2001];
  v22 = *(id *)(v9 + 24);
  dispatch_assert_queue_V2(v22);

  if (*(_DWORD *)(v9 + 12) != 1003)
  {
    v23 = *(id *)(v9 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D26B0;
    block[3] = &unk_1001C8BA8;
    void block[4] = v9;
    dispatch_async(v23, block);

    sub_1000D274C(v9);
  }
  *(_DWORD *)(v9 + 12) = 1003;
  [(id)v9 reportEvent:2002];
  self = (NRLinkManagerWired *)(id)v9;
  v24 = self;
LABEL_7:

  return v24;
}

@end