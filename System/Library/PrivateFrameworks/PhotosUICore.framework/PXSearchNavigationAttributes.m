@interface PXSearchNavigationAttributes
+ (id)attributesForURLComponents:(id)a3;
+ (id)attributesWithGenericSearchTerm:(id)a3;
+ (id)attributesWithGenericSearchText:(id)a3;
- (NSArray)searchCategories;
- (NSArray)searchTerms;
- (NSString)completionKey;
- (NSString)searchText;
@end

@implementation PXSearchNavigationAttributes

+ (id)attributesWithGenericSearchText:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v6 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v6 + 3, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)attributesWithGenericSearchTerm:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init((Class)a1);
    v13[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 0);
    v12 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v10 = (void *)v5[2];
    v5[2] = v9;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)attributesForURLComponents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = a3;
  v3 = [v20 queryItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {
    id obj = 0;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  id obj = 0;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v7 = *(void *)v23;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v11 = [v10 name];
      if ([v11 isEqualToString:@"searchTerm"])
      {
        v12 = [v10 value];
        uint64_t v13 = [v12 componentsSeparatedByString:@","];

        v8 = (void *)v13;
      }
      else if ([v11 isEqualToString:@"searchCategory"])
      {
        v12 = [v10 value];
        uint64_t v14 = [v12 componentsSeparatedByString:@","];

        uint64_t v6 = (void *)v14;
      }
      else
      {
        if (![v11 isEqualToString:@"completionKey"]) {
          goto LABEL_13;
        }
        [v10 value];
        v12 = obj;
        id obj = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_13:
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v5);
LABEL_17:

  if ([v8 count])
  {
    v15 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v15 + 1, v8);
    objc_storeStrong(v15 + 2, v6);
    v16 = obj;
    objc_storeStrong(v15 + 4, obj);
  }
  else
  {
    v15 = 0;
    v16 = obj;
  }
  v17 = v15;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionKey, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

- (NSString)completionKey
{
  return self->_completionKey;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

@end