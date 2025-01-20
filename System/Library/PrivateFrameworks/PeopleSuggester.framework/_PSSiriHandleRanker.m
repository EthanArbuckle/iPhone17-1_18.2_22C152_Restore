@interface _PSSiriHandleRanker
- (_PSSiriHandleRanker)init;
- (id)rankedHandles:(id)a3 context:(id)a4;
- (void)dealloc;
@end

@implementation _PSSiriHandleRanker

- (_PSSiriHandleRanker)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PSSiriHandleRanker;
  v2 = [(_PSSiriHandleRanker *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PSSiriHandleRanker;
  [(_PSSiriHandleRanker *)&v3 dealloc];
}

- (id)rankedHandles:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  if (connection)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__19;
    v17 = __Block_byref_object_dispose__19;
    id v18 = 0;
    v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_35];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45___PSSiriHandleRanker_rankedHandles_context___block_invoke_4;
    v12[3] = &unk_1E5ADF998;
    v12[4] = &v13;
    [v9 rankedSiriMLCRHandlesFromContext:v7 handles:v6 reply:v12];
    id v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end