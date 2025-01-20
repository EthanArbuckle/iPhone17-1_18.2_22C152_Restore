@interface MRDAVHostedRoutingController
+ (id)_expectedSuffixForNewEndpointWithGroupLeader:(id)a3 outputDevices:(id)a4;
- (id)_createGroupsFrom:(id)a3 availableOutputDevices:(id)a4;
- (id)_createNativeGroupForLocalDeviceFromNativeOutputDevice:(id)a3 availableOutputDevices:(id)a4;
- (id)_maybeAddNativeGroupToGroups:(id)a3 availableOutputDevices:(id)a4;
- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4;
- (id)_sortNativeGroupToEnd:(id)a3;
- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4;
- (void)_logEndpointsChanged:(id)a3 oldEndpoints:(id)a4;
- (void)_onQueue_reloadEndpoints;
- (void)_onQueue_reloadWithOutputDevices:(id)a3;
@end

@implementation MRDAVHostedRoutingController

- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10007821C;
  v19 = sub_10007822C;
  id v20 = 0;
  serialQueue = self->super._serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078234;
  v11[3] = &unk_100418A78;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch((unint64_t)[v6 transportType])
  {
    case 1uLL:
    case 5uLL:
      if ([v5 connectionType] == (id)5)
      {
        v7 = [v5 outputDevices];
        id v8 = [v7 firstObject];
        id v9 = [v8 groupID];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v10 = objc_msgSend(v5, "outputDevices", 0);
        id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              v16 = [v6 uid];
              unsigned int v17 = [v15 containsUID:v16];

              if (v17)
              {
                uint64_t v18 = [v15 groupID];

                id v9 = (void *)v18;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v12);
        }
      }
      else
      {
        id v9 = 0;
      }
      id v19 = objc_msgSend(objc_alloc((Class)MRAVOutputDeviceTransport), "initWithOutputDevice:groupID:connectionType:", v6, v9, objc_msgSend(v5, "connectionType"));

      break;
    case 2uLL:
      id v21 = objc_alloc((Class)MRRapportTransport);
      v22 = [v5 outputDevices];
      v23 = [v22 firstObject];
      id v19 = [v21 initWithOutputDevice:v23 proxyOutputDevice:v6];

      break;
    case 3uLL:
      id v20 = (__objc2_class *)MRIDSCompanionTransport;
      goto LABEL_21;
    case 4uLL:
      id v20 = MRDIDSTransport;
      goto LABEL_21;
    case 6uLL:
      id v20 = MRDGroupSessionTransport;
      goto LABEL_21;
    case 7uLL:
      id v20 = MRDMRRelayTransport;
LABEL_21:
      id v19 = [[v20 alloc] initWithOutputDevice:v6];
      break;
    default:
      id v19 = 0;
      break;
  }

  return v19;
}

- (void)_onQueue_reloadEndpoints
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._serialQueue);
  v68 = +[NSMutableDictionary dictionary];
  v3 = [(MRAVEndpoint *)self->super._localEndpoint outputDevices];
  id v64 = [(NSArray *)self->super._distantOutputDevices mutableCopy];
  v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  id v5 = [(MRDHostedRoutingController *)self deviceInfo];
  v69 = [v5 deviceUID];

  id v6 = [(MRDHostedRoutingController *)self deviceInfo];
  v65 = [v6 airPlayGroupUID];

  v7 = [(MRDHostedRoutingController *)self deviceInfo];
  unsigned int v8 = [v7 isGroupLeader];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100078F6C;
  v87[3] = &unk_100418AA0;
  char v88 = v8;
  v63 = self;
  v87[4] = self;
  int v66 = sub_100078F6C((uint64_t)v87);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v3;
  id v9 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v84;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v84 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        unint64_t v14 = [v13 uid];
        if (([v13 isLocalDevice] ^ 1 | v8))
        {
          if ([v14 length]) {
            [v4 addObject:v14];
          }
        }
        else
        {
          [v13 setAirPlayGroupID:v65];
          id v15 = objc_alloc((Class)MRAVDistantOutputDevice);
          v16 = [v13 descriptor];
          id v17 = [v15 initWithDescriptor:v16];

          id v18 = v17;
          id v19 = [v18 uid];
          if ([v19 length])
          {
            id v20 = [v18 groupID];
            id v21 = [v20 length];

            if (v21) {
              [v64 addObject:v18];
            }
          }
          else
          {
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v10);
  }

  v22 = +[MRAVClusterController sharedController];
  id v23 = [v22 clusterStatus];

  v24 = [(MRDHostedRoutingController *)v63 filterOutputDevices:v64 remoteControllableOnly:1];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v80;
    if (v23 == (id)2) {
      int v28 = 1;
    }
    else {
      int v28 = v66 ^ 1;
    }
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v80 != v27) {
          objc_enumerationMutation(v24);
        }
        v30 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
        v31 = [v30 uid];
        if ([v4 containsObject:v31])
        {

          if (!v28) {
            continue;
          }
        }
        else
        {
          unsigned int v32 = [v30 containsUID:v69];

          if ((v32 & v66) == 1 && v23 != (id)2) {
            continue;
          }
        }
        if ([v30 isProxyGroupPlayer])
        {
          if ([v30 containsUID:v69] && v23 != (id)2)
          {
            v35 = +[MRUserSettings currentSettings];
            unsigned int v36 = [v35 supportMultiplayerHost];

            if (!v36) {
              continue;
            }
          }
        }
        v37 = [v30 groupID];
        v38 = [v68 objectForKeyedSubscript:v37];
        if (!v38)
        {
          v38 = +[NSMutableArray array];
          [v68 setObject:v38 forKeyedSubscript:v37];
        }
        [v38 addObject:v30];
      }
      id v26 = [v24 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v26);
  }
  v39 = [(MRDAVHostedRoutingController *)v63 _createGroupsFrom:v68 availableOutputDevices:v24];
  v40 = [(MRDAVHostedRoutingController *)v63 _maybeAddNativeGroupToGroups:v39 availableOutputDevices:v24];
  v61 = objc_msgSend(v40, "msv_map:", &stru_100418AE0);
  v60 = -[MRDHostedExternalDeviceManager disconnectUndiscoverableEndpoints:](v63->super._externalDeviceManager, "disconnectUndiscoverableEndpoints:");
  v62 = v40;
  v41 = [(MRDAVHostedRoutingController *)v63 _sortNativeGroupToEnd:v40];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v42 = [v41 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v76;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v76 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
        v47 = [v46 externalDevice];
        v48 = [v46 distantEndpoint];
        [v47 hostedExternalDeviceEndpointDidChange:v48];
      }
      id v43 = [v41 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v43);
  }
  v49 = objc_msgSend(v39, "msv_map:", &stru_100418B00);
  if (v66)
  {
    id v50 = objc_alloc((Class)MRAVDistantEndpoint);
    v51 = [(MRAVEndpoint *)v63->super._localEndpoint descriptor];
    id v52 = [v50 initWithDescriptor:v51];
    uint64_t v53 = [v49 arrayByAddingObject:v52];

    v49 = (void *)v53;
  }
  [(MRDAVHostedRoutingController *)v63 _logEndpointsChanged:v49 oldEndpoints:v63->super._distantEndpoints];
  v54 = objc_msgSend(v39, "msv_map:", &stru_100418B20);
  objc_storeStrong((id *)&v63->super._availableEndpoints, v54);
  objc_storeStrong((id *)&v63->super._distantEndpoints, v49);
  v55 = [(NSHashTable *)v63->super._weakObservers allObjects];
  observerCalloutQueue = v63->super._observerCalloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079004;
  block[3] = &unk_1004162F8;
  id v71 = v55;
  v72 = v63;
  id v73 = v54;
  id v74 = v49;
  id v57 = v49;
  id v58 = v54;
  id v59 = v55;
  dispatch_async(observerCalloutQueue, block);
}

- (id)_createGroupsFrom:(id)a3 availableOutputDevices:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000791FC;
  v8[3] = &unk_100418B48;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  id v6 = objc_msgSend(a3, "msv_compactMap:", v8);

  return v6;
}

- (id)_maybeAddNativeGroupToGroups:(id)a3 availableOutputDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = objc_msgSend(v8, "msv_firstWhere:", &stru_100418B88);
  id v10 = v8;
  if (!v9)
  {
    uint64_t v11 = +[MRUserSettings currentSettings];
    unsigned int v12 = [v11 supportMultiplayerHost];

    if (v12)
    {
      uint64_t v13 = [(MRDHostedRoutingController *)self discoverySession];
      unint64_t v14 = [v13 nativeOutputDevice];
      id v9 = [(MRDAVHostedRoutingController *)self _createNativeGroupForLocalDeviceFromNativeOutputDevice:v14 availableOutputDevices:v7];

      if (v9)
      {
        id v10 = [v8 arrayByAddingObject:v9];

        goto LABEL_9;
      }
      id v15 = MRLogCategoryDiscovery();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No NativeGroup", (uint8_t *)&v19, 2u);
      }
    }
    id v9 = 0;
    id v10 = v8;
  }
LABEL_9:
  v16 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v9 distantEndpoint];
    int v19 = 138412290;
    id v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "NativeGroup: %@", (uint8_t *)&v19, 0xCu);
  }

  return v10;
}

- (id)_sortNativeGroupToEnd:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_100418BE8];
}

- (id)_createNativeGroupForLocalDeviceFromNativeOutputDevice:(id)a3 availableOutputDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MRUserSettings currentSettings];
  unsigned int v9 = [v8 supportMultiplayerHost];

  if (v9)
  {
    if (v6)
    {
      id v10 = objc_msgSend(v7, "msv_firstWhere:", &stru_100418C08);
      uint64_t v11 = +[MRDAVOutputContextManager sharedManager];
      unsigned int v12 = [v11 outputContextForOutputDevice:v6];

      uint64_t v13 = [v12 contextID];
      if (v13)
      {
        id v14 = objc_alloc((Class)MRConcreteEndpoint);
        if (v10) {
          id v15 = v10;
        }
        else {
          id v15 = v6;
        }
        v29 = v15;
        v16 = +[NSArray arrayWithObjects:&v29 count:1];
        id v17 = [v14 initWithDesignatedGroupLeader:v6 outputDevices:v16 preferredSuffix:v13];

        char v24 = 0;
        id v18 = [(MRDHostedRoutingController *)self _onQueue_makeLocalHostedExternalDeviceForEndpoint:v17 didCreate:&v24];
        if (v24)
        {
          int v19 = _MRLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v17 uniqueIdentifier];
            id v21 = [v18 externalDevice];
            *(_DWORD *)buf = 138412546;
            id v26 = v20;
            __int16 v27 = 2112;
            int v28 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[HostedRoutingController] Create nativeEndpoint for endpoint=%@ externalDevice=%@", buf, 0x16u);
          }
        }
        v22 = [[MRDAVHostedRoutingControllerGroup alloc] initWithEndpoint:v17 externalDevice:v18];
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      id v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[HostedRoutingController] Unable to create nativeGroup: no nativeOutputDevice", buf, 2u);
      }
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)_expectedSuffixForNewEndpointWithGroupLeader:(id)a3 outputDevices:(id)a4
{
  id v4 = a4;
  id v5 = objc_msgSend(v4, "msv_firstWhere:", &stru_100418C28);
  if (!v5)
  {
    id v5 = [v4 firstObject];
  }
  id v6 = [v5 groupID];
  id v7 = MRComputeGroupContextID();

  if (!v7)
  {
    id v8 = +[MRDAVOutputContextManager sharedManager];
    unsigned int v9 = [v8 outputContextForOutputDevice:v5];

    id v7 = [v9 contextID];
  }

  return v7;
}

- (void)_onQueue_reloadWithOutputDevices:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRDAVHostedRoutingController;
  [(MRDHostedRoutingController *)&v4 _onQueue_reloadWithOutputDevices:a3];
  [(MRDAVHostedRoutingController *)self _onQueue_reloadEndpoints];
}

- (void)_logEndpointsChanged:(id)a3 oldEndpoints:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  id v6 = [v5 changeDescriptionTo:a3 keyBlock:&stru_100418C68 isUpdatedBlock:&stru_100418CA8 descriptionBlock:&stru_100418CE8];
  if (v6)
  {
    id v7 = MRLogCategoryDiscoveryUpdates();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      unsigned int v9 = self;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Endpoints changed\n%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

@end