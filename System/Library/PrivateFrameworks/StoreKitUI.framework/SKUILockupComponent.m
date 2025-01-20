@interface SKUILockupComponent
- (BOOL)_needsItemData;
- (SKUIEditorialComponent)editorial;
- (SKUIItem)item;
- (SKUILockupComponent)initWithCustomPageContext:(id)a3;
- (SKUILockupComponent)initWithItem:(id)a3 style:(SKUILockupStyle *)a4;
- (SKUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SKUILockupStyle *)a4;
- (SKUILockupComponent)initWithViewElement:(id)a3;
- (SKUILockupStyle)lockupStyle;
- (int64_t)componentType;
- (int64_t)itemIdentifier;
- (void)_setItem:(id)a3;
- (void)_setLockupStyle:(SKUILockupStyle *)a3;
@end

@implementation SKUILockupComponent

- (SKUILockupComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUILockupComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUILockupComponent;
  v13 = [(SKUIPageComponent *)&v27 initWithCustomPageContext:v4];
  if (v13)
  {
    v14 = [v4 componentDictionary];
    v15 = [v14 objectForKey:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v4 itemForItemIdentifier:v15];
      item = v13->_item;
      v13->_item = (SKUIItem *)v16;

      v13->_itemIdentifier = [v15 longLongValue];
    }
    v18 = [v14 objectForKey:@"editorial"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v4 copy];
      [v19 setComponentDictionary:v18];
      v20 = [[SKUIEditorialComponent alloc] initWithCustomPageContext:v19];
      editorial = v13->_editorial;
      v13->_editorial = v20;

      if ([(SKUIEditorialComponent *)v13->_editorial _usesLockupTitle])
      {
        v22 = v13->_editorial;
        v23 = [(SKUIItem *)v13->_item title];
        [(SKUIEditorialComponent *)v22 _setTitleText:v23];
      }
    }
    SKUILockupStyleForDictionary(v14, v4, (uint64_t)&v25);
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v25;
    v13->_lockupStyle.visibleFields = v26;
  }
  return v13;
}

- (SKUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SKUILockupStyle *)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUILockupComponent initWithItemIdentifier:style:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUILockupComponent;
  result = [(SKUILockupComponent *)&v17 init];
  if (result)
  {
    result->_itemIdentifier = a3;
    long long v16 = *(_OWORD *)&a4->artworkSize;
    result->_lockupStyle.visibleFields = a4->visibleFields;
    *(_OWORD *)&result->_lockupStyle.artworkSize = v16;
  }
  return result;
}

- (SKUILockupComponent)initWithItem:(id)a3 style:(SKUILockupStyle *)a4
{
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUILockupComponent initWithItem:style:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUILockupComponent;
  long long v16 = [(SKUILockupComponent *)&v19 init];
  if (v16)
  {
    v16->_itemIdentifier = [v7 itemIdentifier];
    objc_storeStrong((id *)&v16->_item, a3);
    unint64_t visibleFields = a4->visibleFields;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = *(_OWORD *)&a4->artworkSize;
    v16->_lockupStyle.unint64_t visibleFields = visibleFields;
  }

  return v16;
}

- (SKUILockupComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUILockupComponent initWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUILockupComponent;
  uint64_t v13 = [(SKUIPageComponent *)&v15 initWithViewElement:v4];

  return v13;
}

- (int64_t)componentType
{
  return 9;
}

- (BOOL)_needsItemData
{
  v2 = [(SKUIItem *)self->_item artworksProvider];
  v3 = v2;
  if (v2) {
    int v4 = [v2 hasArtwork] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)_setItem:(id)a3
{
  BOOL v5 = (SKUIItem *)a3;
  uint64_t v6 = v5;
  p_item = &self->_item;
  if (self->_item != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    BOOL v5 = (SKUIItem *)[(SKUIEditorialComponent *)self->_editorial _usesLockupTitle];
    uint64_t v6 = v10;
    if (v5)
    {
      editorial = self->_editorial;
      uint64_t v9 = [(SKUIItem *)*p_item title];
      [(SKUIEditorialComponent *)editorial _setTitleText:v9];

      uint64_t v6 = v10;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_setLockupStyle:(SKUILockupStyle *)a3
{
  unint64_t visibleFields = a3->visibleFields;
  *(_OWORD *)&self->_lockupStyle.artworkSize = *(_OWORD *)&a3->artworkSize;
  self->_lockupStyle.unint64_t visibleFields = visibleFields;
}

- (SKUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SKUIItem)item
{
  return self->_item;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SKUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_editorial, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithItemIdentifier:(uint64_t)a3 style:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithItem:(uint64_t)a3 style:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end