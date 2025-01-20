@interface KNBuildFlameSystem
+ (BOOL)useVisibilities;
+ (BOOL)willOverrideStartingPoints;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (BOOL)shouldDraw;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (double)rotationMax;
- (double)speedMax;
- (void)dealloc;
- (void)p_setupBottomRowWithMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bakedScale:(double)a6;
- (void)p_setupParticleDataWithTexture:(id)a3;
- (void)setShouldDraw:(BOOL)a3;
@end

@implementation KNBuildFlameSystem

- (void)dealloc
{
  free(self->_bottomRow);
  v3.receiver = self;
  v3.super_class = (Class)KNBuildFlameSystem;
  [(KNBuildFlameSystem *)&v3 dealloc];
}

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  v4 = [(KNBuildFlameSystem *)self randomGenerator];
  if (self->_bottomRow)
  {
    do
    {
      v5 = &self->_bottomRow[(void)[v4 intBetween:0 :self->_bottomRowCount - 1]];
      double y = v5->y;
    }
    while (y == -1.0);
    double x = v5->x;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  [(KNBuildFlameSystem *)self objectSize];
  double v9 = x * v8;
  [(KNBuildFlameSystem *)self objectSize];
  double v11 = y * v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNBuildFlameSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  uint64_t v5 = (void)[(id)objc_opt_class() numberOfVerticesPerParticle] * (void)v4;
  v6 = [(KNBuildFlameSystem *)self dataBuffer];
  v7 = [(KNBuildFlameSystem *)self positionAttribute];
  [v6 metalPoint2DForAttribute:v7 atIndex:v5];
  double v9 = v8;

  double height = self->_actualSize.height;
  if (height <= v9) {
    double v11 = self->_actualSize.height;
  }
  else {
    double v11 = v9;
  }
  double v12 = v11 * 0.9 + height * 0.2;
  double v13 = [(KNBuildFlameSystem *)self randomGenerator];
  [v13 doubleBetween:0.0 :0.1];
  double v15 = v12 * (v14 + 1.0);

  [(KNBuildFlameSystem *)self speedMax];
  double v17 = 1.0 / v16;
  *(float *)&double v15 = v15;
  double v18 = v17 * *(float *)&v15;
  float v19 = v17 * 0.0;
  float v20 = v18;
  float v21 = v19;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (double)speedMax
{
  return self->_actualSize.height * 1.1 * 1.1;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(KNBuildFlameSystem *)self duration];
  double v7 = 1.0 / v6;
  BOOL v8 = v6 <= 2.0;
  double v9 = 0.5;
  if (!v8) {
    double v9 = v7;
  }
  if (v9 <= 1.0) {
    double v10 = v9;
  }
  else {
    double v10 = 1.0;
  }
  double v11 = [(KNBuildFlameSystem *)self randomGenerator];
  [v11 doubleBetween:0.8 :1.0];
  double v13 = v12 * v10;

  double v14 = (double)(unint64_t)-[KNBuildFlameSystem indexFromPoint:](self, "indexFromPoint:", x, y);
  id v15 = [(KNBuildFlameSystem *)self particleCount];
  float v16 = (1.0 - v13)
      * (v14 / (double)(unint64_t)v15 * 0.75
       + v14 / (double)(unint64_t)v15 * (v14 / (double)(unint64_t)v15) * 0.25);
  float v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  id v4 = [(KNBuildFlameSystem *)self randomGenerator];
  uint64_t v5 = [(KNBuildFlameSystem *)self randomGenerator];
  [v5 doubleBetween:-1.0 :1.0];
  double v7 = v6;
  [v4 doubleBetween:-1.0 :1.0];
  float v9 = v8;

  float v10 = 0.0;
  *(float *)&double v7 = v7;
  float v11 = *(float *)&v7;
  float v12 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (double)rotationMax
{
  return 6.28318531;
}

+ (BOOL)useVisibilities
{
  return 0;
}

- (void)p_setupBottomRowWithMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 bakedScale:(double)a6
{
  id v9 = a3;
  v56 = self;
  float v10 = [(KNBuildFlameSystem *)self metalContext];
  float v11 = [v10 device];

  float v12 = +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:v11 library:@"KeynoteMetalLibrary"];
  id v13 = [v12 newFunctionWithName:@"buildFlameBottomRowComputeShader"];
  id v14 = [v11 newBufferWithBytes:malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL) length:16 * a4 options:0];
  id v15 = objc_alloc_init((Class)MTLComputePipelineDescriptor);
  v55 = v13;
  [v15 setComputeFunction:v13];
  id v16 = objc_alloc_init((Class)MTLBufferLayoutDescriptor);
  [v16 setStride:16];
  [v16 setStepRate:1];
  [v16 setStepFunction:5];
  float v17 = [v15 stageInputDescriptor];
  double v18 = [v17 layouts];
  [v18 setObject:v16 atIndexedSubscript:0];

  id v62 = 0;
  v63[0] = 0;
  id v19 = [v11 newComputePipelineStateWithDescriptor:v15 options:0 reflection:v63 error:&v62];
  id v20 = v63[0];
  id v21 = v62;
  v22 = v21;
  if (v19)
  {
    id v49 = v21;
    id v50 = v20;
    v51 = v12;
    v52 = v11;
    unint64_t v23 = (unint64_t)[v19 threadExecutionWidth];
    unint64_t v47 = ((unint64_t)[v9 width] + v23 - 1) / v23;
    id v24 = v9;
    if (a6 <= 1.0)
    {
      TSUClamp();
      a6 = v25;
    }
    unsigned int v61 = a6;
    v26 = [(KNBuildFlameSystem *)v56 metalContext];
    v27 = [v26 commandQueue];
    v28 = [v27 commandBuffer];

    v29 = [v28 computeCommandEncoder];
    [v29 setComputePipelineState:v19];
    [v29 setBuffer:v14 offset:0 atIndex:0];
    [v29 setBytes:&v61 length:4 atIndex:1];
    v53 = v24;
    [v29 setTexture:v24 atIndex:0];
    uint64_t v59 = v48;
    int64x2_t v60 = vdupq_n_s64(1uLL);
    unint64_t v57 = v23;
    int64x2_t v58 = v60;
    [v29 dispatchThreadgroups:&v59 threadsPerThreadgroup:&v57];
    [v29 endEncoding];
    [v28 commit];
    [v28 waitUntilCompleted];
    v30 = [v14 contents];
    v31 = (CGPoint *)malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL);
    v56->_bottomRow = v31;
    v56->_bottomRowCount = a4;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    char v34 = 0;
    if (a4)
    {
      unint64_t v35 = 0;
      p_double y = &v31->y;
      double v37 = (double)a4;
      double v38 = (double)a5;
      float v11 = v52;
      do
      {
        long long v39 = v30[v35];
        double v40 = *(float *)&v39 / (double)a4;
        LODWORD(v41) = HIDWORD(*(void *)&v30[v35]);
        double v42 = v41;
        double v43 = (double)v35;
        if (v37 >= (double)v35) {
          double v44 = (double)v35;
        }
        else {
          double v44 = v37;
        }
        *(double *)&long long v39 = *((float *)&v39 + 2);
        if (v38 < *((float *)&v39 + 2)) {
          *(double *)&long long v39 = v38;
        }
        if (x >= v43) {
          double v43 = x;
        }
        if (y >= v42) {
          double v42 = y;
        }
        BOOL v45 = v41 <= -1.0;
        if (v41 > -1.0) {
          double v46 = v41 / (double)a5;
        }
        else {
          double v46 = -1.0;
        }
        if (!v45)
        {
          double y = v42;
          double x = v43;
          double v38 = *(double *)&v39;
          double v37 = v44;
          char v34 = 1;
        }
        *(p_y - 1) = v40;
        *p_double y = v46;
        ++v35;
        p_y += 2;
      }
      while (a4 != v35);
    }
    else
    {
      double v38 = (double)a5;
      double v37 = (double)0;
      float v11 = v52;
    }
    [(KNBuildFlameSystem *)v56 setShouldDraw:v34 & 1];
    v56->_actualSize.width = x - v37;
    v56->_actualSize.double height = y - v38;

    id v9 = v53;
    float v12 = v51;
    v22 = v49;
    id v20 = v50;
  }
}

- (void)p_setupParticleDataWithTexture:(id)a3
{
  id v4 = a3;
  [(KNBuildFlameSystem *)self setShouldDraw:0];
  uint64_t v5 = [(KNBuildFlameSystem *)self metalContext];
  double v6 = [v4 metalTextureWithContext:v5];

  if (v6)
  {
    id v7 = [v6 width];
    id v8 = [v6 height];
    [v4 bakedScale];
    -[KNBuildFlameSystem p_setupBottomRowWithMetalTexture:width:height:bakedScale:](self, "p_setupBottomRowWithMetalTexture:width:height:bakedScale:", v6, v7, v8);
  }
  if ([(KNBuildFlameSystem *)self shouldDraw])
  {
    v54.receiver = self;
    v54.super_class = (Class)KNBuildFlameSystem;
    [(KNBuildFlameSystem *)&v54 p_setupParticleDataWithTexture:0];
    double height = self->_actualSize.height;
    if (((unint64_t)[(KNBuildFlameSystem *)self particleCount] & 0x3FFFFFFFFFFFFFFFLL) != 0)
    {
      unint64_t v10 = 0;
      double v11 = height * 0.5;
      double v12 = v11 * 0.5;
      do
      {
        id v13 = [(KNBuildFlameSystem *)self dataBuffer];
        id v14 = [(KNBuildFlameSystem *)self positionAttribute];
        [v13 metalPoint2DForAttribute:v14 atIndex:v10];
        float v16 = v15;
        float v18 = v17;

        float v19 = v16 - v12;
        float v20 = v18 - v12;
        CGFloat v21 = v19;
        CGFloat v22 = v20;
        v55.origin.double x = v19;
        v55.origin.double y = v20;
        v55.size.width = v11;
        v55.size.double height = v11;
        double MidX = CGRectGetMidX(v55);
        v56.origin.double x = v21;
        v56.origin.double y = v22;
        v56.size.width = v11;
        v56.size.double height = v11;
        float v24 = MidX;
        float MidY = CGRectGetMidY(v56);
        v26 = [(KNBuildFlameSystem *)self dataBuffer];
        v57.origin.double x = v21;
        v57.origin.double y = v22;
        v57.size.width = v11;
        v57.size.double height = v11;
        CGFloat MinX = CGRectGetMinX(v57);
        v58.origin.double x = v21;
        v58.origin.double y = v22;
        v58.size.width = v11;
        v58.size.double height = v11;
        float MinY = CGRectGetMinY(v58);
        v29 = [(KNBuildFlameSystem *)self positionAttribute];
        *(float *)&CGFloat MinX = MinX;
        LODWORD(v30) = LODWORD(MinX);
        *(float *)&double v31 = MinY;
        [v26 setMetalPoint2D:v29 forAttribute:v10 atIndex:v30];

        v32 = [(KNBuildFlameSystem *)self dataBuffer];
        v59.origin.double x = v21;
        v59.origin.double y = v22;
        v59.size.width = v11;
        v59.size.double height = v11;
        CGFloat MaxX = CGRectGetMaxX(v59);
        v60.origin.double x = v21;
        v60.origin.double y = v22;
        v60.size.width = v11;
        v60.size.double height = v11;
        float v34 = CGRectGetMinY(v60);
        unint64_t v35 = [(KNBuildFlameSystem *)self positionAttribute];
        *(float *)&CGFloat MaxX = MaxX;
        LODWORD(v36) = LODWORD(MaxX);
        *(float *)&double v37 = v34;
        [v32 setMetalPoint2D:v35 forAttribute:v10 | 1 atIndex:v36];

        double v38 = [(KNBuildFlameSystem *)self dataBuffer];
        v61.origin.double x = v21;
        v61.origin.double y = v22;
        v61.size.width = v11;
        v61.size.double height = v11;
        CGFloat v39 = CGRectGetMaxX(v61);
        v62.origin.double x = v21;
        v62.origin.double y = v22;
        v62.size.width = v11;
        v62.size.double height = v11;
        float MaxY = CGRectGetMaxY(v62);
        float v41 = [(KNBuildFlameSystem *)self positionAttribute];
        *(float *)&CGFloat v39 = v39;
        LODWORD(v42) = LODWORD(v39);
        *(float *)&double v43 = MaxY;
        [v38 setMetalPoint2D:v41 forAttribute:v10 | 2 atIndex:v42];

        double v44 = [(KNBuildFlameSystem *)self dataBuffer];
        v63.origin.double x = v21;
        v63.origin.double y = v22;
        v63.size.width = v11;
        v63.size.double height = v11;
        double v45 = CGRectGetMinX(v63);
        v64.origin.double x = v21;
        v64.origin.double y = v22;
        v64.size.width = v11;
        v64.size.double height = v11;
        *(float *)&CGFloat v22 = CGRectGetMaxY(v64);
        double v46 = [(KNBuildFlameSystem *)self positionAttribute];
        *(float *)&CGFloat v21 = v45;
        LODWORD(v47) = LODWORD(v21);
        LODWORD(v48) = LODWORD(v22);
        [v44 setMetalPoint2D:v46 forAttribute:v10 | 3 atIndex:v47];

        for (uint64_t i = 0; i != 4; ++i)
        {
          id v50 = [(KNBuildFlameSystem *)self dataBuffer];
          v51 = [(KNBuildFlameSystem *)self centerAttribute];
          *(float *)&double v52 = v24;
          *(float *)&double v53 = MidY;
          [v50 setMetalPoint2D:v51 forAttribute:v10 + i atIndex:v52];
        }
        v10 += 4;
      }
      while (v10 < 4 * (uint64_t)[(KNBuildFlameSystem *)self particleCount]);
    }
  }
}

- (BOOL)shouldDraw
{
  return self->shouldDraw;
}

- (void)setShouldDraw:(BOOL)a3
{
  self->shouldDraw = a3;
}

@end