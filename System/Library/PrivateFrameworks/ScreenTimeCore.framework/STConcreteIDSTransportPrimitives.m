@interface STConcreteIDSTransportPrimitives
+ (id)_optionsDictionaryWithFromID:(id)a3;
+ (id)_resourceURLForSendingOversizedData;
+ (void)_sortDestinationsToStatus:(id)a3 intoReachableDestinations:(id *)a4 unreachableDestinations:(id *)a5 unknownReachabilityDestinations:(id *)a6;
- (BOOL)canSend;
- (BOOL)signedInUserHasMultipleDevices;
- (IDSBatchIDQueryController)primitiveDestinationStatusQueryController;
- (IDSService)service;
- (NSString)serviceName;
- (OS_dispatch_queue)serviceQueue;
- (STConcreteIDSTransportPrimitives)initWithServiceName:(id)a3;
- (STIDSTransportPrimitivesDelegate)delegate;
- (id)_sendData:(id)a3 toDestinations:(id)a4 options:(id)a5;
- (id)_sendOversizedData:(id)a3 toDestinations:(id)a4 sendOptions:(id)a5;
- (id)addressDestinationFromPrimitiveDestination:(id)a3;
- (id)primitiveDestinationFromRawAddress:(id)a3;
- (id)rawAddressFromPrimitiveDestination:(id)a3;
- (id)refreshedReachabilityOfPrimitiveDestination:(id)a3;
- (id)sendAcknowledgementMessageForResponseIdentifier:(id)a3 toDestination:(id)a4 fromDestination:(id)a5;
- (id)sendData:(id)a3 toDestinations:(id)a4 fromDestination:(id)a5;
- (void)_sendData:(id)a3 sendDataBlock:(id)a4 sendOversizedDataBlock:(id)a5;
- (void)addObserver:(id)a3 forReachabilityChangesOfPrimitiveDestinations:(id)a4;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)isCapabilityEnabledForDestination:(id)a3 capability:(id)a4 completionHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPrimitiveDestinationStatusQueryController:(id)a3;
- (void)startOnQueue:(id)a3;
- (void)stop;
@end

@implementation STConcreteIDSTransportPrimitives

- (STConcreteIDSTransportPrimitives)initWithServiceName:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STConcreteIDSTransportPrimitives;
  id v3 = a3;
  v4 = [(STConcreteIDSTransportPrimitives *)&v10 init];
  v5 = (NSString *)objc_msgSend(v3, "copy", v10.receiver, v10.super_class);

  serviceName = v4->_serviceName;
  v4->_serviceName = v5;

  v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v4->_serviceName];
  service = v4->_service;
  v4->_service = v7;

  return v4;
}

- (void)dealloc
{
  [(IDSService *)self->_service removeDelegate:self];
  [(IDSBatchIDQueryController *)self->_primitiveDestinationStatusQueryController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STConcreteIDSTransportPrimitives;
  [(STConcreteIDSTransportPrimitives *)&v3 dealloc];
}

- (void)startOnQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  id v10 = (id)objc_opt_new();
  [v10 setWantsCrossAccountMessaging:1];
  v5 = [(STConcreteIDSTransportPrimitives *)self service];
  [v5 addDelegate:self withDelegateProperties:v10 queue:v4];

  id v6 = objc_alloc((Class)IDSBatchIDQueryController);
  v7 = [(STConcreteIDSTransportPrimitives *)self serviceName];
  id v8 = [v6 initWithService:v7 delegate:self queue:v4];
  [(STConcreteIDSTransportPrimitives *)self setPrimitiveDestinationStatusQueryController:v8];

  serviceQueue = self->_serviceQueue;
  self->_serviceQueue = v4;
}

- (void)stop
{
  [(IDSService *)self->_service removeDelegate:self];
  primitiveDestinationStatusQueryController = self->_primitiveDestinationStatusQueryController;
  [(IDSBatchIDQueryController *)primitiveDestinationStatusQueryController invalidate];
}

- (BOOL)canSend
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(STConcreteIDSTransportPrimitives *)self service];
  objc_super v3 = [v2 accounts];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    v7 = &__kCFBooleanTrue;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if [v9 accountType] != 2 && (objc_msgSend(v9, "canSend")) {
        break;
      }
      if (v5 == (id)++v8)
      {
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        v7 = &__kCFBooleanFalse;
        break;
      }
    }
  }
  else
  {
    v7 = &__kCFBooleanFalse;
  }

  return [v7 BOOLValue];
}

- (BOOL)signedInUserHasMultipleDevices
{
  v2 = [(STConcreteIDSTransportPrimitives *)self service];
  objc_super v3 = [v2 devices];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)sendData:(id)a3 toDestinations:(id)a4 fromDestination:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[STConcreteIDSTransportPrimitives _optionsDictionaryWithFromID:a5];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  id v11 = [v10 copy];
  long long v12 = [(STConcreteIDSTransportPrimitives *)self _sendData:v9 toDestinations:v8 options:v11];

  return v12;
}

- (id)sendAcknowledgementMessageForResponseIdentifier:(id)a3 toDestination:(id)a4 fromDestination:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[STConcreteIDSTransportPrimitives _optionsDictionaryWithFromID:a5];
  [v10 setObject:v9 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];

  id v11 = [@"ACK" dataUsingEncoding:4];
  long long v12 = +[NSSet setWithObject:v8];

  id v13 = [v10 copy];
  long long v14 = [(STConcreteIDSTransportPrimitives *)self _sendData:v11 toDestinations:v12 options:v13];

  return v14;
}

+ (id)_optionsDictionaryWithFromID:(id)a3
{
  v7[0] = IDSSendMessageOptionFromIDKey;
  v7[1] = IDSSendMessageOptionTimeoutKey;
  v8[0] = a3;
  v8[1] = &off_10030FB80;
  id v3 = a3;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  id v5 = [v4 mutableCopy];
  return v5;
}

- (id)_sendData:(id)a3 toDestinations:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100017F90;
  v45 = sub_100017FA0;
  id v46 = 0;
  id v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = (const char *)[v8 length];
    *(_DWORD *)buf = 136446978;
    v48 = "-[STConcreteIDSTransportPrimitives _sendData:toDestinations:options:]";
    __int16 v49 = 2050;
    v50 = v12;
    __int16 v51 = 2112;
    id v52 = v9;
    __int16 v53 = 2112;
    id v54 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \ndata: %{public}lu bytes, \ndestinations: %@, \noptions: %@", buf, 0x2Au);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100017FA8;
  v36[3] = &unk_1002FB938;
  v36[4] = self;
  id v13 = v8;
  id v37 = v13;
  id v14 = v9;
  id v38 = v14;
  id v15 = v10;
  id v39 = v15;
  v40 = &v41;
  v16 = objc_retainBlock(v36);
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_100018134;
  v30 = &unk_1002FB960;
  v35 = &v41;
  v31 = self;
  id v17 = v13;
  id v32 = v17;
  id v18 = v14;
  id v33 = v18;
  id v19 = v15;
  id v34 = v19;
  v20 = objc_retainBlock(&v27);
  -[STConcreteIDSTransportPrimitives _sendData:sendDataBlock:sendOversizedDataBlock:](self, "_sendData:sendDataBlock:sendOversizedDataBlock:", v17, v16, v20, v27, v28, v29, v30, v31);
  v21 = +[STLog familyMessaging];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(id)v42[5] type];
    v23 = "STResultTypeFailure";
    if (!v22) {
      v23 = "STResultTypeSuccess";
    }
    *(_DWORD *)buf = 136446466;
    v48 = "-[STConcreteIDSTransportPrimitives _sendData:toDestinations:options:]";
    __int16 v49 = 2082;
    v50 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimativeIdentifierResult.type: %{public}s", buf, 0x16u);
  }

  if ([(id)v42[5] type] == (id)1)
  {
    v24 = +[STLog idsTransportPrimitives];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_10025C258(v24);
    }
  }
  id v25 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v25;
}

- (void)_sendData:(id)a3 sendDataBlock:(id)a4 sendOversizedDataBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  id v9 = (void (**)(void))a5;
  id v10 = +[STLog familyMessaging];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446466;
    id v13 = "-[STConcreteIDSTransportPrimitives _sendData:sendDataBlock:sendOversizedDataBlock:]";
    __int16 v14 = 2050;
    id v15 = [v7 length];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \ndata: %{public}lu bytes", (uint8_t *)&v12, 0x16u);
  }

  if ((unint64_t)[v7 length] >= 0xF000) {
    id v11 = v9;
  }
  else {
    id v11 = v8;
  }
  v11[2]();
}

- (id)_sendOversizedData:(id)a3 toDestinations:(id)a4 sendOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v32 = "-[STConcreteIDSTransportPrimitives _sendOversizedData:toDestinations:sendOptions:]";
    __int16 v33 = 2050;
    id v34 = [v8 length];
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \ndata: %{public}lu bytes, \ndestinations: %@, \nsendOptions: %@", buf, 0x2Au);
  }

  int v12 = +[STConcreteIDSTransportPrimitives _resourceURLForSendingOversizedData];
  id v30 = 0;
  unsigned __int8 v13 = [v8 writeToURL:v12 options:2 error:&v30];
  id v14 = v30;
  if (v13)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100018634;
    v28[3] = &unk_1002FB6A8;
    id v15 = v12;
    id v29 = v15;
    v16 = objc_retainBlock(v28);
    id v17 = [(STConcreteIDSTransportPrimitives *)self service];
    id v26 = 0;
    id v27 = 0;
    unsigned __int8 v18 = [v17 sendResourceAtURL:v15 metadata:0 toDestinations:v9 priority:300 options:v10 identifier:&v27 error:&v26];
    id v19 = v27;
    id v20 = v26;

    ((void (*)(void *))v16[2])(v16);
    if (v18)
    {
      uint64_t v21 = +[STResult success:v19];
    }
    else
    {
      v24 = +[STLog idsTransportPrimitives];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10025C350();
      }

      uint64_t v21 = +[STResult failure:v20];
    }
    v23 = (void *)v21;
  }
  else
  {
    id v22 = +[STLog familyMessaging];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10025C3C4();
    }

    v23 = +[STResult failure:v14];
  }

  return v23;
}

+ (id)_resourceURLForSendingOversizedData
{
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 temporaryDirectory];
  BOOL v4 = objc_opt_new();
  id v5 = [v4 UUIDString];
  uint64_t v6 = +[NSString stringWithFormat:@"IDS-SendFile-%@", v5];
  id v7 = [v3 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)primitiveDestinationFromRawAddress:(id)a3
{
  id v3 = a3;
  if ([v3 _appearsToBeEmail])
  {
    uint64_t v4 = IDSCopyIDForEmailAddress();
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 _appearsToBePhoneNumber])
  {
    uint64_t v4 = IDSCopyIDForPhoneNumber();
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)rawAddressFromPrimitiveDestination:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[STLog familyMessaging];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[STConcreteIDSTransportPrimitives rawAddressFromPrimitiveDestination:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimitiveDestination: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = (void *)IDSCopyRawAddressForDestination();
  return v5;
}

- (id)addressDestinationFromPrimitiveDestination:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[STLog familyMessaging];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[STConcreteIDSTransportPrimitives addressDestinationFromPrimitiveDestination:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimitiveDestination: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = (void *)IDSCopyAddressDestinationForDestination();
  return v5;
}

- (void)addObserver:(id)a3 forReachabilityChangesOfPrimitiveDestinations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteIDSTransportPrimitives *)self delegate];

  __int16 v9 = +[STLog idsTransportPrimitives];
  id v10 = v9;
  if (v8 == v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446467;
      unsigned __int8 v13 = "-[STConcreteIDSTransportPrimitives addObserver:forReachabilityChangesOfPrimitiveDestinations:]";
      __int16 v14 = 2113;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nAdded reachability observer for destinations: %{private}@", (uint8_t *)&v12, 0x16u);
    }

    id v10 = [(STConcreteIDSTransportPrimitives *)self primitiveDestinationStatusQueryController];
    id v11 = [v6 allObjects];
    [v10 setDestinations:v11];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_10025C4B4(v10);
  }
}

- (id)refreshedReachabilityOfPrimitiveDestination:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[STConcreteIDSTransportPrimitives refreshedReachabilityOfPrimitiveDestination:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimativeDestination: %@", buf, 0x16u);
  }

  id v6 = +[STPromise pendingPromise];
  id v7 = +[IDSIDQueryController sharedInstance];
  id v8 = [(STConcreteIDSTransportPrimitives *)self serviceName];
  __int16 v9 = [(STConcreteIDSTransportPrimitives *)self serviceName];
  id v10 = [(STConcreteIDSTransportPrimitives *)self serviceQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100018D24;
  v16[3] = &unk_1002FB988;
  id v17 = v4;
  id v11 = v6;
  id v18 = v11;
  id v12 = v4;
  [v7 refreshIDStatusForDestination:v12 service:v8 listenerID:v9 queue:v10 completionBlock:v16];

  unsigned __int8 v13 = v18;
  id v14 = v11;

  return v14;
}

- (void)isCapabilityEnabledForDestination:(id)a3 capability:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v26 = "-[STConcreteIDSTransportPrimitives isCapabilityEnabledForDestination:capability:completionHandler:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nprimativeDestination: %@, \ndeviceCapability: %@", buf, 0x20u);
  }

  id v12 = +[IDSIDQueryController sharedInstance];
  id v24 = v8;
  unsigned __int8 v13 = +[NSArray arrayWithObjects:&v24 count:1];
  id v14 = [(STConcreteIDSTransportPrimitives *)self serviceName];
  id v15 = [(STConcreteIDSTransportPrimitives *)self serviceName];
  v16 = [(STConcreteIDSTransportPrimitives *)self serviceQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001910C;
  v20[3] = &unk_1002FB9B0;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  [v12 currentRemoteDevicesForDestinations:v13 service:v14 listenerID:v15 queue:v16 completionBlock:v20];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[STLog familyMessaging];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"NO";
    int v17 = 136447235;
    id v18 = "-[STConcreteIDSTransportPrimitives service:account:identifier:didSendWithSuccess:error:]";
    __int16 v19 = 2113;
    id v20 = v11;
    if (v8) {
      CFStringRef v15 = @"YES";
    }
    __int16 v21 = 2114;
    id v22 = v12;
    __int16 v23 = 2114;
    CFStringRef v24 = v15;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \naccount: %{private}@, \nidentifier: %{public}@, \nsuccess: %{public}@, \nerror: %{public}@", (uint8_t *)&v17, 0x34u);
  }

  v16 = [(STConcreteIDSTransportPrimitives *)self delegate];
  [v16 primitives:self didSendMessageWithPrimitiveIdentifier:v12 success:v8 error:v13];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  CFStringRef v15 = +[STLog familyMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (const char *)[v12 length];
    int v17 = [v14 description];
    int v26 = 136447235;
    __int16 v27 = "-[STConcreteIDSTransportPrimitives service:account:incomingData:fromID:context:]";
    __int16 v28 = 2113;
    id v29 = v11;
    __int16 v30 = 2050;
    v31 = v16;
    __int16 v32 = 2113;
    id v33 = v13;
    __int16 v34 = 2112;
    __int16 v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \naccount: %{private}@, \ndata: %{public}lu bytes, \nfromID: %{private}@, \ncontext: %@", (uint8_t *)&v26, 0x34u);
  }
  id v18 = [v14 incomingResponseIdentifier];
  if (v18)
  {
    __int16 v19 = +[STLog familyMessaging];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v14 incomingResponseIdentifier];
      int v26 = 136446466;
      __int16 v27 = "-[STConcreteIDSTransportPrimitives service:account:incomingData:fromID:context:]";
      __int16 v28 = 2114;
      id v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDid receive message with context.incomingResponseIdentifier: %{public}@", (uint8_t *)&v26, 0x16u);
    }
    __int16 v21 = [(STConcreteIDSTransportPrimitives *)self delegate];
    [v21 primitives:self didDeliverMessageWithPrimitiveIdentifier:v18 toPrimitiveDestination:v13];
  }
  else
  {
    __int16 v21 = [v14 outgoingResponseIdentifier];
    id v22 = +[STLog idsTransportPrimitives];
    __int16 v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = [v14 fromServerStorage];
        __int16 v25 = "NO";
        __int16 v27 = "-[STConcreteIDSTransportPrimitives service:account:incomingData:fromID:context:]";
        int v26 = 136446722;
        if (v24) {
          __int16 v25 = "YES";
        }
        __int16 v28 = 2114;
        id v29 = v21;
        __int16 v30 = 2082;
        v31 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDid receive message with context.outgoingResponseIdentifier: %{public}@) - fromServerStorage: %{public}s", (uint8_t *)&v26, 0x20u);
      }

      __int16 v23 = [(STConcreteIDSTransportPrimitives *)self delegate];
      [v23 primitives:self didReceiveData:v12 fromPrimitiveDestination:v13 primitiveResponseIdentifier:v21];
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      sub_10025C5AC((uint64_t)v13, v23);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  CFStringRef v15 = +[STLog familyMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    __int16 v28 = "-[STConcreteIDSTransportPrimitives service:account:incomingResourceAtURL:fromID:context:]";
    __int16 v29 = 2113;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2113;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \naccount: %{private}@, \nresourceURL: %@, \nfromID: %{private}@, \ncontext: %@", buf, 0x34u);
  }

  v16 = +[NSFileManager defaultManager];
  int v17 = [v12 path];
  id v26 = 0;
  id v18 = [v16 attributesOfItemAtPath:v17 error:&v26];
  id v19 = v26;

  if (!v18)
  {
    id v20 = +[STLog idsTransportPrimitives];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = [v12 path];
      *(_DWORD *)buf = 136446979;
      __int16 v28 = "-[STConcreteIDSTransportPrimitives service:account:incomingResourceAtURL:fromID:context:]";
      __int16 v29 = 2113;
      id v30 = v24;
      __int16 v31 = 2113;
      id v32 = v13;
      __int16 v33 = 2114;
      id v34 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[v2] %{public}s: \nFailed to get attributes for resourceURL.path: %{private}@, \nfrom: %{private}@, \nerror: %{public}@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  if ((unint64_t)[v18 fileSize] >= 0x1400001)
  {
    id v20 = +[STLog idsTransportPrimitives];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10025C638(v18, v20);
    }
LABEL_9:
    id v21 = v19;
    goto LABEL_15;
  }
  id v25 = v19;
  id v20 = +[NSData dataWithContentsOfURL:v12 options:0 error:&v25];
  id v21 = v25;

  if (v20)
  {
    id v22 = [(STConcreteIDSTransportPrimitives *)self delegate];
    __int16 v23 = [v14 outgoingResponseIdentifier];
    [v22 primitives:self didReceiveData:v20 fromPrimitiveDestination:v13 primitiveResponseIdentifier:v23];
  }
  else
  {
    id v22 = +[STLog idsTransportPrimitives];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10025C6D8();
    }
  }

LABEL_15:
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4 = a4;
  id v5 = +[STLog idsTransportPrimitives];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446467;
    BOOL v8 = "-[STConcreteIDSTransportPrimitives service:activeAccountsChanged:]";
    __int16 v9 = 2113;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \naccounts: %{private}@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = +[Daemon reactor];
  [v6 sendInitialSetup];
}

+ (void)_sortDestinationsToStatus:(id)a3 intoReachableDestinations:(id *)a4 unreachableDestinations:(id *)a5 unknownReachabilityDestinations:(id *)a6
{
  id v9 = a3;
  id v10 = objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100019E30;
  v17[3] = &unk_1002FB9D8;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  [v9 enumerateKeysAndObjectsUsingBlock:v17];

  if (a4) {
    *a4 = [v14 copy];
  }
  if (a5) {
    *a5 = [v15 copy];
  }
  if (a6) {
    *a6 = [v13 copy];
  }
  v16 = +[STLog familyMessaging];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    id v22 = "+[STConcreteIDSTransportPrimitives _sortDestinationsToStatus:intoReachableDestinations:unreachableDestinations"
          ":unknownReachabilityDestinations:]";
    __int16 v23 = 2113;
    id v24 = v14;
    __int16 v25 = 2113;
    id v26 = v15;
    __int16 v27 = 2113;
    id v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nreachableDestinations: %{private}@, \nunreachableDestinations: %{private}@, \nunknownReachabilityDestinations: %{private}@", buf, 0x2Au);
  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = +[STLog idsTransportPrimitives];
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10025C754();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v21 = "-[STConcreteIDSTransportPrimitives batchQueryController:updatedDestinationsStatus:onService:error:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nBatch ID query controller observed updated destination reachability", buf, 0xCu);
    }

    id v18 = 0;
    id v19 = 0;
    id v17 = 0;
    +[STConcreteIDSTransportPrimitives _sortDestinationsToStatus:v8 intoReachableDestinations:&v19 unreachableDestinations:&v18 unknownReachabilityDestinations:&v17];
    id v11 = v19;
    id v12 = v18;
    id v13 = v17;
    id v14 = [[STIDSTransportPrimitiveDestinationReachabilityMap alloc] initWithReachableDestinations:v11 unreachableDestinations:v12 unknownReachabilityDestinations:v13];
    id v15 = +[STLog familyMessaging];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      id v21 = "-[STConcreteIDSTransportPrimitives batchQueryController:updatedDestinationsStatus:onService:error:]";
      __int16 v22 = 2113;
      __int16 v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \ndidObserveUpdatedPrimitiveDestinationReachabilityMap: %{private}@", buf, 0x16u);
    }

    v16 = [(STConcreteIDSTransportPrimitives *)self delegate];
    [v16 primitives:self didObserveUpdatedPrimitiveDestinationReachabilityMap:v14];
  }
}

- (STIDSTransportPrimitivesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STIDSTransportPrimitivesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)serviceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (IDSBatchIDQueryController)primitiveDestinationStatusQueryController
{
  return (IDSBatchIDQueryController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrimitiveDestinationStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitiveDestinationStatusQueryController, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end