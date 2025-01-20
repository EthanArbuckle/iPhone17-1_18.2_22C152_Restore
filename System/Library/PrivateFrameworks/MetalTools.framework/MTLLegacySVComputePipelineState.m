@interface MTLLegacySVComputePipelineState
- (MTLComputePipelineReflection)internalReflection;
- (MTLComputePipelineReflection)userReflection;
- (MTLLegacySVBuffer)globalConstantsBuffer;
- (MTLLegacySVBuffer)indirectStateBuffer;
- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 binaryFunctions:(id)a4 withState:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7;
- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8;
- (MTLLegacySVImageData)kernelFunctionData;
- (NSArray)binaryFunctionData;
- (id)functionHandleWithFunction:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (int)maxCallStackDepth;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (unint64_t)constantOffset;
- (unint64_t)staticThreadgroupMemoryLength;
- (void)_initConstantsBuffer:(id)a3 device:(id)a4;
- (void)dealloc;
- (void)releaseReflection;
@end

@implementation MTLLegacySVComputePipelineState

- (void)_initConstantsBuffer:(id)a3 device:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "globalConstantsData");
  self->_threadgroupArgumentOffset = objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "threadgroupArgumentOffset");
  self->_activeThreadgroupMask = objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "activeThreadgroupMask");
  if ([v7 length])
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
    if ([v7 length])
    {
      [v8 appendData:v7];
      self->_constantOffset = 0;
      [v7 length];
    }
    [(MTLLegacySVImageData *)self->_kernelFunctionData setConstantData:v8];
  }
  if (self->_supportsIndirectCommandBuffers
    && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x20) != 0)
  {
    v9 = [[MTLLegacySVPipelineStateInfoEncoder alloc] initWithDevice:self->super.super._device];
    v10 = objc_msgSend((id)objc_msgSend(a4, "baseObject"), "newBufferWithLength:options:", -[MTLLegacySVPipelineStateInfoEncoder encodedLength](v9, "encodedLength"), 0);
    self->_indirectStateBuffer = -[MTLLegacySVBuffer initWithBuffer:device:offset:length:track:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:offset:length:track:", v10, a4, 0, [v10 length], 0);

    [(MTLLegacySVPipelineStateInfoEncoder *)v9 setArgumentBuffer:self->_indirectStateBuffer offset:0];
    [(MTLLegacySVPipelineStateInfoEncoder *)v9 setComputePipelineState:self];

    if (self->_supportsIndirectCommandBuffers)
    {
      uint64_t v11 = *((void *)self->_kernelFunctionData + 1);
      if (v11) {
        LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, v11);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      binaryFunctionData = self->_binaryFunctionData;
      uint64_t v13 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(binaryFunctionData);
            }
            uint64_t v17 = *(void *)(*(void *)(*((void *)&v18 + 1) + 8 * i) + 8);
            if (v17) {
              LegacySVGlobalResidentBufferList::addBuffer((uint64_t)&self->super.super._device[4]._memorySize, v17);
            }
          }
          uint64_t v14 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v14);
      }
    }
    LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)self->_indirectStateBuffer);
  }
}

- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)MTLLegacySVComputePipelineState;
  uint64_t v14 = [(MTLToolsObject *)&v43 initWithBaseObject:a3 parent:a7];
  if (v14)
  {
    id v34 = a6;
    uint64_t v15 = [a4 computeFunction];
    v14->_kernelFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v15, [a3 debugInstrumentationData]);
    if ((BYTE4(v14->super.super._device[2].sourceLibraryObjectCache) & 2) != 0)
    {
      v16 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      v14->_retainedFunctions = v16;
      [(NSMutableArray *)v16 addObject:v15];
    }
    v14->_supportsIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    uint64_t v17 = 1;
    if ((a8 & 0x800000000) == 0) {
      uint64_t v17 = 2;
    }
    v14->_shaderValidation = v17;
    v14->_shaderValidationState = v17;
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "preloadedLibraries"), "count");
    uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions"), "count") + v18;
    if (v19)
    {
      id v32 = a5;
      v14->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v20 = objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions");
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v40;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v20);
            }
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(void *)(*(void *)(*((void *)&v39 + 1) + 8 * v24++) + 48), v32);
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v22);
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v25 = objc_msgSend(a4, "preloadedLibraries", v32);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v44 count:16];
      a5 = v33;
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v36;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v25);
            }
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v35 + 1) + 8 * v29++) imageData]);
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v27);
      }
    }
    v14->_internalReflection = (MTLComputePipelineReflection *)v34;
    if (objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "userReflectionData"))
    {
      v30 = [a5 newSerializedComputeDataWithFlags:0 options:3];
      v14->_userReflection = (MTLComputePipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x263F12860]), "initWithSerializedData:serializedStageInputDescriptor:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "userReflectionData"), v30, objc_msgSend(a7, "baseObject"), 3, 0);
      dispatch_release(v30);
    }
    [(MTLComputePipelineReflection *)v14->_userReflection setPerformanceStatistics:[(MTLComputePipelineReflection *)v14->_internalReflection performanceStatistics]];
    [(MTLLegacySVComputePipelineState *)v14 _initConstantsBuffer:a3 device:a7];
  }
  return v14;
}

- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 binaryFunctions:(id)a4 withState:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)MTLLegacySVComputePipelineState;
  uint64_t v11 = [(MTLToolsObject *)&v27 initWithBaseObject:a3 parent:a6];
  v12 = v11;
  if (v11)
  {
    unint64_t v22 = a7;
    if ((BYTE4(v11->super.super._device[2].sourceLibraryObjectCache) & 2) != 0)
    {
      uint64_t v13 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*((id *)a5 + 16), "count") + objc_msgSend(a4, "count"));
      v12->_retainedFunctions = v13;
      [(NSMutableArray *)v13 addObjectsFromArray:a4];
      [(NSMutableArray *)v12->_retainedFunctions addObjectsFromArray:*((void *)a5 + 16)];
    }
    v12->_kernelFunctionData = (MTLLegacySVImageData *)*((id *)a5 + 6);
    uint64_t v14 = [*((id *)a5 + 9) count];
    uint64_t v15 = [a4 count] + v14;
    if (v15) {
      v12->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15];
    }
    if (*((void *)a5 + 9)) {
      -[NSMutableArray addObjectsFromArray:](v12->_binaryFunctionData, "addObjectsFromArray:");
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v16 = [a4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(a4);
          }
          [(NSMutableArray *)v12->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v23 + 1) + 8 * v19++) + 48)];
        }
        while (v17 != v19);
        uint64_t v17 = [a4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v17);
    }
    v12->_userReflection = (MTLComputePipelineReflection *)*((id *)a5 + 8);
    v12->_internalReflection = (MTLComputePipelineReflection *)*((id *)a5 + 7);
    v12->_supportsIndirectCommandBuffers = [a5 supportIndirectCommandBuffers];
    uint64_t v20 = 1;
    if ((v22 & 0x800000000) == 0) {
      uint64_t v20 = 2;
    }
    v12->_shaderValidation = v20;
    v12->_shaderValidationState = v20;
    [(MTLLegacySVComputePipelineState *)v12 _initConstantsBuffer:a3 device:v12->super.super._device];
  }
  return v12;
}

- (void)releaseReflection
{
  self->_internalReflection = 0;
  self->_userReflection = 0;
}

- (MTLComputePipelineReflection)internalReflection
{
  return self->_internalReflection;
}

- (MTLComputePipelineReflection)userReflection
{
  return self->_userReflection;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result = (id)-[MTLToolsObject newVisibleFunctionTableWithDescriptor:](self->super.super._baseObject, "newVisibleFunctionTableWithDescriptor:");
  if (result)
  {
    id v6 = result;
    v7 = [[MTLLegacySVVisibleFunctionTable alloc] initWithVisibleFunctionTable:result descriptor:a3 computePipeline:self];

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result = (id)-[MTLToolsObject newIntersectionFunctionTableWithDescriptor:](self->super.super._baseObject, "newIntersectionFunctionTableWithDescriptor:");
  if (result)
  {
    id v6 = result;
    v7 = [[MTLLegacySVIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result device:[(MTLToolsComputePipelineState *)self device] descriptor:a3 computePipelineState:self];

    return v7;
  }
  return result;
}

- (id)functionHandleWithFunction:(id)a3
{
  uint64_t v5 = -[MTLToolsObject functionHandleWithFunction:](self->super.super._baseObject, "functionHandleWithFunction:", [a3 baseObject]);
  functionHandleObjectCache = self->super.super._device->functionHandleObjectCache;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __62__MTLLegacySVComputePipelineState_functionHandleWithFunction___block_invoke;
  uint64_t v11 = &unk_264E13C00;
  uint64_t v12 = v5;
  uint64_t v13 = self;
  id v14 = a3;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](functionHandleObjectCache, "getCachedObjectForKey:onMiss:");
}

uint64_t __62__MTLLegacySVComputePipelineState_functionHandleWithFunction___block_invoke(void *a1)
{
  v2 = [MTLLegacySVFunctionHandle alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLLegacySVFunctionHandle *)v2 initWithFunctionHandle:v3 computePiplineState:v4 function:v5];
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "baseObject"));
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  uint64_t v12 = (void *)[(MTLToolsObject *)self->super.super._baseObject newComputePipelineStateWithAdditionalBinaryFunctions:v7 error:a4];

  if (![v12 debugInstrumentationData]) {
    objc_msgSend(v12, "setDebugInstrumentationData:", -[MTLToolsComputePipelineState debugInstrumentationData](self, "debugInstrumentationData"));
  }
  uint64_t v13 = [[MTLLegacySVComputePipelineState alloc] initWithComputePipelineState:v12 binaryFunctions:a3 withState:self device:self->super.super._device pipelineOptions:0];

  return v13;
}

- (MTLLegacySVImageData)kernelFunctionData
{
  return self->_kernelFunctionData;
}

- (MTLLegacySVBuffer)globalConstantsBuffer
{
  kernelFunctionData = self->_kernelFunctionData;
  if (kernelFunctionData) {
    return (MTLLegacySVBuffer *)*((void *)kernelFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (unint64_t)constantOffset
{
  return self->_constantOffset;
}

- (unint64_t)staticThreadgroupMemoryLength
{
  uint64_t v3 = [(MTLToolsObject *)self->super.super._baseObject staticThreadgroupMemoryLength];
  return v3
       + [(MTLDebugInstrumentationData *)[(MTLToolsComputePipelineState *)self debugInstrumentationData] threadgroupArgumentOffset];
}

- (MTLLegacySVBuffer)indirectStateBuffer
{
  return self->_indirectStateBuffer;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_supportsIndirectCommandBuffers)
  {
    uint64_t v3 = *((void *)self->_kernelFunctionData + 1);
    if (v3) {
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v3);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    uint64_t v5 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(binaryFunctionData);
          }
          uint64_t v9 = *(void *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 8);
          if (v9) {
            LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v9);
          }
        }
        uint64_t v6 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)self->_indirectStateBuffer);
  }
  v10.receiver = self;
  v10.super_class = (Class)MTLLegacySVComputePipelineState;
  [(MTLToolsComputePipelineState *)&v10 dealloc];
}

- (int64_t)shaderValidation
{
  return self->_shaderValidation;
}

- (int64_t)shaderValidationState
{
  return self->_shaderValidationState;
}

- (NSArray)binaryFunctionData
{
  return &self->_binaryFunctionData->super;
}

- (int)maxCallStackDepth
{
  return self->_maxCallStackDepth;
}

@end