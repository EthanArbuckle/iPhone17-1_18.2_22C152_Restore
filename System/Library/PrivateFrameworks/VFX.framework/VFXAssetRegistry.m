@interface VFXAssetRegistry
+ (BOOL)supportsSecureCoding;
- (VFXAssetNode)rootNode;
- (VFXAssetRegistry)init;
- (VFXAssetRegistry)initWithCoder:(id)a3;
- (VFXWorld)world;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setWorld:(id)a3;
@end

@implementation VFXAssetRegistry

- (VFXAssetRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)VFXAssetRegistry;
  v5 = [(VFXAssetRegistry *)&v10 init];
  if (v5)
  {
    v6 = (VFXAssetNode *)(id)objc_msgSend_group(VFXAssetNode, v2, v3, v4);
    v5->_root = v6;
    objc_msgSend_setRegistry_(v6, v7, (uint64_t)v5, v8);
  }
  return v5;
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (VFXWorld)world
{
  return self->_world;
}

- (void)dealloc
{
  objc_msgSend_setRegistry_(self->_root, a2, 0, v2);

  self->_world = 0;
  v4.receiver = self;
  v4.super_class = (Class)VFXAssetRegistry;
  [(VFXAssetRegistry *)&v4 dealloc];
}

- (VFXAssetNode)rootNode
{
  return self->_root;
}

- (VFXAssetRegistry)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXAssetRegistry;
  objc_super v4 = [(VFXAssetRegistry *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v7 = (VFXAssetNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"root");
    v4->_root = v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B6590C18;
    v11[3] = &unk_1E61449B0;
    v11[4] = v4;
    objc_msgSend_enumerateHierarchyUsingBlock_(v7, v8, (uint64_t)v11, v9);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end