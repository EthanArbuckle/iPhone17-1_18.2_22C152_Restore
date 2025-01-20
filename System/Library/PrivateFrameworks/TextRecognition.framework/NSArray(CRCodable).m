@interface NSArray(CRCodable)
- (id)crCodableDataRepresentation;
- (id)initWithCRCodableDataRepresentation:()CRCodable objectProviderBlock:;
@end

@implementation NSArray(CRCodable)

- (id)crCodableDataRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [a1 count];
  v2 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v15 length:8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

          id v9 = 0;
          goto LABEL_11;
        }
        +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v8, v2, (void)v11);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = v2;
LABEL_11:

  return v9;
}

- (id)initWithCRCodableDataRepresentation:()CRCodable objectProviderBlock:
{
  id v6 = a3;
  v7 = a4;
  if (v6)
  {
    uint64_t v14 = 0;
    unint64_t v8 = +[CRCodingUtilities unsignedIntegerFromEncodingData:v6 offset:&v14];
    for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    {
      v10 = +[CRCodingUtilities objectDataFromEncodingData:v6 offset:&v14];
      long long v11 = v7[2](v7, v10);
      if (v11) {
        [i addObject:v11];
      }
    }
    a1 = (id)[a1 initWithArray:i];

    id v12 = a1;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end