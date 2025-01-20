@interface VFXCameraEffectChromaticTransform
+ (BOOL)supportsSecureCoding;
+ (id)chromaticTransform;
- (BOOL)maskEnabled;
- (BOOL)rawFloat2ForKey:(id)a3 value:;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (VFXCameraEffectChromaticTransform)initWithCoder:(id)a3;
- (__CFXCameraEffectChromaticTransform)cfxObject;
- (__n128)color1;
- (__n128)color2;
- (__n128)color3;
- (double)center;
- (double)createCFXObject;
- (double)fromShift;
- (double)maskCenter;
- (double)toShift;
- (float)fromAngle;
- (float)fromZ;
- (float)intensity;
- (float)maskRadius;
- (float)toAngle;
- (float)toZ;
- (float)unMultBlending;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (int64_t)sampleCount;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setCenter:(VFXCameraEffectChromaticTransform *)self;
- (void)setColor1:(VFXCameraEffectChromaticTransform *)self;
- (void)setColor2:(VFXCameraEffectChromaticTransform *)self;
- (void)setColor3:(VFXCameraEffectChromaticTransform *)self;
- (void)setFromAngle:(float)a3;
- (void)setFromShift:(VFXCameraEffectChromaticTransform *)self;
- (void)setFromZ:(float)a3;
- (void)setIntensity:(float)a3;
- (void)setMaskCenter:(VFXCameraEffectChromaticTransform *)self;
- (void)setMaskEnabled:(BOOL)a3;
- (void)setMaskRadius:(float)a3;
- (void)setSampleCount:(int64_t)a3;
- (void)setToAngle:(float)a3;
- (void)setToShift:(VFXCameraEffectChromaticTransform *)self;
- (void)setToZ:(float)a3;
- (void)setUnMultBlending:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXCameraEffectChromaticTransform

- (__CFXCameraEffectChromaticTransform)cfxObject
{
  return (__CFXCameraEffectChromaticTransform *)self->super._cameraEffect;
}

- (int64_t)sampleCount
{
  if (!self->super._isPresentationObject) {
    return self->_sampleCount;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  int64_t v29 = sub_1B652BFEC(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setSampleCount:(int64_t)a3
{
  if (self->super._isPresentationObject || self->_sampleCount != a3)
  {
    self->_sampleCount = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63EB2C0;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"sampleCount", v8);
  }
}

- (float)intensity
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
  float v29 = sub_1B65299B8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setIntensity:(float)a3
{
  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EB440;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"intensity", v9);
  }
}

- (double)center
{
  if (!*(unsigned char *)(a1 + 16)) {
    return *(double *)(a1 + 64);
  }
  uint64_t v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  double v29 = sub_1B652C124(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setCenter:(VFXCameraEffectChromaticTransform *)self
{
  float32x2_t v5 = v4;
  if (self->super._isPresentationObject
    || (uint32x2_t v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_center[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_center[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EB5C8;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"center", v10);
  }
}

- (float)fromZ
{
  if (!self->super._isPresentationObject) {
    return self->_fromAngle;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529E94(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setFromZ:(float)a3
{
  if (self->super._isPresentationObject || self->_fromAngle != a3)
  {
    self->_fromAngle = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EB748;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fromZ", v9);
  }
}

- (float)fromAngle
{
  if (!self->super._isPresentationObject) {
    return *(float *)self->_fromShift;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529F38(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setFromAngle:(float)a3
{
  if (self->super._isPresentationObject || *(float *)self->_fromShift != a3)
  {
    *(float *)self->_fromShift = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EB8C8;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fromAngle", v9);
  }
}

- (double)fromShift
{
  if (!*(unsigned char *)(a1 + 16)) {
    return *(double *)(a1 + 80);
  }
  uint64_t v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  double v29 = sub_1B652C1C8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setFromShift:(VFXCameraEffectChromaticTransform *)self
{
  float32x2_t v5 = v4;
  if (self->super._isPresentationObject
    || (uint32x2_t v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_fromShift[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_fromShift[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EBA50;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"fromShift", v10);
  }
}

- (float)toZ
{
  if (!self->super._isPresentationObject) {
    return self->_toAngle;
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

- (void)setToZ:(float)a3
{
  if (self->super._isPresentationObject || self->_toAngle != a3)
  {
    self->_toAngle = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EBBD0;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"toZ", v9);
  }
}

- (float)toAngle
{
  if (!self->super._isPresentationObject) {
    return *(float *)self->_toShift;
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

- (void)setToAngle:(float)a3
{
  if (self->super._isPresentationObject || *(float *)self->_toShift != a3)
  {
    *(float *)self->_toShift = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EBD50;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"toAngle", v9);
  }
}

- (double)toShift
{
  if (!*(unsigned char *)(a1 + 16)) {
    return *(double *)(a1 + 96);
  }
  uint64_t v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  double v29 = sub_1B652C26C(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setToShift:(VFXCameraEffectChromaticTransform *)self
{
  float32x2_t v5 = v4;
  if (self->super._isPresentationObject
    || (uint32x2_t v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_toShift[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_toShift[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EBED8;
    v10[3] = &unk_1E61412A8;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"toShift", v10);
  }
}

- (__n128)color1
{
  if (a1[1].n128_u8[0])
  {
    uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
    uint64_t v13 = v5;
    if (v5) {
      sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v14 = (__n128 *)objc_msgSend_cfxObject(a1, v6, v7, v8);
    __n128 result = sub_1B652B314(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      __n128 v30 = result;
      sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[7];
  }
  return result;
}

- (void)setColor1:(VFXCameraEffectChromaticTransform *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color1[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color1[4] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EC060;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"color1", v10);
  }
}

- (__n128)color2
{
  if (a1[1].n128_u8[0])
  {
    uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
    uint64_t v13 = v5;
    if (v5) {
      sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v14 = (__n128 *)objc_msgSend_cfxObject(a1, v6, v7, v8);
    __n128 result = sub_1B652C310(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      __n128 v30 = result;
      sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[8];
  }
  return result;
}

- (void)setColor2:(VFXCameraEffectChromaticTransform *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color2[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color2[4] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EC1E8;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"color2", v10);
  }
}

- (__n128)color3
{
  if (a1[1].n128_u8[0])
  {
    uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
    uint64_t v13 = v5;
    if (v5) {
      sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v14 = (__n128 *)objc_msgSend_cfxObject(a1, v6, v7, v8);
    __n128 result = sub_1B652B458(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      __n128 v30 = result;
      sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[9];
  }
  return result;
}

- (void)setColor3:(VFXCameraEffectChromaticTransform *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color3[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color3[4] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EC370;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"color3", v10);
  }
}

- (double)maskCenter
{
  if (!*(unsigned char *)(a1 + 16)) {
    return *(double *)(a1 + 160);
  }
  uint64_t v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  double v29 = sub_1B652C3B0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMaskCenter:(VFXCameraEffectChromaticTransform *)self
{
  float32x2_t v5 = v4;
  if (self->super._isPresentationObject
    || (uint32x2_t v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_maskCenter[4], v4),
        (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_maskCenter[4] = v5;
    uint64_t v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EC4F8;
    v10[3] = &unk_1E61412A8;
    void v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, @"maskCenter", v10);
  }
}

- (float)maskRadius
{
  if (!self->super._isPresentationObject) {
    return *(float *)&self->_maskEnabled;
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

- (void)setMaskRadius:(float)a3
{
  if (self->super._isPresentationObject || *(float *)&self->_maskEnabled != a3)
  {
    *(float *)&self->_maskEnabled = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EC678;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"maskRadius", v9);
  }
}

- (BOOL)maskEnabled
{
  if (!self->super._isPresentationObject) {
    return LOBYTE(self->_unMultBlending) != 0;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  char v29 = sub_1B652C4AC(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setMaskEnabled:(BOOL)a3
{
  if (self->super._isPresentationObject || LOBYTE(self->_unMultBlending) != a3)
  {
    LOBYTE(self->_unMultBlending) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63EC7F8;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"maskEnabled", v8);
  }
}

- (float)unMultBlending
{
  if (!self->super._isPresentationObject) {
    return *(float *)&self[1].super.super.isa;
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

- (void)setUnMultBlending:(float)a3
{
  if (self->super._isPresentationObject || *(float *)&self[1].super.super.isa != a3)
  {
    *(float *)&self[1].super.super.isa = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EC978;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"unMultBlending", v9);
  }
}

+ (id)chromaticTransform
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v4 = (void *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"center", v3))
  {
    objc_msgSend_center(self, v7, v8, v9);
LABEL_9:
    *uint64_t v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"fromShift", v9))
  {
    objc_msgSend_fromShift(self, v11, v12, v13);
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(a3, v11, @"toShift", v13))
  {
    objc_msgSend_toShift(self, v14, v15, v16);
    goto LABEL_9;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(a3, v14, @"maskCenter", v16);
  if (isEqualToString)
  {
    objc_msgSend_maskCenter(self, v18, v19, v20);
    goto LABEL_9;
  }
  return isEqualToString;
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"color1", v3))
  {
    objc_msgSend_color1(self, v7, v8, v9);
LABEL_7:
    *uint64_t v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"color2", v9))
  {
    objc_msgSend_color2(self, v11, v12, v13);
    goto LABEL_7;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(a3, v11, @"color3", v13);
  if (isEqualToString)
  {
    objc_msgSend_color3(self, v15, v16, v17);
    goto LABEL_7;
  }
  return isEqualToString;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"color1", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_color1(self, v6, v7, v8);
LABEL_7:
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, @"color2", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_color2(self, v13, v14, v15);
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(a3, v13, @"color3", v15))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_color3(self, v16, v17, v18);
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(a3, v16, @"center", v18))
  {
    uint64_t v23 = MEMORY[0x1E4F29238];
    objc_msgSend_center(self, v20, v21, v22);
  }
  else if (objc_msgSend_isEqualToString_(a3, v20, @"fromShift", v22))
  {
    uint64_t v23 = MEMORY[0x1E4F29238];
    objc_msgSend_fromShift(self, v26, v27, v28);
  }
  else if (objc_msgSend_isEqualToString_(a3, v26, @"toShift", v28))
  {
    uint64_t v23 = MEMORY[0x1E4F29238];
    objc_msgSend_toShift(self, v29, v30, v31);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v29, @"maskCenter", v31))
    {
      v35.receiver = self;
      v35.super_class = (Class)VFXCameraEffectChromaticTransform;
      return [(VFXCameraEffectChromaticTransform *)&v35 valueForKey:a3];
    }
    uint64_t v23 = MEMORY[0x1E4F29238];
    objc_msgSend_maskCenter(self, v32, v33, v34);
  }

  return (id)MEMORY[0x1F4181798](v23, sel_valueWithVFXFloat2_, v24, v25);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"color1", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setColor1_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"color2", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setColor2_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"color3", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setColor3_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, @"center", v21))
  {
    objc_msgSend_VFXFloat2Value(a3, v25, v26, v27);
    objc_msgSend_setCenter_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, @"fromShift", v27))
  {
    objc_msgSend_VFXFloat2Value(a3, v31, v32, v33);
    objc_msgSend_setFromShift_(self, v34, v35, v36);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, @"toShift", v33))
  {
    objc_msgSend_VFXFloat2Value(a3, v37, v38, v39);
    objc_msgSend_setToShift_(self, v40, v41, v42);
  }
  else if (objc_msgSend_isEqualToString_(a4, v37, @"maskCenter", v39))
  {
    objc_msgSend_VFXFloat2Value(a3, v43, v44, v45);
    objc_msgSend_setMaskCenter_(self, v46, v47, v48);
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VFXCameraEffectChromaticTransform;
    [(VFXCameraEffectChromaticTransform *)&v49 setValue:a3 forKey:a4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectChromaticTransform;
  id v4 = [(VFXCameraEffect *)&v59 copyWithZone:a3];
  objc_msgSend_setSampleCount_(v4, v5, self->_sampleCount, v6);
  *(float *)&double v7 = self->_intensity;
  objc_msgSend_setIntensity_(v4, v8, v9, v10, v7);
  objc_msgSend_setCenter_(v4, v11, v12, v13, *(double *)&self->_center[4]);
  *(float *)&double v14 = self->_fromAngle;
  objc_msgSend_setFromZ_(v4, v15, v16, v17, v14);
  LODWORD(v18) = *(_DWORD *)self->_fromShift;
  objc_msgSend_setFromAngle_(v4, v19, v20, v21, v18);
  objc_msgSend_setFromShift_(v4, v22, v23, v24, *(double *)&self->_fromShift[4]);
  *(float *)&double v25 = self->_toAngle;
  objc_msgSend_setToZ_(v4, v26, v27, v28, v25);
  LODWORD(v29) = *(_DWORD *)self->_toShift;
  objc_msgSend_setToAngle_(v4, v30, v31, v32, v29);
  objc_msgSend_setToShift_(v4, v33, v34, v35, *(double *)&self->_toShift[4]);
  objc_msgSend_setColor1_(v4, v36, v37, v38, *(double *)&self->_color1[4]);
  objc_msgSend_setColor2_(v4, v39, v40, v41, *(double *)&self->_color2[4]);
  objc_msgSend_setColor3_(v4, v42, v43, v44, *(double *)&self->_color3[4]);
  objc_msgSend_setMaskCenter_(v4, v45, v46, v47, *(double *)&self->_maskCenter[4]);
  LODWORD(v48) = *(_DWORD *)&self->_maskEnabled;
  objc_msgSend_setMaskRadius_(v4, v49, v50, v51, v48);
  objc_msgSend_setMaskEnabled_(v4, v52, LOBYTE(self->_unMultBlending), v53);
  LODWORD(v54) = self[1].super.super.isa;
  objc_msgSend_setUnMultBlending_(v4, v55, v56, v57, v54);
  return v4;
}

- (void)_syncObjCModel
{
  v115.receiver = self;
  v115.super_class = (Class)VFXCameraEffectChromaticTransform;
  [(VFXCameraEffect *)&v115 _syncObjCModel];
  self->_sampleCount = sub_1B652BFEC((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B65299B8((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  *(double *)&self->_center[4] = sub_1B652C124((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_fromAngle = sub_1B6529E94((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(float *)self->_fromShift = sub_1B6529F38((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  *(double *)&self->_fromShift[4] = sub_1B652C1C8((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_toAngle = sub_1B652AE6C((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  *(float *)self->_toShift = sub_1B652AF10((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
  *(double *)&self->_toShift[4] = sub_1B652C26C((uint64_t)self->super._cameraEffect, v59, v60, v61, v62, v63, v64, v65);
  *(__n128 *)&self->_color1[4] = sub_1B652B314((__n128 *)self->super._cameraEffect, v66, v67, v68, v69, v70, v71, v72);
  *(__n128 *)&self->_color2[4] = sub_1B652C310((__n128 *)self->super._cameraEffect, v73, v74, v75, v76, v77, v78, v79);
  *(__n128 *)&self->_color3[4] = sub_1B652B458((__n128 *)self->super._cameraEffect, v80, v81, v82, v83, v84, v85, v86);
  *(double *)&self->_maskCenter[4] = sub_1B652C3B0((uint64_t)self->super._cameraEffect, v87, v88, v89, v90, v91, v92, v93);
  *(float *)&self->_maskEnabled = sub_1B652A3C0((uint64_t)self->super._cameraEffect, v94, v95, v96, v97, v98, v99, v100);
  LOBYTE(self->_unMultBlending) = sub_1B652C4AC((uint64_t)self->super._cameraEffect, v101, v102, v103, v104, v105, v106, v107);
  *(float *)&self[1].super.super.isa = sub_1B652A510((uint64_t)self->super._cameraEffect, v108, v109, v110, v111, v112, v113, v114);
}

- (void)encodeWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VFXCameraEffectChromaticTransform;
  -[VFXCameraEffect encodeWithCoder:](&v30, sel_encodeWithCoder_);
  *(float *)&double v5 = (float)self->_sampleCount;
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"sampleCount", v7, v5);
  *(float *)&double v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"intensity", v10, v8);
  sub_1B64FA298(a3, (const char *)@"center", *(double *)&self->_center[4]);
  *(float *)&double v11 = self->_fromAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"fromZ", v13, v11);
  LODWORD(v14) = *(_DWORD *)self->_fromShift;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"fromAngle", v16, v14);
  sub_1B64FA298(a3, (const char *)@"fromShift", *(double *)&self->_fromShift[4]);
  *(float *)&double v17 = self->_toAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"toZ", v19, v17);
  LODWORD(v20) = *(_DWORD *)self->_toShift;
  objc_msgSend_encodeFloat_forKey_(a3, v21, @"toAngle", v22, v20);
  sub_1B64FA298(a3, (const char *)@"toShift", *(double *)&self->_toShift[4]);
  sub_1B64FA2F4(a3, (const char *)@"color1", *(__n128 *)&self->_color1[4]);
  sub_1B64FA2F4(a3, (const char *)@"color2", *(__n128 *)&self->_color2[4]);
  sub_1B64FA2F4(a3, (const char *)@"color3", *(__n128 *)&self->_color3[4]);
  sub_1B64FA298(a3, (const char *)@"maskCenter", *(double *)&self->_maskCenter[4]);
  LODWORD(v23) = *(_DWORD *)&self->_maskEnabled;
  objc_msgSend_encodeFloat_forKey_(a3, v24, @"maskRadius", v25, v23);
  objc_msgSend_encodeBool_forKey_(a3, v26, LOBYTE(self->_unMultBlending), @"maskEnabled");
  LODWORD(v27) = self[1].super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v28, @"unMultBlending", v29, v27);
}

- (VFXCameraEffectChromaticTransform)initWithCoder:(id)a3
{
  v87.receiver = self;
  v87.super_class = (Class)VFXCameraEffectChromaticTransform;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v87, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"sampleCount", v12);
    objc_msgSend_setSampleCount_(v7, v14, (uint64_t)v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"intensity", v17);
    objc_msgSend_setIntensity_(v7, v18, v19, v20);
    double v21 = sub_1B64FA3EC(a3, (const char *)@"center");
    objc_msgSend_setCenter_(v7, v22, v23, v24, v21);
    objc_msgSend_decodeFloatForKey_(a3, v25, @"fromZ", v26);
    objc_msgSend_setFromZ_(v7, v27, v28, v29);
    objc_msgSend_decodeFloatForKey_(a3, v30, @"fromAngle", v31);
    objc_msgSend_setFromAngle_(v7, v32, v33, v34);
    double v35 = sub_1B64FA3EC(a3, (const char *)@"fromShift");
    objc_msgSend_setFromShift_(v7, v36, v37, v38, v35);
    objc_msgSend_decodeFloatForKey_(a3, v39, @"toZ", v40);
    objc_msgSend_setToZ_(v7, v41, v42, v43);
    objc_msgSend_decodeFloatForKey_(a3, v44, @"toAngle", v45);
    objc_msgSend_setToAngle_(v7, v46, v47, v48);
    double v49 = sub_1B64FA3EC(a3, (const char *)@"toShift");
    objc_msgSend_setToShift_(v7, v50, v51, v52, v49);
    double v53 = sub_1B64FA42C(a3, (const char *)@"color1");
    objc_msgSend_setColor1_(v7, v54, v55, v56, v53);
    double v57 = sub_1B64FA42C(a3, (const char *)@"color2");
    objc_msgSend_setColor2_(v7, v58, v59, v60, v57);
    double v61 = sub_1B64FA42C(a3, (const char *)@"color3");
    objc_msgSend_setColor3_(v7, v62, v63, v64, v61);
    double v65 = sub_1B64FA3EC(a3, (const char *)@"maskCenter");
    objc_msgSend_setMaskCenter_(v7, v66, v67, v68, v65);
    objc_msgSend_decodeFloatForKey_(a3, v69, @"maskRadius", v70);
    objc_msgSend_setMaskRadius_(v7, v71, v72, v73);
    uint64_t v76 = objc_msgSend_decodeBoolForKey_(a3, v74, @"maskEnabled", v75);
    objc_msgSend_setMaskEnabled_(v7, v77, v76, v78);
    objc_msgSend_decodeFloatForKey_(a3, v79, @"unMultBlending", v80);
    objc_msgSend_setUnMultBlending_(v7, v81, v82, v83);
    objc_msgSend_setImmediateMode_(VFXTransaction, v84, v8, v85);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB9952F0 != -1) {
    dispatch_once(&qword_1EB9952F0, &unk_1F0FB67A8);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB9952F8, 0xC0uLL);
  *(unsigned char *)(v0 + 64) = 1;
  *(void *)(v0 + 72) = 32;
  *(_DWORD *)(v0 + 80) = 1065353216;
  double result = 0.0;
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 1065353216;
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 1067030938;
  *(void *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 128) = xmmword_1B6E4F300;
  *(_OWORD *)(v0 + 144) = xmmword_1B6E4F320;
  *(_OWORD *)(v0 + 160) = xmmword_1B6E4F2E0;
  *(void *)(v0 + 176) = 0;
  *(_DWORD *)(v0 + 184) = 1065353216;
  *(unsigned char *)(v0 + 188) = 0;
  *(_DWORD *)(v0 + 192) = 0;
  return result;
}

@end