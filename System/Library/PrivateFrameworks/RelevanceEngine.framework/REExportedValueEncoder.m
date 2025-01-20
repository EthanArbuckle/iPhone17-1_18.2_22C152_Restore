@interface REExportedValueEncoder
- (BOOL)writesArrayHeader;
- (BOOL)writesDictionaryHeader;
- (REExportedValueEncoder)initWithOptions:(unint64_t)a3;
- (id)_namesArrayFromArray:(id)a3;
- (id)dataFromExportedValue:(id)a3;
- (void)_writeCollection:(id)a3 toStream:(id)a4 startBlock:(id)a5 writerBlock:(id)a6 endBlock:(id)a7 wantsHeader:(BOOL)a8 depth:(unint64_t)a9;
- (void)_writeValue:(id)a3 toStream:(id)a4 depth:(unint64_t)a5 needsIndent:(BOOL)a6;
- (void)writeExportedValue:(id)a3 toStream:(id)a4;
- (void)writeUnsupportedObject:(id)a3 toStream:(id)a4;
@end

@implementation REExportedValueEncoder

- (REExportedValueEncoder)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REExportedValueEncoder;
  result = [(REExportedValueEncoder *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (void)writeExportedValue:(id)a3 toStream:(id)a4
{
}

- (id)dataFromExportedValue:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9E0];
  id v5 = a3;
  v6 = [v4 outputStreamToMemory];
  [v6 open];
  [(REExportedValueEncoder *)self writeExportedValue:v5 toStream:v6];

  v7 = [v6 propertyForKey:*MEMORY[0x263EFF590]];
  [v6 close];

  return v7;
}

- (void)_writeValue:(id)a3 toStream:(id)a4 depth:(unint64_t)a5 needsIndent:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = +[REExportedValue exportedValueForObject:v10];
  int v13 = self->_options & a6;
  if (v13 == 1)
  {
    if (a5)
    {
      if (a5 == 1)
      {
        v14 = @"    ";
      }
      else
      {
        v15 = [MEMORY[0x263F089D8] stringWithCapacity:objc_msgSend(@"    ", "length") * a5];
        unint64_t v16 = a5;
        do
        {
          [v15 appendString:@"    "];
          --v16;
        }
        while (v16);
        v14 = (__CFString *)[v15 copy];
      }
    }
    else
    {
      v14 = &stru_26CFA57D0;
    }
    objc_msgSend(v11, "re_writeString:", v14);
  }
  switch([v12 type])
  {
    case 0:
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_5;
      v24[3] = &unk_2644BCAB0;
      v24[4] = self;
      v22[4] = self;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_6;
      v23[3] = &unk_2644BCA88;
      v23[4] = self;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_7;
      v22[3] = &unk_2644BCAB0;
      [(REExportedValueEncoder *)self _writeCollection:v12 toStream:v11 startBlock:v24 writerBlock:v23 endBlock:v22 wantsHeader:[(REExportedValueEncoder *)self writesArrayHeader] depth:a5];
      goto LABEL_16;
    case 1:
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_8;
      v21[3] = &unk_2644BCAB0;
      v21[4] = self;
      v19[4] = self;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_9;
      v20[3] = &unk_2644BCA88;
      v20[4] = self;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_10;
      v19[3] = &unk_2644BCAB0;
      [(REExportedValueEncoder *)self _writeCollection:v12 toStream:v11 startBlock:v21 writerBlock:v20 endBlock:v19 wantsHeader:[(REExportedValueEncoder *)self writesDictionaryHeader] depth:a5];
LABEL_16:
      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_28;
    case 2:
      if ([v12 propertyCount] == 1)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke;
        v30[3] = &unk_2644BCA38;
        v30[4] = self;
        id v31 = v11;
        unint64_t v32 = a5;
        [v12 enumerateValuesUsingBlock:v30];
        id v17 = v31;
      }
      else
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_2;
        v28[3] = &unk_2644BCA60;
        v28[4] = self;
        id v29 = v12;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_3;
        v27[3] = &unk_2644BCA88;
        v27[4] = self;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_4;
        v25[3] = &unk_2644BCA60;
        v25[4] = self;
        id v26 = v29;
        [(REExportedValueEncoder *)self _writeCollection:v26 toStream:v11 startBlock:v28 writerBlock:v27 endBlock:v25 wantsHeader:1 depth:a5];

        id v17 = v29;
      }

      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_28;
    case 3:
      v18 = [v12 stringValue];
      [(REExportedValueEncoder *)self writeString:v18 toStream:v11];
      goto LABEL_20;
    case 4:
      v18 = [v12 numberValue];
      [(REExportedValueEncoder *)self writeNumber:v18 toStream:v11];
      goto LABEL_20;
    case 5:
      v18 = [v12 dateValue];
      [(REExportedValueEncoder *)self writeDate:v18 toStream:v11];
LABEL_20:

      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_28;
    case 6:
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
      }
      [(REExportedValueEncoder *)self writeNullToStream:v11];
      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_28;
    case 7:
LABEL_26:
      [(REExportedValueEncoder *)self writeUnsupportedObject:v10 toStream:v11];
      goto LABEL_27;
    default:
LABEL_27:
      if (v13) {
LABEL_28:
      }
        objc_msgSend(v11, "re_writeString:", @"\n");
LABEL_29:

      return;
  }
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _writeValue:a3 toStream:*(void *)(a1 + 40) depth:*(void *)(a1 + 48) needsIndent:0];
}

void __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectValue];
  [v2 writeObjectStart:v5 toStream:v4];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) writeObjectValuePairToStream:a2 keyWriter:a3 valueWriter:a4 isLast:a5];
}

void __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectValue];
  [v2 writeObjectEnd:v5 toStream:v4];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeArrayStartToStream:a2];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeArrayValuePairToStream:valueWriter:isLast:", a2);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeArrayEndToStream:a2];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeDictionaryStartToStream:a2];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) writeDictionaryValuePairToStream:a2 keyWriter:a3 valueWriter:a4 isLast:a5];
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeDictionaryEndToStream:a2];
}

- (void)_writeCollection:(id)a3 toStream:(id)a4 startBlock:(id)a5 writerBlock:(id)a6 endBlock:(id)a7 wantsHeader:(BOOL)a8 depth:(unint64_t)a9
{
  BOOL v9 = a8;
  unint64_t v15 = a9;
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v28 = a6;
  id v29 = self;
  v30 = (void (**)(id, id))a7;
  unint64_t options = self->_options;
  if (a9) {
    BOOL v19 = (self->_options & 4) != 0;
  }
  else {
    BOOL v19 = 1;
  }
  char v20 = options & 1;
  unsigned int v21 = (options >> 1) & 1;
  v27 = v17;
  (*((void (**)(id, id))v17 + 2))(v17, v16);
  int v22 = options & v9;
  if (v22 == 1) {
    objc_msgSend(v16, "re_writeString:", @"\n");
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v43 = [v31 propertyCount];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke;
  v32[3] = &unk_2644BCB28;
  v36 = v42;
  BOOL v38 = v19;
  char v39 = v21;
  BOOL v40 = v9;
  char v41 = v20;
  id v23 = v16;
  id v33 = v23;
  unint64_t v37 = a9;
  id v24 = v28;
  v34 = v29;
  id v35 = v24;
  [v31 enumerateValuesUsingBlock:v32];
  if (v22)
  {
    if (a9)
    {
      if (a9 == 1)
      {
        v25 = @"    ";
      }
      else
      {
        id v26 = [MEMORY[0x263F089D8] stringWithCapacity:objc_msgSend(@"    ", "length") * a9];
        do
        {
          [v26 appendString:@"    "];
          --v15;
        }
        while (v15);
        v25 = (__CFString *)[v26 copy];
      }
    }
    else
    {
      v25 = &stru_26CFA57D0;
    }
    objc_msgSend(v23, "re_writeString:", v25);
  }
  v30[2](v30, v23);

  _Block_object_dispose(v42, 8);
}

void __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v26 = a2;
  id v5 = a3;
  uint64_t v27 = a1;
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v6 = +[REExportedValue exportedValueForObject:v5];
  if ((unint64_t)[v6 type] > 2 || *(unsigned char *)(a1 + 72)) {
    goto LABEL_18;
  }
  if ((unint64_t)[v6 type] > 2)
  {
LABEL_17:

    id v5 = @"More Details...";
    goto LABEL_18;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v7 = REEncodeIdentificationProperites();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v8)
  {

    goto LABEL_17;
  }
  char v9 = 0;
  uint64_t v10 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v44 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = [v6 exportedValueForKey:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      int v13 = v12;
      if (v12 && [v12 type] == 3)
      {
        id v14 = v13;

        uint64_t v15 = [v14 stringValue];

        char v9 = 1;
        v6 = v14;
        id v5 = (__CFString *)v15;
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
  if (!*(unsigned char *)(v27 + 73) || [v6 shouldEncodeProperty:v26])
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(v27 + 56) + 8) + 24);
    uint64_t v17 = *(unsigned __int8 *)(v27 + 74);
    if (*(unsigned char *)(v27 + 75) && ((unint64_t)[v6 type] > 2 || *(unsigned char *)(v27 + 74)))
    {
      v18 = *(void **)(v27 + 32);
      uint64_t v19 = *(void *)(v27 + 64) + v17;
      if (v19)
      {
        if (v19 == 1)
        {
          char v20 = @"    ";
        }
        else
        {
          unsigned int v21 = [MEMORY[0x263F089D8] stringWithCapacity:objc_msgSend(@"    ", "length") * v19];
          do
          {
            [v21 appendString:@"    "];
            --v19;
          }
          while (v19);
          char v20 = (__CFString *)[v21 copy];
        }
      }
      else
      {
        char v20 = &stru_26CFA57D0;
      }
      objc_msgSend(v18, "re_writeString:", v20);
    }
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    char v42 = 0;
    uint64_t v22 = *(void *)(v27 + 48);
    id v23 = *(void **)(v27 + 32);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_2;
    v37[3] = &unk_2644BCAD8;
    id v38 = v23;
    id v39 = v26;
    BOOL v40 = v41;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_3;
    v28[3] = &unk_2644BCB00;
    char v36 = *(unsigned char *)(v27 + 75);
    id v33 = v41;
    id v29 = v6;
    id v24 = *(id *)(v27 + 32);
    uint64_t v34 = *(void *)(v27 + 64);
    uint64_t v35 = v17;
    uint64_t v25 = *(void *)(v27 + 40);
    id v30 = v24;
    uint64_t v31 = v25;
    unint64_t v32 = v5;
    (*(void (**)(uint64_t, id, void *, void *, BOOL))(v22 + 16))(v22, v38, v37, v28, v16 == 0);
    if (*(unsigned char *)(v27 + 75) && (*(unsigned char *)(v27 + 74) || v16)) {
      objc_msgSend(*(id *)(v27 + 32), "re_writeString:", @"\n");
    }

    _Block_object_dispose(v41, 8);
  }
}

uint64_t __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "re_writeString:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && (unint64_t)[*(id *)(a1 + 32) type] <= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "re_writeString:", @"\n");
    v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 80) + *(void *)(a1 + 72);
    if (v3)
    {
      if (v3 == 1)
      {
        id v4 = @"    ";
      }
      else
      {
        id v5 = [MEMORY[0x263F089D8] stringWithCapacity:objc_msgSend(@"    ", "length") * v3];
        do
        {
          [v5 appendString:@"    "];
          --v3;
        }
        while (v3);
        id v4 = (__CFString *)[v5 copy];
      }
    }
    else
    {
      id v4 = &stru_26CFA57D0;
    }
    objc_msgSend(v2, "re_writeString:", v4);
  }
  v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 72) + 1;
  return [v6 _writeValue:v7 toStream:v8 depth:v9 needsIndent:0];
}

- (id)_namesArrayFromArray:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = +[REExportedValue exportedValueForObject:v4];

    if ([v5 type] == 6)
    {
      v6 = 0;
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v7 = REEncodeIdentificationProperites();
      v6 = (void *)[v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v6)
      {
        uint64_t v8 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v39 != v8) {
              objc_enumerationMutation(v7);
            }
            uint64_t v10 = [v5 exportedValueForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
            uint64_t v11 = [v10 type];

            if (v11 == 3)
            {
              id v24 = v5;

              uint64_t v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v25 = v3;
              obuint64_t j = v3;
              uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
              if (v29)
              {
                uint64_t v28 = *(void *)v35;
                do
                {
                  for (uint64_t j = 0; j != v29; ++j)
                  {
                    if (*(void *)v35 != v28) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * j);
                    long long v30 = 0u;
                    long long v31 = 0u;
                    long long v32 = 0u;
                    long long v33 = 0u;
                    id v14 = REEncodeIdentificationProperites();
                    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
                    if (v15)
                    {
                      uint64_t v16 = v15;
                      uint64_t v17 = *(void *)v31;
                      while (2)
                      {
                        for (uint64_t k = 0; k != v16; ++k)
                        {
                          if (*(void *)v31 != v17) {
                            objc_enumerationMutation(v14);
                          }
                          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * k);
                          char v20 = +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v13, v24);
                          unsigned int v21 = [v20 exportedValueForKey:v19];
                          uint64_t v22 = [v21 stringValue];

                          if (v22)
                          {
                            [v27 addObject:v22];

                            goto LABEL_29;
                          }
                        }
                        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
                        if (v16) {
                          continue;
                        }
                        break;
                      }
                    }
LABEL_29:
                  }
                  uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
                }
                while (v29);
              }

              uint64_t v7 = v27;
              v6 = (void *)[v27 copy];
              id v5 = v24;
              id v3 = v25;
              goto LABEL_32;
            }
          }
          v6 = (void *)[v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_32:
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)writeUnsupportedObject:(id)a3 toStream:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v10 objectValue];

    uint64_t v8 = (void *)v7;
  }
  else
  {
    uint64_t v8 = v10;
  }
  id v11 = v8;
  uint64_t v9 = [v8 description];
  [(REExportedValueEncoder *)self writeString:v9 toStream:v6];
}

- (BOOL)writesDictionaryHeader
{
  return 0;
}

- (BOOL)writesArrayHeader
{
  return 0;
}

@end