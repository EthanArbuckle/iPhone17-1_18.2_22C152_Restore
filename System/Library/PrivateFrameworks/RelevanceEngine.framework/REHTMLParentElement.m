@interface REHTMLParentElement
- (REHTMLParentElement)initWithParents:(id)a3 children:(id)a4;
- (id)_encodedData;
- (id)addChildren:(id)a3;
- (id)attributes;
- (id)classes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementBySettingAtttibutes:(id)a3;
- (id)elementBySettingClasses:(id)a3;
@end

@implementation REHTMLParentElement

- (REHTMLParentElement)initWithParents:(id)a3 children:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REHTMLParentElement;
  v9 = [(REHTMLElement *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    uint64_t v11 = [v8 copy];
    children = v10->_children;
    v10->_children = (NSArray *)v11;
  }
  return v10;
}

- (id)_encodedData
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF990] data];
  v4 = [(REHTMLElement *)self->_parent _prefixContentString];
  v5 = [(REHTMLElement *)self _encodeString:v4];

  if (v5) {
    [v3 appendData:v5];
  }
  v6 = [(REHTMLElement *)self->_parent _contentString];
  id v7 = [(REHTMLElement *)self _encodeString:v6];

  if (v7) {
    [v3 appendData:v7];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_children;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "encodedData", (void)v18);
        [v3 appendData:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  objc_super v14 = [(REHTMLElement *)self->_parent _suffixContentString];
  v15 = [(REHTMLElement *)self _encodeString:v14];

  if (v15) {
    [v3 appendData:v15];
  }
  v16 = objc_msgSend(v3, "copy", (void)v18);

  return v16;
}

- (id)classes
{
  v2 = [(REHTMLElement *)self->_parent classes];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (id)elementBySettingClasses:(id)a3
{
  id v4 = [(REHTMLElement *)self->_parent elementBySettingClasses:a3];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParents:v4 children:self->_children];

  return v5;
}

- (id)attributes
{
  v2 = [(REHTMLElement *)self->_parent attributes];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = v2;

  return v4;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  id v4 = [(REHTMLElement *)self->_parent elementBySettingAtttibutes:a3];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParents:v4 children:self->_children];

  return v5;
}

- (id)addChildren:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    parent = self->_parent;
    id v7 = [(NSArray *)self->_children arrayByAddingObjectsFromArray:v4];
    id v8 = (REHTMLParentElement *)[v5 initWithParents:parent children:v7];
  }
  else
  {
    id v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLParentElement;
  id v4 = [(REHTMLElement *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_parent);
  objc_storeStrong(v4 + 3, self->_children);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end