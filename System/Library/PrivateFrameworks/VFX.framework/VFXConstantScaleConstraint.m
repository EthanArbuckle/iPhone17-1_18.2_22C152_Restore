@interface VFXConstantScaleConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constantScaleConstraint;
- (BOOL)screenSpace;
- (VFXConstantScaleConstraint)init;
- (VFXConstantScaleConstraint)initWithCoder:(id)a3;
- (float)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setScale:(float)a3;
- (void)setScreenSpace:(BOOL)a3;
@end

@implementation VFXConstantScaleConstraint

- (VFXConstantScaleConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)VFXConstantScaleConstraint;
  v2 = [(VFXConstraint *)&v5 init];
  if (v2)
  {
    uint64_t v3 = sub_1B6607628();
    v2->_scale = 1.0;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_screenSpace = 1;
  }
  return v2;
}

+ (id)constantScaleConstraint
{
  v2 = objc_alloc_init(VFXConstantScaleConstraint);

  return v2;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B661604C;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (BOOL)screenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  self->_screenSpace = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B661611C;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyTo_(self, v5, (uint64_t)v4, v6);
  v4[12] = LODWORD(self->_scale);
  *((unsigned char *)v4 + 52) = self->_screenSpace;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXConstantScaleConstraint;
  -[VFXConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeBool_forKey_(a3, v5, self->_screenSpace, @"screenSpace");
  *(float *)&double v6 = self->_scale;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"scale", v8, v6);
}

- (VFXConstantScaleConstraint)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VFXConstantScaleConstraint;
  uint64_t v4 = -[VFXConstraint initWithCoder:](&v24, sel_initWithCoder_);
  if (v4)
  {
    v4->super._constraintRef = (__CFXConstraint *)sub_1B6607628();
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v5, v6, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v13 = objc_msgSend_decodeBoolForKey_(a3, v11, @"screenSpace", v12);
    objc_msgSend_setScreenSpace_(v4, v14, v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"scale", v17);
    objc_msgSend_setScale_(v4, v18, v19, v20);
    objc_msgSend_setImmediateMode_(VFXTransaction, v21, v8, v22);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end