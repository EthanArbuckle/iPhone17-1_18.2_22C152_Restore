@interface ISPersonalizeOffersRequest
- (ISPersonalizeOffersRequest)initWithItems:(id)a3;
- (NSArray)allItemTypes;
- (NSNumber)accountIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemIdentifiersForItemType:(id)a3;
- (void)addItemIdentifier:(id)a3 forItemType:(id)a4;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
@end

@implementation ISPersonalizeOffersRequest

- (ISPersonalizeOffersRequest)initWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)ISPersonalizeOffersRequest;
  v4 = [(ISPersonalizeOffersRequest *)&v18 init];
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(a3);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "ITunesStoreIdentifier"), "stringValue");
          uint64_t v11 = [v9 itemKind];
          if (v10) {
            BOOL v12 = v11 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12) {
            [(ISPersonalizeOffersRequest *)v4 addItemIdentifier:v10 forItemType:v11];
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISPersonalizeOffersRequest;
  [(ISPersonalizeOffersRequest *)&v3 dealloc];
}

- (void)addItemIdentifier:(id)a3 forItemType:(id)a4
{
  itemIDsByType = self->_itemIDsByType;
  if (!itemIDsByType)
  {
    itemIDsByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_itemIDsByType = itemIDsByType;
  }
  id v8 = (id)[(NSMutableDictionary *)itemIDsByType objectForKey:a4];
  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(NSMutableDictionary *)self->_itemIDsByType setObject:v9 forKey:a4];
    id v8 = v9;
  }
  id v10 = v8;
  [v8 addObject:a3];
}

- (NSArray)allItemTypes
{
  return (NSArray *)[(NSMutableDictionary *)self->_itemIDsByType allKeys];
}

- (id)itemIdentifiersForItemType:(id)a3
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_itemIDsByType objectForKey:a3];

  return (id)[v3 allObjects];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  v5[2] = [(NSMutableDictionary *)self->_itemIDsByType mutableCopyWithZone:a3];
  return v5;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

@end