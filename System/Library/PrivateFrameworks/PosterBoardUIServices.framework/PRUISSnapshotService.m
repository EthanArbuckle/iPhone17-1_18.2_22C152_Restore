@interface PRUISSnapshotService
+ (id)secureCodableRequestClasses;
+ (id)secureCodableResponseClasses;
- (PRUISSnapshotService)init;
- (PRUISSnapshotService)initWithUnderlyingConnection:(id)a3;
- (id)cachedSnapshotForRequest:(id)a3 error:(id *)a4;
- (void)executeSnapshotRequest:(id)a3 completion:(id)a4;
@end

@implementation PRUISSnapshotService

+ (id)secureCodableRequestClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 setWithObject:v3];
}

+ (id)secureCodableResponseClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (PRUISSnapshotService)init
{
  uint64_t v3 = [MEMORY[0x263F5BB38] defaultConnection];
  v4 = [(PRUISSnapshotService *)self initWithUnderlyingConnection:v3];

  return v4;
}

- (PRUISSnapshotService)initWithUnderlyingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISSnapshotService;
  v6 = [(PRUISSnapshotService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
  }

  return v7;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  underlyingConnection = self->_underlyingConnection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke;
  v18[3] = &unk_26546B2A0;
  id v10 = v7;
  id v20 = v10;
  id v11 = v6;
  id v19 = v11;
  v12 = [(PBUIRemoteRendererXPCConnection *)underlyingConnection remoteObjectProxyWithErrorHandler:v18];
  if (v12)
  {
    v13 = [[PRUISSnapshotServiceRequest alloc] initWithSnapshotRequest:v11];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke_2;
    v14[3] = &unk_26546B2C8;
    id v16 = v10;
    id v15 = v11;
    CFAbsoluteTime v17 = Current;
    [v12 executeSnapshotRequest:v13 reply:v14];
  }
}

void __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v4 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, v3, 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void, id))(v2 + 16))(v2, v3, 0, v6);
  }
}

void __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (!v16 || v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(void, void, void, id))(v7 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, v5);
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 0);
      (*(void (**)(uint64_t, uint64_t, void, void *))(v7 + 16))(v7, v8, 0, v12);
    }
  }
  else
  {
    id v6 = [v16 error];
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      objc_super v9 = [v16 snapshotBundle];
      if (v9)
      {
        id v10 = [v16 sandboxExtensionToken];
        id v11 = (void *)[objc_alloc(MEMORY[0x263F5F5D0]) initWithRequest:*(void *)(a1 + 32) snapshotBundle:v9 executeTime:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48)];
        objc_setAssociatedObject(v9, "sandboxExtensionToken", v10, (void *)1);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v15 = a1 + 32;
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(v15 + 8);
        id v10 = objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 0);
        (*(void (**)(uint64_t, uint64_t, void, void *))(v14 + 16))(v14, v13, 0, v10);
      }
    }
  }
}

- (id)cachedSnapshotForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  underlyingConnection = self->_underlyingConnection;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke;
  v37[3] = &unk_26546B2F0;
  v37[4] = &v38;
  objc_super v9 = [(PBUIRemoteRendererXPCConnection *)underlyingConnection synchronousRemoteObjectProxyWithErrorHandler:v37];
  id v10 = (void *)v39[5];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    uint64_t v13 = [[PRUISSnapshotServiceRequest alloc] initWithSnapshotRequest:v6];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    id v30 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke_2;
    v24[3] = &unk_26546B318;
    v24[4] = &v25;
    v24[5] = &v31;
    [v9 cachedSnapshotForRequest:v13 reply:v24];
    if (!v32[5])
    {
      uint64_t v15 = (void *)v26[5];
      if (v15)
      {
        id v16 = [v15 error];

        if (!v16)
        {
          CFAbsoluteTime v17 = [(id)v26[5] snapshotBundle];
          v12 = (void *)[objc_alloc(MEMORY[0x263F5F5D0]) initWithRequest:v6 snapshotBundle:v17 executeTime:CFAbsoluteTimeGetCurrent() - Current];
          v18 = [(id)v26[5] sandboxExtensionToken];
          objc_setAssociatedObject(v12, "sandboxExtensionToken", v17, (void *)1);

          goto LABEL_23;
        }
      }
    }
    if (a4)
    {
      uint64_t v14 = (void *)v32[5];
      if (v14)
      {
        v12 = 0;
        *a4 = v14;
LABEL_23:
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
        goto LABEL_24;
      }
      id v20 = [(id)v26[5] error];
      v21 = v20;
      if (v20)
      {
        *a4 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 0);
        id v22 = objc_claimAutoreleasedReturnValue();
        *a4 = v22;
      }
    }
    v12 = 0;
    goto LABEL_23;
  }
  if (a4)
  {
    if (v10)
    {
      v12 = 0;
      *a4 = v10;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x263F087E8], "pui_errorWithCode:", 0);
    id v19 = objc_claimAutoreleasedReturnValue();
    *a4 = v19;
  }
  v12 = 0;
LABEL_24:

  _Block_object_dispose(&v38, 8);

  return v12;
}

void __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke(uint64_t a1, void *a2)
{
}

void __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void).cxx_destruct
{
}

@end