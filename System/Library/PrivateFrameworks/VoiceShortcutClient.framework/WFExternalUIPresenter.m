@interface WFExternalUIPresenter
- (BOOL)connected;
- (WFExternalUIPresenter)initWithConnection:(id)a3;
- (WFExternalUIPresenterConnection)connection;
- (void)didFinishActionWithIdentifier:(id)a3;
- (void)didStartActionWithIdentifier:(id)a3;
- (void)performDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (void)setConnected:(BOOL)a3;
- (void)willBeginExecutingShortcutStep:(id)a3;
- (void)willBeginExecutingShortcutWithActionCount:(id)a3;
@end

@implementation WFExternalUIPresenter

- (void).cxx_destruct
{
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (WFExternalUIPresenterConnection)connection
{
  return self->_connection;
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFExternalUIPresenter *)self connection];
  id v6 = [v5 presenterWithErrorHandler:&__block_literal_global_75];

  [v6 didFinishActionWithIdentifier:v4];
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFExternalUIPresenter *)self connection];
  id v6 = [v5 presenterWithErrorHandler:&__block_literal_global_73];

  [v6 didStartActionWithIdentifier:v4];
}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFExternalUIPresenter *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WFExternalUIPresenter_performDialogRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E6079C90;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 presenterWithErrorHandler:v11];

  [v10 performDialogRequest:v7 completionHandler:v9];
}

void __64__WFExternalUIPresenter_performDialogRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = [[WFDialogResponse alloc] initWithResponseCode:1];
  (*(void (**)(uint64_t, WFDialogResponse *))(v1 + 16))(v1, v2);
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6078338;
  v17 = v18;
  id v8 = v7;
  id v16 = v8;
  id v9 = _Block_copy(aBlock);
  v10 = [(WFExternalUIPresenter *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6079C90;
  id v11 = v9;
  id v14 = v11;
  id v12 = [v10 presenterWithErrorHandler:v13];

  [v12 performSiriRequest:v6 completionHandler:v11];
  _Block_object_dispose(v18, 8);
}

uint64_t __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[WFSiriActionResponse alloc] initWithError:v3];

  (*(void (**)(uint64_t, WFSiriActionResponse *))(v2 + 16))(v2, v4);
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  id v4 = a3;
  v5 = [(WFExternalUIPresenter *)self connection];
  id v6 = [v5 presenterWithErrorHandler:&__block_literal_global_70];

  [v6 willBeginExecutingShortcutStep:v4];
}

- (void)willBeginExecutingShortcutWithActionCount:(id)a3
{
  id v4 = a3;
  v5 = [(WFExternalUIPresenter *)self connection];
  id v6 = [v5 presenterWithErrorHandler:&__block_literal_global_9815];

  [v6 willBeginExecutingShortcutWithActionCount:v4];
}

- (WFExternalUIPresenter)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFExternalUIPresenter;
  id v6 = [(WFExternalUIPresenter *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    id v8 = v7;
  }

  return v7;
}

@end