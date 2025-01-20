@interface SKUIPageComponentContext
- (BOOL)isUnavailableItemIdentifier:(id)a3;
- (NSArray)ineligibleGratisIdentifiers;
- (NSDictionary)componentDictionary;
- (NSDictionary)items;
- (NSDictionary)platformKeyProfileOverrides;
- (NSSet)allUnavailableItemIdentifiers;
- (SKUIPageComponentContext)init;
- (double)pageGenerationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemForItemIdentifier:(id)a3;
- (int64_t)layoutStyle;
- (void)addUnavailableItemIdentifiers:(id)a3;
- (void)init;
- (void)setComponentDictionary:(id)a3;
- (void)setIneligibleGratisIdentifiers:(id)a3;
- (void)setItems:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setPlatformKeyProfileOverrides:(id)a3;
- (void)setUnavailableItemIdentifiers:(id)a3;
@end

@implementation SKUIPageComponentContext

- (SKUIPageComponentContext)init
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIPageComponentContext *)v3 init];
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIPageComponentContext;
  v11 = [(SKUIPageComponentContext *)&v15 init];
  if (v11)
  {
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v13 = [v12 userInterfaceIdiom] == 1;

    v11->_layoutStyle = v13;
    v11->_pageGenerationTime = CFAbsoluteTimeGetCurrent();
  }
  return v11;
}

- (void)addUnavailableItemIdentifiers:(id)a3
{
  id v4 = a3;
  unavailableItems = self->_unavailableItems;
  id v8 = v4;
  if (!unavailableItems)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_unavailableItems;
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
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSDictionary *)self->_items objectForKey:v4];
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
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v8 = a3;
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(v7);
    uint64_t v10 = self->_unavailableItems;
    self->_unavailableItems = v9;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SKUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke;
  v11[3] = &unk_1E64244A0;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
}

uint64_t __58__SKUIPageComponentContext_setUnavailableItemIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "addObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_componentDictionary copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_ineligibleGratisIdentifiers copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDictionary *)self->_items copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_layoutStyle;
  uint64_t v12 = [(NSDictionary *)self->_platformKeyProfileOverrides copyWithZone:a3];
  BOOL v13 = (void *)v5[6];
  v5[6] = v12;

  uint64_t v14 = [(NSMutableSet *)self->_unavailableItems mutableCopyWithZone:a3];
  objc_super v15 = (void *)v5[7];
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

- (void)init
{
}

@end