@interface PLLibraryScopeConditionUnknown
+ (BOOL)supportsQueryKey:(int)a3;
+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4;
- (NSArray)unknownSingleQueries;
- (id)conditionQuery;
- (unsigned)type;
- (void)setUnknownSingleQueries:(id)a3;
@end

@implementation PLLibraryScopeConditionUnknown

+ (BOOL)supportsQueryKey:(int)a3
{
  return 1;
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithCriteria:v4];
  [v7 setUnknownSingleQueries:v6];

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setUnknownSingleQueries:(id)a3
{
}

- (NSArray)unknownSingleQueries
{
  return self->_unknownSingleQueries;
}

- (id)conditionQuery
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9A0]);
  [v3 setConjunction:0];
  uint64_t v4 = (void *)[(NSArray *)self->_unknownSingleQueries mutableCopy];
  [v3 setSingleQueries:v4];

  return v3;
}

- (unsigned)type
{
  return 0;
}

@end