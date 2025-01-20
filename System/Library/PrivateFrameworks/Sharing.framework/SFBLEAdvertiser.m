@interface SFBLEAdvertiser
- (NSArray)lePipeDevices;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SFBLEAdvertiser)initWithType:(int64_t)a3;
- (id)_preparePayloadNearbyAction:(int *)a3;
- (id)_preparePayloadNearbyInfo:(int *)a3;
- (id)advertiseStateChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)connectionHandler;
- (id)invalidationHandler;
- (int)_preparePayload:(BOOL)a3;
- (int64_t)advertiseRate;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)nearbyDidUpdateState:(id)a3;
- (void)setAdvertiseRate:(int64_t)a3;
- (void)setAdvertiseStateChangedHandler:(id)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setConnectionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLePipeDevices:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setPayloadFields:(id)a3;
@end

@implementation SFBLEAdvertiser

- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v9 = wpNearby == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || self->_wpNearbyType != a4) {
    return;
  }
  int var0 = self->_ucat->var0;
  if (self->_advertiseState == 2)
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_13:
    }
      LogPrintF();
  }
  else if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_13;
  }
  if (self->_advertiseState != 1)
  {
    self->_advertiseState = 1;
    id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
    {
      v12 = (void (*)(void))*((void *)advertiseStateChangedHandler + 2);
      v12();
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

uint64_t __36__SFBLEAdvertiser_setPayloadFields___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 _restartIfNeeded:0];
}

void __36__SFBLEAdvertiser_setPayloadFields___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;
}

- (void)setPayloadFields:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__SFBLEAdvertiser_setPayloadFields___block_invoke;
  aBlock[3] = &unk_1E5BBBD18;
  aBlock[4] = v6;
  id v7 = v5;
  id v14 = v7;
  v8 = (void (**)(void))_Block_copy(aBlock);
  BOOL v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__SFBLEAdvertiser_setPayloadFields___block_invoke_2;
    v11[3] = &unk_1E5BBC9C8;
    v11[4] = v6;
    v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }
  else
  {
    v8[2](v8);
  }

  objc_sync_exit(v6);
}

- (NSArray)lePipeDevices
{
  return self->_lePipeDevices;
}

- (int64_t)advertiseRate
{
  return self->_advertiseRate;
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v6 = "";
    if (v3) {
      v6 = "(force)";
    }
    v18 = (void *)v6;
    LogPrintF();
  }
  if ((unint64_t)(self->_payloadType - 15) > 1)
  {
    int v12 = self->_ucat->var0;
    if (v12 <= 90 && (v12 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    wpNearby = self->_wpNearby;
    if (!wpNearby || [(WPNearby *)wpNearby state] != 3) {
      return;
    }
    int v8 = [(SFBLEAdvertiser *)self _preparePayload:v3];
    if (v8 == -6757) {
      goto LABEL_43;
    }
    if (!v8)
    {
      payloadDataCurrent = self->_payloadDataCurrent;
      if (payloadDataCurrent)
      {
        int64_t advertiseRate = self->_advertiseRate;
        if (advertiseRate <= 69)
        {
          if (advertiseRate <= 49)
          {
            if (advertiseRate <= 39)
            {
              if (advertiseRate <= 29)
              {
                if (advertiseRate <= 19)
                {
                  if (advertiseRate <= 14) {
                    uint64_t v11 = 0x4000;
                  }
                  else {
                    uint64_t v11 = 1636;
                  }
                }
                else
                {
                  uint64_t v11 = 560;
                }
              }
              else
              {
                uint64_t v11 = 432;
              }
            }
            else
            {
              uint64_t v11 = 290;
            }
          }
          else
          {
            uint64_t v11 = 48;
          }
        }
        else
        {
          uint64_t v11 = 32;
        }
        BOOL v14 = advertiseRate > 40;
        int v15 = self->_ucat->var0;
        if (v15 <= 20)
        {
          if (v15 != -1)
          {
LABEL_38:
            v16 = "no";
            if (v3) {
              v16 = "yes";
            }
            v18 = payloadDataCurrent;
            v20 = v16;
            double v19 = (double)v11 * 625.0 / 1000.0;
            LogPrintF();
            goto LABEL_42;
          }
          if (_LogCategory_Initialize())
          {
            payloadDataCurrent = self->_payloadDataCurrent;
            goto LABEL_38;
          }
        }
LABEL_42:
        -[WPNearby stopAdvertisingOfType:](self->_wpNearby, "stopAdvertisingOfType:", self->_wpNearbyType, v18, *(void *)&v19, v20);
        [(WPNearby *)self->_wpNearby startAdvertisingOfType:self->_wpNearbyType data:self->_payloadDataCurrent priority:v14 mode:v11];
LABEL_43:
        startRetrier = self->_startRetrier;
        [(CURetrier *)startRetrier succeededDirect];
        return;
      }
    }
  }
  int v13 = self->_ucat->var0;
  if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (int)_preparePayload:(BOOL)a3
{
  int v11 = 0;
  if (!self->_payloadDataCurrent)
  {
    int64_t payloadType = self->_payloadType;
    if (payloadType == 16)
    {
      int v8 = [(SFBLEAdvertiser *)self _preparePayloadNearbyInfo:&v11];
    }
    else
    {
      if (payloadType != 15)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        int v11 = -6757;
        goto LABEL_2;
      }
      int v8 = [(SFBLEAdvertiser *)self _preparePayloadNearbyAction:&v11];
    }
    payloadDataCurrent = self->_payloadDataCurrent;
    self->_payloadDataCurrent = v8;

    int result = v11;
    if (v11) {
      return result;
    }
  }
LABEL_2:
  if (!a3 && self->_payloadDataPrevious && (-[NSData isEqual:](self->_payloadDataCurrent, "isEqual:") & 1) != 0)
  {
    int v5 = self->_ucat->var0;
    if (v5 <= 9 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return -6757;
  }
  else
  {
    objc_storeStrong((id *)&self->_payloadDataPrevious, self->_payloadDataCurrent);
    return 0;
  }
}

- (id)_preparePayloadNearbyInfo:(int *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  char v15 = Int64Ranged;
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x10u;
    char v15 = Int64Ranged;
  }
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x20u;
    char v15 = Int64Ranged;
  }
  if (CFDictionaryGetInt64()) {
    char v15 = Int64Ranged | 0x40;
  }
  [v4 appendBytes:&v15 length:1];
  char v14 = 0;
  if (CFDictionaryGetInt64())
  {
    char v6 = 0x80;
    char v14 = 0x80;
  }
  else
  {
    char v6 = 0;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 0x40u;
    char v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 8u;
    char v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 0x20u;
    char v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 4u;
    char v14 = v6;
  }
  CFDataGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  if ([v7 length] == 3)
  {
    v6 |= 0x10u;
    char v14 = v6;
  }
  CFDataGetTypeID();
  int v8 = CFDictionaryGetTypedValue();
  if ([v8 length])
  {
    v6 |= 2u;
    char v14 = v6;
  }
  char v13 = 0;
  if (CFDictionaryGetInt64())
  {
    int v9 = 2;
    char v13 = 2;
  }
  else
  {
    int v9 = 0;
  }
  if (CFDictionaryGetInt64())
  {
    v9 |= 4u;
    char v13 = v9;
  }
  if ((CFDictionaryGetInt64Ranged() & 0x800) != 0)
  {
    v9 |= 0xFFFFFF80;
    char v13 = v9;
  }
  if (CFDictionaryGetInt64Ranged() == 1)
  {
    v9 |= 1u;
    char v13 = v9;
  }
  CFDataGetTypeID();
  v10 = CFDictionaryGetTypedValue();
  if ([v10 length])
  {
    char v13 = v9 | (16 * (*(unsigned char *)[v10 bytes] & 7)) | 8;
  }
  else if (!v9)
  {
    goto LABEL_35;
  }
  char v14 = v6 | 1;
LABEL_35:
  [v4 appendBytes:&v14 length:1];
  char v11 = v14;
  if ((v14 & 0x10) != 0)
  {
    [v4 appendData:v7];
    char v11 = v14;
    if ((v14 & 2) == 0)
    {
LABEL_37:
      if ((v11 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_45;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v8, "bytes"), 1);
  if ((v14 & 1) == 0)
  {
LABEL_38:
    if (!a3) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_45:
  [v4 appendBytes:&v13 length:1];
  if (a3) {
LABEL_39:
  }
    *a3 = 0;
LABEL_40:

  return v4;
}

- (SFBLEAdvertiser)initWithType:(int64_t)a3
{
  int v12 = 0;
  int v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)SFBLEAdvertiser;
  id v4 = [(SFBLEAdvertiser *)&v10 init];
  int v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  v4->_int64_t advertiseRate = 40;
  uint64_t v6 = SFMainQueue(v4);
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v6;

  v5->_int64_t payloadType = a3;
  ASPrintF();
  if (v12)
  {
    v5->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v12);
    int v8 = 0;
    if (!v11) {
      int v8 = v5;
    }
  }
  else
  {
LABEL_6:
    int v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  if (self->_startRetrier)
  {
    FatalErrorF();
    goto LABEL_10;
  }
  if (self->_wpNearby)
  {
LABEL_10:
    char v13 = (SFBLEAdvertiser *)FatalErrorF();
    [(SFBLEAdvertiser *)v13 description];
    return;
  }
  id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_id advertiseStateChangedHandler = 0;

  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  id connectionHandler = self->_connectionHandler;
  self->_id connectionHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;
  }
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  payloadDataCurrent = self->_payloadDataCurrent;
  self->_payloadDataCurrent = 0;

  payloadDataPrevious = self->_payloadDataPrevious;
  self->_payloadDataPrevious = 0;

  payloadFields = self->_payloadFields;
  self->_payloadFields = 0;

  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = 0;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SFBLEAdvertiser;
  [(SFBLEAdvertiser *)&v15 dealloc];
}

- (NSString)description
{
  unint64_t v3 = self->_payloadType + 1;
  if (v3 > 0x12) {
    id v4 = "?";
  }
  else {
    id v4 = off_1E5BBF050[v3];
  }
  objc_super v15 = v4;
  NSAppendPrintF();
  id v5 = 0;
  uint64_t v6 = v5;
  if (self->_invalidateCalled)
  {
    v16 = v5;
    NSAppendPrintF();
    id v7 = v16;

    uint64_t v6 = v7;
  }
  NSAppendPrintF();
  id v8 = v6;

  int64_t advertiseRate = self->_advertiseRate;
  if (advertiseRate > 39)
  {
    if (advertiseRate > 59)
    {
      if (advertiseRate == 60)
      {
        objc_super v10 = "Aggressive";
        goto LABEL_26;
      }
      if (advertiseRate == 70)
      {
        objc_super v10 = "Max";
        goto LABEL_26;
      }
    }
    else
    {
      if (advertiseRate == 40)
      {
        objc_super v10 = "Normal";
        goto LABEL_26;
      }
      if (advertiseRate == 50)
      {
        objc_super v10 = "High";
        goto LABEL_26;
      }
    }
  }
  else if (advertiseRate > 19)
  {
    if (advertiseRate == 20)
    {
      objc_super v10 = "LowBackground";
      goto LABEL_26;
    }
    if (advertiseRate == 30)
    {
      objc_super v10 = "Background";
      goto LABEL_26;
    }
  }
  else
  {
    if (!advertiseRate)
    {
      objc_super v10 = "Invalid";
      goto LABEL_26;
    }
    if (advertiseRate == 10)
    {
      objc_super v10 = "Infrequent";
      goto LABEL_26;
    }
  }
  objc_super v10 = "?";
LABEL_26:
  SEL v14 = v10;
  NSAppendPrintF();
  id v11 = v8;

  [(NSData *)self->_payloadDataCurrent bytes];
  [(NSData *)self->_payloadDataCurrent length];
  [(NSData *)self->_payloadDataCurrent length];
  NSAppendPrintF();
  id v12 = v11;

  return (NSString *)v12;
}

- (void)setAdvertiseRate:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__SFBLEAdvertiser_setAdvertiseRate___block_invoke;
    v6[3] = &unk_1E5BBC910;
    v6[4] = v4;
    v6[5] = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_int64_t advertiseRate = a3;
  }
  objc_sync_exit(v4);
}

uint64_t __36__SFBLEAdvertiser_setAdvertiseRate___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 104))
  {
    *(void *)(v2 + 104) = v1;
    return [*(id *)(result + 32) _restartIfNeeded:1];
  }
  return result;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)setLePipeDevices:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__SFBLEAdvertiser_setLePipeDevices___block_invoke;
    v7[3] = &unk_1E5BBBD18;
    v7[4] = v5;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    objc_storeStrong((id *)&v5->_lePipeDevices, v4);
  }
  objc_sync_exit(v5);
}

uint64_t __36__SFBLEAdvertiser_setLePipeDevices___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _restartIfNeeded:1];
}

- (void)setPayloadData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__SFBLEAdvertiser_setPayloadData___block_invoke;
  aBlock[3] = &unk_1E5BBBD18;
  aBlock[4] = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  int v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__SFBLEAdvertiser_setPayloadData___block_invoke_2;
    v11[3] = &unk_1E5BBC9C8;
    v11[4] = v6;
    id v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }
  else
  {
    v8[2](v8);
  }

  objc_sync_exit(v6);
}

void __34__SFBLEAdvertiser_setPayloadData___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;
}

uint64_t __34__SFBLEAdvertiser_setPayloadData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _restartIfNeeded:0];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SFBLEAdvertiser_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __42__SFBLEAdvertiser_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    uint64_t v14 = 4294960572;
    goto LABEL_18;
  }
  if (self->_startRetrier)
  {
    uint64_t v14 = 4294960575;
    goto LABEL_18;
  }
  int64_t payloadType = self->_payloadType;
  if ((unint64_t)(payloadType - 15) > 1)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90)
    {
      if (var0 != -1)
      {
LABEL_11:
        if ((unint64_t)(payloadType + 1) > 0x12) {
          char v13 = "?";
        }
        else {
          char v13 = off_1E5BBF050[payloadType + 1];
        }
        int64_t v24 = payloadType;
        v25 = v13;
        LogPrintF();
        goto LABEL_17;
      }
      if (_LogCategory_Initialize())
      {
        int64_t payloadType = self->_payloadType;
        goto LABEL_11;
      }
    }
LABEL_17:
    uint64_t v14 = 4294960561;
    goto LABEL_18;
  }
  self->_wpNearbyType = payloadType != 15;
  if (self->_wpNearby) {
    goto LABEL_33;
  }
  uint64_t v6 = +[SFBLEClient sharedClient];
  id v7 = [v6 addNearbyDelegate:self];
  wpNearby = self->_wpNearby;
  self->_wpNearby = v7;

  if (self->_wpNearby)
  {
LABEL_33:
    id v9 = (CURetrier *)objc_alloc_init(MEMORY[0x1E4F5E1D0]);
    startRetrier = self->_startRetrier;
    self->_startRetrier = v9;

    id v11 = self->_startRetrier;
    if (v11)
    {
      [(CURetrier *)v11 setDispatchQueue:self->_dispatchQueue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __43__SFBLEAdvertiser__activateWithCompletion___block_invoke;
      v26[3] = &unk_1E5BBC870;
      v26[4] = self;
      [(CURetrier *)self->_startRetrier setActionHandler:v26];
      [(CURetrier *)self->_startRetrier startDirect];
      if (v4) {
        v4[2](v4, 0);
      }
      goto LABEL_26;
    }
  }
  uint64_t v14 = 4294960567;
LABEL_18:
  int v15 = self->_ucat->var0;
  if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize()))
  {
    int64_t v24 = v14;
    LogPrintF();
  }
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28760];
    uint64_t v18 = (int)v14;
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v20 = (void *)v19;
    v21 = @"?";
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v28[0] = v21;
    v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v24, v25);
    v23 = [v16 errorWithDomain:v17 code:v18 userInfo:v22];
    ((void (**)(id, void *))v4)[2](v4, v23);
  }
LABEL_26:
}

uint64_t __43__SFBLEAdvertiser__activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartIfNeeded:1];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SFBLEAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFBLEAdvertiser_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  [(CURetrier *)self->_startRetrier invalidateDirect];
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  int64_t payloadType = self->_payloadType;
  if (payloadType == 16)
  {
    wpNearby = self->_wpNearby;
    uint64_t v8 = 1;
  }
  else
  {
    if (payloadType != 15)
    {
      int v11 = self->_ucat->var0;
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_17;
    }
    wpNearby = self->_wpNearby;
    uint64_t v8 = 0;
  }
  [(WPNearby *)wpNearby stopAdvertisingOfType:v8];
  id v9 = self->_wpNearby;
  if (v9)
  {
    objc_super v10 = +[SFBLEClient sharedClient];
    [v10 removeNearbyDelegate:self];

    id v9 = self->_wpNearby;
  }
  self->_wpNearby = 0;

LABEL_17:
  int v12 = self->_ucat->var0;
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id invalidationHandler = (void (**)(id, void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2](invalidationHandler, v5);
  }
  id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_id advertiseStateChangedHandler = 0;

  id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_id bluetoothStateChangedHandler = 0;

  id connectionHandler = self->_connectionHandler;
  self->_id connectionHandler = 0;

  id v17 = self->_invalidationHandler;
  self->_id invalidationHandler = 0;
}

- (id)_preparePayloadNearbyAction:(int *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  char v18 = Int64Ranged;
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x20u;
    char v18 = Int64Ranged;
  }
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x40u;
    char v18 = Int64Ranged;
  }
  CFDataGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();
  if ([v6 length] == 3) {
    char v18 = Int64Ranged | 0x80;
  }
  char v19 = 0;
  [v4 appendBytes:&v18 length:1];
  unsigned __int8 v17 = CFDictionaryGetInt64Ranged();
  [v4 appendBytes:&v17 length:1];
  if (v18 < 0) {
    [v4 appendData:v6];
  }
  unsigned int v7 = v17;
  if (v17 <= 0x24u && ((1 << v17) & 0x1200480A00) != 0 || v17 == 84)
  {
    char v8 = CFDictionaryGetInt64Ranged();
    char v19 = CFDictionaryGetInt64Ranged() & 0x1F | (32 * v8);
    [v4 appendBytes:&v19 length:1];
    unsigned int v7 = v17;
  }
  if (v7 - 33 <= 0x33 && ((1 << (v7 - 33)) & 0x8000000000009) != 0 || v7 - 9 < 3)
  {
    LOBYTE(v20) = 0;
    LOBYTE(v20) = CFDictionaryGetInt64Ranged();
    [v4 appendBytes:&v20 length:1];
    unsigned int v7 = v17;
  }
  if (v7 <= 0x2B && ((1 << v7) & 0x81300000A42) != 0 || v7 == 84)
  {
    LOBYTE(v20) = 13;
    [v4 appendBytes:&v20 length:1];
    unsigned int v7 = v17;
  }
  if (v7 == 8)
  {
    CFDataGetTypeID();
    id v9 = CFDictionaryGetTypedValue();
    uint64_t v10 = [v9 length];
    if (v10)
    {
      unint64_t v11 = v10;
      char v21 = 0;
      uint64_t v20 = 0;
      [v9 bytes];
      __memcpy_chk();
      if (v11 <= 8) {
        bzero((char *)&v20 + v11, 9 - v11);
      }
      [v4 appendBytes:&v20 length:9];
    }

    unsigned int v7 = v17;
    if (v17 == 8)
    {
      CFDataGetTypeID();
      int v12 = CFDictionaryGetTypedValue();
      if ([v12 length] == 3) {
        [v4 appendData:v12];
      }

      unsigned int v7 = v17;
    }
  }
  if (v7 == 10)
  {
    unint64_t Int64 = CFDictionaryGetInt64();
    char v19 = (Int64 >> 15) & 0x80 | (Int64 >> 1) & 8 | (Int64 >> 11) & 0x20 | (Int64 >> 14) & 0x10 | (Int64 >> 11) & 0x40 | ((Int64 & 0xFE) >> 1) & 7;
    [v4 appendBytes:&v19 length:1];
    unsigned int v7 = v17;
    if (v17 == 10)
    {
      LOBYTE(v20) = 13;
      [v4 appendBytes:&v20 length:1];
      unsigned int v7 = v17;
    }
  }
  LOBYTE(v20) = 0;
  if (v7 <= 0x33 && ((1 << v7) & 0x8001000000200) != 0)
  {
    LOBYTE(v20) = CFDictionaryGetInt64Ranged();
    [v4 appendBytes:&v20 length:1];
    if ((v20 & 4) != 0)
    {
      CFDataGetTypeID();
      uint64_t v14 = CFDictionaryGetTypedValue();
      if (v14) {
        [v4 appendData:v14];
      }
    }
  }
  if (v17 == 1)
  {
    char v16 = CFDictionaryGetInt64Ranged();
    [v4 appendBytes:&v16 length:1];
  }
  if (a3) {
    *a3 = 0;
  }

  return v4;
}

- (void)nearbyDidUpdateState:(id)a3
{
  id v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby) {
    BOOL v5 = wpNearby == v9;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = [(WPNearby *)v9 state];
    int var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v6 == 3) {
      [(SFBLEAdvertiser *)self _restartIfNeeded:1];
    }
    id bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler) {
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
    }
  }
}

- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v12 = wpNearby == v10;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12 && self->_wpNearbyType == a4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v8;
      LogPrintF();
    }
    if (self->_advertiseState)
    {
      self->_advertiseState = 0;
      id advertiseStateChangedHandler = (void (**)(id, void))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 0);
      }
    }
    if (objc_msgSend(v8, "code", v19) == 28)
    {
      uint32_t v15 = arc4random() % 0x123 + 10;
      int v16 = self->_ucat->var0;
      if (v16 <= 50 && (v16 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      dispatch_time_t v17 = dispatch_time(0, 1000000 * v15);
      char v18 = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__SFBLEAdvertiser_nearby_didStopAdvertisingType_withError___block_invoke;
      block[3] = &unk_1E5BBC870;
      block[4] = self;
      dispatch_after(v17, v18, block);
    }
  }
}

unsigned char *__59__SFBLEAdvertiser_nearby_didStopAdvertisingType_withError___block_invoke(uint64_t a1)
{
  int result = *(unsigned char **)(a1 + 32);
  if (!result[24]) {
    return (unsigned char *)[result _restartIfNeeded:1];
  }
  return result;
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  unsigned int v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v9 = wpNearby == v7;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && self->_wpNearbyType == a4 && self->_advertiseState != 2)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_advertiseState = 2;
    id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
    {
      BOOL v12 = (void (*)(void))*((void *)advertiseStateChangedHandler + 2);
      v12();
    }
  }
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v15 = a5;
  dispatchQueue = self->_dispatchQueue;
  BOOL v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby) {
    BOOL v11 = wpNearby == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && self->_wpNearbyType == a4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v14 = v15;
      LogPrintF();
    }
    [(CURetrier *)self->_startRetrier failedDirect];
    if (self->_advertiseState != 3)
    {
      self->_advertiseState = 3;
      id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 3);
      }
    }
  }
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v16 = a4;
  id v9 = a6;
  dispatchQueue = self->_dispatchQueue;
  BOOL v11 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby && wpNearby == v11 && self->_connectionHandler)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v9)
    {
      int v15 = self->_ucat->var0;
      if (v15 <= 50 && (v15 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      id v14 = objc_alloc_init(SFBLEDevice);
      [(SFBLEDevice *)v14 setIdentifier:v16];
      (*((void (**)(id, SFBLEDevice *))self->_connectionHandler + 2))(self->_connectionHandler, v14);
    }
  }
}

- (id)advertiseStateChangedHandler
{
  return self->_advertiseStateChangedHandler;
}

- (void)setAdvertiseStateChangedHandler:(id)a3
{
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lePipeDevices, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_advertiseStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadFields, 0);
  objc_storeStrong((id *)&self->_payloadDataPrevious, 0);

  objc_storeStrong((id *)&self->_payloadDataCurrent, 0);
}

@end