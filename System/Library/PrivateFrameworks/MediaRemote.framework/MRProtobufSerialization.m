@interface MRProtobufSerialization
- (Class)protobufClass;
- (NSDictionary)dictionaryKeyToProtobufKeyMapping;
- (id)createDictionaryFromProtobuf:(id)a3;
- (id)createProtobufFromDictionary:(id)a3;
- (id)dictionaryValueToProtobufPostTransformer;
- (id)dictionaryValueToProtobufValueTransformer;
- (id)protobufValueToDictionaryPostTransformer;
- (id)protobufValueToDictionaryValueTransformer;
- (void)setDictionaryKeyToProtobufKeyMapping:(id)a3;
- (void)setDictionaryValueToProtobufPostTransformer:(id)a3;
- (void)setDictionaryValueToProtobufValueTransformer:(id)a3;
- (void)setProtobufClass:(Class)a3;
- (void)setProtobufValueToDictionaryPostTransformer:(id)a3;
- (void)setProtobufValueToDictionaryValueTransformer:(id)a3;
@end

@implementation MRProtobufSerialization

- (void)setDictionaryKeyToProtobufKeyMapping:(id)a3
{
  if (self->_dictionaryKeyToProtobufKeyMapping != a3)
  {
    v4 = (NSDictionary *)[a3 copy];
    dictionaryKeyToProtobufKeyMapping = self->_dictionaryKeyToProtobufKeyMapping;
    self->_dictionaryKeyToProtobufKeyMapping = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count"));
    v7 = self->_dictionaryKeyToProtobufKeyMapping;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__MRProtobufSerialization_setDictionaryKeyToProtobufKeyMapping___block_invoke;
    v11[3] = &unk_1E57D2B80;
    v8 = v6;
    v12 = v8;
    [(NSDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v11];
    protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
    self->_protobufKeyToDictionaryKeyMapping = v8;
    v10 = v8;
  }
}

uint64_t __64__MRProtobufSerialization_setDictionaryKeyToProtobufKeyMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (id)createDictionaryFromProtobuf:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count"));
  protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__MRProtobufSerialization_createDictionaryFromProtobuf___block_invoke;
  v13[3] = &unk_1E57D2BA8;
  id v7 = v4;
  id v14 = v7;
  v15 = self;
  id v8 = v5;
  id v16 = v8;
  [(NSDictionary *)protobufKeyToDictionaryKeyMapping enumerateKeysAndObjectsUsingBlock:v13];
  protobufValueToDictionaryPostTransformer = (void (**)(id, id, id))self->_protobufValueToDictionaryPostTransformer;
  if (protobufValueToDictionaryPostTransformer) {
    protobufValueToDictionaryPostTransformer[2](protobufValueToDictionaryPostTransformer, v7, v8);
  }
  v10 = v16;
  id v11 = v8;

  return v11;
}

void __56__MRProtobufSerialization_createDictionaryFromProtobuf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "mr_valueForPotentiallyUndefinedKey:", v10);
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
    if (!v8
      || ((*(void (**)(uint64_t, void, id, void *))(v8 + 16))(v8, *(void *)(a1 + 32), v10, v7),
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v7,
          (id v7 = (void *)v9) != 0))
    {
      [*(id *)(a1 + 48) setObject:v7 forKey:v5];
    }
  }
}

- (id)createProtobufFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__MRProtobufSerialization_createProtobufFromDictionary___block_invoke;
  v12[3] = &unk_1E57D2BD0;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  dictionaryValueToProtobufPostTransformer = (void (**)(id, id, id))self->_dictionaryValueToProtobufPostTransformer;
  if (dictionaryValueToProtobufPostTransformer) {
    dictionaryValueToProtobufPostTransformer[2](dictionaryValueToProtobufPostTransformer, v6, v7);
  }
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __56__MRProtobufSerialization_createProtobufFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v10];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v8 = v7;
    if (v9)
    {
      uint64_t v8 = (*(void (**)(uint64_t, void, id, id))(v9 + 16))(v9, *(void *)(a1 + 40), v10, v7);
    }
    [*(id *)(a1 + 48) setValue:v8 forKey:v6];
  }
}

- (NSDictionary)dictionaryKeyToProtobufKeyMapping
{
  return self->_dictionaryKeyToProtobufKeyMapping;
}

- (Class)protobufClass
{
  return self->_protobufClass;
}

- (void)setProtobufClass:(Class)a3
{
}

- (id)dictionaryValueToProtobufValueTransformer
{
  return self->_dictionaryValueToProtobufValueTransformer;
}

- (void)setDictionaryValueToProtobufValueTransformer:(id)a3
{
}

- (id)protobufValueToDictionaryValueTransformer
{
  return self->_protobufValueToDictionaryValueTransformer;
}

- (void)setProtobufValueToDictionaryValueTransformer:(id)a3
{
}

- (id)dictionaryValueToProtobufPostTransformer
{
  return self->_dictionaryValueToProtobufPostTransformer;
}

- (void)setDictionaryValueToProtobufPostTransformer:(id)a3
{
}

- (id)protobufValueToDictionaryPostTransformer
{
  return self->_protobufValueToDictionaryPostTransformer;
}

- (void)setProtobufValueToDictionaryPostTransformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_protobufValueToDictionaryPostTransformer, 0);
  objc_storeStrong(&self->_dictionaryValueToProtobufPostTransformer, 0);
  objc_storeStrong(&self->_protobufValueToDictionaryValueTransformer, 0);
  objc_storeStrong(&self->_dictionaryValueToProtobufValueTransformer, 0);
  objc_storeStrong((id *)&self->_protobufClass, 0);
  objc_storeStrong((id *)&self->_dictionaryKeyToProtobufKeyMapping, 0);

  objc_storeStrong((id *)&self->_protobufKeyToDictionaryKeyMapping, 0);
}

@end