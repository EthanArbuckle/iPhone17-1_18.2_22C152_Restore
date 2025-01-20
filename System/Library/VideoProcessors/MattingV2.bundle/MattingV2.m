void sub_262F4837C(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_262F4838C()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262F483C0(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (objc_msgSend_status(v8, v2, v3) == 4)
  {
    objc_msgSend_GPUEndTime(v8, v4, v5);
    objc_msgSend_GPUStartTime(v8, v6, v7);
  }
  else
  {
    objc_msgSend_status(v8, v4, v5);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

FILE *sub_262F497E4(const char *a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"%s", a1);
  v6 = objc_msgSend_stringByDeletingLastPathComponent(v3, v4, v5);
  v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8);
  id v16 = 0;
  char v11 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v9, v10, (uint64_t)v6, 1, 0, &v16);
  id v12 = v16;
  v13 = v12;
  if (v11)
  {
    v14 = fopen(a1, "wb");
  }
  else
  {
    NSLog(&cfstr_FailedToCreate.isa, v6, v12);
    v14 = 0;
  }

  return v14;
}

FILE *sub_262F49D70(unsigned int a1, const char *a2, unsigned int a3, unsigned char *a4, const char *a5)
{
  int v7 = (int)a2;
  uint64_t result = sub_262F497E4(a5, a2);
  if (result)
  {
    v10 = result;
    char v11 = malloc_type_malloc(3 * a1, 0x208AAB68uLL);
    if (v11)
    {
      id v12 = v11;
      fprintf(v10, "P6 %u %u 255\n", a1, v7);
      if (v7)
      {
        for (int i = 0; i != v7; ++i)
        {
          unsigned int v14 = a1;
          v15 = v12;
          for (j = a4; v14; --v14)
          {
            unsigned char *v15 = *j;
            v15[1] = j[1];
            v15[2] = j[2];
            j += 4;
            v15 += 3;
          }
          fwrite(v12, 3uLL, a1, v10);
          a4 += a3;
        }
      }
      free(v12);
    }
    return (FILE *)fclose(v10);
  }
  return result;
}

float *sub_262F4E0F4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  v17 = (float *)malloc_type_malloc(0x18uLL, 0x10200405AF6BDC9uLL);
  if (a2 < 0) {
    sub_262F4F5AC();
  }
  if (a3 < 0) {
    sub_262F4F5D8();
  }
  if (a4 < 0) {
    sub_262F4F604();
  }
  if (a5 < 0) {
    sub_262F4F630();
  }
  if (a6 < 0) {
    sub_262F4F65C();
  }
  if (a7 < 0) {
    sub_262F4F688();
  }
  int v18 = a2 * a1;
  uint64_t v19 = (a2 * a1 / 100);
  int v20 = a3 * a1;
  int v21 = a3 * a1 / 100;
  v104[0] = v19;
  v104[1] = v21;
  int v22 = a4 * a1;
  int v23 = a4 * a1 / 100;
  int v24 = a5 * a1;
  int v25 = a5 * a1 / 100;
  v104[2] = v23;
  v104[3] = v25;
  int v26 = a6 * a1;
  int v27 = a6 * a1 / 100;
  int v28 = a7 * a1;
  int v29 = a7 * a1 / 100;
  v104[4] = v27;
  v104[5] = v29;
  int v30 = v21 + v19 + v23 + v25;
  if ((v30 + v27 + v29 < 0) ^ __OFADD__(v30, v27 + v29) | (v30 + v27 + v29 == 0)) {
    sub_262F4F6B4();
  }
  v31 = v17;
  int v101 = v24;
  int v102 = v22;
  int v99 = v28;
  int v100 = v26;
  *((_DWORD *)v17 + 2) = v30 + v27 + v29;
  unsigned int v32 = v30 + v27 + v29;
  *(void *)v17 = malloc_type_malloc(3 * v32, 0x100004033FC2DF1uLL);
  *((_DWORD *)v31 + 3) = a8;
  if (v18 < 100)
  {
    unsigned int v38 = 0;
    int v36 = v32;
  }
  else
  {
    int v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 1;
    int v36 = v32;
    do
    {
      if (v34 >= *((int *)v31 + 2)) {
        sub_262F4F6E0();
      }
      ++v34;
      v37 = (unsigned char *)(*(void *)v31 + v35);
      *(v37 - 1) = 0;
      unsigned char *v37 = v33 / (int)v19;
      v37[1] = -1;
      v35 += 3;
      v33 += 255;
    }
    while (v19 != v34);
    unsigned int v38 = v18 / 100;
  }
  if (v20 >= 100)
  {
    int v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = v38;
    uint64_t v42 = 3 * v38;
    do
    {
      if (v41 + v40 >= *((int *)v31 + 2)) {
        sub_262F4F6E0();
      }
      uint64_t v43 = *(void *)v31 + v42;
      *(_WORD *)uint64_t v43 = -256;
      *(unsigned char *)(v43 + 2) = ~(v39 / v21);
      v42 += 3;
      ++v40;
      v39 += 255;
    }
    while (v21 != v40);
    unsigned int v38 = v41 + v40;
  }
  if (v102 >= 100)
  {
    int v44 = 0;
    int v45 = 0;
    uint64_t v46 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v45)) {
        sub_262F4F6E0();
      }
      uint64_t v47 = *(void *)v31 + v46;
      *(unsigned char *)uint64_t v47 = v44 / v23;
      *(_WORD *)(v47 + 1) = 255;
      ++v45;
      v46 += 3;
      v44 += 255;
    }
    while (v23 != v45);
    v38 += v45;
  }
  if (v101 >= 100)
  {
    int v48 = 0;
    int v49 = 0;
    uint64_t v50 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v49)) {
        sub_262F4F6E0();
      }
      uint64_t v51 = *(void *)v31 + v50;
      *(unsigned char *)uint64_t v51 = -1;
      *(_WORD *)(v51 + 1) = ~(v48 / v25);
      ++v49;
      v50 += 3;
      v48 += 255;
    }
    while (v25 != v49);
    v38 += v49;
  }
  if (v100 >= 100)
  {
    int v52 = 0;
    int v53 = 0;
    uint64_t v54 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v53)) {
        sub_262F4F6E0();
      }
      uint64_t v55 = *(void *)v31 + v54;
      *(_WORD *)uint64_t v55 = 255;
      *(unsigned char *)(v55 + 2) = v52 / v27;
      ++v53;
      v54 += 3;
      v52 += 255;
    }
    while (v27 != v53);
    v38 += v53;
  }
  if (v99 >= 100)
  {
    int v56 = 0;
    int v57 = 0;
    uint64_t v58 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v57)) {
        sub_262F4F6E0();
      }
      uint64_t v59 = *(void *)v31 + v58;
      *(unsigned char *)uint64_t v59 = ~(v56 / v29);
      *(_WORD *)(v59 + 1) = -256;
      ++v57;
      v58 += 3;
      v56 += 255;
    }
    while (v29 != v57);
  }
  if (a8 < 0 && v36 > 1)
  {
    uint64_t v60 = 0;
    uint64_t v61 = v36 >> 1;
    int v62 = v19 + v21 + v23 + v25 + v27 + v29 - 1;
    do
    {
      v63 = (__int16 *)(*(void *)v31 + v60);
      uint64_t v64 = *(void *)v31 + 3 * v62;
      char v65 = *((unsigned char *)v63 + 2);
      __int16 v66 = *v63;
      char v67 = *(unsigned char *)(v64 + 2);
      __int16 *v63 = *(_WORD *)v64;
      *((unsigned char *)v63 + 2) = v67;
      *(_WORD *)uint64_t v64 = v66;
      *(unsigned char *)(v64 + 2) = v65;
      --v62;
      v60 += 3;
      --v61;
    }
    while (v61);
  }
  if (a8 >= 0) {
    int v68 = a8;
  }
  else {
    int v68 = -a8;
  }
  unsigned int v69 = v68 - 1;
  LODWORD(v70) = 6 - v68;
  if (a8 >= 0) {
    uint64_t v70 = v69;
  }
  else {
    uint64_t v70 = v70;
  }
  if ((int)v70 >= 1)
  {
    int v71 = 0;
    v72 = v104;
    do
    {
      int v73 = v71;
      int v75 = *v72++;
      int v74 = v75;
      v71 += v75;
      --v70;
    }
    while (v70);
    if (v71 > 0)
    {
      v76 = *(__int16 **)v31;
      int v77 = v36 - 1;
      if (v71 != 1)
      {
        int v78 = 0;
        v79 = (__int16 *)((char *)v76 + 3 * (v71 - 1));
        int v80 = v73 + v74 - 2;
        v81 = *(__int16 **)v31;
        do
        {
          char v82 = *((unsigned char *)v81 + 2);
          __int16 v83 = *v81;
          char v84 = *((unsigned char *)v79 + 2);
          __int16 *v81 = *v79;
          *((unsigned char *)v81 + 2) = v84;
          __int16 *v79 = v83;
          *((unsigned char *)v79 + 2) = v82;
          v81 = (__int16 *)((char *)v81 + 3);
          v79 = (__int16 *)((char *)v79 - 3);
          BOOL v85 = ++v78 < v80--;
        }
        while (v85);
      }
      if (v71 < v77)
      {
        v86 = (__int16 *)((char *)v76 + 3 * v77);
        v87 = (__int16 *)((char *)v76 + 3 * v71);
        int v88 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v89 = *((unsigned char *)v87 + 2);
          __int16 v90 = *v87;
          char v91 = *((unsigned char *)v86 + 2);
          __int16 *v87 = *v86;
          *((unsigned char *)v87 + 2) = v91;
          __int16 *v86 = v90;
          *((unsigned char *)v86 + 2) = v89;
          v87 = (__int16 *)((char *)v87 + 3);
          v86 = (__int16 *)((char *)v86 - 3);
          BOOL v85 = ++v71 < v88--;
        }
        while (v85);
      }
      if (v36 >= 2)
      {
        int v92 = 0;
        v93 = (__int16 *)((char *)v76 + 3 * (v36 - 1));
        int v94 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v95 = *((unsigned char *)v76 + 2);
          __int16 v96 = *v76;
          char v97 = *((unsigned char *)v93 + 2);
          __int16 *v76 = *v93;
          *((unsigned char *)v76 + 2) = v97;
          __int16 *v93 = v96;
          *((unsigned char *)v93 + 2) = v95;
          v76 = (__int16 *)((char *)v76 + 3);
          v93 = (__int16 *)((char *)v93 - 3);
          BOOL v85 = ++v92 < v94--;
        }
        while (v85);
      }
    }
  }
  v31[4] = a9;
  return v31;
}

void sub_262F4E724(void ***a1)
{
  if (a1)
  {
    free(**a1);
    free(*a1);
    *a1 = 0;
  }
}

uint64_t sub_262F4E764(uint64_t a1, int a2, float a3, double a4, double a5, float a6)
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_262F4F70C();
  }
  int v7 = *(_DWORD *)(a1 + 8);
  float v8 = *(float *)(a1 + 16);
  if (v8 != 0.0)
  {
    float v9 = v8 / 6.28318531;
    a3 = v9 + a3;
    float v10 = 1.0;
    if (a3 < 0.0)
    {
LABEL_9:
      a3 = a3 + v10;
      goto LABEL_10;
    }
    if (a3 > 1.0)
    {
      float v10 = -1.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  float v11 = a3 * (float)(v7 - 1);
  int v12 = (int)v11;
  int v13 = ((int)v11 + 1) % v7;
  *(float *)&unsigned int v14 = (float)(int)v11;
  float v15 = v11 - *(float *)&v14;
  LOBYTE(v14) = *(unsigned char *)(*(void *)a1 + 3 * v12 + a2);
  LOBYTE(a6) = *(unsigned char *)(*(void *)a1 + 3 * v13 + a2);
  return (int)(float)((float)((float)(v15 * (float)((float)LODWORD(a6) / 255.0))
                                          + (float)((float)(1.0 - v15) * (float)((float)v14 / 255.0)))
                                  * 255.0);
}

uint64_t sub_262F4E84C(uint64_t result, int a2, int a3, float *a4, int a5, int a6, uint64_t a7, int a8, double a9, double a10, double a11, float a12, int a13)
{
  if (a3 >= 1)
  {
    int v13 = a4;
    uint64_t v14 = result;
    uint64_t v15 = 0;
    uint64_t v16 = a6;
    float v17 = 1.1755e-38;
    float v18 = 3.4028e38;
    uint64_t v19 = a4;
    uint64_t v20 = a2;
    do
    {
      uint64_t v21 = a2;
      int v22 = v19;
      if (a2 >= 1)
      {
        do
        {
          *(float *)&a10 = *v22;
          if (*v22 < v18) {
            float v18 = *v22;
          }
          if (*(float *)&a10 > v17) {
            float v17 = *v22;
          }
          int v22 = (float *)((char *)v22 + a6);
          --v21;
        }
        while (v21);
      }
      ++v15;
      uint64_t v19 = (float *)((char *)v19 + a5);
    }
    while (v15 != a3);
    uint64_t v23 = 0;
    float v24 = v17 - v18;
    uint64_t v35 = a8;
    int v25 = (unsigned char *)(a7 + 1);
    uint64_t v36 = a3;
    uint64_t v37 = a5;
    do
    {
      int v26 = v13;
      int v27 = v25;
      if (a2 >= 1)
      {
        do
        {
          float v28 = fmaxf(fminf((float)(*v26 - v18) / v24, 1.0), 0.0);
          *(v27 - 1) = sub_262F4E764(v14, 0, v28, a10, a11, a12);
          *int v27 = sub_262F4E764(v14, 1, v28, v29, v30, v31);
          uint64_t result = sub_262F4E764(v14, 2, v28, v32, v33, v34);
          v27[1] = result;
          v27[2] = -1;
          v27 += a13;
          int v26 = (float *)((char *)v26 + v16);
          --v20;
        }
        while (v20);
      }
      ++v23;
      uint64_t v20 = a2;
      v25 += v35;
      int v13 = (float *)((char *)v13 + v37);
    }
    while (v23 != v36);
  }
  return result;
}

uint64_t sub_262F4EE3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = a1;
  float v9 = objc_msgSend_numberWithUnsignedInt_(v5, v8, a3);
  float v10 = sub_262F4F45C(v7, v6, v9);

  uint64_t v13 = objc_msgSend_longLongValue(v10, v11, v12);
  return v13;
}

float sub_262F4EECC(void *a1, void *a2, float a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = a1;
  *(float *)&double v8 = a3;
  float v11 = objc_msgSend_numberWithFloat_(v5, v9, v10, v8);
  uint64_t v12 = sub_262F4F45C(v7, v6, v11);

  objc_msgSend_floatValue(v12, v13, v14);
  float v16 = v15;

  return v16;
}

id sub_262F4F45C(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v18 + 1) + 8 * i), v11, (uint64_t)v6, (void)v18);
        if (v15)
        {
          id v16 = (id)v15;

          goto LABEL_11;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v22, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_11:

  return v16;
}

void sub_262F4F5AC()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void sub_262F4F5D8()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void sub_262F4F604()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void sub_262F4F630()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void sub_262F4F65C()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void sub_262F4F688()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void sub_262F4F6B4()
{
}

void sub_262F4F6E0()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void sub_262F4F70C()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return MEMORY[0x270EE8240]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x270EE82F8]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

void MPSSetHeapCacheDuration(id cmdBuf, double seconds)
{
}

void NSLog(NSString *format, ...)
{
}

uint64_t WritePixelBufferToFile()
{
  return MEMORY[0x270F12E00]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x270EE84D8]();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}