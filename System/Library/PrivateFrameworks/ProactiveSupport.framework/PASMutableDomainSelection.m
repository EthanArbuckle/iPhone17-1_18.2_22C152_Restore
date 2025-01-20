@interface PASMutableDomainSelection
@end

@implementation PASMutableDomainSelection

void __64___PASMutableDomainSelection__decrementCountAndMaybePruneItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count]) {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else {
    --*(void *)(*(void *)(a1 + 32) + 16);
  }
}

void __104___PASMutableDomainSelection__addDomainsFromOtherDictionary_toOwnDictionary_ownDictionaryIsPlaceholder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
  if (v6)
  {
    v7 = (void *)v6;
    char v8 = [*(id *)(a1 + 40) _addDomainsFromOtherDictionary:v5 toOwnDictionary:v6 ownDictionaryIsPlaceholder:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v10 = (v8 & 1) != 0 || *(unsigned char *)(v9 + 24) != 0;
    *(unsigned char *)(v9 + 24) = v10;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v7 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v13];
    uint64_t v11 = [v5 count];
    v12 = *(void **)(a1 + 40);
    if (v11) {
      [v12 _addDomainsFromOtherDictionary:v5 toOwnDictionary:v7 ownDictionaryIsPlaceholder:1];
    }
    else {
      ++v12[2];
    }
  }
}

void __40___PASMutableDomainSelection_allDomains__block_invoke(void *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 count];
  v7 = (void *)MEMORY[0x1A62450A0]();
  if (v6)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = a1[5];
    BOOL v10 = objc_msgSend(v15, "_pas_revivedString");
    uint64_t v11 = (void *)[v8 initWithFormat:@"%@%@.", v9, v10];

    v12 = (void *)a1[6];
    +[_PASTuple2 tupleWithFirst:v5 second:v11];
  }
  else
  {
    v12 = (void *)a1[4];
    id v13 = (void *)a1[5];
    uint64_t v11 = objc_msgSend(v15, "_pas_revivedString");
    [v13 stringByAppendingString:v11];
  v14 = };
  [v12 addObject:v14];
}

@end