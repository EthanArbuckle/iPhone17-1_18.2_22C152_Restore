@interface SBSSystemApertureStateDumpService
- (void)requestSystemApertureStateDumpWithCompletion:(id)a3;
- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3;
@end

@implementation SBSSystemApertureStateDumpService

- (void)requestSystemApertureStateDumpWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SBSAbstractSystemService *)self client];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E566B6F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 requestSystemApertureStateDumpWithCompletion:v7];
}

void __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    v7 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke_2;
    block[3] = &unk_1E566B6C8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSAbstractSystemService *)self client];
  [v5 writeSystemApertureStateDumpToTextFileAtPath:v4];
}

@end