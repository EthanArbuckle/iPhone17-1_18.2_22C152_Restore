@interface FMDNetworkAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDNetworkAction)initWithRequest:(id)a3 andServerInteractionController:(id)a4;
- (FMDRequest)request;
- (FMDServerInteractionController)serverInteractionController;
- (NSString)description;
- (id)actionType;
- (void)runWithCompletion:(id)a3;
- (void)setRequest:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDNetworkAction

- (FMDNetworkAction)initWithRequest:(id)a3 andServerInteractionController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDNetworkAction;
  v9 = [(FMDNetworkAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_serverInteractionController, a4);
  }

  return v10;
}

- (id)actionType
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = sub_1000596B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FMDNetworkAction *)self request];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ run for request - %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v28 = sub_100004708;
  v29 = sub_100004734;
  id v7 = [(FMDNetworkAction *)self request];
  id v30 = [v7 completionHandler];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000473C;
  v18[3] = &unk_1002D9148;
  objc_copyWeak(&v21, &location);
  v18[4] = self;
  v20 = buf;
  id v8 = (void (**)(void))v4;
  id v19 = v8;
  v9 = objc_retainBlock(v18);
  v10 = sub_1000596B0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10023AC3C((int)self, v9);
  }

  v11 = [(FMDNetworkAction *)self request];
  [v11 setCompletionHandler:v9];

  objc_super v12 = [(FMDNetworkAction *)self request];
  if ([v12 cancelled])
  {
  }
  else
  {
    v13 = [(FMDNetworkAction *)self serverInteractionController];
    v14 = [(FMDNetworkAction *)self request];
    unsigned __int8 v15 = [v13 enqueueRequest:v14];

    if (v15) {
      goto LABEL_12;
    }
  }
  v16 = sub_1000596B0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(FMDNetworkAction *)self request];
    *(_DWORD *)v23 = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ request cancelled or did not enqueue: %@", v23, 0x16u);
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_12:

  objc_destroyWeak(&v21);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)willCancelAction
{
  v3 = sub_1000596B0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(FMDNetworkAction *)self request];
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ will cancel request: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = [(FMDNetworkAction *)self serverInteractionController];
  v6 = [(FMDNetworkAction *)self request];
  [v5 cancelRequest:v6];
}

- (BOOL)shouldCancelAction:(id)a3
{
  return 0;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(FMDNetworkAction *)self request];
  v5 = +[NSString stringWithFormat:@"%@-%p:%@", v3, self, v4];

  return (NSString *)v5;
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_serverInteractionController, 0);
}

@end