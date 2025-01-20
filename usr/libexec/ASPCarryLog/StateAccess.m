@interface StateAccess
- (NSUserDefaults)aspCarryDefaults;
- (StateAccess)init;
- (id)getAllKeys;
- (id)getValueForKey:(id)a3 expectedType:(int)a4;
- (id)getValueForKey:(id)a3 inDomain:(id)a4 expectedType:(int)a5;
- (void)deleteKey:(id)a3;
- (void)setAspCarryDefaults:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 inDomain:(id)a5;
@end

@implementation StateAccess

- (StateAccess)init
{
  v7.receiver = self;
  v7.super_class = (Class)StateAccess;
  v2 = [(StateAccess *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    aspCarryDefaults = v2->_aspCarryDefaults;
    v2->_aspCarryDefaults = (NSUserDefaults *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)deleteKey:(id)a3
{
  id v4 = a3;
  id v5 = [(StateAccess *)self aspCarryDefaults];
  [v5 removeObjectForKey:v4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(StateAccess *)self aspCarryDefaults];
  [v8 setObject:v7 forKey:v6];
}

- (void)setValue:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  v11 = [(StateAccess *)self aspCarryDefaults];
  v12 = [v11 persistentDomainForName:v9];

  if (v12) {
    id v13 = [v12 mutableCopy];
  }
  else {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v14 = v13;
  [v13 setObject:v16 forKeyedSubscript:v8];
  v15 = [(StateAccess *)self aspCarryDefaults];
  [v15 setPersistentDomain:v14 forName:v9];
}

- (id)getValueForKey:(id)a3 expectedType:(int)a4
{
  id v6 = a3;
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  id v7 = [(StateAccess *)self aspCarryDefaults];
  id v8 = [v7 objectForKey:v6];

  if (a4 <= 3 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
  }

  return v8;
}

- (id)getValueForKey:(id)a3 inDomain:(id)a4 expectedType:(int)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  v10 = [(StateAccess *)self aspCarryDefaults];
  v11 = [v10 persistentDomainForName:v8];

  v12 = [v11 objectForKey:v9];

  if (a5 <= 3 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v12 = 0;
  }

  return v12;
}

- (id)getAllKeys
{
  v2 = [(StateAccess *)self aspCarryDefaults];
  uint64_t v3 = [v2 dictionaryRepresentation];
  id v4 = [v3 allKeys];

  return v4;
}

- (NSUserDefaults)aspCarryDefaults
{
  return self->_aspCarryDefaults;
}

- (void)setAspCarryDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end