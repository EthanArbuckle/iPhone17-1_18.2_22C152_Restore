@interface VFXCameraEffectMotionBlur
+ (BOOL)supportsSecureCoding;
+ (id)motionBlur;
- (VFXCameraEffectMotionBlur)initWithCoder:(id)a3;
- (__CFXCameraEffectMotionBlur)cfxObject;
- (float)intensity;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)createCFXObject;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setIntensity:(float)a3;
@end

@implementation VFXCameraEffectMotionBlur

- (__CFXCameraEffectMotionBlur)cfxObject
{
  return (__CFXCameraEffectMotionBlur *)self->super._cameraEffect;
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
    v9[2] = sub_1B63E452C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

+ (id)motionBlur
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffectMotionBlur;
  id v4 = [(VFXCameraEffect *)&v10 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  return v4;
}

- (void)_syncObjCModel
{
  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffectMotionBlur;
  [(VFXCameraEffect *)&v10 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXCameraEffectMotionBlur;
  -[VFXCameraEffect encodeWithCoder:](&v8, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"intensity", v7, v5);
}

- (VFXCameraEffectMotionBlur)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)VFXCameraEffectMotionBlur;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v19, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"intensity", v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_setImmediateMode_(VFXTransaction, v16, v8, v17);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)createCFXObject
{
  if (qword_1EB995370 != -1) {
    dispatch_once(&qword_1EB995370, &unk_1F0FB6F08);
  }
  uint64_t result = sub_1B63C8D44(qword_1EB995378, 0x40uLL);
  *(unsigned char *)(result + 64) = 1;
  *(_DWORD *)(result + 72) = 1065353216;
  return result;
}

@end