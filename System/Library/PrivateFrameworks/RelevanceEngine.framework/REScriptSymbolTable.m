@interface REScriptSymbolTable
- (BOOL)define:(id)a3 type:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (BOOL)setNodeValue:(id)a3 forDefinition:(id)a4 error:(id *)a5;
- (BOOL)setObjectValue:(id)a3 forDefinition:(id)a4 error:(id *)a5;
- (BOOL)typeForDefinition:(id)a3 type:(unint64_t *)a4;
- (REScriptSymbolTable)initWithParentScope:(id)a3;
- (id)nodeValueForDefinition:(id)a3;
- (id)objectValueForDefinition:(id)a3;
- (void)_enumerateObjectsOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateFeatures:(id)a3;
- (void)enumerateRules:(id)a3;
@end

@implementation REScriptSymbolTable

- (REScriptSymbolTable)initWithParentScope:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REScriptSymbolTable;
  v5 = [(REScriptSymbolTable *)&v18 init];
  if (v5)
  {
    id v6 = v4;
    id v4 = v6;
    if (v6)
    {
      p_isa = (id *)v6;
      while (p_isa != (id *)v5)
      {
        v14 = (REScriptSymbolTable *)p_isa[1];

        p_isa = (id *)&v14->super.isa;
        if (!v14) {
          goto LABEL_9;
        }
      }
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Table cannot be it's own parent", v7, v8, v9, v10, v11, v12, (uint64_t)v18.receiver);

      id v4 = 0;
      v14 = v5;
    }
    else
    {
      v14 = 0;
    }
LABEL_9:
    objc_storeStrong((id *)&v5->_parentTable, v4);
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    definitions = v5->_definitions;
    v5->_definitions = (NSMutableDictionary *)v15;
  }
  return v5;
}

- (BOOL)define:(id)a3 type:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (id)MEMORY[0x263EFFA78];
  if (a5) {
    id v11 = a5;
  }
  id v12 = v11;
  v13 = [v10 value];
  v14 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v13];
  uint64_t v15 = v14;
  if (v14)
  {
    if (a6)
    {
      v16 = NSString;
      v17 = [(_RESymbolDefinition *)v14 name];
      objc_super v18 = [v16 stringWithFormat:@"Symbol \"%@\" already defined.", v17];

      v23 = @"REErrorTokenKey";
      v19 = [(_RESymbolDefinition *)v15 token];
      v24[0] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      RECreateErrorWithCodeMessageAndUseInfo(206, v18, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v15;
  }
  else
  {
    v21 = [[_RESymbolDefinition alloc] initWithToken:v10 type:a4 options:v12];
    [(NSMutableDictionary *)self->_definitions setObject:v21 forKeyedSubscript:v13];
  }

  return v15 == 0;
}

- (BOOL)setNodeValue:(id)a3 forDefinition:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 value];

    if (!v12)
    {
      [v11 setValue:v8];
      LOBYTE(a5) = 1;
      goto LABEL_9;
    }
    if (a5)
    {
      v17 = @"REErrorTokenKey";
      v13 = [v11 value];
      v14 = [v13 token];
      v18[0] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      RECreateErrorWithCodeAndUseInfo(208, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    v13 = [NSString stringWithFormat:@"Symbol \"%@\" not defined.", v9];
    RECreateErrorWithCodeAndMessage(207, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

  return (char)a5;
}

- (BOOL)setObjectValue:(id)a3 forDefinition:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 objectValue];

    if (!v12)
    {
      [v11 setObjectValue:v8];
      LOBYTE(a5) = 1;
      goto LABEL_9;
    }
    if (a5)
    {
      v17 = @"REErrorTokenKey";
      v13 = [v11 value];
      v14 = [v13 token];
      v18[0] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      RECreateErrorWithCodeAndUseInfo(208, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    v13 = [NSString stringWithFormat:@"Symbol \"%@\" not defined.", v9];
    RECreateErrorWithCodeAndMessage(207, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

  return (char)a5;
}

- (BOOL)typeForDefinition:(id)a3 type:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    if (a4) {
      *a4 = [v7 type];
    }
    char v9 = 1;
  }
  else
  {
    parentTable = self->_parentTable;
    if (parentTable) {
      char v9 = [(REScriptSymbolTable *)parentTable typeForDefinition:v6 type:a4];
    }
    else {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)objectValueForDefinition:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectValue];
LABEL_5:
    char v9 = (void *)v7;
    goto LABEL_6;
  }
  parentTable = self->_parentTable;
  if (parentTable)
  {
    uint64_t v7 = [(REScriptSymbolTable *)parentTable objectValueForDefinition:v4];
    goto LABEL_5;
  }
  char v9 = 0;
LABEL_6:

  return v9;
}

- (id)nodeValueForDefinition:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_definitions objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 value];
LABEL_5:
    char v9 = (void *)v7;
    goto LABEL_6;
  }
  parentTable = self->_parentTable;
  if (parentTable)
  {
    uint64_t v7 = [(REScriptSymbolTable *)parentTable nodeValueForDefinition:v4];
    goto LABEL_5;
  }
  char v9 = 0;
LABEL_6:

  return v9;
}

- (void)_enumerateObjectsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *, void *, void *))a4;
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(REDependencyGraph);
    definitions = self->_definitions;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke;
    v28[3] = &unk_2644BE530;
    char v9 = v7;
    v29 = v9;
    [(NSMutableDictionary *)definitions enumerateKeysAndObjectsUsingBlock:v28];
    id v10 = self->_definitions;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke_2;
    v26[3] = &unk_2644BE558;
    v26[4] = self;
    id v11 = v9;
    v27 = v11;
    [(NSMutableDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v26];
    v21 = v11;
    id v12 = [(REDependencyGraph *)v11 topologicalSortedItems];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v17 type] == a3)
          {
            objc_super v18 = [v17 name];
            v19 = [v17 options];
            v20 = [v17 value];
            v6[2](v6, v18, v19, v20);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
    }
  }
}

uint64_t __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addItem:");
}

void __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v6, "value", 0);
  id v8 = [v7 dependencies];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([v5 isEqualToString:v13] & 1) == 0)
        {
          uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v13];
          if (v14) {
            [*(id *)(a1 + 40) markItem:v6 dependentOnItem:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)enumerateFeatures:(id)a3
{
}

- (void)enumerateRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_parentTable, 0);
}

@end