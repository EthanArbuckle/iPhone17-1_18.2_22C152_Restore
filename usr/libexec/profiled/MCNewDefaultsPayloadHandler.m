@interface MCNewDefaultsPayloadHandler
- (BOOL)_install;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCNewDefaultsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSMutableSet)changedDomains;
- (void)_remove;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)remove;
- (void)setChangedDomains:(id)a3;
@end

@implementation MCNewDefaultsPayloadHandler

- (MCNewDefaultsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCNewDefaultsPayloadHandler;
  v4 = [(MCNewPayloadHandler *)&v8 initWithPayload:a3 profileHandler:a4];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    changedDomains = v4->_changedDomains;
    v4->_changedDomains = v5;
  }
  return v4;
}

- (BOOL)_install
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 domains];
  v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [v3 domains];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        [(NSMutableSet *)self->_changedDomains addObject:v11];
        v12 = [v3 defaultsForDomain:v11];
        if (!+[MCManagedPreferencesManager addManagedPreferences:v12 toDomain:v11])
        {

          BOOL v15 = 0;
          goto LABEL_14;
        }
        v13 = [v5 objectForKey:v11];
        if (v13)
        {
          id v14 = v13;
          [v13 addEntriesFromDictionary:v12];
        }
        else
        {
          id v14 = [v12 mutableCopy];
        }
        [v5 setObject:v14 forKey:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_14:

  v16 = +[MCHacks sharedHacks];
  [v16 _sendChangeNotificationsBasedOnDefaultsAdditionByDomain:v5];

  return v15;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if ([(MCNewDefaultsPayloadHandler *)self _install])
  {
    id v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = MCDefaultsErrorDomain;
    v10 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 10000, v10, MCErrorTypeFatal, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v8 = v7 == 0;
    if (a6 && v7)
    {
      id v7 = v7;
      BOOL v8 = 0;
      *a6 = v7;
    }
  }

  return v8;
}

- (void)_remove
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 domains];
  v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [v3 domains];
  id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        [(NSMutableSet *)self->_changedDomains addObject:v10];
        uint64_t v11 = [v3 defaultsForDomain:v10];
        v12 = [v11 allKeys];
        +[MCManagedPreferencesManager removeManagedPreferences:v12 fromDomain:v10];
        [v5 setObject:v12 forKey:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = +[MCHacks sharedHacks];
  [v13 _sendChangeNotificationsBasedOnDefaultsRemovalByDomain:v5];
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCNewDefaultsPayloadHandler *)self _remove];
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = [(NSMutableSet *)self->_changedDomains allObjects];
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:v4];
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = [(NSMutableSet *)self->_changedDomains allObjects];
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:v4];
}

- (NSMutableSet)changedDomains
{
  return self->_changedDomains;
}

- (void)setChangedDomains:(id)a3
{
}

- (void).cxx_destruct
{
}

@end