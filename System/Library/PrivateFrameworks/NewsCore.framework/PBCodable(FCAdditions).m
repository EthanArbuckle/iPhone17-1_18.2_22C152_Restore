@interface PBCodable(FCAdditions)
- (__CFString)hexStringFromData:()FCAdditions;
- (id)logMessage;
- (id)logMessageDictionaryFromProtobufDictionary:()FCAdditions;
@end

@implementation PBCodable(FCAdditions)

- (id)logMessage
{
  v2 = [a1 dictionaryRepresentation];
  v3 = [a1 logMessageDictionaryFromProtobufDictionary:v2];
  v4 = [v3 description];

  return v4;
}

- (id)logMessageDictionaryFromProtobufDictionary:()FCAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v2 objectForKeyedSubscript:v8];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        v11 = [v2 objectForKeyedSubscript:v8];
        if (isKindOfClass)
        {
          uint64_t v12 = [a1 hexStringFromData:v11];
        }
        else
        {
          objc_opt_class();
          char v13 = objc_opt_isKindOfClass();

          if ((v13 & 1) == 0) {
            continue;
          }
          v11 = [v2 objectForKeyedSubscript:v8];
          uint64_t v12 = [a1 logMessageDictionaryFromProtobufDictionary:v11];
        }
        v14 = (void *)v12;
        [v2 setObject:v12 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v2;
}

- (__CFString)hexStringFromData:()FCAdditions
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (unsigned __int8 *)[v3 bytes];
    v7 = (char *)malloc_type_malloc((2 * v5) | 1, 0x100004077774924uLL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 2 * v5;
      v10 = v7 + 1;
      do
      {
        unsigned int v11 = *v6++;
        *(v10 - 1) = a0123456789abcd[(unint64_t)v11 >> 4];
        unsigned char *v10 = a0123456789abcd[v11 & 0xF];
        v10 += 2;
        --v5;
      }
      while (v5);
      v7[v9] = 0;
      uint64_t v12 = [NSString stringWithUTF8String:v7];
      free(v8);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = &stru_1EF8299B8;
  }

  return v12;
}

@end