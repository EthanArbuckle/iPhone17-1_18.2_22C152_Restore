@interface RPPeopleDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)_ensureXPCStarted;
- (BOOL)targetUserSession;
- (NSArray)discoveredPeople;
- (NSSet)rangingPeople;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDiscovery)init;
- (RPPeopleDiscovery)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)peopleDensityChangedHandler;
- (id)personChangedHandler;
- (id)personFoundHandler;
- (id)personLostHandler;
- (id)statusChangedHandler;
- (int)discoveryMode;
- (int)peopleDensity;
- (unsigned)changeFlags;
- (unsigned)discoveryFlags;
- (unsigned)scanRate;
- (unsigned)statusFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_lostAllPeople;
- (void)_scheduleRetry;
- (void)_updatePeopleDensity:(unint64_t)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addAppleID:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)removeAppleID:(id)a3 completion:(id)a4;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDiscoveryFlags:(unsigned int)a3;
- (void)setDiscoveryMode:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeopleDensityChangedHandler:(id)a3;
- (void)setPersonChangedHandler:(id)a3;
- (void)setPersonFoundHandler:(id)a3;
- (void)setPersonLostHandler:(id)a3;
- (void)setRangingPeople:(id)a3;
- (void)setScanRate:(unsigned int)a3;
- (void)setStatusChangedHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)xpcPeopleStatusChanged:(unsigned int)a3;
- (void)xpcPersonChanged:(id)a3 changes:(unsigned int)a4;
- (void)xpcPersonFound:(id)a3;
- (void)xpcPersonID:(id)a3 deviceID:(id)a4 updatedMeasurement:(id)a5;
- (void)xpcPersonLost:(id)a3;
@end

@implementation RPPeopleDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPeopleDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPPeopleDiscovery;
  v2 = [(RPPeopleDiscovery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (RPPeopleDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPPeopleDiscovery;
  v5 = [(RPPeopleDiscovery *)&v9 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_changeFlags = v10;
    }
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_discoveryFlags = v10;
    }
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_discoveryMode = v10;
    }
    objc_opt_class();
    NSDecodeNSSetOfClassIfPresent();
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_scanRate = v10;
    }
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t changeFlags = self->_changeFlags;
  id v10 = v4;
  if (changeFlags)
  {
    [v4 encodeInt64:changeFlags forKey:@"cf"];
    id v4 = v10;
  }
  uint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
  {
    [v10 encodeInt64:discoveryFlags forKey:@"df"];
    id v4 = v10;
  }
  uint64_t discoveryMode = self->_discoveryMode;
  if (discoveryMode)
  {
    [v10 encodeInteger:discoveryMode forKey:@"dm"];
    id v4 = v10;
  }
  rangingPersonIDs = self->_rangingPersonIDs;
  if (rangingPersonIDs)
  {
    [v10 encodeObject:rangingPersonIDs forKey:@"rpi"];
    id v4 = v10;
  }
  uint64_t scanRate = self->_scanRate;
  if (scanRate)
  {
    [v10 encodeInt64:scanRate forKey:@"scr"];
    id v4 = v10;
  }
}

- (id)description
{
  return [(RPPeopleDiscovery *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v26 = 0;
  v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  id v25 = 0;
  int discoveryMode = self->_discoveryMode;
  if (discoveryMode > 199)
  {
    if (discoveryMode == 200)
    {
      objc_super v6 = "MyMeDevices";
      goto LABEL_11;
    }
    if (discoveryMode == 400)
    {
      objc_super v6 = "Contacts";
      goto LABEL_11;
    }
LABEL_8:
    objc_super v6 = "?";
    goto LABEL_11;
  }
  if (!discoveryMode)
  {
    objc_super v6 = "~";
    goto LABEL_11;
  }
  if (discoveryMode != 1) {
    goto LABEL_8;
  }
  objc_super v6 = "PTS";
LABEL_11:
  uint64_t changeFlags = self->_changeFlags;
  uint64_t discoveryFlags = self->_discoveryFlags;
  v16 = v6;
  NSAppendPrintF();
  objc_storeStrong(&v31, v25);
  if (a3 <= 30)
  {
    v7 = v27 + 5;
    id obj = v27[5];
    uint64_t v8 = [(NSMutableDictionary *)self->_discoveredPeople count];
    int peopleDensity = self->_peopleDensity;
    if (peopleDensity < 1)
    {
      id v10 = "None";
    }
    else if (peopleDensity >= 0xB)
    {
      id v10 = peopleDensity >= 0x33 ? "High" : "Med";
    }
    else
    {
      id v10 = "Low";
    }
    uint64_t v17 = v8;
    v19 = v10;
    NSAppendPrintF();
    objc_storeStrong(v7, obj);
    if (a3 <= 20)
    {
      v11 = v27;
      id v23 = v27[5];
      NSAppendPrintF();
      objc_storeStrong(v11 + 5, v23);
      if (a3 >= 11) {
        int v12 = 50;
      }
      else {
        int v12 = 30;
      }
      discoveredPeople = self->_discoveredPeople;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke;
      v21[3] = &unk_1E605D2D0;
      v21[4] = &v26;
      int v22 = v12;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredPeople, "enumerateKeysAndObjectsUsingBlock:", v21, v17, v19);
    }
  }
  id v14 = v27[5];
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(RPPeopleDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 64) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setRangingPeople:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 copy];
  if (v5) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  else {
    id v6 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) identifier];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  int v12 = self;
  objc_sync_enter(v12);
  rangingPersonIDs = v12->_rangingPersonIDs;
  id v14 = (NSMutableSet *)v6;
  v15 = rangingPersonIDs;
  if (v14 == v15)
  {
  }
  else
  {
    v16 = v15;
    if ((v14 == 0) != (v15 != 0))
    {
      char v17 = [(NSMutableSet *)v14 isEqual:v15];

      if (v17) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&v12->_rangingPeople, v5);
    objc_storeStrong((id *)&v12->_rangingPersonIDs, v6);
    if (v12->_activateCalled)
    {
      dispatchQueue = v12->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__RPPeopleDiscovery_setRangingPeople___block_invoke;
      block[3] = &unk_1E605B540;
      block[4] = v12;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_19:
  objc_sync_exit(v12);
}

void __38__RPPeopleDiscovery_setRangingPeople___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) remoteObjectProxy];
  [v2 xpcPeopleDiscoveryUpdate:*(void *)(a1 + 32)];
}

- (void)setScanRate:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__RPPeopleDiscovery_setScanRate___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(RPPeopleDiscovery *)self _invokeBlockActivateSafe:v3];
}

uint64_t __33__RPPeopleDiscovery_setScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 76) = *(_DWORD *)(result + 40);
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__RPPeopleDiscovery_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E605B650;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __44__RPPeopleDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_7;
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 30 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
LABEL_7:
    if (self->_targetUserSession) {
      id v7 = "(TargetUserSession)";
    }
    else {
      id v7 = "";
    }
    v11 = v7;
    LogPrintF();
  }
  if ([(RPPeopleDiscovery *)self _ensureXPCStarted])
  {
    xpcCnx = self->_xpcCnx;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke;
    v15[3] = &unk_1E605BCF0;
    BOOL v17 = v4;
    v15[4] = self;
    id v9 = v6;
    id v16 = v9;
    id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2;
    v12[3] = &unk_1E605D2F8;
    BOOL v14 = v4;
    v12[4] = self;
    id v13 = v9;
    [v10 xpcPeopleDiscoveryActivate:self completion:v12];
  }
  else
  {
    [(RPPeopleDiscovery *)self _scheduleRetry];
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v4 = v5;
      LogPrintF();
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 90 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry", v4);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          int v12 = *(void **)(*(void *)(a1 + 32) + 16);
          if (!v12)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v14 = *(void *)(a1 + 32);
            v15 = *(void **)(v14 + 16);
            *(void *)(v14 + 16) = v13;

            int v12 = *(void **)(*(void *)(a1 + 32) + 16);
          }
          id v16 = [v11 identifier];
          [v12 setObject:v11 forKeyedSubscript:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }

    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    objc_sync_exit(obj);

    if (*(unsigned char *)(a1 + 48))
    {
      if (gLogCategory_RPPeopleDiscovery > 30
        || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_37;
      }
    }
    else if (gLogCategory_RPPeopleDiscovery > 30 {
           || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_37;
    }
    [v7 count];
    LogPrintF();
LABEL_37:
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
    long long v22 = (void (**)(void, void))MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 120));
    if (v22)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v23 = v7;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v23);
            }
            v22[2](v22, *(void *)(*((void *)&v29 + 1) + 8 * j));
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v24);
      }
    }
    [*(id *)(a1 + 32) _updatePeopleDensity:v17];
    goto LABEL_49;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      id v27 = v6;
      LogPrintF();
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 90 {
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "code", v27) == -71168)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18)
    {
      v19 = *(void (**)(void))(v18 + 16);
LABEL_33:
      v19();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _scheduleRetry];
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      v19 = *(void (**)(void))(v20 + 16);
      goto LABEL_33;
    }
  }
LABEL_49:
}

- (BOOL)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C481A0];
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_xpcPeopleDiscoveryActivate_completion_ argumentIndex:0 ofReply:1];

    id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.people" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C41C10];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v9];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke;
    v12[3] = &unk_1E605B540;
    v12[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_1E605B540;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPPeopleDiscovery <= 10
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 1;
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v4 = *(void **)(a1 + 32);
    return [v4 _invalidated];
  }
  else
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = *(void **)(a1 + 32);
    return [v6 _scheduleRetry];
  }
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E605BD40;
    v7[4] = v5;
    uint64_t v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

void __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) remoteObjectProxy];
  [v2 xpcPeopleDiscoveryUpdate:*(void *)(a1 + 32)];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPPeopleDiscovery <= 50
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(RPPeopleDiscovery *)self _lostAllPeople];
  if (self->_activateCalled) {
    [(RPPeopleDiscovery *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__RPPeopleDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__RPPeopleDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void **)(*(void *)(v2 + 32) + 40);
    if (v3)
    {
      id v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(v2 + 32);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;
    }
    [*(id *)(*(void *)(v2 + 32) + 48) invalidate];
    id v7 = *(void **)(v2 + 32);
    return [v7 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      uint64_t v5 = retryTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_retryTimer;
      self->_retryTimer = 0;
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id peopleDensityChangedHandler = self->_peopleDensityChangedHandler;
    self->_id peopleDensityChangedHandler = 0;

    id personFoundHandler = self->_personFoundHandler;
    self->_id personFoundHandler = 0;

    id personLostHandler = self->_personLostHandler;
    self->_id personLostHandler = 0;

    id personChangedHandler = self->_personChangedHandler;
    self->_id personChangedHandler = 0;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_scheduleRetry
{
  if (!self->_invalidateCalled && !self->_retryTimer)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v3;

    uint64_t v5 = self->_retryTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__RPPeopleDiscovery__scheduleRetry__block_invoke;
    handler[3] = &unk_1E605B540;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

unsigned char *__35__RPPeopleDiscovery__scheduleRetry__block_invoke(uint64_t a1)
{
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  result = *(unsigned char **)(a1 + 32);
  if (!result[24])
  {
    return (unsigned char *)[result _activateWithCompletion:0 reactivate:1];
  }
  return result;
}

- (NSArray)discoveredPeople
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    uint64_t v4 = [(NSMutableDictionary *)discoveredPeople allValues];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)_lostAllPeople
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id personLostHandler = self->_personLostHandler;
  id obj = self;
  objc_sync_enter(obj);
  discoveredPeople = obj->_discoveredPeople;
  if (personLostHandler)
  {
    uint64_t v5 = [(NSMutableDictionary *)discoveredPeople allValues];
    [(NSMutableDictionary *)obj->_discoveredPeople removeAllObjects];
    objc_sync_exit(obj);

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = (void (**)(id, void))self->_personLostHandler;
          if (v10) {
            v10[2](v10, *(void *)(*((void *)&v12 + 1) + 8 * i));
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [(NSMutableDictionary *)discoveredPeople removeAllObjects];
    objc_sync_exit(obj);
  }
}

- (void)_updatePeopleDensity:(unint64_t)a3
{
  if (a3 >= 0x1E) {
    int v3 = 90;
  }
  else {
    int v3 = 50;
  }
  if (a3 >= 5) {
    int v4 = v3;
  }
  else {
    int v4 = 10;
  }
  if (a3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  int peopleDensity = self->_peopleDensity;
  if (v5 != peopleDensity)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int peopleDensity = v5;
    uint64_t v8 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_peopleDensityChangedHandler);
    if (v8)
    {
      id v10 = v8;
      v8[2](v8, v9);
      uint64_t v8 = (void (**)(void, void))v10;
    }
  }
}

- (void)xpcPeopleStatusChanged:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_statusFlags = a3;
  int v5 = (void (**)(void, void, void, void))MEMORY[0x1B3EBCC80](self->_statusChangedHandler);
  if (v5)
  {
    uint64_t v9 = v5;
    v5[2](v5, v6, v7, v8);
    int v5 = v9;
  }
}

- (void)xpcPersonFound:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  int v5 = v12;
  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = v4->_discoveredPeople;
    v4->_discoveredPeople = v7;

    discoveredPeople = v4->_discoveredPeople;
    int v5 = v12;
  }
  uint64_t v9 = [v5 identifier];
  [(NSMutableDictionary *)discoveredPeople setObject:v12 forKeyedSubscript:v9];

  uint64_t v10 = [(NSMutableDictionary *)v4->_discoveredPeople count];
  objc_sync_exit(v4);

  id personFoundHandler = (void (**)(id, id))v4->_personFoundHandler;
  if (personFoundHandler) {
    personFoundHandler[2](personFoundHandler, v12);
  }
  [(RPPeopleDiscovery *)v4 _updatePeopleDensity:v10];
}

- (void)xpcPersonLost:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  discoveredPeople = v4->_discoveredPeople;
  uint64_t v6 = [v9 identifier];
  [(NSMutableDictionary *)discoveredPeople setObject:0 forKeyedSubscript:v6];

  uint64_t v7 = [(NSMutableDictionary *)v4->_discoveredPeople count];
  objc_sync_exit(v4);

  id personLostHandler = (void (**)(id, id))v4->_personLostHandler;
  if (personLostHandler) {
    personLostHandler[2](personLostHandler, v9);
  }
  [(RPPeopleDiscovery *)v4 _updatePeopleDensity:v7];
}

- (void)xpcPersonChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  discoveredPeople = v6->_discoveredPeople;
  uint64_t v8 = [v10 identifier];
  [(NSMutableDictionary *)discoveredPeople setObject:v10 forKeyedSubscript:v8];

  objc_sync_exit(v6);
  id personChangedHandler = (void (**)(id, id, void))v6->_personChangedHandler;
  if (personChangedHandler) {
    personChangedHandler[2](personChangedHandler, v10, v4);
  }
}

- (void)xpcPersonID:(id)a3 deviceID:(id)a4 updatedMeasurement:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v23 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  long long v22 = v8;
  v11 = [(NSMutableDictionary *)v10->_discoveredPeople objectForKeyedSubscript:v8];
  id v12 = v11;
  if (!v11) {
    goto LABEL_11;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v13 = [v11 devices];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v14)
  {
LABEL_10:

LABEL_11:
    objc_sync_exit(v10);
    goto LABEL_12;
  }
  uint64_t v15 = *(void *)v25;
LABEL_4:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v25 != v15) {
      objc_enumerationMutation(v13);
    }
    uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
    uint64_t v18 = [v17 identifier];
    char v19 = [v18 isEqual:v9];

    if (v19) {
      break;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  [v17 setRelativeLocation:v23];

  BOOL v20 = (v10->_changeFlags & 8) == 0;
  objc_sync_exit(v10);

  if (v20) {
    goto LABEL_13;
  }
  uint64_t v21 = MEMORY[0x1B3EBCC80](v10->_personChangedHandler);
  id v10 = (RPPeopleDiscovery *)v21;
  if (v21) {
    (*(void (**)(uint64_t, void *, uint64_t))(v21 + 16))(v21, v12, 8);
  }
LABEL_12:

LABEL_13:
}

- (void)addAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(RPPeopleDiscovery *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke;
  v16[3] = &unk_1E605B600;
  id v9 = v7;
  id v17 = v9;
  id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2;
  v13[3] = &unk_1E605BC60;
  id v14 = v6;
  id v15 = v9;
  id v11 = v9;
  id v12 = v6;
  [v10 xpcPeopleAddAppleID:v12 completion:v13];
}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

- (void)removeAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(RPPeopleDiscovery *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke;
  v16[3] = &unk_1E605B600;
  id v9 = v7;
  id v17 = v9;
  id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2;
  v13[3] = &unk_1E605BC60;
  id v14 = v6;
  id v15 = v9;
  id v11 = v9;
  id v12 = v6;
  [v10 xpcPeopleRemoveAppleID:v12 completion:v13];
}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_uint64_t changeFlags = a3;
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (int)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int)a3
{
  self->_int discoveryMode = a3;
}

- (int)peopleDensity
{
  return self->_peopleDensity;
}

- (id)peopleDensityChangedHandler
{
  return self->_peopleDensityChangedHandler;
}

- (void)setPeopleDensityChangedHandler:(id)a3
{
}

- (id)personFoundHandler
{
  return self->_personFoundHandler;
}

- (void)setPersonFoundHandler:(id)a3
{
}

- (id)personLostHandler
{
  return self->_personLostHandler;
}

- (void)setPersonLostHandler:(id)a3
{
}

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
}

- (NSSet)rangingPeople
{
  return self->_rangingPeople;
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_rangingPeople, 0);
  objc_storeStrong(&self->_personChangedHandler, 0);
  objc_storeStrong(&self->_personLostHandler, 0);
  objc_storeStrong(&self->_personFoundHandler, 0);
  objc_storeStrong(&self->_peopleDensityChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_rangingPersonIDs, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
}

@end