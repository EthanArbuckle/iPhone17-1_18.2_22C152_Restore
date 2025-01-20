@interface PRGlobalDebugSettings
+ (id)sharedSettings;
- (BOOL)BOOLForKey:(id)a3;
- (PRGlobalDebugSettings)init;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (int64_t)integerForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PRGlobalDebugSettings

+ (id)sharedSettings
{
  if (qword_1008AA290 != -1) {
    dispatch_once(&qword_1008AA290, &stru_100861588);
  }
  v2 = (void *)qword_1008AA288;

  return v2;
}

- (PRGlobalDebugSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRGlobalDebugSettings;
  v2 = [(PRGlobalDebugSettings *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dict = v2->_dict;
    v2->_dict = v3;
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(PRGlobalDebugSettings *)self willChangeValueForKey:v7];
  [(NSMutableDictionary *)self->_dict setObject:v6 forKey:v7];

  [(PRGlobalDebugSettings *)self didChangeValueForKey:v7];
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  v4 = [(NSMutableDictionary *)self->_dict objectForKey:a3];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PRGlobalDebugSettings *)self objectForKey:v4 ofClass:objc_opt_class()];

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PRGlobalDebugSettings *)self objectForKey:v4 ofClass:objc_opt_class()];

  if (v5) {
    id v6 = [v5 integerValue];
  }
  else {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (void).cxx_destruct
{
}

@end