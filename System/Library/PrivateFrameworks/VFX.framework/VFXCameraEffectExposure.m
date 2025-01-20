@interface VFXCameraEffectExposure
+ (BOOL)supportsSecureCoding;
+ (id)exposure;
- (BOOL)wantsAdaptation;
- (VFXCameraEffectExposure)initWithCoder:(id)a3;
- (__CFXCameraEffectExposure)cfxObject;
- (double)createCFXObject;
- (float)adaptationBrighteningSpeedFactor;
- (float)adaptationDarkeningSpeedFactor;
- (float)adaptationMaximum;
- (float)adaptationMinimum;
- (float)averageGray;
- (float)offset;
- (float)value;
- (float)whitePoint;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_syncObjCModel;
- (void)encodeWithCoder:(id)a3;
- (void)setAdaptationBrighteningSpeedFactor:(float)a3;
- (void)setAdaptationDarkeningSpeedFactor:(float)a3;
- (void)setAdaptationMaximum:(float)a3;
- (void)setAdaptationMinimum:(float)a3;
- (void)setAverageGray:(float)a3;
- (void)setOffset:(float)a3;
- (void)setValue:(float)a3;
- (void)setWantsAdaptation:(BOOL)a3;
- (void)setWhitePoint:(float)a3;
@end

@implementation VFXCameraEffectExposure

- (__CFXCameraEffectExposure)cfxObject
{
  return (__CFXCameraEffectExposure *)self->super._cameraEffect;
}

- (float)value
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

- (void)setValue:(float)a3
{
  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E52B4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"value", v9);
  }
}

- (float)offset
{
  if (!self->super._isPresentationObject) {
    return self->_value;
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

- (void)setOffset:(float)a3
{
  if (self->super._isPresentationObject || self->_value != a3)
  {
    self->_value = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5434;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"offset", v9);
  }
}

- (float)averageGray
{
  if (!self->super._isPresentationObject) {
    return self->_offset;
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

- (void)setAverageGray:(float)a3
{
  if (self->super._isPresentationObject || self->_offset != a3)
  {
    self->_offset = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E55B4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"averageGray", v9);
  }
}

- (float)whitePoint
{
  if (!self->super._isPresentationObject) {
    return self->_averageGray;
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

- (void)setWhitePoint:(float)a3
{
  if (self->super._isPresentationObject || self->_averageGray != a3)
  {
    self->_averageGray = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5734;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"whitePoint", v9);
  }
}

- (BOOL)wantsAdaptation
{
  if (!self->super._isPresentationObject) {
    return LOBYTE(self->_adaptationMaximum) != 0;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  char v29 = sub_1B6529FDC(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setWantsAdaptation:(BOOL)a3
{
  if (self->super._isPresentationObject || LOBYTE(self->_adaptationMaximum) != a3)
  {
    LOBYTE(self->_adaptationMaximum) = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E58B4;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"wantsAdaptation", v8);
  }
}

- (float)adaptationBrighteningSpeedFactor
{
  if (!self->super._isPresentationObject) {
    return self->_whitePoint;
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

- (void)setAdaptationBrighteningSpeedFactor:(float)a3
{
  if (self->super._isPresentationObject || self->_whitePoint != a3)
  {
    self->_whitePoint = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5A34;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"adaptationBrighteningSpeedFactor", v9);
  }
}

- (float)adaptationDarkeningSpeedFactor
{
  if (!self->super._isPresentationObject) {
    return self->_adaptationBrighteningSpeedFactor;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B6529DF0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setAdaptationDarkeningSpeedFactor:(float)a3
{
  if (self->super._isPresentationObject || self->_adaptationBrighteningSpeedFactor != a3)
  {
    self->_adaptationBrighteningSpeedFactor = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5BB4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"adaptationDarkeningSpeedFactor", v9);
  }
}

- (float)adaptationMinimum
{
  if (!self->super._isPresentationObject) {
    return self->_adaptationDarkeningSpeedFactor;
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

- (void)setAdaptationMinimum:(float)a3
{
  if (self->super._isPresentationObject || self->_adaptationDarkeningSpeedFactor != a3)
  {
    self->_adaptationDarkeningSpeedFactor = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5D34;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"adaptationMinimum", v9);
  }
}

- (float)adaptationMaximum
{
  if (!self->super._isPresentationObject) {
    return self->_adaptationMinimum;
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

- (void)setAdaptationMaximum:(float)a3
{
  if (self->super._isPresentationObject || self->_adaptationMinimum != a3)
  {
    self->_adaptationMinimum = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E5EB4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"adaptationMaximum", v9);
  }
}

+ (id)exposure
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v36.receiver = self;
  v36.super_class = (Class)VFXCameraEffectExposure;
  id v4 = [(VFXCameraEffect *)&v36 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setValue_(v4, v6, v7, v8, v5);
  *(float *)&double v9 = self->_value;
  objc_msgSend_setOffset_(v4, v10, v11, v12, v9);
  *(float *)&double v13 = self->_offset;
  objc_msgSend_setAverageGray_(v4, v14, v15, v16, v13);
  *(float *)&double v17 = self->_whitePoint;
  objc_msgSend_setAdaptationBrighteningSpeedFactor_(v4, v18, v19, v20, v17);
  *(float *)&double v21 = self->_adaptationBrighteningSpeedFactor;
  objc_msgSend_setAdaptationDarkeningSpeedFactor_(v4, v22, v23, v24, v21);
  *(float *)&double v25 = self->_adaptationDarkeningSpeedFactor;
  objc_msgSend_setAdaptationMinimum_(v4, v26, v27, v28, v25);
  *(float *)&double v29 = self->_adaptationMinimum;
  objc_msgSend_setAdaptationMaximum_(v4, v30, v31, v32, v29);
  objc_msgSend_setWantsAdaptation_(v4, v33, LOBYTE(self->_adaptationMaximum), v34);
  return v4;
}

- (void)_syncObjCModel
{
  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectExposure;
  [(VFXCameraEffect *)&v59 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_value = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_offset = sub_1B65299B8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  LOBYTE(self->_adaptationMaximum) = sub_1B6529FDC((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  self->_whitePoint = sub_1B6529D4C((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_adaptationBrighteningSpeedFactor = sub_1B6529DF0((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_adaptationDarkeningSpeedFactor = sub_1B6529E94((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  self->_adaptationMinimum = sub_1B6529F38((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
}

- (void)encodeWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VFXCameraEffectExposure;
  -[VFXCameraEffect encodeWithCoder:](&v30, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"value", v7, v5);
  *(float *)&double v8 = self->_value;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"offset", v10, v8);
  *(float *)&double v11 = self->_offset;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"averageGray", v13, v11);
  *(float *)&double v14 = self->_averageGray;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"whitePoint", v16, v14);
  objc_msgSend_encodeBool_forKey_(a3, v17, LOBYTE(self->_adaptationMaximum), @"wantsAdaptation");
  *(float *)&double v18 = self->_whitePoint;
  objc_msgSend_encodeFloat_forKey_(a3, v19, @"adaptationBrighteningSpeedFactor", v20, v18);
  *(float *)&double v21 = self->_adaptationBrighteningSpeedFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v22, @"adaptationDarkeningSpeedFactor", v23, v21);
  *(float *)&double v24 = self->_adaptationDarkeningSpeedFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v25, @"adaptationMinimum", v26, v24);
  *(float *)&double v27 = self->_adaptationMinimum;
  objc_msgSend_encodeFloat_forKey_(a3, v28, @"adaptationMaximum", v29, v27);
}

- (VFXCameraEffectExposure)initWithCoder:(id)a3
{
  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectExposure;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v59, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"value", v12);
    objc_msgSend_setValue_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"offset", v17);
    objc_msgSend_setOffset_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"averageGray", v22);
    objc_msgSend_setAverageGray_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, @"whitePoint", v27);
    objc_msgSend_setWhitePoint_(v7, v28, v29, v30);
    uint64_t v33 = objc_msgSend_decodeBoolForKey_(a3, v31, @"wantsAdaptation", v32);
    objc_msgSend_setWantsAdaptation_(v7, v34, v33, v35);
    objc_msgSend_decodeFloatForKey_(a3, v36, @"adaptationBrighteningSpeedFactor", v37);
    objc_msgSend_setAdaptationBrighteningSpeedFactor_(v7, v38, v39, v40);
    objc_msgSend_decodeFloatForKey_(a3, v41, @"adaptationDarkeningSpeedFactor", v42);
    objc_msgSend_setAdaptationDarkeningSpeedFactor_(v7, v43, v44, v45);
    objc_msgSend_decodeFloatForKey_(a3, v46, @"adaptationMinimum", v47);
    objc_msgSend_setAdaptationMinimum_(v7, v48, v49, v50);
    objc_msgSend_decodeFloatForKey_(a3, v51, @"adaptationMaximum", v52);
    objc_msgSend_setAdaptationMaximum_(v7, v53, v54, v55);
    objc_msgSend_setImmediateMode_(VFXTransaction, v56, v8, v57);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB995340 != -1) {
    dispatch_once(&qword_1EB995340, &unk_1F0FB6188);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995348, 0x60uLL);
  *(unsigned char *)(v0 + 64) = 1;
  *(_OWORD *)(v0 + 72) = xmmword_1B6E51F80;
  double result = 0.0000976562876;
  *(_OWORD *)(v0 + 88) = xmmword_1B6E51F90;
  *(unsigned char *)(v0 + 104) = 0;
  return result;
}

@end