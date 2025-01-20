@interface PDSharingChannelManager
- (BOOL)_lock_canTrackHandleForTransportIdentifier:(id)a3 descriptor:(id)a4 existing:(id *)a5;
- (BOOL)canHandleOutstandingMessagesOnEndpoint:(id)a3;
- (BOOL)configureHandle:(id)a3 forDescriptor:(id)a4;
- (BOOL)isDescriptorValid:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDAccessPassSharingIDSService)idsService;
- (PDSharingChannelManager)init;
- (PDSharingChannelManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 pushNotificationManager:(id)a5 idsSharingService:(id)a6;
- (PDSharingChannelMonitor)monitor;
- (id)_createHandleForEndpoint:(id)a3 descriptor:(id)a4 queue:(id)a5;
- (id)_endpointForDescriptor:(id)a3;
- (id)_lock_sharingChannelHandleForEndpoint:(id)a3;
- (id)channelForEndpoint:(id)a3;
- (id)handleForDescriptor:(id)a3 queue:(id)a4;
- (void)_handleDidInvalidateForTransportIdentifier:(id)a3;
- (void)_handleWasInvalidatedForTransportIdentifier:(id)a3 triggeredByClient:(BOOL)a4;
- (void)_lock_addAncillaryService:(id)a3 forTracker:(id)a4;
- (void)_lock_removeAncillaryService:(id)a3;
- (void)_lock_removeAncillaryService:(id)a3 forTracker:(id)a4;
- (void)_lock_removeAncillaryServiceForTracker:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)_sendMessage:(id)a3 toEndpoint:(id)a4 completion:(id)a5;
- (void)addDelegate:(id)a3;
- (void)ancillaryServiceDidTerminate:(id)a3;
- (void)attachForHandle:(id)a3 completion:(id)a4;
- (void)cacheSharingMessageForDescriptor:(id)a3 message:(id)a4;
- (void)closeForHandle:(id)a3 completion:(id)a4;
- (void)descriptorsForAccountDevicesForHandle:(id)a3 completion:(id)a4;
- (void)didHandleMessageForHandle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)didReceiveIDSShareMessage:(id)a3 endpoint:(id)a4;
- (void)didReceiveLocalShareMessage:(id)a3 endpoint:(id)a4;
- (void)endpointWasRemotelyTerminated:(id)a3;
- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4;
- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4 allowCreation:(BOOL)a5;
- (void)fetchHandleTransferTokenForHandle:(id)a3 completion:(id)a4;
- (void)handleOutstandingShareMessage:(id)a3 endpoint:(id)a4;
- (void)pingForHandle:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationForDescriptor:(id)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishForHandle:(id)a3 completion:(id)a4;
- (void)remoteDeviceInformationForHandle:(id)a3 completion:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sendMessageToDescriptor:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sharingChannelHandle:(id)a3 wasInvalidatedRemotelyForEndpoint:(id)a4;
- (void)start;
- (void)startProximityAdvertisementForHandle:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)startProximityDetectionForHandle:(id)a3 advertisement:(id)a4 completion:(id)a5;
- (void)universalShareURLForHandle:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDSharingChannelManager

- (PDSharingChannelManager)init
{
  return 0;
}

- (PDSharingChannelManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 pushNotificationManager:(id)a5 idsSharingService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)PDSharingChannelManager;
  v15 = [(PDSharingChannelManager *)&v40 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_databaseManager, a4);
    uint64_t v17 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    delegates = v16->_delegates;
    v16->_delegates = (NSHashTable *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackedHandles = v16->_trackedHandles;
    v16->_trackedHandles = v19;

    v21 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    trackedAncillaryServices = v16->_trackedAncillaryServices;
    v16->_trackedAncillaryServices = v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.sharingchannelmanager", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.sharingchannelmanager.reply", 0);
    replyQueue = v16->_replyQueue;
    v16->_replyQueue = (OS_dispatch_queue *)v25;

    v16->_lock._os_unfair_lock_opaque = 0;
    id v27 = [[PDDynamicAssociatedDomainService alloc] initDatabaseManager:v12];
    v28 = [[PDSharingRelayServerService alloc] initWithWebServiceCoordinator:v16->_webServiceCoordinator domainService:v27 pushNotificationManager:v13 delegate:v16];
    relayService = v16->_relayService;
    v16->_relayService = v28;

    v30 = [[PDAccessPassSharingIDSService alloc] initWithIDSSharingService:v14 delegate:v16];
    idsService = v16->_idsService;
    v16->_idsService = v30;

    v32 = [[PDSharingLocalOnDeviceService alloc] initWithDelegate:v16];
    localOnDeviceService = v16->_localOnDeviceService;
    v16->_localOnDeviceService = v32;

    v34 = [[PDSharingChannelMonitor alloc] initWithQueue:v16->_queue webServiceCoordinator:v16->_webServiceCoordinator databaseManager:v16->_databaseManager pushNotificationManager:v13 delegate:v16];
    monitor = v16->_monitor;
    v16->_monitor = v34;

    id v36 = objc_alloc((Class)NSXPCListener);
    v37 = (NSXPCListener *)[v36 initWithMachServiceName:PKSharingChannelServiceMachServiceName];
    coordinatorListener = v16->_coordinatorListener;
    v16->_coordinatorListener = v37;

    [(NSXPCListener *)v16->_coordinatorListener setDelegate:v16];
    [(NSXPCListener *)v16->_coordinatorListener resume];
  }
  return v16;
}

- (void)start
{
  [(PDSharingChannelMonitor *)self->_monitor start];
  idsService = self->_idsService;
  [(PDAccessPassSharingIDSService *)idsService start];
}

- (BOOL)isDescriptorValid:(id)a3
{
  v3 = [(PDSharingChannelManager *)self _endpointForDescriptor:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)handleForDescriptor:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PDSharingChannelManager *)self _endpointForDescriptor:v6];
  if (!v8)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get endpoint for descriptor: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = [(PDSharingChannelManager *)self _createHandleForEndpoint:v8 descriptor:v6 queue:v7];

  return v10;
}

- (void)sendMessageToDescriptor:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [(PDSharingChannelManager *)self _endpointForDescriptor:v8];
  if (v11)
  {
    os_unfair_lock_lock(&self->_lock);
    trackedHandles = self->_trackedHandles;
    id v13 = [v11 transportIdentifier];
    id v14 = [(NSMutableDictionary *)trackedHandles objectForKeyedSubscript:v13];

    if (v14)
    {
      unsigned int v15 = [v14 isServerForRemoteHandle];
      os_unfair_lock_unlock(&self->_lock);
      if (v15 && PKV2SharingFlowEnabled())
      {
        v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v11 transportIdentifier];
          v18 = PKSharingLoggableMailboxAddress();
          *(_DWORD *)buf = 138412546;
          id v31 = v18;
          __int16 v32 = 2112;
          id v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "WARNING: Blocking message from being sent on channel %@ because active handle owned by remote process. \n\n message: %@", buf, 0x16u);
        }
        v10[2](v10, 1, 0);
        goto LABEL_21;
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v11 transportIdentifier];
      v22 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138412290;
      id v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WARNING: Allowing message to be sent on channel %@ without checking handle.", buf, 0xCu);
    }
    dispatch_queue_t v23 = [v9 payload];
    v24 = [v9 displayInformation];
    id v29 = 0;
    dispatch_queue_t v25 = +[PKSharingMessage specializedMessageFromPayload:v23 displayInformation:v24 outError:&v29];
    id v26 = v29;

    if (v26)
    {
      id v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to create specialized message from %@", buf, 0xCu);
      }

      v28 = PDBasicError();
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v28);
    }
    else
    {
      [(PDSharingChannelManager *)self _sendMessage:v25 toEndpoint:v11 completion:v10];
    }
  }
  else
  {
    v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to send message because unable to get endpoint for descriptor: %@ \n\n message: %@", buf, 0x16u);
    }

    id v14 = PDBasicError();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v14);
  }
LABEL_21:
}

- (id)_endpointForDescriptor:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 type])
  {
    case 1uLL:
      databaseManager = self->_databaseManager;
      id v6 = [v4 transportIdentifier];
      id v7 = [(PDDatabaseManager *)databaseManager sharingEndpointForTransportIdentifier:v6];
      goto LABEL_56;
    case 2uLL:
      id v6 = [v4 transferToken];
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v9 = self->_trackedHandles;
      id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v10)
      {
        id v11 = v10;
        v43 = &self->_lock;
        id v44 = v4;
        uint64_t v12 = *(void *)v46;
        while (1)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedHandles, "objectForKeyedSubscript:", *(void *)(*((void *)&v45 + 1) + 8 * i), v43, v44, (void)v45);
            id v15 = [v14 transferToken];
            id v16 = v6;
            uint64_t v17 = v16;
            if (v15 == v16)
            {

LABEL_34:
              __int16 v32 = [v14 handle];
              id v7 = [v32 endpoint];

LABEL_35:
              p_lock = v43;
              id v4 = v44;
              goto LABEL_37;
            }
            if (v6 && v15)
            {
              unsigned int v18 = [v15 isEqualToString:v16];

              if (v18) {
                goto LABEL_34;
              }
            }
            else
            {
            }
          }
          id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (!v11)
          {
            id v7 = 0;
            goto LABEL_35;
          }
        }
      }
      id v7 = 0;
LABEL_37:

      os_unfair_lock_unlock(p_lock);
LABEL_56:

LABEL_57:
      return v7;
    case 3uLL:
      id v6 = v4;
      id v19 = [v6 subtype];
      if (v19 != (id)2)
      {
        if (v19 != (id)1) {
          goto LABEL_32;
        }
        if ([v6 stateful]) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = 1;
        }
        relayService = self->_relayService;
        v22 = [v6 region];
        id v7 = [(PDSharingRelayServerService *)relayService endpointOfType:v20 region:v22];
        goto LABEL_55;
      }
      v22 = [v6 existingChannelURL];
      uint64_t v33 = [v6 existingMailboxIdentifier];
      v24 = (void *)v33;
      if (v22)
      {
        dispatch_queue_t v25 = [(PDSharingRelayServerService *)self->_relayService relayEndpointForMailboxAddress:v22];
        goto LABEL_40;
      }
      if (v33)
      {
        v41 = [(PDDatabaseManager *)self->_databaseManager sharingEndpointForTransportIdentifier:v33];
        goto LABEL_46;
      }
      goto LABEL_53;
    case 4uLL:
      id v6 = v4;
      v22 = [v6 deviceIdentifier];
      id v23 = [v6 subtype];
      if (v23 == (id)2) {
        goto LABEL_27;
      }
      if (v23 == (id)1)
      {
        v24 = [(PDAccessPassSharingIDSService *)self->_idsService resolveRemoteAddressForDeviceIdentifier:v22];
        id v7 = [[PDSharingIDSEndpoint alloc] initWithDeviceIdentifier:v24];
        [(PDSharingIDSEndpoint *)v7 setIsDeviceOnSameIDSAccount:2];
        goto LABEL_54;
      }
      if (v23)
      {
        id v7 = 0;
        goto LABEL_55;
      }
LABEL_27:
      v24 = [v6 sessionIdentifier];
      if (v24)
      {
        dispatch_queue_t v25 = [[PDSharingIDSEndpoint alloc] initWithSessionIdentifier:v24 deviceIdentifier:v22];
LABEL_40:
        v34 = v25;
        v35 = self->_databaseManager;
        id v36 = [(PDSharingIDSEndpoint *)v25 transportIdentifier];
        uint64_t v37 = [(PDDatabaseManager *)v35 sharingEndpointForTransportIdentifier:v36];
        v38 = (void *)v37;
        if (v37) {
          v39 = (void *)v37;
        }
        else {
          v39 = v34;
        }
        id v7 = v39;
      }
      else
      {
        if (v22)
        {
          v41 = [[PDSharingIDSEndpoint alloc] initWithDeviceIdentifier:v22];
          goto LABEL_46;
        }
LABEL_53:
        id v7 = 0;
      }
      goto LABEL_54;
    case 5uLL:
      id v6 = v4;
      id v26 = [v6 subtype];
      if (v26 == (id)1)
      {
        objc_super v40 = [PDSharingLocalOnDeviceEndpoint alloc];
        v22 = [v6 contraChannelTransportIdentifier];
        v24 = [v6 transportIdentifier];
        v28 = v40;
        id v29 = v22;
        v30 = v24;
        uint64_t v31 = 0;
      }
      else
      {
        if (v26)
        {
LABEL_32:
          id v7 = 0;
          goto LABEL_56;
        }
        id v27 = [PDSharingLocalOnDeviceEndpoint alloc];
        v22 = [v6 transportIdentifier];
        v24 = [v6 contraChannelTransportIdentifier];
        v28 = v27;
        id v29 = v22;
        v30 = v24;
        uint64_t v31 = 1;
      }
      v41 = [(PDSharingLocalOnDeviceEndpoint *)v28 initWithSourceTransportIdentifier:v29 destinationTransportIdentifier:v30 isSource:v31];
LABEL_46:
      id v7 = v41;
LABEL_54:

LABEL_55:
      goto LABEL_56;
    default:
      id v7 = 0;
      goto LABEL_57;
  }
}

- (id)_createHandleForEndpoint:(id)a3 descriptor:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 transportIdentifier];
  if (!v11)
  {
    v24 = 0;
    goto LABEL_15;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v28 = 0;
  unsigned int v13 = [(PDSharingChannelManager *)self _lock_canTrackHandleForTransportIdentifier:v11 descriptor:v9 existing:&v28];
  id v14 = v28;
  id v15 = v14;
  if (v13)
  {
    if (v14)
    {
      id v16 = [v14 handle];
      [v16 invalidateForTransfer];
    }
    uint64_t v17 = [[PDSharingChannelHandle alloc] initWithEndpoint:v8 queue:v10 delegate:self dataSource:self];
    unsigned int v18 = v17;
    if (!v17) {
      goto LABEL_14;
    }
    databaseManager = self->_databaseManager;
    uint64_t v20 = [(PDSharingChannelHandle *)v17 transportIdentifier];
    v21 = [(PDDatabaseManager *)databaseManager sharingMessagesForTransportIdentifier:v20];

    [(PDSharingChannelHandle *)v18 didReceiveMessages:v21];
    v22 = [[PDSharingChannelHandleTracker alloc] initWithHandle:v18];
    [(NSMutableDictionary *)self->_trackedHandles setObject:v22 forKeyedSubscript:v11];
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138412290;
      v30 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Handle<%@> Tracking ", buf, 0xCu);
    }
  }
  else
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v25 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Handle<%@> Attempted to use channel, but channel already in use.", buf, 0xCu);
    }
    unsigned int v18 = 0;
  }

LABEL_14:
  os_unfair_lock_unlock(p_lock);
  v24 = v18;

LABEL_15:
  return v24;
}

- (id)_lock_sharingChannelHandleForEndpoint:(id)a3
{
  id v4 = [a3 transportIdentifier];
  v5 = [(NSMutableDictionary *)self->_trackedHandles objectForKeyedSubscript:v4];
  id v6 = [v5 handle];

  return v6;
}

- (void)cacheSharingMessageForDescriptor:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = [(PDSharingChannelManager *)self _endpointForDescriptor:a3];
  if (v7)
  {
    databaseManager = self->_databaseManager;
    id v11 = v6;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    id v10 = [v7 transportIdentifier];
    [(PDDatabaseManager *)databaseManager insertOrUpdateSharingMessages:v9 storePayloads:1 transportIdentifier:v10];
  }
}

- (void)prewarmEndpointCreationForDescriptor:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  if ([v11 type] == (id)3)
  {
    id v9 = v11;
    if ([v9 subtype] == (id)1)
    {
      if ([v9 stateful]) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
      [(PDSharingRelayServerService *)self->_relayService prewarmEndpointCreationOfType:v10 count:a4 completion:v8];

      goto LABEL_9;
    }
  }
  v8[2](v8, 1);
LABEL_9:
}

- (void)_handleWasInvalidatedForTransportIdentifier:(id)a3 triggeredByClient:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    id v7 = [(NSMutableDictionary *)self->_trackedHandles objectForKeyedSubscript:v6];
    id v8 = [v7 handle];
    os_unfair_lock_unlock(&self->_lock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10019C8E8;
    v12[3] = &unk_10072E238;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v9 = v7;
    uint64_t v10 = objc_retainBlock(v12);
    id v11 = v10;
    if (a4 || !v8) {
      ((void (*)(void *))v10[2])(v10);
    }
    else {
      [v8 invalidate];
    }
  }
}

- (void)_handleDidInvalidateForTransportIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PDDatabaseManager *)self->_databaseManager sharingEndpointForTransportIdentifier:v4];
  id v6 = v5;
  if (v5 && [v5 channelType] == (id)1)
  {
    id v7 = [(PDDatabaseManager *)self->_databaseManager sharingMessagesForTransportIdentifier:v4];
    id v8 = [v7 firstObject];

    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10019CADC;
      v9[3] = &unk_10073BF60;
      id v10 = v8;
      id v11 = v4;
      [(PDSharingChannelManager *)self _notifyDelegatesWithBlock:v9];
    }
  }
}

- (void)addDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSHashTable *)self->_delegates copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
        replyQueue = self->_replyQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10019CD40;
        block[3] = &unk_10072E598;
        id v12 = v4;
        block[4] = v10;
        id v15 = v12;
        dispatch_async(replyQueue, block);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_lock_addAncillaryService:(id)a3 forTracker:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_trackedAncillaryServices objectForKey:v8];
  if (!v7)
  {
    id v7 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    [(NSMapTable *)self->_trackedAncillaryServices setObject:v7 forKey:v8];
  }
  [v7 addObject:v6];
}

- (void)_lock_removeAncillaryService:(id)a3 forTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_trackedAncillaryServices objectForKey:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 removeObject:v7];
    if (![v9 count])
    {
      [(NSMapTable *)self->_trackedAncillaryServices removeObjectForKey:v6];
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10019CEEC;
      block[3] = &unk_10072E1E8;
      id v12 = v6;
      dispatch_async(queue, block);
    }
  }
}

- (void)_lock_removeAncillaryServiceForTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_trackedAncillaryServices keyEnumerator];
  id v6 = [v5 allObjects];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PDSharingChannelManager _lock_removeAncillaryService:forTracker:](self, "_lock_removeAncillaryService:forTracker:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v4, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_lock_removeAncillaryService:(id)a3
{
  id v4 = a3;
  [(NSMapTable *)self->_trackedAncillaryServices removeObjectForKey:v4];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019D0C8;
  block[3] = &unk_10072E1E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)channelForEndpoint:(id)a3
{
  id v4 = [a3 channelType];
  if (v4 == (id)3)
  {
    localOnDeviceService = self->_localOnDeviceService;
    goto LABEL_7;
  }
  if (v4 == (id)2)
  {
    localOnDeviceService = self->_idsService;
    goto LABEL_7;
  }
  if (v4 == (id)1)
  {
    localOnDeviceService = self->_relayService;
LABEL_7:
    id v6 = localOnDeviceService;
    goto LABEL_9;
  }
  +[NSException raise:NSInternalInconsistencyException format:@"Sharing channel requested for endpoint, but none found"];
  id v6 = 0;
LABEL_9:
  return v6;
}

- (BOOL)canHandleOutstandingMessagesOnEndpoint:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(PDSharingChannelManager *)self _lock_sharingChannelHandleForEndpoint:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    databaseManager = self->_databaseManager;
    id v8 = [v4 transportIdentifier];
    id v9 = [(PDDatabaseManager *)databaseManager passShareForTransportIdentifier:v8];

    BOOL v6 = v9 != 0;
    if (!v9)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v4 transportIdentifier];
        long long v12 = PKSharingLoggableMailboxAddress();
        int v14 = 138543362;
        long long v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDSharingManager: Error: Unable to find active share for endpoint %{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  return v6;
}

- (void)handleOutstandingShareMessage:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(PDSharingChannelManager *)self _lock_sharingChannelHandleForEndpoint:v7];
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    id v13 = v6;
    id v9 = +[NSArray arrayWithObjects:&v13 count:1];
    [v8 didReceiveMessages:v9];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10019D418;
    v10[3] = &unk_10073BF60;
    id v11 = v6;
    id v12 = v7;
    [(PDSharingChannelManager *)self _notifyDelegatesWithBlock:v10];

    id v9 = v11;
  }
}

- (void)endpointWasRemotelyTerminated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transportIdentifier];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = PKSharingLoggableMailboxAddress();
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting endpoint %@ because it was terminated remotely.", buf, 0xCu);
  }
  [(PDDatabaseManager *)self->_databaseManager deleteSharingEndpoint:v4];

  [(PDSharingChannelManager *)self _handleWasInvalidatedForTransportIdentifier:v5 triggeredByClient:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10019D5F0;
  v9[3] = &unk_10073BF88;
  id v10 = v5;
  id v8 = v5;
  [(PDSharingChannelManager *)self _notifyDelegatesWithBlock:v9];
}

- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4
{
}

- (void)endpointWasUpdated:(id)a3 oldTransportIdentifier:(id)a4 allowCreation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 transportIdentifier];
  id v11 = v10;
  if (v9)
  {
    id v12 = v10;
    id v13 = v9;
    if (v12 == v13)
    {
      char v14 = 0;
    }
    else if (v12)
    {
      char v14 = [v12 isEqualToString:v13] ^ 1;
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
    id v13 = v10;
  }
  id v15 = v13;
  if (a5
    || ([(PDDatabaseManager *)self->_databaseManager sharingEndpointForTransportIdentifier:v15], long long v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    [(PDDatabaseManager *)self->_databaseManager insertSharingEndpoint:v8];
    long long v18 = [(NSMutableDictionary *)self->_trackedHandles objectForKeyedSubscript:v15];
    long long v19 = [v18 handle];
    [v19 setEndpoint:v8];

    if (v14)
    {
      [(PDDatabaseManager *)self->_databaseManager deleteSharingEndpointForTransportIdentifier:v9];
      [(NSMutableDictionary *)self->_trackedHandles setObject:0 forKeyedSubscript:v9];
      [(NSMutableDictionary *)self->_trackedHandles setObject:v18 forKeyedSubscript:v11];
      uint64_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = PKSharingLoggableMailboxAddress();
        v22 = PKSharingLoggableMailboxAddress();
        int v24 = 138412546;
        dispatch_queue_t v25 = v21;
        __int16 v26 = 2112;
        id v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Handle<%@> Changed to %@", (uint8_t *)&v24, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      if (v18 && [v18 isServerForRemoteHandle])
      {
        id v23 = [v18 handle];
        [v23 didReceiveUpdatedTransportIdentifier:v11 reply:0];
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)didReceiveIDSShareMessage:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 transportIdentifier];
  id v9 = [(PDDatabaseManager *)self->_databaseManager sharingEndpointForTransportIdentifier:v8];
  id v10 = v9;
  if (v9)
  {
    if ([v9 channelType] != (id)2)
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        id v12 = "WARNING: Received IDS message, but existing channel is not IDS. Ignoring message.";
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    if (![(PDAccessPassSharingIDSService *)self->_idsService isEndpoint:v7 forSameDeviceIn:v10])
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        id v12 = "Received IDS message, but existing channel is for different device. Ignoring message.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v15, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    [(PDDatabaseManager *)self->_databaseManager insertSharingEndpoint:v7];
  }
  databaseManager = self->_databaseManager;
  id v16 = v6;
  char v14 = +[NSArray arrayWithObjects:&v16 count:1];
  [(PDDatabaseManager *)databaseManager insertOrUpdateSharingMessages:v14 storePayloads:1 transportIdentifier:v8];

  [(PDSharingChannelManager *)self handleOutstandingShareMessage:v6 endpoint:v7];
LABEL_12:
}

- (void)didReceiveLocalShareMessage:(id)a3 endpoint:(id)a4
{
  databaseManager = self->_databaseManager;
  id v11 = a3;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  id v10 = objc_msgSend(v7, "transportIdentifier", v11);
  [(PDDatabaseManager *)databaseManager insertOrUpdateSharingMessages:v9 storePayloads:1 transportIdentifier:v10];

  [(PDSharingChannelManager *)self handleOutstandingShareMessage:v8 endpoint:v7];
}

- (void)sharingChannelHandle:(id)a3 wasInvalidatedRemotelyForEndpoint:(id)a4
{
  objc_msgSend(a4, "transportIdentifier", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PDSharingChannelManager *)self _handleWasInvalidatedForTransportIdentifier:v5 triggeredByClient:1];
}

- (BOOL)configureHandle:(id)a3 forDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDSharingChannelManager *)self _endpointForDescriptor:v7];
  if (v8)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v10 = [v8 transportIdentifier];
    id v21 = 0;
    BOOL v11 = [(PDSharingChannelManager *)self _lock_canTrackHandleForTransportIdentifier:v10 descriptor:v7 existing:&v21];
    id v12 = v21;
    id v13 = v12;
    if (!v11)
    {
      PKLogFacilityTypeGetObject();
      long long v18 = (PDSharingChannelHandleTracker *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138412290;
        id v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_DEFAULT, "Handle<%@> Attempted to use channel, but channel already in use.", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (v12)
    {
      char v14 = [v12 handle];
      [v14 invalidateForTransfer];

      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        long long v17 = "Handle<%@> Transferring";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        long long v17 = "Handle<%@> Tracking";
        goto LABEL_13;
      }
    }

    long long v18 = [[PDSharingChannelHandleTracker alloc] initWithHandle:v6];
    [(PDSharingChannelHandleTracker *)v18 setIsServerForRemoteHandle:1];
    [(NSMutableDictionary *)self->_trackedHandles setObject:v18 forKeyedSubscript:v10];
    [v6 setEndpoint:v8];
LABEL_15:

    os_unfair_lock_unlock(p_lock);
    goto LABEL_16;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to get endpoint to configure handled for descriptor: %@", buf, 0xCu);
  }
  LOBYTE(v11) = 0;
LABEL_16:

  return v11;
}

- (BOOL)_lock_canTrackHandleForTransportIdentifier:(id)a3 descriptor:(id)a4 existing:(id *)a5
{
  id v8 = a4;
  id v9 = [(NSMutableDictionary *)self->_trackedHandles objectForKeyedSubscript:a3];
  id v10 = v9;
  if (v9)
  {
    if (a5) {
      *a5 = v9;
    }
    if ([v8 type] == (id)2)
    {
      BOOL v11 = [v8 transferToken];
      id v12 = [v10 transferToken];
      id v13 = v11;
      char v14 = v13;
      if (v12 == v13)
      {
        unsigned __int8 v15 = 1;
      }
      else
      {
        unsigned __int8 v15 = 0;
        if (v13 && v12) {
          unsigned __int8 v15 = [v12 isEqualToString:v13];
        }
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (void)ancillaryServiceDidTerminate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PDSharingChannelManager *)self _lock_removeAncillaryService:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)pingForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 endpoint];
  id v8 = [(PDSharingChannelManager *)self channelForEndpoint:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019E06C;
  v10[3] = &unk_10072E570;
  id v11 = v6;
  id v9 = v6;
  [v8 pingEndpoint:v7 completion:v10];
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 endpoint];
  [(PDSharingChannelManager *)self _sendMessage:v9 toEndpoint:v10 completion:v8];
}

- (void)_sendMessage:(id)a3 toEndpoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PDSharingChannelManager *)self channelForEndpoint:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10019E218;
  v15[3] = &unk_10073BFB0;
  v15[4] = self;
  id v16 = v8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  id v17 = v9;
  id v11 = v18;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 sendMessageTo:v13 message:v14 completion:v15];
}

- (void)attachForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endpoint];
  id v9 = [(PDSharingChannelManager *)self channelForEndpoint:v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019E44C;
  v12[3] = &unk_10073BFD8;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v9 checkOutstandingMessagesOn:v8 completion:v12];
}

- (void)closeForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endpoint];
  id v9 = [(PDSharingChannelManager *)self channelForEndpoint:v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019E720;
  v12[3] = &unk_10073C000;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 closeEndpoint:v8 completion:v12];
}

- (void)relinquishForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endpoint];
  id v9 = [(PDSharingChannelManager *)self channelForEndpoint:v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019E8CC;
  v12[3] = &unk_10073C000;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 relinquishEndpoint:v8 completion:v12];
}

- (void)didHandleMessageForHandle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = [a3 endpoint];
  id v11 = [v10 transportIdentifier];
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = PKSharingLoggableMailboxAddress();
    *(_DWORD *)buf = 138412546;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handle<%@> Handled message %@", buf, 0x16u);
  }
  databaseManager = self->_databaseManager;
  id v16 = v8;
  id v15 = +[NSArray arrayWithObjects:&v16 count:1];
  [(PDDatabaseManager *)databaseManager insertOrUpdateSharingMessages:v15 storePayloads:0 transportIdentifier:v11];

  v9[2](v9);
}

- (void)universalShareURLForHandle:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [a3 endpoint];
  id v10 = [(PDSharingChannelManager *)self channelForEndpoint:v11];
  [v10 universalShareURLForEndpoint:v11 urlDecoration:v9 completion:v8];
}

- (void)fetchHandleTransferTokenForHandle:(id)a3 completion:(id)a4
{
  p_lock = &self->_lock;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [v8 transportIdentifier];

  id v10 = [(NSMutableDictionary *)self->_trackedHandles objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSUUID);
    uint64_t v12 = [v11 UUIDString];

    [v10 setTransferToken:v12];
    os_unfair_lock_unlock(p_lock);
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = PKSharingLoggableMailboxAddress();
      int v17 = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handle<%@> Created transfer token: '%@'", (uint8_t *)&v17, 0x16u);
    }
    v7[2](v7, v12);

    id v7 = (void (**)(id, uint64_t))v12;
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = PKSharingLoggableMailboxAddress();
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle<%@> Failed create transfer token", (uint8_t *)&v17, 0xCu);
    }
    v7[2](v7, 0);
  }
}

- (void)descriptorsForAccountDevicesForHandle:(id)a3 completion:(id)a4
{
  id v5 = a4;
  idsService = self->_idsService;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019EE10;
  v8[3] = &unk_100736918;
  id v9 = v5;
  id v7 = v5;
  [(PDAccessPassSharingIDSService *)idsService devicesWithCompletion:v8];
}

- (void)remoteDeviceInformationForHandle:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v6 = [a3 endpoint];
  id v7 = [v6 channelType];
  if ((unint64_t)v7 < 2)
  {
LABEL_4:
    v8[2](v8, 0);
    goto LABEL_6;
  }
  if (v7 != (id)2)
  {
    if (v7 != (id)3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  [(PDAccessPassSharingIDSService *)self->_idsService remoteDeviceInformationForEndpoint:v6 completion:v8];
LABEL_6:
}

- (void)startProximityAdvertisementForHandle:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  id v9 = (void (**)(void, void))v8;
  if (a4 == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    id v10 = [(NSMapTable *)self->_trackedAncillaryServices keyEnumerator];
    id v11 = [v10 allObjects];
    objc_msgSend(v11, "pk_firstObjectPassingTest:", &stru_10073C080);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12) {
      id v12 = [[PDSharingChannel_BLEProximityVerificationAncillaryService alloc] initAdvertiserDelegate:self completion:&stru_10073C0A0];
    }
    trackedHandles = self->_trackedHandles;
    id v14 = [v19 transportIdentifier];
    id v15 = [(NSMutableDictionary *)trackedHandles objectForKeyedSubscript:v14];

    if (v15)
    {
      [(PDSharingChannelManager *)self _lock_addAncillaryService:v12 forTracker:v15];
      os_unfair_lock_unlock(&self->_lock);
      if (v12)
      {
        id v16 = objc_alloc((Class)PKContinuityProximityBLEAdvertisement);
        int v17 = PKSerialNumber();
        id v18 = [v16 initWithIdentifier:v17];
        ((void (**)(void, id))v9)[2](v9, v18);

        [v12 start];
        goto LABEL_11;
      }
    }
    else
    {

      os_unfair_lock_unlock(&self->_lock);
    }
    v9[2](v9, 0);
  }
  else if (!a4)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
LABEL_11:
}

- (void)startProximityDetectionForHandle:(id)a3 advertisement:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019F28C;
  v12[3] = &unk_10073C0C8;
  id v13 = a4;
  id v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v8;
  id v10 = v16;
  id v11 = v13;
  [v9 remoteDeviceInformation:v12];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  signed int v6 = [v5 processIdentifier];
  id v7 = [objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v5];
  if (([v7 sharingAllAccess] & 1) != 0
    || [v7 paymentAllAccess])
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDSharingChannelManager: Adding connection from pid: %d", (uint8_t *)&v14, 8u);
    }

    id v9 = [[PDSharingChannelHandle_Server alloc] initWithConnection:v5 queue:self->_replyQueue delegate:self dataSource:self];
    id v10 = PDSharingChannelServiceInterface_Server();
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:v9];
    id v11 = PKSharingChannelServiceInterface_Client();
    [v5 setRemoteObjectInterface:v11];

    [v5 resume];
    BOOL v12 = 1;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v9 = (PDSharingChannelHandle_Server *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      id v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "PDSharingChannelManager: rejecting connection %p - remote process %ld missing entitlement com.apple.wallet.application-authorization.", (uint8_t *)&v14, 0x16u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (PDSharingChannelMonitor)monitor
{
  return self->_monitor;
}

- (PDAccessPassSharingIDSService)idsService
{
  return self->_idsService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_trackedAncillaryServices, 0);
  objc_storeStrong((id *)&self->_trackedHandles, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coordinatorListener, 0);
  objc_storeStrong((id *)&self->_localOnDeviceService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
}

@end