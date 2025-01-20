@interface KNBuildCrumbleSystem
+ (BOOL)willOverrideGeometry;
+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 shader:(id)a8 percentOfCellsToSplit:(double)a9 randomGenerator:(id)a10 metalContext:(id)a11;
+ (unint64_t)numberOfVerticesPerParticle;
- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (double)lifeSpanDelay;
- (double)lifeSpanRandomness;
- (double)rotationMax;
- (double)speedMax;
- (double)speedMaxLimiter;
- (unint64_t)triangleCount;
- (void)dealloc;
- (void)p_setupParameters;
- (void)setLifeSpanDelay:(double)a3;
- (void)setLifeSpanRandomness:(double)a3;
- (void)setRotationMax:(double)a3;
- (void)setSpeedMax:(double)a3;
- (void)setSpeedMaxLimiter:(double)a3;
- (void)setTriangleCount:(unint64_t)a3;
@end

@implementation KNBuildCrumbleSystem

+ (BOOL)willOverrideGeometry
{
  return 1;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 3;
}

- (void)p_setupParameters
{
  id v48 = [(KNBuildCrumbleSystem *)self randomGenerator];
  self->_cellParameters = ($C0298B01DB5FC2E28DB3B6A6EBA1E8D4 *)malloc_type_calloc(0x28uLL, (size_t)[(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData cellCount], 0x855BC78uLL);
  if ([(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData cellCount])
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    while (1)
    {
      v5 = [(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData cells];
      v6 = [v5 objectAtIndexedSubscript:v4];
      [v6 centerPoint];
      float v8 = v7;
      float v10 = v9;

      [v48 metalPoint3DRandomDirection];
      unsigned int v45 = v11;
      unsigned int v44 = v12;
      float v14 = v13;
      [v48 randomDouble];
      double v16 = v15;
      [v48 metalPoint3DRandomDirection];
      unsigned int v46 = v17;
      float v19 = v18;
      float v21 = v20;
      [(KNBuildCrumbleSystem *)self objectSize];
      double v23 = v22 * 0.5;
      float v24 = fabsf(v19);
      if (v23 >= v10) {
        float v25 = -v24;
      }
      else {
        float v25 = v24;
      }
      float v43 = v25;
      [v48 randomDouble];
      long double v27 = v26;
      [(KNBuildCrumbleSystem *)self speedMaxLimiter];
      double v42 = pow(v27, v28);
      v29 = (int *)[(KNBuildCrumbleSystem *)self direction];
      float v47 = v10;
      if (v29 == (int32_t *)((char *)&stru_20.maxprot + 3)) {
        goto LABEL_12;
      }
      if (v29 != &dword_C && v29 != (int *)((char *)&dword_8 + 3)) {
        break;
      }
      [(KNBuildCrumbleSystem *)self objectSize];
LABEL_13:
      float v33 = v8;
      float v34 = v16 * v16 * v14;
      float v35 = v42 * (float)-fabsf(v21);
      [(KNBuildCrumbleSystem *)self lifeSpanDelay];
      [(KNBuildCrumbleSystem *)self lifeSpanRandomness];
      v36 = [(KNBuildCrumbleSystem *)self randomGenerator];
      [v36 doubleBetween:-1.0 :1.0];

      [(KNBuildCrumbleSystem *)self lifeSpanDelay];
      TSUClamp();
      double v38 = v37;
      [(KNBuildCrumbleSystem *)self lifeSpanDelay];
      float v40 = v38;
      *(float *)&double v39 = 1.0 - v39;
      v41 = &self->_cellParameters[v3];
      v41->var0.var0 = v33;
      v41->var0.var1 = v47;
      *(float32x2_t *)&v41->var1.var0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v44, v45)), v16 * v16));
      v41->var1.var2 = v34;
      *(float32x2_t *)&v41->var2.var0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v43), v46)), v42));
      v41->var2.var2 = v35;
      v41->var3.var0 = v40;
      v41->var3.var1 = *(float *)&v39;
      ++v4;
      ++v3;
      if (v4 >= (unint64_t)[(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData cellCount]) {
        goto LABEL_14;
      }
    }
    v30 = +[TSUAssertionHandler currentHandler];
    v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildCrumbleSystem p_setupParameters]");
    v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"];
    [v30 handleFailureInFunction:v31 file:v32 lineNumber:736 description:@"Invalid direction!"];

LABEL_12:
    TSURandomBetween();
    goto LABEL_13;
  }
LABEL_14:
}

+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 shader:(id)a8 percentOfCellsToSplit:(double)a9 randomGenerator:(id)a10 metalContext:(id)a11
{
  double height = a5.height;
  double width = a5.width;
  double v17 = a4.height;
  double v18 = a4.width;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  if (!v22)
  {
    float v24 = +[TSUAssertionHandler currentHandler];
    float v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNBuildCrumbleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:]");
    double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"];
    [v24 handleFailureInFunction:v25 file:v26 lineNumber:762 description:@"invalid nil value for '%s'", "randGen"];
  }
  id v27 = objc_alloc((Class)TSDGPUVoronoiTriangleData);
  TSDRectWithSize();
  id v28 = [v27 initWithPoints:a3 clippedToRect:v22 percentOfCellsToSplit:0 randomGenerator:0];
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___KNBuildCrumbleSystem;
  v29 = (id *)objc_msgSendSuper2(&v31, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a7, v22, v21, v23, CGSizeZero.width, CGSizeZero.height, (double)(unint64_t)[v28 triangleCount], 1.0, v18, v17, width, height, *(void *)&a6);
  if (v29)
  {
    [v29 setTriangleCount:[v28 triangleCount]];
    objc_storeStrong(v29 + 1, v28);
  }

  return v29;
}

- (void)dealloc
{
  free(self->_cellParameters);
  v3.receiver = self;
  v3.super_class = (Class)KNBuildCrumbleSystem;
  [(KNBuildCrumbleSystem *)&v3 dealloc];
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  id v6 = -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", a4.x, a4.y);
  float v7 = [(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData cellFromTriangleIndex:v6];
  id v8 = [(TSDGPUVoronoiTriangleData *)self->_voronoiTriangleData triangleIndexInCellFromGlobalTriangleIndex:v6];
  float v9 = (float *)((char *)[v7 vertexData] + 24 * (void)v8 + 8 * a3);
  float v10 = *v9;
  float v11 = v9[1];

  float v12 = v10;
  float v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  objc_super v3 = -[TSDGPUVoronoiTriangleData cellFromTriangleIndex:](self->_voronoiTriangleData, "cellFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y));
  [v3 centerPoint];
  float v5 = v4;
  float v7 = v6;

  float v8 = v5;
  float v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_cellParameters) {
    [(KNBuildCrumbleSystem *)self p_setupParameters];
  }
  float v6 = &self->_cellParameters[(void)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  float var0 = v6->var1.var0;
  float var1 = v6->var1.var1;
  float var2 = v6->var1.var2;
  result.float var2 = var2;
  result.float var1 = var1;
  result.float var0 = var0;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_cellParameters) {
    [(KNBuildCrumbleSystem *)self p_setupParameters];
  }
  float v6 = &self->_cellParameters[(void)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  float var0 = v6->var2.var0;
  float var1 = v6->var2.var1;
  float var2 = v6->var2.var2;
  result.float var2 = var2;
  result.float var1 = var1;
  result.float var0 = var0;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_cellParameters) {
    [(KNBuildCrumbleSystem *)self p_setupParameters];
  }
  float v6 = &self->_cellParameters[(void)-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self->_voronoiTriangleData, "cellIndexFromTriangleIndex:", -[KNBuildCrumbleSystem indexFromPoint:](self, "indexFromPoint:", x, y))];
  float var0 = v6->var3.var0;
  float var1 = v6->var3.var1;
  result.float var1 = var1;
  result.float var0 = var0;
  return result;
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (void)setTriangleCount:(unint64_t)a3
{
  self->_triangleCount = a3;
}

- (double)speedMaxLimiter
{
  return self->_speedMaxLimiter;
}

- (void)setSpeedMaxLimiter:(double)a3
{
  self->_speedMaxLimiter = a3;
}

- (double)speedMax
{
  return self->_speedMax;
}

- (void)setSpeedMax:(double)a3
{
  self->_speedMadouble x = a3;
}

- (double)rotationMax
{
  return self->_rotationMax;
}

- (void)setRotationMax:(double)a3
{
  self->_rotationMadouble x = a3;
}

- (double)lifeSpanRandomness
{
  return self->_lifeSpanRandomness;
}

- (void)setLifeSpanRandomness:(double)a3
{
  self->_lifeSpanRandomness = a3;
}

- (double)lifeSpanDelay
{
  return self->_lifeSpanDelay;
}

- (void)setLifeSpanDelay:(double)a3
{
  self->_lifeSpanDeladouble y = a3;
}

- (void).cxx_destruct
{
}

@end