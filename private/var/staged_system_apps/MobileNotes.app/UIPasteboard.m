@interface UIPasteboard
- (id)ic_dataForPasteboardTypes:(id)a3;
@end

@implementation UIPasteboard

- (id)ic_dataForPasteboardTypes:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqualToString:", @"com.apple.uikit.image", (void)v14) & 1) == 0)
        {
          v12 = [(UIPasteboard *)self dataForPasteboardType:v11 inItemSet:0];
          [v5 addObjectsFromArray:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

@end