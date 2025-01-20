@interface CRLQuickInspectorElement
+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6;
+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8;
+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6;
+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9;
+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 crlaxLabel:(id)a7;
+ (id)elementWithUIMenu:(id)a3;
+ (id)elementWithUIMenuElement:(id)a3;
+ (id)elementWithUIMenuElement:(id)a3 ofType:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (CRLColor)tintColor;
- (CRLImage)image;
- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8;
- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6;
- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9 crlaxLabel:(id)a10;
- (NSMutableArray)children;
- (NSString)crlaxLabel;
- (NSString)name;
- (NSString)parent;
- (NSString)toolTip;
- (SEL)action;
- (UIMenuElement)UIMenuElement;
- (int64_t)elementType;
- (int64_t)options;
- (int64_t)tag;
- (unint64_t)hash;
- (void)setAction:(SEL)a3;
- (void)setChildren:(id)a3;
- (void)setCrlaxLabel:(id)a3;
- (void)setElementType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setToolTip:(id)a3;
@end

@implementation CRLQuickInspectorElement

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9 crlaxLabel:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)CRLQuickInspectorElement;
  v21 = [(CRLQuickInspectorElement *)&v25 init];
  v22 = v21;
  if (v21)
  {
    [(CRLQuickInspectorElement *)v21 setName:v16];
    [(CRLQuickInspectorElement *)v22 setImage:v17];
    [(CRLQuickInspectorElement *)v22 setElementType:a5];
    [(CRLQuickInspectorElement *)v22 setOptions:a6];
    [(CRLQuickInspectorElement *)v22 setAction:a7];
    [(CRLQuickInspectorElement *)v22 setParent:v18];
    [(CRLQuickInspectorElement *)v22 setChildren:v19];
    if (v20) {
      id v23 = v20;
    }
    else {
      id v23 = v16;
    }
    [(CRLQuickInspectorElement *)v22 setCrlaxLabel:v23];
    [(CRLQuickInspectorElement *)v22 setTag:-1];
  }

  return v22;
}

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6
{
  return [(CRLQuickInspectorElement *)self initWithName:a3 image:a4 type:a5 options:a6 action:0 parent:0 children:0 crlaxLabel:0];
}

- (CRLQuickInspectorElement)initWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8
{
  return [(CRLQuickInspectorElement *)self initWithName:a3 image:a4 type:a5 options:0 action:a6 parent:a7 children:a8 crlaxLabel:0];
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [[CRLQuickInspectorElement alloc] initWithName:v10 image:v9 type:a5 options:a6];

  return v11;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 crlaxLabel:(id)a7
{
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  v14 = [[CRLQuickInspectorElement alloc] initWithName:v13 image:v12 type:a5 options:a6 action:0 parent:0 children:0 crlaxLabel:v11];

  return v14;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CRLQuickInspectorElement alloc] initWithName:v10 image:v9 type:a5 action:a6 parent:0 children:0];

  return v11;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 action:(SEL)a6 parent:(id)a7 children:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[CRLQuickInspectorElement alloc] initWithName:v16 image:v15 type:a5 action:a6 parent:v14 children:v13];

  return v17;
}

+ (id)elementWithName:(id)a3 image:(id)a4 type:(int64_t)a5 options:(int64_t)a6 action:(SEL)a7 parent:(id)a8 children:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[CRLQuickInspectorElement alloc] initWithName:v18 image:v17 type:a5 options:a6 action:a7 parent:v16 children:v15 crlaxLabel:0];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    uint64_t v7 = [(CRLQuickInspectorElement *)self name];
    uint64_t v8 = [v6 name];
    if (v7 | v8 && ![(id)v7 isEqual:v8])
    {
      unsigned __int8 v25 = 0;
    }
    else
    {
      uint64_t v9 = [(CRLQuickInspectorElement *)self image];
      uint64_t v10 = [v6 image];
      if ((!(v9 | v10) || [(id)v9 isEqual:v10])
        && (id v11 = -[CRLQuickInspectorElement elementType](self, "elementType"), v11 == [v6 elementType])
        && (id v12 = -[CRLQuickInspectorElement options](self, "options"), v12 == [v6 options])
        && sel_isEqual(-[CRLQuickInspectorElement action](self, "action"), (SEL)[v6 action]))
      {
        uint64_t v13 = [(CRLQuickInspectorElement *)self parent];
        uint64_t v14 = [v6 parent];
        if (v13 | v14 && ![(id)v13 isEqual:v14])
        {
          unsigned __int8 v25 = 0;
        }
        else
        {
          uint64_t v15 = [(CRLQuickInspectorElement *)self children];
          uint64_t v16 = [v6 children];
          if (v15 | v16 && ![(id)v15 isEqual:v16])
          {
            unsigned __int8 v25 = 0;
          }
          else
          {
            uint64_t v32 = v14;
            uint64_t v17 = [(CRLQuickInspectorElement *)self tintColor];
            uint64_t v18 = [v6 tintColor];
            uint64_t v19 = v17;
            id v20 = (void *)v18;
            v31 = (void *)v19;
            if (v19 | v18 && ![(id)v19 isEqual:v18])
            {
              unsigned __int8 v25 = 0;
            }
            else
            {
              v29 = v20;
              uint64_t v30 = v16;
              uint64_t v21 = [(CRLQuickInspectorElement *)self crlaxLabel];
              uint64_t v22 = [v6 crlaxLabel];
              if (v21 | v22 && ![(id)v21 isEqual:v22])
              {
                unsigned __int8 v25 = 0;
              }
              else
              {
                uint64_t v27 = v13;
                uint64_t v28 = v15;
                uint64_t v23 = [(CRLQuickInspectorElement *)self toolTip];
                uint64_t v24 = [v6 toolTip];
                if (v23 | v24)
                {
                  unsigned __int8 v25 = [(id)v23 isEqual:v24];
                }
                else
                {
                  unsigned __int8 v25 = 1;
                }
                uint64_t v13 = v27;

                uint64_t v15 = v28;
              }

              id v20 = v29;
              uint64_t v16 = v30;
            }

            uint64_t v14 = v32;
          }
        }
      }
      else
      {
        unsigned __int8 v25 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  v3 = [(CRLQuickInspectorElement *)self name];
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = [(CRLQuickInspectorElement *)self image];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  int64_t v7 = [(CRLQuickInspectorElement *)self elementType];
  unint64_t v8 = v6 ^ v7 ^ [(CRLQuickInspectorElement *)self options];
  uint64_t v9 = NSStringFromSelector([(CRLQuickInspectorElement *)self action]);
  unint64_t v10 = (unint64_t)[v9 hash];
  id v11 = [(CRLQuickInspectorElement *)self parent];
  unint64_t v12 = v8 ^ v10 ^ (unint64_t)[v11 hash];
  uint64_t v13 = [(CRLQuickInspectorElement *)self children];
  unint64_t v14 = (unint64_t)[v13 hash];
  uint64_t v15 = [(CRLQuickInspectorElement *)self tintColor];
  unint64_t v16 = v14 ^ (unint64_t)[v15 hash];
  uint64_t v17 = [(CRLQuickInspectorElement *)self crlaxLabel];
  unint64_t v18 = v16 ^ (unint64_t)[v17 hash];
  uint64_t v19 = [(CRLQuickInspectorElement *)self toolTip];
  unint64_t v20 = v12 ^ v18 ^ (unint64_t)[v19 hash];

  return v20;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CRLImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(int64_t)a3
{
  self->_elementType = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (CRLColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)crlaxLabel
{
  return self->_crlaxLabel;
}

- (void)setCrlaxLabel:(id)a3
{
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (void)setToolTip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTip, 0);
  objc_storeStrong((id *)&self->_crlaxLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)elementWithUIMenuElement:(id)a3 ofType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 title];
  int64_t v7 = [v5 image];
  unint64_t v8 = +[CRLImage imageWithUIImage:v7];
  uint64_t v9 = objc_opt_class();
  unint64_t v10 = sub_1002469D0(v9, v5);
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = sub_1002469D0(v11, v5);

  if (v10)
  {
    id v13 = [v10 action];
    unint64_t v14 = [CRLQuickInspectorElement alloc];
    uint64_t v15 = v6;
    unint64_t v16 = v8;
    int64_t v17 = a4;
    id v18 = v13;
LABEL_3:
    uint64_t v19 = [(CRLQuickInspectorElement *)v14 initWithName:v15 image:v16 type:v17 action:v18 parent:0 children:0];
    goto LABEL_6;
  }
  if (!v12)
  {
    unint64_t v14 = [CRLQuickInspectorElement alloc];
    uint64_t v15 = v6;
    unint64_t v16 = v8;
    int64_t v17 = a4;
    id v18 = 0;
    goto LABEL_3;
  }
  uint64_t v19 = +[CRLQuickInspectorElement elementWithUIMenu:v12];
LABEL_6:
  unint64_t v20 = v19;

  return v20;
}

+ (id)elementWithUIMenuElement:(id)a3
{
  return +[CRLQuickInspectorElement elementWithUIMenuElement:a3 ofType:1];
}

+ (id)elementWithUIMenu:(id)a3
{
  id v3 = a3;
  uint64_t v15 = [v3 title];
  unint64_t v4 = [v3 image];
  id v5 = +[CRLImage imageWithUIImage:v4];
  unint64_t v6 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v7 = [v3 children];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = +[CRLQuickInspectorElement elementWithUIMenuElement:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [[CRLQuickInspectorElement alloc] initWithName:v15 image:v5 type:1 action:0 parent:0 children:v6];

  return v13;
}

- (UIMenuElement)UIMenuElement
{
  id v3 = [(CRLQuickInspectorElement *)self children];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unint64_t v6 = [(CRLQuickInspectorElement *)self children];
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unint64_t v12 = [v11 UIMenuElement];
          if (v12)
          {
            id v13 = [v11 UIMenuElement];
            [v5 addObject:v13];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    unint64_t v14 = [(CRLQuickInspectorElement *)self name];
    uint64_t v15 = [(CRLQuickInspectorElement *)self image];
    long long v16 = [v15 UIImage];
    long long v17 = +[UIMenu menuWithTitle:v14 image:v16 identifier:0 options:1 children:v5];
  }
  else
  {
    long long v18 = [(CRLQuickInspectorElement *)self name];
    long long v19 = [(CRLQuickInspectorElement *)self image];
    unint64_t v20 = [v19 UIImage];
    long long v17 = +[UICommand commandWithTitle:v18 image:v20 action:[(CRLQuickInspectorElement *)self action] propertyList:0];
  }

  return (UIMenuElement *)v17;
}

@end