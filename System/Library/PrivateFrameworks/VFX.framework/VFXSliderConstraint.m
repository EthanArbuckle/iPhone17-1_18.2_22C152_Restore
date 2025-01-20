@interface VFXSliderConstraint
+ (BOOL)supportsSecureCoding;
+ (id)sliderConstraint;
- (VFXSliderConstraint)init;
- (VFXSliderConstraint)initWithCoder:(id)a3;
- (__n128)offset;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (unint64_t)collisionCategoryBitMask;
- (void)encodeWithCoder:(id)a3;
- (void)setCollisionCategoryBitMask:(unint64_t)a3;
- (void)setOffset:(VFXSliderConstraint *)self;
- (void)setRadius:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXSliderConstraint

- (VFXSliderConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)VFXSliderConstraint;
  v2 = [(VFXConstraint *)&v5 init];
  if (v2)
  {
    uint64_t v3 = sub_1B6462F5C();
    v2->_categoryBitMask = 0;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_radius = 1.0;
  }
  return v2;
}

+ (id)sliderConstraint
{
  v2 = objc_alloc_init(VFXSliderConstraint);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_collisionCategoryBitMask(self, v5, v6, v7);
  objc_msgSend_setCollisionCategoryBitMask_(v4, v9, v8, v10);
  objc_msgSend_offset(self, v11, v12, v13);
  objc_msgSend_setOffset_(v4, v14, v15, v16);
  objc_msgSend_radius(self, v17, v18, v19);
  objc_msgSend_setRadius_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (unint64_t)collisionCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCollisionCategoryBitMask:(unint64_t)a3
{
  self->_categoryBitMask = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6614D3C;
  v8[3] = &unk_1E61412A8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6614E0C;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"radius", v9);
}

- (__n128)offset
{
  return a1[4];
}

- (void)setOffset:(VFXSliderConstraint *)self
{
  *(_OWORD *)self->_offset = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6614ED4;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"offset", v8);
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"offset", v3))
  {
    v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_offset(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXSliderConstraint;
    return [(VFXSliderConstraint *)&v14 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"offset", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setOffset_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXSliderConstraint;
    [(VFXSliderConstraint *)&v13 setValue:a3 forKey:a4];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXSliderConstraint;
  -[VFXConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_categoryBitMask, @"collisionCategoryBitMask");
  *(float *)&double v6 = self->_radius;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"radius", v8, v6);
  sub_1B64FA2F4(a3, (const char *)@"offset", *(__n128 *)self->_offset);
}

- (VFXSliderConstraint)initWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VFXSliderConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v30, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->super._constraintRef = (__CFXConstraint *)sub_1B6462F5C();
    objc_msgSend_finalizeDecodeConstraint_(v7, v11, (uint64_t)a3, v12);
    uint64_t v15 = objc_msgSend_decodeIntegerForKey_(a3, v13, @"collisionCategoryBitMask", v14);
    objc_msgSend_setCollisionCategoryBitMask_(v7, v16, v15, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"radius", v19);
    objc_msgSend_setRadius_(v7, v20, v21, v22);
    double v23 = sub_1B64FA42C(a3, (const char *)@"offset");
    objc_msgSend_setOffset_(v7, v24, v25, v26, v23);
    objc_msgSend_setImmediateMode_(VFXTransaction, v27, v8, v28);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end