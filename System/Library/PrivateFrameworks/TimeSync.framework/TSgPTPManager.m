@interface TSgPTPManager
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)diagnosticInfo;
+ (id)gPTPManager;
+ (id)keyPathsForValuesAffectingAirPlayPTPInstanceClockIdentifier;
+ (id)keyPathsForValuesAffectingAvbPTPInstance0ClockIdentifier;
+ (id)keyPathsForValuesAffectingAvbPTPInstance1ClockIdentifier;
+ (id)keyPathsForValuesAffectingAvbPTPInstance2ClockIdentifier;
+ (id)keyPathsForValuesAffectingAvbPTPInstance3ClockIdentifier;
+ (id)keyPathsForValuesAffectingCopresencePTPInstanceClockIdentifier;
+ (id)keyPathsForValuesAffectingSystemDomain;
+ (id)keyPathsForValuesAffectingSystemDomainClockIdentifier;
+ (id)sharedgPTPManager;
+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3;
+ (void)notifyWhengPTPManagerIsAvailable:(id)a3;
+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3;
- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3;
- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3;
- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (TSgPTPClock)systemDomain;
- (TSgPTPManager)init;
- (unint64_t)airPlayPTPInstanceClockIdentifier;
- (unint64_t)avbPTPInstance0ClockIdentifier;
- (unint64_t)avbPTPInstance1ClockIdentifier;
- (unint64_t)avbPTPInstance2ClockIdentifier;
- (unint64_t)avbPTPInstance3ClockIdentifier;
- (unint64_t)copresencePTPInstanceClockIdentifier;
- (unint64_t)systemDomainClockIdentifier;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)interruptedgPTPManager;
- (void)removeClient:(id)a3;
@end

@implementation TSgPTPManager

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
}

+ (id)sharedgPTPManager
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  v3 = (void *)_sharedgPTPManager;
  if (!_sharedgPTPManager)
  {
    v4 = +[TSClockManager sharedClockManager];
    [v4 addgPTPServicesWithError:0];
    uint64_t v5 = [a1 gPTPManager];
    v6 = (void *)_sharedgPTPManager;
    _sharedgPTPManager = v5;

    v3 = (void *)_sharedgPTPManager;
  }
  id v7 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  return v7;
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__TSgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E622A8F8;
  v6 = v5;
  v12 = v6;
  [a1 notifyWhengPTPManagerIsAvailable:v11];
  dispatch_time_t v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    v8 = [a1 sharedgPTPManager];
  }

  return v8;
}

intptr_t __50__TSgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)gPTPManager
{
  v2 = objc_alloc_init(TSgPTPManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSgPTPManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSgPTPManager)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)TSgPTPManager;
  v2 = [(TSgPTPManager *)&v12 init];
  unsigned int v3 = v2;
  if (v2)
  {
    v2->_clientLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    clients = v3->_clients;
    v3->_clients = (NSPointerArray *)v4;

    v6 = objc_alloc_init(_TSF_TSDgPTPManager);
    impl = v3->_impl;
    v3->_impl = v6;

    if (v3->_impl)
    {
      v8 = +[TSClockManager sharedClockManager];
      [v8 addgPTPServicesWithError:0];

      dispatch_queue_t v9 = dispatch_queue_create("com.apple.TimeSync.TSgPTPManager.systemDomain", 0);
      systemDomainQueue = v3->_systemDomainQueue;
      v3->_systemDomainQueue = (OS_dispatch_queue *)v9;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v14 = "_impl!= nil";
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2080;
        v20 = "";
        __int16 v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPManager.m";
        __int16 v23 = 1024;
        int v24 = 132;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      systemDomainQueue = v3;
      unsigned int v3 = 0;
    }
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingSystemDomain
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.systemDomainClockIdentifier", 0);
}

- (TSgPTPClock)systemDomain
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__TSgPTPManager_systemDomain__block_invoke;
  v5[3] = &unk_1E622A920;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(systemDomainQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSgPTPClock *)v3;
}

void __29__TSgPTPManager_systemDomain__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = -[TSKernelClock initWithClockIdentifier:]([TSgPTPClock alloc], "initWithClockIdentifier:", [*(id *)(a1 + 32) systemDomainClockIdentifier]);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_semaphore_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

+ (id)keyPathsForValuesAffectingSystemDomainClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.systemDomainClockIdentifier", 0);
}

- (unint64_t)systemDomainClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl systemDomainClockIdentifier];
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl addPTPInstance:a3 error:a4];
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl addTimeOfDayPTPInstance:a3 error:a4];
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl removePTPInstanceWithIdentifier:a3 error:a4];
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPManager *)self->_impl addAVBPTPInstanceIndex:a3 identifier:a4 error:a5];
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl removeAVBPTPInstanceWithIndex:a3 error:a4];
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance0ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.avbPTPInstance0ClockIdentifier", 0);
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl avbPTPInstance0ClockIdentifier];
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance1ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.avbPTPInstance1ClockIdentifier", 0);
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl avbPTPInstance1ClockIdentifier];
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance2ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.avbPTPInstance2ClockIdentifier", 0);
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl avbPTPInstance2ClockIdentifier];
}

+ (id)keyPathsForValuesAffectingAvbPTPInstance3ClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.avbPTPInstance3ClockIdentifier", 0);
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl avbPTPInstance3ClockIdentifier];
}

+ (id)keyPathsForValuesAffectingAirPlayPTPInstanceClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.airPlayPTPInstanceClockIdentifier", 0);
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl airPlayPTPInstanceClockIdentifier];
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl addAirPlayPTPInstance:a3 error:a4];
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
{
  return [(_TSF_TSDgPTPManager *)self->_impl removeAirPlayPTPInstanceWithError:a3];
}

+ (id)keyPathsForValuesAffectingCopresencePTPInstanceClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.copresencePTPInstanceClockIdentifier", 0);
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  return [(_TSF_TSDgPTPManager *)self->_impl copresencePTPInstanceClockIdentifier];
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPManager *)self->_impl addCopresencePTPInstance:a3 error:a4];
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  return [(_TSF_TSDgPTPManager *)self->_impl removeCopresencePTPInstanceWithError:a3];
}

- (void)dealloc
{
  id v3 = +[TSClockManager sharedClockManager];
  [v3 removegPTPServicesWithError:0];

  v4.receiver = self;
  v4.super_class = (Class)TSgPTPManager;
  [(TSgPTPManager *)&v4 dealloc];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"ClassName"];
  [v7 appendFormat:@"%@+%@\n", v6, v8];

  [v7 appendFormat:@"%@    System PTP Instance Identifier: ", v6];
  dispatch_queue_t v9 = [v5 objectForKeyedSubscript:@"SystemDomainIdentifier"];
  v10 = v9;
  if (v9) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v9, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    AVB 0 PTP Instance Identifier: ", v6];
  id v11 = [v5 objectForKeyedSubscript:@"AVB0ClockID"];

  if (v11) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v11, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    AVB 1 PTP Instance Identifier: ", v6];
  objc_super v12 = [v5 objectForKeyedSubscript:@"AVB1ClockID"];

  if (v12) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v12, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    AVB 2 PTP Instance Identifier: ", v6];
  v13 = [v5 objectForKeyedSubscript:@"AVB2ClockID"];

  if (v13) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v13, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    AVB 3 PTP Instance Identifier: ", v6];
  v14 = [v5 objectForKeyedSubscript:@"AVB3ClockID"];

  if (v14) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v14, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    AirPlay PTP Instance Identifier: ", v6];
  __int16 v15 = [v5 objectForKeyedSubscript:@"AirPlayClockID"];

  if (v15) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v15, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    Copresence PTP Instance Identifier: ", v6];
  uint64_t v16 = [v5 objectForKeyedSubscript:@"CopresenceClockID"];

  uint64_t v25 = v16;
  if (v16) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v16, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  __int16 v17 = [v6 stringByAppendingString:@"        |"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = [v5 objectForKeyedSubscript:@"PTPInstances"];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = +[TSgPTPClock diagnosticDescriptionForInfo:*(void *)(*((void *)&v26 + 1) + 8 * i) withIndent:v17];
        [v7 appendString:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  return v7;
}

+ (id)diagnosticInfo
{
  return +[_TSF_TSDgPTPManager diagnosticInfo];
}

- (void)addClient:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)removeClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v8 + v10, (void)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)interruptedgPTPManager
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v9 interruptedConnectionForgPTPManager:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
  uint64_t v10 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__TSgPTPManager_interruptedgPTPManager__block_invoke;
  block[3] = &unk_1E622A8F8;
  block[4] = self;
  dispatch_async(v10, block);
}

void __39__TSgPTPManager_interruptedgPTPManager__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedgPTPManagerLock);
  id v3 = *(void **)(a1 + 32);
  if (v3 == (void *)_sharedgPTPManager)
  {
    _sharedgPTPManager = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedgPTPManagerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
}

@end