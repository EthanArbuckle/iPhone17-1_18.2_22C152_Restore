@interface VFXBillboardConstraint
+ (BOOL)supportsSecureCoding;
+ (id)billboardConstraint;
- (BOOL)preserveScale;
- (VFXBillboardConstraint)init;
- (VFXBillboardConstraint)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)freeAxes;
- (void)encodeWithCoder:(id)a3;
- (void)setFreeAxes:(unint64_t)a3;
- (void)setPreserveScale:(BOOL)a3;
@end

@implementation VFXBillboardConstraint

- (VFXBillboardConstraint)init
{
  v6.receiver = self;
  v6.super_class = (Class)VFXBillboardConstraint;
  id v2 = [(VFXConstraint *)&v6 init];
  if (v2)
  {
    *((void *)v2 + 1) = sub_1B6606328();
    objc_msgSend_setFreeAxes_(v2, v3, 7, v4);
    *((unsigned char *)v2 + 56) = sub_1B660759C(*((void *)v2 + 1));
  }
  return (VFXBillboardConstraint *)v2;
}

+ (id)billboardConstraint
{
  id v2 = objc_alloc_init(VFXBillboardConstraint);

  return v2;
}

- (unint64_t)freeAxes
{
  return self->_freeAxes;
}

- (void)setFreeAxes:(unint64_t)a3
{
  self->_freeAxes = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6615C50;
  v8[3] = &unk_1E61412A8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)setPreserveScale:(BOOL)a3
{
  self->_preserveScale = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6615D10;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)preserveScale
{
  return self->_preserveScale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyTo_(self, v5, (uint64_t)v4, v6);
  uint64_t v10 = objc_msgSend_freeAxes(self, v7, v8, v9);
  objc_msgSend_setFreeAxes_(v4, v11, v10, v12);
  uint64_t v16 = objc_msgSend_preserveScale(self, v13, v14, v15);
  objc_msgSend_setPreserveScale_(v4, v17, v16, v18);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXBillboardConstraint;
  -[VFXConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_freeAxes, @"freeAxes");
  objc_msgSend_encodeBool_forKey_(a3, v6, self->_preserveScale, @"preserveScale");
}

- (VFXBillboardConstraint)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VFXBillboardConstraint;
  objc_super v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->super._constraintRef = (__CFXConstraint *)sub_1B6606328();
    uint64_t v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"freeAxes", v12);
    objc_msgSend_setFreeAxes_(v7, v14, v13, v15);
    uint64_t v18 = objc_msgSend_decodeBoolForKey_(a3, v16, @"preserveScale", v17);
    objc_msgSend_setPreserveScale_(v7, v19, v18, v20);
    objc_msgSend_finalizeDecodeConstraint_(v7, v21, (uint64_t)a3, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end