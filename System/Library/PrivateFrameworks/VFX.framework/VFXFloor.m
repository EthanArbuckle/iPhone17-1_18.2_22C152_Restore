@interface VFXFloor
+ (BOOL)supportsSecureCoding;
+ (id)floor;
- (VFXFloor)init;
- (VFXFloor)initWithCoder:(id)a3;
- (VFXFloor)initWithFloorGeometryRef:(__CFXFloor *)a3;
- (float)length;
- (float)reflectionFalloffEnd;
- (float)reflectionFalloffStart;
- (float)reflectionResolutionScaleFactor;
- (float)reflectivity;
- (float)width;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)__createCFObject;
- (unint64_t)reflectionCategoryBitMask;
- (unint64_t)reflectionSampleCount;
- (void)_customDecodingOfVFXFloor:(id)a3;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLength:(float)a3;
- (void)setReflectionCategoryBitMask:(unint64_t)a3;
- (void)setReflectionFalloffEnd:(float)a3;
- (void)setReflectionFalloffStart:(float)a3;
- (void)setReflectionResolutionScaleFactor:(float)a3;
- (void)setReflectionSampleCount:(unint64_t)a3;
- (void)setReflectivity:(float)a3;
- (void)setWidth:(float)a3;
@end

@implementation VFXFloor

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_geometryRef(self, a2, v2, v3);
  self->_reflectivity = sub_1B65195F0(v5, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_geometryRef(self, v13, v14, v15);
  self->_reflectionFalloffStart = sub_1B6519740(v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v27 = objc_msgSend_geometryRef(self, v24, v25, v26);
  self->_reflectionFalloffEnd = sub_1B6519838(v27, v28, v29, v30, v31, v32, v33, v34);
  uint64_t v38 = objc_msgSend_geometryRef(self, v35, v36, v37);
  self->_reflectionResolutionScaleFactor = sub_1B6519930(v38, v39, v40, v41, v42, v43, v44, v45);
  uint64_t v49 = objc_msgSend_geometryRef(self, v46, v47, v48);
  self->_reflectionCategoryBitMask = sub_1B6519AFC(v49);
  v50.receiver = self;
  v50.super_class = (Class)VFXFloor;
  [(VFXModel *)&v50 _syncObjCModel];
}

- (VFXFloor)init
{
  uint64_t v3 = (const void *)-[VFXFloor __createCFObject]_0();
  v6.receiver = self;
  v6.super_class = (Class)VFXFloor;
  v4 = [(VFXModel *)&v6 initWithGeometryRef:v3];
  CFRelease(v3);
  return v4;
}

- (VFXFloor)initWithFloorGeometryRef:(__CFXFloor *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXFloor;
  uint64_t v3 = [(VFXModel *)&v9 initWithGeometryRef:a3];
  uint64_t v7 = v3;
  if (v3) {
    objc_msgSend__syncObjCModel(v3, v4, v5, v6);
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VFXFloor;
  [(VFXModel *)&v2 dealloc];
}

+ (id)floor
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (void)setReflectionResolutionScaleFactor:(float)a3
{
  if (self->_reflectionResolutionScaleFactor != a3)
  {
    self->_reflectionResolutionScaleFactor = a3;
    if (a3 == 0.0) {
      float v6 = 0.5;
    }
    else {
      float v6 = a3;
    }
    *((unsigned char *)self + 176) = *((unsigned char *)self + 176) & 0xFD | (2 * (a3 != 0.0));
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6518308;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setReflectionCategoryBitMask:(unint64_t)a3
{
  if (self->_reflectionCategoryBitMask != a3)
  {
    self->_reflectionCategoryBitMask = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B65183F8;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)reflectionCategoryBitMask
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectionCategoryBitMask;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  unint64_t v5 = sub_1B6519AFC(v15);
  if (v14) {
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
  }
  return v5;
}

- (void)setWidth:(float)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6518574;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"width", v9);
  }
}

- (float)width
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_width;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B6519ADC(v15);
  if (v14) {
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
  }
  return v5;
}

- (void)setLength:(float)a3
{
  if (self->_length != a3)
  {
    self->_length = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B65186F8;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"length", v9);
  }
}

- (float)length
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_length;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B6519AEC(v15);
  if (v14) {
    sub_1B64B0CB4(v14, v16, v17, v18, v19, v20, v21, v22);
  }
  return v5;
}

- (float)reflectionFalloffEnd
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectionFalloffEnd;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B6519838(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setReflectionFalloffEnd:(float)a3
{
  if (self->_reflectionFalloffEnd != a3)
  {
    self->_reflectionFalloffEnd = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B65188F4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"reflectionFalloffEnd", v9);
  }
}

- (float)reflectionFalloffStart
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectionFalloffStart;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B6519740(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setReflectionFalloffStart:(float)a3
{
  if (self->_reflectionFalloffStart != a3)
  {
    self->_reflectionFalloffStart = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6518A70;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"reflectionFalloffStart", v9);
  }
}

- (float)reflectionResolutionScaleFactor
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectionResolutionScaleFactor;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B6519930(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (unint64_t)reflectionSampleCount
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectionSampleCount;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  unint64_t v5 = (int)sub_1B6519A10(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setReflectionSampleCount:(unint64_t)a3
{
  if (self->_reflectionSampleCount != a3)
  {
    self->_reflectionSampleCount = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6518C58;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)reflectivity
{
  if ((*((unsigned char *)self + 176) & 1) == 0) {
    return self->_reflectivity;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  float v5 = sub_1B65195F0(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setReflectivity:(float)a3
{
  if (self->_reflectivity != a3)
  {
    self->_reflectivity = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6518DD4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"reflectivity", v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  objc_msgSend__setupObjCModelFrom_(v4, v10, (uint64_t)self, v11);
  objc_msgSend_reflectivity(self, v12, v13, v14);
  objc_msgSend_setReflectivity_(v4, v15, v16, v17);
  objc_msgSend_reflectionFalloffEnd(self, v18, v19, v20);
  objc_msgSend_setReflectionFalloffEnd_(v4, v21, v22, v23);
  objc_msgSend_reflectionFalloffStart(self, v24, v25, v26);
  objc_msgSend_setReflectionFalloffStart_(v4, v27, v28, v29);
  objc_msgSend_reflectionResolutionScaleFactor(self, v30, v31, v32);
  objc_msgSend_setReflectionResolutionScaleFactor_(v4, v33, v34, v35);
  uint64_t v39 = objc_msgSend_reflectionSampleCount(self, v36, v37, v38);
  objc_msgSend_setReflectionSampleCount_(v4, v40, v39, v41);
  uint64_t v45 = objc_msgSend_reflectionCategoryBitMask(self, v42, v43, v44);
  objc_msgSend_setReflectionCategoryBitMask_(v4, v46, v45, v47);
  objc_msgSend_width(self, v48, v49, v50);
  objc_msgSend_setWidth_(v4, v51, v52, v53);
  objc_msgSend_length(self, v54, v55, v56);
  objc_msgSend_setLength_(v4, v57, v58, v59);
  objc_msgSend__copyAnimationsFrom_(v4, v60, (uint64_t)self, v61);
  objc_msgSend_commitImmediate(VFXTransaction, v62, v63, v64);
  return v4;
}

- (void)_customDecodingOfVFXFloor:(id)a3
{
  uint64_t v5 = objc_msgSend_geometryRef(self, a2, (uint64_t)a3, v3);
  self->_reflectivity = sub_1B65195F0(v5, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_geometryRef(self, v13, v14, v15);
  self->_reflectionCategoryBitMask = sub_1B6519AFC(v16);
}

- (void)encodeWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VFXFloor;
  -[VFXModel encodeWithCoder:](&v24, sel_encodeWithCoder_);
  *(float *)&double v5 = self->_reflectivity;
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"reflectivity", v7, v5);
  *(float *)&double v8 = self->_reflectionFalloffStart;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"reflectionFalloffStart", v10, v8);
  *(float *)&double v11 = self->_reflectionFalloffEnd;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"reflectionFalloffEnd", v13, v11);
  *(float *)&double v14 = self->_width;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"width", v16, v14);
  *(float *)&double v17 = self->_length;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"length", v19, v17);
  objc_msgSend_encodeInteger_forKey_(a3, v20, self->_reflectionCategoryBitMask, @"reflectionCategoryBitMask");
  if ((*((unsigned char *)self + 176) & 2) != 0)
  {
    *(float *)&double v23 = self->_reflectionResolutionScaleFactor;
    objc_msgSend_encodeFloat_forKey_(a3, v21, @"reflectionResolutionScaleFactor", v22, v23);
  }
}

- (VFXFloor)initWithCoder:(id)a3
{
  v50.receiver = self;
  v50.super_class = (Class)VFXFloor;
  uint64_t v7 = -[VFXModel initWithCoder:](&v50, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXFloor_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, @"reflectivity", v14);
    objc_msgSend_setReflectivity_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"reflectionFalloffStart", v19);
    objc_msgSend_setReflectionFalloffStart_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, @"reflectionFalloffEnd", v24);
    objc_msgSend_setReflectionFalloffEnd_(v7, v25, v26, v27);
    objc_msgSend_decodeFloatForKey_(a3, v28, @"width", v29);
    objc_msgSend_setWidth_(v7, v30, v31, v32);
    objc_msgSend_decodeFloatForKey_(a3, v33, @"length", v34);
    objc_msgSend_setLength_(v7, v35, v36, v37);
    if (objc_msgSend_containsValueForKey_(a3, v38, @"reflectionCategoryBitMask", v39))
    {
      uint64_t v42 = objc_msgSend_decodeIntegerForKey_(a3, v40, @"reflectionCategoryBitMask", v41);
      objc_msgSend_setReflectionCategoryBitMask_(v7, v43, v42, v44);
    }
    if (objc_msgSend_containsValueForKey_(a3, v40, @"reflectionResolutionScaleFactor", v41))
    {
      objc_msgSend_decodeFloatForKey_(a3, v45, @"reflectionResolutionScaleFactor", v46);
      if (v48 != 0.0)
      {
        objc_msgSend_setReflectionResolutionScaleFactor_(v7, v45, v47, v46);
        *((unsigned char *)v7 + 176) |= 2u;
      }
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v45, v8, v46);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  if (qword_1EB995488 != -1) {
    dispatch_once(&qword_1EB995488, &unk_1F0FB5BA8);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995490, 0xE8uLL);
  sub_1B63CDA84(v0);
  *(_DWORD *)(v0 + 220) = 1065353216;
  *(void *)(v0 + 240) = -1;
  v1 = (const void *)sub_1B6549D0C(0, 10, 10, 0, 2.0, -2.0, 0.0);
  sub_1B63CDBD0(v0, (uint64_t)v1, v2, v3, v4, v5, v6, v7);
  CFRelease(v1);
  uint64_t v8 = (void *)sub_1B64AED1C();
  sub_1B64AF354((uint64_t)v8, 1, v9, v10, v11, v12, v13, v14);
  uint64_t v22 = sub_1B64AF43C((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
  sub_1B6476AD4(v22, 1, v23, v24, v25, v26, v27, v28);
  sub_1B643DB9C(2, 2, 2, 2, 2, 2);
  uint64_t v35 = v34;
  int v36 = 0;
  do
  {
    sub_1B63DAAA4((uint64_t)v8, (char)v36, v35, v29, v30, v31, v32, v33, v52);
    unsigned int v37 = v36++;
  }
  while (v37 < 0x10);
  CFRelease(v35);
  sub_1B63CE298(v0, v8, v38, v39, v40, v41, v42, v43);
  CFRelease(v8);
  sub_1B6519694(v0, v44, v45, v46, v47, v48, v49, v50, 0.25);
  return v0;
}

@end