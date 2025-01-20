@interface BTVCLinkClient
+ (id)btvcLinkClient;
- (BTVCLinkClient)init;
- (id)addBTVCBonjourLinkDelegate:(id)a3;
- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)btvcBonjourLink:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)btvcBonjourLink:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)btvcBonjourLink:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)btvcBonjourLink:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)removeBTVCBonjourLinkDelegate:(id)a3;
@end

@implementation BTVCLinkClient

+ (id)btvcLinkClient
{
  if (qword_100A120D8 != -1) {
    dispatch_once(&qword_100A120D8, &stru_1009A33D8);
  }
  v2 = (void *)qword_100A120E0;

  return v2;
}

- (BTVCLinkClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTVCLinkClient;
  v2 = [(BTVCLinkClient *)&v5 init];
  if (v2)
  {
    v3 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[BTVCLinkClient init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
  }
  return v2;
}

- (id)addBTVCBonjourLinkDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[BTVCLinkClient addBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_btvcBonjourLink)
  {
    v7 = [[BTVCBonjourLink alloc] initWithDelegate:v6 queue:v6->_dispatchQueue];
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = v7;
  }
  btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  if (!btvcBonjourLinkDelegates)
  {
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v11 = v6->_btvcBonjourLinkDelegates;
    v6->_btvcBonjourLinkDelegates = v10;

    btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  }
  [(NSMutableSet *)btvcBonjourLinkDelegates addObject:v4];
  v12 = v6->_btvcBonjourLink;
  objc_sync_exit(v6);

  return v12;
}

- (void)removeBTVCBonjourLinkDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  [(NSMutableSet *)v6->_btvcBonjourLinkDelegates removeObject:v4];
  if (![(NSMutableSet *)v6->_btvcBonjourLinkDelegates count])
  {
    v7 = qword_100A19FE8;
    if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalidate BTVCBonjourLink", (uint8_t *)&v9, 0xCu);
    }
    [(BTVCBonjourLink *)v6->_btvcBonjourLink invalidate];
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = 0;
  }
  objc_sync_exit(v6);
}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  id v12 = a3;
  id v4 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[BTVCLinkClient btvcBonjourLinkDidUpdateState:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  objc_super v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(NSMutableSet *)v5->_btvcBonjourLinkDelegates allObjects];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v10 dispatchQueue];
          if (v11 == v5->_dispatchQueue)
          {
            [v10 btvcBonjourLinkDidUpdateState:v12];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D8A70;
            block[3] = &unk_100998510;
            block[4] = v10;
            id v14 = v12;
            dispatch_async(v11, block);
          }
        }
        else
        {
          v11 = 0;
        }

        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  id v15 = a3;
  v6 = qword_100A19FE8;
  if (os_log_type_enabled((os_log_t)qword_100A19FE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[BTVCLinkClient btvcBonjourLink:didStartAdvertisingType:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = v7;
  int v9 = [(NSMutableSet *)v7->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didStartAdvertisingType:a4];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D8D24;
            block[3] = &unk_1009996F8;
            block[4] = v13;
            id v17 = v15;
            int64_t v18 = a4;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  id v15 = a3;
  id v16 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didStopAdvertisingType:a4 withError:v16];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D8FBC;
            block[3] = &unk_1009A3400;
            block[4] = v13;
            id v18 = v15;
            int64_t v20 = a4;
            id v19 = v16;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  id v14 = a3;
  v6 = self;
  objc_sync_enter(v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [(NSMutableSet *)v6->_btvcBonjourLinkDelegates allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = [v12 dispatchQueue];
          if (v13 == v7->_dispatchQueue)
          {
            [v12 btvcBonjourLink:v14 didDeferAdvertisingType:a4];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D921C;
            block[3] = &unk_1009996F8;
            block[4] = v12;
            id v16 = v14;
            int64_t v17 = a4;
            dispatch_async(v13, block);
          }
        }
        else
        {
          v13 = 0;
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v15 = a3;
  id v16 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didFailToStartAdvertisingOfType:a4 withError:v16];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D94B4;
            block[3] = &unk_1009A3400;
            block[4] = v13;
            id v18 = v15;
            int64_t v20 = a4;
            id v19 = v16;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v14 = a3;
  v6 = self;
  objc_sync_enter(v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [(NSMutableSet *)v6->_btvcBonjourLinkDelegates allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = [v12 dispatchQueue];
          if (v13 == v7->_dispatchQueue)
          {
            [v12 btvcBonjourLink:v14 didStartScanningForType:a4];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D9714;
            block[3] = &unk_1009996F8;
            block[4] = v12;
            id v16 = v14;
            int64_t v17 = a4;
            dispatch_async(v13, block);
          }
        }
        else
        {
          v13 = 0;
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v15 = a3;
  id v16 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didFailToStartScanningForType:a4 WithError:v16];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002D99AC;
            block[3] = &unk_1009A3400;
            block[4] = v13;
            id v18 = v15;
            int64_t v20 = a4;
            id v19 = v16;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v12 = self;
  objc_sync_enter(v12);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = v12;
  v13 = [(NSMutableSet *)v12->_btvcBonjourLinkDelegates allObjects];
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    id v19 = v26;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v13);
        }
        int64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector())
        {
          id v18 = [v17 dispatchQueue:v19];
          if (v18 == obj->_dispatchQueue)
          {
            [v17 btvcBonjourLink:v20 didDiscoverType:a4 withData:v21 fromPeer:v22 peerInfo:v23];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v26[0] = sub_1002D9CB8;
            v26[1] = &unk_1009A3428;
            v26[2] = v17;
            id v27 = v20;
            int64_t v31 = a4;
            id v28 = v21;
            id v29 = v22;
            id v30 = v23;
            dispatch_async(v18, block);
          }
        }
        else
        {
          id v18 = 0;
        }

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  objc_sync_exit(obj);
}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  id v15 = a3;
  id v16 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didLosePeer:v16 type:a5];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            void block[2] = sub_1002D9F50;
            block[3] = &unk_1009A3400;
            block[4] = v13;
            id v18 = v15;
            id v19 = v16;
            int64_t v20 = a5;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v10 = self;
  objc_sync_enter(v10);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = v10;
  uint64_t v11 = [(NSMutableSet *)v10->_btvcBonjourLinkDelegates allObjects];
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    int64_t v17 = v23;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector())
        {
          id v16 = [v15 dispatchQueue:v17];
          if (v16 == obj->_dispatchQueue)
          {
            [v15 btvcBonjourLink:v18 didConnectToPeer:v19 transport:a5 error:v20];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v23[0] = sub_1002DA228;
            v23[1] = &unk_1009A3450;
            v23[2] = v15;
            id v24 = v18;
            id v25 = v19;
            int64_t v27 = a5;
            id v26 = v20;
            dispatch_async(v16, block);
          }
        }
        else
        {
          id v16 = 0;
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  objc_sync_exit(obj);
}

- (void)btvcBonjourLink:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    id v15 = v20;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue:v15];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v16 didDisconnectFromPeer:v17 error:v18];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v20[0] = sub_1002DA4E8;
            v20[1] = &unk_1009A3478;
            v20[2] = v13;
            id v21 = v16;
            id v22 = v17;
            id v23 = v18;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v10 = self;
  objc_sync_enter(v10);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = [(NSMutableSet *)v10->_btvcBonjourLinkDelegates allObjects];
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    id v17 = v23;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector())
        {
          id v16 = [v15 dispatchQueue:v17];
          if (v16 == v10->_dispatchQueue)
          {
            [v15 btvcBonjourLink:v18 didSendData:v19 toPeer:v20 error:v21];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v23[0] = sub_1002DA7D8;
            v23[1] = &unk_1009A34A0;
            v23[2] = v15;
            id v24 = v18;
            id v25 = v19;
            id v26 = v20;
            id v27 = v21;
            dispatch_async(v16, block);
          }
        }
        else
        {
          id v16 = 0;
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

- (void)btvcBonjourLink:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(NSMutableSet *)v8->_btvcBonjourLinkDelegates allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    id v15 = v20;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v13 dispatchQueue:v15];
          if (v14 == v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v16 didReceiveData:v17 fromPeer:v18];
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v20[0] = sub_1002DAA98;
            v20[1] = &unk_1009A3478;
            v20[2] = v13;
            id v21 = v16;
            id v22 = v17;
            id v23 = v18;
            dispatch_async(v14, block);
          }
        }
        else
        {
          id v14 = 0;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLinkDelegates, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end