@interface MRCroppingSpriteVBO
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:;
- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (BOOL)hitIsActive;
- (BOOL)needsInSpriteCoordinates;
- (BOOL)preservesImageAspectRatio;
- (CGPoint)position;
- (CGPoint)spriteCoordinatesOffset;
- (CGRect)innerRect;
- (CGRect)outerRect;
- (CGSize)halfSize;
- (CGSize)spriteCoordinatesFactor;
- (MRCroppingSpriteVBO)init;
- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6;
- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7;
- (float)rotation;
- (unsigned)meshType;
- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6;
- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4;
- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8;
- (void)renderImageInner:(id)a3 inContext:(id)a4;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4;
- (void)renderImageOuter:(id)a3 inContext:(id)a4;
- (void)reset;
- (void)setHitIsActive:(BOOL)a3;
- (void)setInnerRect:(CGRect)a3;
- (void)setMeshType:(unsigned __int8)a3;
- (void)setNeedsInSpriteCoordinates:(BOOL)a3;
- (void)setOuterRect:(CGRect)a3;
- (void)setPreservesImageAspectRatio:(BOOL)a3;
- (void)setSpriteCoordinatesFactor:(CGSize)a3;
- (void)setSpriteCoordinatesOffset:(CGPoint)a3;
- (void)updateVBOsInContext:(id)a3;
@end

@implementation MRCroppingSpriteVBO

- (MRCroppingSpriteVBO)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRCroppingSpriteVBO;
  result = [(MRCroppingSpriteVBO *)&v8 init];
  if (result)
  {
    result->mInnerRect.origin.x = 0.0;
    result->mInnerRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    result->mInnerRect.size = _Q0;
    result->mOuterRect.origin.x = 0.0;
    result->mOuterRect.origin.y = 0.0;
    result->mOuterRect.size = _Q0;
    *(_WORD *)&result->mPreservesImageAspectRatio = 257;
    result->mSpriteCoordinatesFactor = _Q0;
    *(_WORD *)&result->mPositionWasUpdated = 257;
  }
  return result;
}

- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  v12 = [(MRCroppingSpriteVBO *)self init];
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a5;
    -[MRCroppingSpriteVBO fakeRenderInContext:atPosition:andSize:zRotation:](v12, "fakeRenderInContext:atPosition:andSize:zRotation:", a6, x, y, width, height, v13);
  }
  return v14;
}

- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v13 = [(MRCroppingSpriteVBO *)self init];
  v15 = v13;
  if (v13)
  {
    *(float *)&double v14 = a5;
    -[MRCroppingSpriteVBO fakeRenderInContext:atPosition:andSize:zRotation:](v13, "fakeRenderInContext:atPosition:andSize:zRotation:", a7, x, y, width, height, v14);
    -[MRCroppingSpriteVBO setInnerRect:](v15, "setInnerRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }
  return v15;
}

- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8
{
  id v27 = [a1 init];
  v29 = v27;
  if (v27)
  {
    *(float *)&double v28 = a6;
    objc_msgSend(v27, "fakeRenderInContext:atPosition:andSize:zRotation:", a8, a2, a3, a4, a5, v28);
    objc_msgSend(v29, "setInnerRect:", a12, a13, a14, a15);
    objc_msgSend(v29, "setOuterRect:", a16, a17, a18, a19);
  }
  return v29;
}

- (void)reset
{
  self->mPosition = CGPointZero;
  self->mHalfSize = CGSizeZero;
  self->mRotation = 0.0;
  self->mPositionWasUpdated = 1;
}

- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  CGFloat y = a4.y;
  float x = a4.x;
  [a3 localAspectRatio];
  *(float *)&CGFloat y = y / v13;
  float v14 = width * 0.5;
  [a3 localAspectRatio];
  float v16 = height * 0.5 / v15;
  double v17 = *(float *)&y;
  BOOL v18 = self->mPosition.x != x
     || self->mPosition.y != v17
     || self->mHalfSize.width != v14
     || self->mHalfSize.height != v16
     || self->mRotation != a6;
  self->mPositionWasUpdated |= v18;
  self->mPosition.float x = x;
  self->mPosition.CGFloat y = v17;
  self->mHalfSize.double width = v14;
  self->mHalfSize.double height = v16;
  self->mRotation = a6;
}

- (void)setInnerRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  double v5 = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  double v6 = fmin(a3.origin.y + a3.size.height, 1.0) - y;
  BOOL v7 = self->mInnerRect.origin.x != x
    || self->mInnerRect.origin.y != y
    || self->mInnerRect.size.width != v5
    || self->mInnerRect.size.height != v6;
  self->mRectsWereUpdated |= v7;
  self->mInnerRect.origin.double x = x;
  self->mInnerRect.origin.double y = y;
  self->mInnerRect.size.double width = v5;
  self->mInnerRect.size.double height = v6;
}

- (void)setOuterRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  double v5 = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  double v6 = fmin(a3.origin.y + a3.size.height, 1.0) - y;
  BOOL v7 = self->mInnerRect.origin.x != x
    || self->mInnerRect.origin.y != y
    || self->mInnerRect.size.width != v5
    || self->mInnerRect.size.height != v6;
  self->mRectsWereUpdated |= v7;
  self->mOuterRect.origin.double x = x;
  self->mOuterRect.origin.double y = y;
  self->mOuterRect.size.double width = v5;
  self->mOuterRect.size.double height = v6;
}

- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  double v11 = width * (x * 2.0 + -1.0);
  double v12 = width * ((x + self->mOuterRect.size.width) * 2.0 + -1.0);
  double v13 = height * (y * 2.0 + -1.0);
  double v14 = height * ((y + self->mOuterRect.size.height) * 2.0 + -1.0);
  double v15 = self->mPosition.x;
  __float2 v16 = __sincosf_stret(self->mRotation);
  double v17 = self->mPosition.y;
  a3->double x = v15 + ((v11 + v12) * v16.__cosval - (v13 + v14) * v16.__sinval) * 0.5;
  a3->double y = v17 + ((v11 + v12) * v16.__sinval + (v13 + v14) * v16.__cosval) * 0.5;
  a4->double width = (v12 - v11) * 0.5;
  a4->double height = (v14 - v13) * 0.5;
}

- (void)updateVBOsInContext:(id)a3
{
  if (self->mHalfSize.width == 0.0 || self->mHalfSize.height == 0.0 || !*(_WORD *)&self->mPositionWasUpdated) {
    return;
  }
  double x = self->mOuterRect.origin.x;
  if (x == 0.0
    && self->mOuterRect.origin.y == 0.0
    && self->mOuterRect.size.width == 1.0
    && self->mOuterRect.size.height == 1.0)
  {
    p_double y = &self->mInnerRect.origin.y;
    p_size = &self->mInnerRect.size;
    p_float height = &self->mInnerRect.size.height;
    double v9 = self->mInnerRect.origin.x;
    double x = v9;
  }
  else
  {
    p_double y = &self->mOuterRect.origin.y;
    p_size = &self->mOuterRect.size;
    p_float height = &self->mOuterRect.size.height;
    double v9 = self->mInnerRect.origin.x;
  }
  double v10 = (x + p_size->width) * 2.0 + -1.0;
  double v140 = *p_y * 2.0 + -1.0;
  double v141 = x * 2.0 + -1.0;
  double v11 = (*p_y + *p_height) * 2.0 + -1.0;
  double v12 = v9 * 2.0 + -1.0;
  double y = self->mInnerRect.origin.y;
  double v14 = y * 2.0 + -1.0;
  double v142 = (v9 + self->mInnerRect.size.width) * 2.0 + -1.0;
  double v144 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
  *(_WORD *)&self->mMiddleOffset = 3588;
  if (self->mMeshType == 1) {
    int v15 = 38;
  }
  else {
    int v15 = 24;
  }
  self->uint64_t mNumberOfVertices = v15;
  __float2 v16 = (float32x2_t *)malloc_type_malloc(16 * (2 * v15), 0x100004052888210uLL);
  float v17 = self->mPosition.x;
  float v18 = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  __float2 v21 = __sincosf_stret(self->mRotation);
  double v22 = v141 * width;
  double v23 = v10 * width;
  double v24 = height;
  double v25 = v140 * height;
  double v26 = v11 * height;
  double v27 = v12 * width;
  double v28 = v14 * height;
  double cosval = v21.__cosval;
  double sinval = v21.__sinval;
  float v145 = v18;
  double v31 = v17 + v23 * v21.__cosval;
  float v32 = v31 - v25 * v21.__sinval;
  double v33 = v18 + v23 * v21.__sinval;
  *(float *)&double v23 = v33 + v25 * v21.__cosval;
  *(float *)&v229[12] = v32;
  v229[13] = LODWORD(v23);
  double v34 = v17 + v27 * v21.__cosval;
  float v35 = v34 - v28 * v21.__sinval;
  double v36 = v18 + v27 * v21.__sinval;
  *(float *)&double v31 = v31 - v26 * v21.__sinval;
  *(float *)&double v33 = v33 + v26 * v21.__cosval;
  v229[16] = LODWORD(v31);
  v229[17] = LODWORD(v33);
  double v37 = v17 + v22 * v21.__cosval;
  double v38 = v37 - v25 * v21.__sinval;
  double v39 = v18 + v22 * v21.__sinval;
  double v40 = v39 + v25 * v21.__cosval;
  double v41 = v37 - v26 * v21.__sinval;
  double v42 = v39 + v26 * v21.__cosval;
  float v43 = v36 + v28 * v21.__cosval;
  *(float *)v229 = v35;
  *(float *)&v229[1] = v43;
  double v44 = v142 * width;
  *(float *)&double v41 = v41;
  *(float *)&double v42 = v42;
  v229[20] = LODWORD(v41);
  v229[21] = LODWORD(v42);
  double v45 = v144 * height;
  double v138 = v34;
  double v139 = v36;
  float v46 = v34 - v45 * v21.__sinval;
  *(float *)&double v42 = v38;
  *(float *)&double v40 = v40;
  v229[8] = LODWORD(v42);
  v229[9] = LODWORD(v40);
  v229[24] = LODWORD(v42);
  v229[25] = LODWORD(v40);
  float v47 = v36 + v45 * v21.__cosval;
  *(float *)&v229[2] = v46;
  *(float *)&v229[3] = v47;
  double v48 = v17 + v44 * v21.__cosval;
  float v49 = v48 - v28 * v21.__sinval;
  double v50 = v18 + v44 * v21.__sinval;
  float v51 = v50 + v28 * v21.__cosval;
  *(float *)&v229[4] = v49;
  *(float *)&v229[5] = v51;
  float v52 = v140;
  *(float *)&double v44 = v10;
  v228[12] = LODWORD(v44);
  float v53 = v11;
  v228[16] = LODWORD(v44);
  *(float *)&v228[17] = v53;
  *(float *)&double v44 = v141;
  v228[20] = LODWORD(v44);
  *(float *)&v228[21] = v53;
  float v54 = v48 - v45 * v21.__sinval;
  float v55 = v50 + v45 * v21.__cosval;
  *(float *)&v229[6] = v54;
  *(float *)&v229[7] = v55;
  *(float *)&v229[10] = v35;
  *(float *)&v229[11] = v43;
  *(float *)&v229[14] = v49;
  *(float *)&v229[15] = v51;
  *(float *)&v229[18] = v54;
  *(float *)&v229[19] = v55;
  *(float *)&v229[22] = v46;
  *(float *)&v229[23] = v47;
  *(float *)&v229[26] = v35;
  *(float *)&v229[27] = v43;
  v228[8] = LODWORD(v44);
  v228[24] = LODWORD(v44);
  float v56 = v12;
  double v57 = v14;
  float v58 = v14;
  *(float *)v228 = v56;
  *(float *)&v228[1] = v58;
  *(float *)&v228[9] = v52;
  *(float *)&v228[13] = v52;
  *(float *)&v228[25] = v52;
  float v59 = v21.__cosval * width;
  float v60 = v21.__sinval * width;
  float v61 = v21.__cosval * height;
  float v62 = v21.__sinval * height;
  float v63 = v144;
  *(float *)&v228[2] = v56;
  *(float *)&v228[3] = v63;
  float v64 = v142;
  *(float *)&v228[4] = v64;
  *(float *)&v228[5] = v58;
  *(float *)&v228[6] = v64;
  *(float *)&v228[7] = v63;
  *(float *)&v228[10] = v56;
  *(float *)&v228[11] = v58;
  *(float *)&v228[14] = v64;
  *(float *)&v228[15] = v58;
  *(float *)&v228[18] = v64;
  *(float *)&v228[19] = v63;
  *(float *)&v228[22] = v56;
  *(float *)&v228[23] = v63;
  *(float *)&v228[26] = v56;
  *(float *)&v228[27] = v58;
  if (self->mOuterOffset)
  {
    unint64_t v65 = 0;
    CGSize mSpriteCoordinatesFactor = self->mSpriteCoordinatesFactor;
    CGPoint mSpriteCoordinatesOffset = self->mSpriteCoordinatesOffset;
    v68 = v16;
    do
    {
      float32x2_t v69 = *(float32x2_t *)&v228[2 * v65];
      __asm { FMOV            V15.2D, #1.0 }
      float64x2_t v75 = vaddq_f64(vcvtq_f64_f32(v69), _Q15);
      __asm { FMOV            V15.2D, #0.5 }
      float64x2_t v77 = vmulq_f64(v75, _Q15);
      float32x2_t *v68 = *(float32x2_t *)&v229[2 * v65];
      v68[1] = vcvt_f32_f64(vmlaq_f64((float64x2_t)mSpriteCoordinatesOffset, (float64x2_t)mSpriteCoordinatesFactor, v77));
      v78 = v68 + 4;
      v68[2] = v69;
      v68[3] = vcvt_f32_f64(v77);
      ++v65;
      unint64_t mOuterOffset = self->mOuterOffset;
      v68 += 4;
    }
    while (v65 < mOuterOffset);
  }
  else
  {
    LODWORD(mOuterOffset) = 0;
    v78 = v16;
  }
  float v80 = v17 - v59;
  float v81 = v62 + (float)(v17 - v59);
  float v82 = v145 - v60;
  float v83 = (float)(v145 - v60) - v61;
  if (self->mMeshType == 1)
  {
    float v84 = v59 + v17;
    double v143 = -(v57 * v24);
    float v85 = v80 + v143 * sinval;
    float v86 = v82 + v28 * cosval;
    float v184 = v85;
    float v185 = v86;
    double v87 = -(v144 * v24);
    float v88 = v80 + v87 * sinval;
    float v89 = v82 + v45 * cosval;
    float v188 = v88;
    float v180 = v81;
    float v181 = (float)(v145 - v60) - v61;
    float v182 = v35;
    float v183 = v43;
    float v186 = v46;
    float v187 = v47;
    float v189 = v89;
    float v190 = v80 - v62;
    float v191 = v61 + v82;
    float v192 = v80 - v62;
    float v193 = v61 + v82;
    float v194 = v46;
    float v195 = v47;
    float v90 = v138 - v62;
    float v91 = v139 + v61;
    float v196 = v90;
    float v197 = v91;
    float v198 = v48 - v45 * v21.__sinval;
    float v199 = v50 + v45 * v21.__cosval;
    float v92 = v48 - v62;
    float v93 = v50 + v61;
    float v200 = v92;
    float v201 = v93;
    float v94 = v60 + v145;
    float v202 = v84 - v62;
    float v203 = v61 + v94;
    float v204 = v84 - v62;
    float v205 = v61 + v94;
    float v206 = v198;
    float v207 = v199;
    *(float *)&double v87 = v84 + v87 * sinval;
    float v95 = v94 + v45 * cosval;
    int v208 = LODWORD(v87);
    float v209 = v95;
    float v210 = v48 - v28 * v21.__sinval;
    float v211 = v50 + v28 * v21.__cosval;
    float v96 = v84 + v143 * sinval;
    float v97 = v94 + v28 * cosval;
    float v212 = v96;
    float v213 = v97;
    float v214 = v62 + v84;
    float v215 = v94 - v61;
    float v216 = v62 + v84;
    float v217 = v94 - v61;
    float v218 = v49;
    float v219 = v51;
    float v98 = v48 + v62;
    float v99 = v50 - v61;
    float v220 = v98;
    float v221 = v99;
    float v222 = v35;
    float v223 = v43;
    float v100 = v138 + v62;
    float v101 = v139 - v61;
    float v224 = v100;
    float v225 = v101;
    float v226 = v81;
    float v227 = v83;
    __asm { FMOV            V4.2S, #-1.0 }
    uint64_t v146 = _D4;
    float v147 = v56;
    float v148 = v58;
    LODWORD(v149) = -1082130432;
    *((float *)&v149 + 1) = v58;
    float v150 = v56;
    float v151 = v144;
    LODWORD(v152) = -1082130432;
    *((float *)&v152 + 1) = v144;
    long long v153 = xmmword_165B50;
    float v154 = v56;
    float v155 = v144;
    uint64_t v156 = LODWORD(v56) | 0x3F80000000000000;
    float v157 = v64;
    float v158 = v144;
    float v159 = v64;
    __asm { FMOV            V5.4S, #1.0 }
    long long v160 = _Q5;
    int v161 = 1065353216;
    float v162 = v64;
    float v163 = v144;
    int v164 = 1065353216;
    float v165 = v144;
    float v166 = v64;
    float v167 = v58;
    int v168 = 1065353216;
    long long v170 = xmmword_165B60;
    float v169 = v58;
    float v171 = v64;
    float v172 = v58;
    float v173 = v64;
    int v174 = -1082130432;
    float v175 = v56;
    float v176 = v58;
    float v177 = v56;
    uint64_t v178 = _D4;
    int v179 = -1082130432;
    LODWORD(mOuterOffset) = self->mNumberOfVertices;
    if (mOuterOffset != self->mOuterOffset)
    {
      unint64_t v104 = 0;
      double v105 = self->mSpriteCoordinatesFactor.width;
      double v106 = self->mSpriteCoordinatesFactor.height;
      double v107 = self->mSpriteCoordinatesOffset.x;
      double v108 = self->mSpriteCoordinatesOffset.y;
      v109 = &v181;
      v110 = (float *)&v146 + 1;
      do
      {
        v78->f32[0] = *(v109 - 1);
        __int32 v111 = *(_DWORD *)v109;
        v109 += 2;
        v78->i32[1] = v111;
        float v112 = *(v110 - 1);
        double v113 = (v112 + 1.0) * 0.5;
        float32_t v114 = v107 + v113 * v105;
        v78[1].f32[0] = v114;
        float v115 = *v110;
        v110 += 2;
        double v116 = (v115 + 1.0) * 0.5;
        float32_t v117 = v108 + v116 * v106;
        v78[1].f32[1] = v117;
        v78[2].f32[0] = v112;
        float32_t v118 = v113;
        v78[2].f32[1] = v115;
        v78[3].f32[0] = v118;
        float32_t v119 = v116;
        v78[3].f32[1] = v119;
        ++v104;
        uint64_t mNumberOfVertices = self->mNumberOfVertices;
        v78 += 4;
      }
      while (v104 < mNumberOfVertices - (unint64_t)self->mOuterOffset);
LABEL_26:
      LODWORD(mOuterOffset) = mNumberOfVertices;
    }
  }
  else
  {
    float v180 = v62 + (float)(v17 - v59);
    float v181 = (float)(v145 - v60) - v61;
    float v182 = v35;
    float v183 = v36 + v28 * v21.__cosval;
    float v184 = v62 + (float)(v59 + v17);
    float v185 = (float)(v60 + v145) - v61;
    float v186 = v48 - v28 * v21.__sinval;
    float v187 = v50 + v28 * v21.__cosval;
    float v188 = (float)(v59 + v17) - v62;
    float v189 = v61 + (float)(v60 + v145);
    float v190 = v48 - v45 * v21.__sinval;
    float v191 = v50 + v45 * v21.__cosval;
    float v192 = v80 - v62;
    float v193 = v61 + v82;
    float v194 = v46;
    float v195 = v36 + v45 * v21.__cosval;
    float v196 = v180;
    float v197 = v181;
    float v198 = v35;
    float v199 = v183;
    __asm { FMOV            V4.2S, #-1.0 }
    uint64_t v146 = _D4;
    float v147 = v56;
    float v148 = v58;
    unint64_t v149 = 0xBF8000003F800000;
    float v150 = v142;
    float v151 = v58;
    __asm { FMOV            V5.2S, #1.0 }
    uint64_t v152 = _D5;
    *(float *)&long long v153 = v142;
    *((float *)&v153 + 1) = v144;
    *((void *)&v153 + 1) = 0x3F800000BF800000;
    float v154 = v56;
    float v155 = v144;
    uint64_t v156 = _D4;
    float v157 = v56;
    float v158 = v58;
    if (self->mNumberOfVertices != mOuterOffset)
    {
      unint64_t v123 = 0;
      double v124 = self->mSpriteCoordinatesFactor.width;
      double v125 = self->mSpriteCoordinatesFactor.height;
      double v126 = self->mSpriteCoordinatesOffset.x;
      double v127 = self->mSpriteCoordinatesOffset.y;
      v128 = (float *)&v146 + 1;
      do
      {
        float32x2_t *v78 = *(float32x2_t *)(&v180 + 2 * v123);
        float v129 = *(v128 - 1);
        double v130 = (v129 + 1.0) * 0.5;
        float32_t v131 = v126 + v130 * v124;
        v78[1].f32[0] = v131;
        float v132 = *v128;
        v128 += 2;
        double v133 = (v132 + 1.0) * 0.5;
        float32_t v134 = v127 + v133 * v125;
        v78[1].f32[1] = v134;
        v78[2].f32[0] = v129;
        float32_t v135 = v130;
        v78[2].f32[1] = v132;
        v78[3].f32[0] = v135;
        float32_t v136 = v133;
        v78[3].f32[1] = v136;
        ++v123;
        uint64_t mNumberOfVertices = self->mNumberOfVertices;
        v78 += 4;
      }
      while (v123 < mNumberOfVertices - (unint64_t)self->mOuterOffset);
      goto LABEL_26;
    }
  }
  uint64_t mVBO = self->mVBO;
  if (!mVBO)
  {
    glGenBuffers(1, &self->mVBO);
    LODWORD(mOuterOffset) = self->mNumberOfVertices;
    uint64_t mVBO = self->mVBO;
  }
  objc_msgSend(a3, "uploadBuffer:withSize:toVertexBuffer2D:usage:", v16, (32 * mOuterOffset), mVBO, 35044, *(void *)&v138, *(void *)&v139);
  free(v16);
  *(_WORD *)&self->mPositionWasUpdated = 0;
}

- (void)renderImageInner:(id)a3 inContext:(id)a4
{
  char v12 = 0;
  if (a3)
  {
    if (self->mPreservesImageAspectRatio) {
      CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
    }
    else {
      [a3 aspectRatio];
    }
    *(float *)&CGFloat v7 = v7;
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
  }
  [(MRCroppingSpriteVBO *)self updateVBOsInContext:a4];
  if (a3) {
    uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2;
  }
  else {
    uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
  }
  for (uint64_t i = 1; i != 4; ++i)
  {
    id v10 = [a4 imageSetOnTextureUnit:i];
    uint64_t v11 = (1 << i);
    if (!v10) {
      uint64_t v11 = 0;
    }
    mNeedsInSpriteCoordinates |= v11;
  }
  [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
  [a4 drawTriangleStripFromOffset:0 count:self->mMiddleOffset];
  [a4 unsetVertexPointer];
  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
  }
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x != self->mOuterRect.origin.x
    || self->mInnerRect.origin.y != self->mOuterRect.origin.y
    || self->mInnerRect.size.width != self->mOuterRect.size.width
    || self->mInnerRect.size.height != self->mOuterRect.size.height)
  {
    char v12 = 0;
    if (a3)
    {
      if (self->mPreservesImageAspectRatio) {
        CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
      }
      else {
        [a3 aspectRatio];
      }
      *(float *)&CGFloat v7 = v7;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
    }
    [(MRCroppingSpriteVBO *)self updateVBOsInContext:a4];
    if (a3) {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2;
    }
    else {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
    }
    for (uint64_t i = 1; i != 4; ++i)
    {
      id v10 = [a4 imageSetOnTextureUnit:i];
      uint64_t v11 = (1 << i);
      if (!v10) {
        uint64_t v11 = 0;
      }
      mNeedsInSpriteCoordinates |= v11;
    }
    [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
    [a4 drawTriangleStripFromOffset:self->mMiddleOffset count:self->mOuterOffset - (unint64_t)self->mMiddleOffset];
    [a4 unsetVertexPointer];
    if (a3) {
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
    }
  }
}

- (void)renderImageOuter:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x != 0.0
    || self->mInnerRect.origin.y != 0.0
    || self->mInnerRect.size.width != 1.0
    || self->mInnerRect.size.height != 1.0)
  {
    char v12 = 0;
    if (a3)
    {
      if (self->mPreservesImageAspectRatio) {
        CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
      }
      else {
        [a3 aspectRatio];
      }
      *(float *)&CGFloat v7 = v7;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
    }
    [(MRCroppingSpriteVBO *)self updateVBOsInContext:a4];
    if (a3) {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2;
    }
    else {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
    }
    for (uint64_t i = 1; i != 4; ++i)
    {
      id v10 = [a4 imageSetOnTextureUnit:i];
      uint64_t v11 = (1 << i);
      if (!v10) {
        uint64_t v11 = 0;
      }
      mNeedsInSpriteCoordinates |= v11;
    }
    [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
    [a4 drawTriangleStripFromOffset:self->mOuterOffset count:self->mNumberOfVertices - (unint64_t)self->mOuterOffset];
    [a4 unsetVertexPointer];
    if (a3) {
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
    }
  }
}

- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (!self->mHitIsActive) {
    return 0;
  }
  double v7 = MRMatrix_UnprojectPoint(a4, a3.x, a3.y) - self->mPosition.x;
  double v9 = v8 - self->mPosition.y;
  __float2 v10 = __sincosf_stret(self->mRotation);
  double v11 = ((v9 * v10.__sinval + v7 * v10.__cosval) / self->mHalfSize.width + 1.0) * 0.5;
  double v12 = ((v9 * v10.__cosval - v7 * v10.__sinval) / self->mHalfSize.height + 1.0) * 0.5;
  if (a5)
  {
    a5->double x = v11;
    a5->double y = v12;
  }
  BOOL v13 = v11 >= 0.0;
  if (v11 > 1.0) {
    BOOL v13 = 0;
  }
  if (v12 < 0.0) {
    BOOL v13 = 0;
  }
  return v12 <= 1.0 && v13;
}

- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:
{
  double width = self->mHalfSize.width;
  __float2 v8 = __sincosf_stret(self->mRotation);
  float v9 = width * v8.__cosval;
  double height = self->mHalfSize.height;
  float v11 = height * v8.__sinval;
  float v12 = width * v8.__sinval;
  float v13 = height * v8.__cosval;
  double v14 = v9;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  (*a3)[0].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x - v9 + v11, self->mPosition.y - v12 - v13);
  (*a3)[0].double y = v18;
  (*a3)[1].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x + v14 + v15, self->mPosition.y + v16 - v17);
  (*a3)[1].double y = v19;
  (*a3)[2].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x + v14 - v15, self->mPosition.y + v16 + v17);
  (*a3)[2].double y = v20;
  (*a3)[3].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x - v14 - v15, self->mPosition.y - v16 + v17);
  (*a3)[3].double y = v21;
  return 1;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)halfSize
{
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)rotation
{
  return self->mRotation;
}

- (CGRect)innerRect
{
  double x = self->mInnerRect.origin.x;
  double y = self->mInnerRect.origin.y;
  double width = self->mInnerRect.size.width;
  double height = self->mInnerRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)outerRect
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mOuterRect.size.width;
  double height = self->mOuterRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)preservesImageAspectRatio
{
  return self->mPreservesImageAspectRatio;
}

- (void)setPreservesImageAspectRatio:(BOOL)a3
{
  self->mPreservesImageAspectRatio = a3;
}

- (BOOL)hitIsActive
{
  return self->mHitIsActive;
}

- (void)setHitIsActive:(BOOL)a3
{
  self->mHitIsActive = a3;
}

- (BOOL)needsInSpriteCoordinates
{
  return self->mNeedsInSpriteCoordinates;
}

- (void)setNeedsInSpriteCoordinates:(BOOL)a3
{
  self->uint64_t mNeedsInSpriteCoordinates = a3;
}

- (CGSize)spriteCoordinatesFactor
{
  double width = self->mSpriteCoordinatesFactor.width;
  double height = self->mSpriteCoordinatesFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSpriteCoordinatesFactor:(CGSize)a3
{
  self->CGSize mSpriteCoordinatesFactor = a3;
}

- (CGPoint)spriteCoordinatesOffset
{
  double x = self->mSpriteCoordinatesOffset.x;
  double y = self->mSpriteCoordinatesOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSpriteCoordinatesOffset:(CGPoint)a3
{
  self->CGPoint mSpriteCoordinatesOffset = a3;
}

- (unsigned)meshType
{
  return self->mMeshType;
}

- (void)setMeshType:(unsigned __int8)a3
{
  self->mMeshType = a3;
}

@end