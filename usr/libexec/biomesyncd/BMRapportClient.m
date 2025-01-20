@interface BMRapportClient
+ (id)clientForCommunicatingWithDevice:(id)a3 serviceName:(id)a4 queue:(id)a5;
+ (id)clientForHandlingRequestsWithServiceName:(id)a3 queue:(id)a4;
+ (id)clientForSameAccountDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
+ (id)clientForSharedHomeDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
+ (unint64_t)controlFlagsForMessagingDevice:(id)a3;
+ (unint64_t)controlFlagsForSameAccountDiscovery;
+ (unint64_t)controlFlagsForSharedHomeDiscovery;
- (BOOL)_validateDevice:(id)a3;
- (NSArray)activeDevices;
- (RPCompanionLinkDevice)localDevice;
- (id)_initWithType:(unint64_t)a3 controlFlags:(unint64_t)a4 serviceName:(id)a5 queue:(id)a6;
- (id)invalidationHandler;
- (void)_companionLinkClientActivatedWithError:(id)a3;
- (void)_companionLinkClientDiscoveredDevice:(id)a3;
- (void)_companionLinkClientInvalidated;
- (void)_companionLinkClientLostDevice:(id)a3;
- (void)_createAndActivateCompanionLinkClient;
- (void)_deregisterRequests;
- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_handleResponseUUID:(id)a3 response:(id)a4 options:(id)a5 error:(id)a6 handler:(id)a7;
- (void)_registerRequests;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation BMRapportClient

- (id)_initWithType:(unint64_t)a3 controlFlags:(unint64_t)a4 serviceName:(id)a5 queue:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMRapportClient;
  v13 = [(BMRapportClient *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a6);
    v14->_type = a3;
    v14->_state = 0;
    v14->_controlFlags = a4;
    objc_storeStrong((id *)&v14->_serviceName, a5);
    uint64_t v15 = objc_opt_new();
    activationHandlers = v14->_activationHandlers;
    v14->_activationHandlers = (NSMutableArray *)v15;
  }
  return v14;
}

+ (id)clientForHandlingRequestsWithServiceName:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [objc_alloc((Class)a1) _initWithType:1 controlFlags:0 serviceName:v7 queue:v6];

  if (v8)
  {
    v9 = (void *)v8[8];
    v8[8] = @"RequestHandler";
  }

  return v8;
}

+ (id)clientForSameAccountDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (id *)[objc_alloc((Class)a1) _initWithType:0 controlFlags:objc_msgSend((id)objc_opt_class(), "controlFlagsForSameAccountDiscovery") serviceName:v10 queue:v9];

  if (v11)
  {
    objc_storeWeak(v11 + 6, v8);
    id v12 = v11[8];
    v11[8] = @"DiscoverySameAccount";
  }

  return v11;
}

+ (id)clientForSharedHomeDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() controlFlagsForSharedHomeDiscovery];
  if (v11)
  {
    id v12 = [objc_alloc((Class)a1) _initWithType:0 controlFlags:v11 serviceName:v8 queue:v10];
    v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)v12 + 6, v9);
      v14 = (void *)v13[8];
      v13[8] = @"DiscoverySharedHome";
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)clientForCommunicatingWithDevice:(id)a3 serviceName:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = (id *)[objc_alloc((Class)a1) _initWithType:controlFlags:serviceName:queue:2, [objc_opt_class() controlFlagsForMessagingDevice:v9], v11, v10];

  if (v12)
  {
    objc_storeStrong(v12 + 11, a3);
    v13 = [v9 bm_companionLinkDeviceIdentifier];
    if ((unint64_t)[v13 length] <= 8)
    {
      id v14 = v12[8];
      v12[8] = @"UnknownDevice";
    }
    else
    {
      [v9 bm_companionLinkDeviceIdentifier];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 substringToIndex:8];
      id v16 = v12[8];
      v12[8] = (id)v15;
    }
  }

  return v12;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_activationHandlers, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingResponseHandlers, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    loggingIdentifier = self->_loggingIdentifier;
    *(_DWORD *)buf = 138412290;
    id v16 = loggingIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: activate", buf, 0xCu);
  }

  switch(self->_state)
  {
    case 0uLL:
      if (v4)
      {
        activationHandlers = self->_activationHandlers;
        id v8 = objc_retainBlock(v4);
        [(NSMutableArray *)activationHandlers addObject:v8];
      }
      [(BMRapportClient *)self _createAndActivateCompanionLinkClient];
      break;
    case 1uLL:
      if (v4)
      {
        id v9 = self->_activationHandlers;
        id v10 = objc_retainBlock(v4);
        [(NSMutableArray *)v9 addObject:v10];
      }
      break;
    case 2uLL:
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0);
      }
      break;
    case 3uLL:
      if (v4)
      {
        NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
        CFStringRef v14 = @"BMRapportClient has been invalidated";
        id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        id v12 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:4 userInfo:v11];
        (*((void (**)(id, void *))v4 + 2))(v4, v12);
      }
      break;
    default:
      break;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      *(_DWORD *)buf = 138412290;
      v23 = loggingIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: invalidate", buf, 0xCu);
    }

    self->_state = 3;
    [(RPCompanionLinkClient *)self->_client setDeviceChangedHandler:0];
    [(RPCompanionLinkClient *)self->_client setDeviceFoundHandler:0];
    [(RPCompanionLinkClient *)self->_client setDeviceLostHandler:0];
    [(RPCompanionLinkClient *)self->_client setDisconnectHandler:0];
    [(RPCompanionLinkClient *)self->_client setErrorFlagsChangedHandler:0];
    [(RPCompanionLinkClient *)self->_client setInterruptionHandler:0];
    [(RPCompanionLinkClient *)self->_client setInvalidationHandler:0];
    [(RPCompanionLinkClient *)self->_client setLocalDeviceUpdatedHandler:0];
    [(RPCompanionLinkClient *)self->_client setStateUpdatedHandler:0];
    if (self->_type == 1) {
      [(BMRapportClient *)self _deregisterRequests];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [(NSMutableDictionary *)self->_outstandingResponseHandlers allValues];
    id v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
          NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
          CFStringRef v20 = @"Rapport client invalidated";
          id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          id v11 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:4 userInfo:v10];
          (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v11);

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v6);
    }

    [*(id *)(v13 + 56) removeAllObjects];
    [*(id *)(v13 + 32) invalidate];
    uint64_t v12 = *(void *)(v13 + 104);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

- (void)_companionLinkClientActivatedWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v4) {
      [(BMRapportClient *)self invalidate];
    }
    else {
      self->_state = 2;
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_activationHandlers;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_activationHandlers removeAllObjects];
  }
}

- (void)_companionLinkClientInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100043FEC((uint64_t)self, v3);
    }

    [(BMRapportClient *)self invalidate];
  }
}

- (void)_createAndActivateCompanionLinkClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100044068((uint64_t)self, v3);
    }
  }
  else
  {
    self->_state = 1;
    id v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    client = self->_client;
    self->_client = v4;

    [(RPCompanionLinkClient *)self->_client setDispatchQueue:self->_queue];
    [(RPCompanionLinkClient *)self->_client setControlFlags:self->_controlFlags];
    if (self->_type - 1 <= 1) {
      [(RPCompanionLinkClient *)self->_client setServiceType:self->_serviceName];
    }
    if (self->_destinationDevice) {
      -[RPCompanionLinkClient setDestinationDevice:](self->_client, "setDestinationDevice:");
    }
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000041B0;
    v14[3] = &unk_10006CA48;
    objc_copyWeak(&v15, &location);
    [(RPCompanionLinkClient *)self->_client setInvalidationHandler:v14];
    unint64_t type = self->_type;
    if (!type)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000041F0;
      v12[3] = &unk_10006CA70;
      objc_copyWeak(&v13, &location);
      [(RPCompanionLinkClient *)self->_client setDeviceFoundHandler:v12];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000424C;
      v10[3] = &unk_10006CA70;
      objc_copyWeak(&v11, &location);
      [(RPCompanionLinkClient *)self->_client setDeviceLostHandler:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      unint64_t type = self->_type;
    }
    if (type == 1) {
      [(BMRapportClient *)self _registerRequests];
    }
    id v7 = self->_client;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000042A8;
    v8[3] = &unk_10006CA98;
    objc_copyWeak(&v9, &location);
    [(RPCompanionLinkClient *)v7 activateWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v13)
    {
      if (!self->_outstandingResponseHandlers)
      {
        long long v16 = (NSMutableDictionary *)objc_opt_new();
        outstandingResponseHandlers = self->_outstandingResponseHandlers;
        self->_outstandingResponseHandlers = v16;
      }
      long long v18 = +[NSUUID UUID];
      id v19 = [v13 copy];

      id v20 = objc_retainBlock(v19);
      [(NSMutableDictionary *)self->_outstandingResponseHandlers setObject:v20 forKeyedSubscript:v18];
    }
    else
    {
      long long v18 = 0;
      id v19 = 0;
    }
    v21 = self->_loggingIdentifier;
    objc_initWeak(&location, self);
    client = self->_client;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000F830;
    v23[3] = &unk_10006CDD8;
    objc_copyWeak(&v27, &location);
    id v15 = v21;
    v24 = v15;
    id v14 = v18;
    id v25 = v14;
    id v13 = v19;
    id v26 = v13;
    [(RPCompanionLinkClient *)client sendRequestID:v10 request:v11 options:v12 responseHandler:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v13)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Rapport client has been invalidated";
    id v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v15 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:4 userInfo:v14];
    (*((void (**)(id, void, void, NSString *))v13 + 2))(v13, 0, 0, v15);
LABEL_10:
  }
}

- (void)_handleResponseUUID:(id)a3 response:(id)a4 options:(id)a5 error:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = (void (**)(id, id, id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
  {
    long long v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      if (v13) {
        id v19 = v13;
      }
      else {
        id v19 = v15;
      }
      int v22 = 138412546;
      v23 = loggingIdentifier;
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BMRapportClient[%@]: Warning: ignoring response arriving after invalidation: %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v12) {
    [(NSMutableDictionary *)self->_outstandingResponseHandlers setObject:0 forKeyedSubscript:v12];
  }
  if (!v16)
  {
    long long v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v20 = self->_loggingIdentifier;
      if (v13) {
        id v21 = v13;
      }
      else {
        id v21 = v15;
      }
      int v22 = 138412546;
      v23 = v20;
      __int16 v24 = 2112;
      id v25 = v21;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "BMRapportClient[%@]: Warning: ignoring response because no response handler is set: %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_12;
  }
  v16[2](v16, v13, v14, v15);
LABEL_13:
}

- (RPCompanionLinkDevice)localDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(RPCompanionLinkClient *)self->_client localDevice];
  }

  return (RPCompanionLinkDevice *)v3;
}

- (NSArray)activeDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
  {
    v3 = 0;
  }
  else
  {
    id v4 = [(RPCompanionLinkClient *)self->_client activeDevices];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100023408;
    v6[3] = &unk_10006D4B8;
    v6[4] = self;
    v3 = [v4 _pas_filteredArrayWithTest:v6];
  }

  return (NSArray *)v3;
}

- (void)_companionLinkClientDiscoveredDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if ([(BMRapportClient *)self _validateDevice:v4])
    {
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained rapportClient:self didDiscoverDevice:v4];
    }
    else
    {
      id v6 = [v4 bm_companionLinkDeviceIdentifier];

      if (v6)
      {
        id v7 = [v4 model];

        WeakRetained = __biome_log_for_category();
        BOOL v8 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v8) {
            sub_10004606C();
          }
        }
        else if (v8)
        {
          sub_100045FF4();
        }
      }
      else
      {
        WeakRetained = __biome_log_for_category();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
          sub_100045F7C();
        }
      }
    }
  }
}

- (void)_companionLinkClientLostDevice:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained rapportClient:self didLoseDevice:v5];
  }
}

- (BOOL)_validateDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bm_companionLinkDeviceIdentifier];

  if (v4)
  {
    id v5 = [v3 model];
    LOBYTE(v4) = v5 != 0;
  }
  return (char)v4;
}

+ (unint64_t)controlFlagsForSameAccountDiscovery
{
  return 0;
}

+ (unint64_t)controlFlagsForSharedHomeDiscovery
{
  return 0;
}

+ (unint64_t)controlFlagsForMessagingDevice:(id)a3
{
  id v3 = [a3 model];
  uint64_t v4 = BMDevicePlatformFromModelString();

  unint64_t result = 0;
  switch(v4)
  {
    case 0:
      id v6 = __biome_log_for_category();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1000472B8();
      }

      unint64_t result = 0;
      break;
    case 3:
    case 4:
    case 5:
    case 7:
      unint64_t result = 0x20000400000;
      break;
    case 6:
      unint64_t result = 0x400000;
      break;
    default:
      return result;
  }
  return result;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v8];

  if (!v11)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v17 = 138412290;
      long long v18 = loggingIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: register request", (uint8_t *)&v17, 0xCu);
    }

    if (self->_state)
    {
      id v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000473CC((uint64_t)self, v14);
      }
    }
    else
    {
      if (!self->_registeredRequests)
      {
        id v15 = (NSMutableDictionary *)objc_opt_new();
        registeredRequests = self->_registeredRequests;
        self->_registeredRequests = v15;
      }
      id v14 = objc_alloc_init((Class)RPRequestRegistration);
      [v14 setRequestID:v8];
      [v14 setOptions:v9];
      [v14 setHandler:v10];
      [(NSMutableDictionary *)self->_registeredRequests setObject:v14 forKeyedSubscript:v8];
    }
  }
}

- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    id v13 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v16];
    id v14 = [v13 handler];

    if (v14)
    {
      ((void (**)(void, id, id, id))v14)[2](v14, v10, v11, v12);
    }
  }
}

- (void)_registerRequests
{
  if (self->_state == 1)
  {
    objc_initWeak(&location, self);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = self->_registeredRequests;
    id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v3)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v6 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v5];
          client = self->_client;
          id v8 = [v6 options];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10003261C;
          v13[3] = &unk_10006CCC0;
          objc_copyWeak(&v14, &location);
          v13[4] = v5;
          id v9 = objc_retainBlock(v13);
          objc_destroyWeak(&v14);
          [(RPCompanionLinkClient *)client registerRequestID:v5 options:v8 handler:v9];
        }
        id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v3);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100047454((uint64_t)self, v10);
    }
  }
}

- (void)_deregisterRequests
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_registeredRequests;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RPCompanionLinkClient deregisterRequestID:](self->_client, "deregisterRequestID:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_registeredRequests removeAllObjects];
}

@end