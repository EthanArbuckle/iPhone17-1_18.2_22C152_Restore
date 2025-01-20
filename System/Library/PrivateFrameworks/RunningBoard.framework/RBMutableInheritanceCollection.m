@interface RBMutableInheritanceCollection
+ (id)collectionWithInheritances:(id)a3;
- (id)_initWithCollection:(id)a3;
- (id)allNamespaces;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addInheritance:(id)a3;
- (void)removeInheritance:(id)a3;
- (void)unionCollection:(id)a3;
@end

@implementation RBMutableInheritanceCollection

- (void).cxx_destruct
{
}

- (id)allNamespaces
{
  return (id)[MEMORY[0x263EFFA08] setWithSet:self->_countedNamespaces];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [RBInheritanceCollection alloc];
  return [(RBInheritanceCollection *)v4 _initWithCollection:self];
}

- (id)_initWithCollection:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = (id *)a3;
  v29.receiver = self;
  v29.super_class = (Class)RBMutableInheritanceCollection;
  v5 = [(RBMutableInheritanceCollection *)&v29 init];
  if (v5)
  {
    id v6 = v4[1];
    if ([v6 count])
    {
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      inheritancesByEnvironment = v5->super._inheritancesByEnvironment;
      v5->super._inheritancesByEnvironment = v7;

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __54__RBMutableInheritanceCollection__initWithCollection___block_invoke;
      v27[3] = &unk_2647C81A8;
      v28 = v5;
      [v6 enumerateKeysAndObjectsUsingBlock:v27];
    }
    id v9 = v4[2];
    if ([v9 count])
    {
      id v22 = v6;
      uint64_t v10 = [v9 mutableCopy];
      inheritances = v5->super._inheritances;
      v5->super._inheritances = (NSSet *)v10;

      v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
      countedNamespaces = v5->_countedNamespaces;
      v5->_countedNamespaces = v12;

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = v5->_countedNamespaces;
            v20 = [*(id *)(*((void *)&v23 + 1) + 8 * v18) endowmentNamespace];
            [(NSCountedSet *)v19 addObject:v20];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v16);
      }

      id v6 = v22;
    }
  }
  return v5;
}

- (void)removeInheritance:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (!v5)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"RBInheritanceCollection.m", 188, @"Invalid parameter not satisfying: %@", @"inheritance != nil" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [v5 environment];
  if (v6)
  {
    v7 = [(NSDictionary *)self->super._inheritancesByEnvironment objectForKey:v6];
    [v7 removeObject:v13];
    if (![v7 count]) {
      [(NSDictionary *)self->super._inheritancesByEnvironment removeObjectForKey:v6];
    }
  }
  [(NSSet *)self->super._inheritances removeObject:v13];
  countedNamespaces = self->_countedNamespaces;
  id v9 = [v13 endowmentNamespace];
  [(NSCountedSet *)countedNamespaces removeObject:v9];

  if (![(NSSet *)self->super._inheritances count])
  {
    inheritances = self->super._inheritances;
    self->super._inheritances = 0;
  }
  if (![(NSCountedSet *)self->_countedNamespaces count])
  {
    v11 = self->_countedNamespaces;
    self->_countedNamespaces = 0;
  }
}

void __54__RBMutableInheritanceCollection__initWithCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (void)unionCollection:(id)a3
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
        [(RBMutableInheritanceCollection *)self addInheritance:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addInheritance:(id)a3
{
  id v5 = a3;
  id v18 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"RBInheritanceCollection.m", 161, @"Invalid parameter not satisfying: %@", @"inheritance != nil" object file lineNumber description];

    id v5 = 0;
  }
  if (!self->super._inheritances)
  {
    uint64_t v6 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    inheritances = self->super._inheritances;
    self->super._inheritances = v6;

    id v5 = v18;
  }
  if (!self->_countedNamespaces)
  {
    uint64_t v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    countedNamespaces = self->_countedNamespaces;
    self->_countedNamespaces = v8;

    id v5 = v18;
  }
  long long v10 = [v5 environment];
  if (v10)
  {
    inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    if (!inheritancesByEnvironment)
    {
      long long v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v13 = self->super._inheritancesByEnvironment;
      self->super._inheritancesByEnvironment = v12;

      inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    }
    uint64_t v14 = [(NSDictionary *)inheritancesByEnvironment objectForKey:v10];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263EFF9C0] set];
      [(NSDictionary *)self->super._inheritancesByEnvironment setObject:v14 forKey:v10];
    }
    [v14 addObject:v18];
  }
  [(NSSet *)self->super._inheritances addObject:v18];
  uint64_t v15 = self->_countedNamespaces;
  uint64_t v16 = [v18 endowmentNamespace];
  [(NSCountedSet *)v15 addObject:v16];
}

+ (id)collectionWithInheritances:(id)a3
{
  id v4 = a3;
  id v5 = [RBMutableInheritanceCollection alloc];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___RBMutableInheritanceCollection;
  uint64_t v6 = objc_msgSendSuper2(&v9, sel_collectionWithInheritances_, v4);

  id v7 = [(RBMutableInheritanceCollection *)v5 _initWithCollection:v6];
  return v7;
}

@end