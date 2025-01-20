@interface IPAAutoRegistry
+ (id)sharedRegistry;
+ (void)setSharedRegistry:(id)a3;
- (BOOL)hasMappingForAutoIdentifier:(id)a3 operationIdentifier:(id)a4;
- (BOOL)isPersistableAutoIdentifier:(id)a3 forOperationIdentifier:(id)a4;
- (Class)settingsClassForAutoIdentifier:(id)a3 operationIdentifier:(id)a4;
- (IPAAutoRegistry)init;
- (id)_entryForAutoIdentifier:(id)a3 operationIdentifier:(id)a4;
- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5;
- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5 persistable:(BOOL)a6;
@end

@implementation IPAAutoRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

- (BOOL)isPersistableAutoIdentifier:(id)a3 forOperationIdentifier:(id)a4
{
  v4 = [(IPAAutoRegistry *)self _entryForAutoIdentifier:a3 operationIdentifier:a4];
  char v5 = [v4 persistable];

  return v5;
}

- (Class)settingsClassForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  v4 = [(IPAAutoRegistry *)self _entryForAutoIdentifier:a3 operationIdentifier:a4];
  char v5 = [v4 autoSettingsClass];

  return (Class)v5;
}

- (BOOL)hasMappingForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  v4 = [(IPAAutoRegistry *)self _entryForAutoIdentifier:a3 operationIdentifier:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_entryForAutoIdentifier:(id)a3 operationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2208;
  v21 = __Block_byref_object_dispose__2209;
  id v22 = 0;
  if (v6 && v7)
  {
    v9 = [NSString stringWithFormat:@"%@-%@", v7, v6];
    serializer = self->_serializer;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__IPAAutoRegistry__entryForAutoIdentifier_operationIdentifier___block_invoke;
    block[3] = &unk_1E6CC2168;
    id v15 = v9;
    v16 = &v17;
    block[4] = self;
    id v11 = v9;
    dispatch_sync(serializer, block);
  }
  else
  {
    _PFAssertContinueHandler();
  }
  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __63__IPAAutoRegistry__entryForAutoIdentifier_operationIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5 persistable:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  if (!a3)
  {
    _PFAssertFailHandler();
    goto LABEL_6;
  }
  if (!v10)
  {
LABEL_6:
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  id v12 = v11;
  if (v11)
  {
    v13 = [NSString stringWithFormat:@"%@-%@", v11, v10];
    serializer = self->_serializer;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__IPAAutoRegistry_registerAutoCalculatorSettingsClass_toAutoIdentifier_operationIdentifier_persistable___block_invoke;
    block[3] = &unk_1E6CC2140;
    id v18 = v13;
    Class v19 = a3;
    BOOL v20 = a6;
    block[4] = self;
    id v15 = v13;
    dispatch_sync(serializer, block);

    return;
  }
LABEL_7:
  uint64_t v16 = _PFAssertFailHandler();
  __104__IPAAutoRegistry_registerAutoCalculatorSettingsClass_toAutoIdentifier_operationIdentifier_persistable___block_invoke(v16);
}

void __104__IPAAutoRegistry_registerAutoCalculatorSettingsClass_toAutoIdentifier_operationIdentifier_persistable___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_opt_new();
  [v2 setAutoSettingsClass:*(void *)(a1 + 48)];
  [v2 setPersistable:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)registerAutoCalculatorSettingsClass:(Class)a3 toAutoIdentifier:(id)a4 operationIdentifier:(id)a5
{
}

- (IPAAutoRegistry)init
{
  v9.receiver = self;
  v9.super_class = (Class)IPAAutoRegistry;
  id v2 = [(IPAAutoRegistry *)&v9 init];
  if (v2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"IPAAutoRegistry.%p._serializer", v2);
    id v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    serializer = v2->_serializer;
    v2->_serializer = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v6;
  }
  return v2;
}

+ (id)sharedRegistry
{
  return (id)s_instance;
}

+ (void)setSharedRegistry:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    s_instance = (uint64_t)v3;
    MEMORY[0x1F41817F8]();
  }
  else
  {
    dispatch_queue_t v4 = (IPAAdjustmentEnvelope *)_PFAssertFailHandler();
    [(IPAAdjustmentEnvelope *)v4 .cxx_destruct];
  }
}

@end