@interface RS3DSurface
+ (BOOL)supportsSecureCoding;
- ($81BC4F67AE51AE63E6197C77945FA58C)edgeStates;
- ($B105B208EB85D2C79E2C4B589F71A8CA)edgeConfidence;
- (BOOL)fillWithDictionaryRepresentation:(id)a3;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (RS3DSurface)init;
- (RS3DSurface)initWithCoder:(id)a3;
- (RS3DSurface)initWithDictionaryRepresentation:(id)a3;
- (RS3DSurface)initWithDictionaryRepresentation:(id)a3 WithGroupId:(unsigned int)a4;
- (__n128)color;
- (__n128)initWithQuad:(__n128)a3 withConfidence:(__n128)a4 withColor:(__n128)a5 withGroupId:(float)a6 withType:(__n128)a7;
- (char)individualUpdate;
- (const)polygonEdgeConfidence;
- (const)polygonEdgeSides;
- (const)polygonEdgeStates;
- (double)dimensions;
- (double)quad;
- (double)transform;
- (float)confidence;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)storyLevel;
- (uint64_t)polygon;
- (unint64_t)polygonSize;
- (unsigned)getGroupId;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)rotateAlongZAxisRightHand:(float)a3;
- (void)translateBy:(RS3DSurface *)self;
@end

@implementation RS3DSurface

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->parentIdentifier, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  begin = self->_polygonEdgeSides.__begin_;
  if (begin)
  {
    self->_polygonEdgeSides.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_polygonEdgeConfidence.__begin_;
  if (v4)
  {
    self->_polygonEdgeConfidence.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_polygonEdgeStates.__begin_;
  if (v5)
  {
    self->_polygonEdgeStates.__end_ = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(void *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (int64_t)storyLevel
{
  return self->storyLevel;
}

- (char)individualUpdate
{
  return self->individualUpdate;
}

- ($B105B208EB85D2C79E2C4B589F71A8CA)edgeConfidence
{
  float v2 = self->edgeConfidence.confidence[0];
  float v3 = self->edgeConfidence.confidence[1];
  float v4 = self->edgeConfidence.confidence[2];
  float v5 = self->edgeConfidence.confidence[3];
  result.var0[3] = v5;
  result.var0[2] = v4;
  result.var0[1] = v3;
  result.var0[0] = v2;
  return result;
}

- ($81BC4F67AE51AE63E6197C77945FA58C)edgeStates
{
  return ($81BC4F67AE51AE63E6197C77945FA58C)self->edgeStates;
}

- (NSUUID)parentIdentifier
{
  return self->parentIdentifier;
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (unsigned)type
{
  return self->type;
}

- (__n128)color
{
  return a1[12];
}

- (float)confidence
{
  return self->confidence;
}

- (double)quad
{
  objc_copyStruct(&v2, (const void *)(a1 + 272), 64, 1, 0);
  return *(double *)&v2;
}

- (unsigned)getGroupId
{
  return self->groupId;
}

- (void)translateBy:(RS3DSurface *)self
{
  for (uint64_t i = 0; i != 64; i += 16)
    *(float32x4_t *)((char *)&self[1].super.isa + i) = vaddq_f32(*(float32x4_t *)((char *)&self[1].super.isa + i), v2);
  uint64_t v4 = *(void *)self->_anon_8;
  if (*(void *)&self->_anon_8[8] != v4)
  {
    unint64_t v5 = 0;
    do
    {
      *(float32x4_t *)(v4 + 16 * v5) = vaddq_f32(*(float32x4_t *)(v4 + 16 * v5), v2);
      ++v5;
      uint64_t v4 = *(void *)self->_anon_8;
    }
    while (v5 < (*(void *)&self->_anon_8[8] - v4) >> 4);
  }
}

- (void)rotateAlongZAxisRightHand:(float)a3
{
  __float2 v4 = __sincosf_stret(a3);
  uint64_t v5 = 0;
  v6.i64[1] = 0;
  v6.f32[0] = -v4.__sinval;
  v6.i32[1] = LODWORD(v4.__cosval);
  do
  {
    *(float32x4_t *)((char *)&self[1].super.isa + v5) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), COERCE_FLOAT(*(_OWORD *)((char *)&self[1].super.isa + v5))), v6, *(float32x2_t *)((char *)&self[1].super.isa + v5), 1), (float32x4_t)xmmword_25B5F10E0, *(float32x4_t *)((char *)&self[1].super.isa + v5), 2);
    v5 += 16;
  }
  while (v5 != 64);
  uint64_t v7 = *(void *)self->_anon_8;
  if (*(void *)&self->_anon_8[8] != v7)
  {
    unint64_t v8 = 0;
    do
    {
      *(float32x4_t *)(v7 + 16 * v8) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), COERCE_FLOAT(*(_OWORD *)(v7 + 16 * v8))), v6, *(float32x2_t *)(v7 + 16 * v8), 1), (float32x4_t)xmmword_25B5F10E0, *(float32x4_t *)(v7 + 16 * v8), 2);
      ++v8;
      uint64_t v7 = *(void *)self->_anon_8;
    }
    while (v8 < (*(void *)&self->_anon_8[8] - v7) >> 4);
  }
}

- (__n128)initWithQuad:(__n128)a3 withConfidence:(__n128)a4 withColor:(__n128)a5 withGroupId:(float)a6 withType:(__n128)a7
{
  v20.receiver = a1;
  v20.super_class = (Class)RS3DSurface;
  v13 = [(RS3DSurface *)&v20 init];
  *(__n128 *)&v13[1].super.isa = a2;
  *(__n128 *)&v13[1]._anon_8[8] = a3;
  *(__n128 *)&v13[1]._polygonEdgeStates.__begin_ = a4;
  *(__n128 *)&v13[1]._polygonEdgeStates.__end_cap_.__value_ = a5;
  v13->confidence = a6;
  __n128 result = a7;
  *(__n128 *)v13->color = a7;
  v13->groupId = a9;
  v13->type = a10;
  return result;
}

- (const)polygonEdgeSides
{
  return self->_polygonEdgeSides.__begin_;
}

- (const)polygonEdgeConfidence
{
  return self->_polygonEdgeConfidence.__begin_;
}

- (const)polygonEdgeStates
{
  return self->_polygonEdgeStates.__begin_;
}

- (unint64_t)polygonSize
{
  return (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4;
}

- (uint64_t)polygon
{
  return *(void *)(a1 + 8);
}

- (RS3DSurface)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)RS3DSurface;
  id v6 = [(RS3DSurface *)&v44 init];
  if (v6)
  {
    *((unsigned char *)v6 + 104) = objc_msgSend_decodeIntForKey_(v4, v5, @"type");
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
    v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"quad");
    sub_25B4FA924(v13, (_OWORD *)v6 + 17);
    objc_msgSend_decodeFloatForKey_(v4, v14, @"conf");
    *((_DWORD *)v6 + 27) = v15;
    v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v11, @"color");
    sub_25B4FAA14(v17, (_OWORD *)v6 + 12);
    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"identifier");
    v21 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"parentIdentifier");
    v25 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = v24;

    objc_msgSend_decodeFloatForKey_(v4, v26, @"offset");
    *((_DWORD *)v6 + 32) = v27;
    objc_msgSend_decodeFloatForKey_(v4, v28, @"depth");
    *((_DWORD *)v6 + 33) = v29;
    v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v11, @"polygon");
    sub_25B4FAB4C(v31, (void **)v6 + 1);
    v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v11, @"polygon_edge_states");
    sub_25B4FAD10(v33, (unint64_t *)v6 + 4);
    v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v11, @"polygon_edge_score");
    sub_25B4FAEAC(v35, (uint64_t)v6 + 56);
    v37 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v36, (uint64_t)v11, @"polygon_edge_sides");
    sub_25B4FB018(v37, (unint64_t *)v6 + 10);
    v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v11, @"appear_pose_pts");
    sub_25B4FB1B4(v39, (_OWORD *)v6 + 15);

    v41 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v11, @"appear_major_views");
    sub_25B4FB1B4(v41, (_OWORD *)v6 + 16);

    *((void *)v6 + 23) = objc_msgSend_decodeIntegerForKey_(v4, v42, @"story");
  }

  return (RS3DSurface *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v61 = a3;
  objc_msgSend_encodeInt_forKey_(v61, v4, self->type, @"type");
  uint64_t v7 = sub_25B4FB59C((__n128 *)&self[1], v5, v6);
  objc_msgSend_encodeObject_forKey_(v61, v8, (uint64_t)v7, @"quad");

  *(float *)&double v9 = self->confidence;
  uint64_t v11 = objc_msgSend_encodeFloat_forKey_(v61, v10, @"conf", v9);
  v14 = sub_25B4FB6CC(*(__n128 *)self->color, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v61, v15, (uint64_t)v14, @"color");

  objc_msgSend_encodeObject_forKey_(v61, v16, (uint64_t)self->identifier, @"identifier");
  objc_msgSend_encodeObject_forKey_(v61, v17, (uint64_t)self->parentIdentifier, @"parentIdentifier");
  *(float *)&double v18 = self->depth;
  objc_msgSend_encodeFloat_forKey_(v61, v19, @"depth", v18);
  *(float *)&double v20 = self->offset;
  objc_msgSend_encodeFloat_forKey_(v61, v21, @"offset", v20);
  uint64_t v24 = objc_msgSend_array(MEMORY[0x263EFF980], v22, v23);
  int v27 = (void *)v24;
  v28 = *(__n128 **)self->_anon_8;
  int v29 = *(__n128 **)&self->_anon_8[8];
  while (v28 != v29)
  {
    v30 = sub_25B4FB818(*v28, v24, v25, v26);
    objc_msgSend_addObject_(v27, v31, (uint64_t)v30);

    ++v28;
  }
  objc_msgSend_encodeObject_forKey_(v61, v25, (uint64_t)v27, @"polygon");

  v34 = sub_25B4FB930(&self->_polygonEdgeStates.__begin_, v32, v33);
  objc_msgSend_encodeObject_forKey_(v61, v35, (uint64_t)v34, @"polygon_edge_states");

  v40 = objc_msgSend_array(MEMORY[0x263EFF980], v36, v37);
  begin = self->_polygonEdgeConfidence.__begin_;
  for (uint64_t i = self->_polygonEdgeConfidence.__end_; begin != i; ++begin)
  {
    *(float *)&double v41 = *begin;
    objc_super v44 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v41);
    objc_msgSend_addObject_(v40, v45, (uint64_t)v44);
  }
  objc_msgSend_encodeObject_forKey_(v61, v38, (uint64_t)v40, @"polygon_edge_score");

  v48 = sub_25B4FBA5C(&self->_polygonEdgeSides.__begin_, v46, v47);
  objc_msgSend_encodeObject_forKey_(v61, v49, (uint64_t)v48, @"polygon_edge_sides");

  v53 = sub_25B4FB818(*(__n128 *)self->appearPosePts, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v61, v54, (uint64_t)v53, @"appear_pose_pts");

  v58 = sub_25B4FB818(*(__n128 *)self->appearMajorViews, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v61, v59, (uint64_t)v58, @"appear_major_views");

  objc_msgSend_encodeInteger_forKey_(v61, v60, self->storyLevel, @"story");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (RS3DSurface *)objc_alloc_init((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&self[1]._polygonEdgeStates.__end_cap_.__value_;
  long long v7 = *(_OWORD *)&self[1].super.isa;
  long long v6 = *(_OWORD *)&self[1]._anon_8[8];
  *(_OWORD *)&v4[1]._polygonEdgeStates.__begin_ = *(_OWORD *)&self[1]._polygonEdgeStates.__begin_;
  *(_OWORD *)&v4[1]._polygonEdgeStates.__end_cap_.__value_ = v5;
  *(_OWORD *)&v4[1].super.isa = v7;
  *(_OWORD *)&v4[1]._anon_8[8] = v6;
  v4->confidence = self->confidence;
  *(_OWORD *)v4->color = *(_OWORD *)self->color;
  v4->type = self->type;
  v4->groupId = self->groupId;
  objc_storeStrong((id *)&v4->identifier, self->identifier);
  objc_storeStrong((id *)&v4->parentIdentifier, self->parentIdentifier);
  v4->wallStatus = self->wallStatus;
  v4->parentWallStatus = self->parentWallStatus;
  *(_OWORD *)v4->normal = *(_OWORD *)self->normal;
  v4->edgeStates = self->edgeStates;
  v4->edgeConfidence = self->edgeConfidence;
  *(_OWORD *)v4->appearPosePts = *(_OWORD *)self->appearPosePts;
  *(_OWORD *)v4->appearMajorViews = *(_OWORD *)self->appearMajorViews;
  v4->individualUpdate = self->individualUpdate;
  v4->offset = self->offset;
  v4->depth = self->depth;
  if (v4 != self)
  {
    sub_25B4D3D18((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
    begin = v4->_polygonEdgeStates.__begin_;
    double v9 = self->_polygonEdgeStates.__begin_;
    end = self->_polygonEdgeStates.__end_;
    unint64_t v11 = end - v9;
    unint64_t value = (unint64_t)v4->_polygonEdgeStates.__end_cap_.__value_;
    if (value - (unint64_t)begin >= end - v9)
    {
      int v15 = v4->_polygonEdgeStates.__end_;
      size_t v16 = v15 - begin;
      if (v15 - begin < v11)
      {
        v17 = &v9[v16];
        if (v15 != begin)
        {
          memmove(v4->_polygonEdgeStates.__begin_, self->_polygonEdgeStates.__begin_, v16);
          begin = v4->_polygonEdgeStates.__end_;
        }
        if (end != v17) {
          memmove(begin, v17, end - v17);
        }
        double v18 = &begin[end - v17];
LABEL_21:
        v4->_polygonEdgeStates.__end_ = v18;
        sub_25B3FE7A8((char *)&v4->_polygonEdgeConfidence, (char *)self->_polygonEdgeConfidence.__begin_, (uint64_t)self->_polygonEdgeConfidence.__end_, self->_polygonEdgeConfidence.__end_ - self->_polygonEdgeConfidence.__begin_);
        v19 = v4->_polygonEdgeSides.__begin_;
        double v20 = self->_polygonEdgeSides.__begin_;
        v21 = self->_polygonEdgeSides.__end_;
        unint64_t v22 = v21 - v20;
        unint64_t v23 = (unint64_t)v4->_polygonEdgeSides.__end_cap_.__value_;
        if (v23 - (unint64_t)v19 >= v21 - v20)
        {
          uint64_t v26 = v4->_polygonEdgeSides.__end_;
          size_t v27 = v26 - v19;
          if (v26 - v19 < v22)
          {
            v28 = &v20[v27];
            if (v26 != v19)
            {
              memmove(v4->_polygonEdgeSides.__begin_, v20, v27);
              v19 = v4->_polygonEdgeSides.__end_;
            }
            if (v21 != v28) {
              memmove(v19, v28, v21 - v28);
            }
            int v29 = &v19[v21 - v28];
            goto LABEL_40;
          }
        }
        else
        {
          if (v19)
          {
            v4->_polygonEdgeSides.__end_ = v19;
            operator delete(v19);
            unint64_t v23 = 0;
            v4->_polygonEdgeSides.__begin_ = 0;
            v4->_polygonEdgeSides.__end_ = 0;
            v4->_polygonEdgeSides.__end_cap_.__value_ = 0;
          }
          if ((v22 & 0x8000000000000000) != 0) {
            sub_25B3FBC4C();
          }
          uint64_t v24 = 2 * v23;
          if (2 * v23 <= v22) {
            uint64_t v24 = v21 - v20;
          }
          if (v23 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v25 = v24;
          }
          sub_25B46E9EC(&v4->_polygonEdgeSides.__begin_, v25);
          v19 = v4->_polygonEdgeSides.__end_;
        }
        if (v21 != v20) {
          memmove(v19, v20, v21 - v20);
        }
        int v29 = &v19[v22];
LABEL_40:
        v4->_polygonEdgeSides.__end_ = v29;
        return v4;
      }
    }
    else
    {
      if (begin)
      {
        v4->_polygonEdgeStates.__end_ = begin;
        operator delete(begin);
        unint64_t value = 0;
        v4->_polygonEdgeStates.__begin_ = 0;
        v4->_polygonEdgeStates.__end_ = 0;
        v4->_polygonEdgeStates.__end_cap_.__value_ = 0;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        sub_25B3FBC4C();
      }
      uint64_t v13 = 2 * value;
      if (2 * value <= v11) {
        uint64_t v13 = end - v9;
      }
      if (value >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v14 = v13;
      }
      sub_25B46E9EC(&v4->_polygonEdgeStates.__begin_, v14);
      begin = v4->_polygonEdgeStates.__end_;
    }
    if (end != v9) {
      memmove(begin, v9, end - v9);
    }
    double v18 = &begin[v11];
    goto LABEL_21;
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  v108[0] = @"type";
  v106 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, self->type);
  v109[0] = v106;
  v108[1] = @"quad";
  v95 = sub_25B4FB59C((__n128 *)&self[1], v3, v4);
  v109[1] = v95;
  v108[2] = @"conf";
  *(float *)&double v5 = self->confidence;
  v96 = objc_msgSend_numberWithFloat_(NSNumber, v6, v7, v5);
  v109[2] = v96;
  v108[3] = @"color";
  v97 = sub_25B4FB6CC(*(__n128 *)self->color, (uint64_t)v96, v8, v9);
  v109[3] = v97;
  v108[4] = @"groupId";
  v98 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, self->groupId);
  v109[4] = v98;
  v108[5] = @"wall_status";
  v99 = objc_msgSend_numberWithInt_(NSNumber, v11, self->wallStatus);
  v109[5] = v99;
  v108[6] = @"parent_wall_status";
  v100 = objc_msgSend_numberWithInt_(NSNumber, v12, self->parentWallStatus);
  v109[6] = v100;
  v108[7] = @"individualUpdate";
  v101 = objc_msgSend_numberWithChar_(NSNumber, v13, self->individualUpdate);
  v109[7] = v101;
  v108[8] = @"identifier";
  uint64_t v110 = objc_msgSend_UUIDString(self->identifier, v14, v15);
  v108[9] = @"parentIdentifier";
  parentIdentifier = self->parentIdentifier;
  v103 = (void *)v110;
  if (parentIdentifier)
  {
    objc_msgSend_UUIDString(parentIdentifier, v16, v17);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_2708F4750;
  }
  v111 = v19;
  v108[10] = @"edgeStates";
  v104 = parentIdentifier;
  v107 = objc_msgSend_array(MEMORY[0x263EFF980], v16, v17, v19);
  v21 = objc_msgSend_numberWithChar_(NSNumber, v20, self->edgeStates.states[0]);
  objc_msgSend_addObject_(v107, v22, (uint64_t)v21);

  uint64_t v24 = objc_msgSend_numberWithChar_(NSNumber, v23, self->edgeStates.states[1]);
  objc_msgSend_addObject_(v107, v25, (uint64_t)v24);

  size_t v27 = objc_msgSend_numberWithChar_(NSNumber, v26, self->edgeStates.states[2]);
  objc_msgSend_addObject_(v107, v28, (uint64_t)v27);

  v30 = objc_msgSend_numberWithChar_(NSNumber, v29, self->edgeStates.states[3]);
  objc_msgSend_addObject_(v107, v31, (uint64_t)v30);

  v112 = v107;
  v108[11] = @"edgeConfidence";
  v34 = objc_msgSend_array(MEMORY[0x263EFF980], v32, v33);
  *(float *)&double v35 = self->edgeConfidence.confidence[0];
  v38 = objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v35);
  objc_msgSend_addObject_(v34, v39, (uint64_t)v38);

  *(float *)&double v40 = self->edgeConfidence.confidence[1];
  v43 = objc_msgSend_numberWithFloat_(NSNumber, v41, v42, v40);
  objc_msgSend_addObject_(v34, v44, (uint64_t)v43);

  *(float *)&double v45 = self->edgeConfidence.confidence[2];
  v48 = objc_msgSend_numberWithFloat_(NSNumber, v46, v47, v45);
  objc_msgSend_addObject_(v34, v49, (uint64_t)v48);

  *(float *)&double v50 = self->edgeConfidence.confidence[3];
  v53 = objc_msgSend_numberWithFloat_(NSNumber, v51, v52, v50);
  objc_msgSend_addObject_(v34, v54, (uint64_t)v53);

  v113 = v34;
  v108[12] = @"offset";
  *(float *)&double v55 = self->offset;
  v102 = objc_msgSend_numberWithFloat_(NSNumber, v56, v57, v55);
  v114 = v102;
  v108[13] = @"depth";
  *(float *)&double v58 = self->depth;
  v105 = objc_msgSend_numberWithFloat_(NSNumber, v59, v60, v58);
  v115 = v105;
  v108[14] = @"polygon";
  uint64_t v63 = objc_msgSend_array(MEMORY[0x263EFF980], v61, v62);
  v66 = (void *)v63;
  v67 = *(__n128 **)self->_anon_8;
  v68 = *(__n128 **)&self->_anon_8[8];
  while (v67 != v68)
  {
    v69 = sub_25B4FB818(*v67, v63, v64, v65);
    objc_msgSend_addObject_(v66, v70, (uint64_t)v69);

    ++v67;
  }
  v116 = v66;
  v108[15] = @"polygon_edge_states";
  v71 = sub_25B4FB930(&self->_polygonEdgeStates.__begin_, v64, v65);
  v117 = v71;
  v108[16] = @"polygon_edge_score";
  v76 = objc_msgSend_array(MEMORY[0x263EFF980], v72, v73);
  begin = self->_polygonEdgeConfidence.__begin_;
  end = self->_polygonEdgeConfidence.__end_;
  while (begin != end)
  {
    *(float *)&double v77 = *begin;
    v80 = objc_msgSend_numberWithFloat_(NSNumber, v74, v75, v77);
    objc_msgSend_addObject_(v76, v81, (uint64_t)v80);

    ++begin;
  }
  v118 = v76;
  v108[17] = @"polygon_edge_sides";
  v82 = sub_25B4FBA5C(&self->_polygonEdgeSides.__begin_, v74, v75);
  v119 = v82;
  v108[18] = @"appear_pose_pts";
  v85 = sub_25B4FB818(*(__n128 *)self->appearPosePts, (uint64_t)v82, v83, v84);
  v120 = v85;
  v108[19] = @"appear_major_views";
  v88 = sub_25B4FB818(*(__n128 *)self->appearMajorViews, (uint64_t)v85, v86, v87);
  v121 = v88;
  v108[20] = @"story";
  v90 = objc_msgSend_numberWithInteger_(NSNumber, v89, self->storyLevel);
  v122 = v90;
  v92 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v91, (uint64_t)v109, v108, 21);

  if (v104) {

  }
  return v92;
}

- (RS3DSurface)initWithDictionaryRepresentation:(id)a3 WithGroupId:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v9 = (_DWORD *)objc_msgSend_init(self, v7, v8);
  if (objc_msgSend_fillWithDictionaryRepresentation_(v9, v10, (uint64_t)v6))
  {
    v9[28] = a4;
    unint64_t v11 = v9;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)fillWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, @"type");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7) {
    self->type = objc_msgSend_intValue(v7, v8, v9);
  }

  objc_msgSend_objectForKeyedSubscript_(v4, v10, @"quad");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12 && (int v13 = sub_25B4FA924(v12, &self[1]), v12, v13))
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v14, @"conf");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v16) {
      objc_msgSend_floatValue(v16, v18, v19);
    }
    else {
      float v20 = 0.0;
    }
    self->confidence = v20;

    objc_msgSend_objectForKeyedSubscript_(v4, v21, @"wall_status");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    if (v23) {
      self->wallStatus = objc_msgSend_intValue(v23, v24, v25);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v26, @"parent_wall_status");
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    if (v28) {
      self->parentWallStatus = objc_msgSend_intValue(v28, v29, v30);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v31, @"color");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    if (v33) {
      sub_25B4FAA14(v33, self->color);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v34, @"identifier");
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }

    id v37 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v39 = (NSUUID *)objc_msgSend_initWithUUIDString_(v37, v38, (uint64_t)v36);
    identifier = self->identifier;
    self->identifier = v39;

    if (!self->identifier)
    {
      double v41 = (NSUUID *)objc_opt_new();
      uint64_t v42 = self->identifier;
      self->identifier = v41;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v43, @"parentIdentifier");
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v45 = v44;
    }
    else {
      id v45 = 0;
    }

    if (objc_msgSend_length(v45, v46, v47))
    {
      id v48 = objc_alloc(MEMORY[0x263F08C38]);
      double v50 = (NSUUID *)objc_msgSend_initWithUUIDString_(v48, v49, (uint64_t)v45);
      parentIdentifier = self->parentIdentifier;
      self->parentIdentifier = v50;
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v52, @"individualUpdate");
    id v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v54 = v53;
    }
    else {
      id v54 = 0;
    }

    if (v54) {
      self->individualUpdate = objc_msgSend_intValue(v54, v55, v56);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v57, @"edgeStates");
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v59 = v58;
    }
    else {
      id v59 = 0;
    }

    if (v59)
    {
      id v60 = v59;
      if (objc_msgSend_count(v60, v61, v62) == 4)
      {
        for (unint64_t i = 0; objc_msgSend_count(v60, v63, v64) > i; ++i)
        {
          v67 = objc_msgSend_objectAtIndexedSubscript_(v60, v66, i);
          self->edgeStates.states[i] = objc_msgSend_intValue(v67, v68, v69);
        }
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v70, @"edgeConfidence");
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v72 = v71;
    }
    else {
      id v72 = 0;
    }

    if (v72)
    {
      id v73 = v72;
      if (objc_msgSend_count(v73, v74, v75) == 4)
      {
        for (unint64_t j = 0; objc_msgSend_count(v73, v76, v77) > j; ++j)
        {
          v80 = objc_msgSend_objectAtIndexedSubscript_(v73, v79, j);
          objc_msgSend_floatValue(v80, v81, v82);
          self->edgeConfidence.confidence[j] = v83;
        }
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v4, v84, @"offset");
    id v85 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v86 = v85;
    }
    else {
      id v86 = 0;
    }

    if (v86)
    {
      objc_msgSend_floatValue(v86, v87, v88);
      self->offset = v89;
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v90, @"depth");
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v92 = v91;
    }
    else {
      id v92 = 0;
    }

    if (v92)
    {
      objc_msgSend_floatValue(v92, v93, v94);
      self->depth = v95;
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v96, @"polygon");
    id v97 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v98 = v97;
    }
    else {
      id v98 = 0;
    }

    if (v98) {
      sub_25B4FAB4C(v98, (void **)self->_anon_8);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v99, @"polygon_edge_states");
    id v100 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v101 = v100;
    }
    else {
      id v101 = 0;
    }

    if (v101) {
      sub_25B4FAD10(v101, (unint64_t *)&self->_polygonEdgeStates);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v102, @"polygon_edge_score");
    id v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v104 = v103;
    }
    else {
      id v104 = 0;
    }

    if (v104) {
      sub_25B4FAEAC(v104, (uint64_t)&self->_polygonEdgeConfidence);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v105, @"polygon_edge_sides");
    id v106 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v107 = v106;
    }
    else {
      id v107 = 0;
    }

    if (v107) {
      sub_25B4FB018(v107, (unint64_t *)&self->_polygonEdgeSides);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v108, @"appear_pose_pts");
    id v109 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v110 = v109;
    }
    else {
      id v110 = 0;
    }

    if (v110) {
      sub_25B4FB1B4(v110, self->appearPosePts);
    }

    objc_msgSend_objectForKeyedSubscript_(v4, v111, @"appear_major_views");
    id v112 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v113 = v112;
    }
    else {
      id v113 = 0;
    }

    if (v113) {
      sub_25B4FB1B4(v113, self->appearMajorViews);
    }

    v115 = objc_msgSend_objectForKeyedSubscript_(v4, v114, @"story");
    self->storyLevel = objc_msgSend_integerValue(v115, v116, v117);

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (RS3DSurface)initWithDictionaryRepresentation:(id)a3
{
  return (RS3DSurface *)objc_msgSend_initWithDictionaryRepresentation_WithGroupId_(self, a2, (uint64_t)a3, 0);
}

- (double)transform
{
  uint64_t v1 = 0;
  float32x4_t v2 = 0uLL;
  do
  {
    float32x4_t v2 = vaddq_f32(v2, a1[v1 + 17]);
    ++v1;
  }
  while (v1 != 4);
  float32x4_t v4 = a1[17];
  float32x4_t v3 = a1[18];
  uint32x4_t v5 = (uint32x4_t)vceqq_f32(v3, v4);
  v5.i32[3] = v5.i32[2];
  float32x4_t v6 = (float32x4_t)xmmword_25B5F1360;
  int8x16_t v7 = (int8x16_t)xmmword_25B5F1370;
  int8x16_t v8 = (int8x16_t)xmmword_25B5F10E0;
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    float32x4_t v9 = a1[19];
    uint32x4_t v10 = (uint32x4_t)vceqq_f32(v3, v9);
    v10.i32[3] = v10.i32[2];
    unsigned int v11 = vminvq_u32(v10);
    float32x4_t v6 = (float32x4_t)xmmword_25B5F1360;
    int8x16_t v7 = (int8x16_t)xmmword_25B5F1370;
    int8x16_t v8 = (int8x16_t)xmmword_25B5F10E0;
    if ((v11 & 0x80000000) == 0)
    {
      float32x4_t v12 = vsubq_f32(v3, v4);
      int32x4_t v13 = (int32x4_t)vmulq_f32(v12, v12);
      int8x16_t v14 = (int8x16_t)vdupq_laneq_s32(v13, 2);
      v13.i32[0] = vadd_f32(*(float32x2_t *)v14.i8, vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      *(float32x2_t *)v14.i8 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      *(float32x2_t *)v14.i8 = vmul_f32(*(float32x2_t *)v14.i8, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(*(float32x2_t *)v14.i8, *(float32x2_t *)v14.i8)));
      *(float32x2_t *)v7.i8 = vmul_f32(*(float32x2_t *)v14.i8, *(float32x2_t *)v14.i8);
      v13.i32[0] = vmul_f32(*(float32x2_t *)v14.i8, vrsqrts_f32((float32x2_t)v13.u32[0], *(float32x2_t *)v7.i8)).u32[0];
      v14.i8[0] = a1[6].i8[8];
      v7.i32[0] = 5;
      int8x16_t v15 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v14, v7), 0);
      float32x4_t v16 = vsubq_f32(v3, v9);
      int32x4_t v17 = (int32x4_t)vmulq_f32(v16, v16);
      float32x4_t v6 = vmulq_n_f32(v12, *(float *)v13.i32);
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
      *(float32x2_t *)v13.i8 = vrsqrte_f32((float32x2_t)v17.u32[0]);
      *(float32x2_t *)v13.i8 = vmul_f32(*(float32x2_t *)v13.i8, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v13.i8, *(float32x2_t *)v13.i8)));
      float32x4_t v18 = vmulq_n_f32(v16, vmul_f32(*(float32x2_t *)v13.i8, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v13.i8, *(float32x2_t *)v13.i8))).f32[0]);
      float32x4_t v19 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL), vnegq_f32(v6)), v18, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v6, (int32x4_t)v6), (int8x16_t)v6, 0xCuLL));
      int32x4_t v20 = (int32x4_t)vmulq_f32(v19, v19);
      v20.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2), *(float32x2_t *)v20.i8)).u32[0];
      float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL);
      *(float32x2_t *)v19.f32 = vrsqrte_f32((float32x2_t)v20.u32[0]);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      float32x4_t v22 = vmulq_n_f32(v21, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]);
      int8x16_t v8 = vbslq_s8(v15, (int8x16_t)v22, (int8x16_t)v18);
      int8x16_t v7 = vbslq_s8(v15, (int8x16_t)v18, (int8x16_t)vnegq_f32(v22));
      v6.i32[3] = 0;
      v7.i32[3] = 0;
      v8.i32[3] = 0;
    }
  }
  uint64_t v23 = 0;
  __asm { FMOV            V5.4S, #0.25 }
  float32x4_t v29 = vmulq_f32(v2, _Q5);
  v29.i32[3] = 1.0;
  v31[0] = v6;
  v31[1] = v7;
  v31[2] = v8;
  v31[3] = xmmword_25B5F12B0;
  do
  {
    *(long long *)((char *)&v32 + v23 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_25B5F1360, COERCE_FLOAT(v31[v23])), (float32x4_t)xmmword_25B5F1370, *(float32x2_t *)&v31[v23], 1), (float32x4_t)xmmword_25B5F10E0, (float32x4_t)v31[v23], 2), v29, (float32x4_t)v31[v23], 3);
    ++v23;
  }
  while (v23 != 4);
  return *(double *)&v32;
}

- (double)dimensions
{
  float32x4_t v1 = a1[18];
  float32x4_t v2 = vsubq_f32(a1[17], v1);
  float32x4_t v3 = vmulq_f32(v2, v2);
  v3.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]);
  float32x4_t v4 = vsubq_f32(v1, a1[19]);
  float32x4_t v5 = vmulq_f32(v4, v4);
  float v6 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
  int v7 = a1[6].u8[8];
  if (v7 == 5) {
    float v8 = v6;
  }
  else {
    float v8 = a1[8].f32[1];
  }
  v3.f32[1] = v8;
  return *(double *)v3.i64;
}

- (RS3DSurface)init
{
  v7.receiver = self;
  v7.super_class = (Class)RS3DSurface;
  float32x4_t v2 = [(RS3DSurface *)&v7 init];
  *(void *)(v2 + 116) = -1;
  float32x4_t v3 = (void *)*((void *)v2 + 19);
  *((void *)v2 + 19) = 0;

  id v4 = objc_alloc_init(MEMORY[0x263F08C38]);
  float32x4_t v5 = (void *)*((void *)v2 + 18);
  *((void *)v2 + 18) = v4;

  v2[105] = -1;
  *((void *)v2 + 28) = 0;
  *((void *)v2 + 29) = 0;
  *((_DWORD *)v2 + 31) = -1;
  *((void *)v2 + 16) = 0;
  *((_OWORD *)v2 + 15) = 0u;
  *((_OWORD *)v2 + 16) = 0u;
  *((_DWORD *)v2 + 34) = 1065353216;
  *((_WORD *)v2 + 53) = 0;
  *((void *)v2 + 23) = 0;
  return (RS3DSurface *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end