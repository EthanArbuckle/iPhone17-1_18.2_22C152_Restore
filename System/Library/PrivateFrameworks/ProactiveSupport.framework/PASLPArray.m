@interface PASLPArray
@end

@implementation PASLPArray

void __32___PASLPArray_getObjects_range___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v4 = [WeakRetained bytes];
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v6 = *(void *)(a1[4] + 16);
      if (v6) {
        unint64_t v6 = *(void *)(v6 + 16);
      }
      if (i >= v6) {
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
      uint64_t v9 = 8 * *(void *)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v9];
    uint64_t v11 = [v10 mutableBytes];
    for (unint64_t j = 0; ; ++j)
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void *)(v13 + 16);
      unint64_t v15 = v14 ? *(void *)(v14 + 16) : 0;
      if (j >= v15) {
        break;
      }
      objc_msgSend(*(id *)(v13 + 8), "objectAtIndex:usingArrayContext:", j);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      *(void *)(v11 + 8 * j) = CFAutorelease(v16);
    }
    v17 = (id *)(v13 + 24);
    id v3 = v10;
    objc_storeWeak(v17, v3);
  }
  id v18 = v3;
  CFAutorelease(v18);
  objc_msgSend(v18, "getBytes:range:", a1[5], 8 * a1[6], 8 * a1[7]);
}

@end