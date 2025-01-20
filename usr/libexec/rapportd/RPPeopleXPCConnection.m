@interface RPPeopleXPCConnection
- (BOOL)_entitledAndReturnError:(id)a3 error:(id *)a4;
- (BOOL)entitledFriendAccount;
- (BOOL)entitledPeople;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDaemon)daemon;
- (RPPeopleDiscovery)activatedDiscovery;
- (RPPeopleXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (void)clientDevice:(id)a3 updatedMeasurement:(id)a4;
- (void)clientDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)clientDeviceFound:(id)a3 report:(BOOL)a4;
- (void)clientDeviceLost:(id)a3;
- (void)clientPeopleStatusChanged:(unsigned int)a3;
- (void)connectionInvalidated;
- (void)setDispatchQueue:(id)a3;
- (void)xpcPeopleAddAppleID:(id)a3 completion:(id)a4;
- (void)xpcPeopleDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcPeopleDiscoveryUpdate:(id)a3;
- (void)xpcPeopleRemoveAppleID:(id)a3 completion:(id)a4;
@end

@implementation RPPeopleXPCConnection

- (RPPeopleXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPPeopleXPCConnection;
  v9 = [(RPPeopleXPCConnection *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142410 <= 20 && (dword_100142410 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  v6 = self->_activatedDiscovery;
  if (v6) {
    [(NSMutableSet *)self->_daemon->_discoveryClients removeObject:v6];
  }
  [(RPPeopleDiscovery *)self->_activatedDiscovery invalidate];
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (BOOL)_entitledAndReturnError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:v6];
  unsigned __int8 v8 = [v7 isEqual:&__kCFBooleanTrue];

  if ((v8 & 1) == 0)
  {
    if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a4)
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (void)clientDeviceFound:(id)a3 report:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  id v6 = self->_activatedDiscovery;
  if (v6)
  {
    unsigned int v7 = [v25 flags];
    if ((self->_discoveryDeviceFlags & v7) != 0)
    {
      char v8 = v7;
      v9 = [v25 identifier];
      if (!v9)
      {
LABEL_35:

        goto LABEL_36;
      }
      v10 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v9];
      if (v10)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_6;
        }
      }
      else
      {
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          objc_super v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v14 = self->_discoveredDevices;
          self->_discoveredDevices = v13;

          discoveredDevices = self->_discoveredDevices;
        }
        [(NSMutableDictionary *)discoveredDevices setObject:v25 forKeyedSubscript:v9];
        if ((v8 & 1) == 0)
        {
LABEL_6:
          v11 = [v25 accountID];
          if (!v11)
          {
            if ((self->_discoveryDeviceFlags & 0x1000) == 0)
            {
              if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              goto LABEL_34;
            }
            v11 = v9;
          }
LABEL_15:
          v15 = [(NSMutableDictionary *)self->_discoveredPeople objectForKeyedSubscript:v11];
          v16 = v15;
          if (v15)
          {
            id v17 = [v15 updateWithRPDevice:v25];
            if (([(RPPeopleDiscovery *)self->_activatedDiscovery changeFlags] & v17) == 0) {
              goto LABEL_33;
            }
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              v23 = CUDescriptionWithLevel();
              LogPrintF();
            }
            if (!v4) {
              goto LABEL_33;
            }
            id v18 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
            [v18 xpcPersonChanged:v16 changes:v17];
          }
          else
          {
            id v18 = objc_alloc_init((Class)RPPerson);
            [v18 setIdentifier:v11];
            [v18 updateWithRPDevice:v25];
            discoveredPeople = self->_discoveredPeople;
            if (!discoveredPeople)
            {
              v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v21 = self->_discoveredPeople;
              self->_discoveredPeople = v20;

              discoveredPeople = self->_discoveredPeople;
            }
            [(NSMutableDictionary *)discoveredPeople setObject:v18 forKeyedSubscript:v11];
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              v24 = CUDescriptionWithLevel();
              LogPrintF();
            }
            if (v4)
            {
              v22 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
              [v22 xpcPersonFound:v18];
            }
          }

LABEL_33:
LABEL_34:

          goto LABEL_35;
        }
      }
      v11 = @"$icloud";
      goto LABEL_15;
    }
  }
LABEL_36:
}

- (void)clientDeviceLost:(id)a3
{
  id v16 = a3;
  BOOL v4 = [v16 identifier];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v4];
    if (!v5)
    {
LABEL_31:

      goto LABEL_32;
    }
    if ([v16 flags])
    {
      id v6 = @"$icloud";
    }
    else
    {
      id v6 = [v16 accountID];
      if (!v6)
      {
        if ((self->_discoveryDeviceFlags & 0x1000) == 0)
        {
          if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_31;
        }
        id v6 = v4;
      }
    }
    unsigned int v7 = [(NSMutableDictionary *)self->_discoveredPeople objectForKeyedSubscript:v6];
    char v8 = v7;
    if (!v7)
    {
      if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_30;
    }
    id v9 = [v7 removeRPDevice:v16];
    v10 = [v8 devices];
    id v11 = [v10 count];

    if (v11)
    {
      if (([(RPPeopleDiscovery *)self->_activatedDiscovery changeFlags] & v9) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        CUDescriptionWithLevel();
        id v14 = v9;
        objc_super v13 = v15 = &unk_10011B024;
        LogPrintF();
      }
      v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v12 xpcPersonChanged:v8 changes:v9];
    }
    else
    {
      [(NSMutableDictionary *)self->_discoveredPeople setObject:0 forKeyedSubscript:v6];
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        CUDescriptionWithLevel();
        id v14 = v9;
        objc_super v13 = v15 = &unk_10011B024;
        LogPrintF();
      }
      v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
      [v12 xpcPersonLost:v8];
    }

    goto LABEL_30;
  }
LABEL_32:
}

- (void)clientDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  __int16 v4 = a4;
  id v17 = a3;
  id v6 = [v17 identifier];
  if (v6)
  {
    unsigned int v7 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v6];
    if (v7)
    {
      unsigned int v8 = [v17 flags];
      if (v8)
      {
        id v9 = @"$icloud";
      }
      else
      {
        id v9 = [v17 accountID];
        if (!v9)
        {
          if ((self->_discoveryDeviceFlags & 0x1000) == 0)
          {
            if (dword_100142410 <= 60 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            goto LABEL_23;
          }
          id v9 = v6;
        }
      }
      v10 = [(NSMutableDictionary *)self->_discoveredPeople objectForKeyedSubscript:v9];
      id v11 = v10;
      if (v10)
      {
        if ((self->_discoveryDeviceFlags & v8) != 0)
        {
          uint64_t v12 = [v10 updateWithRPDevice:v17] | ((v4 & 0x25B) != 0);
          if (([(RPPeopleDiscovery *)self->_activatedDiscovery changeFlags] & v12) != 0)
          {
            if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              CUDescriptionWithLevel();
              uint64_t v15 = v12;
              id v14 = v16 = &unk_10011B024;
              LogPrintF();
            }
            objc_super v13 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
            [v13 xpcPersonChanged:v11 changes:v12];
          }
        }
        else
        {
          [(RPPeopleXPCConnection *)self clientDeviceLost:v17];
        }
      }
      else
      {
        [(RPPeopleXPCConnection *)self clientDeviceFound:v17 report:1];
      }

      goto LABEL_23;
    }
    [(RPPeopleXPCConnection *)self clientDeviceFound:v17 report:1];
LABEL_23:
  }
}

- (void)clientDevice:(id)a3 updatedMeasurement:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unsigned int v7 = [v12 identifier];
  if (v7)
  {
    unsigned int v8 = [(NSMutableDictionary *)self->_discoveredDevices objectForKeyedSubscript:v7];
    if (v8)
    {
      if ([v12 flags])
      {
        id v9 = @"$icloud";
      }
      else
      {
        id v9 = [v12 accountID];
        if (!v9) {
          goto LABEL_10;
        }
      }
      v10 = [(NSMutableDictionary *)self->_discoveredPeople objectForKeyedSubscript:v9];
      if (v10)
      {
        id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
        [v11 xpcPersonID:v9 deviceID:v7 updatedMeasurement:v6];
      }
    }
LABEL_10:
  }
}

- (void)clientPeopleStatusChanged:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v4 xpcPeopleStatusChanged:v3];
}

- (void)xpcPeopleAddAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  if (self->_entitledFriendAccount)
  {
    id v8 = 0;
    goto LABEL_4;
  }
  id v15 = 0;
  BOOL v9 = [(RPPeopleXPCConnection *)self _entitledAndReturnError:@"com.apple.rapport.FriendAccount" error:&v15];
  id v8 = v15;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100142410 <= 40 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v14 = v6;
      LogPrintF();
    }
    -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:](self->_daemon, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:", v6, 0, 0, 1, 0, 0, v14);
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v10 = objc_alloc_init(RPCloudMessageContext);
    id v11 = [(NSMutableDictionary *)self->_daemon->_friendAccountIdentityMap objectForKeyedSubscript:v6];
    id v12 = v11;
    if (v11)
    {
      objc_super v13 = [v11 sendersKnownAlias];
      [(RPCloudMessageContext *)v10 setSendersKnownAlias:v13];
    }
    [(RPPeopleDaemon *)self->_daemon _sendCloudIdentityFrameType:64 destinationID:v6 flags:1 msgCtx:v10];
    if (v7) {
      v7[2](v7, 0);
    }

    goto LABEL_19;
  }
  if (v7) {
    ((void (**)(id, id))v7)[2](v7, v8);
  }
LABEL_19:
}

- (void)xpcPeopleRemoveAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, id))a4;
  if (self->_entitledFriendAccount)
  {
    id v8 = 0;
    goto LABEL_4;
  }
  id v32 = 0;
  BOOL v9 = [(RPPeopleXPCConnection *)self _entitledAndReturnError:@"com.apple.rapport.FriendAccount" error:&v32];
  id v8 = v32;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    if (dword_100142410 <= 40 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      id v23 = v6;
      LogPrintF();
    }
    uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_daemon->_friendAccountIdentityMap, "objectForKeyedSubscript:", v6, v23);
    BOOL v11 = v10 != 0;
    if (v10)
    {
      if (dword_100142410 <= 40 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        v24 = (void *)v10;
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_daemon->_friendAccountIdentityMap, "setObject:forKeyedSubscript:", 0, v6, v24);
      self->_daemon->_needsFriendAccountUpdate = 1;
      id v12 = +[RPIdentityDaemon sharedIdentityDaemon];
      [v12 removeIdentity:v10 error:0];
    }
    id v25 = (void *)v10;
    id v26 = v8;
    v27 = v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v13 = [(NSMutableDictionary *)self->_daemon->_friendDeviceIdentityMap allKeys];
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v19 = [(NSMutableDictionary *)self->_daemon->_friendDeviceIdentityMap objectForKeyedSubscript:v18];
          v20 = [v19 accountID];
          if ([v20 isEqual:v6])
          {
            if (dword_100142410 <= 40 && (dword_100142410 != -1 || _LogCategory_Initialize()))
            {
              v24 = v19;
              LogPrintF();
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_daemon->_friendDeviceIdentityMap, "setObject:forKeyedSubscript:", 0, v18, v24);
            v21 = +[RPIdentityDaemon sharedIdentityDaemon];
            [v21 removeIdentity:v19 error:0];

            BOOL v11 = 1;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    unsigned int v7 = v27;
    if (v27)
    {
      if (v11)
      {
        v27[2](v27, 0);
      }
      else
      {
        v22 = RPErrorF();
        v27[2](v27, v22);
      }
    }

    id v8 = v26;
    goto LABEL_34;
  }
  if (v7) {
    v7[2](v7, v8);
  }
LABEL_34:
}

- (void)xpcPeopleDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_entitledPeople)
  {
    id v9 = 0;
    goto LABEL_4;
  }
  id v25 = 0;
  BOOL v10 = [(RPPeopleXPCConnection *)self _entitledAndReturnError:@"com.apple.rapport.people" error:&v25];
  id v9 = v25;
  self->_entitledPeople = v10;
  if (v10)
  {
LABEL_4:
    if (self->_activatedDiscovery)
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (v8) {
        v8[2](v8, &__NSArray0__struct, 0);
      }
      goto LABEL_31;
    }
    unsigned int v11 = [v7 discoveryMode];
    if (v11 == 200)
    {
      int v12 = 2;
    }
    else
    {
      if (v11 != 400) {
        goto LABEL_15;
      }
      int v12 = 16;
    }
    [v7 setDiscoveryFlags:[v7 discoveryFlags] | v12];
LABEL_15:
    if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      id v23 = v7;
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue, v22, v23];
    unsigned int v13 = [v7 discoveryFlags];
    self->_discoveryDeviceFlags = (v13 >> 1) & 0x10 | v13 & 0xA | (v13 >> 2) & 4 | (v13 >> 1) & 0x20 | (v13 >> 2) & 1 | (v13 >> 1) & 0xC0 | (((v13 >> 10) & 1) << 12);
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    discoveryClients = self->_daemon->_discoveryClients;
    if (!discoveryClients)
    {
      id v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      daemon = self->_daemon;
      id v17 = daemon->_discoveryClients;
      daemon->_discoveryClients = v15;

      discoveryClients = self->_daemon->_discoveryClients;
    }
    [(NSMutableSet *)discoveryClients addObject:v7];
    discoveredDevices = self->_daemon->_discoveredDevices;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10009F2D4;
    v24[3] = &unk_100124848;
    v24[4] = self;
    [(NSMutableDictionary *)discoveredDevices enumerateKeysAndObjectsUsingBlock:v24];
    if (v8)
    {
      uint64_t v19 = [(NSMutableDictionary *)self->_discoveredPeople allValues];
      v20 = (void *)v19;
      if (v19) {
        v21 = (void *)v19;
      }
      else {
        v21 = &__NSArray0__struct;
      }
      v8[2](v8, v21, 0);
    }
    [(RPPeopleDaemon *)self->_daemon _update];
    goto LABEL_31;
  }
  if (v8) {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v9);
  }
LABEL_31:
}

- (void)xpcPeopleDiscoveryUpdate:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activatedDiscovery)
  {
    unsigned int v4 = [v13 discoveryMode];
    if (v4 == 200)
    {
      int v5 = 2;
    }
    else
    {
      if (v4 != 400) {
        goto LABEL_10;
      }
      int v5 = 16;
    }
    [v13 setDiscoveryFlags:[v13 discoveryFlags] | v5];
LABEL_10:
    id v6 = [(RPPeopleDiscovery *)self->_activatedDiscovery discoveryFlags];
    id v7 = [v13 discoveryFlags];
    if (v7 != v6)
    {
      if (dword_100142410 <= 30 && (dword_100142410 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[RPPeopleDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", v7, v6, &unk_10011B04E, v7, &unk_10011B04E);
      }
      else
      {
        -[RPPeopleDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", v7, v9, v10, v11, v12);
      }
    }
    unsigned int v8 = (v7 >> 1) & 0x10 | v7 & 0xA | (v7 >> 2) & 4 | (v7 >> 1) & 0x20 | (v7 >> 2) & 1 | (v7 >> 1) & 0xC0 | (((v7 >> 10) & 1) << 12);
    if (v8 == self->_discoveryDeviceFlags)
    {
      if (v7 == v6) {
        goto LABEL_23;
      }
    }
    else
    {
      self->_discoveryDeviceFlags = v8;
    }
    [(RPPeopleDaemon *)self->_daemon _update];
    goto LABEL_23;
  }
  if (dword_100142410 <= 90 && (dword_100142410 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_23:
}

- (RPPeopleDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPeopleDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitledFriendAccount
{
  return self->_entitledFriendAccount;
}

- (BOOL)entitledPeople
{
  return self->_entitledPeople;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);

  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end