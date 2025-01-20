@interface RSRoomType
+ (BOOL)supportsSecureCoding;
- (NSString)label;
- (RSRoomType)initWithCoder:(id)a3;
- (RSRoomType)initWithDictionaryRepresentation:(id)a3;
- (RSRoomType)initWithDictionaryRepresentation:(id)a3 withGroupId:(unsigned int)a4;
- (RSRoomTypePolygon)polygon;
- (double)polygonCenter;
- (double)quad;
- (double)transform;
- (float)ceilingHeight;
- (float)confidenceScore;
- (float)floorHeight;
- (float32x2_t)dimensions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)insideRoom;
- (int64_t)storyLevel;
- (unsigned)groupId;
- (void)encodeWithCoder:(id)a3;
- (void)rotateAlongZAxisRightHand:(float)a3;
- (void)translateBy:(RSRoomType *)self;
@end

@implementation RSRoomType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (unsigned)groupId
{
  return self->_groupId;
}

- (int)insideRoom
{
  return self->_insideRoom;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (float)ceilingHeight
{
  return self->_ceilingHeight;
}

- (float)floorHeight
{
  return self->_floorHeight;
}

- (double)quad
{
  objc_copyStruct(&v2, (const void *)(a1 + 64), 32, 1, 0);
  return v2;
}

- (double)polygonCenter
{
  return *(double *)(a1 + 56);
}

- (RSRoomTypePolygon)polygon
{
  return self->_polygon;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)storyLevel
{
  return self->storyLevel;
}

- (RSRoomType)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)RSRoomType;
  v6 = [(RSRoomType *)&v51 init];
  if (v6)
  {
    objc_msgSend_decodeFloatForKey_(v4, v5, @"confidenceScore");
    v6->_confidenceScore = v7;
    v6->_insideRoom = objc_msgSend_decodeIntForKey_(v4, v8, @"insideRoom");
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"label");
    label = v6->_label;
    v6->_label = (NSString *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    v50 = v4;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v49 = objc_msgSend_setWithObjects_(v13, v16, v14, v15, 0);
    v48 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v49, @"polygonCenter");
    sub_25B548ABC(v48, v6->_polygonCenter);
    v47 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v49, @"quad");
    sub_25B548B8C(v47, &v6[1].super.isa);
    int v46 = objc_msgSend_decodeIntForKey_(v4, v19, @"type");
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v49, @"points");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    v26 = 0;
    for (unint64_t i = 0; objc_msgSend_count(v23, v21, v22) > i; ++i)
    {
      v29 = objc_msgSend_objectAtIndexedSubscript_(v23, v28, i);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        break;
      }
      uint64_t v52 = 0;
      v32 = objc_msgSend_objectAtIndexedSubscript_(v23, v31, i);
      BOOL v33 = sub_25B548ABC(v32, &v52);

      if (!v33) {
        break;
      }
      if (v25 >= v26)
      {
        uint64_t v35 = (v25 - v24) >> 3;
        unint64_t v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 61) {
          sub_25B3FBC4C();
        }
        if ((v26 - v24) >> 2 > v36) {
          unint64_t v36 = (v26 - v24) >> 2;
        }
        if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v37 = v36;
        }
        if (v37)
        {
          v38 = (char *)sub_25B3FCAD4(v37);
          v39 = v21;
        }
        else
        {
          v38 = 0;
          v39 = 0;
        }
        v34 = &v38[8 * v35];
        *(void *)v34 = v52;
        v40 = v34;
        if (v25 != v24)
        {
          v40 = v34;
          do
          {
            uint64_t v41 = *((void *)v25 - 1);
            v25 -= 8;
            *((void *)v40 - 1) = v41;
            v40 -= 8;
          }
          while (v25 != v24);
        }
        if (v24) {
          operator delete(v24);
        }
        v26 = &v38[8 * (void)v39];
        v24 = v40;
      }
      else
      {
        *(void *)v25 = v52;
        v34 = v25;
      }
      v25 = v34 + 8;
    }

    v42 = [RSRoomTypePolygon alloc];
    if (v42)
    {
      v42 = (RSRoomTypePolygon *)sub_25B5483C0(v42, (v25 - v24) >> 3, v24);
      if (v42) {
        v42->_type = v46;
      }
    }
    polygon = v6->_polygon;
    v6->_polygon = v42;

    v6->storyLevel = objc_msgSend_decodeIntegerForKey_(v50, v44, @"story");
    if (v24) {
      operator delete(v24);
    }

    id v4 = v50;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_confidenceScore;
  id v51 = v4;
  objc_msgSend_encodeFloat_forKey_(v4, v6, @"confidenceScore", v5);
  objc_msgSend_encodeInt_forKey_(v51, v7, self->_insideRoom, @"insideRoom");
  uint64_t v9 = objc_msgSend_encodeObject_forKey_(v51, v8, (uint64_t)self->_label, @"label");
  v12 = sub_25B548F64(*(double *)self->_polygonCenter, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v51, v13, (uint64_t)v12, @"polygonCenter");

  v16 = sub_25B549050((double *)&self[1], v14, v15);
  objc_msgSend_encodeObject_forKey_(v51, v17, (uint64_t)v16, @"quad");

  uint64_t v20 = objc_msgSend_type(self->_polygon, v18, v19);
  objc_msgSend_encodeInt_forKey_(v51, v21, v20, @"type");
  uint64_t v52 = 0;
  v53 = 0;
  unint64_t v54 = 0;
  unint64_t v24 = objc_msgSend_count(self->_polygon, v22, v23);
  sub_25B443B1C((void **)&v52, v24);
  for (unint64_t i = 0; objc_msgSend_count(self->_polygon, v25, v26) > i; ++i)
  {
    uint64_t v30 = objc_msgSend_points(self->_polygon, v28, v29);
    uint64_t v31 = v30;
    v32 = v53;
    if ((unint64_t)v53 >= v54)
    {
      v34 = v52;
      uint64_t v35 = v53 - v52;
      unint64_t v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61) {
        sub_25B3FBC4C();
      }
      uint64_t v37 = v54 - (void)v52;
      if ((uint64_t)(v54 - (void)v52) >> 2 > v36) {
        unint64_t v36 = v37 >> 2;
      }
      if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v38 = v36;
      }
      if (v38) {
        unint64_t v38 = (unint64_t)sub_25B3FCAD4(v38);
      }
      else {
        v25 = 0;
      }
      v39 = (double *)(v38 + 8 * v35);
      double *v39 = *(double *)(v31 + 8 * i);
      BOOL v33 = v39 + 1;
      if (v32 != v34)
      {
        do
        {
          uint64_t v40 = *((void *)v32-- - 1);
          *((void *)v39-- - 1) = v40;
        }
        while (v32 != v34);
        v32 = v52;
      }
      uint64_t v52 = v39;
      unint64_t v54 = v38 + 8 * (void)v25;
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      double *v53 = *(double *)(v30 + 8 * i);
      BOOL v33 = v32 + 1;
    }
    v53 = v33;
  }
  uint64_t v41 = objc_msgSend_array(MEMORY[0x263EFF980], v28, v29);
  v44 = (void *)v41;
  v45 = v52;
  int v46 = v53;
  if (v52 != v53)
  {
    v47 = v52;
    do
    {
      v48 = sub_25B548F64(*v47, v41, v42, v43);
      objc_msgSend_addObject_(v44, v49, (uint64_t)v48);

      ++v47;
    }
    while (v47 != v46);
  }
  objc_msgSend_encodeObject_forKey_(v51, v42, (uint64_t)v44, @"points");

  objc_msgSend_encodeInteger_forKey_(v51, v50, self->storyLevel, @"story");
  if (v45) {
    operator delete(v45);
  }
}

- (void)translateBy:(RSRoomType *)self
{
  long long v25 = v3;
  double v5 = 0;
  v6 = 0;
  unint64_t v7 = 0;
  for (unint64_t i = 0; objc_msgSend_count(self->_polygon, a2, v2, v25) > i; ++i)
  {
    float32x2_t v11 = vadd_f32(*(float32x2_t *)&v25, *(float32x2_t *)(objc_msgSend_points(self->_polygon, v9, v10) + 8 * i));
    if ((unint64_t)v6 >= v7)
    {
      uint64_t v13 = v6 - v5;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 61) {
        sub_25B3FBC4C();
      }
      if ((uint64_t)(v7 - (void)v5) >> 2 > v14) {
        unint64_t v14 = (uint64_t)(v7 - (void)v5) >> 2;
      }
      if (v7 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      if (v15) {
        unint64_t v15 = (unint64_t)sub_25B3FCAD4(v15);
      }
      else {
        a2 = 0;
      }
      v16 = (float32x2_t *)(v15 + 8 * v13);
      float32x2_t *v16 = v11;
      v12 = v16 + 1;
      while (v6 != v5)
      {
        float32x2_t v17 = v6[-1];
        --v6;
        v16[-1] = v17;
        --v16;
      }
      unint64_t v7 = v15 + 8 * (void)a2;
      if (v5) {
        operator delete(v5);
      }
      double v5 = v16;
    }
    else
    {
      float32x2_t *v6 = v11;
      v12 = v6 + 1;
    }
    v6 = v12;
  }
  v18 = [RSRoomTypePolygon alloc];
  int v21 = objc_msgSend_type(self->_polygon, v19, v20);
  if (v18)
  {
    int v22 = v21;
    uint64_t v23 = (RSRoomTypePolygon *)sub_25B5483C0(v18, v6 - v5, v5);
    if (v23) {
      v23->_type = v22;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  polygon = self->_polygon;
  self->_polygon = v23;

  *(float32x2_t *)self->_polygonCenter = vadd_f32(*(float32x2_t *)&v25, *(float32x2_t *)self->_polygonCenter);
  if (v5)
  {
    operator delete(v5);
  }
}

- (void)rotateAlongZAxisRightHand:(float)a3
{
  __float2 v8 = __sincosf_stret(a3);
  *(float *)v7.i32 = v8.__cosval;
  *(__float2 *)v6.i8 = v8;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  *(float *)&v7.i32[1] = -v8.__sinval;
  int8x16_t v31 = (int8x16_t)vzip1q_s32(v7, v6);
  int8x16_t v30 = vextq_s8(v31, v31, 8uLL);
  while (objc_msgSend_count(self->_polygon, v4, *(void *)&v5, *(_OWORD *)&v30, v31.i64[0]) > v12)
  {
    uint64_t v15 = objc_msgSend_points(self->_polygon, v13, v14);
    float32x2_t v16 = vmla_lane_f32(vmul_n_f32(*(float32x2_t *)v31.i8, COERCE_FLOAT(*(void *)(v15 + 8 * v12))), *(float32x2_t *)v30.i8, *(float32x2_t *)(v15 + 8 * v12), 1);
    if ((unint64_t)v10 >= v11)
    {
      uint64_t v18 = v10 - v9;
      unint64_t v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) >> 61) {
        sub_25B3FBC4C();
      }
      if ((uint64_t)(v11 - (void)v9) >> 2 > v19) {
        unint64_t v19 = (uint64_t)(v11 - (void)v9) >> 2;
      }
      if (v11 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20) {
        unint64_t v20 = (unint64_t)sub_25B3FCAD4(v20);
      }
      else {
        id v4 = 0;
      }
      int v21 = (float32x2_t *)(v20 + 8 * v18);
      float32x2_t *v21 = v16;
      float32x2_t v17 = v21 + 1;
      while (v10 != v9)
      {
        float32x2_t v22 = v10[-1];
        --v10;
        v21[-1] = v22;
        --v21;
      }
      unint64_t v11 = v20 + 8 * (void)v4;
      if (v9) {
        operator delete(v9);
      }
      uint64_t v9 = v21;
    }
    else
    {
      float32x2_t *v10 = v16;
      float32x2_t v17 = v10 + 1;
    }
    ++v12;
    uint64_t v10 = v17;
  }
  uint64_t v23 = [RSRoomTypePolygon alloc];
  int v26 = objc_msgSend_type(self->_polygon, v24, v25);
  if (v23)
  {
    int v27 = v26;
    v28 = (RSRoomTypePolygon *)sub_25B5483C0(v23, v10 - v9, v9);
    if (v28) {
      v28->_type = v27;
    }
  }
  else
  {
    v28 = 0;
  }
  polygon = self->_polygon;
  self->_polygon = v28;

  if (v9)
  {
    operator delete(v9);
  }
}

- (float32x2_t)dimensions
{
  float32x2_t v1 = a1[9];
  float32x2_t v2 = vsub_f32(v1, a1[8]);
  int32x2_t v3 = (int32x2_t)vmul_f32(v2, v2);
  float32x2_t v4 = vsub_f32(a1[10], v1);
  int32x2_t v5 = (int32x2_t)vmul_f32(v4, v4);
  return vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v3, v5), (float32x2_t)vzip2_s32(v3, v5)));
}

- (double)transform
{
  float32x2_t v2 = a1[8];
  float32x2_t v1 = a1[9];
  uint32x2_t v3 = (uint32x2_t)vceq_f32(v1, v2);
  long long v4 = xmmword_25B5F1360;
  long long v5 = xmmword_25B5F1370;
  float32x4_t v6 = (float32x4_t)xmmword_25B5F10E0;
  if ((vpmin_u32(v3, v3).u32[0] & 0x80000000) == 0)
  {
    float32x2_t v7 = a1[10];
    uint32x2_t v8 = (uint32x2_t)vceq_f32(v1, v7);
    unsigned __int32 v9 = vpmin_u32(v8, v8).u32[0];
    long long v4 = xmmword_25B5F1360;
    long long v5 = xmmword_25B5F1370;
    float32x4_t v6 = (float32x4_t)xmmword_25B5F10E0;
    if ((v9 & 0x80000000) == 0)
    {
      float32x2_t v10 = vsub_f32(v1, v2);
      float32x2_t v11 = vmul_f32(v10, v10);
      v11.i32[0] = vadd_f32(v11, (float32x2_t)vdup_lane_s32((int32x2_t)v11, 1)).u32[0];
      float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
      float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
      v11.i32[0] = vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).u32[0];
      float32x2_t v14 = vsub_f32(v1, v7);
      float32x2_t v15 = vmul_f32(v14, v14);
      v15.i32[0] = vadd_f32(v15, (float32x2_t)vdup_lane_s32((int32x2_t)v15, 1)).u32[0];
      *(float32x2_t *)&long long v4 = vmul_n_f32(v10, v11.f32[0]);
      float32x2_t v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
      *(float32x2_t *)&long long v5 = vmul_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
      v18.i64[0] = 0;
      v18.i64[1] = COERCE_UNSIGNED_INT(vmlas_n_f32((float)-*((float *)&v4 + 1) * *(float *)&v5, *((float *)&v5 + 1), *(float *)&v4));
      int32x4_t v19 = (int32x4_t)vmulq_f32(v18, v18);
      v19.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2), vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v19.i8, 1))).u32[0];
      float32x2_t v20 = vrsqrte_f32((float32x2_t)v19.u32[0]);
      float32x2_t v21 = vmul_f32(v20, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v20, v20)));
      float32x4_t v6 = vmulq_n_f32(v18, vmul_f32(v21, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(v21, v21))).f32[0]);
      v6.i32[3] = 0;
    }
  }
  uint64_t v22 = 0;
  *(float32x2_t *)v23.f32 = a1[7];
  v23.f32[2] = (float)(a1[1].f32[1] + a1[1].f32[0]) * 0.5;
  v23.i32[3] = 1.0;
  v25[0] = v4;
  v25[1] = v5;
  v25[2] = v6;
  v25[3] = xmmword_25B5F12B0;
  do
  {
    *(long long *)((char *)&v26 + v22 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_25B5F1360, COERCE_FLOAT(v25[v22])), (float32x4_t)xmmword_25B5F1370, *(float32x2_t *)&v25[v22], 1), (float32x4_t)xmmword_25B5F10E0, (float32x4_t)v25[v22], 2), v23, (float32x4_t)v25[v22], 3);
    ++v22;
  }
  while (v22 != 4);
  return *(double *)&v26;
}

- (RSRoomType)initWithDictionaryRepresentation:(id)a3 withGroupId:(unsigned int)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v84 = a3;
  v93.receiver = self;
  v93.super_class = (Class)RSRoomType;
  float32x4_t v6 = [(RSRoomType *)&v93 init];
  uint32x2_t v8 = objc_msgSend_objectForKeyedSubscript_(v84, v7, @"insideRoom");
  v83 = v6;
  v6->_insideRoom = objc_msgSend_intValue(v8, v9, v10);

  float32x2_t v12 = objc_msgSend_objectForKeyedSubscript_(v84, v11, @"confidenceScore");
  objc_msgSend_floatValue(v12, v13, v14);
  v6->_confidenceScore = v15;

  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v84, v16, @"label");
  label = v6->_label;
  v6->_label = (NSString *)v17;

  objc_msgSend_objectForKeyedSubscript_(v84, v19, @"quad");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v82 = v20;
  }
  else {
    id v82 = 0;
  }

  if (v82) {
    sub_25B548B8C(v82, &v6[1].super.isa);
  }
  v6->_groupId = a4;
  v80 = objc_msgSend_objectForKeyedSubscript_(v84, v21, @"polygon");
  v81 = objc_msgSend_objectForKeyedSubscript_(v80, v22, @"points");
  unint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v80, v23, @"type");
  int v79 = objc_msgSend_intValue(v24, v25, v26);

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v81;
  v28 = 0;
  uint64_t v29 = 0;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v89, v94, 16);
  if (v31)
  {
    unint64_t v32 = 0;
    uint64_t v33 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v90 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        unint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v35, v30, @"x");
        objc_msgSend_floatValue(v36, v37, v38);
        *(void *)&long long v87 = v39;

        uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v35, v40, @"y");
        objc_msgSend_floatValue(v41, v42, v43);
        int v86 = v44;

        long long v45 = v87;
        DWORD1(v45) = v86;
        if ((unint64_t)v29 >= v32)
        {
          long long v87 = v45;
          uint64_t v46 = (v29 - v28) >> 3;
          unint64_t v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 61) {
            sub_25B3FBC4C();
          }
          if ((uint64_t)(v32 - (void)v28) >> 2 > v47) {
            unint64_t v47 = (uint64_t)(v32 - (void)v28) >> 2;
          }
          if (v32 - (unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v48 = v47;
          }
          if (v48) {
            unint64_t v48 = (unint64_t)sub_25B3FCAD4(v48);
          }
          else {
            int8x16_t v30 = 0;
          }
          v49 = (char *)(v48 + 8 * v46);
          *(void *)v49 = v87;
          v50 = v49 + 8;
          while (v29 != v28)
          {
            uint64_t v51 = *((void *)v29 - 1);
            v29 -= 8;
            *((void *)v49 - 1) = v51;
            v49 -= 8;
          }
          unint64_t v32 = v48 + 8 * (void)v30;
          if (v28) {
            operator delete(v28);
          }
          v28 = v49;
          uint64_t v29 = v50;
        }
        else
        {
          *(void *)uint64_t v29 = v45;
          v29 += 8;
        }
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v89, v94, 16);
    }
    while (v31);
  }

  uint64_t v52 = [RSRoomTypePolygon alloc];
  if (v52)
  {
    v55 = sub_25B5483C0(v52, (v29 - v28) >> 3, v28);
    v58 = v55;
    if (v55) {
      *((_DWORD *)v55 + 8) = v79;
    }
    uint64_t v59 = objc_msgSend_copy(v55, v56, v57);
  }
  else
  {
    v58 = 0;
    uint64_t v59 = objc_msgSend_copy(0, v53, v54);
  }
  polygon = v83->_polygon;
  v83->_polygon = (RSRoomTypePolygon *)v59;

  v62 = objc_msgSend_objectForKeyedSubscript_(v84, v61, @"polygonCenter");
  if (objc_msgSend_count(v62, v63, v64) == 2)
  {
    v66 = objc_msgSend_objectAtIndexedSubscript_(v62, v65, 0);
    objc_msgSend_floatValue(v66, v67, v68);
    unsigned int v88 = v69;
    v71 = objc_msgSend_objectAtIndexedSubscript_(v62, v70, 1);
    objc_msgSend_floatValue(v71, v72, v73);
    *(void *)v83->_polygonCenter = __PAIR64__(v74, v88);
  }
  v75 = objc_msgSend_objectForKeyedSubscript_(v84, v65, @"story");
  v83->storyLevel = objc_msgSend_integerValue(v75, v76, v77);

  if (v28) {
    operator delete(v28);
  }

  return v83;
}

- (RSRoomType)initWithDictionaryRepresentation:(id)a3
{
  return (RSRoomType *)objc_msgSend_initWithDictionaryRepresentation_withGroupId_(self, a2, (uint64_t)a3, 0);
}

- (id)dictionaryRepresentation
{
  v69[2] = *MEMORY[0x263EF8340];
  long long v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  *(float *)&double v5 = self->_confidenceScore;
  uint32x2_t v8 = objc_msgSend_numberWithFloat_(NSNumber, v6, v7, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, (uint64_t)v8, @"confidenceScore");

  float32x2_t v11 = objc_msgSend_numberWithInt_(NSNumber, v10, self->_insideRoom);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"insideRoom");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)self->_label, @"label");
  float32x2_t v16 = sub_25B549050((double *)&self[1], v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v17, (uint64_t)v16, @"quad");

  id v20 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v18, v19);
  float32x2_t v21 = NSNumber;
  uint64_t v24 = objc_msgSend_type(self->_polygon, v22, v23);
  uint64_t v26 = objc_msgSend_numberWithInt_(v21, v25, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v20, v27, (uint64_t)v26, @"type");
  v67 = v20;

  unint64_t v32 = objc_msgSend_array(MEMORY[0x263EFF980], v28, v29);
  for (unint64_t i = 0; objc_msgSend_count(self->_polygon, v30, v31) > i; ++i)
  {
    unint64_t v36 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v34, v35);
    int v68 = HIDWORD(*(void *)(objc_msgSend_points(self->_polygon, v37, v38) + 8 * i));
    uint64_t v41 = objc_msgSend_numberWithFloat_(NSNumber, v39, v40);
    objc_msgSend_setObject_forKeyedSubscript_(v36, v42, (uint64_t)v41, @"x");

    HIDWORD(v43) = v68;
    LODWORD(v43) = v68;
    uint64_t v46 = objc_msgSend_numberWithFloat_(NSNumber, v44, v45, v43);
    objc_msgSend_setObject_forKeyedSubscript_(v36, v47, (uint64_t)v46, @"y");

    objc_msgSend_addObject_(v32, v48, (uint64_t)v36);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v67, v34, (uint64_t)v32, @"points");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v49, (uint64_t)v67, @"polygon");
  uint64_t v52 = objc_msgSend_numberWithFloat_(NSNumber, v50, v51, *(double *)self->_polygonCenter);
  v69[0] = v52;
  LODWORD(v53) = *(_DWORD *)&self->_polygonCenter[4];
  v56 = objc_msgSend_numberWithFloat_(NSNumber, v54, v55, v53);
  v69[1] = v56;
  v58 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v57, (uint64_t)v69, 2);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v59, (uint64_t)v58, @"polygonCenter");

  v61 = objc_msgSend_numberWithInteger_(NSNumber, v60, self->storyLevel);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v62, (uint64_t)v61, @"story");

  v65 = objc_msgSend_copy(v4, v63, v64);

  return v65;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = objc_alloc_init(RSRoomType);
  v4->_confidenceScore = self->_confidenceScore;
  objc_storeStrong((id *)&v4->_label, self->_label);
  objc_storeStrong((id *)&v4->_polygon, self->_polygon);
  *(void *)v4->_polygonCenter = *(void *)self->_polygonCenter;
  v4->_groupId = self->_groupId;
  v4->_insideRoom = self->_insideRoom;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end