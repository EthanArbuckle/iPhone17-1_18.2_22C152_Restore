@interface PSYSyncSessionUpdate
- (BOOL)didUpdateCompleteSyncSession;
- (PSYSyncSession)originalSession;
- (PSYSyncSession)updatedSession;
- (PSYSyncSessionUpdate)initWithOriginalSession:(id)a3 updatedSession:(id)a4;
- (void)enumerateChangedActivitiesWithBlock:(id)a3;
- (void)enumerateNewlyCompletedActivitiesWithBlock:(id)a3;
- (void)enumerateNewlyRunningActivitiesWithBlock:(id)a3;
@end

@implementation PSYSyncSessionUpdate

- (PSYSyncSessionUpdate)initWithOriginalSession:(id)a3 updatedSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSYSyncSessionUpdate;
  v9 = [(PSYSyncSessionUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalSession, a3);
    objc_storeStrong((id *)&v10->_updatedSession, a4);
  }

  return v10;
}

- (void)enumerateChangedActivitiesWithBlock:(id)a3
{
  v14 = (void (**)(id, void *, void *))a3;
  v4 = [(PSYSyncSession *)self->_originalSession activities];
  uint64_t v5 = [v4 count];

  v6 = [(PSYSyncSession *)self->_updatedSession activities];
  uint64_t v7 = [v6 count];

  if (v5 == v7 && v5 != 0)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [(PSYSyncSession *)self->_originalSession activities];
      v11 = [v10 objectAtIndexedSubscript:v9];

      objc_super v12 = [(PSYSyncSession *)self->_updatedSession activities];
      v13 = [v12 objectAtIndexedSubscript:v9];

      if (([v11 isEqual:v13] & 1) == 0) {
        v14[2](v14, v11, v13);
      }

      ++v9;
    }
    while (v5 != v9);
  }
}

- (void)enumerateNewlyRunningActivitiesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__PSYSyncSessionUpdate_enumerateNewlyRunningActivitiesWithBlock___block_invoke;
  v6[3] = &unk_2642B4110;
  id v7 = v4;
  id v5 = v4;
  [(PSYSyncSessionUpdate *)self enumerateChangedActivitiesWithBlock:v6];
}

void __65__PSYSyncSessionUpdate_enumerateNewlyRunningActivitiesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (![v6 activityState] && objc_msgSend(v5, "activityState") == 1) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateNewlyCompletedActivitiesWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__PSYSyncSessionUpdate_enumerateNewlyCompletedActivitiesWithBlock___block_invoke;
  v6[3] = &unk_2642B4110;
  id v7 = v4;
  id v5 = v4;
  [(PSYSyncSessionUpdate *)self enumerateChangedActivitiesWithBlock:v6];
}

void __67__PSYSyncSessionUpdate_enumerateNewlyCompletedActivitiesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 activityState] != 2 && objc_msgSend(v5, "activityState") == 2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)didUpdateCompleteSyncSession
{
  return [(PSYSyncSession *)self->_originalSession syncSessionState] != 2
      && [(PSYSyncSession *)self->_updatedSession syncSessionState] == 2;
}

- (PSYSyncSession)originalSession
{
  return self->_originalSession;
}

- (PSYSyncSession)updatedSession
{
  return self->_updatedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSession, 0);

  objc_storeStrong((id *)&self->_originalSession, 0);
}

@end