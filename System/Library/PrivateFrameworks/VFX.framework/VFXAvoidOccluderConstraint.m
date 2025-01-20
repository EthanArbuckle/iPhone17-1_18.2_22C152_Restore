@interface VFXAvoidOccluderConstraint
+ (BOOL)supportsSecureCoding;
+ (id)avoidOccluderConstraint;
+ (id)avoidOccluderConstraintWithTarget:(id)a3;
- (VFXAvoidOccluderConstraint)init;
- (VFXAvoidOccluderConstraint)initWithCoder:(id)a3;
- (VFXAvoidOccluderConstraintDelegate)delegate;
- (VFXNode)target;
- (float)bias;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)occluderCategoryBitMask;
- (void)_customDecodingOfVFXAvoidOccluderConstraint:(id)a3;
- (void)_customEncodingOfVFXAvoidOccluderConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)retargetWithRemapTable:(__CFDictionary *)a3;
- (void)setBias:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setOccluderCategoryBitMask:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation VFXAvoidOccluderConstraint

- (VFXAvoidOccluderConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)VFXAvoidOccluderConstraint;
  v2 = [(VFXConstraint *)&v5 init];
  if (v2)
  {
    uint64_t v3 = sub_1B6463CD0();
    v2->_categoryBitMask = 1;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_offset = 0.00001;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_delegate)
  {
    uint64_t v5 = objc_msgSend_worldRef(self->_target, a2, v2, v3);
    if (v5)
    {
      uint64_t v13 = v5;
      sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
      sub_1B64631A4((uint64_t)self->super._constraintRef, 0, v14, v15, v16, v17, v18, v19);
      sub_1B64B0CB4(v13, v20, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      sub_1B64631A4((uint64_t)self->super._constraintRef, 0, v7, v8, v9, v10, v11, v12);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)VFXAvoidOccluderConstraint;
  [(VFXConstraint *)&v27 dealloc];
}

+ (id)avoidOccluderConstraint
{
  uint64_t v2 = objc_alloc_init(VFXAvoidOccluderConstraint);

  return v2;
}

+ (id)avoidOccluderConstraintWithTarget:(id)a3
{
  v4 = objc_alloc_init(VFXAvoidOccluderConstraint);
  objc_msgSend_setTarget_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
  {
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  uint64_t v14 = objc_msgSend_occluderCategoryBitMask(self, v11, v12, v13);
  objc_msgSend_setOccluderCategoryBitMask_(v4, v15, v14, v16);
  objc_msgSend_bias(self, v17, v18, v19);
  objc_msgSend_setBias_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = a3;
    if (a3)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = sub_1B6615570;
      }
      else {
        uint64_t v5 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = nullsub_181;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = objc_msgSend_worldRef(self, v6, v7, v8);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_1B66155FC;
      v35[3] = &unk_1E6142EF0;
      v35[4] = self;
      v35[5] = v5;
      v35[6] = v9;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v35);
    }
    else
    {
      uint64_t v12 = objc_msgSend_worldRef(self->_target, a2, 0, v3);
      if (v12)
      {
        uint64_t v20 = v12;
        sub_1B64B0C28(v12, v13, v14, v15, v16, v17, v18, v19);
        sub_1B64631A4((uint64_t)self->super._constraintRef, 0, v21, v22, v23, v24, v25, v26);
        sub_1B64B0CB4(v20, v27, v28, v29, v30, v31, v32, v33);
      }
      else
      {
        constraintRef = self->super._constraintRef;
        sub_1B64631A4((uint64_t)constraintRef, 0, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (VFXAvoidOccluderConstraintDelegate)delegate
{
  return (VFXAvoidOccluderConstraintDelegate *)self->_delegate;
}

- (void)setTarget:(id)a3
{
  target = self->_target;
  if (target != a3)
  {

    uint64_t v6 = (VFXNode *)a3;
    self->_target = v6;
    if (v6) {
      uint64_t v10 = objc_msgSend_nodeRef(v6, v7, v8, v9);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = objc_msgSend_worldRef(self, v7, v8, v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B6615734;
    v13[3] = &unk_1E61412A8;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (VFXNode)target
{
  return self->_target;
}

- (void)setOccluderCategoryBitMask:(unint64_t)a3
{
  self->_categoryBitMask = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B66157F8;
  v8[3] = &unk_1E61412A8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (unint64_t)occluderCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setBias:(float)a3
{
  self->_offset = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66158C0;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (float)bias
{
  return self->_offset;
}

- (void)_customEncodingOfVFXAvoidOccluderConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, @"target");
  }
}

- (void)_customDecodingOfVFXAvoidOccluderConstraint:(id)a3
{
  uint64_t v5 = objc_opt_class();
  self->_target = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"target");
  uint64_t v7 = (__CFXConstraint *)sub_1B6463CD0();
  self->super._constraintRef = v7;
  uint64_t v11 = (const void *)objc_msgSend_nodeRef(self->_target, v8, v9, v10);
  sub_1B6463220((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend_finalizeDecodeConstraint_(self, v18, (uint64_t)a3, v19);
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VFXAvoidOccluderConstraint;
  -[VFXConstraint encodeWithCoder:](&v11, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXAvoidOccluderConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_categoryBitMask, @"categoryBitMask");
  *(float *)&double v8 = self->_offset;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"bias", v10, v8);
}

- (VFXAvoidOccluderConstraint)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VFXAvoidOccluderConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXAvoidOccluderConstraint_(v7, v11, (uint64_t)a3, v12);
    uint64_t v15 = objc_msgSend_decodeIntegerForKey_(a3, v13, @"categoryBitMask", v14);
    objc_msgSend_setOccluderCategoryBitMask_(v7, v16, v15, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"bias", v19);
    objc_msgSend_setBias_(v7, v20, v21, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end