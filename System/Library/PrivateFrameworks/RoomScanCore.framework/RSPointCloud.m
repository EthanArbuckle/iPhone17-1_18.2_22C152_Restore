@interface RSPointCloud
- (BOOL)isEqual:(id)a3;
- (RSPointCloud)init;
- (RSPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:;
- (RSPointCloud)initWithDictionary:(id)a3;
- (RSPointCloud)initWithKeyframes:(id)a3 enableCameraPosition:(BOOL)a4;
- (__n128)mappingIntervalOfKeyframe:(void *)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)cameraPositions;
- (uint64_t)colors;
- (uint64_t)points;
- (uint64_t)rawPoints;
- (uint64_t)semanticLabels;
- (uint64_t)semanticVotes;
- (unint64_t)count;
- (unint64_t)rawCount;
- (unint64_t)rawUpdateCursor;
- (void)accumulateWithKeyframesInWorld:(id)a3 voxelize:(BOOL)a4;
- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:;
- (void)processWithVoxelize:(BOOL)a3 asPythonApproach:(BOOL)a4 resample:(BOOL)a5;
- (void)reset;
- (void)select:(unint64_t)a3 indices:(const unint64_t *)a4;
@end

@implementation RSPointCloud

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_DWORD *)self + 50) = 1065353216;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  *((void *)self + 37) = 0;
  *((_DWORD *)self + 76) = 1065353216;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  return self;
}

- (void).cxx_destruct
{
  sub_25B40107C((uint64_t)&self->_rawMappingInterval);
  v3 = *(void **)self->_anon_f8;
  if (v3)
  {
    *(void *)&self->_anon_f8[8] = v3;
    operator delete(v3);
  }
  sub_25B53C3EC((void *)self->_keyframeVoxelSet.__table_.__p1_.__value_.__next_);
  value = self->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value_;
  self->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  sub_25B3FB178((uint64_t)&self->_voxelSet);
  sub_25B40107C((uint64_t)&self->_mappingInterval);
  v5 = *(void **)self->_anon_68;
  if (v5)
  {
    *(void *)&self->_anon_68[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_50;
  if (v6)
  {
    *(void *)&self->_anon_50[8] = v6;
    operator delete(v6);
  }
  v7 = *(void **)self->_anon_38;
  if (v7)
  {
    *(void *)&self->_anon_38[8] = v7;
    operator delete(v7);
  }
  v8 = *(void **)self->_anon_20;
  if (v8)
  {
    *(void *)&self->_anon_20[8] = v8;
    operator delete(v8);
  }
  v9 = *(void **)self->_anon_8;
  if (v9)
  {
    *(void *)&self->_anon_8[8] = v9;
    operator delete(v9);
  }
}

- (uint64_t)cameraPositions
{
  return *(void *)(a1 + 104);
}

- (unint64_t)rawUpdateCursor
{
  return self->_rawUpdateCursor;
}

- (unint64_t)rawCount
{
  return (uint64_t)(*(void *)&self->_anon_f8[8] - *(void *)self->_anon_f8) >> 4;
}

- (uint64_t)rawPoints
{
  return *(void *)(a1 + 248);
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RSPointCloud *)a3;
  v6 = v5;
  if (v5 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v6;
        if (self)
        {
          uint64_t v10 = objc_msgSend_count(self, v7, v8);
          if (v10 != objc_msgSend_count(v9, v11, v12))
          {
LABEL_16:
            LOBYTE(self) = 0;
            goto LABEL_17;
          }
          uint64_t v15 = *(void *)self->_anon_8;
          if (*(void *)&self->_anon_8[8] != v15)
          {
            unint64_t v16 = 0;
            do
            {
              float32x4_t v19 = vabdq_f32(*(float32x4_t *)(v15 + 16 * v16), *(float32x4_t *)(objc_msgSend_points(v9, v13, v14) + 16 * v16));
              if (fmaxf(fmaxf(v19.f32[0], v19.f32[2]), v19.f32[1]) > 0.000001) {
                goto LABEL_16;
              }
              v3.i32[0] = *(_DWORD *)(*(void *)self->_anon_20 + 4 * v16);
              v22.i32[0] = *(_DWORD *)(objc_msgSend_semanticLabels(v9, v17, v18) + 4 * v16);
              int8x8_t v23 = (int8x8_t)vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v3), (int16x4_t)*(_OWORD *)&vmovl_u8(v22));
              if ((vminv_u8((uint8x8_t)vuzp1_s8(v23, v23)) & 0x80) == 0) {
                goto LABEL_16;
              }
              int16x4_t v3 = *(int16x4_t *)(*(void *)self->_anon_38 + 8 * v16);
              if ((vminv_u16((uint16x4_t)vceq_s16(v3, *(int16x4_t *)(objc_msgSend_semanticVotes(v9, v20, v21) + 8 * v16))) & 0x8000) == 0)goto LABEL_16; {
              float32x4_t v26 = vabdq_f32(*(float32x4_t *)(*(void *)self->_anon_50 + 16 * v16), *(float32x4_t *)(objc_msgSend_colors(v9, v24, v25) + 16 * v16));
              }
              if (fmaxf(fmaxf(v26.f32[0], v26.f32[2]), v26.f32[1]) > 0.000001) {
                goto LABEL_16;
              }
              ++v16;
              uint64_t v15 = *(void *)self->_anon_8;
            }
            while (v16 < (*(void *)&self->_anon_8[8] - v15) >> 4);
          }
          LOBYTE(self) = 1;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_18:

  return (char)self;
}

- (void)reset
{
  *(void *)&self->_anon_8[8] = *(void *)self->_anon_8;
  *(void *)&self->_anon_20[8] = *(void *)self->_anon_20;
  *(void *)&self->_anon_38[8] = *(void *)self->_anon_38;
  *(void *)&self->_anon_50[8] = *(void *)self->_anon_50;
  *(void *)&self->_anon_68[8] = *(void *)self->_anon_68;
  sub_25B4011C0((uint64_t)&self->_mappingInterval);
  sub_25B52F9E0(&self->_voxelSet.__table_.__bucket_list_.__ptr_.__value_);
  if (self->_keyframeVoxelSet.__table_.__p2_.__value_)
  {
    sub_25B53C3EC((void *)self->_keyframeVoxelSet.__table_.__p1_.__value_.__next_);
    self->_keyframeVoxelSet.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_keyframeVoxelSet.__table_.__p2_.__value_ = 0;
  }
  *(void *)&self->_anon_f8[8] = *(void *)self->_anon_f8;
  sub_25B4011C0((uint64_t)&self->_rawMappingInterval);
  self->_rawUpdateCursor = 0;
  self->_isCameraPositionEnabled = 0;
}

- (__n128)mappingIntervalOfKeyframe:(void *)a3
{
  id v4 = a3;
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_25B403500(__p, v7);
  uint64_t v8 = (void *)(a1 + 128);
  if (sub_25B414548(v8, (unsigned __int8 *)__p))
  {
    v9 = sub_25B4035B0(v8, (unsigned __int8 *)__p);
    if (!v9) {
      sub_25B3FC090("unordered_map::at: key not found");
    }
    *(void *)&long long v10 = *((void *)v9 + 5);
  }
  else
  {
    long long v10 = 0uLL;
  }
  long long v12 = v10;
  if (v14 < 0) {
    operator delete(__p[0]);
  }

  return (__n128)v12;
}

- (void)select:(unint64_t)a3 indices:(const unint64_t *)a4
{
  float32x4_t v19 = 0;
  v20 = 0;
  uint64_t v21 = 0;
  sub_25B4E35C4(&v19, a4, (uint64_t)&a4[a3], a3);
  sub_25B53CAA0((uint64_t)&v22, (uint64_t)self->_anon_8, &v19);
  v5 = *(void **)self->_anon_8;
  if (v5)
  {
    *(void *)&self->_anon_8[8] = v5;
    operator delete(v5);
    *(void *)self->_anon_8 = 0;
    *(void *)&self->_anon_8[8] = 0;
    *(void *)&self->_anon_8[16] = 0;
  }
  *(_OWORD *)self->_anon_8 = v22;
  *(void *)&self->_anon_8[16] = v23;
  uint64_t v18 = 0;
  long long v17 = 0uLL;
  uint64_t v6 = v19;
  v7 = v20;
  unint64_t v8 = v20 - v19;
  sub_25B4E3720((void **)&v17, v8);
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  sub_25B4E37C8(&v22, *(const void **)self->_anon_20, *(void *)&self->_anon_20[8], (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 2);
  uint64_t v25 = (void **)&v17;
  v9 = (_DWORD *)v22;
  if (v6 == v7)
  {
    if (!(void)v22) {
      goto LABEL_9;
    }
  }
  else
  {
    long long v10 = v6;
    do
    {
      LODWORD(v24) = v9[*v10];
      sub_25B4E3844(&v25, &v24);
      ++v10;
    }
    while (v10 != v7);
  }
  operator delete(v9);
LABEL_9:
  v11 = *(void **)self->_anon_20;
  if (v11)
  {
    *(void *)&self->_anon_20[8] = v11;
    operator delete(v11);
    *(void *)self->_anon_20 = 0;
    *(void *)&self->_anon_20[8] = 0;
    *(void *)&self->_anon_20[16] = 0;
  }
  *(_OWORD *)self->_anon_20 = v17;
  *(void *)&self->_anon_20[16] = v18;
  uint64_t v18 = 0;
  long long v17 = 0uLL;
  sub_25B443B1C((void **)&v17, v8);
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  sub_25B4E3924(&v22, *(const void **)self->_anon_38, *(void *)&self->_anon_38[8], (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 3);
  uint64_t v25 = (void **)&v17;
  long long v12 = (void *)v22;
  if (v6 == v7)
  {
    if (!(void)v22) {
      goto LABEL_17;
    }
  }
  else
  {
    v13 = v6;
    do
    {
      uint64_t v24 = v12[*v13];
      sub_25B4E39A0(&v25, &v24);
      ++v13;
    }
    while (v13 != v7);
  }
  operator delete(v12);
LABEL_17:
  char v14 = *(void **)self->_anon_38;
  if (v14)
  {
    *(void *)&self->_anon_38[8] = v14;
    operator delete(v14);
    *(void *)self->_anon_38 = 0;
    *(void *)&self->_anon_38[8] = 0;
    *(void *)&self->_anon_38[16] = 0;
  }
  *(_OWORD *)self->_anon_38 = v17;
  *(void *)&self->_anon_38[16] = v18;
  sub_25B53CAA0((uint64_t)&v22, (uint64_t)self->_anon_50, &v19);
  uint64_t v15 = *(void **)self->_anon_50;
  if (v15)
  {
    *(void *)&self->_anon_50[8] = v15;
    operator delete(v15);
    *(void *)self->_anon_50 = 0;
    *(void *)&self->_anon_50[8] = 0;
    *(void *)&self->_anon_50[16] = 0;
  }
  *(_OWORD *)self->_anon_50 = v22;
  *(void *)&self->_anon_50[16] = v23;
  if (self->_isCameraPositionEnabled)
  {
    sub_25B53CAA0((uint64_t)&v22, (uint64_t)self->_anon_68, &v19);
    unint64_t v16 = *(void **)self->_anon_68;
    if (v16)
    {
      *(void *)&self->_anon_68[8] = v16;
      operator delete(v16);
      *(void *)self->_anon_68 = 0;
      *(void *)&self->_anon_68[8] = 0;
      *(void *)&self->_anon_68[16] = 0;
    }
    *(_OWORD *)self->_anon_68 = v22;
    *(void *)&self->_anon_68[16] = v23;
  }
  if (v6) {
    operator delete(v6);
  }
}

- (void)processWithVoxelize:(BOOL)a3 asPythonApproach:(BOOL)a4 resample:(BOOL)a5
{
  uint64_t v5 = *(void *)self->_anon_8;
  uint64_t v6 = *(void *)&self->_anon_8[8];
  if (v5 != v6)
  {
    BOOL v7 = a5;
    BOOL v8 = a4;
    BOOL v9 = a3;
    sub_25B400BE4(&__p, (v6 - v5) >> 4);
    long long v12 = __p;
    v13 = v17;
    if (__p != v17)
    {
      uint64_t v14 = 0;
      do
        *v12++ = v14++;
      while (v12 != v13);
    }
    if (v9)
    {
      uint64_t v15 = *(void *)self->_anon_8;
      if (v8) {
        sub_25B4FE36C(v15, (char **)&__p);
      }
      else {
        sub_25B4FDF70(v15, (uint64_t)&__p);
      }
    }
    if (v7) {
      sub_25B4FDDF4((uint64_t)&__p);
    }
    objc_msgSend_select_indices_(self, v11, (v17 - (unsigned char *)__p) >> 3);
    if (__p)
    {
      long long v17 = __p;
      operator delete(__p);
    }
  }
}

- (void)accumulateWithKeyframesInWorld:(id)a3 voxelize:(BOOL)a4
{
  BOOL v302 = a4;
  uint64_t v335 = *MEMORY[0x263EF8340];
  v328 = self;
  id v296 = a3;
  if (objc_msgSend_count(v296, v4, v5))
  {
    unint64_t v325 = 0;
    v326 = 0;
    unint64_t v327 = 0;
    long long v321 = 0u;
    long long v322 = 0u;
    long long v323 = 0u;
    long long v324 = 0u;
    id v6 = v296;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v321, v334, 16);
    v309 = v6;
    if (v10)
    {
      uint64_t v11 = *(void *)v322;
      do
      {
        uint64_t v12 = 0;
        uint64_t v311 = v10;
        do
        {
          if (*(void *)v322 != v11) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v321 + 1) + 8 * v12);
          if (objc_msgSend_count(v13, v8, v9))
          {
            uint64_t v14 = objc_msgSend_identifier(v13, v8, v9);
            objc_msgSend_UUIDString(v14, v15, v16);
            id v17 = objc_claimAutoreleasedReturnValue();
            v20 = (char *)objc_msgSend_UTF8String(v17, v18, v19);
            sub_25B403500(&__p, v20);

            uint64_t v21 = v328;
            unint64_t v22 = sub_25B403AF4((uint64_t)&__p);
            int8x8_t value = (int8x8_t)v21->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            if (value)
            {
              unint64_t v24 = v22;
              uint8x8_t v25 = (uint8x8_t)vcnt_s8(value);
              v25.i16[0] = vaddlv_u8(v25);
              unint64_t v26 = v25.u32[0];
              if (v25.u32[0] > 1uLL)
              {
                unint64_t v27 = v22;
                if (v22 >= *(void *)&value) {
                  unint64_t v27 = v22 % *(void *)&value;
                }
              }
              else
              {
                unint64_t v27 = (*(void *)&value - 1) & v22;
              }
              v28 = (unsigned __int8 **)v21->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value_[v27];
              if (v28)
              {
                uint64_t v29 = v11;
                v30 = *v28;
                if (!*v28)
                {
LABEL_25:
                  uint64_t v11 = v29;
                  uint64_t v10 = v311;
                  goto LABEL_26;
                }
                while (1)
                {
                  unint64_t v31 = *((void *)v30 + 1);
                  if (v24 == v31)
                  {
                    if (sub_25B403F44(v30 + 16, (unsigned __int8 *)&__p))
                    {
                      v315[0] = &__p;
                      v35 = sub_25B53E064((uint64_t)&v21->_keyframeVoxelSet, (unsigned __int8 *)&__p, (long long **)v315)
                          + 56;
                      uint64_t v11 = v29;
                      id v6 = v309;
                      uint64_t v10 = v311;
                      while (1)
                      {
                        v35 = *(unsigned __int8 **)v35;
                        if (!v35) {
                          break;
                        }
                        v36 = (int8x8_t *)v328;
                        p_voxelSet = &v328->_voxelSet;
                        v38 = (int8x8_t *)sub_25B4CC2F8(&v328->_voxelSet.__table_.__bucket_list_.__ptr_.__value_, *((void *)v35 + 2));
                        if (v38)
                        {
                          int8x8_t v39 = v36[22];
                          unint64_t v40 = (unint64_t)v38[1];
                          uint8x8_t v41 = (uint8x8_t)vcnt_s8(v39);
                          v41.i16[0] = vaddlv_u8(v41);
                          if (v41.u32[0] > 1uLL)
                          {
                            if (v40 >= *(void *)&v39) {
                              v40 %= *(void *)&v39;
                            }
                          }
                          else
                          {
                            v40 &= *(void *)&v39 - 1;
                          }
                          v42 = (int8x8_t *)p_voxelSet->__table_.__bucket_list_.__ptr_.__value_[v40];
                          do
                          {
                            v43 = v42;
                            v42 = (int8x8_t *)*v42;
                          }
                          while (v42 != v38);
                          if (v43 == &v36[23]) {
                            goto LABEL_57;
                          }
                          unint64_t v44 = (unint64_t)v43[1];
                          if (v41.u32[0] > 1uLL)
                          {
                            if (v44 >= *(void *)&v39) {
                              v44 %= *(void *)&v39;
                            }
                          }
                          else
                          {
                            v44 &= *(void *)&v39 - 1;
                          }
                          if (v44 != v40)
                          {
LABEL_57:
                            if (!*(void *)v38) {
                              goto LABEL_58;
                            }
                            unint64_t v45 = *(void *)(*(void *)v38 + 8);
                            if (v41.u32[0] > 1uLL)
                            {
                              if (v45 >= *(void *)&v39) {
                                v45 %= *(void *)&v39;
                              }
                            }
                            else
                            {
                              v45 &= *(void *)&v39 - 1;
                            }
                            if (v45 != v40) {
LABEL_58:
                            }
                              p_voxelSet->__table_.__bucket_list_.__ptr_.__value_[v40] = 0;
                          }
                          int8x8_t v46 = *v38;
                          if (*v38)
                          {
                            unint64_t v47 = *(void *)(*(void *)&v46 + 8);
                            if (v41.u32[0] > 1uLL)
                            {
                              if (v47 >= *(void *)&v39) {
                                v47 %= *(void *)&v39;
                              }
                            }
                            else
                            {
                              v47 &= *(void *)&v39 - 1;
                            }
                            if (v47 != v40)
                            {
                              p_voxelSet->__table_.__bucket_list_.__ptr_.__value_[v47] = v43;
                              int8x8_t v46 = *v38;
                            }
                          }
                          int8x8_t *v43 = v46;
                          int8x8_t *v38 = 0;
                          --*(void *)&v36[24];
                          operator delete(v38);
                        }
                      }
                      v315[0] = &__p;
                      v48 = sub_25B53E064((uint64_t)&v328->_keyframeVoxelSet, (unsigned __int8 *)&__p, (long long **)v315);
                      sub_25B52F9E0((void *)v48 + 5);
                      uint64_t v21 = v328;
                      break;
                    }
                  }
                  else
                  {
                    if (v26 > 1)
                    {
                      if (v31 >= *(void *)&value) {
                        v31 %= *(void *)&value;
                      }
                    }
                    else
                    {
                      v31 &= *(void *)&value - 1;
                    }
                    if (v31 != v27)
                    {
LABEL_24:
                      id v6 = v309;
                      goto LABEL_25;
                    }
                  }
                  v30 = *(unsigned __int8 **)v30;
                  if (!v30) {
                    goto LABEL_24;
                  }
                }
              }
            }
LABEL_26:
            if (sub_25B414548(&v21->_mappingInterval.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)&__p))
            {
              v32 = v326;
              if ((unint64_t)v326 >= v327)
              {
                v34 = (long long *)sub_25B4A2CF4((uint64_t *)&v325, &__p);
              }
              else
              {
                if (SHIBYTE(v330) < 0)
                {
                  sub_25B4002F4(v326, (void *)__p, *((unint64_t *)&__p + 1));
                }
                else
                {
                  long long v33 = __p;
                  *((void *)v326 + 2) = v330;
                  long long *v32 = v33;
                }
                v34 = (long long *)((char *)v32 + 24);
              }
              v326 = v34;
            }
            if (SHIBYTE(v330) < 0) {
              operator delete((void *)__p);
            }
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v321, v334, 16);
        uint64_t v10 = v49;
      }
      while (v49);
    }

    unint64_t v50 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v326 - v325) >> 3));
    *(void *)&long long __p = &v328;
    if (v326 == (long long *)v325) {
      uint64_t v51 = 0;
    }
    else {
      uint64_t v51 = v50;
    }
    sub_25B53E4D0(v325, (unint64_t)v326, (void **)&__p, v51, 1);
    v52 = (unsigned __int8 *)v325;
    v53 = (unsigned __int8 *)v326;
    v54 = (uint64_t *)v328;
    if ((long long *)v325 != v326)
    {
      do
      {
        *(void *)&long long __p = v52;
        unsigned int v312 = *((void *)sub_25B53F6AC(v54 + 16, v52, (long long **)&__p) + 5);
        *(void *)&long long __p = v52;
        uint64_t v55 = *((unsigned int *)sub_25B53F6AC((uint64_t *)&v328->_mappingInterval, v52, (long long **)&__p) + 11);
        v56 = v328;
        if (v55)
        {
          uint64_t v57 = *(void *)v328->_anon_8;
          v58 = *(unsigned char **)&v328->_anon_8[8];
          uint64_t v59 = v57 + 16 * v312;
          v60 = (unsigned char *)(v59 + 16 * v55);
          v61 = v328;
          int64_t v62 = v58 - v60;
          if (v58 != v60)
          {
            memmove((void *)(v57 + 16 * v312), v60, v58 - v60);
            v61 = v328;
          }
          *(void *)&v56->_anon_8[8] = v59 + v62;
          uint64_t v63 = *(void *)v61->_anon_20;
          v64 = *(unsigned char **)&v61->_anon_20[8];
          uint64_t v65 = v63 + 4 * v312;
          v66 = (unsigned char *)(v65 + 4 * v55);
          v67 = v61;
          int64_t v68 = v64 - v66;
          if (v64 != v66)
          {
            memmove((void *)(v63 + 4 * v312), v66, v64 - v66);
            v67 = v328;
          }
          *(void *)&v61->_anon_20[8] = v65 + v68;
          uint64_t v69 = *(void *)v67->_anon_38;
          v70 = *(unsigned char **)&v67->_anon_38[8];
          uint64_t v71 = v69 + 8 * v312;
          v72 = (unsigned char *)(v71 + 8 * v55);
          v73 = v67;
          int64_t v74 = v70 - v72;
          if (v70 != v72)
          {
            memmove((void *)(v69 + 8 * v312), v72, v70 - v72);
            v73 = v328;
          }
          *(void *)&v67->_anon_38[8] = v71 + v74;
          uint64_t v75 = *(void *)v73->_anon_50;
          v76 = *(unsigned char **)&v73->_anon_50[8];
          uint64_t v77 = v75 + 16 * v312;
          v78 = (unsigned char *)(v77 + 16 * v55);
          v56 = v73;
          int64_t v79 = v76 - v78;
          if (v76 != v78)
          {
            memmove((void *)(v75 + 16 * v312), v78, v76 - v78);
            v56 = v328;
          }
          *(void *)&v73->_anon_50[8] = v77 + v79;
        }
        sub_25B53FAE8(&v56->_mappingInterval.__table_.__bucket_list_.__ptr_.__value_, v52);
        v54 = (uint64_t *)v328;
        for (uint64_t i = v328->_mappingInterval.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
        {
          uint64_t v81 = i[5];
          if (v81 > v312)
          {
            LODWORD(v81) = v81 - v55;
            i[5] = v81;
          }
        }
        v52 += 24;
        id v6 = v309;
      }
      while (v52 != v53);
      v82 = (unsigned __int8 *)v325;
      v83 = (unsigned __int8 *)v326;
      if ((long long *)v325 != v326)
      {
        do
        {
          *(void *)&long long __p = v82;
          unsigned int v313 = *((void *)sub_25B53F6AC(v54 + 34, v82, (long long **)&__p) + 5);
          *(void *)&long long __p = v82;
          uint64_t v84 = *((unsigned int *)sub_25B53F6AC((uint64_t *)&v328->_rawMappingInterval, v82, (long long **)&__p) + 11);
          v85 = v328;
          if (v84)
          {
            v86 = *(unsigned char **)&v328->_anon_f8[8];
            uint64_t v87 = *(void *)v328->_anon_f8 + 16 * v313;
            v88 = (unsigned char *)(v87 + 16 * v84);
            v89 = v328;
            int64_t v90 = v86 - v88;
            if (v86 != v88)
            {
              memmove((void *)(*(void *)v328->_anon_f8 + 16 * v313), v88, v86 - v88);
              v89 = v328;
            }
            *(void *)&v85->_anon_f8[8] = v87 + v90;
            v85 = v89;
          }
          sub_25B53FAE8(&v85->_rawMappingInterval.__table_.__bucket_list_.__ptr_.__value_, v82);
          v54 = (uint64_t *)v328;
          for (j = v328->_rawMappingInterval.__table_.__p1_.__value_.__next_; j; j = (void *)*j)
          {
            uint64_t v92 = j[5];
            if (v92 > v313)
            {
              LODWORD(v92) = v92 - v84;
              j[5] = v92;
            }
          }
          v82 += 24;
          id v6 = v309;
        }
        while (v82 != v83);
      }
    }
    v54[39] = (v54[32] - v54[31]) >> 4;
    id v93 = v6;
    v95 = objc_msgSend_sortedArrayUsingComparator_(v93, v94, (uint64_t)&unk_2708F1930);

    long long v319 = 0u;
    long long v320 = 0u;
    long long v317 = 0u;
    long long v318 = 0u;
    id obj = v95;
    uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v317, v333, 16);
    if (v99)
    {
      uint64_t v298 = *(void *)v318;
      float32x4_t v301 = (float32x4_t)vdupq_n_s32(0x42C80000u);
      do
      {
        uint64_t v100 = 0;
        uint64_t v299 = v99;
        do
        {
          if (*(void *)v318 != v298) {
            objc_enumerationMutation(obj);
          }
          v101 = *(void **)(*((void *)&v317 + 1) + 8 * v100);
          v102 = objc_msgSend_identifier(v101, v97, v98);
          objc_msgSend_UUIDString(v102, v103, v104);
          id v105 = objc_claimAutoreleasedReturnValue();
          v108 = (char *)objc_msgSend_UTF8String(v105, v106, v107);
          sub_25B403500(v315, v108);

          uint64_t v300 = v100;
          v310 = 0;
          v314 = 0;
          v109 = 0;
          unint64_t v307 = 0;
          unint64_t v308 = 0;
          v110 = 0;
          unint64_t v305 = 0;
          unint64_t v306 = 0;
          v111 = 0;
          v112 = 0;
          v113 = 0;
          v114 = 0;
          uint64_t v115 = 0;
          v303 = v101;
          for (uint64_t k = objc_msgSend_count(v101, v116, v117); k > v115; uint64_t k = objc_msgSend_count(v303, v125, v126))
          {
            uint64_t v121 = objc_msgSend_pointsToWorld(v101, v119, v120);
            if (v302)
            {
              simd_float4 v124 = (simd_float4)vmulq_f32(*(float32x4_t *)(v121 + 16 * v115), v301);
              v124.i32[3] = 0;
              simd_float4 v127 = _simd_round_f4(v124);
              int32x2_t v128 = vcvt_s32_f32(*(float32x2_t *)v127.f32);
              v127.i16[0] = 0;
              v127.i16[1] = v128.i16[0];
              v127.i16[2] = v128.i16[2];
              v127.i16[3] = (int)v127.f32[2];
              unint64_t v129 = v127.i64[0];
              v130 = &v328->_voxelSet;
              int8x8_t v131 = (int8x8_t)v328->_voxelSet.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
              if (v131)
              {
                uint8x8_t v132 = (uint8x8_t)vcnt_s8(v131);
                v132.i16[0] = vaddlv_u8(v132);
                if (v132.u32[0] > 1uLL)
                {
                  unint64_t v133 = v129;
                  if (*(void *)&v131 <= v129) {
                    unint64_t v133 = v129 % *(void *)&v131;
                  }
                }
                else
                {
                  unint64_t v133 = (*(void *)&v131 - 1) & v129;
                }
                v134 = v130->__table_.__bucket_list_.__ptr_.__value_[v133];
                if (v134)
                {
                  for (m = (void *)*v134; m; m = (void *)*m)
                  {
                    unint64_t v136 = m[1];
                    if (v136 == v129)
                    {
                      if (m[2] == v129)
                      {
                        v174 = v110;
                        v175 = v112;
                        v176 = v114;
                        goto LABEL_196;
                      }
                    }
                    else
                    {
                      if (v132.u32[0] > 1uLL)
                      {
                        if (v136 >= *(void *)&v131) {
                          v136 %= *(void *)&v131;
                        }
                      }
                      else
                      {
                        v136 &= *(void *)&v131 - 1;
                      }
                      if (v136 != v133) {
                        break;
                      }
                    }
                  }
                }
              }
              sub_25B4FE164((uint64_t)v130, v129, v129);
              *(void *)&long long __p = v315;
              v137 = sub_25B53E064((uint64_t)&v328->_keyframeVoxelSet, (unsigned __int8 *)v315, (long long **)&__p);
              sub_25B4FE164((uint64_t)(v137 + 40), v129, v129);
            }
            uint64_t v138 = objc_msgSend_pointsToWorld(v101, v122, v123);
            uint64_t v141 = v138;
            if ((unint64_t)v109 >= v308)
            {
              uint64_t v142 = v109 - v314;
              unint64_t v143 = v142 + 1;
              if ((unint64_t)(v142 + 1) >> 60) {
                goto LABEL_309;
              }
              if ((uint64_t)(v308 - (void)v314) >> 3 > v143) {
                unint64_t v143 = (uint64_t)(v308 - (void)v314) >> 3;
              }
              if (v308 - (unint64_t)v314 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v144 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v144 = v143;
              }
              if (v144) {
                unint64_t v144 = (unint64_t)sub_25B3FFAEC(v144);
              }
              else {
                v139 = 0;
              }
              v145 = (long long *)(v144 + 16 * v142);
              long long *v145 = *(_OWORD *)(v141 + 16 * v115);
              v304 = v145 + 1;
              if (v109 == v314)
              {
                v146 = v314;
              }
              else
              {
                v146 = v314;
                do
                {
                  long long v147 = *--v109;
                  *--v145 = v147;
                }
                while (v109 != v314);
              }
              unint64_t v308 = v144 + 16 * (void)v139;
              if (v146) {
                operator delete(v146);
              }
              v314 = v145;
            }
            else
            {
              long long *v109 = *(_OWORD *)(v138 + 16 * v115);
              v304 = v109 + 1;
            }
            uint64_t v148 = objc_msgSend_semanticLabels(v101, v139, v140);
            uint64_t v151 = v148;
            if ((unint64_t)v112 >= v307)
            {
              uint64_t v152 = (v112 - v111) >> 2;
              unint64_t v153 = v152 + 1;
              if ((unint64_t)(v152 + 1) >> 62) {
                sub_25B3FBC4C();
              }
              if ((uint64_t)(v307 - (void)v111) >> 1 > v153) {
                unint64_t v153 = (uint64_t)(v307 - (void)v111) >> 1;
              }
              if (v307 - (unint64_t)v111 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v154 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v154 = v153;
              }
              if (v154) {
                unint64_t v154 = (unint64_t)sub_25B3FBC64(v154);
              }
              else {
                v149 = 0;
              }
              v155 = (char *)(v154 + 4 * v152);
              *(_DWORD *)v155 = *(_DWORD *)(v151 + 4 * v115);
              v175 = v155 + 4;
              while (v112 != v111)
              {
                int v156 = *((_DWORD *)v112 - 1);
                v112 -= 4;
                *((_DWORD *)v155 - 1) = v156;
                v155 -= 4;
              }
              unint64_t v307 = v154 + 4 * (void)v149;
              if (v111) {
                operator delete(v111);
              }
              v111 = v155;
            }
            else
            {
              *(_DWORD *)v112 = *(_DWORD *)(v148 + 4 * v115);
              v175 = v112 + 4;
            }
            uint64_t v157 = objc_msgSend_semanticVotes(v101, v149, v150);
            uint64_t v160 = v157;
            if ((unint64_t)v114 >= v306)
            {
              uint64_t v161 = (v114 - v113) >> 3;
              unint64_t v162 = v161 + 1;
              if ((unint64_t)(v161 + 1) >> 61) {
                sub_25B3FBC4C();
              }
              if ((uint64_t)(v306 - (void)v113) >> 2 > v162) {
                unint64_t v162 = (uint64_t)(v306 - (void)v113) >> 2;
              }
              if (v306 - (unint64_t)v113 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v163 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v163 = v162;
              }
              if (v163) {
                unint64_t v163 = (unint64_t)sub_25B3FCAD4(v163);
              }
              else {
                v158 = 0;
              }
              v164 = (char *)(v163 + 8 * v161);
              *(void *)v164 = *(void *)(v160 + 8 * v115);
              v176 = v164 + 8;
              while (v114 != v113)
              {
                uint64_t v165 = *((void *)v114 - 1);
                v114 -= 8;
                *((void *)v164 - 1) = v165;
                v164 -= 8;
              }
              unint64_t v306 = v163 + 8 * (void)v158;
              if (v113) {
                operator delete(v113);
              }
              v113 = v164;
              v101 = v303;
            }
            else
            {
              *(void *)v114 = *(void *)(v157 + 8 * v115);
              v176 = v114 + 8;
            }
            uint64_t v166 = objc_msgSend_colors(v101, v158, v159);
            uint64_t v167 = v166;
            if ((unint64_t)v110 >= v305)
            {
              uint64_t v168 = v110 - v310;
              unint64_t v169 = v168 + 1;
              if ((unint64_t)(v168 + 1) >> 60) {
LABEL_309:
              }
                sub_25B3FBC4C();
              if ((uint64_t)(v305 - (void)v310) >> 3 > v169) {
                unint64_t v169 = (uint64_t)(v305 - (void)v310) >> 3;
              }
              if (v305 - (unint64_t)v310 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v170 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v170 = v169;
              }
              if (v170) {
                unint64_t v170 = (unint64_t)sub_25B3FFAEC(v170);
              }
              else {
                v125 = 0;
              }
              v171 = (long long *)(v170 + 16 * v168);
              long long *v171 = *(_OWORD *)(v167 + 16 * v115);
              v174 = v171 + 1;
              if (v110 == v310)
              {
                v172 = v310;
              }
              else
              {
                v172 = v310;
                do
                {
                  long long v173 = *--v110;
                  *--v171 = v173;
                }
                while (v110 != v310);
              }
              unint64_t v305 = v170 + 16 * (void)v125;
              if (v172) {
                operator delete(v172);
              }
              v310 = v171;
            }
            else
            {
              long long *v110 = *(_OWORD *)(v166 + 16 * v115);
              v174 = v110 + 1;
            }
            v109 = v304;
LABEL_196:
            ++v115;
            v110 = v174;
            v112 = v175;
            v114 = v176;
            v101 = v303;
          }
          uint64_t v178 = *(void *)v328->_anon_8;
          uint64_t v177 = *(void *)&v328->_anon_8[8];
          *(void *)&long long __p = v315;
          v179 = sub_25B53F6AC((uint64_t *)&v328->_mappingInterval, (unsigned __int8 *)v315, (long long **)&__p);
          LODWORD(v180) = (unint64_t)(v177 - v178) >> 4;
          HIDWORD(v180) = (unint64_t)((char *)v109 - (char *)v314) >> 4;
          *((void *)v179 + 5) = v180;
          sub_25B53FC58((uint64_t)v328->_anon_8, *(char **)&v328->_anon_8[8], v314, v109, v109 - v314);
          if (v112 - v111 >= 1)
          {
            v181 = v328;
            uint64_t v182 = (v112 - v111) >> 2;
            v184 = *(char **)&v328->_anon_20[8];
            uint64_t v183 = *(void *)&v328->_anon_20[16];
            if (v182 <= (v183 - (uint64_t)v184) >> 2)
            {
              if (v182 <= 0)
              {
                v196 = &v111[4 * v182];
                v197 = *(char **)&v328->_anon_20[8];
                v213 = &v197[-4 * v182];
                v214 = v197;
                while (v213 < v184)
                {
                  int v215 = *(_DWORD *)v213;
                  v213 += 4;
                  *(_DWORD *)v214 = v215;
                  v214 += 4;
                }
                v216 = &v184[4 * v182];
                *(void *)&v181->_anon_20[8] = v214;
                if (v197 != v216) {
                  memmove(&v197[-4 * ((v197 - v216) >> 2)], v184, v197 - v216);
                }
                if (v196 != v111)
                {
                  v217 = v111;
                  do
                  {
                    int v218 = *(_DWORD *)v217;
                    v217 += 4;
                    *(_DWORD *)v184 = v218;
                    v184 += 4;
                  }
                  while (v217 != v196);
                }
              }
              else
              {
                if (v111 == v112)
                {
                  v194 = *(_DWORD **)&v328->_anon_20[8];
                }
                else
                {
                  v193 = v111;
                  v194 = *(_DWORD **)&v328->_anon_20[8];
                  do
                  {
                    int v195 = *(_DWORD *)v193;
                    v193 += 4;
                    *v194++ = v195;
                  }
                  while (v193 != v112);
                }
                *(void *)&v181->_anon_20[8] = v194;
              }
            }
            else
            {
              uint64_t v185 = *(void *)v328->_anon_20;
              uint64_t v186 = (uint64_t)&v184[-v185] >> 2;
              if ((unint64_t)(v186 + v182) >> 62) {
                sub_25B3FBC4C();
              }
              uint64_t v187 = v183 - v185;
              uint64_t v188 = v187 >> 1;
              if (v187 >> 1 <= (unint64_t)(v186 + v182)) {
                uint64_t v188 = v186 + v182;
              }
              if ((unint64_t)v187 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v189 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v189 = v188;
              }
              if (v189)
              {
                v190 = (char *)sub_25B3FBC64(v189);
                uint64_t v192 = v191;
              }
              else
              {
                v190 = 0;
                uint64_t v192 = 0;
              }
              v198 = &v190[4 * v186];
              v199 = &v198[4 * v182];
              uint64_t v200 = 4 * v182;
              v201 = v198;
              v202 = v111;
              do
              {
                int v203 = *(_DWORD *)v202;
                v202 += 4;
                *(_DWORD *)v201 = v203;
                v201 += 4;
                v200 -= 4;
              }
              while (v200);
              v204 = *(char **)v181->_anon_20;
              if (v204 != v184)
              {
                v205 = v184;
                do
                {
                  int v206 = *((_DWORD *)v205 - 1);
                  v205 -= 4;
                  *((_DWORD *)v198 - 1) = v206;
                  v198 -= 4;
                }
                while (v205 != v204);
              }
              v207 = *(char **)&v181->_anon_20[8];
              int64_t v208 = v207 - v184;
              if (v207 != v184)
              {
                v209 = v184;
                size_t v210 = v207 - v184;
                v211 = v199;
                memmove(v199, v209, v210);
                v199 = v211;
              }
              v212 = *(void **)v181->_anon_20;
              *(void *)v181->_anon_20 = v198;
              *(void *)&v181->_anon_20[8] = &v199[v208];
              *(void *)&v181->_anon_20[16] = &v190[4 * v192];
              v101 = v303;
              if (v212) {
                operator delete(v212);
              }
            }
          }
          if (v114 - v113 >= 1)
          {
            v219 = v328;
            uint64_t v220 = (v114 - v113) >> 3;
            v222 = *(char **)&v328->_anon_38[8];
            uint64_t v221 = *(void *)&v328->_anon_38[16];
            if (v220 <= (v221 - (uint64_t)v222) >> 3)
            {
              if (v220 <= 0)
              {
                v234 = &v113[8 * v220];
                v235 = *(char **)&v328->_anon_38[8];
                v251 = &v235[-8 * v220];
                v252 = v235;
                while (v251 < v222)
                {
                  uint64_t v253 = *(void *)v251;
                  v251 += 8;
                  *(void *)v252 = v253;
                  v252 += 8;
                }
                v254 = &v222[8 * v220];
                *(void *)&v219->_anon_38[8] = v252;
                if (v235 != v254) {
                  memmove(&v235[-8 * ((v235 - v254) >> 3)], v222, v235 - v254);
                }
                if (v234 != v113)
                {
                  v255 = v113;
                  do
                  {
                    uint64_t v256 = *(void *)v255;
                    v255 += 8;
                    *(void *)v222 = v256;
                    v222 += 8;
                  }
                  while (v255 != v234);
                }
              }
              else
              {
                if (v113 == v114)
                {
                  v232 = *(void **)&v328->_anon_38[8];
                }
                else
                {
                  v231 = v113;
                  v232 = *(void **)&v328->_anon_38[8];
                  do
                  {
                    uint64_t v233 = *(void *)v231;
                    v231 += 8;
                    *v232++ = v233;
                  }
                  while (v231 != v114);
                }
                *(void *)&v219->_anon_38[8] = v232;
              }
            }
            else
            {
              uint64_t v223 = *(void *)v328->_anon_38;
              uint64_t v224 = (uint64_t)&v222[-v223] >> 3;
              if ((unint64_t)(v224 + v220) >> 61) {
                sub_25B3FBC4C();
              }
              uint64_t v225 = v221 - v223;
              uint64_t v226 = v225 >> 2;
              if (v225 >> 2 <= (unint64_t)(v224 + v220)) {
                uint64_t v226 = v224 + v220;
              }
              if ((unint64_t)v225 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v227 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v227 = v226;
              }
              if (v227)
              {
                v228 = (char *)sub_25B3FCAD4(v227);
                uint64_t v230 = v229;
              }
              else
              {
                v228 = 0;
                uint64_t v230 = 0;
              }
              v236 = &v228[8 * v224];
              v237 = &v236[8 * v220];
              uint64_t v238 = 8 * v220;
              v239 = v236;
              v240 = v113;
              do
              {
                uint64_t v241 = *(void *)v240;
                v240 += 8;
                *(void *)v239 = v241;
                v239 += 8;
                v238 -= 8;
              }
              while (v238);
              v242 = *(char **)v219->_anon_38;
              if (v242 != v222)
              {
                v243 = v222;
                do
                {
                  uint64_t v244 = *((void *)v243 - 1);
                  v243 -= 8;
                  *((void *)v236 - 1) = v244;
                  v236 -= 8;
                }
                while (v243 != v242);
              }
              v245 = *(char **)&v219->_anon_38[8];
              int64_t v246 = v245 - v222;
              if (v245 != v222)
              {
                v247 = v222;
                size_t v248 = v245 - v222;
                v249 = v237;
                memmove(v237, v247, v248);
                v237 = v249;
              }
              v250 = *(void **)v219->_anon_38;
              *(void *)v219->_anon_38 = v236;
              *(void *)&v219->_anon_38[8] = &v237[v246];
              *(void *)&v219->_anon_38[16] = &v228[8 * v230];
              if (v250) {
                operator delete(v250);
              }
            }
          }
          double v257 = sub_25B53FC58((uint64_t)v328->_anon_50, *(char **)&v328->_anon_50[8], v310, v110, v110 - v310);
          uint64_t v259 = *(void *)v328->_anon_f8;
          uint64_t v258 = *(void *)&v328->_anon_f8[8];
          int v262 = objc_msgSend_count(v101, v260, v261, v257);
          *(void *)&long long __p = v315;
          v263 = sub_25B53F6AC((uint64_t *)&v328->_rawMappingInterval, (unsigned __int8 *)v315, (long long **)&__p);
          LODWORD(v264) = (unint64_t)(v258 - v259) >> 4;
          HIDWORD(v264) = v262;
          *((void *)v263 + 5) = v264;
          v265 = v328;
          v266 = *(char **)&v328->_anon_f8[8];
          v269 = (char *)objc_msgSend_pointsToWorld(v101, v267, v268);
          uint64_t v272 = objc_msgSend_pointsToWorld(v101, v270, v271);
          uint64_t v275 = v272 + 16 * objc_msgSend_count(v101, v273, v274);
          if (v275 - (uint64_t)v269 >= 1)
          {
            uint64_t v276 = (v275 - (uint64_t)v269) >> 4;
            unint64_t v278 = *(void *)&v265->_anon_f8[8];
            uint64_t v277 = *(void *)&v265->_anon_f8[16];
            if (v276 > (uint64_t)(v277 - v278) >> 4)
            {
              uint64_t v279 = *(void *)v265->_anon_f8;
              unint64_t v280 = v276 + ((uint64_t)(v278 - v279) >> 4);
              if (v280 >> 60) {
                sub_25B3FBC4C();
              }
              uint64_t v281 = v277 - v279;
              if (v281 >> 3 > v280) {
                unint64_t v280 = v281 >> 3;
              }
              if ((unint64_t)v281 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v282 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v282 = v280;
              }
              v332 = &v265->_anon_f8[16];
              if (v282) {
                unint64_t v282 = (unint64_t)sub_25B3FFAEC(v282);
              }
              else {
                uint64_t v283 = 0;
              }
              v292 = (_OWORD *)(v282 + 16 * ((uint64_t)&v266[-v279] >> 4));
              *(void *)&long long __p = v282;
              *((void *)&__p + 1) = v292;
              unint64_t v331 = v282 + 16 * v283;
              v293 = &v292[v276];
              uint64_t v294 = 16 * v276;
              do
              {
                long long v295 = *(_OWORD *)v269;
                v269 += 16;
                *v292++ = v295;
                v294 -= 16;
              }
              while (v294);
              v330 = v293;
              sub_25B49D54C((void **)v265->_anon_f8, (uint64_t)&__p, v266);
              if ((void)__p) {
                operator delete((void *)__p);
              }
              goto LABEL_295;
            }
            uint64_t v284 = (uint64_t)(v278 - (void)v266) >> 4;
            if (v284 >= v276)
            {
              v285 = &v269[16 * v276];
              v287 = *(char **)&v265->_anon_f8[8];
LABEL_283:
              v288 = &v287[-16 * v276];
              v289 = v287;
              while ((unint64_t)v288 < v278)
              {
                long long v290 = *(_OWORD *)v288;
                v288 += 16;
                *(_OWORD *)v289 = v290;
                v289 += 16;
              }
              v291 = &v266[16 * v276];
              *(void *)&v265->_anon_f8[8] = v289;
              if (v287 != v291) {
                memmove(&v287[-16 * ((v287 - v291) >> 4)], v266, v287 - v291);
              }
              size_t v98 = v285 - v269;
              if (v285 != v269) {
                memmove(v266, v269, v98);
              }
              goto LABEL_295;
            }
            v285 = &v269[16 * v284];
            uint64_t v286 = v275 - (void)v285;
            if ((char *)v275 != v285) {
              memmove(*(void **)&v265->_anon_f8[8], &v269[16 * v284], v275 - (void)v285);
            }
            v287 = (char *)(v278 + v286);
            *(void *)&v265->_anon_f8[8] = v278 + v286;
            if ((uint64_t)(v278 - (void)v266) >= 1) {
              goto LABEL_283;
            }
          }
LABEL_295:
          if (v316 < 0) {
            operator delete(v315[0]);
          }
          if (v113) {
            operator delete(v113);
          }
          if (v111) {
            operator delete(v111);
          }
          if (v310) {
            operator delete(v310);
          }
          if (v314) {
            operator delete(v314);
          }
          uint64_t v100 = v300 + 1;
        }
        while (v300 + 1 != v299);
        uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v97, (uint64_t)&v317, v333, 16);
      }
      while (v99);
    }

    *(void *)&long long __p = &v325;
    sub_25B41032C((void ***)&__p);
  }
}

- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  BOOL v7 = v6;
  BOOL v8 = v5;
  uint64_t v9 = v4;
  uint64_t v10 = v3;
  uint64_t v13 = objc_msgSend_count(self, a2, a3);
  sub_25B469590((char **)self->_anon_8, v13 + a3);
  memcpy((void *)(*(void *)self->_anon_8 + 16 * v13), v10, 16 * a3);
  sub_25B5409A0((char **)self->_anon_20, v13 + a3);
  memcpy((void *)(*(void *)self->_anon_20 + 4 * v13), v9, 4 * a3);
  sub_25B515774((char **)self->_anon_38, v13 + a3);
  memcpy((void *)(*(void *)self->_anon_38 + 8 * v13), v8, 8 * a3);
  sub_25B469590((char **)self->_anon_50, v13 + a3);
  uint64_t v14 = (void *)(*(void *)self->_anon_50 + 16 * v13);

  memcpy(v14, v7, 16 * a3);
}

- (RSPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  BOOL v7 = v6;
  BOOL v8 = v5;
  uint64_t v9 = v4;
  uint64_t v10 = v3;
  v14.receiver = self;
  v14.super_class = (Class)RSPointCloud;
  id v12 = [(RSPointCloud *)&v14 init];
  sub_25B469590((char **)v12 + 1, a3);
  memcpy(*((void **)v12 + 1), v10, 16 * a3);
  sub_25B5409A0((char **)v12 + 4, a3);
  memcpy(*((void **)v12 + 4), v9, 4 * a3);
  sub_25B515774((char **)v12 + 7, a3);
  memcpy(*((void **)v12 + 7), v8, 8 * a3);
  sub_25B469590((char **)v12 + 10, a3);
  memcpy(*((void **)v12 + 10), v7, 16 * a3);
  return (RSPointCloud *)v12;
}

- (RSPointCloud)initWithKeyframes:(id)a3 enableCameraPosition:(BOOL)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)RSPointCloud;
  id v7 = [(RSPointCloud *)&v75 init];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v6;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v71, v78, 16);
  unint64_t v12 = 0;
  if (v11)
  {
    uint64_t v13 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v72 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_identifier(v15, v9, v10);
        objc_msgSend_UUIDString(v16, v17, v18);
        id v19 = objc_claimAutoreleasedReturnValue();
        unint64_t v22 = (char *)objc_msgSend_UTF8String(v19, v20, v21);
        sub_25B403500(__p, v22);

        LODWORD(v16) = objc_msgSend_count(v15, v23, v24);
        v76 = __p;
        *((void *)sub_25B53F6AC((uint64_t *)v7 + 16, (unsigned __int8 *)__p, (long long **)&v76) + 5) = __PAIR64__(v16, v12);
        uint64_t v27 = objc_msgSend_count(v15, v25, v26);
        if (v70 < 0) {
          operator delete(__p[0]);
        }
        v12 += v27;
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v71, v78, 16);
    }
    while (v11);
  }

  *((unsigned char *)v7 + 320) = a4;
  sub_25B469590((char **)v7 + 1, v12);
  sub_25B5409A0((char **)v7 + 4, v12);
  sub_25B515774((char **)v7 + 7, v12);
  sub_25B469590((char **)v7 + 10, v12);
  if (*((unsigned char *)v7 + 320)) {
    sub_25B469590((char **)v7 + 13, v12);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v63 = obj;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v28, (uint64_t)&v65, v77, 16);
  if (v31)
  {
    uint64_t v32 = 0;
    uint64_t v33 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v66 != v33) {
          objc_enumerationMutation(v63);
        }
        unint64_t v35 = 0;
        v36 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        uint64_t v37 = 16 * v32;
        while (v35 < objc_msgSend_count(v36, v29, v30))
        {
          *(_OWORD *)(*((void *)v7 + 1) + v37 + 16 * v35) = *(_OWORD *)(objc_msgSend_pointsToWorld(v36, v38, v39)
                                                                        + 16 * v35);
          if (*((unsigned char *)v7 + 320))
          {
            objc_msgSend_cameraPose(v36, v29, v30);
            *(_OWORD *)(*((void *)v7 + 13) + v37 + 16 * v35) = v40;
          }
          ++v35;
        }
        uint64_t v41 = *((void *)v7 + 4);
        v42 = (const void *)objc_msgSend_semanticLabels(v36, v38, v39);
        uint64_t v45 = objc_msgSend_count(v36, v43, v44);
        memcpy((void *)(v41 + 4 * v32), v42, 4 * v45);
        uint64_t v46 = *((void *)v7 + 7);
        uint64_t v49 = (const void *)objc_msgSend_semanticVotes(v36, v47, v48);
        uint64_t v52 = objc_msgSend_count(v36, v50, v51);
        memcpy((void *)(v46 + 8 * v32), v49, 8 * v52);
        uint64_t v53 = *((void *)v7 + 10);
        v56 = (const void *)objc_msgSend_colors(v36, v54, v55);
        uint64_t v59 = objc_msgSend_count(v36, v57, v58);
        memcpy((void *)(v53 + 16 * v32), v56, 16 * v59);
        v32 += objc_msgSend_count(v36, v60, v61);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v29, (uint64_t)&v65, v77, 16);
    }
    while (v31);
  }

  return (RSPointCloud *)v7;
}

- (RSPointCloud)initWithDictionary:(id)a3
{
  id v4 = a3;
  v110.receiver = self;
  v110.super_class = (Class)RSPointCloud;
  id v5 = [(RSPointCloud *)&v110 init];
  id v7 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"count");
  unint64_t v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

  objc_msgSend_objectForKeyedSubscript_(v4, v11, @"points");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v14 = v13;
  id v17 = (char *)objc_msgSend_bytes(v14, v15, v16);
  uint64_t v20 = objc_msgSend_length(v14, v18, v19);
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  sub_25B3FE7A8((char *)&v104, v17, (uint64_t)&v17[v20 & 0xFFFFFFFFFFFFFFFCLL], v20 >> 2);

  uint64_t v21 = v104;
  sub_25B4D3EC4(&v107, ((v105 - (uint64_t)v104) >> 2) / 3uLL);
  uint64_t v23 = v107;
  uint64_t v24 = v108;
  if (v108 == v107)
  {
    uint64_t v23 = v108;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v27 = v21;
    do
    {
      uint64_t v28 = v23 + v25;
      uint64_t v29 = *(void *)v27;
      *(_DWORD *)(v28 + 8) = v27[2];
      *(void *)uint64_t v28 = v29;
      ++v26;
      uint64_t v23 = v107;
      uint64_t v24 = v108;
      v27 += 3;
      v25 += 16;
    }
    while (v26 < (v108 - v107) >> 4);
  }
  uint64_t v30 = (void *)*((void *)v5 + 1);
  if (v30)
  {
    *((void *)v5 + 2) = v30;
    operator delete(v30);
    *((void *)v5 + 1) = 0;
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 3) = 0;
    uint64_t v23 = v107;
    uint64_t v24 = v108;
  }
  *((void *)v5 + 1) = v23;
  *((void *)v5 + 2) = v24;
  *((void *)v5 + 3) = v109;
  uint64_t v107 = 0;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  if (v21) {
    operator delete(v21);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v22, @"semanticLabels");
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  id v33 = v32;
  v36 = (char *)objc_msgSend_bytes(v33, v34, v35);
  unint64_t v39 = objc_msgSend_length(v33, v37, v38);
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  sub_25B4E4D24(&v104, v36, &v36[v39], v39);

  long long v40 = v104;
  sub_25B4E4E30(&v107, (unint64_t)(v105 - (void)v104) >> 2);
  uint64_t v42 = v107;
  uint64_t v43 = v108;
  if (v108 == v107)
  {
    uint64_t v42 = v108;
  }
  else
  {
    unint64_t v44 = 0;
    do
    {
      *(_DWORD *)(v42 + 4 * v44) = v40[v44];
      ++v44;
      uint64_t v42 = v107;
      uint64_t v43 = v108;
    }
    while (v44 < (v108 - v107) >> 2);
  }
  uint64_t v45 = (void *)*((void *)v5 + 4);
  if (v45)
  {
    *((void *)v5 + 5) = v45;
    operator delete(v45);
    *((void *)v5 + 4) = 0;
    *((void *)v5 + 5) = 0;
    *((void *)v5 + 6) = 0;
    uint64_t v42 = v107;
    uint64_t v43 = v108;
  }
  *((void *)v5 + 4) = v42;
  *((void *)v5 + 5) = v43;
  *((void *)v5 + 6) = v109;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  uint64_t v107 = 0;
  if (v40) {
    operator delete(v40);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v41, @"semanticVotes");
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v47 = v46;
  }
  else {
    id v47 = 0;
  }

  id v48 = v47;
  uint64_t v51 = (char *)objc_msgSend_bytes(v48, v49, v50);
  uint64_t v54 = objc_msgSend_length(v48, v52, v53);
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  sub_25B4E4EA8((char *)&v104, v51, (uint64_t)&v51[v54 & 0xFFFFFFFFFFFFFFFELL], v54 >> 1);

  uint64_t v55 = v104;
  sub_25B4E4FA8(&v107, (unint64_t)((v105 - (uint64_t)v104) >> 1) >> 2);
  uint64_t v57 = v107;
  uint64_t v58 = v108;
  if (v108 == v107)
  {
    uint64_t v57 = v108;
  }
  else
  {
    unint64_t v59 = 0;
    do
    {
      *(void *)(v57 + 8 * v59) = v55[v59];
      ++v59;
      uint64_t v57 = v107;
      uint64_t v58 = v108;
    }
    while (v59 < (v108 - v107) >> 3);
  }
  v60 = (void *)*((void *)v5 + 7);
  if (v60)
  {
    *((void *)v5 + 8) = v60;
    operator delete(v60);
    *((void *)v5 + 7) = 0;
    *((void *)v5 + 8) = 0;
    *((void *)v5 + 9) = 0;
    uint64_t v57 = v107;
    uint64_t v58 = v108;
  }
  *((void *)v5 + 7) = v57;
  *((void *)v5 + 8) = v58;
  *((void *)v5 + 9) = v109;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  uint64_t v107 = 0;
  if (v55) {
    operator delete(v55);
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v56, @"colors");
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v62 = v61;
  }
  else {
    id v62 = 0;
  }

  id v63 = v62;
  long long v66 = (char *)objc_msgSend_bytes(v63, v64, v65);
  uint64_t v69 = objc_msgSend_length(v63, v67, v68);
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  sub_25B3FE7A8((char *)&v104, v66, (uint64_t)&v66[v69 & 0xFFFFFFFFFFFFFFFCLL], v69 >> 2);

  char v70 = v104;
  sub_25B4D3EC4(&v107, ((v105 - (uint64_t)v104) >> 2) / 3uLL);
  uint64_t v72 = v107;
  uint64_t v73 = v108;
  if (v108 == v107)
  {
    uint64_t v72 = v108;
  }
  else
  {
    uint64_t v74 = 0;
    unint64_t v75 = 0;
    v76 = v70;
    do
    {
      uint64_t v77 = v72 + v74;
      uint64_t v78 = *(void *)v76;
      *(_DWORD *)(v77 + 8) = v76[2];
      *(void *)uint64_t v77 = v78;
      ++v75;
      uint64_t v72 = v107;
      uint64_t v73 = v108;
      v76 += 3;
      v74 += 16;
    }
    while (v75 < (v108 - v107) >> 4);
  }
  uint64_t v79 = (void *)*((void *)v5 + 10);
  if (v79)
  {
    *((void *)v5 + 11) = v79;
    operator delete(v79);
    *((void *)v5 + 10) = 0;
    *((void *)v5 + 11) = 0;
    *((void *)v5 + 12) = 0;
    uint64_t v72 = v107;
    uint64_t v73 = v108;
  }
  *((void *)v5 + 10) = v72;
  *((void *)v5 + 11) = v73;
  *((void *)v5 + 12) = v109;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  uint64_t v107 = 0;
  if (v70) {
    operator delete(v70);
  }
  v80 = objc_msgSend_objectForKey_(v4, v71, @"cameraPositions");

  if (v80)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v81, @"cameraPositions");
    id v82 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v83 = v82;
    }
    else {
      id v83 = 0;
    }

    id v84 = v83;
    uint64_t v87 = (char *)objc_msgSend_bytes(v84, v85, v86);
    uint64_t v90 = objc_msgSend_length(v84, v88, v89);
    uint64_t v104 = 0;
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    sub_25B3FE7A8((char *)&v104, v87, (uint64_t)&v87[v90 & 0xFFFFFFFFFFFFFFFCLL], v90 >> 2);

    v91 = v104;
    sub_25B4D3EC4(&v107, ((v105 - (uint64_t)v104) >> 2) / 3uLL);
    uint64_t v92 = v107;
    uint64_t v93 = v108;
    if (v108 == v107)
    {
      uint64_t v92 = v108;
    }
    else
    {
      uint64_t v94 = 0;
      unint64_t v95 = 0;
      v96 = v91;
      do
      {
        uint64_t v97 = v92 + v94;
        uint64_t v98 = *(void *)v96;
        *(_DWORD *)(v97 + 8) = v96[2];
        *(void *)uint64_t v97 = v98;
        ++v95;
        uint64_t v92 = v107;
        uint64_t v93 = v108;
        v96 += 3;
        v94 += 16;
      }
      while (v95 < (v108 - v107) >> 4);
    }
    uint64_t v99 = (void *)*((void *)v5 + 13);
    if (v99)
    {
      *((void *)v5 + 14) = v99;
      operator delete(v99);
      *((void *)v5 + 13) = 0;
      *((void *)v5 + 14) = 0;
      *((void *)v5 + 15) = 0;
      uint64_t v92 = v107;
      uint64_t v93 = v108;
    }
    *((void *)v5 + 13) = v92;
    *((void *)v5 + 14) = v93;
    *((void *)v5 + 15) = v109;
    uint64_t v108 = 0;
    uint64_t v109 = 0;
    uint64_t v107 = 0;
    if (v91) {
      operator delete(v91);
    }
  }
  uint64_t v100 = (char *)*((void *)v5 + 1);
  uint64_t v101 = *((void *)v5 + 2);
  if (v10 == (v101 - (uint64_t)v100) >> 4
    && v10 == (uint64_t)(*((void *)v5 + 8) - *((void *)v5 + 7)) >> 3
    && v10 == (uint64_t)(*((void *)v5 + 5) - *((void *)v5 + 4)) >> 2
    && v10 == (uint64_t)(*((void *)v5 + 11) - *((void *)v5 + 10)) >> 4)
  {
    sub_25B4D3D18((char *)v5 + 248, v100, v101, v10);
    v102 = (RSPointCloud *)v5;
  }
  else
  {
    v102 = 0;
  }

  return v102;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RSPointCloud);
  id v5 = v4;
  if (v4 != self)
  {
    sub_25B4D3D18((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
    sub_25B3FE7A8((char *)v5->_anon_20, *(char **)self->_anon_20, *(void *)&self->_anon_20[8], (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 2);
    sub_25B469194((char *)v5->_anon_38, *(char **)self->_anon_38, *(void *)&self->_anon_38[8], (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 3);
    sub_25B4D3D18((char *)v5->_anon_50, *(char **)self->_anon_50, *(void *)&self->_anon_50[8], (uint64_t)(*(void *)&self->_anon_50[8] - *(void *)self->_anon_50) >> 4);
    sub_25B4D3D18((char *)v5->_anon_68, *(char **)self->_anon_68, *(void *)&self->_anon_68[8], (uint64_t)(*(void *)&self->_anon_68[8] - *(void *)self->_anon_68) >> 4);
    v5->_mappingInterval.__table_.__p3_.__value_ = self->_mappingInterval.__table_.__p3_.__value_;
    sub_25B541B8C(&v5->_mappingInterval.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)self->_mappingInterval.__table_.__p1_.__value_.__next_);
    v5->_voxelSet.__table_.__p3_.__value_ = self->_voxelSet.__table_.__p3_.__value_;
    sub_25B541CEC(&v5->_voxelSet.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_voxelSet.__table_.__p1_.__value_.__next_);
    v5->_keyframeVoxelSet.__table_.__p3_.__value_ = self->_keyframeVoxelSet.__table_.__p3_.__value_;
    next = (char *)self->_keyframeVoxelSet.__table_.__p1_.__value_.__next_;
    unint64_t value = v5->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        v5->_keyframeVoxelSet.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      uint64_t v9 = (uint64_t)v5->_keyframeVoxelSet.__table_.__p1_.__value_.__next_;
      v5->_keyframeVoxelSet.__table_.__p1_.__value_.__next_ = 0;
      v5->_keyframeVoxelSet.__table_.__p2_.__value_ = 0;
      if (v9) {
        BOOL v10 = next == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        uint64_t v11 = (void *)v9;
      }
      else
      {
        do
        {
          std::string::operator=((std::string *)(v9 + 16), (const std::string *)(next + 16));
          if ((char *)v9 != next)
          {
            *(_DWORD *)(v9 + 72) = *((_DWORD *)next + 18);
            sub_25B541CEC((void *)(v9 + 40), *((void **)next + 7));
          }
          uint64_t v11 = *(void **)v9;
          sub_25B541E20((uint64_t)&v5->_keyframeVoxelSet, v9);
          next = *(char **)next;
          if (!v11) {
            break;
          }
          uint64_t v9 = (uint64_t)v11;
        }
        while (next);
      }
      sub_25B53C3EC(v11);
    }
    for (; next; next = *(char **)next)
    {
      id v12 = (char *)operator new(0x50uLL);
      uint64_t v13 = (uint64_t)v12;
      v18[0] = v12;
      v18[1] = &v5->_keyframeVoxelSet.__table_.__p1_;
      char v19 = 0;
      id v14 = v12 + 16;
      *(void *)id v12 = 0;
      *((void *)v12 + 1) = 0;
      if (next[39] < 0)
      {
        sub_25B4002F4(v12 + 16, *((void **)next + 2), *((void *)next + 3));
      }
      else
      {
        long long v15 = *((_OWORD *)next + 1);
        *((void *)v12 + 4) = *((void *)next + 4);
        *id v14 = v15;
      }
      *(_OWORD *)(v13 + 40) = 0u;
      *(_OWORD *)(v13 + 56) = 0u;
      *(_DWORD *)(v13 + 72) = *((_DWORD *)next + 18);
      sub_25B3FA4B0(v13 + 40, *((void *)next + 6));
      for (uint64_t j = (void *)*((void *)next + 7); j; uint64_t j = (void *)*j)
        sub_25B4FE164(v13 + 40, j[2], j[2]);
      char v19 = 1;
      *(void *)(v13 + 8) = sub_25B403AF4((uint64_t)v14);
      sub_25B541E20((uint64_t)&v5->_keyframeVoxelSet, v13);
      v18[0] = 0;
      sub_25B540858((uint64_t)v18);
    }
    sub_25B4D3D18((char *)v5->_anon_f8, *(char **)self->_anon_f8, *(void *)&self->_anon_f8[8], (uint64_t)(*(void *)&self->_anon_f8[8] - *(void *)self->_anon_f8) >> 4);
    v5->_rawMappingInterval.__table_.__p3_.__value_ = self->_rawMappingInterval.__table_.__p3_.__value_;
    sub_25B541B8C(&v5->_rawMappingInterval.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)self->_rawMappingInterval.__table_.__p1_.__value_.__next_);
  }
  v5->_rawUpdateCursor = self->_rawUpdateCursor;
  v5->_isCameraPositionEnabled = self->_isCameraPositionEnabled;
  return v5;
}

- (uint64_t)colors
{
  return *(void *)(a1 + 80);
}

- (uint64_t)semanticVotes
{
  return *(void *)(a1 + 56);
}

- (uint64_t)semanticLabels
{
  return *(void *)(a1 + 32);
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (unint64_t)count
{
  return (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4;
}

- (RSPointCloud)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSPointCloud;
  result = [(RSPointCloud *)&v3 init];
  if (result)
  {
    result->_rawUpdateCursor = 0;
    result->_isCameraPositionEnabled = 0;
  }
  return result;
}

@end