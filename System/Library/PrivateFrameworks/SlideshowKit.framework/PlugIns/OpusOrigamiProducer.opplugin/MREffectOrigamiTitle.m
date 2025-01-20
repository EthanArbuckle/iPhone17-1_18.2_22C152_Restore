@interface MREffectOrigamiTitle
- (BOOL)getVerticesCoordinates:(MREffectOrigamiTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectOrigamiTitle)init;
- (id)_retainedByUserBackColorImageInContext:(id)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_cleanupSwingTimings;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setupSwingTimings;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderBreakImage:(id)a3 atProgress:(double)a4 withKey:(id)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9;
- (void)renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10;
- (void)renderFallImage:(id)a3 atProgress:(double)a4 strength:(double)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9 :(CGPoint *)a10 :(CGPoint)a11;
- (void)renderStillImage:(id)a3 withKey:(id)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8;
- (void)renderTextEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderTitleEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MREffectOrigamiTitle

- (MREffectOrigamiTitle)init
{
  v4.receiver = self;
  v4.super_class = (Class)MREffectOrigamiTitle;
  v2 = [(MREffectOrigamiTitle *)&v4 init];
  if (v2)
  {
    *(void *)(v2 + 193) = objc_alloc_init(MRCroppingSprite);
    if (([*((id *)v2 + 4) hasSuffix:@"Text"] & 1) == 0) {
      *(void *)(v2 + 249) = objc_alloc_init((Class)NSMutableDictionary);
    }
    v5[0] = xmmword_1654A0;
    v5[1] = xmmword_1654B0;
    *(void *)(v2 + 281) = [[MRCAMLBezierData alloc] initWithControlPoints:v5];
    [v2 _setupSwingTimings];
    *(_DWORD *)(v2 + 305) = -1082130432;
    *(void *)(v2 + 321) = objc_alloc_init((Class)NSMutableDictionary);
  }
  return (MREffectOrigamiTitle *)v2;
}

- (void)_cleanup
{
  *(void *)((char *)&self->mBackColorForImage[2] + 1) = 0;
  *(NSMutableArray **)((char *)&self->mWordIndexForGlyph + 1) = 0;

  *(void *)&self->mLineWordCounts[1] = 0;
  *(MRTextRenderer **)((char *)&self->mText0Renderer + 1) = 0;

  *(NSArray **)((char *)&self->mPatchworkAtEnd + 1) = 0;
  *(int64_t *)((char *)&self->mWordCount + 1) = 0;
  [(MREffectOrigamiTitle *)self _cleanupSwingTimings];
}

- (void)_setupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = (MRCAMLBezierData *)[[MROrigamiAnimationPath alloc] initWithSwingType:1];
}

- (void)_cleanupSwingTimings
{
  *(MRCAMLBezierData **)((char *)&self->mBreakCurve + 1) = 0;
}

- (BOOL)isLoadedForTime:(double)a3
{
  id v4 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer textsForElementIDs] objectForKey:@"text0"];
  id v5 = [(NSString *)self->super.mEffectID rangeOfString:@"LTitleP"];
  BOOL v7 = [(NSString *)self->super.mEffectID rangeOfString:@"Text"] == (id)0x7FFFFFFFFFFFFFFFLL
    && v5 == (id)0x7FFFFFFFFFFFFFFFLL;
  if (v4 && [v4 length])
  {
    id v8 = [*(id *)((char *)&self->mText0Sprite + 1) count];
    if (v8) {
      char v9 = 1;
    }
    else {
      char v9 = v7;
    }
    if (v9)
    {
      if (!v8) {
        return (char)v8;
      }
    }
    else if (!*(NSMutableArray **)((char *)&self->mText0Offsets + 1))
    {
      LOBYTE(v8) = 0;
      return (char)v8;
    }
  }
  LOBYTE(v8) = !self->super.mNeedsToUpdateTexts;
  return (char)v8;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (![(MRLayer *)self->super.mEffectLayer isActivated]) {
    [*(id *)((char *)&self->mBackColorForImage[2] + 1) removeAllObjects];
  }
  v10.receiver = self;
  v10.super_class = (Class)MREffectOrigamiTitle;
  return [(MREffect *)&v10 prerenderForTime:a4 inContext:a5 withArguments:a3];
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (a3 >= 0.0 && self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration > a3)
  {
    if ([(NSString *)self->super.mEffectID rangeOfString:@"Title"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(MREffectOrigamiTitle *)self renderTextEffectAtTime:a4 inContext:a5 withArguments:a3];
    }
    else
    {
      [(MREffectOrigamiTitle *)self renderTitleEffectAtTime:a4 inContext:a5 withArguments:a3];
    }
  }
}

- (void)renderTitleEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  -[MREffect _computePhaseTimeForTime:](self, "_computePhaseTimeForTime:");
  double v10 = v9;
  [a4 blend:2];
  v128 = +[NSDictionary dictionaryWithObject:@"back" forKey:@"direction"];
  id v11 = [(NSString *)self->super.mEffectID rangeOfString:@"LTitleP"];
  [a4 localAspectRatio];
  double v127 = 1.0 / v12;
  id v135 = a4;
  if (v10 >= 5.0 && v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)((char *)&self->mText0Renderer + 1) reset];
    goto LABEL_48;
  }
  __asm { FMOV            V2.2D, #2.0 }
  float64x2_t v126 = vmulq_f64(*(float64x2_t *)((char *)&self->mSprites + 1), vdivq_f64(_Q2, (float64x2_t)self->super.mPixelSize));
  double y = CGPointZero.y;
  double x = CGPointZero.x;
  double v134 = y;
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v17 = [(NSString *)self->super.mEffectID hasSuffix:@"1"];
    double v18 = vmlad_n_f64(-0.23333333, 0.5, v126.f64[0]);
    double v19 = -0.645;
    if (v17) {
      double v18 = 0.0;
    }
    else {
      double v19 = 0.0;
    }
    double x = v18;
    double v134 = v19;
  }
  if (![(NSString *)[(MRLayerEffect *)self->super.mEffectLayer editedElement] isEqualToString:@"text0"]|| ![(MRLayerEffect *)self->super.mEffectLayer _hideTextWhileEditing])
  {
    id v123 = v11;
    double v125 = v10;
    CGPoint v157 = CGPointZero;
    uint64_t v20 = *(void *)((char *)&self->mImageSize.height + 1);
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id obj = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
    id v136 = [obj countByEnumeratingWithState:&v141 objects:v168 count:16];
    if (!v136) {
      goto LABEL_36;
    }
    unsigned int v21 = 0;
    unsigned int v22 = 0;
    LODWORD(v23) = 0;
    float v24 = v10 / ((double)v20 * 0.3);
    float v137 = v24;
    uint64_t v131 = *(void *)v142;
    float v25 = 0.0;
    v130.double y = y;
    v130.double x = CGPointZero.x;
    id v132 = a5;
    while (1)
    {
      for (i = 0; i != v136; i = (char *)i + 1)
      {
        if (*(void *)v142 != v131) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        int64_t v28 = (int64_t)objc_msgSend(objc_msgSend(*(id *)&self->mLineWordCounts[1], "objectAtIndex:", v23), "integerValue");
        v138 = (char *)v28;
        if (v22)
        {
          uint64_t v30 = *((unsigned __int8 *)&self->mText0Image + v22 + 1);
          uint64_t v29 = v21 + v30 + ~v28;
        }
        else
        {
          uint64_t v29 = v28 - v21;
          uint64_t v30 = *((unsigned __int8 *)&self->mText0Image + v22 + 1);
        }
        uint64_t v31 = v30 - 1;
        [v27 width];
        float v33 = (v32 + v32) / self->super.mPixelSize.width;
        [v27 height];
        float v35 = (v34 + v34) / self->super.mPixelSize.width;
        double v36 = v137
            + ((double)(v29 & 1) * 0.2 + (double)(v29 >> 1) * 0.1 + (double)v22 * 0.1)
            / ((double)*(uint64_t *)((char *)&self->mImageSize.height + 1)
             * -0.3);
        float v37 = v36;
        if (v29 == v31) {
          float v25 = v36;
        }
        objc_msgSend(objc_msgSend(*(id *)((char *)&self->mText0Images + 1), "objectAtIndex:", v23), "CGPointValue");
        double width = self->super.mPixelSize.width;
        *(float *)&double v38 = (v38 + v38) / width;
        *(float *)&double v40 = (v40 + v40) / width;
        double v41 = x + *(float *)&v38;
        double v42 = *(float *)&v40;
        a4 = v135;
        [v135 localAspectRatio];
        double v44 = v134 / v43 + v42;
        if (v37 >= 1.0)
        {
          a5 = v132;
          [(MREffectOrigamiTitle *)self renderStillImage:v27, @"text0", v135, v132, 0, v41, v44, v33, v35 withKey inContext withArguments inRect withAttributes];
        }
        else
        {
          if (v29 == v31) {
            v45 = &v157;
          }
          else {
            v45 = 0;
          }
          a5 = v132;
          -[MREffectOrigamiTitle renderFallImage:atProgress:strength:inContext:withArguments:inRect:withAttributes:::](self, "renderFallImage:atProgress:strength:inContext:withArguments:inRect:withAttributes:::", v27, v135, v132, v128, v45, v37, (double)v22 * 0.1 + 0.3, v41, v44, v33, v35, v130);
        }
        unint64_t v23 = (v23 + 1);
        if ((unint64_t)[*(id *)&self->mLineWordCounts[1] count] <= v23)
        {
          v46 = v138 + 1;
        }
        else
        {
          v46 = (char *)objc_msgSend(objc_msgSend(*(id *)&self->mLineWordCounts[1], "objectAtIndex:", v23), "integerValue");
          if (v46 == v138) {
            continue;
          }
        }
        uint64_t v47 = v21 + *((unsigned __int8 *)&self->mText0Image + v22 + 1);
        if ((uint64_t)v46 >= v47)
        {
          do
          {
            unsigned int v21 = v47;
            uint64_t v47 = v47 + *((unsigned __int8 *)&self->mText0Image + ++v22 + 1);
          }
          while ((uint64_t)v46 >= v47);
          CGPoint v130 = v157;
          float v137 = v25;
        }
      }
      id v136 = [obj countByEnumeratingWithState:&v141 objects:v168 count:16];
      if (!v136)
      {
LABEL_36:
        double v10 = v125;
        id v11 = v123;
        break;
      }
    }
  }
  objc_msgSend(*(id *)((char *)&self->mText0Renderer + 1), "fakeRenderInContext:atPosition:andSize:zRotation:", a4, x, v134, *(_OWORD *)&v126, 0.0);
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v48 = [(NSString *)self->super.mEffectID hasSuffix:@"1"];
    if (v48) {
      double v49 = v127 * -0.3333333;
    }
    else {
      double v49 = -v127;
    }
    if (v48) {
      double v50 = 2.0;
    }
    else {
      double v50 = 0.6666667;
    }
    double v51 = 1.3333333;
    if (!v48) {
      double v51 = 2.0;
    }
    double v52 = v127 * v51;
    id v53 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    id v54 = a4;
    v55 = v53;
    double mPhaseInDuration = self->super.mPhaseInDuration;
    if (mPhaseInDuration <= a3) {
      [(MREffectOrigamiTitle *)self renderBreakImage:v53, @"image0", v54, a5, 0, (a3 - mPhaseInDuration) / self->super.mMainDuration, -1.0, v49, v50, v52 atProgress withKey inContext withArguments inRect withAttributes];
    }
    else {
      -[MREffectOrigamiTitle renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::](self, "renderFallBreakImage:atProgress:inContext:withArguments:inRect:withAttributes:::", v53, v54, a5, v128, 0, a3, -1.0, v49, v50, v52, CGPointZero.x, y);
    }
    goto LABEL_97;
  }
LABEL_48:
  double mDefaultPhaseInDuration = self->super.mDefaultPhaseInDuration;
  if (v10 <= mDefaultPhaseInDuration) {
    goto LABEL_98;
  }
  double v58 = v10 - mDefaultPhaseInDuration;
  if (![(NSString *)self->super.mEffectID hasSuffix:@"5"])
  {
    id v67 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    id v68 = a4;
    v55 = v67;
    float v69 = v58 * self->super.mMainDuration / self->super.mDefaultMainDuration / 1.33333333;
    float v70 = v127 + v127;
    double v71 = -v127;
    double v72 = v70;
    if (v69 < 1.0)
    {
      double v73 = v69;
      double v74 = CGPointZero.x;
      double v75 = CGPointZero.y;
      double v76 = -1.0;
      double v77 = 2.0;
      v78 = self;
      v79 = v55;
      id v80 = v68;
      id v81 = a5;
      double v82 = -v127;
      double v83 = v72;
LABEL_94:
      -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::](v78, "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::", v79, v80, v81, v128, 0, v73, v76, v82, v77, v83, v74, v75);
LABEL_97:
      [v55 releaseByUser];
      a4 = v135;
      goto LABEL_98;
    }
    CFStringRef v84 = @"image0";
    double v85 = -1.0;
    double v86 = 2.0;
LABEL_96:
    -[MREffectOrigamiTitle renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:](self, "renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:", v55, v84, v68, a5, 0, v85, v71, v86, v72);
    goto LABEL_97;
  }
  if (v58 > 0.2)
  {
    id v59 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image3"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    id v60 = a4;
    v61 = v59;
    float v62 = (v58 + -0.2) * self->super.mMainDuration / self->super.mDefaultMainDuration / 1.33333333;
    float v63 = v127;
    float v64 = v127 + v127;
    double v65 = (float)-v63;
    double v66 = v64;
    if (v62 >= 1.0) {
      [(MREffectOrigamiTitle *)self renderStillImage:v59, @"image3", v60, a5, 0, 0.333333343, v65, 0.666666687, v66 withKey inContext withArguments inRect withAttributes];
    }
    else {
      -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::](self, "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::", v59, v60, a5, v128, 0, v62, 0.333333343, v65, 0.666666687, v66, CGPointZero.x, CGPointZero.y);
    }
    [v61 releaseByUser];
    a4 = v135;
  }
  if (v58 >= 3.0 && v58 < 3.5)
  {
    id v88 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image1"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", v135, a5, a3);
    [(MREffectOrigamiTitle *)self renderStillImage:v88, @"image1", v135, a5, 0, -0.166666667, -v127, 0.5, v127 * 0.75 withKey inContext withArguments inRect withAttributes];
    [v88 releaseByUser];
    id v89 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image2"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", v135, a5, a3);
    a4 = v135;
    [(MREffectOrigamiTitle *)self renderStillImage:v89, @"image2", v135, a5, 0, -1.0, -v127, 0.833333333, v127 * 0.75 withKey inContext withArguments inRect withAttributes];
    [v89 releaseByUser];
  }
  if (v58 <= 3.0)
  {
    [*(id *)((char *)&self->mPatchworkAtEnd + 1) removeObjectForKey:@"image4"];
  }
  else
  {
    id v90 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image4"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    if (v58 >= 4.0)
    {
      float v102 = v127;
      float v103 = v127 + v127;
      [(MREffectOrigamiTitle *)self renderStillImage:v90, @"image4", a4, a5, 0, -1.0, (float)-v102, 1.33333337, v103 withKey inContext withArguments inRect withAttributes];
    }
    else
    {
      double v91 = (v58 + -3.0) * self->super.mMainDuration / self->super.mDefaultMainDuration;
      *(float *)&double v91 = v91;
      [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:v91];
      __float2 v93 = __sincosf_stret(3.1416 - v92);
      float v94 = v127;
      float v95 = v127 + v127;
      LODWORD(v157.x) = -1082130432;
      double v96 = (float)-v94;
      double v97 = v95 * 0.375;
      *(float *)&unsigned int v98 = v96 + (1.0 - v93.__cosval) * v97;
      *(float *)&unsigned int v99 = v97 * v93.__sinval;
      *(void *)((char *)&v157.x + 4) = __PAIR64__(v99, v98);
      HIDWORD(v157.y) = 1051372204;
      unsigned int v158 = v98;
      unsigned int v159 = v99;
      v160[0] = -1.0;
      float v100 = v96 + v97;
      v160[1] = v100;
      uint64_t v161 = 0x3EAAAAAC00000000;
      float v162 = v100;
      unint64_t v163 = 0xBF80000000000000;
      float v164 = v95 - v94;
      uint64_t v165 = 0x3EAAAAAC00000000;
      float v166 = v95 - v94;
      int v167 = 0;
      long long v155 = xmmword_1655A8;
      v156[0] = unk_1655B8;
      HIDWORD(v101) = 1065353216;
      v156[1] = xmmword_1655C8;
      LOBYTE(v140.x) = 0;
      *(float *)&double v101 = 1.3333 / v95;
      [v90 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v140 state:v101];
      [a4 cull:1];
      SetLightingColors((float *)&v145, (float *)&v157, *(float *)[a4 foreColor]);
      [v135 setShader:@"ColoredTexture"];
      [v135 setVertex3DPointer:&v157];
      [v135 setTextureCoordinatesPointer:&v155 onTextureUnit:0];
      [v135 setColorsPointer:&v145];
      [v135 drawTriangleStripFromOffset:0 count:4];
      [v135 unsetColorsPointer];
      [v135 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [v135 unsetVertexPointer];
      [v135 unsetShader];
      SetLightingColors((float *)&v145, v160, *(float *)[v135 foreColor]);
      a4 = v135;
      [v135 setShader:@"ColoredTexture"];
      [v135 setVertex3DPointer:v160];
      [v135 setTextureCoordinatesPointer:v156 onTextureUnit:0];
      [v135 setColorsPointer:&v145];
      [v135 drawTriangleStripFromOffset:0 count:4];
      [v135 unsetColorsPointer];
      [v135 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [v135 unsetVertexPointer];
      [v135 unsetShader];
      [v135 cull:0];
      [v90 unsetOnContext:v135 onTextureUnit:0 state:&v140];
    }
    [v90 releaseByUser];
  }
  CGPoint v140 = CGPointZero;
  if (v58 < 3.5)
  {
    double v104 = a3;
    id v105 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    double mMainDuration = self->super.mMainDuration;
    double mDefaultMainDuration = self->super.mDefaultMainDuration;
    float v108 = v58 * mMainDuration / mDefaultMainDuration / 1.33333333;
    float v109 = v127 * -0.25;
    float v110 = v127 * 1.25;
    if (v108 >= 1.0)
    {
      if (v58 >= 3.0)
      {
        double v111 = (v58 + -3.0) * mMainDuration / mDefaultMainDuration;
        *(float *)&double v111 = v111;
        [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:v111];
        __float2 v113 = __sincosf_stret(3.1416 - v112);
        int v145 = -1082130432;
        float v146 = v127 * -0.25;
        unint64_t v147 = 0xBF80000000000000;
        float v148 = v109 - (float)(v113.__cosval * v110);
        float v149 = v113.__sinval * v110;
        int v150 = 1051372204;
        float v151 = v146;
        uint64_t v152 = 0x3EAAAAAC00000000;
        float v153 = v148;
        float v154 = v113.__sinval * v110;
        HIDWORD(v114) = -1082130432;
        long long v155 = xmmword_1655D8;
        v156[0] = unk_1655E8;
        char v139 = 0;
        *(float *)&double v114 = 1.3333 / v110;
        [v105 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v139 state:v114];
        [a4 cull:2];
        SetLightingColors((float *)&v157, (float *)&v145, *(float *)[a4 foreColor]);
        [a4 setShader:@"ColoredTexture"];
        [a4 setVertex3DPointer:&v145];
        [a4 setTextureCoordinatesPointer:&v155 onTextureUnit:0];
        [a4 setColorsPointer:&v157];
        [a4 drawTriangleStripFromOffset:0 count:4];
        [a4 unsetColorsPointer];
        [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
        [a4 unsetVertexPointer];
        [a4 unsetShader];
        [a4 cull:0];
        [v105 unsetOnContext:a4 onTextureUnit:0 state:&v139];
      }
      else
      {
        [(MREffectOrigamiTitle *)self renderStillImage:v105, @"image0", a4, a5, 0, -1.0, v109, 1.33333337, v110 withKey inContext withArguments inRect withAttributes];
      }
    }
    else
    {
      -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::](self, "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::", v105, a4, a5, v128, &v140, v108, -1.0, v109, 1.33333337, v110, CGPointZero.x, CGPointZero.y);
    }
    [v105 releaseByUser];
    a3 = v104;
  }
  if (v58 > 0.075 && v58 < 3.0)
  {
    id v116 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image2"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    id v117 = a4;
    v118 = v116;
    float v119 = (v58 + -0.075) * self->super.mMainDuration / self->super.mDefaultMainDuration / 1.33333333;
    if (v119 >= 1.0) {
      [(MREffectOrigamiTitle *)self renderStillImage:v116, @"image2", v117, a5, 0, -1.0, -v127, 0.833333333, v127 * 0.75 withKey inContext withArguments inRect withAttributes];
    }
    else {
      -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::](self, "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::", v116, v117, a5, v128, 0, v119, -1.0, -v127, 0.833333333, v127 * 0.75, v140);
    }
    [v118 releaseByUser];
    a4 = v135;
  }
  if (v58 > 0.05 && v58 < 3.0)
  {
    id v121 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image1"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
    id v68 = a4;
    v55 = v121;
    float v122 = (v58 + -0.05) * self->super.mMainDuration / self->super.mDefaultMainDuration / 1.2;
    double v71 = -v127;
    double v72 = v127 * 0.75;
    if (v122 < 1.0)
    {
      double v73 = v122;
      double v75 = v140.y;
      double v74 = v140.x;
      double v76 = -0.166666667;
      double v77 = 0.5;
      double v82 = -v127;
      double v83 = v127 * 0.75;
      v78 = self;
      v79 = v55;
      id v80 = v68;
      id v81 = a5;
      goto LABEL_94;
    }
    CFStringRef v84 = @"image1";
    double v85 = -0.166666667;
    double v86 = 0.5;
    goto LABEL_96;
  }
LABEL_98:
  [a4 blend:0];
}

- (void)renderTextEffectAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [a4 localAspectRatio];
  double width = 1.0;
  double v11 = 1.0 / v9;
  objc_msgSend(*(id *)((char *)&self->mText0Offsets + 1), "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
  double v13 = v12;
  double v25 = v14;
  if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami-Text"])
  {
    int v15 = 0;
    double y = -v11;
    double height = v11 + v11;
    double v18 = -0.5;
    double v19 = 0.0;
    double x = 0.0;
    goto LABEL_10;
  }
  if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LText1"]
    || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LText1"])
  {
    int v15 = 0;
    double y = v11 * -0.5;
    double height = v11 * 1.5;
    double v18 = v13 * 0.5 + -0.85;
    double x = -1.0;
    double width = 2.0;
    double v19 = -0.75;
    goto LABEL_10;
  }
  if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LText2"]
    || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LText2"])
  {
    int v15 = 0;
    double y = -v11;
    double height = v11 + v11;
    double v18 = v13 * -0.5 + -0.1;
    double x = 0.0;
LABEL_9:
    double v19 = -0.3333333;
    goto LABEL_10;
  }
  if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTextP1"]
    || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LTextP1"])
  {
    double y = v11 * -0.3333333;
    double height = v11 * 1.3333333;
    double v18 = v13 * 0.5 + -0.85;
    double x = -1.0;
    double width = 2.0;
    int v15 = 1;
    double v19 = -0.6666667;
  }
  else
  {
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTextP2"]
      || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LTextP2"])
    {
      double y = -v11;
      double height = v11 + v11;
      double v18 = v13 * 0.5 + -0.23333333;
      double x = -1.0;
      int v15 = 1;
      double width = 0.6666667;
      goto LABEL_9;
    }
    int v15 = 0;
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v18 = CGPointZero.x;
    double v19 = CGPointZero.y;
  }
LABEL_10:
  id v21 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
  if (v15)
  {
    double v22 = (a3 - self->super.mPhaseInDuration) / self->super.mMainDuration;
    double v23 = 0.0;
    if (v22 >= 0.0)
    {
      double v23 = (a3 - self->super.mPhaseInDuration) / self->super.mMainDuration;
      if (v22 > 1.0) {
        double v23 = 1.0;
      }
    }
    [(MREffectOrigamiTitle *)self renderBreakImage:v21, @"image0", a4, a5, 0, v23, x, y, width, height atProgress withKey inContext withArguments inRect withAttributes];
  }
  else
  {
    [(MREffectOrigamiTitle *)self renderStillImage:v21, @"image0", a4, a5, 0, x, y, width, height withKey inContext withArguments inRect withAttributes];
  }
  [v21 releaseByUser];
  if ([(NSString *)[(MRLayerEffect *)self->super.mEffectLayer editedElement] isEqualToString:@"text0"]&& [(MRLayerEffect *)self->super.mEffectLayer _hideTextWhileEditing])
  {
    float v24 = *(MRTextRenderer **)((char *)&self->mText0Renderer + 1);
    objc_msgSend(v24, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, v18, v19, v13, v25, 0.0);
  }
  else
  {
    [a4 blend:2];
    [a4 setShader:@"PlainTexture"];
    objc_msgSend(*(id *)((char *)&self->mText0Renderer + 1), "renderImage:inContext:atPosition:andSize:zRotation:", *(NSMutableArray **)((char *)&self->mText0Offsets + 1), a4, v18, v19, v13, v25, 0.0);
    [a4 unsetShader];
    [a4 blend:0];
  }
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((objc_msgSend(*(id *)((char *)&self->mText0Renderer + 1), "hitAtPoint:withInverseMatrix:localPoint:") & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v11 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v12) {
      return 0;
    }
    id v13 = v12;
    double v10 = 0;
    uint64_t v14 = *(void *)v22;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = objc_msgSend(*(id *)((char *)&self->mPatchworkAtEnd + 1), "objectForKey:", v16, v20);
      CGPoint v20 = (CGPoint)0;
      if (!v17 || !objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y)) {
        goto LABEL_20;
      }
      if (v10) {
        break;
      }
      if (a5) {
        goto LABEL_18;
      }
LABEL_19:
      double v10 = v16;
LABEL_20:
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v13) {
          return v10;
        }
        goto LABEL_5;
      }
    }
    if ([v16 compare:v10] == (id)-1)
    {
      double v10 = v16;
      BOOL v18 = a5 == 0;
    }
    else
    {
      BOOL v18 = 1;
    }
    if (v18) {
      goto LABEL_20;
    }
LABEL_18:
    *a5 = v20;
    goto LABEL_19;
  }
  return @"text0";
}

- (BOOL)getVerticesCoordinates:(MREffectOrigamiTitle *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  if ([a5 isEqualToString:@"text0"])
  {
    id v9 = *(MRTextRenderer **)((char *)&self->mText0Renderer + 1);
  }
  else
  {
    id v9 = [*(id *)((char *)&self->mPatchworkAtEnd + 1) objectForKey:a5];
    if (!v9) {
      return (char)v9;
    }
  }
  LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:a4];
  return (char)v9;
}

- (void)renderFallImage:(id)a3 atProgress:(double)a4 strength:(double)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9 :(CGPoint *)a10 :(CGPoint)a11
{
  double y = a11.y;
  double x = a11.x;
  float v17 = a8.origin.x;
  float v18 = a8.origin.y;
  float width = a8.size.width;
  float height = a8.size.height;
  if (a4 <= 0.0)
  {
    float v23 = -3.1416;
  }
  else
  {
    double v21 = a4 * 18.8495559;
    float v22 = a4 * 18.8495559;
    float v23 = a5 * 6.28318531 * sinf(v22) / v21;
  }
  if (v23 < -3.14159265) {
    float v23 = 3.1416;
  }
  if (v23 > 3.14159265) {
    float v23 = 3.1416;
  }
  __float2 v24 = __sincosf_stret(v23);
  unsigned int v25 = objc_msgSend(objc_msgSend(a9, "objectForKey:", @"direction"), "isEqualToString:", @"back");
  double v26 = 1.0 - v24.__cosval;
  float v27 = x + v18 + v26 * height;
  v37[0] = v17;
  v37[1] = v27;
  float v28 = -height;
  if (!v25) {
    float v28 = height;
  }
  double v29 = (float)(v28 * v24.__sinval);
  float v30 = y + v29;
  v37[2] = v30;
  v37[3] = v17;
  float v31 = x + (float)(v18 + height);
  float v32 = y;
  v37[4] = v31;
  v37[5] = v32;
  v37[6] = v17 + width;
  v37[7] = x + v18 + v26 * height;
  v37[8] = v30;
  v37[9] = v17 + width;
  v37[10] = v31;
  v37[11] = v32;
  if (a10)
  {
    a10->double x = v26 * height;
    a10->double y = v29;
  }
  HIDWORD(v33) = -1082130432;
  v36[0] = xmmword_1655D8;
  v36[1] = unk_1655E8;
  char v34 = 0;
  *(float *)&double v33 = width / height;
  [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v34 state:v33];
  [a6 cull:2];
  SetLightingColors(v35, v37, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:v37];
  [a6 setTextureCoordinatesPointer:v36 onTextureUnit:0];
  [a6 setColorsPointer:v35];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  [a6 cull:0];
  [a3 unsetOnContext:a6 onTextureUnit:0 state:&v34];
}

- (void)renderFallImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  float v16 = a7.origin.x;
  float v17 = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  *(float *)&a4 = a4;
  objc_msgSend(*(id *)((char *)&self->mBreakCurve + 1), "valueAtTime:", a3, a5, a6, a4);
  float v21 = 3.1416 - v20;
  if (y != 0.0)
  {
    float v21 = fmax(v21 * 2.5, -3.14159265);
    if (v21 > 3.14159265) {
      float v21 = 3.1416;
    }
  }
  __float2 v24 = __sincosf_stret(v21);
  float cosval = v24.__cosval;
  LODWORD(v22) = *(void *)&v24;
  unsigned int v25 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"direction"), "isEqualToString:", @"back");
  float v26 = x + (float)(v17 + (float)((float)(1.0 - cosval) * height));
  v38[0] = v16;
  v38[1] = v26;
  float v27 = -height;
  if (!v25) {
    float v27 = height;
  }
  double v28 = (float)(v22 * v27);
  float v29 = y + v28;
  v38[2] = v29;
  v38[3] = v16;
  float v30 = x + (float)(v17 + height);
  float v31 = y;
  v38[4] = v30;
  v38[5] = v31;
  v38[6] = v16 + width;
  v38[7] = x + (float)(v17 + (float)((float)(1.0 - cosval) * height));
  v38[8] = v29;
  v38[9] = v16 + width;
  v38[10] = v30;
  v38[11] = v31;
  if (a9)
  {
    a9->double x = (float)((float)(1.0 - cosval) * height);
    a9->double y = v28;
  }
  v37[0] = xmmword_1655D8;
  v37[1] = unk_1655E8;
  char v34 = 0;
  [a3 setUsesBackgroundColorAsBorderColor:1];
  LODWORD(v32) = 1.0;
  [a5 setBackColorRed:v36 green:0.0 blue:0.0 alpha:0.0 saveTo:v32];
  *(float *)&double v33 = width / height;
  [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v34 state:v33];
  [a5 cull:2];
  SetLightingColors(v35, v38, *(float *)[a5 foreColor]);
  [a5 setShader:@"ColoredTexture"];
  [a5 setVertex3DPointer:v38];
  [a5 setTextureCoordinatesPointer:v37 onTextureUnit:0];
  [a5 setColorsPointer:v35];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a5 cull:0];
  [a3 unsetOnContext:a5 onTextureUnit:0 state:&v34];
  [a5 setBackColor:v36 saveTo:0];
}

- (void)renderFallBreakImage:(id)a3 atProgress:(double)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8 :(CGPoint *)a9 :(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  double height = a7.size.height;
  double width = a7.size.width;
  double v17 = a7.origin.y;
  double v18 = a7.origin.x;
  [a3 aspectRatio];
  double v23 = v22;
  if (v22 >= 0.5 && v22 <= 2.0) {
    goto LABEL_8;
  }
  double v25 = width / height / v22;
  if (v23 >= 1.0) {
    double v25 = v23 / (width / height);
  }
  if (v25 < 1.1)
  {
LABEL_8:
    -[MREffectOrigamiTitle renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::](self, "renderFallImage:atProgress:inContext:withArguments:inRect:withAttributes:::", a3, a5, a6, 0, a9, a4, v18, v17, width, height, x, y);
  }
  else
  {
    double v76 = y;
    unsigned int v26 = objc_msgSend(objc_msgSend(objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"breakInformation"), "objectForKey:", @"image0"), "objectForKey:", @"panEndDirection"), "intValue");
    float v27 = width;
    float v28 = height;
    if (v27 >= v28) {
      float v29 = height;
    }
    else {
      float v29 = v27;
    }
    double v81 = v29;
    float v77 = v27;
    if (v23 <= 1.0)
    {
      [a3 height];
      double v36 = v35;
      [a3 width];
      double v33 = v36 * v27 - v37 * v28;
      [a3 width];
    }
    else
    {
      [a3 width];
      double v31 = v30;
      [a3 height];
      double v33 = v31 * v28 - v32 * v27;
      [a3 height];
    }
    float v38 = v18;
    float v39 = v17;
    float v78 = v39;
    double v40 = v33 / (v34 * v81);
    float v41 = v40;
    unint64_t v42 = vcvtps_u32_f32(v41);
    if (v40 <= 0.0) {
      unint64_t v43 = 0;
    }
    else {
      unint64_t v43 = v42;
    }
    [a3 scale];
    double v82 = v44;
    [a3 centerX];
    double v80 = v45;
    [a3 centerY];
    double v79 = v46;
    [a3 setScale:1.0];
    [a3 setCenterX:0.0];
    [a3 setCenterY:0.0];
    if (v23 <= 1.0)
    {
      float v49 = v77;
      if (v40 <= 0.0) {
        double v57 = v28;
      }
      else {
        double v57 = v77 / v23;
      }
      double v55 = v76;
      double v56 = x;
      double v47 = 1.0 / v57;
      if (v43)
      {
        double v58 = (v57 - v28) / (v57 * (double)v43);
        double v59 = v58 + v58;
        double v60 = 0.0;
        if (v26 == -1) {
          double v60 = (double)v43;
        }
        double v61 = v59 * v60 + -1.0;
      }
      else
      {
        double v61 = -1.0;
      }
      float v62 = v61 + (float)(v28 + v28) * v47;
      if (!v43) {
        float v62 = 1.0;
      }
      float v63 = v61;
      float v87 = -1.0;
      float v88 = v63;
      float v89 = -1.0;
      int v90 = LODWORD(v62);
      int v91 = 1065353216;
      float v92 = v63;
      int v93 = 1065353216;
      int v94 = LODWORD(v62);
      double v54 = v47 * v77;
    }
    else
    {
      double v47 = v28;
      double v48 = v23 * v28;
      float v49 = v77;
      if (v40 <= 0.0) {
        double v48 = v77;
      }
      double v50 = (double)v43;
      if (v26 != -1) {
        double v50 = 0.0;
      }
      double v51 = v50 * ((v48 - v77) / (v48 * (double)v43)) * 2.0 + -1.0;
      if (!v43) {
        double v51 = -1.0;
      }
      float v52 = v51 + (float)(v77 + v77) * (1.0 / v48);
      if (!v43) {
        float v52 = 1.0;
      }
      float v53 = v51;
      float v87 = v53;
      float v88 = -1.0;
      float v89 = v53;
      int v90 = 1065353216;
      int v91 = LODWORD(v52);
      float v92 = -1.0;
      int v93 = LODWORD(v52);
      int v94 = 1065353216;
      double v54 = v48 / v47;
      double v55 = v76;
      double v56 = x;
    }
    *(float *)&double v47 = a4;
    [*(id *)((char *)&self->mBreakCurve + 1) valueAtTime:v47];
    __float2 v67 = __sincosf_stret(3.1416 - v64);
    float cosval = v67.__cosval;
    LODWORD(v65) = *(void *)&v67;
    unsigned int v68 = objc_msgSend(objc_msgSend(a8, "objectForKey:", @"direction"), "isEqualToString:", @"back");
    float v70 = v56 + (float)(v78 + (float)((float)(1.0 - cosval) * v28));
    v86[0] = v38;
    v86[1] = v70;
    float v71 = -v28;
    if (!v68) {
      float v71 = v28;
    }
    double v72 = (float)(v65 * v71);
    float v73 = v55 + v72;
    v86[2] = v73;
    v86[3] = v38;
    float v74 = v56 + (float)(v78 + v28);
    float v75 = v55;
    v86[4] = v74;
    v86[5] = v75;
    v86[6] = v38 + v49;
    v86[7] = v56 + (float)(v78 + (float)((float)(1.0 - cosval) * v28));
    v86[8] = v73;
    v86[9] = v38 + v49;
    v86[10] = v74;
    v86[11] = v75;
    if (a9)
    {
      CGFloat v69 = (float)((float)(1.0 - cosval) * v28);
      a9->double x = v69;
      a9->double y = v72;
    }
    char v84 = 0;
    *(float *)&CGFloat v69 = v54;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v84 state:v69];
    [a5 cull:2];
    SetLightingColors(v85, v86, *(float *)[a5 foreColor]);
    [a5 setShader:@"ColoredTexture"];
    [a5 setVertex3DPointer:v86];
    [a5 setTextureCoordinatesPointer:&v87 onTextureUnit:0];
    [a5 setColorsPointer:v85];
    [a5 drawTriangleStripFromOffset:0 count:4];
    [a5 unsetColorsPointer];
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a5 unsetVertexPointer];
    [a5 unsetShader];
    [a5 cull:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:&v84];
    [a3 setScale:v82];
    [a3 setCenterX:v80];
    [a3 setCenterY:v79];
  }
}

- (void)renderStillImage:(id)a3 withKey:(id)a4 inContext:(id)a5 withArguments:(id)a6 inRect:(CGRect)a7 withAttributes:(id)a8
{
  float x = a7.origin.x;
  float y = a7.origin.y;
  float width = a7.size.width;
  float height = a7.size.height;
  v33[0] = x;
  v33[1] = y;
  v33[2] = x;
  v33[3] = y + height;
  v33[4] = x + width;
  v33[5] = y;
  v33[6] = x + width;
  v33[7] = y + height;
  id v16 = objc_msgSend(a8, "objectForKey:", @"slideRect", a4, a5, a6);
  v32[0] = (float32x4_t)xmmword_1655D8;
  v32[1] = (float32x4_t)unk_1655E8;
  if (v16) {
    MyGLRectFromString(v16, v32);
  }
  char v29 = 0;
  objc_msgSend(a3, "setUsesBackgroundColorAsBorderColor:", objc_msgSend(a4, "hasPrefix:", @"text") ^ 1);
  LODWORD(v17) = 1.0;
  [a5 setBackColorRed:v31 green:0.0 blue:0.0 alpha:0.0 saveTo:v17];
  *(float *)&double v18 = width / height;
  [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:&v29 state:v18];
  *(float *)&double v19 = SetLightingColors2D((uint64_t)v30, v33, *(float *)[a5 foreColor]);
  objc_msgSend(a5, "setShader:", @"ColoredTexture", v19);
  [a5 setVertex2DPointer:v33];
  [a5 setTextureCoordinatesPointer:v32 onTextureUnit:0];
  [a5 setColorsPointer:v30];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetColorsPointer];
  [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a5 unsetVertexPointer];
  [a5 unsetShader];
  [a3 unsetOnContext:a5 onTextureUnit:0 state:&v29];
  [a5 setBackColor:v31 saveTo:0];
  if (([a4 isEqualToString:@"text0"] & 1) == 0)
  {
    float v20 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
    float v21 = (MRCroppingSprite *)[v20 objectForKey:a4];
    if (!v21)
    {
      float v21 = objc_alloc_init(MRCroppingSprite);
      [v20 setObject:v21 forKey:a4];
    }
    double v22 = width;
    float v23 = x + v22 * 0.5;
    float v24 = y + height * 0.5;
    double v25 = v23;
    [a5 localAspectRatio];
    double v27 = (float)(v26 * v24);
    [a5 localAspectRatio];
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](v21, "fakeRenderInContext:atPosition:andSize:zRotation:", a5, v25, v27, v22, (float)(v28 * height), 0.0);
  }
}

- (void)renderBreakImage:(id)a3 atProgress:(double)a4 withKey:(id)a5 inContext:(id)a6 withArguments:(id)a7 inRect:(CGRect)a8 withAttributes:(id)a9
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  [a3 aspectRatio];
  double v20 = v19;
  if (v19 >= 0.5 && v19 <= 2.0) {
    goto LABEL_8;
  }
  double v22 = width / height / v19;
  if (v20 >= 1.0) {
    double v22 = v20 / (width / height);
  }
  if (v22 < 1.1)
  {
LABEL_8:
    -[MREffectOrigamiTitle renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:](self, "renderStillImage:withKey:inContext:withArguments:inRect:withAttributes:", a3, a5, a6, a7, 0, x, y, width, height);
    return;
  }
  unsigned int v23 = objc_msgSend(objc_msgSend(objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"breakInformation"), "objectForKey:", @"image0"), "objectForKey:", @"panEndDirection"), "intValue");
  float v24 = width;
  float v25 = height;
  if (v24 >= v25) {
    float v26 = height;
  }
  else {
    float v26 = v24;
  }
  double v160 = v26;
  float v158 = v24;
  float v159 = height;
  if (v20 <= 1.0)
  {
    [a3 height];
    double v33 = v32;
    [a3 width];
    double v30 = v33 * v24 - v34 * v25;
    [a3 width];
  }
  else
  {
    [a3 width];
    double v28 = v27;
    [a3 height];
    double v30 = v28 * v25 - v29 * v24;
    [a3 height];
  }
  double v35 = v30 / (v31 * v160);
  float v36 = v35;
  unint64_t v37 = vcvtps_u32_f32(v36);
  double mMainDuration = self->super.mMainDuration;
  if (v35 <= 0.0) {
    unint64_t v39 = 0;
  }
  else {
    unint64_t v39 = v37;
  }
  double v40 = 0.6 / mMainDuration;
  double v41 = 1.0;
  if (v39) {
    double v41 = (mMainDuration + (double)v39 * -0.6) / (mMainDuration * (double)(v39 + 1));
  }
  float v42 = x;
  float v155 = v42;
  float v43 = y;
  float v161 = v43;
  unint64_t v44 = vcvtmd_u64_f64(a4 / (v40 + v41));
  double v45 = fmod(a4, v40 + v41);
  if (v39 >= v44)
  {
    double v46 = v45;
  }
  else
  {
    unint64_t v44 = v39;
    double v46 = 0.0;
  }
  objc_msgSend(a3, "scale", v45);
  double v154 = v47;
  [a3 centerX];
  double v49 = v48;
  [a3 centerY];
  double v51 = v50;
  [a3 setScale:1.0];
  [a3 setCenterX:0.0];
  [a3 setCenterY:0.0];
  double v156 = v51;
  double v157 = v49;
  if (v20 <= 1.0)
  {
    double v91 = v159;
    if (v35 <= 0.0) {
      double v92 = v159;
    }
    else {
      double v92 = v24 / v20;
    }
    double v95 = (v92 - v91) / (v92 * (double)v39);
    double v96 = 1.0 / v92;
    if (v46 > v41)
    {
      [*(id *)((char *)&self->mWordCount + 1) evaluatAtTime:(v46 - v41) / v40];
      double v98 = v97;
      double v99 = 0.5;
      double v100 = v92 * 0.5 * v95;
      *(float *)&double v97 = v97 * 1.57079633;
      __float2 v101 = __sincosf_stret(*(float *)&v97);
      double v102 = v100 * v101.__cosval;
      double v103 = -(v100 * v101.__sinval);
      float v90 = v159;
      double v104 = v102 + v161;
      double v105 = v102 + v104;
      double v106 = (v95 + v95) * (double)v44 + -1.0;
      double v107 = v95 + v106;
      double v108 = v95 + v95 + v106;
      double v109 = 2.0;
      double v110 = (float)(v161 + v159) - v102;
      double v111 = v110 - v102;
      double v112 = (v96 * v91 + v95 * (double)(v39 - v44)) * 2.0 + -1.0;
      double v113 = v112 - v95;
      double v114 = v112 - v95 - v95;
      if (v23 == -1)
      {
        double v109 = -2.0;
        double v106 = (v96 * v91 + v95 * (double)(v39 - v44)) * 2.0 + -1.0;
        double v99 = -0.5;
        float v115 = v161 + v159;
      }
      else
      {
        float v115 = v161;
      }
      if (v23 == -1)
      {
        double v104 = v110;
        float v116 = v161;
      }
      else
      {
        double v111 = v105;
        float v116 = v161 + v159;
      }
      if (v23 == -1) {
        double v117 = v113;
      }
      else {
        double v117 = v107;
      }
      if (v23 == -1) {
        double v118 = v114;
      }
      else {
        double v118 = v108;
      }
      double v119 = v91 + (v100 + v100) * v98;
      float v80 = v155;
      float v187 = v155;
      float v188 = v115;
      int v189 = 0;
      float v24 = v158;
      float v190 = v155 + v158;
      float v191 = v115;
      int v192 = 0;
      float v120 = v104;
      float v193 = v155;
      float v194 = v120;
      float v121 = v103;
      float v195 = v121;
      float v196 = v155 + v158;
      float v197 = v120;
      float v198 = v121;
      float v122 = v111;
      float v199 = v155;
      float v200 = v122;
      int v201 = 0;
      float v202 = v155 + v158;
      float v203 = v122;
      int v204 = 0;
      double v123 = v106 + v119 * v109 * v96;
      float v205 = v155;
      float v206 = v116;
      int v207 = 0;
      float v208 = v155 + v158;
      float v209 = v116;
      int v210 = 0;
      float v171 = -1.0;
      float v124 = v106;
      float v172 = v124;
      float v173 = 1.0;
      float v174 = v124;
      float v175 = -1.0;
      float v125 = v117;
      float v176 = v125;
      float v177 = 1.0;
      float v178 = v125;
      float v179 = -1.0;
      float v126 = v118;
      float v180 = v126;
      float v181 = 1.0;
      float v182 = v126;
      float v183 = -1.0;
      float v127 = v123;
      float v184 = v127;
      float v185 = 1.0;
      float v186 = v127;
      char v162 = 0;
      double v128 = v96 * v158;
      *(float *)&double v128 = v128;
      [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v128];
      SetLightingColors(&v163, &v187, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v187];
      [a6 setTextureCoordinatesPointer:&v171 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      SetLightingColors(&v163, &v193, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v193];
      [a6 setTextureCoordinatesPointer:&v175 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      SetLightingColors(&v163, &v199, *(float *)[a6 foreColor]);
      [a6 setShader:@"ColoredTexture"];
      [a6 setVertex3DPointer:&v199];
      [a6 setTextureCoordinatesPointer:&v179 onTextureUnit:0];
      [a6 setColorsPointer:&v163];
      [a6 drawTriangleStripFromOffset:0 count:4];
      [a6 unsetColorsPointer];
      [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a6 unsetVertexPointer];
      [a6 unsetShader];
      [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
      v129 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
      [a3 aspectRatio];
      objc_msgSend(v129, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v123 / ((v91 + v91) * v96) - v99) * v130 / (float)(v158 / v159)), @"image0");
      goto LABEL_67;
    }
    float v80 = v155;
    float v90 = v159;
    float v171 = v155;
    float v172 = v161;
    float v173 = v155;
    float v174 = v161 + v159;
    float v24 = v158;
    float v175 = v155 + v158;
    float v176 = v161;
    float v177 = v155 + v158;
    float v178 = v161 + v159;
    if (v39)
    {
      unint64_t v132 = v39 - v44;
      if (v23 != -1) {
        unint64_t v132 = v44;
      }
      double v133 = (v95 + v95) * (double)v132 + -1.0;
    }
    else
    {
      double v133 = -1.0;
    }
    double v131 = v154;
    if (v39) {
      double v141 = v133 + (float)(v159 + v159) * v96;
    }
    else {
      double v141 = 1.0;
    }
    float v163 = -1.0;
    float v142 = v133;
    float v164 = v142;
    float v165 = -1.0;
    float v143 = v141;
    float v166 = v143;
    float v167 = 1.0;
    float v168 = v142;
    float v169 = 1.0;
    float v170 = v143;
    char v162 = 0;
    double v144 = v96 * v158;
    *(float *)&double v144 = v144;
    [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v144];
    *(float *)&double v145 = SetLightingColors2D((uint64_t)&v187, &v171, *(float *)[a6 foreColor]);
    objc_msgSend(a6, "setShader:", @"ColoredTexture", v145);
    [a6 setVertex2DPointer:&v171];
    [a6 setTextureCoordinatesPointer:&v163 onTextureUnit:0];
    [a6 setColorsPointer:&v187];
    [a6 drawTriangleStripFromOffset:0 count:4];
    [a6 unsetColorsPointer];
    [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a6 unsetVertexPointer];
    [a6 unsetShader];
    [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
    char v139 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
    [a3 aspectRatio];
    double v140 = (v133 + v141) / (v141 - v133) * v146 / (float)(v158 / v159);
LABEL_82:
    objc_msgSend(v139, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v140), @"image0");
    goto LABEL_83;
  }
  double v52 = v159;
  double v53 = v24;
  if (v35 <= 0.0) {
    double v54 = v24;
  }
  else {
    double v54 = v20 * v159;
  }
  double v55 = (v54 - v53) / (v54 * (double)v39);
  if (v46 <= v41)
  {
    float v80 = v155;
    float v171 = v155;
    float v172 = v161;
    float v173 = v155;
    float v174 = v161 + v159;
    float v175 = v155 + v24;
    float v176 = v161;
    float v177 = v155 + v24;
    float v178 = v161 + v159;
    float v90 = v159;
    if (v39)
    {
      unint64_t v93 = v39 - v44;
      if (v23 != -1) {
        unint64_t v93 = v44;
      }
      double v94 = v55 * (double)v93 * 2.0 + -1.0;
    }
    else
    {
      double v94 = -1.0;
    }
    double v131 = v154;
    if (v39) {
      double v134 = v94 + (float)(v24 + v24) * (1.0 / v54);
    }
    else {
      double v134 = 1.0;
    }
    float v135 = v94;
    float v163 = v135;
    float v164 = -1.0;
    float v165 = v135;
    float v166 = 1.0;
    float v136 = v134;
    float v167 = v136;
    float v168 = -1.0;
    float v169 = v136;
    float v170 = 1.0;
    char v162 = 0;
    double v137 = v54 / v52;
    *(float *)&double v137 = v54 / v52;
    [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v137];
    *(float *)&double v138 = SetLightingColors2D((uint64_t)&v187, &v171, *(float *)[a6 foreColor]);
    objc_msgSend(a6, "setShader:", @"ColoredTexture", v138);
    [a6 setVertex2DPointer:&v171];
    [a6 setTextureCoordinatesPointer:&v163 onTextureUnit:0];
    [a6 setColorsPointer:&v187];
    [a6 drawTriangleStripFromOffset:0 count:4];
    [a6 unsetColorsPointer];
    [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a6 unsetVertexPointer];
    [a6 unsetShader];
    [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
    char v139 = *(void **)((char *)&self->mBackColorForImage[2] + 1);
    double v140 = (v94 + v134) / (v134 - v94);
    goto LABEL_82;
  }
  double v56 = 1.0 / v54;
  double v153 = v159;
  [*(id *)((char *)&self->mWordCount + 1) evaluatAtTime:(v46 - v41) / v40];
  double v58 = v57;
  double v59 = v54 * 0.5 * v55;
  *(float *)&double v57 = v57 * 1.57079633;
  __float2 v60 = __sincosf_stret(*(float *)&v57);
  double v61 = v59 * v60.__cosval;
  double v62 = -(v59 * v60.__sinval);
  double v63 = v61 + v155;
  double v64 = v61 + v63;
  double v65 = (v55 + v55) * (double)v44 + -1.0;
  double v66 = v55 + v65;
  double v67 = v55 + v55 + v65;
  double v68 = 2.0;
  double v69 = (float)(v155 + v158) - v61;
  double v70 = v69 - v61;
  double v71 = (1.0 / v54 * v53 + v55 * (double)(v39 - v44)) * 2.0 + -1.0;
  double v72 = v71 - v55;
  double v73 = v71 - v55 - v55;
  if (v23 == -1)
  {
    double v68 = -2.0;
    double v65 = (v56 * v53 + v55 * (double)(v39 - v44)) * 2.0 + -1.0;
    double v74 = -0.5;
  }
  else
  {
    double v74 = 0.5;
  }
  if (v23 == -1) {
    float v75 = v155 + v158;
  }
  else {
    float v75 = v155;
  }
  if (v23 == -1)
  {
    double v63 = v69;
    float v76 = v155;
  }
  else
  {
    double v70 = v64;
    float v76 = v155 + v158;
  }
  if (v23 == -1) {
    double v77 = v72;
  }
  else {
    double v77 = v66;
  }
  if (v23 == -1) {
    double v78 = v73;
  }
  else {
    double v78 = v67;
  }
  double v79 = v59 + v59;
  float v80 = v155;
  double v81 = v65 + (v53 + v79 * v58) * v68 * v56;
  float v187 = v75;
  float v188 = v161;
  int v189 = 0;
  float v190 = v75;
  float v191 = v161 + v159;
  int v192 = 0;
  float v82 = v63;
  float v193 = v82;
  float v194 = v161;
  float v83 = v62;
  float v195 = v83;
  float v196 = v82;
  float v197 = v161 + v159;
  float v198 = v83;
  float v84 = v70;
  float v199 = v84;
  float v200 = v161;
  int v201 = 0;
  float v202 = v84;
  float v203 = v161 + v159;
  int v204 = 0;
  float v205 = v76;
  float v206 = v161;
  int v207 = 0;
  float v208 = v76;
  float v209 = v161 + v159;
  int v210 = 0;
  float v85 = v65;
  float v171 = v85;
  float v172 = -1.0;
  float v173 = v85;
  float v174 = 1.0;
  float v86 = v77;
  float v175 = v86;
  float v176 = -1.0;
  float v177 = v86;
  float v178 = 1.0;
  float v87 = v78;
  float v179 = v87;
  float v180 = -1.0;
  float v181 = v87;
  float v182 = 1.0;
  float v88 = v81;
  float v183 = v88;
  float v184 = -1.0;
  float v185 = v88;
  float v186 = 1.0;
  char v162 = 0;
  double v89 = v54 / v153;
  *(float *)&double v89 = v54 / v153;
  [a3 setOnContext:a6 onTextureUnit:0 withReferenceAspectRatio:&v162 state:v89];
  SetLightingColors(&v163, &v187, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v187];
  [a6 setTextureCoordinatesPointer:&v171 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  SetLightingColors(&v163, &v193, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v193];
  [a6 setTextureCoordinatesPointer:&v175 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  SetLightingColors(&v163, &v199, *(float *)[a6 foreColor]);
  [a6 setShader:@"ColoredTexture"];
  [a6 setVertex3DPointer:&v199];
  [a6 setTextureCoordinatesPointer:&v179 onTextureUnit:0];
  [a6 setColorsPointer:&v163];
  [a6 drawTriangleStripFromOffset:0 count:4];
  [a6 unsetColorsPointer];
  [a6 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a6 unsetVertexPointer];
  [a6 unsetShader];
  [a3 unsetOnContext:a6 onTextureUnit:0 state:&v162];
  objc_msgSend(*(id *)((char *)&self->mBackColorForImage[2] + 1), "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v81 / ((v53 + v53) * v56) - v74), @"image0");
  float v90 = v159;
  float v24 = v158;
LABEL_67:
  double v131 = v154;
LABEL_83:
  unint64_t v147 = *(NSArray **)((char *)&self->mPatchworkAtEnd + 1);
  float v148 = (MRCroppingSprite *)[v147 objectForKey:@"image0"];
  if (!v148)
  {
    float v148 = objc_alloc_init(MRCroppingSprite);
    [v147 setObject:v148 forKey:@"image0"];
  }
  double v149 = (float)(v80 + (float)(v24 * 0.5));
  [a6 localAspectRatio];
  double v151 = (float)((float)(v161 + (float)(v90 * 0.5)) * v150);
  [a6 localAspectRatio];
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](v148, "fakeRenderInContext:atPosition:andSize:zRotation:", a6, v149, v151, v24, (float)(v152 * v90), 0.0);
  [a3 setScale:v131];
  [a3 setCenterX:v157];
  [a3 setCenterY:v156];
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = +[NSMutableArray array];
  id v10 = a4;
  [a4 localAspectRatio];
  float v12 = 1.0 / v11;
  if (![(NSString *)self->super.mEffectID hasSuffix:@"5"])
  {
    if ([(NSString *)self->super.mEffectID hasSuffix:@"Text"])
    {
      id v20 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithSize:andColor:", objc_msgSend(a4, "backColor"), 1.0, 1.0);
      [v20 setLabel:@"Marimba OrigamiTitle Background"];
      [v20 setClampMode:2];
      objc_msgSend(*(id *)((char *)&self->mText0Offsets + 1), "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
      double v22 = v21;
      double v24 = v23;
      float v25 = v9;
      double v26 = (float)-v12;
      double v27 = v12 + v12;
      objc_msgSend(v9, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v20, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v26, 1.0, v27), @"rectangle", 0));
      id v28 = [*(id *)((char *)&self->mText0Offsets + 1) insertingInCollection];
      double v29 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", (v22 + 1.0) * -0.5, v24 * -0.5, v22, v24);
      id v30 = v28;
      id v9 = v25;
      objc_msgSend(v25, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v30, @"image", &__kCFBooleanTrue, @"needsBlend", v29, @"rectangle", 0));
      id v31 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
      objc_msgSend(v25, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v31, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, v26, 1.0, v27), @"rectangle", 0));
LABEL_5:
      double v32 = v31;
LABEL_28:
      [v32 releaseByUser];
      goto LABEL_29;
    }
    unsigned int v33 = [(NSString *)self->super.mEffectID hasSuffix:@"Title1"];
    [a4 localAspectRatio];
    double v35 = v34;
    if (v33)
    {
      double v36 = 2.0 / v35;
      double v37 = 2.0 / v35 * -0.5;
      id v38 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer slideProvidersForElementIDs] objectForKey:ImageKey(0)];
      id v20 = [v38 retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
      if ([v38 defaultKenBurnsType] == 1) {
        goto LABEL_10;
      }
      [v20 width];
      float v40 = v39;
      [v20 height];
      *(float *)&double v41 = v41;
      double v42 = (float)(v40 / *(float *)&v41);
      [v20 scale];
      double v44 = v43;
      [a4 localAspectRatio];
      double v46 = v44 * v45 / v42;
      if (v44 >= 1.0 && v46 >= 1.0)
      {
LABEL_10:
        id v47 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v20, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v36 * -0.5, 2.0, v36), @"rectangle", 0);
        [v9 addObject:v47];

        goto LABEL_29;
      }
      id v31 = [(MREffectOrigamiTitle *)self _retainedByUserBackColorImageInContext:a4];
      [v20 setCenterX:0.0];
      [v20 setCenterY:0.0];
      id v74 = objc_alloc((Class)NSDictionary);
      id v75 = [v20 insertingInCollection];
      if (v44 >= 1.0)
      {
        double v89 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v37 * v46, 2.0, v36 * v46);
        double v90 = 2.0 / v36;
        *(float *)&double v90 = 2.0 / v36;
        id v91 = objc_msgSend(v74, "initWithObjectsAndKeys:", v75, @"image", v89, @"rectangle", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v90), @"referenceAspectRatio", 0);
        [v9 addObject:v91];

        id v92 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v31, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v36 * -0.5, 2.0, v37 * (v46 + -1.0)), @"rectangle", &__kCFBooleanTrue, @"onTop", 0);
        [v9 addObject:v92];

        id v80 = objc_alloc((Class)NSDictionary);
        id v81 = [v31 insertingInCollection];
        double v84 = (v36 + v37) * v46;
        double v85 = (v36 + v37) * (1.0 - v46);
        double v83 = -1.0;
        double v82 = 2.0;
      }
      else
      {
        float v76 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -v44, v36 * -0.5, v44 + v44, v36);
        double v77 = 2.0 / v36;
        *(float *)&double v77 = 2.0 / v36;
        id v78 = objc_msgSend(v74, "initWithObjectsAndKeys:", v75, @"image", v76, @"rectangle", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v77), @"referenceAspectRatio", 0);
        [v9 addObject:v78];

        id v79 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v31, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v36 * -0.5, -(v44 + -1.0), v36), @"rectangle", &__kCFBooleanTrue, @"onTop", 0);
        [v9 addObject:v79];

        id v80 = objc_alloc((Class)NSDictionary);
        id v81 = [v31 insertingInCollection];
        double v82 = 1.0 - v44;
        double v83 = v44;
        double v84 = v36 * -0.5;
        double v85 = v36;
      }
      id v93 = objc_msgSend(v80, "initWithObjectsAndKeys:", v81, @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v83, v84, v82, v85), @"rectangle", &__kCFBooleanTrue, @"onTop", 0);
      [v9 addObject:v93];

      goto LABEL_5;
    }
    double width = 1.0;
    double v49 = 1.0 / v35;
    objc_msgSend(*(id *)((char *)&self->mText0Offsets + 1), "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v51 = v50;
    double v100 = v52;
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami-Text"])
    {
      double v53 = v9;
      int v97 = 0;
      double y = -v49;
      double height = v49 + v49;
      double x = -1.0;
      double v95 = -v49;
      double v96 = -0.5;
      double v57 = 0.0;
      double v98 = 1.0;
      double v99 = v49 + v49;
      double v58 = 0.0;
LABEL_17:
      CGFloat v94 = v58;
      goto LABEL_18;
    }
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LText1"]
      || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LText1"])
    {
      double v53 = v9;
      int v97 = 0;
      double v99 = v49 * 1.5;
      double y = -v49;
      double height = v49 * 0.5;
      double v95 = v49 * -0.5;
      double v96 = v51 * 0.5 + -0.85;
      double x = -1.0;
      double width = 2.0;
      double v57 = -0.75;
LABEL_16:
      double v98 = 2.0;
      double v58 = -1.0;
      goto LABEL_17;
    }
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LText2"]
      || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LText2"])
    {
      double v53 = v9;
      int v97 = 0;
      double v57 = -0.3333333;
      double y = -v49;
      double height = v49 + v49;
      double v95 = -v49;
      double v96 = v51 * -0.5 + -0.1;
      CGFloat v94 = 0.0;
      double x = -1.0;
      double v98 = 1.0;
      double v99 = v49 + v49;
      goto LABEL_18;
    }
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTextP1"]
      || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LTextP1"])
    {
      double v53 = v9;
      double v95 = v49 * -0.3333333;
      double v99 = v49 * 1.3333333;
      double y = -v49;
      double height = v49 * 0.6666667;
      double v96 = v51 * 0.5 + -0.85;
      double x = -1.0;
      double width = 2.0;
      int v97 = 1;
      double v57 = -0.6666667;
      goto LABEL_16;
    }
    if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTextP2"]
      || [(NSString *)self->super.mEffectID isEqualToString:@"Origami3-LTextP2"])
    {
      double v53 = v9;
      double y = -v49;
      double height = v49 + v49;
      double v96 = v51 * 0.5 + -0.23333333;
      CGFloat v94 = -1.0;
      int v97 = 1;
      double v98 = 0.6666667;
      double width = 1.3333333;
      double v57 = -0.3333333;
      double x = -0.3333333;
    }
    else
    {
      if ([(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTitleP1"])
      {
        double v53 = v9;
        double v95 = v49 * -0.3333333;
        double v99 = v49 * 1.3333333;
        double y = -v49;
        double height = v49 * 0.6666667;
        double x = -1.0;
        double width = 2.0;
        double v96 = 0.0;
        int v97 = 1;
        double v57 = -0.645;
        goto LABEL_16;
      }
      double v53 = v9;
      if (![(NSString *)self->super.mEffectID isEqualToString:@"Origami2-LTitleP2"])
      {
        int v97 = 0;
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        double v57 = CGPointZero.y;
        double v95 = y;
        double v96 = CGPointZero.x;
        double v98 = width;
        double v99 = height;
        CGFloat v94 = CGRectZero.origin.x;
LABEL_18:
        id v20 = objc_msgSend(objc_msgSend(v10, "imageManager"), "retainedByUserImageWithSize:andColor:", objc_msgSend(v10, "backColor"), 1.0, 1.0);
        [v20 setLabel:@"Marimba OrigamiTitle Background"];
        [v20 setClampMode:2];
        objc_msgSend(v53, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v20, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height), @"rectangle", 0));
        id v59 = [*(id *)((char *)&self->mText0Offsets + 1) insertingInCollection];
        __float2 v60 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v96 + v51 * -0.5, v100 * -0.5 + v57 * v49, v51);
        id v61 = v59;
        id v9 = v53;
        objc_msgSend(v53, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v61, @"image", &__kCFBooleanTrue, @"needsBlend", v60, @"rectangle", 0));
        id v62 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image0"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", v10, a5, a3);
        double v63 = v62;
        if (!v97)
        {
          id v70 = v62;
          double v67 = v98;
          double v66 = v99;
          goto LABEL_26;
        }
        [v62 aspectRatio];
        double v65 = v64;
        double v67 = v98;
        double v66 = v99;
        if (v64 >= 0.5 && v64 <= 2.0) {
          goto LABEL_24;
        }
        double v68 = v64 / (v98 / v99);
        double v69 = v98 / v99 / v64;
        if (v65 >= 1.0) {
          double v69 = v65 / (v98 / v99);
        }
        if (v69 < 1.1)
        {
LABEL_24:
          id v70 = v63;
LABEL_26:
          double v72 = v94;
          double v71 = v95;
LABEL_27:
          objc_msgSend(v9, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v70, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v72, v71, v67, v66), @"rectangle", 0));
          double v32 = v70;
          goto LABEL_28;
        }
        unsigned int v86 = objc_msgSend(objc_msgSend(objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"breakInformation"), "objectForKey:", @"image0"), "objectForKey:", @"panEndDirection"), "intValue");
        objc_msgSend(v63, "setScale:", fmax(v68, 1.0));
        [v63 setCenterX:0.0];
        [v63 setCenterY:0.0];
        id v70 = [v63 retainedByUserImage];
        id v87 = [*(id *)((char *)&self->mBackColorForImage[2] + 1) objectForKeyedSubscript:@"image0"];
        if (v87)
        {
          [v87 doubleValue];
          if (v65 < 1.0)
          {
LABEL_49:
            [v70 setCenterY:v88];
            goto LABEL_50;
          }
        }
        else
        {
          if (v65 < 1.0)
          {
            double v88 = 1.0 - v68;
            if (v86 != -1) {
              double v88 = v68 + -1.0;
            }
            goto LABEL_49;
          }
          double v88 = 1.0 - v68;
          if (v86 == -1) {
            double v88 = v68 + -1.0;
          }
        }
        [v70 setCenterX:v88];
LABEL_50:
        id v9 = v53;
        double v72 = v94;
        double v71 = v95;
        [v63 releaseByUser];
        goto LABEL_27;
      }
      double y = -v49;
      double height = v49 + v49;
      double v96 = v51 * 0.5 + -0.23333333;
      CGFloat v94 = -1.0;
      double v57 = 0.0;
      int v97 = 1;
      double v98 = 0.6666667;
      double x = -0.3333333;
      double width = 1.3333333;
    }
    double v99 = height;
    double v95 = y;
    goto LABEL_18;
  }
  id v13 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image3"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
  uint64_t v14 = v9;
  id v15 = [v13 insertingInCollection];
  double v16 = (float)-v12;
  double v17 = v12 + v12;
  double v18 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.333333343, v16, 0.666666687, v17);
  id v19 = v15;
  id v9 = v14;
  objc_msgSend(v14, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v19, @"image", v18, @"rectangle", 0));
  [v13 releaseByUser];
  id v20 = objc_msgSend(-[NSDictionary objectForKey:](-[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"), "objectForKey:", @"image4"), "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5, a3);
  objc_msgSend(v14, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(v20, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v16, 1.33333337, v17), @"rectangle", 0));
LABEL_29:
  [v20 releaseByUser];
  return v9;
}

- (id)_retainedByUserBackColorImageInContext:(id)a3
{
  id v5 = [a3 backColor];
  BOOL v7 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
  if (v7)
  {
    LODWORD(v6) = *v5;
    if (*(float *)v5 == *(float *)((char *)&self->mBackColorImage + 1))
    {
      LODWORD(v6) = v5[1];
      if (*(float *)&v6 == *(float *)((char *)&self->mBackColorImage + 5))
      {
        LODWORD(v6) = v5[2];
        if (*(float *)&v6 == *(float *)((char *)self->mBackColorForImage + 1)) {
          goto LABEL_11;
        }
      }
    }
    objc_msgSend(v7, "releaseByUser", v6);
  }
  LODWORD(v6) = *v5;
  if (*(float *)v5 <= 0.0 && (LODWORD(v6) = v5[1], *(float *)&v6 <= 0.0) && (LODWORD(v6) = v5[2], *(float *)&v6 <= 0.0))
  {
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = (MROrigamiAnimationPath *)[a3 retainedByUserBlackImage];
  }
  else
  {
    id v8 = (MROrigamiAnimationPath *)objc_msgSend(objc_msgSend(a3, "imageManager", v6), "retainedByUserImageWithSize:andColor:", v5, 1.0, 1.0);
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = v8;
    [(MROrigamiAnimationPath *)v8 setLabel:@"Marimba Origami Background"];
    [*(id *)((char *)&self->mBigSwing + 1) setClampMode:2];
  }
  *(_DWORD *)((char *)&self->mBackColorImage + 1) = *v5;
  *(_DWORD *)((char *)&self->mBackColorImage + 5) = v5[1];
  *(float *)((char *)self->mBackColorForImage + 1) = (float)v5[2];
  BOOL v7 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
LABEL_11:
  return [v7 retainByUser];
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  double v6 = *(NSMutableArray **)((char *)&self->mText0Offsets + 1);
  if (v6)
  {
    objc_msgSend(v6, "releaseByUser", a4, a5, a3);
    *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = 0;
  }
  BOOL v7 = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
  if (v7)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * i) removingFromCollection];
        }
        id v9 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v9);
    }

    *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = 0;
    *(NSMutableArray **)((char *)&self->mText0Images + 1) = 0;

    *(void *)&self->mLineWordCounts[1] = 0;
  }
  id v12 = [(NSDictionary *)[(MRLayerEffect *)self->super.mEffectLayer textsForElementIDs] objectForKey:@"text0"];
  id v13 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v12)
  {
    uint64_t v14 = v12;
    if (!v13) {
      *(void *)(&self->super._isInInteractiveMode + 1) = objc_alloc_init(MRTextRenderer);
    }
    if (![v14 length]) {
      objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setPlaceholderText:", objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:", self->super.mEffectID, -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"), 0, 0));
    }
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setResolution:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    id v15 = [(NSString *)self->super.mEffectID rangeOfString:@"LTitleP"];
    id v16 = [(NSString *)self->super.mEffectID rangeOfString:@"LTitleP2"];
    double v17 = dbl_1654C0[[(NSString *)self->super.mEffectID rangeOfString:@"LText"] == (id)0x7FFFFFFFFFFFFFFFLL];
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL) {
      double v17 = 0.9;
    }
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL) {
      double v17 = 0.55;
    }
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setDefinedSize:", self->super.mPixelSize.width * v17, self->super.mPixelSize.height * 0.5);
    [*(id *)(&self->super._isInInteractiveMode + 1) setMaxNumberOfLines:3];
    [*(id *)(&self->super._isInInteractiveMode + 1) setText:v14];
    [*(id *)(&self->super._isInInteractiveMode + 1) setTruncate:1];
    [(MRLayerEffect *)self->super.mEffectLayer _rendererSize];
    +[MRRenderer textScaleForResolution:](MRRenderer, "textScaleForResolution:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setScale:");
    objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "setInset:", 1.0, 1.0);
    [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = v18;
    *(void *)((char *)&self->mImageSize.width + 1) = v19;
    if ([(NSString *)self->super.mEffectID rangeOfString:@"Text"] == (id)0x7FFFFFFFFFFFFFFFLL
      && v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_26;
    }
    id v20 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContext];
    if (v20)
    {
      double v21 = v20;
      double v22 = (NSMutableArray *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v20);
      *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = v22;
      [(NSMutableArray *)v22 setLabel:@"Marimba Origami Text"];
      CGContextRelease(v21);
    }
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_26:
      *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = (MRCroppingSprite *)objc_alloc_init((Class)NSMutableArray);
      *(NSMutableArray **)((char *)&self->mText0Images + 1) = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      *(void *)&self->mLineWordCounts[1] = objc_alloc_init((Class)NSMutableArray);
      *(void *)((char *)&self->mImageSize.height + 1) = [*(id *)(&self->super._isInInteractiveMode + 1) countOfWords];
      [*(id *)(&self->super._isInInteractiveMode + 1) cacheText];
      if (![(NSString *)[(MRLayerEffect *)self->super.mEffectLayer editedElement] isEqualToString:@"text0"]|| ![(MRLayerEffect *)self->super.mEffectLayer _hideTextWhileEditing])
      {
        double v23 = (char *)objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "rangeOfGlyphsForWordsInRange:", 0, 1);
        uint64_t v48 = v24;
        [*(id *)(&self->super._isInInteractiveMode + 1) sizeOfContext];
        double v26 = v25;
        double v28 = v27;
        double v29 = (char *)[*(id *)(&self->super._isInInteractiveMode + 1) numberOfLinesForTruncatedText];
        if ((uint64_t)v29 >= 1)
        {
          id v30 = v29;
          id v31 = 0;
          uint64_t v32 = 0;
          double v46 = v29;
          do
          {
            unsigned int v33 = (char *)[*(id *)(&self->super._isInInteractiveMode + 1) rangeOfGlyphsOnLine:v31];
            if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              if (v34 >= 1)
              {
                double v35 = v33;
                double v36 = &v33[v34];
                do
                {
                  [*(id *)(&self->super._isInInteractiveMode + 1) originOfGlyphAtIndex:v35];
                  double v38 = v37;
                  double v40 = v39;
                  double v41 = (CGContext *)[*(id *)(&self->super._isInInteractiveMode + 1) retainedContextOfGlyphAtIndex:v35];
                  if (v41)
                  {
                    double v42 = v41;
                    id v43 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithCGContext:", v41);
                    [v43 setLabel:@"Marimba Origami Text"];
                    objc_msgSend(*(id *)((char *)&self->mText0Sprite + 1), "addObject:", objc_msgSend(v43, "insertingInCollection"));
                    [v43 releaseByUser];
                    CGContextRelease(v42);
                    objc_msgSend(*(id *)((char *)&self->mText0Images + 1), "addObject:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v38 + v26 * -0.5, v40 + v28 * -0.5));
                    if ((uint64_t)v35 < (uint64_t)v23 || (uint64_t)v35 >= (uint64_t)&v23[v48])
                    {
                      if (v32 + 1 < *(void *)((char *)&self->mImageSize.height + 1)) {
                        ++v32;
                      }
                      else {
                        uint64_t v32 = *(void *)((char *)&self->mImageSize.height + 1);
                      }
                      double v23 = (char *)objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "rangeOfGlyphsForWordsInRange:", v32, 1);
                      uint64_t v48 = v44;
                    }
                    objc_msgSend(*(id *)&self->mLineWordCounts[1], "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v32));
                  }
                  ++v35;
                }
                while ((uint64_t)v35 < (uint64_t)v36);
              }
              [*(id *)(&self->super._isInInteractiveMode + 1) rangeOfWordsOnLine:v31];
              v31[(void)&self->mText0Image + 1] = v45;
              id v30 = v46;
            }
            ++v31;
          }
          while (v31 != v30);
        }
      }
      [*(id *)(&self->super._isInInteractiveMode + 1) clearCache];
    }
  }
  else if (v13)
  {

    *(void *)(&self->super._isInInteractiveMode + 1) = 0;
  }
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width * 0.45;
  double v4 = self->super.mPixelSize.height * 0.5;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3;
}

- (void)_unload
{
  double v3 = *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1);
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        BOOL v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) removingFromCollection];
          BOOL v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    *(MRCroppingSprite **)((char *)&self->mText0Sprite + 1) = 0;
    *(NSMutableArray **)((char *)&self->mText0Images + 1) = 0;

    *(void *)&self->mLineWordCounts[1] = 0;
  }
  [*(id *)((char *)&self->mText0Offsets + 1) releaseByUser];
  *(NSMutableArray **)((char *)&self->mText0Offsets + 1) = 0;
  id v8 = *(void **)(&self->super._isInInteractiveMode + 1);
  if (v8)
  {
    [v8 cleanup];

    *(void *)(&self->super._isInInteractiveMode + 1) = 0;
  }
  id v9 = *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1);
  if (v9)
  {
    [v9 releaseByUser];
    *(MROrigamiAnimationPath **)((char *)&self->mBigSwing + 1) = 0;
  }
  *(_DWORD *)((char *)&self->mBackColorImage + 1) = -1082130432;
}

@end