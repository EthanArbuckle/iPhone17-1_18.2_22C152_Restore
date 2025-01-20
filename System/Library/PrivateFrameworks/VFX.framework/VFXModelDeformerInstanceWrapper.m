@interface VFXModelDeformerInstanceWrapper
- (MTLBlitCommandEncoder)currentBlitEncoder;
- (MTLBuffer)dstNormalBuffer;
- (MTLBuffer)dstPositionBuffer;
- (MTLBuffer)dstTangentBuffer;
- (MTLBuffer)srcNormalBuffer;
- (MTLBuffer)srcPositionBuffer;
- (MTLBuffer)srcTangentBuffer;
- (MTLComputeCommandEncoder)currentComputeEncoder;
- (MTLDevice)device;
- (__n128)_currentFrustumInfo;
- (__n128)_currentTransforms;
- (id)_currentRenderContext;
- (id)_currentResourceManager;
- (id)deformer;
- (id)dependency0NormalBuffer;
- (id)dependency0PositionBuffer;
- (id)dependency0TangentBuffer;
- (id)dependency1NormalBuffer;
- (id)dependency1PositionBuffer;
- (id)dependency1TangentBuffer;
- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4;
- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4;
- (unint64_t)_currentFrameHash;
- (void)configureStageInputOutputDescriptor:(id)a3 withDeformerFunction:(id)a4;
- (void)dealloc;
- (void)setStageInputOutputBuffersToComputeEncoder:(VFXMTLComputeCommandEncoder *)a3;
- (void)setStageInputOutputBuffersToCurrentComputeEncoder;
@end

@implementation VFXModelDeformerInstanceWrapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXModelDeformerInstanceWrapper;
  [(VFXModelDeformerInstanceWrapper *)&v3 dealloc];
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4
{
  if ((uint64_t)a3 <= 2047)
  {
    if (a3 != 256)
    {
      if (a3 != 512)
      {
        if (a3 != 1024) {
          goto LABEL_12;
        }
        return (id)*((void *)a4 + 12);
      }
      return (id)*((void *)a4 + 11);
    }
    return (id)*((void *)a4 + 10);
  }
  switch(a3)
  {
    case 0x2000uLL:
      return (id)*((void *)a4 + 12);
    case 0x1000uLL:
      return (id)*((void *)a4 + 11);
    case 0x800uLL:
      return (id)*((void *)a4 + 10);
  }
LABEL_12:
  sub_1B63F2F54(16, @"Unreachable code: Unsupported input", a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4
{
  sub_1B63F2F54(16, @"Unreachable code: Not implemented", a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)deformer
{
  return self->_stack->_currentInitDeformer;
}

- (MTLDevice)device
{
  return (MTLDevice *)sub_1B653EFB8((uint64_t)self->_stack->_resourceManager);
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  return (MTLBlitCommandEncoder *)objc_msgSend_currentBlitEncoder(self->_stack, a2, v2, v3);
}

- (void)configureStageInputOutputDescriptor:(id)a3 withDeformerFunction:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = objc_msgSend_stageInputAttributes(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    p_dstTangents = &self->_stageInputOutputDescriptors.dstTangents;
    p_srcTangents = &self->_stageInputOutputDescriptors.srcTangents;
    uint64_t v13 = *(void *)v48;
    p_dstNormals = &self->_stageInputOutputDescriptors.dstNormals;
    p_srcNormals = &self->_stageInputOutputDescriptors.srcNormals;
    p_dstPositions = &self->_stageInputOutputDescriptors.dstPositions;
    p_stageInputOutputDescriptors = &self->_stageInputOutputDescriptors;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v6);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend_attributeIndex(v19, v9, v10, v11, p_dstTangents))
        {
          if (objc_msgSend_attributeIndex(v19, v20, v21, v11) == 3)
          {
            long long v24 = *(_OWORD *)&p_dstPositions->bufferAttributeOffset;
            v45[0] = *(_OWORD *)&p_dstPositions->isActive;
            v45[1] = v24;
            v25 = (uint64_t *)v45;
            id v26 = a3;
            uint64_t v27 = 3;
          }
          else if (objc_msgSend_attributeIndex(v19, v22, v23, v11) == 1)
          {
            long long v31 = *(_OWORD *)&p_srcNormals->bufferAttributeOffset;
            v44[0] = *(_OWORD *)&p_srcNormals->isActive;
            v44[1] = v31;
            v25 = (uint64_t *)v44;
            id v26 = a3;
            uint64_t v27 = 1;
          }
          else if (objc_msgSend_attributeIndex(v19, v29, v30, v11) == 4)
          {
            long long v34 = *(_OWORD *)&p_dstNormals->bufferAttributeOffset;
            v43[0] = *(_OWORD *)&p_dstNormals->isActive;
            v43[1] = v34;
            v25 = (uint64_t *)v43;
            id v26 = a3;
            uint64_t v27 = 4;
          }
          else if (objc_msgSend_attributeIndex(v19, v32, v33, v11) == 2)
          {
            long long v37 = *(_OWORD *)&p_srcTangents->bufferAttributeOffset;
            v42[0] = *(_OWORD *)&p_srcTangents->isActive;
            v42[1] = v37;
            v25 = (uint64_t *)v42;
            id v26 = a3;
            uint64_t v27 = 2;
          }
          else
          {
            if (objc_msgSend_attributeIndex(v19, v35, v36, v11) != 5) {
              continue;
            }
            long long v38 = *(_OWORD *)&p_dstTangents->bufferAttributeOffset;
            v41[0] = *(_OWORD *)&p_dstTangents->isActive;
            v41[1] = v38;
            v25 = (uint64_t *)v41;
            id v26 = a3;
            uint64_t v27 = 5;
          }
        }
        else
        {
          long long v28 = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.bufferAttributeOffset;
          v46[0] = *(_OWORD *)&p_stageInputOutputDescriptors->srcPositions.isActive;
          v46[1] = v28;
          v25 = (uint64_t *)v46;
          id v26 = a3;
          uint64_t v27 = 0;
        }
        sub_1B64A9C38(v26, (const char *)v27, v25, v11);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v12);
  }
}

- (unint64_t)_currentFrameHash
{
  currentUpdateRenderContext = self->_stack->_currentUpdateRenderContext;
  uint64_t v5 = objc_msgSend_engineContext(currentUpdateRenderContext, a2, v2, v3);
  double v6 = sub_1B6447718(v5);
  uint64_t v10 = objc_msgSend_currentFrameIndex(currentUpdateRenderContext, v7, v8, v9);
  unint64_t v11 = 0x9DDFEA08EB382D69
      * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)));
  unint64_t v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * *(void *)&v6) ^ ((0xC6A4A7935BD1E995 * *(void *)&v6) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))));
  return (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
}

- (__n128)_currentTransforms
{
  uint64_t v2 = *(void *)(a1 + 8);
  long long v3 = *(_OWORD *)(v2 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(v2 + 544);
  *(_OWORD *)(a2 + 144) = v3;
  long long v4 = *(_OWORD *)(v2 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(v2 + 576);
  *(_OWORD *)(a2 + 176) = v4;
  long long v5 = *(_OWORD *)(v2 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 480);
  *(_OWORD *)(a2 + 80) = v5;
  long long v6 = *(_OWORD *)(v2 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 512);
  *(_OWORD *)(a2 + 112) = v6;
  long long v7 = *(_OWORD *)(v2 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 416);
  *(_OWORD *)(a2 + 16) = v7;
  __n128 result = *(__n128 *)(v2 + 448);
  long long v9 = *(_OWORD *)(v2 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  return result;
}

- (__n128)_currentFrustumInfo
{
  uint64_t v2 = *(void *)(a1 + 8);
  long long v3 = *(_OWORD *)(v2 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v2 + 672);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v2 + 704);
  long long v4 = *(_OWORD *)(v2 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(v2 + 608);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(v2 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v2 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (id)_currentRenderContext
{
  return self->_stack->_currentUpdateRenderContext;
}

- (void)setStageInputOutputBuffersToComputeEncoder:(VFXMTLComputeCommandEncoder *)a3
{
  if (self->_stageInputOutputDescriptors.srcPositions.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcPositions, 0, 10);
  }
  if (self->_stageInputOutputDescriptors.dstPositions.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.dstPositions, 0, 13);
  }
  if (self->_stageInputOutputDescriptors.srcNormals.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcNormals, 0, 11);
  }
  if (self->_stageInputOutputDescriptors.dstNormals.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.dstNormals, 0, 14);
  }
  if (self->_stageInputOutputDescriptors.srcTangents.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_currentUpdateBuffers.srcTangents, 0, 12);
  }
  if (self->_stageInputOutputDescriptors.dstTangents.isActive)
  {
    dstTangents = self->_currentUpdateBuffers.dstTangents;
    encoder = a3->_encoder;
    objc_msgSend_setBuffer_offset_atIndex_(encoder, a2, (uint64_t)dstTangents, 0, 15);
  }
}

- (id)_currentResourceManager
{
  return self->_stack->_resourceManager;
}

- (void)setStageInputOutputBuffersToCurrentComputeEncoder
{
  currentUpdateComputeEncoder = self->_currentUpdateComputeEncoder;
  if (!currentUpdateComputeEncoder)
  {
    currentUpdateComputeEncoder = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider
                                                               + 2))();
    self->_currentUpdateComputeEncoder = currentUpdateComputeEncoder;
  }
  if (self->_stageInputOutputDescriptors.srcPositions.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcPositions, 0, 10);
  }
  if (self->_stageInputOutputDescriptors.dstPositions.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.dstPositions, 0, 13);
  }
  if (self->_stageInputOutputDescriptors.srcNormals.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcNormals, 0, 11);
  }
  if (self->_stageInputOutputDescriptors.dstNormals.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.dstNormals, 0, 14);
  }
  if (self->_stageInputOutputDescriptors.srcTangents.isActive) {
    objc_msgSend_setBuffer_offset_atIndex_(self->_currentUpdateComputeEncoder, a2, (uint64_t)self->_currentUpdateBuffers.srcTangents, 0, 12);
  }
  if (self->_stageInputOutputDescriptors.dstTangents.isActive)
  {
    long long v4 = self->_currentUpdateComputeEncoder;
    dstTangents = self->_currentUpdateBuffers.dstTangents;
    objc_msgSend_setBuffer_offset_atIndex_(v4, a2, (uint64_t)dstTangents, 0, 15);
  }
}

- (MTLComputeCommandEncoder)currentComputeEncoder
{
  __n128 result = self->_currentUpdateComputeEncoder;
  if (!result)
  {
    __n128 result = (MTLComputeCommandEncoder *)(*((uint64_t (**)(void))self->_currentUpdateComputeEncoderProvider + 2))();
    self->_currentUpdateComputeEncoder = result;
  }
  return result;
}

- (MTLBuffer)srcPositionBuffer
{
  return self->_currentUpdateBuffers.srcPositions;
}

- (MTLBuffer)dstPositionBuffer
{
  return self->_currentUpdateBuffers.dstPositions;
}

- (MTLBuffer)srcNormalBuffer
{
  return self->_currentUpdateBuffers.srcNormals;
}

- (MTLBuffer)dstNormalBuffer
{
  return self->_currentUpdateBuffers.dstNormals;
}

- (MTLBuffer)srcTangentBuffer
{
  return self->_currentUpdateBuffers.srcTangents;
}

- (MTLBuffer)dstTangentBuffer
{
  return self->_currentUpdateBuffers.dstTangents;
}

- (id)dependency0PositionBuffer
{
  return self->_currentUpdateBuffers.dependency0Positions;
}

- (id)dependency0NormalBuffer
{
  return self->_currentUpdateBuffers.dependency0Normals;
}

- (id)dependency0TangentBuffer
{
  return self->_currentUpdateBuffers.dependency0Tangents;
}

- (id)dependency1PositionBuffer
{
  return self->_currentUpdateBuffers.dependency1Positions;
}

- (id)dependency1NormalBuffer
{
  return self->_currentUpdateBuffers.dependency1Normals;
}

- (id)dependency1TangentBuffer
{
  return self->_currentUpdateBuffers.dependency1Tangents;
}

@end