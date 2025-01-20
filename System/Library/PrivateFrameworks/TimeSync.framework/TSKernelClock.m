@interface TSKernelClock
+ (id)availableKernelClockIdentifiers;
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)keyPathsForValuesAffectingClockName;
+ (id)keyPathsForValuesAffectingHostRateRatio;
+ (id)keyPathsforvaluesaffectingLockState;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)updateCoreAudioReanchors:(unsigned int)a3;
- (TSKernelClock)initWithClockIdentifier:(unint64_t)a3;
- (TSKernelClock)initWithImplDC:(id)a3;
- (double)hostRateRatio;
- (id)clockName;
- (id)interruptionHandler;
- (int)lockState;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unsigned)getCoreAudioReanchors;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)didBeginClockGrandmasterChange;
- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4;
- (void)didChangeClockMaster;
- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4;
- (void)didChangeLockStateTo:(int)a3;
- (void)didEndClockGrandmasterChange;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4;
- (void)didProcessSync;
- (void)didResetClock;
- (void)interruptedConnection;
- (void)removeClient:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setPropertyUpdateQueue:(id)a3;
@end

@implementation TSKernelClock

+ (id)availableKernelClockIdentifiers
{
  return +[_TSF_TSDKernelClock availableKernelClockIdentifiers];
}

- (TSKernelClock)initWithImplDC:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "kernelClock != nil";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = "";
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSKernelClock.m";
      __int16 v25 = 1024;
      int v26 = 71;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
    goto LABEL_4;
  }
  v14.receiver = self;
  v14.super_class = (Class)TSKernelClock;
  v7 = -[TSClock initWithClockIdentifier:](&v14, sel_initWithClockIdentifier_, [v5 clockIdentifier]);
  v8 = v7;
  if (v7)
  {
    p_impl = (id *)&v7->_impl;
    objc_storeStrong((id *)&v7->_impl, a3);
    v13.receiver = v8;
    v13.super_class = (Class)TSKernelClock;
    v10 = [(TSClock *)&v13 propertyUpdateQueue];
    [*p_impl setPropertyUpdateQueue:v10];

    [*p_impl setClient:v8];
    v8->_clientLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    self = (TSKernelClock *)v8->_clients;
    v8->_clients = (NSPointerArray *)v11;
LABEL_4:
  }
  return v8;
}

- (TSKernelClock)initWithClockIdentifier:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = +[TSDCKernelClock clockWithIdentifier:a3];
  if (v4)
  {
    id v5 = [(TSKernelClock *)self initWithImplDC:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316418;
      v8 = "kernelClock";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2080;
      objc_super v14 = "";
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSKernelClock.m";
      __int16 v17 = 1024;
      int v18 = 92;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(TSDCKernelClock *)self->_impl setClient:0];
  v3.receiver = self;
  v3.super_class = (Class)TSKernelClock;
  [(TSKernelClock *)&v3 dealloc];
}

- (void)setPropertyUpdateQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKernelClock;
  [(TSClock *)&v6 setPropertyUpdateQueue:a3];
  v5.receiver = self;
  v5.super_class = (Class)TSKernelClock;
  v4 = [(TSClock *)&v5 propertyUpdateQueue];
  [(TSDCKernelClock *)self->_impl setPropertyUpdateQueue:v4];
}

+ (id)keyPathsforvaluesaffectingLockState
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.lockState", 0);
}

- (int)lockState
{
  return [(TSDCKernelClock *)self->_impl lockState];
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromMachAbsoluteToDomainTime:a3];
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainToMachAbsoluteTime:a3];
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCKernelClock *)self->_impl convertFromMachAbsoluteTime:a3 toDomainTime:a4 withCount:*(void *)&a5];
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainTime:a3 toMachAbsoluteTime:a4 withCount:*(void *)&a5];
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromMachAbsoluteIntervalToDomainInterval:a3];
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainIntervalToMachAbsoluteInterval:a3];
}

+ (id)keyPathsForValuesAffectingHostRateRatio
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hostRateRatio", 0);
}

- (double)hostRateRatio
{
  [(TSDCKernelClock *)self->_impl hostRateRatio];
  return result;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSDCKernelClock *)self->_impl getMachAbsoluteRateRatioNumerator:a3 denominator:a4 machAnchor:a5 andDomainAnchor:a6 withError:a7];
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromTimeSyncToDomainTime:a3];
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainToTimeSyncTime:a3];
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCKernelClock *)self->_impl convertFromTimeSyncTime:a3 toDomainTime:a4 withCount:*(void *)&a5];
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainTime:a3 toTimeSyncTime:a4 withCount:*(void *)&a5];
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromTimeSyncTimeIntervalToDomainInterval:a3];
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return [(TSDCKernelClock *)self->_impl convertFromDomainIntervalToTimeSyncTimeInterval:a3];
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSDCKernelClock *)self->_impl getTimeSyncTimeRateRatioNumerator:a3 denominator:a4 timeSyncAnchor:a5 andDomainAnchor:a6 withError:a7];
}

- (BOOL)updateCoreAudioReanchors:(unsigned int)a3
{
  return 1;
}

- (unsigned)getCoreAudioReanchors
{
  return [(TSDCKernelClock *)self->_impl getCoreAudioReanchors];
}

- (void)addClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TSKernelClock;
  [(TSClock *)&v14 addClient:v4];
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v13 + 1) + 8 * v10) == v4)
        {

          [(NSPointerArray *)self->_clients removePointerAtIndex:v8 + v10];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientLock);
  v12.receiver = self;
  v12.super_class = (Class)TSKernelClock;
  [(TSClock *)&v12 removeClient:v4];
}

+ (id)keyPathsForValuesAffectingClockName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockName", 0);
}

- (id)clockName
{
  return [(TSDCKernelClock *)self->_impl clockName];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"ClassName"];
  [v7 appendFormat:@"%@+%@\n", v6, v8];

  [v7 appendFormat:@"%@    Clock Identifier: ", v6];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"ClockIdentifier"];
  uint64_t v10 = v9;
  if (v9) {
    objc_msgSend(v7, "appendFormat:", @"0x%016llx\n", objc_msgSend(v9, "unsignedLongLongValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    Lock State: ", v6];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"ClockLockState"];

  if (!v11)
  {
    long long v13 = @" Could not read property\n";
    goto LABEL_12;
  }
  int v12 = [v11 intValue];
  switch(v12)
  {
    case 2:
      long long v13 = @"Locked\n";
      goto LABEL_12;
    case 1:
      long long v13 = @"Locking\n";
      goto LABEL_12;
    case 0:
      long long v13 = @"Not Locking\n";
LABEL_12:
      [v7 appendString:v13];
      goto LABEL_13;
  }
  objc_msgSend(v7, "appendFormat:", @"Unknown (%d)\n", objc_msgSend(v11, "intValue"));
LABEL_13:

  return v7;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[_TSF_TSDKernelClock clockNameForClockIdentifier:a3];
}

- (void)didResetClock
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "didResetClock:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeClockMaster
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "didChangeClockMasterForClock:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeLockStateTo:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_clients;
  uint64_t v7 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "didChangeLockStateTo:forClock:", v3, self, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didBeginClockGrandmasterChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "didBeginClockGrandmasterChangeForClock:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 didBeginClockGrandmasterChangeWithGrandmasterID:a3 localPort:v4 forClock:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didEndClockGrandmasterChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "didEndClockGrandmasterChangeForClock:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 didEndClockGrandmasterChangeWithGrandmasterID:a3 localPort:v4 forClock:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didProcessSync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "didProcessSync:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 didChangeLocalPortWithGrandmasterID:a3 localPort:v4 forClock:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)interruptedConnection
{
  uint64_t v3 = [(TSKernelClock *)self interruptionHandler];

  if (v3)
  {
    uint64_t v4 = [(TSKernelClock *)self interruptionHandler];
    v4[2](v4, self);
  }
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end