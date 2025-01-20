@interface FMDAbsintheV3SigningInterface
+ (id)pscSUIURL;
+ (id)sharedInterface;
- (FMDAbsintheV3SigningInterface)init;
- (FMDServerInteractionController)serverInteractionController;
- (FMStateCapture)stateCapture;
- (NSOperationQueue)operationQueue;
- (id)accountForServerInteractionController:(id)a3;
- (id)inFieldCollectionReceipt:(id *)a3;
- (id)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 error:(id *)a6;
- (void)didReceiveAuthFailureForRequest:(id)a3;
- (void)didReceiveServerAlertForRequest:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setStateCapture:(id)a3;
- (void)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 cause:(id)a6 completion:(id)a7;
@end

@implementation FMDAbsintheV3SigningInterface

+ (id)sharedInterface
{
  if (qword_10031E6D0 != -1) {
    dispatch_once(&qword_10031E6D0, &stru_1002D9578);
  }
  v2 = (void *)qword_10031E6C8;

  return v2;
}

- (FMDAbsintheV3SigningInterface)init
{
  v12.receiver = self;
  v12.super_class = (Class)FMDAbsintheV3SigningInterface;
  v2 = [(FMDAbsintheV3SigningInterface *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(FMDAbsintheV3SigningInterface *)v2 setOperationQueue:v3];

    v4 = [(FMDAbsintheV3SigningInterface *)v2 operationQueue];
    [v4 setMaxConcurrentOperationCount:1];

    v5 = objc_alloc_init(FMDDirectServerChannel);
    v13[0] = v5;
    v6 = objc_alloc_init(FMDCadmiumServerChannel);
    v13[1] = v6;
    v7 = +[NSArray arrayWithObjects:v13 count:2];

    v8 = [[FMDServerInteractionController alloc] initWithChannels:v7 delegate:v2];
    [(FMDAbsintheV3SigningInterface *)v2 setServerInteractionController:v8];

    id v9 = objc_alloc_init((Class)FMStateCapture);
    [(FMDAbsintheV3SigningInterface *)v2 setStateCapture:v9];

    v10 = [(FMDAbsintheV3SigningInterface *)v2 stateCapture];
    [v10 setStateCaptureBlock:&stru_1002D9598];
  }
  return v2;
}

- (id)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100011294;
  v29 = sub_1000112A4;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100011294;
  v23 = sub_1000112A4;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000112AC;
  v15[3] = &unk_1002D95C0;
  v17 = &v25;
  v18 = &v19;
  id v12 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"absintheSynchronizer" andTimeout:-1.0];
  id v16 = v12;
  [(FMDAbsintheV3SigningInterface *)self signatureForData:v10 requestUUID:v11 mode:a5 cause:0 completion:v15];
  [v12 wait];
  if (a6) {
    *a6 = (id) v20[5];
  }
  id v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (void)signatureForData:(id)a3 requestUUID:(id)a4 mode:(unint64_t)a5 cause:(id)a6 completion:(id)a7
{
  id v12 = a3;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_100011494;
  v22 = &unk_1002D95E8;
  id v23 = a4;
  id v24 = a6;
  uint64_t v25 = self;
  id v26 = v12;
  id v27 = a7;
  unint64_t v28 = a5;
  id v13 = v27;
  id v14 = v12;
  id v15 = v24;
  id v16 = v23;
  v17 = +[NSBlockOperation blockOperationWithBlock:&v19];
  v18 = [(FMDAbsintheV3SigningInterface *)self operationQueue];
  [v18 addOperation:v17];
}

- (id)inFieldCollectionReceipt:(id *)a3
{
  v4 = MAECopyPCRTToken();
  id v5 = 0;
  if (v5)
  {

    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10023B568((uint64_t)v5, v6);
    }

    v4 = 0;
    if (a3) {
      *a3 = v5;
    }
  }

  return v4;
}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Auth failure received in identityV3Session.", v4, 2u);
  }
}

- (void)didReceiveServerAlertForRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 alertFromServerResponse];

  if (v4)
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10023B5E0(v3, v5);
    }
  }
}

- (id)accountForServerInteractionController:(id)a3
{
  id v3 = +[FMDServiceProvider activeServiceProvider];
  v4 = [v3 account];

  return v4;
}

+ (id)pscSUIURL
{
  uint64_t v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    id v3 = (void *)v2;
    v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System group container path is %s", (uint8_t *)&v8, 0xCu);
    }

    id v5 = +[NSURL fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    free(v3);
  }
  else
  {
    id v5 = 0;
  }
  v6 = [v5 URLByAppendingPathComponent:@"Library/ProvenanceV2/psc.sui" isDirectory:0];

  return v6;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end