@interface DeepFusionPyramidBaseClass
+ (int)prewarmShaders:(id)a3;
- (DeepFusionPyramidBaseClass)initWithMetalContext:(id)a3;
- (id)outputTextureArray;
- (int)_computeScratchBufferSizeForTextures:(unint64_t)a3 requiredSize:(unint64_t *)a4;
- (int)allocateTextures:(id)a3;
- (int)setWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 numLevels:(unint64_t)a6;
- (unint64_t)_strideForWidth:(unint64_t)a3;
- (void)purgeResources;
- (void)releaseTextures;
- (void)releaseTexturesWithRange:(_NSRange)a3;
@end

@implementation DeepFusionPyramidBaseClass

- (id)outputTextureArray
{
  return self->_outputTextures;
}

- (DeepFusionPyramidBaseClass)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DeepFusionPyramidBaseClass;
  v6 = [(DeepFusionPyramidBaseClass *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[DeepFusionLaplacianPyramidShared sharedInstance];
    uint64_t v9 = [v8 getShaders:v7->_metal];
    shaders = v7->_shaders;
    v7->_shaders = (DeepFusionLaplacianPyramidShaders *)v9;

    if (v7->_shaders)
    {
      *(_OWORD *)&v7->_pixelFormat = 0u;
      *(_OWORD *)&v7->_width = 0u;
      outputTextures = v7->_outputTextures;
      v7->_outputTextures = 0;

      v7->_minTexAlignment = 0;
      v7->_pixelBytes = 0;
      v12 = v7;
    }
    else
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v12 = 0;
      }
      else {
        v12 = v7;
      }
    }
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);

    v12 = 0;
  }
  v14 = v12;

  return v14;
}

- (int)setWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 numLevels:(unint64_t)a6
{
  if (a4 + a3
    && (self->_width = a3,
        self->_height = a4,
        self->_pixelFormat = a5,
        self->_numLevels = a6,
        [(FigMetalContext *)self->_metal device],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    && self->_numLevels)
  {
    v8 = [(FigMetalContext *)self->_metal device];
    self->_minTexAlignment = [v8 minimumLinearTextureAlignmentForPixelFormat:self->_pixelFormat];

    uint64_t v9 = [(FigMetalContext *)self->_metal device];
    MTLPixelFormatGetInfoForDevice();

    self->_pixelBytes = 0;
    FigDebugAssert3();
    return -12785;
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
}

- (unint64_t)_strideForWidth:(unint64_t)a3
{
  return self->_pixelBytes * (a3 + self->_minTexAlignment - 1) / self->_minTexAlignment * self->_minTexAlignment;
}

- (int)_computeScratchBufferSizeForTextures:(unint64_t)a3 requiredSize:(unint64_t *)a4
{
  if (a4 && (*a4 = 0, a3))
  {
    unint64_t v7 = 0;
    for (uint64_t i = 0; i != a3; ++i)
    {
      unint64_t v9 = self->_height >> i;
      v7 += [(DeepFusionPyramidBaseClass *)self _strideForWidth:self->_width >> i] * v9;
    }
    if (v7)
    {
      int result = 0;
      *a4 = v7;
    }
    else
    {
      FigDebugAssert3();
      return -12785;
    }
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
  return result;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[DeepFusionLaplacianPyramidShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (void)purgeResources
{
  self->_outputTextures = 0;
  MEMORY[0x270F9A758]();
}

- (int)allocateTextures:(id)a3
{
  v4 = [(FigMetalContext *)self->_metal allocator];
  int v5 = (void *)[v4 newTextureDescriptor];

  if (!v5)
  {
LABEL_10:
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
    goto LABEL_9;
  }
  if (!self->_pixelFormat || [(NSMutableArray *)self->_outputTextures count])
  {
    FigDebugAssert3();
  }
  else
  {
    v6 = [v5 desc];
    [v6 setCompressionMode:2];

    unint64_t v7 = [v5 desc];
    [v7 setCompressionFootprint:0];

    v8 = [v5 desc];
    [v8 setUsage:7];

    unint64_t pixelFormat = self->_pixelFormat;
    v10 = [v5 desc];
    [v10 setPixelFormat:pixelFormat];

    if (self->_numLevels)
    {
      uint64_t v11 = 0;
      do
      {
        unint64_t v12 = self->_width >> v11;
        v13 = [v5 desc];
        [v13 setWidth:v12];

        unint64_t v14 = self->_height >> v11;
        v15 = [v5 desc];
        [v15 setHeight:v14];

        [v5 setLabel:0];
        objc_super v16 = [(FigMetalContext *)self->_metal allocator];
        v17 = (void *)[v16 newTextureWithDescriptor:v5];

        if (!v17) {
          goto LABEL_10;
        }
        [(NSMutableArray *)self->_outputTextures addObject:v17];
      }
      while (++v11 < self->_numLevels);
    }
  }
  int v18 = 0;
LABEL_9:

  return v18;
}

- (void)releaseTextures
{
  -[DeepFusionPyramidBaseClass releaseTexturesWithRange:](self, "releaseTexturesWithRange:", 0, [(NSMutableArray *)self->_outputTextures count]);
  outputTextures = self->_outputTextures;

  [(NSMutableArray *)outputTextures removeAllObjects];
}

- (void)releaseTexturesWithRange:(_NSRange)a3
{
  if (a3.location < a3.location + a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    do
    {
      v6 = [(NSMutableArray *)self->_outputTextures objectAtIndexedSubscript:location];
      FigMetalDecRef();

      ++location;
      --length;
    }
    while (length);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextures, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end