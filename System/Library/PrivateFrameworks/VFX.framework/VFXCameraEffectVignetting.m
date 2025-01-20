@interface VFXCameraEffectVignetting
+ (BOOL)supportsSecureCoding;
+ (id)vignetting;
- (VFXCameraEffectVignetting)initWithCoder:(id)a3;
- (__CFXCameraEffectVignetting)cfxObject;
- (double)createCFXObject;
- (float)anamorphic;
- (float)intensity;
- (float)radius;
- (float)softness;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setAnamorphic:(float)a3;
- (void)setIntensity:(float)a3;
- (void)setRadius:(float)a3;
- (void)setSoftness:(float)a3;
@end

@implementation VFXCameraEffectVignetting

- (__CFXCameraEffectVignetting)cfxObject
{
  return (__CFXCameraEffectVignetting *)self->super._cameraEffect;
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
    v9[2] = sub_1B63E85DC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

- (float)anamorphic
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

- (void)setAnamorphic:(float)a3
{
  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E875C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"anamorphic", v9);
  }
}

- (float)softness
{
  if (!self->super._isPresentationObject) {
    return self->_anamorphic;
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

- (void)setSoftness:(float)a3
{
  if (self->super._isPresentationObject || self->_anamorphic != a3)
  {
    self->_anamorphic = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E88DC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"softness", v9);
  }
}

- (float)radius
{
  if (!self->super._isPresentationObject) {
    return self->_softness;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529CA8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setRadius:(float)a3
{
  if (self->super._isPresentationObject || self->_softness != a3)
  {
    self->_softness = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E8A5C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"radius", v9);
  }
}

+ (id)vignetting
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)VFXCameraEffectVignetting;
  id v4 = [(VFXCameraEffect *)&v22 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  *(float *)&double v9 = self->_intensity;
  objc_msgSend_setAnamorphic_(v4, v10, v11, v12, v9);
  *(float *)&double v13 = self->_anamorphic;
  objc_msgSend_setSoftness_(v4, v14, v15, v16, v13);
  *(float *)&double v17 = self->_softness;
  objc_msgSend_setRadius_(v4, v18, v19, v20, v17);
  return v4;
}

- (void)_syncObjCModel
{
  v31.receiver = self;
  v31.super_class = (Class)VFXCameraEffectVignetting;
  [(VFXCameraEffect *)&v31 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_anamorphic = sub_1B65299B8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_softness = sub_1B6529CA8((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXCameraEffectVignetting;
  -[VFXCameraEffect encodeWithCoder:](&v17, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"intensity", v7, v5);
  *(float *)&double v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"anamorphic", v10, v8);
  *(float *)&double v11 = self->_anamorphic;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"softness", v13, v11);
  *(float *)&double v14 = self->_softness;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"radius", v16, v14);
}

- (VFXCameraEffectVignetting)initWithCoder:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VFXCameraEffectVignetting;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v34, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"intensity", v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"anamorphic", v17);
    objc_msgSend_setAnamorphic_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"softness", v22);
    objc_msgSend_setSoftness_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, @"radius", v27);
    objc_msgSend_setRadius_(v7, v28, v29, v30);
    objc_msgSend_setImmediateMode_(VFXTransaction, v31, v8, v32);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB995390 != -1) {
    dispatch_once(&qword_1EB995390, &unk_1F0FB6528);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995398, 0x48uLL);
  *(unsigned char *)(v0 + 64) = 1;
  double result = 0.00781250185;
  *(_OWORD *)(v0 + 72) = xmmword_1B6E51FC0;
  return result;
}

@end