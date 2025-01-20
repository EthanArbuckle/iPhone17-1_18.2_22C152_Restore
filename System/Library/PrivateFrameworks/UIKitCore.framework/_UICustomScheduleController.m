@interface _UICustomScheduleController
- ($DF5A289EBC70615FF524364991CCA432)schedule;
- (BOOL)isInScheduleTime;
- (NSString)debugDescription;
- (_UICustomScheduleController)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)nextTransition:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_notifyChange;
- (void)_significantTimeChange;
- (void)_updateStatus:(BOOL)a3;
- (void)_updateTimeMonitoring;
- (void)_updateTimeMonitoring:(BOOL)a3;
- (void)_updateWithDate:(id)a3;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)dealloc;
- (void)forceUpdate;
- (void)removeObserver:(id)a3;
- (void)setSchedule:(id *)a3;
@end

@implementation _UICustomScheduleController

- (_UICustomScheduleController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UICustomScheduleController;
  v2 = [(_UICustomScheduleController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    $EDD60E64C3A297FC4B567F3E18015A01 v4 = *($EDD60E64C3A297FC4B567F3E18015A01 *)(MEMORY[0x1E4FB3548] + 16);
    v2->_schedule.beginTime = ($EDD60E64C3A297FC4B567F3E18015A01)*MEMORY[0x1E4FB3548];
    v2->_schedule.endTime = v4;
    v2->_inScheduleTime = 0;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel__significantTimeChange name:0x1ED15CFC0 object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(_UICustomScheduleController *)self _updateTimeMonitoring:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED15CFC0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UICustomScheduleController;
  [(_UICustomScheduleController *)&v4 dealloc];
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  observers = self->_observers;
  if (!observers)
  {
    v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = (void *)[v11 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMapTable *)self->_observers removeObjectForKey:v4];
}

- (void)setSchedule:(id *)a3
{
  $73C97F476492F8B290C244164FA2CF0D schedule = self->_schedule;
  $DF5A289EBC70615FF524364991CCA432 v7 = *a3;
  if ((UISUserInterfaceStyleModeSchedulesEqual() & 1) == 0)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
    self->_schedule.beginTime = ($EDD60E64C3A297FC4B567F3E18015A01)a3->var0;
    self->_schedule.endTime = ($EDD60E64C3A297FC4B567F3E18015A01)var1;
    [(_UICustomScheduleController *)self _updateTimeMonitoring];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [(_UICustomScheduleController *)self _updateWithDate:v6];
  }
}

- (BOOL)isInScheduleTime
{
  return self->_inScheduleTime;
}

- (void)forceUpdate
{
  v3 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "CustomScheduleController forcing update", v5, 2u);
  }

  [(_UICustomScheduleController *)self _updateTimeMonitoring];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(_UICustomScheduleController *)self _updateWithDate:v4];
}

- (id)nextTransition:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(UIUserInterfaceStyleArbiterTransition);
  [(UIUserInterfaceStyleArbiterTransition *)v5 setType:0];
  uint64_t v6 = 48;
  if (v3)
  {
    uint64_t v6 = 32;
    uint64_t v7 = 40;
  }
  else
  {
    uint64_t v7 = 56;
  }
  [(UIUserInterfaceStyleArbiterTransition *)v5 setHour:*(Class *)((char *)&self->super.isa + v6)];
  [(UIUserInterfaceStyleArbiterTransition *)v5 setMinute:*(Class *)((char *)&self->super.isa + v7)];
  return v5;
}

- (void)_notifyChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(NSMapTable *)self->_observers keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, _UICustomScheduleController *, uint64_t))v9)[2](v9, self, v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inScheduleTime = self->_inScheduleTime;
    v7[0] = 67109376;
    v7[1] = v3;
    __int16 v8 = 1024;
    BOOL v9 = inScheduleTime;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "CustomSchedule is in dark: %d from: %d", (uint8_t *)v7, 0xEu);
  }

  if (self->_inScheduleTime != v3)
  {
    self->_BOOL inScheduleTime = v3;
    [(_UICustomScheduleController *)self _notifyChange];
  }
}

- (void)_updateWithDate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 dateBySettingHour:self->_schedule.beginTime.hour minute:self->_schedule.beginTime.minute second:0 ofDate:v4 options:4096];
  uint64_t v7 = [v5 dateBySettingHour:self->_schedule.endTime.hour minute:self->_schedule.endTime.minute second:0 ofDate:v4 options:4096];
  __int16 v8 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = formatDate(v4);
    uint64_t v10 = formatDate(v6);
    long long v11 = formatDate(v7);
    int v20 = 138412802;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Updating for date %@ compared to %@ and %@", (uint8_t *)&v20, 0x20u);
  }
  unint64_t v12 = [v5 compareDate:v4 toDate:v6 toUnitGranularity:64];
  uint64_t v13 = [v5 compareDate:v4 toDate:v7 toUnitGranularity:64];
  uint64_t v14 = [v5 compareDate:v6 toDate:v7 toUnitGranularity:64];
  BOOL v16 = v12 < 2 || v13 == -1;
  BOOL v18 = v12 < 2 && v13 == -1;
  if (v14 != -1) {
    BOOL v18 = 0;
  }
  if (v14 == 1) {
    BOOL v19 = v16;
  }
  else {
    BOOL v19 = v18;
  }
  [(_UICustomScheduleController *)self _updateStatus:v19];
}

- (void)_updateTimeMonitoring
{
}

- (void)_updateTimeMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Update time monitoring: %d", buf, 8u);
  }

  nextEventTimer = self->_nextEventTimer;
  if (nextEventTimer)
  {
    [(NSTimer *)nextEventTimer invalidate];
    uint64_t v7 = self->_nextEventTimer;
    self->_nextEventTimer = 0;
  }
  if (v3)
  {
    __int16 v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v8 dateBySettingHour:self->_schedule.beginTime.hour minute:self->_schedule.beginTime.minute second:0 ofDate:v9 options:4096];
    long long v11 = [v8 dateBySettingHour:self->_schedule.endTime.hour minute:self->_schedule.endTime.minute second:0 ofDate:v9 options:4096];
    unint64_t v12 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = formatDate(v10);
      uint64_t v14 = formatDate(v11);
      *(_DWORD *)buf = 138412546;
      v37 = v13;
      __int16 v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Monitoring dates %@ and %@", buf, 0x16u);
    }
    uint64_t v15 = [v8 compareDate:v10 toDate:v11 toUnitGranularity:64];
    BOOL v16 = v10;
    v17 = v11;
    if (v15 != -1)
    {
      if (v15 != 1)
      {
        int v20 = 0;
        id v18 = 0;
LABEL_22:

        return;
      }
      BOOL v16 = v11;
      v17 = v10;
    }
    id v18 = v16;
    id v19 = v17;
    int v20 = v19;
    if (v18 && v19)
    {
      if ([v8 compareDate:v9 toDate:v18 toUnitGranularity:64] == -1)
      {
        id v21 = v18;
      }
      else if ([v8 compareDate:v9 toDate:v20 toUnitGranularity:64] == -1)
      {
        id v21 = v20;
      }
      else
      {
        id v21 = [v8 dateByAddingUnit:16 value:1 toDate:v18 options:4096];
      }
      __int16 v22 = v21;
      v23 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = formatDate(v22);
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Setting timer for %@", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      id v25 = objc_alloc(MEMORY[0x1E4F1CB00]);
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      v32 = __53___UICustomScheduleController__updateTimeMonitoring___block_invoke;
      v33 = &unk_1E52D9F48;
      id v26 = v22;
      id v34 = v26;
      objc_copyWeak(&v35, (id *)buf);
      v27 = (NSTimer *)[v25 initWithFireDate:v26 interval:0 repeats:&v30 block:0.0];
      v28 = self->_nextEventTimer;
      self->_nextEventTimer = v27;

      v29 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v30, v31, v32, v33);
      [v29 addTimer:self->_nextEventTimer forMode:*MEMORY[0x1E4F1C4B0]];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_22;
  }
}

- (void)_significantTimeChange
{
  BOOL v3 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "CustomSchedule: Significant time change", v5, 2u);
  }

  [(_UICustomScheduleController *)self _updateTimeMonitoring];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(_UICustomScheduleController *)self _updateWithDate:v4];
}

- (NSString)debugDescription
{
  return (NSString *)[(_UICustomScheduleController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UICustomScheduleController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UICustomScheduleController isInScheduleTime](self, "isInScheduleTime"), @"isInScheduleTime");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_UICustomScheduleController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = (id)objc_msgSend(v6, "appendInteger:withName:", -[_UICustomScheduleController isInScheduleTime](self, "isInScheduleTime"), @"isInScheduleTime");
  return v6;
}

- ($DF5A289EBC70615FF524364991CCA432)schedule
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEventTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end