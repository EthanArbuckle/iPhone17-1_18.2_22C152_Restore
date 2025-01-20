@interface NFFieldDetectManager
- (BOOL)containsFieldDetectSession:(id)a3;
- (BOOL)isActive;
- (NFFieldDetectManager)init;
- (NSArray)fieldDetectSessionClientNames;
- (NSArray)persistentObserverNames;
- (NSHashTable)fieldDetectSessions;
- (NSMutableSet)persistentFieldDetectClients;
- (NSMutableSet)suspensionRequestor;
- (OS_os_transaction)fieldDetectTransaction;
- (id)getStateDumpInfo;
- (unint64_t)totalFieldDetectSessions;
- (unint64_t)totalPersistentClient;
- (void)addFieldDetectSession:(id)a3;
- (void)addPersistentFieldObserver:(id)a3;
- (void)enumerateFieldDetectSessionsUsingBlock:(id)a3;
- (void)removeAllPersistentFieldObservers;
- (void)removeFieldDetectSession:(id)a3;
- (void)removePersistentFieldObserver:(id)a3;
- (void)resume:(id)a3;
- (void)setFieldDetectSessions:(id)a3;
- (void)setFieldDetectTransaction:(id)a3;
- (void)setPersistentFieldDetectClients:(id)a3;
- (void)setSuspensionRequestor:(id)a3;
- (void)suspend:(id)a3;
@end

@implementation NFFieldDetectManager

- (void)enumerateFieldDetectSessionsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSHashTable)fieldDetectSessions
{
  return self->_fieldDetectSessions;
}

- (NFFieldDetectManager)init
{
  v60.receiver = self;
  v60.super_class = (Class)NFFieldDetectManager;
  v2 = [(NFFieldDetectManager *)&v60 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    fieldDetectSessions = v2->_fieldDetectSessions;
    v2->_fieldDetectSessions = (NSHashTable *)v3;

    uint64_t v5 = objc_opt_new();
    persistentFieldDetectClients = v2->_persistentFieldDetectClients;
    v2->_persistentFieldDetectClients = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    suspensionRequestor = v2->_suspensionRequestor;
    v2->_suspensionRequestor = (NSMutableSet *)v7;

    v9 = +[NSUserDefaults standardUserDefaults];
    [v9 removeObjectForKey:@"FieldDetect"];
    long long v10 = [v9 arrayForKey:@"FieldDetectClients"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v57 = v10;
        v58 = v9;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id obj = v10;
        id v11 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v62;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v62 != v13) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v15 lengthOfBytesUsingEncoding:4])
                {
                  v16 = [(NFFieldDetectManager *)v2 persistentFieldDetectClients];
                  [v16 addObject:v15];
                }
                else
                {
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  uint64_t Logger = NFLogGetLogger();
                  if (Logger)
                  {
                    v31 = (void (*)(uint64_t, const char *, ...))Logger;
                    Class = object_getClass(v2);
                    BOOL isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(v2);
                    Name = sel_getName("_loadPersistentClient");
                    uint64_t v35 = 45;
                    if (isMetaClass) {
                      uint64_t v35 = 43;
                    }
                    v31(4, "%c[%{public}s %{public}s]:%i Dropping invalid entry, empty", v35, ClassName, Name, 62);
                  }
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  v16 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                  {
                    v36 = object_getClass(v2);
                    if (class_isMetaClass(v36)) {
                      int v37 = 43;
                    }
                    else {
                      int v37 = 45;
                    }
                    v38 = object_getClassName(v2);
                    v39 = sel_getName("_loadPersistentClient");
                    *(_DWORD *)buf = 67109890;
                    int v66 = v37;
                    __int16 v67 = 2082;
                    v68 = v38;
                    __int16 v69 = 2082;
                    v70 = v39;
                    __int16 v71 = 1024;
                    int v72 = 62;
                    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dropping invalid entry, empty", buf, 0x22u);
                  }
                }
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v17 = NFLogGetLogger();
                if (v17)
                {
                  v18 = (void (*)(uint64_t, const char *, ...))v17;
                  v19 = object_getClass(v2);
                  BOOL v20 = class_isMetaClass(v19);
                  v21 = object_getClassName(v2);
                  v22 = sel_getName("_loadPersistentClient");
                  uint64_t v56 = objc_opt_class();
                  uint64_t v23 = 45;
                  if (v20) {
                    uint64_t v23 = 43;
                  }
                  v18(4, "%c[%{public}s %{public}s]:%i Dropping invalid entry (%@)", v23, v21, v22, 59, v56);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v16 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v24 = object_getClass(v2);
                  if (class_isMetaClass(v24)) {
                    int v25 = 43;
                  }
                  else {
                    int v25 = 45;
                  }
                  v26 = object_getClassName(v2);
                  v27 = sel_getName("_loadPersistentClient");
                  v28 = objc_opt_class();
                  *(_DWORD *)buf = 67110146;
                  int v66 = v25;
                  __int16 v67 = 2082;
                  v68 = v26;
                  __int16 v69 = 2082;
                  v70 = v27;
                  __int16 v71 = 1024;
                  int v72 = 59;
                  __int16 v73 = 2112;
                  v74 = v28;
                  id v29 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Dropping invalid entry (%@)", buf, 0x2Cu);
                }
              }
            }
            id v12 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
          }
          while (v12);
        }

        v40 = [(NFFieldDetectManager *)v2 persistentFieldDetectClients];
        [v40 count];

        long long v10 = v57;
        v9 = v58;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v41 = NFLogGetLogger();
        if (v41)
        {
          v42 = (void (*)(uint64_t, const char *, ...))v41;
          v43 = object_getClass(v2);
          BOOL v44 = class_isMetaClass(v43);
          v45 = object_getClassName(v2);
          v55 = sel_getName("_loadPersistentClient");
          uint64_t v46 = 45;
          if (v44) {
            uint64_t v46 = 43;
          }
          v42(3, "%c[%{public}s %{public}s]:%i Invalid client list; remove", v46, v45, v55, 52);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v47 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = object_getClass(v2);
          if (class_isMetaClass(v48)) {
            int v49 = 43;
          }
          else {
            int v49 = 45;
          }
          v50 = object_getClassName(v2);
          v51 = sel_getName("_loadPersistentClient");
          *(_DWORD *)v75 = 67109890;
          int v76 = v49;
          __int16 v77 = 2082;
          v78 = v50;
          __int16 v79 = 2082;
          v80 = v51;
          __int16 v81 = 1024;
          int v82 = 52;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid client list; remove",
            v75,
            0x22u);
        }

        [v9 removeObjectForKey:@"FieldDetectClients"];
      }
    }

    v52 = v2;
  }

  return v2;
}

- (BOOL)isActive
{
  sub_1000E2218(self);
  v4 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v5 = [v4 count];
  if (!v5)
  {
    v2 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
    if (![v2 count])
    {
      BOOL v7 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v6 = [(NFFieldDetectManager *)self suspensionRequestor];
  BOOL v7 = [v6 count] == 0;

  if (!v5) {
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (unint64_t)totalPersistentClient
{
  v2 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)totalFieldDetectSessions
{
  v2 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSArray)persistentObserverNames
{
  v2 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  id v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)fieldDetectSessionClientNames
{
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v10 = [v9 connection];
            id v11 = [v10 NF_userInfo];
            id v12 = [v11 objectForKeyedSubscript:@"ClientName"];

            if (v12) {
              CFStringRef v13 = v12;
            }
            else {
              CFStringRef v13 = &stru_100309C40;
            }
            [v3 addObject:v13];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)suspend:(id)a3
{
  id v4 = a3;
  id v5 = [(NFFieldDetectManager *)self suspensionRequestor];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "SuspensionOwner %{public}@ is currently active", buf, 0xCu);
    }
  }
  uint64_t v8 = [(NFFieldDetectManager *)self suspensionRequestor];
  [v8 addObject:v4];

  v9 = +[_NFHardwareManager sharedHardwareManager];
  long long v10 = sub_10012050C(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E27F4;
  block[3] = &unk_100301C68;
  CFStringRef v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

- (void)resume:(id)a3
{
  id v4 = a3;
  id v5 = [(NFFieldDetectManager *)self suspensionRequestor];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "SuspensionOwner %{public}@ unavailable", buf, 0xCu);
    }
  }
  uint64_t v8 = [(NFFieldDetectManager *)self suspensionRequestor];
  [v8 removeObject:v4];

  v9 = +[_NFHardwareManager sharedHardwareManager];
  long long v10 = sub_10012050C(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2988;
  block[3] = &unk_100301C68;
  CFStringRef v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

- (void)addFieldDetectSession:(id)a3
{
  id v4 = a3;
  sub_1000E2218(self);
  id v5 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v6 = [v5 count];

  uint64_t v7 = [(NFFieldDetectManager *)self fieldDetectSessions];
  [v7 addObject:v4];

  if (!v6)
  {
    id v8 = (id)os_transaction_create();
    [(NFFieldDetectManager *)self setFieldDetectTransaction:v8];
  }
}

- (void)removeFieldDetectSession:(id)a3
{
  id v4 = a3;
  sub_1000E2218(self);
  id v5 = [(NFFieldDetectManager *)self fieldDetectSessions];
  [v5 removeObject:v4];

  id v6 = [(NFFieldDetectManager *)self fieldDetectSessions];
  id v7 = [v6 count];

  if (!v7)
  {
    [(NFFieldDetectManager *)self setFieldDetectTransaction:0];
  }
}

- (BOOL)containsFieldDetectSession:(id)a3
{
  id v4 = a3;
  id v5 = [(NFFieldDetectManager *)self fieldDetectSessions];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addPersistentFieldObserver:(id)a3
{
  id v4 = [a3 NF_userInfo];
  id v9 = [v4 objectForKeyedSubscript:@"ClientName"];

  id v5 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  [v5 addObject:v9];

  unsigned __int8 v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  id v8 = [v7 allObjects];
  [v6 setObject:v8 forKey:@"FieldDetectClients"];
}

- (void)removePersistentFieldObserver:(id)a3
{
  id v4 = [a3 NF_userInfo];
  id v12 = [v4 objectForKeyedSubscript:@"ClientName"];

  id v5 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  [v5 removeObject:v12];

  unsigned __int8 v6 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  id v7 = [v6 count];

  id v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = v8;
  if (v7)
  {
    long long v10 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
    id v11 = [v10 allObjects];
    [v9 setObject:v11 forKey:@"FieldDetectClients"];
  }
  else
  {
    [v8 removeObjectForKey:@"FieldDetectClients"];
  }
}

- (void)removeAllPersistentFieldObservers
{
  id v3 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(NFFieldDetectManager *)self persistentFieldDetectClients];
    [v5 removeAllObjects];

    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 removeObjectForKey:@"FieldDetectClients"];
  }
}

- (id)getStateDumpInfo
{
  v10[0] = @"persistentFieldDetectClients";
  id v3 = [(NFFieldDetectManager *)self persistentObserverNames];
  v11[0] = v3;
  v10[1] = @"numFieldDetectSessions";
  id v4 = +[NSNumber numberWithUnsignedInteger:[(NFFieldDetectManager *)self totalFieldDetectSessions]];
  v11[1] = v4;
  v10[2] = @"fieldDetectClients";
  id v5 = [(NFFieldDetectManager *)self fieldDetectSessionClientNames];
  v11[2] = v5;
  v10[3] = @"suspensionRequestors";
  id v6 = [(NFFieldDetectManager *)self suspensionRequestor];
  id v7 = [v6 allObjects];
  v11[3] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (void)setFieldDetectSessions:(id)a3
{
}

- (NSMutableSet)persistentFieldDetectClients
{
  return self->_persistentFieldDetectClients;
}

- (void)setPersistentFieldDetectClients:(id)a3
{
}

- (NSMutableSet)suspensionRequestor
{
  return self->_suspensionRequestor;
}

- (void)setSuspensionRequestor:(id)a3
{
}

- (OS_os_transaction)fieldDetectTransaction
{
  return self->_fieldDetectTransaction;
}

- (void)setFieldDetectTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetectTransaction, 0);
  objc_storeStrong((id *)&self->_suspensionRequestor, 0);
  objc_storeStrong((id *)&self->_persistentFieldDetectClients, 0);

  objc_storeStrong((id *)&self->_fieldDetectSessions, 0);
}

@end