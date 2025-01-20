@interface MSDRapportMessageHandler
- (MSDRapportMessageHandler)initWithObserver:(id)a3;
- (MSDRapportMessageHandlerProtocol)observer;
- (NSMutableArray)senderRPClients;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)listenerRPClient;
- (id)_extractRapportOptionsFromMessage:(id)a3;
- (id)_extractRapportPayloadFromMessage:(id)a3;
- (id)_findSenderRPClientForDevice:(id)a3;
- (unint64_t)_getCurrentProtocolVersion;
- (void)_ensureListenerRPClientStartedWithCompletion:(id)a3;
- (void)_ensureSenderRPClientStartedForDevice:(id)a3 withCompletion:(id)a4;
- (void)_invalidateListenerRPClient;
- (void)_invalidateSenderRPClientForDevice:(id)a3;
- (void)_listenForIncomingEventMessageOfID:(id)a3;
- (void)_listenForIncomingRequestMessageOfID:(id)a3;
- (void)_sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5;
- (void)_sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5;
- (void)invalidateOutgoingConnectionForDevice:(id)a3;
- (void)listenForIncomingEventMessageOfID:(id)a3;
- (void)listenForIncomingRequestMessageOfID:(id)a3;
- (void)sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5;
- (void)sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5;
- (void)setListenerRPClient:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSenderRPClients:(id)a3;
@end

@implementation MSDRapportMessageHandler

- (MSDRapportMessageHandler)initWithObserver:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDRapportMessageHandler;
  v5 = [(MSDRapportMessageHandler *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MobileStoreDemo.RapportMessageHandler", 0);
    [(MSDRapportMessageHandler *)v5 setQueue:v6];

    [(MSDRapportMessageHandler *)v5 setObserver:v4];
    v7 = +[NSMutableArray arrayWithCapacity:4];
    [(MSDRapportMessageHandler *)v5 setSenderRPClients:v7];
  }
  return v5;
}

- (void)listenForIncomingRequestMessageOfID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSDRapportMessageHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009AF9C;
  block[3] = &unk_100152040;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)listenForIncomingEventMessageOfID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSDRapportMessageHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B0E0;
  block[3] = &unk_100152040;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if (v10)
  {
    v11 = [(MSDRapportMessageHandler *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009B26C;
    block[3] = &unk_100153900;
    objc_copyWeak(&v16, &location);
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

- (void)sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if (v10)
  {
    v11 = [(MSDRapportMessageHandler *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009B3FC;
    block[3] = &unk_100153900;
    objc_copyWeak(&v16, &location);
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

- (void)invalidateOutgoingConnectionForDevice:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSDRapportMessageHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B544;
  block[3] = &unk_100152040;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_ensureListenerRPClientStartedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  v5 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(MSDRapportMessageHandler *)self listenerRPClient];

    if (v6)
    {
      v7 = [(MSDRapportMessageHandler *)self listenerRPClient];
      v4[2](v4, v7, 0);
    }
    else
    {
      id v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Creating RPCompanionLinkClient for listener!", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      id v9 = objc_alloc_init((Class)RPCompanionLinkClient);
      [(MSDRapportMessageHandler *)self setListenerRPClient:v9];

      id v10 = [(MSDRapportMessageHandler *)self queue];
      v11 = [(MSDRapportMessageHandler *)self listenerRPClient];
      [v11 setDispatchQueue:v10];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10009B870;
      v19[3] = &unk_100151AC8;
      objc_copyWeak(&v20, buf);
      v12 = [(MSDRapportMessageHandler *)self listenerRPClient];
      [v12 setInterruptionHandler:v19];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10009B8F0;
      v17[3] = &unk_100151AC8;
      objc_copyWeak(&v18, buf);
      id v13 = [(MSDRapportMessageHandler *)self listenerRPClient];
      [v13 setInvalidationHandler:v17];

      id v14 = [(MSDRapportMessageHandler *)self listenerRPClient];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10009B970;
      v15[3] = &unk_100153928;
      v15[4] = self;
      id v16 = v4;
      [v14 activateWithCompletion:v15];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_invalidateListenerRPClient
{
  v3 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MSDRapportMessageHandler *)self listenerRPClient];

  if (v4)
  {
    v5 = [(MSDRapportMessageHandler *)self listenerRPClient];
    [v5 setInvalidationHandler:0];

    id v6 = [(MSDRapportMessageHandler *)self listenerRPClient];
    [v6 invalidate];

    [(MSDRapportMessageHandler *)self setListenerRPClient:0];
  }
}

- (void)_listenForIncomingRequestMessageOfID:(id)a3
{
  id v4 = a3;
  v5 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Registering request of ID: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009BC48;
  v8[3] = &unk_1001539A0;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = self;
  [(MSDRapportMessageHandler *)self _ensureListenerRPClientStartedWithCompletion:v8];
  objc_destroyWeak(&v11);

  objc_destroyWeak((id *)buf);
}

- (void)_listenForIncomingEventMessageOfID:(id)a3
{
  id v4 = a3;
  v5 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Registering event of ID: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009C254;
  v8[3] = &unk_1001539F0;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, (id *)buf);
  [(MSDRapportMessageHandler *)self _ensureListenerRPClientStartedWithCompletion:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

- (id)_findSenderRPClientForDevice:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(MSDRapportMessageHandler *)self senderRPClients];
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [v8 destinationDevice];
        id v10 = [v9 identifier];
        id v11 = [v4 rpDevice];
        id v12 = [v11 identifier];
        unsigned __int8 v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_ensureSenderRPClientStartedForDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = [(MSDRapportMessageHandler *)self _findSenderRPClientForDevice:v6];
    if (v9)
    {
      id v10 = [(MSDRapportMessageHandler *)self senderRPClients];
      id v11 = [v10 lastObject];

      if (v11 != v9)
      {
        id v12 = [(MSDRapportMessageHandler *)self senderRPClients];
        [v12 removeObject:v9];

        unsigned __int8 v13 = [(MSDRapportMessageHandler *)self senderRPClients];
        [v13 addObject:v9];
      }
      v7[2](v7, v9, 0);
    }
    else
    {
      id v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Creating RPCompanionLinkClient for device: %{public}@", buf, 0xCu);
      }

      id v15 = [(MSDRapportMessageHandler *)self senderRPClients];
      BOOL v16 = (unint64_t)[v15 count] > 3;

      if (v16)
      {
        long long v17 = sub_100068600();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Removing", buf, 2u);
        }

        long long v18 = [(MSDRapportMessageHandler *)self senderRPClients];
        long long v19 = [v18 firstObject];

        id v20 = [(MSDRapportMessageHandler *)self senderRPClients];
        [v20 removeObjectAtIndex:0];

        [v19 setInvalidationHandler:0];
        [v19 invalidate];
      }
      objc_initWeak((id *)buf, self);
      id v21 = objc_alloc_init((Class)RPCompanionLinkClient);
      v22 = [(MSDRapportMessageHandler *)self queue];
      [v21 setDispatchQueue:v22];

      [v21 setControlFlags:8454];
      v23 = [v6 rpDevice];
      [v21 setDestinationDevice:v23];

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10009CB94;
      v39[3] = &unk_100153A18;
      id v24 = v6;
      id v40 = v24;
      objc_copyWeak(&v41, (id *)buf);
      [v21 setInterruptionHandler:v39];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10009CBF8;
      v36[3] = &unk_100153A18;
      id v25 = v24;
      id v37 = v25;
      objc_copyWeak(&v38, (id *)buf);
      [v21 setInvalidationHandler:v36];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10009CC5C;
      v33[3] = &unk_100153A18;
      id v26 = v25;
      id v34 = v26;
      objc_copyWeak(&v35, (id *)buf);
      [v21 setDisconnectHandler:v33];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10009CCC0;
      v28[3] = &unk_100152418;
      id v29 = v26;
      v32 = v7;
      v30 = self;
      id v27 = v21;
      id v31 = v27;
      [v27 activateWithCompletion:v28];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v38);

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_invalidateSenderRPClientForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MSDRapportMessageHandler *)self _findSenderRPClientForDevice:v4];
  if (v6)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Invalidating sender RPCompanionLinkClient for device: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [v6 setInvalidationHandler:0];
    [v6 invalidate];
    id v8 = [(MSDRapportMessageHandler *)self senderRPClients];
    [v8 removeObject:v6];
  }
}

- (void)_sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(MSDRapportMessageHandler *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 identifier];
  unsigned __int8 v13 = sub_100068600();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Sending request of ID: %{public}@ to device: %{public}@", buf, 0x16u);
  }

  if (!v9)
  {
    CFStringRef v15 = @"Cannot find specified demo peer.";
    uint64_t v16 = 3727741104;
LABEL_8:
    id v14 = +[NSError errorDomainMSDWithCode:v16 message:v15];
    v10[2](v10, 0, v14);
    goto LABEL_9;
  }
  if (([v9 authenticated] & 1) == 0)
  {
    uint64_t v16 = 3727741106;
    CFStringRef v15 = @"Cannot operate on demo peer not already authenticated.";
    goto LABEL_8;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009D0B0;
  v17[3] = &unk_100153A68;
  id v18 = v9;
  v22 = v10;
  long long v19 = self;
  id v20 = v8;
  id v21 = v12;
  [(MSDRapportMessageHandler *)self _ensureSenderRPClientStartedForDevice:v18 withCompletion:v17];

  id v14 = v18;
LABEL_9:
}

- (void)_sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  id v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v11;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Sending event of ID: %{public}@ to device: %{public}@", buf, 0x16u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009D5B0;
  v17[3] = &unk_100153A68;
  id v21 = v11;
  id v22 = v10;
  id v18 = v9;
  long long v19 = self;
  id v20 = v8;
  id v13 = v11;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  [(MSDRapportMessageHandler *)self _ensureSenderRPClientStartedForDevice:v16 withCompletion:v17];
}

- (unint64_t)_getCurrentProtocolVersion
{
  if (!os_variant_has_internal_content()) {
    return 2;
  }
  v2 = +[MSDTestPreferences sharedInstance];
  v3 = [v2 mockPeerProtocolVersion];

  if (v3)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Use mock protocol version: %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v5 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 2;
  }

  return v5;
}

- (id)_extractRapportPayloadFromMessage:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 payload];

  if (v6)
  {
    int v7 = [v4 payload];
    [v5 addEntriesFromDictionary:v7];
  }
  if ([(MSDRapportMessageHandler *)self _getCurrentProtocolVersion])
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:[(MSDRapportMessageHandler *)self _getCurrentProtocolVersion]];
    [v5 setObject:v8 forKey:@"ProtocolVersion"];
  }
  id v9 = [v5 copy];

  return v9;
}

- (id)_extractRapportOptionsFromMessage:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10009DBBC;
  id v13 = sub_10009DBCC;
  id v14 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v4 = [v3 options];

  if (v4)
  {
    unint64_t v5 = [v3 options];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009DBD4;
    v8[3] = &unk_100153AB8;
    void v8[4] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  id v6 = [(id)v10[5] copy];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RPCompanionLinkClient)listenerRPClient
{
  return self->_listenerRPClient;
}

- (void)setListenerRPClient:(id)a3
{
}

- (NSMutableArray)senderRPClients
{
  return self->_senderRPClients;
}

- (void)setSenderRPClients:(id)a3
{
}

- (MSDRapportMessageHandlerProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDRapportMessageHandlerProtocol *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_senderRPClients, 0);
  objc_storeStrong((id *)&self->_listenerRPClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end