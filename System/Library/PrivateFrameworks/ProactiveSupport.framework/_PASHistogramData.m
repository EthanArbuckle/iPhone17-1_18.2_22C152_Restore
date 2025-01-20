@interface _PASHistogramData
+ (BOOL)supportsSecureCoding;
- (_PASHistogramData)init;
- (_PASHistogramData)initWithCoder:(id)a3;
- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (float)lookupSmoothedWithBucketCount:(unsigned __int16)a3 distanceScale:(float)a4 weightScale:(float)a5 a:(unsigned __int16)a6 b:(unsigned __int16)a7;
- (float)lookupUnsmoothedA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (id).cxx_construct;
- (id)aSet;
- (id)bSet;
- (int)countWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (void)add:(float)a3 a:(unsigned __int16)a4 b:(unsigned __int16)a5;
- (void)clear;
- (void)decayByFactor:(float)a3;
- (void)decayWithHalfLifeInDays:(float)a3;
- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
@end

@implementation _PASHistogramData

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->_anon_8[32];
  if (v3)
  {
    *(void *)&self->_anon_8[40] = v3;
    free(v3);
  }
  v4 = *(void **)self->_anon_8;
  if (v4)
  {
    *(void *)&self->_anon_8[8] = v4;
    free(v4);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  [v8 encodeInt32:*(unsigned int *)(*(void *)value + 24) forKey:@"count"];
  v5 = *(void **)value;
  if (*(void *)(*(void *)value + 24))
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:**(void **)value length:4 * *(void *)(*(void *)value + 24)];
    [v8 encodeObject:v6 forKey:@"scores"];

    v5 = *(void **)value;
  }
  if (v5[7])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)(*(void *)value + 32) length:4 * *(void *)(*(void *)value + 56)];
    [v8 encodeObject:v7 forKey:@"abs"];
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

- (_PASHistogramData)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [(_PASHistogramData *)self init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A62450A0]();
    value = (void ***)v6->_guardedData.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)(value + 1));
    int v9 = [v5 decodeInt32ForKey:@"count"];
    if (!v9)
    {
LABEL_15:
      pthread_mutex_unlock((pthread_mutex_t *)(value + 1));
      goto LABEL_16;
    }
    unint64_t v10 = v9;
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)*value, v9);
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)(*value + 4), v10);
    SEL v23 = a2;
    v24 = v7;
    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"scores"];
    if ([v11 length] == 4 * v10)
    {
      if (!v11) {
        goto LABEL_6;
      }
    }
    else
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:v23, v6, @"_PASHistogramData.mm", 515, @"Invalid parameter not satisfying: %@", @"data.length == count * sizeof(sp->scores[0])" object file lineNumber description];

      if (!v11)
      {
LABEL_6:
        v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"abs"];

        if ([v14 length] == 4 * v10)
        {
          if (!v14)
          {
LABEL_9:
            unint64_t v17 = (unint64_t)(*value)[3];
            v7 = v24;
            if (v17)
            {
              uint64_t v18 = 0;
              v19 = **value;
              do
              {
                if (fabsf(*(float *)&v19[v18]) == INFINITY) {
                  v19[v18] = 0;
                }
                ++v18;
              }
              while (v17 > v18);
            }

            goto LABEL_15;
          }
        }
        else
        {
          v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:v23, v6, @"_PASHistogramData.mm", 520, @"Invalid parameter not satisfying: %@", @"data.length == count * sizeof(sp->abs[0])" object file lineNumber description];

          if (!v14) {
            goto LABEL_9;
          }
        }
        v15 = (*value)[4];
        id v16 = v14;
        memcpy(v15, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
        goto LABEL_9;
      }
    }
    v12 = **value;
    id v13 = v11;
    memcpy(v12, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    goto LABEL_6;
  }
LABEL_16:

  return v6;
}

- (id)bSet
{
  v3 = objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  if (*(void *)(*(void *)value + 56))
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v3 addIndex:*(unsigned __int16 *)(*(void *)(v5 + 32) + 4 * v6)];
      uint64_t v6 = v7;
      uint64_t v5 = *(void *)value;
    }
    while (*(void *)(*(void *)value + 56) > (unint64_t)v7++);
  }
  id v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (id)aSet
{
  v3 = objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  if (*(void *)(*(void *)value + 56))
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v3 addIndex:*(unsigned __int16 *)(*(void *)(v5 + 32) + 4 * v6 + 2)];
      uint64_t v6 = v7;
      uint64_t v5 = *(void *)value;
    }
    while (*(void *)(*(void *)value + 56) > (unint64_t)v7++);
  }
  id v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (void)decayWithHalfLifeInDays:(float)a3
{
  long double v4 = exp2(-1.0 / a3);
  *(float *)&long double v4 = v4;

  [(_PASHistogramData *)self decayByFactor:(double)v4];
}

- (void)decayByFactor:(float)a3
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(unsigned char *)(*(void *)value + 64))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = **(void **)value;
    if (*(void *)(*(void *)value + 8) != v4)
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = (float32x4_t *)(v4 + 32 * v5);
        float32x4_t v7 = vmulq_n_f32(v6[1], a3);
        float32x4_t *v6 = vmulq_n_f32(*v6, a3);
        v6[1] = v7;
        ++v5;
        uint64_t v4 = **(void **)value;
      }
      while (v5 < (*(void *)(*(void *)value + 8) - v4) >> 5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  if ((a4 & a3) == 0xFFFF)
  {
    [(_PASHistogramData *)self clear];
  }
  else
  {
    int v4 = a4;
    int v5 = a3;
    value = (char *)self->_guardedData.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    float32x4_t v7 = *(void **)value;
    if (*(unsigned char *)(*(void *)value + 64))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = v7[3];
      if (v8)
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        uint64_t v11 = v7[4];
        do
        {
          unsigned int v12 = *(_DWORD *)(v11 + 4 * v9);
          BOOL v14 = v4 == 0xFFFF || v4 == (unsigned __int16)*(_DWORD *)(v11 + 4 * v9);
          BOOL v15 = HIWORD(v12) == v5 || v5 == 0xFFFF;
          if (!v15 || !v14)
          {
            *(_DWORD *)(v11 + 4 * v10) = v12;
            *(_DWORD *)(*v7 + 4 * v10++) = *(_DWORD *)(*v7 + 4 * v9);
          }
          ++v9;
        }
        while (v8 != v9);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)v7, v10);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(void *)value + 32, v10);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
    }
  }
}

- (int)countWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  if ((a4 & a3) == 0xFFFF)
  {
    value = (char *)self->_guardedData.__ptr_.__value_;
    float32x4_t v7 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    int v5 = *(_DWORD *)(*(void *)value + 24);
    pthread_mutex_unlock(v7);
    return v5;
  }
  if (a3 == 0xFFFF)
  {
    uint64_t v13 = 0;
    BOOL v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35___PASHistogramData_countWhereA_b___block_invoke;
    v11[3] = &unk_1E5AEAD50;
    unsigned __int16 v12 = a4;
    v11[4] = &v13;
    [(_PASHistogramData *)self enumerate:v11];
LABEL_8:
    int v5 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);
    return v5;
  }
  if (a4 == 0xFFFF)
  {
    uint64_t v13 = 0;
    BOOL v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35___PASHistogramData_countWhereA_b___block_invoke_2;
    v9[3] = &unk_1E5AEAD50;
    unsigned __int16 v10 = a3;
    v9[4] = &v13;
    [(_PASHistogramData *)self enumerate:v9];
    goto LABEL_8;
  }
  -[_PASHistogramData lookupUnsmoothedA:b:](self, "lookupUnsmoothedA:b:");
  return v4 > 0.0;
}

- (void)enumerate:(id)a3
{
  id v11 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  char v6 = *(unsigned char *)(*(void *)value + 64);
  *(unsigned char *)(v5 + 64) = 1;
  if (*(void *)(v5 + 56))
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      if (*(float *)(*(void *)v5 + 4 * v7) > 0.0)
      {
        unsigned int v9 = *(_DWORD *)(*(void *)(v5 + 32) + 4 * v7);
        (*((void (**)(id, void, void))v11 + 2))(v11, HIWORD(v9), (unsigned __int16)v9);
        uint64_t v5 = *(void *)value;
      }
      uint64_t v7 = v8;
    }
    while (*(void *)(v5 + 56) > (unint64_t)v8++);
  }
  *(unsigned char *)(v5 + 64) = v6;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  value = (uint64_t **)self->_guardedData.__ptr_.__value_;
  char v6 = (pthread_mutex_t *)(value + 1);
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  float v7 = entropy(&value, v5, v4);
  pthread_mutex_unlock(v6);
  return v7;
}

- (float)lookupSmoothedWithBucketCount:(unsigned __int16)a3 distanceScale:(float)a4 weightScale:(float)a5 a:(unsigned __int16)a6 b:(unsigned __int16)a7
{
  unsigned int v7 = a7;
  int v8 = a6;
  unsigned int v10 = a3;
  if (a7 == 0xFFFF)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"_PASHistogramData.mm", 317, @"Invalid parameter not satisfying: %@", @"b != SUMALL" object file lineNumber description];
  }
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v13 = **(void **)value;
  uint64_t v14 = *(void *)(*(void *)value + 8);
  uint64_t v15 = v14 - v13;
  if (v14 == v13)
  {
    float32x4_t v22 = 0uLL;
    float32x4_t v32 = 0uLL;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v17 = v15 >> 5;
    int16x8_t v18 = (int16x8_t)vdupq_n_s32((v8 << 16) | 0xFFFFu);
    int32x4_t v19 = vdupq_n_s32(v7);
    int32x4_t v20 = vdupq_n_s32(v10);
    float v21 = 1.0 / a5;
    float32x4_t v22 = 0uLL;
    v23.i64[0] = -1;
    v23.i64[1] = -1;
    int16x8_t v24 = vceqq_s16(v18, v23);
    int8x8_t v25 = vmovn_s16(v24);
    v26.i64[0] = 0xFF000000FFLL;
    v26.i64[1] = 0xFF000000FFLL;
    __asm { FMOV            V7.4S, #1.0 }
    float32x4_t v32 = 0uLL;
    do
    {
      uint64_t v33 = *(void *)(*(void *)value + 32) + 32 * v16;
      int8x16_t v34 = *(int8x16_t *)v33;
      int16x8_t v35 = *(int16x8_t *)(v33 + 16);
      int16x8_t v36 = (int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(*(int16x8_t *)v33, v18)), v25));
      int16x8_t v37 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v35, v18), (int8x16_t)v24);
      v38 = (int8x16_t *)(v13 + 32 * v16);
      int32x4_t v39 = vabdq_s32((int32x4_t)vandq_s8(v34, v26), v19);
      int16x8_t v40 = vcltzq_s16(vshlq_n_s16(v36, 0xFuLL));
      int32x4_t v41 = vabdq_s32((int32x4_t)vandq_s8((int8x16_t)v35, v26), v19);
      float32x4_t v42 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v20, v41), v41)), a4);
      float32x4_t v43 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v20, v39), v39)), a4);
      float32x4_t v44 = vmlaq_f32(_Q7, v43, v43);
      float32x4_t v45 = vmulq_n_f32(vmlaq_f32(_Q7, v42, v42), v21);
      float32x4_t v46 = vmulq_n_f32(v44, v21);
      float32x4_t v47 = vrecpeq_f32(v46);
      float32x4_t v48 = vmulq_f32(v47, vrecpsq_f32(v46, v47));
      float32x4_t v49 = vrecpeq_f32(v45);
      float32x4_t v32 = vaddq_f32(v32, vmulq_f32(vmulq_f32(v49, vrecpsq_f32(v45, v49)), (float32x4_t)vandq_s8(vandq_s8(v38[1], (int8x16_t)v37), (int8x16_t)vrev32q_s16(v37))));
      float32x4_t v22 = vaddq_f32(v22, vmulq_f32(v48, (float32x4_t)vandq_s8(vandq_s8(*v38, (int8x16_t)v40), (int8x16_t)vrev32q_s16(v40))));
      ++v16;
    }
    while (v17 > v16);
  }
  float32x4_t v54 = v32;
  float32x4_t v56 = v22;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  int8x16_t v50 = (int8x16_t)vaddq_f32(v56, v54);
  float result = vaddv_f32(vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL)));
  if (fabsf(result) == INFINITY) {
    return 0.0;
  }
  return result;
}

- (float)lookupUnsmoothedA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  unsigned int v7 = **(int8x16_t ***)value;
  uint64_t v8 = *(void *)(*(void *)value + 8) - (void)v7;
  if (v8)
  {
    unint64_t v9 = v8 >> 5;
    unsigned int v10 = *(int16x8_t **)(*(void *)value + 32);
    int16x8_t v11 = (int16x8_t)vdupq_n_s32(v4 | (v5 << 16));
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    float32x4_t v12 = 0uLL;
    v13.i64[0] = -1;
    v13.i64[1] = -1;
    int16x8_t v14 = vceqq_s16(v11, v13);
    int8x8_t v15 = vmovn_s16(v14);
    float32x4_t v16 = 0uLL;
    do
    {
      int16x8_t v18 = *v10;
      int16x8_t v17 = v10[1];
      v10 += 2;
      int16x8_t v19 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v17, v11), (int8x16_t)v14);
      int16x8_t v20 = vcltzq_s16(vshlq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(v18, v11)), v15)), 0xFuLL));
      int8x16_t v22 = *v7;
      int8x16_t v21 = v7[1];
      v7 += 2;
      float32x4_t v16 = vaddq_f32(v16, (float32x4_t)vandq_s8(vandq_s8(v21, (int8x16_t)v19), (int8x16_t)vrev32q_s16(v19)));
      float32x4_t v12 = vaddq_f32(v12, (float32x4_t)vandq_s8(vandq_s8(v22, (int8x16_t)v20), (int8x16_t)vrev32q_s16(v20)));
      --v9;
    }
    while (v9);
  }
  else
  {
    float32x4_t v12 = 0uLL;
    float32x4_t v16 = 0uLL;
  }
  float32x4_t v25 = v16;
  float32x4_t v26 = v12;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  int8x16_t v23 = (int8x16_t)vaddq_f32(v26, v25);
  float result = vaddv_f32(vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL)));
  if (fabsf(result) == INFINITY) {
    return 0.0;
  }
  return result;
}

- (void)add:(float)a3 a:(unsigned __int16)a4 b:(unsigned __int16)a5
{
  if (fabsf(a3) != INFINITY)
  {
    int v6 = a5;
    int v7 = a4;
    value = (char *)self->_guardedData.__ptr_.__value_;
    unint64_t v9 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    unsigned int v10 = *(void **)value;
    if (*(unsigned char *)(*(void *)value + 64))
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = v10[7];
      if (v11)
      {
        uint64_t v12 = 0;
        while (*(_DWORD *)(v10[4] + 4 * v12) != (v6 | (v7 << 16)))
        {
          if (v11 == ++v12) {
            goto LABEL_7;
          }
        }
        *(float *)(*v10 + 4 * v12) = fmaxf(*(float *)(*v10 + 4 * v12) + a3, 0.0);
      }
      else
      {
LABEL_7:
        if (a3 >= 0.0)
        {
          uint64_t v13 = v10[3];
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(void *)value, v13 + 1);
          *(float *)(*v10 + 4 * v13) = fmaxf(a3, 0.0);
          int16x8_t v14 = (void *)(*(void *)value + 32);
          uint64_t v15 = *(void *)(*(void *)value + 56);
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)v14, v15 + 1);
          *(_DWORD *)(*v14 + 4 * v15) = v6 | (v7 << 16);
        }
      }
      pthread_mutex_unlock(v9);
    }
  }
}

- (void)clear
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(unsigned char *)(*(void *)value + 64))
  {
    __break(1u);
  }
  else
  {
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(void *)value, 0);
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(void *)value + 32, 0);
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (_PASHistogramData)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_PASHistogramData;
  v2 = [(_PASHistogramData *)&v10 init];
  v3 = v2;
  if (v2)
  {
    int v5 = v2 + 8;
    int v4 = (void *)*((void *)v2 + 1);
    if (v4)
    {
      *((void *)v3 + 2) = v4;
      free(v4);
      void *v5 = 0;
      *((void *)v3 + 2) = 0;
      *((void *)v3 + 3) = 0;
    }
    int v7 = v3 + 40;
    int v6 = (void *)*((void *)v3 + 5);
    long long v8 = 0uLL;
    *(_OWORD *)int v5 = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    if (v6)
    {
      *((void *)v3 + 6) = v6;
      free(v6);
      long long v8 = 0uLL;
      void *v7 = 0;
      *((void *)v3 + 6) = 0;
      *((void *)v3 + 7) = 0;
    }
    v3[72] = 0;
    *(_OWORD *)int v7 = v8;
    *(_OWORD *)(v3 + 56) = v8;
    operator new();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end