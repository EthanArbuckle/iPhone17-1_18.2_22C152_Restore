@interface CALayer(TSDAdditions)
- (BOOL)hasPopInAnimation;
- (CGFloat)transform3DByApplyingAnimation:()TSDAdditions atTime:offset:parentFrame:animationCache:;
- (CGFloat)transformToScale:()TSDAdditions aroundBoundsPoint:afterOffset:;
- (CGImage)newRasterizedImageRef;
- (double)center;
- (double)durationOfAllAnimations;
- (double)frameIncludingSublayers;
- (double)opacityByApplyingAnimation:()TSDAdditions atTime:animationCache:;
- (double)p_perspectiveZDistanceUsingSize:()TSDAdditions;
- (double)transformToScale:()TSDAdditions aroundAnchorPoint:afterOffset:;
- (id)layerByAddingReflectionWithHeight:()TSDAdditions startOpacity:;
- (uint64_t)addDragRotationAnimationWithDelta:()TSDAdditions;
- (uint64_t)addFlipTransitionAnimationToLayer:()TSDAdditions;
- (uint64_t)addJiggleAnimation;
- (uint64_t)addJiggleAnimationWithDuration:()TSDAdditions angle:;
- (uint64_t)addPerspectiveProjection;
- (uint64_t)addPerspectiveSublayerProjectionUsingScreenSize:()TSDAdditions;
- (uint64_t)addPopInAnimation:()TSDAdditions;
- (uint64_t)addPopOutAnimation:()TSDAdditions;
- (uint64_t)addPulseAnimation;
- (uint64_t)addReflectionSubLayerWithHeight:()TSDAdditions startOpacity:;
- (uint64_t)addResetAnimation;
- (uint64_t)addResetAnimationWithDelegate:()TSDAdditions;
- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions;
- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions withScale:;
- (uint64_t)addRotateInAnimationWithDuration:()TSDAdditions delay:;
- (uint64_t)addSproingAnimationFromPoint:()TSDAdditions;
- (uint64_t)addWaveAnimation;
- (uint64_t)addWaveAnimationWithOffset:()TSDAdditions zPosition:;
- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:;
- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:addPerspectiveProjection:;
- (uint64_t)addZoomAnimation;
- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions;
- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions startingScale:;
- (uint64_t)addZoomDownAnimation;
- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions;
- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions endingScale:delay:;
- (uint64_t)animationDidStop:()TSDAdditions finished:;
- (uint64_t)pause;
- (uint64_t)pauseAtTime:()TSDAdditions;
- (uint64_t)removeAllAnimationsOnLayerTree;
- (uint64_t)removeDistortAnimation;
- (uint64_t)removeDragRotationAnimation;
- (uint64_t)removeFlipTransitionAnimation;
- (uint64_t)removeJiggleAnimation;
- (uint64_t)removePopInAnimation;
- (uint64_t)removePopOutAnimation;
- (uint64_t)removePulseAnimation;
- (uint64_t)removeResetAnimation;
- (uint64_t)removeRippleAnimation;
- (uint64_t)removeRotateInAnimation;
- (uint64_t)removeSproingAnimation;
- (uint64_t)removeWaveAnimation;
- (uint64_t)removeWaveAnimationAnimated:()TSDAdditions;
- (uint64_t)removeZoomAnimation;
- (uint64_t)removeZoomDownAnimation;
- (uint64_t)resume;
- (uint64_t)resumeAtTime:()TSDAdditions;
- (uint64_t)scale:()TSDAdditions aroundAnchorPoint:afterOffset:;
- (uint64_t)scale:()TSDAdditions aroundBoundsPoint:afterOffset:;
- (uint64_t)setIfDifferentFrame:()TSDAdditions orTransform:;
- (uint64_t)zoomDownAnimation;
- (void)addDistortAnimationWithVector:()TSDAdditions;
- (void)addRippleAnimationFromPosition:()TSDAdditions withScale:addPerspectiveProjection:;
- (void)bakedLayer;
@end

@implementation CALayer(TSDAdditions)

- (uint64_t)setIfDifferentFrame:()TSDAdditions orTransform:
{
  if ((TSDRectHasNaNComponents() & 1) != 0
    || (long long v11 = a6[1], v34 = *a6, v35 = v11, v36 = a6[2], TSDTransformHasNaNComponents()))
  {
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[CALayer(TSDAdditions) setIfDifferentFrame:orTransform:]"];
    return objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 74, @"Attempting to set frame or transform on layer with NaN values.");
  }
  else
  {
    [a1 anchorPoint];
    double v17 = TSDPointFromNormalizedRect(v15, v16, a2, a3, a4);
    double v19 = v18;
    double v20 = TSDRectWithSize();
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [a1 position];
    if (v28 != v17 || v27 != v19) {
      objc_msgSend(a1, "setPosition:", v17, v19);
    }
    [a1 bounds];
    v38.origin.x = v20;
    v38.origin.y = v22;
    v38.size.width = v24;
    v38.size.height = v26;
    if (!CGRectEqualToRect(v37, v38)) {
      objc_msgSend(a1, "setBounds:", v20, v22, v24, v26);
    }
    if (a1) {
      [a1 affineTransform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v29 = a6[1];
    *(_OWORD *)&t2.a = *a6;
    *(_OWORD *)&t2.c = v29;
    *(_OWORD *)&t2.tx = a6[2];
    uint64_t result = CGAffineTransformEqualToTransform(&t1, &t2);
    if ((result & 1) == 0)
    {
      long long v30 = a6[1];
      v31[0] = *a6;
      v31[1] = v30;
      v31[2] = a6[2];
      return [a1 setAffineTransform:v31];
    }
  }
  return result;
}

- (id)layerByAddingReflectionWithHeight:()TSDAdditions startOpacity:
{
  if (a2 < 0.0 || a2 > 1.0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[CALayer(TSDAdditions) layerByAddingReflectionWithHeight:startOpacity:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 94, @"Height should be in unit coordinate space [0,1]!");
  }
  if (a2 == 0.0)
  {
    v9 = (void *)[a1 copy];
    return v9;
  }
  else
  {
    [a1 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17 * a2;
    double v19 = (double)(uint64_t)(v17 * a2);
    double v20 = v17 + v19;
    double v21 = (CGImage *)[a1 newRasterizedImageRef];
    double v22 = TSDBitmapContextCreate(3, v16);
    if (v22)
    {
      double v23 = v22;
      uint64_t v24 = (uint64_t)v18;
      CGContextTranslateCTM(v22, 0.0, v19);
      [a1 bounds];
      CGContextDrawImage(v23, v38, v21);
      CGContextScaleCTM(v23, 1.0, -1.0);
      [a1 bounds];
      CGContextDrawImage(v23, v39, v21);
      Data = (char *)CGBitmapContextGetData(v23);
      size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v23);
      uint64_t v27 = (uint64_t)v18 - 1;
      if ((uint64_t)v18 >= 1)
      {
        uint64_t v28 = BytesPerRow;
        uint64_t v29 = 0;
        do
        {
          double v30 = pow((double)(v27 - v29) / (double)v27, 1.8);
          [a1 frame];
          if (v28 >= 1)
          {
            double v32 = v31 + (double)v29;
            v33 = &Data[v28 * (uint64_t)v32];
            uint64_t v34 = v28;
            do
            {
              LOBYTE(v32) = *v33;
              double v32 = v30 * a3 * (double)*(unint64_t *)&v32;
              *v33++ = (int)v32;
              --v34;
            }
            while (v34);
          }
          ++v29;
        }
        while (v29 != v24);
      }
      Image = CGBitmapContextCreateImage(v23);
      CGContextRelease(v23);
    }
    else
    {
      Image = 0;
    }
    CGImageRelease(v21);
    long long v36 = (void *)[MEMORY[0x263F157E8] layer];
    objc_msgSend(v36, "setFrame:", v12, v14, v16, v20);
    [v36 setContents:Image];
    CGImageRelease(Image);
    return v36;
  }
}

- (uint64_t)addReflectionSubLayerWithHeight:()TSDAdditions startOpacity:
{
  v5 = (void *)result;
  if (a2 < 0.0 || a2 > 1.0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[CALayer(TSDAdditions) addReflectionSubLayerWithHeight:startOpacity:]"];
    uint64_t result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 150, @"Height should be in unit coordinate space [0,1]!");
  }
  if (a2 != 0.0)
  {
    v9 = (void *)[MEMORY[0x263F157E8] layer];
    [v5 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v5 contentsRect];
    double v48 = v18;
    double v49 = v19;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    CGRectGetMinX(v51);
    v52.origin.x = v11;
    v52.origin.y = v13;
    v52.size.width = v15;
    v52.size.height = v17;
    CGRectGetMaxX(v52);
    TSUMix();
    double v21 = v20;
    v53.origin.x = v11;
    v53.origin.y = v13;
    v53.size.width = v15;
    v53.size.height = v17;
    CGRectGetMinY(v53);
    v54.origin.x = v11;
    v54.origin.y = v13;
    v54.size.width = v15;
    v54.size.height = v17;
    CGRectGetMaxY(v54);
    TSUMix();
    double v23 = TSDRoundedRect(v21, v22, v15 * v49, v17 * v48 * a2);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    size_t v30 = (unint64_t)v28;
    size_t v31 = (unint64_t)v26;
    size_t v32 = 4 * (unint64_t)v26;
    v33 = malloc_type_calloc(v32, (unint64_t)v28, 0x1DE55C1FuLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    long long v35 = CGBitmapContextCreate(v33, v31, v30, 8uLL, v32, DeviceRGB, 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGContextTranslateCTM(v35, 0.0, (double)(unint64_t)v29);
    CGContextScaleCTM(v35, 1.0, -1.0);
    long long v36 = (CGImage *)[v5 contents];
    [v5 frame];
    CGContextDrawImage(v35, v55, v36);
    if (v30)
    {
      uint64_t v37 = 0;
      CGRect v38 = v33;
      do
      {
        double v39 = pow((double)(v30 - 1 - v37) / (double)(v30 - 1), 1.8);
        if (v32)
        {
          double v41 = v39 * a3;
          v42 = v38;
          size_t v43 = v32;
          do
          {
            LOBYTE(v40) = *v42;
            double v40 = v41 * (double)*(unint64_t *)&v40;
            *v42++ = (int)v40;
            --v43;
          }
          while (v43);
        }
        ++v37;
        v38 += v32;
      }
      while (v37 != v30);
    }
    Image = CGBitmapContextCreateImage(v35);
    [v9 setContents:Image];
    CGImageRelease(Image);
    CGContextRelease(v35);
    free(v33);
    objc_msgSend(v9, "setFrame:", v23, v25, v27, v29);
    [v5 bounds];
    double MidX = CGRectGetMidX(v56);
    [v5 bounds];
    double MaxY = CGRectGetMaxY(v57);
    [v9 frame];
    objc_msgSend(v9, "setPosition:", MidX, MaxY + v47 * 0.5);
    objc_msgSend(v9, "setName:", objc_msgSend((id)objc_msgSend(v5, "name"), "stringByAppendingString:", @"-reflection"));
    [v5 addSublayer:v9];
    return [v5 setShouldRasterize:1];
  }
  return result;
}

- (double)p_perspectiveZDistanceUsingSize:()TSDAdditions
{
  if (a1 >= a2) {
    a1 = a2;
  }
  return a1 * 2.64490471;
}

- (uint64_t)addPerspectiveProjection
{
  v2 = (void *)[MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [v2 scale];
  double v8 = v7;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (a1) {
    [a1 transform];
  }
  objc_msgSend(a1, "p_perspectiveZDistanceUsingSize:", TSDMultiplySizeScalar(v4, v6, v8));
  *((double *)&v17 + 1) = -1.0 / v9;
  v11[6] = v18;
  v11[7] = v19;
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  return [a1 setTransform:v11];
}

- (uint64_t)addPerspectiveSublayerProjectionUsingScreenSize:()TSDAdditions
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (a1) {
    [a1 sublayerTransform];
  }
  objc_msgSend(a1, "p_perspectiveZDistanceUsingSize:", a2, a3);
  *((double *)&v14 + 1) = -1.0 / v6;
  v8[6] = v15;
  v8[7] = v16;
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  v8[4] = v13;
  v8[5] = v14;
  return [a1 setSublayerTransform:v8];
}

- (double)durationOfAllAnimations
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(a1, "animationKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v15;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v2);
      }
      double v8 = (void *)[a1 animationForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      [v8 beginTime];
      double v10 = v9;
      [v8 duration];
      double v12 = v10 + v11;
      if (v6 <= v12) {
        double v6 = v12;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v4);
  return v6;
}

- (uint64_t)removeAllAnimationsOnLayerTree
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [a1 removeAllAnimations];
  uint64_t result = [a1 sublayers];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = objc_msgSend(a1, "sublayers", 0);
    uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeAllAnimationsOnLayerTree];
        }
        while (v4 != v6);
        uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (CGFloat)transform3DByApplyingAnimation:()TSDAdditions atTime:offset:parentFrame:animationCache:
{
  if ((void *)[a3 animation] != a2)
  {
    double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[CALayer(TSDAdditions) transform3DByApplyingAnimation:atTime:offset:parentFrame:animationCache:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 293, @"Animation is different from animationCache!");
  }
  [a3 transformRotationXInitialValue];
  double v14 = v13;
  [a3 transformRotationYInitialValue];
  double v16 = v15;
  [a3 transformRotationZInitialValue];
  double v18 = v17;
  if ([a3 transformRotationXAnimationExists])
  {
    [a3 transformRotationXCachedValueAtTime:a1 layer:a2 animation:a5];
    double v14 = v19;
  }
  if ([a3 transformRotationYAnimationExists])
  {
    [a3 transformRotationYCachedValueAtTime:a1 layer:a2 animation:a5];
    double v16 = v20;
  }
  if ([a3 transformRotationZAnimationExists])
  {
    [a3 transformRotationZCachedValueAtTime:a1 layer:a2 animation:a5];
    double v18 = v21;
  }
  CGFloat v188 = v16;
  CGFloat v185 = v14;
  if ([a3 transformRotationAnimationExists])
  {
    if (v18 != 0.0)
    {
      CGFloat v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[CALayer(TSDAdditions) transform3DByApplyingAnimation:atTime:offset:parentFrame:animationCache:]"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CALayerAdditions.mm"), 313, @"Found multiple rotation animations!");
    }
    [a3 transformRotationCachedValueAtTime:a1 layer:a2 animation:a5];
    double v18 = v24;
  }
  [a3 anchorPointInitialValue];
  double v26 = v25;
  double v28 = v27;
  double v29 = (double *)MEMORY[0x263F00148];
  double v30 = *MEMORY[0x263F00148];
  double v31 = *(double *)(MEMORY[0x263F00148] + 8);
  if ([a3 anchorPointAnimationExists])
  {
    objc_msgSend((id)objc_msgSend(a2, "TSD_valueForKeyPath:atTime:animationCache:", @"anchorPoint", a3, a5), "CGPointValue");
    double v26 = v32;
    double v28 = v33;
    [a3 anchorPointInitialValue];
    double v30 = TSDSubtractPoints(v26, v28, v34);
    double v31 = -v35;
  }
  [a3 anchorPointZInitialValue];
  double tz = v36;
  int v37 = [a3 anchorPointZAnimationExists];
  CGFloat v189 = v18;
  double v187 = v30;
  double v180 = v26;
  double v181 = v28;
  if (v37)
  {
    [a3 anchorPointZCachedValueAtTime:a1 layer:a2 animation:a5];
    double tz = v38;
  }
  [a3 boundsInitialValue];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v45 = *v29;
  double v46 = v29[1];
  int v47 = [a3 boundsAnimationExists];
  double v48 = 1.0;
  double v49 = 1.0;
  double v191 = v44;
  double v192 = v42;
  double v193 = v42;
  if (v47)
  {
    objc_msgSend(a3, "boundsCachedValueAtTime:layer:animation:", a1, a2, a5, 1.0);
    double v51 = v50;
    double v53 = v52;
    double v45 = TSDSubtractPoints(v54, v55, v40);
    double v46 = v56;
    double v193 = v51;
    double v48 = v51 / v192;
    double v49 = v53 / v191;
  }
  double v57 = 1.0;
  double v58 = 1.0;
  if (objc_msgSend(a3, "transformScaleXYAnimationExists", *(void *)&v48, *(void *)&v49))
  {
    [a3 transformScaleXYCachedValueAtTime:a1 layer:a2 animation:a5];
    double v58 = TSDMultiplySizeScalar(1.0, 1.0, v59);
    double v57 = v60;
  }
  if ([a3 transformScaleXAnimationExists])
  {
    [a3 transformScaleXCachedValueAtTime:a1 layer:a2 animation:a5];
    double v58 = v58 * v61;
  }
  double v186 = v31;
  double v183 = v46;
  if ([a3 transformScaleYAnimationExists])
  {
    [a3 transformScaleYCachedValueAtTime:a1 layer:a2 animation:a5];
    double v57 = v57 * v62;
  }
  double v63 = *v29;
  double v64 = v29[1];
  if ([a3 positionAnimationExists])
  {
    [a3 positionInitialValue];
    double v66 = v65;
    [a3 positionCachedValueAtTime:a1 layer:a2 animation:a5];
    double v63 = TSDSubtractPoints(v67, v68, v66);
    double v64 = v69;
  }
  double v184 = v45;
  double v70 = 0.0;
  if ([a3 zPositionAnimationExists])
  {
    [a3 zPositionInitialValue];
    double v72 = v71;
    [a3 zPositionCachedValueAtTime:a1 layer:a2 animation:a5];
    double v70 = v73 - v72;
  }
  [a3 transformTranslationInitialValue];
  double v75 = v74;
  if ([a3 transformTranslationAnimationExists])
  {
    [a3 transformTranslationCachedValueAtTime:a1 layer:a2 animation:a5];
    double v75 = v76;
  }
  double v77 = TSDAddPoints(v63, v64, v75);
  if ([a3 transformTranslationXAnimationExists])
  {
    [a3 transformTranslationXCachedValueAtTime:a1 layer:a2 animation:a5];
    double v77 = v77 + v78;
  }
  if ([a3 transformTranslationYAnimationExists]) {
    [a3 transformTranslationYCachedValueAtTime:a1 layer:a2 animation:a5];
  }
  if ([a3 transformTranslationZAnimationExists])
  {
    [a3 transformTranslationZCachedValueAtTime:a1 layer:a2 animation:a5];
    double v70 = v70 + v79;
  }
  v80 = (long long *)MEMORY[0x263F15740];
  double v81 = 1.0 - v181;
  long long v82 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  *(_OWORD *)&v212.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  *(_OWORD *)&v212.m33 = v82;
  long long v83 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v212.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  *(_OWORD *)&v212.m43 = v83;
  long long v84 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v212.m11 = *MEMORY[0x263F15740];
  *(_OWORD *)&v212.m13 = v84;
  long long v85 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v212.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  *(_OWORD *)&v212.m23 = v85;
  int v86 = [a3 transformAnimationExists];
  if (v86)
  {
    if (a3) {
      [a3 transformCachedValueAtTime:a1 layer:a2 animation:a5];
    }
    else {
      memset(&v211, 0, sizeof(v211));
    }
    CATransform3D v212 = v211;
  }
  double v182 = v77;
  double v87 = TSDMultiplyPointBySize(v180, v81, v192);
  double v89 = v88;
  double v90 = v178 * v58;
  long long v92 = v80[4];
  long long v91 = v80[5];
  double v93 = v179 * v57;
  long long v94 = v80[3];
  a4[4] = v92;
  a4[5] = v91;
  long long v96 = v80[6];
  long long v95 = v80[7];
  long long v97 = v80[5];
  a4[6] = v96;
  a4[7] = v95;
  long long v98 = v80[1];
  long long v99 = *v80;
  long long v100 = v98;
  *a4 = *v80;
  a4[1] = v98;
  long long v102 = v80[2];
  long long v101 = v80[3];
  a4[2] = v102;
  a4[3] = v101;
  *(_OWORD *)&a.m43 = v80[7];
  *(_OWORD *)&a.m41 = v96;
  *(_OWORD *)&a.m33 = v97;
  *(_OWORD *)&a.m31 = v92;
  *(_OWORD *)&a.m23 = v94;
  *(_OWORD *)&a.m21 = v102;
  *(_OWORD *)&a.m13 = v100;
  *(_OWORD *)&a.m11 = v99;
  CATransform3DMakeTranslation(&b, -v87, -v89, -tz);
  CATransform3DConcat(&v211, &a, &b);
  long long v103 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v103;
  long long v104 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v104;
  long long v105 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v105;
  long long v106 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v106;
  if (v90 != *MEMORY[0x263F001B0] || v93 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    long long v107 = a4[5];
    *(_OWORD *)&v208.m31 = a4[4];
    *(_OWORD *)&v208.m33 = v107;
    long long v108 = a4[7];
    *(_OWORD *)&v208.m41 = a4[6];
    *(_OWORD *)&v208.m43 = v108;
    long long v109 = a4[1];
    *(_OWORD *)&v208.m11 = *a4;
    *(_OWORD *)&v208.m13 = v109;
    long long v110 = a4[3];
    *(_OWORD *)&v208.m21 = a4[2];
    *(_OWORD *)&v208.m23 = v110;
    CATransform3DMakeScale(&v207, v90, v93, 1.0);
    CATransform3DConcat(&v211, &v208, &v207);
    long long v111 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v111;
    long long v112 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v112;
    long long v113 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v113;
    long long v114 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v114;
  }
  if (v185 != 0.0)
  {
    long long v115 = a4[5];
    *(_OWORD *)&v206.m31 = a4[4];
    *(_OWORD *)&v206.m33 = v115;
    long long v116 = a4[7];
    *(_OWORD *)&v206.m41 = a4[6];
    *(_OWORD *)&v206.m43 = v116;
    long long v117 = a4[1];
    *(_OWORD *)&v206.m11 = *a4;
    *(_OWORD *)&v206.m13 = v117;
    long long v118 = a4[3];
    *(_OWORD *)&v206.m21 = a4[2];
    *(_OWORD *)&v206.m23 = v118;
    CATransform3DMakeRotation(&v205, v185, -1.0, 0.0, 0.0);
    CATransform3DConcat(&v211, &v206, &v205);
    long long v119 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v119;
    long long v120 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v120;
    long long v121 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v121;
    long long v122 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v122;
  }
  if (v188 != 0.0)
  {
    long long v123 = a4[5];
    *(_OWORD *)&v204.m31 = a4[4];
    *(_OWORD *)&v204.m33 = v123;
    long long v124 = a4[7];
    *(_OWORD *)&v204.m41 = a4[6];
    *(_OWORD *)&v204.m43 = v124;
    long long v125 = a4[1];
    *(_OWORD *)&v204.m11 = *a4;
    *(_OWORD *)&v204.m13 = v125;
    long long v126 = a4[3];
    *(_OWORD *)&v204.m21 = a4[2];
    *(_OWORD *)&v204.m23 = v126;
    CATransform3DMakeRotation(&v203, v188, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v211, &v204, &v203);
    long long v127 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v127;
    long long v128 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v128;
    long long v129 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v129;
    long long v130 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v130;
  }
  if (v189 != 0.0)
  {
    long long v131 = a4[5];
    *(_OWORD *)&v202.m31 = a4[4];
    *(_OWORD *)&v202.m33 = v131;
    long long v132 = a4[7];
    *(_OWORD *)&v202.m41 = a4[6];
    *(_OWORD *)&v202.m43 = v132;
    long long v133 = a4[1];
    *(_OWORD *)&v202.m11 = *a4;
    *(_OWORD *)&v202.m13 = v133;
    long long v134 = a4[3];
    *(_OWORD *)&v202.m21 = a4[2];
    *(_OWORD *)&v202.m23 = v134;
    CATransform3DMakeRotation(&v201, v189, 0.0, 0.0, -1.0);
    CATransform3DConcat(&v211, &v202, &v201);
    long long v135 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v135;
    long long v136 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v136;
    long long v137 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v137;
    long long v138 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v138;
  }
  if (v86)
  {
    long long v139 = a4[5];
    *(_OWORD *)&v200.m31 = a4[4];
    *(_OWORD *)&v200.m33 = v139;
    long long v140 = a4[7];
    *(_OWORD *)&v200.m41 = a4[6];
    *(_OWORD *)&v200.m43 = v140;
    long long v141 = a4[1];
    *(_OWORD *)&v200.m11 = *a4;
    *(_OWORD *)&v200.m13 = v141;
    long long v142 = a4[3];
    *(_OWORD *)&v200.m21 = a4[2];
    *(_OWORD *)&v200.m23 = v142;
    CATransform3D v199 = v212;
    CATransform3DConcat(&v211, &v200, &v199);
    long long v143 = *(_OWORD *)&v211.m33;
    a4[4] = *(_OWORD *)&v211.m31;
    a4[5] = v143;
    long long v144 = *(_OWORD *)&v211.m43;
    a4[6] = *(_OWORD *)&v211.m41;
    a4[7] = v144;
    long long v145 = *(_OWORD *)&v211.m13;
    *a4 = *(_OWORD *)&v211.m11;
    a4[1] = v145;
    long long v146 = *(_OWORD *)&v211.m23;
    a4[2] = *(_OWORD *)&v211.m21;
    a4[3] = v146;
  }
  double v147 = 0.0;
  if (v37) {
    double v147 = -tz;
  }
  CGFloat v148 = v147 + v70;
  double v149 = TSDMultiplyPointScalar(v187, v186, -1.0);
  double v151 = TSDMultiplyPointBySize(v149, v150, v193);
  double v152 = TSDAddPoints(v184, v183, v151);
  double v154 = TSDAddPoints(v152, v153, a6);
  double v156 = TSDAddPoints(v154, v155, v182);
  CGFloat v158 = v157;
  long long v159 = a4[5];
  *(_OWORD *)&v198.m31 = a4[4];
  *(_OWORD *)&v198.m33 = v159;
  long long v160 = a4[7];
  *(_OWORD *)&v198.m41 = a4[6];
  *(_OWORD *)&v198.m43 = v160;
  long long v161 = a4[1];
  *(_OWORD *)&v198.m11 = *a4;
  *(_OWORD *)&v198.m13 = v161;
  long long v162 = a4[3];
  *(_OWORD *)&v198.m21 = a4[2];
  *(_OWORD *)&v198.m23 = v162;
  CATransform3DMakeTranslation(&v197, v87, v89, tz);
  CATransform3DConcat(&v211, &v198, &v197);
  long long v163 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v163;
  long long v164 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v164;
  long long v165 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v165;
  long long v166 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v166;
  long long v167 = *a4;
  long long v168 = a4[1];
  long long v169 = a4[3];
  *(_OWORD *)&v196.m21 = a4[2];
  *(_OWORD *)&v196.m23 = v169;
  *(_OWORD *)&v196.m11 = v167;
  *(_OWORD *)&v196.m13 = v168;
  long long v170 = a4[4];
  long long v171 = a4[5];
  long long v172 = a4[7];
  *(_OWORD *)&v196.m41 = a4[6];
  *(_OWORD *)&v196.m43 = v172;
  *(_OWORD *)&v196.m31 = v170;
  *(_OWORD *)&v196.m33 = v171;
  CATransform3DMakeTranslation(&v195, v156, v158, v148);
  CATransform3DConcat(&v211, &v196, &v195);
  long long v173 = *(_OWORD *)&v211.m33;
  a4[4] = *(_OWORD *)&v211.m31;
  a4[5] = v173;
  long long v174 = *(_OWORD *)&v211.m43;
  a4[6] = *(_OWORD *)&v211.m41;
  a4[7] = v174;
  long long v175 = *(_OWORD *)&v211.m13;
  *a4 = *(_OWORD *)&v211.m11;
  a4[1] = v175;
  CGFloat result = v211.m21;
  long long v177 = *(_OWORD *)&v211.m23;
  a4[2] = *(_OWORD *)&v211.m21;
  a4[3] = v177;
  return result;
}

- (double)opacityByApplyingAnimation:()TSDAdditions atTime:animationCache:
{
  [a1 opacity];
  if (!a4) {
    return v9;
  }

  [a5 opacityCachedValueAtTime:a1 layer:a4 animation:a2];
  return result;
}

- (uint64_t)addJiggleAnimation
{
  return [a1 addJiggleAnimationWithDuration:0.75 angle:0.628318531];
}

- (uint64_t)addJiggleAnimationWithDuration:()TSDAdditions angle:
{
  [a1 removeJiggleAnimation];
  double v22 = a2;
  double v6 = a2 * 7.0;
  if (a2 * 7.0 < 1.0) {
    double v6 = 1.0;
  }
  int v7 = (int)v6;
  long long v8 = (void *)[MEMORY[0x263EFF980] array];
  if (v7 >= 1)
  {
    int v9 = 0;
    double v10 = (double)v7;
    double v21 = 1.0 / (double)v7 * a2;
    double v11 = v21 * 0.5;
    uint64_t v12 = *MEMORY[0x263F15EB8];
    double v13 = 0.0;
    do
    {
      double v14 = v13 / v10 * v22;
      double v15 = (1.0 - v13 / v10) * a3;
      ++v9;
      double v13 = v13 + 1.0;
      double v16 = (1.0 - (double)v9 / v10) * a3;
      double v17 = objc_msgSend(MEMORY[0x263F15760], "animationWithKeyPath:", @"transform.rotation", *(void *)&v21);
      objc_msgSend(v17, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v15));
      objc_msgSend(v17, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", (v15 + v16) * -0.5));
      [v17 setBeginTime:v14];
      [v17 setDuration:v11];
      objc_msgSend(v17, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v12));
      [v8 addObject:v17];
      double v18 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation"];
      objc_msgSend(v18, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", (v15 + v16) * -0.5));
      objc_msgSend(v18, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v16));
      [v18 setBeginTime:v14 + v21 * 0.5];
      [v18 setDuration:v11];
      objc_msgSend(v18, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v12));
      [v8 addObject:v18];
    }
    while (v7 != v9);
  }
  id v19 = objc_alloc_init(MEMORY[0x263F15750]);
  [v19 setAnimations:v8];
  [v19 setDuration:v22];
  objc_msgSend(v19, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC8]));

  return [a1 addAnimation:v19 forKey:@"kTSDJiggleAnimationKey"];
}

- (uint64_t)removeJiggleAnimation
{
  return [a1 removeAnimationForKey:@"kTSDJiggleAnimationKey"];
}

- (uint64_t)addWaveAnimation
{
  return objc_msgSend(a1, "addWaveAnimationWithOffset:zPosition:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), 0.0);
}

- (uint64_t)addWaveAnimationWithOffset:()TSDAdditions zPosition:
{
  return objc_msgSend(a1, "addWaveAnimationWithScale:offset:zPosition:", 0.0, a3, a4, a5);
}

- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:
{
  return objc_msgSend(a1, "addWaveAnimationWithScale:offset:zPosition:addPerspectiveProjection:", 1);
}

- (uint64_t)addWaveAnimationWithScale:()TSDAdditions offset:zPosition:addPerspectiveProjection:
{
  [a1 removeWaveAnimation];
  if (a2 == 0.0) {
    double v13 = 0.2;
  }
  else {
    double v13 = a2 + -1.0;
  }
  double v14 = v13 * 0.25;
  if (v13 * 0.0625 >= 0.0125) {
    double v15 = 0.0196349541;
  }
  else {
    double v15 = v13 * 0.0625 * 1.57079633;
  }
  if (a7) {
    [a1 addPerspectiveProjection];
  }
  double v16 = v13 + v14;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceReferenceDate");
  double v18 = 1.0 - fmod(v17, 1.0);
  id v19 = (void *)[MEMORY[0x263EFF980] array];
  double v20 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v20, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v20, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v13 + v14));
  [v20 setDuration:v18];
  uint64_t v21 = *MEMORY[0x263F15EB8];
  objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  [v20 setAdditive:1];
  uint64_t v22 = *MEMORY[0x263F15AB0];
  [v20 setFillMode:*MEMORY[0x263F15AB0]];
  [v19 addObject:v20];
  uint64_t v23 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
  objc_msgSend(v23, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v15));
  [v23 setDuration:v18];
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v19 addObject:v23];
  if (a3 != 0.0)
  {
    double v24 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.x"];
    objc_msgSend(v24, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a3));
    [v24 setDuration:v18];
    objc_msgSend(v24, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
    [v24 setAdditive:1];
    [v24 setFillMode:v22];
    [v19 addObject:v24];
  }
  if (a4 != 0.0)
  {
    double v25 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.y"];
    objc_msgSend(v25, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a4));
    [v25 setDuration:v18];
    objc_msgSend(v25, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
    [v25 setAdditive:1];
    [v25 setFillMode:v22];
    [v19 addObject:v25];
  }
  double v26 = v13 - v14;
  if (a5 != 0.0)
  {
    double v27 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"zPosition"];
    objc_msgSend(v27, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", a5));
    objc_msgSend(v27, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a5));
    [v27 setDuration:v18];
    objc_msgSend(v27, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
    [v19 addObject:v27];
  }
  id v28 = objc_alloc_init(MEMORY[0x263F15750]);
  [v28 setAnimations:v19];
  [v28 setDuration:v18];
  double v29 = (void *)[MEMORY[0x263EFF980] array];
  double v30 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v30, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v16));
  objc_msgSend(v30, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v26));
  [v30 setDuration:0.5];
  [v30 setBeginTime:0.0];
  objc_msgSend(v30, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v30 setAdditive:1];
  [v29 addObject:v30];
  double v31 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v31, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v26));
  objc_msgSend(v31, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v16));
  [v31 setDuration:0.5];
  [v31 setBeginTime:0.5];
  objc_msgSend(v31, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v31 setAdditive:1];
  [v29 addObject:v31];
  double v32 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
  objc_msgSend(v32, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", -v15));
  [v32 setDuration:0.5];
  [v32 setBeginTime:0.0];
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v29 addObject:v32];
  double v33 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
  objc_msgSend(v33, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v15));
  [v33 setDuration:0.5];
  [v33 setBeginTime:0.5];
  objc_msgSend(v33, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v29 addObject:v33];
  double v34 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v34, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v15));
  [v34 setDuration:0.25];
  [v34 setBeginTime:0.0];
  objc_msgSend(v34, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  [v29 addObject:v34];
  double v35 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v35, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", -v15));
  [v35 setDuration:0.5];
  [v35 setBeginTime:0.25];
  objc_msgSend(v35, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v21));
  [v29 addObject:v35];
  double v36 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v36, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [v36 setDuration:0.25];
  [v36 setBeginTime:0.75];
  objc_msgSend(v36, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB0]));
  [v29 addObject:v36];
  if (a3 != 0.0)
  {
    int v37 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.x"];
    objc_msgSend(v37, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v37, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a3));
    [v37 setDuration:0.5];
    [v37 setFillMode:v22];
    [v37 setAdditive:1];
    [v29 addObject:v37];
  }
  if (a4 != 0.0)
  {
    double v38 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.y"];
    objc_msgSend(v38, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v38, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a4));
    [v38 setDuration:0.5];
    [v38 setFillMode:v22];
    [v38 setAdditive:1];
    [v29 addObject:v38];
  }
  if (a5 != 0.0)
  {
    double v39 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"zPosition"];
    objc_msgSend(v39, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", a5));
    objc_msgSend(v39, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a5));
    [v39 setDuration:0.5];
    [v39 setFillMode:v22];
    [v29 addObject:v39];
  }
  id v40 = objc_alloc_init(MEMORY[0x263F15750]);
  [v40 setAnimations:v29];
  [v40 setDuration:1.0];
  LODWORD(v41) = 1176256512;
  [v40 setRepeatCount:v41];
  [v40 setBeginTime:v18];
  id v42 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v42, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v28, v40, 0));
  [v42 setDuration:10000.0];

  return [a1 addAnimation:v42 forKey:@"kTSDWaveAnimationKey"];
}

- (uint64_t)removeWaveAnimationAnimated:()TSDAdditions
{
  if (a3)
  {
    uint64_t v4 = (void *)[a1 presentationLayer];
    objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", @"transform.rotation"), "doubleValue");
    double v6 = v5;
    objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", @"transform.scale"), "doubleValue");
    double v8 = v7;
    objc_msgSend((id)objc_msgSend(v4, "valueForKeyPath:", @"transform.scale"), "CGPointValue");
    double v10 = v9;
    double v12 = v11;
    [v4 zPosition];
    double v14 = v13;
    double v15 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
    [v15 setDuration:0.25];
    objc_msgSend(v15, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v8));
    objc_msgSend(v15, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
    double v16 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation"];
    [v16 setDuration:0.25];
    objc_msgSend(v16, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v6));
    objc_msgSend(v16, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
    long double v17 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation"];
    [v17 setDuration:0.25];
    objc_msgSend(v17, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v10, v12));
    objc_msgSend(v17, "setToValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)));
    double v18 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"zPosition"];
    [v18 setDuration:0.25];
    objc_msgSend(v18, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v14));
    objc_msgSend(v18, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v14));
    id v19 = objc_alloc_init(MEMORY[0x263F15750]);
    objc_msgSend(v19, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v15, v16, v18, 0));
    [a1 removeAnimationForKey:@"kTSDWaveAnimationKey"];
    return [a1 addAnimation:v19 forKey:@"kTSDWaveAnimationKey"];
  }
  else
  {
    return [a1 removeAnimationForKey:@"kTSDWaveAnimationKey"];
  }
}

- (uint64_t)removeWaveAnimation
{
  return [a1 removeWaveAnimationAnimated:0];
}

- (uint64_t)addPulseAnimation
{
  [a1 addPerspectiveProjection];
  v2 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v2, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.25));
  [v2 setDuration:0.5];
  uint64_t v3 = *MEMORY[0x263F15EB8];
  objc_msgSend(v2, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  id v4 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v4, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v2, 0));
  [v4 setDuration:1.0];
  double v5 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v5, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.25));
  objc_msgSend(v5, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.15));
  [v5 setDuration:0.5];
  [v5 setBeginTime:0.0];
  objc_msgSend(v5, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v3));
  double v6 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v6, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.15));
  objc_msgSend(v6, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.25));
  [v6 setDuration:0.5];
  [v6 setBeginTime:0.5];
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v3));
  id v7 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v7, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, v6, 0));
  [v7 setDuration:1.0];
  LODWORD(v8) = 1176256512;
  [v7 setRepeatCount:v8];
  [v7 setBeginTime:0.5];
  id v9 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v9, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, v7, 0));
  [v9 setDuration:10000.0];

  return [a1 addAnimation:v9 forKey:@"kTSDPulseAnimationKey"];
}

- (uint64_t)removePulseAnimation
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  v2 = (void *)[a1 presentationLayer];
  if (v2)
  {
    [v2 transform];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x263F15760], "animationWithKeyPath:", @"transform", v5, v6, v7, v8, v9, v10, v11, v12);
  [v3 setDuration:0.2];
  objc_msgSend(v3, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v3, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  [a1 removeAnimationForKey:@"kTSDPulseAnimationKey"];
  return [a1 addAnimation:v3 forKey:@"kTSDPulseAnimationKey"];
}

- (uint64_t)addDragRotationAnimationWithDelta:()TSDAdditions
{
  [a1 removeDragRotationAnimation];
  [a1 addPerspectiveProjection];
  double v6 = TSDPointLength(a2, a3);
  double v7 = TSDNormalizePoint(a2, a3);
  double v9 = v8;
  if (v6 >= 25.0) {
    double v10 = 1.57079633;
  }
  else {
    double v10 = v6 / 25.0 * 1.57079633;
  }
  long long v11 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
  objc_msgSend(v11, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", -(v9 * v10)));
  objc_msgSend(v11, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [v11 setDuration:0.025];
  uint64_t v12 = *MEMORY[0x263F15EC0];
  objc_msgSend(v11, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  double v13 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v13, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v7 * v10));
  objc_msgSend(v13, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [v13 setDuration:0.025];
  objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v12));
  id v14 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v14, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v11, v13, 0));
  [v14 setDuration:0.025];

  return [a1 addAnimation:v14 forKey:@"kTSDDragRotationAnimationKey"];
}

- (uint64_t)removeDragRotationAnimation
{
  return [a1 removeAnimationForKey:@"kTSDDragRotationAnimationKey"];
}

- (uint64_t)addFlipTransitionAnimationToLayer:()TSDAdditions
{
  [a1 removeFlipTransitionAnimation];
  [a3 removeFlipTransitionAnimation];
  [a1 addPerspectiveProjection];
  [a3 addPerspectiveProjection];
  [a1 position];
  double v6 = v5;
  [a3 position];
  double v8 = v7;
  double v9 = (void *)[MEMORY[0x263EFF980] array];
  double v10 = (void *)[MEMORY[0x263EFF980] array];
  long long v11 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  uint64_t v12 = (void *)MEMORY[0x263F08D40];
  [a3 position];
  objc_msgSend(v11, "setToValue:", objc_msgSend(v12, "valueWithCGPoint:"));
  [v11 setDuration:0.5];
  uint64_t v13 = *MEMORY[0x263F15EB8];
  objc_msgSend(v11, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  [v9 addObject:v11];
  id v14 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  double v15 = (void *)MEMORY[0x263F08D40];
  [a1 position];
  objc_msgSend(v14, "setFromValue:", objc_msgSend(v15, "valueWithCGPoint:"));
  [v14 setDuration:0.5];
  objc_msgSend(v14, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v13));
  [v10 addObject:v14];
  [a1 frame];
  double v17 = v16;
  [a3 frame];
  if (v17 <= v18) {
    id v19 = a3;
  }
  else {
    id v19 = a1;
  }
  [v19 frame];
  double v21 = v20;
  if (v6 >= v8) {
    double v22 = -1.0;
  }
  else {
    double v22 = 1.0;
  }
  uint64_t v23 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"zPosition"];
  objc_msgSend(v23, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v21));
  objc_msgSend(v23, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v21));
  [v23 setDuration:0.5];
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v13));
  [v9 addObject:v23];
  double v24 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"zPosition"];
  objc_msgSend(v24, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v21));
  objc_msgSend(v24, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v21));
  [v24 setDuration:0.5];
  objc_msgSend(v24, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v13));
  [v10 addObject:v24];
  double v25 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v25, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v22 * 3.14159265));
  [v25 setDuration:0.5];
  objc_msgSend(v25, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v13));
  [v9 addObject:v25];
  double v26 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v26, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v22 * -3.14159265));
  [v26 setDuration:0.5];
  objc_msgSend(v26, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v13));
  [v10 addObject:v26];
  double v27 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"hidden"];
  objc_msgSend(v27, "setFromValue:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  objc_msgSend(v27, "setToValue:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  [v27 setDuration:0.25];
  [v9 addObject:v27];
  id v28 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"hidden"];
  objc_msgSend(v28, "setFromValue:", objc_msgSend(NSNumber, "numberWithBool:", 1));
  objc_msgSend(v28, "setToValue:", objc_msgSend(NSNumber, "numberWithBool:", 1));
  [v28 setDuration:0.25];
  [v28 setBeginTime:0.25];
  [v9 addObject:v28];
  double v29 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"hidden"];
  objc_msgSend(v29, "setFromValue:", objc_msgSend(NSNumber, "numberWithBool:", 1));
  objc_msgSend(v29, "setToValue:", objc_msgSend(NSNumber, "numberWithBool:", 1));
  [v29 setDuration:0.25];
  [v10 addObject:v29];
  double v30 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"hidden"];
  objc_msgSend(v30, "setFromValue:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  objc_msgSend(v30, "setToValue:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  [v30 setDuration:0.25];
  [v30 setBeginTime:0.25];
  [v10 addObject:v30];
  id v31 = objc_alloc_init(MEMORY[0x263F15750]);
  [v31 setAnimations:v9];
  [v31 setDuration:0.5];
  [a1 addAnimation:v31 forKey:@"kTSDFlipTransitionAnimationKey"];
  id v32 = objc_alloc_init(MEMORY[0x263F15750]);
  [v32 setAnimations:v10];
  [v32 setDuration:0.5];

  return [a3 addAnimation:v32 forKey:@"kTSDFlipTransitionAnimationKey"];
}

- (uint64_t)removeFlipTransitionAnimation
{
  return [a1 removeAnimationForKey:@"kTSDFlipTransitionAnimationKey"];
}

- (uint64_t)addSproingAnimationFromPoint:()TSDAdditions
{
  [a1 removeSproingAnimation];
  [a1 frame];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  double v10 = (a2 - CGRectGetMinX(v27)) / v27.size.width;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  double v11 = (a3 - CGRectGetMinY(v28)) / height;
  uint64_t v12 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"anchorPoint"];
  uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v10, v11);
  [v12 setToValue:v13];
  [v12 setFromValue:v13];
  [v12 setDuration:1.0];
  [a1 anchorPoint];
  double v15 = width * TSDSubtractPoints(v10, v11, v14);
  double v17 = height * v16;
  double v18 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  uint64_t v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v15, v17);
  [v18 setToValue:v19];
  [v18 setFromValue:v19];
  [v18 setDuration:0.2];
  [v18 setAdditive:1];
  double v20 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v20, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v20, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.05));
  objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  [v20 setDuration:0.1];
  double v21 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v21, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.05));
  objc_msgSend(v21, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.95));
  uint64_t v22 = *MEMORY[0x263F15EB8];
  objc_msgSend(v21, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  [v21 setBeginTime:0.1];
  [v21 setDuration:0.06];
  uint64_t v23 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v23, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.95));
  objc_msgSend(v23, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v23, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v22));
  [v23 setBeginTime:0.16];
  [v23 setDuration:0.04];
  id v24 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v24, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v12, v18, v20, v21, v23, 0));
  [v24 setDuration:0.2];

  return [a1 addAnimation:v24 forKey:@"kTSDSproingAnimationKey"];
}

- (uint64_t)removeSproingAnimation
{
  return [a1 removeAnimationForKey:@"kTSDSproingAnimationKey"];
}

- (uint64_t)addPopInAnimation:()TSDAdditions
{
  [a1 removePopInAnimation];
  double v5 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  objc_msgSend(v5, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v5, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  [v5 setDuration:0.2];
  double v6 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v6, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v6, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.2));
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  [v6 setDuration:0.16];
  double v7 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v7, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.2));
  objc_msgSend(v7, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v7, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  [v7 setBeginTime:0.16];
  [v7 setDuration:0.04];
  id v8 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v8, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, v6, v7, 0));
  [v8 setDuration:0.2];
  [v8 setDelegate:a3];

  return [a1 addAnimation:v8 forKey:@"kTSDPopInAnimationKey"];
}

- (uint64_t)removePopInAnimation
{
  return [a1 removeAnimationForKey:@"kTSDPopInAnimationKey"];
}

- (BOOL)hasPopInAnimation
{
  return [a1 animationForKey:@"kTSDPopInAnimationKey"] != 0;
}

- (uint64_t)addPopOutAnimation:()TSDAdditions
{
  [a1 removePopOutAnimation];
  double v5 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  objc_msgSend(v5, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v5, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [v5 setDuration:0.2];
  double v6 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v6, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v6, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.2));
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
  [v6 setDuration:0.04];
  double v7 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v7, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.2));
  objc_msgSend(v7, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v7, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  [v7 setBeginTime:0.04];
  [v7 setDuration:0.16];
  id v8 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v8, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, v6, v7, 0));
  [v8 setDuration:0.2];
  [v8 setDelegate:a3];

  return [a1 addAnimation:v8 forKey:@"kTSDPopOutAnimationKey"];
}

- (uint64_t)removePopOutAnimation
{
  return [a1 removeAnimationForKey:@"kTSDPopOutAnimationKey"];
}

- (void)addDistortAnimationWithVector:()TSDAdditions
{
  [a1 removeDistortAnimation];
  [a1 frame];
  double v7 = v6;
  [a1 frame];
  double v9 = v8;
  [a1 frame];
  if (v7 <= v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  double v13 = TSDDistance(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a2, a3);
  double v14 = v13 / v12 * (v13 / v12) * 8.0 + 1.0;
  if (v14 >= 1.001)
  {
    double v15 = TSDAngleFromDelta(a2, a3);
    memset(&v22, 0, sizeof(v22));
    if (a1) {
      [a1 transform];
    }
    CATransform3D v20 = v22;
    CATransform3DRotate(&v21, &v20, v15, 0.0, 0.0, 1.0);
    CATransform3D v22 = v21;
    CATransform3D v19 = v21;
    CATransform3DScale(&v21, &v19, v14, 1.0 / v14, 1.0);
    CATransform3D v22 = v21;
    CATransform3D v18 = v21;
    CATransform3DRotate(&v21, &v18, -v15, 0.0, 0.0, 1.0);
    CATransform3D v22 = v21;
    double v16 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    CATransform3D v17 = v22;
    objc_msgSend(v16, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCATransform3D:", &v17));
    [v16 setDuration:0.025];
    objc_msgSend(v16, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
    [a1 addAnimation:v16 forKey:@"kTSDDistortAnimationKey"];
  }
}

- (uint64_t)removeDistortAnimation
{
  return [a1 removeAnimationForKey:@"kTSDDistortAnimationKey"];
}

- (uint64_t)addRotateInAnimationWithDuration:()TSDAdditions delay:
{
  [a1 removeRotateInAnimation];
  [a1 addPerspectiveProjection];
  double v6 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  objc_msgSend(v6, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  [v6 setBeginTime:a3];
  [v6 setDuration:a2];
  uint64_t v7 = *MEMORY[0x263F15EC0];
  objc_msgSend(v6, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  uint64_t v8 = *MEMORY[0x263F15AA8];
  [v6 setFillMode:*MEMORY[0x263F15AA8]];
  double v9 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
  objc_msgSend(v9, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v7));
  [v9 setBeginTime:a3];
  [v9 setDuration:a2];
  objc_msgSend(v9, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", -1.57079633));
  id v10 = objc_alloc_init(MEMORY[0x263F15750]);
  objc_msgSend(v10, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, v9, 0));
  [v10 setDuration:a2 + a3];
  [v10 setFillMode:v8];

  return [a1 addAnimation:v10 forKey:@"kTSDRotateInAnimationKey"];
}

- (uint64_t)removeRotateInAnimation
{
  return [a1 removeAnimationForKey:@"kTSDRotateInAnimationKey"];
}

- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions
{
  return objc_msgSend(a1, "addRippleAnimationFromPosition:withScale:", a3, a4, 1.0);
}

- (uint64_t)addRippleAnimationFromPosition:()TSDAdditions withScale:
{
  return objc_msgSend(a1, "addRippleAnimationFromPosition:withScale:addPerspectiveProjection:", 1);
}

- (void)addRippleAnimationFromPosition:()TSDAdditions withScale:addPerspectiveProjection:
{
  [a1 removeRippleAnimation];
  uint64_t v10 = *MEMORY[0x263F15EB8];
  uint64_t v11 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  LODWORD(v12) = *(_DWORD *)"333?fff?";
  LODWORD(v13) = 1036831949;
  LODWORD(v14) = *(_DWORD *)"fff?";
  LODWORD(v15) = 1.0;
  uint64_t v16 = [MEMORY[0x263F15808] functionWithControlPoints:v12 :v13 :v14 :v15];
  [a1 position];
  double v19 = TSDSubtractPoints(v17, v18, a2);
  double v21 = v20;
  double v22 = TSDPointLength(v19, v20);
  double v24 = TSDMultiplyPointScalar(v19, v21, 1.0 / v22);
  double v25 = 0.0;
  if (a4 * 350.0 - v22 >= 0.0) {
    double v25 = a4 * 350.0 - v22;
  }
  double v26 = v25 / (a4 * 350.0);
  double v27 = v26 * v26 * a4;
  if (v27 != 0.0)
  {
    double v54 = v23;
    double v28 = 1.0 - v26;
    if (a6) {
      [a1 addPerspectiveProjection];
    }
    double v29 = v28 * 0.55;
    double v30 = v27 * 0.549778714;
    double v31 = 1.5;
    double v32 = sqrt(v22);
    double v33 = (void *)[MEMORY[0x263EFF980] array];
    double v34 = v54;
    if (v54 != 0.0)
    {
      double v35 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
      objc_msgSend(v35, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v30 * 0.0 * -v54));
      objc_msgSend(v35, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v30 * -v54));
      objc_msgSend(v35, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v10));
      [v35 setDuration:0.0225];
      [v35 setBeginTime:v29 + 0.0];
      double v36 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
      objc_msgSend(v36, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v30 * -v54));
      objc_msgSend(v36, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v30 * -0.5 * -v54));
      objc_msgSend(v36, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v10));
      [v36 setDuration:0.315];
      [v36 setBeginTime:v29 + 0.0225];
      int v37 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.x"];
      double v31 = 1.5;
      objc_msgSend(v37, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v30 * -0.5 * -v54));
      objc_msgSend(v37, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      objc_msgSend(v37, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
      [v37 setDuration:0.1125];
      [v37 setBeginTime:v29 + 0.3375];
      [v33 addObject:v35];
      [v33 addObject:v36];
      [v33 addObject:v37];
    }
    double v38 = v32 * v31;
    double v39 = v27 * 0.15;
    if (v24 == 0.0)
    {
      double v41 = v29 + 0.0;
    }
    else
    {
      double v53 = v32 * v31;
      id v40 = objc_msgSend(MEMORY[0x263F15760], "animationWithKeyPath:", @"transform.rotation.y", v34);
      objc_msgSend(v40, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v24 * v30));
      objc_msgSend(v40, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v10));
      [v40 setDuration:0.0225];
      double v41 = v29 + 0.0;
      [v40 setBeginTime:v29 + 0.0];
      id v42 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
      objc_msgSend(v42, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v24 * v30));
      objc_msgSend(v42, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v24 * (v30 * -0.5)));
      objc_msgSend(v42, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v10));
      [v42 setDuration:0.315];
      [v42 setBeginTime:v29 + 0.0225];
      double v43 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
      objc_msgSend(v43, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v24 * (v30 * -0.5)));
      objc_msgSend(v43, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      objc_msgSend(v43, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
      [v43 setDuration:0.1125];
      [v43 setBeginTime:v29 + 0.3375];
      [v33 addObject:v40];
      [v33 addObject:v42];
      [v33 addObject:v43];
      double v38 = v53;
    }
    double v44 = v38 * v27;
    double v45 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
    objc_msgSend(v45, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v39 + 1.0));
    [v45 setTimingFunction:v16];
    [v45 setDuration:0.2025];
    [v45 setBeginTime:v41];
    double v46 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
    objc_msgSend(v46, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v39 + 1.0));
    objc_msgSend(v46, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v39 * 0.0 + 1.0));
    [v46 setTimingFunction:v11];
    [v46 setDuration:0.2475];
    [v46 setBeginTime:v29 + 0.2025];
    [v33 addObject:v45];
    [v33 addObject:v46];
    if (v24 != 0.0)
    {
      int v47 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.x"];
      double v48 = v24 * v44;
      objc_msgSend(v47, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v48));
      [v47 setTimingFunction:v11];
      [v47 setDuration:0.1125];
      [v47 setBeginTime:v41];
      double v49 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.x"];
      objc_msgSend(v49, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v48));
      objc_msgSend(v49, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      [v49 setTimingFunction:v11];
      [v49 setDuration:0.225];
      [v49 setBeginTime:v29 + 0.1125];
      [v33 addObject:v47];
      [v33 addObject:v49];
    }
    if (v54 != 0.0)
    {
      double v50 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.y"];
      objc_msgSend(v50, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", v54 * v44));
      [v50 setTimingFunction:v11];
      [v50 setDuration:0.2025];
      [v50 setBeginTime:v41];
      double v51 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.y"];
      objc_msgSend(v51, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v54 * v44));
      objc_msgSend(v51, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      [v51 setTimingFunction:v11];
      [v51 setDuration:0.2475];
      [v51 setBeginTime:v29 + 0.2025];
      [v33 addObject:v50];
      [v33 addObject:v51];
    }
    id v52 = objc_alloc_init(MEMORY[0x263F15750]);
    [v52 setAnimations:v33];
    [v52 setDuration:v29 + 0.45];
    [v52 setFillMode:*MEMORY[0x263F15AB0]];
    [a1 addAnimation:v52 forKey:@"kTSDRippleAnimationKey"];
  }
}

- (uint64_t)removeRippleAnimation
{
  return [a1 removeAnimationForKey:@"kTSDRippleAnimationKey"];
}

- (uint64_t)addResetAnimationWithDelegate:()TSDAdditions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a1 presentationLayer];
  double v5 = (void *)[MEMORY[0x263EFF980] array];
  double v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"transform.translation.x", @"transform.translation.y", @"transform.translation.z", @"transform.rotation.x", @"transform.rotation.y", @"transform.rotation.z", @"transform.scale.x", @"transform.scale.y", @"transform.scale.z", @"position.x", @"position.y", @"zPosition", @"opacity", 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x263F15EB8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(a1, "valueForKeyPath:", v12), "isEqual:", objc_msgSend(v4, "valueForKeyPath:", v12)) & 1) == 0)
        {
          double v13 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:v12];
          objc_msgSend(v13, "setFromValue:", objc_msgSend(v4, "valueForKeyPath:", v12));
          objc_msgSend(v13, "setToValue:", objc_msgSend(a1, "valueForKeyPath:", v12));
          [v13 setDuration:0.2];
          objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v10));
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  [a1 removeAllAnimations];
  uint64_t result = [v5 count];
  if (result)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F15750]);
    [v15 setAnimations:v5];
    [v15 setDuration:0.2];
    if (a3) {
      objc_msgSend(v15, "setDelegate:");
    }
    return [a1 addAnimation:v15 forKey:@"kTSDResetAnimationKey"];
  }
  return result;
}

- (uint64_t)addResetAnimation
{
  return [a1 addResetAnimationWithDelegate:0];
}

- (uint64_t)removeResetAnimation
{
  return [a1 removeAnimationForKey:@"kTSDResetAnimationKey"];
}

- (uint64_t)addZoomAnimation
{
  [a1 position];

  return objc_msgSend(a1, "addZoomAnimationFromPoint:startingScale:");
}

- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions
{
  return objc_msgSend(a1, "addZoomAnimationFromPoint:startingScale:", a3, a4, 0.5);
}

- (uint64_t)addZoomAnimationFromPoint:()TSDAdditions startingScale:
{
  [a1 removeZoomAnimation];
  uint64_t v8 = (void *)[MEMORY[0x263EFF980] array];
  [a1 position];
  if (a2 != v10 || a3 != v9)
  {
    [a1 frame];
    double v12 = a2 - CGRectGetMinX(v36);
    [a1 frame];
    double v14 = v12 / v13;
    [a1 frame];
    double v15 = a3 - CGRectGetMinY(v37);
    [a1 frame];
    double v17 = v15 / v16;
    long long v18 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"anchorPoint"];
    uint64_t v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v14, v17);
    [v18 setToValue:v19];
    [v18 setFromValue:v19];
    [v18 setDuration:0.2];
    [v8 addObject:v18];
    [a1 anchorPoint];
    double v21 = TSDSubtractPoints(v14, v17, v20);
    double v23 = v22;
    [a1 frame];
    double v25 = v21 * v24;
    [a1 frame];
    double v27 = v23 * v26;
    double v28 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
    uint64_t v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v25, v27);
    [v28 setToValue:v29];
    [v28 setFromValue:v29];
    [v28 setDuration:0.2];
    [v28 setAdditive:1];
    [v8 addObject:v28];
  }
  double v30 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v30, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v30, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  uint64_t v31 = *MEMORY[0x263F15EC0];
  objc_msgSend(v30, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EC0]));
  [v30 setDuration:0.2];
  [v8 addObject:v30];
  double v32 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  objc_msgSend(v32, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v32, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v31));
  [v32 setDuration:0.2];
  [v8 addObject:v32];
  id v33 = objc_alloc_init(MEMORY[0x263F15750]);
  [v33 setAnimations:v8];
  [v33 setDuration:0.2];

  return [a1 addAnimation:v33 forKey:@"kTSDZoomAnimationKey"];
}

- (uint64_t)removeZoomAnimation
{
  return [a1 removeAnimationForKey:@"kTSDZoomAnimationKey"];
}

- (uint64_t)addZoomDownAnimation
{
  [a1 position];

  return objc_msgSend(a1, "addZoomDownAnimationFromPoint:endingScale:delay:");
}

- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions
{
  return objc_msgSend(a1, "addZoomDownAnimationFromPoint:endingScale:delay:", a3, a4, 0.5, 0.0);
}

- (uint64_t)addZoomDownAnimationFromPoint:()TSDAdditions endingScale:delay:
{
  [a1 removeZoomDownAnimation];
  double v10 = (void *)[MEMORY[0x263EFF980] array];
  [a1 position];
  if (a2 != v12 || a3 != v11)
  {
    [a1 frame];
    double v14 = a2 - CGRectGetMinX(v38);
    [a1 frame];
    double v16 = v14 / v15;
    [a1 frame];
    double v17 = a3 - CGRectGetMinY(v39);
    [a1 frame];
    double v19 = v17 / v18;
    double v20 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"anchorPoint"];
    uint64_t v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v16, v19);
    [v20 setToValue:v21];
    [v20 setFromValue:v21];
    [v20 setDuration:0.2];
    [v20 setBeginTime:a5];
    [v10 addObject:v20];
    [a1 anchorPoint];
    double v23 = TSDSubtractPoints(v16, v19, v22);
    double v25 = v24;
    [a1 frame];
    double v27 = v23 * v26;
    [a1 frame];
    double v29 = v25 * v28;
    double v30 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
    uint64_t v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v27, v29);
    [v30 setToValue:v31];
    [v30 setFromValue:v31];
    [v30 setDuration:0.2];
    [v30 setBeginTime:a5];
    [v30 setAdditive:1];
    [v10 addObject:v30];
  }
  double v32 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
  objc_msgSend(v32, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v32, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", a4));
  uint64_t v33 = *MEMORY[0x263F15EB0];
  objc_msgSend(v32, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB0]));
  [v32 setDuration:0.2];
  [v32 setBeginTime:a5];
  [v10 addObject:v32];
  double v34 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  objc_msgSend(v34, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 1.0));
  objc_msgSend(v34, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
  objc_msgSend(v34, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", v33));
  [v34 setDuration:0.2];
  [v34 setBeginTime:a5];
  [v10 addObject:v34];
  id v35 = objc_alloc_init(MEMORY[0x263F15750]);
  [v35 setAnimations:v10];
  [v35 setDuration:a5 + 0.2];

  return [a1 addAnimation:v35 forKey:@"kTSDZoomDownAnimationKey"];
}

- (uint64_t)removeZoomDownAnimation
{
  return [a1 removeAnimationForKey:@"kTSDZoomDownAnimationKey"];
}

- (uint64_t)zoomDownAnimation
{
  return [a1 animationForKey:@"kTSDZoomDownAnimationKey"];
}

- (uint64_t)animationDidStop:()TSDAdditions finished:
{
  uint64_t result = [a3 valueForKey:@"kTSDLayerToRemove"];
  if (result)
  {
    double v5 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"kTSDLayerToRemove"), "nonretainedObjectValue");
    return [v5 removeFromSuperlayer];
  }
  return result;
}

- (double)frameIncludingSublayers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [a1 frame];
  double x = v2;
  CGFloat y = v4;
  CGFloat width = v6;
  CGFloat height = v8;
  if (([a1 masksToBounds] & 1) == 0)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v10 = objc_msgSend(a1, "sublayers", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v15 frameIncludingSublayers];
          objc_msgSend(a1, "convertRect:fromLayer:", objc_msgSend(v15, "superlayer"), v16, v17, v18, v19);
          v33.origin.double x = v20;
          v33.origin.CGFloat y = v21;
          v33.size.CGFloat width = v22;
          v33.size.CGFloat height = v23;
          v31.origin.double x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          CGRect v32 = CGRectUnion(v31, v33);
          double x = v32.origin.x;
          CGFloat y = v32.origin.y;
          CGFloat width = v32.size.width;
          CGFloat height = v32.size.height;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
  }
  return x;
}

- (CGImage)newRasterizedImageRef
{
  double v2 = a1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a1, "sublayers"), "count") <= 1)
  {
    double v2 = a1;
    while (1)
    {
      [v2 borderWidth];
      if (v17 != 0.0) {
        break;
      }
      if ([v2 mask]) {
        break;
      }
      [v2 opacity];
      if (v18 != 1.0) {
        break;
      }
      [v2 cornerRadius];
      if (v19 != 0.0) {
        break;
      }
      [v2 shadowOpacity];
      if (v20 != 0.0 || [v2 backgroundColor]) {
        break;
      }
      if (v2) {
        [v2 transform];
      }
      else {
        memset(&v55, 0, sizeof(v55));
      }
      if (!CATransform3DIsIdentity(&v55)) {
        break;
      }
      [v2 contentsRect];
      v62.origin.double x = 0.0;
      v62.origin.CGFloat y = 0.0;
      v62.size.CGFloat width = 1.0;
      v62.size.CGFloat height = 1.0;
      if (!CGRectEqualToRect(v60, v62)) {
        break;
      }
      if (objc_msgSend((id)objc_msgSend(v2, "sublayers"), "count") != 1)
      {
        if (![v2 contents]) {
          break;
        }
        Image = (CGImage *)[v2 contents];
        CGImageRetain(Image);
        return Image;
      }
      [v2 bounds];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "sublayers"), "lastObject"), "bounds");
      v63.origin.double x = v29;
      v63.origin.CGFloat y = v30;
      v63.size.CGFloat width = v31;
      v63.size.CGFloat height = v32;
      v61.origin.double x = v22;
      v61.origin.CGFloat y = v24;
      v61.size.CGFloat width = v26;
      v61.size.CGFloat height = v28;
      if (CGRectEqualToRect(v61, v63))
      {
        double v2 = objc_msgSend((id)objc_msgSend(v2, "sublayers"), "lastObject");
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v2, "sublayers"), "count") <= 1) {
          continue;
        }
      }
      break;
    }
  }
  [a1 frameIncludingSublayers];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [a1 frame];
  double MinX = CGRectGetMinX(v56);
  v57.origin.double x = v4;
  v57.origin.CGFloat y = v6;
  v57.size.CGFloat width = v8;
  v57.size.CGFloat height = v10;
  double v12 = CGRectGetMinX(v57);
  [a1 frame];
  double MinY = CGRectGetMinY(v58);
  v59.origin.double x = v4;
  v59.origin.CGFloat y = v6;
  v59.size.CGFloat width = v8;
  v59.size.CGFloat height = v10;
  double v14 = CGRectGetMinY(v59);
  double v15 = TSDBitmapContextCreate(11, v8);
  if (!v15) {
    return 0;
  }
  double v16 = v15;
  if (v2) {
    [v2 transform];
  }
  else {
    memset(&v54, 0, sizeof(v54));
  }
  double v34 = MinX - v12;
  if (!CATransform3DIsIdentity(&v54))
  {
    long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v53.CATransform3D a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v53.c = v35;
    *(_OWORD *)&v53.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v52.CATransform3D a = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.c = v35;
    *(_OWORD *)&v52.tdouble x = *(_OWORD *)&v53.tx;
    CGAffineTransformTranslate(&v53, &v52, -v4, -v6);
    [a1 anchorPoint];
    double v37 = v36;
    double v39 = v38;
    [a1 bounds];
    double v41 = TSDMultiplyPointBySize(v37, v39, v40);
    double v43 = v42;
    CGAffineTransform v50 = v53;
    CGAffineTransformTranslate(&v51, &v50, v41, v42);
    CGAffineTransform v53 = v51;
    if (a1) {
      [a1 affineTransform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v53;
    CGAffineTransformConcat(&v51, &t1, &t2);
    CGAffineTransform v53 = v51;
    CGAffineTransform v47 = v51;
    CGAffineTransformTranslate(&v51, &v47, -v41, -v43);
    CGAffineTransform v53 = v51;
    CGAffineTransform transform = v51;
    CGContextConcatCTM(v16, &transform);
  }
  CGAffineTransformMakeTranslation(&v45, v34, MinY - v14);
  CGContextConcatCTM(v16, &v45);
  [a1 renderInContext:v16];
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  return Image;
}

- (void)bakedLayer
{
  uint64_t v2 = [a1 newRasterizedImageRef];
  if (!v2) {
    return 0;
  }
  double v3 = (CGImage *)v2;
  double v4 = (void *)[MEMORY[0x263F157E8] layer];
  [a1 frameIncludingSublayers];
  objc_msgSend(v4, "setFrame:");
  [v4 setContents:v3];
  CGImageRelease(v3);
  return v4;
}

- (uint64_t)pause
{
  double v2 = CACurrentMediaTime();

  return [a1 pauseAtTime:v2];
}

- (uint64_t)pauseAtTime:()TSDAdditions
{
  objc_msgSend(a1, "convertTime:fromLayer:", 0);
  double v3 = v2;
  [a1 setSpeed:0.0];

  return [a1 setTimeOffset:v3];
}

- (uint64_t)resume
{
  double v2 = CACurrentMediaTime();

  return [a1 resumeAtTime:v2];
}

- (uint64_t)resumeAtTime:()TSDAdditions
{
  [a1 timeOffset];
  double v5 = v4;
  LODWORD(v4) = 1.0;
  [a1 setSpeed:v4];
  [a1 setTimeOffset:0.0];
  [a1 setBeginTime:0.0];
  [a1 convertTime:0 fromLayer:a2];
  double v7 = v6 - v5;

  return [a1 setBeginTime:v7];
}

- (CGFloat)transformToScale:()TSDAdditions aroundBoundsPoint:afterOffset:
{
  *(_OWORD *)&a2->m41 = 0u;
  *(_OWORD *)&a2->m43 = 0u;
  *(_OWORD *)&a2->m31 = 0u;
  *(_OWORD *)&a2->m33 = 0u;
  *(_OWORD *)&a2->m21 = 0u;
  *(_OWORD *)&a2->m23 = 0u;
  *(_OWORD *)&a2->m11 = 0u;
  *(_OWORD *)&a2->m13 = 0u;
  CATransform3DMakeTranslation(a2, a6, a7, 0.0);
  [a1 bounds];
  double v13 = v12;
  [a1 anchorPoint];
  double v15 = v14;
  double v50 = -v13;
  CGFloat v16 = a4 - v13 * v14;
  [a1 bounds];
  double v18 = v17;
  [a1 anchorPoint];
  double v20 = v19;
  long long v21 = *(_OWORD *)&a2->m33;
  *(_OWORD *)&v53.m31 = *(_OWORD *)&a2->m31;
  *(_OWORD *)&v53.m33 = v21;
  long long v22 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v53.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v53.m43 = v22;
  long long v23 = *(_OWORD *)&a2->m13;
  *(_OWORD *)&v53.m11 = *(_OWORD *)&a2->m11;
  *(_OWORD *)&v53.m13 = v23;
  long long v24 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v53.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v53.m23 = v24;
  CATransform3DTranslate(&v54, &v53, v16, a5 - v18 * v19, 0.0);
  long long v25 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v25;
  long long v26 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v26;
  long long v27 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v27;
  long long v28 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v28;
  long long v29 = *(_OWORD *)&a2->m11;
  long long v30 = *(_OWORD *)&a2->m13;
  long long v31 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v52.m23 = v31;
  *(_OWORD *)&v52.m11 = v29;
  *(_OWORD *)&v52.m13 = v30;
  long long v32 = *(_OWORD *)&a2->m31;
  long long v33 = *(_OWORD *)&a2->m33;
  long long v34 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v52.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v52.m43 = v34;
  *(_OWORD *)&v52.m31 = v32;
  *(_OWORD *)&v52.m33 = v33;
  CATransform3DScale(&v54, &v52, a3, a3, 1.0);
  long long v35 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v35;
  long long v36 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v36;
  long long v37 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v37;
  long long v38 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v38;
  long long v39 = *(_OWORD *)&a2->m11;
  long long v40 = *(_OWORD *)&a2->m13;
  long long v41 = *(_OWORD *)&a2->m23;
  *(_OWORD *)&v51.m21 = *(_OWORD *)&a2->m21;
  *(_OWORD *)&v51.m23 = v41;
  *(_OWORD *)&v51.m11 = v39;
  *(_OWORD *)&v51.m13 = v40;
  long long v42 = *(_OWORD *)&a2->m31;
  long long v43 = *(_OWORD *)&a2->m33;
  long long v44 = *(_OWORD *)&a2->m43;
  *(_OWORD *)&v51.m41 = *(_OWORD *)&a2->m41;
  *(_OWORD *)&v51.m43 = v44;
  *(_OWORD *)&v51.m31 = v42;
  *(_OWORD *)&v51.m33 = v43;
  CATransform3DTranslate(&v54, &v51, -(a4 + v50 * v15), -(a5 + -v18 * v20), 0.0);
  long long v45 = *(_OWORD *)&v54.m33;
  *(_OWORD *)&a2->m31 = *(_OWORD *)&v54.m31;
  *(_OWORD *)&a2->m33 = v45;
  long long v46 = *(_OWORD *)&v54.m43;
  *(_OWORD *)&a2->m41 = *(_OWORD *)&v54.m41;
  *(_OWORD *)&a2->m43 = v46;
  long long v47 = *(_OWORD *)&v54.m13;
  *(_OWORD *)&a2->m11 = *(_OWORD *)&v54.m11;
  *(_OWORD *)&a2->m13 = v47;
  CGFloat result = v54.m21;
  long long v49 = *(_OWORD *)&v54.m23;
  *(_OWORD *)&a2->m21 = *(_OWORD *)&v54.m21;
  *(_OWORD *)&a2->m23 = v49;
  return result;
}

- (double)transformToScale:()TSDAdditions aroundAnchorPoint:afterOffset:
{
  [a1 bounds];
  double v15 = v14;
  [a1 bounds];
  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundBoundsPoint:afterOffset:", a3, a4 * v15, a5 * v16, a6, a7);
  }
  else
  {
    double result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (uint64_t)scale:()TSDAdditions aroundBoundsPoint:afterOffset:
{
  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundBoundsPoint:afterOffset:");
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v4 = 0u;
    long long v5 = 0u;
  }
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  return [a1 setTransform:v3];
}

- (uint64_t)scale:()TSDAdditions aroundAnchorPoint:afterOffset:
{
  if (a1)
  {
    objc_msgSend(a1, "transformToScale:aroundAnchorPoint:afterOffset:");
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v4 = 0u;
    long long v5 = 0u;
  }
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  return [a1 setTransform:v3];
}

- (double)center
{
  [a1 anchorPoint];
  double v3 = v2;
  double v5 = v4;
  [a1 bounds];
  double v9 = TSDPointFromNormalizedRect(v3, v5, v6, v7, v8);
  [a1 position];
  double v12 = TSDSubtractPoints(v10, v11, v9);
  double v14 = v13;
  [a1 bounds];
  double v19 = TSDCenterOfRect(v15, v16, v17, v18);

  return TSDAddPoints(v12, v14, v19);
}

@end