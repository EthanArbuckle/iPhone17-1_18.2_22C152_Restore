@interface PVEffectFrame
+ (id)frameWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)forcePosterFrame;
- (CGPath)expandedHitAreaPath;
- (CGPath)hitAreaPath;
- (CGPoint)center;
- (CGPoint)midpoint;
- (CGRect)objectBounds;
- (CGRect)outputROI;
- (CGRect)viewSpaceObjectBounds;
- (CGSize)effectSize;
- (CGSize)viewSize;
- (NSArray)hitAreaPoints;
- (NSArray)textFrames;
- (PVCGPointQuad)cornerPoints;
- (PVEffectFrame)initWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (__n128)setTransform:(long long *)a3;
- (__n128)setTransformInfo:(long long *)a3;
- (__n128)transform;
- (__n128)transformInfo;
- (double)hitSizeThreshold;
- (double)minimumHitSize;
- (id)description;
- (int)effectOrigin;
- (int)viewOrigin;
- (void)dealloc;
- (void)setCenter:(CGPoint)a3;
- (void)setCornerPoints:(PVCGPointQuad *)a3;
- (void)setEffectOrigin:(int)a3;
- (void)setEffectSize:(CGSize)a3;
- (void)setExpandedHitAreaPath:(CGPath *)a3;
- (void)setForcePosterFrame:(BOOL)a3;
- (void)setHitAreaPath:(CGPath *)a3;
- (void)setHitAreaPoints:(id)a3;
- (void)setHitSizeThreshold:(double)a3;
- (void)setMinimumHitSize:(double)a3;
- (void)setObjectBounds:(CGRect)a3;
- (void)setOutputROI:(CGRect)a3;
- (void)setTextFrames:(id)a3;
- (void)setTime:(id *)a3;
- (void)setViewOrigin:(int)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation PVEffectFrame

- (void)dealloc
{
  CGPathRelease(self->_hitAreaPath);
  CGPathRelease(self->_expandedHitAreaPath);
  v3.receiver = self;
  v3.super_class = (Class)PVEffectFrame;
  [(PVEffectFrame *)&v3 dealloc];
}

+ (id)frameWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11 = *(void *)&a11;
  double height = a10.height;
  double width = a10.width;
  BOOL v16 = a7;
  BOOL v17 = a6;
  BOOL v18 = a5;
  id v21 = a3;
  id v22 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = *a4;
  v23 = objc_msgSend(v22, "initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:", v21, &v25, v18, v17, v16, v11, a8, a9, width, height);

  return v23;
}

- (PVEffectFrame)initWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11 = *(void *)&a11;
  double width = a10.width;
  double height = a10.height;
  BOOL v14 = a7;
  BOOL v15 = a6;
  BOOL v16 = a5;
  id v19 = a3;
  v90.receiver = self;
  v90.super_class = (Class)PVEffectFrame;
  v20 = [(PVEffectFrame *)&v90 init];
  id v21 = v20;
  if (v20)
  {
    long long v22 = *(_OWORD *)&a4->var0;
    *((void *)v20 + 17) = a4->var3;
    *(_OWORD *)(v20 + 120) = v22;
    v20[8] = v16;
    *((_DWORD *)v20 + 3) = [v19 origin];
    [v19 outputSize];
    *((void *)v21 + 9) = v23;
    *((void *)v21 + 10) = v24;
    *((_DWORD *)v21 + 4) = v11;
    double v25 = height;
    *((double *)v21 + 11) = width;
    *((double *)v21 + 12) = height;
    if (v19)
    {
      long long v79 = *(_OWORD *)&a4->var0;
      *(void *)&long long v80 = a4->var3;
      [v19 cornersAtTime:&v79 forcePosterFrame:v16 includeDropShadow:v15 scale:v11 viewSize:1.0 viewOrigin:1.0];
      double v25 = height;
    }
    else
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
    }
    long long v26 = v94;
    *((_OWORD *)v21 + 13) = v93;
    *((_OWORD *)v21 + 14) = v26;
    long long v27 = v96;
    *((_OWORD *)v21 + 15) = v95;
    *((_OWORD *)v21 + 16) = v27;
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    long long v89 = 0u;
    long long v93 = *(_OWORD *)&a4->var0;
    *(void *)&long long v94 = a4->var3;
    objc_msgSend(v19, "convertPointToView:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v87, &v93, v16, 1, 1, v11, width, v25);
    *((void *)v21 + 13) = v28;
    *((void *)v21 + 14) = v29;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v93 = *(_OWORD *)&a4->var0;
    *(void *)&long long v94 = a4->var3;
    v30 = objc_msgSend(v19, "transformAtTime:forcePosterFrame:viewSize:viewOrigin:", &v93, v16, v11, width, height);
    v31 = v30;
    if (v30)
    {
      [v30 SIMDDouble4x4];
    }
    else
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
    }

    v32 = +[PVHostApplicationDelegateHandler sharedInstance];
    char v33 = [v32 wantsToIncludeCoordinateSystemTranslationInEffectViewTransform];
    if (v11 == 1 && (v33 & 1) == 0)
    {
      v34.f64[0] = width;
      v34.f64[1] = height;
      __asm { FMOV            V1.2D, #0.5 }
      long long v97 = v83;
      *(_OWORD *)&STACK[0x520] = v84;
      long long v40 = v86;
      *(_OWORD *)&STACK[0x530] = v85;
      *(_OWORD *)&STACK[0x540] = v40;
      long long v93 = v79;
      long long v94 = v80;
      long long v95 = v81;
      long long v96 = v82;
      float64x2_t v91 = vmulq_f64(v34, _Q1);
      long long v92 = 0u;
      pv_simd_matrix_translate(&v93, &v91, &v71);
      long long v83 = v75;
      long long v84 = v76;
      long long v85 = v77;
      long long v86 = v78;
      long long v79 = v71;
      long long v80 = v72;
      long long v81 = v73;
      long long v82 = v74;
    }
    long long v41 = v83;
    long long v42 = v84;
    *((_OWORD *)v21 + 21) = v83;
    *((_OWORD *)v21 + 22) = v42;
    long long v43 = v85;
    long long v44 = v86;
    *((_OWORD *)v21 + 23) = v85;
    *((_OWORD *)v21 + 24) = v44;
    long long v45 = v79;
    long long v46 = v80;
    *((_OWORD *)v21 + 17) = v79;
    *((_OWORD *)v21 + 18) = v46;
    long long v47 = v81;
    long long v48 = v82;
    *((_OWORD *)v21 + 19) = v81;
    *((_OWORD *)v21 + 20) = v48;
    v49.f64[0] = width;
    v49.f64[1] = height;
    long long v97 = v41;
    *(_OWORD *)&STACK[0x520] = v42;
    *(_OWORD *)&STACK[0x530] = v43;
    *(_OWORD *)&STACK[0x540] = v44;
    long long v93 = v45;
    long long v94 = v46;
    long long v95 = v47;
    long long v96 = v48;
    objc_msgSend(v19, "outputROI", pv_transform_info_make((uint64_t)&v93, (float64x2_t *)v21 + 25, v49));
    *((void *)v21 + 18) = v50;
    *((void *)v21 + 19) = v51;
    *((void *)v21 + 20) = v52;
    *((void *)v21 + 21) = v53;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v71 = *(_OWORD *)&a4->var0;
    *(void *)&long long v72 = a4->var3;
    if ([v19 bounds:&v93 atTime:&v71 forcePosterFrame:v16 includeDropShadow:v15 includeMasks:1])
    {
      long long v54 = v94;
      *((_OWORD *)v21 + 11) = v93;
      *((_OWORD *)v21 + 12) = v54;
    }
    *((double *)v21 + 6) = a8;
    *((double *)v21 + 7) = a9;
    long long v71 = *(_OWORD *)&a4->var0;
    *(void *)&long long v72 = a4->var3;
    uint64_t v55 = objc_msgSend(v19, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v71, v16, v15, v11, 1.0, 1.0, width, height);
    v56 = (void *)*((void *)v21 + 3);
    *((void *)v21 + 3) = v55;

    long long v71 = *(_OWORD *)&a4->var0;
    *(void *)&long long v72 = a4->var3;
    *((void *)v21 + 4) = objc_msgSend(v19, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v71, v16, 1, v11, v21 + 40, 1.0, 1.0, a8, a9, width, height);
    if (v14)
    {
      long long v71 = *(_OWORD *)&a4->var0;
      *(void *)&long long v72 = a4->var3;
      v57 = objc_msgSend(v19, "textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:", &v71, v16, v11, width, height);
      long long v71 = *(_OWORD *)&a4->var0;
      *(void *)&long long v72 = a4->var3;
      v58 = [v19 textEditingBoundsAtTime:&v71 forcePosterFrame:v16 useParagraphBounds:1 includeDropShadow:0 includeMasks:1];
      v59 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v57, "count"));
      var18[0] = MEMORY[0x1E4F143A8];
      var18[1] = *(void *)"";
      var18[2] = __144__PVEffectFrame_initWithEffect_atTime_forcePosterFrame_includeDropShadow_includeTextFrames_minimumHitSize_hitSizeThreshold_viewSize_viewOrigin___block_invoke;
      var18[3] = &unk_1E6169650;
      id vars8 = v19;
      id v69 = v32;
      id v70 = v59;
      id v60 = v58;
      id v61 = v57;
      [v61 enumerateObjectsUsingBlock:var18];
      v62 = (void *)*((void *)v21 + 8);
      *((void *)v21 + 8) = v70;
      id v63 = v70;
    }
  }

  return (PVEffectFrame *)v21;
}

void __144__PVEffectFrame_initWithEffect_atTime_forcePosterFrame_includeDropShadow_includeTextFrames_minimumHitSize_hitSizeThreshold_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, long long a16, long long a17, long long a18, long long a19, long long a20,long long a21,long long a22,long long a23,long long a24,long long a25,long long a26,long long a27,long long a28,long long a29,long long a30,long long a31,long long a32,long long a33,long long a34,long long a35,long long a36,long long a37,long long a38,long long a39,long long a40)
{
  long long v42 = [PVEffectFrame alloc];
  uint64_t v43 = *(void *)(a1 + 32);
  uint64_t v44 = *(unsigned __int8 *)(a1 + 132);
  uint64_t v45 = *(unsigned __int8 *)(a1 + 133);
  double v46 = *(double *)(a1 + 72);
  double v47 = *(double *)(a1 + 80);
  uint64_t v48 = *(unsigned int *)(a1 + 128);
  *(_OWORD *)&STACK[0x640] = *(_OWORD *)(a1 + 104);
  STACK[0x650] = *(void *)(a1 + 120);
  float64x2_t v49 = -[PVEffectFrame initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:](v42, "initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:", v43, &STACK[0x640], v44, v45, 0, v48, v46, v47, *(double *)(a1 + 88), *(double *)(a1 + 96));
  *(_OWORD *)&STACK[0x600] = 0u;
  *(_OWORD *)&STACK[0x610] = 0u;
  *(_OWORD *)&STACK[0x5E0] = 0u;
  *(_OWORD *)&STACK[0x5F0] = 0u;
  uint64_t v50 = *(void **)(a1 + 32);
  if (v50)
  {
    uint64_t v51 = *(unsigned __int8 *)(a1 + 133);
    uint64_t v52 = *(unsigned __int8 *)(a1 + 132);
    uint64_t v53 = *(unsigned int *)(a1 + 128);
    *(_OWORD *)&STACK[0x640] = *(_OWORD *)(a1 + 104);
    STACK[0x650] = *(void *)(a1 + 120);
    objc_msgSend(v50, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &STACK[0x640], a3, v52, v51, v53, 1.0, 1.0, *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  if (*(_DWORD *)(a1 + 128) == 1)
  {
    long long v54 = *(_OWORD *)&STACK[0x600];
    long long v56 = *(_OWORD *)&STACK[0x5E0];
    long long v55 = *(_OWORD *)&STACK[0x5F0];
    *(_OWORD *)&STACK[0x5E0] = *(_OWORD *)&STACK[0x610];
    *(_OWORD *)&STACK[0x5F0] = v54;
    *(_OWORD *)&STACK[0x600] = v55;
    *(_OWORD *)&STACK[0x610] = v56;
  }
  long long v57 = *(_OWORD *)&STACK[0x5F0];
  *(_OWORD *)&STACK[0x5A0] = *(_OWORD *)&STACK[0x5E0];
  *(_OWORD *)&STACK[0x5B0] = v57;
  long long v58 = *(_OWORD *)&STACK[0x610];
  *(_OWORD *)&STACK[0x5C0] = *(_OWORD *)&STACK[0x600];
  *(_OWORD *)&STACK[0x5D0] = v58;
  [(PVEffectFrame *)v49 setCornerPoints:&STACK[0x5A0]];
  a39 = 0u;
  a40 = 0u;
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  a33 = 0u;
  a34 = 0u;
  v59 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  id v60 = v59;
  if (v59)
  {
    [v59 SIMDDouble4x4];
  }
  else
  {
    a39 = 0u;
    a40 = 0u;
    a37 = 0u;
    a38 = 0u;
    a35 = 0u;
    a36 = 0u;
    a33 = 0u;
    a34 = 0u;
  }

  if (([*(id *)(a1 + 48) wantsToIncludeCoordinateSystemTranslationInEffectViewTransform] & 1) == 0
    && *(_DWORD *)(a1 + 128) == 1)
  {
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v66 = vmulq_f64(*(float64x2_t *)(a1 + 88), _Q1);
    long long v67 = a38;
    *(_OWORD *)&STACK[0x680] = a37;
    *(_OWORD *)&STACK[0x690] = v67;
    long long v68 = a40;
    *(_OWORD *)&STACK[0x6A0] = a39;
    *(_OWORD *)&STACK[0x6B0] = v68;
    long long v69 = a34;
    *(_OWORD *)&STACK[0x640] = a33;
    *(_OWORD *)&STACK[0x650] = v69;
    long long v70 = a36;
    *(_OWORD *)&STACK[0x660] = a35;
    *(_OWORD *)&STACK[0x670] = v70;
    *(float64x2_t *)&STACK[0x620] = v66;
    *(_OWORD *)&STACK[0x630] = 0u;
    pv_simd_matrix_translate((long long *)&STACK[0x640], (float64x2_t *)&STACK[0x620], &a25);
    a37 = a29;
    a38 = a30;
    a39 = a31;
    a40 = a32;
    a33 = a25;
    a34 = a26;
    a35 = a27;
    a36 = a28;
  }
  a21 = a37;
  a22 = a38;
  a23 = a39;
  a24 = a40;
  a17 = a33;
  a18 = a34;
  a19 = a35;
  a20 = a36;
  [(PVEffectFrame *)v49 setTransform:&a17];
  *(_OWORD *)&STACK[0x680] = xmmword_1B7E73520;
  *(_OWORD *)&STACK[0x690] = xmmword_1B7E73530;
  *(_OWORD *)&STACK[0x6A0] = xmmword_1B7E73540;
  *(_OWORD *)&STACK[0x6B0] = *(_OWORD *)&qword_1B7E73550;
  *(_OWORD *)&STACK[0x640] = pv_transform_info_identity;
  *(_OWORD *)&STACK[0x650] = *(_OWORD *)algn_1B7E734F0;
  *(_OWORD *)&STACK[0x660] = xmmword_1B7E73500;
  *(_OWORD *)&STACK[0x670] = *(_OWORD *)&qword_1B7E73510;
  float64x2_t v71 = *(float64x2_t *)(a1 + 88);
  a29 = a37;
  a30 = a38;
  a31 = a39;
  a32 = a40;
  a25 = a33;
  a26 = a34;
  a27 = a35;
  a28 = a36;
  pv_transform_info_make((uint64_t)&a25, (float64x2_t *)&STACK[0x640], v71);
  long long v72 = *(_OWORD *)&STACK[0x690];
  a13 = *(_OWORD *)&STACK[0x680];
  a14 = v72;
  long long v73 = *(_OWORD *)&STACK[0x6B0];
  a15 = *(_OWORD *)&STACK[0x6A0];
  a16 = v73;
  long long v74 = *(_OWORD *)&STACK[0x650];
  a9 = *(_OWORD *)&STACK[0x640];
  a10 = v74;
  long long v75 = *(_OWORD *)&STACK[0x670];
  a11 = *(_OWORD *)&STACK[0x660];
  a12 = v75;
  [(PVEffectFrame *)v49 setTransformInfo:&a9];
  long long v76 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
  [v76 CGRectValue];
  -[PVEffectFrame setObjectBounds:](v49, "setObjectBounds:");

  if (v49) {
    [(PVEffectFrame *)v49 cornerPoints];
  }
  else {
    memset(&var30, 0, sizeof(var30));
  }
  long long v77 = PVCGPointQuad_to_NSArray(&var30);
  [(PVEffectFrame *)v49 setHitAreaPoints:v77];

  [*(id *)(a1 + 64) addObject:v49];
}

- (CGRect)viewSpaceObjectBounds
{
  CGPoint v51 = (CGPoint)0;
  CGPoint v52 = (CGPoint)0;
  CGPoint v49 = (CGPoint)0;
  CGPoint v50 = (CGPoint)0;
  [(PVEffectFrame *)self objectBounds];
  PVCGPointQuad_from_CGRect(v54, &v49);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  [(PVEffectFrame *)self transform];
  uint64_t v33 = 0;
  float64x2_t v34 = &v33;
  uint64_t v35 = 0x6010000000;
  v36 = &unk_1B876C866;
  long long v37 = *(_OWORD *)PVCGPointQuadZero;
  long long v38 = *(_OWORD *)&PVCGPointQuadZero[16];
  long long v39 = *(_OWORD *)&PVCGPointQuadZero[32];
  long long v40 = *(_OWORD *)&PVCGPointQuadZero[48];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = *(void *)"";
  long long v22 = __38__PVEffectFrame_viewSpaceObjectBounds__block_invoke;
  uint64_t v23 = &unk_1E6169678;
  long long v26 = v43;
  long long v27 = v44;
  long long v24 = v41;
  long long v25 = v42;
  long long v30 = v47;
  long long v31 = v48;
  long long v28 = v45;
  long long v29 = v46;
  v32 = &v33;
  v20.a = v49;
  v20.b = v50;
  v20.c = v51;
  v20.d = v52;
  objc_super v3 = v21;
  uint64_t v4 = 0;
  do
  {
    PVCGPointQuad v53 = v20;
    CGFloat point_at_index = PVCGPointQuad_get_point_at_index(&v53, v4);
    ((void (*)(void *, uint64_t, double))v22)(v3, v4, point_at_index);
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 4);

  CGPoint v6 = (CGPoint)*((_OWORD *)v34 + 3);
  v53.a = (CGPoint)*((_OWORD *)v34 + 2);
  v53.b = v6;
  CGPoint v7 = (CGPoint)*((_OWORD *)v34 + 5);
  v53.c = (CGPoint)*((_OWORD *)v34 + 4);
  v53.d = v7;
  pv_bounding_CGRect(&v53);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  _Block_object_dispose(&v33, 8);
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

CGFloat *__38__PVEffectFrame_viewSpaceObjectBounds__block_invoke(uint64_t a1, int a2, float64x2_t a3, float64_t a4)
{
  a3.f64[1] = a4;
  float64x2_t v6 = *(float64x2_t *)(a1 + 112);
  v12[4] = *(float64x2_t *)(a1 + 96);
  v12[5] = v6;
  float64x2_t v7 = *(float64x2_t *)(a1 + 144);
  v12[6] = *(float64x2_t *)(a1 + 128);
  v12[7] = v7;
  float64x2_t v8 = *(float64x2_t *)(a1 + 48);
  v12[0] = *(float64x2_t *)(a1 + 32);
  v12[1] = v8;
  float64x2_t v9 = *(float64x2_t *)(a1 + 80);
  v12[2] = *(float64x2_t *)(a1 + 64);
  v12[3] = v9;
  v11[0] = a3;
  v11[1] = 0u;
  pv_simd_matrix_transform_vector(v12, v11, v13);
  return PVCGPointQuad_set_point_at_index((CGFloat *)(*(void *)(*(void *)(a1 + 160) + 8) + 32), (CGPoint)v13[0], a2);
}

- (CGPoint)midpoint
{
  [(PVEffectFrame *)self cornerPoints];
  double quad_center = pv_CGPoint_get_quad_center(&v4);
  result.y = v3;
  result.x = quad_center;
  return result;
}

- (void)setHitAreaPath:(CGPath *)a3
{
  self->_hitAreaPath = a3;
}

- (void)setExpandedHitAreaPath:(CGPath *)a3
{
  self->_expandedHitAreaPath = a3;
}

- (id)description
{
  id v25 = (id)NSString;
  v30.receiver = self;
  v30.super_class = (Class)PVEffectFrame;
  long long v24 = [(PVEffectFrame *)&v30 description];
  [(PVEffectFrame *)self time];
  uint64_t v23 = (__CFString *)CMTimeCopyDescription(0, &time);
  double v3 = objc_msgSend(NSNumber, "numberWithBool:", -[PVEffectFrame forcePosterFrame](self, "forcePosterFrame"));
  PVCGPointQuad v4 = NSString;
  unsigned int v5 = [(PVEffectFrame *)self effectOrigin];
  if (v5 >= 3) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = v5;
  }
  long long v22 = [v4 stringWithUTF8String:PVCoordinateSystemOriginNames[v6]];
  [(PVEffectFrame *)self effectSize];
  id v21 = NSStringFromCGSize(v32);
  [(PVEffectFrame *)self center];
  float64x2_t v7 = NSStringFromCGPoint(v33);
  float64x2_t v8 = NSString;
  unsigned int v9 = [(PVEffectFrame *)self viewOrigin];
  if (v9 >= 3) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = v9;
  }
  PVCGPointQuad v20 = [v8 stringWithUTF8String:PVCoordinateSystemOriginNames[v10]];
  [(PVEffectFrame *)self viewSize];
  double v19 = NSStringFromCGSize(v34);
  [(PVEffectFrame *)self cornerPoints];
  double v11 = NSStringFromPVCGPointQuad(&v28, 3);
  [(PVEffectFrame *)self objectBounds];
  double v12 = NSStringFromCGRect(v35);
  double v13 = [(PVEffectFrame *)self hitAreaPoints];
  [(PVEffectFrame *)self transform];
  double v14 = NSStringFromSIMDDouble4x4((uint64_t)v27, 4);
  double v15 = NSNumber;
  double v16 = [(PVEffectFrame *)self textFrames];
  double v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  id v26 = [v25 stringWithFormat:@"%@\ntime: %@\nforcePosterFrame: %@\neffectOrigin: %@\neffectSize: %@\n\ncenter: %@\n\nviewOrigin: %@\nviewSize: %@\n\ncornerPoints:\n%@\n\nobjectBounds: %@\n\nhitAreaPoints: %@\n\ntransform:\n%@\n\ntextFrames (count): %@", v24, v23, v3, v22, v21, v7, v20, v19, v11, v12, v13, v14, v17];

  return v26;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)forcePosterFrame
{
  return self->_forcePosterFrame;
}

- (void)setForcePosterFrame:(BOOL)a3
{
  self->_forcePosterFrame = a3;
}

- (int)effectOrigin
{
  return self->_effectOrigin;
}

- (void)setEffectOrigin:(int)a3
{
  self->_effectOrigin = a3;
}

- (CGSize)effectSize
{
  double width = self->_effectSize.width;
  double height = self->_effectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEffectSize:(CGSize)a3
{
  self->_effectSize = a3;
}

- (int)viewOrigin
{
  return self->_viewOrigin;
}

- (void)setViewOrigin:(int)a3
{
  self->_viewOrigin = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (PVCGPointQuad)cornerPoints
{
  CGPoint c = self[3].c;
  retstr->CGPoint a = self[3].b;
  retstr->b = c;
  CGPoint a = self[4].a;
  retstr->CGPoint c = self[3].d;
  retstr->d = a;
  return self;
}

- (void)setCornerPoints:(PVCGPointQuad *)a3
{
  CGPoint a = a3->a;
  CGPoint b = a3->b;
  CGPoint d = a3->d;
  self->_cornerPoints.CGPoint c = a3->c;
  self->_cornerPoints.CGPoint d = d;
  self->_cornerPoints.CGPoint a = a;
  self->_cornerPoints.CGPoint b = b;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGRect)outputROI
{
  double x = self->_outputROI.origin.x;
  double y = self->_outputROI.origin.y;
  double width = self->_outputROI.size.width;
  double height = self->_outputROI.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (CGRect)objectBounds
{
  double x = self->_objectBounds.origin.x;
  double y = self->_objectBounds.origin.y;
  double width = self->_objectBounds.size.width;
  double height = self->_objectBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setObjectBounds:(CGRect)a3
{
  self->_objectBounds = a3;
}

- (NSArray)hitAreaPoints
{
  return self->_hitAreaPoints;
}

- (void)setHitAreaPoints:(id)a3
{
}

- (CGPath)hitAreaPath
{
  return self->_hitAreaPath;
}

- (CGPath)expandedHitAreaPath
{
  return self->_expandedHitAreaPath;
}

- (double)minimumHitSize
{
  return self->_minimumHitSize;
}

- (void)setMinimumHitSize:(double)a3
{
  self->_minimumHitSize = a3;
}

- (double)hitSizeThreshold
{
  return self->_hitSizeThreshold;
}

- (void)setHitSizeThreshold:(double)a3
{
  self->_hitSizeThresholCGPoint d = a3;
}

- (__n128)transform
{
  long long v2 = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 336);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 304);
  long long v6 = *(_OWORD *)(a1 + 320);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 304) = a3[2];
  *(_OWORD *)(a1 + 320) = v5;
  *(_OWORD *)(a1 + 272) = v3;
  *(_OWORD *)(a1 + 288) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 368) = a3[6];
  *(_OWORD *)(a1 + 384) = v8;
  *(__n128 *)(a1 + 336) = result;
  *(_OWORD *)(a1 + 352) = v7;
  return result;
}

- (__n128)transformInfo
{
  long long v2 = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 432);
  long long v6 = *(_OWORD *)(a1 + 448);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransformInfo:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 432) = a3[2];
  *(_OWORD *)(a1 + 448) = v5;
  *(_OWORD *)(a1 + 400) = v3;
  *(_OWORD *)(a1 + 416) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 496) = a3[6];
  *(_OWORD *)(a1 + 512) = v8;
  *(__n128 *)(a1 + 464) = result;
  *(_OWORD *)(a1 + 480) = v7;
  return result;
}

- (NSArray)textFrames
{
  return self->_textFrames;
}

- (void)setTextFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrames, 0);

  objc_storeStrong((id *)&self->_hitAreaPoints, 0);
}

@end