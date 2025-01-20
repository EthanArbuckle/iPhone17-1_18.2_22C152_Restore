@interface PASKVOHandler
@end

@implementation PASKVOHandler

void __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke_2;
  block[3] = &unk_1E5AEAFE8;
  v13 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v23 = v12;
  id v24 = v14;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v13, block);
}

void __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A62450A0]();
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

@end