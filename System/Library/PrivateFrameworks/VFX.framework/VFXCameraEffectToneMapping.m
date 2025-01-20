@interface VFXCameraEffectToneMapping
+ (BOOL)supportsSecureCoding;
+ (id)toneMapping;
- (VFXCameraEffectToneMapping)initWithCoder:(id)a3;
- (__CFXCameraEffectToneMapping)cfxObject;
- (double)createCFXObject;
- (float)eval:(float)a3;
- (float)gamma;
- (float)shoulderAngle;
- (float)shoulderLength;
- (float)shoulderStrength;
- (float)toeLength;
- (float)toeStrength;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mode;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setGamma:(float)a3;
- (void)setMode:(int64_t)a3;
- (void)setShoulderAngle:(float)a3;
- (void)setShoulderLength:(float)a3;
- (void)setShoulderStrength:(float)a3;
- (void)setToeLength:(float)a3;
- (void)setToeStrength:(float)a3;
@end

@implementation VFXCameraEffectToneMapping

- (__CFXCameraEffectToneMapping)cfxObject
{
  return (__CFXCameraEffectToneMapping *)self->super._cameraEffect;
}

- (int64_t)mode
{
  if (!self->super._isPresentationObject) {
    return self->_mode;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B652A278(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMode:(int64_t)a3
{
  if (self->super._isPresentationObject || self->_mode != a3)
  {
    self->_mode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E64D4;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"mode", v8);
  }
}

- (float)toeStrength
{
  if (!self->super._isPresentationObject) {
    return self->_toeStrength;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A318(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setToeStrength:(float)a3
{
  if (self->super._isPresentationObject || self->_toeStrength != a3)
  {
    self->_toeStrength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E6654;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"toeStrength", v9);
  }
}

- (float)toeLength
{
  if (!self->super._isPresentationObject) {
    return self->_toeLength;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A3C0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setToeLength:(float)a3
{
  if (self->super._isPresentationObject || self->_toeLength != a3)
  {
    self->_toeLength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E67D4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"toeLength", v9);
  }
}

- (float)shoulderStrength
{
  if (!self->super._isPresentationObject) {
    return self->_shoulderStrength;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A468(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setShoulderStrength:(float)a3
{
  if (self->super._isPresentationObject || self->_shoulderStrength != a3)
  {
    self->_shoulderStrength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E6954;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"shoulderStrength", v9);
  }
}

- (float)shoulderLength
{
  if (!self->super._isPresentationObject) {
    return self->_shoulderLength;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A510(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setShoulderLength:(float)a3
{
  if (self->super._isPresentationObject || self->_shoulderLength != a3)
  {
    self->_shoulderLength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E6AD4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"shoulderLength", v9);
  }
}

- (float)shoulderAngle
{
  if (!self->super._isPresentationObject) {
    return self->_shoulderAngle;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A5B8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setShoulderAngle:(float)a3
{
  if (self->super._isPresentationObject || self->_shoulderAngle != a3)
  {
    self->_shoulderAngle = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E6C54;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"shoulderAngle", v9);
  }
}

- (float)gamma
{
  if (!self->super._isPresentationObject) {
    return self->_gamma;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652A660(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setGamma:(float)a3
{
  if (self->super._isPresentationObject || self->_gamma != a3)
  {
    self->_gamma = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E6DD4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"gamma", v9);
  }
}

+ (id)toneMapping
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (float)eval:(float)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  cameraEffect = self->super._cameraEffect;
  if (cameraEffect)
  {
    sub_1B652A708((uint64_t)cameraEffect, a3);
    a3 = v17;
  }
  if (v15) {
    sub_1B64B0CB4(v15, v8, v9, v10, v11, v12, v13, v14);
  }
  return a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v32.receiver = self;
  v32.super_class = (Class)VFXCameraEffectToneMapping;
  id v4 = [(VFXCameraEffect *)&v32 copyWithZone:a3];
  objc_msgSend_setMode_(v4, v5, self->_mode, v6);
  *(float *)&double v7 = self->_toeStrength;
  objc_msgSend_setToeStrength_(v4, v8, v9, v10, v7);
  *(float *)&double v11 = self->_toeLength;
  objc_msgSend_setToeLength_(v4, v12, v13, v14, v11);
  *(float *)&double v15 = self->_shoulderStrength;
  objc_msgSend_setShoulderStrength_(v4, v16, v17, v18, v15);
  *(float *)&double v19 = self->_shoulderLength;
  objc_msgSend_setShoulderLength_(v4, v20, v21, v22, v19);
  *(float *)&double v23 = self->_shoulderAngle;
  objc_msgSend_setShoulderAngle_(v4, v24, v25, v26, v23);
  *(float *)&double v27 = self->_gamma;
  objc_msgSend_setGamma_(v4, v28, v29, v30, v27);
  return v4;
}

- (void)_syncObjCModel
{
  v52.receiver = self;
  v52.super_class = (Class)VFXCameraEffectToneMapping;
  [(VFXCameraEffect *)&v52 _syncObjCModel];
  self->_mode = sub_1B652A278((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_toeStrength = sub_1B652A318((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_toeLength = sub_1B652A3C0((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_shoulderStrength = sub_1B652A468((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  self->_shoulderLength = sub_1B652A510((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_shoulderAngle = sub_1B652A5B8((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_gamma = sub_1B652A660((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
}

- (void)encodeWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectToneMapping;
  -[VFXCameraEffect encodeWithCoder:](&v24, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_mode, @"mode");
  *(float *)&double v6 = self->_toeStrength;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"toeStrength", v8, v6);
  *(float *)&double v9 = self->_toeLength;
  objc_msgSend_encodeFloat_forKey_(a3, v10, @"toeLength", v11, v9);
  *(float *)&double v12 = self->_shoulderStrength;
  objc_msgSend_encodeFloat_forKey_(a3, v13, @"shoulderStrength", v14, v12);
  *(float *)&double v15 = self->_shoulderLength;
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"shoulderLength", v17, v15);
  *(float *)&double v18 = self->_shoulderAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v19, @"shoulderAngle", v20, v18);
  *(float *)&double v21 = self->_gamma;
  objc_msgSend_encodeFloat_forKey_(a3, v22, @"gamma", v23, v21);
}

- (VFXCameraEffectToneMapping)initWithCoder:(id)a3
{
  v49.receiver = self;
  v49.super_class = (Class)VFXCameraEffectToneMapping;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v49, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"mode", v12);
    objc_msgSend_setMode_(v7, v14, v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"toeStrength", v17);
    objc_msgSend_setToeStrength_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"toeLength", v22);
    objc_msgSend_setToeLength_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, @"shoulderStrength", v27);
    objc_msgSend_setShoulderStrength_(v7, v28, v29, v30);
    objc_msgSend_decodeFloatForKey_(a3, v31, @"shoulderLength", v32);
    objc_msgSend_setShoulderLength_(v7, v33, v34, v35);
    objc_msgSend_decodeFloatForKey_(a3, v36, @"shoulderAngle", v37);
    objc_msgSend_setShoulderAngle_(v7, v38, v39, v40);
    objc_msgSend_decodeFloatForKey_(a3, v41, @"gamma", v42);
    objc_msgSend_setGamma_(v7, v43, v44, v45);
    objc_msgSend_setImmediateMode_(VFXTransaction, v46, v8, v47);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB995380 != -1) {
    dispatch_once(&qword_1EB995380, &unk_1F0FB6268);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995388, 0xC0uLL);
  *(unsigned char *)(v0 + 64) = 1;
  *(_OWORD *)(v0 + 180) = xmmword_1B6E51FA0;
  *(void *)(v0 + 196) = 0x3F80000000000000;
  *(_OWORD *)(v0 + 76) = xmmword_1B6E51FB0;
  *(void *)&double result = 1065353216;
  *(void *)(v0 + 92) = 1065353216;
  *(_DWORD *)(v0 + 100) = 0;
  return result;
}

@end