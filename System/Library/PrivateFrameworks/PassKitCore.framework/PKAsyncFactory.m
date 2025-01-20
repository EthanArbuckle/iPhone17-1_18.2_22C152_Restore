@interface PKAsyncFactory
+ (id)createObjectWithOperation:(id)a3 completion:(id)a4;
@end

@implementation PKAsyncFactory

+ (id)createObjectWithOperation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke;
      v14[3] = &unk_1E56DF2A0;
      id v15 = v5;
      [(PKAsyncUnaryOperationComposer *)v8 addOperation:v14];
      v9 = objc_alloc_init(PKAsyncFactoryOperationContainer);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_3;
      v12[3] = &unk_1E56DF2C8;
      id v13 = v7;
      v10 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v9 completion:v12];

      goto LABEL_6;
    }
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
  v10 = 0;
LABEL_6:

  return v10;
}

void __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_2;
  v13[3] = &unk_1E56DF278;
  id v14 = v7;
  id v15 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, void *))(v9 + 16);
  id v11 = v8;
  id v12 = v7;
  v10(v9, a2, v13);
}

uint64_t __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __55__PKAsyncFactory_createObjectWithOperation_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = [a3 object];
  (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a2, v8, v7);
}

@end