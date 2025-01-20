@interface REScriptProcessor
+ (id)_sharedSystemTable;
+ (id)processorWithPath:(id)a3;
+ (id)processorWithSource:(id)a3;
- (REScriptProcessor)initWithScriptBuffer:(id)a3 path:(id)a4;
- (id)features;
- (id)featuresWithNames:(id)a3;
- (id)rules;
- (id)rulesWithNames:(id)a3;
- (void)_encounteredError:(id)a3;
- (void)_process;
- (void)parser:(id)a3 didEncouterParserError:(id)a4;
- (void)tokenizer:(id)a3 didEncouterTokenError:(id)a4;
@end

@implementation REScriptProcessor

+ (id)processorWithSource:(id)a3
{
  id v4 = a3;
  v5 = [[REStringScriptBuffer alloc] initWithString:v4];

  v6 = (void *)[objc_alloc((Class)a1) initWithScriptBuffer:v5 path:0];
  return v6;
}

+ (id)processorWithPath:(id)a3
{
  id v4 = [a3 stringByExpandingTildeInPath];
  v5 = [v4 stringByStandardizingPath];

  os_unfair_lock_lock((os_unfair_lock_t)&REScriptProcessorLock);
  if (REScriptProcessorCache_onceToken != -1) {
    dispatch_once(&REScriptProcessorCache_onceToken, &__block_literal_global_143);
  }
  v6 = [(id)REScriptProcessorCache_Cache objectForKeyedSubscript:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&REScriptProcessorLock);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v19 = 0;
    v8 = [NSString stringWithContentsOfFile:v5 encoding:4 error:&v19];
    id v15 = v19;
    if (v8)
    {
      v16 = [[REStringScriptBuffer alloc] initWithString:v8];
      v17 = (void *)[objc_alloc((Class)a1) initWithScriptBuffer:v16 path:v5];
      os_unfair_lock_lock((os_unfair_lock_t)&REScriptProcessorLock);
      if (REScriptProcessorCache_onceToken != -1) {
        dispatch_once(&REScriptProcessorCache_onceToken, &__block_literal_global_143);
      }
      [(id)REScriptProcessorCache_Cache setObject:v17 forKeyedSubscript:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)&REScriptProcessorLock);
      id v7 = v17;
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Unable to load script at path: %@ Error: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      id v7 = 0;
    }
  }
  return v7;
}

- (REScriptProcessor)initWithScriptBuffer:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)REScriptProcessor;
  uint64_t v9 = [(REScriptProcessor *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a4);
    objc_storeStrong((id *)&v10->_buffer, a3);
    uint64_t v11 = [[REScriptTokenizer alloc] initWithScriptBuffer:v7];
    tokenizer = v10->_tokenizer;
    v10->_tokenizer = v11;

    [(REScriptTokenizer *)v10->_tokenizer setDelegate:v10];
    uint64_t v13 = [[REStandardizedTokenBuffer alloc] initWithTokenBuffer:v10->_tokenizer];
    uint64_t v14 = [[RETokenStack alloc] initWithTokenBuffer:v13];
    tokenStack = v10->_tokenStack;
    v10->_tokenStack = (REBacktrackingTokenBuffer *)v14;

    v16 = [[REScriptParser alloc] initWithBacktrackingBuffer:v10->_tokenStack];
    parser = v10->_parser;
    v10->_parser = v16;

    [(REScriptParser *)v10->_parser setDelegate:v10];
    [(REScriptProcessor *)v10 _process];
  }
  return v10;
}

- (id)rulesWithNames:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)featuresWithNames:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  table = self->_table;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__REScriptProcessor_featuresWithNames___block_invoke;
  v11[3] = &unk_2644BFD30;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [(REScriptSymbolTable *)table enumerateFeatures:v11];
  uint64_t v9 = (void *)[v7 copy];

  return v9;
}

void __39__REScriptProcessor_featuresWithNames___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void **)(a1 + 32);
  if (!v9 || [v9 containsObject:v11])
  {
    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 48) objectValueForDefinition:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 48) addObject:v10];
    }
  }
}

- (id)rules
{
  return [(REScriptProcessor *)self rulesWithNames:0];
}

- (id)features
{
  return [(REScriptProcessor *)self featuresWithNames:0];
}

+ (id)_sharedSystemTable
{
  if (_sharedSystemTable_onceToken != -1) {
    dispatch_once(&_sharedSystemTable_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)_sharedSystemTable_Table;
  return v2;
}

void __39__REScriptProcessor__sharedSystemTable__block_invoke()
{
  v50[1] = *MEMORY[0x263EF8340];
  v0 = [[REScriptSymbolTable alloc] initWithParentScope:0];
  v1 = (void *)_sharedSystemTable_Table;
  _sharedSystemTable_Table = (uint64_t)v0;

  id v2 = (id)_sharedSystemTable_Table;
  v3 = [[REScriptToken alloc] initWithValue:@"float" type:6 line:-1 column:-1];
  v50[0] = @"REScriptSymbolValueTypeKey";
  id v4 = [NSNumber numberWithUnsignedInteger:2];
  *(void *)dst = v4;
  v5 = [NSDictionary dictionaryWithObjects:dst forKeys:v50 count:1];
  [v2 define:v3 type:2 options:v5 error:0];

  id v6 = (id)_sharedSystemTable_Table;
  id v7 = [[REScriptToken alloc] initWithValue:@"int" type:6 line:-1 column:-1];
  v50[0] = @"REScriptSymbolValueTypeKey";
  id v8 = [NSNumber numberWithUnsignedInteger:1];
  *(void *)dst = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:dst forKeys:v50 count:1];
  [v6 define:v7 type:2 options:v9 error:0];

  id v10 = (id)_sharedSystemTable_Table;
  id v11 = [[REScriptToken alloc] initWithValue:@"string" type:6 line:-1 column:-1];
  v50[0] = @"REScriptSymbolValueTypeKey";
  id v12 = [NSNumber numberWithUnsignedInteger:3];
  *(void *)dst = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:dst forKeys:v50 count:1];
  [v10 define:v11 type:2 options:v13 error:0];

  id v14 = (id)_sharedSystemTable_Table;
  id v15 = [[REScriptToken alloc] initWithValue:@"BOOL" type:6 line:-1 column:-1];
  v50[0] = @"REScriptSymbolValueTypeKey";
  v16 = [NSNumber numberWithUnsignedInteger:0];
  *(void *)dst = v16;
  v17 = [NSDictionary dictionaryWithObjects:dst forKeys:v50 count:1];
  [v14 define:v15 type:2 options:v17 error:0];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v18 = +[REFeatureTransformer featureTransformerClasses];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v24 = [v23 functionName];
        if (v24)
        {
          v25 = [[REScriptToken alloc] initWithValue:v24 type:6 line:-1 column:-1];
          [(id)_sharedSystemTable_Table define:v25 type:4 options:0 error:0];
          [(id)_sharedSystemTable_Table setObjectValue:v23 forDefinition:v24 error:0];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v20);
  }

  v26 = (objc_class *)objc_opt_class();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v27 = +[REFeature systemFeatureNames];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v33 = [v32 stringByAppendingString:@"Feature"];
        v34 = NSSelectorFromString(v33);
        ClassMethod = class_getClassMethod(v26, v34);
        if (ClassMethod)
        {
          v36 = ClassMethod;
          if (method_getNumberOfArguments(ClassMethod) == 2)
          {
            method_getReturnType(v36, (char *)dst, 0xAuLL);
            if (dst[0] == 64)
            {
              v37 = ((void (*)(objc_class *, const char *))[(objc_class *)v26 methodForSelector:v34])(v26, v34);
              if (v37 && (objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = [[REScriptToken alloc] initWithValue:v32 type:6 line:-1 column:-1];
                [(id)_sharedSystemTable_Table define:v38 type:0 options:0 error:0];
                [(id)_sharedSystemTable_Table setObjectValue:v37 forDefinition:v32 error:0];
              }
            }
          }
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v29);
  }
}

- (void)_process
{
  v3 = [REScriptSymbolTable alloc];
  id v4 = [(id)objc_opt_class() _sharedSystemTable];
  v5 = [(REScriptSymbolTable *)v3 initWithParentScope:v4];
  table = self->_table;
  self->_table = v5;

  id v7 = [(REScriptParser *)self->_parser parse];
  id v8 = [[REScriptASTNodeEnumerator alloc] initWithRootNodes:v7 symbolTable:self->_table];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  id v23 = 0;
  obuint64_t j = 0;
  BOOL v9 = [(REScriptASTNodeEnumerator *)v8 buildSymbolTableWithError:&obj];
  objc_storeStrong(&v23, obj);
  if (v9)
  {
    id v10 = [(REScriptASTObjectBuilder *)[REScriptASTFeatureBuilder alloc] initWithTable:self->_table];
    id v11 = self->_table;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __29__REScriptProcessor__process__block_invoke;
    v13[3] = &unk_2644BFD58;
    id v12 = v10;
    id v15 = self;
    v16 = &v18;
    id v14 = v12;
    [(REScriptSymbolTable *)v11 enumerateFeatures:v13];
  }
  else
  {
    [(REScriptProcessor *)self _encounteredError:v19[5]];
  }
  _Block_object_dispose(&v18, 8);
}

void __29__REScriptProcessor__process__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = a1 + 6;
    id v11 = (void *)a1[4];
    uint64_t v12 = *(void *)(a1[6] + 8);
    obuint64_t j = *(id *)(v12 + 40);
    uint64_t v13 = [v11 buildObjectWithNode:v9 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if (!v13)
    {
      id v14 = a1 + 5;
LABEL_8:
      [(id)*v14 _encounteredError:*(void *)(*(void *)(*v10 + 8) + 40)];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = [v8 objectForKeyedSubscript:@"REScriptSymbolFeatureTypeKey"];
    v16 = (void *)v15;
    v17 = &unk_26CFCD3B0;
    if (v15) {
      v17 = (void *)v15;
    }
    id v18 = v17;

    uint64_t v19 = [v18 unsignedIntegerValue];
    uint64_t v13 = +[REFeature featureWithName:v7 featureType:v19];
  }
  uint64_t v20 = a1[5];
  id v14 = a1 + 5;
  uint64_t v21 = *(void **)(v20 + 48);
  id v10 = v14 + 1;
  uint64_t v22 = *(void *)(v14[1] + 8);
  id v24 = *(id *)(v22 + 40);
  char v23 = [v21 setObjectValue:v13 forDefinition:v7 error:&v24];
  objc_storeStrong((id *)(v22 + 40), v24);
  if ((v23 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_encounteredError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"REErrorTokenKey"];

    if (v7)
    {
      id v8 = [MEMORY[0x263F089D8] string];
      [v8 appendString:@"Encountered error while parsing source\n"];
      if (self->_path)
      {
        objc_msgSend(v8, "appendString:");
        [v8 appendString:@"\n"];
      }
      [v8 appendString:@"\n"];
      uint64_t v9 = [v7 line];
      uint64_t v10 = 2;
      if (v9 > 2) {
        uint64_t v10 = v9;
      }
      uint64_t v11 = v10 - 2;
      uint64_t v12 = [v7 line];
      if (v11 > v12) {
        goto LABEL_25;
      }
      v34 = v5;
      char v13 = 0;
      uint64_t v14 = v12 + 1;
      do
      {
        uint64_t v15 = [(REScriptBuffer *)self->_buffer contentForLine:v11];
        if (v15)
        {
          uint64_t v16 = v11 + 1;
          v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu: ", v11 + 1);
          [v8 appendFormat:@"%@%@\n", v17, v15];
          if (v11 == [v7 line])
          {
            uint64_t v18 = [v17 length];
            if ([v7 column] + v18)
            {
              unint64_t v19 = 0;
              do
              {
                [v8 appendString:@" "];
                ++v19;
                uint64_t v20 = [v17 length];
              }
              while (v19 < [v7 column] + v20);
            }
            if ((unint64_t)[v7 length] <= 1) {
              uint64_t v21 = @"^";
            }
            else {
              uint64_t v21 = @"~";
            }
            if ([v7 length])
            {
              unint64_t v22 = 0;
              do
              {
                [v8 appendString:v21];
                ++v22;
              }
              while (v22 < [v7 length]);
            }
            [v8 appendString:@"\n"];
            char v23 = [v34 localizedDescription];
            [v8 appendString:v23];

            [v8 appendString:@"\n\n"];
            char v13 = 1;
          }

          uint64_t v11 = v16;
        }
        else
        {
          ++v11;
        }
      }
      while (v11 != v14);
      v5 = v34;
      if ((v13 & 1) == 0)
      {
LABEL_25:
        [v8 appendString:@"\n"];
        id v24 = [v5 localizedDescription];
        [v8 appendString:v24];

        [v8 appendString:@"\n"];
      }
      if (_fetchedInternalBuildOnceToken_7 != -1) {
        dispatch_once(&_fetchedInternalBuildOnceToken_7, &__block_literal_global_58);
      }
      if (_isInternalDevice_7)
      {
        v25 = RELogForDomain(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[REScriptProcessor _encounteredError:]((uint64_t)v8, v25);
        }

        REStoreLogFileForTask(v8, @"Script");
      }
    }
    v26 = (void *)*MEMORY[0x263EFF498];
    v27 = [v5 localizedDescription];
    RERaiseInternalException(v26, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
  }
}

uint64_t __39__REScriptProcessor__encounteredError___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_7 = result;
  return result;
}

- (void)tokenizer:(id)a3 didEncouterTokenError:(id)a4
{
}

- (void)parser:(id)a3 didEncouterParserError:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_tokenStack, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_encounteredError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end