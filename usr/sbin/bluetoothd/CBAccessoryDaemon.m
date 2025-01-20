@interface CBAccessoryDaemon
- (CBDaemonServer)daemonServer;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)diagnosticAccessoryFakeWithIdentifier:(id)a3 leftPercent:(int)a4 leftState:(unsigned __int8)a5 rightPercent:(int)a6 rightState:(unsigned __int8)a7 casePercent:(int)a8 caseState:(unsigned __int8)a9 lidClosed:(BOOL)a10 obcMinutes:(int)a11 error:(id *)a12;
- (id)diagnosticControl:(id)a3 error:(id *)a4;
- (id)findPrimaryCBDevice:(id)a3;
- (void)_accessoryDiscoveryEnsureStarted;
- (void)_accessoryDiscoveryEnsureStopped;
- (void)_accessoryDiscoveryFoundDevice:(id)a3;
- (void)_connectionMonitorEnsureStarted;
- (void)_connectionMonitorEnsureStopped;
- (void)_connectionMonitorFoundDevice:(id)a3;
- (void)_connectionMonitorUpdate;
- (void)_screenOnChanged;
- (void)_update;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)setDaemonServer:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CBAccessoryDaemon

- (id)description
{
  return [(CBAccessoryDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v26 = 0;
  v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10004CEBC;
  v30 = sub_10004CD30;
  id v31 = 0;
  int v25 = 12;
  id obj = 0;
  unsigned int v5 = a3;
  uint64_t v16 = objc_opt_class();
  CUAppendF();
  objc_storeStrong(&v31, 0);
  v6 = v27 + 5;
  id v23 = v27[5];
  v7 = (CBDiscovery *)[(NSMutableDictionary *)self->_accessoryInfoMap count];
  if (self->_connectionMonitor) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  v17 = v7;
  v18 = v8;
  CUAppendF();
  objc_storeStrong(v6, v23);
  if (v5 <= 0x14)
  {
    v9 = v27;
    id v22 = v27[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v9 + 5, v22);
    connectionMonitor = self->_connectionMonitor;
    if (connectionMonitor)
    {
      v11 = v27;
      id v21 = v27[5];
      v17 = connectionMonitor;
      NSAppendPrintF_safe();
      objc_storeStrong(v11 + 5, v21);
    }
    accessoryInfoMap = self->_accessoryInfoMap;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000624C4;
    v19[3] = &unk_1009978E8;
    v19[4] = &v26;
    int v20 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryInfoMap, "enumerateKeysAndObjectsUsingBlock:", v19, v17, v18);
  }
  v13 = (__CFString *)v27[5];
  if (!v13) {
    v13 = &stru_1009C1AC8;
  }
  v14 = v13;
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  v3 = self->_systemMonitor;
  if (!v3)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    objc_storeStrong((id *)&self->_systemMonitor, v3);
    [(CUSystemMonitor *)v3 setDispatchQueue:self->_dispatchQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000626B0;
    v5[3] = &unk_100997230;
    v5[4] = self;
    [(CUSystemMonitor *)v3 setScreenOnChangedHandler:v5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000626B8;
    v4[3] = &unk_100997230;
    v4[4] = self;
    [(CUSystemMonitor *)v3 setScreenLockedChangedHandler:v4];
    [(CUSystemMonitor *)v3 activateWithCompletion:&stru_100997908];
  }
  [(CBAccessoryDaemon *)self prefsChanged];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  [(CBAccessoryDaemon *)self _accessoryDiscoveryEnsureStopped];
  [(CBAccessoryDaemon *)self _connectionMonitorEnsureStopped];
  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    v4 = periodicTimer;
    dispatch_source_cancel(v4);
    unsigned int v5 = self->_periodicTimer;
    self->_periodicTimer = 0;
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;
}

- (id)diagnosticControl:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v7 = objc_claimAutoreleasedReturnValue();
  v8 = (const char *)[v7 UTF8String];
  if (v8)
  {
    v9 = v8;
    if (!strcasecmp(v8, "accessory-help"))
    {
      v10 = @"accessory-fake-add[,paramKey1=paramValue1][,paramKey2=paramValue2][,etc.] -- Add/update fake accessory.\n    id=accessoryID\n    leftPercent=0-100\n    leftState=unknown/charging/discharging\n    rightPercent=0-100\n    rightState=unknown/charging/discharging\n    casePercent=0-100\n    caseState=unknown/charging/discharging\n    lidClosed=yes/no\n    obc=yes/no\naccessory-fake-remove -- Remove fake accessory\n\nExample: accessory-fake-add,casePercent=54,lidClosed=yes\n\n";
    }
    else if (!strcasecmp(v9, "accessory-fake-remove"))
    {
      v11 = self->_accessoryFakeDevice;
      if (v11)
      {
        if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
        {
          v32 = v11;
          LogPrintF_safe();
        }
        uint64_t v28 = [(CBDevice *)v11 identifier];
        v29 = [(NSMutableDictionary *)self->_accessoryInfoMap objectForKeyedSubscript:v28];
        [v29 invalidate];
        [(NSMutableDictionary *)self->_accessoryInfoMap setObject:0 forKeyedSubscript:v28];
        accessoryFakeDevice = self->_accessoryFakeDevice;
        self->_accessoryFakeDevice = 0;

        v10 = @"Removed accessory\n";
      }
      else
      {
        v10 = @"No fake accessory\n";
      }
    }
    else
    {
      if (stricmp_prefix())
      {
        v10 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"error: unsupported command '%s'. See accessory-help\n", v9];
        goto LABEL_70;
      }
      v33 = a4;
      v34 = self;
      id v38 = v6;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v12 = +[NSString stringWithUTF8String:v9 + 18];
      v13 = [v12 componentsSeparatedByString:@","];

      id v14 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v14)
      {
        id v15 = v14;
        unsigned int v37 = 0;
        BOOL v35 = 0;
        char v36 = 2;
        uint64_t v16 = *(void *)v45;
        unsigned int v41 = 82;
        unsigned __int8 v42 = 1;
        v17 = @"FakeAccessoryID";
        unsigned int v43 = 78;
        unsigned int v39 = 43;
        unsigned __int8 v40 = 1;
LABEL_13:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
          if (![v19 length]) {
            goto LABEL_58;
          }
          int v20 = [v19 componentsSeparatedByString:@"="];
          if ((unint64_t)[v20 count] <= 1)
          {
            v10 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"error: bad parameter format '%@'. See accessory-help\n", v19];
LABEL_63:

            goto LABEL_66;
          }
          id v21 = [v20 objectAtIndexedSubscript:0];
          id v22 = [v20 objectAtIndexedSubscript:1];
          [v22 UTF8String];
          if ([v21 caseInsensitiveCompare:@"id"])
          {
            if ([v21 caseInsensitiveCompare:@"leftPercent"])
            {
              if (![v21 caseInsensitiveCompare:@"leftState"])
              {
                id v24 = v22;
                if ([v24 caseInsensitiveCompare:@"Charging"])
                {
                  if ([v24 caseInsensitiveCompare:@"Discharging"])
                  {
                    if ([v24 caseInsensitiveCompare:@"FullyCharged"]) {
                      char v25 = 4 * ([v24 caseInsensitiveCompare:@"OBC"] == 0);
                    }
                    else {
                      char v25 = 3;
                    }
                  }
                  else
                  {
                    char v25 = 2;
                  }
                }
                else
                {
                  char v25 = 1;
                }
                unsigned __int8 v42 = v25;
LABEL_56:

                goto LABEL_57;
              }
              if ([v21 caseInsensitiveCompare:@"rightPercent"])
              {
                if ([v21 caseInsensitiveCompare:@"rightState"])
                {
                  if ([v21 caseInsensitiveCompare:@"casePercent"])
                  {
                    if ([v21 caseInsensitiveCompare:@"caseState"])
                    {
                      if ([v21 caseInsensitiveCompare:@"lidClosed"])
                      {
                        if ([v21 caseInsensitiveCompare:@"obcMinutes"])
                        {
                          v10 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"error: bad parameter key '%@'. See accessory-help\n", v21];

                          goto LABEL_63;
                        }
                        unsigned int v37 = [v22 intValue];
                      }
                      else
                      {
                        BOOL v27 = !strnicmpx()
                           || !strnicmpx()
                           || !strnicmpx()
                           || !strnicmpx()
                           || strnicmpx() == 0;
                        BOOL v35 = v27;
                      }
                    }
                    else
                    {
                      char v36 = sub_100062EA8(v22);
                    }
                  }
                  else
                  {
                    unsigned int v39 = [v22 intValue];
                  }
                  goto LABEL_57;
                }
                id v24 = v22;
                if ([v24 caseInsensitiveCompare:@"Charging"])
                {
                  if ([v24 caseInsensitiveCompare:@"Discharging"])
                  {
                    if ([v24 caseInsensitiveCompare:@"FullyCharged"]) {
                      char v26 = 4 * ([v24 caseInsensitiveCompare:@"OBC"] == 0);
                    }
                    else {
                      char v26 = 3;
                    }
                  }
                  else
                  {
                    char v26 = 2;
                  }
                }
                else
                {
                  char v26 = 1;
                }
                unsigned __int8 v40 = v26;
                goto LABEL_56;
              }
              unsigned int v41 = [v22 intValue];
            }
            else
            {
              unsigned int v43 = [v22 intValue];
            }
          }
          else
          {
            id v23 = (__CFString *)v22;

            v17 = v23;
          }
LABEL_57:

LABEL_58:
          if (v15 == (id)++v18)
          {
            id v15 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v15) {
              goto LABEL_13;
            }
            goto LABEL_65;
          }
        }
      }
      unsigned int v37 = 0;
      BOOL v35 = 0;
      char v36 = 2;
      unsigned int v41 = 82;
      unsigned __int8 v42 = 1;
      unsigned int v43 = 78;
      unsigned int v39 = 43;
      unsigned __int8 v40 = 1;
      v17 = @"FakeAccessoryID";
LABEL_65:

      HIDWORD(v32) = v37;
      BYTE1(v32) = v35;
      LOBYTE(v32) = v36;
      -[CBAccessoryDaemon diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:](v34, "diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:", v17, v43, v42, v41, v40, v39, v32, v33);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_66:
      id v6 = v38;
    }
  }
  else if (a4)
  {
    CBErrorF();
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_70:

  return v10;
}

- (id)diagnosticAccessoryFakeWithIdentifier:(id)a3 leftPercent:(int)a4 leftState:(unsigned __int8)a5 rightPercent:(int)a6 rightState:(unsigned __int8)a7 casePercent:(int)a8 caseState:(unsigned __int8)a9 lidClosed:(BOOL)a10 obcMinutes:(int)a11 error:(id *)a12
{
  int v29 = a7;
  int v14 = a5;
  id v17 = a3;
  v30 = self;
  accessoryFakeDevice = self->_accessoryFakeDevice;
  p_accessoryFakeDevice = &self->_accessoryFakeDevice;
  int v20 = accessoryFakeDevice;
  id v21 = v20;
  if (!v20)
  {
    id v21 = (CBDevice *)objc_alloc_init((Class)CBDevice);
    objc_storeStrong((id *)p_accessoryFakeDevice, v21);
  }
  [(CBDevice *)v21 setAccessoryStatusFlags:a10];
  [(CBDevice *)v21 setAccessoryStatusOBCTime:(double)(60 * a11)];
  if (a4 >= 100) {
    int v22 = 100;
  }
  else {
    int v22 = a4;
  }
  [(CBDevice *)v21 setBatteryInfoLeft:v22 & ~(v22 >> 31) | (v14 << 8)];
  if (a6 >= 100) {
    int v23 = 100;
  }
  else {
    int v23 = a6;
  }
  [(CBDevice *)v21 setBatteryInfoRight:v23 & ~(v23 >> 31) | (v29 << 8)];
  if (a8 >= 100) {
    int v24 = 100;
  }
  else {
    int v24 = a8;
  }
  [(CBDevice *)v21 setBatteryInfoCase:v24 & ~(v24 >> 31) | (a9 << 8)];
  [(CBDevice *)v21 setIdentifier:v17];
  [(CBDevice *)v21 setName:@"Fake Accessory"];
  [(CBDevice *)v21 setProductID:8206];
  [(CBDevice *)v21 setVendorID:76];
  [(CBDevice *)v21 setVendorIDSource:1];
  if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v28 = v21;
    LogPrintF_safe();
  }
  -[CBAccessoryDaemon _accessoryDiscoveryFoundDevice:](v30, "_accessoryDiscoveryFoundDevice:", v21, v28);
  if (v20) {
    char v25 = @"Updated accessory\n";
  }
  else {
    char v25 = @"Added accessory\n";
  }
  char v26 = v25;

  return v26;
}

- (id)findPrimaryCBDevice:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  while ((v4 & 1) != 0)
  {
    unsigned int v5 = [(CBDaemonServer *)self->_daemonServer stackController];
    char v6 = 1;
    BOOL v27 = v5;
    do
    {
      int v7 = (v5 != 0) & v6;
      if (v7 != 1) {
        break;
      }
      v8 = [v5 getDevicesWithFlags:2 error:0];
      v9 = v8;
      if (v8)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v8;
        id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v29;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v16 = [v15 findMyCaseIdentifier:v23, v24];
              id v17 = v3;
              id v18 = v16;
              if (v18 == v17)
              {

LABEL_21:
                if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
                {
                  id v23 = v17;
                  int v24 = v15;
                  LogPrintF_safe();
                }
                id v26 = v15;
                int v21 = 1;
                v9 = v10;
                goto LABEL_27;
              }
              v19 = v18;
              if ((v3 == 0) != (v18 != 0))
              {
                unsigned int v20 = [v17 isEqual:v18];

                if (v20) {
                  goto LABEL_21;
                }
              }
              else
              {
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
          int v21 = 0;
LABEL_27:
          unsigned int v5 = v27;
          int v7 = 1;
        }
        else
        {
          int v21 = 0;
        }
      }
      else
      {
        int v21 = 0;
      }

      char v6 = 0;
    }
    while (!v21);

    char v4 = 0;
    if (v7) {
      goto LABEL_33;
    }
  }
  id v26 = 0;
LABEL_33:

  return v26;
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefAccessoryDaemonConnectionMonitor != v3)
  {
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      char v4 = "yes";
      if (v3) {
        unsigned int v5 = "no";
      }
      else {
        unsigned int v5 = "yes";
      }
      if (!v3) {
        char v4 = "no";
      }
      id v12 = v5;
      uint64_t v13 = (void *)v4;
      LogPrintF_safe();
    }
    self->_prefAccessoryDaemonConnectionMonitor = v3;
  }
  CFPrefs_GetDouble();
  double v7 = v6;
  if (v6 != self->_prefAccessoryDaemonConnectSeconds)
  {
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      CUPrintDurationDouble();
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      CUPrintDurationDouble();
      v13 = id v12 = v8;
      LogPrintF_safe();
    }
    self->_prefAccessoryDaemonConnectSeconds = v7;
  }
  CFPrefs_GetDouble();
  double v10 = v9;
  if (v9 != self->_prefAccessoryDaemonStayConnectedSeconds)
  {
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      CUPrintDurationDouble();
      id v11 = (char *)objc_claimAutoreleasedReturnValue();
      CUPrintDurationDouble();
      v13 = id v12 = v11;
      LogPrintF_safe();
    }
    self->_prefAccessoryDaemonStayConnectedSeconds = v10;
  }
  [(CBAccessoryDaemon *)self _update];
}

- (void)_screenOnChanged
{
  [(CUSystemMonitor *)self->_systemMonitor screenOn];
  [(CUSystemMonitor *)self->_systemMonitor screenLocked];
  if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }

  [(CBAccessoryDaemon *)self _update];
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = [(CBDaemonServer *)self->_daemonServer stackController];
  if (!v3) {
    goto LABEL_15;
  }
  char v4 = v3;
  unsigned int v5 = [v3 getDevicesWithFlags:1 error:0];
  if (!v5)
  {
LABEL_12:

LABEL_15:
    [(CBAccessoryDaemon *)self _accessoryDiscoveryEnsureStopped];
    goto LABEL_16;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v6);
    }
    id v11 = [CBProductInfo productInfoWithProductID:objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "productID", (void)v14)];
    unsigned int v12 = [v11 flags];

    if ((v12 & 0x100000) != 0) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  unsigned __int8 v13 = [(CUSystemMonitor *)self->_systemMonitor screenOn];

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
  [(CBAccessoryDaemon *)self _accessoryDiscoveryEnsureStarted];
LABEL_16:
  if (self->_prefAccessoryDaemonConnectionMonitor) {
    [(CBAccessoryDaemon *)self _connectionMonitorEnsureStarted];
  }
  else {
    [(CBAccessoryDaemon *)self _connectionMonitorEnsureStopped];
  }
  [(CBAccessoryDaemon *)self _connectionMonitorUpdate];
}

- (void)_accessoryDiscoveryEnsureStarted
{
  if (!self->_accessoryDiscovery)
  {
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    BOOL v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    accessoryDiscovery = self->_accessoryDiscovery;
    self->_accessoryDiscovery = v3;
    unsigned int v5 = v3;

    id v6 = [(CBAccessoryDaemon *)self description];
    [(CBDiscovery *)v5 setAppID:v6];

    [(CBDiscovery *)v5 setDiscoveryFlags:0x180000000080];
    [(CBDiscovery *)v5 setDispatchQueue:self->_dispatchQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100063A48;
    v8[3] = &unk_100997370;
    v8[4] = v5;
    v8[5] = self;
    [(CBDiscovery *)v5 setDeviceFoundHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100063A64;
    v7[3] = &unk_100997398;
    v7[4] = v5;
    v7[5] = self;
    [(CBDiscovery *)v5 activateWithCompletion:v7];
  }
}

- (void)_accessoryDiscoveryEnsureStopped
{
  if (self->_accessoryDiscovery
    && dword_1009F7F28 <= 30
    && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  [(CBDiscovery *)self->_accessoryDiscovery invalidate];
  accessoryDiscovery = self->_accessoryDiscovery;
  self->_accessoryDiscovery = 0;

  accessoryFakeDevice = self->_accessoryFakeDevice;
  self->_accessoryFakeDevice = 0;

  [(NSMutableDictionary *)self->_accessoryInfoMap enumerateKeysAndObjectsUsingBlock:&stru_100997948];
  accessoryInfoMap = self->_accessoryInfoMap;
  self->_accessoryInfoMap = 0;
}

- (void)_accessoryDiscoveryFoundDevice:(id)a3
{
  id v16 = a3;
  char v4 = [v16 identifier];
  if (v4)
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_accessoryInfoMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      unsigned int v5 = objc_alloc_init(CBAccessoryInfo);
      accessoryInfoMap = self->_accessoryInfoMap;
      if (!accessoryInfoMap)
      {
        id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v8 = self->_accessoryInfoMap;
        self->_accessoryInfoMap = v7;

        accessoryInfoMap = self->_accessoryInfoMap;
      }
      [(NSMutableDictionary *)accessoryInfoMap setObject:v5 forKeyedSubscript:v4];
    }
    [(CBAccessoryInfo *)v5 setCbDevice:v16];
    uint64_t v9 = [(CBAccessoryInfo *)v5 primaryCBDevice];
    if (!v9
      || (uint64_t v10 = (void *)v9,
          unint64_t v11 = (unint64_t)[v16 changeFlags],
          v10,
          (v11 & 0x80000000000) != 0))
    {
      unsigned int v12 = [v16 identifier];
      unsigned __int8 v13 = [(CBAccessoryDaemon *)self findPrimaryCBDevice:v12];
      [(CBAccessoryInfo *)v5 setPrimaryCBDevice:v13];
    }
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      long long v14 = v5;
      id v15 = v16;
      LogPrintF_safe();
    }
    [(CBAccessoryInfo *)v5 powerSourceUpdate];
  }
}

- (void)_connectionMonitorEnsureStarted
{
  if (!self->_connectionMonitor)
  {
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    BOOL v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    connectionMonitor = self->_connectionMonitor;
    self->_connectionMonitor = v3;
    unsigned int v5 = v3;

    id v6 = [(CBAccessoryDaemon *)self description];
    [(CBDiscovery *)v5 setAppID:v6];

    [(CBDiscovery *)v5 setDiscoveryFlags:0x80000A00000];
    [(CBDiscovery *)v5 setDispatchQueue:self->_dispatchQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100063F68;
    v9[3] = &unk_100997370;
    v9[4] = v5;
    v9[5] = self;
    [(CBDiscovery *)v5 setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100064030;
    v8[3] = &unk_100997370;
    v8[4] = v5;
    v8[5] = self;
    [(CBDiscovery *)v5 setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000640F0;
    v7[3] = &unk_100997398;
    v7[4] = v5;
    v7[5] = self;
    [(CBDiscovery *)v5 activateWithCompletion:v7];
  }
}

- (void)_connectionMonitorEnsureStopped
{
  if (self->_connectionMonitor
    && dword_1009F7F28 <= 30
    && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  [(CBDiscovery *)self->_connectionMonitor invalidate];
  connectionMonitor = self->_connectionMonitor;
  self->_connectionMonitor = 0;
}

- (void)_connectionMonitorFoundDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", [v4 productID]);
  if (([v5 flags] & 0x100000) == 0)
  {
    if (dword_1009F7F28 > 30 || dword_1009F7F28 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
LABEL_26:
    LogPrintF_safe();
    goto LABEL_17;
  }
  if (([v4 deviceFlags] & 0x40) == 0)
  {
    if (dword_1009F7F28 > 30 || dword_1009F7F28 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
  if (((unint64_t)[v4 deviceFlags] & 0x8000000000) != 0)
  {
    if (dword_1009F7F28 > 30 || dword_1009F7F28 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
  id v6 = [v4 findMyCaseIdentifier];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_connectionMap objectForKeyedSubscript:v6];
    if (v7)
    {
      if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    else
    {
      CFDictionaryGetTypeID();
      id v8 = (void *)CFPrefs_CopyTypedValue();
      CFDictionaryGetDouble();
      double v10 = v9;
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v10 < self->_prefAccessoryDaemonConnectSeconds)
      {
        if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
        {
          id v18 = CUPrintDurationDouble();
          LogPrintF_safe();
        }
      }
      else
      {
        id v12 = objc_alloc_init((Class)CBDevice);
        [v12 setIdentifier:v6];
        if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
        {
          id v17 = v12;
          LogPrintF_safe();
        }
        id v13 = objc_alloc_init((Class)CBConnection);
        [v13 setConnectionFlags:256];
        [v13 setConnectionScanDutyCycle:6];
        [v13 setDispatchQueue:self->_dispatchQueue];
        [v13 setPeerDevice:v12];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000646D4;
        v19[3] = &unk_100997970;
        v19[4] = v12;
        void v19[5] = v13;
        v19[6] = self;
        v19[7] = v6;
        v19[8] = v8;
        *(double *)&v19[9] = Current;
        [v13 activateWithCompletion:v19];
        connectionMap = self->_connectionMap;
        if (!connectionMap)
        {
          id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v16 = self->_connectionMap;
          self->_connectionMap = v15;

          connectionMap = self->_connectionMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](connectionMap, "setObject:forKeyedSubscript:", v13, v6, v17);
      }
    }
  }
  else if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

LABEL_17:
}

- (void)_connectionMonitorUpdate
{
  double Current = CFAbsoluteTimeGetCurrent();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = [(NSMutableDictionary *)self->_connectionMap allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        double v10 = [(NSMutableDictionary *)self->_connectionMap objectForKeyedSubscript:v9];
        [v10 connectedTime];
        if (v11 != 0.0 && Current - v11 >= self->_prefAccessoryDaemonStayConnectedSeconds)
        {
          if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v28 = v9;
            LogPrintF_safe();
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionMap, "setObject:forKeyedSubscript:", 0, v9, v28);
          [v10 invalidate];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }

  CFDictionaryGetTypeID();
  id v12 = (void *)CFPrefs_CopyTypedValue();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = [v12 allKeys];
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
        CFDictionaryGetDouble();
        if (Current - v20 >= self->_prefAccessoryDaemonConnectSeconds)
        {
          if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v28 = v19;
            LogPrintF_safe();
          }
          if (!v16)
          {
            id v21 = [v12 mutableCopy];
            int v22 = v21;
            if (v21) {
              id v23 = v21;
            }
            else {
              id v23 = objc_alloc_init((Class)NSMutableDictionary);
            }
            id v16 = v23;
          }
          [v16 setObject:0 forKeyedSubscript:v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }

  if ([v16 count])
  {
    CFPrefs_SetValue();
  }
  else if (v16)
  {
    CFPrefs_RemoveValue();
  }
  if ([v16 count] || -[NSMutableDictionary count](self->_connectionMap, "count"))
  {
    int v24 = self->_periodicTimer;
    if (v24)
    {
LABEL_52:

      goto LABEL_53;
    }
    if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_periodicTimer, v26);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100064D80;
    handler[3] = &unk_100997208;
    int v24 = v26;
    long long v30 = v24;
    long long v31 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v24, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)v24);
    BOOL v27 = v30;
LABEL_51:

    goto LABEL_52;
  }
  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    if (dword_1009F7F28 >= 31)
    {
      int v24 = periodicTimer;
LABEL_57:
      dispatch_source_cancel((dispatch_source_t)v24);
      BOOL v27 = self->_periodicTimer;
      self->_periodicTimer = 0;
      goto LABEL_51;
    }
    if (dword_1009F7F28 != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
    int v24 = self->_periodicTimer;
    if (v24) {
      goto LABEL_57;
    }
  }
LABEL_53:
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_periodicTimer, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_accessoryFakeDevice, 0);
  objc_storeStrong((id *)&self->_accessoryInfoMap, 0);

  objc_storeStrong((id *)&self->_accessoryDiscovery, 0);
}

@end