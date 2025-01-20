@interface RS3DObject
+ (BOOL)supportsSecureCoding;
- (BOOL)getDimension:(id)a3 dim:;
- (BOOL)getTransform:(id)a3 transform:(id *)a4;
- (BOOL)hasBoxesDict:(id)a3;
- (BOOL)status;
- (NSArray)corners_status;
- (NSArray)edges_status;
- (NSArray)embedding2d;
- (NSArray)logits;
- (NSDictionary)beautified_parts;
- (NSDictionary)boxesDict;
- (NSDictionary)groups;
- (NSDictionary)parts;
- (NSString)type;
- (NSUUID)identifier;
- (NSUUID)parent_id;
- (RS3DObject)init;
- (RS3DObject)initWithCoder:(id)a3;
- (RS3DObject)initWithDictionaryRepresentation:(id)a3;
- (__n128)color;
- (__n64)dimensions;
- (double)transform;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)storyLevel;
- (void)encodeWithCoder:(id)a3;
- (void)rotateAlongZAxisRightHand:(float)a3;
- (void)translateBy:(RS3DObject *)self;
@end

@implementation RS3DObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->detection_source, 0);
  objc_storeStrong((id *)&self->edges_status, 0);
  objc_storeStrong((id *)&self->corners_status, 0);
  objc_storeStrong((id *)&self->embedding2d, 0);
  objc_storeStrong((id *)&self->logits, 0);
  objc_storeStrong((id *)&self->parent_id, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->type, 0);
  objc_storeStrong((id *)&self->_beautified_parts, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_boxesDict, 0);

  objc_storeStrong((id *)&self->_groups, 0);
}

- (NSDictionary)boxesDict
{
  return &self->_boxesDict->super;
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (NSDictionary)beautified_parts
{
  return &self->_beautified_parts->super;
}

- (NSDictionary)parts
{
  return &self->_parts->super;
}

- (int64_t)storyLevel
{
  return self->storyLevel;
}

- (BOOL)status
{
  return self->status;
}

- (__n128)color
{
  return a1[8];
}

- (NSArray)edges_status
{
  return self->edges_status;
}

- (NSArray)corners_status
{
  return self->corners_status;
}

- (NSArray)embedding2d
{
  return self->embedding2d;
}

- (NSArray)logits
{
  return self->logits;
}

- (float)confidence
{
  return self->confidence;
}

- (NSUUID)parent_id
{
  return self->parent_id;
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (NSString)type
{
  return self->type;
}

- (void)translateBy:(RS3DObject *)self
{
  float32x4_t v21 = v2;
  uint64_t v30 = *MEMORY[0x263EF8340];
  v22 = (NSMutableDictionary *)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v4 = self->_boxesDict;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v24, v29, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    v9 = (void *)MEMORY[0x263F8C100];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v12 = objc_msgSend_objectForKeyedSubscript_(self->_boxesDict, v6, v11, *(_OWORD *)&v21);
        int v13 = sub_25B47544C(v12, (uint64_t)v23);

        if (v13)
        {
          for (uint64_t j = 0; j != 8; ++j)
            v23[j] = (__n128)vaddq_f32((float32x4_t)v23[j], v21);
          v17 = sub_25B4454B4(v23, v14, v15);
          objc_msgSend_setObject_forKeyedSubscript_(v22, v18, (uint64_t)v17, v11);
        }
        else
        {
          sub_25B406B20(v9, (uint64_t)"[3DOD] Warning: The corner array is not valid to convert to box3d.", 66);
          std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
          v19 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
          ((void (*)(const std::locale::facet *, uint64_t))v19->__vftable[2].~facet_0)(v19, 10);
          std::locale::~locale(&v28);
          std::ostream::put();
          std::ostream::flush();
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v24, v29, 16);
    }
    while (v7);
  }

  boxesDict = self->_boxesDict;
  self->_boxesDict = v22;
}

- (void)rotateAlongZAxisRightHand:(float)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  __float2 v4 = __sincosf_stret(a3);
  v23 = (NSMutableDictionary *)objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = self->_boxesDict;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, v30, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    float32x4_t v22 = (float32x4_t)xmmword_25B5F10E0;
    v10 = (void *)MEMORY[0x263F8C100];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        int v13 = objc_msgSend_objectForKeyedSubscript_(self->_boxesDict, v7, v12, *(_OWORD *)&v22);
        int v14 = sub_25B47544C(v13, (uint64_t)v24);

        if (v14)
        {
          for (uint64_t j = 0; j != 8; ++j)
            v24[j] = (__n128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), COERCE_FLOAT(*(_OWORD *)&v24[j])), (float32x4_t)__PAIR64__(LODWORD(v4.__cosval), -v4.__sinval), (float32x2_t)v24[j].n128_u64[0], 1), v22, (float32x4_t)v24[j], 2);
          v18 = sub_25B4454B4(v24, v15, v16);
          objc_msgSend_setObject_forKeyedSubscript_(v23, v19, (uint64_t)v18, v12);
        }
        else
        {
          sub_25B406B20(v10, (uint64_t)"[3DOD] Warning: The corner array is not valid to convert to box3d.", 66);
          std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24)));
          v20 = std::locale::use_facet(&v29, MEMORY[0x263F8C108]);
          ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
          std::locale::~locale(&v29);
          std::ostream::put();
          std::ostream::flush();
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v25, v30, 16);
    }
    while (v8);
  }

  boxesDict = self->_boxesDict;
  self->_boxesDict = v23;
}

- (id)description
{
  float32x4_t v12 = 0u;
  float32x4_t v13 = 0u;
  float32x4_t v10 = 0u;
  float32x4_t v11 = 0u;
  objc_msgSend_getTransform_transform_(self, a2, @"rawdetection", &v10);
  float32x4_t v7 = vaddq_f32(v13, vmlaq_f32(vmlaq_f32(vmulq_f32(v10, (float32x4_t)0), (float32x4_t)0, v11), (float32x4_t)0, v12));
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  objc_msgSend_getDimension_dim_(self, v3, @"rawdetection", &v8);
  v5 = objc_msgSend_stringWithFormat_(NSString, v4, @"<RS3DObject %p> [id=%@ conf=%0.2f] %@ { position = < %.2f , %.2f , %.2f > dimension = < %.2f x %.2f x %.2f > color = < r=%.2f , g=%.2f , b=%.2f , a=%.2f > }", self, self->identifier, self->confidence, self->type, v7.f32[0], v7.f32[1], v7.f32[2], *(float *)&v8, *((float *)&v8 + 1), *(float *)&v9, *(float *)self->color, *(float *)&self->color[4], *(float *)&self->color[8], *(float *)&self->color[12]);

  return v5;
}

- (RS3DObject)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)RS3DObject;
  v5 = [(RS3DObject *)&v113 init];
  v6 = v5;
  objc_msgSend_objectForKeyedSubscript_(v4, v7, @"type");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = (NSString *)v8;
  }
  else {
    uint64_t v9 = 0;
  }

  if (!v9) {
    goto LABEL_25;
  }
  type = v5->type;
  v5->type = v9;
  float32x4_t v11 = v9;

  char v12 = sub_25B4761C0(v5->type);
  if ((v12 & 1) == 0) {
    goto LABEL_25;
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v13, @"detectionsource");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  uint64_t v15 = (objc_opt_isKindOfClass() & 1) != 0 ? (NSString *)v14 : 0;

  if (!v15) {
    goto LABEL_25;
  }
  detection_source = v5->detection_source;
  v5->detection_source = v15;
  v17 = v15;

  char v18 = sub_25B476358(v5->detection_source);
  if ((v18 & 1) == 0) {
    goto LABEL_25;
  }
  v20 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"identifier");
  if (!v20) {
    goto LABEL_25;
  }
  id v21 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v23 = objc_msgSend_initWithUUIDString_(v21, v22, (uint64_t)v20);
  identifier = v5->identifier;
  v5->identifier = (NSUUID *)v23;

  long long v26 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"parent_id");
  if (v26)
  {
    id v27 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v29 = objc_msgSend_initWithUUIDString_(v27, v28, (uint64_t)v26);
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v29;
  }
  else
  {
    parent_id = v5->parent_id;
    v5->parent_id = 0;
  }

  objc_msgSend_objectForKeyedSubscript_(v4, v31, @"status");
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v33 = (objc_opt_isKindOfClass() & 1) != 0 ? v32 : 0;

  if (!v33) {
    goto LABEL_25;
  }
  v5->status = objc_msgSend_BOOLValue(v33, v34, v35);

  objc_msgSend_objectForKeyedSubscript_(v4, v36, @"confidence");
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v38 = (objc_opt_isKindOfClass() & 1) != 0 ? v37 : 0;

  if (v38)
  {
    objc_msgSend_floatValue(v38, v39, v40);
    v5->confidence = v41;

    objc_msgSend_objectForKeyedSubscript_(v4, v42, @"logits");
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v44 = (NSArray *)v43;
    }
    else {
      v44 = 0;
    }

    logits = v5->logits;
    v5->logits = v44;

    if (!v5->logits)
    {
      uint64_t v49 = objc_opt_new();
      v50 = v5->logits;
      v5->logits = (NSArray *)v49;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v48, @"embedding2d");
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v52 = (NSArray *)v51;
    }
    else {
      v52 = 0;
    }

    embedding2d = v5->embedding2d;
    v5->embedding2d = v52;

    if (!v5->embedding2d)
    {
      uint64_t v55 = objc_opt_new();
      v56 = v5->embedding2d;
      v5->embedding2d = (NSArray *)v55;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v54, @"corners_status");
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v58 = (NSArray *)v57;
    }
    else {
      v58 = 0;
    }

    corners_status = v5->corners_status;
    v5->corners_status = v58;

    if (!v5->corners_status)
    {
      uint64_t v61 = objc_opt_new();
      v62 = v5->corners_status;
      v5->corners_status = (NSArray *)v61;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v60, @"edges_status");
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v64 = (NSArray *)v63;
    }
    else {
      v64 = 0;
    }

    edges_status = v5->edges_status;
    v5->edges_status = v64;

    if (!v5->edges_status)
    {
      uint64_t v67 = objc_opt_new();
      v68 = v5->edges_status;
      v5->edges_status = (NSArray *)v67;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v66, @"color");
    id v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v70 = v69;
    }
    else {
      id v70 = 0;
    }

    if (v70) {
      sub_25B476428(v70, v5->color);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v71, @"groups");
    id v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v73 = v72;
    }
    else {
      id v73 = 0;
    }

    uint64_t v76 = objc_msgSend_mutableCopy(v73, v74, v75);
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v76;

    if (!v5->_groups)
    {
      uint64_t v79 = objc_opt_new();
      v80 = v5->_groups;
      v5->_groups = (NSMutableDictionary *)v79;
    }
    v81 = objc_msgSend_objectForKeyedSubscript_(v4, v78, @"parts");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v84 = objc_msgSend_objectForKeyedSubscript_(v4, v83, @"parts");
      uint64_t v87 = objc_msgSend_mutableCopy(v84, v85, v86);
      parts = v6->_parts;
      v6->_parts = (NSMutableDictionary *)v87;
    }
    else
    {
      uint64_t v89 = objc_opt_new();
      v84 = v6->_parts;
      v6->_parts = (NSMutableDictionary *)v89;
    }

    v91 = objc_msgSend_objectForKeyedSubscript_(v4, v90, @"beautified_parts");
    objc_opt_class();
    char v92 = objc_opt_isKindOfClass();

    if (v92)
    {
      v94 = objc_msgSend_objectForKeyedSubscript_(v4, v93, @"beautified_parts");
      uint64_t v97 = objc_msgSend_mutableCopy(v94, v95, v96);
      beautified_parts = v6->_beautified_parts;
      v6->_beautified_parts = (NSMutableDictionary *)v97;
    }
    else
    {
      uint64_t v99 = objc_opt_new();
      v94 = v6->_beautified_parts;
      v6->_beautified_parts = (NSMutableDictionary *)v99;
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v100, @"boxes_dict");
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v102 = v101;
    }
    else {
      id v102 = 0;
    }

    uint64_t v105 = objc_msgSend_mutableCopy(v102, v103, v104);
    boxesDict = v6->_boxesDict;
    v6->_boxesDict = (NSMutableDictionary *)v105;

    if (!v6->_boxesDict)
    {
      uint64_t v108 = objc_opt_new();
      v109 = v6->_boxesDict;
      v6->_boxesDict = (NSMutableDictionary *)v108;
    }
    v110 = objc_msgSend_objectForKeyedSubscript_(v4, v107, @"story");
    v6->storyLevel = objc_msgSend_integerValue(v110, v111, v112);

    v45 = v6;
  }
  else
  {
LABEL_25:
    v45 = 0;
  }

  return v45;
}

- (RS3DObject)init
{
  v8.receiver = self;
  v8.super_class = (Class)RS3DObject;
  float32x4_t v2 = [(RS3DObject *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    groups = v2->_groups;
    v2->_groups = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    boxesDict = v2->_boxesDict;
    v2->_boxesDict = (NSMutableDictionary *)v5;

    v2->storyLevel = 0;
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  v56[4] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v5, (uint64_t)self->type, @"type");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v6, (uint64_t)self->detection_source, @"detectionsource");
  uint64_t v9 = objc_msgSend_UUIDString(self->identifier, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v10, (uint64_t)v9, @"identifier");

  float32x4_t v13 = objc_msgSend_UUIDString(self->parent_id, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"parent_id");

  *(float *)&double v15 = self->confidence;
  char v18 = objc_msgSend_numberWithFloat_(NSNumber, v16, v17, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, (uint64_t)v18, @"confidence");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v20, (uint64_t)self->logits, @"logits");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)self->embedding2d, @"embedding2d");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)self->corners_status, @"corners_status");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v23, (uint64_t)self->edges_status, @"edges_status");
  long long v25 = objc_msgSend_numberWithBool_(NSNumber, v24, self->status);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v26, (uint64_t)v25, @"status");

  long long v55 = *(_OWORD *)self->color;
  uint64_t v29 = objc_msgSend_numberWithFloat_(NSNumber, v27, v28);
  v56[0] = v29;
  HIDWORD(v30) = DWORD1(v55);
  LODWORD(v30) = DWORD1(v55);
  id v33 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v30);
  v56[1] = v33;
  v36 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, COERCE_DOUBLE(__PAIR64__(DWORD1(v55), DWORD2(v55))));
  v56[2] = v36;
  v39 = objc_msgSend_numberWithFloat_(NSNumber, v37, v38, COERCE_DOUBLE(__PAIR64__(DWORD1(v55), HIDWORD(v55))));
  v56[3] = v39;
  float v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v40, (uint64_t)v56, 4);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v42, (uint64_t)v41, @"color");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v43, (uint64_t)self->_groups, @"groups");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v44, (uint64_t)self->_parts, @"parts");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v45, (uint64_t)self->_beautified_parts, @"beautified_parts");
  if (objc_msgSend_count(self->_boxesDict, v46, v47)) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v48, (uint64_t)self->_boxesDict, @"boxes_dict");
  }
  uint64_t v49 = objc_msgSend_numberWithInteger_(NSNumber, v48, self->storyLevel);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v50, (uint64_t)v49, @"story");

  v53 = objc_msgSend_copy(v4, v51, v52);

  return v53;
}

- (BOOL)getTransform:(id)a3 transform:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_hasBoxesDict_(self, v7, (uint64_t)v6))
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_boxesDict, v8, (uint64_t)v6);
    int v10 = sub_25B47544C(v9, (uint64_t)v32);

    if (v10)
    {
      uint64_t v11 = 0;
      float32x4_t v12 = 0uLL;
      do
        float32x4_t v12 = vaddq_f32(v12, v32[v11++]);
      while (v11 != 8);
      uint64_t v13 = 0;
      float32x4_t v14 = vsubq_f32(v32[1], v32[2]);
      int32x4_t v15 = (int32x4_t)vmulq_f32(v14, v14);
      v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
      float32x2_t v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
      float32x4_t v18 = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
      float32x4_t v19 = vsubq_f32(v32[4], v32[0]);
      int32x4_t v20 = (int32x4_t)vmulq_f32(v19, v19);
      v20.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2), vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1))).u32[0];
      float32x2_t v21 = vrsqrte_f32((float32x2_t)v20.u32[0]);
      float32x2_t v22 = vmul_f32(v21, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v21, v21)));
      v23.i64[0] = 0x3E0000003E000000;
      v23.i64[1] = 0x3E0000003E000000;
      float32x4_t v24 = vmulq_n_f32(v19, vmul_f32(v22, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v22, v22))).f32[0]);
      int32x4_t v25 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL), vnegq_f32(v24)), v18, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), (int8x16_t)v24, 0xCuLL));
      int8x16_t v26 = vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL);
      v18.i32[3] = 0;
      v26.i32[3] = 0;
      v24.i32[3] = 0;
      float32x4_t v27 = vmulq_f32(v12, v23);
      v27.i32[3] = 1.0;
      v33[0] = v18;
      v33[1] = v26;
      v33[2] = v24;
      v33[3] = xmmword_25B5F12B0;
      do
      {
        v34[v13] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_25B5F1360, COERCE_FLOAT(v33[v13])), (float32x4_t)xmmword_25B5F1370, *(float32x2_t *)&v33[v13], 1), (float32x4_t)xmmword_25B5F10E0, (float32x4_t)v33[v13], 2), v27, (float32x4_t)v33[v13], 3);
        ++v13;
      }
      while (v13 != 4);
      long long v28 = v34[1];
      long long v29 = v34[2];
      long long v30 = v34[3];
      *(_OWORD *)a4 = v34[0];
      *((_OWORD *)a4 + 1) = v28;
      *((_OWORD *)a4 + 2) = v29;
      *((_OWORD *)a4 + 3) = v30;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)getDimension:(id)a3 dim:
{
  id v4 = v3;
  id v6 = a3;
  if (objc_msgSend_hasBoxesDict_(self, v7, (uint64_t)v6))
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_boxesDict, v8, (uint64_t)v6);
    int v10 = sub_25B47544C(v9, (uint64_t)&v19);

    if (v10)
    {
      float32x4_t v11 = vsubq_f32(v20, v21);
      float32x4_t v12 = vmulq_f32(v11, v11);
      float32x4_t v13 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1)));
      float32x4_t v14 = vsubq_f32(v19, v20);
      float32x4_t v15 = vmulq_f32(v14, v14);
      v13.f32[0] = sqrtf(v13.f32[0]);
      float32x4_t v16 = vsubq_f32(v19, v22);
      float32x4_t v17 = vmulq_f32(v16, v16);
      v13.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
      v13.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
      float32x4_t *v4 = v13;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    float32x4_t *v4 = 0u;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->type, @"type");
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->detection_source, @"detectionsource");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->identifier, @"identifier");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->parent_id, @"parent_id");
  *(float *)&double v9 = self->confidence;
  objc_msgSend_encodeFloat_forKey_(v4, v10, @"confidence", v9);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->logits, @"logits");
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->embedding2d, @"embedding2d");
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->corners_status, @"corners_status");
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->edges_status, @"edges_status");
  objc_msgSend_encodeBool_forKey_(v4, v15, self->status, @"status");
  long long v37 = *(_OWORD *)self->color;
  float32x4_t v18 = objc_msgSend_numberWithFloat_(NSNumber, v16, v17);
  v38[0] = v18;
  HIDWORD(v19) = DWORD1(v37);
  LODWORD(v19) = DWORD1(v37);
  float32x4_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v20, v21, v19);
  v38[1] = v22;
  int32x4_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v23, v24, COERCE_DOUBLE(__PAIR64__(DWORD1(v37), DWORD2(v37))));
  v38[2] = v25;
  long long v28 = objc_msgSend_numberWithFloat_(NSNumber, v26, v27, COERCE_DOUBLE(__PAIR64__(DWORD1(v37), HIDWORD(v37))));
  v38[3] = v28;
  long long v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v38, 4);

  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, @"color");
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)self->_groups, @"groups");
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)self->_parts, @"parts");
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)self->_beautified_parts, @"beautified_parts");
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)self->_boxesDict, @"boxes_dict");
  objc_msgSend_encodeInteger_forKey_(v4, v36, self->storyLevel, @"story");
}

- (RS3DObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)RS3DObject;
  uint64_t v5 = [(RS3DObject *)&v120 init];
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"type");
  type = v5->type;
  v5->type = (NSString *)v8;

  if ((sub_25B4761C0(v5->type) & 1) != 0
    && (uint64_t v10 = objc_opt_class(),
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"detectionsource"),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        detection_source = v5->detection_source,
        v5->detection_source = (NSString *)v12,
        detection_source,
        sub_25B476358(v5->detection_source)))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"identifier");
    identifier = v5->identifier;
    v5->identifier = (NSUUID *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"parent_id");
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v20;

    objc_msgSend_decodeFloatForKey_(v4, v22, @"confidence");
    v5->confidence = v23;
    v5->status = objc_msgSend_decodeBoolForKey_(v4, v24, @"status");
    uint64_t v25 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"logits");
    logits = v5->logits;
    v5->logits = (NSArray *)v27;

    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"embedding2d");
    embedding2d = v5->embedding2d;
    v5->embedding2d = (NSArray *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"corners_status");
    corners_status = v5->corners_status;
    v5->corners_status = (NSArray *)v35;

    uint64_t v37 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"edges_status");
    edges_status = v5->edges_status;
    v5->edges_status = (NSArray *)v39;

    float v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v45 = objc_msgSend_setWithObjects_(v41, v44, v42, v43, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"color");
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v47, v48, v49) == 4)
    {
      id v51 = objc_msgSend_objectAtIndexedSubscript_(v47, v50, 0);
      objc_msgSend_floatValue(v51, v52, v53);
      unsigned int v119 = v54;
      v56 = objc_msgSend_objectAtIndexedSubscript_(v47, v55, 1);
      objc_msgSend_floatValue(v56, v57, v58);
      unsigned int v118 = v59;
      uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(v47, v60, 2);
      objc_msgSend_floatValue(v61, v62, v63);
      unsigned int v117 = v64;
      v66 = objc_msgSend_objectAtIndexedSubscript_(v47, v65, 3);
      objc_msgSend_floatValue(v66, v67, v68);
      *(void *)&long long v69 = __PAIR64__(v118, v119);
      *((void *)&v69 + 1) = __PAIR64__(v70, v117);
      *(_OWORD *)v5->color = v69;
    }
    v71 = (void *)MEMORY[0x263EFFA08];
    uint64_t v72 = objc_opt_class();
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    uint64_t v75 = objc_opt_class();
    v77 = objc_msgSend_setWithObjects_(v71, v76, v72, v73, v74, v75, 0);

    uint64_t v79 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v78, (uint64_t)v77, @"groups");
    v82 = objc_msgSend_mutableCopy(v79, v80, v81);

    uint64_t v85 = objc_msgSend_mutableCopy(v82, v83, v84);
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v85;

    v88 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v87, (uint64_t)v77, @"parts");
    v91 = objc_msgSend_mutableCopy(v88, v89, v90);

    uint64_t v94 = objc_msgSend_mutableCopy(v91, v92, v93);
    parts = v5->_parts;
    v5->_parts = (NSMutableDictionary *)v94;

    uint64_t v97 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v96, (uint64_t)v77, @"beautified_parts");
    v100 = objc_msgSend_mutableCopy(v97, v98, v99);

    uint64_t v103 = objc_msgSend_mutableCopy(v100, v101, v102);
    beautified_parts = v5->_beautified_parts;
    v5->_beautified_parts = (NSMutableDictionary *)v103;

    v106 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v105, (uint64_t)v77, @"boxes_dict");
    v109 = objc_msgSend_mutableCopy(v106, v107, v108);

    uint64_t v112 = objc_msgSend_mutableCopy(v109, v110, v111);
    boxesDict = v5->_boxesDict;
    v5->_boxesDict = (NSMutableDictionary *)v112;

    v5->storyLevel = objc_msgSend_decodeIntegerForKey_(v4, v114, @"story");
    v115 = v5;
  }
  else
  {
    v115 = 0;
  }

  return v115;
}

- (BOOL)hasBoxesDict:(id)a3
{
  id v6 = a3;
  boxesDict = self->_boxesDict;
  if (boxesDict)
  {
    uint64_t v8 = objc_msgSend_allKeys(boxesDict, v4, v5);
    char v10 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v6);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RS3DObject);
  objc_storeStrong((id *)&v4->type, self->type);
  objc_storeStrong((id *)&v4->identifier, self->identifier);
  objc_storeStrong((id *)&v4->parent_id, self->parent_id);
  v4->confidence = self->confidence;
  uint64_t v7 = objc_msgSend_copy(self->logits, v5, v6);
  logits = v4->logits;
  v4->logits = (NSArray *)v7;

  uint64_t v11 = objc_msgSend_copy(self->embedding2d, v9, v10);
  embedding2d = v4->embedding2d;
  v4->embedding2d = (NSArray *)v11;

  objc_storeStrong((id *)&v4->corners_status, self->corners_status);
  objc_storeStrong((id *)&v4->edges_status, self->edges_status);
  *(_OWORD *)v4->color = *(_OWORD *)self->color;
  uint64_t v15 = objc_msgSend_mutableCopy(self->_groups, v13, v14);
  groups = v4->_groups;
  v4->_groups = (NSMutableDictionary *)v15;

  uint64_t v19 = objc_msgSend_mutableCopy(self->_parts, v17, v18);
  parts = v4->_parts;
  v4->_parts = (NSMutableDictionary *)v19;

  uint64_t v23 = objc_msgSend_mutableCopy(self->_beautified_parts, v21, v22);
  beautified_parts = v4->_beautified_parts;
  v4->_beautified_parts = (NSMutableDictionary *)v23;

  uint64_t v27 = objc_msgSend_mutableCopy(self->_boxesDict, v25, v26);
  boxesDict = v4->_boxesDict;
  v4->_boxesDict = (NSMutableDictionary *)v27;

  v4->status = self->status;
  objc_storeStrong((id *)&v4->detection_source, self->detection_source);
  return v4;
}

- (double)transform
{
  int hasBoxesDict = objc_msgSend_hasBoxesDict_(a1, a2, @"rawdetection");
  v5.i64[0] = 0;
  if (hasBoxesDict)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a1[2], v4, @"rawdetection", 0.0);
    int v7 = sub_25B47544C(v6, (uint64_t)&v33);

    float32x4_t v5 = 0uLL;
    if (v7)
    {
      for (uint64_t i = 0; i != 128; i += 16)
        float32x4_t v5 = vaddq_f32(v5, *(float32x4_t *)((char *)&v33 + i));
      v9.i64[0] = 0x3E0000003E000000;
      v9.i64[1] = 0x3E0000003E000000;
      uint32x4_t v10 = (uint32x4_t)vceqq_f32(v34, v35);
      v10.i32[3] = v10.i32[2];
      float32x4_t v11 = vmulq_f32(v5, v9);
      float32x4_t v12 = (float32x4_t)xmmword_25B5F1360;
      float32x4_t v13 = (float32x4_t)xmmword_25B5F1370;
      float32x4_t v14 = (float32x4_t)xmmword_25B5F10E0;
      if ((vminvq_u32(v10) & 0x80000000) == 0)
      {
        uint32x4_t v15 = (uint32x4_t)vceqq_f32(v33, v34);
        v15.i32[3] = v15.i32[2];
        unsigned int v16 = vminvq_u32(v15);
        float32x4_t v12 = (float32x4_t)xmmword_25B5F1360;
        float32x4_t v13 = (float32x4_t)xmmword_25B5F1370;
        float32x4_t v14 = (float32x4_t)xmmword_25B5F10E0;
        if ((v16 & 0x80000000) == 0)
        {
          uint32x4_t v17 = (uint32x4_t)vceqq_f32(v36, v33);
          v17.i32[3] = v17.i32[2];
          unsigned int v18 = vminvq_u32(v17);
          float32x4_t v12 = (float32x4_t)xmmword_25B5F1360;
          float32x4_t v13 = (float32x4_t)xmmword_25B5F1370;
          float32x4_t v14 = (float32x4_t)xmmword_25B5F10E0;
          if ((v18 & 0x80000000) == 0)
          {
            float32x4_t v19 = vsubq_f32(v34, v35);
            int32x4_t v20 = (int32x4_t)vmulq_f32(v19, v19);
            v20.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2), vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1))).u32[0];
            float32x2_t v21 = vrsqrte_f32((float32x2_t)v20.u32[0]);
            float32x2_t v22 = vmul_f32(v21, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v21, v21)));
            float32x4_t v12 = vmulq_n_f32(v19, vmul_f32(v22, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v22, v22))).f32[0]);
            float32x4_t v23 = vsubq_f32(v33, v34);
            int32x4_t v24 = (int32x4_t)vmulq_f32(v23, v23);
            v24.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2), vadd_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.i8, 1))).u32[0];
            float32x2_t v25 = vrsqrte_f32((float32x2_t)v24.u32[0]);
            float32x2_t v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(v25, v25)));
            float32x4_t v13 = vmulq_n_f32(v23, vmul_f32(v26, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(v26, v26))).f32[0]);
            float32x4_t v27 = vsubq_f32(v36, v33);
            int32x4_t v28 = (int32x4_t)vmulq_f32(v27, v27);
            v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
            float32x2_t v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
            float32x2_t v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
            float32x4_t v14 = vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]);
            v12.i32[3] = 0;
            v13.i32[3] = 0;
            v14.i32[3] = 0;
          }
        }
      }
      uint64_t v31 = 0;
      v11.i32[3] = 1.0;
      v37[0] = v12;
      v37[1] = v13;
      v37[2] = v14;
      v37[3] = xmmword_25B5F12B0;
      do
      {
        *(long long *)((char *)&v38 + v31 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_25B5F1360, COERCE_FLOAT(v37[v31])), (float32x4_t)xmmword_25B5F1370, *(float32x2_t *)&v37[v31], 1), (float32x4_t)xmmword_25B5F10E0, (float32x4_t)v37[v31], 2), v11, (float32x4_t)v37[v31], 3);
        ++v31;
      }
      while (v31 != 4);
      v5.i64[0] = v38;
    }
  }
  return *(double *)v5.i64;
}

- (__n64)dimensions
{
  int hasBoxesDict = objc_msgSend_hasBoxesDict_(a1, a2, @"rawdetection");
  result.n64_u64[0] = 0;
  if (hasBoxesDict)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a1[2], v4, @"rawdetection", 0.0);
    char v7 = sub_25B47544C(v6, (uint64_t)&v13);

    result.n64_u64[0] = 0;
    if (v7)
    {
      float32x4_t v8 = vsubq_f32(v14, v15);
      float32x4_t v9 = vmulq_f32(v8, v8);
      float32x4_t v10 = vsubq_f32(v13, v14);
      float32x4_t v11 = vmulq_f32(v10, v10);
      LODWORD(v12) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).u32[0];
      result.n64_f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]);
      result.n64_u32[1] = sqrtf(v12);
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end