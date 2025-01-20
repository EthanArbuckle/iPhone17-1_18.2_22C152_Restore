@interface PBUICARemoteRenderer
+ (BOOL)shouldUseXPCServiceForRendering;
+ (NSSet)secureCodableRequestClasses;
+ (PBUIRenderer)remoteRendererIfPossible;
- (BOOL)supportsRequest:(id)a3 orError:(id *)a4;
- (CGColorSpace)colorSpace;
- (PBUICARemoteRenderer)init;
- (PBUICARemoteRenderer)initWithUnderlyingConnection:(id)a3;
- (PBUIRemoteRendererConnection)underlyingConnection;
- (id)renderRequest:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)renderRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation PBUICARemoteRenderer

+ (NSSet)secureCodableRequestClasses
{
  if (secureCodableRequestClasses_onceToken != -1) {
    dispatch_once(&secureCodableRequestClasses_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)secureCodableRequestClasses_result;
  return (NSSet *)v2;
}

void __51__PBUICARemoteRenderer_secureCodableRequestClasses__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)secureCodableRequestClasses_result;
  secureCodableRequestClasses_result = v2;
}

- (PBUICARemoteRenderer)init
{
  v3 = +[PBUIRemoteRendererXPCConnection defaultConnection];
  v4 = [(PBUICARemoteRenderer *)self initWithUnderlyingConnection:v3];

  return v4;
}

- (PBUICARemoteRenderer)initWithUnderlyingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUICARemoteRenderer;
  v6 = [(PBUICARemoteRenderer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
    v7->_colorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  }

  return v7;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PBUICARemoteRenderer;
  [(PBUICARemoteRenderer *)&v3 dealloc];
}

+ (PBUIRenderer)remoteRendererIfPossible
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PBUICARemoteRenderer_remoteRendererIfPossible__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteRendererIfPossible_onceToken != -1) {
    dispatch_once(&remoteRendererIfPossible_onceToken, block);
  }
  uint64_t v2 = (void *)remoteRendererIfPossible___renderer;
  return (PBUIRenderer *)v2;
}

uint64_t __48__PBUICARemoteRenderer_remoteRendererIfPossible__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUseXPCServiceForRendering]) {
    v1 = objc_alloc_init(PBUICARemoteRenderer);
  }
  else {
    v1 = [[PBUICALocalRenderer alloc] initWithColorSpace:0];
  }
  uint64_t v2 = remoteRendererIfPossible___renderer;
  remoteRendererIfPossible___renderer = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)supportsRequest:(id)a3 orError:(id *)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_respondsToSelector() & 1) != 0 && ([(id)objc_opt_class() supportsSecureCoding])
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    v11[0] = *MEMORY[0x1E4F28578];
    v7 = [NSString stringWithFormat:@"Request cannot be rendered remotely."];
    v12[0] = v7;
    v8 = v11[1] = *MEMORY[0x1E4F28588];
    v12[1] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    *a4 = [v6 errorWithDomain:@"com.apple.PaperBoardUI.PBUIRenderer" code:1 userInfo:v9];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)renderRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v30 = 0;
  BOOL v7 = [(PBUICARemoteRenderer *)self supportsRequest:v6 orError:&v30];
  id v8 = v30;
  objc_super v9 = v8;
  if (v7)
  {
    id v10 = v6;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6;
    v22 = __Block_byref_object_dispose__6;
    id v23 = 0;
    v11 = [(PBUICARemoteRenderer *)self underlyingConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__PBUICARemoteRenderer_renderRequest_error___block_invoke;
    v17[3] = &unk_1E62B4688;
    v17[4] = &v18;
    v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v17];

    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __44__PBUICARemoteRenderer_renderRequest_error___block_invoke_2;
      v16[3] = &unk_1E62B46B0;
      v16[4] = &v18;
      v16[5] = &v24;
      [v12 renderRequest:v10 reply:v16];
    }
    if (a4)
    {
      v13 = (void *)v19[5];
      if (v13) {
        *a4 = v13;
      }
    }
    id v14 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v14 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v14;
}

void __44__PBUICARemoteRenderer_renderRequest_error___block_invoke(uint64_t a1, void *a2)
{
}

void __44__PBUICARemoteRenderer_renderRequest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)renderRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  BOOL v8 = [(PBUICARemoteRenderer *)self supportsRequest:v6 orError:&v18];
  id v9 = v18;
  if (v8)
  {
    id v10 = v6;
    v11 = [(PBUICARemoteRenderer *)self underlyingConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E62B46D8;
    id v12 = v7;
    id v17 = v12;
    v13 = [v11 remoteObjectProxyWithErrorHandler:v16];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke_2;
      v14[3] = &unk_1E62B4700;
      id v15 = v12;
      [v13 renderRequest:v10 reply:v14];
    }
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

uint64_t __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)shouldUseXPCServiceForRendering
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  char v3 = [v2 isFrontBoard];

  return v3;
}

- (PBUIRemoteRendererConnection)underlyingConnection
{
  return self->_underlyingConnection;
}

- (void).cxx_destruct
{
}

@end