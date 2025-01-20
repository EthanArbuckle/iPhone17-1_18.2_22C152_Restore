@interface RBInheritanceCollection
+ (RBInheritanceCollection)collectionWithInheritances:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_initWithCollection:(id)a3;
- (id)_initWithInheritances:(id)a3;
- (id)allEnvironments;
- (id)allInheritances;
- (id)allNamespaces;
- (id)description;
- (id)inheritancesForEnvironment:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation RBInheritanceCollection

- (id)allNamespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_inheritancesByEnvironment, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSSet *)self->_inheritances countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)_initWithCollection:(id)a3
{
  id v4 = a3;
  v5 = [(RBInheritanceCollection *)self init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(NSDictionary) initWithDictionary:*((void *)v4 + 1) copyItems:1];
    inheritancesByEnvironment = v5->_inheritancesByEnvironment;
    v5->_inheritancesByEnvironment = (NSDictionary *)v6;

    uint64_t v8 = [*((id *)v4 + 2) copy];
    inheritances = v5->_inheritances;
    v5->_inheritances = (NSSet *)v8;

    v10 = [v4 allNamespaces];
    if ([v10 count])
    {
      uint64_t v11 = [MEMORY[0x263EFFA08] setWithSet:v10];
      namespaces = v5->_namespaces;
      v5->_namespaces = (NSSet *)v11;
    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [RBMutableInheritanceCollection alloc];
  return [(RBMutableInheritanceCollection *)v4 _initWithCollection:self];
}

- (unint64_t)count
{
  return [(NSSet *)self->_inheritances count];
}

- (id)allInheritances
{
  return self->_inheritances;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBInheritanceCollection *)a3;
  v5 = v4;
  if (self == v4
    || (inheritances = self->_inheritances, CFSetRef v7 = (const __CFSet *)v4->_inheritances, inheritances == (NSSet *)v7))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (inheritances && v7)
    {
      CFIndex Count = CFSetGetCount((CFSetRef)inheritances);
      if (Count == CFSetGetCount(v7)) {
        char v8 = [(NSSet *)inheritances isEqualToSet:v7];
      }
      else {
        char v8 = 0;
      }
    }
  }

  return v8;
}

- (id)inheritancesForEnvironment:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_inheritancesByEnvironment, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (RBInheritanceCollection)collectionWithInheritances:(id)a3
{
  id v3 = a3;
  id v4 = [[RBInheritanceCollection alloc] _initWithInheritances:v3];

  return (RBInheritanceCollection *)v4;
}

- (id)_initWithInheritances:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RBInheritanceCollection *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    v26 = v5;
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v25 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "environment", v25);
          if (v15)
          {
            v16 = [v7 objectForKey:v15];
            if (!v16)
            {
              v16 = [MEMORY[0x263EFF9C0] set];
              [v7 setObject:v16 forKey:v15];
            }
            [v16 addObject:v14];
          }
          v17 = [v14 endowmentNamespace];
          [v8 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [objc_alloc(NSDictionary) initWithDictionary:v7 copyItems:1];
    uint64_t v6 = v26;
    inheritancesByEnvironment = v26->_inheritancesByEnvironment;
    v26->_inheritancesByEnvironment = (NSDictionary *)v18;

    uint64_t v20 = [v8 copy];
    namespaces = v26->_namespaces;
    v26->_namespaces = (NSSet *)v20;

    uint64_t v22 = [v9 copy];
    inheritances = v26->_inheritances;
    v26->_inheritances = (NSSet *)v22;

    id v4 = v25;
  }

  return v6;
}

- (id)allEnvironments
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(NSDictionary *)self->_inheritancesByEnvironment allKeys];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  inheritancesByEnvironment = self->_inheritancesByEnvironment;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__RBInheritanceCollection_description__block_invoke;
  v10[3] = &unk_2647C81A8;
  id v11 = v3;
  id v5 = v3;
  [(NSDictionary *)inheritancesByEnvironment enumerateKeysAndObjectsUsingBlock:v10];
  id v6 = [NSString alloc];
  id v7 = [(id)objc_opt_class() description];
  id v8 = (void *)[v6 initWithFormat:@"<%@| inheritancesByEnvironment:{\n\t%@\n\t}>", v7, v5];

  return v8;
}

void __38__RBInheritanceCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [a3 allObjects];
  id v6 = [v7 componentsJoinedByString:@",\n\t\t"];
  [v4 appendFormat:@"%@=[\n\t\t%@\n\t\t]\n\t\t", v5, v6];
}

@end