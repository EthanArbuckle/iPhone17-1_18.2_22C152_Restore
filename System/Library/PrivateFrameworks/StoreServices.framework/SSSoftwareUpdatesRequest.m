@interface SSSoftwareUpdatesRequest
- (BOOL)start;
- (SSSoftwareUpdatesContext)updateQueueContext;
- (SSSoftwareUpdatesRequest)initWithUpdateQueueContext:(id)a3;
- (SSSoftwareUpdatesRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithUpdatesResponseBlock:(id)a3;
@end

@implementation SSSoftwareUpdatesRequest

- (SSSoftwareUpdatesRequest)initWithUpdateQueueContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareUpdatesRequest;
  v4 = [(SSRequest *)&v6 init];
  if (v4) {
    v4->_context = (SSSoftwareUpdatesContext *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesRequest;
  [(SSRequest *)&v3 dealloc];
}

- (void)startWithUpdatesResponseBlock:(id)a3
{
  if (a3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SSSoftwareUpdatesRequest_startWithUpdatesResponseBlock___block_invoke;
    block[3] = &unk_1E5BA7700;
    block[4] = a3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __58__SSSoftwareUpdatesRequest_startWithUpdatesResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = SSError(@"SSErrorDomain", 106, 0, 0);
  objc_super v3 = *(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16);
  return v3(v1, 0, v2);
}

- (SSSoftwareUpdatesContext)updateQueueContext
{
  uint64_t v2 = self->_context;
  return v2;
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__SSSoftwareUpdatesRequest_start__block_invoke;
  v3[3] = &unk_1E5BA9CD0;
  v3[4] = self;
  [(SSSoftwareUpdatesRequest *)self startWithUpdatesResponseBlock:v3];
  return 1;
}

void __33__SSSoftwareUpdatesRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSSoftwareUpdatesRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA8630;
  block[4] = *(void *)(a1 + 32);
  void block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __33__SSSoftwareUpdatesRequest_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 updateQueueRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      return [v2 requestDidFinish:v4];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v2 request:v5 didFailWithError:v6];
    }
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SSSoftwareUpdatesRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E5BA9CF8;
  v3[4] = a3;
  [(SSSoftwareUpdatesRequest *)self startWithUpdatesResponseBlock:v3];
}

uint64_t __53__SSSoftwareUpdatesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_context);
  return v3;
}

- (SSSoftwareUpdatesRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSoftwareUpdatesRequest;
    v7 = [(SSRequest *)&v8 init];
    uint64_t v5 = v7;
    if (v7)
    {

      v5->_context = [[SSSoftwareUpdatesContext alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "50")];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end