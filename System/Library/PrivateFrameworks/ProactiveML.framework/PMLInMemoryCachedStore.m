@interface PMLInMemoryCachedStore
+ (id)cachedStoreFromRealStore:(id)a3 sessionDescriptor:(id)a4 sessionsLimit:(unint64_t)a5;
- (PMLInMemoryCachedStore)initWithSessionBatch:(id)a3;
- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9;
@end

@implementation PMLInMemoryCachedStore

- (void).cxx_destruct
{
}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  char v9 = 0;
  (*((void (**)(id, PMLTrainingStoredSessionBatch *, char *, unint64_t, BOOL, unint64_t, double, double))a9
   + 2))(a9, self->_cachedSessions, &v9, a5, a6, a7, a4, a8);
}

- (PMLInMemoryCachedStore)initWithSessionBatch:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLInMemoryCachedStore;
  v6 = [(PMLTrainingStore *)&v9 initWithPath:&stru_26D329A58];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cachedSessions, a3);
  }

  return v7;
}

+ (id)cachedStoreFromRealStore:(id)a3 sessionDescriptor:(id)a4 sessionsLimit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__PMLInMemoryCachedStore_cachedStoreFromRealStore_sessionDescriptor_sessionsLimit___block_invoke;
  v15[3] = &unk_26459E940;
  v15[4] = &v16;
  [v9 loadSessionsForModel:v10 excludeItemIdsUsedWithin:a5 limit:0 onlyAppleInternal:1 positiveLabel:v15 skew:0.0 block:0.0];
  if (![(id)v17[5] count])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PMLPlanSimulator.m", 44, @"Couldn't load sessions for %@", v10 object file lineNumber description];
  }
  id v11 = objc_alloc((Class)a1);
  v12 = (void *)[v11 initWithSessionBatch:v17[5]];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __83__PMLInMemoryCachedStore_cachedStoreFromRealStore_sessionDescriptor_sessionsLimit___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

@end