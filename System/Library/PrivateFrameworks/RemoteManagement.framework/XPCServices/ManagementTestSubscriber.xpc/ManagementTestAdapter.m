@interface ManagementTestAdapter
- (ManagementTestAdapter)init;
- (id)_addReasons:(id)a3 toError:(id)a4;
- (id)_persistedDeclarationKeysForScope:(int64_t)a3;
- (id)_userDefaultsKeyForScope:(int64_t)a3;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)_addDeclarationKey:(id)a3 scope:(int64_t)a4;
- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 reasonDescription:(id)a6 completionHandler:(id)a7;
- (void)_downloadAssetDataFromStore:(id)a3 identifier:(id)a4 reference:(id)a5 completionHandler:(id)a6;
- (void)_persistDeclarationKeys:(id)a3 scope:(int64_t)a4;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation ManagementTestAdapter

- (ManagementTestAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)ManagementTestAdapter;
  v2 = [(ManagementTestAdapter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (id)configurationClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void))a4;
  v5 = +[RMLog managementTestAdapter];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100005CDC(v5);
  }

  v4[2](v4, 0);
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  objc_super v6 = (void (**)(id, void))a5;
  v7 = +[RMLog managementTestAdapter];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100005D20(a3, v7);
  }

  v6[2](v6, 0);
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  v8 = (void (**)(id, void *, void))a4;
  objc_super v6 = self->_lock;
  objc_sync_enter(v6);
  v7 = [(ManagementTestAdapter *)self _persistedDeclarationKeysForScope:a3];
  objc_sync_exit(v6);

  v8[2](v8, v7, 0);
}

- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 declaration];
  v14 = [v10 store];
  v15 = [v13 payloadEchoDataAssetReference];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000451C;
  v19[3] = &unk_1000082E8;
  v19[4] = self;
  id v20 = v10;
  id v22 = v12;
  int64_t v23 = a5;
  id v21 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(ManagementTestAdapter *)self _downloadAssetDataFromStore:v14 identifier:v15 reference:v18 completionHandler:v19];
}

- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  v8 = (void (**)(id, void))a5;
  v9 = self->_lock;
  objc_sync_enter(v9);
  id v10 = [(ManagementTestAdapter *)self _persistedDeclarationKeysForScope:a4];
  [v10 removeObject:v11];
  [(ManagementTestAdapter *)self _persistDeclarationKeys:v10 scope:a4];

  objc_sync_exit(v9);
  v8[2](v8, 0);
}

- (id)declarationKeyForConfiguration:(id)a3
{
  id v3 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"com.apple.RemoteManagement.ManagementTestExtension" reference:a3];

  return v3;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v29 = (void (**)(id, uint64_t, void *, void))a5;
  v7 = +[RMLog managementTestAdapter];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 declaration];
    v9 = [v8 declarationIdentifier];
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }
  id v10 = [v6 declaration];
  v24 = +[RMStoreLocalizable string:@"UI.Title"];
  int64_t v23 = +[RMStoreLocalizable string:@"UI.Description"];
  v28 = +[RMStoreLocalizable string:@"UI.Key.Echo"];
  v32[0] = v28;
  v27 = [v10 payloadEcho];
  v32[1] = v27;
  v25 = +[NSArray arrayWithObjects:v32 count:2];
  v33[0] = v25;
  id v22 = +[RMStoreLocalizable string:@"UI.Key.HasAsset"];
  v31[0] = v22;
  id v11 = [v10 payloadEchoDataAssetReference];
  if (v11) {
    CFStringRef v12 = @"UI.Value.Yes";
  }
  else {
    CFStringRef v12 = @"UI.Value.No";
  }
  v13 = +[RMStoreLocalizable string:v12];
  v31[1] = v13;
  +[NSArray arrayWithObjects:v31 count:2];
  v14 = v26 = v6;
  v33[1] = v14;
  v15 = +[RMStoreLocalizable string:@"UI.Key.ReturnStatus"];
  v30[0] = v15;
  uint64_t v16 = [v10 payloadReturnStatus];
  id v17 = (void *)v16;
  uint64_t v18 = RMModelManagementTestDeclaration_ReturnStatus_installed;
  if (v16) {
    uint64_t v18 = v16;
  }
  v30[1] = v18;
  v19 = +[NSArray arrayWithObjects:v30 count:2];
  v33[2] = v19;
  id v20 = +[NSArray arrayWithObjects:v33 count:3];
  id v21 = +[RMConfigurationUIDetails configurationUIWithTitle:v24 description:v23 details:v20];

  v29[2](v29, 1, v21, 0);
}

- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 reasonDescription:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void *, void *))a7;
  v34 = [(ManagementTestAdapter *)self declarationKeyForConfiguration:v12];
  uint64_t v16 = [v12 declaration];
  if (v13)
  {
    id v17 = self->_lock;
    objc_sync_enter(v17);
    uint64_t v18 = [(ManagementTestAdapter *)self _persistedDeclarationKeysForScope:a5];
    [v18 removeObject:v13];
    [(ManagementTestAdapter *)self _persistDeclarationKeys:v18 scope:a5];

    objc_sync_exit(v17);
  }
  v19 = [v16 payloadEcho];
  id v20 = [v16 payloadReturnStatus];
  unsigned int v21 = [v20 isEqualToString:RMModelManagementTestDeclaration_ReturnStatus_installed];

  if (!v21)
  {
    v25 = [v16 payloadReturnStatus];
    unsigned int v26 = [v25 isEqualToString:RMModelManagementTestDeclaration_ReturnStatus_unlocked];

    if (!v26)
    {
      v24 = +[RMErrorUtilities createInternalError];
      if ([v19 length] || objc_msgSend(v14, "length"))
      {
        v30 = +[RMModelStatusReason reasonWithCode:v19 description:v14 underlyingError:v24];
        v35 = v30;
        v31 = +[NSArray arrayWithObjects:&v35 count:1];

        uint64_t v32 = [(ManagementTestAdapter *)self _addReasons:v31 toError:v24];

        int64_t v23 = 0;
        v24 = (void *)v32;
        goto LABEL_19;
      }
LABEL_18:
      int64_t v23 = 0;
      goto LABEL_19;
    }
    v27 = +[RMDevice currentDevice];
    unsigned int v28 = [v27 locked];

    if (v28)
    {
      v29 = +[RMModelStatusReason reasonWithCode:@"Device.Locked" description:@"Device is locked" underlyingError:0];
      v37 = v29;
      int64_t v23 = +[NSArray arrayWithObjects:&v37 count:1];

      v24 = +[RMErrorUtilities createInternalError];
      goto LABEL_19;
    }
    [(ManagementTestAdapter *)self _addDeclarationKey:v34 scope:a5];
    if ([v19 length] || objc_msgSend(v14, "length"))
    {
      v33 = +[RMModelStatusReason reasonWithCode:v19 description:v14 underlyingError:0];
      v36 = v33;
      int64_t v23 = +[NSArray arrayWithObjects:&v36 count:1];

      goto LABEL_7;
    }
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  [(ManagementTestAdapter *)self _addDeclarationKey:v34 scope:a5];
  if (![v19 length] && !objc_msgSend(v14, "length")) {
    goto LABEL_17;
  }
  id v22 = +[RMModelStatusReason reasonWithCode:v19 description:v14 underlyingError:0];
  v38 = v22;
  int64_t v23 = +[NSArray arrayWithObjects:&v38 count:1];

LABEL_7:
  v24 = 0;
LABEL_19:
  v15[2](v15, v23, v24);
}

- (void)_downloadAssetDataFromStore:(id)a3 identifier:(id)a4 reference:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = v10;
  if (v8)
  {
    id v12 = NSTemporaryDirectory();
    id v13 = +[NSURL fileURLWithPath:v12];

    id v14 = objc_opt_new();
    v15 = [v14 UUIDString];
    uint64_t v16 = +[NSString stringWithFormat:@"%@.txt", v15];
    id v17 = [v13 URLByAppendingPathComponent:v16];

    uint64_t v18 = +[RMLog managementTestAdapter];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100005DB0((uint64_t)v17, v18);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004F44;
    v20[3] = &unk_100008310;
    id v21 = v17;
    id v22 = v11;
    id v19 = v17;
    +[RMAssetResolverController resolveDataAsset:v9 assetIdentifier:v8 downloadURL:v19 completionHandler:v20];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)_addDeclarationKey:(id)a3 scope:(int64_t)a4
{
  id v8 = a3;
  id v6 = self->_lock;
  objc_sync_enter(v6);
  v7 = [(ManagementTestAdapter *)self _persistedDeclarationKeysForScope:a4];
  [v7 addObject:v8];
  [(ManagementTestAdapter *)self _persistDeclarationKeys:v7 scope:a4];

  objc_sync_exit(v6);
}

- (void)_persistDeclarationKeys:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v12), "key", (void)v16);
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = +[NSUserDefaults standardUserDefaults];
  v15 = [(ManagementTestAdapter *)self _userDefaultsKeyForScope:a4];
  [v14 setObject:v7 forKey:v15];
}

- (id)_persistedDeclarationKeysForScope:(int64_t)a3
{
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [(ManagementTestAdapter *)self _userDefaultsKeyForScope:a3];
  v7 = [v5 objectForKey:v6];

  id v8 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[RMStoreDeclarationKey newDeclarationKey:](RMStoreDeclarationKey, "newDeclarationKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_userDefaultsKeyForScope:(int64_t)a3
{
  if (a3) {
    return @"ManagementTestAppliedSystemConfigurations";
  }
  else {
    return @"ManagementTestAppliedUserConfigurations";
  }
}

- (id)_addReasons:(id)a3 toError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 userInfo];
  id v8 = v7;
  if (!v7) {
    v7 = &__NSDictionary0__struct;
  }
  id v9 = [v7 mutableCopy];

  [v9 setObject:v6 forKeyedSubscript:RMSubscriberStoreNSErrorReasonsKey];
  id v10 = [v5 domain];
  id v11 = [v5 code];

  uint64_t v12 = +[NSError errorWithDomain:v10 code:v11 userInfo:v9];

  return v12;
}

- (void).cxx_destruct
{
}

@end