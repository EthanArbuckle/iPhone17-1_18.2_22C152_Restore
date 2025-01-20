@interface SUUIPageComponentContext
- (BOOL)isUnavailableItemIdentifier:(id)a3;
- (NSArray)ineligibleGratisIdentifiers;
- (NSDictionary)componentDictionary;
- (NSDictionary)items;
- (NSDictionary)platformKeyProfileOverrides;
- (NSSet)allUnavailableItemIdentifiers;
- (SUUIPageComponentContext)init;
- (double)pageGenerationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemForItemIdentifier:(id)a3;
- (int64_t)layoutStyle;
- (void)addUnavailableItemIdentifiers:(id)a3;
- (void)setComponentDictionary:(id)a3;
- (void)setIneligibleGratisIdentifiers:(id)a3;
- (void)setItems:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setPlatformKeyProfileOverrides:(id)a3;
- (void)setUnavailableItemIdentifiers:(id)a3;
@end

@implementation SUUIPageComponentContext

- (SUUIPageComponentContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIPageComponentContext;
  v2 = [(SUUIPageComponentContext *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F82670] currentDevice];
    BOOL v4 = [v3 userInterfaceIdiom] == 1;

    v2->_layoutStyle = v4;
    v2->_pageGenerationTime = CFAbsoluteTimeGetCurrent();
  }
  return v2;
}

- (void)addUnavailableItemIdentifiers:(id)a3
{
  id v4 = a3;
  unavailableItems = self->_unavailableItems;
  id v8 = v4;
  if (!unavailableItems)
  {
    objc_super v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v7 = self->_unavailableItems;
    self->_unavailableItems = v6;

    id v4 = v8;
    unavailableItems = self->_unavailableItems;
  }
  [(NSMutableSet *)unavailableItems addObjectsFromArray:v4];
}

- (BOOL)isUnavailableItemIdentifier:(id)a3
{
  return [(NSMutableSet *)self->_unavailableItems containsObject:a3];
}

- (id)itemForItemIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_unavailableItems containsObject:v4])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSDictionary *)self->_items objectForKey:v4];
  }

  return v5;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
  unavailableItems = self->_unavailableItems;
  if (unavailableItems)
  {
    id v6 = a3;
    [(NSMutableSet *)unavailableItems removeAllObjects];
  }
  else
  {
    v7 = (objc_class *)MEMORY[0x263EFF9C0];
    id v8 = a3;
    v9 = (NSMutableSet *)objc_alloc_init(v7);
    v10 = self->_unavailableItems;
    self->_unavailableItems = v9;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SUUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke;
  v11[3] = &unk_265401BE0;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
}

uint64_t __58__SUUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "addObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_componentDictionary copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_ineligibleGratisIdentifiers copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDictionary *)self->_items copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_layoutStyle;
  uint64_t v12 = [(NSDictionary *)self->_platformKeyProfileOverrides copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  uint64_t v14 = [(NSMutableSet *)self->_unavailableItems mutableCopyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  return v5;
}

- (NSSet)allUnavailableItemIdentifiers
{
  return &self->_unavailableItems->super;
}

- (NSDictionary)componentDictionary
{
  return self->_componentDictionary;
}

- (void)setComponentDictionary:(id)a3
{
}

- (NSArray)ineligibleGratisIdentifiers
{
  return self->_ineligibleGratisIdentifiers;
}

- (void)setIneligibleGratisIdentifiers:(id)a3
{
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (double)pageGenerationTime
{
  return self->_pageGenerationTime;
}

- (NSDictionary)platformKeyProfileOverrides
{
  return self->_platformKeyProfileOverrides;
}

- (void)setPlatformKeyProfileOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItems, 0);
  objc_storeStrong((id *)&self->_platformKeyProfileOverrides, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_ineligibleGratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_componentDictionary, 0);
}

@end