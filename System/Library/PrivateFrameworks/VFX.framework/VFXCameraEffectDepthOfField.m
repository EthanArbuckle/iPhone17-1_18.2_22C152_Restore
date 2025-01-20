@interface VFXCameraEffectDepthOfField
+ (BOOL)supportsSecureCoding;
+ (id)depthOfField;
- (VFXCameraEffectDepthOfField)initWithCoder:(id)a3;
- (__CFXCameraEffectDepthOfField)cfxObject;
- (double)createCFXObject;
- (float)fStop;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)apertureBladeCount;
- (int64_t)focalBlurSampleCount;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setApertureBladeCount:(int64_t)a3;
- (void)setFStop:(float)a3;
- (void)setFocalBlurSampleCount:(int64_t)a3;
@end

@implementation VFXCameraEffectDepthOfField

- (__CFXCameraEffectDepthOfField)cfxObject
{
  return (__CFXCameraEffectDepthOfField *)self->super._cameraEffect;
}

- (int64_t)focalBlurSampleCount
{
  if (!self->super._isPresentationObject) {
    return *(void *)&self->_fStop;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B65293D4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setFocalBlurSampleCount:(int64_t)a3
{
  if (self->super._isPresentationObject || *(void *)&self->_fStop != a3)
  {
    *(void *)&self->_fStop = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E3E08;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"focalBlurSampleCount", v8);
  }
}

- (float)fStop
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

- (void)setFStop:(float)a3
{
  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E3F88;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fStop", v9);
  }
}

- (int64_t)apertureBladeCount
{
  if (!self->super._isPresentationObject) {
    return self->_focalBlurSampleCount;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B6529470(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setApertureBladeCount:(int64_t)a3
{
  if (self->super._isPresentationObject || self->_focalBlurSampleCount != a3)
  {
    self->_focalBlurSampleCount = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E40FC;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"apertureBladeCount", v8);
  }
}

+ (id)depthOfField
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VFXCameraEffectDepthOfField;
  id v4 = [(VFXCameraEffect *)&v14 copyWithZone:a3];
  objc_msgSend_setFocalBlurSampleCount_(v4, v5, *(void *)&self->_fStop, v6);
  LODWORD(v7) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setFStop_(v4, v8, v9, v10, v7);
  objc_msgSend_setApertureBladeCount_(v4, v11, self->_focalBlurSampleCount, v12);
  return v4;
}

- (void)_syncObjCModel
{
  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectDepthOfField;
  [(VFXCameraEffect *)&v24 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(void *)&self->_fStop = sub_1B65293D4((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_focalBlurSampleCount = sub_1B6529470((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffectDepthOfField;
  -[VFXCameraEffect encodeWithCoder:](&v10, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"fStop", v7, v5);
  objc_msgSend_encodeInteger_forKey_(a3, v8, *(void *)&self->_fStop, @"focalBlurSampleCount");
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->_focalBlurSampleCount, @"apertureBladeCount");
}

- (VFXCameraEffectDepthOfField)initWithCoder:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)VFXCameraEffectDepthOfField;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v29, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"fStop", v12);
    objc_msgSend_setFStop_(v7, v13, v14, v15);
    uint64_t v18 = objc_msgSend_decodeIntegerForKey_(a3, v16, @"focalBlurSampleCount", v17);
    objc_msgSend_setFocalBlurSampleCount_(v7, v19, v18, v20);
    uint64_t v23 = objc_msgSend_decodeIntegerForKey_(a3, v21, @"apertureBladeCount", v22);
    objc_msgSend_setApertureBladeCount_(v7, v24, v23, v25);
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
  if (qword_1EB995320 != -1) {
    dispatch_once(&qword_1EB995320, &unk_1F0FB5C08);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995328, 0x50uLL);
  *(unsigned char *)(v0 + 64) = 1;
  *(_DWORD *)(v0 + 72) = 1085485875;
  *(void *)&double result = 25;
  *(_OWORD *)(v0 + 80) = xmmword_1B6E51F70;
  return result;
}

@end