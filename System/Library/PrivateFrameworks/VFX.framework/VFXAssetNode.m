@interface VFXAssetNode
+ (BOOL)supportsSecureCoding;
+ (id)assetNodeWithAsset:(id)a3;
+ (id)group;
- (BOOL)_enumerateChildNodesUsingBlock:(id)a3;
- (BOOL)isGroup;
- (BOOL)isPrefab;
- (NSArray)childNodes;
- (NSString)name;
- (VFXAsset)asset;
- (VFXAssetNode)init;
- (VFXAssetNode)initWithCoder:(id)a3;
- (VFXAssetNode)parentNode;
- (id)childNodeWithAssetName:(id)a3;
- (id)childNodeWithName:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)enclosingPrefab;
- (id)registry;
- (void)_removeChild:(id)a3;
- (void)addChildNode:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChildNodesUsingBlock:(id)a3;
- (void)enumerateHierarchyUsingBlock:(id)a3;
- (void)insertChildNode:(id)a3 atIndex:(unint64_t)a4;
- (void)removeFromParent;
- (void)setChildNodes:(id)a3;
- (void)setName:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setupChildsArrayIfNeeded;
@end

@implementation VFXAssetNode

- (VFXAssetNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAssetNode;
  return [(VFXAssetNode *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAssetNode;
  [(VFXAssetNode *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[16] = self->_isGroup;
  v5[17] = self->_prefab;
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  objc_msgSend_setName_(v5, v10, v9, v11);
  v15 = objc_msgSend_asset(self, v12, v13, v14);
  *((void *)v5 + 1) = objc_msgSend_copyWithZone_(v15, v16, (uint64_t)a3, v17);
  return v5;
}

- (id)clone
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_copy(self, a2, v2, v3);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = objc_msgSend_childNodes(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = objc_msgSend_clone(*(void **)(*((void *)&v22 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addChildNode_(v5, v19, v18, v20);
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v15);
  }
  return v5;
}

- (void)setRegistry:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  registry = self->_registry;
  if (registry != a3)
  {
    uint64_t v7 = objc_msgSend_world(registry, a2, (uint64_t)a3, v3);
    if (v7)
    {
      uint64_t v11 = v7;
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_removeWorldReference_(self->_asset, v8, v11, v10);
      }
    }
    self->_registry = (VFXAssetRegistry *)a3;
    uint64_t v12 = objc_msgSend_world(a3, v8, v9, v10);
    if (v12)
    {
      uint64_t v16 = v12;
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_addWorldReference_(self->_asset, v13, v16, v15);
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = objc_msgSend_childNodes(self, v13, v14, v15, 0);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v25, (uint64_t)v29, 16);
    if (v19)
    {
      uint64_t v22 = v19;
      uint64_t v23 = *(void *)v26;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend_setRegistry_(*(void **)(*((void *)&v25 + 1) + 8 * v24++), v20, (uint64_t)a3, v21);
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v25, (uint64_t)v29, 16);
      }
      while (v22);
    }
  }
}

- (id)registry
{
  return self->_registry;
}

+ (id)assetNodeWithAsset:(id)a3
{
  v4 = objc_alloc_init(VFXAssetNode);
  v4->_asset = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(_WORD *)&v4->_isGroup = 257;
  }
  return v4;
}

+ (id)group
{
  id result = objc_alloc_init(VFXAssetNode);
  *((unsigned char *)result + 16) = 1;
  return result;
}

- (VFXAssetNode)parentNode
{
  return self->_parent;
}

- (NSArray)childNodes
{
  return &self->_children->super;
}

- (void)setChildNodes:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  children = self->_children;
  if (children) {
    uint64_t v7 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], a2, (uint64_t)children, v3);
  }
  else {
    uint64_t v7 = 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_msgSend_removeObject_(v7, v9, (uint64_t)v14, v10);
        if ((VFXAssetNode *)v14[4] != self)
        {
          objc_msgSend_removeFromParent(v14, v9, v15, v10);
          v14[4] = self;
          objc_msgSend_setRegistry_(v14, v16, (uint64_t)self->_registry, v17);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v11);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v28, (uint64_t)v36, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v7);
        }
        uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        *(void *)(v25 + 32) = 0;
        *(void *)(v25 + 48) = 0;
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v19, (uint64_t)&v28, (uint64_t)v36, 16);
    }
    while (v22);
  }
  objc_msgSend_setupChildsArrayIfNeeded(self, v19, v20, v21);
  objc_msgSend_setArray_(self->_children, v26, (uint64_t)a3, v27);
}

- (void)setupChildsArrayIfNeeded
{
  if (!self->_children) {
    self->_children = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
}

- (void)addChildNode:(id)a3
{
  if (*((void *)a3 + 4)) {
    objc_msgSend_removeFromParent(a3, a2, (uint64_t)a3, v3);
  }
  *((void *)a3 + 4) = self;
  objc_msgSend_setRegistry_(a3, a2, (uint64_t)self->_registry, v3);
  objc_msgSend_setupChildsArrayIfNeeded(self, v6, v7, v8);
  children = self->_children;

  objc_msgSend_addObject_(children, v9, (uint64_t)a3, v10);
}

- (void)insertChildNode:(id)a3 atIndex:(unint64_t)a4
{
  if (*((void *)a3 + 4)) {
    objc_msgSend_removeFromParent(a3, a2, (uint64_t)a3, a4);
  }
  objc_msgSend_setRegistry_(a3, a2, (uint64_t)self->_registry, a4);
  *((void *)a3 + 4) = self;
  objc_msgSend_setupChildsArrayIfNeeded(self, v7, v8, v9);
  children = self->_children;

  objc_msgSend_insertObject_atIndex_(children, v10, (uint64_t)a3, a4);
}

- (void)_removeChild:(id)a3
{
  objc_msgSend_setRegistry_(a3, a2, 0, v3);
  children = self->_children;

  objc_msgSend_removeObject_(children, v6, (uint64_t)a3, v7);
}

- (void)removeFromParent
{
  v5 = objc_msgSend_parentNode(self, a2, v2, v3);
  objc_msgSend__removeChild_(v5, v6, (uint64_t)self, v7);
  self->_parent = 0;
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v21 = 0;
  (*((void (**)(id, VFXAssetNode *, char *))a3 + 2))(a3, self, &v21);
  if (!v21)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend_childNodes(self, v5, v6, v7, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v22, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v9);
          }
          char v21 = objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((void *)&v17 + 1) + 8 * i), v12, (uint64_t)a3, v13);
          if (v21) {
            return 1;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, (uint64_t)v22, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  return v21 != 0;
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((void *)&v13 + 1) + 8 * v12), v8, (uint64_t)a3, v9))break; {
      if (v10 == ++v12)
      }
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v10) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(id)a3
{
  char v7 = 0;
  (*((void (**)(id, VFXAssetNode *, char *))a3 + 2))(a3, self, &v7);
  if (!v7) {
    objc_msgSend_enumerateChildNodesUsingBlock_(self, v5, (uint64_t)a3, v6);
  }
}

- (id)childNodeWithAssetName:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_1B6590404;
  uint64_t v11 = sub_1B6590414;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B6590420;
  v6[3] = &unk_1E6144988;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateChildNodesUsingBlock_(self, a2, (uint64_t)v6, v3);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)childNodeWithName:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_1B6590404;
  uint64_t v11 = sub_1B6590414;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B659055C;
  v6[3] = &unk_1E6144988;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateChildNodesUsingBlock_(self, a2, (uint64_t)v6, v3);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)enclosingPrefab
{
  while (1)
  {
    v4 = self;
    if (!self || (objc_msgSend_isPrefab(self, a2, v2, v3) & 1) != 0) {
      break;
    }
    self = (VFXAssetNode *)objc_msgSend_parentNode(v4, v5, v6, v7);
  }
  return v4;
}

- (NSString)name
{
  id asset = self->_asset;
  if (asset) {
    return (NSString *)objc_msgSend_name(asset, a2, v2, v3);
  }
  else {
    return self->_name;
  }
}

- (void)setName:(id)a3
{
  id asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setName_(asset, a2, (uint64_t)a3, v3);
  }
  else
  {
    name = self->_name;
    if (name != a3)
    {

      self->_name = (NSString *)a3;
    }
  }
}

- (VFXAsset)asset
{
  return (VFXAsset *)self->_asset;
}

- (BOOL)isGroup
{
  return self->_isGroup || objc_msgSend_count(self->_children, a2, v2, v3) != 0;
}

- (BOOL)isPrefab
{
  return self->_prefab;
}

- (VFXAssetNode)initWithCoder:(id)a3
{
  v48[8] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)VFXAssetNode;
  uint64_t v6 = [(VFXAssetNode *)&v45 init];
  if (!v6) {
    return v6;
  }
  v6->_isGroup = objc_msgSend_decodeBoolForKey_(a3, v4, @"isGroup", v5);
  v6->_prefab = objc_msgSend_decodeBoolForKey_(a3, v7, @"isPrefab", v8);
  if (v6->_isGroup)
  {
    uint64_t v9 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"name");
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  v48[2] = objc_opt_class();
  v48[3] = objc_opt_class();
  v48[4] = objc_opt_class();
  v48[5] = objc_opt_class();
  v48[6] = objc_opt_class();
  v48[7] = objc_opt_class();
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v48, 8);
  uint64_t v16 = objc_msgSend_setWithArray_(v11, v14, v13, v15);
  v6->_id asset = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v17, v16, @"asset");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v18 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }

    id v18 = (id)objc_msgSend_mesh(v6->_asset, v19, v20, v21);
  }
  v6->_id asset = v18;
LABEL_9:
  uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v47, 2);
  uint64_t v27 = objc_msgSend_setWithArray_(v22, v25, v24, v26);
  long long v29 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v28, v27, @"childNodes");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v41, (uint64_t)v46, 16);
  if (v31)
  {
    uint64_t v35 = v31;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v29);
        }
        uint64_t v38 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ((objc_msgSend_isGroup(v38, v32, v33, v34) & 1) != 0 || objc_msgSend_asset(v38, v32, v39, v34)) {
          objc_msgSend_addChildNode_(v6, v32, (uint64_t)v38, v34);
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v41, (uint64_t)v46, 16);
    }
    while (v35);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_isGroup)
  {
    objc_msgSend_encodeBool_forKey_(a3, a2, 1, @"isGroup");
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_name, @"name");
    if (self->_prefab) {
      objc_msgSend_encodeBool_forKey_(a3, a2, 1, @"isPrefab");
    }
  }
  id asset = self->_asset;
  if (asset) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)asset, @"asset");
  }
  children = self->_children;
  if (children)
  {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)children, @"childNodes");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end