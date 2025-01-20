@interface TSDMetalEdgeDistanceField
+ (id)distanceFieldTextureWithTexture:(id)a3 textureSize:(CGSize)a4 maxDistance:(int64_t)a5 edgeInsets:(UIEdgeInsets)a6 downsampleScale:(double)a7 floatTexture:(BOOL)a8 makeCPUReadable:(BOOL)a9 metalContext:(id)a10 capabilities:(id)a11;
+ (void)didEndWithDevice:(id)a3;
+ (void)willBeginWithDevice:(id)a3;
- (TSDMetalEdgeDistanceField)initWithTexture:(id)a3 textureSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5 downsampleScale:(double)a6 metalContext:(id)a7 capabilities:(id)a8;
- (id)p_combinedTexturesWithIndex:(unint64_t)a3 floatTexture:(BOOL)a4 commandBuffer:(id)a5;
- (id)p_gradientTextureWithCommandBuffer:(id)a3;
- (unint64_t)p_floodTextures:(id)a3 currentIndex:(unint64_t)a4 maxDistance:(int64_t)a5 commandBuffer:(id)a6;
- (void)p_dispatchThreadgroupsWithEncoder:(id)a3 pipelineState:(id)a4 texture:(id)a5;
- (void)p_seedWithCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(id)a5 invertSeed:(BOOL)a6;
- (void)p_setupTextures;
- (void)p_writeWithCommandBuffer:(id)a3 intoSquareTexture:(id)a4;
@end

@implementation TSDMetalEdgeDistanceField

+ (void)willBeginWithDevice:(id)a3
{
  uint64_t v3 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  if (!s_TSDMetalEdgeDistanceFieldShaderReferenceCount)
  {
    id v4 = a3;
    v5 = +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v4];
    v6 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_CopyToSquare"];
    id v35 = 0;
    uint64_t v7 = [v4 newComputePipelineStateWithFunction:v6 error:&v35];
    id v8 = v35;
    v9 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
    s_TSDMetalEdgeDistanceField_copyToSquarePipeline = v7;

    v10 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_Seed"];
    id v34 = v8;
    uint64_t v11 = [v4 newComputePipelineStateWithFunction:v10 error:&v34];
    id v12 = v34;

    v13 = (void *)s_TSDMetalEdgeDistanceField_seedPipeline;
    s_TSDMetalEdgeDistanceField_seedPipeline = v11;

    v14 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_Flood"];
    id v33 = v12;
    uint64_t v15 = [v4 newComputePipelineStateWithFunction:v14 error:&v33];
    id v16 = v33;

    v17 = (void *)s_TSDMetalEdgeDistanceField_floodPipeline;
    s_TSDMetalEdgeDistanceField_floodPipeline = v15;

    v18 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_Combine"];
    id v32 = v16;
    uint64_t v19 = [v4 newComputePipelineStateWithFunction:v18 error:&v32];
    id v20 = v32;

    v21 = (void *)s_TSDMetalEdgeDistanceField_combinePipeline;
    s_TSDMetalEdgeDistanceField_combinePipeline = v19;

    v22 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_CombineByte"];
    id v31 = v20;
    uint64_t v23 = [v4 newComputePipelineStateWithFunction:v22 error:&v31];
    id v24 = v31;

    v25 = (void *)s_TSDMetalEdgeDistanceField_combineBytePipeline;
    s_TSDMetalEdgeDistanceField_combineBytePipeline = v23;

    v26 = (void *)[v5 newFunctionWithName:@"TSDMetalEdgeDistanceField_Gradient"];
    id v30 = v24;
    uint64_t v27 = [v4 newComputePipelineStateWithFunction:v26 error:&v30];

    id v28 = v30;
    v29 = (void *)s_TSDMetalEdgeDistanceField_gradientPipeline;
    s_TSDMetalEdgeDistanceField_gradientPipeline = v27;

    uint64_t v3 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  }
  s_TSDMetalEdgeDistanceFieldShaderReferenceCount = v3 + 1;
}

+ (void)didEndWithDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  uint64_t v5 = --s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  if (v4 <= 0)
  {
    id v16 = v3;
    v6 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"+[TSDMetalEdgeDistanceField didEndWithDevice:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:148 description:@"overreleasing pipeline reference count!"];

    id v3 = v16;
    if (s_TSDMetalEdgeDistanceFieldShaderReferenceCount) {
      goto LABEL_3;
    }
  }
  else if (v5)
  {
    goto LABEL_3;
  }
  v9 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
  s_TSDMetalEdgeDistanceField_copyToSquarePipeline = 0;
  id v17 = v3;

  v10 = (void *)s_TSDMetalEdgeDistanceField_seedPipeline;
  s_TSDMetalEdgeDistanceField_seedPipeline = 0;

  uint64_t v11 = (void *)s_TSDMetalEdgeDistanceField_floodPipeline;
  s_TSDMetalEdgeDistanceField_floodPipeline = 0;

  id v12 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
  s_TSDMetalEdgeDistanceField_copyToSquarePipeline = 0;

  v13 = (void *)s_TSDMetalEdgeDistanceField_combinePipeline;
  s_TSDMetalEdgeDistanceField_combinePipeline = 0;

  v14 = (void *)s_TSDMetalEdgeDistanceField_combineBytePipeline;
  s_TSDMetalEdgeDistanceField_combineBytePipeline = 0;

  uint64_t v15 = (void *)s_TSDMetalEdgeDistanceField_gradientPipeline;
  s_TSDMetalEdgeDistanceField_gradientPipeline = 0;

  id v3 = v17;
LABEL_3:
}

- (TSDMetalEdgeDistanceField)initWithTexture:(id)a3 textureSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5 downsampleScale:(double)a6 metalContext:(id)a7 capabilities:(id)a8
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  id v19 = a3;
  id v20 = a7;
  id v21 = a8;
  if (a6 <= 0.0 || a6 > 1.0)
  {
    uint64_t v23 = [MEMORY[0x263F7C7F0] currentHandler];
    id v24 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceField initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:]"];
    v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 163, @"Invalid value for downsampleScale, expected (0,1]: %f"), *(void *)&a6;
  }
  v43.receiver = self;
  v43.super_class = (Class)TSDMetalEdgeDistanceField;
  v26 = [(TSDMetalEdgeDistanceField *)&v43 init];
  uint64_t v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_metalContext, a7);
    objc_storeStrong((id *)&v27->_inputTexture, a3);
    v27->_textureSize.double width = width;
    v27->_textureSize.double height = height;
    double v42 = bottom;
    v27->_edgeInsets.double top = top;
    v27->_edgeInsets.CGFloat left = left;
    double v28 = left;
    v27->_edgeInsets.CGFloat bottom = bottom;
    v27->_edgeInsets.CGFloat right = right;
    double v29 = right;
    id v30 = [v20 device];
    [v21 maximumMetalTextureSizeForDevice:v30];
    double v32 = v31;
    double v34 = v33;

    double v35 = ceil(width * a6);
    if (v35 >= v32)
    {
      a6 = v32 / v35 * a6;
      TSDMultiplySizeScalar(v27->_textureSize.width, v27->_textureSize.height, 1.0 / a6);
    }
    else
    {
      double v36 = ceil(height * a6);
    }
    if (v36 >= v34) {
      a6 = a6 * (v34 / v36);
    }
    v27->_downsampleScale = a6;
    double v37 = ceil(width * a6) - (v28 + v29);
    double v38 = ceil(height * a6) - (top + v42);
    v27->_resultTextureSize.double width = v37;
    v27->_resultTextureSize.double height = v38;
    if (v37 <= v38) {
      double v37 = v38;
    }
    double v39 = (double)(uint64_t)v37;
    if (v32 <= v39) {
      double v39 = v32;
    }
    CGFloat v40 = (double)(uint64_t)v39;
    v27->_squareSize.double width = v40;
    v27->_squareSize.double height = v40;
  }

  return v27;
}

- (void)p_setupTextures
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:110 width:(unint64_t)self->_squareSize.width height:(unint64_t)self->_squareSize.height mipmapped:0];
  [v3 setUsage:0];
  [v3 setStorageMode:2];
  uint64_t v4 = [(TSDMetalContext *)self->_metalContext device];
  uint64_t v5 = (void *)[v4 newTextureWithDescriptor:v3];
  v20[0] = v5;
  v6 = (void *)[v4 newTextureWithDescriptor:v3];
  v20[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  exteriorTextures = self->_exteriorTextures;
  self->_exteriorTextures = v7;

  v9 = (void *)[v4 newTextureWithDescriptor:v3];
  v19[0] = v9;
  v10 = (void *)[v4 newTextureWithDescriptor:v3];
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  interiorTextures = self->_interiorTextures;
  self->_interiorTextures = v11;

  [v3 setWidth:(unint64_t)self->_resultTextureSize.width];
  [v3 setHeight:(unint64_t)self->_resultTextureSize.height];
  [v3 setPixelFormat:115];
  [v3 setStorageMode:0];
  v13 = (MTLTexture *)[v4 newTextureWithDescriptor:v3];
  combineTexture = self->_combineTexture;
  self->_combineTexture = v13;

  uint64_t v15 = (MTLTexture *)[v4 newTextureWithDescriptor:v3];
  resultTexture = self->_resultTexture;
  self->_resultTexture = v15;

  [v3 setPixelFormat:70];
  id v17 = (MTLTexture *)[v4 newTextureWithDescriptor:v3];
  combineByteTexture = self->_combineByteTexture;
  self->_combineByteTexture = v17;
}

- (void)p_dispatchThreadgroupsWithEncoder:(id)a3 pipelineState:(id)a4 texture:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [v8 threadExecutionWidth];
  unint64_t v11 = [v8 maxTotalThreadsPerThreadgroup];

  unint64_t v12 = v11 / v10;
  unint64_t v13 = (v10 + [v7 width] - 1) / v10;
  uint64_t v14 = [v7 height];

  v16[0] = v13;
  v16[1] = (v12 + v14 - 1) / v12;
  v16[2] = 1;
  v15[0] = v10;
  v15[1] = v12;
  v15[2] = 1;
  [v9 dispatchThreadgroups:v16 threadsPerThreadgroup:v15];
}

- (void)p_writeWithCommandBuffer:(id)a3 intoSquareTexture:(id)a4
{
  id v6 = a4;
  id v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:s_TSDMetalEdgeDistanceField_copyToSquarePipeline];
  int32x2_t v8 = vrev64_s32(vmovn_s64((int64x2_t)vcvtq_u64_f64(vnegq_f64(*(float64x2_t *)&self->_edgeInsets.top))));
  [v7 setBytes:&v8 length:8 atIndex:0];
  [v7 setTexture:self->_inputTexture atIndex:0];
  [v7 setTexture:v6 atIndex:1];
  [(TSDMetalEdgeDistanceField *)self p_dispatchThreadgroupsWithEncoder:v7 pipelineState:s_TSDMetalEdgeDistanceField_copyToSquarePipeline texture:v6];

  [v7 endEncoding];
}

- (void)p_seedWithCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(id)a5 invertSeed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  unint64_t v12 = [a3 computeCommandEncoder];
  [v12 setComputePipelineState:s_TSDMetalEdgeDistanceField_seedPipeline];
  uint64_t v13 = 0x3F00008047800000;
  float v14 = (float)v6;
  [v12 setBytes:&v13 length:12 atIndex:0];
  [v12 setTexture:v11 atIndex:0];
  [v12 setTexture:v10 atIndex:1];

  [(TSDMetalEdgeDistanceField *)self p_dispatchThreadgroupsWithEncoder:v12 pipelineState:s_TSDMetalEdgeDistanceField_seedPipeline texture:v11];
  [v12 endEncoding];
}

- (unint64_t)p_floodTextures:(id)a3 currentIndex:(unint64_t)a4 maxDistance:(int64_t)a5 commandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  CGFloat v12 = self->_squareSize.width * 0.5;
  int64_t v13 = (uint64_t)v12;
  if (a5 >= 1) {
    int64_t v13 = a5;
  }
  if (v12 > 16384.0) {
    CGFloat v12 = 16384.0;
  }
  uint64_t v14 = v13 + 1;
  if (v12 >= (double)v14) {
    CGFloat v12 = (double)v14;
  }
  int v15 = vcvtpd_s64_f64(log(v12));
  if (v15 >= 1)
  {
    do
    {
      id v16 = [v11 computeCommandEncoder];
      [v16 setComputePipelineState:s_TSDMetalEdgeDistanceField_floodPipeline];
      int v21 = v15;
      uint64_t v22 = 0x4080000047800000;
      [v16 setBytes:&v21 length:12 atIndex:0];
      id v17 = [v10 objectAtIndexedSubscript:a4];
      a4 = (a4 & 1) == 0;
      v18 = [v10 objectAtIndexedSubscript:a4];
      [v16 setTexture:v17 atIndex:0];
      [v16 setTexture:v18 atIndex:1];
      [(TSDMetalEdgeDistanceField *)self p_dispatchThreadgroupsWithEncoder:v16 pipelineState:s_TSDMetalEdgeDistanceField_floodPipeline texture:v17];
      [v16 endEncoding];

      BOOL v19 = v15 > 1;
      int v15 = v15 >> 1;
    }
    while (v19);
  }

  return a4;
}

- (id)p_combinedTexturesWithIndex:(unint64_t)a3 floatTexture:(BOOL)a4 commandBuffer:(id)a5
{
  BOOL v5 = a4;
  int32x2_t v8 = [a5 computeCommandEncoder];
  id v9 = &s_TSDMetalEdgeDistanceField_combinePipeline;
  if (!v5) {
    id v9 = &s_TSDMetalEdgeDistanceField_combineBytePipeline;
  }
  id v10 = (void *)*v9;
  if (v5) {
    uint64_t v11 = 128;
  }
  else {
    uint64_t v11 = 136;
  }
  id v12 = v10;
  [v8 setComputePipelineState:v12];
  uint64_t v18 = 0x4080000047800000;
  float v13 = 4.0 / self->_squareSize.width;
  float v19 = v13;
  [v8 setBytes:&v18 length:12 atIndex:0];
  id v14 = *(id *)((char *)&self->super.isa + v11);
  int v15 = [(NSArray *)self->_interiorTextures objectAtIndexedSubscript:a3];
  [v8 setTexture:v15 atIndex:0];

  id v16 = [(NSArray *)self->_exteriorTextures objectAtIndexedSubscript:a3];
  [v8 setTexture:v16 atIndex:1];

  [v8 setTexture:v14 atIndex:2];
  [(TSDMetalEdgeDistanceField *)self p_dispatchThreadgroupsWithEncoder:v8 pipelineState:v12 texture:v14];
  [v8 endEncoding];

  return v14;
}

- (id)p_gradientTextureWithCommandBuffer:(id)a3
{
  uint64_t v4 = [a3 computeCommandEncoder];
  [v4 setComputePipelineState:s_TSDMetalEdgeDistanceField_gradientPipeline];
  [v4 setTexture:self->_combineTexture atIndex:0];
  [v4 setTexture:self->_resultTexture atIndex:1];
  [(TSDMetalEdgeDistanceField *)self p_dispatchThreadgroupsWithEncoder:v4 pipelineState:s_TSDMetalEdgeDistanceField_gradientPipeline texture:self->_resultTexture];
  [v4 endEncoding];
  BOOL v5 = self->_resultTexture;

  return v5;
}

+ (id)distanceFieldTextureWithTexture:(id)a3 textureSize:(CGSize)a4 maxDistance:(int64_t)a5 edgeInsets:(UIEdgeInsets)a6 downsampleScale:(double)a7 floatTexture:(BOOL)a8 makeCPUReadable:(BOOL)a9 metalContext:(id)a10 capabilities:(id)a11
{
  BOOL v59 = a8;
  BOOL v60 = a9;
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  double height = a4.height;
  double width = a4.width;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v22 = a10;
  id v23 = a11;
  uint64_t v24 = [v22 device];
  if (!v24)
  {
    v25 = [MEMORY[0x263F7C7F0] currentHandler];
    v26 = [NSString stringWithUTF8String:"+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]"];
    uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 393, @"invalid nil value for '%s'", "metalDevice");
  }
  double v28 = [v22 commandQueue];
  if (!v28)
  {
    double v29 = [MEMORY[0x263F7C7F0] currentHandler];
    id v30 = [NSString stringWithUTF8String:"+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]"];
    double v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 395, @"invalid nil value for '%s'", "commandQueue");
  }
  v58 = v28;
  double v32 = [v28 commandBuffer];
  if (!v32)
  {
    double v33 = [MEMORY[0x263F7C7F0] currentHandler];
    double v34 = [NSString stringWithUTF8String:"+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]"];
    double v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, v35, 397, @"invalid nil value for '%s'", "commandBuffer");
  }
  id v61 = a1;
  v62 = (void *)v24;
  [a1 willBeginWithDevice:v24];
  double v36 = -[TSDMetalEdgeDistanceField initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:]([TSDMetalEdgeDistanceField alloc], "initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:", v21, v22, v23, width, height, top, left, bottom, right, a7);
  [(TSDMetalEdgeDistanceField *)v36 p_setupTextures];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  interiorTextures = v36->_interiorTextures;
  v68[0] = v36->_exteriorTextures;
  v68[1] = interiorTextures;
  double v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    id v55 = v23;
    id v56 = v22;
    id v57 = v21;
    uint64_t v41 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(v38);
        }
        objc_super v43 = *(NSArray **)(*((void *)&v64 + 1) + 8 * i);
        BOOL v44 = v43 == v36->_interiorTextures;
        v45 = [(NSArray *)v43 objectAtIndexedSubscript:0];
        [(TSDMetalEdgeDistanceField *)v36 p_writeWithCommandBuffer:v32 intoSquareTexture:v45];

        v46 = [(NSArray *)v43 objectAtIndexedSubscript:0];
        v47 = [(NSArray *)v43 objectAtIndexedSubscript:1];
        [(TSDMetalEdgeDistanceField *)v36 p_seedWithCommandBuffer:v32 fromTexture:v46 toTexture:v47 invertSeed:v44];

        uint64_t v48 = [(TSDMetalEdgeDistanceField *)v36 p_floodTextures:v43 currentIndex:1 maxDistance:a5 commandBuffer:v32];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v40);
    id v22 = v56;
    id v21 = v57;
    id v23 = v55;
  }
  else
  {
    uint64_t v48 = 0;
  }

  v49 = [(TSDMetalEdgeDistanceField *)v36 p_combinedTexturesWithIndex:v48 floatTexture:v59 commandBuffer:v32];
  v50 = v49;
  if (v59)
  {
    id v51 = [(TSDMetalEdgeDistanceField *)v36 p_gradientTextureWithCommandBuffer:v32];
  }
  else
  {
    id v51 = v49;
  }
  v52 = v51;
  [v32 commit];
  if (v60) {
    [v32 waitUntilCompleted];
  }
  v53 = +[TSDMetalTextureInfo textureInfoWithName:v52 width:v36->_resultTextureSize.width height:v36->_resultTextureSize.height containsMipmaps:0];
  [v61 didEndWithDevice:v62];

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTexture, 0);
  objc_storeStrong((id *)&self->_combineByteTexture, 0);
  objc_storeStrong((id *)&self->_combineTexture, 0);
  objc_storeStrong((id *)&self->_interiorTextures, 0);
  objc_storeStrong((id *)&self->_exteriorTextures, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end