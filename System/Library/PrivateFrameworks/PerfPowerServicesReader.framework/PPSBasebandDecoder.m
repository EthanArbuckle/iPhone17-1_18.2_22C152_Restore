@interface PPSBasebandDecoder
+ (BOOL)isDecodableMetric:(id)a3;
+ (id)decodeValue:(id)a3 withMetric:(id)a4;
+ (id)flattenResult:(id)a3 withParentKey:(id)a4;
+ (id)hexStringToRawData:(id)a3;
+ (id)transformPayload:(id)a3;
@end

@implementation PPSBasebandDecoder

+ (BOOL)isDecodableMetric:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "deviceCapability"));
  char v4 = [&unk_2707149C8 containsObject:v3];

  return v4;
}

+ (id)decodeValue:(id)a3 withMetric:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && +[PPSBasebandDecoder isDecodableMetric:v6])
  {
    if (([v6 deviceCapability] & 0xFFFFFFFE) == 0x12)
    {
      v7 = +[PPSBasebandDecoder hexStringToRawData:v5];
      v8 = [[AWDMETRICSCellularPowerLog alloc] initWithData:v7];
      v9 = [(AWDMETRICSCellularPowerLog *)v8 dictionaryRepresentation];
    }
    else
    {
      v9 = 0;
    }
    v11 = +[PPSBasebandDecoder transformPayload:v9];
    v10 = +[PPSBasebandDecoder flattenResult:v11 withParentKey:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)hexStringToRawData:(id)a3
{
  id v3 = a3;
  __str[2] = 0;
  int v4 = [v3 length];
  if (v4 >= 0) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  id v6 = [MEMORY[0x263EFF990] dataWithCapacity:(uint64_t)v5 >> 1];
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = v3;
      __str[0] = *(unsigned char *)([v8 UTF8String] + v7);
      __str[1] = *(unsigned char *)([v8 UTF8String] + v7 + 1);
      unint64_t v10 = 0;
      unint64_t v10 = strtoul(__str, 0, 16);
      [v6 appendBytes:&v10 length:1];
      v7 += 2;
    }
    while ((int)v7 < v4);
  }

  return v6;
}

+ (id)transformPayload:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__PPSBasebandDecoder_transformPayload___block_invoke;
  v6[3] = &unk_2654432A8;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  int v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__PPSBasebandDecoder_transformPayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v18 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, v18);
              [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v16 forKeyedSubscript:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
  v17 = v18;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v18, @"metric_name", v18);
}

+ (id)flattenResult:(id)a3 withParentKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  long long v20 = __Block_byref_object_dispose__0;
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __50__PPSBasebandDecoder_flattenResult_withParentKey___block_invoke;
  uint64_t v13 = &unk_2654432D0;
  id v7 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];
  if (objc_msgSend((id)v17[5], "count", v10, v11, v12, v13)) {
    id v8 = (void *)[(id)v17[5] copy];
  }
  else {
    id v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __50__PPSBasebandDecoder_flattenResult_withParentKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) length])
  {
    id v6 = [NSString stringWithFormat:@"%@.%@", *(void *)(a1 + 32), v9];
  }
  else
  {
    id v6 = v9;
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = +[PPSBasebandDecoder flattenResult:v5 withParentKey:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v8];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

@end