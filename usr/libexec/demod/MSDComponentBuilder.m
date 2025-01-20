@interface MSDComponentBuilder
- (BOOL)forBackgroundDownload;
- (BOOL)isCriticalUpdate;
- (BOOL)verifyHashBeforeStaging;
- (MSDComponentBuilder)initWithSignedManifest:(id)a3 andOptions:(id)a4;
- (MSDSignedManifest)signedManifest;
- (NSString)appItemToDefer;
- (id)_buildAppComponentsNotInManifest:(id)a3;
- (id)buildComponentsFromManifest;
- (id)buildComponentsNotInManifest;
- (void)setAppItemToDefer:(id)a3;
- (void)setForBackgroundDownload:(BOOL)a3;
- (void)setIsCriticalUpdate:(BOOL)a3;
- (void)setSignedManifest:(id)a3;
- (void)setVerifyHashBeforeStaging:(BOOL)a3;
@end

@implementation MSDComponentBuilder

- (MSDComponentBuilder)initWithSignedManifest:(id)a3 andOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSDComponentBuilder;
  v8 = [(MSDComponentBuilder *)&v18 init];
  v9 = v8;
  if (v8)
  {
    [(MSDComponentBuilder *)v8 setSignedManifest:v6];
    [(MSDComponentBuilder *)v9 setIsCriticalUpdate:0];
    [(MSDComponentBuilder *)v9 setForBackgroundDownload:0];
    [(MSDComponentBuilder *)v9 setVerifyHashBeforeStaging:0];
    [(MSDComponentBuilder *)v9 setAppItemToDefer:0];
    v10 = [v7 objectForKey:@"IsCriticalUpdate"];
    v11 = v10;
    if (v10) {
      -[MSDComponentBuilder setIsCriticalUpdate:](v9, "setIsCriticalUpdate:", [v10 BOOLValue]);
    }
    v12 = [v7 objectForKey:@"ForBackgroundDownload"];
    v13 = v12;
    if (v12) {
      -[MSDComponentBuilder setForBackgroundDownload:](v9, "setForBackgroundDownload:", [v12 BOOLValue]);
    }
    v14 = [v7 objectForKey:@"VerifyHashBeforeStaging"];
    v15 = v14;
    if (v14) {
      -[MSDComponentBuilder setVerifyHashBeforeStaging:](v9, "setVerifyHashBeforeStaging:", [v14 BOOLValue]);
    }
    v16 = [v7 objectForKey:@"AppItemToDefer"];
    if (v16) {
      [(MSDComponentBuilder *)v9 setAppItemToDefer:v16];
    }
  }
  return v9;
}

- (id)buildComponentsNotInManifest
{
  v3 = [MSDOperationBuilder alloc];
  v4 = [(MSDComponentBuilder *)self signedManifest];
  v5 = [(MSDOperationBuilder *)v3 initWithSignedManifest:v4 forBackgroundDownload:[(MSDComponentBuilder *)self forBackgroundDownload] verifyHashBeforeStaging:[(MSDComponentBuilder *)self verifyHashBeforeStaging]];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(MSDComponentBuilder *)self _buildAppComponentsNotInManifest:v5];
  if (v7)
  {
    [v6 addObjectsFromArray:v7];
    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)buildComponentsFromManifest
{
  unsigned __int8 v3 = [(MSDComponentBuilder *)self isCriticalUpdate];
  v4 = [(MSDComponentBuilder *)self signedManifest];
  v5 = v4;
  if (v3) {
    [v4 criticalComponents];
  }
  else {
  id v6 = [v4 installationOrder];
  }

  id v7 = +[MSDAppHelper sharedInstance];
  id v8 = [v7 installedApps];

  v9 = [(MSDComponentBuilder *)self signedManifest];
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 getVersion]);

  v11 = +[MSDProgressUpdater sharedInstance];
  v12 = [v11 bundleInProgress];

  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_10003369C;
  v48[4] = sub_1000336AC;
  v13 = [MSDOperationBuilder alloc];
  v14 = [(MSDComponentBuilder *)self signedManifest];
  v49 = [(MSDOperationBuilder *)v13 initWithSignedManifest:v14 forBackgroundDownload:[(MSDComponentBuilder *)self forBackgroundDownload] verifyHashBeforeStaging:[(MSDComponentBuilder *)self verifyHashBeforeStaging]];

  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10003369C;
  v46 = sub_1000336AC;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10003369C;
  v40 = sub_1000336AC;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_1000336B4;
  v23 = &unk_100152580;
  id v15 = v10;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  v26 = self;
  v28 = v48;
  id v17 = v8;
  id v27 = v17;
  v29 = &v36;
  v30 = &v42;
  v31 = &v32;
  [v6 enumerateObjectsUsingBlock:&v20];
  if (*((unsigned char *)v33 + 24))
  {
    if (v37[5]) {
      [v43[5] addObject:v20, v21, v22, v23, v24, v25, v26];
    }
    id v18 = [[v43[5] copy:v20, v21, v22, v23];
  }
  else
  {
    id v18 = 0;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v48, 8);

  return v18;
}

- (id)_buildAppComponentsNotInManifest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(MSDComponentBuilder *)self signedManifest];
  id v7 = [v6 getAppList];

  id v8 = +[MSDAppHelper sharedInstance];
  v9 = [v8 installedApps];

  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Building components for removing app not in manifest...", buf, 2u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v28;
    *(void *)&long long v13 = 138543362;
    long long v26 = v13;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v18 = [v7 objectForKey:v17 v26, (void)v27];

        if (!v18)
        {
          v19 = sub_100068600();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            uint64_t v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Building component for removing app: %{public}@", buf, 0xCu);
          }

          v20 = [v4 buildAppRemovalOperationsWithIdentifier:v17];
          if (!v20
            || (uint64_t v21 = [[MSDComponent alloc] initWithName:v17 andOperations:v20]) == 0)
          {

            id v25 = sub_100068600();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_1000CB374(v25);
            }

            id v23 = 0;
            goto LABEL_17;
          }
          v22 = v21;
          [(MSDComponent *)v21 setForRemoval:1];
          [v5 addObject:v22];
        }
      }
      id v14 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v23 = v5;
LABEL_17:

  return v23;
}

- (BOOL)isCriticalUpdate
{
  return self->_isCriticalUpdate;
}

- (void)setIsCriticalUpdate:(BOOL)a3
{
  self->_isCriticalUpdate = a3;
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (NSString)appItemToDefer
{
  return self->_appItemToDefer;
}

- (void)setAppItemToDefer:(id)a3
{
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedManifest, 0);

  objc_storeStrong((id *)&self->_appItemToDefer, 0);
}

@end