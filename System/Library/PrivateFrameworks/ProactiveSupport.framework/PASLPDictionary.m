@interface PASLPDictionary
@end

@implementation PASLPDictionary

void __45___PASLPDictionary_getObjects_andKeys_count___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v4 = [WeakRetained bytes];
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v6 = *(void *)(a1[4] + 16);
      if (v6) {
        uint64_t v6 = *(void *)(v6 + 16);
      }
      if (i >= 2 * v6) {
        break;
      }
      CFTypeRef v7 = CFRetain(*(CFTypeRef *)(v4 + 8 * i));
      CFAutorelease(v7);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1[4] + 16);
    if (v8) {
      uint64_t v9 = 16 * *(void *)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    id v22 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v9];
    uint64_t v10 = [v22 mutableBytes];
    uint64_t v11 = v10;
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 16);
    }
    else {
      uint64_t v14 = 0;
    }
    unint64_t v15 = 0;
    uint64_t v16 = v10 + 8 * v14;
    if (!v13) {
      goto LABEL_15;
    }
LABEL_12:
    for (unint64_t j = *(void *)(v13 + 16); v15 < j; unint64_t j = 0)
    {
      objc_msgSend(*(id *)(v12 + 8), "keyAtIndex:usingDictionaryContext:", v15);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      *(void *)(v16 + 8 * v15) = CFAutorelease(v18);

      id v19 = [*(id *)(a1[4] + 8) objectAtIndex:v15 usingDictionaryContext:*(void *)(a1[4] + 16)];
      *(void *)(v11 + 8 * v15) = CFAutorelease(v19);

      ++v15;
      uint64_t v12 = a1[4];
      uint64_t v13 = *(void *)(v12 + 16);
      if (v13) {
        goto LABEL_12;
      }
LABEL_15:
      ;
    }
    v20 = (id *)(v12 + 24);
    id v3 = v22;
    objc_storeWeak(v20, v3);
  }
  id v23 = v3;
  CFAutorelease(v23);
  uint64_t v21 = a1[5];
  if (v21) {
    objc_msgSend(v23, "getBytes:range:", v21, 0, 8 * a1[6]);
  }
  if (a1[7]) {
    objc_msgSend(v23, "getBytes:range:");
  }
}

void __40___PASLPDictionary_isEqualToDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  CFTypeRef v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v7 || ([v8 isEqual:v7] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __37___PASLPDictionary_allKeysForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isEqual:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __29___PASLPDictionary_allValues__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __27___PASLPDictionary_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end