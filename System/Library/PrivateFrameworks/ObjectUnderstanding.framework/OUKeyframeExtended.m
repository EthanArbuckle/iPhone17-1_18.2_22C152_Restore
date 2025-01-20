@interface OUKeyframeExtended
- (NSUUID)identifier;
- (OUKeyframeExtended)initWithDictionary:(id)a3;
- (OUKeyframeExtended)initWithDictionary:(id)a3 withGroupId:(unsigned int)a4;
- (OUKeyframeExtended)initWithKeyframe:(id)a3 voxelize:(BOOL)a4 resample:(BOOL)a5 outlierRemove:(BOOL)a6;
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
- (void)rotateAlongZAxis:(float)a3;
- (void)select:(unint64_t)a3 indices:(const unint64_t *)a4 from:(id)a5;
- (void)setGroupId:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)translateBy:(OUKeyframeExtended *)self;
@end

@implementation OUKeyframeExtended

- (int64_t)count
{
  return (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4;
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (uint64_t)pointsToWorld
{
  return *(void *)(a1 + 32);
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + 56);
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + 80);
}

- (uint64_t)colors
{
  return *(void *)(a1 + 104);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(OUKeyframeExtended);
  [(OUKeyframeExtended *)v4 setIdentifier:self->identifier];
  -[OUKeyframeExtended setCameraPose:](v4, "setCameraPose:", *(double *)&self[1].super.isa, *(double *)&self[1]._anon_8[8], *(double *)self[1]._anon_20, *(double *)&self[1]._anon_20[16]);
  [(OUKeyframeExtended *)v4 setGroupId:self->groupId];
  if (v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_20, *(char **)self->_anon_20, *(void *)&self->_anon_20[8], (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v4->_anon_38, *(char **)self->_anon_38, *(void *)&self->_anon_38[8], (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_50, *(char **)self->_anon_50, *(void *)&self->_anon_50[8], (uint64_t)(*(void *)&self->_anon_50[8] - *(void *)self->_anon_50) >> 3);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_68, *(char **)self->_anon_68, *(void *)&self->_anon_68[8], (uint64_t)(*(void *)&self->_anon_68[8] - *(void *)self->_anon_68) >> 4);
  }
  return v4;
}

- (OUKeyframeExtended)initWithDictionary:(id)a3
{
  return [(OUKeyframeExtended *)self initWithDictionary:a3 withGroupId:0];
}

- (OUKeyframeExtended)initWithDictionary:(id)a3 withGroupId:(unsigned int)a4
{
  id v6 = a3;
  v93.receiver = self;
  v93.super_class = (Class)OUKeyframeExtended;
  id v7 = [(OUKeyframeExtended *)&v93 init];
  v86 = [v6 objectForKeyedSubscript:@"identifier"];
  uint64_t v8 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v86];
  v9 = (void *)*((void *)v7 + 17);
  *((void *)v7 + 17) = v8;

  id v10 = [v6 objectForKeyedSubscript:@"cameraPose"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v85 = v11;
  v12 = (long long *)[v85 bytes];
  long long v13 = *v12;
  long long v14 = v12[1];
  long long v15 = v12[3];
  *((_OWORD *)v7 + 12) = v12[2];
  *((_OWORD *)v7 + 13) = v15;
  *((_OWORD *)v7 + 10) = v13;
  *((_OWORD *)v7 + 11) = v14;
  v16 = [v6 objectForKeyedSubscript:@"count"];
  uint64_t v17 = [v16 integerValue];

  id v18 = [v6 objectForKeyedSubscript:@"points"];
  objc_opt_class();
  unsigned int v84 = a4;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  id v20 = v19;
  v21 = (char *)[v20 bytes];
  uint64_t v22 = [v20 length];
  __p = 0;
  v88 = 0;
  uint64_t v89 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v21, (uint64_t)&v21[v22 & 0xFFFFFFFFFFFFFFFCLL], v22 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (unsigned char *)__p) >> 2) / 3uLL);
  uint64_t v23 = v90;
  uint64_t v24 = v91;
  if (v91 == v90)
  {
    uint64_t v23 = v91;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = v23 + v25;
      uint64_t v29 = *(void *)((char *)__p + v26);
      *(_DWORD *)(v28 + 8) = *(_DWORD *)((char *)__p + v26 + 8);
      *(void *)uint64_t v28 = v29;
      ++v27;
      uint64_t v23 = v90;
      uint64_t v24 = v91;
      v26 += 12;
      v25 += 16;
    }
    while (v27 < (v91 - v90) >> 4);
  }
  v30 = (void *)*((void *)v7 + 1);
  if (v30)
  {
    *((void *)v7 + 2) = v30;
    operator delete(v30);
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = 0;
    uint64_t v23 = v90;
    uint64_t v24 = v91;
  }
  *((void *)v7 + 1) = v23;
  *((void *)v7 + 2) = v24;
  *((void *)v7 + 3) = v92;
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  id v31 = [v6 objectForKeyedSubscript:@"pointsToWorld"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  if (v32)
  {
    id v33 = v32;
    v34 = (char *)[v33 bytes];
    uint64_t v35 = [v33 length];
    __p = 0;
    v88 = 0;
    uint64_t v89 = 0;
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v34, (uint64_t)&v34[v35 & 0xFFFFFFFFFFFFFFFCLL], v35 >> 2);

    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (unsigned char *)__p) >> 2) / 3uLL);
    uint64_t v36 = v90;
    uint64_t v37 = v91;
    if (v91 == v90)
    {
      uint64_t v36 = v91;
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      unint64_t v40 = 0;
      do
      {
        uint64_t v41 = v36 + v38;
        uint64_t v42 = *(void *)((char *)__p + v39);
        *(_DWORD *)(v41 + 8) = *(_DWORD *)((char *)__p + v39 + 8);
        *(void *)uint64_t v41 = v42;
        ++v40;
        uint64_t v36 = v90;
        uint64_t v37 = v91;
        v39 += 12;
        v38 += 16;
      }
      while (v40 < (v91 - v90) >> 4);
    }
    v47 = (void *)*((void *)v7 + 4);
    if (v47)
    {
      *((void *)v7 + 5) = v47;
      operator delete(v47);
      *((void *)v7 + 4) = 0;
      *((void *)v7 + 5) = 0;
      *((void *)v7 + 6) = 0;
      uint64_t v36 = v90;
      uint64_t v37 = v91;
    }
    *((void *)v7 + 4) = v36;
    *((void *)v7 + 5) = v37;
    *((void *)v7 + 6) = v92;
    uint64_t v91 = 0;
    uint64_t v92 = 0;
    uint64_t v90 = 0;
    if (__p)
    {
      v88 = __p;
      operator delete(__p);
    }
  }
  else
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v7 + 32, (uint64_t)(*((void *)v7 + 2) - *((void *)v7 + 1)) >> 4);
    v43 = (float32x4_t *)*((void *)v7 + 1);
    v44 = (float32x4_t *)*((void *)v7 + 2);
    if (v43 != v44)
    {
      v45 = (float32x4_t *)*((void *)v7 + 4);
      do
      {
        float32x4_t v46 = *v43++;
        *v45++ = vaddq_f32(*((float32x4_t *)v7 + 13), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*((float32x4_t *)v7 + 10), v46.f32[0]), *((float32x4_t *)v7 + 11), *(float32x2_t *)v46.f32, 1), *((float32x4_t *)v7 + 12), v46, 2));
      }
      while (v43 != v44);
    }
  }
  id v48 = [v6 objectForKeyedSubscript:@"semanticLabels"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v49 = v48;
  }
  else {
    id v49 = 0;
  }

  id v50 = v49;
  v51 = (char *)[v50 bytes];
  unint64_t v52 = [v50 length];
  __p = 0;
  v88 = 0;
  uint64_t v89 = 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v51, &v51[v52], v52);

  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEEC2Em(&v90, (unint64_t)(v88 - (unsigned char *)__p) >> 2);
  uint64_t v53 = v90;
  uint64_t v54 = v91;
  if (v91 == v90)
  {
    uint64_t v53 = v91;
  }
  else
  {
    unint64_t v55 = 0;
    do
    {
      *(_DWORD *)(v53 + 4 * v55) = *((_DWORD *)__p + v55);
      ++v55;
      uint64_t v53 = v90;
      uint64_t v54 = v91;
    }
    while (v55 < (v91 - v90) >> 2);
  }
  v56 = (void *)*((void *)v7 + 7);
  if (v56)
  {
    *((void *)v7 + 8) = v56;
    operator delete(v56);
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 0;
    uint64_t v53 = v90;
    uint64_t v54 = v91;
  }
  *((void *)v7 + 7) = v53;
  *((void *)v7 + 8) = v54;
  *((void *)v7 + 9) = v92;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  id v57 = [v6 objectForKeyedSubscript:@"semanticVotes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v58 = v57;
  }
  else {
    id v58 = 0;
  }

  id v59 = v58;
  v60 = (char *)[v59 bytes];
  uint64_t v61 = [v59 length];
  __p = 0;
  v88 = 0;
  uint64_t v89 = 0;
  std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>((char *)&__p, v60, (uint64_t)&v60[v61 & 0xFFFFFFFFFFFFFFFELL], v61 >> 1);

  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEEC2Em(&v90, (unint64_t)((v88 - (unsigned char *)__p) >> 1) >> 2);
  uint64_t v62 = v90;
  uint64_t v63 = v91;
  if (v91 == v90)
  {
    uint64_t v62 = v91;
  }
  else
  {
    unint64_t v64 = 0;
    do
    {
      *(void *)(v62 + 8 * v64) = *((void *)__p + v64);
      ++v64;
      uint64_t v62 = v90;
      uint64_t v63 = v91;
    }
    while (v64 < (v91 - v90) >> 3);
  }
  v65 = (void *)*((void *)v7 + 10);
  if (v65)
  {
    *((void *)v7 + 11) = v65;
    operator delete(v65);
    *((void *)v7 + 10) = 0;
    *((void *)v7 + 11) = 0;
    *((void *)v7 + 12) = 0;
    uint64_t v62 = v90;
    uint64_t v63 = v91;
  }
  *((void *)v7 + 10) = v62;
  *((void *)v7 + 11) = v63;
  *((void *)v7 + 12) = v92;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  id v66 = [v6 objectForKeyedSubscript:@"colors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v67 = v66;
  }
  else {
    id v67 = 0;
  }

  id v68 = v67;
  v69 = (char *)[v68 bytes];
  uint64_t v70 = [v68 length];
  __p = 0;
  v88 = 0;
  uint64_t v89 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v69, (uint64_t)&v69[v70 & 0xFFFFFFFFFFFFFFFCLL], v70 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v90, ((v88 - (unsigned char *)__p) >> 2) / 3uLL);
  uint64_t v71 = v90;
  uint64_t v72 = v91;
  if (v91 == v90)
  {
    uint64_t v71 = v91;
  }
  else
  {
    uint64_t v73 = 0;
    uint64_t v74 = 0;
    unint64_t v75 = 0;
    do
    {
      uint64_t v76 = v71 + v73;
      uint64_t v77 = *(void *)((char *)__p + v74);
      *(_DWORD *)(v76 + 8) = *(_DWORD *)((char *)__p + v74 + 8);
      *(void *)uint64_t v76 = v77;
      ++v75;
      uint64_t v71 = v90;
      uint64_t v72 = v91;
      v74 += 12;
      v73 += 16;
    }
    while (v75 < (v91 - v90) >> 4);
  }
  v78 = (void *)*((void *)v7 + 13);
  if (v78)
  {
    *((void *)v7 + 14) = v78;
    operator delete(v78);
    *((void *)v7 + 13) = 0;
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 15) = 0;
    uint64_t v71 = v90;
    uint64_t v72 = v91;
  }
  *((void *)v7 + 13) = v71;
  *((void *)v7 + 14) = v72;
  *((void *)v7 + 15) = v92;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  uint64_t v90 = 0;
  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
  v79 = [v6 objectForKeyedSubscript:@"timestamp"];

  if (v79)
  {
    v80 = [v6 objectForKeyedSubscript:@"timestamp"];
    [v80 doubleValue];
    *((void *)v7 + 18) = v81;
  }
  *((_DWORD *)v7 + 32) = v84;
  if (v17 == (uint64_t)(*((void *)v7 + 2) - *((void *)v7 + 1)) >> 4
    && v17 == (uint64_t)(*((void *)v7 + 5) - *((void *)v7 + 4)) >> 4
    && v17 == (uint64_t)(*((void *)v7 + 11) - *((void *)v7 + 10)) >> 3
    && v17 == (uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 2
    && v17 == (uint64_t)(*((void *)v7 + 14) - *((void *)v7 + 13)) >> 4)
  {
    v82 = (OUKeyframeExtended *)v7;
  }
  else
  {
    v82 = 0;
  }

  return v82;
}

- (void)rotateAlongZAxis:(float)a3
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
    v19[v7] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v18[v7])), v11, *(float32x2_t *)&v18[v7], 1), (float32x4_t)xmmword_237CB44B0, (float32x4_t)v18[v7], 2), (float32x4_t)xmmword_237CB4480, (float32x4_t)v18[v7], 3);
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

- (void)translateBy:(OUKeyframeExtended *)self
{
  float32x4_t v3 = vaddq_f32(*(float32x4_t *)&self[1]._anon_20[16], v2);
  v3.i32[3] = HIDWORD(*(_OWORD *)&self[1]._anon_20[16]);
  *(float32x4_t *)&self[1]._anon_20[16] = v3;
}

- (void)filterOutPointsBeyondDistance:(float)a3
{
  long long v79 = 0uLL;
  v80 = 0;
  v77[0] = 0;
  v77[1] = 0;
  v78 = 0;
  v75[0] = 0;
  v75[1] = 0;
  uint64_t v76 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v74 = 0;
  long long v71 = 0uLL;
  uint64_t v72 = 0;
  uint64_t v6 = *(void *)self->_anon_8;
  int32x4_t v5 = *(void **)&self->_anon_8[8];
  anon_8 = self->_anon_8;
  uint64_t v8 = (uint64_t)v5 - v6;
  if (v8)
  {
    uint64_t v9 = 0;
    unint64_t v10 = v8 >> 4;
    float v11 = a3 * a3;
    if (v10 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    do
    {
      float32x4_t v70 = *(float32x4_t *)(*(void *)anon_8 + 16 * v9);
      float32x4_t v13 = vmulq_f32(v70, v70);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0] < v11)
      {
        uint64_t v14 = *((void *)&v79 + 1);
        if (*((void *)&v79 + 1) >= (unint64_t)v80)
        {
          uint64_t v16 = (uint64_t)(*((void *)&v79 + 1) - v79) >> 4;
          if ((unint64_t)(v16 + 1) >> 60) {
            goto LABEL_108;
          }
          unint64_t v17 = (uint64_t)&v80[-v79] >> 3;
          if (v17 <= v16 + 1) {
            unint64_t v17 = v16 + 1;
          }
          if ((unint64_t)&v80[-v79] >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v18) {
            id v19 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v80, v18);
          }
          else {
            id v19 = 0;
          }
          id v20 = (float32x4_t *)&v19[16 * v16];
          *id v20 = v70;
          f32 = (_OWORD *)v20[1].f32;
          v21 = (float32x4_t *)*((void *)&v79 + 1);
          uint64_t v22 = (float32x4_t *)v79;
          if (*((void *)&v79 + 1) != (void)v79)
          {
            do
            {
              float32x4_t v23 = v21[-1];
              --v21;
              v20[-1] = v23;
              --v20;
            }
            while (v21 != v22);
            v21 = (float32x4_t *)v79;
          }
          *(void *)&long long v79 = v20;
          *((void *)&v79 + 1) = f32;
          v80 = &v19[16 * v18];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          **((_OWORD **)&v79 + 1) = v70;
          f32 = (_OWORD *)(v14 + 16);
        }
        *((void *)&v79 + 1) = f32;
        uint64_t v24 = *(void *)self->_anon_20;
        uint64_t v25 = (char *)v77[1];
        if (v77[1] >= v78)
        {
          int64_t v27 = ((char *)v77[1] - (char *)v77[0]) >> 4;
          if ((unint64_t)(v27 + 1) >> 60) {
            goto LABEL_108;
          }
          unint64_t v28 = (v78 - (char *)v77[0]) >> 3;
          if (v28 <= v27 + 1) {
            unint64_t v28 = v27 + 1;
          }
          if ((unint64_t)(v78 - (char *)v77[0]) >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29) {
            v30 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v78, v29);
          }
          else {
            v30 = 0;
          }
          id v31 = &v30[16 * v27];
          *(_OWORD *)id v31 = *(_OWORD *)(v24 + 16 * v9);
          uint64_t v26 = v31 + 16;
          id v33 = (char *)v77[0];
          id v32 = (char *)v77[1];
          if (v77[1] != v77[0])
          {
            do
            {
              long long v34 = *((_OWORD *)v32 - 1);
              v32 -= 16;
              *((_OWORD *)v31 - 1) = v34;
              v31 -= 16;
            }
            while (v32 != v33);
            id v32 = (char *)v77[0];
          }
          v77[0] = v31;
          v77[1] = v26;
          v78 = &v30[16 * v29];
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *(_OWORD *)v77[1] = *(_OWORD *)(v24 + 16 * v9);
          uint64_t v26 = v25 + 16;
        }
        v77[1] = v26;
        uint64_t v35 = *(void *)self->_anon_38;
        uint64_t v36 = (char *)v75[1];
        if (v75[1] >= v76)
        {
          int64_t v38 = ((char *)v75[1] - (char *)v75[0]) >> 2;
          if ((unint64_t)(v38 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v39 = (v76 - (char *)v75[0]) >> 1;
          if (v39 <= v38 + 1) {
            unint64_t v39 = v38 + 1;
          }
          if ((unint64_t)(v76 - (char *)v75[0]) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v40 = v39;
          }
          if (v40) {
            uint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v76, v40);
          }
          else {
            uint64_t v41 = 0;
          }
          uint64_t v42 = &v41[4 * v38];
          *(_DWORD *)uint64_t v42 = *(_DWORD *)(v35 + 4 * v9);
          uint64_t v37 = v42 + 4;
          v44 = (char *)v75[0];
          v43 = (char *)v75[1];
          if (v75[1] != v75[0])
          {
            do
            {
              int v45 = *((_DWORD *)v43 - 1);
              v43 -= 4;
              *((_DWORD *)v42 - 1) = v45;
              v42 -= 4;
            }
            while (v43 != v44);
            v43 = (char *)v75[0];
          }
          v75[0] = v42;
          v75[1] = v37;
          uint64_t v76 = &v41[4 * v40];
          if (v43) {
            operator delete(v43);
          }
        }
        else
        {
          *(_DWORD *)v75[1] = *(_DWORD *)(v35 + 4 * v9);
          uint64_t v37 = v36 + 4;
        }
        v75[1] = v37;
        uint64_t v46 = *(void *)self->_anon_50;
        v47 = (char *)__p[1];
        if (__p[1] >= v74)
        {
          int64_t v49 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v49 + 1) >> 61) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v50 = (v74 - (char *)__p[0]) >> 2;
          if (v50 <= v49 + 1) {
            unint64_t v50 = v49 + 1;
          }
          if ((unint64_t)(v74 - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v50;
          }
          if (v51) {
            unint64_t v52 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v74, v51);
          }
          else {
            unint64_t v52 = 0;
          }
          uint64_t v53 = &v52[8 * v49];
          *(void *)uint64_t v53 = *(void *)(v46 + 8 * v9);
          id v48 = v53 + 8;
          unint64_t v55 = (char *)__p[0];
          uint64_t v54 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              uint64_t v56 = *((void *)v54 - 1);
              v54 -= 8;
              *((void *)v53 - 1) = v56;
              v53 -= 8;
            }
            while (v54 != v55);
            uint64_t v54 = (char *)__p[0];
          }
          __p[0] = v53;
          __p[1] = v48;
          uint64_t v74 = &v52[8 * v51];
          if (v54) {
            operator delete(v54);
          }
        }
        else
        {
          *(void *)__p[1] = *(void *)(v46 + 8 * v9);
          id v48 = v47 + 8;
        }
        __p[1] = v48;
        uint64_t v57 = *(void *)self->_anon_68;
        if (*((void *)&v71 + 1) >= (unint64_t)v72)
        {
          uint64_t v59 = (uint64_t)(*((void *)&v71 + 1) - v71) >> 4;
          if ((unint64_t)(v59 + 1) >> 60) {
LABEL_108:
          }
            std::vector<float>::__throw_length_error[abi:ne180100]();
          unint64_t v60 = (uint64_t)&v72[-v71] >> 3;
          if (v60 <= v59 + 1) {
            unint64_t v60 = v59 + 1;
          }
          if ((unint64_t)&v72[-v71] >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v61 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v61 = v60;
          }
          if (v61) {
            uint64_t v62 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v72, v61);
          }
          else {
            uint64_t v62 = 0;
          }
          uint64_t v63 = &v62[16 * v59];
          *(_OWORD *)uint64_t v63 = *(_OWORD *)(v57 + 16 * v9);
          uint64_t v58 = (uint64_t)(v63 + 16);
          unint64_t v64 = (char *)*((void *)&v71 + 1);
          if (*((void *)&v71 + 1) != (void)v71)
          {
            do
            {
              long long v65 = *((_OWORD *)v64 - 1);
              v64 -= 16;
              *((_OWORD *)v63 - 1) = v65;
              v63 -= 16;
            }
            while (v64 != (char *)v71);
            unint64_t v64 = (char *)v71;
          }
          *(void *)&long long v71 = v63;
          uint64_t v72 = &v62[16 * v61];
          if (v64) {
            operator delete(v64);
          }
        }
        else
        {
          **((_OWORD **)&v71 + 1) = *(_OWORD *)(v57 + 16 * v9);
          uint64_t v58 = *((void *)&v71 + 1) + 16;
        }
        *((void *)&v71 + 1) = v58;
      }
      ++v9;
    }
    while (v9 != v12);
    int32x4_t v5 = *(void **)anon_8;
  }
  if (v5)
  {
    *(void *)&self->_anon_8[8] = v5;
    operator delete(v5);
    *(void *)anon_8 = 0;
    *((void *)anon_8 + 1) = 0;
    *((void *)anon_8 + 2) = 0;
  }
  id v66 = *(void **)self->_anon_20;
  *(_OWORD *)self->_anon_8 = v79;
  *(void *)&self->_anon_8[16] = v80;
  v80 = 0;
  long long v79 = 0uLL;
  if (v66)
  {
    *(void *)&self->_anon_20[8] = v66;
    operator delete(v66);
    *(void *)self->_anon_20 = 0;
    *(void *)&self->_anon_20[8] = 0;
    *(void *)&self->_anon_20[16] = 0;
  }
  id v67 = *(void **)self->_anon_38;
  *(_OWORD *)self->_anon_20 = *(_OWORD *)v77;
  *(void *)&self->_anon_20[16] = v78;
  v77[1] = 0;
  v78 = 0;
  v77[0] = 0;
  if (v67)
  {
    *(void *)&self->_anon_38[8] = v67;
    operator delete(v67);
    *(void *)self->_anon_38 = 0;
    *(void *)&self->_anon_38[8] = 0;
    *(void *)&self->_anon_38[16] = 0;
  }
  id v68 = *(void **)self->_anon_50;
  *(_OWORD *)self->_anon_38 = *(_OWORD *)v75;
  *(void *)&self->_anon_38[16] = v76;
  v75[1] = 0;
  uint64_t v76 = 0;
  v75[0] = 0;
  if (v68)
  {
    *(void *)&self->_anon_50[8] = v68;
    operator delete(v68);
    *(void *)self->_anon_50 = 0;
    *(void *)&self->_anon_50[8] = 0;
    *(void *)&self->_anon_50[16] = 0;
  }
  v69 = *(void **)self->_anon_68;
  *(_OWORD *)self->_anon_50 = *(_OWORD *)__p;
  *(void *)&self->_anon_50[16] = v74;
  __p[1] = 0;
  uint64_t v74 = 0;
  __p[0] = 0;
  if (v69)
  {
    *(void *)&self->_anon_68[8] = v69;
    operator delete(v69);
    *(void *)self->_anon_68 = 0;
    *(void *)&self->_anon_68[8] = 0;
    *(void *)&self->_anon_68[16] = 0;
    v69 = __p[0];
  }
  *(_OWORD *)self->_anon_68 = v71;
  *(void *)&self->_anon_68[16] = v72;
  if (v69)
  {
    __p[1] = v69;
    operator delete(v69);
  }
  if (v75[0])
  {
    v75[1] = v75[0];
    operator delete(v75[0]);
  }
  if (v77[0])
  {
    v77[1] = v77[0];
    operator delete(v77[0]);
  }
  if ((void)v79)
  {
    *((void *)&v79 + 1) = v79;
    operator delete((void *)v79);
  }
}

- (void)select:(unint64_t)a3 indices:(const unint64_t *)a4 from:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 points];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  id v31 = (void **)&v28;
  unint64_t v10 = 8 * a3;
  if (a3)
  {
    unint64_t v11 = 8 * a3;
    uint64_t v12 = a4;
    do
    {
      long long v30 = *(_OWORD *)(v9 + 16 * *v12);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++v12;
      v11 -= 8;
    }
    while (v11);
  }
  float32x4_t v13 = *(void **)self->_anon_8;
  if (v13)
  {
    *(void *)&self->_anon_8[8] = v13;
    operator delete(v13);
    *(void *)self->_anon_8 = 0;
    *(void *)&self->_anon_8[8] = 0;
    *(void *)&self->_anon_8[16] = 0;
  }
  *(_OWORD *)self->_anon_8 = v28;
  *(void *)&self->_anon_8[16] = v29;
  uint64_t v14 = [v8 pointsToWorld];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  id v31 = (void **)&v28;
  if (a3)
  {
    unint64_t v15 = 8 * a3;
    uint64_t v16 = a4;
    do
    {
      long long v30 = *(_OWORD *)(v14 + 16 * *v16);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++v16;
      v15 -= 8;
    }
    while (v15);
  }
  unint64_t v17 = *(void **)self->_anon_20;
  if (v17)
  {
    *(void *)&self->_anon_20[8] = v17;
    operator delete(v17);
    *(void *)self->_anon_20 = 0;
    *(void *)&self->_anon_20[8] = 0;
    *(void *)&self->_anon_20[16] = 0;
  }
  *(_OWORD *)self->_anon_20 = v28;
  *(void *)&self->_anon_20[16] = v29;
  uint64_t v18 = [v8 semanticLabels];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  *(void *)&long long v30 = &v28;
  if (a3)
  {
    unint64_t v19 = 8 * a3;
    id v20 = a4;
    do
    {
      LODWORD(v31) = *(_DWORD *)(v18 + 4 * *v20);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv4_hNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_((void ***)&v30, &v31);
      ++v20;
      v19 -= 8;
    }
    while (v19);
  }
  v21 = *(void **)self->_anon_38;
  if (v21)
  {
    *(void *)&self->_anon_38[8] = v21;
    operator delete(v21);
    *(void *)self->_anon_38 = 0;
    *(void *)&self->_anon_38[8] = 0;
    *(void *)&self->_anon_38[16] = 0;
  }
  *(_OWORD *)self->_anon_38 = v28;
  *(void *)&self->_anon_38[16] = v29;
  uint64_t v22 = [v8 semanticVotes];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  *(void *)&long long v30 = &v28;
  if (a3)
  {
    unint64_t v23 = 8 * a3;
    uint64_t v24 = a4;
    do
    {
      id v31 = *(void ***)(v22 + 8 * *v24);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv4_tNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_((void ***)&v30, &v31);
      ++v24;
      v23 -= 8;
    }
    while (v23);
  }
  uint64_t v25 = *(void **)self->_anon_50;
  if (v25)
  {
    *(void *)&self->_anon_50[8] = v25;
    operator delete(v25);
    *(void *)self->_anon_50 = 0;
    *(void *)&self->_anon_50[8] = 0;
    *(void *)&self->_anon_50[16] = 0;
  }
  *(_OWORD *)self->_anon_50 = v28;
  *(void *)&self->_anon_50[16] = v29;
  uint64_t v26 = [v8 colors];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)&v28, a3);
  id v31 = (void **)&v28;
  if (a3)
  {
    do
    {
      long long v30 = *(_OWORD *)(v26 + 16 * *a4);
      _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v31, &v30);
      ++a4;
      v10 -= 8;
    }
    while (v10);
  }
  int64_t v27 = *(void **)self->_anon_68;
  if (v27)
  {
    *(void *)&self->_anon_68[8] = v27;
    operator delete(v27);
    *(void *)self->_anon_68 = 0;
    *(void *)&self->_anon_68[8] = 0;
    *(void *)&self->_anon_68[16] = 0;
  }
  *(_OWORD *)self->_anon_68 = v28;
  *(void *)&self->_anon_68[16] = v29;
}

- (OUKeyframeExtended)initWithKeyframe:(id)a3 voxelize:(BOOL)a4 resample:(BOOL)a5 outlierRemove:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v95.receiver = self;
  v95.super_class = (Class)OUKeyframeExtended;
  unint64_t v11 = [(OUKeyframeExtended *)&v95 init];
  if ([v10 count])
  {
    std::vector<unsigned long>::vector(v93, [v10 count]);
    uint64_t v12 = v93[0];
    float32x4_t v13 = v93[1];
    if (v93[0] != v93[1])
    {
      uint64_t v14 = 0;
      do
        *v12++ = v14++;
      while (v12 != v13);
    }
    if (v8)
    {
      uint64_t v15 = [v10 points];
      if (!v15 || (v16 = v93[0], unint64_t v17 = v93[1], v93[0] == v93[1]))
      {
        *(_OWORD *)__p = 0uLL;
        uint64_t v92 = 0;
      }
      else
      {
        *(_OWORD *)__p = 0uLL;
        uint64_t v92 = 0;
        *(_OWORD *)v97 = 0u;
        long long v98 = 0u;
        int v99 = 1065353216;
        float32x4_t v90 = (float32x4_t)vdupq_n_s32(0x3C23D70Au);
        do
        {
          simd_float4 v18 = (simd_float4)vdivq_f32(*(float32x4_t *)(v15 + 16 * *v16), v90);
          v18.i32[3] = 0;
          simd_float4 v19 = _simd_round_f4(v18);
          *(int32x2_t *)v19.f32 = vcvt_s32_f32(*(float32x2_t *)v19.f32);
          LOWORD(v20) = 0;
          WORD1(v20) = v19.i16[0];
          WORD2(v20) = v19.i16[2];
          *(void *)((char *)&v20 + 6) = (unsigned __int16)(int)v19.f32[2];
          unint64_t v96 = v20;
          if (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(v97, &v96))
          {
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)v97, &v96, &v96);
            v21 = (char *)__p[1];
            if (__p[1] >= v92)
            {
              unint64_t v23 = (char *)__p[0];
              uint64_t v24 = ((char *)__p[1] - (char *)__p[0]) >> 3;
              unint64_t v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 61) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v26 = v92 - (char *)__p[0];
              if ((v92 - (char *)__p[0]) >> 2 > v25) {
                unint64_t v25 = v26 >> 2;
              }
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v27 = v25;
              }
              if (v27)
              {
                long long v28 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v92, v27);
                v21 = (char *)__p[1];
                unint64_t v23 = (char *)__p[0];
              }
              else
              {
                long long v28 = 0;
              }
              uint64_t v29 = &v28[8 * v24];
              *(void *)uint64_t v29 = *v16;
              uint64_t v22 = (uint64_t)(v29 + 8);
              while (v21 != v23)
              {
                uint64_t v30 = *((void *)v21 - 1);
                v21 -= 8;
                *((void *)v29 - 1) = v30;
                v29 -= 8;
              }
              __p[0] = v29;
              uint64_t v92 = &v28[8 * v27];
              if (v23) {
                operator delete(v23);
              }
            }
            else
            {
              *(void *)__p[1] = *v16;
              uint64_t v22 = (uint64_t)__p[1] + 8;
            }
            __p[1] = (void *)v22;
          }
          ++v16;
        }
        while (v16 != v17);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v97);
      }
      if (v93[0])
      {
        v93[1] = v93[0];
        operator delete(v93[0]);
      }
      *(_OWORD *)objc_super v93 = *(_OWORD *)__p;
      v94 = v92;
    }
    if (v7)
    {
      v97[0] = 0;
      v97[1] = 0;
      *(void *)&long long v98 = 0;
      id v32 = v93[1];
      if (v93[1] == v93[0])
      {
        int v45 = 0;
        id v33 = 0;
        v44 = 0;
      }
      else
      {
        id v33 = 0;
        unint64_t v34 = 0;
        id v32 = v93[0];
        do
        {
          if ((unint64_t)v33 >= (unint64_t)v98)
          {
            uint64_t v35 = (char *)v97[0];
            uint64_t v36 = (v33 - (char *)v97[0]) >> 3;
            unint64_t v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) >> 61) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v38 = v98 - (unint64_t)v97[0];
            if ((uint64_t)(v98 - (unint64_t)v97[0]) >> 2 > v37) {
              unint64_t v37 = v38 >> 2;
            }
            if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v39 = v37;
            }
            if (v39)
            {
              unint64_t v40 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v98, v39);
              uint64_t v35 = (char *)v97[0];
              id v33 = (char *)v97[1];
            }
            else
            {
              unint64_t v40 = 0;
            }
            uint64_t v41 = &v40[8 * v36];
            *(void *)uint64_t v41 = v32[v34];
            uint64_t v42 = v41 + 8;
            while (v33 != v35)
            {
              uint64_t v43 = *((void *)v33 - 1);
              v33 -= 8;
              *((void *)v41 - 1) = v43;
              v41 -= 8;
            }
            v97[0] = v41;
            v97[1] = v42;
            *(void *)&long long v98 = &v40[8 * v39];
            if (v35) {
              operator delete(v35);
            }
            id v33 = (char *)v42;
          }
          else
          {
            *(void *)id v33 = v32[v34];
            v33 += 8;
          }
          v97[1] = v33;
          unint64_t v34 = (int)v34 + 3;
          id v32 = v93[0];
        }
        while (v34 < ((char *)v93[1] - (char *)v93[0]) >> 3);
        v44 = v97[0];
        int v45 = (char *)v98;
      }
      v93[0] = v44;
      v93[1] = v33;
      v97[0] = v32;
      *(void *)&long long v98 = v94;
      v94 = v45;
      if (v32)
      {
        v97[1] = v32;
        operator delete(v32);
      }
    }
    if (v6)
    {
      uint64_t v46 = [v10 points];
      uint64_t v47 = v46;
      if (v46)
      {
        id v48 = (uint64_t *)v93[0];
        int64_t v49 = (uint64_t *)v93[1];
        if (v93[0] != v93[1])
        {
          v97[0] = 0;
          v97[1] = 0;
          float32x2_t v50 = 0;
          unint64_t v51 = (uint64_t *)v93[0];
          *(void *)&long long v98 = 0;
          do
          {
            uint64_t v52 = *v51++;
            float32x2_t v53 = *(float32x2_t *)(v46 + 16 * v52);
            float32x2_t v50 = vadd_f32(v50, v53);
          }
          while (v51 != v93[1]);
          v53.f32[0] = (float)(unint64_t)(((char *)v93[1] - (char *)v93[0]) >> 3);
          float32x2_t v54 = (float32x2_t)vdup_lane_s32((int32x2_t)v53, 0);
          float32x2_t v55 = vdiv_f32(v50, v54);
          float32x2_t v56 = 0;
          uint64_t v57 = (uint64_t *)v93[0];
          do
          {
            uint64_t v58 = *v57++;
            float32x2_t v59 = vsub_f32(*(float32x2_t *)(v46 + 16 * v58), v55);
            float32x2_t v56 = vmla_f32(v56, v59, v59);
          }
          while (v57 != v93[1]);
          unint64_t v60 = 0;
          float32x2_t v61 = vsqrt_f32(vdiv_f32(v56, v54));
          __asm { FMOV            V1.2S, #3.0 }
          float32x2_t v67 = vmul_f32(v61, _D1);
          do
          {
            uint64_t v68 = *v48;
            int32x2_t v69 = vcgt_f32(vabd_f32(*(float32x2_t *)(v47 + 16 * *v48), v55), v67);
            if (((v69.i32[0] | v69.i32[1]) & 1) == 0)
            {
              if ((unint64_t)v60 >= (unint64_t)v98)
              {
                long long v71 = (char *)v97[0];
                uint64_t v72 = (v60 - (char *)v97[0]) >> 3;
                unint64_t v73 = v72 + 1;
                if ((unint64_t)(v72 + 1) >> 61) {
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v74 = v98 - (unint64_t)v97[0];
                if ((uint64_t)(v98 - (unint64_t)v97[0]) >> 2 > v73) {
                  unint64_t v73 = v74 >> 2;
                }
                if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v75 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v75 = v73;
                }
                if (v75)
                {
                  uint64_t v76 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v98, v75);
                  long long v71 = (char *)v97[0];
                  unint64_t v60 = (char *)v97[1];
                  uint64_t v68 = *v48;
                }
                else
                {
                  uint64_t v76 = 0;
                }
                uint64_t v77 = &v76[8 * v72];
                *(void *)uint64_t v77 = v68;
                float32x4_t v70 = v77 + 8;
                while (v60 != v71)
                {
                  uint64_t v78 = *((void *)v60 - 1);
                  v60 -= 8;
                  *((void *)v77 - 1) = v78;
                  v77 -= 8;
                }
                v97[0] = v77;
                v97[1] = v70;
                *(void *)&long long v98 = &v76[8 * v75];
                if (v71) {
                  operator delete(v71);
                }
              }
              else
              {
                *(void *)unint64_t v60 = v68;
                float32x4_t v70 = v60 + 8;
              }
              v97[1] = v70;
              unint64_t v60 = (char *)v70;
            }
            ++v48;
          }
          while (v48 != v49);
          long long v79 = (char *)v98;
          v80 = v93[0];
          v93[0] = v97[0];
          v93[1] = v60;
          v97[0] = v80;
          *(void *)&long long v98 = v94;
          v94 = v79;
          if (v80)
          {
            v97[1] = v80;
            operator delete(v80);
          }
        }
      }
    }
    -[OUKeyframeExtended select:indices:from:](v11, "select:indices:from:", ((char *)v93[1] - (char *)v93[0]) >> 3, *(_OWORD *)&v90);
    uint64_t v81 = [v10 identifier];
    identifier = v11->identifier;
    v11->identifier = (NSUUID *)v81;

    [v10 cameraPose];
    *(_OWORD *)&v11[1].super.isa = v83;
    *(_OWORD *)&v11[1]._anon_8[8] = v84;
    *(_OWORD *)v11[1]._anon_20 = v85;
    *(_OWORD *)&v11[1]._anon_20[16] = v86;
    [v10 timestamp];
    v11->timestamp = v87;
    v11->groupId = 0;
    v88 = v11;
    if (v93[0])
    {
      v93[1] = v93[0];
      operator delete(v93[0]);
    }
  }
  else
  {
    id v31 = v11;
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (__n128)cameraPose
{
  return a1[10];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (unsigned)groupId
{
  return self->groupId;
}

- (void)setGroupId:(unsigned int)a3
{
  self->groupId = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);
  float32x4_t v3 = *(void **)self->_anon_68;
  if (v3)
  {
    *(void *)&self->_anon_68[8] = v3;
    operator delete(v3);
  }
  int32x4_t v4 = *(void **)self->_anon_50;
  if (v4)
  {
    *(void *)&self->_anon_50[8] = v4;
    operator delete(v4);
  }
  int32x4_t v5 = *(void **)self->_anon_38;
  if (v5)
  {
    *(void *)&self->_anon_38[8] = v5;
    operator delete(v5);
  }
  BOOL v6 = *(void **)self->_anon_20;
  if (v6)
  {
    *(void *)&self->_anon_20[8] = v6;
    operator delete(v6);
  }
  BOOL v7 = *(void **)self->_anon_8;
  if (v7)
  {
    *(void *)&self->_anon_8[8] = v7;
    operator delete(v7);
  }
}

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

@end