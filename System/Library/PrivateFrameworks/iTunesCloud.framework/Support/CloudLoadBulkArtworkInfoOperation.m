@interface CloudLoadBulkArtworkInfoOperation
- (BOOL)useLongIDs;
- (CloudLoadBulkArtworkInfoOperation)initWithCloudIDs:(id)a3;
- (CloudLoadBulkArtworkInfoOperation)initWithConfiguration:(id)a3 cloudIDs:(id)a4;
- (NSArray)cloudArtworkInfoDictionaries;
- (unsigned)itemKind;
- (void)main;
@end

@implementation CloudLoadBulkArtworkInfoOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudArtworkInfoDictionaries, 0);

  objc_storeStrong((id *)&self->_cloudIDs, 0);
}

- (NSArray)cloudArtworkInfoDictionaries
{
  return self->_cloudArtworkInfoDictionaries;
}

- (unsigned)itemKind
{
  return self->_itemKind;
}

- (BOOL)useLongIDs
{
  return self->_useLongIDs;
}

- (void)main
{
  v4 = +[ICDeviceInfo currentDeviceInfo];
  if (![v4 isWatch]) {
    goto LABEL_4;
  }
  v5 = +[ICEnvironmentMonitor sharedMonitor];
  if ([v5 isCharging])
  {

LABEL_4:
    goto LABEL_5;
  }
  char v25 = _os_feature_enabled_impl();

  if (v25)
  {
LABEL_5:
    v6 = +[ICDeviceInfo currentDeviceInfo];
    if ([v6 isWatch])
    {
      v7 = +[ICEnvironmentMonitor sharedMonitor];
      id v8 = [v7 currentThermalLevel];

      if ((unint64_t)v8 >= 0x14)
      {
        v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v10 = "Not performing artwork info operation because of elevated thermal levels";
LABEL_19:
          v13 = v9;
          os_log_type_t v14 = OS_LOG_TYPE_ERROR;
          uint32_t v15 = 2;
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
    v11 = +[ICPrivacyInfo sharedPrivacyInfo];
    unsigned int v12 = [v11 privacyAcknowledgementRequiredForMedia];

    if (v12)
    {
      v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = self;
        v10 = "%{public}@ Skipping update because privacy acknowledgement is required";
        v13 = v9;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v10, buf, v15);
        goto LABEL_21;
      }
    }
    else
    {
      v9 = +[NSString stringWithFormat:@"%@ - (item count = %lu)", objc_opt_class(), [(NSArray *)self->_cloudIDs count]];
      id v16 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v9];
      [v16 beginTransaction];
      v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (CloudLoadBulkArtworkInfoOperation *)objc_opt_class();
        cloudIDs = self->_cloudIDs;
        v20 = v18;
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2048;
        NSUInteger v31 = [(NSArray *)cloudIDs count];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading artwork info for %lu cloud IDs", buf, 0x16u);
      }
      v21 = [(CloudLibraryOperation *)self connection];
      v22 = -[ICBulkArtworkInfoRequest initWithDatabaseID:cloudIDs:itemKind:useLongIDs:]([ICBulkArtworkInfoRequest alloc], "initWithDatabaseID:cloudIDs:itemKind:useLongIDs:", [v21 databaseID], self->_cloudIDs, -[CloudLoadBulkArtworkInfoOperation itemKind](self, "itemKind"), -[CloudLoadBulkArtworkInfoOperation useLongIDs](self, "useLongIDs"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10005CBBC;
      v26[3] = &unk_1001BEEC0;
      v26[4] = self;
      dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
      v23 = v27;
      [v21 sendRequest:v22 withResponseHandler:v26];
      dispatch_time_t v24 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v23, v24);
      [v16 endTransaction];
    }
    goto LABEL_21;
  }
  v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = "Not performing artwork info operation because power is required";
    goto LABEL_19;
  }
LABEL_21:
}

- (CloudLoadBulkArtworkInfoOperation)initWithConfiguration:(id)a3 cloudIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CloudLoadBulkArtworkInfoOperation.m" lineNumber:31 description:@"CloudIDs must be an array!"];
  }
  v14.receiver = self;
  v14.super_class = (Class)CloudLoadBulkArtworkInfoOperation;
  v9 = [(CloudLibraryOperation *)&v14 initWithConfiguration:v7];
  if (v9)
  {
    v10 = (NSArray *)[v8 copy];
    cloudIDs = v9->_cloudIDs;
    v9->_cloudIDs = v10;
  }
  return v9;
}

- (CloudLoadBulkArtworkInfoOperation)initWithCloudIDs:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(CloudLoadBulkArtworkInfoOperation *)self initWithConfiguration:v5 cloudIDs:v4];

  return v6;
}

@end