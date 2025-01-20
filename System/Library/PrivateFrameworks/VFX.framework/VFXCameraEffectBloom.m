@interface VFXCameraEffectBloom
+ (BOOL)supportsSecureCoding;
+ (id)bloom;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (BOOL)useHighQuality;
- (VFXCameraEffectBloom)initWithCoder:(id)a3;
- (__CFXCameraEffectBloom)cfxObject;
- (__n128)colorFilter;
- (double)createCFXObject;
- (float)contrast;
- (float)intensity;
- (float)saturation;
- (float)threshold;
- (float)thresholdSmoothness;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (int64_t)iterationCount;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setColorFilter:(VFXCameraEffectBloom *)self;
- (void)setContrast:(float)a3;
- (void)setIntensity:(float)a3;
- (void)setIterationCount:(int64_t)a3;
- (void)setSaturation:(float)a3;
- (void)setThreshold:(float)a3;
- (void)setThresholdSmoothness:(float)a3;
- (void)setUseHighQuality:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXCameraEffectBloom

- (__CFXCameraEffectBloom)cfxObject
{
  return (__CFXCameraEffectBloom *)self->super._cameraEffect;
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
    v9[2] = sub_1B63E73D8;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

- (float)threshold
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

- (void)setThreshold:(float)a3
{
  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E7558;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"threshold", v9);
  }
}

- (float)thresholdSmoothness
{
  if (!self->super._isPresentationObject) {
    return self->_threshold;
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

- (void)setThresholdSmoothness:(float)a3
{
  if (self->super._isPresentationObject || self->_threshold != a3)
  {
    self->_threshold = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E76D8;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"thresholdSmoothness", v9);
  }
}

- (BOOL)useHighQuality
{
  if (!self->super._isPresentationObject) {
    return LOBYTE(self->_thresholdSmoothness) != 0;
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

- (void)setUseHighQuality:(BOOL)a3
{
  if (self->super._isPresentationObject || LOBYTE(self->_thresholdSmoothness) != a3)
  {
    LOBYTE(self->_thresholdSmoothness) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E7858;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"useHighQuality", v8);
  }
}

- (__n128)colorFilter
{
  if (a1[1].n128_u8[0])
  {
    uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
    uint64_t v13 = v5;
    if (v5) {
      sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v14 = (__n128 *)objc_msgSend_cfxObject(a1, v6, v7, v8);
    __n128 result = sub_1B652ADCC(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      __n128 v30 = result;
      sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[4];
  }
  return result;
}

- (void)setColorFilter:(VFXCameraEffectBloom *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_colorFilter[3], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_colorFilter[3] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63E79E0;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"colorFilter", v10);
  }
}

- (float)contrast
{
  if (!self->super._isPresentationObject) {
    return self->_contrast;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652AE6C(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setContrast:(float)a3
{
  if (self->super._isPresentationObject || self->_contrast != a3)
  {
    self->_contrast = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E7B60;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"contrast", v9);
  }
}

- (float)saturation
{
  if (!self->super._isPresentationObject) {
    return self->_saturation;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652AF10(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setSaturation:(float)a3
{
  if (self->super._isPresentationObject || self->_saturation != a3)
  {
    self->_saturation = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E7CE0;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"saturation", v9);
  }
}

- (int64_t)iterationCount
{
  if (!self->super._isPresentationObject) {
    return self->_iterationCount;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B652AFB4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setIterationCount:(int64_t)a3
{
  if (self->super._isPresentationObject || self->_iterationCount != a3)
  {
    self->_iterationCount = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E7E54;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"iterationCount", v8);
  }
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v4 = (_OWORD *)v3;
  int isEqualToString = objc_msgSend_isEqualToString_(a3, a2, @"colorFilter", v3);
  if (isEqualToString)
  {
    objc_msgSend_colorFilter(self, v6, v7, v8);
    *uint64_t v4 = v10;
  }
  return isEqualToString;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"colorFilter", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_colorFilter(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXCameraEffectBloom;
    return [(VFXCameraEffectBloom *)&v14 valueForKey:a3];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"colorFilter", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setColorFilter_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectBloom;
    [(VFXCameraEffectBloom *)&v13 setValue:a3 forKey:a4];
  }
}

+ (id)bloom
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v33.receiver = self;
  v33.super_class = (Class)VFXCameraEffectBloom;
  id v4 = [(VFXCameraEffect *)&v33 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  *(float *)&double v9 = self->_intensity;
  objc_msgSend_setThreshold_(v4, v10, v11, v12, v9);
  *(float *)&double v13 = self->_threshold;
  objc_msgSend_setThresholdSmoothness_(v4, v14, v15, v16, v13);
  objc_msgSend_setUseHighQuality_(v4, v17, LOBYTE(self->_thresholdSmoothness), v18);
  objc_msgSend_setColorFilter_(v4, v19, v20, v21, *(double *)&self->_colorFilter[3]);
  *(float *)&double v22 = self->_contrast;
  objc_msgSend_setContrast_(v4, v23, v24, v25, v22);
  *(float *)&double v26 = self->_saturation;
  objc_msgSend_setSaturation_(v4, v27, v28, v29, v26);
  objc_msgSend_setIterationCount_(v4, v30, self->_iterationCount, v31);
  return v4;
}

- (void)_syncObjCModel
{
  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectBloom;
  [(VFXCameraEffect *)&v59 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_threshold = sub_1B65299B8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  LOBYTE(self->_thresholdSmoothness) = sub_1B652991C((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(__n128 *)&self->_colorFilter[3] = sub_1B652ADCC((__n128 *)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_contrast = sub_1B652AE6C((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_saturation = sub_1B652AF10((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  self->_iterationCount = sub_1B652AFB4((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
}

- (void)encodeWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)VFXCameraEffectBloom;
  -[VFXCameraEffect encodeWithCoder:](&v22, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"intensity", v7, v5);
  *(float *)&double v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"threshold", v10, v8);
  *(float *)&double v11 = self->_threshold;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"thresholdSmoothness", v13, v11);
  objc_msgSend_encodeBool_forKey_(a3, v14, LOBYTE(self->_thresholdSmoothness), @"useHighQuality");
  sub_1B64FA2F4(a3, (const char *)@"colorFilter", *(__n128 *)&self->_colorFilter[3]);
  *(float *)&double v15 = self->_contrast;
  objc_msgSend_encodeFloat_forKey_(a3, v16, @"contrast", v17, v15);
  *(float *)&double v18 = self->_saturation;
  objc_msgSend_encodeFloat_forKey_(a3, v19, @"saturation", v20, v18);
  objc_msgSend_encodeInteger_forKey_(a3, v21, self->_iterationCount, @"iterationCount");
}

- (VFXCameraEffectBloom)initWithCoder:(id)a3
{
  v53.receiver = self;
  v53.super_class = (Class)VFXCameraEffectBloom;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v53, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"intensity", v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"threshold", v17);
    objc_msgSend_setThreshold_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"thresholdSmoothness", v22);
    objc_msgSend_setThresholdSmoothness_(v7, v23, v24, v25);
    uint64_t v28 = objc_msgSend_decodeBoolForKey_(a3, v26, @"useHighQuality", v27);
    objc_msgSend_setUseHighQuality_(v7, v29, v28, v30);
    double v31 = sub_1B64FA42C(a3, (const char *)@"colorFilter");
    objc_msgSend_setColorFilter_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeFloatForKey_(a3, v35, @"contrast", v36);
    objc_msgSend_setContrast_(v7, v37, v38, v39);
    objc_msgSend_decodeFloatForKey_(a3, v40, @"saturation", v41);
    objc_msgSend_setSaturation_(v7, v42, v43, v44);
    uint64_t v47 = objc_msgSend_decodeIntegerForKey_(a3, v45, @"iterationCount", v46);
    objc_msgSend_setIterationCount_(v7, v48, v47, v49);
    objc_msgSend_setImmediateMode_(VFXTransaction, v50, v8, v51);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB9952E0 != -1) {
    dispatch_once(&qword_1EB9952E0, &unk_1F0FB6308);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB9952E8, 0x70uLL);
  *(unsigned char *)(v0 + 64) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v0 + 72) = result;
  *(_DWORD *)(v0 + 80) = 1036831949;
  *(unsigned char *)(v0 + 84) = 1;
  __asm { FMOV            V1.4S, #1.0 }
  *(_OWORD *)(v0 + 96) = _Q1;
  *(double *)(v0 + 112) = result;
  *(void *)(v0 + 120) = 10;
  return result;
}

@end