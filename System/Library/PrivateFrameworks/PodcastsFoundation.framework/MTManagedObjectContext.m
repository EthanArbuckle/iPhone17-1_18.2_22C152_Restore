@interface MTManagedObjectContext
- (BOOL)_isInternalCoreDataQueue;
- (BOOL)handleError:(id *)a3 withCallback:(id)a4;
- (BOOL)isResetable;
- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3;
- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 name:(id)a4;
- (NSString)mt_immutableName;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)existingObjectWithID:(id)a3 error:(id *)a4;
- (id)objectRegisteredForID:(id)a3;
- (id)objectWithID:(id)a3;
- (int64_t)type;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (void)deleteObject:(id)a3;
- (void)insertObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)reset;
- (void)setIsResetable:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)validateConcurencyType;
- (void)validatePodcastDeletion:(id)a3;
@end

@implementation MTManagedObjectContext

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MTManagedObjectContext_performBlock___block_invoke;
  v7[3] = &unk_1E5E61408;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)MTManagedObjectContext;
  id v5 = v4;
  [(MTManagedObjectContext *)&v6 performBlock:v7];
}

- (id)objectWithID:(id)a3
{
  id v4 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  v7.receiver = self;
  v7.super_class = (Class)MTManagedObjectContext;
  id v5 = [(MTManagedObjectContext *)&v7 objectWithID:v4];

  return v5;
}

- (id)objectRegisteredForID:(id)a3
{
  id v4 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  v7.receiver = self;
  v7.super_class = (Class)MTManagedObjectContext;
  id v5 = [(MTManagedObjectContext *)&v7 objectRegisteredForID:v4];

  return v5;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__MTManagedObjectContext_executeFetchRequest_error___block_invoke;
  v10[3] = &unk_1E5E613B8;
  v13 = &v14;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [(MTManagedObjectContext *)self handleError:a4 withCallback:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)validateConcurencyType
{
  if ([(MTManagedObjectContext *)self concurrencyType] == 1)
  {
    if (![(MTManagedObjectContext *)self _isInternalCoreDataQueue])
    {
      id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Fetch request is not being run within a performBlock!" userInfo:0];
      objc_exception_throw(v3);
    }
  }
  else
  {
    char v4 = [MEMORY[0x1E4F29060] isMainThread];
    if (!+[PFClientUtil isRunningOnHomepod] || (v4 & 1) != 0)
    {
      if (v4) {
        return;
      }
    }
    else if ([(MTManagedObjectContext *)self _isInternalCoreDataQueue])
    {
      return;
    }
    id v5 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_ERROR, "NSMainQueueConcurrencyType should be run on main thread", v6, 2u);
    }
  }
}

- (BOOL)_isInternalCoreDataQueue
{
  id v3 = [NSString stringWithUTF8String:dispatch_queue_get_label(0)];
  if (([v3 hasPrefix:@"SQLQueue"] & 1) != 0
    || ([v3 hasPrefix:@"NSSQLiteConnection"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = dispatch_get_current_queue();
    dispatch_get_context(v5);
    id v6 = (MTManagedObjectContext *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v7 = [(MTManagedObjectContext *)self persistentStoreCoordinator];
      BOOL v4 = v6 == v7;
    }
  }

  return v4;
}

- (BOOL)handleError:(id *)a3 withCallback:(id)a4
{
  id v5 = (void (**)(id, id *))a4;
  id v9 = 0;
  v5[2](v5, &v9);
  id v6 = v9;
  if (v9)
  {
    id v7 = v9;
    if (a3)
    {
      *a3 = v9;
      id v7 = v9;
    }
    if ([v7 code] == 259)
    {
      if (+[PFClientUtil isPodcastsApp])
      {
        +[IMMetrics recordUserAction:@"corrupt_db" dataSource:v9];
        +[MTDB setCorrupt:1];
      }
      exit(0);
    }
  }

  return v6 == 0;
}

void __52__MTManagedObjectContext_executeFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MTManagedObjectContext;
  uint64_t v4 = objc_msgSendSuper2(&v7, sel_executeFetchRequest_error_, v3, a2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __53__MTManagedObjectContext_countForFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)MTManagedObjectContext;
  id result = objc_msgSendSuper2(&v5, sel_countForFetchRequest_error_, v3, a2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __39__MTManagedObjectContext_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _MTLogCategoryDatabase();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = _MTLogCategoryDatabase();
  objc_super v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 192);
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "performBlock", "context: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_super v7 = _MTLogCategoryDatabase();
  id v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v8, OS_SIGNPOST_INTERVAL_END, v3, "performBlock", "", (uint8_t *)&v9, 2u);
  }
}

- (void)performBlockAndWait:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && [(MTManagedObjectContext *)self type] == 1
    && (isRunningUnitTests() & 1) == 0)
  {
    objc_super v5 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_ERROR, "Blocking the main thread on a background queue is error prone:\n %@", buf, 0xCu);
    }
  }
  objc_super v7 = _MTLogCategoryDatabase();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = _MTLogCategoryDatabase();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    mt_immutableName = self->_mt_immutableName;
    *(_DWORD *)buf = 138543362;
    v18 = mt_immutableName;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "performBlockAndWait waiting", "context: %{public}@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__MTManagedObjectContext_performBlockAndWait___block_invoke;
  v14[3] = &unk_1E5E613E0;
  id v15 = v4;
  os_signpost_id_t v16 = v8;
  v14[4] = self;
  v13.receiver = self;
  v13.super_class = (Class)MTManagedObjectContext;
  id v12 = v4;
  [(MTManagedObjectContext *)&v13 performBlockAndWait:v14];
}

void __46__MTManagedObjectContext_performBlockAndWait___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = _MTLogCategoryDatabase();
  os_signpost_id_t v3 = v2;
  os_signpost_id_t v4 = a1[6];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "performBlockAndWait waiting", "", (uint8_t *)&v12, 2u);
  }

  objc_super v5 = _MTLogCategoryDatabase();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  objc_super v7 = _MTLogCategoryDatabase();
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = *(void *)(a1[4] + 192);
    int v12 = 138543362;
    uint64_t v13 = v9;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "performBlockAndWait performing", "context: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v10 = _MTLogCategoryDatabase();
  uint64_t v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC9D5000, v11, OS_SIGNPOST_INTERVAL_END, v6, "performBlockAndWait performing", "", (uint8_t *)&v12, 2u);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTManagedObjectContext;
  objc_super v7 = [(MTManagedObjectContext *)&v11 initWithConcurrencyType:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    mt_immutableName = v7->_mt_immutableName;
    v7->_mt_immutableName = (NSString *)v8;

    [(MTManagedObjectContext *)v7 setName:v6];
  }

  return v7;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MTManagedObjectContext_countForFetchRequest_error___block_invoke;
  v10[3] = &unk_1E5E613B8;
  uint64_t v13 = &v14;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [(MTManagedObjectContext *)self handleError:a4 withCallback:v10];
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (MTManagedObjectContext)initWithConcurrencyType:(unint64_t)a3
{
  return [(MTManagedObjectContext *)self initWithConcurrencyType:a3 name:&stru_1F03A51F0];
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MTManagedObjectContext *)self validatePodcastDeletion:v4];
  }
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTManagedObjectContext;
    [(MTManagedObjectContext *)&v5 deleteObject:v4];
  }
}

- (void)validatePodcastDeletion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 episodes];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[MTManagedObjectContext validatePodcastDeletion:](v3, v6);
    }
  }
}

- (void)insertObject:(id)a3
{
  id v4 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  v5.receiver = self;
  v5.super_class = (Class)MTManagedObjectContext;
  [(MTManagedObjectContext *)&v5 insertObject:v4];
}

- (void)reset
{
  [(MTManagedObjectContext *)self validateConcurencyType];
  v3.receiver = self;
  v3.super_class = (Class)MTManagedObjectContext;
  [(MTManagedObjectContext *)&v3 reset];
}

- (id)existingObjectWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MTManagedObjectContext *)self validateConcurencyType];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MTManagedObjectContext_existingObjectWithID_error___block_invoke;
  v10[3] = &unk_1E5E613B8;
  uint64_t v13 = &v14;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [(MTManagedObjectContext *)self handleError:a4 withCallback:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __53__MTManagedObjectContext_existingObjectWithID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MTManagedObjectContext;
  uint64_t v4 = objc_msgSendSuper2(&v7, sel_existingObjectWithID_error_, v3, a2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)isResetable
{
  return self->_isResetable;
}

- (void)setIsResetable:(BOOL)a3
{
  self->_isResetable = a3;
}

- (NSString)mt_immutableName
{
  return self->_mt_immutableName;
}

- (void).cxx_destruct
{
}

- (void)validatePodcastDeletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 uuid];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_1AC9D5000, a2, OS_LOG_TYPE_FAULT, "Deleting podcast %@ without deleting its episodes first will cause on exception on context save.", (uint8_t *)&v4, 0xCu);
}

@end