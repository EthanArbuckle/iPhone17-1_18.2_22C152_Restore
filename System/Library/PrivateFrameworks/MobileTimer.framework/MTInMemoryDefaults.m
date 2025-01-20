@interface MTInMemoryDefaults
- (MTInMemoryDefaults)init;
- (NSMutableDictionary)storage;
- (float)floatForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 defaultValue:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setStorage:(id)a3;
@end

@implementation MTInMemoryDefaults

- (MTInMemoryDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTInMemoryDefaults;
  v2 = [(MTInMemoryDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    storage = v2->_storage;
    v2->_storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)objectForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  v7 = [(MTInMemoryDefaults *)self objectForKey:a3];
  v8 = v7;
  if (!v7) {
    v7 = v6;
  }
  id v9 = v7;

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(MTInMemoryDefaults *)self storage];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (float)floatForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(MTInMemoryDefaults *)self storage];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  [v8 floatValue];
  float v10 = v9;

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTInMemoryDefaults *)self storage];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v10 = [v6 numberWithFloat:v8];
  float v9 = [(MTInMemoryDefaults *)self storage];
  [v9 setObject:v10 forKeyedSubscript:v7];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MTInMemoryDefaults *)self storage];
  [v5 removeObjectForKey:v4];
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end