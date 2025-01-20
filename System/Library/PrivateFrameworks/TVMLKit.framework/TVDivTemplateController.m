@interface TVDivTemplateController
@end

@implementation TVDivTemplateController

id __46___TVDivTemplateController__updateContentView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "tv_associatedIKViewElement", (void)v11);
        if ([v9 isEqual:v3])
        {
          id v5 = v8;

          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

id __46___TVDivTemplateController__updateContentView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  id v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46___TVDivTemplateController__updateContentView__block_invoke_3;
  v6[3] = &unk_264BA7E40;
  v6[4] = &v7;
  v6[5] = a2;
  [v3 enumerateObjectsUsingBlock:v6];
  if (v8[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    [*(id *)(a1 + 32) removeObjectAtIndex:v8[3]];
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46___TVDivTemplateController__updateContentView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a2, "tv_elementType");
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

@end