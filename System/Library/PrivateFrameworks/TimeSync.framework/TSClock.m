@interface TSClock
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)updateCoreAudioReanchors:(unsigned int)a3;
- (NSMutableArray)clients;
- (NSString)clockName;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSClock)init;
- (TSClock)initWithClockIdentifier:(unint64_t)a3;
- (double)hostRateRatio;
- (int)lockState;
- (unint64_t)clockIdentifier;
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
- (void)removeClient:(id)a3;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setLockState:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
@end

@implementation TSClock

- (TSClock)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSClock init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSClock)initWithClockIdentifier:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TSClock;
  uint64_t v4 = [(TSClock *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_clockIdentifier = a3;
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    clients = v5->_clients;
    v5->_clients = (NSPointerArray *)v6;

    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v8 stringWithFormat:@"com.apple.TimeSync.%@.0x%016llx.notification", v10, a3];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    notificationsQueue = v5->_notificationsQueue;
    v5->_notificationsQueue = (OS_dispatch_queue *)v12;

    if (!v5->_notificationsQueue)
    {

      return 0;
    }
  }
  return v5;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -1;
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -1;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *a4 = 1;
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = -1;
  }
  if (a7)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TSErrorDomain" code:-536870201 userInfo:0];
  }
  return 0;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return -1;
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return 0;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return -1;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return -1;
}

- (BOOL)updateCoreAudioReanchors:(unsigned int)a3
{
  return 0;
}

- (unsigned)getCoreAudioReanchors
{
  return 0;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *a4 = 1;
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = -1;
  }
  if (a7)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TSErrorDomain" code:-536870201 userInfo:0];
  }
  return 0;
}

- (void)addClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(TSClock *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding Client %s to clock %s\n", buf, 0x16u);
  }
  v8 = [(TSClock *)self notificationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __21__TSClock_addClient___block_invoke;
  v10[3] = &unk_1E622AAB0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __21__TSClock_addClient___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(*(void *)(a1 + 32) + 8) compact];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(a1 + 40) == *(void *)(*((void *)&v8 + 1) + 8 * v7))
        {

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addPointer:", *(void *)(a1 + 40), (void)v8);
LABEL_11:
}

- (void)removeClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(TSClock *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removing Client %s from clock %s\n", buf, 0x16u);
  }
  long long v8 = [(TSClock *)self notificationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __24__TSClock_removeClient___block_invoke;
  v10[3] = &unk_1E622AAB0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __24__TSClock_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(*(void *)(a1 + 32) + 8) compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6 + v5;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(a1 + 40) == *(void *)(*((void *)&v10 + 1) + 8 * v8))
        {

          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removePointerAtIndex:", v6 + v8, (void)v10);
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (NSMutableArray)clients
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [(NSPointerArray *)self->_clients compact];
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
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * i)) {
          [v3 addObject:(void)v10];
        }
      }
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationsQueue;
}

- (double)hostRateRatio
{
  return 1.0;
}

- (NSString)clockName
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@ 0x%016llx", v5, -[TSClock clockIdentifier](self, "clockIdentifier")];

  return (NSString *)v6;
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 string];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"ClockName"];
  [v8 appendFormat:@"%@%@\n", v6, v9];

  [v8 appendFormat:@"%@    Clock Identifier: ", v6];
  long long v10 = [v7 objectForKeyedSubscript:@"ClockIdentifier"];

  if (v10) {
    objc_msgSend(v8, "appendFormat:", @"0x%016llx\n", objc_msgSend(v10, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }

  return v8;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"%@ 0x%016llx", v6, a3];

  return v7;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (int)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int)a3
{
  self->_lockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end