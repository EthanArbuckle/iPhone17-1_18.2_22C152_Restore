@interface SoftISPKernelWithFunctionConstants
+ (id)_addNamespace:(id)a3 toName:(id)a4;
+ (id)_removeNamespace:(id)a3 fromName:(id)a4;
- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 paramValues:(id)a5;
- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 usingNamespace:(id)a5 paramCombinations:(id)a6;
- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 usingNamespace:(id)a5 paramValues:(id)a6;
- (id)_dataKeyFromParams:(id)a3;
- (id)getPipelineStateWithParams:(id)a3;
- (int)_addCombos:(id)a3 partialCombo:(id)a4 paramNameStack:(id)a5 paramCombinations:(id)a6;
- (int)_calculateParameterOffsetAndSize:(id)a3 functionConstantNamespace:(id)a4;
- (int)_loadWithMetalContext:(id)a3 kernelName:(id)a4 functionConstantNamespace:(id)a5 paramCombinations:(id)a6;
- (int)_loadWithMetalContext:(id)a3 kernelName:(id)a4 functionConstantNamespace:(id)a5 paramValues:(id)a6;
- (int)_verifyFunctionConstants:(id)a3;
- (int)_verifyParamValues:(id)a3 forFunction:(id)a4 functionConstantNamespace:(id)a5;
@end

@implementation SoftISPKernelWithFunctionConstants

uint64_t __97__SoftISPKernelWithFunctionConstants__calculateParameterOffsetAndSize_functionConstantNamespace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 index];
  unint64_t v6 = [v4 index];

  if (v5 < v6) {
    return -1;
  }
  else {
    return 1;
  }
}

- (int)_loadWithMetalContext:(id)a3 kernelName:(id)a4 functionConstantNamespace:(id)a5 paramCombinations:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263E64AA0]();
  if (!v10 || !v11)
  {
    int v34 = FigSignalErrorAt();
    v16 = 0;
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
  v15 = [v10 library];
  v16 = (void *)[v15 newFunctionWithName:v11];

  if (!v16)
  {
    int v34 = FigSignalErrorAt();
    goto LABEL_34;
  }
  v17 = [v16 functionConstantsDictionary];

  if (!v17)
  {
    int v34 = FigSignalErrorAt();
LABEL_35:
    id obj = 0;
    v21 = 0;
    goto LABEL_29;
  }
  v40 = self;
  int v18 = [(SoftISPKernelWithFunctionConstants *)self _verifyFunctionConstants:v16];
  if (v18)
  {
    int v34 = v18;
    FigDebugAssert3();
    goto LABEL_34;
  }
  v36 = v16;
  v37 = v14;
  id v38 = v11;
  id v39 = v10;
  v19 = [v16 functionConstantsDictionary];
  v20 = [v19 allValues];

  v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v20;
  uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    uint64_t v25 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v28 = [v27 name];
        if (v12)
        {
          uint64_t v29 = +[SoftISPKernelWithFunctionConstants _removeNamespace:v12 fromName:v28];

          v28 = (void *)v29;
        }
        if ([v27 type] == 53)
        {
          v25 *= 2;
        }
        else
        {
          if (!v13
            || ([v13 objectForKey:v28],
                v30 = objc_claimAutoreleasedReturnValue(),
                v30,
                !v30)
            || ([v13 objectForKeyedSubscript:v28],
                v31 = objc_claimAutoreleasedReturnValue(),
                unint64_t v32 = [v31 count],
                v31,
                v32 < 2))
          {
            int v34 = FigSignalErrorAt();

            v17 = 0;
            goto LABEL_28;
          }
          v25 *= v32;
        }
        [v21 addObject:v28];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v25 = 1;
  }

  v17 = [MEMORY[0x263EFF980] arrayWithCapacity:v25];
  int v33 = [(SoftISPKernelWithFunctionConstants *)v40 _addCombos:v17 partialCombo:0 paramNameStack:v21 paramCombinations:v13];
  if (v33)
  {
    int v34 = v33;
    FigDebugAssert3();
LABEL_28:
    id v11 = v38;
    id v10 = v39;
    v16 = v36;
    v14 = v37;
  }
  else
  {
    v14 = v37;
    id v11 = v38;
    v16 = v36;
    if (v25 == [v17 count])
    {
      id v10 = v39;
      int v34 = [(SoftISPKernelWithFunctionConstants *)v40 _loadWithMetalContext:v39 kernelName:v38 functionConstantNamespace:v12 paramValues:v17];
      if (v34) {
        FigDebugAssert3();
      }
    }
    else
    {
      int v34 = FigSignalErrorAt();
      id v10 = v39;
    }
  }
LABEL_29:

  return v34;
}

- (int)_verifyFunctionConstants:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [a3 functionConstantsDictionary];
  id v4 = [v3 allValues];

  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12);
          if (v9 > 0x35 || ((1 << v9) & 0x20000220000000) == 0)
          {
            LODWORD(v6) = FigSignalErrorAt();
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LODWORD(v6) = FigSignalErrorAt();
  }

  return v6;
}

- (int)_verifyParamValues:(id)a3 forFunction:(id)a4 functionConstantNamespace:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v7;
  uint64_t v29 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v29)
  {
    uint64_t v11 = *(void *)v37;
    v31 = v10;
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v10);
        }
        uint64_t v30 = v12;
        long long v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v14 = objc_msgSend(v8, "functionConstantsDictionary", v28);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(id *)(*((void *)&v32 + 1) + 8 * i);
              v20 = v19;
              if (v9)
              {
                v20 = +[SoftISPKernelWithFunctionConstants _removeNamespace:v9 fromName:v19];
              }
              v21 = [v13 objectForKey:v20];

              if (!v21)
              {
                int v26 = FigSignalErrorAt();
                goto LABEL_24;
              }
              uint64_t v22 = [v8 functionConstantsDictionary];
              uint64_t v23 = [v22 objectForKeyedSubscript:v19];

              unint64_t v24 = [v23 type];
              if (v24 > 0x35 || ((1 << v24) & 0x20000220000000) == 0)
              {
                int v26 = FigSignalErrorAt();

LABEL_24:
                id v10 = v31;
                goto LABEL_26;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        uint64_t v12 = v30 + 1;
        id v10 = v31;
        uint64_t v11 = v28;
      }
      while (v30 + 1 != v29);
      int v26 = 0;
      uint64_t v29 = [v31 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v29);
  }
  else
  {
    int v26 = 0;
  }
LABEL_26:

  return v26;
}

+ (id)_addNamespace:(id)a3 toName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@::%@", a3, a4];
}

- (int)_loadWithMetalContext:(id)a3 kernelName:(id)a4 functionConstantNamespace:(id)a5 paramValues:(id)a6
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v54 = (void *)MEMORY[0x263E64AA0]();
  if (!v10
    || !v11
    || ([v10 library],
        long long v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = (void *)[v14 newFunctionWithName:v11],
        v14,
        !v15))
  {
    int v43 = FigSignalErrorAt();
    goto LABEL_40;
  }
  uint64_t v16 = [v15 functionConstantsDictionary];

  if (!v16)
  {
    int v43 = FigSignalErrorAt();
    goto LABEL_39;
  }
  int v17 = [(SoftISPKernelWithFunctionConstants *)self _verifyFunctionConstants:v15];
  if (v17)
  {
    int v43 = v17;
LABEL_47:
    FigDebugAssert3();
    goto LABEL_39;
  }
  int v18 = [(SoftISPKernelWithFunctionConstants *)self _verifyParamValues:v13 forFunction:v15 functionConstantNamespace:v12];
  if (v18)
  {
    int v43 = v18;
    goto LABEL_47;
  }
  [(SoftISPKernelWithFunctionConstants *)self _calculateParameterOffsetAndSize:v15 functionConstantNamespace:v12];
  v58 = objc_opt_new();
  id v19 = self->_pipelineStateDictionary;
  if (!v19) {
    id v19 = (NSDictionary *)objc_opt_new();
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v20 = v13;
  uint64_t v47 = [v20 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (!v47)
  {
LABEL_34:

    pipelineStateDictionary = self->_pipelineStateDictionary;
    self->_pipelineStateDictionary = v19;
    uint64_t v42 = v19;

    int v43 = 0;
    goto LABEL_40;
  }
  uint64_t v21 = *(void *)v65;
  id v52 = v11;
  v53 = v10;
  v50 = v19;
  id v51 = v13;
  uint64_t v45 = *(void *)v65;
  v46 = self;
  v49 = v20;
  while (2)
  {
    uint64_t v22 = 0;
LABEL_12:
    if (*(void *)v65 != v21) {
      objc_enumerationMutation(v20);
    }
    uint64_t v48 = v22;
    uint64_t v23 = *(void **)(*((void *)&v64 + 1) + 8 * v22);
    unint64_t v24 = (void *)MEMORY[0x263E64AA0]();
    v56 = [(SoftISPKernelWithFunctionConstants *)self _dataKeyFromParams:v23];
    if (!v56)
    {
      int v43 = FigSignalErrorAt();
      goto LABEL_38;
    }
    context = v24;
    [v58 reset];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v25 = v15;
    id obj = [v15 functionConstantsDictionary];
    uint64_t v26 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (!v26) {
      goto LABEL_31;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v61;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v61 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(*((void *)&v60 + 1) + 8 * i);
        v31 = v30;
        if (v12)
        {
          v31 = +[SoftISPKernelWithFunctionConstants _removeNamespace:v12 fromName:v30];
        }
        long long v32 = [v23 objectForKey:v31];

        if (!v32)
        {
          int v43 = FigSignalErrorAt();
          goto LABEL_36;
        }
        long long v33 = [v23 objectForKeyedSubscript:v31];
        long long v34 = [v25 functionConstantsDictionary];
        long long v35 = [v34 objectForKeyedSubscript:v30];

        uint64_t v36 = [v35 type];
        switch(v36)
        {
          case 53:
            LOBYTE(v59) = 0;
            LOBYTE(v59) = [v33 BOOLValue];
            uint64_t v37 = [v35 index];
            long long v38 = v58;
            uint64_t v39 = 53;
            break;
          case 33:
            int v59 = 0;
            int v59 = [v33 unsignedIntValue];
            uint64_t v37 = [v35 index];
            long long v38 = v58;
            uint64_t v39 = 33;
            break;
          case 29:
            int v59 = 0;
            int v59 = [v33 intValue];
            uint64_t v37 = [v35 index];
            long long v38 = v58;
            uint64_t v39 = 29;
            break;
          default:
            int v43 = FigSignalErrorAt();

LABEL_36:
            id v11 = v52;
            id v10 = v53;
            goto LABEL_37;
        }
        [v38 setConstantValue:&v59 type:v39 atIndex:v37];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v27) {
        continue;
      }
      break;
    }
LABEL_31:

    id v11 = v52;
    id v10 = v53;
    v40 = [v53 computePipelineStateFor:v52 constants:v58];
    if (v40)
    {
      id v19 = v50;
      [(NSDictionary *)v50 setObject:v40 forKeyedSubscript:v56];

      uint64_t v22 = v48 + 1;
      id v13 = v51;
      uint64_t v15 = v25;
      uint64_t v21 = v45;
      self = v46;
      id v20 = v49;
      if (v48 + 1 == v47)
      {
        uint64_t v47 = [v49 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (!v47) {
          goto LABEL_34;
        }
        continue;
      }
      goto LABEL_12;
    }
    break;
  }
  int v43 = FigSignalErrorAt();

LABEL_37:
  id v19 = v50;
  id v13 = v51;
  uint64_t v15 = v25;
  id v20 = v49;
  unint64_t v24 = context;
LABEL_38:

LABEL_39:

LABEL_40:

  return v43;
}

+ (id)_removeNamespace:(id)a3 fromName:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 stringByAppendingString:@"::"];
  id v7 = [v5 stringByReplacingOccurrencesOfString:v6 withString:&stru_270E53418];

  return v7;
}

- (id)_dataKeyFromParams:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v21 = a3;
  unint64_t v4 = [v21 count];
  if (v4 < [(NSArray *)self->_parameterNameArray count])
  {
    FigSignalErrorAt();
LABEL_12:
    int v17 = 0;
  }
  else
  {
    size_t totalKeyDataSize = self->_totalKeyDataSize;
    bzero((char *)&v19 - ((totalKeyDataSize + 15) & 0xFFFFFFFFFFFFFFF0), totalKeyDataSize);
    id v19 = (char *)&v19 - ((totalKeyDataSize + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v19, totalKeyDataSize);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    id v20 = self->_parameterNameArray;
    uint64_t v6 = [(NSArray *)v20 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v24;
      id v10 = v19;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v8;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v20);
          }
          uint64_t v13 = [v21 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * v11)];
          if (!v13)
          {
            FigSignalErrorAt();

            goto LABEL_12;
          }
          long long v14 = (void *)v13;
          uint64_t v15 = [(NSArray *)self->_parameterSizeArray objectAtIndexedSubscript:v12 + v11];
          size_t v16 = [v15 unsignedIntValue];

          int __src = [v14 unsignedIntValue];
          memcpy(v10, &__src, v16);
          v10 += v16;

          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [(NSArray *)v20 countByEnumeratingWithState:&v23 objects:v27 count:16];
        int v8 = v12 + v11;
        if (v7) {
          continue;
        }
        break;
      }
    }

    int v17 = [MEMORY[0x263EFF8F8] dataWithBytes:v19 length:self->_totalKeyDataSize];
  }

  return v17;
}

- (int)_addCombos:(id)a3 partialCombo:(id)a4 paramNameStack:(id)a5 paramCombinations:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  uint64_t v13 = [v11 lastObject];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v15 = &unk_270E982F0;
  long long v26 = 0u;
  long long v27 = 0u;
  if (v14) {
    uint64_t v15 = (void *)v14;
  }
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        [v10 setObject:*(void *)(*((void *)&v26 + 1) + 8 * i) forKeyedSubscript:v13];
        if ((unint64_t)[v11 count] < 2)
        {
          uint64_t v22 = [NSDictionary dictionaryWithDictionary:v10];
          [v9 addObject:v22];
        }
        else
        {
          id v20 = objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);
          int v21 = [(SoftISPKernelWithFunctionConstants *)self _addCombos:v9 partialCombo:v10 paramNameStack:v20 paramCombinations:v12];

          if (v21)
          {
            FigDebugAssert3();
            goto LABEL_17;
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }
  int v21 = 0;
LABEL_17:

  return v21;
}

- (int)_calculateParameterOffsetAndSize:(id)a3 functionConstantNamespace:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  self->_size_t totalKeyDataSize = 0;
  uint64_t v7 = [a3 functionConstantsDictionary];
  int v8 = [v7 allValues];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_21];

  id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v9;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    long long v28 = self;
    id obj = v12;
    LODWORD(v15) = 0;
    uint64_t v16 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "type", v28);
        uint64_t v20 = 4;
        if (v19 != 29 && v19 != 33)
        {
          if (v19 != 53)
          {
            int v24 = FigSignalErrorAt();
            id v12 = obj;
            parameterSizeArray = obj;
            goto LABEL_18;
          }
          uint64_t v20 = 1;
        }
        int v21 = [v18 name];
        if (v6)
        {
          uint64_t v22 = +[SoftISPKernelWithFunctionConstants _removeNamespace:v6 fromName:v21];

          int v21 = (void *)v22;
        }
        [v10 addObject:v21];
        long long v23 = [NSNumber numberWithUnsignedChar:v20];
        [v11 addObject:v23];

        unint64_t v15 = (v15 + v20);
      }
      id v12 = obj;
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    self = v28;
  }
  else
  {
    unint64_t v15 = 0;
  }

  self->_size_t totalKeyDataSize = v15;
  objc_storeStrong((id *)&self->_parameterNameArray, v10);
  long long v26 = v11;
  int v24 = 0;
  parameterSizeArray = self->_parameterSizeArray;
  self->_parameterSizeArray = v26;
LABEL_18:

  return v24;
}

- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 usingNamespace:(id)a5 paramCombinations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SoftISPKernelWithFunctionConstants;
  uint64_t v14 = [(SoftISPKernelWithFunctionConstants *)&v18 init];
  unint64_t v15 = v14;
  if (!v14
    || [(SoftISPKernelWithFunctionConstants *)v14 _loadWithMetalContext:v10 kernelName:v11 functionConstantNamespace:v12 paramCombinations:v13])
  {
    FigDebugAssert3();
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v15;
  }

  return v16;
}

- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 usingNamespace:(id)a5 paramValues:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SoftISPKernelWithFunctionConstants;
  uint64_t v14 = [(SoftISPKernelWithFunctionConstants *)&v18 init];
  unint64_t v15 = v14;
  if (!v14
    || [(SoftISPKernelWithFunctionConstants *)v14 _loadWithMetalContext:v10 kernelName:v11 functionConstantNamespace:v12 paramValues:v13])
  {
    FigDebugAssert3();
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v15;
  }

  return v16;
}

- (SoftISPKernelWithFunctionConstants)initWithMetalContext:(id)a3 kernelName:(id)a4 paramValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SoftISPKernelWithFunctionConstants;
  id v11 = [(SoftISPKernelWithFunctionConstants *)&v15 init];
  id v12 = v11;
  if (!v11
    || [(SoftISPKernelWithFunctionConstants *)v11 _loadWithMetalContext:v8 kernelName:v9 functionConstantNamespace:0 paramValues:v10])
  {
    FigDebugAssert3();
    id v13 = 0;
  }
  else
  {
    id v13 = v12;
  }

  return v13;
}

- (id)getPipelineStateWithParams:(id)a3
{
  unint64_t v4 = [(SoftISPKernelWithFunctionConstants *)self _dataKeyFromParams:a3];
  id v5 = [(NSDictionary *)self->_pipelineStateDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSizeArray, 0);
  objc_storeStrong((id *)&self->_parameterNameArray, 0);

  objc_storeStrong((id *)&self->_pipelineStateDictionary, 0);
}

@end