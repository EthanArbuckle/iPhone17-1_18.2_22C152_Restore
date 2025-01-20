@interface HashHelper
+ (HashHelper)hashHelper;
- (HashHelper)init;
- (char)addData:(CC_LONG)a3 withLength:;
- (char)addData:(char *)a1;
- (char)addDateComponents:(char *)a1;
- (char)addNumber:(char *)a1;
- (char)addObject:(char *)a1;
- (char)addString:(char *)a1;
- (char)getHash;
- (id)addArray:(void *)a1;
- (id)addDictionary:(void *)a1;
@end

@implementation HashHelper

+ (HashHelper)hashHelper
{
  self;
  v0 = objc_alloc_init(HashHelper);

  return v0;
}

- (HashHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)HashHelper;
  v2 = [(HashHelper *)&v5 init];
  v3 = v2;
  if (v2) {
    CC_SHA256_Init(&v2->ctx);
  }
  return v3;
}

- (char)getHash
{
  if (a1)
  {
    v2 = a1;
    v3 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x3417CE6CuLL);
    CC_SHA256_Final(v3, (CC_SHA256_CTX *)(v2 + 8));
    a1 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v3 length:32 freeWhenDone:1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (char)addData:(CC_LONG)a3 withLength:
{
  if (a1)
  {
    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), a2, a3);
    v4 = a1;
  }

  return a1;
}

- (char)addData:(char *)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = (const void *)[v3 bytes];
    CC_LONG v5 = [v3 length];

    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), v4, v5);
    v6 = a1;
  }

  return a1;
}

- (char)addString:(char *)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = (const void *)[v3 UTF8String];
    CC_LONG v5 = [v3 lengthOfBytesUsingEncoding:4];

    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), v4, v5);
    v6 = a1;
  }

  return a1;
}

- (char)addNumber:(char *)a1
{
  if (a1)
  {
    uint64_t data = [a2 longLongValue];
    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), &data, 8u);
    id v3 = a1;
  }

  return a1;
}

- (id)addDictionary:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    CC_LONG v5 = [v3 allKeys];
    v6 = [v5 sortedArrayUsingSelector:sel_compare_];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__HashHelper_addDictionary___block_invoke;
    v9[3] = &unk_1E65AE3B8;
    v9[4] = a1;
    id v10 = v4;
    [v6 enumerateObjectsUsingBlock:v9];
    id v7 = a1;
  }

  return a1;
}

void __28__HashHelper_addDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(char **)(a1 + 32);
  id v4 = a2;
  id v5 = -[HashHelper addObject:](v3, v4);
  v6 = *(char **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];

  id v7 = -[HashHelper addObject:](v6, v8);
}

- (char)addObject:(char *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[HashHelper addData:](a1, v3);
      objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[HashHelper addString:](a1, v3);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[HashHelper addNumber:](a1, v3);
          objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[HashHelper addDictionary:](a1, v3);
            objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              -[HashHelper addArray:](a1, v3);
              objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                -[HashHelper addDateComponents:](a1, v3);
                objc_claimAutoreleasedReturnValue();
              }
              else
              {
                a1 = 0;
              }
            }
          }
        }
      }
    }
  }

  return a1;
}

- (id)addArray:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (id)-[HashHelper addObject:](a1, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    id v10 = a1;
  }

  return a1;
}

- (char)addDateComponents:(char *)a1
{
  if (a1)
  {
    id v3 = NSNumber;
    id v4 = a2;
    uint64_t v5 = [v3 numberWithInteger:[v4 year]];
    id v6 = -[HashHelper addNumber:](a1, v5);

    uint64_t v7 = [NSNumber numberWithInteger:[v4 month]];
    id v8 = -[HashHelper addNumber:](a1, v7);

    id v9 = [NSNumber numberWithInteger:[v4 day]];
    id v10 = -[HashHelper addNumber:](a1, v9);

    v11 = [NSNumber numberWithInteger:[v4 hour]];
    id v12 = -[HashHelper addNumber:](a1, v11);

    long long v13 = [NSNumber numberWithInteger:[v4 minute]];
    id v14 = -[HashHelper addNumber:](a1, v13);

    long long v15 = NSNumber;
    uint64_t v16 = [v4 second];

    uint64_t v17 = [v15 numberWithInteger:v16];
    id v18 = -[HashHelper addNumber:](a1, v17);

    v19 = a1;
  }

  return a1;
}

@end