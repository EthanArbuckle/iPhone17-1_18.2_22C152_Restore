@interface CBStackBLEScannerBTStack
- ($F9CA75CC5B4E604BACB273E5A2091FCB)aggregateDiscoveryTypes;
- (BOOL)_addMfgScanIfNeeded:(unint64_t)a3 scanRequest:(void *)a4;
- (BOOL)screenOn;
- (NSArray)discoveryArray;
- (NSData)selfAuthTag;
- (NSData)selfAuthTagNonConnectable;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (id).cxx_construct;
- (id)_deviceFilterUUIDs:(id)a3;
- (id)_packetTypeForDiscovery:(id)a3;
- (id)_scanSummary:(void *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)devicesBufferedHandler;
- (id)invalidationHandler;
- (unint64_t)aggregateDiscoveryFlags;
- (void)_activate:(BOOL)a3;
- (void)_addBufferedTypesIfNeeded:(id *)a3 scanRequest:(void *)a4;
- (void)_addServiceUUIDsWithParametersToScanRequestIfNeeded:(void *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6;
- (void)_addTypeIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_addTypeWithParamsIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_addUUIDIfNeeded:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6;
- (void)_addUUIDIfNeededWithParams:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_advBufferDrained;
- (void)_aopBTBufferDrained;
- (void)_deviceSegmentFound:(id)a3;
- (void)_deviceSegmentLost:(id)a3;
- (void)_invalidated;
- (void)_oobKeysRemoveAll;
- (void)_oobKeysUpdate;
- (void)_proxyOOBKeysUpdateOnDeviceFound:(id)a3;
- (void)_reportAggressiveScanIfNeeded;
- (void)_rescanTimerFired;
- (void)_rescanTimerUpdate:(BOOL)a3;
- (void)_scanRequestCreate;
- (void)_sensorTrackingUpdate;
- (void)_typeToRssiThresholdUpdate;
- (void)activate;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)deviceBuffered:(id)a3;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)finishDiscovery:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)sessionHandle;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDevicesBufferedHandler:(id)a3;
- (void)setDiscoveryArray:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setSelfAuthTag:(id)a3;
- (void)setSelfAuthTagNonConnectable:(id)a3;
@end

@implementation CBStackBLEScannerBTStack

- (void)deviceFound:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_invalidateCalled)
  {
    v6 = [v4 identifier];
    if (!v6)
    {
LABEL_40:

      goto LABEL_41;
    }
    v7 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v6];
    if (v7)
    {
      uint64_t v8 = 0;
    }
    else
    {
      id v9 = objc_alloc_init((Class)CBDevice);
      [v9 setIdentifier:v6];
      [v9 setInternalFlags:[v5 internalFlags]];
      uint64_t v8 = 0x4000000;
      v7 = v9;
    }
    [v7 changedTypesRemoveAll];
    unint64_t v10 = (unint64_t)[v7 updateWithCBDevice:v5];
    unint64_t v11 = v10 | v8;
    [v7 setChangeFlags:((unint64_t)[v7 changeFlags] | v10 | v8)];
    [v7 setLastSeenTicks:mach_absolute_time()];
    unint64_t v12 = (unint64_t)[v7 discoveryFlags];
    unint64_t aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags;
    char v23 = 0;
    int v22 = 0;
    CBDiscoveryTypesAddTypes();
    if ((aggregateDiscoveryFlags & 0x7CFAA6C5B14FFFFFLL & (v12 | v10)) == 0
      && ([v7 discoveryTypesContainTypes:&v22] & 1) == 0
      && ([v7 changedTypesContainTypes:&v22] & 1) == 0)
    {
      if (dword_1009F84F0 <= 5 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
      {
        v17 = CUPrintFlags64();
        v21 = CBDiscoveryTypesToString();
        LogPrintF_safe();
      }
      goto LABEL_39;
    }
    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v16 = self->_deviceMap;
        self->_deviceMap = v15;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v7 forKeyedSubscript:v6];
      if (dword_1009F84F0 <= 20 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
      {
        v20 = v7;
        LogPrintF_safe();
      }
      if ((objc_msgSend(v7, "internalFlags", v20) & 0x4000) == 0)
      {
        id v18 = objc_retainBlock(self->_deviceFoundHandler);
        v19 = v18;
        if (v18) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
    else
    {
      if ((self->_aggregateDiscoveryFlags & (v11 | 0x100000)) == 0
        && ![v7 changedTypesContainTypes:&v22])
      {
        if (dword_1009F84F0 <= 10 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
        {
          v20 = v7;
          LogPrintF_safe();
        }
        goto LABEL_36;
      }
      if (dword_1009F84F0 <= 15 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
      {
        v20 = v7;
        LogPrintF_safe();
      }
      if ((objc_msgSend(v7, "internalFlags", v20) & 0x4000) == 0)
      {
        id v18 = objc_retainBlock(self->_deviceFoundHandler);
        v19 = v18;
        if (v18) {
LABEL_33:
        }
          (*((void (**)(id, void *))v18 + 2))(v18, v7);
LABEL_34:

LABEL_36:
        if ((objc_msgSend(v5, "internalFlags", v20) & 0x1000) != 0) {
          [(CBStackBLEScannerBTStack *)self _proxyOOBKeysUpdateOnDeviceFound:v7];
        }
        [(CBStackBLEScannerBTStack *)self _rescanTimerUpdate:0];
LABEL_39:

        goto LABEL_40;
      }
    }
    [(CBStackBLEScannerBTStack *)self _deviceSegmentFound:v7];
    goto LABEL_36;
  }
LABEL_41:
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (NSData)selfAuthTagNonConnectable
{
  return self->_selfAuthTagNonConnectable;
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)sessionHandle
{
  return self->_sessionHandle;
}

- (id)description
{
  return [(CBStackBLEScannerBTStack *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceMap count];
  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices) {
    bufferedDevices = (NSMutableArray *)[(NSMutableArray *)bufferedDevices count];
  }
  if (v4 < 0x15)
  {
    uint64_t v26 = 0;
    v27 = (id *)&v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_10004CF2C;
    v30 = sub_10004CD68;
    id v31 = 0;
    id v25 = 0;
    uint64_t v8 = "yes";
    if (!self->_screenOn) {
      uint64_t v8 = "no";
    }
    v15 = v8;
    scanSummary = self->_scanSummary;
    v14 = bufferedDevices;
    identifier = self->_identifier;
    NSAppendPrintF_safe();
    objc_storeStrong(&v31, v25);
    id v9 = v27;
    id v24 = v27[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v9 + 5, v24);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    deviceMap = self->_deviceMap;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009B8FC;
    v18[3] = &unk_100997428;
    v18[4] = &v26;
    v18[5] = &v20;
    unsigned int v19 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v18, identifier, v5, v14, v15, scanSummary);
    if ((unint64_t)v5 > v21[3])
    {
      unint64_t v11 = v27;
      id obj = v27[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v11 + 5, obj);
    }
    _Block_object_dispose(&v20, 8);
    id v7 = v27[5];
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    NSPrintF_safe();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)activate
{
}

- (void)_activate:(BOOL)a3
{
  if (!self->_deviceFoundHandler)
  {
    FatalErrorF();
    goto LABEL_24;
  }
  v3 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_24:
    FatalErrorF();
    goto LABEL_25;
  }
  if (!self->_discoveryArray)
  {
LABEL_25:
    FatalErrorF();
    goto LABEL_26;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_26:
    FatalErrorF();
    goto LABEL_27;
  }
  if (!v3->_identifier)
  {
LABEL_27:
    FatalErrorF();
    goto LABEL_28;
  }
  BOOL v4 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (v3->_invalidateCalled)
  {
LABEL_28:
    FatalErrorF();
LABEL_29:
    dispatch_once(&qword_1009F8168, &stru_100998C30);
    goto LABEL_9;
  }
  p_btSession = (unint64_t *)&v3->_btSession;
  if (v3->_btSession) {
    goto LABEL_14;
  }
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%@-0x%X", v3->_identifier, CBXPCGetNextClientID()];
  id v7 = &unk_1009F8000;
  if (qword_1009F8168 != -1) {
    goto LABEL_29;
  }
LABEL_9:
  uint64_t v9 = qword_1009F8160;
  id v10 = v5;
  sub_10004191C(__p, (char *)[v10 UTF8String]);
  sub_100009254(v9, (uint64_t)__p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  if (v7[45] != -1) {
    dispatch_once(&qword_1009F8168, &stru_100998C30);
  }
  uint64_t v11 = sub_100019C0C((void *)qword_1009F8160, *p_btSession);
  v3->_proxyoobKeysHash = 0;
  v3->_sessionHandle = (void *)v11;
  v3->_typeToRssiThresholdHash = 0;

LABEL_14:
  if (!v3->_bleScannerCPP._bleScannerObjC)
  {
    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    objc_storeStrong((id *)&v3->_bleScannerCPP._bleScannerObjC, v3);
    objc_storeStrong((id *)&v3->_bleScannerCPP._dispatchQueue, v3->_dispatchQueue);
    if (qword_1009F85C8 != -1) {
      dispatch_once(&qword_1009F85C8, &stru_100998C50);
    }
    sub_1000A7BDC((uint64_t)off_1009F85C0 + 1872, (uint64_t)&v3->_bleScannerCPP);
  }
  *(unint64_t *)((char *)&v3->_aggregateDiscoveryFlags + 5) = 0;
  v3->_unint64_t aggregateDiscoveryFlags = 0;
  [(CBStackBLEScannerBTStack *)v3 _oobKeysUpdate];
  [(CBStackBLEScannerBTStack *)v3 _sensorTrackingUpdate];
  id v12 = [(CBStackBLEScannerBTStack *)v3 _scanRequestCreate];
  BOOL scanning = v3->_scanning;
  v3->_BOOL scanning = v12 != 0;
  sessionHandle = v3->_sessionHandle;
  v15 = [(CBStackBLEScannerBTStack *)v3 _scanSummary:v12];
  objc_storeStrong((id *)&v3->_scanSummary, v15);
  v3->_scanTicks = mach_absolute_time();
  uint64_t v16 = sub_100019878();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009BD30;
  v17[3] = &unk_100998A10;
  BOOL v18 = scanning;
  BOOL v19 = v4;
  v17[4] = v15;
  v17[5] = v12;
  v17[6] = sessionHandle;
  sub_100013018(v16, v17);
  [(CBStackBLEScannerBTStack *)v3 _rescanTimerUpdate:1];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (self->_bleScannerCPP._bleScannerObjC)
    {
      if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      if (qword_1009F85C8 != -1) {
        dispatch_once(&qword_1009F85C8, &stru_100998C50);
      }
      sub_100052718((uint64_t)off_1009F85C0 + 1872, (uint64_t)&self->_bleScannerCPP);
      bleScannerObjC = self->_bleScannerCPP._bleScannerObjC;
      self->_bleScannerCPP._bleScannerObjC = 0;

      BOOL v4 = self;
      uint64_t v5 = sub_100019878();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = nullsub_82;
      v12[3] = &unk_100997450;
      v12[4] = v4;
      sub_100013018(v5, v12);
    }
    if (self->_scanning)
    {
      sessionHandle = self->_sessionHandle;
      uint64_t v7 = sub_100019878();
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10009C204;
      v11[3] = &unk_100998A38;
      v11[4] = self;
      v11[5] = sessionHandle;
      sub_100013018(v7, v11);
    }
    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      uint64_t v9 = rescanTimer;
      dispatch_source_cancel(v9);
      id v10 = self->_rescanTimer;
      self->_rescanTimer = 0;
    }
    [(CBStackBLEScannerBTStack *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_scanning && !self->_invalidateDone)
  {
    btSession = self->_btSession;
    if (btSession)
    {
      sessionHandle = self->_sessionHandle;
      uint64_t v5 = sub_100019878();
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009C4B8;
      v14[3] = &unk_100998260;
      v14[4] = sessionHandle;
      v14[5] = btSession;
      sub_100013018(v5, v14);
      self->_btSession = 0;
    }
    [(CBStackBLEScannerBTStack *)self _oobKeysRemoveAll];
    v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    self->_sessionHandle = 0;
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id devicesBufferedHandler = self->_devicesBufferedHandler;
    self->_id devicesBufferedHandler = 0;

    discoveryArray = self->_discoveryArray;
    self->_discoveryArray = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    suppressedOobKeys = self->_suppressedOobKeys;
    self->_suppressedOobKeys = 0;

    suppressedDeviceFilter = self->_suppressedDeviceFilter;
    self->_suppressedDeviceFilter = 0;

    self->_invalidateDone = 1;
    if (v6) {
      v6[2](v6);
    }
    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)deviceLost:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 UUIDString];
  uint64_t v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v4];
    if (dword_1009F84F0 <= 15 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = objc_retainBlock(self->_deviceLostHandler);
    uint64_t v7 = v6;
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v5);
    }
  }
  else if (dword_1009F84F0 <= 20 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)deviceBuffered:(id)a3
{
  id v7 = a3;
  if (!self->_invalidateCalled)
  {
    bufferedDevices = self->_bufferedDevices;
    if (!bufferedDevices)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      id v6 = self->_bufferedDevices;
      self->_bufferedDevices = v5;

      bufferedDevices = self->_bufferedDevices;
    }
    [(NSMutableArray *)bufferedDevices addObject:v7];
    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_deviceSegmentFound:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryTypesContainType:26])
  {
    if (!self->_safetyAlertsDevices)
    {
      uint64_t v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      safetyAlertsDevices = self->_safetyAlertsDevices;
      self->_safetyAlertsDevices = v5;
    }
    id v7 = [v4 safetyAlertsAlertID];
    if (v7)
    {
      unsigned int v8 = [v4 safetyAlertsVersion];
      char v25 = v8;
      if (v8)
      {
        id v9 = [v7 mutableCopy];
        [v9 appendBytes:&v25 length:1];
        id v10 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v9];

        if (!v10)
        {
          id v11 = objc_alloc_init((Class)NSMutableDictionary);
          [(NSMutableDictionary *)self->_safetyAlertsDevices setObject:v11 forKeyedSubscript:v9];
        }
        id v12 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v4 safetyAlertsSegmentSegmentNumber]);
        v13 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v9];
        [v13 setObject:v4 forKeyedSubscript:v12];

        if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v4;
          LogPrintF_safe();
        }
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_safetyAlertsDevices, "objectForKeyedSubscript:", v9, v23);
        id v15 = [v14 count];
        unsigned int v16 = [v4 safetyAlertsSegmentSegmentsTotal];

        if (v15 == (id)v16)
        {
          id v17 = objc_alloc_init((Class)CBDevice);
          BOOL v18 = [v4 identifier];
          [v17 setIdentifier:v18];

          [v17 setInternalFlags:[v4 internalFlags]];
          [v17 updateWithCBDevice:v4];
          BOOL v19 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v9];
          id v24 = 0;
          [v17 updateWithSafetyAlertsSegments:v19 error:&v24];
          id v20 = v24;

          if (v20)
          {
            if (dword_1009F84F0 <= 90 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
          }
          else
          {
            if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            id v21 = objc_retainBlock(self->_deviceFoundHandler);
            uint64_t v22 = v21;
            if (v21) {
              (*((void (**)(id, id))v21 + 2))(v21, v17);
            }
          }
        }

        goto LABEL_23;
      }
      if (dword_1009F84F0 > 90 || dword_1009F84F0 == -1 && !_LogCategory_Initialize())
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (dword_1009F84F0 > 90 || dword_1009F84F0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_23;
    }
    LogPrintF_safe();
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_deviceSegmentLost:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryTypesContainType:26])
  {
    uint64_t v5 = [v4 safetyAlertsAlertID];
    if (v5)
    {
      unsigned int v6 = [v4 safetyAlertsVersion];
      char v13 = v6;
      if (v6)
      {
        id v7 = [v5 mutableCopy];
        [v7 appendBytes:&v13 length:1];
        unsigned int v8 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v4 safetyAlertsSegmentSegmentNumber]);
        id v9 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v7];

        if (v9)
        {
          id v10 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v7];
          [v10 removeObjectForKey:v8];

          id v11 = [(NSMutableDictionary *)self->_safetyAlertsDevices objectForKeyedSubscript:v7];
          id v12 = [v11 count];

          if (!v12) {
            [(NSMutableDictionary *)self->_safetyAlertsDevices removeObjectForKey:v7];
          }
        }
      }
    }
  }
}

- (void)finishDiscovery:(id)a3 completionHandler:(id)a4
{
  unsigned int v6 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = objc_alloc_init((Class)CBDiscoverySummary);
  v6[2](v6, v5, 0);
}

- (id)_packetTypeForDiscovery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v5 = (unint64_t)[v3 discoveryFlags];
  unint64_t v6 = (unint64_t)[v3 extraDiscoveryFlags] | v5;
  if ((v6 & 0x4000000000) != 0) {
    [v4 addObject:&off_1009E0A70];
  }
  if ((v6 & 0x8000000000) != 0) {
    [v4 addObject:&off_1009E0A88];
  }
  if ((v6 & 0x800000000000000) != 0) {
    [v4 addObject:&off_1009E0AA0];
  }
  if ((v6 & 0x400000000000000) != 0) {
    [v4 addObject:&off_1009E0AB8];
  }
  if ((v6 & 0x400000) != 0) {
    [v4 addObject:&off_1009E0AD0];
  }
  if ((v6 & 0x1000000) != 0) {
    [v4 addObject:&off_1009E0AE8];
  }
  if ((v6 & 0x40) != 0) {
    [v4 addObject:&off_1009E0B00];
  }
  if ((v6 & 0x60000000000) != 0) {
    [v4 addObject:&off_1009E0B18];
  }
  if ((v6 & 0x40) != 0) {
    [v4 addObject:&off_1009E0B00];
  }
  if ((v6 & 0x40000) != 0) {
    [v4 addObject:&off_1009E0B30];
  }
  if ((v6 & 0x5030800010083E37) != 0) {
    [v4 addObject:&off_1009E0B48];
  }
  if ((v6 & 0x2000000400020108) != 0) {
    [v4 addObject:&off_1009E0B60];
  }
  if ((v6 & 0x5030800010083E37) != 0
    || [v3 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV1()])
  {
    [v4 addObject:&off_1009E0B48];
  }
  if ((v6 & 0x2000000400020108) != 0
    || [v3 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2()])
  {
    [v4 addObject:&off_1009E0B60];
  }
  int v16 = 1024;
  char v17 = 0;
  if ((v6 & 0x1C080) != 0 || [v3 discoveryTypesContainTypes:&v16]) {
    [v4 addObject:&off_1009E0B78];
  }
  int v15 = 0;
  char v14 = 0x80;
  if ([v3 discoveryTypesContainTypes:&v14]) {
    [v4 addObject:&off_1009E0B90];
  }
  int v13 = 0;
  char v12 = 2;
  if ([v3 discoveryTypesContainTypes:&v12]) {
    [v4 addObject:&off_1009E0BA8];
  }
  if ([v3 discoveryTypesContainTypes:CBDiscoveryTypesNearbyInfoV2()]) {
    [v4 addObject:&off_1009E0BC0];
  }
  int v11 = 0;
  char v10 = 32;
  if ([v3 discoveryTypesContainTypes:&v10]) {
    [v4 addObject:&off_1009E0BD8];
  }
  int v8 = 768;
  char v9 = 0;
  if ([v3 discoveryTypesContainTypes:&v8]) {
    [v4 addObject:&off_1009E0BF0];
  }

  return v4;
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sessionHandle = self->_sessionHandle;
  [(CBStackBLEScannerBTStack *)self _packetTypeForDiscovery:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) unsignedCharValue];
        uint64_t v11 = sub_100019878();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10009D3B4;
        v12[3] = &unk_100998A58;
        unsigned __int8 v13 = v10;
        v12[4] = sessionHandle;
        sub_100013018(v11, v12);
        char v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_advBufferDrained
{
  if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_aopBTBufferDrained
{
  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices)
  {
    if (dword_1009F84F0 <= 30)
    {
      if (dword_1009F84F0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_6;
        }
        bufferedDevices = self->_bufferedDevices;
      }
      [(NSMutableArray *)bufferedDevices count];
      LogPrintF_safe();
    }
LABEL_6:
    id v4 = objc_retainBlock(self->_devicesBufferedHandler);
    unint64_t v5 = v4;
    if (v4) {
      (*((void (**)(id, NSMutableArray *))v4 + 2))(v4, self->_bufferedDevices);
    }

    id v6 = self->_bufferedDevices;
    self->_bufferedDevices = 0;

    return;
  }
  if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_oobKeysUpdate
{
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = self->_discoveryArray;
  id v52 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v52)
  {
    id v58 = 0;
    v2 = 0;
    int64_t v55 = 0;
    v56 = 0;
    int v54 = 0;
    int v57 = 0;
    uint64_t v51 = *(void *)v82;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        v60 = v2;
        if (*(void *)v82 != v51) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        [v3 oobKeys:v46];
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        id v4 = [v59 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v4)
        {
          uint64_t v62 = *(void *)v78;
          do
          {
            for (j = 0; j != v4; j = (char *)j + 1)
            {
              if (*(void *)v78 != v62) {
                objc_enumerationMutation(v59);
              }
              id v6 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
              unsigned int v7 = [v6 btAddressType:v46, v47, v48];
              unsigned int v8 = [v6 addressType];
              id v9 = [v6 btAddressData];
              if ([v9 length] == (id)6 || objc_msgSend(v9, "length") == (id)7)
              {
                unsigned int v10 = v8 | v7;
                if (v10)
                {
                  LOBYTE(v73) = v10;
                  id v11 = v9;
                  char v12 = v11;
                  if (v11)
                  {
                    if ([v11 length] == (id)7 || v10 > 1 || objc_msgSend(v12, "length") != (id)6)
                    {
                      id v9 = v12;
                    }
                    else
                    {
                      unsigned __int8 v13 = +[NSMutableData dataWithBytes:&v73 length:1];
                      [v13 appendBytes:[v12 bytes] length:6];
                      id v9 = [v13 copy];
                    }
                  }
                  else
                  {
                    id v9 = 0;
                  }
                }
                if ([v9 length] == (id)7)
                {
                  [v9 subdataWithRange:1, 6];
                  id v14 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v14 = v9;
                }
                long long v15 = v14;
                long long v16 = [v6 irkData];
                if ([v16 length] == (id)16)
                {
                  id v17 = [v6 keyType];
                  int v18 = (int)v17;
                  if (v17)
                  {
                    if (v17 == 255)
                    {
                      if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                      {
                        BOOL v19 = CUPrintNSDataAddress();
                        id v20 = CUPrintNSObjectMasked();
                        CUPrintFlags32();
                        v48 = v47 = v20;
                        v46 = v19;
                        LogPrintF_safe();
                      }
                    }
                    else
                    {
                      uint64_t v22 = +[NSNumber numberWithUnsignedInt:v17];
                      id v23 = v58;
                      if (!v58) {
                        id v23 = objc_alloc_init((Class)NSMutableDictionary);
                      }
                      id v58 = v23;
                      id v24 = [v23 objectForKeyedSubscript:v22];
                      BOOL v25 = v24 == 0;

                      if (v25)
                      {
                        id v26 = objc_alloc_init((Class)NSMutableArray);
                        [v58 setObject:v26 forKeyedSubscript:v22];
                      }
                      id v27 = v60;
                      if (!v60) {
                        id v27 = objc_alloc_init((Class)NSMutableDictionary);
                      }
                      v60 = v27;
                      uint64_t v28 = [v27 objectForKeyedSubscript:v22];
                      BOOL v29 = v28 == 0;

                      if (v29)
                      {
                        id v30 = objc_alloc_init((Class)NSMutableOrderedSet);
                        [v60 setObject:v30 forKeyedSubscript:v22];
                      }
                      id v31 = [v60 objectForKeyedSubscript:v22];
                      id v32 = [v31 count];

                      v33 = [v60 objectForKeyedSubscript:v22];
                      [v33 addObject:v16];

                      v34 = [v60 objectForKeyedSubscript:v22];
                      LODWORD(v32) = v32 == [v34 count];

                      if (v32)
                      {
                        if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                        {
                          v35 = CUPrintNSObjectMasked();
                          v36 = CUPrintNSDataAddress();
                          CUPrintFlags32();
                          v48 = v47 = v36;
                          v46 = v35;
                          LogPrintF_safe();
                        }
                      }
                      else if (v18 == 1 {
                             && ([v58 objectForKeyedSubscript:v22],
                      }
                                 v38 = objc_claimAutoreleasedReturnValue(),
                                 [v38 addObject:v6],
                                 v38,
                                 ++v54,
                                 dword_1009F84F0 <= 20)
                             && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                      {
                        v39 = CUPrintNSDataAddress();
                        v40 = CUPrintNSObjectMasked();
                        CUPrintFlags32();
                        v48 = v47 = v40;
                        LogPrintF_safe();

                        v55 ^= (unint64_t)[v6 hash:v39];
                      }
                      else
                      {
                        v55 ^= (unint64_t)[v6 hash:v46];
                      }
                    }
                  }
                  else if (v57 < 10)
                  {
                    id v37 = v56;
                    if (!v56) {
                      id v37 = objc_alloc_init((Class)NSMutableDictionary);
                    }
                    v56 = v37;
                    [v37 setObject:v16 forKeyedSubscript:v9];
                    ++v57;
                  }
                  else if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                  {
                    id v21 = CUPrintNSDataAddress();
                    CUPrintNSObjectMasked();
                    v47 = v46 = v21;
                    LogPrintF_safe();
                  }
                }
              }
            }
            id v4 = [v59 countByEnumeratingWithState:&v77 objects:v85 count:16];
          }
          while (v4);
        }

        v2 = v60;
      }
      id v52 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v52);
  }
  else
  {
    id v58 = 0;
    v2 = 0;
    int64_t v55 = 0;
    v56 = 0;
    int v54 = 0;
  }
  v61 = v2;

  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  int v76 = 0;
  oobKeyMap = self->_oobKeyMap;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10009E2A4;
  v70[3] = &unk_100998AA8;
  v42 = v56;
  v71 = v42;
  v72 = &v73;
  [(NSMutableDictionary *)oobKeyMap enumerateKeysAndObjectsUsingBlock:v70];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  int v69 = 0;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10009E83C;
  v65[3] = &unk_100998AA8;
  v65[4] = self;
  v65[5] = &v66;
  [(NSMutableDictionary *)v42 enumerateKeysAndObjectsUsingBlock:v65];
  if (v55 != self->_proxyoobKeysHash)
  {
    if (!v58) {
      id v58 = objc_alloc_init((Class)NSMutableDictionary);
    }
    uint64_t v43 = sub_1004AFCFC();
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10009EDFC;
    v63[3] = &unk_100997450;
    id v58 = v58;
    id v64 = v58;
    sub_100013018(v43, v63);
  }
  if (*((_DWORD *)v67 + 6) || *((_DWORD *)v74 + 6) || v55 != self->_proxyoobKeysHash)
  {
    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableDictionary *)self->_oobKeyMap count];
      [(NSMutableDictionary *)v42 count];
      LogPrintF_safe();
    }
    if (v54 && dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_87;
    }
  }
  else if (dword_1009F84F0 <= 10 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)v42 count];
LABEL_87:
    LogPrintF_safe();
  }
  v44 = self->_oobKeyMap;
  self->_oobKeyMap = v42;
  v45 = v42;

  self->_proxyoobKeysHash = v55;
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v73, 8);
}

- (void)_oobKeysRemoveAll
{
  [(NSMutableDictionary *)self->_oobKeyMap enumerateKeysAndObjectsUsingBlock:&stru_100998AE8];
  oobKeyMap = self->_oobKeyMap;
  self->_oobKeyMap = 0;

  if (qword_1009F85E8 != -1) {
    dispatch_once(&qword_1009F85E8, &stru_100998CD0);
  }
  uint64_t v4 = qword_1009F85E0;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  sub_1003C4920(v4, v5);

  self->_proxyoobKeysHash = 0;
}

- (void)_proxyOOBKeysUpdateOnDeviceFound:(id)a3
{
  id v13 = a3;
  long long v15 = [v13 nearbyActionNoWakeAuthTagData];
  long long v16 = [v13 btAddressData];
  uint64_t v4 = sub_10003FB34();
  char v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 2368))(v4);
  if (v16) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if ((v6 & 1) != 0 && ([v13 nearbyActionNoWakeType] & 1) != 0 && v15)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_10004CF2C;
    v28[4] = sub_10004CD68;
    id v29 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = self->_discoveryArray;
    id v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v18 = 0;
          BOOL v19 = &v18;
          uint64_t v20 = 0x3032000000;
          id v21 = sub_10004CF2C;
          uint64_t v22 = sub_10004CD68;
          id v23 = 0;
          id v11 = [v10 oobKeys:v12];
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10009F73C;
          v17[3] = &unk_100998B10;
          v17[4] = v16;
          v17[5] = v15;
          void v17[7] = v28;
          v17[8] = &v18;
          v17[6] = v10;
          [v11 enumerateObjectsUsingBlock:v17];

          if (v19[5])
          {
            [v10 setOobKeys:];
            if (dword_1009F84F0 <= 20 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
            {
              char v12 = [v10 oobKeys];
              LogPrintF_safe();
            }
          }
          _Block_object_dispose(&v18, 8);
        }
        id v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(v28, 8);
  }
}

- (void)_rescanTimerFired
{
  if (dword_1009F84F0 <= 15 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    id v12 = [(NSMutableDictionary *)self->_deviceMap count];
    LogPrintF_safe();
  }
  id v3 = (void (**)(id, void *))objc_retainBlock(self->_deviceLostHandler);
  unint64_t scanTicks = self->_scanTicks;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(NSMutableDictionary *)self->_deviceMap allKeys];
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v7);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v8, v12);
        if ((unint64_t)[v9 lastSeenTicks] < scanTicks)
        {
          if (((unint64_t)[v9 discoveryFlags] & 0x1400000) == 0) {
            goto LABEL_19;
          }
          id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
          if (!v10) {
            goto LABEL_19;
          }
          if (qword_1009F7EC0 != -1) {
            dispatch_once(&qword_1009F7EC0, &stru_100998CF0);
          }
          uint64_t v11 = (uint64_t)off_1009F7EB8;
          sub_1000305AC(v19, v10);
          LOBYTE(v11) = sub_1000307A4(v11, v19);

          if (v11)
          {
            if (dword_1009F84F0 <= 20 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
            {
              id v12 = v9;
              LogPrintF_safe();
            }
            [v9 setLastSeenTicks:mach_absolute_time()];
          }
          else
          {
LABEL_19:
            [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v8];
            if (dword_1009F84F0 <= 20 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
            {
              mach_absolute_time();
              [v9 lastSeenTicks];
              UpTicksToSeconds();
              CUPrintDuration64();
              v13 = id v12 = v9;
              LogPrintF_safe();
            }
            if ((objc_msgSend(v9, "internalFlags", v12, v13) & 0x4000) != 0) {
              [(CBStackBLEScannerBTStack *)self _deviceSegmentLost:v9];
            }
            if (v3) {
              v3[2](v3, v9);
            }
          }
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v5);
  }

  [(CBStackBLEScannerBTStack *)self _activate:1];
}

- (void)_rescanTimerUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceMap count];
  p_rescanTimer = &self->_rescanTimer;
  rescanTimer = self->_rescanTimer;
  if (v5)
  {
    uint64_t v8 = rescanTimer;
    if (v8)
    {
      id v9 = v8;
      if (v3) {
        CUDispatchTimerSet();
      }
    }
    else
    {
      dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_rescanTimer, v11);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000A0084;
      handler[3] = &unk_100998510;
      id v9 = v11;
      id v14 = v9;
      long long v15 = self;
      dispatch_source_set_event_handler(v9, handler);
      CUDispatchTimerSet();
      dispatch_activate(v9);
    }
  }
  else if (rescanTimer)
  {
    id v12 = rescanTimer;
    dispatch_source_cancel(v12);
    id v10 = *p_rescanTimer;
    *p_rescanTimer = 0;
  }
}

- (void)_scanRequestCreate
{
}

- (void)_typeToRssiThresholdUpdate
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v23 = self;
  id obj = self->_discoveryArray;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v4)
  {
    int64_t v5 = 0;
    uint64_t v25 = *(void *)v35;
    id v26 = v4;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v7 = [v6 typeToRssiThresholds];
        if (v7)
        {
          id v8 = v6;
          BOOL v9 = *((char *)[v8 discoveryTypesInternalPtr] + 3) >= 0;

          if (!v9)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v10 = [v8 typeToRssiThresholds];
            id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v31;
              do
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v31 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  id v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                  long long v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 applePayloadType]);
                  long long v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 rssiThreshold]);
                  [v3 setObject:v16 forKey:v15];
                  unint64_t v17 = (unint64_t)[v14 hash];

                  v5 ^= v17;
                }
                id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
              }
              while (v11);
            }
          }
        }
      }
      id v26 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v26);
  }
  else
  {
    int64_t v5 = 0;
  }

  if (self->_typeToRssiThresholdHash != v5)
  {
    v40[1] = @"descriptor";
    v41[0] = &off_1009E0C08;
    v40[0] = @"type";
    CFStringRef v38 = @"TypeToRssiThresholdMapping";
    id v18 = [v3 copy];
    id v39 = v18;
    BOOL v19 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v41[1] = v19;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

    if (dword_1009F84F0 <= 40 && (dword_1009F84F0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v21 = sub_1004AFCFC();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000A0F24;
    v28[3] = &unk_100997450;
    id v22 = v20;
    id v29 = v22;
    sub_100013018(v21, v28);
    v23->_typeToRssiThresholdHash = v5;
  }
}

- (BOOL)_addMfgScanIfNeeded:(unint64_t)a3 scanRequest:(void *)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_discoveryArray;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = (unint64_t)[v10 discoveryFlags:v15];
        unint64_t v12 = (unint64_t)[v10 extraDiscoveryFlags] | v11;
        if ((v12 & a3) != 0)
        {
          self->_aggregateDiscoveryFlags |= v12;
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)_addTypeIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  unsigned int v126 = a3;
  if (a5) {
    BOOL v125 = (a5->var0[4] & 0x80u) != 0;
  }
  else {
    BOOL v125 = 0;
  }
  int v8 = a3;
  BOOL v9 = "Invalid";
  switch(v126)
  {
    case 0u:
      break;
    case 1u:
      BOOL v9 = "Hash";
      break;
    case 2u:
      BOOL v9 = "iBeacon";
      break;
    case 3u:
      BOOL v9 = "AirPrint";
      break;
    case 4u:
      BOOL v9 = "LegacyATVSetup";
      break;
    case 5u:
      BOOL v9 = "AirDrop";
      break;
    case 6u:
      BOOL v9 = "HomeKitV1";
      break;
    case 7u:
      BOOL v9 = "ProxPairing";
      break;
    case 8u:
      BOOL v9 = "HeySiri";
      break;
    case 9u:
      BOOL v9 = "AirPlayTarget";
      break;
    case 0xAu:
      BOOL v9 = "AirPlaySource";
      break;
    case 0xBu:
      BOOL v9 = "MagicSwitch";
      break;
    case 0xCu:
      BOOL v9 = "Continuity";
      break;
    case 0xDu:
      BOOL v9 = "TetheringTarget";
      break;
    case 0xEu:
      BOOL v9 = "TetheringSource";
      break;
    case 0xFu:
      BOOL v9 = "NearbyAction";
      break;
    case 0x10u:
      BOOL v9 = "NearbyInfo";
      break;
    case 0x11u:
      BOOL v9 = "HomeKitV2";
      break;
    case 0x12u:
      BOOL v9 = "ObjectDiscovery";
      break;
    case 0x13u:
      BOOL v9 = "SpatialInteraction";
      break;
    case 0x14u:
      BOOL v9 = "DCKit";
      break;
    case 0x15u:
      BOOL v9 = "NearbyActionV2";
      break;
    case 0x16u:
      BOOL v9 = "NearbyInfoV2";
      break;
    case 0x17u:
    case 0x19u:
      goto LABEL_8;
    case 0x18u:
      BOOL v9 = "DSInfo";
      break;
    case 0x1Au:
      BOOL v9 = "NearbyActionNoWake";
      break;
    default:
      if (v8 == 100) {
        BOOL v9 = "FastLEConnection";
      }
      else {
LABEL_8:
      }
        BOOL v9 = "?";
      break;
  }
  v124 = +[NSString stringWithCString:v9 encoding:4];
  uint64_t v10 = sub_100017768();
  int v118 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 888))(v10);
  uint64_t __dst = 0;
  v155[0] = 0;
  *(void *)((char *)v155 + 6) = 0;
  uint64_t v152 = 0;
  v153[0] = 0;
  *(void *)((char *)v153 + 6) = 0;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id obj = self->_discoveryArray;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v146 objects:v151 count:16];
  if (v11)
  {
    BOOL v12 = 0;
    uint64_t v123 = 0;
    char v127 = 0;
    int v128 = 0;
    v115 = 0;
    v113 = 0;
    char v112 = 0;
    uint64_t v119 = 0;
    id v132 = *(id *)v147;
    v130 = 0;
    BOOL v14 = (a4 & 0x40000) == 0 || v126 != 19;
    BOOL v116 = v14;
    char v117 = 1;
    BOOL v129 = 1;
    BOOL v120 = 0;
    char v121 = 1;
    do
    {
      id v136 = v11;
      for (i = 0; i != v136; i = (char *)i + 1)
      {
        if (*(id *)v147 != v132) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        unint64_t v17 = (unint64_t)[v16 discoveryFlags];
        unint64_t v18 = (unint64_t)[v16 extraDiscoveryFlags] | v17;
        unsigned int v19 = (v18 & a4) != 0;
        if (a5 && (v18 & a4) == 0) {
          unsigned int v19 = [v16 discoveryTypesContainTypes:a5];
        }
        if (v19)
        {
          self->_aggregateDiscoveryFlags |= v18;
          if (a5)
          {
            [v16 discoveryTypesInternalPtr];
            CBDiscoveryTypesAddTypes();
          }
          if ((v18 & 0x100000000000) == 0)
          {
            id v20 = v16;
            int v21 = *((char *)[v20 discoveryTypesInternalPtr] + 4);
            if (((v125 ^ (v21 < 0)) & 1) == 0)
            {
              switch(v126)
              {
                case 0xFu:
                  if ((v18 & 0x2000000) != 0)
                  {
                    if (v112)
                    {
                      char v112 = 1;
                    }
                    else
                    {
                      id v63 = v20;
                      if ((*(unsigned char *)[v63 discoveryTypesInternalPtr] & 4) != 0)
                      {
                        id v64 = [v63 deviceFilter];
                        uint64_t v65 = [(CBStackBLEScannerBTStack *)self _deviceFilterUUIDs:v64];

                        char v112 = 1;
                        v130 = (void *)v65;
                      }
                      else
                      {
                        char v112 = 0;
                      }
                    }
                    if (!v113)
                    {
                      if ((id)[(NSData *)self->_selfAuthTagNonConnectable length] == (id)3
                        && (*((unsigned char *)[v20 discoveryTypesInternalPtr] + 1) & 0x40) != 0)
                      {
                        v113 = self->_selfAuthTagNonConnectable;
                      }
                      else
                      {
                        v113 = 0;
                      }
                    }
                  }
                  goto LABEL_92;
                case 0x13u:
                  unsigned int v22 = [v20 bleRSSIThresholdOrder];
                  BOOL v120 = (char)[v20 bleRSSIThresholdOrder] < 0;
                  id v23 = [v20 spatialInteractionfilter];
                  BOOL v24 = v23 == 0;

                  HIDWORD(v119) = (v22 >> 2) & 1;
                  if (!v24)
                  {
                    for (uint64_t j = 0; j != 22; ++j)
                      *((unsigned char *)&v155[-1] + j) = 0;
                    for (uint64_t k = 0; k != 22; ++k)
                      *((unsigned char *)&v153[-1] + k) = 0;
                    long long v27 = [v20 spatialInteractionfilter];
                    id v114 = [v27 blob];

                    uint64_t v28 = [v20 spatialInteractionfilter];
                    id v29 = [v28 mask];

                    id v30 = v114;
                    memcpy(&__dst, [v30 bytes], (size_t)[v30 length]);
                    id v31 = v29;
                    memcpy(&v152, [v31 bytes], (size_t)[v31 length]);
                  }
                  goto LABEL_92;
                case 0x15u:
                  if ((v18 & 0x2000000400020108) == 0
                    && ![v20 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2()])
                  {
                    goto LABEL_92;
                  }
                  if (v115) {
                    continue;
                  }
                  if ((id)[(NSData *)self->_selfAuthTag length] == (id)3)
                  {
                    v115 = self->_selfAuthTag;
                    goto LABEL_92;
                  }
                  v115 = 0;
                  continue;
                case 0x16u:
                  id v32 = v20;
                  char v33 = *((unsigned char *)[v32 discoveryTypesInternalPtr] + 2);
                  id v34 = v32;
                  LOBYTE(v119) = ((v33 & 0x40 | *(unsigned char *)[v34 discoveryTypesInternalPtr] & 0x10) != 0) | v119;
                  if ((self->_aggregateDiscoveryFlags & 0x40000) != 0)
                  {
                    v48 = [v34 oobKeys];
                    BOOL v49 = v48 == 0;

                    if (v49) {
                      goto LABEL_92;
                    }
                    if (!self->_suppressedOobKeys)
                    {
                      v50 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                      suppressedOobKeys = self->_suppressedOobKeys;
                      self->_suppressedOobKeys = v50;

                      id v52 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                      suppressedDeviceFilter = self->_suppressedDeviceFilter;
                      self->_suppressedDeviceFilter = v52;
                    }
                    int v54 = [v34 oobKeys];
                    int64_t v55 = self->_suppressedOobKeys;
                    v56 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                    [(NSMutableDictionary *)v55 setObject:v54 forKeyedSubscript:v56];

                    int v57 = [v34 deviceFilter];
                    id v58 = self->_suppressedDeviceFilter;
                    id v59 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                    [(NSMutableDictionary *)v58 setObject:v57 forKeyedSubscript:v59];

                    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                    {
                      v60 = [v34 oobKeys];
                      id v61 = [v60 count];
                      uint64_t v62 = [v34 deviceFilter];
                      id v110 = v61;
                      id v111 = [v62 count];
                      LogPrintF_safe();
                    }
                    [v34 setOobKeys:0, v110, v111];
                    [v34 setDeviceFilter:0];
                    goto LABEL_91;
                  }
                  long long v35 = self->_suppressedOobKeys;
                  if (v35)
                  {
                    long long v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                    long long v37 = [(NSMutableDictionary *)v35 objectForKeyedSubscript:v36];
                    BOOL v38 = v37 == 0;

                    if (!v38)
                    {
                      id v39 = self->_suppressedOobKeys;
                      v40 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                      v41 = [(NSMutableDictionary *)v39 objectForKeyedSubscript:v40];
                      [v34 setOobKeys:v41];

                      v42 = self->_suppressedDeviceFilter;
                      uint64_t v43 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                      v44 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v43];
                      [v34 setDeviceFilter:v44];

                      if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                      {
                        v45 = [v34 oobKeys];
                        id v46 = [v45 count];
                        v47 = [v34 deviceFilter];
                        id v110 = v46;
                        id v111 = [v47 count];
                        LogPrintF_safe();
                      }
                      uint64_t v66 = self->_suppressedOobKeys;
                      v67 = [NSNumber numberWithUnsignedInt:[v34 useCase:v110, v111]];
                      [(NSMutableDictionary *)v66 setObject:0 forKeyedSubscript:v67];

                      uint64_t v68 = self->_suppressedDeviceFilter;
                      int v69 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 useCase]);
                      [(NSMutableDictionary *)v68 setObject:0 forKeyedSubscript:v69];

LABEL_91:
                      [(CBStackBLEScannerBTStack *)self _oobKeysUpdate];
                    }
                  }
LABEL_92:
                  if ((v18 & 0x2000000000) != 0) {
                    self->_anyActiveScauint64_t n = 1;
                  }
                  if (v129)
                  {
                    BOOL v129 = ((unint64_t)[v20 discoveryFlags] & 0x200000000) == 0;
                    if ((v18 & 0x40000) != 0) {
                      goto LABEL_99;
                    }
                  }
                  else
                  {
                    BOOL v129 = 0;
                    if ((v18 & 0x40000) != 0) {
                      goto LABEL_99;
                    }
                  }
                  if (![v20 discoveryTypesContainTypes:CBDiscoveryTypesNeedsObjectLocator()])goto LABEL_106; {
LABEL_99:
                  }
                  if (v126 != 26)
                  {
                    if (!v116) {
                      BYTE4(v123) |= (int)[v20 bleRSSIThresholdHint] < 0;
                    }
                    goto LABEL_105;
                  }
                  uint64_t v70 = sub_100017768();
                  BYTE4(v123) = (*(uint64_t (**)(uint64_t))(*(void *)v70 + 896))(v70);
                  uint64_t v71 = sub_100017768();
                  char v121 = (*(uint64_t (**)(uint64_t))(*(void *)v71 + 896))(v71);
                  v72 = [v20 discoveryTypesInternalPtr];
                  LOBYTE(v123) = 1;
                  if (v18 & 0x200000000) != 0 && (v72[1])
                  {
                    self->_aopBTTypes |= 0x100u;
LABEL_105:
                    LOBYTE(v123) = 1;
                  }
LABEL_106:
                  if ((v18 & 0x100000000000000) != 0)
                  {
                    self->_objectDiscoveryFlags |= 2u;
                    if ((v18 & 0x200000000000000) == 0)
                    {
LABEL_108:
                      if ((v18 & 0x10000000000) == 0) {
                        goto LABEL_110;
                      }
LABEL_109:
                      self->_anyRangeScauint64_t n = 1;
                      goto LABEL_110;
                    }
                  }
                  else if ((v18 & 0x200000000000000) == 0)
                  {
                    goto LABEL_108;
                  }
                  self->_objectDiscoveryFlags |= 1u;
                  if ((v18 & 0x10000000000) != 0) {
                    goto LABEL_109;
                  }
LABEL_110:
                  int v73 = [v20 bleRSSIThresholdHint];
                  if ((v123 & 0x100000000) != 0) {
                    int v74 = -120;
                  }
                  else {
                    int v74 = -90;
                  }
                  if (v74 <= (v73 & (v73 >> 31))) {
                    int v74 = v73 & (v73 >> 31);
                  }
                  BOOL v75 = v74 == 0;
                  int v76 = v128;
                  if (v74 < (char)v128) {
                    int v76 = v74;
                  }
                  int v128 = v76;
                  signed int v77 = [v20 bleScanRateOverride];
                  if (!v77 && (self->_screenOn || (signed int v77 = [v20 bleScanRateScreenOff]) == 0))
                  {
                    signed int v77 = [v20 bleScanRate];
                    if (!v77) {
                      self->_scanRateAnyDefault = 1;
                    }
                  }
                  if (v77 > self->_scanRateHighest) {
                    self->_scanRateHighest = v77;
                  }
                  v127 |= v75;
                  if (v21 < 0)
                  {
                    v144 = 0;
                    v145 = 0;
                    sub_1000335D8(&v144, &__dst, 0x16uLL);
                    v142 = 0;
                    v143 = 0;
                    sub_1000335D8(&v142, &v152, 0x16uLL);
                    if ([v130 count]) {
                      char v78 = 3;
                    }
                    else {
                      char v78 = 2;
                    }
                    char v79 = v128;
                    if (v127) {
                      char v79 = -90;
                    }
                    if (v118) {
                      char v80 = -120;
                    }
                    else {
                      char v80 = v79;
                    }
                    char targetCore = self->_targetCore;
                    if (v123)
                    {
                      uint64_t v82 = sub_10003FB34();
                      char v83 = (*(uint64_t (**)(uint64_t))(*(void *)v82 + 2336))(v82);
                    }
                    else
                    {
                      char v83 = 0;
                    }
                    sub_1000364C4((uint64_t)a6, v124, v126, v78, (uint64_t)&v144, (uint64_t)&v142, v80, 0, !v129, targetCore, 1, v130, v83, 0, v120, BYTE4(v119) & 1, v121 & 1, 0, 0xFFFF,
                      0xFFFF,
                      0xFFFF);
                    for (uint64_t m = 0; m != 22; ++m)
                      *((unsigned char *)&v155[-1] + m) = 0;
                    for (uint64_t n = 0; n != 22; ++n)
                      *((unsigned char *)&v153[-1] + n) = 0;
                    v142 = &off_100998428;
                    if (v143) {
                      sub_1000368F4(v143);
                    }
                    v144 = &off_100998428;
                    if (v145) {
                      sub_1000368F4(v145);
                    }
                    char v117 = 0;
                  }
                  BOOL v12 = v21 >= 0;
                  break;
                default:
                  goto LABEL_92;
              }
            }
          }
        }
      }
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v146 objects:v151 count:16];
    }
    while (v11);

    if (v12)
    {
      if (v123)
      {
        uint64_t v86 = sub_10003FB34();
        char v135 = (*(uint64_t (**)(uint64_t))(*(void *)v86 + 2336))(v86);
      }
      else
      {
        char v135 = 0;
      }
      char v137 = !v129;
      if ((self->_aggregateDiscoveryTypes.bitArray[1] & 0x40) != 0 && !self->_screenOn && v113)
      {

        BYTE1(__dst) = 56;
        BYTE5(__dst) = 2;
        BYTE1(v152) = 56;
        BYTE5(v152) = 2;
        NSUInteger v88 = [(NSData *)v113 length];
        memcpy((char *)&__dst + 6, [(NSData *)v113 bytes], v88);
        if (v88) {
          memset((char *)&v152 + 6, 255, v88);
        }
        v144 = 0;
        v145 = 0;
        sub_1000335D8(&v144, &__dst, 0x16uLL);
        v142 = 0;
        v143 = 0;
        sub_1000335D8(&v142, &v152, 0x16uLL);
        id v89 = [v130 count];
        if (v127) {
          char v90 = -90;
        }
        else {
          char v90 = v128;
        }
        if (v118) {
          char v90 = -120;
        }
        if (v89) {
          char v91 = 3;
        }
        else {
          char v91 = 2;
        }
        sub_1000364C4((uint64_t)a6, @"AcceptedInvitation", v126, v91, (uint64_t)&v144, (uint64_t)&v142, v90, 0, v137, self->_targetCore, 1, 0, v135, 0, 0, 0, 1, 0, 0xFFFF,
          0xFFFF,
          0xFFFF);
        for (uint64_t ii = 0; ii != 22; ++ii)
          *((unsigned char *)&v155[-1] + ii) = 0;
        for (juint64_t j = 0; jj != 22; ++jj)
          *((unsigned char *)&v153[-1] + jj) = 0;
        v142 = &off_100998428;
        if (v143) {
          sub_1000368F4(v143);
        }
        v144 = &off_100998428;
        if (v145) {
          sub_1000368F4(v145);
        }
        char v117 = 0;
        v124 = @"AcceptedInvitation";
      }
      if (v126 == 22)
      {
        if (v119)
        {

          v144 = 0;
          v145 = 0;
          sub_1000335D8(&v144, &__dst, 0x16uLL);
          v142 = 0;
          v143 = 0;
          sub_1000335D8(&v142, &v152, 0x16uLL);
          if (v127) {
            char v94 = -90;
          }
          else {
            char v94 = v128;
          }
          if (v118) {
            char v94 = -120;
          }
          sub_1000364C4((uint64_t)a6, @"NearbyInfoV2", 0x16u, 2, (uint64_t)&v144, (uint64_t)&v142, v94, 0, v137, self->_targetCore, 1, 0, v135, v117 & 1, 0, 0, 1, 0, 0xFFFF,
            0xFFFF,
            0xFFFF);
          v142 = &off_100998428;
          if (v143) {
            sub_1000368F4(v143);
          }
          v144 = &off_100998428;
          if (v145) {
            sub_1000368F4(v145);
          }
          v124 = @"NearbyInfoV2";
        }
        else
        {
          long long v140 = 0u;
          long long v141 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          v133 = self->_discoveryArray;
          id v96 = [(NSArray *)v133 countByEnumeratingWithState:&v138 objects:v150 count:16];
          if (v96)
          {
            if ((v123 & 0x100000000) != 0) {
              int v97 = -120;
            }
            else {
              int v97 = -90;
            }
            uint64_t v98 = *(void *)v139;
            do
            {
              for (kuint64_t k = 0; kk != v96; kuint64_t k = (char *)kk + 1)
              {
                if (*(void *)v139 != v98) {
                  objc_enumerationMutation(v133);
                }
                v100 = *(void **)(*((void *)&v138 + 1) + 8 * (void)kk);
                if ((int)[v100 bleRSSIThresholdHint] > 0
                  || (char v101 = v97, v97 <= (int)[v100 bleRSSIThresholdHint]))
                {
                  if ((int)[v100 bleRSSIThresholdHint] > 0
                    || (v102 = [v100 bleRSSIThresholdHint], char v101 = v102, !v102))
                  {
                    char v101 = -90;
                  }
                }
                v103 = [v100 deviceFilter];
                v104 = [(CBStackBLEScannerBTStack *)self _deviceFilterUUIDs:v103];

                v130 = v104;
                if ([v104 count]) {
                  char v105 = 3;
                }
                else {
                  char v105 = 2;
                }
                id v106 = v100;
                if ((*((unsigned char *)[v106 discoveryTypesInternalPtr] + 2) & 0x20) != 0)
                {

                  bzero(&__dst, 0x16uLL);
                  bzero(&v152, 0x16uLL);
                  v144 = 0;
                  v145 = 0;
                  sub_1000335D8(&v144, &__dst, 0x16uLL);
                  v142 = 0;
                  v143 = 0;
                  sub_1000335D8(&v142, &v152, 0x16uLL);
                  sub_1000364C4((uint64_t)a6, @"MiLo", 0x16u, v105, (uint64_t)&v144, (uint64_t)&v142, v101, 0, v137, self->_targetCore, 1, v104, v135, 0, 0, 0, 1, 0, 0xFFFF,
                    0xFFFF,
                    0xFFFF);
                  v142 = &off_100998428;
                  if (v143) {
                    sub_1000368F4(v143);
                  }
                  v144 = &off_100998428;
                  if (v145) {
                    sub_1000368F4(v145);
                  }
                  v124 = @"MiLo";
                }
                if ((*((unsigned char *)[v106 discoveryTypesInternalPtr] + 2) & 8) != 0)
                {

                  LOBYTE(__dst) = 4;
                  LOBYTE(v152) = 4;
                  v144 = 0;
                  v145 = 0;
                  sub_1000335D8(&v144, &__dst, 0x16uLL);
                  v142 = 0;
                  v143 = 0;
                  sub_1000335D8(&v142, &v152, 0x16uLL);
                  sub_1000364C4((uint64_t)a6, @"Invitation", 0x16u, v105, (uint64_t)&v144, (uint64_t)&v142, v101, 0, v137, self->_targetCore, 1, v104, v135, 0, 0, 0, 1, 0, 0xFFFF,
                    0xFFFF,
                    0xFFFF);
                  v142 = &off_100998428;
                  if (v143) {
                    sub_1000368F4(v143);
                  }
                  v144 = &off_100998428;
                  if (v145) {
                    sub_1000368F4(v145);
                  }
                  v124 = @"Invitation";
                }
              }
              id v96 = [(NSArray *)v133 countByEnumeratingWithState:&v138 objects:v150 count:16];
            }
            while (v96);
          }
        }
      }
      else
      {
        if ((v112 & 1) != 0 && !self->_screenOn)
        {

          char v117 = 0;
          LOWORD(__dst) = 14080;
          LOWORD(v152) = 14080;
          v124 = @"AUAction";
        }
        else if (v115)
        {
          LOBYTE(__dst) = 1;
          LOBYTE(v152) = 1;
          NSUInteger v95 = [(NSData *)v115 length];
          memcpy((char *)&__dst + 2, [(NSData *)v115 bytes], v95);
          if (v95) {
            memset((char *)&v152 + 2, 255, v95);
          }

          v130 = 0;
        }
        v144 = 0;
        v145 = 0;
        sub_1000335D8(&v144, &__dst, 0x16uLL);
        v142 = 0;
        v143 = 0;
        sub_1000335D8(&v142, &v152, 0x16uLL);
        id v107 = [v130 count];
        if (v127) {
          char v108 = -90;
        }
        else {
          char v108 = v128;
        }
        if (v118) {
          char v108 = -120;
        }
        if (v107) {
          char v109 = 3;
        }
        else {
          char v109 = 2;
        }
        sub_1000364C4((uint64_t)a6, v124, v126, v109, (uint64_t)&v144, (uint64_t)&v142, v108, 0, v137, self->_targetCore, 1, v130, v135, v117 & 1, v120, BYTE4(v119) & 1, v121 & 1, 0, 0xFFFF,
          0xFFFF,
          0xFFFF);
        v142 = &off_100998428;
        if (v143) {
          sub_1000368F4(v143);
        }
        v144 = &off_100998428;
        if (v145) {
          sub_1000368F4(v145);
        }
      }
    }
    v87 = v130;
  }
  else
  {

    v113 = 0;
    v115 = 0;
    v87 = 0;
  }
}

- (void)_addTypeWithParamsIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  unsigned int v31 = a3;
  uint64_t v50 = 0;
  v51[0] = 0;
  *(void *)((char *)v51 + 6) = 0;
  uint64_t v48 = 0;
  v49[0] = 0;
  *(void *)((char *)v49 + 6) = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = self->_discoveryArray;
  id v8 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v8)
  {
    id v29 = 0;
    goto LABEL_103;
  }
  int v32 = 0;
  id v29 = 0;
  uint64_t v36 = *(void *)v44;
  while (2)
  {
    id v38 = v8;
    for (i = 0; i != v38; i = (char *)i + 1)
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      unint64_t v11 = (unint64_t)[v10 discoveryFlags];
      unint64_t v12 = (unint64_t)[v10 extraDiscoveryFlags] | v11;
      unsigned int v13 = (v12 & a4) != 0;
      if (a5 && (v12 & a4) == 0) {
        unsigned int v13 = [v10 discoveryTypesContainTypes:a5];
      }
      if (v13)
      {
        self->_aggregateDiscoveryFlags |= v12;
        if (a5)
        {
          [v10 discoveryTypesInternalPtr];
          CBDiscoveryTypesAddTypes();
        }
        if ((v12 & 0x100000000000) == 0)
        {
          if ((v12 & 0x2000000000) != 0)
          {
            self->_anyActiveScauint64_t n = 1;
            if ((v12 & 0x100000000000000) == 0)
            {
LABEL_15:
              if ((v12 & 0x200000000000000) == 0) {
                goto LABEL_16;
              }
              goto LABEL_27;
            }
          }
          else if ((v12 & 0x100000000000000) == 0)
          {
            goto LABEL_15;
          }
          self->_objectDiscoveryFlags |= 2u;
          if ((v12 & 0x200000000000000) == 0)
          {
LABEL_16:
            if ((v12 & 0x10000000000) == 0) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
LABEL_27:
          self->_objectDiscoveryFlags |= 1u;
          if ((v12 & 0x10000000000) == 0)
          {
LABEL_18:
            int v14 = [v10 bleRSSIThresholdHint];
            if ((v14 & (v14 >> 31)) <= -90) {
              char v15 = -90;
            }
            else {
              char v15 = v14 & (v14 >> 31);
            }
            signed int v16 = [v10 bleScanRateOverride];
            if (!v16 && (self->_screenOn || (signed int v16 = [v10 bleScanRateScreenOff]) == 0))
            {
              signed int v16 = [v10 bleScanRate];
              if (!v16) {
                self->_scanRateAnyDefault = 1;
              }
            }
            if (v16 > self->_scanRateHighest) {
              self->_scanRateHighest = v16;
            }
            v32 |= (v12 >> 18) & 1;
            if (v32)
            {
              uint64_t v17 = sub_10003FB34();
              char v35 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 2336))(v17);
            }
            else
            {
              char v35 = 0;
            }
            unint64_t v18 = [v10 deviceFilter];
            unsigned int v19 = [(CBStackBLEScannerBTStack *)self _deviceFilterUUIDs:v18];

            if ([v19 count]) {
              char v20 = 3;
            }
            else {
              char v20 = 2;
            }
            char v34 = v20;
            bzero(&v50, 0x16uLL);
            bzero(&v48, 0x16uLL);
            if (v31 == 21)
            {
              if ((v12 & 0x2000000400020108) == 0
                && (![v10 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2()]
                 || ![v10 discoveryTypesContainTypes:CBDiscoveryTypesNeedsIdentify()]))
              {
                goto LABEL_106;
              }
              if ((id)[(NSData *)self->_selfAuthTag length] != (id)3)
              {
                if (dword_1009F84F0 <= 90 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
                {
                  [(NSData *)self->_selfAuthTag length];
                  LogPrintF_safe();
                }

                goto LABEL_103;
              }
              int v21 = self->_selfAuthTag;

              LOBYTE(v50) = 1;
              LOBYTE(v48) = 1;
              NSUInteger v22 = [(NSData *)v21 length];
              id v29 = v21;
              memcpy((char *)&v50 + 2, [(NSData *)v29 bytes], v22);
              if (v22) {
                memset((char *)&v48 + 2, 255, v22);
              }
              if ((v12 & 0x2000000400020108) == 0)
              {
LABEL_106:
                if (![v10 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2()]) {
                  goto LABEL_93;
                }
              }
              if ((v12 & 0x400000000) != 0)
              {
                BYTE1(v50) = 38;
                BYTE1(v48) = 38;
                v41 = 0;
                v42 = 0;
                sub_1000335D8(&v41, &v50, 0x16uLL);
                id v39 = 0;
                v40 = 0;
                sub_1000335D8(&v39, &v48, 0x16uLL);
                if (v15) {
                  char v24 = v15;
                }
                else {
                  char v24 = -90;
                }
                sub_1000364C4((uint64_t)a6, @"Ensemble", 0x15u, v34, (uint64_t)&v41, (uint64_t)&v39, v24, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                id v39 = &off_100998428;
                if (v40) {
                  sub_1000368F4(v40);
                }
                v41 = &off_100998428;
                if (v42) {
                  sub_1000368F4(v42);
                }
              }
              if ((v12 & 8) != 0)
              {
                BYTE1(v50) = 51;
                BYTE1(v48) = 51;
                v41 = 0;
                v42 = 0;
                sub_1000335D8(&v41, &v50, 0x16uLL);
                id v39 = 0;
                v40 = 0;
                sub_1000335D8(&v39, &v48, 0x16uLL);
                if (v15) {
                  char v25 = v15;
                }
                else {
                  char v25 = -90;
                }
                sub_1000364C4((uint64_t)a6, @"CLink", 0x15u, v34, (uint64_t)&v41, (uint64_t)&v39, v25, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                id v39 = &off_100998428;
                if (v40) {
                  sub_1000368F4(v40);
                }
                v41 = &off_100998428;
                if (v42) {
                  sub_1000368F4(v42);
                }
              }
              if ((v12 & 0x100) != 0)
              {
                BYTE1(v50) = 50;
                BYTE1(v48) = 50;
                v41 = 0;
                v42 = 0;
                sub_1000335D8(&v41, &v50, 0x16uLL);
                id v39 = 0;
                v40 = 0;
                sub_1000335D8(&v39, &v48, 0x16uLL);
                if (v15) {
                  char v26 = v15;
                }
                else {
                  char v26 = -90;
                }
                sub_1000364C4((uint64_t)a6, @"RDisplay", 0x15u, v34, (uint64_t)&v41, (uint64_t)&v39, v26, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                id v39 = &off_100998428;
                if (v40) {
                  sub_1000368F4(v40);
                }
                v41 = &off_100998428;
                if (v42) {
                  sub_1000368F4(v42);
                }
              }
              if ((v12 & 0x20000) != 0)
              {
                BYTE1(v50) = 41;
                BYTE1(v48) = 41;
                v41 = 0;
                v42 = 0;
                sub_1000335D8(&v41, &v50, 0x16uLL);
                id v39 = 0;
                v40 = 0;
                sub_1000335D8(&v39, &v48, 0x16uLL);
                if (v15) {
                  char v27 = v15;
                }
                else {
                  char v27 = -90;
                }
                sub_1000364C4((uint64_t)a6, @"RemotePairing", 0x15u, v34, (uint64_t)&v41, (uint64_t)&v39, v27, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                  0xFFFF,
                  0xFFFF);
                id v39 = &off_100998428;
                if (v40) {
                  sub_1000368F4(v40);
                }
                v41 = &off_100998428;
                if (v42) {
                  sub_1000368F4(v42);
                }
              }
              if ((v12 & 0x2000000000000000) == 0) {
                goto LABEL_93;
              }
              BYTE1(v50) = 40;
              BYTE1(v48) = 40;
              v41 = 0;
              v42 = 0;
              sub_1000335D8(&v41, &v50, 0x16uLL);
              id v39 = 0;
              v40 = 0;
              sub_1000335D8(&v39, &v48, 0x16uLL);
              if (v15) {
                char v28 = v15;
              }
              else {
                char v28 = -90;
              }
              sub_1000364C4((uint64_t)a6, @"Wombat", 0x15u, v34, (uint64_t)&v41, (uint64_t)&v39, v28, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                0xFFFF,
                0xFFFF);
            }
            else
            {
              v41 = 0;
              v42 = 0;
              sub_1000335D8(&v41, &v50, 0x16uLL);
              id v39 = 0;
              v40 = 0;
              sub_1000335D8(&v39, &v48, 0x16uLL);
              if (v15) {
                char v23 = v15;
              }
              else {
                char v23 = -90;
              }
              sub_1000364C4((uint64_t)a6, @"Placeholder", v31, v34, (uint64_t)&v41, (uint64_t)&v39, v23, 0, (v12 & 0x200000000) != 0, self->_targetCore, 1, v19, v35, 0, 0, 0, 1, 0, 0xFFFF,
                0xFFFF,
                0xFFFF);
            }
            id v39 = &off_100998428;
            if (v40) {
              sub_1000368F4(v40);
            }
            v41 = &off_100998428;
            if (v42) {
              sub_1000368F4(v42);
            }
LABEL_93:

            continue;
          }
LABEL_17:
          self->_anyRangeScauint64_t n = 1;
          goto LABEL_18;
        }
      }
    }
    id v8 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_103:
}

- (void)_addUUIDIfNeeded:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  char v33 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v9 = self->_discoveryArray;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned int v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v14 = (unint64_t)[v13 discoveryFlags:v33];
        unint64_t v15 = (unint64_t)[v13 extraDiscoveryFlags] | v14;
        unsigned int v16 = (v15 & a4) != 0;
        if (a5 && (v15 & a4) == 0) {
          unsigned int v16 = [v13 discoveryTypesContainTypes:a5];
        }
        if (v16)
        {
          self->_aggregateDiscoveryFlags |= v15;
          if (a5)
          {
            [v13 discoveryTypesInternalPtr];
            CBDiscoveryTypesAddTypes();
          }
          if ((v15 & 0x100000000000) == 0)
          {
            if ((v15 & 0x2000000000) != 0) {
              self->_anyActiveScauint64_t n = 1;
            }
            if ((v15 & 0x200000000) != 0) {
              self->_anyNeedsDups = 1;
            }
            if ((v15 & 0x10000000000) != 0) {
              self->_anyRangeScauint64_t n = 1;
            }
            signed int v17 = [v13 bleScanRateOverride];
            if (!v17 && (self->_screenOn || (signed int v17 = [v13 bleScanRateScreenOff]) == 0))
            {
              signed int v17 = [v13 bleScanRate];
              if (!v17) {
                self->_scanRateAnyDefault = 1;
              }
            }
            if (v17 > self->_scanRateHighest) {
              self->_scanRateHighest = v17;
            }
            unint64_t v18 = *((void *)a6 + 2);
            unint64_t v19 = *((void *)a6 + 1);
            if (v19 >= v18)
            {
              unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - *(void *)a6) >> 2);
              unint64_t v23 = v22 + 1;
              if (v22 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                abort();
              }
              unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - *(void *)a6) >> 2);
              if (2 * v24 > v23) {
                unint64_t v23 = 2 * v24;
              }
              if (v24 >= 0x666666666666666) {
                unint64_t v25 = 0xCCCCCCCCCCCCCCCLL;
              }
              else {
                unint64_t v25 = v23;
              }
              if (v25) {
                char v26 = (char *)sub_10003767C((uint64_t)a6 + 16, v25);
              }
              else {
                char v26 = 0;
              }
              char v27 = &v26[20 * v22];
              char v28 = &v26[20 * v25];
              long long v29 = *(_OWORD *)&v33->var0.var0;
              *((_DWORD *)v27 + 4) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)char v27 = v29;
              int v21 = v27 + 20;
              unsigned int v31 = *(char **)a6;
              id v30 = (char *)*((void *)a6 + 1);
              if (v30 != *(char **)a6)
              {
                do
                {
                  long long v32 = *(_OWORD *)(v30 - 20);
                  *((_DWORD *)v27 - 1) = *((_DWORD *)v30 - 1);
                  *(_OWORD *)(v27 - 20) = v32;
                  v27 -= 20;
                  v30 -= 20;
                }
                while (v30 != v31);
                id v30 = *(char **)a6;
              }
              *(void *)a6 = v27;
              *((void *)a6 + 1) = v21;
              *((void *)a6 + 2) = v28;
              if (v30) {
                operator delete(v30);
              }
            }
            else
            {
              long long v20 = *(_OWORD *)&v33->var0.var0;
              *(_DWORD *)(v19 + 16) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)unint64_t v19 = v20;
              int v21 = (char *)(v19 + 20);
            }
            *((void *)a6 + 1) = v21;
            goto LABEL_46;
          }
        }
      }
      id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_46:
}

- (void)_addUUIDIfNeededWithParams:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = self->_discoveryArray;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unint64_t v13 = (unint64_t)[v12 discoveryFlags];
        unint64_t v14 = (unint64_t)[v12 extraDiscoveryFlags] | v13;
        unsigned int v15 = (v14 & a4) != 0;
        if (a5 && (v14 & a4) == 0) {
          unsigned int v15 = [v12 discoveryTypesContainTypes:a5];
        }
        if (v15)
        {
          self->_aggregateDiscoveryFlags |= v14;
          if (a5)
          {
            [v12 discoveryTypesInternalPtr];
            CBDiscoveryTypesAddTypes();
          }
          if ((v14 & 0x100000000000) == 0)
          {
            if ((v14 & 0x2000000000) != 0)
            {
              self->_anyActiveScauint64_t n = 1;
              if ((v14 & 0x200000000) != 0) {
                goto LABEL_22;
              }
LABEL_15:
              if ((v14 & 0x10000000000) == 0)
              {
LABEL_17:
                signed int v16 = [v12 bleScanRateOverride];
                if (!v16 && (self->_screenOn || (signed int v16 = [v12 bleScanRateScreenOff]) == 0))
                {
                  signed int v16 = [v12 bleScanRate];
                  if (!v16) {
                    self->_scanRateAnyDefault = 1;
                  }
                }
                if (v16 > self->_scanRateHighest) {
                  self->_scanRateHighest = v16;
                }
                int v17 = [v12 bleRSSIThresholdHint];
                if ((v17 & (v17 >> 31)) <= -90) {
                  char v18 = -90;
                }
                else {
                  char v18 = v17 & (v17 >> 31);
                }
                sub_10071D144((uint64_t)&v38, 65061);
                if (sub_10022A44C(&a3->var0.var0, (unsigned __int8 *)&v38))
                {
                  if ([v12 discoveryTypesContainTypes:CBDiscoveryTypesProximityService()])
                  {
                    uint64_t v38 = 0;
                    v39[0] = 0;
                    *(void *)((char *)v39 + 6) = 0;
                    uint64_t v36 = 0;
                    v37[0] = 0;
                    *(void *)((char *)v37 + 6) = 0;
                    if ((*((unsigned char *)[v12 discoveryTypesInternalPtr] + 2) & 2) != 0)
                    {
                      for (uint64_t j = 0; j != 22; ++j)
                        *((unsigned char *)&v39[-1] + j) = 0;
                      for (uint64_t k = 0; k != 22; ++k)
                        *((unsigned char *)&v37[-1] + k) = 0;
                      LOBYTE(v38) = 6;
                      LOBYTE(v36) = 6;
                      char v28 = 0;
                      long long v29 = 0;
                      sub_1000335D8(&v28, &v38, 0x16uLL);
                      char v26 = 0;
                      char v27 = 0;
                      sub_1000335D8(&v26, &v36, 0x16uLL);
                      int v21 = [&off_1009E0C20 stringValue];
                      unint64_t v22 = +[NSString stringWithUTF8String:"WatchSetup"];
                      long long v34 = *(_OWORD *)&a3->var0.var0;
                      int v35 = *(_DWORD *)&a3->var0.var1.var2[12];
                      sub_1000A3F4C(a6, v21, v22, &v34, (uint64_t)&v28, (uint64_t)&v26, v18, 0, 0, self->_targetCore, 1, 0, 0, 1);

                      char v26 = &off_100998428;
                      if (v27) {
                        sub_1000368F4(v27);
                      }
                      char v28 = &off_100998428;
                      if (v29) {
                        sub_1000368F4(v29);
                      }
                    }
                  }
                }
                continue;
              }
            }
            else
            {
              if ((v14 & 0x200000000) == 0) {
                goto LABEL_15;
              }
LABEL_22:
              self->_anyNeedsDups = 1;
              if ((v14 & 0x10000000000) == 0) {
                goto LABEL_17;
              }
            }
            self->_anyRangeScauint64_t n = 1;
            goto LABEL_17;
          }
        }
      }
      id v9 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v9);
  }
}

- (void)_addServiceUUIDsWithParametersToScanRequestIfNeeded:(void *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = self->_discoveryArray;
  id v55 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v55)
  {
    int v57 = (char *)a6 + 16;
    uint64_t v53 = *(void *)v75;
    id v59 = (void **)a6;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v75 != v53) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        unint64_t v8 = (unint64_t)[v7 discoveryFlags];
        id v63 = v7;
        unint64_t v9 = (unint64_t)[v7 extraDiscoveryFlags] | v8;
        unsigned int v10 = (v9 & a4) != 0;
        if (a5 && (v9 & a4) == 0) {
          unsigned int v10 = [v7 discoveryTypesContainTypes:a5];
        }
        if (!v10) {
          continue;
        }
        self->_aggregateDiscoveryFlags |= v9;
        if (a5)
        {
          [v7 discoveryTypesInternalPtr];
          CBDiscoveryTypesAddTypes();
        }
        if ((v9 & 0x100000000000) != 0) {
          continue;
        }
        if ((v9 & 0x2000000000) != 0)
        {
          self->_anyActiveScauint64_t n = 1;
          if ((v9 & 0x200000000) != 0)
          {
LABEL_22:
            self->_anyNeedsDups = 1;
            if ((v9 & 0x10000000000) == 0) {
              goto LABEL_17;
            }
LABEL_16:
            self->_anyRangeScauint64_t n = 1;
            goto LABEL_17;
          }
        }
        else if ((v9 & 0x200000000) != 0)
        {
          goto LABEL_22;
        }
        if ((v9 & 0x10000000000) != 0) {
          goto LABEL_16;
        }
LABEL_17:
        signed int v11 = [v7 bleScanRateOverride];
        if (!v11 && (self->_screenOn || (signed int v11 = [v7 bleScanRateScreenOff]) == 0))
        {
          signed int v11 = [v7 bleScanRate];
          if (!v11) {
            self->_scanRateAnyDefault = 1;
          }
        }
        if (v11 > self->_scanRateHighest) {
          self->_scanRateHighest = v11;
        }
        int v12 = [v7 bleRSSIThresholdHint];
        int v13 = v12 & (v12 >> 31);
        long long v72 = 0u;
        long long v73 = 0u;
        if (v13 <= -90) {
          LOBYTE(v13) = -90;
        }
        char v61 = v13;
        long long v70 = 0uLL;
        long long v71 = 0uLL;
        unint64_t v14 = [v7 serviceUUIDs];
        id v15 = [v14 countByEnumeratingWithState:&v70 objects:v84 count:16];
        if (v15)
        {
          LODWORD(v16) = 0;
          id v64 = v14;
          uint64_t v65 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v71 != v65) {
                objc_enumerationMutation(v64);
              }
              char v18 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
              unint64_t v19 = [v18 serviceUUID];
              long long v20 = v19;
              if (v19 && (unint64_t)[v19 length] <= 0xFF)
              {
                long long v82 = 0uLL;
                int v83 = 0;
                id v21 = v20;
                sub_10071D1C4((uint64_t)&v82, (int8x16_t *)[v21 bytes], [v21 length]);
                unint64_t v22 = [v18 blobData];
                if ([v22 length])
                {

LABEL_39:
                  memset(__dst, 0, 22);
                  memset(v80, 0, 22);
                  id v25 = [v18 blobData];
                  char v26 = (char *)[v25 bytes];
                  char v27 = [v18 blobData];
                  if ((unint64_t)[v27 length] > 0x15)
                  {
                    long long v29 = *(_OWORD *)v26;
                    *(void *)((char *)__dst + 14) = *(void *)(v26 + 14);
                    __dst[0] = v29;
                  }
                  else
                  {
                    char v28 = [v18 blobData];
                    memcpy(__dst, v26, (size_t)[v28 length]);
                  }
                  id v30 = [v18 maskData];
                  long long v31 = (char *)[v30 bytes];
                  long long v32 = [v18 maskData];
                  if ((unint64_t)[v32 length] > 0x15)
                  {
                    long long v34 = *(_OWORD *)v31;
                    *(void *)((char *)v80 + 14) = *(void *)(v31 + 14);
                    v80[0] = v34;
                  }
                  else
                  {
                    long long v33 = [v18 maskData];
                    memcpy(v80, v31, (size_t)[v33 length]);
                  }
                  uint64_t v68 = 0;
                  int v69 = 0;
                  sub_1000335D8(&v68, __dst, 0x16uLL);
                  uint64_t v66 = 0;
                  v67 = 0;
                  sub_1000335D8(&v66, v80, 0x16uLL);
                  uint64_t v16 = (v16 + 1);
                  int v35 = +[NSString stringWithFormat:@"ServiceUUIDwithBlobMask-%d", v16];
                  uint64_t v36 = [v63 appID];
                  long long v78 = v82;
                  int v79 = v83;
                  sub_1000A3F4C(a3, v35, v36, &v78, (uint64_t)&v68, (uint64_t)&v66, v61, 0, 0, self->_targetCore, 1, 0, 0, 1);

                  uint64_t v66 = &off_100998428;
                  if (v67) {
                    sub_1000368F4(v67);
                  }
                  uint64_t v68 = &off_100998428;
                  if (v69) {
                    sub_1000368F4(v69);
                  }
                  goto LABEL_66;
                }
                unint64_t v23 = [v18 maskData];
                BOOL v24 = [v23 length] == 0;

                if (!v24) {
                  goto LABEL_39;
                }
                uint64_t v38 = (char *)v59[1];
                long long v37 = (char *)v59[2];
                if (v38 >= v37)
                {
                  unint64_t v41 = 0xCCCCCCCCCCCCCCCDLL * ((v38 - (unsigned char *)*v59) >> 2);
                  unint64_t v42 = v41 + 1;
                  if (v41 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                    abort();
                  }
                  unint64_t v43 = 0xCCCCCCCCCCCCCCCDLL * ((v37 - (unsigned char *)*v59) >> 2);
                  if (2 * v43 > v42) {
                    unint64_t v42 = 2 * v43;
                  }
                  if (v43 >= 0x666666666666666) {
                    unint64_t v44 = 0xCCCCCCCCCCCCCCCLL;
                  }
                  else {
                    unint64_t v44 = v42;
                  }
                  if (v44) {
                    long long v45 = (char *)sub_10003767C((uint64_t)v57, v44);
                  }
                  else {
                    long long v45 = 0;
                  }
                  long long v46 = &v45[20 * v41];
                  long long v47 = v82;
                  *((_DWORD *)v46 + 4) = v83;
                  *(_OWORD *)long long v46 = v47;
                  BOOL v49 = (char *)*v59;
                  uint64_t v48 = (char *)v59[1];
                  uint64_t v50 = v46;
                  if (v48 != *v59)
                  {
                    do
                    {
                      long long v51 = *(_OWORD *)(v48 - 20);
                      *((_DWORD *)v50 - 1) = *((_DWORD *)v48 - 1);
                      *(_OWORD *)(v50 - 20) = v51;
                      v50 -= 20;
                      v48 -= 20;
                    }
                    while (v48 != v49);
                    uint64_t v48 = (char *)*v59;
                  }
                  v40 = v46 + 20;
                  *id v59 = v50;
                  v59[1] = v46 + 20;
                  v59[2] = &v45[20 * v44];
                  if (v48) {
                    operator delete(v48);
                  }
                }
                else
                {
                  long long v39 = v82;
                  *((_DWORD *)v38 + 4) = v83;
                  *(_OWORD *)uint64_t v38 = v39;
                  v40 = v38 + 20;
                }
                v59[1] = v40;
              }
LABEL_66:
            }
            unint64_t v14 = v64;
            id v15 = [v64 countByEnumeratingWithState:&v70 objects:v84 count:16];
          }
          while (v15);
        }
      }
      id v55 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v55);
  }
}

- (void)_addBufferedTypesIfNeeded:(id *)a3 scanRequest:(void *)a4
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self->_discoveryArray;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 discoveryTypesContainTypes:a3])
        {
          id v11 = v10;
          [v11 discoveryTypesInternalPtr];
          CBDiscoveryTypesAddTypes();
          unint64_t v12 = (unint64_t)[v11 discoveryFlags];
          unint64_t v13 = (unint64_t)[v11 extraDiscoveryFlags] | v12;
          self->_aggregateDiscoveryFlags |= v13;
          if ((v13 & 0x100000000000) == 0)
          {
            int v19 = 0x2000;
            char v20 = 0;
            if ([v11 discoveryTypesContainTypes:&v19]) {
              self->_aopBTTypes |= 1u;
            }
            unsigned int v17 = 0x80000000;
            char v18 = 0;
            if ([v11 discoveryTypesContainTypes:&v17]) {
              self->_aopBTTypes |= 2u;
            }
            int v15 = 0x8000000;
            char v16 = 0;
            if ([v11 discoveryTypesContainTypes:&v15]) {
              self->_aopBTTypes |= 4u;
            }
            if ([v11 useCase] == 269)
            {
              self->_anyLeechBufferScauint64_t n = 1;
            }
            else
            {
              self->_anyNonLeechBufferScauint64_t n = 1;
              signed int v14 = [v11 bleScanRateOverride];
              if (!v14 && (self->_screenOn || (signed int v14 = [v11 bleScanRateScreenOff]) == 0))
              {
                signed int v14 = [v11 bleScanRate];
                if (!v14) {
                  self->_scanRateAnyDefault = 1;
                }
              }
              if (v14 > self->_scanRateHighest) {
                self->_scanRateHighest = v14;
              }
            }
          }
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)_reportAggressiveScanIfNeeded
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_discoveryArray;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        signed int v7 = [v6 bleScanRateOverride];
        if (!v7 && (self->_screenOn || (signed int v7 = [v6 bleScanRateScreenOff]) == 0)) {
          signed int v7 = [v6 bleScanRate];
        }
        screenOuint64_t n = self->_screenOn;
        if (self->_screenOn) {
          int v9 = 31;
        }
        else {
          int v9 = 21;
        }
        if (v7 < v9)
        {
          if (((unint64_t)[v6 discoveryFlags] & 0x200000000) == 0) {
            continue;
          }
          screenOuint64_t n = self->_screenOn;
        }
        BOOL v10 = !screenOn;
        id v11 = @"agsN";
        if (v10) {
          id v11 = @"agsF";
        }
        unint64_t v12 = v11;
        unint64_t v13 = +[CBMetricsDaemon sharedCBMetricsDaemon];
        [v13 reportAggressiveScan:v6 action:v12];
      }
      id v3 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

- (id)_deviceFilterUUIDs:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      signed int v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v7);
        id v9 = objc_alloc((Class)NSUUID);
        id v10 = [v9 initWithUUIDString:v8, v14];
        if (v10) {
          goto LABEL_10;
        }
        unint64_t v11 = sub_1006ADA24(v8);
        v18[0] = 0;
        v18[1] = 0;
        if (qword_1009F7EE0 != -1) {
          dispatch_once(&qword_1009F7EE0, &stru_100998C90);
        }
        sub_100014B58((uint64_t)off_1009F7ED8, v11, 1u, 1u, 0, 0, (unsigned __int8 *)v18);
        sub_100031234((const unsigned __int8 *)v18);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
LABEL_10:
          if (!v4) {
            id v4 = objc_alloc_init((Class)NSMutableSet);
          }
          [v4 addObject:v10];
        }

        signed int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }

  if ([v4 count])
  {
    unint64_t v12 = [v4 allObjects];
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (id)_scanSummary:(void *)a3
{
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = sub_10004CF2C;
  BOOL v125 = sub_10004CD68;
  id v126 = 0;
  id obj = 0;
  CUPrintFlags64();
  int v69 = v72 = a3;
  NSAppendPrintF_safe();
  objc_storeStrong(&v126, 0);

  id v5 = (id *)(v122 + 5);
  id v119 = (id)v122[5];
  CBDiscoveryTypesAppendString();
  objc_storeStrong(v5, v119);
  if ([(NSSet *)self->_sensorTrackingDevices count])
  {
    uint64_t v6 = (id *)(v122 + 5);
    id v118 = (id)v122[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v6, v118);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    signed int v7 = self->_sensorTrackingDevices;
    id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v114 objects:v127 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v115;
      id v10 = "";
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v115 != v9) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          unint64_t v13 = (id *)(v122 + 5);
          id v113 = (id)v122[5];
          [v12 UUIDString:v70, v71];
          v71 = long long v70 = v10;
          NSAppendPrintF_safe();
          objc_storeStrong(v13, v113);

          id v10 = ", ";
        }
        id v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v114, v127, 16, v70, v71);
        id v10 = ", ";
      }
      while (v8);
    }

    long long v14 = (id *)(v122 + 5);
    id v112 = (id)v122[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v14, v112);
  }
  if ([(NSMutableDictionary *)self->_oobKeyMap count])
  {
    long long v15 = (id *)(v122 + 5);
    id v111 = (id)v122[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v15, v111);
    id v107 = 0;
    char v108 = &v107;
    uint64_t v109 = 0x2020000000;
    char v110 = 1;
    oobKeyMap = self->_oobKeyMap;
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_1000A66C0;
    v106[3] = &unk_100998B38;
    v106[4] = &v121;
    v106[5] = &v107;
    [(NSMutableDictionary *)oobKeyMap enumerateKeysAndObjectsUsingBlock:v106];
    long long v17 = (id *)(v122 + 5);
    id v105 = (id)v122[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v17, v105);
    _Block_object_dispose(&v107, 8);
  }
  long long v18 = (id *)(v122 + 5);
  id v104 = (id)v122[5];
  NSAppendPrintF_safe();
  objc_storeStrong(v18, v104);
  int v19 = (unsigned __int8 *)a3;
  if (a3)
  {
    if (*((unsigned char *)a3 + 144))
    {
      char v20 = (id *)(v122 + 5);
      id v103 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v20, v103);
      int v19 = (unsigned __int8 *)a3;
    }
    if (v19[120])
    {
      int v21 = v19[136];
      long long v22 = (id *)(v122 + 5);
      id v102 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v22, v102);
      int v19 = (unsigned __int8 *)a3;
      if (v21)
      {
        long long v23 = (id *)(v122 + 5);
        id v101 = (id)v122[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v23, v101);
        int v19 = (unsigned __int8 *)a3;
      }
    }
    if (*v19)
    {
      long long v24 = (id *)(v122 + 5);
      id v100 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v24, v100);
      int v19 = (unsigned __int8 *)a3;
    }
    if (v19[140])
    {
      id v25 = (id *)(v122 + 5);
      id v99 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v25, v99);
      int v19 = (unsigned __int8 *)a3;
    }
    id v107 = 0;
    char v108 = 0;
    uint64_t v109 = 0;
    sub_1000A9504(&v107, *((void *)v19 + 8), *((void *)v19 + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v19 + 9) - *((void *)v19 + 8)) >> 5));
    if (v107 != v108)
    {
      char v26 = (id *)(v122 + 5);
      id v98 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v26, v98);
      char v27 = v107;
      long long v73 = v108;
      if (v107 != v108)
      {
        char v28 = "";
        long long v29 = " ";
        do
        {
          id v30 = (id *)(v122 + 5);
          id v97 = (id)v122[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v30, v97);
          long long v31 = (id *)(v122 + 5);
          id v96 = (id)v122[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v31, v96);
          long long v32 = (id *)(v122 + 5);
          id v95 = (id)v122[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v32, v95);
          if (*((unsigned char *)v27 + 64))
          {
            long long v33 = (id *)(v122 + 5);
            id v94 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v33, v94);
          }
          if (!*((unsigned char *)v27 + 68))
          {
            long long v34 = (id *)(v122 + 5);
            id v93 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v34, v93);
          }
          if (!*((unsigned char *)v27 + 65))
          {
            int v35 = (id *)(v122 + 5);
            id v92 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v35, v92);
          }
          uint64_t v36 = (atomic_uint *)v27[5];
          char v80 = &off_100998428;
          long long v81 = v36;
          if (v36) {
            sub_100037354((uint64_t)v36);
          }
          uint64_t v37 = sub_10004A6E4((uint64_t)&v80);
          unint64_t v38 = sub_100045F00((uint64_t)&v80);
          unint64_t v39 = 0;
          if (v38)
          {
            while (!*(unsigned char *)(v37 + v39))
            {
              if (v38 == ++v39) {
                goto LABEL_61;
              }
            }
          }
          if (v39 != v38)
          {
            if (v39 >= v38) {
              unint64_t v40 = v38;
            }
            else {
              unint64_t v40 = v39;
            }
            while (v38 > v39)
            {
              unint64_t v41 = v38 - 1;
              if (*(unsigned __int8 *)(v37 - 1 + v38--))
              {
                unint64_t v40 = v41 + 1;
                break;
              }
            }
            unint64_t v43 = (atomic_uint *)v27[3];
            __p = &off_100998428;
            long long v76 = v43;
            if (v43) {
              sub_100037354((uint64_t)v43);
            }
            sub_10004A6E4((uint64_t)&__p);
            unint64_t v44 = sub_100045F00((uint64_t)&__p);
            long long v45 = (id *)(v122 + 5);
            id v91 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v45, v91);
            if (v39)
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                long long v47 = (id *)(v122 + 5);
                id v90 = (id)v122[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v47, v90);
              }
            }
            unint64_t v48 = v39;
            if (v39 < v40)
            {
              do
              {
                BOOL v49 = v27;
                uint64_t v50 = v29;
                long long v51 = v28;
                id v52 = v50;
                uint64_t v53 = (id *)(v122 + 5);
                if (v48 >= v44)
                {
                  uint64_t v88 = v122[5];
                  int v54 = (id *)&v88;
                }
                else
                {
                  uint64_t v89 = v122[5];
                  int v54 = (id *)&v89;
                }
                NSAppendPrintF_safe();
                objc_storeStrong(v53, *v54);
                char v28 = v51;
                long long v29 = v52;
                char v27 = v49;
                ++v48;
              }
              while (v40 != v48);
            }
            id v55 = (id *)(v122 + 5);
            id v87 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v55, v87);
            if (v39)
            {
              for (uint64_t k = 0; k != v39; ++k)
              {
                int v57 = (id *)(v122 + 5);
                id v86 = (id)v122[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v57, v86);
              }
            }
            if (v39 < v40)
            {
              do
              {
                id v58 = (id *)(v122 + 5);
                id v85 = (id)v122[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v58, v85);
                ++v39;
              }
              while (v40 != v39);
            }
            id v59 = (id *)(v122 + 5);
            id v84 = (id)v122[5];
            NSAppendPrintF_safe();
            objc_storeStrong(v59, v84);
            __p = &off_100998428;
            if (v76) {
              sub_1000368F4(v76);
            }
          }
LABEL_61:
          v60 = (id *)(v122 + 5);
          id v83 = (id)v122[5];
          NSAppendPrintF_safe();
          objc_storeStrong(v60, v83);
          char v80 = &off_100998428;
          if (v81) {
            sub_1000368F4(v81);
          }
          v27 += 12;
        }
        while (v27 != v73);
      }
    }
    char v80 = 0;
    long long v81 = 0;
    uint64_t v82 = 0;
    sub_100037564((char *)&v80, *((long long **)v72 + 1), *((long long **)v72 + 2), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v72 + 2) - *((void *)v72 + 1)) >> 2));
    if (v80 != v81)
    {
      char v61 = (id *)(v122 + 5);
      id v79 = (id)v122[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v61, v79);
      uint64_t v62 = (atomic_uint *)v80;
      id v63 = v81;
      if (v80 != v81)
      {
        do
        {
          id v64 = (id *)(v122 + 5);
          id v78 = (id)v122[5];
          sub_1000417A8((uint64_t)v62, &__p);
          NSAppendPrintF_safe();
          objc_storeStrong(v64, v78);
          if (v77 < 0) {
            operator delete(__p);
          }
          v62 += 5;
        }
        while (v62 != v63);
      }
    }
    unsigned int v65 = *((_DWORD *)v72 + 42);
    if (v65)
    {
      uint64_t v66 = (id *)(v122 + 5);
      id v74 = (id)v122[5];
      if (v65 < 0x20000)
      {
        switch(v65)
        {
          case 0x10000u:
          case 0x10001u:
          case 0x10002u:
          case 0x10003u:
          case 0x10004u:
          case 0x10005u:
          case 0x10006u:
          case 0x10007u:
          case 0x10008u:
          case 0x10009u:
          case 0x1000Au:
          case 0x1000Bu:
          case 0x1000Cu:
          case 0x1000Du:
          case 0x1000Eu:
          case 0x1000Fu:
          case 0x10010u:
          case 0x10011u:
          case 0x10012u:
          case 0x10013u:
          case 0x10014u:
          case 0x10015u:
          case 0x10016u:
          case 0x10017u:
          case 0x10018u:
          case 0x10019u:
            break;
          default:
            JUMPOUT(0);
        }
      }
      NSAppendPrintF_safe();
      objc_storeStrong(v66, v74);
    }
    if (v80)
    {
      long long v81 = (atomic_uint *)v80;
      operator delete(v80);
    }
    char v80 = &v107;
    sub_1000A8BDC((void ***)&v80);
  }
  id v67 = (id)v122[5];
  _Block_object_dispose(&v121, 8);

  return v67;
}

- (void)_sensorTrackingUpdate
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = self->_discoveryArray;
  id v2 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v2)
  {
    id v3 = 0;
    uint64_t v30 = *(void *)v52;
    id v31 = v2;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (([v4 discoveryFlags] & 0x20000000) != 0)
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v35 = v3;
          id v5 = [v4 deviceFilter];
          id v6 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v48;
            long long v33 = v4;
            long long v34 = v5;
            do
            {
              id v8 = 0;
              do
              {
                if (*(void *)v48 != v7) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v8);
                id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
                if (v10) {
                  goto LABEL_13;
                }
                __int16 v46 = 0;
                int v45 = 0;
                [v9 UTF8String];
                if (TextToHardwareAddress()) {
                  goto LABEL_17;
                }
                uint64_t v55 = 0;
                v56 = 0;
                if (qword_1009F7EE0 != -1) {
                  dispatch_once(&qword_1009F7EE0, &stru_100998C90);
                }
                sub_100014B58((uint64_t)off_1009F7ED8, ((unint64_t)v45 << 40) | ((unint64_t)BYTE1(v45) << 32) | ((unint64_t)BYTE2(v45) << 24) | ((unint64_t)HIBYTE(v45) << 16) | ((unint64_t)v46 << 8) | HIBYTE(v46), 1u, 1u, 0, 0, (unsigned __int8 *)&v55);
                sub_100031234((const unsigned __int8 *)&v55);
                id v10 = (id)objc_claimAutoreleasedReturnValue();
                id v4 = v33;
                id v5 = v34;
                if (v10)
                {
LABEL_13:
                  id v11 = v35;
                  if (!v35) {
                    id v11 = objc_alloc_init((Class)NSMutableDictionary);
                  }
                  [v11 setObject:v4 forKeyedSubscript:v10];
                  id v35 = v11;
                }
                else
                {
LABEL_17:
                  id v10 = 0;
                }

                id v8 = (char *)v8 + 1;
              }
              while (v6 != v8);
              id v12 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
              id v6 = v12;
            }
            while (v12);
          }

          id v3 = v35;
        }
      }
      id v31 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v31);
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v36 = v3;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v13 = self->_sensorTrackingDevices;
  id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
  int v15 = 0;
  if (v14)
  {
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
        int v19 = [v36 objectForKeyedSubscript:v18, v27];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v27 = v18;
            LogPrintF_safe();
          }
          sessionHandle = self->_sessionHandle;
          uint64_t v22 = sub_100019878();
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          void v40[2] = sub_1000A6F60;
          v40[3] = &unk_100998A38;
          v40[4] = v18;
          v40[5] = sessionHandle;
          sub_100013018(v22, v40);
          ++v15;
        }
      }
      id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v14);
  }

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int v58 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  void v37[2] = sub_1000A6FC8;
  v37[3] = &unk_100998B88;
  char v39 = 1;
  int v38 = -127;
  v37[4] = self;
  v37[5] = &v55;
  [v36 enumerateKeysAndObjectsUsingBlock:v37];
  if (*((_DWORD *)v56 + 6) | v15)
  {
    if (dword_1009F84F0 <= 30 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
    {
      [(NSSet *)self->_sensorTrackingDevices count];
      [v36 count];
      LogPrintF_safe();
    }
  }
  else if (dword_1009F84F0 <= 10 && (dword_1009F84F0 != -1 || _LogCategory_Initialize()))
  {
    [v36 count:v27];
    LogPrintF_safe();
  }
  if (v36)
  {
    id v23 = objc_alloc((Class)NSSet);
    long long v24 = [v36 allKeys];
    id v25 = (NSSet *)[v23 initWithArray:v24];
    sensorTrackingDevices = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = v25;
  }
  else
  {
    long long v24 = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = 0;
  }

  self->_unint64_t aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)([v36 count] != 0) << 29);
  _Block_object_dispose(&v55, 8);
}

- (unint64_t)aggregateDiscoveryFlags
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t aggregateDiscoveryFlags = v2->_aggregateDiscoveryFlags;
  objc_sync_exit(v2);

  return aggregateDiscoveryFlags;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)aggregateDiscoveryTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = *(unsigned int *)v2->_aggregateDiscoveryTypes.bitArray | ((unint64_t)v2->_aggregateDiscoveryTypes.bitArray[4] << 32);
  objc_sync_exit(v2);

  return ($F9CA75CC5B4E604BACB273E5A2091FCB)v3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (void)setDevicesBufferedHandler:(id)a3
{
}

- (void)setDiscoveryArray:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOuint64_t n = a3;
}

- (void)setSelfAuthTag:(id)a3
{
}

- (void)setSelfAuthTagNonConnectable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfAuthTagNonConnectable, 0);
  objc_storeStrong((id *)&self->_selfAuthTag, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryArray, 0);
  objc_storeStrong(&self->_devicesBufferedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_scanSummary, 0);
  objc_storeStrong((id *)&self->_safetyAlertsDevices, 0);
  objc_storeStrong((id *)&self->_suppressedDeviceFilter, 0);
  objc_storeStrong((id *)&self->_suppressedOobKeys, 0);
  objc_storeStrong((id *)&self->_sensorTrackingDevices, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_oobKeyMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_bufferedDevices, 0);

  bleScannerObjC = self->_bleScannerCPP._bleScannerObjC;
}

- (id).cxx_construct
{
  self->_bleScannerCPP._vptr$LeObserverListener = (void **)&off_100998BE0;
  self->_bleScannerCPP._bleScannerObjC = 0;
  id v3 = &_dispatch_main_q;
  self->_bleScannerCPP._dispatchQueue = (OS_dispatch_queue *)&_dispatch_main_q;
  self->_bleScannerCPP._reportedNonLeech = 0;
  return self;
}

@end