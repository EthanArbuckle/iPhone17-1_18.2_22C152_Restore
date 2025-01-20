@interface WCM_R1ControllerIOS
- (WCM_R1ControllerIOS)init;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)handleRCU1Connection:(id)a3;
- (void)handleRCU1QueryStatus:(id)a3;
- (void)sendRCU1Message:(BOOL)a3 wifiBand:(unsigned __int8)a4 btPowerState:(BOOL)a5 btBand:(unsigned __int8)a6 isForce:(BOOL)a7;
@end

@implementation WCM_R1ControllerIOS

- (void)sendRCU1Message:(BOOL)a3 wifiBand:(unsigned __int8)a4 btPowerState:(BOOL)a5 btBand:(unsigned __int8)a6 isForce:(BOOL)a7
{
  unsigned int v7 = a4;
  BOOL v10 = byte_10027D100 == a3 && dword_10027D104 == a4;
  if (v10 && byte_10027D108 == a5 && byte_10027D109 == a6 && !a7)
  {
    +[WCM_Logging logLevel:3, @"Don't send RCU1Message - No change in WiFi/BT state WiFiPower = (%d) WiFiband = (%d) btPower = (%d) btBand= (%d)force = [%d]", a3, a4, a5, a6, 0 message];
  }
  else
  {
    byte_10027D100 = a3;
    dword_10027D104 = a4;
    byte_10027D108 = a5;
    byte_10027D109 = a6;
    +[WCM_Logging logLevel:2, @"send RCU1Message WiFiPower = (%d) WiFiband = (%d) btPower = (%d) btBand= (%d)force = [%d]", a3, a4, a5, a6, a7 message];
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v11, "kWCMHToRCU1wiFiPowerStatus", a3);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU15GStatus", v7);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU1DutyCycle", 0xAuLL);
    xpc_dictionary_set_BOOL(v11, "kWCMHToRCU1BTPowerStatus", byte_10027D108);
    xpc_dictionary_set_uint64(v11, "kWCMHToRCU1BTBandStatus", byte_10027D109);
    [(WCM_Controller *)self sendMessage:1500 withArgs:v11];
    xpc_release(v11);
  }
}

- (WCM_R1ControllerIOS)init
{
  v4.receiver = self;
  v4.super_class = (Class)WCM_R1ControllerIOS;
  v2 = [(WCM_R1Controller *)&v4 init];
  [(WCM_R1Controller *)v2 setMRCU1NbBandMask:0];
  return v2;
}

- (void)dealloc
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  if (v3) {
    [v3 updateWiFiRCU1ModeChanged:1 andChannelChanged:1 andMode:&off_10023CB58 andChannel:&off_10023CB58];
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_R1ControllerIOS;
  [(WCM_R1Controller *)&v4 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  BOOL v3 = a3;
  [(WCM_R1Controller *)self setMRCU1NbBandMask:0];
  v5.receiver = self;
  v5.super_class = (Class)WCM_R1ControllerIOS;
  [(WCM_R1Controller *)&v5 handlePowerState:v3];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:2, @"In RCU1 Controller handleMessage messageId = %lld", uint64 message];
  if (uint64 == 801)
  {
    [(WCM_R1ControllerIOS *)self handleRCU1QueryStatus:a3];
  }
  else if (uint64 == 800)
  {
    [(WCM_R1ControllerIOS *)self handleRCU1Connection:a3];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"RCU1 controller dropping message-id %lld", uint64 message];
  }
}

- (void)handleRCU1Connection:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  [(WCM_R1Controller *)self setMRCU1PowerOn:xpc_dictionary_get_BOOL(value, "kWCMRCU1PowerOn")];
  if (xpc_dictionary_get_value(value, "kWCMRCU1ChannelNum")) {
    [(WCM_R1Controller *)self setMRCU1ChannelNum:xpc_dictionary_get_uint64(value, "kWCMRCU1ChannelNum")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1OnDuration")) {
    [(WCM_R1Controller *)self setMRCU1OnDuration:xpc_dictionary_get_uint64(value, "kWCMRCU1OnDuration")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1CycleLength")) {
    [(WCM_R1Controller *)self setMRCU1CycleLength:xpc_dictionary_get_uint64(value, "kWCMRCU1CycleLength")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1NumerOfCycles")) {
    [(WCM_R1Controller *)self setMRCU1NumberOfCycles:xpc_dictionary_get_uint64(value, "kWCMRCU1NumerOfCycles")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1FrameFormat")) {
    [(WCM_R1Controller *)self setMRCU1FrameFormat:xpc_dictionary_get_uint64(value, "kWCMRCU1FrameFormat")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1UseCaseNum")) {
    [(WCM_R1Controller *)self setMRCU1UseCaseNum:xpc_dictionary_get_uint64(value, "kWCMRCU1UseCaseNum")];
  }
  if (xpc_dictionary_get_value(value, "kWCMRCU1SideChBandMask")) {
    [(WCM_R1Controller *)self setMRCU1NbBandMask:xpc_dictionary_get_uint64(value, "kWCMRCU1SideChBandMask")];
  }
  BOOL v5 = [(WCM_R1Controller *)self mRCU1PowerOn]
    && ([(WCM_R1Controller *)self mRCU1ChannelNum] == 5
     || [(WCM_R1Controller *)self mRCU1NbBandMask]);
  [(WCM_R1Controller *)self setMRCU15GHzInUse:v5];
  +[WCM_Logging logLevel:2, @"Received from RCU1 Controller Power = (%d) Channel Num = (%d) On Duration = (%d) Cycle Length = (%d) Number of Cycles = (%d) Frame Format = (%d) Use Case Num = (%d) Side Band Mask = (%d)", [(WCM_R1Controller *)self mRCU1PowerOn], [(WCM_R1Controller *)self mRCU1ChannelNum], [(WCM_R1Controller *)self mRCU1OnDuration], [(WCM_R1Controller *)self mRCU1CycleLength], [(WCM_R1Controller *)self mRCU1NumberOfCycles], [(WCM_R1Controller *)self mRCU1FrameFormat], [(WCM_R1Controller *)self mRCU1UseCaseNum], [(WCM_R1Controller *)self mRCU1NbBandMask] message];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1100];
  if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "cellularRc1PolicyManager"))
  {
    +[WCM_Logging logLevel:2, @"Update RCU1 channel = %d, NBBandMask = %d", [(WCM_R1Controller *)self mRCU1ChannelNum], [(WCM_R1Controller *)self mRCU1NbBandMask] message];
    id v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") cellularRc1PolicyManager];
    uint64_t v7 = [(WCM_R1Controller *)self mRCU1ChannelNum];
    uint64_t v8 = [(WCM_R1Controller *)self mRCU1NbBandMask];
    [v6 updateRc1ChannelNumber:v7 NbChannelBitmask:v8];
  }
}

- (void)handleRCU1QueryStatus:(id)a3
{
  id v4 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton", a3) wifiController];
  id v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
  [v4 wifiState];
  id v6 = [v4 powerState];
  id v7 = [v5 powerState];
  id v8 = [v5 getAny5GHzBTDevicesConnected];
  unsigned int v9 = [v4 wifiState];
  unint64_t v10 = 0x202010000uLL >> (8 * v9);
  if (v9 >= 5) {
    LOBYTE(v10) = 0;
  }
  [(WCM_R1ControllerIOS *)self sendRCU1Message:v6 wifiBand:v10 & 3 btPowerState:v7 btBand:v8 isForce:1];
  id v11 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") cellularRc1PolicyManager];
  if (v11)
  {
    [v11 updateRc1OverallConfig];
  }
}

@end