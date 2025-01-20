@interface TSDMetalShader
- (MTLRenderPipelineReflection)pipelineReflectionObject;
- (MTLRenderPipelineState)pipelineState;
- (NSString)name;
- (TSDMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupUniforms:(BOOL)a9;
- (id)description;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8;
- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6;
- (id)initDefaultBloomShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5;
- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6;
- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6;
- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5;
- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7;
- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6;
- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7;
- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupUniforms:(BOOL)a5;
- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5;
- (unint64_t)bufferIndex;
- (void)p_setDefaultVertexUniforms;
- (void)p_setupPipelineStateWithVertexFunction:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9;
- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9;
- (void)setName:(id)a3;
- (void)setPipelineStateWithEncoder:(id)a3;
- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4;
- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4;
- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5;
@end

@implementation TSDMetalShader

- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupUniforms:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a5)
  {
    id v23 = 0;
    id v24 = 0;
    v11 = (void *)[v9 newRenderPipelineStateWithDescriptor:v8 options:3 reflection:&v24 error:&v23];
    v12 = (MTLRenderPipelineReflection *)v24;
    id v13 = v23;
    if (v12)
    {
      v14 = [(MTLRenderPipelineReflection *)v12 vertexBindings];
      self->_vertexUniformsIndex = [(TSDMetalShader *)self p_indexOfUniformsFromMetalBindings:v14 size:&self->_vertexUniformsSize bufferIndex:&self->_bufferIndex];

      v15 = [(MTLRenderPipelineReflection *)v12 fragmentBindings];
      self->_fragmentUniformsIndex = [(TSDMetalShader *)self p_indexOfUniformsFromMetalBindings:v15 size:&self->_fragmentUniformsSize bufferIndex:0];
    }
    else
    {
      v15 = [MEMORY[0x263F7C7F0] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:]"];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
      [v15 handleFailureInFunction:v16, v17, 89, @"Failed to create pipeline reflection object, error %@", v13 file lineNumber description];
    }
    pipelineReflectionObject = self->_pipelineReflectionObject;
    self->_pipelineReflectionObject = v12;

    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
    id v25 = 0;
    v11 = (void *)[v9 newRenderPipelineStateWithDescriptor:v8 error:&v25];
    id v13 = v25;
    if (v11) {
      goto LABEL_9;
    }
  }
  v19 = [MEMORY[0x263F7C7F0] currentHandler];
  v20 = [NSString stringWithUTF8String:"-[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:]"];
  v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
  [v19 handleFailureInFunction:v20, v21, 98, @"Failed to create pipeline state, error %@", v13 file lineNumber description];

LABEL_9:

  return v11;
}

- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    unint64_t v20 = 0;
    int64_t v21 = -1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = TSUProtocolCast();
        if (![v11 type] && objc_msgSend(v12, "bufferDataType") == 1)
        {
          id v13 = [v11 name];
          int v14 = [v13 isEqualToString:@"uniforms"];

          uint64_t v15 = [v12 index];
          int64_t v16 = v15;
          if (v14)
          {
            unint64_t v8 = [v12 bufferDataSize];
            int64_t v21 = v16;
          }
          else
          {
            unint64_t v20 = v15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
    unint64_t v20 = 0;
    int64_t v21 = -1;
  }
  if (a5) {
    *a5 = v20;
  }
  *a4 = v8;

  return v21;
}

- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9
{
  id v34 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v17)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F129C0]);
    int64_t v21 = v20;
    if (v18)
    {
      long long v22 = [v20 colorAttachments];
      [v22 setObject:v18 atIndexedSubscript:0];

      if (v19)
      {
        long long v23 = [v21 colorAttachments];
        [v23 setObject:v19 atIndexedSubscript:1];
      }
      long long v24 = [(TSDMetalShader *)self name];

      if (v24)
      {
        long long v25 = [(TSDMetalShader *)self name];
        [v21 setLabel:v25];
      }
      v26 = (void *)[v17 newFunctionWithName:v34];
      if (v26)
      {
        [v21 setVertexFunction:v26];
        uint64_t v27 = (void *)[v17 newFunctionWithName:v15];
        if (v27)
        {
          [v21 setFragmentFunction:v27];
          v28 = [(TSDMetalShader *)self p_createPipelineStateWithRenderPipelineDescriptor:v21 device:v16 setupUniforms:a9];
          pipelineState = self->_pipelineState;
          self->_pipelineState = v28;
        }
        else
        {
          pipelineState = [MEMORY[0x263F7C7F0] currentHandler];
          [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
          v31 = id v33 = v16;
          v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
          objc_msgSend(pipelineState, "handleFailureInFunction:file:lineNumber:description:", v31, v32, 173, @"invalid nil value for '%s'", "fragmentFunction");

          id v16 = v33;
        }
      }
      else
      {
        uint64_t v27 = [MEMORY[0x263F7C7F0] currentHandler];
        pipelineState = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v30, 165, @"invalid nil value for '%s'", "vertexFunction");
      }
    }
    else
    {
      v26 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v27 = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
      pipelineState = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, pipelineState, 149, @"invalid nil value for '%s'", "colorAttachment");
    }
  }
  else
  {
    int64_t v21 = [MEMORY[0x263F7C7F0] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
    uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
    [v21 handleFailureInFunction:v26 file:v27 lineNumber:141 description:@"Can't load shaders from nil library"];
  }
}

- (void)p_setupPipelineStateWithVertexFunction:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9
{
  id v31 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v17)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F129C0]);
    int64_t v21 = v20;
    if (v18)
    {
      long long v22 = [v20 colorAttachments];
      [v22 setObject:v18 atIndexedSubscript:0];

      if (v19)
      {
        long long v23 = [v21 colorAttachments];
        [v23 setObject:v19 atIndexedSubscript:1];
      }
      long long v24 = [(TSDMetalShader *)self name];

      if (v24)
      {
        long long v25 = [(TSDMetalShader *)self name];
        [v21 setLabel:v25];
      }
      if (v31)
      {
        objc_msgSend(v21, "setVertexFunction:");
        v26 = (void *)[v17 newFunctionWithName:v15];
        if (v26)
        {
          [v21 setFragmentFunction:v26];
          uint64_t v27 = [(TSDMetalShader *)self p_createPipelineStateWithRenderPipelineDescriptor:v21 device:v16 setupUniforms:a9];
          pipelineState = self->_pipelineState;
          self->_pipelineState = v27;
          goto LABEL_16;
        }
        pipelineState = [MEMORY[0x263F7C7F0] currentHandler];
        v29 = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
        objc_msgSend(pipelineState, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 222, @"invalid nil value for '%s'", "fragmentFunction");
      }
      else
      {
        v26 = [MEMORY[0x263F7C7F0] currentHandler];
        pipelineState = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
        objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v29, 214, @"invalid nil value for '%s'", "vertexFunction");
      }
    }
    else
    {
      v26 = [MEMORY[0x263F7C7F0] currentHandler];
      pipelineState = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
      v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v29, 199, @"invalid nil value for '%s'", "colorAttachment");
    }
  }
  else
  {
    int64_t v21 = [MEMORY[0x263F7C7F0] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]"];
    pipelineState = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
    [v21 handleFailureInFunction:v26 file:pipelineState lineNumber:191 description:@"Can't load shaders from nil library"];
  }
LABEL_16:
}

- (TSDMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupUniforms:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TSDMetalShader;
  int64_t v21 = [(TSDMetalShader *)&v25 init];
  if (v21)
  {
    long long v22 = +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v17];
    objc_storeStrong((id *)&v21->_name, a8);
    v21->_vertexUniformsIndex = -1;
    v21->_fragmentUniformsIndex = -1;
    LOBYTE(v24) = a9;
    [(TSDMetalShader *)v21 p_setupPipelineStateWithVertexShader:v15 fragmentShader:v16 device:v17 library:v22 colorAttachment:v18 velocityAttachment:v19 setupUniforms:v24];
  }
  return v21;
}

- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = [v13 componentsSeparatedByString:@"_"];
  id v15 = [v14 objectAtIndexedSubscript:0];
  id v16 = (void *)[v15 copy];

  LOBYTE(v19) = 1;
  id v17 = [(TSDMetalShader *)self initWithDefaultVertexShader:v13 fragmentShader:v12 device:v11 colorAttachment:v10 velocityAttachment:0 label:v16 setupUniforms:v19];

  return v17;
}

- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  v4 = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:@"TSDMetalShaderDefaultTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Texture Shader" setupUniforms:v7];
  id v5 = v4;
  if (v4) {
    [(TSDMetalShader *)v4 p_setDefaultVertexUniforms];
  }
  return v5;
}

- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  v4 = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:@"TSDMetalShaderDefaultOpacityTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Texture and Opacity Shader" setupUniforms:v7];
  id v5 = v4;
  if (v4)
  {
    [(TSDMetalShader *)v4 p_setDefaultVertexUniforms];
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_22383AB90;
  }
  return v5;
}

- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5
{
  if (a5) {
    uint64_t v6 = @"TSDMetalShaderDefaultHalfSizedRadiusGaussianBlur_FragmentShader";
  }
  else {
    uint64_t v6 = @"TSDMetalShaderDefaultGaussianBlur_FragmentShader";
  }
  if (a5) {
    uint64_t v7 = @"Default Gaussain Blur Shader with Radius 5";
  }
  else {
    uint64_t v7 = @"Default Gaussian Blur Shader with Radius 9";
  }
  LOBYTE(v11) = 0;
  unint64_t v8 = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:v6 device:a3 colorAttachment:a4 velocityAttachment:0 label:v7 setupUniforms:v11];
  uint64_t v9 = v8;
  if (v8)
  {
    [(TSDMetalShader *)v8 p_setDefaultVertexUniforms];
    *(_OWORD *)&v9->_fragmentUniformsIndex = xmmword_22383ABA0;
  }
  return v9;
}

- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5
{
  LOBYTE(v6) = 0;
  id result = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultMotionBlurTexture_VertexShader" fragmentShader:@"TSDMetalShaderDefaultMotionBlurTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:a5 label:@"Default Texture Shader with Motion Blur" setupUniforms:v6];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_22383ABB0;
    *((void *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  BOOL v6 = a6;
  if (v6) {
    id v10 = @"TSDMetalShaderDefaultMotionBlurTexture_VertexShader";
  }
  else {
    id v10 = @"TSDMetalShaderDefaultTexture_VertexShader";
  }
  if (v6) {
    uint64_t v11 = @"TSDMetalShaderDefaultMotionBlurOpacityTexture_FragmentShader";
  }
  else {
    uint64_t v11 = @"TSDMetalShaderDefaultOpacityTexture_FragmentShader";
  }
  LOBYTE(v15) = 0;
  id result = [(TSDMetalShader *)self initWithDefaultVertexShader:v10 fragmentShader:v11 device:a3 colorAttachment:a4 velocityAttachment:a5 label:@"Default Texture and Opacity Shader with Motion Blur" setupUniforms:v15];
  if (result)
  {
    uint64_t v13 = 64;
    if (v6) {
      uint64_t v13 = 192;
    }
    BOOL v14 = !v6;
    *((void *)result + 1) = v14;
    *((void *)result + 2) = v13;
    *((void *)result + 3) = v14;
    *((void *)result + 4) = 4;
    *((void *)result + 7) = v6;
  }
  return result;
}

- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  BOOL v6 = a6;
  if (v6) {
    id v10 = @"TSDMetalShaderDefaultMotionBlurTexture_VertexShader";
  }
  else {
    id v10 = @"TSDMetalShaderDefaultTexture_VertexShader";
  }
  if (v6) {
    uint64_t v11 = @"TSDMetalShaderDefaultMotionBlurBlendTexture_FragmentShader";
  }
  else {
    uint64_t v11 = @"TSDMetalShaderDefaultBlendTexture_FragmentShader";
  }
  if (v6) {
    id v12 = @"Default Texture Blending Shader with Motion Blur";
  }
  else {
    id v12 = @"Default Texture Blending Shader";
  }
  LOBYTE(v16) = 0;
  uint64_t v13 = [(TSDMetalShader *)self initWithDefaultVertexShader:v10 fragmentShader:v11 device:a3 colorAttachment:a4 velocityAttachment:a5 label:v12 setupUniforms:v16];
  BOOL v14 = v13;
  if (v13)
  {
    if (v6)
    {
      *(_OWORD *)&v13->_vertexUniformsIndex = xmmword_22383ABB0;
      v13->_bufferIndex = 1;
    }
    else
    {
      [(TSDMetalShader *)v13 p_setDefaultVertexUniforms];
    }
    *(_OWORD *)&v14->_fragmentUniformsIndex = xmmword_22383ABC0;
  }
  return v14;
}

- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalMotionBlurEffect_Collection_Vertex" fragmentShader:@"TSDMetalMotionBlurEffect_Collection_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Velocity Collection Shader" setupUniforms:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_22383ABD0;
    *(_OWORD *)((char *)result + 24) = xmmword_22383ABE0;
    *((void *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  v4 = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:@"TSDMetalMotionBlurEffect_Visualizer_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Velocity Visualizer Shader" setupUniforms:v7];
  uint64_t v5 = v4;
  if (v4) {
    [(TSDMetalShader *)v4 p_setDefaultVertexUniforms];
  }
  return v5;
}

- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  v4 = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:@"TSDMetalMotionBlurEffect_Neighbor_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Neighbor Max Shader" setupUniforms:v7];
  uint64_t v5 = v4;
  if (v4)
  {
    [(TSDMetalShader *)v4 p_setDefaultVertexUniforms];
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_22383ABD0;
  }
  return v5;
}

- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalMotionBlurEffect_Tile_Vertex" fragmentShader:@"TSDMetalMotionBlurEffect_Tile_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Tile Max Shader" setupUniforms:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_22383ABF0;
    *(_OWORD *)((char *)result + 24) = xmmword_22383AC00;
    *((void *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderMotionBlurSingleDirection_VertexShader" fragmentShader:@"TSDMetalShaderMotionBlurSingleDirection_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Single Direction Motion Blur Shader" setupUniforms:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_22383AC10;
    *(_OWORD *)((char *)result + 24) = xmmword_22383AB90;
    *((void *)result + 7) = 0;
  }
  return result;
}

- (id)initDefaultBloomShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 1;
  return [(TSDMetalShader *)self initWithDefaultVertexShader:@"TSDMetalShaderDefaultTexture_VertexShader" fragmentShader:@"TSDMetalShaderBloom_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Bloom Shader" setupUniforms:v5];
}

- (void)p_setDefaultVertexUniforms
{
  *(_OWORD *)&self->_vertexUniformsIndex = xmmword_22383AC20;
  self->_bufferIndex = 0;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)TSDMetalShader;
  id v20 = [(TSDMetalShader *)&v31 init];
  if (v20)
  {
    id v30 = v15;
    int64_t v21 = +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v16];
    long long v22 = +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:v16 library:v17];
    long long v23 = [v14 componentsSeparatedByString:@"_"];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    uint64_t v25 = [v24 copy];
    name = v20->_name;
    v20->_name = (NSString *)v25;

    v20->_vertexUniformsIndex = -1;
    v20->_fragmentUniformsIndex = -1;
    uint64_t v27 = (void *)[v21 newFunctionWithName:v14];
    if (!v27) {
      uint64_t v27 = (void *)[v22 newFunctionWithName:v14];
    }
    LOBYTE(v29) = 1;
    id v15 = v30;
    [(TSDMetalShader *)v20 p_setupPipelineStateWithVertexFunction:v27 fragmentShader:v30 device:v16 library:v22 colorAttachment:v18 velocityAttachment:v19 setupUniforms:v29];
  }
  return v20;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7
{
  return [(TSDMetalShader *)self initCustomShaderWithVertexShader:a3 fragmentShader:a4 device:a5 library:a6 colorAttachment:a7 velocityAttachment:0];
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6
{
  return [(TSDMetalShader *)self initQuadTextureShaderWithFragmentShader:a3 device:a4 library:a5 colorAttachment:a6 velocityAttachment:0];
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSDMetalShader;
  id v17 = [(TSDMetalShader *)&v27 init];
  if (v17)
  {
    id v18 = +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v13];
    id v19 = +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:v13 library:v14];
    id v20 = [v12 componentsSeparatedByString:@"_"];
    int64_t v21 = [v20 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 copy];
    name = v17->_name;
    v17->_name = (NSString *)v22;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    uint64_t v24 = (void *)[v18 newFunctionWithName:@"TSDMetalShaderDefaultTexture_VertexShader"];
    if (!v24) {
      uint64_t v24 = (void *)[v19 newFunctionWithName:@"TSDMetalShaderDefaultMotionBlurTexture_VertexShader"];
    }
    LOBYTE(v26) = 1;
    [(TSDMetalShader *)v17 p_setupPipelineStateWithVertexFunction:v24 fragmentShader:v12 device:v13 library:v19 colorAttachment:v15 velocityAttachment:v16 setupUniforms:v26];
  }
  return v17;
}

- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSDMetalShader;
  id v17 = [(TSDMetalShader *)&v27 init];
  if (v17)
  {
    id v18 = +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v13];
    id v19 = +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:v13 library:v14];
    id v20 = [v12 componentsSeparatedByString:@"_"];
    int64_t v21 = [v20 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 copy];
    name = v17->_name;
    v17->_name = (NSString *)v22;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    uint64_t v24 = (void *)[v18 newFunctionWithName:@"TSDMetalShaderDefaultMotionBlurTexture_VertexShader"];
    if (!v24) {
      uint64_t v24 = (void *)[v19 newFunctionWithName:@"TSDMetalShaderDefaultMotionBlurTexture_VertexShader"];
    }
    LOBYTE(v26) = 1;
    [(TSDMetalShader *)v17 p_setupPipelineStateWithVertexFunction:v24 fragmentShader:v12 device:v13 library:v19 colorAttachment:v15 velocityAttachment:v16 setupUniforms:v26];
  }
  return v17;
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5
{
  id v8 = a3;
  [v8 pushDebugGroup:self->_name];
  [v8 setRenderPipelineState:self->_pipelineState];
  if ((self->_vertexUniformsIndex & 0x8000000000000000) == 0) {
    objc_msgSend(v8, "setVertexBytes:length:atIndex:", a4, self->_vertexUniformsSize);
  }
  if ((self->_fragmentUniformsIndex & 0x8000000000000000) == 0) {
    objc_msgSend(v8, "setFragmentBytes:length:atIndex:", a5, self->_fragmentUniformsSize);
  }
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4
{
}

- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4
{
}

- (void)setPipelineStateWithEncoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 pushDebugGroup:name];
  [v5 setRenderPipelineState:self->_pipelineState];
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)TSDMetalShader;
  v4 = [(TSDMetalShader *)&v10 description];
  uint64_t v5 = [(TSDMetalShader *)self name];
  BOOL v6 = (void *)v5;
  uint64_t v7 = @"Unnamed";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  id v8 = [v3 stringWithFormat:@"%@: %@", v4, v7];

  return v8;
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (MTLRenderPipelineReflection)pipelineReflectionObject
{
  return self->_pipelineReflectionObject;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionObject, 0);

  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end