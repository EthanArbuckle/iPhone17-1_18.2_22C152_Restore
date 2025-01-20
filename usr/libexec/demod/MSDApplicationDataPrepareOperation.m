@interface MSDApplicationDataPrepareOperation
- (BOOL)_associateContainerPathWithContext;
- (BOOL)_lookupContainerPathsOnDevice;
- (BOOL)_purgeContainerizedDataNotInManifest;
- (MSDApplicationDataPrepareOperation)initWithContext:(id)a3;
- (NSMutableDictionary)dataContainerPaths;
- (NSMutableDictionary)groupContainerPaths;
- (NSMutableDictionary)plugInContainerPaths;
- (id)methodSelectors;
- (void)_createUninstallOperationForContainer:(id)a3 ofType:(id)a4 containerPath:(id)a5 isContainerized:(BOOL)a6;
- (void)setDataContainerPaths:(id)a3;
- (void)setGroupContainerPaths:(id)a3;
- (void)setPlugInContainerPaths:(id)a3;
@end

@implementation MSDApplicationDataPrepareOperation

- (MSDApplicationDataPrepareOperation)initWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MSDApplicationDataPrepareOperation;
  v3 = [(MSDOperation *)&v8 initWithContext:a3];
  if (v3)
  {
    v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDApplicationDataPrepareOperation *)v3 setDataContainerPaths:v4];

    v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDApplicationDataPrepareOperation *)v3 setPlugInContainerPaths:v5];

    v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDApplicationDataPrepareOperation *)v3 setGroupContainerPaths:v6];
  }
  return v3;
}

- (id)methodSelectors
{
  unsigned int v2 = +[MSDOperationContext downloadOnly];
  v3 = +[NSValue valueWithPointer:"_lookupContainerPathsOnDevice"];
  uint64_t v4 = +[NSValue valueWithPointer:"_associateContainerPathWithContext"];
  v5 = (void *)v4;
  if (v2)
  {
    v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0);
  }
  else
  {
    v7 = +[NSValue valueWithPointer:"_purgeContainerizedDataNotInManifest"];
    v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v5, v7, 0);
  }

  return v6;
}

- (BOOL)_lookupContainerPathsOnDevice
{
  v3 = [(MSDOperation *)self context];
  uint64_t v4 = [v3 identifier];
  v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];

  v6 = [v5 dataContainerURL];

  if (v6)
  {
    v7 = [(MSDApplicationDataPrepareOperation *)self dataContainerPaths];
    objc_super v8 = [v5 dataContainerURL];
    v9 = [v8 path];
    v10 = [v5 applicationIdentifier];
    [v7 setObject:v9 forKey:v10];
  }
  v11 = [v5 groupContainerURLs];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002922C;
  v32[3] = &unk_100152138;
  v32[4] = self;
  [v11 enumerateKeysAndObjectsUsingBlock:v32];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v25 = v5;
  id obj = [v5 plugInKitPlugins];
  id v12 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v29;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v28 + 1) + 8 * (void)v16);

        v18 = [v14 dataContainerURL];

        if (v18)
        {
          v19 = [(MSDApplicationDataPrepareOperation *)self plugInContainerPaths];
          v20 = [v14 dataContainerURL];
          v21 = [v20 path];
          v22 = [v14 pluginIdentifier];
          [v19 setObject:v21 forKey:v22];
        }
        v23 = [v14 groupContainerURLs];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000292C0;
        v27[3] = &unk_100152138;
        v27[4] = self;
        [v23 enumerateKeysAndObjectsUsingBlock:v27];

        v16 = (char *)v16 + 1;
        v17 = v14;
      }
      while (v13 != v16);
      id v13 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  return 1;
}

- (BOOL)_associateContainerPathWithContext
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v4 = [(MSDOperation *)self allDependentOperations];
  v5 = +[MSDTargetDevice sharedInstance];
  v6 = [v5 demoUserHomePath];

  v37 = v6;
  v39 = [v6 stringByAppendingPathComponent:@"PseudoContainers"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v13 = [v12 context];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v15 = [v12 context];
          [v3 addObject:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v9);
  }
  v36 = v7;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  id v16 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v42;
    uint64_t v38 = *(void *)v42;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v19);
        v21 = [v20 identifier:v36];
        v22 = [v20 containerType];
        if (![v20 containerized])
        {
          v24 = 0;
          v26 = 0;
          goto LABEL_33;
        }
        v23 = [v20 uniqueName];
        v24 = [v39 stringByAppendingPathComponent:v23];

        if ([v22 isEqualToString:@"AppData"])
        {
          v25 = [(MSDApplicationDataPrepareOperation *)self dataContainerPaths];
          v26 = [v25 objectForKey:v21];

          v27 = [(MSDApplicationDataPrepareOperation *)self dataContainerPaths];
          goto LABEL_23;
        }
        if ([v22 isEqualToString:@"ExtensionData"])
        {
          long long v28 = [(MSDApplicationDataPrepareOperation *)self plugInContainerPaths];
          v26 = [v28 objectForKey:v21];

          v27 = [(MSDApplicationDataPrepareOperation *)self plugInContainerPaths];
          goto LABEL_23;
        }
        if ([v22 isEqualToString:@"GroupData"])
        {
          long long v29 = [(MSDApplicationDataPrepareOperation *)self groupContainerPaths];
          v26 = [v29 objectForKey:v21];

          v27 = [(MSDApplicationDataPrepareOperation *)self groupContainerPaths];
LABEL_23:
          long long v30 = v27;
          [v27 removeObjectForKey:v21];

          uint64_t v18 = v38;
          if (v24) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
        v26 = 0;
        if (v24)
        {
LABEL_24:
          long long v31 = sub_100068600();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v20;
            __int16 v51 = 2114;
            v52 = v24;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Container '%{public}@' assigned with pseudo content root path: %{public}@", buf, 0x16u);
          }

          [v20 setPseudoContentRootPath:v24];
        }
LABEL_27:
        if (v26)
        {
          if ([v26 hasPrefix:@"/private"])
          {
            uint64_t v32 = [v26 substringFromIndex:[@"/private" length]];

            v26 = (void *)v32;
          }
          v33 = sub_100068600();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v20;
            __int16 v51 = 2114;
            v52 = v26;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Container '%{public}@' assigned with content root path: %{public}@", buf, 0x16u);
          }

          [v20 setContentRootPath:v26];
        }
LABEL_33:

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
      id v17 = v34;
    }
    while (v34);
  }

  return 1;
}

- (BOOL)_purgeContainerizedDataNotInManifest
{
  id v3 = [(MSDApplicationDataPrepareOperation *)self dataContainerPaths];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100029990;
  v9[3] = &unk_100152160;
  v9[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v4 = [(MSDApplicationDataPrepareOperation *)self plugInContainerPaths];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029A74;
  v8[3] = &unk_100152160;
  v8[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  v5 = [(MSDApplicationDataPrepareOperation *)self groupContainerPaths];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029B58;
  v7[3] = &unk_100152160;
  v7[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];

  return 1;
}

- (void)_createUninstallOperationForContainer:(id)a3 ofType:(id)a4 containerPath:(id)a5 isContainerized:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MSDOperation *)self context];
  id v13 = [v12 identifier];

  if (v6)
  {
    id v14 = +[MSDContentFilesContext defaultContextForContainerizedAppDataItem:v11];

    [v14 setContentRootPath:v16];
  }
  else
  {
    id v14 = +[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:v11];
  }
  [v14 setContainerType:v10];

  [v14 setAppIdentifier:v13];
  uint64_t v15 = +[MSDOperationRepository createOperationFromIdentifier:@"MSDContentFilesUninstallOperation" withContext:v14];
  [(MSDOperation *)self produceNewDependentOperation:v15 forRollback:0];
}

- (NSMutableDictionary)dataContainerPaths
{
  return self->_dataContainerPaths;
}

- (void)setDataContainerPaths:(id)a3
{
}

- (NSMutableDictionary)plugInContainerPaths
{
  return self->_plugInContainerPaths;
}

- (void)setPlugInContainerPaths:(id)a3
{
}

- (NSMutableDictionary)groupContainerPaths
{
  return self->_groupContainerPaths;
}

- (void)setGroupContainerPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContainerPaths, 0);
  objc_storeStrong((id *)&self->_plugInContainerPaths, 0);

  objc_storeStrong((id *)&self->_dataContainerPaths, 0);
}

@end