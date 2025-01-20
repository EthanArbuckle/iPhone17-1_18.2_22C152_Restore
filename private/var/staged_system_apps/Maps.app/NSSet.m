@interface NSSet
- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4;
- (id)_maps_searchResultMemberEqualToResult:(id)a3 forPurpose:(int64_t)a4;
@end

@implementation NSSet

- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = v6;
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = v7;
    id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v8, "isEqualToSearchResult:forPurpose:", v14, a4, (void)v17) & 1) != 0)
          {
            v15 = v14;

            v9 = v15;
            goto LABEL_14;
          }
        }
        id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_14:
  }
  else
  {
    v15 = 0;
  }

  return v15 != 0;
}

- (id)_maps_searchResultMemberEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = v6;
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = v7;
    id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v8, "isEqualToSearchResult:forPurpose:", v14, a4, (void)v17) & 1) != 0)
          {
            id v15 = v14;
            goto LABEL_14;
          }
        }
        id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_14:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end