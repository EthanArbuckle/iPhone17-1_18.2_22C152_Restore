@interface _RELocalTrainingContext
- (_RELocalTrainingContext)initWithConnection:(id)a3;
- (id)_elementRelevanceEngine;
- (id)invalidationHandler;
- (void)_configureForRelevanceEngine:(id)a3;
- (void)_handleInvalidation;
- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6;
- (void)setInvalidationHandler:(id)a3;
- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation _RELocalTrainingContext

- (_RELocalTrainingContext)initWithConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_RELocalTrainingContext;
  v6 = [(RETrainingContext *)&v19 init];
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.RelevanceEngine.LocalTrainingContext.%p", v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    [(_RELocalTrainingContext *)v6 _configureForRelevanceEngine:0];
    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    v11 = RERemoteTrainingClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v11];

    v12 = v6->_connection;
    v13 = RERemoteTrainingServerInterface();
    [(NSXPCConnection *)v12 setExportedInterface:v13];

    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    objc_initWeak(&location, v6);
    v14 = v6->_connection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46___RELocalTrainingContext_initWithConnection___block_invoke;
    v16[3] = &unk_2644BC638;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v14 setInvalidationHandler:v16];
    [(NSXPCConnection *)v6->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (id)_elementRelevanceEngine
{
  v2 = [(RETrainingContext *)self relevanceEngine];
  v3 = [v2 coordinator];
  v4 = [v3 elementRelevanceEngine];

  return v4;
}

- (void)_configureForRelevanceEngine:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_RELocalTrainingContext;
  [(RETrainingContext *)&v6 _configureForRelevanceEngine:a3];
  v4 = [(_RELocalTrainingContext *)self _elementRelevanceEngine];
  id v5 = [v4 queue];

  if (!v5)
  {
    id v5 = dispatch_get_global_queue(17, 0);
  }
  dispatch_set_target_queue((dispatch_object_t)self->_queue, v5);
}

- (void)_handleInvalidation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___RELocalTrainingContext__handleInvalidation__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self->_queue;
  v15 = [(_RELocalTrainingContext *)self _elementRelevanceEngine];
  v16 = [v15 queue];

  if (v16)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke;
    block[3] = &unk_2644BDC18;
    block[4] = self;
    id v20 = v16;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    v24 = v14;
    id v25 = v13;
    dispatch_async(queue, block);
  }
  else
  {
    v18 = RELogForDomain(17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E6E6000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to train, but the trainingQueue is nil!", buf, 2u);
    }

    dispatch_async((dispatch_queue_t)v14, v13);
  }
}

- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67___RELocalTrainingContext_updateRemoteAttribute_forKey_completion___block_invoke;
  v15[3] = &unk_2644BDC40;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end