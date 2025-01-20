@interface NDTServerState
- (BOOL)getBoolValueForKey:(id)a3 default:(BOOL)a4;
- (NDTServerState)initWithPath:(id)a3;
- (double)getDoubleValueForKey:(id)a3 default:(double)a4;
- (id)getStringValueForKey:(id)a3 default:(id)a4;
- (int64_t)getIntegerValueForKey:(id)a3 default:(int64_t)a4;
- (void)_migrateFrom:(id)a3 to:(id)a4;
- (void)deleteKey:(id)a3;
- (void)setBoolValue:(BOOL)a3 forKey:(id)a4;
- (void)setDoubleValue:(double)a3 forKey:(id)a4;
- (void)setIntegerValue:(int64_t)a3 forKey:(id)a4;
- (void)setStringValue:(id)a3 forKey:(id)a4;
@end

@implementation NDTServerState

- (NDTServerState)initWithPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NDTServerState;
  v5 = [(NDTServerState *)&v15 init];
  if (v5)
  {
    id v6 = v4;
    v7 = v6;
    if ([v6 hasSuffix:@".plist"])
    {
      v8 = [v6 substringWithRange:0, [v6 length] - 6];

      v7 = [v8 stringByAppendingString:@".sqlitedb"];
    }
    objc_storeStrong((id *)&v5->_path, v7);
    v9 = [[NDTSQFile alloc] initWithPath:v5->_path];
    file = v5->_file;
    v5->_file = v9;

    v11 = [[NDTSQKeyValueStore alloc] initWithName:@"ServerState"];
    store = v5->_store;
    v5->_store = v11;

    [(NDTSQFile *)v5->_file addSchema:v5->_store];
    v13 = +[NSFileManager defaultManager];
    if ([v13 fileExistsAtPath:v6])
    {
      [(NDTServerState *)v5 _migrateFrom:v6 to:v7];
      [v13 removeItemAtPath:v6 error:0];
    }
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)_migrateFrom:(id)a3 to:(id)a4
{
  v5 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", a3, a4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(NDTSQKeyValueStore *)self->_store setString:v11 forKey:v10];
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          store = self->_store;
          [v11 doubleValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          store = self->_store;
          [v11 timeIntervalSinceReferenceDate];
        }
        -[NDTSQKeyValueStore setDouble:forKey:](store, "setDouble:forKey:", v10);
LABEL_13:
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)setStringValue:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store setString:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)getStringValueForKey:(id)a3 default:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = [(NDTSQKeyValueStore *)self->_store getStringForKey:v8 default:v7];

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setIntegerValue:(int64_t)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store setInteger:a3 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)getIntegerValueForKey:(id)a3 default:(int64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  int64_t v8 = [(NDTSQKeyValueStore *)self->_store getIntegerForKey:v7 default:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setDoubleValue:(double)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store setDouble:v7 forKey:a3];

  os_unfair_lock_unlock(p_lock);
}

- (double)getDoubleValueForKey:(id)a3 default:(double)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store getDoubleForKey:v7 default:a4];
  double v9 = v8;

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)setBoolValue:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store setInteger:v4 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)getBoolValueForKey:(id)a3 default:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  int64_t v8 = [(NDTSQKeyValueStore *)self->_store getIntegerForKey:v7 default:v4];

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

- (void)deleteKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NDTSQKeyValueStore *)self->_store deleteValueForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end