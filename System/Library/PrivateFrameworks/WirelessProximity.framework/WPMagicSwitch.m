@interface WPMagicSwitch
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3;
- (WPMagicSwitch)initWithDelegate:(id)a3 queue:(id)a4;
- (WPMagicSwitchDelegate)delegate;
- (id)clientAsString;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)invalidate;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)startAdvertisingWithData:(id)a3;
- (void)startScanningWithData:(id)a3;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertising;
- (void)stopScanning;
@end

@implementation WPMagicSwitch

- (WPMagicSwitch)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPMagicSwitch;
  v7 = [(WPClient *)&v10 initWithQueue:a4 machName:0];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 30;
  if (a4 == 2)
  {
    long long v4 = xmmword_2144DEBB0;
    goto LABEL_5;
  }
  if (!a4)
  {
    long long v4 = xmmword_2144DEBC0;
LABEL_5:
    *(_OWORD *)&retstr->var0 = v4;
    return self;
  }
  id v6 = self;
  id v7 = [MEMORY[0x263F08690] currentHandler];
  [v7 handleFailureInMethod:a3 object:v6 file:@"WPMagicSwitch.m" lineNumber:51 description:@"Unknown duty cycle type"];

  return self;
}

- (id)clientAsString
{
  return @"WPMagicSwitch";
}

- (void)invalidate
{
  [(WPMagicSwitch *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPMagicSwitch;
  [(WPClient *)&v3 invalidate];
}

- (void)startScanningWithData:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"WPMagicSwitchScanBlobData"];
  id v6 = [v4 objectForKeyedSubscript:@"WPMagicSwitchScanMaskData"];
  id v7 = [v4 objectForKeyedSubscript:@"WPMagicSwitchScanDutyCycle"];
  v8 = [v4 objectForKeyedSubscript:@"WPMagicSwitchScanPeers"];

  if ((unint64_t)[v5 length] <= 0x16
    && (unint64_t)[v6 length] <= 0x16
    && ([v7 integerValue] & 0x8000000000000000) == 0
    && [v7 integerValue] < 3)
  {
    v12 = objc_opt_new();
    -[WPMagicSwitch dutyCycleToScanningRates:](self, "dutyCycleToScanningRates:", [v7 integerValue]);
    long long v26 = v28;
    uint64_t v27 = v29;
    [v12 setScanningRates:&v26];
    [v12 setClientType:11];
    [v12 setPeers:v8];
    if (v5 || !v6)
    {
      if (!v5 || !v6 || (unint64_t v20 = [v6 length], v20 <= objc_msgSend(v5, "length")))
      {
        [v12 setBlobValue:v5];
        [v12 setMaskValue:v6];
        v25.receiver = self;
        v25.super_class = (Class)WPMagicSwitch;
        [(WPClient *)&v25 startScanning:v12];
        goto LABEL_8;
      }
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      v16 = [NSString stringWithFormat:@"Invalid data provided, Mask data length: %lu > Blob data length: %lu", objc_msgSend(v6, "length"), objc_msgSend(v5, "length")];
      v31 = v16;
      v17 = NSDictionary;
      v18 = &v31;
      v19 = &v30;
    }
    else
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08320];
      v16 = [NSString stringWithFormat:@"Invalid data provided, Blob Data: %@ is null but Mask data: %@ is not null", 0, v6];
      v33 = v16;
      v17 = NSDictionary;
      v18 = &v33;
      v19 = &v32;
    }
    v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    v14 = [v15 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v21];

    v22 = [(WPMagicSwitch *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(WPMagicSwitch *)self delegate];
      [v24 magicSwitch:self failedToStartScanningWithError:v14];
    }
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v34 = *MEMORY[0x263F08320];
  uint64_t v10 = [NSString stringWithFormat:@"Invalid data provided, Blob data: %@, Mask data: %@, Duty Cycle: %@", v5, v6, v7];
  v35[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  v12 = [v9 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v11];

  v13 = [(WPMagicSwitch *)self delegate];
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if (v10)
  {
    v14 = [(WPMagicSwitch *)self delegate];
    [v14 magicSwitch:self failedToStartScanningWithError:v12];
LABEL_7:
  }
LABEL_8:
}

- (void)stopScanning
{
  objc_super v3 = objc_opt_new();
  [v3 setClientType:11];
  v4.receiver = self;
  v4.super_class = (Class)WPMagicSwitch;
  [(WPClient *)&v4 stopScanning:v3];
}

- (void)startAdvertisingWithData:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectForKeyedSubscript:@"WPMagicSwitchAdvertisingData"];
    id v6 = [v4 objectForKeyedSubscript:@"WPMagicSwitchAdvertiseTypeInterval"];
    if (!v5
      || (unint64_t)[v5 length] > 0x16
      || [v6 integerValue] < 0
      || [v6 integerValue] >= 3)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid data provided, adv data: %@, adv Interval: %@", v5, v6];
      uint64_t v23 = v8;
      v9 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v10 = [v7 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v9];

      v11 = [(WPMagicSwitch *)self delegate];
      LOBYTE(v8) = objc_opt_respondsToSelector();

      if (v8)
      {
        v12 = [(WPMagicSwitch *)self delegate];
        [v12 magicSwitch:self failedToStartAdvertisingWithError:v10];
      }
      goto LABEL_8;
    }
    uint64_t v10 = +[WPAdvertisingRequest requestForClientType:11];
    [v10 setAdvertisingData:v5];
    v17 = [v4 objectForKeyedSubscript:@"WPMagicSwitchAdvertiseTypeInterval"];
    uint64_t v18 = [v17 integerValue];

    [v10 setConnectable:1];
    [v10 setStopOnAdvertisingAddressChange:1];
    if (v18 == 2)
    {
      v19 = v10;
      uint64_t v20 = 1636;
    }
    else if (v18 == 1)
    {
      v19 = v10;
      uint64_t v20 = 48;
    }
    else
    {
      if (v18)
      {
        [MEMORY[0x263EFF940] raise:@"Invalid Advertising Rate" format:@"An invalid advertising rate was provided to WPMagicSwitch"];
        goto LABEL_21;
      }
      v19 = v10;
      uint64_t v20 = 290;
    }
    [v19 setAdvertisingRate:v20];
LABEL_21:
    v21.receiver = self;
    v21.super_class = (Class)WPMagicSwitch;
    [(WPClient *)&v21 startAdvertising:v10];
LABEL_8:

LABEL_11:
    goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F08320];
  uint64_t v14 = [NSString stringWithFormat:@"Invalid data provided, Dictionary: %@", v4];
  v25[0] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v5 = [v13 errorWithDomain:@"WPErrorDomain" code:5 userInfo:v15];

  v16 = [(WPMagicSwitch *)self delegate];
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if (v14)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitch:self failedToStartAdvertisingWithError:v5];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)stopAdvertising
{
  objc_super v3 = +[WPAdvertisingRequest requestForClientType:11];
  v4.receiver = self;
  v4.super_class = (Class)WPMagicSwitch;
  [(WPClient *)&v4 stopAdvertising:v3];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPMagicSwitch;
  [(WPClient *)&v7 stateDidChange:a3];
  objc_super v4 = [(WPMagicSwitch *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitchDidUpdateState:self];
  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPMagicSwitch *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitchStartedAdvertising:self];
  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_11);
  }
  id v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "MagicSwitch advertising stopped with error: %@", (uint8_t *)&v15, 0xCu);
  }
  if (v5)
  {
    if ([v5 code] == 28)
    {
      objc_super v7 = [(WPMagicSwitch *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_191_0);
        }
        v9 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          v11 = [v5 localizedDescription];
          int v15 = 138412290;
          id v16 = v11;
          _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "[Privacy] MagicSwitch advertising stopped with error: %@", (uint8_t *)&v15, 0xCu);
        }
        v12 = [(WPMagicSwitch *)self delegate];
        [v12 magicSwitchStoppedAdvertising:self withError:v5];
        goto LABEL_15;
      }
    }
  }
  else
  {
    v13 = [(WPMagicSwitch *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v12 = [(WPMagicSwitch *)self delegate];
      [v12 magicSwitchStoppedAdvertising:self];
LABEL_15:
    }
  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  id v5 = [(WPMagicSwitch *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(WPMagicSwitch *)self delegate];
    [v7 magicSwitch:self failedToStartAdvertisingWithError:v8];
  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  objc_super v4 = [(WPMagicSwitch *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitchPendingAdvertising:self];
  }
}

- (void)deviceDiscovered:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(WPMagicSwitch *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
    id v8 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
    v9 = objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);

    uint64_t v10 = [(WPMagicSwitch *)self delegate];
    v12 = @"WPMagicSwitchAdvertisingData";
    v13[0] = v9;
    v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v10 magicSwitch:self foundDevice:v7 withData:v11];
  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPMagicSwitch *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitchStartedScanning:self];
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  id v4 = [(WPMagicSwitch *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPMagicSwitch *)self delegate];
    [v6 magicSwitchStoppedScanning:self];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPMagicSwitch *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(WPMagicSwitch *)self delegate];
    [v7 magicSwitch:self failedToStartScanningWithError:v8];
  }
}

- (WPMagicSwitchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPMagicSwitchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end