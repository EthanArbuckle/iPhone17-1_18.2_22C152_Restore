@interface OUObjectAsset
+ (BOOL)supportsSecureCoding;
- (NSArray)objects;
- (NSDictionary)groups;
- (OUObjectAsset)init;
- (OUObjectAsset)initWithCoder:(id)a3;
- (OUObjectAsset)initWithDictionaryRepresentation:(id)a3;
- (OUPointCloud)frustumPointCloud;
- (id)GetAllObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setFrustumPointCloud:(id)a3;
- (void)setGroups:(id)a3;
- (void)setObjects:(id)a3;
@end

@implementation OUObjectAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OUObjectAsset)init
{
  v8.receiver = self;
  v8.super_class = (Class)OUObjectAsset;
  v2 = [(OUObjectAsset *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    groups = v2->_groups;
    v2->_groups = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v5;
  }
  return v2;
}

- (OUObjectAsset)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OUObjectAsset;
  uint64_t v5 = [(OUObjectAsset *)&v17 init];
  id v6 = [v4 objectForKeyedSubscript:@"objects"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = (NSMutableArray *)v6;
  }
  else {
    v7 = 0;
  }

  objects = v5->_objects;
  v5->_objects = v7;

  if (!v5->_objects)
  {
    uint64_t v9 = objc_opt_new();
    v10 = v5->_objects;
    v5->_objects = (NSMutableArray *)v9;
  }
  id v11 = [v4 objectForKeyedSubscript:@"groups"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = (NSMutableDictionary *)v11;
  }
  else {
    v12 = 0;
  }

  groups = v5->_groups;
  v5->_groups = v12;

  if (!v5->_groups)
  {
    uint64_t v14 = objc_opt_new();
    v15 = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(OUObjectAsset);
  uint64_t v5 = [(NSMutableDictionary *)self->_groups mutableCopy];
  groups = v4->_groups;
  v4->_groups = (NSMutableDictionary *)v5;

  uint64_t v7 = [(NSMutableArray *)self->_objects mutableCopy];
  objects = v4->_objects;
  v4->_objects = (NSMutableArray *)v7;

  return v4;
}

- (OUObjectAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)OUObjectAsset;
  uint64_t v5 = [(OUObjectAsset *)&v18 init];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"groups"];
  v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v10 mutableCopy];
  groups = v5->_groups;
  v5->_groups = (NSMutableDictionary *)v11;

  v13 = [v4 decodeObjectOfClasses:v8 forKey:@"objects"];
  uint64_t v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = [v14 mutableCopy];
  objects = v5->_objects;
  v5->_objects = (NSMutableArray *)v15;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_objects forKey:@"objects"];
  [v4 encodeObject:self->_groups forKey:@"groups"];
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_objects forKeyedSubscript:@"objects"];
  [v3 setObject:self->_groups forKeyedSubscript:@"groups"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)GetAllObjects
{
  v2 = (void *)[(NSMutableArray *)self->_objects copy];
  return v2;
}

- (OUPointCloud)frustumPointCloud
{
  return self->_frustumPointCloud;
}

- (void)setFrustumPointCloud:(id)a3
{
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (void)setObjects:(id)a3
{
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (void)setGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frustumPointCloud, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end