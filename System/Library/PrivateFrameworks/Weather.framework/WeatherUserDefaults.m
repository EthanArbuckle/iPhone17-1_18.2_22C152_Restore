@interface WeatherUserDefaults
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)synchronize;
- (NSUserDefaults)userDefaults;
- (WeatherUserDefaults)initWithUserDefaults:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUserDefaults:(id)a3;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation WeatherUserDefaults

- (WeatherUserDefaults)initWithUserDefaults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WeatherUserDefaults;
  v5 = [(WeatherUserDefaults *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(WeatherUserDefaults *)v5 setUserDefaults:v4];
    v7 = v6;
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WeatherUserDefaults *)self userDefaults];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WeatherUserDefaults *)self userDefaults];
  [v8 setObject:v7 forKey:v6];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherUserDefaults *)self userDefaults];
  [v5 removeObjectForKey:v4];
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherUserDefaults *)self userDefaults];
  id v6 = [v5 arrayForKey:v4];

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherUserDefaults *)self userDefaults];
  id v6 = [v5 stringForKey:v4];

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherUserDefaults *)self userDefaults];
  id v6 = [v5 dictionaryForKey:v4];

  return v6;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherUserDefaults *)self userDefaults];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WeatherUserDefaults *)self userDefaults];
  [v7 setBool:v4 forKey:v6];
}

- (BOOL)synchronize
{
  v2 = [(WeatherUserDefaults *)self userDefaults];
  char v3 = [v2 synchronize];

  return v3;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  [(WeatherUserDefaults *)self synchronize];
  v4[2](v4, 0);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end