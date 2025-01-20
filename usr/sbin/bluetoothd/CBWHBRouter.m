@interface CBWHBRouter
- (BOOL)insertIntoDeviceTableWithKey:(id)a3 value:(id)a4;
- (BOOL)insertIntoWHBHostTableWithKey:(id)a3 value:(id)a4;
- (CBWHBRouter)init;
- (CBWHBRouter)initWithOptions:(unint64_t)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)getCBDeviceForStableId:(id)a3 onHost:(id)a4;
- (id)optimalWHBHostForStableIdentifier:(id)a3 result:(int *)a4;
- (id)rankWHBHosts:(id)a3;
- (unint64_t)calculateMetricforDevice:(id)a3 onHost:(id)a4;
- (unint64_t)coexUsageOfWHBHost:(id)a3;
- (void)activate;
- (void)coexChangeNotification:(id)a3;
- (void)deviceConnectionInterruptedOn:(id)a3;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)hostConnectionInterruptedOn:(id)a3;
- (void)invalidate;
- (void)receivedUpdateEvent:(id)a3 hostID:(id)a4;
- (void)removeDeviceFromDeviceTable:(id)a3 value:(id)a4;
- (void)removeFromDeviceTableWithKey:(id)a3 value:(id)a4;
- (void)removefromRemoteHostMapWithKey:(id)a3;
- (void)removefromRemoteHostMapWithKey:(id)a3 value:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)subscribeToCoexStateUpdates;
- (void)unSubscribeFromCoexStateUpdates;
- (void)updateCoexUpdate:(id)a3 whbHost:(id)a4;
@end

@implementation CBWHBRouter

- (CBWHBRouter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CBWHBRouter;
  v2 = [(CBWHBRouter *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceTable = v2->_deviceTable;
    v2->_deviceTable = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    whbHostTable = v2->_whbHostTable;
    v2->_whbHostTable = v5;

    v2->_options = 7;
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_isActivated = 0;
  }
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  return v2;
}

- (CBWHBRouter)initWithOptions:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CBWHBRouter;
  v4 = [(CBWHBRouter *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceTable = v4->_deviceTable;
    v4->_deviceTable = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    whbHostTable = v4->_whbHostTable;
    v4->_whbHostTable = v7;

    v4->_options = a3 | 1;
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v4->_isActivated = 0;
  }
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  return v4;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  [(CBWHBRouter *)self subscribeToCoexStateUpdates];
  self->_isActivated = 1;
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)invalidate
{
  self->_isActivated = 0;
  [(CBWHBRouter *)self unSubscribeFromCoexStateUpdates];
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (unint64_t)coexUsageOfWHBHost:(id)a3
{
  id v4 = a3;
  if ((self->_options & 2) == 0)
  {
    unint64_t v5 = 1;
LABEL_23:
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    goto LABEL_27;
  }
  v6 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v4];
  if (v6)
  {
    v7 = v6;
    if ([v6 estimatedConnectionsLastUpdatedTicks])
    {
      mach_absolute_time();
      if ((unint64_t)UpTicksToSeconds() >= 0xA)
      {
        [v7 setEstimatedConnections:0];
        [v7 setEstimatedConnectionsLastUpdatedTicks:0];
      }
    }
    uint64_t Int64 = CFPrefs_GetInt64();
    unint64_t v9 = 3;
    unint64_t v10 = Int64;
    if (Int64 != 3)
    {
      if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v16 = 3;
        unint64_t v17 = v10;
        LogPrintF_safe();
      }
      unint64_t v9 = v10;
    }
    v11 = [v7 coexUsage:v16, v17];
    id v12 = [v11 numLEConnection];

    if ((unint64_t)v12 >= v9)
    {
      unint64_t v5 = 0;
    }
    else
    {
      v13 = (char *)[v7 estimatedConnections];
      v14 = [v7 coexUsage];
      unint64_t v5 = &v13[(void)[v14 numLEConnection]] < (char *)3;
    }
    goto LABEL_23;
  }
  if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  unint64_t v5 = 0;
LABEL_27:

  return v5;
}

- (id)rankWHBHosts:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_deviceTable objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    v23 = v5;
    v7 = [v5 hostMap];
    objc_super v8 = [v7 allKeys];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10007BA84;
    v28[3] = &unk_1009981F0;
    v28[4] = self;
    id v22 = v4;
    id v29 = v22;
    unint64_t v9 = [v8 sortedArrayUsingComparator:v28];

    id v10 = [v9 mutableCopy];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((self->_options & 2) != 0)
          {
            uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            if (![(CBWHBRouter *)self coexUsageOfWHBHost:v16])
            {
              if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
                [v10 removeObject:v16];
              }
              else
              {
                [v10 removeObject:v16];
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v13);
    }

    id v17 = [v10 count];
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v22;
      id v21 = v17;
      LogPrintF_safe();
    }
    if (v17 && dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      v20 = [v10 componentsJoinedByString:@", ", v19, v21];
      LogPrintF_safe();
    }
    v6 = v23;
  }
  else
  {
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v10 = 0;
  }

  return v10;
}

- (void)subscribeToCoexStateUpdates
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"coexChangeNotification:" name:@"com.apple.bluetooth.leconnection" object:0];
}

- (void)unSubscribeFromCoexStateUpdates
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.bluetooth.leconnection" object:0];
}

- (void)coexChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007BC6C;
  v7[3] = &unk_100997208;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)insertIntoDeviceTableWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 stableIdentifier];
  if (v8)
  {
    unint64_t v9 = [(NSMutableDictionary *)self->_deviceTable objectForKeyedSubscript:v8];
    if (v9)
    {
      id v10 = v9;
      id v11 = [(CBDeviceEntry *)v9 hostMap];
      id v12 = [v11 objectForKeyedSubscript:v7];
      id v13 = v12;
      if (v12)
      {
        [v12 floatValue];
        *(float *)&double v15 = (float)(v14 + (float)(int)[v6 bleRSSI]) * 0.5;
        uint64_t v16 = +[NSNumber numberWithFloat:v15];
        [v11 setObject:v16 forKeyedSubscript:v7];

        if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
        {
          [v6 bleRSSI];
          id v21 = [v11 objectForKeyedSubscript:v7];
          LogPrintF_safe();
        }
      }
      else
      {
        id v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 bleRSSI]);
        [v11 setObject:v19 forKeyedSubscript:v7];

        if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
        {
          [v6 bleRSSI];
          LogPrintF_safe();
        }
      }
    }
    else
    {
      id v10 = objc_alloc_init(CBDeviceEntry);
      id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 bleRSSI]);
      v18 = [(CBDeviceEntry *)v10 hostMap];
      [v18 setObject:v17 forKeyedSubscript:v7];

      [(NSMutableDictionary *)self->_deviceTable setObject:v10 forKeyedSubscript:v8];
      if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
  }
  return v8 != 0;
}

- (void)removeDeviceFromDeviceTable:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_deviceTable objectForKeyedSubscript:v10];
  id v8 = v7;
  if (v7)
  {
    unint64_t v9 = [v7 hostMap];
    [v9 removeObjectForKey:v6];
  }
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (void)removeFromDeviceTableWithKey:(id)a3 value:(id)a4
{
  id v7 = a4;
  id v6 = [a3 stableIdentifier];
  if (v6) {
    [(CBWHBRouter *)self removeDeviceFromDeviceTable:v6 value:v7];
  }
}

- (unint64_t)calculateMetricforDevice:(id)a3 onHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unint64_t v9 = 0;
  if (v6 && v7)
  {
    id v10 = [(NSMutableDictionary *)self->_deviceTable objectForKeyedSubscript:v6];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 hostMap];
      id v13 = [v12 objectForKeyedSubscript:v8];
      float v14 = v13;
      if (v13)
      {
        [v13 floatValue];
        if (v15 <= -85.0)
        {
          unint64_t v9 = 0;
        }
        else if (v15 < -85.0 || v15 > -80.0)
        {
          BOOL v17 = v15 > -50.0 || v15 < -70.0;
          uint64_t v18 = 3;
          if (v17) {
            uint64_t v18 = 4;
          }
          if (v15 < -80.0 || v15 > -70.0) {
            unint64_t v9 = v18;
          }
          else {
            unint64_t v9 = 2;
          }
        }
        else
        {
          unint64_t v9 = 1;
        }
        if ((self->_options & 2) != 0) {
          v9 *= [(CBWHBRouter *)self coexUsageOfWHBHost:v8];
        }
      }
      else
      {
        unint64_t v9 = 0;
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  return v9;
}

- (BOOL)insertIntoWHBHostTableWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 stableIdentifier];
  if (v8)
  {
    unint64_t v9 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v6];
    if (v9)
    {
      id v10 = v9;
      id v11 = [(CBWHBHostEntry *)v9 deviceList];
      [v11 setObject:v7 forKeyedSubscript:v8];

      if (dword_1009F80B8 > 30 || dword_1009F80B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_17;
      }
    }
    else
    {
      id v10 = objc_alloc_init(CBWHBHostEntry);
      id v12 = [(CBWHBHostEntry *)v10 deviceList];
      [v12 setObject:v7 forKeyedSubscript:v8];

      [(NSMutableDictionary *)self->_whbHostTable setObject:v10 forKeyedSubscript:v6];
      if (dword_1009F80B8 > 30 || dword_1009F80B8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_17;
      }
    }
    LogPrintF_safe();
LABEL_17:

    goto LABEL_18;
  }
  if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
LABEL_18:

  return v8 != 0;
}

- (void)removefromRemoteHostMapWithKey:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 stableIdentifier];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v11];
    unint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 deviceList];
      [v10 removeObjectForKey:v7];
    }
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  else if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)removefromRemoteHostMapWithKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v4];
  if (v5)
  {
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v4;
      LogPrintF_safe();
    }
    id v6 = [v5 deviceList:v7];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007C8E8;
    v8[3] = &unk_100998218;
    v8[4] = self;
    id v9 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }
  [(NSMutableDictionary *)self->_whbHostTable removeObjectForKey:v4];
  if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
}

- (void)deviceFound:(id)a3
{
  id v4 = a3;
  if (!self->_isActivated)
  {
    if (dword_1009F80B8 > 90 || dword_1009F80B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
LABEL_12:
    LogPrintF_safe();
    goto LABEL_22;
  }
  if (!v4) {
    goto LABEL_22;
  }
  id v10 = v4;
  if (![v4 bleRSSI])
  {
    if (dword_1009F80B8 > 90 || dword_1009F80B8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  unint64_t v5 = [v10 stableIdentifier];
  if (v5)
  {
    id v6 = [v10 remoteHostID];
    if (v6)
    {
      id v7 = [v10 remoteHostID];
    }
    else
    {
      id v7 = @"CBLocalHostID";
    }

    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      id v8 = v5;
      id v9 = v7;
      LogPrintF_safe();
    }
    -[CBWHBRouter insertIntoDeviceTableWithKey:value:](self, "insertIntoDeviceTableWithKey:value:", v10, v7, v8, v9);
    [(CBWHBRouter *)self insertIntoWHBHostTableWithKey:v7 value:v10];
  }
LABEL_22:

  _objc_release_x2();
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  if (self->_isActivated)
  {
    if (v4)
    {
      id v10 = v4;
      unint64_t v5 = [v4 stableIdentifier];
      if (v5)
      {
        id v6 = [v10 remoteHostID];
        if (v6)
        {
          id v7 = [v10 remoteHostID];
        }
        else
        {
          id v7 = @"CBLocalHostID";
        }

        if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
        {
          id v8 = v5;
          id v9 = v7;
          LogPrintF_safe();
        }
        -[CBWHBRouter removeFromDeviceTableWithKey:value:](self, "removeFromDeviceTableWithKey:value:", v10, v7, v8, v9);
        [(CBWHBRouter *)self removefromRemoteHostMapWithKey:v7 value:v10];
      }
    }
  }
  else if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  _objc_release_x2();
}

- (void)hostConnectionInterruptedOn:(id)a3
{
  id v4 = (__CFString *)a3;
  unint64_t v5 = v4;
  if (self->_isActivated)
  {
    id v6 = @"CBLocalHostID";
    id v11 = v4;
    if (v4) {
      id v6 = v4;
    }
    id v7 = v6;
    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v7;
      LogPrintF_safe();
    }
    -[CBWHBRouter removefromRemoteHostMapWithKey:](self, "removefromRemoteHostMapWithKey:", v7, v10);
    id v8 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v8 reportWhbMetric:&off_1009E16B8];

    goto LABEL_12;
  }
  if (dword_1009F80B8 <= 90)
  {
    id v11 = v4;
    if (dword_1009F80B8 != -1 || (v9 = _LogCategory_Initialize(), unint64_t v5 = v11, v9))
    {
      LogPrintF_safe();
LABEL_12:
      unint64_t v5 = v11;
    }
  }
}

- (void)deviceConnectionInterruptedOn:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isActivated)
  {
    id v9 = v4;
    if (dword_1009F80B8 <= 30)
    {
      if (dword_1009F80B8 != -1 || (v6 = _LogCategory_Initialize(), id v5 = v9, v6))
      {
        id v8 = v5;
        LogPrintF_safe();
      }
    }
    -[CBWHBRouter deviceLost:](self, "deviceLost:", v9, v8);
    id v7 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v7 reportWhbMetric:&off_1009E16E0];
  }
  else if (dword_1009F80B8 <= 90)
  {
    if (dword_1009F80B8 != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
      id v4 = (id)LogPrintF_safe();
    }
  }

  _objc_release_x2(v4);
}

- (id)optimalWHBHostForStableIdentifier:(id)a3 result:(int *)a4
{
  id v6 = a3;
  if (self->_isActivated)
  {
    if (a4) {
      *a4 = 0;
    }
    id v7 = [(NSMutableDictionary *)self->_deviceTable objectForKeyedSubscript:v6];
    if (!v7)
    {
      if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v15 = 0;
      if (a4) {
        *a4 = 1701;
      }
      goto LABEL_32;
    }
    id v8 = [(CBWHBRouter *)self rankWHBHosts:v6];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 firstObject];
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = [(CBWHBRouter *)self getCBDeviceForStableId:v6 onHost:v10];
        id v13 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v11];
        [v13 setEstimatedConnections:[v13 estimatedConnections] + 1];
        [v13 setEstimatedConnectionsLastUpdatedTicks:mach_absolute_time()];
        if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
        {
          id v20 = [v13 estimatedConnections];
          id v21 = v11;
          LogPrintF_safe();
        }

        CFStringRef v22 = @"CBWHBMetricsKeyEventType";
        CFStringRef v23 = @"CBWHBMetricsKeySubEventType";
        CFStringRef v25 = @"WhbStateEvent";
        CFStringRef v26 = @"OptimalWHBHost";
        CFStringRef v24 = @"CBWHBMetricsKeyHostIdentifier";
        unsigned int v16 = [v11 isEqual:@"CBLocalHostID"];
        CFStringRef v14 = @"NotLocal";
        if (v16) {
          CFStringRef v14 = @"Local";
        }
        goto LABEL_27;
      }
      if (a4) {
        *a4 = 345;
      }
    }
    id v12 = 0;
    id v11 = 0;
    CFStringRef v22 = @"CBWHBMetricsKeyEventType";
    CFStringRef v23 = @"CBWHBMetricsKeySubEventType";
    CFStringRef v25 = @"WhbStateEvent";
    CFStringRef v26 = @"OptimalWHBHost";
    CFStringRef v24 = @"CBWHBMetricsKeyHostIdentifier";
    CFStringRef v14 = @"None";
LABEL_27:
    CFStringRef v27 = v14;
    BOOL v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v22, 3, v20, v21);
    uint64_t v18 = +[CBMetricsDaemon sharedCBMetricsDaemon];
    [v18 reportWhbMetric:v17];

    if (dword_1009F80B8 <= 30 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v15 = v12;

LABEL_32:
    goto LABEL_33;
  }
  if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v15 = 0;
LABEL_33:

  return v15;
}

- (id)getCBDeviceForStableId:(id)a3 onHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v7];
  id v9 = v8;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004CEEC;
  id v21 = sub_10004CD48;
  id v22 = 0;
  if (v8)
  {
    uint64_t v10 = [v8 deviceList];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007D450;
    v13[3] = &unk_100998240;
    id v14 = v6;
    id v15 = v7;
    unsigned int v16 = &v17;
    [v10 enumerateKeysAndObjectsUsingBlock:v13];
  }
  else if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)description
{
  return [(CBWHBRouter *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 > 0x14u)
  {
    uint64_t v12 = 0;
    id v6 = [(id)objc_opt_class() description];
    [(NSMutableDictionary *)self->_deviceTable count];
    [(NSMutableDictionary *)self->_whbHostTable count];
    id v7 = (id *)&v12;
    goto LABEL_7;
  }
  void v13[4] = 0;
  id v11 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v4 = (__CFString *)0;

  if (self->_deviceTable)
  {
    v13[3] = v4;
    NSAppendPrintF_safe();
    id v5 = v4;

    v13[2] = v5;
    NSAppendPrintF_safe();
    id v4 = v5;
  }
  if (self->_whbHostTable)
  {
    v13[1] = v4;
    NSAppendPrintF_safe();
    id v6 = v4;

    v13[0] = v6;
    id v7 = (id *)v13;
LABEL_7:
    NSAppendPrintF_safe();
    id v4 = (__CFString *)*v7;
  }
  if (v4) {
    id v8 = v4;
  }
  else {
    id v8 = &stru_1009C1AC8;
  }
  id v9 = v8;

  return v9;
}

- (void)updateCoexUpdate:(id)a3 whbHost:(id)a4
{
  id v12 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"];
  id v7 = [v6 unsignedLongValue];
  id v8 = [(NSMutableDictionary *)self->_whbHostTable objectForKeyedSubscript:v12];
  if (v8)
  {
    id v9 = v8;
    [(CBWHBHostEntry *)v8 setEstimatedConnections:0];
    [(CBWHBHostEntry *)v9 setEstimatedConnectionsLastUpdatedTicks:0];
    uint64_t v10 = [(CBWHBHostEntry *)v9 coexUsage];
    [v10 setNumLEConnection:v7];
  }
  else
  {
    id v9 = objc_alloc_init(CBWHBHostEntry);
    id v11 = [(CBWHBHostEntry *)v9 coexUsage];
    [v11 setNumLEConnection:v7];

    [(NSMutableDictionary *)self->_whbHostTable setObject:v9 forKeyedSubscript:v12];
  }
}

- (void)receivedUpdateEvent:(id)a3 hostID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isActivated)
  {
    id v8 = [v6 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 unsignedLongValue];
      [(CBWHBRouter *)self updateCoexUpdate:v6 whbHost:v7];
      v14[0] = @"CBWHBMetricsKeyEventType";
      v14[1] = @"CBWHBMetricsKeySubEventType";
      v15[0] = @"CoexUpdateEvent";
      v15[1] = @"ReceivedCoexUpdate";
      v14[2] = @"CBWHBMetricsKeyNumLEConnections";
      id v11 = +[NSNumber numberWithUnsignedLongLong:v10];
      v15[2] = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

      id v13 = +[CBMetricsDaemon sharedCBMetricsDaemon];
      [v13 reportWhbMetric:v12];
    }
    else if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (dword_1009F80B8 <= 90 && (dword_1009F80B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_whbHostTable, 0);

  objc_storeStrong((id *)&self->_deviceTable, 0);
}

@end