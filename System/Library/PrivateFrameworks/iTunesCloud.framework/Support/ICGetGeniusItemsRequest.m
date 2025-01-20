@interface ICGetGeniusItemsRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5;
- (ICGetGeniusItemsRequest)initWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICGetGeniusItemsRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:*(void *)&a3 seedID:a4 numberOfItems:*(void *)&a5];

  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  id v5 = +[ICDResponseDataParser parseResponseData:v4];

  id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "objectForKey:", @"dmap.longitemid", (void)v15);
        if (!v13)
        {
          v13 = [v12 objectForKey:@"dmap.itemid"];
          if (!v13) {
            continue;
          }
        }
        [v6 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v3 setItemIDs:v6];

  return v3;
}

- (ICGetGeniusItemsRequest)initWithDatabaseID:(unsigned int)a3 seedID:(unint64_t)a4 numberOfItems:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = +[NSString stringWithFormat:@"databases/%u/getgeniusitems", *(void *)&a3];
  id v9 = [(ICDRequest *)self initWithAction:v8];

  if (v9)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"%llu", a4];
    [(ICDRequest *)v9 setValue:v10 forArgument:@"seed-id"];

    v11 = +[NSString stringWithFormat:@"%u", v5];
    [(ICDRequest *)v9 setValue:v11 forArgument:@"num-items"];
  }
  return v9;
}

@end