@interface MTFrozenBag
- (BOOL)isExpired;
- (MTFrozenBag)initWithConfig:(id)a3;
- (MTFrozenBag)initWithProfile:(id)a3 profileVersion:(id)a4 config:(id)a5;
- (NSDate)expirationDate;
- (NSDictionary)config;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)setConfig:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation MTFrozenBag

- (MTFrozenBag)initWithProfile:(id)a3 profileVersion:(id)a4 config:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MTFrozenBag;
  v12 = [(MTFrozenBag *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    config = v12->_config;
    v12->_config = (NSDictionary *)v13;

    objc_storeStrong((id *)&v12->_profile, a3);
    objc_storeStrong((id *)&v12->_profileVersion, a4);
  }

  return v12;
}

- (MTFrozenBag)initWithConfig:(id)a3
{
  return [(MTFrozenBag *)self initWithProfile:@"frozen" profileVersion:@"1.0" config:a3];
}

- (BOOL)isExpired
{
  v2 = [(MTFrozenBag *)self expirationDate];
  v3 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceDate:v3];
  BOOL v5 = v4 < 0.0;

  return v5;
}

- (NSDate)expirationDate
{
  v2 = (void *)MEMORY[0x263EFF910];
  v3 = [MEMORY[0x263EFF910] date];
  double v4 = [v2 dateWithTimeInterval:v3 sinceDate:86400.0];

  return (NSDate *)v4;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no array value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:0];

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no BOOLean value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:1];

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no double value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:2];

  return v7;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no integer value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:3];

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no string value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:4];

  return v7;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no url value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:5];

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTFrozenBag *)self config];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [NSString stringWithFormat:@"There is no dictionary value for key %@", v4];
    id v11 = [v9 exceptionWithName:@"MTFrozenBag" reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }
  v7 = [MEMORY[0x263F27B50] frozenBagValueWithKey:v4 value:v6 valueType:6];

  return v7;
}

- (void)createSnapshotWithCompletion:(id)a3
{
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end