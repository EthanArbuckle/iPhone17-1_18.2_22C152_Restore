@interface VFXPrefabAsset
+ (BOOL)supportsSecureCoding;
+ (id)prefabWithRootNode:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (VFXNode)rootNode;
- (VFXPrefabAsset)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setRootNode:(id)a3;
@end

@implementation VFXPrefabAsset

- (NSString)identifier
{
  return (NSString *)objc_msgSend_stringWithFormat_(NSString, a2, @"%p", v2, self->_rootNode);
}

+ (id)prefabWithRootNode:(id)a3
{
  v4 = objc_alloc_init(VFXPrefabAsset);
  v4->_rootNode = (VFXNode *)a3;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPrefabAsset;
  [(VFXPrefabAsset *)&v3 dealloc];
}

- (VFXNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  rootNode = self->_rootNode;
  if (rootNode != a3)
  {

    self->_rootNode = (VFXNode *)a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VFXPrefabAsset);
  v4->_rootNode = (VFXNode *)(id)objc_msgSend_rootNode(self, v5, v6, v7);
  return v4;
}

- (VFXPrefabAsset)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXPrefabAsset;
  v4 = [(VFXPrefabAsset *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_rootNode = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"rootNode");
    uint64_t v7 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"name");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_rootNode, @"rootNode");
  name = self->_name;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)name, @"name");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end