@interface _UIOHypogeanViewRequestAction_TestingOnly
+ (id)_overlay_viewRegistry;
- (BOOL)isPermitted;
- (_UIOHypogeanViewRequestAction_TestingOnly)initWithConfiguration:(id)a3 responseHandler:(id)a4;
- (_UIOHypogeanViewRequestConfiguration)configuration;
- (void)_performActionWithDisplayDelegate:(id)a3;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIOHypogeanViewRequestAction_TestingOnly

+ (id)_overlay_viewRegistry
{
  if (_MergedGlobals_1181 != -1) {
    dispatch_once(&_MergedGlobals_1181, &__block_literal_global_417);
  }
  v2 = (void *)qword_1EB262170;
  return v2;
}

- (_UIOHypogeanViewRequestAction_TestingOnly)initWithConfiguration:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v18 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v18];
  id v8 = v18;
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v9 setObject:v7 forSetting:0];
  v10 = (void *)MEMORY[0x1E4F4F670];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83___UIOHypogeanViewRequestAction_TestingOnly_initWithConfiguration_responseHandler___block_invoke;
  v16[3] = &unk_1E52EE548;
  id v17 = v6;
  id v11 = v6;
  v12 = [v10 responderWithHandler:v16];
  v15.receiver = self;
  v15.super_class = (Class)_UIOHypogeanViewRequestAction_TestingOnly;
  v13 = [(_UIOServerAction *)&v15 initWithOriginContext:0 info:v9 responder:v12];

  return v13;
}

- (BOOL)isPermitted
{
  return os_variant_has_internal_diagnostics();
}

- (_UIOHypogeanViewRequestConfiguration)configuration
{
  v2 = [(_UIOHypogeanViewRequestAction_TestingOnly *)self info];
  v3 = [v2 objectForSetting:0];

  v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return (_UIOHypogeanViewRequestConfiguration *)v4;
}

- (void)performActionFromConnection:(id)a3
{
  v4 = [a3 server];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73___UIOHypogeanViewRequestAction_TestingOnly_performActionFromConnection___block_invoke;
  v5[3] = &unk_1E53001A0;
  v5[4] = self;
  [v4 awaitDisplayDelegateForAction:self sceneType:2 timeout:v5 completion:2.0];
}

- (void)_performActionWithDisplayDelegate:(id)a3
{
  id v5 = a3;
  id v23 = v5;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"_UIOHypogeanViewActions_TestingOnly.m" lineNumber:140 description:@"No display delegate."];

    id v5 = 0;
  }
  id v6 = [v5 window];

  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"_UIOHypogeanViewActions_TestingOnly.m" lineNumber:141 description:@"No display delegate window"];
  }
  v7 = [v23 rootViewController];
  id v8 = +[UIButtonConfiguration borderedTintedButtonConfiguration];
  [v8 setTitle:@"Test Button"];
  id v9 = +[UIAction actionWithHandler:&__block_literal_global_89];
  v10 = +[UIButton buttonWithConfiguration:v8 primaryAction:v9];

  id v11 = [v7 view];
  [v11 addSubview:v10];

  [v10 sizeToFit];
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];

  v14 = objc_msgSend((id)objc_opt_class(), "_overlay_viewRegistry");
  [v14 setObject:v10 forKey:v13];

  objc_super v15 = objc_alloc_init(_UIOHypogeanViewHandle);
  [(_UIOHypogeanViewHandle *)v15 setUniqueIdentifier:v13];
  v16 = [v23 window];
  -[_UIOHypogeanViewHandle setContextId:](v15, "setContextId:", [v16 _contextId]);

  id v17 = [v10 layer];
  [(_UIOHypogeanViewHandle *)v15 setRenderId:CALayerGetRenderId()];

  [v10 bounds];
  -[_UIOHypogeanViewHandle setBounds:](v15, "setBounds:");
  id v18 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
  [v18 setObject:v19 forSetting:1];

  v20 = [MEMORY[0x1E4F4F678] responseWithInfo:v18];
  [(_UIOHypogeanViewRequestAction_TestingOnly *)self sendResponse:v20];
}

@end