@interface RenderBundleICBWithResources
- (MTLBuffer)fragmentDynamicOffsetsBuffer;
- (MTLBuffer)indirectCommandBufferContainer;
- (MTLDepthStencilState)depthStencilState;
- (MTLIndirectCommandBuffer)indirectCommandBuffer;
- (MTLRenderPipelineState)currentPipelineState;
- (RenderBundleICBWithResources)initWithICB:(id)a3 containerBuffer:(id)a4 pipelineState:(id)a5 depthStencilState:(id)a6 cullMode:(unint64_t)a7 frontFace:(unint64_t)a8 depthClipMode:(unint64_t)a9 depthBias:(float)a10 depthBiasSlopeScale:(float)a11 depthBiasClamp:(float)a12 fragmentDynamicOffsetsBuffer:(id)a13 pipeline:(const void *)a14 minVertexCounts:(void *)a15;
- (const)pipeline;
- (float)depthBias;
- (float)depthBiasClamp;
- (float)depthBiasSlopeScale;
- (id).cxx_construct;
- (unint64_t)cullMode;
- (unint64_t)depthClipMode;
- (unint64_t)frontFace;
- (void)minVertexCountForDrawCommand;
- (void)resources;
@end

@implementation RenderBundleICBWithResources

- (RenderBundleICBWithResources)initWithICB:(id)a3 containerBuffer:(id)a4 pipelineState:(id)a5 depthStencilState:(id)a6 cullMode:(unint64_t)a7 frontFace:(unint64_t)a8 depthClipMode:(unint64_t)a9 depthBias:(float)a10 depthBiasSlopeScale:(float)a11 depthBiasClamp:(float)a12 fragmentDynamicOffsetsBuffer:(id)a13 pipeline:(const void *)a14 minVertexCounts:(void *)a15
{
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  id v39 = a6;
  id v38 = a13;
  v40.receiver = self;
  v40.super_class = (Class)RenderBundleICBWithResources;
  v27 = [(RenderBundleICBWithResources *)&v40 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_indirectCommandBuffer, a3);
    objc_storeStrong((id *)&v28->_indirectCommandBufferContainer, a4);
    objc_storeStrong((id *)&v28->_currentPipelineState, a5);
    objc_storeStrong((id *)&v28->_depthStencilState, a6);
    v28->_cullMode = a7;
    v28->_frontFace = a8;
    v28->_depthClipMode = a9;
    v28->_depthBias = a10;
    v28->_depthBiasSlopeScale = a11;
    v28->_depthBiasClamp = a12;
    objc_storeStrong((id *)&v28->_fragmentDynamicOffsetsBuffer, a13);
    v28->_pipeline = a14;
    v30 = *(void **)a15;
    *(void *)a15 = 0;
    m_tableForLLDB = v28->_minVertexCountForDrawCommand.m_impl.var0.m_tableForLLDB;
    v28->_minVertexCountForDrawCommand.m_impl.var0.m_table = v30;
    if (m_tableForLLDB)
    {
      uint64_t v32 = *(m_tableForLLDB - 1);
      if (v32)
      {
        v33 = (unsigned int **)(m_tableForLLDB + 2);
        do
        {
          if (*(v33 - 1) != (unsigned int *)-2)
          {
            v34 = *v33;
            *v33 = 0;
            if (v34)
            {
              if (atomic_fetch_add((atomic_uint *volatile)v34, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, v34);
                WTF::fastFree((WTF *)v34, v29);
              }
            }
          }
          v33 += 11;
          --v32;
        }
        while (v32);
      }
      WTF::fastFree((WTF *)(m_tableForLLDB - 4), v29);
    }
    v35 = v28;
  }

  return v28;
}

- (void)resources
{
  return &self->_resources;
}

- (void)minVertexCountForDrawCommand
{
  return &self->_minVertexCountForDrawCommand;
}

- (MTLIndirectCommandBuffer)indirectCommandBuffer
{
  return self->_indirectCommandBuffer;
}

- (MTLBuffer)indirectCommandBufferContainer
{
  return self->_indirectCommandBufferContainer;
}

- (MTLRenderPipelineState)currentPipelineState
{
  return self->_currentPipelineState;
}

- (MTLDepthStencilState)depthStencilState
{
  return self->_depthStencilState;
}

- (unint64_t)cullMode
{
  return self->_cullMode;
}

- (unint64_t)frontFace
{
  return self->_frontFace;
}

- (unint64_t)depthClipMode
{
  return self->_depthClipMode;
}

- (float)depthBias
{
  return self->_depthBias;
}

- (float)depthBiasSlopeScale
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBiasClamp
{
  return self->_depthBiasClamp;
}

- (MTLBuffer)fragmentDynamicOffsetsBuffer
{
  return self->_fragmentDynamicOffsetsBuffer;
}

- (const)pipeline
{
  return self->_pipeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentDynamicOffsetsBuffer, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_currentPipelineState, 0);
  objc_storeStrong((id *)&self->_indirectCommandBufferContainer, 0);
  objc_storeStrong((id *)&self->_indirectCommandBuffer, 0);
  m_tableForLLDB = self->_minVertexCountForDrawCommand.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v5 = *(m_tableForLLDB - 1);
    if (v5)
    {
      v6 = (unsigned int **)(m_tableForLLDB + 2);
      do
      {
        if (*(v6 - 1) != (unsigned int *)-2)
        {
          v7 = *v6;
          *v6 = 0;
          if (v7)
          {
            if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v7);
              WTF::fastFree((WTF *)v7, v3);
            }
          }
        }
        v6 += 11;
        --v5;
      }
      while (v5);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), v3);
  }
  unsigned int m_size = self->_resources.m_size;
  if (m_size) {
    WTF::VectorDestructor<true,WebGPU::BindableResources>::destruct((WTF *)self->_resources.m_buffer, (WTF *)((char *)self->_resources.m_buffer + 48 * m_size));
  }
  m_buffer = self->_resources.m_buffer;
  if (m_buffer)
  {
    self->_resources.m_buffer = 0;
    self->_resources.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end