@interface JaliscoHideItemOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (JaliscoHideItemOperation)initWithCoder:(id)a3;
- (JaliscoHideItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemPurchaseHistoryIDs:(id)a5;
- (JaliscoHideItemOperation)initWithItemPurchaseHistoryIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation JaliscoHideItemOperation

- (void).cxx_destruct
{
}

- (void)main
{
  if ([(NSArray *)self->_itemPurchaseHistoryIDs count])
  {
    v23 = +[NSString stringWithFormat:@"JaliscoHideItemOperation - (purchase_history_id count = %llu)", [(NSArray *)self->_itemPurchaseHistoryIDs count]];
    id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v23];
    [v3 beginTransaction];
    v4 = [(CloudLibraryOperation *)self musicLibrary];
    v5 = [(CloudLibraryOperation *)self clientIdentity];
    [v4 setClientIdentity:v5];

    v6 = [(CloudLibraryOperation *)self connection];
    v7 = +[NSMutableArray array];
    if ([(NSArray *)self->_itemPurchaseHistoryIDs count])
    {
      unint64_t v8 = 0;
      uint64_t v9 = ML3TrackPropertyHidden;
      do
      {
        uint64_t v38 = v9;
        v39 = &__kCFBooleanTrue;
        v10 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [v7 addObject:v10];

        ++v8;
      }
      while (v8 < [(NSArray *)self->_itemPurchaseHistoryIDs count]);
    }
    v11 = +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:](ICBulkSetItemPropertyRequest, "requestWithDatabaseID:itemIDs:properties:useLongIDs:", [v6 databaseID], self->_itemPurchaseHistoryIDs, v7, 1);
    [v11 setVerificationInteractionLevel:2];
    v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      if ([v11 method]) {
        CFStringRef v15 = @"POST";
      }
      else {
        CFStringRef v15 = @"GET";
      }
      v16 = [v11 action];
      itemPurchaseHistoryIDs = self->_itemPurchaseHistoryIDs;
      *(_DWORD *)buf = 138544386;
      v29 = v14;
      __int16 v30 = 2048;
      v31 = v11;
      __int16 v32 = 2114;
      CFStringRef v33 = v15;
      __int16 v34 = 2114;
      v35 = v16;
      __int16 v36 = 2114;
      v37 = itemPurchaseHistoryIDs;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending hide items request <%{public}@: %p method=%{public}@ action=%{public}@> for purchase history ids: %{public}@", buf, 0x34u);
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000C4900;
    v24[3] = &unk_1001BEAE8;
    id v25 = v11;
    v26 = self;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    v18 = v27;
    id v19 = v11;
    [v6 sendRequest:v19 withResponseHandler:v24];
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    v20 = [(CloudLibraryOperation *)self musicLibrary];
    v21 = MSVTCCIdentityForCurrentProcess();
    [v20 setClientIdentity:v21];

    [v3 endTransaction];
  }
  else
  {
    v22 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No item purchase history ids to delete.", buf, 2u);
    }

    [(CloudLibraryOperation *)self setStatus:1];
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JaliscoHideItemOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemPurchaseHistoryIDs, @"JaliscoHideItemOperationItemPurchaseHistoryIDsKey", v5.receiver, v5.super_class);
}

- (JaliscoHideItemOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JaliscoHideItemOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    unint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"JaliscoHideItemOperationItemPurchaseHistoryIDsKey"];
    uint64_t v9 = (NSArray *)[v8 copy];
    itemPurchaseHistoryIDs = v5->_itemPurchaseHistoryIDs;
    v5->_itemPurchaseHistoryIDs = v9;
  }
  return v5;
}

- (JaliscoHideItemOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 itemPurchaseHistoryIDs:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)JaliscoHideItemOperation;
  uint64_t v9 = [(CloudLibraryOperation *)&v13 initWithConfiguration:a3 clientIdentity:a4];
  if (v9)
  {
    v10 = (NSArray *)[v8 copy];
    itemPurchaseHistoryIDs = v9->_itemPurchaseHistoryIDs;
    v9->_itemPurchaseHistoryIDs = v10;
  }
  return v9;
}

- (JaliscoHideItemOperation)initWithItemPurchaseHistoryIDs:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  uint64_t v6 = MSVTCCIdentityForCurrentProcess();
  v7 = [(JaliscoHideItemOperation *)self initWithConfiguration:v5 clientIdentity:v6 itemPurchaseHistoryIDs:v4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end