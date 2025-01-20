@interface RSKeyframeExtended
- (NSUUID)identifier;
- (RSKeyframeExtended)initWithDictionary:(id)a3;
- (RSKeyframeExtended)initWithDictionary:(id)a3 withGroupId:(unsigned int)a4;
- (RSKeyframeExtended)initWithKeyframe:(id)a3;
- (__n128)cameraPose;
- (__n128)setCameraPose:(__n128)a3;
- (double)timestamp;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (uint64_t)colors;
- (uint64_t)points;
- (uint64_t)pointsToWorld;
- (uint64_t)semanticLabels;
- (uint64_t)semanticVotes;
- (unsigned)groupId;
- (void)filterOutPointsBeyondDistance:(float)a3;
- (void)processWithVoxelize:(BOOL)a3 asPythonApproach:(BOOL)a4 resample:(BOOL)a5 outlierRemove:(BOOL)a6;
- (void)rotateAlongZAxisRightHand:(float)a3;
- (void)setGroupId:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setPoints:(RSKeyframeExtended *)self semanticLabels:(SEL)a2 semanticVotes:colors:count:;
- (void)setTimestamp:(double)a3;
- (void)translateBy:(RSKeyframeExtended *)self;
@end

@implementation RSKeyframeExtended

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
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
  objc_storeStrong((id *)&self->identifier, 0);
  v3 = *(void **)self->_anon_68;
  if (v3)
  {
    *(void *)&self->_anon_68[8] = v3;
    operator delete(v3);
  }
  v4 = *(void **)self->_anon_50;
  if (v4)
  {
    *(void *)&self->_anon_50[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_38;
  if (v5)
  {
    *(void *)&self->_anon_38[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_20;
  if (v6)
  {
    *(void *)&self->_anon_20[8] = v6;
    operator delete(v6);
  }
  v7 = *(void **)self->_anon_8;
  if (v7)
  {
    *(void *)&self->_anon_8[8] = v7;
    operator delete(v7);
  }
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setGroupId:(unsigned int)a3
{
  self->groupId = a3;
}

- (unsigned)groupId
{
  return self->groupId;
}

- (__n128)setCameraPose:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (__n128)cameraPose
{
  return a1[10];
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (void)processWithVoxelize:(BOOL)a3 asPythonApproach:(BOOL)a4 resample:(BOOL)a5 outlierRemove:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  sub_25B400BE4(&__p, (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 4);
  v11 = __p;
  v12 = v16;
  if (__p != v16)
  {
    uint64_t v13 = 0;
    do
      *v11++ = v13++;
    while (v11 != v12);
  }
  if (v9)
  {
    uint64_t v14 = *(void *)self->_anon_20;
    if (v8) {
      sub_25B4FE36C(v14, (char **)&__p);
    }
    else {
      sub_25B4FDF70(v14, (uint64_t)&__p);
    }
  }
  if (v7) {
    sub_25B4FDDF4((uint64_t)&__p);
  }
  if (v6) {
    sub_25B4FF26C(*(void *)self->_anon_20, (uint64_t)&__p);
  }
  sub_25B4E32F4((uint64_t)self, (v16 - (unsigned char *)__p) >> 3, __p);
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
}

- (RSKeyframeExtended)initWithKeyframe:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)RSKeyframeExtended;
  v5 = [(RSKeyframeExtended *)&v77 init];
  if (objc_msgSend_count(v4, v6, v7))
  {
    uint64_t v10 = objc_msgSend_count(v4, v8, v9);
    uint64_t v13 = (char *)objc_msgSend_points(v4, v11, v12);
    uint64_t v16 = objc_msgSend_points(v4, v14, v15);
    sub_25B4D3D18((char *)v5->_anon_8, v13, v16 + 16 * v10, (v16 + 16 * v10 - (uint64_t)v13) >> 4);
    v19 = (char *)objc_msgSend_pointsToWorld(v4, v17, v18);
    uint64_t v22 = objc_msgSend_pointsToWorld(v4, v20, v21);
    sub_25B4D3D18((char *)v5->_anon_20, v19, v22 + 16 * v10, (v22 + 16 * v10 - (uint64_t)v19) >> 4);
    v25 = (char *)objc_msgSend_semanticLabels(v4, v23, v24);
    uint64_t v29 = objc_msgSend_semanticLabels(v4, v26, v27) + 4 * v10;
    size_t v30 = v29 - (void)v25;
    unint64_t v31 = (v29 - (uint64_t)v25) >> 2;
    uint64_t v32 = *(void *)&v5->_anon_38[16];
    v33 = *(char **)v5->_anon_38;
    if (v31 <= (v32 - (uint64_t)v33) >> 2)
    {
      v37 = *(unsigned char **)&v5->_anon_38[8];
      size_t v36 = v37 - v33;
      unint64_t v38 = (v37 - v33) >> 2;
      if (v38 < v31)
      {
        v39 = &v25[4 * v38];
        if (v37 != v33)
        {
          memmove(*(void **)v5->_anon_38, v25, v36);
          v33 = *(char **)&v5->_anon_38[8];
        }
        size_t v30 = v29 - (void)v39;
        if ((char *)v29 == v39)
        {
LABEL_20:
          *(void *)&v5->_anon_38[8] = &v33[v30];
          v42 = (char *)objc_msgSend_semanticVotes(v4, v28, v36);
          uint64_t v46 = objc_msgSend_semanticVotes(v4, v43, v44) + 8 * v10;
          size_t v47 = v46 - (void)v42;
          unint64_t v48 = (v46 - (uint64_t)v42) >> 3;
          uint64_t v49 = *(void *)&v5->_anon_50[16];
          v50 = *(char **)v5->_anon_50;
          if (v48 <= (v49 - (uint64_t)v50) >> 3)
          {
            v54 = *(unsigned char **)&v5->_anon_50[8];
            size_t v53 = v54 - v50;
            unint64_t v55 = (v54 - v50) >> 3;
            if (v55 < v48)
            {
              v56 = &v42[8 * v55];
              if (v54 != v50)
              {
                memmove(*(void **)v5->_anon_50, v42, v53);
                v50 = *(char **)&v5->_anon_50[8];
              }
              size_t v47 = v46 - (void)v56;
              if ((char *)v46 == v56) {
                goto LABEL_38;
              }
              v57 = v50;
              v58 = v56;
              goto LABEL_37;
            }
          }
          else
          {
            if (v50)
            {
              *(void *)&v5->_anon_50[8] = v50;
              operator delete(v50);
              uint64_t v49 = 0;
              *(void *)v5->_anon_50 = 0;
              *(void *)&v5->_anon_50[8] = 0;
              *(void *)&v5->_anon_50[16] = 0;
            }
            if ((v47 & 0x8000000000000000) != 0) {
              sub_25B3FBC4C();
            }
            uint64_t v51 = v49 >> 2;
            if (v49 >> 2 <= v48) {
              uint64_t v51 = (v46 - (uint64_t)v42) >> 3;
            }
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v52 = v51;
            }
            sub_25B40040C(v5->_anon_50, v52);
            v50 = *(char **)&v5->_anon_50[8];
          }
          if ((char *)v46 == v42)
          {
LABEL_38:
            *(void *)&v5->_anon_50[8] = &v50[v47];
            v59 = (char *)objc_msgSend_colors(v4, v45, v53);
            uint64_t v62 = objc_msgSend_colors(v4, v60, v61);
            sub_25B4D3D18((char *)v5->_anon_68, v59, v62 + 16 * v10, (v62 + 16 * v10 - (uint64_t)v59) >> 4);
            uint64_t v65 = objc_msgSend_identifier(v4, v63, v64);
            identifier = v5->identifier;
            v5->identifier = (NSUUID *)v65;

            objc_msgSend_cameraPose(v4, v67, v68);
            *(_OWORD *)&v5[1].super.isa = v69;
            *(_OWORD *)&v5[1]._anon_8[8] = v70;
            *(_OWORD *)v5[1]._anon_20 = v71;
            *(_OWORD *)&v5[1]._anon_20[16] = v72;
            objc_msgSend_timestamp(v4, v73, v74);
            v5->timestamp = v75;
            v5->groupId = 0;
            goto LABEL_39;
          }
          v57 = v50;
          v58 = v42;
LABEL_37:
          memmove(v57, v58, v47);
          goto LABEL_38;
        }
        v40 = v33;
        v41 = v39;
LABEL_19:
        memmove(v40, v41, v30);
        goto LABEL_20;
      }
    }
    else
    {
      if (v33)
      {
        *(void *)&v5->_anon_38[8] = v33;
        operator delete(v33);
        uint64_t v32 = 0;
        *(void *)v5->_anon_38 = 0;
        *(void *)&v5->_anon_38[8] = 0;
        *(void *)&v5->_anon_38[16] = 0;
      }
      if ((v30 & 0x8000000000000000) != 0) {
        sub_25B3FBC4C();
      }
      uint64_t v34 = v32 >> 1;
      if (v32 >> 1 <= v31) {
        uint64_t v34 = (v29 - (uint64_t)v25) >> 2;
      }
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v35 = v34;
      }
      sub_25B3FCA18(v5->_anon_38, v35);
      v33 = *(char **)&v5->_anon_38[8];
    }
    if ((char *)v29 == v25) {
      goto LABEL_20;
    }
    v40 = v33;
    v41 = v25;
    goto LABEL_19;
  }
LABEL_39:

  return v5;
}

- (void)filterOutPointsBeyondDistance:(float)a3
{
  uint64_t v5 = *(void *)self->_anon_8;
  uint64_t v4 = *(void *)&self->_anon_8[8];
  if (v4 == v5)
  {
    BOOL v6 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    BOOL v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    float v11 = a3 * a3;
    do
    {
      float32x4_t v12 = vmulq_f32(*(float32x4_t *)(v5 + 16 * v10), *(float32x4_t *)(v5 + 16 * v10));
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0] < v11)
      {
        if ((unint64_t)v9 >= v8)
        {
          uint64_t v13 = v9 - v6;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61) {
            sub_25B3FBC4C();
          }
          if ((uint64_t)(v8 - (void)v6) >> 2 > v14) {
            unint64_t v14 = (uint64_t)(v8 - (void)v6) >> 2;
          }
          if (v8 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15)
          {
            unint64_t v15 = (unint64_t)sub_25B3FCAD4(v15);
            uint64_t v9 = v7;
          }
          else
          {
            uint64_t v16 = 0;
          }
          v17 = (unint64_t *)(v15 + 8 * v13);
          unint64_t *v17 = v10;
          uint64_t v7 = v17 + 1;
          while (v9 != v6)
          {
            unint64_t v18 = *--v9;
            *--v17 = v18;
          }
          unint64_t v8 = v15 + 8 * v16;
          if (v6) {
            operator delete(v6);
          }
          BOOL v6 = v17;
        }
        else
        {
          *uint64_t v9 = v10;
          uint64_t v7 = v9 + 1;
        }
        uint64_t v5 = *(void *)self->_anon_8;
        uint64_t v4 = *(void *)&self->_anon_8[8];
        uint64_t v9 = v7;
      }
      ++v10;
    }
    while (v10 < (v4 - v5) >> 4);
  }
  sub_25B4E32F4((uint64_t)self, v9 - v6, v6);
  if (v6)
  {
    operator delete(v6);
  }
}

- (void)translateBy:(RSKeyframeExtended *)self
{
  float32x4_t v3 = vaddq_f32(*(float32x4_t *)&self[1]._anon_20[16], v2);
  v3.i32[3] = HIDWORD(*(_OWORD *)&self[1]._anon_20[16]);
  *(float32x4_t *)&self[1]._anon_20[16] = v3;
}

- (void)rotateAlongZAxisRightHand:(float)a3
{
  __float2 v6 = __sincosf_stret(a3);
  *(float *)v5.i32 = v6.__cosval;
  *(__float2 *)v4.i8 = v6;
  uint64_t v7 = 0;
  *(float *)&v5.i32[1] = -v6.__sinval;
  int32x4_t v8 = vzip1q_s32(v5, (int32x4_t)0);
  int32x4_t v9 = vzip1q_s32(v4, (int32x4_t)0);
  float32x4_t v10 = (float32x4_t)vzip1q_s32(v8, v9);
  float32x4_t v11 = (float32x4_t)vzip2q_s32(v8, v9);
  long long v12 = *(_OWORD *)&self[1]._anon_8[8];
  long long v13 = *(_OWORD *)self[1]._anon_20;
  long long v14 = *(_OWORD *)&self[1]._anon_20[16];
  v18[0] = *(_OWORD *)&self[1].super.isa;
  v18[1] = v12;
  v18[2] = v13;
  v18[3] = v14;
  do
  {
    v19[v7] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v18[v7])), v11, *(float32x2_t *)&v18[v7], 1), (float32x4_t)xmmword_25B5F10E0, (float32x4_t)v18[v7], 2), (float32x4_t)xmmword_25B5F12B0, (float32x4_t)v18[v7], 3);
    ++v7;
  }
  while (v7 != 4);
  long long v15 = v19[1];
  long long v16 = v19[2];
  long long v17 = v19[3];
  *(_OWORD *)&self[1].super.isa = v19[0];
  *(_OWORD *)&self[1]._anon_8[8] = v15;
  *(_OWORD *)self[1]._anon_20 = v16;
  *(_OWORD *)&self[1]._anon_20[16] = v17;
}

- (void)setPoints:(RSKeyframeExtended *)self semanticLabels:(SEL)a2 semanticVotes:colors:count:
{
  unsigned int v7 = v6;
  int32x4_t v8 = v5;
  int32x4_t v9 = v4;
  float32x4_t v10 = v3;
  unint64_t v12 = v6;
  sub_25B4D3D18((char *)self->_anon_8, v2, (uint64_t)&v2[16 * v6], v6);
  sub_25B3FE7A8((char *)self->_anon_38, v10, (uint64_t)&v10[4 * v7], v12);
  sub_25B469194((char *)self->_anon_50, v9, (uint64_t)&v9[8 * v7], v12);
  sub_25B4D3D18((char *)self->_anon_68, v8, (uint64_t)&v8[16 * v7], v12);
  sub_25B469590((char **)self->_anon_20, (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
  long long v13 = *(float32x4_t **)self->_anon_8;
  long long v14 = *(float32x4_t **)&self->_anon_8[8];
  if (v13 != v14)
  {
    long long v15 = *(float32x4_t **)self->_anon_20;
    do
    {
      float32x4_t v16 = *v13++;
      *v15++ = vaddq_f32(*(float32x4_t *)&self[1]._anon_20[16], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)&self[1].super.isa, v16.f32[0]), *(float32x4_t *)&self[1]._anon_8[8], *(float32x2_t *)v16.f32, 1), *(float32x4_t *)self[1]._anon_20, v16, 2));
    }
    while (v13 != v14);
  }
}

- (RSKeyframeExtended)initWithDictionary:(id)a3 withGroupId:(unsigned int)a4
{
  id v6 = a3;
  v136.receiver = self;
  v136.super_class = (Class)RSKeyframeExtended;
  id v7 = [(RSKeyframeExtended *)&v136 init];
  v129 = objc_msgSend_objectForKeyedSubscript_(v6, v8, @"identifier");
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v11 = objc_msgSend_initWithUUIDString_(v9, v10, (uint64_t)v129);
  unint64_t v12 = (void *)*((void *)v7 + 17);
  *((void *)v7 + 17) = v11;

  objc_msgSend_objectForKeyedSubscript_(v6, v13, @"cameraPose");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  id v128 = v15;
  unint64_t v18 = (long long *)objc_msgSend_bytes(v128, v16, v17);
  long long v19 = *v18;
  long long v20 = v18[1];
  long long v21 = v18[3];
  *((_OWORD *)v7 + 12) = v18[2];
  *((_OWORD *)v7 + 13) = v21;
  *((_OWORD *)v7 + 10) = v19;
  *((_OWORD *)v7 + 11) = v20;
  v23 = objc_msgSend_objectForKeyedSubscript_(v6, v22, @"count");
  uint64_t v26 = objc_msgSend_integerValue(v23, v24, v25);

  objc_msgSend_objectForKeyedSubscript_(v6, v27, @"points");
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v29 = v28;
  }
  else {
    id v29 = 0;
  }

  id v30 = v29;
  v33 = (char *)objc_msgSend_bytes(v30, v31, v32);
  uint64_t v36 = objc_msgSend_length(v30, v34, v35);
  v130 = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  sub_25B3FE7A8((char *)&v130, v33, (uint64_t)&v33[v36 & 0xFFFFFFFFFFFFFFFCLL], v36 >> 2);

  v37 = v130;
  sub_25B4D3EC4(&v133, ((v131 - (uint64_t)v130) >> 2) / 3uLL);
  uint64_t v39 = v133;
  uint64_t v40 = v134;
  if (v134 == v133)
  {
    uint64_t v39 = v134;
  }
  else
  {
    uint64_t v41 = 0;
    unint64_t v42 = 0;
    v43 = v37;
    do
    {
      uint64_t v44 = v39 + v41;
      uint64_t v45 = *(void *)v43;
      *(_DWORD *)(v44 + 8) = v43[2];
      *(void *)uint64_t v44 = v45;
      ++v42;
      uint64_t v39 = v133;
      uint64_t v40 = v134;
      v43 += 3;
      v41 += 16;
    }
    while (v42 < (v134 - v133) >> 4);
  }
  uint64_t v46 = (void *)*((void *)v7 + 1);
  if (v46)
  {
    *((void *)v7 + 2) = v46;
    operator delete(v46);
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = 0;
    uint64_t v39 = v133;
    uint64_t v40 = v134;
  }
  *((void *)v7 + 1) = v39;
  *((void *)v7 + 2) = v40;
  *((void *)v7 + 3) = v135;
  uint64_t v133 = 0;
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  if (v37) {
    operator delete(v37);
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v38, @"pointsToWorld");
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  unsigned int v127 = a4;
  if (objc_opt_isKindOfClass()) {
    id v48 = v47;
  }
  else {
    id v48 = 0;
  }

  if (v48)
  {
    id v49 = v48;
    unint64_t v52 = (char *)objc_msgSend_bytes(v49, v50, v51);
    uint64_t v55 = objc_msgSend_length(v49, v53, v54);
    v130 = 0;
    uint64_t v131 = 0;
    uint64_t v132 = 0;
    sub_25B3FE7A8((char *)&v130, v52, (uint64_t)&v52[v55 & 0xFFFFFFFFFFFFFFFCLL], v55 >> 2);

    v56 = v130;
    sub_25B4D3EC4(&v133, ((v131 - (uint64_t)v130) >> 2) / 3uLL);
    uint64_t v58 = v133;
    uint64_t v59 = v134;
    if (v134 == v133)
    {
      uint64_t v58 = v134;
    }
    else
    {
      uint64_t v60 = 0;
      unint64_t v61 = 0;
      uint64_t v62 = v56;
      do
      {
        uint64_t v63 = v58 + v60;
        uint64_t v64 = *(void *)v62;
        *(_DWORD *)(v63 + 8) = v62[2];
        *(void *)uint64_t v63 = v64;
        ++v61;
        uint64_t v58 = v133;
        uint64_t v59 = v134;
        v62 += 3;
        v60 += 16;
      }
      while (v61 < (v134 - v133) >> 4);
    }
    long long v69 = (void *)*((void *)v7 + 4);
    if (v69)
    {
      *((void *)v7 + 5) = v69;
      operator delete(v69);
      *((void *)v7 + 4) = 0;
      *((void *)v7 + 5) = 0;
      *((void *)v7 + 6) = 0;
      uint64_t v58 = v133;
      uint64_t v59 = v134;
    }
    *((void *)v7 + 4) = v58;
    *((void *)v7 + 5) = v59;
    *((void *)v7 + 6) = v135;
    uint64_t v134 = 0;
    uint64_t v135 = 0;
    uint64_t v133 = 0;
    if (v56) {
      operator delete(v56);
    }
  }
  else
  {
    sub_25B469590((char **)v7 + 4, (uint64_t)(*((void *)v7 + 2) - *((void *)v7 + 1)) >> 4);
    uint64_t v65 = (float32x4_t *)*((void *)v7 + 1);
    v66 = (float32x4_t *)*((void *)v7 + 2);
    if (v65 != v66)
    {
      v67 = (float32x4_t *)*((void *)v7 + 4);
      do
      {
        float32x4_t v68 = *v65++;
        *v67++ = vaddq_f32(*((float32x4_t *)v7 + 13), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*((float32x4_t *)v7 + 10), v68.f32[0]), *((float32x4_t *)v7 + 11), *(float32x2_t *)v68.f32, 1), *((float32x4_t *)v7 + 12), v68, 2));
      }
      while (v65 != v66);
    }
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v57, @"semanticLabels");
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v71 = v70;
  }
  else {
    id v71 = 0;
  }

  id v72 = v71;
  double v75 = (char *)objc_msgSend_bytes(v72, v73, v74);
  unint64_t v78 = objc_msgSend_length(v72, v76, v77);
  v130 = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  sub_25B4E4D24(&v130, v75, &v75[v78], v78);

  v79 = v130;
  sub_25B4E4E30(&v133, (unint64_t)(v131 - (void)v130) >> 2);
  uint64_t v81 = v133;
  uint64_t v82 = v134;
  if (v134 == v133)
  {
    uint64_t v81 = v134;
  }
  else
  {
    unint64_t v83 = 0;
    do
    {
      *(_DWORD *)(v81 + 4 * v83) = v79[v83];
      ++v83;
      uint64_t v81 = v133;
      uint64_t v82 = v134;
    }
    while (v83 < (v134 - v133) >> 2);
  }
  v84 = (void *)*((void *)v7 + 7);
  if (v84)
  {
    *((void *)v7 + 8) = v84;
    operator delete(v84);
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 0;
    uint64_t v81 = v133;
    uint64_t v82 = v134;
  }
  *((void *)v7 + 7) = v81;
  *((void *)v7 + 8) = v82;
  *((void *)v7 + 9) = v135;
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = 0;
  if (v79) {
    operator delete(v79);
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v80, @"semanticVotes");
  id v85 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v86 = v85;
  }
  else {
    id v86 = 0;
  }

  id v87 = v86;
  v90 = (char *)objc_msgSend_bytes(v87, v88, v89);
  uint64_t v93 = objc_msgSend_length(v87, v91, v92);
  v130 = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  sub_25B4E4EA8((char *)&v130, v90, (uint64_t)&v90[v93 & 0xFFFFFFFFFFFFFFFELL], v93 >> 1);

  v94 = v130;
  sub_25B4E4FA8(&v133, (unint64_t)((v131 - (uint64_t)v130) >> 1) >> 2);
  uint64_t v96 = v133;
  uint64_t v97 = v134;
  if (v134 == v133)
  {
    uint64_t v96 = v134;
  }
  else
  {
    unint64_t v98 = 0;
    do
    {
      *(void *)(v96 + 8 * v98) = v94[v98];
      ++v98;
      uint64_t v96 = v133;
      uint64_t v97 = v134;
    }
    while (v98 < (v134 - v133) >> 3);
  }
  v99 = (void *)*((void *)v7 + 10);
  if (v99)
  {
    *((void *)v7 + 11) = v99;
    operator delete(v99);
    *((void *)v7 + 10) = 0;
    *((void *)v7 + 11) = 0;
    *((void *)v7 + 12) = 0;
    uint64_t v96 = v133;
    uint64_t v97 = v134;
  }
  *((void *)v7 + 10) = v96;
  *((void *)v7 + 11) = v97;
  *((void *)v7 + 12) = v135;
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = 0;
  if (v94) {
    operator delete(v94);
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v95, @"colors");
  id v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v101 = v100;
  }
  else {
    id v101 = 0;
  }

  id v102 = v101;
  v105 = (char *)objc_msgSend_bytes(v102, v103, v104);
  uint64_t v108 = objc_msgSend_length(v102, v106, v107);
  v130 = 0;
  uint64_t v131 = 0;
  uint64_t v132 = 0;
  sub_25B3FE7A8((char *)&v130, v105, (uint64_t)&v105[v108 & 0xFFFFFFFFFFFFFFFCLL], v108 >> 2);

  v109 = v130;
  sub_25B4D3EC4(&v133, ((v131 - (uint64_t)v130) >> 2) / 3uLL);
  uint64_t v111 = v133;
  uint64_t v112 = v134;
  if (v134 == v133)
  {
    uint64_t v111 = v134;
  }
  else
  {
    uint64_t v113 = 0;
    unint64_t v114 = 0;
    v115 = v109;
    do
    {
      uint64_t v116 = v111 + v113;
      uint64_t v117 = *(void *)v115;
      *(_DWORD *)(v116 + 8) = v115[2];
      *(void *)uint64_t v116 = v117;
      ++v114;
      uint64_t v111 = v133;
      uint64_t v112 = v134;
      v115 += 3;
      v113 += 16;
    }
    while (v114 < (v134 - v133) >> 4);
  }
  v118 = (void *)*((void *)v7 + 13);
  if (v118)
  {
    *((void *)v7 + 14) = v118;
    operator delete(v118);
    *((void *)v7 + 13) = 0;
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 15) = 0;
    uint64_t v111 = v133;
    uint64_t v112 = v134;
  }
  *((void *)v7 + 13) = v111;
  *((void *)v7 + 14) = v112;
  *((void *)v7 + 15) = v135;
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = 0;
  if (v109) {
    operator delete(v109);
  }
  v119 = objc_msgSend_objectForKeyedSubscript_(v6, v110, @"timestamp");

  if (v119)
  {
    v121 = objc_msgSend_objectForKeyedSubscript_(v6, v120, @"timestamp");
    objc_msgSend_doubleValue(v121, v122, v123);
    *((void *)v7 + 18) = v124;
  }
  *((_DWORD *)v7 + 32) = v127;
  if (v26 == (uint64_t)(*((void *)v7 + 2) - *((void *)v7 + 1)) >> 4
    && v26 == (uint64_t)(*((void *)v7 + 5) - *((void *)v7 + 4)) >> 4
    && v26 == (uint64_t)(*((void *)v7 + 11) - *((void *)v7 + 10)) >> 3
    && v26 == (uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 2
    && v26 == (uint64_t)(*((void *)v7 + 14) - *((void *)v7 + 13)) >> 4)
  {
    v125 = (RSKeyframeExtended *)v7;
  }
  else
  {
    v125 = 0;
  }

  return v125;
}

- (RSKeyframeExtended)initWithDictionary:(id)a3
{
  return (RSKeyframeExtended *)objc_msgSend_initWithDictionary_withGroupId_(self, a2, (uint64_t)a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  int32x4_t v4 = objc_alloc_init(RSKeyframeExtended);
  objc_msgSend_setIdentifier_(v4, v5, (uint64_t)self->identifier);
  objc_msgSend_setCameraPose_(v4, v6, v7, *(double *)&self[1].super.isa, *(double *)&self[1]._anon_8[8], *(double *)self[1]._anon_20, *(double *)&self[1]._anon_20[16]);
  objc_msgSend_setGroupId_(v4, v8, self->groupId);
  objc_msgSend_setTimestamp_(v4, v9, v10, self->timestamp);
  if (v4 != self)
  {
    sub_25B4D3D18((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
    sub_25B4D3D18((char *)v4->_anon_20, *(char **)self->_anon_20, *(void *)&self->_anon_20[8], (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 4);
    sub_25B3FE7A8((char *)v4->_anon_38, *(char **)self->_anon_38, *(void *)&self->_anon_38[8], (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 2);
    sub_25B469194((char *)v4->_anon_50, *(char **)self->_anon_50, *(void *)&self->_anon_50[8], (uint64_t)(*(void *)&self->_anon_50[8] - *(void *)self->_anon_50) >> 3);
    sub_25B4D3D18((char *)v4->_anon_68, *(char **)self->_anon_68, *(void *)&self->_anon_68[8], (uint64_t)(*(void *)&self->_anon_68[8] - *(void *)self->_anon_68) >> 4);
  }
  return v4;
}

- (uint64_t)colors
{
  return *(void *)(a1 + 104);
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + 80);
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + 56);
}

- (uint64_t)pointsToWorld
{
  return *(void *)(a1 + 32);
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (int64_t)count
{
  return (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4;
}

@end