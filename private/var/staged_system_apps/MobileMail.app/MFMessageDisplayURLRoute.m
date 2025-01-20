@interface MFMessageDisplayURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (DaemonInterfaceProviding)scene;
- (EFPromise)messageDisplayPromise;
- (EMMessageList)messageList;
- (MFMessageDisplayURLRoute)initWithScene:(id)a3;
- (MFMessageDisplayURLRoute)initWithScene:(id)a3 actionHandler:(id)a4;
- (MFMessageDisplayURLRouteActionHander)actionHandler;
- (NSString)ef_publicDescription;
- (double)timeoutInterval;
- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4;
- (id)createMessageListWithQuery:(id)a3 repository:(id)a4;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4;
- (void)_resetMessageListAndPromise;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)prewarmWebViewIfNeeded;
- (void)setActionHandler:(id)a3;
- (void)setMessageDisplayPromise:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setScene:(id)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation MFMessageDisplayURLRoute

- (MFMessageDisplayURLRoute)initWithScene:(id)a3
{
  return [(MFMessageDisplayURLRoute *)self initWithScene:a3 actionHandler:self];
}

- (MFMessageDisplayURLRoute)initWithScene:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMessageDisplayURLRoute;
  v8 = [(MFMessageDisplayURLRoute *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_actionHandler, v7);
    v9->_priority = 0;
    v9->_timeoutInterval = 5.0;
  }

  return v9;
}

- (BOOL)canRouteRequest:(id)a3
{
  v3 = [a3 URL];
  if (objc_msgSend(v3, "em_isMessageURL")) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 em_isInternalMessageURL];
  }

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v40 = a3;
  ptr = [(MFMessageDisplayURLRoute *)self scene];
  unsigned __int8 v4 = MFMessageLoadingSignpostLog();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, ptr);

  id v6 = MFMessageLoadingSignpostLog();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LaunchMessageURLDisplay", " enableTelemetry=YES ", buf, 2u);
  }

  v8 = [MFUserInteractionAssertion alloc];
  v9 = [v40 URL];
  v10 = +[NSString stringWithFormat:@"Load message from url - %@", v9];
  [(MFMessageDisplayURLRoute *)self timeoutInterval];
  v37 = -[MFUserInteractionAssertion initWithReason:timeout:](v8, "initWithReason:timeout:", v10);

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001B3BDC;
  v62[3] = &unk_1006047A0;
  v62[4] = self;
  objc_super v11 = +[EFScheduler mainThreadScheduler];
  [v11 performBlock:v62];

  v12 = [ptr daemonInterface];
  v13 = [v12 messageRepository];
  v14 = [v40 URL];
  v38 = [v13 messageObjectIDForURL:v14];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1001B3C3C;
  v60[3] = &unk_10060C0C8;
  v60[4] = self;
  id v15 = ptr;
  id v61 = v15;
  v16 = [v38 then:v60];
  v17 = +[MFURLRoutingRequest log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v40 ef_publicDescription];
    *(_DWORD *)buf = 134218242;
    v64 = v16;
    __int16 v65 = 2114;
    v66 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%p: processing message display for request %{public}@", buf, 0x16u);
  }
  v19 = +[EFScheduler mainThreadScheduler];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1001B3D74;
  v55[3] = &unk_10060C140;
  os_signpost_id_t v59 = v5;
  v20 = v37;
  v56 = v20;
  v57 = self;
  id v21 = v15;
  id v58 = v21;
  [v16 onScheduler:v19 addSuccessBlock:v55];

  v22 = +[EFScheduler mainThreadScheduler];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001B421C;
  v49[3] = &unk_10060C168;
  os_signpost_id_t v54 = v5;
  id v23 = v16;
  id v50 = v23;
  id v24 = v40;
  id v51 = v24;
  v25 = v20;
  v52 = v25;
  v53 = self;
  [v23 onScheduler:v22 addFailureBlock:v49];

  v26 = +[EFScheduler mainThreadScheduler];
  [(MFMessageDisplayURLRoute *)self timeoutInterval];
  double v28 = v27;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001B43F8;
  v43[3] = &unk_100606D48;
  id v29 = v23;
  id v44 = v29;
  os_signpost_id_t v48 = v5;
  id v30 = v24;
  id v45 = v30;
  v31 = v25;
  v46 = v31;
  v47 = self;
  id v32 = [v26 afterDelay:v43 performBlock:v28];

  v33 = [v29 then:&stru_10060C1A8];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001B45A8;
  v41[3] = &unk_10060C1D0;
  id v34 = v30;
  id v42 = v34;
  v35 = [v33 recover:v41];

  return v35;
}

- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFMessageDisplayURLRoute *)self _resetMessageListAndPromise];
  v8 = +[EFPromise promise];
  [(MFMessageDisplayURLRoute *)self setMessageDisplayPromise:v8];

  v9 = [(MFMessageDisplayURLRoute *)self actionHandler];
  v10 = [v9 createMessageListWithQuery:v6 repository:v7];
  [(MFMessageDisplayURLRoute *)self setMessageList:v10];

  objc_super v11 = [(MFMessageDisplayURLRoute *)self messageList];
  [v11 beginObserving:self];

  v12 = [(MFMessageDisplayURLRoute *)self messageDisplayPromise];

  return v12;
}

- (void)_resetMessageListAndPromise
{
  v3 = [(MFMessageDisplayURLRoute *)self messageList];

  if (v3)
  {
    id v6 = [(MFMessageDisplayURLRoute *)self messageList];
    [v6 stopObserving:self];

    [(MFMessageDisplayURLRoute *)self setMessageList:0];
  }
  unsigned __int8 v4 = [(MFMessageDisplayURLRoute *)self messageDisplayPromise];

  if (v4)
  {
    os_signpost_id_t v5 = [(MFMessageDisplayURLRoute *)self messageDisplayPromise];
    id v7 = [v5 future];

    if (([v7 isFinished] & 1) == 0) {
      [v7 cancel];
    }
    [(MFMessageDisplayURLRoute *)self setMessageDisplayPromise:0];
  }
}

- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MFMessageDisplayURLRoute *)self messageList];
  if (v7 == v11)
  {
    v8 = [v6 firstObject];
    if (v8)
    {
      [v11 stopObserving:self];
      v9 = [(MFMessageDisplayURLRoute *)self messageDisplayPromise];
      v10 = [v11 messageListItemForItemID:v8];
      [v9 finishWithFuture:v10];
    }
  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v10 = v8;
  v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(MFMessageDisplayURLRoute *)self _determineMessageToDisplayForCollection:v7 itemIDs:v9];
}

- (void)prewarmWebViewIfNeeded
{
  id v2 = +[MFWKWebViewFactory sharedWebViewFactory];
  [v2 preallocateWebViewIfNeeded];
}

- (id)createMessageListWithQuery:(id)a3 repository:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)EMMessageList) initWithQuery:v5 repository:v6];

  return v7;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (DaemonInterfaceProviding)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (DaemonInterfaceProviding *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (MFMessageDisplayURLRouteActionHander)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (MFMessageDisplayURLRouteActionHander *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (EFPromise)messageDisplayPromise
{
  return self->_messageDisplayPromise;
}

- (void)setMessageDisplayPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDisplayPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_destroyWeak((id *)&self->_actionHandler);

  objc_destroyWeak((id *)&self->_scene);
}

@end