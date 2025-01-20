@interface PBItemCollection
+ (id)unserializeCollectionFromBaseURL:(id)a3 persistenceName:(id)a4 outError:(id *)a5;
+ (id)unserializeCollectionFromPasteboardURL:(id)a3 baseURL:(id)a4 outError:(id *)a5;
- (id)directoryName;
- (id)serializeToBaseURL:(id)a3;
- (id)serializeToBaseURL:(id)a3 isServerToServerCopy:(BOOL)a4 allowedToCopyOnPaste:(BOOL)a5;
- (unint64_t)authorizationDecisionForAuditTokenInfo:(id)a3 timestamp:(unint64_t)a4;
- (void)recordUserAuthorizationDecision:(BOOL)a3 auditTokenInfo:(id)a4;
- (void)setStorageBaseURL:(id)a3;
@end

@implementation PBItemCollection

+ (id)unserializeCollectionFromBaseURL:(id)a3 persistenceName:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  v8 = PBSHA1HashOfString();
  v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];
  v10 = [a1 unserializeCollectionFromPasteboardURL:v9 baseURL:v7 outError:a5];

  if (a5) {
    *a5 = 0;
  }

  return v10;
}

+ (id)unserializeCollectionFromPasteboardURL:(id)a3 baseURL:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 URLByAppendingPathComponent:@"Manifest.plist" isDirectory:0];
  v11 = +[NSData dataWithContentsOfURL:v10];
  if (v11)
  {
    v18[0] = 0;
    id v12 = [objc_alloc((Class)PBKeyedUnarchiver) initForReadingFromData:v11 error:v18];
    id v13 = v18[0];
    [v12 setDecodingFailurePolicy:0];
    v14 = [a1 allowedClassesForSecureCoding];
    [v12 setAllowedClasses:v14];

    v15 = [v12 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [v12 finishDecoding];
    v16 = v15;
    [v15 setStorageBaseURL:v9];

    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    PBCannotUnserializePasteboardError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (v13) {
    *a5 = v13;
  }
LABEL_7:

  return v16;
}

- (id)directoryName
{
  v2 = [(PBItemCollection *)self persistenceName];
  v3 = PBSHA1HashOfString();

  return v3;
}

- (id)serializeToBaseURL:(id)a3
{
  return [(PBItemCollection *)self serializeToBaseURL:a3 isServerToServerCopy:0 allowedToCopyOnPaste:0];
}

- (id)serializeToBaseURL:(id)a3 isServerToServerCopy:(BOOL)a4 allowedToCopyOnPaste:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(PBItemCollection *)self directoryName];
  v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10001C874;
  v46 = sub_10001C884;
  id v47 = 0;
  v11 = +[NSFileManager defaultManager];
  id v12 = [v10 path];
  unsigned __int8 v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    if ([(PBItemCollection *)self isDeviceLockedPasteboard])
    {
      NSFileAttributeKey v52 = NSFileProtectionKey;
      NSFileProtectionType v53 = NSFileProtectionNone;
      v14 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    }
    else
    {
      v14 = 0;
    }
    v15 = [v10 path];
    v16 = (id *)(v43 + 5);
    id obj = (id)v43[5];
    [v11 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v14 error:&obj];
    objc_storeStrong(v16, obj);
  }
  if (v43[5])
  {
    v17 = [(PBItemCollection *)self name];
    uint64_t v18 = PBCannotSerializePasteboardError();
    id v19 = (id)v43[5];
    v43[5] = v18;
  }
  else
  {
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    unsigned int v21 = [(PBItemCollection *)self isDeviceLockedPasteboard];
    v22 = (id *)&NSFileProtectionNone;
    if (!v21) {
      v22 = (id *)&NSFileProtectionCompleteUntilFirstUserAuthentication;
    }
    id v19 = *v22;
    v23 = [(PBItemCollection *)self items];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001CBB8;
    v38[3] = &unk_100031C88;
    v40 = &v42;
    v17 = v20;
    v39 = v17;
    sub_10001C88C(v10, v23, v19, a4, v5, v38);

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (!v43[5])
    {
      v35 = [v10 URLByAppendingPathComponent:@"Manifest.plist" isDirectory:0];
      id v37 = 0;
      v24 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v37];
      id v25 = v37;
      if (v24)
      {
        v26 = _PBLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [(PBItemCollection *)self name];
          *(_DWORD *)buf = 138412546;
          uint64_t v49 = v27;
          __int16 v50 = 2112;
          v51 = v35;
          v34 = (void *)v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Writing manifest for pasteboard %@ to URL: %@", buf, 0x16u);
        }
        id v36 = v25;
        [v24 writeToURL:v35 options:0 error:&v36];
        id v28 = v36;

        id v25 = v28;
      }
      if (v25)
      {
        v29 = [(PBItemCollection *)self name];
        uint64_t v30 = PBCannotSerializePasteboardError();
        v31 = (void *)v43[5];
        v43[5] = v30;
      }
      else
      {
        [(PBItemCollection *)self setIsRemote:0];
      }
    }
  }

  id v32 = (id)v43[5];
  _Block_object_dispose(&v42, 8);

  return v32;
}

- (void)setStorageBaseURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PBItemCollection *)self persistenceName];
  v6 = PBSHA1HashOfString();

  id v7 = [v4 URLByAppendingPathComponent:v6 isDirectory:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(PBItemCollection *)self items];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setStorageBaseURL:v7];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)authorizationDecisionForAuditTokenInfo:(id)a3 timestamp:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 41;
  id v7 = PBItemQueue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CE78;
  v11[3] = &unk_100031CB0;
  v11[4] = self;
  id v12 = v6;
  long long v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  unint64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)recordUserAuthorizationDecision:(BOOL)a3 auditTokenInfo:(id)a4
{
  id v6 = a4;
  id v7 = PBItemQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CFA0;
  block[3] = &unk_100031CD8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

@end