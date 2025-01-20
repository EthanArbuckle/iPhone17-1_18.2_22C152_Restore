@interface LWCRExecutor
+ (id)executor;
- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4;
@end

@implementation LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
  id v27 = 0;
  id v28 = 0;
  id v29 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v24[3] = &unk_264854028;
  id v25 = v6;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v22[3] = &unk_264854050;
  id v23 = v25;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4;
  v20[3] = &unk_264854078;
  id v7 = v23;
  id v21 = v7;
  v26 = &unk_26DD32F38;
  id v27 = (id)MEMORY[0x22A6A8FA0](v24);
  id v28 = (id)MEMORY[0x22A6A8FA0](v22);
  id v29 = (id)MEMORY[0x22A6A8FA0](v20);
  v19[0] = &v26;
  v19[1] = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v8 = *(_OWORD *)(v5 + 72);
  long long v30 = *(_OWORD *)(v5 + 56);
  long long v31 = v8;
  long long v32 = *(_OWORD *)(v5 + 88);
  uint64_t v33 = *((void *)v5 + 13);
  if (der_vm_context_is_valid()) {
    v9 = (CEQueryContext *)(v5 + 56);
  }
  else {
    v9 = 0;
  }
  TLE::Executor::getOperationsFromCE((TLE::Executor *)v19, v9, (uint64_t)&v17);
  if (v17)
  {
    BOOL v10 = 0;
    v11 = (void *)*((void *)&v18 + 1);
    if (!*((void *)&v18 + 1)) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    (*(void (**)(long long *__return_ptr))(**((void **)&v18 + 1) + 16))(&v30);
    if (v30) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = BYTE8(v31) == 0;
    }
    BOOL v10 = !v12;
    v11 = (void *)*((void *)&v18 + 1);
    if (!*((void *)&v18 + 1)) {
      goto LABEL_17;
    }
  }
  uint64_t v13 = v11[1];
  if (v13 <= 0)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "Over-release of an object";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  uint64_t v14 = v13 - 1;
  v11[1] = v14;
  if (!v14) {
    (*(void (**)(void *))(*v11 + 8))(v11);
  }
LABEL_17:

  return v10;
}

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  id v7 = [v5 valueForKey:v6];

  if (v7)
  {
    *(_OWORD *)a4 = *(_OWORD *)(v7 + 8);
    *(void *)(a4 + 16) = *((void *)v7 + 3);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
}

void __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v5 = *(void **)(a1 + 32);
  id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  long long v8 = [v5 valueForKey:v6];

  if (v8)
  {
    long long v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)a4 = *(_OWORD *)(v8 + 8);
    *(_OWORD *)(a4 + 16) = v7;
    *(void *)(a4 + 32) = *((void *)v8 + 5);
  }
  else
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
}

BOOL __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  v5 = [v3 valueForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

uint64_t __47__LWCRExecutor_evaluateRequirements_withFacts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 bindName:a2];
}

+ (id)executor
{
  v2 = objc_alloc_init(LWCRExecutor);

  return v2;
}

@end