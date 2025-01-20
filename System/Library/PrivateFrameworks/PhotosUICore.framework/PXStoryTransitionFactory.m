@interface PXStoryTransitionFactory
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)visibleOrderOutDurationForTransitionInfo:(SEL)a3;
+ (id)effectTransitionWithInfo:(id *)a3 entityManager:(id)a4;
+ (id)panTransitionWithConfiguration:(id)a3;
+ (id)segmentTransitionWithInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6;
+ (id)wipeTransitionWithConfiguration:(id)a3;
@end

@implementation PXStoryTransitionFactory

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)visibleOrderOutDurationForTransitionInfo:(SEL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t var0 = a4->var0;
  if (var0 >= 0xA) {
    PXAssertGetLog();
  }
  int32_t v6 = dword_1AB35A9A8[var0];
  *(_OWORD *)&v8.value = *(_OWORD *)(&a4->var1 + 3);
  v8.epoch = *(void *)&a4->var2.var2;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiplyByRatio((CMTime *)retstr, &v8, v6, 100);
}

+ (id)panTransitionWithConfiguration:(id)a3
{
  return +[PXStoryTransitionPan panWithConfiguration:a3];
}

+ (id)wipeTransitionWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[PXStoryTransitionWipe alloc] initWithConfiguration:v3];

  return v4;
}

+ (id)segmentTransitionWithInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  switch(a3->var0)
  {
    case 0:
      v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = *(_OWORD *)&a3->var2.var1;
        long long v29 = *(_OWORD *)&a3->var0;
        long long v30 = v13;
        uint64_t v31 = *(void *)&a3->var3;
        v14 = PXStoryTransitionInfoDescription((unsigned __int8 *)&v29);
        LODWORD(v29) = 138543362;
        *(void *)((char *)&v29 + 4) = v14;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "Requesting .none transition with transition info: %{public}@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_5;
    case 1:
LABEL_5:
      uint64_t v15 = +[PXStoryTransitionCut cut];
      goto LABEL_14;
    case 2:
      v16 = [PXStoryTransitionCrossfade alloc];
      long long v17 = *(_OWORD *)&a3->var2.var1;
      long long v29 = *(_OWORD *)&a3->var0;
      long long v30 = v17;
      uint64_t v31 = *(void *)&a3->var3;
      uint64_t v15 = [(PXStoryTransitionCrossfade *)v16 initWithTransitionInfo:&v29 event:a4 clipLayouts:v11 storyTransitionCurveType:a6];
      goto LABEL_14;
    case 3:
      v18 = PXStoryTransitionFadeToBlack;
      goto LABEL_13;
    case 4:
      v18 = PXStoryTransitionExposureBleed;
      goto LABEL_13;
    case 5:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = v23;
      v25 = @"Use +[PXStoryTransitionFactory panTransitionWithConfiguration:] instead.";
      SEL v26 = a2;
      id v27 = a1;
      uint64_t v28 = 1115;
      goto LABEL_21;
    case 6:
      v18 = PXStoryTransitionScale;
      goto LABEL_13;
    case 7:
      v18 = PXStoryTransitionRotate;
      goto LABEL_13;
    case 8:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = v23;
      v25 = @"Use +[PXStoryTransitionFactory wipeTransitionWithConfiguration:] instead.";
      SEL v26 = a2;
      id v27 = a1;
      uint64_t v28 = 1124;
      goto LABEL_21;
    case 9:
      v18 = PXStoryTransitionZoom;
LABEL_13:
      id v20 = [v18 alloc];
      long long v21 = *(_OWORD *)&a3->var2.var1;
      long long v29 = *(_OWORD *)&a3->var0;
      long long v30 = v21;
      uint64_t v31 = *(void *)&a3->var3;
      uint64_t v15 = [v20 initWithTransitionInfo:&v29 event:a4 clipLayouts:v11];
LABEL_14:
      v19 = (void *)v15;
      break;
    case 0xA:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = v23;
      v25 = @"Not a valid transition.";
      SEL v26 = a2;
      id v27 = a1;
      uint64_t v28 = 1130;
LABEL_21:
      [v23 handleFailureInMethod:v26 object:v27 file:@"PXStoryTransition.m" lineNumber:v28 description:v25];

      abort();
    default:
      v19 = 0;
      break;
  }

  return v19;
}

+ (id)effectTransitionWithInfo:(id *)a3 entityManager:(id)a4
{
  id v7 = a4;
  CMTime v8 = 0;
  switch(a3->var0)
  {
    case 4:
      uint64_t v9 = (void *)[objc_alloc((Class)off_1E5DA6820) initWithEntityManager:v7];
      v10 = PXStoryTransitionExposureBleed;
      goto LABEL_8;
    case 5:
      int v11 = SBYTE5(a3->var2.var3);
      if ((v11 - 1) < 2)
      {
        v12 = (Class *)&off_1E5DA6890;
        goto LABEL_10;
      }
      if ((v11 - 3) < 2)
      {
        v12 = (Class *)&off_1E5DA6C30;
LABEL_10:
        uint64_t v9 = (void *)[objc_alloc(*v12) initWithEntityManager:v7];
        goto LABEL_11;
      }
      if (!BYTE5(a3->var2.var3))
      {
        long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2 object:a1 file:@"PXStoryTransition.m" lineNumber:1062 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      uint64_t v9 = 0;
LABEL_11:
      long long v19 = *(_OWORD *)&a3->var2.var1;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v19;
      uint64_t v24 = *(void *)&a3->var3;
      uint64_t v18 = +[PXStoryTransitionPan panWithEffect:v9 transitionInfo:&v22];
LABEL_12:
      CMTime v8 = (PXStoryTransitionRotate *)v18;
LABEL_13:

LABEL_14:
      return v8;
    case 7:
      uint64_t v9 = (void *)[objc_alloc((Class)off_1E5DA6AD8) initWithEntityManager:v7];
      long long v13 = (void *)[objc_alloc((Class)off_1E5DA6AD8) initWithEntityManager:v7];
      v14 = [PXStoryTransitionRotate alloc];
      long long v15 = *(_OWORD *)&a3->var2.var1;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v15;
      uint64_t v24 = *(void *)&a3->var3;
      CMTime v8 = [(PXStoryTransitionRotate *)v14 initWithTransitionInfo:&v22 effect:v9 auxiliaryEffect:v13];

      goto LABEL_13;
    case 9:
      uint64_t v9 = (void *)[objc_alloc((Class)off_1E5DA6AA0) initWithEntityManager:v7];
      v10 = PXStoryTransitionZoom;
LABEL_8:
      id v16 = [v10 alloc];
      long long v17 = *(_OWORD *)&a3->var2.var1;
      long long v22 = *(_OWORD *)&a3->var0;
      long long v23 = v17;
      uint64_t v24 = *(void *)&a3->var3;
      uint64_t v18 = [v16 initWithTransitionInfo:&v22 effect:v9];
      goto LABEL_12;
    default:
      goto LABEL_14;
  }
}

@end