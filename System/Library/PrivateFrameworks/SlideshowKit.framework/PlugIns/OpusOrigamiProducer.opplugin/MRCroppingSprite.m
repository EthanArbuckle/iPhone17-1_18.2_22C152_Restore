@interface MRCroppingSprite
+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8;
+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
+ (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8;
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:;
- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (BOOL)hitIsActive;
- (BOOL)needsInSpriteCoordinates;
- (BOOL)preservesImageAspectRatio;
- (BOOL)usesOwnMatrixForHitTest;
- (CGPoint)position;
- (CGPoint)spriteCoordinatesOffset;
- (CGRect)innerRect;
- (CGRect)outerRect;
- (CGSize)halfSize;
- (CGSize)spriteCoordinatesFactor;
- (MRCroppingSprite)init;
- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6;
- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7;
- (double)rotation;
- (unsigned)meshType;
- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6;
- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4;
- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8;
- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8;
- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8;
- (void)renderImageInner:(id)a3 inContext:(id)a4;
- (void)renderImageInner:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)renderImageOuter:(id)a3 inContext:(id)a4;
- (void)renderImageOuter:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7;
- (void)reset;
- (void)setHitIsActive:(BOOL)a3;
- (void)setInnerRect:(CGRect)a3;
- (void)setMeshType:(unsigned __int8)a3;
- (void)setNeedsInSpriteCoordinates:(BOOL)a3;
- (void)setOuterRect:(CGRect)a3;
- (void)setPreservesImageAspectRatio:(BOOL)a3;
- (void)setSpriteCoordinatesFactor:(CGSize)a3;
- (void)setSpriteCoordinatesOffset:(CGPoint)a3;
- (void)setUsesOwnMatrixForHitTest:(BOOL)a3;
@end

@implementation MRCroppingSprite

- (MRCroppingSprite)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRCroppingSprite;
  result = [(MRCroppingSprite *)&v8 init];
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
  }
  return result;
}

- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  v12 = [(MRCroppingSprite *)self init];
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a5;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](v12, "fakeRenderInContext:atPosition:andSize:zRotation:", a6, x, y, width, height, v13);
  }
  return v14;
}

- (MRCroppingSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v13 = [(MRCroppingSprite *)self init];
  v15 = v13;
  if (v13)
  {
    *(float *)&double v14 = a5;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](v13, "fakeRenderInContext:atPosition:andSize:zRotation:", a7, x, y, width, height, v14);
    -[MRCroppingSprite setInnerRect:](v15, "setInnerRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
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
}

- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6
{
  double height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a4.y;
  float x = a4.x;
  [a3 localAspectRatio];
  *(float *)&CGFloat y = y / v13;
  *(float *)&CGFloat width = width * 0.5;
  [a3 localAspectRatio];
  float v15 = height * 0.5 / v14;
  self->mPosition.CGFloat y = *(float *)&y;
  self->mHalfSize.CGFloat width = *(float *)&width;
  self->mHalfSize.double height = v15;
  self->mRotation = a6;
  self->mPosition.float x = x;
  if (self->_usesOwnMatrixForHitTest)
  {
    v16 = (float *)[a3 modelViewMatrix];
    v17 = (float *)[a3 projectionMatrix];
    MRMatrix_MultiplyWithMatrix(v16, v17, self->mModelViewProjectionMatrix);
  }
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
  self->mInnerRect.origin.double x = x;
  self->mInnerRect.origin.double y = y;
  self->mInnerRect.size.CGFloat width = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  self->mInnerRect.size.double height = fmin(a3.origin.y + a3.size.height, 1.0) - y;
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
  self->mOuterRect.origin.double x = x;
  self->mOuterRect.origin.double y = y;
  self->mOuterRect.size.CGFloat width = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  self->mOuterRect.size.double height = fmin(a3.origin.y + a3.size.height, 1.0) - y;
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
  float mRotation = self->mRotation;
  __float2 v17 = __sincosf_stret(mRotation);
  a3->double x = v15 + ((v11 + v12) * v17.__cosval - (v13 + v14) * v17.__sinval) * 0.5;
  double v18 = self->mPosition.y;
  float v19 = self->mRotation;
  __float2 v20 = __sincosf_stret(v19);
  a3->double y = v18 + ((v11 + v12) * v20.__sinval + (v13 + v14) * v20.__cosval) * 0.5;
  a4->double width = (v12 - v11) * 0.5;
  a4->double height = (v14 - v13) * 0.5;
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4);
  *(float *)&double v14 = a7;
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:](MRCroppingSprite, "renderDumbImage:inContext:atPosition:andSize:zRotation:", a3, a4, x, y, width, height, v14);
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4);
  *(float *)&double v14 = a7;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:zRotation:", a3, a4, x, y, width, height, v14);
}

- (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8
{
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a5);
  *(float *)&double v16 = a8;
  +[MRCroppingSprite renderImage:withMask:inContext:atPosition:andSize:zRotation:](MRCroppingSprite, "renderImage:withMask:inContext:atPosition:andSize:zRotation:", a3, a4, a5, x, y, width, height, v16);
}

- (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.y;
  double v14 = a5.x;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, a5.x, a5.y, a6.width, a6.height, 0.0);
  *(float *)&double v17 = a7;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:", a3, a4, v14, v13, width, height, v17, x, y);
}

- (void)renderImageInner:(id)a3 inContext:(id)a4
{
  double y = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  double x = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v10 = __sincosf_stret(mRotation);
  double v20 = -1.0;
  CGFloat v11 = self->mInnerRect.origin.x;
  double v12 = self->mInnerRect.origin.y;
  double v13 = v11 * 2.0 + -1.0;
  double v14 = (v11 + self->mInnerRect.size.width) * 2.0 + -1.0;
  double v15 = v12 * 2.0 + -1.0;
  double v16 = (v12 + self->mInnerRect.size.height) * 2.0 + -1.0;
  double v17 = width;
  double v18 = height;
  *(float *)&double v20 = v13;
  float v19 = v15;
  v62[0] = LODWORD(v20);
  *(float *)&v62[1] = v19;
  *(float *)&CGFloat v11 = v16;
  v62[2] = LODWORD(v20);
  v62[3] = LODWORD(v11);
  *(float *)&double v20 = v14;
  v62[4] = LODWORD(v20);
  *(float *)&v62[5] = v19;
  v62[6] = LODWORD(v20);
  v62[7] = LODWORD(v11);
  char v58 = 0;
  if (a3)
  {
    if (self->mPreservesImageAspectRatio)
    {
      *(float *)&double v20 = width / height;
    }
    else
    {
      [a3 aspectRatio];
      *(float *)&double v20 = v20;
    }
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v58 state:v20];
    [a4 setTextureCoordinatesPointer:v62 onTextureUnit:0];
  }
  int v21 = 0;
  *(float *)&unsigned int v22 = x;
  *(float *)&unsigned int v23 = y;
  unint64_t v53 = __PAIR64__(v23, v22);
  double v24 = v13 * v17;
  double v25 = v14 * v17;
  double v26 = v15 * v18;
  double v27 = v16 * v18;
  __asm { FMOV            V1.2D, #1.0 }
  uint64_t v33 = 1;
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v55 = _Q0;
  float64x2_t v57 = _Q1;
  do
  {
    id v35 = objc_msgSend(a4, "imageSetOnTextureUnit:", v33, v53);
    if (v35)
    {
      if ([v35 preservesAspectRatio])
      {
        v36 = v62;
      }
      else
      {
        for (uint64_t i = 0; i != 8; i += 4)
        {
          v36 = v61;
          *(float32x4_t *)&v61[i * 4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v62[i]), v57), v55)), vmulq_f64(vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v62[i]), v57), v55));
        }
      }
      v21 |= 1 << v33;
      [a4 setTextureCoordinatesPointer:v36 onTextureUnit:v33];
    }
    ++v33;
  }
  while (v33 != 4);
  if (self->mNeedsInSpriteCoordinates)
  {
    for (uint64_t j = 0; j != 8; ++j)
    {
      if (j) {
        uint64_t v39 = 128;
      }
      else {
        uint64_t v39 = 120;
      }
      double v40 = *(double *)((char *)&self->super.isa + v39);
      if (j) {
        uint64_t v41 = 144;
      }
      else {
        uint64_t v41 = 136;
      }
      float v42 = *(double *)((char *)&self->super.isa + v41) + (*(float *)&v62[j] + 1.0) * 0.5 * v40;
      v60[j] = v42;
    }
    objc_msgSend(a4, "setInSpriteCoordinatesPointer:", v60, 1.0, 0.5);
  }
  double v43 = *(float *)&v53 + v24 * v10.__cosval;
  float v44 = v43 - v26 * v10.__sinval;
  double v45 = *((float *)&v53 + 1) + v24 * v10.__sinval;
  float v46 = v45 + v26 * v10.__cosval;
  *(float *)v59 = v44;
  *(float *)&v59[1] = v46;
  *(float *)&double v43 = v43 - v27 * v10.__sinval;
  float v47 = v45 + v27 * v10.__cosval;
  v59[2] = LODWORD(v43);
  *(float *)&v59[3] = v47;
  double v48 = *(float *)&v53 + v25 * v10.__cosval;
  *(float *)&double v43 = v48 - v26 * v10.__sinval;
  double v49 = *((float *)&v53 + 1) + v25 * v10.__sinval;
  float v50 = v49 + v26 * v10.__cosval;
  v59[4] = LODWORD(v43);
  *(float *)&v59[5] = v50;
  *(float *)&double v48 = v48 - v27 * v10.__sinval;
  float v51 = v49 + v27 * v10.__cosval;
  v59[6] = LODWORD(v48);
  *(float *)&v59[7] = v51;
  [a4 setVertex2DPointer:v59];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  uint64_t v52 = -3;
  do
  {
    if ((v21 & (1 << (v52 + 4))) != 0) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
    }
  }
  while (!__CFADD__(v52++, 1));
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v58];
  }
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4
{
  double x = self->mInnerRect.origin.x;
  double v8 = self->mOuterRect.origin.x;
  if (x == v8)
  {
    double y = self->mInnerRect.origin.y;
    double v10 = self->mOuterRect.origin.y;
    if (y == v10
      && self->mInnerRect.size.width == self->mOuterRect.size.width
      && self->mInnerRect.size.height == self->mOuterRect.size.height)
    {
      return;
    }
  }
  else
  {
    double v10 = self->mOuterRect.origin.y;
    double y = self->mInnerRect.origin.y;
  }
  double v132 = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  double v130 = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v16 = __sincosf_stret(mRotation);
  double v17 = v8 * 2.0 + -1.0;
  double v18 = (v8 + self->mOuterRect.size.width) * 2.0 + -1.0;
  double v19 = v10 * 2.0 + -1.0;
  double v20 = (v10 + self->mOuterRect.size.height) * 2.0 + -1.0;
  double v21 = x * 2.0 + -1.0;
  double v22 = (x + self->mInnerRect.size.width) * 2.0 + -1.0;
  double v23 = y * 2.0 + -1.0;
  double v24 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
  int mMeshType = self->mMeshType;
  if (mMeshType == 3)
  {
    float v29 = v18;
    float v27 = v23;
    float v26 = v22;
    float v31 = v24;
    float v36 = v21;
    float v28 = v27;
    float v32 = v26;
    float v33 = v31;
    float v34 = v26;
    float v35 = v31;
    float v30 = v27;
    float v37 = v36;
    float v38 = v27;
    float v40 = v27;
    float v39 = v17;
    v138[0] = v29;
    float v41 = v36;
    float v42 = v31;
    float v43 = v39;
    float v44 = v31;
  }
  else if (mMeshType == 2)
  {
    float v26 = v21;
    float v27 = v19;
    float v28 = v23;
    float v29 = v22;
    float v30 = v24;
    float v31 = v27;
    float v32 = v29;
    float v33 = v28;
    float v34 = v29;
    float v35 = v28;
    float v36 = v26;
    float v37 = v26;
    float v38 = v30;
    float v39 = v26;
    float v40 = v20;
    v138[0] = v26;
    float v41 = v29;
    float v42 = v30;
    float v43 = v29;
    float v44 = v40;
  }
  else
  {
    float v27 = v19;
    float v26 = v21;
    float v28 = v23;
    float v29 = v18;
    float v32 = v22;
    float v35 = v20;
    float v30 = v24;
    float v31 = v27;
    float v33 = v28;
    float v34 = v29;
    float v36 = v32;
    float v38 = v35;
    float v39 = v26;
    float v40 = v30;
    float v37 = v17;
    v138[0] = v37;
    float v41 = v37;
    float v42 = v27;
    float v43 = v26;
    float v44 = v28;
  }
  double v45 = width;
  double v46 = height;
  v138[1] = v27;
  v138[2] = v26;
  v138[3] = v28;
  v138[4] = v29;
  v138[5] = v31;
  v138[6] = v32;
  v138[7] = v33;
  v138[8] = v34;
  v138[9] = v35;
  v138[10] = v36;
  v138[11] = v30;
  v138[12] = v37;
  v138[13] = v38;
  v138[14] = v39;
  v138[15] = v40;
  v138[16] = v41;
  v138[17] = v42;
  v138[18] = v43;
  v138[19] = v44;
  char v134 = 0;
  if (a3)
  {
    *(float *)&double v15 = height;
    *(float *)&double v14 = width;
    double v126 = v18;
    double v128 = v22;
    double v47 = v24;
    double v48 = v23;
    double v49 = v21;
    double v50 = v20;
    double v51 = v19;
    double v52 = v17;
    if (self->mPreservesImageAspectRatio)
    {
      *(float *)&double v14 = *(float *)&v14 / *(float *)&v15;
    }
    else
    {
      objc_msgSend(a3, "aspectRatio", v14, v15);
      *(float *)&double v14 = v14;
    }
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v134 state:v14];
    [a4 setTextureCoordinatesPointer:v138 onTextureUnit:0];
    double v17 = v52;
    double v19 = v51;
    double v20 = v50;
    double v21 = v49;
    double v23 = v48;
    double v24 = v47;
    double v18 = v126;
    double v22 = v128;
  }
  int v53 = 0;
  float v54 = v130;
  float v127 = v54;
  float v55 = v132;
  float v129 = v55;
  double v125 = v17 * v45;
  double v56 = v18 * v45;
  double v57 = v19 * v46;
  double v58 = v20 * v46;
  double v59 = v21 * v45;
  double v60 = v22 * v45;
  __asm { FMOV            V1.2D, #1.0 }
  uint64_t v66 = 1;
  double v67 = v23 * v46;
  double v68 = v24 * v46;
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v131 = _Q0;
  float64x2_t v133 = _Q1;
  do
  {
    id v70 = objc_msgSend(a4, "imageSetOnTextureUnit:", v66, *(void *)&v125);
    if (v70)
    {
      if ([v70 preservesAspectRatio])
      {
        v71 = v138;
      }
      else
      {
        for (uint64_t i = 0; i != 20; i += 4)
        {
          v71 = (float *)v137;
          *(float32x4_t *)&v137[i * 4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v138[i]), v133), v131)), vmulq_f64(vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v138[i]), v133), v131));
        }
      }
      v53 |= 1 << v66;
      [a4 setTextureCoordinatesPointer:v71 onTextureUnit:v66];
    }
    ++v66;
  }
  while (v66 != 4);
  if (self->mNeedsInSpriteCoordinates)
  {
    for (uint64_t j = 0; j != 20; ++j)
    {
      if (j) {
        uint64_t v74 = 128;
      }
      else {
        uint64_t v74 = 120;
      }
      double v75 = *(double *)((char *)&self->super.isa + v74);
      if (j) {
        uint64_t v76 = 144;
      }
      else {
        uint64_t v76 = 136;
      }
      float v77 = *(double *)((char *)&self->super.isa + v76) + (v138[j] + 1.0) * 0.5 * v75;
      v136[j] = v77;
    }
    objc_msgSend(a4, "setInSpriteCoordinatesPointer:", v136, 1.0, 0.5);
  }
  int v78 = self->mMeshType;
  if (v78 == 3)
  {
    double v99 = v127 + v56 * v16.__cosval;
    float v80 = v99 - v67 * v16.__sinval;
    double v100 = v129 + v56 * v16.__sinval;
    float v82 = v100 + v67 * v16.__cosval;
    double v101 = v127 + v60 * v16.__cosval;
    float v83 = v101 - v67 * v16.__sinval;
    double v102 = v129 + v60 * v16.__sinval;
    float v84 = v102 + v67 * v16.__cosval;
    double v86 = v99 - v68 * v16.__sinval;
    double v88 = v100 + v68 * v16.__cosval;
    float v89 = v101 - v68 * v16.__sinval;
    float v90 = v102 + v68 * v16.__cosval;
    double v103 = v127 + v59 * v16.__cosval;
    float v91 = v103 - v67 * v16.__sinval;
    double v104 = v129 + v59 * v16.__sinval;
    float v92 = v104 + v67 * v16.__cosval;
    double v105 = v127 + v125 * v16.__cosval;
    double v93 = v105 - v67 * v16.__sinval;
    double v106 = v129 + v125 * v16.__sinval;
    double v94 = v106 + v67 * v16.__cosval;
    float v95 = v103 - v68 * v16.__sinval;
    float v96 = v104 + v68 * v16.__cosval;
    float v97 = v105 - v68 * v16.__sinval;
    double v98 = v106 + v68 * v16.__cosval;
  }
  else
  {
    if (v78 != 2)
    {
      double v112 = v127 + v125 * v16.__cosval;
      float v95 = v112 - v57 * v16.__sinval;
      double v113 = v129 + v125 * v16.__sinval;
      float v82 = v113 + v57 * v16.__cosval;
      double v114 = v127 + v59 * v16.__cosval;
      float v83 = v114 - v67 * v16.__sinval;
      double v115 = v129 + v59 * v16.__sinval;
      float v84 = v115 + v67 * v16.__cosval;
      double v116 = v127 + v56 * v16.__cosval;
      double v86 = v116 - v57 * v16.__sinval;
      double v117 = v129 + v56 * v16.__sinval;
      double v88 = v117 + v57 * v16.__cosval;
      double v118 = v127 + v60 * v16.__cosval;
      float v89 = v118 - v67 * v16.__sinval;
      double v119 = v129 + v60 * v16.__sinval;
      float v90 = v119 + v67 * v16.__cosval;
      float v108 = v116 - v58 * v16.__sinval;
      float v109 = v117 + v58 * v16.__cosval;
      float v91 = v118 - v68 * v16.__sinval;
      float v92 = v119 + v68 * v16.__cosval;
      float v110 = v112 - v58 * v16.__sinval;
      float v111 = v113 + v58 * v16.__cosval;
      double v93 = v114 - v68 * v16.__sinval;
      double v94 = v115 + v68 * v16.__cosval;
      *(float *)v135 = v95;
      float v96 = v82;
      float v97 = v83;
      float v107 = v84;
      goto LABEL_41;
    }
    double v79 = v127 + v59 * v16.__cosval;
    float v80 = v79 - v57 * v16.__sinval;
    double v81 = v129 + v59 * v16.__sinval;
    float v82 = v81 + v57 * v16.__cosval;
    float v83 = v79 - v67 * v16.__sinval;
    float v84 = v81 + v67 * v16.__cosval;
    double v85 = v127 + v60 * v16.__cosval;
    double v86 = v85 - v57 * v16.__sinval;
    double v87 = v129 + v60 * v16.__sinval;
    double v88 = v87 + v57 * v16.__cosval;
    float v89 = v85 - v67 * v16.__sinval;
    float v90 = v87 + v67 * v16.__cosval;
    float v91 = v79 - v68 * v16.__sinval;
    float v92 = v81 + v68 * v16.__cosval;
    double v93 = v79 - v58 * v16.__sinval;
    double v94 = v81 + v58 * v16.__cosval;
    float v95 = v85 - v68 * v16.__sinval;
    float v96 = v87 + v68 * v16.__cosval;
    float v97 = v85 - v58 * v16.__sinval;
    double v98 = v87 + v58 * v16.__cosval;
  }
  float v107 = v98;
  *(float *)v135 = v80;
  float v108 = v89;
  float v109 = v90;
  float v110 = v91;
  float v111 = v92;
LABEL_41:
  float v120 = v94;
  float v121 = v93;
  float v122 = v88;
  *(float *)&v135[1] = v82;
  *(float *)&v135[2] = v83;
  float v123 = v86;
  *(float *)&v135[3] = v84;
  *(float *)&v135[4] = v123;
  *(float *)&v135[5] = v122;
  *(float *)&v135[6] = v89;
  *(float *)&v135[7] = v90;
  *(float *)&v135[8] = v108;
  *(float *)&v135[9] = v109;
  *(float *)&v135[10] = v91;
  *(float *)&v135[11] = v92;
  *(float *)&v135[12] = v110;
  *(float *)&v135[13] = v111;
  *(float *)&v135[14] = v121;
  *(float *)&v135[15] = v120;
  *(float *)&v135[16] = v95;
  *(float *)&v135[17] = v96;
  *(float *)&v135[18] = v97;
  *(float *)&v135[19] = v107;
  [a4 setVertex2DPointer:v135];
  [a4 drawTriangleStripFromOffset:0 count:10];
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  uint64_t v124 = -3;
  do
  {
    if ((v53 & (1 << (v124 + 4))) != 0) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
    }
  }
  while (!__CFADD__(v124++, 1));
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v134];
  }
}

- (void)renderImageOuter:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x == 0.0
    && self->mInnerRect.origin.y == 0.0
    && self->mInnerRect.size.width == 1.0
    && self->mInnerRect.size.height == 1.0)
  {
    return;
  }
  double x = self->mOuterRect.origin.x;
  if (x == 0.0
    && self->mOuterRect.origin.y == 0.0
    && self->mOuterRect.size.width == 1.0
    && self->mOuterRect.size.height == 1.0)
  {
    int v8 = 1;
    uint64_t v9 = 176;
    uint64_t v10 = 168;
    uint64_t v11 = 160;
    double x = self->mInnerRect.origin.x;
  }
  else
  {
    int v8 = 0;
    uint64_t v9 = 208;
    uint64_t v10 = 200;
    uint64_t v11 = 192;
  }
  double v12 = *(double *)((char *)&self->super.isa + v11);
  double v13 = *(double *)((char *)&self->super.isa + v9);
  double v14 = *(double *)((char *)&self->super.isa + v10);
  v191.f64[0] = self->mPosition.y;
  float width = self->mHalfSize.width;
  float height = self->mHalfSize.height;
  v190.f64[0] = self->mPosition.x;
  float mRotation = self->mRotation;
  __float2 v18 = __sincosf_stret(mRotation);
  float cosval = v18.__cosval;
  float sinval = v18.__sinval;
  v186 = &v177;
  double v19 = -1.0;
  double v20 = x * 2.0 + -1.0;
  double v21 = (x + v14) * 2.0 + -1.0;
  double v22 = v12 * 2.0 + -1.0;
  double v23 = (v12 + v13) * 2.0 + -1.0;
  if (self->mMeshType == 1) {
    unint64_t v24 = 48;
  }
  else {
    unint64_t v24 = 20;
  }
  double v25 = (char *)&v177 - (4 * v24);
  int mMeshType = self->mMeshType;
  if (mMeshType == 3)
  {
    double v38 = v12 * 2.0 + -1.0;
    double v19 = v23;
    if ((v8 & 1) == 0)
    {
      double y = self->mInnerRect.origin.y;
      double v38 = y * 2.0 + -1.0;
      double v19 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
    }
    *(_DWORD *)double v25 = -1082130432;
    double v177 = v19;
    double v178 = v38;
    float v40 = v38;
    *(float *)&double v19 = v19;
    *((float *)v25 + 1) = v40;
    float v41 = v20;
    float v42 = v21;
    *((_DWORD *)v25 + 2) = -1082130432;
    *((_DWORD *)v25 + 3) = LODWORD(v19);
    *((float *)v25 + 4) = v41;
    *((float *)v25 + 5) = v40;
    *((float *)v25 + 6) = v41;
    *((_DWORD *)v25 + 7) = LODWORD(v19);
    *((float *)v25 + 8) = v41;
    *((_DWORD *)v25 + 9) = LODWORD(v19);
    *((float *)v25 + 10) = v42;
    *((float *)v25 + 11) = v40;
    *((float *)v25 + 12) = v42;
    *((float *)v25 + 13) = v40;
    *((float *)v25 + 14) = v42;
    *((_DWORD *)v25 + 15) = LODWORD(v19);
    *((_DWORD *)v25 + 16) = 1065353216;
    *((_DWORD *)v25 + 18) = 1065353216;
    uint64_t v37 = 76;
    double v179 = v21;
    double v180 = x * 2.0 + -1.0;
    *((float *)v25 + 17) = v40;
  }
  else
  {
    if (mMeshType == 2)
    {
      double v43 = x * 2.0 + -1.0;
      double v44 = v21;
      if ((v8 & 1) == 0)
      {
        double v45 = self->mInnerRect.origin.x;
        double v43 = v45 * 2.0 + -1.0;
        double v19 = v45 + self->mInnerRect.size.width;
        double v44 = v19 * 2.0 + -1.0;
      }
      double v179 = v44;
      double v180 = v43;
      float v46 = v43;
      *(float *)double v25 = v46;
      float v47 = v22;
      *((_DWORD *)v25 + 1) = -1082130432;
      float v48 = v44;
      float v49 = v23;
      *((float *)v25 + 2) = v46;
      *((float *)v25 + 3) = v47;
      *((float *)v25 + 4) = v48;
      *((_DWORD *)v25 + 5) = -1082130432;
      *((float *)v25 + 6) = v48;
      *((float *)v25 + 7) = v47;
      *((float *)v25 + 8) = v48;
      *((float *)v25 + 9) = v47;
      *((float *)v25 + 10) = v46;
      *((float *)v25 + 11) = v49;
      *((float *)v25 + 12) = v46;
      *((float *)v25 + 13) = v49;
      *((float *)v25 + 14) = v46;
      *((_DWORD *)v25 + 15) = 1065353216;
      LODWORD(v19) = 1.0;
      *((float *)v25 + 16) = v48;
      *((float *)v25 + 17) = v49;
      uint64_t v37 = 76;
    }
    else
    {
      __asm { FMOV            V1.2S, #-1.0 }
      if (mMeshType == 1)
      {
        *(void *)double v25 = _D1;
        float v32 = v20;
        float v33 = v22;
        float v34 = v23;
        *((float *)v25 + 2) = v32;
        *((float *)v25 + 3) = v33;
        float v35 = v21;
        *((_DWORD *)v25 + 4) = -1082130432;
        *((float *)v25 + 5) = v33;
        *((float *)v25 + 6) = v32;
        *((float *)v25 + 7) = v34;
        *((_DWORD *)v25 + 8) = -1082130432;
        *((float *)v25 + 9) = v34;
        *(_OWORD *)(v25 + 40) = xmmword_165B50;
        *((float *)v25 + 14) = v32;
        *((float *)v25 + 15) = v34;
        *((float *)v25 + 16) = v32;
        *((_DWORD *)v25 + 17) = 1065353216;
        *((float *)v25 + 18) = v35;
        *((float *)v25 + 19) = v34;
        *((float *)v25 + 20) = v35;
        __asm { FMOV            V5.4S, #1.0 }
        *(_OWORD *)(v25 + 84) = _Q5;
        *((_DWORD *)v25 + 25) = 1065353216;
        *((float *)v25 + 26) = v35;
        *((float *)v25 + 27) = v34;
        *((_DWORD *)v25 + 28) = 1065353216;
        *((float *)v25 + 29) = v34;
        *((float *)v25 + 30) = v35;
        *((float *)v25 + 31) = v33;
        *((_DWORD *)v25 + 32) = 1065353216;
        *((float *)v25 + 33) = v33;
        *(_OWORD *)(v25 + 136) = xmmword_165B60;
        *((float *)v25 + 38) = v35;
        *((float *)v25 + 39) = v33;
        *((float *)v25 + 40) = v35;
        *((_DWORD *)v25 + 41) = -1082130432;
        *(void *)&double v19 = COERCE_UNSIGNED_INT(-1.0) | 0xBF80000000000000;
        *((float *)v25 + 42) = v32;
        *((float *)v25 + 43) = v33;
        uint64_t v37 = 188;
        double v179 = v21;
        double v180 = x * 2.0 + -1.0;
        *((float *)v25 + 44) = v32;
        double v177 = v23;
        double v178 = v12 * 2.0 + -1.0;
        *(void *)(v25 + 180) = _D1;
        goto LABEL_26;
      }
      *(void *)double v25 = _D1;
      float v48 = v20;
      *(float *)&double v19 = v22;
      float v50 = v21;
      *((float *)v25 + 2) = v48;
      *((_DWORD *)v25 + 3) = LODWORD(v19);
      float v51 = v23;
      *((void *)v25 + 2) = 0xBF8000003F800000;
      *((float *)v25 + 6) = v50;
      *((_DWORD *)v25 + 7) = LODWORD(v19);
      __asm { FMOV            V5.2S, #1.0 }
      *((void *)v25 + 4) = _D5;
      *((float *)v25 + 10) = v50;
      *((float *)v25 + 11) = v51;
      *((void *)v25 + 6) = 0x3F800000BF800000;
      *((float *)v25 + 14) = v48;
      *((float *)v25 + 15) = v51;
      uint64_t v37 = 76;
      double v179 = v21;
      double v180 = x * 2.0 + -1.0;
      *((void *)v25 + 8) = _D1;
    }
    double v177 = v23;
    double v178 = v12 * 2.0 + -1.0;
    *((float *)v25 + 18) = v48;
  }
LABEL_26:
  double v53 = width;
  double v54 = height;
  *(_DWORD *)&v25[v37] = LODWORD(v19);
  char v192 = 0;
  if (a3)
  {
    if (self->mPreservesImageAspectRatio)
    {
      *(float *)&double v19 = width / height;
    }
    else
    {
      [a3 aspectRatio];
      *(float *)&double v19 = v19;
    }
    objc_msgSend(a3, "setOnContext:onTextureUnit:withReferenceAspectRatio:state:", a4, 0, &v192, v19, *(void *)&v177);
    [a4 setTextureCoordinatesPointer:(char *)&v177 - (4 * v24) onTextureUnit:0];
  }
  id v187 = a3;
  int v55 = 0;
  float v56 = v190.f64[0];
  float v57 = v191.f64[0];
  float v184 = v56;
  float v185 = v57;
  float v181 = cosval * width;
  float v182 = sinval * width;
  float v183 = cosval * height;
  float v58 = sinval * height;
  double v59 = v20 * v53;
  double v60 = v21 * v53;
  __asm { FMOV            V1.2D, #1.0 }
  uint64_t v62 = 1;
  double v63 = v22 * v54;
  double v64 = v23 * v54;
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v190 = _Q0;
  float64x2_t v191 = _Q1;
  do
  {
    id v66 = objc_msgSend(a4, "imageSetOnTextureUnit:", v62, *(void *)&v177);
    if (v66)
    {
      unsigned __int8 v67 = [v66 preservesAspectRatio];
      double v68 = (char *)&v177 - (4 * v24);
      if ((v67 & 1) == 0)
      {
        uint64_t v69 = 0;
        float64x2_t v71 = v190;
        float64x2_t v70 = v191;
        do
        {
          double v68 = v194;
          *(float32x4_t *)&v194[v69] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v25[v69]), v70), v71)), vmulq_f64(vaddq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v25[v69]), v70), v71));
          v69 += 16;
        }
        while (4 * v24 != v69);
      }
      v55 |= 1 << v62;
      [a4 setTextureCoordinatesPointer:v68 onTextureUnit:v62];
    }
    ++v62;
  }
  while (v62 != 4);
  if (self->mNeedsInSpriteCoordinates)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (i) {
        uint64_t v73 = 128;
      }
      else {
        uint64_t v73 = 120;
      }
      double v74 = *(double *)((char *)&self->super.isa + v73);
      if (i) {
        uint64_t v75 = 144;
      }
      else {
        uint64_t v75 = 136;
      }
      float v76 = *(double *)((char *)&self->super.isa + v75) + (*(float *)&v25[4 * i] + 1.0) * 0.5 * v74;
      *(float *)&v193[i] = v76;
    }
    objc_msgSend(a4, "setInSpriteCoordinatesPointer:", v193, 1.0, 0.5);
  }
  float v77 = (float *)((char *)&v177 - ((4 * (_WORD)v24 + 15) & 0x1F0));
  int v78 = self->mMeshType;
  if (v78 == 3)
  {
    if (v8) {
      double v153 = v63;
    }
    else {
      double v153 = v178 * v54;
    }
    if (v8) {
      double v154 = v23 * v54;
    }
    else {
      double v154 = v177 * v54;
    }
    double v155 = (float)(v184 - v181);
    float v156 = v155 - v153 * sinval;
    double v157 = (float)(v185 - v182);
    float v121 = v157 + v153 * cosval;
    float v122 = v155 - v154 * sinval;
    float v123 = v157 + v154 * cosval;
    double v158 = v184 + v59 * cosval;
    float v124 = v158 - v153 * sinval;
    double v159 = v185 + v59 * sinval;
    float v125 = v159 + v153 * cosval;
    float v107 = v158 - v154 * sinval;
    float v111 = v159 + v154 * cosval;
    double v160 = v184 + v60 * cosval;
    float v151 = v160 - v153 * sinval;
    double v161 = v185 + v60 * sinval;
    float v152 = v161 + v153 * cosval;
    float v117 = v160 - v154 * sinval;
    float v118 = v161 + v154 * cosval;
    double v162 = (float)(v181 + v184);
    float v128 = v162 - v153 * sinval;
    double v163 = (float)(v182 + v185);
    float v129 = v163 + v153 * cosval;
    float v79 = v162 - v154 * sinval;
    uint64_t v130 = 19;
    uint64_t v131 = 18;
    uint64_t v132 = 17;
    uint64_t v133 = 16;
    uint64_t v134 = 15;
    uint64_t v135 = 14;
    uint64_t v136 = 13;
    double v164 = v163 + v154 * cosval;
  }
  else
  {
    if (v78 != 2)
    {
      if (v78 == 1)
      {
        float v79 = v58 + (float)(v184 - v181);
        float v80 = v183;
        float v81 = (float)(v185 - v182) - v183;
        double v82 = v184 + v59 * cosval;
        double v83 = v82 - v63 * sinval;
        double v84 = v185 + v59 * sinval;
        double v85 = v84 + v63 * cosval;
        double v86 = (float)(v184 - v181);
        float v87 = v86 - v63 * sinval;
        double v88 = (float)(v185 - v182);
        float v89 = v88 + v63 * cosval;
        double v90 = v82 - v64 * sinval;
        double v91 = v84 + v64 * cosval;
        *(float *)&double v86 = v86 - v64 * sinval;
        *(float *)&double v88 = v88 + v64 * cosval;
        float v92 = (float)(v184 - v181) - v58;
        float v93 = v183 + (float)(v185 - v182);
        double v94 = v184 + v60 * cosval;
        double v95 = v94 - v64 * sinval;
        double v96 = v185 + v60 * sinval;
        double v97 = v96 + v64 * cosval;
        float v98 = v182 + v185;
        double v99 = (float)(v181 + v184);
        double v100 = v99 - v64 * sinval;
        double v101 = (float)(v182 + v185) + v64 * cosval;
        double v102 = v99 - v63 * sinval;
        double v103 = v94 - v63 * sinval;
        double v104 = (float)(v182 + v185) + v63 * cosval;
        double v105 = v96 + v63 * cosval;
        float v106 = (float)(v181 + v184) - v58;
        float v107 = v58 + (float)(v181 + v184);
        double v108 = v58;
        v77[4] = v87;
        v77[5] = v89;
        double v109 = v82 - v108;
        float v110 = v80 + v98;
        float v111 = v98 - v80;
        v77[8] = *(float *)&v86;
        v77[9] = *(float *)&v88;
        double v112 = v84 + v80;
        double v113 = v94 - v108;
        double v114 = v94 + v108;
        double v115 = v82 + v108;
        double v116 = v84 - v80;
        v77[11] = v93;
        v77[12] = v92;
        v77[10] = v92;
        *(float *)&double v84 = v90;
        *(float *)&double v90 = v91;
        v77[13] = v93;
        v77[14] = *(float *)&v84;
        v77[6] = *(float *)&v84;
        v77[7] = *(float *)&v90;
        v77[15] = *(float *)&v90;
        *(float *)&double v84 = v109;
        *(float *)&double v90 = v112;
        v77[16] = *(float *)&v84;
        v77[17] = *(float *)&v90;
        *(float *)&double v84 = v113;
        *(float *)&double v82 = v96 + v80;
        v77[20] = *(float *)&v84;
        v77[21] = *(float *)&v82;
        v77[22] = v106;
        v77[24] = v106;
        float v117 = v83;
        float v118 = v85;
        float v119 = v95;
        float v120 = v97;
        *(float *)&double v95 = v100;
        float v121 = v101;
        float v122 = v103;
        float v123 = v105;
        float v124 = v102;
        float v125 = v104;
        float v126 = v114;
        float v127 = v96 - v80;
        float v128 = v115;
        float v129 = v116;
        uint64_t v130 = 47;
        uint64_t v131 = 46;
        uint64_t v132 = 45;
        *float v77 = v79;
        v77[1] = v81;
        uint64_t v133 = 44;
        uint64_t v134 = 43;
        uint64_t v135 = 42;
        uint64_t v136 = 41;
        v77[2] = v117;
        v77[3] = v118;
        uint64_t v137 = 40;
        uint64_t v138 = 39;
        uint64_t v139 = 38;
        uint64_t v140 = 37;
        v77[18] = v119;
        v77[19] = v120;
        v77[23] = v110;
        uint64_t v141 = 36;
        uint64_t v142 = 35;
        uint64_t v143 = 34;
        uint64_t v144 = 33;
        v77[25] = v110;
        v77[26] = v119;
        uint64_t v145 = 32;
        uint64_t v146 = 31;
        uint64_t v147 = 30;
        uint64_t v148 = 29;
        v77[27] = v120;
        v77[28] = *(float *)&v95;
        float v149 = v107;
        float v150 = v111;
        float v151 = v122;
        float v152 = v123;
      }
      else
      {
        float v128 = v58 + (float)(v184 - v181);
        float v121 = (float)(v185 - v182) - v183;
        double v171 = v184 + v59 * cosval;
        float v122 = v171 - v63 * sinval;
        double v172 = v185 + v59 * sinval;
        float v123 = v172 + v63 * cosval;
        float v124 = v58 + (float)(v181 + v184);
        float v125 = (float)(v182 + v185) - v183;
        double v173 = v184 + v60 * cosval;
        float v107 = v173 - v63 * sinval;
        double v174 = v185 + v60 * sinval;
        float v111 = v174 + v63 * cosval;
        float v149 = (float)(v181 + v184) - v58;
        float v150 = v183 + (float)(v182 + v185);
        float v151 = v173 - v64 * sinval;
        float v152 = v174 + v64 * cosval;
        float v126 = (float)(v184 - v181) - v58;
        float v127 = v183 + (float)(v185 - v182);
        float v117 = v171 - v64 * sinval;
        uint64_t v130 = 19;
        uint64_t v131 = 18;
        uint64_t v132 = 17;
        uint64_t v133 = 16;
        uint64_t v134 = 15;
        uint64_t v135 = 14;
        uint64_t v136 = 13;
        uint64_t v137 = 12;
        uint64_t v138 = 11;
        uint64_t v139 = 10;
        uint64_t v140 = 9;
        uint64_t v141 = 8;
        uint64_t v142 = 7;
        uint64_t v143 = 6;
        uint64_t v144 = 5;
        uint64_t v145 = 4;
        uint64_t v146 = 3;
        uint64_t v147 = 2;
        float v118 = v172 + v64 * cosval;
        *float v77 = v128;
        uint64_t v148 = 1;
        float v129 = v121;
        float v79 = v122;
        float v81 = v123;
      }
      goto LABEL_64;
    }
    double v165 = v180 * v53;
    double v166 = v179 * v53;
    if (v8)
    {
      double v165 = v59;
      double v166 = v60;
    }
    double v167 = v184 + v165 * cosval;
    float v156 = v167 + v58;
    double v168 = v185 + v165 * sinval;
    float v121 = v168 - v183;
    float v122 = v167 - v63 * sinval;
    float v123 = v168 + v63 * cosval;
    double v169 = v184 + v166 * cosval;
    float v124 = v169 + v58;
    double v170 = v185 + v166 * sinval;
    float v125 = v170 - v183;
    float v107 = v169 - v63 * sinval;
    float v111 = v170 + v63 * cosval;
    float v151 = v167 - v64 * sinval;
    float v152 = v168 + v64 * cosval;
    float v117 = v167 - v58;
    float v118 = v168 + v183;
    float v128 = v169 - v64 * sinval;
    float v129 = v170 + v64 * cosval;
    float v79 = v169 - v58;
    uint64_t v130 = 19;
    uint64_t v131 = 18;
    uint64_t v132 = 17;
    uint64_t v133 = 16;
    uint64_t v134 = 15;
    uint64_t v135 = 14;
    uint64_t v136 = 13;
    double v164 = v170 + v183;
  }
  uint64_t v137 = 12;
  uint64_t v138 = 11;
  uint64_t v139 = 10;
  uint64_t v140 = 9;
  uint64_t v141 = 8;
  uint64_t v142 = 7;
  uint64_t v143 = 6;
  uint64_t v144 = 5;
  uint64_t v145 = 4;
  uint64_t v146 = 3;
  uint64_t v147 = 2;
  uint64_t v148 = 1;
  float v81 = v164;
  *float v77 = v156;
  float v149 = v107;
  float v150 = v111;
  float v126 = v151;
  float v127 = v152;
LABEL_64:
  v77[v148] = v121;
  v77[v147] = v122;
  v77[v146] = v123;
  v77[v145] = v124;
  v77[v144] = v125;
  v77[v143] = v107;
  v77[v142] = v111;
  v77[v141] = v149;
  v77[v140] = v150;
  v77[v139] = v151;
  v77[v138] = v152;
  v77[v137] = v126;
  v77[v136] = v127;
  v77[v135] = v117;
  v77[v134] = v118;
  v77[v133] = v128;
  v77[v132] = v129;
  v77[v131] = v79;
  v77[v130] = v81;
  objc_msgSend(a4, "setVertex2DPointer:");
  [a4 drawTriangleStripFromOffset:0 count:v24 >> 1];
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  uint64_t v175 = -3;
  do
  {
    if ((v55 & (1 << (v175 + 4))) != 0) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:1];
    }
  }
  while (!__CFADD__(v175++, 1));
  v176 = v187;
  if (v187)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v176 unsetOnContext:a4 onTextureUnit:0 state:&v192];
  }
}

- (void)renderImageInner:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, a5.x, a5.y, a6.width, a6.height);
  [(MRCroppingSprite *)self renderImageInner:a3 inContext:a4];
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, a5.x, a5.y, a6.width, a6.height);
  [(MRCroppingSprite *)self renderImageMiddle:a3 inContext:a4];
}

- (void)renderImageOuter:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:](self, "fakeRenderInContext:atPosition:andSize:zRotation:", a4, a5.x, a5.y, a6.width, a6.height);
  [(MRCroppingSprite *)self renderImageOuter:a3 inContext:a4];
}

- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (!self->mHitIsActive) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  memset(v19, 0, sizeof(v19));
  if (self->_usesOwnMatrixForHitTest)
  {
    MRMatrix_Invert(self->mModelViewProjectionMatrix, (float *)v19);
    if (self->_usesOwnMatrixForHitTest) {
      a4 = (float *)v19;
    }
  }
  double v10 = MRMatrix_UnprojectPoint(a4, x, y) - self->mPosition.x;
  double v12 = v11 - self->mPosition.y;
  float mRotation = self->mRotation;
  __float2 v14 = __sincosf_stret(mRotation);
  double v15 = ((v12 * v14.__sinval + v10 * v14.__cosval) / self->mHalfSize.width + 1.0) * 0.5;
  double v16 = ((v12 * v14.__cosval - v10 * v14.__sinval) / self->mHalfSize.height + 1.0) * 0.5;
  if (a5)
  {
    a5->double x = v15;
    a5->double y = v16;
  }
  BOOL v17 = v15 >= 0.0;
  if (v15 > 1.0) {
    BOOL v17 = 0;
  }
  if (v16 < 0.0) {
    BOOL v17 = 0;
  }
  return v16 <= 1.0 && v17;
}

- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:
{
  double width = self->mHalfSize.width;
  float mRotation = self->mRotation;
  __float2 v9 = __sincosf_stret(mRotation);
  float v10 = width * v9.__cosval;
  double height = self->mHalfSize.height;
  float v12 = height * v9.__sinval;
  float v13 = width * v9.__sinval;
  float v14 = height * v9.__cosval;
  if (self->_usesOwnMatrixForHitTest) {
    mModelViewProjectionMatridouble x = self->mModelViewProjectionMatrix;
  }
  else {
    mModelViewProjectionMatridouble x = a4;
  }
  double v16 = v10;
  double v17 = v12;
  double v18 = v13;
  double v19 = v14;
  (*a3)[0].double x = MRMatrix_ProjectPoint(mModelViewProjectionMatrix, self->mPosition.x - v10 + v12, self->mPosition.y - v13 - v14);
  (*a3)[0].double y = v20;
  if (self->_usesOwnMatrixForHitTest) {
    double v21 = self->mModelViewProjectionMatrix;
  }
  else {
    double v21 = a4;
  }
  (*a3)[1].double x = MRMatrix_ProjectPoint(v21, self->mPosition.x + v16 + v17, self->mPosition.y + v18 - v19);
  (*a3)[1].double y = v22;
  if (self->_usesOwnMatrixForHitTest) {
    double v23 = self->mModelViewProjectionMatrix;
  }
  else {
    double v23 = a4;
  }
  (*a3)[2].double x = MRMatrix_ProjectPoint(v23, self->mPosition.x + v16 - v17, self->mPosition.y + v18 + v19);
  (*a3)[2].double y = v24;
  if (self->_usesOwnMatrixForHitTest) {
    double v25 = self->mModelViewProjectionMatrix;
  }
  else {
    double v25 = a4;
  }
  (*a3)[3].double x = MRMatrix_ProjectPoint(v25, self->mPosition.x - v16 - v17, self->mPosition.y - v18 + v19);
  (*a3)[3].double y = v26;
  return 1;
}

+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
}

+ (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  if (a3 || [a4 shaderIsSet])
  {
    float v14 = x;
    [a4 localAspectRatio];
    float v16 = y / v15;
    float v17 = width * 0.5;
    [a4 localAspectRatio];
    float v19 = height * 0.5 / v18;
    __float2 v20 = __sincosf_stret(a7);
    float v21 = v20.__cosval * v17;
    float v22 = v20.__sinval * v17;
    float v23 = v20.__cosval * v19;
    float v24 = v20.__sinval * v19;
    v27[0] = xmmword_165B90;
    v27[1] = unk_165BA0;
    char v25 = 0;
    if (a3)
    {
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v25 state:0.0];
      [a4 setTextureCoordinatesPointer:v27 onTextureUnit:0];
    }
    v26[0] = (float)(v14 - v21) + v24;
    v26[1] = (float)(v16 - v23) - v22;
    v26[2] = (float)(v14 - v21) - v24;
    v26[3] = (float)(v23 + v16) - v22;
    v26[4] = (float)(v21 + v14) + v24;
    v26[5] = v22 + (float)(v16 - v23);
    v26[6] = (float)(v21 + v14) - v24;
    v26[7] = v22 + (float)(v23 + v16);
    [a4 setVertex2DPointer:v26];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    if (a3)
    {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v25];
    }
  }
}

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
}

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 zRotation:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  if (a3 || [a4 shaderIsSet])
  {
    float v14 = x;
    [a4 localAspectRatio];
    float v16 = y / v15;
    float v17 = width * 0.5;
    [a4 localAspectRatio];
    float v19 = height * 0.5 / v18;
    __float2 v21 = __sincosf_stret(a7);
    float v22 = v21.__cosval * v17;
    float v23 = v21.__sinval * v17;
    float v24 = v21.__cosval * v19;
    float v25 = v21.__sinval * v19;
    v28[0] = xmmword_165B70;
    v28[1] = unk_165B80;
    char v26 = 0;
    if (a3)
    {
      *(float *)&double v20 = v17 / v19;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v26 state:v20];
      [a4 setTextureCoordinatesPointer:v28 onTextureUnit:0];
    }
    v27[0] = (float)(v14 - v22) + v25;
    v27[1] = (float)(v16 - v24) - v23;
    _OWORD v27[2] = (float)(v14 - v22) - v25;
    v27[3] = (float)(v24 + v16) - v23;
    v27[4] = (float)(v22 + v14) + v25;
    v27[5] = v23 + (float)(v16 - v24);
    v27[6] = (float)(v22 + v14) - v25;
    v27[7] = v23 + (float)(v24 + v16);
    [a4 setVertex2DPointer:v27];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    if (a3)
    {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v26];
    }
  }
}

+ (void)renderImage:(id)a3 withMask:(id)a4 inContext:(id)a5 atPosition:(CGPoint)a6 andSize:(CGSize)a7 zRotation:(float)a8
{
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  [a5 localAspectRatio];
  float v17 = width * 0.5;
  double v18 = y / v16;
  [a5 localAspectRatio];
  float v20 = height * 0.5 / v19;
  __float2 v21 = __sincosf_stret(a8);
  [a5 setShader:@"Mask"];
  HIDWORD(v22) = -1082130432;
  v32[0] = xmmword_165B70;
  v32[1] = unk_165B80;
  __int16 v29 = 0;
  if (a3)
  {
    *(float *)&double v22 = v17 / v20;
    [a3 setOnContext:a5 onTextureUnit:0 withReferenceAspectRatio:(char *)&v29 + 1 state:v22];
    [a5 setTextureCoordinatesPointer:v32 onTextureUnit:0];
  }
  float v23 = x;
  float v24 = v18;
  float v25 = v21.__cosval * v17;
  float v26 = v21.__sinval * v17;
  float v27 = v21.__cosval * v20;
  float v28 = v21.__sinval * v20;
  v31[0] = xmmword_165B90;
  v31[1] = unk_165BA0;
  if (a4)
  {
    [a4 setOnContext:a5 onTextureUnit:1 withReferenceAspectRatio:&v29 state:0.0];
    [a5 setTextureCoordinatesPointer:v31 onTextureUnit:1];
  }
  v30[0] = (float)(v23 - v25) + v28;
  v30[1] = (float)(v24 - v27) - v26;
  v30[2] = (float)(v23 - v25) - v28;
  v30[3] = (float)(v27 + v24) - v26;
  v30[4] = (float)(v25 + v23) + v28;
  v30[5] = v26 + (float)(v24 - v27);
  v30[6] = (float)(v25 + v23) - v28;
  v30[7] = v26 + (float)(v27 + v24);
  [a5 setVertex2DPointer:v30];
  [a5 drawTriangleStripFromOffset:0 count:4];
  [a5 unsetVertexPointer];
  if (a4)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:1];
    [a4 unsetOnContext:a5 onTextureUnit:1 state:&v29];
  }
  if (a3)
  {
    [a5 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a5 onTextureUnit:0 state:(char *)&v29 + 1];
  }
  [a5 unsetShader];
}

+ (void)renderImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6 withReferenceAspectRatio:(float)a7 andJustifications:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.y;
  double v14 = a5.x;
  [a4 localAspectRatio];
  float v18 = width * 0.5;
  double v19 = v13 / v17;
  [a4 localAspectRatio];
  float v21 = height * 0.5 / v20;
  float v22 = v18 / v21;
  if (a7 > 0.0) {
    float v22 = a7;
  }
  double v23 = 0.0;
  if (y <= 0.0 || x <= 0.0) {
    double v23 = x;
  }
  if (v23 == 0.0)
  {
    float v25 = 1.0;
    float v26 = -1.0;
    switch((int)y)
    {
      case 0:
        float v27 = 1.0;
        goto LABEL_22;
      case 1:
        float v29 = 1.0 - (v21 + v21) * v22 / v18;
        goto LABEL_18;
      case 2:
        float v27 = (float)(v22 * v21) / v18;
        float v29 = (float)-(float)(v21 * v22) / v18;
        break;
      case 3:
        float v27 = (v21 + v21) * v22 / v18 + -1.0;
        goto LABEL_21;
      default:
        float v27 = 0.0;
        float v29 = 0.0;
        break;
    }
  }
  else
  {
    unsigned int v28 = (int)v23;
    float v27 = 1.0;
    if (v28 < 2)
    {
      float v25 = (v18 + v18) / (float)(v22 * v21) + -1.0;
LABEL_21:
      float v26 = -1.0;
LABEL_22:
      float v29 = -1.0;
    }
    else
    {
      float v29 = -1.0;
      if (v28 == 2)
      {
        float v26 = (float)-v18 / (float)(v22 * v21);
        float v25 = v18 / (float)(v22 * v21);
      }
      else
      {
        float v26 = 0.0;
        if (v28 == 3)
        {
          float v26 = 1.0 - (v18 + v18) / (float)(v22 * v21);
LABEL_18:
          float v27 = 1.0;
          float v25 = 1.0;
        }
        else
        {
          float v25 = 0.0;
        }
      }
    }
  }
  float v30 = v14;
  float v31 = v19;
  *(float *)float v34 = v26;
  *(float *)&v34[1] = v29;
  *(float *)&v34[2] = v26;
  *(float *)&v34[3] = v27;
  *(float *)&v34[4] = v25;
  *(float *)&v34[5] = v29;
  *(float *)&v34[6] = v25;
  *(float *)&v34[7] = v27;
  char v32 = 0;
  if (a3)
  {
    objc_msgSend(a3, "setOnContext:onTextureUnit:withReferenceAspectRatio:state:", a4, 0, &v32);
    [a4 setTextureCoordinatesPointer:v34 onTextureUnit:0];
  }
  v33[0] = v30 - v18;
  v33[1] = v31 - v21;
  v33[2] = v30 - v18;
  v33[3] = v31 + v21;
  v33[4] = v30 + v18;
  v33[5] = v31 - v21;
  v33[6] = v30 + v18;
  v33[7] = v31 + v21;
  [a4 setVertex2DPointer:v33];
  [a4 drawTriangleStripFromOffset:0 count:4];
  [a4 unsetVertexPointer];
  if (a3)
  {
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v32];
  }
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

- (double)rotation
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
  self->mNeedsInSpriteCoordinates = a3;
}

- (BOOL)usesOwnMatrixForHitTest
{
  return self->_usesOwnMatrixForHitTest;
}

- (void)setUsesOwnMatrixForHitTest:(BOOL)a3
{
  self->_usesOwnMatrixForHitTest = a3;
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
  self->mSpriteCoordinatesFactor = a3;
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
  self->mSpriteCoordinatesOffset = a3;
}

- (unsigned)meshType
{
  return self->mMeshType;
}

- (void)setMeshType:(unsigned __int8)a3
{
  self->int mMeshType = a3;
}

@end