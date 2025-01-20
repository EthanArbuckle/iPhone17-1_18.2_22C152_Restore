@interface WatchSyncedPreferences
- (BOOL)hasAnyNonStandardPreferences;
- (BOOL)isEqual:(id)a3;
- (NSArray)_keys;
- (NSArray)_values;
- (NSUserDefaults)defaults;
- (WatchSyncedPreferences)initWithCopy:(id)a3;
- (WatchSyncedPreferences)initWithDefaults:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_forEachKeyAndValueWithBlock:(id)a3;
- (void)synchronize;
@end

@implementation WatchSyncedPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)synchronize
{
  v3 = sub_1000B522C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Saving %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B53AC;
  v7[3] = &unk_1012F54A0;
  v7[4] = self;
  [(WatchSyncedPreferences *)self _forEachKeyAndValueWithBlock:v7];
  manager = self->_manager;
  v5 = [(WatchSyncedPreferences *)self _keys];
  v6 = +[NSSet setWithArray:v5];
  [(NPSManager *)manager synchronizeUserDefaultsDomain:@"com.apple.Maps" keys:v6 container:@"com.apple.Maps"];
}

- (void)_forEachKeyAndValueWithBlock:(id)a3
{
  v13 = (void (**)(id, void *, void *, unint64_t))a3;
  v4 = [(WatchSyncedPreferences *)self _keys];
  v5 = [(WatchSyncedPreferences *)self _values];
  id v6 = [v4 count];
  if (v6 >= [v5 count]) {
    v7 = v5;
  }
  else {
    v7 = v4;
  }
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v4 objectAtIndexedSubscript:v8];
      v10 = [v5 objectAtIndexedSubscript:v8];
      v13[2](v13, v9, v10, v8);

      ++v8;
      id v11 = [v4 count];
      if (v11 >= [v5 count]) {
        v12 = v5;
      }
      else {
        v12 = v4;
      }
    }
    while (v8 < (unint64_t)[v12 count]);
  }
}

- (WatchSyncedPreferences)initWithDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WatchSyncedPreferences;
  id v6 = [(WatchSyncedPreferences *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    manager = v6->_manager;
    v6->_manager = (NPSManager *)v7;

    objc_storeStrong((id *)&v6->_defaults, a3);
    [(WatchSyncedPreferences *)v6 loadValuesFromDefaults];
  }

  return v6;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (WatchSyncedPreferences)initWithCopy:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)WatchSyncedPreferences;
  id v5 = [(WatchSyncedPreferences *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    manager = v5->_manager;
    v5->_manager = (NPSManager *)v6;

    objc_storeStrong((id *)&v5->_defaults, v4[2]);
  }

  return v5;
}

- (NSArray)_keys
{
  return 0;
}

- (NSArray)_values
{
  return 0;
}

- (BOOL)hasAnyNonStandardPreferences
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WatchSyncedPreferences *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(WatchSyncedPreferences *)v5 _keys];
      uint64_t v7 = [(WatchSyncedPreferences *)v5 _values];
      unint64_t v8 = [(WatchSyncedPreferences *)self _keys];
      id v9 = [v8 count];
      if (v9 == [v6 count])
      {
        objc_super v10 = [(WatchSyncedPreferences *)self _values];
        id v11 = [v10 count];
        id v12 = [v7 count];

        if (v11 == v12)
        {
          uint64_t v19 = 0;
          v20 = &v19;
          uint64_t v21 = 0x2020000000;
          char v22 = 1;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1006D63E4;
          v15[3] = &unk_1012F5478;
          v18 = &v19;
          id v16 = v6;
          id v17 = v7;
          [(WatchSyncedPreferences *)self _forEachKeyAndValueWithBlock:v15];
          BOOL v13 = *((unsigned char *)v20 + 24) != 0;

          _Block_object_dispose(&v19, 8);
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
      }
      BOOL v13 = 0;
      goto LABEL_10;
    }
    BOOL v13 = 0;
  }
LABEL_11:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(WatchSyncedPreferences *)self _keys];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(WatchSyncedPreferences *)self _values];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  unint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  objc_super v10 = sub_1006D6644;
  id v11 = &unk_1012F54A0;
  id v12 = (id)objc_opt_new();
  id v3 = v12;
  [(WatchSyncedPreferences *)self _forEachKeyAndValueWithBlock:&v8];
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 componentsJoinedByString:@", "];
  unint64_t v6 = +[NSString stringWithFormat:@"<%@: %p> %@", v4, self, v5, v8, v9, v10, v11];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return _[v4 initWithCopy:self];
}

@end