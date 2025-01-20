@interface VFXManipulableItem
- (BOOL)isEqual:(id)a3;
- (VFXNode)node;
- (__n128)setDraggedTransform:(__n128)a3;
- (double)draggedTransform;
- (double)elementPosition;
- (double)scale;
- (double)transform;
- (double)worldTransform;
- (float)screenSize;
- (id)cloneForManipulators;
- (id)component;
- (id)parentItem;
- (unint64_t)elementIndex;
- (unint64_t)hash;
- (void)dealloc;
- (void)setComponent:(id)a3;
- (void)setElementIndex:(unint64_t)a3;
- (void)setNode:(id)a3;
- (void)setScreenSize:(float)a3;
- (void)setTransform:(uint64_t)a3;
- (void)setWorldTransform:(uint64_t)a3;
@end

@implementation VFXManipulableItem

- (void)setScreenSize:(float)a3
{
  self->_screenSize = a3;
}

- (float)screenSize
{
  return self->_screenSize;
}

- (void)dealloc
{
  objc_msgSend_setNode_(self, a2, 0, v2);
  objc_msgSend_setComponent_(self, v4, 0, v5);
  v6.receiver = self;
  v6.super_class = (Class)VFXManipulableItem;
  [(VFXManipulableItem *)&v6 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_node(self, v5, v6, v7);
    if (v8 == objc_msgSend_node(a3, v9, v10, v11)
      && (uint64_t v15 = objc_msgSend_elementIndex(self, v12, v13, v14), v15 == objc_msgSend_elementIndex(a3, v16, v17, v18)))
    {
      uint64_t v22 = objc_msgSend_component(a3, v19, v20, v21);
      return v22 == objc_msgSend_component(a3, v23, v24, v25);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)VFXManipulableItem;
    return [(VFXManipulableItem *)&v27 isEqual:a3];
  }
}

- (unint64_t)hash
{
  v4 = objc_msgSend_node(self, a2, v2, v3);

  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (double)transform
{
  return *(double *)&VFXMatrix4Identity;
}

- (double)draggedTransform
{
  return *(double *)&VFXMatrix4Identity;
}

- (void)setTransform:(uint64_t)a3
{
}

- (void)setWorldTransform:(uint64_t)a3
{
}

- (double)worldTransform
{
  return *(double *)&VFXMatrix4Identity;
}

- (double)scale
{
  return 0.00781250185;
}

- (id)parentItem
{
  return 0;
}

- (double)elementPosition
{
  return 0.0;
}

- (id)cloneForManipulators
{
  return 0;
}

- (VFXNode)node
{
  return self->node;
}

- (void)setNode:(id)a3
{
}

- (id)component
{
  return self->component;
}

- (void)setComponent:(id)a3
{
}

- (unint64_t)elementIndex
{
  return self->elementIndex;
}

- (void)setElementIndex:(unint64_t)a3
{
  self->elementIndex = a3;
}

- (__n128)setDraggedTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

@end