@interface VFXIKConstraint
+ (BOOL)supportsSecureCoding;
+ (id)inverseKinematicsConstraintWithChainRootNode:(id)a3;
- (VFXIKConstraint)init;
- (VFXIKConstraint)initWithChainRootNode:(id)a3;
- (VFXIKConstraint)initWithCoder:(id)a3;
- (VFXNode)chainRootNode;
- (__n128)targetPosition;
- (float)maxAllowedRotationAngleForJoint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jointForNode:(id)a3;
- (id)targetPositionValue;
- (void)_customDecodingOfVFXIKConstraint:(id)a3;
- (void)_customEncodingOfVFXIKConstraint:(id)a3;
- (void)_didDecodeVFXIKConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)retargetWithRemapTable:(__CFDictionary *)a3;
- (void)setChainRootNode:(id)a3;
- (void)setMaxAllowedRotationAngle:(float)a3 forJoint:(id)a4;
- (void)setTargetPosition:(VFXIKConstraint *)self;
- (void)setTargetPositionValue:(id)a3;
@end

@implementation VFXIKConstraint

- (id)targetPositionValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_targetPosition(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_targetPosition(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_targetPosition(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setTargetPositionValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setTargetPosition_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (VFXIKConstraint)init
{
  v7.receiver = self;
  v7.super_class = (Class)VFXIKConstraint;
  uint64_t v2 = [(VFXConstraint *)&v7 init];
  if (v2)
  {
    v2->super._constraintRef = (__CFXConstraint *)sub_1B66086B0();
    v2->_jointsPerNode = (NSMutableDictionary *)(id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v3, v4, v5);
  }
  return v2;
}

- (void)dealloc
{
  self->_chainRootNode = 0;

  v3.receiver = self;
  v3.super_class = (Class)VFXIKConstraint;
  [(VFXConstraint *)&v3 dealloc];
}

+ (id)inverseKinematicsConstraintWithChainRootNode:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  objc_super v7 = objc_msgSend_initWithChainRootNode_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (VFXIKConstraint)initWithChainRootNode:(id)a3
{
  uint64_t v5 = (VFXIKConstraint *)objc_msgSend_init(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = v5;
  if (v5) {
    objc_msgSend_setChainRootNode_(v5, v6, (uint64_t)a3, v7);
  }
  return v8;
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  Value = CFDictionaryGetValue(a3, self->_chainRootNode);
  if (Value)
  {
    objc_msgSend_setChainRootNode_(self, v5, (uint64_t)Value, v6);
  }
}

- (VFXNode)chainRootNode
{
  return self->_chainRootNode;
}

- (void)setChainRootNode:(id)a3
{
  if (self->_chainRootNode != a3)
  {
    self->_chainRootNode = (VFXNode *)a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B66175F8;
    v8[3] = &unk_1E6141230;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (__n128)targetPosition
{
  return a1[4];
}

- (void)setTargetPosition:(VFXIKConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)self->_ikTarget = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66176F8;
  v9[3] = &unk_1E61412D0;
  v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"targetPosition", v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_targetPosition(self, v5, v6, v7);
  objc_msgSend_setTargetPosition_(v4, v8, v9, v10);
  uint64_t v14 = objc_msgSend_chainRootNode(self, v11, v12, v13);
  objc_msgSend_setChainRootNode_(v4, v15, v14, v16);
  objc_msgSend_copyTo_(self, v17, (uint64_t)v4, v18);
  return v4;
}

- (id)jointForNode:(id)a3
{
  uint64_t v6 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], a2, (uint64_t)a3, v3);
  uint64_t v9 = (VFXIKJoint *)objc_msgSend_objectForKey_(self->_jointsPerNode, v7, v6, v8);
  if (!v9)
  {
    uint64_t v9 = objc_alloc_init(VFXIKJoint);
    objc_msgSend_setJoint_(v9, v10, (uint64_t)a3, v11);
    LODWORD(v12) = 1127481344;
    objc_msgSend_setMaxAllowedRotationAngle_(v9, v13, v14, v15, v12);
    objc_msgSend_setObject_forKey_(self->_jointsPerNode, v16, (uint64_t)v9, v6);
  }
  return v9;
}

- (void)setMaxAllowedRotationAngle:(float)a3 forJoint:(id)a4
{
  uint64_t v8 = objc_msgSend_jointForNode_(self, a2, (uint64_t)a4, v4);
  *(float *)&double v9 = a3;
  objc_msgSend_setMaxAllowedRotationAngle_(v8, v10, v11, v12, v9);
  uint64_t v16 = objc_msgSend_worldRef(self, v13, v14, v15);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B66178C8;
  v18[3] = &unk_1E6141258;
  float v19 = a3;
  v18[4] = self;
  v18[5] = a4;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v18);
}

- (float)maxAllowedRotationAngleForJoint:(id)a3
{
  uint64_t v4 = objc_msgSend_jointForNode_(self, a2, (uint64_t)a3, v3);
  if (!v4) {
    return 180.0;
  }

  objc_msgSend_maxAllowedRotationAngle(v4, v5, v6, v7);
  return result;
}

- (void)_didDecodeVFXIKConstraint:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"node%d", v7, 0);
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v5, v8);
  if (v10)
  {
    uint64_t v13 = v10;
    do
    {
      uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v11, @"angle%d", v12, 0);
      objc_msgSend_decodeFloatForKey_(a3, v15, v14, v16);
      objc_msgSend_setMaxAllowedRotationAngle_forJoint_(self, v17, v13, v18);
      uint64_t v19 = objc_opt_class();
      uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v20, @"node%d", v21, 0);
      uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v19, v22);
    }
    while (v13);
  }
}

- (void)_customEncodingOfVFXIKConstraint:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_msgSend_allKeys(self->_jointsPerNode, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = objc_msgSend_objectForKey_(self->_jointsPerNode, v8, *(void *)(*((void *)&v35 + 1) + 8 * v13), v9);
        objc_msgSend_maxAllowedRotationAngle(v14, v15, v16, v17);
        int v19 = v18;
        uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v20, @"angle%d", v21, v11 + v13);
        LODWORD(v23) = v19;
        objc_msgSend_encodeFloat_forKey_(a3, v24, v22, v25, v23);
        uint64_t v29 = objc_msgSend_joint(v14, v26, v27, v28);
        uint64_t v32 = objc_msgSend_stringWithFormat_(NSString, v30, @"node%d", v31, v11 + v13);
        objc_msgSend_encodeObject_forKey_(a3, v33, v29, v32);
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v35, (uint64_t)v39, 16);
      uint64_t v11 = (v11 + v13);
    }
    while (v10);
  }
  sub_1B64FA2F4(a3, (const char *)@"ikTarget", *(__n128 *)self->_ikTarget);
}

- (void)_customDecodingOfVFXIKConstraint:(id)a3
{
  self->super._constraintRef = (__CFXConstraint *)sub_1B66086B0();
  double v5 = sub_1B64FA42C(a3, (const char *)@"ikTarget");
  objc_msgSend_setTargetPosition_(self, v6, v7, v8, v5);

  objc_msgSend_finalizeDecodeConstraint_(self, v9, (uint64_t)a3, v10);
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXIKConstraint;
  -[VFXConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXIKConstraint_(self, v5, (uint64_t)a3, v6);
  chainRootNode = self->_chainRootNode;
  if (chainRootNode) {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)chainRootNode, @"chainRootNode");
  }
}

- (VFXIKConstraint)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)VFXIKConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v23, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXIKConstraint_(v7, v11, (uint64_t)a3, v12);
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"chainRootNode");
    objc_msgSend_setChainRootNode_(v7, v16, v15, v17);
    objc_msgSend__didDecodeVFXIKConstraint_(v7, v18, (uint64_t)a3, v19);
    objc_msgSend_setImmediateMode_(VFXTransaction, v20, v8, v21);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end