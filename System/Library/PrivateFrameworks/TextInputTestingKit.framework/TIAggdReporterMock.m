@interface TIAggdReporterMock
- (NSMutableDictionary)distributions;
- (NSMutableDictionary)scalars;
- (TIAggdReporterMock)init;
- (id)getDistributionObject:(id)a3;
- (id)toDictionary;
- (id)toJsonString;
- (int)commit;
- (int64_t)_getScalar:(id)a3;
- (int64_t)getScalar:(id)a3;
- (void)_setScalar:(id)a3 withValue:(int64_t)a4;
- (void)addValue:(int64_t)a3 forKey:(id)a4;
- (void)clear;
- (void)clearDistributionKey:(id)a3;
- (void)clearScalarKey:(id)a3;
- (void)decrementKey:(id)a3;
- (void)incrementKey:(id)a3;
- (void)pushValue:(double)a3 forKey:(id)a4;
- (void)setScalar:(id)a3 withValue:(int64_t)a4;
- (void)setValue:(double)a3 forDistributionKey:(id)a4;
- (void)setValue:(int64_t)a3 forScalarKey:(id)a4;
- (void)subtractValue:(int64_t)a3 forKey:(id)a4;
@end

@implementation TIAggdReporterMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributions, 0);
  objc_storeStrong((id *)&self->_scalars, 0);
}

- (NSMutableDictionary)distributions
{
  return self->_distributions;
}

- (NSMutableDictionary)scalars
{
  return self->_scalars;
}

- (id)getDistributionObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(TIAggdReporterMock *)v5 distributions];
  v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)pushValue:(double)a3 forKey:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = [(TIAggdReporterMock *)v6 distributions];
    v8 = [v7 objectForKeyedSubscript:v11];

    if (!v8)
    {
      v8 = [MEMORY[0x263EFF980] arrayWithArray:MEMORY[0x263EFFA68]];
      v9 = [(TIAggdReporterMock *)v6 distributions];
      [v9 setObject:v8 forKey:v11];
    }
    v10 = [NSNumber numberWithDouble:a3];
    [v8 addObject:v10];

    objc_sync_exit(v6);
  }
}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = [(TIAggdReporterMock *)v7 distributions];
    v9 = (void *)MEMORY[0x263EFF980];
    v10 = [NSNumber numberWithDouble:a3];
    v13[0] = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v12 = [v9 arrayWithArray:v11];
    [v8 setObject:v12 forKey:v6];

    objc_sync_exit(v7);
  }
}

- (void)clearDistributionKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    id v6 = [(TIAggdReporterMock *)v5 distributions];
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)decrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(TIAggdReporterMock *)v4 _setScalar:v5 withValue:[(TIAggdReporterMock *)v4 getScalar:v5] - 1];
  objc_sync_exit(v4);
}

- (void)incrementKey:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(TIAggdReporterMock *)v4 _setScalar:v5 withValue:[(TIAggdReporterMock *)v4 getScalar:v5] + 1];
  objc_sync_exit(v4);
}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:[(TIAggdReporterMock *)v6 getScalar:v7] - a3];
  objc_sync_exit(v6);
}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:[(TIAggdReporterMock *)v6 getScalar:v7] + a3];
  objc_sync_exit(v6);
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:a3];
  objc_sync_exit(v6);
}

- (void)clearScalarKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(TIAggdReporterMock *)v5 scalars];
    [v6 removeObjectForKey:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)_setScalar:(id)a3 withValue:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = [(TIAggdReporterMock *)self scalars];
    id v7 = [NSNumber numberWithInt:a4];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)setScalar:(id)a3 withValue:(int64_t)a4
{
  id v7 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  [(TIAggdReporterMock *)v6 _setScalar:v7 withValue:a4];
  objc_sync_exit(v6);
}

- (int64_t)_getScalar:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(TIAggdReporterMock *)self scalars],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [(TIAggdReporterMock *)self scalars];
    id v8 = [v7 objectForKeyedSubscript:v4];
    int64_t v9 = [v8 longLongValue];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)getScalar:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = [(TIAggdReporterMock *)v5 _getScalar:v4];
  objc_sync_exit(v5);

  return v6;
}

- (int)commit
{
  return 0;
}

- (id)toJsonString
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(TIAggdReporterMock *)self toDictionary];
  uint64_t v7 = 0;
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:&v7];

  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  return v5;
}

- (id)toDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v7[0] = @"scalars";
  v3 = [(TIAggdReporterMock *)v2 scalars];
  v7[1] = @"distributions";
  v8[0] = v3;
  id v4 = [(TIAggdReporterMock *)v2 distributions];
  v8[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  objc_sync_exit(v2);
  return v5;
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(TIAggdReporterMock *)obj scalars];
  [v2 removeAllObjects];

  v3 = [(TIAggdReporterMock *)obj distributions];
  [v3 removeAllObjects];

  objc_sync_exit(obj);
}

- (TIAggdReporterMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIAggdReporterMock;
  v2 = [(TIAggdReporterMock *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    scalars = v2->_scalars;
    v2->_scalars = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    distributions = v2->_distributions;
    v2->_distributions = v5;
  }
  return v2;
}

@end