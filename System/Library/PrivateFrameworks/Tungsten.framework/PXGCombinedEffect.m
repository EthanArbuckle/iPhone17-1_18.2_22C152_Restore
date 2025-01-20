@interface PXGCombinedEffect
+ (id)combinedShaderSourceForEffects:(id)a3;
- (NSArray)effects;
- (PXGCombinedEffect)initWithEffects:(id)a3;
- (PXGCombinedEffect)initWithEntityManager:(id)a3;
- (id)description;
- (id)shader;
@end

@implementation PXGCombinedEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);

  objc_storeStrong((id *)&self->_combinedShader, 0);
}

- (NSArray)effects
{
  return self->_effects;
}

- (id)description
{
  v3 = [(PXGCombinedEffect *)self effects];
  v4 = [v3 valueForKey:@"class"];
  v5 = [v4 componentsJoinedByString:@", "];

  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend(v6, "stringWithFormat:", @"<%@:%p; effectId = %d, subEffects = %@>",
    v8,
    self,
    [(PXGEffect *)self effectId],
  v9 = v5);

  return v9;
}

- (id)shader
{
  return self->_combinedShader;
}

- (PXGCombinedEffect)initWithEffects:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (![v7 count])
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXGCombinedEffect.m", 81, @"Invalid parameter not satisfying: %@", @"effects.count > 0" object file lineNumber description];
  }
  v8 = [v7 firstObject];
  v9 = [v8 entityManager];
  v46.receiver = self;
  v46.super_class = (Class)PXGCombinedEffect;
  v10 = [(PXGEffect *)&v46 initWithEntityManager:v9];

  if (v10)
  {
    SEL v36 = a2;
    uint64_t v11 = [v7 copy];
    effects = v10->_effects;
    v37 = v10;
    v10->_effects = (NSArray *)v11;

    uint64_t v13 = PXGShaderOpcodesNull;
    uint64_t v14 = dword_26A86D8D0;
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v38 = v7;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v41 = *(void *)v43;
      id obj = v15;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v41) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v20 = [v19 shader];
          unint64_t v21 = [v20 opcodes];
          unsigned int v23 = v22;

          if (v21 == PXGShaderOpcodesNull
            && HIDWORD(v21) == HIDWORD(PXGShaderOpcodesNull)
            && dword_26A86D8D0 == v23)
          {
            continue;
          }
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v14;
          unint64_t v4 = v23 | v4 & 0xFFFFFFFF00000000;
          uint64_t v13 = PXGShaderOpcodesAppending(v13, v3, v21, v4);
          uint64_t v14 = v25;
          v26 = [v19 shader];
          v27 = [v26 uniforms];
          [v40 addObjectsFromArray:v27];
        }
        id v15 = obj;
        uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v17);
    }

    v28 = +[PXGCombinedEffect combinedShaderSourceForEffects:v15];
    v29 = v28;
    v10 = v37;
    if (v28)
    {
      v30 = [v28 aliasedUniformsForEffects:v15];
      [v40 addObjectsFromArray:v30];

      if (v13 != PXGShaderOpcodesNull || v14 != dword_26A86D8D0)
      {
        v31 = [MEMORY[0x263F08690] currentHandler];
        [v31 handleFailureInMethod:v36, v37, @"PXGCombinedEffect.m", 103, @"Mixing opcode and source backed shaders isn't currently supported: %@", v15 object file lineNumber description];
      }
    }
    v32 = -[PXGShader initWithOpcodes:source:uniforms:components:]([PXGShader alloc], "initWithOpcodes:source:uniforms:components:", v13, v14, v29, v40, 0);
    combinedShader = v37->_combinedShader;
    v37->_combinedShader = v32;

    id v7 = v38;
  }

  return v10;
}

- (PXGCombinedEffect)initWithEntityManager:(id)a3
{
  return [(PXGCombinedEffect *)self initWithEffects:MEMORY[0x263EFFA68]];
}

+ (id)combinedShaderSourceForEffects:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) shader];
        uint64_t v11 = [v10 source];

        if (v11)
        {
          v12 = [MEMORY[0x263F08690] currentHandler];
          [v12 handleFailureInMethod:a2, a1, @"PXGCombinedEffect.m", 37, @"Dynamic shader source is not currently supported, see rdar://78532560" object file lineNumber description];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return 0;
}

@end