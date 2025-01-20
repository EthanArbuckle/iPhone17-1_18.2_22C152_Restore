@interface SUUILockupComponent
- (BOOL)_needsItemData;
- (SUUIEditorialComponent)editorial;
- (SUUIItem)item;
- (SUUILockupComponent)initWithCustomPageContext:(id)a3;
- (SUUILockupComponent)initWithItem:(id)a3 style:(SUUILockupStyle *)a4;
- (SUUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SUUILockupStyle *)a4;
- (SUUILockupComponent)initWithViewElement:(id)a3;
- (SUUILockupStyle)lockupStyle;
- (int64_t)componentType;
- (int64_t)itemIdentifier;
- (void)_setItem:(id)a3;
- (void)_setLockupStyle:(SUUILockupStyle *)a3;
@end

@implementation SUUILockupComponent

- (SUUILockupComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUILockupComponent;
  v5 = [(SUUIPageComponent *)&v19 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"adamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v4 itemForItemIdentifier:v7];
      item = v5->_item;
      v5->_item = (SUUIItem *)v8;

      v5->_itemIdentifier = [v7 longLongValue];
    }
    v10 = [v6 objectForKey:@"editorial"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v4 copy];
      [v11 setComponentDictionary:v10];
      v12 = [[SUUIEditorialComponent alloc] initWithCustomPageContext:v11];
      editorial = v5->_editorial;
      v5->_editorial = v12;

      if ([(SUUIEditorialComponent *)v5->_editorial _usesLockupTitle])
      {
        v14 = v5->_editorial;
        v15 = [(SUUIItem *)v5->_item title];
        [(SUUIEditorialComponent *)v14 _setTitleText:v15];
      }
    }
    SUUILockupStyleForDictionary(v6, v4, (uint64_t)&v17);
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v17;
    v5->_lockupStyle.visibleFields = v18;
  }
  return v5;
}

- (SUUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SUUILockupStyle *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUILockupComponent;
  result = [(SUUILockupComponent *)&v8 init];
  if (result)
  {
    result->_itemIdentifier = a3;
    long long v7 = *(_OWORD *)&a4->artworkSize;
    result->_lockupStyle.visibleFields = a4->visibleFields;
    *(_OWORD *)&result->_lockupStyle.artworkSize = v7;
  }
  return result;
}

- (SUUILockupComponent)initWithItem:(id)a3 style:(SUUILockupStyle *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUILockupComponent;
  objc_super v8 = [(SUUILockupComponent *)&v11 init];
  if (v8)
  {
    v8->_itemIdentifier = [v7 itemIdentifier];
    objc_storeStrong((id *)&v8->_item, a3);
    unint64_t visibleFields = a4->visibleFields;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = *(_OWORD *)&a4->artworkSize;
    v8->_lockupStyle.unint64_t visibleFields = visibleFields;
  }

  return v8;
}

- (SUUILockupComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILockupComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 9;
}

- (BOOL)_needsItemData
{
  v2 = [(SUUIItem *)self->_item artworksProvider];
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
  v5 = (SUUIItem *)a3;
  v6 = v5;
  p_item = &self->_item;
  if (self->_item != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    v5 = (SUUIItem *)[(SUUIEditorialComponent *)self->_editorial _usesLockupTitle];
    v6 = v10;
    if (v5)
    {
      editorial = self->_editorial;
      v9 = [(SUUIItem *)*p_item title];
      [(SUUIEditorialComponent *)editorial _setTitleText:v9];

      v6 = v10;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)_setLockupStyle:(SUUILockupStyle *)a3
{
  unint64_t visibleFields = a3->visibleFields;
  *(_OWORD *)&self->_lockupStyle.artworkSize = *(_OWORD *)&a3->artworkSize;
  self->_lockupStyle.unint64_t visibleFields = visibleFields;
}

- (SUUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SUUIItem)item
{
  return self->_item;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SUUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
}

@end