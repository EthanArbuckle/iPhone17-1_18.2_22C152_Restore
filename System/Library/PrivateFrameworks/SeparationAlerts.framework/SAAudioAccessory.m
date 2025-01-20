@interface SAAudioAccessory
- (BTAccessoryManagerImpl)fBTAccessoryManager;
- (BTDeviceImpl)fBTDevice;
- (BTSessionImpl)fBTSession;
- (NSString)fBTAddress;
- (OS_dispatch_queue)queue;
- (SAAudioAccessory)initWithQueue:(id)a3;
- (int)fBTSessionAttachRetryCount;
- (int64_t)convertToSAInEarStatus:(int)a3;
- (int64_t)getPrimaryBudSide;
- (unsigned)fProductID;
- (void)attachBTSession;
- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)getInEarStatus:(int64_t *)a3 secondary:(int64_t *)a4;
- (void)refreshBTDevice;
- (void)reset;
- (void)setBTAddress:(id)a3;
- (void)setFBTAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setFBTAddress:(id)a3;
- (void)setFBTDevice:(BTDeviceImpl *)a3;
- (void)setFBTSession:(BTSessionImpl *)a3;
- (void)setFBTSessionAttachRetryCount:(int)a3;
- (void)setFProductID:(unsigned int)a3;
- (void)setQueue:(id)a3;
@end

@implementation SAAudioAccessory

- (SAAudioAccessory)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SAAudioAccessory;
  v5 = [(SAAudioAccessory *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SAAudioAccessory *)v5 setQueue:v4];
    [(SAAudioAccessory *)v6 setFBTAddress:&stru_1F27F45F0];
    [(SAAudioAccessory *)v6 attachBTSession];
  }

  return v6;
}

- (void)attachBTSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(SAAudioAccessory *)self queue];
  int v3 = BTSessionAttachWithQueue();

  if (v3)
  {
    id v4 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      __int16 v6 = 2082;
      v7 = "";
      _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory failed to register BT session callback\"}", (uint8_t *)v5, 0x12u);
    }
  }
}

- (void)setBTAddress:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[SAAudioAccessory setFBTAddress:](self, "setFBTAddress:");
    id v4 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      __int16 v6 = [(SAAudioAccessory *)self fBTAddress];
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2113;
      v13 = v6;
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory set BT address of the current device\", \"address\":\"%{private}@\"}", (uint8_t *)&v8, 0x1Cu);
    }
    [(SAAudioAccessory *)self refreshBTDevice];
  }
  else
  {
    [(SAAudioAccessory *)self setFBTAddress:&stru_1F27F45F0];
    v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory received unknown BT address\"}", (uint8_t *)&v8, 0x12u);
    }
    [(SAAudioAccessory *)self setFBTDevice:0];
  }
}

- (void)refreshBTDevice
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(SAAudioAccessory *)self fBTSession])
  {
    v11 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v12 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - invalid BT session\"}";
    goto LABEL_8;
  }
  int v3 = [(SAAudioAccessory *)self fBTAddress];
  uint64_t v4 = [v3 length];

  if (v4 != 17)
  {
    v13 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v8 = v13;
    int v9 = [(SAAudioAccessory *)self fBTAddress];
    *(_DWORD *)buf = 68289283;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2113;
    v20 = v9;
    __int16 v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - invalid BT address\", \"address\":\"%{private}@\"}";
    goto LABEL_11;
  }
  id v5 = [(SAAudioAccessory *)self fBTAddress];
  [v5 UTF8String];
  int v6 = BTDeviceAddressFromString();

  if (v6)
  {
    v7 = (void *)TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v8 = v7;
    int v9 = [(SAAudioAccessory *)self fBTAddress];
    *(_DWORD *)buf = 68289283;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2113;
    v20 = v9;
    __int16 v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - failed to convert address into a valid BT addr"
          "ess\", \"address\":\"%{private}@\"}";
    goto LABEL_11;
  }
  [(SAAudioAccessory *)self fBTSession];
  if (!BTDeviceFromAddress())
  {
    [(SAAudioAccessory *)self fBTDevice];
    if (!BTDeviceGetDeviceId()) {
      return;
    }
    [(SAAudioAccessory *)self setFProductID:0];
    v11 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v12 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - Failed to get the product ID\"}";
LABEL_8:
    _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
    return;
  }
  [(SAAudioAccessory *)self reset];
  uint64_t v14 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
  {
    int v8 = v14;
    int v9 = [(SAAudioAccessory *)self fBTAddress];
    *(_DWORD *)buf = 68289283;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2113;
    v20 = v9;
    __int16 v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory refresh device failed - Failed to get the device handle with BT addres"
          "s\", \"address\":\"%{private}@\"}";
LABEL_11:
    _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x1Cu);
  }
}

- (void)reset
{
  [(SAAudioAccessory *)self setFBTDevice:0];
  [(SAAudioAccessory *)self setFProductID:0];
  [(SAAudioAccessory *)self setFBTAddress:&stru_1F27F45F0];
}

- (int64_t)convertToSAInEarStatus:(int)a3
{
  if (a3 >= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

- (void)getInEarStatus:(int64_t *)a3 secondary:(int64_t *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *a3 = 3;
  *a4 = 3;
  if (![(SAAudioAccessory *)self fBTDevice])
  {
    int v9 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 68289026;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT device\"}";
    goto LABEL_8;
  }
  v7 = [(SAAudioAccessory *)self fBTAddress];
  uint64_t v8 = [v7 length];

  if (v8 == 17)
  {
    [(SAAudioAccessory *)self fBTAccessoryManager];
    [(SAAudioAccessory *)self fBTDevice];
    if (BTAccessoryManagerGetInEarDetectionEnable())
    {
      int v9 = TASALog;
      if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v10 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get IED setting\"}";
LABEL_8:
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
      return;
    }
    [(SAAudioAccessory *)self fBTAccessoryManager];
    [(SAAudioAccessory *)self fBTDevice];
    if (BTAccessoryManagerGetInEarStatus())
    {
      uint64_t v14 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        int v20 = 0;
        __int16 v21 = 2082;
        v22 = "";
        _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get inear status\"}", buf, 0x12u);
      }
      int64_t v15 = 3;
      *a3 = 3;
      goto LABEL_15;
    }
    *a3 = [(SAAudioAccessory *)self convertToSAInEarStatus:0];
    *a4 = [(SAAudioAccessory *)self convertToSAInEarStatus:0];
    int v16 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v17 = *a3;
      int64_t v18 = *a4;
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2049;
      int64_t v24 = v17;
      __int16 v25 = 2049;
      int64_t v26 = v18;
      _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory received in ear status\", \"Primary\":%{private}ld, \"Secondary\":%{private}ld}", buf, 0x26u);
    }
    if (!*a3 && [(SAAudioAccessory *)self fProductID] == 8202)
    {
      int64_t v15 = 0;
LABEL_15:
      *a4 = v15;
    }
  }
  else
  {
    v11 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = v11;
      v13 = [(SAAudioAccessory *)self fBTAddress];
      *(_DWORD *)buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2113;
      int64_t v24 = (int64_t)v13;
      _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
    }
  }
}

- (int64_t)getPrimaryBudSide
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![(SAAudioAccessory *)self fBTDevice])
  {
    id v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      int v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT device when get primary bud side\"}";
      goto LABEL_10;
    }
    return 2;
  }
  int v3 = [(SAAudioAccessory *)self fBTAddress];
  uint64_t v4 = [v3 length];

  if (v4 != 17)
  {
    id v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      int v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - invalid BT address when get primary bud side\"}";
      goto LABEL_10;
    }
    return 2;
  }
  [(SAAudioAccessory *)self fBTAccessoryManager];
  [(SAAudioAccessory *)self fBTDevice];
  if (BTAccessoryManagerGetPrimaryBudSide())
  {
    id v5 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      int v6 = "{\"msg%{public}.0s\":\"SAAudioAccessory in ear status - failed to get primary bud\"}";
LABEL_10:
      _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
      return 2;
    }
    return 2;
  }
  return 2;
}

- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((a4 & 0xFFFFFFFD) == 0)
  {
    if (a4 == 2)
    {
      -[SAAudioAccessory setFBTSession:](self, "setFBTSession:", 0, *(void *)&a4, *(void *)&a5);
      int v6 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session terminated\"}", buf, 0x12u);
      }
      [(SAAudioAccessory *)self reset];
      int v7 = [(SAAudioAccessory *)self fBTSessionAttachRetryCount];
      [(SAAudioAccessory *)self setFBTSessionAttachRetryCount:(v7 + 1)];
      if (v7 <= 4)
      {
        uint64_t v8 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = v8;
          int v10 = [(SAAudioAccessory *)self fBTSessionAttachRetryCount];
          *(_DWORD *)buf = 68289283;
          int v17 = 0;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 1025;
          int v21 = v10;
          _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session re-attaching\", \"Retry count\":%{private}d}", buf, 0x18u);
        }
        [(SAAudioAccessory *)self attachBTSession];
      }
    }
    else
    {
      -[SAAudioAccessory setFBTSessionAttachRetryCount:](self, "setFBTSessionAttachRetryCount:", 0, *(void *)&a4, *(void *)&a5);
      [(SAAudioAccessory *)self setFBTSession:a3];
      uint64_t v12 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SAAudioAccessory BT session attached successfully\"}", buf, 0x12u);
      }
      [(SAAudioAccessory *)self fBTSession];
      int Default = BTAccessoryManagerGetDefault();
      if (Default)
      {
        int v14 = Default;
        int64_t v15 = TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          int v17 = 0;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 1025;
          int v21 = v14;
          _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SAAudioAccessory Accessory Mananger unavailable.\", \"status\":%{private}d}", buf, 0x18u);
        }
      }
      else
      {
        [(SAAudioAccessory *)self setFBTAccessoryManager:0];
        [(SAAudioAccessory *)self refreshBTDevice];
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BTSessionImpl)fBTSession
{
  return self->_fBTSession;
}

- (void)setFBTSession:(BTSessionImpl *)a3
{
  self->_fBTSession = a3;
}

- (BTAccessoryManagerImpl)fBTAccessoryManager
{
  return self->_fBTAccessoryManager;
}

- (void)setFBTAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_fBTAccessoryManager = a3;
}

- (BTDeviceImpl)fBTDevice
{
  return self->_fBTDevice;
}

- (void)setFBTDevice:(BTDeviceImpl *)a3
{
  self->_fBTDevice = a3;
}

- (NSString)fBTAddress
{
  return self->_fBTAddress;
}

- (void)setFBTAddress:(id)a3
{
}

- (unsigned)fProductID
{
  return self->_fProductID;
}

- (void)setFProductID:(unsigned int)a3
{
  self->_fProductID = a3;
}

- (int)fBTSessionAttachRetryCount
{
  return self->_fBTSessionAttachRetryCount;
}

- (void)setFBTSessionAttachRetryCount:(int)a3
{
  self->_fBTSessionAttachRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fBTAddress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end