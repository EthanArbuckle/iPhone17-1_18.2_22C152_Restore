@interface WBSMutableOrderedDictionary
- (NSArray)orderedKeys;
- (NSArray)orderedValues;
- (WBSMutableOrderedDictionary)init;
- (WBSMutableOrderedDictionary)initWithMaximumCount:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation WBSMutableOrderedDictionary

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (!self->_mutableOrderedSetOfKeys)
  {
    v7 = [[WBSMutableOrderedSet alloc] initWithMaximumCount:self->_maximumCount];
    mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
    self->_mutableOrderedSetOfKeys = v7;
  }
  if (!self->_mutableDictionary)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableDictionary = self->_mutableDictionary;
    self->_mutableDictionary = v9;
  }
  if (self->_maximumCount)
  {
    if ([(NSMutableDictionary *)self->_mutableDictionary count] >= self->_maximumCount)
    {
      v11 = [(NSMutableDictionary *)self->_mutableDictionary objectForKeyedSubscript:v6];

      if (!v11)
      {
        v12 = [(WBSMutableOrderedSet *)self->_mutableOrderedSetOfKeys objectAtIndexWithoutAffectingRecency:0];
        [(NSMutableDictionary *)self->_mutableDictionary removeObjectForKey:v12];
        [(WBSMutableOrderedSet *)self->_mutableOrderedSetOfKeys removeObject:v12];
      }
    }
  }
  [(WBSMutableOrderedSet *)self->_mutableOrderedSetOfKeys addObject:v6];
  [(NSMutableDictionary *)self->_mutableDictionary setObject:v13 forKeyedSubscript:v6];
}

- (WBSMutableOrderedDictionary)init
{
  return [(WBSMutableOrderedDictionary *)self initWithMaximumCount:0];
}

- (WBSMutableOrderedDictionary)initWithMaximumCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBSMutableOrderedDictionary;
  v4 = [(WBSMutableOrderedDictionary *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_maximumCount = a3;
    id v6 = v4;
  }

  return v5;
}

- (NSArray)orderedKeys
{
  return [(WBSMutableOrderedSet *)self->_mutableOrderedSetOfKeys array];
}

- (id)objectForKey:(id)a3
{
  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  id v5 = a3;
  [(WBSMutableOrderedSet *)mutableOrderedSetOfKeys markObjectAsRecentlyUsed:v5];
  id v6 = [(NSMutableDictionary *)self->_mutableDictionary objectForKeyedSubscript:v5];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  id v5 = a3;
  [(WBSMutableOrderedSet *)mutableOrderedSetOfKeys removeObject:v5];
  [(NSMutableDictionary *)self->_mutableDictionary removeObjectForKey:v5];
}

- (void)removeObjectsForKeys:(id)a3
{
  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  id v5 = a3;
  [(WBSMutableOrderedSet *)mutableOrderedSetOfKeys removeObjectsInArray:v5];
  [(NSMutableDictionary *)self->_mutableDictionary removeObjectsForKeys:v5];
}

- (NSArray)orderedValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(WBSMutableOrderedSet *)self->_mutableOrderedSetOfKeys array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__WBSMutableOrderedDictionary_orderedValues__block_invoke;
  v8[3] = &unk_1E615B2D0;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = (NSArray *)v5;
  return v6;
}

void __44__WBSMutableOrderedDictionary_orderedValues__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:a2];
  [v2 addObject:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
  objc_storeStrong((id *)&self->_mutableOrderedSetOfKeys, 0);
}

@end