@interface RSObjectAsset
+ (BOOL)supportsSecureCoding;
- (NSArray)objects;
- (NSDictionary)groups;
- (RSObjectAsset)init;
- (RSObjectAsset)initWithCoder:(id)a3;
- (id)GetAllObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RSObjectAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (id)GetAllObjects
{
  return self->_objects;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend_encodeObject_forKey_(v6, v4, (uint64_t)self->_objects, @"objects");
  objc_msgSend_encodeObject_forKey_(v6, v5, (uint64_t)self->_groups, @"groups");
}

- (RSObjectAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RSObjectAsset;
  v5 = [(RSObjectAsset *)&v30 init];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
  v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"groups");
  v15 = objc_msgSend_mutableCopy(v12, v13, v14);

  uint64_t v18 = objc_msgSend_mutableCopy(v15, v16, v17);
  groups = v5->_groups;
  v5->_groups = (NSMutableDictionary *)v18;

  v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v10, @"objects");
  v24 = objc_msgSend_mutableCopy(v21, v22, v23);

  uint64_t v27 = objc_msgSend_mutableCopy(v24, v25, v26);
  objects = v5->_objects;
  v5->_objects = (NSMutableArray *)v27;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RSObjectAsset);
  uint64_t v7 = objc_msgSend_mutableCopy(self->_groups, v5, v6);
  groups = v4->_groups;
  v4->_groups = (NSMutableDictionary *)v7;

  uint64_t v11 = objc_msgSend_mutableCopy(self->_objects, v9, v10);
  objects = v4->_objects;
  v4->_objects = (NSMutableArray *)v11;

  return v4;
}

- (RSObjectAsset)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSObjectAsset;
  v2 = [(RSObjectAsset *)&v8 init];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end