@interface VFXCameraEffectDoughnutBokeh
+ (BOOL)supportsSecureCoding;
+ (id)doughnutBokeh;
- (BOOL)maskEnabled;
- (BOOL)rawFloat2ForKey:(id)a3 value:;
- (VFXCameraEffectDoughnutBokeh)initWithCoder:(id)a3;
- (__CFXCameraEffectDoughnutBokeh)cfxObject;
- (double)maskCenter;
- (float)maskRadius;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (uint64_t)createCFXObject;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setMaskCenter:(VFXCameraEffectDoughnutBokeh *)self;
- (void)setMaskEnabled:(BOOL)a3;
- (void)setMaskRadius:(float)a3;
- (void)setRadius:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXCameraEffectDoughnutBokeh

- (__CFXCameraEffectDoughnutBokeh)cfxObject
{
  return (__CFXCameraEffectDoughnutBokeh *)self->super._cameraEffect;
}

- (float)radius
{
  if (!self->super._isPresentationObject) {
    return *((float *)&self->super._enabled + 1);
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529330(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setRadius:(float)a3
{
  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63ED77C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"radius", v9);
  }
}

- (double)maskCenter
{
  if (!*(unsigned char *)(a1 + 16)) {
    return *(double *)(a1 + 48);
  }
  uint64_t v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  double v29 = sub_1B652C744(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMaskCenter:(VFXCameraEffectDoughnutBokeh *)self
{
  float32x2_t v5 = v4;
  if (self->super._isPresentationObject
    || (uint32x2_t v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_radius, v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_radius = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63ED904;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"maskCenter", v10);
  }
}

- (float)maskRadius
{
  if (!self->super._isPresentationObject) {
    return *(float *)&self->_maskCenter[4];
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529D4C(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMaskRadius:(float)a3
{
  if (self->super._isPresentationObject || *(float *)&self->_maskCenter[4] != a3)
  {
    *(float *)&self->_maskCenter[4] = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EDA84;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"maskRadius", v9);
  }
}

- (BOOL)maskEnabled
{
  if (!self->super._isPresentationObject) {
    return LOBYTE(self->_maskRadius) != 0;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  char v29 = sub_1B652C7E8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMaskEnabled:(BOOL)a3
{
  if (self->super._isPresentationObject || LOBYTE(self->_maskRadius) != a3)
  {
    LOBYTE(self->_maskRadius) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63EDC04;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"maskEnabled", v8);
  }
}

+ (id)doughnutBokeh
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v4 = (void *)v3;
  int isEqualToString = objc_msgSend_isEqualToString_(a3, a2, @"maskCenter", v3);
  if (isEqualToString)
  {
    objc_msgSend_maskCenter(self, v6, v7, v8);
    *uint64_t v4 = v10;
  }
  return isEqualToString;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"maskCenter", v3))
  {
    uint64_t v9 = MEMORY[0x1E4F29238];
    objc_msgSend_maskCenter(self, v6, v7, v8);
    return (id)MEMORY[0x1F4181798](v9, sel_valueWithVFXFloat2_, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectDoughnutBokeh;
    return [(VFXCameraEffectDoughnutBokeh *)&v13 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"maskCenter", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat2Value(a3, v7, v8, v9);
    objc_msgSend_setMaskCenter_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectDoughnutBokeh;
    [(VFXCameraEffectDoughnutBokeh *)&v13 setValue:a3 forKey:a4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  id v4 = [(VFXCameraEffect *)&v19 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setRadius_(v4, v6, v7, v8, v5);
  objc_msgSend_setMaskCenter_(v4, v9, v10, v11, *(double *)&self->_radius);
  LODWORD(v12) = *(_DWORD *)&self->_maskCenter[4];
  objc_msgSend_setMaskRadius_(v4, v13, v14, v15, v12);
  objc_msgSend_setMaskEnabled_(v4, v16, LOBYTE(self->_maskRadius), v17);
  return v4;
}

- (void)_syncObjCModel
{
  v31.receiver = self;
  v31.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  [(VFXCameraEffect *)&v31 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(double *)&self->_radius = sub_1B652C744((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  *(float *)&self->_maskCenter[4] = sub_1B6529D4C((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  LOBYTE(self->_maskRadius) = sub_1B652C7E8((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  -[VFXCameraEffect encodeWithCoder:](&v12, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"radius", v7, v5);
  sub_1B64FA298(a3, (const char *)@"maskCenter", *(double *)&self->_radius);
  LODWORD(v8) = *(_DWORD *)&self->_maskCenter[4];
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"maskRadius", v10, v8);
  objc_msgSend_encodeBool_forKey_(a3, v11, LOBYTE(self->_maskRadius), @"maskEnabled");
}

- (VFXCameraEffectDoughnutBokeh)initWithCoder:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v33, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"radius", v12);
    objc_msgSend_setRadius_(v7, v13, v14, v15);
    double v16 = sub_1B64FA3EC(a3, (const char *)@"maskCenter");
    objc_msgSend_setMaskCenter_(v7, v17, v18, v19, v16);
    objc_msgSend_decodeFloatForKey_(a3, v20, @"maskRadius", v21);
    objc_msgSend_setMaskRadius_(v7, v22, v23, v24);
    uint64_t v27 = objc_msgSend_decodeBoolForKey_(a3, v25, @"maskEnabled", v26);
    objc_msgSend_setMaskEnabled_(v7, v28, v27, v29);
    objc_msgSend_setImmediateMode_(VFXTransaction, v30, v8, v31);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)createCFXObject
{
  if (qword_1EB995330 != -1) {
    dispatch_once(&qword_1EB995330, &unk_1F0FB68E8);
  }
  uint64_t result = sub_1B63C8D44(qword_1EB995338, 0x50uLL);
  *(unsigned char *)(result + 64) = 1;
  *(_DWORD *)(result + 72) = 1065353216;
  *(void *)(result + 80) = 0;
  *(_DWORD *)(result + 88) = 1065353216;
  *(unsigned char *)(result + 92) = 0;
  return result;
}

@end