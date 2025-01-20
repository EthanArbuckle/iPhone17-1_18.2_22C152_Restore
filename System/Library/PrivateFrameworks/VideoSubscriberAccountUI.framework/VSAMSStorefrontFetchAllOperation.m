@interface VSAMSStorefrontFetchAllOperation
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setResult:(id)a3;
@end

@implementation VSAMSStorefrontFetchAllOperation

- (void)executionDidBegin
{
  v3 = objc_msgSend(MEMORY[0x263F27B28], "vs_defaultBag");
  id v4 = objc_alloc(MEMORY[0x263F27E68]);
  v5 = (void *)[v4 initWithMediaType:2 clientIdentifier:*MEMORY[0x263F1E338] bag:v3];
  v6 = [v5 performTask];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke;
  v11[3] = &unk_265076C58;
  objc_copyWeak(&v12, &location);
  [v6 addErrorBlock:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_2;
  v9[3] = &unk_265077168;
  objc_copyWeak(&v10, &location);
  [v6 addSuccessBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_5;
  v7[3] = &unk_265077190;
  objc_copyWeak(&v8, &location);
  [v6 addFinishBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x263F1E250];
    v5 = [MEMORY[0x263F1E208] failableWithError:v7];
    v6 = [v4 optionalWithObject:v5];
    [WeakRetained setResult:v6];
  }
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSAllStorefrontsResponseValueTransformer"];
    v6 = [v5 transformedValue:v3];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_3;
    v8[3] = &unk_265077020;
    v8[4] = WeakRetained;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_4;
    v7[3] = &unk_265076EB8;
    void v7[4] = WeakRetained;
    [v6 unwrapObject:v8 error:v7];
  }
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F1E250];
  id v5 = [MEMORY[0x263F1E208] failableWithObject:a2];
  id v4 = [v3 optionalWithObject:v5];
  [v2 setResult:v4];
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F1E250];
  id v5 = [MEMORY[0x263F1E208] failableWithError:a2];
  id v4 = [v3 optionalWithObject:v5];
  [v2 setResult:v4];
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "storefronts task finished with error %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishExecutionIfPossible];
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end