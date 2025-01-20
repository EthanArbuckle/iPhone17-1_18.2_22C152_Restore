@interface _UITabOutlineNode
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (NSMutableArray)actions;
- (NSMutableArray)children;
- (NSString)identifier;
- (_UITabOutlineNode)initWithIdentifier:(id)a3;
- (_UITabOutlineNode)parent;
- (id)_descriptionWithIndentationLevel:(int64_t)a3;
- (id)description;
- (void)addActionIdentifier:(id)a3;
- (void)addChild:(id)a3;
- (void)removeChild:(id)a3;
- (void)setChildren:(id)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setParent:(id)a3;
@end

@implementation _UITabOutlineNode

- (_UITabOutlineNode)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabOutlineNode;
  v6 = [(_UITabOutlineNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)addChild:(id)a3
{
  id v7 = a3;
  [v7 setParent:self];
  children = self->_children;
  if (children)
  {
    [(NSMutableArray *)children addObject:v7];
  }
  else
  {
    id v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
    v6 = self->_children;
    self->_children = v5;
  }
}

- (void)removeChild:(id)a3
{
  children = self->_children;
  id v4 = a3;
  [(NSMutableArray *)children removeObject:v4];
  [v4 setParent:0];
}

- (void)addActionIdentifier:(id)a3
{
  actions = self->_actions;
  if (actions)
  {
    [(NSMutableArray *)actions addObject:a3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:a3];
    v6 = self->_actions;
    self->_actions = v5;
  }
}

- (id)description
{
  return [(_UITabOutlineNode *)self _descriptionWithIndentationLevel:0];
}

- (id)_descriptionWithIndentationLevel:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [&stru_1ED0E84C0 stringByPaddingToLength:2 * a3 withString:@" " startingAtIndex:0];
  v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@ (%lu actions)", v5, self->_identifier, -[NSMutableArray count](self->_actions, "count")];
  id v7 = [(_UITabOutlineNode *)self children];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v6 appendString:@" {\n"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v9 = [(_UITabOutlineNode *)self children];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      int64_t v13 = a3 + 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) _descriptionWithIndentationLevel:v13];
          [v6 appendString:v15];
          [v6 appendString:@"\n"];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v6 appendString:v5];
    [v6 appendString:@"}\n"];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UITabOutlineNode *)a3;
  if (self == v4)
  {
    char v10 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_UITabOutlineNode *)self identifier];
    v6 = [(_UITabOutlineNode *)v4 identifier];
    id v7 = v5;
    id v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      objc_super v9 = v8;
      char v10 = 0;
      if (!v7 || !v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      char v11 = [v7 isEqual:v8];

      if ((v11 & 1) == 0) {
        goto LABEL_7;
      }
    }
    uint64_t v12 = [(_UITabOutlineNode *)self children];
    int64_t v13 = [(_UITabOutlineNode *)v4 children];
    id v7 = v12;
    id v14 = v13;
    if (v7 == v14)
    {
      char v10 = 1;
      objc_super v9 = v7;
    }
    else
    {
      objc_super v9 = v14;
      char v10 = 0;
      if (v7 && v14) {
        char v10 = [v7 isEqual:v14];
      }
    }
    goto LABEL_15;
  }
LABEL_7:
  char v10 = 0;
LABEL_16:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (_UITabOutlineNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (_UITabOutlineNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end