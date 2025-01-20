@interface KNShimmerParticleSystem
+ (BOOL)willOverrideColorTexCoords;
+ (BOOL)willOverrideColors;
+ (BOOL)willOverrideStartingPoints;
+ (id)newDataBufferAttributeWithName:(id)a3;
- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)p_hullPoint:(id)a3 inVertexRect:(CGRect)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- ($ECD866EDE069D90F7D69854631A09708)vertexUniforms;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (KNShimmerObjectSystem)objectSystem;
- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColor;
- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColorTexCoord;
- (TSDGPUDataBufferAttribute)objectDataBufferAttributePosition;
- (TSDGPUDataBufferAttribute)objectDataBufferAttributeSpeed;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8;
- (void)p_setupVertexData;
- (void)setObjectDataBufferAttributeColor:(id)a3;
- (void)setObjectDataBufferAttributeColorTexCoord:(id)a3;
- (void)setObjectDataBufferAttributePosition:(id)a3;
- (void)setObjectDataBufferAttributeSpeed:(id)a3;
- (void)setObjectSystem:(id)a3;
- (void)setVertexUniforms:(id *)a3;
@end

@implementation KNShimmerParticleSystem

+ (BOOL)willOverrideStartingPoints
{
  return 1;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  unint64_t v4 = 4 * (void)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  id v6 = [v5 vertexCount];

  if (v4 >= (unint64_t)v6)
  {
    [(KNShimmerParticleSystem *)self objectSize];
    double v16 = v15 * 0.5;
    [(KNShimmerParticleSystem *)self objectSize];
    double v18 = v17 * 0.5;
    TSURandomBetween();
    double v20 = v19;
    v21 = [(KNShimmerParticleSystem *)self randomGenerator];
    [v21 doubleBetween:0.0 :6.28318531];
    double v23 = v22;

    __double2 v24 = __sincos_stret(v23);
    double v13 = v16 + v16 * v20 * v24.__cosval;
    double v14 = v18 + v20 * v18 * v24.__sinval;
  }
  else
  {
    v7 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
    v8 = [(KNShimmerParticleSystem *)self objectDataBufferAttributePosition];
    [v7 metalPoint2DForAttribute:v8 atIndex:v4];
    float v10 = v9;
    float v12 = v11;

    double v13 = v10;
    double v14 = v12;
  }
  result.y = v14;
  result.x = v13;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  unint64_t v4 = 4 * (void)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  id v6 = [v5 vertexCount];

  if (v4 >= (unint64_t)v6)
  {
    float v10 = TSDMetalPoint3DZero[0];
    float v12 = TSDMetalPoint3DZero[1];
    float v14 = TSDMetalPoint3DZero[2];
  }
  else
  {
    v7 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
    v8 = [(KNShimmerParticleSystem *)self objectDataBufferAttributeSpeed];
    [v7 metalPoint3DForAttribute:v8 atIndex:v4];
    float v10 = v9;
    float v12 = v11;
    float v14 = v13;
  }
  float v15 = v10;
  float v16 = v12;
  float v17 = v14;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  TSURandomBetween();

  TSUMix();
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  id v6 = [v5 vertexCount];

  if ((unint64_t)v6 <= 4 * (uint64_t)v4)
  {
    [(KNShimmerParticleSystem *)self duration];
    double v10 = fmin(2.0 / v9, 0.9);
    TSURandom();
    TSUReverseSquare();
    TSDMixFloats();
    double v12 = v11;
    TSUReverseSquare();
    double v14 = v10 * v13;
    double v15 = 0.99 - v10 * v13;
    if (v12 < v15) {
      double v15 = v12;
    }
    float v8 = v15;
    float v7 = v14;
  }
  else
  {
    float v7 = 1.0;
    float v8 = 0.0;
  }
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 1;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  id v4 = -[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  id v6 = [v5 vertexCount];

  float v7 = 1.0;
  if ((unint64_t)v6 > 4 * (uint64_t)v4) {
    float v7 = 0.0;
  }
  float v8 = v7;
  float v9 = v7;
  float v10 = v7;
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BOOL)willOverrideColorTexCoords
{
  return 1;
}

- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3
{
  unint64_t v4 = 4 * (void)-[KNShimmerParticleSystem indexFromPoint:](self, "indexFromPoint:", a3.x, a3.y);
  v5 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
  id v6 = [v5 vertexCount];

  if (v4 >= (unint64_t)v6)
  {
    float v13 = 0.0;
    float v14 = 0.0;
  }
  else
  {
    float v7 = [(KNShimmerObjectSystem *)self->_objectSystem dataBuffer];
    float v8 = [(KNShimmerParticleSystem *)self objectDataBufferAttributeColorTexCoord];
    [v7 metalPoint2DForAttribute:v8 atIndex:v4];
    float v10 = v9;
    float v12 = v11;

    float v13 = v10;
    float v14 = v12;
  }
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  id v13 = a7;
  id v14 = a8;
  double v15 = -a3;
  if (v9) {
    double v15 = a3;
  }
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeRotation(&v31, v15 + v15);
  pow(1.0 - a3, 15.0);
  TSUMix();
  if (v14)
  {
    float v17 = a3;
    float v18 = a4;
    *(float *)&self[1]._objectDataBufferAttributeColorTexCoord = v17;
    *((float *)&self[1]._objectDataBufferAttributeColorTexCoord + 1) = v18;
    float32x2_t v19 = vcvt_f32_f64(*(float64x2_t *)&v31.a);
    KNShimmerSystem v20 = (KNShimmerSystem)vcvt_f32_f64(*(float64x2_t *)&v31.c);
    v21 = (TSDGPUDataBufferAttribute *)vcvt_f32_f64(*(float64x2_t *)&v31.tx);
    *(_DWORD *)&self[1]._vertexUniforms.ShouldSample = 0;
    *(float32x2_t *)&self[1]._vertexUniforms.ParticleScalePercent = v19;
    LODWORD(self[2]._objectSystem) = 0;
    self[2].super = v20;
    LODWORD(self[2]._objectDataBufferAttributePosition) = 1065353216;
    self[2]._objectDataBufferAttributeColor = v21;
    float v22 = v16;
    self[1]._vertexUniforms.Percent = v22;
    [(KNShimmerSystem *)self speedMax];
    *(float *)&double v23 = v23;
    LODWORD(self[2]._objectDataBufferAttributeSpeed) = LODWORD(v23);
    __double2 v24 = [v13 metalTextureWithContext:v14];
    if (v24)
    {
      v25 = [v14 renderEncoder];
      [v25 setVertexBytes:&self->_vertexUniforms length:256 atIndex:1];

      v26 = [(KNShimmerObjectSystem *)self->_objectSystem vertexColorTexture];

      v27 = [v14 renderEncoder];
      v28 = v27;
      if (v26)
      {
        v29 = [(KNShimmerObjectSystem *)self->_objectSystem vertexColorTexture];
        [v28 setVertexTexture:v29 atIndex:0];
      }
      else
      {
        [v27 setVertexTexture:v24 atIndex:0];
      }

      v30 = [v14 renderEncoder];
      [(KNShimmerParticleSystem *)self drawMetalWithEncoder:v30];
    }
  }
}

+ (id)newDataBufferAttributeWithName:(id)a3
{
  uint64_t v3 = kTSDGPUShaderAttributeParticleTexCoord;
  if (![a3 isEqualToString:kTSDGPUShaderAttributeParticleTexCoord]) {
    return 0;
  }
  id v4 = objc_alloc((Class)TSDGPUDataBufferAttribute);

  return [v4 initWithName:v3 bufferUsage:35044 dataType:3 normalized:1 componentCount:2];
}

- ($94F468A8D4C62B317260615823C2B210)p_hullPoint:(id)a3 inVertexRect:(CGRect)a4
{
  float v4 = a4.origin.x + a4.size.width * a3.var0;
  float v5 = a4.origin.y + a4.size.height * a3.var1;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)p_setupVertexData
{
  v108.receiver = self;
  v108.super_class = (Class)KNShimmerParticleSystem;
  [(KNShimmerParticleSystem *)&v108 p_setupVertexData];
  if ([(id)objc_opt_class() numberOfVerticesPerParticle] != &dword_4)
  {
    uint64_t v3 = +[TSUAssertionHandler currentHandler];
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerParticleSystem p_setupVertexData]");
    float v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:765 description:@"Invalid verts per particle!"];
  }
  id v6 = [(KNShimmerParticleSystem *)self particleCount];
  uint64_t v7 = 5 * (void)[(KNShimmerParticleSystem *)self particleCount];
  uint64_t v8 = 5 * (void)[(KNShimmerParticleSystem *)self visibleParticleCount];
  BOOL v9 = [(KNShimmerParticleSystem *)self dataBuffer];
  float v10 = [(KNShimmerParticleSystem *)self positionAttribute];
  v93 = [(KNShimmerParticleSystem *)self centerAttribute];
  v92 = [(KNShimmerParticleSystem *)self colorAttribute];
  v91 = [(KNShimmerParticleSystem *)self speedAttribute];
  v90 = [(KNShimmerParticleSystem *)self scaleAttribute];
  v89 = [(KNShimmerParticleSystem *)self lifeSpanAttribute];
  v85 = [(KNShimmerParticleSystem *)self colorTexCoordAttribute];
  [(KNShimmerParticleSystem *)self p_setupDataBufferWithParticleCount:v7 visibleParticleCount:v8];
  id v88 = v6;
  if (v6)
  {
    uint64_t v11 = 0;
    float v12 = 0;
    int v86 = *((_DWORD *)&TSDMetalPoint2DZero + 1);
    int v87 = TSDMetalPoint2DZero;
    do
    {
      [v9 metalFloatForAttribute:v90 atIndex:4 * (void)v12];
      int v107 = v13;
      [v9 metalPoint3DForAttribute:v91 atIndex:4 * (void)v12];
      int v105 = v15;
      int v106 = v14;
      int v104 = v16;
      [v9 metalPoint4DForAttribute:v92 atIndex:4 * (void)v12];
      int v102 = v18;
      int v103 = v17;
      int v100 = v20;
      int v101 = v19;
      [v9 metalPoint2DForAttribute:v10 atIndex:4 * (void)v12];
      [v9 metalPoint2DForAttribute:v10 atIndex:(4 * (void)v12) | 2];
      TSDRectWithPoints();
      double v98 = v22;
      double v99 = v21;
      double v96 = v24;
      double v97 = v23;
      [v9 metalPoint2DForAttribute:v93 atIndex:4 * (void)v12];
      int v26 = v25;
      int v28 = v27;
      [v9 metalPoint2DForAttribute:v89 atIndex:4 * (void)v12];
      int v30 = v29;
      int v32 = v31;
      v33 = [(KNShimmerParticleSystem *)self colorTexCoordAttribute];

      int v94 = v86;
      int v95 = v87;
      if (v33)
      {
        [v9 metalPoint2DForAttribute:v85 atIndex:4 * (void)v12];
        int v94 = LODWORD(v35);
        int v95 = LODWORD(v34);
      }
      uint64_t v36 = 0;
      v37 = (int *)&unk_344E64;
      do
      {
        int v38 = *(v37 - 1);
        int v39 = *v37;
        LODWORD(v34) = v38;
        LODWORD(v35) = *v37;
        -[KNShimmerParticleSystem p_hullPoint:inVertexRect:](self, "p_hullPoint:inVertexRect:", v34, v35, v99, v98, v97, v96);
        int v41 = v40;
        int v43 = v42;
        v44 = [(KNShimmerParticleSystem *)self dataBuffer];
        v45 = [(KNShimmerParticleSystem *)self positionAttribute];
        LODWORD(v46) = v41;
        LODWORD(v47) = v43;
        [v44 setMetalPoint2D:v45 forAttribute:v11 + v36 atIndex:v46];

        LODWORD(v48) = v38;
        LODWORD(v49) = v39;
        -[KNShimmerParticleSystem p_hullPoint:inVertexRect:](self, "p_hullPoint:inVertexRect:", v48, v49, 0.0, 0.0, 1.0, 1.0);
        int v51 = v50;
        int v53 = v52;
        v54 = [(KNShimmerParticleSystem *)self dataBuffer];
        v55 = [(KNShimmerParticleSystem *)self particleTexCoordAttribute];
        LODWORD(v56) = v51;
        LODWORD(v57) = v53;
        [v54 setMetalPoint2D:v55 forAttribute:v11 + v36 atIndex:v56];

        v58 = [(KNShimmerParticleSystem *)self dataBuffer];
        v59 = [(KNShimmerParticleSystem *)self centerAttribute];
        LODWORD(v60) = v26;
        LODWORD(v61) = v28;
        [v58 setMetalPoint2D:v59 forAttribute:v11 + v36 atIndex:v60];

        v62 = [(KNShimmerParticleSystem *)self dataBuffer];
        v63 = [(KNShimmerParticleSystem *)self colorAttribute];
        LODWORD(v65) = v102;
        LODWORD(v64) = v103;
        LODWORD(v67) = v100;
        LODWORD(v66) = v101;
        [v62 setMetalPoint4D:v63 forAttribute:v11 + v36 atIndex:v64, v65, v66, v67];

        v68 = [(KNShimmerParticleSystem *)self dataBuffer];
        v69 = [(KNShimmerParticleSystem *)self speedAttribute];
        LODWORD(v71) = v105;
        LODWORD(v70) = v106;
        LODWORD(v72) = v104;
        [v68 setMetalPoint3D:v69 forAttribute:v11 + v36 atIndex:v70, v71, v72];

        v73 = [(KNShimmerParticleSystem *)self dataBuffer];
        v74 = [(KNShimmerParticleSystem *)self scaleAttribute];
        LODWORD(v75) = v107;
        [v73 setMetalFloat:v74 forAttribute:v11 + v36 atIndex:v75];

        v76 = [(KNShimmerParticleSystem *)self dataBuffer];
        v77 = [(KNShimmerParticleSystem *)self lifeSpanAttribute];
        LODWORD(v78) = v30;
        LODWORD(v79) = v32;
        [v76 setMetalPoint2D:v77 forAttribute:v11 + v36 atIndex:v78];

        v80 = [(KNShimmerParticleSystem *)self colorTexCoordAttribute];

        if (v80)
        {
          v81 = [(KNShimmerParticleSystem *)self dataBuffer];
          v82 = [(KNShimmerParticleSystem *)self colorTexCoordAttribute];
          LODWORD(v84) = v94;
          LODWORD(v83) = v95;
          [v81 setMetalPoint2D:v82 forAttribute:v11 + v36 atIndex:v83];
        }
        ++v36;
        v37 += 2;
      }
      while (v36 != 20);
      float v12 = (char *)v12 + 1;
      v11 += 20;
    }
    while (v12 != v88);
  }
}

- (KNShimmerObjectSystem)objectSystem
{
  return self->_objectSystem;
}

- (void)setObjectSystem:(id)a3
{
  self->_objectSystem = (KNShimmerObjectSystem *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColor
{
  return self->_objectDataBufferAttributeColor;
}

- (void)setObjectDataBufferAttributeColor:(id)a3
{
  self->_objectDataBufferAttributeColor = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributePosition
{
  return self->_objectDataBufferAttributePosition;
}

- (void)setObjectDataBufferAttributePosition:(id)a3
{
  self->_objectDataBufferAttributePosition = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeSpeed
{
  return self->_objectDataBufferAttributeSpeed;
}

- (void)setObjectDataBufferAttributeSpeed:(id)a3
{
  self->_objectDataBufferAttributeSpeed = (TSDGPUDataBufferAttribute *)a3;
}

- (TSDGPUDataBufferAttribute)objectDataBufferAttributeColorTexCoord
{
  return self->_objectDataBufferAttributeColorTexCoord;
}

- (void)setObjectDataBufferAttributeColorTexCoord:(id)a3
{
  self->_objectDataBufferAttributeColorTexCoord = (TSDGPUDataBufferAttribute *)a3;
}

- ($ECD866EDE069D90F7D69854631A09708)vertexUniforms
{
  long long v2 = *(_OWORD *)&self[12].var6;
  *(_OWORD *)&retstr[9].var5 = *(_OWORD *)&self[12].var1;
  *(_OWORD *)&retstr[10].var3 = v2;
  long long v3 = *(_OWORD *)&self[14].var3;
  *(_OWORD *)&retstr[11].var2 = *(_OWORD *)&self[13].var5;
  *(_OWORD *)&retstr[12].var1 = v3;
  long long v4 = *(_OWORD *)&self[9].var5;
  *(_OWORD *)&retstr[6].var3 = *(_OWORD *)&self[8].var6;
  *(_OWORD *)&retstr[7].var2 = v4;
  long long v5 = *(_OWORD *)&self[11].var2;
  *(_OWORD *)&retstr[8].var1 = *(_OWORD *)&self[10].var3;
  *(_OWORD *)&retstr[8].var6 = v5;
  long long v6 = *(_OWORD *)&self[6].var3;
  *(_OWORD *)&retstr[3].var2 = *(_OWORD *)&self[5].var5;
  *(_OWORD *)&retstr[4].var1 = v6;
  long long v7 = *(_OWORD *)&self[8].var1;
  *(_OWORD *)&retstr[4].var6 = *(_OWORD *)&self[7].var2;
  *(_OWORD *)&retstr[5].var5 = v7;
  long long v8 = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var6 = v8;
  long long v9 = *(_OWORD *)&self[4].var6;
  *(_OWORD *)&retstr[1].var5 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr[2].var3 = v9;
  return self;
}

- (void)setVertexUniforms:(id *)a3
{
  long long v4 = *(_OWORD *)&a3[2].var3;
  long long v6 = *(_OWORD *)&a3->var1;
  long long v5 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self[1]._objectSystem = *(_OWORD *)&a3[1].var5;
  *(_OWORD *)&self[1]._objectDataBufferAttributePosition = v4;
  *(_OWORD *)&self->_vertexUniforms.Percent = v6;
  *(_OWORD *)&self->_vertexUniforms.ShouldSample = v5;
  long long v7 = *(_OWORD *)&a3[5].var5;
  long long v9 = *(_OWORD *)&a3[3].var2;
  long long v8 = *(_OWORD *)&a3[4].var1;
  *(_OWORD *)self[2].super.TSDGPUParticleSystem_opaque = *(_OWORD *)&a3[4].var6;
  *(_OWORD *)&self[2]._objectDataBufferAttributeColor = v7;
  *(_OWORD *)&self[1]._objectDataBufferAttributeColorTexCoord = v9;
  *(_OWORD *)&self[1]._vertexUniforms.ParticleScalePercent = v8;
  long long v10 = *(_OWORD *)&a3[8].var6;
  long long v12 = *(_OWORD *)&a3[6].var3;
  long long v11 = *(_OWORD *)&a3[7].var2;
  *(_OWORD *)&self[2]._vertexUniforms.ShouldSample = *(_OWORD *)&a3[8].var1;
  *(_OWORD *)&self[3]._objectSystem = v10;
  *(_OWORD *)&self[2]._objectDataBufferAttributeSpeed = v12;
  *(_OWORD *)&self[2]._vertexUniforms.Percent = v11;
  long long v13 = *(_OWORD *)&a3[12].var1;
  long long v15 = *(_OWORD *)&a3[9].var5;
  long long v14 = *(_OWORD *)&a3[10].var3;
  *(_OWORD *)&self[3]._vertexUniforms.ParticleScalePercent = *(_OWORD *)&a3[11].var2;
  *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque = v13;
  *(_OWORD *)&self[3]._objectDataBufferAttributePosition = v15;
  *(_OWORD *)&self[3]._objectDataBufferAttributeColorTexCoord = v14;
}

@end