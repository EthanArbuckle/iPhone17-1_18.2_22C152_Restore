@interface _PSHandleRanker
- (_PSHandleRanker)init;
- (id)rankedHandlesFromCandidateHandles:(id)a3;
- (void)dealloc;
@end

@implementation _PSHandleRanker

- (_PSHandleRanker)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PSHandleRanker;
  v2 = [(_PSHandleRanker *)&v8 init];
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
  v3.super_class = (Class)_PSHandleRanker;
  [(_PSHandleRanker *)&v3 dealloc];
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (connection)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__6;
    v14 = __Block_byref_object_dispose__6;
    id v15 = 0;
    v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_14];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_4;
    v9[3] = &unk_1E5ADF998;
    v9[4] = &v10;
    [v6 rankedHandlesFromCandidateHandles:v4 reply:v9];
    id v7 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end