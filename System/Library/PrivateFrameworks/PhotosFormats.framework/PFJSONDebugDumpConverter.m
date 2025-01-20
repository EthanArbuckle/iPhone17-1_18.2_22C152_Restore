@interface PFJSONDebugDumpConverter
- (BOOL)enablePretty;
- (PFJSONDebugDumpConverter)initWithUnknownTypeHandler:(id)a3;
- (id)JSONCompatibleObjectForObject:(id)a3;
- (id)JSONForObject:(id)a3 error:(id *)a4;
- (id)unknownObjectTypePlaceholderForObject:(id)a3;
- (id)unknownTypeHandler;
- (void)setEnablePretty:(BOOL)a3;
- (void)setUnknownTypeHandler:(id)a3;
@end

@implementation PFJSONDebugDumpConverter

- (void).cxx_destruct
{
}

- (void)setUnknownTypeHandler:(id)a3
{
}

- (id)unknownTypeHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEnablePretty:(BOOL)a3
{
  self->_enablePretty = a3;
}

- (BOOL)enablePretty
{
  return self->_enablePretty;
}

- (id)unknownObjectTypePlaceholderForObject:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"UnknownObjectDescription";
  id v3 = a3;
  v4 = [v3 description];
  v9[1] = @"ClassName";
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();

  v6 = NSStringFromClass(v5);
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)JSONCompatibleObjectForObject:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (__CFString *)v4;
LABEL_3:
    v6 = v5;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [(PFJSONDebugDumpConverter *)self JSONCompatibleObjectForObject:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          [(__CFString *)v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v9);
    }
LABEL_12:

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__PFJSONDebugDumpConverter_JSONCompatibleObjectForObject___block_invoke;
    v24[3] = &unk_1E5B2D320;
    id v14 = v13;
    id v25 = v14;
    v26 = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v24];
    v6 = (__CFString *)v14;

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31[0] = @"NSDataLength";
    v15 = NSNumber;
    id v16 = v4;
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v31[1] = @"NSData";
    v32[0] = v17;
    v18 = [v16 base64EncodedStringWithOptions:0];

    v32[1] = v18;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v4)
      {
        v5 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_3;
      }
      unknownTypeHandler = (void (**)(id, id))self->_unknownTypeHandler;
      if (!unknownTypeHandler
        || (unknownTypeHandler[2](unknownTypeHandler, v4), (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v5 = [(PFJSONDebugDumpConverter *)self unknownObjectTypePlaceholderForObject:v4];
        goto LABEL_3;
      }
      id v7 = (id)v21;
      v6 = [(PFJSONDebugDumpConverter *)self JSONCompatibleObjectForObject:v21];
      goto LABEL_12;
    }
    id v17 = v4;
    if (strcmp((const char *)[v17 objCType], "d")) {
      goto LABEL_19;
    }
    [v17 doubleValue];
    int v23 = __fpclassifyd(v22);
    if (v23 == 2)
    {
      v6 = @"(Unable to JSON-serialize FP_INFINITE float)";
      goto LABEL_20;
    }
    if (v23 == 1) {
      v6 = @"(Unable to JSON-serialize FP_NAN float)";
    }
    else {
LABEL_19:
    }
      v6 = (__CFString *)v17;
  }
LABEL_20:

LABEL_21:

  return v6;
}

void __58__PFJSONDebugDumpConverter_JSONCompatibleObjectForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 JSONCompatibleObjectForObject:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)JSONForObject:(id)a3 error:(id *)a4
{
  id v6 = [(PFJSONDebugDumpConverter *)self JSONCompatibleObjectForObject:a3];
  if (v6
    && ([MEMORY[0x1E4F1CA98] null],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqual:v7],
        v7,
        (v8 & 1) == 0))
  {
    if ([(PFJSONDebugDumpConverter *)self enablePretty]) {
      uint64_t v10 = 9;
    }
    else {
      uint64_t v10 = 8;
    }
    uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:v10 error:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (PFJSONDebugDumpConverter)initWithUnknownTypeHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFJSONDebugDumpConverter;
  v5 = [(PFJSONDebugDumpConverter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1A6259AE0](v4);
    id unknownTypeHandler = v5->_unknownTypeHandler;
    v5->_id unknownTypeHandler = (id)v6;

    v5->_enablePretty = 1;
  }

  return v5;
}

@end