@interface RPNearbyActionV2Discovery
- (CBDiscovery)actionV2Discovery;
- (NSMutableArray)actionV2Devices;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyActionV2Discovery)init;
- (id)description;
- (id)updateHandler;
- (int)bleScanRate;
- (int)bleScanRateScreenOff;
- (unint64_t)discoveryFlags;
- (unsigned)useCase;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setActionV2Devices:(id)a3;
- (void)setActionV2Discovery:(id)a3;
- (void)setBleScanRate:(int)a3;
- (void)setBleScanRateScreenOff:(int)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)updateUseCase:(unsigned int)a3 bleScanRate:(int)a4 bleScanRateScreenOff:(int)a5;
@end

@implementation RPNearbyActionV2Discovery

- (RPNearbyActionV2Discovery)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPNearbyActionV2Discovery;
  v2 = [(RPNearbyActionV2Discovery *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actionV2Devices = v2->_actionV2Devices;
    v2->_actionV2Devices = v3;

    *(void *)&v2->_useCase = 0x1E00020000;
    v2->_bleScanRateScreenOff = 20;
    v5 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_actionV2Discovery)
  {
    v5 = (CBDiscovery *)objc_alloc_init(off_100141778());
    actionV2Discovery = self->_actionV2Discovery;
    self->_actionV2Discovery = v5;

    [(CBDiscovery *)self->_actionV2Discovery setDispatchQueue:self->_dispatchQueue];
    [(CBDiscovery *)self->_actionV2Discovery setDiscoveryFlags:self->_discoveryFlags];
    [(CBDiscovery *)self->_actionV2Discovery setLabel:@"CLink"];
    [(CBDiscovery *)self->_actionV2Discovery setUseCase:self->_useCase];
    [(CBDiscovery *)self->_actionV2Discovery setBleScanRate:self->_bleScanRate];
    [(CBDiscovery *)self->_actionV2Discovery setBleScanRateScreenOff:self->_bleScanRateScreenOff];
    [(CBDiscovery *)self->_actionV2Discovery setBleRSSIThresholdHint:4294967216];
    if (dword_100141708 > 30 || dword_100141708 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_47;
    }
    uint64_t useCase = self->_useCase;
    v8 = sub_1000564F8(self->_useCase);
    int bleScanRate = self->_bleScanRate;
    if (bleScanRate > 34)
    {
      if (bleScanRate > 49)
      {
        if (bleScanRate == 50)
        {
          v10 = "High";
          goto LABEL_26;
        }
        if (bleScanRate == 60)
        {
          v10 = "Max";
          goto LABEL_26;
        }
      }
      else
      {
        if (bleScanRate == 35)
        {
          v10 = "MediumLow";
          goto LABEL_26;
        }
        if (bleScanRate == 40)
        {
          v10 = "Medium";
          goto LABEL_26;
        }
      }
    }
    else if (bleScanRate > 19)
    {
      if (bleScanRate == 20)
      {
        v10 = "Background";
        goto LABEL_26;
      }
      if (bleScanRate == 30)
      {
        v10 = "Low";
        goto LABEL_26;
      }
    }
    else
    {
      if (!bleScanRate)
      {
        v10 = "Default";
        goto LABEL_26;
      }
      if (bleScanRate == 10)
      {
        v10 = "Periodic";
        goto LABEL_26;
      }
    }
    v10 = "?";
LABEL_26:
    int bleScanRateScreenOff = self->_bleScanRateScreenOff;
    if (bleScanRateScreenOff > 34)
    {
      if (bleScanRateScreenOff > 49)
      {
        if (bleScanRateScreenOff == 50)
        {
          v12 = "High";
          goto LABEL_46;
        }
        if (bleScanRateScreenOff == 60)
        {
          v12 = "Max";
          goto LABEL_46;
        }
      }
      else
      {
        if (bleScanRateScreenOff == 35)
        {
          v12 = "MediumLow";
          goto LABEL_46;
        }
        if (bleScanRateScreenOff == 40)
        {
          v12 = "Medium";
          goto LABEL_46;
        }
      }
    }
    else if (bleScanRateScreenOff > 19)
    {
      if (bleScanRateScreenOff == 20)
      {
        v12 = "Background";
        goto LABEL_46;
      }
      if (bleScanRateScreenOff == 30)
      {
        v12 = "Low";
        goto LABEL_46;
      }
    }
    else
    {
      if (!bleScanRateScreenOff)
      {
        v12 = "Default";
        goto LABEL_46;
      }
      if (bleScanRateScreenOff == 10)
      {
        v12 = "Periodic";
LABEL_46:
        v16 = v10;
        v17 = v12;
        v14 = v8;
        uint64_t v15 = useCase;
        LogPrintF();
LABEL_47:
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100056E24;
        v21[3] = &unk_100121B38;
        v21[4] = self;
        -[CBDiscovery setDeviceFoundHandler:](self->_actionV2Discovery, "setDeviceFoundHandler:", v21, v14, v15, v16, v17);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100056E30;
        v20[3] = &unk_100121B38;
        v20[4] = self;
        [(CBDiscovery *)self->_actionV2Discovery setDeviceLostHandler:v20];
        v13 = self->_actionV2Discovery;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100056E3C;
        v18[3] = &unk_100122D28;
        id v19 = v4;
        [(CBDiscovery *)v13 activateWithCompletion:v18];

        goto LABEL_48;
      }
    }
    v12 = "?";
    goto LABEL_46;
  }
LABEL_48:
}

- (void)invalidate
{
  [(CBDiscovery *)self->_actionV2Discovery invalidate];
  actionV2Discovery = self->_actionV2Discovery;
  self->_actionV2Discovery = 0;

  [(NSMutableArray *)self->_actionV2Devices removeAllObjects];
  actionV2Devices = self->_actionV2Devices;
  self->_actionV2Devices = 0;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)updateUseCase:(unsigned int)a3 bleScanRate:(int)a4 bleScanRateScreenOff:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_uint64_t useCase = v7;
  self->_int bleScanRate = v6;
  self->_int bleScanRateScreenOff = v5;
  actionV2Discovery = self->_actionV2Discovery;
  if (!actionV2Discovery) {
    return;
  }
  if (v7 && [(CBDiscovery *)actionV2Discovery useCase] != v7)
  {
    if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize()))
    {
      v13 = sub_1000564F8(v7);
      LogPrintF();
      -[CBDiscovery setUseCase:](self->_actionV2Discovery, "setUseCase:", v7, v13, v7);
    }
    else
    {
      -[CBDiscovery setUseCase:](self->_actionV2Discovery, "setUseCase:", v7, v12, v14);
    }
  }
  if ([(CBDiscovery *)self->_actionV2Discovery bleScanRate] != v6)
  {
    if (dword_100141708 > 30 || dword_100141708 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_35;
    }
    if ((int)v6 > 34)
    {
      if ((int)v6 > 49)
      {
        if (v6 == 50)
        {
          v10 = "High";
          goto LABEL_34;
        }
        if (v6 == 60)
        {
          v10 = "Max";
          goto LABEL_34;
        }
      }
      else
      {
        if (v6 == 35)
        {
          v10 = "MediumLow";
          goto LABEL_34;
        }
        if (v6 == 40)
        {
          v10 = "Medium";
          goto LABEL_34;
        }
      }
    }
    else if ((int)v6 > 19)
    {
      if (v6 == 20)
      {
        v10 = "Background";
        goto LABEL_34;
      }
      if (v6 == 30)
      {
        v10 = "Low";
        goto LABEL_34;
      }
    }
    else
    {
      if (!v6)
      {
        v10 = "Default";
        goto LABEL_34;
      }
      if (v6 == 10)
      {
        v10 = "Periodic";
LABEL_34:
        v12 = v10;
        LogPrintF();
LABEL_35:
        -[CBDiscovery setBleScanRate:](self->_actionV2Discovery, "setBleScanRate:", v6, v12);
        goto LABEL_36;
      }
    }
    v10 = "?";
    goto LABEL_34;
  }
LABEL_36:
  if ([(CBDiscovery *)self->_actionV2Discovery bleScanRateScreenOff] != v5)
  {
    if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v11 = self->_actionV2Discovery;
    [(CBDiscovery *)v11 setBleScanRateScreenOff:v5];
  }
}

- (void)_deviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stableIdentifier];
  if (v5 || ([v4 identifier], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    actionV2Devices = self->_actionV2Devices;
    if (!actionV2Devices)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v8 = self->_actionV2Devices;
      self->_actionV2Devices = v7;

      actionV2Devices = self->_actionV2Devices;
    }
    if ([(NSMutableArray *)actionV2Devices containsObject:v5])
    {
      if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [(NSMutableArray *)self->_actionV2Devices addObject:v5];
      if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = sub_1000575BC();
      v10 = sub_1000575BC();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v11, "BLE NearbyActionV2 device found", "BLE NearbyActionV2 device found: %@\n", buf, 0xCu);
      }
    }
    id v12 = objc_retainBlock(self->_updateHandler);
    v13 = v12;
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
  else if (dword_100141708 <= 90 && (dword_100141708 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_deviceLost:(id)a3
{
  id v7 = a3;
  id v4 = [v7 stableIdentifier];
  if (v4 || ([v7 identifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([(NSMutableArray *)self->_actionV2Devices containsObject:v4])
    {
      [(NSMutableArray *)self->_actionV2Devices removeObject:v4];
      if (dword_100141708 <= 30 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v5 = objc_retainBlock(self->_updateHandler);
      uint64_t v6 = v5;
      if (v5) {
        (*((void (**)(id))v5 + 2))(v5);
      }
    }
  }
  else
  {
    if (dword_100141708 <= 90 && (dword_100141708 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = 0;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v7 = 0;
  actionV2Discovery = self->_actionV2Discovery;
  NSAppendPrintF();
  id v3 = v7;

  [(NSMutableArray *)self->_actionV2Devices count];
  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

- (NSMutableArray)actionV2Devices
{
  return self->_actionV2Devices;
}

- (void)setActionV2Devices:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_uint64_t useCase = a3;
}

- (int)bleScanRate
{
  return self->_bleScanRate;
}

- (void)setBleScanRate:(int)a3
{
  self->_int bleScanRate = a3;
}

- (int)bleScanRateScreenOff
{
  return self->_bleScanRateScreenOff;
}

- (void)setBleScanRateScreenOff:(int)a3
{
  self->_int bleScanRateScreenOff = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (CBDiscovery)actionV2Discovery
{
  return self->_actionV2Discovery;
}

- (void)setActionV2Discovery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionV2Discovery, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_actionV2Devices, 0);
}

@end