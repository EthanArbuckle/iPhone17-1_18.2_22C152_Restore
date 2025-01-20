@interface CBStackControllerBTStack
- (BOOL)_deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)_disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5;
- (BOOL)addDiscoverableController:(id)a3 error:(id *)a4;
- (BOOL)addPairingClient:(id)a3 error:(id *)a4;
- (BOOL)connectDevice:(id)a3 connectionFlags:(unsigned int)a4 serviceFlags:(unsigned int)a5 error:(id *)a6;
- (BOOL)deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5;
- (BOOL)isDeviceConnected:(id)a3 error:(id *)a4;
- (BOOL)modifyDevice:(id)a3 btDevice:(void *)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)modifyDevice:(id)a3 error:(id *)a4;
- (BOOL)modifyDevice:(id)a3 leDevice:(void *)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 error:(id *)a7;
- (BOOL)modifyDevice:(id)a3 settings:(id)a4 error:(id *)a5;
- (BOOL)pairingContinueWithPairingInfo:(id)a3 error:(id *)a4;
- (BOOL)poweredOn;
- (BOOL)sendAudioAccessoryConfig:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)sendAudioAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 device:(id)a5 error:(id *)a6;
- (BOOL)sendConversationDetectMessage:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 error:(id *)a7;
- (BOOL)sendSmartRoutingInformation:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4;
- (BOOL)setPowerState:(int64_t)a3 error:(id *)a4;
- (BOOL)updateControllerInfo:(id)a3 error:(id *)a4;
- (CBControllerInfo)controllerInfo;
- (CBStackControllerBTStack)init;
- (NSData)fastLEConnectionInfoData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_btUUIDWithID:(id)a3 error:(id *)a4;
- (id)controllerDataChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)diagnosticControl:(id)a3;
- (id)discoverableStateChangedHandler;
- (id)getDevicesWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)inquiryStateChangedHandler;
- (id)invalidationHandler;
- (id)powerChangedHandler;
- (id)relayMessageHandler;
- (int)discoverableState;
- (int)inquiryState;
- (int64_t)powerState;
- (unsigned)fastLEConnectionInfoVersion;
- (void)_accessoryCommandStatusWithDevice:(id)a3 type:(int)a4 result:(unsigned __int16)a5 reason:(unsigned __int16)a6;
- (void)_accessoryReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6;
- (void)_btDeviceWithID:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (void)_btDeviceWithID:(id)a3 error:(id *)a4;
- (void)_completePerformDeviceRequest:(id)a3 error:(id)a4;
- (void)_connectDeviceCompleteRequest:(id)a3 error:(id)a4;
- (void)_connectDeviceUpdateRequests:(id)a3 btResult:(int)a4;
- (void)_deleteAllDevices;
- (void)_disconnectAllDevicesWithServiceFlags:(unsigned int)a3;
- (void)_modifyDeviceCompleteRequest:(id)a3 error:(id)a4;
- (void)_pairingAgentTearDown;
- (void)_pairingCompletedWithBTDevice:(void *)a3 result:(int)a4;
- (void)_pairingPromptWithBTDevice:(void *)a3 pairingType:(int64_t)a4 pinString:(id)a5 flags:(unsigned int)a6;
- (void)_readRSSIWithConnectionHandle:(_OI_HCI_CONNECTION *)a3 status:(int)a4 rssi:(char)a5;
- (void)_readTxPowerWithFlags:(unsigned int)a3 status:(int)a4 connectionHandle:(_OI_HCI_CONNECTION *)a5 txPowerLevel:(char)a6;
- (void)activate;
- (void)connectWithCBConnection:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6;
- (void)performDeviceRequest:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)removeDiscoverableController:(id)a3;
- (void)removePairingClient:(id)a3;
- (void)setControllerDataChangedHandler:(id)a3;
- (void)setDiscoverableStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFastLEConnectionInfoData:(id)a3;
- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3;
- (void)setInquiryStateChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLowPowerModeWithReason:(int)a3 completionHandler:(id)a4;
- (void)setOfflineAdvertisingParams:(id)a3;
- (void)setPowerChangedHandler:(id)a3;
- (void)setRelayMessageHandler:(id)a3;
@end

@implementation CBStackControllerBTStack

- (BOOL)poweredOn
{
  if (qword_1009F8748 != -1) {
    dispatch_once(&qword_1009F8748, &stru_100999AF8);
  }
  return sub_100028CB4((uint64_t)off_1009F8740) == 1;
}

- (CBStackControllerBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBStackControllerBTStack;
  v2 = [(CBStackControllerBTStack *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_powerStateNotifyToken = -1;
    v4 = v2;
  }

  return v3;
}

- (CBControllerInfo)controllerInfo
{
  id v3 = objc_alloc_init((Class)CBControllerInfo);
  if (qword_1009F8738 != -1) {
    dispatch_once(&qword_1009F8738, &stru_100999A98);
  }
  v4 = sub_10026FBE0(qword_1009F8730);
  [v3 setAudioLinkQualityArray:v4];

  [v3 setBluetoothState:-[CBStackControllerBTStack powerState](self, "powerState")];
  uint64_t v5 = sub_10003FB34();
  unsigned int v6 = *(_DWORD *)(v5 + 712);
  v7 = +[NSString stringWithUTF8String:sub_100352668(v5, v6)];
  [v3 setChipsetID:v7];

  [v3 setDiscoverableState:-[CBStackControllerBTStack discoverableState](self, "discoverableState")];
  if (v6)
  {
    __s1 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v8 = sub_1003705E4();
    (*(void (**)(uint64_t, void **))(*(void *)v8 + 64))(v8, &__s1);
    if (SHIBYTE(v40) < 0)
    {
      if (v39)
      {
        if (v39 == 43)
        {
          p_s1 = __s1;
          v10 = __s1;
LABEL_11:
          if (!memcmp(v10, "No Bluetooth automatic firmware update file", 0x2BuLL)) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        p_s1 = __s1;
LABEL_15:
        v11 = +[NSString stringWithUTF8String:p_s1];
        [v3 setFirmwareName:v11];
      }
    }
    else if (HIBYTE(v40))
    {
      if (HIBYTE(v40) == 43)
      {
        p_s1 = &__s1;
        v10 = &__s1;
        goto LABEL_11;
      }
      p_s1 = &__s1;
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v12 = sub_1003705E4();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v12 + 80))(v12))
    {
      v13 = CBErrorF();
      [v3 setLastChipsetInitError:v13];
    }
    if (SHIBYTE(v40) < 0) {
      operator delete(__s1);
    }
  }
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    WORD2(__s1) = 0;
    LODWORD(__s1) = 0;
    sub_1004E219C((uint64_t)off_1009F8068, (uint64_t)&__s1);
    id v14 = [objc_alloc((Class)NSData) initWithBytes:&__s1 length:6];
    [v3 setHardwareAddressData:v14];
  }
  v15 = [(CBStackControllerBTStack *)self fastLEConnectionInfoData];
  [v3 setFastLEConnectionInfoData:v15];

  [v3 setFastLEConnectionInfoVersion:-[CBStackControllerBTStack fastLEConnectionInfoVersion](self, "fastLEConnectionInfoVersion")];
  unsigned int v16 = sub_10016B718();
  if (v16 >= 8)
  {
    unsigned int v17 = 0;
    BOOL v18 = 0;
    LOBYTE(v19) = 0;
  }
  else
  {
    unsigned int v17 = (0x3Eu >> v16) & 1;
    BOOL v18 = v16 == 0;
    unint64_t v19 = 0x201030303030304uLL >> (8 * v16);
  }
  [v3 setHciTransportType:(char)v19];
  [v3 setInquiryState:-[CBStackControllerBTStack inquiryState](self, "inquiryState")];
  uint64_t v20 = sub_10003FB34();
  [v3 setLeaVersion:sub_1003548A0(v20)];
  [v3 setLmpVersion:BYTE8(xmmword_100A195C0)];
  [v3 setProductID:sub_1003FAF58()];
  if (qword_1009F8090 != -1) {
    dispatch_once(&qword_1009F8090, &stru_100999AB8);
  }
  [v3 setSupportedServices:sub_1004D8374((uint64_t)off_1009F8088)];
  [v3 setVendorID:(unsigned __int16)sub_1003FAF50()];
  [v3 setVendorIDSource:sub_100058654()];
  if (!v6)
  {
    id v22 = objc_alloc((Class)NSString);
    id v21 = [v22 initWithFormat:@"v%u c%u", WORD5(xmmword_100A195C0), WORD3(xmmword_100A195C0)];
    [v3 setFirmwareVersion:v21];
    goto LABEL_33;
  }
  if (v6 - 2000 <= 0x7CF)
  {
    id v21 = [v3 firmwareName];
    [v3 setFirmwareVersion:v21];
LABEL_33:

    goto LABEL_34;
  }
  if (v6 <= 0x7CF)
  {
    uint64_t v24 = sub_100035F54();
    if (((v17 | v18) & (*(unsigned int (**)(uint64_t))(*(void *)v24 + 384))(v24)) == 1)
    {
      id v25 = objc_alloc((Class)NSString);
      id v21 = [v25 initWithFormat:@"v%u c%u", BYTE10(xmmword_100A195C0), WORD3(xmmword_100A195C0)];
      [v3 setFirmwareVersion:v21];
      goto LABEL_33;
    }
  }
  id v26 = [v3 firmwareName];
  v27 = (const char *)[v26 UTF8String];
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = "";
  }

  while (1)
  {
    int v29 = *(unsigned __int8 *)v28;
    if (!*v28 || v29 == 95) {
      break;
    }
    ++v28;
  }
  uint64_t v30 = 0;
  BOOL v31 = v29 == 95;
  BOOL v32 = v29 == 95;
  if (v31) {
    v33 = v28 + 1;
  }
  else {
    v33 = v28;
  }
  while (1)
  {
    int v34 = v28[v32 + v30];
    if (!v28[v32 + v30] || v34 == 95) {
      break;
    }
    ++v30;
  }
  if (v30 && v34 == 95)
  {
    id v35 = [objc_alloc((Class)NSString) initWithBytes:v33 length:v30 encoding:4];
    [v3 setFirmwareVersion:v35];
  }
  v36 = [v3 firmwareVersion];

  if (!v36)
  {
    id v37 = objc_alloc((Class)NSString);
    id v21 = [v37 initWithFormat:@"v%u", WORD5(xmmword_100A195C0)];
    [v3 setFirmwareVersion:v21];
    goto LABEL_33;
  }
LABEL_34:

  return (CBControllerInfo *)v3;
}

- (int)discoverableState
{
  char v3 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  sub_1004B5370((uint64_t)off_1009F7EA8, &v3);
  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)addDiscoverableController:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000BEA78;
  v26[3] = &unk_1009995E0;
  v26[4] = &v27;
  v7 = objc_retainBlock(v26);
  uint64_t v8 = +[NSValue valueWithNonretainedObject:v6];
  v9 = [(NSMutableDictionary *)self->_discoverableSessionMap objectForKeyedSubscript:v8];

  if (!v9)
  {
    v11 = [v6 appID];
    if (!v11)
    {
      if (a4)
      {
        CBErrorF();
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v10 = 0;
      }
      goto LABEL_25;
    }
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@-0x%08X", v11, [v6 clientID]];
    v13 = (char *)[v12 UTF8String];
    if (qword_1009F8168 != -1) {
      dispatch_once(&qword_1009F8168, &stru_100999A58);
    }
    uint64_t v14 = qword_1009F8160;
    sub_10004191C(__p, v13);
    int v15 = sub_100009254(v14, (uint64_t)__p);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    if (v15 && v15 != -310000)
    {
      if (a4) {
        goto LABEL_30;
      }
    }
    else
    {
      if (qword_1009F7EB0 != -1) {
        dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
      }
      unint64_t v16 = sub_1004B11D8(off_1009F7EA8, v28[3]);
      if (v16)
      {
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          id v23 = v12;
          LogPrintF_safe();
        }
        if (qword_1009F7EB0 != -1) {
          dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
        }
        int v17 = sub_1004B170C(off_1009F7EA8, v16, 1);
        if (!v17 || v17 == -310000)
        {
          BOOL v18 = objc_alloc_init(CBStackDiscoverableSession);
          [(CBStackDiscoverableSession *)v18 setBtSessionHandle:v28[3]];
          discoverableSessionMap = self->_discoverableSessionMap;
          if (!discoverableSessionMap)
          {
            uint64_t v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v21 = self->_discoverableSessionMap;
            self->_discoverableSessionMap = v20;

            discoverableSessionMap = self->_discoverableSessionMap;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](discoverableSessionMap, "setObject:forKeyedSubscript:", v18, v8, v23);
          v28[3] = 0;

          BOOL v10 = 1;
          goto LABEL_24;
        }
        if (!a4) {
          goto LABEL_34;
        }
LABEL_30:
        CBErrorF();
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      if (a4) {
        goto LABEL_30;
      }
    }
LABEL_34:
    BOOL v10 = 0;
    goto LABEL_24;
  }
  BOOL v10 = 1;
LABEL_26:

  ((void (*)(void *))v7[2])(v7);
  _Block_object_dispose(&v27, 8);

  return v10;
}

- (void)removeDiscoverableController:(id)a3
{
  id v9 = a3;
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    v7 = [v9 appID];
    id v8 = [v9 clientID];
    LogPrintF_safe();
  }
  v4 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v9, v7, v8);
  uint64_t v5 = [(NSMutableDictionary *)self->_discoverableSessionMap objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_discoverableSessionMap setObject:0 forKeyedSubscript:v4];
    id v6 = [v5 btSessionHandle];
    if (qword_1009F8168 != -1) {
      dispatch_once(&qword_1009F8168, &stru_100999A58);
    }
    sub_10000A678(qword_1009F8160, (unint64_t)v6);
  }
}

- (int)inquiryState
{
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  if (sub_1004B6000()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)powerState
{
  if (qword_1009F8748 != -1) {
    dispatch_once(&qword_1009F8748, &stru_100999AF8);
  }
  sub_100028CB4((uint64_t)off_1009F8740);
  return 4;
}

- (BOOL)setPowerState:(int64_t)a3 error:(id *)a4
{
  if (a3 == 4)
  {
    if (qword_1009F8748 != -1) {
      dispatch_once(&qword_1009F8748, &stru_100999AF8);
    }
    int v7 = sub_1004B98D4((uint64_t)off_1009F8740);
    if (v7) {
      BOOL v8 = v7 == -310000;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    if (!a4) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (a3 != 10)
  {
    if (a3 == 5)
    {
      if (qword_1009F7EB0 != -1) {
        dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
      }
      sub_1004B3D30((uint64_t)off_1009F7EA8, 0, 0);
      if (qword_1009F8748 != -1) {
        dispatch_once(&qword_1009F8748, &stru_100999AF8);
      }
      int v5 = sub_1004B94DC((uint64_t)off_1009F8740);
      LOBYTE(v6) = 1;
      if (v5 && v5 != -310000)
      {
        if (a4) {
          goto LABEL_32;
        }
LABEL_34:
        LOBYTE(v6) = 0;
        return v6;
      }
      return v6;
    }
    if (!a4) {
      goto LABEL_34;
    }
LABEL_32:
    CBErrorF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    *a4 = v10;
    return v6;
  }
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  sub_1004B3D30((uint64_t)off_1009F7EA8, 0, 1);
  if (qword_1009F8748 != -1) {
    dispatch_once(&qword_1009F8748, &stru_100999AF8);
  }
  int v6 = sub_100028CB4((uint64_t)off_1009F8740);
  if (v6 != 1)
  {
    if (qword_1009F8748 != -1) {
      dispatch_once(&qword_1009F8748, &stru_100999AF8);
    }
    int v9 = sub_1004B94DC((uint64_t)off_1009F8740);
    LOBYTE(v6) = 1;
    if (v9)
    {
      if (v9 != -310000)
      {
        if (a4) {
          goto LABEL_32;
        }
        goto LABEL_34;
      }
    }
  }
  return v6;
}

- (void)setLowPowerModeWithReason:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v8 = dispatch_queue_create("CBStackSetLowPowerMode", v7);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF128;
  block[3] = &unk_100999630;
  int v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = sub_10010BA04();
  int v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
  dispatch_time_t v8 = dispatch_time(0, 9000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000BF5F4;
  handler[3] = &unk_100997528;
  handler[4] = v6;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  uint64_t v9 = sub_10003FFD4();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 88))(v9, v5) & 1) == 0)
  {
    if (a4) {
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (qword_1009F8758 != -1) {
    dispatch_once(&qword_1009F8758, &stru_100999B18);
  }
  sub_100265ABC((uint64_t)off_1009F8750);
  if (qword_1009F8758 != -1) {
    dispatch_once(&qword_1009F8758, &stru_100999B18);
  }
  int v10 = sub_100266680((uint64_t)off_1009F8750, v5);
  if (qword_1009F8758 != -1) {
    dispatch_once(&qword_1009F8758, &stru_100999B18);
  }
  sub_100265BB0((uint64_t)off_1009F8750);
  if (v10) {
    uint64_t v11 = (v10 + 310000);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = sub_10010BA04() - v6;
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = v12;
    LogPrintF_safe();
  }
  dispatch_source_cancel(v7);
  if (v12 >> 3 <= 0x464)
  {
    v22[0] = @"errorCode";
    v13 = +[NSNumber numberWithInt:v11];
    v23[0] = v13;
    v22[1] = @"errorCount";
    uint64_t v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11 != 0, v20);
    v23[1] = v14;
    v22[2] = @"timeToEnter";
    int v15 = +[NSNumber numberWithUnsignedLongLong:v12];
    v23[2] = v15;
    unint64_t v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    uint64_t v17 = sub_100050530();
    (*(void (**)(uint64_t, void *))(*(void *)v17 + 216))(v17, v16);
  }
  if (v11)
  {
    if (a4)
    {
LABEL_23:
      CBErrorF();
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_24:
    BOOL v18 = 0;
    goto LABEL_19;
  }
  BOOL v18 = 1;
LABEL_19:

  return v18;
}

- (void)setOfflineAdvertisingParams:(id)a3
{
  id v3 = a3;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = dispatch_queue_create("CBStackSetOfflineAdvertisingParams", v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF8C0;
  block[3] = &unk_100997450;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (id)description
{
  return [(CBStackControllerBTStack *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  id v72 = 0;
  unint64_t v3 = [(CBStackControllerBTStack *)self powerState];
  if (v3 > 0xA) {
    v4 = "?";
  }
  else {
    v4 = off_100999D30[v3];
  }
  unsigned int v5 = [(CBStackControllerBTStack *)self discoverableState];
  if (v5 > 2) {
    id v6 = "?";
  }
  else {
    id v6 = off_100999D18[v5];
  }
  int v7 = [(CBStackControllerBTStack *)self controllerInfo];
  id v8 = [v7 fastLEConnectionInfoVersion];
  unint64_t stackControllerInfoCloudSyncStatus = (char)self->_stackControllerInfoCloudSyncStatus;
  if (stackControllerInfoCloudSyncStatus > 3) {
    int v10 = "?";
  }
  else {
    int v10 = off_100999CF8[stackControllerInfoCloudSyncStatus];
  }
  unsigned int v11 = [(CBStackControllerBTStack *)self inquiryState];
  if (v11 > 2) {
    uint64_t v12 = "?";
  }
  else {
    uint64_t v12 = off_100999D18[v11];
  }
  if (self->_btSessionPtr) {
    v13 = "yes";
  }
  else {
    v13 = "no";
  }
  v45 = v12;
  v46 = v13;
  v41 = v4;
  NSAppendPrintF_safe();
  id v14 = v72;

  v48 = self->_connectDeviceRequests;
  if ([(NSMutableSet *)v48 count])
  {
    id v71 = v14;
    NSAppendPrintF_safe();
    id v15 = v14;

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obj = v48;
    id v16 = [(NSMutableSet *)obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v68;
      BOOL v18 = "";
      do
      {
        unint64_t v19 = 0;
        uint64_t v20 = v15;
        do
        {
          if (*(void *)v68 != v17) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v19);
          v66 = v20;
          id v22 = [v21 connection:v42, v43];
          [v22 peerDevice];
          v43 = v42 = v18;
          NSAppendPrintF_safe();
          id v15 = v20;

          unint64_t v19 = (char *)v19 + 1;
          BOOL v18 = ", ";
          uint64_t v20 = v15;
        }
        while (v16 != v19);
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16, v42, v43);
        BOOL v18 = ", ";
      }
      while (v16);
    }

    id v65 = v15;
    NSAppendPrintF_safe();
    id v14 = v15;
  }
  v47 = self->_modifyDeviceRequests;
  if ([(NSMutableSet *)v47 count])
  {
    id v64 = v14;
    NSAppendPrintF_safe();
    id v23 = v14;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v24 = v47;
    id v25 = [(NSMutableSet *)v24 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v61;
      uint64_t v27 = "";
      do
      {
        v28 = 0;
        uint64_t v29 = v23;
        do
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v28);
          v59 = v29;
          [v30 device:v42:v43];
          v43 = v42 = v27;
          NSAppendPrintF_safe();
          id v23 = v29;

          v28 = (char *)v28 + 1;
          uint64_t v27 = ", ";
          uint64_t v29 = v23;
        }
        while (v25 != v28);
        id v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v60, v74, 16, v42, v43);
        uint64_t v27 = ", ";
      }
      while (v25);
    }

    id v58 = v23;
    NSAppendPrintF_safe();
    id v14 = v23;
  }
  v50 = self->_performDeviceRequests;
  if ([(NSMutableSet *)v50 count])
  {
    id v57 = v14;
    NSAppendPrintF_safe();
    id v31 = v14;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obja = v50;
    id v32 = [(NSMutableSet *)obja countByEnumeratingWithState:&v53 objects:v73 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v54;
      int v34 = "";
      do
      {
        id v35 = 0;
        v36 = v31;
        do
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(obja);
          }
          id v37 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v35);
          v38 = [v37 device:v42:v43:v44];
          [v37 request];
          v44 = v43 = v38;
          v42 = v34;
          NSAppendPrintF_safe();
          id v31 = v36;

          id v35 = (char *)v35 + 1;
          v36 = v31;
          int v34 = ", ";
        }
        while (v32 != v35);
        id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v73, 16, v42, v38, v44);
        int v34 = ", ";
      }
      while (v32);
    }

    NSAppendPrintF_safe();
    id v14 = v31;
  }
  id v39 = v14;

  return v39;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    FatalErrorF();
LABEL_29:
    dispatch_once(&qword_1009F8168, &stru_100999A58);
    goto LABEL_8;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  objc_storeStrong((id *)&qword_1009FC178, self);
  p_btSessionHandle = &self->_btSessionHandle;
  if (self->_btSessionHandle) {
    goto LABEL_21;
  }
  v4 = &unk_1009F8000;
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  unint64_t v3 = &unk_1009F8000;
  if (qword_1009F8168 != -1) {
    goto LABEL_29;
  }
LABEL_8:
  uint64_t v7 = qword_1009F8160;
  sub_10004191C(__p, "CBDaemon");
  int v8 = sub_100009254(v7, (uint64_t)__p);
  int v9 = v8;
  if (v13 < 0)
  {
    operator delete(__p[0]);
    if (!v9) {
      goto LABEL_17;
    }
LABEL_12:
    if (v9 != -310000)
    {
      int v10 = v4[408];
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v11 = CUPrintErrorCode();
        LogPrintF_safe();
      }
    }
    goto LABEL_17;
  }
  if (v8) {
    goto LABEL_12;
  }
LABEL_17:
  if (*p_btSessionHandle)
  {
    if (v3[45] != -1) {
      dispatch_once(&qword_1009F8168, &stru_100999A58);
    }
    self->_btSessionPtr = (void *)sub_100019C0C((void *)qword_1009F8160, (unint64_t)self->_btSessionHandle);
  }
LABEL_21:
  if (!self->_addedController)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC180);
    if (!qword_1009FC188) {
      operator new();
    }
    sub_1000C036C(qword_1009FC188, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC180);
    self->_addedController = 1;
  }
  if (self->_powerStateNotifyToken == -1)
  {
    notify_register_check("com.apple.bluetooth.state", &self->_powerStateNotifyToken);
    notify_set_state(self->_powerStateNotifyToken, [(CBStackControllerBTStack *)self powerState]);
    notify_post("com.apple.bluetooth.state");
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_addedController)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC180);
    if (qword_1009FC188) {
      sub_1000C0A84(qword_1009FC188, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC180);
    self->_addedController = 0;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v3 = [(NSMutableSet *)self->_connectDeviceRequests allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v42;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v42 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        int v8 = CBErrorF();
        [(CBStackControllerBTStack *)self _connectDeviceCompleteRequest:v7 error:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v4);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  int v9 = [(NSMutableSet *)self->_modifyDeviceRequests allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v38;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
        id v14 = CBErrorF();
        [(CBStackControllerBTStack *)self _modifyDeviceCompleteRequest:v13 error:v14];
      }
      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v10);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = [(NSMutableSet *)self->_performDeviceRequests allObjects];
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * (void)k);
        uint64_t v20 = CBErrorF();
        [(CBStackControllerBTStack *)self _completePerformDeviceRequest:v19 error:v20];
      }
      id v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v16);
  }

  [(CBStackControllerBTStack *)self _pairingAgentTearDown];
  btSessionHandle = self->_btSessionHandle;
  if (btSessionHandle)
  {
    if (qword_1009F8168 != -1) {
      dispatch_once(&qword_1009F8168, &stru_100999A58);
    }
    int v22 = sub_10000A678(qword_1009F8160, (unint64_t)btSessionHandle);
    if (v22
      && v22 != -310000
      && dword_1009F8660 <= 90
      && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      id v32 = CUPrintErrorCode();
      LogPrintF_safe();
    }
  }
  int powerStateNotifyToken = self->_powerStateNotifyToken;
  if (powerStateNotifyToken != -1)
  {
    notify_cancel(powerStateNotifyToken);
    self->_int powerStateNotifyToken = -1;
  }
  self->_btSessionHandle = 0;
  self->_btSessionPtr = 0;
  id controllerDataChangedHandler = self->_controllerDataChangedHandler;
  self->_id controllerDataChangedHandler = 0;

  id discoverableStateChangedHandler = self->_discoverableStateChangedHandler;
  self->_id discoverableStateChangedHandler = 0;

  id inquiryStateChangedHandler = self->_inquiryStateChangedHandler;
  self->_id inquiryStateChangedHandler = 0;

  uint64_t v27 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id powerChangedHandler = self->_powerChangedHandler;
  self->_id powerChangedHandler = 0;

  id relayMessageHandler = self->_relayMessageHandler;
  self->_id relayMessageHandler = 0;

  id v31 = (void *)qword_1009FC178;
  qword_1009FC178 = 0;

  if (v27) {
    v27[2](v27);
  }
}

- (void)_accessoryCommandStatusWithDevice:(id)a3 type:(int)a4 result:(unsigned __int16)a5 reason:(unsigned __int16)a6
{
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  id v8 = a3;
  if (a4 == 1 && self->_addedController)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v9 = [(NSMutableSet *)self->_modifyDeviceRequests allObjects];
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v13 device];
          unsigned __int8 v15 = [v14 isEquivalentToCBDevice:v8 compareFlags:8];

          if (v15)
          {
            if (v20 | v19)
            {
              uint64_t v17 = v19;
              uint64_t v18 = v20;
              id v16 = CBErrorF();
            }
            else
            {
              id v16 = 0;
            }
            -[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:](self, "_modifyDeviceCompleteRequest:error:", v13, v16, v17, v18);
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
}

- (void)_accessoryReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  uint64_t v8 = a3;
  id v14 = a4;
  id v10 = a5;
  id v11 = a6;
  if (self->_addedController)
  {
    id v12 = objc_retainBlock(self->_relayMessageHandler);
    uint64_t v13 = v12;
    if (v12) {
      (*((void (**)(id, id, id, uint64_t, id))v12 + 2))(v12, v10, v11, v8, v14);
    }
  }
}

- (void)_btDeviceWithID:(id)a3 error:(id *)a4
{
  return [(CBStackControllerBTStack *)self _btDeviceWithID:a3 createIfNeeded:0 error:a4];
}

- (void)_btDeviceWithID:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v7)
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    if (v8)
    {
      if (qword_1009F7EE0 != -1) {
        dispatch_once(&qword_1009F7EE0, &stru_100999B38);
      }
      uint64_t v9 = sub_100030DCC((uint64_t)off_1009F7ED8, v8, 0);
      if (v9)
      {
        if (qword_1009F7F00 != -1) {
          dispatch_once(&qword_1009F7F00, &stru_100999B58);
        }
        id v10 = (void *)sub_100030F10((uint64_t)off_1009F7EF8, v9, v6);
        if (v10) {
          goto LABEL_15;
        }
        if (a5) {
          goto LABEL_25;
        }
LABEL_26:
        id v10 = 0;
        goto LABEL_15;
      }
      if (!a5) {
        goto LABEL_26;
      }
    }
    else
    {
      [v7 UTF8String];
      if (TextToHardwareAddress())
      {
        if (!a5) {
          goto LABEL_26;
        }
      }
      else
      {
        if (qword_1009F7F00 != -1) {
          dispatch_once(&qword_1009F7F00, &stru_100999B58);
        }
        id v10 = (void *)sub_100030F10((uint64_t)off_1009F7EF8, 0, v6);
        if (v10) {
          goto LABEL_15;
        }
        if (!a5) {
          goto LABEL_26;
        }
      }
    }
LABEL_25:
    CBErrorF();
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  if (a5)
  {
    CBErrorF();
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)_btUUIDWithID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  if (v6)
  {
    id v7 = v6;
    goto LABEL_8;
  }
  [v5 UTF8String];
  if (TextToHardwareAddress())
  {
    if (a4)
    {
      CBErrorF();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = 0;
LABEL_15:
      *a4 = v11;
      goto LABEL_8;
    }
    id v7 = 0;
  }
  else
  {
    v12[0] = 0;
    v12[1] = 0;
    if (qword_1009F7EE0 != -1) {
      dispatch_once(&qword_1009F7EE0, &stru_100999B38);
    }
    sub_100014B58((uint64_t)off_1009F7ED8, 0, 0, 1u, 0, 0, (unsigned __int8 *)v12);
    id v8 = sub_100031234((const unsigned __int8 *)v12);
    id v7 = v8;
    if (v8)
    {
      id v9 = v8;
      goto LABEL_8;
    }
    if (a4)
    {
      CBErrorF();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
LABEL_8:

  return v7;
}

- (BOOL)connectDevice:(id)a3 connectionFlags:(unsigned int)a4 serviceFlags:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    id v11 = [v10 identifier];
    id v12 = [(CBStackControllerBTStack *)self _btDeviceWithID:v11 createIfNeeded:(a4 >> 5) & 1 error:a6];
    uint64_t v13 = (uint64_t)v12;
    if (v12)
    {
      sub_1004859E0((uint64_t)v12, (a4 & 4) != 0);
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100999B78);
      }
      sub_1002AF9A4((uint64_t)off_1009F8098, v13, (a4 & 4) != 0);
      if (a4) {
        sub_100485998(v13, 1);
      }
      if ((a4 & 8) != 0)
      {
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        sub_10028BCF8((uint64_t)off_1009F8098, v13, 1);
      }
      if ((a4 & 0x10) != 0)
      {
        sub_10004191C(&__str, "");
        *(unsigned char *)(v13 + 1435) = 1;
        std::string::operator=((std::string *)(v13 + 1480), &__str);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
      }
      if (qword_1009F8090 != -1) {
        dispatch_once(&qword_1009F8090, &stru_100999AB8);
      }
      memset(&__str, 0, sizeof(__str));
      int v14 = sub_1004D2DCC((int64x2_t *)off_1009F8088, v13, a5, &__str, 2);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      if (!v14)
      {
        BOOL v15 = 1;
LABEL_22:

        goto LABEL_23;
      }
      if (a6)
      {
        CBErrorF();
        BOOL v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if (a6)
  {
    CBErrorF();
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_23:

  return v15;
}

- (void)connectWithCBConnection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v39 = 0;
  long long v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_10004CF4C;
  long long v43 = sub_10004CD78;
  id v44 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000C1CDC;
  v36[3] = &unk_100999658;
  long long v38 = &v39;
  id v7 = v30;
  id v37 = v7;
  id v31 = objc_retainBlock(v36);
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v29 = v6;
    LogPrintF_safe();
  }
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    id v8 = [v6 peerDevice];
    id v9 = [v8 identifier];

    if (v9 && (int v10 = [v6 serviceFlags]) != 0)
    {
      id v11 = v40;
      id obj = v40[5];
      id v12 = [(CBStackControllerBTStack *)self _btDeviceWithID:v9 error:&obj];
      objc_storeStrong(v11 + 5, obj);
      if (v12)
      {
        unsigned int v13 = [v6 connectionFlags];
        __int16 v14 = v13;
        int v15 = (v13 >> 2) & 1;
        sub_1004859E0((uint64_t)v12, (v13 & 4) != 0);
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        sub_1002AF9A4((uint64_t)off_1009F8098, (uint64_t)v12, v15);
        if (v14) {
          sub_100485998((uint64_t)v12, 1);
        }
        if ((v14 & 8) != 0)
        {
          if (qword_1009F80A0 != -1) {
            dispatch_once(&qword_1009F80A0, &stru_100999B78);
          }
          sub_10028BCF8((uint64_t)off_1009F8098, (uint64_t)v12, 1);
        }
        if ((v14 & 0x10) != 0)
        {
          sub_10004191C(&__str, "");
          v12[1435] = 1;
          std::string::operator=((std::string *)(v12 + 1480), &__str);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
        }
        memset(&__str, 0, sizeof(__str));
        sub_10004191C(&__str, "Unknown");
        id v16 = [v6 clientBundleID];
        id v17 = [v16 length];

        if (v17)
        {
          id v18 = [v6 clientBundleID];
          sub_10004191C(&v33, (char *)[v18 UTF8String]);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          std::string __str = v33;
          *((unsigned char *)&v33.__r_.__value_.__s + 23) = 0;
          v33.__r_.__value_.__s.__data_[0] = 0;
        }
        if ((v14 & 0x400) != 0 && sub_100478B2C((uint64_t)v12, 21)) {
          sub_10048C6D4((uint64_t)v12, 0);
        }
        if (qword_1009F8090 != -1) {
          dispatch_once(&qword_1009F8090, &stru_100999AB8);
        }
        int v19 = sub_1004D2DCC((int64x2_t *)off_1009F8088, (uint64_t)v12, v10, &__str, 2);
        if (v19 && v19 != -310000)
        {
          uint64_t v28 = CBErrorF();
          uint64_t v20 = (CBStackConnectDeviceRequest *)v40[5];
          v40[5] = (id)v28;
        }
        else
        {
          uint64_t v20 = objc_alloc_init(CBStackConnectDeviceRequest);
          [(CBStackConnectDeviceRequest *)v20 setCompletionHandler:v7];
          [(CBStackConnectDeviceRequest *)v20 setConnection:v6];
          [(CBStackConnectDeviceRequest *)v20 setStartTicks:mach_absolute_time()];
          long long v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
          [(CBStackConnectDeviceRequest *)v20 setTimer:v21];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_1000C1DD0;
          handler[3] = &unk_100999680;
          handler[4] = v21;
          void handler[5] = v20;
          handler[6] = self;
          dispatch_source_set_event_handler(v21, handler);
          [v6 connectTimeoutSeconds];
          CUDispatchTimerSet();
          dispatch_activate(v21);
          connectDeviceRequests = self->_connectDeviceRequests;
          if (!connectDeviceRequests)
          {
            long long v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
            long long v24 = self->_connectDeviceRequests;
            self->_connectDeviceRequests = v23;

            connectDeviceRequests = self->_connectDeviceRequests;
          }
          -[NSMutableSet addObject:](connectDeviceRequests, "addObject:", v20, v29);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
      }
    }
    else
    {
      uint64_t v26 = CBErrorF();
      id v27 = v40[5];
      v40[5] = (id)v26;
    }
  }
  else
  {
    uint64_t v25 = CBErrorF();
    id v9 = v40[5];
    v40[5] = (id)v25;
  }

  ((void (*)(void *))v31[2])(v31);
  _Block_object_dispose(&v39, 8);
}

- (void)_connectDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v7 = [v16 connection];
    id v8 = CUPrintNSError();
    mach_absolute_time();
    [v16 startTicks];
    __int16 v14 = v8;
    uint64_t v15 = UpTicksToMilliseconds();
    unsigned int v13 = v7;
    LogPrintF_safe();
  }
  id v9 = [v16 timer:v13 interval:v14 repeats:v15];
  int v10 = v16;
  if (v9)
  {
    dispatch_source_cancel(v9);
    [v16 setTimer:0];
    int v10 = v16;
  }
  uint64_t v11 = [v10 completionHandler];
  id v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    [v16 setCompletionHandler:0];
  }
  [(NSMutableSet *)self->_connectDeviceRequests removeObject:v16];
}

- (void)_connectDeviceUpdateRequests:(id)a3 btResult:(int)a4
{
  id v6 = a3;
  if (self->_addedController)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    [(NSMutableSet *)self->_connectDeviceRequests allObjects];
    id v16 = self;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 connection];
          id v12 = [v11 peerDevice];
          if ([v12 isEquivalentToCBDevice:v6 compareFlags:8])
          {
            if (a4)
            {
              unsigned int v13 = CBErrorF();
              [(CBStackControllerBTStack *)v16 _connectDeviceCompleteRequest:v10 error:v13];
            }
            else
            {
              unsigned int v14 = [v11 serviceFlags];
              unsigned int v15 = [v6 supportedServices];
              if ((v15 & v14 & ~[v6 connectedServices]) == 0) {
                [(CBStackControllerBTStack *)v16 _connectDeviceCompleteRequest:v10 error:0];
              }
            }
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

- (id)diagnosticControl:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "iStr");
  if (string) {
    id v6 = string;
  }
  else {
    id v6 = "";
  }
  if (!strcasecmp(v6, "aop-read-debug"))
  {
    uint64_t v8 = (void *)CUXPCCreateCFObjectFromXPCObject();
    if (v8)
    {
      unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
      if (qword_1009F85E8 != -1) {
        dispatch_once(&qword_1009F85E8, &stru_100999B98);
      }
      id v38 = 0;
      uint64_t v10 = sub_1003C68E0(qword_1009F85E0, Int64Ranged, &v38);
      id v11 = v38;
      if (v10)
      {
        id v7 = +[NSString stringWithFormat:@"### AOPInterfaceManager::getInstance()->getReport() BTResult %d", v10];
      }
      else
      {
        id v37 = 0;
        unsigned int v13 = +[NSJSONSerialization dataWithJSONObject:v11 options:0 error:&v37];
        id v14 = v37;
        unsigned int v15 = v14;
        if (v14)
        {
          id v7 = [v14 description];
        }
        else
        {
          id v7 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v13 encoding:4];
          if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
        }
      }
    }
    else
    {
      id v7 = @"### Convert params failed";
    }

    goto LABEL_72;
  }
  if (!strcasecmp(v6, "aop-write-debug"))
  {
    id v12 = (void *)CUXPCCreateCFObjectFromXPCObject();
    if (v12)
    {
      if (qword_1009F85E8 != -1) {
        dispatch_once(&qword_1009F85E8, &stru_100999B98);
      }
      sub_1003C5CB4(qword_1009F85E0, v12);
      id v7 = &stru_1009C1AC8;
    }
    else
    {
      id v7 = @"### Convert params failed";
    }

    goto LABEL_72;
  }
  if (!strcasecmp(v6, "coredump"))
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    if (qword_1009F8070 != -1) {
      dispatch_once(&qword_1009F8070, &stru_100999A78);
    }
    long long v23 = off_1009F8068;
    sub_10004191C(&v36, "");
    sub_1004E258C((uint64_t)v23, 3703, &v36);
  }
  if (!strcasecmp(v6, "crash-FE"))
  {
    LOBYTE(v34) = 0;
    sub_10001B8E0(&v34);
    id result = (id)sub_10010B394(4004);
LABEL_88:
    __break(1u);
    return result;
  }
  if (!strcasecmp(v6, "crash-RC"))
  {
    LOBYTE(v34) = 0;
    sub_10001B8E0(&v34);
    sub_10010B844(4058, "Test Context");
  }
  if (!strcasecmp(v6, "crash-sim"))
  {
    _os_log_pack_size();
    __chkstk_darwin();
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = v6;
    os_log_t v17 = os_log_create("com.apple.bluetooth", "CBCrash");
    qword_1009FC078 = os_log_pack_send_and_compose();
    os_fault_with_payload();

LABEL_55:
    id v7 = &stru_1009C1AC8;
    goto LABEL_72;
  }
  if (!strcasecmp(v6, "crash"))
  {
    _os_log_pack_size();
    __chkstk_darwin();
    __error();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = v6;
    os_log_create("com.apple.bluetooth", "CBCrash");
    qword_1009FC078 = os_log_pack_send_and_compose();
    id result = (id)abort_with_payload();
    goto LABEL_88;
  }
  if (!stricmp_prefix())
  {
    unsigned __int16 v35 = 0;
    unsigned int v34 = 0;
    if (stricmp_prefix())
    {
      RandomBytes();
    }
    else if (TextToHardwareAddress())
    {
      id v7 = @"Bad Bluetooth address";
      goto LABEL_72;
    }
    uint64_t v26 = sub_100052E70();
    (*(void (**)(uint64_t, unint64_t, uint64_t, const __CFString *, const __CFString *))(*(void *)v26 + 144))(v26, v34 | ((unint64_t)v35 << 32), 8206, @"Fake Accessory", @"Fake Version");
    goto LABEL_55;
  }
  if (!strcasecmp(v6, "gapa"))
  {
    long long v18 = (void *)CUXPCCreateCFObjectFromXPCObject();
    if (v18)
    {
      CFStringGetTypeID();
      long long v19 = CFDictionaryGetTypedValue();
      if (v19)
      {
        long long v20 = [(CBStackControllerBTStack *)self _btDeviceWithID:v19 error:0];
        if (v20)
        {
          int v21 = CFDictionaryGetInt64Ranged();
          int v22 = CFDictionaryGetInt64Ranged();
          sub_10047ED44((uint64_t)v20, v21, v22);
LABEL_65:
          id v7 = &stru_1009C1AC8;
LABEL_66:

LABEL_67:
          goto LABEL_72;
        }
LABEL_81:
        id v7 = @"### Device not found";
        goto LABEL_66;
      }
LABEL_80:
      id v7 = @"### No device ID";
      goto LABEL_66;
    }
LABEL_79:
    id v7 = @"### Convert params failed";
    goto LABEL_67;
  }
  if (!strcasecmp(v6, "mp-error"))
  {
    long long v18 = (void *)CUXPCCreateCFObjectFromXPCObject();
    if (v18)
    {
      CFStringGetTypeID();
      long long v19 = CFDictionaryGetTypedValue();
      if (v19)
      {
        long long v24 = [(CBStackControllerBTStack *)self _btDeviceWithID:v19 error:0];
        if (v24)
        {
          int v25 = CFDictionaryGetInt64Ranged();
          if ((v25 - 8) < 0xFFFFFFF9)
          {
            id v7 = @"### Invalid status";
            goto LABEL_66;
          }
          if (qword_1009F8080 != -1) {
            dispatch_once(&qword_1009F8080, &stru_100999BB8);
          }
          sub_10049A448((uint64_t)off_1009F8078, (uint64_t)v24, v25);
          goto LABEL_65;
        }
        goto LABEL_81;
      }
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  if (!strcasecmp(v6, "mp-keys-reset"))
  {
    long long v18 = (void *)CUXPCCreateCFObjectFromXPCObject();
    if (v18)
    {
      CFStringGetTypeID();
      long long v19 = CFDictionaryGetTypedValue();
      if (v19)
      {
        id v27 = [(CBStackControllerBTStack *)self _btDeviceWithID:v19 error:0];
        if (v27)
        {
          if (qword_1009F8080 != -1) {
            dispatch_once(&qword_1009F8080, &stru_100999BB8);
          }
          uint64_t v28 = sub_1004979F4((uint64_t)off_1009F8078, (uint64_t)v27);
          if (!v28)
          {
            id v7 = @"### Magic Paired Device not found";
            goto LABEL_66;
          }
          if (qword_1009F8080 != -1) {
            dispatch_once(&qword_1009F8080, &stru_100999BB8);
          }
          sub_1004997A8((uint64_t)off_1009F8078, (uint64_t)v28);
          goto LABEL_65;
        }
        goto LABEL_81;
      }
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  if (!stricmp_prefix())
  {
    uint64_t v30 = sub_100017768();
    sub_10004191C(v32, "btutil manual stackshot");
    sub_1005C9A14(v30, (uint64_t *)v32, 3172327085);
    if (v33 < 0) {
      operator delete(v32[0]);
    }
    goto LABEL_55;
  }
  NSPrintF_safe();
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_72:

  return v7;
}

- (BOOL)disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    id v9 = [v8 identifier];
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 caseInsensitiveCompare:@"all"])
      {
        BOOL v11 = [(CBStackControllerBTStack *)self _disconnectDevice:v8 serviceFlags:v6 error:a5];
      }
      else
      {
        [(CBStackControllerBTStack *)self _disconnectAllDevicesWithServiceFlags:v6];
        BOOL v11 = 1;
      }
    }
    else if (a5)
    {
      CBErrorF();
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else if (a5)
  {
    CBErrorF();
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_disconnectAllDevicesWithServiceFlags:(unsigned int)a3
{
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  __p = 0;
  long long v23 = 0;
  uint64_t v24 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  int v4 = sub_1004B55C0((uint64_t)off_1009F7EA8, &__p);
  if (v4) {
    BOOL v5 = v4 == -310000;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = CUPrintErrorCode();
    LogPrintF_safe();
  }
  uint64_t v6 = (uint64_t *)__p;
  id v7 = v23;
  if (__p != v23)
  {
    do
    {
      uint64_t v8 = *v6;
      if (qword_1009F8090 != -1) {
        dispatch_once(&qword_1009F8090, &stru_100999AB8);
      }
      sub_1004D76C0((uint64_t)off_1009F8088, v8, a3);
      if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        sub_100474E18(v8, v26);
        id v9 = CUPrintErrorCode();
        LogPrintF_safe();

        if (v27 < 0) {
          operator delete(v26[0]);
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  if (qword_1009F7EC0 != -1) {
    dispatch_once(&qword_1009F7EC0, &stru_100999BD8);
  }
  uint64_t v10 = sub_10004034C((uint64_t)off_1009F7EB8);
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
        if (qword_1009F7EC0 != -1) {
          dispatch_once(&qword_1009F7EC0, &stru_100999BD8);
        }
        unsigned int v15 = off_1009F7EB8;
        sub_1000305AC(v26, v14);
        sub_100683CFC((uint64_t)v15, (unsigned __int8 *)v26, 2u);
        if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          os_log_t v17 = CUPrintErrorCode();
          LogPrintF_safe();
        }
        unsigned int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v11);
  }

  if (__p)
  {
    long long v23 = (uint64_t *)__p;
    operator delete(__p);
  }
}

- (BOOL)_disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 identifier];
  if (v9)
  {
    uint64_t v10 = [(CBStackControllerBTStack *)self _btDeviceWithID:v9 error:0];
    uint64_t v11 = (uint64_t)v10;
    if (v10 && sub_1004764A0((uint64_t)v10))
    {
      if (qword_1009F8090 != -1) {
        dispatch_once(&qword_1009F8090, &stru_100999AB8);
      }
      int v12 = sub_1004D76C0((uint64_t)off_1009F8088, v11, a4);
      if (v12) {
        int v13 = v12 + 310000;
      }
      else {
        int v13 = 0;
      }
      if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        CUPrintErrorCode();
        id v29 = v28 = v8;
        LogPrintF_safe();
      }
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
      int v13 = 1;
    }
    unsigned int v15 = -[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v9, 0, v28, v29);
    if (!v15) {
      goto LABEL_27;
    }
    if (qword_1009F7EC0 != -1) {
      dispatch_once(&qword_1009F7EC0, &stru_100999BD8);
    }
    uint64_t v16 = off_1009F7EB8;
    sub_1000305AC(v32, v15);
    if (sub_1000307A4((uint64_t)v16, v32))
    {
      if (qword_1009F7EC0 != -1) {
        dispatch_once(&qword_1009F7EC0, &stru_100999BD8);
      }
      os_log_t v17 = off_1009F7EB8;
      sub_1000305AC(v32, v15);
      int v18 = sub_100683CFC((uint64_t)v17, v32, 2u);
      if (v18) {
        int v19 = v18 + 310000;
      }
      else {
        int v19 = 0;
      }
      if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v30 = CUPrintErrorCode();
        LogPrintF_safe();
      }
      int v21 = 1;
    }
    else
    {
LABEL_27:
      if (v11) {
        char v20 = v14;
      }
      else {
        char v20 = 1;
      }
      if ((v20 & 1) == 0)
      {
        v32[0] = 0;
        sub_10001B8E0(v32);
        int v22 = sub_10017C380(v11 + 128);
        sub_10001B910(v32);
        if (v22) {
          int v23 = v22 + 330000;
        }
        else {
          int v23 = 0;
        }
        if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v31 = CUPrintErrorCode();
          LogPrintF_safe();
        }
        sub_10001B8AC(v32);
        if (v23) {
          goto LABEL_51;
        }
        goto LABEL_55;
      }
      if ((v14 & 1) == 0)
      {
LABEL_51:
        CBErrorF();
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = v25 != 0;
        if (a5 && v25)
        {
          id v25 = v25;
          *a5 = v25;
          LOBYTE(v23) = 1;
        }
        goto LABEL_56;
      }
      int v21 = 0;
      int v19 = 1;
    }
    if (v13) {
      char v24 = v14;
    }
    else {
      char v24 = 0;
    }
    if (v24) {
      goto LABEL_51;
    }
    if (!v19) {
      int v21 = 0;
    }
    if (v21 == 1) {
      goto LABEL_51;
    }
    LOBYTE(v23) = 0;
LABEL_55:
    id v25 = 0;
LABEL_56:

    char v26 = v23 ^ 1;
    goto LABEL_57;
  }
  if (a5)
  {
    CBErrorF();
    char v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v26 = 0;
  }
LABEL_57:

  return v26;
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    id v7 = [v6 identifier];
    id v8 = v7;
    if (v7)
    {
      if ([v7 caseInsensitiveCompare:@"all"])
      {
        BOOL v9 = [(CBStackControllerBTStack *)self _deleteDevice:v6 error:a4];
      }
      else
      {
        [(CBStackControllerBTStack *)self _deleteAllDevices];
        BOOL v9 = 1;
      }
    }
    else if (a4)
    {
      CBErrorF();
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else if (a4)
  {
    CBErrorF();
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_deleteAllDevices
{
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v25 = 0;
  char v26 = 0;
  uint64_t v27 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  int v2 = sub_1004B54C0((uint64_t)off_1009F7EA8, (uint64_t **)&v25);
  if (v2) {
    BOOL v3 = v2 == -310000;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    int v13 = CUPrintErrorCode();
    LogPrintF_safe();
  }
  int v4 = (unsigned __int8 **)v25;
  BOOL v5 = v26;
  if (v25 != v26)
  {
    do
    {
      id v6 = *v4;
      if (qword_1009F8768 != -1) {
        dispatch_once(&qword_1009F8768, &stru_100999BF8);
      }
      sub_100611000((uint64_t)off_1009F8760, v6);
      if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        sub_100474E18((uint64_t)v6, &__p);
        id v7 = CUPrintErrorCode();
        LogPrintF_safe();

        if (SHIBYTE(v19) < 0) {
          operator delete(__p);
        }
      }
      ++v4;
    }
    while (v4 != v5);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_100999C18);
  }
  sub_10070CA20(qword_1009F7EC8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        __p = 0;
        p_p = &__p;
        uint64_t v19 = 0x2020000000;
        char v20 = 0;
        if (qword_1009F7EE0 != -1) {
          dispatch_once(&qword_1009F7EE0, &stru_100999B38);
        }
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000C3E20;
        v16[3] = &unk_100997508;
        v16[4] = &__p;
        if (sub_1006C4850((uint64_t)off_1009F7ED8, v11, v16) && !*((unsigned char *)p_p + 24))
        {
          if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
          uint64_t v12 = sub_100019878();
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000C3EB4;
          v15[3] = &unk_100997450;
          v15[4] = v11;
          sub_100013018(v12, v15);
        }
        _Block_object_dispose(&__p, 8);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v8);
  }

  if (v25)
  {
    char v26 = (unsigned __int8 **)v25;
    operator delete(v25);
  }
}

- (BOOL)_deleteDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  if (v7)
  {
    id v8 = [(CBStackControllerBTStack *)self _btDeviceWithID:v7 error:0];
    if (!v8) {
      goto LABEL_14;
    }
    if (qword_1009F8768 != -1) {
      dispatch_once(&qword_1009F8768, &stru_100999BF8);
    }
    if (sub_100610F9C((uint64_t)off_1009F8760, v8))
    {
      if (qword_1009F8768 != -1) {
        dispatch_once(&qword_1009F8768, &stru_100999BF8);
      }
      int v9 = sub_100611000((uint64_t)off_1009F8760, v8);
      if (v9) {
        int v10 = v9 + 310000;
      }
      else {
        int v10 = 0;
      }
      if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        CUPrintErrorCode();
        v20 = id v19 = v6;
        LogPrintF_safe();
      }
      int v11 = 1;
    }
    else
    {
LABEL_14:
      int v11 = 0;
      int v10 = 1;
    }
    uint64_t v12 = -[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v7, 0, v19, v20);
    if (!v12) {
      goto LABEL_24;
    }
    if (qword_1009F7ED0 != -1) {
      dispatch_once(&qword_1009F7ED0, &stru_100999C18);
    }
    if (sub_100008DC4(qword_1009F7EC8, v12))
    {
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      uint64_t v13 = sub_100019878();
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000C426C;
      v21[3] = &unk_100997450;
      v21[4] = v12;
      sub_100013018(v13, v21);
    }
    else
    {
LABEL_24:
      if ((v11 & 1) == 0) {
        goto LABEL_32;
      }
    }
    if (v10) {
      int v14 = v11;
    }
    else {
      int v14 = 0;
    }
    if (v14 != 1)
    {
      BOOL v16 = 0;
      id v15 = 0;
LABEL_36:
      BOOL v17 = !v16;

      goto LABEL_37;
    }
LABEL_32:
    CBErrorF();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v16 = v15 != 0;
    if (a4 && v15)
    {
      id v15 = v15;
      *a4 = v15;
      BOOL v16 = 1;
    }
    goto LABEL_36;
  }
  if (a4)
  {
    CBErrorF();
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_37:

  return v17;
}

- (id)getDevicesWithFlags:(unsigned int)a3 error:(id *)a4
{
  char v52 = a3;
  id v49 = objc_alloc_init((Class)NSMutableArray);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_100999C18);
  }
  int v4 = sub_10070CA20(qword_1009F7EC8);
  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v58 objects:v77 count:16];
  if (v5)
  {
    uint64_t v51 = *(void *)v59;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v6);
        uint64_t v73 = 0;
        v74 = &v73;
        uint64_t v75 = 0x2020000000;
        uint64_t v76 = 0;
        __p.n128_u64[0] = 0;
        __p.n128_u64[1] = (unint64_t)&__p;
        uint64_t v69 = 0x3032000000;
        long long v70 = sub_10004CF4C;
        id v71 = sub_10004CD78;
        id v72 = 0;
        if (qword_1009F7EE0 != -1) {
          dispatch_once(&qword_1009F7EE0, &stru_100999B38);
        }
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1000C4E84;
        v57[3] = &unk_1009996A8;
        v57[4] = &v73;
        v57[5] = &__p;
        if (sub_1006C4850((uint64_t)off_1009F7ED8, v7, v57))
        {
          id v8 = objc_alloc_init((Class)CBDevice);
          int v9 = [v7 UUIDString];
          [v8 setIdentifier:v9];

          [v8 setName:*(void *)(__p.n128_u64[1] + 40)];
          uint64_t v10 = v74[3];
          LOBYTE(v62) = BYTE5(v10);
          BYTE1(v62) = BYTE4(v10);
          BYTE2(v62) = BYTE3(v10);
          BYTE3(v62) = BYTE2(v10);
          BYTE4(v62) = BYTE1(v10);
          BYTE5(v62) = v10;
          id v11 = [objc_alloc((Class)NSData) initWithBytes:&v62 length:6];
          [v8 setBtAddressData:v11];

          if ((v52 & 2) != 0)
          {
            if (qword_1009F7EE0 != -1) {
              dispatch_once(&qword_1009F7EE0, &stru_100999B38);
            }
            uint64_t v12 = off_1009F7ED8;
            uint64_t v13 = sub_1006C6EEC((uint64_t)off_1009F7ED8, v7);
            if ([v13 length])
            {
              int v14 = sub_1006C69A0((uint64_t)v12, v13);
              if (v14)
              {
                if (sub_1006C6FB8((uint64_t)v12, v14) == 2)
                {
                  id v15 = [v14 UUIDString];
                  [v8 setFindMyCaseIdentifier:v15];
                }
                BOOL v16 = sub_1006C6DAC((uint64_t)v12, v14);
                BOOL v17 = v16;
                if (v16)
                {
                  int v18 = [v16 UUIDString];
                  [v8 setFindMyGroupIdentifier:v18];
                }
              }
            }
          }
          if (v52)
          {
            int v67 = 0;
            memset(v66, 0, sizeof(v66));
            long long v64 = 0u;
            long long v65 = 0u;
            long long v63 = 0u;
            if (qword_1009F7ED0 != -1) {
              dispatch_once(&qword_1009F7ED0, &stru_100999C18);
            }
            sub_10070FA68(qword_1009F7EC8, v7, (uint64_t)&v63);
            char v19 = v67;
            if ((v67 & 0x40) != 0)
            {
              id v20 = [objc_alloc((Class)NSData) initWithBytes:&v66[8] length:16];
              [v8 setIrkData:v20];

              char v19 = v67;
            }
            if (v19)
            {
              id v23 = objc_alloc((Class)NSData);
              id v22 = [v23 initWithBytes:&v63 length:v64];
              [v8 setLtkData:v22];
LABEL_32:
            }
            else if ((v19 & 8) != 0)
            {
              id v21 = objc_alloc((Class)NSData);
              id v22 = [v21 initWithBytes:(char *)&v64 + 12 length:BYTE12(v65)];
              [v8 setLtkData:v22];
              goto LABEL_32;
            }
          }
          [v49 addObject:v8];
        }
        _Block_object_dispose(&__p, 8);

        _Block_object_dispose(&v73, 8);
        id v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      int v4 = obj;
      id v5 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
    }
    while (v5);
  }

  long long v63 = 0uLL;
  *(void *)&long long v64 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_100999AD8);
  }
  int v24 = sub_1004B54C0((uint64_t)off_1009F7EA8, (uint64_t **)&v63);
  if (v24
    && v24 != -310000
    && dword_1009F8660 <= 90
    && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    v48 = CUPrintErrorCode();
    LogPrintF_safe();
  }
  id v25 = (uint64_t *)v63;
  if ((void)v63 != *((void *)&v63 + 1))
  {
    char v26 = (uint64_t *)*((void *)&v63 + 1);
    do
    {
      uint64_t v27 = *v25;
      int v55 = *(_DWORD *)(*v25 + 128);
      __int16 v56 = *(_WORD *)(v27 + 132);
      uint64_t v73 = 0;
      v74 = 0;
      if (qword_1009F7EE0 != -1) {
        dispatch_once(&qword_1009F7EE0, &stru_100999B38);
      }
      sub_100014B58((uint64_t)off_1009F7ED8, ((unint64_t)v55 << 40) | ((unint64_t)BYTE1(v55) << 32) | ((unint64_t)BYTE2(v55) << 24) | ((unint64_t)HIBYTE(v55) << 16) | ((unint64_t)v56 << 8) | HIBYTE(v56), 1u, 1u, 0, 0, (unsigned __int8 *)&v73);
      id v28 = sub_100031234((const unsigned __int8 *)&v73);
      if (v28)
      {
        uint64_t v53 = 0;
        uint64_t v54 = 0;
        BOOL v29 = sub_10047B7A8(v27, (_DWORD *)&v54 + 1, &v54, (_DWORD *)&v53 + 1, &v53);
        id v30 = objc_alloc_init((Class)CBDevice);
        [v30 setColorInfo:(unsigned __int16)sub_100489318(v27)];
        uint64_t v31 = [v28 UUIDString];
        [v30 setIdentifier:v31];

        sub_100475EE0(v27, (uint64_t)&__p);
        if (v69 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = (__n128 *)__p.n128_u64[0];
        }
        char v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p, v48);
        [v30 setName:v33];

        if (SHIBYTE(v69) < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
        if (v29) {
          uint64_t v34 = HIDWORD(v53);
        }
        else {
          uint64_t v34 = 0;
        }
        [v30 setProductID:v34];
        id v35 = [objc_alloc((Class)NSData) initWithBytes:&v55 length:6];
        [v30 setBtAddressData:v35];

        if ((v52 & 2) != 0)
        {
          __n128 __p = 0uLL;
          uint64_t v69 = 0;
          sub_10047FF14(v27, (uint64_t)&__p);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3) < 4)
          {
            id v37 = 0;
          }
          else
          {
            long long v36 = (void *)(__p.n128_u64[0] + 72);
            if (*(char *)(__p.n128_u64[0] + 95) < 0) {
              long long v36 = (void *)*v36;
            }
            id v37 = +[NSString stringWithUTF8String:v36];
          }
          if ([v37 length])
          {
            if (qword_1009F7EE0 != -1) {
              dispatch_once(&qword_1009F7EE0, &stru_100999B38);
            }
            id v38 = off_1009F7ED8;
            uint64_t v39 = sub_1006C69A0((uint64_t)off_1009F7ED8, v37);
            if (v39)
            {
              if (sub_1006C6FB8((uint64_t)v38, v39) == 2)
              {
                long long v40 = [v39 UUIDString];
                [v30 setFindMyCaseIdentifier:v40];
              }
              uint64_t v41 = sub_1006C6DAC((uint64_t)v38, v39);
              long long v42 = v41;
              if (v41)
              {
                long long v43 = [v41 UUIDString];
                [v30 setFindMyGroupIdentifier:v43];
              }
            }
          }
          long long v62 = &__p;
          sub_100051568((void ***)&v62);
        }
        if (v52)
        {
          __n128 __p = 0uLL;
          LODWORD(v69) = 0;
          sub_100600E3C((uint64_t)&__p);
          if (qword_1009F8778 != -1) {
            dispatch_once(&qword_1009F8778, &stru_100999C38);
          }
          if (!sub_100618630((uint64_t)off_1009F8770, (unsigned __int8 *)v27, &__p))
          {
            id v44 = objc_alloc((Class)NSData);
            uint64_t v45 = nullsub_95(&__p);
            id v46 = [v44 initWithBytes:v45 length:sub_100600EDC()];
            [v30 setLinkKeyData:v46];
          }
          nullsub_95(&__p);
        }
        [v49 addObject:v30];
      }
      ++v25;
    }
    while (v25 != v26);
  }
  if ((void)v63)
  {
    *((void *)&v63 + 1) = v63;
    operator delete((void *)v63);
  }

  return v49;
}

- (void)localDeviceEvent:(int)a3
{
  switch(a3)
  {
    case 0:
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        [(CBStackControllerBTStack *)self powerState];
        LogPrintF_safe();
      }
      id v6 = (void (**)(void))objc_retainBlock(self->_controllerDataChangedHandler);
      if (v6) {
        v6[2](v6);
      }

      id v7 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v7) {
        v7[2](v7);
      }

      id v8 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v8) {
        v8[2](v8);
      }

      id v5 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (!v5) {
        goto LABEL_34;
      }
      goto LABEL_33;
    case 2:
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        [(CBStackControllerBTStack *)self discoverableState];
        LogPrintF_safe();
      }
      int v4 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v4) {
        goto LABEL_38;
      }
      goto LABEL_39;
    case 6:
    case 7:
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        [(CBStackControllerBTStack *)self inquiryState];
        LogPrintF_safe();
      }
      int v4 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v4) {
LABEL_38:
      }
        v4[2](v4);
LABEL_39:

      break;
    case 10:
      if (qword_1009F8070 != -1) {
        dispatch_once(&qword_1009F8070, &stru_100999A78);
      }
      sub_1004E1EE0((uint64_t)off_1009F8068);
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v5 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (v5) {
LABEL_33:
      }
        v5[2](v5);
LABEL_34:

      notify_set_state(self->_powerStateNotifyToken, [(CBStackControllerBTStack *)self powerState]);
      notify_post("com.apple.bluetooth.state");
      break;
    default:
      return;
  }
}

- (BOOL)modifyDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CBDeviceSettings);
  [v7 setDoubleTapActionLeft:[v6 doubleTapActionLeft]];
  [v7 setDoubleTapActionRight:[v6 doubleTapActionRight]];
  [v7 setMicrophoneMode:[v6 microphoneMode]];
  [v7 setPlacementMode:[v6 placementMode]];
  [v7 setSmartRoutingMode:[v6 smartRoutingMode]];
  LOBYTE(a4) = [(CBStackControllerBTStack *)self modifyDevice:v6 settings:v7 error:a4];

  return (char)a4;
}

- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6
{
  id v34 = a3;
  id v35 = a4;
  id v32 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_10004CF4C;
  uint64_t v51 = sub_10004CD78;
  id v52 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000C5A8C;
  v44[3] = &unk_100999658;
  id v46 = &v47;
  id v9 = v32;
  id v45 = v9;
  char v33 = objc_retainBlock(v44);
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v31 = id v30 = v34;
    LogPrintF_safe();
  }
  uint64_t v10 = [v34 identifier:v30, v31, v32];
  id v11 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  uint64_t v12 = [(CBStackControllerBTStack *)self _btDeviceWithID:v10 error:&obj];
  objc_storeStrong(v11, obj);

  if (v12)
  {
    id v13 = [v35 count];
    unsigned __int8 v14 = v13;
    if ((unint64_t)v13 >= 0x100)
    {
      uint64_t v28 = CBErrorF();
      id v15 = (id)v48[5];
      v48[5] = v28;
    }
    else
    {
      id v15 = objc_alloc_init((Class)NSMutableData);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      BOOL v16 = (CBStackModifyDeviceRequest *)v35;
      id v17 = [(CBStackModifyDeviceRequest *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v40;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v16);
            }
            if (![*(id *)(*((void *)&v39 + 1) + 8 * i) UTF8String]
              || (v38 = 0, int v37 = 0, TextToHardwareAddress()))
            {
              uint64_t v26 = CBErrorF();
              uint64_t v27 = (void *)v48[5];
              v48[5] = v26;

              goto LABEL_23;
            }
            [v15 appendBytes:&v37 length:6];
          }
          id v17 = [(CBStackModifyDeviceRequest *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100999B78);
      }
      int v20 = sub_100288C00((uint64_t)off_1009F8098, (uint64_t)v12, 1, (int *)[v15 bytes], v14);
      if (v20 && v20 != -310000)
      {
        uint64_t v29 = CBErrorF();
        BOOL v16 = (CBStackModifyDeviceRequest *)v48[5];
        v48[5] = v29;
      }
      else
      {
        BOOL v16 = objc_alloc_init(CBStackModifyDeviceRequest);
        [(CBStackModifyDeviceRequest *)v16 setCompletionHandler:v9];
        [(CBStackModifyDeviceRequest *)v16 setDevice:v34];
        id v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        [(CBStackModifyDeviceRequest *)v16 setTimer:v21];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000C5B80;
        handler[3] = &unk_100999680;
        handler[4] = v21;
        void handler[5] = v16;
        handler[6] = self;
        dispatch_source_set_event_handler(v21, handler);
        CUDispatchTimerSet();
        dispatch_activate(v21);
        modifyDeviceRequests = self->_modifyDeviceRequests;
        if (!modifyDeviceRequests)
        {
          id v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          id v25 = self->_modifyDeviceRequests;
          p_modifyDeviceRequests = &self->_modifyDeviceRequests;
          *p_modifyDeviceRequests = v23;

          modifyDeviceRequests = *p_modifyDeviceRequests;
        }
        [(NSMutableSet *)modifyDeviceRequests addObject:v16];
      }
LABEL_23:
    }
  }
  ((void (*)(void *))v33[2])(v33);

  _Block_object_dispose(&v47, 8);
}

- (BOOL)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 error:(id *)a7
{
  char v8 = a6;
  int v9 = a5;
  id v12 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v14 = [v12 identifier];
  id v15 = [(CBStackControllerBTStack *)self _btDeviceWithID:v14 error:a7];

  if (!v15)
  {
    BOOL v19 = 0;
    goto LABEL_9;
  }
  BOOL v16 = [v13 identifier];
  id v17 = v16;
  if (v16)
  {
    __int16 v23 = 0;
    int v22 = 0;
    [v16 UTF8String];
    if (!TextToHardwareAddress())
    {
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100999B78);
      }
      int v18 = sub_10028B3D0((uint64_t)off_1009F8098, (uint64_t)v15, (uint64_t)&v22, v9, (v8 & 0x10) != 0);
      BOOL v19 = 1;
      if (!v18 || v18 == -310000) {
        goto LABEL_8;
      }
      if (a7)
      {
        id v21 = CBErrorF();
        goto LABEL_17;
      }
LABEL_18:
      BOOL v19 = 0;
      goto LABEL_8;
    }
    if (!a7) {
      goto LABEL_18;
    }
  }
  else if (!a7)
  {
    goto LABEL_18;
  }
  id v21 = CBErrorF();
LABEL_17:
  BOOL v19 = 0;
  *a7 = v21;
LABEL_8:

LABEL_9:
  return v19;
}

- (BOOL)modifyDevice:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 identifier];
  if (v10)
  {
    id v11 = [v8 idsDeviceID];
    if (v11)
    {
      id v12 = [v8 idsDeviceID];
      id v13 = [v12 length];

      if (v13)
      {
        uint64_t v37 = 0;
        __int16 v38 = &v37;
        uint64_t v39 = 0x3032000000;
        long long v40 = sub_10004CF4C;
        long long v41 = sub_10004CD78;
        id v42 = 0;
        if (qword_1009F7EE0 != -1) {
          dispatch_once(&qword_1009F7EE0, &stru_100999B38);
        }
        unsigned __int8 v14 = off_1009F7ED8;
        id v15 = [v8 idsDeviceID];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000C631C;
        v33[3] = &unk_1009996D0;
        v33[4] = self;
        id v34 = v8;
        id v35 = v9;
        long long v36 = &v37;
        char v16 = sub_1006C45B8((uint64_t)v14, v15, v33);

        if (v16)
        {
          id v17 = (void *)v38[5];
          if (!v17)
          {
            BOOL v18 = 1;
LABEL_9:

LABEL_20:
            _Block_object_dispose(&v37, 8);

            goto LABEL_21;
          }
          if (a5)
          {
            id v24 = v17;
            goto LABEL_28;
          }
        }
        else if (a5)
        {
          CBErrorF();
          id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
          BOOL v18 = 0;
          *a5 = v24;
          goto LABEL_9;
        }
        BOOL v18 = 0;
        goto LABEL_9;
      }
    }
    BOOL v19 = [(CBStackControllerBTStack *)self _btDeviceWithID:v10 error:0];
    if (v19)
    {
      BOOL v18 = [(CBStackControllerBTStack *)self modifyDevice:v8 btDevice:v19 settings:v9 error:a5];
      goto LABEL_21;
    }
    uint64_t v37 = 0;
    __int16 v38 = &v37;
    uint64_t v39 = 0x3032000000;
    long long v40 = sub_10004CF4C;
    long long v41 = sub_10004CD78;
    id v42 = 0;
    id obj = 0;
    int v20 = [(CBStackControllerBTStack *)self _btUUIDWithID:v10 error:&obj];
    objc_storeStrong(&v42, obj);
    if (!v20)
    {
      if (a5)
      {
        id v25 = (void *)v38[5];
        if (v25)
        {
          BOOL v18 = 0;
          *a5 = v25;
          goto LABEL_19;
        }
        CBErrorF();
        id v27 = objc_claimAutoreleasedReturnValue();
        *a5 = v27;
      }
      BOOL v18 = 0;
      goto LABEL_19;
    }
    if (qword_1009F7EE0 != -1) {
      dispatch_once(&qword_1009F7EE0, &stru_100999B38);
    }
    id v21 = off_1009F7ED8;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C6370;
    v28[3] = &unk_1009996D0;
    v28[4] = self;
    id v29 = v8;
    id v30 = v9;
    uint64_t v31 = &v37;
    if (sub_1006C4850((uint64_t)v21, v20, v28))
    {
      int v22 = (void *)v38[5];
      if (!v22)
      {
        BOOL v18 = 1;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      if (a5)
      {
        id v26 = v22;
        goto LABEL_38;
      }
    }
    else if (a5)
    {
      CBErrorF();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
      BOOL v18 = 0;
      *a5 = v26;
      goto LABEL_18;
    }
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if (a5)
  {
    CBErrorF();
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_21:

  return v18;
}

- (BOOL)modifyDevice:(id)a3 btDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = [v9 identifier];
  if (!v11)
  {
    if (a6) {
      goto LABEL_334;
    }
    goto LABEL_335;
  }
  if (qword_1009F7EF0 != -1) {
    dispatch_once(&qword_1009F7EF0, &stru_100999C58);
  }
  v150 = off_1009F7EE8;
  int v12 = [v10 aclPriority];
  if (v12)
  {
    uint64_t v13 = sub_10003FB34();
    if (((*(uint64_t (**)(uint64_t))(*(void *)v13 + 2720))(v13) & 1) == 0)
    {
      if (a6) {
        goto LABEL_334;
      }
      goto LABEL_335;
    }
    if (dword_1009F8660 > 30 || dword_1009F8660 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
    if (v12 <= 19)
    {
      if (v12 == 1)
      {
        unsigned __int8 v14 = "Default";
        goto LABEL_20;
      }
    }
    else
    {
      switch(v12)
      {
        case 20:
          unsigned __int8 v14 = "Low";
          goto LABEL_20;
        case 50:
          unsigned __int8 v14 = "Medium";
          goto LABEL_20;
        case 80:
          unsigned __int8 v14 = "High";
LABEL_20:
          v105 = v11;
          v121 = v14;
          LogPrintF_safe();
LABEL_21:
          uint64_t v15 = sub_10003FB34();
          uint64_t v16 = *((unsigned __int16 *)a4 + 66);
          uint64_t v17 = *((unsigned int *)a4 + 32);
          uint64_t v18 = sub_100476054((uint64_t)a4);
          int v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL, BOOL, uint64_t, uint64_t, void *, const char *))(*(void *)v15 + 72))(v15, (v17 | (v16 << 32)) & 0xFFFFFFFFFFFFLL, v18, 32, v12 == 80, v12 == 80, 1, 1, v105, v121);
          if (v19 && v19 != -310000)
          {
            if (a6) {
              goto LABEL_334;
            }
            goto LABEL_335;
          }
          goto LABEL_23;
      }
    }
    unsigned __int8 v14 = "?";
    goto LABEL_20;
  }
LABEL_23:
  id v20 = [v10 adaptiveVolumeConfig];
  if (v20)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      [v9 name];
      v121 = (const char *)v11;
      v105 = uint64_t v137 = v20;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v21 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 38, (uint64_t)v20, 2u);
    if (v21)
    {
      if (v21 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v22 = [v10 allowsAutoRoute:v105, v121, v137];
  if (v22)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v22 > 2) {
        __int16 v23 = "?";
      }
      else {
        __int16 v23 = off_100999E50[v22];
      }
      v106 = v11;
      v122 = v23;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v24 = sub_1002AF74C((uint64_t)off_1009F8098, (uint64_t)a4, v22 == 1);
    if (v24)
    {
      if (v24 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v25 = [v10 audioRouteHidden:v106, v122];
  if (v25)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v25 > 2) {
        id v26 = "?";
      }
      else {
        id v26 = off_100999E50[v25];
      }
      v107 = v11;
      v123 = v26;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v27 = sub_1002AF9A4((uint64_t)off_1009F8098, (uint64_t)a4, v25 == 1);
    if (v27)
    {
      if (v27 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v28 = [v10 endCallConfig:v107, v123];
  unsigned int v29 = [v10 muteControlConfig];
  if (v28 | v29)
  {
    uint64_t v30 = sub_10048799C((uint64_t)a4) & 0xF0FF | ((v28 & 0xF) << 8) | ((v29 & 0xF) << 16);
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v31 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 36, v30, 2u);
    if (v31)
    {
      if (v31 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  id v32 = [v10 conversationDetectConfig];
  if (v32)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      [v9 name];
      v124 = v11;
      v108 = uint64_t v138 = v32;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v33 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 40, (uint64_t)v32, 2u);
    if (v33)
    {
      if (v33 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v34 = [v10 clickHoldModeLeft:v108, v124, v138];
  unsigned int v35 = [v10 clickHoldModeRight];
  if (v34 | v35)
  {
    __int16 v36 = sub_100487714((uint64_t)a4);
    if (v34) {
      unsigned __int8 v37 = v34;
    }
    else {
      unsigned __int8 v37 = HIBYTE(v36);
    }
    if (!v35) {
      LOBYTE(v35) = v36;
    }
    if (dword_1009F8660 < 31 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v37 > 7u) {
        CFStringRef v38 = @"?";
      }
      else {
        CFStringRef v38 = (const __CFString *)*((void *)&off_100999D88 + (char)v37);
      }
      if (v35 > 7u) {
        CFStringRef v39 = @"?";
      }
      else {
        CFStringRef v39 = (const __CFString *)*((void *)&off_100999D88 + (char)v35);
      }
      CFStringRef v139 = v39;
      uint64_t v146 = v35 | (v37 << 8);
      v109 = v11;
      CFStringRef v125 = v38;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v40 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 22, v35 | (v37 << 8), 2u);
    if (v40)
    {
      if (v40 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  id v41 = [v10 crownRotationDirection:v109, v125, v139, v146];
  if (v41)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      id v42 = @"?";
      if (v41 == 1) {
        id v42 = @"BackToFront";
      }
      if (v41 == 2) {
        id v42 = @"FrontToBack";
      }
      v110 = v11;
      v126 = v42;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v43 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 28, (uint64_t)v41, 2u);
    if (v43)
    {
      if (v43 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v44 = [v10 deviceFlagsMask:v110, v126];
  unint64_t v45 = (unint64_t)[v10 deviceFlagsValue];
  int v46 = v45;
  if ((v44 & 0x400000) != 0)
  {
    int v47 = *((unsigned __int8 *)a4 + 1436);
    if (((v45 >> 22) & 1) != v47)
    {
      unsigned int v48 = v45 & 0x400000;
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v49 = "yes";
        if (v47) {
          v50 = "yes";
        }
        else {
          v50 = "no";
        }
        if (!v48) {
          uint64_t v49 = "no";
        }
        v127 = v50;
        v140 = v49;
        v111 = v11;
        LogPrintF_safe();
      }
      sub_100477B24((uint64_t)a4, v48 != 0);
    }
  }
  if ((v44 & 0x80000000) != 0)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v51 = "yes";
      if (v46 >= 0) {
        uint64_t v51 = "no";
      }
      v111 = v11;
      v127 = v51;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    uint64_t v52 = v46 < 0 ? 1 : 2;
    int v53 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 30, v52, 2u);
    if (v53)
    {
      if (v53 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  __int16 v54 = sub_10047C698((uint64_t)a4);
  unsigned int v55 = [v10 doubleTapActionLeft];
  unsigned int v56 = [v10 doubleTapActionRight];
  unsigned int v57 = v56;
  int v58 = HIBYTE(v54);
  uint64_t v59 = v54;
  unsigned int v60 = v55 - 1;
  if (v55 - 1 >= 5) {
    unsigned int v60 = 0xFFFF;
  }
  if (v55) {
    long long v61 = (const char *)v60;
  }
  else {
    long long v61 = (const char *)HIBYTE(v54);
  }
  if (!v56)
  {
    uint64_t v62 = v59;
    goto LABEL_141;
  }
  if (v56 <= 5)
  {
    uint64_t v62 = v56 - 1;
LABEL_141:
    if (v61 == v58 && v62 == v59) {
      goto LABEL_158;
    }
    goto LABEL_145;
  }
  uint64_t v62 = 0xFFFFLL;
LABEL_145:
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    if (v55 > 5) {
      long long v63 = "?";
    }
    else {
      long long v63 = off_100999DC8[v55];
    }
    if (v57 > 5) {
      long long v64 = "?";
    }
    else {
      long long v64 = off_100999DC8[v57];
    }
    uint64_t v147 = v62;
    v148 = v64;
    v127 = v61;
    v140 = v63;
    v111 = v11;
    LogPrintF_safe();
  }
  int v65 = sub_10045577C((uint64_t)v150, (uint64_t)a4, v61, v62);
  if (v65 && v65 != -310000)
  {
    if (a6) {
      goto LABEL_334;
    }
    goto LABEL_335;
  }
LABEL_158:
  id v66 = [v10 listeningMode:v111, v127, v140, v147, v148];
  if (v66 && v66 != sub_100487564((uint64_t)a4))
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v66 > 4) {
        int v67 = "?";
      }
      else {
        int v67 = off_100999DF8[(int)v66 - 1];
      }
      v112 = v11;
      v128 = v67;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v68 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 13, (uint64_t)v66, 2u);
    if (v68)
    {
      if (v68 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  id v69 = [v10 listeningModeConfigs:v112, v128];
  if (v69)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v129 = v113 = v11;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v70 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 26, (uint64_t)v69, 2u);
    if (v70)
    {
      if (v70 != -310000)
      {
        if (a6) {
          goto LABEL_334;
        }
        goto LABEL_335;
      }
    }
  }
  unsigned int v71 = [v10 microphoneMode:v113, v129];
  unsigned int v72 = v71;
  if (v71)
  {
    uint64_t v73 = v71 == 3 ? 1 : 2 * (v71 == 2);
    if (v73 != sub_10048741C((uint64_t)a4))
    {
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        if (v72 > 3) {
          v74 = "?";
        }
        else {
          v74 = off_100999E18[v72];
        }
        uint64_t v130 = v73;
        v141 = v74;
        v114 = v11;
        LogPrintF_safe();
      }
      int v75 = sub_1004556A0((uint64_t)v150, (uint64_t)a4, v73);
      if (v75)
      {
        if (v75 != -310000)
        {
          if (a6)
          {
LABEL_334:
            CBErrorF();
            BOOL v101 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_298;
          }
LABEL_335:
          BOOL v101 = 0;
          goto LABEL_298;
        }
      }
    }
  }
  uint64_t v76 = [v10 name:v114, v130, v141];
  if (![v76 length]) {
    goto LABEL_215;
  }
  sub_100475EE0((uint64_t)a4, (uint64_t)__p);
  if (v154 >= 0) {
    v77 = __p;
  }
  else {
    v77 = (void **)__p[0];
  }
  v78 = +[NSString stringWithUTF8String:v77];
  if (v154 < 0) {
    operator delete(__p[0]);
  }
  id v79 = v76;
  id v80 = v78;
  v81 = v80;
  if (v79 != v80)
  {
    if ((v79 == 0) != (v80 != 0))
    {
      unsigned __int8 v82 = [v79 isEqual:v80];

      if (v82) {
        goto LABEL_214;
      }
    }
    else
    {
    }
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      v131 = v81;
      id v142 = v79;
      v115 = v11;
      LogPrintF_safe();
    }
    sub_10004191C(__p, (char *)[v79 UTF8String]);
    sub_1004776CC((uint64_t)a4, (uint64_t)__p, 1);
    if (v154 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_214;
  }

LABEL_214:
LABEL_215:
  unsigned int v83 = [v10 placementMode:v115, v131, v142];
  if (v83 && (v83 == 1) != sub_100487464((uint64_t)a4))
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      v84 = "no";
      if (v83 == 1) {
        v84 = "yes";
      }
      v116 = v11;
      v132 = v84;
      LogPrintF_safe();
    }
    int v85 = sub_100456548((uint64_t)v150, (uint64_t)a4, v83 == 1);
    if (v85)
    {
      if (v85 != -310000)
      {
        if (a6)
        {
          v104 = CBErrorF();
          goto LABEL_338;
        }
        goto LABEL_341;
      }
    }
  }
  unsigned int v86 = [v10 relinquishAudioRoute:v116 withRoute:v132];
  if (v86)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v86 > 2) {
        v87 = "?";
      }
      else {
        v87 = off_100999E50[v86];
      }
      v88 = "true";
      if (v86 == 1) {
        v88 = "false";
      }
      v133 = v87;
      v143 = v88;
      v117 = v11;
      LogPrintF_safe();
    }
    if (v86 == 1)
    {
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100999B78);
      }
      int v89 = sub_10029C988((uint64_t)off_1009F8098, (uint64_t)a4, 1);
      if (!v89) {
        goto LABEL_250;
      }
    }
    else
    {
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100999B78);
      }
      v90 = off_1009F8098;
      sub_1004A82EC((unsigned __int8 *)a4 + 128, v151);
      int v91 = sub_100287FA0((uint64_t)v90, (unsigned __int8 *)v151, 1);
      int v89 = v91;
      if (v152 < 0)
      {
        operator delete(v151[0]);
        if (!v89) {
          goto LABEL_250;
        }
      }
      else if (!v91)
      {
        goto LABEL_250;
      }
    }
    if (v89 != -310000)
    {
      if (!a6) {
        goto LABEL_341;
      }
LABEL_330:
      v104 = CBErrorF();
LABEL_338:
      BOOL v101 = 0;
      *a6 = v104;
      goto LABEL_297;
    }
  }
LABEL_250:
  id v92 = [v10 selectiveSpeechListeningConfig:v117, v133, v143];
  if (v92)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      [v9 name];
      v134 = v11;
      v118 = uint64_t v144 = v92;
      LogPrintF_safe();
    }
    if (qword_1009F80A0 != -1) {
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
    }
    int v93 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)a4, 41, (uint64_t)v92, 2u);
    if (v93)
    {
      if (v93 != -310000)
      {
        if (!a6) {
          goto LABEL_341;
        }
        goto LABEL_330;
      }
    }
  }
  unsigned int v94 = [v10 smartRoutingMode:v118, v134, v144];
  if (v94 == 1) {
    uint64_t v95 = 1;
  }
  else {
    uint64_t v95 = 2 * (v94 == 2);
  }
  if (v95 && v95 != sub_1004874AC((uint64_t)a4))
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      if (v94 > 2) {
        v96 = "?";
      }
      else {
        v96 = off_100999E38[v94];
      }
      uint64_t v135 = v95;
      v145 = v96;
      v119 = v11;
      LogPrintF_safe();
    }
    sub_100484DC4((uint64_t)a4, v95);
  }
  uint64_t v97 = (uint64_t)[v10 spatialAudioAllowed:v119, v135, v145];
  if (v97)
  {
    LODWORD(__p[0]) = 0;
    if (qword_1009F7F00 != -1) {
      dispatch_once(&qword_1009F7F00, &stru_100999B58);
    }
    sub_1004AB094((uint64_t)off_1009F7EF8, (uint64_t)a4, __p);
    if (SLOBYTE(__p[0]) != v97)
    {
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        if (v97 > 2) {
          v98 = "?";
        }
        else {
          v98 = off_100999E50[(int)v97];
        }
        v120 = v11;
        v136 = v98;
        LogPrintF_safe();
      }
      int v99 = sub_100455C54((uint64_t)v150, (uint64_t)a4, v97);
      if (v99)
      {
        if (v99 != -310000)
        {
          if (a6)
          {
            CBErrorF();
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_341;
        }
      }
    }
  }
  id v100 = [v10 spatialAudioMode:v120, v136];
  if (v100 != 255)
  {
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    int v102 = sub_100456244((uint64_t)v150, (uint64_t)a4, @"global", (uint64_t)v100, -1);
    BOOL v101 = 1;
    if (!v102 || v102 == -310000) {
      goto LABEL_297;
    }
    if (a6) {
      goto LABEL_330;
    }
LABEL_341:
    BOOL v101 = 0;
    goto LABEL_297;
  }
  BOOL v101 = 1;
LABEL_297:

LABEL_298:
  return v101;
}

- (BOOL)modifyDevice:(id)a3 leDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v54 = v11;
  unsigned int v55 = [v11 name];
  if (!v55) {
    goto LABEL_24;
  }
  btSessionPtr = self->_btSessionPtr;
  if (btSessionPtr)
  {
    if (*((char *)a4 + 127) < 0)
    {
      sub_10003B098(&__dst, *((void **)a4 + 13), *((void *)a4 + 14));
    }
    else
    {
      long long __dst = *(_OWORD *)((char *)a4 + 104);
      uint64_t v66 = *((void *)a4 + 15);
    }
    if (v66 >= 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (long long *)__dst;
    }
    unsigned __int8 v14 = +[NSString stringWithUTF8String:p_dst];
    if (SHIBYTE(v66) < 0) {
      operator delete((void *)__dst);
    }
    id v15 = v55;
    id v16 = v14;
    uint64_t v17 = v16;
    if (v15 == v16)
    {
    }
    else
    {
      if (v16)
      {
        unsigned __int8 v18 = [v15 isEqual:v16];

        if (v18) {
          goto LABEL_23;
        }
      }
      else
      {
      }
      id v19 = *(id *)a4;
      if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
      {
        [v19 UUIDString];
        int v47 = v17;
        unint64_t v45 = v49 = v15;
        LogPrintF_safe();
      }
      uint64_t v20 = sub_100019878();
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_1000C82B8;
      v64[3] = &unk_1009996F8;
      v64[4] = v15;
      v64[5] = v19;
      v64[6] = btSessionPtr;
      sub_100013018(v20, v64);
      id v15 = v19;
    }

LABEL_23:
    id v11 = v54;
LABEL_24:
    unsigned int v21 = [v10 internalFlags:v45, v47, v49] & 0x400;
    if (dword_1009F8660 <= 40 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v22 = [v10 identifier];
      id v23 = *(id *)a4;
      int v24 = [v10 controllerInfo];
      unsigned int v25 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v24 fastLEConnectionInfoVersion]);
      id v26 = [v10 controllerInfo];
      int v27 = [v26 fastLEConnectionInfoData];
      unsigned int v28 = [v10 controllerInfo];
      uint64_t v52 = v27;
      uint64_t v53 = [v28 fastLEConnectionAllowed];
      id v50 = v23;
      uint64_t v51 = v25;
      uint64_t v46 = v21 >> 10;
      unsigned int v48 = v22;
      LogPrintF_safe();

      id v11 = v54;
    }
    id v29 = *(id *)a4;
    if (v21)
    {
      uint64_t v30 = [v10 controllerInfo];
      unsigned __int8 v31 = [v30 fastLEConnectionInfoVersion];

      id v32 = [v10 controllerInfo];
      int v33 = [v32 fastLEConnectionInfoData];

      uint64_t v34 = sub_100019878();
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000C84B0;
      v59[3] = &unk_100998A80;
      id v60 = v29;
      unsigned __int8 v63 = v31;
      id v35 = v33;
      id v61 = v35;
      id v62 = v10;
      sub_100013018(v34, v59);
    }
    __int16 v36 = [v10 model:v46 v48 v50 v51 v52 v53];
    if (v36)
    {
      unsigned __int8 v37 = [v10 model];
      id v38 = [v37 length];

      if (v38)
      {
        CFStringRef v39 = [v10 model];
        uint64_t v40 = sub_100019878();
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1000C8598;
        v56[3] = &unk_100998510;
        id v57 = v29;
        id v58 = v39;
        id v41 = v39;
        sub_100013018(v40, v56);
      }
    }

    BOOL v42 = 1;
    goto LABEL_34;
  }
  if (a6)
  {
    int v43 = v55;
    CBErrorF();
    BOOL v42 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  BOOL v42 = 0;
LABEL_34:
  int v43 = v55;
LABEL_35:

  return v42;
}

- (void)_modifyDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v7 = [v14 device];
    CUPrintNSError();
    v13 = int v12 = v7;
    LogPrintF_safe();
  }
  id v8 = [v14 timer:v12 interval:v13];
  id v9 = v14;
  if (v8)
  {
    dispatch_source_cancel(v8);
    [v14 setTimer:0];
    id v9 = v14;
  }
  uint64_t v10 = [v9 completionHandler];
  id v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
    [v14 setCompletionHandler:0];
  }
  [(NSMutableSet *)self->_modifyDeviceRequests removeObject:v14];
}

- (void)performDeviceRequest:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  id v100 = sub_10004CF4C;
  BOOL v101 = sub_10004CD78;
  id v102 = 0;
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_1000C9694;
  v94[3] = &unk_100999658;
  v96 = &v97;
  id v12 = v10;
  id v95 = v12;
  uint64_t v13 = objc_retainBlock(v94);
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100999A78);
  }
  if (!*((unsigned char *)off_1009F8068 + 60))
  {
    uint64_t v60 = CBErrorF();
    id v81 = (id)v98[5];
    v98[5] = v60;

    goto LABEL_98;
  }
  id v80 = [v9 identifier];
  if (!v80)
  {
    uint64_t v61 = CBErrorF();
    id v62 = (void *)v98[5];
    v98[5] = v61;

    goto LABEL_97;
  }
  __int16 v93 = 0;
  int v92 = 0;
  id v79 = [objc_alloc((Class)NSUUID) initWithUUIDString:v80];
  if (!v79)
  {
    [v80 UTF8String];
    if (!TextToHardwareAddress()) {
      goto LABEL_11;
    }
LABEL_109:
    uint64_t v69 = CBErrorF();
    id v15 = (id)v98[5];
    v98[5] = v69;
    goto LABEL_96;
  }
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100999B38);
  }
  uint64_t v14 = sub_100030DCC((uint64_t)off_1009F7ED8, v79, 0);
  if (!v14) {
    goto LABEL_109;
  }
  LOBYTE(v92) = BYTE5(v14);
  BYTE1(v92) = BYTE4(v14);
  BYTE2(v92) = BYTE3(v14);
  HIBYTE(v92) = BYTE2(v14);
  LOBYTE(v93) = BYTE1(v14);
  HIBYTE(v93) = v14;
LABEL_11:
  if (dword_1009F8660 <= 20 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v75 = v9;
    id v76 = v8;
    LogPrintF_safe();
  }
  id v15 = objc_alloc_init((Class)CBDeviceResponse);
  unsigned int v16 = [v8 requestFlags];
  unsigned int v17 = v16;
  if ((v16 & 0x28) != 0)
  {
    LOBYTE(v103) = 0;
    sub_10001B8E0(&v103);
    unsigned __int8 v18 = (unsigned __int16 *)sub_100197B9C((uint64_t)&v92);
    uint64_t v82 = (uint64_t)v18;
    if (!v18)
    {
      uint64_t v63 = CBErrorF();
      long long v64 = (void *)v98[5];
      v98[5] = v63;

      goto LABEL_112;
    }
    [v15 setConnectionHandle:sub_100197960(v18)];
    sub_10001B8AC(&v103);
    unsigned int v83 = 8;
    if ((v17 & 0x40) == 0)
    {
LABEL_18:
      if ((v17 & 1) == 0) {
        goto LABEL_50;
      }
LABEL_44:
      LOBYTE(v103) = 0;
      uint64_t v30 = sub_10003FB34();
      if ((*(unsigned int (**)(uint64_t, int *, uint64_t *))(*(void *)v30 + 312))(v30, &v92, &v103))
      {
        LOBYTE(v108[0]) = 0;
        sub_10001B8E0(v108);
        uint64_t v37 = sub_100197B9C((uint64_t)&v92);
        if (!v37
          || (int v38 = sub_10018F028((uint64_t)sub_1000C97A0, v37, v31, v32, v33, v34, v35, v36), v82 = v37, v38)
          && v38 != -330000)
        {
          uint64_t v70 = CBErrorF();
          unsigned int v71 = (void *)v98[5];
          v98[5] = v70;

          unsigned int v72 = v108;
LABEL_113:
          sub_10001B8AC(v72);
          goto LABEL_96;
        }
        sub_10001B8AC(v108);
      }
      else
      {
        [v15 setRssi:(char)v103];
        v83 |= 1u;
      }
      goto LABEL_50;
    }
  }
  else
  {
    unsigned int v83 = 0;
    uint64_t v82 = 0;
    if ((v16 & 0x40) == 0) {
      goto LABEL_18;
    }
  }
  v108[0] = 0;
  v108[1] = 0;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100999B38);
  }
  sub_1006C0414((uint64_t)off_1009F7ED8, (unsigned __int8 *)&v92, (unsigned __int8 *)v108);
  sub_100031234((const unsigned __int8 *)v108);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    if (qword_1009F7ED0 != -1) {
      dispatch_once(&qword_1009F7ED0, &stru_100999C18);
    }
    v77 = v13;
    id v78 = v12;
    uint64_t v20 = sub_10070CA20(qword_1009F7EC8);
    id v21 = [v20 countByEnumeratingWithState:&v88 objects:v107 count:16];
    if (!v21)
    {
LABEL_40:

      uint64_t v13 = v77;
      id v12 = v78;
      goto LABEL_41;
    }
    uint64_t v22 = *(void *)v89;
LABEL_28:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v89 != v22) {
        objc_enumerationMutation(v20);
      }
      int v24 = *(void **)(*((void *)&v88 + 1) + 8 * v23);
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x2020000000;
      uint64_t v106 = 0;
      if (qword_1009F7EE0 != -1) {
        dispatch_once(&qword_1009F7EE0, &stru_100999B38);
      }
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_1000C978C;
      v87[3] = &unk_100997508;
      v87[4] = &v103;
      sub_1006C4850((uint64_t)off_1009F7ED8, v24, v87);
      uint64_t v25 = v104[3];
      if (v25)
      {
        LOBYTE(v85) = (unsigned __int16)WORD2(v104[3]) >> 8;
        BYTE1(v85) = BYTE4(v25);
        BYTE2(v85) = BYTE3(v25);
        HIBYTE(v85) = BYTE2(v25);
        LOBYTE(v86) = BYTE1(v25);
        HIBYTE(v86) = v25;
        if (v85 == v92 && v86 == v93) {
          break;
        }
      }
      _Block_object_dispose(&v103, 8);
      if (v21 == (id)++v23)
      {
        id v21 = [v20 countByEnumeratingWithState:&v88 objects:v107 count:16];
        if (v21) {
          goto LABEL_28;
        }
        goto LABEL_40;
      }
    }
    id v19 = v24;
    _Block_object_dispose(&v103, 8);

    uint64_t v13 = v77;
    id v12 = v78;
    if (!v19) {
      goto LABEL_41;
    }
  }
  id v29 = [v19 UUIDString:v75, v76];
  [v15 setIdentifier:v29];

  v83 |= 0x40u;
  if (v17) {
    goto LABEL_44;
  }
LABEL_50:
  if ((v17 & 6) != 0)
  {
    LOBYTE(v103) = 0;
    sub_10001B8E0(&v103);
    uint64_t v82 = sub_100197B9C((uint64_t)&v92);
    if (!v82
      || (v17 & 2) != 0
      && (int v44 = sub_10018F308((uint64_t)sub_1000C9874, v82, 0, v39, v40, v41, v42, v43)) != 0
      && v44 != -330000
      || (v17 & 4) != 0
      && (int v45 = sub_10018F308((uint64_t)sub_1000C9948, v82, 1, v39, v40, v41, v42, v43)) != 0
      && v45 != -330000)
    {
LABEL_111:
      uint64_t v73 = CBErrorF();
      v74 = (void *)v98[5];
      v98[5] = v73;

      goto LABEL_112;
    }
    sub_10001B8AC(&v103);
  }
  if ((v17 & 0x20) != 0)
  {
    LODWORD(v104) = 0;
    uint64_t v103 = 0;
    LOBYTE(v108[0]) = 0;
    uint64_t v46 = sub_10003FB34();
    int v47 = (*(uint64_t (**)(uint64_t, id, uint64_t *, void *, uint64_t))(*(void *)v46 + 1672))(v46, [v15 connectionHandle], &v103, v108, 1);
    if (v47 && v47 != -310000 || LOBYTE(v108[0]) != 12)
    {
      uint64_t v65 = CBErrorF();
      uint64_t v66 = (void *)v98[5];
      v98[5] = v65;

      goto LABEL_96;
    }
    [v15 setCurrentPCAP:SBYTE4(v103)];
    [v15 setCore0TargetPower:SBYTE2(v104)];
    [v15 setCore1TargetPower:SBYTE3(v104)];
    v83 |= 0x20u;
  }
  if ((v17 & 0x80) == 0) {
    goto LABEL_70;
  }
  if (qword_1009F8798 != -1) {
    dispatch_once(&qword_1009F8798, &stru_100999CB8);
  }
  int v48 = sub_1003ED54C(qword_1009F8790, (uint64_t)&v92, 5, 1u);
  if (!v48 || v48 == -310000)
  {
    v83 |= 0x80u;
LABEL_70:
    if ((v17 & 0x100) == 0)
    {
LABEL_76:
      if ((v17 & 0x200) == 0)
      {
LABEL_79:
        if ((v17 & 0x400) == 0)
        {
          uint64_t v51 = v83;
          goto LABEL_87;
        }
        LOBYTE(v103) = 0;
        sub_10001B8E0(&v103);
        uint64_t v82 = sub_100197B9C((uint64_t)&v92);
        if (v82)
        {
          uint64_t v52 = sub_10003FB34();
          if ((*(uint64_t (**)(uint64_t))(*(void *)v52 + 2488))(v52))
          {
            if (*(unsigned __int8 *)(v82 + 289) <= 1u) {
              uint64_t v53 = 1;
            }
            else {
              uint64_t v53 = *(unsigned __int8 *)(v82 + 289);
            }
            [v15 setBtBand:v53, v75];
            uint64_t v51 = v83 | 0x400;
            sub_10001B8AC(&v103);
LABEL_87:
            if ((v17 & ~v51) != 0)
            {
              id v54 = objc_alloc_init(CBStackPerformDeviceRequest);
              [(CBStackPerformDeviceRequest *)v54 setDevice:v9];
              [(CBStackPerformDeviceRequest *)v54 setCompletedFlags:v51];
              [(CBStackPerformDeviceRequest *)v54 setCompletionHandler:v12];
              [(CBStackPerformDeviceRequest *)v54 setConnectionHandle:v82];
              [(CBStackPerformDeviceRequest *)v54 setRequest:v8];
              [(CBStackPerformDeviceRequest *)v54 setResponse:v15];
              unsigned int v55 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v11->_dispatchQueue);
              [(CBStackPerformDeviceRequest *)v54 setTimer:v55];
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_1000C9A1C;
              handler[3] = &unk_100999680;
              handler[4] = v55;
              void handler[5] = v54;
              handler[6] = v11;
              dispatch_source_set_event_handler(v55, handler);
              [v8 timeoutSeconds];
              CUDispatchTimerSet();
              dispatch_activate(v55);
              performDeviceRequests = v11->_performDeviceRequests;
              if (!performDeviceRequests)
              {
                id v57 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
                uint64_t v59 = v11->_performDeviceRequests;
                p_performDeviceRequests = &v11->_performDeviceRequests;
                *p_performDeviceRequests = v57;

                performDeviceRequests = *p_performDeviceRequests;
              }
              -[NSMutableSet addObject:](performDeviceRequests, "addObject:", v54, v75);
            }
            else
            {
              if (dword_1009F8660 <= 20 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
                LogPrintF_safe();
              }
              (*((void (**)(id, id, void))v12 + 2))(v12, v15, 0);
            }
            goto LABEL_96;
          }
        }
        goto LABEL_111;
      }
      LOBYTE(v103) = 0;
      sub_10001B8E0(&v103);
      uint64_t v50 = sub_100197A30((uint64_t)&v92);
      if (v50)
      {
        [v15 setSniffInterval:625 * *(unsigned __int16 *)(v50 + 136)];
        v83 |= 0x200u;
        sub_10001B8AC(&v103);
        goto LABEL_79;
      }
      uint64_t v67 = CBErrorF();
      int v68 = (void *)v98[5];
      v98[5] = v67;

LABEL_112:
      unsigned int v72 = &v103;
      goto LABEL_113;
    }
    if (qword_1009F8798 != -1) {
      dispatch_once(&qword_1009F8798, &stru_100999CB8);
    }
    int v49 = sub_1003ED54C(qword_1009F8790, (uint64_t)&v92, 6, 1u);
    if (!v49 || v49 == -310000)
    {
      v83 |= 0x100u;
      goto LABEL_76;
    }
  }
LABEL_41:
  uint64_t v27 = CBErrorF();
  unsigned int v28 = (void *)v98[5];
  v98[5] = v27;

LABEL_96:
LABEL_97:

LABEL_98:
  ((void (*)(void *))v13[2])(v13);

  _Block_object_dispose(&v97, 8);
}

- (void)_completePerformDeviceRequest:(id)a3 error:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (dword_1009F8660 <= 20 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v7 = [v16 device];
    id v8 = [v16 request];
    CUPrintNSError();
    v15 = uint64_t v14 = v8;
    uint64_t v13 = v7;
    LogPrintF_safe();
  }
  id v9 = [v16 timer:v13 interval:v14 repeats:v15];
  id v10 = v16;
  if (v9)
  {
    dispatch_source_cancel(v9);
    [v16 setTimer:0];
    id v10 = v16;
  }
  id v11 = [v10 completionHandler];
  if (v11)
  {
    if (v6)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = [v16 response];
    }
    ((void (**)(void, void *, id))v11)[2](v11, v12, v6);
    if (!v6) {

    }
    [v16 setCompletionHandler:0];
  }
  [(NSMutableSet *)self->_performDeviceRequests removeObject:v16];
}

- (void)_readRSSIWithConnectionHandle:(_OI_HCI_CONNECTION *)a3 status:(int)a4 rssi:(char)a5
{
  uint64_t v20 = a5;
  uint64_t v5 = *(void *)&a4;
  if (dword_1009F8660 <= 20 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = (int)v20;
    id v19 = [(NSMutableSet *)self->_performDeviceRequests count];
    uint64_t v17 = v5;
    LogPrintF_safe();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(NSMutableSet *)self->_performDeviceRequests allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    if (v20) {
      BOOL v10 = v5 != 0;
    }
    else {
      BOOL v10 = 1;
    }
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v12 connectionHandle] == a3)
        {
          uint64_t v13 = [v12 request];
          unsigned int v14 = [v13 requestFlags];

          if (v14)
          {
            if (v10)
            {
              id v15 = CBErrorF();
              [(CBStackControllerBTStack *)self _completePerformDeviceRequest:v12 error:v15];
            }
            else
            {
              id v15 = [v12 response];
              [v15 setRssi:v20];
              uint64_t v16 = [v12 completedFlags] | 1;
              [v12 setCompletedFlags:v16];
              if ((v14 & ~v16) == 0) {
                [(CBStackControllerBTStack *)self _completePerformDeviceRequest:v12 error:0];
              }
            }
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)_readTxPowerWithFlags:(unsigned int)a3 status:(int)a4 connectionHandle:(_OI_HCI_CONNECTION *)a5 txPowerLevel:(char)a6
{
  uint64_t v23 = a6;
  uint64_t v7 = *(void *)&a4;
  if (dword_1009F8660 <= 20 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    id v8 = CUPrintFlags32();
    uint64_t v21 = (int)v23;
    id v22 = [(NSMutableSet *)self->_performDeviceRequests count];
    id v19 = v8;
    uint64_t v20 = v7;
    LogPrintF_safe();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(NSMutableSet *)self->_performDeviceRequests allObjects];
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v13 connectionHandle] == a5)
        {
          unsigned int v14 = [v13 request];
          unsigned int v15 = [v14 requestFlags];

          if ((v15 & a3) != 0)
          {
            if (v7)
            {
              uint64_t v16 = CBErrorF();
              [(CBStackControllerBTStack *)self _completePerformDeviceRequest:v13 error:v16];
            }
            else
            {
              uint64_t v17 = [v13 response];
              uint64_t v16 = v17;
              if ((a3 & 2) != 0) {
                [v17 setTxPower:v23];
              }
              if ((a3 & 4) != 0) {
                [v16 setTxPowerMax:v23];
              }
              uint64_t v18 = [v13 completedFlags] | a3;
              [v13 setCompletedFlags:v18];
              if ((v15 & ~v18) == 0) {
                [(CBStackControllerBTStack *)self _completePerformDeviceRequest:v13 error:0];
              }
            }
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
}

- (BOOL)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 error:(id *)a7
{
  int v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v15 = [v13 identifier];
  uint64_t v16 = [(CBStackControllerBTStack *)self _btDeviceWithID:v15 error:a7];

  if (!v16)
  {
    BOOL v22 = 0;
    goto LABEL_10;
  }
  uint64_t v17 = [v14 identifier];
  uint64_t v18 = v17;
  if (v17)
  {
    __int16 v26 = 0;
    int v25 = 0;
    [v17 UTF8String];
    if (TextToHardwareAddress())
    {
      if (!a7) {
        goto LABEL_21;
      }
    }
    else
    {
      id v19 = [v12 length];
      unsigned __int16 v20 = (unsigned __int16)v19;
      if ((unint64_t)v19 < 0x3E7)
      {
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v21 = sub_100288830((uint64_t)off_1009F8098, (uint64_t)v16, (uint64_t)&v25, v10, v20, [v12 bytes]);
        BOOL v22 = 1;
        if (!v21 || v21 == -310000) {
          goto LABEL_9;
        }
        if (a7)
        {
          long long v24 = CBErrorF();
          goto LABEL_20;
        }
LABEL_21:
        BOOL v22 = 0;
        goto LABEL_9;
      }
      if (!a7) {
        goto LABEL_21;
      }
    }
  }
  else if (!a7)
  {
    goto LABEL_21;
  }
  long long v24 = CBErrorF();
LABEL_20:
  BOOL v22 = 0;
  *a7 = v24;
LABEL_9:

LABEL_10:
  return v22;
}

- (BOOL)sendSmartRoutingInformation:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 identifier];
  if (!v10)
  {
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v11 = [(CBStackControllerBTStack *)self _btDeviceWithID:v10 error:0];
  if (!v11) {
    goto LABEL_12;
  }
  unsigned int v12 = [v8 length];
  if (v12 >= 0x3E7)
  {
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (qword_1009F80A0 != -1) {
    dispatch_once(&qword_1009F80A0, &stru_100999B78);
  }
  int v13 = sub_100293214((uint64_t)off_1009F8098, (uint64_t)v11, [v8 bytes], (unsigned __int16)v12);
  LOBYTE(v11) = 1;
  if (v13 && v13 != -310000)
  {
    if (a5)
    {
LABEL_18:
      CBErrorF();
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_19:
    LOBYTE(v11) = 0;
  }
LABEL_12:

  return (char)v11;
}

- (BOOL)sendConversationDetectMessage:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 identifier];
  if (!v10)
  {
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v11 = [(CBStackControllerBTStack *)self _btDeviceWithID:v10 error:0];
  if (!v11) {
    goto LABEL_12;
  }
  unsigned int v12 = [v8 length];
  if (v12 >= 0x3E7)
  {
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (qword_1009F80A0 != -1) {
    dispatch_once(&qword_1009F80A0, &stru_100999B78);
  }
  int v13 = sub_1002933FC((uint64_t)off_1009F8098, (uint64_t)v11, [v8 bytes], (unsigned __int16)v12);
  LOBYTE(v11) = 1;
  if (v13 && v13 != -310000)
  {
    if (a5)
    {
LABEL_18:
      CBErrorF();
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_19:
    LOBYTE(v11) = 0;
  }
LABEL_12:

  return (char)v11;
}

- (BOOL)sendAudioAccessoryConfig:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 identifier];
  if (v10)
  {
    uint64_t v11 = [(CBStackControllerBTStack *)self _btDeviceWithID:v10 error:0];
    if (v11)
    {
      id v39 = 0;
      unsigned int v12 = [[AudioAccessoryDeviceConfig alloc] initWithXPCObject:v8 error:&v39];
      id v13 = v39;
      if (v13)
      {
        if (a5)
        {
LABEL_93:
          CBErrorF();
          LOBYTE(v11) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

          goto LABEL_87;
        }
LABEL_94:
        LOBYTE(v11) = 0;
        goto LABEL_86;
      }
      if ([(AudioAccessoryDeviceConfig *)v12 allowOffListeningMode])
      {
        if ([(AudioAccessoryDeviceConfig *)v12 allowOffListeningMode] == 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = 2;
        }
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          long long v27 = v10;
          uint64_t v33 = v14;
          LogPrintF_safe();
        }
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 52, v14, 2u);
      }
      else
      {
        int v15 = 0;
      }
      if ([(AudioAccessoryDeviceConfig *)v12 autoANCStrength])
      {
        uint64_t v16 = [(AudioAccessoryDeviceConfig *)v12 autoANCStrength] - 1000;
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          long long v28 = v10;
          uint64_t v34 = v16;
          LogPrintF_safe();
        }
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 46, v16, 2u);
      }
      if ([(AudioAccessoryDeviceConfig *)v12 enableSiriMultitone])
      {
        if ([(AudioAccessoryDeviceConfig *)v12 enableSiriMultitone] == 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = 2;
        }
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          long long v29 = v10;
          uint64_t v35 = v17;
          LogPrintF_safe();
        }
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 50, v17, 2u);
      }
      if ([(AudioAccessoryDeviceConfig *)v12 enableHearingAidGainSwipe])
      {
        if ([(AudioAccessoryDeviceConfig *)v12 enableHearingAidGainSwipe] == 1) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 2;
        }
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v30 = v10;
          uint64_t v36 = v18;
          LogPrintF_safe();
        }
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 47, v18, 2u);
      }
      if ([(AudioAccessoryDeviceConfig *)v12 enableHearingAssist])
      {
        if ([(AudioAccessoryDeviceConfig *)v12 enableHearingAssist] == 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = 2;
        }
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v31 = v10;
          uint64_t v37 = v19;
          LogPrintF_safe();
        }
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 51, v19, 2u);
      }
      if ([(AudioAccessoryDeviceConfig *)v12 hearingAidToggle]
        && ![(AudioAccessoryDeviceConfig *)v12 hearingAidEnrolled])
      {
        unsigned int v22 = [(AudioAccessoryDeviceConfig *)v12 hearingAidToggle];
        int v23 = sub_10048DFF4((uint64_t)v11);
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v32 = v10;
          uint64_t v38 = [(AudioAccessoryDeviceConfig *)v12 hearingAidToggle];
          LogPrintF_safe();
        }
        uint64_t v24 = v23 | (v22 << 8);
        if (qword_1009F80A0 == -1) {
          goto LABEL_72;
        }
      }
      else
      {
        if ([(AudioAccessoryDeviceConfig *)v12 hearingAidToggle]
          || ![(AudioAccessoryDeviceConfig *)v12 hearingAidEnrolled])
        {
LABEL_73:
          if ([(AudioAccessoryDeviceConfig *)v12 enableHeartRateMonitor])
          {
            if ([(AudioAccessoryDeviceConfig *)v12 enableHeartRateMonitor] == 1) {
              uint64_t v25 = 1;
            }
            else {
              uint64_t v25 = 2;
            }
            if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            if (qword_1009F80A0 != -1) {
              dispatch_once(&qword_1009F80A0, &stru_100999B78);
            }
            int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 48, v25, 2u);
          }
          LOBYTE(v11) = 1;
          if (!v15 || v15 == -310000) {
            goto LABEL_86;
          }
          if (a5) {
            goto LABEL_93;
          }
          goto LABEL_94;
        }
        int v20 = sub_10048E0DC((uint64_t)v11);
        unsigned int v21 = [(AudioAccessoryDeviceConfig *)v12 hearingAidEnrolled];
        if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v32 = v10;
          uint64_t v38 = [(AudioAccessoryDeviceConfig *)v12 hearingAidEnrolled];
          LogPrintF_safe();
        }
        uint64_t v24 = v21 | (v20 << 8);
        if (qword_1009F80A0 == -1)
        {
LABEL_72:
          int v15 = sub_1002859A4((uint64_t)off_1009F8098, (uint64_t)v11, 44, v24, 2u);
          goto LABEL_73;
        }
      }
      dispatch_once(&qword_1009F80A0, &stru_100999B78);
      goto LABEL_72;
    }
  }
  else if (a5)
  {
    CBErrorF();
    LOBYTE(v11) = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v11) = 0;
  }
LABEL_87:

  return (char)v11;
}

- (BOOL)sendAudioAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 device:(id)a5 error:(id *)a6
{
  int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  unsigned int v12 = [v11 identifier];
  if (!v12)
  {
    if (a6) {
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  id v13 = [(CBStackControllerBTStack *)self _btDeviceWithID:v12 error:0];
  if (v13)
  {
    unsigned int v14 = [v10 length];
    if (v14 >= 0x3E7)
    {
      if (a6)
      {
LABEL_29:
        CBErrorF();
        LOBYTE(v13) = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
LABEL_33:
      LOBYTE(v13) = 0;
      goto LABEL_34;
    }
    if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    switch(v8)
    {
      case 2:
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002933FC((uint64_t)off_1009F8098, (uint64_t)v13, [v10 bytes], (unsigned __int16)v14);
        break;
      case 3:
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_100293214((uint64_t)off_1009F8098, (uint64_t)v13, [v10 bytes], (unsigned __int16)v14);
        break;
      case 4:
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_1002937D8((uint64_t)off_1009F8098, (uint64_t)v13, (unsigned __int16)v14, [v10 bytes]);
        break;
      case 5:
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_100293BF4((uint64_t)off_1009F8098, (uint64_t)v13, (unsigned __int16)v14, (unsigned __int8 *)[v10 bytes]);
        break;
      case 6:
        if (qword_1009F80A0 != -1) {
          dispatch_once(&qword_1009F80A0, &stru_100999B78);
        }
        int v15 = sub_10028BDD8((uint64_t)off_1009F8098, (uint64_t)v13);
        break;
      default:
        if (a6) {
          goto LABEL_29;
        }
        goto LABEL_33;
    }
    LOBYTE(v13) = 1;
    if (v15 && v15 != -310000)
    {
      if (a6) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
  }
LABEL_34:

  return (char)v13;
}

- (BOOL)updateControllerInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    self->_unint64_t stackControllerInfoCloudSyncStatus = [v6 cloudSyncStatus];
  }
  else if (a4)
  {
    CBErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

- (BOOL)isDeviceConnected:(id)a3 error:(id *)a4
{
  id v6 = [a3 identifier];
  if (v6)
  {
    uint64_t v7 = [(CBStackControllerBTStack *)self _btUUIDWithID:v6 error:0];
    if (qword_1009F7EC0 != -1) {
      dispatch_once(&qword_1009F7EC0, &stru_100999BD8);
    }
    int v8 = off_1009F7EB8;
    sub_1000305AC(v11, v7);
    BOOL v9 = sub_1000307A4((uint64_t)v8, v11);
  }
  else if (a4)
  {
    CBErrorF();
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_pairingAgentTearDown
{
  pairingAgentHandle = self->_pairingAgentHandle;
  self->_pairingAgentHandle = 0;
  BOOL pairingAgentStarted = self->_pairingAgentStarted;
  self->_BOOL pairingAgentStarted = 0;
  pairingClients = self->_pairingClients;
  self->_pairingClients = 0;

  if (pairingAgentHandle)
  {
    if (qword_1009F8768 != -1) {
      dispatch_once(&qword_1009F8768, &stru_100999BF8);
    }
    uint64_t v5 = sub_10060AEF8(off_1009F8760, (uint64_t)pairingAgentHandle);
    if (v5)
    {
      if (pairingAgentStarted)
      {
        int v6 = sub_100606558(v5, (unint64_t)pairingAgentHandle);
        if (!v6 || v6 == -310000)
        {
          if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
        }
        else if (dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
        {
          int v8 = CUPrintErrorCode();
          LogPrintF_safe();
        }
      }
      if (qword_1009F8768 != -1) {
        dispatch_once(&qword_1009F8768, &stru_100999BF8);
      }
      uint64_t v7 = off_1009F8760;
      sub_10060ABEC(v7, (unint64_t)pairingAgentHandle);
    }
    else if (dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (BOOL)addPairingClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  pairingClients = self->_pairingClients;
  if (!pairingClients)
  {
    int v8 = (CBPairable *)objc_alloc_init((Class)NSMutableSet);
    BOOL v9 = self->_pairingClients;
    self->_pairingClients = v8;

    pairingClients = self->_pairingClients;
  }
  [(CBPairable *)pairingClients addObject:v6];
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
  {
    [(CBPairable *)self->_pairingClients count];
    LogPrintF_safe();
  }
  if (!self->_pairingAgentHandle)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = sub_10004CF4C;
    long long v28 = sub_10004CD78;
    id v29 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000CBB58;
    void v23[3] = &unk_100999720;
    v23[4] = &v24;
    v23[5] = a4;
    id v11 = objc_retainBlock(v23);
    if (self->_btSessionHandle)
    {
      uint64_t v22 = 0;
      if (qword_1009F8768 != -1) {
        dispatch_once(&qword_1009F8768, &stru_100999BF8);
      }
      int v12 = sub_10060A8A0(off_1009F8760, (unint64_t)self->_btSessionHandle, &v22, (unint64_t *)&self->_pairingAgentHandle);
      if ((!v12 || v12 == -310000) && v22)
      {
        v21[0] = *(_OWORD *)off_100999740;
        v21[1] = *(_OWORD *)off_100999750;
        v21[2] = *(_OWORD *)off_100999760;
        sub_100606714(v22, (unint64_t *)self->_pairingAgentHandle, v21, (uint64_t)self);
        int v13 = sub_1006069B4(v22, (unint64_t)self->_pairingAgentHandle);
        BOOL v15 = v13 == 0;
        int v14 = v13 + 310000;
        BOOL v15 = v15 || v14 == 0;
        BOOL v10 = v15;
        if (v15)
        {
          self->_BOOL pairingAgentStarted = 1;
          if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
            LogPrintF_safe();
          }
        }
        else
        {
          uint64_t v19 = CBErrorF();
          int v20 = (void *)v25[5];
          v25[5] = v19;
        }
        goto LABEL_27;
      }
      uint64_t v17 = CBErrorF();
    }
    else
    {
      uint64_t v17 = CBErrorF();
    }
    uint64_t v18 = (void *)v25[5];
    v25[5] = v17;

    BOOL v10 = 0;
LABEL_27:
    ((void (*)(void *))v11[2])(v11);

    _Block_object_dispose(&v24, 8);
    goto LABEL_28;
  }
  BOOL v10 = 1;
LABEL_28:

  return v10;
}

- (void)removePairingClient:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(CBPairable *)self->_pairingClients removeObject:v5];
  id v4 = [(CBPairable *)self->_pairingClients count];
  if (dword_1009F8660 <= 30 && (dword_1009F8660 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (!v4) {
    [(CBStackControllerBTStack *)self _pairingAgentTearDown];
  }
}

- (BOOL)pairingContinueWithPairingInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 device];
  int v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 identifier];
    BOOL v10 = [(CBStackControllerBTStack *)self _btDeviceWithID:v9 error:a4];
    if (!v10)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (self->_pairingAgentHandle)
    {
      if (qword_1009F8768 != -1) {
        dispatch_once(&qword_1009F8768, &stru_100999BF8);
      }
      uint64_t v11 = sub_10060AEF8(off_1009F8760, (uint64_t)self->_pairingAgentHandle);
      if (v11)
      {
        int v12 = [v6 error];
        if (!v12)
        {
          id v16 = [v6 pin];
          uint64_t v17 = (char *)[v16 UTF8String];

          if (v17)
          {
            sub_10061625C(v19, v17);
            sub_100607F98(v11, (unint64_t)v10);
          }
        }
        if ([v12 code] == (id)-6723)
        {
          int v13 = sub_100607F30(v11);
          LOBYTE(v10) = 1;
          if (!v13 || v13 == -310000) {
            goto LABEL_19;
          }
          if (a4) {
            goto LABEL_12;
          }
        }
        else
        {
          int v14 = [v6 error];
          int v15 = sub_1006081F0(v11, (uint64_t)v10, v14 != 0);

          LOBYTE(v10) = 1;
          if (!v15 || v15 == -310000) {
            goto LABEL_19;
          }
          if (a4)
          {
LABEL_12:
            CBErrorF();
            LOBYTE(v10) = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

            goto LABEL_20;
          }
        }
        LOBYTE(v10) = 0;
        goto LABEL_19;
      }
      if (a4)
      {
LABEL_27:
        CBErrorF();
        LOBYTE(v10) = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else if (a4)
    {
      goto LABEL_27;
    }
    LOBYTE(v10) = 0;
    goto LABEL_20;
  }
  if (a4)
  {
    CBErrorF();
    LOBYTE(v10) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_21:

  return (char)v10;
}

- (void)_pairingCompletedWithBTDevice:(void *)a3 result:(int)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = self->_pairingClients;
  id v7 = [(CBPairable *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v12 = [v11 pairingCompletedHandler];
        if (v12)
        {
          int v13 = [v11 dispatchQueue];
          dispatch_assert_queue_V2(v13);

          if (!v8)
          {
            id v14 = objc_alloc((Class)CBDevice);
            id v21 = 0;
            id v8 = [v14 initWithBTStackDevice:a3 error:&v21];
            id v15 = v21;
            id v16 = v15;
            if (!v8)
            {
              if (dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
              {
                sub_100474E18((uint64_t)a3, &__p);
                uint64_t v18 = CUPrintNSError();
                LogPrintF_safe();

                if (v20 < 0) {
                  operator delete(__p);
                }
              }

              goto LABEL_23;
            }
          }
          if (a4)
          {
            uint64_t v17 = CBErrorF();
          }
          else
          {
            uint64_t v17 = 0;
          }
          ((void (**)(void, id, void *))v12)[2](v12, v8, v17);
        }
      }
      id v7 = [(CBPairable *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_23:
    id v8 = 0;
  }
}

- (void)_pairingPromptWithBTDevice:(void *)a3 pairingType:(int64_t)a4 pinString:(id)a5 flags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = self->_pairingClients;
  id v10 = [(CBPairable *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = 0;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v15 = [v14 pairingPromptHandler];
        if (v15)
        {
          id v16 = [v14 dispatchQueue];
          dispatch_assert_queue_V2(v16);

          if (!v11)
          {
            id v17 = objc_alloc((Class)CBDevice);
            id v26 = 0;
            id v11 = [v17 initWithBTStackDevice:a3 error:&v26];
            id v18 = v26;
            uint64_t v19 = v18;
            if (!v11)
            {
              if (dword_1009F8660 <= 90 && (dword_1009F8660 != -1 || _LogCategory_Initialize()))
              {
                sub_100474E18((uint64_t)a3, &__p);
                id v21 = CUPrintNSError();
                LogPrintF_safe();

                if (v25 < 0) {
                  operator delete(__p);
                }
              }

              goto LABEL_20;
            }
          }
          id v20 = objc_alloc_init((Class)CBPairingInfo);
          [v20 setDevice:v11];
          [v20 setFlags:v6];
          [v20 setPairingType:a4];
          [v20 setPin:v9];
          ((void (**)(void, id))v15)[2](v15, v20);
        }
      }
      id v10 = [(CBPairable *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_20:
    id v11 = 0;
  }
}

- (id)controllerDataChangedHandler
{
  return self->_controllerDataChangedHandler;
}

- (void)setControllerDataChangedHandler:(id)a3
{
}

- (id)discoverableStateChangedHandler
{
  return self->_discoverableStateChangedHandler;
}

- (void)setDiscoverableStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)inquiryStateChangedHandler
{
  return self->_inquiryStateChangedHandler;
}

- (void)setInquiryStateChangedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)powerChangedHandler
{
  return self->_powerChangedHandler;
}

- (void)setPowerChangedHandler:(id)a3
{
}

- (id)relayMessageHandler
{
  return self->_relayMessageHandler;
}

- (void)setRelayMessageHandler:(id)a3
{
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_fastLEConnectionInfoVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastLEConnectionInfoData, 0);
  objc_storeStrong(&self->_relayMessageHandler, 0);
  objc_storeStrong(&self->_powerChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_inquiryStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_discoverableStateChangedHandler, 0);
  objc_storeStrong(&self->_controllerDataChangedHandler, 0);
  objc_storeStrong((id *)&self->_performDeviceRequests, 0);
  objc_storeStrong((id *)&self->_pairingClients, 0);
  objc_storeStrong((id *)&self->_modifyDeviceRequests, 0);
  objc_storeStrong((id *)&self->_discoverableSessionMap, 0);

  objc_storeStrong((id *)&self->_connectDeviceRequests, 0);
}

@end