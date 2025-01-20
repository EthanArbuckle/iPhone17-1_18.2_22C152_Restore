@interface ANCService
- (ANCAlertSource)alertSource;
- (ANCService)init;
- (CBMutableCharacteristic)controlPointCharacteristic;
- (CBMutableCharacteristic)dataSourceCharacteristic;
- (CBMutableCharacteristic)notificationSourceCharacteristic;
- (NSMutableDictionary)alertMap;
- (NSMutableDictionary)uidMap;
- (NSMutableSet)activeCentrals;
- (OS_dispatch_queue)queue;
- (id)appAttributeIDToString:(unsigned __int8)a3;
- (id)categoryIDToString:(unsigned __int8)a3;
- (id)eventFlagsToString:(unsigned __int8)a3;
- (id)eventIDToString:(unsigned __int8)a3;
- (id)notificationAttributeIDToString:(unsigned __int8)a3;
- (id)notificationForAlert:(id)a3;
- (id)notificationForUID:(unsigned int)a3;
- (id)responseForAppAttributeID:(unsigned __int8)a3 appIdentifier:(id)a4;
- (id)responseForAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 attribute:(id)a5;
- (id)responseForNotificationAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 notification:(id)a5;
- (int64_t)handleControlPointWrite:(id)a3 responseData:(id *)a4;
- (int64_t)handleGetAppAttributesCommand:(id)a3 responseData:(id *)a4;
- (int64_t)handleGetNotificationAttributesCommand:(id)a3 responseData:(id *)a4;
- (int64_t)handlePerformNotificationActionCommand:(id)a3;
- (unsigned)uidGenerator;
- (void)alertAdded:(id)a3 isPreExisting:(BOOL)a4;
- (void)alertModified:(id)a3;
- (void)alertRemoved:(id)a3;
- (void)dealloc;
- (void)handleWriteRequests:(id)a3;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)setActiveCentrals:(id)a3;
- (void)setAlertMap:(id)a3;
- (void)setAlertSource:(id)a3;
- (void)setControlPointCharacteristic:(id)a3;
- (void)setDataSourceCharacteristic:(id)a3;
- (void)setNotificationSourceCharacteristic:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUidGenerator:(unsigned int)a3;
- (void)setUidMap:(id)a3;
- (void)startNotifications;
- (void)stopNotifications;
- (void)updateDataSource:(id)a3 central:(id)a4;
- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5;
- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5 centrals:(id)a6;
@end

@implementation ANCService

- (ANCService)init
{
  v25.receiver = self;
  v25.super_class = (Class)ANCService;
  v2 = [(ANCService *)&v25 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = +[CBUUID UUIDWithString:CBUUIDANCSControlPointCharacteristicString];
    v5 = (CBMutableCharacteristic *)[v3 initWithType:v4 properties:8 value:0 permissions:34];
    controlPointCharacteristic = v2->_controlPointCharacteristic;
    v2->_controlPointCharacteristic = v5;

    id v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = +[CBUUID UUIDWithString:CBUUIDANCSNotificationSourceCharacteristicString];
    v9 = (CBMutableCharacteristic *)[v7 initWithType:v8 properties:1040 value:0 permissions:0];
    notificationSourceCharacteristic = v2->_notificationSourceCharacteristic;
    v2->_notificationSourceCharacteristic = v9;

    id v11 = objc_alloc((Class)CBMutableCharacteristic);
    v12 = +[CBUUID UUIDWithString:CBUUIDANCSDataSourceCharacteristicString];
    v13 = (CBMutableCharacteristic *)[v11 initWithType:v12 properties:1040 value:0 permissions:0];
    dataSourceCharacteristic = v2->_dataSourceCharacteristic;
    v2->_dataSourceCharacteristic = v13;

    id v15 = objc_alloc((Class)CBMutableService);
    v16 = +[CBUUID UUIDWithString:CBUUIDAppleNotificationCenterServiceString];
    id v17 = [v15 initWithType:v16 primary:1];
    [(ServerService *)v2 setService:v17];

    v26[0] = v2->_controlPointCharacteristic;
    v26[1] = v2->_notificationSourceCharacteristic;
    v26[2] = v2->_dataSourceCharacteristic;
    v18 = +[NSArray arrayWithObjects:v26 count:3];
    v19 = [(ServerService *)v2 service];
    [v19 setCharacteristics:v18];

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v21 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], v20);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v22;
  }
  return v2;
}

- (void)dealloc
{
  [(ANCService *)self stopNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ANCService;
  [(ANCService *)&v3 dealloc];
}

- (void)handleWriteRequests:(id)a3
{
  id v4 = a3;
  v5 = +[CBATTRequest consolidatedDataForRequests:v4];
  v6 = [v4 firstObject];
  id v7 = [v6 characteristic];
  v8 = [(ANCService *)self controlPointCharacteristic];

  if (v7 == v8)
  {
    id v17 = 0;
    int64_t v10 = [(ANCService *)self handleControlPointWrite:v5 responseData:&v17];
    id v9 = v17;
  }
  else
  {
    id v9 = 0;
    int64_t v10 = 10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002523C;
  block[3] = &unk_1000B1728;
  block[4] = self;
  id v14 = v4;
  id v15 = v9;
  int64_t v16 = v10;
  id v11 = v9;
  id v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int64_t)handleControlPointWrite:(id)a3 responseData:(id *)a4
{
  id v6 = a3;
  id v7 = +[DataInputStream inputStreamWithData:v6 byteOrder:1];
  char v12 = 0;
  if (![v7 readUint8:&v12]) {
    goto LABEL_9;
  }
  if (v12 == 2)
  {
    int64_t v8 = [(ANCService *)self handlePerformNotificationActionCommand:v7];
  }
  else if (v12 == 1)
  {
    int64_t v8 = [(ANCService *)self handleGetAppAttributesCommand:v7 responseData:a4];
  }
  else
  {
    if (v12)
    {
      int64_t v9 = 160;
      goto LABEL_12;
    }
    int64_t v8 = [(ANCService *)self handleGetNotificationAttributesCommand:v7 responseData:a4];
  }
  int64_t v9 = v8;
  if (v8 == 161)
  {
LABEL_9:
    int64_t v10 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F7B0((uint64_t)v6, v10);
    }
    int64_t v9 = 161;
  }
LABEL_12:

  return v9;
}

- (int64_t)handleGetNotificationAttributesCommand:(id)a3 responseData:(id *)a4
{
  id v6 = a3;
  unsigned int v16 = 0;
  if (![v6 readUint32:&v16])
  {
    int64_t v13 = 161;
    goto LABEL_19;
  }
  id v7 = [(ANCService *)self notificationForUID:v16];
  int64_t v8 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received \"Get Notification Attributes\" command for notification #%u", buf, 8u);
  }
  if (!v7)
  {
    int64_t v13 = 162;
    goto LABEL_18;
  }
  int64_t v9 = +[DataOutputStream outputStreamWithByteOrder:1];
  [v9 writeUint8:0];
  [v9 writeUint32:[v7 UID]];
  unsigned __int8 v15 = 0;
  if (![v6 readUint8:&v15])
  {
LABEL_14:
    *a4 = [v9 data];
    [v7 setIsDirty:0];
    int64_t v13 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = v15;
    if (v15 - 1 <= 2) {
      break;
    }
    __int16 v11 = 512;
LABEL_13:
    *(_WORD *)buf = v11;
    char v12 = -[ANCService responseForNotificationAttributeID:maxLength:notification:](self, "responseForNotificationAttributeID:maxLength:notification:", v10);
    [v9 writeData:v12];

    if (([v6 readUint8:&v15] & 1) == 0) {
      goto LABEL_14;
    }
  }
  if ([v6 readUint16:buf])
  {
    if (*(unsigned __int16 *)buf >= 0x200u) {
      __int16 v11 = 512;
    }
    else {
      __int16 v11 = *(_WORD *)buf;
    }
    uint64_t v10 = v15;
    goto LABEL_13;
  }
  int64_t v13 = 161;
LABEL_15:

LABEL_18:
LABEL_19:

  return v13;
}

- (int64_t)handleGetAppAttributesCommand:(id)a3 responseData:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSMutableString string];
  if ([v6 readString:v7])
  {
    int64_t v8 = +[DataOutputStream outputStreamWithByteOrder:1];
    int64_t v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received \"Get App Attributes\" command for identifier %@", (uint8_t *)&v13, 0xCu);
    }
    [v8 writeUint8:1];
    [v8 writeString:v7];
    LOBYTE(v13) = 0;
    if ([v6 readUint8:&v13])
    {
      do
      {
        uint64_t v10 = [(ANCService *)self responseForAppAttributeID:v13 appIdentifier:v7];
        [v8 writeData:v10];
      }
      while (([v6 readUint8:&v13] & 1) != 0);
    }
    *a4 = [v8 data];

    int64_t v11 = 0;
  }
  else
  {
    int64_t v11 = 161;
  }

  return v11;
}

- (int64_t)handlePerformNotificationActionCommand:(id)a3
{
  id v4 = a3;
  unsigned int v14 = 0;
  char v13 = 0;
  if ([v4 readUint32:&v14] && objc_msgSend(v4, "readUint8:", &v13))
  {
    v5 = [(ANCService *)self notificationForUID:v14];
    id v6 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received \"Perform Notification Action\" command for notification #%u", buf, 8u);
    }
    if (!v5)
    {
      int64_t v9 = 162;
      goto LABEL_14;
    }
    if (v13)
    {
      if (v13 == 1)
      {
        id v7 = [v5 alert];
        unsigned __int8 v8 = [v7 performNegativeAction];

        if (v8) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v10 = [v5 alert];
      unsigned int v11 = [v10 performPositiveAction];

      if (v11)
      {
LABEL_9:
        int64_t v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    int64_t v9 = 163;
    goto LABEL_14;
  }
  int64_t v9 = 161;
LABEL_15:

  return v9;
}

- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  id v12 = a4;
  unsigned __int8 v8 = [(ANCService *)self activeCentrals];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(ANCService *)self activeCentrals];
    unsigned int v11 = [v10 allObjects];
    [(ANCService *)self updateNotificationSource:v6 notification:v12 sourceFlags:v5 centrals:v11];
  }
}

- (void)updateNotificationSource:(unsigned __int8)a3 notification:(id)a4 sourceFlags:(unsigned __int8)a5 centrals:(id)a6
{
  int v7 = a5;
  unsigned int v32 = a3;
  id v9 = a4;
  id v34 = a6;
  uint64_t v10 = +[DataOutputStream outputStreamWithByteOrder:1];
  unsigned int v11 = [v9 alert];
  id v12 = [v11 categoryID];
  char v13 = [(ANCService *)self alertSource];
  unsigned int v14 = [v13 alertsForCategoryID:v12];

  unsigned int v15 = [v11 isSilent] | v7;
  if ([v11 isImportant]) {
    unsigned int v15 = v7 & 0xFC | 2;
  }
  if ([v11 hasPositiveAction]) {
    int v16 = 8;
  }
  else {
    int v16 = 0;
  }
  int v17 = v16 | v15;
  if ([v11 hasNegativeAction]) {
    int v18 = 16;
  }
  else {
    int v18 = 0;
  }
  if ([v11 hasExtraContent]) {
    int v19 = 32;
  }
  else {
    int v19 = 0;
  }
  int v20 = v18 | v19;
  id v21 = v9;
  uint64_t v22 = v17 | v20;
  [v10 writeUint8:v32];
  [v10 writeUint8:v22];
  [v10 writeUint8:v12];
  v33 = v14;
  [v10 writeUint8:[v14 count]];
  [v10 writeUint32:[v9 UID]];
  v23 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    objc_super v25 = [(ANCService *)self eventIDToString:v32];
    v26 = [(ANCService *)self categoryIDToString:v12];
    unsigned int v27 = [v9 UID];
    v28 = [(ANCService *)self eventFlagsToString:v22];
    v29 = [v11 appIdentifier];
    *(_DWORD *)buf = 138413314;
    v39 = v25;
    __int16 v40 = 2112;
    v41 = v26;
    __int16 v42 = 1024;
    unsigned int v43 = v27;
    __int16 v44 = 2112;
    v45 = v28;
    __int16 v46 = 2112;
    v47 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@ \"%@\" notification #%u (%@) from %@", buf, 0x30u);

    id v21 = v9;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025CDC;
  block[3] = &unk_1000B1750;
  block[4] = self;
  id v36 = v10;
  id v37 = v34;
  id v30 = v34;
  id v31 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateDataSource:(id)a3 central:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    unsigned __int8 v8 = 0;
    do
    {
      id v9 = (char *)((unsigned char *)[v6 length] - v8);
      uint64_t v10 = (char *)[v7 maximumUpdateValueLength];
      if (v9 >= v10) {
        id v9 = v10;
      }
      unsigned int v11 = [v6 subdataWithRange:v8, v9];
      id v12 = [(ANCService *)self dataSourceCharacteristic];
      id v14 = v7;
      char v13 = +[NSArray arrayWithObjects:&v14 count:1];
      [(ServerService *)self updateValue:v11 forCharacteristic:v12 onSubscribedCentrals:v13];

      unsigned __int8 v8 = &v8[(void)v9];
    }
    while (v8 != [v6 length]);
  }
}

- (void)startNotifications
{
  [(ANCService *)self setUidGenerator:0];
  objc_super v3 = +[NSMutableDictionary dictionary];
  [(ANCService *)self setUidMap:v3];

  id v4 = +[NSMutableDictionary dictionary];
  [(ANCService *)self setAlertMap:v4];

  uint64_t v5 = [ANCAlertSource alloc];
  id v7 = [(ANCService *)self queue];
  id v6 = [(ANCAlertSource *)v5 initWithDelegate:self queue:v7];
  [(ANCService *)self setAlertSource:v6];
}

- (void)stopNotifications
{
  objc_super v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v6[0] = 67109120;
    v6[1] = [(ServerService *)self restrictedMode];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);
  }
  uint64_t v5 = [(ANCService *)self alertSource];
  [v5 invalidate];

  [(ANCService *)self setAlertSource:0];
  [(ANCService *)self setAlertMap:0];
  [(ANCService *)self setUidMap:0];
  [(ANCService *)self setUidGenerator:0];
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  id v4 = a4;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    int v16 = &v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 central:v16];
        unsigned int v13 = [v12 hasTag:@"ANCSAuthorized"];

        if (v13)
        {
          [v5 addObject:v11];
        }
        else
        {
          id v14 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_10006F828(v25, v14, v11, v16);
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100026308;
          block[3] = &unk_1000B1778;
          block[4] = self;
          void block[5] = v11;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    unsigned int v15 = [(ANCService *)self queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100026318;
    v18[3] = &unk_1000B1778;
    v18[4] = self;
    id v19 = v5;
    dispatch_async(v15, v18);
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(ANCService *)self notificationSourceCharacteristic];

  if (v9 == v8)
  {
    uint64_t v10 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Central %@ subscribed to NotificationSourceCharacteristic", buf, 0xCu);
    }
    unsigned int v11 = [(ANCService *)self notificationSourceCharacteristic];
    id v12 = [v11 subscribedCentrals];
    id v13 = [v12 count];

    if (v13 == (id)1)
    {
      id v14 = objc_alloc_init((Class)NSMutableSet);
      [(ANCService *)self setActiveCentrals:v14];

      if ([v7 hasTag:@"ANCSAuthorized"])
      {
        unsigned int v15 = [(ANCService *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100026660;
        block[3] = &unk_1000B1778;
        block[4] = self;
        id v31 = v7;
        dispatch_sync(v15, block);
      }
      [(ANCService *)self startNotifications];
    }
    else
    {
      int v16 = [(ANCService *)self queue];
      long long v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      int v26 = sub_1000266B4;
      unsigned int v27 = &unk_1000B1778;
      id v28 = v7;
      v29 = self;
      dispatch_sync(v16, &v24);
    }
    if ((objc_msgSend(v7, "hasTag:", @"IsHearingAid", v24, v25, v26, v27) & 1) == 0)
    {
      int v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v7];
    }
    int v18 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      int v20 = [(ANCService *)self activeCentrals];
      id v21 = [v20 count];
      *(_DWORD *)buf = 138412546;
      id v33 = v7;
      __int16 v34 = 2048;
      id v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "After subscription from %@ for ANCS, active centrals count %ld", buf, 0x16u);
    }
    long long v22 = +[BTLEXpcServer instance];
    long long v23 = [v7 identifier];
    [v22 sendANCSNotificationSourceRegisteredMsg:v23];
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(ANCService *)self notificationSourceCharacteristic];

  if (v9 == v8)
  {
    uint64_t v10 = [(ANCService *)self notificationSourceCharacteristic];
    unsigned int v11 = [v10 subscribedCentrals];
    id v12 = [v11 count];

    if (v12)
    {
      id v13 = [(ANCService *)self queue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100026A20;
      v18[3] = &unk_1000B1778;
      v18[4] = self;
      id v19 = v7;
      dispatch_sync(v13, v18);
    }
    else
    {
      [(ANCService *)self stopNotifications];
      [(ANCService *)self setActiveCentrals:0];
    }
    id v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = v14;
      int v16 = [(ANCService *)self activeCentrals];
      id v17 = [v16 count];
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2048;
      id v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Central %@ unsubscribed from ANCS. Active centrals count %ld", buf, 0x16u);
    }
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUpdateANCSAuthorization:(BOOL)a5
{
  id v7 = a4;
  id v8 = [(ANCService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026B30;
  block[3] = &unk_1000B17C8;
  BOOL v12 = a5;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(v8, block);
}

- (void)alertAdded:(id)a3 isPreExisting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [ANCNotification alloc];
  uint64_t v8 = [(ANCService *)self uidGenerator];
  [(ANCService *)self setUidGenerator:(v8 + 1)];
  id v14 = [(ANCNotification *)v7 initWithUID:v8 alert:v6];

  id v9 = [(ANCService *)self uidMap];
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:[(ANCNotification *)v14 UID]];
  [v9 setObject:v14 forKeyedSubscript:v10];

  id v11 = [(ANCService *)self alertMap];
  BOOL v12 = [(ANCNotification *)v14 alert];
  [v11 setObject:v14 forKeyedSubscript:v12];

  if (v4) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = 0;
  }
  [(ANCService *)self updateNotificationSource:0 notification:v14 sourceFlags:v13];
}

- (void)alertModified:(id)a3
{
  id v4 = [(ANCService *)self notificationForAlert:a3];
  if (([v4 isDirty] & 1) == 0)
  {
    [v4 setIsDirty:1];
    [(ANCService *)self updateNotificationSource:1 notification:v4 sourceFlags:0];
  }
}

- (void)alertRemoved:(id)a3
{
  id v8 = [(ANCService *)self notificationForAlert:a3];
  [(ANCService *)self updateNotificationSource:2 notification:v8 sourceFlags:0];
  id v4 = [(ANCService *)self alertMap];
  id v5 = [v8 alert];
  [v4 removeObjectForKey:v5];

  id v6 = [(ANCService *)self uidMap];
  id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 UID]);
  [v6 removeObjectForKey:v7];
}

- (id)notificationForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ANCService *)self uidMap];
  id v5 = +[NSNumber numberWithUnsignedInt:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)notificationForAlert:(id)a3
{
  id v4 = a3;
  id v5 = [(ANCService *)self alertMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)responseForAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 attribute:(id)a5
{
  unsigned int v5 = a4;
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = +[DataOutputStream outputStreamWithByteOrder:1];
  id v9 = [v7 UTF8DataWithMaxLength:v5 ellipsis:1 isTruncated:0];

  [v8 writeUint8:v6];
  [v8 writeUint16:[v9 length]];
  id v10 = v9;
  [v8 writeBytes:objc_msgSend(v10, "bytes") length:objc_msgSend(v10, "length")];
  id v11 = [v8 data];

  return v11;
}

- (id)responseForNotificationAttributeID:(unsigned __int8)a3 maxLength:(unsigned __int16)a4 notification:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = [a5 alert];
  id v9 = v8;
  switch((int)v6)
  {
    case 0:
      uint64_t v10 = [v8 appIdentifier];
      goto LABEL_13;
    case 1:
      uint64_t v10 = [v8 title];
      goto LABEL_13;
    case 2:
      uint64_t v10 = [v8 subtitle];
      goto LABEL_13;
    case 3:
      uint64_t v10 = [v8 message];
      goto LABEL_13;
    case 4:
      id v11 = [v8 message];
      BOOL v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v11 lengthOfBytesUsingEncoding:4]);
      goto LABEL_8;
    case 5:
      id v11 = objc_alloc_init((Class)NSDateFormatter);
      [v11 setDateFormat:@"yyyyMMdd'T'HHmmss"];
      uint64_t v13 = +[NSLocale systemLocale];
      [v11 setLocale:v13];

      id v14 = [v9 date];
      BOOL v12 = [v11 stringFromDate:v14];

LABEL_8:
      break;
    case 6:
      if (![v8 hasPositiveAction]) {
        goto LABEL_14;
      }
      uint64_t v10 = [v9 positiveActionLabel];
      goto LABEL_13;
    case 7:
      if (![v8 hasNegativeAction]) {
        goto LABEL_14;
      }
      uint64_t v10 = [v9 negativeActionLabel];
LABEL_13:
      BOOL v12 = (void *)v10;
      break;
    default:
LABEL_14:
      BOOL v12 = 0;
      break;
  }
  unsigned int v15 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    int v18 = v15;
    id v19 = [(ANCService *)self notificationAttributeIDToString:v6];
    *(_DWORD *)buf = 138412546;
    id v21 = v19;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Sending %@: \"%@\"", buf, 0x16u);
  }
  int v16 = [(ANCService *)self responseForAttributeID:v6 maxLength:v5 attribute:v12];

  return v16;
}

- (id)responseForAppAttributeID:(unsigned __int8)a3 appIdentifier:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(ANCService *)self alertSource];
    id v7 = [v8 displayNameForAppIdentifier:v6];
  }
  id v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    BOOL v12 = v9;
    uint64_t v13 = [(ANCService *)self appAttributeIDToString:v4];
    int v14 = 138412546;
    unsigned int v15 = v13;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending %@: \"%@\"", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v10 = [(ANCService *)self responseForAttributeID:v4 maxLength:512 attribute:v7];

  return v10;
}

- (id)eventIDToString:(unsigned __int8)a3
{
  CFStringRef v3 = @"Added";
  if (a3 == 1) {
    CFStringRef v3 = @"Modified";
  }
  if (a3 == 2) {
    return @"Removed";
  }
  else {
    return (id)v3;
  }
}

- (id)categoryIDToString:(unsigned __int8)a3
{
  if ((a3 - 1) > 0xB) {
    return @"Other";
  }
  else {
    return *(&off_1000B17E8 + (char)(a3 - 1));
  }
}

- (id)eventFlagsToString:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = +[NSMutableString string];
  for (int i = 0; i != 8; ++i)
  {
    if (((1 << i) & v3) != 0)
    {
      int v6 = (1 << i);
      CFStringRef v7 = 0;
      switch((1 << i))
      {
        case 1u:
          CFStringRef v7 = @"S";
          break;
        case 2u:
          CFStringRef v7 = @"I";
          break;
        case 3u:
        case 5u:
        case 6u:
        case 7u:
          break;
        case 4u:
          CFStringRef v7 = @"P";
          break;
        case 8u:
          CFStringRef v7 = @"✓";
          break;
        default:
          if (v6 == 32) {
            CFStringRef v8 = @"E";
          }
          else {
            CFStringRef v8 = 0;
          }
          if (v6 == 16) {
            CFStringRef v7 = @"✗";
          }
          else {
            CFStringRef v7 = v8;
          }
          break;
      }
      if ([v4 length]) {
        [v4 appendString:@"|"];
      }
      [v4 appendString:v7];
    }
  }

  return v4;
}

- (id)notificationAttributeIDToString:(unsigned __int8)a3
{
  if (a3 >= 8u)
  {
    int v3 = +[NSString stringWithFormat:@"Unknown (%lu)", a3];
  }
  else
  {
    int v3 = *(&off_1000B1848 + (char)a3);
  }

  return v3;
}

- (id)appAttributeIDToString:(unsigned __int8)a3
{
  if (a3)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"Unknown (%lu)", a3];
  }
  else
  {
    uint64_t v4 = @"Display Name";
  }
  return v4;
}

- (CBMutableCharacteristic)controlPointCharacteristic
{
  return self->_controlPointCharacteristic;
}

- (void)setControlPointCharacteristic:(id)a3
{
}

- (CBMutableCharacteristic)notificationSourceCharacteristic
{
  return self->_notificationSourceCharacteristic;
}

- (void)setNotificationSourceCharacteristic:(id)a3
{
}

- (CBMutableCharacteristic)dataSourceCharacteristic
{
  return self->_dataSourceCharacteristic;
}

- (void)setDataSourceCharacteristic:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)activeCentrals
{
  return self->_activeCentrals;
}

- (void)setActiveCentrals:(id)a3
{
}

- (unsigned)uidGenerator
{
  return self->_uidGenerator;
}

- (void)setUidGenerator:(unsigned int)a3
{
  self->_uidGenerator = a3;
}

- (NSMutableDictionary)uidMap
{
  return self->_uidMap;
}

- (void)setUidMap:(id)a3
{
}

- (NSMutableDictionary)alertMap
{
  return self->_alertMap;
}

- (void)setAlertMap:(id)a3
{
}

- (ANCAlertSource)alertSource
{
  return self->_alertSource;
}

- (void)setAlertSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSource, 0);
  objc_storeStrong((id *)&self->_alertMap, 0);
  objc_storeStrong((id *)&self->_uidMap, 0);
  objc_storeStrong((id *)&self->_activeCentrals, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSourceCharacteristic, 0);
  objc_storeStrong((id *)&self->_notificationSourceCharacteristic, 0);

  objc_storeStrong((id *)&self->_controlPointCharacteristic, 0);
}

@end