@interface PXGCombinedShaderSource
- (BOOL)isEmpty;
- (BOOL)isValidForEffects:(id)a3;
- (PXGCombinedShaderSource)initWithEffects:(id)a3;
- (id)aliasedUniformsForEffects:(id)a3;
- (id)description;
@end

@implementation PXGCombinedShaderSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedUniforms, 0);

  objc_storeStrong((id *)&self->_combinedShaderSources, 0);
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (id)aliasedUniformsForEffects:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__PXGCombinedShaderSource_aliasedUniformsForEffects___block_invoke;
  v8[3] = &unk_265556C18;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __53__PXGCombinedShaderSource_aliasedUniformsForEffects___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a2, "shader", 0);
  id v6 = [v5 uniforms];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(a1 + 32);
        v12 = [[PXGUniformAlias alloc] initWithIndex:a3 aliasing:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        [v11 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)isValidForEffects:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_combinedShaderSources;
  uint64_t v6 = [v4 count];
  if (v6 == [(NSArray *)v5 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v20 = v4;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) shader];
          id v14 = [v13 source];
          id v15 = [(NSArray *)v5 objectAtIndexedSubscript:v10 + i];
          if (v14 == v15)
          {
          }
          else
          {
            long long v16 = v15;
            char v17 = [v14 isEqual:v15];

            if ((v17 & 1) == 0)
            {
              BOOL v18 = 0;
              goto LABEL_15;
            }
          }
        }
        v10 += i;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
      BOOL v18 = 1;
LABEL_15:
      id v4 = v20;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p _combinedUniforms:%@", v5, self, self->_combinedUniforms];

  return v6;
}

- (PXGCombinedShaderSource)initWithEffects:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v36 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v3;
  uint64_t v38 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v38)
  {
    uint64_t v6 = 0;
    uint64_t v37 = *(void *)v66;
    id v34 = v5;
    id v35 = v4;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v66 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v65 + 1) + 8 * i) shader];
        uint64_t v9 = [v8 source];
        if (v9)
        {
          uint64_t v40 = i;
          [v4 addObject:v9];
          v39 = v8;
          uint64_t v10 = [v8 uniforms];
          uint64_t v60 = MEMORY[0x263EF8330];
          uint64_t v61 = 3221225472;
          v62 = __43__PXGCombinedShaderSource_initWithEffects___block_invoke;
          v63 = &__block_descriptor_40_e32___PXGUniform_16__0__PXGUniform_8l;
          uint64_t v41 = v6;
          uint64_t v64 = v6;
          uint64_t v11 = PXMap();

          v44 = (void *)v11;
          [v5 addObjectsFromArray:v11];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v57 = 0u;
          long long v56 = 0u;
          id v42 = +[PXGShaderFunction shaderFunctions];
          uint64_t v47 = [v42 countByEnumeratingWithState:&v56 objects:v70 count:16];
          if (v47)
          {
            uint64_t v46 = *(void *)v57;
            v43 = v9;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v57 != v46) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v13 = *(void *)(*((void *)&v56 + 1) + 8 * j);
                uint64_t v14 = [v9 sourceForShaderFunction:v13];
                id v15 = (void *)v14;
                if (v14)
                {
                  v48 = (void *)v14;
                  id v16 = [v45 objectForKeyedSubscript:v13];
                  if (!v16)
                  {
                    id v16 = objc_alloc_init(MEMORY[0x263F089D8]);
                    [v45 setObject:v16 forKeyedSubscript:v13];
                  }
                  [v16 appendString:@"{\n"];
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v52 = 0u;
                  long long v53 = 0u;
                  id v17 = v44;
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v69 count:16];
                  if (v18)
                  {
                    uint64_t v19 = v18;
                    uint64_t v20 = *(void *)v53;
                    do
                    {
                      for (uint64_t k = 0; k != v19; ++k)
                      {
                        if (*(void *)v53 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        long long v22 = *(void **)(*((void *)&v52 + 1) + 8 * k);
                        long long v23 = [v22 original];
                        long long v24 = [v23 declaration];
                        v25 = [v22 name];
                        [v16 appendFormat:@"%@ = %@;\n", v24, v25];
                      }
                      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v69 count:16];
                    }
                    while (v19);
                  }

                  id v15 = v48;
                  [v16 appendString:v48];
                  [v16 appendString:@"\n}\n"];

                  uint64_t v9 = v43;
                }
              }
              uint64_t v47 = [v42 countByEnumeratingWithState:&v56 objects:v70 count:16];
            }
            while (v47);
          }

          uint64_t v8 = v39;
          uint64_t v26 = [v39 source];
          v27 = [v26 otherSource];
          [v36 appendString:v27];

          uint64_t v6 = v41 + 1;
          id v5 = v34;
          id v4 = v35;
          uint64_t i = v40;
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v38);
  }

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __43__PXGCombinedShaderSource_initWithEffects___block_invoke_2;
  v50[3] = &unk_265556BF0;
  id v28 = v36;
  id v51 = v28;
  [v45 enumerateKeysAndObjectsUsingBlock:v50];
  v49.receiver = self;
  v49.super_class = (Class)PXGCombinedShaderSource;
  v29 = [(PXGShaderSource *)&v49 initWithSource:v28];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_combinedUniforms, v5);
    objc_storeStrong((id *)&v30->_combinedShaderSources, v4);
    v30->_isEmpty = [v28 length] == 0;
  }

  return v30;
}

PXGUniformAlias *__43__PXGCombinedShaderSource_initWithEffects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PXGUniformAlias alloc] initWithIndex:*(void *)(a1 + 32) aliasing:v3];

  return v4;
}

uint64_t __43__PXGCombinedShaderSource_initWithEffects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 name];
  [v5 appendFormat:@"void %@() {\n", v7];

  [*(id *)(a1 + 32) appendString:v6];
  uint64_t v8 = *(void **)(a1 + 32);

  return [v8 appendString:@"}\n"];
}

@end