@interface SOClockAlarmObserver
+ (void)initialize;
- (SOClockAlarmObserver)init;
- (SOClockAlarmObserver)initWithInstanceContext:(id)a3;
- (id)_alarmSnapshot;
- (void)_beginGroup;
- (void)_consolidateNotifiedFiringAlarms;
- (void)_endGroup;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_fetchAlarmsForReason:(id)a3 completion:(id)a4;
- (void)_handleFetchAlarmsForReason:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_handleFetchAlarmsForReason:(id)a3 result:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)_setUp;
- (void)_tearDown;
- (void)addListener:(id)a3;
- (void)alarmFired:(id)a3;
- (void)alarmsAdded:(id)a3;
- (void)alarmsChanged:(id)a3;
- (void)alarmsRemoved:(id)a3;
- (void)alarmsUpdated:(id)a3;
- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6;
- (void)dealloc;
- (void)firingAlarmChanged:(id)a3;
- (void)firingAlarmDismissed:(id)a3;
- (void)getAlarmSnapshotWithCompletion:(id)a3;
- (void)getFiringAlarmIDsWithCompletion:(id)a3;
- (void)invalidate;
- (void)removeListener:(id)a3;
- (void)stateReset:(id)a3;
@end

@implementation SOClockAlarmObserver

uint64_t __35__SOClockAlarmObserver_stateReset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reset];
  [*(id *)(a1 + 32) _beginGroup];
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SOClockAlarmObserver_stateReset___block_invoke_2;
  v4[3] = &unk_264486D60;
  v4[4] = v2;
  return [v2 _fetchAlarmsForReason:@"state reset" completion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsChangedToken, 0);
  objc_storeStrong((id *)&self->_notifiedFiringAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_alarmSnapshotGroup, 0);
  objc_storeStrong((id *)&self->_alarmSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_consolidateNotifiedFiringAlarms
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(AFClockItemStorage *)self->_alarmStorage itemsByID];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke;
  v22[3] = &unk_264486A18;
  v22[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v22];
  if ([(NSMutableOrderedSet *)self->_notifiedFiringAlarmIDs count])
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    v5 = [v3 allKeys];
    uint64_t v6 = [v4 setWithArray:v5];

    v7 = (void *)MEMORY[0x263EFF9C0];
    v8 = [(NSMutableOrderedSet *)self->_notifiedFiringAlarmIDs set];
    v9 = [v7 setWithSet:v8];

    v16 = (void *)v6;
    [v9 minusSet:v6];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          [(NSMutableOrderedSet *)self->_notifiedFiringAlarmIDs removeObject:v15];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_4;
          v17[3] = &unk_2644869A0;
          v17[4] = self;
          v17[5] = v15;
          [(SOClockAlarmObserver *)self _enumerateListenersUsingBlock:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

void __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isFiring]
    && ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v5] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 72) addObject:v5];
    v7 = *(void **)(a1 + 32);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    long long v18 = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_2;
    long long v19 = &unk_2644869A0;
    long long v20 = v7;
    v8 = &v21;
    id v21 = v5;
    v9 = &v16;
    goto LABEL_7;
  }
  if (([v6 isFiring] & 1) == 0
    && [*(id *)(*(void *)(a1 + 32) + 72) containsObject:v5])
  {
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v5];
    v7 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_3;
    uint64_t v13 = &unk_2644869A0;
    v14 = v7;
    v8 = &v15;
    id v15 = v5;
    v9 = &v10;
LABEL_7:
    objc_msgSend(v7, "_enumerateListenersUsingBlock:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidDismiss:*(void *)(a1 + 40)];
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidFire:*(void *)(a1 + 40)];
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidDismiss:*(void *)(a1 + 40)];
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_listeners;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_handleFetchAlarmsForReason:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, id))a5;
  long long v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315650;
    long long v12 = "-[SOClockAlarmObserver _handleFetchAlarmsForReason:error:completion:]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_error_impl(&dword_21DE53000, v10, OS_LOG_TYPE_ERROR, "%s reason = %@, error = %@", (uint8_t *)&v11, 0x20u);
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v9) {
LABEL_3:
  }
    v9[2](v9, 0, v8);
LABEL_4:
}

- (void)_handleFetchAlarmsForReason:(id)a3 result:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  long long v10 = SOClockAlarmCreateFromMTAlarms(a4);
  int v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[SOClockAlarmObserver _handleFetchAlarmsForReason:result:completion:]";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_21DE53000, v11, OS_LOG_TYPE_INFO, "%s reason = %@, alarms = %@", (uint8_t *)&v12, 0x20u);
  }
  [(AFClockItemStorage *)self->_alarmStorage beginGrouping];
  [(AFClockItemStorage *)self->_alarmStorage deleteAllItems];
  [(AFClockItemStorage *)self->_alarmStorage insertOrUpdateItems:v10];
  [(AFClockItemStorage *)self->_alarmStorage endGroupingWithOptions:0];
  if (v9) {
    v9[2](v9, v10, 0);
  }
}

- (void)_fetchAlarmsForReason:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_21DE53000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v9 = [(SOClockAlarmManager *)self->_alarmManager alarmsIncludingSleepAlarm:1];
  if (v9)
  {
    long long v10 = self->_queue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke;
    v22[3] = &unk_264486EC8;
    id v11 = v6;
    id v23 = v11;
    int v12 = v10;
    uint64_t v24 = v12;
    objc_copyWeak(&v26, (id *)buf);
    id v13 = v7;
    id v25 = v13;
    id v14 = (id)[v9 addSuccessBlock:v22];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_2;
    v17[3] = &unk_264486EF0;
    id v18 = v11;
    id v15 = v12;
    long long v19 = v15;
    objc_copyWeak(&v21, (id *)buf);
    id v20 = v13;
    id v16 = (id)[v9 addFailureBlock:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v26);
  }
  else
  {
    id v15 = [MEMORY[0x263F28508] errorWithCode:2105];
    [(SOClockAlarmObserver *)self _handleFetchAlarmsForReason:v6 error:v15 completion:v7];
  }

  objc_destroyWeak((id *)buf);
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_21DE53000, v4, OS_LOG_TYPE_INFO, "%s reason = %@, result = %@", buf, 0x20u);
  }
  id v6 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_26;
  v8[3] = &unk_264486EA0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v12);
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v14 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]_block_invoke_2";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_error_impl(&dword_21DE53000, v4, OS_LOG_TYPE_ERROR, "%s reason = %@, error = %@", buf, 0x20u);
  }
  uint64_t v5 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_27;
  v8[3] = &unk_264486EA0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v8);

  objc_destroyWeak(&v12);
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleFetchAlarmsForReason:*(void *)(a1 + 32) error:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleFetchAlarmsForReason:*(void *)(a1 + 32) result:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_reset
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[SOClockAlarmObserver _reset]";
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(NSMutableOrderedSet *)self->_notifiedFiringAlarmIDs removeAllObjects];
  [(AFClockItemStorage *)self->_alarmStorage invalidate];
  if (self->_alarmManager) {
    v4 = (AFClockItemStorage *)[objc_alloc(MEMORY[0x263F28480]) initWithIdentifier:@"alarm observer" delegate:self];
  }
  else {
    v4 = 0;
  }
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v4;

  if (self->_alarmSnapshot)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__SOClockAlarmObserver__reset__block_invoke;
    v8[3] = &unk_2644869F0;
    void v8[4] = self;
    [(SOClockAlarmObserver *)self _enumerateListenersUsingBlock:v8];
    alarmSnapshot = self->_alarmSnapshot;
    self->_alarmSnapshot = 0;
  }
  alarmsChangedToken = self->_alarmsChangedToken;
  self->_alarmsChangedToken = 0;
}

uint64_t __30__SOClockAlarmObserver__reset__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) snapshotDidUpdateFrom:*(void *)(*(void *)(a1 + 32) + 40) to:0];
}

- (void)_tearDown
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SOClockAlarmObserver _tearDown]";
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  [(SOClockAlarmObserver *)self _reset];
}

- (void)_setUp
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[SOClockAlarmObserver _setUp]";
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  alarmSnapshot = self->_alarmSnapshot;
  self->_alarmSnapshot = 0;

  int v5 = (AFClockItemStorage *)[objc_alloc(MEMORY[0x263F28480]) initWithIdentifier:@"alarm observer" delegate:self];
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v5;

  uint64_t v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
  notifiedFiringAlarmIDs = self->_notifiedFiringAlarmIDs;
  self->_notifiedFiringAlarmIDs = v7;

  id v9 = [[SOClockAlarmManager alloc] initWithInstanceContext:self->_instanceContext];
  alarmManager = self->_alarmManager;
  self->_alarmManager = v9;

  uint64_t v11 = self->_alarmManager;
  if (v11)
  {
    [(SOClockAlarmManager *)v11 checkIn];
    objc_initWeak((id *)buf, self);
    id v12 = self->_alarmManager;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __30__SOClockAlarmObserver__setUp__block_invoke;
    v34[3] = &unk_264486E50;
    objc_copyWeak(&v35, (id *)buf);
    [(SOClockAlarmManager *)v12 addHandler:v34 forEvent:1];
    id v13 = self->_alarmManager;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __30__SOClockAlarmObserver__setUp__block_invoke_2;
    v32[3] = &unk_264486E50;
    objc_copyWeak(&v33, (id *)buf);
    [(SOClockAlarmManager *)v13 addHandler:v32 forEvent:2];
    id v14 = self->_alarmManager;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __30__SOClockAlarmObserver__setUp__block_invoke_3;
    v30[3] = &unk_264486E50;
    objc_copyWeak(&v31, (id *)buf);
    [(SOClockAlarmManager *)v14 addHandler:v30 forEvent:3];
    __int16 v15 = self->_alarmManager;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __30__SOClockAlarmObserver__setUp__block_invoke_4;
    v28[3] = &unk_264486E50;
    objc_copyWeak(&v29, (id *)buf);
    [(SOClockAlarmManager *)v15 addHandler:v28 forEvent:4];
    uint64_t v16 = self->_alarmManager;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __30__SOClockAlarmObserver__setUp__block_invoke_5;
    v26[3] = &unk_264486E50;
    objc_copyWeak(&v27, (id *)buf);
    [(SOClockAlarmManager *)v16 addHandler:v26 forEvent:6];
    __int16 v17 = self->_alarmManager;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __30__SOClockAlarmObserver__setUp__block_invoke_6;
    v24[3] = &unk_264486E50;
    objc_copyWeak(&v25, (id *)buf);
    [(SOClockAlarmManager *)v17 addHandler:v24 forEvent:5];
    id v18 = self->_alarmManager;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __30__SOClockAlarmObserver__setUp__block_invoke_7;
    v22[3] = &unk_264486E50;
    objc_copyWeak(&v23, (id *)buf);
    [(SOClockAlarmManager *)v18 addHandler:v22 forEvent:7];
    uint64_t v19 = self->_alarmManager;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __30__SOClockAlarmObserver__setUp__block_invoke_8;
    v20[3] = &unk_264486E50;
    objc_copyWeak(&v21, (id *)buf);
    [(SOClockAlarmManager *)v19 addHandler:v20 forEvent:8];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
}

void __30__SOClockAlarmObserver__setUp__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained alarmsAdded:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained alarmsUpdated:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained alarmsRemoved:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained alarmFired:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained firingAlarmChanged:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained firingAlarmDismissed:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained stateReset:v3];
}

void __30__SOClockAlarmObserver__setUp__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained alarmsChanged:v3];
}

- (id)_alarmSnapshot
{
  alarmSnapshot = self->_alarmSnapshot;
  if (!alarmSnapshot)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SOClockAlarmObserver__alarmSnapshot__block_invoke;
    v7[3] = &unk_2644869C8;
    v7[4] = self;
    v4 = (AFClockAlarmSnapshot *)[MEMORY[0x263F28478] newWithBuilder:v7];
    int v5 = self->_alarmSnapshot;
    self->_alarmSnapshot = v4;

    alarmSnapshot = self->_alarmSnapshot;
  }
  return alarmSnapshot;
}

void __38__SOClockAlarmObserver__alarmSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a2;
  objc_msgSend(v6, "setGeneration:", objc_msgSend(v3, "generation"));
  v4 = [*(id *)(*(void *)(a1 + 32) + 64) date];
  [v6 setDate:v4];

  int v5 = [*(id *)(*(void *)(a1 + 32) + 64) itemsByID];
  [v6 setAlarmsByID:v5];

  [v6 setNotifiedFiringAlarmIDs:*(void *)(*(void *)(a1 + 32) + 72)];
}

- (void)_endGroup
{
  p_alarmSnapshotGroup = &self->_alarmSnapshotGroup;
  alarmSnapshotGroup = self->_alarmSnapshotGroup;
  self->_alarmSnapshotGroupDepth = (int64_t)p_alarmSnapshotGroup[1] - 1;
  dispatch_group_leave(alarmSnapshotGroup);
  if (!self->_alarmSnapshotGroupDepth)
  {
    int v5 = self->_alarmSnapshotGroup;
    self->_alarmSnapshotGroup = 0;
  }
}

- (void)_beginGroup
{
  alarmSnapshotGroup = self->_alarmSnapshotGroup;
  if (!alarmSnapshotGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    int v5 = self->_alarmSnapshotGroup;
    self->_alarmSnapshotGroup = v4;

    alarmSnapshotGroup = self->_alarmSnapshotGroup;
  }
  dispatch_group_enter(alarmSnapshotGroup);
  ++self->_alarmSnapshotGroupDepth;
}

- (void)alarmsChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke;
  v7[3] = &unk_2644870A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__SOClockAlarmObserver_alarmsChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (id *)*(id *)(a1 + 32);
  if (v2)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[SOClockAlarmObserver alarmsChanged:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
    }
    int v5 = [MEMORY[0x263F08C38] UUID];
    objc_storeStrong(v2 + 10, v5);
    objc_initWeak((id *)buf, v2);
    dispatch_time_t v6 = dispatch_time(0, 250000000);
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke_14;
    v9[3] = &unk_264486E00;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v5;
    id v8 = v5;
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __38__SOClockAlarmObserver_alarmsChanged___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 10);
    if (v4)
    {
      if (*(void *)(a1 + 32) && objc_msgSend(v4, "isEqual:"))
      {
        [v3 _beginGroup];
        v5[0] = MEMORY[0x263EF8330];
        v5[1] = 3221225472;
        v5[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke_2;
        v5[3] = &unk_264486D60;
        v5[4] = v3;
        [v3 _fetchAlarmsForReason:@"batched changes" completion:v5];
      }
    }
  }
}

uint64_t __38__SOClockAlarmObserver_alarmsChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SOClockAlarmObserver alarmsChanged:]_block_invoke_2";
    _os_log_impl(&dword_21DE53000, v2, OS_LOG_TYPE_INFO, "%s Alarm fetch complete for batched changes", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _endGroup];
}

- (void)stateReset:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SOClockAlarmObserver stateReset:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SOClockAlarmObserver_stateReset___block_invoke;
  block[3] = &unk_264486D88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__SOClockAlarmObserver_stateReset___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SOClockAlarmObserver stateReset:]_block_invoke_2";
    _os_log_impl(&dword_21DE53000, v2, OS_LOG_TYPE_INFO, "%s Alarm fetch complete for state reset", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _endGroup];
}

- (void)firingAlarmDismissed:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver firingAlarmDismissed:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  int v5 = _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v10])
        {
          [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v10];
          id v11 = *(void **)(a1 + 32);
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_2;
          v17[3] = &unk_2644869A0;
          void v17[4] = v11;
          v17[5] = v10;
          [v11 _enumerateListenersUsingBlock:v17];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  [*(id *)(*(void *)(a1 + 32) + 64) beginGrouping];
  [*(id *)(*(void *)(a1 + 32) + 64) insertOrUpdateItems:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 64) endGroupingWithOptions:1];
  [*(id *)(a1 + 32) _consolidateNotifiedFiringAlarms];
  id v12 = [*(id *)(a1 + 32) _alarmSnapshot];
  if (v2 != v12 && ([v2 isEqual:v12] & 1) == 0)
  {
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_3;
    v14[3] = &unk_264486978;
    v14[4] = v13;
    id v15 = v2;
    id v16 = v12;
    [v13 _enumerateListenersUsingBlock:v14];
  }
}

uint64_t __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidDismiss:*(void *)(a1 + 40)];
}

uint64_t __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_3(void *a1, void *a2)
{
  return [a2 clockAlarmObserver:a1[4] snapshotDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)firingAlarmChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver firingAlarmChanged:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SOClockAlarmObserver_firingAlarmChanged___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __43__SOClockAlarmObserver_firingAlarmChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) insertOrUpdateItems:*(void *)(a1 + 40)];
}

- (void)alarmFired:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver alarmFired:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __35__SOClockAlarmObserver_alarmFired___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  int v5 = _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v10] & 1) == 0)
        {
          [*(id *)(*(void *)(a1 + 32) + 72) addObject:v10];
          id v11 = *(void **)(a1 + 32);
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke_2;
          v17[3] = &unk_2644869A0;
          void v17[4] = v11;
          v17[5] = v10;
          [v11 _enumerateListenersUsingBlock:v17];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  [*(id *)(*(void *)(a1 + 32) + 64) beginGrouping];
  [*(id *)(*(void *)(a1 + 32) + 64) insertOrUpdateItems:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 64) endGroupingWithOptions:1];
  [*(id *)(a1 + 32) _consolidateNotifiedFiringAlarms];
  id v12 = [*(id *)(a1 + 32) _alarmSnapshot];
  if (v2 != v12 && ([v2 isEqual:v12] & 1) == 0)
  {
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke_3;
    v14[3] = &unk_264486978;
    v14[4] = v13;
    id v15 = v2;
    id v16 = v12;
    [v13 _enumerateListenersUsingBlock:v14];
  }
}

uint64_t __35__SOClockAlarmObserver_alarmFired___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidFire:*(void *)(a1 + 40)];
}

uint64_t __35__SOClockAlarmObserver_alarmFired___block_invoke_3(void *a1, void *a2)
{
  return [a2 clockAlarmObserver:a1[4] snapshotDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)alarmsRemoved:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver alarmsRemoved:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __38__SOClockAlarmObserver_alarmsRemoved___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  int v5 = _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:v10])
        {
          [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v10];
          id v11 = *(void **)(a1 + 32);
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_2;
          v17[3] = &unk_2644869A0;
          void v17[4] = v11;
          v17[5] = v10;
          [v11 _enumerateListenersUsingBlock:v17];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  [*(id *)(*(void *)(a1 + 32) + 64) beginGrouping];
  [*(id *)(*(void *)(a1 + 32) + 64) deleteItemsWithIDs:v5];
  [*(id *)(*(void *)(a1 + 32) + 64) endGroupingWithOptions:1];
  [*(id *)(a1 + 32) _consolidateNotifiedFiringAlarms];
  id v12 = [*(id *)(a1 + 32) _alarmSnapshot];
  if (v2 != v12 && ([v2 isEqual:v12] & 1) == 0)
  {
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_3;
    v14[3] = &unk_264486978;
    v14[4] = v13;
    id v15 = v2;
    id v16 = v12;
    [v13 _enumerateListenersUsingBlock:v14];
  }
}

uint64_t __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clockAlarmObserver:*(void *)(a1 + 32) alarmDidDismiss:*(void *)(a1 + 40)];
}

uint64_t __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_3(void *a1, void *a2)
{
  return [a2 clockAlarmObserver:a1[4] snapshotDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)alarmsUpdated:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver alarmsUpdated:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SOClockAlarmObserver_alarmsUpdated___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __38__SOClockAlarmObserver_alarmsUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) insertOrUpdateItems:*(void *)(a1 + 40)];
}

- (void)alarmsAdded:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOClockAlarmObserver alarmsAdded:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SOClockAlarmObserver_alarmsAdded___block_invoke;
  v8[3] = &unk_2644870A0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __36__SOClockAlarmObserver_alarmsAdded___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) insertOrUpdateItems:*(void *)(a1 + 40)];
}

- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_alarmStorage == a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v13 = (NSObject **)MEMORY[0x263F28348];
    uint64_t v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_21DE53000, v14, OS_LOG_TYPE_INFO, "%s insertedItemIDs = %@", buf, 0x16u);
      uint64_t v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_21DE53000, v14, OS_LOG_TYPE_INFO, "%s  updatedItemIDs = %@", buf, 0x16u);
      uint64_t v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_21DE53000, v14, OS_LOG_TYPE_INFO, "%s  deletedItemIDs = %@", buf, 0x16u);
    }
    id v15 = self->_alarmSnapshot;
    alarmSnapshot = self->_alarmSnapshot;
    self->_alarmSnapshot = 0;

    [(SOClockAlarmObserver *)self _consolidateNotifiedFiringAlarms];
    __int16 v17 = [(SOClockAlarmObserver *)self _alarmSnapshot];
    if (v15 != v17 && ([(AFClockAlarmSnapshot *)v15 isEqual:v17] & 1) == 0)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __96__SOClockAlarmObserver_clockItemStorageDidUpdate_insertedItemIDs_updatedItemIDs_deletedItemIDs___block_invoke;
      v18[3] = &unk_264486978;
      v18[4] = self;
      long long v19 = v15;
      long long v20 = v17;
      [(SOClockAlarmObserver *)self _enumerateListenersUsingBlock:v18];
    }
  }
}

uint64_t __96__SOClockAlarmObserver_clockItemStorageDidUpdate_insertedItemIDs_updatedItemIDs_deletedItemIDs___block_invoke(void *a1, void *a2)
{
  return [a2 clockAlarmObserver:a1[4] snapshotDidUpdateFrom:a1[5] to:a1[6]];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SOClockAlarmObserver_invalidate__block_invoke;
  block[3] = &unk_264486D88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__SOClockAlarmObserver_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  id v2 = *(void **)(a1 + 32);
  return [v2 _tearDown];
}

- (void)getFiringAlarmIDsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__SOClockAlarmObserver_getFiringAlarmIDsWithCompletion___block_invoke;
    v7[3] = &unk_264487050;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __56__SOClockAlarmObserver_getFiringAlarmIDsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 72) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getAlarmSnapshotWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]";
      _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke;
    v7[3] = &unk_264487050;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[6];
  if (v3)
  {
    id v4 = v2[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke_2;
    v7[3] = &unk_264487050;
    v7[4] = v2;
    id v8 = *(id *)(a1 + 40);
    dispatch_group_notify(v3, v4, v7);
  }
  else
  {
    int v5 = [v2 _alarmSnapshot];
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_21DE53000, v6, OS_LOG_TYPE_INFO, "%s alarmSnapshot = %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _alarmSnapshot];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s Notified, alarmSnapshot = %@", (uint8_t *)&v4, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SOClockAlarmObserver_removeListener___block_invoke;
    v7[3] = &unk_2644870A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __39__SOClockAlarmObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SOClockAlarmObserver_addListener___block_invoke;
    v7[3] = &unk_2644870A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __36__SOClockAlarmObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(SOClockAlarmObserver *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)SOClockAlarmObserver;
  [(SOClockAlarmObserver *)&v3 dealloc];
}

- (SOClockAlarmObserver)initWithInstanceContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SOClockAlarmObserver;
  int v5 = [(SOClockAlarmObserver *)&v19 init];
  if (v5)
  {
    __int16 v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v21 = "-[SOClockAlarmObserver initWithInstanceContext:]";
      _os_log_impl(&dword_21DE53000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.assistant.clock-alarm-observer", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    if (v4)
    {
      __int16 v11 = (AFInstanceContext *)v4;
    }
    else
    {
      __int16 v11 = [MEMORY[0x263F28528] defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v13;

    [(SOClockAlarmObserver *)v5 _beginGroup];
    id v15 = v5->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke;
    block[3] = &unk_264486D88;
    long long v18 = v5;
    dispatch_async(v15, block);
  }
  return v5;
}

void __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUp];
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke_2;
  v3[3] = &unk_264486D60;
  id v4 = v2;
  [v4 _fetchAlarmsForReason:@"initial" completion:v3];
}

uint64_t __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[SOClockAlarmObserver initWithInstanceContext:]_block_invoke_2";
    _os_log_impl(&dword_21DE53000, v2, OS_LOG_TYPE_INFO, "%s Initial alarm fetch completed", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _endGroup];
}

- (SOClockAlarmObserver)init
{
  objc_super v3 = [MEMORY[0x263F28528] currentContext];
  int v4 = [(SOClockAlarmObserver *)self initWithInstanceContext:v3];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SOClockAlarmManager warmUp];
  }
}

@end