@interface _UIRemoteViewControllerConnectionRequest
+ (id)__requestRemoteViewController:(id)a3 service:(id)a4 fromServiceWithBundleIdentifier:(id)a5 traitCollection:(id)a6 exportedHostingObject:(id)a7 serviceViewControllerDeputyInterface:(id)a8 connectionHandler:(id)a9;
+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 traitCollection:(id)a5 exportedHostingObject:(id)a6 serviceViewControllerDeputyInterface:(id)a7 connectionHandler:(id)a8;
+ (id)requestViewControllerWithService:(id)a3 traitCollection:(id)a4 exportedHostingObject:(id)a5 remoteViewControllerClass:(Class)a6 serviceViewControllerDeputyInterface:(id)a7 connectionHandler:(id)a8;
- (id)_cancelWithError:(id)a3;
- (void)_cancelUnconditionallyThen:(id)a3;
- (void)_connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 successHandler:(id)a5;
- (void)_connectToPlugInKitService;
- (void)_connectToServiceViewController;
- (void)_connectToTextEffectsOperator;
- (void)_connectToViewControllerControlMessageDeputy;
- (void)_connectToViewControllerOperator;
- (void)_connectToViewService;
- (void)_didFinishEstablishingConnection;
- (void)_sendServiceTextEffectsRequest;
- (void)_sendServiceViewControllerRequest;
- (void)dealloc;
@end

@implementation _UIRemoteViewControllerConnectionRequest

+ (id)__requestRemoteViewController:(id)a3 service:(id)a4 fromServiceWithBundleIdentifier:(id)a5 traitCollection:(id)a6 exportedHostingObject:(id)a7 serviceViewControllerDeputyInterface:(id)a8 connectionHandler:(id)a9
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  aClassName = (NSString *)a3;
  id v56 = a4;
  id v53 = a5;
  id v50 = a6;
  id v52 = a7;
  id v51 = a8;
  id v54 = a9;
  if (!v54) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"connection handler can't be nil"];
  }
  v15 = objc_alloc_init(_UIRemoteViewControllerConnectionRequest);
  if (v15)
  {
    v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &__requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler____s_category)+ 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [v56 contextToken];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = aClassName;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      id v69 = v53;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Requesting remote view controller: %{public}@; contextToken: %{public}@; bundleId: %{public}@",
        buf,
        0x20u);
    }
    if (v56)
    {
      objc_storeStrong((id *)&v15->_service, a4);
      v15->_remoteViewControllerClass = NSClassFromString(aClassName);
      uint64_t v19 = [(_UIRemoteViewService *)v15->_service viewControllerClassName];
      viewControllerClassName = v15->_viewControllerClassName;
      v15->_viewControllerClassName = (NSString *)v19;

      v21 = [(_UIRemoteViewService *)v15->_service contextToken];
      uint64_t v22 = [v21 copy];
      contextToken = v15->_contextToken;
      v15->_contextToken = (NSUUID *)v22;

      v24 = NSString;
      v25 = [(_UIRemoteViewService *)v15->_service identifier];
      v26 = [v24 stringWithFormat:@"com.apple.uikit._UIRemoteViewControllerCreationRequest %@ %p", v25, a1];
    }
    else
    {
      uint64_t v29 = objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        uint64_t v29 = objc_opt_class();
      }
      uint64_t v30 = [v53 copy];
      viewServiceBundleIdentifier = v15->_viewServiceBundleIdentifier;
      v15->_viewServiceBundleIdentifier = (NSString *)v30;

      uint64_t v32 = [(NSString *)aClassName copy];
      v33 = v15->_viewControllerClassName;
      v15->_viewControllerClassName = (NSString *)v32;

      v15->_remoteViewControllerClass = (Class)v29;
      v26 = [NSString stringWithFormat:@"com.apple.uikit._UIRemoteViewControllerCreationRequest %@ %@ %p", v53, aClassName, a1, v50, v51];
    }
    objc_storeStrong((id *)&v15->_traits, a6);
    objc_storeStrong(&v15->_exportedHostingObject, a7);
    objc_storeStrong((id *)&v15->_serviceViewControllerDeputyInterface, a8);
    v34 = objc_alloc_init(_UIRemoteViewControllerConnectionInfo);
    connectionInfo = v15->_connectionInfo;
    v15->_connectionInfo = v34;

    id v36 = v26;
    dispatch_queue_t v37 = dispatch_queue_create((const char *)[v36 UTF8String], 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v37;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v69) = 0;
    objc_initWeak(&location, v15);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke;
    aBlock[3] = &unk_1E530D6F0;
    v65 = buf;
    id v64 = v54;
    objc_copyWeak(&v66, &location);
    v39 = _Block_copy(aBlock);
    uint64_t v40 = [v39 copy];
    id handler = v15->_handler;
    v15->_id handler = (id)v40;

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_2;
    v61[3] = &unk_1E52E97E0;
    v42 = v15;
    v62 = v42;
    uint64_t v43 = +[_UIAsyncInvocation invocationWithBlock:v61];
    requestCancellationInvocation = v42->_requestCancellationInvocation;
    v42->_requestCancellationInvocation = (_UIAsyncInvocation *)v43;

    v45 = v15->_queue;
    if (v56)
    {
      v46 = v60;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v47 = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_3;
    }
    else
    {
      v46 = v59;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v47 = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_4;
    }
    v46[2] = v47;
    v46[3] = &unk_1E52D9F70;
    v48 = v42;
    v46[4] = v48;
    dispatch_async(v45, v46);

    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __207___UIRemoteViewControllerConnectionRequest___requestRemoteViewController_service_fromServiceWithBundleIdentifier_traitCollection_exportedHostingObject_serviceViewControllerDeputyInterface_connectionHandler___block_invoke_5;
    v57[3] = &unk_1E52E97E0;
    v58 = v48;
    v28 = +[_UIAsyncInvocation invocationWithBlock:v57];

    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:786747 userInfo:0];
    (*((void (**)(id, void, void *))v54 + 2))(v54, 0, v27);

    v28 = 0;
  }

  return v28;
}

+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 traitCollection:(id)a5 exportedHostingObject:(id)a6 serviceViewControllerDeputyInterface:(id)a7 connectionHandler:(id)a8
{
  return (id)objc_msgSend(a1, "__requestRemoteViewController:service:fromServiceWithBundleIdentifier:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:", a3, 0, a4, a5, a6, a7, a8);
}

+ (id)requestViewControllerWithService:(id)a3 traitCollection:(id)a4 exportedHostingObject:(id)a5 remoteViewControllerClass:(Class)a6 serviceViewControllerDeputyInterface:(id)a7 connectionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = NSStringFromClass(a6);
  v20 = objc_msgSend(a1, "__requestRemoteViewController:service:fromServiceWithBundleIdentifier:traitCollection:exportedHostingObject:serviceViewControllerDeputyInterface:connectionHandler:", v19, v18, 0, v17, v16, v15, v14);

  return v20;
}

- (void)dealloc
{
  v8[37] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = @"UIWindowFirstResponderDidChangeNotification";
  v8[1] = @"UITextEffectsWindowViewControllerWillRotateNotification";
  v8[2] = @"UIApplicationDidChangeStatusBarOrientationNotification";
  v8[3] = @"UIApplicationStatusBarHeightChangedNotification";
  v8[4] = @"UIApplicationWillEnterForegroundNotification";
  v8[5] = @"UISceneWillEnterForegroundNotification";
  v8[6] = 0x1ED180300;
  v8[7] = 0x1ED180340;
  v8[8] = @"_UIPencilEventDidEvaluateBarrelFocusForSceneTransition";
  v8[9] = @"_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition";
  v8[10] = @"UIApplicationDidEnterBackgroundNotification";
  v8[11] = @"UISceneDidEnterBackgroundNotification";
  v8[12] = 0x1ED1802E0;
  v8[13] = 0x1ED180320;
  v8[14] = @"_UIApplicationDidFinishSuspensionSnapshotNotification";
  v8[15] = @"_UIScreenDisplayConfigurationUpdatedNotification";
  uint64_t v4 = *MEMORY[0x1E4FB3528];
  v8[16] = @"UIScreenReferenceDisplayModeStatusDidChangeNotification";
  v8[17] = v4;
  v8[18] = @"_UIScreenDidConnectNotification";
  v8[19] = @"_UIScreenDidDisconnectNotification";
  v8[20] = @"UIScreenCapturedDidChangeNotification";
  v8[21] = _UIWindowDidAttachContextNotification;
  v8[22] = @"UIApplicationDidBecomeActiveNotification";
  v8[23] = @"UIApplicationWillResignActiveNotification";
  v8[24] = @"_UIApplicationWillAddDeactivationReasonNotification";
  v8[25] = @"_UISystemApplicationWillLockNotification";
  v8[26] = @"_UISystemApplicationDidUnlockNotification";
  v8[27] = @"_UIScreenUniqueIdDidChangeNotification";
  v8[28] = @"_UISceneWillChangeSettingsSceneNotification";
  v8[29] = @"_UIWindowWillBecomeApplicationKeyNotification";
  v8[30] = 0x1ED1601C0;
  v8[31] = 0x1ED1601E0;
  v8[32] = 0x1ED1803E0;
  v8[33] = @"UIWindowDidBecomeKeyNotification";
  v8[34] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v8[35] = @"UIWindowDidResignKeyNotification";
  v8[36] = @"_UIWindowDidResignApplicationKeyNotification";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:37];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v5);

  [v3 removeObserver:self name:@"_UIWindowSceneEnhancedWindowingModeChanged" object:0];
  contextToken = self->_contextToken;
  self->_contextToken = 0;

  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewControllerConnectionRequest;
  [(_UIRemoteViewControllerConnectionRequest *)&v7 dealloc];
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___UIRemoteViewControllerConnectionRequest__cancelUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 successHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isCancelledOrComplete)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__227;
    v21[4] = __Block_byref_object_dispose__227;
    v11 = self;
    uint64_t v22 = v11;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___UIRemoteViewControllerConnectionRequest__connectToDeputyWithInterface_fromExportedHostingObject_successHandler___block_invoke;
    aBlock[3] = &unk_1E530D718;
    v20 = v21;
    id v12 = v8;
    id v18 = v12;
    id v19 = v10;
    v13 = _Block_copy(aBlock);
    id v14 = [(_UIRemoteViewControllerConnectionInfo *)v11->_connectionInfo interface];
    uint64_t v15 = [v14 connectToDeputyWithInterface:v12 fromExportedHostingObject:v9 connectionHandler:v13];
    cancelInvocationForCurrentOperation = v11->_cancelInvocationForCurrentOperation;
    v11->_cancelInvocationForCurrentOperation = (_UIAsyncInvocation *)v15;

    _Block_object_dispose(v21, 8);
  }
}

- (void)_connectToViewService
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (self->_cancelInvocationForCurrentOperation)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:1301 description:@"A connection is already in progress."];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__227;
  v15[4] = __Block_byref_object_dispose__227;
  v3 = self;
  id v16 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65___UIRemoteViewControllerConnectionRequest__connectToViewService__block_invoke;
  v14[3] = &unk_1E530D740;
  v14[4] = v15;
  id v4 = _Block_copy(v14);
  v5 = [(id)objc_opt_class() XPCInterface];
  v17[0] = v5;
  id v6 = [(id)objc_opt_class() XPCInterface];
  v17[1] = v6;
  objc_super v7 = [(id)objc_opt_class() XPCInterface];
  serviceViewControllerDeputyInterface = v3->_serviceViewControllerDeputyInterface;
  v17[2] = v7;
  v17[3] = serviceViewControllerDeputyInterface;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  id v10 = +[_UIViewServiceInterface connectToViewServiceWithBundleIdentifier:v3->_viewServiceBundleIdentifier deputyInterfaces:v9 connectionHandler:v4];
  cancelInvocationForCurrentOperation = self->_cancelInvocationForCurrentOperation;
  self->_cancelInvocationForCurrentOperation = v10;

  _Block_object_dispose(v15, 8);
}

- (void)_connectToPlugInKitService
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (self->_cancelInvocationForCurrentOperation)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:1321 description:@"A connection is already in progress."];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__227;
  v15[4] = __Block_byref_object_dispose__227;
  v3 = self;
  id v16 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___UIRemoteViewControllerConnectionRequest__connectToPlugInKitService__block_invoke;
  v14[3] = &unk_1E530D740;
  v14[4] = v15;
  id v4 = _Block_copy(v14);
  v5 = [(id)objc_opt_class() XPCInterface];
  v17[0] = v5;
  id v6 = [(id)objc_opt_class() XPCInterface];
  v17[1] = v6;
  objc_super v7 = [(id)objc_opt_class() XPCInterface];
  serviceViewControllerDeputyInterface = v3->_serviceViewControllerDeputyInterface;
  v17[2] = v7;
  v17[3] = serviceViewControllerDeputyInterface;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  id v10 = +[_UIViewServiceInterface connectToViewService:v3->_service deputyInterfaces:v9 connectionHandler:v4];
  cancelInvocationForCurrentOperation = self->_cancelInvocationForCurrentOperation;
  self->_cancelInvocationForCurrentOperation = v10;

  _Block_object_dispose(v15, 8);
}

- (void)_connectToViewControllerOperator
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__227;
  v6[4] = __Block_byref_object_dispose__227;
  v2 = self;
  objc_super v7 = v2;
  v3 = +[_UIViewServiceViewControllerOperator XPCInterface];
  id v4 = +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:v2->_exportedHostingObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76___UIRemoteViewControllerConnectionRequest__connectToViewControllerOperator__block_invoke;
  v5[3] = &unk_1E52E68D0;
  v5[4] = v6;
  [(_UIRemoteViewControllerConnectionRequest *)v2 _connectToDeputyWithInterface:v3 fromExportedHostingObject:v4 successHandler:v5];

  _Block_object_dispose(v6, 8);
}

- (void)_sendServiceViewControllerRequest
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_isCancelledOrComplete)
  {
    id v4 = [(_UIRemoteViewControllerConnectionInfo *)self->_connectionInfo hostedWindowHostingHandle];

    if (v4)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:1353 description:@"Already got the hosted window context ID"];
    }
    if (objc_opt_respondsToSelector())
    {
      ipc_space_t v5 = *MEMORY[0x1E4F14960];
      mach_port_name_t v6 = [(id)UIApp _accessibilityMachPort];
      mach_port_insert_right(v5, v6, [(id)UIApp _accessibilityMachPort], 0x14u);
      id v7 = objc_alloc(MEMORY[0x1E4F4F770]);
      id v8 = objc_msgSend(v7, "initWithPort:", objc_msgSend((id)UIApp, "_accessibilityMachPort"));
    }
    else
    {
      id v8 = 0;
    }
    int64_t v9 = +[_UITextServiceSession availableTextServices];
    traits = self->_traits;
    if (traits)
    {
      v11 = traits;
    }
    else
    {
      id v12 = +[UIScreen mainScreen];
      v11 = [v12 traitCollection];
    }
    v13 = objc_alloc_init(_UIViewServiceViewControllerOperatorCreateOptions);
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setViewControllerClassName:self->_viewControllerClassName];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setContextToken:self->_contextToken];
    id v14 = +[UIScreen __displayConfigurationsForViewService];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setDisplayConfigurations:v14];

    uint64_t v15 = _obscuredTraitCollectionFromTraitCollection(v11);
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setTraitCollection:v15];

    id v16 = +[UIScreen mainScreen];
    -[_UIViewServiceViewControllerOperatorCreateOptions setInitialInterfaceOrientation:](v13, "setInitialInterfaceOrientation:", [v16 _interfaceOrientation]);

    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setHostAccessibilityServerPort:v8];
    [(_UIViewServiceViewControllerOperatorCreateOptions *)v13 setAvailableTextServices:v9];
    id v17 = [(_UIRemoteViewControllerConnectionInfo *)self->_connectionInfo viewControllerOperatorProxy];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke;
    v24[3] = &unk_1E52E3C18;
    v24[4] = self;
    id v18 = [v17 remoteObjectProxyWithErrorHandler:v24];

    id v19 = *(id *)(__UILogGetCategoryCachedImpl("ViewServiceConnectionRequest", _sendServiceViewControllerRequest___s_category)+ 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(_UIRemoteViewService *)self->_service identifier];
      viewServiceBundleIdentifier = v20;
      if (!v20) {
        viewServiceBundleIdentifier = self->_viewServiceBundleIdentifier;
      }
      *(_DWORD *)buf = 138543362;
      v26 = viewServiceBundleIdentifier;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Sending view controller creation request to %{public}@", buf, 0xCu);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77___UIRemoteViewControllerConnectionRequest__sendServiceViewControllerRequest__block_invoke_286;
    v23[3] = &unk_1E530D768;
    v23[4] = self;
    objc_msgSend(v18, "__createViewControllerWithOptions:completionBlock:", v13, v23);
  }
}

- (void)_connectToTextEffectsOperator
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__227;
  v6[4] = __Block_byref_object_dispose__227;
  v2 = self;
  id v7 = v2;
  v3 = +[_UIViewServiceTextEffectsOperator XPCInterface];
  id v4 = +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:v2->_exportedHostingObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73___UIRemoteViewControllerConnectionRequest__connectToTextEffectsOperator__block_invoke;
  v5[3] = &unk_1E52E68D0;
  v5[4] = v6;
  [(_UIRemoteViewControllerConnectionRequest *)v2 _connectToDeputyWithInterface:v3 fromExportedHostingObject:v4 successHandler:v5];

  _Block_object_dispose(v6, 8);
}

- (void)_sendServiceTextEffectsRequest
{
  if (!self->_isCancelledOrComplete)
  {
    id v4 = [(_UIRemoteViewControllerConnectionInfo *)self->_connectionInfo textEffectsWindowHostingHandle];

    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:1455 description:@"Already got the text effects window's hosting handle"];
    }
    ipc_space_t v5 = [(_UIRemoteViewControllerConnectionInfo *)self->_connectionInfo textEffectsOperatorProxy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke;
    v9[3] = &unk_1E52E3C18;
    v9[4] = self;
    mach_port_name_t v6 = [v5 remoteObjectProxyWithErrorHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74___UIRemoteViewControllerConnectionRequest__sendServiceTextEffectsRequest__block_invoke_2;
    v8[3] = &unk_1E530D790;
    v8[4] = self;
    objc_msgSend(v6, "__createHostedTextEffectsWithReplyHandler:", v8);
  }
}

- (void)_connectToServiceViewController
{
  v2 = self;
  serviceViewControllerDeputyInterface = v2->_serviceViewControllerDeputyInterface;
  id v4 = +[_UIRemoteViewControllerWeakWrapperProxy wrapperWithTarget:v2->_exportedHostingObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75___UIRemoteViewControllerConnectionRequest__connectToServiceViewController__block_invoke;
  v6[3] = &unk_1E52FDC70;
  id v7 = v2;
  ipc_space_t v5 = v2;
  [(_UIRemoteViewControllerConnectionRequest *)v5 _connectToDeputyWithInterface:serviceViewControllerDeputyInterface fromExportedHostingObject:v4 successHandler:v6];
}

- (void)_connectToViewControllerControlMessageDeputy
{
  v2 = self;
  v3 = +[_UIViewControllerControlMessageDeputy XPCInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88___UIRemoteViewControllerConnectionRequest__connectToViewControllerControlMessageDeputy__block_invoke;
  v5[3] = &unk_1E52FDC70;
  mach_port_name_t v6 = v2;
  id v4 = v2;
  [(_UIRemoteViewControllerConnectionRequest *)v4 _connectToDeputyWithInterface:v3 fromExportedHostingObject:0 successHandler:v5];
}

- (void)_didFinishEstablishingConnection
{
  if (!self->_isCancelledOrComplete)
  {
    self->_isCancelledOrComplete = 1;
    [(objc_class *)self->_remoteViewControllerClass __shouldHostRemoteTextEffectsWindow];
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceConnectionRequest", &_didFinishEstablishingConnection___s_category)+ 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Connection to service was established", (uint8_t *)v7, 2u);
    }
    id v4 = self;
    id handler = (void (**)(id, _UIRemoteViewControllerConnectionInfo *, void))v4->_handler;
    if (handler)
    {
      handler[2](handler, v4->_connectionInfo, 0);
      id v6 = v4->_handler;
    }
    else
    {
      id v6 = 0;
    }
    v4->_id handler = 0;
  }
}

- (id)_cancelWithError:(id)a3
{
  id v5 = a3;
  if (!self->_error) {
    objc_storeStrong((id *)&self->_error, a3);
  }
  requestCancellationInvocation = self->_requestCancellationInvocation;
  if (requestCancellationInvocation)
  {
    id v7 = requestCancellationInvocation;
  }
  else
  {
    id v7 = +[_UIAsyncInvocation emptyInvocation];
  }
  id v8 = v7;
  int64_t v9 = [(_UIAsyncInvocation *)v7 invoke];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_cancelInvocationForCurrentOperation, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerDeputyInterface, 0);
  objc_storeStrong(&self->_exportedHostingObject, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewServiceBundleIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end