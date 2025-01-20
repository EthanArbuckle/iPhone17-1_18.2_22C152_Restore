@interface CCDServer
- (NSOperationQueue)operationQueue;
- (id)_operationForDeviceUploadRequest:(id)a3;
- (id)_operationForEnrollmentRequest:(id)a3;
- (id)_requestForDeviceUploadRequestType:(int64_t)a3 userCredentials:(id)a4;
- (void)_addOperationToQueue:(id)a3;
- (void)_startProcessForDeviceUploadRequest:(id)a3 completionBlock:(id)a4;
- (void)_startProcessForEnrollmentRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchConfigurationAndActivateAnisetteWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3;
- (void)pingWithCompletionBlock:(id)a3;
- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)setOperationQueue:(id)a3;
- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5;
- (void)unenrollWithCompletionBlock:(id)a3;
@end

@implementation CCDServer

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_opt_new();
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setNonce:v7];

  [(CCDServer *)self _startProcessForEnrollmentRequest:v8 completionBlock:v6];
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CCDAuthKitUtilities shouldActivateAnisette];
  id v6 = *(NSObject **)(DEPLogObjects() + 8);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Retrieving cloud configuration and mid", buf, 2u);
    }
    [(CCDServer *)self fetchConfigurationAndActivateAnisetteWithCompletionBlock:v4];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Only retrieving cloud configuration", v8, 2u);
    }
    [(CCDServer *)self fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:v4];
  }
}

- (void)fetchConfigurationAndActivateAnisetteWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10000CCDC;
  v27[4] = sub_10000CCEC;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000CCDC;
  v25[4] = sub_10000CCEC;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10000CCDC;
  v23[4] = sub_10000CCEC;
  id v24 = objc_alloc_init((Class)NSLock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CCF4;
  v15[3] = &unk_10001CA78;
  v17 = v23;
  v18 = v31;
  id v5 = v4;
  id v16 = v5;
  v19 = v29;
  v20 = v27;
  v21 = v25;
  v22 = v33;
  +[CCDAuthKitUtilities midWithCompletion:v15];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CDD0;
  v7[3] = &unk_10001CAA0;
  v9 = v23;
  v10 = v33;
  id v6 = v5;
  id v8 = v6;
  v11 = v29;
  v12 = v27;
  v13 = v25;
  v14 = v31;
  [(CCDServer *)self fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:v7];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

- (void)fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(CCDServer *)self _startProcessForEnrollmentRequest:v5 completionBlock:v4];
}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(CCDServer *)self _startProcessForEnrollmentRequest:v5 completionBlock:v4];
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(CCDServer *)self _startProcessForEnrollmentRequest:v5 completionBlock:v4];
}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setPushToken:v10];

  [v11 setPushTopic:v9];
  [(CCDServer *)self _startProcessForEnrollmentRequest:v11 completionBlock:v8];
}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CCDServer *)self _requestForDeviceUploadRequestType:0 userCredentials:a3];
  [(CCDServer *)self _startProcessForDeviceUploadRequest:v7 completionBlock:v6];
}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CCDServer *)self _requestForDeviceUploadRequestType:1 userCredentials:a3];
  [(CCDServer *)self _startProcessForDeviceUploadRequest:v7 completionBlock:v6];
}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CCDServer *)self _requestForDeviceUploadRequestType:2 userCredentials:a4];
  [v10 setOrganization:v9];

  [(CCDServer *)self _startProcessForDeviceUploadRequest:v10 completionBlock:v8];
}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CCDServer *)self _requestForDeviceUploadRequestType:3 userCredentials:a4];
  [v10 setSubmitDeviceRequestPayload:v9];

  [(CCDServer *)self _startProcessForDeviceUploadRequest:v10 completionBlock:v8];
}

- (void)_startProcessForDeviceUploadRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CCDServer *)self _operationForDeviceUploadRequest:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D3FC;
  v9[3] = &unk_10001CAC8;
  id v10 = v6;
  id v8 = v6;
  [v7 setDeviceUploadCompletionBlock:v9];
  [(CCDServer *)self _addOperationToQueue:v7];
}

- (id)_requestForDeviceUploadRequestType:(int64_t)a3 userCredentials:(id)a4
{
  id v5 = a4;
  if ((unint64_t)a3 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = objc_opt_new();
  }
  [v6 setUserCredentials:v5];

  return v6;
}

- (id)_operationForDeviceUploadRequest:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 requestType] > 3) {
    id v4 = 0;
  }
  else {
    id v4 = objc_opt_new();
  }
  [v4 setTeslaRequest:v3];

  return v4;
}

- (void)pingWithCompletionBlock:(id)a3
{
}

- (void)_startProcessForEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D604;
  v11[3] = &unk_10001CAF0;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 setCertificateRetrievalCompletionBlock:v11];
  [(CCDServer *)self _addOperationToQueue:v8];
}

- (void)_addOperationToQueue:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding operation to the queue: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(CCDServer *)self operationQueue];
  [v6 addOperation:v4];
}

- (id)_operationForEnrollmentRequest:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 requestType] > 4) {
    id v4 = 0;
  }
  else {
    id v4 = objc_opt_new();
  }
  [v4 setTeslaRequest:v3];

  return v4;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end