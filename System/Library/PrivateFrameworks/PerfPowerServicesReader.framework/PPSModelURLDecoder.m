@interface PPSModelURLDecoder
+ (BOOL)isDecodableMetric:(id)a3;
+ (id)decodeValue:(id)a3 withMetric:(id)a4;
+ (id)prefixDecodingDictionary;
@end

@implementation PPSModelURLDecoder

+ (BOOL)isDecodableMetric:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 category];
    if ([&unk_270714A28 containsObject:v5])
    {
      v6 = [v4 name];
      if ([v6 isEqualToString:@"modelURL"])
      {
        v7 = [v4 subsystem];
        char v8 = [v7 isEqualToString:@"ANE"];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)prefixDecodingDictionary
{
  if (prefixDecodingDictionary_onceToken != -1) {
    dispatch_once(&prefixDecodingDictionary_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)prefixDecodingDictionary_modelURLPrefixDecoder;
  return v2;
}

void __46__PPSModelURLDecoder_prefixDecodingDictionary__block_invoke()
{
  v0 = (void *)prefixDecodingDictionary_modelURLPrefixDecoder;
  prefixDecodingDictionary_modelURLPrefixDecoder = (uint64_t)&unk_270714A40;
}

+ (id)decodeValue:(id)a3 withMetric:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v5 length] > 1)
    {
      id v24 = v6;
      char v8 = [MEMORY[0x263F089D8] string];
      v9 = +[PPSModelURLDecoder prefixDecodingDictionary];
      v23 = [v5 componentsSeparatedByString:@"/"];
      v10 = [v23 objectAtIndex:0];
      uint64_t v11 = [v10 length];
      if (v11)
      {
        unint64_t v12 = v11;
        unint64_t v13 = 0;
        unint64_t v14 = v11;
        while (1)
        {
          unint64_t v15 = v14 - 2;
          uint64_t v16 = v14 >= 2 ? 2 : v14;
          v17 = objc_msgSend(v10, "substringWithRange:", v13, v16);
          uint64_t v18 = [v9 objectForKey:v17];
          if (!v18) {
            break;
          }
          v19 = (void *)v18;
          [v8 appendString:v18];

          v13 += 2;
          unint64_t v14 = v15;
          if (v12 <= v13) {
            goto LABEL_13;
          }
        }
        id v7 = v5;

        v20 = v23;
        id v6 = v24;
      }
      else
      {
LABEL_13:
        v20 = v23;
        if ((unint64_t)[v23 count] >= 2)
        {
          v21 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v10, "length"));
          [v8 appendString:v21];
        }
        id v7 = v8;
        id v6 = v24;
      }
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end