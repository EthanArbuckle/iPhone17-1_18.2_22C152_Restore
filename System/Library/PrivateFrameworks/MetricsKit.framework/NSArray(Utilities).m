@interface NSArray(Utilities)
- (id)mt_condensedArray;
- (id)mt_deepCopy;
- (id)mt_map:()Utilities;
- (unint64_t)mt_verifyEventData;
@end

@implementation NSArray(Utilities)

- (id)mt_map:()Utilities
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          v12 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)mt_verifyEventData
{
  unint64_t result = [a1 count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      v4 = [a1 objectAtIndexedSubscript:i];
      v5 = [MEMORY[0x263EFF9D0] null];
      if (v4 == v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          id v13 = MTConfigurationError(108, @"Event data item at index %ld is of invalid type %@. Event data items must be of NSDictionary or MTPromise type.", v7, v8, v9, v10, v11, v12, i);
        }
      }

      unint64_t result = [a1 count];
    }
  }
  return result;
}

- (id)mt_deepCopy
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 count];
  uint64_t v3 = 8 * v2;
  v4 = (char *)v11 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v2);
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      id v6 = [a1 objectAtIndexedSubscript:i];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = objc_msgSend(v6, "mt_deepCopy");

        id v6 = (void *)v7;
      }
      uint64_t v8 = *(void **)&v4[8 * i];
      *(void *)&v4[8 * i] = v6;
    }
  }
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:v2];
  if (v2)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v9;
}

- (id)mt_condensedArray
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v6 && v7) {
            id v6 = (void *)[v7 mutableCopy];
          }
          if (v6)
          {
            [v6 addEntriesFromDictionary:v10];
          }
          else
          {
            id v12 = v10;

            uint64_t v7 = v12;
          }
        }
        else
        {
          if (v6)
          {
            uint64_t v11 = (void *)[v6 copy];
            [v2 addObject:v11];
          }
          else if (v7)
          {
            objc_msgSend(v2, "addObject:", v7, (void)v16);
          }

          [v2 addObject:v10];
          id v6 = 0;
          uint64_t v7 = 0;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);

    if (v6)
    {
      id v13 = (void *)[v6 copy];
      [v2 addObject:v13];

      goto LABEL_26;
    }
    if (v7) {
      [v2 addObject:v7];
    }
  }
  else
  {

    uint64_t v7 = 0;
  }
  id v6 = 0;
LABEL_26:
  long long v14 = objc_msgSend(v2, "copy", (void)v16);

  return v14;
}

@end