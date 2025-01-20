@interface WatchEnrollmentAdapter
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 anchorCertificates:(id)a6 completionHandler:(id)a7;
- (void)_removeDeclarationKeyIfNeeded:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation WatchEnrollmentAdapter

- (id)configurationClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v5 = +[MCProfileConnection sharedConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001BFC;
  v7[3] = &unk_1000041C0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:v7];
}

- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = +[RMLog watchEnrollmentAdapter];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(WatchEnrollmentAdapter *)self declarationKeyForConfiguration:v10];
    *(_DWORD *)buf = 138543362;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Apply configuration: %{public}@", buf, 0xCu);
  }
  v15 = [v10 declaration];
  v16 = [v15 payloadAnchorCertificateAssetReferences];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100001EFC;
  v20[3] = &unk_100004210;
  v20[4] = self;
  id v21 = v11;
  id v23 = v12;
  int64_t v24 = a5;
  id v22 = v10;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  +[RMAssetResolverController resolveKeychainAssets:v17 assetIdentifiers:v16 accessGroup:@"com.apple.managed.watch.certificates" completionHandler:v20];
}

- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[RMLog watchEnrollmentAdapter];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Remove configuration: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  [(WatchEnrollmentAdapter *)self _removeDeclarationKeyIfNeeded:v8 scope:a4 completionHandler:v9];
}

- (id)declarationKeyForConfiguration:(id)a3
{
  id v3 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"com.apple.RemoteManagement.WatchEnrollmentExtension" reference:a3];

  return v3;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, void))a5;
  id v8 = +[RMLog watchEnrollmentAdapter];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 declaration];
    id v10 = [v9 declarationIdentifier];
    *(_DWORD *)buf = 138543362;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }
  int v11 = [v6 declaration];
  id v12 = +[RMStoreLocalizable string:@"UI.Title"];
  v13 = +[RMStoreLocalizable string:@"UI.Description"];
  v14 = +[RMStoreLocalizable string:@"UI.Key.URL"];
  v19[0] = v14;
  v15 = [v11 payloadEnrollmentProfileURL];
  v19[1] = v15;
  v16 = +[NSArray arrayWithObjects:v19 count:2];
  v20 = v16;
  id v17 = +[NSArray arrayWithObjects:&v20 count:1];
  id v18 = +[RMConfigurationUIDetails configurationUIWithTitle:v12 description:v13 details:v17];

  v7[2](v7, 1, v18, 0);
}

- (void)_applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 anchorCertificates:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  int64_t v24 = [(WatchEnrollmentAdapter *)self declarationKeyForConfiguration:v14];
  v15 = [v24 key];
  v16 = +[NSSet setWithObject:v15];

  id v17 = [v14 declaration];

  id v18 = [v17 serializeWithType:0];
  id v19 = +[MCProfileConnection sharedConnection];
  v20 = [v17 payloadEnrollmentProfileURL];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100002534;
  v25[3] = &unk_100004238;
  v25[4] = self;
  id v26 = v11;
  id v27 = v12;
  int64_t v28 = a5;
  id v21 = v12;
  id v22 = v11;
  [v19 stageMDMEnrollmentInfoForPairingWatchWithProfileData:0 orServiceURL:v20 anchorCertificates:v13 supervised:1 declarationKeys:v16 declarationConfiguration:v18 completion:v25];
}

- (void)_removeDeclarationKeyIfNeeded:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = v6;
  if (a3)
  {
    id v8 = +[MCProfileConnection sharedConnection];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000272C;
    v9[3] = &unk_100004260;
    id v10 = v7;
    [v8 unstageMDMEnrollmentInfoForPairingWatchWithCompletion:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

@end