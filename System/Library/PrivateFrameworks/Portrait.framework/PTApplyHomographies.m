@interface PTApplyHomographies
- (PTApplyHomographies)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5;
- (id)updateDisparity:(id)a3 inDisparity:(id)a4;
- (id)updatePTTexture:(id)a3 inPTTexture:(id)a4;
- (void)_ensureSufficientBufferSizesNumberOfRows:(int)a3 numberOfCols:(int)a4;
@end

@implementation PTApplyHomographies

- (PTApplyHomographies)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  id v11 = a3;
  v118.receiver = self;
  v118.super_class = (Class)PTApplyHomographies;
  v12 = [(PTApplyHomographies *)&v118 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(2);
    semaphore = v13->_semaphore;
    v13->_semaphore = (OS_dispatch_semaphore *)v14;

    LODWORD(v16) = v8;
    HIDWORD(v16) = v7;
    *(void *)v13->_inputColorSize = v16;
    *(_WORD *)&v13->_showGrid = 256;
    v17 = [[PTColorConversion alloc] initWithMetalContext:v13->_metalContext];
    colorConversion = v13->_colorConversion;
    v13->_colorConversion = v17;

    if (!v13->_colorConversion)
    {
      v19 = _PTLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:](v19, v57, v58, v59, v60, v61, v62, v63);
      }
      v56 = 0;
      goto LABEL_36;
    }
    v19 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:(unint64_t)v8 height:(unint64_t)v7 mipmapped:0];
    [v19 setUsage:7];
    v20 = [(PTMetalContext *)v13->_metalContext device];
    uint64_t v21 = [v20 newTextureWithDescriptor:v19];
    rgbaLinear = v13->_rgbaLinear;
    v13->_rgbaLinear = (MTLTexture *)v21;

    if (v13->_rgbaLinear)
    {
      [v19 setUsage:7];
      v23 = [(PTMetalContext *)v13->_metalContext device];
      uint64_t v24 = [v23 newTextureWithDescriptor:v19];
      rgbaLinearVIS = v13->_rgbaLinearVIS;
      v13->_rgbaLinearVIS = (MTLTexture *)v24;

      if (v13->_rgbaLinearVIS)
      {
        [v19 setWidth:(unint64_t)width];
        [v19 setHeight:(unint64_t)height];
        [v19 setPixelFormat:25];
        v26 = [(PTMetalContext *)v13->_metalContext device];
        uint64_t v27 = [v26 newTextureWithDescriptor:v19];
        disparityVIS = v13->_disparityVIS;
        v13->_disparityVIS = (MTLTexture *)v27;

        if (v13->_disparityVIS)
        {
          uint64_t v29 = objc_opt_new();
          homographyRenderPassDescriptor = v13->_homographyRenderPassDescriptor;
          v13->_homographyRenderPassDescriptor = (MTLRenderPassDescriptor *)v29;

          v31 = [(MTLRenderPassDescriptor *)v13->_homographyRenderPassDescriptor colorAttachments];
          v32 = [v31 objectAtIndexedSubscript:0];
          [v32 setLoadAction:0];

          v33 = [(MTLRenderPassDescriptor *)v13->_homographyRenderPassDescriptor colorAttachments];
          v34 = [v33 objectAtIndexedSubscript:0];
          [v34 setStoreAction:1];

          v35 = [(MTLRenderPassDescriptor *)v13->_homographyRenderPassDescriptor colorAttachments];
          v36 = [v35 objectAtIndexedSubscript:0];
          objc_msgSend(v36, "setClearColor:", 0.0, 1.0, 0.0, 1.0);

          v37 = objc_alloc_init(MEMORY[0x1E4F352F0]);
          v38 = [(PTMetalContext *)v13->_metalContext functionWithName:@"vertexShaderHomography" withConstants:0];
          [v37 setVertexFunction:v38];

          v39 = [v37 vertexFunction];

          if (v39)
          {
            v40 = [(PTMetalContext *)v13->_metalContext functionWithName:@"fragmentShaderSample" withConstants:0];
            [v37 setFragmentFunction:v40];

            v41 = [v37 fragmentFunction];

            if (v41)
            {
              uint64_t v42 = [(MTLTexture *)v13->_rgbaLinearVIS pixelFormat];
              v43 = [v37 colorAttachments];
              v44 = [v43 objectAtIndexedSubscript:0];
              [v44 setPixelFormat:v42];

              v45 = [(PTMetalContext *)v13->_metalContext device];
              id v117 = 0;
              uint64_t v46 = [v45 newRenderPipelineStateWithDescriptor:v37 error:&v117];
              v47 = v117;
              renderPipelineState = v13->_renderPipelineState;
              v13->_renderPipelineState = (MTLRenderPipelineState *)v46;

              if (v13->_renderPipelineState)
              {
                uint64_t v49 = [(MTLTexture *)v13->_disparityVIS pixelFormat];
                v50 = [v37 colorAttachments];
                v51 = [v50 objectAtIndexedSubscript:0];
                [v51 setPixelFormat:v49];

                v52 = [(PTMetalContext *)v13->_metalContext device];
                v116 = v47;
                uint64_t v53 = [v52 newRenderPipelineStateWithDescriptor:v37 error:&v116];
                v54 = v116;

                renderPipelineStateDisparity = v13->_renderPipelineStateDisparity;
                v13->_renderPipelineStateDisparity = (MTLRenderPipelineState *)v53;

                if (v13->_renderPipelineStateDisparity)
                {
                  v56 = v13;
                }
                else
                {
                  v107 = _PTLogSystem();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
                    -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.8(v107, v108, v109, v110, v111, v112, v113, v114);
                  }

                  v56 = 0;
                }
                v47 = v54;
                goto LABEL_34;
              }
              v99 = _PTLogSystem();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
                -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.7(v99, v100, v101, v102, v103, v104, v105, v106);
              }
            }
            else
            {
              v47 = _PTLogSystem();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.6(v47, v92, v93, v94, v95, v96, v97, v98);
              }
            }
          }
          else
          {
            v47 = _PTLogSystem();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.5(v47, v85, v86, v87, v88, v89, v90, v91);
            }
          }
          v56 = 0;
LABEL_34:

          goto LABEL_35;
        }
        v37 = _PTLogSystem();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:].cold.4(v37, v78, v79, v80, v81, v82, v83, v84);
        }
      }
      else
      {
        v37 = _PTLogSystem();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:](v37, v71, v72, v73, v74, v75, v76, v77);
        }
      }
    }
    else
    {
      v37 = _PTLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[PTApplyHomographies initWithMetalContext:colorSize:disparitySize:](v37, v64, v65, v66, v67, v68, v69, v70);
      }
    }
    v56 = 0;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v56 = 0;
LABEL_37:

  return v56;
}

- (void)_ensureSufficientBufferSizesNumberOfRows:(int)a3 numberOfCols:(int)a4
{
  int v7 = a4 + 2 * a3 * (a4 - 1);
  self->_vertexCountHomography = a4 * a3;
  self->_indexCountHomography = v7;
  unint64_t v8 = (uint64_t)(a4 * a3) << 6;
  if (v8 > [(MTLBuffer *)self->_vertexBufferHomography[0] length])
  {
    v9 = [(PTMetalContext *)self->_metalContext device];
    v10 = (MTLBuffer *)[v9 newBufferWithLength:v8 options:0];
    id v11 = self->_vertexBufferHomography[0];
    self->_vertexBufferHomography[0] = v10;

    v12 = [(PTMetalContext *)self->_metalContext device];
    v13 = (MTLBuffer *)[v12 newBufferWithLength:v8 options:0];
    dispatch_semaphore_t v14 = self->_vertexBufferHomography[1];
    self->_vertexBufferHomography[1] = v13;
  }
  if (self->_numberOfRowsOverscan != a3 || self->_numberOfColsOverscan != a4)
  {
    id v17 = [(PTMetalContext *)self->_metalContext device];
    v15 = (MTLBuffer *)[v17 newBufferWithLength:2 * v7 options:0];
    indexBufferHomography = self->_indexBufferHomography;
    self->_indexBufferHomography = v15;
  }
}

- (id)updatePTTexture:(id)a3 inPTTexture:(id)a4
{
  colorConversion = self->_colorConversion;
  rgbaLinear = self->_rgbaLinear;
  id v8 = a3;
  [(PTColorConversion *)colorConversion convertRGBLinearFromPTTexture:v8 inPTTexture:a4 outRGBA:rgbaLinear];
  rgbaLinearVIS = self->_rgbaLinearVIS;
  v10 = [(MTLRenderPassDescriptor *)self->_homographyRenderPassDescriptor colorAttachments];
  id v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setTexture:rgbaLinearVIS];

  v12 = [v8 renderCommandEncoderWithDescriptor:self->_homographyRenderPassDescriptor];

  [v12 setRenderPipelineState:self->_renderPipelineState];
  [v12 setVertexBuffer:self->_vertexBufferHomography[self->_frameCounter & 1] offset:0 atIndex:0];
  [v12 setVertexBytes:self->_inputColorSize length:8 atIndex:1];
  [v12 setFragmentTexture:self->_rgbaLinear atIndex:0];
  [v12 drawIndexedPrimitives:4 indexCount:self->_indexCountHomography indexType:0 indexBuffer:self->_indexBufferHomography indexBufferOffset:0];
  if (self->_showGrid)
  {
    [v12 setFragmentTexture:self->_textureMarker atIndex:0];
    [v12 setTriangleFillMode:1];
    [v12 drawIndexedPrimitives:4 indexCount:self->_indexCountHomography indexType:0 indexBuffer:self->_indexBufferHomography indexBufferOffset:0];
  }
  [v12 endEncoding];
  v13 = +[PTTexture createRGBA:self->_rgbaLinearVIS];
  [v13 setTransferFunction:*MEMORY[0x1E4F24BE8]];

  return v13;
}

- (id)updateDisparity:(id)a3 inDisparity:(id)a4
{
  disparityVIS = self->_disparityVIS;
  homographyRenderPassDescriptor = self->_homographyRenderPassDescriptor;
  id v8 = a4;
  id v9 = a3;
  v10 = [(MTLRenderPassDescriptor *)homographyRenderPassDescriptor colorAttachments];
  id v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setTexture:disparityVIS];

  v12 = [v9 renderCommandEncoderWithDescriptor:self->_homographyRenderPassDescriptor];

  [v12 setRenderPipelineState:self->_renderPipelineStateDisparity];
  [v12 setVertexBuffer:self->_vertexBufferHomography[self->_frameCounter & 1] offset:0 atIndex:0];
  [v12 setVertexBytes:self->_inputColorSize length:8 atIndex:1];
  [v12 setFragmentTexture:v8 atIndex:0];

  [v12 drawIndexedPrimitives:4 indexCount:self->_indexCountHomography indexType:0 indexBuffer:self->_indexBufferHomography indexBufferOffset:0];
  [v12 endEncoding];
  v13 = self->_disparityVIS;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homographyRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPipelineStateDisparity, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_indexBufferHomography, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_vertexBufferHomography[i + 1], 0);
  objc_storeStrong((id *)&self->_textureMarker, 0);
  objc_storeStrong((id *)&self->_disparityVIS, 0);
  objc_storeStrong((id *)&self->_rgbaLinearVIS, 0);
  objc_storeStrong((id *)&self->_rgbaLinear, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_sharedEvent, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end