FILE *sub_3930(const char *a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  FILE *v8;
  id v10;

  v2 = +[NSString stringWithFormat:@"%s", a1];
  v3 = [v2 stringByDeletingLastPathComponent];
  v4 = +[NSFileManager defaultManager];
  v10 = 0;
  v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = fopen(a1, "wb");
  }
  else
  {
    NSLog(@"Failed to create directory \"%@\". Error: %@", v3, v6);
    v8 = 0;
  }

  return v8;
}

FILE *sub_3EBC(unsigned int a1, int a2, unsigned int a3, unsigned char *a4, const char *a5)
{
  result = sub_3930(a5);
  if (result)
  {
    v10 = result;
    v11 = malloc_type_malloc(3 * a1, 0x208AAB68uLL);
    if (v11)
    {
      v12 = v11;
      fprintf(v10, "P6 %u %u 255\n", a1, a2);
      if (a2)
      {
        int v13 = 0;
        do
        {
          unsigned int v14 = a1;
          v15 = v12;
          for (i = a4; v14; --v14)
          {
            unsigned char *v15 = *i;
            v15[1] = i[1];
            v15[2] = i[2];
            i += 4;
            v15 += 3;
          }
          fwrite(v12, 3uLL, a1, v10);
          a4 += a3;
          ++v13;
        }
        while (v13 != a2);
      }
      free(v12);
    }
    return (FILE *)fclose(v10);
  }
  return result;
}

float *sub_ADA8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9)
{
  v17 = (float *)malloc_type_malloc(0x18uLL, 0x10200405AF6BDC9uLL);
  if (a2 < 0) {
    sub_10A74();
  }
  if (a3 < 0) {
    sub_10AA0();
  }
  if (a4 < 0) {
    sub_10ACC();
  }
  if (a5 < 0) {
    sub_10AF8();
  }
  if (a6 < 0) {
    sub_10B24();
  }
  if (a7 < 0) {
    sub_10B50();
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
    sub_10B7C();
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
        sub_10BA8();
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
        sub_10BA8();
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
        sub_10BA8();
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
        sub_10BA8();
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
        sub_10BA8();
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
        sub_10BA8();
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

void sub_B3D8(void ***a1)
{
  if (a1)
  {
    free(**a1);
    free(*a1);
    *a1 = 0;
  }
}

uint64_t sub_B418(uint64_t a1, int a2, float a3, double a4, double a5, float a6)
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_10BD4();
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

uint64_t sub_B500(uint64_t result, int a2, int a3, float *a4, int a5, int a6, uint64_t a7, int a8, double a9, double a10, double a11, float a12, int a13)
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
          *(v27 - 1) = sub_B418(v14, 0, v28, a10, a11, a12);
          *int v27 = sub_B418(v14, 1, v28, v29, v30, v31);
          result = sub_B418(v14, 2, v28, v32, v33, v34);
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

CFTypeRef sub_E918(int a1, int a2, OSType a3)
{
  CFTypeRef cf = 0;
  CFStringRef v12 = kCVPixelBufferIOSurfacePropertiesKey;
  int v13 = &__NSDictionary0__struct;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CVReturn v7 = CVPixelBufferCreate(0, a1, a2, a3, v6, (CVPixelBufferRef *)&cf);
  CFTypeRef v8 = cf;
  if (v7) {
    BOOL v9 = cf == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    CFRelease(cf);
    CFTypeRef v8 = 0;
    CFTypeRef cf = 0;
  }

  return v8;
}

void sub_10A74()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void sub_10AA0()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void sub_10ACC()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void sub_10AF8()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void sub_10B24()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void sub_10B50()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void sub_10B7C()
{
}

void sub_10BA8()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void sub_10BD4()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

void sub_10C00()
{
  __assert_rtn("nutilCopyTextureWithSampler", "LKTFlowGPU.m", 125, "f != nil");
}

void sub_10C2C()
{
  __assert_rtn("nutilCopyTextureWithSampler", "LKTFlowGPU.m", 127, "_copyTexture != nil");
}

void sub_10C58()
{
  __assert_rtn("nutilCopyTextureWithSampler", "LKTFlowGPU.m", 123, "error == nil");
}

void sub_10C84()
{
  __assert_rtn("+[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:]", "LKTFlowGPU.m", 1362, "(dst_tex.width == src_tex.width) && (dst_tex.height == src_tex.height)");
}

void CFRelease(CFTypeRef cf)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigGetCFPreferenceDoubleWithDefault()
{
  return _FigGetCFPreferenceDoubleWithDefault();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

void NSLog(NSString *format, ...)
{
}

uint64_t WritePixelBufferToFile()
{
  return _WritePixelBufferToFile();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_exception_throw(id exception)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__compileShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileShaders];
}

id objc_msgSend__computeOpticalFlow(void *a1, const char *a2, ...)
{
  return [a1 _computeOpticalFlow];
}

id objc_msgSend__computeOpticalFlowBidirectional(void *a1, const char *a2, ...)
{
  return [a1 _computeOpticalFlowBidirectional];
}

id objc_msgSend__setDefaultParameters(void *a1, const char *a2, ...)
{
  return [a1 _setDefaultParameters];
}

id objc_msgSend__setupBuffer(void *a1, const char *a2, ...)
{
  return [a1 _setupBuffer];
}

id objc_msgSend__setupPipelines(void *a1, const char *a2, ...)
{
  return [a1 _setupPipelines];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufferBytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bufferBytesPerRow];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_displacementFWD(void *a1, const char *a2, ...)
{
  return [a1 displacementFWD];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_isBidirectional(void *a1, const char *a2, ...)
{
  return [a1 isBidirectional];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_nextFrame(void *a1, const char *a2, ...)
{
  return [a1 nextFrame];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_textureType(void *a1, const char *a2, ...)
{
  return [a1 textureType];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_warpedKeyFrameToCurrentFrameMask(void *a1, const char *a2, ...)
{
  return [a1 warpedKeyFrameToCurrentFrameMask];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}