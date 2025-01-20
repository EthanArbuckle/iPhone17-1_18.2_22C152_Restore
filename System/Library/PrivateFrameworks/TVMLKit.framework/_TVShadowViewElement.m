@interface _TVShadowViewElement
- (BOOL)isEqual:(id)a3;
- (NSArray)children;
- (NSString)resourceName;
- (_TVShadowViewElement)parent;
- (_TVShadowViewElementID)elementID;
- (unint64_t)hash;
- (void)setChildren:(id)a3;
- (void)setElementID:(id)a3;
- (void)setParent:(id)a3;
- (void)setResourceName:(id)a3;
@end

@implementation _TVShadowViewElement

- (unint64_t)hash
{
  v2 = [(_TVShadowViewElement *)self elementID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 elementID];
    v7 = [(_TVShadowViewElement *)self elementID];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [v5 elementID];
      v9 = [(_TVShadowViewElement *)self elementID];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (_TVShadowViewElementID)elementID
{
  return self->_elementID;
}

- (void)setElementID:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (_TVShadowViewElement)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (_TVShadowViewElement *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_elementID, 0);
}

@end