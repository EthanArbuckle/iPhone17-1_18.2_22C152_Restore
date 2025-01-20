@interface SRUIFDataStore
- (SRUIFDataStore)init;
- (SRUIFDataStore)initWithEntries:(id)a3;
- (SRUIFDataStore)initWithPropertyListRepresentation:(id)a3;
- (id)imageDataForKey:(id)a3;
- (id)propertyListRepresentation;
- (void)setImageData:(id)a3 forKey:(id)a4;
@end

@implementation SRUIFDataStore

- (SRUIFDataStore)initWithEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFDataStore;
  v5 = [(SRUIFDataStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (SRUIFDataStore)init
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(SRUIFDataStore *)self initWithEntries:v3];

  return v4;
}

- (void)setImageData:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_SRUIFDataStoreEntry alloc] initWithType:1 value:v7];

  [(NSMutableDictionary *)self->_entries setObject:v8 forKey:v6];
}

- (id)imageDataForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_entries objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 type] == 1)
    {
      id v7 = [v6 value];
      goto LABEL_7;
    }
    v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SRUIFDataStore *)(uint64_t)v4 imageDataForKey:v6];
    }
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26D9B5F80 forKey:@"Version"];
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
  entries = self->_entries;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SRUIFDataStore_propertyListRepresentation__block_invoke;
  v8[3] = &unk_264785CE8;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v8];
  [v3 setObject:v6 forKey:@"Entries"];

  return v3;
}

void __44__SRUIFDataStore_propertyListRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 propertyListRepresentation];
  [v4 setObject:v6 forKey:v5];
}

- (SRUIFDataStore)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SRUIFDictionarySchema);
  id v6 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Version"];

  id v7 = +[SRUIFCoercion coercionWithBlock:&__block_literal_global_0];
  [(SRUIFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Entries"];

  id v16 = 0;
  v8 = [(SRUIFDictionarySchema *)v5 coerceObject:v4 error:&v16];
  id v9 = v16;
  if (!v8)
  {
    v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(SRUIFDataStore *)(uint64_t)v4 initWithPropertyListRepresentation:v14];
    }
    goto LABEL_8;
  }
  v10 = [v8 objectForKey:@"Version"];
  uint64_t v11 = [v10 integerValue];

  if (v11 != 1)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFDataStore initWithPropertyListRepresentation:]();
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v12 = [v8 objectForKey:@"Entries"];
  self = [(SRUIFDataStore *)self initWithEntries:v12];

  v13 = self;
LABEL_9:

  return v13;
}

id __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v20 = 0;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v5 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  id v6 = v21;
  id obj = v21[5];
  id v7 = [v5 coerceObject:v4 error:&obj];
  objc_storeStrong(v6 + 5, obj);

  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    id v9 = (void *)v15[5];
    v15[5] = v8;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke_30;
    v12[3] = &unk_264785D30;
    v12[4] = &v20;
    v12[5] = &v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
  }
  if (a3) {
    *a3 = v21[5];
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke_30(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v14 = 0;
  id v9 = [[_SRUIFDataStoreEntry alloc] initWithPropertyListRepresentation:v8 error:&v14];

  id v10 = v14;
  id v11 = v14;
  if (v9)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKey:v7];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
}

- (void).cxx_destruct
{
}

- (void)imageDataForKey:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 value];
  int v7 = 136315650;
  id v8 = "-[SRUIFDataStore imageDataForKey:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_225FBA000, v5, OS_LOG_TYPE_ERROR, "%s returning nil because value for key \"%@\" is %@, which cannot be coerced to an image", (uint8_t *)&v7, 0x20u);
}

- (void)initWithPropertyListRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[SRUIFDataStore initWithPropertyListRepresentation:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s returning nil; passed invalid property list (%@): %{public}@",
    (uint8_t *)&v3,
    0x20u);
}

- (void)initWithPropertyListRepresentation:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_225FBA000, v0, OS_LOG_TYPE_ERROR, "%s unable to deserialize property list with version %{public}ld; returning nil",
    (uint8_t *)v1,
    0x16u);
}

@end