@interface GEOSubactionMetaData
+ (id)subactionMetaDataWithChildItems:(id)a3 selectedChildItemIndexPath:(id)a4;
@end

@implementation GEOSubactionMetaData

+ (id)subactionMetaDataWithChildItems:(id)a3 selectedChildItemIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)GEOSubactionMetaData);
  v25 = v6;
  if (v6) {
    uint64_t v8 = (uint64_t)[v6 row];
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  [v7 setSelectedSubactionIndex:v8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v15 = +[ChildItemButton buttonTitleWithChildItem:v14];
        [v7 addDisplayedText:v15];

        v16 = [v14 childItemAction];

        if (v16)
        {
          v17 = [v14 childItemAction];
          v18 = [v14 childItemAction];
          v19 = [v17 childActionTypeAsString:[v18 childActionType]];
          [v7 addChildItemSubactionType:v19];
        }
        id v20 = [v14 childItemType];
        if (v20 == (id)1)
        {
          uint64_t v23 = 2;
          goto LABEL_18;
        }
        if (v20 == (id)3)
        {
          uint64_t v23 = 3;
          goto LABEL_18;
        }
        if (v20 == (id)2)
        {
          v21 = [v14 childItemAction];
          v22 = (char *)[v21 childActionType];

          if ((unint64_t)(v22 - 1) < 8)
          {
            uint64_t v23 = dword_100F6F498[(void)(v22 - 1)];
LABEL_18:
            [v7 addSubaction:v23];
            continue;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  return v7;
}

@end