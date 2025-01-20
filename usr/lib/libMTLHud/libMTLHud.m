BOOL IsDrawableDetached(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t DetachModeCode;
  int v5;
  BOOL v6;
  void v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = [v1 texture];
  v3 = [v2 iosurface];

  v12 = v3;
  if (v10[3])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___Z18IsDrawableDetachedPU26objcproto15CAMetalDrawable11objc_object_block_invoke;
    v8[3] = &unk_264C04090;
    v8[4] = &v9;
    [v1 addPresentScheduledHandler:v8];
    DetachModeCode = IOSurfaceGetDetachModeCode();
    v5 = WORD2(DetachModeCode);
    if (WORD2(DetachModeCode) == 0xFFFF) {
      v5 = (unsigned __int16)word_2687E7F54;
    }
    IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sPrevDetachCode = DetachModeCode;
    v6 = (IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonCA | IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonServer | v5) == 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_234BD5E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

uint64_t ___Z18IsDrawableDetachedPU26objcproto15CAMetalDrawable11objc_object_block_invoke()
{
  uint64_t result = IOSurfaceGetDetachModeCode();
  IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonCA = (unsigned __int16)result;
  IsDrawableDetached(objc_object  {objcproto15CAMetalDrawable}*)::sDetachReasonServer = WORD1(result);
  return result;
}

CTFontRef esfm_FindCTFont(const char *cStr, unsigned int a2)
{
  CFStringRef v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  double v4 = (double)a2;
  v5 = CTFontDescriptorCreateWithNameAndSize(v3, (double)a2);
  CFRelease(v3);
  MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v5, 0);
  if (!MatchingFontDescriptor)
  {
    CTFontRef v8 = CTFontCreateWithFontDescriptor(v5, v4, 0);
    if (!v5) {
      return v8;
    }
    goto LABEL_3;
  }
  v7 = MatchingFontDescriptor;
  CTFontRef v8 = CTFontCreateWithFontDescriptor(MatchingFontDescriptor, v4, 0);
  CFRelease(v7);
  if (v5) {
LABEL_3:
  }
    CFRelease(v5);
  return v8;
}

CGContext *esfm_PrepareCGContext(uint64_t a1, BOOL a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 16) != 1) {
    esfm_PrepareCGContext();
  }
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v5 = CGBitmapContextCreate(*(void **)a1, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12), 8uLL, *(unsigned __int8 *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 8), DeviceGray, *(unsigned __int8 *)(a1 + 16) != 1);
  CGContextSetRenderingIntent(v5, kCGRenderingIntentPerceptual);
  CGContextSetAllowsAntialiasing(v5, a2);
  CGContextSetShouldAntialias(v5, a2);
  CGContextSetInterpolationQuality(v5, kCGInterpolationHigh);
  CGContextSetAllowsFontSmoothing(v5, 1);
  CGContextSetShouldSmoothFonts(v5, 1);
  CGContextSetAllowsFontSubpixelPositioning(v5, 1);
  CGContextSetShouldSubpixelPositionFonts(v5, 1);
  CGContextSetAllowsFontSubpixelQuantization(v5, 1);
  CGContextSetShouldSubpixelQuantizeFonts(v5, 1);
  LODWORD(v6) = *(_DWORD *)(a1 + 8);
  LODWORD(v7) = *(_DWORD *)(a1 + 12);
  v12.size.width = (double)v6;
  v12.size.height = (double)v7;
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextClearRect(v5, v12);
  v10[0] = xmmword_234BDFE20;
  v10[1] = unk_234BDFE30;
  CTFontRef v8 = CGColorCreate(DeviceGray, (const CGFloat *)v10);
  CGContextSetFillColorWithColor(v5, v8);
  CFRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v5;
}

float esfm_DistanceFromPixel_simd(uint64_t a1, int a2, int a3, int a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, int8x16_t a13)
{
  int v13 = a3 - a4;
  unsigned int v14 = a4 - 1 + a2;
  if (a3 < a4) {
    int v13 = -1;
  }
  if (a2 - a4 < 0) {
    int v15 = -1;
  }
  else {
    int v15 = a2 - a4;
  }
  int v16 = *(_DWORD *)(a1 + 8);
  int v17 = *(_DWORD *)(a1 + 12) - 1;
  if (a4 - 1 + a3 < v17) {
    int v17 = a4 - 1 + a3;
  }
  if (v14 >= v16 - 1) {
    unsigned int v14 = v16 - 1;
  }
  signed int v18 = a4 * a4;
  if (v13 < v17)
  {
    int32x4_t v19 = vdupq_n_s32(a5 << 31 >> 31);
    int v20 = v14 - 4;
    int v21 = 1 - a2;
    int v22 = v16 + v16 * v13;
    int v23 = -a2;
    do
    {
      ++v13;
      signed int v24 = (v13 - a3) * (v13 - a3);
      if (v24 >= v18) {
        break;
      }
      int v25 = *(unsigned __int8 *)(a1 + 16);
      int32x4_t v26 = vdupq_n_s32(v18);
      if (v15 >= v20)
      {
        int v36 = v15 + 1;
      }
      else
      {
        int32x4_t v27 = vdupq_n_s32(v24);
        int v28 = v22 * v25;
        int v29 = v15;
        do
        {
          int32x4_t v30 = vaddq_s32(vdupq_n_s32(v21 + v29), (int32x4_t)xmmword_234BDFDE0);
          int32x4_t v31 = vmlaq_s32(v27, v30, v30);
          int8x16_t v32 = (int8x16_t)vcgtq_s32(v26, v31);
          a13.i32[0] = vmaxvq_u32((uint32x4_t)v32);
          if (a13.i32[0] < 0)
          {
            a13.i8[0] = *(unsigned char *)(*(void *)a1 + (v28 + v29 + 3));
            a13.i8[4] = *(unsigned char *)(*(void *)a1 + (v28 + v29 + 4));
            v33.i32[0] = *(unsigned __int8 *)(*(void *)a1 + (v28 + v29 + 1));
            v33.i32[1] = *(unsigned __int8 *)(*(void *)a1 + (v28 + v29 + 2));
            v33.u64[1] = (unint64_t)vand_s8(*(int8x8_t *)a13.i8, (int8x8_t)0xFF000000FFLL);
            a13 = (int8x16_t)vceqq_s32(v19, vtstq_s32(v33, v33));
            int32x4_t v26 = (int32x4_t)vbslq_s8(vbicq_s8(v32, a13), (int8x16_t)v31, (int8x16_t)v26);
          }
          int v34 = v29 + 4;
          int v35 = v29 + 5;
          v29 += 4;
        }
        while (v35 <= v20);
        int v36 = v34 + 1;
      }
      int v37 = vminvq_s32(v26);
      if (v37 < v18) {
        signed int v18 = v37;
      }
      if (v36 <= (int)v14)
      {
        unsigned int v38 = v14 + 1 - v36;
        unsigned int v39 = v36 + v22 * v25;
        int v40 = v23 + v36;
        do
        {
          if (v24 + v40 * v40 < v18 && (*(unsigned char *)(*(void *)a1 + v39) == 0) == a5) {
            signed int v18 = v24 + v40 * v40;
          }
          ++v39;
          ++v40;
          --v38;
        }
        while (v38);
      }
      v22 += v16;
    }
    while (v13 != v17);
  }
  return sqrtf((float)v18) / (float)a4;
}

uint64_t esfm_BakeFontIntoBitmapGrayscale(const char *a1, unsigned int a2, __int16 a3, unsigned int a4, void *a5, unsigned int a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  HIDWORD(v57.origin.y) = a7;
  bzero(a5, a7 * a6);
  CTFont = esfm_FindCTFont(a1, a2);
  if (!CTFont) {
    return 0xFFFFFFFFLL;
  }
  __int16 v16 = a3;
  unsigned int v58 = a6;
  *(void *)&v57.size.CGFloat width = a5;
  *(void *)&v57.size.CGFloat height = a9;
  uint64_t v17 = a4;
  MEMORY[0x270FA5388]();
  signed int v18 = &v57.origin.x - 2 * a4;
  bzero(v18, v19);
  MEMORY[0x270FA5388]();
  int v20 = (char *)&v57 - ((2 * a4 + 15) & 0x3FFFFFFF0);
  bzero(v20, 2 * a4);
  MEMORY[0x270FA5388]();
  bzero(&v57 - a4, v21);
  MEMORY[0x270FA5388]();
  bzero(v20, 2 * a4);
  *(void *)&v57.origin.x = a8;
  if (a4)
  {
    uint64_t v22 = 0;
    do
    {
      *(_WORD *)&v20[2 * v22] = v16 + v22;
      ++v22;
    }
    while (a4 != v22);
    int v23 = CTFont;
    CTFontGetGlyphsForCharacters(CTFont, (const UniChar *)v20, (CGGlyph *)v20, a4);
    CTFontGetAdvancesForGlyphs(v23, kCTFontOrientationDefault, (const CGGlyph *)v20, (CGSize *)&v57 - a4, a4);
    signed int v24 = &v57 - a4;
    CTFontGetBoundingRectsForGlyphs(v23, kCTFontOrientationDefault, (const CGGlyph *)v20, v24, a4);
    CGFloat height = v57.size.height;
    p_size = &v24->size;
    uint64_t v27 = a4;
    do
    {
      *(CGRect *)&p_size[-1].CGFloat width = CGRectIntegral(*(CGRect *)&p_size[-1].width);
      p_size += 2;
      --v27;
    }
    while (v27);
  }
  else
  {
    int v29 = CTFont;
    CTFontGetGlyphsForCharacters(CTFont, (const UniChar *)v20, (CGGlyph *)v20, 0);
    CTFontGetAdvancesForGlyphs(v29, kCTFontOrientationDefault, (const CGGlyph *)v20, (CGSize *)&v57, 0);
    CTFontGetBoundingRectsForGlyphs(v29, kCTFontOrientationDefault, (const CGGlyph *)v20, &v57, 0);
    CGFloat height = v57.size.height;
    signed int v24 = &v57;
  }
  int32x4_t v30 = CTFont;
  double Ascent = CTFontGetAscent(CTFont);
  double Descent = CTFontGetDescent(v30);
  double Leading = CTFontGetLeading(v30);
  unsigned int v34 = v58;
  if (height == 0.0) {
    esfm_BakeFontIntoBitmapGrayscale_cold_1();
  }
  float v35 = Ascent;
  float v36 = Descent;
  float v37 = Leading;
  float v38 = (float)(v35 + v36) + v37;
  **(float **)&CGFloat height = v38;
  uint64_t v64 = 1;
  CGFloat width = v57.size.width;
  unsigned int y_high = HIDWORD(v57.origin.y);
  unsigned int v62 = v34;
  int v63 = HIDWORD(v57.origin.y);
  *(void *)&v57.size.CGFloat height = esfm_PrepareCGContext((uint64_t)&width, 1);
  if (a4)
  {
    int v40 = v24;
    unsigned int v41 = vcvtps_u32_f32(v38);
    LODWORD(v57.size.width) = v41 + 4;
    uint64_t v42 = *(void *)&v57.origin.x + 12;
    p_CGFloat width = &v40->size.width;
    int v44 = 4;
    int v45 = 4;
    do
    {
      double v46 = *p_width;
      int v47 = (int)(*p_width + 4.0);
      int width_low = LODWORD(v57.size.width);
      if (v45 + v47 < v34) {
        int width_low = 0;
      }
      v44 += width_low;
      if (v44 + v41 >= y_high) {
        esfm_BakeFontIntoBitmapGrayscale_cold_2();
      }
      if (v45 + v47 >= v34) {
        int v49 = 0;
      }
      else {
        int v49 = v45;
      }
      double v50 = p_width[1];
      double v52 = *(p_width - 2);
      double v51 = *(p_width - 1);
      positions.x = (double)(v49 + 4) - v52;
      positions.y = (double)(int)(y_high - v44) - v51 - v50;
      CTFontDrawGlyphs(CTFont, (const CGGlyph *)v20, &positions, 1uLL, *(CGContextRef *)&v57.size.height);
      *(_DWORD *)(v42 - 12) = v49 + 3;
      *(_DWORD *)(v42 - 8) = v44 - 1;
      *(_DWORD *)(v42 - 4) = (v46 + 1.0);
      *(_DWORD *)uint64_t v42 = (v50 + 1.0);
      double v53 = *v18;
      v18 += 2;
      float v54 = v53;
      float v55 = v52;
      *(float *)(v42 + 4) = v54;
      *(float *)(v42 + 8) = v55;
      int v45 = v49 + v47;
      unsigned int v34 = v58;
      float v56 = v50 + v51;
      *(float *)(v42 + 12) = v56;
      v42 += 28;
      p_width += 4;
      v20 += 2;
      --v17;
    }
    while (v17);
  }
  CFRelease(CTFont);
  return 0;
}

uint64_t esfm_BakeFontIntoBitmapGrayscaleSDF(const char *a1, int a2, int a3, unsigned int a4, unsigned char *a5, unsigned int a6, unsigned int a7, uint64_t a8, float *a9)
{
  uint64_t v88 = a8;
  uint64_t v108 = *MEMORY[0x263EF8340];
  unsigned int v89 = a7;
  unsigned int v97 = a6;
  v101 = a5;
  bzero(a5, a7 * a6);
  CTFontRef CTFont = esfm_FindCTFont(a1, 16 * a2);
  if (!CTFont) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v14 = CTFont;
  uint64_t v15 = a4;
  MEMORY[0x270FA5388]();
  __int16 v16 = &v75 - 2 * a4;
  bzero(v16, v17);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (2 * a4 + 15) & 0x3FFFFFFF0;
  size_t v19 = (char *)&v75 - v18;
  bzero((char *)&v75 - v18, 2 * a4);
  MEMORY[0x270FA5388]();
  v91 = (CGRect *)(&v75 - 4 * a4);
  bzero(v91, v20);
  MEMORY[0x270FA5388]();
  bzero((char *)&v75 - v18, 2 * a4);
  if (a4)
  {
    uint64_t v21 = a4;
    uint64_t v22 = (_WORD *)((char *)&v75 - v18);
    do
    {
      *v22++ = a3++;
      --v21;
    }
    while (v21);
  }
  CTFontGetGlyphsForCharacters(v14, (const UniChar *)((char *)&v75 - v18), (CGGlyph *)((char *)&v75 - v18), a4);
  CTFontGetAdvancesForGlyphs(v14, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v75 - v18), (CGSize *)&v75 - a4, a4);
  CTFontGetBoundingRectsForGlyphs(v14, kCTFontOrientationDefault, (const CGGlyph *)((char *)&v75 - v18), v91, a4);
  double Ascent = CTFontGetAscent(v14);
  double Descent = CTFontGetDescent(v14);
  double Leading = CTFontGetLeading(v14);
  if (!a9) {
    esfm_BakeFontIntoBitmapGrayscaleSDF_cold_1();
  }
  float v26 = Ascent;
  float v27 = Descent;
  float v28 = Leading;
  float v29 = (float)(v26 + v27) + v28;
  unsigned int v30 = vcvtps_u32_f32(v29);
  *a9 = v29 * 0.0625;
  if ((int)a4 < 1)
  {
    unsigned int v35 = -9857;
  }
  else
  {
    p_CGFloat width = &v91->size.width;
    double v32 = -10000.0;
    uint64_t v33 = a4;
    do
    {
      double v34 = *p_width;
      p_width += 4;
      double v32 = fmax(v32, v34);
      --v33;
    }
    while (v33);
    unsigned int v35 = (int)v32 + 143;
  }
  uint64_t v107 = 0;
  unint64_t v37 = v35 & 0xFFFFFFF0;
  unsigned int v38 = (v30 + 143) & 0xFFFFFFF0;
  size_t v86 = v37 * v38;
  v102 = malloc_type_malloc(v86, 0x9A9D91CAuLL);
  v104 = v102;
  unsigned int v105 = v35 & 0xFFFFFFF0;
  unsigned int v106 = v38;
  LOBYTE(v107) = 1;
  CGContextRef v87 = esfm_PrepareCGContext((uint64_t)&v104, 0);
  if (a4)
  {
    int v39 = 0;
    int v93 = 0;
    unsigned int v84 = (v30 + 143) >> 4;
    int v83 = (v30 >> 4) + 4;
    int v82 = (v30 >> 4) + 8;
    uint64_t v76 = v35 >> 4 << 7;
    uint64_t v94 = v35 >> 4 << 8;
    unsigned int v85 = v35 >> 4;
    uint64_t v40 = 0;
    uint64_t v75 = 144 * (v35 >> 4);
    __asm { FMOV            V0.2D, #-0.25 }
    float64x2_t v81 = _Q0;
    v80 = v14;
    uint64_t v79 = v15;
    v78 = v16;
    v77 = v19;
    while (1)
    {
      bzero(v102, v86);
      p_x = &v91[v40].origin.x;
      double v46 = *p_x;
      double v47 = p_x[1];
      double v48 = p_x[2];
      double v49 = p_x[3];
      positions.x = 64.0 - *p_x;
      positions.y = (double)(int)(v38 - 64) - v47 - v49;
      CTFontDrawGlyphs(v14, (const CGGlyph *)&v19[2 * v40], &positions, 1uLL, v87);
      unsigned int v53 = ((v48 + 128.0) * 0.0625);
      unsigned int v96 = ((v49 + 128.0) * 0.0625);
      if (v85 < v53 || v84 < ((v49 + 128.0) * 0.0625)) {
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_5();
      }
      int v55 = v83;
      if (v39 + v53 < v97) {
        int v55 = 0;
      }
      int v56 = v55 + v93;
      if (v39 + v53 >= v97) {
        int v57 = 0;
      }
      else {
        int v57 = v39;
      }
      if (v82 + v56 >= v89) {
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_4();
      }
      v63.f64[0] = v46 * 0.0625;
      double v58 = v47 * 0.0625;
      double v59 = v49 * 0.0625;
      uint64_t v60 = v88 + 28 * v40;
      int v92 = v57;
      int v93 = v56;
      *(_DWORD *)uint64_t v60 = v57 + 3;
      *(_DWORD *)(v60 + 4) = v56 + 3;
      *(_DWORD *)(v60 + 8) = (v48 * 0.0625 + 2.0);
      *(_DWORD *)(v60 + 12) = (v49 * 0.0625 + 2.0);
      uint64_t v90 = v40;
      double v61 = *(double *)&v16[2 * v40];
      float v62 = v61 * 0.0625;
      *(float *)(v60 + 16) = v62;
      v63.f64[1] = v47 * 0.0625 + v49 * 0.0625;
      double v64 = COERCE_DOUBLE(vcvt_f32_f64(vaddq_f64(v63, v81)));
      *(double *)(v60 + 20) = v64;
      if (v96) {
        break;
      }
LABEL_48:
      int v39 = v92 + v53;
      uint64_t v40 = v90 + 1;
      unsigned int v14 = v80;
      __int16 v16 = v78;
      size_t v19 = v77;
      if (v90 + 1 == v79) {
        goto LABEL_49;
      }
    }
    int v98 = v92 + v97 * v93;
    int v99 = 0;
    uint64_t v100 = 16 * ((v48 + 128.0) * 0.0625);
    int v65 = v75;
    int v66 = v76;
    uint64_t v95 = ((v48 + 128.0) * 0.0625);
    while (!v53)
    {
LABEL_47:
      unsigned int v53 = v95;
      v66 += v94;
      v65 += v94;
      v98 += v97;
      if (++v99 == v96) {
        goto LABEL_48;
      }
    }
    uint64_t v67 = 0;
    int v68 = v98;
    unsigned int v69 = (16 * v99) | 8;
    unsigned int v70 = (16 * v99) | 9;
    while (1)
    {
      if (v37 == v67) {
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_2();
      }
      if (v69 >= v38) {
        esfm_BakeFontIntoBitmapGrayscaleSDF_cold_3();
      }
      if (v67 + 9 >= v37)
      {
        BOOL v72 = 0;
        v71 = v102;
      }
      else
      {
        v71 = v102;
        BOOL v72 = *((unsigned char *)v102 + (v66 + v67 + 9)) != 0;
      }
      if (v38 <= v70) {
        break;
      }
      if (!v71[(v66 + v67 + 8)]) {
        BOOL v72 = 0;
      }
      if (v71[(v65 + v67 + 8)]) {
        BOOL v73 = v72;
      }
      else {
        BOOL v73 = 0;
      }
      if (v67 + 9 >= v37) {
        goto LABEL_43;
      }
      BOOL v74 = v71[(v65 + v67 + 9)] != 0;
LABEL_44:
      *(float *)&double v64 = esfm_DistanceFromPixel_simd((uint64_t)&v104, v67 + 8, v69, 64, v73 && v74, v64, v63.f64[0], v58, v61, v59, v50, v51, v52);
      if (!v73 || !v74) {
        *(float *)&double v64 = -*(float *)&v64;
      }
      LODWORD(v63.f64[0]) = 1123942400;
      *(float *)&double v64 = (float)(*(float *)&v64 * 127.0) + 127.0;
      v101[v68] = (int)*(float *)&v64;
      v67 += 16;
      ++v68;
      if (v100 == v67) {
        goto LABEL_47;
      }
    }
    BOOL v73 = 0;
LABEL_43:
    BOOL v74 = 0;
    goto LABEL_44;
  }
LABEL_49:
  CGContextRelease(v87);
  free(v102);
  CFRelease(v14);
  return 1;
}

id esfm_BakeFontIntoTextureR8Unorm(void *a1, const char *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, int a7, int a8, uint64_t a9, float *a10, float32x2_t *a11)
{
  id v18 = a1;
  context = (void *)MEMORY[0x237DCE950]();
  unsigned int v38 = v18;
  [v18 device];
  int v39 = a7;
  v37 = uint64_t v19 = a7 * a6;
  id v36 = (id) [v37 newBufferWithLength:v19 options:0];
  size_t v20 = (unsigned char *)[v36 contents];
  if (a8)
  {
    int v21 = esfm_BakeFontIntoBitmapGrayscaleSDF(a2, a3, a4, a5, v20, a6, v39, a9, a10);
    int v23 = v36;
    uint64_t v22 = v37;
    unsigned int v24 = v39;
    if (v21 == -1)
    {
      int v25 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (esfm_BakeFontIntoBitmapGrayscale(a2, a3, a4, a5, v20, a6, v39, a9, (uint64_t)a10))
    {
      int v25 = 0;
      int v23 = v36;
      uint64_t v22 = v37;
      goto LABEL_15;
    }
    float32x2_t v26 = (float32x2_t)0xBF000000BF000000;
    if (v19)
    {
      uint64_t v27 = 0;
      float v28 = a11;
      while (v20[v27] != 255)
      {
        if (v19 == ++v27) {
          goto LABEL_13;
        }
      }
      float32x2_t v26 = vadd_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v27 / a6, v27 % a6)), (float32x2_t)0x3F0000003F000000);
    }
    else
    {
      float v28 = a11;
    }
LABEL_13:
    unsigned int v24 = v39;
    *float v28 = vdiv_f32(v26, vcvt_f32_u32((uint32x2_t)__PAIR64__(v39, a6)));
    int v23 = v36;
    uint64_t v22 = v37;
  }
  float v29 = [v38 commandBuffer];
  uint64_t v30 = a6;
  uint64_t v31 = v24;
  double v32 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:a6 height:v24 mipmapped:0];
  [v32 setStorageMode:2];
  int v25 = (void *)[v22 newTextureWithDescriptor:v32];
  uint64_t v33 = [v29 blitCommandEncoder];
  v41[0] = v30;
  v41[1] = v31;
  v41[2] = 1;
  memset(v40, 0, sizeof(v40));
  [v33 copyFromBuffer:v23 sourceOffset:0 sourceBytesPerRow:v30 sourceBytesPerImage:0 sourceSize:v41 toTexture:v25 destinationSlice:0 destinationLevel:0 destinationOrigin:v40 options:0];
  [v33 endEncoding];
  [v29 commit];
  [v29 waitUntilCompleted];

LABEL_15:

  return v25;
}

void sub_234BD7048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

uint64_t esfm_CreateFont(void *a1, const char *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8)
{
  id v15 = a1;
  if (a8)
  {
    __int16 v16 = malloc_type_malloc(28 * a5, 0x100004027586B93uLL);
    *(void *)(a8 + 8) = v16;
    bzero(v16, 28 * a5);
    uint64_t v17 = esfm_BakeFontIntoTextureR8Unorm(v15, a2, a3, a4, a5, a6, a7, 0, *(void *)(a8 + 8), (float *)(a8 + 24), (float32x2_t *)(a8 + 32));
    id v18 = *(void **)a8;
    *(void *)a8 = v17;

    *(_DWORD *)(a8 + 16) = a4;
    *(_DWORD *)(a8 + 20) = a3;
    if (*(void *)a8) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v19 = 0xFFFFFFFFLL;
  }

  return v19;
}

void sub_234BD71BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id esfm_vertex_CreateMTLVertexDescriptor()
{
  v0 = [MEMORY[0x263F12A80] vertexDescriptor];
  v1 = [v0 attributes];
  v2 = [v1 objectAtIndexedSubscript:0];
  [v2 setOffset:0];

  CFStringRef v3 = [v0 attributes];
  double v4 = [v3 objectAtIndexedSubscript:0];
  [v4 setFormat:29];

  v5 = [v0 attributes];
  unint64_t v6 = [v5 objectAtIndexedSubscript:0];
  [v6 setBufferIndex:0];

  unint64_t v7 = [v0 attributes];
  CTFontRef v8 = [v7 objectAtIndexedSubscript:1];
  [v8 setOffset:8];

  v9 = [v0 attributes];
  v10 = [v9 objectAtIndexedSubscript:1];
  [v10 setFormat:29];

  uint64_t v11 = [v0 attributes];
  CGRect v12 = [v11 objectAtIndexedSubscript:1];
  [v12 setBufferIndex:0];

  int v13 = [v0 attributes];
  unsigned int v14 = [v13 objectAtIndexedSubscript:2];
  [v14 setOffset:16];

  id v15 = [v0 attributes];
  __int16 v16 = [v15 objectAtIndexedSubscript:2];
  [v16 setFormat:36];

  uint64_t v17 = [v0 attributes];
  id v18 = [v17 objectAtIndexedSubscript:2];
  [v18 setBufferIndex:0];

  uint64_t v19 = [v0 layouts];
  size_t v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setStepRate:1];

  int v21 = [v0 layouts];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setStepFunction:1];

  int v23 = [v0 layouts];
  unsigned int v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setStride:20];

  return v0;
}

void sub_234BD7454(_Unwind_Exception *a1)
{
  double v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t esfm_GenerateTriangesForString(uint64_t a1, float *a2, float *a3, int a4, void *a5, uint64_t a6, int a7, uint64_t a8, float a9, _WORD *a10, unsigned __int16 a11)
{
  id v19 = a5;
  unint64_t v20 = [v19 width];
  unint64_t v21 = [v19 height];
  float v23 = 1.0 / (float)v20;
  float v24 = *a2;
  float v25 = *a3;
  float v26 = 1.0 / (float)v21;
  uint64_t v27 = a8;
LABEL_2:
  float v28 = floorf(v25 + 0.5);
  float v29 = v24;
  while (1)
  {
    ++a1;
    while (1)
    {
      int v30 = *(unsigned __int8 *)(a1 - 1);
      if (v30 != 32) {
        break;
      }
      ++a1;
      float v29 = v29 + *(float *)(a6 + 28 * (32 - a7) + 16);
    }
    if (!*(unsigned char *)(a1 - 1)) {
      break;
    }
    if (v30 == 10)
    {
      float v25 = v25 + a9;
      goto LABEL_2;
    }
    uint64_t v31 = a6 + 28 * ((char)v30 - a7);
    float v32 = *(float *)(v31 + 16);
    int v33 = (int)(float)(floorf(v29 + 0.5) + *(float *)(v31 + 20));
    float v34 = (float)v33;
    int v35 = (int)(float)(v28 - *(float *)(v31 + 24));
    int v37 = *(_DWORD *)(v31 + 8);
    int v36 = *(_DWORD *)(v31 + 12);
    float v38 = (float)(v37 + v33);
    float v39 = (float)(v36 + v35);
    unsigned int v40 = *(_DWORD *)v31;
    LODWORD(v31) = *(_DWORD *)(v31 + 4);
    float v41 = (float)v35;
    float v42 = v23 * (float)v40;
    float v43 = v26 * (float)v31;
    float v44 = v23 * (float)(v40 + v37);
    float v45 = v26 * (float)(v31 + v36);
    float v29 = v29 + v32;
    LODWORD(v31) = a11 - 13107 * ((v27 - a8) >> 2);
    *(float *)uint64_t v27 = v34;
    *(float *)(v27 + 4) = v41;
    *(float *)(v27 + 8) = v42;
    *(float *)(v27 + 12) = v43;
    *(_DWORD *)(v27 + 16) = a4;
    *(float *)(v27 + 20) = v38;
    *(float *)(v27 + 24) = v41;
    *(float *)(v27 + 28) = v44;
    *(float *)(v27 + 32) = v43;
    *(_DWORD *)(v27 + 36) = a4;
    *(float *)(v27 + 40) = v34;
    *(float *)(v27 + 44) = v39;
    *(float *)(v27 + 48) = v42;
    *(float *)(v27 + 52) = v45;
    *(_DWORD *)(v27 + 56) = a4;
    *(float *)(v27 + 60) = v38;
    *(float *)(v27 + 64) = v39;
    *(float *)(v27 + 68) = v44;
    *(float *)(v27 + 72) = v45;
    *(_DWORD *)(v27 + 76) = a4;
    v27 += 80;
    *a10 = v31;
    a10[1] = v31 + 1;
    a10[2] = v31 + 2;
    a10[3] = v31 + 1;
    a10[4] = v31 + 3;
    a10[5] = v31 + 2;
    a10 += 6;
  }
  *a2 = v29;
  *a3 = v25;
  uint64_t v46 = ((int)(-858993459 * ((unint64_t)(v27 - a8) >> 2)) / 4);

  return v46;
}

void sub_234BD76F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Renderer::Init(Renderer *this, CAMetalLayer *a2)
{
  CFStringRef v3 = a2;
  double v4 = [(CAMetalLayer *)v3 device];
  v5 = MTLHud_objc_unwrap(v4);

  unint64_t v6 = (void *)[v5 newCommandQueue];
  objc_storeStrong((id *)this, v6);
  [(CAMetalLayer *)v3 contentsScale];
  *(float *)&double v7 = v7;
  *((_DWORD *)this + 56) = LODWORD(v7);
  if (esfm_CreateFont(v6, "Menlo", 0x1Cu, 32, 0x5Fu, 0x140u, 256, (uint64_t)this + 24)) {
    __assert_rtn("Init", "Renderer.mm", 98, "result == 0");
  }
  id v8 = objc_alloc_init(MEMORY[0x263F128A0]);
  [v8 setDepthCompareFunction:7];
  [v8 setDepthWriteEnabled:0];
  v9 = [*(id *)this device];
  uint64_t v10 = [v9 newDepthStencilStateWithDescriptor:v8];
  uint64_t v11 = (void *)*((void *)this + 8);
  *((void *)this + 8) = v10;

  std::vector<Renderer::SDrawCommand>::reserve((char **)this + 20, 4uLL);
  uint64_t v12 = [v6 device];
  int v13 = (void *)*((void *)this + 23);
  *((void *)this + 23) = v12;

  return 1;
}

void sub_234BD785C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<Renderer::SDrawCommand>::reserve(char **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v19 = result;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>(result, a2);
    v9 = *a1;
    unint64_t v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      int64x2_t v14 = vdupq_n_s64(v8);
      uint64_t v10 = &v6[v5];
    }
    else
    {
      uint64_t v10 = &v6[v5];
      do
      {
        uint64_t v11 = *(void *)(v8 - 24);
        v8 -= 24;
        int v12 = *(_DWORD *)(v8 + 8);
        *((void *)v10 - 3) = v11;
        v10 -= 24;
        *((_DWORD *)v10 + 2) = v12;
        uint64_t v13 = *(void *)(v8 + 16);
        *(void *)(v8 + 16) = 0;
        *((void *)v10 + 2) = v13;
      }
      while ((char *)v8 != v9);
      int64x2_t v14 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5];
    int64x2_t v17 = v14;
    id v15 = a1[2];
    a1[2] = &v6[24 * v7];
    id v18 = v15;
    uint64_t v16 = v14.i64[0];
    return std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v16);
  }
  return result;
}

void Renderer::BeginFrame(uint64_t a1, uint64_t a2)
{
  v6[1] = [*(id *)(a2 + 8) pixelFormat:[*(id *)(a2 + 8) sampleCount]];
  double v4 = [*(id *)a1 device];
  RenderPipelines = Renderer::getOrCreateRenderPipelines(a1, v4, v6);

  if (RenderPipelines)
  {
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 16);
    *(void *)(a1 + 16) = RenderPipelines;
  }
  *(_DWORD *)(a1 + 192) = 0;
}

void sub_234BD7A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *Renderer::getOrCreateRenderPipelines(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a1 + 72;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::find<Renderer::SPiplelinesDescriptor>((void *)(a1 + 72), a3);
  if (v7)
  {
    unint64_t v8 = v7 + 4;
  }
  else
  {
    v9 = esfm_vertex_CreateMTLVertexDescriptor();
    id v10 = objc_alloc_init(MEMORY[0x263F12838]);
    [v10 setFastMathEnabled:1];
    [v10 setLanguageVersion:0x20000];
    uint64_t v11 = [*(id *)a1 device];
    id v43 = 0;
    int v12 = [v11 newLibraryWithSource:@"#include <metal_stdlib>\nusing namespace metal;\ntypedef struct\n{\n    float2 position [[attribute(0)]];\n    float2 texCoord [[attribute(1)]];\n    uint color      [[attribute(2)]];\n} libMTLHud_vertexIn;\ntypedef struct\n{\n    float4 position [[position]];\n    float2 texCoord;\n    float4 vertexColor;\n} libMTLHud_vertexOut;\nvertex libMTLHud_vertexOut libMTLHud_vertexShader(libMTLHud_vertexIn in [[stage_in]],\n                                                 const constant float4x4& projection [[ buffer(1) ]])\n{\n    libMTLHud_vertexOut out;\n    out.position = projection * float4(in.position, 0, 1);\n    out.texCoord = in.texCoord;\n    out.vertexColor = unpack_unorm4x8_to_float(in.color);\n\n    return out;\n}\nfragment float4 libMTLHud_fragmentShader(libMTLHud_vertexOut in [[stage_in]],\n                                         texture2d<float, access::sample> tex [[texture(0)]])\n{\n    constexpr sampler sam(mip_filter::linear, mag_filter::linear, min_filter::linear, address::clamp_to_edge);\n    float sample = tex.sample(sam, in.texCoord).r;\n    float4 res = (float4)sample * in.vertexColor;\n    return res;}\n"];
                    v10,
                    &v43);
    id v13 = v43;

    if (v12)
    {

      id v10 = objc_alloc_init(MEMORY[0x263F129C0]);
      [v10 setLabel:@"libMTLHUD:pipelineState"];
      [v10 setRasterSampleCount:*a3];
      int64x2_t v14 = (void *)[v12 newFunctionWithName:@"libMTLHud_vertexShader"];
      [v10 setVertexFunction:v14];

      id v15 = (void *)[v12 newFunctionWithName:@"libMTLHud_fragmentShader"];
      [v10 setFragmentFunction:v15];

      [v10 setVertexDescriptor:v9];
      uint64_t v16 = a3[1];
      int64x2_t v17 = [v10 colorAttachments];
      id v18 = [v17 objectAtIndexedSubscript:0];
      [v18 setPixelFormat:v16];

      uint64_t v19 = [v10 colorAttachments];
      unint64_t v20 = [v19 objectAtIndexedSubscript:0];
      [v20 setBlendingEnabled:1];

      unint64_t v21 = [v10 colorAttachments];
      uint64_t v22 = [v21 objectAtIndexedSubscript:0];
      [v22 setRgbBlendOperation:0];

      float v23 = [v10 colorAttachments];
      float v24 = [v23 objectAtIndexedSubscript:0];
      [v24 setAlphaBlendOperation:0];

      float v25 = [v10 colorAttachments];
      float v26 = [v25 objectAtIndexedSubscript:0];
      [v26 setSourceRGBBlendFactor:4];

      uint64_t v27 = [v10 colorAttachments];
      float v28 = [v27 objectAtIndexedSubscript:0];
      [v28 setSourceAlphaBlendFactor:1];

      float v29 = [v10 colorAttachments];
      int v30 = [v29 objectAtIndexedSubscript:0];
      [v30 setDestinationRGBBlendFactor:5];

      uint64_t v31 = [v10 colorAttachments];
      float v32 = [v31 objectAtIndexedSubscript:0];
      [v32 setDestinationAlphaBlendFactor:5];

      id v42 = v13;
      int v33 = (void *)[v5 newRenderPipelineStateWithDescriptor:v10 error:&v42];
      id v34 = v42;

      if (v33)
      {
        id v35 = v33;
        long long v40 = *(_OWORD *)a3;
        id v41 = v35;
        int v36 = std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__emplace_unique_key_args<Renderer::SPiplelinesDescriptor,std::pair<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>(v6, &v40, (uint64_t)&v40);
        char v38 = v37;

        if (v38) {
          unint64_t v8 = v36 + 4;
        }
        else {
          unint64_t v8 = 0;
        }
      }
      else
      {
        NSLog(&cfstr_OverlayFailedT_0.isa, v34);
        unint64_t v8 = 0;
      }
    }
    else
    {
      NSLog(&cfstr_OverlayFailedT.isa, v13);
      unint64_t v8 = 0;
      id v34 = v13;
    }
  }
  return v8;
}

void sub_234BD7DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Renderer::EndFrame(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 168) != *(void *)(a1 + 160))
  {
    int v3 = *(_DWORD *)(a1 + 8);
    if ((v3 & 0x80000000) == 0 && v3 == *(_DWORD *)(a2 + 16))
    {
      id v5 = *(id *)a2;
      if (!v5)
      {
        id v5 = [*(id *)a1 commandBuffer];
        [v5 setLabel:@"libMTLHud"];
      }
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(a2 + 8);
      unint64_t v8 = [v6 colorAttachments];
      v9 = [v8 objectAtIndexedSubscript:0];
      [v9 setTexture:v7];

      id v10 = [v6 colorAttachments];
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];
      [v11 setLoadAction:1];

      int v12 = [v6 colorAttachments];
      id v13 = [v12 objectAtIndexedSubscript:0];
      [v13 setStoreAction:1];

      [v5 pushDebugGroup:@"libMTLHud"];
      unint64_t v14 = [*(id *)(a2 + 8) width];
      unint64_t v15 = [*(id *)(a2 + 8) height];
      uint64_t v16 = *(void **)(a2 + 8);
      if (*(float *)(a1 + 224) <= 1.0)
      {
        unint64_t v23 = [v16 width];
        unint64_t v24 = [*(id *)(a2 + 8) height];
        *(float *)&long long v21 = (float)v23;
        float v25 = (float)((float)v24 * 2.0) + 0.0;
        LODWORD(v20) = 0;
        *((void *)&v20 + 1) = 0;
        DWORD1(v19) = 0;
        *((void *)&v19 + 1) = 0;
        *(float *)&long long v19 = 2.0 / (float)(*(float *)&v21 + *(float *)&v21);
        *((float *)&v20 + 1) = 2.0 / (float)(0.0 - v25);
        *(float *)&long long v21 = (float)(*(float *)&v21 - *(float *)&v21) / (float)((float)-(float)v23 - (float)v23);
        float v22 = (float)(v25 + 0.0) / v25;
      }
      else
      {
        unint64_t v17 = [v16 width];
        unint64_t v18 = [*(id *)(a2 + 8) height];
        LODWORD(v20) = 0;
        *((void *)&v20 + 1) = 0;
        DWORD1(v19) = 0;
        *((void *)&v19 + 1) = 0;
        *(float *)&long long v19 = 2.0 / (float)v17;
        *((float *)&v20 + 1) = 2.0 / (float)(0.0 - (float)v18);
        *(float *)&long long v21 = (float)v17 / (float)(0.0 - (float)v17);
        float v22 = (float)v18 / (float)v18;
      }
      *((float *)&v21 + 1) = v22;
      DWORD2(v21) = 0x80000000;
      HIDWORD(v21) = 1.0;
      v38[0] = v19;
      v38[1] = v20;
      v38[2] = xmmword_234BDFDF0;
      v38[3] = v21;
      float v26 = [v5 renderCommandEncoderWithDescriptor:v6];
      v36[0] = 0;
      v36[1] = 0;
      *(double *)&v36[2] = (double)v14;
      *(double *)&v36[3] = (double)v15;
      long long v37 = xmmword_234BDFE00;
      [v26 setViewport:v36];
      [v26 setDepthStencilState:*(void *)(a1 + 64)];
      [v26 setVertexBytes:v38 length:64 atIndex:1];
      id v27 = *(id *)(a1 + 8 * *(unsigned int *)(a2 + 16) + 200);
      [v26 setVertexBuffer:v27 offset:0 atIndex:0];
      [v26 setFragmentTexture:*(void *)(a1 + 24) atIndex:0];
      float v28 = *(unsigned int **)(a1 + 160);
      float v29 = *(unsigned int **)(a1 + 168);
      if (v28 == v29)
      {
        int v30 = 0;
      }
      else
      {
        int v30 = 0;
        do
        {
          if (v28[2])
          {
            uint64_t v31 = (void *)*((void *)v28 + 2);
            if (v30 != v31)
            {
              id v32 = v31;

              int v30 = v32;
              [v26 setRenderPipelineState:v32];
            }
            [v26 setVertexBufferOffset:*v28 atIndex:0];
            [v26 drawIndexedPrimitives:3 indexCount:v28[2] indexType:0 indexBuffer:v27 indexBufferOffset:v28[1]];
          }
          v28 += 6;
        }
        while (v28 != v29);
      }
      [v26 endEncoding];

      uint64_t v34 = *(void *)(a1 + 160);
      uint64_t v33 = *(void *)(a1 + 168);
      if (v33 != v34)
      {
        do
        {
          uint64_t v35 = v33 - 24;

          uint64_t v33 = v35;
        }
        while (v35 != v34);
      }
      *(void *)(a1 + 168) = v34;
      [v5 popDebugGroup];
      if (([v5 commitAndWaitUntilSubmitted] & 1) == 0) {
        [v5 waitUntilScheduled];
      }
      *(_DWORD *)(a1 + 8) = -1;
      *(void *)(a1 + 16) = 0;
    }
  }
}

void sub_234BD8274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Renderer::getDynamicVertexIndexBuffers(uint64_t a1, unsigned int a2, int a3, int a4, uint64_t *a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  *a7 = *(_DWORD *)(a1 + 192);
  uint64_t v12 = (20 * a3 + 255) & 0xFFFFFF00;
  uint64_t result = CDynamicBuffer::GetPtr((CDynamicBuffer *)(a1 + 184), a2, (20 * a3 + 2 * a4 + 511) & 0xFFFFFF00);
  *a5 = result;
  *a6 = result + v12;
  *a8 = *a7 + v12;
  return result;
}

double Renderer::DrawText(Renderer *this, const char *a2, int a3, int a4, double result)
{
  if (a3 >= 1)
  {
    unsigned int v7 = *((_DWORD *)this + 2);
    if ((v7 & 0x80000000) == 0)
    {
      uint64_t result = *((double *)this + 19);
      if (*(float *)&result >= 0.0 && *((float *)&result + 1) >= 0.0)
      {
        unsigned int v38 = HIDWORD(*((void *)this + 19));
        unsigned int v39 = LODWORD(result);
        uint64_t v9 = *((void *)this + 14);
        if (v9)
        {
          int v10 = *((_DWORD *)this + 34);
          if ((v10 + 4 * a3) >= *((_DWORD *)this + 32)
            || (uint64_t v11 = *((int *)this + 35), (v11 + 6 * a3) >= *((_DWORD *)this + 33)))
          {
            Renderer::DrawText();
          }
          *((int32x2_t *)this + 17) = vmla_s32(*(int32x2_t *)((char *)this + 136), vdup_n_s32(esfm_GenerateTriangesForString((uint64_t)a2, (float *)&v39, (float *)&v38, a4, *((void **)this + 3), *((void *)this + 4), *((_DWORD *)this + 10), v9 + 20 * v10, *((float *)this + 12), (_WORD *)(*((void *)this + 15) + 2 * v11), *((_DWORD *)this + 34))), (int32x2_t)0x600000004);
        }
        else
        {
          int v12 = *((_DWORD *)this + 48);
          uint64_t v13 = (80 * a3 + 255) & 0xFFFFFF00;
          uint64_t Ptr = CDynamicBuffer::GetPtr((Renderer *)((char *)this + 184), v7, (92 * a3 + 511) & 0xFFFFFF00);
          int v15 = v12 + v13;
          int v16 = 6
              * esfm_GenerateTriangesForString((uint64_t)a2, (float *)&v39, (float *)&v38, a4, *((void **)this + 3), *((void *)this + 4), *((_DWORD *)this + 10), Ptr, *((float *)this + 12), (_WORD *)(Ptr + v13), 0);
          id v17 = **((id **)this + 2);
          unint64_t v18 = *((void *)this + 22);
          unint64_t v19 = *((void *)this + 21);
          if (v19 >= v18)
          {
            uint64_t v21 = *((void *)this + 20);
            unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - v21) >> 3);
            if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - v21) >> 3);
            uint64_t v24 = 2 * v23;
            if (2 * v23 <= v22 + 1) {
              uint64_t v24 = v22 + 1;
            }
            if (v23 >= 0x555555555555555) {
              unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v25 = v24;
            }
            id v43 = (char *)this + 176;
            if (v25)
            {
              float v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v25);
              uint64_t v28 = v27;
            }
            else
            {
              float v26 = 0;
              uint64_t v28 = 0;
            }
            float v29 = &v26[24 * v22];
            *(_DWORD *)float v29 = v12;
            *((_DWORD *)v29 + 1) = v15;
            *((_DWORD *)v29 + 2) = v16;
            *((void *)v29 + 2) = v17;
            uint64_t v31 = *((void *)this + 20);
            unint64_t v30 = *((void *)this + 21);
            if (v30 == v31)
            {
              int64x2_t v36 = vdupq_n_s64(v30);
              id v32 = v29;
            }
            else
            {
              id v32 = v29;
              do
              {
                uint64_t v33 = *(void *)(v30 - 24);
                v30 -= 24;
                int v34 = *(_DWORD *)(v30 + 8);
                *((void *)v32 - 3) = v33;
                v32 -= 24;
                *((_DWORD *)v32 + 2) = v34;
                uint64_t v35 = *(void *)(v30 + 16);
                *(void *)(v30 + 16) = 0;
                *((void *)v32 + 2) = v35;
              }
              while (v30 != v31);
              int64x2_t v36 = *((int64x2_t *)this + 10);
            }
            long long v20 = v29 + 24;
            *((void *)this + 20) = v32;
            *((void *)this + 21) = v29 + 24;
            int64x2_t v41 = v36;
            uint64_t v37 = *((void *)this + 22);
            *((void *)this + 22) = &v26[24 * v28];
            uint64_t v42 = v37;
            uint64_t v40 = v36.i64[0];
            std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v40);
          }
          else
          {
            *(_DWORD *)unint64_t v19 = v12;
            *(_DWORD *)(v19 + 4) = v15;
            *(_DWORD *)(v19 + 8) = v16;
            *(void *)(v19 + 16) = v17;
            long long v20 = (char *)(v19 + 24);
          }
          *((void *)this + 21) = v20;
        }
        uint64_t result = COERCE_DOUBLE(__PAIR64__(v38, v39));
        *((void *)this + 19) = __PAIR64__(v38, v39);
      }
    }
  }
  return result;
}

void sub_234BD865C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n64 Renderer::DrawLine(uint64_t a1, int a2, __n64 result, float32x2_t a4, float a5)
{
  uint64_t v5 = *(void *)(a1 + 112);
  if (v5)
  {
    int v6 = *(_DWORD *)(a1 + 136);
    uint64_t v7 = *(int *)(a1 + 140);
    uint64_t v8 = v5 + 20 * v6;
    float32x2_t v9 = vadd_f32((float32x2_t)result.n64_u64[0], (float32x2_t)0x3F0000003F000000);
    float32x2_t v10 = vadd_f32(a4, (float32x2_t)0x3F0000003F000000);
    float32x2_t v11 = vsub_f32(v10, v9);
    float32x2_t v12 = vmul_f32(v11, v11);
    v12.i32[0] = vadd_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 1)).u32[0];
    uint64_t v13 = *(void *)(a1 + 120);
    float32x2_t v14 = vrsqrte_f32((float32x2_t)v12.u32[0]);
    float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14)));
    int32x2_t v16 = (int32x2_t)vmul_n_f32(vmul_n_f32(v11, vmul_f32(v15, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v15, v15))).f32[0]), a5 * 0.5);
    float32x2_t v17 = (float32x2_t)vrev64_s32(v16);
    float32x2_t v18 = vadd_f32(v9, v17);
    result.n64_u64[0] = (unint64_t)vsub_f32(v9, v17);
    uint64_t v19 = *(void *)(a1 + 56);
    *(void *)uint64_t v8 = __PAIR64__(result.n64_u32[1], v18.u32[0]);
    *(void *)(v8 + 8) = v19;
    *(_DWORD *)(v8 + 16) = a2;
    *(_DWORD *)(v8 + 20) = vadd_f32(v10, v17).u32[0];
    *(float *)(v8 + 24) = v10.f32[1] - *(float *)v16.i32;
    *(void *)(v8 + 28) = v19;
    *(_DWORD *)(v8 + 36) = a2;
    *(_DWORD *)(v8 + 40) = vsub_f32(v10, v17).u32[0];
    *(float *)(v8 + 44) = v10.f32[1] + *(float *)v16.i32;
    *(void *)(v8 + 48) = v19;
    result.n64_u32[1] = v18.u32[1];
    *(_DWORD *)(v8 + 56) = a2;
    long long v20 = (_WORD *)(v13 + 2 * v7);
    *(__n64 *)(v8 + 60) = result;
    *(void *)(v8 + 68) = v19;
    *(_DWORD *)(v8 + 76) = a2;
    *long long v20 = v6;
    v20[1] = v6 + 1;
    v20[2] = v6 + 2;
    v20[3] = v6;
    v20[4] = v6 + 2;
    v20[5] = v6 + 3;
    *(_DWORD *)(a1 + 136) = v6 + 4;
    *(_DWORD *)(a1 + 140) = v7 + 6;
  }
  return result;
}

void Renderer::DrawLines(uint64_t a1, int8x16_t *a2, int a3, int a4, float a5)
{
  if (*(void *)(a1 + 112)
    && *(_DWORD *)(a1 + 136) + 4 * a3 < *(_DWORD *)(a1 + 128)
    && *(_DWORD *)(a1 + 140) + 6 * a3 < *(_DWORD *)(a1 + 132)
    && a3 >= 1)
  {
    uint64_t v10 = a3;
    do
    {
      int8x16_t v11 = *a2++;
      Renderer::DrawLine(a1, a4, *(__n64 *)v11.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL), a5);
      --v10;
    }
    while (v10);
  }
}

void Renderer::DrawGraph(uint64_t a1, uint64_t a2, int a3, int a4, int a5, float a6, float a7, float a8, float32x2_t a9, __n128 a10)
{
  if (a3 >= 1 && *(void *)(a1 + 112))
  {
    float32x2_t v31 = vsub_f32((float32x2_t)a10.n128_u64[0], a9);
    int v14 = (int)v31.f32[0];
    if ((int)v31.f32[0] >= a3) {
      int v14 = a3;
    }
    if (v14 >= 2)
    {
      int v19 = v14 - 1;
      float v20 = 1.0 / (float)(v14 - 1);
      float v21 = 1.0 / (float)(a7 - a6);
      float v22 = v21 * (float)(*(float *)(a2 + 4 * ((a4 + 1) % a3)) - a6);
      float v23 = 1.0 - v22;
      if (v22 > 1.0) {
        float v23 = 0.0;
      }
      if (v22 >= 0.0) {
        float v24 = v23;
      }
      else {
        float v24 = 1.0;
      }
      v25.i32[0] = 0;
      v25.f32[1] = v24;
      float v26 = (float)(a3 - 1);
      a10.n128_u64[0] = 0;
      do
      {
        a10.n128_f32[0] = v20 + a10.n128_f32[0];
        int v27 = (int)(float)((float)(a10.n128_f32[0] * v26) + 0.5);
        if (v27 < 0 || v27 >= a3) {
          Renderer::DrawGraph();
        }
        float v28 = v21 * (float)(*(float *)(a2 + 4 * ((v27 + a4) % a3)) - a6);
        float v29 = 1.0 - v28;
        if (v28 > 1.0) {
          float v29 = 0.0;
        }
        if (v28 >= 0.0) {
          float v30 = v29;
        }
        else {
          float v30 = 1.0;
        }
        unint64_t v32 = __PAIR64__(LODWORD(v30), a10.n128_u32[0]);
        __n128 v33 = a10;
        Renderer::DrawLine(a1, a5, (__n64)vmla_f32(a9, v31, v25), vmla_f32(a9, v31, (float32x2_t)__PAIR64__(LODWORD(v30), a10.n128_u32[0])), a8);
        float32x2_t v25 = (float32x2_t)v32;
        a10 = v33;
        --v19;
      }
      while (v19);
    }
  }
}

void Renderer::DrawRoundedRect(Renderer *this, float a2, float a3, float32x2_t a4, float32_t a5, double a6, int a7)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if ((*((_DWORD *)this + 2) & 0x80000000) == 0)
  {
    if (Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::onceToken != -1)
    {
      __int32 v49 = a4.i32[0];
      double v50 = a6;
      float v48 = a5;
      dispatch_once(&Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::onceToken, &__block_literal_global);
      a5 = v48;
      a4.i32[0] = v49;
      a6 = v50;
    }
    uint64_t v11 = 0;
    a4.f32[1] = a5;
    float32x2_t v12 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    float32x2_t v13 = vsub_f32(a4, v12);
    do
    {
      v55[v11] = vmla_f32(v13, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[v11]);
      ++v11;
    }
    while (v11 != 5);
    uint64_t v14 = 0;
    v16.i32[1] = v13.i32[1];
    do
    {
      v16.f32[0] = a2 + *(float *)&a6;
      v55[v14 + 5] = vmla_f32(v16, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[v14 + 4]);
      ++v14;
    }
    while (v14 != 5);
    for (uint64_t i = 0; i != 5; ++i)
    {
      v15.f32[0] = a2 + *(float *)&a6;
      v15.f32[1] = a3 + *(float *)&a6;
      v55[i + 10] = vmla_f32(v15, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[i + 8]);
    }
    for (uint64_t j = 15; j != 20; ++j)
    {
      v13.f32[1] = a3 + *(float *)&a6;
      v55[j] = vmla_f32(v13, v12, Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[((_BYTE)j - 3) & 0xF]);
    }
    int v19 = *((_DWORD *)this + 48);
    uint64_t Ptr = CDynamicBuffer::GetPtr((Renderer *)((char *)this + 184), *((_DWORD *)this + 2), 768);
    uint64_t v21 = 0;
    float v22 = (_WORD *)(Ptr + 512);
    float32x2_t v23 = *(float32x2_t *)((char *)this + 56);
    float v24 = (float32x2_t *)(Ptr + 16);
    do
    {
      v24[-2] = v55[v21];
      v24[-1] = v23;
      v24->i32[0] = a7;
      float v24 = (float32x2_t *)((char *)v24 + 20);
      ++v21;
    }
    while (v21 != 20);
    int v25 = v19 + 512;
    for (int k = 2; k != 20; ++k)
    {
      *float v22 = 0;
      v22[1] = k - 1;
      v22[2] = k;
      v22 += 3;
    }
    id v27 = **((id **)this + 2);
    unint64_t v28 = *((void *)this + 22);
    unint64_t v29 = *((void *)this + 21);
    if (v29 >= v28)
    {
      uint64_t v31 = *((void *)this + 20);
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - v31) >> 3);
      if (v32 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v31) >> 3);
      uint64_t v34 = 2 * v33;
      if (2 * v33 <= v32 + 1) {
        uint64_t v34 = v32 + 1;
      }
      if (v33 >= 0x555555555555555) {
        unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v35 = v34;
      }
      float v54 = (char *)this + 176;
      if (v35)
      {
        int64x2_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v35);
        uint64_t v38 = v37;
      }
      else
      {
        int64x2_t v36 = 0;
        uint64_t v38 = 0;
      }
      unsigned int v39 = &v36[24 * v32];
      *(_DWORD *)unsigned int v39 = v19;
      *((_DWORD *)v39 + 1) = v25;
      *((_DWORD *)v39 + 2) = 54;
      *((void *)v39 + 2) = v27;
      uint64_t v41 = *((void *)this + 20);
      unint64_t v40 = *((void *)this + 21);
      if (v40 == v41)
      {
        int64x2_t v46 = vdupq_n_s64(v40);
        uint64_t v42 = v39;
      }
      else
      {
        uint64_t v42 = v39;
        do
        {
          uint64_t v43 = *(void *)(v40 - 24);
          v40 -= 24;
          int v44 = *(_DWORD *)(v40 + 8);
          *((void *)v42 - 3) = v43;
          v42 -= 24;
          *((_DWORD *)v42 + 2) = v44;
          uint64_t v45 = *(void *)(v40 + 16);
          *(void *)(v40 + 16) = 0;
          *((void *)v42 + 2) = v45;
        }
        while (v40 != v41);
        int64x2_t v46 = *((int64x2_t *)this + 10);
      }
      float v30 = v39 + 24;
      *((void *)this + 20) = v42;
      *((void *)this + 21) = v39 + 24;
      int64x2_t v52 = v46;
      uint64_t v47 = *((void *)this + 22);
      *((void *)this + 22) = &v36[24 * v38];
      uint64_t v53 = v47;
      uint64_t v51 = v46.i64[0];
      std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v51);
    }
    else
    {
      *(_DWORD *)unint64_t v29 = v19;
      *(_DWORD *)(v29 + 4) = v25;
      *(_DWORD *)(v29 + 8) = 54;
      *(void *)(v29 + 16) = v27;
      float v30 = (char *)(v29 + 24);
    }
    *((void *)this + 21) = v30;
  }
}

void sub_234BD8CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float ___ZN8Renderer15DrawRoundedRectEfffffj_block_invoke()
{
  for (uint64_t i = 0; i != 16; ++i)
  {
    __float2 v2 = __sincospif_stret((float)((float)(int)i * 0.0625) + (float)((float)(int)i * 0.0625));
    float result = v2.__sinval;
    Renderer::DrawRoundedRect(float,float,float,float,float,unsigned int)::sCircle[i] = __PAIR64__(LODWORD(v2.__sinval), LODWORD(v2.__cosval));
  }
  return result;
}

__n64 Renderer::MeasureStringSize(Renderer *this, const char *a2)
{
  float v2 = 0.0;
  result.n64_u32[0] = -8388609;
  float v4 = *((float *)this + 12);
  float v5 = -3.4028e38;
  while (1)
  {
    int v7 = *(unsigned __int8 *)a2++;
    int v6 = v7;
    if (v7 != 10) {
      break;
    }
    float v4 = *((float *)this + 12) + v4;
    float v2 = 0.0;
LABEL_6:
    if (result.n64_f32[0] <= v2) {
      result.n64_f32[0] = v2;
    }
    if (v5 <= v4) {
      float v5 = v4;
    }
  }
  if (v6)
  {
    float v2 = v2 + *(float *)(*((void *)this + 4) + 28 * ((char)v6 - *((_DWORD *)this + 10)) + 16);
    goto LABEL_6;
  }
  result.n64_f32[1] = v5;
  return result;
}

uint64_t CDynamicBuffer::GetPtr(CDynamicBuffer *this, unsigned int a2, int a3)
{
  float v5 = (char *)this + 8 * a2;
  int v7 = (void *)*((void *)v5 + 2);
  int v6 = (void **)(v5 + 16);
  id v8 = v7;
  unint64_t v9 = [v8 length];
  unsigned int v10 = (a3 + 255) & 0xFFFFFF00;
  unint64_t v11 = *((_DWORD *)this + 2) + v10;
  if (v8) {
    BOOL v12 = v9 >= v11;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    float32x2_t v13 = (void *)MEMORY[0x237DCE950](v9);
    uint64_t v14 = (void *)[*(id *)this newBufferWithLength:v11 options:0];
    size_t v15 = [v8 length];
    if (v15 && *((_DWORD *)this + 2)) {
      memcpy((void *)[v14 contents], (const void *)[objc_retainAutorelease(v8) contents], v15);
    }
    id v16 = v14;

    float32x2_t v17 = *v6;
    *int v6 = v16;

    id v8 = v16;
  }
  id v18 = v8;
  uint64_t v19 = [v18 contents];
  uint64_t v20 = *((unsigned int *)this + 2);
  uint64_t v21 = v19 + v20;
  *((_DWORD *)this + 2) = v20 + v10;

  return v21;
}

void sub_234BD8ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264C04048, MEMORY[0x263F8C060]);
}

void sub_234BD8F70(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n64 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::find<Renderer::SPiplelinesDescriptor>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
    if (v3 >= *(void *)&v2) {
      uint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    uint64_t v5 = v3 & (*(void *)&v2 + 4095);
  }
  int v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  __n64 result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1]) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      __n64 result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__emplace_unique_key_args<Renderer::SPiplelinesDescriptor,std::pair<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v6 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      uint64_t v3 = *a2 & 7 | (8 * (a2[1] & 0x1FFLL));
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
    }
    else
    {
      uint64_t v3 = v6 & (v7 + 4095);
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  float32x2_t v13 = (void *)(a1 + 16);
  uint64_t i = operator new(0x28uLL);
  *uint64_t i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  uint64_t v14 = *(void *)(a3 + 16);
  *(void *)(a3 + 16) = 0;
  i[4] = v14;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__rehash<true>(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
      else {
        uint64_t v3 = v6;
      }
    }
    else
    {
      uint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v21 = *(void *)a1;
  float v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t i = *v22;
LABEL_42:
    *float v22 = i;
    goto LABEL_43;
  }
  *uint64_t i = *v13;
  *float32x2_t v13 = i;
  *(void *)(v21 + 8 * v3) = v13;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7) {
        v23 %= v7;
      }
    }
    else
    {
      v23 &= v7 - 1;
    }
    float v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_234BD9398(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unsigned int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

objc_object *MTLHud_objc_unwrap(objc_object *a1)
{
  v1 = a1;
  SEL v2 = NSSelectorFromString(&cfstr_Baseobject.isa);
  while ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v3 = ((void (*)(objc_object *, SEL))[(objc_object *)v1 methodForSelector:v2])(v1, v2);

    v1 = (objc_object *)v3;
  }

  return v1;
}

void sub_234BD96E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MTLHudIsInternalInstall(void)
{
  if (MTLHudIsInternalInstall(void)::__onceToken != -1) {
    dispatch_once(&MTLHudIsInternalInstall(void)::__onceToken, &__block_literal_global_0);
  }
  return MTLHudIsInternalInstall(void)::__internalInstall;
}

uint64_t ___Z23MTLHudIsInternalInstallv_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  MTLHudIsInternalInstall(void)::__internalInstall = result;
  return result;
}

uint64_t MTLHudIsSideLoadedApp(void)
{
  if (MTLHudIsSideLoadedApp(void)::__onceToken != -1) {
    dispatch_once(&MTLHudIsSideLoadedApp(void)::__onceToken, &__block_literal_global_6);
  }
  return MTLHudIsSideLoadedApp(void)::__isSideloaded;
}

uint64_t ___Z21MTLHudIsSideLoadedAppv_block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 appStoreReceiptURL];
  int8x8_t v4 = [v1 path];

  if ([v4 containsString:@"sandboxReceipt"]) {
    char v2 = 1;
  }
  else {
    char v2 = [v4 containsString:@"CoreSimulator"];
  }
  MTLHudIsSideLoadedApp(void)::__isSideloaded = v2;

  return MEMORY[0x270F9A758]();
}

void sub_234BD984C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t MTLHudIsProcessTranslated(void)
{
  return 0;
}

uint64_t MTLHudIsBlastDoor(void)
{
  if (MTLHudIsBlastDoor(void)::onceToken != -1) {
    dispatch_once(&MTLHudIsBlastDoor(void)::onceToken, &__block_literal_global_14);
  }
  return MTLHudIsBlastDoor(void)::isBlastDoor;
}

__CFBundle *___Z17MTLHudIsBlastDoorv_block_invoke()
{
  uint64_t result = CFBundleGetMainBundle();
  if (result)
  {
    uint64_t result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      CFStringRef v1 = (const __CFString *)result;
      uint64_t result = (__CFBundle *)CFStringCompare((CFStringRef)result, @"com.apple.MessagesBlastDoorService", 0);
      if (result && (uint64_t result = (__CFBundle *)CFStringCompare(v1, @"com.apple.MessagesAirlockService", 0)) != 0)
      {
        uint64_t result = (__CFBundle *)CFStringCompare(v1, @"com.apple.gputoolsserviced", 0);
        BOOL v2 = result == 0;
      }
      else
      {
        BOOL v2 = 1;
      }
      MTLHudIsBlastDoor(void)::isBlastDoor = v2;
    }
  }
  return result;
}

void nextDrawableCommon(CAMetalLayer *a1)
{
  CFStringRef v1 = a1;
  uint64_t v3 = v1;
  if (nextDrawableCommon(CAMetalLayer *)::callCount < 4) {
    ++nextDrawableCommon(CAMetalLayer *)::callCount;
  }
  else {
    Overlay::Init((Overlay *)v1, v2);
  }
}

void sub_234BD99B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void InitInterpose(void)
{
  if ((MTLHudIsBlastDoor() & 1) == 0)
  {
    dispatch_time_t v0 = dispatch_time(0, 0);
    CFStringRef v1 = MEMORY[0x263EF83A0];
    dispatch_after(v0, v1, &__block_literal_global_1);
  }
}

void ___Z13InitInterposev_block_invoke()
{
  dispatch_time_t v0 = (void *)MEMORY[0x237DCE950]();
  id v1 = MTLCreateSystemDefaultDevice();
  BOOL v2 = (void *)[v1 newCommandQueue];
  uint64_t v3 = [v2 commandBuffer];
  [v3 commit];
  int8x8_t v4 = (objc_class *)objc_opt_class();
  replaceMethod<void>(v4, sel_commit, (uint64_t)MTLCommandBuffer_commit);
  unint64_t v5 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v5, sel_nextDrawable, (uint64_t)CAMetalLayer_nextDrawable);
  uint64_t v6 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v6, sel_drawable, (uint64_t)CAMetalDisplayLinkUpdate_drawable);
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_shimDrawable_])
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    if (sel_shimDrawable_)
    {
      unint64_t v8 = v7;
      if (v7)
      {
        InstanceMethod = class_getInstanceMethod(v7, sel_shimDrawable_);
        unsigned int v10 = InstanceMethod;
        if (InstanceMethod)
        {
          IMP Implementation = method_getImplementation(InstanceMethod);
          BOOL v17 = v0;
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = ___ZL13replaceMethodIU8__strongP11objc_objectJU8__strongPU26objcproto15CAMetalDrawable11objc_objectEEvP10objc_classP13objc_selectorPFT_PFvvES1_S9_DpT0_E_block_invoke;
          v18[3] = &__block_descriptor_56_e30__24__0_8___CAMetalDrawable__16l;
          v18[4] = CAMetalLayer_shimDrawable;
          v18[5] = Implementation;
          v18[6] = sel_shimDrawable_;
          unint64_t v12 = (void *)MEMORY[0x237DCEB20](v18);
          float32x2_t v13 = imp_implementationWithBlock(v12);

          TypeEncoding = method_getTypeEncoding(v10);
          dispatch_time_t v0 = v17;
          class_replaceMethod(v8, sel_shimDrawable_, v13, TypeEncoding);
        }
      }
    }
  }
  float v15 = (objc_class *)objc_opt_class();
  replaceMethod<objc_object * {__strong}>(v15, sel_nextDrawable, (uint64_t)CAMetalLayer_nextDrawable);
  Class = objc_getClass("CAMetalDrawable");
  replaceMethod<void>(Class, sel_present, (uint64_t)CAMetalDrawable_present);
  replaceMethod<void,double>(sel_presentAtTime_, (uint64_t)CAMetalDrawable_presentAtTime);
  replaceMethod<void,double>(sel_presentAfterMinimumDuration_, (uint64_t)CAMetalDrawable_presentAfterMinimumDuration);
}

void sub_234BD9C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_class *replaceMethod<void>(objc_class *result, SEL name, uint64_t a3)
{
  if (result && name)
  {
    unint64_t v5 = result;
    uint64_t result = class_getInstanceMethod(result, name);
    if (result)
    {
      uint64_t v6 = result;
      IMP Implementation = method_getImplementation(result);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = ___ZL13replaceMethodIvJEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke;
      v11[3] = &__block_descriptor_56_e8_v16__0_8l;
      v11[4] = a3;
      v11[5] = Implementation;
      v11[6] = name;
      unint64_t v8 = (void *)MEMORY[0x237DCEB20](v11);
      uint8x8_t v9 = imp_implementationWithBlock(v8);

      TypeEncoding = method_getTypeEncoding(v6);
      return (objc_class *)class_replaceMethod(v5, name, v9, TypeEncoding);
    }
  }
  return result;
}

void sub_234BD9D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLCommandBuffer_commit(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  uint64_t v7 = a2;
  unint64_t v5 = (Overlay *)[(id)_sharedCaptureManager isCapturing];
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = Overlay::Instance(v5);
    if (v6) {
      Overlay::onCommandBufferCommit(v6, v7);
    }
  }
  a1(v7, a3);
}

void sub_234BD9E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

objc_class *replaceMethod<objc_object * {__strong}>(objc_class *result, SEL name, uint64_t a3)
{
  if (result && name)
  {
    unint64_t v5 = result;
    uint64_t result = class_getInstanceMethod(result, name);
    if (result)
    {
      unint64_t v6 = result;
      IMP Implementation = method_getImplementation(result);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = ___ZL13replaceMethodIU8__strongP11objc_objectJEEvP10objc_classP13objc_selectorPFT_PFvvES1_S6_DpT0_E_block_invoke;
      v11[3] = &__block_descriptor_56_e8__16__0_8l;
      v11[4] = a3;
      v11[5] = Implementation;
      v11[6] = name;
      unint64_t v8 = (void *)MEMORY[0x237DCEB20](v11);
      uint8x8_t v9 = imp_implementationWithBlock(v8);

      TypeEncoding = method_getTypeEncoding(v6);
      return (objc_class *)class_replaceMethod(v5, name, v9, TypeEncoding);
    }
  }
  return result;
}

void sub_234BD9EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CAMetalLayer_nextDrawable(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  unint64_t v5 = a2;
  nextDrawableCommon((CAMetalLayer *)v5);
  unint64_t v6 = a1(v5, a3);

  return v6;
}

void sub_234BD9F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CAMetalDisplayLinkUpdate_drawable(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  unint64_t v5 = a2;
  nextDrawableCommon((CAMetalLayer *)v5);
  unint64_t v6 = a1(v5, a3);

  return v6;
}

void sub_234BD9FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CAMetalLayer_shimDrawable(void (*a1)(CAMetalLayer *, uint64_t, id), void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a2;
  id v8 = a4;
  nextDrawableCommon(v7);
  uint8x8_t v9 = a1(v7, a3, v8);

  return v9;
}

void sub_234BDA074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAMetalDrawable_present(void (*a1)(objc_object *, objc_selector *), objc_object *a2, objc_selector *a3)
{
  uint64_t v7 = a2;
  unint64_t v5 = (Overlay *)[(id)_sharedCaptureManager isCapturing];
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = Overlay::Instance(v5);
    if (v6) {
      Overlay::onPresent(v6, v7);
    }
  }
  a1(v7, a3);
}

void sub_234BDA104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

objc_class *replaceMethod<void,double>(const char *a1, uint64_t a2)
{
  uint64_t result = objc_getClass("CAMetalDrawable");
  if (a1)
  {
    unint64_t v5 = result;
    if (result)
    {
      uint64_t result = class_getInstanceMethod(result, a1);
      if (result)
      {
        unint64_t v6 = result;
        IMP Implementation = method_getImplementation(result);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = ___ZL13replaceMethodIvJdEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke;
        v11[3] = &__block_descriptor_56_e11_v24__0_8d16l;
        v11[4] = a2;
        v11[5] = Implementation;
        v11[6] = a1;
        id v8 = (void *)MEMORY[0x237DCEB20](v11);
        uint8x8_t v9 = imp_implementationWithBlock(v8);

        TypeEncoding = method_getTypeEncoding(v6);
        return (objc_class *)class_replaceMethod(v5, a1, v9, TypeEncoding);
      }
    }
  }
  return result;
}

void sub_234BDA208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CAMetalDrawable_presentAtTime(void (*a1)(objc_object *, objc_selector *, double), objc_object *a2, objc_selector *a3, double a4)
{
  uint8x8_t v9 = a2;
  uint64_t v7 = (Overlay *)[(id)_sharedCaptureManager isCapturing];
  if ((v7 & 1) == 0)
  {
    unint64_t v8 = Overlay::Instance(v7);
    if (v8) {
      Overlay::onPresent(v8, v9);
    }
  }
  a1(v9, a3, a4);
}

void sub_234BDA2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CAMetalDrawable_presentAfterMinimumDuration(void (*a1)(objc_object *, objc_selector *, double), objc_object *a2, objc_selector *a3, double a4)
{
  uint8x8_t v9 = a2;
  uint64_t v7 = (Overlay *)[(id)_sharedCaptureManager isCapturing];
  if ((v7 & 1) == 0)
  {
    unint64_t v8 = Overlay::Instance(v7);
    if (v8) {
      Overlay::onPresent(v8, v9);
    }
  }
  a1(v9, a3, a4);
}

void sub_234BDA340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL13replaceMethodIvJEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x237DCE950]();
  (*(void (**)(void, id, void))(a1 + 32))(*(void *)(a1 + 40), v4, *(void *)(a1 + 48));
}

void sub_234BDA3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ___ZL13replaceMethodIU8__strongP11objc_objectJEEvP10objc_classP13objc_selectorPFT_PFvvES1_S6_DpT0_E_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x237DCE950]();
  unint64_t v5 = (*(void (**)(void, id, void))(a1 + 32))(*(void *)(a1 + 40), v3, *(void *)(a1 + 48));

  return v5;
}

void sub_234BDA440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL13replaceMethodIU8__strongP11objc_objectJU8__strongPU26objcproto15CAMetalDrawable11objc_objectEEvP10objc_classP13objc_selectorPFT_PFvvES1_S9_DpT0_E_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x237DCE950]();
  unint64_t v8 = (*(void (**)(void, id, void, id))(a1 + 32))(*(void *)(a1 + 40), v5, *(void *)(a1 + 48), v6);

  return v8;
}

void sub_234BDA4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL13replaceMethodIvJdEEvP10objc_classP13objc_selectorPFT_PFvvEP11objc_objectS3_DpT0_E_block_invoke(uint64_t a1, void *a2, double a3)
{
  id v6 = a2;
  id v5 = (void *)MEMORY[0x237DCE950]();
  (*(void (**)(void, id, void, double))(a1 + 32))(*(void *)(a1 + 40), v6, *(void *)(a1 + 48), a3);
}

void sub_234BDA55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234BDA608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDA790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDA97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDAE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_234BDB010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_234BDB080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234BDB1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_234BDB2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDB404(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_234BDB4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234BDB688(_Unwind_Exception *a1)
{
  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_234BDB784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234BDB828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDBA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

CHistoryRecord *CHistoryRecord::UpdateMinMax(CHistoryRecord *this)
{
  int v1 = 0;
  float v2 = 0.0;
  float v3 = 999.99;
  for (uint64_t i = 20; i != 500; i += 4)
  {
    float v5 = *(float *)((char *)&this->m_currentTime + i);
    float v6 = fminf(v3, v5);
    float v7 = fmaxf(v2, v5);
    if (v5 > 0.0)
    {
      float v3 = v6;
      float v2 = v7;
      ++v1;
    }
  }
  if (!v1)
  {
    float v2 = 0.0;
    float v3 = 0.0;
  }
  this->m_maxValue = v2;
  this->m_minValue = v3;
  return this;
}

unint64_t Overlay::Instance(Overlay *this)
{
  return atomic_load_explicit(&Overlay::sharedInstance, memory_order_acquire);
}

void Overlay::Init(Overlay *this, CAMetalLayer *a2)
{
  float v2 = this;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN7Overlay4InitEP12CAMetalLayer_block_invoke;
  block[3] = &unk_264C041A0;
  float v6 = v2;
  uint64_t v3 = Overlay::Init(CAMetalLayer *)::onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&Overlay::Init(CAMetalLayer *)::onceToken, block);
  }
}

void ___ZN7Overlay4InitEP12CAMetalLayer_block_invoke()
{
}

void sub_234BDBD80(_Unwind_Exception *a1)
{
  MEMORY[0x237DCE740](v1, 0x10F0C404999B8F0);
  _Unwind_Resume(a1);
}

void Overlay::Overlay(Overlay *this, CAMetalLayer *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = 0;
  *((void *)this + 1) = 0;
  float v5 = (id *)((char *)this + 8);
  *(_WORD *)this = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 4) = 1;
  *((_DWORD *)this + 10) = 0;
  do
  {
    float v6 = (char *)this + v4;
    *((void *)v6 + 11) = 0;
    *((void *)v6 + 12) = 0;
    *(void *)((char *)this + v4 + 80) = (char *)this + v4 + 88;
    v4 += 56;
  }
  while (v4 != 168);
  float v7 = (void **)((char *)this + 408);
  uint64_t v8 = 216;
  do
  {
    uint8x8_t v9 = (char *)this + v8;
    *(void *)uint8x8_t v9 = 850045863;
    *(_OWORD *)(v9 + 8) = 0uLL;
    *(_OWORD *)(v9 + 24) = 0uLL;
    *(_OWORD *)(v9 + 40) = 0uLL;
    *((void *)v9 + 7) = 0;
    v8 += 64;
  }
  while (v9 + 64 != (char *)v7);
  *((void *)this + 243) = 0;
  bzero((char *)this + 408, 0x5FCuLL);
  *((_DWORD *)this + 488) = -1;
  *((void *)this + 246) = 0;
  *((void *)this + 245) = 0;
  *(_OWORD *)((char *)this + 2008) = 0u;
  *(_OWORD *)((char *)this + 2024) = 0u;
  *((void *)this + 255) = 0;
  *((_DWORD *)this + 512) = 1065353216;
  *(_OWORD *)((char *)this + 2056) = 0u;
  *(_OWORD *)((char *)this + 2072) = 0u;
  *((void *)this + 261) = 0;
  __asm { FMOV            V1.2S, #-1.0 }
  *((void *)this + 262) = _D1;
  *((void *)this + 268) = 0;
  *((void *)this + 270) = 0;
  *((void *)this + 269) = 0;
  *(_OWORD *)((char *)this + 2104) = 0u;
  *(_OWORD *)((char *)this + 2120) = 0u;
  *((_DWORD *)this + 534) = 0;
  *((_DWORD *)this + 542) = 1065353216;
  *((void *)this + 289) = 0;
  *(_OWORD *)((char *)this + 2280) = 0u;
  *(_OWORD *)((char *)this + 2296) = 0u;
  *(_OWORD *)((char *)this + 2248) = 0u;
  *(_OWORD *)((char *)this + 2264) = 0u;
  *(_OWORD *)((char *)this + 2216) = 0u;
  *(_OWORD *)((char *)this + 2232) = 0u;
  *(_OWORD *)((char *)this + 2184) = 0u;
  *(_OWORD *)((char *)this + 2200) = 0u;
  uint64_t v15 = +[_CADeveloperHUDProperties instance];
  id v16 = *v5;
  id *v5 = (id)v15;

  uint64_t v17 = objc_opt_new();
  unint64_t v18 = *v7;
  void *v7 = (void *)v17;

  for (uint64_t i = 0; i != 168; i += 56)
  {
    std::__tree<std::pair<double,double>>::destroy((uint64_t)this + i + 80, *(void **)((char *)this + i + 88));
    *(void *)((char *)this + i + 80) = (char *)this + i + 88;
    *(void *)((char *)this + i + 88) = 0;
    *(void *)((char *)this + i + 96) = 0;
  }
  mach_timebase_info((mach_timebase_info_t)this + 3);
  uint64_t v20 = [MEMORY[0x263F12800] sharedCaptureManager];
  uint64_t v21 = (void *)_sharedCaptureManager;
  _sharedCaptureManager = v20;

  float v22 = [MEMORY[0x263F08AB0] processInfo];
  unint64_t v23 = [v22 processName];

  id v24 = v23;
  strncpy((char *)this + 2192, (const char *)[v24 UTF8String], 0x40uLL);
  int v25 = [(CAMetalLayer *)v3 device];
  id v26 = [v25 name];
  strncpy((char *)this + 2256, (const char *)[v26 UTF8String], 0x40uLL);

  if (Renderer::Init((Overlay *)((char *)this + 1944), v3))
  {
    memset(v57, 88, 27);
    *((__n64 *)this + 273) = Renderer::MeasureStringSize((Overlay *)((char *)this + 1944), v57);
    NSSelectorFromString(&cfstr_Developerhudpr.isa);
    *(unsigned char *)this = objc_opt_respondsToSelector() & 1;
    if ((MTLHudIsInternalInstall() & 1) != 0 || MTLHudIsSideLoadedApp())
    {
      id v27 = [MEMORY[0x263EFFA40] standardUserDefaults];
      unint64_t v28 = [v27 objectForKey:@"MetalForceHudEnabled"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v29 = [v28 BOOLValue];
      }
      else {
        char v29 = 0;
      }
      *((unsigned char *)this + 1) = v29;
    }
    if (*((unsigned char *)this + 1))
    {
      BOOL v30 = 1;
    }
    else
    {
      uint64_t v31 = getenv("MTL_HUD_ENABLED");
      if (!v31) {
        uint64_t v31 = "";
      }
      BOOL v30 = atoi(v31) != 0;
    }
    [*v5 setEnabled:v30];
    if (*(unsigned char *)this)
    {
      id v32 = *v5;
      unint64_t v33 = [(CAMetalLayer *)v3 developerHUDProperties];
      uint64_t v34 = [v33 objectForKeyedSubscript:@"mode"];
      [v32 setEnabled:([v34 isEqualToString:@"default"] | [v32 enabled])];
    }
    if (*((unsigned char *)this + 1))
    {
      BOOL v35 = 1;
    }
    else
    {
      int64x2_t v36 = getenv("MTL_HUD_LOG_ENABLED");
      if (!v36) {
        int64x2_t v36 = "";
      }
      BOOL v35 = atoi(v36) != 0;
    }
    [*v5 setLoggingEnabled:v35];
    if (*(unsigned char *)this)
    {
      uint64_t v37 = [(CAMetalLayer *)v3 developerHUDProperties];
      uint64_t v38 = [v37 objectForKeyedSubscript:@"logging"];

      id v39 = *v5;
      objc_opt_class();
      int v40 = (objc_opt_isKindOfClass() & 1) != 0 ? [v38 isEqualToString:@"default"] : 0;
      [v39 setLoggingEnabled:v40 | [v39 loggingEnabled]];

      if (*(unsigned char *)this)
      {
        if (![*v5 alignment])
        {
          uint64_t v41 = [(CAMetalLayer *)v3 developerHUDProperties];
          uint64_t v42 = [v41 objectForKeyedSubscript:@"alignment"];

          if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [*v5 setAlignment:[v42 integerValue] & 0x1F];
          }
          else
          {
            uint64_t v43 = getenv("MTL_HUD_ALIGNMENT");
            if (v43) {
              [*v5 setAlignment:atoi(v43) & 0x1F];
            }
          }
        }
        int v44 = [(CAMetalLayer *)v3 developerHUDProperties];
        uint64_t v45 = [v44 objectForKeyedSubscript:@"positionX"];

        int64x2_t v46 = [(CAMetalLayer *)v3 developerHUDProperties];
        uint64_t v47 = [v46 objectForKeyedSubscript:@"positionY"];

        if (v45)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & (v47 != 0)) == 1)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [*v5 setAlignment:1];
              [v45 floatValue];
              float v49 = v48;
              [v47 floatValue];
              [*v5 setPosition:v49, v50];
            }
          }
        }
      }
    }
    uint64_t v51 = getenv("MTL_HUD_OPACITY");
    if (!v51) {
      uint64_t v51 = "0.703";
    }
    double v52 = atof(v51);
    if (v52 < 0.0) {
      double v52 = 0.0;
    }
    if (v52 > 1.0) {
      double v52 = 1.0;
    }
    opacityOverride = *(void *)&v52;
    uint64_t v53 = getenv("MTL_HUD_SCALE_OVERRIDE");
    if (!v53) {
      uint64_t v53 = "1.0";
    }
    double v54 = atof(v53);
    if (v54 < 0.75) {
      double v54 = 0.75;
    }
    if (v54 > 1.5) {
      double v54 = 1.5;
    }
    scaleOverride = *(void *)&v54;
    int v55 = [[_LayerHUDPropertiesListener alloc] initWithLayer:v3 andOverlay:this];
    uint64_t v56 = (void *)*((void *)this + 2);
    *((void *)this + 2) = v55;
  }
  *((_DWORD *)this + 544) = 0;
}

void sub_234BDC46C(_Unwind_Exception *a1)
{
  Renderer::~Renderer(v4);
  for (uint64_t i = 344; i != 152; i -= 64)
    std::mutex::~mutex((std::mutex *)(v1 + i));
  for (uint64_t j = 0; j != -168; j -= 56)
    std::__tree<std::pair<double,double>>::destroy(v1 + j + 192, *(void **)(v1 + j + 200));

  _Unwind_Resume(a1);
}

void Renderer::~Renderer(id *this)
{
  for (uint64_t i = 27; i != 24; --i)

  uint64_t v3 = this + 20;
  std::vector<Renderer::SDrawCommand>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::~__hash_table((uint64_t)(this + 9));
}

void Overlay::onPresent(uint64_t a1, void *a2)
{
  kern_return_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  __CFString *v41;
  __n128 v42;
  __n128 v43;
  char *v44;
  int v45;
  double v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  int v51;
  double v52;
  double v53;
  int v54;
  double v55;
  const char *v56;
  int v57;
  double v58;
  int v59;
  double v60;
  uint64_t (*v61)(uint64_t, char *);
  int v62;
  double v63;
  float v64;
  float v65;
  double v66;
  int v67;
  double v68;
  double v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  double v75;
  int v76;
  double v77;
  BOOL v78;
  int v79;
  double v80;
  int v81;
  double v82;
  int v83;
  float v84;
  float v85;
  float v86;
  double v87;
  int v88;
  double v89;
  double v90;
  double v91;
  int v92;
  double v93;
  int v94;
  double v95;
  int v96;
  double v97;
  int v98;
  float v99;
  float v100;
  float v101;
  double v102;
  int v103;
  double v104;
  double v105;
  double v106;
  int v107;
  double v108;
  int v109;
  double v110;
  int v111;
  double v112;
  int v113;
  int v114;
  double v115;
  uint64_t v116;
  __n128 v117;
  float v118;
  long long v119;
  __n128 v120;
  long long v121;
  long long v122;
  long long v123;
  int v124;
  int v125;
  int v126;
  double v127;
  uint64_t v128;
  int v129;
  id v130;
  float v131;
  int v132;
  int v133;
  float v134;
  __n128 v135;
  unsigned int v136;
  float32x2_t v137;
  double v138;
  float v139;
  __n128 v140;
  __n128 v141;
  __n128 v142;
  long long v143;
  long long v144;
  long long v145;
  long long v146;
  id v147;
  id v148;
  int v149;
  int v150;
  void v151[5];
  int v152;
  void block[4];
  id v154;
  uint64_t v155;
  mach_msg_type_number_t task_info_outCnt;
  char v157[128];
  char v158[28];
  char __str[28];
  integer_t task_info_out[4];
  long long v161;
  long long v162;
  unint64_t v163;
  uint64_t v164;

  v164 = *MEMORY[0x263EF8340];
  v130 = a2;
  uint64_t v3 = [v130 layer];
  uint64_t v4 = [*(id *)(a1 + 16) m_metalLayer];

  if (v3 == v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke;
    block[3] = &unk_264C041C8;
    v155 = a1;
    id v5 = v130;
    v154 = v5;
    if (Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::onceToken != -1) {
      dispatch_once(&Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::onceToken, block);
    }
    if (([*(id *)(a1 + 8) loggingEnabled] & 1) != 0
      || [*(id *)(a1 + 8) enabled])
    {
      Overlay::Update((Overlay *)a1, Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber);
    }
    if (([*(id *)(a1 + 8) enabled] & 1) == 0)
    {
      ++Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;
LABEL_120:

      goto LABEL_121;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 2176));
    if (objc_opt_respondsToSelector())
    {
      {
        Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::prevPresentedTime = CACurrentMediaTime();
      }
      int v6 = *(_DWORD *)(a1 + 32);
      v151[0] = MEMORY[0x263EF8330];
      v151[1] = 3221225472;
      v151[2] = ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke_2;
      v151[3] = &__block_descriptor_44_e23_v16__0___MTLDrawable__8l;
      v151[4] = a1;
      v152 = v6;
      [v5 addPresentedHandler:v151];
    }
    if ((-1857283155 * Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber) <= 0x6EB3E45) {
      isDrawableDetached = IsDrawableDetached(v5);
    }
    v147 = 0;
    float v7 = [v5 texture];
    MTLHud_objc_unwrap(v7);
    v148 = (id)objc_claimAutoreleasedReturnValue();
    v149 = *(_DWORD *)(a1 + 32);
    v150 = Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;

    Renderer::BeginFrame(a1 + 1944, (uint64_t)&v147);
    uint64_t v8 = [*(id *)(a1 + 8) elements];
    LODWORD(v7) = [v8 count];

    float v9 = *(float *)(a1 + 2188);
    uint64_t v10 = [*(id *)(a1 + 8) alignment];
    int v14 = v7 - 1;
    float v15 = (float)((float)((float)((float)v14 * v9) + 12.0) + 100.0) + 12.0;
    if (v10) {
      uint64_t v16 = v10;
    }
    else {
      uint64_t v16 = 12;
    }
    if (v16 == 1)
    {
      [*(id *)(a1 + 8) position];
      double v18 = v17;
      [*(id *)(a1 + 8) position];
      v19.n128_f32[0] = v18;
      v141 = v19;
      v19.n128_f32[0] = v20;
      v142 = v19;
LABEL_29:
      [*(id *)(a1 + 8) setSize:((float)((float)(COERCE_FLOAT(*(void *)(a1 + 2184)) + 24.0) + 20.0), v15];
      v21.i32[1] = v141.n128_i32[1];
      float v22 = v141.n128_f32[0] + COERCE_FLOAT(*(void *)(a1 + 2184));
      v21.f32[0] = v22 + 12.0;
      LODWORD(v23) = 15.0;
      Renderer::DrawRoundedRect((Renderer *)(a1 + 1944), v141.n128_f32[0] + -12.0, v142.n128_f32[0], v21, v15 + v142.n128_f32[0], v23, (*(double *)&opacityOverride * 255.0) << 24);
      v134 = v141.n128_f32[0] + 6.0;
      float v24 = (float)(v22 + -6.0) - (float)(v141.n128_f32[0] + 6.0);
      v132 = *(_DWORD *)(a1 + 928);
      v133 = *(_DWORD *)(a1 + 1436);
      int v25 = (int)v24;
      if ((int)v24 >= 120) {
        int v25 = 120;
      }
      Renderer::BeginMergedDraw(a1 + 1944, 4 * (30 * v14 + 2 * v25 + 18), 6 * (30 * v14 + 2 * v25 + 18));
      id v26 = [v5 layer];
      [v26 contentsScale];
      double v28 = v27;

      if ((1736263375 * Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber) <= 0x572620A)
      {
        task_info_outCnt = 93;
        char v29 = task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt);
        BOOL v30 = (double)v163 * 0.000000953674316;
        if (v29) {
          BOOL v30 = -1.0;
        }
        processMemoryUsedMB = *(void *)&v30;
        uint64_t v31 = [v5 layer];
        id v32 = [v31 device];
        *(double *)&gpuMemoryUsedMB = (double)((unint64_t)[v32 currentAllocatedSize] >> 20);
      }
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      unint64_t v33 = [*(id *)(a1 + 8) elements];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v143 objects:v157 count:16];
      if (v34)
      {
        BOOL v35 = v28;
        int64x2_t v36 = *(void *)v144;
        uint64_t v37 = v24 / 10.0;
        uint64_t v38 = 2.0;
        if (v35 > 1.0) {
          uint64_t v38 = 1.0;
        }
        v131 = v38;
        v138 = v35;
        id v39 = 0.3;
        do
        {
          int v40 = 0;
          do
          {
            if (*(void *)v144 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v41 = *(__CFString **)(*((void *)&v143 + 1) + 8 * v40);
            uint64_t v42 = v142;
            v42.n128_f32[0] = v142.n128_f32[0] + *(float *)(a1 + 2188);
            uint64_t v43 = v141;
            v142 = v42;
            v43.n128_u32[1] = v42.n128_u32[0];
            *(void *)(a1 + 2096) = v43.n128_u64[0];
            if (v41 == @"com.apple.hud-label.gpu-and-resolution")
            {
              float v48 = [v148 width];
              float v49 = [v148 height];
              if (v48 >= 0x3E8) {
                float v50 = 1;
              }
              else {
                float v50 = 2;
              }
              if (v49 < 0x3E8) {
                ++v50;
              }
              uint64_t v51 = snprintf(__str, 0x1CuLL, "%-15.15s%*c[%dx%d]", (const char *)(a1 + 2256), v50, 32, v48, v49);
              uint64_t v53 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v51, -1, v52);
            }
            else if (v41 == @"com.apple.hud-label.compositing-and-refresh-rate")
            {
              double v54 = snprintf(__str, 0x1CuLL, "%2.1fx ", v138);
              Renderer::DrawText((Renderer *)(a1 + 1944), __str, v54, -1, v55);
              uint64_t v56 = "Direct";
              if (!isDrawableDetached) {
                uint64_t v56 = "Composited";
              }
              int v57 = snprintf(__str, 0x1CuLL, "%s ", v56);
              if (isDrawableDetached) {
                double v59 = -1;
              }
              else {
                double v59 = -11969794;
              }
              uint64_t v60 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v57, v59, v58);
              if (Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen
                && (double v61 = (uint64_t (*)(uint64_t, char *))objc_msgSend((id)Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen, "methodForSelector:", sel_maximumFramesPerSecond, v60), v61(Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen, sel_maximumFramesPerSecond)))
              {
                float v62 = snprintf(__str, 0x1CuLL, "%*dHz");
              }
              else
              {
                float v62 = snprintf(__str, 0x1CuLL, "%*c--Hz");
              }
              uint64_t v53 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v62, -1, v63);
            }
            else
            {
              if (v41 == @"com.apple.hud-stat.fps")
              {
                double v64 = 1000.0 / *(float *)(a1 + 1448);
                int v65 = *(float *)(a1 + 1936);
                v139 = *(float *)(a1 + 1932);
                int v66 = v64;
                if (v64 >= 1000.0) {
                  int v66 = 999.99;
                }
                uint64_t v67 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "FPS", v66);
                unsigned int v69 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v67, -1, v68);
                Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -1, v69);
                unsigned int v70 = 1000.0 / v65;
                v71 = v64 * v39;
                BOOL v72 = v37;
                BOOL v73 = v39;
                BOOL v74 = v64 - (float)(v64 * v39);
                uint64_t v75 = v70;
                if (v70 >= 1000.0) {
                  uint64_t v75 = 999.99;
                }
                uint64_t v76 = snprintf(__str, 0x1CuLL, "%6.2f ", v75);
                v78 = v74 <= v70;
                id v39 = v73;
                uint64_t v37 = v72;
                if (v78) {
                  uint64_t v79 = -1;
                }
                else {
                  uint64_t v79 = -11969794;
                }
                Renderer::DrawText((Renderer *)(a1 + 1944), __str, v76, v79, v77);
                v80 = (float)(1000.0 / v139);
                if ((float)(1000.0 / v139) >= 1000.0) {
                  v80 = 999.99;
                }
                float64x2_t v81 = snprintf(__str, 0x1CuLL, "%6.2f", v80);
                if ((float)(v64 + v71) >= (float)(1000.0 / v139)) {
                  int v83 = -1;
                }
                else {
                  int v83 = -11969794;
                }
                int64x2_t v46 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v81, v83, v82);
                uint64_t v47 = -1;
                uint64_t v45 = 1;
                int v44 = "]";
                goto LABEL_105;
              }
              if (v41 == @"com.apple.hud-stat.present-interval")
              {
                unsigned int v84 = *(float *)(a1 + 1448);
                unsigned int v85 = *(float *)(a1 + 1932);
                size_t v86 = *(float *)(a1 + 1936);
                CGContextRef v87 = v84;
                if (v84 >= 1000.0) {
                  CGContextRef v87 = 999.99;
                }
                uint64_t v88 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "Pre", v87);
                uint64_t v90 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v88, -354547, v89);
                Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -354547, v90);
                v91 = v85;
                if (v85 >= 1000.0) {
                  v91 = 999.99;
                }
                int v92 = snprintf(__str, 0x1CuLL, "%6.2f ", v91);
                if ((float)(v84 - (float)(v84 * v39)) <= v85) {
                  uint64_t v94 = -354547;
                }
                else {
                  uint64_t v94 = -11969794;
                }
                Renderer::DrawText((Renderer *)(a1 + 1944), __str, v92, v94, v93);
                uint64_t v95 = v86;
                if (v86 >= 1000.0) {
                  uint64_t v95 = 999.99;
                }
                unsigned int v96 = snprintf(__str, 0x1CuLL, "%6.2f", v95);
                if ((float)(v84 + (float)(v84 * v39)) >= v86) {
                  int v98 = -354547;
                }
                else {
                  int v98 = -11969794;
                }
                int64x2_t v46 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v96, v98, v97);
                uint64_t v45 = 1;
                int v44 = "]";
                uint64_t v47 = -354547;
                goto LABEL_105;
              }
              if (v41 == @"com.apple.hud-stat.gpu-time")
              {
                int v99 = *(float *)(a1 + 940);
                uint64_t v100 = *(float *)(a1 + 1424);
                v101 = *(float *)(a1 + 1428);
                v102 = v99;
                if (v99 >= 1000.0) {
                  v102 = 999.99;
                }
                v103 = snprintf(__str, 0x1CuLL, "%s: %6.2f ", "GPU", v102);
                unsigned int v105 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v103, -12463527, v104);
                Renderer::DrawText((Renderer *)(a1 + 1944), "[", 1, -12463527, v105);
                unsigned int v106 = v100;
                if (v100 >= 1000.0) {
                  unsigned int v106 = 999.99;
                }
                uint64_t v107 = snprintf(__str, 0x1CuLL, "%6.2f ", v106);
                if ((float)(v99 - (float)(v99 * v39)) <= v100) {
                  v109 = -12463527;
                }
                else {
                  v109 = -11969794;
                }
                Renderer::DrawText((Renderer *)(a1 + 1944), __str, v107, v109, v108);
                v110 = v101;
                if (v101 >= 1000.0) {
                  v110 = 999.99;
                }
                v111 = snprintf(__str, 0x1CuLL, "%6.2f", v110);
                if ((float)(v99 + (float)(v99 * v39)) >= v101) {
                  v113 = -12463527;
                }
                else {
                  v113 = -11969794;
                }
                int64x2_t v46 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v111, v113, v112);
                uint64_t v45 = 1;
                int v44 = "]";
                uint64_t v47 = -12463527;
                goto LABEL_105;
              }
              if (v41 == @"com.apple.hud-label.memory")
              {
                if (*(double *)&processMemoryUsedMB >= 1000.0) {
                  v114 = snprintf(v158, 0x1CuLL, "Mem: %6.2fGB", *(double *)&processMemoryUsedMB * 0.0009765625);
                }
                else {
                  v114 = snprintf(v158, 0x1CuLL, "Mem: %6.2fMB", *(double *)&processMemoryUsedMB);
                }
                v124 = v114;
                Renderer::DrawText((Renderer *)(a1 + 1944), v158, v114, -1, v115);
                if (*(double *)&gpuMemoryUsedMB >= 1000.0) {
                  v125 = snprintf(v158, 0x1CuLL, "[%.2fGB]", *(double *)&gpuMemoryUsedMB * 0.0009765625);
                }
                else {
                  v125 = snprintf(v158, 0x1CuLL, "[%.2fMB]", *(double *)&gpuMemoryUsedMB);
                }
                v126 = snprintf(__str, 0x1CuLL, "%*s %s", (26 - v124 - v125) & ~((26 - v124 - v125) >> 31), " ", v158);
                uint64_t v53 = Renderer::DrawText((Renderer *)(a1 + 1944), __str, v126, -12463527, v127);
              }
              else
              {
                if (v41 != @"com.apple.hud-graph.default")
                {
                  int v44 = __str;
                  uint64_t v45 = snprintf(__str, 0x1CuLL, "%s", (const char *)[*(id *)(a1 + 8) UTF8StringForName:]);
                  uint64_t v47 = -1;
LABEL_105:
                  uint64_t v53 = Renderer::DrawText((Renderer *)(a1 + 1944), v44, v45, v47, v46);
                  goto LABEL_106;
                }
                v116 = 0;
                v43.n128_u64[0] = *(void *)(a1 + 2184);
                v117 = v42;
                v117.n128_f32[0] = v42.n128_f32[0] + (float)((float)(100.0 - v43.n128_f32[1]) + 12.0);
                v43.n128_f32[0] = (float)(v141.n128_f32[0] + v43.n128_f32[0]) + -6.0;
                v140 = v43;
                v118 = v141.n128_f32[0] + 6.0;
                do
                {
                  v118 = v37 + v118;
                  *(float *)&v119 = v118;
                  *((float *)&v119 + 1) = v117.n128_f32[0] + -100.0;
                  *((void *)&v119 + 1) = __PAIR64__(v117.n128_u32[0], LODWORD(v118));
                  *(_OWORD *)&task_info_out[v116] = v119;
                  v116 += 4;
                }
                while (v116 != 36);
                *(float *)&v136 = v117.n128_f32[0] + -100.0;
                v142 = v117;
                Renderer::DrawLines(a1 + 1944, (int8x16_t *)task_info_out, 9, -8355712, v131);
                v120 = v140;
                v120.n128_u32[1] = v142.n128_u32[0];
                v135 = v120;
                v137 = (float32x2_t)__PAIR64__(v136, LODWORD(v134));
                Renderer::DrawGraph(a1 + 1944, a1 + 1452, 120, v133, -1275422963, 0.0, 40.0, 3.0, v137, v120);
                Renderer::DrawGraph(a1 + 1944, a1 + 944, 120, v132, -1287531943, 0.0, 40.0, 3.0, v137, v135);
                *(float *)&v121 = v134 + -1.0;
                DWORD1(v121) = v142.n128_u32[0];
                *((float *)&v121 + 2) = v140.n128_f32[0] + 1.0;
                HIDWORD(v121) = v142.n128_u32[0];
                *(float32x2_t *)&v122 = v137;
                *((void *)&v122 + 1) = __PAIR64__(v135.n128_u32[1], v137.u32[0]);
                *(_OWORD *)task_info_out = v121;
                v161 = v122;
                *(void *)&v123 = __PAIR64__(v137.u32[1], v135.n128_u32[0]);
                *((void *)&v123 + 1) = v135.n128_u64[0];
                v162 = v123;
                Renderer::DrawLines(a1 + 1944, (int8x16_t *)task_info_out, 3, -4144960, 2.0);
              }
            }
LABEL_106:
            ++v40;
          }
          while (v40 != v34);
          v128 = [v33 countByEnumeratingWithState:&v143 objects:v157 count:16];
          uint64_t v34 = v128;
        }
        while (v128);
      }

      Renderer::EndMergedDraw((Renderer *)(a1 + 1944));
      Renderer::EndFrame(a1 + 1944, (uint64_t)&v147);
      v129 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a1 + 32) = (v129 + 1) % 3u;
      *(_DWORD *)(a1 + 36) = v129;
      ++Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::frameNumber;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 2176));

      goto LABEL_120;
    }
    LODWORD(v11) = 20.0;
    if ((v16 & 4) == 0
      || (*(float *)&double v11 = (float)(unint64_t)objc_msgSend(v148, "width", v11)
                         - (float)((float)(COERCE_FLOAT(*(void *)(a1 + 2184)) + 24.0) + 20.0),
          (~v16 & 6) != 0))
    {
      v13.n128_f32[0] = fmaxf(*(float *)&v11, 0.0);
    }
    else
    {
      v13.n128_f32[0] = *(float *)&v11 * 0.5;
    }
    LODWORD(v11) = 20.0;
    v141 = v13;
    if ((v16 & 0x10) != 0)
    {
      *(float *)&double v11 = (float)((unint64_t)[v148 height:v11]) - (float)(v15 + 24.0);
      if ((~v16 & 0x18) == 0)
      {
        v12.n128_f32[0] = *(float *)&v11 * 0.5;
        v13.n128_u32[0] = v141.n128_u32[0];
LABEL_28:
        v142 = v12;
        [*(id *)(a1 + 8) setPosition:v13.n128_f32[0] v12.n128_f32[0]];
        goto LABEL_29;
      }
      v13.n128_u32[0] = v141.n128_u32[0];
    }
    v12.n128_u32[1] = 0;
    v12.n128_f32[0] = fmaxf(*(float *)&v11, 0.0);
    goto LABEL_28;
  }
LABEL_121:
}

void sub_234BDD580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *a61)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke(uint64_t a1)
{
  kern_return_t v3;
  double v4;
  void *v5;
  void *v6;
  Class v7;
  void (*v8)(uint64_t, char *);
  uint64_t v9;
  void *v10;
  uint64_t result;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[36];
  unint64_t v14;

  uint64_t v2 = *(void *)(a1 + 40);
  isDrawableDetached = IsDrawableDetached(*(void **)(a1 + 32));
  task_info_outCnt = 93;
  uint64_t v3 = task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt);
  uint64_t v4 = (double)v14 * 0.000000953674316;
  if (v3) {
    uint64_t v4 = -1.0;
  }
  processMemoryUsedMB = *(void *)&v4;
  id v5 = [*(id *)(a1 + 32) layer];
  int v6 = [v5 device];
  *(double *)&gpuMemoryUsedMB = (double)((unint64_t)[v6 currentAllocatedSize] >> 20);

  float v7 = NSClassFromString(&cfstr_Uiscreen.isa);
  Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_uiscreenClass = (uint64_t)v7;
  if (v7)
  {
    uint64_t v8 = (void (*)(uint64_t, char *))[(objc_class *)v7 methodForSelector:sel_mainScreen];
    float v9 = v8(Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_uiscreenClass, sel_mainScreen);
    uint64_t v10 = (void *)Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen;
    Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::_mainScreen = v9;
  }
  uint64_t result = MTLHudIsProcessTranslated();
  if (result)
  {
    uint64_t result = [*(id *)(v2 + 8) addLabel:@"com.apple.hud-label.rosetta" after:@"com.apple.hud-label.memory"];
    if ((result & 1) == 0) {
      return [*(id *)(v2 + 8) updateLabel:@"com.apple.hud-label.rosetta" value:@"Rosetta x86_64          ---"];
    }
  }
  return result;
}

void sub_234BDD7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Overlay::Update(Overlay *this, unsigned int a2)
{
  {
    Overlay::Update(int)::prevTime = mach_absolute_time();
  }
  uint64_t v4 = mach_absolute_time();
  uint64_t v5 = v4;
  if (!a2)
  {
    Overlay::Update(int)::prevTime = v4;
    return;
  }
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = Overlay::Update(int)::prevTime;
  uint64_t v9 = *((unsigned int *)this + 6);
  unint64_t v8 = *((unsigned int *)this + 7);
  Overlay::Update(int)::prevTime = v5;
  if (a2 >= 3)
  {
    float v10 = (double)((v6 - v7) * v9 / v8) * 0.000001;
    double v11 = (CHistoryRecord *)((char *)this + 416);
    float v12 = 0.0;
    BOOL v13 = v10 > 999.99 || v10 < 0.0;
    if (!v13) {
      float v12 = v10;
    }
    uint64_t v14 = a2 % 0x78;
    *((_DWORD *)this + 105) = v14;
    *((_DWORD *)this + 106) = v14;
    float v15 = &v11->m_currentTime + v14;
    float v16 = *((float *)this + 107) + (float)(v12 - v15[5]);
    *((float *)this + 107) = v16;
    v15[5] = v12;
    *((float *)this + 108) = v16 / 120.0;
    CHistoryRecord::UpdateMinMax(v11);
    v57[0] = 0;
    v57[1] = 0;
    uint64_t v56 = (uint64_t *)v57;
    double v17 = (std::mutex *)((char *)this + 64 * (unint64_t)*((unsigned int *)this + 8) + 216);
    std::mutex::lock(v17);
    unsigned int v18 = *((_DWORD *)this + 8);
    __n128 v19 = (char *)this + 56 * v18;
    long long v20 = *((_OWORD *)v19 + 4);
    long long v54 = *((_OWORD *)v19 + 3);
    long long v55 = v20;
    if (&v54 != (long long *)(v19 + 48))
    {
      std::__tree<std::pair<double,double>>::__assign_multi<std::__tree_const_iterator<std::pair<double,double>,std::__tree_node<std::pair<double,double>,void *> *,long>>(&v56, *((void **)this + 7 * v18 + 10), (void *)this + 7 * v18 + 11);
      unsigned int v18 = *((_DWORD *)this + 8);
    }
    float32x2_t v21 = (void *)((char *)this + 56 * v18);
    float v22 = (void *)v21[11];
    v21 += 11;
    std::__tree<std::pair<double,double>>::destroy((uint64_t)(v21 - 1), v22);
    *(v21 - 1) = v21;
    *float32x2_t v21 = 0;
    v21[1] = 0;
    std::mutex::unlock(v17);
    double v23 = v56;
    if (v56 == (uint64_t *)v57)
    {
      double v33 = 0.0;
    }
    else
    {
      double v24 = 0.0;
      double v25 = 0.0;
      do
      {
        double v26 = *((double *)v23 + 4);
        double v27 = *((double *)v23 + 5);
        if (v26 < v25) {
          double v26 = v25;
        }
        double v28 = v27 - v26;
        BOOL v13 = v26 < v27;
        double v29 = -0.0;
        if (v13) {
          double v29 = v28;
        }
        if (v27 >= v25) {
          double v25 = *((double *)v23 + 5);
        }
        BOOL v30 = (uint64_t *)v23[1];
        if (v30)
        {
          do
          {
            uint64_t v31 = v30;
            BOOL v30 = (uint64_t *)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            uint64_t v31 = (uint64_t *)v23[2];
            BOOL v32 = *v31 == (void)v23;
            double v23 = v31;
          }
          while (!v32);
        }
        double v24 = v24 + v29;
        double v23 = v31;
      }
      while (v31 != (uint64_t *)v57);
      double v33 = v24 * 1000.0;
    }
    uint64_t v34 = (CHistoryRecord *)((char *)this + 924);
    float v35 = v33;
    if (v35 > 999.99 || v35 < 0.0) {
      float v35 = 0.0;
    }
    *((_DWORD *)this + 232) = v14;
    *((_DWORD *)this + 233) = v14;
    uint64_t v37 = &v34->m_currentTime + v14;
    float v38 = *((float *)this + 234) + (float)(v35 - v37[5]);
    *((float *)this + 234) = v38;
    v37[5] = v35;
    *((float *)this + 235) = v38 / 120.0;
    CHistoryRecord::UpdateMinMax(v34);
    if (*((double *)&v54 + 1) < 0.0 || *((double *)&v55 + 1) <= 0.0)
    {
      int v44 = (float *)((char *)this + 4 * v14);
      *((_DWORD *)this + 359) = v14;
      *((_DWORD *)this + 360) = v14;
      float v43 = *((float *)this + 361) + (float)(0.0 - v44[363]);
      *((float *)this + 361) = v43;
      v44[363] = 0.0;
    }
    else
    {
      float v39 = *((double *)&v55 + 1) * 1000.0;
      float v40 = 0.0;
      if (v39 <= 999.99 && v39 >= 0.0) {
        float v40 = *((double *)&v55 + 1) * 1000.0;
      }
      uint64_t v42 = (float *)((char *)this + 4 * v14);
      *((_DWORD *)this + 359) = v14;
      *((_DWORD *)this + 360) = v14;
      float v43 = *((float *)this + 361) + (float)(v40 - v42[363]);
      *((float *)this + 361) = v43;
      v42[363] = v40;
    }
    *((float *)this + 362) = v43 / 120.0;
    CHistoryRecord::UpdateMinMax((CHistoryRecord *)((char *)this + 1432));
    if (![*((id *)this + 1) loggingEnabled]) {
      goto LABEL_52;
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = ___ZN7Overlay6UpdateEi_block_invoke;
    v52[3] = &__block_descriptor_44_e5_v8__0l;
    size_t v45 = &Overlay::Update(int)::logBuffer - Overlay::Update(int)::logBufferPos + 986;
    v52[4] = this;
    unsigned int v53 = a2;
    int64x2_t v46 = (void (**)(void, float))MEMORY[0x237DCEB20](v52);
    int v47 = snprintf(Overlay::Update(int)::logBufferPos, v45, ",%.2f,%.2f", *((double *)&v55 + 1) * 1000.0, v33);
    if (v47 >= 1 && v45 > v47)
    {
      Overlay::Update(int)::logBufferPos += v47;
      if (*(float *)&Overlay::Update(int)::logTime > 1000.0) {
        v46[2](v46, *(float *)&Overlay::Update(int)::logTime);
      }
      goto LABEL_51;
    }
    if (Overlay::Update(int)::logBufferPos >= byte_2687E847A)
    {
      float v50 = "logBufferPos < logBuffer + maxLogBufferLength";
      int v51 = 834;
    }
    else
    {
      *Overlay::Update(int)::logBufferPos = 0;
      ((void (*)(void (**)(void, float)))v46[2])(v46);
      size_t v48 = &Overlay::Update(int)::logBuffer - Overlay::Update(int)::logBufferPos + 986;
      int v49 = snprintf(Overlay::Update(int)::logBufferPos, v48, ",%.2f,%.2f", *((double *)&v55 + 1) * 1000.0, v33);
      float v50 = "nCharsWritten > 0 && nCharsWritten < nSpaceRemaining";
      int v51 = 839;
      if (v49 >= 1 && v48 > v49)
      {
        Overlay::Update(int)::logBufferPos += v49;
LABEL_51:
        *(float *)&Overlay::Update(int)::logTime = *(float *)&Overlay::Update(int)::logTime + v10;

LABEL_52:
        std::__tree<std::pair<double,double>>::destroy((uint64_t)&v56, v57[0]);
        return;
      }
    }
    __assert_rtn("Update", "Overlay.mm", v51, v50);
  }
}

void sub_234BDDCD0(_Unwind_Exception *a1)
{
}

void ___ZN7Overlay9onPresentEPU26objcproto15CAMetalDrawable11objc_object_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  [v3 presentedTime];
  CFTimeInterval v6 = v5;
  if (v5 <= 0.0) {
    CFTimeInterval v6 = CACurrentMediaTime();
  }
  uint64_t v7 = (std::mutex *)(v4 + ((unint64_t)*(unsigned int *)(a1 + 40) << 6) + 216);
  std::mutex::lock(v7);
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  uint64_t v9 = (double *)(v4 + 56 * v8);
  v9[7] = v6;
  v9 += 7;
  CFTimeInterval v10 = CACurrentMediaTime();
  uint64_t v11 = v4 + 56 * v8;
  *(CFTimeInterval *)(v11 + 64) = v10;
  double v12 = *v9;
  *(double *)(v11 + 72) = fmax(*v9- *(double *)&Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::prevPresentedTime, 0.0);
  if (v12 > 0.0) {
    Overlay::onPresent(objc_object  {objcproto15CAMetalDrawable}*)::prevPresentedTime = *(void *)&v12;
  }
  std::mutex::unlock(v7);
}

void sub_234BDDDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::mutex::unlock(v10);

  _Unwind_Resume(a1);
}

uint64_t Renderer::BeginMergedDraw(uint64_t this, int a2, int a3)
{
  unsigned int v4 = *(_DWORD *)(this + 8);
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v6 = this;
    this = Renderer::getDynamicVertexIndexBuffers(this, v4, a2, a3, (uint64_t *)(this + 112), (void *)(this + 120), (_DWORD *)(this + 144), (_DWORD *)(this + 148));
    *(_DWORD *)(v6 + 128) = a2;
    *(_DWORD *)(v6 + 132) = a3;
    *(void *)(v6 + 136) = 0;
  }
  return this;
}

void Renderer::EndMergedDraw(Renderer *this)
{
  int v3 = *((_DWORD *)this + 36);
  int v2 = *((_DWORD *)this + 37);
  int v4 = *((_DWORD *)this + 35);
  id v5 = **((id **)this + 2);
  unint64_t v6 = *((void *)this + 22);
  unint64_t v7 = *((void *)this + 21);
  if (v7 >= v6)
  {
    uint64_t v9 = *((void *)this + 20);
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v9) >> 3);
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<Renderer::SDrawCommand>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v9) >> 3);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v12;
    }
    double v29 = (char *)this + 176;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Renderer::SDrawCommand>>((uint64_t)this + 176, v13);
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    double v17 = &v14[24 * v10];
    *(_DWORD *)double v17 = v3;
    *((_DWORD *)v17 + 1) = v2;
    *((_DWORD *)v17 + 2) = v4;
    *((void *)v17 + 2) = v5;
    uint64_t v19 = *((void *)this + 20);
    unint64_t v18 = *((void *)this + 21);
    if (v18 == v19)
    {
      int64x2_t v24 = vdupq_n_s64(v18);
      long long v20 = v17;
    }
    else
    {
      long long v20 = v17;
      do
      {
        uint64_t v21 = *(void *)(v18 - 24);
        v18 -= 24;
        int v22 = *(_DWORD *)(v18 + 8);
        *((void *)v20 - 3) = v21;
        v20 -= 24;
        *((_DWORD *)v20 + 2) = v22;
        uint64_t v23 = *(void *)(v18 + 16);
        *(void *)(v18 + 16) = 0;
        *((void *)v20 + 2) = v23;
      }
      while (v18 != v19);
      int64x2_t v24 = *((int64x2_t *)this + 10);
    }
    unsigned int v8 = v17 + 24;
    *((void *)this + 20) = v20;
    *((void *)this + 21) = v17 + 24;
    int64x2_t v27 = v24;
    uint64_t v25 = *((void *)this + 22);
    *((void *)this + 22) = &v14[24 * v16];
    uint64_t v28 = v25;
    uint64_t v26 = v24.i64[0];
    std::__split_buffer<Renderer::SDrawCommand>::~__split_buffer((uint64_t)&v26);
  }
  else
  {
    *(_DWORD *)unint64_t v7 = v3;
    *(_DWORD *)(v7 + 4) = v2;
    *(_DWORD *)(v7 + 8) = v4;
    *(void *)(v7 + 16) = v5;
    unsigned int v8 = (char *)(v7 + 24);
  }
  *((void *)this + 21) = v8;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((void *)this + 18) = 0;
}

void sub_234BDE020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Overlay::onCommandBufferCommit(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned int *)(a1 + 32);
  id v5 = *(id *)(a1 + 408);
  objc_sync_enter(v5);
  unint64_t v6 = [NSNumber numberWithInteger:[v3 hash]];
  [*(id *)(a1 + 408) objectForKey:v6];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("onCommandBufferCommit", "Overlay.mm", 705, "![m_commandBufferFrameIds objectForKey:key]");
  }
  unint64_t v7 = *(void **)(a1 + 408);
  unsigned int v8 = [NSNumber numberWithInt:v4];
  [v7 setObject:v8 forKey:v6];

  objc_sync_exit(v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZN7Overlay21onCommandBufferCommitEPU27objcproto16MTLCommandBuffer11objc_object_block_invoke;
  v9[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v9[4] = a1;
  [v3 addCompletedHandler:v9];
}

void sub_234BDE180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN7Overlay21onCommandBufferCommitEPU27objcproto16MTLCommandBuffer11objc_object_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(v4 + 408);
  objc_sync_enter(v5);
  unint64_t v6 = [NSNumber numberWithInteger:[v3 hash]];
  unint64_t v7 = [*(id *)(v4 + 408) objectForKey:v6];
  unsigned int v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 intValue];
    [*(id *)(v4 + 408) removeObjectForKey:v6];
  }
  else
  {
    unsigned int v9 = -1;
  }

  objc_sync_exit(v5);
  if (v9 > 2) {
    __assert_rtn("onCommandBufferCommit_block_invoke", "Overlay.mm", 731, "false");
  }
  std::mutex::lock((std::mutex *)(v4 + ((unint64_t)v9 << 6) + 216));
  [v3 GPUStartTime];
  uint64_t v11 = v10;
  [v3 GPUEndTime];
  *(void *)&long long v13 = v11;
  *((void *)&v13 + 1) = v12;
  std::__tree<std::pair<double,double>>::__emplace_unique_key_args<std::pair<double,double>,std::pair<double,double>>((uint64_t **)(v4 + 56 * v9 + 80), (double *)&v13, &v13);
  std::mutex::unlock((std::mutex *)(v4 + ((unint64_t)v9 << 6) + 216));
}

void sub_234BDE310(_Unwind_Exception *a1)
{
  std::mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void ___ZN7Overlay6UpdateEi_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  NSLog(&cfstr_MetalHudD2f2fS.isa, Overlay::Update(int)::frameNumberPrev, gpuMemoryUsedMB, processMemoryUsedMB, &Overlay::Update(int)::logBuffer);
  Overlay::Update(int)::logTime = 0;
  *(_DWORD *)(v2 + 40) = 0;
  Overlay::Update(int)::frameNumberPrev = *(_DWORD *)(a1 + 40) + 1;
  Overlay::Update(int)::logBufferPos = &Overlay::Update(int)::logBuffer;
}

void sub_234BDE4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234BDE528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)_LayerHUDPropertiesListener;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_234BDE8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::__unordered_map_hasher<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,Renderer::piplelinesDescriptorHasher,std::equal_to<Renderer::SPiplelinesDescriptor>,true>,std::__unordered_map_equal<Renderer::SPiplelinesDescriptor,std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>,std::equal_to<Renderer::SPiplelinesDescriptor>,Renderer::piplelinesDescriptorHasher,true>,std::allocator<std::__hash_value_type<Renderer::SPiplelinesDescriptor,Renderer::SPiplelines>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__tree<std::pair<double,double>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::pair<double,double>>::destroy(a1, *a2);
    std::__tree<std::pair<double,double>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void std::vector<Renderer::SDrawCommand>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (id *)**a1;
  if (v2)
  {
    uint64_t v4 = (id *)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = v4 - 3;

        uint64_t v4 = v6;
      }
      while (v6 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t **std::__tree<std::pair<double,double>>::__assign_multi<std::__tree_const_iterator<std::pair<double,double>,std::__tree_node<std::pair<double,double>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  id v5 = result;
  if (result[2])
  {
    unint64_t v6 = *result;
    unint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      unsigned int v8 = (uint64_t *)v6[1];
    }
    else {
      unsigned int v8 = v6;
    }
    uint64_t v15 = result;
    uint64_t v16 = v8;
    double v17 = v8;
    if (v8)
    {
      uint64_t v16 = std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        unsigned int v9 = a2;
        do
        {
          *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
          leaf_high = (uint64_t **)std::__tree<std::pair<double,double>>::__find_leaf_high((uint64_t)v5, &v18, (double *)v8 + 4);
          std::__tree<std::pair<double,double>>::__insert_node_at(v5, v18, leaf_high, v8);
          double v17 = v16;
          if (v16) {
            uint64_t v16 = std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next((uint64_t)v16);
          }
          uint64_t v11 = (void *)v9[1];
          if (v11)
          {
            do
            {
              a2 = v11;
              uint64_t v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v12 = *a2 == (void)v9;
              unsigned int v9 = a2;
            }
            while (!v12);
          }
          unsigned int v8 = v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          unsigned int v9 = a2;
        }
        while (!v12);
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::pair<double,double>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)std::__tree<std::pair<double,double>>::__emplace_multi<std::pair<double,double> const&>(v5, (_OWORD *)a2 + 2);
      long long v13 = (void *)a2[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = v13;
          long long v13 = (void *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          uint64_t v14 = (void *)a2[2];
          BOOL v12 = *v14 == (void)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_234BDEC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__tree<std::pair<double,double>>::__find_leaf_high(uint64_t a1, void *a2, double *a3)
{
  id v5 = *(uint64_t **)(a1 + 8);
  id v3 = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    double v6 = *a3;
    do
    {
      while (1)
      {
        id v3 = v4;
        double v7 = *((double *)v4 + 4);
        if (v6 >= v7 && (v7 < v6 || a3[1] >= *((double *)v4 + 5))) {
          break;
        }
        uint64_t v4 = (uint64_t *)*v4;
        unsigned int v8 = v3;
        if (!*v3) {
          goto LABEL_11;
        }
      }
      uint64_t v4 = (uint64_t *)v4[1];
    }
    while (v4);
    unsigned int v8 = v3 + 1;
  }
  else
  {
    unsigned int v8 = v3;
  }
LABEL_11:
  *a2 = v3;
  return v8;
}

uint64_t *std::__tree<std::pair<double,double>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      id v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              _OWORD v10[2] = (uint64_t)v2;
              id v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            id v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *id v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            id v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          id v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__tree<std::pair<double,double>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    id v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; id v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          id v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::pair<double,double>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::pair<double,double>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    id v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        id v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::pair<double,double>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

void *std::__tree<std::pair<double,double>>::__emplace_multi<std::pair<double,double> const&>(uint64_t **a1, _OWORD *a2)
{
  uint64_t v4 = operator new(0x30uLL);
  *((_OWORD *)v4 + 2) = *a2;
  leaf_high = (uint64_t **)std::__tree<std::pair<double,double>>::__find_leaf_high((uint64_t)a1, &v7, (double *)v4 + 4);
  std::__tree<std::pair<double,double>>::__insert_node_at(a1, v7, leaf_high, (uint64_t *)v4);
  return v4;
}

void sub_234BDEFC0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::pair<double,double>>::__emplace_unique_key_args<std::pair<double,double>,std::pair<double,double>>(uint64_t **a1, double *a2, _OWORD *a3)
{
  id v5 = (void **)std::__tree<std::pair<double,double>>::__find_equal<std::pair<double,double>>((uint64_t)a1, &v9, a2);
  int v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    int v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<std::pair<double,double>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

void *std::__tree<std::pair<double,double>>::__find_equal<std::pair<double,double>>(uint64_t a1, void *a2, double *a3)
{
  id v5 = *(uint64_t **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    double v6 = *a3;
    double v7 = a3[1];
    while (1)
    {
      while (1)
      {
        int v8 = v4;
        double v9 = *((double *)v4 + 4);
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        uint64_t v4 = (uint64_t *)*v4;
        uint64_t result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }
      if (v9 >= v6)
      {
        double v10 = *((double *)v4 + 5);
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }
      uint64_t result = v4 + 1;
      uint64_t v4 = (uint64_t *)v4[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }
  int v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

void esfm_PrepareCGContext()
{
  __assert_rtn("esfm_PrepareCGContext", "easysystemfont_metal.h", 351, "canvas->bpp==1");
}

void esfm_BakeFontIntoBitmapGrayscale_cold_1()
{
}

void esfm_BakeFontIntoBitmapGrayscale_cold_2()
{
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_1()
{
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_2()
{
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_3()
{
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_4()
{
}

void esfm_BakeFontIntoBitmapGrayscaleSDF_cold_5()
{
  __assert_rtn("esfm_BakeFontIntoBitmapGrayscaleSDF", "easysystemfont_metal.h", 674, "lowResWidth <= hiResCanvas.width/sSDFScaleFactor && lowResHeight <= hiResCanvas.height/sSDFScaleFactor");
}

void Renderer::DrawText()
{
}

void Renderer::DrawGraph()
{
  __assert_rtn("DrawGraph", "Renderer.mm", 427, "v1_index >= 0 && v1_index < numPoints");
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetRenderingIntent(CGContextRef c, CGColorRenderingIntent intent)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B48](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B70](name, size);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x270EE9BE0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x270EE9BE8](font);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x270EE9BF8](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x270EE9C10](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x270EE9C38](font);
  return result;
}

uint64_t IOSurfaceGetDetachModeCode()
{
  return MEMORY[0x270EF4D08]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__float2 __sincospif_stret(float a1)
{
  MEMORY[0x270ED7E98](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x270F9A4A8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x270F9A4C0](block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}