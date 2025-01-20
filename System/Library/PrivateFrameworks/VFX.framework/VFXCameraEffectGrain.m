@interface VFXCameraEffectGrain
+ (BOOL)supportsSecureCoding;
+ (id)grain;
- (BOOL)isColored;
- (VFXCameraEffectGrain)initWithCoder:(id)a3;
- (__CFXCameraEffectGrain)cfxObject;
- (double)createCFXObject;
- (float)intensity;
- (float)scale;
- (float)slice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)texture;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setColored:(BOOL)a3;
- (void)setIntensity:(float)a3;
- (void)setScale:(float)a3;
- (void)setSlice:(float)a3;
- (void)setTexture:(id)a3;
@end

@implementation VFXCameraEffectGrain

- (__CFXCameraEffectGrain)cfxObject
{
  return (__CFXCameraEffectGrain *)self->super._cameraEffect;
}

- (float)intensity
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

- (void)setIntensity:(float)a3
{
  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E489C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

- (float)scale
{
  if (!self->super._isPresentationObject) {
    return self->_intensity;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529878(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setScale:(float)a3
{
  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E4A1C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"scale", v9);
  }
}

- (float)slice
{
  if (!self->super._isPresentationObject) {
    return self->_scale;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B65299B8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setSlice:(float)a3
{
  if (self->super._isPresentationObject || self->_scale != a3)
  {
    self->_scale = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E4B9C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"slice", v9);
  }
}

- (BOOL)isColored
{
  if (!self->super._isPresentationObject) {
    return LOBYTE(self->_slice) != 0;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  char v29 = sub_1B652991C(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setColored:(BOOL)a3
{
  if (self->super._isPresentationObject || LOBYTE(self->_slice) != a3)
  {
    LOBYTE(self->_slice) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E4D1C;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"isColored", v8);
  }
}

- (id)texture
{
  if (!self->super._isPresentationObject) {
    return self->_texture;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  char v29 = (void *)sub_1B6529470(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setTexture:(id)a3
{
  if (self->super._isPresentationObject || self->_texture != a3)
  {
    self->_texture = (MTLTexture *)a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E4E88;
    v8[3] = &unk_1E6141230;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

+ (id)grain
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffectGrain;
  id v4 = [(VFXCameraEffect *)&v10 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  return v4;
}

- (void)_syncObjCModel
{
  v38.receiver = self;
  v38.super_class = (Class)VFXCameraEffectGrain;
  [(VFXCameraEffect *)&v38 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  LOBYTE(self->_slice) = sub_1B652991C((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_scale = sub_1B65299B8((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  self->_texture = (MTLTexture *)sub_1B6529470((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXCameraEffectGrain;
  -[VFXCameraEffect encodeWithCoder:](&v12, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"intensity", v7, v5);
  *(float *)&double v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"scale", v10, v8);
  objc_msgSend_encodeBool_forKey_(a3, v11, LOBYTE(self->_slice), @"colored");
}

- (VFXCameraEffectGrain)initWithCoder:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)VFXCameraEffectGrain;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v29, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"intensity", v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"scale", v17);
    objc_msgSend_setScale_(v7, v18, v19, v20);
    uint64_t v23 = objc_msgSend_decodeBoolForKey_(a3, v21, @"colored", v22);
    objc_msgSend_setColored_(v7, v24, v23, v25);
    objc_msgSend_setImmediateMode_(VFXTransaction, v26, v8, v27);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB995350 != -1) {
    dispatch_once(&qword_1EB995350, &unk_1F0FB7088);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995358, 0x50uLL);
  *(unsigned char *)(v0 + 64) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v0 + 72) = result;
  return result;
}

@end