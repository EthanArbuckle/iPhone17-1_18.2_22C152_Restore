@interface _TVShadowViewElementID
- (BOOL)isEqual:(id)a3;
- (IKViewElement)viewElement;
- (NSString)itemID;
- (_TVShadowViewElementID)init;
- (_TVShadowViewElementID)initWithViewElement:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _TVShadowViewElementID

- (_TVShadowViewElementID)initWithViewElement:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The view element must not be nil."];
  }
  v15.receiver = self;
  v15.super_class = (Class)_TVShadowViewElementID;
  v7 = [(_TVShadowViewElementID *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewElement, a3);
    v9 = [v6 attributes];
    v10 = [v9 objectForKeyedSubscript:@"itemID"];
    v11 = v10;
    if (!v10)
    {
      v3 = [v6 attributes];
      v11 = [v3 objectForKeyedSubscript:@"searchResultIdentifier"];
    }
    uint64_t v12 = [v11 copy];
    itemID = v8->_itemID;
    v8->_itemID = (NSString *)v12;

    if (!v10)
    {
    }
  }

  return v8;
}

- (_TVShadowViewElementID)init
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [(_TVShadowViewElementID *)self itemID];
  if (v3)
  {
    v4 = [(_TVShadowViewElementID *)self itemID];
    uint64_t v5 = [v4 hash];
  }
  else
  {
    uint64_t v5 = [(_TVShadowViewElementID *)self viewElement];
    v4 = (void *)v5;
  }
  unint64_t v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 viewElement];
    v7 = [(_TVShadowViewElementID *)self viewElement];

    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [v5 itemID];
      v9 = [(_TVShadowViewElementID *)self itemID];
      char v10 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p, itemID: %@, viewElement: %@>", v5, self, self->_itemID, self->_viewElement];

  return v6;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end