@interface WeatherInMemoryDefaults
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)synchronize;
- (BOOL)synchronizeWasCalled;
- (NSMutableDictionary)inMemoryStore;
- (WeatherInMemoryDefaults)init;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setInMemoryStore:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation WeatherInMemoryDefaults

- (WeatherInMemoryDefaults)init
{
  v8.receiver = self;
  v8.super_class = (Class)WeatherInMemoryDefaults;
  v2 = [(WeatherInMemoryDefaults *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(WeatherInMemoryDefaults *)v2 setInMemoryStore:v3];

    v4 = [(WeatherInMemoryDefaults *)v2 inMemoryStore];
    [v4 setObject:MEMORY[0x263EFFA68] forKey:@"cities"];

    v5 = [(WeatherInMemoryDefaults *)v2 inMemoryStore];
    [v5 setObject:@"2.0" forKey:@"PrefsVersion"];

    v6 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WeatherInMemoryDefaults *)self inMemoryStore];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WeatherInMemoryDefaults *)self inMemoryStore];
  [v8 setObject:v7 forKey:v6];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherInMemoryDefaults *)self inMemoryStore];
  [v5 removeObjectForKey:v4];
}

- (BOOL)BOOLForKey:(id)a3
{
  v3 = [(WeatherInMemoryDefaults *)self objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(WeatherInMemoryDefaults *)self inMemoryStore];
  id v7 = [NSNumber numberWithBool:v4];
  [v8 setObject:v7 forKey:v6];
}

- (BOOL)synchronize
{
  self->_synchronizeWasCalled = 1;
  return 1;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  [(WeatherInMemoryDefaults *)self synchronize];
  v4[2](v4, 0);
}

- (NSMutableDictionary)inMemoryStore
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInMemoryStore:(id)a3
{
}

- (BOOL)synchronizeWasCalled
{
  return self->_synchronizeWasCalled;
}

- (void).cxx_destruct
{
}

@end