@interface VFXPhysicsShape
+ (BOOL)supportsSecureCoding;
+ (VFXPhysicsShape)shapeWithModel:(id)a3;
+ (VFXPhysicsShape)shapeWithNode:(id)a3 flattened:(BOOL)a4;
+ (VFXPhysicsShape)shapeWithShapes:(id)a3 transforms:(id)a4;
+ (id)defaultShapeForGeometry:(id)a3;
- (BOOL)flattened;
- (NSArray)shapes;
- (NSArray)transforms;
- (VFXModel)model;
- (VFXNode)shapeNode;
- (VFXPhysicsShape)initWithCoder:(id)a3;
- (VFXPhysicsShape)initWithContent:(id)a3;
- (__n128)scale;
- (float)margin;
- (id)_shapeHandle:(__CFXNode *)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)scaleValue;
- (id)valueForKey:(id)a3;
- (int64_t)type;
- (void)_customDecodingOfVFXPhysicsShape:(id)a3;
- (void)_customEncodingOfVFXPhysicsShape:(id)a3;
- (void)_setNodeScale:(VFXPhysicsShape *)self;
- (void)_setTransforms:(id)a3;
- (void)_updateScale;
- (void)commonInit;
- (void)dealloc;
- (void)didAddToPhysicsBody:(id)a3;
- (void)didChange;
- (void)didRemoveFromPhysicsBody:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setFlattened:(BOOL)a3;
- (void)setMargin:(float)a3;
- (void)setModel:(id)a3;
- (void)setScale:(VFXPhysicsShape *)self;
- (void)setScaleValue:(id)a3;
- (void)setShapeNode:(id)a3;
- (void)setShapes:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXPhysicsShape

- (void)commonInit
{
  self->_physicsBodiesLock._os_unfair_lock_opaque = 0;
  self->_physicsBodies = CFArrayCreateMutable(0, 1, 0);
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)self->_scale = _Q0;
  self->_margin = 0.0;
}

- (VFXPhysicsShape)initWithContent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXPhysicsShape;
  v4 = [(VFXPhysicsShape *)&v10 init];
  v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    v8->_referenceObject = a3;
  }
  return v8;
}

+ (VFXPhysicsShape)shapeWithModel:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_initWithContent_(v4, v5, (uint64_t)a3, v6);

  return (VFXPhysicsShape *)v7;
}

+ (VFXPhysicsShape)shapeWithNode:(id)a3 flattened:(BOOL)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  v9 = (unsigned char *)objc_msgSend_initWithContent_(v6, v7, (uint64_t)a3, v8);
  v9[80] = a4;

  return (VFXPhysicsShape *)v9;
}

+ (VFXPhysicsShape)shapeWithShapes:(id)a3 transforms:(id)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend_initWithContent_(v6, v7, (uint64_t)a3, v8);
  objc_msgSend__setTransforms_(v9, v10, (uint64_t)a4, v11);

  return (VFXPhysicsShape *)v9;
}

- (void)didAddToPhysicsBody:(id)a3
{
  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  CFArrayAppendValue(self->_physicsBodies, a3);

  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)didRemoveFromPhysicsBody:(id)a3
{
  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  physicsBodies = self->_physicsBodies;
  v16.length = CFArrayGetCount(physicsBodies);
  v16.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(physicsBodies, v16, a3);
  if (FirstIndexOfValue == -1) {
    sub_1B63F2F54(16, @"Error: didRemoveFromPhysicsBody - body not found", v8, v9, v10, v11, v12, v13, v14);
  }
  else {
    CFArrayRemoveValueAtIndex(self->_physicsBodies, FirstIndexOfValue);
  }

  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)didChange
{
  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  sub_1B63CC9FC(self->_physicsBodies, (uint64_t)&unk_1F0FB5D68);

  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)invalidate
{
  self->_shape = 0;

  objc_msgSend_didChange(self, v3, v4, v5);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_invalidate(self, a2, a3, v3);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsShape;
  [(VFXPhysicsShape *)&v3 dealloc];
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)_setTransforms:(id)a3
{
  self->_transforms = (NSArray *)a3;
}

- (id)_shapeHandle:(__CFXNode *)a3
{
  id result = self->_shape;
  if (!result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = objc_msgSend_geometryRef(self->_referenceObject, v6, v7, v8);
      id v10 = sub_1B6552AD0(v9, self->_type);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = objc_msgSend_nodeRef(self->_referenceObject, v11, v12, v13);
        id v10 = sub_1B6552B34(v14, self->_type, self->_flattened);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = sub_1B6552D28(self->_referenceObject, (uint64_t)self->_transforms);
        }
        else if (!a3 {
               || ((v22 = (void *)sub_1B649F5F4((uint64_t)a3, v15, v16, v17, v18, v19, v20, v21),
        }
                    int64_t type = self->_type,
                    !v22)
                 ? (id v10 = sub_1B6552B34(a3, type, self->_flattened))
                 : (id v10 = sub_1B6552AD0(v22, type)),
                   !v10))
        {
          sub_1B63F2F54(16, @"Error: unable to create a collision shape", v16, v17, v18, v19, v20, v21, v29);
          id v10 = 0;
        }
      }
    }
    id result = v10;
    self->_shape = (VFXBtShapeWrapper *)result;
    if (result)
    {
      float margin = self->_margin;
      if (margin != 0.0)
      {
        uint64_t v28 = objc_msgSend_btShape(result, v24, v25, v26);
        (*(void (**)(uint64_t, float))(*(void *)v28 + 88))(v28, margin);
        return self->_shape;
      }
    }
  }
  return result;
}

- (__n128)scale
{
  return a1[2];
}

- (void)setScale:(VFXPhysicsShape *)self
{
  float32x4_t v3 = (float32x4_t)v2;
  if (*(float *)v2.i32 != 0.0)
  {
    v4.i32[1] = v2.i32[1];
    v4.i32[0] = vextq_s8(v2, v2, 8uLL).u32[0];
    int32x2_t v5 = vceqz_f32(v4);
    if ((v5.i8[4] & 1) == 0 && (v5.i8[0] & 1) == 0)
    {
      float32x4_t v9 = v3;
      if ((VFXVector3EqualToVector3(*(float32x4_t *)self->_scale, v3) & 1) == 0)
      {
        *(float32x4_t *)self->_scale = v9;
        MEMORY[0x1F4181798](self, sel__updateScale, v7, v8);
      }
    }
  }
}

- (void)_setNodeScale:(VFXPhysicsShape *)self
{
  float32x4_t v3 = (float32x4_t)v2;
  if (*(float *)v2.i32 != 0.0)
  {
    v4.i32[1] = v2.i32[1];
    v4.i32[0] = vextq_s8(v2, v2, 8uLL).u32[0];
    int32x2_t v5 = vceqz_f32(v4);
    if ((v5.i8[4] & 1) == 0 && (v5.i8[0] & 1) == 0)
    {
      float32x4_t v9 = v3;
      if ((VFXVector3EqualToVector3(*(float32x4_t *)self->_nodeScale, v3) & 1) == 0)
      {
        *(float32x4_t *)self->_nodeScale = v9;
        MEMORY[0x1F4181798](self, sel__updateScale, v7, v8);
      }
    }
  }
}

- (void)_updateScale
{
  shape = self->_shape;
  if (shape)
  {
    float32x4_t v6 = *(float32x4_t *)self->_scale;
    float32x4_t v7 = vmulq_f32(v6, *(float32x4_t *)self->_nodeScale);
    if (v7.f32[0] != 0.0)
    {
      v6.i32[0] = v7.i32[1];
      if (v7.f32[1] != 0.0)
      {
        __int32 v8 = v7.i32[2];
        if (v7.f32[2] != 0.0)
        {
          uint64_t v10 = v7.i64[0];
          uint64_t v9 = objc_msgSend_btShape(shape, a2, v2, v3, *(double *)v6.i64);
          uint64_t v11 = v10;
          __int32 v12 = v8;
          int v13 = 0;
          (*(void (**)(uint64_t, uint64_t *))(*(void *)v9 + 48))(v9, &v11);
        }
      }
    }
    objc_msgSend_didChange(self, a2, v2, v3, *(double *)v6.i64);
  }
}

- (float)margin
{
  return self->_margin;
}

- (void)setMargin:(float)a3
{
  if (self->_margin != a3)
  {
    self->_float margin = a3;
    shape = self->_shape;
    if (shape)
    {
      float32x4_t v7 = *(void (**)(__n128))(*objc_msgSend_btShape(shape, a2, v3, v4) + 88);
      v8.n128_f32[0] = a3;
      v7(v8);
    }
  }
}

- (BOOL)flattened
{
  return self->_flattened;
}

- (void)setFlattened:(BOOL)a3
{
  if (self->_flattened != a3)
  {
    self->_flattened = a3;
    objc_msgSend_invalidate(self, a2, a3, v3);
  }
}

- (VFXModel)model
{
  if (objc_opt_isKindOfClass()) {
    return (VFXModel *)self->_referenceObject;
  }
  else {
    return 0;
  }
}

- (void)setModel:(id)a3
{
  id referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_id referenceObject = a3;
  }

  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (VFXNode)shapeNode
{
  if (objc_opt_isKindOfClass()) {
    return (VFXNode *)self->_referenceObject;
  }
  else {
    return 0;
  }
}

- (void)setShapeNode:(id)a3
{
  id referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_id referenceObject = a3;
  }

  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (NSArray)shapes
{
  if (objc_opt_isKindOfClass()) {
    return (NSArray *)self->_referenceObject;
  }
  else {
    return 0;
  }
}

- (void)setShapes:(id)a3
{
  id referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_id referenceObject = a3;
  }

  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_initWithContent_(v4, v5, (uint64_t)self->_referenceObject, v6);
  objc_msgSend_margin(self, v8, v9, v10);
  objc_msgSend_setMargin_((void *)v7, v11, v12, v13);
  objc_msgSend_scale(self, v14, v15, v16);
  objc_msgSend_setScale_((void *)v7, v17, v18, v19);
  *(unsigned char *)(v7 + 80) = self->_flattened;
  uint64_t v23 = objc_msgSend_type(self, v20, v21, v22);
  objc_msgSend_setType_((void *)v7, v24, v23, v25);
  *(void *)(v7 + 16) = objc_msgSend_transforms(self, v26, v27, v28);
  return (id)v7;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

+ (id)defaultShapeForGeometry:(id)a3
{
  int32x2_t v5 = objc_msgSend_valueForKey_(a3, a2, @"VFXDefaultPhysicsShape", v3);
  uint64_t v11 = objc_msgSend_pointerValue(v5, v6, v7, v8);
  if (!v11)
  {
    uint64_t v11 = objc_msgSend_shapeWithModel_(VFXPhysicsShape, v9, (uint64_t)a3, v10);
    uint64_t v14 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v12, (uint64_t)v11, v13);
    objc_msgSend_setValue_forKey_(a3, v15, v14, @"VFXDefaultPhysicsShape");
  }
  return v11;
}

- (void)_customEncodingOfVFXPhysicsShape:(id)a3
{
  transforms = self->_transforms;
  if (transforms)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    int v14 = 0;
    uint64_t v7 = objc_msgSend_count(transforms, a2, (uint64_t)a3, v3);
    objc_msgSend_encodeInteger_forKey_(a3, v8, v7, @"transformsCount");
    uint64_t v9 = self->_transforms;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B6554854;
    v12[3] = &unk_1E6141770;
    v12[4] = a3;
    v12[5] = v13;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v12, v11);
    _Block_object_dispose(v13, 8);
  }
}

- (void)_customDecodingOfVFXPhysicsShape:(id)a3
{
  uint64_t v6 = objc_msgSend_decodeIntegerForKey_(a3, a2, @"transformsCount", v3);
  if (v6 >= 1)
  {
    uint64_t v9 = v6;
    uint64_t v10 = 0;
    self->_transforms = (NSArray *)(id)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v7, v6, v8);
    do
    {
      transforms = self->_transforms;
      int v14 = (void *)MEMORY[0x1E4F29238];
      uint64_t v15 = (const char *)objc_msgSend_stringWithFormat_(NSString, v11, @"transform%d", v12, v10);
      *(void *)&double v16 = sub_1B64FA4B4(a3, v15).n128_u64[0];
      uint64_t v20 = objc_msgSend_valueWithVFXMatrix4_(v14, v17, v18, v19, v16);
      objc_msgSend_addObject_(transforms, v21, v20, v22);
      ++v10;
    }
    while (v9 != v10);
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend__customEncodingOfVFXPhysicsShape_(self, a2, (uint64_t)a3, v3);
  id referenceObject = self->_referenceObject;
  if (referenceObject) {
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)referenceObject, @"referenceObject");
  }
  *(float *)&double v8 = self->_margin;
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"margin", v7, v8);
  if (self->_flattened) {
    objc_msgSend_encodeBool_forKey_(a3, v10, 1, @"flattened");
  }
  __n128 v11 = *(__n128 *)self->_scale;

  sub_1B64FA2F4(a3, (const char *)@"scale", v11);
}

- (VFXPhysicsShape)initWithCoder:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)VFXPhysicsShape;
  id v4 = [(VFXPhysicsShape *)&v35 init];
  double v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    objc_msgSend__customDecodingOfVFXPhysicsShape_(v8, v15, (uint64_t)a3, v16);
    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v36[3] = objc_opt_class();
    uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v36, 4);
    uint64_t v22 = objc_msgSend_setWithArray_(v17, v20, v19, v21);
    v8->_id referenceObject = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v23, v22, @"referenceObject");
    objc_msgSend_decodeFloatForKey_(a3, v24, @"margin", v25);
    v8->_float margin = v26;
    v8->_flattened = objc_msgSend_decodeBoolForKey_(a3, v27, @"flattened", v28);
    if (objc_msgSend_containsValueForKey_(a3, v29, @"scale", v30))
    {
      *(double *)&long long v33 = sub_1B64FA42C(a3, (const char *)@"scale");
      *(_OWORD *)v8->_scale = v33;
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v31, v12, v32);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"scale", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_scale(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXPhysicsShape;
    return [(VFXPhysicsShape *)&v14 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"scale", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setScale_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXPhysicsShape;
    [(VFXPhysicsShape *)&v13 setValue:a3 forKey:a4];
  }
}

- (id)scaleValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  int32x2_t v5 = NSNumber;
  objc_msgSend_scale(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_scale(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_scale(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setScaleValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setScale_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

@end