@interface VFXPrefab
+ (BOOL)supportsSecureCoding;
+ (id)prefabWithAsset:(id)a3;
- (VFXPrefab)initWithAsset:(id)a3;
- (VFXPrefab)initWithCoder:(id)a3;
- (VFXPrefabAsset)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reload:(id)a3 options:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation VFXPrefab

- (VFXPrefab)initWithAsset:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXPrefab;
  v4 = [(VFXPrefab *)&v9 init];
  v7 = v4;
  if (v4) {
    objc_msgSend_setSource_(v4, v5, (uint64_t)a3, v6);
  }
  return v7;
}

+ (id)prefabWithAsset:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithAsset_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPrefab;
  [(VFXPrefab *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [VFXPrefab alloc];
  source = self->_source;

  return (id)objc_msgSend_initWithAsset_(v4, v5, (uint64_t)source, v6);
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p source=%@>", v7, v5, self, self->_source);
}

- (id)reload:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_source(self, a2, (uint64_t)a3, a4);
  v11 = objc_msgSend_rootNode(v7, v8, v9, v10);
  v15 = objc_msgSend_clone(v11, v12, v13, v14);
  v18 = v15;
  if (!a3 || (a4 & 0x80) != 0)
  {
    objc_msgSend_setPrefab_(v15, v16, (uint64_t)self, v17);
    if (a3 && v18) {
      objc_msgSend_copyWithOptions_to_(a3, v21, 0, (uint64_t)v18);
    }
  }
  else
  {
    v19 = objc_alloc_init(VFXPrefabUpdater);
    objc_msgSend_updatePrefab_withNewPrefab_options_(v19, v20, (uint64_t)a3, (uint64_t)v18, a4);
    return 0;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  if (source) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)source, @"source");
  }
}

- (VFXPrefab)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VFXPrefab;
  id v4 = [(VFXPrefab *)&v16 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v17, 1);
    uint64_t v10 = objc_msgSend_setWithArray_(v5, v8, v7, v9);
    uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, @"source");
    objc_msgSend_setSource_(v4, v13, v12, v14);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXPrefabAsset)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

@end