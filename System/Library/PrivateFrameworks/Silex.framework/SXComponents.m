@interface SXComponents
- (BOOL)isEqual:(id)a3;
- (NSArray)allComponents;
- (NSMutableArray)components;
- (NSMutableDictionary)childComponentsByParentIdentifier;
- (NSMutableDictionary)componentsByIdentifier;
- (SXComponents)init;
- (SXComponents)initWithArray:(id)a3;
- (id)componentAtIndex:(unint64_t)a3;
- (id)componentForIdentifier:(id)a3;
- (id)componentsForContainerComponentWithIdentifier:(id)a3;
- (id)componentsForContainerComponentWithPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfComponent:(id)a3;
- (void)_removeComponent:(id)a3;
- (void)addComponent:(id)a3;
- (void)addComponentsFromArray:(id)a3;
- (void)enumerateComponentsWithBlock:(id)a3;
- (void)insertComponent:(id)a3 afterComponent:(id)a4;
- (void)insertComponent:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllComponents;
- (void)removeComponentAtIndex:(unint64_t)a3;
- (void)removeComponentWithIdentifier:(id)a3;
- (void)replaceComponent:(id)a3 withComponent:(id)a4;
- (void)replaceComponentAtIndex:(unint64_t)a3 withComponent:(id)a4;
- (void)setComponents:(id)a3;
@end

@implementation SXComponents

- (SXComponents)init
{
  return [(SXComponents *)self initWithArray:0];
}

- (SXComponents)initWithArray:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponents;
  v5 = [(SXComponents *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    components = v5->_components;
    v5->_components = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    componentsByIdentifier = v5->_componentsByIdentifier;
    v5->_componentsByIdentifier = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    childComponentsByParentIdentifier = v5->_childComponentsByParentIdentifier;
    v5->_childComponentsByParentIdentifier = (NSMutableDictionary *)v10;

    [(SXComponents *)v5 addComponentsFromArray:v4];
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_components count];
}

- (NSArray)allComponents
{
  v2 = (void *)[(NSMutableArray *)self->_components copy];
  return (NSArray *)v2;
}

- (void)enumerateComponentsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (unsigned int (**)(id, SXComponents *, void *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = (void *)[(NSMutableArray *)self->_components copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, self, v10))
        {
          v11 = [v10 identifier];
          v12 = [(SXComponents *)self componentsForContainerComponentWithIdentifier:v11];

          [v12 enumerateComponentsWithBlock:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)componentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_components objectAtIndex:a3];
}

- (unint64_t)indexOfComponent:(id)a3
{
  return [(NSMutableArray *)self->_components indexOfObject:a3];
}

- (id)componentForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_componentsByIdentifier objectForKey:a3];
}

- (id)componentsForContainerComponentWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_childComponentsByParentIdentifier objectForKey:a3];
}

- (id)componentsForContainerComponentWithPath:(id)a3
{
  id v4 = self;
  v5 = [a3 objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      uint64_t v8 = [(SXComponents *)v4 componentsForContainerComponentWithIdentifier:v7];

      uint64_t v9 = [v5 nextObject];

      uint64_t v7 = (void *)v9;
      id v4 = v8;
    }
    while (v9);
  }
  else
  {
    uint64_t v8 = v4;
  }

  return v8;
}

- (void)addComponentsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SXComponents *)self addComponent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addComponent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    componentsByIdentifier = self->_componentsByIdentifier;
    id v8 = v4;
    uint64_t v6 = [v4 identifier];
    uint64_t v7 = [(NSMutableDictionary *)componentsByIdentifier objectForKey:v6];

    if (v7) {
      [(SXComponents *)self replaceComponent:v7 withComponent:v8];
    }
    else {
      [(SXComponents *)self insertComponent:v8 atIndex:[(SXComponents *)self count]];
    }

    id v4 = v8;
  }
}

- (void)insertComponent:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t isKindOfClass = (unint64_t)a3;
  unint64_t v7 = isKindOfClass;
  if (isKindOfClass)
  {
    id v17 = (id)isKindOfClass;
    unint64_t isKindOfClass = [(SXComponents *)self count];
    unint64_t v7 = (unint64_t)v17;
    if (isKindOfClass >= a4)
    {
      componentsByIdentifier = self->_componentsByIdentifier;
      long long v9 = [v17 identifier];
      [(NSMutableDictionary *)componentsByIdentifier setObject:v17 forKey:v9];

      [(NSMutableArray *)self->_components insertObject:v17 atIndex:a4];
      objc_opt_class();
      unint64_t isKindOfClass = objc_opt_isKindOfClass();
      unint64_t v7 = (unint64_t)v17;
      if (isKindOfClass)
      {
        id v10 = v17;
        id v11 = objc_alloc((Class)objc_opt_class());
        long long v12 = [v10 components];
        long long v13 = [v12 NSArray];
        uint64_t v14 = (void *)[v11 initWithArray:v13];

        childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
        long long v16 = [v10 identifier];

        [(NSMutableDictionary *)childComponentsByParentIdentifier setObject:v14 forKey:v16];
        unint64_t v7 = (unint64_t)v17;
      }
    }
  }
  MEMORY[0x270F9A758](isKindOfClass, v7);
}

- (void)insertComponent:(id)a3 afterComponent:(id)a4
{
  id v7 = a3;
  unint64_t v6 = [(SXComponents *)self indexOfComponent:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [(SXComponents *)self addComponent:v7];
  }
  else {
    [(SXComponents *)self insertComponent:v7 atIndex:v6 + 1];
  }
}

- (void)replaceComponentAtIndex:(unint64_t)a3 withComponent:(id)a4
{
  id v6 = a4;
  [(SXComponents *)self removeComponentAtIndex:a3];
  [(SXComponents *)self insertComponent:v6 atIndex:a3];
}

- (void)replaceComponent:(id)a3 withComponent:(id)a4
{
  id v6 = a4;
  [(SXComponents *)self replaceComponentAtIndex:[(SXComponents *)self indexOfComponent:a3] withComponent:v6];
}

- (void)setComponents:(id)a3
{
  id v4 = a3;
  [(SXComponents *)self removeAllComponents];
  [(SXComponents *)self addComponentsFromArray:v4];
}

- (void)removeComponentAtIndex:(unint64_t)a3
{
  if ([(SXComponents *)self count] > a3)
  {
    id v5 = [(NSMutableArray *)self->_components objectAtIndex:a3];
    [(SXComponents *)self _removeComponent:v5];
  }
}

- (void)removeComponentWithIdentifier:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_componentsByIdentifier, "objectForKey:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SXComponents *)self _removeComponent:v4];
  }
}

- (void)removeAllComponents
{
  [(NSMutableArray *)self->_components removeAllObjects];
  [(NSMutableDictionary *)self->_componentsByIdentifier removeAllObjects];
  childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
  [(NSMutableDictionary *)childComponentsByParentIdentifier removeAllObjects];
}

- (void)_removeComponent:(id)a3
{
  if (a3)
  {
    components = self->_components;
    id v5 = a3;
    [(NSMutableArray *)components removeObject:v5];
    componentsByIdentifier = self->_componentsByIdentifier;
    id v7 = [v5 identifier];
    [(NSMutableDictionary *)componentsByIdentifier removeObjectForKey:v7];

    childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
    id v9 = [v5 identifier];

    [(NSMutableDictionary *)childComponentsByParentIdentifier removeObjectForKey:v9];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[SXComponents alloc] initWithArray:0];
  uint64_t v5 = [(NSMutableArray *)self->_components mutableCopy];
  components = v4->_components;
  v4->_components = (NSMutableArray *)v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_componentsByIdentifier mutableCopy];
  componentsByIdentifier = v4->_componentsByIdentifier;
  v4->_componentsByIdentifier = (NSMutableDictionary *)v7;

  id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_childComponentsByParentIdentifier, "count"));
  childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __29__SXComponents_copyWithZone___block_invoke;
  v15[3] = &unk_264652998;
  id v11 = v9;
  long long v16 = v11;
  [(NSMutableDictionary *)childComponentsByParentIdentifier enumerateKeysAndObjectsUsingBlock:v15];
  long long v12 = v4->_childComponentsByParentIdentifier;
  v4->_childComponentsByParentIdentifier = v11;
  long long v13 = v11;

  return v4;
}

void __29__SXComponents_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [v4 setObject:v6 forKey:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(SXComponents *)[SXMutableComponents alloc] initWithArray:0];
  uint64_t v5 = [(NSMutableArray *)self->_components mutableCopy];
  components = v4->super._components;
  v4->super._components = (NSMutableArray *)v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_componentsByIdentifier mutableCopy];
  componentsByIdentifier = v4->super._componentsByIdentifier;
  v4->super._componentsByIdentifier = (NSMutableDictionary *)v7;

  id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_childComponentsByParentIdentifier, "count"));
  childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __36__SXComponents_mutableCopyWithZone___block_invoke;
  v15[3] = &unk_264652998;
  id v11 = v9;
  long long v16 = v11;
  [(NSMutableDictionary *)childComponentsByParentIdentifier enumerateKeysAndObjectsUsingBlock:v15];
  long long v12 = v4->super._childComponentsByParentIdentifier;
  v4->super._childComponentsByParentIdentifier = v11;
  long long v13 = v11;

  return v4;
}

void __36__SXComponents_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SXComponents *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSMutableArray *)self->_components isEqualToArray:v4->_components]
      && [(NSMutableDictionary *)self->_componentsByIdentifier isEqualToDictionary:v4->_componentsByIdentifier])
    {
      char v5 = [(NSMutableDictionary *)self->_childComponentsByParentIdentifier isEqualToDictionary:v4->_childComponentsByParentIdentifier];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_components countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (NSMutableArray)components
{
  return self->_components;
}

- (NSMutableDictionary)componentsByIdentifier
{
  return self->_componentsByIdentifier;
}

- (NSMutableDictionary)childComponentsByParentIdentifier
{
  return self->_childComponentsByParentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childComponentsByParentIdentifier, 0);
  objc_storeStrong((id *)&self->_componentsByIdentifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end