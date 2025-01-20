@interface CloudLibraryOptOutOperation
- (CloudLibraryOptOutOperation)initWithCUID:(id)a3 troveID:(id)a4;
- (CloudLibraryOptOutOperation)initWithConfiguration:(id)a3 CUID:(id)a4 troveID:(id)a5;
- (NSString)cuid;
- (NSString)troveID;
- (void)_sendOptOutWithCUID:(id)a3 troveID:(id)a4;
- (void)main;
- (void)setCuid:(id)a3;
- (void)setTroveID:(id)a3;
@end

@implementation CloudLibraryOptOutOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_troveID, 0);

  objc_storeStrong((id *)&self->_cuid, 0);
}

- (void)setTroveID:(id)a3
{
}

- (NSString)troveID
{
  return self->_troveID;
}

- (void)setCuid:(id)a3
{
}

- (NSString)cuid
{
  return self->_cuid;
}

- (void)_sendOptOutWithCUID:(id)a3 troveID:(id)a4
{
  v5 = [(CloudLibraryOptOutOperation *)self cuid];
  v6 = [(CloudLibraryOptOutOperation *)self troveID];
  v7 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_1001CC260, @"min-itunes-match-compatible-version", &off_1001CC278, @"itunes-match-protocol-version", v5, @"cuid", v6, @"troveid", 0];

  v8 = sub_1000A0434(0, @"cloud-library-opt-out-url", 0, v7, 0.0);
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = +[ICURLSessionManager defaultSession];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DFC74;
    v12[3] = &unk_1001BD530;
    v12[4] = self;
    dispatch_semaphore_t v13 = v9;
    v11 = v9;
    [v10 enqueueDataRequest:v8 withCompletionHandler:v12];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)main
{
  v3 = [(CloudLibraryOptOutOperation *)self cuid];
  if ([v3 length])
  {
    v4 = [(CloudLibraryOptOutOperation *)self troveID];
    id v5 = [v4 length];

    if (v5)
    {
      v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(CloudLibraryOptOutOperation *)self cuid];
        v8 = [(CloudLibraryOptOutOperation *)self troveID];
        int v12 = 138543618;
        dispatch_semaphore_t v13 = v7;
        __int16 v14 = 2114;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending cloud library opt-out for Cloud CUID: %{public}@ TroveID: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      dispatch_semaphore_t v9 = [(CloudLibraryOptOutOperation *)self cuid];
      v10 = [(CloudLibraryOptOutOperation *)self troveID];
      [(CloudLibraryOptOutOperation *)self _sendOptOutWithCUID:v9 troveID:v10];

      return;
    }
  }
  else
  {
  }
  v11 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No Cloud CUID or TroveID, skipping opt-out request.", (uint8_t *)&v12, 2u);
  }

  [(CloudLibraryOperation *)self setStatus:1];
}

- (CloudLibraryOptOutOperation)initWithConfiguration:(id)a3 CUID:(id)a4 troveID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CloudLibraryOptOutOperation;
  v10 = [(CloudLibraryOperation *)&v16 initWithConfiguration:a3];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    cuid = v10->_cuid;
    v10->_cuid = v11;

    dispatch_semaphore_t v13 = (NSString *)[v9 copy];
    troveID = v10->_troveID;
    v10->_troveID = v13;
  }
  return v10;
}

- (CloudLibraryOptOutOperation)initWithCUID:(id)a3 troveID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(CloudLibraryOptOutOperation *)self initWithConfiguration:v8 CUID:v7 troveID:v6];

  return v9;
}

@end