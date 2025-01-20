@interface SBSStateDumpService
- (void)disableRemoteStateDumpWithCompletion:(id)a3;
- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4;
- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4;
- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4;
@end

@implementation SBSStateDumpService

- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = [(SBSAbstractSystemService *)self client];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke;
  v9[3] = &unk_1E566CA88;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requestStateDump:a3 withCompletion:v9];
}

void __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 40))
  {
    v9 = [*(id *)(a1 + 32) callbackQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke_2;
    v10[3] = &unk_1E566CA60;
    id v13 = *(id *)(a1 + 40);
    char v14 = a2;
    id v11 = v7;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
}

uint64_t __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSAbstractSystemService *)self client];
  [v7 writeStateDump:a3 toTextFileAtPath:v6];
}

- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSAbstractSystemService *)self client];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke;
  v9[3] = &unk_1E566CAD8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enableRemoteStateDumpWithTimeout:a3 completion:v9];
}

void __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke_2;
    block[3] = &unk_1E566CAB0;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)disableRemoteStateDumpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSAbstractSystemService *)self client];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E566CAD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 disableRemoteStateDumpWithCompletion:v7];
}

void __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke_2;
    block[3] = &unk_1E566CAB0;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end