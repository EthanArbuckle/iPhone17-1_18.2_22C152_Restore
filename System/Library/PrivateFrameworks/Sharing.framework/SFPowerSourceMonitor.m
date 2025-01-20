@interface SFPowerSourceMonitor
- (BOOL)powerSourcesListWithOutInfo:(const void *)a3 outSources:(const __CFArray *)a4 outSourcesCount:(int64_t *)a5;
- (BOOL)skipCoalescing;
- (OS_dispatch_queue)dispatchQueue;
- (SFPowerSourceMonitor)init;
- (id)invalidationHandler;
- (id)powerSourcesChangedHandler;
- (id)powerSourcesFoundHandler;
- (id)powerSourcesLostHandler;
- (unsigned)changeFlags;
- (void)_cleanup;
- (void)_foundPowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5;
- (void)_handlePowerSourcesChanged:(id)a3 changes:(unsigned int)a4;
- (void)_handlePowerSourcesFound:(id)a3;
- (void)_handlePowerSourcesLost:(id)a3;
- (void)_removePowerSources:(id)a3;
- (void)_triggerUpdatePowerSources;
- (void)_update;
- (void)_updatePowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5;
- (void)_updatePowerSources;
- (void)_updatePowerSourcesWithInfo:(void *)a3 sources:(__CFArray *)a4 sourcesCount:(int64_t)a5;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPowerSourcesChangedHandler:(id)a3;
- (void)setPowerSourcesFoundHandler:(id)a3;
- (void)setPowerSourcesLostHandler:(id)a3;
- (void)setSkipCoalescing:(BOOL)a3;
@end

@implementation SFPowerSourceMonitor

- (void)_handlePowerSourcesChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
    id v20 = v5;
    LogPrintF();
  }
  v7 = objc_msgSend(v5, "mutableCopy", powerSourcesUpdateIndex, v20);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        if (([v13 present] & 1) == 0)
        {
          int v14 = self->_ucat->var0;
          if (v14 <= 10 && (v14 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v19 = self->_powerSourcesUpdateIndex;
            v21 = v13;
            LogPrintF();
          }
          objc_msgSend(v7, "removeObject:", v13, v19, v21);
          v27 = v13;
          v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
          [(SFPowerSourceMonitor *)self _removePowerSources:v15];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      uint64_t v10 = v16;
    }
    while (v16);
  }

  powerSourcesChangedHandler = (void (**)(id, void *))self->_powerSourcesChangedHandler;
  if (powerSourcesChangedHandler && (self->_changeFlags & a4) != 0) {
    powerSourcesChangedHandler[2](powerSourcesChangedHandler, v7);
  }
}

- (void)_triggerUpdatePowerSources
{
  if (self->_skipCoalescing)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFPowerSourceMonitor *)self _updatePowerSources];
  }
  else
  {
    if (!self->_updateCoalescer)
    {
      v4 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E4F5E0F8]);
      updateCoalescer = self->_updateCoalescer;
      self->_updateCoalescer = v4;

      [(CUCoalescer *)self->_updateCoalescer setDispatchQueue:self->_dispatchQueue];
      [(CUCoalescer *)self->_updateCoalescer setMaxDelay:0.05];
      [(CUCoalescer *)self->_updateCoalescer setMinDelay:0.03];
      id location = 0;
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__SFPowerSourceMonitor__triggerUpdatePowerSources__block_invoke;
      v9[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v10, &location);
      [(CUCoalescer *)self->_updateCoalescer setActionHandler:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    id location = 0;
    uint64_t v7 = 0;
    CFTypeRef cf = 0;
    if ([(SFPowerSourceMonitor *)self powerSourcesListWithOutInfo:&location outSources:&cf outSourcesCount:&v7])
    {
      if (v7 == self->_previousSourcesCount)
      {
        -[SFPowerSourceMonitor _updatePowerSourcesWithInfo:sources:sourcesCount:](self, "_updatePowerSourcesWithInfo:sources:sourcesCount:", location, cf);
      }
      else
      {
        int v6 = self->_ucat->var0;
        if (v6 <= 10 && (v6 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(CUCoalescer *)self->_updateCoalescer trigger];
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (location) {
        CFRelease(location);
      }
    }
  }
}

- (BOOL)powerSourcesListWithOutInfo:(const void *)a3 outSources:(const __CFArray *)a4 outSourcesCount:(int64_t *)a5
{
  CFTypeRef cf = 0;
  uint64_t v9 = IOPSCopyPowerSourcesByTypePrecise();
  if (v9)
  {
    uint64_t v10 = v9;
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v18 = v10;
      LogPrintF();
    }
    uint64_t v12 = (const void *)IOPSCopyPowerSourcesByType();
    CFTypeRef cf = v12;
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v12)
  {
    CFArrayRef v13 = IOPSCopyPowerSourcesList(v12);
    if (v13)
    {
      *a3 = cf;
      *a4 = v13;
      int v14 = 0;
      *a5 = CFArrayGetCount(v13);
LABEL_11:
      BOOL v15 = 1;
      goto LABEL_12;
    }
  }
  int v14 = NSErrorWithOSStatusF();
  if (!v14) {
    goto LABEL_11;
  }
  int v17 = self->_ucat->var0;
  if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = objc_msgSend(v14, "localizedDescription", v18);
    LogPrintF();
  }
  if (cf) {
    CFRelease(cf);
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)_updatePowerSourcesWithInfo:(void *)a3 sources:(__CFArray *)a4 sourcesCount:(int64_t)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  unsigned __int16 powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex + 1;
  self->_unsigned __int16 powerSourcesUpdateIndex = powerSourcesUpdateIndex;
  int var0 = self->_ucat->var0;
  if (var0 <= 10)
  {
    if (var0 != -1)
    {
LABEL_3:
      int64_t v50 = a5;
      uint64_t v52 = [(NSMutableDictionary *)self->_powerSources count];
      uint64_t v48 = powerSourcesUpdateIndex;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      unsigned __int16 powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_previousSourcesCount = a5;
  powerSources = self->_powerSources;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __73__SFPowerSourceMonitor__updatePowerSourcesWithInfo_sources_sourcesCount___block_invoke;
  v72[3] = &unk_1E5BBEEB0;
  v59 = self;
  v72[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](powerSources, "enumerateKeysAndObjectsUsingBlock:", v72, v48, v50, v52);
  CFDictionaryRef v56 = IOPSCopyExternalPowerAdapterDetails();
  if (a5 >= 1)
  {
    CFIndex v12 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a4, v12);
      int v14 = IOPSGetPowerSourceDescription(a3, ValueAtIndex);
      int v15 = self->_ucat->var0;
      if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v49 = self->_powerSourcesUpdateIndex;
        v51 = v14;
        LogPrintF();
      }
      if (v14)
      {
        uint64_t v16 = [v14 objectForKeyedSubscript:@"Power Source ID"];
        if (v16)
        {
          uint64_t v17 = [(NSMutableDictionary *)self->_powerSources objectForKeyedSubscript:v16];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            [(SFPowerSourceMonitor *)self _updatePowerSource:v17 desc:v14 adapterDesc:v56];
          }
          else
          {
            [(SFPowerSourceMonitor *)self _foundPowerSource:v16 desc:v14 adapterDesc:v56];
          }
        }
        else
        {
          int v20 = self->_ucat->var0;
          if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v49 = self->_powerSourcesUpdateIndex;
            v51 = v14;
            LogPrintF();
          }
        }
      }
      else
      {
        int v19 = self->_ucat->var0;
        if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v49 = self->_powerSourcesUpdateIndex;
          v51 = (void *)v12;
          LogPrintF();
        }
      }

      ++v12;
    }
    while (a5 != v12);
  }
  v21 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v22 = self;
  id obj = [(NSMutableDictionary *)self->_powerSources allValues];
  uint64_t v61 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v69;
    v58 = v21;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v69 != v60) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v68 + 1) + 8 * v23);
        long long v25 = objc_msgSend(v24, "groupID", v49, v51, v53, v54, v55);
        if ([v25 length])
        {
          if ([v21 containsObject:v25])
          {
            int v26 = v22->_ucat->var0;
            if (v26 <= 10 && (v26 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v49 = v22->_powerSourcesUpdateIndex;
              v51 = v24;
              LogPrintF();
            }
            id v32 = 0;
            goto LABEL_76;
          }
          v28 = [(NSMutableDictionary *)v22->_powerSources allValues];
          uint64_t v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"groupID == %@", v25];
          v27 = [v28 filteredArrayUsingPredicate:v29];

          [v21 addObject:v25];
        }
        else
        {
          v74 = v24;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
        }
        int v30 = v22->_ucat->var0;
        if (v30 <= 10 && (v30 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v31 = v22->_powerSourcesUpdateIndex;
          v53 = [v24 accessoryCategory];
          uint64_t v54 = [v27 count];
          uint64_t v49 = v31;
          v51 = v25;
          LogPrintF();
        }
        v62 = v25;
        uint64_t v63 = v23;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v32 = v27;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          LODWORD(v35) = 0;
          uint64_t v36 = *(void *)v65;
          int v37 = 1;
          int v38 = 1;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v65 != v36) {
                objc_enumerationMutation(v32);
              }
              v40 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              int v41 = objc_msgSend(v40, "present", v49) ^ 1;
              int v42 = [v40 added];
              v38 &= v41;
              v37 &= v42;
              unsigned int v43 = [v40 changes] | v35;
              if (v41 | v42) {
                uint64_t v35 = v43 | 0x200;
              }
              else {
                uint64_t v35 = v43;
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v73 count:16];
          }
          while (v34);
        }
        else
        {
          uint64_t v35 = 0;
          int v37 = 1;
          int v38 = 1;
        }

        v22 = v59;
        int v44 = v59->_ucat->var0;
        if (v44 <= 10 && (v44 != -1 || _LogCategory_Initialize()))
        {
          v45 = "no";
          if (v38) {
            v46 = "yes";
          }
          else {
            v46 = "no";
          }
          if (v37) {
            v45 = "yes";
          }
          uint64_t v54 = v35;
          v55 = &unk_1A56EA480;
          v51 = (void *)v46;
          v53 = (void *)v45;
          uint64_t v49 = v59->_powerSourcesUpdateIndex;
          LogPrintF();
        }
        if (v38)
        {
          [(SFPowerSourceMonitor *)v59 _handlePowerSourcesLost:v32];
        }
        else if (v37)
        {
          [(SFPowerSourceMonitor *)v59 _handlePowerSourcesFound:v32];
        }
        else if (v35)
        {
          [(SFPowerSourceMonitor *)v59 _handlePowerSourcesChanged:v32 changes:v35];
        }
        v21 = v58;
        long long v25 = v62;
        uint64_t v23 = v63;
LABEL_76:

        ++v23;
      }
      while (v23 != v61);
      uint64_t v47 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
      uint64_t v61 = v47;
    }
    while (v47);
  }
}

- (void)_updatePowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v19 = a3;
  id v8 = a5;
  uint64_t v9 = [v19 updateWithPowerSourceDescription:a4];
  int var0 = self->_ucat->var0;
  if (var0 <= 10)
  {
    id v11 = v19;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_5;
      }
      id v11 = v19;
    }
    uint64_t v17 = v9;
    uint64_t v18 = &unk_1A56EA480;
    uint64_t powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
    id v16 = v11;
    LogPrintF();
  }
LABEL_5:
  if ((objc_msgSend(v19, "isInternal", powerSourcesUpdateIndex, v16, v17, v18) & 1) != 0
    || ([v19 groupID],
        CFIndex v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
        v12 == @"Internal")
    || (CFArrayRef v13 = v12) != 0
    && (int v14 = [(__CFString *)v12 isEqual:@"Internal"], v13, v13, v14))
  {
    uint64_t v9 = [v19 updateWithPowerAdapterDetails:v8] | v9;
  }
  [v19 setChanges:v9];
}

void __73__SFPowerSourceMonitor__updatePowerSourcesWithInfo_sources_sourcesCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = **(_DWORD **)(v6 + 8);
  if (v7 <= 10)
  {
    if (v7 != -1)
    {
LABEL_3:
      uint64_t v8 = *(unsigned __int16 *)(v6 + 32);
      id v9 = v5;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v6 = *(void *)(a1 + 32);
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v5, "setAdded:", 0, v8, v9);
  [v5 setPresent:0];
  [v5 setChanges:0];
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_4(uint64_t a1)
{
  int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  kdebug_trace();
  v3 = *(void **)(a1 + 32);

  return [v3 _triggerUpdatePowerSources];
}

- (SFPowerSourceMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFPowerSourceMonitor;
  int v2 = [(SFPowerSourceMonitor *)&v8 init];
  if (v2)
  {
    ASPrintF();
    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    v2->_changeFlags = 5;
    uint64_t v3 = SFMainQueue(0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    *(void *)&v2->_psNotifyTokenAccessoryAttach = -1;
    *(void *)&v2->_psNotifyTokenAccessoryTimeRemaining = -1;
    uint64_t v5 = objc_opt_new();
    powerSources = v2->_powerSources;
    v2->_powerSources = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(SFPowerSourceMonitor *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)SFPowerSourceMonitor;
  [(SFPowerSourceMonitor *)&v3 dealloc];
}

- (void)_cleanup
{
  [(CUCoalescer *)self->_updateCoalescer invalidate];
  updateCoalescer = self->_updateCoalescer;
  self->_updateCoalescer = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id powerSourcesFoundHandler = self->_powerSourcesFoundHandler;
  self->_id powerSourcesFoundHandler = 0;

  id powerSourcesLostHandler = self->_powerSourcesLostHandler;
  self->_id powerSourcesLostHandler = 0;

  id powerSourcesChangedHandler = self->_powerSourcesChangedHandler;
  self->_id powerSourcesChangedHandler = 0;

  [(NSMutableDictionary *)self->_powerSources removeAllObjects];
  powerSources = self->_powerSources;
  self->_powerSources = 0;

  int psNotifyTokenAccessoryAttach = self->_psNotifyTokenAccessoryAttach;
  if (psNotifyTokenAccessoryAttach != -1)
  {
    notify_cancel(psNotifyTokenAccessoryAttach);
    self->_int psNotifyTokenAccessoryAttach = -1;
  }
  int psNotifyTokenAccessoryPowerSource = self->_psNotifyTokenAccessoryPowerSource;
  if (psNotifyTokenAccessoryPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAccessoryPowerSource);
    self->_int psNotifyTokenAccessoryPowerSource = -1;
  }
  int psNotifyTokenAccessoryTimeRemaining = self->_psNotifyTokenAccessoryTimeRemaining;
  if (psNotifyTokenAccessoryTimeRemaining != -1)
  {
    notify_cancel(psNotifyTokenAccessoryTimeRemaining);
    self->_int psNotifyTokenAccessoryTimeRemaining = -1;
  }
  int psNotifyTokenAnyPowerSource = self->_psNotifyTokenAnyPowerSource;
  if (psNotifyTokenAnyPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAnyPowerSource);
    self->_int psNotifyTokenAnyPowerSource = -1;
  }
  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
}

- (void)setChangeFlags:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__SFPowerSourceMonitor_setChangeFlags___block_invoke;
    v6[3] = &unk_1E5BBEE88;
    unsigned int v7 = a3;
    v6[4] = v4;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_changeFlags = a3;
  }
  objc_sync_exit(v4);
}

uint64_t __39__SFPowerSourceMonitor_setChangeFlags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 76))
  {
    *(_DWORD *)(v2 + 76) = v1;
    return [*(id *)(result + 32) _update];
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SFPowerSourceMonitor_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __47__SFPowerSourceMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  [v2 _update];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 _triggerUpdatePowerSources];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFPowerSourceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFPowerSourceMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 8);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v5 = *(void *)(v2 + 88);
  if (v5)
  {
    (*(void (**)(void))(v5 + 16))(*(void *)(v2 + 88));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  return [(id)v2 _cleanup];
}

- (void)_update
{
  if (self->_psNotifyTokenAccessoryAttach == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __31__SFPowerSourceMonitor__update__block_invoke;
    handler[3] = &unk_1E5BBE120;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.attach", &self->_psNotifyTokenAccessoryAttach, dispatchQueue, handler);
  }
  if (self->_psNotifyTokenAccessoryPowerSource == -1)
  {
    int v4 = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__SFPowerSourceMonitor__update__block_invoke_2;
    v9[3] = &unk_1E5BBE120;
    void v9[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.source", &self->_psNotifyTokenAccessoryPowerSource, v4, v9);
  }
  if (self->_psNotifyTokenAccessoryTimeRemaining == -1)
  {
    uint64_t v5 = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__SFPowerSourceMonitor__update__block_invoke_3;
    v8[3] = &unk_1E5BBE120;
    v8[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_psNotifyTokenAccessoryTimeRemaining, v5, v8);
  }
  if (self->_psNotifyTokenAnyPowerSource == -1)
  {
    uint64_t v6 = self->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__SFPowerSourceMonitor__update__block_invoke_4;
    v7[3] = &unk_1E5BBE120;
    v7[4] = self;
    notify_register_dispatch("com.apple.system.powersources", &self->_psNotifyTokenAnyPowerSource, v6, v7);
  }
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke(uint64_t a1)
{
  int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  kdebug_trace();
  int v3 = *(void **)(a1 + 32);

  return [v3 _triggerUpdatePowerSources];
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_2(uint64_t a1)
{
  int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  kdebug_trace();
  int v3 = *(void **)(a1 + 32);

  return [v3 _triggerUpdatePowerSources];
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_3(uint64_t a1)
{
  int v2 = **(_DWORD **)(*(void *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  kdebug_trace();
  int v3 = *(void **)(a1 + 32);

  return [v3 _triggerUpdatePowerSources];
}

void __50__SFPowerSourceMonitor__triggerUpdatePowerSources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePowerSources];
}

- (void)_updatePowerSources
{
  CFTypeRef cf = 0;
  CFTypeRef v5 = 0;
  uint64_t v3 = 0;
  if ([(SFPowerSourceMonitor *)self powerSourcesListWithOutInfo:&v5 outSources:&cf outSourcesCount:&v3])
  {
    [(SFPowerSourceMonitor *)self _updatePowerSourcesWithInfo:v5 sources:cf sourcesCount:v3];
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (v5) {
      CFRelease(v5);
    }
  }
}

- (void)_foundPowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v18 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(SFPowerSource);
  -[SFPowerSource setSourceID:](v10, "setSourceID:", [v18 integerValue]);
  [(SFPowerSource *)v10 updateWithPowerSourceDescription:v9];

  [(SFPowerSource *)v10 setAdded:1];
  if (![(SFPowerSource *)v10 isInternal])
  {
    id v11 = [(SFPowerSource *)v10 accessoryCategory];
    CFIndex v12 = v11;
    if (v11 == @"Battery Case"
      || v11 && (int v13 = [(__CFString *)v11 isEqual:@"Battery Case"], v12, v13))
    {
      int v14 = [(SFPowerSource *)v10 transportType];
      if (v14 == @"AID")
      {

LABEL_12:
        [(SFPowerSource *)v10 setGroupID:@"Internal"];
        goto LABEL_13;
      }
      int v15 = v14;
      if (v14)
      {
        char v16 = [(__CFString *)v14 isEqual:@"AID"];

        if ((v16 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }

    goto LABEL_13;
  }
  [(SFPowerSource *)v10 setGroupID:@"Internal"];
  [(SFPowerSource *)v10 updateWithPowerAdapterDetails:v8];
LABEL_13:
  [(NSMutableDictionary *)self->_powerSources setObject:v10 forKeyedSubscript:v18];
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_handlePowerSourcesFound:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 10)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      LogPrintF();
      id v4 = v8;
    }
  }
  id powerSourcesFoundHandler = (void (**)(id, void))self->_powerSourcesFoundHandler;
  if (powerSourcesFoundHandler)
  {
    ((void (**)(id, id))powerSourcesFoundHandler)[2](powerSourcesFoundHandler, v8);
    id v4 = v8;
  }
}

- (void)_handlePowerSourcesLost:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v10 = v4;
  if (var0 <= 10)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v10, v6))
    {
      uint64_t powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
      id v9 = v4;
      LogPrintF();
      id v4 = v10;
    }
  }
  -[SFPowerSourceMonitor _removePowerSources:](self, "_removePowerSources:", v4, powerSourcesUpdateIndex, v9);
  id powerSourcesLostHandler = (void (**)(id, id))self->_powerSourcesLostHandler;
  if (powerSourcesLostHandler) {
    powerSourcesLostHandler[2](powerSourcesLostHandler, v10);
  }
}

- (void)_removePowerSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_powerSources allKeysForObject:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [(NSMutableDictionary *)self->_powerSources removeObjectsForKeys:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)skipCoalescing
{
  return self->_skipCoalescing;
}

- (void)setSkipCoalescing:(BOOL)a3
{
  self->_skipCoalescing = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)powerSourcesFoundHandler
{
  return self->_powerSourcesFoundHandler;
}

- (void)setPowerSourcesFoundHandler:(id)a3
{
}

- (id)powerSourcesLostHandler
{
  return self->_powerSourcesLostHandler;
}

- (void)setPowerSourcesLostHandler:(id)a3
{
}

- (id)powerSourcesChangedHandler
{
  return self->_powerSourcesChangedHandler;
}

- (void)setPowerSourcesChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_powerSourcesChangedHandler, 0);
  objc_storeStrong(&self->_powerSourcesLostHandler, 0);
  objc_storeStrong(&self->_powerSourcesFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_powerSources, 0);

  objc_storeStrong((id *)&self->_updateCoalescer, 0);
}

@end