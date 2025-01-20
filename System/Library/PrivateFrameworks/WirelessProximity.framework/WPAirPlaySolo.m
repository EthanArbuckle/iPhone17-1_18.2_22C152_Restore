@interface WPAirPlaySolo
+ (id)puckTypeToString:(unsigned __int8)a3;
+ (unsigned)puckStringToType:(id)a3;
- (WPAirPlaySolo)init;
- (WPAirPlaySolo)initWithDelegate:(id)a3 queue:(id)a4;
- (WPAirPlaySoloDelegate)delegate;
- (id)clientAsString;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4;
- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)invalidate;
- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)peerTrackingAvailable;
- (void)peerTrackingFull;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)startConnectionlessAdvertisingWithData:(id)a3;
- (void)startConnectionlessScanningWithData:(id)a3;
- (void)startTrackingPeer:(id)a3 withData:(id)a4;
- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
- (void)stateDidChange:(int64_t)a3;
- (void)stopConnectionlessAdvertising;
- (void)stopConnectionlessAdvertising:(id)a3;
- (void)stopConnectionlessScanningWithData:(id)a3;
- (void)stopTrackingPeer:(id)a3 withData:(id)a4;
- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4;
@end

@implementation WPAirPlaySolo

- (WPAirPlaySolo)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  v7 = [(WPClient *)&v10 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (WPAirPlaySolo)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer for %@", v5, v7 format];

  return 0;
}

- (id)clientAsString
{
  return @"AirplaySolo";
}

- (void)invalidate
{
  [(WPAirPlaySolo *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v3 invalidate];
}

+ (unsigned)puckStringToType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WPPuckTypeAirPlaySoloSourcePresence"])
  {
    unsigned __int8 v4 = 10;
  }
  else if ([v3 isEqualToString:@"WPPuckTypeAirPlaySoloTargetPresence"])
  {
    unsigned __int8 v4 = 9;
  }
  else
  {
    unsigned __int8 v4 = 27;
  }

  return v4;
}

+ (id)puckTypeToString:(unsigned __int8)a3
{
  if (a3 == 10) {
    return @"WPPuckTypeAirPlaySoloSourcePresence";
  }
  unsigned int v3 = a3;
  if (a3 == 9) {
    return @"WPPuckTypeAirPlaySoloTargetPresence";
  }
  v7 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"WPAirPlaySolo.m", 102, @"Unknown puck type %ld", v3);

  return 0;
}

- (void)startConnectionlessAdvertisingWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"WPPuckType"];
  uint64_t v6 = +[WPAirPlaySolo puckStringToType:v5];

  v7 = +[WPAdvertisingRequest requestForClientType:v6];
  v8 = [v4 objectForKeyedSubscript:@"WPPuckTypeAirPlaySoloAdvertisingData"];
  [v7 setAdvertisingData:v8];

  v9 = [v4 objectForKeyedSubscript:@"WPAirPlaySoloAdvertisingMode"];
  objc_super v10 = [v4 objectForKeyedSubscript:@"WPPuckType"];

  if ([v10 isEqualToString:@"WPPuckTypeAirPlaySoloSourcePresence"]
    && v9
    && [v9 intValue] == 48)
  {
    [v7 setAdvertisingRate:48];
  }
  v11.receiver = self;
  v11.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v11 startAdvertising:v7];
}

- (void)stopConnectionlessAdvertising
{
  unsigned int v3 = +[WPAdvertisingRequest requestForClientType:10];
  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v6 stopAdvertising:v3];
  id v4 = +[WPAdvertisingRequest requestForClientType:9];
  v5.receiver = self;
  v5.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v5 stopAdvertising:v4];
}

- (void)stopConnectionlessAdvertising:(id)a3
{
  id v4 = +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPAirPlaySolo puckStringToType:a3]);
  v5.receiver = self;
  v5.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v5 stopAdvertising:v4];
}

- (void)startConnectionlessScanningWithData:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"WPPuckType"];
  uint64_t v5 = +[WPAirPlaySolo puckStringToType:v4];

  objc_super v6 = objc_opt_new();
  v7 = v6;
  if (v5 == 10) {
    uint64_t v8 = 966;
  }
  else {
    uint64_t v8 = 0xFFFFLL;
  }
  [v6 setAllowDuplicates:1];
  v10[0] = 300;
  v10[1] = v8;
  v10[2] = 30;
  [v7 setScanningRates:v10];
  [v7 setClientType:v5];
  v9.receiver = self;
  v9.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v9 startScanning:v7];
}

- (void)stopConnectionlessScanningWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_super v6 = [v4 objectForKeyedSubscript:@"WPPuckType"];

  objc_msgSend(v5, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v6));
  v7.receiver = self;
  v7.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v7 stopScanning:v5];
}

- (void)startTrackingPeer:(id)a3 withData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  objc_super v9 = [v6 objectForKeyedSubscript:@"WPPuckType"];

  objc_msgSend(v8, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v9));
  [v8 setPeerUUID:v7];

  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v10 startTrackingPeerWithRequest:v8];
}

- (void)stopTrackingPeer:(id)a3 withData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  objc_super v9 = [v6 objectForKeyedSubscript:@"WPPuckType"];

  objc_msgSend(v8, "setClientType:", +[WPAirPlaySolo puckStringToType:](WPAirPlaySolo, "puckStringToType:", v9));
  [v8 setPeerUUID:v7];

  v10.receiver = self;
  v10.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v10 stopTrackingPeerWithRequest:v8];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v7 stateDidChange:a3];
  id v4 = [(WPAirPlaySolo *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAirPlaySolo *)self delegate];
    [v6 airPlaySoloDidUpdateState:self];
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPAirPlaySolo *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAirPlaySolo *)self delegate];
    [v6 airPlaySoloStartedAdvertising:self];
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  char v5 = [(WPAirPlaySolo *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAirPlaySolo *)self delegate];
    [v7 airPlaySoloStoppedAdvertising:self];
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPAirPlaySolo *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAirPlaySolo *)self delegate];
    [v7 airPlaySolo:self failedToStartAdvertisingWithError:v8];
  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  id v4 = [(WPAirPlaySolo *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAirPlaySolo *)self delegate];
    [v6 airPlaySoloAdvertisingPending:self];
  }
}

- (void)deviceDiscovered:(id)a3
{
  v25[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(WPAirPlaySolo *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
    id v8 = [v4 objectForKeyedSubscript:@"kDeviceChannel"];
    uint64_t v9 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
    objc_super v10 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
    objc_super v11 = [v4 objectForKeyedSubscript:@"kDeviceAddress"];
    v12 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
    v13 = objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);

    v20 = @"WPPuckTypeAirPlaySoloRSSI";
    v21 = @"WPPuckTypeAirPlaySoloAdvertisingData";
    uint64_t v18 = v9;
    v25[0] = v9;
    v25[1] = v13;
    v22 = @"WPPuckTypeAirPlaySoloAdvertisingChannel";
    v14 = v8;
    if (!v8)
    {
      v14 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v9, v20, v21, v22);
    }
    v25[2] = v14;
    v23 = @"WPAirPlaySoloKeyDeviceAddress";
    v15 = v11;
    if (!v11)
    {
      v15 = [MEMORY[0x263EFF8F8] data];
    }
    v24 = @"WPAirPlaySoloKeyDeviceTime";
    v25[3] = v15;
    v25[4] = v12;
    v16 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
    if (v11)
    {
      if (v8)
      {
LABEL_8:
        v17 = [(WPAirPlaySolo *)self delegate];
        [v17 airPlaySolo:self foundDevice:v10 withData:v16];

        goto LABEL_9;
      }
    }
    else
    {

      if (v8) {
        goto LABEL_8;
      }
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPAirPlaySolo *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAirPlaySolo *)self delegate];
    [v6 airPlaySoloStartedScanning:self];
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  id v4 = [(WPAirPlaySolo *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPAirPlaySolo *)self delegate];
    [v6 airPlaySoloStoppedScanning:self];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPAirPlaySolo *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WPAirPlaySolo *)self delegate];
    [v7 airPlaySolo:self failedToStartScanningWithError:v8];
  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WPAirPlaySolo *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = +[WPAirPlaySolo puckTypeToString:v4];
    v12 = @"WPPuckType";
    v13[0] = v9;
    objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v11 = [(WPAirPlaySolo *)self delegate];
    [v11 airPlaySolo:self didStartTrackingPeer:v6 withData:v10 error:0];
  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WPAirPlaySolo *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = +[WPAirPlaySolo puckTypeToString:v4];
    v12 = @"WPPuckType";
    v13[0] = v9;
    objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v11 = [(WPAirPlaySolo *)self delegate];
    [v11 airPlaySolo:self didStopTrackingPeer:v6 withData:v10];
  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(WPAirPlaySolo *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(WPAirPlaySolo *)self delegate];
    objc_super v10 = [v12 peerUUID];
    objc_super v11 = [v12 peerTrackingDictionary];
    [v9 airPlaySolo:self didStartTrackingPeer:v10 withData:v11 error:v6];
  }
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WPAirPlaySolo *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = +[WPAirPlaySolo puckTypeToString:v4];
    id v12 = @"WPPuckType";
    v13[0] = v9;
    objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v11 = [(WPAirPlaySolo *)self delegate];
    [v11 airPlaySolo:self didFindPeer:v6 withData:v10];
  }
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WPAirPlaySolo *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = +[WPAirPlaySolo puckTypeToString:v4];
    id v12 = @"WPPuckType";
    v13[0] = v9;
    objc_super v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v11 = [(WPAirPlaySolo *)self delegate];
    [v11 airPlaySolo:self didLosePeer:v6 withData:v10];
  }
}

- (void)peerTrackingFull
{
  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v6 peerTrackingFull];
  unsigned int v3 = [(WPAirPlaySolo *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(WPAirPlaySolo *)self delegate];
    [v5 airplaySolo:self peerTrackingSlotsAvailable:0];
  }
}

- (void)peerTrackingAvailable
{
  v6.receiver = self;
  v6.super_class = (Class)WPAirPlaySolo;
  [(WPClient *)&v6 peerTrackingAvailable];
  unsigned int v3 = [(WPAirPlaySolo *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(WPAirPlaySolo *)self delegate];
    [v5 airplaySolo:self peerTrackingSlotsAvailable:1];
  }
}

- (WPAirPlaySoloDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPAirPlaySoloDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end