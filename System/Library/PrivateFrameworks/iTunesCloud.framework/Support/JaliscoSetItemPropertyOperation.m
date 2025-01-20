@interface JaliscoSetItemPropertyOperation
- (JaliscoSetItemPropertyOperation)initWithCoder:(id)a3;
- (JaliscoSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 purchaseHistoryID:(unint64_t)a5 properties:(id)a6;
- (JaliscoSetItemPropertyOperation)initWithPurchaseHistoryID:(unint64_t)a3 properties:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation JaliscoSetItemPropertyOperation

- (void).cxx_destruct
{
}

- (void)main
{
  v23 = +[NSString stringWithFormat:@"JaliscoSetItemPropertyOperation - (purchase_history_id = %llu)", self->_purchaseHistoryID];
  id v3 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v23];
  [v3 beginTransaction];
  v4 = [(CloudLibraryOperation *)self musicLibrary];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  [v4 setClientIdentity:v5];

  v6 = [(CloudLibraryOperation *)self connection];
  id v7 = [v6 databaseID];
  v8 = +[NSNumber numberWithUnsignedLongLong:self->_purchaseHistoryID];
  v42 = v8;
  v9 = +[NSArray arrayWithObjects:&v42 count:1];
  properties = self->_properties;
  v10 = +[NSArray arrayWithObjects:&properties count:1];
  v11 = +[ICBulkSetItemPropertyRequest requestWithDatabaseID:v7 itemIDs:v9 properties:v10 useLongIDs:1];

  [v11 setVerificationInteractionLevel:2];
  v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
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
    unint64_t purchaseHistoryID = self->_purchaseHistoryID;
    v18 = self->_properties;
    *(_DWORD *)buf = 138544642;
    v30 = v14;
    __int16 v31 = 2048;
    v32 = v11;
    __int16 v33 = 2114;
    CFStringRef v34 = v15;
    __int16 v35 = 2114;
    v36 = v16;
    __int16 v37 = 2048;
    unint64_t v38 = purchaseHistoryID;
    __int16 v39 = 2114;
    v40 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending set item properties request <%{public}@: %p method=%{public}@ action=%{public}@> for purchase history id: %llu properties: %{public}@", buf, 0x3Eu);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100030514;
  v25[3] = &unk_1001BEAE8;
  id v26 = v11;
  v27 = self;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  v19 = v28;
  id v20 = v11;
  [v6 sendRequest:v20 withResponseHandler:v25];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  v21 = [(CloudLibraryOperation *)self musicLibrary];
  v22 = MSVTCCIdentityForCurrentProcess();
  [v21 setClientIdentity:v22];

  [v3 endTransaction];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JaliscoSetItemPropertyOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_purchaseHistoryID, @"JaliscoSetItemPropertyOperationPurchaseHistoryIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_properties forKey:@"JaliscoSetItemPropertyOperationPropertiesKey"];
}

- (JaliscoSetItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JaliscoSetItemPropertyOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t purchaseHistoryID = (unint64_t)[v4 decodeInt64ForKey:@"JaliscoSetItemPropertyOperationPurchaseHistoryIDKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JaliscoSetItemPropertyOperationPropertiesKey"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;
  }
  return v5;
}

- (JaliscoSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 purchaseHistoryID:(unint64_t)a5 properties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)JaliscoSetItemPropertyOperation;
  v11 = [(CloudLibraryOperation *)&v16 initWithConfiguration:a3 clientIdentity:a4];
  v12 = v11;
  if (v11)
  {
    v11->_unint64_t purchaseHistoryID = a5;
    v13 = (NSDictionary *)[v10 copy];
    properties = v12->_properties;
    v12->_properties = v13;
  }
  return v12;
}

- (JaliscoSetItemPropertyOperation)initWithPurchaseHistoryID:(unint64_t)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  v8 = MSVTCCIdentityForCurrentProcess();
  objc_super v9 = [(JaliscoSetItemPropertyOperation *)self initWithConfiguration:v7 clientIdentity:v8 purchaseHistoryID:a3 properties:v6];

  return v9;
}

@end