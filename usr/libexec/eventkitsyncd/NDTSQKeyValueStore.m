@interface NDTSQKeyValueStore
- (BOOL)compareAndSwapIntegerValue:(int64_t)a3 expectedExistingValue:(int64_t)a4 forKey:(id)a5;
- (NDTSQKeyValueStore)initWithName:(id)a3;
- (double)getDoubleForKey:(id)a3 default:(double)a4;
- (id)getDataForKey:(id)a3 default:(id)a4;
- (id)getStringForKey:(id)a3 default:(id)a4;
- (id)instanceName;
- (int64_t)currentVersion;
- (int64_t)getIntegerForKey:(id)a3 default:(int64_t)a4;
- (void)createTables;
- (void)deleteValueForKey:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation NDTSQKeyValueStore

- (NDTSQKeyValueStore)initWithName:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NDTSQKeyValueStore;
  v6 = [(NDTSQKeyValueStore *)&v16 init];
  if (v6)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"select value from %@ where key = ?", v5];
    select = v6->_select;
    v6->_select = (NSString *)v7;

    uint64_t v9 = +[NSString stringWithFormat:@"update %@ set value = ? where value = ? and key = ?", v5];
    exchange = v6->_exchange;
    v6->_exchange = (NSString *)v9;

    uint64_t v11 = +[NSString stringWithFormat:@"insert or replace into %@ (key, value) values (?, ?)", v5];
    insert = v6->_insert;
    v6->_insert = (NSString *)v11;

    uint64_t v13 = +[NSString stringWithFormat:@"delete from %@ where key = ?", v5];
    delete = v6->_delete;
    v6->_delete = (NSString *)v13;

    objc_storeStrong((id *)&v6->_baseName, a3);
  }

  return v6;
}

- (void)createTables
{
  id v3 = +[NSString stringWithFormat:@"create table if not exists %@ (key text unique, value text)", self->_baseName];
  [(NDTSQSchema *)self executeSql:v3];
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)instanceName
{
  return +[NSString stringWithFormat:@"NDTSQKeyValueStore:%@", self->_baseName];
}

- (int64_t)getIntegerForKey:(id)a3 default:(int64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int64_t v17 = a4;
  select = self->_select;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015B48;
  v11[3] = &unk_1000A8EE8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  [(NDTSQSchema *)self parseSql:select andRun:v11];
  int64_t v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  insert = self->_insert;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015C54;
  v9[3] = &unk_1000A8F10;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(NDTSQSchema *)self parseSql:insert andRun:v9];
}

- (BOOL)compareAndSwapIntegerValue:(int64_t)a3 expectedExistingValue:(int64_t)a4 forKey:(id)a5
{
  id v8 = a5;
  exchange = self->_exchange;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015D7C;
  v12[3] = &unk_1000A8F38;
  int64_t v14 = a3;
  int64_t v15 = a4;
  id v13 = v8;
  id v10 = v8;
  [(NDTSQSchema *)self parseSql:exchange andRun:v12];
  LOBYTE(a3) = (id)[(NDTSQSchema *)self changes] == (id)1;

  return a3;
}

- (double)getDoubleForKey:(id)a3 default:(double)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  int64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  double v17 = a4;
  select = self->_select;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015EE0;
  v11[3] = &unk_1000A8EE8;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  [(NDTSQSchema *)self parseSql:select andRun:v11];
  double v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  insert = self->_insert;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015FF8;
  v9[3] = &unk_1000A8F10;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  [(NDTSQSchema *)self parseSql:insert andRun:v9];
}

- (id)getStringForKey:(id)a3 default:(id)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000161B0;
  v19 = sub_1000161C0;
  id v7 = a4;
  id v20 = v7;
  select = self->_select;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000161C8;
  v12[3] = &unk_1000A8EE8;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [(NDTSQSchema *)self parseSql:select andRun:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  insert = self->_insert;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016300;
  v11[3] = &unk_1000A8F60;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NDTSQSchema *)self parseSql:insert andRun:v11];
}

- (id)getDataForKey:(id)a3 default:(id)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000161B0;
  v19 = sub_1000161C0;
  id v7 = a4;
  id v20 = v7;
  select = self->_select;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000164B8;
  v12[3] = &unk_1000A8EE8;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [(NDTSQSchema *)self parseSql:select andRun:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  insert = self->_insert;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000165F0;
  v11[3] = &unk_1000A8F60;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NDTSQSchema *)self parseSql:insert andRun:v11];
}

- (void)deleteValueForKey:(id)a3
{
  id v4 = a3;
  delete = self->_delete;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000166F8;
  v7[3] = &unk_1000A8F88;
  id v8 = v4;
  id v6 = v4;
  [(NDTSQSchema *)self parseSql:delete andRun:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_delete, 0);
  objc_storeStrong((id *)&self->_select, 0);
  objc_storeStrong((id *)&self->_exchange, 0);

  objc_storeStrong((id *)&self->_insert, 0);
}

@end