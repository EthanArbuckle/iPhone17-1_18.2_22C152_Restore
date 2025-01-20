@interface PNRPhoneNumberResolutionResultSet
- (PNRPhoneNumberResolutionResultSet)init;
- (id)description;
- (void)enumerateResolutionsUsingBlock:(id)a3;
- (void)setError:(id)a3 forPhoneNumber:(id)a4;
- (void)setResult:(id)a3 resultDataSource:(int64_t)a4 forPhoneNumber:(id)a5;
@end

@implementation PNRPhoneNumberResolutionResultSet

- (PNRPhoneNumberResolutionResultSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PNRPhoneNumberResolutionResultSet;
  v2 = [(PNRPhoneNumberResolutionResultSet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    results = v2->_results;
    v2->_results = v3;

    v2->_resultsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_results description];
}

- (void)enumerateResolutionsUsingBlock:(id)a3
{
  id v4 = a3;
  p_resultsLock = &self->_resultsLock;
  os_unfair_lock_lock(&self->_resultsLock);
  results = self->_results;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__PNRPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke;
  v8[3] = &unk_264D9F630;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)results enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_resultsLock);
}

void __68__PNRPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v10 = v7;
  }
  else {
    v10 = 0;
  }
  if (isKindOfClass) {
    v11 = 0;
  }
  else {
    v11 = v7;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void (**)(uint64_t, id, void *, void *, uint64_t))(v12 + 16);
  id v14 = v7;
  v13(v12, v8, v10, v11, a4);
}

- (void).cxx_destruct
{
}

- (void)setResult:(id)a3 resultDataSource:(int64_t)a4 forPhoneNumber:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[PNRPhoneNumberResolutionResult alloc] initWithLocationName:v9 locationDataSource:a4];

  os_unfair_lock_lock(&self->_resultsLock);
  [(NSMutableDictionary *)self->_results setObject:v10 forKey:v8];

  os_unfair_lock_unlock(&self->_resultsLock);
}

- (void)setError:(id)a3 forPhoneNumber:(id)a4
{
  p_resultsLock = &self->_resultsLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_resultsLock);
  [(NSMutableDictionary *)self->_results setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_resultsLock);
}

@end