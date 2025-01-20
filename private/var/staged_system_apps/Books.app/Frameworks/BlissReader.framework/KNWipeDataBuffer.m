@interface KNWipeDataBuffer
+ (id)newWipeDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 metalContext:(id)a5 colorAttachment:(id)a6;
- ($3BA783FF50B239963188BE194EBFFEBA)fragmentInput;
- ($94F468A8D4C62B317260615823C2B210)p_texCoordFromX:(double)a3 y:(double)a4;
- (CATransform3D)MVPMatrix;
- (CGRect)textureRect;
- (CGRect)vertexRect;
- (KNWipeDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 minimumDataSize:(int64_t)a5;
- (NSArray)solidBufferAttributes;
- (NSArray)wipeBufferAttributes;
- (TSDMTLDataBuffer)solidMTLDataBuffer;
- (TSDMTLDataBuffer)wipeMTLDataBuffer;
- (TSDMetalShader)solidMetalShader;
- (TSDMetalShader)wipeMetalShader;
- (__n128)setVertexInput:(__n128)a3;
- (__n128)vertexInput;
- (double)blurFraction;
- (unint64_t)direction;
- (unint64_t)solidPositionAttributeIndex;
- (unint64_t)solidTexCoordAttributeIndex;
- (unint64_t)wipeOpacityAttributeIndex;
- (unint64_t)wipePositionAttributeIndex;
- (unint64_t)wipeTexCoordAttributeIndex;
- (void)drawWipeWithPercent:(double)a3 opacity:(double)a4 renderEncoder:(id)a5;
- (void)setBlurFraction:(double)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setFragmentInput:(id)a3;
- (void)setMVPMatrix:(CATransform3D *)a3;
- (void)setSolidBufferAttributes:(id)a3;
- (void)setSolidMTLDataBuffer:(id)a3;
- (void)setSolidMetalShader:(id)a3;
- (void)setSolidPositionAttributeIndex:(unint64_t)a3;
- (void)setSolidTexCoordAttributeIndex:(unint64_t)a3;
- (void)setTextureRect:(CGRect)a3;
- (void)setVertexRect:(CGRect)a3;
- (void)setWipeBufferAttributes:(id)a3;
- (void)setWipeMTLDataBuffer:(id)a3;
- (void)setWipeMetalShader:(id)a3;
- (void)setWipeOpacityAttributeIndex:(unint64_t)a3;
- (void)setWipePositionAttributeIndex:(unint64_t)a3;
- (void)setWipeTexCoordAttributeIndex:(unint64_t)a3;
- (void)setupMTLWipeDataBufferWithContext:(id)a3 colorAttachment:(id)a4;
- (void)updateWipeWithPercent:(double)a3 solidVertexCount:(unint64_t *)a4 wipeVertexCount:(unint64_t *)a5 drawIntoMetalBuffer:(BOOL)a6;
@end

@implementation KNWipeDataBuffer

- (KNWipeDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 minimumDataSize:(int64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)KNWipeDataBuffer;
  v14 = [(KNWipeDataBuffer *)&v28 init];
  v15 = v14;
  if (v14)
  {
    v14->_vertexRect.origin.CGFloat x = v13;
    v14->_vertexRect.origin.CGFloat y = v12;
    v14->_vertexRect.size.CGFloat width = v11;
    v14->_vertexRect.size.CGFloat height = v10;
    v14->_textureRect.origin.CGFloat x = x;
    v14->_textureRect.origin.CGFloat y = y;
    if (a5 <= 2) {
      int64_t v16 = 2;
    }
    else {
      int64_t v16 = a5;
    }
    v14->_textureRect.size.CGFloat width = width;
    v14->_textureRect.size.CGFloat height = height;
    if (a5 <= 3) {
      int64_t v17 = 3;
    }
    else {
      int64_t v17 = a5;
    }
    id v18 = [objc_alloc((Class)TSDGPUDataBufferAttribute) initWithName:@"Position" bufferUsage:35040 dataType:5 normalized:0 componentCount:2];
    id v19 = [objc_alloc((Class)TSDGPUDataBufferAttribute) initWithName:@"TexCoord" bufferUsage:35040 dataType:v17 normalized:1 componentCount:2];
    id v20 = [objc_alloc((Class)TSDGPUDataBufferAttribute) initWithName:@"Position" bufferUsage:35040 dataType:5 normalized:0 componentCount:2];
    id v21 = [objc_alloc((Class)TSDGPUDataBufferAttribute) initWithName:@"TexCoord" bufferUsage:35040 dataType:v17 normalized:1 componentCount:2];
    id v22 = [objc_alloc((Class)TSDGPUDataBufferAttribute) initWithName:@"Opacity" bufferUsage:35040 dataType:v16 normalized:1 componentCount:1];
    v30[0] = v20;
    v30[1] = v21;
    v30[2] = v22;
    uint64_t v23 = +[NSArray arrayWithObjects:v30 count:3];
    wipeBufferAttributes = v15->_wipeBufferAttributes;
    v15->_wipeBufferAttributes = (NSArray *)v23;

    v15->_wipePositionAttributeIndeCGFloat x = [(NSArray *)v15->_wipeBufferAttributes indexOfObject:v20];
    v15->_wipeTexCoordAttributeIndeCGFloat x = [(NSArray *)v15->_wipeBufferAttributes indexOfObject:v21];
    v15->_wipeOpacityAttributeIndeCGFloat x = [(NSArray *)v15->_wipeBufferAttributes indexOfObject:v22];
    v29[0] = v18;
    v29[1] = v19;
    uint64_t v25 = +[NSArray arrayWithObjects:v29 count:2];
    solidBufferAttributes = v15->_solidBufferAttributes;
    v15->_solidBufferAttributes = (NSArray *)v25;

    v15->_solidPositionAttributeIndeCGFloat x = [(NSArray *)v15->_solidBufferAttributes indexOfObject:v18];
    v15->_solidTexCoordAttributeIndeCGFloat x = [(NSArray *)v15->_solidBufferAttributes indexOfObject:v19];
  }
  return v15;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->mMVPMatrix.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->mMVPMatrix.m23 = v5;
  *(_OWORD *)&self->mMVPMatrix.m11 = v3;
  *(_OWORD *)&self->mMVPMatrix.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->mMVPMatrix.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->mMVPMatrix.m43 = v8;
  *(_OWORD *)&self->mMVPMatrix.m31 = v6;
  *(_OWORD *)&self->mMVPMatrix.m33 = v7;
  float32x4_t v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m21), *(float64x2_t *)&a3->m23);
  float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m31), *(float64x2_t *)&a3->m33);
  float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m41), *(float64x2_t *)&a3->m43);
  *(float32x4_t *)self->_anon_150 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m11), *(float64x2_t *)&a3->m13);
  *(float32x4_t *)&self->_anon_150[16] = v9;
  *(float32x4_t *)&self->_anon_150[32] = v10;
  *(float32x4_t *)&self->_anon_150[48] = v11;
}

+ (id)newWipeDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 metalContext:(id)a5 colorAttachment:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  id v16 = a5;
  id v17 = a6;
  id v18 = [objc_alloc((Class)a1) initWithVertexRect:5 textureRect:v14 minimumDataSize:v13 v12 v11 x:x y:y width:width height:height];
  id v19 = v18;
  if (v18)
  {
    [v18 setupMTLWipeDataBufferWithContext:v16 colorAttachment:v17];
  }
  else
  {
    id v20 = +[TSUAssertionHandler currentHandler];
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:]");
    id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"];
    [v20 handleFailureInFunction:v21 file:v22 lineNumber:103 description:@"invalid nil value for '%s'", "wipeBuffer"];
  }
  return v19;
}

- (void)setupMTLWipeDataBufferWithContext:(id)a3 colorAttachment:(id)a4
{
  id v6 = a4;
  id v17 = [a3 device];
  long long v7 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:self->_wipeBufferAttributes vertexCount:6 indexElementCount:0 device:v17];
  wipeMTLDataBuffer = self->_wipeMTLDataBuffer;
  self->_wipeMTLDataBuffer = v7;

  [(TSDMTLDataBuffer *)self->_wipeMTLDataBuffer setMetalDrawMode:4];
  float32x4_t v9 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:self->_solidBufferAttributes vertexCount:6 indexElementCount:0 device:v17];
  solidMTLDataBuffer = self->_solidMTLDataBuffer;
  self->_solidMTLDataBuffer = v9;

  [(TSDMTLDataBuffer *)self->_solidMTLDataBuffer setMetalDrawMode:4];
  id v11 = objc_alloc((Class)TSDMetalShader);
  id v12 = MTLCreateSystemDefaultDevice();
  double v13 = (TSDMetalShader *)[v11 initDefaultTextureAndOpacityShaderWithDevice:v12 colorAttachment:v6];
  solidMetalShader = self->_solidMetalShader;
  self->_solidMetalShader = v13;

  v15 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"wipeDataBufferVertexShader" fragmentShader:@"wipeDataBufferFragmentShader" device:v17 library:@"KeynoteMetalLibrary" colorAttachment:v6];
  wipeMetalShader = self->_wipeMetalShader;
  self->_wipeMetalShader = v15;
}

- ($94F468A8D4C62B317260615823C2B210)p_texCoordFromX:(double)a3 y:(double)a4
{
  TSDPointFromNormalizedRect();
  float v6 = v5;
  float v7 = 1.0 - v4;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)updateWipeWithPercent:(double)a3 solidVertexCount:(unint64_t *)a4 wipeVertexCount:(unint64_t *)a5 drawIntoMetalBuffer:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = CGPointZero.y;
  unint64_t v12 = [(KNWipeDataBuffer *)self direction] - 11;
  double v67 = y;
  if (v12 < 0xE && ((0x3C0Fu >> v12) & 1) != 0)
  {
    double v16 = dbl_345310[v12];
    double x = dbl_345380[v12];
  }
  else
  {
    double v13 = +[TSUAssertionHandler currentHandler];
    double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeDataBuffer updateWipeWithPercent:solidVertexCount:wipeVertexCount:drawIntoMetalBuffer:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:172 description:@"Unknown direction!"];

    double v16 = y;
    double x = CGPointZero.x;
  }
  BOOL v18 = v16 != 0.0 && x != 0.0;
  double width = self->_vertexRect.size.width;
  [(KNWipeDataBuffer *)self blurFraction];
  double v21 = width * v20;
  if (v18)
  {
    double v23 = self->_vertexRect.size.width;
    double height = self->_vertexRect.size.height;
    long double v24 = atan(height / v23);
    long double v25 = sin(v24);
    double v26 = v21 / (v25 + v25);
    long double v27 = atan(v23 / height);
    long double v28 = sin(v27);
    double v29 = v21 / (v28 + v28);
    double v30 = x;
  }
  else
  {
    double v26 = v21;
    double v30 = x;
    if (x == 0.0) {
      double v26 = self->_vertexRect.size.width;
    }
    double height = self->_vertexRect.size.height;
    if (v16 == 0.0) {
      double v29 = self->_vertexRect.size.height;
    }
    else {
      double v29 = v21;
    }
  }
  double v31 = self->_vertexRect.size.width;
  double v32 = -(v29 - (v29 + height) * a3);
  if (v30 == 0.0) {
    double v33 = v26;
  }
  else {
    double v33 = -(v26 - (v26 + v31) * a3);
  }
  if (v16 == 0.0) {
    double v34 = v29;
  }
  else {
    double v34 = v32;
  }
  double v65 = v30;
  double v66 = v16;
  if (v18)
  {
    if (v30 == -1.0) {
      double v35 = self->_vertexRect.size.width;
    }
    else {
      double v35 = CGPointZero.x;
    }
    double v64 = v35;
    double v36 = v16;
    double v37 = 2.0;
    if (v36 == -1.0)
    {
      double v63 = height;
      CGFloat v38 = v67;
    }
    else
    {
      CGFloat v38 = v67;
      double v63 = v67;
    }
  }
  else
  {
    BOOL v39 = v30 == -1.0;
    if (v16 == -1.0) {
      BOOL v39 = 1;
    }
    CGFloat v38 = v67;
    if (v39) {
      double v40 = height;
    }
    else {
      double v40 = v67;
    }
    if (v39) {
      double v41 = self->_vertexRect.size.width;
    }
    else {
      double v41 = CGPointZero.x;
    }
    double v63 = v40;
    double v64 = v41;
    double v37 = 1.0;
  }
  if (v18) {
    double v42 = v29 + v29;
  }
  else {
    double v42 = v29;
  }
  if (v18) {
    double v43 = v26 + v26;
  }
  else {
    double v43 = v26;
  }
  double v61 = v43;
  double v62 = v42;
  v112.origin.double x = CGPointZero.x;
  v112.origin.CGFloat y = v38;
  v112.size.double width = self->_vertexRect.size.width;
  v112.size.double height = height;
  double v44 = v33;
  double v68 = -(CGRectGetWidth(v112) - v37 * v33);
  v113.origin.double x = CGPointZero.x;
  v113.origin.CGFloat y = v38;
  v113.size.double width = v31;
  v113.size.double height = height;
  double v45 = CGRectGetHeight(v113);
  double v46 = 0.0;
  double v60 = 0.0;
  if (v18)
  {
    double v46 = 0.0;
    if (v68 > 0.0)
    {
      v114.origin.double x = CGPointZero.x;
      v114.origin.CGFloat y = v38;
      v114.size.double width = v31;
      v114.size.double height = height;
      double v46 = -CGRectGetWidth(v114);
    }
  }
  double v59 = v46;
  double v47 = -(v45 - v37 * v34);
  if (v18 && v47 > 0.0)
  {
    v115.origin.double x = CGPointZero.x;
    v115.origin.CGFloat y = v38;
    v115.size.double width = v31;
    v115.size.double height = height;
    double v60 = -CGRectGetHeight(v115);
  }
  double v48 = fmax(v68, 0.0);
  double v49 = fmax(v47, 0.0);
  double v50 = -v44 / v61;
  if (v44 > 0.0) {
    double v50 = 0.0;
  }
  double v56 = v50;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1C8A04;
  v89[3] = &unk_45AE30;
  long long v90 = *(_OWORD *)&self->_solidPositionAttributeIndex;
  BOOL v103 = v18;
  double v91 = v64;
  double v92 = v63;
  v89[4] = self;
  v89[5] = &v108;
  double v93 = v44;
  double v94 = v34;
  double v57 = v49;
  double v58 = v34;
  double v95 = v65;
  double v96 = v66;
  CGFloat v97 = CGPointZero.x;
  CGFloat v98 = v38;
  double v99 = v31;
  double v100 = height;
  if (v34 <= 0.0) {
    double v51 = -v34 / v62;
  }
  else {
    double v51 = 0.0;
  }
  double v52 = v48;
  double v101 = v48;
  double v102 = v49;
  v53 = objc_retainBlock(v89);
  if (v6) {
    [(TSDMTLDataBuffer *)self->_solidMTLDataBuffer updateMetalDataBufferAttributes:self->_solidBufferAttributes withBlock:v53];
  }
  wipeOpacityAttributeIndedouble x = self->_wipeOpacityAttributeIndex;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1C91E8;
  v69[3] = &unk_45AE58;
  *(double *)&v69[6] = v56;
  *(double *)&v69[7] = v51;
  long long v70 = *(_OWORD *)&self->_wipePositionAttributeIndex;
  unint64_t v71 = wipeOpacityAttributeIndex;
  BOOL v88 = v18;
  double v72 = v64;
  double v73 = v63;
  double v74 = v52;
  double v75 = v44;
  double v76 = v58;
  double v77 = v65;
  double v78 = v66;
  double v79 = v57;
  CGFloat v80 = CGPointZero.x;
  double v81 = v67;
  double v82 = v31;
  double v83 = height;
  v69[4] = self;
  v69[5] = &v104;
  double v84 = v61;
  double v85 = v62;
  double v86 = fmax(v61 + v68 + v59, 0.0);
  double v87 = fmax(v62 + v47 + v60, 0.0);
  v55 = objc_retainBlock(v69);
  if (v6) {
    [(TSDMTLDataBuffer *)self->_wipeMTLDataBuffer updateMetalDataBufferAttributes:self->_wipeBufferAttributes withBlock:v55];
  }
  *a4 = v109[3];
  *a5 = v105[3];

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);
}

- (void)drawWipeWithPercent:(double)a3 opacity:(double)a4 renderEncoder:(id)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v8 = a5;
  [(KNWipeDataBuffer *)self updateWipeWithPercent:&v11 solidVertexCount:&v10 wipeVertexCount:1 drawIntoMetalBuffer:a3];
  float v9 = a4;
  self->_fragmentInput.OpacitCGFloat y = v9;
  self = (KNWipeDataBuffer *)((char *)self + 152);
  [*(id *)&self->MVPMatrix.m32 setPipelineStateWithEncoder:v8 vertexBytes:&self->_wipePositionAttributeIndex fragmentBytes:self];
  [*(id *)&self->MVPMatrix.m33 drawWithEncoder:v8 atIndex:0 range:0];
  [*(id *)&self->MVPMatrix.m24 setPipelineStateWithEncoder:v8 vertexBytes:&self->_wipePositionAttributeIndex fragmentBytes:self];
  [*(id *)&self->MVPMatrix.m31 drawWithEncoder:v8 atIndex:0 range:0];
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (double)blurFraction
{
  return self->_blurFraction;
}

- (void)setBlurFraction:(double)a3
{
  self->_blurFraction = a3;
}

- (CATransform3D)MVPMatrix
{
  long long v3 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[3].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m13;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[3].m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (NSArray)wipeBufferAttributes
{
  return self->_wipeBufferAttributes;
}

- (void)setWipeBufferAttributes:(id)a3
{
}

- (unint64_t)wipePositionAttributeIndex
{
  return self->_wipePositionAttributeIndex;
}

- (void)setWipePositionAttributeIndex:(unint64_t)a3
{
  self->_wipePositionAttributeIndedouble x = a3;
}

- (unint64_t)wipeTexCoordAttributeIndex
{
  return self->_wipeTexCoordAttributeIndex;
}

- (void)setWipeTexCoordAttributeIndex:(unint64_t)a3
{
  self->_wipeTexCoordAttributeIndedouble x = a3;
}

- (unint64_t)wipeOpacityAttributeIndex
{
  return self->_wipeOpacityAttributeIndex;
}

- (void)setWipeOpacityAttributeIndex:(unint64_t)a3
{
  self->_wipeOpacityAttributeIndedouble x = a3;
}

- (NSArray)solidBufferAttributes
{
  return self->_solidBufferAttributes;
}

- (void)setSolidBufferAttributes:(id)a3
{
}

- (unint64_t)solidPositionAttributeIndex
{
  return self->_solidPositionAttributeIndex;
}

- (void)setSolidPositionAttributeIndex:(unint64_t)a3
{
  self->_solidPositionAttributeIndedouble x = a3;
}

- (unint64_t)solidTexCoordAttributeIndex
{
  return self->_solidTexCoordAttributeIndex;
}

- (void)setSolidTexCoordAttributeIndex:(unint64_t)a3
{
  self->_solidTexCoordAttributeIndedouble x = a3;
}

- (CGRect)vertexRect
{
  double x = self->_vertexRect.origin.x;
  double y = self->_vertexRect.origin.y;
  double width = self->_vertexRect.size.width;
  double height = self->_vertexRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVertexRect:(CGRect)a3
{
  self->_vertexRect = a3;
}

- (CGRect)textureRect
{
  double x = self->_textureRect.origin.x;
  double y = self->_textureRect.origin.y;
  double width = self->_textureRect.size.width;
  double height = self->_textureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextureRect:(CGRect)a3
{
  self->_textureRect = a3;
}

- (TSDMetalShader)wipeMetalShader
{
  return self->_wipeMetalShader;
}

- (void)setWipeMetalShader:(id)a3
{
}

- (TSDMTLDataBuffer)wipeMTLDataBuffer
{
  return self->_wipeMTLDataBuffer;
}

- (void)setWipeMTLDataBuffer:(id)a3
{
}

- (TSDMetalShader)solidMetalShader
{
  return self->_solidMetalShader;
}

- (void)setSolidMetalShader:(id)a3
{
}

- (TSDMTLDataBuffer)solidMTLDataBuffer
{
  return self->_solidMTLDataBuffer;
}

- (void)setSolidMTLDataBuffer:(id)a3
{
}

- (__n128)vertexInput
{
  return a1[21];
}

- (__n128)setVertexInput:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  result[24] = a5;
  return result;
}

- ($3BA783FF50B239963188BE194EBFFEBA)fragmentInput
{
  return LODWORD(self->_fragmentInput.Opacity);
}

- (void)setFragmentInput:(id)a3
{
  self->_fragmentInput.Opacitdouble y = a3.var0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solidMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_solidMetalShader, 0);
  objc_storeStrong((id *)&self->_wipeMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_wipeMetalShader, 0);
  objc_storeStrong((id *)&self->_solidBufferAttributes, 0);

  objc_storeStrong((id *)&self->_wipeBufferAttributes, 0);
}

@end