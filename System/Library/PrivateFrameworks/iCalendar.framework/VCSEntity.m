@interface VCSEntity
+ (id)stringForType:(unint64_t)a3;
- (BOOL)hasPropertyWithName:(id)a3;
- (BOOL)isValidStatus:(unint64_t)a3;
- (NSArray)alarms;
- (NSArray)children;
- (NSArray)properties;
- (NSString)description;
- (VCSEntity)init;
- (VCSEntity)parent;
- (id)dictify;
- (id)propertyForName:(id)a3;
- (unint64_t)entityType;
- (void)addChildEntity:(id)a3;
- (void)removePropertyForName:(id)a3;
- (void)setParent:(id)a3;
- (void)setProperty:(id)a3;
@end

@implementation VCSEntity

+ (id)stringForType:(unint64_t)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6C25C20[a3];
  }
  return v3;
}

- (VCSEntity)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCSEntity;
  v2 = [(VCSEntity *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    propertyMap = v2->_propertyMap;
    v2->_propertyMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)dictify
{
  uint64_t v3 = objc_opt_new();
  v4 = objc_msgSend((id)objc_opt_class(), "stringForType:", -[VCSEntity entityType](self, "entityType"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  if ([(NSMutableDictionary *)self->_propertyMap count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_propertyMap, "count"));
    propertyMap = self->_propertyMap;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __20__VCSEntity_dictify__block_invoke;
    v11[3] = &unk_1E6C25BC0;
    id v12 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)propertyMap enumerateKeysAndObjectsUsingBlock:v11];
    objc_super v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"properties"];
  }
  if ([(NSMutableArray *)self->_children count])
  {
    v9 = [(NSMutableArray *)self->_children VCS_map:&__block_literal_global_28];
    [v3 setObject:v9 forKeyedSubscript:@"children"];
  }
  return v3;
}

void __20__VCSEntity_dictify__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = [a3 values];
  v6 = objc_msgSend(v7, "VCS_map:", &__block_literal_global_12);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __20__VCSEntity_dictify__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictify];
}

uint64_t __20__VCSEntity_dictify__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictify];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(VCSEntity *)self dictify];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (NSArray)children
{
  v2 = (void *)[(NSMutableArray *)self->_children copy];
  return (NSArray *)v2;
}

- (NSArray)properties
{
  return (NSArray *)[(NSMutableDictionary *)self->_propertyMap allValues];
}

- (unint64_t)entityType
{
  return 0;
}

- (void)setProperty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [v4 name];

    id v4 = v8;
    if (v5)
    {
      propertyMap = self->_propertyMap;
      id v7 = [v8 name];
      [(NSMutableDictionary *)propertyMap setObject:v8 forKeyedSubscript:v7];

      id v4 = v8;
    }
  }
}

- (void)removePropertyForName:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_propertyMap, "removeObjectForKey:");
  }
}

- (BOOL)hasPropertyWithName:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyMap, "objectForKeyedSubscript:");
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)propertyForName:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyMap, "objectForKeyedSubscript:");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)addChildEntity:(id)a3
{
  id v4 = a3;
  [v4 setParent:self];
  [(NSMutableArray *)self->_children addObject:v4];
}

- (NSArray)alarms
{
  return (NSArray *)[(NSMutableArray *)self->_children VCS_filter:&__block_literal_global_37];
}

BOOL __19__VCSEntity_alarms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 entityType] == 4;
}

- (BOOL)isValidStatus:(unint64_t)a3
{
  return 1;
}

- (VCSEntity)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (VCSEntity *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_propertyMap, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end