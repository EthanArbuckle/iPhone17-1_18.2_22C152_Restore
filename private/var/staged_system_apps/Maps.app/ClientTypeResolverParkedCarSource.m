@interface ClientTypeResolverParkedCarSource
- (BOOL)hasObjectWithType:(int)a3;
- (ClientTypeResolverParkedCarSource)initWithParkedCarManager:(id)a3;
- (ParkedCarManager)parkedCarManager;
- (id)cachedObject;
- (id)knownTypes;
- (void)objectWithCompletion:(id)a3;
- (void)setParkedCarManager:(id)a3;
@end

@implementation ClientTypeResolverParkedCarSource

- (id)knownTypes
{
  return &off_1013AE388;
}

- (ClientTypeResolverParkedCarSource)initWithParkedCarManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClientTypeResolverParkedCarSource;
  v6 = [(ClientTypeResolverParkedCarSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parkedCarManager, a3);
  }

  return v7;
}

- (BOOL)hasObjectWithType:(int)a3
{
  if (![(ClientTypeResolverSource *)self typeIsValid:*(void *)&a3]) {
    return 0;
  }
  v4 = [(ClientTypeResolverParkedCarSource *)self cachedObject];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)cachedObject
{
  v2 = [(ClientTypeResolverParkedCarSource *)self parkedCarManager];
  v3 = [v2 parkedCar];

  return v3;
}

- (ParkedCarManager)parkedCarManager
{
  return self->_parkedCarManager;
}

- (void).cxx_destruct
{
}

- (void)objectWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v7 = v4;
    BOOL v5 = [(ClientTypeResolverParkedCarSource *)self cachedObject];
    if (v5)
    {
      v7[2](v7, v5);
    }
    else
    {
      v6 = [(ClientTypeResolverParkedCarSource *)self parkedCarManager];
      [v6 fetchParkedCar:v7];
    }
    v4 = v7;
  }
}

- (void)setParkedCarManager:(id)a3
{
}

@end