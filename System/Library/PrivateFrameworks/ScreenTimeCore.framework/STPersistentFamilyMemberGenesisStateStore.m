@interface STPersistentFamilyMemberGenesisStateStore
+ (id)_loadFromKeyValueStore:(id)a3;
- (NSDictionary)genesisStateItemsByUserDSID;
- (STKeyValueStore)keyValueStore;
- (STPersistentFamilyMemberGenesisStateStore)initWithKeyValueStore:(id)a3;
- (id)readFamilyMemberGenesisStateItems;
- (void)_saveToKeyValueStore;
- (void)setGenesisStateItemsByUserDSID:(id)a3;
- (void)writeFamilyMemberGenesisStateItems:(id)a3;
@end

@implementation STPersistentFamilyMemberGenesisStateStore

- (STPersistentFamilyMemberGenesisStateStore)initWithKeyValueStore:(id)a3
{
  v4 = (STKeyValueStore *)a3;
  v11.receiver = self;
  v11.super_class = (Class)STPersistentFamilyMemberGenesisStateStore;
  v5 = [(STPersistentFamilyMemberGenesisStateStore *)&v11 init];
  keyValueStore = v5->_keyValueStore;
  v5->_keyValueStore = v4;
  v7 = v4;

  uint64_t v8 = +[STPersistentFamilyMemberGenesisStateStore _loadFromKeyValueStore:v5->_keyValueStore];
  genesisStateItemsByUserDSID = v5->_genesisStateItemsByUserDSID;
  v5->_genesisStateItemsByUserDSID = (NSDictionary *)v8;

  return v5;
}

- (void)writeFamilyMemberGenesisStateItems:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "userID", (void)v15);
        v13 = [v12 dsid];
        [v5 setObject:v11 forKeyedSubscript:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];
  [(STPersistentFamilyMemberGenesisStateStore *)self setGenesisStateItemsByUserDSID:v14];

  [(STPersistentFamilyMemberGenesisStateStore *)self _saveToKeyValueStore];
}

- (id)readFamilyMemberGenesisStateItems
{
  v2 = [(STPersistentFamilyMemberGenesisStateStore *)self genesisStateItemsByUserDSID];
  v3 = [v2 allValues];
  id v4 = +[NSSet setWithArray:v3];

  return v4;
}

- (void)_saveToKeyValueStore
{
  v3 = [(STPersistentFamilyMemberGenesisStateStore *)self genesisStateItemsByUserDSID];
  id v7 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
  id v5 = v7;

  if (v4)
  {
    id v6 = [(STPersistentFamilyMemberGenesisStateStore *)self keyValueStore];
    [v6 persistValue:v4 forKey:@"genesisStateItemsByUserDSID"];
  }
  else
  {
    id v6 = +[STLog familyMemberGenesisStateStore];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100262388((uint64_t)v5, v6);
    }
  }
}

+ (id)_loadFromKeyValueStore:(id)a3
{
  v3 = [a3 readValueForKey:@"genesisStateItemsByUserDSID"];
  if (v3)
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    id v4 = +[NSArray arrayWithObjects:v15 count:3];
    id v5 = +[NSSet setWithArray:v4];
    id v13 = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v3 error:&v13];
    id v7 = v13;

    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_super v11 = +[STLog familyMemberGenesisStateStore];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100262400((uint64_t)v7, v11);
      }

      id v8 = (id)objc_opt_new();
    }
    v10 = v8;
  }
  else
  {
    uint64_t v9 = +[STLog familyMemberGenesisStateStore];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No existing genesis store items to load", buf, 2u);
    }

    v10 = objc_opt_new();
  }

  return v10;
}

- (STKeyValueStore)keyValueStore
{
  return (STKeyValueStore *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)genesisStateItemsByUserDSID
{
  return self->_genesisStateItemsByUserDSID;
}

- (void)setGenesisStateItemsByUserDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genesisStateItemsByUserDSID, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

@end