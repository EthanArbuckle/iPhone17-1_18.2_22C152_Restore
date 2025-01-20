@interface WCM_BTController
- (BOOL)get2GHzSub15msAudioDevicesConnected;
- (BOOL)get2GHzSub15msNonSCOConnected;
- (BOOL)getAny2GHzBTDevicesConnected;
- (BOOL)getAny2GHzBTDevicesConnectedIgnoreLE;
- (BOOL)getAny5GHzBTDevicesConnected;
- (BOOL)getAnyAoSLinkActive;
- (BOOL)getOverLEDeviceSingleConnection;
- (BOOL)isBTMetricsValid;
- (BOOL)isBtAntennaDesensed;
- (BOOL)powerState;
- (NSMutableArray)btConnections;
- (NSString)AoSDeviceID;
- (WCM_BTController)init;
- (double)getBtRxPer;
- (double)getBtTxPer;
- (int)audioType;
- (int)getBTRole;
- (int)getBTState;
- (int64_t)getLeDiscoveryScanState;
- (int64_t)getLeDiscoveryScanUseCase;
- (unint64_t)getBtActivePhy;
- (unint64_t)getBtMaxPhyRate;
- (unint64_t)getLeConnBand;
- (unint64_t)getLeConnDuration;
- (unint64_t)getLeConnDutyCycle;
- (unint64_t)getLeConnReason;
- (unint64_t)getMovingAvgBTRssi;
- (unint64_t)getNum2GHzAclA2DPDevices;
- (unint64_t)getNumberOfBTGameCtrlDev;
- (unint64_t)num2GHzAoSBiAudioDevice;
- (unint64_t)num2GHzAoSUniAudioDevice;
- (unint64_t)num5GHzAoSBiAudioDevice;
- (unint64_t)num5GHzAoSUniAudioDevice;
- (unint64_t)numA2DPDevice;
- (unint64_t)numGameCtrlDev10ms;
- (unint64_t)numGameCtrlDev75ms;
- (unint64_t)numHIDDevice;
- (unint64_t)numLEADevice;
- (unint64_t)numLEDevice;
- (unint64_t)numLLADevice;
- (unint64_t)numSCODevice;
- (unint64_t)numeSCODevice;
- (void)addBTConnection:(id)a3;
- (void)clearAoSDeviceCounts;
- (void)dealloc;
- (void)handleAADeviceFound:(id)a3;
- (void)handleAADeviceLost:(id)a3;
- (void)handleAudioConfig:(id)a3;
- (void)handleConnectionConfig:(id)a3;
- (void)handleLocalDeviceState:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)printBTConnInfo;
- (void)printBTConnections;
- (void)removeBTConnection:(id)a3;
- (void)setAoSDeviceID:(id)a3;
- (void)setAudioType:(int)a3;
- (void)setNum2GHzAoSBiAudioDevice:(unint64_t)a3;
- (void)setNum2GHzAoSUniAudioDevice:(unint64_t)a3;
- (void)setNum5GHzAoSBiAudioDevice:(unint64_t)a3;
- (void)setNum5GHzAoSUniAudioDevice:(unint64_t)a3;
- (void)setNumA2DPDevice:(unint64_t)a3;
- (void)setNumGameCtrlDev10ms:(unint64_t)a3;
- (void)setNumGameCtrlDev75ms:(unint64_t)a3;
- (void)setNumHIDDevice:(unint64_t)a3;
- (void)setNumLEADevice:(unint64_t)a3;
- (void)setNumLEDevice:(unint64_t)a3;
- (void)setNumLLADevice:(unint64_t)a3;
- (void)setNumSCODevice:(unint64_t)a3;
- (void)setNumeSCODevice:(unint64_t)a3;
- (void)update5GHzHostAP:(BOOL)a3;
- (void)updateAWDLActive:(BOOL)a3;
- (void)updateAWDLRTGActive:(BOOL)a3;
- (void)updateLowWiFi5GRates:(BOOL)a3;
- (void)updateNANActive:(BOOL)a3;
- (void)updateUWB5GHzActive:(BOOL)a3;
- (void)updateWiFiChannelInfo:(unsigned int)a3 bandwidth:(unsigned int)a4 regBand:(int)a5;
@end

@implementation WCM_BTController

- (BOOL)powerState
{
  return BYTE4(self->mBTCtlQueue);
}

- (NSMutableArray)btConnections
{
  return *(NSMutableArray **)((char *)&self->num5GHzAoSBiAudioDevice + 4);
}

- (BOOL)get2GHzSub15msNonSCOConnected
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4)
      || *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4)
      || *(unint64_t *)((char *)&self->numSCODevice + 4) != 0;
}

- (unint64_t)numeSCODevice
{
  return *(unint64_t *)((char *)&self->numSCODevice + 4);
}

- (unint64_t)numSCODevice
{
  return *(void *)&self->_audioType;
}

- (unint64_t)numLLADevice
{
  return *(unint64_t *)((char *)&self->numLEDevice + 4);
}

- (unint64_t)numLEDevice
{
  return *(unint64_t *)((char *)&self->numLEADevice + 4);
}

- (unint64_t)numLEADevice
{
  return *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4);
}

- (unint64_t)numHIDDevice
{
  return *(unint64_t *)((char *)&self->numA2DPDevice + 4);
}

- (BOOL)isBtAntennaDesensed
{
  return 0;
}

- (unint64_t)getNum2GHzAclA2DPDevices
{
  if (*(unint64_t *)((char *)&self->numLLADevice + 4)
    || *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4))
  {
    return 0;
  }
  else
  {
    return *(unint64_t *)((char *)&self->numeSCODevice + 4);
  }
}

- (BOOL)getAnyAoSLinkActive
{
  return *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4)
       + *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getAny5GHzBTDevicesConnected
{
  return *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4)
       + *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) != 0;
}

- (int)audioType
{
  return *(_DWORD *)&self->_powerState;
}

- (WCM_BTController)init
{
  v10.receiver = self;
  v10.super_class = (Class)WCM_BTController;
  v2 = [(WCM_Controller *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2[36] = 0;
    *((_DWORD *)v2 + 10) = 0;
    *(void *)(v2 + 148) = objc_alloc_init((Class)NSMutableArray);
    *(void *)(v3 + 44) = 0;
    *(void *)(v3 + 52) = 0;
    *(void *)(v3 + 60) = 0;
    *(void *)(v3 + 68) = 0;
    *(void *)(v3 + 76) = 0;
    *(void *)(v3 + 84) = 0;
    *(void *)(v3 + 92) = 0;
    *(void *)(v3 + 100) = 0;
    *(void *)(v3 + 108) = 0;
    qword_10027CED0 = 0;
    qword_10027CEC8 = 0;
    *(void *)(v3 + 116) = 0;
    *(void *)(v3 + 124) = 0;
    *(void *)(v3 + 132) = 0;
    *(void *)(v3 + 140) = 0;
    if (objc_opt_class())
    {
      *(void *)(v3 + 156) = objc_alloc_init((Class)NSString);
      *(void *)(v3 + 28) = dispatch_queue_create("com.apple.WirelessRadioManager.BTCtl", 0);
      id v4 = objc_alloc_init((Class)AADeviceManager);
      *(void *)(v3 + 20) = v4;
      [v4 setDispatchQueue:*(void *)(v3 + 28)];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100096B54;
      v9[3] = &unk_10020FA90;
      v9[4] = v3;
      [*(id *)(v3 + 20) setDeviceFoundHandler:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100096B60;
      v8[3] = &unk_10020FA90;
      v8[4] = v3;
      [*(id *)(v3 + 20) setDeviceLostHandler:v8];
      v5 = *(void **)(v3 + 20);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100096B6C;
      v7[3] = &unk_10020FAF8;
      v7[4] = v3;
      [v5 activateWithCompletion:v7];
    }
  }
  +[WCM_Logging logLevel:2 message:@"BTController Init"];
  return (WCM_BTController *)v3;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"BTController Dealloc"];
  [(NSMutableArray *)[(WCM_BTController *)self btConnections] removeAllObjects];

  [*(id *)(&self->super.mProcessId + 1) invalidate];
  v3 = *(NSObject **)((char *)&self->deviceManager + 4);
  if (v3)
  {
    dispatch_release(v3);
    *(AADeviceManager **)((char *)&self->deviceManager + 4) = 0;
  }
  if (qword_10027CED0) {
    xpc_release((xpc_object_t)qword_10027CED0);
  }
  if (qword_10027CEC8) {
    xpc_release((xpc_object_t)qword_10027CEC8);
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_BTController;
  [(WCM_Controller *)&v4 dealloc];
}

- (void)handleLocalDeviceState:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTLocalDeviceState");
    +[WCM_Logging logLevel:5, @"BT powerState(%d -> %d)", [(WCM_BTController *)self powerState], uint64 != 0 message];
    if (uint64 != [(WCM_BTController *)self powerState])
    {
      [(WCM_BTController *)self handlePowerState:uint64 != 0];
      id v6 = +[WCM_PolicyManager singleton];
      [v6 updateControllerState:506];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Error Getting Args"];
  }
}

- (void)handleConnectionConfig:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTConnectionConfiguration_EventId");
  uint64_t v6 = xpc_dictionary_get_uint64(value, "kWCMBTConnectionConfiguration_Result");
  +[WCM_Logging logLevel:2, @"Received BT connection indication eventId(%llu) result(%llu)", uint64, v6 message];
  if (uint64 == 12)
  {
    if (v6 == 307) {
      [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") handleErrorReport:0];
    }
    [(WCM_BTController *)self removeBTConnection:value];
  }
  else if (uint64 == 11 && !v6)
  {
    [(WCM_BTController *)self addBTConnection:value];
  }
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:500];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1000];
  id v7 = +[WCM_PolicyManager singleton];

  [v7 updateControllerState:1300];
}

- (void)handleAudioConfig:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_Type");
  uint64_t v7 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_PacketType");
  uint64_t v8 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_ConnectionState");
  uint64_t v9 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_Role");
  xpc_object_t v10 = (xpc_object_t)qword_10027CED0;
  if (!qword_10027CED0)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    qword_10027CED0 = (uint64_t)v10;
  }
  if (xpc_equal(v10, a3))
  {
    +[WCM_Logging logLevel:2, @"HandleAudioConfig: Discard the same message %@", qword_10027CED0 message];
  }
  else
  {
    xpc_release((xpc_object_t)qword_10027CED0);
    qword_10027CED0 = (uint64_t)xpc_copy(a3);
    switch(uint64)
    {
      case 1uLL:
        [(WCM_BTController *)self setAudioType:3];
        if (v7)
        {
          if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            [(WCM_BTController *)self setAudioType:2];
            uint64_t v11 = *(unint64_t *)((char *)&self->numSCODevice + 4);
            if (v8)
            {
              unint64_t v12 = v11 + 1;
              *(unint64_t *)((char *)&self->numSCODevice + 4) = v12;
              +[WCM_Logging logLevel:2, @"HandleAudioConfig : Received eSCO connection increase with count %lu", v12 message];
            }
            else if (v11)
            {
              unint64_t v27 = v11 - 1;
              *(unint64_t *)((char *)&self->numSCODevice + 4) = v27;
              +[WCM_Logging logLevel:2, @"HandleAudioConfig : Received eSCO connection drop with count %lu", v27 message];
            }
          }
        }
        else
        {
          [(WCM_BTController *)self setAudioType:1];
          uint64_t v20 = *(void *)&self->_audioType;
          if (v8)
          {
            uint64_t v21 = v20 + 1;
            *(void *)&self->_audioType = v21;
            +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received SCO connection increase with count %lu", v21 message];
          }
          else if (v20)
          {
            uint64_t v26 = v20 - 1;
            *(void *)&self->_audioType = v26;
            +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received SCO connection drop with count %lu", v26 message];
          }
        }
        goto LABEL_34;
      case 2uLL:
        [(WCM_BTController *)self setAudioType:4];
        uint64_t v15 = *(unint64_t *)((char *)&self->numeSCODevice + 4);
        if (v8)
        {
          unint64_t v16 = v15 + 1;
          *(unint64_t *)((char *)&self->numeSCODevice + 4) = v16;
          +[WCM_Logging logLevel:2, @"HandleAudioConfig : Received A2DP connection increase with count %lu", v16 message];
        }
        else if (v15)
        {
          unint64_t v22 = v15 - 1;
          *(unint64_t *)((char *)&self->numeSCODevice + 4) = v22;
          +[WCM_Logging logLevel:2, @"HandleAudioConfig : Received A2DP connection drop with count %lu", v22 message];
        }
        [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateGpsbandsInfoForBB];
        goto LABEL_34;
      case 3uLL:
        [(WCM_BTController *)self setAudioType:5];
        uint64_t v17 = *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4);
        if (v8)
        {
          unint64_t v18 = v17 + 1;
          *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = v18;
          +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received LEA connection increase with count %lu", v18 message];
        }
        else if (v17)
        {
          unint64_t v23 = v17 - 1;
          *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = v23;
          +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received LEA connection drop with count %lu", v23 message];
        }
        goto LABEL_34;
      case 4uLL:
        if (v7 == 2)
        {
          uint64_t v24 = *(unint64_t *)((char *)&self->numLEDevice + 4);
          if (v24)
          {
            unint64_t v25 = v24 - 1;
            *(unint64_t *)((char *)&self->numLEDevice + 4) = v25;
            +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received LLA connection drop with count %lu", v25 message];
          }
        }
        else if (v7 == 1)
        {
          unint64_t v19 = *(unint64_t *)((char *)&self->numLEDevice + 4) + 1;
          *(unint64_t *)((char *)&self->numLEDevice + 4) = v19;
          +[WCM_Logging logLevel:2, @"HandleAudioConfig: Received LLA connection increase with count %lu", v19 message];
        }
        else
        {
          +[WCM_Logging logLevel:2, @"HandleAudioConfig: Incorrect LLA pktType state received %llu", v7 message];
        }
LABEL_34:
        +[WCM_Logging logLevel:2, @"Audio config: role(%llu) state(%llu) type(%llu) pktType(%llu) audioType(%d) coexAudioStateChange(%d)", v9, v8, uint64, v7, [(WCM_BTController *)self audioType], 1 message];
        [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:501];
        [(WCM_BTController *)self printBTConnections];
        [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
        [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1000];
        id v13 = +[WCM_PolicyManager singleton];
        uint64_t v14 = 1300;
        break;
      default:
        if (!v8) {
          [(WCM_BTController *)self setAudioType:0];
        }
        +[WCM_Logging logLevel:2, @"Audio config: role(%llu) state(%llu) type(%llu) pktType(%llu) audioType(%d) coexAudioStateChange(%d)", v9, v8, uint64, v7, [(WCM_BTController *)self audioType], 0 message];
        id v13 = +[WCM_PolicyManager singleton];
        uint64_t v14 = 501;
        break;
    }
    [v13 updateControllerState:v14];
  }
}

- (void)addBTConnection:(id)a3
{
  v5 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a3, "kWCMBTConnectionConfiguration_Address")];
  if (v5)
  {
    uint64_t v6 = v5;
    __int16 uint64 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ServiceId");
    uint64_t v8 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_RequiresRC2CoExType");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(WCM_BTController *)self btConnections];
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (-[NSString compare:](v6, "compare:", [v14 getAddress]) == NSOrderedSame) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      [v14 updateConnectionInfo:a3];
      if (v14) {
        goto LABEL_23;
      }
    }
LABEL_12:
    uint64_t v15 = [WCM_BTConnection alloc];
    [(WCM_BTConnection *)v15 initWithAddress:v6];
    +[WCM_Logging logLevel:2 message:@"Adding New BT Connection"];
    [(NSMutableArray *)[(WCM_BTController *)self btConnections] addObject:v15];
    [(WCM_BTConnection *)v15 updateConnectionInfo:a3];
    [(WCM_BTConnection *)v15 manageServiceConnection];

    if ((uint64 & 0x20) != 0)
    {
      [(WCM_BTController *)self setNumHIDDevice:(char *)[(WCM_BTController *)self numHIDDevice] + 1];
      if (v8 == 2)
      {
        [(WCM_BTController *)self setNumGameCtrlDev10ms:(char *)[(WCM_BTController *)self numGameCtrlDev10ms] + 1];
        +[WCM_Logging logLevel:2, @"Adding 10 ms Game controller connection device count - total %lu", [(WCM_BTController *)self numGameCtrlDev10ms] message];
      }
      else if (v8 == 1)
      {
        [(WCM_BTController *)self setNumGameCtrlDev75ms:(char *)[(WCM_BTController *)self numGameCtrlDev75ms] + 1];
        +[WCM_Logging logLevel:2, @"Adding 7.5 ms Game controller connection device count - total %lu", [(WCM_BTController *)self numGameCtrlDev75ms] message];
      }
    }
    else
    {
      if ((uint64 & 0x8000) == 0)
      {
LABEL_23:
        [(WCM_BTController *)self printBTConnInfo];
        return;
      }
      [(WCM_BTController *)self setNumLEDevice:(char *)[(WCM_BTController *)self numLEDevice] + 1];
      +[WCM_Logging logLevel:2, @"Adding new LE device - total %lu", [(WCM_BTController *)self numLEDevice] message];
    }
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
    [(WCM_BTController *)self printBTConnections];
    goto LABEL_23;
  }

  +[WCM_Logging logLevel:0 message:@"no BT address specified"];
}

- (void)removeBTConnection:(id)a3
{
  v5 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a3, "kWCMBTConnectionConfiguration_Address")];
  if (v5)
  {
    uint64_t v6 = v5;
    __int16 uint64 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ServiceId");
    uint64_t v8 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_RequiresRC2CoExType");
    if ((uint64 & 0x20) != 0)
    {
      uint64_t v9 = v8;
      if ([(WCM_BTController *)self numHIDDevice])
      {
        [(WCM_BTController *)self setNumHIDDevice:(char *)[(WCM_BTController *)self numHIDDevice] - 1];
        [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
        [(WCM_BTController *)self printBTConnections];
      }
      if (v9 == 2)
      {
        if ([(WCM_BTController *)self numGameCtrlDev10ms])
        {
          +[WCM_Logging logLevel:2 message:@"Removing 10ms Game controller connection device count"];
          [(WCM_BTController *)self setNumGameCtrlDev10ms:(char *)[(WCM_BTController *)self numGameCtrlDev10ms] - 1];
        }
      }
      else if (v9 == 1 && [(WCM_BTController *)self numGameCtrlDev75ms])
      {
        +[WCM_Logging logLevel:2 message:@"Removing 7.5ms Game controller connection device count"];
        [(WCM_BTController *)self setNumGameCtrlDev75ms:(char *)[(WCM_BTController *)self numGameCtrlDev75ms] - 1];
      }
    }
    else if (uint64 < 0 && [(WCM_BTController *)self numLEDevice])
    {
      +[WCM_Logging logLevel:2 message:@"Removing LE Device"];
      [(WCM_BTController *)self setNumLEDevice:(char *)[(WCM_BTController *)self numLEDevice] - 1];
      [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
      [(WCM_BTController *)self printBTConnections];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [(WCM_BTController *)self btConnections];
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (-[NSString compare:](v6, "compare:", [v15 getAddress]) == NSOrderedSame)
          {
            if (v15)
            {
              [v15 manageServiceDisconnection];
              if (![v15 getServiceCount])
              {
                +[WCM_Logging logLevel:2, @"Removing BT Connection %@", v15 message];
                [(NSMutableArray *)[(WCM_BTController *)self btConnections] removeObject:v15];
              }
            }
            goto LABEL_29;
          }
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_29:
    [(WCM_BTController *)self printBTConnections];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
    [(WCM_BTController *)self printBTConnInfo];
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"no BT address specified"];
  }
}

- (void)printBTConnInfo
{
  +[WCM_Logging logLevel:2, @"BT has %lu connections", [(NSMutableArray *)[(WCM_BTController *)self btConnections] count] message];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(WCM_BTController *)self btConnections];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        +[WCM_Logging logLevel:2, @"%@", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7) message];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)handlePowerState:(BOOL)a3
{
  BYTE4(self->mBTCtlQueue) = a3;
  if (!a3)
  {
    *(_DWORD *)&self->_powerState = 0;
    *(unint64_t *)((char *)&self->numSCODevice + 4) = 0;
    *(unint64_t *)((char *)&self->numeSCODevice + 4) = 0;
    *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = 0;
    *(unint64_t *)((char *)&self->numLEADevice + 4) = 0;
    *(void *)&self->_audioType = 0;
    *(unint64_t *)((char *)&self->numA2DPDevice + 4) = 0;
    *(unint64_t *)((char *)&self->numLEDevice + 4) = 0;
    *(unint64_t *)((char *)&self->numLLADevice + 4) = 0;
    *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = 0;
    *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = 0;
    *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = 0;
    *(NSMutableArray **)((char *)&self->_btConnections + 4) = (NSMutableArray *)&stru_100226328;
    if (qword_10027CED0)
    {
      xpc_release((xpc_object_t)qword_10027CED0);
      qword_10027CED0 = 0;
    }
    if (qword_10027CEC8)
    {
      xpc_release((xpc_object_t)qword_10027CEC8);
      qword_10027CEC8 = 0;
    }
    [(NSMutableArray *)[(WCM_BTController *)self btConnections] removeAllObjects];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
    [(WCM_BTController *)self printBTConnections];
  }
}

- (void)handleAADeviceFound:(id)a3
{
  unsigned __int8 v5 = -[NSString isEqualToString:](-[WCM_BTController AoSDeviceID](self, "AoSDeviceID"), "isEqualToString:", [a3 identifier]);
  unsigned int v6 = [a3 streamStateAoS];
  if ((v5 & 1) == 0)
  {
    if (v6 != 2)
    {
      unsigned int v15 = [a3 streamStateAoS];
      if (v15 != 3) {
        return;
      }
      unsigned int v16 = [a3 frequencyBand];
      if (v16 == 2) {
        CFStringRef v17 = @"BTController: New 5GHz Bi-Dir AoS session started";
      }
      else {
        CFStringRef v17 = @"BTController: New 2GHz Bi-Dir AoS session started";
      }
      if (v16 == 2) {
        long long v18 = &OBJC_IVAR___WCM_BTController_num5GHzAoSBiAudioDevice;
      }
      else {
        long long v18 = &OBJC_IVAR___WCM_BTController_num2GHzAoSBiAudioDevice;
      }
      +[WCM_Logging logLevel:2 message:v17];
      *(Class *)((char *)&self->super.super.isa + *v18) = (Class)1;
      -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", [a3 identifier]);
      goto LABEL_42;
    }
    unsigned int v9 = [a3 frequencyBand];
    if (v9 == 2) {
      CFStringRef v10 = @"BTController: New 5GHz Uni-Dir AoS session started";
    }
    else {
      CFStringRef v10 = @"BTController: New 2GHz Uni-Dir AoS session started";
    }
    if (v9 == 2) {
      long long v11 = &OBJC_IVAR___WCM_BTController_num5GHzAoSUniAudioDevice;
    }
    else {
      long long v11 = &OBJC_IVAR___WCM_BTController_num2GHzAoSUniAudioDevice;
    }
    +[WCM_Logging logLevel:2 message:v10];
    *(Class *)((char *)&self->super.super.isa + *v11) = (Class)1;
    -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", [a3 identifier]);
LABEL_39:
    uint64_t v21 = self;
    uint64_t v22 = 6;
LABEL_43:
    [(WCM_BTController *)v21 setAudioType:v22];
    goto LABEL_44;
  }
  if (v6 == 2)
  {
    if ([a3 frequencyBand] == 2)
    {
      uint64_t v7 = (char *)&self->num2GHzAoSUniAudioDevice + 4;
      if (!*(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4))
      {
        CFStringRef v8 = @"BTController: Updating link to 5GHz AoS Uni-Dir";
LABEL_38:
        [(WCM_BTController *)self clearAoSDeviceCounts];
        *(void *)uint64_t v7 = 1;
        +[WCM_Logging logLevel:2 message:v8];
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v7 = (char *)&self->numLLADevice + 4;
      if (!*(unint64_t *)((char *)&self->numLLADevice + 4))
      {
        CFStringRef v8 = @"BTController: Updating link to 2GHz AoS Uni-Dir";
        goto LABEL_38;
      }
    }
    long long v19 = self;
    uint64_t v20 = 6;
    goto LABEL_34;
  }
  unsigned int v12 = [a3 streamStateAoS];
  if (v12 != 3)
  {
    [(WCM_BTController *)self setAoSDeviceID:&stru_100226328];
    [(WCM_BTController *)self clearAoSDeviceCounts];
    [(WCM_BTController *)self setAudioType:0];
    +[WCM_Logging logLevel:2 message:@"BTController: Dropping AoS Link"];
LABEL_44:
    [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
    [(WCM_BTController *)self printBTConnections];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:501];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1000];
    id v23 = +[WCM_PolicyManager singleton];
    [v23 updateControllerState:1300];
    return;
  }
  if ([a3 frequencyBand] == 2)
  {
    uint64_t v13 = (char *)&self->num2GHzAoSBiAudioDevice + 4;
    if (!*(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4))
    {
      CFStringRef v14 = @"BTController: Updating link to 5GHz AoS Bi-Dir";
LABEL_41:
      [(WCM_BTController *)self clearAoSDeviceCounts];
      *(void *)uint64_t v13 = 1;
      +[WCM_Logging logLevel:2 message:v14];
LABEL_42:
      uint64_t v21 = self;
      uint64_t v22 = 7;
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v13 = (char *)&self->num5GHzAoSUniAudioDevice + 4;
    if (!*(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4))
    {
      CFStringRef v14 = @"BTController: Updating link to 2GHz AoS Bi-Dir";
      goto LABEL_41;
    }
  }
  long long v19 = self;
  uint64_t v20 = 7;
LABEL_34:

  [(WCM_BTController *)v19 setAudioType:v20];
}

- (void)handleAADeviceLost:(id)a3
{
  if (-[NSString isEqualToString:](-[WCM_BTController AoSDeviceID](self, "AoSDeviceID"), "isEqualToString:", [a3 identifier]))
  {
    [(WCM_BTController *)self setAoSDeviceID:&stru_100226328];
    [(WCM_BTController *)self clearAoSDeviceCounts];
    +[WCM_Logging logLevel:2 message:@"AudioAccessory Device Lost"];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateWiFiBTConnectionReport];
    [(WCM_BTController *)self printBTConnections];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:501];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1000];
    id v4 = +[WCM_PolicyManager singleton];
    [v4 updateControllerState:1300];
  }
}

- (void)printBTConnections
{
}

- (void)clearAoSDeviceCounts
{
  *(unint64_t *)((char *)&self->numLLADevice + 4) = 0;
  *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = 0;
  *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = 0;
  *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = 0;
}

- (int)getBTState
{
  return 0;
}

- (int)getBTRole
{
  return 3;
}

- (unint64_t)getNumberOfBTGameCtrlDev
{
  unint64_t v3 = [(WCM_BTController *)self numGameCtrlDev75ms];
  return [(WCM_BTController *)self numGameCtrlDev10ms] + v3;
}

- (BOOL)getAny2GHzBTDevicesConnected
{
  unint64_t v2 = *(unint64_t *)((char *)&self->numSCODevice + 4) + *(void *)&self->_audioType;
  return (char *)[(WCM_BTController *)self getNum2GHzAclA2DPDevices]
       + *(unint64_t *)((char *)&self->numA2DPDevice + 4)
       + v2
       + *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
       + *(unint64_t *)((char *)&self->numLEADevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getAny2GHzBTDevicesConnectedIgnoreLE
{
  unint64_t v2 = *(unint64_t *)((char *)&self->numSCODevice + 4) + *(void *)&self->_audioType;
  return (char *)[(WCM_BTController *)self getNum2GHzAclA2DPDevices]
       + *(unint64_t *)((char *)&self->numA2DPDevice + 4)
       + v2
       + *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getOverLEDeviceSingleConnection
{
  if (*(unint64_t *)((char *)&self->numLEADevice + 4) > 1) {
    return 1;
  }
  unint64_t v3 = *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
     + *(unint64_t *)((char *)&self->numA2DPDevice + 4);
  return (char *)[(WCM_BTController *)self getNum2GHzAclA2DPDevices]
       + *(void *)&self->_audioType
       + v3
       + *(unint64_t *)((char *)&self->numSCODevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)get2GHzSub15msAudioDevicesConnected
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4)
      || *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4)
      || *(void *)&self->_audioType
      || *(unint64_t *)((char *)&self->numSCODevice + 4) != 0;
}

- (unint64_t)getLeConnDutyCycle
{
  return 0;
}

- (unint64_t)getLeConnReason
{
  return 0;
}

- (unint64_t)getLeConnBand
{
  return 0;
}

- (unint64_t)getLeConnDuration
{
  return 0;
}

- (int64_t)getLeDiscoveryScanState
{
  return -1;
}

- (int64_t)getLeDiscoveryScanUseCase
{
  return -1;
}

- (void)update5GHzHostAP:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBT5GHzHostAPActive", v3);
    [(WCM_Controller *)self sendMessage:1436 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about current 5GHz Host AP State: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about 5GHz Host AP State"];
  }
}

- (void)updateLowWiFi5GRates:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBT5GHzWiFiRatesLow", v3);
    [(WCM_Controller *)self sendMessage:1442 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about low 5G Rates: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about low 5G Rates:"];
  }
}

- (void)updateAWDLActive:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTAWDLActive", v3);
    [(WCM_Controller *)self sendMessage:1437 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about current AWDL Active State: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about AWDL Active State"];
  }
}

- (void)updateNANActive:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTNANActive", v3);
    [(WCM_Controller *)self sendMessage:1438 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about current NAN Active State: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about NAN Active State"];
  }
}

- (void)updateUWB5GHzActive:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTUWB5GHzActive", v3);
    [(WCM_Controller *)self sendMessage:1440 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about current UWB 5GHz State: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about UWB 5GHz State"];
  }
}

- (void)updateAWDLRTGActive:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    unsigned int v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTAWDLRTGActive", v3);
    [(WCM_Controller *)self sendMessage:1439 withArgs:v6];
    +[WCM_Logging logLevel:2, @"Sent message to BT about current AWDL RTG Active State: %d", v3 message];
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about AWDL RTG Active State"];
  }
}

- (void)updateWiFiChannelInfo:(unsigned int)a3 bandwidth:(unsigned int)a4 regBand:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    CFStringRef v10 = v9;
    xpc_dictionary_set_uint64(v9, "kWCMBTWiFiChannel", v7);
    xpc_dictionary_set_uint64(v10, "kWCMBTWiFiChannelBandwidth", v6);
    xpc_dictionary_set_uint64(v10, "kWCMBTWiFiRegulatoryBand", a5);
    [(WCM_Controller *)self sendMessage:1441 withArgs:v10];
    if (a5 >= 0xD)
    {
      long long v11 = "Invalid Freq Band";
      if (a5 == 13) {
        long long v11 = "UNII-8";
      }
    }
    else
    {
      long long v11 = off_10020FB18[a5];
    }
    +[WCM_Logging logLevel:2, @"Sent message to BT about current WiFi Channel Info: Channel %d Bandwidth %d FreqBand %s", v7, v6, v11 message];
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT about WiFi channel info"];
  }
}

- (unint64_t)getMovingAvgBTRssi
{
  return 128;
}

- (unint64_t)getBtMaxPhyRate
{
  return 0;
}

- (unint64_t)getBtActivePhy
{
  return 0;
}

- (BOOL)isBTMetricsValid
{
  return 0;
}

- (double)getBtTxPer
{
  return 0.0;
}

- (double)getBtRxPer
{
  return 0.0;
}

- (void)setNumSCODevice:(unint64_t)a3
{
  *(void *)&self->_audioType = a3;
}

- (void)setNumeSCODevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numSCODevice + 4) = a3;
}

- (unint64_t)numA2DPDevice
{
  return *(unint64_t *)((char *)&self->numeSCODevice + 4);
}

- (void)setNumA2DPDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numeSCODevice + 4) = a3;
}

- (void)setNumHIDDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numA2DPDevice + 4) = a3;
}

- (unint64_t)numGameCtrlDev75ms
{
  return *(unint64_t *)((char *)&self->numHIDDevice + 4);
}

- (void)setNumGameCtrlDev75ms:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numHIDDevice + 4) = a3;
}

- (unint64_t)numGameCtrlDev10ms
{
  return *(unint64_t *)((char *)&self->numGameCtrlDev75ms + 4);
}

- (void)setNumGameCtrlDev10ms:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numGameCtrlDev75ms + 4) = a3;
}

- (void)setNumLEADevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = a3;
}

- (void)setNumLEDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLEADevice + 4) = a3;
}

- (void)setNumLLADevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLEDevice + 4) = a3;
}

- (unint64_t)num2GHzAoSUniAudioDevice
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4);
}

- (void)setNum2GHzAoSUniAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLLADevice + 4) = a3;
}

- (unint64_t)num5GHzAoSUniAudioDevice
{
  return *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4);
}

- (void)setNum5GHzAoSUniAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = a3;
}

- (unint64_t)num2GHzAoSBiAudioDevice
{
  return *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4);
}

- (void)setNum2GHzAoSBiAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = a3;
}

- (unint64_t)num5GHzAoSBiAudioDevice
{
  return *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4);
}

- (void)setNum5GHzAoSBiAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = a3;
}

- (void)setAudioType:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (NSString)AoSDeviceID
{
  return *(NSString **)((char *)&self->_btConnections + 4);
}

- (void)setAoSDeviceID:(id)a3
{
}

@end