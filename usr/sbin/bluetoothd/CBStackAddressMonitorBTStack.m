@interface CBStackAddressMonitorBTStack
- (NSData)connectableAddressData;
- (NSData)fakeNonConnectableAddressData;
- (NSData)nonConnectableAddressData;
- (NSData)nonConnectableSecondaryAddressData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_dataWithBTAddress:(unint64_t)a3;
- (id)addressChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (void)activate;
- (void)addressChanged:(BOOL)a3;
- (void)forceNonConnectableAddressReadAndUpdate:(unsigned __int8)a3;
- (void)invalidate;
- (void)setAddressChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CBStackAddressMonitorBTStack

- (NSData)nonConnectableAddressData
{
  return self->_nonConnectableAddressData;
}

- (id)description
{
  return [(CBStackAddressMonitorBTStack *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    NSAppendPrintF_safe();
    id v3 = 0;
  }
  v4 = CUPrintNSDataAddress();
  v5 = CUPrintNSDataAddress();
  v8 = CUPrintNSDataAddress();
  NSAppendPrintF_safe();
  id v6 = v3;

  return v6;
}

- (void)activate
{
  if (!self->_addressChangedHandler)
  {
    FatalErrorF();
    goto LABEL_11;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_11:
    uint64_t v4 = FatalErrorF();
    sub_1000D27C8(v4, v5);
    return;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC1A0);
    if (!qword_1009FC1A8) {
      operator new();
    }
    sub_1000D27C8(qword_1009FC1A8, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC1A0);
    self->_addedMonitor = 1;
  }

  [(CBStackAddressMonitorBTStack *)self addressChanged:1];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC1A0);
    if (qword_1009FC1A8) {
      sub_1000D296C(qword_1009FC1A8, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC1A0);
    self->_addedMonitor = 0;
  }
  id addressChangedHandler = self->_addressChangedHandler;
  self->_id addressChangedHandler = 0;

  v5 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  if (v5) {
    v5[2]();
  }
}

- (void)addressChanged:(BOOL)a3
{
  if (self->_addedMonitor)
  {
    BOOL v3 = a3;
    if (qword_1009F7EC0 != -1) {
      dispatch_once(&qword_1009F7EC0, &stru_10099A150);
    }
    v5 = [(CBStackAddressMonitorBTStack *)self _dataWithBTAddress:*((void *)off_1009F7EB8 + 36)];
    connectableAddressData = self->_connectableAddressData;
    v7 = v5;
    v8 = connectableAddressData;
    BOOL v9 = v7 != v8;
    if (v7 == v8)
    {

      v12 = v7;
    }
    else
    {
      v10 = v8;
      if ((v7 == 0) != (v8 != 0))
      {
        unsigned __int8 v11 = [(NSData *)v7 isEqual:v8];

        if (v11)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      else
      {
      }
      v13 = v7;
      v12 = self->_connectableAddressData;
      self->_connectableAddressData = v13;
    }

LABEL_12:
    if (qword_1009F7EC0 != -1) {
      dispatch_once(&qword_1009F7EC0, &stru_10099A150);
    }
    v14 = [(CBStackAddressMonitorBTStack *)self _dataWithBTAddress:*((void *)off_1009F7EB8 + 37)];
    nonConnectableAddressData = self->_nonConnectableAddressData;
    v16 = v14;
    v17 = nonConnectableAddressData;
    if (v16 == v17)
    {

      v20 = v16;
    }
    else
    {
      v18 = v17;
      if ((v16 == 0) != (v17 != 0))
      {
        unsigned __int8 v19 = [(NSData *)v16 isEqual:v17];

        if (v19)
        {
LABEL_22:
          if (qword_1009F7EC0 != -1) {
            dispatch_once(&qword_1009F7EC0, &stru_10099A150);
          }
          v22 = [(CBStackAddressMonitorBTStack *)self _dataWithBTAddress:*((void *)off_1009F7EB8 + 39)];
          nonConnectableSecondaryAddressData = self->_nonConnectableSecondaryAddressData;
          v24 = v22;
          v25 = nonConnectableSecondaryAddressData;
          if (v24 == v25)
          {

            if (!v3)
            {
LABEL_30:
              if (!v9) {
                goto LABEL_38;
              }
LABEL_35:
              id v30 = objc_retainBlock(self->_addressChangedHandler);
              v31 = v30;
              if (v30) {
                (*((void (**)(id))v30 + 2))(v30);
              }

              goto LABEL_38;
            }
          }
          else
          {
            v26 = v25;
            if ((v24 == 0) != (v25 != 0))
            {
              unsigned __int8 v27 = [(NSData *)v24 isEqual:v25];

              if (v27)
              {
                if (v3) {
                  goto LABEL_34;
                }
                goto LABEL_30;
              }
            }
            else
            {
            }
            objc_storeStrong((id *)&self->_nonConnectableSecondaryAddressData, v22);
            if (!v3) {
              goto LABEL_35;
            }
          }
LABEL_34:
          RandomBytes();
          -[CBStackAddressMonitorBTStack _dataWithBTAddress:](self, "_dataWithBTAddress:");
          v28 = (NSData *)objc_claimAutoreleasedReturnValue();
          fakeNonConnectableAddressData = self->_fakeNonConnectableAddressData;
          self->_fakeNonConnectableAddressData = v28;

LABEL_38:
          return;
        }
      }
      else
      {
      }
      v21 = v16;
      v20 = self->_nonConnectableAddressData;
      self->_nonConnectableAddressData = v21;
      BOOL v9 = 1;
    }

    goto LABEL_22;
  }
}

- (void)forceNonConnectableAddressReadAndUpdate:(unsigned __int8)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_addedMonitor) {
    return;
  }
  v5 = [(CBStackAddressMonitorBTStack *)self _dataWithBTAddress:sub_1000D2EDC(v4, 1u)];
  nonConnectableAddressData = self->_nonConnectableAddressData;
  v12 = v5;
  v7 = nonConnectableAddressData;
  if (v12 == v7)
  {

    v10 = v12;
  }
  else
  {
    v8 = v7;
    if ((v12 == 0) != (v7 != 0))
    {
      unsigned __int8 v9 = [(NSData *)v12 isEqual:v7];

      if (v9) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_nonConnectableAddressData, v5);
    unsigned __int8 v11 = (NSData *)objc_retainBlock(self->_addressChangedHandler);
    v10 = v11;
    if (v11) {
      ((void (*)(NSData *))v11[2].super.isa)(v11);
    }
  }

LABEL_12:
}

- (id)_dataWithBTAddress:(unint64_t)a3
{
  if (a3)
  {
    v6[0] = BYTE5(a3);
    v6[1] = BYTE4(a3);
    v6[2] = BYTE3(a3);
    v6[3] = BYTE2(a3);
    v6[4] = BYTE1(a3);
    v6[5] = a3;
    id v4 = [objc_alloc((Class)NSData) initWithBytes:v6 length:6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSData)connectableAddressData
{
  return self->_connectableAddressData;
}

- (NSData)nonConnectableSecondaryAddressData
{
  return self->_nonConnectableSecondaryAddressData;
}

- (NSData)fakeNonConnectableAddressData
{
  return self->_fakeNonConnectableAddressData;
}

- (id)addressChangedHandler
{
  return self->_addressChangedHandler;
}

- (void)setAddressChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_addressChangedHandler, 0);
  objc_storeStrong((id *)&self->_fakeNonConnectableAddressData, 0);
  objc_storeStrong((id *)&self->_nonConnectableSecondaryAddressData, 0);
  objc_storeStrong((id *)&self->_nonConnectableAddressData, 0);

  objc_storeStrong((id *)&self->_connectableAddressData, 0);
}

@end