@interface MediaService
- (CBMutableCharacteristic)entityAttributeCharacteristic;
- (CBMutableCharacteristic)entityUpdateCharacteristic;
- (CBMutableCharacteristic)remoteCommandCharacteristic;
- (MediaInfo)info;
- (MediaService)init;
- (NSMutableDictionary)sessions;
- (id)attributeIDToString:(unsigned __int8)a3 entityID:(unsigned __int8)a4;
- (id)currentAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4;
- (id)entityUpdateFlagsToString:(unsigned __int8)a3;
- (id)invocationForNotifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5;
- (id)remoteCommandIDToString:(unsigned __int8)a3;
- (id)sessionForCentral:(id)a3;
- (int64_t)handleEntityAttributeRead:(id)a3;
- (int64_t)handleEntityAttributeWrite:(id)a3;
- (int64_t)handleEntityUpdateWrite:(id)a3 action:(id *)a4;
- (int64_t)handleRemoteCommandWrite:(id)a3;
- (unint64_t)subscriptionCount;
- (void)attributeIDsDidChange:(id)a3 entityID:(unsigned __int8)a4;
- (void)dealloc;
- (void)mediaInfoDidChange;
- (void)mediaPlayerDidChange;
- (void)mediaStateDidChange;
- (void)mediaVolumeDidChange;
- (void)notifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5;
- (void)notifyAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5 central:(id)a6;
- (void)notifySupportedCommands:(id)a3 central:(id)a4;
- (void)notifySupportedCommandsValue:(id)a3 central:(id)a4;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)setEntityAttributeCharacteristic:(id)a3;
- (void)setEntityUpdateCharacteristic:(id)a3;
- (void)setInfo:(id)a3;
- (void)setRemoteCommandCharacteristic:(id)a3;
- (void)setSessions:(id)a3;
- (void)startNotifications;
- (void)stopNotifications;
- (void)supportedCommandsDidChange;
- (void)supportedCommandsDidChange:(id)a3;
@end

@implementation MediaService

- (MediaService)init
{
  v21.receiver = self;
  v21.super_class = (Class)MediaService;
  v2 = [(MediaService *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = +[CBUUID UUIDWithString:CBUUIDAMSRemoteCommandCharacteristicString];
    v5 = (CBMutableCharacteristic *)[v3 initWithType:v4 properties:1048 value:0 permissions:34];
    remoteCommandCharacteristic = v2->_remoteCommandCharacteristic;
    v2->_remoteCommandCharacteristic = v5;

    id v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = +[CBUUID UUIDWithString:CBUUIDAMSEntityUpdateCharacteristicString];
    v9 = (CBMutableCharacteristic *)[v7 initWithType:v8 properties:1048 value:0 permissions:34];
    entityUpdateCharacteristic = v2->_entityUpdateCharacteristic;
    v2->_entityUpdateCharacteristic = v9;

    id v11 = objc_alloc((Class)CBMutableCharacteristic);
    v12 = +[CBUUID UUIDWithString:CBUUIDAMSEntityAttributeCharacteristicString];
    v13 = (CBMutableCharacteristic *)[v11 initWithType:v12 properties:10 value:0 permissions:51];
    entityAttributeCharacteristic = v2->_entityAttributeCharacteristic;
    v2->_entityAttributeCharacteristic = v13;

    id v15 = objc_alloc((Class)CBMutableService);
    v16 = +[CBUUID UUIDWithString:CBUUIDAppleMediaServiceString];
    id v17 = [v15 initWithType:v16 primary:1];
    [(ServerService *)v2 setService:v17];

    v22[0] = v2->_remoteCommandCharacteristic;
    v22[1] = v2->_entityUpdateCharacteristic;
    v22[2] = v2->_entityAttributeCharacteristic;
    v18 = +[NSArray arrayWithObjects:v22 count:3];
    v19 = [(ServerService *)v2 service];
    [v19 setCharacteristics:v18];
  }
  return v2;
}

- (void)dealloc
{
  [(MediaService *)self stopNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MediaService;
  [(MediaService *)&v3 dealloc];
}

- (int64_t)handleRemoteCommandWrite:(id)a3
{
  v4 = [a3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  unsigned __int8 v13 = 0;
  if ([v5 readUint8:&v13])
  {
    v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v13;
      v8 = v6;
      v9 = [(MediaService *)self remoteCommandIDToString:v7];
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received \"%@\" remote command", buf, 0xCu);
    }
    v10 = [(MediaService *)self info];
    [v10 sendCommand:v13];

    int64_t v11 = 0;
  }
  else
  {
    int64_t v11 = 161;
  }

  return v11;
}

- (int64_t)handleEntityUpdateWrite:(id)a3 action:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 central];
  v8 = [(MediaService *)self sessionForCentral:v7];

  if (v8)
  {
    v9 = [v6 value];
    v10 = +[DataInputStream inputStreamWithData:v9];

    unsigned __int8 v18 = 0;
    if ([v10 readUint8:&v18])
    {
      int64_t v11 = +[NSMutableSet set];
      unsigned __int8 v17 = 0;
      if ([v10 readUint8:&v17])
      {
        do
        {
          v12 = +[NSNumber numberWithUnsignedChar:v17];
          [v11 addObject:v12];
        }
        while (([v10 readUint8:&v17] & 1) != 0);
      }
      [v8 setRegisteredAttributeIDs:v11 entityID:v18];
      uint64_t v13 = v18;
      v14 = [v6 central];
      *a4 = [(MediaService *)self invocationForNotifyAttributeIDs:v11 entityID:v13 central:v14];

      int64_t v15 = 0;
    }
    else
    {
      int64_t v15 = 161;
    }
  }
  else
  {
    int64_t v15 = 160;
  }

  return v15;
}

- (int64_t)handleEntityAttributeRead:(id)a3
{
  id v4 = a3;
  v5 = [v4 central];
  id v6 = [(MediaService *)self sessionForCentral:v5];

  if (v6)
  {
    id v7 = [v6 loadedEntityID];
    id v8 = [v6 loadedAttributeID];
    v9 = [(MediaService *)self currentAttributeValueForAttributeID:v8 entityID:v7];
    [v6 setLastKnownAttributeValue:v9 attributeID:v8 entityID:v7];
    if (v9)
    {
      v10 = [v9 dataUsingEncoding:4];
      [v4 setValue:v10];

      int64_t v11 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        uint64_t v13 = [(MediaService *)self attributeIDToString:v8 entityID:v7];
        int v16 = 138412546;
        unsigned __int8 v17 = v13;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending value for attribute %@: \"%@\"", (uint8_t *)&v16, 0x16u);
      }
      int64_t v14 = 0;
    }
    else
    {
      int64_t v14 = 162;
    }
  }
  else
  {
    int64_t v14 = 160;
  }

  return v14;
}

- (int64_t)handleEntityAttributeWrite:(id)a3
{
  id v4 = a3;
  v5 = [v4 central];
  id v6 = [(MediaService *)self sessionForCentral:v5];

  if (v6)
  {
    id v7 = [v4 value];
    id v8 = +[DataInputStream inputStreamWithData:v7];

    __int16 v16 = 0;
    if ([v8 readUint8:(char *)&v16 + 1]
      && [v8 readUint8:&v16])
    {
      if ([v6 isRegisteredForAttributeID:v16 entityID:HIBYTE(v16)])
      {
        [v6 setLoadedEntityID:HIBYTE(v16)];
        [v6 setLoadedAttributeID:v16];
        v9 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v16;
          uint64_t v11 = HIBYTE(v16);
          v12 = v9;
          uint64_t v13 = [(MediaService *)self attributeIDToString:v10 entityID:v11];
          *(_DWORD *)buf = 138412290;
          __int16 v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading value for attribute %@", buf, 0xCu);
        }
        int64_t v14 = 0;
      }
      else
      {
        int64_t v14 = 160;
      }
    }
    else
    {
      int64_t v14 = 161;
    }
  }
  else
  {
    int64_t v14 = 160;
  }

  return v14;
}

- (void)notifySupportedCommandsValue:(id)a3 central:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[DataOutputStream outputStream];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 writeUint8:[v20 unsignedCharValue]];
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v11);
  }

  int64_t v14 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = v14;
    __int16 v16 = [v8 data];
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notifying value for supported commands: %@", buf, 0xCu);
  }
  unsigned __int8 v17 = [v8 data:v20];
  __int16 v18 = [(MediaService *)self remoteCommandCharacteristic];
  id v24 = v7;
  v19 = +[NSArray arrayWithObjects:&v24 count:1];
  [(ServerService *)self updateValue:v17 forCharacteristic:v18 onSubscribedCentrals:v19];
}

- (void)notifyAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5 central:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = +[DataOutputStream outputStream];
  buf[0] = 0;
  uint64_t v13 = [v10 UTF8DataWithMaxLength:((char *)[v11 maximumUpdateValueLength]) - 3 ellipsis:0 isTruncated:buf];
  uint64_t v14 = buf[0];
  [v12 writeUint8:v7];
  [v12 writeUint8:v8];
  [v12 writeUint8:v14];
  id v15 = v13;
  [v12 writeBytes:[v15 bytes] length:[v15 length]];
  __int16 v16 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v17 = v16;
    __int16 v18 = [(MediaService *)self attributeIDToString:v8 entityID:v7];
    v19 = [(MediaService *)self entityUpdateFlagsToString:v14];
    *(_DWORD *)buf = 138412802;
    v25 = v18;
    __int16 v26 = 2112;
    v27 = v19;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notifying value for attribute %@ (%@): \"%@\"", buf, 0x20u);
  }
  long long v20 = [v12 data];
  long long v21 = [(MediaService *)self entityUpdateCharacteristic];
  id v23 = v11;
  long long v22 = +[NSArray arrayWithObjects:&v23 count:1];
  [(ServerService *)self updateValue:v20 forCharacteristic:v21 onSubscribedCentrals:v22];
}

- (void)notifySupportedCommands:(id)a3 central:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(MediaService *)self sessions];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [v8 lastKnownSupportedCommands];
  unsigned __int8 v10 = [v9 isEqualToSet:v11];

  if ((v10 & 1) == 0)
  {
    [v8 setLastKnownSupportedCommands:v11];
    [(MediaService *)self notifySupportedCommandsValue:v11 central:v6];
  }
}

- (void)notifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = [(MediaService *)self sessions];
  id v24 = v9;
  id v11 = [v10 objectForKeyedSubscript:v9];

  id v23 = v8;
  uint64_t v12 = [v11 notifiableAttributeIDs:v8 entityID:v6];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) unsignedCharValue];
        uint64_t v18 = [(MediaService *)self currentAttributeValueForAttributeID:v17 entityID:v6];
        uint64_t v19 = [v11 lastKnownAttributeValueForAttributeID:v17 entityID:v6];
        long long v20 = (void *)v19;
        if (v18) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
          if (v18 | v19) {
            goto LABEL_14;
          }
        }
        else
        {
          unsigned __int8 v22 = [(id)v18 isEqualToString:v19];
          if ((v22 & 1) == 0)
          {
LABEL_14:
            [v11 setLastKnownAttributeValue:v18 attributeID:v17 entityID:v6];
            [(MediaService *)self notifyAttributeValue:v18 attributeID:v17 entityID:v6 central:v24];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)supportedCommandsDidChange:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(MediaService *)self remoteCommandCharacteristic];
  uint64_t v6 = [v5 subscribedCentrals];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      unsigned __int8 v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MediaService *)self notifySupportedCommands:v4 central:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)attributeIDsDidChange:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(MediaService *)self entityUpdateCharacteristic];
  id v8 = [v7 subscribedCentrals];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(MediaService *)self notifyAttributeIDs:v6 entityID:v4 central:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12)];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)startNotifications
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  [(MediaService *)self setSessions:v3];

  uint64_t v4 = objc_alloc_init(MediaInfo);
  [(MediaService *)self setInfo:v4];

  id v5 = [(MediaService *)self info];
  [v5 setDelegate:self];
}

- (void)stopNotifications
{
  objc_super v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    v6[0] = 67109120;
    v6[1] = [(ServerService *)self restrictedMode];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);
  }
  id v5 = [(MediaService *)self info];
  [v5 setDelegate:0];

  [(MediaService *)self setInfo:0];
  [(MediaService *)self setSessions:0];
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 characteristic];
  id v8 = [(MediaService *)self entityAttributeCharacteristic];

  if (v7 == v8) {
    int64_t v9 = [(MediaService *)self handleEntityAttributeRead:v6];
  }
  else {
    int64_t v9 = 10;
  }
  [v10 respondToRequest:v6 withResult:v9];
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v5 = [a4 firstObject:a3];
  id v6 = [v5 characteristic];
  id v7 = [(MediaService *)self remoteCommandCharacteristic];

  if (v6 == v7)
  {
    int64_t v14 = [(MediaService *)self handleRemoteCommandWrite:v5];
LABEL_8:
    int64_t v13 = v14;
    id v12 = 0;
    goto LABEL_9;
  }
  id v8 = [v5 characteristic];
  int64_t v9 = [(MediaService *)self entityUpdateCharacteristic];

  if (v8 == v9)
  {
    id v15 = 0;
    int64_t v13 = [(MediaService *)self handleEntityUpdateWrite:v5 action:&v15];
    id v12 = v15;
    goto LABEL_9;
  }
  id v10 = [v5 characteristic];
  uint64_t v11 = [(MediaService *)self entityAttributeCharacteristic];

  if (v10 == v11)
  {
    int64_t v14 = [(MediaService *)self handleEntityAttributeWrite:v5];
    goto LABEL_8;
  }
  id v12 = 0;
  int64_t v13 = 10;
LABEL_9:
  [(ServerService *)self respondToRequest:v5 withResult:v13];
  [v12 invokeWithTarget:self];
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  uint64_t v8 = [(MediaService *)self remoteCommandCharacteristic];
  if ((id)v8 == v7)
  {
  }
  else
  {
    int64_t v9 = (void *)v8;
    id v10 = [(MediaService *)self entityUpdateCharacteristic];

    if (v10 != v7) {
      goto LABEL_13;
    }
  }
  if ((id)[(MediaService *)self subscriptionCount] == (id)1) {
    [(MediaService *)self startNotifications];
  }
  uint64_t v11 = [(MediaService *)self sessions];
  id v12 = [v11 objectForKeyedSubscript:v19];

  if (!v12)
  {
    int64_t v13 = objc_alloc_init(MediaSession);
    int64_t v14 = [(MediaService *)self sessions];
    [v14 setObject:v13 forKeyedSubscript:v19];

    id v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v19];
  }
  id v16 = [(MediaService *)self remoteCommandCharacteristic];

  if (v16 == v7)
  {
    id v17 = [(MediaService *)self info];
    uint64_t v18 = [v17 supportedCommands];

    if (v18) {
      [(MediaService *)self notifySupportedCommands:v18 central:v19];
    }
  }
LABEL_13:
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  uint64_t v8 = [(MediaService *)self remoteCommandCharacteristic];
  if ((id)v8 == v7)
  {
  }
  else
  {
    int64_t v9 = (void *)v8;
    id v10 = [(MediaService *)self entityUpdateCharacteristic];

    if (v10 != v7) {
      goto LABEL_12;
    }
  }
  uint64_t v11 = [(MediaService *)self remoteCommandCharacteristic];
  id v12 = [v11 subscribedCentrals];
  if ([v12 containsObject:v16])
  {
  }
  else
  {
    int64_t v13 = [(MediaService *)self entityUpdateCharacteristic];
    int64_t v14 = [v13 subscribedCentrals];
    unsigned __int8 v15 = [v14 containsObject:v16];

    if (v15) {
      goto LABEL_10;
    }
    uint64_t v11 = [(MediaService *)self sessions];
    [v11 removeObjectForKey:v16];
  }

LABEL_10:
  if (![(MediaService *)self subscriptionCount]) {
    [(MediaService *)self stopNotifications];
  }
LABEL_12:
}

- (void)supportedCommandsDidChange
{
  objc_super v3 = [(MediaService *)self remoteCommandCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = [v4 count];

  if (v5)
  {
    id v7 = [(MediaService *)self info];
    id v6 = [v7 supportedCommands];
    [(MediaService *)self supportedCommandsDidChange:v6];
  }
}

- (void)mediaPlayerDidChange
{
  objc_super v3 = [(MediaService *)self entityUpdateCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = [v4 count];

  if (v5)
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B7680, &off_1000B7698, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(MediaService *)self attributeIDsDidChange:v6 entityID:0];
  }
}

- (void)mediaStateDidChange
{
  objc_super v3 = [(MediaService *)self entityUpdateCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = [v4 count];

  if (v5)
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B76B0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(MediaService *)self attributeIDsDidChange:v6 entityID:0];
  }
}

- (void)mediaInfoDidChange
{
  objc_super v3 = [(MediaService *)self entityUpdateCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = [v4 count];

  if (v5)
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B76B0, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(MediaService *)self attributeIDsDidChange:v8 entityID:0];
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B7680, &off_1000B76B0, &off_1000B76C8, &off_1000B7698, 0);
    [(MediaService *)self attributeIDsDidChange:v6 entityID:1];
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B76B0, &off_1000B7680, &off_1000B76C8, &off_1000B7698, 0);
    [(MediaService *)self attributeIDsDidChange:v7 entityID:2];
  }
}

- (void)mediaVolumeDidChange
{
  objc_super v3 = [(MediaService *)self entityUpdateCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = [v4 count];

  if (v5)
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B76C8, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(MediaService *)self attributeIDsDidChange:v6 entityID:0];
  }
}

- (unint64_t)subscriptionCount
{
  objc_super v3 = [(MediaService *)self remoteCommandCharacteristic];
  uint64_t v4 = [v3 subscribedCentrals];
  id v5 = (char *)[v4 count];
  id v6 = [(MediaService *)self entityUpdateCharacteristic];
  id v7 = [v6 subscribedCentrals];
  id v8 = &v5[(void)[v7 count]];

  return (unint64_t)v8;
}

- (id)sessionForCentral:(id)a3
{
  id v4 = a3;
  id v5 = [(MediaService *)self sessions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)currentAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  switch(a4)
  {
    case 2u:
      switch(a3)
      {
        case 0u:
          id v5 = [(MediaService *)self info];
          uint64_t v6 = [v5 trackArtist];
          goto LABEL_32;
        case 1u:
          id v5 = [(MediaService *)self info];
          uint64_t v6 = [v5 trackAlbum];
          goto LABEL_32;
        case 2u:
          id v5 = [(MediaService *)self info];
          uint64_t v6 = [v5 trackTitle];
          goto LABEL_32;
        case 3u:
          int64_t v14 = [(MediaService *)self info];
          id v5 = [v14 trackDuration];

          if (v5
            && (+[NSDecimalNumber notANumber],
                unsigned __int8 v15 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v16 = [v5 isEqualToNumber:v15],
                v15,
                (v16 & 1) == 0))
          {
            [v5 doubleValue];
            uint64_t v6 = +[NSString stringWithFormat:@"%0.3f", v21];
LABEL_32:
            id v8 = (void *)v6;
          }
          else
          {
            id v8 = 0;
          }
          break;
        default:
          goto LABEL_10;
      }
      goto LABEL_33;
    case 1u:
      switch(a3)
      {
        case 0u:
          id v5 = [(MediaService *)self info];
          id v7 = [v5 queueIndex];
          break;
        case 1u:
          id v5 = [(MediaService *)self info];
          id v7 = [v5 queueCount];
          break;
        case 2u:
          id v5 = [(MediaService *)self info];
          id v7 = [v5 queueShuffleMode];
          break;
        case 3u:
          id v5 = [(MediaService *)self info];
          id v7 = [v5 queueRepeatMode];
          break;
        default:
          goto LABEL_10;
      }
LABEL_19:
      id v12 = v7;
      id v8 = [v7 stringValue];
LABEL_20:

LABEL_33:
      goto LABEL_34;
    case 0u:
      switch(a3)
      {
        case 0u:
          id v5 = [(MediaService *)self info];
          uint64_t v6 = [v5 playerName];
          goto LABEL_32;
        case 1u:
          int64_t v9 = [(MediaService *)self info];
          id v5 = [v9 playerElapsedTime];

          if (v5
            && (+[NSDecimalNumber notANumber],
                id v10 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v11 = [v5 isEqualToNumber:v10],
                v10,
                (v11 & 1) == 0))
          {
            [v5 doubleValue];
            if (v17 >= 0.0) {
              double v18 = v17;
            }
            else {
              double v18 = 0.0;
            }
            id v12 = [(MediaService *)self info];
            int64_t v13 = [v12 playerPlaybackState];
            id v19 = [(MediaService *)self info];
            [v19 playerPlaybackRate];
            id v8 = +[NSString stringWithFormat:@"%@,%.1f,%.3f", v13, v20, *(void *)&v18];
          }
          else
          {
            id v12 = [(MediaService *)self info];
            int64_t v13 = [v12 playerPlaybackState];
            id v8 = +[NSString stringWithFormat:@"%@,,", v13];
          }

          goto LABEL_20;
        case 2u:
          id v5 = [(MediaService *)self info];
          id v7 = [v5 playerVolume];
          goto LABEL_19;
        case 3u:
          id v5 = [(MediaService *)self info];
          uint64_t v6 = [v5 playerBundleID];
          goto LABEL_32;
        default:
          goto LABEL_10;
      }
  }
LABEL_10:
  id v8 = 0;
LABEL_34:

  return v8;
}

- (id)invocationForNotifyAttributeIDs:(id)a3 entityID:(unsigned __int8)a4 central:(id)a5
{
  id v13 = a3;
  unsigned __int8 v12 = a4;
  id v11 = a5;
  id v8 = [(MediaService *)self methodSignatureForSelector:"notifyAttributeIDs:entityID:central:"];
  int64_t v9 = +[NSInvocation invocationWithMethodSignature:v8];
  [v9 retainArguments];
  [v9 setSelector:"notifyAttributeIDs:entityID:central:"];
  [v9 setArgument:&v13 atIndex:2];
  [v9 setArgument:&v12 atIndex:3];
  [v9 setArgument:&v11 atIndex:4];

  return v9;
}

- (id)remoteCommandIDToString:(unsigned __int8)a3
{
  if (a3 > 0xDu) {
    return @"Unknown";
  }
  else {
    return off_1000B1C48[(char)a3];
  }
}

- (id)attributeIDToString:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  if (a4 == 2)
  {
    CFStringRef v4 = @"Track";
    if (a3 <= 3u)
    {
      id v5 = off_1000B1CF8;
      goto LABEL_10;
    }
LABEL_11:
    CFStringRef v6 = @"Unknown";
    return +[NSString stringWithFormat:@"%@/%@", v4, v6];
  }
  if (a4 == 1)
  {
    CFStringRef v4 = @"Queue";
    if (a3 < 4u)
    {
      id v5 = off_1000B1CD8;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (a4)
  {
    CFStringRef v4 = @"Unknown";
    CFStringRef v6 = @"Unknown";
    return +[NSString stringWithFormat:@"%@/%@", v4, v6];
  }
  CFStringRef v4 = @"Player";
  if (a3 >= 4u) {
    goto LABEL_11;
  }
  id v5 = off_1000B1CB8;
LABEL_10:
  CFStringRef v6 = v5[(char)a3];
  return +[NSString stringWithFormat:@"%@/%@", v4, v6];
}

- (id)entityUpdateFlagsToString:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  CFStringRef v4 = +[NSMutableString string];
  for (int i = 0; i != 8; ++i)
  {
    if ((v3 >> i))
    {
      if (i) {
        CFStringRef v6 = 0;
      }
      else {
        CFStringRef v6 = @"T";
      }
      if ([v4 length]) {
        [v4 appendString:@"|"];
      }
      [v4 appendString:v6];
    }
  }

  return v4;
}

- (CBMutableCharacteristic)remoteCommandCharacteristic
{
  return self->_remoteCommandCharacteristic;
}

- (void)setRemoteCommandCharacteristic:(id)a3
{
}

- (CBMutableCharacteristic)entityUpdateCharacteristic
{
  return self->_entityUpdateCharacteristic;
}

- (void)setEntityUpdateCharacteristic:(id)a3
{
}

- (CBMutableCharacteristic)entityAttributeCharacteristic
{
  return self->_entityAttributeCharacteristic;
}

- (void)setEntityAttributeCharacteristic:(id)a3
{
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (MediaInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_entityAttributeCharacteristic, 0);
  objc_storeStrong((id *)&self->_entityUpdateCharacteristic, 0);

  objc_storeStrong((id *)&self->_remoteCommandCharacteristic, 0);
}

@end