@interface PXGShaderSource
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (NSString)otherSource;
- (NSString)source;
- (PXGShaderSource)init;
- (PXGShaderSource)initWithSource:(id)a3;
- (id)sourceForShaderFunction:(id)a3;
- (int64_t)length;
- (unint64_t)hash;
- (void)_parseShader;
@end

@implementation PXGShaderSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_otherSource, 0);

  objc_storeStrong((id *)&self->_sourceByShaderFunction, 0);
}

- (NSString)source
{
  return self->_source;
}

- (NSString)otherSource
{
  return self->_otherSource;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)_parseShader
{
  v17 = +[PXGShaderFunction shaderFunctionByName];
  v4 = [(PXGShaderSource *)self source];
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__2401;
  v36[4] = __Block_byref_object_dispose__2402;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__2401;
  v34[4] = __Block_byref_object_dispose__2402;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2401;
  v32[4] = __Block_byref_object_dispose__2402;
  id v33 = objc_alloc_init(MEMORY[0x263F089D8]);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__2401;
  v30[4] = __Block_byref_object_dispose__2402;
  id v31 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __31__PXGShaderSource__parseShader__block_invoke;
  v18[3] = &unk_265556BA8;
  v23 = &v38;
  v24 = v30;
  v18[4] = self;
  v25 = v34;
  v26 = v36;
  SEL v29 = a2;
  id v7 = v17;
  id v19 = v7;
  v27 = v42;
  v28 = v32;
  id v8 = v16;
  id v20 = v8;
  id v9 = v5;
  id v21 = v9;
  id v10 = v6;
  id v22 = v10;
  [v4 enumerateLinesUsingBlock:v18];
  if (v39[3])
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGShaderSource.m", 214, @"Incorrect parsing of:%@", v4 object file lineNumber description];
  }
  v11 = (NSDictionary *)[v8 copy];
  sourceByShaderFunction = self->_sourceByShaderFunction;
  self->_sourceByShaderFunction = v11;

  v13 = (NSString *)[v10 copy];
  otherSource = self->_otherSource;
  self->_otherSource = v13;

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

void __31__PXGShaderSource__parseShader__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    goto LABEL_9;
  }
  v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v4)
  {
    id v31 = 0;
    uint64_t v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^([^\\s/]*)[\\s]+([^\\s]+)\\([^\\(\\)]*\\)[^\\(\\)]*$" options:0 error:&v31];
    id v6 = v31;
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (v6)
    {
      id v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:*(void *)(a1 + 120), *(void *)(a1 + 32), @"PXGShaderSource.m", 108, @"Invalid parameter not satisfying: %@", @"!error" object file lineNumber description];
    }
    v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }
  id v9 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v9, "px_matchAtIndex:forString:", 2, v3);
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
LABEL_9:
    uint64_t v17 = [v3 length];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __31__PXGShaderSource__parseShader__block_invoke_2;
    v23[3] = &unk_265556B80;
    uint64_t v27 = *(void *)(a1 + 72);
    int8x16_t v28 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
    uint64_t v29 = *(void *)(a1 + 112);
    id v24 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 88);
    id v25 = v18;
    uint64_t v30 = v19;
    id v26 = *(id *)(a1 + 64);
    objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 2, v23);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v20 && (v20 != 1 || !*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) appendString:@"\n"];
      uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(void *)(v21 + 24) == 4) {
        *(void *)(v21 + 24) = 2;
      }
    }
  }
}

uint64_t __31__PXGShaderSource__parseShader__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  id v10 = v9;
  id v26 = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2)
  {
    id v9 = (id)[v9 isEqualToString:@"}"];
    id v10 = v26;
    if (v9)
    {
      if (!--*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
        v13 = *(void **)(v12 + 40);
        if (v11)
        {
          uint64_t v14 = NSString;
          uint64_t v15 = [v11 assignmentVariable];
          id v16 = [v14 stringWithFormat:@"$1%@ = $2", v15];
          objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"([ ]*)return (.*)", v16, 1024, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "length"));

          uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          id v18 = [MEMORY[0x263F08708] newlineCharacterSet];
          uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];
          [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        }
        else
        {
          [*(id *)(v12 + 40) appendString:@"}\n"];
          if (([*(id *)(a1 + 40) containsObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)] & 1) == 0)
          {
            [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
            [*(id *)(a1 + 48) appendString:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
            [*(id *)(a1 + 48) appendString:@"\n"];
          }
        }
        id v9 = (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "deleteCharactersInRange:", 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "length"));
        *a7 = 1;
        id v10 = v26;
      }
    }
  }
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v20)
  {
    if (v20 == 1 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
LABEL_14:
      id v9 = (id)[v10 isEqualToString:@"{"];
      id v10 = v26;
      if (v9)
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
LABEL_16:
        uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v22 = *(void *)(v21 + 24) + 1;
LABEL_17:
        *(void *)(v21 + 24) = v22;
      }
    }
    else
    {
      id v9 = (id)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) appendString:v10];
      id v10 = v26;
      switch(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        case 0:
          goto LABEL_13;
        case 1:
          goto LABEL_14;
        case 2:
          id v9 = (id)[v26 isEqualToString:@"/"];
          if (v9)
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v24 = 3;
LABEL_32:
            *(void *)(v23 + 24) = v24;
            id v10 = v26;
          }
          else
          {
            id v9 = (id)[v26 isEqualToString:@"{"];
            id v10 = v26;
            if (v9) {
              goto LABEL_16;
            }
          }
          break;
        case 3:
          id v9 = (id)[v26 isEqualToString:@"/"];
          if (v9)
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v24 = 4;
          }
          else
          {
            id v9 = (id)[v26 isEqualToString:@"*"];
            uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
            if (v9) {
LABEL_31:
            }
              uint64_t v24 = 5;
            else {
LABEL_27:
            }
              uint64_t v24 = 2;
          }
          goto LABEL_32;
        case 4:
          id v9 = (id)[v26 isEqualToString:@"\n"];
          id v10 = v26;
          if (!v9) {
            break;
          }
          uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v22 = 2;
          goto LABEL_17;
        case 5:
          id v9 = (id)[v26 isEqualToString:@"*"];
          id v10 = v26;
          if (!v9) {
            break;
          }
          uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v22 = 6;
          goto LABEL_17;
        case 6:
          id v9 = (id)[v26 isEqualToString:@"/"];
          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          if (v9) {
            goto LABEL_27;
          }
          goto LABEL_31;
        default:
          break;
      }
    }
  }
  else
  {
LABEL_13:
    *a7 = 1;
  }

  return MEMORY[0x270F9A758](v9, v10);
}

- (id)sourceForShaderFunction:(id)a3
{
  return [(NSDictionary *)self->_sourceByShaderFunction objectForKeyedSubscript:a3];
}

- (int64_t)length
{
  v2 = [(PXGShaderSource *)self source];
  int64_t v3 = [v2 length];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXGShaderSource *)self source];
    uint64_t v7 = [v5 source];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PXGShaderSource *)self source];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PXGShaderSource)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGShaderSource.m", 55, @"%s is not available as initializer", "-[PXGShaderSource init]");

  abort();
}

- (PXGShaderSource)initWithSource:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGShaderSource.m", 36, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXGShaderSource;
  uint64_t v7 = [(PXGShaderSource *)&v20 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_source, a3);
    [(PXGShaderSource *)v8 _parseShader];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    id v9 = +[PXGShaderFunction shaderFunctions];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__PXGShaderSource_initWithSource___block_invoke;
    v13[3] = &unk_265556B58;
    id v10 = v8;
    uint64_t v14 = v10;
    uint64_t v15 = &v16;
    [v9 enumerateObjectsUsingBlock:v13];

    v10->_isOpaque = *((unsigned char *)v17 + 24);
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

void __34__PXGShaderSource_initWithSource___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "sourceForShaderFunction:");
  if (v3 && ([v4 isOpaque] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

@end