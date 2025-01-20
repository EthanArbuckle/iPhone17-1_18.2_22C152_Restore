@interface PUIDDisplayContextFactoryImpl
- (Class)contextClass;
- (id)newDisplayContextForDisplay:(id)a3 pointerRenderingScene:(id)a4 systemPointerScene:(id)a5;
- (void)createStreamsForDisplay:(id)a3 context:(id)a4;
@end

@implementation PUIDDisplayContextFactoryImpl

- (id)newDisplayContextForDisplay:(id)a3 pointerRenderingScene:(id)a4 systemPointerScene:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [(PUIDDisplayContextFactoryImpl *)self contextClass];
  if (([(objc_class *)v12 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v27 = +[NSAssertionHandler currentHandler];
    v28 = NSStringFromClass(v12);
    [v27 handleFailureInMethod:a2, self, @"PUIDDisplayContext.m", 121, @"contextClass '%@' was not PUIDDisplayContext or a subclass.", v28 object file lineNumber description];
  }
  id v13 = objc_alloc_init(v12);
  [v13 setDisplay:v9];
  v14 = [[PUIDPointerRenderingRootViewController alloc] initWithDisplay:v9 hiddenForPerformanceReasons:v10 != 0];
  v15 = [(PUIDSecurePassthroughWindow *)[PUIDPointerRenderingWindow alloc] initWithWindowScene:v11];

  [v13 setPointerRenderingWindow:v15];
  [v13 setPointerRenderingController:v14];
  [(PUIDPointerRenderingWindow *)v15 setRootViewController:v14];
  [(PUIDPointerRenderingWindow *)v15 setHidden:0];
  v16 = PSLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(PUIDSecurePassthroughWindow *)v15 puid_description];
    *(_DWORD *)buf = 138543618;
    id v30 = v9;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@> created pointerRenderingWindow: %{public}@", buf, 0x16u);
  }
  if (v10)
  {
    v18 = [[PUIDSystemPointerRootViewController alloc] initWithDisplay:v9];
    v19 = [(PUIDSecurePassthroughWindow *)[PUIDSystemPointerWindow alloc] initWithWindowScene:v10];
    [v13 setSystemPointerWindow:v19];
    [v13 setSystemPointerRenderingController:v18];
    [(PUIDSystemPointerWindow *)v19 setRootViewController:v18];
    [(PUIDSystemPointerWindow *)v19 setHidden:0];
    v20 = PSLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(PUIDSecurePassthroughWindow *)v19 puid_description];
      *(_DWORD *)buf = 138543618;
      id v30 = v9;
      __int16 v31 = 2114;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@> created systemPointerWindow: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    PSLogCommon();
    v18 = (PUIDSystemPointerRootViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, &v18->super.super.super, OS_LOG_TYPE_DEFAULT, "<%{public}@> skipped creating system pointer window", buf, 0xCu);
    }
  }

  [(PUIDDisplayContextFactoryImpl *)self createStreamsForDisplay:v9 context:v13];
  v22 = [PUIDSystemPointerClient alloc];
  v23 = +[NSUUID UUID];
  v24 = +[BSAuditToken tokenForCurrentProcess];
  v25 = [(PUIDPointerClient *)v22 initWithUniqueIdentifier:v23 auditToken:v24];

  [v13 setSystemPointerClient:v25];
  return v13;
}

- (Class)contextClass
{
  return (Class)objc_opt_class();
}

- (void)createStreamsForDisplay:(id)a3 context:(id)a4
{
  id v15 = a3;
  v5 = (id *)a4;
  v6 = +[BKSMousePointerService sharedInstance];
  v7 = [v15 hardwareIdentifier];
  if (v5) {
    id v8 = [v5[5] _contextId];
  }
  else {
    id v8 = 0;
  }
  id v9 = [v6 requestGlobalMouseEventsForDisplay:v7 targetContextID:v8];

  [v5 setPointerEventStream:v9];
  id v10 = objc_alloc((Class)BKSTouchStream);
  if (v5) {
    id v11 = [v5[5] _contextId];
  }
  else {
    id v11 = 0;
  }
  v12 = [v15 hardwareIdentifier];
  id v13 = objc_opt_new();
  id v14 = [v10 initWithContextID:v11 displayUUID:v12 identifier:3 policy:v13];

  [v14 setEventDispatchMode:2 lastTouchTimestamp:0.0];
  [v5 setTouchStream:v14];
}

@end