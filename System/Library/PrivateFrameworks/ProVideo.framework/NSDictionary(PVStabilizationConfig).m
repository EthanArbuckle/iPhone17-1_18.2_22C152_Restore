@interface NSDictionary(PVStabilizationConfig)
- (id)arrayOfTimedStabilizationConfigsWithCleanAperture:()PVStabilizationConfig fillMode:;
- (id)timedStabilizationConfigWithCleanAperture:()PVStabilizationConfig cropRect:fillMode:;
@end

@implementation NSDictionary(PVStabilizationConfig)

- (id)timedStabilizationConfigWithCleanAperture:()PVStabilizationConfig cropRect:fillMode:
{
  id v20 = a1;
  v21 = [v20 objectForKeyedSubscript:@"rawTime"];

  if (v21
    && ([v20 objectForKeyedSubscript:@"homography"],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    memset(&v35, 0, sizeof(v35));
    CFDictionaryRef v23 = [v20 objectForKeyedSubscript:@"rawTime"];
    CMTimeMakeFromDictionary(&v35, v23);

    v24 = [v20 objectForKeyedSubscript:@"homography"];
    [v24 SIMDFloat3x3];
    double v32 = v26;
    double v33 = v25;
    double v31 = v27;

    v28 = +[PVStabilizationConfig configWithHomography:cleanAperture:cropRect:fillMode:](PVStabilizationConfig, "configWithHomography:cleanAperture:cropRect:fillMode:", a11, v33, v32, v31, a2, a3, a4, a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, *(void *)&a9);
    CMTime v34 = v35;
    v29 = +[PVTimedObject timedObjectWithTime:&v34 object:v28];
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)arrayOfTimedStabilizationConfigsWithCleanAperture:()PVStabilizationConfig fillMode:
{
  CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  rect.size = v12;
  id v13 = a1;
  CFDictionaryRef v14 = [v13 objectForKeyedSubscript:@"stabCropRect"];
  CGRectMakeWithDictionaryRepresentation(v14, &rect);

  v15 = [v13 objectForKeyedSubscript:@"frameInstructions"];

  if ([v15 count])
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = *(void *)"";
    v22 = __98__NSDictionary_PVStabilizationConfig__arrayOfTimedStabilizationConfigsWithCleanAperture_fillMode___block_invoke;
    CFDictionaryRef v23 = &unk_1E61696B8;
    double v25 = a2;
    double v26 = a3;
    double v27 = a4;
    double v28 = a5;
    CGRect v29 = rect;
    int v30 = a7;
    id v17 = v16;
    id v24 = v17;
    [v15 enumerateObjectsUsingBlock:&v20];
    if (objc_msgSend(v17, "count", v20, v21, v22, v23)) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

@end