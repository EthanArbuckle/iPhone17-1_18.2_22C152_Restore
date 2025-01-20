@interface TSClockManager
+ (id)clockManager;
+ (id)diagnosticDescriptionForClockIdentifier:(unint64_t)a3 withIndent:(id)a4;
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)diagnosticInfo;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3;
+ (id)frameworkClassNameForDaemonClassName:(id)a3;
+ (id)keyPathsForValuesAffectingTimeSyncTimeClockIdentifier;
+ (id)keyPathsForValuesAffectingTimeSyncTimeIsMachAbsoluteTime;
+ (id)keyPathsForValuesAffectingTranslationClockIdentifier;
+ (id)sharedClockManager;
+ (id)sharedClockManagerSyncWithTimeout:(unint64_t)a3;
+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhenClockManagerIsAvailable:(id)a3;
+ (void)notifyWhenClockManagerIsUnavailable:(id)a3;
- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5;
- (BOOL)addTSNCaptureServicesWithError:(id *)a3;
- (BOOL)addgPTPServicesWithError:(id *)a3;
- (BOOL)getConnectionForClockWithClockIdentifier:(unint64_t)a3 daemonClockClassName:(id *)a4 endpoint:(id *)a5;
- (BOOL)getConnectionForPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4 daemonPortClassName:(id *)a5 endpoint:(id *)a6;
- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeTSNCaptureServicesWithError:(id *)a3;
- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removegPTPServicesWithError:(id *)a3;
- (BOOL)timeSyncTimeIsMachAbsoluteTime;
- (TSClock)timeSyncClock;
- (TSClock)translationClock;
- (TSClockManager)init;
- (id)availableClockIdentifiers;
- (id)clockWithClockIdentifier:(unint64_t)a3;
- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7;
- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3;
- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3;
- (unint64_t)timeSyncTimeClockIdentifier;
- (unint64_t)translationClockIdentifier;
- (void)addClient:(id)a3;
- (void)interruptedClockManager;
- (void)removeClient:(id)a3;
@end

@implementation TSClockManager

+ (id)frameworkClassNameForDaemonClassName:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"_TSF_TSD" withString:@"TS"];
  return v3;
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"ATSAC:%016llx", a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _sharedClockManagerLock = 0;
  }
}

+ (id)sharedClockManager
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedClockManagerLock);
  v3 = (void *)_sharedClockManager;
  if (!_sharedClockManager)
  {
    uint64_t v4 = [a1 clockManager];
    v5 = (void *)_sharedClockManager;
    _sharedClockManager = v4;

    v3 = (void *)_sharedClockManager;
  }
  id v6 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedClockManagerLock);
  return v6;
}

+ (id)sharedClockManagerSyncWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__TSClockManager_sharedClockManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E622AA18;
  id v6 = v5;
  v12 = v6;
  [a1 notifyWhenClockManagerIsAvailable:v11];
  dispatch_time_t v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to find clock manager within the timeout period.\n", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    v8 = [a1 sharedClockManager];
  }

  return v8;
}

intptr_t __52__TSClockManager_sharedClockManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)clockManager
{
  v2 = objc_alloc_init(TSClockManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSClockManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (TSClockManager)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)TSClockManager;
  v2 = [(TSClockManager *)&v19 init];
  unsigned int v3 = v2;
  if (!v2) {
    return 0;
  }
  v2->_clientLock._os_unfair_lock_opaque = 0;
  uint64_t v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  clients = v3->_clients;
  v3->_clients = (NSPointerArray *)v4;

  mach_timebase_info(&v3->_timebaseInfo);
  id v6 = objc_alloc_init(_TSF_TSDClockManager);
  impl = v3->_impl;
  v3->_impl = v6;

  if (v3->_impl)
  {
    v8 = [[_TSF_TSDKernelClock alloc] initWithClockIdentifier:[(_TSF_TSDClockManager *)v3->_impl translationClockIdentifier]];
    if (v8)
    {
      v9 = [[TSDCTranslationClock alloc] initWithClockIdentifier:[(_TSF_TSDClockManager *)v3->_impl translationClockIdentifier]];
      if (v9)
      {
        objc_storeStrong((id *)&v3->_translationClockDC, v9);
        v10 = [TSTranslationClock alloc];
        v11 = [(TSDCTranslationClock *)v9 translationClock];
        uint64_t v12 = [(TSTranslationClock *)v10 initWithTranslationClock:v11];
        translationClock = v3->_translationClock;
        v3->_translationClock = (TSClock *)v12;

        v14 = [[TSTimeSyncClock alloc] initWithClockIdentifier:[(_TSF_TSDClockManager *)v3->_impl timeSyncTimeClockIdentifier] translationClock:v3->_translationClock];
        timeSyncClock = v3->_timeSyncClock;
        v3->_timeSyncClock = &v14->super;
        v16 = v3;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v21 = "translationClockDC";
          __int16 v22 = 2048;
          uint64_t v23 = 0;
          __int16 v24 = 2048;
          uint64_t v25 = 0;
          __int16 v26 = 2080;
          v27 = "";
          __int16 v28 = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
          __int16 v30 = 1024;
          int v31 = 279;
          _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        }
        v16 = 0;
        timeSyncClock = v3;
      }

      unsigned int v3 = (TSClockManager *)v8;
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "kernelClock";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
      __int16 v30 = 1024;
      int v31 = 276;
      v18 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v21 = "_impl != nil";
    __int16 v22 = 2048;
    uint64_t v23 = 0;
    __int16 v24 = 2048;
    uint64_t v25 = 0;
    __int16 v26 = 2080;
    v27 = "";
    __int16 v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
    __int16 v30 = 1024;
    int v31 = 273;
    v18 = MEMORY[0x1E4F14500];
LABEL_14:
    _os_log_impl(&dword_1BA88B000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  v16 = 0;
LABEL_7:

  return v16;
}

+ (id)keyPathsForValuesAffectingTimeSyncTimeClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.timeSyncTimeClockIdentifier", 0);
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return [(_TSF_TSDClockManager *)self->_impl timeSyncTimeClockIdentifier];
}

+ (id)keyPathsForValuesAffectingTimeSyncTimeIsMachAbsoluteTime
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.timeSyncTimeIsMachAbsoluteTime", 0);
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return [(_TSF_TSDClockManager *)self->_impl timeSyncTimeIsMachAbsoluteTime];
}

+ (id)keyPathsForValuesAffectingTranslationClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.translationClockIdentifier", 0);
}

- (unint64_t)translationClockIdentifier
{
  return [(_TSF_TSDClockManager *)self->_impl translationClockIdentifier];
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  return [(_TSF_TSDClockManager *)self->_impl nextAvailableDynamicClockID:a3 error:a4];
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  return [(_TSF_TSDClockManager *)self->_impl releaseDynamicClockID:a3 error:a4];
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  return [(_TSF_TSDClockManager *)self->_impl addMappingFromClockID:a3 toCoreAudioClockDomain:a4 error:a5];
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  return [(_TSF_TSDClockManager *)self->_impl removeMappingFromClockIDToCoreAudioClockDomainForClockID:a3 error:a4];
}

- (BOOL)addgPTPServicesWithError:(id *)a3
{
  return [(_TSF_TSDClockManager *)self->_impl addgPTPServicesWithError:a3];
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  return [(_TSF_TSDClockManager *)self->_impl removegPTPServicesWithError:a3];
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
{
  return [(_TSF_TSDClockManager *)self->_impl addTSNCaptureServicesWithError:a3];
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  return [(_TSF_TSDClockManager *)self->_impl removeTSNCaptureServicesWithError:a3];
}

- (id)availableClockIdentifiers
{
  v2 = [(_TSF_TSDClockManager *)self->_impl availableClockIdentifiers];
  return v2;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  if ([(TSClockManager *)self timeSyncTimeClockIdentifier] == a3)
  {
    uint64_t v5 = [(TSClockManager *)self timeSyncClock];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_11;
  }
  if ([(TSClockManager *)self translationClockIdentifier] == a3)
  {
    uint64_t v5 = [(TSClockManager *)self translationClock];
    goto LABEL_5;
  }
  dispatch_time_t v7 = +[TSDCKernelClock clockWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = off_1E622A790;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v8 = off_1E622A700;
    if (isKindOfClass) {
      v8 = off_1E622A770;
    }
  }
  id v6 = (void *)[objc_alloc(*v8) initWithImplDC:v7];

LABEL_11:
  return v6;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  return [(_TSF_TSDClockManager *)self->_impl addUserFilteredClockWithMachInterval:a3 domainInterval:a4 usingFilterShift:a5 isAdaptive:a6 error:a7];
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return [(_TSF_TSDClockManager *)self->_impl removeUserFilteredClockWithIdentifier:a3 error:a4];
}

- (BOOL)getConnectionForClockWithClockIdentifier:(unint64_t)a3 daemonClockClassName:(id *)a4 endpoint:(id *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 0;
}

- (BOOL)getConnectionForPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4 daemonPortClassName:(id *)a5 endpoint:(id *)a6
{
  *a5 = 0;
  *a6 = 0;
  return 0;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer = self->_timebaseInfo.numer;
  if (numer != self->_timebaseInfo.denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, numer);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, denom);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = [MEMORY[0x1E4F28E78] string];
  v8 = [v5 objectForKeyedSubscript:@"ClassName"];
  [v7 appendFormat:@"%@+%@\n", v6, v8];

  [v7 appendFormat:@"%@    TimeSyncTime Clock Identifier: ", v6];
  v9 = [v5 objectForKeyedSubscript:@"TimeSyncTimeClockID"];
  v10 = v9;
  if (v9) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v9, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    TimeSyncTime CoreAudio Clock Domain: ", v6];
  v11 = [v5 objectForKeyedSubscript:@"TimeSyncTimeCoreAudioClockDomain"];

  if (v11) {
    objc_msgSend(v7, "appendFormat:", @"0x%08x\n", objc_msgSend(v11, "unsignedIntValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }

  return v7;
}

+ (id)diagnosticInfo
{
  v2 = +[_TSF_TSDClockManager diagnosticInfo];
  return v2;
}

+ (id)diagnosticDescriptionForClockIdentifier:(unint64_t)a3 withIndent:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  long long v7 = +[_TSF_TSDClockManager diagnosticInfoForClockIdentifier:a3 daemonClassName:&v13];
  id v8 = v13;
  v9 = [a1 frameworkClassNameForDaemonClassName:v8];
  v10 = v9;
  if (v9) {
    [NSClassFromString(v9) diagnosticDescriptionForInfo:v7 withIndent:v6];
  }
  else {
  v11 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Could not find class to describe service\n"];
  }

  return v11;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3
{
  unsigned int v3 = +[_TSF_TSDClockManager diagnosticInfoForClockIdentifier:a3 daemonClassName:0];
  return v3;
}

- (void)addClient:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v9 + 1) + 8 * v8) == v4)
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v9);
LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)removeClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v11 + 1) + 8 * v9) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v7 + v9, (void)v11);
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)interruptedClockManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v8 interruptedConnectionForClockManager:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_clientLock);
  uint64_t v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TSClockManager_interruptedClockManager__block_invoke;
  block[3] = &unk_1E622AA18;
  block[4] = self;
  dispatch_async(v9, block);
}

void __41__TSClockManager_interruptedClockManager__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedClockManagerLock);
  unsigned int v3 = *(void **)(a1 + 32);
  if (v3 == (void *)_sharedClockManager)
  {
    _sharedClockManager = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedClockManagerLock);
}

- (TSClock)timeSyncClock
{
  return self->_timeSyncClock;
}

- (TSClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_translationClockDC, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end