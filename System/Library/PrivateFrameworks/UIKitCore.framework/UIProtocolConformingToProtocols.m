@interface UIProtocolConformingToProtocols
@end

@implementation UIProtocolConformingToProtocols

void ___UIProtocolConformingToProtocols_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ___UIProtocolConformingToProtocols_block_invoke_2;
  v28[3] = &unk_1E530E0E0;
  id v29 = v2;
  v3 = [v29 sortedArrayUsingComparator:v28];
  v4 = [MEMORY[0x1E4F28E78] string];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "appendFormat:", @"_%s", protocol_getName(*(Protocol **)(*((void *)&v24 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v7);
  }

  id v10 = v4;
  uint64_t v11 = objc_getProtocol((const char *)[v10 UTF8String]);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v14 = (Protocol *)objc_allocateProtocol((const char *)[v10 UTF8String]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          protocol_addProtocol(v14, *(Protocol **)(*((void *)&v20 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v17);
    }

    objc_registerProtocol(v14);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v14);
  }
}

uint64_t ___UIProtocolConformingToProtocols_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  Name = protocol_getName(v5);
  uint64_t v8 = protocol_getName(v6);

  int v9 = strcmp(Name, v8);
  if (v9 < 0)
  {
    uint64_t v10 = -1;
  }
  else if (v9)
  {
    uint64_t v10 = 1;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"List of protocols %@ includes %@ twice", *(void *)(a1 + 32), v5 format];
    uint64_t v10 = 0;
  }

  return v10;
}

@end