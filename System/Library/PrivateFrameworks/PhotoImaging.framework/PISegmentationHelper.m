@interface PISegmentationHelper
+ (BOOL)matteHistogramIndicatesSubjectDetected:(id)a3;
+ (BOOL)topEdgeHasNoContactWithInspectionMatte:(id)a3 context:(id)a4;
+ (CGRect)_computeAvoidingRect:(CGRect)a3 imageSize:(CGSize)a4 maxYMotion:(double)a5 segmentationMatte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8;
+ (CGRect)scaleRect:(CGRect)a3 scaleFactor:(double)a4 scaleCenter:(CGPoint)a5;
+ (PISegmentationBimodalScore)bimodalScoreForHistogram:(id)a3;
+ (PISegmentationClockOverlapResult)computeClockLayerOrderWithVisibleFrame:(SEL)a3 segmentationMatte:(CGRect)a4 layoutConfiguration:(id)a5 context:(id)a6 interactive:(id)a7;
+ (PISegmentationInactiveResult)computeInactiveFrameWithVisibleFrame:(SEL)a3 imageSize:(CGRect)a4 canUpdateVisibleRect:(CGSize)a5 considerHeadroom:(BOOL)a6 segmentationMatte:(BOOL)a7 layoutConfiguration:(id)a8 context:(id)a9;
+ (double)_computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 scaleCenter:(CGPoint)a4 initialOverlap:(PISegmentationClockOverlapResult *)a5 matte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8;
+ (double)computeAlphaCoverageWithRect:(CGRect)a3 foregroundImage:(id)a4 context:(id)a5;
+ (double)computeAvoidOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 outputUnsafeOverlap:(double *)a7 context:(id)a8;
+ (double)computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 zoomTowardsTop:(BOOL *)a4 matte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7;
+ (double)computeMatteCoverageWithRect:(CGRect)a3 segmentationMatte:(id)a4 context:(id)a5;
+ (double)computeTargetOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7;
+ (float)groundedScoreForSegmentationMatte:(id)a3 context:(id)a4;
+ (float)localConfidenceScoreForLocalConfidenceImage:(id)a3 extent:(CGRect)a4 context:(id)a5;
+ (id)backgroundForImage:(id)a3 matte:(id)a4;
+ (id)backgroundForImage:(id)a3 matte:(id)a4 infill:(id)a5;
+ (id)debugImageForColorAnalysis:(id)a3 inputImage:(id)a4 visibleFrame:(CGRect)a5;
+ (id)debugImageWithInputImage:(double)a3 finalLayout:(double)a4 intermediateLayout:(double)a5 faceRects:(double)a6 saliencyPreferrectRect:(double)a7 saliencyAcceptableRect:(double)a8 settlingEffectRect:(double)a9;
+ (id)debugImageWithInputImage:(double)a3 layout:(double)a4 faceRects:(double)a5 saliencyPreferrectRect:(double)a6 saliencyAcceptableRect:(double)a7 gazeAreaRect:(double)a8 settlingEffectRect:(double)a9;
+ (id)debugImageWithInputImage:(id)a3 fullSize:(CGSize)a4 debugRects:(id)a5 label:(id)a6;
+ (id)debugPreviewRenderWithBackground:(id)a3 foreground:(id)a4 layout:(id)a5 style:(id)a6;
+ (id)dilateMask:(id)a3 withRadius:(double)a4;
+ (id)erodeMask:(id)a3 withRadius:(double)a4;
+ (id)foregroundForImage:(id)a3 matte:(id)a4;
+ (id)imageFromImageLayer:(id)a3;
+ (id)imageWithColor:(id)a3 extent:(CGRect)a4;
+ (id)infillMaskForSegmentationMatte:(id)a3;
+ (id)invertImage:(id)a3;
+ (id)localConfidenceImage:(id)a3;
+ (id)openMask:(id)a3 withRadius:(double)a4;
+ (id)thresholdImage:(id)a3 withThreshold:(double)a4;
+ (id)upsampleBackgroundImage:(id)a3 toSize:(CGSize)a4;
+ (id)upsampleMatteImage:(id)a3 guideImage:(id)a4;
@end

@implementation PISegmentationHelper

+ (id)debugImageForColorAnalysis:(id)a3 inputImage:(id)a4 visibleFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v59.origin.double x = x;
    v59.origin.double y = y;
    v59.size.double width = width;
    CGFloat v45 = height;
    v59.size.CGFloat height = height;
    CGRect v60 = CGRectInset(v59, 50.0, 50.0);
    double v14 = v60.origin.x;
    double v15 = floor(width / 10.0);
    double v16 = round(v15 * 0.25);
    double v17 = v15 + v60.origin.y;
    [v10 backgroundLuminance];
    v19 = [MEMORY[0x1E4F1E008] colorWithRed:v18 green:v18 blue:v18];
    v20 = drawCircle(v12, v19, @"bg lum", v14, v17, v16);

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v46 = v10;
    v21 = [v10 backgroundColors];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v52;
      uint64_t v25 = 1;
      double v26 = v14;
      do
      {
        uint64_t v27 = 0;
        v28 = v20;
        do
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          double v26 = v15 + v26;
          v29 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithCGColor:", objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v27), "CGColor"));
          v30 = objc_msgSend(NSString, "stringWithFormat:", @"bg col %ld", v25 + v27);
          v20 = drawCircle(v28, v29, v30, v26, v17, v16);

          ++v27;
          v28 = v20;
        }
        while (v23 != v27);
        v25 += v27;
        uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v23);
    }

    double v31 = v15 + v17;
    [v46 foregroundLuminance];
    v33 = [MEMORY[0x1E4F1E008] colorWithRed:v32 green:v32 blue:v32];
    v12 = drawCircle(v20, v33, @"fg lum", v14, v31, v16);

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v34 = [v46 foregroundColors];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v48;
      uint64_t v38 = 1;
      double v39 = v45;
      do
      {
        uint64_t v40 = 0;
        v41 = v12;
        do
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v34);
          }
          double v14 = v15 + v14;
          v42 = objc_msgSend(MEMORY[0x1E4F1E008], "colorWithCGColor:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v40), "CGColor"));
          v43 = objc_msgSend(NSString, "stringWithFormat:", @"fg col %ld", v38 + v40);
          v12 = drawCircle(v41, v42, v43, v14, v31, v16);

          ++v40;
          v41 = v12;
        }
        while (v36 != v40);
        v38 += v40;
        uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v36);
    }
    else
    {
      double v39 = v45;
    }

    v13 = objc_msgSend(v12, "imageByCroppingToRect:", x, y, width, v39);
    id v10 = v46;
  }

  return v13;
}

+ (id)debugPreviewRenderWithBackground:(id)a3 foreground:(id)a4 layout:(id)a5 style:(id)a6
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  uint64_t v14 = [v13 CGColorSpace];

  id v15 = v10;
  double v16 = [v9 imageByColorMatchingWorkingSpaceToColorSpace:v14];
  double v17 = [v15 imageByColorMatchingWorkingSpaceToColorSpace:v14];

  [v11 timeFrame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v11 visibleFrame];
  double v30 = v19 - v29;
  double v31 = 0.0;
  double v32 = 0.0;
  if (v27 != 0.0)
  {
    double v30 = v30 / v27;
    double v32 = v23 / v27;
  }
  double v33 = v21 - v26;
  if (v28 != 0.0)
  {
    double v33 = v33 / v28;
    double v31 = v25 / v28;
  }
  [v16 extent];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  id v42 = v16;
  v43 = [v11 clockLayerOrder];
  v44 = (void *)*MEMORY[0x1E4F8D098];

  id v45 = v42;
  if (v43 == v44)
  {
    uint64_t v46 = [v17 imageByCompositingOverImage:v42];
    long long v47 = (void *)v46;
    if (v46) {
      long long v48 = (void *)v46;
    }
    else {
      long long v48 = v42;
    }
    id v45 = v48;
  }
  long long v49 = +[PIGlobalSettings globalSettings];
  char v50 = [v49 segmentationDebugPreviewDisableClock];

  if ((v50 & 1) == 0)
  {
    id v107 = v42;
    v108 = v17;
    uint64_t v109 = v14;
    id v110 = v15;
    id v111 = v9;
    uint64_t v51 = [v12 clockFont];
    long long v52 = (void *)v51;
    long long v53 = @"SF Soft Time";
    if (v51) {
      long long v53 = (__CFString *)v51;
    }
    long long v54 = v53;
    uint64_t v55 = *MEMORY[0x1E4F24538];
    CGFloat v56 = *MEMORY[0x1E4F24600];
    v113.a = *(CGFloat *)MEMORY[0x1E4F24538];
    v113.b = v56;
    *(void *)&v114.a = v54;
    *(void *)&v114.b = @"Semibold";
    uint64_t v57 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:2]);
    id v112 = v12;
    if (!v57)
    {
      CGRect v60 = 0;
LABEL_30:
      double v68 = v35 + v30 * v39;
      double v69 = v37 + v33 * v41;
      double v70 = v31 * v41;

      v71 = [v12 clockColor];
      v72 = (void *)MEMORY[0x1E4F1E008];
      if (v71)
      {
        v73 = [v12 clockColor];
        v74 = objc_msgSend(v72, "colorWithCGColor:", objc_msgSend(v73, "CGColor"));
      }
      else
      {
        v74 = [MEMORY[0x1E4F1E008] whiteColor];
      }

      double v75 = v68 + v32 * v39 * 0.5;
      v76 = (void *)MEMORY[0x1E4F1E040];
      id v77 = v74;
      v78 = v60;
      v79 = [v76 textImageGeneratorFilter];
      [v79 setText:@"9:41"];
      [v79 setFontName:v78];
      LODWORD(v80) = 1121714176;
      [v79 setFontSize:v80];
      v81 = CTFontCreateWithName(v78, 110.0, 0);

      double CapHeight = CTFontGetCapHeight(v81);
      CFRelease(v81);
      double v83 = v70 / CapHeight;
      *(float *)&double v83 = v70 / CapHeight;
      [v79 setScaleFactor:v83];
      v84 = [v79 outputImage];
      v85 = [MEMORY[0x1E4F1E050] imageWithColor:v77];

      [v84 extent];
      v86 = objc_msgSend(v85, "imageByCroppingToRect:");

      v87 = [MEMORY[0x1E4F1E040] blendWithMaskFilter];
      [v87 setInputImage:v86];
      v88 = [v84 imageByApplyingFilter:@"CIColorInvert"];
      [v87 setMaskImage:v88];

      [v87 setBackgroundImage:0];
      v89 = [v87 outputImage];
      [v89 extent];
      memset(&v114, 0, sizeof(v114));
      CGAffineTransformMakeTranslation(&v114, v75 - (v90 + v91 * 0.5), v69 + v70 * 0.5 - (v92 + v93 * 0.5));
      CGAffineTransform v113 = v114;
      v94 = [v89 imageByApplyingTransform:&v113];

      uint64_t v95 = [v94 imageByCompositingOverImage:v45];
      v96 = (void *)v95;
      if (v95) {
        v97 = (void *)v95;
      }
      else {
        v97 = v45;
      }
      id v98 = v97;

      id v45 = v98;
      id v9 = v111;
      id v12 = v112;
      uint64_t v14 = v109;
      id v15 = v110;
      id v42 = v107;
      double v17 = v108;
      goto LABEL_37;
    }
    v58 = v57;
    CFStringRef v59 = (const __CFString *)*MEMORY[0x1E4F245A8];
    CGRect v60 = (void *)CTFontDescriptorCopyAttribute(v57, (CFStringRef)*MEMORY[0x1E4F245A8]);
    if (!v60)
    {
      CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v58, (CFSetRef)[MEMORY[0x1E4F1CAD0] setWithObject:v55]);
      if (MatchingFontDescriptors)
      {
        CFArrayRef v62 = MatchingFontDescriptors;
        CFIndex Count = CFArrayGetCount(MatchingFontDescriptors);
        if (Count)
        {
          CFIndex v64 = Count;
          if (Count == 1)
          {
            ValueAtIndedouble x = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v62, 0);
            CGRect v60 = (void *)CTFontDescriptorCopyAttribute(ValueAtIndex, v59);
LABEL_28:
            CFRelease(v62);
            goto LABEL_29;
          }
          if (Count >= 1)
          {
            CFIndex v66 = 0;
            while (1)
            {
              v67 = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v62, v66);
              CGRect v60 = (void *)CTFontDescriptorCopyAttribute(v67, v59);
              if ([v60 rangeOfString:@"Semibold" options:391] != 0x7FFFFFFFFFFFFFFFLL) {
                break;
              }

              if (v64 == ++v66)
              {
                CGRect v60 = 0;
                break;
              }
            }
            id v12 = v112;
            goto LABEL_28;
          }
        }
        CGRect v60 = 0;
        goto LABEL_28;
      }
      CGRect v60 = 0;
    }
LABEL_29:
    CFRelease(v58);
    goto LABEL_30;
  }
LABEL_37:
  v99 = [v11 clockLayerOrder];
  v100 = (void *)*MEMORY[0x1E4F8D090];

  if (v99 == v100)
  {
    uint64_t v101 = [v17 imageByCompositingOverImage:v45];
    v102 = (void *)v101;
    if (v101) {
      v103 = (void *)v101;
    }
    else {
      v103 = v45;
    }
    id v104 = v103;

    id v45 = v104;
  }
  v105 = [v45 imageByColorMatchingColorSpaceToWorkingSpace:v14];

  return v105;
}

+ (id)debugImageWithInputImage:(double)a3 finalLayout:(double)a4 intermediateLayout:(double)a5 faceRects:(double)a6 saliencyPreferrectRect:(double)a7 saliencyAcceptableRect:(double)a8 settlingEffectRect:(double)a9
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v118 = a11;
  id v117 = a12;
  id v115 = a13;
  id v23 = a14;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obj = v23;
  uint64_t v25 = [obj countByEnumeratingWithState:&v128 objects:v132 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = 0;
    uint64_t v28 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v129 != v28) {
          objc_enumerationMutation(obj);
        }
        double v30 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        double v31 = (void *)MEMORY[0x1E4F8CCB8];
        [v30 rectValue];
        objc_msgSend(v31, "inflatePersonFaceRect:");
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v40 = +[PIDebugRect inflatedFaceColor];
        double v41 = +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v40, 0, v33, v35, v37, v39);
        [v24 addObject:v41];

        id v42 = objc_msgSend(NSString, "stringWithFormat:", @"f%d", v27 + i);
        [v30 rectValue];
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        uint64_t v51 = +[PIDebugRect faceColor];
        long long v52 = +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v51, v42, v44, v46, v48, v50);
        [v24 addObject:v52];
      }
      uint64_t v27 = (v27 + i);
      uint64_t v26 = [obj countByEnumeratingWithState:&v128 objects:v132 count:16];
    }
    while (v26);
  }

  long long v53 = +[PIDebugRect saliencyPreferredColor];
  long long v54 = +[PIDebugRect debugRectWithRect:v53, @"saliency preferred", a2, a3, a4, a5 color label];
  [v24 addObject:v54];

  uint64_t v55 = +[PIDebugRect saliencyAcceptableColor];
  CGFloat v56 = +[PIDebugRect debugRectWithRect:v55, @"saliency acceptable", a6, a7, a8, a9 color label];
  [v24 addObject:v56];

  v135.origin.double x = a15;
  v135.origin.double y = a16;
  v135.size.double width = a17;
  v135.size.CGFloat height = a18;
  if (!CGRectIsNull(v135))
  {
    uint64_t v57 = +[PIDebugRect settlingEffectColor];
    v58 = +[PIDebugRect debugRectWithRect:v57, @"settling effect", a15, a16, a17, a18 color label];
    [v24 addObject:v58];
  }
  double v59 = *MEMORY[0x1E4F1DAD8];
  double v126 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v117 imageSize];
  double v61 = v60;
  double v63 = v62;
  [v115 visibleRect];
  double v120 = v64;
  double v122 = v65;
  double v67 = v66;
  double v124 = v68;
  [v117 timeFrame];
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  [v117 visibleFrame];
  double v81 = v70 - v80;
  double v82 = 0.0;
  double v83 = 0.0;
  if (v78 != 0.0)
  {
    double v81 = v81 / v78;
    double v83 = v74 / v78;
  }
  double v84 = v72 - v77;
  if (v79 != 0.0)
  {
    double v84 = v84 / v79;
    double v82 = v76 / v79;
  }
  double v85 = v122 + v84 * v124;
  double v86 = v120 + v81 * v67 - v59;
  double v87 = 0.0;
  double v88 = 0.0;
  if (v61 != 0.0)
  {
    double v86 = v86 / v61;
    double v88 = v67 * v83 / v61;
  }
  double v89 = v85 - v126;
  if (v63 != 0.0)
  {
    double v89 = v89 / v63;
    double v87 = v124 * v82 / v63;
  }
  double v90 = +[PIDebugRect datetimeColor];
  double v91 = +[PIDebugRect debugRectWithRect:v90, @"time", v86, v89, v88, v87 color label];
  [v24 addObject:v91];

  [v115 inactiveRect];
  double v96 = v95 - v59;
  double v97 = 0.0;
  double v98 = 0.0;
  if (v61 != 0.0)
  {
    double v96 = v96 / v61;
    double v98 = v93 / v61;
  }
  double v99 = v92 - v126;
  if (v63 != 0.0)
  {
    double v99 = v99 / v63;
    double v97 = v94 / v63;
  }
  v100 = +[PIDebugRect inactiveColor];
  uint64_t v101 = +[PIDebugRect debugRectWithRect:v100, @"inactive", v96, v99, v98, v97 color label];
  [v24 addObject:v101];

  double v102 = v120 - v59;
  double v103 = 0.0;
  double v104 = 0.0;
  if (v61 != 0.0)
  {
    double v102 = v102 / v61;
    double v104 = v67 / v61;
  }
  double v105 = v122 - v126;
  if (v63 != 0.0)
  {
    double v105 = v105 / v63;
    double v103 = v124 / v63;
  }
  v106 = +[PIDebugRect visibleColor];
  id v107 = +[PIDebugRect debugRectWithRect:v106, @"visible", v102, v105, v104, v103 color label];
  [v24 addObject:v107];

  v108 = [v115 debugDescription];
  uint64_t v109 = objc_msgSend(a1, "debugImageWithInputImage:fullSize:debugRects:label:", v118, v24, v108, v61, v63);

  return v109;
}

+ (id)debugImageWithInputImage:(double)a3 layout:(double)a4 faceRects:(double)a5 saliencyPreferrectRect:(double)a6 saliencyAcceptableRect:(double)a7 gazeAreaRect:(double)a8 settlingEffectRect:(double)a9
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  id v29 = a11;
  id v30 = a12;
  id v31 = a13;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v33 = (void *)MEMORY[0x1E4F8CCC8];
  v207 = v29;
  [v29 extent];
  double v35 = v34;
  double v37 = v36;
  double v38 = [v30 configuration];
  [v38 screenSize];
  objc_msgSend(v33, "bestFaceRectWithImageSize:deviceSize:faceRegions:", v31, v35, v37, v39, v40);
  double v42 = v41;
  double v211 = v43;
  double v212 = v41;
  double v45 = v44;
  double v46 = v43;
  double v48 = v47;

  double v49 = *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24);
  double v200 = v45;
  double v204 = v49 - (v45 + v48);
  double obja = v49;
  char v231 = 0;
  double v50 = (void *)MEMORY[0x1E4F8CBF8];
  uint64_t v51 = [v30 configuration];
  [v30 imageSize];
  unint64_t v53 = (unint64_t)v52;
  [v30 imageSize];
  objc_msgSend(v50, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", 1, v51, v53, (unint64_t)v54, 0, 0, a2, a3, a4, a5, a6, a7, a8, a9, *(void *)&v42,
    *(void *)&v204,
    *(void *)&v46,
    *(void *)&v48,
    &v231);
  double v202 = v56;
  double v203 = v55;
  double v58 = v57;
  double v60 = v59;

  double v201 = v49 - (v58 + v60);
  double v61 = [v30 configuration];
  [v61 screenSize];
  double v63 = v62;
  double v64 = [v30 configuration];
  [v64 screenSize];
  double v66 = v63 / v65;
  double v194 = v63 / v65;

  [v30 imageSize];
  uint64_t v68 = (int)v67;
  [v30 imageSize];
  +[PIPNCropUtilitiesWrapper bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:](PIPNCropUtilitiesWrapper, "bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:", v68, (int)v69, v66, a6, a7, a8, a9, *(void *)&a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&v212, *(void *)&v204, *(void *)&v211, *(void *)&v48, *(void *)&a14,
    *(void *)&a15,
    *(void *)&a16,
    *(void *)&a17);
  double v198 = v71;
  double v199 = v70;
  double v196 = v72;
  double v74 = v73;
  double v75 = (void *)MEMORY[0x1E4F8CBF8];
  [v30 imageSize];
  unint64_t v77 = (unint64_t)v76;
  v205 = v30;
  [v30 imageSize];
  double v79 = v74;
  objc_msgSend(v75, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", v77, (unint64_t)v78, 0, v194, a6, a7, a8, a9, *(void *)&a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
  double v192 = v81;
  double v193 = v80;
  double v195 = v82;
  double v197 = obja - (v196 + v74);
  long long v227 = 0u;
  long long v228 = 0u;
  double v191 = obja - (v83 + v82);
  long long v229 = 0u;
  long long v230 = 0u;
  id obj = v31;
  uint64_t v84 = [obj countByEnumeratingWithState:&v227 objects:v232 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = 0;
    uint64_t v87 = *(void *)v228;
    do
    {
      for (uint64_t i = 0; i != v85; ++i)
      {
        if (*(void *)v228 != v87) {
          objc_enumerationMutation(obj);
        }
        double v89 = *(void **)(*((void *)&v227 + 1) + 8 * i);
        double v90 = objc_msgSend(NSString, "stringWithFormat:", @"f%d", v86 + i);
        [v89 rectValue];
        double v92 = v91;
        double v94 = v93;
        double v96 = v95;
        double v98 = v97;
        double v99 = +[PIDebugRect faceColor];
        v100 = +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v99, v90, v92, v94, v96, v98);
        [v32 addObject:v100];
      }
      uint64_t v86 = (v86 + i);
      uint64_t v85 = [obj countByEnumeratingWithState:&v227 objects:v232 count:16];
    }
    while (v85);
  }

  uint64_t v101 = +[PIDebugRect saliencyPreferredColor];
  double v102 = +[PIDebugRect debugRectWithRect:v101, @"saliency preferred", a2, a3, a4, a5 color label];
  [v32 addObject:v102];

  double v103 = +[PIDebugRect saliencyAcceptableColor];
  double v104 = +[PIDebugRect debugRectWithRect:v103, @"saliency acceptable", a6, a7, a8, a9 color label];
  [v32 addObject:v104];

  double v105 = +[PIDebugRect faceUnionColor];
  v106 = +[PIDebugRect debugRectWithRect:v105, @"face union", v212, v200, v211, v48 color label];
  [v32 addObject:v106];

  id v107 = +[PIDebugRect gazeAreaRectColor];
  v108 = +[PIDebugRect debugRectWithRect:v107, @"gaze area", a14, a15, a16, a17 color label];
  [v32 addObject:v108];

  uint64_t v109 = +[PIDebugRect v2CropColor];
  id v110 = +[PIDebugRect debugRectWithRect:v109, @"bestCropRectV2", v193, v191, v192, v195 color label];
  [v32 addObject:v110];

  id v111 = +[PIDebugRect smartCropColor];
  id v112 = +[PIDebugRect debugRectWithRect:v111, @"smart crop", v199, v197, v198, v79 color label];
  [v32 addObject:v112];

  CGAffineTransform v113 = +[PIDebugRect metadataColor];
  CGAffineTransform v114 = +[PIDebugRect debugRectWithRect:v113, @"metadata", v203, v201, v202, v60 color label];
  [v32 addObject:v114];

  v235.origin.double x = a18;
  v235.origin.double y = a19;
  v235.size.double width = a20;
  v235.size.CGFloat height = a21;
  if (!CGRectIsNull(v235))
  {
    id v115 = +[PIDebugRect settlingEffectColor];
    v116 = +[PIDebugRect debugRectWithRect:v115, @"settling effect", a18, a19, a20, a21 color label];
    [v32 addObject:v116];
  }
  double v117 = *MEMORY[0x1E4F1DAD8];
  double v224 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v205 imageSize];
  double v119 = v118;
  double v121 = v120;
  [v205 timeFrame];
  double v123 = v122;
  double v125 = v124;
  double v127 = v126;
  double v129 = v128;
  [v205 visibleFrame];
  double v134 = v123 - v133;
  double v135 = 0.0;
  double v136 = 0.0;
  if (v131 != 0.0)
  {
    double v134 = v134 / v131;
    double v136 = v127 / v131;
  }
  double v216 = v136;
  double v137 = v125 - v130;
  if (v132 != 0.0)
  {
    double v137 = v137 / v132;
    double v135 = v129 / v132;
  }
  double v217 = v135;
  [v205 inactiveFrame];
  double v139 = v138;
  double v141 = v140;
  double v219 = v142;
  double v220 = v143;
  [v205 inactiveFrame];
  double v222 = v117;
  double v148 = v147 - v117;
  double v149 = 0.0;
  BOOL v150 = v119 == 0.0;
  double v151 = v119;
  double v152 = 0.0;
  if (!v150)
  {
    double v148 = v148 / v151;
    double v152 = v145 / v151;
  }
  double v218 = v151;
  double v153 = v139 + v134 * v219;
  double v154 = v144 - v224;
  if (v121 != 0.0)
  {
    double v154 = v154 / v121;
    double v149 = v146 / v121;
  }
  double v155 = v141 + v137 * v220;
  v156 = +[PIDebugRect inactiveColor];
  v157 = +[PIDebugRect debugRectWithRect:v156, @"inactive", v148, v154, v152, v149 color label];
  [v32 addObject:v157];

  double v158 = v153 - v222;
  double v159 = 0.0;
  double v160 = 0.0;
  if (v218 != 0.0)
  {
    double v158 = v158 / v218;
    double v160 = v216 * v219 / v218;
  }
  double v161 = v155 - v224;
  if (v121 != 0.0)
  {
    double v161 = v161 / v121;
    double v159 = v217 * v220 / v121;
  }
  v162 = +[PIDebugRect inactiveColor];
  v163 = +[PIDebugRect debugRectWithRect:v162, @"inactive time", v158, v161, v160, v159 color label];
  [v32 addObject:v163];

  [v205 timeFrame];
  double v168 = v167 - v222;
  double v169 = 0.0;
  double v170 = 0.0;
  if (v218 != 0.0)
  {
    double v168 = v168 / v218;
    double v170 = v165 / v218;
  }
  double v171 = v164 - v224;
  if (v121 != 0.0)
  {
    double v171 = v171 / v121;
    double v169 = v166 / v121;
  }
  v172 = +[PIDebugRect datetimeColor];
  v173 = +[PIDebugRect debugRectWithRect:v172, @"time", v168, v171, v170, v169 color label];
  [v32 addObject:v173];

  [v205 visibleFrame];
  double v178 = v177 - v222;
  double v179 = 0.0;
  double v180 = 0.0;
  if (v218 != 0.0)
  {
    double v178 = v178 / v218;
    double v180 = v175 / v218;
  }
  double v181 = v174 - v224;
  if (v121 != 0.0)
  {
    double v181 = v181 / v121;
    double v179 = v176 / v121;
  }
  v182 = +[PIDebugRect visibleColor];
  v183 = +[PIDebugRect debugRectWithRect:v182, @"visible", v178, v181, v180, v179 color label];
  [v32 addObject:v183];

  v184 = NSString;
  [v205 deviceResolution];
  uint64_t v186 = (int)v185;
  [v205 deviceResolution];
  v188 = objc_msgSend(v184, "stringWithFormat:", @"device %d x %d", v186, (int)v187);
  v189 = objc_msgSend(a1, "debugImageWithInputImage:fullSize:debugRects:label:", v207, v32, v188, v218, v121);

  return v189;
}

+ (id)debugImageWithInputImage:(id)a3 fullSize:(CGSize)a4 debugRects:(id)a5 label:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v73 = a6;
  [v10 extent];
  double v13 = v12;
  double v15 = v14;
  int v16 = PFPosterEnableHeadroom();
  double v17 = *MEMORY[0x1E4F8D150];
  if (!v16) {
    double v17 = 1.0;
  }
  double v18 = height * v17;
  memset(&v83, 0, sizeof(v83));
  CGAffineTransformMakeScale(&v83, width / v13, v18 / (v15 * v17));
  CGAffineTransform v82 = v83;
  double v74 = v10;
  double v19 = [v10 imageByApplyingTransform:&v82];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v11;
  uint64_t v20 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v79;
    unint64_t v23 = 0x1E5D7D000uLL;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v79 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        [v25 geometry];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        [v19 extent];
        double v36 = v34 + v27 * v35;
        double v39 = v37 + v29 * v38;
        double v40 = v31 * v35;
        double v41 = v33 * v38;
        double v42 = [v25 color];
        double v43 = [v25 label];
        id v44 = v19;
        id v45 = v42;
        id v46 = v43;
        double v47 = objc_msgSend(*(id *)(v23 + 3016), "framedRectImageWithCGRect:color:borderWidth:", v45, v36, v39, v40, v41, 5.0);
        double v48 = v47;
        double v19 = v44;
        if (v47)
        {
          double v19 = [v47 imageByCompositingOverImage:v44];
        }
        if (v46)
        {
          double v49 = createLabelImage(v46, v45, v36, v39);
          double v50 = v49;
          if (v49)
          {
            uint64_t v51 = [v49 imageByCompositingOverImage:v19];
            double v52 = v19;
            uint64_t v53 = v21;
            uint64_t v54 = v22;
            unint64_t v55 = v23;
            uint64_t v56 = v51;

            double v57 = (void *)v56;
            unint64_t v23 = v55;
            uint64_t v22 = v54;
            uint64_t v21 = v53;
            double v19 = v57;
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v21);
  }

  double v58 = +[PIDebugRect labelColor];
  double v59 = *MEMORY[0x1E4F1DAD8];
  CGFloat v60 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v61 = createLabelImage(v73, v58, *MEMORY[0x1E4F1DAD8], v60);

  memset(&v82, 0, sizeof(v82));
  [v19 extent];
  double v63 = v62;
  [v61 extent];
  CGAffineTransformMakeTranslation(&v82, v63 - v64, 0.0);
  CGAffineTransform v77 = v82;
  double v65 = [v61 imageByApplyingTransform:&v77];

  uint64_t v66 = [v65 imageByCompositingOverImage:v19];
  double v67 = (void *)v66;
  if (v66) {
    uint64_t v68 = (void *)v66;
  }
  else {
    uint64_t v68 = v19;
  }
  id v69 = v68;

  CGAffineTransform v76 = v83;
  memset(&v77, 0, sizeof(v77));
  CGAffineTransformInvert(&v77, &v76);
  CGAffineTransform v76 = v77;
  double v70 = [v69 imageByApplyingTransform:&v76];

  double v71 = objc_msgSend(v70, "imageByCroppingToRect:", v59, v60, width, v18);

  return v71;
}

+ (PISegmentationInactiveResult)computeInactiveFrameWithVisibleFrame:(SEL)a3 imageSize:(CGRect)a4 canUpdateVisibleRect:(CGSize)a5 considerHeadroom:(BOOL)a6 segmentationMatte:(BOOL)a7 layoutConfiguration:(id)a8 context:(id)a9
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  double height = a5.height;
  double width = a5.width;
  double v16 = a4.size.height;
  double v17 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = v23;
  if (v21) {
    BOOL v25 = v23 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  int v26 = !v25;
  double v115 = *MEMORY[0x1E4F8D0A0];
  retstr->var0.origin.double x = x;
  retstr->var0.origin.double y = y;
  retstr->var0.size.double width = v17;
  retstr->var0.size.double height = v16;
  retstr->var1.origin.double x = x;
  retstr->var1.origin.double y = y;
  retstr->var1.size.double width = v17;
  retstr->var1.size.double height = v16;
  CGFloat v27 = *MEMORY[0x1E4F8D0A8];
  memset(&v127, 0, sizeof(v127));
  CGAffineTransformMakeTranslation(&v127, -(x + v17 * 0.5), -y);
  memset(&v126, 0, sizeof(v126));
  double v111 = v27;
  CGAffineTransformMakeScale(&v126, v27, v27);
  memset(&v125, 0, sizeof(v125));
  CGAffineTransformMakeTranslation(&v125, x + v17 * 0.5, y);
  memset(&v124, 0, sizeof(v124));
  CGAffineTransform t1 = v127;
  CGAffineTransform t2 = v126;
  CGAffineTransformConcat(&v123, &t1, &t2);
  CGAffineTransform t1 = v125;
  CGAffineTransformConcat(&v124, &v123, &t1);
  v128.origin.double x = 0.0;
  v128.origin.double y = 0.0;
  v128.size.double width = width;
  v128.size.double height = height;
  v137.origin.double x = x;
  v137.origin.double y = y;
  v137.size.double width = v17;
  v137.size.double height = v16;
  BOOL v28 = CGRectContainsRect(v128, v137);
  double v29 = *MEMORY[0x1E4F8D150];
  if (!v12 || v28) {
    double v29 = 1.0;
  }
  double v30 = height * v29;
  CGAffineTransform t1 = v124;
  v129.origin.double x = x;
  double v114 = y;
  v129.origin.double y = y;
  double v117 = v17;
  v129.size.double width = v17;
  v129.size.double height = v16;
  CGRect v130 = CGRectApplyAffineTransform(v129, &t1);
  CGFloat v31 = v130.origin.x;
  CGFloat v32 = v130.origin.y;
  CGFloat v33 = v130.size.width;
  CGFloat v34 = v130.size.height;
  double v35 = height;
  if (v26 == 1)
  {
    +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, v130.origin.x, v130.origin.y, v130.size.width, v130.size.height, width, height, v115);
    CGFloat v31 = v36;
    CGFloat v32 = v37;
    CGFloat v33 = v38;
    CGFloat v34 = v39;
  }
  v131.origin.double x = 0.0;
  v131.origin.double y = 0.0;
  v131.size.double width = width;
  double rect1 = v30;
  v131.size.double height = v30;
  CGFloat v40 = v31;
  CGFloat v41 = v32;
  CGFloat v42 = v33;
  CGFloat v43 = v34;
  if (CGRectContainsRect(v131, *(CGRect *)&v31))
  {
    retstr->var1.origin.double x = v40;
    retstr->var1.origin.double y = v32;
    retstr->var1.size.double width = v42;
  }
  else
  {
    double v45 = width;
    double v106 = v40;
    double v107 = v32;
    double v108 = v34;
    double v109 = v42;
    CGFloat v110 = width;
    if (v13)
    {
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeScale(&t1, 1.0 / v111, 1.0 / v111);
      memset(&t2, 0, sizeof(t2));
      CGAffineTransform v119 = v127;
      CGAffineTransform v118 = t1;
      CGAffineTransformConcat(&v120, &v119, &v118);
      CGAffineTransform v119 = v125;
      CGAffineTransformConcat(&t2, &v120, &v119);
      CGAffineTransform v119 = t2;
      v132.origin.double x = x;
      v132.origin.double y = v114;
      v132.size.double width = v117;
      v132.size.double height = v16;
      CGRect v133 = CGRectApplyAffineTransform(v132, &v119);
      CGFloat v100 = v133.origin.x;
      CGFloat v102 = v133.size.height;
      CGFloat v112 = v133.origin.y;
      CGFloat v104 = v133.size.width;
      double v46 = v16;
      double v47 = v117;
      double v48 = v114;
      CGFloat v49 = x;
      if (v26)
      {
        +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, x, v114, v117, v16, width, v35, v115, v16);
        CGFloat v49 = v50;
        double v48 = v51;
        double v47 = v52;
        double v46 = v53;
      }
      v134.origin.double x = 0.0;
      v134.origin.double y = 0.0;
      v134.size.double width = width;
      v134.size.double height = rect1;
      CGFloat v54 = v49;
      CGFloat v55 = v48;
      CGFloat v56 = v47;
      CGFloat v57 = v46;
      if (CGRectContainsRect(v134, *(CGRect *)(&v48 - 1)))
      {
        retstr->var0.origin.double x = v100;
        retstr->var0.origin.double y = v112;
        retstr->var0.size.double width = v104;
        retstr->var0.size.double height = v102;
        retstr->var1.origin.double x = v49;
        retstr->var1.origin.double y = v55;
        retstr->var1.size.double width = v56;
        retstr->var1.size.double height = v57;
        goto LABEL_14;
      }
      double v45 = width;
    }
    CGFloat v58 = x;
    CGFloat v59 = v114;
    double v60 = v117;
    double v113 = v16;
    if (v26)
    {
      CGFloat v61 = v45;
      +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, x, v114, v117, v16);
      v138.origin.double x = v62;
      CGFloat v64 = v63;
      double v60 = v65;
      CGFloat v67 = v66;
      v135.origin.double x = 0.0;
      v135.origin.double y = 0.0;
      CGFloat v68 = v61;
      v135.size.double width = v61;
      CGFloat v58 = v138.origin.x;
      v135.size.double height = rect1;
      v138.origin.double y = v64;
      v138.size.double width = v60;
      v138.size.double height = v67;
      if (CGRectContainsRect(v135, v138))
      {
        retstr->var1.origin.double x = v58;
        retstr->var1.origin.double y = v64;
        retstr->var1.size.double width = v60;
        retstr->var1.size.double height = v67;
        goto LABEL_14;
      }
      double v113 = v67;
      double v45 = v68;
      CGFloat v59 = v64;
    }
    double v103 = v59;
    double v105 = v58;
    double v101 = v16;
    double v70 = v108;
    double v69 = v109;
    double v71 = v107 + v108;
    double v72 = v45;
    double v73 = rect1;
    double v74 = v45 + 0.0;
    if (v109 + v106 >= v45 + 0.0) {
      double v75 = v45 + 0.0;
    }
    else {
      double v75 = v109 + v106;
    }
    double v76 = fmax(v75, 0.0);
    double v77 = rect1 + 0.0;
    if (v71 >= rect1 + 0.0) {
      double v78 = rect1 + 0.0;
    }
    else {
      double v78 = v107 + v108;
    }
    double v79 = v106 + v76 - (v109 + v106);
    double v80 = v107 + fmax(v78, 0.0) - v71;
    if (v79 >= v74) {
      double v79 = v74;
    }
    double v81 = fmax(v79, 0.0);
    if (v80 >= v77) {
      double v82 = rect1 + 0.0;
    }
    else {
      double v82 = v80;
    }
    double v83 = fmax(v82, 0.0);
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    double v86 = v81;
    double v87 = v83;
    if (CGRectContainsRect(*(CGRect *)(&v72 - 2), *(CGRect *)(&v69 - 2)) && v81 == v106)
    {
      retstr->var1.origin.double x = v81;
      retstr->var1.origin.double y = v83;
      retstr->var1.size.double width = v109;
      retstr->var1.size.double height = v108;
      goto LABEL_14;
    }
    double v89 = v103 + v113;
    if (v105 + v60 >= v74) {
      double v90 = v74;
    }
    else {
      double v90 = v105 + v60;
    }
    double v91 = fmax(v90, 0.0);
    if (v89 >= v77) {
      double v92 = rect1 + 0.0;
    }
    else {
      double v92 = v103 + v113;
    }
    double v93 = v105 + v91 - (v105 + v60);
    double v94 = v103 + fmax(v92, 0.0) - v89;
    if (v93 >= v74) {
      double v93 = v74;
    }
    double v95 = fmax(v93, 0.0);
    if (v94 >= v77) {
      double v96 = rect1 + 0.0;
    }
    else {
      double v96 = v94;
    }
    double v97 = fmax(v96, 0.0);
    v136.origin.double x = 0.0;
    v136.origin.double y = 0.0;
    v136.size.double width = v110;
    v136.size.double height = rect1;
    v139.origin.double x = v95;
    v139.origin.double y = v97;
    v139.size.double width = v60;
    v139.size.double height = v113;
    if (CGRectContainsRect(v136, v139) && v95 == v105)
    {
      retstr->var1.origin.double x = v95;
      retstr->var1.origin.double y = v97;
      retstr->var1.size.double width = v60;
      retstr->var1.size.double height = v113;
      goto LABEL_14;
    }
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_245);
    }
    CGFloat v34 = v101;
    double v99 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(t1.a) = 0;
      _os_log_debug_impl(&dword_1A9680000, v99, OS_LOG_TYPE_DEBUG, "Unable to calculate a new inactiveRect; falling back to visible frame",
        (uint8_t *)&t1,
        2u);
    }
    retstr->var1.origin.double x = x;
    retstr->var1.origin.double y = v114;
    retstr->var1.size.double width = v117;
  }
  retstr->var1.size.double height = v34;
LABEL_14:

  return result;
}

+ (CGRect)_computeAvoidingRect:(CGRect)a3 imageSize:(CGSize)a4 maxYMotion:(double)a5 segmentationMatte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v17)
  {
    CGFloat v32 = NUAssertLogger_9283();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      CGFloat v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "segmentationMatte != nil");
      LODWORD(v46.a) = 138543362;
      *(void *)((char *)&v46.a + 4) = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v46, 0xCu);
    }
    CGFloat v34 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v36 = NUAssertLogger_9283();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v37)
      {
        CGFloat v40 = dispatch_get_specific(*v34);
        CGFloat v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        CGFloat v43 = [v41 callStackSymbols];
        id v44 = [v43 componentsJoinedByString:@"\n"];
        LODWORD(v46.a) = 138543618;
        *(void *)((char *)&v46.a + 4) = v40;
        WORD2(v46.b) = 2114;
        *(void *)((char *)&v46.b + 6) = v44;
        _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v46, 0x16u);
      }
    }
    else if (v37)
    {
      double v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v39 = [v38 componentsJoinedByString:@"\n"];
      LODWORD(v46.a) = 138543362;
      *(void *)((char *)&v46.a + 4) = v39;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v46, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v20 = v19;
  +[PISegmentationHelper computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:](PISegmentationHelper, "computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:", v17, v18, 0, v19, x, y, v14, v13, width, height);
  double v22 = fmin(v21, 0.0);
  memset(&v46, 0, sizeof(v46));
  if (v22 <= -a5) {
    double v23 = a5;
  }
  else {
    double v23 = -v22;
  }
  CGAffineTransformMakeTranslation(&v46, 0.0, v23);
  CGAffineTransform v45 = v46;
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = v14;
  v48.size.double height = v13;
  CGRect v49 = CGRectApplyAffineTransform(v48, &v45);
  CGFloat v24 = v49.origin.x;
  CGFloat v25 = v49.origin.y;
  CGFloat v26 = v49.size.width;
  CGFloat v27 = v49.size.height;

  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

+ (double)computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 zoomTowardsTop:(BOOL *)a4 matte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  memset(v35, 0, sizeof(v35));
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v15, v16, v17, 0, x, y, width, height);
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  double MidX = CGRectGetMidX(v36);
  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  double MaxY = CGRectGetMaxY(v37);
  v38.origin.double x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  double v20 = CGRectGetMidX(v38);
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  double MinY = CGRectGetMinY(v39);
  id v22 = 0;
  id v32 = v22;
  long long v33 = *(_OWORD *)((char *)v35 + 8);
  uint64_t v34 = 0;
  if (a1)
  {
    objc_msgSend(a1, "_computeHeadroomZoomFactorWithVisibleFrame:scaleCenter:initialOverlap:matte:layoutConfiguration:context:", &v32, v15, v16, v17, x, y, width, height, MidX, MaxY);
    double v24 = v23;
    id v29 = *(id *)&v35[0];
    long long v30 = *(_OWORD *)((char *)v35 + 8);
    uint64_t v31 = *((void *)&v35[1] + 1);
    objc_msgSend(a1, "_computeHeadroomZoomFactorWithVisibleFrame:scaleCenter:initialOverlap:matte:layoutConfiguration:context:", &v29, v15, v16, v17, x, y, width, height, v20, MinY);
    CGFloat v26 = *(void **)&v35[0];
  }
  else
  {

    CGFloat v26 = *(void **)&v35[0];
    id v29 = *(id *)&v35[0];
    long long v30 = *(_OWORD *)((char *)v35 + 8);
    uint64_t v31 = *((void *)&v35[1] + 1);
    double v24 = 0.0;
    double v25 = 0.0;
  }
  *a4 = v24 > v25;
  if (v24 >= v25) {
    double v27 = v24;
  }
  else {
    double v27 = v25;
  }

  return v27;
}

+ (double)_computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 scaleCenter:(CGPoint)a4 initialOverlap:(PISegmentationClockOverlapResult *)a5 matte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8
{
  CGFloat v41 = a5;
  double width = a3.size.width;
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  objc_msgSend(MEMORY[0x1E4F8CCB8], "targetZoomFactorLimitWithLayoutType:", objc_msgSend(MEMORY[0x1E4F8CCC8], "layoutTypeFromLayoutConfiguration:", v13));
  double v16 = v15;
  id v17 = v41->var0;
  int v18 = 0;
  double v19 = v16 + -1.0;
  while (1)
  {
    int v20 = v18 + 1;
    double v21 = (double)(v18 + 1) / 5.0 * v19 + 1.0;
    objc_msgSend(a1, "scaleRect:scaleFactor:scaleCenter:", x, y, width, height, 1.0 / v21, a4.x, a4.y, v41);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    id v30 = v17;
    memset(buf, 0, sizeof(buf));
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v12, v13, v14, 0, v23, v25, v27, v29);
    id v17 = 0;

    if (([v30 isEqualToString:0] & 1) == 0) {
      break;
    }

    ++v18;
    if (v20 == 5)
    {
      id v30 = 0;
      id v31 = 0;
      double v21 = -1.0;
      goto LABEL_22;
    }
  }
  id v31 = *(id *)buf;

  double v32 = (double)v18 / 5.0 * v19 + 1.0;
  int v33 = 3;
  do
  {
    objc_msgSend(a1, "scaleRect:scaleFactor:scaleCenter:", x, y, width, height, 1.0 / ((v32 + v21) * 0.5), a4.x, a4.y);
    memset(buf, 0, sizeof(buf));
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v12, v13, v14, 0);
    int v34 = [0 isEqualToString:v30];
    id v35 = 0;
    if (v34) {
      CGRect v36 = v30;
    }
    else {
      CGRect v36 = v31;
    }
    if (v34) {
      id v30 = v35;
    }
    else {
      id v31 = v35;
    }
    if (v34) {
      double v32 = (v32 + v21) * 0.5;
    }
    else {
      double v21 = (v32 + v21) * 0.5;
    }

    --v33;
  }
  while (v33);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_245);
  }
  CGRect v37 = (id)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    CGRect v39 = [NSNumber numberWithDouble:v32];
    CGFloat v40 = [NSNumber numberWithDouble:v21];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v40;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v30;
    __int16 v47 = 2112;
    id v48 = v31;
    _os_log_debug_impl(&dword_1A9680000, v37, OS_LOG_TYPE_DEBUG, "Pixel-based headroom zoom final range %@,%@: %@,%@", buf, 0x2Au);
  }
  if ([v30 isEqualToString:*MEMORY[0x1E4F8D090]]) {
    double v21 = v32;
  }
LABEL_22:

  return v21;
}

+ (CGRect)scaleRect:(CGRect)a3 scaleFactor:(double)a4 scaleCenter:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5.x, -a5.y);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a4, a4);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, x, y);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransform t1 = v18;
  CGAffineTransform v12 = v17;
  CGAffineTransformConcat(&v14, &t1, &v12);
  CGAffineTransform t1 = v16;
  CGAffineTransformConcat(&v15, &v14, &t1);
  CGAffineTransform t1 = v15;
  v19.origin.CGFloat x = v11;
  v19.origin.CGFloat y = v10;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v19, &t1);
}

+ (double)computeAvoidOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 outputUnsafeOverlap:(double *)a7 context:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (!v15)
  {
    double v86 = NUAssertLogger_9283();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      double v87 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "segmentationMatte != nil");
      *(_DWORD *)buf = 138543362;
      CGFloat v100 = v87;
      _os_log_error_impl(&dword_1A9680000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v88 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v90 = NUAssertLogger_9283();
    BOOL v91 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v91)
      {
        double v94 = dispatch_get_specific(*v88);
        double v95 = (void *)MEMORY[0x1E4F29060];
        id v96 = v94;
        double v97 = [v95 callStackSymbols];
        double v98 = [v97 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGFloat v100 = v94;
        __int16 v101 = 2114;
        CGFloat v102 = v98;
        _os_log_error_impl(&dword_1A9680000, v90, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v91)
    {
      double v92 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v93 = [v92 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGFloat v100 = v93;
      _os_log_error_impl(&dword_1A9680000, v90, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  CGAffineTransform v18 = v17;
  [v16 timeOverlapCheckBottom];
  double v20 = x + v19 * width;
  double v22 = width * v21;
  [v15 extent];
  double v24 = imageDataOfRowAverages(v18, v15, v20, 0.0, v22, v23);
  int v25 = [v24 length];
  if (v25 >= 0) {
    int v26 = v25;
  }
  else {
    int v26 = v25 + 3;
  }
  int v27 = v26 >> 2;
  id v28 = v24;
  uint64_t v29 = [v28 bytes];
  signed int v30 = vcvtmd_s64_f64(height);
  [v16 unsafeRect];
  signed int v32 = vcvtmd_s64_f64(height * v31);
  unsigned int v34 = vcvtmd_s64_f64(height * v33);
  if (v26 >> 2 >= (int)y) {
    int v35 = (int)y;
  }
  else {
    int v35 = v26 >> 2;
  }
  unsigned int v36 = v35 & ~(v35 >> 31);
  double v37 = -1.0;
  int v38 = 0;
  if ((int)(v36 + v30) >= v26 >> 2)
  {
    int v54 = 0;
    double v43 = 10.0;
  }
  else
  {
    signed int v39 = v32 + v34 + v36;
    unint64_t v40 = v32 + (unint64_t)v36;
    uint64_t v41 = -(uint64_t)v40;
    id v42 = (float *)(v29 + 4 * v40);
    double v43 = 10.0;
    uint64_t v44 = v35 & ~(v35 >> 31);
    while (1)
    {
      if (v27 >= (uint64_t)v39) {
        uint64_t v45 = v39;
      }
      else {
        uint64_t v45 = v27;
      }
      uint64_t v46 = v44 + v32;
      int v47 = v44 + v32 + v34;
      if (v47 >= v27) {
        int v47 = v26 >> 2;
      }
      double v48 = 0.0;
      if (v46 < v47)
      {
        uint64_t v49 = v45 + v41;
        double v50 = v42;
        do
        {
          float v51 = *v50++;
          double v48 = v48 + v51;
          --v49;
        }
        while (v49);
      }
      float v52 = v48 / (double)(v47 - (int)v46);
      double v53 = v52;
      if (v53 < 0.01) {
        break;
      }
      if (v43 > v53) {
        int v38 = v44 - v36;
      }
      ++v44;
      if (v43 > v53) {
        double v43 = v53;
      }
      ++v39;
      --v41;
      ++v42;
      if (v44 >= v27 - (uint64_t)v30)
      {
        int v54 = 0;
        goto LABEL_27;
      }
    }
    int v54 = v44 - v36;
    double v37 = v53;
  }
LABEL_27:
  if (v35 < 1)
  {
LABEL_42:
    BOOL v70 = 0;
    int v71 = 0;
    BOOL v72 = v54 != 0;
    double v68 = -1.0;
  }
  else
  {
    signed int v55 = v32 + v34 + v36;
    unint64_t v56 = v32 + (unint64_t)v36;
    uint64_t v57 = -(uint64_t)v56;
    CGFloat v58 = (float *)(v29 + 4 * v56);
    uint64_t v59 = v35 & ~(v35 >> 31);
    while (1)
    {
      if (v27 >= (uint64_t)v55) {
        uint64_t v60 = v55;
      }
      else {
        uint64_t v60 = v27;
      }
      uint64_t v61 = v59 + v32;
      int v62 = v59 + v32 + v34;
      if (v62 >= v27) {
        int v62 = v26 >> 2;
      }
      double v63 = 0.0;
      if (v61 < v62)
      {
        uint64_t v64 = v60 + v57;
        double v65 = v58;
        do
        {
          float v66 = *v65++;
          double v63 = v63 + v66;
          --v64;
        }
        while (v64);
      }
      float v67 = v63 / (double)(v62 - (int)v61);
      double v68 = v67;
      if (v68 < 0.01) {
        break;
      }
      if (v43 > v68)
      {
        int v38 = v59 - v36;
        double v43 = v68;
      }
      --v55;
      --v58;
      ++v57;
      if (v59-- <= 1) {
        goto LABEL_42;
      }
    }
    int v71 = v59 - v36;
    BOOL v70 = v71 != 0;
    BOOL v72 = v54 != 0;
    if (v71 && v54)
    {
      if (v71 >= 0) {
        unsigned int v84 = v71;
      }
      else {
        unsigned int v84 = -v71;
      }
      if (v54 >= 0) {
        unsigned int v85 = v54;
      }
      else {
        unsigned int v85 = -v54;
      }
      if (v84 >= v85)
      {
        int v73 = v54;
      }
      else
      {
        double v37 = v68;
        int v73 = v71;
      }
      if (!a7) {
        goto LABEL_59;
      }
LABEL_58:
      *a7 = v37;
      goto LABEL_59;
    }
  }
  if (v72)
  {
    int v73 = v54;
  }
  else
  {
    double v37 = v68;
    int v73 = v71;
  }
  if (!v72 && !v70)
  {
    double v37 = v43;
    int v73 = v38;
    if (v43 >= 0.5)
    {
      signed int v74 = v36 + v32;
      if ((int)(v74 + v34) >= v27) {
        int v75 = v26 >> 2;
      }
      else {
        int v75 = v74 + v34;
      }
      double v76 = 0.0;
      int v77 = v75 - v74;
      if (v75 > v74)
      {
        uint64_t v78 = v74 - (uint64_t)v75;
        double v79 = (float *)(v29 + 4 * v74);
        do
        {
          float v80 = *v79++;
          double v76 = v76 + v80;
        }
        while (!__CFADD__(v78++, 1));
      }
      int v73 = 0;
      float v82 = v76 / (double)v77;
      double v37 = v82;
    }
  }
  if (a7) {
    goto LABEL_58;
  }
LABEL_59:

  return (double)v73;
}

+ (double)computeTargetOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double v121 = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [v14 timeOverlapCheckBottom];
  double v17 = v16;
  double v19 = v18;
  [v14 timeOverlapCheckTop];
  double v21 = v20;
  double v23 = x + v22 * width;
  double v120 = y + v20 * height;
  double v25 = width * v24;
  double v27 = height * v26;
  [v13 extent];
  CGAffineTransform v118 = v15;
  CGAffineTransform v119 = v13;
  uint64_t v29 = imageDataOfRowAverages(v15, v13, v23, 0.0, v25, v28);
  int v30 = [v29 length];
  if (v30 >= 0) {
    int v31 = v30;
  }
  else {
    int v31 = v30 + 3;
  }
  int v32 = v31 >> 2;
  id v117 = v29;
  uint64_t v33 = [v117 bytes];
  signed int v34 = vcvtmd_s64_f64(height);
  signed int v35 = vcvtmd_s64_f64(height * v17);
  unsigned int v36 = vcvtmd_s64_f64(height * v19);
  signed int v37 = vcvtmd_s64_f64(height * v21);
  unsigned int v38 = vcvtmd_s64_f64(v27);
  signed int v39 = [MEMORY[0x1E4F8CCC0] systemParameters];
  [v39 targetBottomOverlap];
  double v41 = v40;

  id v42 = [MEMORY[0x1E4F8CCC0] systemParameters];
  [v42 maxBottomOverlap];
  double v44 = v43;

  objc_msgSend(MEMORY[0x1E4F8CCC8], "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v23, v120, v25, v27);
  if (v31 >> 2 >= (int)v121) {
    int v46 = (int)v121;
  }
  else {
    int v46 = v31 >> 2;
  }
  unsigned int v47 = v46 & ~(v46 >> 31);
  if ((int)(v47 + v34) >= v31 >> 2)
  {
    int v80 = 0;
    int v48 = 0;
    double v57 = 1.0;
  }
  else
  {
    int v48 = 0;
    uint64_t v49 = v32 - (uint64_t)v34;
    signed int v50 = v35 + v36 + v47;
    unint64_t v51 = v35 + (unint64_t)v47;
    uint64_t v52 = -(uint64_t)v51;
    double v53 = (float *)(v33 + 4 * v51);
    signed int v54 = v37 + v38 + v47;
    unint64_t v55 = v37 + (unint64_t)v47;
    uint64_t v56 = -(uint64_t)v55;
    double v57 = 1.0;
    uint64_t v58 = v46 & ~(v46 >> 31);
    uint64_t v59 = (float *)(v33 + 4 * v55);
    while (1)
    {
      if (v32 >= (uint64_t)v54) {
        uint64_t v60 = v54;
      }
      else {
        uint64_t v60 = v32;
      }
      if (v32 >= (uint64_t)v50) {
        uint64_t v61 = v50;
      }
      else {
        uint64_t v61 = v32;
      }
      uint64_t v62 = v58 + v35;
      int v63 = v58 + v35 + v36;
      if (v63 >= v32) {
        int v63 = v32;
      }
      double v64 = 0.0;
      double v65 = 0.0;
      if (v62 < v63)
      {
        uint64_t v66 = v61 + v52;
        float v67 = v53;
        do
        {
          float v68 = *v67++;
          double v65 = v65 + v68;
          --v66;
        }
        while (v66);
      }
      uint64_t v69 = v58 + v37;
      if ((int)(v58 + v37 + v38) >= v32) {
        int v70 = v32;
      }
      else {
        int v70 = v58 + v37 + v38;
      }
      if (v69 < v70)
      {
        uint64_t v71 = v60 + v56;
        double v64 = 0.0;
        BOOL v72 = v59;
        do
        {
          float v73 = *v72++;
          double v64 = v64 + v73;
          --v71;
        }
        while (v71);
      }
      float v74 = v65 / (double)(v63 - (int)v62);
      double v75 = v74;
      float v76 = v64 / (double)(v70 - (int)v69);
      double v77 = v76;
      double v78 = vabdd_f64(v75, v41);
      BOOL v79 = v45 > v77 && v75 > 0.01;
      int v80 = v58 - v47;
      if (v79 && v78 < v57)
      {
        double v57 = v78;
        int v48 = v58 - v47;
      }
      if (v41 <= v75 && v44 > v75 && v45 > v77 && v78 < 0.01) {
        break;
      }
      ++v58;
      ++v50;
      --v52;
      ++v53;
      ++v54;
      --v56;
      ++v59;
      if (v58 >= v49)
      {
        int v80 = 0;
        break;
      }
    }
  }
  if (v46 < 1)
  {
LABEL_69:
    int v110 = 0;
  }
  else
  {
    signed int v81 = v35 + v36 + v47;
    unint64_t v82 = v35 + (unint64_t)v47;
    uint64_t v83 = -(uint64_t)v82;
    unsigned int v84 = (float *)(v33 + 4 * v82);
    signed int v85 = v37 + v38 + v47;
    unint64_t v86 = v37 + (unint64_t)v47;
    uint64_t v87 = -(uint64_t)v86;
    uint64_t v88 = v46 & ~(v46 >> 31);
    double v89 = (float *)(v33 + 4 * v86);
    while (1)
    {
      if (v32 >= (uint64_t)v85) {
        uint64_t v90 = v85;
      }
      else {
        uint64_t v90 = v32;
      }
      if (v32 >= (uint64_t)v81) {
        uint64_t v91 = v81;
      }
      else {
        uint64_t v91 = v32;
      }
      uint64_t v92 = v88 + v35;
      int v93 = v88 + v35 + v36;
      if (v93 >= v32) {
        int v93 = v32;
      }
      double v94 = 0.0;
      double v95 = 0.0;
      if (v92 < v93)
      {
        uint64_t v96 = v91 + v83;
        double v97 = v84;
        do
        {
          float v98 = *v97++;
          double v95 = v95 + v98;
          --v96;
        }
        while (v96);
      }
      uint64_t v99 = v88 + v37;
      int v100 = v88 + v37 + v38;
      if (v100 >= v32) {
        int v100 = v32;
      }
      if (v99 < v100)
      {
        uint64_t v101 = v90 + v87;
        double v94 = 0.0;
        CGFloat v102 = v89;
        do
        {
          float v103 = *v102++;
          double v94 = v94 + v103;
          --v101;
        }
        while (v101);
      }
      float v104 = v95 / (double)(v93 - (int)v92);
      double v105 = v104;
      float v106 = v94 / (double)(v100 - (int)v99);
      double v107 = v106;
      double v108 = vabdd_f64(v105, v41);
      BOOL v109 = v45 > v107 && v105 > 0.01;
      int v110 = v88 - v47;
      int v111 = v109 && v108 < v57;
      if (v111) {
        int v48 = v88 - v47;
      }
      if (v41 <= v105 && v44 > v105 && v45 > v107 && v108 < 0.01) {
        break;
      }
      if (v111) {
        double v57 = v108;
      }
      --v81;
      --v84;
      --v85;
      --v89;
      ++v83;
      ++v87;
      if (v88-- <= 1) {
        goto LABEL_69;
      }
    }
  }
  if (v80) {
    BOOL v113 = 1;
  }
  else {
    BOOL v113 = v110 == 0;
  }
  if (!v113) {
    int v48 = v110;
  }
  if (v110) {
    BOOL v114 = 1;
  }
  else {
    BOOL v114 = v80 == 0;
  }
  if (!v114) {
    int v48 = v80;
  }
  double v115 = (double)v48;

  return v115;
}

+ (double)computeMatteCoverageWithRect:(CGRect)a3 segmentationMatte:(id)a4 context:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  CGFloat v11 = objc_msgSend(a4, "imageByCroppingToRect:", x, y, width, height);
  CGAffineTransform v12 = [MEMORY[0x1E4F1E040] areaAverageFilter];
  [v12 setInputImage:v11];
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  float v16 = 0.0;
  id v13 = [v12 outputImage];
  objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v13, &v16, 4, *MEMORY[0x1E4F1E2A8], 0, 0.0, 0.0, 1.0, 1.0);

  double v14 = v16;
  return v14;
}

+ (double)computeAlphaCoverageWithRect:(CGRect)a3 foregroundImage:(id)a4 context:(id)a5
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  CGFloat v11 = objc_msgSend(a4, "imageByCroppingToRect:", x, y, width, height);
  CGAffineTransform v12 = [MEMORY[0x1E4F1E040] areaAverageFilter];
  [v12 setInputImage:v11];
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  id v13 = [v12 outputImage];
  objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v13, &v15, 16, *MEMORY[0x1E4F1E2F8], 0, 0.0, 0.0, 1.0, 1.0);

  LODWORD(height) = HIDWORD(v16);
  return *(float *)&height;
}

+ (PISegmentationClockOverlapResult)computeClockLayerOrderWithVisibleFrame:(SEL)a3 segmentationMatte:(CGRect)a4 layoutConfiguration:(id)a5 context:(id)a6 interactive:(id)a7
{
  BOOL v8 = a8;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v57 = a5;
  id v16 = a7;
  id v17 = a6;
  [v17 timeOverlapCheckBottom];
  double v55 = y + v19 * height;
  double v56 = x + v18 * width;
  double v53 = height * v21;
  double v54 = width * v20;
  [v17 timeOverlapCheckTop];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = x + v23 * width;
  double v31 = y + v25 * height;
  double v32 = width * v27;
  double v33 = height * v29;
  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", v57, v16, v56, v55, v54, v53);
  double v35 = v34;
  id v36 = (id)*MEMORY[0x1E4F8D090];
  signed int v37 = [MEMORY[0x1E4F8CCC0] systemParameters];
  [v37 maxBottomOverlap];
  double v39 = v38;

  double v40 = (id *)MEMORY[0x1E4F8D098];
  id v41 = v36;
  if (v35 > v39)
  {
    id v41 = (id)*MEMORY[0x1E4F8D098];
  }
  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", v57, v16, v30, v31, v32, v33);
  double v43 = v42;
  objc_msgSend(MEMORY[0x1E4F8CCC8], "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v30, v31, v32, v33);
  if (v43 > v44)
  {
    id v45 = *v40;

    id v41 = v45;
  }
  unint64_t v46 = [MEMORY[0x1E4F8CCC8] clockIntersectionFromTopRectMatteCoverage:v43 bottomRectMatteCoverage:v35];
  objc_msgSend(MEMORY[0x1E4F8CCC8], "timeOverlapCheckThresholdForTopRect:isInteractive:", 1, v30, v31, v32, v33);
  double v48 = v47;
  id v49 = v36;
  if (v43 > v48)
  {
    id v50 = *v40;

    unint64_t v46 = 3;
    id v49 = v50;
  }
  if (v8) {
    unint64_t v51 = v49;
  }
  else {
    unint64_t v51 = v41;
  }
  retstr->var0 = v51;
  retstr->var1 = v46;
  retstr->var2 = v35;
  retstr->var3 = v43;

  return result;
}

+ (BOOL)topEdgeHasNoContactWithInspectionMatte:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 extent];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11 + -5.0;
  id v13 = [MEMORY[0x1E4F1E040] areaAverageFilter];
  [v13 setInputImage:v6];

  objc_msgSend(v13, "setExtent:", v8, v12, v10, 5.0);
  double v14 = [v13 outputImage];
  float v16 = 0.0;
  objc_msgSend(v5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, &v16, 4, *MEMORY[0x1E4F1E2A8], 0, *MEMORY[0x1E4F8A248], *(double *)(MEMORY[0x1E4F8A248] + 8), *(double *)(MEMORY[0x1E4F8A248] + 16), *(double *)(MEMORY[0x1E4F8A248] + 24));

  LOBYTE(v5) = v16 < 0.05;
  return (char)v5;
}

+ (float)groundedScoreForSegmentationMatte:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 extent];
  double v8 = v7;
  double v10 = v9 + v7 * 0.0;
  double v13 = v11 + v12 * 0.0;
  double v14 = v12 * 0.05;
  uint64_t v15 = [MEMORY[0x1E4F1E040] areaAverageFilter];
  [v15 setInputImage:v6];

  objc_msgSend(v15, "setExtent:", v10, v13, v8, v14);
  float v16 = [v15 outputImage];
  int v18 = 0;
  objc_msgSend(v5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v16, &v18, 4, *MEMORY[0x1E4F1E2A8], 0, *MEMORY[0x1E4F8A248], *(double *)(MEMORY[0x1E4F8A248] + 8), *(double *)(MEMORY[0x1E4F8A248] + 16), *(double *)(MEMORY[0x1E4F8A248] + 24));

  LODWORD(v8) = v18;
  return *(float *)&v8;
}

+ (id)localConfidenceImage:(id)a3
{
  id v3 = a3;
  v4 = [v3 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&unk_1F000ACD8];
  id v5 = [v3 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&unk_1F000AD00];

  id v6 = [v5 imageByApplyingFilter:@"CIColorInvert"];

  double v7 = [MEMORY[0x1E4F1E040] multiplyCompositingFilter];
  [v7 setInputImage:v4];
  [v7 setBackgroundImage:v6];
  double v8 = [v7 outputImage];
  double v9 = +[PISegmentationHelper openMask:v8 withRadius:10.0];

  return v9;
}

+ (float)localConfidenceScoreForLocalConfidenceImage:(id)a3 extent:(CGRect)a4 context:(id)a5
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = (void *)MEMORY[0x1E4F1E040];
  id v11 = a5;
  id v12 = a3;
  double v13 = [v10 areaAverageFilter];
  [v13 setInputImage:v12];

  objc_msgSend(v13, "setExtent:", x, y, width, height);
  double v14 = [v13 outputImage];
  float v16 = 0.0;
  objc_msgSend(v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, &v16, 4, *MEMORY[0x1E4F1E2A8], 0, *MEMORY[0x1E4F8A248], *(double *)(MEMORY[0x1E4F8A248] + 8), *(double *)(MEMORY[0x1E4F8A248] + 16), *(double *)(MEMORY[0x1E4F8A248] + 24));

  *(float *)&CGFloat height = 1.0 - v16;
  return *(float *)&height;
}

+ (PISegmentationBimodalScore)bimodalScoreForHistogram:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 threshold:0.01];
    float v5 = v4;
    [v3 threshold:0.99];
    double v7 = v6;

    float v8 = v7;
    float v9 = fmaxf(fminf(v8 * 4.0, 1.0), 0.0);
    float v10 = 1.0 - v5;
    v11.f32[0] = 1.0 - v5;
    v11.f32[1] = (float)((float)(1.0 - v5) + v8) + -0.5;
    float32x2_t v12 = vmul_f32(v11, (float32x2_t)0x4000000040800000);
    __asm { FMOV            V4.2S, #1.0 }
    float32x2_t v18 = vmaxnm_f32(vminnm_f32(v12, _D4), 0);
    __asm { FMOV            V6.2S, #3.0 }
    float32x2_t v20 = vmul_f32(vmul_f32(v18, v18), vmla_f32(_D6, (float32x2_t)0xC0000000C0000000, v18));
    float v21 = vmuls_lane_f32((float)((float)(v9 * v9) * (float)((float)(v9 * -2.0) + 3.0)) * v20.f32[0], v20, 1);
  }
  else
  {
    float v8 = 0.0;
    float v10 = 0.0;
    float v21 = 0.0;
  }
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v21;
  return result;
}

+ (BOOL)matteHistogramIndicatesSubjectDetected:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a3 threshold:0.6];
  return v3 > 0.02;
}

+ (id)upsampleBackgroundImage:(id)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (v6)
  {
    double v7 = v6;
    [v6 extent];
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, width / v8, height / v9);
    CGAffineTransform v12 = v13;
    float v10 = [v7 imageByApplyingTransform:&v12 highQualityDownsample:1];
  }
  else
  {
    float v10 = 0;
  }
  return v10;
}

+ (id)upsampleMatteImage:(id)a3 guideImage:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 extent];
    double v8 = v7;
    double v10 = v9;
    [v6 extent];
    if (v8 != v12 || v10 != v11)
    {
      v18[0] = @"inputSmallImage";
      v18[1] = @"inputSpatialSigma";
      v19[0] = v5;
      v19[1] = &unk_1F000A438;
      v18[2] = @"inputLumaSigma";
      v19[2] = &unk_1F000A448;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      uint64_t v15 = [v6 imageByApplyingFilter:@"CIEdgePreserveUpsampleFilter" withInputParameters:v14];

      float v16 = [v15 imageByClampingToExtent];
      [v15 extent];
      objc_msgSend(v16, "imageByCroppingToRect:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

+ (id)backgroundForImage:(id)a3 matte:(id)a4 infill:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [a1 infillMaskForSegmentationMatte:a4];
  [v9 extent];
  CGAffineTransform v13 = objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v10, v11, v12);

  [v9 extent];
  float v16 = objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v8, v14, v15);

  id v17 = [MEMORY[0x1E4F1E040] blendWithMaskFilter];
  [v17 setBackgroundImage:v9];

  [v17 setInputImage:v16];
  [v17 setMaskImage:v13];
  float32x2_t v18 = [v17 outputImage];

  return v18;
}

+ (id)backgroundForImage:(id)a3 matte:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 extent];
  double v10 = objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v6, v8, v9);

  double v11 = [MEMORY[0x1E4F1E040] blendWithMaskFilter];
  [v11 setBackgroundImage:v7];

  [v11 setInputImage:0];
  [v11 setMaskImage:v10];
  double v12 = [v11 outputImage];

  return v12;
}

+ (id)foregroundForImage:(id)a3 matte:(id)a4
{
  id v6 = a3;
  id v7 = [a1 upsampleMatteImage:a4 guideImage:v6];
  double v8 = [MEMORY[0x1E4F1E040] blendWithMaskFilter];
  [v8 setBackgroundImage:0];
  [v8 setInputImage:v6];

  [v8 setMaskImage:v7];
  double v9 = [v8 outputImage];

  return v9;
}

+ (id)invertImage:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F1E040];
  id v4 = a3;
  id v5 = [v3 colorInvertFilter];
  [v5 setInputImage:v4];

  id v6 = [v5 outputImage];

  return v6;
}

+ (id)openMask:(id)a3 withRadius:(double)a4
{
  id v5 = a3;
  [v5 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v5 imageByClampingToExtent];

  double v15 = [MEMORY[0x1E4F1E040] morphologyMinimumFilter];
  *(float *)&a4 = a4;
  LODWORD(v16) = LODWORD(a4);
  [v15 setRadius:v16];
  [v15 setInputImage:v14];
  id v17 = [MEMORY[0x1E4F1E040] morphologyMaximumFilter];
  float32x2_t v18 = [v15 outputImage];
  [v17 setInputImage:v18];

  LODWORD(v19) = LODWORD(a4);
  [v17 setRadius:v19];
  float32x2_t v20 = [v17 outputImage];
  float v21 = objc_msgSend(v20, "imageByCroppingToRect:", v7, v9, v11, v13);

  return v21;
}

+ (id)erodeMask:(id)a3 withRadius:(double)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a3;
  double v7 = [v5 morphologyMinimumFilter];
  *(float *)&double v8 = a4;
  [v7 setRadius:v8];
  [v7 setInputImage:v6];
  double v9 = [v7 outputImage];
  [v6 extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  float32x2_t v18 = objc_msgSend(v9, "imageByCroppingToRect:", v11, v13, v15, v17);

  return v18;
}

+ (id)dilateMask:(id)a3 withRadius:(double)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a3;
  double v7 = [v5 morphologyMaximumFilter];
  *(float *)&double v8 = a4;
  [v7 setRadius:v8];
  [v7 setInputImage:v6];
  double v9 = [v7 outputImage];
  [v6 extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  float32x2_t v18 = objc_msgSend(v9, "imageByCroppingToRect:", v11, v13, v15, v17);

  return v18;
}

+ (id)thresholdImage:(id)a3 withThreshold:(double)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a3;
  double v7 = [v5 colorThresholdFilter];
  *(float *)&double v8 = a4;
  [v7 setThreshold:v8];
  [v7 setInputImage:v6];

  double v9 = [v7 outputImage];

  return v9;
}

+ (id)imageWithColor:(id)a3 extent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = (void *)MEMORY[0x1E4F1E040];
  id v9 = a3;
  double v10 = [v8 filterWithName:@"CIConstantColorGenerator"];
  [v10 setValue:v9 forKey:*MEMORY[0x1E4F1E448]];

  double v11 = [v10 outputImage];
  double v12 = objc_msgSend(v11, "imageByCroppingToRect:", x, y, width, height);

  return v12;
}

+ (id)infillMaskForSegmentationMatte:(id)a3
{
  id v3 = a3;
  id v4 = +[PISegmentationHelper thresholdImage:v3 withThreshold:0.1];
  id v5 = +[PIGlobalSettings globalSettings];
  [v5 segmentationInfillDilationPercent];
  double v7 = v6;

  if (v7 > 0.0)
  {
    [v3 extent];
    if (v8 >= v9) {
      double v10 = v8;
    }
    else {
      double v10 = v9;
    }
    uint64_t v11 = +[PISegmentationHelper dilateMask:v4 withRadius:v7 * v10];

    id v4 = (void *)v11;
  }

  return v4;
}

+ (id)imageFromImageLayer:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  double v6 = (__CVBuffer *)[v4 image];

  double v7 = (void *)CVBufferCopyAttachment(v6, (CFStringRef)*MEMORY[0x1E4F249D8], 0);
  double v8 = v7;
  if (v7)
  {
    int v9 = [v7 isEqualToString:*MEMORY[0x1E4F249E8]];
    double v10 = [NSNumber numberWithInt:v9 ^ 1u];
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1E3B0]];
  }
  uint64_t v11 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v6 options:v5];

  return v11;
}

@end