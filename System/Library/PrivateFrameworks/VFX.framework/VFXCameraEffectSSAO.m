@interface VFXCameraEffectSSAO
+ (BOOL)supportsSecureCoding;
+ (id)ssao;
- (VFXCameraEffectSSAO)initWithCoder:(id)a3;
- (__CFXCameraEffectSSAO)cfxObject;
- (double)createCFXObject;
- (float)falloff;
- (float)intensity;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setFalloff:(float)a3;
- (void)setIntensity:(float)a3;
- (void)setRadius:(float)a3;
@end

@implementation VFXCameraEffectSSAO

- (__CFXCameraEffectSSAO)cfxObject
{
  return (__CFXCameraEffectSSAO *)self->super._cameraEffect;
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
    v9[2] = sub_1B63EE218;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

- (float)radius
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

- (void)setRadius:(float)a3
{
  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EE398;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"radius", v9);
  }
}

- (float)falloff
{
  if (!self->super._isPresentationObject) {
    return self->_radius;
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

- (void)setFalloff:(float)a3
{
  if (self->super._isPresentationObject || self->_radius != a3)
  {
    self->_radius = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EE518;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"falloff", v9);
  }
}

+ (id)ssao
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VFXCameraEffectSSAO;
  id v4 = [(VFXCameraEffect *)&v18 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  *(float *)&double v9 = self->_intensity;
  objc_msgSend_setRadius_(v4, v10, v11, v12, v9);
  *(float *)&double v13 = self->_radius;
  objc_msgSend_setFalloff_(v4, v14, v15, v16, v13);
  return v4;
}

- (void)_syncObjCModel
{
  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectSSAO;
  [(VFXCameraEffect *)&v24 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_radius = sub_1B65299B8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
}

- (void)encodeWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VFXCameraEffectSSAO;
  -[VFXCameraEffect encodeWithCoder:](&v14, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"intensity", v7, v5);
  *(float *)&double v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"radius", v10, v8);
  *(float *)&double v11 = self->_radius;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"falloff", v13, v11);
}

- (VFXCameraEffectSSAO)initWithCoder:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)VFXCameraEffectSSAO;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v29, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"intensity", v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"radius", v17);
    objc_msgSend_setRadius_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"falloff", v22);
    objc_msgSend_setFalloff_(v7, v23, v24, v25);
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
  if (qword_1E9DDB218 != -1) {
    dispatch_once(&qword_1E9DDB218, &unk_1F0FB6A28);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1E9DDB210, 0x48uLL);
  *(unsigned char *)(v0 + 64) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v0 + 72) = result;
  *(_DWORD *)(v0 + 80) = 1065353216;
  return result;
}

@end