@interface NTKSimulatedVisitManager
- (NTKSimulatedVisitManager)init;
- (id)currentVisit;
- (id)previousVisit;
- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4;
@end

@implementation NTKSimulatedVisitManager

- (NTKSimulatedVisitManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSimulatedVisitManager;
  v2 = [(NTKSimulatedVisitManager *)&v6 init];
  if (v2)
  {
    v3 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKSimulatedVisitManager initialized.", v5, 2u);
    }
  }
  return v2;
}

- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__NTKSimulatedVisitManager_startVisitUpdatesWithIdentifier_handler___block_invoke;
  v8[3] = &unk_1E62C0AE8;
  v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  return &stru_1F1635E90;
}

void __68__NTKSimulatedVisitManager_startVisitUpdatesWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) currentVisit];
  v3 = [*(id *)(a1 + 32) anyVisit];
  (*(void (**)(uint64_t, id, void *, void))(v2 + 16))(v2, v4, v3, 0);
}

- (id)currentVisit
{
  return +[NTKVisitManager fallbackVisit];
}

- (id)previousVisit
{
  return +[NTKVisitManager fallbackVisit];
}

@end