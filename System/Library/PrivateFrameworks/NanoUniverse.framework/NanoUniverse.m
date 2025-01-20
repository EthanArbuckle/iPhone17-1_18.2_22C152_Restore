uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_21E8AE538(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGImage *_NUNICreateImageFromURL(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [v3 path];
  id v5 = (id) [objc_alloc(MEMORY[0x263F827E8]) initWithContentsOfFile:v4];
  Copy = CGImageCreateCopy((CGImageRef)[v5 CGImage]);

  if (!Copy)
  {
    v14 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      _NUNICreateImageFromURL_cold_1(v3, v14);
    }

    if (a2)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      v12 = &unk_26CFE7848;
      uint64_t v13 = -1;
      goto LABEL_14;
    }
LABEL_15:
    Copy = 0;
    goto LABEL_16;
  }
  int Width = CGImageGetWidth(Copy);
  int Height = CGImageGetHeight(Copy);
  if ((Width - 1024) > 0xC00 || 2 * Height != Width)
  {
    CGImageRelease(Copy);
    v10 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = [v3 path];
      v17[0] = 67109634;
      v17[1] = Width;
      __int16 v18 = 1024;
      int v19 = Height;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_21E8AA000, v10, OS_LOG_TYPE_ERROR, "AegirResourceManager: invalid dimensions (%d, %d) (%@)", (uint8_t *)v17, 0x18u);
    }
    if (a2)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      v12 = &unk_26CFE7870;
      uint64_t v13 = -2;
LABEL_14:
      [v11 errorWithDomain:@"com.apple.NanoUniverse.NUNICloudCoverFileConverter" code:v13 userInfo:v12];
      Copy = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return Copy;
}

id _NUNIRasterizeImageGenericGray(CGImage *a1, int a2, int a3)
{
  id v6 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:a3 * a2];
  v7 = (void *)[v6 mutableBytes];
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00248]);
  v9 = CGBitmapContextCreate(v7, a2, a3, 8uLL, a2, v8, 0);
  CGColorSpaceRelease(v8);
  CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
  v12.size.width = (double)a2;
  v12.size.height = (double)a3;
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextDrawImage(v9, v12, a1);
  CGContextRelease(v9);
  return v6;
}

id _NUNIEqualize(void *a1, int a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = (a3 * a2);
  id v7 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v6];
  v8 = (unsigned char *)[v7 mutableBytes];
  id v9 = v5;
  v10 = (unsigned __int8 *)[v9 bytes];
  bzero(v21, 0x400uLL);
  if (v6)
  {
    uint64_t v11 = v6;
    CGRect v12 = v10;
    do
    {
      int v13 = *v12++;
      ++v21[v13];
      --v11;
    }
    while (v11);
    int v14 = v21[0];
  }
  else
  {
    int v14 = 0;
  }
  uint64_t v15 = 1;
  int v16 = v14;
  do
  {
    v16 += v21[v15];
    *(_DWORD *)&v20[v15 * 4 + 256] = v16;
    ++v15;
  }
  while (v15 != 256);
  v20[0] = 0;
  for (uint64_t i = 1; i != 256; ++i)
    v20[i] = llroundf((float)((float)(*(_DWORD *)&v20[4 * i + 256] - v14) / (float)(v6 - v14))* 255.0);
  if (v6)
  {
    do
    {
      int v18 = *v10++;
      *v8++ = v20[v18];
      --v6;
    }
    while (v6);
  }

  return v7;
}

id _NUNIInitializeImageGenericGray(int a1, int a2)
{
  uint64_t v2 = (a2 * a1);
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v2];
  objc_msgSend(v3, "resetBytesInRange:", 0, v2);
  return v3;
}

void _NUNIAddCloudLayer(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  uint64_t v8 = (a4 * a3);
  id v9 = (unsigned char *)[a2 mutableBytes];
  id v14 = v7;
  v10 = (unsigned __int8 *)[v14 bytes];
  if (v8)
  {
    do
    {
      unsigned int v12 = *v10++;
      float v13 = (double)v12 / 255.0;
      LOBYTE(v11) = *v9;
      float v11 = (float)LODWORD(v11);
      *v9++ = (int)(float)(v11 + (float)((float)((float)(v13 * v13) * v13) * 85.0));
      --v8;
    }
    while (v8);
  }
}

id _NUNIConvertEquirectangularToOctahedral(void *a1, int a2, int a3)
{
  id v5 = a1;
  id v6 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x400000];
  uint64_t v7 = [v6 mutableBytes];
  id v8 = v5;
  uint64_t v9 = [v8 bytes];
  uint64_t v11 = 0;
  float v12 = (float)a3;
  float v13 = 0.5;
  v14.i32[1] = 973078528;
  v15.i32[1] = 0x40000000;
  __asm { FMOV            V10.2S, #-1.0 }
  int v21 = a3 - 1;
  do
  {
    uint64_t v22 = 0;
    *(float *)&long long v10 = (float)((float)(int)v11 + v13) * 0.00048828;
    long long v48 = v10;
    do
    {
      v23.f32[0] = (float)((float)(int)v22 + v13) * 0.00048828;
      v23.i32[1] = v48;
      float32x2_t v24 = vmla_f32(_D10, (float32x2_t)0x4000000040000000, v23);
      float32x2_t v25 = vabs_f32(v24);
      v25.f32[0] = (float)(1.0 - v25.f32[0]) - v25.f32[1];
      *(float *)v14.i32 = fminf(fmaxf(-v25.f32[0], 0.0), 1.0);
      *(float *)v15.i32 = -*(float *)v14.i32;
      *(float32x2_t *)v26.f32 = vadd_f32(v24, (float32x2_t)vbsl_s8((int8x8_t)vcgez_f32(v24), (int8x8_t)vdup_lane_s32(v15, 0), (int8x8_t)vdup_lane_s32(v14, 0)));
      v26.i64[1] = __PAIR64__(HIDWORD(v48), v25.u32[0]);
      int32x4_t v27 = (int32x4_t)vmulq_f32(v26, v26);
      v27.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1))).u32[0];
      float32x2_t v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
      float32x2_t v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)));
      float32x4_t v49 = vmulq_n_f32(v26, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
      float v30 = acosf(v49.f32[2]);
      *(float *)&long long v10 = (float)((float)((float)((float)(atan2f(v49.f32[1], v49.f32[0]) * -0.15915) + -0.25) + 1.0)
                             * (float)a2)
                     + -0.5;
      float v33 = (float)((float)((float)(v30 * -0.31831) + 1.0) * v12) + -0.5;
      float v34 = (float)(int)v33;
      float v35 = (float)(int)*(float *)&v10;
      signed int v36 = (int)*(float *)&v10 % a2;
      int v37 = (int)v33 & ~((int)v33 >> 31);
      if (v37 >= v21) {
        int v37 = v21;
      }
      float v38 = *(float *)&v10 - v35;
      if (v36 + 1 == a2) {
        int v39 = 0;
      }
      else {
        int v39 = v36 + 1;
      }
      float v40 = v33 - v34;
      if (v37 + 1 < v21) {
        int v41 = v37 + 1;
      }
      else {
        int v41 = v21;
      }
      uint64_t v42 = v37 * a2;
      LOBYTE(v34) = *(unsigned char *)(v9 + v42 + v36);
      LOBYTE(v35) = *(unsigned char *)(v9 + v42 + v39);
      uint64_t v43 = v41 * a2;
      LOBYTE(v31) = *(unsigned char *)(v9 + v43 + v36);
      LOBYTE(v32) = *(unsigned char *)(v9 + v43 + v39);
      float v44 = (float)(v38 * v38) * (float)((float)(v38 * -2.0) + 3.0);
      float v45 = (float)(v40 * v40) * (float)((float)(v40 * -2.0) + 3.0);
      *(float *)v14.i32 = (float)(v44 * (float)LODWORD(v35)) + (float)((float)LODWORD(v34) * (float)(1.0 - v44));
      *(float *)v15.i32 = 1.0 - v45;
      float v46 = v45 * (float)((float)(v44 * (float)v32) + (float)((float)v31 * (float)(1.0 - v44)));
      float v13 = 0.5;
      v15.i32[1] = 0x40000000;
      v14.i32[1] = 973078528;
      *(unsigned char *)(v7 + v22++) = (int)(float)((float)(v46 + (float)(*(float *)v14.i32 * *(float *)v15.i32)) + 0.5);
    }
    while (v22 != 2048);
    ++v11;
    v7 += 2048;
  }
  while (v11 != 2048);

  return v6;
}

void *_NUNIGenerateAllMipmapsR8(unsigned __int8 *a1, const void *a2)
{
  uint64_t v2 = a1;
  uint64_t result = memcpy(a1, a2, 0x400000uLL);
  v4 = v2 + 0x400000;
  unsigned int v5 = 2048;
  for (unsigned int i = 2048; ; unsigned int i = v8)
  {
    int v7 = v5 >> 1;
    if (v5 >> 1 <= 1) {
      int v7 = 1;
    }
    int v8 = i >> 1;
    if (i >> 1 <= 1) {
      int v8 = 1;
    }
    if (v5 >= 2)
    {
      if (i <= 1)
      {
        int v12 = v7;
        float v13 = v4;
        do
        {
          *v13++ = (*v2 + v2[1] + 1) >> 1;
          v2 += 2;
          --v12;
        }
        while (v12);
      }
      else
      {
        int v9 = 0;
        long long v10 = v4;
        do
        {
          int v11 = v7;
          do
          {
            uint64_t result = (void *)v2[1];
            *v10++ = (*v2 + result + v2[v5] + v2[v5 + 1] + 2) >> 2;
            v2 += 2;
            --v11;
          }
          while (v11);
          ++v9;
          v2 += v5;
        }
        while (v9 != v8);
      }
    }
    if ((i | v5) < 4) {
      break;
    }
    uint64_t v2 = v4;
    v4 += (v8 * v7);
    unsigned int v5 = v7;
  }
  return result;
}

uint64_t NUNIAstronomyVistaView_SpheroidTypeToVista(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return 2;
  }
  else {
    return qword_21E8F1D10[a1 - 1];
  }
}

id NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(void *a1, void *a2, void *a3)
{
  uint64_t v199 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = objc_opt_new();
  id v158 = v6;
  uint64_t v9 = [v158 bytes];
  id v164 = v7;
  uint64_t v10 = [v164 bytes];
  v11.i32[0] = *(_DWORD *)(v9 + 52);
  int32x2_t v163 = v11;
  double v167 = *(double *)(v9 + 96);
  double v169 = *(double *)(v9 + 104);
  float32x4_t v171 = *(float32x4_t *)v9;
  float32x4_t v172 = *(float32x4_t *)v10;
  float32x4_t v170 = *(float32x4_t *)(v10 + 16);
  long long v160 = *(_OWORD *)(v10 + 32);
  v11.i32[1] = DWORD1(v160);
  double v161 = *(double *)(v9 + 32);
  v11.i32[0] = *(_DWORD *)(v10 + 52);
  int32x2_t v162 = v11;
  float32x4_t v165 = *(float32x4_t *)(v9 + 16);
  double v166 = *(double *)(v10 + 96);
  double v168 = *(double *)(v10 + 104);
  uint64_t v12 = *(int *)(v9 + 128);
  id v159 = v5;
  uint64_t v13 = [v5 spheroids];
  uint64_t v175 = *(void *)(v9 + 56);
  v176 = (void *)v13;
  uint64_t v186 = v10;
  uint64_t v174 = *(void *)(v10 + 56);
  if (v12)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    v181 = 0;
    v182 = 0;
    v17 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    double v173 = *(double *)&_Q0;
    while (1)
    {
      uint64_t v22 = [v176 objectAtIndex:v16];
      uint64_t v25 = v186 + v15;
      uint64_t v26 = *(void *)(v9 + v15 + 144);
      uint64_t v27 = (uint64_t)v182;
      if (v26 == v175) {
        uint64_t v27 = v9 + v15 + 144;
      }
      v182 = (float32x2_t *)v27;
      _ZF = v26 == v174;
      uint64_t v28 = (uint64_t)v181;
      if (_ZF) {
        uint64_t v28 = v186 + v15 + 144;
      }
      v181 = (float32x2_t *)v28;
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 232);
      v23.i32[0] = *(_DWORD *)(v25 + 232);
      if (*(float *)v24.i32 != *(float *)v23.i32)
      {
        float32x2_t v29 = [[NUNIAnimation alloc] initWithAnimatable:v22 from:7 to:*(double *)vdupq_lane_s32(v24, 0).i64 key:*(double *)vdupq_lane_s32(v23, 0).i64];

        [(NUNIAnimation *)v29 setFunction:0];
        [v8 addObject:v29];
        v17 = v29;
      }
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 192);
      v23.i32[0] = *(_DWORD *)(v25 + 192);
      if (*(float *)v24.i32 == *(float *)v23.i32) {
        goto LABEL_21;
      }
      int32x2_t v178 = v23;
      if (*(float *)v24.i32 == 1.0 && *(float *)v23.i32 == 0.0) {
        break;
      }
      double v177 = *(double *)&v24;
      float v30 = [NUNIAnimation alloc];
      *(void *)&double v33 = vdupq_lane_s32(*(int32x2_t *)&v177, 0).u64[0];
      _ZF = *(float *)&v177 == 0.0 && *(float *)v178.i32 == 1.0;
      if (_ZF)
      {
        unsigned int v32 = v22;
        double v31 = v173;
        double v34 = v33;
        double v35 = v33;
        goto LABEL_19;
      }
      uint64_t v37 = -[NUNIAnimation initWithAnimatable:from:to:key:](v30, "initWithAnimatable:from:to:key:", v22, 9, v33, *(double *)vdupq_lane_s32(v178, 0).i64, v177);

      float v38 = (void *)v37;
      uint64_t v39 = 0;
LABEL_20:
      [v38 setFunction:v39];
      v17 = (void *)v37;
      [v8 addObject:v37];
LABEL_21:
      v23.i32[0] = *(_DWORD *)(v9 + v15 + 196);
      v24.i32[0] = *(_DWORD *)(v186 + v15 + 196);
      if (*(float *)v23.i32 != *(float *)v24.i32)
      {
        float v40 = [[NUNIAnimation alloc] initWithAnimatable:v22 from:12 to:*(double *)vdupq_lane_s32(v23, 0).i64 key:*(double *)vdupq_lane_s32(v24, 0).i64];

        [(NUNIAnimation *)v40 setFunction:0];
        [v8 addObject:v40];
        v17 = v40;
      }
      v24.i32[0] = *(_DWORD *)(v9 + v15 + 156);
      v23.i32[0] = *(_DWORD *)(v186 + v15 + 156);
      if (*(float *)v23.i32 != *(float *)v24.i32)
      {
        int v41 = [[NUNIAnimation alloc] initWithAnimatable:v22 from:5 to:*(double *)vdupq_lane_s32(v24, 0).i64 key:*(double *)vdupq_lane_s32(v23, 0).i64];

        [(NUNIAnimation *)v41 setFunction:0];
        [v8 addObject:v41];
        v17 = v41;
      }
      if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(v186 + v15 + 176), *(float32x4_t *)(v9 + v15 + 176))) & 0x80000000) == 0)
      {
        *(_OWORD *)v191 = xmmword_21E8F1CD0;
        *(_OWORD *)&v191[12] = *(long long *)((char *)&xmmword_21E8F1CD0 + 12);
        +[NUNIAnimation generateSlerpKeys:times:count:from:to:](NUNIAnimation, "generateSlerpKeys:times:count:from:to:", &v192, v191, 7);
        uint64_t v42 = [[NUNIAnimation alloc] initWithAnimatable:v22 values:&v192 count:7 key:2];

        [(NUNIAnimation *)v42 setFunction:3];
        [v8 addObject:v42];
        v17 = v42;
      }
      uint64_t v43 = [[NUNIAnimation alloc] initWithAnimatable:v22 from:0 to:*(double *)(v9 + v15 + 240) key:*(double *)(v186 + v15 + 240)];

      [(NUNIAnimation *)v43 setFunction:0];
      [v8 addObject:v43];

      ++v16;
      v15 += 160;
      v17 = v43;
      if (v12 == v16) {
        goto LABEL_30;
      }
    }
    float v30 = [NUNIAnimation alloc];
    *(void *)&double v31 = vdupq_lane_s32(v178, 0).u64[0];
    unsigned int v32 = v22;
    double v33 = v173;
    double v34 = v31;
    double v35 = v31;
LABEL_19:
    uint64_t v37 = [(NUNIAnimation *)v30 initWithAnimatable:v32 from:9 to:v33 ctrl1:v31 ctrl2:v34 key:v35];

    float v38 = (void *)v37;
    uint64_t v39 = 2;
    goto LABEL_20;
  }
  uint64_t v43 = 0;
  v181 = 0;
  v182 = 0;
LABEL_30:
  float32x4_t v45 = v171;
  float32x4_t v44 = v172;
  _Q0 = vsubq_f32(v172, v171);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  *(float *)v14.i32 = sqrtf(_S1);
  float32x4_t v49 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(v14, 0));
  if (!v182 || !v181)
  {
    if (v174 == 3 && v181)
    {
      float v179 = *(float *)v14.i32;
      float32x2_t v77 = vsub_f32(v181[12], *(float32x2_t *)v171.f32);
      float32x2_t v78 = vmul_f32(v77, v77);
      v78.i32[0] = vadd_f32(v78, (float32x2_t)vdup_lane_s32((int32x2_t)v78, 1)).u32[0];
      float32x2_t v79 = vrsqrte_f32((float32x2_t)v78.u32[0]);
      float32x2_t v80 = vmul_f32(v79, vrsqrts_f32((float32x2_t)v78.u32[0], vmul_f32(v79, v79)));
      float32x2_t v183 = vmul_n_f32(v77, vmul_f32(v80, vrsqrts_f32((float32x2_t)v78.u32[0], vmul_f32(v80, v80))).f32[0]);
      int32x4_t v187 = (int32x4_t)v49;
      float32x2_t v81 = vsub_f32(*(float32x2_t *)v170.f32, *(float32x2_t *)v172.f32);
      float32x2_t v82 = vmul_f32(v81, v81);
      v82.i32[0] = vadd_f32(v82, (float32x2_t)vdup_lane_s32((int32x2_t)v82, 1)).u32[0];
      float32x2_t v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
      float32x2_t v84 = vmul_f32(v83, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)));
      float32x2_t v85 = vmul_n_f32(v81, vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84))).f32[0]);
      float v86 = atan2f(_Q0.f32[0], _Q0.f32[1]);
      float v87 = atan2f(v183.f32[0], v183.f32[1]);
      float32x4_t v49 = (float32x4_t)v187;
      if (v86 >= v87)
      {
        v88.i64[1] = 0;
        v88.i32[0] = v187.i32[1];
        v88.f32[1] = -*(float *)v187.i32;
      }
      else
      {
        float32x4_t v88 = (float32x4_t)vtrn1q_s32((int32x4_t)COERCE_UNSIGNED_INT(-*(float *)&v187.i32[1]), v187);
      }
      v72 = v158;
      v71 = v159;
      *(float *)v14.i32 = v179;
      float v89 = fmaxf(v183.f32[1] * (float)((float)(v179 * 30.0) * vaddv_f32(vmul_f32(v183, v85))), 0.0);
      float32x4_t v45 = v171;
      float32x4_t v44 = v172;
    }
    else
    {
      float32x4_t v88 = 0uLL;
      float v89 = 0.0;
      v71 = v159;
      if (v175 == 3)
      {
        v72 = v158;
        if (v182)
        {
          float v180 = *(float *)v14.i32;
          float32x2_t v90 = vsub_f32(v182[12], *(float32x2_t *)v172.f32);
          float32x2_t v91 = vmul_f32(v90, v90);
          v91.i32[0] = vadd_f32(v91, (float32x2_t)vdup_lane_s32((int32x2_t)v91, 1)).u32[0];
          float32x2_t v92 = vrsqrte_f32((float32x2_t)v91.u32[0]);
          float32x2_t v93 = vmul_f32(v92, vrsqrts_f32((float32x2_t)v91.u32[0], vmul_f32(v92, v92)));
          float32x2_t v184 = vmul_n_f32(v90, vmul_f32(v93, vrsqrts_f32((float32x2_t)v91.u32[0], vmul_f32(v93, v93))).f32[0]);
          int32x4_t v188 = (int32x4_t)v49;
          float32x2_t v94 = vsub_f32(*(float32x2_t *)v165.f32, *(float32x2_t *)v171.f32);
          float32x2_t v95 = vmul_f32(v94, v94);
          v95.i32[0] = vadd_f32(v95, (float32x2_t)vdup_lane_s32((int32x2_t)v95, 1)).u32[0];
          float32x2_t v96 = vrsqrte_f32((float32x2_t)v95.u32[0]);
          float32x2_t v97 = vmul_f32(v96, vrsqrts_f32((float32x2_t)v95.u32[0], vmul_f32(v96, v96)));
          float32x2_t v98 = vmul_n_f32(v94, vmul_f32(v97, vrsqrts_f32((float32x2_t)v95.u32[0], vmul_f32(v97, v97))).f32[0]);
          unint64_t v99 = vsubq_f32(v171, v172).u64[0];
          float v100 = atan2f(*(float *)&v99, *((float *)&v99 + 1));
          float v101 = atan2f(v184.f32[0], v184.f32[1]);
          float32x4_t v49 = (float32x4_t)v188;
          if (v100 <= v101)
          {
            v88.i64[1] = 0;
            v88.i32[0] = v188.i32[1];
            v88.f32[1] = -*(float *)v188.i32;
          }
          else
          {
            float32x4_t v88 = (float32x4_t)vtrn1q_s32((int32x4_t)COERCE_UNSIGNED_INT(-*(float *)&v188.i32[1]), v188);
          }
          *(float *)v14.i32 = v180;
          float v89 = fmaxf(v184.f32[1] * (float)((float)(v180 * 20.0) * vaddv_f32(vmul_f32(v184, v98))), 0.0);
          float32x4_t v45 = v171;
          float32x4_t v44 = v172;
          goto LABEL_66;
        }
      }
      else
      {
        v72 = v158;
      }
    }
    if (v175 == 24)
    {
      float32x4_t v126 = v45;
      v126.i32[3] = 0;
      float32x4_t v127 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.2), v88, v89 * 0.2);
      v127.i32[3] = 0;
      float32x4_t v192 = v126;
      float32x4_t v193 = v127;
      float32x4_t v128 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.5), v88, v89 * 0.3);
      v128.i32[3] = 0;
      float32x4_t v129 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.8), v88, v89 * 0.15);
      v129.i32[3] = 0;
      float32x4_t v194 = v128;
      float32x4_t v195 = v129;
      float32x4_t v130 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.92), v88, v89 * 0.05);
      v130.i32[3] = 0;
      float32x4_t v131 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.97), v88, v89 * 0.02);
      v131.i32[3] = 0;
      float32x4_t v196 = v130;
LABEL_67:
      v44.i32[3] = 0;
      float32x4_t v197 = v131;
      float32x4_t v198 = v44;
      v137 = [[NUNIAnimation alloc] initWithAnimatable:v71 values:&v192 count:7 key:0];

      [(NUNIAnimation *)v137 setFunction:3];
      unint64_t v138 = 0x2644CD000;
      goto LABEL_73;
    }
LABEL_66:
    float32x4_t v132 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.3), v88, v89 * 0.15);
    float32x4_t v133 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.75), v88, v89 * 0.2);
    float32x4_t v134 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.93), v88, v89 * 0.05);
    float32x4_t v135 = v45;
    v135.i32[3] = 0;
    float32x4_t v136 = vmlaq_n_f32(vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.97), v88, v89 * 0.02);
    v132.i32[3] = 0;
    v133.i32[3] = 0;
    float32x4_t v192 = v135;
    float32x4_t v193 = v132;
    v134.i32[3] = 0;
    v136.i32[3] = 0;
    float32x4_t v194 = v133;
    float32x4_t v195 = v134;
    float32x4_t v131 = vmlaq_n_f32(v45, v49, *(float *)v14.i32 * 0.99);
    v131.i32[3] = 0;
    float32x4_t v196 = v136;
    goto LABEL_67;
  }
  _Q1 = (int32x4_t)vmulq_f32(v49, (float32x4_t)xmmword_21E8F1CA0);
  float32x4_t v51 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)_Q1, (int8x16_t)_Q1, 4uLL), _Q1);
  _Q2 = vsubq_f32(v170, v172);
  _Q3 = vmulq_f32(_Q2, _Q2);
  _S4 = _Q2.i32[2];
  __asm { FMLA            S3, S4, V2.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  _Q4 = vsubq_f32(v165, v171);
  _Q5 = vmulq_f32(_Q4, _Q4);
  _S6 = _Q4.i32[2];
  __asm { FMLA            S5, S6, V4.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q3 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q4 = vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0));
  unint64_t v60 = vmlaq_n_f32(vmlaq_n_f32(v171, v49, *(float *)v14.i32 * 0.25), v51, *(float *)v14.i32 * 0.05).u64[0];
  unint64_t v61 = vmlaq_n_f32(vmlaq_n_f32(v171, v49, *(float *)v14.i32 * 0.75), v51, *(float *)v14.i32 * 0.05).u64[0];
  float32x4_t v62 = *(float32x4_t *)v182[12].f32;
  v14.i32[0] = v182[10].i32[1];
  float32x4_t v63 = *(float32x4_t *)v181[12].f32;
  float v64 = v181[10].f32[1];
  _S19 = vsubq_f32(v171, v62).i32[2];
  __asm { FMLA            S18, S19, V6.S[2] }
  if (sqrtf(_S18) <= (float)(*(float *)v14.i32 * 5.7588))
  {
    _S18 = v49.i32[2];
    __asm { FMLA            S17, S18, V4.S[2] }
    if (_S17 > 0.25)
    {
      _S16 = _Q4.i32[2];
      __asm
      {
        FMLA            S17, S4, V1.S[1]
        FMLA            S17, S16, V1.S[2]
      }
      *(float *)v14.i32 = (float)(*(float *)v14.i32 * 5.7588) * 3.0;
      float32x4_t v107 = (float32x4_t)vdupq_lane_s32(v14, 0);
      v72 = v158;
      v71 = v159;
      if (_S17 <= 0.1) {
        unint64_t v60 = vmlaq_f32(v171, v107, v51).u64[0];
      }
      else {
        unint64_t v60 = vmlsq_f32(v171, v107, v51).u64[0];
      }
      goto LABEL_49;
    }
  }
  else
  {
    _S19 = vsubq_f32(v172, v62).i32[2];
    __asm { FMLA            S17, S19, V16.S[2] }
    if (sqrtf(_S17) <= (float)(*(float *)v14.i32 * 5.7588))
    {
      _S17 = v49.i32[2];
      __asm { FMLA            S16, S17, V3.S[2] }
      v72 = v158;
      v71 = v159;
      if (_S16 < -0.25)
      {
        _S16 = _Q3.i32[2];
        __asm
        {
          FMLA            S17, S3, V1.S[1]
          FMLA            S17, S16, V1.S[2]
        }
        *(float *)v14.i32 = (float)(*(float *)v14.i32 * 5.7588) * 3.0;
        float32x4_t v76 = (float32x4_t)vdupq_lane_s32(v14, 0);
        if (_S17 <= 0.1) {
          unint64_t v61 = vmlaq_f32(v172, v76, v51).u64[0];
        }
        else {
          unint64_t v61 = vmlsq_f32(v172, v76, v51).u64[0];
        }
      }
      goto LABEL_49;
    }
  }
  v72 = v158;
  v71 = v159;
LABEL_49:
  _S17 = vsubq_f32(v171, v63).i32[2];
  __asm { FMLA            S16, S17, V7.S[2] }
  if (sqrtf(_S16) <= (float)(v64 * 5.7588))
  {
    _S5 = v49.i32[2];
    __asm { FMLA            S3, S5, V4.S[2] }
    double v185 = *(double *)&v61;
    if (_S3 <= 0.25)
    {
      double v189 = *(double *)&v60;
    }
    else
    {
      _S3 = _Q4.i32[2];
      __asm
      {
        FMLA            S5, S4, V1.S[1]
        FMLA            S5, S3, V1.S[2]
      }
      *(float *)_Q1.i32 = (float)(v64 * 5.7588) * 3.0;
      float32x4_t v117 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.i8, 0);
      if (_S5 <= 0.1) {
        unint64_t v118 = vmlaq_f32(v171, v117, v51).u64[0];
      }
      else {
        unint64_t v118 = vmlsq_f32(v171, v117, v51).u64[0];
      }
      double v189 = *(double *)&v118;
    }
  }
  else
  {
    _S7 = vsubq_f32(v172, v63).i32[2];
    __asm { FMLA            S5, S7, V4.S[2] }
    double v189 = *(double *)&v60;
    if (sqrtf(_S5) <= (float)(v64 * 5.7588))
    {
      _S5 = v49.i32[2];
      __asm { FMLA            S4, S5, V3.S[2] }
      if (_S4 >= -0.25)
      {
        double v185 = *(double *)&v61;
      }
      else
      {
        _S4 = _Q3.i32[2];
        __asm
        {
          FMLA            S5, S3, V1.S[1]
          FMLA            S5, S4, V1.S[2]
        }
        *(float *)_Q1.i32 = (float)(v64 * 5.7588) * 3.0;
        float32x4_t v124 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.i8, 0);
        if (_S5 <= 0.1) {
          unint64_t v125 = vmlaq_f32(v172, v124, v51).u64[0];
        }
        else {
          unint64_t v125 = vmlsq_f32(v172, v124, v51).u64[0];
        }
        double v185 = *(double *)&v125;
      }
    }
    else
    {
      double v185 = *(double *)&v61;
    }
  }
  unint64_t v138 = 0x2644CD000uLL;
  v137 = [[NUNIAnimation alloc] initWithAnimatable:v71 from:0 to:*(double *)v171.i64 ctrl1:*(double *)v172.i64 ctrl2:v189 key:v185];

  [(NUNIAnimation *)v137 setFunction:2];
LABEL_73:
  [v8 addObject:v137];
  float32x4_t v139 = v170;
  _Q0 = vsubq_f32(v170, v165);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v143 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  float32x4_t v144 = v165;
  v144.i32[3] = 0;
  float32x4_t v145 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.3);
  v145.i32[3] = 0;
  float32x4_t v192 = v144;
  float32x4_t v193 = v145;
  float32x4_t v146 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.75);
  v146.i32[3] = 0;
  float32x4_t v147 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.93);
  float32x4_t v148 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.97);
  v147.i32[3] = 0;
  v148.i32[3] = 0;
  float32x4_t v194 = v146;
  float32x4_t v195 = v147;
  float32x4_t v149 = vmlaq_n_f32(v165, v143, _Q1.f32[0] * 0.99);
  v149.i32[3] = 0;
  float32x4_t v196 = v148;
  float32x4_t v197 = v149;
  v139.i32[3] = 0;
  float32x4_t v198 = v139;
  v150 = (void *)[objc_alloc(*(Class *)(v138 + 1752)) initWithAnimatable:v71 values:&v192 count:7 key:1];

  [v150 setFunction:3];
  [v8 addObject:v150];
  v190[0] = xmmword_21E8F1CEC;
  *(_OWORD *)((char *)v190 + 12) = *(long long *)((char *)&xmmword_21E8F1CEC + 12);
  [*(id *)(v138 + 1752) generateSlerpKeys:v191 times:v190 count:7 from:v161 to:*(double *)&v160];
  v151 = (void *)[objc_alloc(*(Class *)(v138 + 1752)) initWithAnimatable:v71 values:v191 count:7 key:2];

  [v151 setFunction:3];
  [v8 addObject:v151];
  v152 = objc_msgSend(objc_alloc(*(Class *)(v138 + 1752)), "initWithAnimatable:from:to:key:", v71, 3, *(double *)vdupq_lane_s32(v163, 0).i64, *(double *)vdupq_lane_s32(v162, 0).i64);

  [v152 setFunction:0];
  [v8 addObject:v152];
  uint32x2_t v153 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v167, *(float32x2_t *)&v166);
  if ((vpmin_u32(v153, v153).u32[0] & 0x80000000) == 0)
  {
    v154 = (void *)[objc_alloc(*(Class *)(v138 + 1752)) initWithAnimatable:v71 from:6 to:v167 ctrl1:v166 ctrl2:v166 key:v166];

    [v154 setFunction:2];
    [v8 addObject:v154];
    v152 = v154;
  }
  uint32x2_t v155 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v169, *(float32x2_t *)&v168);
  if ((vpmin_u32(v155, v155).u32[0] & 0x80000000) == 0)
  {
    v156 = (void *)[objc_alloc(*(Class *)(v138 + 1752)) initWithAnimatable:v71 from:7 to:v169 ctrl1:v168 ctrl2:v168 key:v168];

    [v156 setFunction:2];
    [v8 addObject:v156];
    v152 = v156;
  }

  return v8;
}

id NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = objc_opt_new();
  id v122 = v6;
  uint64_t v9 = [v122 bytes];
  id v121 = v7;
  uint64_t v10 = [v121 bytes];
  float32x4_t v11 = *(float32x4_t *)(v9 + 32);
  float32x4_t v128 = *(float32x4_t *)v9;
  float32x4_t v129 = v11;
  v11.i32[0] = *(_DWORD *)(v9 + 52);
  int32x2_t v126 = *(int32x2_t *)v11.f32;
  double v131 = *(double *)(v9 + 96);
  double v133 = *(double *)(v9 + 104);
  float32x4_t v134 = *(float32x4_t *)(v9 + 16);
  float32x4_t v127 = *(float32x4_t *)v10;
  float32x4_t v12 = *(float32x4_t *)(v10 + 32);
  long long v123 = *(_OWORD *)(v10 + 16);
  float32x4_t v124 = v12;
  v12.i32[0] = *(_DWORD *)(v10 + 52);
  int32x2_t v125 = *(int32x2_t *)v12.f32;
  double v130 = *(double *)(v10 + 96);
  double v132 = *(double *)(v10 + 104);
  uint64_t v13 = *(int *)(v9 + 128);
  unint64_t v138 = [v5 spheroids];
  uint64_t v137 = v13;
  if (!v13)
  {
    int v18 = 0;
    goto LABEL_42;
  }
  v120 = v5;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v18 = 0;
  uint64_t v135 = *(void *)(v9 + 56);
  uint64_t v136 = *(void *)(v10 + 56);
  __asm { FMOV            V0.4S, #1.0 }
  double v139 = *(double *)&_Q0;
  do
  {
    int32x2_t v23 = [v138 objectAtIndex:v15];
    uint64_t v25 = *(void *)(v10 + v14 + 144);
    if (v25 == v135) {
      uint64_t v17 = v9 + v14 + 144;
    }
    uint64_t v144 = v17;
    if (v25 == v136) {
      uint64_t v16 = v10 + v14 + 144;
    }
    v24.i32[0] = *(_DWORD *)(v9 + v14 + 232);
    int32x2_t v155 = v24;
    v24.i32[0] = *(_DWORD *)(v10 + v14 + 232);
    float v150 = *(float *)v24.i32;
    *(void *)&double v140 = vdupq_lane_s32(v24, 0).u64[0];
    *(void *)&double v142 = vdupq_lane_s32(v155, 0).u64[0];
    uint64_t v26 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v23, 7);

    [(NUNIAnimation *)v26 setFunction:0];
    if (*(float *)v155.i32 == 1.0 && v150 <= 0.00001)
    {
      uint64_t v27 = [NUNIAnimation alloc];
      double v28 = 0.0;
      double v29 = 0.0;
      float v30 = v23;
      double v31 = v139;
      double v32 = v139;
    }
    else
    {
      uint64_t v27 = [NUNIAnimation alloc];
      if (*(float *)v155.i32 > 0.00001 || v150 != 1.0)
      {
        int v18 = [(NUNIAnimation *)v27 initWithAnimatable:v23 from:7 to:v142 key:v140];

        double v34 = v18;
        uint64_t v35 = 0;
        goto LABEL_17;
      }
      double v31 = 0.0;
      double v32 = 0.0;
      float v30 = v23;
      double v28 = v139;
      double v29 = v139;
    }
    int v18 = [(NUNIAnimation *)v27 initWithAnimatable:v30 from:7 to:v31 ctrl1:v28 ctrl2:v32 key:v29];

    double v34 = v18;
    uint64_t v35 = 2;
LABEL_17:
    [(NUNIAnimation *)v34 setFunction:v35];
    [v8 addObject:v18];
    v36.i32[0] = *(_DWORD *)(v9 + v14 + 192);
    v37.i32[0] = *(_DWORD *)(v10 + v14 + 192);
    if (*(float *)v36.i32 == *(float *)v37.i32) {
      goto LABEL_27;
    }
    if (*(float *)v36.i32 == 1.0 && *(float *)v37.i32 == 0.0)
    {
      float v38 = [NUNIAnimation alloc];
      double v39 = 0.0;
      double v40 = 0.0000305175853;
      int v41 = v23;
      double v42 = v139;
      double v43 = v139;
    }
    else
    {
      int32x2_t v151 = v37;
      int32x2_t v156 = v36;
      float v38 = [NUNIAnimation alloc];
      if (*(float *)v156.i32 != 0.0 || *(float *)v151.i32 != 1.0)
      {
        uint64_t v44 = [(NUNIAnimation *)v38 initWithAnimatable:v23 from:9 to:*(double *)vdupq_lane_s32(v156, 0).i64 key:*(double *)vdupq_lane_s32(v151, 0).i64];

        float32x4_t v45 = (void *)v44;
        uint64_t v46 = 0;
        goto LABEL_26;
      }
      double v42 = 0.0;
      double v43 = 0.0000305175853;
      int v41 = v23;
      double v39 = v139;
      double v40 = v139;
    }
    uint64_t v44 = [(NUNIAnimation *)v38 initWithAnimatable:v41 from:9 to:v42 ctrl1:v39 ctrl2:v43 key:v40];

    float32x4_t v45 = (void *)v44;
    uint64_t v46 = 2;
LABEL_26:
    [v45 setFunction:v46];
    int v18 = (NUNIAnimation *)v44;
    [v8 addObject:v44];
LABEL_27:
    v37.i32[0] = *(_DWORD *)(v9 + v14 + 196);
    v36.i32[0] = *(_DWORD *)(v10 + v14 + 196);
    if (*(float *)v37.i32 != *(float *)v36.i32)
    {
      v47 = [[NUNIAnimation alloc] initWithAnimatable:v23 from:12 to:*(double *)vdupq_lane_s32(v37, 0).i64 key:*(double *)vdupq_lane_s32(v36, 0).i64];

      [(NUNIAnimation *)v47 setFunction:0];
      [v8 addObject:v47];
      int v18 = v47;
    }
    v36.i32[0] = *(_DWORD *)(v9 + v14 + 156);
    v37.i32[0] = *(_DWORD *)(v10 + v14 + 156);
    if (*(float *)v37.i32 != *(float *)v36.i32)
    {
      long long v48 = [[NUNIAnimation alloc] initWithAnimatable:v23 from:5 to:*(double *)vdupq_lane_s32(v36, 0).i64 key:*(double *)vdupq_lane_s32(v37, 0).i64];

      [(NUNIAnimation *)v48 setFunction:0];
      [v8 addObject:v48];
      int v18 = v48;
    }
    float32x4_t v49 = *(float32x4_t *)(v10 + v14 + 240);
    uint32x4_t v50 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v9 + v14 + 240), v49);
    v50.i32[3] = v50.i32[2];
    if ((vminvq_u32(v50) & 0x80000000) == 0)
    {
      float32x4_t v51 = [[NUNIAnimation alloc] initWithAnimatable:v23 from:0 to:*(double *)(v9 + v14 + 240) key:*(double *)v49.i64];

      [(NUNIAnimation *)v51 setFunction:0];
      [v8 addObject:v51];
      int v18 = v51;
    }
    float32x4_t v52 = *(float32x4_t *)(v10 + v14 + 176);
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v52, *(float32x4_t *)(v9 + v14 + 176))) & 0x80000000) == 0)
    {
      v53 = [[NUNIAnimation alloc] initWithAnimatable:v23 from:2 to:*(double *)(v9 + v14 + 176) key:*(double *)v52.i64];

      [(NUNIAnimation *)v53 setFunction:4];
      [v8 addObject:v53];
      int v18 = v53;
    }
    uint64_t v17 = v144;

    ++v15;
    v14 += 160;
  }
  while (v137 != v15);
  if (!v144)
  {
    id v5 = v120;
    goto LABEL_42;
  }
  id v5 = v120;
  if (!v16)
  {
LABEL_42:
    v65 = [[NUNIAnimation alloc] initWithAnimatable:v5 from:0 to:*(double *)v128.i64 key:*(double *)v127.i64];

    [(NUNIAnimation *)v65 setFunction:0];
    [v8 addObject:v65];
    goto LABEL_72;
  }
  _Q1 = vsubq_f32(v128, v134);
  _S9 = _Q1.i32[2];
  float v56 = _Q1.f32[1];
  __asm { FMLA            S0, S9, V1.S[2] }
  float v152 = sqrtf(_S0);
  float32x4_t v157 = _Q1;
  float v147 = acosf(_Q1.f32[2] / v152);
  _Q0.f32[0] = atan2f(v56, v157.f32[0]);
  float v143 = _Q0.f32[0];
  _Q1 = _Q0;
  _Q1.f32[1] = v147;
  _Q1.f32[2] = v152;
  float32x4_t v145 = _Q1;
  float32x4_t v141 = vsubq_f32(v127, v134);
  _Q1.i32[0] = v141.i32[2];
  __asm { FMLA            S0, S1, V2.S[2] }
  float v148 = sqrtf(_Q0.f32[0]);
  float v153 = acosf(v141.f32[2] / v148);
  v60.f32[0] = atan2f(v141.f32[1], v141.f32[0]);
  v63.f32[0] = v143 - v60.f32[0];
  if ((float)(v143 - v60.f32[0]) > 3.1416)
  {
    v61.f32[0] = v143 + -6.2832;
    float32x4_t v64 = v145;
    goto LABEL_45;
  }
  float32x4_t v64 = v145;
  float32x4_t v61 = v145;
  if (v63.f32[0] < -3.1416)
  {
    v61.f32[0] = v143 + 6.2832;
LABEL_45:
    v61.i32[1] = v64.i32[1];
    v61.i32[2] = v64.i32[2];
  }
  _V21.S[2] = v157.i32[2];
  if ((float)(v61.f32[1] - v153) > 3.1416)
  {
    float v67 = -6.2832;
    goto LABEL_50;
  }
  if ((float)(v61.f32[1] - v153) < -3.1416)
  {
    float v67 = 6.2832;
LABEL_50:
    v68.i64[0] = __PAIR64__(v61.f32[1] + v67, v61.u32[0]);
    v68.i64[1] = v61.i64[1];
    float32x4_t v61 = v68;
  }
  v60.f32[1] = v153;
  if (v63.f32[0] > 3.1416)
  {
    float v69 = -6.2832;
    goto LABEL_55;
  }
  float32x4_t v62 = v64;
  if (v63.f32[0] < -3.1416)
  {
    float v69 = 6.2832;
LABEL_55:
    v62.f32[0] = v143 + v69;
    v62.i32[1] = v64.i32[1];
    v62.i32[2] = v64.i32[2];
  }
  v60.f32[2] = v148;
  float32x4_t v70 = (float32x4_t)vdupq_n_s32(0x3EA8F5C3u);
  if ((float)(v62.f32[1] - v153) > 3.1416)
  {
    float v71 = -6.2832;
    goto LABEL_60;
  }
  if ((float)(v62.f32[1] - v153) < -3.1416)
  {
    float v71 = 6.2832;
LABEL_60:
    v72.i64[0] = __PAIR64__(v62.f32[1] + v71, v62.u32[0]);
    v72.i64[1] = v62.i64[1];
    float32x4_t v62 = v72;
  }
  __asm { FMLA            S4, S9, V21.S[2] }
  float32x4_t v74 = (float32x4_t)vdupq_n_s32(0x3F2B851Eu);
  float32x4_t v75 = vmulq_f32(v60, v70);
  float32x4_t v76 = vmulq_f32(v60, (float32x4_t)vdupq_n_s32(0x3F28F5C3u));
  float32x4_t v77 = (float32x4_t)vdupq_n_s32(0x3EAE147Au);
  if (v63.f32[0] > 3.1416)
  {
    v63.i32[0] = -1060565029;
    goto LABEL_65;
  }
  if (v63.f32[0] < -3.1416)
  {
    v63.i32[0] = 1086918619;
LABEL_65:
    v63.f32[0] = v143 + v63.f32[0];
    v63.i32[1] = v64.i32[1];
    v63.i32[2] = v64.i32[2];
    float32x4_t v64 = v63;
  }
  float32x4_t v78 = vmlaq_f32(v75, v74, v61);
  float v79 = sqrtf(_S4);
  float32x4_t v158 = vmlaq_f32(v76, v77, v62);
  if ((float)(v64.f32[1] - v153) > 3.1416)
  {
    float v80 = -6.2832;
    goto LABEL_70;
  }
  if ((float)(v64.f32[1] - v153) < -3.1416)
  {
    float v80 = 6.2832;
LABEL_70:
    v81.i32[0] = v64.i32[0];
    v81.f32[1] = v64.f32[1] + v80;
    v81.i64[1] = v64.i64[1];
    float32x4_t v64 = v81;
  }
  v82.i64[0] = 0x3F0000003F000000;
  v82.i64[1] = 0x3F0000003F000000;
  float32x4_t v149 = v78;
  float32x4_t v154 = vmlaq_f32(vmulq_f32(v60, v82), v82, v64);
  __float2 v83 = __sincosf_stret(v78.f32[0]);
  __float2 v84 = __sincosf_stret(v149.f32[1]);
  *(float32x2_t *)v85.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v83.__sinval), LODWORD(v83.__cosval)), vmuls_lane_f32(v84.__sinval, v149, 2));
  v85.i32[2] = vmuls_lane_f32(v84.__cosval, v149, 2);
  v149.i64[0] = vaddq_f32(v134, v85).u64[0];
  __float2 v86 = __sincosf_stret(v158.f32[0]);
  __float2 v87 = __sincosf_stret(v158.f32[1]);
  *(float32x2_t *)v88.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v86.__sinval), LODWORD(v86.__cosval)), vmuls_lane_f32(v87.__sinval, v158, 2));
  v88.i32[2] = vmuls_lane_f32(v87.__cosval, v158, 2);
  *(void *)&double v146 = vaddq_f32(v134, v88).u64[0];
  float v89 = [v120 spheroidOfType:v135];
  float32x2_t v90 = [v120 spheroidOfType:v136];
  __float2 v91 = __sincosf_stret(v154.f32[0]);
  __float2 v92 = __sincosf_stret(v154.f32[1]);
  *(float32x2_t *)v93.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v91.__sinval), LODWORD(v91.__cosval)), vmuls_lane_f32(v92.__sinval, v154, 2));
  v93.i32[2] = vmuls_lane_f32(v92.__cosval, v154, 2);
  _Q0 = vsubq_f32(vaddq_f32(v134, v93), v134);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  int32x4_t v97 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v97, (int8x16_t)v97, 0xCuLL), (int8x16_t)v97, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v129, (int32x4_t)v129), (int8x16_t)v129, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v97, v97), (int8x16_t)v97, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v129, (int8x16_t)v129, 0xCuLL), (int8x16_t)v129, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v101 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0.f32[0] = v79 * 0.75;
  float32x4_t v159 = v101;
  v102 = [[NUNIAnimation alloc] initWithAnimatable:v89 from:0 to:*(double *)v134.i64 key:*(double *)vmlsq_lane_f32(v134, v101, *(float32x2_t *)_Q0.f32, 0).i64];

  [(NUNIAnimation *)v102 setFunction:0];
  [v8 addObject:v102];
  v103 = [[NUNIAnimation alloc] initWithAnimatable:v90 from:0 to:*(double *)vmlaq_n_f32(v134, v159, v79 * 0.75).i64 key:*(double *)v134.i64];

  [(NUNIAnimation *)v103 setFunction:0];
  [v8 addObject:v103];
  v65 = [[NUNIAnimation alloc] initWithAnimatable:v120 from:0 to:*(double *)v128.i64 ctrl1:*(double *)v127.i64 ctrl2:*(double *)v149.i64 key:v146];

  [(NUNIAnimation *)v65 setFunction:2];
  [v8 addObject:v65];

LABEL_72:
  v104 = [[NUNIAnimation alloc] initWithAnimatable:v5 from:1 to:*(double *)v134.i64 key:*(double *)&v123];

  [(NUNIAnimation *)v104 setFunction:0];
  [v8 addObject:v104];
  v105 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v124, _Q3), _Q4, v129);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v124, _Q4), _Q3, v129);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v113 = [(NUNIAnimation *)v105 initWithAnimatable:v5 from:2 to:*(double *)v129.i64 ctrl1:*(double *)v124.i64 ctrl2:*(double *)_Q2.i64 key:*(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64];

  [(NUNIAnimation *)v113 setFunction:2];
  [v8 addObject:v113];
  v114 = [[NUNIAnimation alloc] initWithAnimatable:v5 from:3 to:*(double *)vdupq_lane_s32(v126, 0).i64 key:*(double *)vdupq_lane_s32(v125, 0).i64];

  [(NUNIAnimation *)v114 setFunction:0];
  [v8 addObject:v114];
  uint32x2_t v115 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v131, *(float32x2_t *)&v130);
  if ((vpmin_u32(v115, v115).u32[0] & 0x80000000) == 0)
  {
    v116 = [[NUNIAnimation alloc] initWithAnimatable:v5 from:6 to:v131 key:v130];

    [(NUNIAnimation *)v116 setFunction:0];
    [v8 addObject:v116];
    v114 = v116;
  }
  uint32x2_t v117 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v133, *(float32x2_t *)&v132);
  if ((vpmin_u32(v117, v117).u32[0] & 0x80000000) == 0)
  {
    unint64_t v118 = [[NUNIAnimation alloc] initWithAnimatable:v5 from:7 to:v133 key:v132];

    [(NUNIAnimation *)v118 setFunction:0];
    [v8 addObject:v118];
    v114 = v118;
  }

  return v8;
}

float _NUNISphereoidComputeRadius(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    float v2 = 0.14894;
  }
  else
  {
    if (((1 << a1) & 0xFFC000) != 0) {
      uint64_t v5 = a1 - 14;
    }
    else {
      uint64_t v5 = a1;
    }
    if (v5)
    {
      if (v5 == 7)
      {
        float v2 = 0.051282;
      }
      else if (v5 == 6)
      {
        float v2 = 0.057692;
      }
      else
      {
        float v2 = 0.044872;
      }
    }
    else
    {
      float v2 = 0.070513;
    }
  }
  float result = 0.5;
  if ((unint64_t)(a1 - 10) >= 2)
  {
    float v4 = v2 + v2;
    if ((unint64_t)(a1 - 12) > 1) {
      float v4 = v2;
    }
    return v4 * 0.5;
  }
  return result;
}

void NUNIComputeSpheroidTransformParameters(void *a1, void *a2, float *a3, float *a4, float32x2_t *a5, float *a6, float *a7, int a8)
{
  id v15 = a2;
  id v16 = a1;
  uint64_t v17 = (uint64_t *)[v16 structure];
  int v18 = [v16 scene];

  *a6 = 0.0;
  *a4 = 0.0;
  v105 = a3;
  *a3 = 0.0;
  *a5 = 0;
  uint64_t v19 = [v18 collectionType];
  uint64_t v20 = *v17;
  *a7 = _NUNISphereoidComputeRadius(*v17, v19);
  if (((1 << v20) & 0xFBF3FE) != 0)
  {
    uint64_t v21 = v20 - 14;
    if (((1 << v20) & 0xFFC000) == 0) {
      uint64_t v21 = v20;
    }
    if (((1 << v20) & 0x3000) != 0) {
      uint64_t v22 = 7;
    }
    else {
      uint64_t v22 = v21;
    }
    float v23 = 0.0;
    if (v22)
    {
      int32x2_t v24 = (void *)[objc_alloc(MEMORY[0x263F41C08]) initWithDate:v15 body:v22];
      [v24 longitude];
      *(float *)&double v25 = v25;
      *a4 = (float)(*(float *)&v25 * 3.1416) / 180.0;

      if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        float v26 = s_distance[v22];
        if (v19)
        {
          float v27 = (float)(v26 * 10.0) + 3.0;
          float v28 = 48.0;
        }
        else
        {
          float v27 = (float)(v26 * 18.0) + 4.0;
          float v28 = 156.0;
        }
        float v23 = (float)(v27 / v28) * 0.5;
      }
    }
    *a6 = v23;
    if (v20 == 3)
    {
      double v33 = objc_opt_new();
      double v108 = 0.0;
      v109[0] = 0.0;
      double v107 = 0.0;
      [v33 calculateGeocentricDirectionForSunX:v109 Y:&v108 Z:&v107 date:v15];
      float v34 = v109[0];
      float v35 = v108;
      float v36 = v107;
      float v37 = 1.5708 - atan2f(v35, v34);
      if (a8)
      {
        *(float *)&unsigned int v38 = 3.14159265 - *a4;
        float v39 = v37 - *(float *)&v38;
        *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v36)), v38);
        float *v105 = v39;
      }
      else
      {
        float v106 = v37;
        *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v36)), LODWORD(v106));
      }
    }
    else if (v20 == 4)
    {
      float *v105 = *a4;
      double v29 = (void *)[objc_alloc(MEMORY[0x263F41C08]) initWithDate:v15 body:3];
      [v29 longitude];
      *(float *)&double v30 = v30;
      double v31 = (const float *)&dword_21E8F1E14;
      float32x2_t v32 = vld1_dup_f32(v31);
      v32.f32[0] = (float)(*(float *)&v30 * 3.1416) / -180.0;
      *a5 = v32;
    }
    else if ((unint64_t)(v20 - 1) <= 8)
    {
      double v40 = (double *)((char *)&NUNIComputeSpheroidTransformParameters_orientations + 40 * v20);
      double v41 = *v40;
      double v42 = v40[1];
      double v43 = v40[2];
      double v44 = v40[3];
      double v45 = v40[4];
      [v15 timeIntervalSince1970];
      double v47 = v46 / 86400.0 + 2440587.5 + -2451545.0;
      float v48 = fmod(v43 + v44 * v47, 360.0);
      *(double *)v49.i64 = UMFloat4x4MakeRotateZ(v48 * -0.017453);
      simd_float4 v97 = v50;
      simd_float4 v101 = v49;
      simd_float4 v89 = v52;
      simd_float4 v93 = v51;
      v49.f32[0] = 90.0 - v42;
      *(double *)v53.i64 = UMFloat4x4MakeRotateX(v49.f32[0] * -0.017453);
      v114.columns[0] = v53;
      v114.columns[1] = v54;
      v114.columns[2] = v55;
      v114.columns[3] = v56;
      v110.columns[1] = v97;
      v110.columns[0] = v101;
      v110.columns[3] = v89;
      v110.columns[2] = v93;
      *(double *)v57.i64 = UMMul(v110, v114);
      simd_float4 v98 = v58;
      simd_float4 v102 = v57;
      simd_float4 v90 = v60;
      simd_float4 v94 = v59;
      v57.f32[0] = v41 + -90.0;
      *(double *)v61.i64 = UMFloat4x4MakeRotateZ(v57.f32[0] * -0.017453);
      v115.columns[0] = v61;
      v115.columns[1] = v62;
      v115.columns[2] = v63;
      v115.columns[3] = v64;
      v111.columns[1] = v98;
      v111.columns[0] = v102;
      v111.columns[3] = v90;
      v111.columns[2] = v94;
      *(double *)v65.i64 = UMMul(v111, v115);
      simd_float4 v99 = v66;
      simd_float4 v103 = v65;
      simd_float4 v91 = v68;
      simd_float4 v95 = v67;
      *(double *)v69.i64 = UMFloat4x4MakeRotateX(-0.40911);
      v116.columns[0] = v69;
      v116.columns[1] = v70;
      v116.columns[2] = v71;
      v116.columns[3] = v72;
      v112.columns[1] = v99;
      v112.columns[0] = v103;
      v112.columns[3] = v91;
      v112.columns[2] = v95;
      *(double *)v73.i64 = UMMul(v112, v116);
      simd_float4 v100 = v74;
      simd_float4 v104 = v73;
      simd_float4 v92 = v76;
      simd_float4 v96 = v75;
      v73.f32[0] = v45 * v47;
      *(double *)v77.i64 = UMFloat4x4MakeRotateZ(v73.f32[0] * -0.017453);
      v117.columns[0] = v77;
      v117.columns[1] = v78;
      v117.columns[2] = v79;
      v117.columns[3] = v80;
      v113.columns[1] = v100;
      v113.columns[0] = v104;
      v113.columns[3] = v92;
      v113.columns[2] = v96;
      *(double *)v81.i64 = UMMul(v113, v117);
      double v85 = UMMul(v81, v82, v83, v84, (float32x4_t)xmmword_21E8F1DE0);
      v104.i32[2] = v86;
      float v87 = atan2f(*((float *)&v85 + 1), *(float *)&v85);
      float v88 = 3.14159265 - *a4;
      v100.f32[0] = v88;
      *(float *)&double v45 = v87 - v88;
      *a5 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(acosf(v104.f32[2])), v100.u32[0]);
      float *v105 = *(float *)&v45;
    }
  }
}

void NUNIComputeSpheroidParentPosition(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = a1;
    uint64_t v5 = [v4 parent];
    NUNIComputeSpheroidParentPosition(v5, v3);

    int v9 = 0;
    float v10 = 0.0;
    NUNIComputeSpheroidTransformParameters(v4, v3, &v11, &v10, &v7, (float *)&v9, &v8, 1);

    float v6 = v10;
    [v4 distanceScale];

    __sincosf_stret(v6);
  }
}

__n128 NUNIComputeCameraView(uint64_t a1, uint64_t a2, float a3)
{
  float v3 = -*(float *)&a2;
  if (a1 == 4) {
    float v3 = 180.0 - *(float *)&a2;
  }
  if (a1 == 3) {
    float v3 = -90.0 - *(float *)&a2;
  }
  float v4 = COERCE_FLOAT(HIDWORD(a2) ^ 0x80000000) * 3.14159265 / 180.0;
  float v5 = v3 * 3.14159265 / 180.0 - a3 + 0.0;
  __float2 v6 = __sincosf_stret(v4);
  __float2 v7 = __sincosf_stret(v5);
  result.n128_u64[0] = (unint64_t)vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v7.__sinval), LODWORD(v7.__cosval)), v6.__cosval);
  result.n128_u32[2] = LODWORD(v6.__sinval);
  return result;
}

uint64_t NUNIComputeSpheroidIdealHomeCoordinate(uint64_t a1, float a2, float a3)
{
  float v3 = a2 + a3;
  if (a1 == 1 || !a1 && (a2 > 1.5708 || a2 < -1.5708)) {
    float v4 = 216.0;
  }
  else {
    float v4 = 144.0;
  }
  return COERCE_UNSIGNED_INT((float)(v4 + (float)(v3 * -57.296)) + (float)(floorf((float)(v4 + (float)(v3 * -57.296)) / 360.0)
                                                                         * -360.0)) | 0x41A0000000000000;
}

void sub_21E8B6A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id _NUNCalliopeCreateTexture(void *a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  id v11 = a1;
  if (a5)
  {
    float32x4_t v12 = objc_opt_new();
    [v12 setTextureType:2];
    [v12 setWidth:a2];
    [v12 setHeight:a3];
    [v12 setDepth:1];
    [v12 setPixelFormat:a5];
    if (a6) {
      uint64_t v13 = 7;
    }
    else {
      uint64_t v13 = 5;
    }
    [v12 setUsage:v13];
    [v12 setResourceOptions:32];
    if (a4 >= 2) {
      [v12 setMipmapLevelCount:a4];
    }
    uint64_t v14 = (void *)[v11 newTextureWithDescriptor:v12];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      uint64_t v17 = NUNILoggingObjectForDomain(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        _NUNCalliopeCreateTexture_cold_1(v17);
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void _NUNICalliopeRenderer_ComputeProjectedSpheroid(float a1)
{
}

uint64_t _NUNICalliopeRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2) {
    return 1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void __destructor_8_s0_AB8s32n16_S_s8_AE(id *a1)
{
  v1 = a1 + 1;

  for (uint64_t i = 0; i != 64; i += 4)
}

void sub_21E8BC0F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  float v2 = *(void **)(a1 + 24);
}

id NUNIImageNamed(void *a1)
{
  v1 = (void *)MEMORY[0x263EFD1F0];
  id v2 = a1;
  float v3 = [v1 sharedRenderingContext];
  float v4 = [v3 device];

  float v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __float2 v6 = CLKUIImageNamedFromBundleForDevice();

  return v6;
}

id NUNILocalizedString(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  float v3 = [v1 bundleForClass:objc_opt_class()];
  float v4 = [v3 localizedStringForKey:v2 value:&stru_26CFE0548 table:@"Localizable"];

  return v4;
}

uint64_t NUNIMoonTotalPhaseNumbers()
{
  return 112;
}

id NUNIMoonImageForPhaseNumber(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 <= 7 && ((0x9Fu >> a3) & 1) != 0)
  {
    if (*MEMORY[0x263EFCF20] != a3)
    {
      float v5 = off_2644CDE60[a3];
      goto LABEL_8;
    }
  }
  else if (*MEMORY[0x263EFCF20] != a3)
  {
    float v4 = 0;
    goto LABEL_11;
  }
  float v5 = @"VictoryNTK";
LABEL_8:
  __float2 v6 = [NSString stringWithFormat:@"%@Moon_%02d", v5, a1];
  __float2 v7 = NUNIImageNamed(v6);
  float v4 = v7;
  if (a2 == 1)
  {
    uint64_t v8 = ___SouthernHemisphereImage_block_invoke((int)v7, v7);

    float v4 = (void *)v8;
  }

LABEL_11:
  return v4;
}

id NUNIRenderedMoonImage(unint64_t a1, void *a2, void *a3, uint64_t a4, CGFloat a5)
{
  double v8 = (double)a1 / 112.0;
  double v9 = a5 * 0.5;
  float v10 = (void *)MEMORY[0x263F157E8];
  id v11 = a3;
  id v12 = a2;
  uint64_t v13 = [v10 layer];
  uint64_t v14 = [MEMORY[0x263F15880] layer];
  [v13 setMasksToBounds:1];
  [v13 addSublayer:v14];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, a5, a5);
  [v13 setCornerRadius:v9];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, a5, a5);
  double v15 = v8 + -0.5;
  if (v8 >= 0.5)
  {
    double v16 = 0.0;
  }
  else
  {
    double v15 = v8;
    double v16 = a5;
  }
  long double v17 = cos((v15 + v15) * 3.14159265);
  Mutable = CGPathCreateMutable();
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v9, v9);
  CGAffineTransform v26 = m;
  CGAffineTransformScale(&v27, &v26, v17, 1.0);
  CGAffineTransform m = v27;
  CGPathMoveToPoint(Mutable, 0, v16, 0.0);
  CGPathAddArc(Mutable, &m, 0.0, 0.0, v9, -1.57079633, 1.57079633, 0);
  CGPathAddLineToPoint(Mutable, 0, v16, a5);
  [v14 setPath:Mutable];
  id v19 = v12;
  uint64_t v20 = [v19 CGColor];

  [v14 setFillColor:v20];
  id v21 = v11;
  uint64_t v22 = [v21 CGColor];

  [v13 setBackgroundColor:v22];
  v30.width = a5;
  v30.height = a5;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  [v13 renderInContext:UIGraphicsGetCurrentContext()];
  float v23 = UIGraphicsGetImageFromCurrentImageContext();
  int32x2_t v24 = [v23 imageWithRenderingMode:a4];

  UIGraphicsEndImageContext();
  CGPathRelease(Mutable);

  return v24;
}

uint64_t NUNIMoonPhaseNumber(void *a1, double a2, double a3)
{
  float v5 = (objc_class *)MEMORY[0x263F41738];
  id v6 = a1;
  __float2 v7 = objc_msgSend([v5 alloc], "initWithLocation:date:body:", v6, 4, a2, a3);

  NUNIMoonPhaseAngleFromEphemeris(v7);
  unint64_t v9 = vcvtmd_u64_f64((v8 + 180.0) / 360.0 * 112.0 + 0.5);
  uint64_t v10 = v9 - 112 * (((v9 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64);

  return v10;
}

void NUNIMoonPhaseAngleFromEphemeris(void *a1)
{
  id v1 = a1;
  [v1 parallacticAngle];
  [v1 phaseAngle];
}

id NUNIMoonPhaseDescriptionUnknown()
{
  return NUNILocalizedString(@"MOONPHASE_UNKNOWN");
}

uint64_t NUNIMoonPhaseFor(void *a1, void *a2, double a3, double a4)
{
  __float2 v7 = (void *)MEMORY[0x263EFF8F0];
  id v8 = a2;
  id v9 = a1;
  uint64_t v10 = [v7 currentCalendar];
  [v10 setTimeZone:v8];

  id v11 = [v10 startOfDayForDate:v9];
  uint64_t v12 = 1;
  uint64_t v13 = [v10 dateByAddingUnit:16 value:1 toDate:v9 options:0];

  uint64_t v14 = [v10 startOfDayForDate:v13];

  double v15 = objc_msgSend(objc_alloc(MEMORY[0x263F41738]), "initWithLocation:date:body:", v11, 4, a3, a4);
  double v16 = objc_msgSend(objc_alloc(MEMORY[0x263F41738]), "initWithLocation:date:body:", v14, 4, a3, a4);
  NUNIMoonPhaseAngleFromEphemeris(v15);
  double v18 = v17;
  NUNIMoonPhaseAngleFromEphemeris(v16);
  if (v18 <= 0.0 || v19 >= 0.0)
  {
    if (v18 >= -90.0 || v19 <= -90.0)
    {
      if (v18 >= 0.0 || v19 <= 0.0)
      {
        uint64_t v20 = 4;
        if (v18 < -90.0) {
          uint64_t v20 = 2;
        }
        uint64_t v21 = 8;
        if (v18 < 90.0) {
          uint64_t v21 = 6;
        }
        uint64_t v22 = 7;
        if (v18 >= 90.0 || v19 <= 90.0) {
          uint64_t v22 = v20;
        }
        if (v18 < 0.0 || v18 < -90.0 || v18 < 90.0 && v19 > 90.0) {
          uint64_t v12 = v22;
        }
        else {
          uint64_t v12 = v21;
        }
      }
      else
      {
        uint64_t v12 = 5;
      }
    }
    else
    {
      uint64_t v12 = 3;
    }
  }

  return v12;
}

id NUNIMoonPhaseDescription(void *a1, void *a2, double a3, double a4)
{
  float v4 = off_2644CDEA0[NUNIMoonPhaseFor(a1, a2, a3, a4) - 1];
  return NUNILocalizedString(v4);
}

void NUNIAstronomyVistaController_ApplyStyleDefinition(float32x2_t *a1, uint64_t a2, void *a3)
{
  double v4 = *(double *)&a1[1];
  id v5 = a3;
  [v5 setCameraOffset:v4];
  LODWORD(v6) = a1->i32[0];
  [v5 setCameraOrbit:v6];
  __asm { FMOV            V1.2D, #-15.0 }
  objc_msgSend(v5, "setOffsetCoordinate:", COERCE_DOUBLE(*(void *)&vmulq_f64(vcvtq_f64_f32(a1[16]), _Q1).f64[1]));
  id v14 = [v5 spheroidOfType:3];

  uint64_t v13 = v14;
  if (v14)
  {
    LODWORD(v12) = a1[3].i32[0];
    [v14 setCloudOpacity:v12];
    uint64_t v13 = v14;
  }
}

void sub_21E8BFC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E8BFCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5 = 1.0 - a3;
  float32x4_t v6 = vsubq_f32(a1, a2);
  int8x16_t v7 = (int8x16_t)vmulq_f32(v6, v6);
  float32x4_t v8 = vaddq_f32(a1, a2);
  int8x16_t v9 = (int8x16_t)vmulq_f32(v8, v8);
  float v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  float v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0) {
    sinf(v11);
  }
  if ((float)(v5 * v11) != 0.0) {
    sinf(v5 * v11);
  }
  float v12 = v11 * a3;
  if (v12 != 0.0) {
    sinf(v12);
  }
}

id NUNILoggingObjectForDomain(uint64_t a1)
{
  if (NUNILoggingObjectForDomain_onceToken != -1) {
    dispatch_once(&NUNILoggingObjectForDomain_onceToken, &__block_literal_global_1);
  }
  id v2 = (void *)NUNILoggingObjectForDomain___logObjects;
  float v3 = [NSNumber numberWithInteger:a1];
  double v4 = [v2 objectForKey:v3];

  return v4;
}

void __NUNILoggingObjectForDomain_block_invoke()
{
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  os_log_t v1 = os_log_create("com.apple.NanoUniverse", "nanouniverse");
  if (v1)
  {
    id v2 = [NSNumber numberWithInteger:0];
    [v0 setObject:v1 forKey:v2];
  }
  float v3 = (void *)NUNILoggingObjectForDomain___logObjects;
  NUNILoggingObjectForDomain___logObjects = (uint64_t)v0;
}

double _LayoutConstants(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  float v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_LayoutConstants___cachedDevice, v1);
    _LayoutConstants___previousCLKDeviceVersion = [v1 version];

    ___LayoutConstants_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _LayoutConstants___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  double v9 = *(double *)&_LayoutConstants_constants_0;

  return v9;
}

uint64_t _NUNIClassicRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2) {
    return 1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

id NUNILoadMtlTextureFromMemory(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F32110];
  id v7 = [v5 path];
  uint64_t v8 = [v6 atlasBackingWithBytes:a1 length:a2 mmapFile:v5 uuid:v7];

  if (v8)
  {
    id v9 = v8;
    kdebug_trace();
    [v9 structure];
    [MEMORY[0x263F32148] sharedDevice];
    objc_claimAutoreleasedReturnValue();
    NUNILoadMtlTextureFromMemory_cold_2();
  }
  float v10 = NUNILoggingObjectForDomain(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    NUNILoadMtlTextureFromMemory_cold_1((uint64_t)v5, v10);
  }

  return 0;
}

void __destructor_8_AB0s8n4_s0_AE_s32_s40(uint64_t a1)
{
  for (uint64_t i = 0; i != 32; i += 8)

  float v3 = *(void **)(a1 + 40);
}

uint64_t _NTKCreateHalfOctahedron(void *a1, float a2)
{
  id v65 = a1;
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:10016];
  float v3 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:3456];
  id v64 = v2;
  uint64_t v4 = [v64 mutableBytes];
  id v63 = v3;
  uint64_t v5 = [v63 mutableBytes];
  v6.f32[0] = atan2f(a2, 0.0);
  float v7 = a2;
  int v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  float v14 = 1.0;
  v15.i64[0] = LODWORD(a2);
  v15.i32[2] = 0;
  v15.i32[3] = 1.0;
  uint64_t v16 = COERCE_UNSIGNED_INT(fminf(fmaxf((float)(v6.f32[0] + 3.1416) / 6.2832, 0.0), 1.0)) | 0x3F00000000000000;
  *(float32x4_t *)uint64_t v4 = v15;
  *(void *)(v4 + 16) = v16;
  uint64_t v67 = v5;
  uint64_t v68 = v4;
  *(void *)(v4 + 24) = 0;
  uint64_t v17 = 2;
  uint64_t v18 = 1;
  uint64_t v19 = 1;
  uint64_t v66 = v5 + 6;
  do
  {
    uint64_t v72 = v12;
    int v74 = v8;
    uint64_t v20 = 0;
    uint64_t v21 = v19;
    float v22 = (float)(v17 - 1) / 12.0;
    uint64_t v70 = v11;
    uint64_t v23 = 32 * v19;
    uint64_t v24 = v11 + 32 * v19;
    v6.f32[0] = (float)(v14 - v22) * v7;
    float32x4_t v86 = v6;
    uint64_t v71 = v10;
    uint64_t v25 = v10 + 32 * v19;
    uint64_t v73 = v9;
    uint64_t v26 = v9 + 32 * v19;
    uint64_t v75 = v18;
    do
    {
      CGAffineTransform v27 = (float32x4_t *)(v68 + v23);
      float v28 = (float)(int)v20 / (float)((float)(int)v17 + -1.0);
      float v29 = v14 - v28;
      float32_t v80 = v22 * (float)(v14 - v28);
      float32x4_t v30 = v86;
      v30.f32[1] = v80;
      *(float *)&uint64_t v16 = v22 * v28;
      v30.i32[2] = v16;
      v15.f32[0] = sqrtf((float)((float)(v80 * v80) + (float)(v86.f32[0] * v86.f32[0]))+ (float)(*(float *)&v16 * *(float *)&v16));
      float32x4_t v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0);
      uint64_t v84 = v16;
      float32x4_t v79 = vdivq_f32(v30, v82);
      float v77 = fminf(fmaxf((float)(atan2f(v79.f32[0], v79.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      float v31 = acosf(v79.f32[2]);
      float32x4_t v32 = v79;
      v32.i32[3] = 1.0;
      *(float *)&uint64_t v33 = v77;
      *((float *)&v33 + 1) = v31 / 3.1416;
      *CGAffineTransform v27 = v32;
      v27[1].i64[0] = v33;
      v27[1].i64[1] = 0;
      float32x4_t v34 = v86;
      v34.f32[1] = -(float)(v22 * v28);
      float v35 = (float32x4_t *)(v68 + v24);
      v34.f32[2] = v80;
      int32x2_t v36 = (int32x2_t)v84;
      *(float *)v36.i32 = sqrtf((float)((float)(*(float *)v36.i32 * *(float *)v36.i32) + (float)(v86.f32[0] * v86.f32[0]))+ (float)(v34.f32[2] * v34.f32[2]));
      float32x4_t v81 = (float32x4_t)vdupq_lane_s32(v36, 0);
      float32x4_t v78 = vdivq_f32(v34, v81);
      float v76 = fminf(fmaxf((float)(atan2f(v78.f32[0], v78.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      float v37 = acosf(v78.f32[2]);
      float32x4_t v38 = v78;
      v38.i32[3] = 1.0;
      *(float *)&uint64_t v39 = v76;
      *((float *)&v39 + 1) = v37 / 3.1416;
      v35[2] = v38;
      v35[3].i64[0] = v39;
      v35[3].i64[1] = 0;
      float32x4_t v40 = v86;
      v40.f32[1] = -(float)(v22 * v29);
      double v41 = (float32x4_t *)(v68 + v25);
      v40.f32[2] = -(float)(v22 * v28);
      float32x4_t v83 = vdivq_f32(v40, v82);
      v79.i32[0] = fminf(fmaxf((float)(atan2f(v83.f32[0], v83.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      float v42 = acosf(v83.f32[2]);
      float32x4_t v43 = v83;
      v43.i32[3] = 1.0;
      LODWORD(v44) = v79.i32[0];
      *((float *)&v44 + 1) = v42 / 3.1416;
      v41[4] = v43;
      v41[5].i64[0] = v44;
      v41[5].i64[1] = 0;
      float32x4_t v45 = v86;
      v45.i32[1] = v84;
      double v46 = (float32x4_t *)(v68 + v26);
      v45.f32[2] = -(float)(v22 * v29);
      float32x4_t v85 = vdivq_f32(v45, v81);
      v83.i32[0] = fminf(fmaxf((float)(atan2f(v85.f32[0], v85.f32[1]) + 3.1416) / 6.2832, 0.0), 1.0);
      v6.f32[0] = acosf(v85.f32[2]);
      float v14 = 1.0;
      LODWORD(v16) = v83.i32[0];
      float32x4_t v15 = v85;
      v15.i32[3] = 1.0;
      *((float *)&v16 + 1) = v6.f32[0] / 3.1416;
      v46[6] = v15;
      ++v20;
      v23 += 32;
      v46[7].i64[0] = v16;
      v46[7].i64[1] = 0;
      v24 += 32;
      v25 += 32;
      v26 += 32;
    }
    while (v75 != v20);
    int v47 = 0;
    int v48 = 0;
    int v49 = 0;
    int v50 = 4 * v17 - 8;
    __int16 v51 = v21;
    float v7 = a2;
    do
    {
      int v52 = 0;
      uint64_t v53 = 3 * v13;
      unint64_t v54 = v67 + 6 * (2 * (v17 - 1) - 1) + 6 * v13++;
      for (uint64_t i = (_WORD *)(v66 + 2 * v53); ; i += 6)
      {
        if (v17 == 2)
        {
          LOWORD(v56) = 0;
          LOWORD(v57) = 0;
        }
        else
        {
          int v56 = v21 - v50 + (v48 + v52) % v50;
          int v57 = (unsigned __int16)v21 - v50 + (v48 + v52 + 1) % v50;
        }
        int v58 = (v47 + v52 + 1) % (4 * ((int)v17 - 1)) + v21;
        *(i - 3) = v51 + v52;
        if (a2 >= 0.0) {
          break;
        }
        *(i - 2) = v58;
        *(i - 1) = v56;
        if ((unint64_t)i >= v54) {
          goto LABEL_15;
        }
LABEL_14:
        *uint64_t i = v56;
        i[1] = v58;
        v13 += 2;
        i[2] = v57;
        ++v52;
      }
      *(i - 2) = v56;
      *(i - 1) = v58;
      if ((unint64_t)i < v54)
      {
        LOWORD(v58) = v57;
        LOWORD(v57) = (v47 + v52 + 1) % (4 * ((int)v17 - 1)) + v21;
        goto LABEL_14;
      }
LABEL_15:
      ++v49;
      v48 += v74;
      v51 += v75;
      v47 += v75;
    }
    while (v49 != 4);
    uint64_t v19 = v21 + v72 + v20 + 3;
    ++v17;
    uint64_t v18 = v75 + 1;
    uint64_t v12 = v72 + 3;
    uint64_t v11 = v70 + 32;
    uint64_t v10 = v71 + 64;
    uint64_t v9 = v73 + 96;
    int v8 = v74 + 1;
  }
  while (v17 != 14);
  if (v21 + v12 + v20 != 313)
  {
    simd_float4 v59 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E8AA000, v59, OS_LOG_TYPE_DEFAULT, "v not at right position", buf, 2u);
    }
  }
  if (v13 != 576)
  {
    simd_float4 v60 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v87 = 0;
      _os_log_impl(&dword_21E8AA000, v60, OS_LOG_TYPE_DEFAULT, "t not at right position", v87, 2u);
    }
  }
  unsigned int v61 = objc_msgSend(v65, "addIndices:count:vbase:", v67, 1728, objc_msgSend(v65, "addVertices:count:", v68, 313));

  return v61 | 0x6C000000000;
}

void sub_21E8C55F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUNIBundle()
{
  if (NUNIBundle_onceToken != -1) {
    dispatch_once(&NUNIBundle_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)NUNIBundle___bundle;
  return v0;
}

uint64_t __NUNIBundle_block_invoke()
{
  NUNIBundle___bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void sub_21E8C739C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E8C747C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

float UMMul(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  return (float)((float)((float)(a4 * a8) - (float)(a1 * a5)) - (float)(a2 * a6)) - (float)(a3 * a7);
}

__n64 UMFloat4x4Make(float a1, float a2, float a3, float a4)
{
  float v4 = (float)(a1 * (float)(a2 + a2)) + (float)(a4 * (float)(a3 + a3));
  result.n64_f32[0] = 1.0 - (float)((float)(a2 * (float)(a2 + a2)) + (float)(a3 * (float)(a3 + a3)));
  result.n64_f32[1] = v4;
  return result;
}

__n64 UMFloat4x4Make(simd_quatf a1)
{
  return UMFloat4x4Make(a1.vector.f32[0], a1.vector.f32[1], a1.vector.f32[2], a1.vector.f32[3]);
}

float UMFloat4x4MakeOrtho(float a1, float a2, float a3, float a4, float a5, float a6)
{
  float result = (float)(1.0 / (float)(a2 - a1)) + (float)(1.0 / (float)(a2 - a1));
  __asm { FMOV            V3.4S, #1.0 }
  return result;
}

float UMFloat4x4MakePerspective(float a1, float a2, float a3, float a4)
{
  __float2 v5 = __sincosf_stret(a1 * 0.0087266);
  return (float)(v5.__cosval / v5.__sinval) / a2;
}

__n64 UMFloat4x4MakeLookAt(double a1, float a2)
{
  result.n64_f32[1] = a2;
  return result;
}

double UMTranslate(float32x4_t a1, double a2, double a3, float32x4_t a4, float a5)
{
  *(void *)&double result = vmlaq_n_f32(a1, a4, a5).u64[0];
  return result;
}

double UMFloat4x4MakeTranslate()
{
  return *(double *)&_PromotedConst_0;
}

BOOL UMFloat4x4Equal(simd_float4x4 a1, simd_float4x4 a2)
{
  simd_float4x4 v7 = a1;
  v6[0] = a2.columns[1];
  v6[1] = a2.columns[2];
  v6[2] = a2.columns[3];
  if ((vminvq_u32((uint32x4_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0])) & 0x80000000) == 0) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t v4 = v3;
    if (v3 == 3) {
      break;
    }
    unsigned int v5 = vminvq_u32((uint32x4_t)vceqq_f32((float32x4_t)v7.columns[v3 + 1], (float32x4_t)v6[v3]));
    ++v3;
  }
  while ((v5 & 0x80000000) != 0);
  return v4 > 2;
}

double UMMul(simd_float4x4 a1, simd_float4x4 a2)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)a1.columns[1], *(float32x2_t *)a2.columns[0].f32, 1), (float32x4_t)a1.columns[0], a2.columns[0].f32[0]), (float32x4_t)a1.columns[2], (float32x4_t)a2.columns[0], 2), (float32x4_t)a1.columns[3], (float32x4_t)a2.columns[0], 3).u64[0];
  return result;
}

double UMMul(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(a2, *(float32x2_t *)a5.f32, 1), a1, a5.f32[0]), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

float UMQuaternionMake(float a1, float a2, float a3)
{
  __float2 v5 = __sincosf_stret(a1 * 0.5);
  __float2 v6 = __sincosf_stret(a2 * 0.5);
  __float2 v7 = __sincosf_stret(a3 * 0.5);
  return (float)(v5.__sinval * (float)(v6.__cosval * v7.__cosval))
       - (float)((float)(v6.__sinval * v7.__sinval) * v5.__cosval);
}

double UMFloat4x4MakeRotateX(float a1)
{
  return *(double *)&_PromotedConst_1;
}

double UMFloat4x4MakeRotateZ(float a1)
{
  __float2 v1 = __sincosf_stret(a1);
  *(float *)&double v2 = v1.__cosval;
  *((float *)&v2 + 1) = -v1.__sinval;
  return v2;
}

float UMSlerp(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9)
{
  float v18 = a9;
  if (a9 <= 0.0) {
    return a1;
  }
  float v19 = a5;
  if (a9 < 1.0)
  {
    float v20 = (float)((float)((float)(a2 * a6) + (float)(a1 * a5)) + (float)(a3 * a7)) + (float)(a4 * a8);
    if (v20 < 0.0)
    {
      float v19 = -a5;
      float v20 = -v20;
    }
    if (v20 <= 0.999)
    {
      float v22 = sqrtf(1.0 - (float)(v20 * v20));
      float v25 = atan2f(v22, v20);
      float v26 = 1.0 / v22;
      float v23 = (1.0 - a9) * v25;
      float v21 = (float)(1.0 / v22) * sinf(v23);
      float v18 = v26 * sinf(v25 * a9);
    }
    else
    {
      float v21 = 1.0 - a9;
    }
    return (float)(v19 * v18) + (float)(v21 * a1);
  }
  return v19;
}

float UMQuaternionMake(int32x4_t a1, int32x4_t a2, float32x4_t a3)
{
  float v3 = (float)((float)(*(float *)a1.i32 + *(float *)&a2.i32[1]) + a3.f32[2]) + 1.0;
  if (v3 <= 0.0001)
  {
    if (*(float *)a1.i32 <= *(float *)&a2.i32[1] || *(float *)a1.i32 <= a3.f32[2])
    {
      if (*(float *)&a2.i32[1] <= a3.f32[2])
      {
        float v10 = 0.5 / sqrtf((float)((float)(a3.f32[2] + 1.0) - *(float *)a1.i32) - *(float *)&a2.i32[1]);
        float v6 = v10 * vaddq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
        float v7 = vmuls_lane_f32(v10, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
        float v8 = 0.25 / v10;
        unsigned __int32 v11 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).u32[0];
      }
      else
      {
        float v10 = 0.5 / sqrtf((float)((float)(*(float *)&a2.i32[1] + 1.0) - *(float *)a1.i32) - a3.f32[2]);
        float v6 = v10 * vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).f32[0];
        float v7 = 0.25 / v10;
        float v8 = vmuls_lane_f32(v10, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
        unsigned __int32 v11 = vsubq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).u32[0];
      }
      float v5 = v10 * *(float *)&v11;
    }
    else
    {
      float v12 = 0.5 / sqrtf((float)((float)(*(float *)a1.i32 + 1.0) - *(float *)&a2.i32[1]) - a3.f32[2]);
      float v6 = 0.25 / v12;
      float v7 = v12 * vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a2).f32[0];
      float v8 = v12 * vaddq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
      float v5 = vmuls_lane_f32(v12, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a2, 2), a3), 1);
    }
  }
  else
  {
    float v4 = 0.5 / sqrtf(v3);
    float v5 = 0.25 / v4;
    float v6 = vmuls_lane_f32(v4, (float32x2_t)*(_OWORD *)&vsubq_f32(a3, (float32x4_t)vdupq_laneq_s32(a2, 2)), 1);
    float v7 = v4 * vsubq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), a3).f32[0];
    float v8 = v4 * vsubq_f32((float32x4_t)a2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1)).f32[0];
  }
  return v6 / sqrtf((float)((float)((float)(v7 * v7) + (float)(v6 * v6)) + (float)(v8 * v8)) + (float)(v5 * v5));
}

id _NUNAegirCreateTexture(void *a1, int a2, int a3, int a4, uint64_t a5)
{
  id v9 = a1;
  if (a5)
  {
    float v10 = objc_opt_new();
    [v10 setTextureType:2];
    [v10 setWidth:a2];
    [v10 setHeight:a3];
    [v10 setDepth:1];
    [v10 setPixelFormat:a5];
    [v10 setUsage:5];
    [v10 setResourceOptions:32];
    if (a4 >= 2) {
      [v10 setMipmapLevelCount:a4];
    }
    unsigned __int32 v11 = (void *)[v9 newTextureWithDescriptor:v10];
    float v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      float v14 = NUNILoggingObjectForDomain(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        _NUNCalliopeCreateTexture_cold_1(v14);
      }
    }
  }
  else
  {
    float v12 = 0;
  }

  return v12;
}

uint64_t _NUNIAegirRenderCompareObject(float *a1, float *a2)
{
  if (*a1 < *a2) {
    return 1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

double NUNIAstronomyAddLocationCoordinates(double a1, double a2, double a3)
{
  return a1 + a3;
}

float NUNIAstronomyClampLatitude(float a1)
{
  float result = 80.0;
  if (a1 <= 80.0)
  {
    float result = a1;
    if (a1 < -80.0) {
      return -80.0;
    }
  }
  return result;
}

double _NTKAstronomyNormalizeCoordinateForRotationAroundCoordinate(double result, double a2, double a3, double a4)
{
  for (; a2 > a4 + 180.0; a2 = a2 + -360.0)
    ;
  for (double i = a4 + -180.0; a2 < i; a2 = a2 + 360.0)
    ;
  for (; result > a3 + 180.0; float result = result + -360.0)
    ;
  for (j = a3 + -180.0; result < j; float result = result + 360.0)
    ;
  return result;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21E8CBBCC(uint64_t a1)
{
  return sub_21E8CBCFC(a1, qword_26AD34308);
}

uint64_t static Logger.cloud.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8CBD98(&qword_26AD34320, (uint64_t)qword_26AD34308, a1);
}

uint64_t sub_21E8CBC14(uint64_t a1)
{
  return sub_21E8CBCFC(a1, qword_267D47DE8);
}

uint64_t static Logger.data.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8CBD98(&qword_267D47DE0, (uint64_t)qword_267D47DE8, a1);
}

uint64_t sub_21E8CBC50(uint64_t a1)
{
  return sub_21E8CBCFC(a1, qword_267D47E08);
}

uint64_t static Logger.editing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8CBD98(&qword_267D47E00, (uint64_t)qword_267D47E08, a1);
}

uint64_t sub_21E8CBC94(uint64_t a1)
{
  return sub_21E8CBCFC(a1, qword_26AD34588);
}

uint64_t static Logger.rendering.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8CBD98(&qword_26AD34560, (uint64_t)qword_26AD34588, a1);
}

uint64_t sub_21E8CBCDC(uint64_t a1)
{
  return sub_21E8CBCFC(a1, qword_26AD34568);
}

uint64_t sub_21E8CBCFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21E8EE570();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21E8EE560();
}

uint64_t static Logger.snapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8CBD98(&qword_26AD34580, (uint64_t)qword_26AD34568, a1);
}

uint64_t sub_21E8CBD98@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21E8EE570();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  float v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_21E8CBE30(uint64_t a1, uint64_t a2)
{
  return sub_21E8CBF28(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21E8CBE48()
{
  sub_21E8EE9F0();
  sub_21E8EEA10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8CBE9C()
{
  sub_21E8EE9F0();
  sub_21E8EEDC0();
  sub_21E8EEA10();
  uint64_t v0 = sub_21E8EEDE0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21E8CBF10(uint64_t a1, uint64_t a2)
{
  return sub_21E8CBF28(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_21E8CBF28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21E8EE9F0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21E8CBF6C(uint64_t a1, id *a2)
{
  uint64_t result = sub_21E8EE9D0();
  *a2 = 0;
  return result;
}

uint64_t sub_21E8CBFE4(uint64_t a1, id *a2)
{
  char v3 = sub_21E8EE9E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21E8CC064@<X0>(uint64_t *a1@<X8>)
{
  sub_21E8EE9F0();
  uint64_t v2 = sub_21E8EE9C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21E8CC0A8()
{
  uint64_t v0 = sub_21E8EE9F0();
  uint64_t v2 = v1;
  if (v0 == sub_21E8EE9F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21E8EED40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21E8CC134@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21E8EE9C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21E8CC17C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21E8EE9F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_267D47F00)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D47F00);
    }
  }
}

uint64_t sub_21E8CC200(uint64_t a1)
{
  uint64_t v2 = sub_21E8CC334(&qword_267D47F20);
  uint64_t v3 = sub_21E8CC334(&qword_267D47F28);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_21E8CC298()
{
  return sub_21E8CC334(&qword_267D47F08);
}

uint64_t sub_21E8CC2CC()
{
  return sub_21E8CC334(&qword_267D47F10);
}

uint64_t sub_21E8CC300()
{
  return sub_21E8CC334(&qword_267D47F18);
}

uint64_t sub_21E8CC334(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_21E8CC378()
{
  id result = objc_msgSend(self, sel_standardUserDefaults);
  qword_26AD34798 = (uint64_t)result;
  return result;
}

char *sub_21E8CC3B4()
{
  if (qword_26AD34350 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD34798;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E90FCB0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000021E9118E0;
  *(void *)(inited + 48) = 0x4043000000000000;
  *(void *)(inited + 56) = 0xD000000000000012;
  *(void *)(inited + 64) = 0x800000021E911900;
  *(void *)(inited + 72) = 0x4034000000000000;
  *(void *)(inited + 80) = 0xD000000000000013;
  *(void *)(inited + 88) = 0x800000021E911920;
  *(void *)(inited + 96) = 0x4042800000000000;
  *(void *)(inited + 104) = 0xD000000000000010;
  *(void *)(inited + 112) = 0x800000021E911940;
  *(void *)(inited + 120) = 0x4000000000000000;
  *(void *)(inited + 128) = 0xD000000000000018;
  *(void *)(inited + 136) = 0x800000021E911960;
  *(void *)(inited + 144) = 0x401C000000000000;
  *(void *)(inited + 152) = 0xD000000000000017;
  *(void *)(inited + 160) = 0x800000021E911980;
  *(void *)(inited + 168) = 0x4039000000000000;
  strcpy((char *)(inited + 176), "AegirSunExpMin");
  *(unsigned char *)(inited + 191) = -18;
  *(void *)(inited + 192) = 0x4049000000000000;
  *(void *)(inited + 200) = 0xD000000000000010;
  *(void *)(inited + 208) = 0x800000021E9119C0;
  *(void *)(inited + 216) = 0x4055800000000000;
  *(void *)(inited + 224) = 0xD000000000000012;
  *(void *)(inited + 232) = 0x800000021E9119E0;
  *(void *)(inited + 240) = 0x4050800000000000;
  *(void *)(inited + 248) = 0xD000000000000011;
  *(void *)(inited + 256) = 0x800000021E911A00;
  *(void *)(inited + 264) = 0x4045800000000000;
  *(void *)(inited + 272) = 0xD000000000000014;
  *(void *)(inited + 280) = 0x800000021E911A20;
  *(void *)(inited + 288) = 0x4034000000000000;
  *(void *)(inited + 296) = 0xD000000000000017;
  *(void *)(inited + 304) = 0x800000021E911A40;
  *(void *)(inited + 312) = 0x4051000000000000;
  *(void *)(inited + 320) = 0xD00000000000001ALL;
  *(void *)(inited + 328) = 0x800000021E911A60;
  *(void *)(inited + 336) = 0x4032000000000000;
  *(void *)(inited + 344) = 0xD000000000000019;
  *(void *)(inited + 352) = 0x800000021E911A80;
  *(void *)(inited + 360) = 0x4049000000000000;
  *(void *)(inited + 368) = 0xD000000000000020;
  *(void *)(inited + 376) = 0x800000021E911AA0;
  *(void *)(inited + 384) = 0x4018000000000000;
  *(void *)(inited + 392) = 0xD000000000000019;
  *(void *)(inited + 400) = 0x800000021E911AD0;
  *(void *)(inited + 408) = 0x4059000000000000;
  *(void *)(inited + 416) = 0xD00000000000001BLL;
  *(void *)(inited + 424) = 0x800000021E911AF0;
  *(void *)(inited + 432) = 0x4044000000000000;
  *(void *)(inited + 440) = 0xD00000000000001ALL;
  *(void *)(inited + 448) = 0x800000021E911B10;
  *(void *)(inited + 456) = 0;
  *(void *)(inited + 464) = 0xD00000000000001ELL;
  *(void *)(inited + 472) = 0x800000021E911B30;
  *(void *)(inited + 480) = 0x4049000000000000;
  *(void *)(inited + 488) = 0xD00000000000001DLL;
  *(void *)(inited + 496) = 0x800000021E911B50;
  *(void *)(inited + 504) = 0x4052C00000000000;
  *(void *)(inited + 512) = 0xD00000000000001DLL;
  *(void *)(inited + 520) = 0x800000021E911B70;
  *(void *)(inited + 528) = 0;
  *(void *)(inited + 536) = 0xD00000000000001BLL;
  *(void *)(inited + 544) = 0x800000021E911B90;
  *(void *)(inited + 552) = 0x4050000000000000;
  *(void *)(inited + 560) = 0xD00000000000001ELL;
  *(void *)(inited + 568) = 0x800000021E911BB0;
  *(void *)(inited + 576) = 0x4000000000000000;
  *(void *)(inited + 584) = 0xD000000000000014;
  *(void *)(inited + 592) = 0x800000021E911BD0;
  *(void *)(inited + 600) = 0x403E000000000000;
  *(void *)(inited + 608) = 0xD000000000000017;
  *(void *)(inited + 616) = 0x800000021E911BF0;
  *(void *)(inited + 624) = 0x4000000000000000;
  *(void *)(inited + 632) = 0xD000000000000019;
  *(void *)(inited + 640) = 0x800000021E911C10;
  *(void *)(inited + 648) = 0x4046000000000000;
  *(void *)(inited + 656) = 0xD000000000000018;
  *(void *)(inited + 664) = 0x800000021E911C30;
  *(void *)(inited + 672) = 0x4055800000000000;
  *(void *)(inited + 680) = 0xD00000000000001CLL;
  *(void *)(inited + 688) = 0x800000021E911C50;
  *(void *)(inited + 696) = 0x404E000000000000;
  *(void *)(inited + 704) = 0xD00000000000001ELL;
  *(void *)(inited + 712) = 0x800000021E911C70;
  *(void *)(inited + 720) = 0x4049000000000000;
  *(void *)(inited + 728) = 0xD000000000000026;
  *(void *)(inited + 736) = 0x800000021E911C90;
  *(void *)(inited + 744) = 0x403E000000000000;
  *(void *)(inited + 752) = 0xD000000000000024;
  *(void *)(inited + 760) = 0x800000021E911CC0;
  *(void *)(inited + 768) = 0x4049000000000000;
  *(void *)(inited + 776) = 0xD000000000000013;
  *(void *)(inited + 784) = 0x800000021E911CF0;
  *(void *)(inited + 792) = 0x402E000000000000;
  *(void *)(inited + 800) = 0xD000000000000016;
  *(void *)(inited + 808) = 0x800000021E911D10;
  *(void *)(inited + 816) = 0x4051000000000000;
  *(void *)(inited + 824) = 0xD000000000000019;
  *(void *)(inited + 832) = 0x800000021E911D30;
  *(void *)(inited + 840) = 0x4042800000000000;
  *(void *)(inited + 848) = 0xD00000000000001FLL;
  *(void *)(inited + 856) = 0x800000021E911D50;
  *(void *)(inited + 864) = 0x402E000000000000;
  id v2 = v0;
  unint64_t v3 = sub_21E8CD87C(inited);
  id v4 = objc_allocWithZone((Class)type metadata accessor for PreferencePane());
  id result = PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(0xD000000000000014, 0x800000021E9119A0, v0, v3, MEMORY[0x263F8EE80], MEMORY[0x263F8EE80], MEMORY[0x263F8EE80]);
  qword_26AD344B8 = (uint64_t)result;
  return result;
}

id static PreferencePane.aegirRenderingPreferencePane.getter()
{
  if (qword_26AD344D8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD344B8;
  return v0;
}

NSNumber_optional __swiftcall PreferencePane.fractionValue(forOption:)(Swift::String forOption)
{
  double v1 = COERCE_DOUBLE(sub_21E8D06E4(forOption._countAndFlagsBits, (uint64_t)forOption._object));
  if (v2) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = (objc_class *)objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v1 / 100.0);
  }
  result.value.super.super.isa = v3;
  result.is_nil = v2;
  return result;
}

uint64_t AegirAuthentication.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_21E8EE520();
  swift_allocObject();
  *(void *)(v0 + 16) = sub_21E8EE510();
  return v0;
}

uint64_t AegirAuthentication.init()()
{
  sub_21E8EE520();
  swift_allocObject();
  *(void *)(v0 + 16) = sub_21E8EE510();
  return v0;
}

uint64_t sub_21E8CCB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v36 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a7;
  uint64_t v35 = a4;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v30 = a1;
  uint64_t v7 = sub_21E8EE4F0();
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  MEMORY[0x270FA5388](v7, v8);
  float v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21E8EE490();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  float32x4_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21E8EE4D0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  float v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_21E8EE540();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v23);
  float v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v31, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v32, v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E8EE530();
  sub_21E8EE500();
  sub_21E8EE4E0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
  sub_21E8EE380();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
}

uint64_t AegirAuthentication.deinit()
{
  swift_release();
  return v0;
}

uint64_t AegirAuthentication.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21E8CD058(uint64_t result, unsigned char **a2)
{
  Swift::Bool v2 = *a2;
  *Swift::Bool v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21E8CD068(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21E8CD0A4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21E8CD0CC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_21E8CD144(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_21E8EEBF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21E8CD144(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21E8CD218(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21E8CD820((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21E8CD820((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21E8CD218(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21E8EEC00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21E8CD3D4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_21E8EEC80();
  if (!v8)
  {
    sub_21E8EEC90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21E8EECE0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21E8CD3D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21E8CD46C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21E8CD64C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21E8CD64C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E8CD46C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21E8CD5E4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21E8EEC60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21E8EEC90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21E8EEA30();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21E8EECE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21E8EEC90();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21E8CD5E4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21E8CD64C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

unsigned char **sub_21E8CD79C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for AegirAuthentication()
{
  return self;
}

uint64_t method lookup function for AegirAuthentication(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AegirAuthentication);
}

uint64_t dispatch thunk of AegirAuthentication.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AegirAuthentication.addSignature(to:date:url:httpMethod:apiKey:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_21E8CD820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21E8CD87C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34488);
  uint64_t v2 = (void *)sub_21E8EECD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_21E8D18B0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_21E8CD990()
{
  if (qword_26AD34350 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD34798;
  id v1 = (id)qword_26AD34798;
  unint64_t v2 = sub_21E8CD87C((uint64_t)&unk_26CFDE250);
  id v3 = objc_allocWithZone((Class)type metadata accessor for PreferencePane());
  unint64_t result = PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(0xD000000000000014, 0x800000021E9119A0, v0, v2, MEMORY[0x263F8EE80], MEMORY[0x263F8EE80], MEMORY[0x263F8EE80]);
  qword_26AD34338 = (uint64_t)result;
  return result;
}

id static PreferencePane.calliopeRenderingPreferencePane.getter()
{
  if (qword_26AD34340 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD34338;
  return v0;
}

char *PreferencePane.__allocating_init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_21E8CDC24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21E8CDD1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_21E8EE5F0();
}

uint64_t sub_21E8CDD94@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_21E8CDE14(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_21E8EE5F0();
}

void (*sub_21E8CDE94(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21E8EE5D0();
  return sub_21E8CDF20;
}

void sub_21E8CDF20(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_21E8CDF88()
{
  return sub_21E8CE800((uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_267D47FF0);
}

uint64_t sub_21E8CDF9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D47FF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D47FF0);
  sub_21E8EE5C0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_21E8CE0C8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D47FF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D47FF0);
  sub_21E8EE5B0();
  swift_endAccess();
  return sub_21E8CE1D8;
}

void sub_21E8CE1D8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_21E8EE5C0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_21E8EE5C0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t sub_21E8CE408()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21E8CE508@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21E8CE588(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_21E8EE5F0();
}

uint64_t sub_21E8CE600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_21E8CE670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  uint64_t v17 = (char *)&v20 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18((char *)&v20 - v16, a1, v9);
  v18(v14, (uint64_t)v17, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_21E8EE5C0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v17, v9);
}

uint64_t sub_21E8CE7EC()
{
  return sub_21E8CE800((uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, &qword_26AD34430);
}

uint64_t sub_21E8CE800(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_21E8CE8B0()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21E8CE944(int a1)
{
  id v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21E8CE990())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CE9F8()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CEA10(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
}

uint64_t (*sub_21E8CEA1C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CEA84()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CEA9C(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
}

uint64_t (*sub_21E8CEAA8())()
{
  return j_j__swift_endAccess;
}

id sub_21E8CEB10()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_21E8EEA40();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21E8CEB88()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CEBA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_21E8EEA50();
  uint64_t v7 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  uint64_t *v7 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8CEC10(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
}

uint64_t (*sub_21E8CEC1C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CEC8C()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CECAC(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
}

uint64_t (*sub_21E8CECB8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CED28()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CED48(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
}

uint64_t (*sub_21E8CED54())()
{
  return j_j__swift_endAccess;
}

id sub_21E8CEDC4()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_21E8EE980();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21E8CEE4C()
{
  return sub_21E8CEE58();
}

uint64_t sub_21E8CEE58()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E8CEEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = sub_21E8EE990();
  uint64_t v8 = (uint64_t *)(a1 + *a5);
  swift_beginAccess();
  uint64_t *v8 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8CEF34(uint64_t a1)
{
  return sub_21E8CEF40(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
}

uint64_t sub_21E8CEF40(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8CEF90(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21E8CEFF8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CF0F8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E8CF1CC(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8CF220(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *id v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21E8CF28C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8CF344()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  return MEMORY[0x223C35660](v1);
}

uint64_t sub_21E8CF3E4()
{
  return swift_unknownObjectRelease();
}

void (*sub_21E8CF440(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C35660](v5);
  return sub_21E8CF4C4;
}

void sub_21E8CF4C4(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_21E8CF544(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

void *sub_21E8CF5A8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_21E8CF5F8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_21E8CF64C())()
{
  return j__swift_endAccess;
}

uint64_t PreferencePane.__allocating_init(name:panes:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return PreferencePane.init(name:panes:)(a1, a2, a3);
}

uint64_t PreferencePane.init(name:panes:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = (void *)sub_21E8EE9C0();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_21E8EE980();
  uint64_t v8 = (void *)sub_21E8EE980();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
  uint64_t v9 = (void *)sub_21E8EE980();
  uint64_t v10 = (void *)sub_21E8EE980();
  id v11 = objc_msgSend(v4, sel_initWithName_userDefaults_sliders_toggles_pickerOptions_pickerSelections_, v6, 0, v7, v8, v9, v10);

  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v17 = a3;
  id v12 = v11;
  sub_21E8EE5F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  if (!v17) {
    goto LABEL_12;
  }
  if (!(v17 >> 62))
  {
    uint64_t v14 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:

    return (uint64_t)v12;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_21E8EECA0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_11;
  }
LABEL_4:
  if (v14 >= 1)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      uint64_t v15 = 0;
      do
      {
        MEMORY[0x223C34910](v15++, v17);
        swift_beginAccess();
        swift_unknownObjectWeakAssign();
        swift_unknownObjectRelease();
      }
      while (v14 != v15);
    }
    else
    {
      unint64_t v16 = v17 + 32;
      do
      {
        v16 += 8;
        swift_beginAccess();
        swift_unknownObjectWeakAssign();
        --v14;
      }
      while (v14);
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

char *PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v30 = a7;
  uint64_t v31 = a6;
  uint64_t v29 = a5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34430);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = &v7[OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes];
  v33[0] = 0;
  unint64_t v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34440);
  sub_21E8EE5A0();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  *(_DWORD *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence] = 0;
  uint64_t v18 = MEMORY[0x263F8EE78];
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders] = MEMORY[0x263F8EE78];
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles] = v18;
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections] = v18;
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void **)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults];
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults] = 0;
  swift_beginAccess();
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  sub_21E8EE5A0();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v20 = *v19;
  *uint64_t v19 = a3;
  id v21 = a3;

  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders] = a4;
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles] = v29;
  *(void *)&v17[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections] = v30;

  uint64_t v22 = (objc_class *)type metadata accessor for PreferencePane();
  v34.receiver = v17;
  v34.super_class = v22;
  uint64_t v23 = (char *)objc_msgSendSuper2(&v34, sel_init);
  sub_21E8D0B44(0x704F72656B636970, 0xED0000736E6F6974, (uint64_t)v33);
  if (!v33[3])
  {
    sub_21E8D0E14((uint64_t)v33);
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48008);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    float v26 = &v23[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions];
    swift_beginAccess();
    *(void *)float v26 = v31;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = v32;
  float v25 = &v23[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions];
  swift_beginAccess();
  *(void *)float v25 = v24;
LABEL_6:
  swift_bridgeObjectRelease();
  sub_21E8CFE9C(0);

  return v23;
}

uint64_t type metadata accessor for PreferencePane()
{
  uint64_t result = qword_26AD34368;
  if (!qword_26AD34368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21E8CFE9C(char a1)
{
  uint64_t v2 = v1;
  id v3 = (void *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
  swift_beginAccess();
  *id v3 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = (void *)(*v4 + 64);
  uint64_t v7 = 1 << *(unsigned char *)(*v4 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *v6;
  uint64_t v71 = v2;
  uint64_t v10 = (id *)(v2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_bridgeObjectRetain();
  float32x4_t v78 = v10;
  swift_beginAccess();
  int64_t v11 = 0;
  int64_t v74 = (unint64_t)(v7 + 63) >> 6;
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v14 < v74)
  {
    unint64_t v15 = v6[v14];
    ++v11;
    if (v15) {
      goto LABEL_20;
    }
    int64_t v11 = v14 + 1;
    if (v14 + 1 >= v74) {
      goto LABEL_29;
    }
    unint64_t v15 = v6[v11];
    if (v15) {
      goto LABEL_20;
    }
    int64_t v11 = v14 + 2;
    if (v14 + 2 >= v74) {
      goto LABEL_29;
    }
    unint64_t v15 = v6[v11];
    if (v15)
    {
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
      for (unint64_t i = __clz(__rbit64(v15)) + (v11 << 6); ; unint64_t i = v12 | (v11 << 6))
      {
        unint64_t v17 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        swift_beginAccess();
        uint64_t v20 = (void *)*v3;
        swift_bridgeObjectRetain_n();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *id v3 = v20;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v20 = sub_21E8E6E58(0, v20[2] + 1, 1, v20);
          *id v3 = v20;
        }
        unint64_t v23 = v20[2];
        unint64_t v22 = v20[3];
        if (v23 >= v22 >> 1)
        {
          uint64_t v20 = sub_21E8E6E58((void *)(v22 > 1), v23 + 1, 1, v20);
          *id v3 = v20;
        }
        v20[2] = v23 + 1;
        uint64_t v24 = &v20[2 * v23];
        v24[4] = v19;
        v24[5] = v18;
        swift_endAccess();
        if ((a1 & 1) != 0 && *v78)
        {
          id v25 = *v78;
          float v26 = (void *)sub_21E8EE9C0();
          swift_bridgeObjectRelease();
          objc_msgSend(v25, sel_removeObjectForKey_, v26);

          if (!v9) {
            goto LABEL_7;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          if (!v9) {
            goto LABEL_7;
          }
        }
LABEL_6:
        unint64_t v12 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
      }
    }
    int64_t v16 = v14 + 3;
    if (v16 < v74)
    {
      unint64_t v15 = v6[v16];
      if (v15)
      {
        int64_t v11 = v16;
        goto LABEL_20;
      }
      while (1)
      {
        int64_t v11 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_89;
        }
        if (v11 >= v74) {
          break;
        }
        unint64_t v15 = v6[v11];
        ++v16;
        if (v15) {
          goto LABEL_20;
        }
      }
    }
  }
LABEL_29:
  swift_release();
  uint64_t v27 = (void *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
  swift_beginAccess();
  *uint64_t v27 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v28 = (uint64_t *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
  swift_beginAccess();
  uint64_t v29 = *v28;
  uint64_t v72 = v29 + 64;
  uint64_t v30 = 1 << *(unsigned char *)(v29 + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  unint64_t v32 = v31 & *(void *)(v29 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int64_t v33 = 0;
  int64_t v75 = (unint64_t)(v30 + 63) >> 6;
  if (v32) {
    goto LABEL_34;
  }
LABEL_35:
  int64_t v36 = v33 + 1;
  if (__OFADD__(v33, 1)) {
    goto LABEL_87;
  }
  if (v36 < v75)
  {
    unint64_t v37 = *(void *)(v72 + 8 * v36);
    ++v33;
    if (v37) {
      goto LABEL_48;
    }
    int64_t v33 = v36 + 1;
    if (v36 + 1 < v75)
    {
      unint64_t v37 = *(void *)(v72 + 8 * v33);
      if (v37) {
        goto LABEL_48;
      }
      int64_t v33 = v36 + 2;
      if (v36 + 2 < v75)
      {
        unint64_t v37 = *(void *)(v72 + 8 * v33);
        if (v37) {
          goto LABEL_48;
        }
        int64_t v38 = v36 + 3;
        if (v38 < v75)
        {
          unint64_t v37 = *(void *)(v72 + 8 * v38);
          if (!v37)
          {
            while (1)
            {
              int64_t v33 = v38 + 1;
              if (__OFADD__(v38, 1)) {
                goto LABEL_90;
              }
              if (v33 >= v75) {
                goto LABEL_57;
              }
              unint64_t v37 = *(void *)(v72 + 8 * v33);
              ++v38;
              if (v37) {
                goto LABEL_48;
              }
            }
          }
          int64_t v33 = v38;
LABEL_48:
          unint64_t v32 = (v37 - 1) & v37;
          for (unint64_t j = __clz(__rbit64(v37)) + (v33 << 6); ; unint64_t j = v34 | (v33 << 6))
          {
            uint64_t v39 = (uint64_t *)(*(void *)(v29 + 48) + 16 * j);
            uint64_t v41 = *v39;
            uint64_t v40 = v39[1];
            swift_beginAccess();
            float v42 = (void *)*v27;
            swift_bridgeObjectRetain_n();
            char v43 = swift_isUniquelyReferenced_nonNull_native();
            *uint64_t v27 = v42;
            if ((v43 & 1) == 0)
            {
              float v42 = sub_21E8E6E58(0, v42[2] + 1, 1, v42);
              *uint64_t v27 = v42;
            }
            unint64_t v45 = v42[2];
            unint64_t v44 = v42[3];
            if (v45 >= v44 >> 1)
            {
              float v42 = sub_21E8E6E58((void *)(v44 > 1), v45 + 1, 1, v42);
              *uint64_t v27 = v42;
            }
            v42[2] = v45 + 1;
            double v46 = &v42[2 * v45];
            v46[4] = v41;
            v46[5] = v40;
            swift_endAccess();
            if ((a1 & 1) != 0 && *v78)
            {
              id v47 = *v78;
              int v48 = (void *)sub_21E8EE9C0();
              swift_bridgeObjectRelease();
              objc_msgSend(v47, sel_removeObjectForKey_, v48);

              if (!v32) {
                goto LABEL_35;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              if (!v32) {
                goto LABEL_35;
              }
            }
LABEL_34:
            unint64_t v34 = __clz(__rbit64(v32));
            v32 &= v32 - 1;
          }
        }
      }
    }
  }
LABEL_57:
  swift_release();
  int v49 = (void *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
  swift_beginAccess();
  *int v49 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  int v50 = (uint64_t *)(v71 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
  swift_beginAccess();
  uint64_t v51 = *v50;
  uint64_t v73 = v51 + 64;
  uint64_t v52 = 1 << *(unsigned char *)(v51 + 32);
  uint64_t v53 = -1;
  if (v52 < 64) {
    uint64_t v53 = ~(-1 << v52);
  }
  unint64_t v54 = v53 & *(void *)(v51 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int64_t v55 = 0;
  int64_t v76 = (unint64_t)(v52 + 63) >> 6;
  if (v54) {
    goto LABEL_62;
  }
LABEL_63:
  int64_t v58 = v55 + 1;
  if (!__OFADD__(v55, 1))
  {
    if (v58 < v76)
    {
      unint64_t v59 = *(void *)(v73 + 8 * v58);
      ++v55;
      if (v59) {
        goto LABEL_76;
      }
      int64_t v55 = v58 + 1;
      if (v58 + 1 < v76)
      {
        unint64_t v59 = *(void *)(v73 + 8 * v55);
        if (v59) {
          goto LABEL_76;
        }
        int64_t v55 = v58 + 2;
        if (v58 + 2 < v76)
        {
          unint64_t v59 = *(void *)(v73 + 8 * v55);
          if (v59) {
            goto LABEL_76;
          }
          int64_t v60 = v58 + 3;
          if (v60 < v76)
          {
            unint64_t v59 = *(void *)(v73 + 8 * v60);
            if (!v59)
            {
              while (1)
              {
                int64_t v55 = v60 + 1;
                if (__OFADD__(v60, 1)) {
                  goto LABEL_91;
                }
                if (v55 >= v76) {
                  goto LABEL_85;
                }
                unint64_t v59 = *(void *)(v73 + 8 * v55);
                ++v60;
                if (v59) {
                  goto LABEL_76;
                }
              }
            }
            int64_t v55 = v60;
LABEL_76:
            unint64_t v54 = (v59 - 1) & v59;
            for (unint64_t k = __clz(__rbit64(v59)) + (v55 << 6); ; unint64_t k = v56 | (v55 << 6))
            {
              unsigned int v61 = (uint64_t *)(*(void *)(v51 + 48) + 16 * k);
              uint64_t v63 = *v61;
              uint64_t v62 = v61[1];
              swift_beginAccess();
              id v64 = (void *)*v49;
              swift_bridgeObjectRetain_n();
              char v65 = swift_isUniquelyReferenced_nonNull_native();
              *int v49 = v64;
              if ((v65 & 1) == 0)
              {
                id v64 = sub_21E8E6E58(0, v64[2] + 1, 1, v64);
                *int v49 = v64;
              }
              unint64_t v67 = v64[2];
              unint64_t v66 = v64[3];
              if (v67 >= v66 >> 1)
              {
                id v64 = sub_21E8E6E58((void *)(v66 > 1), v67 + 1, 1, v64);
                *int v49 = v64;
              }
              v64[2] = v67 + 1;
              uint64_t v68 = &v64[2 * v67];
              v68[4] = v63;
              v68[5] = v62;
              swift_endAccess();
              if ((a1 & 1) != 0 && *v78)
              {
                id v69 = *v78;
                uint64_t v70 = (void *)sub_21E8EE9C0();
                swift_bridgeObjectRelease();
                objc_msgSend(v69, sel_removeObjectForKey_, v70);

                if (!v54) {
                  goto LABEL_63;
                }
              }
              else
              {
                swift_bridgeObjectRelease();
                if (!v54) {
                  goto LABEL_63;
                }
              }
LABEL_62:
              unint64_t v56 = __clz(__rbit64(v54));
              v54 &= v54 - 1;
            }
          }
        }
      }
    }
LABEL_85:
    swift_release();
    return;
  }
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
}

uint64_t sub_21E8D06E4(uint64_t a1, uint64_t a2)
{
  sub_21E8D0B44(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      return v10;
    }
  }
  else
  {
    sub_21E8D0E14((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v6 = v11[0];
  if (!v11[0]) {
    return 0;
  }
  if (!(v11[0] >> 62))
  {
    if (*(void *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21E8EECA0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x223C34910](0, v6);
    goto LABEL_11;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 32);
LABEL_11:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21E8D06E4(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E8D0860(uint64_t a1, uint64_t a2)
{
  sub_21E8D0B44(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      return v10;
    }
  }
  else
  {
    sub_21E8D0E14((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v6 = v11[0];
  if (!v11[0]) {
    return 2;
  }
  if (!(v11[0] >> 62))
  {
    if (*(void *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21E8EECA0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 2;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x223C34910](0, v6);
    goto LABEL_11;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 32);
LABEL_11:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21E8D0860(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E8D09CC(uint64_t a1, uint64_t a2)
{
  sub_21E8D0B44(a1, a2, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      return v10;
    }
  }
  else
  {
    sub_21E8D0E14((uint64_t)v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v6 = v11[0];
  if (!v11[0]) {
    return 0;
  }
  if (!(v11[0] >> 62))
  {
    if (*(void *)((v11[0] & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21E8EECA0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x223C34910](0, v6);
    goto LABEL_11;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v6 + 32);
LABEL_11:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21E8D09CC(a1, a2);

    return v4;
  }
  __break(1u);
  return result;
}

_OWORD *sub_21E8D0B44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = (id *)(v3 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  if (*v8)
  {
    id v9 = *v8;
    uint64_t v10 = (void *)sub_21E8EE9C0();
    id v11 = objc_msgSend(v9, sel_valueForKey_, v10);

    if (v11)
    {
      sub_21E8EEC10();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v30, 0, sizeof(v30));
    }
    sub_21E8D0E74((uint64_t)v30, (uint64_t)&v31);
    if (*((void *)&v32 + 1))
    {
      sub_21E8D1928(&v31, v33);
      return sub_21E8D1928(v33, (_OWORD *)a3);
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_21E8D0E14((uint64_t)&v31);
  uint64_t v13 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_21E8D18B0(a1, a2);
    if (v16)
    {
      uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
      swift_bridgeObjectRelease();
      uint64_t result = (_OWORD *)swift_bridgeObjectRelease();
      *(void *)(a3 + 24) = MEMORY[0x263F8D538];
      *(void *)a3 = v17;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
  swift_beginAccess();
  uint64_t v19 = *v18;
  if (*(void *)(v19 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_21E8D18B0(a1, a2);
    if (v21)
    {
      char v22 = *(unsigned char *)(*(void *)(v19 + 56) + v20);
      swift_bridgeObjectRelease();
      uint64_t result = (_OWORD *)swift_bridgeObjectRelease();
      *(void *)(a3 + 24) = MEMORY[0x263F8D4F8];
      *(unsigned char *)a3 = v22;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v23 = (uint64_t *)(v4 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
  uint64_t result = (_OWORD *)swift_beginAccess();
  uint64_t v24 = *v23;
  if (*(void *)(v24 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_21E8D18B0(a1, a2);
    if (v26)
    {
      uint64_t v27 = (uint64_t *)(*(void *)(v24 + 56) + 16 * v25);
      uint64_t v29 = *v27;
      uint64_t v28 = v27[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t result = (_OWORD *)swift_bridgeObjectRelease();
      *(void *)(a3 + 24) = MEMORY[0x263F8D310];
      *(void *)a3 = v29;
      *(void *)(a3 + 8) = v28;
      return result;
    }
    swift_bridgeObjectRelease();
    uint64_t result = (_OWORD *)swift_bridgeObjectRelease();
  }
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

uint64_t sub_21E8D0E14(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E8D0E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_21E8D1040(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  uint64_t v5 = *v4;
  if (v5)
  {
    sub_21E8D1938(a1, (uint64_t)v18);
    uint64_t v6 = v19;
    if (v19)
    {
      id v7 = __swift_project_boxed_opaque_existential_0(v18, v19);
      uint64_t v8 = *(void *)(v6 - 8);
      MEMORY[0x270FA5388](v7, v7);
      uint64_t v10 = (char *)&v18[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v8 + 16))(v10);
      id v11 = v5;
      uint64_t v12 = sub_21E8EED30();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    }
    else
    {
      id v13 = v5;
      uint64_t v12 = 0;
    }
    uint64_t v14 = (void *)sub_21E8EE9C0();
    objc_msgSend(v5, sel_setObject_forKey_, v12, v14);

    swift_unknownObjectRelease();
  }
  type metadata accessor for PreferencePane();
  sub_21E8D19A0();
  sub_21E8EE580();
  sub_21E8EE590();
  swift_release();
  uint64_t v15 = v2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  uint64_t result = (void *)MEMORY[0x223C35660](v15);
  if (result)
  {
    objc_msgSend(result, sel_preferencePaneDidChangeWithPreference_, v2);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21E8D1308(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  uint64_t v4 = (void *)MEMORY[0x223C35660](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_preferencePaneDidChangeWithPreference_, a1);
    swift_unknownObjectRelease();
  }
  uint64_t v5 = (_DWORD *)(v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  uint64_t result = swift_beginAccess();
  ++*v5;
  return result;
}

void *sub_21E8D1470()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  uint64_t result = (void *)swift_release();
  if (!v8)
  {
    sub_21E8CFE9C(1);
    goto LABEL_13;
  }
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8EECA0();
    uint64_t result = (void *)swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3)
    {
LABEL_4:
      if (v3 < 1)
      {
        __break(1u);
        return result;
      }
      for (uint64_t i = 0; i != v3; ++i)
      {
        if ((v8 & 0xC000000000000001) != 0) {
          id v5 = (id)MEMORY[0x223C34910](i);
        }
        else {
          id v5 = *(id *)(v8 + 8 * i + 32);
        }
        uint64_t v6 = v5;
        sub_21E8D1470();
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  type metadata accessor for PreferencePane();
  sub_21E8D19A0();
  sub_21E8EE580();
  sub_21E8EE590();
  swift_release();
  uint64_t v7 = v1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  uint64_t result = (void *)MEMORY[0x223C35660](v7);
  if (result)
  {
    objc_msgSend(result, sel_preferencePaneDidChangeWithPreference_, v1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id PreferencePane.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PreferencePane.init()()
{
}

id PreferencePane.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreferencePane();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21E8D1870@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PreferencePane();
  uint64_t result = sub_21E8EE580();
  *a1 = result;
  return result;
}

unint64_t sub_21E8D18B0(uint64_t a1, uint64_t a2)
{
  sub_21E8EEDC0();
  sub_21E8EEA10();
  uint64_t v4 = sub_21E8EEDE0();
  return sub_21E8D2BA4(a1, a2, v4);
}

_OWORD *sub_21E8D1928(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21E8D1938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21E8D19A0()
{
  unint64_t result = qword_267D48010;
  if (!qword_267D48010)
  {
    type metadata accessor for PreferencePane();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48010);
  }
  return result;
}

uint64_t sub_21E8D19F8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21E8D1A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E8CE600(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_267D47FF0);
}

uint64_t sub_21E8D1A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CE670(a1, a2, a3, a4, &qword_267D47FF8, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name, &qword_267D47FF0);
}

uint64_t sub_21E8D1A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21E8CE600(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, &qword_26AD34430);
}

uint64_t sub_21E8D1A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CE670(a1, a2, a3, a4, &qword_267D48020, (uint64_t)&OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes, &qword_26AD34430);
}

uint64_t sub_21E8D1AB4@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (_DWORD *)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21E8D1B08(int *a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_21E8D1B58@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders, a2);
}

uint64_t sub_21E8D1B64(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders);
}

uint64_t sub_21E8D1B84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles, a2);
}

uint64_t sub_21E8D1B90(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles);
}

uint64_t sub_21E8D1BB0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections, a2);
}

uint64_t sub_21E8D1BBC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections);
}

uint64_t sub_21E8D1BDC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders, a2);
}

uint64_t sub_21E8D1BE8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultSliders);
}

uint64_t sub_21E8D1C08@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles, a2);
}

uint64_t sub_21E8D1C14(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultToggles);
}

uint64_t sub_21E8D1C34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections, a2);
}

uint64_t keypath_get_17Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E8D1C94(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E8CEF90(a1, a2, a3, a4, &OBJC_IVAR____TtC12NanoUniverse14PreferencePane_defaultPickersSelections);
}

uint64_t sub_21E8D1CB4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E8D1D10@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C35660](v3);
  *a2 = result;
  return result;
}

uint64_t sub_21E8D1D68()
{
  return swift_unknownObjectWeakAssign();
}

id sub_21E8D1DC0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_21E8D1E28()
{
  return type metadata accessor for PreferencePane();
}

void sub_21E8D1E30()
{
  sub_21E8D29CC();
  if (v0 <= 0x3F)
  {
    sub_21E8D2A24();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for PreferencePane(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreferencePane);
}

uint64_t dispatch thunk of PreferencePane.name.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PreferencePane.name.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PreferencePane.name.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PreferencePane.$name.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PreferencePane.$name.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PreferencePane.$name.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of PreferencePane.panes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PreferencePane.$panes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of PreferencePane.changeSequence.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of PreferencePane.sliders.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of PreferencePane.sliders.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of PreferencePane.sliders.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PreferencePane.toggles.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of PreferencePane.toggles.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of PreferencePane.toggles.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PreferencePane.pickersSelections.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PreferencePane.defaultSliders.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of PreferencePane.defaultToggles.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of PreferencePane.defaultPickersSelections.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of PreferencePane.pickerOptions.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of PreferencePane.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of PreferencePane.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of PreferencePane.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of PreferencePane.userDefaults.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of PreferencePane.__allocating_init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)()
{
  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of PreferencePane.doubleValue(forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of PreferencePane.BOOLeanValue(forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of PreferencePane.stringValue(forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of PreferencePane.getValue(forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of PreferencePane.set(_:forKey:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of PreferencePane.preferencePaneDidChange(preference:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of PreferencePane.reset()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

void sub_21E8D29CC()
{
  if (!qword_26AD34428)
  {
    unint64_t v0 = sub_21E8EE600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD34428);
    }
  }
}

void sub_21E8D2A24()
{
  if (!qword_267D48018)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AD34440);
    unint64_t v0 = sub_21E8EE600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267D48018);
    }
  }
}

unint64_t sub_21E8D2A80(uint64_t a1)
{
  sub_21E8EE9F0();
  sub_21E8EEDC0();
  sub_21E8EEA10();
  uint64_t v2 = sub_21E8EEDE0();
  swift_bridgeObjectRelease();
  return sub_21E8D2C88(a1, v2);
}

unint64_t sub_21E8D2B14(char a1)
{
  sub_21E8EEDC0();
  sub_21E8EEA10();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_21E8EEDE0();
  return sub_21E8D2E28(a1, v2);
}

unint64_t sub_21E8D2BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E8EED40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21E8EED40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21E8D2C88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_21E8EE9F0();
    uint64_t v8 = v7;
    if (v6 == sub_21E8EE9F0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_21E8EED40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_21E8EE9F0();
          uint64_t v15 = v14;
          if (v13 == sub_21E8EE9F0() && v15 == v16) {
            break;
          }
          char v18 = sub_21E8EED40();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_21E8D2E00(uint64_t a1)
{
  return a1;
}

unint64_t sub_21E8D2E28(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    uint64_t v7 = *(void *)&aTotal_1[v6 * 8];
    uint64_t v8 = qword_21E90FE80[v6];
    while (*(void *)&aTotal_1[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || qword_21E90FE80[*(char *)(*(void *)(v2 + 48) + v4)] != v8)
    {
      char v10 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_21E8D2F40()
{
  uint64_t result = sub_21E8EE9C0();
  qword_267D48028 = result;
  return result;
}

id PreferencePaneDoneButtonTappedNotificationName.getter()
{
  if (qword_267D47E28 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_267D48028;
  return v0;
}

uint64_t PreferencePaneView.init(pane:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for PreferencePaneView() + 20));
  *uint64_t v2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for PreferencePane();
  sub_21E8D19A0();
  uint64_t result = sub_21E8EE640();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for PreferencePaneView()
{
  uint64_t result = qword_267D48088;
  if (!qword_267D48088) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PreferencePaneView.body.getter()
{
  return sub_21E8EE630();
}

uint64_t sub_21E8D3260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_21E8EE6A0();
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  MEMORY[0x270FA5388](v3, v4);
  int64_t v36 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E8EE6E0();
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48058);
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  char v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48050);
  uint64_t v35 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48040);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v39 = v16;
  uint64_t v40 = v17;
  MEMORY[0x270FA5388](v16, v18);
  unint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = a1;
  uint64_t v43 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48150);
  sub_21E8D8F68(&qword_267D48158, &qword_267D48150);
  sub_21E8EE780();
  sub_21E8EE6D0();
  sub_21E8EE6C0();
  char v21 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v22 = v21;
  sub_21E8EE5E0();

  swift_release();
  swift_release();
  sub_21E8EE6B0();
  swift_bridgeObjectRelease();
  sub_21E8EE6C0();
  sub_21E8EE700();
  uint64_t v23 = sub_21E8D8F68(&qword_267D48060, &qword_267D48058);
  sub_21E8EE7F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v8);
  unint64_t v25 = v36;
  uint64_t v24 = v37;
  uint64_t v26 = v38;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, *MEMORY[0x263F19698], v38);
  uint64_t v44 = v8;
  uint64_t v45 = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_21E8EE800();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v12);
  uint64_t v42 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48048);
  uint64_t v44 = v12;
  uint64_t v45 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D48068);
  uint64_t v29 = sub_21E8D8F68(&qword_267D48070, &qword_267D48068);
  uint64_t v44 = v28;
  uint64_t v45 = v29;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v39;
  sub_21E8EE810();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v20, v30);
}

uint64_t sub_21E8D37FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48170);
  uint64_t v44 = *(void *)(v3 - 8);
  uint64_t v45 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v3, v4);
  uint64_t v42 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v41 = (char *)v40 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48178);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48180);
  MEMORY[0x270FA5388](v40[0], v14);
  uint64_t v16 = (void *)((char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48188);
  uint64_t v19 = MEMORY[0x270FA5388](v17 - 8, v18);
  char v21 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v24 = (char *)v40 - v23;
  v40[1] = a1;
  unint64_t v25 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  sub_21E8EE5E0();

  swift_release();
  swift_release();
  if (v46)
  {
    swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D481C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D481A0);
    sub_21E8D8F68(&qword_267D481D0, &qword_267D481C8);
    sub_21E8D8A58();
    sub_21E8EE8B0();
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(v16, v13, v9);
    swift_storeEnumTagMultiPayload();
    sub_21E8D8E38(&qword_267D48190, &qword_267D48178, (void (*)(void))sub_21E8D8A58);
    sub_21E8D8AE0();
    sub_21E8EE710();
    uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  else
  {
    type metadata accessor for PreferencePane();
    sub_21E8D19A0();
    id v29 = v26;
    uint64_t *v16 = sub_21E8EE640();
    v16[1] = v30;
    swift_storeEnumTagMultiPayload();
    sub_21E8D8E38(&qword_267D48190, &qword_267D48178, (void (*)(void))sub_21E8D8A58);
    sub_21E8D8AE0();
    uint64_t v27 = sub_21E8EE710();
  }
  MEMORY[0x270FA5388](v27, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D481B0);
  sub_21E8D8F68(&qword_267D481B8, &qword_267D481B0);
  long long v31 = v41;
  sub_21E8EE8D0();
  sub_21E8D90B8((uint64_t)v24, (uint64_t)v21, &qword_267D48188);
  uint64_t v33 = v44;
  uint64_t v32 = v45;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v35 = v42;
  v34(v42, v31, v45);
  uint64_t v36 = v43;
  sub_21E8D90B8((uint64_t)v21, v43, &qword_267D48188);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D481C0);
  v34((char *)(v36 + *(int *)(v37 + 48)), v35, v32);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v31, v32);
  sub_21E8D911C((uint64_t)v24, &qword_267D48188);
  v38(v35, v32);
  return sub_21E8D911C((uint64_t)v21, &qword_267D48188);
}

uint64_t sub_21E8D3DC0()
{
  uint64_t v0 = sub_21E8EE6E0();
  MEMORY[0x270FA5388](v0 - 8, v1);
  sub_21E8EE6D0();
  sub_21E8EE6C0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21E8EE5E0();
  swift_release();
  swift_release();
  sub_21E8EE6B0();
  swift_bridgeObjectRelease();
  sub_21E8EE6C0();
  sub_21E8EE700();
  sub_21E8D8AE0();
  return sub_21E8EE8C0();
}

uint64_t sub_21E8D3F20@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for PreferencePane();
  sub_21E8D19A0();
  id v4 = a1;
  uint64_t result = sub_21E8EE640();
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_21E8D3F74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreferencePaneView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8, v5);
  sub_21E8D896C(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_21E8D89D4((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D481D8);
  sub_21E8D8F68(&qword_267D481E0, &qword_267D481D8);
  return sub_21E8EE830();
}

void sub_21E8D40D0(uint64_t a1)
{
  id v1 = *(id *)(a1 + 8);
  sub_21E8D1470();
}

uint64_t sub_21E8D411C()
{
  uint64_t v0 = sub_21E8EE6F0();
  return MEMORY[0x270F04760](v0);
}

uint64_t sub_21E8D4178(uint64_t a1)
{
  uint64_t v2 = sub_21E8EE750();
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48068);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21E8EE740();
  uint64_t v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48160);
  sub_21E8D8F68(&qword_267D48168, &qword_267D48160);
  sub_21E8EE620();
  uint64_t v9 = sub_21E8D8F68(&qword_267D48070, &qword_267D48068);
  MEMORY[0x223C34400](v8, v4, v9);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_21E8D4340(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreferencePaneView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8, v5);
  sub_21E8EE6F0();
  sub_21E8D896C(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_21E8D89D4((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  return sub_21E8EE840();
}

void sub_21E8D4484()
{
  uint64_t v0 = sub_21E8EE660();
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48078);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PreferencePaneView();
  sub_21E8D75B0((uint64_t)v5);
  MEMORY[0x223C34520](v2);
  sub_21E8EE650();
  sub_21E8EE890();
  sub_21E8D911C((uint64_t)v5, &qword_267D48078);
  id v6 = objc_msgSend(self, sel_defaultCenter);
  if (qword_267D47E28 != -1) {
    swift_once();
  }
  objc_msgSend(v6, sel_postNotificationName_object_, qword_267D48028, 0);
}

uint64_t sub_21E8D4618()
{
  return sub_21E8EE7E0();
}

uint64_t sub_21E8D4634()
{
  return sub_21E8EE630();
}

uint64_t sub_21E8D47E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  int v50 = a3;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D480B0);
  uint64_t v55 = *(void *)(v49 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v49, v5);
  int v48 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v8);
  unint64_t v54 = (char *)&v42 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D480B8);
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v52 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v10, v11);
  uint64_t v53 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D480C0);
  uint64_t v47 = *(void *)(v17 - 8);
  uint64_t v18 = v47;
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  uint64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20, v23);
  unint64_t v25 = (char *)&v42 - v24;
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D480C8);
  sub_21E8D741C();
  uint64_t v46 = v25;
  sub_21E8EE8D0();
  uint64_t v58 = a1;
  uint64_t v59 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D480E8);
  sub_21E8D74BC();
  uint64_t v44 = v16;
  sub_21E8EE8D0();
  uint64_t v56 = a1;
  uint64_t v57 = a2;
  sub_21E8D755C();
  id v26 = v54;
  sub_21E8EE8D0();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v45 = v22;
  v27(v22, v25, v17);
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  uint64_t v28 = v53;
  v43(v53, v16, v52);
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  id v29 = v48;
  uint64_t v30 = v26;
  uint64_t v31 = v49;
  v42(v48, v30, v49);
  uint64_t v32 = v50;
  v27(v50, v22, v17);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48110);
  uint64_t v34 = &v32[*(int *)(v33 + 48)];
  uint64_t v35 = v32;
  uint64_t v36 = v52;
  v43(v34, v28, v52);
  v42(&v35[*(int *)(v33 + 64)], v29, v31);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v38 = v31;
  v37(v54, v31);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v51 + 8);
  v39(v44, v36);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v47 + 8);
  v40(v46, v17);
  v37(v29, v38);
  v39(v53, v36);
  return ((uint64_t (*)(char *, uint64_t))v40)(v45, v17);
}

uint64_t sub_21E8D4C8C@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D480C8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)&a2[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_sliders];
  swift_beginAccess();
  uint64_t v16 = *v11;
  swift_bridgeObjectRetain_n();
  sub_21E8D78F8(&v16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D480E0);
  sub_21E8D8F68(&qword_267D48118, &qword_267D48000);
  sub_21E8D8F68(&qword_267D480D8, &qword_267D480E0);
  sub_21E8EE8B0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v10, v6);
}

uint64_t sub_21E8D4EC0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48128);
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v52 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v48 - v12;
  uint64_t v14 = sub_21E8EE6E0();
  MEMORY[0x270FA5388](v14 - 8, v15);
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  sub_21E8EEA90();
  id v18 = a3;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_21E8EEA80();
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v21 = MEMORY[0x263F8F500];
  v20[2] = v19;
  v20[3] = v21;
  v20[4] = a2;
  v20[5] = v18;
  v20[6] = v17;
  v20[7] = v16;
  id v22 = v18;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_21E8EEA80();
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v23;
  v24[3] = v21;
  v24[4] = a2;
  v24[5] = v22;
  v24[6] = v17;
  v24[7] = v16;
  uint64_t v25 = MEMORY[0x263F8D538];
  sub_21E8EE8A0();
  uint64_t v26 = v57;
  uint64_t v27 = v58;
  uint64_t v28 = v59;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48130);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_21E90FEB0;
  uint64_t v57 = v26;
  uint64_t v58 = v27;
  uint64_t v59 = v28;
  uint64_t v30 = MEMORY[0x263F8D5B8];
  *(void *)(v29 + 56) = v25;
  *(void *)(v29 + 64) = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48138);
  MEMORY[0x223C34520](v31);
  sub_21E8EEA00();
  sub_21E8EE6D0();
  sub_21E8EE6C0();
  sub_21E8EE6B0();
  sub_21E8EE6C0();
  sub_21E8EE6B0();
  swift_bridgeObjectRelease();
  sub_21E8EE6C0();
  sub_21E8EE700();
  uint64_t v32 = sub_21E8EE790();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  LOBYTE(v17) = v37 & 1;
  uint64_t v50 = v27;
  uint64_t v51 = v26;
  uint64_t v57 = v26;
  uint64_t v58 = v27;
  uint64_t v59 = v28;
  long long v56 = xmmword_21E90FEC0;
  sub_21E8D88D8();
  swift_retain();
  swift_retain();
  uint64_t v38 = v13;
  uint64_t v49 = v13;
  sub_21E8EE860();
  LOBYTE(v57) = v17;
  uint64_t v39 = v52;
  uint64_t v40 = v53;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  uint64_t v42 = v38;
  uint64_t v43 = v54;
  v41(v52, v42, v54);
  uint64_t v44 = v55;
  *uint64_t v55 = v32;
  v44[1] = v34;
  *((unsigned char *)v44 + 16) = v17;
  v44[3] = v36;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48148);
  v41((char *)v44 + *(int *)(v45 + 48), v39, v43);
  sub_21E8D892C(v32, v34, v17);
  swift_bridgeObjectRetain();
  sub_21E8D892C(v32, v34, v17);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  uint64_t v46 = *(void (**)(char *, uint64_t))(v40 + 8);
  v46(v49, v43);
  sub_21E8D893C(v32, v34, v17);
  swift_bridgeObjectRelease();
  v46(v39, v43);
  sub_21E8D893C(v32, v34, v57);
  return swift_bridgeObjectRelease();
}

double *sub_21E8D5354(double *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  double v5 = *result;
  if ((~*(void *)result & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    v7[3] = MEMORY[0x263F8D6C8];
    v7[0] = (uint64_t)v5;
    id v6 = a5;
    sub_21E8D1040((uint64_t)v7);

    return (double *)sub_21E8D911C((uint64_t)v7, &qword_26AD344B0);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_21E8D5414@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D480E8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)&a2[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_toggles];
  swift_beginAccess();
  uint64_t v16 = *v11;
  swift_bridgeObjectRetain_n();
  sub_21E8D78F8(&v16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48100);
  sub_21E8D8F68(&qword_267D48118, &qword_267D48000);
  sub_21E8D8F68(&qword_267D480F8, &qword_267D48100);
  sub_21E8EE8B0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v10, v6);
}

uint64_t sub_21E8D5648(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  sub_21E8EEA90();
  id v7 = a3;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_21E8EEA80();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = a2;
  v9[5] = v7;
  v9[6] = v6;
  v9[7] = v5;
  id v11 = v7;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_21E8EEA80();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = v10;
  v13[4] = a2;
  v13[5] = v11;
  v13[6] = v6;
  v13[7] = v5;
  sub_21E8EE8A0();
  return sub_21E8EE870();
}

uint64_t sub_21E8D57A0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v9 = MEMORY[0x263F8D4F8];
  v8[0] = v5;
  id v6 = a5;
  sub_21E8D1040((uint64_t)v8);

  return sub_21E8D911C((uint64_t)v8, &qword_26AD344B0);
}

uint64_t sub_21E8D5818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21E8EE6E0();
  MEMORY[0x270FA5388](v2 - 8, v3);
  sub_21E8EE6D0();
  sub_21E8EE6C0();
  sub_21E8EE6B0();
  sub_21E8EE6C0();
  sub_21E8EE700();
  uint64_t result = sub_21E8EE790();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_21E8D590C@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  type metadata accessor for PreferencePane();
  sub_21E8D19A0();
  id v4 = a1;
  uint64_t result = sub_21E8EE640();
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_21E8D5960@<X0>(char *a1@<X8>)
{
  return sub_21E8D47E8(*v1, v1[1], a1);
}

uint64_t sub_21E8D5968@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D481F8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = (uint64_t *)&a2[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickersSelections];
  swift_beginAccess();
  uint64_t v16 = *v11;
  swift_bridgeObjectRetain_n();
  sub_21E8D78F8(&v16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48200);
  sub_21E8D8F68(&qword_267D48118, &qword_267D48000);
  sub_21E8D8DFC();
  sub_21E8EE8B0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v10, v6);
}

uint64_t sub_21E8D5B78@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v108 = a4;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48238);
  MEMORY[0x270FA5388](v104, v7);
  simd_float4 v97 = &v81[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v93 = sub_21E8EE730();
  uint64_t v92 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93, v9);
  simd_float4 v91 = &v81[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48240);
  uint64_t v95 = *(void *)(v96 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v96, v11);
  simd_float4 v94 = &v81[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12, v14);
  simd_float4 v100 = &v81[-v15];
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48248);
  MEMORY[0x270FA5388](v101, v16);
  simd_float4 v103 = &v81[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = sub_21E8EE6E0();
  uint64_t v20 = MEMORY[0x270FA5388](v18 - 8, v19);
  float v88 = &v81[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  MEMORY[0x270FA5388](v23, v24);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48228);
  uint64_t v99 = *(void *)(v105 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v105, v25);
  simd_float4 v90 = &v81[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v26, v28);
  simd_float4 v89 = &v81[-v29];
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48218);
  uint64_t v106 = *(void *)(v30 - 8);
  uint64_t v107 = v30;
  MEMORY[0x270FA5388](v30, v31);
  simd_float4 v102 = &v81[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = *a1;
  uint64_t v34 = a1[1];
  sub_21E8EEA90();
  id v35 = a3;
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_21E8EEA80();
  char v37 = (void *)swift_allocObject();
  uint64_t v38 = MEMORY[0x263F8F500];
  v37[2] = v36;
  v37[3] = v38;
  v37[4] = a2;
  v37[5] = v35;
  v37[6] = v33;
  v37[7] = v34;
  uint64_t v39 = (char *)v35;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_21E8EEA80();
  uint64_t v41 = (void *)swift_allocObject();
  v41[2] = v40;
  v41[3] = v38;
  v41[4] = a2;
  v41[5] = v39;
  v41[6] = v33;
  v41[7] = v34;
  sub_21E8EE8A0();
  uint64_t v43 = v109;
  uint64_t v42 = v110;
  uint64_t v44 = v112;
  uint64_t v98 = v111;
  uint64_t v45 = &v39[OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions];
  uint64_t result = swift_beginAccess();
  uint64_t v47 = *(void *)v45;
  if (*(void *)v45)
  {
    if (*(void *)(v47 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v48 = sub_21E8D18B0(v33, v34);
      if (v49)
      {
        uint64_t v87 = v42;
        uint64_t v50 = *(void *)(*(void *)(v47 + 56) + 8 * v48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v50 + 16) <= 4uLL)
        {
          sub_21E8EE6D0();
          sub_21E8EE6C0();
          sub_21E8EE6B0();
          sub_21E8EE6C0();
          sub_21E8EE700();
          simd_float4 v89 = (unsigned char *)sub_21E8EE790();
          uint64_t v83 = v61;
          uint64_t v84 = v62;
          uint64_t v63 = v43;
          int v65 = v64 & 1;
          sub_21E8EE6D0();
          sub_21E8EE6C0();
          sub_21E8EE6B0();
          sub_21E8EE6C0();
          sub_21E8EE700();
          uint64_t v86 = v63;
          uint64_t v109 = v63;
          uint64_t v110 = v87;
          uint64_t v111 = v98;
          uint64_t v112 = v44;
          uint64_t v85 = v44;
          MEMORY[0x270FA5388](v63, v66);
          swift_retain();
          swift_retain();
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D48250);
          sub_21E8D904C();
          unint64_t v67 = v90;
          sub_21E8EE850();
          swift_bridgeObjectRelease();
          uint64_t v68 = v91;
          sub_21E8EE720();
          uint64_t v98 = sub_21E8D8F68(&qword_267D48220, &qword_267D48228);
          id v69 = v94;
          uint64_t v70 = v105;
          uint64_t v71 = v93;
          sub_21E8EE7D0();
          (*(void (**)(unsigned char *, uint64_t))(v92 + 8))(v68, v71);
          (*(void (**)(unsigned char *, uint64_t))(v99 + 8))(v67, v70);
          uint64_t v72 = v95;
          uint64_t v73 = v100;
          uint64_t v74 = v96;
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v95 + 32))(v100, v69, v96);
          int64_t v75 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v72 + 16);
          v75(v69, v73, v74);
          uint64_t v76 = (uint64_t)v97;
          uint64_t v77 = (uint64_t)v89;
          uint64_t v78 = v83;
          *simd_float4 v97 = v89;
          *(void *)(v76 + 8) = v78;
          *(unsigned char *)(v76 + 16) = v65;
          *(void *)(v76 + 24) = v84;
          uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48260);
          v75((unsigned char *)(v76 + *(int *)(v79 + 48)), v69, v74);
          sub_21E8D892C(v77, v78, v65);
          swift_bridgeObjectRetain();
          int v82 = v65;
          sub_21E8D892C(v77, v78, v65);
          float32_t v80 = *(void (**)(unsigned char *, uint64_t))(v72 + 8);
          swift_bridgeObjectRetain();
          v80(v69, v74);
          sub_21E8D893C(v77, v78, v65);
          swift_bridgeObjectRelease();
          sub_21E8D90B8(v76, (uint64_t)v103, &qword_267D48238);
          swift_storeEnumTagMultiPayload();
          sub_21E8D8F68(&qword_267D48230, &qword_267D48238);
          uint64_t v56 = (uint64_t)v102;
          sub_21E8EE710();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          sub_21E8D911C(v76, &qword_267D48238);
          v80(v100, v74);
          sub_21E8D893C(v77, v78, v82);
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_21E8EE6D0();
          sub_21E8EE6C0();
          sub_21E8EE6B0();
          sub_21E8EE6C0();
          uint64_t v51 = sub_21E8EE700();
          simd_float4 v100 = v81;
          uint64_t v109 = v43;
          uint64_t v110 = v87;
          uint64_t v111 = v98;
          uint64_t v112 = v44;
          MEMORY[0x270FA5388](v51, v52);
          swift_retain();
          swift_retain();
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D48250);
          sub_21E8D904C();
          uint64_t v53 = v89;
          sub_21E8EE850();
          swift_bridgeObjectRelease();
          uint64_t v54 = v99;
          uint64_t v55 = v105;
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v99 + 16))(v103, v53, v105);
          swift_storeEnumTagMultiPayload();
          sub_21E8D8F68(&qword_267D48220, &qword_267D48228);
          sub_21E8D8F68(&qword_267D48230, &qword_267D48238);
          uint64_t v56 = (uint64_t)v102;
          sub_21E8EE710();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v53, v55);
        }
        uint64_t v60 = v106;
        uint64_t v59 = v107;
        uint64_t v58 = v108;
        sub_21E8D9178(v56, v108, &qword_267D48218);
        uint64_t v57 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 56))(v58, v57, 1, v59);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    uint64_t v57 = 1;
    uint64_t v59 = v107;
    uint64_t v58 = v108;
    uint64_t v60 = v106;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 56))(v58, v57, 1, v59);
  }
  __break(1u);
  return result;
}

void sub_21E8D6790(void *a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  id v7 = a1;
  uint64_t v8 = sub_21E8D09CC(a2, a3);
  unint64_t v10 = v9;

  if (v10) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = 0xE000000000000000;
  if (v10) {
    unint64_t v12 = v10;
  }
  *a4 = v11;
  a4[1] = v12;
}

uint64_t sub_21E8D67F8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  v9[3] = MEMORY[0x263F8D310];
  v9[0] = v5;
  v9[1] = v6;
  id v7 = a5;
  swift_bridgeObjectRetain();
  sub_21E8D1040((uint64_t)v9);

  return sub_21E8D911C((uint64_t)v9, &qword_26AD344B0);
}

uint64_t sub_21E8D687C()
{
  return sub_21E8EE8B0();
}

uint64_t sub_21E8D694C@<X0>(uint64_t a1@<X8>)
{
  sub_21E8D91DC();
  swift_bridgeObjectRetain();
  uint64_t result = sub_21E8EE7A0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_21E8D69B8@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D5968(*(void *)v1, *(char **)(v1 + 8), a1);
}

uint64_t sub_21E8D69C0()
{
  return sub_21E8EE670();
}

uint64_t sub_21E8D69E4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D3260(*(void *)(v1 + 16), a1);
}

uint64_t sub_21E8D69EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for PreferencePaneView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v5;
    uint64_t v6 = *(int *)(a3 + 20);
    id v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    id v9 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    void *v7 = *v8;
    if (EnumCaseMultiPayload == 1)
    {
      v7[1] = v8[1];
      swift_retain();
      swift_retain();
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
      unint64_t v12 = (char *)v7 + v11;
      uint64_t v13 = (char *)v8 + v11;
      uint64_t v14 = sub_21E8EE660();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for PreferencePaneView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;

  uint64_t v4 = v3 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  LODWORD(v3) = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_release();
  if (v3 == 1)
  {
    swift_release();
    uint64_t v6 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
    uint64_t v7 = sub_21E8EE660();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  return result;
}

void *initializeWithCopy for PreferencePaneView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  id v8 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *uint64_t v6 = *v7;
  if (EnumCaseMultiPayload == 1)
  {
    v6[1] = v7[1];
    swift_retain();
    swift_retain();
    uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
    uint64_t v11 = (char *)v6 + v10;
    unint64_t v12 = (char *)v7 + v10;
    uint64_t v13 = sub_21E8EE660();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for PreferencePaneView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a2[1];
  uint64_t v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_21E8D911C((uint64_t)a1 + v9, &qword_267D48030);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    void *v10 = *v11;
    if (EnumCaseMultiPayload == 1)
    {
      v10[1] = v11[1];
      swift_retain();
      swift_retain();
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
      uint64_t v14 = (char *)v10 + v13;
      uint64_t v15 = (char *)v11 + v13;
      uint64_t v16 = sub_21E8EE660();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for PreferencePaneView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = v6[1];
    *uint64_t v5 = *v6;
    v5[1] = v8;
    uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
    uint64_t v10 = (char *)v5 + v9;
    uint64_t v11 = (char *)v6 + v9;
    uint64_t v12 = sub_21E8EE660();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PreferencePaneView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    sub_21E8D911C((uint64_t)a1 + v8, &qword_267D48030);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = v10[1];
      void *v9 = *v10;
      v9[1] = v12;
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
      uint64_t v14 = (char *)v9 + v13;
      uint64_t v15 = (char *)v10 + v13;
      uint64_t v16 = sub_21E8EE660();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencePaneView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E8D7090);
}

uint64_t sub_21E8D7090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48080);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PreferencePaneView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E8D7158);
}

uint64_t sub_21E8D7158(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48080);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_21E8D7204()
{
  sub_21E8D729C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21E8D729C()
{
  if (!qword_267D48098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D48078);
    unint64_t v0 = sub_21E8EE610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267D48098);
    }
  }
}

uint64_t sub_21E8D72F8()
{
  return sub_21E8D8F68(&qword_267D480A0, &qword_267D480A8);
}

void *initializeBufferWithCopyOfBuffer for PreferencePaneDetailView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for PreferencePaneDetailView(uint64_t a1)
{
}

void *assignWithCopy for PreferencePaneDetailView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for PreferencePaneDetailView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

ValueMetadata *type metadata accessor for PreferencePaneDetailView()
{
  return &type metadata for PreferencePaneDetailView;
}

uint64_t sub_21E8D73F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E8D7414@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D4C8C(*(void *)(v1 + 16), *(char **)(v1 + 24), a1);
}

unint64_t sub_21E8D741C()
{
  unint64_t result = qword_267D480D0;
  if (!qword_267D480D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D480C8);
    sub_21E8D8F68(&qword_267D480D8, &qword_267D480E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D480D0);
  }
  return result;
}

uint64_t sub_21E8D74B4@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D5414(*(void *)(v1 + 16), *(char **)(v1 + 24), a1);
}

unint64_t sub_21E8D74BC()
{
  unint64_t result = qword_267D480F0;
  if (!qword_267D480F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D480E8);
    sub_21E8D8F68(&qword_267D480F8, &qword_267D48100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D480F0);
  }
  return result;
}

uint64_t sub_21E8D7554@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E8D590C(*(void **)(v1 + 24), a1);
}

unint64_t sub_21E8D755C()
{
  unint64_t result = qword_267D48108;
  if (!qword_267D48108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48108);
  }
  return result;
}

uint64_t sub_21E8D75B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E8EE690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8D90B8(v2, (uint64_t)v12, &qword_267D48030);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_21E8D9178((uint64_t)v12, a1, &qword_267D48078);
  }
  os_log_type_t v14 = sub_21E8EEAE0();
  uint64_t v15 = sub_21E8EE770();
  os_log_type_t v16 = v14;
  if (os_log_type_enabled(v15, v14))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v20[1] = a1;
    uint64_t v19 = v18;
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    v20[2] = sub_21E8CD144(0xD000000000000019, 0x800000021E9122D0, &v21);
    sub_21E8EEBF0();
    _os_log_impl(&dword_21E8AA000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v19, -1, -1);
    MEMORY[0x223C355E0](v17, -1, -1);
  }

  sub_21E8EE680();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_21E8D7840()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8D7878(uint64_t *a1)
{
  return sub_21E8D5648(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_21E8D7884(unsigned char *a1@<X8>)
{
  uint64_t v3 = (void *)v1[5];
  uint64_t v4 = v1[6];
  uint64_t v5 = v1[7];
  id v6 = v3;
  LOBYTE(v5) = sub_21E8D0860(v4, v5);

  *a1 = v5 & 1;
}

uint64_t sub_21E8D78E0(char *a1)
{
  return sub_21E8D57A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_21E8D78F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D5818(a1);
}

uint64_t sub_21E8D78F8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21E8D8844(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_21E8D7964(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21E8D7964(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_21E8EED10();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_21E8D8050(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  simd_float4 v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      simd_float4 v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          simd_float4 v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_21E8D8120((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            simd_float4 v97 = sub_21E8D8574((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          simd_float4 v100 = &v97[16 * v96 + 32];
          *(void *)simd_float4 v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          simd_float4 v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_21E8EEA70();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    os_log_type_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (*v17 == v15 && v17[1] == v16)
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_21E8EED40();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*v23 == *(v21 - 1) && v23[1] == *v21)
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_21E8EED40()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_21E8D83BC(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_21E8D83BC((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          char v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        int64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        float v88 = v42;
        unint64_t v89 = v44;
        simd_float4 v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_21E8D8120((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = *(v38 - 2) == v35 && *(v38 - 1) == v36;
          if (v39 || (sub_21E8EED40() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_21E8EEC90();
  __break(1u);
  return result;
}

uint64_t sub_21E8D8050(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    uint64_t v12 = v6;
    uint64_t v13 = (void *)v8;
    while (1)
    {
      uint64_t result = *(v13 - 2);
      BOOL v14 = result == v10 && *(v13 - 1) == v11;
      if (v14 || (uint64_t result = sub_21E8EED40(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v10 = *v13;
      uint64_t v11 = v13[1];
      *(_OWORD *)uint64_t v13 = *((_OWORD *)v13 - 1);
      *(v13 - 1) = v11;
      *(v13 - 2) = v10;
      v13 -= 2;
      if (v4 == ++v12) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21E8D8120(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = v21 == *((void *)v17 - 2) && v22 == *((void *)v17 - 1);
          if (v23 || (sub_21E8EED40() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    BOOL v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v4 == *(void *)v6 && *((void *)v4 + 1) == *((void *)v6 + 1);
        if (v15 || (sub_21E8EED40() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_21E8D84B8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

char *sub_21E8D83BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D48120);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21E8D84B8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_21E8EECE0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_21E8D8574(uint64_t a1)
{
  return sub_21E8D83BC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21E8D8588(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34498);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

uint64_t sub_21E8D86F4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34490);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

uint64_t sub_21E8D8844(uint64_t a1)
{
  return sub_21E8D8588(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21E8D8858@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_21E8D4EC0(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), a2);
}

void sub_21E8D8864(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)v1[5];
  uint64_t v4 = v1[6];
  uint64_t v5 = v1[7];
  id v6 = v3;
  uint64_t v7 = sub_21E8D06E4(v4, v5);
  LOBYTE(v4) = v8;

  if (v4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  *a1 = v9;
}

double *sub_21E8D88C8(double *a1)
{
  return sub_21E8D5354(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

unint64_t sub_21E8D88D8()
{
  unint64_t result = qword_267D48140;
  if (!qword_267D48140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48140);
  }
  return result;
}

uint64_t sub_21E8D892C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_21E8D893C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21E8D894C@<X0>(uint64_t a1@<X8>)
{
  return sub_21E8D37FC(*(void *)(v1 + 16), a1);
}

uint64_t sub_21E8D895C()
{
  return sub_21E8D4178(*(void *)(v0 + 16));
}

uint64_t sub_21E8D8964()
{
  return sub_21E8D4340(*(void *)(v0 + 16));
}

uint64_t sub_21E8D896C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreferencePaneView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E8D89D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreferencePaneView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E8D8A38()
{
  return sub_21E8D8C94((uint64_t (*)(uint64_t))sub_21E8D4484);
}

unint64_t sub_21E8D8A58()
{
  unint64_t result = qword_267D48198;
  if (!qword_267D48198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D481A0);
    sub_21E8D8AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48198);
  }
  return result;
}

unint64_t sub_21E8D8AE0()
{
  unint64_t result = qword_267D481A8;
  if (!qword_267D481A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D481A8);
  }
  return result;
}

uint64_t sub_21E8D8B34()
{
  return sub_21E8D3F74(*(void *)(v0 + 16));
}

uint64_t sub_21E8D8B3C@<X0>(uint64_t *a1@<X8>)
{
  return sub_21E8D3F20(*(void **)(v1 + 16), a1);
}

uint64_t objectdestroy_31Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for PreferencePaneView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48030);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D48078) + 32);
    uint64_t v8 = sub_21E8EE660();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_21E8D8C7C()
{
  return sub_21E8D8C94((uint64_t (*)(uint64_t))sub_21E8D40D0);
}

uint64_t sub_21E8D8C94(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for PreferencePaneView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t _s12NanoUniverse24PreferencePaneDetailViewVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21E8D8D50(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreferencePanePickerSectionView()
{
  return &type metadata for PreferencePanePickerSectionView;
}

uint64_t sub_21E8D8D9C()
{
  return sub_21E8D8F68(&qword_267D481E8, &qword_267D481F0);
}

uint64_t sub_21E8D8DD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21E8D8DF4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21E8D5B78(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_21E8D8DFC()
{
  return sub_21E8D8E38(&qword_267D48208, &qword_267D48200, (void (*)(void))sub_21E8D8EA4);
}

uint64_t sub_21E8D8E38(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21E8D8EA4()
{
  unint64_t result = qword_267D48210;
  if (!qword_267D48210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D48218);
    sub_21E8D8F68(&qword_267D48220, &qword_267D48228);
    sub_21E8D8F68(&qword_267D48230, &qword_267D48238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48210);
  }
  return result;
}

uint64_t sub_21E8D8F68(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_21E8D8FB0(uint64_t *a1@<X8>)
{
  sub_21E8D6790(*(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), a1);
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21E8D900C(uint64_t *a1)
{
  return sub_21E8D67F8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_21E8D901C()
{
  return sub_21E8D687C();
}

unint64_t sub_21E8D904C()
{
  unint64_t result = qword_267D48258;
  if (!qword_267D48258)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D48250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48258);
  }
  return result;
}

uint64_t sub_21E8D90B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21E8D911C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21E8D9178(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_21E8D91DC()
{
  unint64_t result = qword_267D48268;
  if (!qword_267D48268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D48268);
  }
  return result;
}

uint64_t sub_21E8D9230()
{
  return sub_21E8D8E38((unint64_t *)&unk_267D48270, &qword_267D481F8, (void (*)(void))sub_21E8D8DFC);
}

uint64_t sub_21E8D92A0()
{
  uint64_t result = sub_21E8EE9C0();
  qword_26AD34410 = result;
  return result;
}

id CloudCoverExpiredNotification.getter()
{
  if (qword_26AD34420 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD34410;
  return v0;
}

uint64_t sub_21E8D9390()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_21E8D9444(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_21E8D9498(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_21E8D9504())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21E8D95A8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21E8D963C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21E8D9688())()
{
  return j__swift_endAccess;
}

void sub_21E8D96E4(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_defaultManager);
  id v7 = objc_msgSend(v6, sel_URLsForDirectory_inDomains_, 13, 1);
  uint64_t v8 = sub_21E8EE490();
  uint64_t v9 = sub_21E8EEA50();

  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v5, v9 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v5, 1, 1, v8);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v8) == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v5, v8);
    sub_21E8EE440();
  }
}

uint64_t sub_21E8D99E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  uint64_t v4 = sub_21E8EE490();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21E8D9C10(uint64_t a1)
{
  uint64_t v3 = sub_21E8EE490();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  id v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v8, a1, v3);
  swift_endAccess();
  sub_21E8D9FA0();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(a1, v3);
  return ((uint64_t (*)(unsigned char *, uint64_t))v9)(v7, v3);
}

uint64_t sub_21E8D9D70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  uint64_t v4 = sub_21E8EE490();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_21E8D9DF8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_21E8EE490();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = &v17[-v11];
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
  v13(&v17[-v11], a1, v4);
  uint64_t v14 = *a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  v13(v9, v14, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 24))(v14, v12, v4);
  swift_endAccess();
  sub_21E8D9FA0();
  BOOL v15 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v15(v12, v4);
  return ((uint64_t (*)(unsigned char *, uint64_t))v15)(v9, v4);
}

uint64_t sub_21E8D9FA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21E8EE8F0();
  uint64_t v22 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_21E8EE910();
  uint64_t v6 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21E8EE490();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v15 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v15, v10);
  sub_21E8ED7B8(&qword_26AD344D0, MEMORY[0x263F06EA8]);
  char v16 = sub_21E8EE9B0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if ((v16 & 1) == 0)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v1;
    aBlock[4] = sub_21E8ED800;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21E8DA510;
    aBlock[3] = &block_descriptor_197;
    int v19 = _Block_copy(aBlock);
    id v20 = v1;
    sub_21E8EE900();
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v9, v5, v19);
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v21);
    return swift_release();
  }
  return result;
}

void sub_21E8DA38C()
{
  if (sub_21E8DD2B4())
  {
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_21E8EE570();
    __swift_project_value_buffer(v0, (uint64_t)qword_26AD34308);
    uint64_t v1 = sub_21E8EE550();
    os_log_type_t v2 = sub_21E8EEAF0();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21E8AA000, v1, v2, "Directory changed and files are expired. It will post expirated Notification.", v3, 2u);
      MEMORY[0x223C355E0](v3, -1, -1);
    }

    id v4 = objc_msgSend(self, sel_defaultCenter);
    id v5 = v4;
    if (qword_26AD34420 != -1)
    {
      swift_once();
      id v4 = v5;
    }
    objc_msgSend(v4, sel_postNotificationName_object_, qword_26AD34410, 0);
  }
}

void (*sub_21E8DA514(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x90uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_21E8EE490();
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  v3[11] = v5;
  size_t v7 = *(void *)(v5 + 64);
  v3[12] = malloc(v7);
  v3[13] = malloc(v7);
  uint64_t v8 = malloc(v7);
  uint64_t v9 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  v3[14] = v8;
  v3[15] = v9;
  uint64_t v10 = v1 + v9;
  swift_beginAccess();
  uint64_t v11 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
  v3[16] = v11;
  v3[17] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v11(v8, v10, v4);
  return sub_21E8DA63C;
}

void sub_21E8DA63C(uint64_t a1, char a2)
{
  os_log_type_t v2 = *(void **)a1;
  uint64_t v3 = *(void (**)(void *, void *, uint64_t))(*(void *)a1 + 128);
  uint64_t v5 = *(void **)(*(void *)a1 + 112);
  uint64_t v4 = *(void *)(*(void *)a1 + 120);
  uint64_t v6 = *(void **)(*(void *)a1 + 104);
  uint64_t v13 = *(void **)(*(void *)a1 + 96);
  uint64_t v7 = *(void *)(*(void *)a1 + 80);
  uint64_t v8 = *(void *)(*(void *)a1 + 88);
  uint64_t v9 = (void *)(*(void *)(*(void *)a1 + 72) + v4);
  if (a2)
  {
    v3(v6, v5, v7);
    uint64_t v10 = v13;
    v3(v13, v9, v7);
    swift_beginAccess();
    (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v9, v6, v7);
    swift_endAccess();
    sub_21E8D9FA0();
    uint64_t v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v6, v7);
    v11(v13, v7);
    v11(v5, v7);
  }
  else
  {
    v3(v6, (void *)(v2[9] + v4), v2[10]);
    swift_beginAccess();
    (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v9, v5, v7);
    swift_endAccess();
    sub_21E8D9FA0();
    uint64_t v12 = *(void (**)(void *, uint64_t))(v8 + 8);
    v12(v5, v7);
    v12(v6, v7);
    uint64_t v10 = v13;
  }
  free(v5);
  free(v6);
  free(v10);
  free(v2);
}

uint64_t static AegirCloudCoverService.Configuration.devEnvironment.getter@<X0>(unint64_t *a1@<X8>)
{
  static AegirCloudCoverService.Configuration.prodEnvironment.getter(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000021E912310;
  return result;
}

void static AegirCloudCoverService.Configuration.prodEnvironment.getter(unint64_t *a1@<X8>)
{
  id v2 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v3 = (void *)sub_21E8EE9C0();
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (!v4)
  {
    unint64_t v10 = 0xD00000000000001ELL;
    unint64_t v9 = 0x800000021E912360;
    unint64_t v11 = 0x800000021E912380;
    uint64_t v12 = 0xD000000000000019;
LABEL_21:
    uint64_t v21 = 0xD000000000000020;
    unint64_t v23 = 0x800000021E9123A0;
    id v18 = v4;
    goto LABEL_22;
  }
  id v5 = v4;
  uint64_t v6 = (void *)sub_21E8EE9C0();
  id v7 = objc_msgSend(v5, sel_stringForKey_, v6);

  if (v7)
  {
    uint64_t v24 = sub_21E8EE9F0();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v9 = 0;
  }
  id v13 = v5;
  uint64_t v14 = (void *)sub_21E8EE9C0();
  id v15 = objc_msgSend(v13, sel_stringForKey_, v14);

  if (v15)
  {
    uint64_t v12 = sub_21E8EE9F0();
    unint64_t v17 = v16;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v17 = 0;
  }
  id v18 = v13;
  int v19 = (void *)sub_21E8EE9C0();
  id v20 = objc_msgSend(v18, sel_stringForKey_, v19);

  if (v20)
  {
    uint64_t v21 = sub_21E8EE9F0();
    unint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v23 = 0;
  }
  if (v9) {
    unint64_t v10 = v24;
  }
  else {
    unint64_t v10 = 0xD00000000000001ELL;
  }
  if (!v9) {
    unint64_t v9 = 0x800000021E912360;
  }
  if (v17)
  {
    unint64_t v11 = v17;
  }
  else
  {
    uint64_t v12 = 0xD000000000000019;
    unint64_t v11 = 0x800000021E912380;
  }
  if (!v23) {
    goto LABEL_21;
  }
LABEL_22:

  *a1 = v10;
  a1[1] = v9;
  a1[2] = v12;
  a1[3] = v11;
  a1[4] = v21;
  a1[5] = v23;
}

void sub_21E8DAADC()
{
  qword_267D48AB0 = 3;
  qword_267D48AB8 = 0x3FE0000000000000;
}

uint64_t AegirCloudCoverService.CloudLevel.description.getter()
{
  return *(void *)&aTotal_2[8 * *v0];
}

uint64_t AegirCloudCoverService.CloudLevel.rawValue.getter()
{
  return *(void *)&aTotal_2[8 * *v0];
}

uint64_t sub_21E8DAB3C()
{
  return 0x61632D632D333070;
}

uint64_t sub_21E8DABBC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4 = result;
  if (result == 0xD000000000000012 && a2 == 0x800000021E912440 || (uint64_t result = sub_21E8EED40(), (result & 1) != 0))
  {
    char v6 = 3;
  }
  else if (v4 == 0xD000000000000012 && a2 == 0x800000021E912460 || (uint64_t result = sub_21E8EED40(), (result & 1) != 0))
  {
    char v6 = 2;
  }
  else if (v4 == 0xD000000000000013 && a2 == 0x800000021E912480 || (uint64_t result = sub_21E8EED40(), (result & 1) != 0))
  {
    char v6 = 1;
  }
  else
  {
    char v6 = 4;
    if (v4 != 0xD000000000000014 || a2 != 0x800000021E912750)
    {
      uint64_t result = sub_21E8EED40();
      if (result) {
        char v6 = 4;
      }
      else {
        char v6 = 5;
      }
    }
  }
  *a3 = v6;
  return result;
}

uint64_t sub_21E8DAD20()
{
  uint64_t result = sub_21E8DAD40();
  qword_26AD347E8 = result;
  return result;
}

uint64_t sub_21E8DAD40()
{
  uint64_t v0 = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  do
  {
    char v2 = byte_26CFDE5B8[v0 + 32];
    switch(v2)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        char v3 = sub_21E8EED40();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_21E8E7394(0, *(void *)(v1 + 16) + 1, 1);
          }
          unint64_t v5 = *(void *)(v1 + 16);
          unint64_t v4 = *(void *)(v1 + 24);
          if (v5 >= v4 >> 1) {
            sub_21E8E7394(v4 > 1, v5 + 1, 1);
          }
          *(void *)(v1 + 16) = v5 + 1;
          *(unsigned char *)(v1 + v5 + 32) = v2;
        }
        break;
      default:
        swift_bridgeObjectRelease();
        break;
    }
    ++v0;
  }
  while (v0 != 5);
  return v1;
}

void *static AegirCloudCoverService.CloudLevel.allCases.getter()
{
  return &unk_26CFDE5E0;
}

NanoUniverse::AegirCloudCoverService::CloudLevel_optional __swiftcall AegirCloudCoverService.CloudLevel.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_21E8EED00();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *char v2 = v5;
  return result;
}

uint64_t sub_21E8DAF24()
{
  return sub_21E8DAF2C();
}

uint64_t sub_21E8DAF2C()
{
  return sub_21E8EEDE0();
}

uint64_t sub_21E8DAF98()
{
  return sub_21E8DAFA0();
}

uint64_t sub_21E8DAFA0()
{
  sub_21E8EEA10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8DAFF4()
{
  return sub_21E8DAFFC();
}

uint64_t sub_21E8DAFFC()
{
  return sub_21E8EEDE0();
}

NanoUniverse::AegirCloudCoverService::CloudLevel_optional sub_21E8DB064(Swift::String *a1)
{
  return AegirCloudCoverService.CloudLevel.init(rawValue:)(*a1);
}

uint64_t sub_21E8DB070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AegirCloudCoverService.CloudLevel.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_21E8DB098(void *a1@<X8>)
{
  *a1 = &unk_26CFDE6A0;
}

uint64_t sub_21E8DB0A8()
{
  return AegirCloudCoverService.CloudLevel.rawValue.getter();
}

uint64_t sub_21E8DB0DC(char *a1, char *a2)
{
  return sub_21E8DB0E8(*a1, *a2);
}

uint64_t sub_21E8DB0E8(char a1, char a2)
{
  if (*(void *)&aTotal_2[8 * a1] == *(void *)&aTotal_2[8 * a2] && qword_21E910488[a1] == qword_21E910488[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_21E8EED40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

BOOL sub_21E8DB170(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21E8DB188()
{
  return sub_21E8EEDE0();
}

uint64_t sub_21E8DB1D0()
{
  return sub_21E8EEDD0();
}

uint64_t sub_21E8DB1FC()
{
  return sub_21E8EEDE0();
}

id AegirCloudCoverService.__allocating_init(imageScale:)(float a1)
{
  objc_allocWithZone(v1);
  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v9);
  v6[0] = v9[0];
  v6[1] = v9[1];
  uint64_t v7 = v10;
  uint64_t v8 = v11;
  id v3 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  id v4 = AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v6, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

id AegirCloudCoverService.init(imageScale:)(float a1)
{
  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v8);
  v5[0] = v8[0];
  v5[1] = v8[1];
  uint64_t v6 = v9;
  uint64_t v7 = v10;
  id v2 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  id v3 = AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v5, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id AegirCloudCoverService.__allocating_init(configuration:imageScale:)(uint64_t *a1, float a2)
{
  id v5 = objc_allocWithZone(v2);
  return AegirCloudCoverService.init(configuration:imageScale:)(a1, a2);
}

uint64_t type metadata accessor for AegirCloudCoverService()
{
  uint64_t result = qword_26AD34400;
  if (!qword_26AD34400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id AegirCloudCoverService.init(configuration:imageScale:)(uint64_t *a1, float a2)
{
  uint64_t v5 = sub_21E8EE8F0();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v46 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_21E8EEB30();
  uint64_t v8 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50, v9);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21E8EEB10();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v45 = sub_21E8EE910();
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45, v14);
  unint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  uint64_t v55 = a1[1];
  uint64_t v56 = v17;
  uint64_t v18 = a1[2];
  uint64_t v53 = a1[3];
  uint64_t v54 = v18;
  uint64_t v19 = a1[4];
  uint64_t v51 = a1[5];
  uint64_t v52 = v19;
  *(void *)&v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter] = 0;
  v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch] = 0;
  uint64_t v20 = (uint64_t)&v2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  uint64_t v21 = v2;
  sub_21E8D96E4(v20);
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_refreshTimeIntervalInSeconds] = 0x40AC200000000000;
  uint64_t v49 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue;
  sub_21E8ED270(0, &qword_26AD34480);
  sub_21E8EE900();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21E8ED7B8(&qword_26AD34478, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34460);
  sub_21E8D8F68((unint64_t *)&unk_26AD34468, &qword_26AD34460);
  sub_21E8EEC20();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F8F130], v50);
  *(void *)&v21[v49] = sub_21E8EEB70();
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_startBackoffInterval] = 0x4082C00000000000;
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_maxBackoffInterval] = 0x40F5180000000000;
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer] = 0;
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress] = MEMORY[0x263F8EE88];
  unint64_t v22 = &v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_backoffInterval];
  *(void *)unint64_t v22 = 0;
  v22[8] = 1;
  *(void *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session] = 0;
  uint64_t v23 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_authenticator;
  type metadata accessor for AegirAuthentication();
  uint64_t v24 = swift_allocObject();
  sub_21E8EE520();
  swift_allocObject();
  *(void *)(v24 + 16) = sub_21E8EE510();
  *(void *)&v21[v23] = v24;
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_21E8EE570();
  __swift_project_value_buffer(v25, (uint64_t)qword_26AD34308);
  uint64_t v26 = sub_21E8EE550();
  os_log_type_t v27 = sub_21E8EEAF0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_21E8AA000, v26, v27, "Initializing AegirCloudCoverService", v28, 2u);
    MEMORY[0x223C355E0](v28, -1, -1);
  }

  uint64_t v29 = &v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_configuration];
  uint64_t v30 = v55;
  *(void *)uint64_t v29 = v56;
  *((void *)v29 + 1) = v30;
  uint64_t v31 = v53;
  *((void *)v29 + 2) = v54;
  *((void *)v29 + 3) = v31;
  uint64_t v32 = v51;
  *((void *)v29 + 4) = v52;
  *((void *)v29 + 5) = v32;
  *(float *)&v21[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_imageScale] = a2;

  uint64_t v33 = (objc_class *)type metadata accessor for AegirCloudCoverService();
  v59.receiver = v21;
  v59.super_class = v33;
  id v34 = objc_msgSendSuper2(&v59, sel_init);
  uint64_t v35 = qword_26AD343E8;
  id v36 = v34;
  if (v35 != -1) {
    swift_once();
  }
  if (byte_26AD343D8 == 1)
  {
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v36;
    aBlock[4] = sub_21E8DC680;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21E8DA510;
    aBlock[3] = &block_descriptor;
    uint64_t v38 = _Block_copy(aBlock);
    id v39 = v36;
    sub_21E8EE900();
    uint64_t v57 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    unint64_t v40 = v46;
    uint64_t v41 = v48;
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v16, v40, v38);

    _Block_release(v38);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v45);
    swift_release();
  }
  else
  {
  }
  return v36;
}

uint64_t sub_21E8DBC94(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_21E8EE8F0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21E8EE910();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  unint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = *(void *)&v3[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  uint64_t v17 = (void *)swift_allocObject();
  _DWORD v17[2] = v3;
  v17[3] = a1;
  v17[4] = a2;
  v17[5] = a3;
  aBlock[4] = sub_21E8E6DFC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21E8DA510;
  aBlock[3] = &block_descriptor_7;
  uint64_t v18 = _Block_copy(aBlock);
  uint64_t v19 = v3;
  id v20 = a1;
  swift_retain();
  sub_21E8EE900();
  v22[1] = MEMORY[0x263F8EE78];
  sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
  sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
  sub_21E8EEC20();
  MEMORY[0x223C34800](0, v16, v11, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  return swift_release();
}

void sub_21E8DC010(uint64_t a1, uint64_t a2)
{
  sub_21E8EE490();
  id v3 = (id)sub_21E8EEA40();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

unint64_t sub_21E8DC07C()
{
  uint64_t v1 = sub_21E8EE490();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v28 = MEMORY[0x263F8EE78];
  if (qword_26AD34380 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26AD347E8;
  uint64_t v25 = *(void *)(qword_26AD347E8 + 16);
  if (v25)
  {
    uint64_t v7 = v0 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
    swift_bridgeObjectRetain();
    uint64_t v24 = v7;
    swift_beginAccess();
    uint64_t v8 = 0;
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    unint64_t v9 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v10 = v6;
      v23(v5, v24, v1);
      v27[0] = 0x61632D632D333070;
      v27[1] = 0xEF2D65706F696C6CLL;
      sub_21E8EEA20();
      swift_bridgeObjectRelease();
      sub_21E8EE440();
      swift_bridgeObjectRelease();
      sub_21E8EE450();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v9 = sub_21E8E6F68(0, *(void *)(v9 + 16) + 1, 1, v9);
      }
      unint64_t v12 = *(void *)(v9 + 16);
      unint64_t v11 = *(void *)(v9 + 24);
      if (v12 >= v11 >> 1) {
        unint64_t v9 = sub_21E8E6F68(v11 > 1, v12 + 1, 1, v9);
      }
      ++v8;
      *(void *)(v9 + 16) = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v9+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v12, v5, v1);
      unint64_t v28 = v9;
      uint64_t v6 = v10;
    }
    while (v25 != v8);
    swift_bridgeObjectRelease();
  }
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_21E8EE570();
  __swift_project_value_buffer(v13, (uint64_t)qword_26AD34308);
  uint64_t v14 = sub_21E8EE550();
  os_log_type_t v15 = sub_21E8EEAC0();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v27[0] = v17;
    *(_DWORD *)unint64_t v16 = 136315138;
    swift_beginAccess();
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = MEMORY[0x223C34700](v18, v1);
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_21E8CD144(v19, v21, v27);
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E8AA000, v14, v15, "Cached cloudTextureURLs: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v17, -1, -1);
    MEMORY[0x223C355E0](v16, -1, -1);
  }

  swift_beginAccess();
  return v28;
}

uint64_t sub_21E8DC514()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_processName);

  uint64_t v2 = sub_21E8EE9F0();
  uint64_t v4 = v3;

  BOOL v5 = v2 == 0x656764697242 && v4 == 0xE600000000000000;
  if (v5
    || (sub_21E8EED40() & 1) != 0
    || (v2 == 0x736F507269676541 ? (BOOL v6 = v4 == 0xEB00000000726574) : (BOOL v6 = 0), v6))
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v7 = sub_21E8EED40();
    uint64_t result = swift_bridgeObjectRelease();
  }
  byte_26AD343D8 = v7 & 1;
  return result;
}

uint64_t sub_21E8DC648()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8DC680()
{
  return sub_21E8E0F1C();
}

uint64_t sub_21E8DC6D8(uint64_t a1, uint64_t a2)
{
  if (qword_26AD343E8 != -1) {
    a1 = swift_once();
  }
  if (byte_26AD343D8)
  {
    MEMORY[0x270FA5388](a1, a2);
    sub_21E8EEB50();
    return v13;
  }
  else
  {
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_21E8EE570();
    __swift_project_value_buffer(v3, (uint64_t)qword_26AD34308);
    uint64_t v4 = sub_21E8EE550();
    os_log_type_t v5 = sub_21E8EEAF0();
    if (os_log_type_enabled(v4, v5))
    {
      BOOL v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v13 = v7;
      *(_DWORD *)BOOL v6 = 136315138;
      id v8 = objc_msgSend(self, sel_processInfo);
      id v9 = objc_msgSend(v8, sel_processName);

      uint64_t v10 = sub_21E8EE9F0();
      unint64_t v12 = v11;

      sub_21E8CD144(v10, v12, &v13);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E8AA000, v4, v5, "Will not fetch data: process %s is not permitted to perform downloads", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v7, -1, -1);
      MEMORY[0x223C355E0](v6, -1, -1);
    }

    return 0;
  }
}

uint64_t sub_21E8DC954()
{
  id v1 = v0;
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_21E8EE570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  BOOL v6 = (char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21E8EE490();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  BOOL v65 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  int64_t v75 = (char *)v61 - v14;
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v17 = (char *)v61 - v16;
  id v18 = objc_msgSend(self, sel_defaultManager);
  if (qword_26AD34380 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_26AD347E8;
  uint64_t v77 = *(void *)(qword_26AD347E8 + 16);
  if (v77)
  {
    uint64_t v74 = v6;
    uint64_t v72 = v2;
    unint64_t v20 = &v1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
    swift_bridgeObjectRetain();
    uint64_t v80 = v20;
    swift_beginAccess();
    uint64_t v21 = 0;
    unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v81 = v8 + 16;
    uint64_t v78 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v79 = v22;
    uint64_t v71 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v69 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v63 = &v83;
    *(void *)&long long v23 = 136315394;
    long long v62 = v23;
    v61[1] = MEMORY[0x263F8EE58] + 8;
    uint64_t v64 = v1;
    id v70 = v18;
    uint64_t v76 = v19;
    do
    {
      char v25 = *(unsigned char *)(v19 + v21 + 32);
      v79(v17, v80, v7);
      aBlocunint64_t k = 0x61632D632D333070;
      unint64_t v85 = 0xEF2D65706F696C6CLL;
      sub_21E8EEA20();
      swift_bridgeObjectRelease();
      sub_21E8EE440();
      swift_bridgeObjectRelease();
      sub_21E8EE450();
      sub_21E8EE470();
      uint64_t v26 = *v78;
      (*v78)(v17, v7);
      os_log_type_t v27 = (void *)sub_21E8EE9C0();
      swift_bridgeObjectRelease();
      unsigned int v28 = objc_msgSend(v18, sel_fileExistsAtPath_, v27);

      if (v28)
      {
        char v29 = v25;
        uint64_t v30 = v75;
        v79(v75, v80, v7);
        LOBYTE(aBlock) = v29;
        sub_21E8DAB3C();
        sub_21E8EE440();
        swift_bridgeObjectRelease();
        sub_21E8EE450();
        uint64_t v31 = (void *)sub_21E8EE430();
        v26(v30, v7);
        aBlocunint64_t k = 0;
        unsigned int v32 = objc_msgSend(v18, sel_removeItemAtURL_error_, v31, &aBlock);

        id v33 = (id)aBlock;
        if (!v32)
        {
          id v34 = v33;
          uint64_t v35 = (void *)sub_21E8EE400();

          swift_willThrow();
          if (qword_26AD34320 != -1) {
            swift_once();
          }
          uint64_t v36 = v72;
          uint64_t v37 = __swift_project_value_buffer(v72, (uint64_t)qword_26AD34308);
          (*v71)(v74, v37, v36);
          uint64_t v38 = v1;
          id v39 = v35;
          uint64_t v73 = v38;
          id v40 = v35;
          uint64_t v41 = sub_21E8EE550();
          os_log_type_t v42 = sub_21E8EEAD0();
          int v43 = v42;
          if (os_log_type_enabled(v41, v42))
          {
            uint64_t v44 = swift_slowAlloc();
            uint64_t v68 = swift_slowAlloc();
            aBlocunint64_t k = v68;
            *(_DWORD *)uint64_t v44 = v62;
            uint64_t v45 = v65;
            v79(v65, v80, v7);
            LOBYTE(v82) = v29;
            int v67 = v43;
            sub_21E8DAB3C();
            sub_21E8EE440();
            swift_bridgeObjectRelease();
            sub_21E8EE450();
            sub_21E8ED7B8(&qword_267D48290, MEMORY[0x263F06EA8]);
            uint64_t v46 = sub_21E8EED20();
            os_log_t v66 = v41;
            unint64_t v48 = v47;
            v26(v45, v7);
            uint64_t v82 = sub_21E8CD144(v46, v48, &aBlock);
            sub_21E8EEBF0();
            uint64_t v49 = v73;

            swift_bridgeObjectRelease();
            *(_WORD *)(v44 + 12) = 2080;
            swift_getErrorValue();
            uint64_t v50 = sub_21E8EED70();
            uint64_t v82 = sub_21E8CD144(v50, v51, &aBlock);
            sub_21E8EEBF0();
            swift_bridgeObjectRelease();

            os_log_t v52 = v66;
            _os_log_impl(&dword_21E8AA000, v66, (os_log_type_t)v67, "Failed to delete cloud texture file at : %s. Error: %s", (uint8_t *)v44, 0x16u);
            uint64_t v53 = v68;
            swift_arrayDestroy();
            MEMORY[0x223C355E0](v53, -1, -1);
            uint64_t v54 = v44;
            id v1 = v64;
            MEMORY[0x223C355E0](v54, -1, -1);

            (*v69)(v74, v72);
          }
          else
          {

            uint64_t v24 = v73;
            (*v69)(v74, v36);
          }
          id v18 = v70;
        }
      }
      ++v21;
      uint64_t v19 = v76;
    }
    while (v77 != v21);
    swift_bridgeObjectRelease();
  }
  uint64_t v55 = *(NSObject **)&v1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v1;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = sub_21E8E7210;
  *(void *)(v57 + 24) = v56;
  float v88 = sub_21E8E7238;
  uint64_t v89 = v57;
  aBlocunint64_t k = MEMORY[0x263EF8330];
  unint64_t v85 = 1107296256;
  uint64_t v86 = sub_21E8DD28C;
  uint64_t v87 = &block_descriptor_16;
  uint64_t v58 = _Block_copy(&aBlock);
  objc_super v59 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v55, v58);

  _Block_release(v58);
  LOBYTE(v55) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v55) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E8DD28C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

BOOL sub_21E8DD2B4()
{
  uint64_t v1 = sub_21E8EE570();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v6 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch];
  swift_beginAccess();
  if ((*v6 & 1) != 0
    || (uint64_t v7 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress],
        swift_beginAccess(),
        *(void *)(*(void *)v7 + 16)))
  {
LABEL_3:
    BOOL v29 = 0;
  }
  else
  {
    uint64_t v20 = *(void *)&v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer];
    BOOL v29 = v20 == 0;
    if (!v20)
    {
      BOOL v29 = 0;
      if (qword_26AD34380 != -1) {
        swift_once();
      }
      uint64_t v21 = qword_26AD347E8;
      uint64_t v22 = *(void *)(qword_26AD347E8 + 16);
      if (v22)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = 0;
        while (1)
        {
          LOBYTE(v28[0]) = *(unsigned char *)(v21 + v23 + 32);
          if (sub_21E8E008C((unsigned __int8 *)v28)) {
            break;
          }
          if (v22 == ++v23)
          {
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
        }
        swift_bridgeObjectRelease();
        BOOL v29 = 1;
      }
    }
  }
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v1, (uint64_t)qword_26AD34308);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v8, v1);
  BOOL v9 = v29;
  uint64_t v10 = v0;
  uint64_t v11 = sub_21E8EE550();
  os_log_type_t v12 = sub_21E8EEAF0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v1;
    uint64_t v15 = v14;
    v28[0] = v14;
    *(_DWORD *)uint64_t v13 = 67109890;
    int v27 = v9;
    sub_21E8EEBF0();
    *(_WORD *)(v13 + 8) = 1024;
    int v27 = *v6;
    sub_21E8EEBF0();
    *(_WORD *)(v13 + 14) = 2048;
    uint64_t v16 = &v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress];
    swift_beginAccess();
    uint64_t v26 = *(void *)(*(void *)v16 + 16);
    sub_21E8EEBF0();
    *(_WORD *)(v13 + 24) = 2080;
    if (*(void *)&v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer]) {
      uint64_t v17 = 0x6C694E746F6ELL;
    }
    else {
      uint64_t v17 = 7104878;
    }
    if (*(void *)&v10[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer]) {
      unint64_t v18 = 0xE600000000000000;
    }
    else {
      unint64_t v18 = 0xE300000000000000;
    }
    uint64_t v26 = sub_21E8CD144(v17, v18, v28);
    sub_21E8EEBF0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E8AA000, v11, v12, "Should fetch data: %{BOOL}d, disabledFetch: %{BOOL}d, operationsInProgress.count: %ld, dispatchSourceTimer: %s", (uint8_t *)v13, 0x22u);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v15, -1, -1);
    MEMORY[0x223C355E0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  swift_beginAccess();
  return v29;
}

void sub_21E8DD6F8(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5, char *a6, NSObject *a7)
{
  dispatch_group_t v91 = a7;
  float v88 = a6;
  LODWORD(v89) = a4;
  v95[18] = *MEMORY[0x263EF8340];
  uint64_t v85 = sub_21E8EE570();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v85, v11);
  uint64_t v83 = (char *)v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = (char *)v77 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  uint64_t v19 = MEMORY[0x270FA5388](v17 - 8, v18);
  uint64_t v21 = (char *)v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v24 = (char *)v77 - v23;
  uint64_t v25 = sub_21E8EE490();
  uint64_t v27 = MEMORY[0x270FA5388](v25, v26);
  uint64_t v87 = (char *)v77 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27, v29);
  uint64_t v31 = (char *)v77 - v30;
  uint64_t v84 = a3;
  unsigned int v32 = (unsigned char *)(a5 + 16);
  uint64_t v34 = v33;
  sub_21E8D90B8(a1, (uint64_t)v24, &qword_26AD34328);
  int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v24, 1, v25);
  uint64_t v90 = (void (*)(char *, uint64_t))(a3 + 16);
  if (v35 == 1)
  {
    uint64_t v36 = v25;
    sub_21E8D911C((uint64_t)v24, &qword_26AD34328);
    objc_msgSend(a2, sel_lock);
    swift_beginAccess();
    *unsigned int v32 = 1;
    objc_msgSend(a2, sel_unlock);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v24, v25);
    objc_msgSend(a2, sel_lock);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v21, v31, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v21, 0, 1, v25);
    swift_beginAccess();
    sub_21E8DE1CC((uint64_t)v21, v89);
    swift_endAccess();
    objc_msgSend(a2, sel_unlock);
    uint64_t v36 = v25;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v25);
  }
  swift_beginAccess();
  if ((*v32 & 1) == 0)
  {
    uint64_t v37 = v90;
    swift_beginAccess();
    if (*(void *)(*(void *)v37 + 16) == 3)
    {
      uint64_t v38 = (void **)&v88[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter];
      swift_beginAccess();
      id v39 = (char *)*v38;
      if (*v38)
      {
        id v40 = &v88[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
        swift_beginAccess();
        uint64_t v41 = v36;
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v87, v40, v36);
        swift_unknownObjectRetain();
        sub_21E8EE440();
        sub_21E8EE450();
        if (qword_26AD34320 != -1) {
          swift_once();
        }
        uint64_t v89 = v34;
        uint64_t v42 = v85;
        uint64_t v43 = __swift_project_value_buffer(v85, (uint64_t)qword_26AD34308);
        uint64_t v44 = v86;
        uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v86 + 16);
        uint64_t v82 = v43;
        float v88 = (char *)(v86 + 16);
        uint64_t v81 = v45;
        ((void (*)(char *))v45)(v16);
        swift_retain_n();
        uint64_t v46 = sub_21E8EE550();
        os_log_type_t v47 = sub_21E8EEAF0();
        int v48 = v47;
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v49 = swift_slowAlloc();
          int v79 = v48;
          uint64_t v50 = v49;
          uint64_t v78 = swift_slowAlloc();
          v95[0] = v78;
          *(_DWORD *)uint64_t v50 = 136315394;
          uint64_t v80 = v16;
          uint64_t v93 = sub_21E8CD144(0x6F626D6F63, 0xE500000000000000, v95);
          sub_21E8EEBF0();
          *(_WORD *)(v50 + 12) = 2080;
          v77[1] = v50 + 14;
          swift_beginAccess();
          uint64_t v51 = swift_bridgeObjectRetain();
          os_log_t v52 = v39;
          size_t v53 = sub_21E8E7260(v51);
          swift_bridgeObjectRelease();
          uint64_t v54 = MEMORY[0x223C34700](v53, v36);
          unint64_t v56 = v55;
          id v39 = v52;
          swift_release();
          id v94 = (id)sub_21E8CD144(v54, v56, v95);
          sub_21E8EEBF0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21E8AA000, v46, (os_log_type_t)v79, "Combining cloud textures for level: %s %s", (uint8_t *)v50, 0x16u);
          uint64_t v57 = v78;
          swift_arrayDestroy();
          MEMORY[0x223C355E0](v57, -1, -1);
          MEMORY[0x223C355E0](v50, -1, -1);

          uint64_t v58 = *(void (**)(char *, uint64_t))(v86 + 8);
          v58(v80, v42);
        }
        else
        {

          swift_release_n();
          uint64_t v58 = *(void (**)(char *, uint64_t))(v44 + 8);
          v58(v16, v42);
        }
        swift_beginAccess();
        uint64_t v59 = swift_bridgeObjectRetain();
        sub_21E8E7260(v59);
        swift_bridgeObjectRelease();
        uint64_t v60 = (void *)sub_21E8EEA40();
        swift_release();
        uint64_t v61 = v87;
        long long v62 = (void *)sub_21E8EE430();
        id v94 = 0;
        unsigned int v63 = objc_msgSend(v39, sel_combineFilesAt_to_error_, v60, v62, &v94);

        uint64_t v64 = v41;
        if (v63)
        {
          id v65 = v94;
          swift_unknownObjectRelease();
LABEL_17:
          (*(void (**)(char *, uint64_t))(v89 + 8))(v61, v41);
          goto LABEL_18;
        }
        uint64_t v90 = v58;
        id v66 = v94;
        int v67 = (void *)sub_21E8EE400();

        swift_willThrow();
        uint64_t v68 = v83;
        v81(v83, v82, v42);
        id v69 = v67;
        id v70 = v67;
        uint64_t v71 = sub_21E8EE550();
        os_log_type_t v72 = sub_21E8EEAD0();
        if (!os_log_type_enabled(v71, v72))
        {
          swift_unknownObjectRelease();

          v90(v68, v42);
          goto LABEL_17;
        }
        uint64_t v73 = swift_slowAlloc();
        uint64_t v74 = (void *)swift_slowAlloc();
        id v94 = v74;
        *(_DWORD *)uint64_t v73 = 136315394;
        uint64_t v92 = sub_21E8CD144(0x6F626D6F63, 0xE500000000000000, (uint64_t *)&v94);
        float v88 = v39;
        sub_21E8EEBF0();
        *(_WORD *)(v73 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v75 = sub_21E8EED70();
        uint64_t v92 = sub_21E8CD144(v75, v76, (uint64_t *)&v94);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21E8AA000, v71, v72, "Failed to combine cloud textures for level: %s. Error: %s.", (uint8_t *)v73, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v74, -1, -1);
        MEMORY[0x223C355E0](v73, -1, -1);
        swift_unknownObjectRelease();

        v90(v83, v85);
        (*(void (**)(char *, uint64_t))(v89 + 8))(v87, v64);
      }
    }
  }
LABEL_18:
  dispatch_group_leave(v91);
}

uint64_t sub_21E8DE1CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v6 - 8, v7);
  BOOL v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21E8EE490();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_21E8D911C(a1, &qword_26AD34328);
    sub_21E8E73D4(a2, (uint64_t)v9);
    return sub_21E8D911C((uint64_t)v9, &qword_26AD34328);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v14, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_21E8E7B80((uint64_t)v14, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21E8DE388(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(NSObject **)&a1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_21E8ED404;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = (uint64_t)sub_21E8EDA04;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21E8DD28C;
  aBlock[3] = (uint64_t)&block_descriptor_119;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = a1;
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v7)
  {
    __break(1u);
  }
  else if (qword_26AD34320 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v12 = sub_21E8EE570();
  __swift_project_value_buffer(v12, (uint64_t)qword_26AD34308);
  swift_retain_n();
  uint64_t v13 = sub_21E8EE550();
  os_log_type_t v14 = sub_21E8EEAF0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_beginAccess();
    sub_21E8EE490();
    sub_21E8ED464();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_21E8EE9A0();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    sub_21E8CD144(v16, v18, aBlock);
    sub_21E8EEBF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E8AA000, v13, v14, "Finished loading cloud textures. Urls: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v22, -1, -1);
    MEMORY[0x223C355E0](v15, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  uint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v20 = sub_21E8DE72C(v19);
  swift_bridgeObjectRelease();
  a4(v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8DE72C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v61 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_21E8EE490();
  uint64_t v5 = *(void *)(v66 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v66, v6);
  uint64_t v51 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v50 = (char *)&v49 - v10;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344E8);
  uint64_t v12 = MEMORY[0x270FA5388](v62, v11);
  uint64_t v60 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  uint64_t v59 = (uint64_t)&v49 - v16;
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v58 = (char *)&v49 - v18;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v53 = a1 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  uint64_t v64 = v5;
  uint64_t v65 = v5 + 32;
  uint64_t v56 = v5 + 56;
  uint64_t v57 = v5 + 16;
  int64_t v54 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v55 = v5 + 48;
  uint64_t v63 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v24 = 0;
  unint64_t v52 = MEMORY[0x263F8EE78];
  uint64_t v25 = v66;
  while (1)
  {
    if (v22)
    {
      uint64_t v67 = (v22 - 1) & v22;
      int64_t v68 = v24;
      unint64_t v26 = __clz(__rbit64(v22)) | (v24 << 6);
      goto LABEL_5;
    }
    int64_t v39 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v39 >= v54) {
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v53 + 8 * v39);
    int64_t v41 = v24 + 1;
    if (!v40)
    {
      int64_t v41 = v24 + 2;
      if (v24 + 2 >= v54) {
        goto LABEL_30;
      }
      unint64_t v40 = *(void *)(v53 + 8 * v41);
      if (!v40)
      {
        int64_t v41 = v24 + 3;
        if (v24 + 3 >= v54) {
          goto LABEL_30;
        }
        unint64_t v40 = *(void *)(v53 + 8 * v41);
        if (!v40)
        {
          int64_t v41 = v24 + 4;
          if (v24 + 4 >= v54) {
            goto LABEL_30;
          }
          unint64_t v40 = *(void *)(v53 + 8 * v41);
          if (!v40) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v67 = (v40 - 1) & v40;
    int64_t v68 = v41;
    unint64_t v26 = __clz(__rbit64(v40)) + (v41 << 6);
LABEL_5:
    uint64_t v27 = v64;
    char v28 = *(unsigned char *)(*(void *)(v63 + 48) + v26);
    uint64_t v29 = *(void *)(v64 + 72);
    uint64_t v30 = v62;
    uint64_t v31 = v58;
    unsigned int v32 = *(void (**)(char *, unint64_t, uint64_t))(v64 + 16);
    v32(&v58[*(int *)(v62 + 48)], *(void *)(v63 + 56) + v29 * v26, v25);
    *uint64_t v31 = v28;
    uint64_t v33 = (uint64_t)v31;
    uint64_t v34 = v59;
    sub_21E8D9178(v33, v59, &qword_26AD344E8);
    uint64_t v35 = *(int *)(v30 + 48);
    uint64_t v36 = &v60[v35];
    v32(&v60[v35], v34 + v35, v25);
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    uint64_t v38 = (uint64_t)v61;
    v37(v61, v36, v25);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v38, 0, 1, v25);
    sub_21E8D911C(v34, &qword_26AD344E8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v38, 1, v25) == 1)
    {
      uint64_t result = sub_21E8D911C(v38, &qword_26AD34328);
    }
    else
    {
      uint64_t v43 = v50;
      uint64_t v44 = v66;
      v37(v50, (char *)v38, v66);
      v37(v51, v43, v44);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v52 = sub_21E8E6F68(0, *(void *)(v52 + 16) + 1, 1, v52);
      }
      unint64_t v46 = *(void *)(v52 + 16);
      unint64_t v45 = *(void *)(v52 + 24);
      if (v46 >= v45 >> 1) {
        unint64_t v52 = sub_21E8E6F68(v45 > 1, v46 + 1, 1, v52);
      }
      os_log_type_t v47 = v51;
      unint64_t v48 = v52;
      *(void *)(v52 + 16) = v46 + 1;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v37)(v48+ ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ v46 * v29, v47, v66);
    }
    int64_t v24 = v68;
    unint64_t v22 = v67;
  }
  uint64_t v42 = v24 + 5;
  if (v24 + 5 >= v54)
  {
LABEL_30:
    swift_release();
    return v52;
  }
  unint64_t v40 = *(void *)(v53 + 8 * v42);
  if (v40)
  {
    int64_t v41 = v24 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v41 = v42 + 1;
    if (__OFADD__(v42, 1)) {
      break;
    }
    if (v41 >= v54) {
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v53 + 8 * v41);
    ++v42;
    if (v40) {
      goto LABEL_24;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_21E8DEC6C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21E8DECB0(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (unsigned char *)(v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  uint64_t result = swift_beginAccess();
  if ((*v4 & 1) == 0)
  {
    double v20 = 3600.0;
    uint64_t v6 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_backoffInterval;
    if (a1)
    {
      *(void *)uint64_t v6 = 0;
      *(unsigned char *)(v6 + 8) = 1;
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_21E8EE570();
      __swift_project_value_buffer(v7, (uint64_t)qword_26AD34308);
      uint64_t v8 = sub_21E8EE550();
      os_log_type_t v9 = sub_21E8EEAF0();
      if (!os_log_type_enabled(v8, v9)) {
        goto LABEL_18;
      }
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      uint64_t v11 = "Resetting backoff.";
      uint64_t v12 = v8;
      os_log_type_t v13 = v9;
      uint64_t v14 = v10;
      uint32_t v15 = 2;
    }
    else
    {
      if (*(unsigned char *)(v6 + 8)) {
        double v16 = 600.0;
      }
      else {
        double v16 = *(double *)v6 + *(double *)v6;
      }
      if (v16 <= 86400.0) {
        double v17 = v16;
      }
      else {
        double v17 = 86400.0;
      }
      *(double *)uint64_t v6 = v17;
      *(unsigned char *)(v6 + 8) = 0;
      double v20 = v17;
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_21E8EE570();
      __swift_project_value_buffer(v18, (uint64_t)qword_26AD34308);
      uint64_t v8 = sub_21E8EE550();
      os_log_type_t v19 = sub_21E8EEAF0();
      if (!os_log_type_enabled(v8, v19)) {
        goto LABEL_18;
      }
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134217984;
      sub_21E8EEBF0();
      uint64_t v11 = "Incrementing backoff to %f seconds.";
      uint64_t v12 = v8;
      os_log_type_t v13 = v19;
      uint64_t v14 = v10;
      uint32_t v15 = 12;
    }
    _os_log_impl(&dword_21E8AA000, v12, v13, v11, v14, v15);
    MEMORY[0x223C355E0](v10, -1, -1);
LABEL_18:

    swift_beginAccess();
    return sub_21E8DEF20(v20);
  }
  return result;
}

uint64_t sub_21E8DEF20(double a1)
{
  uint64_t v2 = sub_21E8EE8E0();
  uint64_t v60 = *(void *)(v2 - 8);
  uint64_t v61 = v2;
  uint64_t v4 = MEMORY[0x270FA5388](v2, v3);
  uint64_t v59 = (char **)((char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v58 = (char **)((char *)&v55 - v7);
  uint64_t v68 = sub_21E8EE950();
  uint64_t v57 = *(void *)(v68 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v68, v8);
  uint64_t v66 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v56 = (char *)&v55 - v12;
  uint64_t v65 = sub_21E8EE8F0();
  uint64_t v69 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65, v13);
  uint32_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21E8EE910();
  uint64_t v63 = *(void *)(v16 - 8);
  uint64_t v64 = v16;
  MEMORY[0x270FA5388](v16, v17);
  os_log_type_t v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_21E8EEB80();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20, v22);
  int64_t v24 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8ED270(0, &qword_26AD34528);
  aBlocunint64_t k = MEMORY[0x263F8EE78];
  sub_21E8ED7B8(&qword_26AD34520, MEMORY[0x263F8F148]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34508);
  sub_21E8D8F68((unint64_t *)&unk_26AD34510, &qword_26AD34508);
  sub_21E8EEC20();
  uint64_t v25 = sub_21E8EEB90();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v27 = swift_allocObject();
  char v28 = v67;
  *(void *)(v27 + 16) = v67;
  uint64_t v74 = sub_21E8ED2AC;
  uint64_t v75 = v27;
  aBlocunint64_t k = MEMORY[0x263EF8330];
  uint64_t v71 = 1107296256;
  uint64_t v62 = &v72;
  os_log_type_t v72 = sub_21E8DA510;
  uint64_t v73 = &block_descriptor_80;
  uint64_t v29 = _Block_copy(&aBlock);
  uint64_t v55 = v28;
  uint64_t v30 = v19;
  sub_21E8EE900();
  sub_21E8DFDF8();
  sub_21E8EEBA0();
  _Block_release(v29);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v69 + 8);
  v69 += 8;
  uint64_t v32 = v65;
  v31(v15, v65);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v34 = v19;
  uint64_t v35 = v64;
  v33(v34, v64);
  swift_release();
  uint64_t v74 = sub_21E8DFD10;
  uint64_t v75 = 0;
  aBlocunint64_t k = MEMORY[0x263EF8330];
  uint64_t v71 = 1107296256;
  os_log_type_t v72 = sub_21E8DA510;
  uint64_t v73 = &block_descriptor_83;
  uint64_t v36 = _Block_copy(&aBlock);
  sub_21E8EE900();
  sub_21E8DFDF8();
  uint64_t v63 = ObjectType;
  uint64_t v67 = (void *)v25;
  sub_21E8EEBB0();
  _Block_release(v36);
  v31(v15, v32);
  v33(v30, v35);
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_21E8EE570();
  __swift_project_value_buffer(v37, (uint64_t)qword_26AD34308);
  uint64_t v38 = sub_21E8EE550();
  os_log_type_t v39 = sub_21E8EEAF0();
  if (os_log_type_enabled(v38, v39))
  {
    unint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v40 = 134217984;
    aBlocunint64_t k = a1;
    sub_21E8EEBF0();
    _os_log_impl(&dword_21E8AA000, v38, v39, "Setting up DispatchSourceTimer with %f seconds.", v40, 0xCu);
    MEMORY[0x223C355E0](v40, -1, -1);
  }

  int64_t v41 = v66;
  uint64_t result = sub_21E8EE940();
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v43 = v58;
  *uint64_t v58 = (uint64_t)a1;
  uint64_t v45 = v60;
  uint64_t v44 = v61;
  unint64_t v46 = *(void (**)(void *, void, uint64_t))(v60 + 104);
  v46(v43, *MEMORY[0x263F8F018], v61);
  os_log_type_t v47 = v56;
  MEMORY[0x223C34610](v41, v43);
  unint64_t v48 = *(void (**)(void *, uint64_t))(v45 + 8);
  v48(v43, v44);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v57 + 8);
  v49(v41, v68);
  v46(v43, *MEMORY[0x263F8F010], v44);
  uint64_t v50 = v59;
  *uint64_t v59 = 0;
  v46(v50, *MEMORY[0x263F8EFE0], v44);
  MEMORY[0x223C34880](v47, v43, v50, v63);
  v48(v50, v44);
  v48(v43, v44);
  uint64_t v51 = v47;
  unint64_t v52 = v67;
  v49(v51, v68);
  sub_21E8EEBD0();
  uint64_t v53 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer;
  int64_t v54 = v55;
  if (*(void *)&v55[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21E8EEBC0();
    swift_unknownObjectRelease();
  }
  *(void *)&v54[v53] = v52;
  return swift_unknownObjectRelease();
}

uint64_t sub_21E8DF780(char *a1)
{
  uint64_t v2 = sub_21E8EE8F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21E8EE910();
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21E8EE570();
  __swift_project_value_buffer(v11, (uint64_t)qword_26AD34308);
  uint64_t v12 = sub_21E8EE550();
  os_log_type_t v13 = sub_21E8EEAF0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21E8AA000, v12, v13, "DispatchSourceTimer triggered.", v14, 2u);
    MEMORY[0x223C355E0](v14, -1, -1);
  }

  *(void *)&a1[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer] = 0;
  swift_unknownObjectRelease();
  uint64_t result = sub_21E8DD2B4();
  if (result)
  {
    uint64_t v16 = sub_21E8EE550();
    os_log_type_t v17 = sub_21E8EEAF0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v28 = v7;
    if (v18)
    {
      uint64_t v27 = v3;
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      aBlock[0] = v20;
      *(_DWORD *)os_log_type_t v19 = 136315138;
      if (qword_26AD34420 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_21E8EE9F0();
      uint64_t v30 = sub_21E8CD144(v21, v22, aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E8AA000, v16, v17, "Posting %s.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v20, -1, -1);
      MEMORY[0x223C355E0](v19, -1, -1);

      uint64_t v3 = v27;
    }
    else
    {
    }
    sub_21E8ED270(0, &qword_26AD34480);
    uint64_t v23 = (void *)sub_21E8EEB40();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = a1;
    aBlock[4] = (uint64_t)sub_21E8ED2B4;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21E8DA510;
    aBlock[3] = (uint64_t)&block_descriptor_89;
    uint64_t v25 = _Block_copy(aBlock);
    unint64_t v26 = a1;
    swift_release();
    sub_21E8EE900();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v10, v6, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v10, v28);
  }
  return result;
}

void sub_21E8DFC70()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  id v1 = v0;
  if (qword_26AD34420 != -1)
  {
    swift_once();
    id v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_, qword_26AD34410, 0);
}

void sub_21E8DFD10()
{
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21E8EE570();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD34308);
  oslog = sub_21E8EE550();
  os_log_type_t v1 = sub_21E8EEAF0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_21E8AA000, oslog, v1, "DispatchSourceTimer cancelled.", v2, 2u);
    MEMORY[0x223C355E0](v2, -1, -1);
  }
}

uint64_t sub_21E8DFDF8()
{
  return sub_21E8EEC20();
}

uint64_t sub_21E8DFED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = a2 + 16;
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x223C35660](v6);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = *(id *)(v7 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);

    MEMORY[0x270FA5388](v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34558);
    sub_21E8EEB50();
  }
  return a4(a1);
}

void sub_21E8DFFE0(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x223C35660](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    swift_beginAccess();
    sub_21E8E8AF8(a2, &v8);
    swift_endAccess();
  }
  *a3 = 0;
}

uint64_t sub_21E8E008C(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v94 = sub_21E8EE570();
  uint64_t v4 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94, v5);
  uint64_t v93 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34330);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v89 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_21E8EE4D0();
  uint64_t v90 = *(void *)(v91 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v91, v10);
  uint64_t v87 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  float v88 = (char *)&v87 - v14;
  uint64_t v15 = sub_21E8EE490();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v15, v17);
  uint64_t v20 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v21);
  uint64_t v23 = (char *)&v87 - v22;
  uint64_t v24 = *a1;
  uint64_t v92 = (char)v24;
  switch(v24)
  {
    case 4:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    default:
      char v25 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      if (v25)
      {
LABEL_5:
        uint64_t v27 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v23, v27, v15);
        LOBYTE(v96) = v24;
        sub_21E8DAB3C();
        sub_21E8EE440();
        swift_bridgeObjectRelease();
        sub_21E8EE450();
      }
      else
      {
        uint64_t v26 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v20, v26, v15);
        LOBYTE(v96) = v24;
        sub_21E8DAB3C();
        sub_21E8EE440();
        swift_bridgeObjectRelease();
        sub_21E8EE450();
        uint64_t v23 = v20;
      }
      uint64_t v28 = sub_21E8EE470();
      unint64_t v30 = v29;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
      uint64_t v31 = (uint64_t *)(v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_operationsInProgress);
      unint64_t v32 = v30;
      swift_beginAccess();
      uint64_t v33 = *v31;
      swift_bridgeObjectRetain();
      int v34 = sub_21E8E0DBC(v24, v33);
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0)
      {
        uint64_t v35 = self;
        id v36 = objc_msgSend(v35, sel_defaultManager);
        uint64_t v37 = (void *)sub_21E8EE9C0();
        unsigned int v38 = objc_msgSend(v36, sel_fileExistsAtPath_, v37);

        if (v38)
        {
          uint64_t v39 = v91;
          id v40 = objc_msgSend(v35, sel_defaultManager);
          int64_t v41 = (void *)sub_21E8EE9C0();
          *(void *)&long long v96 = 0;
          id v42 = objc_msgSend(v40, sel_attributesOfItemAtPath_error_, v41, &v96);

          uint64_t v43 = (void *)v96;
          if (v42)
          {
            type metadata accessor for FileAttributeKey();
            sub_21E8ED7B8(&qword_267D47F20, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
            uint64_t v44 = sub_21E8EE990();
            id v45 = v43;

            if (*(void *)(v44 + 16))
            {
              id v46 = (id)*MEMORY[0x263F08048];
              unint64_t v47 = sub_21E8D2A80((uint64_t)v46);
              uint64_t v48 = v39;
              uint64_t v49 = v90;
              uint64_t v50 = (uint64_t)v89;
              if (v51)
              {
                sub_21E8CD820(*(void *)(v44 + 56) + 32 * v47, (uint64_t)&v96);
              }
              else
              {
                long long v96 = 0u;
                long long v97 = 0u;
              }
            }
            else
            {
              long long v96 = 0u;
              long long v97 = 0u;
              uint64_t v48 = v39;
              uint64_t v49 = v90;
              uint64_t v50 = (uint64_t)v89;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v97 + 1))
            {
              int v75 = swift_dynamicCast();
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56))(v50, v75 ^ 1u, 1, v48);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v50, 1, v48) != 1)
              {
                swift_bridgeObjectRelease();
                unint64_t v76 = v88;
                (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v88, v50, v48);
                uint64_t v77 = v87;
                sub_21E8EE4C0();
                sub_21E8EE4A0();
                double v79 = v78;
                uint64_t v80 = *(void (**)(char *, uint64_t))(v49 + 8);
                v80(v77, v48);
                sub_21E8EE4A0();
                double v82 = v81;
                v80(v76, v48);
                LOBYTE(v49) = v79 - v82 > 3600.0;
                return v49 & 1;
              }
            }
            else
            {
              sub_21E8D911C((uint64_t)&v96, &qword_26AD344B0);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v50, 1, 1, v48);
            }
            sub_21E8D911C(v50, &qword_26AD34330);
            if (qword_26AD34320 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v94, (uint64_t)qword_26AD34308);
            swift_bridgeObjectRetain();
            uint64_t v69 = sub_21E8EE550();
            os_log_type_t v83 = sub_21E8EEAD0();
            if (os_log_type_enabled(v69, v83))
            {
              uint64_t v84 = (uint8_t *)swift_slowAlloc();
              uint64_t v85 = swift_slowAlloc();
              *(void *)&long long v96 = v85;
              *(_DWORD *)uint64_t v84 = 136315138;
              swift_bridgeObjectRetain();
              uint64_t v95 = sub_21E8CD144(v28, v32, (uint64_t *)&v96);
              sub_21E8EEBF0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_21E8AA000, v69, v83, "No last modified data attribute for file. This may cause serious issues in refresh policy. File: %s", v84, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x223C355E0](v85, -1, -1);
              MEMORY[0x223C355E0](v84, -1, -1);
LABEL_34:

              goto LABEL_35;
            }

            swift_bridgeObjectRelease_n();
          }
          else
          {
            uint64_t v64 = v28;
            id v65 = (id)v96;
            uint64_t v66 = (void *)sub_21E8EE400();

            swift_willThrow();
            if (qword_26AD34320 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v94, (uint64_t)qword_26AD34308);
            id v67 = v66;
            swift_bridgeObjectRetain();
            id v68 = v66;
            uint64_t v69 = sub_21E8EE550();
            os_log_type_t v70 = sub_21E8EEAD0();
            if (!os_log_type_enabled(v69, v70))
            {

              swift_bridgeObjectRelease_n();
              goto LABEL_34;
            }
            uint64_t v71 = swift_slowAlloc();
            uint64_t v72 = swift_slowAlloc();
            *(void *)&long long v96 = v72;
            *(_DWORD *)uint64_t v71 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v95 = sub_21E8CD144(v64, v32, (uint64_t *)&v96);
            sub_21E8EEBF0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v71 + 12) = 2080;
            swift_getErrorValue();
            uint64_t v73 = sub_21E8EED70();
            uint64_t v95 = sub_21E8CD144(v73, v74, (uint64_t *)&v96);
            sub_21E8EEBF0();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_21E8AA000, v69, v70, "No last modified data attribute for file %s. Error: %s", (uint8_t *)v71, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x223C355E0](v72, -1, -1);
            MEMORY[0x223C355E0](v71, -1, -1);
          }
LABEL_35:
          LOBYTE(v49) = 0;
          return v49 & 1;
        }
      }
      LODWORD(v49) = v34 ^ 1;
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v52 = v94;
      uint64_t v53 = __swift_project_value_buffer(v94, (uint64_t)qword_26AD34308);
      uint64_t v54 = v4;
      uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      uint64_t v56 = v93;
      v55(v93, v53, v52);
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_21E8EE550();
      os_log_type_t v58 = sub_21E8EEAC0();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = swift_slowAlloc();
        LODWORD(v91) = v49;
        uint64_t v49 = v54;
        uint64_t v60 = v59;
        uint64_t v61 = swift_slowAlloc();
        *(void *)&long long v96 = v61;
        uint64_t v62 = v92;
        uint64_t v63 = *(void *)&aTotal_2[8 * v92];
        *(_DWORD *)uint64_t v60 = 136315394;
        uint64_t v95 = sub_21E8CD144(v63, qword_21E910488[v62], (uint64_t *)&v96);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v95 = sub_21E8CD144(v28, v32, (uint64_t *)&v96);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21E8AA000, v57, v58, "Cached file for %s not found. File Name: %s", (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v61, -1, -1);
        MEMORY[0x223C355E0](v60, -1, -1);

        (*(void (**)(char *, uint64_t))(v49 + 8))(v93, v94);
        LOBYTE(v49) = v91;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v52);
      }
      return v49 & 1;
  }
}

uint64_t sub_21E8E0DBC(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (sub_21E8EEDC0(),
        sub_21E8EEA10(),
        swift_bridgeObjectRelease(),
        uint64_t v4 = sub_21E8EEDE0(),
        uint64_t v5 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v6 = v4 & ~v5,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = a1;
    uint64_t v9 = *(void *)&aTotal_2[v8 * 8];
    uint64_t v10 = qword_21E910488[v8];
    while (*(void *)&aTotal_2[8 * *(char *)(*(void *)(a2 + 48) + v6)] != v9
         || qword_21E910488[*(char *)(*(void *)(a2 + 48) + v6)] != v10)
    {
      char v12 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v6 = (v6 + 1) & v7;
        if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6)) {
          continue;
        }
      }
      return v12 & 1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_21E8E0F1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34330);
  MEMORY[0x270FA5388](v1 - 8, v2);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E8EE4D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  id v40 = (char *)&v37 - v12;
  uint64_t v13 = sub_21E8EE8F0();
  uint64_t v39 = *(uint64_t *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_21E8EE910();
  uint64_t v17 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38, v18);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_21E8DD2B4())
  {
    sub_21E8ED270(0, &qword_26AD34480);
    uint64_t v21 = (void *)sub_21E8EEB40();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v0;
    aBlock[4] = sub_21E8ED268;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21E8DA510;
    aBlock[3] = &block_descriptor_74;
    uint64_t v23 = _Block_copy(aBlock);
    id v24 = v0;
    swift_release();
    sub_21E8EE900();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v20, v16, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v38);
  }
  else
  {
    sub_21E8E1D00((uint64_t)v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      return sub_21E8D911C((uint64_t)v4, &qword_26AD34330);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v40, v4, v5);
      sub_21E8EE4C0();
      sub_21E8EE4A0();
      double v27 = v26;
      uint64_t v28 = *(void (**)(char *, uint64_t))(v6 + 8);
      v28(v10, v5);
      sub_21E8EE4A0();
      double v30 = v29 - v27;
      double v31 = 3600.0;
      if (qword_26AD34320 != -1)
      {
        *(double *)&uint64_t v39 = 3600.0;
        swift_once();
        double v31 = *(double *)&v39;
      }
      double v32 = v30 + v31;
      uint64_t v33 = sub_21E8EE570();
      __swift_project_value_buffer(v33, (uint64_t)qword_26AD34308);
      int v34 = sub_21E8EE550();
      os_log_type_t v35 = sub_21E8EEAF0();
      if (os_log_type_enabled(v34, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)id v36 = 134217984;
        *(double *)aBlocunint64_t k = v32;
        sub_21E8EEBF0();
        _os_log_impl(&dword_21E8AA000, v34, v35, "Scheduling time to check for clouds textures expiration. Remaining interval %f", v36, 0xCu);
        MEMORY[0x223C355E0](v36, -1, -1);
      }

      sub_21E8DEF20(v32);
      return ((uint64_t (*)(char *, uint64_t))v28)(v40, v5);
    }
  }
}

void sub_21E8E14B0()
{
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21E8EE570();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD34308);
  uint64_t v1 = sub_21E8EE550();
  os_log_type_t v2 = sub_21E8EEAF0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21E8AA000, v1, v2, "Clouds textures expired.", v3, 2u);
    MEMORY[0x223C355E0](v3, -1, -1);
  }

  id v4 = objc_msgSend(self, sel_defaultCenter);
  id v5 = v4;
  if (qword_26AD34420 != -1)
  {
    swift_once();
    id v4 = v5;
  }
  objc_msgSend(v4, sel_postNotificationName_object_, qword_26AD34410, 0);
}

uint64_t sub_21E8E1614@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34330);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E8EE490();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  uint64_t v14 = v2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  LOBYTE(v49) = (_BYTE)a1;
  sub_21E8DAB3C();
  sub_21E8EE440();
  swift_bridgeObjectRelease();
  sub_21E8EE450();
  uint64_t v15 = sub_21E8EE470();
  unint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  uint64_t v18 = self;
  id v19 = objc_msgSend(v18, sel_defaultManager);
  uint64_t v20 = (void *)sub_21E8EE9C0();
  LODWORD(v10) = objc_msgSend(v19, sel_fileExistsAtPath_, v20);

  if (v10)
  {
    id v21 = objc_msgSend(v18, sel_defaultManager);
    uint64_t v22 = (void *)sub_21E8EE9C0();
    *(void *)&long long v49 = 0;
    id v23 = objc_msgSend(v21, sel_attributesOfItemAtPath_error_, v22, &v49);

    id v24 = (id)v49;
    if (v23)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for FileAttributeKey();
      sub_21E8ED7B8(&qword_267D47F20, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
      uint64_t v25 = sub_21E8EE990();

      if (*(void *)(v25 + 16))
      {
        id v26 = (id)*MEMORY[0x263F08048];
        unint64_t v27 = sub_21E8D2A80((uint64_t)v26);
        if (v28)
        {
          sub_21E8CD820(*(void *)(v25 + 56) + 32 * v27, (uint64_t)&v49);
        }
        else
        {
          long long v49 = 0u;
          long long v50 = 0u;
        }
      }
      else
      {
        long long v49 = 0u;
        long long v50 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v50 + 1))
      {
        uint64_t v40 = sub_21E8EE4D0();
        int v41 = swift_dynamicCast();
        uint64_t v42 = *(void *)(v40 - 8);
        uint64_t v43 = *(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56);
        v43(v8, v41 ^ 1u, 1, v40);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v8, 1, v40) != 1)
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(a2, v8, v40);
          return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v43)(a2, 0, 1, v40);
        }
      }
      else
      {
        sub_21E8D911C((uint64_t)&v49, &qword_26AD344B0);
        uint64_t v45 = sub_21E8EE4D0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v8, 1, 1, v45);
      }
      sub_21E8D911C((uint64_t)v8, &qword_26AD34330);
    }
    else
    {
      double v29 = v24;
      double v30 = (void *)sub_21E8EE400();

      swift_willThrow();
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_21E8EE570();
      __swift_project_value_buffer(v31, (uint64_t)qword_26AD34308);
      id v32 = v30;
      id v33 = v30;
      swift_bridgeObjectRetain();
      int v34 = sub_21E8EE550();
      os_log_type_t v35 = sub_21E8EEAD0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        *(void *)&long long v49 = v37;
        *(_DWORD *)uint64_t v36 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v48 = sub_21E8CD144(v15, v17, (uint64_t *)&v49);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v36 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v38 = sub_21E8EED70();
        uint64_t v48 = sub_21E8CD144(v38, v39, (uint64_t *)&v49);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21E8AA000, v34, v35, "No last modified data attribute for file %s. Error: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v37, -1, -1);
        MEMORY[0x223C355E0](v36, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v46 = sub_21E8EE4D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(a2, 1, 1, v46);
}

uint64_t sub_21E8E1D00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34330);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  uint64_t v44 = (char *)&v42 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  uint64_t v53 = (uint64_t)&v42 - v13;
  MEMORY[0x270FA5388](v12, v14);
  unint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = sub_21E8EE4D0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17, v19);
  id v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56);
  uint64_t v45 = a1;
  uint64_t v46 = v22;
  uint64_t v47 = v18 + 56;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(a1, 1, 1, v17);
  if (qword_26AD34380 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v24 = qword_26AD347E8;
  uint64_t v25 = *(void *)(qword_26AD347E8 + 16);
  if (v25)
  {
    uint64_t v55 = (uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
    uint64_t v56 = v17;
    uint64_t v54 = (void (**)(char *, char *, uint64_t))(v18 + 32);
    uint64_t v42 = (void (**)(uint64_t, uint64_t))(v18 + 8);
    uint64_t v43 = v7;
    swift_bridgeObjectRetain();
    uint64_t v26 = 0;
    uint64_t v27 = v45;
    uint64_t v50 = v24;
    uint64_t v51 = v16;
    uint64_t v48 = v1;
    uint64_t v49 = v25;
    uint64_t v52 = v21;
    while (1)
    {
      char v57 = *(unsigned char *)(v24 + v26 + 32);
      sub_21E8E1614(&v57, (uint64_t)v16);
      uint64_t v28 = v56;
      double v29 = *v55;
      if ((*v55)(v16, 1, v56) == 1)
      {
        sub_21E8D911C((uint64_t)v16, &qword_26AD34330);
      }
      else
      {
        double v30 = *v54;
        (*v54)(v21, v16, v28);
        uint64_t v31 = v53;
        uint64_t v32 = v28;
        sub_21E8D90B8(v27, v53, &qword_26AD34330);
        int v33 = v29((char *)v31, 1, v28);
        sub_21E8D911C(v31, &qword_26AD34330);
        if (v33 == 1)
        {
          sub_21E8D911C(v27, &qword_26AD34330);
          id v21 = v52;
          v30((char *)v27, v52, v28);
          v46(v27, 0, 1, v28);
          uint64_t v24 = v50;
          unint64_t v16 = v51;
          uint64_t v25 = v49;
        }
        else
        {
          int v34 = v30;
          os_log_type_t v35 = v52;
          uint64_t v36 = v27;
          uint64_t v37 = (uint64_t)v43;
          sub_21E8D90B8(v36, (uint64_t)v43, &qword_26AD34330);
          uint64_t result = v29((char *)v37, 1, v28);
          if (result == 1)
          {
            __break(1u);
            return result;
          }
          uint64_t v38 = v35;
          char v39 = sub_21E8EE4B0();
          uint64_t v40 = *v42;
          (*v42)(v37, v32);
          if (v39)
          {
            uint64_t v27 = v45;
            sub_21E8D911C(v45, &qword_26AD34330);
            uint64_t v41 = (uint64_t)v44;
            v34(v44, v35, v32);
            v46(v41, 0, 1, v32);
          }
          else
          {
            v40((uint64_t)v35, v32);
            uint64_t v41 = (uint64_t)v44;
            uint64_t v27 = v45;
            sub_21E8D9178(v45, (uint64_t)v44, &qword_26AD34330);
          }
          uint64_t v25 = v49;
          uint64_t v24 = v50;
          id v21 = v38;
          sub_21E8D9178(v41, v27, &qword_26AD34330);
          unint64_t v16 = v51;
        }
      }
      if (v25 == ++v26) {
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21E8E2160(uint64_t a1, void (*a2)(char *), void (*a3)(void, void), uint64_t a4, uint64_t a5, void *a6, uint64_t a7, double a8)
{
  uint64_t v80 = a7;
  double v82 = a6;
  uint64_t v94 = a5;
  uint64_t v92 = a4;
  long long v96 = a2;
  long long v97 = a3;
  uint64_t v10 = sub_21E8EE8F0();
  uint64_t v89 = *(void *)(v10 - 8);
  uint64_t v90 = v10;
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v87 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_21E8EE910();
  uint64_t v86 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88, v13);
  uint64_t v85 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_21E8EE930();
  uint64_t v84 = *(void *)(v93 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v93, v15);
  double v81 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v18);
  os_log_type_t v83 = (char *)&v79 - v19;
  uint64_t v20 = sub_21E8EE570();
  uint64_t v95 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20, v21);
  uint64_t v24 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22, v25);
  uint64_t v91 = (char *)&v79 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v27 - 8, v28);
  double v30 = (char *)&v79 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_21E8EE490();
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31, v33);
  os_log_type_t v35 = (char *)&v79 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v36, v37);
  char v39 = (char *)&v79 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8D90B8(a1, (uint64_t)v39, (uint64_t *)&unk_26AD34548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (*v39 != 1 || v92 == 0)
    {
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v41 = __swift_project_value_buffer(v20, (uint64_t)qword_26AD34308);
      uint64_t v42 = v95;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v24, v41, v20);
      uint64_t v43 = sub_21E8EE550();
      os_log_type_t v44 = sub_21E8EEAD0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v79 = v20;
        uint64_t v46 = (uint8_t *)v45;
        uint64_t v47 = swift_slowAlloc();
        uint64_t v93 = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        uint64_t v48 = (char)v94;
        uint64_t v49 = *(void *)&aTotal_2[v48 * 8];
        aBlock[0] = v47;
        uint64_t v100 = sub_21E8CD144(v49, qword_21E910488[v48], aBlock);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21E8AA000, v43, v44, "Exhausted retry attempts for %s", v46, 0xCu);
        uint64_t v50 = v93;
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v50, -1, -1);
        MEMORY[0x223C355E0](v46, -1, -1);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v24, v79);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v20);
      }
      id v65 = v96;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v30, 1, 1, v31);
      v65(v30);
      return sub_21E8D911C((uint64_t)v30, &qword_26AD34328);
    }
    else
    {
      uint64_t v52 = v92;
      v80 += 16;
      char v53 = v94;
      uint64_t v54 = v20;
      if (qword_26AD34320 != -1) {
        swift_once();
      }
      uint64_t v55 = __swift_project_value_buffer(v20, (uint64_t)qword_26AD34308);
      uint64_t v56 = v95;
      char v57 = v91;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v91, v55, v54);
      os_log_type_t v58 = sub_21E8EE550();
      os_log_type_t v59 = sub_21E8EEAF0();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = swift_slowAlloc();
        uint64_t v79 = v54;
        uint64_t v61 = v60;
        uint64_t v62 = swift_slowAlloc();
        aBlock[0] = v62;
        uint64_t v63 = v53;
        uint64_t v64 = *(void *)&aTotal_2[v63 * 8];
        *(_DWORD *)uint64_t v61 = 136315650;
        uint64_t v100 = sub_21E8CD144(v64, qword_21E910488[v63], aBlock);
        char v53 = v94;
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2048;
        uint64_t v100 = v52;
        sub_21E8EEBF0();
        *(_WORD *)(v61 + 22) = 2048;
        uint64_t v100 = *(void *)&a8;
        sub_21E8EEBF0();
        _os_log_impl(&dword_21E8AA000, v58, v59, "Attempting to retry download for %s. Remaining retries: %ld. Backoff period: %f", (uint8_t *)v61, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v62, -1, -1);
        MEMORY[0x223C355E0](v61, -1, -1);

        (*(void (**)(char *, uint64_t))(v56 + 8))(v91, v79);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v54);
      }
      uint64_t v66 = v96;
      id v67 = v97;
      id v68 = v81;
      sub_21E8EE920();
      uint64_t v69 = v83;
      MEMORY[0x223C34600](v68, a8);
      long long v97 = *(void (**)(void, void))(v84 + 8);
      v97(v68, v93);
      uint64_t v70 = swift_allocObject();
      uint64_t v71 = v80;
      swift_beginAccess();
      uint64_t v72 = (void *)MEMORY[0x223C35660](v71);
      swift_unknownObjectWeakInit();

      uint64_t v73 = swift_allocObject();
      *(void *)(v73 + 16) = v70;
      *(unsigned char *)(v73 + 24) = v53;
      unint64_t v74 = v82;
      *(void *)(v73 + 32) = v82;
      *(void *)(v73 + 40) = v52;
      *(double *)(v73 + 48) = a8;
      *(void *)(v73 + 56) = v66;
      *(void *)(v73 + 64) = v67;
      aBlock[4] = (uint64_t)sub_21E8ED688;
      aBlock[5] = v73;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21E8DA510;
      aBlock[3] = (uint64_t)&block_descriptor_190;
      int v75 = _Block_copy(aBlock);
      swift_retain();
      v74;
      swift_retain();
      unint64_t v76 = v85;
      sub_21E8EE900();
      uint64_t v98 = MEMORY[0x263F8EE78];
      sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
      sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
      uint64_t v77 = v87;
      uint64_t v78 = v90;
      sub_21E8EEC20();
      MEMORY[0x223C347C0](v69, v76, v77, v75);
      _Block_release(v75);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v77, v78);
      (*(void (**)(char *, uint64_t))(v86 + 8))(v76, v88);
      v97(v69, v93);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    (*(void (**)(char *, unsigned char *, uint64_t))(v32 + 32))(v35, v39, v31);
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v30, v35, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v30, 0, 1, v31);
    v96(v30);
    sub_21E8D911C((uint64_t)v30, &qword_26AD34328);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
  }
}

void sub_21E8E2CB4(uint64_t a1, int a2, void *a3, uint64_t a4, void (*a5)(char *), void (*a6)(void, void), double a7)
{
  uint64_t v13 = a1 + 16;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x223C35660](v13);
  if (v14)
  {
    uint64_t v15 = (char *)v14;
    char v18 = a2;
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    id v17 = a3;
    sub_21E8EBCD8(&v18, v17, v15, a5, a6, a4 - (a4 > 0), a2, v17, a7, v16);

    swift_release();
    swift_release();
  }
}

uint64_t sub_21E8E2DC0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v127 = a8;
  uint64_t v135 = a6;
  uint64_t v136 = a7;
  uint64_t v137 = a5;
  uint64_t v131 = sub_21E8EE8F0();
  uint64_t v130 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131, v12);
  double v133 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  float32x4_t v134 = (void *)sub_21E8EE910();
  uint64_t v129 = *(v134 - 1);
  MEMORY[0x270FA5388](v134, v14);
  double v132 = (char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v16 - 8, v17);
  uint64_t v19 = (char *)&v121 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_21E8EE490();
  uint64_t v124 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125, v20);
  uint64_t v22 = (char *)&v121 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_21E8EE570();
  uint64_t v128 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23, v24);
  uint64_t v27 = (char *)&v121 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v25, v28);
  uint64_t v31 = (char *)&v121 - v30;
  MEMORY[0x270FA5388](v29, v32);
  uint64_t v34 = (char *)&v121 - v33;
  swift_beginAccess();
  os_log_type_t v35 = (void *)MEMORY[0x223C35660](a4 + 16);
  if (!v35)
  {
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v23, (uint64_t)qword_26AD34308);
    id v68 = sub_21E8EE550();
    os_log_type_t v69 = sub_21E8EEAD0();
    BOOL v70 = os_log_type_enabled(v68, v69);
    uint64_t v71 = v136;
    uint64_t v72 = v135;
    uint64_t v73 = v131;
    unint64_t v74 = v134;
    uint64_t v75 = v129;
    if (v70)
    {
      unint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v76 = 0;
      _os_log_impl(&dword_21E8AA000, v68, v69, "AegirCloudCoverService instance went away. Server response ignored.", v76, 2u);
      MEMORY[0x223C355E0](v76, -1, -1);
    }

    uint64_t v77 = swift_allocObject();
    *(void *)(v77 + 16) = v72;
    *(void *)(v77 + 24) = v71;
    float v143 = sub_21E8EDA00;
    uint64_t v144 = (void *)v77;
    aBlocunint64_t k = MEMORY[0x263EF8330];
    uint64_t v140 = 1107296256;
    float32x4_t v141 = sub_21E8DA510;
    double v142 = &block_descriptor_145;
    uint64_t v78 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v79 = v132;
    sub_21E8EE900();
    uint64_t v138 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    uint64_t v80 = v133;
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v79, v80, v78);
    _Block_release(v78);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v80, v73);
    (*(void (**)(char *, void *))(v75 + 8))(v79, v74);
    return swift_release();
  }
  id v126 = v35;
  if (!a2 || (self, (uint64_t v36 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v55 = __swift_project_value_buffer(v23, (uint64_t)qword_26AD34308);
    uint64_t v56 = v128;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v34, v55, v23);
    id v57 = a3;
    id v58 = a3;
    os_log_type_t v59 = sub_21E8EE550();
    os_log_type_t v60 = sub_21E8EEAD0();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      aBlocunint64_t k = v62;
      uint64_t v63 = (char)v127;
      uint64_t v64 = *(void *)&aTotal_2[v63 * 8];
      *(_DWORD *)uint64_t v61 = 136315394;
      uint64_t v138 = sub_21E8CD144(v64, qword_21E910488[v63], &aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2080;
      if (a3)
      {
        swift_getErrorValue();
        uint64_t v65 = sub_21E8EED70();
        unint64_t v67 = v66;
      }
      else
      {
        uint64_t v65 = 0;
        unint64_t v67 = 0xE000000000000000;
      }
      uint64_t v138 = sub_21E8CD144(v65, v67, &aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21E8AA000, v59, v60, "Failed to download cloud data: %s. It did not received a http response. Error: %s.", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v62, -1, -1);
      MEMORY[0x223C355E0](v61, -1, -1);

      (*(void (**)(char *, uint64_t))(v128 + 8))(v34, v23);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v56 + 8))(v34, v23);
    }
    uint64_t v86 = v136;
    uint64_t v87 = v135;
    uint64_t v88 = v131;
    uint64_t v89 = v130;
    uint64_t v84 = v129;
    uint64_t v90 = swift_allocObject();
    *(void *)(v90 + 16) = v87;
    *(void *)(v90 + 24) = v86;
    float v143 = sub_21E8ED5B8;
    uint64_t v144 = (void *)v90;
    aBlocunint64_t k = MEMORY[0x263EF8330];
    uint64_t v140 = 1107296256;
    float32x4_t v141 = sub_21E8DA510;
    double v142 = &block_descriptor_151;
    uint64_t v91 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v92 = v132;
    sub_21E8EE900();
    uint64_t v138 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    uint64_t v93 = v133;
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v92, v93, v91);

    _Block_release(v91);
    (*(void (**)(char *, uint64_t))(v89 + 8))(v93, v88);
    goto LABEL_31;
  }
  uint64_t v37 = (void *)v36;
  id v38 = a2;
  uint64_t v39 = v128;
  uint64_t v123 = (uint64_t)v37;
  if (a3 || (char *)objc_msgSend(v37, sel_statusCode) - 200 > (char *)0x63)
  {
LABEL_8:
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v42 = __swift_project_value_buffer(v23, (uint64_t)qword_26AD34308);
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v27, v42, v23);
    id v43 = a3;
    id v44 = v38;
    id v45 = a3;
    id v46 = v44;
    uint64_t v47 = sub_21E8EE550();
    int v48 = sub_21E8EEAD0();
    if (os_log_type_enabled(v47, (os_log_type_t)v48))
    {
      LODWORD(v122) = v48;
      uint64_t v49 = swift_slowAlloc();
      uint64_t v124 = swift_slowAlloc();
      uint64_t v125 = swift_slowAlloc();
      aBlocunint64_t k = v125;
      uint64_t v50 = (char)v127;
      uint64_t v51 = *(void *)&aTotal_2[v50 * 8];
      *(_DWORD *)uint64_t v49 = 136315650;
      uint64_t v138 = sub_21E8CD144(v51, qword_21E910488[v50], &aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      if (a3)
      {
        swift_getErrorValue();
        uint64_t v52 = sub_21E8EED70();
        unint64_t v54 = v53;
      }
      else
      {
        uint64_t v52 = 0;
        unint64_t v54 = 0xE000000000000000;
      }
      uint64_t v138 = sub_21E8CD144(v52, v54, &aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v49 + 22) = 2112;
      uint64_t v85 = v123;
      uint64_t v138 = v123;
      id v94 = v46;
      sub_21E8EEBF0();
      uint64_t v95 = v124;
      *(void *)uint64_t v124 = v85;

      _os_log_impl(&dword_21E8AA000, v47, (os_log_type_t)v122, "Failed to download cloud data: %s. Error: %s, Response: %@", (uint8_t *)v49, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D482B0);
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v95, -1, -1);
      uint64_t v96 = v125;
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v96, -1, -1);
      MEMORY[0x223C355E0](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v128 + 8))(v27, v23);
      uint64_t v81 = v136;
      uint64_t v82 = v135;
      uint64_t v83 = v131;
      uint64_t v84 = v129;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v23);
      uint64_t v81 = v136;
      uint64_t v82 = v135;
      uint64_t v83 = v131;
      uint64_t v84 = v129;
      uint64_t v85 = v123;
    }
    long long v97 = (void *)swift_allocObject();
    v97[2] = v82;
    v97[3] = v81;
    v97[4] = v85;
    float v143 = sub_21E8ED614;
    uint64_t v144 = v97;
    aBlocunint64_t k = MEMORY[0x263EF8330];
    uint64_t v140 = 1107296256;
    float32x4_t v141 = sub_21E8DA510;
    double v142 = &block_descriptor_157;
    uint64_t v98 = _Block_copy(&aBlock);
    id v99 = v46;
    swift_retain();
    uint64_t v92 = v132;
    sub_21E8EE900();
    uint64_t v138 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    uint64_t v100 = v133;
    sub_21E8EEC20();
    MEMORY[0x223C34800](0, v92, v100, v98);

    _Block_release(v98);
    (*(void (**)(char *, uint64_t))(v130 + 8))(v100, v83);
LABEL_31:
    (*(void (**)(char *, void *))(v84 + 8))(v92, v134);
    return swift_release();
  }
  id v122 = v38;
  sub_21E8D90B8(a1, (uint64_t)v19, &qword_26AD34328);
  uint64_t v40 = v124;
  uint64_t v41 = v125;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v124 + 48))(v19, 1, v125) == 1)
  {
    sub_21E8D911C((uint64_t)v19, &qword_26AD34328);
    id v38 = v122;
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v22, v19, v41);
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v102 = __swift_project_value_buffer(v23, (uint64_t)qword_26AD34308);
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v31, v102, v23);
  uint64_t v103 = sub_21E8EE550();
  os_log_type_t v104 = sub_21E8EEAF0();
  BOOL v105 = os_log_type_enabled(v103, v104);
  uint64_t v106 = v122;
  if (v105)
  {
    float32x4_t v134 = (void *)v102;
    uint64_t v107 = (uint8_t *)swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v107 = 136315138;
    uint64_t v109 = (char)v127;
    uint64_t v110 = *(void *)&aTotal_2[v109 * 8];
    aBlocunint64_t k = v108;
    uint64_t v138 = sub_21E8CD144(v110, qword_21E910488[v109], &aBlock);
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E8AA000, v103, v104, "Successfully downloaded task for cloud data: %s", v107, 0xCu);
    swift_arrayDestroy();
    uint64_t v111 = v108;
    uint64_t v106 = v122;
    MEMORY[0x223C355E0](v111, -1, -1);
    MEMORY[0x223C355E0](v107, -1, -1);

    (*(void (**)(char *, uint64_t))(v128 + 8))(v31, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v23);
  }
  uint64_t v112 = v106;
  simd_float4x4 v113 = sub_21E8EE550();
  os_log_type_t v114 = sub_21E8EEAC0();
  if (os_log_type_enabled(v113, v114))
  {
    simd_float4x4 v115 = (uint8_t *)swift_slowAlloc();
    float32x4_t v134 = (void *)swift_slowAlloc();
    *(_DWORD *)simd_float4x4 v115 = 138412290;
    uint64_t v116 = v123;
    aBlocunint64_t k = v123;
    simd_float4x4 v117 = v112;
    sub_21E8EEBF0();
    unint64_t v118 = v134;
    *float32x4_t v134 = v116;

    _os_log_impl(&dword_21E8AA000, v113, v114, "Response: %@", v115, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D482B0);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v118, -1, -1);
    MEMORY[0x223C355E0](v115, -1, -1);
  }
  else
  {

    simd_float4x4 v113 = v112;
  }
  uint64_t v119 = v125;

  LOBYTE(aBlock) = v127;
  id v120 = v126;
  sub_21E8E434C(v22, (char *)&aBlock, v137, v135, v136);

  return (*(uint64_t (**)(char *, uint64_t))(v124 + 8))(v22, v119);
}

uint64_t sub_21E8E4060(void (*a1)(unsigned char *))
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v2, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned char *v4 = 0;
  swift_storeEnumTagMultiPayload();
  a1(v4);
  return sub_21E8D911C((uint64_t)v4, (uint64_t *)&unk_26AD34548);
}

uint64_t sub_21E8E410C(void (*a1)(BOOL *), uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (BOOL *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL *v8 = (char *)objc_msgSend(a3, sel_statusCode) - 500 < (char *)0xFFFFFFFFFFFFFF9CLL;
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return sub_21E8D911C((uint64_t)v8, (uint64_t *)&unk_26AD34548);
}

uint64_t sub_21E8E41E4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(char *, void *, void *))(a1 + 32);
  if (a2)
  {
    sub_21E8EE460();
    uint64_t v13 = sub_21E8EE490();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_21E8EE490();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  swift_retain();
  id v15 = a3;
  id v16 = a4;
  v12(v11, a3, a4);

  swift_release();
  return sub_21E8D911C((uint64_t)v11, &qword_26AD34328);
}

uint64_t sub_21E8E434C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v125 = a5;
  uint64_t v123 = a4;
  uint64_t v128 = a3;
  id v122 = a1;
  uint64_t v143 = *MEMORY[0x263EF8340];
  uint64_t v135 = sub_21E8EE570();
  uint64_t v121 = *(void *)(v135 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v135, v8);
  id v120 = (char *)&v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v11);
  unint64_t v118 = (char *)&v115 - v12;
  uint64_t v132 = sub_21E8EE8F0();
  uint64_t v131 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132, v13);
  uint64_t v127 = (char *)&v115 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_21E8EE910();
  uint64_t v129 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130, v15);
  id v126 = (char *)&v115 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21E8EE490();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v21 = MEMORY[0x270FA5388](v17, v20);
  uint64_t v116 = (char *)&v115 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21, v22);
  simd_float4x4 v115 = (char *)&v115 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23, v25);
  uint64_t v28 = (char *)&v115 - v27;
  MEMORY[0x270FA5388](v26, v29);
  uint64_t v31 = (char *)&v115 - v30;
  uint64_t v32 = *a2;
  id v33 = objc_msgSend(self, sel_defaultManager);
  uint64_t v34 = v6 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  uint64_t v124 = v18;
  os_log_type_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v134 = v17;
  v35(v31, v34, v17);
  uint64_t v117 = v32;
  LOBYTE(aBlock) = v32;
  sub_21E8DAB3C();
  sub_21E8EE440();
  swift_bridgeObjectRelease();
  sub_21E8EE450();
  sub_21E8E5648();
  sub_21E8EE470();
  uint64_t v36 = (void *)sub_21E8EE9C0();
  swift_bridgeObjectRelease();
  LODWORD(v34) = objc_msgSend(v33, sel_fileExistsAtPath_, v36);

  id v133 = v33;
  if (!v34) {
    goto LABEL_4;
  }
  uint64_t v37 = (void *)sub_21E8EE430();
  aBlocunint64_t k = 0;
  unsigned int v38 = objc_msgSend(v33, sel_removeItemAtURL_error_, v37, &aBlock);

  if (v38)
  {
    uint64_t v39 = aBlock;
LABEL_4:
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v40 = __swift_project_value_buffer(v135, (uint64_t)qword_26AD34308);
    uint64_t v41 = sub_21E8EE550();
    os_log_type_t v42 = sub_21E8EEAF0();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v43 = 0;
      _os_log_impl(&dword_21E8AA000, v41, v42, "Fech Completed. Moving textures to cache directory.", v43, 2u);
      MEMORY[0x223C355E0](v43, -1, -1);
    }

    id v44 = (void *)sub_21E8EE430();
    id v45 = (void *)sub_21E8EE430();
    aBlocunint64_t k = 0;
    id v46 = v31;
    id v47 = v133;
    unsigned int v48 = objc_msgSend(v133, sel_moveItemAtURL_toURL_error_, v44, v45, &aBlock);

    uint64_t v49 = aBlock;
    if (v48)
    {
      uint64_t v50 = v134;
      v35(v28, (uint64_t)v46, v134);
      uint64_t v51 = v124;
      unint64_t v52 = (*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80);
      uint64_t v53 = swift_allocObject();
      uint64_t v54 = v125;
      *(void *)(v53 + 16) = v123;
      *(void *)(v53 + 24) = v54;
      (*(void (**)(unint64_t, char *, uint64_t))(v51 + 32))(v53 + v52, v28, v50);
      float32x4_t v141 = sub_21E8ED204;
      uint64_t v142 = v53;
      aBlocunint64_t k = (char *)MEMORY[0x263EF8330];
      uint64_t v138 = 1107296256;
      double v139 = sub_21E8DA510;
      uint64_t v140 = &block_descriptor_62;
      uint64_t v55 = _Block_copy(&aBlock);
      uint64_t v56 = v49;
      swift_retain();
      id v57 = v126;
      sub_21E8EE900();
      uint64_t v136 = MEMORY[0x263F8EE78];
      sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
      sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
      id v58 = v127;
      uint64_t v59 = v132;
      sub_21E8EEC20();
      MEMORY[0x223C34800](0, v57, v58, v55);
      _Block_release(v55);

      (*(void (**)(char *, uint64_t))(v131 + 8))(v58, v59);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v57, v130);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v50);
    }
    else
    {
      uint64_t v119 = v46;
      os_log_type_t v60 = aBlock;
      uint64_t v61 = (void *)sub_21E8EE400();

      swift_willThrow();
      uint64_t v62 = v121;
      uint64_t v63 = v120;
      uint64_t v64 = v135;
      (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v120, v40, v135);
      id v65 = v61;
      id v66 = v61;
      unint64_t v67 = sub_21E8EE550();
      os_log_type_t v68 = sub_21E8EEAD0();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = swift_slowAlloc();
        BOOL v70 = (char *)swift_slowAlloc();
        aBlocunint64_t k = v70;
        uint64_t v71 = v117;
        uint64_t v72 = *(void *)&aTotal_2[8 * v117];
        *(_DWORD *)uint64_t v69 = 136315394;
        uint64_t v136 = sub_21E8CD144(v72, qword_21E910488[v71], (uint64_t *)&aBlock);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v69 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v73 = sub_21E8EED70();
        uint64_t v136 = sub_21E8CD144(v73, v74, (uint64_t *)&aBlock);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21E8AA000, v67, v68, "Failed to move file to cache directory: %s. Error: %s.", (uint8_t *)v69, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v70, -1, -1);
        MEMORY[0x223C355E0](v69, -1, -1);

        (*(void (**)(char *, uint64_t))(v62 + 8))(v120, v64);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v64);
      }
      unint64_t v101 = v119;
      uint64_t v102 = swift_allocObject();
      uint64_t v103 = v125;
      *(void *)(v102 + 16) = v123;
      *(void *)(v102 + 24) = v103;
      float32x4_t v141 = sub_21E8EDA00;
      uint64_t v142 = v102;
      aBlocunint64_t k = (char *)MEMORY[0x263EF8330];
      uint64_t v138 = 1107296256;
      double v139 = sub_21E8DA510;
      uint64_t v140 = &block_descriptor_56;
      os_log_type_t v104 = _Block_copy(&aBlock);
      swift_retain();
      BOOL v105 = v126;
      sub_21E8EE900();
      uint64_t v136 = MEMORY[0x263F8EE78];
      sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
      sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
      uint64_t v106 = v127;
      uint64_t v107 = v132;
      sub_21E8EEC20();
      MEMORY[0x223C34800](0, v105, v106, v104);

      _Block_release(v104);
      (*(void (**)(char *, uint64_t))(v131 + 8))(v106, v107);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v105, v130);
      (*(void (**)(char *, uint64_t))(v124 + 8))(v101, v134);
    }
    return swift_release();
  }
  uint64_t v119 = v31;
  uint64_t v75 = aBlock;
  unint64_t v76 = (void *)sub_21E8EE400();

  swift_willThrow();
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v77 = v135;
  uint64_t v78 = __swift_project_value_buffer(v135, (uint64_t)qword_26AD34308);
  uint64_t v79 = v121;
  uint64_t v80 = v118;
  (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v118, v78, v77);
  uint64_t v81 = v115;
  uint64_t v82 = v134;
  v35(v115, (uint64_t)v122, v134);
  uint64_t v83 = v116;
  v35(v116, (uint64_t)v119, v82);
  id v84 = v76;
  id v85 = v76;
  uint64_t v86 = sub_21E8EE550();
  os_log_type_t v87 = sub_21E8EEAD0();
  int v88 = v87;
  uint64_t v89 = v76;
  if (os_log_type_enabled(v86, v87))
  {
    uint64_t v90 = swift_slowAlloc();
    id v120 = (char *)swift_slowAlloc();
    aBlocunint64_t k = v120;
    uint64_t v91 = v117;
    uint64_t v92 = *(void *)&aTotal_2[8 * v117];
    *(_DWORD *)uint64_t v90 = 136315906;
    LODWORD(v117) = v88;
    uint64_t v136 = sub_21E8CD144(v92, qword_21E910488[v91], (uint64_t *)&aBlock);
    id v122 = v76;
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v90 + 12) = 2080;
    sub_21E8ED7B8(&qword_267D48290, MEMORY[0x263F06EA8]);
    uint64_t v93 = sub_21E8EED20();
    uint64_t v136 = sub_21E8CD144(v93, v94, (uint64_t *)&aBlock);
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    uint64_t v95 = *(void (**)(char *, uint64_t))(v124 + 8);
    uint64_t v124 = (v124 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v95(v81, v134);
    *(_WORD *)(v90 + 22) = 2080;
    uint64_t v82 = v134;
    uint64_t v96 = sub_21E8EED20();
    uint64_t v136 = sub_21E8CD144(v96, v97, (uint64_t *)&aBlock);
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    v95(v83, v82);
    *(_WORD *)(v90 + 32) = 2080;
    swift_getErrorValue();
    uint64_t v98 = sub_21E8EED70();
    uint64_t v136 = sub_21E8CD144(v98, v99, (uint64_t *)&aBlock);
    uint64_t v89 = v122;
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21E8AA000, v86, (os_log_type_t)v117, "Failed to move tmp file for cloud data: %s from: %s, to: %s. Error: %s", (uint8_t *)v90, 0x2Au);
    uint64_t v100 = v120;
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v100, -1, -1);
    MEMORY[0x223C355E0](v90, -1, -1);

    (*(void (**)(char *, uint64_t))(v121 + 8))(v118, v135);
  }
  else
  {
    uint64_t v95 = *(void (**)(char *, uint64_t))(v124 + 8);
    uint64_t v124 = (v124 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v95(v81, v82);
    v95(v83, v82);

    (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v135);
  }
  uint64_t v108 = swift_allocObject();
  uint64_t v109 = v125;
  *(void *)(v108 + 16) = v123;
  *(void *)(v108 + 24) = v109;
  float32x4_t v141 = sub_21E8EDA00;
  uint64_t v142 = v108;
  aBlocunint64_t k = (char *)MEMORY[0x263EF8330];
  uint64_t v138 = 1107296256;
  double v139 = sub_21E8DA510;
  uint64_t v140 = &block_descriptor_68;
  uint64_t v110 = _Block_copy(&aBlock);
  swift_retain();
  uint64_t v111 = v126;
  sub_21E8EE900();
  uint64_t v136 = MEMORY[0x263F8EE78];
  sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
  sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
  uint64_t v112 = v127;
  uint64_t v113 = v132;
  sub_21E8EEC20();
  MEMORY[0x223C34800](0, v111, v112, v110);

  _Block_release(v110);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v112, v113);
  (*(void (**)(char *, uint64_t))(v129 + 8))(v111, v130);
  v95(v119, v82);
  return swift_release();
}

uint64_t sub_21E8E5554(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E8EE490();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a3, v9);
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return sub_21E8D911C((uint64_t)v8, (uint64_t *)&unk_26AD34548);
}

void sub_21E8E5648()
{
  v39[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_21E8EE490();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_defaultManager);
  id v37 = v0;
  uint64_t v7 = &v0[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
  swift_beginAccess();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v8(v5, v7, v1);
  sub_21E8EE470();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  uint64_t v10 = (void *)sub_21E8EE9C0();
  swift_bridgeObjectRelease();
  unsigned __int8 v11 = objc_msgSend(v6, sel_fileExistsAtPath_, v10);

  if ((v11 & 1) != 0
    || (v8(v5, v7, v1),
        uint64_t v12 = (void *)sub_21E8EE430(),
        v9(v5, v1),
        v39[0] = 0,
        unsigned int v13 = objc_msgSend(v6, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v39), v12, v14 = v39[0], v13))
  {
  }
  else
  {
    uint64_t v15 = v14;
    uint64_t v36 = v9;
    uint64_t v16 = (void *)sub_21E8EE400();

    swift_willThrow();
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_21E8EE570();
    __swift_project_value_buffer(v17, (uint64_t)qword_26AD34308);
    id v18 = v37;
    id v19 = v16;
    id v20 = v18;
    id v21 = v16;
    uint64_t v22 = sub_21E8EE550();
    os_log_type_t v23 = sub_21E8EEAF0();
    int v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v25 = swift_slowAlloc();
      int v35 = v24;
      uint64_t v26 = v25;
      id v37 = (id)swift_slowAlloc();
      v39[0] = v37;
      *(_DWORD *)uint64_t v26 = 136315394;
      v34[1] = v26 + 4;
      v8(v5, v7, v1);
      sub_21E8ED7B8(&qword_267D48290, MEMORY[0x263F06EA8]);
      uint64_t v27 = v22;
      uint64_t v28 = sub_21E8EED20();
      unint64_t v30 = v29;
      v36(v5, v1);
      uint64_t v38 = sub_21E8CD144(v28, v30, (uint64_t *)v39);
      sub_21E8EEBF0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v31 = sub_21E8EED70();
      uint64_t v38 = sub_21E8CD144(v31, v32, (uint64_t *)v39);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21E8AA000, v27, (os_log_type_t)v35, "Failed to create destination folder:%s. Error: %s", (uint8_t *)v26, 0x16u);
      id v33 = v37;
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v33, -1, -1);
      MEMORY[0x223C355E0](v26, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_21E8E5B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v75 = a1;
  uint64_t v3 = sub_21E8EE4D0();
  uint64_t v63 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  MEMORY[0x270FA5388](v3, v4);
  os_log_type_t v68 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_21E8EE3F0();
  uint64_t v6 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78, v7);
  uint64_t v71 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344C0);
  uint64_t v11 = MEMORY[0x270FA5388](v9 - 8, v10);
  unint64_t v67 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v77 = (char *)&v58 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344C8);
  MEMORY[0x270FA5388](v15 - 8, v16);
  id v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  uint64_t v21 = MEMORY[0x270FA5388](v19 - 8, v20);
  unint64_t v76 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v23);
  uint64_t v25 = (char *)&v58 - v24;
  uint64_t v26 = sub_21E8EE490();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v26, v28);
  id v65 = (char *)&v58 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v29, v31);
  id v66 = (char *)&v58 - v33;
  MEMORY[0x270FA5388](v32, v34);
  uint64_t v36 = (char *)&v58 - v35;
  uint64_t v37 = v1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_configuration;
  sub_21E8EE480();
  BOOL v70 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t result = v70(v25, 1, v26);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v73 = v27;
    uint64_t v74 = v26;
    os_log_type_t v60 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    uint64_t v61 = v27 + 32;
    v60(v36, v25, v26);
    uint64_t v59 = v37;
    sub_21E8EE440();
    sub_21E8EE440();
    swift_bridgeObjectRelease();
    sub_21E8EE410();
    sub_21E8EE3E0();
    swift_bridgeObjectRelease();
    uint64_t v69 = v6;
    uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
    uint64_t v40 = v18;
    if (!v39(v18, 1, v78))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34540);
      sub_21E8EE3B0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_21E90FEB0;
      sub_21E8EEAA0();
      sub_21E8EE3A0();
      swift_bridgeObjectRelease();
      sub_21E8EE3C0();
    }
    uint64_t v62 = v2;
    uint64_t v41 = sub_21E8EE390();
    uint64_t v42 = *(void *)(v41 - 8);
    id v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
    uint64_t v44 = (uint64_t)v77;
    v43(v77, 1, 1, v41);
    unsigned int v45 = v39(v40, 1, v78);
    uint64_t v72 = (uint64_t)v40;
    if (v45)
    {
      uint64_t v46 = v73;
      uint64_t v47 = v74;
      uint64_t v48 = (uint64_t)v76;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v76, 1, 1, v74);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v46 + 8))(v36, v47);
      sub_21E8D911C(v48, &qword_26AD34328);
LABEL_8:
      uint64_t v53 = v72;
      sub_21E8D9178(v44, v75, &qword_26AD344C0);
      return sub_21E8D911C(v53, &qword_26AD344C8);
    }
    uint64_t v58 = v42;
    uint64_t v49 = v69;
    uint64_t v50 = v71;
    uint64_t v51 = v78;
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v71, v40, v78);
    uint64_t v48 = (uint64_t)v76;
    sub_21E8EE3D0();
    uint64_t v44 = (uint64_t)v77;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v51);
    uint64_t v47 = v74;
    int v52 = v70((char *)v48, 1, v74);
    uint64_t v46 = v73;
    if (v52 == 1) {
      goto LABEL_7;
    }
    uint64_t v54 = (uint64_t)v66;
    v60(v66, (char *)v48, v47);
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v65, v54, v47);
    uint64_t v55 = (uint64_t)v67;
    sub_21E8EE370();
    v43((char *)v55, 0, 1, v41);
    sub_21E8ED0D0(v55, v44);
    uint64_t v56 = (uint64_t)v68;
    sub_21E8EE4C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v44, 1, v41);
    if (result != 1)
    {
      sub_21E8CCB18(v44, v56, v54, 5522759, 0xE300000000000000, *(void *)(v59 + 32), *(void *)(v59 + 40));
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v56, v64);
      id v57 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v57(v54, v47);
      v57((uint64_t)v36, v47);
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

id AegirCloudCoverService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AegirCloudCoverService.init()()
{
}

id AegirCloudCoverService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirCloudCoverService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static AegirCloudCoverService.cloudLevelPrefix.getter()
{
  return 0x61632D632D333070;
}

unint64_t static AegirCloudCoverService.cloudLevelLowFileName.getter()
{
  return 0xD000000000000012;
}

unint64_t static AegirCloudCoverService.cloudLevelMidFileName.getter()
{
  return 0xD000000000000012;
}

unint64_t static AegirCloudCoverService.cloudLevelHighFileName.getter()
{
  return 0xD000000000000013;
}

uint64_t AegirCloudCoverService.urlForCloudLevel(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_21E8DABBC(a1, a2, v11);
  if (v11[0] == 5)
  {
    uint64_t v5 = sub_21E8EE490();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    return v6(a3, 1, 1, v5);
  }
  else
  {
    uint64_t v8 = v3 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
    swift_beginAccess();
    uint64_t v9 = sub_21E8EE490();
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a3, v8, v9);
    sub_21E8DAB3C();
    sub_21E8EE440();
    swift_bridgeObjectRelease();
    sub_21E8EE450();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(a3, 0, 1, v9);
  }
}

uint64_t AegirCloudCoverService.currentURLForCloudLevel(with:)@<X0>(uint64_t a1@<X8>)
{
  objc_super v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = sub_21E8EE490();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v16 = (char *)&v35 - v15;
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v20 = (void *)sub_21E8EE9C0();
  id v21 = objc_msgSend(v2, sel_urlForCloudLevelWith_, v20, v2);

  if (v21)
  {
    sub_21E8EE460();

    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 0, 1, v3);
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v22(v16, 1, 1, v3);
  }
  sub_21E8D9178((uint64_t)v16, (uint64_t)v19, &qword_26AD34328);
  sub_21E8D90B8((uint64_t)v19, (uint64_t)v12, &qword_26AD34328);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) == 1)
  {
    sub_21E8D911C((uint64_t)v12, &qword_26AD34328);
    return sub_21E8D9178((uint64_t)v19, v36, &qword_26AD34328);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v12, v3);
  id v23 = objc_msgSend(self, sel_defaultManager);
  sub_21E8EE470();
  uint64_t v24 = (void *)sub_21E8EE9C0();
  swift_bridgeObjectRelease();
  unsigned __int8 v25 = objc_msgSend(v23, sel_fileExistsAtPath_, v24);

  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return sub_21E8D9178((uint64_t)v19, v36, &qword_26AD34328);
  }
  type metadata accessor for AegirCloudCoverService();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v28 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v29 = (void *)sub_21E8EE9C0();
  uint64_t v30 = (void *)sub_21E8EE9C0();
  id v31 = objc_msgSend(v28, sel_pathForResource_ofType_, v29, v30);

  if (v31)
  {
    sub_21E8EE9F0();

    sub_21E8E5648();
    uint64_t v32 = v36;
    sub_21E8EE420();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_21E8D911C((uint64_t)v19, &qword_26AD34328);
    uint64_t v33 = v32;
    uint64_t v34 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_21E8D911C((uint64_t)v19, &qword_26AD34328);
    uint64_t v33 = v36;
    uint64_t v34 = 1;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v22)(v33, v34, 1, v3);
}

id sub_21E8E6C04(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21E8EE9F0();
  uint64_t v12 = v11;
  id v13 = a1;
  a4(v10, v12);

  swift_bridgeObjectRelease();
  uint64_t v14 = sub_21E8EE490();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) != 1)
  {
    uint64_t v16 = (void *)sub_21E8EE430();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  }
  return v16;
}

uint64_t sub_21E8E6DB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E8E6DFC()
{
  id v1 = (char *)v0[2];
  objc_super v2 = (void *)v0[3];
  uint64_t v4 = (void (*)(void))v0[4];
  uint64_t v3 = v0[5];
  swift_retain();
  sub_21E8EB3A8(v2, v1, v4, v3);
  return swift_release();
}

void *sub_21E8E6E58(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34498);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21E8E929C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E8E6F68(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D482A8);
  uint64_t v10 = *(void *)(sub_21E8EE490() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_21E8EEC90();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_21E8EE490() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21E8E9390(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

BOOL sub_21E8E71D0@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_21E8DD2B4();
  *a1 = result;
  return result;
}

uint64_t sub_21E8E7210()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_21E8E7228()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8E7238()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

size_t sub_21E8E7260(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D482A8);
  uint64_t v3 = *(void *)(sub_21E8EE490() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      _OWORD v6[2] = v1;
      _OWORD v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_21E8E8EA8(&v10, (char *)v6 + v5, v1, a1);
      sub_21E8ED7B0();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21E8E7394(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E8D86F4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_21E8E73B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E8D8588(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_21E8E73D4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21E8D2B14(a1);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t v20 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21E8E7D94();
      uint64_t v10 = v20;
    }
    uint64_t v11 = *(void *)(v10 + 56);
    uint64_t v12 = sub_21E8EE490();
    uint64_t v19 = *(void *)(v12 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v19 + 32))(a2, v11 + *(void *)(v19 + 72) * v6, v12);
    sub_21E8E7960(v6, v10);
    *uint64_t v3 = v10;
    swift_bridgeObjectRelease();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    uint64_t v14 = a2;
    uint64_t v15 = 0;
    uint64_t v16 = v12;
  }
  else
  {
    uint64_t v17 = sub_21E8EE490();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v16 = v17;
    uint64_t v14 = a2;
    uint64_t v15 = 1;
  }
  return v13(v14, v15, 1, v16);
}

uint64_t sub_21E8E7570(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v45 = sub_21E8EE490();
  uint64_t v5 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45, v6);
  uint64_t v44 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D482B8);
  int v43 = a2;
  uint64_t v9 = sub_21E8EECC0();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v39 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v41 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v40 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v42 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v15 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    uint64_t v16 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v20 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v40) {
          goto LABEL_34;
        }
        unint64_t v23 = v41[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v40) {
            goto LABEL_34;
          }
          unint64_t v23 = v41[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v40)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v39;
              if (v43)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
                if (v38 >= 64) {
                  bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v41 = -1 << v38;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v41[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v40) {
                  goto LABEL_34;
                }
                unint64_t v23 = v41[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v14 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v8 + 56);
      uint64_t v26 = v8;
      char v27 = *(unsigned char *)(*(void *)(v8 + 48) + v21);
      uint64_t v28 = v5;
      uint64_t v29 = *(void *)(v5 + 72);
      uint64_t v30 = v25 + v29 * v21;
      if (v43) {
        (*v15)(v44, v30, v45);
      }
      else {
        (*v42)(v44, v30, v45);
      }
      sub_21E8EEDC0();
      sub_21E8EEA10();
      swift_bridgeObjectRelease();
      uint64_t result = sub_21E8EEDE0();
      uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v16 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(unsigned char *)(*(void *)(v10 + 48) + v19) = v27;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v15)(*(void *)(v10 + 56) + v29 * v19, v44, v45);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v28;
      uint64_t v8 = v26;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_21E8E7960(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21E8EEC30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_21E8EEDC0();
        sub_21E8EEA10();
        swift_bridgeObjectRelease();
        uint64_t result = sub_21E8EEDE0();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (unsigned char *)(v10 + v3);
        uint64_t v12 = (unsigned char *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          unsigned char *v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(sub_21E8EE490() - 8) + 72);
        int64_t v15 = v14 * v3;
        uint64_t result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21E8E7B80(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_21E8D2B14(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21E8E7D94();
      goto LABEL_7;
    }
    sub_21E8E7570(v13, a3 & 1);
    unint64_t v24 = sub_21E8D2B14(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      int64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_21E8EED60();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_21E8EE490();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:
  return sub_21E8E7CE8(v10, a2, a1, v16);
}

uint64_t sub_21E8E7CE8(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_21E8EE490();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

void *sub_21E8E7D94()
{
  uint64_t v1 = sub_21E8EE490();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D482B8);
  BOOL v23 = v0;
  uint64_t v6 = *v0;
  uint64_t v7 = sub_21E8EECB0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *BOOL v23 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    char v17 = *(unsigned char *)(*(void *)(v6 + 48) + v16);
    unint64_t v18 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, *(void *)(v6 + 56) + v18, v1);
    *(unsigned char *)(*(void *)(v8 + 48) + v16) = v17;
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v8 + 56) + v18, v5, v1);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21E8E8020(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_21E8EEDC0();
  swift_bridgeObjectRetain();
  sub_21E8EEA10();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_21E8EEDE0();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  uint64_t v17 = a2;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = (char)a2;
    uint64_t v9 = ~v6;
    uint64_t v10 = *(void *)&aTotal_2[8 * v8];
    uint64_t v11 = qword_21E910488[v8];
    while (*(void *)&aTotal_2[8 * *(char *)(*(void *)(v4 + 48) + v7)] != v10
         || qword_21E910488[*(char *)(*(void *)(v4 + 48) + v7)] != v11)
    {
      char v13 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_11;
      }
      unint64_t v7 = (v7 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    char v15 = *(unsigned char *)(*(void *)(*v18 + 48) + v7);
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v18;
    *unint64_t v18 = 0x8000000000000000;
    char v15 = v17;
    sub_21E8E84DC(v17, v7, isUniquelyReferenced_nonNull_native);
    *unint64_t v18 = v20;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = v15;
  return result;
}

uint64_t sub_21E8E81F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34530);
  uint64_t v3 = sub_21E8EEC50();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      sub_21E8EEDC0();
      sub_21E8EEA10();
      swift_bridgeObjectRelease();
      uint64_t result = sub_21E8EEDE0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21E8E84DC(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_16;
  }
  if (a3)
  {
    sub_21E8E81F8();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_21E8E86B4();
      goto LABEL_16;
    }
    sub_21E8E8848();
  }
  uint64_t v8 = *v3;
  sub_21E8EEDC0();
  sub_21E8EEA10();
  swift_bridgeObjectRelease();
  uint64_t result = sub_21E8EEDE0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = v5;
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)&aTotal_2[8 * v10];
    uint64_t v13 = qword_21E910488[v10];
    while (*(void *)&aTotal_2[8 * *(char *)(*(void *)(v8 + 48) + a2)] != v12
         || qword_21E910488[*(char *)(*(void *)(v8 + 48) + a2)] != v13)
    {
      char v15 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_20;
      }
      a2 = (a2 + 1) & v11;
      if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_16;
      }
    }
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v16 = *v20;
  *(void *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v21;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (!v18)
  {
    *(void *)(v16 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t result = sub_21E8EED50();
  __break(1u);
  return result;
}

void *sub_21E8E86B4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34530);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E8EEC40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21E8E8848()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34530);
  uint64_t v3 = sub_21E8EEC50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    sub_21E8EEDC0();
    sub_21E8EEA10();
    swift_bridgeObjectRelease();
    uint64_t result = sub_21E8EEDE0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21E8E8AF8@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *v2;
  sub_21E8EEDC0();
  swift_bridgeObjectRetain();
  sub_21E8EEA10();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_21E8EEDE0();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = ~v6;
    uint64_t v9 = a1;
    uint64_t v10 = *(void *)&aTotal_2[v9 * 8];
    uint64_t v11 = qword_21E910488[v9];
    while (*(void *)&aTotal_2[8 * *(char *)(*(void *)(v4 + 48) + v7)] != v10
         || qword_21E910488[*(char *)(*(void *)(v4 + 48) + v7)] != v11)
    {
      char v13 = sub_21E8EED40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_11;
      }
      unint64_t v7 = (v7 + 1) & v8;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v17;
    uint64_t v19 = *v17;
    uint64_t *v17 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_21E8E86B4();
      uint64_t v16 = v19;
    }
    *a2 = *(unsigned char *)(*(void *)(v16 + 48) + v7);
    sub_21E8E8CD0(v7);
    uint64_t *v17 = v19;
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = 5;
  }
  return result;
}

unint64_t sub_21E8E8CD0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_21E8EEC30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_21E8EEDC0();
        sub_21E8EEA10();
        swift_bridgeObjectRelease();
        unint64_t v10 = sub_21E8EEDE0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          int64_t v12 = (unsigned char *)(v11 + v2);
          char v13 = (unsigned char *)(v11 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            unsigned char *v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21E8E8EA8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21E8EE490();
  uint64_t v43 = *(void *)(v12 - 8);
  uint64_t result = MEMORY[0x270FA5388](v12, v13);
  uint64_t v42 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a4;
  uint64_t v17 = a4 + 64;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
  if (-v34 < 64) {
    uint64_t v18 = ~(-1 << -(char)v34);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v30 = ~v34;
    *a1 = v44;
    a1[1] = v17;
    a1[2] = v30;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v38 = a3;
  int64_t v20 = 0;
  a3 = 0;
  unint64_t v21 = v42;
  uint64_t v40 = v43 + 16;
  uint64_t v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
  uint64_t v39 = v43 + 48;
  uint64_t v37 = (uint64_t (**)(char *, char *, uint64_t))(v43 + 32);
  uint64_t v35 = v17;
  int64_t v36 = (unint64_t)(63 - v34) >> 6;
  int64_t v32 = v36 - 1;
  unint64_t v33 = a1;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v23 = v22 | (v20 << 6);
  while (1)
  {
    uint64_t v27 = v43;
    uint64_t v28 = *(void *)(v43 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v11, *(void *)(v44 + 56) + v28 * v23, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v12) == 1)
    {
      uint64_t v17 = v35;
      goto LABEL_38;
    }
    ++a3;
    uint64_t v29 = *v37;
    (*v37)(v21, v11, v12);
    uint64_t result = v29(a2, v21, v12);
    if (a3 == v38)
    {
      a3 = v38;
      a1 = v33;
      uint64_t v17 = v35;
      goto LABEL_39;
    }
    a2 += v28;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    uint64_t v17 = v35;
    if (v24 >= v36) {
      goto LABEL_37;
    }
    unint64_t v25 = *(void *)(v35 + 8 * v24);
    if (!v25)
    {
      int64_t v26 = v20 + 2;
      ++v20;
      if (v24 + 1 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * v26);
      if (v25) {
        goto LABEL_14;
      }
      int64_t v20 = v24 + 1;
      if (v24 + 2 >= v36) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v35 + 8 * (v24 + 2));
      if (v25)
      {
        v24 += 2;
      }
      else
      {
        int64_t v20 = v24 + 2;
        if (v24 + 3 >= v36) {
          goto LABEL_37;
        }
        unint64_t v25 = *(void *)(v35 + 8 * (v24 + 3));
        if (!v25)
        {
          int64_t v26 = v24 + 4;
          int64_t v20 = v24 + 3;
          if (v24 + 4 < v36)
          {
            unint64_t v25 = *(void *)(v35 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                int64_t v24 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_42;
                }
                if (v24 >= v36)
                {
                  int64_t v20 = v32;
                  goto LABEL_37;
                }
                unint64_t v25 = *(void *)(v35 + 8 * v24);
                ++v26;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v24 = v26;
            goto LABEL_21;
          }
LABEL_37:
          (*v41)(v11, 1, 1, v12);
          unint64_t v19 = 0;
LABEL_38:
          sub_21E8D911C((uint64_t)v11, &qword_26AD34328);
          a1 = v33;
          goto LABEL_39;
        }
        v24 += 3;
      }
    }
LABEL_21:
    unint64_t v19 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v20 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_21E8E929C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

uint64_t sub_21E8E9390(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_21E8EE490() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_21E8EECE0();
  __break(1u);
  return result;
}

uint64_t sub_21E8E94E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(uint64_t), double a9, void (*a10)(void, void))
{
  uint64_t v96 = a5;
  unint64_t v99 = a4;
  uint64_t v113 = a3;
  uint64_t v114 = a2;
  uint64_t v117 = a1;
  uint64_t v119 = a10;
  uint64_t v106 = sub_21E8EE8F0();
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106, v14);
  uint64_t v103 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_21E8EE910();
  uint64_t v102 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104, v16);
  unint64_t v101 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_21E8EE930();
  uint64_t v100 = *(void *)(v112 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v112, v18);
  uint64_t v98 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v21);
  uint64_t v111 = (char *)&v96 - v22;
  uint64_t v115 = sub_21E8EE570();
  uint64_t v110 = *(void *)(v115 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v115, v23);
  uint64_t v107 = (char *)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24, v26);
  uint64_t v108 = (char *)&v96 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  uint64_t v30 = MEMORY[0x270FA5388](v28 - 8, v29);
  unint64_t v97 = (char *)&v96 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30, v32);
  uint64_t v34 = (char *)&v96 - v33;
  uint64_t v35 = sub_21E8EE490();
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35, v37);
  uint64_t v39 = (char *)&v96 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v40, v41);
  uint64_t v43 = (unsigned __int8 *)&v96 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a6;
  int v109 = a7;
  *(unsigned char *)(v44 + 24) = a7;
  uint64_t v116 = a8;
  uint64_t v118 = v44;
  uint64_t v45 = v119;
  *(void *)(v44 + 32) = a8;
  *(void *)(v44 + 40) = v45;
  sub_21E8D90B8(v117, (uint64_t)v43, (uint64_t *)&unk_26AD34548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v117 = v36;
    int v46 = *v43;
    uint64_t v47 = qword_26AD34320;
    swift_retain();
    swift_retain();
    uint64_t v48 = v114;
    if (v46 == 1 && v114)
    {
      uint64_t v49 = v96 + 16;
      uint64_t v50 = v115;
      uint64_t v51 = v110;
      if (v47 != -1) {
        swift_once();
      }
      uint64_t v52 = __swift_project_value_buffer(v50, (uint64_t)qword_26AD34308);
      uint64_t v53 = v108;
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v108, v52, v50);
      uint64_t v54 = sub_21E8EE550();
      os_log_type_t v55 = sub_21E8EEAF0();
      BOOL v56 = os_log_type_enabled(v54, v55);
      char v57 = v113;
      if (v56)
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        aBlock[0] = v59;
        uint64_t v60 = v57;
        uint64_t v61 = *(void *)&aTotal_2[v60 * 8];
        *(_DWORD *)uint64_t v58 = 136315650;
        uint64_t v122 = sub_21E8CD144(v61, qword_21E910488[v60], aBlock);
        uint64_t v48 = v114;
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 12) = 2048;
        uint64_t v122 = v48;
        sub_21E8EEBF0();
        *(_WORD *)(v58 + 22) = 2048;
        uint64_t v122 = *(void *)&a9;
        sub_21E8EEBF0();
        _os_log_impl(&dword_21E8AA000, v54, v55, "Attempting to retry download for %s. Remaining retries: %ld. Backoff period: %f", (uint8_t *)v58, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v59, -1, -1);
        MEMORY[0x223C355E0](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v51 + 8))(v108, v115);
        char v57 = v113;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
      }
      uint64_t v78 = v98;
      sub_21E8EE920();
      MEMORY[0x223C34600](v78, a9);
      uint64_t v119 = *(void (**)(void, void))(v100 + 8);
      v119(v78, v112);
      uint64_t v79 = swift_allocObject();
      swift_beginAccess();
      uint64_t v80 = (void *)MEMORY[0x223C35660](v49);
      swift_unknownObjectWeakInit();

      uint64_t v81 = swift_allocObject();
      *(void *)(v81 + 16) = v79;
      *(unsigned char *)(v81 + 24) = v57;
      uint64_t v82 = v99;
      *(void *)(v81 + 32) = v99;
      *(void *)(v81 + 40) = v48;
      *(double *)(v81 + 48) = a9;
      uint64_t v83 = v118;
      *(void *)(v81 + 56) = sub_21E8EDA08;
      *(void *)(v81 + 64) = v83;
      aBlock[4] = (uint64_t)sub_21E8ED688;
      aBlock[5] = v81;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21E8DA510;
      aBlock[3] = (uint64_t)&block_descriptor_168;
      id v84 = _Block_copy(aBlock);
      swift_retain();
      v82;
      swift_retain();
      id v85 = v101;
      sub_21E8EE900();
      uint64_t v120 = MEMORY[0x263F8EE78];
      sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
      sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
      uint64_t v86 = v103;
      uint64_t v87 = v106;
      sub_21E8EEC20();
      int v88 = v111;
      MEMORY[0x223C347C0](v111, v85, v86, v84);
      _Block_release(v84);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v86, v87);
      (*(void (**)(char *, uint64_t))(v102 + 8))(v85, v104);
      v119(v88, v112);
      swift_release();
      swift_release();
    }
    else
    {
      uint64_t v68 = v115;
      uint64_t v69 = v110;
      if (v47 != -1) {
        swift_once();
      }
      uint64_t v70 = __swift_project_value_buffer(v68, (uint64_t)qword_26AD34308);
      uint64_t v71 = v107;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v107, v70, v68);
      uint64_t v72 = sub_21E8EE550();
      os_log_type_t v73 = sub_21E8EEAD0();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        *(_DWORD *)uint64_t v74 = 136315138;
        uint64_t v76 = (char)v113;
        uint64_t v77 = *(void *)&aTotal_2[v76 * 8];
        aBlock[0] = v75;
        uint64_t v122 = sub_21E8CD144(v77, qword_21E910488[v76], aBlock);
        sub_21E8EEBF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21E8AA000, v72, v73, "Exhausted retry attempts for %s", v74, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C355E0](v75, -1, -1);
        MEMORY[0x223C355E0](v74, -1, -1);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v107, v115);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v68);
      }
      uint64_t v89 = (uint64_t)v97;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v117 + 56))(v97, 1, 1, v35);
      swift_beginAccess();
      uint64_t v90 = MEMORY[0x223C35660](a6 + 16);
      if (v90)
      {
        uint64_t v91 = (void *)v90;
        id v92 = *(id *)(v90 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);

        MEMORY[0x270FA5388](v93, v94);
        *(&v96 - 2) = a6;
        *((unsigned char *)&v96 - 8) = v109;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34558);
        sub_21E8EEB50();
      }
      v116(v89);
      sub_21E8D911C(v89, &qword_26AD34328);
    }
  }
  else
  {
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v36 + 32))(v39, v43, v35);
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v34, v39, v35);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v34, 0, 1, v35);
    swift_beginAccess();
    uint64_t v62 = MEMORY[0x223C35660](a6 + 16);
    if (v62)
    {
      uint64_t v63 = (void *)v62;
      uint64_t v64 = *(void **)(v62 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_privateQueue);
      swift_retain();
      swift_retain();
      id v65 = v64;

      MEMORY[0x270FA5388](v66, v67);
      *(&v96 - 2) = a6;
      *((unsigned char *)&v96 - 8) = v109;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34558);
      sub_21E8EEB50();
    }
    else
    {
      swift_retain();
      swift_retain();
    }
    v116((uint64_t)v34);
    sub_21E8D911C((uint64_t)v34, &qword_26AD34328);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
  }
  return swift_release();
}

uint64_t sub_21E8EA28C(char *a1, void *a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, uint64_t a8, double a9, unsigned __int8 a10, void (*a11)(uint64_t), void (*a12)(void, void))
{
  uint64_t v95 = a3;
  uint64_t v96 = a6;
  LODWORD(v100) = a5;
  uint64_t v99 = a4;
  id v84 = a2;
  unint64_t v97 = a1;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v86, v15);
  uint64_t v87 = (char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21E8EE570();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v101 = v17;
  uint64_t v102 = v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  uint64_t v93 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20, v22);
  id v85 = (char *)&v83 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344C0);
  MEMORY[0x270FA5388](v24 - 8, v25);
  uint64_t v27 = (char *)&v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_21E8EE390();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28, v30);
  uint64_t v32 = (char *)&v83 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = a8;
  int v88 = a10;
  *(unsigned char *)(v33 + 24) = a10;
  uint64_t v89 = a11;
  *(void *)(v33 + 32) = a11;
  *(void *)(v33 + 40) = a12;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_21E8ED560;
  *(void *)(v34 + 24) = v33;
  *(void *)(v34 + 32) = v99;
  *(double *)(v34 + 40) = a9;
  *(unsigned char *)(v34 + 48) = v100;
  uint64_t v36 = v96;
  uint64_t v35 = v97;
  *(void *)(v34 + 56) = v96;
  *(void *)(v34 + 64) = a7;
  uint64_t v98 = v34;
  uint64_t v94 = *v35;
  LOBYTE(aBlock[0]) = v94;
  uint64_t v92 = a8;
  swift_retain();
  uint64_t v91 = a12;
  swift_retain();
  unint64_t v97 = (char *)v33;
  uint64_t v37 = v95;
  swift_retain();
  id v38 = v36;
  uint64_t v90 = a7;
  swift_retain();
  sub_21E8E5B10((uint64_t)v27);
  uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  uint64_t v96 = (void *)v28;
  if (v39(v27, 1, v28) != 1)
  {
    (*(void (**)(char *, char *, void *))(v29 + 32))(v32, v27, v96);
    uint64_t v51 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session;
    uint64_t v52 = v37;
    if (!*(void *)(v37 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session))
    {
      id v53 = objc_msgSend(self, sel_defaultSessionConfiguration);
      objc_msgSend(v53, sel_setAllowsConstrainedNetworkAccess_, 0);
      id v54 = objc_msgSend(self, sel_sessionWithConfiguration_, v53);
      os_log_type_t v55 = *(void **)(v52 + v51);
      *(void *)(v52 + v51) = v54;
    }
    uint64_t v100 = v29;
    BOOL v56 = v93;
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v57 = v101;
    uint64_t v58 = __swift_project_value_buffer(v101, (uint64_t)qword_26AD34308);
    (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v56, v58, v57);
    uint64_t v59 = sub_21E8EE550();
    os_log_type_t v60 = sub_21E8EEAF0();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = v102;
      uint64_t v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t v99 = v51;
      uint64_t v64 = v63;
      *(_DWORD *)uint64_t v62 = 136315138;
      uint64_t v65 = *(void *)&aTotal_2[8 * v94];
      aBlock[0] = v64;
      uint64_t v104 = sub_21E8CD144(v65, qword_21E910488[v94], aBlock);
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E8AA000, v59, v60, "Starting download task for cloud data: %s", v62, 0xCu);
      swift_arrayDestroy();
      uint64_t v66 = v64;
      uint64_t v67 = v99;
      MEMORY[0x223C355E0](v66, -1, -1);
      MEMORY[0x223C355E0](v62, -1, -1);

      (*(void (**)(char *, uint64_t))(v61 + 8))(v93, v101);
      uint64_t v68 = *(void **)(v52 + v67);
      if (!v68) {
        goto LABEL_17;
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v102 + 8))(v56, v101);
      uint64_t v68 = *(void **)(v52 + v51);
      if (!v68)
      {
LABEL_17:
        (*(void (**)(char *, void *))(v100 + 8))(v32, v96);
        goto LABEL_18;
      }
    }
    char v72 = v94;
    id v73 = v68;
    uint64_t v74 = (void *)sub_21E8EE360();
    uint64_t v75 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v76 = swift_allocObject();
    uint64_t v77 = v84;
    *(void *)(v76 + 16) = v75;
    *(void *)(v76 + 24) = v77;
    uint64_t v78 = v98;
    *(void *)(v76 + 32) = sub_21E8ED574;
    *(void *)(v76 + 40) = v78;
    *(unsigned char *)(v76 + 48) = v72;
    aBlock[4] = (uint64_t)sub_21E8ED57C;
    aBlock[5] = v76;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21E8E41E4;
    aBlock[3] = (uint64_t)&block_descriptor_139;
    uint64_t v79 = _Block_copy(aBlock);
    id v80 = v77;
    swift_retain();
    swift_release();
    id v81 = objc_msgSend(v73, sel_downloadTaskWithRequest_completionHandler_, v74, v79);
    _Block_release(v79);

    objc_msgSend(v81, sel_resume);
    goto LABEL_17;
  }
  sub_21E8D911C((uint64_t)v27, &qword_26AD344C0);
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v40 = v101;
  uint64_t v41 = __swift_project_value_buffer(v101, (uint64_t)qword_26AD34308);
  uint64_t v42 = v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v85, v41, v40);
  uint64_t v43 = sub_21E8EE550();
  os_log_type_t v44 = sub_21E8EEAD0();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = v102;
    id v46 = v38;
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v49 = *(void *)&aTotal_2[8 * v94];
    aBlock[0] = v48;
    uint64_t v104 = sub_21E8CD144(v49, qword_21E910488[v94], aBlock);
    sub_21E8EEBF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E8AA000, v43, v44, "Failed to build urlRequest for cloudLevel %s.", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v48, -1, -1);
    uint64_t v50 = v47;
    id v38 = v46;
    MEMORY[0x223C355E0](v50, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v101);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v102 + 8))(v42, v101);
  }
  uint64_t v69 = (uint64_t)v87;
  *uint64_t v87 = 0;
  swift_storeEnumTagMultiPayload();
  uint64_t v70 = v92;
  swift_retain();
  uint64_t v71 = v91;
  swift_retain();
  sub_21E8E94E8(v69, v99, v100, v38, v90, v70, v88, v89, a9, v71);
  swift_release();
  swift_release();
  sub_21E8D911C(v69, (uint64_t *)&unk_26AD34548);
LABEL_18:
  swift_release();
  return swift_release();
}

uint64_t sub_21E8EAC08(unsigned __int8 *a1, void *a2, char a3, void *a4, void *a5, uint64_t a6, int a7, uint64_t a8, void *a9, void *a10)
{
  id v84 = a2;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34328);
  MEMORY[0x270FA5388](v17 - 8, v18);
  uint64_t v79 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_21E8EE490();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v82 = v20;
  uint64_t v83 = v21;
  MEMORY[0x270FA5388](v20, v22);
  uint64_t v76 = (char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_21E8EE570();
  uint64_t v78 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81, v24);
  uint64_t v77 = (char *)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = a5;
  *(void *)(v26 + 24) = a6;
  int v80 = a7;
  *(unsigned char *)(v26 + 32) = a7;
  *(void *)(v26 + 40) = a8;
  *(void *)(v26 + 48) = a9;
  *(void *)(v26 + 56) = a10;
  uint64_t v27 = *a1;
  if (a3)
  {
    id v28 = a5;
    swift_retain();
    swift_retain();
    id v29 = a9;
    id v30 = a10;
LABEL_4:
    swift_beginAccess();
    sub_21E8E8020(v87, v27);
    swift_endAccess();
    uint64_t v33 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v34 = qword_267D47E38;
    swift_retain();
    if (v34 != -1) {
      swift_once();
    }
    uint64_t v35 = qword_267D48AB0;
    double v36 = *(double *)&qword_267D48AB8;
    LOBYTE(v88[0]) = v27;
    uint64_t v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v38 = v84;
    sub_21E8EA28C((char *)v88, v38, (uint64_t)a4, v35, v27, v38, v37, v33, v36, v27, sub_21E8ED510, (void (*)(void, void))v26);
    swift_release();
    swift_release_n();

    return swift_release();
  }
  LOBYTE(v88[0]) = v27;
  id v31 = a5;
  swift_retain();
  swift_retain();
  uint64_t v75 = a9;
  uint64_t v32 = a10;
  if (sub_21E8E008C((unsigned __int8 *)v88)) {
    goto LABEL_4;
  }
  uint64_t v39 = a8;
  uint64_t v40 = a6;
  uint64_t v73 = v39;
  id v84 = v31;
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v74 = v32;
  uint64_t v41 = v81;
  uint64_t v42 = __swift_project_value_buffer(v81, (uint64_t)qword_26AD34308);
  os_log_type_t v44 = v77;
  uint64_t v43 = v78;
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v77, v42, v41);
  uint64_t v45 = a4;
  id v46 = sub_21E8EE550();
  os_log_type_t v47 = sub_21E8EEAB0();
  char v72 = v46;
  int v71 = v47;
  BOOL v48 = os_log_type_enabled(v46, v47);
  p_weak_ivar_lyt = &AegirCloudCoverService.weak_ivar_lyt;
  uint64_t v50 = v82;
  uint64_t v51 = v83;
  if (v48)
  {
    uint64_t v52 = swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    v88[0] = v69;
    *(_DWORD *)uint64_t v52 = 136315394;
    id v53 = &v45[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory];
    swift_beginAccess();
    id v54 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
    os_log_type_t v55 = v76;
    v54(v76, v53, v50);
    LOBYTE(v86) = v27;
    sub_21E8DAB3C();
    uint64_t v70 = v40;
    sub_21E8EE440();
    swift_bridgeObjectRelease();
    uint64_t v68 = v52 + 4;
    sub_21E8EE450();
    sub_21E8ED7B8(&qword_267D48290, MEMORY[0x263F06EA8]);
    uint64_t v56 = sub_21E8EED20();
    unint64_t v58 = v57;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v55, v50);
    uint64_t v86 = sub_21E8CD144(v56, v58, v88);
    sub_21E8EEBF0();

    uint64_t v51 = v83;
    swift_bridgeObjectRelease();
    *(_WORD *)(v52 + 12) = 1024;
    uint64_t v59 = &v45[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch];
    swift_beginAccess();
    LODWORD(v59) = *v59;

    int v85 = (int)v59;
    p_weak_ivar_lyt = (void **)(&AegirCloudCoverService + 56);
    sub_21E8EEBF0();

    os_log_type_t v60 = v72;
    _os_log_impl(&dword_21E8AA000, v72, (os_log_type_t)v71, "Retrieving cloud texture from local cache: %s - Is Fetch Disabled: %{BOOL}d", (uint8_t *)v52, 0x12u);
    uint64_t v61 = v44;
    uint64_t v62 = v69;
    swift_arrayDestroy();
    MEMORY[0x223C355E0](v62, -1, -1);
    MEMORY[0x223C355E0](v52, -1, -1);

    uint64_t v40 = v70;
    uint64_t v63 = v61;
    uint64_t v50 = v82;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v63, v81);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v41);
  }
  uint64_t v64 = v73;
  uint64_t v65 = (char *)p_weak_ivar_lyt[256] + (void)v45;
  swift_beginAccess();
  uint64_t v66 = (uint64_t)v79;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v79, v65, v50);
  LOBYTE(v85) = v27;
  sub_21E8DAB3C();
  sub_21E8EE440();
  swift_bridgeObjectRelease();
  sub_21E8EE450();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v66, 0, 1, v50);
  sub_21E8DD6F8(v66, v84, v40, v80, v64, v75, v74);
  sub_21E8D911C(v66, &qword_26AD34328);
  return swift_release();
}

void sub_21E8EB3A8(void *a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v67 = a1;
  uint64_t v7 = sub_21E8EE570();
  uint64_t v63 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v70 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21E8EE8F0();
  uint64_t v59 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v11);
  unint64_t v57 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_21E8EE910();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58, v13);
  os_log_type_t v55 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  uint64_t v60 = v15;
  id v16 = objc_allocWithZone(MEMORY[0x263F08958]);
  swift_retain();
  id v68 = objc_msgSend(v16, sel_init);
  uint64_t v17 = dispatch_group_create();
  uint64_t v69 = swift_allocObject();
  *(void *)(v69 + 16) = MEMORY[0x263F8EE80];
  BOOL v18 = sub_21E8DD2B4();
  if (qword_26AD34320 != -1) {
    swift_once();
  }
  uint64_t v65 = __swift_project_value_buffer(v7, (uint64_t)qword_26AD34308);
  uint64_t v19 = sub_21E8EE550();
  os_log_type_t v20 = sub_21E8EEAF0();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v71 = v7;
  if (v21)
  {
    uint64_t v22 = v17;
    uint64_t v23 = a3;
    uint64_t v24 = a2;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 67109120;
    LODWORD(aBlock[0]) = v18;
    sub_21E8EEBF0();
    _os_log_impl(&dword_21E8AA000, v19, v20, "Retrieving all cloud textures. Will Fetch Data: %{BOOL}d", v25, 8u);
    uint64_t v26 = v25;
    a2 = v24;
    a3 = v23;
    uint64_t v17 = v22;
    MEMORY[0x223C355E0](v26, -1, -1);
  }

  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 0;
  if (v18)
  {
    uint64_t v28 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer;
    if (*(void *)&a2[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_dispatchSourceTimer])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_21E8EEBC0();
      swift_unknownObjectRelease();
    }
    id v29 = v70;
    *(void *)&a2[v28] = 0;
    swift_unknownObjectRelease();
    if (qword_26AD34380 != -1) {
      swift_once();
    }
    uint64_t v30 = v71;
    uint64_t v72 = *(void *)(qword_26AD347E8 + 16);
    uint64_t v66 = v27;
    if (v72)
    {
      uint64_t v54 = v10;
      id v31 = (void (**)(char *, uint64_t, uint64_t))(v63 + 2);
      ++v63;
      uint64_t v64 = v31;
      uint64_t v32 = swift_bridgeObjectRetain();
      uint64_t v33 = 0;
      *(void *)&long long v34 = 136315138;
      long long v62 = v34;
      uint64_t v61 = MEMORY[0x263F8EE58] + 8;
      do
      {
        uint64_t v35 = v32;
        uint64_t v36 = *(unsigned __int8 *)(v32 + v33++ + 32);
        dispatch_group_enter(v17);
        switch(v36)
        {
          case 4:
            swift_bridgeObjectRelease();
            break;
          default:
            char v37 = sub_21E8EED40();
            swift_bridgeObjectRelease();
            if ((v37 & 1) == 0)
            {
              (*v64)(v29, v65, v30);
              id v38 = sub_21E8EE550();
              os_log_type_t v39 = sub_21E8EEAF0();
              if (os_log_type_enabled(v38, v39))
              {
                uint64_t v40 = v17;
                uint64_t v41 = swift_slowAlloc();
                uint64_t v42 = swift_slowAlloc();
                aBlock[0] = v42;
                *(_DWORD *)uint64_t v41 = v62;
                *(void *)(v41 + 4) = sub_21E8CD144(*(void *)&aTotal_3[8 * (char)v36], qword_21E910440[(char)v36], aBlock);
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_21E8AA000, v38, v39, "Fetching cloud textures for level: %s", (uint8_t *)v41, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x223C355E0](v42, -1, -1);
                uint64_t v43 = v41;
                uint64_t v17 = v40;
                MEMORY[0x223C355E0](v43, -1, -1);

                (*v63)(v70, v71);
              }
              else
              {

                (*v63)(v29, v30);
              }
              LOBYTE(aBlock[0]) = v36;
              uint64_t v44 = v69;
              swift_retain();
              uint64_t v45 = v66;
              swift_retain();
              id v46 = a2;
              id v47 = v68;
              BOOL v48 = v17;
              sub_21E8EAC08((unsigned __int8 *)aBlock, v67, 0, v46, v47, v44, v36, v45, v46, v48);

              swift_release();
              swift_release();

              id v29 = v70;
              uint64_t v30 = v71;
            }
            break;
        }
        uint64_t v32 = v35;
      }
      while (v72 != v33);
      swift_bridgeObjectRelease();
      uint64_t v10 = v54;
      uint64_t v27 = v66;
    }
    uint64_t v49 = (void *)swift_allocObject();
    v49[2] = a2;
    v49[3] = v27;
    v49[4] = v69;
    v49[5] = sub_21E8ED2FC;
    v49[6] = v60;
    aBlock[4] = (uint64_t)sub_21E8ED3BC;
    aBlock[5] = (uint64_t)v49;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21E8DA510;
    aBlock[3] = (uint64_t)&block_descriptor_109;
    uint64_t v50 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    uint64_t v51 = a2;
    swift_retain();
    uint64_t v52 = v55;
    sub_21E8EE900();
    uint64_t v73 = MEMORY[0x263F8EE78];
    sub_21E8ED7B8(&qword_26AD34438, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34450);
    sub_21E8D8F68(&qword_26AD34458, &qword_26AD34450);
    id v53 = v57;
    sub_21E8EEC20();
    sub_21E8EEB00();
    _Block_release(v50);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v53, v10);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v52, v58);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    sub_21E8DC07C();
    a3();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21E8EBCD8(char *a1, void *a2, char *a3, void (*a4)(char *), void (*a5)(void, void), uint64_t a6, int a7, void *a8, double a9, uint64_t a10)
{
  int v85 = a3;
  uint64_t v75 = a2;
  id v84 = a1;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD34548);
  MEMORY[0x270FA5388](v77, v16);
  uint64_t v78 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21E8EE570();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v86 = v18;
  uint64_t v87 = v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18, v20);
  uint64_t v83 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v23);
  uint64_t v76 = (char *)&v74 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344C0);
  MEMORY[0x270FA5388](v25 - 8, v26);
  uint64_t v28 = (char *)&v74 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_21E8EE390();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v31);
  uint64_t v33 = (char *)&v74 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = swift_allocObject();
  uint64_t v79 = a4;
  *(void *)(v34 + 16) = a4;
  *(void *)(v34 + 24) = a5;
  uint64_t v81 = a6;
  *(void *)(v34 + 32) = a6;
  *(double *)(v34 + 40) = a9;
  LODWORD(v82) = a7;
  *(unsigned char *)(v34 + 48) = a7;
  *(void *)(v34 + 56) = a8;
  *(void *)(v34 + 64) = a10;
  uint64_t v35 = v34;
  uint64_t v36 = v85;
  id v84 = (char *)*v84;
  LOBYTE(aBlock[0]) = (_BYTE)v84;
  swift_retain();
  char v37 = a8;
  uint64_t v80 = a10;
  swift_retain();
  id v38 = v36;
  sub_21E8E5B10((uint64_t)v28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
  {
    sub_21E8D911C((uint64_t)v28, &qword_26AD344C0);
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v39 = v86;
    uint64_t v40 = __swift_project_value_buffer(v86, (uint64_t)qword_26AD34308);
    uint64_t v41 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v76, v40, v39);
    uint64_t v42 = sub_21E8EE550();
    os_log_type_t v43 = sub_21E8EEAD0();
    if (os_log_type_enabled(v42, v43))
    {
      int v85 = v37;
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      uint64_t v46 = *(void *)&aTotal_2[8 * (void)v84];
      aBlock[0] = v45;
      uint64_t v89 = sub_21E8CD144(v46, qword_21E910488[(void)v84], aBlock);
      sub_21E8EEBF0();
      char v37 = v85;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E8AA000, v42, v43, "Failed to build urlRequest for cloudLevel %s.", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v45, -1, -1);
      MEMORY[0x223C355E0](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v87 + 8))(v41, v86);
    uint64_t v47 = (uint64_t)v78;
    *uint64_t v78 = 0;
    swift_storeEnumTagMultiPayload();
    sub_21E8E2160(v47, v79, a5, v81, v82, v37, v80, a9);
    sub_21E8D911C(v47, (uint64_t *)&unk_26AD34548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v33, v28, v29);
    uint64_t v48 = OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session;
    if (!*(void *)&v36[OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_session])
    {
      id v49 = objc_msgSend(self, sel_defaultSessionConfiguration);
      objc_msgSend(v49, sel_setAllowsConstrainedNetworkAccess_, 0);
      id v50 = objc_msgSend(self, sel_sessionWithConfiguration_, v49);
      uint64_t v51 = *(void **)&v38[v48];
      *(void *)&v38[v48] = v50;
    }
    uint64_t v52 = v35;
    if (qword_26AD34320 != -1) {
      swift_once();
    }
    uint64_t v53 = v86;
    uint64_t v54 = __swift_project_value_buffer(v86, (uint64_t)qword_26AD34308);
    os_log_type_t v55 = v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v83, v54, v53);
    uint64_t v56 = sub_21E8EE550();
    os_log_type_t v57 = sub_21E8EEAF0();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v81 = v59;
      int v85 = (char *)v29;
      *(_DWORD *)uint64_t v58 = 136315138;
      uint64_t v60 = *(void *)&aTotal_2[8 * (void)v84];
      aBlock[0] = v59;
      unint64_t v61 = qword_21E910488[(void)v84];
      uint64_t v82 = v52;
      uint64_t v89 = sub_21E8CD144(v60, v61, aBlock);
      uint64_t v52 = v82;
      uint64_t v29 = (uint64_t)v85;
      sub_21E8EEBF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E8AA000, v56, v57, "Starting download task for cloud data: %s", v58, 0xCu);
      uint64_t v62 = v81;
      swift_arrayDestroy();
      MEMORY[0x223C355E0](v62, -1, -1);
      MEMORY[0x223C355E0](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v87 + 8))(v83, v86);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v87 + 8))(v55, v86);
    }
    uint64_t v63 = *(void **)&v38[v48];
    if (v63)
    {
      char v64 = (char)v84;
      id v65 = v63;
      uint64_t v66 = (void *)sub_21E8EE360();
      uint64_t v67 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v68 = swift_allocObject();
      uint64_t v69 = v75;
      *(void *)(v68 + 16) = v67;
      *(void *)(v68 + 24) = v69;
      *(void *)(v68 + 32) = sub_21E8ED574;
      *(void *)(v68 + 40) = v52;
      *(unsigned char *)(v68 + 48) = v64;
      aBlock[4] = (uint64_t)sub_21E8ED57C;
      aBlock[5] = v68;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21E8E41E4;
      aBlock[3] = (uint64_t)&block_descriptor_182;
      uint64_t v70 = _Block_copy(aBlock);
      id v71 = v69;
      swift_retain();
      swift_release();
      id v72 = objc_msgSend(v65, sel_downloadTaskWithRequest_completionHandler_, v66, v70);
      _Block_release(v70);

      objc_msgSend(v72, sel_resume);
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
  }
  return swift_release();
}

uint64_t _s12NanoUniverse22AegirCloudCoverServiceC03allD14LevelFileNamesSaySSGvg_0()
{
  if (qword_26AD34380 != -1) {
    swift_once();
  }
  int64_t v0 = *(void *)(qword_26AD347E8 + 16);
  uint64_t v1 = MEMORY[0x263F8EE78];
  if (v0)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21E8E73B4(0, v0, 0);
    uint64_t v2 = 0;
    uint64_t v1 = v7;
    do
    {
      sub_21E8EEA20();
      swift_bridgeObjectRelease();
      unint64_t v4 = *(void *)(v7 + 16);
      unint64_t v3 = *(void *)(v7 + 24);
      if (v4 >= v3 >> 1) {
        sub_21E8E73B4(v3 > 1, v4 + 1, 1);
      }
      ++v2;
      *(void *)(v7 + 16) = v4 + 1;
      uint64_t v5 = v7 + 16 * v4;
      *(void *)(v5 + 32) = 0x61632D632D333070;
      *(void *)(v5 + 40) = 0xEF2D65706F696C6CLL;
    }
    while (v0 != v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

unint64_t sub_21E8EC6E0()
{
  unint64_t result = qword_26AD34500;
  if (!qword_26AD34500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD34500);
  }
  return result;
}

uint64_t sub_21E8EC734()
{
  return sub_21E8D8F68(&qword_267D48298, &qword_267D482A0);
}

uint64_t sub_21E8EC770@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_21E8EC7CC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21E8EC820(char *a1, void *a2)
{
  char v2 = *a1;
  unint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = v2;
  return result;
}

uint64_t sub_21E8EC878()
{
  return type metadata accessor for AegirCloudCoverService();
}

uint64_t sub_21E8EC880()
{
  uint64_t result = sub_21E8EE490();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for AegirCloudCoverService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AegirCloudCoverService);
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.fileConverter.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.disableFetch.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AegirCloudCoverService.directory.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AegirCloudCoverService.__allocating_init(configuration:imageScale:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of AegirCloudCoverService.retrieveCloudTextureURLs(notifyOn:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AegirCloudCoverService.cloudTextureURLs()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AegirCloudCoverService.canFetchData.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AegirCloudCoverService.deleteCache()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t initializeBufferWithCopyOfBuffer for AegirCloudCoverService.Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AegirCloudCoverService.Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AegirCloudCoverService.Configuration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AegirCloudCoverService.Configuration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AegirCloudCoverService.Configuration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.Configuration()
{
  return &type metadata for AegirCloudCoverService.Configuration;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.RetryStrategy(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AegirCloudCoverService.RetryStrategy(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.RetryStrategy()
{
  return &type metadata for AegirCloudCoverService.RetryStrategy;
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.CloudLevel(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AegirCloudCoverService.CloudLevel(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21E8ED088);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_21E8ED0B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E8ED0B8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.CloudLevel()
{
  return &type metadata for AegirCloudCoverService.CloudLevel;
}

uint64_t sub_21E8ED0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD344C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E8ED138()
{
  uint64_t v1 = sub_21E8EE490();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_21E8ED204()
{
  uint64_t v1 = *(void *)(sub_21E8EE490() - 8);
  uint64_t v2 = *(void (**)(char *))(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_21E8E5554(v2, v3, v4);
}

void sub_21E8ED268()
{
}

uint64_t sub_21E8ED270(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21E8ED2AC()
{
  return sub_21E8DF780(*(char **)(v0 + 16));
}

void sub_21E8ED2B4()
{
}

uint64_t sub_21E8ED2BC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21E8ED2F4(uint64_t a1)
{
  sub_21E8DC010(a1, *(void *)(v1 + 16));
}

uint64_t sub_21E8ED2FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21E8ED324()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8ED35C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_21E8ED36C()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21E8ED3BC()
{
  return sub_21E8DE388(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40));
}

uint64_t sub_21E8ED3CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8ED404()
{
  uint64_t v1 = *(unsigned char **)(v0 + 24);
  swift_beginAccess();
  return sub_21E8DECB0((*v1 & 1) == 0);
}

uint64_t sub_21E8ED454()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_21E8ED464()
{
  unint64_t result = qword_26AD344F0;
  if (!qword_26AD344F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD344F0);
  }
  return result;
}

uint64_t sub_21E8ED4B8()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_21E8ED510(uint64_t a1)
{
  sub_21E8DD6F8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), *(char **)(v1 + 48), *(NSObject **)(v1 + 56));
}

uint64_t sub_21E8ED524()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8ED560(uint64_t a1)
{
  return sub_21E8DFED4(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
}

uint64_t sub_21E8ED580()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8ED5B8()
{
  return sub_21E8E4060(*(void (**)(unsigned char *))(v0 + 16));
}

uint64_t sub_21E8ED5D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E8ED614()
{
  return sub_21E8E410C(*(void (**)(BOOL *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t objectdestroy_128Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21E8ED664(unsigned char *a1@<X8>)
{
  sub_21E8DFFE0(*(void *)(v1 + 16), *(unsigned char *)(v1 + 24), a1);
}

uint64_t objectdestroy_131Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_21E8ED6D8(uint64_t a1)
{
  return sub_21E8E2160(a1, *(void (**)(char *))(v1 + 16), *(void (**)(void, void))(v1 + 24), *(void *)(v1 + 32), *(unsigned __int8 *)(v1 + 48), *(void **)(v1 + 56), *(void *)(v1 + 64), *(double *)(v1 + 40));
}

uint64_t objectdestroy_135Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_21E8ED73C(uint64_t a1, void *a2, void *a3)
{
  return sub_21E8E2DC0(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(unsigned __int8 *)(v3 + 48));
}

uint64_t objectdestroy_164Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_21E8ED798()
{
  sub_21E8E2CB4(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void (**)(char *))(v0 + 56), *(void (**)(void, void))(v0 + 64), *(double *)(v0 + 48));
}

uint64_t sub_21E8ED7B0()
{
  return swift_release();
}

uint64_t sub_21E8ED7B8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_21E8ED800()
{
}

uint64_t getEnumTagSinglePayload for AegirCloudCoverService.ServerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AegirCloudCoverService.ServerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21E8ED964);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_21E8ED98C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AegirCloudCoverService.ServerError()
{
  return &type metadata for AegirCloudCoverService.ServerError;
}

unint64_t sub_21E8ED9AC()
{
  unint64_t result = qword_267D482C0;
  if (!qword_267D482C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D482C0);
  }
  return result;
}

void sub_21E8EDAC8(unsigned char *a1@<X8>)
{
}

uint64_t sub_21E8EDAE0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void _NUNICreateImageFromURL_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 path];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: unable to open png %@ ", (uint8_t *)&v4, 0xCu);
}

void _NUNCalliopeCreateTexture_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E8AA000, log, OS_LOG_TYPE_ERROR, "failed to create texture", v1, 2u);
}

void NUNILoadMtlTextureFromMemory_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E8AA000, a2, OS_LOG_TYPE_ERROR, "_loadMtlTextureFromMemory:%@ failed to get backing", (uint8_t *)&v2, 0xCu);
}

void NUNILoadMtlTextureFromMemory_cold_2()
{
  __assert_rtn("_NUNILoadMtlTextureFromBacking", "NUNIClassicRenderer.m", 1048, "opt.planes == 6");
}

uint64_t sub_21E8EE360()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_21E8EE370()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_21E8EE380()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_21E8EE390()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_21E8EE3A0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_21E8EE3B0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_21E8EE3C0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_21E8EE3D0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_21E8EE3E0()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_21E8EE3F0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_21E8EE400()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21E8EE410()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21E8EE420()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_21E8EE430()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21E8EE440()
{
  return MEMORY[0x270EEFD38]();
}

uint64_t sub_21E8EE450()
{
  return MEMORY[0x270EEFD48]();
}

uint64_t sub_21E8EE460()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21E8EE470()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21E8EE480()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_21E8EE490()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21E8EE4A0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_21E8EE4B0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_21E8EE4C0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21E8EE4D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21E8EE4E0()
{
  return MEMORY[0x270F85080]();
}

uint64_t sub_21E8EE4F0()
{
  return MEMORY[0x270F85088]();
}

uint64_t sub_21E8EE500()
{
  return MEMORY[0x270F85100]();
}

uint64_t sub_21E8EE510()
{
  return MEMORY[0x270F85108]();
}

uint64_t sub_21E8EE520()
{
  return MEMORY[0x270F85118]();
}

uint64_t sub_21E8EE530()
{
  return MEMORY[0x270F851E0]();
}

uint64_t sub_21E8EE540()
{
  return MEMORY[0x270F851E8]();
}

uint64_t sub_21E8EE550()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E8EE560()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21E8EE570()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E8EE580()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21E8EE590()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_21E8EE5A0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21E8EE5B0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_21E8EE5C0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_21E8EE5D0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_21E8EE5E0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21E8EE5F0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21E8EE600()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21E8EE610()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_21E8EE620()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_21E8EE630()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_21E8EE640()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_21E8EE650()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_21E8EE660()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_21E8EE670()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_21E8EE680()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_21E8EE690()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_21E8EE6A0()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_21E8EE6B0()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_21E8EE6C0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_21E8EE6D0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_21E8EE6E0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_21E8EE6F0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_21E8EE700()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_21E8EE710()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21E8EE720()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_21E8EE730()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_21E8EE740()
{
  return MEMORY[0x270F01A50]();
}

uint64_t sub_21E8EE750()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_21E8EE760()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_21E8EE770()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21E8EE780()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_21E8EE790()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_21E8EE7A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_21E8EE7B0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21E8EE7C0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21E8EE7D0()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_21E8EE7E0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21E8EE7F0()
{
  return MEMORY[0x270F037F0]();
}

uint64_t sub_21E8EE800()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_21E8EE810()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_21E8EE830()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_21E8EE840()
{
  return MEMORY[0x270F048E0]();
}

uint64_t sub_21E8EE850()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_21E8EE860()
{
  return MEMORY[0x270F04A40]();
}

uint64_t sub_21E8EE870()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_21E8EE880()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_21E8EE890()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_21E8EE8A0()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_21E8EE8B0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_21E8EE8C0()
{
  return MEMORY[0x270F04D28]();
}

uint64_t sub_21E8EE8D0()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_21E8EE8E0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21E8EE8F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21E8EE900()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21E8EE910()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21E8EE920()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21E8EE930()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21E8EE940()
{
  return MEMORY[0x270FA0B08]();
}

uint64_t sub_21E8EE950()
{
  return MEMORY[0x270FA0B20]();
}

uint64_t sub_21E8EE960()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_21E8EE970()
{
  return MEMORY[0x270FA0BD0]();
}

uint64_t sub_21E8EE980()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E8EE990()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21E8EE9A0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21E8EE9B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21E8EE9C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E8EE9D0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21E8EE9E0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21E8EE9F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E8EEA00()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21E8EEA10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E8EEA20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21E8EEA30()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21E8EEA40()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E8EEA50()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E8EEA60()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21E8EEA70()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21E8EEA80()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21E8EEA90()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21E8EEAA0()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_21E8EEAB0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21E8EEAC0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21E8EEAD0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21E8EEAE0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21E8EEAF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21E8EEB00()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_21E8EEB10()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21E8EEB20()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_21E8EEB30()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21E8EEB40()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21E8EEB50()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_21E8EEB60()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21E8EEB70()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21E8EEB80()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_21E8EEB90()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_21E8EEBA0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_21E8EEBB0()
{
  return MEMORY[0x270FA0EA8]();
}

uint64_t sub_21E8EEBC0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_21E8EEBD0()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_21E8EEBE0()
{
  return MEMORY[0x270FA0F50]();
}

uint64_t sub_21E8EEBF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21E8EEC00()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21E8EEC10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21E8EEC20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21E8EEC30()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21E8EEC40()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21E8EEC50()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21E8EEC60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21E8EEC70()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E8EEC80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21E8EEC90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21E8EECA0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E8EECB0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21E8EECC0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E8EECD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21E8EECE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E8EED00()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21E8EED10()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21E8EED20()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21E8EED30()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21E8EED40()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E8EED50()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21E8EED60()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E8EED70()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21E8EED80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21E8EED90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21E8EEDA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21E8EEDB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21E8EEDC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E8EEDD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E8EEDE0()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6740](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

uint64_t CLKEqualObjects()
{
  return MEMORY[0x270EE3188]();
}

uint64_t CLKRoundDateDownToNearestMinute()
{
  return MEMORY[0x270EE3248]();
}

uint64_t CLKUIComputeDimmingRequiredToObtainQuadAPL()
{
  return MEMORY[0x270F168E8]();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return MEMORY[0x270F168F0]();
}

uint64_t CLKUIImageNamedFromBundleForDevice()
{
  return MEMORY[0x270F16918]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}