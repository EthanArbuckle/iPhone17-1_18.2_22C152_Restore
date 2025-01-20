@interface CBStackClassicScannerBTStack
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (void)_deviceFound:(void *)a3 deviceUUID:(id)a4;
- (void)_deviceLost:(id)a3;
- (void)_discoveryEvent:(int)a3 device:(BTDeviceImpl *)a4 attributes:(unsigned int)a5;
- (void)_invalidated;
- (void)_statusEvent:(int)a3 device:(BTDeviceImpl *)a4 result:(int)a5;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CBStackClassicScannerBTStack

- (id)description
{
  return [(CBStackClassicScannerBTStack *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceMap count];
  if (v4 < 0x15)
  {
    uint64_t v22 = 0;
    v23 = (id *)&v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_10004CF0C;
    v26 = sub_10004CD58;
    id v27 = 0;
    uint64_t v21 = 0;
    v12 = [(id)objc_opt_class() description];
    NSAppendPrintF_safe();
    objc_storeStrong(&v27, 0);

    v7 = v23;
    id obj = v23[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v7 + 5, obj);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    deviceMap = self->_deviceMap;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100088A90;
    v14[3] = &unk_100997428;
    v14[4] = &v22;
    v14[5] = &v16;
    unsigned int v15 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v14, v12, v5);
    if ((unint64_t)v5 > v17[3])
    {
      v9 = v23;
      id v13 = v23[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v9 + 5, v13);
    }
    _Block_object_dispose(&v16, 8);
    id v6 = v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v11 = [(id)objc_opt_class() description];
    NSPrintF_safe();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)activate
{
  if (!self->_deviceFoundHandler)
  {
    CUFatalErrorF();
    goto LABEL_45;
  }
  v2 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_45:
    CUFatalErrorF();
    goto LABEL_46;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_46:
    CUFatalErrorF();
    goto LABEL_47;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (v2->_invalidateCalled)
  {
LABEL_47:
    CUFatalErrorF();
LABEL_48:
    dispatch_once(&qword_1009F8168, &stru_100998590);
    goto LABEL_13;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC160);
  v7 = (void *)qword_1009FC158;
  if (!qword_1009FC158)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = (void *)qword_1009FC158;
    qword_1009FC158 = (uint64_t)v8;

    v7 = (void *)qword_1009FC158;
  }
  v10 = +[NSNumber numberWithLong:v2];
  [v7 setObject:v2 forKeyedSubscript:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC160);
  p_btSession = (unint64_t *)&v2->_btSession;
  if (v2->_btSession) {
    goto LABEL_22;
  }
  id v5 = &unk_1009F8000;
  if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"CBDaemon-0x%X", CBXPCGetNextClientID()];
  if (qword_1009F8168 != -1) {
    goto LABEL_48;
  }
LABEL_13:
  uint64_t v11 = qword_1009F8160;
  id v12 = v4;
  sub_10004191C(&__p, (char *)[v12 UTF8String]);
  int v13 = sub_100009254(v11, (uint64_t)&__p);
  int v14 = v13;
  if (v25 < 0)
  {
    operator delete(__p);
    if (!v14) {
      goto LABEL_21;
    }
  }
  else if (!v13)
  {
    goto LABEL_21;
  }
  int v15 = v5[176];
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = CUPrintErrorCode();
    LogPrintF_safe();
  }
LABEL_21:

  if (!*p_btSession) {
    return;
  }
LABEL_22:
  if (v2->_btDiscoveryAgent) {
    return;
  }
  __p = 0;
  uint64_t v24 = 0;
  if (qword_1009F8398 != -1) {
    dispatch_once(&qword_1009F8398, &stru_1009985B0);
  }
  sub_100504BC4((uint64_t)off_1009F8390, *p_btSession, (unint64_t *)&v2->_btDiscoveryAgent, (uint64_t *)&__p);
  if (!__p)
  {
    if (dword_1009F82C0 <= 90 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    goto LABEL_41;
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)off_100998558;
  sub_100500908((uint64_t *)__p, (uint64_t)v2->_btDiscoveryAgent, v22, (uint64_t)v2);
  if (qword_1009F8398 != -1) {
    dispatch_once(&qword_1009F8398, &stru_1009985B0);
  }
  uint64_t v16 = off_1009F8390;
  v20 = __p;
  uint64_t v21 = v24;
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v17 = sub_1005057C8((uint64_t)v16, &v20, 0, -1);
  if (v21) {
    sub_10008A294(v21);
  }
  if (!v17) {
    goto LABEL_37;
  }
  if (dword_1009F82C0 <= 90)
  {
    if (dword_1009F82C0 != -1 || _LogCategory_Initialize())
    {
      uint64_t v19 = CUPrintErrorCode();
      LogPrintF_safe();
    }
LABEL_37:
    if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
LABEL_41:
  if (v24) {
    sub_10008A294(v24);
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC160);
    v3 = (void *)qword_1009FC158;
    id v4 = +[NSNumber numberWithLong:self];
    [v3 setObject:0 forKeyedSubscript:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC160);
    if (self->_btDiscoveryAgent)
    {
      if (qword_1009F8398 != -1) {
        dispatch_once(&qword_1009F8398, &stru_1009985B0);
      }
      sub_100504FC0((uint64_t)off_1009F8390, (unint64_t)self->_btDiscoveryAgent);
      self->_btDiscoveryAgent = 0;
      if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
    }
    if (self->_btSession)
    {
      if (qword_1009F8168 != -1) {
        dispatch_once(&qword_1009F8168, &stru_100998590);
      }
      sub_10000A678(qword_1009F8160, (unint64_t)self->_btSession);
      self->_btSession = 0;
    }
    [(CBStackClassicScannerBTStack *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (v6) {
      v6[2]();
    }
    if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_deviceFound:(void *)a3 deviceUUID:(id)a4
{
  id v6 = a4;
  if (!self->_invalidateCalled)
  {
    id v17 = v6;
    v7 = [v6 UUIDString];
    id v8 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v7];
    if (v8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v10 = objc_alloc_init((Class)CBDevice);
      [v10 setIdentifier:v7];
      [v10 setInternalFlags:128];
      uint64_t v9 = 0x4000000;
      id v8 = v10;
    }
    [v8 setDiscoveryFlags:[v8 discoveryFlags] | 0x4000000000000];
    [v8 setChangeFlags:0];
    unint64_t v11 = (unint64_t)[v8 updateWithClassicDevice:a3 deviceUUID:v17] | v9;
    [v8 setChangeFlags:((unint64_t)[v8 changeFlags] | v11)];
    [v8 setLastSeenTicks:mach_absolute_time()];
    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        int v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        int v14 = self->_deviceMap;
        self->_deviceMap = v13;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v8 forKeyedSubscript:v7];
      if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v15 = objc_retainBlock(self->_deviceFoundHandler);
      uint64_t v16 = v15;
      if (!v15) {
        goto LABEL_20;
      }
    }
    else
    {
      if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      id v15 = objc_retainBlock(self->_deviceFoundHandler);
      uint64_t v16 = v15;
      if (!v15) {
        goto LABEL_20;
      }
    }
    (*((void (**)(id, void *))v15 + 2))(v15, v8);
LABEL_20:

    id v6 = v17;
  }
}

- (void)_deviceLost:(id)a3
{
  id v8 = a3;
  id v4 = [v8 UUIDString];
  id v5 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v4];
  if (v5)
  {
    [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v4];
    if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    id v6 = objc_retainBlock(self->_deviceLostHandler);
    v7 = v6;
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v5);
    }
  }
  else if (dword_1009F82C0 <= 20 && (dword_1009F82C0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_discoveryEvent:(int)a3 device:(BTDeviceImpl *)a4 attributes:(unsigned int)a5
{
  if (self->_invalidateCalled) {
    return;
  }
  uint64_t v5 = *(void *)&a5;
  if (qword_1009F7F00 != -1) {
    dispatch_once(&qword_1009F7F00, &stru_1009985D0);
  }
  uint64_t v9 = (unsigned __int8 *)sub_1004A930C((uint64_t)off_1009F7EF8, (unint64_t)a4);
  if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize()))
  {
    if (a3 > 2)
    {
      id v10 = "?";
      if (v9)
      {
LABEL_8:
        sub_100474E18((uint64_t)v9, __p);
        if (v23 >= 0) {
          unint64_t v11 = __p;
        }
        else {
          unint64_t v11 = (void **)__p[0];
        }
LABEL_15:
        v20 = v11;
        uint64_t v21 = v5;
        uint64_t v19 = v10;
        LogPrintF_safe();
        if (v9 && v23 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_18;
      }
    }
    else
    {
      id v10 = off_100998610[a3];
      if (v9) {
        goto LABEL_8;
      }
    }
    unint64_t v11 = 0;
    goto LABEL_15;
  }
LABEL_18:
  uint64_t v12 = v9[128];
  uint64_t v13 = v9[129];
  uint64_t v14 = v9[130];
  uint64_t v15 = v9[131];
  uint64_t v16 = v9[132];
  uint64_t v17 = v9[133];
  v24[0] = 0;
  v24[1] = 0;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_1009985F0);
  }
  sub_100014B58((uint64_t)off_1009F7ED8, (v12 << 40) | (v13 << 32) | (v14 << 24) | (v15 << 16) | (v16 << 8) | v17, 1u, 1u, 0, 0, (unsigned __int8 *)v24);
  uint64_t v18 = sub_100031234((const unsigned __int8 *)v24);
  if (v18)
  {
    if (!a3 || a3 == 2)
    {
      -[CBStackClassicScannerBTStack _deviceFound:deviceUUID:](self, "_deviceFound:deviceUUID:", v9, v18, v19, v20, v21);
    }
    else if (a3 == 1)
    {
      [(CBStackClassicScannerBTStack *)self _deviceLost:v18];
    }
  }
  else if (dword_1009F82C0 <= 90 && (dword_1009F82C0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)_statusEvent:(int)a3 device:(BTDeviceImpl *)a4 result:(int)a5
{
  if (!self->_invalidateCalled && self->_btDiscoveryAgent)
  {
    if (qword_1009F7F00 != -1) {
      dispatch_once(&qword_1009F7F00, &stru_1009985D0);
    }
    unint64_t v8 = sub_1004A930C((uint64_t)off_1009F7EF8, (unint64_t)a4);
    if (dword_1009F82C0 > 30 || (uint64_t v9 = v8, dword_1009F82C0 == -1) && !_LogCategory_Initialize())
    {
LABEL_17:
      if (a3 != 1) {
        return;
      }
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      if (qword_1009F8398 != -1) {
        dispatch_once(&qword_1009F8398, &stru_1009985B0);
      }
      sub_100504E18((uint64_t)off_1009F8390, (unint64_t)self->_btDiscoveryAgent, &v16);
      if (!v16)
      {
        if (dword_1009F82C0 <= 90 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        goto LABEL_36;
      }
      if (qword_1009F8398 != -1) {
        dispatch_once(&qword_1009F8398, &stru_1009985B0);
      }
      id v10 = off_1009F8390;
      uint64_t v14 = v16;
      uint64_t v15 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v11 = sub_1005057C8((uint64_t)v10, &v14, 0, -1);
      if (v15) {
        sub_10008A294(v15);
      }
      if (v11)
      {
        if (dword_1009F82C0 > 90)
        {
LABEL_36:
          if (v17) {
            sub_10008A294(v17);
          }
          return;
        }
        if (dword_1009F82C0 != -1 || _LogCategory_Initialize())
        {
          uint64_t v12 = CUPrintErrorCode();
          LogPrintF_safe();
        }
      }
      if (dword_1009F82C0 <= 30 && (dword_1009F82C0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      goto LABEL_36;
    }
    if (a3 > 3)
    {
      if (!v9) {
        goto LABEL_14;
      }
    }
    else if (!v9)
    {
LABEL_14:
      uint64_t v13 = CUPrintErrorCode();
      LogPrintF_safe();

      if (v9 && v19 < 0) {
        operator delete(__p);
      }
      goto LABEL_17;
    }
    sub_100474E18(v9, &__p);
    goto LABEL_14;
  }
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
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_scanSummary, 0);

  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end