@interface MIContainerLinkManager
+ (id)_privateContainerManager;
+ (id)_sharedContainerManager;
+ (id)sharedInstanceForDomain:(unint64_t)a3;
- (BOOL)_onQueue_isValidLinkForParent:(id)a3 toChild:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_removeParent:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_setLinkedParentBundleIDList:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_updateLinkForParent:(id)a3 toChild:(id)a4 operationType:(unint64_t)a5 error:(id *)a6;
- (BOOL)getLinkedParent:(id *)a3 forChild:(id)a4 error:(id *)a5;
- (BOOL)linkChild:(id)a3 toParent:(id)a4 error:(id *)a5;
- (BOOL)preflightLinkingChild:(id)a3 toParent:(id)a4 error:(id *)a5;
- (BOOL)removeParent:(id)a3 error:(id *)a4;
- (BOOL)unlinkChild:(id)a3 fromParent:(id)a4 error:(id *)a5;
- (MIContainerLinkManager)initWithDomain:(unint64_t)a3;
- (NSMutableDictionary)parentToLinkedChildrenMap;
- (NSSet)linkedParentBundleIDs;
- (OS_dispatch_queue)internalQueue;
- (id)_onQueue_childrenForParentBundleID:(id)a3 error:(id *)a4;
- (id)_onQueue_linkedParentBundleIDs:(id *)a3;
- (id)childrenForParentBundleID:(id)a3 error:(id *)a4;
- (unint64_t)domain;
- (void)_onQueue_migratePlaygroundsBundleMetadata;
- (void)setDomain:(unint64_t)a3;
- (void)setLinkedParentBundleIDs:(id)a3;
- (void)setParentToLinkedChildrenMap:(id)a3;
@end

@implementation MIContainerLinkManager

- (void)_onQueue_migratePlaygroundsBundleMetadata
{
  v2 = self;
  v3 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4 = objc_opt_new();
  char v54 = 0;
  v5 = +[MITestManager sharedInstance];
  id v53 = 0;
  unsigned int v6 = [v5 isRunningInTestMode:&v54 outError:&v53];
  id v7 = v53;

  if (v6)
  {
    if (v54) {
      v8 = @"com.apple.mock.Playgrounds";
    }
    else {
      v8 = @"com.apple.Playgrounds";
    }
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v35 = v7;
      MOLogWrite();
    }
    v8 = @"com.apple.Playgrounds";
  }

  v9 = v8;
  v41 = objc_opt_new();
  v42 = v9;
  id v52 = 0;
  v10 = +[MIBundleContainer appBundleContainerWithIdentifier:v9 createIfNeeded:0 created:0 error:&v52];
  id v11 = v52;
  id v12 = v11;
  if (v10)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    [v4 addObject:v9, v35];
    id v51 = v12;
    v13 = [v10 bundleMetadataWithError:&v51];
    id v14 = v51;

    if (v13)
    {
      id v50 = v14;
      v15 = +[MIBundleContainer containersWithClass:1 error:&v50];
      id v12 = v50;

      if (v15)
      {
        v39 = v4;
        v40 = v13;
        v37 = v10;
        v38 = v2;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v47;
          id v20 = v12;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              v22 = v20;
              if (*(void *)v47 != v19) {
                objc_enumerationMutation(v16);
              }
              v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              v25 = [v23 identifier];
              id v45 = v20;
              v26 = [v23 bundleMetadataWithError:&v45];
              id v20 = v45;

              if (v26)
              {
                v27 = [v26 linkedParentBundleID];
                unsigned int v28 = [v27 isEqualToString:v42];

                if (v28) {
                  [v41 addObject:v25];
                }
              }
              else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                id v35 = v25;
                id v36 = v20;
                MOLogWrite();
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v18);
        }
        else
        {
          id v20 = v12;
        }

        id v31 = [v41 copy];
        if ([v41 count])
        {
          [v40 setLinkedChildBundleIDs:v31];
          id v44 = v20;
          v10 = v37;
          unsigned __int8 v32 = [v37 saveBundleMetadata:v40 withError:&v44];
          id v12 = v44;

          v2 = v38;
          v4 = v39;
          if ((v32 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
              sub_100059244();
            }
            goto LABEL_48;
          }
        }
        else
        {
          id v12 = v20;
          v2 = v38;
          v4 = v39;
          v10 = v37;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_parentToLinkedChildrenMap, "setObject:forKeyedSubscript:", v31, v42, v35, v36);
LABEL_48:

        goto LABEL_49;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000591D4();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059164();
      }
      id v12 = v14;
    }
  }
  else
  {
    v29 = [v11 domain];
    if ([v29 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v30 = [v12 code];

      if (v30 == (id)21) {
        goto LABEL_49;
      }
    }
    else
    {
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000590F4();
    }
  }
LABEL_49:
  id v43 = v12;
  unsigned __int8 v33 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:](v2, "_onQueue_setLinkedParentBundleIDList:error:", v4, &v43, v35);
  id v34 = v43;

  if ((v33 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100059084();
  }
}

- (MIContainerLinkManager)initWithDomain:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MIContainerLinkManager;
  v4 = [(MIContainerLinkManager *)&v16 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installd.LinkedContainers", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    parentToLinkedChildrenMap = v4->_parentToLinkedChildrenMap;
    v4->_parentToLinkedChildrenMap = (NSMutableDictionary *)v7;

    v4->_domain = a3;
    v9 = +[MIFileManager defaultManager];
    v10 = sub_10002F2C4();
    unsigned int v11 = [v9 itemDoesNotExistAtURL:v10];

    if (a3 == 2)
    {
      if (v11)
      {
        id v12 = [(MIContainerLinkManager *)v4 internalQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002F33C;
        block[3] = &unk_10008CC50;
        v15 = v4;
        dispatch_sync(v12, block);
      }
    }
  }
  return v4;
}

+ (id)_sharedContainerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F3E4;
  block[3] = &unk_10008CC28;
  void block[4] = a1;
  if (qword_1000A6010 != -1) {
    dispatch_once(&qword_1000A6010, block);
  }
  v2 = (void *)qword_1000A6018;

  return v2;
}

+ (id)_privateContainerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F4C8;
  block[3] = &unk_10008CC28;
  void block[4] = a1;
  if (qword_1000A6020 != -1) {
    dispatch_once(&qword_1000A6020, block);
  }
  v2 = (void *)qword_1000A6028;

  return v2;
}

+ (id)sharedInstanceForDomain:(unint64_t)a3
{
  v4 = objc_opt_class();
  if (a3 == 3) {
    [v4 _privateContainerManager];
  }
  else {
  dispatch_queue_t v5 = [v4 _sharedContainerManager];
  }

  return v5;
}

- (id)_onQueue_linkedParentBundleIDs:(id *)a3
{
  dispatch_queue_t v5 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = self->_linkedParentBundleIDs;
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = v6;
    goto LABEL_39;
  }
  v9 = sub_10002F2C4();
  v40 = objc_opt_new();
  id v49 = 0;
  v10 = +[NSDictionary dictionaryWithContentsOfURL:v9 error:&v49];
  id v11 = v49;
  if (!v10)
  {
LABEL_10:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000593A4(v9, (uint64_t)v11);
    }
    if ((id)[(MIContainerLinkManager *)self domain] == (id)3)
    {
      id v48 = v11;
      id v18 = &v48;
      uint64_t v19 = &v48;
      uint64_t v20 = 14;
    }
    else
    {
      id v47 = v11;
      id v18 = &v47;
      uint64_t v19 = &v47;
      uint64_t v20 = 1;
    }
    id v17 = +[MIBundleContainer containersWithClass:v20 error:v19];
    id v21 = *v18;

    if (v17)
    {
      v37 = v10;
      v38 = a3;
      v39 = v9;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v36 = v17;
      id v22 = v17;
      id v23 = [v22 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v44;
LABEL_18:
        v26 = 0;
        v27 = v21;
        while (1)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          unsigned int v28 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v26);
          id v30 = [v28 identifier];
          id v42 = v27;
          id v31 = [v28 bundleMetadataWithError:&v42];
          id v21 = v42;

          if (!v31) {
            break;
          }
          unsigned __int8 v32 = [v31 linkedParentBundleID];
          if (v32) {
            [v40 addObject:v32];
          }

          v26 = (char *)v26 + 1;
          v27 = v21;
          if (v24 == v26)
          {
            id v24 = [v22 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v24) {
              goto LABEL_18;
            }
            goto LABEL_26;
          }
        }
        id v17 = v36;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100059324();
        }

        unsigned __int8 v33 = 0;
        v9 = v39;
        uint64_t v7 = 0;
        v10 = v37;
        a3 = v38;
        if (v38) {
          goto LABEL_35;
        }
        goto LABEL_37;
      }
LABEL_26:

      id v41 = v21;
      unsigned __int8 v33 = [(MIContainerLinkManager *)self _onQueue_setLinkedParentBundleIDList:v40 error:&v41];
      id v34 = v41;

      id v21 = v34;
      v9 = v39;
      uint64_t v7 = 0;
      v10 = v37;
      a3 = v38;
      id v17 = v36;
      if (!v38)
      {
LABEL_37:
        id v11 = v21;
        goto LABEL_38;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000592B4();
      }
      unsigned __int8 v33 = 0;
      if (!a3) {
        goto LABEL_37;
      }
    }
LABEL_35:
    if ((v33 & 1) == 0)
    {
      id v11 = v21;
      *a3 = v11;
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  id v12 = [v10 objectForKeyedSubscript:@"linkedParentBundles"];
  objc_opt_class();
  id v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  if (!v13) {
    goto LABEL_9;
  }
  objc_opt_class();
  char v14 = sub_100014D8C(v13);

  if ((v14 & 1) == 0) {
    goto LABEL_9;
  }
  v15 = +[NSSet setWithArray:v13];
  linkedParentBundleIDs = self->_linkedParentBundleIDs;
  self->_linkedParentBundleIDs = v15;

  id v17 = 0;
LABEL_38:
  v8 = self->_linkedParentBundleIDs;

LABEL_39:

  return v8;
}

- (BOOL)_onQueue_setLinkedParentBundleIDList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  v9 = sub_10002F2C4();
  if (v6)
  {
    if ([(NSSet *)self->_linkedParentBundleIDs isEqual:v6])
    {
      v10 = 0;
      id v11 = 0;
LABEL_7:
      BOOL v16 = 1;
      goto LABEL_14;
    }
    CFStringRef v21 = @"linkedParentBundles";
    id v12 = [v6 allObjects];
    id v22 = v12;
    v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    id v20 = 0;
    unsigned __int8 v13 = [v10 MI_writeToURL:v9 format:200 options:1 error:&v20];
    id v11 = v20;
    if (v13)
    {
      char v14 = (NSSet *)[v6 copy];
      linkedParentBundleIDs = self->_linkedParentBundleIDs;
      self->_linkedParentBundleIDs = v14;

      goto LABEL_7;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v19 = [v9 path];
      MOLogWrite();
    }
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]", 290, MIInstallerErrorDomain, 4, 0, 0, @"Updated linked parent list for linked bundles is nil", v8, v18);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  if (a4)
  {
    id v11 = v11;
    BOOL v16 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_14:

  return v16;
}

- (BOOL)_onQueue_isValidLinkForParent:(id)a3 toChild:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v10);

  id v18 = 0;
  id v11 = [(MIContainerLinkManager *)self _onQueue_linkedParentBundleIDs:&v18];
  id v12 = v18;
  if (v11)
  {
    if ([v11 containsObject:v9])
    {
      sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]", 331, MIInstallerErrorDomain, 4, 0, 0, @"Existing parent app bundle ID \"%@\" can't be added as a child of \"%@\".", v13, (uint64_t)v9);
    }
    else
    {
      if (![v9 isEqualToString:v8])
      {
        BOOL v16 = 1;
        goto LABEL_11;
      }
      sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]", 336, MIInstallerErrorDomain, 4, 0, 0, @"Same bundle ID, \"%@\", can't be passed as a parent and child for linkage creation", v14, (uint64_t)v9);
    uint64_t v15 = };

    id v12 = (id)v15;
  }
  if (a5)
  {
    id v12 = v12;
    BOOL v16 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_11:

  return v16;
}

- (BOOL)_onQueue_updateLinkForParent:(id)a3 toChild:(id)a4 operationType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v42 = a4;
  id v11 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(MIContainerLinkManager *)self parentToLinkedChildrenMap];
  id v41 = [v12 objectForKeyedSubscript:v10];

  id v49 = 0;
  uint64_t v13 = [(MIContainerLinkManager *)self _onQueue_linkedParentBundleIDs:&v49];
  id v14 = v49;
  if (!v13)
  {
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    if (a6)
    {
LABEL_16:
      id v14 = v14;
      BOOL v21 = 0;
      *a6 = v14;
      goto LABEL_17;
    }
LABEL_5:
    BOOL v21 = 0;
    goto LABEL_17;
  }
  id v40 = [v13 mutableCopy];
  if ((id)[(MIContainerLinkManager *)self domain] == (id)3)
  {
    id v48 = v14;
    uint64_t v15 = &v48;
    uint64_t v16 = +[MIBundleContainer privateAppBundleContainerWithIdentifier:v10 createIfNeeded:0 created:0 error:&v48];
  }
  else
  {
    id v47 = v14;
    uint64_t v15 = &v47;
    uint64_t v16 = +[MIBundleContainer appBundleContainerWithIdentifier:v10 createIfNeeded:0 created:0 error:&v47];
  }
  id v20 = (void *)v16;
  id v22 = *v15;

  if (!v20)
  {
    sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 376, MIInstallerErrorDomain, 162, v22, 0, @"Failed to locate installed app for requested parent bundle %@", v23, (uint64_t)v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = 0;
LABEL_14:
    id v18 = 0;
    goto LABEL_15;
  }
  id v46 = v22;
  id v17 = [v20 bundleMetadataWithError:&v46];
  id v24 = v46;

  if (!v17)
  {
    sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 382, MIInstallerErrorDomain, 4, v24, 0, @"Failed to read bundle metadata for requested parent bundle %@", v25, (uint64_t)v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v26 = [v17 linkedChildBundleIDs];
  id v18 = [v26 mutableCopy];

  if (v41)
  {
    if (objc_msgSend(v18, "isEqualToSet:"))
    {
      int v39 = 0;
      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059440();
    }
  }
  int v39 = 1;
LABEL_21:
  if (a5 == 1)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v36 = v42;
      id v38 = v10;
      MOLogWrite();
    }
    if (objc_msgSend(v18, "containsObject:", v42, v36, v38))
    {
      [v18 removeObject:v42];
      int v39 = 1;
    }
    if (![v18 count]) {
      [v40 removeObject:v10];
    }
    id v30 = v24;
  }
  else
  {
    if (a5)
    {
      sub_100014A08((uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]", 443, MIInstallerErrorDomain, 4, 0, 0, @"Container link manager invoked with invalid operation type %lu", v27, a5);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    id v45 = v24;
    unsigned int v29 = [(MIContainerLinkManager *)self _onQueue_isValidLinkForParent:v10 toChild:v42 error:&v45];
    id v30 = v45;

    if (!v29)
    {
      id v14 = v30;
      goto LABEL_15;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v36 = v10;
      id v38 = v42;
      MOLogWrite();
    }
    if ((objc_msgSend(v18, "containsObject:", v42, v36, v38) & 1) == 0)
    {
      if (!v18) {
        id v18 = (id)objc_opt_new();
      }
      [v18 addObject:v42];
      int v39 = 1;
    }
    if (([v40 containsObject:v10] & 1) == 0) {
      [v40 addObject:v10];
    }
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    id v37 = v18;
    MOLogWrite();
  }
  id v31 = [v18 copy:v37];
  [v17 setLinkedChildBundleIDs:v31];

  if (v39)
  {
    id v44 = v30;
    unsigned __int8 v32 = [v20 saveBundleMetadata:v17 withError:&v44];
    id v14 = v44;

    if (v32)
    {
      id v30 = v14;
      goto LABEL_47;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
LABEL_15:
    uint64_t v19 = v40;
    if (a6) {
      goto LABEL_16;
    }
    goto LABEL_5;
  }
LABEL_47:
  id v43 = v30;
  unsigned int v33 = [(MIContainerLinkManager *)self _onQueue_setLinkedParentBundleIDList:v40 error:&v43];
  id v14 = v43;

  if (!v33) {
    goto LABEL_15;
  }
  if (v39)
  {
    id v34 = [v18 copy];
    id v35 = [(MIContainerLinkManager *)self parentToLinkedChildrenMap];
    [v35 setObject:v34 forKeyedSubscript:v10];
  }
  BOOL v21 = 1;
  uint64_t v19 = v40;
LABEL_17:

  return v21;
}

- (BOOL)preflightLinkingChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100030454;
  uint64_t v25 = sub_100030464;
  id v26 = 0;
  id v10 = [(MIContainerLinkManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003046C;
  block[3] = &unk_10008D688;
  uint64_t v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)linkChild:(id)a3 toParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100030454;
  uint64_t v25 = sub_100030464;
  id v26 = 0;
  id v10 = [(MIContainerLinkManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003068C;
  block[3] = &unk_10008D688;
  uint64_t v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)unlinkChild:(id)a3 fromParent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  unsigned int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100030454;
  uint64_t v25 = sub_100030464;
  id v26 = 0;
  id v10 = [(MIContainerLinkManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000308B0;
  block[3] = &unk_10008D688;
  uint64_t v19 = &v27;
  void block[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)getLinkedParent:(id *)a3 forChild:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((id)[(MIContainerLinkManager *)self domain] == (id)3)
  {
    uint64_t v22 = 0;
    id v9 = (id *)&v22;
    uint64_t v10 = +[MIBundleContainer privateAppBundleContainerWithIdentifier:v8 createIfNeeded:0 created:0 error:&v22];
  }
  else
  {
    uint64_t v21 = 0;
    id v9 = (id *)&v21;
    uint64_t v10 = +[MIBundleContainer appBundleContainerWithIdentifier:v8 createIfNeeded:0 created:0 error:&v21];
  }
  id v11 = (void *)v10;

  id v12 = *v9;
  int v13 = v12;
  if (v11)
  {
    id v20 = v12;
    BOOL v14 = [v11 bundleMetadataWithError:&v20];
    id v15 = v20;

    if (v14)
    {
      uint64_t v16 = [v14 linkedParentBundleID];
      BOOL v17 = 1;
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    BOOL v17 = 0;
    int v13 = v15;
  }
  else
  {
    id v18 = [v12 domain];
    if ([v18 isEqualToString:MIContainerManagerErrorDomain]) {
      BOOL v17 = [v13 code] == (id)21;
    }
    else {
      BOOL v17 = 0;
    }
  }
  BOOL v14 = 0;
  if (a5 && !v17)
  {
    id v15 = v13;
    BOOL v17 = 0;
    BOOL v14 = 0;
    uint64_t v16 = 0;
    *a5 = v15;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v15 = v13;
  uint64_t v16 = 0;
  if (a3) {
LABEL_18:
  }
    *a3 = v16;
LABEL_19:

  return v17;
}

- (id)_onQueue_childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v22 = 0;
  id v8 = [(MIContainerLinkManager *)self _onQueue_linkedParentBundleIDs:&v22];
  id v9 = v22;
  if (!v8)
  {
    id v14 = 0;
LABEL_8:
    id v15 = 0;
    id v12 = 0;
    int v13 = 0;
    goto LABEL_9;
  }
  if (([v8 containsObject:v6] & 1) == 0)
  {
    id v14 = (id)objc_opt_new();
    goto LABEL_8;
  }
  uint64_t v10 = [(MIContainerLinkManager *)self parentToLinkedChildrenMap];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (v11)
  {
    id v12 = 0;
    int v13 = 0;
  }
  else
  {
    id v21 = v9;
    int v13 = +[MIBundleContainer appBundleContainerWithIdentifier:v6 createIfNeeded:0 created:0 error:&v21];
    id v18 = v21;

    if (!v13)
    {
      id v14 = 0;
      id v15 = 0;
      id v12 = 0;
      id v9 = v18;
      goto LABEL_9;
    }
    id v20 = v18;
    id v12 = [v13 bundleMetadataWithError:&v20];
    id v9 = v20;

    if (!v12)
    {
      id v14 = 0;
      id v15 = 0;
      goto LABEL_9;
    }
    id v11 = [v12 linkedChildBundleIDs];
    if (!v11) {
      id v11 = objc_opt_new();
    }
    uint64_t v19 = [(MIContainerLinkManager *)self parentToLinkedChildrenMap];
    [v19 setObject:v11 forKeyedSubscript:v6];
  }
  id v14 = v11;
  id v15 = v14;
LABEL_9:
  if (a4 && !v14) {
    *a4 = v9;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
  id v16 = v14;

  return v16;
}

- (id)childrenForParentBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_100030454;
  id v26 = sub_100030464;
  id v27 = 0;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100030454;
  id v20 = sub_100030464;
  id v21 = 0;
  uint64_t v7 = [(MIContainerLinkManager *)self internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030EE4;
  v12[3] = &unk_10008CF10;
  id v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  id v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    id v9 = (void *)v23[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)_onQueue_removeParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIContainerLinkManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v17 = 0;
  id v8 = [(MIContainerLinkManager *)self _onQueue_linkedParentBundleIDs:&v17];
  id v9 = v17;
  if (!v8)
  {
    id v10 = 0;
    if (!a4)
    {
LABEL_12:
      BOOL v14 = 0;
      goto LABEL_13;
    }
LABEL_6:
    id v9 = v9;
    BOOL v14 = 0;
    *a4 = v9;
    goto LABEL_13;
  }
  if (![v8 containsObject:v6])
  {
    id v10 = 0;
    BOOL v14 = 1;
    goto LABEL_13;
  }
  id v10 = [v8 mutableCopy];
  [v10 removeObject:v6];
  id v16 = v9;
  unsigned __int8 v11 = [(MIContainerLinkManager *)self _onQueue_setLinkedParentBundleIDList:v10 error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
      MOLogWrite();
    }
    id v9 = v12;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  id v13 = [(MIContainerLinkManager *)self parentToLinkedChildrenMap];
  [v13 removeObjectForKey:v6];

  BOOL v14 = 1;
  id v9 = v12;
LABEL_13:

  return v14;
}

- (BOOL)removeParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100030454;
  id v20 = sub_100030464;
  id v21 = 0;
  uint64_t v7 = [(MIContainerLinkManager *)self internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100031284;
  v12[3] = &unk_10008CF10;
  BOOL v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)parentToLinkedChildrenMap
{
  return self->_parentToLinkedChildrenMap;
}

- (void)setParentToLinkedChildrenMap:(id)a3
{
}

- (NSSet)linkedParentBundleIDs
{
  return self->_linkedParentBundleIDs;
}

- (void)setLinkedParentBundleIDs:(id)a3
{
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(unint64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentBundleIDs, 0);
  objc_storeStrong((id *)&self->_parentToLinkedChildrenMap, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end