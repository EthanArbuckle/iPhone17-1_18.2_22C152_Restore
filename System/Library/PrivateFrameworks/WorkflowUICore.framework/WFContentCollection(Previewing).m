@interface WFContentCollection(Previewing)
- (id)previewProxyItemAtIndex:()Previewing refreshBlock:;
- (void)generatePreviewControllerDataSource:()Previewing;
@end

@implementation WFContentCollection(Previewing)

- (id)previewProxyItemAtIndex:()Previewing refreshBlock:
{
  id v6 = a4;
  v7 = objc_getAssociatedObject(a1, &proxiesKey);
  if (!v7)
  {
    v7 = [MEMORY[0x263F08A88] strongObjectsPointerArray];
    v8 = [a1 items];
    objc_msgSend(v7, "setCount:", objc_msgSend(v8, "count"));

    objc_setAssociatedObject(a1, &proxiesKey, v7, (void *)1);
  }
  if ([v7 count] > a3 && !objc_msgSend(v7, "pointerAtIndex:", a3))
  {
    v9 = objc_opt_new();
    v10 = [a1 items];
    v11 = [v10 objectAtIndex:a3];
    [v9 setItem:v11];

    [v9 setRefreshBlock:v6];
    [v7 replacePointerAtIndex:a3 withPointer:v9];
    v12 = objc_getAssociatedObject(a1, &originalCollectionKey);
    if ([v12 numberOfItems] <= (uint64_t)a3)
    {
      id v14 = 0;
    }
    else
    {
      v13 = [v12 items];
      id v14 = [v13 objectAtIndex:a3];

      if (v14)
      {
        v15 = [v9 item];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          uint64_t v20 = MEMORY[0x263EF8330];
          uint64_t v21 = 3221225472;
          v22 = __72__WFContentCollection_Previewing__previewProxyItemAtIndex_refreshBlock___block_invoke;
          v23 = &unk_264C50DE8;
          id v24 = v9;
          id v14 = v14;
          id v25 = v14;
          [v14 prepareForPresentationWithCompletionHandler:&v20];
        }
      }
    }
  }
  if (objc_msgSend(v7, "count", v20, v21, v22, v23) <= a3) {
    v17 = 0;
  }
  else {
    v17 = (void *)[v7 pointerAtIndex:a3];
  }
  id v18 = v17;

  return v18;
}

- (void)generatePreviewControllerDataSource:()Previewing
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_8;
    v7[3] = &unk_264C50C20;
    v7[4] = a1;
    uint64_t v9 = a2;
    id v8 = v5;
    [a1 transformItemsUsingBlock:&__block_literal_global_274 completionHandler:v7];
  }
}

@end