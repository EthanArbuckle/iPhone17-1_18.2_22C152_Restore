@interface STSWifiSession
- (BOOL)isConnected;
- (void)altCarrierSendData:(id)a3 completion:(id)a4;
- (void)connectionCancelled:(id)a3;
- (void)connectionEstablishmentTimedout;
- (void)processRequest:(id)a3 connection:(id)a4;
- (void)publisherStarted:(int64_t)a3 error:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidInvalidate:(id)a3 error:(id)a4;
- (void)sessionTimedout;
@end

@implementation STSWifiSession

- (void)connectionEstablishmentTimedout
{
  if (a1)
  {
    sub_10001D8E0(*(void *)(a1 + 56));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    id v2 = [*(id *)(a1 + 64) copy];
    [*(id *)(a1 + 64) removeAllObjects];
    v3 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          sub_10001D8E0(*(void *)(*((void *)&v17 + 1) + 8 * (void)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    sub_100026588(*(void **)(a1 + 40), v9, v10, v11, v12, v13, v14, v15);
    v16 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    *(void *)(a1 + 48) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
  }
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession sessionDidConnect:]", 159, self, @"connectionHandle=%@", v5, v6, (uint64_t)v4);
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    [(NSMutableArray *)self->_connectionHandles addObject:v4];
    unint64_t connectionState = self->_connectionState;
    self->_unint64_t connectionState = 1;
  }
  else
  {
    [0 addObject:v4];
    unint64_t connectionState = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v8 = +[NSDate now];
  v19[0] = @"transactionStartEventTime";
  v19[1] = @"transportType";
  v20[0] = v8;
  v20[1] = &off_10005AE90;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v10 = +[STSAnalyticsLogger sharedCALogger];
  [v10 postISOTransactionEvent:v9 prepOnly:1];

  if (self && (WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parent)) != 0)
  {
    uint64_t v12 = WeakRetained;
    uint64_t v13 = (unsigned __int8 *)WeakRetained[4];
    if (v13)
    {
      int v14 = v13[8];

      if (v14) {
        sub_100022FC4(self, v4);
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_100022DE8((id **)self);
  uint64_t v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (!v15 || !v15[8])
  {

    if (connectionState == 1) {
      goto LABEL_21;
    }
    if (!self)
    {
LABEL_20:
      [(STSWifiSession *)self altCarrierConnectedWithStatus:0];

      goto LABEL_21;
    }
LABEL_19:
    self = (STSWifiSession *)objc_loadWeakRetained((id *)&self->_carrierListener);
    goto LABEL_20;
  }
  if (!self)
  {

    if (connectionState == 1) {
      goto LABEL_21;
    }
    self = 0;
    goto LABEL_20;
  }
  BOOL useHTTPServerOnPublisher = self->_useHTTPServerOnPublisher;

  if (useHTTPServerOnPublisher)
  {
    handoverSession = self->_handoverSession;
    if (handoverSession) {
      handoverSession = (STSWifiHandoverSession *)handoverSession->_workQueue;
    }
    long long v18 = handoverSession;
    sub_10001D408((uint64_t)v4, self, v18);
  }
  if (connectionState != 1) {
    goto LABEL_19;
  }
LABEL_21:
}

- (void)sessionDidInvalidate:(id)a3 error:(id)a4
{
  id v5 = a4;
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession sessionDidInvalidate:error:]", 195, self, @"error=%@", v6, v7, (uint64_t)v5);
  os_unfair_lock_lock(&self->_lock);
  if (!self)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)0xC);
    goto LABEL_6;
  }
  unint64_t connectionState = self->_connectionState;
  self->_unint64_t connectionState = 2;
  os_unfair_lock_unlock(&self->_lock);
  WeakRetained = (STSWifiSession *)objc_loadWeakRetained((id *)&self->_carrierListener);
  self = WeakRetained;
  if (!connectionState)
  {
LABEL_6:
    WeakRetained = self;
    uint64_t v10 = 3;
    goto LABEL_7;
  }
  if (connectionState == 1)
  {
    uint64_t v10 = 1;
LABEL_7:
    [(STSWifiSession *)WeakRetained altCarrierDisconnectedWithStatus:v10];
  }
  uint64_t v11 = +[NSDate now];
  v16[0] = @"transactionEndEventTime";
  v16[1] = @"errorCode";
  v17[0] = v11;
  id v12 = [v5 code];

  uint64_t v13 = +[NSNumber numberWithInteger:v12];
  v17[1] = v13;
  int v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v15 = +[STSAnalyticsLogger sharedCALogger];
  [v15 postISOTransactionEvent:v14 prepOnly:0];
}

- (void)connectionCancelled:(id)a3
{
  id v4 = a3;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiSession connectionCancelled:]", 218, self, &stru_100055900, v5, v6, v10);
  sub_10001D8E0((uint64_t)v4);
  os_unfair_lock_lock(&self->_lock);
  if (!self)
  {
    [0 removeObject:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)0xC);
    id WeakRetained = 0;
    goto LABEL_6;
  }
  [(NSMutableArray *)self->_connectionHandles removeObject:v4];

  unint64_t connectionState = self->_connectionState;
  self->_unint64_t connectionState = 2;
  os_unfair_lock_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carrierListener);
  if (!connectionState)
  {
LABEL_6:
    id v11 = WeakRetained;
    uint64_t v9 = 3;
    goto LABEL_7;
  }
  if (connectionState != 1) {
    goto LABEL_8;
  }
  id v11 = WeakRetained;
  uint64_t v9 = 1;
LABEL_7:
  [WeakRetained altCarrierDisconnectedWithStatus:v9];
  id WeakRetained = v11;
LABEL_8:
}

- (void)publisherStarted:(int64_t)a3 error:(id)a4
{
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession publisherStarted:error:]", 237, self, @"TCP/IP port=%ld, error=%@", v4, v5, a3);
}

- (void)altCarrierSendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, STSWifiHandoverConnectionHandle *))a4;
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    connectionHandles = self->_connectionHandles;
  }
  else {
    connectionHandles = 0;
  }
  id v9 = [(NSMutableArray *)connectionHandles count];
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession altCarrierSendData:completion:]", 250, self, @"AC not connected", v10, v11, v51);
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    *(void *)buf = off_100066190;
    v16 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v70 count:1];
    long long v17 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:8 userInfo:v16];

    v7[2](v7, v17);
    goto LABEL_40;
  }
  id v12 = sub_1000261A8();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WifiSession_SendData", "", buf, 2u);
  }

  uint64_t v13 = sub_100022DE8((id **)self);
  int v14 = (void *)v13;
  if (!v13 || !*(unsigned char *)(v13 + 8))
  {
    if (self && (WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parent), (long long v19 = WeakRetained) != 0))
    {
      long long v20 = WeakRetained[4];
      if (v20)
      {
        BOOL v21 = v20[8] != 0;
LABEL_14:

        BOOL v15 = !v21;
        goto LABEL_15;
      }
    }
    else
    {
      long long v20 = 0;
      long long v19 = 0;
    }
    BOOL v21 = 0;
    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_15:

  id v22 = [v6 length];
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession altCarrierSendData:completion:]", 259, self, @"Data len=%ld,subscriberWithHttpClient=%d, httpServerStarted=%d", v23, v24, (uint64_t)v22);
  sub_100022DE8((id **)self);
  v25 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v25 && v25[8])
  {
    if (!self)
    {

      os_unfair_lock_lock((os_unfair_lock_t)0xC);
      v34 = 0;
      v46 = 0;
      if (v15) {
        goto LABEL_25;
      }
LABEL_33:
      long long v17 = [(NSMutableArray *)v46 firstObject];
      os_unfair_lock_unlock(&self->_lock);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100024290;
      v54[3] = &unk_1000550E0;
      v54[4] = self;
      v55 = v7;
      sub_10001D30C((uint64_t)v17, v6, v54);

      goto LABEL_40;
    }
    BOOL v26 = !self->_useHTTPServerOnPublisher;

    if (!v26)
    {
      id v27 = [objc_alloc((Class)NSURL) initWithString:&stru_100055900];
      id v28 = v6;
      id v29 = objc_alloc_init((Class)NSMutableDictionary);
      [v29 setObject:@"application/CBOR" forKeyedSubscript:@"Content-Type"];
      v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 length]);
      v31 = [v30 stringValue];
      [v29 setObject:v31 forKeyedSubscript:@"Content-Length"];

      id v32 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v27 statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:v29];
      v33 = [[HTTPServerResponse alloc] initWithResponse:v32 bodyData:v28];

      os_unfair_lock_lock(&self->_lock);
      long long v17 = self->_activeHandle;
      os_unfair_lock_unlock(&self->_lock);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100023FDC;
      v60[3] = &unk_100054EC0;
      v60[4] = self;
      v61 = v7;
      sub_10001D4EC((id *)&v17->super.isa, v33, v60);

      goto LABEL_40;
    }
    os_unfair_lock_lock(&self->_lock);
    if (v15) {
      goto LABEL_24;
    }
LABEL_32:
    v46 = self->_connectionHandles;
    goto LABEL_33;
  }

  os_unfair_lock_lock(&self->_lock);
  if (!v15)
  {
    if (!self)
    {
      v46 = 0;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (self)
  {
LABEL_24:
    v34 = self->_connectionHandles;
    goto LABEL_25;
  }
  v34 = 0;
LABEL_25:
  long long v17 = [(NSMutableArray *)v34 firstObject];
  v53 = sub_10001D0E8((nw_connection_t *)v17);
  os_unfair_lock_unlock(&self->_lock);
  if (v53)
  {
    id v52 = v6;
    id v35 = v53;
    if (self)
    {
      sub_100022DE8((id **)self);
      v36 = (double *)objc_claimAutoreleasedReturnValue();
      if (v36) {
        double v37 = v36[10] + 5.0;
      }
      else {
        double v37 = 5.0;
      }

      v38 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      v39 = +[NSURLSession sessionWithConfiguration:v38];
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession _send:remoteURL:]", 423, self, @"Remote: %@", v40, v41, (uint64_t)v35);
      v42 = +[NSMutableURLRequest requestWithURL:v35 cachePolicy:1 timeoutInterval:v37];
      [v42 setHTTPMethod:@"POST"];
      [v42 addValue:@"application/CBOR" forHTTPHeaderField:@"Content-Type"];
      [v42 setHTTPBody:v52];
      objc_initWeak(&location, self);
      NSErrorUserInfoKey v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x3032000000;
      v73 = sub_1000249B0;
      v74 = sub_1000249C0;
      id v75 = 0;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      v65 = sub_1000249C8;
      v66 = &unk_1000550B8;
      v67 = self;
      objc_copyWeak(v69, &location);
      v68 = &v70;
      uint64_t v43 = [v39 dataTaskWithRequest:v42 completionHandler:buf];
      NSErrorUserInfoKey v44 = v71[5];
      v71[5] = (NSErrorUserInfoKey)v43;

      [(NSString *)v71[5] resume];
      _Block_object_dispose(&v70, 8);

      objc_destroyWeak(v69);
      objc_destroyWeak(&location);
    }
    v45 = 0;
  }
  else
  {
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    *(void *)buf = off_100066160;
    v47 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v70 count:1];
    v45 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v47];
  }
  v48 = sub_1000261A8();
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WifiSession_SendData", "", buf, 2u);
  }

  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024210;
  block[3] = &unk_100055130;
  id v57 = v45;
  v58 = self;
  v59 = v7;
  id v50 = v45;
  dispatch_async(queue, block);

LABEL_40:
}

- (void)sessionTimedout
{
  id v3 = [objc_alloc((Class)NSURL) initWithString:&stru_100055900];
  id v4 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v3 statusCode:400 HTTPVersion:0 headerFields:0];
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    activeHandle = self->_activeHandle;
  }
  else {
    activeHandle = 0;
  }
  id v6 = activeHandle;
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v7 = [[HTTPServerResponse alloc] initWithResponse:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000245D8;
  v8[3] = &unk_100055068;
  v8[4] = self;
  sub_10001D4EC(v6, v7, v8);
}

- (BOOL)isConnected
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v2) {
    LOBYTE(v2) = v2->_connectionState == 1;
  }
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)processRequest:(id)a3 connection:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (id *)a4;
  id v8 = [objc_alloc((Class)NSURL) initWithString:&stru_100055900];
  id v9 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v8 statusCode:400 HTTPVersion:0 headerFields:0];
  uint64_t v10 = [v6 HTTPMethod];
  uint64_t v11 = [v10 uppercaseString];
  unsigned __int8 v12 = [v11 isEqualToString:@"POST"];

  if (v12)
  {
    BOOL v15 = [v6 valueForHTTPHeaderField:@"Content-Type"];
    v16 = v15;
    if (v15
      && ([(HTTPServerResponse *)v15 isEqualToString:@"application/CBOR"] & 1) != 0)
    {
      os_unfair_lock_lock(&self->_lock);
      if (self)
      {
        if (self->_activeHandle)
        {
          os_unfair_lock_unlock(&self->_lock);
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession processRequest:connection:]", 391, self, @"One outstanding request in progress", v17, v18, v22[0]);
          long long v19 = (HTTPServerResponse *)[objc_alloc((Class)NSHTTPURLResponse) initWithURL:v8 statusCode:503 HTTPVersion:0 headerFields:0];
          long long v20 = [[HTTPServerResponse alloc] initWithResponse:v19];
          sub_10001D4EC(v7, v20, 0);

LABEL_9:
          goto LABEL_10;
        }
        sub_100018290((uint64_t)self, v7);
        os_unfair_lock_unlock(&self->_lock);
        queue = self->_queue;
      }
      else
      {
        sub_100018290(0, v7);
        os_unfair_lock_unlock((os_unfair_lock_t)0xC);
        queue = 0;
      }
      v22[0] = (uint64_t)_NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = (uint64_t)sub_100024934;
      v22[3] = (uint64_t)&unk_100054C50;
      v22[4] = (uint64_t)self;
      id v23 = v6;
      dispatch_async(queue, v22);

      goto LABEL_10;
    }
    long long v19 = [[HTTPServerResponse alloc] initWithResponse:v9];
    sub_10001D4EC(v7, v19, 0);
    goto LABEL_9;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession processRequest:connection:]", 370, self, @"Expected POST command on HTTP request", v13, v14, v22[0]);
  v16 = [[HTTPServerResponse alloc] initWithResponse:v9];
  sub_10001D4EC(v7, v16, 0);
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpServerHandle, 0);
  objc_storeStrong((id *)&self->_connectionHandles, 0);
  objc_storeStrong((id *)&self->_activeHandle, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_carrierListener);

  objc_destroyWeak((id *)&self->_parent);
}

@end