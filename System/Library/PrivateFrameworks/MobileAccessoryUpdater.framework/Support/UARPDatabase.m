@interface UARPDatabase
+ (id)sharedDatabase;
- (NSArray)activeAccessories;
- (NSArray)pendingConsentRequests;
- (NSArray)periodicLaunchAccessories;
- (UARPDatabase)init;
- (id)accessoryArrayForDictionary:(id)a3;
- (id)activeAccessoryDictionary;
- (id)consentArrayForDictionary:(id)a3;
- (id)dasActivitiesDictionary;
- (id)getDASActivitiesForServiceName:(id)a3;
- (id)pendingConsentRequestsDictionary;
- (id)periodicLaunchAccessoryDictionary;
- (id)unarchiveConsentData:(id)a3 forAccessory:(id)a4;
- (id)unarchiveDASActivitiesData:(id)a3;
- (id)unarchiveInternalAccessoryData:(id)a3 forUUID:(id)a4;
- (void)addAccessoryToPeriodicLaunchCache:(id)a3 uuid:(id)a4;
- (void)addActiveAccessory:(id)a3;
- (void)addDASActivities:(id)a3 serviceName:(id)a4;
- (void)addPendingConsentRequest:(id)a3;
- (void)dealloc;
- (void)dumpActiveAccessories:(id)a3;
- (void)dumpConsentPendingAccessories:(id)a3;
- (void)dumpDASActivities:(id)a3;
- (void)dumpPeriodicLaunchCache:(id)a3;
- (void)dumpToFile:(id)a3;
- (void)purgePeriodicLaunchCache;
- (void)removeActiveAccessoryForUUID:(id)a3;
- (void)removeActiveAccessoryForUUID:(id)a3 isUpdate:(BOOL)a4;
- (void)removeAllActiveAccessories;
- (void)removeDASActivitiesForServiceName:(id)a3;
- (void)removePendingConsentRequest:(id)a3;
- (void)removePeriodicLaunchCacheAccessoryForUUID:(id)a3;
- (void)setActiveAccessories:(id)a3;
- (void)setDASActivities:(id)a3;
- (void)setPendingConsentRequests:(id)a3;
- (void)setPeriodicLaunchCache:(id)a3;
- (void)updateActiveAccessory:(id)a3;
@end

@implementation UARPDatabase

+ (id)sharedDatabase
{
  if (qword_100096348 != -1) {
    dispatch_once(&qword_100096348, &stru_10007D5A8);
  }
  return (id)qword_100096340;
}

- (UARPDatabase)init
{
  v4.receiver = self;
  v4.super_class = (Class)UARPDatabase;
  v2 = [(UARPDatabase *)&v4 init];
  if (v2)
  {
    v2->_database = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.uarp.database"];
    _CFPreferencesSetBackupDisabled();
    v2->_log = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "database");
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPDatabase;
  [(UARPDatabase *)&v3 dealloc];
}

- (id)accessoryArrayForDictionary:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = -[UARPDatabase unarchiveInternalAccessoryData:forUUID:](self, "unarchiveInternalAccessoryData:forUUID:", [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)], *(void *)(*((void *)&v12 + 1) + 8 * (void)v9));
        if (v10) {
          [v5 addObject:v10];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return +[NSArray arrayWithArray:v5];
}

- (NSArray)activeAccessories
{
  id v3 = [(UARPDatabase *)self activeAccessoryDictionary];
  return (NSArray *)[(UARPDatabase *)self accessoryArrayForDictionary:v3];
}

- (void)addActiveAccessory:(id)a3
{
  id v5 = [(UARPDatabase *)self activeAccessoryDictionary];
  if (!v5) {
    id v5 = +[NSMutableDictionary dictionary];
  }
  uint64_t v7 = 0;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"), "UUIDString"));
    [(UARPDatabase *)self setActiveAccessories:v5];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10004FDD4();
  }
  -[UARPDatabase removePeriodicLaunchCacheAccessoryForUUID:](self, "removePeriodicLaunchCacheAccessoryForUUID:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"));
}

- (void)updateActiveAccessory:(id)a3
{
  if ((unint64_t)objc_msgSend(-[UARPDatabase activeAccessoryDictionary](self, "activeAccessoryDictionary"), "count") < 0x65)
  {
    -[UARPDatabase removeActiveAccessoryForUUID:isUpdate:](self, "removeActiveAccessoryForUUID:isUpdate:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "uuid"), 1);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_10004FE54(log);
    }
    [(UARPDatabase *)self setActiveAccessories:0];
  }
  [(UARPDatabase *)self addActiveAccessory:a3];
}

- (void)removeActiveAccessoryForUUID:(id)a3 isUpdate:(BOOL)a4
{
  id v7 = [(UARPDatabase *)self activeAccessoryDictionary];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(a3, "UUIDString"));
    if (v9)
    {
      if (!a4) {
        [(UARPDatabase *)self addAccessoryToPeriodicLaunchCache:v9 uuid:a3];
      }
      objc_msgSend(v8, "removeObjectForKey:", objc_msgSend(a3, "UUIDString"));
      [(UARPDatabase *)self setActiveAccessories:v8];
    }
  }
}

- (void)removeActiveAccessoryForUUID:(id)a3
{
}

- (void)removeAllActiveAccessories
{
}

- (id)activeAccessoryDictionary
{
  id v2 = objc_msgSend(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"ActiveAccessories"), "mutableCopy");
  return v2;
}

- (void)setActiveAccessories:(id)a3
{
}

- (id)unarchiveInternalAccessoryData:(id)a3 forUUID:(id)a4
{
  uint64_t v7 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[UARPAccessoryInternal encodedClasses], a3, &v7);
  if (!v5 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10004FED8();
  }
  return v5;
}

- (id)periodicLaunchAccessoryDictionary
{
  id v2 = objc_msgSend(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"PeriodicLaunchCache"), "mutableCopy");
  return v2;
}

- (void)setPeriodicLaunchCache:(id)a3
{
}

- (NSArray)periodicLaunchAccessories
{
  id v3 = +[NSMutableArray array];
  id v4 = [(UARPDatabase *)self accessoryArrayForDictionary:[(UARPDatabase *)self periodicLaunchAccessoryDictionary]];
  objc_msgSend(v3, "addObjectsFromArray:", -[UARPDatabase activeAccessories](self, "activeAccessories"));
  [v3 addObjectsFromArray:v4];
  return +[NSArray arrayWithArray:v3];
}

- (void)addAccessoryToPeriodicLaunchCache:(id)a3 uuid:(id)a4
{
  id v7 = [(UARPDatabase *)self periodicLaunchAccessoryDictionary];
  if (!v7) {
    id v7 = +[NSMutableDictionary dictionary];
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, objc_msgSend(a4, "UUIDString"));
  [(UARPDatabase *)self setPeriodicLaunchCache:v7];
}

- (void)removePeriodicLaunchCacheAccessoryForUUID:(id)a3
{
  id v5 = [(UARPDatabase *)self periodicLaunchAccessoryDictionary];
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, "removeObjectForKey:", objc_msgSend(a3, "UUIDString"));
    [(UARPDatabase *)self setPeriodicLaunchCache:v6];
  }
}

- (void)purgePeriodicLaunchCache
{
}

- (NSArray)pendingConsentRequests
{
  id v3 = [(UARPDatabase *)self pendingConsentRequestsDictionary];
  return (NSArray *)[(UARPDatabase *)self consentArrayForDictionary:v3];
}

- (id)pendingConsentRequestsDictionary
{
  id v2 = objc_msgSend(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"PendingConsentRequests"), "mutableCopy");
  return v2;
}

- (void)setPendingConsentRequests:(id)a3
{
}

- (void)addPendingConsentRequest:(id)a3
{
  id v5 = [(UARPDatabase *)self pendingConsentRequestsDictionary];
  if (!v5) {
    id v5 = +[NSMutableDictionary dictionary];
  }
  uint64_t v7 = 0;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, objc_msgSend(a3, "accessoryName"));
    [(UARPDatabase *)self setPendingConsentRequests:v5];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10004FF40();
  }
}

- (void)removePendingConsentRequest:(id)a3
{
  id v5 = [(UARPDatabase *)self pendingConsentRequestsDictionary];
  if (v5)
  {
    id v6 = v5;
    if (objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(a3, "accessoryName")))
    {
      objc_msgSend(v6, "removeObjectForKey:", objc_msgSend(a3, "accessoryName"));
      [(UARPDatabase *)self setPendingConsentRequests:v6];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_10004FFB4(a3, log);
      }
    }
  }
}

- (id)consentArrayForDictionary:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = -[UARPDatabase unarchiveConsentData:forAccessory:](self, "unarchiveConsentData:forAccessory:", [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)], *(void *)(*((void *)&v12 + 1) + 8 * (void)v9));
        if (v10) {
          [v5 addObject:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return +[NSArray arrayWithArray:v5];
}

- (id)unarchiveConsentData:(id)a3 forAccessory:(id)a4
{
  uint64_t v7 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v7];
  if (!v5 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10004FED8();
  }
  return v5;
}

- (id)dasActivitiesDictionary
{
  id v2 = objc_msgSend(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:", @"DASActivities"), "mutableCopy");
  return v2;
}

- (void)setDASActivities:(id)a3
{
}

- (void)addDASActivities:(id)a3 serviceName:(id)a4
{
  id v7 = [(UARPDatabase *)self dasActivitiesDictionary];
  if (!v7) {
    id v7 = +[NSMutableDictionary dictionary];
  }
  uint64_t v11 = 0;
  id v8 = [a3 mutableCopy];
  if ([v7 objectForKeyedSubscript:a4])
  {
    id v9 = -[UARPDatabase unarchiveDASActivitiesData:](self, "unarchiveDASActivitiesData:", [v7 objectForKeyedSubscript:a4]);
    if (v9) {
      [v8 addObjectsFromArray:v9];
    }
  }
  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v11];
  if (v10)
  {
    [v7 setObject:v10 forKeyedSubscript:a4];
    [(UARPDatabase *)self setDASActivities:v7];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100050048();
  }
}

- (id)getDASActivitiesForServiceName:(id)a3
{
  id v5 = [(UARPDatabase *)self dasActivitiesDictionary];
  id result = [v5 objectForKeyedSubscript:a3];
  if (result)
  {
    id v7 = [v5 objectForKeyedSubscript:a3];
    return [(UARPDatabase *)self unarchiveDASActivitiesData:v7];
  }
  return result;
}

- (void)removeDASActivitiesForServiceName:(id)a3
{
  id v5 = [(UARPDatabase *)self dasActivitiesDictionary];
  if ([v5 objectForKeyedSubscript:a3])
  {
    [v5 removeObjectForKey:a3];
    [(UARPDatabase *)self setDASActivities:v5];
  }
}

- (id)unarchiveDASActivitiesData:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0), a3, &v8);
  if (!v6 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000500BC();
  }
  return v6;
}

- (void)dumpActiveAccessories:(id)a3
{
  id v4 = [(UARPDatabase *)self activeAccessories];
  [a3 appendFormat:@"Active Accessories:\n"];
  if ([(NSArray *)v4 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) dumpWithTabDepth:1 dumpString:a3];
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [a3 appendWithTabDepth:1 format:@"No active accessories present.\n"];
  }
}

- (void)dumpPeriodicLaunchCache:(id)a3
{
  id v4 = [(UARPDatabase *)self accessoryArrayForDictionary:[(UARPDatabase *)self periodicLaunchAccessoryDictionary]];
  [a3 appendFormat:@"Periodic Launch Cache:\n"];
  if ([v4 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) dumpWithTabDepth:1 dumpString:a3];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [a3 appendWithTabDepth:1 format:@"No accessories present in periodic launch cache.\n"];
  }
}

- (void)dumpConsentPendingAccessories:(id)a3
{
  id v4 = [(UARPDatabase *)self consentArrayForDictionary:[(UARPDatabase *)self pendingConsentRequestsDictionary]];
  [a3 appendFormat:@"Consent Pending Requests:\n"];
  if ([v4 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) dumpWithTabDepth:1 dumpString:a3];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [a3 appendWithTabDepth:1 format:@"No Pending Consent Requests present.\n"];
  }
}

- (void)dumpDASActivities:(id)a3
{
  id v5 = [(UARPDatabase *)self dasActivitiesDictionary];
  [a3 appendFormat:@"DAS Activities:\n"];
  if ([v5 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v5 allKeys];
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          [a3 appendWithTabDepth:1, @"Service Name: %@", v10 format];
          id v11 = -[UARPDatabase unarchiveDASActivitiesData:](self, "unarchiveDASActivitiesData:", [v5 objectForKeyedSubscript:v10]);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) dumpWithTabDepth:2 dumpString:a3];
              }
              id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v13);
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [a3 appendWithTabDepth:1 format:@"No DAS Activities present.\n"];
  }
}

- (void)dumpToFile:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_100050198((uint64_t)a3, log);
  }
  id v6 = +[NSMutableString string];
  [(UARPDatabase *)self dumpActiveAccessories:v6];
  [(UARPDatabase *)self dumpPeriodicLaunchCache:v6];
  [(UARPDatabase *)self dumpConsentPendingAccessories:v6];
  [(UARPDatabase *)self dumpDASActivities:v6];
  uint64_t v7 = 0;
  [a3 stringByExpandingTildeInPath];
  if ((objc_msgSend(v6, "writeToFile:atomically:encoding:error:", objc_msgSend(a3, "stringByExpandingTildeInPath"), 1, 4, &v7) & 1) == 0&& os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100050124();
  }
}

@end