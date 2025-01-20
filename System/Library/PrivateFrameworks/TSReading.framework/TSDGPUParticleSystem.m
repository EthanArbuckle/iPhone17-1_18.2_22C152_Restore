@interface TSDGPUParticleSystem
+ (BOOL)shouldDrawInvisibleParticles;
+ (BOOL)willOverrideColorTexCoords;
+ (BOOL)willOverrideColors;
+ (BOOL)willOverrideGeometry;
+ (BOOL)willOverrideStartingPoints;
+ (BOOL)willOverrideVisibilities;
+ (CGSize)p_particleSystemSizeWithRequestedNumber:(unint64_t)a3 objectSize:(CGSize)a4;
+ (id)newDataBufferAttributeWithName:(id)a3;
+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 randomGenerator:(id)a8 shader:(id)a9 metalContext:(id)a10;
+ (id)newParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11;
+ (unint64_t)numberOfVerticesPerParticle;
- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3;
- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3;
- (BOOL)shouldDraw;
- (BOOL)visibilityAtIndexPoint:(CGPoint)a3;
- (CGContext)newContextFromTexture:(id)a3;
- (CGPoint)indexPointFromIndex:(unint64_t)a3;
- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3;
- (CGSize)objectSize;
- (CGSize)p_resizeSystemToFitWithinMaxVerticesWithSystemSize:(CGSize)a3;
- (CGSize)particleSize;
- (CGSize)slideSize;
- (CGSize)vertexTextureSize;
- (MTLTexture)vertexColorTexture;
- (NSArray)dataBufferAttributes;
- (NSString)description;
- (TSDGPUDataBuffer)dataBuffer;
- (TSDGPUDataBufferAttribute)centerAttribute;
- (TSDGPUDataBufferAttribute)colorAttribute;
- (TSDGPUDataBufferAttribute)colorTexCoordAttribute;
- (TSDGPUDataBufferAttribute)lifeSpanAttribute;
- (TSDGPUDataBufferAttribute)particleTexCoordAttribute;
- (TSDGPUDataBufferAttribute)positionAttribute;
- (TSDGPUDataBufferAttribute)rotationAttribute;
- (TSDGPUDataBufferAttribute)scaleAttribute;
- (TSDGPUDataBufferAttribute)speedAttribute;
- (TSDGPUDataBufferAttribute)texCoordAttribute;
- (TSDGPUParticleSystem)initWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11;
- (TSDMetalContext)metalContext;
- (double)duration;
- (double)rotationMax;
- (double)scaleAtIndexPoint:(CGPoint)a3;
- (double)speedMax;
- (id)randomGenerator;
- (unint64_t)direction;
- (unint64_t)indexFromPoint:(CGPoint)a3;
- (unint64_t)particleCount;
- (unint64_t)particlesHigh;
- (unint64_t)particlesWide;
- (unint64_t)visibleParticleCount;
- (void)dealloc;
- (void)drawMetalWithEncoder:(id)a3;
- (void)p_logParticleInformation;
- (void)p_reverseParticleDataDrawOrder;
- (void)p_setDataBufferAttribute:(id *)a3 withName:(id)a4 defaultDataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7;
- (void)p_setupDataBufferWithParticleCount:(unint64_t)a3 visibleParticleCount:(unint64_t)a4;
- (void)p_setupParticleDataWithTexture:(id)a3;
- (void)p_setupParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9;
- (void)p_setupParticleTextureDataWithTexture:(id)a3 capabilities:(id)a4;
- (void)p_setupVertexData;
- (void)setupMetalWithShader:(id)a3;
- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5;
- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5 capabilities:(id)a6;
@end

@implementation TSDGPUParticleSystem

+ (id)newDataBufferAttributeWithName:(id)a3
{
  return 0;
}

+ (id)newParticleSystemWithNumberOfParticles:(unint64_t)a3 objectSize:(CGSize)a4 slideSize:(CGSize)a5 duration:(double)a6 direction:(unint64_t)a7 randomGenerator:(id)a8 shader:(id)a9 metalContext:(id)a10
{
  double height = a5.height;
  double width = a5.width;
  double v16 = a4.height;
  double v17 = a4.width;
  +[TSDGPUParticleSystem p_particleSystemSizeWithRequestedNumber:objectSize:](TSDGPUParticleSystem, "p_particleSystemSizeWithRequestedNumber:objectSize:", a3);
  double v20 = v19;
  double v22 = v21;
  if (!a8)
  {
    v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"+[TSDGPUParticleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:]"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 72, @"invalid nil value for '%s'", "randomGenerator");
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a7, a8, a9, a10, ceil(v17 / v20), ceil(v16 / v22), v20, v22, v17, v16, width, height, *(void *)&a6);
}

+ (id)newParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11
{
  double height = a6.height;
  double width = a6.width;
  double v16 = a5.height;
  double v17 = a5.width;
  double v18 = a4.height;
  double v19 = a4.width;
  double v20 = a3.height;
  double v21 = a3.width;
  id v22 = objc_alloc((Class)a1);

  return (id)objc_msgSend(v22, "initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a8, a9, a10, a11, v21, v20, v19, v18, v17, v16, width, height);
}

- (TSDGPUParticleSystem)initWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9 shader:(id)a10 metalContext:(id)a11
{
  double height = a6.height;
  double width = a6.width;
  double v17 = a5.height;
  double v18 = a5.width;
  double v19 = a4.height;
  double v20 = a4.width;
  double v21 = a3.height;
  double v22 = a3.width;
  unint64_t v24 = [(id)objc_opt_class() numberOfVerticesPerParticle];
  if (v24 > 4 || ((1 << v24) & 0x1A) == 0)
  {
    v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem initWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:]"];
    [v26 handleFailureInFunction:v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 115, @"%@: We don't support %d vertices per particle... aborting init.", objc_opt_class(), v24 file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)TSDGPUParticleSystem;
  v28 = [(TSDGPUParticleSystem *)&v32 init];
  v29 = v28;
  if (v28)
  {
    -[TSDGPUParticleSystem p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:](v28, "p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:", a8, a9, v22, v21, v20, v19, v18, v17, width, height, *(void *)&a7);
    v29->_metalContext = (TSDMetalContext *)a11;
    uint64_t v30 = [(TSDGPUParticleSystem *)v29 particleCount];
    [(TSDGPUParticleSystem *)v29 setupMetalWithShader:a10];
    if (([(id)objc_opt_class() shouldDrawInvisibleParticles] & 1) == 0) {
      v29->_visibilities = (BOOL *)malloc_type_calloc(v30 * v24, 1uLL, 0x100004077774924uLL);
    }
    [(TSDGPUParticleSystem *)v29 p_setupDataBufferWithParticleCount:[(TSDGPUParticleSystem *)v29 particleCount] visibleParticleCount:[(TSDGPUParticleSystem *)v29 visibleParticleCount]];
  }
  return v29;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(TSDGPUParticleSystem *)self dataBufferAttributes];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  visibilities = self->_visibilities;
  if (visibilities)
  {
    free(visibilities);
    self->_visibilities = 0;
  }
  self->_attributesInShader = 0;
  v9.receiver = self;
  v9.super_class = (Class)TSDGPUParticleSystem;
  [(TSDGPUParticleSystem *)&v9 dealloc];
}

- (void)p_setupParticleSystemWithParticleSize:(CGSize)a3 particleSystemSize:(CGSize)a4 objectSize:(CGSize)a5 slideSize:(CGSize)a6 duration:(double)a7 direction:(unint64_t)a8 randomGenerator:(id)a9
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  double v13 = a5.height;
  double v14 = a5.width;
  double v15 = a4.height;
  double v16 = a4.width;
  double v24 = a3.height;
  double v17 = a3.width;
  if (!a9)
  {
    double v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem p_setupParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 166, @"invalid nil value for '%s'", "randomGenerator");
  }
  self->_randomGenerator = a9;
  self->_shouldDraw = 1;
  self->_objectSize.CGFloat width = v14;
  self->_objectSize.CGFloat height = v13;
  self->_slideSize.CGFloat width = width;
  self->_slideSize.CGFloat height = height;
  self->_duration = a7;
  self->_direction = a8;
  if (v16 == *MEMORY[0x263F001B0] && v15 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v16 = ceil(v14 / v17);
    double v15 = ceil(v13 / v24);
  }
  -[TSDGPUParticleSystem p_resizeSystemToFitWithinMaxVerticesWithSystemSize:](self, "p_resizeSystemToFitWithinMaxVerticesWithSystemSize:", v16, v15);
  self->_particleSize.CGFloat width = v17;
  self->_particleSize.CGFloat height = v24;
  self->_particlesWide = (unint64_t)v22;
  self->_particlesHigh = (unint64_t)v23;
  self->_particleCount = (unint64_t)v22 * (unint64_t)v23;
}

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5
{
}

- (void)setupWithTexture:(id)a3 particleTextureSize:(CGSize)a4 reverseDrawOrder:(BOOL)a5 capabilities:(id)a6
{
  BOOL v6 = a5;
  -[TSDGPUParticleSystem p_setupParticleTextureDataWithTexture:capabilities:](self, "p_setupParticleTextureDataWithTexture:capabilities:", a3, a6, a4.width, a4.height);
  [(TSDGPUParticleSystem *)self p_setupParticleDataWithTexture:a3];
  if (v6) {
    [(TSDGPUParticleSystem *)self p_reverseParticleDataDrawOrder];
  }
  if (!self->_isDataBufferInitialized)
  {
    [(TSDGPUParticleSystem *)self p_setupVertexData];
  }
}

- (id)randomGenerator
{
  return self->_randomGenerator;
}

- (NSString)description
{
  v3 = (void *)[MEMORY[0x263EFF980] array];
  if (self->_isInitialized) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"initialized:%@", v4)];
  if (self->_isDataBufferInitialized) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"dataBufferInitialized:%@", v5)];
  if (![(TSDGPUParticleSystem *)self shouldDraw]) {
    [v3 addObject:@"NOT drawing"];
  }
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"visibleParticleCount:%ld", -[TSDGPUParticleSystem visibleParticleCount](self, "visibleParticleCount"))];
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"particleSystemSize:%ldx%ld)", -[TSDGPUParticleSystem particlesWide](self, "particlesWide"), -[TSDGPUParticleSystem particlesHigh](self, "particlesHigh")]);
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"dataBuffer:%@", -[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"))];
  v7.receiver = self;
  v7.super_class = (Class)TSDGPUParticleSystem;
  return (NSString *)[NSString stringWithFormat:@"%@: {%@}", -[TSDGPUParticleSystem description](&v7, sel_description), objc_msgSend(v3, "componentsJoinedByString:", @","];
}

- (unint64_t)indexFromPoint:(CGPoint)a3
{
  return (unint64_t)(a3.x + (double)[(TSDGPUParticleSystem *)self particlesWide] * a3.y);
}

- (CGPoint)indexPointFromIndex:(unint64_t)a3
{
  double v4 = (double)(a3 / [(TSDGPUParticleSystem *)self particlesWide]);
  double v5 = (double)a3 - v4;
  result.y = v4;
  result.x = v5;
  return result;
}

- (NSArray)dataBufferAttributes
{
  v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  double v4 = v3;
  if (self->_positionAttribute) {
    -[NSArray addObject:](v3, "addObject:");
  }
  if (self->_centerAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_texCoordAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_particleTexCoordAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_colorAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_speedAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_rotationAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_scaleAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_lifeSpanAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  if (self->_colorTexCoordAttribute) {
    -[NSArray addObject:](v4, "addObject:");
  }
  return v4;
}

- (CGContext)newContextFromTexture:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 image];
  if (!v3) {
    return 0;
  }
  double v4 = (CGImage *)v3;
  if ([(id)objc_opt_class() willOverrideColors]) {
    return 0;
  }
  double Width = (double)CGImageGetWidth(v4);
  CGImageGetHeight(v4);
  double v5 = TSDBitmapContextCreate(3, Width);
  v8.origin.x = TSDRectWithSize();
  CGContextDrawImage(v5, v8, v4);
  return v5;
}

+ (unint64_t)numberOfVerticesPerParticle
{
  return 4;
}

+ (BOOL)willOverrideGeometry
{
  return 0;
}

- ($94F468A8D4C62B317260615823C2B210)vertexPositionAtVertexIndex:(unint64_t)a3 particleIndexPoint:(CGPoint)a4
{
  double v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.x, a4.y);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem vertexPositionAtVertexIndex:particleIndexPoint:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 310, @"Subclass should implement this method!");
  float v6 = 0.0;
  float v7 = 0.0;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)centerAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem centerAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 315, @"Subclass should implement this method!");
  float v5 = 0.0;
  float v6 = 0.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)willOverrideStartingPoints
{
  return 0;
}

- (CGPoint)startingPointAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem startingPointAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 323, @"Subclass should implement this method!");
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem speedAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 328, @"Subclass should implement this method!");
  TSURandom();
  double v6 = v5;
  TSURandom();
  double v8 = v7;
  TSURandom();
  float v9 = v6;
  float v10 = v8;
  float v12 = v11;
  float v13 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v13;
  return result;
}

- (double)speedMax
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem speedMax]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 332, @"TSDGPUParticleSystem kindly requests you also implement speedMax if you wanna use Speed!");
  return 1.0;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)rotationAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem rotationAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 337, @"Subclass should implement this method!");
  TSURandomBetween();
  double v6 = v5;
  TSURandomBetween();
  double v8 = v7;
  TSURandomBetween();
  float v9 = v6;
  float v10 = v8;
  float v12 = v11;
  float v13 = v9;
  result.var2 = v12;
  result.var1 = v10;
  result.var0 = v13;
  return result;
}

- (double)rotationMax
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem rotationMax]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 341, @"TSDGPUParticleSystem kindly requests you also implement rotationMax if you wanna use Rotation!");
  return 1.0;
}

- (double)scaleAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem scaleAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 346, @"Subclass should implement this method!");

  TSURandom();
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)lifeSpanAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem lifeSpanAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 351, @"Subclass should implement this method!");
  float v5 = 0.0;
  float v6 = 1.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)willOverrideColors
{
  return 0;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)colorAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem colorAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 359, @"Subclass should implement this method!");
  TSURandomBetween();
  double v6 = v5;
  TSURandomBetween();
  double v8 = v7;
  TSURandomBetween();
  double v10 = v9;
  TSURandomBetween();
  float v11 = v6;
  float v12 = v8;
  float v13 = v10;
  float v15 = v14;
  float v16 = v11;
  result.var3 = v15;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v16;
  return result;
}

+ (BOOL)shouldDrawInvisibleParticles
{
  return 0;
}

+ (BOOL)willOverrideVisibilities
{
  return 0;
}

- (BOOL)visibilityAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem visibilityAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 370, @"Subclass should implement this method!");
  return 1;
}

+ (BOOL)willOverrideColorTexCoords
{
  return 0;
}

- ($94F468A8D4C62B317260615823C2B210)colorTexCoordAtIndexPoint:(CGPoint)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.x, a3.y);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem colorTexCoordAtIndexPoint:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 380, @"Subclass should implement this method!");
  float v5 = 0.0;
  float v6 = 0.0;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setupMetalWithShader:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_shouldDraw)
  {
    uint64_t v4 = [a3 pipelineReflectionObject];
    if (v4)
    {
      float v5 = (void *)v4;
      self->_attributesInShader = (NSMutableSet *)[MEMORY[0x263EFF9C0] set];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      float v6 = (void *)[v5 vertexBindings];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            float v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            float v12 = (void *)TSUProtocolCast();
            if (![v11 type] && objc_msgSend(v12, "bufferDataType") == 1)
            {
              long long v20 = 0u;
              long long v21 = 0u;
              long long v18 = 0u;
              long long v19 = 0u;
              float v13 = objc_msgSend((id)objc_msgSend(v12, "bufferStructType", 0), "members");
              uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v19;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v19 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    -[NSMutableSet addObject:](self->_attributesInShader, "addObject:", [*(id *)(*((void *)&v18 + 1) + 8 * j) name]);
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
                }
                while (v15);
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)drawMetalWithEncoder:(id)a3
{
  if (self->_shouldDraw)
  {
    if (!self->_isInitialized) {
      -[TSDGPUParticleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    }
    if (!self->_isDataBufferInitialized) {
      [(TSDGPUParticleSystem *)self p_setupVertexData];
    }
    float v5 = [(TSDGPUParticleSystem *)self dataBuffer];
    [(TSDGPUDataBuffer *)v5 drawWithEncoder:a3 atIndex:0];
  }
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)vertexColorTexture
{
  return self->_vertexColorTexture;
}

- (CGSize)vertexTextureSize
{
  double width = self->_vertexTextureSize.width;
  double height = self->_vertexTextureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)particleCount
{
  return self->_particleCount;
}

- (unint64_t)visibleParticleCount
{
  return self->_visibleParticleCount;
}

- (unint64_t)particlesWide
{
  return self->_particlesWide;
}

- (unint64_t)particlesHigh
{
  return self->_particlesHigh;
}

- (CGSize)particleSize
{
  double width = self->_particleSize.width;
  double height = self->_particleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)objectSize
{
  double width = self->_objectSize.width;
  double height = self->_objectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)slideSize
{
  double width = self->_slideSize.width;
  double height = self->_slideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (TSDGPUDataBufferAttribute)positionAttribute
{
  return self->_positionAttribute;
}

- (TSDGPUDataBufferAttribute)centerAttribute
{
  return self->_centerAttribute;
}

- (TSDGPUDataBufferAttribute)texCoordAttribute
{
  return self->_texCoordAttribute;
}

- (TSDGPUDataBufferAttribute)particleTexCoordAttribute
{
  return self->_particleTexCoordAttribute;
}

- (TSDGPUDataBufferAttribute)colorAttribute
{
  return self->_colorAttribute;
}

- (TSDGPUDataBufferAttribute)lifeSpanAttribute
{
  return self->_lifeSpanAttribute;
}

- (TSDGPUDataBufferAttribute)speedAttribute
{
  return self->_speedAttribute;
}

- (TSDGPUDataBufferAttribute)rotationAttribute
{
  return self->_rotationAttribute;
}

- (TSDGPUDataBufferAttribute)scaleAttribute
{
  return self->_scaleAttribute;
}

- (TSDGPUDataBufferAttribute)colorTexCoordAttribute
{
  return self->_colorTexCoordAttribute;
}

- (TSDGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (BOOL)shouldDraw
{
  return self->_shouldDraw;
}

- (void)p_setupParticleTextureDataWithTexture:(id)a3 capabilities:(id)a4
{
  if (self->_colorTexCoordAttribute && ([(id)objc_opt_class() willOverrideColorTexCoords] & 1) == 0)
  {
    float v6 = [(TSDMetalContext *)self->_metalContext device];
    uint64_t v7 = objc_msgSend(+[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v6), "newFunctionWithName:", @"TSDMetalParticleSystem_ReduceTexture");
    uint64_t v23 = 0;
    uint64_t v8 = (void *)[(MTLDevice *)v6 newComputePipelineStateWithFunction:v7 error:&v23];

    if (v8)
    {
      uint64_t v9 = (void *)[a3 metalTexture];
      unint64_t v10 = (unint64_t)[v9 width] >> 2;
      unint64_t v11 = (unint64_t)[v9 height] >> 2;
      [(TSDGPUParticleSystem *)self particleSize];
      [(TSDGPUParticleSystem *)self particleSize];
      float v12 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"), v10, v11, 0);
      [v12 setUsage:3];
      [v12 setResourceOptions:32];
      [v12 setStorageMode:2];
      self->_vertexColorTexture = (MTLTexture *)[(MTLDevice *)v6 newTextureWithDescriptor:v12];
      self->_vertexTextureSize.double width = (double)v10;
      self->_vertexTextureSize.double height = (double)v11;
      unint64_t v13 = [v8 threadExecutionWidth];
      unint64_t v14 = [v8 maxTotalThreadsPerThreadgroup] / v13;
      unint64_t v15 = (v13 + [v9 width] - 1) / v13;
      unint64_t v16 = (v14 + [v9 height] - 1) / v14;
      double v17 = (void *)[(MTLCommandQueue *)[(TSDMetalContext *)self->_metalContext commandQueue] commandBuffer];
      long long v18 = (void *)[v17 computeCommandEncoder];
      [v18 setComputePipelineState:v8];
      [v18 setTexture:v9 atIndex:0];
      [v18 setTexture:self->_vertexColorTexture atIndex:1];
      v22[0] = v15;
      v22[1] = v16;
      v22[2] = 1;
      v21[0] = v13;
      v21[1] = v14;
      v21[2] = 1;
      [v18 dispatchThreadgroups:v22 threadsPerThreadgroup:v21];
      [v18 endEncoding];
      [v17 commit];
    }
    else
    {
      long long v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v20 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem(Private) p_setupParticleTextureDataWithTexture:capabilities:]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 448, @"Failed to create compute shader");
    }
  }
}

- (void)p_setDataBufferAttribute:(id *)a3 withName:(id)a4 defaultDataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  BOOL v8 = a6;

  *a3 = 0;
  if ([(NSMutableSet *)self->_attributesInShader containsObject:a4])
  {
    unint64_t v13 = (void *)[(id)objc_opt_class() newDataBufferAttributeWithName:a4];
    *a3 = v13;
    if (!v13) {
      *a3 = [[TSDGPUDataBufferAttribute alloc] initWithName:a4 bufferUsage:35044 dataType:a5 normalized:v8 componentCount:a7];
    }
  }
}

- (void)p_setupDataBufferWithParticleCount:(unint64_t)a3 visibleParticleCount:(unint64_t)a4
{
  self->_unint64_t particleCount = a3;
  self->_visibleParticleCount = a4;
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_positionAttribute withName:@"Position" defaultDataType:5 normalized:0 componentCount:2];
  if (!self->_positionAttribute)
  {
    float v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem(Private) p_setupDataBufferWithParticleCount:visibleParticleCount:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 555, @"Always need a position attribute!");
  }
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_centerAttribute withName:@"Center" defaultDataType:5 normalized:0 componentCount:2];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_texCoordAttribute withName:@"TexCoord" defaultDataType:3 normalized:1 componentCount:2];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_particleTexCoordAttribute withName:@"ParticleTexCoord" defaultDataType:3 normalized:1 componentCount:2];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_colorAttribute withName:@"Color" defaultDataType:3 normalized:1 componentCount:4];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_speedAttribute withName:@"Speed" defaultDataType:3 normalized:1 componentCount:3];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_rotationAttribute withName:@"Rotation" defaultDataType:3 normalized:1 componentCount:3];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_scaleAttribute withName:@"Scale" defaultDataType:5 normalized:0 componentCount:1];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_lifeSpanAttribute withName:@"LifeSpan" defaultDataType:3 normalized:1 componentCount:2];
  [(TSDGPUParticleSystem *)self p_setDataBufferAttribute:&self->_colorTexCoordAttribute withName:@"ColorTexCoord" defaultDataType:3 normalized:1 componentCount:2];

  uint64_t v7 = [(id)objc_opt_class() numberOfVerticesPerParticle];
  BOOL v8 = [(TSDGPUParticleSystem *)self dataBufferAttributes];
  unint64_t particleCount = self->_particleCount;
  if (v7 == 4)
  {
    self->_dataBuffer = (TSDGPUDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:v8 quadParticleCount:particleCount device:[(TSDMetalContext *)self->_metalContext device]];
  }
  else
  {
    unint64_t v10 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v8, [(id)objc_opt_class() numberOfVerticesPerParticle] * particleCount, 0, -[TSDMetalContext device](self->_metalContext, "device"));
    self->_dataBuffer = v10;
    [(TSDGPUDataBuffer *)v10 setMetalDrawMode:3];
  }
}

- (void)p_setupParticleDataWithTexture:(id)a3
{
  unint64_t v4 = [(id)objc_opt_class() numberOfVerticesPerParticle];
  if (v4 > 4 || ((1 << v4) & 0x1A) == 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem(Private) p_setupParticleDataWithTexture:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"), 636, @"Only support 1, 3, or 4 vertices per particle!" file lineNumber description];
  }
  double width = self->_objectSize.width;
  double height = self->_objectSize.height;
  double v10 = TSDRectWithSize();
  uint64_t v51 = v11;
  double v52 = v10;
  uint64_t v49 = v13;
  uint64_t v50 = v12;
  BOOL v14 = height != (double)(unint64_t)height || width != (double)(unint64_t)width;
  BOOL v15 = self->_texCoordAttribute != 0;
  char v16 = [(id)objc_opt_class() willOverrideGeometry];
  double v17 = [(TSDGPUParticleSystem *)self dataBufferAttributes];
  long long v18 = v17;
  if (self->_positionAttribute) {
    uint64_t v48 = -[NSArray indexOfObject:](v17, "indexOfObject:");
  }
  else {
    uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_texCoordAttribute) {
    uint64_t v47 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_particleTexCoordAttribute) {
    uint64_t v46 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_centerAttribute) {
    uint64_t v45 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_speedAttribute) {
    uint64_t v44 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_rotationAttribute) {
    uint64_t v43 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_scaleAttribute) {
    uint64_t v42 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_lifeSpanAttribute) {
    uint64_t v41 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_colorAttribute) {
    uint64_t v40 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_colorTexCoordAttribute) {
    uint64_t v39 = -[NSArray indexOfObject:](v18, "indexOfObject:");
  }
  else {
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  unint64_t v38 = [(TSDGPUParticleSystem *)self particlesHigh];
  unint64_t v37 = [(TSDGPUParticleSystem *)self particlesWide];
  [(TSDGPUParticleSystem *)self particleSize];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [(TSDGPUParticleSystem *)self objectSize];
  double v24 = v23;
  double v26 = v25;
  if ([(TSDGPUParticleSystem *)self vertexColorTexture])
  {
    [(TSDGPUParticleSystem *)self vertexTextureSize];
    double v28 = v27;
    double v30 = v29;
    BOOL v31 = v29 != v26 || v27 != v24;
  }
  else
  {
    BOOL v31 = 0;
    double v28 = v24;
    double v30 = v26;
  }
  char v32 = [(id)objc_opt_class() willOverrideVisibilities];
  char v33 = [(id)objc_opt_class() willOverrideStartingPoints];
  char v34 = [(id)objc_opt_class() willOverrideColors];
  char v35 = [(id)objc_opt_class() willOverrideColorTexCoords];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __64__TSDGPUParticleSystem_Private__p_setupParticleDataWithTexture___block_invoke;
  v53[3] = &unk_2646B2200;
  v53[8] = v48;
  v53[9] = v47;
  v53[10] = v46;
  v53[11] = v45;
  v53[12] = v44;
  v53[13] = v43;
  v53[14] = v42;
  v53[15] = v41;
  v53[16] = v40;
  v53[17] = v39;
  v53[18] = v38;
  v53[19] = v37;
  v53[20] = v4;
  v53[21] = v20;
  v53[22] = v22;
  BOOL v54 = v15;
  v53[23] = 0;
  v53[24] = 0;
  *(double *)&v53[25] = width;
  *(double *)&v53[26] = height;
  BOOL v55 = v31;
  *(double *)&v53[27] = v28;
  *(double *)&v53[28] = v30;
  *(double *)&v53[29] = v24;
  *(double *)&v53[30] = v26;
  BOOL v56 = v14;
  *(double *)&v53[31] = v52;
  v53[32] = v51;
  v53[33] = v50;
  v53[34] = v49;
  char v57 = 0;
  v53[35] = 0;
  v53[36] = (unint64_t)width;
  v53[4] = self;
  v53[5] = self;
  char v58 = 0;
  v53[37] = (unint64_t)height;
  v53[38] = 0;
  v53[39] = 0;
  char v59 = v32;
  v53[6] = &v68;
  v53[7] = &v64;
  char v60 = v33;
  char v61 = v16;
  char v62 = v34;
  char v63 = v35;
  [(TSDGPUDataBuffer *)[(TSDGPUParticleSystem *)self dataBuffer] updateMetalDataBufferAttributes:v18 withBlock:v53];
  visibilities = self->_visibilities;
  if (*((unsigned char *)v69 + 24))
  {
    if (visibilities)
    {
      free(visibilities);
      self->_visibilities = 0;
    }
    goto LABEL_49;
  }
  if (!visibilities) {
LABEL_49:
  }
    self->_visibleParticleCount = [(TSDGPUParticleSystem *)self particleCount];
  self->_shouldDraw = *((unsigned char *)v65 + 24);
  self->_isInitialized = 1;
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
}

void __64__TSDGPUParticleSystem_Private__p_setupParticleDataWithTexture___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v266 = *MEMORY[0x263EF8340];
  long long v260 = xmmword_22383A598;
  long long v261 = unk_22383A5A8;
  long long v262 = xmmword_22383A5B8;
  uint64_t v263 = 0;
  long long v258 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v259 = unk_22383A588;
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = a2 + 88 * v3;
    long long v5 = *(_OWORD *)(v4 + 48);
    long long v260 = *(_OWORD *)(v4 + 32);
    long long v261 = v5;
    long long v262 = *(_OWORD *)(v4 + 64);
    uint64_t v263 = *(void *)(v4 + 80);
    long long v6 = *(_OWORD *)(v4 + 16);
    long long v258 = *(_OWORD *)v4;
    long long v259 = v6;
  }
  long long v254 = xmmword_22383A598;
  long long v255 = unk_22383A5A8;
  long long v256 = xmmword_22383A5B8;
  uint64_t v257 = 0;
  long long v252 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v253 = unk_22383A588;
  uint64_t v7 = *(void *)(a1 + 72);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = a2 + 88 * v7;
    long long v9 = *(_OWORD *)(v8 + 48);
    long long v254 = *(_OWORD *)(v8 + 32);
    long long v255 = v9;
    long long v256 = *(_OWORD *)(v8 + 64);
    uint64_t v257 = *(void *)(v8 + 80);
    long long v10 = *(_OWORD *)(v8 + 16);
    long long v252 = *(_OWORD *)v8;
    long long v253 = v10;
  }
  long long v248 = xmmword_22383A598;
  long long v249 = unk_22383A5A8;
  long long v250 = xmmword_22383A5B8;
  uint64_t v251 = 0;
  long long v246 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v247 = unk_22383A588;
  uint64_t v11 = *(void *)(a1 + 80);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = a2 + 88 * v11;
    long long v13 = *(_OWORD *)(v12 + 48);
    long long v248 = *(_OWORD *)(v12 + 32);
    long long v249 = v13;
    long long v250 = *(_OWORD *)(v12 + 64);
    uint64_t v251 = *(void *)(v12 + 80);
    long long v14 = *(_OWORD *)(v12 + 16);
    long long v246 = *(_OWORD *)v12;
    long long v247 = v14;
  }
  long long v242 = xmmword_22383A598;
  long long v243 = unk_22383A5A8;
  long long v244 = xmmword_22383A5B8;
  uint64_t v245 = 0;
  long long v240 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v241 = unk_22383A588;
  uint64_t v15 = *(void *)(a1 + 88);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = a2 + 88 * v15;
    long long v17 = *(_OWORD *)(v16 + 48);
    long long v242 = *(_OWORD *)(v16 + 32);
    long long v243 = v17;
    long long v244 = *(_OWORD *)(v16 + 64);
    uint64_t v245 = *(void *)(v16 + 80);
    long long v18 = *(_OWORD *)(v16 + 16);
    long long v240 = *(_OWORD *)v16;
    long long v241 = v18;
  }
  long long v236 = xmmword_22383A598;
  long long v237 = unk_22383A5A8;
  long long v238 = xmmword_22383A5B8;
  uint64_t v239 = 0;
  long long v234 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v235 = unk_22383A588;
  uint64_t v19 = *(void *)(a1 + 96);
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = a2 + 88 * v19;
    long long v21 = *(_OWORD *)(v20 + 48);
    long long v236 = *(_OWORD *)(v20 + 32);
    long long v237 = v21;
    long long v238 = *(_OWORD *)(v20 + 64);
    uint64_t v239 = *(void *)(v20 + 80);
    long long v22 = *(_OWORD *)(v20 + 16);
    long long v234 = *(_OWORD *)v20;
    long long v235 = v22;
  }
  long long v230 = xmmword_22383A598;
  long long v231 = unk_22383A5A8;
  long long v232 = xmmword_22383A5B8;
  uint64_t v233 = 0;
  long long v228 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v229 = unk_22383A588;
  uint64_t v23 = *(void *)(a1 + 104);
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v24 = a2 + 88 * v23;
    long long v25 = *(_OWORD *)(v24 + 48);
    long long v230 = *(_OWORD *)(v24 + 32);
    long long v231 = v25;
    long long v232 = *(_OWORD *)(v24 + 64);
    uint64_t v233 = *(void *)(v24 + 80);
    long long v26 = *(_OWORD *)(v24 + 16);
    long long v228 = *(_OWORD *)v24;
    long long v229 = v26;
  }
  long long v224 = xmmword_22383A598;
  long long v225 = unk_22383A5A8;
  long long v226 = xmmword_22383A5B8;
  uint64_t v227 = 0;
  long long v222 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v223 = unk_22383A588;
  uint64_t v27 = *(void *)(a1 + 112);
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v28 = a2 + 88 * v27;
    long long v29 = *(_OWORD *)(v28 + 48);
    long long v224 = *(_OWORD *)(v28 + 32);
    long long v225 = v29;
    long long v226 = *(_OWORD *)(v28 + 64);
    uint64_t v227 = *(void *)(v28 + 80);
    long long v30 = *(_OWORD *)(v28 + 16);
    long long v222 = *(_OWORD *)v28;
    long long v223 = v30;
  }
  long long v218 = xmmword_22383A598;
  long long v219 = unk_22383A5A8;
  long long v220 = xmmword_22383A5B8;
  uint64_t v221 = 0;
  long long v216 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v217 = unk_22383A588;
  uint64_t v31 = *(void *)(a1 + 120);
  if (v31 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v32 = a2 + 88 * v31;
    long long v33 = *(_OWORD *)(v32 + 48);
    long long v218 = *(_OWORD *)(v32 + 32);
    long long v219 = v33;
    long long v220 = *(_OWORD *)(v32 + 64);
    uint64_t v221 = *(void *)(v32 + 80);
    long long v34 = *(_OWORD *)(v32 + 16);
    long long v216 = *(_OWORD *)v32;
    long long v217 = v34;
  }
  long long v212 = xmmword_22383A598;
  long long v213 = unk_22383A5A8;
  long long v214 = xmmword_22383A5B8;
  uint64_t v215 = 0;
  long long v210 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v211 = unk_22383A588;
  uint64_t v35 = *(void *)(a1 + 128);
  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v36 = a2 + 88 * v35;
    long long v37 = *(_OWORD *)(v36 + 48);
    long long v212 = *(_OWORD *)(v36 + 32);
    long long v213 = v37;
    long long v214 = *(_OWORD *)(v36 + 64);
    uint64_t v215 = *(void *)(v36 + 80);
    long long v38 = *(_OWORD *)(v36 + 16);
    long long v210 = *(_OWORD *)v36;
    long long v211 = v38;
  }
  long long v206 = xmmword_22383A598;
  long long v207 = unk_22383A5A8;
  long long v208 = xmmword_22383A5B8;
  uint64_t v209 = 0;
  long long v204 = TSDGPUDataBufferAttributeUpdateDataInvalid;
  long long v205 = unk_22383A588;
  uint64_t v39 = *(void *)(a1 + 136);
  if (v39 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v40 = a2 + 88 * v39;
    long long v41 = *(_OWORD *)(v40 + 48);
    long long v206 = *(_OWORD *)(v40 + 32);
    long long v207 = v41;
    long long v208 = *(_OWORD *)(v40 + 64);
    uint64_t v209 = *(void *)(v40 + 80);
    long long v42 = *(_OWORD *)(v40 + 16);
    long long v204 = *(_OWORD *)v40;
    long long v205 = v42;
  }
  unint64_t v43 = *(void *)(a1 + 144);
  if (!v43) {
    return;
  }
  unint64_t v187 = 0;
  unint64_t v44 = *(void *)(a1 + 152);
  double v45 = 1.0;
  do
  {
    if (!v44) {
      goto LABEL_146;
    }
    unint64_t v46 = 0;
    double v47 = (double)v187;
    double v192 = (double)v187;
    do
    {
      uint64_t v48 = objc_msgSend(*(id *)(a1 + 32), "indexFromPoint:", (double)v46, v47, v187);
      uint64_t v49 = *(void *)(a1 + 160);
      double width = *(double *)(a1 + 168);
      double height = *(double *)(a1 + 176);
      double x = width * (double)v46;
      double y = height * v47;
      if (*(unsigned char *)(a1 + 320) && (v46 == *(void *)(a1 + 152) - 1 || v187 == *(void *)(a1 + 144) - 1))
      {
        v267.origin.double x = width * (double)v46;
        v267.origin.double y = y;
        v267.size.double width = *(CGFloat *)(a1 + 168);
        v267.size.double height = *(CGFloat *)(a1 + 176);
        CGRect v268 = CGRectIntersection(v267, *(CGRect *)(a1 + 184));
        double x = v268.origin.x;
        double y = v268.origin.y;
        double width = v268.size.width;
        double height = v268.size.height;
      }
      double v193 = (double)v46;
      if (*(unsigned char *)(a1 + 321))
      {
        float64x2_t v196 = vdivq_f64(*(float64x2_t *)(a1 + 216), *(float64x2_t *)(a1 + 232));
        double v54 = TSDMultiplyPointBySize(x, y, v196.f64[0]);
        double v57 = TSDRectWithOriginAndSize(v55, v54, v56, width * v196.f64[0], vmuld_lane_f64(height, v196, 1));
      }
      else
      {
        double v194 = y;
        double v195 = height;
        double v61 = width;
        double v62 = x;
        if (!*(unsigned char *)(a1 + 322)) {
          goto LABEL_34;
        }
        double v63 = TSDNormalizedPointInRect(x, y, *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
        double v65 = v64;
        double MaxPoint = TSDRectGetMaxPoint(x, y, width, height);
        double v68 = TSDNormalizedPointInRect(MaxPoint, v67, *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
        double v69 = TSDRectWithPoints(v63, v65, v68);
        TSDRectFromNormalizedSubrect(*(double *)(a1 + 248), *(double *)(a1 + 256), *(double *)(a1 + 264), *(double *)(a1 + 272), v69, v70, v71, v72);
      }
      double v62 = TSDRoundedRect(v57, v58, v59, v60);
      double v194 = v73;
      double v195 = v74;
      double v61 = v75;
LABEL_34:
      CGFloat v190 = y;
      CGFloat v191 = x;
      uint64_t v76 = v49 * v48;
      if (*(void *)(a1 + 280))
      {
        double v188 = height;
        double v189 = width;
        int v77 = *(unsigned __int8 *)(a1 + 323);
        v269.origin.double x = v62;
        v269.origin.double y = v194;
        v269.size.double width = v61;
        v269.size.double height = v195;
        double MaxX = CGRectGetMaxX(v269);
        v270.origin.double x = v62;
        v270.origin.double y = v194;
        v270.size.double width = v61;
        v270.size.double height = v195;
        unint64_t MaxY = (unint64_t)CGRectGetMaxY(v270);
        unint64_t v80 = (unint64_t)v194;
        double v81 = 0.0;
        float v83 = 0.0;
        float v82 = 0.0;
        float32x2_t v84 = 0;
        if ((unint64_t)v194 < MaxY)
        {
          unint64_t v85 = (unint64_t)MaxX;
          if (v77) {
            char v86 = 3;
          }
          else {
            char v86 = 2;
          }
          int v87 = ~v80;
          float v83 = 0.0;
          float v82 = 0.0;
          float32x2_t v84 = 0;
          do
          {
            if ((unint64_t)v62 < v85)
            {
              double v88 = ((double)v80 - v194 + (double)v80 - v194) / v195 + -1.0;
              double v89 = 1.0 - v88 * v88;
              unint64_t v90 = (unint64_t)v62;
              do
              {
                if (v90 < *(void *)(a1 + 288))
                {
                  unint64_t v91 = *(void *)(a1 + 296);
                  if (v80 < v91)
                  {
                    if (*(void *)(*(void *)(a1 + 40) + 160))
                    {
                      double v92 = 1.0;
                      if (v61 > 1.0)
                      {
                        double v93 = ((double)v90 - v62 + (double)v90 - v62) / v61 + -1.0;
                        double v92 = v89 + 1.0 - v93 * v93;
                      }
                      double v197 = v92;
                      if (*(unsigned char *)(a1 + 323))
                      {
                        *(float32x2_t *)&double v88 = TSDMetalColor4fWithUIntAndFormat(*(void *)(*(void *)(a1 + 280)+ 8* (int)(v90 + (*(void *)(a1 + 304) >> v86) * (v87 + v91))), *(void *)(a1 + 312));
                      }
                      else
                      {
                        unsigned int v100 = *(_DWORD *)(*(void *)(a1 + 280)
                                         + 4 * (int)(v90 + (*(void *)(a1 + 304) >> v86) * (v87 + v91)));
                        if (*(unsigned char *)(a1 + 324))
                        {
                          *(float *)&double v88 = TSDMetalColor4fWith32BitUIntAndFormat(v100, *(void *)(a1 + 312));
                        }
                        else
                        {
                          int8x8_t v102 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v100), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
                          v103.i64[0] = v102.u32[0];
                          v103.i64[1] = v102.u32[1];
                          double v88 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v103), (float64x2_t)vdupq_n_s64(0x3F700028F62B6A81uLL))));
                          float v95 = (double)*(_DWORD *)(*(void *)(a1 + 280)
                                                                   + 4
                                                                   * (int)(v90
                                                                         + (*(void *)(a1 + 304) >> v86) * (v87 + v91)))
                              * 0.00390640259;
                          float v96 = (double)HIBYTE(v100) * 0.00390640259;
                          int v94 = HIDWORD(v88);
                        }
                      }
                      if (v96 != 0.0)
                      {
                        *(double *)&uint64_t v101 = v96;
                        HIDWORD(v88) = v94;
                        float32x2_t v84 = vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&v88), v197), (float64x2_t)vdupq_lane_s64(v101, 0)), vcvtq_f64_f32(v84)));
                        float v82 = v197 * v95 / *(double *)&v101 + v82;
                        double v88 = v83 + v197 * *(double *)&v101;
                        float v83 = v88;
                        double v81 = v81 + v197;
                      }
                    }
                    else
                    {
                      uint64_t v97 = *(void *)(a1 + 280);
                      uint64_t v98 = (int)(v90 + (*(void *)(a1 + 304) >> v86) * (v87 + v91));
                      if (*(unsigned char *)(a1 + 323))
                      {
                        double v88 = TSDMetalColor4fWithUIntAndFormatOnlyAlpha(*(void *)(v97 + 8 * v98), *(void *)(a1 + 312));
                      }
                      else
                      {
                        LOBYTE(v88) = *(unsigned char *)(v97 + 4 * v98 + 3);
                        double v88 = (double)*(unint64_t *)&v88 * 0.00390640259;
                        float v99 = v88;
                      }
                      float v83 = v83 + v99;
                    }
                  }
                }
                ++v90;
              }
              while (v85 != v90);
            }
            ++v80;
            --v87;
          }
          while (v80 != MaxY);
        }
        int v104 = v83 > 0.0;
        uint64_t v105 = *(void *)(a1 + 40);
        double v47 = v192;
        if (*(void *)(v105 + 160))
        {
          if (v83 <= 0.0 && *(void *)(v105 + 8))
          {
            int v104 = 0;
            double v45 = 1.0;
            double v106 = (double)v46;
            double height = v188;
            double width = v189;
            goto LABEL_79;
          }
          if (*(void *)(a1 + 160))
          {
            unint64_t v107 = 0;
            double v108 = 1.0 / v81;
            if (v81 == 0.0) {
              double v108 = 1.0;
            }
            float v109 = v108 * v83;
            float v110 = v108 * v82;
            float32x2_t v111 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v84), v108));
            do
            {
              long long v200 = v212;
              long long v201 = v213;
              long long v202 = v214;
              uint64_t v203 = v215;
              long long v198 = v210;
              long long v199 = v211;
              TSDGPUUpdateDataSetMetalPoint4DAtIndex((uint64_t)&v198, v76 + v107++, v111.f32[0], v111.f32[1], v110, v109);
            }
            while (v107 < *(void *)(a1 + 160));
          }
        }
        if (!*(void *)(*(void *)(a1 + 40) + 8))
        {
          double v45 = 1.0;
          double v106 = (double)v46;
          double height = v188;
          double width = v189;
          goto LABEL_82;
        }
        double v45 = 1.0;
        double height = v188;
        double width = v189;
        if (v83 <= 0.0)
        {
          int v104 = 0;
          double v106 = (double)v46;
          goto LABEL_79;
        }
      }
      else
      {
        double v47 = v192;
        if (!*(void *)(*(void *)(a1 + 40) + 8))
        {
          int v104 = 1;
          double v106 = (double)v46;
          goto LABEL_82;
        }
      }
      double v106 = (double)v46;
      if (*(unsigned char *)(a1 + 325)) {
        int v104 = objc_msgSend(*(id *)(a1 + 32), "visibilityAtIndexPoint:", v193, v47);
      }
      else {
        int v104 = 1;
      }
LABEL_79:
      uint64_t v112 = *(void *)(a1 + 160);
      if (v112)
      {
        uint64_t v113 = v76;
        do
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + v113++) = v104;
          --v112;
        }
        while (v112);
      }
LABEL_82:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) &= v104;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v104;
      uint64_t v114 = *(void *)(a1 + 40);
      if (v104)
      {
        ++*(void *)(v114 + 88);
      }
      else if (*(void *)(v114 + 8))
      {
        goto LABEL_144;
      }
      if (*(unsigned char *)(a1 + 326))
      {
        objc_msgSend(*(id *)(a1 + 32), "startingPointAtIndexPoint:", v106, v47);
        CGFloat v190 = v116;
        CGFloat v191 = v115;
      }
      if (*(unsigned char *)(a1 + 327))
      {
        unint64_t v117 = *(void *)(a1 + 160);
        if (!v117) {
          goto LABEL_97;
        }
        unint64_t v118 = 0;
        v119 = v265;
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "vertexPositionAtVertexIndex:particleIndexPoint:", v118, v106, v47);
          *(v119 - 1) = v120;
          _DWORD *v119 = v121;
          ++v118;
          unint64_t v117 = *(void *)(a1 + 160);
          v119 += 2;
        }
        while (v118 < v117);
      }
      else
      {
        v271.origin.double x = v191;
        v271.origin.double y = v190;
        v271.size.double width = width;
        v271.size.double height = height;
        double MinX = CGRectGetMinX(v271);
        v272.origin.double x = v191;
        double v45 = 1.0;
        v272.origin.double y = v190;
        v272.size.double width = width;
        v272.size.double height = height;
        CGFloat MinY = CGRectGetMinY(v272);
        float v124 = MinX;
        *(float *)&CGFloat MinY = MinY;
        float v264 = v124;
        v265[0] = LODWORD(MinY);
        unint64_t v117 = *(void *)(a1 + 160);
        if (v117 >= 2)
        {
          v273.origin.double x = v191;
          v273.origin.double y = v190;
          v273.size.double width = width;
          v273.size.double height = height;
          double v125 = CGRectGetMaxX(v273);
          v274.origin.double x = v191;
          v274.origin.double y = v190;
          v274.size.double width = width;
          v274.size.double height = height;
          CGFloat v126 = CGRectGetMinY(v274);
          float v127 = v125;
          *(float *)&CGFloat v126 = v126;
          *(float *)&v265[1] = v127;
          v265[2] = LODWORD(v126);
          v275.origin.double x = v191;
          v275.origin.double y = v190;
          v275.size.double width = width;
          v275.size.double height = height;
          double v128 = CGRectGetMaxX(v275);
          v276.origin.double x = v191;
          v276.origin.double y = v190;
          v276.size.double width = width;
          v276.size.double height = height;
          CGFloat v129 = CGRectGetMaxY(v276);
          float v130 = v128;
          *(float *)&CGFloat v129 = v129;
          *(float *)&v265[3] = v130;
          v265[4] = LODWORD(v129);
          v277.origin.double x = v191;
          v277.origin.double y = v190;
          v277.size.double width = width;
          v277.size.double height = height;
          double v131 = CGRectGetMinX(v277);
          v278.origin.double x = v191;
          double v45 = 1.0;
          v278.origin.double y = v190;
          v278.size.double width = width;
          v278.size.double height = height;
          CGFloat v132 = CGRectGetMaxY(v278);
          float v133 = v131;
          *(float *)&CGFloat v132 = v132;
          *(float *)&v265[5] = v133;
          v265[6] = LODWORD(v132);
          unint64_t v117 = *(void *)(a1 + 160);
        }
      }
      if (v117)
      {
        unint64_t v134 = 0;
        v135 = (float *)v265;
        do
        {
          long long v200 = v260;
          long long v201 = v261;
          long long v202 = v262;
          uint64_t v203 = v263;
          long long v198 = v258;
          long long v199 = v259;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + v134++, *(v135 - 1), *v135);
          unint64_t v117 = *(void *)(a1 + 160);
          v135 += 2;
        }
        while (v134 < v117);
      }
LABEL_97:
      if (*(void *)(*(void *)(a1 + 40) + 136))
      {
        if (*(unsigned char *)(a1 + 327))
        {
          objc_msgSend(*(id *)(a1 + 32), "centerAtIndexPoint:", v106, v47);
          float v137 = v136;
          float MidY = v138;
        }
        else
        {
          v279.origin.double x = v191;
          v279.origin.double y = v190;
          v279.size.double width = width;
          v279.size.double height = height;
          double MidX = CGRectGetMidX(v279);
          v280.origin.double x = v191;
          double v45 = 1.0;
          v280.origin.double y = v190;
          v280.size.double width = width;
          v280.size.double height = height;
          float v137 = MidX;
          float MidY = CGRectGetMidY(v280);
        }
        if (!*(void *)(a1 + 160)) {
          goto LABEL_111;
        }
        unint64_t v141 = 0;
        do
        {
          long long v200 = v242;
          long long v201 = v243;
          long long v202 = v244;
          uint64_t v203 = v245;
          long long v198 = v240;
          long long v199 = v241;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + v141++, v137, MidY);
          unint64_t v117 = *(void *)(a1 + 160);
        }
        while (v141 < v117);
        double v106 = (double)v46;
      }
      uint64_t v142 = *(void *)(a1 + 40);
      if (*(void *)(v142 + 144)) {
        BOOL v143 = v117 == 0;
      }
      else {
        BOOL v143 = 1;
      }
      if (v143) {
        goto LABEL_112;
      }
      unint64_t v144 = 0;
      v145 = (float *)v265;
      do
      {
        double v146 = *(v145 - 1) / *(double *)(a1 + 232);
        float v147 = *v145;
        v145 += 2;
        double v148 = v45 - v147 / *(double *)(a1 + 240);
        *(float *)&double v146 = v146;
        long long v200 = v254;
        long long v201 = v255;
        long long v202 = v256;
        uint64_t v203 = v257;
        *(float *)&double v148 = v148;
        long long v198 = v252;
        long long v199 = v253;
        TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + v144++, *(float *)&v146, *(float *)&v148);
      }
      while (v144 < *(void *)(a1 + 160));
LABEL_111:
      uint64_t v142 = *(void *)(a1 + 40);
      double v106 = (double)v46;
LABEL_112:
      if (*(void *)(v142 + 152))
      {
        long long v200 = v248;
        long long v201 = v249;
        long long v202 = v250;
        uint64_t v203 = v251;
        long long v198 = v246;
        long long v199 = v247;
        TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76, 0.0, 0.0);
        if (*(void *)(a1 + 160) >= 2uLL)
        {
          long long v200 = v248;
          long long v201 = v249;
          long long v202 = v250;
          uint64_t v203 = v251;
          long long v198 = v246;
          long long v199 = v247;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + 1, 1.0, 0.0);
          long long v200 = v248;
          long long v201 = v249;
          long long v202 = v250;
          uint64_t v203 = v251;
          long long v198 = v246;
          long long v199 = v247;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + 2, 1.0, 1.0);
          long long v200 = v248;
          long long v201 = v249;
          long long v202 = v250;
          uint64_t v203 = v251;
          long long v198 = v246;
          long long v199 = v247;
          TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + 3, 0.0, 1.0);
        }
      }
      if (*(void *)(*(void *)(a1 + 40) + 176))
      {
        objc_msgSend(*(id *)(a1 + 32), "speedAtIndexPoint:", v106, v47);
        if (*(void *)(a1 + 160))
        {
          float v152 = v149;
          float v153 = v150;
          float v154 = v151;
          unint64_t v155 = 0;
          do
          {
            long long v200 = v236;
            long long v201 = v237;
            long long v202 = v238;
            uint64_t v203 = v239;
            long long v198 = v234;
            long long v199 = v235;
            TSDGPUUpdateDataSetMetalPoint3DAtIndex((uint64_t)&v198, v76 + v155++, v152, v153, v154);
          }
          while (v155 < *(void *)(a1 + 160));
        }
      }
      if (*(void *)(*(void *)(a1 + 40) + 184))
      {
        objc_msgSend(*(id *)(a1 + 32), "rotationAtIndexPoint:", v106, v47);
        if (*(void *)(a1 + 160))
        {
          float v159 = v156;
          float v160 = v157;
          float v161 = v158;
          unint64_t v162 = 0;
          do
          {
            long long v200 = v230;
            long long v201 = v231;
            long long v202 = v232;
            uint64_t v203 = v233;
            long long v198 = v228;
            long long v199 = v229;
            TSDGPUUpdateDataSetMetalPoint3DAtIndex((uint64_t)&v198, v76 + v162++, v159, v160, v161);
          }
          while (v162 < *(void *)(a1 + 160));
        }
      }
      if (*(void *)(*(void *)(a1 + 40) + 192))
      {
        objc_msgSend(*(id *)(a1 + 32), "scaleAtIndexPoint:", v106, v47);
        if (*(void *)(a1 + 160))
        {
          unint64_t v164 = 0;
          float v165 = v163;
          do
          {
            long long v200 = v224;
            long long v201 = v225;
            long long v202 = v226;
            uint64_t v203 = v227;
            long long v198 = v222;
            long long v199 = v223;
            TSDGPUUpdateDataSetMetalFloatAtIndex((uint64_t)&v198, v76 + v164++, v165);
          }
          while (v164 < *(void *)(a1 + 160));
        }
      }
      if (*(void *)(*(void *)(a1 + 40) + 168))
      {
        objc_msgSend(*(id *)(a1 + 32), "lifeSpanAtIndexPoint:", v106, v47);
        if (*(void *)(a1 + 160))
        {
          float v168 = v166;
          float v169 = v167;
          unint64_t v170 = 0;
          do
          {
            long long v200 = v218;
            long long v201 = v219;
            long long v202 = v220;
            uint64_t v203 = v221;
            long long v198 = v216;
            long long v199 = v217;
            TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + v170++, v168, v169);
          }
          while (v170 < *(void *)(a1 + 160));
        }
      }
      if (*(void *)(*(void *)(a1 + 40) + 160))
      {
        if (*(unsigned char *)(a1 + 328))
        {
          objc_msgSend(*(id *)(a1 + 32), "colorAtIndexPoint:", v193, v47);
          if (*(void *)(a1 + 160))
          {
            float v175 = v171;
            float v176 = v172;
            float v177 = v173;
            float v178 = v174;
            unint64_t v179 = 0;
            do
            {
              long long v200 = v212;
              long long v201 = v213;
              long long v202 = v214;
              uint64_t v203 = v215;
              long long v198 = v210;
              long long v199 = v211;
              TSDGPUUpdateDataSetMetalPoint4DAtIndex((uint64_t)&v198, v76 + v179++, v175, v176, v177, v178);
            }
            while (v179 < *(void *)(a1 + 160));
          }
        }
      }
      v180 = *(void **)(a1 + 40);
      if (v180[25])
      {
        if (*(unsigned char *)(a1 + 329))
        {
          objc_msgSend(v180, "colorTexCoordAtIndexPoint:", v193, v192);
          float v182 = v181;
          float v184 = v183;
        }
        else
        {
          v281.origin.double x = v62;
          v281.origin.double y = v194;
          v281.size.double width = v61;
          v281.size.double height = v195;
          CGFloat v185 = CGRectGetMidX(v281) / *(double *)(a1 + 216);
          v282.origin.double x = v62;
          v282.origin.double y = v194;
          v282.size.double width = v61;
          v282.size.double height = v195;
          float v182 = v185;
          double v45 = 1.0;
          float v184 = 1.0 - CGRectGetMidY(v282) / *(double *)(a1 + 224);
        }
        if (*(void *)(a1 + 160))
        {
          unint64_t v186 = 0;
          do
          {
            long long v200 = v206;
            long long v201 = v207;
            long long v202 = v208;
            uint64_t v203 = v209;
            long long v198 = v204;
            long long v199 = v205;
            TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)&v198, v76 + v186++, v182, v184);
          }
          while (v186 < *(void *)(a1 + 160));
        }
      }
      double v47 = v192;
LABEL_144:
      ++v46;
      unint64_t v44 = *(void *)(a1 + 152);
    }
    while (v46 < v44);
    unint64_t v43 = *(void *)(a1 + 144);
LABEL_146:
    ++v187;
  }
  while (v187 < v43);
}

- (void)p_setupVertexData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(TSDGPUParticleSystem *)self shouldDraw])
  {
    unint64_t v3 = [(TSDGPUParticleSystem *)self particleCount];
    uint64_t v4 = [(id)objc_opt_class() numberOfVerticesPerParticle] * v3;
    visibilities = self->_visibilities;
    unint64_t v6 = v4;
    if (visibilities)
    {
      unint64_t v6 = 0;
      if (v4)
      {
        uint64_t v7 = v4;
        do
        {
          BOOL v8 = *visibilities++;
          v6 += v8;
          --v7;
        }
        while (v7);
      }
    }
    self->_unint64_t particleCount = v6 / [(id)objc_opt_class() numberOfVerticesPerParticle];
    self->_visibleParticleCount = [(TSDGPUParticleSystem *)self particleCount];
    if (v6 != v4)
    {
      long long v9 = [(TSDGPUParticleSystem *)self dataBuffer];
      [(TSDGPUParticleSystem *)self p_setupDataBufferWithParticleCount:self->_particleCount visibleParticleCount:self->_visibleParticleCount];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      obuint64_t j = [(TSDGPUDataBuffer *)v9 vertexAttributes];
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v20 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v20) {
              objc_enumerationMutation(obj);
            }
            long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v14 = -[TSDGPUDataBuffer vertexAttributeNamed:](-[TSDGPUParticleSystem dataBuffer](self, "dataBuffer"), "vertexAttributeNamed:", [v13 name]);
            if (v4)
            {
              id v15 = v14;
              uint64_t v16 = 0;
              uint64_t v17 = 0;
              do
              {
                if (self->_visibilities[v16]) {
                  [(TSDGPUDataBuffer *)[(TSDGPUParticleSystem *)self dataBuffer] setDataForAttribute:v15 atIndex:v17++ fromAttribute:v13 dataBuffer:v9 index:v16];
                }
                ++v16;
              }
              while (v4 != v16);
            }
          }
          uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }

      long long v18 = self->_visibilities;
      if (v18)
      {
        free(v18);
        self->_visibilities = 0;
      }
    }
    self->_isDataBufferInitialized = 1;
  }
}

- (CGSize)p_resizeSystemToFitWithinMaxVerticesWithSystemSize:(CGSize)a3
{
  double height = a3.height;
  unint64_t v4 = (unint64_t)(a3.width * a3.height);
  unint64_t v5 = 0xFFFFuLL / [(id)objc_opt_class() numberOfVerticesPerParticle];
  if (v5 >= v4) {
    unint64_t v5 = v4;
  }
  double v6 = (double)(unint64_t)((double)v5 / height);
  double v7 = height;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)p_reverseParticleDataDrawOrder
{
  if ([(TSDGPUParticleSystem *)self shouldDraw])
  {
    v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSDGPUParticleSystem(Private) p_reverseParticleDataDrawOrder]"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUParticleSystem.m"];
    [v2 handleFailureInFunction:v3, v4, 1022, @"Reversing particle order is not yet implemented, but probably should be if you're calling this!" file lineNumber description];
  }
}

+ (CGSize)p_particleSystemSizeWithRequestedNumber:(unint64_t)a3 objectSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double i = a4.height;
  unint64_t v8 = [(id)objc_opt_class() numberOfVerticesPerParticle];
  unint64_t v9 = 0xFFFF / v8;
  if (0xFFFF / v8 < a3) {
    a3 = 0xFFFF / v8;
  }
  BOOL v10 = width == *MEMORY[0x263F001B0] && i == *(double *)(MEMORY[0x263F001B0] + 8);
  if (!v10
    && ((int v11 = [(id)objc_opt_class() willOverrideStartingPoints], a3 != 1) ? (v12 = v11 == 0) : (v12 = 0),
        v12))
  {
    double v13 = width;
    if (width * height > (double)a3)
    {
      if (a3)
      {
        double v15 = round(sqrt(width * height));
        unint64_t v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
        if (a3 <= v16)
        {
          do
          {
            unint64_t v19 = v16;
            double v15 = v15 + 1.0;
            unint64_t v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
          }
          while (v15 > 2.0 && v16 > a3);
          double v18 = 2.0;
          if (v15 > 2.0)
          {
            uint64_t v20 = v16 - a3;
            if (v20 < 0) {
              uint64_t v20 = -v20;
            }
            uint64_t v21 = v19 - a3;
            if (v21 < 0) {
              uint64_t v21 = -v21;
            }
            if (v20 <= (unint64_t)v21) {
              double v18 = v15;
            }
            else {
              double v18 = v15 + -1.0;
            }
          }
        }
        else
        {
          do
          {
            unint64_t v17 = v16;
            double v15 = v15 + -1.0;
            unint64_t v16 = (unint64_t)(ceil(width / v15) * ceil(height / v15));
          }
          while (v15 > 2.0 && a3 > v16);
          double v18 = 2.0;
          if (v15 > 2.0)
          {
            if (vabdd_f64((double)v16, (double)a3) <= vabdd_f64((double)v17, (double)a3)) {
              double v18 = v15;
            }
            else {
              double v18 = v15 + 1.0;
            }
          }
        }
        double v13 = ceil(width / v18);
        for (double i = ceil(height / v18); v9 < (unint64_t)(v13 * i); double i = ceil(height / v18))
        {
          double v18 = v18 + 1.0;
          double v13 = ceil(width / v18);
        }
      }
      else
      {
        double i = 1.0;
        double v13 = 1.0;
      }
    }
  }
  else
  {
    double v13 = (double)a3;
    double i = 1.0;
  }
  double v14 = i;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)p_logParticleInformation
{
  NSLog((NSString *)@"%@", a2, self);
  visibilities = self->_visibilities;
  unint64_t v4 = [(TSDGPUParticleSystem *)self particleCount];
  if (visibilities)
  {
    if (v4)
    {
      unint64_t v5 = 0;
      LODWORD(v6) = 0;
      do
      {
        double v7 = self->_visibilities;
        uint64_t v6 = v6 + v7[[(id)objc_opt_class() numberOfVerticesPerParticle] * v5++];
      }
      while (v5 < [(TSDGPUParticleSystem *)self particleCount]);
    }
    else
    {
      uint64_t v6 = 0;
    }
    NSLog((NSString *)@"TSDGPUParticleSystem: Particles visible: %i (%.1f%%)", v6, (double)(int)v6 / (double)[(TSDGPUParticleSystem *)self particleCount] * 100.0);
  }
  else
  {
    NSLog((NSString *)@"TSDGPUParticleSystem: Particles visible: %li (ALL)", v4);
  }
}

@end