@interface PLLibraryScopeConditionPerson
+ (BOOL)supportsQueryKey:(int)a3;
+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4;
- (BOOL)removePersonUUID:(id)a3;
- (BOOL)replaceTombstonePersonUUID:(id)a3 withPersonUUID:(id)a4;
- (NSArray)personUUIDs;
- (id)conditionQuery;
- (id)description;
- (unsigned)type;
- (void)setPersonUUIDs:(id)a3;
@end

@implementation PLLibraryScopeConditionPerson

- (void).cxx_destruct
{
}

- (void)setPersonUUIDs:(id)a3
{
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (BOOL)removePersonUUID:(id)a3
{
  id v4 = a3;
  v5 = [(PLLibraryScopeConditionPerson *)self personUUIDs];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)[v5 mutableCopy];
    [v7 removeObjectAtIndex:v6];
    [(PLLibraryScopeConditionPerson *)self setPersonUUIDs:v7];
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)replaceTombstonePersonUUID:(id)a3 withPersonUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PLLibraryScopeConditionPerson *)self personUUIDs];
  uint64_t v9 = [v8 indexOfObject:v7];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)[v8 mutableCopy];
    if ([v8 containsObject:v6]) {
      [v10 removeObjectAtIndex:v9];
    }
    else {
      [v10 replaceObjectAtIndex:v9 withObject:v6];
    }
    [(PLLibraryScopeConditionPerson *)self setPersonUUIDs:v10];
  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[&stru_1EEB2EB80 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_personUUIDs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [NSString stringWithFormat:@"%@, ", *(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PLLibraryScopeConditionPerson;
  v11 = [(PLLibraryScopeCondition *)&v14 description];
  v12 = [v10 stringWithFormat:@"%@, Persons: %@", v11, v3];

  return v12;
}

- (id)conditionQuery
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A8]) initWithConjunction:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PLLibraryScopeConditionPerson *)self personUUIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addPersonUUIDInMomentQuery:*(void *)(*((void *)&v11 + 1) + 8 * i) comparator:22];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [v3 query];

  return v9;
}

- (unsigned)type
{
  return 2;
}

+ (BOOL)supportsQueryKey:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 552;
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithCriteria:v4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "stringValue", (void)v17);
        if (([v9 containsObject:v15] & 1) == 0)
        {
          [v9 addObject:v15];
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v7 setPersonUUIDs:v8];
  return v7;
}

@end