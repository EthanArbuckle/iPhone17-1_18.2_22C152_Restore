@interface VFXLookAtConstraint
+ (BOOL)supportsSecureCoding;
+ (id)lookAtConstraintWithTarget:(id)a3;
- (BOOL)gimbalLockEnabled;
- (VFXLookAtConstraint)initWithCoder:(id)a3;
- (VFXLookAtConstraint)initWithTarget:(id)a3;
- (VFXNode)target;
- (__n128)localFront;
- (__n128)targetOffset;
- (__n128)worldUp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localFrontValue;
- (id)targetOffsetValue;
- (id)upVectorValue;
- (id)valueForKey:(id)a3;
- (void)_customDecodingOfVFXLookAtConstraint:(id)a3;
- (void)_customEncodingOfVFXLookAtConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)retargetWithRemapTable:(__CFDictionary *)a3;
- (void)setGimbalLockEnabled:(BOOL)a3;
- (void)setLocalFront:(VFXLookAtConstraint *)self;
- (void)setLocalFrontValue:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTargetOffset:(VFXLookAtConstraint *)self;
- (void)setTargetOffsetValue:(id)a3;
- (void)setUpVector:(VFXLookAtConstraint *)self;
- (void)setUpVectorValue:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWorldUp:(VFXLookAtConstraint *)self;
@end

@implementation VFXLookAtConstraint

- (id)targetOffsetValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_targetOffset(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_targetOffset(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_targetOffset(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setTargetOffsetValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setTargetOffset_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)localFrontValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_localFront(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_localFront(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_localFront(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setLocalFrontValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setLocalFront_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)upVectorValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_upVector(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_upVector(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_upVector(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setUpVectorValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setUpVector_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (VFXLookAtConstraint)initWithTarget:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXLookAtConstraint;
  v4 = [(VFXConstraint *)&v10 init];
  if (v4)
  {
    v5 = (VFXNode *)a3;
    v4->_target = v5;
    if (v5) {
      v5 = (VFXNode *)objc_msgSend_nodeRef(v5, v6, v7, v8);
    }
    v4->_gimbalLockEnabled = 0;
    *(_OWORD *)&v4->_targetOffset[7] = 0u;
    *(_OWORD *)&v4->_localFront[7] = xmmword_1B6E4F340;
    *(_OWORD *)&v4->_upVector[7] = xmmword_1B6E4F320;
    v4->super._constraintRef = (__CFXConstraint *)sub_1B66057C0(v5);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXLookAtConstraint;
  [(VFXConstraint *)&v3 dealloc];
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
  {
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
  }
}

+ (id)lookAtConstraintWithTarget:(id)a3
{
  v4 = [VFXLookAtConstraint alloc];
  uint64_t v7 = objc_msgSend_initWithTarget_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (BOOL)gimbalLockEnabled
{
  return self->_gimbalLockEnabled;
}

- (void)setGimbalLockEnabled:(BOOL)a3
{
  self->_gimbalLockEnabled = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B66126C0;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (VFXNode)target
{
  return self->_target;
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
    v13[2] = sub_1B66127B8;
    v13[3] = &unk_1E61412A8;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (__n128)targetOffset
{
  return a1[4];
}

- (void)setTargetOffset:(VFXLookAtConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)&self->_targetOffset[7] = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6612884;
  v9[3] = &unk_1E61412D0;
  uint64_t v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"targetOffset", v9);
}

- (__n128)worldUp
{
  return a1[5];
}

- (void)setWorldUp:(VFXLookAtConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)&self->_upVector[7] = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6612958;
  v9[3] = &unk_1E61412D0;
  uint64_t v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"worldUp", v9);
}

- (void)setUpVector:(VFXLookAtConstraint *)self
{
}

- (__n128)localFront
{
  return a1[6];
}

- (void)setLocalFront:(VFXLookAtConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)&self->_localFront[7] = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6612A34;
  v9[3] = &unk_1E61412D0;
  uint64_t v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"localFront", v9);
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"targetOffset", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_targetOffset(self, v6, v7, v8);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, @"localFront", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_localFront(self, v13, v14, v15);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v13, @"worldUp", v15))
    {
      v20.receiver = self;
      v20.super_class = (Class)VFXLookAtConstraint;
      return [(VFXLookAtConstraint *)&v20 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_worldUp(self, v16, v17, v18);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"targetOffset", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setTargetOffset_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"localFront", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setLocalFront_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"worldUp", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    MEMORY[0x1F4181798](self, sel_setWorldUp_, v22, v23);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)VFXLookAtConstraint;
    [(VFXLookAtConstraint *)&v24 setValue:a3 forKey:a4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_initWithTarget_(v4, v5, (uint64_t)self->_target, v6);
  uint64_t v11 = objc_msgSend_gimbalLockEnabled(self, v8, v9, v10);
  objc_msgSend_setGimbalLockEnabled_(v7, v12, v11, v13);
  objc_msgSend_targetOffset(self, v14, v15, v16);
  objc_msgSend_setTargetOffset_(v7, v17, v18, v19);
  objc_msgSend_upVector(self, v20, v21, v22);
  objc_msgSend_setUpVector_(v7, v23, v24, v25);
  objc_msgSend_localFront(self, v26, v27, v28);
  objc_msgSend_setLocalFront_(v7, v29, v30, v31);
  objc_msgSend_copyTo_(self, v32, (uint64_t)v7, v33);
  return v7;
}

- (void)_customEncodingOfVFXLookAtConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, @"target");
  }
}

- (void)_customDecodingOfVFXLookAtConstraint:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"target");
  self->_target = v7;
  uint64_t v11 = (const void *)objc_msgSend_nodeRef(v7, v8, v9, v10);
  self->super._constraintRef = (__CFXConstraint *)sub_1B66057C0(v11);

  objc_msgSend_finalizeDecodeConstraint_(self, v12, (uint64_t)a3, v13);
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXLookAtConstraint;
  -[VFXConstraint encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXLookAtConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_gimbalLockEnabled, @"gimbalLockEnabled");
  sub_1B64FA2F4(a3, (const char *)@"targetOffset", *(__n128 *)&self->_targetOffset[7]);
  sub_1B64FA2F4(a3, (const char *)@"upVector", *(__n128 *)&self->_upVector[7]);
  sub_1B64FA2F4(a3, (const char *)@"localFront", *(__n128 *)&self->_localFront[7]);
}

- (VFXLookAtConstraint)initWithCoder:(id)a3
{
  v51.receiver = self;
  v51.super_class = (Class)VFXLookAtConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v51, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXLookAtConstraint_(v7, v11, (uint64_t)a3, v12);
    uint64_t v15 = objc_msgSend_decodeBoolForKey_(a3, v13, @"gimbalLockEnabled", v14);
    objc_msgSend_setGimbalLockEnabled_(v7, v16, v15, v17);
    if (objc_msgSend_containsValueForKey_(a3, v18, @"targetOffset", v19))
    {
      double v22 = sub_1B64FA42C(a3, (const char *)@"targetOffset");
      objc_msgSend_setTargetOffset_(v7, v23, v24, v25, v22);
    }
    if (objc_msgSend_containsValueForKey_(a3, v20, @"upVector", v21)) {
      double v29 = sub_1B64FA42C(a3, (const char *)@"upVector");
    }
    else {
      double v29 = 0.0078125;
    }
    objc_msgSend_setUpVector_(v7, v26, v27, v28, v29);
    if (objc_msgSend_containsValueForKey_(a3, v30, @"localFront", v31))
    {
      double v35 = sub_1B64FA42C(a3, (const char *)@"localFront");
      objc_msgSend_setLocalFront_(v7, v36, v37, v38, v35);
    }
    else
    {
      objc_msgSend_setUpVector_(v7, v32, v33, v34, 0.0);
    }
    objc_msgSend_upVector(v7, v39, v40, v41);
    if (VFXVector3EqualToVector3(v42, (float32x4_t)0)) {
      objc_msgSend_setUpVector_(v7, v43, v44, v45, 0.0078125);
    }
    objc_msgSend_localFront(v7, v43, v44, v45);
    if (VFXVector3EqualToVector3(v46, (float32x4_t)0)) {
      objc_msgSend_setLocalFront_(v7, v47, v48, v49, 0.0);
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v47, v8, v49);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end