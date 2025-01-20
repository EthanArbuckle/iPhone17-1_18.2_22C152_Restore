@interface SignpostCAStallAggregation
- (NSDictionary)executablePathToStallAggregation;
- (SignpostCAProcessStallAggregation)systemAggregation;
- (SignpostCAStallAggregation)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4 procExecutablePath:(id)a5 responsiblePID:(int)a6 aggregateForSystem:(BOOL)a7;
- (void)_addSystemDuration:(unint64_t)a3 ofType:(unsigned __int8)a4;
@end

@implementation SignpostCAStallAggregation

- (void)_addSystemDuration:(unint64_t)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = [(SignpostCAStallAggregation *)self systemAggregation];
  [v6 _addDuration:a3 ofType:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[SignpostCAStallAggregation allocWithZone:a3] init];
  v5 = [(SignpostCAStallAggregation *)self systemAggregation];
  uint64_t v6 = [v5 copy];
  systemAggregation = v4->_systemAggregation;
  v4->_systemAggregation = (SignpostCAProcessStallAggregation *)v6;

  v8 = [(SignpostCAStallAggregation *)self executablePathToStallAggregation];
  uint64_t v9 = [v8 copy];
  executablePathToStallAggregation = v4->_executablePathToStallAggregation;
  v4->_executablePathToStallAggregation = (NSDictionary *)v9;

  return v4;
}

- (SignpostCAStallAggregation)init
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostCAStallAggregation;
  v2 = [(SignpostCAStallAggregation *)&v8 init];
  if (v2)
  {
    v3 = [[SignpostCAProcessStallAggregation alloc] _initAsSystemAggregation];
    systemAggregation = v2->_systemAggregation;
    v2->_systemAggregation = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    executablePathToStallAggregation = v2->_executablePathToStallAggregation;
    v2->_executablePathToStallAggregation = (NSDictionary *)v5;
  }
  return v2;
}

- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4 procExecutablePath:(id)a5 responsiblePID:(int)a6 aggregateForSystem:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = a4;
  id v18 = a5;
  v12 = [(SignpostCAStallAggregation *)self executablePathToStallAggregation];
  id v13 = [v12 objectForKeyedSubscript:v18];

  if (!v13)
  {
    id v13 = [[SignpostCAProcessStallAggregation alloc] _initWithProcessExecutablePath:v18 pid:v8];
    v14 = [(SignpostCAStallAggregation *)self executablePathToStallAggregation];
    [v14 setObject:v13 forKeyedSubscript:v18];
  }
  [v13 _addDuration:a3 ofType:v9];
  v15 = [v13 pids];
  v16 = [NSNumber numberWithInt:v8];
  [v15 addObject:v16];

  if (v7)
  {
    v17 = [(SignpostCAStallAggregation *)self systemAggregation];
    [v17 _addDuration:a3 ofType:v9];
  }
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(SignpostCAStallAggregation *)self executablePathToStallAggregation];
  uint64_t v5 = [v4 allValues];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 sortUsingComparator:&__block_literal_global_24];
  BOOL v7 = [(SignpostCAStallAggregation *)self systemAggregation];
  [v6 insertObject:v7 atIndex:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v3 appendFormat:@"%@\n", v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

uint64_t __41__SignpostCAStallAggregation_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(a2, "_totalStallDurationNs"));
  BOOL v7 = NSNumber;
  uint64_t v8 = [v5 _totalStallDurationNs];

  uint64_t v9 = [v7 numberWithUnsignedLongLong:v8];
  uint64_t v10 = [v9 compare:v6];

  return v10;
}

- (SignpostCAProcessStallAggregation)systemAggregation
{
  return self->_systemAggregation;
}

- (NSDictionary)executablePathToStallAggregation
{
  return self->_executablePathToStallAggregation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePathToStallAggregation, 0);

  objc_storeStrong((id *)&self->_systemAggregation, 0);
}

@end