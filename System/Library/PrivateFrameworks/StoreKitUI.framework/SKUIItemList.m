@interface SKUIItemList
- (BOOL)isUnavailableItemIdentifier:(id)a3;
- (NSArray)items;
- (NSMutableDictionary)cacheRepresentation;
- (NSSet)unavailableItemIdentifiers;
- (NSString)seeAllTitle;
- (NSString)seeAllURLString;
- (NSString)title;
- (SKUIItemList)initWithCacheRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)removeItemsAtIndexes:(id)a3;
- (void)setItems:(id)a3;
- (void)setSeeAllTitle:(id)a3;
- (void)setSeeAllURLString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnavailableItemIdentifiers:(id)a3;
@end

@implementation SKUIItemList

- (void)addItem:(id)a3
{
}

- (void)addItems:(id)a3
{
}

- (BOOL)isUnavailableItemIdentifier:(id)a3
{
  return [(NSSet *)self->_unavailableItemIdentifiers containsObject:a3];
}

- (void)removeItemsAtIndexes:(id)a3
{
}

- (void)setItems:(id)a3
{
  if (self->_items != a3)
  {
    v4 = (NSMutableArray *)[a3 mutableCopy];
    items = self->_items;
    self->_items = v4;
    MEMORY[0x1F41817F8](v4, items);
  }
}

- (SKUIItemList)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemList initWithCacheRepresentation:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIItemList;
  v5 = [(SKUIItemList *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      title = v5->_title;
      v5->_title = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"seeallt"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      seeAllTitle = v5->_seeAllTitle;
      v5->_seeAllTitle = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"seeall"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      seeAllURLString = v5->_seeAllURLString;
      v5->_seeAllURLString = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"items"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = SKUICacheCodingDecodeArray(v15, v16);
      items = v5->_items;
      v5->_items = (NSMutableArray *)v17;
    }
    self = [v4 objectForKey:@"unavail"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self];
      unavailableItemIdentifiers = v5->_unavailableItemIdentifiers;
      v5->_unavailableItemIdentifiers = (NSSet *)v19;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  items = self->_items;
  if (items)
  {
    v5 = SKUICacheCodingEncodeArray(items);
    [v3 setObject:v5 forKey:@"items"];
  }
  seeAllTitle = self->_seeAllTitle;
  if (seeAllTitle) {
    [v3 setObject:seeAllTitle forKey:@"seeallt"];
  }
  seeAllURLString = self->_seeAllURLString;
  if (seeAllURLString) {
    [v3 setObject:seeAllURLString forKey:@"seeall"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  unavailableItemIdentifiers = self->_unavailableItemIdentifiers;
  if (unavailableItemIdentifiers)
  {
    uint64_t v10 = [(NSSet *)unavailableItemIdentifiers allObjects];
    [v3 setObject:v10 forKey:@"unavail"];
  }

  return (NSMutableDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableArray *)self->_items mutableCopyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_seeAllTitle copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_seeAllURLString copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSSet *)self->_unavailableItemIdentifiers copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSString)seeAllTitle
{
  return self->_seeAllTitle;
}

- (void)setSeeAllTitle:(id)a3
{
}

- (NSString)seeAllURLString
{
  return self->_seeAllURLString;
}

- (void)setSeeAllURLString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSSet)unavailableItemIdentifiers
{
  return self->_unavailableItemIdentifiers;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seeAllURLString, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)initWithCacheRepresentation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemList initWithCacheRepresentation:]";
}

@end