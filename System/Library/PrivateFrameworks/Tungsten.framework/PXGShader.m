@interface PXGShader
- ($938B03310D06493B2963E5A84CB75A7E)opcodes;
- (BOOL)isEquivalentToShader:(id)a3;
- (BOOL)isOpaque;
- (NSArray)uniforms;
- (NSDictionary)components;
- (PXGShader)init;
- (PXGShader)initWithOpcodes:(id)a3 source:(id)a4 uniforms:(id)a5 components:(id)a6;
- (PXGShaderSource)source;
- (id)description;
- (id)parameterBindingDeclarations;
- (unint64_t)sampler;
- (void)encodeBindableArgumentsWithEncoder:(id)a3;
- (void)setSampler:(unint64_t)a3;
@end

@implementation PXGShader

- (void)setSampler:(unint64_t)a3
{
  self->_sampler = a3;
}

- (PXGShader)initWithOpcodes:(id)a3 source:(id)a4 uniforms:(id)a5 components:(id)a6
{
  unsigned int var2 = a3.var2;
  uint64_t v10 = *(void *)&a3.var0;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v50.receiver = self;
  v50.super_class = (Class)PXGShader;
  v15 = [(PXGShader *)&v50 init];
  if (v15)
  {
    if ([v14 count])
    {
      v38 = [MEMORY[0x263F08690] currentHandler];
      [v38 handleFailureInMethod:a2, v15, @"PXGShader.m", 33, @"Doesn't support binding of components yet, see <rdar://problem/71347132>." object file lineNumber description];
    }
    id v45 = v12;
    if (v12)
    {
      v39 = [MEMORY[0x263F08690] currentHandler];
      [v39 handleFailureInMethod:a2, v15, @"PXGShader.m", 34, @"Dynamic shader source is not currently supported, see rdar://78532560" object file lineNumber description];

      if (v10 != PXGShaderOpcodesNull || qword_26A86D8CC != __PAIR64__(var2, HIDWORD(v10)))
      {
        v40 = [MEMORY[0x263F08690] currentHandler];
        [v40 handleFailureInMethod:a2, v15, @"PXGShader.m", 35, @"Mixing opcodes and source isn't currently supported: %@", v15 object file lineNumber description];
      }
    }
    *(void *)&v15->_opcodes.fragmentTextureCoordinateOpcodes = v10;
    v15->_opcodes.fragmentAlphaOpcodes = var2;
    objc_storeStrong((id *)&v15->_source, a4);
    if (v13) {
      v16 = v13;
    }
    else {
      v16 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v15->_uniforms, v16);
    if (v14) {
      v17 = v14;
    }
    else {
      v17 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v15->_components, v17);
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v44 = v13;
    id v21 = v13;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unint64_t v27 = [v26 type];
          v28 = v18;
          if (v27 < 4) {
            goto LABEL_21;
          }
          if (v27 == 5)
          {
            v28 = v20;
LABEL_21:
            [v28 addObject:v26];
            continue;
          }
          v28 = v19;
          if (v27 == 4) {
            goto LABEL_21;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v23);
    }

    if ([v18 count])
    {
      uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", 16 * objc_msgSend(v18, "count"));
      valueUniformsData = v15->_valueUniformsData;
      v15->_valueUniformsData = (NSMutableData *)v29;
    }
    else
    {
      valueUniformsData = v15->_valueUniformsData;
      v15->_valueUniformsData = 0;
    }
    id v12 = v45;

    uint64_t v31 = [v18 copy];
    valueUniforms = v15->_valueUniforms;
    v15->_valueUniforms = (NSArray *)v31;

    uint64_t v33 = [v19 copy];
    texture2DUniforms = v15->_texture2DUniforms;
    v15->_texture2DUniforms = (NSArray *)v33;

    uint64_t v35 = [v20 copy];
    texture3DUniforms = v15->_texture3DUniforms;
    v15->_texture3DUniforms = (NSArray *)v35;

    if ((unint64_t)[v19 count] >= 4)
    {
      v41 = [MEMORY[0x263F08690] currentHandler];
      [v41 handleFailureInMethod:a2, v15, @"PXGShader.m", 64, @"Invalid parameter not satisfying: %@", @"texture2DUniforms.count <= PXGSHADER_MAX_STATIC_2DTEXTURES" object file lineNumber description];
    }
    id v13 = v44;
    if ((unint64_t)[v20 count] >= 4)
    {
      v42 = [MEMORY[0x263F08690] currentHandler];
      [v42 handleFailureInMethod:a2, v15, @"PXGShader.m", 65, @"Invalid parameter not satisfying: %@", @"texture3DUniforms.count <= PXGSHADER_MAX_STATIC_3DTEXTURES" object file lineNumber description];
    }
    v15->_sampler = 1;
  }
  return v15;
}

- (BOOL)isOpaque
{
  [(PXGShader *)self opcodes];
  if (v3) {
    return 0;
  }
  v5 = [(PXGShader *)self source];
  if (v5)
  {
    v6 = [(PXGShader *)self source];
    char v4 = [v6 isOpaque];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (PXGShaderSource)source
{
  return self->_source;
}

- ($938B03310D06493B2963E5A84CB75A7E)opcodes
{
  unsigned int fragmentAlphaOpcodes = self->_opcodes.fragmentAlphaOpcodes;
  uint64_t v3 = *(void *)&self->_opcodes.fragmentTextureCoordinateOpcodes;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.unsigned int var2 = fragmentAlphaOpcodes;
  return result;
}

- (BOOL)isEquivalentToShader:(id)a3
{
  char v4 = (PXGShader *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 != self)
    {
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2020000000;
      char v40 = 0;
      v6 = [(PXGShader *)self source];
      uint64_t v7 = [v6 hash];
      v8 = [(PXGShader *)v5 source];
      LOBYTE(v7) = v7 == [v8 hash];

      char v40 = v7;
      v9 = v38;
      if (*((unsigned char *)v38 + 24))
      {
        uint64_t v10 = [(PXGShader *)self source];
        v11 = [(PXGShader *)v5 source];
        id v12 = v10;
        id v13 = v11;
        if (v12 == v13) {
          char v14 = 1;
        }
        else {
          char v14 = [v12 isEqual:v13];
        }

        *((unsigned char *)v38 + 24) = v14;
        v9 = v38;
        if (*((unsigned char *)v38 + 24))
        {
          v16 = [(PXGShader *)self components];
          v17 = [(PXGShader *)v5 components];
          id v18 = v16;
          id v19 = v17;
          if (v18 == v19) {
            char v20 = 1;
          }
          else {
            char v20 = [v18 isEqual:v19];
          }

          *((unsigned char *)v38 + 24) = v20;
          v9 = v38;
          if (*((unsigned char *)v38 + 24))
          {
            uint64_t v22 = [(PXGShader *)self opcodes];
            int v24 = v23;
            uint64_t v25 = [(PXGShader *)v5 opcodes];
            v9 = v38;
            if (v22 == v25)
            {
              BOOL v27 = HIDWORD(v22) == HIDWORD(v25) && v24 == v26;
              char v28 = v27;
              *((unsigned char *)v38 + 24) = v28;
              if (v27)
              {
                uint64_t v29 = [(PXGShader *)self uniforms];
                uint64_t v30 = [v29 count];
                uint64_t v31 = [(PXGShader *)v5 uniforms];
                BOOL v32 = v30 == [v31 count];
                *((unsigned char *)v38 + 24) = v32;

                if (*((unsigned char *)v38 + 24))
                {
                  uint64_t v33 = [(PXGShader *)self uniforms];
                  v34[0] = MEMORY[0x263EF8330];
                  v34[1] = 3221225472;
                  v34[2] = __34__PXGShader_isEquivalentToShader___block_invoke;
                  v34[3] = &unk_265556340;
                  v36 = &v37;
                  uint64_t v35 = v5;
                  [v33 enumerateObjectsUsingBlock:v34];

                  BOOL v15 = *((unsigned char *)v38 + 24) != 0;
                }
                else
                {
                  BOOL v15 = 0;
                }
                goto LABEL_16;
              }
LABEL_15:
              BOOL v15 = 0;
              *((unsigned char *)v9 + 24) = 0;
LABEL_16:
              _Block_object_dispose(&v37, 8);
              goto LABEL_17;
            }
          }
LABEL_14:
          *((unsigned char *)v9 + 24) = 0;
          goto LABEL_15;
        }
      }
      else
      {
        *((unsigned char *)v38 + 24) = 0;
      }
      *((unsigned char *)v9 + 24) = 0;
      goto LABEL_14;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_17:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_uniforms, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_valueUniformsData, 0);
  objc_storeStrong((id *)&self->_texture3DUniforms, 0);
  objc_storeStrong((id *)&self->_texture2DUniforms, 0);
  objc_storeStrong((id *)&self->_valueUniforms, 0);

  objc_storeStrong((id *)&self->_sourceByShaderFunction, 0);
}

- (unint64_t)sampler
{
  return self->_sampler;
}

- (NSDictionary)components
{
  return self->_components;
}

- (NSArray)uniforms
{
  return self->_uniforms;
}

- (void)encodeBindableArgumentsWithEncoder:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(PXGShader *)self source];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v6;
  unint64_t v8 = [(PXGShader *)self opcodes];
  if (v8 != PXGShaderOpcodesNull)
  {

LABEL_53:
    v53 = [MEMORY[0x263F08690] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"PXGShader.m", 126, @"Invalid parameter not satisfying: %@", @"!self.source || PXGShaderOpcodesEqualToOpcodes(self.opcodes, PXGShaderOpcodesNull)" object file lineNumber description];

    goto LABEL_8;
  }
  int v10 = v9;
  int v11 = HIDWORD(qword_26A86D8CC);
  uint64_t v12 = HIDWORD(*(void *)&PXGShaderOpcodesNull);
  unint64_t v13 = HIDWORD(v8);

  if (v13 != v12 || v11 != v10) {
    goto LABEL_53;
  }
LABEL_8:
  BOOL v15 = [v5 device];
  v16 = +[PXGMetalRenderContext privateContextWithDevice:v15];

  uint64_t v17 = [(PXGShader *)self opcodes];
  if (v17 == PXGShaderOpcodesNull
    && (HIDWORD(v17) == qword_26A86D8CC ? (BOOL v19 = HIDWORD(qword_26A86D8CC) == v18) : (BOOL v19 = 0), v19))
  {
    v42 = [(PXGShader *)self source];

    if (!v42) {
      goto LABEL_37;
    }
    long long v71 = xmmword_2603C3560;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v35 = [(PXGShader *)self uniforms];
    uint64_t v43 = [(NSArray *)v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(v35);
          }
          long long v47 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v48 = [v47 bindType];
          uint64_t v49 = *(void *)&v72[8 * v48 - 16];
          *(void *)&v72[8 * v48 - 16] = v49 + 1;
          uint64_t v50 = [v47 bindType];
          if (v50 == 1)
          {
            uint64_t v52 = [v47 bindableTextureForContext:v16];
            [v5 setFragmentTexture:v52 atIndex:v49];
          }
          else if (!v50 && [v47 bytesLength] >= 1)
          {
            id v51 = v47;
            objc_msgSend(v5, "setFragmentBytes:length:atIndex:", objc_msgSend(v51, "bytes"), objc_msgSend(v51, "bytesLength"), v49);
          }
        }
        uint64_t v44 = [(NSArray *)v35 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v44);
    }
  }
  else
  {
    valueUniformsData = self->_valueUniformsData;
    if (valueUniformsData)
    {
      id v21 = (_OWORD *)[(NSMutableData *)valueUniformsData bytes];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v22 = self->_valueUniforms;
      uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v67 != v25) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v66 + 1) + 8 * j) encodableValue];
            *v21++ = v27;
          }
          uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v66 objects:v74 count:16];
        }
        while (v24);
      }

      objc_msgSend(v5, "setFragmentBytes:length:atIndex:", -[NSMutableData bytes](self->_valueUniformsData, "bytes"), -[NSMutableData length](self->_valueUniformsData, "length"), 5);
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    char v28 = self->_texture2DUniforms;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v63;
      uint64_t v32 = 5;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v63 != v31) {
            objc_enumerationMutation(v28);
          }
          v34 = [*(id *)(*((void *)&v62 + 1) + 8 * k) bindableTextureForContext:v16];
          [v5 setFragmentTexture:v34 atIndex:v32 + k];
        }
        v32 += k;
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v62 objects:v73 count:16];
      }
      while (v30);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v35 = self->_texture3DUniforms;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v59;
      uint64_t v39 = 8;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v59 != v38) {
            objc_enumerationMutation(v35);
          }
          v41 = [*(id *)(*((void *)&v58 + 1) + 8 * m) bindableTextureForContext:v16];
          [v5 setFragmentTexture:v41 atIndex:v39 + m];
        }
        v39 += m;
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v37);
    }
  }

LABEL_37:
}

- (id)parameterBindingDeclarations
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PXGShader *)self uniforms];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v5 addObject:&stru_270C4DFC8];
    long long v21 = xmmword_2603C3560;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [(PXGShader *)self uniforms];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [v11 bindType];
          ++*((void *)&v21 + v12);
          unint64_t v13 = objc_msgSend(v11, "parameterDeclarationWithBindingIndex:");
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    char v14 = [v5 componentsJoinedByString:@",\n"];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __34__PXGShader_isEquivalentToShader___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = v7;
  if (*(unsigned char *)(v8 + 24))
  {
    uint64_t v9 = [*(id *)(a1 + 32) uniforms];
    int v10 = [v9 objectAtIndexedSubscript:a3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 isEquivalentToUniform:v10];
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)description
{
  long long v18 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  long long v16 = NSStringFromClass(v3);
  unint64_t v4 = [(PXGShader *)self opcodes];
  uint64_t v6 = PXGShaderOpcodesDescription(v4, v5);
  long long v19 = [(NSDictionary *)self->_sourceByShaderFunction allKeys];
  long long v17 = [v19 valueForKeyPath:@"name"];
  id v7 = [v17 componentsJoinedByString:@", "];
  uint64_t v8 = [(PXGShader *)self uniforms];
  uint64_t v9 = [v8 valueForKeyPath:@"name"];
  int v10 = [v9 componentsJoinedByString:@", "];
  id v11 = [(PXGShader *)self components];
  uint64_t v12 = [v11 allKeys];
  unint64_t v13 = [v12 componentsJoinedByString:@", "];
  objc_msgSend(v18, "stringWithFormat:", @"<%@:%p; opcodes:%@ functions:[%@] uniforms:[%@] components:[%@]>",
    v16,
    self,
    v6,
    v7,
    v10,
  char v14 = v13);

  return v14;
}

- (PXGShader)init
{
  unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGShader.m", 27, @"%s is not available as initializer", "-[PXGShader init]");

  abort();
}

@end