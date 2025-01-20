@interface FudStorage
+ (FudStorage)storageWithFile:(id)a3;
- (BOOL)_load;
- (BOOL)_overrideAllowRemoteFindNow;
- (BOOL)_policyAllowsRemoteFind:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6;
- (BOOL)isAnyStateMachineActive;
- (BOOL)isAnyStateMachineActiveForPlugin:(id)a3;
- (BOOL)isPluginTracked:(id)a3;
- (BOOL)policyAllowsRemoteFindNow:(id)a3 filter:(id)a4 revision:(id)a5;
- (BOOL)registerClient:(id)a3 withGroup:(id)a4;
- (BOOL)registerClient:(id)a3 withPlugin:(id)a4;
- (BOOL)save;
- (BOOL)setStateMachine:(id)a3 forPlugin:(id)a4 forFilter:(id)a5;
- (BOOL)unregisterClient:(id)a3 fromPlugin:(id)a4;
- (FudStorage)initWithStorageFile:(id)a3;
- (NSMutableDictionary)pluginToPolicy;
- (NSString)storageFile;
- (id)getClientWithName:(id)a3;
- (id)getFiltersInExclusionGroup:(id)a3;
- (id)getPolicyForFilterName:(id)a3;
- (id)getPolicyForPlugin:(id)a3;
- (id)getRegisteredClientsForPlugin:(id)a3;
- (id)getStateMachineForFilterName:(id)a3;
- (void)addPolicy:(id)a3;
- (void)dealloc;
- (void)recordSuccessfulRemoteFindForPolicy:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6;
- (void)setPoliciesWithArray:(id)a3;
- (void)setStorageFile:(id)a3;
- (void)unregisterAllClients;
- (void)unregisterClientFromAllPlugins:(id)a3;
@end

@implementation FudStorage

+ (FudStorage)storageWithFile:(id)a3
{
  if ((unint64_t)a3 | qword_100096350)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D2A8;
    block[3] = &unk_10007CF58;
    block[4] = a3;
    if (qword_100096358 != -1) {
      dispatch_once(&qword_100096358, block);
    }
    return (FudStorage *)qword_100096350;
  }
  else
  {
    FudLog();
    id v4 = a1;
    return 0;
  }
}

- (FudStorage)initWithStorageFile:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FudStorage;
  id v4 = [(FudStorage *)&v6 init];
  if (v4)
  {
    FudLog();
    v4->storageFile = (NSString *)[a3 copy];
    v4->pluginToClients = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    v4->pluginToPolicy = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    v4->pluginToStateMachines = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    v4->pluginToRemoteCheckDate = 0;
    v4->lock = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
  }
  return v4;
}

- (void)addPolicy:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](self->pluginToPolicy, "setObject:forKey:", a3, [a3 pluginName]);
  }
  else {
    FudLog();
  }
  lock = self->lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)setPoliciesWithArray:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  if (a3)
  {
    [(NSMutableDictionary *)self->pluginToPolicy removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableDictionary setObject:forKey:](self->pluginToPolicy, "setObject:forKey:", *(void *)(*((void *)&v9 + 1) + 8 * i), [*(id *)(*((void *)&v9 + 1) + 8 * i) pluginName]);
        }
        id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    FudLog();
  }
  [(NSRecursiveLock *)self->lock unlock];
}

- (void)dealloc
{
  self->storageFile = 0;
  self->pluginToPolicy = 0;

  self->pluginToClients = 0;
  self->pluginToStateMachines = 0;

  self->pluginToRemoteCheckDate = 0;
  self->lock = 0;
  v3.receiver = self;
  v3.super_class = (Class)FudStorage;
  [(FudStorage *)&v3 dealloc];
}

- (id)getPolicyForPlugin:(id)a3
{
  if (a3) {
    a3 = [(NSMutableDictionary *)self->pluginToPolicy objectForKey:a3];
  }
  else {
    FudLog();
  }
  [(NSRecursiveLock *)self->lock unlock];
  return a3;
}

- (id)getPolicyForFilterName:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self;
  id v5 = [(NSMutableDictionary *)self->pluginToPolicy allValues];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "filterName"), "isEqualToString:", a3))break; {
            if (v13 == (id)++v15)
            }
            {
              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }
          if (v10) {
            goto LABEL_19;
          }
        }
LABEL_16:
        ;
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
  long long v10 = 0;
LABEL_19:
  [(NSRecursiveLock *)v17->lock unlock];
  return v10;
}

- (void)unregisterAllClients
{
  [(NSRecursiveLock *)self->lock lock];
  [(NSMutableDictionary *)self->pluginToClients removeAllObjects];
  lock = self->lock;
  [(NSRecursiveLock *)lock unlock];
}

- (id)getRegisteredClientsForPlugin:(id)a3
{
  if (a3) {
    a3 = [(NSMutableDictionary *)self->pluginToClients objectForKey:a3];
  }
  else {
    FudLog();
  }
  [(NSRecursiveLock *)self->lock unlock];
  return a3;
}

- (BOOL)registerClient:(id)a3 withPlugin:(id)a4
{
  [(NSRecursiveLock *)self->lock lock];
  if (!a3 || ![a3 name])
  {
    id v13 = a3;
LABEL_17:
    FudLog();
    goto LABEL_18;
  }
  if (![(FudStorage *)self isPluginTracked:a4])
  {
    id v13 = [a3 name];
    id v14 = a4;
    goto LABEL_17;
  }
  id v7 = (NSMutableArray *)[(NSMutableDictionary *)self->pluginToClients objectForKey:a4];
  if (!v7)
  {
    id v7 = +[NSMutableArray arrayWithCapacity:1];
    [(NSMutableDictionary *)self->pluginToClients setObject:v7 forKey:a4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v11), "name"), "isEqualToString:", objc_msgSend(a3, "name")))
        {
          id v13 = [a3 name];
          id v14 = a4;
          goto LABEL_17;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  [(NSMutableArray *)v7 addObject:a3];
LABEL_18:
  [(NSRecursiveLock *)self->lock unlock];
  return 1;
}

- (BOOL)registerClient:(id)a3 withGroup:(id)a4
{
  [(NSRecursiveLock *)self->lock lock];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  pluginToPolicy = self->pluginToPolicy;
  id v8 = [(NSMutableDictionary *)pluginToPolicy countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v19;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(pluginToPolicy);
      }
      id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v14 = -[NSMutableDictionary objectForKey:](self->pluginToPolicy, "objectForKey:", v13, v17);
      if (v14)
      {
        if ([v14 doesPolicyContainGroup:a4])
        {
          [(FudStorage *)self registerClient:a3 withPlugin:v13];
          char v10 = 1;
        }
      }
      else
      {
        id v17 = v13;
        FudLog();
      }
    }
    id v9 = [(NSMutableDictionary *)pluginToPolicy countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);
  if (v10)
  {
    BOOL v15 = 1;
  }
  else
  {
LABEL_14:
    id v17 = a4;
    FudLog();
    BOOL v15 = 0;
  }
  [(NSRecursiveLock *)self->lock unlock];
  return v15;
}

- (void)unregisterClientFromAllPlugins:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  id v5 = +[NSMutableArray arrayWithCapacity:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v24 = self;
  id obj = [(NSMutableDictionary *)self->pluginToClients allKeys];
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)v24->pluginToClients objectForKey:v10];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v30;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "name"), "isEqualToString:", a3))-[NSMutableArray addObject:](v5, "addObject:", v10); {
            }
              }
            id v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }
  if ([(NSMutableArray *)v5 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (k = 0; k != v17; k = (char *)k + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v5);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)k);
          if (-[FudStorage unregisterClient:fromPlugin:](v24, "unregisterClient:fromPlugin:", a3, v20, v21, v22))
          {
            id v21 = a3;
            uint64_t v22 = v20;
          }
          else
          {
            id v21 = a3;
            uint64_t v22 = v20;
          }
          FudLog();
        }
        id v17 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v17);
    }
  }
  else
  {
    id v21 = a3;
    FudLog();
  }
  [(NSRecursiveLock *)v24->lock unlock];
}

- (BOOL)unregisterClient:(id)a3 fromPlugin:(id)a4
{
  [(NSRecursiveLock *)self->lock lock];
  if (a3)
  {
    if (a4)
    {
      if ([(FudStorage *)self isPluginTracked:a4])
      {
        id v7 = [(NSMutableDictionary *)self->pluginToClients objectForKey:a4];
        if (v7)
        {
          uint64_t v8 = v7;
          unint64_t v9 = 0;
          if ([v7 count])
          {
            int v10 = 0;
            do
            {
              if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "objectAtIndex:", v9), "name"), "isEqualToString:", a3))break; {
              unint64_t v9 = (unsigned __int16)++v10;
              }
            }
            while ((unint64_t)[v8 count] > (unsigned __int16)v10);
          }
          if ([v8 count] != (id)v9)
          {
            [v8 removeObjectAtIndex:v9];
            LOBYTE(a3) = 1;
            goto LABEL_16;
          }
        }
        else
        {
          id v12 = a4;
        }
      }
      else
      {
        id v12 = a3;
        id v13 = a4;
      }
    }
    FudLog();
    LOBYTE(a3) = 0;
  }
  else
  {
    FudLog();
  }
LABEL_16:
  [(NSRecursiveLock *)self->lock unlock];
  return (char)a3;
}

- (id)getClientWithName:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = self;
  id v5 = [(NSMutableDictionary *)self->pluginToClients allValues];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v19;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            BOOL v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
            if (objc_msgSend(objc_msgSend(v15, "name"), "isEqualToString:", a3)) {
              break;
            }
            if (v12 == (id)++v14)
            {
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }
          if (v15) {
            goto LABEL_19;
          }
        }
LABEL_16:
        ;
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
  BOOL v15 = 0;
LABEL_19:
  [(NSRecursiveLock *)v17->lock unlock];
  return v15;
}

- (BOOL)isPluginTracked:(id)a3
{
  LOBYTE(a3) = [(FudStorage *)self getPolicyForPlugin:a3] != 0;
  [(NSRecursiveLock *)self->lock unlock];
  return (char)a3;
}

- (BOOL)setStateMachine:(id)a3 forPlugin:(id)a4 forFilter:(id)a5
{
  [(NSRecursiveLock *)self->lock lock];
  if (!a4 || !a5)
  {
    id v14 = a5;
    id v15 = a4;
    goto LABEL_10;
  }
  id v9 = [(FudStorage *)self getPolicyForFilterName:a5];
  if (!v9)
  {
LABEL_10:
    FudLog();
    BOOL v12 = 0;
    goto LABEL_11;
  }
  int v10 = v9;
  id v11 = -[NSMutableDictionary objectForKey:](self->pluginToStateMachines, "objectForKey:", [v9 pluginName]);
  if (!v11)
  {
    id v11 = +[NSMutableDictionary dictionary];
    -[NSMutableDictionary setValue:forKey:](self->pluginToStateMachines, "setValue:forKey:", v11, [v10 pluginName]);
  }
  [v11 removeObjectForKey:a5];
  if (a3) {
    [v11 setValue:a3 forKey:a5];
  }
  BOOL v12 = 1;
LABEL_11:
  [(NSRecursiveLock *)self->lock unlock];
  return v12;
}

- (id)getStateMachineForFilterName:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  id v5 = [(FudStorage *)self getPolicyForFilterName:a3];
  if (v5)
  {
    id v6 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->pluginToStateMachines, "objectForKey:", objc_msgSend(v5, "pluginName")), "objectForKey:", a3);
  }
  else
  {
    FudLog();
    id v6 = 0;
  }
  [(NSRecursiveLock *)self->lock unlock];
  return v6;
}

- (BOOL)isAnyStateMachineActiveForPlugin:(id)a3
{
  [(NSRecursiveLock *)self->lock lock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(NSMutableDictionary *)self->pluginToPolicy allValues];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = -[FudStorage getStateMachineForFilterName:](self, "getStateMachineForFilterName:", [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) filterName]);
              if ([v16 isActive]
                && (objc_msgSend(objc_msgSend(v16, "stateMachinePluginName"), "isEqualToString:", a3) & 1) != 0)
              {
                BOOL v17 = 1;
                goto LABEL_20;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
        uint64_t v8 = v19;
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      BOOL v17 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_20:
  [(NSRecursiveLock *)self->lock unlock];
  return v17;
}

- (BOOL)isAnyStateMachineActive
{
  [(NSRecursiveLock *)self->lock lock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(NSMutableDictionary *)self->pluginToPolicy allValues];
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = objc_msgSend(v8, "matchingFilters", 0);
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if (objc_msgSend(-[FudStorage getStateMachineForFilterName:](self, "getStateMachineForFilterName:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "filterName")), "isActive"))
              {
                BOOL v14 = 1;
                goto LABEL_19;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_19:
  [(NSRecursiveLock *)self->lock unlock];
  return v14;
}

- (id)getFiltersInExclusionGroup:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:1];
  [(NSRecursiveLock *)self->lock lock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v18 = self;
  id obj = [(NSMutableDictionary *)self->pluginToPolicy allValues];
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              if (objc_msgSend(objc_msgSend(v16, "exclusionGroup"), "isEqualToString:", a3)) {
                [(NSMutableArray *)v5 addObject:v16];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
  [(NSRecursiveLock *)v18->lock unlock];
  return v5;
}

- (BOOL)_overrideAllowRemoteFindNow
{
  char v2 = MGGetBoolAnswer();
  FudLog();
  return v2;
}

- (BOOL)_policyAllowsRemoteFind:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6
{
  id v10 = +[NSString stringWithFormat:@"%@.%@", a4, a5];
  if (!a6) {
    a6 = +[NSDate date];
  }
  [(NSRecursiveLock *)self->lock lock];
  pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
  if (pluginToRemoteCheckDate)
  {
    id v12 = -[NSMutableDictionary objectForKey:](pluginToRemoteCheckDate, "objectForKey:", [a3 pluginName]);
    if (v12)
    {
      id v13 = v12;
      id v14 = [v12 objectForKey:v10];
      if (v14)
      {
        id v15 = v14;
        id v24 = [a3 pluginName];
        FudLog();
        objc_msgSend(v15, "timeIntervalSinceDate:", a6, "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]", v24, a4, v15);
        double v17 = v16 / -3600.0;
        double v25 = v16 / -3600.0;
        FudLog();
        objc_msgSend(a3, "remoteFirmwareCheckInterval", "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]", *(void *)&v25);
        double v19 = v18;
        double v23 = v18;
        FudLog();
        if (v17 >= 0.0)
        {
          if (v17 < v19)
          {
            long long v22 = "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]";
            FudLog();
            BOOL v20 = 0;
            goto LABEL_10;
          }
          long long v22 = "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]";
          FudLog();
        }
        else
        {
          FudLog();
          FudLog();
          objc_msgSend(v13, "removeObjectForKey:", v10, "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]", v10);
        }
      }
    }
  }
  else
  {
    [(FudStorage *)self _load];
  }
  BOOL v20 = 1;
LABEL_10:
  [(NSRecursiveLock *)self->lock unlock];
  return v20;
}

- (BOOL)policyAllowsRemoteFindNow:(id)a3 filter:(id)a4 revision:(id)a5
{
  if ([(FudStorage *)self _overrideAllowRemoteFindNow]) {
    return 1;
  }
  return [(FudStorage *)self _policyAllowsRemoteFind:a3 filter:a4 revision:a5 date:0];
}

- (void)recordSuccessfulRemoteFindForPolicy:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6
{
  id v10 = +[NSString stringWithFormat:@"%@.%@", a4, a5];
  if (a3 && a4)
  {
    id v11 = v10;
    if (!a6) {
      a6 = +[NSDate date];
    }
    [(NSRecursiveLock *)self->lock lock];
    pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
    if (pluginToRemoteCheckDate)
    {
      id v13 = -[NSMutableDictionary objectForKey:](pluginToRemoteCheckDate, "objectForKey:", [a3 pluginName]);
      if (!v13) {
        id v13 = objc_alloc_init((Class)NSMutableDictionary);
      }
    }
    else if ([(FudStorage *)self _load])
    {
      id v13 = 0;
    }
    else
    {
      self->pluginToRemoteCheckDate = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      -[NSMutableDictionary setValue:forKey:](self->pluginToRemoteCheckDate, "setValue:forKey:", v13, [a3 pluginName]);
    }
    [v13 setObject:a6 forKey:v11];
    [(NSRecursiveLock *)self->lock unlock];
    [a3 pluginName];
  }
  FudLog();
}

- (BOOL)save
{
  [(NSRecursiveLock *)self->lock lock];
  pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
  if (pluginToRemoteCheckDate && [(NSMutableDictionary *)pluginToRemoteCheckDate count])
  {
    id v4 = +[NSFileManager defaultManager];
    if (![(NSFileManager *)v4 fileExistsAtPath:self->storageFile]) {
      [(NSFileManager *)v4 createFileAtPath:self->storageFile contents:0 attributes:0];
    }
    [(NSMutableDictionary *)self->pluginToRemoteCheckDate writeToFile:self->storageFile atomically:1];
  }
  [(NSRecursiveLock *)self->lock unlock];
  return 1;
}

- (BOOL)_load
{
  [(NSRecursiveLock *)self->lock lock];
  if (self->pluginToRemoteCheckDate)
  {
    BOOL v3 = 1;
  }
  else if ([+[NSFileManager defaultManager] fileExistsAtPath:self->storageFile])
  {
    id v4 = (NSMutableDictionary *)[+[NSMutableDictionary dictionaryWithContentsOfFile:self->storageFile] copy];
    self->pluginToRemoteCheckDate = v4;
    BOOL v3 = v4 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  [(NSRecursiveLock *)self->lock unlock];
  return v3;
}

- (NSMutableDictionary)pluginToPolicy
{
  return self->pluginToPolicy;
}

- (NSString)storageFile
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorageFile:(id)a3
{
}

@end