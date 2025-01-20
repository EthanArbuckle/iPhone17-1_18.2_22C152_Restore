@interface FCSetValueDictionary
- (FCSetValueDictionary)init;
- (NSMutableDictionary)backingDictionary;
- (id)_setForKey:(id)a3;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)addObjects:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
- (void)setBackingDictionary:(id)a3;
@end

@implementation FCSetValueDictionary

- (id)description
{
  v2 = [(FCSetValueDictionary *)self backingDictionary];
  v3 = [v2 description];

  return v3;
}

- (FCSetValueDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCSetValueDictionary;
  v2 = [(FCSetValueDictionary *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[FCSetValueDictionary allocWithZone:a3] init];
  v5 = [(FCSetValueDictionary *)v4 backingDictionary];
  objc_super v6 = [(FCSetValueDictionary *)self backingDictionary];
  [v5 addEntriesFromDictionary:v6];

  return v4;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(FCSetValueDictionary *)self _setForKey:a4];
  [v7 addObject:v6];
}

- (void)addObjects:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(FCSetValueDictionary *)self _setForKey:a4];
  [v7 unionSet:v6];
}

- (void)removeObjectsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSetValueDictionary *)self backingDictionary];
  [v5 removeObjectForKey:v4];
}

- (id)keyEnumerator
{
  v2 = [(FCSetValueDictionary *)self backingDictionary];
  uint64_t v3 = [v2 keyEnumerator];

  return v3;
}

- (id)_setForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSetValueDictionary *)self backingDictionary];
  id v6 = [v5 objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [v5 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (void)setBackingDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end