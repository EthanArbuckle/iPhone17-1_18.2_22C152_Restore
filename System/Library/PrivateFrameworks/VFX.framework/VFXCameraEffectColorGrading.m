@interface VFXCameraEffectColorGrading
+ (BOOL)supportsSecureCoding;
+ (id)colorGrading;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (VFXCameraEffectColorGrading)initWithCoder:(id)a3;
- (__CFXCameraEffectColorGrading)cfxObject;
- (__n128)gainColor;
- (__n128)gammaColor;
- (__n128)liftColor;
- (double)createCFXObject;
- (float)contrast;
- (float)gainOffset;
- (float)gammaOffset;
- (float)liftOffset;
- (float)saturation;
- (float)whiteBalanceTemperature;
- (float)whiteBalanceTint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)lookupTable;
- (id)valueForKey:(id)a3;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContrast:(float)a3;
- (void)setGainColor:(VFXCameraEffectColorGrading *)self;
- (void)setGainOffset:(float)a3;
- (void)setGammaColor:(VFXCameraEffectColorGrading *)self;
- (void)setGammaOffset:(float)a3;
- (void)setLiftColor:(VFXCameraEffectColorGrading *)self;
- (void)setLiftOffset:(float)a3;
- (void)setLookupTable:(id)a3;
- (void)setSaturation:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWhiteBalanceTemperature:(float)a3;
- (void)setWhiteBalanceTint:(float)a3;
@end

@implementation VFXCameraEffectColorGrading

- (void)dealloc
{
  objc_msgSend_parentWillDie_(self->_lookupTable, a2, (uint64_t)self, v2);

  v4.receiver = self;
  v4.super_class = (Class)VFXCameraEffectColorGrading;
  [(VFXCameraEffect *)&v4 dealloc];
}

- (__CFXCameraEffectColorGrading)cfxObject
{
  return (__CFXCameraEffectColorGrading *)self->super._cameraEffect;
}

- (float)saturation
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

- (void)setSaturation:(float)a3
{
  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E948C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"saturation", v9);
  }
}

- (float)contrast
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
  float v29 = sub_1B6529878(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setContrast:(float)a3
{
  if (self->super._isPresentationObject || self->_saturation != a3)
  {
    self->_saturation = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E960C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"contrast", v9);
  }
}

- (float)whiteBalanceTemperature
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
  float v29 = sub_1B65299B8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setWhiteBalanceTemperature:(float)a3
{
  if (self->super._isPresentationObject || self->_contrast != a3)
  {
    self->_contrast = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E978C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"whiteBalanceTemperature", v9);
  }
}

- (float)whiteBalanceTint
{
  if (!self->super._isPresentationObject) {
    return self->_whiteBalanceTemperature;
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

- (void)setWhiteBalanceTint:(float)a3
{
  if (self->super._isPresentationObject || self->_whiteBalanceTemperature != a3)
  {
    self->_whiteBalanceTemperature = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E990C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"whiteBalanceTint", v9);
  }
}

- (__n128)liftColor
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

- (void)setLiftColor:(VFXCameraEffectColorGrading *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_liftColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_liftColor = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63E9A94;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"liftColor", v10);
  }
}

- (float)liftOffset
{
  if (!self->super._isPresentationObject) {
    return self->_liftOffset;
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

- (void)setLiftOffset:(float)a3
{
  if (self->super._isPresentationObject || self->_liftOffset != a3)
  {
    self->_liftOffset = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E9C14;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"liftOffset", v9);
  }
}

- (__n128)gammaColor
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
    return a1[6];
  }
  return result;
}

- (void)setGammaColor:(VFXCameraEffectColorGrading *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_gammaColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_gammaColor = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63E9D9C;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"gammaColor", v10);
  }
}

- (float)gammaOffset
{
  if (!self->super._isPresentationObject) {
    return self->_gammaOffset;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652B3B4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setGammaOffset:(float)a3
{
  if (self->super._isPresentationObject || self->_gammaOffset != a3)
  {
    self->_gammaOffset = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63E9F1C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"gammaOffset", v9);
  }
}

- (__n128)gainColor
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
    return a1[8];
  }
  return result;
}

- (void)setGainColor:(VFXCameraEffectColorGrading *)self
{
  if (self->super._isPresentationObject
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_gainColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_gainColor = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B63EA0A4;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"gainColor", v10);
  }
}

- (float)gainOffset
{
  if (!self->super._isPresentationObject) {
    return self->_gainOffset;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  float v29 = sub_1B652B4F8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13) {
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  return v29;
}

- (void)setGainOffset:(float)a3
{
  if (self->super._isPresentationObject || self->_gainOffset != a3)
  {
    self->_gainOffset = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63EA224;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"gainOffset", v9);
  }
}

- (id)lookupTable
{
  if (!self->super._isPresentationObject) {
    return self->_lookupTable;
  }
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  uint64_t v22 = (id *)sub_1B652B59C(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v22)
  {
    __n128 v30 = sub_1B6583674(v22);
    if (!v13) {
      return v30;
    }
    goto LABEL_9;
  }
  __n128 v30 = 0;
  if (v13) {
LABEL_9:
  }
    sub_1B64B0CB4(v13, v23, v24, v25, v26, v27, v28, v29);
  return v30;
}

- (void)setLookupTable:(id)a3
{
  lookupTable = self->_lookupTable;
  if (lookupTable != a3 || self->super._isPresentationObject)
  {

    self->_lookupTable = (VFXMaterialProperty *)a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B63EA3AC;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, @"liftColor", v3))
  {
    objc_msgSend_liftColor(self, v7, v8, v9);
LABEL_7:
    *uint64_t v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, @"gammaColor", v9))
  {
    objc_msgSend_gammaColor(self, v11, v12, v13);
    goto LABEL_7;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(a3, v11, @"gainColor", v13);
  if (isEqualToString)
  {
    objc_msgSend_gainColor(self, v15, v16, v17);
    goto LABEL_7;
  }
  return isEqualToString;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"liftColor", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_liftColor(self, v6, v7, v8);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, @"gammaColor", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_gammaColor(self, v13, v14, v15);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v13, @"gainColor", v15))
    {
      v20.receiver = self;
      v20.super_class = (Class)VFXCameraEffectColorGrading;
      return [(VFXCameraEffectColorGrading *)&v20 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_gainColor(self, v16, v17, v18);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"liftColor", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setLiftColor_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"gammaColor", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setGammaColor_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"gainColor", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setGainColor_(self, v22, v23, v24);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VFXCameraEffectColorGrading;
    [(VFXCameraEffectColorGrading *)&v25 setValue:a3 forKey:a4];
  }
}

+ (id)colorGrading
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v45.receiver = self;
  v45.super_class = (Class)VFXCameraEffectColorGrading;
  id v4 = [(VFXCameraEffect *)&v45 copyWithZone:a3];
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setSaturation_(v4, v6, v7, v8, v5);
  *(float *)&double v9 = self->_saturation;
  objc_msgSend_setContrast_(v4, v10, v11, v12, v9);
  *(float *)&double v13 = self->_contrast;
  objc_msgSend_setWhiteBalanceTemperature_(v4, v14, v15, v16, v13);
  *(float *)&double v17 = self->_whiteBalanceTemperature;
  objc_msgSend_setWhiteBalanceTint_(v4, v18, v19, v20, v17);
  objc_msgSend_setLiftColor_(v4, v21, v22, v23, *(double *)self->_liftColor);
  *(float *)&double v24 = self->_liftOffset;
  objc_msgSend_setLiftOffset_(v4, v25, v26, v27, v24);
  objc_msgSend_setGammaColor_(v4, v28, v29, v30, *(double *)self->_gammaColor);
  *(float *)&double v31 = self->_gammaOffset;
  objc_msgSend_setGammaOffset_(v4, v32, v33, v34, v31);
  objc_msgSend_setGainColor_(v4, v35, v36, v37, *(double *)self->_gainColor);
  *(float *)&double v38 = self->_gainOffset;
  objc_msgSend_setGainOffset_(v4, v39, v40, v41, v38);
  objc_msgSend_setLookupTable_(v4, v42, (uint64_t)self->_lookupTable, v43);
  return v4;
}

- (void)_syncObjCModel
{
  v73.receiver = self;
  v73.super_class = (Class)VFXCameraEffectColorGrading;
  [(VFXCameraEffect *)&v73 _syncObjCModel];
  *((float *)&self->super._enabled + 1) = sub_1B6529330((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_saturation = sub_1B6529878((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_contrast = sub_1B65299B8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_whiteBalanceTemperature = sub_1B6529CA8((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(__n128 *)self->_liftColor = sub_1B652ADCC((__n128 *)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_liftOffset = sub_1B652AE6C((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  *(__n128 *)self->_gammaColor = sub_1B652B314((__n128 *)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  self->_gammaOffset = sub_1B652B3B4((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
  *(__n128 *)self->_gainColor = sub_1B652B458((__n128 *)self->super._cameraEffect, v59, v60, v61, v62, v63, v64, v65);
  self->_gainOffset = sub_1B652B4F8((uint64_t)self->super._cameraEffect, v66, v67, v68, v69, v70, v71, v72);
}

- (void)encodeWithCoder:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)VFXCameraEffectColorGrading;
  -[VFXCameraEffect encodeWithCoder:](&v28, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"saturation", v7, v5);
  *(float *)&double v8 = self->_saturation;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"contrast", v10, v8);
  *(float *)&double v11 = self->_contrast;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"whiteBalanceTemperature", v13, v11);
  *(float *)&double v14 = self->_whiteBalanceTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"whiteBalanceTint", v16, v14);
  sub_1B64FA2F4(a3, (const char *)@"liftColor", *(__n128 *)self->_liftColor);
  *(float *)&double v17 = self->_liftOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"liftOffset", v19, v17);
  sub_1B64FA2F4(a3, (const char *)@"gammaColor", *(__n128 *)self->_gammaColor);
  *(float *)&double v20 = self->_gammaOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v21, @"gammaOffset", v22, v20);
  sub_1B64FA2F4(a3, (const char *)@"gainColor", *(__n128 *)self->_gainColor);
  *(float *)&double v23 = self->_gainOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v24, @"gainOffset", v25, v23);
  lookupTable = self->_lookupTable;
  if (lookupTable) {
    objc_msgSend_encodeObject_forKey_(a3, v26, (uint64_t)lookupTable, @"lookupTable");
  }
}

- (VFXCameraEffectColorGrading)initWithCoder:(id)a3
{
  v68.receiver = self;
  v68.super_class = (Class)VFXCameraEffectColorGrading;
  uint64_t v7 = -[VFXCameraEffect initWithCoder:](&v68, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"saturation", v12);
    objc_msgSend_setSaturation_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, @"contrast", v17);
    objc_msgSend_setContrast_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, @"whiteBalanceTemperature", v22);
    objc_msgSend_setWhiteBalanceTemperature_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, @"whiteBalanceTint", v27);
    objc_msgSend_setWhiteBalanceTint_(v7, v28, v29, v30);
    double v31 = sub_1B64FA42C(a3, (const char *)@"liftColor");
    objc_msgSend_setLiftColor_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeFloatForKey_(a3, v35, @"liftOffset", v36);
    objc_msgSend_setLiftOffset_(v7, v37, v38, v39);
    double v40 = sub_1B64FA42C(a3, (const char *)@"gammaColor");
    objc_msgSend_setGammaColor_(v7, v41, v42, v43, v40);
    objc_msgSend_decodeFloatForKey_(a3, v44, @"gammaOffset", v45);
    objc_msgSend_setGammaOffset_(v7, v46, v47, v48);
    double v49 = sub_1B64FA42C(a3, (const char *)@"gainColor");
    objc_msgSend_setGainColor_(v7, v50, v51, v52, v49);
    objc_msgSend_decodeFloatForKey_(a3, v53, @"gainOffset", v54);
    objc_msgSend_setGainOffset_(v7, v55, v56, v57);
    if (objc_msgSend_containsValueForKey_(a3, v58, @"lookupTable", v59))
    {
      uint64_t v62 = objc_opt_class();
      id v64 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v63, v62, @"lookupTable");
      objc_msgSend_setLookupTable_(v7, v65, (uint64_t)v64, v66);
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v60, v8, v61);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  if (qword_1EB995310 != -1) {
    dispatch_once(&qword_1EB995310, &unk_1F0FB63E8);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995318, 0xB0uLL);
  *(unsigned char *)(v0 + 64) = 1;
  double result = 0.00781250185;
  *(_OWORD *)(v0 + 72) = xmmword_1B6E4F490;
  *(void *)(v0 + 184) = 0;
  *(void *)(v0 + 96) = 0;
  *(void *)(v0 + 104) = 0;
  *(_DWORD *)(v0 + 112) = 0;
  *(void *)(v0 + 128) = 0;
  *(void *)(v0 + 136) = 0;
  *(_DWORD *)(v0 + 144) = 0;
  *(void *)(v0 + 160) = 0;
  *(void *)(v0 + 168) = 0;
  *(_DWORD *)(v0 + 176) = 0;
  return result;
}

@end