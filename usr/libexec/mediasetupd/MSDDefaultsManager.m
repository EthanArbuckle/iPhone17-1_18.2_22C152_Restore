@interface MSDDefaultsManager
+ (id)sharedManager;
- (BOOL)clearObjectForDefault:(id)a3;
- (BOOL)isDeveloperProfileLoaded;
- (BOOL)profilesEverInstalled;
- (BOOL)removeObjectForDefault:(id)a3;
- (BOOL)setObject:(id)a3 forDefault:(id)a4;
- (BOOL)setObjectWithCustomClass:(id)a3 forDefault:(id)a4;
- (MSDDefaultsManager)init;
- (NSDictionary)dictionaryRepresentation;
- (NSUserDefaults)MSDDefaults;
- (NSUserDefaults)MSDDeveloperDefaults;
- (id)_decodeObject:(id)a3 forKey:(id)a4;
- (id)objectForDefault:(id)a3;
- (id)objectForDefaultWithCustomClass:(id)a3;
- (id)objectForKeyInDefaultDomain:(id)a3;
- (id)objectForKeyInDeveloperDomain:(id)a3;
- (unint64_t)developerProfilesCount;
- (void)clearDeveloperDefaults;
- (void)clearPrivateAndSharedLocalData;
- (void)setDeveloperProfilesCount:(unint64_t)a3;
- (void)setMSDDefaults:(id)a3;
- (void)setMSDDeveloperDefaults:(id)a3;
@end

@implementation MSDDefaultsManager

- (void)setDeveloperProfilesCount:(unint64_t)a3
{
}

- (unint64_t)developerProfilesCount
{
  return [(NSUserDefaults *)self->_MSDDeveloperDefaults integerForKey:@"developerProfileCount"];
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000309C;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_100056738 != -1) {
    dispatch_once(&qword_100056738, block);
  }
  v2 = (void *)qword_100056740;

  return v2;
}

- (MSDDefaultsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDDefaultsManager;
  v2 = [(MSDDefaultsManager *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (NSUserDefaults *)[v3 initWithSuiteName:kMediaSetupDeveloperUserDefaultsDomain];
    MSDDeveloperDefaults = v2->_MSDDeveloperDefaults;
    v2->_MSDDeveloperDefaults = v4;

    id v6 = objc_alloc((Class)NSUserDefaults);
    v7 = (NSUserDefaults *)[v6 initWithSuiteName:kMediaSetupUserDefaultsDomain];
    MSDDefaults = v2->_MSDDefaults;
    v2->_MSDDefaults = v7;
  }
  return v2;
}

- (BOOL)setObjectWithCustomClass:(id)a3 forDefault:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v12 = 0;
    v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
    id v8 = v12;
    if (v8)
    {
      v9 = sub_100031A80();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100003BF8((uint64_t)v8, v9);
      }

      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = [(MSDDefaultsManager *)self setObject:v7 forDefault:v6];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setObject:(id)a3 forDefault:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = [(MSDDefaultsManager *)self isDeveloperProfileLoaded];
    uint64_t v9 = 8;
    if (v8) {
      uint64_t v9 = 16;
    }
    [*(id *)((char *)&self->super.isa + v9) setObject:v6 forKey:v7];
  }
  else
  {
    BOOL v10 = sub_100031A80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100003C70();
    }
  }
  return v7 != 0;
}

- (BOOL)clearObjectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSUserDefaults *)self->_MSDDeveloperDefaults removeObjectForKey:v4];
    [(NSUserDefaults *)self->_MSDDefaults removeObjectForKey:v4];
  }
  else
  {
    v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100003CA4();
    }
  }
  return v4 != 0;
}

- (BOOL)removeObjectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(MSDDefaultsManager *)self isDeveloperProfileLoaded];
    uint64_t v6 = 8;
    if (v5) {
      uint64_t v6 = 16;
    }
    [*(id *)((char *)&self->super.isa + v6) removeObjectForKey:v4];
  }
  else
  {
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100003CA4();
    }
  }
  return v4 != 0;
}

- (id)objectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(MSDDefaultsManager *)self isDeveloperProfileLoaded]) {
      MSDDeveloperDefaults = self->_MSDDeveloperDefaults;
    }
    else {
      MSDDeveloperDefaults = self->_MSDDefaults;
    }
    id v7 = [(NSUserDefaults *)MSDDeveloperDefaults objectForKey:v4];
  }
  else
  {
    uint64_t v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100003CD8();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)objectForKeyInDeveloperDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSUserDefaults *)self->_MSDDeveloperDefaults objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = [(MSDDefaultsManager *)self _decodeObject:v5 forKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)objectForKeyInDefaultDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSUserDefaults *)self->_MSDDefaults objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = [(MSDDefaultsManager *)self _decodeObject:v5 forKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)objectForDefaultWithCustomClass:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MSDDefaultsManager *)self objectForDefault:v4];
  if (v5)
  {
    uint64_t v6 = [(MSDDefaultsManager *)self _decodeObject:v5 forKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  unsigned int v3 = [(MSDDefaultsManager *)self isDeveloperProfileLoaded];
  uint64_t v4 = 8;
  if (v3) {
    uint64_t v4 = 16;
  }
  unsigned int v5 = [*(id *)((char *)&self->super.isa + v4) dictionaryRepresentation];

  return (NSDictionary *)v5;
}

- (BOOL)profilesEverInstalled
{
  return [(NSUserDefaults *)self->_MSDDeveloperDefaults BOOLForKey:@"developerProfileLoaded"];
}

- (BOOL)isDeveloperProfileLoaded
{
  unint64_t v3 = [(MSDDefaultsManager *)self developerProfilesCount];
  if ((v3 != 0) != [(NSUserDefaults *)self->_MSDDeveloperDefaults BOOLForKey:@"developerProfileLoaded"])[(NSUserDefaults *)self->_MSDDeveloperDefaults setBool:v3 != 0 forKey:@"developerProfileLoaded"]; {
  return v3 != 0;
  }
}

- (void)clearDeveloperDefaults
{
  [(MSDDefaultsManager *)self setDeveloperProfilesCount:0];
  MSDDeveloperDefaults = self->_MSDDeveloperDefaults;
  uint64_t v4 = kMediaSetupDeveloperUserDefaultsDomain;

  [(NSUserDefaults *)MSDDeveloperDefaults removePersistentDomainForName:v4];
}

- (void)clearPrivateAndSharedLocalData
{
  [(MSDDefaultsManager *)self clearObjectForDefault:@"kUserIDToRecordZoneIDMap"];
  [(MSDDefaultsManager *)self clearObjectForDefault:@"privateDatabaseData"];
  [(MSDDefaultsManager *)self clearObjectForDefault:@"privateDatabaseChangesKey"];
  [(MSDDefaultsManager *)self clearObjectForDefault:@"privateDatabaseKeyRefreshTokens"];
  [(MSDDefaultsManager *)self clearObjectForDefault:@"sharedDatabaseData"];
  [(MSDDefaultsManager *)self clearObjectForDefault:@"sharedDatabaseChangesKey"];

  [(MSDDefaultsManager *)self clearObjectForDefault:@"sharedDatabaseKeyRefreshTokens"];
}

- (id)_decodeObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3)
  {
    uint64_t v25 = (uint64_t)v5;
    id v7 = a3;
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, v23, v8, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    id v26 = 0;
    v18 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v17 fromData:v7 error:&v26];

    id v19 = v26;
    if (v19)
    {
      v20 = sub_100031A80();
      uint64_t v6 = (void *)v25;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100003D0C(v25, (uint64_t)v19, v20);
      }

      id v21 = 0;
    }
    else
    {
      id v21 = v18;
      uint64_t v6 = (void *)v25;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (NSUserDefaults)MSDDefaults
{
  return self->_MSDDefaults;
}

- (void)setMSDDefaults:(id)a3
{
}

- (NSUserDefaults)MSDDeveloperDefaults
{
  return self->_MSDDeveloperDefaults;
}

- (void)setMSDDeveloperDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MSDDeveloperDefaults, 0);

  objc_storeStrong((id *)&self->_MSDDefaults, 0);
}

@end