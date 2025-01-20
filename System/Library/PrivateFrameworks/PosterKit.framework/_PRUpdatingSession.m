@interface _PRUpdatingSession
- (_PRUpdatingSession)initWithConnectionAssertion:(id)a3 errorHandler:(id)a4;
- (void)dealloc;
- (void)fireError:(id)a3;
- (void)invalidate;
- (void)noteSessionIsComplete;
@end

@implementation _PRUpdatingSession

- (_PRUpdatingSession)initWithConnectionAssertion:(id)a3 errorHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PRUpdatingSession;
  v9 = [(_PRUpdatingSession *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionAssertion, a3);
    uint64_t v11 = [v8 copy];
    id errorHandlerBlock = v10->_errorHandlerBlock;
    v10->_id errorHandlerBlock = (id)v11;
  }
  return v10;
}

- (void)dealloc
{
  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 3);
  [(_PRUpdatingSession *)self fireError:v3];

  v4.receiver = self;
  v4.super_class = (Class)_PRUpdatingSession;
  [(_PRUpdatingSession *)&v4 dealloc];
}

- (void)noteSessionIsComplete
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_didFireCompletion)
  {
    obj->_didFireCompletion = 1;
    id errorHandlerBlock = obj->_errorHandlerBlock;
    obj->_id errorHandlerBlock = 0;

    [(BSInvalidatable *)obj->_connectionAssertion invalidate];
    connectionAssertion = obj->_connectionAssertion;
    obj->_connectionAssertion = 0;
  }
  objc_sync_exit(obj);
}

- (void)fireError:(id)a3
{
  id v6 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (!v4->_didFireCompletion)
  {
    id errorHandlerBlock = (void (**)(void))v4->_errorHandlerBlock;
    if (v6 && errorHandlerBlock)
    {
      errorHandlerBlock[2]();
      id errorHandlerBlock = (void (**)(void))v4->_errorHandlerBlock;
    }
    v4->_id errorHandlerBlock = 0;

    [(BSInvalidatable *)v4->_connectionAssertion invalidate];
    v4->_didFireCompletion = 1;
  }
  objc_sync_exit(v4);
}

- (void)invalidate
{
  objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(_PRUpdatingSession *)self fireError:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandlerBlock, 0);
  objc_storeStrong((id *)&self->_connectionAssertion, 0);
}

@end