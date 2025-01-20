@interface NSValue(TSDMixingAdditions)
- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:;
- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions;
@end

@implementation NSValue(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  if ([a1 isEqualToValue:TSUCheckedDynamicCast()]) {
    return 5;
  }
  if (!strcmp((const char *)[a1 objCType], (const char *)objc_msgSend(a1, "objCType"))) {
    return 3;
  }
  return 1;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!strcmp((const char *)[a1 objCType], "{CGPoint=dd}"))
  {
    [a1 CGPointValue];
    [v4 CGPointValue];
    v9 = (void *)MEMORY[0x263F08D40];
    TSUMixPoints();
    return objc_msgSend(v9, "valueWithCGPoint:");
  }
  else if (!strcmp((const char *)[a1 objCType], "{CGSize=dd}"))
  {
    [a1 CGSizeValue];
    [v4 CGSizeValue];
    v10 = (void *)MEMORY[0x263F08D40];
    TSUMixSizes();
    return objc_msgSend(v10, "valueWithCGSize:");
  }
  else if (!strcmp((const char *)[a1 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    [a1 CGRectValue];
    [v4 CGRectValue];
    v11 = (void *)MEMORY[0x263F08D40];
    TSUMixRects();
    return objc_msgSend(v11, "valueWithCGRect:");
  }
  else if (!strcmp((const char *)[a1 objCType], "{CGAffineTransform=dddddd}"))
  {
    long long v12 = 0uLL;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    if (a1)
    {
      [a1 CGAffineTransformValue];
      long long v12 = 0uLL;
    }
    long long v36 = v12;
    long long v37 = v12;
    long long v35 = v12;
    if (v4) {
      [v4 CGAffineTransformValue];
    }
    v13 = (void *)MEMORY[0x263F08D40];
    long long v27 = v43;
    long long v28 = v44;
    long long v29 = v45;
    long long v19 = v35;
    long long v20 = v36;
    long long v21 = v37;
    TSDTransformMixAffineTransforms(&v27, &v19, (uint64_t)v51, a2);
    return [v13 valueWithCGAffineTransform:v51];
  }
  else if (!strcmp((const char *)[a1 objCType], "{CATransform3D=dddddddddddddddd}"))
  {
    long long v14 = 0uLL;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    if (a1)
    {
      [a1 CATransform3DValue];
      long long v14 = 0uLL;
    }
    long long v41 = v14;
    long long v42 = v14;
    long long v39 = v14;
    long long v40 = v14;
    long long v37 = v14;
    long long v38 = v14;
    long long v35 = v14;
    long long v36 = v14;
    if (v4) {
      [v4 CATransform3DValue];
    }
    long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v32 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v33 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v34 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v27 = *MEMORY[0x263F15740];
    long long v28 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v30 = v18;
    MEMORY[0x223CB6AA0](&v27, &v43, &v35, a2);
    long long v23 = v31;
    long long v24 = v32;
    long long v25 = v33;
    long long v26 = v34;
    long long v19 = v27;
    long long v20 = v28;
    long long v21 = v29;
    long long v22 = v30;
    return [MEMORY[0x263F08D40] valueWithCATransform3D:&v19];
  }
  else
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[NSValue(TSDMixingAdditions) mixedObjectWithFraction:ofObject:]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"];
    [v5 handleFailureInFunction:v6, v7, 347, @"Unknown objcType in NSValue: %@", objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(a1, "objCType")) file lineNumber description];
    return 0;
  }
}

@end