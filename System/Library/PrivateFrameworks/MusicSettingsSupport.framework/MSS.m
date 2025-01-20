@interface MSS
@end

@implementation MSS

void ___MSS_resolvedSpecifiers_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  v13 = v5;
  if (objc_opt_isKindOfClass())
  {
    v29[0] = v5;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = ___MSS_resolvedSpecifiers_block_invoke_3;
        v14[3] = &unk_264CBF6E0;
        id v15 = *(id *)(a1 + 32);
        id v16 = *(id *)(a1 + 40);
        v17 = &v22;
        [v10 enumerateKeysAndObjectsUsingBlock:v14];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v7);
  }

  v11 = (void *)v23[5];
  if (v11) {
    _MSS_setValue_forSpecifier_key(*(void **)(a1 + 32), v11, *(void **)(a1 + 40), v12);
  }
  _Block_object_dispose(&v22, 8);
}

void ___MSS_resolvedSpecifiers_block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v8 = (void *)a1[4];
  v9 = (void *)a1[5];
  id v10 = a3;
  int hasMusicRequiredCapabilities_specifier = _MSS_hasMusicRequiredCapabilities_specifier(v8, v10, v9);
  id v12 = [v10 objectForKey:*MEMORY[0x263F60210]];

  if (v12)
  {
    if (hasMusicRequiredCapabilities_specifier && (SystemHasCapabilities() & 1) != 0) {
      goto LABEL_4;
    }
  }
  else if (hasMusicRequiredCapabilities_specifier)
  {
LABEL_4:
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

void ___MSS__hasMusicRequiredCapabilities_specifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = _MSS_valueForRequirementKey_specifier(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = [v5 isEqual:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  else
  {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
}

@end