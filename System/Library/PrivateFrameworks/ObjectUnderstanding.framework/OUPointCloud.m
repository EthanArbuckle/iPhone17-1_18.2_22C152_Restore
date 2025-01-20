@interface OUPointCloud
- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:;
- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:;
- (OUPointCloud)initWithDictionary:(id)a3;
- (const)getCpp;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)colors;
- (uint64_t)points;
- (uint64_t)semanticLabels;
- (uint64_t)semanticVotes;
- (unint64_t)count;
- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:;
- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:;
- (void)resample:(unint64_t)a3;
- (void)reset;
@end

@implementation OUPointCloud

- (unint64_t)count
{
  return (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4;
}

- (uint64_t)points
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
  return *(void *)(a1 + 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(OUPointCloud);
  v5 = (char *)v4;
  if (v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5 + 32, *(char **)&self->_anon_8[24], *(void *)&self->_anon_8[32], (uint64_t)(*(void *)&self->_anon_8[32] - *(void *)&self->_anon_8[24]) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v5 + 56, *(char **)&self->_anon_8[48], *(void *)&self->_anon_8[56], (uint64_t)(*(void *)&self->_anon_8[56] - *(void *)&self->_anon_8[48]) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5 + 80, *(char **)&self->_anon_8[72], *(void *)&self->_anon_8[80], (uint64_t)(*(void *)&self->_anon_8[80] - *(void *)&self->_anon_8[72]) >> 3);
  }
  return v5;
}

- (OUPointCloud)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(OUPointCloud *)self init];
  v6 = [v4 objectForKeyedSubscript:@"count"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = [v4 objectForKeyedSubscript:@"colors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v10 = v9;
  v11 = (char *)[v10 bytes];
  uint64_t v12 = [v10 length];
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v11, (uint64_t)&v11[v12 & 0xFFFFFFFFFFFFFFFCLL], v12 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v57, ((v55 - (unsigned char *)__p) >> 2) / 3uLL);
  uint64_t v13 = v57;
  uint64_t v14 = v58;
  if (v58 == v57)
  {
    uint64_t v13 = v58;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = v13 + v15;
      uint64_t v19 = *(void *)((char *)__p + v16);
      *(_DWORD *)(v18 + 8) = *(_DWORD *)((char *)__p + v16 + 8);
      *(void *)uint64_t v18 = v19;
      ++v17;
      uint64_t v13 = v57;
      uint64_t v14 = v58;
      v16 += 12;
      v15 += 16;
    }
    while (v17 < (v58 - v57) >> 4);
  }
  v20 = *(void **)v5->_anon_8;
  if (v20)
  {
    *(void *)&v5->_anon_8[8] = v20;
    operator delete(v20);
    *(void *)v5->_anon_8 = 0;
    *(void *)&v5->_anon_8[8] = 0;
    *(void *)&v5->_anon_8[16] = 0;
    uint64_t v13 = v57;
    uint64_t v14 = v58;
  }
  *(void *)v5->_anon_8 = v13;
  *(void *)&v5->_anon_8[8] = v14;
  *(void *)&v5->_anon_8[16] = v59;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  id v21 = [v4 objectForKeyedSubscript:@"points"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  id v23 = v22;
  v24 = (char *)[v23 bytes];
  uint64_t v25 = [v23 length];
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v24, (uint64_t)&v24[v25 & 0xFFFFFFFFFFFFFFFCLL], v25 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v57, ((v55 - (unsigned char *)__p) >> 2) / 3uLL);
  uint64_t v26 = v57;
  uint64_t v27 = v58;
  if (v58 == v57)
  {
    uint64_t v26 = v58;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    unint64_t v30 = 0;
    do
    {
      uint64_t v31 = v26 + v28;
      uint64_t v32 = *(void *)((char *)__p + v29);
      *(_DWORD *)(v31 + 8) = *(_DWORD *)((char *)__p + v29 + 8);
      *(void *)uint64_t v31 = v32;
      ++v30;
      uint64_t v26 = v57;
      uint64_t v27 = v58;
      v29 += 12;
      v28 += 16;
    }
    while (v30 < (v58 - v57) >> 4);
  }
  v33 = *(void **)&v5->_anon_8[24];
  if (v33)
  {
    *(void *)&v5->_anon_8[32] = v33;
    operator delete(v33);
    *(void *)&v5->_anon_8[24] = 0;
    *(void *)&v5->_anon_8[32] = 0;
    *(void *)&v5->_anon_8[40] = 0;
    uint64_t v26 = v57;
    uint64_t v27 = v58;
  }
  *(void *)&v5->_anon_8[24] = v26;
  *(void *)&v5->_anon_8[32] = v27;
  *(void *)&v5->_anon_8[40] = v59;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  id v34 = [v4 objectForKeyedSubscript:@"semanticLabels"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }

  id v36 = v35;
  v37 = (char *)[v36 bytes];
  unint64_t v38 = [v36 length];
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v37, &v37[v38], v38);

  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEEC2Em(&v57, (unint64_t)(v55 - (unsigned char *)__p) >> 2);
  uint64_t v39 = v57;
  uint64_t v40 = v58;
  if (v58 == v57)
  {
    uint64_t v39 = v58;
  }
  else
  {
    unint64_t v41 = 0;
    do
    {
      *(_DWORD *)(v39 + 4 * v41) = *((_DWORD *)__p + v41);
      ++v41;
      uint64_t v39 = v57;
      uint64_t v40 = v58;
    }
    while (v41 < (v58 - v57) >> 2);
  }
  v42 = *(void **)&v5->_anon_8[48];
  if (v42)
  {
    *(void *)&v5->_anon_8[56] = v42;
    operator delete(v42);
    *(void *)&v5->_anon_8[48] = 0;
    *(void *)&v5->_anon_8[56] = 0;
    *(void *)&v5->_anon_8[64] = 0;
    uint64_t v39 = v57;
    uint64_t v40 = v58;
  }
  *(void *)&v5->_anon_8[48] = v39;
  *(void *)&v5->_anon_8[56] = v40;
  *(void *)&v5->_anon_8[64] = v59;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  id v43 = [v4 objectForKeyedSubscript:@"semanticVotes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v44 = v43;
  }
  else {
    id v44 = 0;
  }

  id v45 = v44;
  v46 = (char *)[v45 bytes];
  uint64_t v47 = [v45 length];
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>((char *)&__p, v46, (uint64_t)&v46[v47 & 0xFFFFFFFFFFFFFFFELL], v47 >> 1);

  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEEC2Em(&v57, (unint64_t)((v55 - (unsigned char *)__p) >> 1) >> 2);
  uint64_t v48 = v57;
  uint64_t v49 = v58;
  if (v58 == v57)
  {
    uint64_t v48 = v58;
  }
  else
  {
    unint64_t v50 = 0;
    do
    {
      *(void *)(v48 + 8 * v50) = *((void *)__p + v50);
      ++v50;
      uint64_t v48 = v57;
      uint64_t v49 = v58;
    }
    while (v50 < (v58 - v57) >> 3);
  }
  v51 = *(void **)&v5->_anon_8[72];
  if (v51)
  {
    *(void *)&v5->_anon_8[80] = v51;
    operator delete(v51);
    *(void *)&v5->_anon_8[72] = 0;
    *(void *)&v5->_anon_8[80] = 0;
    *(void *)&v5->_anon_8[88] = 0;
    uint64_t v48 = v57;
    uint64_t v49 = v58;
  }
  *(void *)&v5->_anon_8[72] = v48;
  *(void *)&v5->_anon_8[80] = v49;
  *(void *)&v5->_anon_8[88] = v59;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  if (OUPointCloudCpp::IsValid((OUPointCloudCpp *)v5->_anon_8)
    && v7 == (uint64_t)(*(void *)&v5->_anon_8[8] - *(void *)v5->_anon_8) >> 4)
  {
    v52 = v5;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:
{
  v6 = v5;
  uint64_t v7 = v4;
  id v8 = v3;
  v12.receiver = self;
  v12.super_class = (Class)OUPointCloud;
  id v10 = [(OUPointCloud *)&v12 init];
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 8, a3);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 32, a3);
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 56, a3);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 80, a3);
  memcpy(*((void **)v10 + 4), v8, 16 * a3);
  memcpy(*((void **)v10 + 7), v7, 4 * a3);
  memcpy(*((void **)v10 + 10), v6, 8 * a3);
  return (OUPointCloud *)v10;
}

- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  id v4 = v3;
  v6 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:](self, "initWithCount:points:semanticLabels:semanticVotes:");
  memcpy(*(void **)v6->_anon_8, v4, 16 * a3);
  return v6;
}

- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:
{
  v6 = v5;
  uint64_t v7 = v4;
  id v8 = v3;
  unint64_t v11 = [(OUPointCloud *)self count];
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)self->_anon_8, v11 + a3);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[24], v11 + a3);
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[48], v11 + a3);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[72], v11 + a3);
  memcpy((void *)(*(void *)&self->_anon_8[24] + 16 * v11), v8, 16 * a3);
  memcpy((void *)(*(void *)&self->_anon_8[48] + 4 * v11), v7, 4 * a3);
  objc_super v12 = (void *)(*(void *)&self->_anon_8[72] + 8 * v11);
  memcpy(v12, v6, 8 * a3);
}

- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  uint64_t v9 = v4;
  uint64_t v10 = v3;
  unint64_t v13 = [(OUPointCloud *)self count];
  [(OUPointCloud *)self append:a3 points:v10 semanticLabels:v9 semanticVotes:v8];
  uint64_t v14 = (void *)(*(void *)self->_anon_8 + 16 * v13);
  memcpy(v14, v7, 16 * a3);
}

- (void)resample:(unint64_t)a3
{
  uint64_t v5 = [(OUPointCloud *)self count];
  if (a3 && (unint64_t)v5 > a3)
  {
    utils::Resample(v5, a3, &__p);
    anon_8 = self->_anon_8;
    uint64_t v7 = v19 - (unsigned char *)__p;
    if ((int)((unint64_t)(v19 - (unsigned char *)__p) >> 3) >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        *(_OWORD *)(*(void *)anon_8 + 16 * v8) = *(_OWORD *)(*(void *)anon_8 + 16 * *((void *)__p + v8));
        ++v8;
      }
      while (((unint64_t)v7 >> 3) != v8);
    }
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)anon_8, (int)(v7 >> 3));
    uint64_t v9 = &self->_anon_8[24];
    uint64_t v10 = v19 - (unsigned char *)__p;
    if ((int)((unint64_t)(v19 - (unsigned char *)__p) >> 3) >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        *(_OWORD *)(*(void *)v9 + 16 * v11) = *(_OWORD *)(*(void *)v9 + 16 * *((void *)__p + v11));
        ++v11;
      }
      while (((unint64_t)v10 >> 3) != v11);
    }
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v9, (int)(v10 >> 3));
    objc_super v12 = &self->_anon_8[48];
    uint64_t v13 = v19 - (unsigned char *)__p;
    if ((int)((unint64_t)(v19 - (unsigned char *)__p) >> 3) >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(_DWORD *)(*(void *)v12 + 4 * v14) = *(_DWORD *)(*(void *)v12 + 4 * *((void *)__p + v14));
        ++v14;
      }
      while (((unint64_t)v13 >> 3) != v14);
    }
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v12, (int)(v13 >> 3));
    uint64_t v15 = &self->_anon_8[72];
    uint64_t v16 = v19 - (unsigned char *)__p;
    if ((int)((unint64_t)(v19 - (unsigned char *)__p) >> 3) >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        *(void *)(*(void *)v15 + v17) = *(void *)(*(void *)v15 + 8 * *(void *)((char *)__p + v17));
        v17 += 8;
      }
      while ((v16 & 0x7FFFFFFF8) != v17);
    }
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v15, (int)(v16 >> 3));
    if (__p)
    {
      uint64_t v19 = __p;
      operator delete(__p);
    }
  }
}

- (void)reset
{
  *(void *)&self->_anon_8[8] = *(void *)self->_anon_8;
  *(void *)&self->_anon_8[32] = *(void *)&self->_anon_8[24];
  *(void *)&self->_anon_8[56] = *(void *)&self->_anon_8[48];
  *(void *)&self->_anon_8[80] = *(void *)&self->_anon_8[72];
}

- (const)getCpp
{
  return self->_anon_8;
}

- (void).cxx_destruct
{
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->pointRangeOfKeyframes);
  uint64_t v3 = *(void **)&self->_anon_8[72];
  if (v3)
  {
    *(void *)&self->_anon_8[80] = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)&self->_anon_8[48];
  if (v4)
  {
    *(void *)&self->_anon_8[56] = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)&self->_anon_8[24];
  if (v5)
  {
    *(void *)&self->_anon_8[32] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(void *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  return self;
}

@end