@interface VFXCameraEffectLensBlur
+ (BOOL)supportsSecureCoding;
+ (id)lensBlur;
- (VFXCameraEffectLensBlur)initWithCoder:(id)a3;
- (__CFXCameraEffectLensBlur)cfxObject;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)filterQuality;
- (uint64_t)createCFXObject;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterQuality:(int64_t)a3;
- (void)setRadius:(float)a3;
@end

@implementation VFXCameraEffectLensBlur

- (__CFXCameraEffectLensBlur)cfxObject
{
  return (__CFXCameraEffectLensBlur *)self->super._cameraEffect;
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
    v9[2] = sub_1B63EAD80;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"radius", v9);
  }
}

- (int64_t)filterQuality
{
  if (!self->super._isPresentationObject) {
    return *(void *)&self->_radius;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B652BBB0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setFilterQuality:(int64_t)a3
{
  if (self->super._isPresentationObject || *(void *)&self->_radius != a3)
  {
    *(void *)&self->_radius = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63EAEF4;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"filterQuality", v8);
  }
}

+ (id)lensBlur
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXCameraEffectLensBlur;
  id v4 = [(VFXCameraEffect *)&v12 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setRadius_(v4, v6, v7, v8, v5);
  objc_msgSend_setFilterQuality_(v4, v9, *(void *)&self->_radius, v10);
  return v4;
}

- (void)_syncObjCModel
{
  v17.receiver = self;
  v17.super_class = (Class)VFXCameraEffectLensBlur;
  [(VFXCameraEffect *)&v17 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(void *)&self->_radius = sub_1B652BBB0((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VFXCameraEffectLensBlur;
  -[VFXCameraEffect encodeWithCoder:](&v11, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"radius", v7, v5);
  *(float *)&double v8 = (float)*(uint64_t *)&self->_radius;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"filterQuality", v10, v8);
}

- (VFXCameraEffectLensBlur)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectLensBlur;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v24, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"radius", v12);
    objc_msgSend_setRadius_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"filterQuality", v17);
    objc_msgSend_setFilterQuality_(v7, v19, (uint64_t)v18, v20);
    objc_msgSend_setImmediateMode_(VFXTransaction, v21, v8, v22);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)createCFXObject
{
  if (qword_1EB995360 != -1) {
    dispatch_once(&qword_1EB995360, &unk_1F0FB6668);
  }
  uint64_t result = sub_1B63C8D44(qword_1EB995368, 0x40uLL);
  *(unsigned char *)(result + 64) = 1;
  *(_DWORD *)(result + 72) = 1065353216;
  *(unsigned char *)(result + 76) = 0;
  return result;
}

@end