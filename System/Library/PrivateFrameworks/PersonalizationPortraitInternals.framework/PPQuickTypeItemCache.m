@interface PPQuickTypeItemCache
- (PPQuickTypeItemCache)init;
- (void)setEntry:(id)a3 key:(id)a4;
@end

@implementation PPQuickTypeItemCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)setEntry:(id)a3 key:(id)a4
{
  keys = self->_keys;
  id v8 = a4;
  id v9 = a3;
  if (([(NSMutableOrderedSet *)keys containsObject:v8] & 1) == 0
    && (unint64_t)[(NSMutableOrderedSet *)self->_keys count] >= 3)
  {
    v10 = [(NSMutableOrderedSet *)self->_keys objectAtIndex:0];
    [(NSMutableDictionary *)self->_entries setObject:0 forKeyedSubscript:v10];
    [(NSMutableOrderedSet *)self->_keys removeObjectAtIndex:0];
  }
  [(NSMutableOrderedSet *)self->_keys removeObject:v8];
  [(NSMutableOrderedSet *)self->_keys addObject:v8];
  [(NSMutableDictionary *)self->_entries setObject:v9 forKeyedSubscript:v8];

  uint64_t v11 = [(NSMutableOrderedSet *)self->_keys count];
  if (v11 != [(NSMutableDictionary *)self->_entries count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PPLocalQuickTypeBroker.m" lineNumber:81 description:@"PQT cache count mismatch"];
  }
  if ((unint64_t)[(NSMutableOrderedSet *)self->_keys count] >= 4)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PPLocalQuickTypeBroker.m" lineNumber:82 description:@"PQT cache key set too big"];
  }
}

- (PPQuickTypeItemCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeItemCache;
  v2 = [(PPQuickTypeItemCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end