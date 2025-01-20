@interface TSDMetalTextureRenderer
- (BOOL)shouldDrawOffscreenPass;
- (NSArray)dataBuffers;
- (NSArray)textures;
- (TSDMetalTextureRenderer)initWithTextures:(id)a3 size:(CGSize)a4 context:(id)a5;
- (double)opacity;
- (void)drawWithEncoder:(id)a3 andContext:(id)a4 atPercent:(double)a5;
- (void)p_generateValuesAndBuffers;
- (void)p_setupBlendingShader;
- (void)p_setupOffscreenPass;
- (void)p_setupShader;
- (void)setOpacity:(double)a3;
- (void)setShouldDrawOffscreenPass:(BOOL)a3;
- (void)setTextures:(id)a3;
- (void)updateWithTexture:(id)a3 blendPercent:(double)a4 outgoingTexture:(id)a5 incomingTexture:(id)a6;
- (void)updateWithTexture:(id)a3 opacity:(double)a4;
- (void)updateWithTexture:(id)a3 transform:(CATransform3D *)a4 opacity:(double)a5 cullBackFace:(BOOL)a6;
@end

@implementation TSDMetalTextureRenderer

- (TSDMetalTextureRenderer)initWithTextures:(id)a3 size:(CGSize)a4 context:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TSDMetalTextureRenderer;
  v11 = [(TSDMetalTextureRenderer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metalContext, a5);
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    v12->_opacity = 1.0;
    [(TSDMetalTextureRenderer *)v12 setTextures:v9];
    [(TSDMetalTextureRenderer *)v12 p_setupShader];
  }

  return v12;
}

- (void)setTextures:(id)a3
{
  objc_storeStrong((id *)&self->_textures, a3);

  [(TSDMetalTextureRenderer *)self p_generateValuesAndBuffers];
}

- (void)setShouldDrawOffscreenPass:(BOOL)a3
{
  self->_shouldDrawOffscreenPass = a3;
  if (a3) {
    [(TSDMetalTextureRenderer *)self p_setupOffscreenPass];
  }

  [(TSDMetalTextureRenderer *)self p_generateValuesAndBuffers];
}

- (void)p_generateValuesAndBuffers
{
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_textures, "count"));
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  drawValues = self->_drawValues;
  self->_drawValues = v3;

  memset(&v48, 0, sizeof(v48));
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_textures, "count", TSDTransform3DMakeOrtho((uint64_t)&v48, 0.0, self->_size.width, 0.0, self->_size.height, -1.0, 1.0)));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if ([(NSArray *)self->_textures count])
  {
    unint64_t v6 = 0;
    double v7 = *MEMORY[0x263F7C928];
    double v8 = *(double *)(MEMORY[0x263F7C928] + 8);
    double v9 = *(double *)(MEMORY[0x263F7C928] + 16);
    double v10 = *(double *)(MEMORY[0x263F7C928] + 24);
    __asm { FMOV            V0.2D, #1.0 }
    long long v41 = _Q0;
    do
    {
      v16 = [(NSArray *)self->_textures objectAtIndexedSubscript:v6];
      char v17 = [v16 conformsToProtocol:&unk_26D7EF0E0];

      if (v17)
      {
        long long v46 = 0uLL;
        CATransform3D v44 = v48;
        long long v45 = v41;
        id v47 = 0;
        v18 = [MEMORY[0x263F08D40] valueWithBytes:&v44 objCType:"{?={CATransform3D=dddddddddddddddd}ddB@@}"];
        [(NSMutableArray *)self->_drawValues setObject:v18 atIndexedSubscript:v6];

        v19 = [MEMORY[0x263EFF9D0] null];
        [(NSArray *)v5 setObject:v19 atIndexedSubscript:v6];
      }
      else
      {
        v20 = [(NSArray *)self->_textures objectAtIndexedSubscript:v6];
        [v20 frameOnCanvas];
        CGFloat v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;

        id v47 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        CATransform3D v44 = v48;
        v29 = [(NSArray *)self->_textures objectAtIndexedSubscript:v6];
        [v29 textureOpacity];
        *(void *)&long long v45 = v30;
        *((void *)&v45 + 1) = 0x3FF0000000000000;
        LOBYTE(v46) = 0;
        *((void *)&v46 + 1) = 0;
        id v47 = 0;

        if (self->_shouldDrawOffscreenPass)
        {
          CGFloat v31 = self->_size.height - v24 - v28;
          CATransform3D v42 = v48;
          CATransform3DTranslate(&v43, &v42, v22, v31, 0.0);
          CATransform3D v44 = v43;
          v32 = [(NSArray *)self->_textures objectAtIndexedSubscript:v6];
          [v32 frame];
          TSURectWithSize();
          CGFloat v22 = v33;
          double v35 = v34;
          double v26 = v36;
          double v28 = v37;
        }
        else
        {
          double v35 = self->_size.height - v24 - v28;
        }
        v38 = [MEMORY[0x263F08D40] valueWithBytes:&v44 objCType:"{?={CATransform3D=dddddddddddddddd}ddB@@}"];
        [(NSMutableArray *)self->_drawValues setObject:v38 atIndexedSubscript:v6];

        v19 = [(TSDMetalContext *)self->_metalContext device];
        id v39 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", v19, v22, v35, v26, v28, v7, v8, v9, v10, 0x4014000000000000, 0x4014000000000000);
        [(NSArray *)v5 setObject:v39 atIndexedSubscript:v6];
      }
      ++v6;
    }
    while (v6 < [(NSArray *)self->_textures count]);
  }
  dataBuffers = self->_dataBuffers;
  self->_dataBuffers = v5;
}

- (void)p_setupShader
{
  if (!self->_shader)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F129B0]);
    objc_msgSend(v7, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    [v7 setBlendingEnabled:1];
    [v7 setRgbBlendOperation:0];
    [v7 setAlphaBlendOperation:0];
    [v7 setSourceRGBBlendFactor:1];
    [v7 setSourceAlphaBlendFactor:1];
    [v7 setDestinationRGBBlendFactor:5];
    [v7 setDestinationAlphaBlendFactor:5];
    v3 = [TSDMetalShader alloc];
    v4 = [(TSDMetalContext *)self->_metalContext device];
    v5 = [(TSDMetalShader *)v3 initDefaultTextureAndOpacityShaderWithDevice:v4 colorAttachment:v7];
    shader = self->_shader;
    self->_shader = v5;
  }
}

- (void)p_setupBlendingShader
{
  if (!self->_blendingShader)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F129B0]);
    objc_msgSend(v7, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    [v7 setBlendingEnabled:1];
    [v7 setRgbBlendOperation:0];
    [v7 setAlphaBlendOperation:0];
    [v7 setSourceRGBBlendFactor:1];
    [v7 setSourceAlphaBlendFactor:1];
    [v7 setDestinationRGBBlendFactor:5];
    [v7 setDestinationAlphaBlendFactor:5];
    v3 = [TSDMetalShader alloc];
    v4 = [(TSDMetalContext *)self->_metalContext device];
    v5 = [(TSDMetalShader *)v3 initDefaultBlendShaderWithDevice:v4 colorAttachment:v7 velocityAttachment:0 motionBlur:0];
    blendingShader = self->_blendingShader;
    self->_blendingShader = v5;
  }
}

- (void)p_setupOffscreenPass
{
  if (!self->_renderTarget)
  {
    v3 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", self->_metalContext, self->_size.width, self->_size.height);
    renderTarget = self->_renderTarget;
    self->_renderTarget = v3;

    double width = self->_size.width;
    double height = self->_size.height;
    id v9 = [(TSDMetalContext *)self->_metalContext device];
    id v7 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", v9, 0.0, 0.0, width, height, *MEMORY[0x263F7C928], *(double *)(MEMORY[0x263F7C928] + 8), *(double *)(MEMORY[0x263F7C928] + 16), *(double *)(MEMORY[0x263F7C928] + 24), 0x4014000000000000, 0x4014000000000000);
    encodingDataBuffer = self->_encodingDataBuffer;
    self->_encodingDataBuffer = v7;
  }
}

- (void)drawWithEncoder:(id)a3 andContext:(id)a4 atPercent:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_shader)
  {
    double v10 = [MEMORY[0x263F7C7F0] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]"];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 155, @"invalid nil value for '%s'", "_shader");
  }
  id v13 = v8;
  if ([(NSArray *)self->_textures count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      id v85 = 0;
      id v86 = 0;
      v15 = [(NSMutableArray *)self->_drawValues objectAtIndexedSubscript:v14];
      [v15 getValue:&v74];

      double v16 = v82;
      if (v16 > 0.0) {
        break;
      }
      if (++v14 >= [(NSArray *)self->_textures count]) {
        goto LABEL_7;
      }
    }
    v63 = v13;
    if (self->_shouldDrawOffscreenPass)
    {
      v19 = [v9 commandQueue];
      v20 = [v19 commandBuffer];

      double v21 = [(TSDMetalRenderTarget *)self->_renderTarget passDescriptor];
      v18 = [v20 renderCommandEncoderWithDescriptor:v21];

      if (!v18)
      {
        CGFloat v22 = [MEMORY[0x263F7C7F0] currentHandler];
        double v23 = [NSString stringWithUTF8String:"-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]"];
        double v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m"];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, v24, 175, @"invalid nil value for '%s'", "renderEncoder");
      }
      if (!self->_renderTarget)
      {
        double v25 = [MEMORY[0x263F7C7F0] currentHandler];
        double v26 = [NSString stringWithUTF8String:"-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]"];
        double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 176, @"invalid nil value for '%s'", "_renderTarget");
      }
      v62 = v20;
      if (!self->_encodingDataBuffer)
      {
        double v28 = [MEMORY[0x263F7C7F0] currentHandler];
        v29 = [NSString stringWithUTF8String:"-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]"];
        uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m"];
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 177, @"invalid nil value for '%s'", "_encodingDataBuffer");
      }
    }
    else
    {
      v62 = 0;
      v18 = v13;
    }
    if ([(NSArray *)self->_textures count])
    {
      for (unint64_t i = 0; i < [(NSArray *)self->_textures count]; ++i)
      {
        id v85 = 0;
        id v86 = 0;
        v32 = [(NSMutableArray *)self->_drawValues objectAtIndexedSubscript:i];
        [v32 getValue:&v74];

        [v18 setCullMode:2 * v84];
        double v33 = [(NSArray *)self->_textures objectAtIndexedSubscript:i];
        char v34 = [v33 conformsToProtocol:&unk_26D7EF0E0];

        if (v34)
        {
          double opacity = 1.0;
          if (!self->_shouldDrawOffscreenPass) {
            double opacity = self->_opacity;
          }
          double v36 = v82;
          double v37 = [(NSArray *)self->_textures objectAtIndexedSubscript:i];
          [v37 setOpacity:v36 * opacity];

          v38 = [(NSArray *)self->_textures objectAtIndexedSubscript:i];
          char v39 = objc_opt_respondsToSelector();

          if ((v39 & 1) == 0) {
            goto LABEL_35;
          }
          v40 = [(NSArray *)self->_textures objectAtIndexedSubscript:i];
          objc_msgSend(v40, "renderEffectAtPercent:atBufferIndex:withEncoder:", objc_msgSend(v9, "currentBuffer"), v18, a5);
        }
        else
        {
          v73[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
          v73[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v76), v77);
          v73[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v78), v79);
          v73[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v80), v81);
          if (v86)
          {
            if (!self->_blendingShader)
            {
              id v41 = v9;
              CATransform3D v42 = [MEMORY[0x263F7C7F0] currentHandler];
              CATransform3D v43 = [NSString stringWithUTF8String:"-[TSDMetalTextureRenderer drawWithEncoder:andContext:atPercent:]"];
              CATransform3D v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalTextureRenderer.m"];
              objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, v44, 202, @"invalid nil value for '%s'", "_blendingShader");

              id v9 = v41;
            }
            double v45 = 1.0;
            if (!self->_shouldDrawOffscreenPass) {
              double v45 = self->_opacity;
            }
            float v46 = v82 * v45;
            float v47 = v83;
            *(float *)v72 = v46;
            *(float *)&v72[1] = v47;
            if (v46 <= 0.0) {
              goto LABEL_35;
            }
            CATransform3D v48 = [v85 metalTexture];
            [v18 setFragmentTexture:v48 atIndex:0];

            v49 = [v86 metalTexture];
            [v18 setFragmentTexture:v49 atIndex:1];

            [(TSDMetalShader *)self->_blendingShader setPipelineStateWithEncoder:v18 vertexBytes:v73 fragmentBytes:v72];
            v40 = [(NSArray *)self->_dataBuffers objectAtIndexedSubscript:i];
            objc_msgSend(v40, "drawWithEncoder:atIndex:", v18, -[TSDMetalShader bufferIndex](self->_blendingShader, "bufferIndex"));
          }
          else
          {
            double v50 = 1.0;
            if (!self->_shouldDrawOffscreenPass) {
              double v50 = self->_opacity;
            }
            float v51 = v82 * v50;
            *(float *)v72 = v51;
            if (v51 <= 0.0) {
              goto LABEL_35;
            }
            v52 = [(NSArray *)self->_textures objectAtIndexedSubscript:i];
            v53 = [v52 metalTexture];
            [v18 setFragmentTexture:v53 atIndex:0];

            [(TSDMetalShader *)self->_shader setPipelineStateWithEncoder:v18 vertexBytes:v73 fragmentBytes:v72];
            v40 = [(NSArray *)self->_dataBuffers objectAtIndexedSubscript:i];
            objc_msgSend(v40, "drawWithEncoder:atIndex:", v18, -[TSDMetalShader bufferIndex](self->_shader, "bufferIndex"));
          }
        }

LABEL_35:
      }
    }
    if (self->_shouldDrawOffscreenPass)
    {
      [v18 endEncoding];
      char v17 = v62;
      [v62 commit];
      renderTarget = self->_renderTarget;
      if (renderTarget)
      {
        [(TSDMetalRenderTarget *)renderTarget orthoProjectionWithVerticalFlip:0];
        renderTarget = self->_renderTarget;
        float32x4_t v55 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v70), v71);
        float32x4_t v56 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v69);
        float32x4_t v57 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v66), v67);
        float32x4_t v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v64), v65);
      }
      else
      {
        float32x4_t v58 = 0uLL;
        float32x4_t v57 = 0uLL;
        float32x4_t v56 = 0uLL;
        float32x4_t v55 = 0uLL;
      }
      float64x2_t v74 = (float64x2_t)v58;
      float64x2_t v75 = (float64x2_t)v57;
      float64x2_t v76 = (float64x2_t)v56;
      float64x2_t v77 = (float64x2_t)v55;
      float v59 = self->_opacity;
      *(float *)v73 = v59;
      v60 = [(TSDMetalRenderTarget *)renderTarget textures];
      v61 = [v60 firstObject];
      id v13 = v63;
      [v63 setFragmentTexture:v61 atIndex:0];

      [(TSDMetalShader *)self->_shader setPipelineStateWithEncoder:v63 vertexBytes:&v74 fragmentBytes:v73];
      [(TSDMTLDataBuffer *)self->_encodingDataBuffer drawWithEncoder:v63 atIndex:[(TSDMetalShader *)self->_shader bufferIndex]];
    }
    else
    {
      char v17 = v62;
      id v13 = v63;
    }
  }
  else
  {
LABEL_7:
    char v17 = 0;
    v18 = v13;
  }
}

- (void)updateWithTexture:(id)a3 opacity:(double)a4
{
  id v6 = a3;
  NSUInteger v7 = [(NSArray *)self->_textures indexOfObject:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v8 = v7;
    id v13 = 0;
    id v14 = 0;
    id v9 = [(NSMutableArray *)self->_drawValues objectAtIndexedSubscript:v7];
    [v9 getValue:v11];

    double v12 = a4;
    double v10 = [MEMORY[0x263F08D40] valueWithBytes:v11 objCType:"{?={CATransform3D=dddddddddddddddd}ddB@@}"];
    [(NSMutableArray *)self->_drawValues setObject:v10 atIndexedSubscript:v8];
  }
}

- (void)updateWithTexture:(id)a3 transform:(CATransform3D *)a4 opacity:(double)a5 cullBackFace:(BOOL)a6
{
  id v10 = a3;
  NSUInteger v11 = [(NSArray *)self->_textures indexOfObject:v10];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v12 = v11;
    id v22 = 0;
    id v23 = 0;
    id v13 = [(NSMutableArray *)self->_drawValues objectAtIndexedSubscript:v11];
    [v13 getValue:v19];

    long long v14 = *(_OWORD *)&a4->m33;
    v19[4] = *(_OWORD *)&a4->m31;
    v19[5] = v14;
    long long v15 = *(_OWORD *)&a4->m43;
    v19[6] = *(_OWORD *)&a4->m41;
    v19[7] = v15;
    long long v16 = *(_OWORD *)&a4->m13;
    v19[0] = *(_OWORD *)&a4->m11;
    v19[1] = v16;
    long long v17 = *(_OWORD *)&a4->m23;
    v19[2] = *(_OWORD *)&a4->m21;
    v19[3] = v17;
    double v20 = a5;
    BOOL v21 = a6;
    v18 = [MEMORY[0x263F08D40] valueWithBytes:v19 objCType:"{?={CATransform3D=dddddddddddddddd}ddB@@}"];
    [(NSMutableArray *)self->_drawValues setObject:v18 atIndexedSubscript:v12];
  }
}

- (void)updateWithTexture:(id)a3 blendPercent:(double)a4 outgoingTexture:(id)a5 incomingTexture:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  NSUInteger v13 = [(NSArray *)self->_textures indexOfObject:v10];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v14 = v13;
    id v18 = 0;
    id v19 = 0;
    long long v15 = [(NSMutableArray *)self->_drawValues objectAtIndexedSubscript:v13];
    [v15 getValue:v17];

    *(double *)&v17[17] = a4;
    objc_storeStrong(&v18, a5);
    objc_storeStrong(&v19, a6);
    long long v16 = [MEMORY[0x263F08D40] valueWithBytes:v17 objCType:"{?={CATransform3D=dddddddddddddddd}ddB@@}"];
    [(NSMutableArray *)self->_drawValues setObject:v16 atIndexedSubscript:v14];

    [(TSDMetalTextureRenderer *)self p_setupBlendingShader];
  }
}

- (NSArray)textures
{
  return self->_textures;
}

- (NSArray)dataBuffers
{
  return self->_dataBuffers;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_double opacity = a3;
}

- (BOOL)shouldDrawOffscreenPass
{
  return self->_shouldDrawOffscreenPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBuffers, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_renderTarget, 0);
  objc_storeStrong((id *)&self->_encodingDataBuffer, 0);
  objc_storeStrong((id *)&self->_blendingShader, 0);
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_drawValues, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end