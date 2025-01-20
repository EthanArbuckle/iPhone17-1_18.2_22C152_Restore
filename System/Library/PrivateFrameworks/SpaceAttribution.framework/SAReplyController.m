@interface SAReplyController
- (NSUUID)controllerID;
- (id)appSizerUpdateHandler;
- (id)urlSizerUpdateHandler;
- (void)callAppSizerHandlerWithError:(id)a3;
- (void)callAppSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultBlock:(id)a5;
- (void)callURLSizerHandlerWithError:(id)a3;
- (void)callURLSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultsBlock:(id)a5;
- (void)setAppSizerUpdateHandler:(id)a3;
- (void)setControllerID:(id)a3;
- (void)setUrlSizerUpdateHandler:(id)a3;
@end

@implementation SAReplyController

- (NSUUID)controllerID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_controllerID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setControllerID:(id)a3
{
  v4 = (NSUUID *)a3;
  obj = self;
  objc_sync_enter(obj);
  controllerID = obj->_controllerID;
  obj->_controllerID = v4;

  objc_sync_exit(obj);
}

- (void)callAppSizerHandlerWithError:(id)a3
{
  id v6 = a3;
  v4 = [(SAReplyController *)self appSizerUpdateHandler];

  if (v4)
  {
    v5 = [(SAReplyController *)self appSizerUpdateHandler];
    ((void (**)(void, void, id))v5)[2](v5, 0, v6);
  }
}

- (void)callURLSizerHandlerWithError:(id)a3
{
  id v6 = a3;
  v4 = [(SAReplyController *)self urlSizerUpdateHandler];

  if (v4)
  {
    v5 = [(SAReplyController *)self urlSizerUpdateHandler];
    ((void (**)(void, void, id))v5)[2](v5, 0, v6);
  }
}

- (void)callAppSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultBlock:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = [(SAReplyController *)self appSizerUpdateHandler];

  if (v10)
  {
    v11 = [(SAReplyController *)self appSizerUpdateHandler];
    uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v13, v8);

    v9[2](v9, v12);
    if (v12)
    {
      [(SAReplyController *)self setAppSizerUpdateHandler:0];
      [(SAReplyController *)self setControllerID:0];
    }
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)callURLSizerHandlerWithResults:(id)a3 error:(id)a4 withHandlerResultsBlock:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = [(SAReplyController *)self urlSizerUpdateHandler];

  if (v10)
  {
    v11 = [(SAReplyController *)self urlSizerUpdateHandler];
    uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v13, v8);

    v9[2](v9, v12);
    if (v12) {
      [(SAReplyController *)self setUrlSizerUpdateHandler:0];
    }
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (id)appSizerUpdateHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAppSizerUpdateHandler:(id)a3
{
}

- (id)urlSizerUpdateHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUrlSizerUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlSizerUpdateHandler, 0);
  objc_storeStrong(&self->_appSizerUpdateHandler, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
}

@end