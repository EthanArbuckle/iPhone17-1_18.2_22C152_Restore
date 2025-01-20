@interface PKApplyActionContent
- (NSArray)actionItems;
- (PKApplyActionContent)initWithDictionary:(id)a3;
- (PKApplyFooterContent)footerContent;
- (id)analyticsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)odiAttributesDictionary;
@end

@implementation PKApplyActionContent

- (PKApplyActionContent)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKApplyActionContent;
  v5 = [(PKApplyActionContent *)&v26 init];
  if (v5)
  {
    v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"actionItems"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
          v14 = [PKApplyActionContentActionItem alloc];
          v15 = -[PKApplyActionContentActionItem initWithDictionary:](v14, "initWithDictionary:", v13, (void)v22);
          [v7 safelyAddObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 copy];
    actionItems = v5->_actionItems;
    v5->_actionItems = (NSArray *)v16;

    v18 = [v4 PKDictionaryForKey:@"footerContent"];
    if ([v18 count])
    {
      v19 = [[PKApplyFooterContent alloc] initWithDictionary:v18];
      footerContent = v5->_footerContent;
      v5->_footerContent = v19;
    }
  }

  return v5;
}

- (id)odiAttributesDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_actionItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "odiAttributesDictionary", (void)v11);
        [v3 addEntriesFromDictionary:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)analyticsDictionary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_actionItems;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v9 = [v8 items];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [*(id *)(*((void *)&v18 + 1) + 8 * j) analyticsIdentifier];
              [v3 safelySetObject:@"true" forKey:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  v15 = (void *)[v3 copy];
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKApplyActionContent allocWithZone:](PKApplyActionContent, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_actionItems copyWithZone:a3];
  actionItems = v5->_actionItems;
  v5->_actionItems = (NSArray *)v6;

  id v8 = [(PKApplyFooterContent *)self->_footerContent copyWithZone:a3];
  footerContent = v5->_footerContent;
  v5->_footerContent = v8;

  return v5;
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
}

@end