@interface UITabElementGroup
@end

@implementation UITabElementGroup

uint64_t __37___UITabElementGroup__isCustomizable__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 _isCustomizable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL __35___UITabElementGroup__setChildren___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

uint64_t __35___UITabElementGroup__setChildren___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isElement])
  {
    v4 = [v3 _identifier];
    v5 = [*(id *)(a1 + 32) _identifier];
    id v6 = v4;
    id v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 0;
      if (v6 && v7) {
        uint64_t v9 = [v6 isEqual:v7];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __54___UITabElementGroup__orderedChildrenForDisplayOrder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 _identifier];
  LODWORD(a1) = [v7 isEqualToString:*(void *)(a1 + 32)];

  *a4 = a1;
  if (a1) {
    uint64_t v8 = [v6 _isAction] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void __42___UITabElementGroup__defaultChildElement__block_invoke(void *a1, void *a2, uint64_t a3, char *a4)
{
  id v10 = a2;
  id v7 = [v10 _identifier];
  int v8 = [v7 isEqualToString:a1[4]];

  if (v8)
  {
    if ([v10 _isElement] && objc_msgSend(v10, "_isVisible")) {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  if (!*(void *)(*(void *)(a1[7] + 8) + 40)
    && [v10 _isElement]
    && [v10 _isVisible])
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  }
  char v9 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
  if (v9)
  {
    if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
      char v9 = 1;
    }
    else {
      char v9 = *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
    }
  }
  *a4 = v9;
}

uint64_t __54___UITabElementGroup__filteredDisplayOrderIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end