@interface MTLTelemetryRenderCommandEncoder
- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 commandBuffer:(id)a5 descriptor:(id)a6;
- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (void)accumDrawWithType:(unint64_t)a3 indexType:(unint64_t)a4 primitiveType:(unint64_t)a5 vertexCount:(unint64_t)a6 instanceCount:(unint64_t)a7;
- (void)accumScissorRectTelemetry:(id *)a3 count:(unint64_t)a4;
- (void)accumViewportTelemetry:(id *)a3 count:(unint64_t)a4;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)initTelemetryWithDescriptor:(id)a3 commandBuffer:(id)a4;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthStencilState:(id)a3;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setViewport:(id *)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
@end

@implementation MTLTelemetryRenderCommandEncoder

- (void)initTelemetryWithDescriptor:(id)a3 commandBuffer:(id)a4
{
  v7 = [(MTLToolsObject *)self device];
  v43 = self;
  self->_telemetryDevice = (MTLTelemetryDevice *)v7;
  if (![(MTLDevice *)v7 enableTelemetry]) {
    return;
  }
  -[MTLTelemetryDevice setGLMode:](self->_telemetryDevice, "setGLMode:", *(unsigned __int8 *)([a3 _descriptorPrivate] + 43));
  self->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
  self->_reDraws = 0;
  self->_anisoFragmentSamplers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  self->_clippedMip2DFragmentTextures = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_telemetryPipeline = 0;
  if (!a3) {
    return;
  }
  unsigned int v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 3;
  do
  {
    if (v9 != 8)
    {
      v11 = (void *)(v9 == 9
                   ? [a3 stencilAttachment]
                   : objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "_descriptorAtIndex:", v9));
      v12 = v11;
      if (v11)
      {
        v13 = (void *)[v11 texture];
        if (v13)
        {
          v14 = v13;
          uint64_t p_renderTargetMap = (uint64_t)&v43->_telemetryCommandBuffer->renderTargetMap;
          unint64_t v44 = [v13 pixelFormat];
          v45 = (uint64_t *)&v44;
          v16 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat&&>,std::tuple<>>(p_renderTargetMap, &v44, (uint64_t)&std::piecewise_construct, &v45);
          if (v9 == 9)
          {
            uint64_t v42 = [v14 textureType];
            uint64_t v17 = [v12 loadAction];
            unsigned int v18 = v8;
            uint64_t v19 = [v12 storeAction];
            uint64_t v20 = [v12 stencilResolveFilter];
            uint64_t v21 = (uint64_t)&v16[792 * v42 + 264 * v17 + 44 * v19];
            unsigned int v8 = v18;
            uint64_t v22 = v21 + 176 * v20 + 228120;
          }
          else
          {
            uint64_t v23 = [v14 textureType];
            uint64_t v24 = [v12 loadAction];
            uint64_t v22 = (uint64_t)&v16[396 * v23 + 132 * v24 + 22 * [v12 storeAction] + v10];
          }
          unsigned int v25 = [v14 width];
          if (!v25)
          {
LABEL_22:
            unsigned int v27 = [v14 height];
            if (!v27) {
              goto LABEL_31;
            }
            int v28 = *(_DWORD *)(v22 + 48);
            if (v28)
            {
              if (*(_DWORD *)(v22 + 36) < v27) {
                *(_DWORD *)(v22 + 36) = v27;
              }
              if (*(_DWORD *)(v22 + 32) <= v27) {
                goto LABEL_30;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 36) = v27;
            }
            *(_DWORD *)(v22 + 32) = v27;
LABEL_30:
            *(void *)(v22 + 40) += v27;
            *(_DWORD *)(v22 + 48) = v28 + 1;
LABEL_31:
            unsigned int v29 = [v14 depth];
            if (!v29) {
              goto LABEL_40;
            }
            int v30 = *(_DWORD *)(v22 + 72);
            if (v30)
            {
              if (*(_DWORD *)(v22 + 60) < v29) {
                *(_DWORD *)(v22 + 60) = v29;
              }
              if (*(_DWORD *)(v22 + 56) <= v29) {
                goto LABEL_39;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 60) = v29;
            }
            *(_DWORD *)(v22 + 56) = v29;
LABEL_39:
            *(void *)(v22 + 64) += v29;
            *(_DWORD *)(v22 + 72) = v30 + 1;
LABEL_40:
            unsigned int v31 = [v14 arrayLength];
            if (!v31) {
              goto LABEL_49;
            }
            int v32 = *(_DWORD *)(v22 + 96);
            if (v32)
            {
              if (*(_DWORD *)(v22 + 84) < v31) {
                *(_DWORD *)(v22 + 84) = v31;
              }
              if (*(_DWORD *)(v22 + 80) <= v31) {
                goto LABEL_48;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 84) = v31;
            }
            *(_DWORD *)(v22 + 80) = v31;
LABEL_48:
            *(void *)(v22 + 88) += v31;
            *(_DWORD *)(v22 + 96) = v32 + 1;
LABEL_49:
            unsigned int v33 = [v14 sampleCount];
            if (!v33) {
              goto LABEL_58;
            }
            int v34 = *(_DWORD *)(v22 + 120);
            if (v34)
            {
              if (*(_DWORD *)(v22 + 108) < v33) {
                *(_DWORD *)(v22 + 108) = v33;
              }
              if (*(_DWORD *)(v22 + 104) <= v33) {
                goto LABEL_57;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 108) = v33;
            }
            *(_DWORD *)(v22 + 104) = v33;
LABEL_57:
            *(void *)(v22 + 112) += v33;
            *(_DWORD *)(v22 + 120) = v34 + 1;
LABEL_58:
            unsigned int v35 = [v12 level];
            if (!v35) {
              goto LABEL_67;
            }
            int v36 = *(_DWORD *)(v22 + 168);
            if (v36)
            {
              if (*(_DWORD *)(v22 + 156) < v35) {
                *(_DWORD *)(v22 + 156) = v35;
              }
              if (*(_DWORD *)(v22 + 152) <= v35) {
                goto LABEL_66;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 156) = v35;
            }
            *(_DWORD *)(v22 + 152) = v35;
LABEL_66:
            *(void *)(v22 + 160) += v35;
            *(_DWORD *)(v22 + 168) = v36 + 1;
LABEL_67:
            unsigned int v37 = [v12 slice];
            if (!v37)
            {
LABEL_76:
              ++*(_DWORD *)v22;
              ++v8;
              goto LABEL_77;
            }
            int v38 = *(_DWORD *)(v22 + 144);
            if (v38)
            {
              if (*(_DWORD *)(v22 + 132) < v37) {
                *(_DWORD *)(v22 + 132) = v37;
              }
              if (*(_DWORD *)(v22 + 128) <= v37) {
                goto LABEL_75;
              }
            }
            else
            {
              *(_DWORD *)(v22 + 132) = v37;
            }
            *(_DWORD *)(v22 + 128) = v37;
LABEL_75:
            *(void *)(v22 + 136) += v37;
            *(_DWORD *)(v22 + 144) = v38 + 1;
            goto LABEL_76;
          }
          int v26 = *(_DWORD *)(v22 + 24);
          if (v26)
          {
            if (*(_DWORD *)(v22 + 12) < v25) {
              *(_DWORD *)(v22 + 12) = v25;
            }
            if (*(_DWORD *)(v22 + 8) <= v25) {
              goto LABEL_21;
            }
          }
          else
          {
            *(_DWORD *)(v22 + 12) = v25;
          }
          *(_DWORD *)(v22 + 8) = v25;
LABEL_21:
          *(void *)(v22 + 16) += v25;
          *(_DWORD *)(v22 + 24) = v26 + 1;
          goto LABEL_22;
        }
      }
    }
LABEL_77:
    ++v9;
    v10 += 3168;
  }
  while (v9 != 10);
  if (!v8) {
    goto LABEL_87;
  }
  attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
  if (!attachmentCount->count)
  {
    attachmentCount->max = v8;
    attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
LABEL_85:
    attachmentCount->min = v8;
    goto LABEL_86;
  }
  if (v8 > attachmentCount->max)
  {
    attachmentCount->max = v8;
    attachmentCount = v43->_telemetryCommandBuffer->attachmentCount;
  }
  if (v8 < attachmentCount->min) {
    goto LABEL_85;
  }
LABEL_86:
  v43->_telemetryCommandBuffer->attachmentCount->total += v8;
  ++v43->_telemetryCommandBuffer->attachmentCount->count;
LABEL_87:
  unsigned int v40 = [a3 renderTargetArrayLength];
  if (v40)
  {
    renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
    if (renderTargetArrayLengthDistribution->count)
    {
      if (renderTargetArrayLengthDistribution->max < v40)
      {
        renderTargetArrayLengthDistribution->max = v40;
        renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
      }
      if (renderTargetArrayLengthDistribution->min <= v40)
      {
LABEL_95:
        v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution->total += v40;
        ++v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution->count;
        return;
      }
    }
    else
    {
      renderTargetArrayLengthDistribution->max = v40;
      renderTargetArrayLengthDistribution = v43->_telemetryCommandBuffer->renderTargetArrayLengthDistribution;
    }
    renderTargetArrayLengthDistribution->min = v40;
    goto LABEL_95;
  }
}

- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 commandBuffer:(id)a5 descriptor:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  unsigned int v8 = [(MTLToolsRenderCommandEncoder *)&v11 initWithRenderCommandEncoder:a3 parent:a4];
  uint64_t v9 = v8;
  if (v8) {
    [(MTLTelemetryRenderCommandEncoder *)v8 initTelemetryWithDescriptor:a6 commandBuffer:a5];
  }
  return v9;
}

- (MTLTelemetryRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v10, sel_initWithRenderCommandEncoder_parent_descriptor_, a3);
  unsigned int v8 = v7;
  if (v7) {
    [(MTLTelemetryRenderCommandEncoder *)v7 initTelemetryWithDescriptor:a5 commandBuffer:a4];
  }
  return v8;
}

- (void)setRenderPipelineState:(id)a3
{
  if (a3)
  {
    [a3 accumulateUsage];
    if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry])
    {

      self->_telemetryPipeline = (MTLTelemetryRenderPipelineState *)a3;
    }
  }
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setRenderPipelineState:v6];
}

- (void)setDepthStencilState:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 setDepthStencilState:v5];
}

- (void)setDepthClipMode:(unint64_t)a3
{
  telemetryCommandBuffer = self->_telemetryCommandBuffer;
  unsigned int depthClipModeClampCount = telemetryCommandBuffer->depthClipModeClampCount;
  if (a3 == 1) {
    ++depthClipModeClampCount;
  }
  telemetryCommandBuffer->unsigned int depthClipModeClampCount = depthClipModeClampCount;
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setDepthClipModeSPI:a3];
}

- (void)accumDrawWithType:(unint64_t)a3 indexType:(unint64_t)a4 primitiveType:(unint64_t)a5 vertexCount:(unint64_t)a6 instanceCount:(unint64_t)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  telemetryCommandBuffer = self->_telemetryCommandBuffer;
  drawDistribution = telemetryCommandBuffer->drawDistribution;
  ++telemetryCommandBuffer->cbDraws;
  ++self->_reDraws;
  if (a3 != 2)
  {
    if (!a6) {
      goto LABEL_11;
    }
    unint64_t v10 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    int v13 = *(_DWORD *)(v10 + 24);
    objc_super v11 = (_DWORD *)(v10 + 24);
    int v12 = v13;
    v14 = v11 - 4;
    v15 = v11 - 3;
    if (v13)
    {
      if (*v15 < a6) {
        _DWORD *v15 = a6;
      }
      if (*v14 <= a6) {
        goto LABEL_10;
      }
    }
    else
    {
      _DWORD *v15 = a6;
    }
    _DWORD *v14 = a6;
LABEL_10:
    unint64_t v16 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    *(void *)(v16 + 16) += a6;
    _DWORD *v11 = v12 + 1;
LABEL_11:
    if (!a7) {
      goto LABEL_20;
    }
    unint64_t v17 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    int v20 = *(_DWORD *)(v17 + 48);
    unsigned int v18 = (_DWORD *)(v17 + 48);
    int v19 = v20;
    uint64_t v21 = v18 - 4;
    uint64_t v22 = v18 - 3;
    if (v20)
    {
      if (*v22 < a7) {
        *uint64_t v22 = a7;
      }
      if (*v21 <= a7) {
        goto LABEL_19;
      }
    }
    else
    {
      *uint64_t v22 = a7;
    }
    *uint64_t v21 = a7;
LABEL_19:
    unint64_t v23 = (unint64_t)&drawDistribution->var0[a5][a4][a3];
    *(void *)(v23 + 40) += a7;
    *unsigned int v18 = v19 + 1;
  }
LABEL_20:
  ++drawDistribution->var0[a5][a4][a3].var0;
  telemetryPipeline = self->_telemetryPipeline;
  if (!telemetryPipeline) {
    return;
  }
  if (!LOBYTE(telemetryPipeline->device))
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    anisoFragmentSamplers = self->_anisoFragmentSamplers;
    uint64_t v34 = [(NSMutableSet *)anisoFragmentSamplers countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (!v34) {
      return;
    }
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v43;
LABEL_34:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v43 != v36) {
        objc_enumerationMutation(anisoFragmentSamplers);
      }
      if ([*(id *)&self->_telemetryPipeline->hasAnisoConstantSampler containsObject:*(void *)(*((void *)&v42 + 1) + 8 * v37)])break; {
      if (v35 == ++v37)
      }
      {
        uint64_t v35 = [(NSMutableSet *)anisoFragmentSamplers countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v35) {
          goto LABEL_34;
        }
        return;
      }
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  clippedMip2DFragmentTextures = self->_clippedMip2DFragmentTextures;
  uint64_t v26 = [(NSMutableDictionary *)clippedMip2DFragmentTextures countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(clippedMip2DFragmentTextures);
        }
        uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if ([(NSSet *)self->_telemetryPipeline->activeFragmentSamplers containsObject:v30])
        {
          anisoClippedCounts = self->_telemetryCommandBuffer->anisoClippedCounts;
          uint64_t v32 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clippedMip2DFragmentTextures, "objectForKeyedSubscript:", v30), "unsignedIntegerValue");
          ++anisoClippedCounts->var0[v32];
        }
      }
      uint64_t v27 = [(NSMutableDictionary *)clippedMip2DFragmentTextures countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v27);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:1 indexType:a5 primitiveType:a3 vertexCount:a4 instanceCount:a8];
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a6 baseObject];

  [v15 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v16 indexBufferOffset:a7 instanceCount:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:1 indexType:a5 primitiveType:a3 vertexCount:a4 instanceCount:1];
  }
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a6 baseObject];

  [v13 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v14 indexBufferOffset:a7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:0 indexType:2 primitiveType:a3 vertexCount:a5 instanceCount:a6];
  }
  id v13 = [(MTLToolsObject *)self baseObject];

  [v13 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:0 indexType:2 primitiveType:a3 vertexCount:a5 instanceCount:1];
  }
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:1 indexType:a5 primitiveType:a3 vertexCount:a4 instanceCount:a8];
  }
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a6 baseObject];

  objc_msgSend(v17, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, v18, a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:2 indexType:2 primitiveType:a3 vertexCount:0 instanceCount:1];
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a4 baseObject];

  [v9 drawPrimitives:a3 indirectBuffer:v10 indirectBufferOffset:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumDrawWithType:2 indexType:a4 primitiveType:a3 vertexCount:0 instanceCount:1];
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a5 baseObject];
  uint64_t v17 = [a7 baseObject];

  [v15 drawIndexedPrimitives:a3 indexType:a4 indexBuffer:v16 indexBufferOffset:a6 indirectBuffer:v17 indirectBufferOffset:a8];
}

- (void)endEncoding
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry])
  {
    uint64_t reDraws = self->_reDraws;
    if (!reDraws)
    {
LABEL_11:

      self->_anisoFragmentSamplers = 0;
      self->_clippedMip2DFragmentTextures = 0;

      self->_telemetryPipeline = 0;
      goto LABEL_12;
    }
    renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
    if (renderEncoderDrawCallDistribution->count)
    {
      if (reDraws > renderEncoderDrawCallDistribution->max)
      {
        renderEncoderDrawCallDistribution->max = reDraws;
        renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
      }
      if (reDraws >= renderEncoderDrawCallDistribution->min) {
        goto LABEL_10;
      }
    }
    else
    {
      renderEncoderDrawCallDistribution->max = reDraws;
      renderEncoderDrawCallDistribution = self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution;
    }
    renderEncoderDrawCallDistribution->min = reDraws;
LABEL_10:
    self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution->total += reDraws;
    ++self->_telemetryCommandBuffer->renderEncoderDrawCallDistribution->count;
    goto LABEL_11;
  }
LABEL_12:
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 endEncoding];
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (![(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    goto LABEL_17;
  }
  unsigned int v7 = a4 + 1;
  if (a4 != -1)
  {
    textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    if (textureBindCount->count)
    {
      if (v7 > textureBindCount->max)
      {
        textureBindCount->max = v7;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      if (v7 >= textureBindCount->min) {
        goto LABEL_10;
      }
    }
    else
    {
      textureBindCount->max = v7;
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    }
    textureBindCount->min = v7;
LABEL_10:
    self->_telemetryCommandBuffer->textureBindCount->total += v7;
    ++self->_telemetryCommandBuffer->textureBindCount->count;
  }
  if (a3 && *((void *)a3 + 9) && ([a3 textureType] == 2 || objc_msgSend(a3, "textureType") == 3))
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:*((void *)a3 + 9)];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clippedMip2DFragmentTextures, "setObject:forKeyedSubscript:", v9, [NSNumber numberWithUnsignedInteger:a4]);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clippedMip2DFragmentTextures, "removeObjectForKey:", [NSNumber numberWithUnsignedInteger:a4]);
  }
LABEL_17:
  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v10 setFragmentTexture:a3 atIndex:a4];
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (![(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    goto LABEL_20;
  }
  unsigned int v6 = location + length;
  if (location + length)
  {
    textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    if (textureBindCount->count)
    {
      if (textureBindCount->max < v6)
      {
        textureBindCount->max = v6;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      if (textureBindCount->min <= v6) {
        goto LABEL_10;
      }
    }
    else
    {
      textureBindCount->max = v6;
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    }
    textureBindCount->min = v6;
LABEL_10:
    self->_telemetryCommandBuffer->textureBindCount->total += v6;
    ++self->_telemetryCommandBuffer->textureBindCount->count;
  }
  if (length)
  {
    unsigned int v8 = (id *)a3;
    NSUInteger v9 = location;
    NSUInteger v10 = length;
    do
    {
      objc_super v11 = *v8;
      if (*v8 && v11[9] && ([*v8 textureType] == 2 || objc_msgSend(v11, "textureType") == 3))
      {
        uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11[9]];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clippedMip2DFragmentTextures, "setObject:forKeyedSubscript:", v12, [NSNumber numberWithUnsignedInteger:v9]);
      }
      else
      {
        -[NSMutableDictionary removeObjectForKey:](self->_clippedMip2DFragmentTextures, "removeObjectForKey:", [NSNumber numberWithUnsignedInteger:v9]);
      }
      ++v8;
      ++v9;
      --v10;
    }
    while (v10);
  }
LABEL_20:
  v15.receiver = self;
  v15.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentTextures:withRange:](&v15, sel_setFragmentTextures_withRange_, a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry])
  {
    if (a3 && *((unsigned char *)a3 + 36)) {
      -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", [NSNumber numberWithUnsignedInteger:a4]);
    }
    else {
      -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", [NSNumber numberWithUnsignedInteger:a4]);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v7 setFragmentSamplerState:a3 atIndex:a4];
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    BOOL v7 = length == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    NSUInteger v8 = location;
    NSUInteger v9 = a3;
    NSUInteger v10 = length;
    do
    {
      if (*v9 && *((unsigned char *)*v9 + 36)) {
        -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", [NSNumber numberWithUnsignedInteger:v8]);
      }
      else {
        -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", [NSNumber numberWithUnsignedInteger:v8]);
      }
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerStates:withRange:](&v12, sel_setFragmentSamplerStates_withRange_, a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry])
  {
    if (a3 && *((unsigned char *)a3 + 36)) {
      -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", [NSNumber numberWithUnsignedInteger:a6]);
    }
    else {
      -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", [NSNumber numberWithUnsignedInteger:a6]);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  [(MTLToolsRenderCommandEncoder *)&v13 setFragmentSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v11 atIndex:v12];
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    BOOL v9 = length == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    NSUInteger v10 = location;
    double v11 = a3;
    NSUInteger v12 = length;
    do
    {
      if (*v11 && *((unsigned char *)*v11 + 36)) {
        -[NSMutableSet addObject:](self->_anisoFragmentSamplers, "addObject:", [NSNumber numberWithUnsignedInteger:v10]);
      }
      else {
        -[NSMutableSet removeObject:](self->_anisoFragmentSamplers, "removeObject:", [NSNumber numberWithUnsignedInteger:v10]);
      }
      ++v11;
      ++v10;
      --v12;
    }
    while (v12);
  }
  v16.receiver = self;
  v16.super_class = (Class)MTLTelemetryRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](&v16, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4, a5, location, length);
}

- (void)accumViewportTelemetry:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
    if (viewportDistribution->var0.count)
    {
      if (viewportDistribution->var0.max < a4)
      {
        viewportDistribution->var0.max = a4;
        viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
      }
      if (viewportDistribution->var0.min <= a4) {
        goto LABEL_11;
      }
    }
    else
    {
      viewportDistribution->var0.max = a4;
      viewportDistribution = self->_telemetryCommandBuffer->viewportDistribution;
    }
    viewportDistribution->var0.min = a4;
LABEL_11:
    self->_telemetryCommandBuffer->viewportDistribution->var0.total += a4;
    ++self->_telemetryCommandBuffer->viewportDistribution->var0.count;
    goto LABEL_12;
  }
  if (a4)
  {
LABEL_12:
    p_var5 = &a3->var5;
    for (unsigned int i = 1; ; ++i)
    {
      float v7 = *(p_var5 - 3);
      NSUInteger v8 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v8->var1.var3) {
        break;
      }
      if (v8->var1.var1 < v7)
      {
        v8->var1.var1 = v7;
        NSUInteger v8 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      float var0 = v8->var1.var0;
      p_var1 = &v8->var1;
      if (var0 > v7) {
        goto LABEL_19;
      }
LABEL_20:
      self->_telemetryCommandBuffer->viewportDistribution->var1.var2 = self->_telemetryCommandBuffer->viewportDistribution->var1.var2
                                                                     + v7;
      ++self->_telemetryCommandBuffer->viewportDistribution->var1.var3;
      float v11 = *(p_var5 - 2);
      NSUInteger v12 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v12->var2.var3)
      {
        v12->var2.var1 = v11;
        p_var2 = &self->_telemetryCommandBuffer->viewportDistribution->var2;
LABEL_26:
        p_var2->float var0 = v11;
        goto LABEL_27;
      }
      if (v12->var2.var1 < v11)
      {
        v12->var2.var1 = v11;
        NSUInteger v12 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      float v14 = v12->var2.var0;
      p_var2 = &v12->var2;
      if (v14 > v11) {
        goto LABEL_26;
      }
LABEL_27:
      self->_telemetryCommandBuffer->viewportDistribution->var2.var2 = self->_telemetryCommandBuffer->viewportDistribution->var2.var2
                                                                     + v11;
      ++self->_telemetryCommandBuffer->viewportDistribution->var2.var3;
      float v15 = *(p_var5 - 1);
      objc_super v16 = self->_telemetryCommandBuffer->viewportDistribution;
      if (!v16->var3.var3)
      {
        v16->var3.var1 = v15;
        p_var3 = &self->_telemetryCommandBuffer->viewportDistribution->var3;
LABEL_33:
        p_var3->float var0 = v15;
        goto LABEL_34;
      }
      if (v16->var3.var1 < v15)
      {
        v16->var3.var1 = v15;
        objc_super v16 = self->_telemetryCommandBuffer->viewportDistribution;
      }
      float v18 = v16->var3.var0;
      p_var3 = &v16->var3;
      if (v18 > v15) {
        goto LABEL_33;
      }
LABEL_34:
      self->_telemetryCommandBuffer->viewportDistribution->var3.var2 = self->_telemetryCommandBuffer->viewportDistribution->var3.var2
                                                                     + v15;
      ++self->_telemetryCommandBuffer->viewportDistribution->var3.var3;
      float v19 = *p_var5;
      int v20 = self->_telemetryCommandBuffer->viewportDistribution;
      if (v20->var4.var3)
      {
        if (v20->var4.var1 < v19)
        {
          v20->var4.var1 = v19;
          int v20 = self->_telemetryCommandBuffer->viewportDistribution;
        }
        float v22 = v20->var4.var0;
        p_var4 = &v20->var4;
        if (v22 <= v19) {
          goto LABEL_41;
        }
      }
      else
      {
        v20->var4.var1 = v19;
        p_var4 = &self->_telemetryCommandBuffer->viewportDistribution->var4;
      }
      p_var4->float var0 = v19;
LABEL_41:
      self->_telemetryCommandBuffer->viewportDistribution->var4.var2 = self->_telemetryCommandBuffer->viewportDistribution->var4.var2
                                                                     + v19;
      ++self->_telemetryCommandBuffer->viewportDistribution->var4.var3;
      unint64_t v23 = i;
      p_var5 += 6;
      if (v23 >= a4) {
        return;
      }
    }
    v8->var1.var1 = v7;
    p_var1 = &self->_telemetryCommandBuffer->viewportDistribution->var1;
LABEL_19:
    p_var1->float var0 = v7;
    goto LABEL_20;
  }
}

- (void)setViewport:(id *)a3
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumViewportTelemetry:a3 count:1];
  }
  id v5 = [(MTLToolsObject *)self baseObject];
  long long v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var4;
  [v5 setViewport:v7];
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumViewportTelemetry:a3 count:a4];
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 setViewports:a3 count:a4];
}

- (void)accumScissorRectTelemetry:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
    if (scissorRectDistribution->var0.count)
    {
      if (scissorRectDistribution->var0.max < a4)
      {
        scissorRectDistribution->var0.max = a4;
        scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
      }
      if (scissorRectDistribution->var0.min <= a4) {
        goto LABEL_11;
      }
    }
    else
    {
      scissorRectDistribution->var0.max = a4;
      scissorRectDistribution = self->_telemetryCommandBuffer->scissorRectDistribution;
    }
    scissorRectDistribution->var0.min = a4;
LABEL_11:
    self->_telemetryCommandBuffer->scissorRectDistribution->var0.total += a4;
    ++self->_telemetryCommandBuffer->scissorRectDistribution->var0.count;
    goto LABEL_12;
  }
  if (a4)
  {
LABEL_12:
    p_var3 = &a3->var3;
    unsigned int v6 = 1;
    while (1)
    {
      float v7 = (float)*(p_var3 - 1);
      NSUInteger v8 = self->_telemetryCommandBuffer->scissorRectDistribution;
      if (!v8->var1.var3) {
        break;
      }
      if (v8->var1.var1 < v7)
      {
        v8->var1.var1 = v7;
        NSUInteger v8 = self->_telemetryCommandBuffer->scissorRectDistribution;
      }
      float var0 = v8->var1.var0;
      p_var1 = &v8->var1;
      if (var0 > v7) {
        goto LABEL_19;
      }
LABEL_20:
      self->_telemetryCommandBuffer->scissorRectDistribution->var1.var2 = self->_telemetryCommandBuffer->scissorRectDistribution->var1.var2
                                                                        + v7;
      float v11 = (float)*p_var3;
      ++self->_telemetryCommandBuffer->scissorRectDistribution->var1.var3;
      NSUInteger v12 = self->_telemetryCommandBuffer->scissorRectDistribution;
      if (v12->var2.var3)
      {
        if (v12->var2.var1 < v11)
        {
          v12->var2.var1 = v11;
          NSUInteger v12 = self->_telemetryCommandBuffer->scissorRectDistribution;
        }
        float v14 = v12->var2.var0;
        p_var2 = &v12->var2;
        if (v14 <= v11) {
          goto LABEL_27;
        }
      }
      else
      {
        v12->var2.var1 = v11;
        p_var2 = &self->_telemetryCommandBuffer->scissorRectDistribution->var2;
      }
      p_var2->float var0 = v11;
LABEL_27:
      p_var3 += 4;
      self->_telemetryCommandBuffer->scissorRectDistribution->var2.var2 = self->_telemetryCommandBuffer->scissorRectDistribution->var2.var2
                                                                        + v11;
      ++self->_telemetryCommandBuffer->scissorRectDistribution->var2.var3;
      unint64_t v15 = v6++;
      if (v15 >= a4) {
        return;
      }
    }
    v8->var1.var1 = v7;
    p_var1 = &self->_telemetryCommandBuffer->scissorRectDistribution->var1;
LABEL_19:
    p_var1->float var0 = v7;
    goto LABEL_20;
  }
}

- (void)setScissorRect:(id *)a3
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumScissorRectTelemetry:a3 count:1];
  }
  id v5 = [(MTLToolsObject *)self baseObject];
  long long v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  [v5 setScissorRect:v7];
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  if ([(MTLTelemetryDevice *)self->_telemetryDevice enableTelemetry]) {
    [(MTLTelemetryRenderCommandEncoder *)self accumScissorRectTelemetry:a3 count:a4];
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 setScissorRects:a3 count:a4];
}

@end