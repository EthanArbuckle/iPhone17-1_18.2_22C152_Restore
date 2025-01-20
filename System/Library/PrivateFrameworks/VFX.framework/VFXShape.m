@interface VFXShape
+ (BOOL)supportsSecureCoding;
+ (id)shapeWithPath:(id)a3 extrusionDepth:(float)a4;
- ($C2D7B96093337A7412AA75FC240FE189)params;
- (BOOL)getBoundingBoxMin:(VFXShape *)self max:(SEL)a2;
- (BOOL)getBoundingSphereCenter:(VFXShape *)self radius:(SEL)a2;
- (UIBezierPath)chamferProfile;
- (UIBezierPath)path;
- (VFXShape)init;
- (VFXShape)initWithCoder:(id)a3;
- (VFXShape)initWithShapeGeometryRef:(__CFXShapeGeometry *)a3;
- (float)chamferRadius;
- (float)discretizedStraightLineMaxLength;
- (float)extrusionDepth;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__CFXShapeGeometry *)a3;
- (id)presentationModel;
- (int64_t)chamferMode;
- (int64_t)primitiveType;
- (uint64_t)__createCFObject;
- (void)_customDecodingOfVFXShape:(id)a3;
- (void)_customEncodingOfVFXShape:(id)a3;
- (void)_syncObjCModel:(__CFXShapeGeometry *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChamferMode:(int64_t)a3;
- (void)setChamferProfile:(id)a3;
- (void)setChamferRadius:(float)a3;
- (void)setDiscretizedStraightLineMaxLength:(float)a3;
- (void)setExtrusionDepth:(float)a3;
- (void)setPath:(id)a3;
- (void)setPrimitiveType:(int64_t)a3;
@end

@implementation VFXShape

- (void)_syncObjCModel:(__CFXShapeGeometry *)a3
{
  self->_primitiveType = (int)sub_1B662A384((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  self->_chamferRadius = sub_1B662A0F0((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  self->_extrusionDepth = sub_1B662A2A8((uint64_t)a3, v17, v18, v19, v20, v21, v22, v23);
  self->_chamferProfile = (UIBezierPath *)(id)sub_1B662A454((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = sub_1B662A1CC((uint64_t)a3, v24, v25, v26, v27, v28, v29, v30);
  self->_path = (UIBezierPath *)(id)sub_1B6519AFC((uint64_t)a3);
  self->_chamferMode = (int)sub_1B662A020((uint64_t)a3, v31, v32, v33, v34, v35, v36, v37);
}

- (VFXShape)init
{
  uint64_t v3 = (const void *)-[VFXShape __createCFObject]_0();
  v14.receiver = self;
  v14.super_class = (Class)VFXShape;
  uint64_t v4 = [(VFXModel *)&v14 initWithGeometryRef:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    v13.receiver = v4;
    v13.super_class = (Class)VFXShape;
    [(VFXModel *)&v13 _syncObjCModel];
    uint64_t v9 = objc_msgSend_geometryRef(v5, v6, v7, v8);
    objc_msgSend__syncObjCModel_(v5, v10, v9, v11);
  }
  CFRelease(v3);
  return v5;
}

- (VFXShape)initWithShapeGeometryRef:(__CFXShapeGeometry *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VFXShape;
  uint64_t v3 = [(VFXModel *)&v13 initWithGeometryRef:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v12.receiver = v3;
    v12.super_class = (Class)VFXShape;
    [(VFXModel *)&v12 _syncObjCModel];
    uint64_t v8 = objc_msgSend_geometryRef(v4, v5, v6, v7);
    objc_msgSend__syncObjCModel_(v4, v9, v8, v10);
  }
  return v4;
}

- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__CFXShapeGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VFXShape;
  return [(VFXModel *)&v4 initPresentationModelWithGeometryRef:a3];
}

- (id)presentationModel
{
  uint64_t v3 = [VFXShape alloc];
  uint64_t v7 = objc_msgSend_geometryRef(self, v4, v5, v6);
  inited = objc_msgSend_initPresentationShapeGeometryWithShapeGeometryRef_(v3, v8, v7, v9);

  return inited;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

+ (id)shapeWithPath:(id)a3 extrusionDepth:(float)a4
{
  id v6 = objc_alloc_init((Class)a1);
  *(float *)&double v7 = a4;
  objc_msgSend_setExtrusionDepth_(v6, v8, v9, v10, v7);
  objc_msgSend_setPath_(v6, v11, (uint64_t)a3, v12);
  return v6;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_modelDescription(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_path(self, v7, v8, v9);
  objc_msgSend_extrusionDepth(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, @"<%@ | path=%@ extrusionDepth=%.3f> ", v16, v6, v10, v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend_path(self, a2, (uint64_t)a3, v3);
  objc_msgSend_extrusionDepth(self, v6, v7, v8);
  id v32 = (id)objc_msgSend_shapeWithPath_extrusionDepth_(VFXShape, v9, v5, v10);
  uint64_t v14 = objc_msgSend_chamferMode(self, v11, v12, v13);
  objc_msgSend_setChamferMode_(v32, v15, v14, v16);
  objc_msgSend_chamferRadius(self, v17, v18, v19);
  objc_msgSend_setChamferRadius_(v32, v20, v21, v22);
  uint64_t v26 = objc_msgSend_chamferProfile(self, v23, v24, v25);
  objc_msgSend_setChamferProfile_(v32, v27, v26, v28);
  objc_msgSend__setupObjCModelFrom_(v32, v29, (uint64_t)self, v30);

  return v32;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (int64_t)chamferMode
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_chamferMode;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B662A020(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setChamferMode:(int64_t)a3
{
  if (self->_chamferMode != a3)
  {
    self->_chamferMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B66282CC;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)chamferRadius
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_chamferRadius;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B662A0F0(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setChamferRadius:(float)a3
{
  if (self->_chamferRadius != a3)
  {
    self->_chamferRadius = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6628440;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"chamferRadius", v9);
  }
}

- (float)discretizedStraightLineMaxLength
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_discretizedStraightLineMaxLength;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B662A1CC(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setDiscretizedStraightLineMaxLength:(float)a3
{
  if (self->_discretizedStraightLineMaxLength != a3)
  {
    self->_discretizedStraightLineMaxLength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B66285AC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (float)extrusionDepth
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_extrusionDepth;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B662A2A8(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setExtrusionDepth:(float)a3
{
  if (self->_extrusionDepth != a3)
  {
    self->_extrusionDepth = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6628720;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"extrusionDepth", v9);
  }
}

- (int64_t)primitiveType
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_primitiveType;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B662A384(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setPrimitiveType:(int64_t)a3
{
  if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6628880;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (UIBezierPath)path
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v16 = v8;
    if (v8) {
      sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    path = (void *)sub_1B6519AFC(v17);
    if (v16) {
      sub_1B64B0CB4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
    }
  }
  else
  {
    path = self->_path;
  }
  uint64_t v23 = objc_msgSend_copy(path, v5, v6, v7);

  return (UIBezierPath *)v23;
}

- (void)setPath:(id)a3
{
  self->_path = (UIBezierPath *)objc_msgSend_copy(a3, v5, v6, v7);
  uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B66289FC;
  v13[3] = &unk_1E61411E0;
  v13[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (UIBezierPath)chamferProfile
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v16 = v8;
    if (v8) {
      sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    chamferProfile = (void *)sub_1B662A454(v17);
    if (v16) {
      sub_1B64B0CB4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
    }
  }
  else
  {
    chamferProfile = self->_chamferProfile;
  }
  uint64_t v23 = objc_msgSend_copy(chamferProfile, v5, v6, v7);

  return (UIBezierPath *)v23;
}

- (void)setChamferProfile:(id)a3
{
  self->_chamferProfile = (UIBezierPath *)objc_msgSend_copy(a3, v5, v6, v7);
  uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B6628B84;
  v13[3] = &unk_1E61411E0;
  v13[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- ($C2D7B96093337A7412AA75FC240FE189)params
{
  retstr->var6 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  result = ($C2D7B96093337A7412AA75FC240FE189 *)objc_msgSend_isPresentationObject(self, a3, v3, v4);
  if (result)
  {
    uint64_t v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    sub_1B6629A6C(v11, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
    long long v18 = v23[1];
    *(_OWORD *)&retstr->var0 = v23[0];
    *(_OWORD *)&retstr->var4 = v18;
    retstr->var6 = v24;
  }
  else
  {
    retstr->var0 = self->_primitiveType;
    float chamferRadius = self->_chamferRadius;
    retstr->var1 = self->_extrusionDepth;
    retstr->var2 = chamferRadius;
    float discretizedStraightLineMaxLength = self->_discretizedStraightLineMaxLength;
    retstr->var3 = self->_chamferMode;
    path = self->_path;
    chamferProfile = self->_chamferProfile;
    retstr->var4 = discretizedStraightLineMaxLength;
    retstr->var5 = path;
    retstr->var6 = chamferProfile;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(VFXShape *)self max:(SEL)a2
{
  uint64_t v4 = (_OWORD *)v3;
  uint64_t v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  DWORD2(v36) = 0;
  *(void *)&long long v36 = 0;
  DWORD2(v35) = 0;
  *(void *)&long long v35 = 0;
  uint64_t v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
  {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else
  {
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
  }
  int v31 = sub_1B662B20C(v23, &v36, &v35, (uint64_t)v33, v19, v20, v21, v22);
  if (v31)
  {
    if (v5) {
      *uint64_t v5 = v36;
    }
    if (v4) {
      *uint64_t v4 = v35;
    }
  }
  if (v15) {
    sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
  }
  return v31;
}

- (BOOL)getBoundingSphereCenter:(VFXShape *)self radius:(SEL)a2
{
  uint64_t v4 = (_DWORD *)v3;
  uint64_t v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  long long v35 = 0uLL;
  uint64_t v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
  {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else
  {
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
  }
  int v31 = sub_1B662B268(v23, &v35, (uint64_t)v33, v18, v19, v20, v21, v22);
  if (v31)
  {
    if (v5) {
      *uint64_t v5 = v35;
    }
    if (v4) {
      *uint64_t v4 = HIDWORD(v35);
    }
  }
  if (v15) {
    sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
  }
  return v31;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXShape;
  [(VFXModel *)&v3 dealloc];
}

- (void)_customDecodingOfVFXShape:(id)a3
{
  uint64_t v5 = sub_1B64FAA08(a3, @"chamferProfile");
  objc_msgSend_setChamferProfile_(self, v6, (uint64_t)v5, v7);
  uint64_t v9 = sub_1B64FAA08(a3, @"path");

  objc_msgSend_setPath_(self, v8, (uint64_t)v9, v10);
}

- (void)_customEncodingOfVFXShape:(id)a3
{
  sub_1B64FA904(a3, self->_chamferProfile, @"chamferProfile", v3);
  path = self->_path;

  sub_1B64FA904(a3, path, @"path", v6);
}

- (void)encodeWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)VFXShape;
  -[VFXModel encodeWithCoder:](&v25, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend__customEncodingOfVFXShape_(self, v8, (uint64_t)a3, v10);
  *(float *)&double v14 = self->_chamferRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"chamferRadius", v16, v14);
  *(float *)&double v17 = self->_extrusionDepth;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"extrusionDepth", v19, v17);
  *(float *)&double v20 = self->_discretizedStraightLineMaxLength;
  objc_msgSend_encodeFloat_forKey_(a3, v21, @"discretizedStraightLineMaxLength", v22, v20);
  objc_msgSend_encodeInteger_forKey_(a3, v23, self->_primitiveType, @"primitiveType");
  objc_msgSend_encodeInteger_forKey_(a3, v24, self->_chamferMode, @"chamferMode");
}

- (VFXShape)initWithCoder:(id)a3
{
  v41.receiver = self;
  v41.super_class = (Class)VFXShape;
  uint64_t v7 = -[VFXModel initWithCoder:](&v41, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXShape_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, @"chamferRadius", v14);
    objc_msgSend_setChamferRadius_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"extrusionDepth", v19);
    objc_msgSend_setExtrusionDepth_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, @"discretizedStraightLineMaxLength", v24);
    objc_msgSend_setDiscretizedStraightLineMaxLength_(v7, v25, v26, v27);
    uint64_t v30 = objc_msgSend_decodeIntegerForKey_(a3, v28, @"primitiveType", v29);
    objc_msgSend_setPrimitiveType_(v7, v31, v30, v32);
    uint64_t v35 = objc_msgSend_decodeIntegerForKey_(a3, v33, @"chamferMode", v34);
    objc_msgSend_setChamferMode_(v7, v36, v35, v37);
    objc_msgSend_setImmediateMode_(VFXTransaction, v38, v8, v39);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  if (qword_1EB995660 != -1) {
    dispatch_once(&qword_1EB995660, &unk_1F0FB6088);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995668, 0x120uLL);
  sub_1B662ACF0(v0);
  return v0;
}

@end