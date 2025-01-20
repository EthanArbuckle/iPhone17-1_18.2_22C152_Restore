@interface RCDatabaseMetadata
- (BOOL)dirty;
- (RCDatabaseMetadata)initWithPersistentStore:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)migrate:(id)a3;
- (void)save;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation RCDatabaseMetadata

- (RCDatabaseMetadata)initWithPersistentStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RCDatabaseMetadata;
  v6 = [(RCDatabaseMetadata *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v8 = [v5 persistentStoreCoordinator];
    coordinator = v7->_coordinator;
    v7->_coordinator = (NSPersistentStoreCoordinator *)v8;

    v10 = [(NSPersistentStore *)v7->_store metadata];
    v11 = [v10 objectForKeyedSubscript:@"com.apple.VoiceMemos.DatabaseProperties"];
    id v12 = [v11 mutableCopy];
    v13 = v12;
    if (v12) {
      v14 = (NSMutableDictionary *)v12;
    }
    else {
      v14 = (NSMutableDictionary *)objc_opt_new();
    }
    metadata = v7->_metadata;
    v7->_metadata = v14;
  }
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100007E38;
  v16 = sub_1000103C4;
  id v17 = 0;
  coordinator = self->_coordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000103CC;
  v9[3] = &unk_100038FB0;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NSPersistentStoreCoordinator *)coordinator performBlockAndWait:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  coordinator = self->_coordinator;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000104E4;
  v11[3] = &unk_100038CF8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NSPersistentStoreCoordinator *)coordinator performBlockAndWait:v11];
}

- (void)save
{
  coordinator = self->_coordinator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010594;
  v3[3] = &unk_100038D48;
  v3[4] = self;
  [(NSPersistentStoreCoordinator *)coordinator performBlockAndWait:v3];
}

- (void)migrate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100007E38;
  v15 = sub_1000103C4;
  id v16 = 0;
  coordinator = self->_coordinator;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000107B4;
  v10[3] = &unk_100038F08;
  v10[4] = self;
  v10[5] = &v11;
  [(NSPersistentStoreCoordinator *)coordinator performBlockAndWait:v10];
  if ([(id)v12[5] count])
  {
    id v6 = (void *)v4[2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100010800;
    v7[3] = &unk_100038F08;
    id v9 = &v11;
    uint64_t v8 = v4;
    [v6 performBlockAndWait:v7];
  }
  _Block_object_dispose(&v11, 8);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end