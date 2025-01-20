@interface STIDSMessageTransport
- (NSMutableSet)pendingAcknowledgementIdentifiers;
- (OS_dispatch_queue)queue;
- (STIDSMessageTransport)initWithPrimitives:(id)a3 messageAddressMap:(id)a4 messageIdentifierMap:(id)a5 addressValidator:(id)a6 userAliasResolver:(id)a7 returnAddressProvider:(id)a8 transportQueue:(id)a9;
- (STIDSMessageTransportMessageAddressMap)messageAddressMap;
- (STIDSMessageTransportMessageIdentifierMap)messageIdentifierMap;
- (STIDSTransportAddressValidator)addressValidator;
- (STIDSTransportPrimitiveDestinationReachabilityMap)destinationReachabilityMap;
- (STIDSTransportPrimitives)primitives;
- (STMessageTransportDelegate)delegate;
- (STTransportServiceReturnAddressProvider)returnAddressProvider;
- (STUserAliasResolver)userAliasResolver;
- (id)_prepareToSendToAddresses:(id)a3;
- (id)_reachabilityMapFromDestinations:(id)a3;
- (id)_refreshReachabilityForDestinations:(id)a3;
- (id)_sendMessage:(id)a3 toReachableDestinations:(id)a4 fromAddress:(id)a5;
- (id)sendMessage:(id)a3 toAddresses:(id)a4 fromAddress:(id)a5;
- (os_unfair_lock_s)destinationReachabilityMapLock;
- (void)_isCapabilityEnabledForUser:(id)a3 capability:(id)a4 completionHandler:(id)a5;
- (void)_mightSendMessage:(id)a3 toDestinationsWithUnknownReachability:(id)a4;
- (void)_sendAcknowledgementMessageForResponseIdentifier:(id)a3 toDestination:(id)a4;
- (void)_willSendMessage:(id)a3 usingDestinationReachabilityMap:(id)a4;
- (void)primitives:(id)a3 didDeliverMessageWithPrimitiveIdentifier:(id)a4 toPrimitiveDestination:(id)a5;
- (void)primitives:(id)a3 didObserveUpdatedPrimitiveDestinationReachabilityMap:(id)a4;
- (void)primitives:(id)a3 didReceiveData:(id)a4 fromPrimitiveDestination:(id)a5 primitiveResponseIdentifier:(id)a6;
- (void)primitives:(id)a3 didSendMessageWithPrimitiveIdentifier:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDestinationReachabilityMap:(id)a3;
- (void)setDestinationReachabilityMapLock:(os_unfair_lock_s)a3;
- (void)stopTrackingMessageWithIdentifier:(id)a3;
@end

@implementation STIDSMessageTransport

- (STIDSMessageTransport)initWithPrimitives:(id)a3 messageAddressMap:(id)a4 messageIdentifierMap:(id)a5 addressValidator:(id)a6 userAliasResolver:(id)a7 returnAddressProvider:(id)a8 transportQueue:(id)a9
{
  STTransportServiceReturnAddressProvider *returnAddressProvider;
  STTransportServiceReturnAddressProvider *v34;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v36;
  STIDSTransportPrimitiveDestinationReachabilityMap *v37;
  STIDSTransportPrimitiveDestinationReachabilityMap *destinationReachabilityMap;
  uint64_t v39;
  NSMutableSet *pendingAcknowledgementIdentifiers;
  objc_super v42;

  v15 = (STIDSTransportPrimitives *)a3;
  v16 = (STIDSMessageTransportMessageAddressMap *)a4;
  v17 = (STIDSMessageTransportMessageIdentifierMap *)a5;
  v18 = (STIDSTransportAddressValidator *)a6;
  v19 = (STUserAliasResolver *)a7;
  v20 = (STTransportServiceReturnAddressProvider *)a8;
  v21 = (OS_dispatch_queue *)a9;
  v42.receiver = self;
  v42.super_class = (Class)STIDSMessageTransport;
  v22 = [(STIDSMessageTransport *)&v42 init];
  primitives = v22->_primitives;
  v22->_primitives = v15;
  v24 = v15;

  [(STIDSTransportPrimitives *)v22->_primitives setDelegate:v22];
  messageAddressMap = v22->_messageAddressMap;
  v22->_messageAddressMap = v16;
  v26 = v16;

  messageIdentifierMap = v22->_messageIdentifierMap;
  v22->_messageIdentifierMap = v17;
  v28 = v17;

  addressValidator = v22->_addressValidator;
  v22->_addressValidator = v18;
  v30 = v18;

  userAliasResolver = v22->_userAliasResolver;
  v22->_userAliasResolver = v19;
  v32 = v19;

  returnAddressProvider = v22->_returnAddressProvider;
  v22->_returnAddressProvider = v20;
  v34 = v20;

  queue = v22->_queue;
  v22->_queue = v21;
  v36 = v21;

  v37 = [[STIDSTransportPrimitiveDestinationReachabilityMap alloc] initWithReachableDestinations:0 unreachableDestinations:0 unknownReachabilityDestinations:0];
  destinationReachabilityMap = v22->_destinationReachabilityMap;
  v22->_destinationReachabilityMap = v37;

  v22->_destinationReachabilityMapLock._os_unfair_lock_opaque = 0;
  v39 = objc_opt_new();
  pendingAcknowledgementIdentifiers = v22->_pendingAcknowledgementIdentifiers;
  v22->_pendingAcknowledgementIdentifiers = (NSMutableSet *)v39;

  return v22;
}

- (id)sendMessage:(id)a3 toAddresses:(id)a4 fromAddress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (char *)[v8 contentType];
    if ((unint64_t)(v12 - 1) > 4) {
      CFStringRef v13 = @"Unknown";
    }
    else {
      CFStringRef v13 = off_1002FCA70[(void)(v12 - 1)];
    }
    *(_DWORD *)buf = 136446978;
    v29 = "-[STIDSMessageTransport sendMessage:toAddresses:fromAddress:]";
    __int16 v30 = 2114;
    CFStringRef v31 = v13;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nmessage.contentType: %{public}@, \ntoAddresses: %@, \nfromAddress: %@", buf, 0x2Au);
  }

  v14 = [(STIDSMessageTransport *)self primitives];
  if ([v14 canSend])
  {
    v15 = [(STIDSMessageTransport *)self _prepareToSendToAddresses:v9];
    v16 = [v15 then];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100040F68;
    v25[3] = &unk_1002FC950;
    v25[4] = self;
    id v26 = v8;
    id v27 = v10;
    ((void (**)(void, void *))v16)[2](v16, v25);
    v17 = (STPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = objc_alloc((Class)NSError);
    id v19 = [v18 initWithDomain:STErrorDomain code:27 userInfo:0];
    v20 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100260554();
    }

    v21 = [STPromise alloc];
    v22 = +[STResult failure:v19];
    v23 = [(STIDSMessageTransport *)self queue];
    v17 = [(STPromise *)v21 initWithResolution:v22 onQueue:v23];
  }
  return v17;
}

- (id)_prepareToSendToAddresses:(id)a3
{
  id v4 = a3;
  v5 = [(STIDSMessageTransport *)self messageAddressMap];
  v6 = [v5 primitiveDestinationsForMessageAddresses:v4];

  id v7 = [v6 count];
  id v8 = [v4 count];

  if (v7 == v8)
  {
    id v9 = [(STIDSMessageTransport *)self _reachabilityMapFromDestinations:v6];
    id v10 = [v9 then];
    ((void (**)(void, Block_layout *))v10)[2](v10, &stru_1002FC990);
    v11 = (STPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = objc_alloc((Class)NSError);
    id v9 = [v12 initWithDomain:STErrorDomain code:28 userInfo:0];
    CFStringRef v13 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002605D0();
    }

    v14 = [STPromise alloc];
    v15 = +[STResult failure:v9];
    v16 = [(STIDSMessageTransport *)self queue];
    v11 = [(STPromise *)v14 initWithResolution:v15 onQueue:v16];
  }
  return v11;
}

- (void)_willSendMessage:(id)a3 usingDestinationReachabilityMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 reachableDestinations];
  if ([v8 count])
  {
    id v9 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446723;
      id v33 = "-[STIDSMessageTransport _willSendMessage:usingDestinationReachabilityMap:]";
      __int16 v34 = 2113;
      id v35 = v6;
      __int16 v36 = 2113;
      id v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nMessage: %{private}@ will be sent to: %{private}@", buf, 0x20u);
    }
  }
  id v26 = v8;
  id v10 = [v7 unreachableDestinations];
  id v11 = [v10 mutableCopy];

  id v12 = [v7 unknownReachabilityDestinations];
  [v11 unionSet:v12];

  if ([v11 count])
  {
    CFStringRef v13 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446723;
      id v33 = "-[STIDSMessageTransport _willSendMessage:usingDestinationReachabilityMap:]";
      __int16 v34 = 2113;
      id v35 = v6;
      __int16 v36 = 2113;
      id v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nMessage: %{private}@ will not be sent to destinations: %{private}@", buf, 0x20u);
    }
  }
  v14 = [(STIDSMessageTransport *)self messageAddressMap];
  v15 = [v14 messageAddressesForPrimitiveDestinations:v11];

  v16 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v15 count]);
  id v17 = objc_alloc((Class)NSError);
  id v18 = [v17 initWithDomain:STErrorDomain code:29 userInfo:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = v15;
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        [v16 setObject:v18 forKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * (void)v23)];
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v21);
  }

  v24 = [(STIDSMessageTransport *)self delegate];
  id v25 = [v16 copy];
  [v24 transport:self willSendMessage:v6 errorsByAddress:v25];
}

- (void)_mightSendMessage:(id)a3 toDestinationsWithUnknownReachability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog idsMessageTransport];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446723;
    id v11 = "-[STIDSMessageTransport _mightSendMessage:toDestinationsWithUnknownReachability:]";
    __int16 v12 = 2113;
    id v13 = v6;
    __int16 v14 = 2113;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nMessage: %{private}@ might be sent to destinations: %{private}@", (uint8_t *)&v10, 0x20u);
  }

  id v9 = [(STIDSMessageTransport *)self delegate];
  [v9 transport:self willSendMessage:v6 errorsByAddress:&__NSDictionary0__struct];
}

- (id)_sendMessage:(id)a3 toReachableDestinations:(id)a4 fromAddress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (unint64_t)[v8 contentType] - 1;
  if (v11 > 4) {
    CFStringRef v12 = @"Unknown";
  }
  else {
    CFStringRef v12 = off_1002FCA70[v11];
  }
  id v13 = +[STLog familyMessaging];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v51 = (const char *)v12;
    __int16 v52 = 2082;
    v53 = "-[STIDSMessageTransport _sendMessage:toReachableDestinations:fromAddress:]";
    __int16 v54 = 2112;
    id v55 = v9;
    __int16 v56 = 2112;
    id v57 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[v2] >>>>>>> SEND (message.contentType: %{public}@), %{public}s: destinations: %@, fromAddress: %@", buf, 0x2Au);
  }

  __int16 v14 = [[STMessageTransportReturnAddressedMessage alloc] initWithMessage:v8 returnAddress:v10];
  id v47 = 0;
  id v15 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v47];
  id v16 = v47;
  id v17 = v16;
  if (v15)
  {
    id v43 = v16;
    id v18 = +[STLog familyMessaging];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (const char *)[v15 length];
      *(_DWORD *)buf = 136446466;
      v51 = "-[STIDSMessageTransport _sendMessage:toReachableDestinations:fromAddress:]";
      __int16 v52 = 2050;
      v53 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nSend message size %{public}lu", buf, 0x16u);
    }

    id v20 = [(STIDSMessageTransport *)self userAliasResolver];
    id v21 = [v10 userDSID];
    id v22 = [v20 appleIDForUserDSID:v21];

    if (v22)
    {
      v23 = [(STIDSMessageTransport *)self primitives];
      id v24 = [v23 primitiveDestinationFromRawAddress:v22];

      if (v24)
      {
        id v25 = [(STIDSMessageTransport *)self primitives];
        v42 = [v25 sendData:v15 toDestinations:v9 fromDestination:v24];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100041C2C;
        v44[3] = &unk_1002FC9B8;
        id v45 = v8;
        v46 = self;
        [v42 flatMap:v44];
        id v26 = v15;
        id v27 = v10;
        id v28 = v8;
        long long v29 = v14;
        v31 = id v30 = v9;
        __int16 v32 = [v31 mapError:&stru_1002FC9D8];

        id v9 = v30;
        __int16 v14 = v29;
        id v8 = v28;
        id v10 = v27;
        id v15 = v26;
      }
      else
      {
        v39 = +[STLog idsMessageTransport];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1002607B8();
        }

        id v40 = objc_alloc((Class)NSError);
        id v25 = [v40 initWithDomain:STErrorDomain code:28 userInfo:0];
        __int16 v32 = +[STResult failure:v25];
      }
    }
    else
    {
      id v37 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100260744();
      }

      id v38 = objc_alloc((Class)NSError);
      id v24 = [v38 initWithDomain:STErrorDomain code:50 userInfo:0];
      __int16 v32 = +[STResult failure:v24];
    }
    id v17 = v43;
  }
  else
  {
    id v33 = objc_alloc((Class)NSError);
    uint64_t v34 = STErrorDomain;
    NSErrorUserInfoKey v48 = NSUnderlyingErrorKey;
    v49 = v17;
    id v35 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    id v22 = [v33 initWithDomain:v34 code:26 userInfo:v35];

    __int16 v36 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1002606C8();
    }

    __int16 v32 = +[STResult failure:v22];
  }

  return v32;
}

- (id)_reachabilityMapFromDestinations:(id)a3
{
  id v4 = [(STIDSMessageTransport *)self _refreshReachabilityForDestinations:a3];
  v5 = [v4 then];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041EA0;
  v8[3] = &unk_1002FCA00;
  v8[4] = self;
  id v6 = ((void (**)(void, void *))v5)[2](v5, v8);

  return v6;
}

- (id)_refreshReachabilityForDestinations:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_destinationReachabilityMapLock);
  v5 = [(STIDSMessageTransport *)self destinationReachabilityMap];
  os_unfair_lock_unlock(&self->_destinationReachabilityMapLock);
  id v25 = v5;
  id v26 = v4;
  id v6 = [v5 intersectWithDestinations:v4];
  id v7 = [v6 unknownReachabilityDestinations];
  id v8 = [v7 mutableCopy];

  id v9 = [v6 unreachableDestinations];
  [v8 unionSet:v9];

  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  unint64_t v11 = [(STIDSMessageTransport *)self primitives];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v11 refreshedReachabilityOfPrimitiveDestination:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v10 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  id v18 = [(STIDSMessageTransport *)self queue];
  id v19 = +[STPromise onQueue:v18 all:v10];
  id v20 = [v19 then];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100042290;
  v27[3] = &unk_1002FCA28;
  id v28 = v6;
  id v21 = (void (*)(void *, void *))v20[2];
  id v22 = v6;
  v23 = v21(v20, v27);

  return v23;
}

- (void)_isCapabilityEnabledForUser:(id)a3 capability:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  unint64_t v11 = [(STIDSMessageTransport *)self userAliasResolver];
  id v12 = [v8 dsid];
  id v13 = [v11 appleIDForUserDSID:v12];

  if (v13)
  {
    id v14 = [(STIDSMessageTransport *)self primitives];
    id v15 = [v14 primitiveDestinationFromRawAddress:v13];

    if (v15)
    {
      id v16 = [(STIDSMessageTransport *)self primitives];
      [v16 isCapabilityEnabledForDestination:v15 capability:v9 completionHandler:v10];
    }
    else
    {
      id v19 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100260948();
      }

      id v20 = objc_alloc((Class)NSError);
      id v16 = [v20 initWithDomain:STErrorDomain code:28 userInfo:0];
      v10[2](v10, 0, v16);
    }
  }
  else
  {
    id v17 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002608A8(v8, v17);
    }

    id v18 = objc_alloc((Class)NSError);
    id v15 = [v18 initWithDomain:STErrorDomain code:28 userInfo:0];
    v10[2](v10, 0, v15);
  }
}

- (void)stopTrackingMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[STLog idsMessageTransport];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[STIDSMessageTransport stopTrackingMessageWithIdentifier:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nStopping tracking of message: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(STIDSMessageTransport *)self messageIdentifierMap];
  [v6 removeMessageIdentifier:v4];
}

- (void)primitives:(id)a3 didObserveUpdatedPrimitiveDestinationReachabilityMap:(id)a4
{
  p_destinationReachabilityMapLock = &self->_destinationReachabilityMapLock;
  id v6 = a4;
  os_unfair_lock_lock(p_destinationReachabilityMapLock);
  int v7 = [(STIDSMessageTransport *)self destinationReachabilityMap];
  id v8 = [v7 merge:v6];

  [(STIDSMessageTransport *)self setDestinationReachabilityMap:v8];
  __int16 v9 = +[STLog idsMessageTransport];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(STIDSMessageTransport *)self destinationReachabilityMap];
    int v11 = 136446467;
    id v12 = "-[STIDSMessageTransport primitives:didObserveUpdatedPrimitiveDestinationReachabilityMap:]";
    __int16 v13 = 2113;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nCurrent primitive destination reachability: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_unlock(p_destinationReachabilityMapLock);
}

- (void)primitives:(id)a3 didReceiveData:(id)a4 fromPrimitiveDestination:(id)a5 primitiveResponseIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (char *)a5;
  __int16 v13 = (char *)a6;
  id v14 = +[STLog familyMessaging];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    long long v32 = "-[STIDSMessageTransport primitives:didReceiveData:fromPrimitiveDestination:primitiveResponseIdentifier:]";
    __int16 v33 = 2113;
    id v34 = v10;
    __int16 v35 = 2113;
    __int16 v36 = v12;
    __int16 v37 = 2113;
    id v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimatives: %{private}@, \nfromPrimativeDestination: %{private}@, \nprimitiveResponseIdentifier: %{private}@", buf, 0x2Au);
  }

  id v15 = [(STIDSMessageTransport *)self primitives];
  id v16 = [v15 rawAddressFromPrimitiveDestination:v12];

  id v17 = [(STIDSMessageTransport *)self addressValidator];
  unsigned __int8 v18 = [v17 validateAddressIsAllowed:v16];

  if (v18)
  {
    [(STIDSMessageTransport *)self _sendAcknowledgementMessageForResponseIdentifier:v13 toDestination:v12];
    id v30 = 0;
    id v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v30];
    id v20 = v30;
    if (v19)
    {
      id v29 = v10;
      id v21 = [v19 message];
      id v22 = (char *)[v21 contentType];
      if ((unint64_t)(v22 - 1) > 4) {
        CFStringRef v23 = @"Unknown";
      }
      else {
        CFStringRef v23 = off_1002FCA70[(void)(v22 - 1)];
      }

      id v25 = +[STLog familyMessaging];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v11 length];
        *(_DWORD *)buf = 138544130;
        long long v32 = (const char *)v23;
        __int16 v33 = 2050;
        id v34 = v26;
        __int16 v35 = 2082;
        __int16 v36 = "-[STIDSMessageTransport primitives:didReceiveData:fromPrimitiveDestination:primitiveResponseIdentifier:]";
        __int16 v37 = 2112;
        id v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[v2] <<<<<<< RECEIVE (message.contentType: %{public}@, size: %{public}lu), %{public}s: fromPrimitiveDestination: %@", buf, 0x2Au);
      }

      id v24 = [v19 returnAddress];
      id v27 = [(STIDSMessageTransport *)self messageAddressMap];
      [v27 insertPrimitiveDestination:v12 forMessageAddress:v24];

      id v28 = [(STIDSMessageTransport *)self delegate];
      [v28 transport:self didReceiveMessage:v19];

      id v10 = v29;
    }
    else
    {
      id v24 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1002609BC();
      }
    }
  }
  else
  {
    id v20 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100260A38();
    }
  }
}

- (void)_sendAcknowledgementMessageForResponseIdentifier:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog familyMessaging];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446723;
    id v25 = "-[STIDSMessageTransport _sendAcknowledgementMessageForResponseIdentifier:toDestination:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2113;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nresponseIdentifier: %@, \ntoDestination: %{private}@", buf, 0x20u);
  }

  __int16 v9 = [(STIDSMessageTransport *)self returnAddressProvider];
  id v10 = [v9 returnAddress];

  if (v10)
  {
    id v11 = [(STIDSMessageTransport *)self userAliasResolver];
    id v12 = [v10 userDSID];
    __int16 v13 = [v11 appleIDForUserDSID:v12];

    if (v13)
    {
      id v14 = [(STIDSMessageTransport *)self primitives];
      id v15 = [v14 primitiveDestinationFromRawAddress:v13];

      id v16 = +[STLog idsMessageTransport];
      id v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446467;
          id v25 = "-[STIDSMessageTransport _sendAcknowledgementMessageForResponseIdentifier:toDestination:]";
          __int16 v26 = 2113;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nAcknowledging message: %{private}@", buf, 0x16u);
        }

        unsigned __int8 v18 = [(STIDSMessageTransport *)self primitives];
        id v17 = [v18 sendAcknowledgementMessageForResponseIdentifier:v6 toDestination:v7 fromDestination:v15];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100042DAC;
        v21[3] = &unk_1002FCA50;
        id v22 = v6;
        CFStringRef v23 = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100042EA4;
        v19[3] = &unk_1002FC888;
        id v20 = v22;
        [v17 evaluateWithSuccess:v21 failure:v19];
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        sub_100260BA4();
      }
    }
    else
    {
      id v15 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100260B30();
      }
    }
  }
  else
  {
    __int16 v13 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100260AAC(v13);
    }
  }
}

- (void)primitives:(id)a3 didSendMessageWithPrimitiveIdentifier:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  __int16 v9 = (char *)a4;
  id v10 = (char *)a6;
  id v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "NO";
    *(void *)&v20[4] = "-[STIDSMessageTransport primitives:didSendMessageWithPrimitiveIdentifier:success:error:]";
    *(_WORD *)&v20[12] = 2112;
    *(_DWORD *)id v20 = 136446978;
    *(void *)&v20[14] = v9;
    if (v7) {
      id v12 = "YES";
    }
    *(_WORD *)&v20[22] = 2082;
    id v21 = v12;
    __int16 v22 = 2114;
    CFStringRef v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimitiveMessageIdentifier: %@, \nsuccess: %{public}s, \nerror: %{public}@", v20, 0x2Au);
  }

  __int16 v13 = [(STIDSMessageTransport *)self pendingAcknowledgementIdentifiers];
  if ([v13 containsObject:v9])
  {
    [v13 removeObject:v9];
  }
  else
  {
    id v14 = [(STIDSMessageTransport *)self messageIdentifierMap];
    id v15 = [v14 messageIdentifierForPrimitiveMessageIdentifier:v9];

    if (v15)
    {
      if (v7) {
        +[STResult success];
      }
      else {
      id v16 = +[STResult failure:v10];
      }
      id v17 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v18 = "NO";
        *(void *)&v20[4] = "-[STIDSMessageTransport primitives:didSendMessageWithPrimitiveIdentifier:success:error:]";
        *(_WORD *)&v20[12] = 2114;
        *(_DWORD *)id v20 = 136446979;
        *(void *)&v20[14] = v15;
        if (v7) {
          unsigned __int8 v18 = "YES";
        }
        *(_WORD *)&v20[22] = 2113;
        id v21 = v9;
        __int16 v22 = 2082;
        CFStringRef v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDid send messageIdentifier: %{public}@, \nprimitiveMessageIdentifier: %{private}@, \nsuccess: %{public}s", v20, 0x2Au);
      }

      id v19 = [(STIDSMessageTransport *)self delegate];
      [v19 transport:self didSendMessageWithIdentifier:v15 result:v16];
    }
    else
    {
      id v16 = +[STLog idsMessageTransport];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100260C9C();
      }
    }
  }
}

- (void)primitives:(id)a3 didDeliverMessageWithPrimitiveIdentifier:(id)a4 toPrimitiveDestination:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [(STIDSMessageTransport *)self messageIdentifierMap];
  id v10 = [v9 messageIdentifierForPrimitiveMessageIdentifier:v7];

  if (v10)
  {
    id v11 = [(STIDSMessageTransport *)self messageAddressMap];
    id v12 = +[NSSet setWithObject:v8];
    __int16 v13 = [v11 messageAddressesForPrimitiveDestinations:v12];
    id v14 = [v13 anyObject];

    id v15 = +[STLog idsMessageTransport];
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446723;
        unsigned __int8 v18 = "-[STIDSMessageTransport primitives:didDeliverMessageWithPrimitiveIdentifier:toPrimitiveDestination:]";
        __int16 v19 = 2114;
        id v20 = v10;
        __int16 v21 = 2113;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDid deliver message: \nmessageIdentifier: %{public}@, \nprimitiveMessageIdentifier: %{private}@)", (uint8_t *)&v17, 0x20u);
      }

      id v16 = [(STIDSMessageTransport *)self delegate];
      [v16 transport:self didDeliverMessageWithIdentifier:v10 toMessageAddress:v14];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_100260D84();
    }
  }
  else
  {
    id v14 = +[STLog idsMessageTransport];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100260D10();
    }
  }
}

- (STMessageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STMessageTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STIDSTransportPrimitives)primitives
{
  return (STIDSTransportPrimitives *)objc_getProperty(self, a2, 24, 1);
}

- (STIDSMessageTransportMessageAddressMap)messageAddressMap
{
  return (STIDSMessageTransportMessageAddressMap *)objc_getProperty(self, a2, 32, 1);
}

- (STIDSMessageTransportMessageIdentifierMap)messageIdentifierMap
{
  return (STIDSMessageTransportMessageIdentifierMap *)objc_getProperty(self, a2, 40, 1);
}

- (STIDSTransportAddressValidator)addressValidator
{
  return (STIDSTransportAddressValidator *)objc_getProperty(self, a2, 48, 1);
}

- (STUserAliasResolver)userAliasResolver
{
  return (STUserAliasResolver *)objc_getProperty(self, a2, 56, 1);
}

- (STTransportServiceReturnAddressProvider)returnAddressProvider
{
  return (STTransportServiceReturnAddressProvider *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (STIDSTransportPrimitiveDestinationReachabilityMap)destinationReachabilityMap
{
  return (STIDSTransportPrimitiveDestinationReachabilityMap *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDestinationReachabilityMap:(id)a3
{
}

- (os_unfair_lock_s)destinationReachabilityMapLock
{
  return self->_destinationReachabilityMapLock;
}

- (void)setDestinationReachabilityMapLock:(os_unfair_lock_s)a3
{
  self->_destinationReachabilityMapLock = a3;
}

- (NSMutableSet)pendingAcknowledgementIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAcknowledgementIdentifiers, 0);
  objc_storeStrong((id *)&self->_destinationReachabilityMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_returnAddressProvider, 0);
  objc_storeStrong((id *)&self->_userAliasResolver, 0);
  objc_storeStrong((id *)&self->_addressValidator, 0);
  objc_storeStrong((id *)&self->_messageIdentifierMap, 0);
  objc_storeStrong((id *)&self->_messageAddressMap, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end