@interface VFXParametricModel
+ (BOOL)supportsSecureCoding;
+ (id)capsuleWithCapRadius:(float)a3 height:(float)a4;
+ (id)coneWithTopRadius:(float)a3 bottomRadius:(float)a4 height:(float)a5;
+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 chamferRadius:(float)a6;
+ (id)cylinderWithRadius:(float)a3 height:(float)a4;
+ (id)planeWithWidth:(float)a3 height:(float)a4;
+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5;
+ (id)sphereWithRadius:(float)a3;
+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4;
+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5;
+ (id)unitCube;
- (BOOL)getBoundingBoxMin:(VFXParametricModel *)self max:(SEL)a2;
- (BOOL)getBoundingSphereCenter:(VFXParametricModel *)self radius:(SEL)a2;
- (BOOL)isGeodesic;
- (BOOL)isHemispheric;
- (NSArray)bridgedComponentNames;
- (VFXParametricModel)init;
- (VFXParametricModel)initWithCoder:(id)a3;
- (VFXParametricModel)initWithDefaultMaterial;
- (float)chamferRadius;
- (float)height;
- (float)innerRadius;
- (float)length;
- (float)pipeRadius;
- (float)radialSpan;
- (float)radius;
- (float)topRadius;
- (float)width;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricModelWithParametricGeometryRef:(__CFXParametricGeometry *)a3;
- (id)initUninitialized;
- (id)mesh;
- (id)presentationModel;
- (int)_sphereType;
- (int64_t)capSegmentCount;
- (int64_t)chamferSegmentCount;
- (int64_t)cornerSegmentCount;
- (int64_t)heightSegmentCount;
- (int64_t)lengthSegmentCount;
- (int64_t)parametricType;
- (int64_t)pipeSegmentCount;
- (int64_t)primitiveType;
- (int64_t)radialSegmentCount;
- (int64_t)segmentCount;
- (int64_t)widthSegmentCount;
- (uint64_t)__createCFObject;
- (void)_notifyModelChanged;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel;
- (void)_syncObjCModel:(__CFXParametricGeometry *)a3;
- (void)_updateSphereType;
- (void)encodeWithCoder:(id)a3;
- (void)setCapSegmentCount:(int64_t)a3;
- (void)setChamferRadius:(float)a3;
- (void)setChamferSegmentCount:(int64_t)a3;
- (void)setCornerSegmentCount:(int64_t)a3;
- (void)setGeodesic:(BOOL)a3;
- (void)setHeight:(float)a3;
- (void)setHeightSegmentCount:(int64_t)a3;
- (void)setHemispheric:(BOOL)a3;
- (void)setInnerRadius:(float)a3;
- (void)setLength:(float)a3;
- (void)setLengthSegmentCount:(int64_t)a3;
- (void)setParametricType:(int64_t)a3;
- (void)setPipeRadius:(float)a3;
- (void)setPipeSegmentCount:(int64_t)a3;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setRadialSegmentCount:(int64_t)a3;
- (void)setRadialSpan:(float)a3;
- (void)setRadius:(float)a3;
- (void)setSegmentCount:(int64_t)a3;
- (void)setTopRadius:(float)a3;
- (void)setWidth:(float)a3;
- (void)setWidthSegmentCount:(int64_t)a3;
@end

@implementation VFXParametricModel

- (VFXParametricModel)init
{
  v3 = (const void *)-[VFXParametricModel __createCFObject]_0();
  v10.receiver = self;
  v10.super_class = (Class)VFXParametricModel;
  v4 = [(VFXModel *)&v10 initWithGeometryRef:v3];
  v8 = v4;
  if (v4) {
    objc_msgSend__syncObjCModel(v4, v5, v6, v7);
  }
  CFRelease(v3);
  return v8;
}

- (VFXParametricModel)initWithDefaultMaterial
{
  v3 = (const void *)-[VFXParametricModel __createCFObject]_0();
  v10.receiver = self;
  v10.super_class = (Class)VFXParametricModel;
  v4 = [(VFXModel *)&v10 initWithGeometryRef:v3];
  v8 = v4;
  if (v4) {
    objc_msgSend__syncObjCModel(v4, v5, v6, v7);
  }
  CFRelease(v3);
  return v8;
}

- (id)initUninitialized
{
  v3 = (const void *)sub_1B655C8BC(0, 0, 0);
  v7.receiver = self;
  v7.super_class = (Class)VFXParametricModel;
  v4 = [(VFXModel *)&v7 initWithGeometryRef:v3];
  v5 = v4;
  if (v4) {
    v4->_type = -1;
  }
  CFRelease(v3);
  return v5;
}

- (id)initPresentationParametricModelWithParametricGeometryRef:(__CFXParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VFXParametricModel;
  return [(VFXModel *)&v4 initPresentationModelWithGeometryRef:a3];
}

- (id)mesh
{
  v7.receiver = self;
  v7.super_class = (Class)VFXParametricModel;
  id result = [(VFXModel *)&v7 mesh];
  if (!result) {
    return (id)objc_msgSend__fetchMesh(self, v4, v5, v6);
  }
  return result;
}

- (id)presentationModel
{
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self;
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_geometryRef(self, v7, v8, v9);
  inited = objc_msgSend_initPresentationParametricModelWithParametricGeometryRef_(v6, v11, v10, v12);

  return inited;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (id)description
{
  switch(self->_type)
  {
    case 0:
      objc_super v4 = NSString;
      double width = self->_width;
      double height = self->_height;
      double length = self->_length;
      uint64_t v53 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v4, v8, @"<Cube [w=%f h=%f l=%f] %@>", v9, *(void *)&width, *(void *)&height, *(void *)&length, v53);
      break;
    case 1:
      v11 = NSString;
      double radius = self->_radius;
      uint64_t v46 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v11, v13, @"<Sphere [r=%f]> %@", v14, *(void *)&radius, v46);
      break;
    case 2:
      v15 = NSString;
      double v16 = self->_width;
      double v17 = self->_height;
      uint64_t v52 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v15, v18, @"<Plane [w=%f h=%f]> %@", v19, *(void *)&v16, *(void *)&v17, v52);
      break;
    case 3:
      v20 = NSString;
      double v21 = self->_width;
      double v22 = self->_height;
      double v23 = self->_length;
      uint64_t v54 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v20, v24, @"<pyramid [w=%f h=%f l=%f] %@>", v25, *(void *)&v21, *(void *)&v22, *(void *)&v23, v54);
      break;
    case 4:
      v26 = NSString;
      double v27 = self->_height;
      uint64_t v47 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v26, v28, @"<Cylinder [h=%f]> %@", v29, *(void *)&v27, v47);
      break;
    case 5:
      v30 = NSString;
      double v31 = self->_height;
      uint64_t v48 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v30, v32, @"<Cone [h=%f]> %@", v33, *(void *)&v31, v48);
      break;
    case 6:
      v34 = NSString;
      double v35 = self->_height;
      uint64_t v49 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v34, v36, @"<Tube [h=%f]> %@", v37, *(void *)&v35, v49);
      break;
    case 7:
      v38 = NSString;
      double v39 = self->_height;
      uint64_t v50 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v38, v40, @"<Capsule [h=%f]> %@", v41, *(void *)&v39, v50);
      break;
    case 8:
      v42 = NSString;
      double v43 = self->_radius;
      uint64_t v51 = objc_msgSend_modelDescription(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v42, v44, @"<Torus [r=%f]> %@", v45, *(void *)&v43, v51);
      break;
    default:
      id result = @"unknown parametric type";
      break;
  }
  return result;
}

- (void)_syncObjCModel
{
  v9.receiver = self;
  v9.super_class = (Class)VFXParametricModel;
  [(VFXModel *)&v9 _syncObjCModel];
  uint64_t v6 = objc_msgSend_geometryRef(self, v3, v4, v5);
  objc_msgSend__syncObjCModel_(self, v7, v6, v8);
}

- (void)_syncObjCModel:(__CFXParametricGeometry *)a3
{
  unsigned int v10 = sub_1B6558E80(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) - 1;
  if (v10 > 7) {
    int64_t v11 = 2;
  }
  else {
    int64_t v11 = qword_1B6E520E0[v10];
  }
  self->_type = v11;
  double v12 = sub_1B65593E4((uint64_t)a3, 0);
  self->_double width = *(float *)&v12;
  double v13 = sub_1B65593E4((uint64_t)a3, 1);
  self->_double height = *(float *)&v13;
  double v14 = sub_1B65593E4((uint64_t)a3, 2);
  self->_double length = *(float *)&v14;
  double v15 = sub_1B65593E4((uint64_t)a3, 3);
  self->_chamferRadius = *(float *)&v15;
  double v16 = sub_1B65593E4((uint64_t)a3, 4);
  self->_double radius = *(float *)&v16;
  double v17 = sub_1B65593E4((uint64_t)a3, 7);
  self->_pipeRadius = *(float *)&v17;
  double v18 = sub_1B65593E4((uint64_t)a3, 5);
  self->_topRadius = *(float *)&v18;
  double v19 = sub_1B65593E4((uint64_t)a3, 6);
  self->_innerRadius = *(float *)&v19;
  self->_widthSegmentCount = sub_1B655CCA8((int *)a3, 9);
  self->_heightSegmentCount = sub_1B655CCA8((int *)a3, 10);
  self->_lengthSegmentCount = sub_1B655CCA8((int *)a3, 11);
  self->_chamferSegmentCount = sub_1B655CCA8((int *)a3, 12);
  self->_pipeSegmentCount = sub_1B655CCA8((int *)a3, 15);
  self->_capSegmentCount = sub_1B655CCA8((int *)a3, 14);
  self->_cornerSegmentCount = sub_1B655CCA8((int *)a3, 12);
  self->_segmentCount = (int)sub_1B655D88C((uint64_t)a3, v20, v21, v22, v23, v24, v25, v26);
  self->_radialSegmentCount = (int)sub_1B655D5D0((uint64_t)a3, v27, v28, v29, v30, v31, v32, v33);
  int v34 = sub_1B655CCA8((int *)a3, 19);
  self->_spheregeodesic = v34 == 1;
  self->_spherehemispheric = v34 == 2;
  double v35 = sub_1B65593E4((uint64_t)a3, 18);
  self->_radialSpan = (float)(uint64_t)*(float *)&v35;
  self->_primitiveType = sub_1B655CCA8((int *)a3, 17);
}

- (void)_setupObjCModelFrom:(id)a3
{
  v139.receiver = self;
  v139.super_class = (Class)VFXParametricModel;
  -[VFXModel _setupObjCModelFrom:](&v139, sel__setupObjCModelFrom_);
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  uint64_t v13 = objc_msgSend_primitiveType(a3, v10, v11, v12);
  objc_msgSend_setPrimitiveType_(self, v14, v13, v15);
  objc_msgSend_width(a3, v16, v17, v18);
  objc_msgSend_setWidth_(self, v19, v20, v21);
  objc_msgSend_height(a3, v22, v23, v24);
  objc_msgSend_setHeight_(self, v25, v26, v27);
  objc_msgSend_length(a3, v28, v29, v30);
  objc_msgSend_setLength_(self, v31, v32, v33);
  objc_msgSend_radius(a3, v34, v35, v36);
  objc_msgSend_setRadius_(self, v37, v38, v39);
  objc_msgSend_chamferRadius(a3, v40, v41, v42);
  objc_msgSend_setChamferRadius_(self, v43, v44, v45);
  objc_msgSend_topRadius(a3, v46, v47, v48);
  objc_msgSend_setTopRadius_(self, v49, v50, v51);
  objc_msgSend_pipeRadius(a3, v52, v53, v54);
  objc_msgSend_setPipeRadius_(self, v55, v56, v57);
  objc_msgSend_innerRadius(a3, v58, v59, v60);
  objc_msgSend_setInnerRadius_(self, v61, v62, v63);
  uint64_t v67 = objc_msgSend_segmentCount(a3, v64, v65, v66);
  objc_msgSend_setSegmentCount_(self, v68, v67, v69);
  uint64_t v73 = objc_msgSend_widthSegmentCount(a3, v70, v71, v72);
  objc_msgSend_setWidthSegmentCount_(self, v74, v73, v75);
  uint64_t v79 = objc_msgSend_heightSegmentCount(a3, v76, v77, v78);
  objc_msgSend_setHeightSegmentCount_(self, v80, v79, v81);
  uint64_t v85 = objc_msgSend_lengthSegmentCount(a3, v82, v83, v84);
  objc_msgSend_setLengthSegmentCount_(self, v86, v85, v87);
  uint64_t v91 = objc_msgSend_cornerSegmentCount(a3, v88, v89, v90);
  objc_msgSend_setCornerSegmentCount_(self, v92, v91, v93);
  uint64_t v97 = objc_msgSend_pipeSegmentCount(a3, v94, v95, v96);
  objc_msgSend_setPipeSegmentCount_(self, v98, v97, v99);
  uint64_t v103 = objc_msgSend_capSegmentCount(a3, v100, v101, v102);
  objc_msgSend_setCapSegmentCount_(self, v104, v103, v105);
  uint64_t v109 = objc_msgSend_radialSegmentCount(a3, v106, v107, v108);
  objc_msgSend_setRadialSegmentCount_(self, v110, v109, v111);
  objc_msgSend_radialSpan(a3, v112, v113, v114);
  objc_msgSend_setRadialSpan_(self, v115, v116, v117);
  uint64_t isGeodesic = objc_msgSend_isGeodesic(a3, v118, v119, v120);
  objc_msgSend_setGeodesic_(self, v122, isGeodesic, v123);
  uint64_t isHemispheric = objc_msgSend_isHemispheric(a3, v124, v125, v126);
  objc_msgSend_setHemispheric_(self, v128, isHemispheric, v129);
  uint64_t v133 = objc_msgSend_parametricType(a3, v130, v131, v132);
  objc_msgSend_setParametricType_(self, v134, v133, v135);
  objc_msgSend_commitImmediate(VFXTransaction, v136, v137, v138);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  inited = objc_msgSend_initUninitialized(v4, v5, v6, v7);
  objc_msgSend__setupObjCModelFrom_(inited, v9, (uint64_t)self, v10);
  objc_msgSend__copyAttributesTo_(self, v11, (uint64_t)inited, v12);
  return inited;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (BOOL)getBoundingBoxMin:(VFXParametricModel *)self max:(SEL)a2
{
  id v4 = (_OWORD *)v3;
  uint64_t v5 = (_OWORD *)v2;
  DWORD2(v38) = 0;
  *(void *)&long long v38 = 0;
  DWORD2(v37) = 0;
  *(void *)&long long v37 = 0;
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    uint64_t v18 = v10;
    if (v10) {
      sub_1B64B0C28(v10, (uint64_t)v11, v12, v13, v14, v15, v16, v17);
    }
    if (objc_msgSend_geometryRef(self, v11, v12, v13))
    {
      uint64_t v26 = objc_msgSend_geometryRef(self, v19, v20, v21);
      char v32 = sub_1B6559470(v26, (uint64_t)&v38, (uint64_t)&v37, v27, v28, v29, v30, v31);
      if (!v18)
      {
LABEL_13:
        if (!v5) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    else
    {
      char v32 = 0;
      if (!v18) {
        goto LABEL_13;
      }
    }
    sub_1B64B0CB4(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_13;
  }
  if (objc_msgSend__hasFixedBoundingBoxExtrema(self, v7, v8, v9))
  {
    v36.receiver = self;
    v36.super_class = (Class)VFXParametricModel;
    return [(VFXModel *)&v36 getBoundingBoxMin:v5 max:v4];
  }
  switch(self->_type)
  {
    case 0:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B6559840((float32x2_t *)&v38, (float32x2_t *)&v37, *(float32x2_t *)v33.i8, self->_height, self->_length);
      break;
    case 1:
      v33.i32[0] = LODWORD(self->_radius);
      sub_1B655AA58((uint64_t)&v38, (uint64_t)&v37, *(double *)v33.i64, v34);
      break;
    case 2:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B655936C((float32x2_t *)&v38, (float32x2_t *)&v37, *(float32x2_t *)v33.i8, self->_height);
      break;
    case 3:
      v33.i32[0] = LODWORD(self->_width);
      sub_1B655A24C((uint64_t)&v38, (uint64_t)&v37, v33, self->_height, self->_length);
      break;
    case 4:
    case 6:
    case 7:
      sub_1B655AE44((uint64_t)&v38, (uint64_t)&v37, self->_radius, self->_height);
      break;
    case 5:
      v33.i32[0] = LODWORD(self->_topRadius);
      sub_1B655B3E0((uint64_t)&v38, (__n64 *)&v37, *(__n64 *)v33.i8, self->_radius, self->_height);
      break;
    case 8:
      v33.i32[0] = LODWORD(self->_radius);
      sub_1B655C3D4((uint64_t)&v38, (__n64 *)&v37, *(__n64 *)v33.i8, self->_pipeRadius);
      break;
    default:
      break;
  }
  char v32 = 1;
  if (v5) {
LABEL_14:
  }
    _OWORD *v5 = v38;
LABEL_15:
  if (v4) {
    _OWORD *v4 = v37;
  }
  return v32;
}

- (BOOL)getBoundingSphereCenter:(VFXParametricModel *)self radius:(SEL)a2
{
  id v4 = (_DWORD *)v3;
  uint64_t v5 = (int32x4_t *)v2;
  int32x4_t v37 = 0uLL;
  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    uint64_t v12 = objc_msgSend_worldRef(self, v7, v8, v9);
    uint64_t v20 = v12;
    if (v12) {
      sub_1B64B0C28(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    }
    if (objc_msgSend_geometryRef(self, v13, v14, v15)
      && (uint64_t v28 = objc_msgSend_geometryRef(self, v21, v22, v23),
          sub_1B65594E8(v28, (uint64_t)&v37, v29, v30, v31, v32, v33, v34)))
    {
      if (v5) {
        int32x4_t *v5 = v37;
      }
      if (v4) {
        _DWORD *v4 = v37.i32[3];
      }
      BOOL v35 = 1;
      if (!v20) {
        return v35;
      }
    }
    else
    {
      BOOL v35 = 0;
      if (!v20) {
        return v35;
      }
    }
    sub_1B64B0CB4(v20, (uint64_t)v21, v22, v23, v24, v25, v26, v27);
    return v35;
  }
  switch(self->_type)
  {
    case 0:
      if (sub_1B65598DC(&v37, self->_width, self->_height, self->_length)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 1:
      if (sub_1B655AAC4(&v37, self->_radius)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 2:
      if (sub_1B655940C(&v37, self->_width, self->_height)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 3:
      v10.i32[0] = LODWORD(self->_width);
      *(float *)&double v11 = self->_height;
      if (sub_1B655A34C(&v37, v10, v11, self->_length)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 4:
      if (sub_1B655AF74(&v37, self->_radius, self->_height)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 5:
      if (sub_1B655B520(&v37, self->_topRadius, self->_radius, self->_height)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 6:
      if (sub_1B655AF74(&v37, self->_radius, self->_height)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 7:
      v10.i32[0] = LODWORD(self->_radius);
      if (sub_1B655BEF8(&v37, *(double *)v10.i64, self->_height)) {
        goto LABEL_18;
      }
      goto LABEL_14;
    case 8:
      if (!sub_1B655C464(&v37, self->_radius, self->_pipeRadius)) {
        goto LABEL_14;
      }
LABEL_18:
      if (v5) {
        int32x4_t *v5 = v37;
      }
      if (v4) {
        _DWORD *v4 = v37.i32[3];
      }
      BOOL v35 = 1;
      break;
    default:
LABEL_14:
      BOOL v35 = 0;
      break;
  }
  return v35;
}

- (void)_notifyModelChanged
{
}

- (void)setParametricType:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_type != a3)
  {
    self->_type = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654B07C;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)parametricType
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    p_type = &self->_type;
    return *p_type;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = (_OWORD *)objc_msgSend_geometryRef(self, v9, v10, v11);
  int v32 = sub_1B6558E80(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  if ((v32 - 1) < 8)
  {
    p_type = &qword_1B6E520E0[v32 - 1];
    return *p_type;
  }
  return 2;
}

- (float)width
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_width;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655A03C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setWidth:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_width != a3)
  {
    self->_double width = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654B2B0;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"width", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)height
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_height;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655A088(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setHeight:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_height != a3)
  {
    self->_double height = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654B438;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"height", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)length
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_length;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655A0D4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setLength:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_length != a3)
  {
    self->_double length = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654B5C0;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"length", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)radius
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_radius;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655AF28(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setRadius:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_radius != a3)
  {
    self->_double radius = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654B748;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"radius", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
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
  float v32 = sub_1B65596EC(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setChamferRadius:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_chamferRadius != a3)
  {
    self->_chamferRadius = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654B8D8;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"chamferRadius", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)topRadius
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_topRadius;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655B4D4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setTopRadius:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_topRadius != a3)
  {
    self->_topRadius = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654BA60;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"topRadius", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)innerRadius
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_innerRadius;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655B4D4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setInnerRadius:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_innerRadius != a3)
  {
    self->_innerRadius = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654BBE8;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"innerRadius", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (float)pipeRadius
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_pipeRadius;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655C784(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setPipeRadius:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_pipeRadius != a3)
  {
    self->_pipeRadius = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654BD70;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"pipeRadius", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
  }
}

- (int64_t)segmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_segmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D88C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_segmentCount != a3)
  {
    self->_segmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654BEEC;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"segmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)widthSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_widthSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D434(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setWidthSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_widthSegmentCount != a3)
  {
    self->_widthSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C068;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"widthSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)heightSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_heightSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D0B8(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setHeightSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_heightSegmentCount != a3)
  {
    self->_heightSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C1E4;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"heightSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)lengthSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_lengthSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D210(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setLengthSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_lengthSegmentCount != a3)
  {
    self->_lengthSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C360;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"lengthSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)chamferSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_chamferSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655CF60(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setChamferSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_chamferSegmentCount != a3)
  {
    self->_chamferSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C4DC;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"chamferSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)cornerSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_cornerSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655CF60(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setCornerSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_cornerSegmentCount != a3)
  {
    self->_cornerSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C658;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"cornerSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)pipeSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_pipeSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D9E4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setPipeSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_pipeSegmentCount != a3)
  {
    self->_pipeSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C7D4;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"pipeSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)capSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_capSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D500(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setCapSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_capSegmentCount != a3)
  {
    self->_capSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654C950;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"capSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (int64_t)radialSegmentCount
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_radialSegmentCount;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  int64_t v32 = (int)sub_1B655D5D0(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setRadialSegmentCount:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_radialSegmentCount != a3)
  {
    self->_radialSegmentCount = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654CACC;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, @"radialSegmentCount", v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (float)radialSpan
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_radialSpan;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  float v32 = sub_1B655D728(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setRadialSpan:(float)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, v3, v4) & 1) != 0 || self->_radialSpan != a3)
  {
    self->_radialSpan = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B654CC54;
    v15[3] = &unk_1E6141208;
    v15[4] = self;
    float v16 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"radialSpan", v15);
    objc_msgSend__notifyModelChanged(self, v12, v13, v14);
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
  int64_t v32 = (int)sub_1B655D2DC(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setPrimitiveType:(int64_t)a3
{
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B654CDC8;
    v14[3] = &unk_1E61412A8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v14);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (BOOL)isGeodesic
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_spheregeodesic;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  BOOL v32 = sub_1B655CE1C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (void)setGeodesic:(BOOL)a3
{
  BOOL v4 = a3;
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_spheregeodesic != v4)
  {
    self->_spheregeodesic = v4;
    if (v4)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, @"hemispheric", v8);
      self->_spherehemispheric = 0;
      objc_msgSend_didChangeValueForKey_(self, v9, @"hemispheric", v10);
    }
    objc_msgSend__updateSphereType(self, v6, v7, v8);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

- (BOOL)isHemispheric
{
  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3)) {
    return self->_spherehemispheric;
  }
  uint64_t v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  uint64_t v16 = v8;
  if (v8) {
    sub_1B64B0C28(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  BOOL v32 = sub_1B655CD58(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16) {
    sub_1B64B0CB4(v16, v25, v26, v27, v28, v29, v30, v31);
  }
  return v32;
}

- (int)_sphereType
{
  if (self->_spherehemispheric) {
    return 2;
  }
  else {
    return self->_spheregeodesic;
  }
}

- (void)_updateSphereType
{
  int v5 = objc_msgSend__sphereType(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_worldRef(self, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B654D064;
  v11[3] = &unk_1E6141208;
  int v12 = v5;
  v11[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
}

- (void)setHemispheric:(BOOL)a3
{
  BOOL v4 = a3;
  if ((objc_msgSend_isPresentationObject(self, a2, a3, v3) & 1) != 0 || self->_spherehemispheric != v4)
  {
    self->_spherehemispheric = v4;
    if (v4)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, @"geodesic", v8);
      self->_spheregeodesic = 0;
      objc_msgSend_didChangeValueForKey_(self, v9, @"geodesic", v10);
    }
    objc_msgSend__updateSphereType(self, v6, v7, v8);
    objc_msgSend__notifyModelChanged(self, v11, v12, v13);
  }
}

+ (id)planeWithWidth:(float)a3 height:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 2, v12);
  *(float *)&double v13 = a3;
  objc_msgSend_setWidth_(v10, v14, v15, v16, v13);
  *(float *)&double v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);

  return v10;
}

+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 chamferRadius:(float)a6
{
  id v10 = objc_alloc((Class)objc_opt_class());
  uint64_t v14 = objc_msgSend_initWithDefaultMaterial(v10, v11, v12, v13);
  objc_msgSend_setParametricType_(v14, v15, 0, v16);
  *(float *)&double v17 = a3;
  objc_msgSend_setWidth_(v14, v18, v19, v20, v17);
  *(float *)&double v21 = a4;
  objc_msgSend_setHeight_(v14, v22, v23, v24, v21);
  *(float *)&double v25 = a5;
  objc_msgSend_setLength_(v14, v26, v27, v28, v25);
  *(float *)&double v29 = a6;
  objc_msgSend_setChamferRadius_(v14, v30, v31, v32, v29);

  return v14;
}

+ (id)unitCube
{
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 1.0;
  return (id)objc_msgSend_cubeWithWidth_height_length_chamferRadius_(a1, a2, v2, v3, v4, v5, v6, 0.0);
}

+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 3, v14);
  *(float *)&double v15 = a3;
  objc_msgSend_setWidth_(v12, v16, v17, v18, v15);
  *(float *)&double v19 = a4;
  objc_msgSend_setHeight_(v12, v20, v21, v22, v19);
  *(float *)&double v23 = a5;
  objc_msgSend_setLength_(v12, v24, v25, v26, v23);

  return v12;
}

+ (id)cylinderWithRadius:(float)a3 height:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 4, v12);
  *(float *)&double v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&double v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);

  return v10;
}

+ (id)sphereWithRadius:(float)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_initWithDefaultMaterial(v4, v5, v6, v7);
  objc_msgSend_setParametricType_(v8, v9, 1, v10);
  *(float *)&double v11 = a3;
  objc_msgSend_setRadius_(v8, v12, v13, v14, v11);

  return v8;
}

+ (id)coneWithTopRadius:(float)a3 bottomRadius:(float)a4 height:(float)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 5, v14);
  *(float *)&double v15 = a3;
  objc_msgSend_setTopRadius_(v12, v16, v17, v18, v15);
  *(float *)&double v19 = a4;
  objc_msgSend_setRadius_(v12, v20, v21, v22, v19);
  *(float *)&double v23 = a5;
  objc_msgSend_setHeight_(v12, v24, v25, v26, v23);

  return v12;
}

+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend_initWithDefaultMaterial(v8, v9, v10, v11);
  objc_msgSend_setParametricType_(v12, v13, 6, v14);
  *(float *)&double v15 = a3;
  objc_msgSend_setInnerRadius_(v12, v16, v17, v18, v15);
  *(float *)&double v19 = a4;
  objc_msgSend_setRadius_(v12, v20, v21, v22, v19);
  *(float *)&double v23 = a5;
  objc_msgSend_setHeight_(v12, v24, v25, v26, v23);

  return v12;
}

+ (id)capsuleWithCapRadius:(float)a3 height:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 7, v12);
  *(float *)&double v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&double v17 = a4;
  objc_msgSend_setHeight_(v10, v18, v19, v20, v17);

  return v10;
}

+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_initWithDefaultMaterial(v6, v7, v8, v9);
  objc_msgSend_setParametricType_(v10, v11, 8, v12);
  *(float *)&double v13 = a3;
  objc_msgSend_setRadius_(v10, v14, v15, v16, v13);
  *(float *)&double v17 = a4;
  objc_msgSend_setPipeRadius_(v10, v18, v19, v20, v17);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v52.receiver = self;
  v52.super_class = (Class)VFXParametricModel;
  -[VFXModel encodeWithCoder:](&v52, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_type, @"parametricType");
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"width", v15, self->_width);
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"height", v17, self->_height);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"length", v19, self->_length);
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"radius", v21, self->_radius);
  objc_msgSend_encodeDouble_forKey_(a3, v22, @"innerRadius", v23, self->_innerRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v24, @"chamferRadius", v25, self->_chamferRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v26, @"topRadius", v27, self->_topRadius);
  objc_msgSend_encodeDouble_forKey_(a3, v28, @"pipeRadius", v29, self->_pipeRadius);
  objc_msgSend_encodeInteger_forKey_(a3, v30, self->_widthSegmentCount, @"widthSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v31, self->_heightSegmentCount, @"heightSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v32, self->_lengthSegmentCount, @"lengthSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v33, self->_segmentCount, @"segmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v34, self->_chamferSegmentCount, @"chamferSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v35, self->_cornerSegmentCount, @"cornerSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v36, self->_pipeSegmentCount, @"pipeSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v37, self->_capSegmentCount, @"capSegmentCount");
  objc_msgSend_encodeInteger_forKey_(a3, v38, self->_radialSegmentCount, @"radialSegmentCount");
  objc_msgSend_encodeDouble_forKey_(a3, v39, @"radialSpan", v40, self->_radialSpan);
  uint64_t isGeodesic = objc_msgSend_isGeodesic(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(a3, v45, isGeodesic, @"geodesic");
  uint64_t isHemispheric = objc_msgSend_isHemispheric(self, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(a3, v50, isHemispheric, @"hemispheric");
  objc_msgSend_encodeInteger_forKey_(a3, v51, self->_primitiveType, @"primitiveType");
}

- (VFXParametricModel)initWithCoder:(id)a3
{
  v133.receiver = self;
  v133.super_class = (Class)VFXParametricModel;
  uint64_t v7 = -[VFXModel initWithCoder:](&v133, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"parametricType", v12);
    objc_msgSend_setParametricType_(v7, v14, v13, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, @"width", v17);
    *(float *)&double v18 = v18;
    objc_msgSend_setWidth_(v7, v19, v20, v21, v18);
    objc_msgSend_decodeDoubleForKey_(a3, v22, @"height", v23);
    *(float *)&double v24 = v24;
    objc_msgSend_setHeight_(v7, v25, v26, v27, v24);
    objc_msgSend_decodeDoubleForKey_(a3, v28, @"length", v29);
    *(float *)&double v30 = v30;
    objc_msgSend_setLength_(v7, v31, v32, v33, v30);
    objc_msgSend_decodeDoubleForKey_(a3, v34, @"radius", v35);
    *(float *)&double v36 = v36;
    objc_msgSend_setRadius_(v7, v37, v38, v39, v36);
    objc_msgSend_decodeDoubleForKey_(a3, v40, @"innerRadius", v41);
    *(float *)&double v42 = v42;
    objc_msgSend_setInnerRadius_(v7, v43, v44, v45, v42);
    objc_msgSend_decodeDoubleForKey_(a3, v46, @"chamferRadius", v47);
    *(float *)&double v48 = v48;
    objc_msgSend_setChamferRadius_(v7, v49, v50, v51, v48);
    objc_msgSend_decodeDoubleForKey_(a3, v52, @"topRadius", v53);
    *(float *)&double v54 = v54;
    objc_msgSend_setTopRadius_(v7, v55, v56, v57, v54);
    objc_msgSend_decodeDoubleForKey_(a3, v58, @"pipeRadius", v59);
    *(float *)&double v60 = v60;
    objc_msgSend_setPipeRadius_(v7, v61, v62, v63, v60);
    uint64_t v66 = objc_msgSend_decodeIntegerForKey_(a3, v64, @"segmentCount", v65);
    objc_msgSend_setSegmentCount_(v7, v67, v66, v68);
    uint64_t v71 = objc_msgSend_decodeIntegerForKey_(a3, v69, @"chamferSegmentCount", v70);
    objc_msgSend_setChamferSegmentCount_(v7, v72, v71, v73);
    uint64_t v76 = objc_msgSend_decodeIntegerForKey_(a3, v74, @"widthSegmentCount", v75);
    objc_msgSend_setWidthSegmentCount_(v7, v77, v76, v78);
    uint64_t v81 = objc_msgSend_decodeIntegerForKey_(a3, v79, @"heightSegmentCount", v80);
    objc_msgSend_setHeightSegmentCount_(v7, v82, v81, v83);
    uint64_t v86 = objc_msgSend_decodeIntegerForKey_(a3, v84, @"lengthSegmentCount", v85);
    objc_msgSend_setLengthSegmentCount_(v7, v87, v86, v88);
    uint64_t v91 = objc_msgSend_decodeIntegerForKey_(a3, v89, @"cornerSegmentCount", v90);
    objc_msgSend_setCornerSegmentCount_(v7, v92, v91, v93);
    uint64_t v96 = objc_msgSend_decodeIntegerForKey_(a3, v94, @"pipeSegmentCount", v95);
    objc_msgSend_setPipeSegmentCount_(v7, v97, v96, v98);
    uint64_t v101 = objc_msgSend_decodeIntegerForKey_(a3, v99, @"capSegmentCount", v100);
    objc_msgSend_setCapSegmentCount_(v7, v102, v101, v103);
    uint64_t v106 = objc_msgSend_decodeIntegerForKey_(a3, v104, @"radialSegmentCount", v105);
    objc_msgSend_setRadialSegmentCount_(v7, v107, v106, v108);
    objc_msgSend_decodeDoubleForKey_(a3, v109, @"radialSpan", v110);
    *(float *)&double v111 = v111;
    objc_msgSend_setRadialSpan_(v7, v112, v113, v114, v111);
    uint64_t v117 = objc_msgSend_decodeBoolForKey_(a3, v115, @"geodesic", v116);
    objc_msgSend_setGeodesic_(v7, v118, v117, v119);
    uint64_t v122 = objc_msgSend_decodeBoolForKey_(a3, v120, @"hemispheric", v121);
    objc_msgSend_setHemispheric_(v7, v123, v122, v124);
    uint64_t v127 = objc_msgSend_decodeIntegerForKey_(a3, v125, @"primitiveType", v126);
    objc_msgSend_setPrimitiveType_(v7, v128, v127, v129);
    objc_msgSend_setImmediateMode_(VFXTransaction, v130, v8, v131);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  return sub_1B655C8BC(0, &xmmword_1F0FB86B0, 1);
}

- (NSArray)bridgedComponentNames
{
  uint64_t v2 = (void *)sub_1B6E31C18();

  return (NSArray *)v2;
}

@end