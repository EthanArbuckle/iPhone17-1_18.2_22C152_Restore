@interface IKViewElement(VSAdditions)
- (id)vs_itemElementsOfType:()VSAdditions;
- (uint64_t)vs_BOOLAttributeValueForKey:()VSAdditions;
- (uint64_t)vs_selectedChildElementIndex;
@end

@implementation IKViewElement(VSAdditions)

- (id)vs_itemElementsOfType:()VSAdditions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(a1, "children", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "vs_elementType") == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)vs_BOOLAttributeValueForKey:()VSAdditions
{
  id v4 = a3;
  id v5 = [a1 attributes];
  v6 = [v5 valueForKey:v4];

  if (v6)
  {
    if ([v6 isEqualToString:@"on"]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = [v6 BOOLValue];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)vs_selectedChildElementIndex
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v1 = [a1 children];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__IKViewElement_VSAdditions__vs_selectedChildElementIndex__block_invoke;
  v4[3] = &unk_265077C70;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end