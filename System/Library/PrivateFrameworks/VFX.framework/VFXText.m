@interface VFXText
+ (BOOL)supportsSecureCoding;
+ (id)text;
+ (id)textWithString:(id)a3 extrusionDepth:(float)a4;
- ($2665043C3412C69D6F3E8E948F5DACCA)params;
- (BOOL)_wantsSeparateGeometryElements;
- (BOOL)getBoundingBoxMin:(VFXText *)self max:(SEL)a2;
- (BOOL)getBoundingSphereCenter:(VFXText *)self radius:(SEL)a2;
- (BOOL)isWrapped;
- (CGRect)containerFrame;
- (NSString)alignmentMode;
- (NSString)truncationMode;
- (UIBezierPath)chamferProfile;
- (UIFont)font;
- (VFXText)init;
- (VFXText)initWithCoder:(id)a3;
- (VFXText)initWithTextGeometryRef:(__CFXTextGeometry *)a3;
- (float)chamferRadius;
- (float)discretizedStraightLineMaxLength;
- (float)extrusionDepth;
- (float)flatness;
- (id)copy;
- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationTextGeometryWithTextGeometryRef:(__CFXTextGeometry *)a3;
- (id)patchFont:(id)a3;
- (id)presentationModel;
- (id)string;
- (int64_t)primitiveType;
- (uint64_t)__createCFObject;
- (void)_customDecodingOfVFXText:(id)a3;
- (void)_customEncodingOfVFXText:(id)a3;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__CFXTextGeometry *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignmentMode:(id)a3;
- (void)setChamferProfile:(id)a3;
- (void)setChamferRadius:(float)a3;
- (void)setContainerFrame:(CGRect)a3;
- (void)setDiscretizedStraightLineMaxLength:(float)a3;
- (void)setExtrusionDepth:(float)a3;
- (void)setFlatness:(float)a3;
- (void)setFont:(id)a3;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setString:(id)a3;
- (void)setTruncationMode:(id)a3;
- (void)setWrapped:(BOOL)a3;
- (void)set_wantsSeparateGeometryElements:(BOOL)a3;
@end

@implementation VFXText

- (void)_syncObjCModel:(__CFXTextGeometry *)a3
{
  v42.receiver = self;
  v42.super_class = (Class)VFXText;
  [(VFXModel *)&v42 _syncObjCModel];
  self->_primitiveType = (int)sub_1B662A384((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
  self->_flatness = sub_1B662A5E8((uint64_t)a3);
  self->_chamferRadius = sub_1B662A0F0((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  self->_extrusionDepth = sub_1B662A2A8((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
  self->_chamferProfile = (UIBezierPath *)sub_1B662A454((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = sub_1B662A1CC((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
  self->_alignmentMode = sub_1B662A62C((uint64_t)a3);
  self->_truncationMode = sub_1B662A634((uint64_t)a3);
  self->_string = (id)sub_1B662A61C((uint64_t)a3);
  uint64_t v33 = sub_1B662A624((uint64_t)a3);
  self->_font = (UIFont *)objc_msgSend_patchFont_(self, v34, v33, v35);
  self->_useCustomContainerFrame = sub_1B662A00C((uint64_t)a3);
  self->_customContainerFrame.origin.x = sub_1B662A014((uint64_t)a3);
  self->_customContainerFrame.origin.y = v36;
  self->_customContainerFrame.size.width = v37;
  self->_customContainerFrame.size.height = v38;
  self->_wrapped = sub_1B662A63C((uint64_t)a3);
  self->__wantsSeparateGeometryElements = sub_1B662AA78((uint64_t)a3);
  v39 = self->_font;
  id v40 = self->_string;
  v41 = self->_chamferProfile;
}

- (VFXText)init
{
  v3 = (const void *)-[VFXText __createCFObject]_0();
  v13.receiver = self;
  v13.super_class = (Class)VFXText;
  v4 = [(VFXModel *)&v13 initWithGeometryRef:v3];
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_geometryRef(v4, v5, v6, v7);
    objc_msgSend__syncObjCModel_(v8, v10, v9, v11);
  }
  CFRelease(v3);
  return v8;
}

- (VFXText)initWithTextGeometryRef:(__CFXTextGeometry *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXText;
  v3 = [(VFXModel *)&v12 initWithGeometryRef:a3];
  uint64_t v7 = v3;
  if (v3)
  {
    uint64_t v8 = objc_msgSend_geometryRef(v3, v4, v5, v6);
    objc_msgSend__syncObjCModel_(v7, v9, v8, v10);
  }
  return v7;
}

- (id)initPresentationTextGeometryWithTextGeometryRef:(__CFXTextGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VFXText;
  return [(VFXModel *)&v4 initPresentationModelWithGeometryRef:a3];
}

- (id)presentationModel
{
  v3 = [VFXText alloc];
  uint64_t v7 = objc_msgSend_geometryRef(self, v4, v5, v6);
  inited = objc_msgSend_initPresentationTextGeometryWithTextGeometryRef_(v3, v8, v7, v9);

  return inited;
}

- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

+ (id)text
{
  return (id)objc_msgSend_textWithString_extrusionDepth_(a1, a2, 0, v2, 0.0);
}

+ (id)textWithString:(id)a3 extrusionDepth:(float)a4
{
  id v6 = objc_alloc_init((Class)a1);
  *(float *)&double v7 = a4;
  objc_msgSend_setExtrusionDepth_(v6, v8, v9, v10, v7);
  objc_msgSend_setString_(v6, v11, (uint64_t)a3, v12);
  return v6;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_modelDescription(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_string(self, v7, v8, v9);
  objc_msgSend_extrusionDepth(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, @"<%@ | string=%@ extrusionDepth=%.3f> ", v16, v6, v10, v14);
}

- (void)_setupObjCModelFrom:(id)a3
{
  v62.receiver = self;
  v62.super_class = (Class)VFXText;
  -[VFXModel _setupObjCModelFrom:](&v62, sel__setupObjCModelFrom_);
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  uint64_t v13 = objc_msgSend_font(a3, v10, v11, v12);
  objc_msgSend_setFont_(self, v14, v13, v15);
  objc_msgSend_containerFrame(a3, v16, v17, v18);
  if (v22 != 0.0)
  {
    objc_msgSend_containerFrame(a3, v19, v20, v21);
    objc_msgSend_setContainerFrame_(self, v23, v24, v25);
  }
  uint64_t v26 = objc_msgSend_truncationMode(a3, v19, v20, v21);
  objc_msgSend_setTruncationMode_(self, v27, v26, v28);
  uint64_t v32 = objc_msgSend_alignmentMode(a3, v29, v30, v31);
  objc_msgSend_setAlignmentMode_(self, v33, v32, v34);
  objc_msgSend_flatness(a3, v35, v36, v37);
  objc_msgSend_setFlatness_(self, v38, v39, v40);
  uint64_t isWrapped = objc_msgSend_isWrapped(a3, v41, v42, v43);
  objc_msgSend_setWrapped_(self, v45, isWrapped, v46);
  objc_msgSend_chamferRadius(a3, v47, v48, v49);
  objc_msgSend_setChamferRadius_(self, v50, v51, v52);
  uint64_t v56 = objc_msgSend_chamferProfile(a3, v53, v54, v55);
  objc_msgSend_setChamferProfile_(self, v57, v56, v58);
  objc_msgSend_commitImmediate(VFXTransaction, v59, v60, v61);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend_string(self, a2, (uint64_t)a3, v3);
  objc_msgSend_extrusionDepth(self, v6, v7, v8);
  id v16 = (id)objc_msgSend_textWithString_extrusionDepth_(VFXText, v9, v5, v10);
  objc_msgSend__setupObjCModelFrom_(v16, v11, (uint64_t)self, v12);
  objc_msgSend__copyAttributesTo_(self, v13, (uint64_t)v16, v14);

  return v16;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (BOOL)_wantsSeparateGeometryElements
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->__wantsSeparateGeometryElements;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  char v25 = sub_1B662AA78(v17);
  if (v16) {
    sub_1B64B0CB4(v16, v18, v19, v20, v21, v22, v23, v24);
  }
  return v25;
}

- (void)set_wantsSeparateGeometryElements:(BOOL)a3
{
  if (self->__wantsSeparateGeometryElements != a3)
  {
    self->__wantsSeparateGeometryElements = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6621F4C;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
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
  float v5 = fmaxf(a3, 0.0);
  if (v5 != self->_chamferRadius)
  {
    self->_chamferRadius = v5;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B66220C4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v5;
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
  float v5 = fmaxf(a3, 0.0);
  if (v5 != self->_discretizedStraightLineMaxLength)
  {
    self->_discretizedStraightLineMaxLength = v5;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6622234;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v5;
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
  float v5 = fmaxf(a3, 0.0);
  if (v5 != self->_extrusionDepth)
  {
    self->_extrusionDepth = v5;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B66223AC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"extrusionDepth", v9);
  }
}

- (float)flatness
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_flatness;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v25 = sub_1B662A5E8(v17);
  if (v16) {
    sub_1B64B0CB4(v16, v18, v19, v20, v21, v22, v23, v24);
  }
  return v25;
}

- (void)setFlatness:(float)a3
{
  if (self->_flatness != a3)
  {
    self->_flatness = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B6622518;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
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
    v8[2] = sub_1B6622678;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)string
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v16 = v8;
    if (v8) {
      sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    string = (void *)sub_1B662A61C(v17);
    if (v16) {
      sub_1B64B0CB4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
    }
  }
  else
  {
    string = self->_string;
  }
  uint64_t v23 = objc_msgSend_copy(string, v5, v6, v7);

  return v23;
}

- (void)setString:(id)a3
{
  id string = self->_string;
  if (string != a3)
  {

    self->_id string = (id)objc_msgSend_copy(a3, v6, v7, v8);
    uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B66227FC;
    v14[3] = &unk_1E61411E0;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)isWrapped
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_wrapped;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  char v25 = sub_1B662A63C(v17);
  if (v16) {
    sub_1B64B0CB4(v16, v18, v19, v20, v21, v22, v23, v24);
  }
  return v25;
}

- (void)setWrapped:(BOOL)a3
{
  if (self->_wrapped != a3)
  {
    self->_wrapped = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6622974;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)patchFont:(id)a3
{
  uint64_t v4 = a3;
  if (!a3) {
    return v4;
  }
  float v5 = objc_msgSend_fontName(a3, a2, (uint64_t)a3, v3);
  if (objc_msgSend_hasPrefix_(v5, v6, @".SFUI", v7))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1798];
    objc_msgSend_pointSize(v4, v8, v9, v10);
    uint64_t v4 = objc_msgSend_fontWithName_size_(v11, v12, @"HelveticaNeue", v13);
    if (!v4) {
      return v4;
    }
  }
  uint64_t v14 = objc_msgSend_fontName(v4, v8, v9, v10);
  if (!objc_msgSend_hasPrefix_(v14, v15, @".SFNS", v16)) {
    return v4;
  }
  uint64_t v20 = (void *)MEMORY[0x1E4FB1798];
  objc_msgSend_pointSize(v4, v17, v18, v19);

  return (id)objc_msgSend_fontWithName_size_(v20, v21, @"HelveticaNeue", v22);
}

- (UIFont)font
{
  uint64_t isPresentationObject = objc_msgSend_isPresentationObject(self, a2, v2, v3);
  if (isPresentationObject)
  {
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    uint64_t v17 = v9;
    if (v9) {
      sub_1B64B0C28(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v18 = objc_msgSend_geometryRef(self, v10, v11, v12);
    uint64_t isPresentationObject = sub_1B662A624(v18);
    font = (UIFont *)isPresentationObject;
    if (v17) {
      uint64_t isPresentationObject = sub_1B64B0CB4(v17, (uint64_t)v6, v7, v8, v19, v20, v21, v22);
    }
    if (font) {
      return font;
    }
  }
  else
  {
    font = self->_font;
    if (font) {
      return font;
    }
  }

  return (UIFont *)sub_1B662AA60(isPresentationObject, v6, v7, v8);
}

- (void)setFont:(id)a3
{
  if (self->_font != a3)
  {
    float v5 = objc_msgSend_patchFont_(self, a2, (uint64_t)a3, v3);

    self->_font = (UIFont *)v5;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B6622BC0;
    v11[3] = &unk_1E6141230;
    v11[4] = self;
    v11[5] = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (CGRect)containerFrame
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    if (self->_useCustomContainerFrame)
    {
      p_customContainerFrame = &self->_customContainerFrame;
LABEL_11:
      double x = p_customContainerFrame->origin.x;
      CGFloat y = p_customContainerFrame->origin.y;
      CGFloat width = p_customContainerFrame->size.width;
      CGFloat height = p_customContainerFrame->size.height;
      goto LABEL_12;
    }
LABEL_10:
    p_customContainerFrame = (CGRect *)MEMORY[0x1E4F1DB28];
    goto LABEL_11;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  char v18 = sub_1B662A00C(v17);
  uint64_t v22 = objc_msgSend_geometryRef(self, v19, v20, v21);
  double x = sub_1B662A014(v22);
  CGFloat y = v31;
  CGFloat width = v33;
  CGFloat height = v35;
  if (v16) {
    sub_1B64B0CB4(v16, v23, v24, v25, v26, v27, v28, v29);
  }
  if ((v18 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_12:
  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.double x = v38;
  return result;
}

- (void)setContainerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!self->_useCustomContainerFrame || !CGRectEqualToRect(self->_customContainerFrame, a3))
  {
    self->_useCustomContainerFrame = 1;
    self->_customContainerFrame.origin.CGFloat x = x;
    self->_customContainerFrame.origin.CGFloat y = y;
    self->_customContainerFrame.size.CGFloat width = width;
    self->_customContainerFrame.size.CGFloat height = height;
    uint64_t v10 = objc_msgSend_worldRef(self, a2, v3, v4);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B6622DE0;
    v12[3] = &unk_1E61411E0;
    v12[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (NSString)truncationMode
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v12 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v20 = v12;
    if (v12) {
      sub_1B64B0C28(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v21 = objc_msgSend_geometryRef(self, v13, v14, v15);
    int truncationMode = sub_1B662A634(v21);
    if (v20) {
      sub_1B64B0CB4(v20, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    int truncationMode = self->_truncationMode;
  }

  return (NSString *)sub_1B6622EC0(truncationMode, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
}

- (void)setTruncationMode:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E4F3A5E8], v3)) {
    goto LABEL_2;
  }
  if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F3A5F0], v8))
  {
    int v9 = 1;
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F3A5D8], v8))
  {
    int v9 = 2;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F3A5E0], v8) & 1) == 0)
    {
      sub_1B63F2F54(0, @"Warning: Unknown truncation mode %@", v7, v8, v10, v11, v12, v13, (uint64_t)a3);
LABEL_2:
      int v9 = 0;
      goto LABEL_9;
    }
    int v9 = 3;
  }
LABEL_9:
  if (self->_truncationMode != v9)
  {
    self->_int truncationMode = v9;
    uint64_t v14 = objc_msgSend_worldRef(self, v6, v7, v8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B66230A8;
    v16[3] = &unk_1E6141208;
    v16[4] = self;
    int v17 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (NSString)alignmentMode
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v12 = objc_msgSend_worldRef(self, v5, v6, v7);
    uint64_t v20 = v12;
    if (v12) {
      sub_1B64B0C28(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v21 = objc_msgSend_geometryRef(self, v13, v14, v15);
    int alignmentMode = sub_1B662A62C(v21);
    if (v20) {
      sub_1B64B0CB4(v20, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    int alignmentMode = self->_alignmentMode;
  }

  return (NSString *)sub_1B6623164(alignmentMode, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
}

- (void)setAlignmentMode:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E4F39D50], v3)) {
    goto LABEL_2;
  }
  if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F39D48], v8))
  {
    int v9 = 1;
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F39D58], v8))
  {
    int v9 = 2;
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F39D38], v8))
  {
    int v9 = 3;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F39D40], v8) & 1) == 0)
    {
      sub_1B63F2F54(0, @"Warning: Unknown alignment mode %@", v7, v8, v10, v11, v12, v13, (uint64_t)a3);
LABEL_2:
      int v9 = 0;
      goto LABEL_11;
    }
    int v9 = 4;
  }
LABEL_11:
  if (self->_alignmentMode != v9)
  {
    self->_int alignmentMode = v9;
    uint64_t v14 = objc_msgSend_worldRef(self, v6, v7, v8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B662337C;
    v16[3] = &unk_1E6141208;
    v16[4] = self;
    int v17 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
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
  v13[2] = sub_1B66234F8;
  v13[3] = &unk_1E6141230;
  v13[4] = self;
  v13[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- ($2665043C3412C69D6F3E8E948F5DACCA)params
{
  *(_OWORD *)&retstr->var7.origin.CGFloat y = 0u;
  *(_OWORD *)&retstr->var7.size.CGFloat height = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CGRect result = ($2665043C3412C69D6F3E8E948F5DACCA *)objc_msgSend_isPresentationObject(self, a3, v3, v4);
  if (result)
  {
    uint64_t v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    sub_1B6629D04(v11, v12, v13, v14, v15, v16, v17, (uint64_t)v25);
    long long v18 = v25[5];
    *(_OWORD *)&retstr->var5 = v25[4];
    *(_OWORD *)&retstr->var7.origin.CGFloat y = v18;
    *(_OWORD *)&retstr->var7.size.CGFloat height = v25[6];
    long long v19 = v25[1];
    *(_OWORD *)&retstr->var0.var0 = v25[0];
    *(_OWORD *)&retstr->var0.var4 = v19;
    long long v20 = v25[3];
    *(_OWORD *)&retstr->var0.var6 = v25[2];
    *(_OWORD *)&retstr->var2 = v20;
  }
  else
  {
    float chamferRadius = self->_chamferRadius;
    retstr->var0.var1 = self->_extrusionDepth;
    retstr->var0.var2 = chamferRadius;
    retstr->var0.var4 = self->_discretizedStraightLineMaxLength;
    CGPoint origin = self->_customContainerFrame.origin;
    retstr->var7.size = self->_customContainerFrame.size;
    retstr->var0.var0 = self->_primitiveType;
    chamferProfile = self->_chamferProfile;
    retstr->var0.var5 = 0;
    retstr->var0.var6 = chamferProfile;
    retstr->var0.var3 = 0;
    font = self->_font;
    retstr->var1 = self->_string;
    retstr->var2 = font;
    LODWORD(font) = self->_truncationMode;
    retstr->var3 = self->_alignmentMode;
    retstr->var4 = (int)font;
    retstr->var5 = self->_wrapped;
    retstr->var6 = self->_useCustomContainerFrame;
    retstr->var7.CGPoint origin = origin;
    retstr->var8 = self->_flatness;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(VFXText *)self max:(SEL)a2
{
  uint64_t v4 = (_OWORD *)v3;
  float v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  DWORD2(v35) = 0;
  *(void *)&long long v35 = 0;
  DWORD2(v34) = 0;
  *(void *)&long long v34 = 0;
  uint64_t v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self) {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  int v31 = sub_1B662B4A8(v23, &v35, &v34, v33, v19, v20, v21, v22);
  if (v31)
  {
    if (v5) {
      *float v5 = v35;
    }
    if (v4) {
      _OWORD *v4 = v34;
    }
  }
  if (v15) {
    sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
  }
  return v31;
}

- (BOOL)getBoundingSphereCenter:(VFXText *)self radius:(SEL)a2
{
  uint64_t v4 = (_DWORD *)v3;
  float v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  long long v34 = 0uLL;
  uint64_t v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self) {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  int v31 = sub_1B662B514(v23, &v34, v33, v18, v19, v20, v21, v22);
  if (v31)
  {
    if (v5) {
      *float v5 = v34;
    }
    if (v4) {
      _DWORD *v4 = HIDWORD(v34);
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
  v3.super_class = (Class)VFXText;
  [(VFXModel *)&v3 dealloc];
}

- (void)_customDecodingOfVFXText:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  float v5 = sub_1B64FAA08(a3, @"chamferProfile");
  objc_msgSend_setChamferProfile_(self, v6, (uint64_t)v5, v7);
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v54, 2);
  uint64_t v13 = objc_msgSend_setWithArray_(v8, v11, v10, v12);
  uint64_t v14 = sub_1B64FAD0C(a3, @"string", v13);
  objc_msgSend_setString_(self, v15, v14, v16);
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v21 = objc_msgSend_setWithObject_(v17, v19, v18, v20);
  uint64_t v22 = sub_1B64FAD0C(a3, @"font", v21);
  uint64_t v25 = objc_msgSend_patchFont_(self, v23, v22, v24);
  objc_msgSend_setFont_(self, v26, v25, v27);
  int v30 = objc_msgSend_decodeIntegerForKey_(a3, v28, @"alignmentMode", v29);
  uint64_t v38 = sub_1B6623164(v30, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_setAlignmentMode_(self, v39, v38, v40);
  int v43 = objc_msgSend_decodeIntegerForKey_(a3, v41, @"truncationMode", v42);
  uint64_t v51 = sub_1B6622EC0(v43, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_setTruncationMode_(self, v52, v51, v53);
}

- (void)_customEncodingOfVFXText:(id)a3
{
  sub_1B64FA904(a3, self->_chamferProfile, @"chamferProfile", v3);
  sub_1B64FAC90(a3, (const char *)self->_string, @"string");
  sub_1B64FAC90(a3, (const char *)self->_font, @"font");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_alignmentMode, @"alignmentMode");
  uint64_t truncationMode = self->_truncationMode;

  objc_msgSend_encodeInteger_forKey_(a3, v7, truncationMode, @"truncationMode");
}

- (void)encodeWithCoder:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)VFXText;
  -[VFXModel encodeWithCoder:](&v35, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend__customEncodingOfVFXText_(self, v8, (uint64_t)a3, v10);
  *(float *)&double v14 = self->_flatness;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"flatness", v16, v14);
  *(float *)&double v17 = self->_chamferRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v18, @"chamferRadius", v19, v17);
  *(float *)&double v20 = self->_extrusionDepth;
  objc_msgSend_encodeFloat_forKey_(a3, v21, @"extrusionDepth", v22, v20);
  *(float *)&double v23 = self->_discretizedStraightLineMaxLength;
  objc_msgSend_encodeFloat_forKey_(a3, v24, @"discretizedStraightLineMaxLength", v25, v23);
  objc_msgSend_encodeInteger_forKey_(a3, v26, self->_primitiveType, @"primitiveType");
  objc_msgSend_encodeBool_forKey_(a3, v27, self->_wrapped, @"wrapped");
  objc_msgSend_encodeBool_forKey_(a3, v28, self->_useCustomContainerFrame, @"useCustomContainerFrame");
  uint64_t v32 = objc_msgSend_valueWithCGRect_(MEMORY[0x1E4F29238], v29, v30, v31, self->_customContainerFrame.origin.x, self->_customContainerFrame.origin.y, self->_customContainerFrame.size.width, self->_customContainerFrame.size.height);
  objc_msgSend_encodeObject_forKey_(a3, v33, v32, @"customContainerFrame");
  objc_msgSend_encodeBool_forKey_(a3, v34, self->__wantsSeparateGeometryElements, @"_wantsSeparateGeometryElements");
}

- (VFXText)initWithCoder:(id)a3
{
  v63.receiver = self;
  v63.super_class = (Class)VFXText;
  uint64_t v7 = -[VFXModel initWithCoder:](&v63, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXText_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, @"flatness", v14);
    objc_msgSend_setFlatness_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"chamferRadius", v19);
    objc_msgSend_setChamferRadius_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, @"extrusionDepth", v24);
    objc_msgSend_setExtrusionDepth_(v7, v25, v26, v27);
    objc_msgSend_decodeFloatForKey_(a3, v28, @"discretizedStraightLineMaxLength", v29);
    objc_msgSend_setDiscretizedStraightLineMaxLength_(v7, v30, v31, v32);
    uint64_t v35 = objc_msgSend_decodeIntegerForKey_(a3, v33, @"primitiveType", v34);
    objc_msgSend_setPrimitiveType_(v7, v36, v35, v37);
    uint64_t v40 = objc_msgSend_decodeBoolForKey_(a3, v38, @"wrapped", v39);
    objc_msgSend_setWrapped_(v7, v41, v40, v42);
    v7->_useCustomContainerFrame = objc_msgSend_decodeBoolForKey_(a3, v43, @"useCustomContainerFrame", v44);
    uint64_t v45 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v46, v45, @"customContainerFrame");
    objc_msgSend_CGRectValue(v47, v48, v49, v50);
    v7->_customContainerFrame.origin.CGFloat x = v51;
    v7->_customContainerFrame.origin.CGFloat y = v52;
    v7->_customContainerFrame.size.CGFloat width = v53;
    v7->_customContainerFrame.size.CGFloat height = v54;
    uint64_t v57 = objc_msgSend_decodeBoolForKey_(a3, v55, @"_wantsSeparateGeometryElements", v56);
    objc_msgSend_set_wantsSeparateGeometryElements_(v7, v58, v57, v59);
    objc_msgSend_setImmediateMode_(VFXTransaction, v60, v8, v61);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  if (qword_1EB995698 != -1) {
    dispatch_once(&qword_1EB995698, &unk_1F0FB6228);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB9956A0, 0x168uLL);
  sub_1B662ACF0(v0);
  *(_WORD *)(v0 + 336) = 0;
  v1 = (_OWORD *)MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v0 + 304) = 0u;
  *(_OWORD *)(v0 + 320) = 0u;
  long long v2 = v1[1];
  *(_OWORD *)(v0 + 344) = *v1;
  *(_OWORD *)(v0 + 360) = v2;
  *(unsigned char *)(v0 + 338) = 0;
  sub_1B63CE3B8(v0, (uint64_t)sub_1B6629AE8);
  return v0;
}

@end