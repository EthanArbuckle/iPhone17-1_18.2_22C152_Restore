@interface PKApplyActionContentActionItem
- (NSArray)items;
- (NSCopying)identifier;
- (NSString)contextPrimaryActionIdentifier;
- (PKApplyActionContentActionItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)odiAttributesDictionary;
@end

@implementation PKApplyActionContentActionItem

- (PKApplyActionContentActionItem)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKApplyActionContentActionItem;
  v5 = [(PKApplyActionContentActionItem *)&v25 init];
  if (v5)
  {
    v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"items"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          v14 = [PKApplyActionContentTextItem alloc];
          v15 = -[PKApplyActionContentTextItem initWithDictionary:](v14, "initWithDictionary:", v13, (void)v21);
          [v7 safelyAddObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"contextPrimaryActionIdentifier"];
    contextPrimaryActionIdentifier = v5->_contextPrimaryActionIdentifier;
    v5->_contextPrimaryActionIdentifier = (NSString *)v18;
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
  id v4 = self->_items;
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

- (NSCopying)identifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
        [v3 appendString:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (self->_contextPrimaryActionIdentifier) {
    objc_msgSend(v3, "appendString:");
  }
  long long v12 = objc_msgSend(v3, "copy", (void)v14);

  return (NSCopying *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKApplyActionContentActionItem allocWithZone:](PKApplyActionContentActionItem, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  uint64_t v8 = [(NSString *)self->_contextPrimaryActionIdentifier copyWithZone:a3];
  contextPrimaryActionIdentifier = v5->_contextPrimaryActionIdentifier;
  v5->_contextPrimaryActionIdentifier = (NSString *)v8;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)contextPrimaryActionIdentifier
{
  return self->_contextPrimaryActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPrimaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end