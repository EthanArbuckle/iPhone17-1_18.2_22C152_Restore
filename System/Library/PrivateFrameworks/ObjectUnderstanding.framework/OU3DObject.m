@interface OU3DObject
+ (BOOL)supportsSecureCoding;
- (BOOL)getDimension:(id)a3 dim:;
- (BOOL)getTransform:(id)a3 transform:(id *)a4;
- (BOOL)hasBoxesDict:(id)a3;
- (BOOL)runIsValidType:(id)a3;
- (BOOL)status;
- (NSArray)corners_history;
- (NSArray)corners_status;
- (NSArray)edges_status;
- (NSArray)embedding2d;
- (NSArray)embedding3d;
- (NSArray)faces_status;
- (NSArray)logits;
- (NSArray)refined_box_history;
- (NSDictionary)boxesDict;
- (NSDictionary)groups;
- (NSDictionary)parts;
- (NSString)cadModelName;
- (NSString)detection_source;
- (NSString)type;
- (NSUUID)identifier;
- (NSUUID)parent_id;
- (OU3DObject)init;
- (OU3DObject)initWithCoder:(id)a3;
- (OU3DObject)initWithDictionaryRepresentation:(id)a3;
- (__n128)color;
- (__n64)dimensions;
- (double)transform;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)getFrameIndexOfLastRefine;
- (void)addBoxesDict:(const box3d *)a3 forDictKey:(id)a4;
- (void)addGroupId:(int)a3 forGroupType:(id)a4;
- (void)addObjectPartAttribute:(id)a3;
- (void)addRefinedBoxToHistory:(id)a3;
- (void)clearGroupInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeBoxesDict:(id)a3;
- (void)removeObjectPartAttribute:(id)a3;
- (void)setCadModelName:(id)a3;
- (void)setColor:(OU3DObject *)self;
- (void)setConfidence:(float)a3;
- (void)setCorners_history:(id)a3;
- (void)setCorners_status:(id)a3;
- (void)setDetection_source:(id)a3;
- (void)setEdges_status:(id)a3;
- (void)setEmbedding2d:(id)a3;
- (void)setEmbedding3d:(id)a3;
- (void)setFaces_status:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLogits:(id)a3;
- (void)setParent_id:(id)a3;
- (void)setParts:(id)a3;
- (void)setRefined_box_history:(id)a3;
- (void)setStatus:(BOOL)a3;
- (void)setType:(id)a3;
- (void)updateObjectEmbedding2d:(id)a3;
- (void)updateObjectEmbedding3d:(id)a3;
@end

@implementation OU3DObject

- (__n64)dimensions
{
  int v2 = [a1 hasBoxesDict:@"rawdetection"];
  result.n64_u64[0] = 0;
  if (v2)
  {
    objc_msgSend(a1[3], "objectForKeyedSubscript:", @"rawdetection", 0.0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    char v5 = box3dFromNSArray(v4, (box3d *)&v11);

    result.n64_u64[0] = 0;
    if (v5)
    {
      float32x4_t v6 = vsubq_f32(v12, v13);
      float32x4_t v7 = vmulq_f32(v6, v6);
      float32x4_t v8 = vsubq_f32(v11, v12);
      float32x4_t v9 = vmulq_f32(v8, v8);
      LODWORD(v10) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).u32[0];
      result.n64_f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
      result.n64_u32[1] = sqrtf(v10);
    }
  }
  return result;
}

- (double)transform
{
  int v2 = [a1 hasBoxesDict:@"rawdetection"];
  v3.i64[0] = 0;
  if (v2)
  {
    objc_msgSend(a1[3], "objectForKeyedSubscript:", @"rawdetection", 0.0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    int v5 = box3dFromNSArray(v4, (box3d *)v23);

    float32x4_t v3 = 0uLL;
    if (v5)
    {
      for (uint64_t i = 0; i != 8; ++i)
        float32x4_t v3 = vaddq_f32(v3, v23[i]);
      uint64_t v7 = 0;
      float32x4_t v8 = vsubq_f32(v23[1], v23[2]);
      int32x4_t v9 = (int32x4_t)vmulq_f32(v8, v8);
      v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
      float32x2_t v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
      float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
      float32x4_t v12 = vmulq_n_f32(v8, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v11, v11))).f32[0]);
      float32x4_t v13 = vsubq_f32(v23[4], v23[0]);
      int32x4_t v14 = (int32x4_t)vmulq_f32(v13, v13);
      v14.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2), vadd_f32(*(float32x2_t *)v14.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.i8, 1))).u32[0];
      float32x2_t v15 = vrsqrte_f32((float32x2_t)v14.u32[0]);
      float32x2_t v16 = vmul_f32(v15, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v15, v15)));
      v17.i64[0] = 0x3E0000003E000000;
      v17.i64[1] = 0x3E0000003E000000;
      float32x4_t v18 = vmulq_n_f32(v13, vmul_f32(v16, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v16, v16))).f32[0]);
      int32x4_t v19 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v18)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL));
      int8x16_t v20 = vextq_s8((int8x16_t)vuzp1q_s32(v19, v19), (int8x16_t)v19, 0xCuLL);
      v12.i32[3] = 0;
      v20.i32[3] = 0;
      v18.i32[3] = 0;
      float32x4_t v21 = vmulq_f32(v3, v17);
      v21.i32[3] = 1.0;
      v24[0] = v12;
      v24[1] = v20;
      v24[2] = v18;
      v24[3] = xmmword_237CB4480;
      do
      {
        *(long long *)((char *)&v25 + v7 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_237CB4490, COERCE_FLOAT(v24[v7])), (float32x4_t)xmmword_237CB44A0, *(float32x2_t *)&v24[v7], 1), (float32x4_t)xmmword_237CB44B0, (float32x4_t)v24[v7], 2), v21, (float32x4_t)v24[v7], 3);
        ++v7;
      }
      while (v7 != 4);
      v3.i64[0] = v25;
    }
  }
  return *(double *)v3.i64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 56), self->type);
  objc_storeStrong((id *)(v4 + 64), self->identifier);
  objc_storeStrong((id *)(v4 + 72), self->parent_id);
  *(float *)(v4 + 52) = self->confidence;
  uint64_t v5 = [(NSArray *)self->logits copy];
  float32x4_t v6 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v5;

  uint64_t v7 = [(NSArray *)self->embedding2d copy];
  float32x4_t v8 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v7;

  uint64_t v9 = [(NSArray *)self->embedding3d copy];
  float32x2_t v10 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v9;

  objc_storeStrong((id *)(v4 + 104), self->corners_status);
  objc_storeStrong((id *)(v4 + 112), self->edges_status);
  *(_OWORD *)(v4 + 144) = *(_OWORD *)self->color;
  uint64_t v11 = [(NSMutableDictionary *)self->_groups mutableCopy];
  float32x4_t v12 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v11;

  uint64_t v13 = [(NSMutableDictionary *)self->_parts mutableCopy];
  int32x4_t v14 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v13;

  uint64_t v15 = [(NSMutableDictionary *)self->_boxesDict mutableCopy];
  float32x2_t v16 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v15;

  *(unsigned char *)(v4 + 48) = self->status;
  objc_storeStrong((id *)(v4 + 128), self->detection_source);
  objc_storeStrong((id *)(v4 + 136), self->cadModelName);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OU3DObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)OU3DObject;
  uint64_t v5 = [(OU3DObject *)&v50 init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  type = v5->type;
  v5->type = (NSString *)v6;

  if ((isValidType(v5->type) & 1) != 0
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"detectionsource"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        detection_source = v5->detection_source,
        v5->detection_source = (NSString *)v8,
        detection_source,
        isValidODSourceType(v5->detection_source)))
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->identifier;
    v5->identifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parent_id"];
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v12;

    [v4 decodeFloatForKey:@"confidence"];
    v5->confidence = v14;
    v5->status = [v4 decodeBoolForKey:@"status"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logits"];
    logits = v5->logits;
    v5->logits = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embedding2d"];
    embedding2d = v5->embedding2d;
    v5->embedding2d = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embedding3d"];
    embedding3d = v5->embedding3d;
    v5->embedding3d = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"corners_status"];
    corners_status = v5->corners_status;
    v5->corners_status = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edges_status"];
    edges_status = v5->edges_status;
    v5->edges_status = (NSArray *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    *(_OWORD *)v5->color = *(_OWORD *)[v25 bytes];
    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v29 = (void *)MEMORY[0x263EFFA08];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);

    v34 = [v4 decodeObjectOfClasses:v33 forKey:@"groups"];
    v35 = (void *)[v34 mutableCopy];

    uint64_t v36 = [v35 mutableCopy];
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v36;

    v38 = [v4 decodeObjectOfClasses:v33 forKey:@"parts"];
    v39 = (void *)[v38 mutableCopy];

    uint64_t v40 = [v39 mutableCopy];
    parts = v5->_parts;
    v5->_parts = (NSMutableDictionary *)v40;

    v42 = [v4 decodeObjectOfClasses:v33 forKey:@"boxes_dict"];
    v43 = (void *)[v42 mutableCopy];

    uint64_t v44 = [v43 mutableCopy];
    boxesDict = v5->_boxesDict;
    v5->_boxesDict = (NSMutableDictionary *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cadmodelname"];
    cadModelName = v5->cadModelName;
    v5->cadModelName = (NSString *)v46;

    v48 = v5;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->type forKey:@"type"];
  [v6 encodeObject:self->detection_source forKey:@"detectionsource"];
  [v6 encodeObject:self->identifier forKey:@"identifier"];
  [v6 encodeObject:self->parent_id forKey:@"parent_id"];
  *(float *)&double v4 = self->confidence;
  [v6 encodeFloat:@"confidence" forKey:v4];
  [v6 encodeObject:self->logits forKey:@"logits"];
  [v6 encodeObject:self->embedding2d forKey:@"embedding2d"];
  [v6 encodeObject:self->embedding3d forKey:@"embedding3d"];
  [v6 encodeObject:self->corners_status forKey:@"corners_status"];
  [v6 encodeObject:self->edges_status forKey:@"edges_status"];
  [v6 encodeBool:self->status forKey:@"status"];
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:self->color length:16];
  [v6 encodeObject:v5 forKey:@"color"];
  [v6 encodeObject:self->_groups forKey:@"groups"];
  [v6 encodeObject:self->_parts forKey:@"parts"];
  [v6 encodeObject:self->_boxesDict forKey:@"boxes_dict"];
  [v6 encodeObject:self->cadModelName forKey:@"cadmodelname"];
}

- (BOOL)hasBoxesDict:(id)a3
{
  id v4 = a3;
  boxesDict = self->_boxesDict;
  if (boxesDict)
  {
    id v6 = [(NSMutableDictionary *)boxesDict allKeys];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)getDimension:(id)a3 dim:
{
  id v4 = v3;
  id v6 = a3;
  if ([(OU3DObject *)self hasBoxesDict:v6])
  {
    char v7 = [(NSMutableDictionary *)self->_boxesDict objectForKeyedSubscript:v6];
    int v8 = box3dFromNSArray(v7, (box3d *)&v17);

    if (v8)
    {
      float32x4_t v9 = vsubq_f32(v18, v19);
      float32x4_t v10 = vmulq_f32(v9, v9);
      float32x4_t v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1)));
      float32x4_t v12 = vsubq_f32(v17, v18);
      float32x4_t v13 = vmulq_f32(v12, v12);
      v11.f32[0] = sqrtf(v11.f32[0]);
      float32x4_t v14 = vsubq_f32(v17, v20);
      float32x4_t v15 = vmulq_f32(v14, v14);
      v11.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0]);
      v11.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
      float32x4_t *v4 = v11;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    float32x4_t *v4 = 0u;
  }

  return v8;
}

- (BOOL)getTransform:(id)a3 transform:(id *)a4
{
  id v6 = a3;
  if ([(OU3DObject *)self hasBoxesDict:v6])
  {
    char v7 = [(NSMutableDictionary *)self->_boxesDict objectForKeyedSubscript:v6];
    int v8 = box3dFromNSArray(v7, (box3d *)&v31);

    if (v8)
    {
      uint64_t v9 = 0;
      float32x4_t v10 = 0uLL;
      do
      {
        float32x4_t v10 = vaddq_f32(v10, *(float32x4_t *)((char *)&v31 + v9));
        v9 += 16;
      }
      while (v9 != 128);
      uint64_t v11 = 0;
      float32x4_t v12 = vsubq_f32(v32, v33);
      int32x4_t v13 = (int32x4_t)vmulq_f32(v12, v12);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      float32x2_t v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      float32x4_t v16 = vmulq_n_f32(v12, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
      float32x4_t v17 = vsubq_f32(v31, v32);
      int32x4_t v18 = (int32x4_t)vmulq_f32(v17, v17);
      v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
      float32x2_t v19 = vrsqrte_f32((float32x2_t)v18.u32[0]);
      float32x2_t v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v19, v19)));
      float32x4_t v21 = vmulq_n_f32(v17, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20))).f32[0]);
      float32x4_t v22 = vsubq_f32(v34, v31);
      int32x4_t v23 = (int32x4_t)vmulq_f32(v22, v22);
      v23.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2), vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.i8, 1))).u32[0];
      *(float32x2_t *)v18.i8 = vrsqrte_f32((float32x2_t)v23.u32[0]);
      *(float32x2_t *)v18.i8 = vmul_f32(*(float32x2_t *)v18.i8, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(*(float32x2_t *)v18.i8, *(float32x2_t *)v18.i8)));
      v24.i64[0] = 0x3E0000003E000000;
      v24.i64[1] = 0x3E0000003E000000;
      float32x4_t v25 = vmulq_n_f32(v22, vmul_f32(*(float32x2_t *)v18.i8, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(*(float32x2_t *)v18.i8, *(float32x2_t *)v18.i8))).f32[0]);
      v16.i32[3] = 0;
      v21.i32[3] = 0;
      v25.i32[3] = 0;
      float32x4_t v26 = vmulq_f32(v10, v24);
      v26.i32[3] = 1.0;
      v35[0] = v16;
      v35[1] = v21;
      v35[2] = v25;
      v35[3] = xmmword_237CB4480;
      do
      {
        v36[v11] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_237CB4490, COERCE_FLOAT(v35[v11])), (float32x4_t)xmmword_237CB44A0, *(float32x2_t *)&v35[v11], 1), (float32x4_t)xmmword_237CB44B0, (float32x4_t)v35[v11], 2), v26, (float32x4_t)v35[v11], 3);
        ++v11;
      }
      while (v11 != 4);
      long long v27 = v36[1];
      long long v28 = v36[2];
      long long v29 = v36[3];
      *(_OWORD *)a4 = v36[0];
      *((_OWORD *)a4 + 1) = v27;
      *((_OWORD *)a4 + 2) = v28;
      *((_OWORD *)a4 + 3) = v29;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  v19[4] = *MEMORY[0x263EF8340];
  float32x4_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->type forKeyedSubscript:@"type"];
  [v3 setObject:self->detection_source forKeyedSubscript:@"detectionsource"];
  id v4 = [(NSUUID *)self->identifier UUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  parent_id = self->parent_id;
  if (parent_id)
  {
    id v6 = [(NSUUID *)self->parent_id UUIDString];
  }
  else
  {
    id v6 = 0;
  }
  [v3 setObject:v6 forKeyedSubscript:@"parent_id"];
  if (parent_id) {

  }
  *(float *)&double v7 = self->confidence;
  int v8 = [NSNumber numberWithFloat:v7];
  [v3 setObject:v8 forKeyedSubscript:@"confidence"];

  [v3 setObject:self->logits forKeyedSubscript:@"logits"];
  [v3 setObject:self->embedding2d forKeyedSubscript:@"embedding2d"];
  [v3 setObject:self->embedding3d forKeyedSubscript:@"embedding3d"];
  [v3 setObject:self->corners_status forKeyedSubscript:@"corners_status"];
  [v3 setObject:self->edges_status forKeyedSubscript:@"edges_status"];
  uint64_t v9 = [NSNumber numberWithBool:self->status];
  [v3 setObject:v9 forKeyedSubscript:@"status"];

  long long v18 = *(_OWORD *)self->color;
  float32x4_t v10 = objc_msgSend(NSNumber, "numberWithFloat:");
  v19[0] = v10;
  HIDWORD(v11) = DWORD1(v18);
  LODWORD(v11) = DWORD1(v18);
  float32x4_t v12 = [NSNumber numberWithFloat:v11];
  v19[1] = v12;
  int32x4_t v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v18), DWORD2(v18))));
  v19[2] = v13;
  float32x2_t v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v18), HIDWORD(v18))));
  v19[3] = v14;
  float32x2_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  [v3 setObject:v15 forKeyedSubscript:@"color"];
  [v3 setObject:self->_groups forKeyedSubscript:@"groups"];
  [v3 setObject:self->_parts forKeyedSubscript:@"parts"];
  if ([(NSMutableDictionary *)self->_boxesDict count]) {
    [v3 setObject:self->_boxesDict forKeyedSubscript:@"boxes_dict"];
  }
  [v3 setObject:self->cadModelName forKeyedSubscript:@"cadmodelname"];
  float32x4_t v16 = (void *)[v3 copy];

  return v16;
}

- (OU3DObject)init
{
  v17.receiver = self;
  v17.super_class = (Class)OU3DObject;
  int v2 = [(OU3DObject *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    groups = v2->_groups;
    v2->_groups = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    parts = v2->_parts;
    v2->_parts = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    boxesDict = v2->_boxesDict;
    v2->_boxesDict = (NSMutableDictionary *)v7;

    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    corners_history = v2->_corners_history;
    v2->_corners_history = v9;

    double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    refined_box_history = v2->_refined_box_history;
    v2->_refined_box_history = v11;

    int v13 = 8;
    do
    {
      float32x2_t v14 = objc_alloc_init(OU3DObjectCorner);
      [(NSMutableArray *)v2->_corners_history addObject:v14];

      --v13;
    }
    while (v13);
    cadModelName = v2->cadModelName;
    v2->cadModelName = 0;
  }
  return v2;
}

- (OU3DObject)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)OU3DObject;
  uint64_t v5 = [(OU3DObject *)&v75 init];
  id v6 = v5;
  id v7 = [v4 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = (NSString *)v7;
  }
  else {
    int v8 = 0;
  }

  if (!v8) {
    goto LABEL_39;
  }
  type = v5->type;
  v5->type = v8;
  float32x4_t v10 = v8;

  char valid = isValidType(v5->type);
  if ((valid & 1) == 0) {
    goto LABEL_39;
  }
  id v12 = [v4 objectForKeyedSubscript:@"detectionsource"];
  objc_opt_class();
  int v13 = (objc_opt_isKindOfClass() & 1) != 0 ? (NSString *)v12 : 0;

  if (!v13) {
    goto LABEL_39;
  }
  detection_source = v5->detection_source;
  v5->detection_source = v13;
  float32x2_t v15 = v13;

  char v16 = isValidODSourceType(v5->detection_source);
  if ((v16 & 1) == 0) {
    goto LABEL_39;
  }
  objc_super v17 = [v4 objectForKeyedSubscript:@"identifier"];
  if (!v17) {
    goto LABEL_39;
  }
  uint64_t v18 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v17];
  identifier = v5->identifier;
  v5->identifier = (NSUUID *)v18;

  float32x2_t v20 = [v4 objectForKeyedSubscript:@"parent_id"];
  if (v20)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v20];
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v21;
  }
  else
  {
    parent_id = v5->parent_id;
    v5->parent_id = 0;
  }

  id v23 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  id v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;

  if (!v24) {
    goto LABEL_39;
  }
  v5->status = [v24 BOOLValue];

  float32x4_t v25 = [v4 objectForKeyedSubscript:@"confidence"];
  float32x4_t v26 = objc_cast<NSNumber>(v25);

  if (v26)
  {
    [v26 floatValue];
    v5->confidence = v27;

    long long v28 = [v4 objectForKeyedSubscript:@"logits"];
    uint64_t v29 = objc_cast<NSArray<NSNumber *>>(v28);
    logits = v5->logits;
    v5->logits = (NSArray *)v29;

    if (!v5->logits)
    {
      uint64_t v31 = objc_opt_new();
      float32x4_t v32 = v5->logits;
      v5->logits = (NSArray *)v31;
    }
    float32x4_t v33 = [v4 objectForKeyedSubscript:@"embedding2d"];
    uint64_t v34 = objc_cast<NSArray<NSArray*<NSNumber *>>>(v33);
    embedding2d = v5->embedding2d;
    v5->embedding2d = (NSArray *)v34;

    if (!v5->embedding2d)
    {
      uint64_t v36 = objc_opt_new();
      v37 = v5->embedding2d;
      v5->embedding2d = (NSArray *)v36;
    }
    v38 = [v4 objectForKeyedSubscript:@"embedding3d"];
    uint64_t v39 = objc_cast<NSArray<NSNumber *>>(v38);
    embedding3d = v5->embedding3d;
    v5->embedding3d = (NSArray *)v39;

    if (!v5->embedding3d)
    {
      uint64_t v41 = objc_opt_new();
      v42 = v5->embedding3d;
      v5->embedding3d = (NSArray *)v41;
    }
    v43 = [v4 objectForKeyedSubscript:@"corners_status"];
    uint64_t v44 = objc_cast<NSArray<NSNumber *>>(v43);
    corners_status = v5->corners_status;
    v5->corners_status = (NSArray *)v44;

    if (!v5->corners_status)
    {
      uint64_t v46 = objc_opt_new();
      v47 = v5->corners_status;
      v5->corners_status = (NSArray *)v46;
    }
    v48 = [v4 objectForKeyedSubscript:@"edges_status"];
    uint64_t v49 = objc_cast<NSArray<NSNumber *>>(v48);
    edges_status = v5->edges_status;
    v5->edges_status = (NSArray *)v49;

    if (!v5->edges_status)
    {
      uint64_t v51 = objc_opt_new();
      v52 = v5->edges_status;
      v5->edges_status = (NSArray *)v51;
    }
    v53 = [v4 objectForKeyedSubscript:@"color"];
    v54 = objc_cast<NSArray>(v53);

    if (v54) {
      float4FromNSArray(v54, v5->color);
    }

    v55 = [v4 objectForKeyedSubscript:@"groups"];
    uint64_t v56 = objc_cast<NSMutableDictionary>(v55);
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v56;

    if (!v5->_groups)
    {
      uint64_t v58 = objc_opt_new();
      v59 = v5->_groups;
      v5->_groups = (NSMutableDictionary *)v58;
    }
    v60 = [v4 objectForKeyedSubscript:@"parts"];
    uint64_t v61 = objc_cast<NSMutableDictionary>(v60);
    parts = v5->_parts;
    v5->_parts = (NSMutableDictionary *)v61;

    if (!v5->_parts)
    {
      uint64_t v63 = objc_opt_new();
      v64 = v5->_parts;
      v5->_parts = (NSMutableDictionary *)v63;
    }
    v65 = [v4 objectForKeyedSubscript:@"boxes_dict"];
    uint64_t v66 = objc_cast<NSMutableDictionary>(v65);
    boxesDict = v5->_boxesDict;
    v5->_boxesDict = (NSMutableDictionary *)v66;

    if (!v5->_boxesDict)
    {
      uint64_t v68 = objc_opt_new();
      v69 = v5->_boxesDict;
      v5->_boxesDict = (NSMutableDictionary *)v68;
    }
    v70 = [v4 objectForKeyedSubscript:@"cadmodelname"];
    uint64_t v71 = objc_cast<NSString>(v70);
    cadModelName = v5->cadModelName;
    v5->cadModelName = (NSString *)v71;

    v73 = v5;
  }
  else
  {
LABEL_39:
    v73 = 0;
  }

  return v73;
}

- (id)description
{
  float32x4_t v17 = 0u;
  float32x4_t v18 = 0u;
  float32x4_t v15 = 0u;
  float32x4_t v16 = 0u;
  [(OU3DObject *)self getTransform:@"rawdetection" transform:&v15];
  float32x4_t v9 = v15;
  float32x4_t v11 = v16;
  float32x4_t v12 = v18;
  float32x4_t v13 = v17;
  long long v14 = 0uLL;
  [(OU3DObject *)self getDimension:@"rawdetection" dim:&v14];
  long long v10 = v14;
  uint64_t v3 = NSString;
  id v4 = [(NSUUID *)self->identifier UUIDString];
  uint64_t v5 = [v4 UTF8String];
  float32x4_t v6 = vaddq_f32(v12, vmlaq_f32(vmlaq_f32(vmulq_f32(v9, (float32x4_t)0), (float32x4_t)0, v11), (float32x4_t)0, v13));
  id v7 = [v3 stringWithFormat:@"<OU3DObject> [id=%s conf=%0.2f] %@ { position = < %.2f, %.2f, %.2f > dimension = < %.2f x %.2f x %.2f > color = < r=%.2f, g=%.2f, b=%.2f, a=%.2f > }", v5, self->confidence, self->type, v6.f32[0], v6.f32[1], v6.f32[2], *(float *)&v10, *((float *)&v10 + 1), *((float *)&v10 + 2), *(float *)self->color, *(float *)&self->color[4], *(float *)&self->color[8], *(float *)&self->color[12]];

  return v7;
}

- (void)addGroupId:(int)a3 forGroupType:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = (NSString *)a4;
  if (isValidGroupType(v7))
  {
    float32x4_t v6 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)self->_groups setObject:v6 forKeyedSubscript:v7];
  }
}

- (void)addBoxesDict:(const box3d *)a3 forDictKey:(id)a4
{
  v16[8] = *MEMORY[0x263EF8340];
  id v15 = a4;
  float32x4_t v6 = float3ToNSArray(*(__n128 *)a3);
  v16[0] = v6;
  id v7 = float3ToNSArray(*((__n128 *)a3 + 1));
  v16[1] = v7;
  int v8 = float3ToNSArray(*((__n128 *)a3 + 2));
  v16[2] = v8;
  float32x4_t v9 = float3ToNSArray(*((__n128 *)a3 + 3));
  v16[3] = v9;
  long long v10 = float3ToNSArray(*((__n128 *)a3 + 4));
  v16[4] = v10;
  float32x4_t v11 = float3ToNSArray(*((__n128 *)a3 + 5));
  v16[5] = v11;
  float32x4_t v12 = float3ToNSArray(*((__n128 *)a3 + 6));
  v16[6] = v12;
  float32x4_t v13 = float3ToNSArray(*((__n128 *)a3 + 7));
  v16[7] = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:8];

  [(NSMutableDictionary *)self->_boxesDict setObject:v14 forKeyedSubscript:v15];
}

- (void)addObjectPartAttribute:(id)a3
{
  id v5 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  [(NSMutableDictionary *)self->_parts setObject:v4 forKeyedSubscript:v5];
}

- (void)removeObjectPartAttribute:(id)a3
{
}

- (void)addRefinedBoxToHistory:(id)a3
{
}

- (void)updateObjectEmbedding2d:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->embedding2d count])
  {
    int v8 = objc_opt_new();
    float32x2_t v20 = (void *)[v4 mutableCopy];
    [v8 addObject:v20];

    uint64_t v21 = (NSArray *)[v8 copy];
LABEL_14:
    embedding2d = self->embedding2d;
    self->embedding2d = v21;

    goto LABEL_15;
  }
  id v5 = [(NSArray *)self->embedding2d objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count];

  if (v6 == v7)
  {
    int v8 = (void *)[(NSArray *)self->embedding2d mutableCopy];
    for (unint64_t i = 0; [v4 count] > i; ++i)
    {
      long long v10 = [v8 objectAtIndexedSubscript:0];
      float32x4_t v11 = [v10 objectAtIndex:i];
      [v11 floatValue];
      float v13 = v12;

      long long v14 = [v4 objectAtIndex:i];
      [v14 floatValue];
      float v16 = v15;

      float32x4_t v17 = [v8 objectAtIndexedSubscript:0];
      if (v13 >= v16) {
        *(float *)&double v18 = v13;
      }
      else {
        *(float *)&double v18 = v16;
      }
      float32x2_t v19 = [NSNumber numberWithFloat:v18];
      [v17 replaceObjectAtIndex:i withObject:v19];
    }
    uint64_t v21 = (NSArray *)[v8 copy];
    goto LABEL_14;
  }
  float32x4_t v22 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[OU3DObject updateObjectEmbedding2d:](v22);
  }

LABEL_15:
}

- (void)updateObjectEmbedding3d:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->embedding3d count]
    && (NSUInteger v5 = -[NSArray count](self->embedding3d, "count"), v5 != [v4 count]))
  {
    int v8 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[OU3DObject updateObjectEmbedding3d:](v8);
    }
  }
  else
  {
    uint64_t v6 = (NSArray *)[v4 mutableCopy];
    embedding3d = self->embedding3d;
    self->embedding3d = v6;
  }
}

- (int)getFrameIndexOfLastRefine
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_refined_box_history count]) {
    return -1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(NSMutableArray *)self->_refined_box_history reverseObjectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v8 = [v7 refinedBox];
        if (v8)
        {
          float32x4_t v9 = [v7 refinedBox];
          BOOL v10 = [v9 count] == 8;

          if (v10)
          {
            int v11 = [v7 frameIndex];
            goto LABEL_14;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int v11 = -1;
LABEL_14:

  return v11;
}

- (void)removeBoxesDict:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_boxesDict, "objectForKey:");

  if (v4) {
    [(NSMutableDictionary *)self->_boxesDict removeObjectForKey:v5];
  }
}

- (void)clearGroupInfo:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (isValidGroupType(v4)) {
    [(NSMutableDictionary *)self->_groups setObject:0 forKeyedSubscript:v4];
  }
}

- (NSString)type
{
  return self->type;
}

- (void)setType:(id)a3
{
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)parent_id
{
  return self->parent_id;
}

- (void)setParent_id:(id)a3
{
}

- (float)confidence
{
  return self->confidence;
}

- (void)setConfidence:(float)a3
{
  self->confidence = a3;
}

- (NSArray)logits
{
  return self->logits;
}

- (void)setLogits:(id)a3
{
}

- (NSArray)embedding2d
{
  return self->embedding2d;
}

- (void)setEmbedding2d:(id)a3
{
}

- (NSArray)embedding3d
{
  return self->embedding3d;
}

- (void)setEmbedding3d:(id)a3
{
}

- (NSArray)corners_status
{
  return self->corners_status;
}

- (void)setCorners_status:(id)a3
{
}

- (NSArray)edges_status
{
  return self->edges_status;
}

- (void)setEdges_status:(id)a3
{
}

- (NSArray)faces_status
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFaces_status:(id)a3
{
}

- (__n128)color
{
  return a1[9];
}

- (void)setColor:(OU3DObject *)self
{
  *(_OWORD *)self->color = v2;
}

- (BOOL)status
{
  return self->status;
}

- (void)setStatus:(BOOL)a3
{
  self->status = a3;
}

- (NSString)detection_source
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDetection_source:(id)a3
{
}

- (NSString)cadModelName
{
  return self->cadModelName;
}

- (void)setCadModelName:(id)a3
{
}

- (NSDictionary)parts
{
  return &self->_parts->super;
}

- (void)setParts:(id)a3
{
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (NSDictionary)boxesDict
{
  return &self->_boxesDict->super;
}

- (NSArray)corners_history
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCorners_history:(id)a3
{
}

- (NSArray)refined_box_history
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRefined_box_history:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cadModelName, 0);
  objc_storeStrong((id *)&self->detection_source, 0);
  objc_storeStrong((id *)&self->faces_status, 0);
  objc_storeStrong((id *)&self->edges_status, 0);
  objc_storeStrong((id *)&self->corners_status, 0);
  objc_storeStrong((id *)&self->embedding3d, 0);
  objc_storeStrong((id *)&self->embedding2d, 0);
  objc_storeStrong((id *)&self->logits, 0);
  objc_storeStrong((id *)&self->parent_id, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->type, 0);
  objc_storeStrong((id *)&self->_refined_box_history, 0);
  objc_storeStrong((id *)&self->_corners_history, 0);
  objc_storeStrong((id *)&self->_boxesDict, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (BOOL)runIsValidType:(id)a3
{
  return isValidType((NSString *)a3);
}

- (void)updateObjectEmbedding2d:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "The 2d object embedding has inconsistent dimensions.", v1, 2u);
}

- (void)updateObjectEmbedding3d:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "The 3d object embedding has inconsistent dimensions.", v1, 2u);
}

@end