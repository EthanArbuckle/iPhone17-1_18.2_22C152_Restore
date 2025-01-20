@interface DeepFusionPyramidBaseClass
+ (int)prewarmShaders:(id)a3;
- (DeepFusionPyramidBaseClass)initWithMetalContext:(id)a3;
- (id)outputTextureArray;
- (int)_computeScratchBufferSizeForTextures:(unint64_t)a3 requiredSize:(unint64_t *)a4;
- (int)allocateTextures:(id)a3;
- (int)setWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 numLevels:(unint64_t)a6;
- (unint64_t)_strideForWidth:(unint64_t)a3;
- (void)makeTexturesAliasable;
- (void)makeTexturesAliasableWithRange:(_NSRange)a3;
- (void)purgeResources;
@end

@implementation DeepFusionPyramidBaseClass

- (id)outputTextureArray
{
  return self->_outputTextures;
}

- (DeepFusionPyramidBaseClass)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DeepFusionPyramidBaseClass;
  v6 = [(DeepFusionPyramidBaseClass *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(DeepFusionLaplacianPyramidShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, (uint64_t)v7->_metal, v13);
    shaders = v7->_shaders;
    v7->_shaders = (DeepFusionLaplacianPyramidShaders *)v14;

    if (v7->_shaders)
    {
      *(_OWORD *)&v7->_pixelFormat = 0u;
      *(_OWORD *)&v7->_width = 0u;
      outputTextures = v7->_outputTextures;
      v7->_outputTextures = 0;

      v7->_minTexAlignment = 0;
      v7->_pixelBytes = 0;
      v17 = v7;
    }
    else
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v17 = 0;
      }
      else {
        v17 = v7;
      }
    }
  }
  else
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);

    v17 = 0;
  }
  v19 = v17;

  return v19;
}

- (int)setWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 numLevels:(unint64_t)a6
{
  if (a4 + a3
    && (self->_width = a3,
        self->_height = a4,
        self->_pixelFormat = a5,
        self->_numLevels = a6,
        objc_msgSend_device(self->_metal, a2, a3, a4),
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    && self->_numLevels)
  {
    v11 = objc_msgSend_device(self->_metal, v8, v9, v10);
    self->_minTexAlignment = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v11, v12, self->_pixelFormat, v13);

    v17 = objc_msgSend_device(self->_metal, v14, v15, v16);
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
      v7 += objc_msgSend__strideForWidth_(self, a2, self->_width >> i, (uint64_t)a4) * v9;
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
  v4 = [DeepFusionLaplacianPyramidShaders alloc];
  unint64_t v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (void)purgeResources
{
  self->_outputTextures = 0;
  MEMORY[0x270F9A758]();
}

- (int)allocateTextures:(id)a3
{
  id v5 = objc_msgSend_allocator(self->_metal, a2, (uint64_t)a3, v3);
  unint64_t v9 = objc_msgSend_newTextureDescriptor(v5, v6, v7, v8);

  if (!v9)
  {
LABEL_10:
    FigDebugAssert3();
    int v64 = FigSignalErrorAt();
    goto LABEL_9;
  }
  if (!self->_pixelFormat || objc_msgSend_count(self->_outputTextures, v10, v11, v12))
  {
    FigDebugAssert3();
  }
  else
  {
    uint64_t v16 = objc_msgSend_desc(v9, v13, v14, v15);
    objc_msgSend_setCompressionMode_(v16, v17, 2, v18);

    v22 = objc_msgSend_desc(v9, v19, v20, v21);
    objc_msgSend_setCompressionFootprint_(v22, v23, 0, v24);

    v28 = objc_msgSend_desc(v9, v25, v26, v27);
    objc_msgSend_setUsage_(v28, v29, 7, v30);

    unint64_t pixelFormat = self->_pixelFormat;
    v35 = objc_msgSend_desc(v9, v32, v33, v34);
    objc_msgSend_setPixelFormat_(v35, v36, pixelFormat, v37);

    if (self->_numLevels)
    {
      uint64_t v41 = 0;
      do
      {
        unint64_t v42 = self->_width >> v41;
        v43 = objc_msgSend_desc(v9, v38, v39, v40);
        objc_msgSend_setWidth_(v43, v44, v42, v45);

        unint64_t v46 = self->_height >> v41;
        v50 = objc_msgSend_desc(v9, v47, v48, v49);
        objc_msgSend_setHeight_(v50, v51, v46, v52);

        objc_msgSend_setLabel_(v9, v53, 0, v54);
        v58 = objc_msgSend_allocator(self->_metal, v55, v56, v57);
        v61 = objc_msgSend_newTextureWithDescriptor_(v58, v59, (uint64_t)v9, v60);

        if (!v61) {
          goto LABEL_10;
        }
        objc_msgSend_addObject_(self->_outputTextures, v62, (uint64_t)v61, v63);
      }
      while (++v41 < self->_numLevels);
    }
  }
  int v64 = 0;
LABEL_9:

  return v64;
}

- (void)makeTexturesAliasable
{
  objc_msgSend_makeTexturesAliasableWithRange_(self, a2, 0, self->_numLevels);
  outputTextures = self->_outputTextures;

  objc_msgSend_removeAllObjects(outputTextures, v3, v4, v5);
}

- (void)makeTexturesAliasableWithRange:(_NSRange)a3
{
  if (a3.location < a3.location + a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    do
    {
      uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_outputTextures, a2, location, a3.length);
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