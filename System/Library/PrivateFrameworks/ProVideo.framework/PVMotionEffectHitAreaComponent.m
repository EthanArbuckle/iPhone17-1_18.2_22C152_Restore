@interface PVMotionEffectHitAreaComponent
+ (id)motionEffectPropertyKeyToPublishedParameterNameMap;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTimeToTimelineTime_noLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5;
- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11;
- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
@end

@implementation PVMotionEffectHitAreaComponent

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  BOOL v13 = a5;
  BOOL v14 = a4;
  v17 = [(PVMotionEffectComponent *)self motionEffect];
  [v17 outputSize];
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  v22 = [(PVMotionEffectComponent *)self motionEffect];
  LODWORD(v17) = [v22 origin];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4;
  v43 = __Block_byref_object_dispose__4;
  id v44 = 0;
  v23 = [(PVMotionEffectComponent *)self motionEffect];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = *(void *)"";
  v34[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v34[3] = &unk_1E6169628;
  BOOL v38 = v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = *a3;
  *(double *)&v34[6] = x;
  *(double *)&v34[7] = y;
  v34[4] = self;
  v34[5] = &v39;
  v34[8] = v19;
  v34[9] = v21;
  *(double *)&v34[10] = width;
  *(double *)&v34[11] = height;
  int v36 = (int)v17;
  int v37 = v8;
  [v23 runEnsuringDocumentReadyAndLockingDocument:v34];

  if ((unint64_t)[(id)v40[5] count] < 3)
  {
    memset(&v33, 0, sizeof(v33));
    v25 = [(PVMotionEffectComponent *)self motionEffect];
    v26 = [v25 transformComponent];
    v27 = v26;
    long long v31 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    if (v26) {
      objc_msgSend(v26, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v31, v14, v13, v8, x, y, width, height);
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }

    PVCGPointQuad v30 = v33;
    PVCGPointQuad_to_NSArray(&v30);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = (id)v40[5];
  }
  v28 = v24;
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 164))
  {
    int v4 = *(_DWORD *)(a2 + 160);
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v5 = 1;
    }
    else
    {
      v6 = [*(id *)(a1 + 32) motionEffect];
      v7 = [v6 timelineComponent];
      uint64_t v5 = [v7 isForceRenderAtPosterFrameEnabled];
    }
    long long v41 = 0uLL;
    uint64_t v42 = 0;
    uint64_t v8 = [*(id *)(a1 + 32) motionEffect];
    v9 = [v8 timelineComponent];
    v10 = v9;
    long long v39 = *(_OWORD *)(a1 + 96);
    uint64_t v40 = *(void *)(a1 + 112);
    if (v9)
    {
      objc_msgSend(v9, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v39, v5, a2);
    }
    else
    {
      long long v41 = 0uLL;
      uint64_t v42 = 0;
    }

    v11 = [*(id *)(a1 + 32) motionEffect];
    long long v37 = v41;
    uint64_t v38 = v42;
    v12 = objc_msgSend(v11, "publishedParam_NoLock:forKey:atTime:includeHidden:", a2, @"kPVHitAreaPointsKey", &v37, 1);

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = __Block_byref_object_dispose__4;
    id v36 = [v12 objectForKeyedSubscript:@"PVEffectParam_ValuesArrayKey"];
    if ((unint64_t)[(id)v32[5] count] >= 3)
    {
      uint64_t v13 = pv_CGPoint_scale_polygon((void *)v32[5], *(float64_t *)(a1 + 48), *(float64_t *)(a1 + 56));
      BOOL v14 = (void *)v32[5];
      v32[5] = v13;

      v15 = [*(id *)(a1 + 32) motionEffect];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = *(void *)"";
      v25[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
      v25[3] = &unk_1E6168F78;
      v25[4] = *(void *)(a1 + 32);
      v25[5] = &v31;
      int v26 = v4;
      long long v27 = v41;
      uint64_t v28 = v42;
      long long v29 = *(_OWORD *)(a1 + 96);
      uint64_t v30 = *(void *)(a1 + 112);
      v25[6] = a2;
      [v15 runWithInspectableProperties:v25];

      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v32[5], "count"));
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = (void *)v32[5];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = *(void *)"";
      long long v20 = *(_OWORD *)(a1 + 80);
      long long v22 = *(_OWORD *)(a1 + 64);
      v21[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_3;
      v21[3] = &unk_1E6169600;
      long long v23 = v20;
      uint64_t v24 = *(void *)(a1 + 120);
      v21[4] = *(void *)(a1 + 40);
      [v19 enumerateObjectsUsingBlock:v21];
    }
    _Block_object_dispose(&v31, 8);
  }
}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) motionEffect];
  uint64_t v5 = [v4 transformComponent];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = *(unsigned int *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 60);
  uint64_t v15 = *(void *)(a1 + 76);
  long long v12 = *(_OWORD *)(a1 + 84);
  uint64_t v13 = *(void *)(a1 + 100);
  uint64_t v9 = objc_msgSend(v5, "transformObjectPointsToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:", v7, v8, &v14, &v12, 0, v6, v3);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 CGPointValue];
  double v5 = v4;
  double v7 = v6;
  double v8 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 48);
  double v11 = *(double *)(a1 + 56);
  double v10 = *(double *)(a1 + 64);
  int v13 = *(_DWORD *)(a1 + 72);
  int v12 = *(_DWORD *)(a1 + 76);
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v13 == 2)
  {
    double v19 = 0.5;
    if (v12 != 1)
    {
      double v17 = v8 * 0.5;
      double v18 = v9 * 0.5;
      BOOL v16 = v12 == 0;
      goto LABEL_8;
    }
    double v14 = v8 * 0.5;
    goto LABEL_20;
  }
  if (v13 != 1)
  {
    if (!v13)
    {
      if (v12 != 1)
      {
        BOOL v16 = v12 == 2;
        double v17 = v8 * -0.5;
        double v18 = v9 * -0.5;
LABEL_8:
        if (v16) {
          double v14 = v17;
        }
        if (v16) {
          double v15 = v18;
        }
        goto LABEL_14;
      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_18:
    double v20 = *(double *)(a1 + 48);
LABEL_21:
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, v11 / v8, v10 / v9);
    CGAffineTransform v25 = v23;
    CGAffineTransformTranslate(&v26, &v25, v14, v20);
    CGAffineTransform v23 = v26;
    CGAffineTransform v24 = v26;
    CGAffineTransformScale(&v26, &v24, 1.0, -1.0);
    goto LABEL_22;
  }
  if (v12 == 2)
  {
    double v14 = v8 * -0.5;
    double v19 = 0.5;
LABEL_20:
    double v20 = v9 * v19;
    goto LABEL_21;
  }
LABEL_14:
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v11 / v8, v10 / v9);
  CGAffineTransform v25 = v23;
  CGAffineTransformTranslate(&v26, &v25, v14, v15);
LABEL_22:
  CGAffineTransform v23 = v26;
  uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  long long v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v26.tx + v5 * v26.a + v7 * v26.c, v26.ty + v5 * v26.b + v7 * v26.d, *(void *)&v26.a, *(void *)&v26.b, *(void *)&v26.c, *(void *)&v26.d, *(void *)&v26.tx, *(void *)&v26.ty);
  [v21 addObject:v22];
}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11 = *(void *)&a11;
  double height = a10.height;
  double width = a10.width;
  BOOL v16 = a7;
  double y = a6.y;
  double x = a6.x;
  BOOL v19 = a5;
  CGFloat v21 = a3.y;
  CGFloat v22 = a3.x;
  CGAffineTransform v24 = [(PVMotionEffectComponent *)self motionEffect];
  char v25 = [v24 isVisible];

  if ((v25 & 1) == 0) {
    return 0;
  }
  long long v28 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  CGPathRef path = 0;
  CGAffineTransform v26 = -[PVMotionEffectHitAreaComponent createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:](self, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v28, v19, v16, v11, &path, x, y, a8, a9, width, height);
  v31.double x = v22;
  v31.double y = v21;
  if (CGPathContainsPoint(v26, 0, v31, 0)) {
    return 1;
  }
  BOOL result = 0;
  if (v16)
  {
    if (path)
    {
      v32.double x = v22;
      v32.double y = v21;
      return CGPathContainsPoint(path, 0, v32, 0);
    }
  }
  return result;
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  BOOL v12 = a6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a3;
  double v15 = -[PVMotionEffectHitAreaComponent hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](self, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v22, a4, 0, *(void *)&a10, a5.x, a5.y, a9.width, a9.height);
  closed_CGPath_with_points = pv_create_closed_CGPath_with_points(v15);
  if (a11)
  {
    if (!v12
      || (pv_bounding_CGRect(v15),
          v18.f64[1] = v17,
          double v19 = fmin(fmax(a8 / sqrt(vaddvq_f64(vmulq_f64(v18, v18))), 0.0), 1.0) * a7,
          v19 <= 0.0)
      || (expanded_closed_CGPath_with_CGPath = pv_create_expanded_closed_CGPath_with_CGPath(closed_CGPath_with_points, v19)) == 0)
    {
      expanded_closed_CGPath_with_CGPath = CGPathRetain(closed_CGPath_with_points);
    }
    *a11 = expanded_closed_CGPath_with_CGPath;
  }

  return closed_CGPath_with_points;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTimeToTimelineTime_noLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5
{
  if (a5)
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v11 = [(PVMotionEffectComponent *)self motionEffect];
    BOOL v12 = [v11 timelineComponent];
    uint64_t v10 = [v12 isForceRenderAtPosterFrameEnabled];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  int v13 = [(PVMotionEffectComponent *)self motionEffect];
  double v14 = [v13 timelineComponent];
  double v15 = v14;
  long long v17 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  if (v14)
  {
    objc_msgSend(v14, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v17, v10, a6);
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  CGFloat height = a10.height;
  CGFloat width = a10.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v19 = [(PVMotionEffectComponent *)self motionEffect];
  [v19 outputSize];
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  CGAffineTransform v24 = [(PVMotionEffectComponent *)self motionEffect];
  LODWORD(v19) = [v24 origin];

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__4;
  long long v37 = __Block_byref_object_dispose__4;
  id v38 = 0;
  char v25 = [(PVMotionEffectComponent *)self motionEffect];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = *(void *)"";
  v28[2] = __145__PVMotionEffectHitAreaComponent_objectHitTest_atTime_forcePosterFrame_scale_adjustForMinimumSize_minimumSize_sizeThreshold_viewSize_viewOrigin___block_invoke;
  v28[3] = &unk_1E6169628;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = *a4;
  BOOL v32 = a5;
  *(CGFloat *)&v28[6] = x;
  *(CGFloat *)&v28[7] = y;
  *(CGFloat *)&v28[8] = width;
  *(CGFloat *)&v28[9] = height;
  v28[10] = v21;
  v28[11] = v23;
  int v30 = a11;
  int v31 = (int)v19;
  v28[4] = self;
  v28[5] = &v33;
  [v25 runEnsuringDocumentReadyAndLockingDocument:v28];

  id v26 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v26;
}

void __145__PVMotionEffectHitAreaComponent_objectHitTest_atTime_forcePosterFrame_scale_adjustForMinimumSize_minimumSize_sizeThreshold_viewSize_viewOrigin___block_invoke(uint64_t a1, void **a2)
{
  memset(&v29, 0, sizeof(v29));
  double v4 = *(void **)(a1 + 32);
  long long v27 = *(_OWORD *)(a1 + 96);
  uint64_t v28 = *(void *)(a1 + 112);
  if (v4) {
    objc_msgSend(v4, "convertTimeToTimelineTime_noLock:forcePosterFrame:documentInfo:", &v27, *(unsigned __int8 *)(a1 + 128), a2);
  }
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v7 = *(double *)(a1 + 88);
  int v10 = *(_DWORD *)(a1 + 120);
  int v9 = *(_DWORD *)(a1 + 124);
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v25 = *(double *)(a1 + 48);
  double v26 = *(double *)(a1 + 56);
  if (v10 == 2)
  {
    double v16 = 0.5;
    if (v9 != 1)
    {
      double v14 = v5 * 0.5;
      double v15 = v6 * 0.5;
      BOOL v13 = v9 == 0;
      goto LABEL_10;
    }
    double v11 = v5 * 0.5;
    goto LABEL_22;
  }
  if (v10 != 1)
  {
    if (!v10)
    {
      if (v9 != 1)
      {
        BOOL v13 = v9 == 2;
        double v14 = v5 * -0.5;
        double v15 = v6 * -0.5;
LABEL_10:
        if (v13) {
          double v11 = v14;
        }
        if (v13) {
          double v12 = v15;
        }
        goto LABEL_16;
      }
      goto LABEL_20;
    }
LABEL_16:
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, v8 / v5, v7 / v6);
    CGAffineTransform v32 = v30;
    CGAffineTransformTranslate(&v33, &v32, v11, v12);
    goto LABEL_24;
  }
  if (v9)
  {
    if (v9 != 2) {
      goto LABEL_16;
    }
    double v11 = v5 * -0.5;
    double v16 = 0.5;
LABEL_22:
    double v17 = v6 * v16;
    goto LABEL_23;
  }
LABEL_20:
  double v17 = *(double *)(a1 + 72);
LABEL_23:
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, v8 / v5, v7 / v6);
  CGAffineTransform v32 = v30;
  CGAffineTransformTranslate(&v33, &v32, v11, v17);
  CGAffineTransform v30 = v33;
  CGAffineTransform v31 = v33;
  CGAffineTransformScale(&v33, &v31, 1.0, -1.0);
LABEL_24:
  CGAffineTransform v30 = v33;
  CGPoint v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&v33.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v33.a, v25), vmulq_n_f64(*(float64x2_t *)&v33.c, v26)));
  LODWORD(v33.a) = 0;
  CGFloat y = v18.y;
  if (!OZXHitCheck(*a2, v18, &v29, (unsigned int *)&v33))
  {
    uint64_t v20 = [*(id *)(a1 + 32) motionEffect];
    uint64_t v21 = [v20 sceneManagerComponent];
    uint64_t v22 = [v21 handleForOZID:LODWORD(v33.a)];
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    CGAffineTransform v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      NSLog(&cfstr_WarningEffectH.isa);
    }
  }
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectHitAreaComponent;
  v2 = objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  id v3 = (void *)[v2 mutableCopy];

  double v8 = @"kPVHitAreaPointsKey";
  v9[0] = @"HitAreaPoints";
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  if ([v3 count])
  {
    [v3 addEntriesFromDictionary:v4];
    id v5 = v3;

    double v4 = v5;
  }

  return v4;
}

@end