@interface CKKSUpdateCurrentItemPointerOperation
- (CKFetchRecordsOperation)fetchRecordsOperation;
- (CKKSKeychainViewState)viewState;
- (CKKSOperationDependencies)deps;
- (CKKSUpdateCurrentItemPointerOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 newItem:(id)a5 hash:(id)a6 accessGroup:(id)a7 identifier:(id)a8 replacing:(id)a9 hash:(id)a10 ckoperationGroup:(id)a11;
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (CKOperationGroup)ckoperationGroup;
- (NSData)newerItemPersistentRef;
- (NSData)newerItemSHA1;
- (NSData)oldItemPersistentRef;
- (NSData)oldItemSHA1;
- (NSString)accessGroup;
- (NSString)currentPointerIdentifier;
- (SecDbItem)_onqueueFindSecDbItem:(id)a3 accessGroup:(id)a4 error:(id *)a5;
- (SecDbItem)_onqueueFindSecDbItemWithQuery:(id)a3 error:(id *)a4;
- (SecDbItem)_onqueueFindSecDbItemWithUUID:(id)a3 accessGroup:(id)a4 error:(id *)a5;
- (SecDbItem)newItem;
- (SecDbItem)oldItem;
- (void)_fetchAndUpdateMirrorEntry:(id)a3;
- (void)dealloc;
- (void)groupStart;
- (void)setAccessGroup:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setCurrentPointerIdentifier:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFetchRecordsOperation:(id)a3;
- (void)setModifyRecordsOperation:(id)a3;
- (void)setNewItem:(SecDbItem *)a3;
- (void)setNewerItemPersistentRef:(id)a3;
- (void)setNewerItemSHA1:(id)a3;
- (void)setOldItem:(SecDbItem *)a3;
- (void)setOldItemPersistentRef:(id)a3;
- (void)setOldItemSHA1:(id)a3;
@end

@implementation CKKSUpdateCurrentItemPointerOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldItemSHA1, 0);
  objc_storeStrong((id *)&self->_oldItemPersistentRef, 0);
  objc_storeStrong((id *)&self->_newerItemSHA1, 0);
  objc_storeStrong((id *)&self->_newerItemPersistentRef, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_modifyRecordsOperation, 0);
  objc_storeStrong((id *)&self->_viewState, 0);

  objc_storeStrong((id *)&self->_currentPointerIdentifier, 0);
}

- (void)setOldItem:(SecDbItem *)a3
{
  self->_oldItem = a3;
}

- (SecDbItem)oldItem
{
  return self->_oldItem;
}

- (void)setNewItem:(SecDbItem *)a3
{
  self->_newItem = a3;
}

- (SecDbItem)newItem
{
  return self->_newItem;
}

- (void)setOldItemSHA1:(id)a3
{
}

- (NSData)oldItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOldItemPersistentRef:(id)a3
{
}

- (NSData)oldItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNewerItemSHA1:(id)a3
{
}

- (NSData)newerItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNewerItemPersistentRef:(id)a3
{
}

- (NSData)newerItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFetchRecordsOperation:(id)a3
{
}

- (CKFetchRecordsOperation)fetchRecordsOperation
{
  return (CKFetchRecordsOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 144, 1);
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCurrentPointerIdentifier:(id)a3
{
}

- (NSString)currentPointerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (SecDbItem)_onqueueFindSecDbItemWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  id v33 = 0;
  CFTypeRef cf = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1001671E8;
  v32 = sub_1001671F8;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100167200;
  v23[3] = &unk_100305470;
  id v6 = a3;
  id v24 = v6;
  v25 = self;
  v26 = &v28;
  v27 = &v35;
  int v7 = sub_10000CBA4(1, 1, 0, (uint64_t)&cf, (uint64_t)v23);
  uint64_t v8 = v29[5];
  if (!v7)
  {
    if (!v8)
    {
      v15 = [(CKKSUpdateCurrentItemPointerOperation *)self viewState];
      v16 = [v15 zoneID];
      v17 = [v16 zoneName];
      v18 = sub_1000CD884(@"ckkscurrent", v17);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v40 = cf;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Query failed, cferror is %@", buf, 0xCu);
      }

      v19 = (void *)cf;
      uint64_t v20 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:@"couldn't run query" underlying:cf];
      v21 = (void *)v29[5];
      v29[5] = v20;

      CFTypeRef cf = 0;
      if (!*a4) {
        goto LABEL_17;
      }
LABEL_14:
      *a4 = (id) v29[5];
LABEL_15:
      if (cf) {
        CFRelease(cf);
      }
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
LABEL_7:
    v10 = [(CKKSUpdateCurrentItemPointerOperation *)self viewState];
    v11 = [v10 zoneID];
    v12 = [v11 zoneName];
    v13 = sub_1000CD884(@"ckkscurrent", v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (const void *)v29[5];
      *(_DWORD *)buf = 138412290;
      CFTypeRef v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Query failed: %@", buf, 0xCu);
    }

    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v8) {
    goto LABEL_7;
  }
  if (cf) {
    CFRelease(cf);
  }
  v9 = (SecDbItem *)v36[3];
LABEL_18:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v35, 8);

  return v9;
}

- (SecDbItem)_onqueueFindSecDbItemWithUUID:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = kSecAttrTombstone;
  uint64_t v8 = kSecAttrUUID;
  v9 = &off_1002FE3E8;
  v10 = off_100300578;
  while (1)
  {
    if (*((unsigned char *)v9 + 8))
    {
      v18[0] = kSecClass;
      v19[0] = *v9;
      v19[1] = kSecAttrSynchronizableAny;
      v18[1] = kSecAttrSynchronizable;
      v18[2] = v7;
      v19[2] = &__kCFBooleanFalse;
      v19[3] = v17;
      v18[3] = v8;
      v18[4] = kSecAttrAccessGroup;
      v19[4] = v6;
      v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
      v12 = [(CKKSUpdateCurrentItemPointerOperation *)self _onqueueFindSecDbItemWithQuery:v11 error:a5];

      if (v12) {
        break;
      }
    }
    v13 = *v10++;
    v9 = v13;
    if (!v13)
    {
      v12 = 0;
      break;
    }
  }

  return v12;
}

- (SecDbItem)_onqueueFindSecDbItem:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  v13[0] = kSecValuePersistentRef;
  v13[1] = kSecAttrAccessGroup;
  v14[0] = a3;
  v14[1] = a4;
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = [(CKKSUpdateCurrentItemPointerOperation *)self _onqueueFindSecDbItemWithQuery:v10 error:a5];
  return v11;
}

- (void)_fetchAndUpdateMirrorEntry:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)NSBlockOperation);
  [v5 setName:@"updateCurrentItemPointer-fetchRecordsComplete"];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];
  id v6 = [(CKKSUpdateCurrentItemPointerOperation *)self deps];
  uint64_t v7 = [v6 cloudKitClassDependencies];
  id v8 = [[[v7 fetchRecordsOperationClass] alloc];
  id v9 = [v4 item];
  v10 = [v9 storedCKRecord];
  v11 = [v10 recordID];
  v31 = v11;
  v12 = +[NSArray arrayWithObjects:&v31 count:1];
  id v13 = [v8 initWithRecordIDs:v12];
  [(CKKSUpdateCurrentItemPointerOperation *)self setFetchRecordsOperation:v13];

  v14 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  v15 = [v14 configuration];
  [v15 setIsCloudKitSupportOperation:1];

  v16 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  [v16 setQualityOfService:25];

  id v17 = [(CKKSUpdateCurrentItemPointerOperation *)self ckoperationGroup];
  v18 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  [v18 setGroup:v17];

  objc_copyWeak(&v29, &location);
  id v19 = v5;
  id v27 = v19;
  id v20 = v4;
  id v28 = v20;
  v21 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  [v21 setFetchRecordsCompletionBlock:&v26];

  v22 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v22];

  v23 = [(CKKSUpdateCurrentItemPointerOperation *)self deps];
  id v24 = [v23 ckdatabase];
  v25 = [(CKKSUpdateCurrentItemPointerOperation *)self fetchRecordsOperation];
  [v24 addOperation:v25];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(CKKSUpdateCurrentItemPointerOperation *)self deps];
  id v4 = [v3 databaseProvider];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016812C;
  v5[3] = &unk_1003053F8;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  [v4 dispatchSyncWithSQLTransaction:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  if (self)
  {
    newItem = self->_newItem;
    if (newItem)
    {
      self->_newItem = 0;
      CFRelease(newItem);
    }
    oldItem = self->_oldItem;
    if (oldItem)
    {
      self->_oldItem = 0;
      CFRelease(oldItem);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKKSUpdateCurrentItemPointerOperation;
  [(CKKSGroupOperation *)&v5 dealloc];
}

- (CKKSUpdateCurrentItemPointerOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 newItem:(id)a5 hash:(id)a6 accessGroup:(id)a7 identifier:(id)a8 replacing:(id)a9 hash:(id)a10 ckoperationGroup:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id obj = a7;
  id v18 = a7;
  id v19 = a8;
  id v28 = a9;
  id v27 = a10;
  id v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)CKKSUpdateCurrentItemPointerOperation;
  v21 = [(CKKSGroupOperation *)&v33 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_deps, a3);
    objc_storeStrong((id *)&v22->_viewState, a4);
    objc_storeStrong((id *)&v22->_newerItemPersistentRef, a5);
    objc_storeStrong((id *)&v22->_newerItemSHA1, a6);
    objc_storeStrong((id *)&v22->_oldItemPersistentRef, a9);
    objc_storeStrong((id *)&v22->_oldItemSHA1, a10);
    objc_storeStrong((id *)&v22->_accessGroup, obj);
    uint64_t v23 = +[NSString stringWithFormat:@"%@-%@", v18, v19];
    currentPointerIdentifier = v22->_currentPointerIdentifier;
    v22->_currentPointerIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v22->_ckoperationGroup, a11);
    [(CKKSUpdateCurrentItemPointerOperation *)v22 setQualityOfService:25];
  }

  return v22;
}

@end