@interface FCKeyValueStore
- (BOOL)hasMaxForKey:(id)a3;
- (BOOL)hasMinForKey:(id)a3;
- (double)maxForKey:(id)a3;
- (double)minForKey:(id)a3;
- (id)ringBufferForKey:(id)a3;
- (id)ringBufferForKey:(id)a3 capacity:(unint64_t)a4;
- (void)setRingBuffers:(id)a3;
@end

@implementation FCKeyValueStore

- (id)ringBufferForKey:(id)a3 capacity:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  v7 = [(FCKeyValueStore *)self objectForKeyedSubscript:v6];

  v8 = FCDynamicCast();

  v9 = [[FRRingBuffer alloc] initWithCapacity:a4 dictionary:v8];

  return v9;
}

- (id)ringBufferForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(FCKeyValueStore *)self objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  v7 = [[FRRingBuffer alloc] initWithCapacity:75 dictionary:v6];

  return v7;
}

- (void)setRingBuffers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100064714;
  v3[3] = &unk_1000CA000;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (BOOL)hasMinForKey:(id)a3
{
  [(FCKeyValueStore *)self minForKey:a3];
  return v3 != 1.79769313e308;
}

- (BOOL)hasMaxForKey:(id)a3
{
  [(FCKeyValueStore *)self maxForKey:a3];
  return v3 != -1.79769313e308;
}

- (double)minForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(FCKeyValueStore *)self objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  objc_opt_class();
  v7 = [v6 objectForKeyedSubscript:@"Min"];
  v8 = FCDynamicCast();

  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 1.79769313e308;
  }

  return v10;
}

- (double)maxForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(FCKeyValueStore *)self objectForKeyedSubscript:v4];

  id v6 = FCDynamicCast();

  objc_opt_class();
  v7 = [v6 objectForKeyedSubscript:@"Max"];
  v8 = FCDynamicCast();

  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = -1.79769313e308;
  }

  return v10;
}

@end