@interface PBAnimation
+ (BOOL)hasPpt10Animations:(id)a3;
+ (id)newChartBuild:(id)a3;
+ (id)newColorFromBehaviorColor:(PptAnimColorBehavior_Color_Struct *)a3;
+ (id)newParaBuild:(id)a3;
+ (id)parseBehaviorContainer:(id)a3 timeNode:(id)a4 state:(id)a5;
+ (id)parseMediaContainer:(id)a3 timeNode:(id)a4 state:(id)a5;
+ (unint64_t)paragraphIndexFromBinaryTextBytesCharacterIndex:(unint64_t)a3 srcDrawable:(id)a4;
+ (void)generatePpt10AnimationFromState:(id)a3 timings:(id)a4;
+ (void)mapAnimationsFromSlide:(id)a3 tgtSlide:(id)a4 state:(id)a5;
+ (void)parseAnimateBehaviorContainer:(id)a3 animBehavior:(id)a4 timeNode:(id)a5;
+ (void)parseBuildList:(id)a3 buildMap:(id)a4 state:(id)a5;
+ (void)parseCmdBehaviorContainer:(id)a3 cmdBehavior:(id)a4 timeNode:(id)a5;
+ (void)parseColorBehaviorContainer:(id)a3 colorBehavior:(id)a4 timeNode:(id)a5;
+ (void)parseEffectBehaviorContainer:(id)a3 effectBehavior:(id)a4 timeNode:(id)a5;
+ (void)parseMotionBehaviorContainer:(id)a3 motionBehavior:(id)a4 timeNode:(id)a5;
+ (void)parsePpt10Animation:(id)a3 timings:(id)a4 state:(id)a5;
+ (void)parseRotationBehaviorContainer:(id)a3 rotationBehavior:(id)a4 timeNode:(id)a5;
+ (void)parseTargetContainerHolder:(id)a3 setTargetObj:(id)a4 state:(id)a5;
+ (void)parseTimeConditionsHolder:(id)a3 commonData:(id)a4;
+ (void)parseTimeNodeContainer:(id)a3 siblings:(id)a4 state:(id)a5;
+ (void)parseTimeNodeVariants:(id)a3 commonData:(id)a4;
@end

@implementation PBAnimation

+ (void)mapAnimationsFromSlide:(id)a3 tgtSlide:(id)a4 state:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 presentationState];
  v11 = [v8 animation];
  if ([a1 hasPpt10Animations:v12]) {
    [a1 parsePpt10Animation:v12 timings:v11 state:v9];
  }
  else {
    [a1 generatePpt10AnimationFromState:v10 timings:v11];
  }
  [v10 resetSlideState];
}

+ (BOOL)hasPpt10Animations:(id)a3
{
  v3 = +[PBProgTag binaryTagDataWithName:L"___PPT10" inProgTagsParent:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)parsePpt10Animation:(id)a3 timings:(id)a4 state:(id)a5
{
  id v19 = a4;
  id v8 = a5;
  id v9 = [a3 firstChildOfType:5000];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 firstChildOfType:5002];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v10 firstChildOfType:5003];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 firstChildOfType:11008];
        if (v12)
        {
          v13 = [v11 firstChildOfType:61764];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = (id)[v19 addRootTimeNode];
            v15 = [v19 rootTimeNode];
            id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v15 setChildTimeNodeList:v16];
            [a1 parseTimeNodeContainer:v13 siblings:v16 state:v8];
          }
          v17 = [v11 firstChildOfType:11010];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = objc_alloc_init(OITSUNoCopyDictionary);
            [a1 parseBuildList:v17 buildMap:v18 state:v8];
            [v19 setBuildMap:v18];
          }
        }
      }
    }
  }
}

+ (void)generatePpt10AnimationFromState:(id)a3 timings:(id)a4
{
  id v38 = a3;
  id v5 = a4;
  v6 = [v38 slideState];
  v7 = [v6 buildOrderMap];
  v37 = v5;

  id v8 = [v7 allKeys];
  id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  v40 = objc_alloc_init(OITSUNoCopyDictionary);
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [v38 tgtSlide];
  id v12 = [v11 drawables];
  v13 = [v10 setWithArray:v12];

  unsigned int v14 = 0;
  v39 = v13;
  while (1)
  {
    unsigned int v15 = v14;
    if (objc_msgSend(v9, "count", v37) <= (unint64_t)v14) {
      break;
    }
    id v16 = [v9 objectAtIndex:v14];
    v17 = v7;
    v18 = [v7 objectForKey:v16];

    id v19 = [v18 drawable];
    if (![v13 containsObject:v19]) {
      goto LABEL_15;
    }
    v20 = [PDBuildMapKey alloc];
    v21 = [v18 drawable];
    v22 = [v18 data];
    v23 = [v22 groupId];
    v42 = [(PDBuildMapKey *)v20 initWithDrawable:v21 groupId:v23];

    v24 = [v18 build];
    [(OITSUNoCopyDictionary *)v40 setObject:v24 forUncopiedKey:v42];

    v25 = objc_alloc_init(PDTimeNodeUnion);
    v26 = [v18 data];
    [(PDTimeNodeUnion *)v25 setSequential:v26];

    [v41 addObject:v25];
    uint64_t v27 = objc_opt_class();
    v28 = [v19 clientData];
    v29 = TSUDynamicCast(v27, (uint64_t)v28);

    v30 = [v29 animationInfo];
    v31 = [v30 mediaNode];

    if (v31)
    {
      v32 = objc_alloc_init(PDTimeNodeUnion);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PDTimeNodeUnion *)v32 setVideo:v31];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PDTimeNodeUnion *)v32 setAudio:v31];
        }
      }
      v33 = [(PDTimeNodeUnion *)v32 video];
      if (v33)
      {

        goto LABEL_12;
      }
      v34 = [(PDTimeNodeUnion *)v32 audio];

      if (v34) {
LABEL_12:
      }
        [v41 addObject:v32];
    }
    v13 = v39;
LABEL_15:

    unsigned int v14 = v15 + 1;
    v7 = v17;
  }
  id v35 = (id)[v37 addRootTimeNode];
  v36 = [v37 rootTimeNode];
  [v36 setChildTimeNodeList:v41];

  [v37 setBuildMap:v40];
}

+ (id)parseBehaviorContainer:(id)a3 timeNode:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  v48 = [v8 firstChildOfType:61745];
  if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_alloc_init(PDSetBehavior);
    [v9 setBehavior:v10];

    v11 = [v9 behavior];
    id v52 = v48;
  }
  else
  {
    id v52 = 0;
    v11 = 0;
  }
  v51 = [v8 firstChildOfType:61744];
  if (v51)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(PDAnimateScaleBehavior);
      v13 = [v51 firstChildOfType:61753];
      unsigned int v14 = v13;
      if (v13)
      {
        unsigned int v15 = (const void *)[v13 eshObject];
        if (v15) {
        else
        }
          id v16 = 0;
        __int8 v17 = v16[9].i8[1];
        if (v17)
        {
          [(PDAnimateScaleBehavior *)v12 setBy:vcvtq_f64_f32(vmul_f32(v16[6], (float32x2_t)vdup_n_s32(0x447A0000u)))];
          __int8 v17 = v16[9].i8[1];
        }
        if ((v17 & 2) != 0)
        {
          [(PDAnimateScaleBehavior *)v12 setFrom:vcvtq_f64_f32(vmul_f32(v16[8], (float32x2_t)vdup_n_s32(0x447A0000u)))];
          __int8 v17 = v16[9].i8[1];
        }
        if ((v17 & 4) != 0) {
          [(PDAnimateScaleBehavior *)v12 setTo:vcvtq_f64_f32(vmul_f32(v16[7], (float32x2_t)vdup_n_s32(0x447A0000u)))];
        }
        [v9 setScaleBehavior:v12];
      }

      uint64_t v18 = [v9 scaleBehavior];

      id v19 = v51;
      id v52 = v19;
      v11 = (void *)v18;
    }
  }
  v50 = [v8 firstChildOfType:61739];
  if (v50)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = objc_alloc_init(PDAnimateTimeBehavior);
      [a1 parseAnimateBehaviorContainer:v50 animBehavior:v20 timeNode:v9];

      uint64_t v21 = [v9 timeBehavior];

      id v22 = v50;
      id v52 = v22;
      v11 = (void *)v21;
    }
  }
  v49 = [v8 firstChildOfType:61740];
  if (v49)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = objc_alloc_init(PDAnimateColorBehavior);
      [a1 parseColorBehaviorContainer:v49 colorBehavior:v23 timeNode:v9];

      uint64_t v24 = [v9 colorBehavior];

      id v25 = v49;
      id v52 = v25;
      v11 = (void *)v24;
    }
  }
  v26 = [v8 firstChildOfType:61741];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = objc_alloc_init(PDAnimateEffectBehavior);
      [a1 parseEffectBehaviorContainer:v26 effectBehavior:v27 timeNode:v9];

      uint64_t v28 = [v9 effectBehavior];

      id v29 = v26;
      id v52 = v29;
      v11 = (void *)v28;
    }
  }
  v30 = [v8 firstChildOfType:61742];
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = objc_alloc_init(PDAnimateMotionBehavior);
      [a1 parseMotionBehaviorContainer:v30 motionBehavior:v31 timeNode:v9];

      uint64_t v32 = [v9 motionBehavior];

      id v33 = v30;
      id v52 = v33;
      v11 = (void *)v32;
    }
  }
  v34 = [v8 firstChildOfType:61743];
  if (v34)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v35 = objc_alloc_init(PDAnimateRotateBehavior);
      [a1 parseRotationBehaviorContainer:v34 rotationBehavior:v35 timeNode:v9];

      uint64_t v36 = [v9 rotateBehavior];

      id v37 = v34;
      id v52 = v37;
      v11 = (void *)v36;
    }
  }
  id v38 = [v8 firstChildOfType:61746];
  if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = objc_alloc_init(PDCmdBehavior);
    id v40 = a1;
    [a1 parseCmdBehaviorContainer:v38 cmdBehavior:v39 timeNode:v9];

    uint64_t v41 = [v9 cmdBehavior];

    id v42 = v38;
    id v52 = v42;
    v11 = (void *)v41;
  }
  else
  {
    id v40 = a1;
  }
  v43 = v9;
  if (v11 && v52)
  {
    v44 = [v52 firstChildOfType:61738];
    if (v44)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v40 parseTargetContainerHolder:v44 setTargetObj:v11 state:v47];
      }
    }
  }
  id v45 = v11;

  return v45;
}

+ (void)parseTimeNodeContainer:(id)a3 siblings:(id)a4 state:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  v23 = objc_alloc_init(PDTimeNodeUnion);
  v10 = [v24 firstChildOfType:61735];
  v11 = v10;
  if (v10)
  {
    id v12 = (const void *)[v10 eshObject];
    if (v12) {
    else
    }
      v13 = 0;
    unsigned int v15 = 0;
    unsigned int v14 = v13[14];
    switch(v14)
    {
      case 0u:
        unsigned int v15 = objc_alloc_init(PDParallelTimeNode);
        [(PDTimeNodeUnion *)v23 setParallel:v15];
        goto LABEL_9;
      case 1u:
        unsigned int v15 = objc_alloc_init(PDSequentialTimeNode);
        [(PDTimeNodeUnion *)v23 setSequential:v15];
LABEL_9:
        if (!v15) {
          break;
        }
        goto LABEL_14;
      case 3u:
        uint64_t v16 = [a1 parseBehaviorContainer:v24 timeNode:v23 state:v9];
        goto LABEL_13;
      case 4u:
        uint64_t v16 = [a1 parseMediaContainer:v24 timeNode:v23 state:v9];
LABEL_13:
        unsigned int v15 = (PDParallelTimeNode *)v16;
        if (v16)
        {
LABEL_14:
          if ((v13[16] & 0x10) != 0) {
            [(PDTimeNode *)v15 setDuration:(double)(int)v13[12]];
          }
        }
        break;
      default:
        break;
    }
  }
  else
  {
    unsigned int v14 = 0;
    unsigned int v15 = 0;
  }
  __int8 v17 = [v24 firstChildOfType:61757];
  if (v17)
  {
    objc_opt_class();
    if (!((v14 > 1) | ((objc_opt_isKindOfClass() & 1) == 0))) {
      [a1 parseTimeNodeVariants:v17 commonData:v15];
    }
  }
  uint64_t v18 = [v24 firstChildOfType:61733];
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 parseTimeConditionsHolder:v24 commonData:v15];
    }
  }
  if (v15)
  {
    id v19 = [(PDTimeNode *)v15 childTimeNodeList];
    if (!v19)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(PDTimeNode *)v15 setChildTimeNodeList:v19];
    }
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v20 = [v24 firstChildOfType:61764];
  uint64_t v21 = (void *)v20;
  if (v19 && v20)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [a1 parseTimeNodeContainer:v21 siblings:v19 state:v9];
      uint64_t v22 = [v24 firstChildOfType:61764 afterChild:v21];

      uint64_t v21 = (void *)v22;
    }
    while (v22);
  }
  [v8 addObject:v23];
}

+ (id)parseMediaContainer:(id)a3 timeNode:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 firstChildOfType:61757];
  id v12 = [v8 firstChildOfType:61756];
  if (!v12) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v13 = [v12 firstChildOfType:11003];
  unsigned int v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (v15 == 4)
  {
    uint64_t v18 = objc_alloc_init(PDVideoNode);
    [v9 setVideo:v18];
    uint64_t v16 = v18;
    BYTE1(v19.var1) = 0;
    if (getVariantVal(v8, 26, 0, (CsString *)((char *)&v19.var1 + 1))) {
      [(PDAudioNode *)v16 setIsFullScreen:BYTE1(v19.var1)];
    }

    goto LABEL_15;
  }
  if (v15 != 3)
  {
LABEL_7:

LABEL_8:
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = objc_alloc_init(PDAudioNode);
  [v9 setAudio:v16];
LABEL_15:

  if (v16)
  {
    if (v11)
    {
      LOBYTE(v20.var0) = 0;
      if (getVariantVal(v8, 18, 0, &v20)) {
        [(PDMediaNode *)v16 setIsShowWhenStopped:LOBYTE(v20.var0) == 0];
      }
      *(unsigned __int16 **)((char *)&v19.var1 + 1) = 0;
      if (getVariantVal(v8, 15, 1, (CsString *)((char *)&v19.var1 + 1))) {
        [(PDMediaNode *)v16 setNumberOfSlides:*(unsigned __int16 **)((char *)&v19.var1 + 1)];
      }
      *(void ***)((char *)&v19.var0 + 1) = 0;
      if (getVariantVal(v8, 22, 2, (CsString *)((char *)&v19.var0 + 1))) {
        [(PDMediaNode *)v16 setVolume:(uint64_t)*(double *)((char *)&v19.var0 + 1)];
      }
      LOBYTE(v19.var0) = 0;
      if (getVariantVal(v8, 23, 0, &v19)) {
        [(PDMediaNode *)v16 setIsMuted:LOBYTE(v19.var0)];
      }
    }
    [a1 parseTargetContainerHolder:v8 setTargetObj:v16 state:v10];
  }
LABEL_9:

  return v16;
}

+ (void)parseTimeConditionsHolder:(id)a3 commonData:(id)a4
{
  id v16 = a3;
  id v15 = a4;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [v16 firstChildOfType:61733];
  if (v6)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v7 = [v6 firstChildOfType:61736];
      id v8 = v7;
      if (v7)
      {
        uint64_t v10 = v9[13];
        uint64_t v11 = v9[15];
        id v12 = objc_alloc_init(PDTimeCondition);
        [(PDTimeCondition *)v12 setTriggerEvent:v10];
        [(PDTimeCondition *)v12 setDelay:v11];
        [v5 addObject:v12];
      }
      uint64_t v13 = objc_msgSend(v16, "firstChildOfType:afterChild:", 61733, v6, v15);

      v6 = (void *)v13;
    }
    while (v13);
  }
  unsigned int v14 = v15;
  objc_msgSend(v15, "setStartTimeConditions:", v5, v15);
}

+ (void)parseAnimateBehaviorContainer:(id)a3 animBehavior:(id)a4 timeNode:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [a3 firstChildOfType:61748];
  if (v8) {
    [v7 setTimeBehavior:v9];
  }
}

+ (id)newColorFromBehaviorColor:(PptAnimColorBehavior_Color_Struct *)a3
{
  unsigned int var0 = a3->var0;
  if (!a3->var0) {
    goto LABEL_5;
  }
  if (var0 == 2)
  {
    uint64_t v13 = [OADIndexedColor alloc];
    uint64_t var1 = a3->var1;
    return [(OADIndexedColor *)v13 initWithIndex:var1];
  }
  else
  {
    if (var0 == 1)
    {
      uint64_t v16 = 0;
      float v15 = 0.0;
      convertHslToRgb((float)a3->var1, (float)a3->var2, (float)a3->var3, (float *)&v16 + 1, (float *)&v16, &v15);
      unsigned int v5 = *((float *)&v16 + 1);
      unsigned int v6 = *(float *)&v16;
      a3->unsigned int var0 = 0;
      a3->uint64_t var1 = v5;
      unsigned int v7 = v15;
      a3->var2 = v6;
      a3->var3 = v7;
LABEL_5:
      id v8 = [OADRgbColor alloc];
      *(float *)&double v9 = (float)a3->var1;
      *(float *)&double v10 = (float)a3->var2;
      *(float *)&double v11 = (float)a3->var3;
      return [(OADRgbColor *)v8 initWithRed:v9 green:v10 blue:v11];
    }
    return 0;
  }
}

+ (void)parseColorBehaviorContainer:(id)a3 colorBehavior:(id)a4 timeNode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 firstChildOfType:61749];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = (const void *)[v11 eshObject];
    if (v13) {
    else
    }
      unsigned int v14 = 0;
    char v15 = v14[45];
    if ((v15 & 2) != 0)
    {
      *(_OWORD *)((char *)&v19.var0 + 4) = *((_OWORD *)v14 + 4);
      uint64_t v17 = [a1 newColorFromBehaviorColor:(char *)&v19.var0 + 4];
      [v9 setFrom:v17];
      char v15 = v14[45];
      uint64_t v16 = (void *)v17;
      if ((v15 & 4) == 0)
      {
LABEL_7:
        if ((v15 & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v16 = 0;
      if ((v14[45] & 4) == 0) {
        goto LABEL_7;
      }
    }
    *(_OWORD *)((char *)&v19.var0 + 4) = *((_OWORD *)v14 + 5);
    uint64_t v18 = [a1 newColorFromBehaviorColor:(char *)&v19.var0 + 4];

    [v9 setTo:v18];
    char v15 = v14[45];
    uint64_t v16 = (void *)v18;
    if ((v15 & 8) == 0)
    {
LABEL_8:
      if ((v15 & 0x10) == 0)
      {
LABEL_17:
        [v10 setColorBehavior:v9];

        goto LABEL_18;
      }
LABEL_15:
      LODWORD(v19.var0) = 0;
      if (getVariantVal(v8, 5, 1, &v19)) {
        [v9 setDirection:LODWORD(v19.var0)];
      }
      goto LABEL_17;
    }
LABEL_12:
    LODWORD(v19.var0) = 0;
    if (getVariantVal(v8, 4, 1, &v19)) {
      [v9 setColorSpace:LODWORD(v19.var0)];
    }
    if ((v14[45] & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_18:
}

+ (void)parseEffectBehaviorContainer:(id)a3 effectBehavior:(id)a4 timeNode:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v12 firstChildOfType:61750];
  id v10 = v9;
  if (v9)
  {
    double v11 = (unsigned int *)[v9 eshObject];
    if (v11) {
    if (*((unsigned char *)v11 + 45))
    }
      [v7 setTransition:v11[12]];
    [v8 setEffectBehavior:v7];
  }
}

+ (void)parseMotionBehaviorContainer:(id)a3 motionBehavior:(id)a4 timeNode:(id)a5
{
  id v26 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v26 firstChildOfType:61751];
  id v10 = v9;
  if (!v9) {
    goto LABEL_33;
  }
  double v11 = (const void *)[v9 eshObject];
  if (v11) {
  else
  }
    id v12 = 0;
  char v13 = *((unsigned char *)v12 + 45);
  if (v13)
  {
    objc_msgSend(v7, "setBy:", v12[12], v12[13]);
    char v13 = *((unsigned char *)v12 + 45);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(v7, "setFrom:", v12[14], v12[15]);
    char v13 = *((unsigned char *)v12 + 45);
  }
  if ((v13 & 4) != 0)
  {
    objc_msgSend(v7, "setTo:", v12[16], v12[16]);
    char v13 = *((unsigned char *)v12 + 45);
  }
  if ((v13 & 8) != 0) {
    [v7 setOriginType:*((_DWORD *)v12 + 17) != 2];
  }
  unsigned int v14 = [v26 firstChildOfType:61762];
  char v15 = v14;
  if (v14)
  {
    uint64_t v16 = (const void *)[v14 eshObject];
    if (v16)
    {

      if (!v17 || EshRecord::getInstance(v17) != 1 || *((_DWORD *)v17 + 12) != 3) {
        goto LABEL_20;
      }
      char v15 = [NSString stringWithCsString:getStreamInfo((uint64_t)v17)];
      uint64_t v18 = +[PDAnimateMotionBehavior bezierPathFromNSString:v15];
      [v7 setPath:v18];
    }
  }

LABEL_20:
  char v19 = *((unsigned char *)v12 + 45);
  if ((v19 & 0x40) != 0)
  {
    CsString v20 = [v26 firstChildOfType:61757];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [v20 childOfType:61762 instance:7];
        if ((*(unsigned int (**)(PptAnimVariantAtom *))(*(void *)v22 + 16))(v22) == 2) {
          [v7 setAngle:PptAnimVariantAtom::getReal(v22)];
        }
      }
    }

    char v19 = *((unsigned char *)v12 + 45);
  }
  if (v19 < 0)
  {
    v23 = [v26 firstChildOfType:61757];
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = [v23 childOfType:61762 instance:10];
        (*(void (**)(void *))(*(void *)v25 + 16))(v25);
      }
    }
  }
  [v8 setMotionBehavior:v7];
LABEL_33:
}

+ (void)parseRotationBehaviorContainer:(id)a3 rotationBehavior:(id)a4 timeNode:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v14 firstChildOfType:61752];
  id v10 = v9;
  if (v9)
  {
    double v11 = (const void *)[v9 eshObject];
    if (v11) {
    else
    }
      id v12 = 0;
    char v13 = *((unsigned char *)v12 + 45);
    if (v13)
    {
      [v7 setBy:(float)(v12[12] * 60000.0)];
      char v13 = *((unsigned char *)v12 + 45);
    }
    if ((v13 & 2) != 0)
    {
      [v7 setFrom:(float)(v12[13] * 60000.0)];
      char v13 = *((unsigned char *)v12 + 45);
    }
    if ((v13 & 4) != 0) {
      [v7 setTo:(float)(v12[14] * 60000.0)];
    }
    [v8 setRotateBehavior:v7];
  }
}

+ (void)parseCmdBehaviorContainer:(id)a3 cmdBehavior:(id)a4 timeNode:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v12 firstChildOfType:61755];
  id v10 = v9;
  if (v9)
  {
    double v11 = (unsigned int *)[v9 eshObject];
    if (v11) {
    if (*((unsigned char *)v11 + 45))
    }
      [v7 setBehaviorType:v11[12]];
    [v8 setCmdBehavior:v7];
  }
}

+ (void)parseTimeNodeVariants:(id)a3 commonData:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  unsigned int v6 = [v21 childOfType:61762 instance:9];
  id v7 = v6;
  if (v6)
  {
    if (*((_DWORD *)v8 + 12) == 1) {
      [v5 setPresetId:PptAnimVariantAtom::getInteger(v8)];
    }
  }
  id v9 = [v21 childOfType:61762 instance:10];
  id v10 = v9;
  if (v9)
  {
    if (*((_DWORD *)v11 + 12) == 1) {
      [v5 setPresetSubType:PptAnimVariantAtom::getInteger(v11)];
    }
  }
  id v12 = [v21 childOfType:61762 instance:11];
  char v13 = v12;
  if (v12)
  {
    if (*((_DWORD *)v14 + 12) == 1) {
      [v5 setAnimationPresetClass:PptAnimVariantAtom::getInteger(v14)];
    }
  }
  char v15 = [v21 childOfType:61762 instance:19];
  uint64_t v16 = v15;
  if (v15)
  {
    if (*((_DWORD *)v17 + 12) == 1) {
      [v5 setGroupIdValue:PptAnimVariantAtom::getInteger(v17)];
    }
  }
  uint64_t v18 = [v21 childOfType:61762 instance:20];
  char v19 = v18;
  if (v18)
  {
    if (*((_DWORD *)v20 + 12) == 1) {
      [v5 setType:PptAnimVariantAtom::getInteger(v20)];
    }
  }
}

+ (unint64_t)paragraphIndexFromBinaryTextBytesCharacterIndex:(unint64_t)a3 srcDrawable:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = TSUDynamicCast(v6, (uint64_t)v5);
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 textBody];
    unint64_t v10 = 0;
    for (unint64_t i = 0; i < [v9 paragraphCount] && v10 <= a3; ++i)
    {
      id v12 = [v9 paragraphAtIndex:i];
      v10 += [v12 characterCount] + 1;
    }
  }
  else
  {
    unint64_t i = 0;
  }

  return i - 1;
}

+ (void)parseTargetContainerHolder:(id)a3 setTargetObj:(id)a4 state:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v19 firstChildOfType:61756];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v11 = [v10 firstChildOfType:11003];
      id v12 = v11;
      if (v11)
      {
        char v13 = (const void *)[v11 eshObject];
        if (v13) {
        else
        }
          id v14 = 0;
        char v15 = 0;
        int v16 = v14[12];
        uint64_t v17 = v14[14];
        switch(v16)
        {
          case 0:
          case 4:
          case 6:
            uint64_t v18 = [v9 drawableOnTgtSlideForShapeId:v17];
            if (!v18) {
              goto LABEL_17;
            }
            char v15 = objc_alloc_init(PDAnimationShapeTarget);
            [(PDAnimationShapeTarget *)v15 setDrawable:v18];
            goto LABEL_18;
          case 1:
            char v15 = objc_alloc_init(PDSlideTarget);
            if (!v15) {
              break;
            }
            goto LABEL_19;
          case 2:
          case 8:
            uint64_t v18 = [v9 drawableOnTgtSlideForShapeId:v17];
            if (!v18) {
              goto LABEL_17;
            }
            char v15 = objc_alloc_init(PDAnimationTextTarget);
            [(PDAnimationShapeTarget *)v15 setDrawable:v18];
            if (v16 == 2) {
              -[PDAnimationTextTarget setRange:](v15, "setRange:", [a1 paragraphIndexFromBinaryTextBytesCharacterIndex:v14[15] srcDrawable:v18], 1);
            }
            goto LABEL_18;
          case 3:
            uint64_t v18 = [v9 drawableOnTgtSlideForShapeId:v17];
            if (!v18) {
              goto LABEL_17;
            }
            char v15 = objc_alloc_init(PDAnimationSoundTarget);
            [(PDAnimationShapeTarget *)v15 setDrawable:v18];
            goto LABEL_18;
          case 5:
            uint64_t v18 = [v9 drawableOnTgtSlideForShapeId:v17];
            if (v18)
            {
              char v15 = objc_alloc_init(PDAnimationOleChartTarget);
              [(PDAnimationShapeTarget *)v15 setDrawable:v18];
              [(PDAnimationTextTarget *)v15 setLevel:v14[16]];
              [(PDAnimationTextTarget *)v15 setChartSubElementType:v14[15]];
            }
            else
            {
LABEL_17:
              char v15 = 0;
            }
LABEL_18:

            if (v15)
            {
LABEL_19:
              if (objc_opt_respondsToSelector()) {
                [v8 performSelector:sel_setTarget_ withObject:v15];
              }
            }
            break;
          default:
            break;
        }
      }
    }
  }
}

+ (id)newParaBuild:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 {
    && (id v5 = (const void *)[v3 eshObject]) != 0
  }
  {
    id v7 = v6;
    id v8 = objc_alloc_init(PDParagraphBuild);
    id v9 = v8;
    double v10 = 0.0;
    if (v7[59]) {
      double v10 = 1.0;
    }
    [(PDParagraphBuild *)v8 setAutoAdvanceTime:v10];
    [(PDParagraphBuild *)v9 setIsReversedParagraphOrder:v7[57]];
    [(PDParagraphBuild *)v9 setBuildLevel:*((unsigned int *)v7 + 13)];
    int v11 = *((_DWORD *)v7 + 12);
    if (v11 == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11 == 2;
    }
    [(PDParagraphBuild *)v9 setType:v12];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)newChartBuild:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 {
    && (id v5 = (const void *)[v3 eshObject]) != 0
  }
  {
    id v7 = v6;
    id v8 = [[PDChartBuild alloc] initWithBuildType:v6[12]];
    [(PDBuild *)v8 setIsAnimateBackground:*((unsigned __int8 *)v7 + 52)];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)parseBuildList:(id)a3 buildMap:(id)a4 state:(id)a5
{
  id v30 = a3;
  id v28 = a4;
  id v7 = a5;
  id v27 = v7;
  uint64_t v8 = [v30 childCount];
  if (v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [v30 childAt:v9];
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
LABEL_22:

      if (v8 == ++v9) {
        goto LABEL_23;
      }
    }
    uint64_t v11 = [v10 eshObject];
    int v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
    if (v12 == 11012)
    {
      char v13 = [v10 firstChildOfType:11013];
      uint64_t v14 = [a1 newChartBuild:v13];
    }
    else
    {
      if (v12 != 11016)
      {
        char v15 = 0;
        goto LABEL_11;
      }
      char v13 = [v10 firstChildOfType:11017];
      uint64_t v14 = [a1 newParaBuild:v13];
    }
    char v15 = (void *)v14;

LABEL_11:
    int v16 = [v10 firstChildOfType:11011];
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = (const void *)[v16 eshObject];
      if (v18) {
      else
      }
        id v19 = 0;
      uint64_t v21 = [v7 drawableForShapeId:v19[12]];
      CsString v20 = (void *)v21;
      if (v15 && v21)
      {
        uint64_t v22 = v19[14];
        if ((v22 & 0x80000000) == 0)
        {
          v23 = [PDBuildMapKey alloc];
          id v24 = [NSNumber numberWithInt:v22];
          id v25 = [v24 stringValue];
          id v26 = [(PDBuildMapKey *)v23 initWithDrawable:v20 groupId:v25];

          [v28 setObject:v15 forUncopiedKey:v26];
        }
        id v7 = v27;
      }
    }
    else
    {
      CsString v20 = 0;
    }

    goto LABEL_22;
  }
LABEL_23:
}

@end