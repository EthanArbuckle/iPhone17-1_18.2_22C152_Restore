@interface VFXNodeManipulableItem
+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(float)a4;
+ (void)addItems:(id)a3 toWorld:(id)a4;
+ (void)removeItemsFromWorld:(id)a3;
- (__n128)draggedTransform;
- (id)cloneForManipulators;
- (id)parentItem;
- (uint64_t)scale;
- (uint64_t)setTransform:(uint64_t)a3;
- (uint64_t)setWorldTransform:(uint64_t)a3;
- (uint64_t)transform;
- (uint64_t)worldTransform;
- (void)initializeDraggedTransform;
- (void)validateClone;
@end

@implementation VFXNodeManipulableItem

+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(float)a4
{
  v6 = objc_alloc_init(VFXNodeManipulableItem);
  *(float *)&double v7 = a4;
  objc_msgSend_setScreenSize_(v6, v8, v9, v10, v7);
  objc_msgSend_setNode_(v6, v11, (uint64_t)a3, v12);

  return v6;
}

- (uint64_t)transform
{
  v4 = objc_msgSend_node(a1, a2, a3, a4);
  v8 = objc_msgSend_presentationNode(v4, v5, v6, v7);

  return objc_msgSend_transform(v8, v9, v10, v11);
}

- (__n128)draggedTransform
{
  return a1[7];
}

- (void)initializeDraggedTransform
{
  v4 = self + 1;
  v5 = objc_msgSend_node(self, a2, v2, v3);
  objc_msgSend_transform(v5, v6, v7, v8);
  *(_OWORD *)&v4->super.super.isa = v9;
  *(_OWORD *)&v4->super.node = v10;
  *(_OWORD *)&v4->super.elementIndex = v11;
  *(_OWORD *)v4->_anon_30 = v12;
}

- (uint64_t)setTransform:(uint64_t)a3
{
  double v16 = a8.n128_f64[0];
  double v14 = a6.n128_f64[0];
  double v15 = a7.n128_f64[0];
  double v13 = a5.n128_f64[0];
  a1[7] = a5;
  a1[8] = a6;
  a1[9] = a7;
  a1[10] = a8;
  uint64_t v8 = objc_msgSend_node(a1, a2, a3, a4);

  return objc_msgSend_setTransform_(v8, v9, v10, v11, v13, v14, v15, v16);
}

- (uint64_t)worldTransform
{
  v4 = objc_msgSend_node(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_presentationNode(v4, v5, v6, v7);

  return objc_msgSend_worldTransform(v8, v9, v10, v11);
}

- (uint64_t)setWorldTransform:(uint64_t)a3
{
  long long v9 = objc_msgSend_node(a1, a2, a3, a4);
  if (objc_msgSend_parentNode(v9, v10, v11, v12))
  {
    double v16 = objc_msgSend_node(a1, v13, v14, v15);
    v20 = objc_msgSend_parentNode(v16, v17, v18, v19);
    objc_msgSend_convertTransform_fromNode_(v20, v21, 0, v22, a5, a6, a7, a8);
  }
  else
  {
    double v26 = a8;
    double v24 = a6;
    double v25 = a7;
    double v23 = a5;
  }

  return objc_msgSend_setTransform_(a1, v13, v14, v15, v23, v24, v25, v26);
}

- (uint64_t)scale
{
  v4 = objc_msgSend_node(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_presentationNode(v4, v5, v6, v7);

  return objc_msgSend_scale(v8, v9, v10, v11);
}

- (id)parentItem
{
  v5 = objc_msgSend_node(self, a2, v2, v3);
  id result = (id)objc_msgSend_parentNode(v5, v6, v7, v8);
  if (result)
  {
    double v13 = objc_msgSend_node(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_parentNode(v13, v14, v15, v16);
    objc_msgSend_screenSize(self, v18, v19, v20);
    return (id)objc_msgSend_nodeManipulatorItemWithNode_screenSize_(VFXNodeManipulableItem, v21, v17, v22);
  }
  return result;
}

- (id)cloneForManipulators
{
  v5 = objc_msgSend_node(self, a2, v2, v3);
  long long v9 = objc_msgSend_clone(v5, v6, v7, v8);
  objc_msgSend_opacity(v9, v10, v11, v12);
  *(float *)&double v14 = v13 * 0.5;
  objc_msgSend_setOpacity_(v9, v15, v16, v17, v14);
  objc_msgSend_setGizmo_(v9, v18, 1, v19);
  double v23 = objc_msgSend_node(self, v20, v21, v22);
  objc_msgSend_convertTransform_toNode_(v23, v24, 0, v25, *(double *)&VFXMatrix4Identity, unk_1B6E51E70, 0.0, unk_1B6E51E90);
  objc_msgSend_setTransform_(v9, v26, v27, v28);
  objc_msgSend_screenSize(self, v29, v30, v31);

  return (id)objc_msgSend_nodeManipulatorItemWithNode_screenSize_(VFXNodeManipulableItem, v32, (uint64_t)v9, v33);
}

+ (void)addItems:(id)a3 toWorld:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(a3);
        }
        float v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        double v14 = objc_msgSend_rootNode(a4, v7, v8, v9);
        uint64_t v18 = objc_msgSend_node(v13, v15, v16, v17);
        objc_msgSend_addChildNode_(v14, v19, v18, v20);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v7, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v10);
  }
}

+ (void)removeItemsFromWorld:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = objc_msgSend_node(*(void **)(*((void *)&v15 + 1) + 8 * v10), v5, v6, v7);
        objc_msgSend_removeFromParentNode(v11, v12, v13, v14);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }
}

- (void)validateClone
{
  v5 = objc_msgSend_node(self, a2, v2, v3);
  objc_msgSend_setGizmo_(v5, v6, 0, v7);
  uint64_t v11 = objc_msgSend_node(self, v8, v9, v10);
  objc_msgSend_opacity(v11, v12, v13, v14);
  *(float *)&double v18 = *(float *)&v18 + *(float *)&v18;

  objc_msgSend_setOpacity_(v11, v15, v16, v17, v18);
}

@end