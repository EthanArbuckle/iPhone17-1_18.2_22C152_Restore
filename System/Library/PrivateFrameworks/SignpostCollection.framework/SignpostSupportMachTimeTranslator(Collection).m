@interface SignpostSupportMachTimeTranslator(Collection)
+ (id)_globalNotificationDispatchQueue;
+ (id)_timeTranslationLog;
+ (void)_addListeningTimeTranslator:()Collection;
+ (void)_processPowerNotificationOfType:()Collection withNotificationID:;
+ (void)_removeListeningTimeTranslator:()Collection;
+ (void)_snapshotMachTimesForAllListeners;
- (uint64_t)_grabMachTimesSnapshot;
- (uint64_t)dataRepresentationDuringMonitoring;
- (uint64_t)startMonitoringSleepWake;
- (uint64_t)stopMonitoringSleepWake;
- (void)initWithMaxEntries:()Collection;
@end

@implementation SignpostSupportMachTimeTranslator(Collection)

+ (id)_globalNotificationDispatchQueue
{
  if (_globalNotificationDispatchQueue_onceToken != -1) {
    dispatch_once(&_globalNotificationDispatchQueue_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)_globalNotificationDispatchQueue_notificationQueue;
  return v0;
}

+ (id)_timeTranslationLog
{
  if (_timeTranslationLog_onceToken != -1) {
    dispatch_once(&_timeTranslationLog_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)_timeTranslationLog_timeTranslationLog;
  return v0;
}

+ (void)_addListeningTimeTranslator:()Collection
{
  id v4 = a3;
  v5 = [a1 _globalNotificationDispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__SignpostSupportMachTimeTranslator_Collection___addListeningTimeTranslator___block_invoke;
  v7[3] = &unk_264488190;
  id v8 = v4;
  v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)_removeListeningTimeTranslator:()Collection
{
  id v4 = a3;
  v5 = [a1 _globalNotificationDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__SignpostSupportMachTimeTranslator_Collection___removeListeningTimeTranslator___block_invoke;
  block[3] = &unk_2644881B8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  id v6 = result;
  switch((v4 >> 4))
  {
    case 0u:
      v7 = [result _timeTranslationLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DE73000, v7, OS_LOG_TYPE_DEFAULT, "Got system can sleep notification", buf, 2u);
      }

      return (void *)IOAllowPowerChange(gRootDomainConnect, a4);
    case 1u:
      id v8 = [result _timeTranslationLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21DE73000, v8, OS_LOG_TYPE_DEFAULT, "Got system will sleep notification", v10, 2u);
      }

      IOAllowPowerChange(gRootDomainConnect, a4);
      goto LABEL_13;
    case 2u:
      v9 = [MEMORY[0x263F6C598] _timeTranslationLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[SignpostSupportMachTimeTranslator(Collection) _processPowerNotificationOfType:withNotificationID:](v9);
      }
      goto LABEL_12;
    case 9u:
      v9 = [MEMORY[0x263F6C598] _timeTranslationLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[SignpostSupportMachTimeTranslator(Collection) _processPowerNotificationOfType:withNotificationID:](v9);
      }
LABEL_12:

LABEL_13:
      result = (void *)[v6 _snapshotMachTimesForAllListeners];
      break;
    default:
      return result;
  }
  return result;
}

+ (void)_snapshotMachTimesForAllListeners
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  mach_get_times();
  v2 = [a1 _timeTranslationLog];
  if (os_signpost_enabled(v2))
  {
    *(_DWORD *)buf = 134349312;
    uint64_t v16 = v13;
    __int16 v17 = 2050;
    uint64_t v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_21DE73000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MachTimesSnapshot", "mach_absolute_time=%{signpost.description:attribute,public}llu mach_continuous_time=%{signpost.description:attribute,public}llu", buf, 0x16u);
  }

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)gListeningTimeTranslators;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "addTimestampPairWithMachAbsoluteTime:machContinuousTime:", v13, v12, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)initWithMaxEntries:()Collection
{
  uint64_t v4 = (void *)[a1 init];
  uint64_t v5 = v4;
  if (v4) {
    [v4 setMaxEntries:a3];
  }
  return v5;
}

- (uint64_t)_grabMachTimesSnapshot
{
  return [a1 addTimestampPairWithMachAbsoluteTime:0 machContinuousTime:0];
}

- (uint64_t)startMonitoringSleepWake
{
  uint64_t result = [a1 isMonitoringSleepWake];
  if ((result & 1) == 0)
  {
    [a1 setIsMonitoringSleepWake:1];
    [a1 _grabMachTimesSnapshot];
    id v3 = objc_opt_class();
    return [v3 _addListeningTimeTranslator:a1];
  }
  return result;
}

- (uint64_t)stopMonitoringSleepWake
{
  uint64_t result = [a1 isMonitoringSleepWake];
  if (result)
  {
    [(id)objc_opt_class() _removeListeningTimeTranslator:a1];
    [a1 _grabMachTimesSnapshot];
    return [a1 setIsMonitoringSleepWake:0];
  }
  return result;
}

- (uint64_t)dataRepresentationDuringMonitoring
{
  [a1 _grabMachTimesSnapshot];
  return [a1 dataRepresentation];
}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21DE73000, log, OS_LOG_TYPE_DEBUG, "Got sleep cancel/wake notification", v1, 2u);
}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21DE73000, log, OS_LOG_TYPE_DEBUG, "Got system wake notification", v1, 2u);
}

@end