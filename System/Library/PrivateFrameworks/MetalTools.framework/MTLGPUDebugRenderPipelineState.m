@interface MTLGPUDebugRenderPipelineState
- (MTLGPUDebugBuffer)fragmentConstantsBuffer;
- (MTLGPUDebugBuffer)indirectStateBuffer;
- (MTLGPUDebugBuffer)meshConstantsBuffer;
- (MTLGPUDebugBuffer)objectConstantsBuffer;
- (MTLGPUDebugBuffer)tileConstantsBuffer;
- (MTLGPUDebugBuffer)vertexConstantsBuffer;
- (MTLGPUDebugImageData)fragmentFunctionData;
- (MTLGPUDebugImageData)meshFunctionData;
- (MTLGPUDebugImageData)objectFunctionData;
- (MTLGPUDebugImageData)tileFunctionData;
- (MTLGPUDebugImageData)vertexFunctionData;
- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8;
- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 meshDescriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8;
- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 tileDescriptor:(id)a4 reflection:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7;
- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 vertexBinaryFunctions:(id)a4 fragmentBinaryFunctions:(id)a5 tileBinaryFunctions:(id)a6 objectBinaryFunctions:(id)a7 meshBinaryFunctions:(id)a8 withState:(id)a9 device:(id)a10 pipelineOptions:(unint64_t)a11;
- (MTLRenderPipelineReflection)internalReflection;
- (MTLRenderPipelineReflection)userReflection;
- (NSArray)binaryFunctionData;
- (NSString)UID;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)unwrapBinaryFunctions:(id)a3;
- (int)fragmentMaxCallStackDepth;
- (int)meshMaxCallStackDepth;
- (int)objectMaxCallStackDepth;
- (int)tileMaxCallStackDepth;
- (int)vertexMaxCallStackDepth;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (void)_initConstantsBuffer:(id)a3 device:(id)a4;
- (void)dealloc;
- (void)releaseReflection;
- (void)setUID:(id)a3;
@end

@implementation MTLGPUDebugRenderPipelineState

- (void)_initConstantsBuffer:(id)a3 device:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[MTLGPUDebugImageData setConstantData:](self->_vertexFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_fragmentFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_tileFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_objectFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_meshFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "globalConstantsData"));
  if (self->_supportsIndirectCommandBuffers
    && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x20) != 0)
  {
    v7 = [[MTLGPUDebugPipelineStateInfoEncoder alloc] initWithDevice:self->super.super._device];
    v8 = objc_msgSend((id)objc_msgSend(a4, "baseObject"), "newBufferWithLength:options:", -[MTLGPUDebugPipelineStateInfoEncoder encodedLength](v7, "encodedLength"), 0);
    self->_indirectStateBuffer = -[MTLGPUDebugBuffer initWithBuffer:device:offset:length:track:]([MTLGPUDebugBuffer alloc], "initWithBuffer:device:offset:length:track:", v8, a4, 0, [v8 length], 0);

    [(MTLGPUDebugPipelineStateInfoEncoder *)v7 setArgumentBuffer:self->_indirectStateBuffer offset:0];
    [(MTLGPUDebugPipelineStateInfoEncoder *)v7 setRenderPipelineState:self];

    if ([(MTLGPUDebugRenderPipelineState *)self vertexConstantsBuffer]) {
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self vertexConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self fragmentConstantsBuffer]) {
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self fragmentConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self tileConstantsBuffer]) {
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self tileConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self objectConstantsBuffer]) {
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self objectConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self meshConstantsBuffer]) {
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self meshConstantsBuffer]);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    uint64_t v10 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(binaryFunctionData);
          }
          uint64_t v14 = *(void *)(*(void *)(*((void *)&v15 + 1) + 8 * i) + 8);
          if (v14) {
            GlobalResidentBufferList::addBuffer((uint64_t)&self->super.super._device[4]._memorySize, v14);
          }
        }
        uint64_t v11 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)self->_indirectStateBuffer);
  }
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v67.receiver = self;
  v67.super_class = (Class)MTLGPUDebugRenderPipelineState;
  uint64_t v14 = [(MTLToolsRenderPipelineState *)&v67 initWithBaseObject:a3 parent:a7];
  if (v14)
  {
    if ((*((unsigned char *)a7 + 292) & 2) != 0) {
      v14->_retainedFunctions = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    }
    if ([a4 vertexFunction])
    {
      v14->_vertexMaxCallStackDepth = [a4 maxVertexCallStackDepth];
      uint64_t v15 = [a4 vertexFunction];
      v14->_vertexFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v15, [a3 vertexDebugInstrumentationData]);
      [(NSMutableArray *)v14->_retainedFunctions addObject:v15];
    }
    if ([a4 fragmentFunction])
    {
      v14->_fragmentMaxCallStackDepth = [a4 maxFragmentCallStackDepth];
      uint64_t v16 = [a4 fragmentFunction];
      v14->_fragmentFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v16, [a3 fragmentDebugInstrumentationData]);
      [(NSMutableArray *)v14->_retainedFunctions addObject:v16];
    }
    if ([a4 meshFunction])
    {
      v14->_meshMaxCallStackDepth = [a4 maxMeshCallStackDepth];
      uint64_t v17 = [a4 meshFunction];
      v14->_meshFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v17, [a3 meshDebugInstrumentationData]);
      [(NSMutableArray *)v14->_retainedFunctions addObject:v17];
    }
    id v49 = a7;
    if ([a4 objectFunction])
    {
      v14->_objectMaxCallStackDepth = [a4 maxObjectCallStackDepth];
      uint64_t v18 = [a4 objectFunction];
      v14->_objectFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v18, [a3 objectDebugInstrumentationData]);
      [(NSMutableArray *)v14->_retainedFunctions addObject:v18];
    }
    v14->_supportsIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    unint64_t v48 = a8;
    uint64_t v19 = 1;
    if ((a8 & 0x800000000) == 0) {
      uint64_t v19 = 2;
    }
    v14->_shaderValidation = v19;
    v14->_shaderValidationState = v19;
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "vertexPreloadedLibraries"), "count");
    uint64_t v21 = objc_msgSend((id)objc_msgSend(a4, "fragmentPreloadedLibraries"), "count");
    uint64_t v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexLinkedFunctions"), "binaryFunctions"), "count");
    uint64_t v23 = v21
        + v20
        + v22
        + objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions"), "count");
    if (v23)
    {
      id v47 = a5;
      v14->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v23];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v24 = objc_msgSend((id)objc_msgSend(a4, "vertexLinkedFunctions"), "binaryFunctions");
      uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v64 != v27) {
              objc_enumerationMutation(v24);
            }
            [(NSMutableArray *)v14->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v63 + 1) + 8 * i) + 48)];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v63 objects:v71 count:16];
        }
        while (v26);
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v29 = objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v70 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v60 != v32) {
              objc_enumerationMutation(v29);
            }
            [(NSMutableArray *)v14->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v59 + 1) + 8 * j) + 48)];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v59 objects:v70 count:16];
        }
        while (v31);
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v34 = (void *)[a4 vertexPreloadedLibraries];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v69 count:16];
      a5 = v47;
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v56 != v37) {
              objc_enumerationMutation(v34);
            }
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v55 + 1) + 8 * k) imageData]);
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v69 count:16];
        }
        while (v36);
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v39 = (void *)[a4 fragmentPreloadedLibraries];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v51 objects:v68 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v52 != v42) {
              objc_enumerationMutation(v39);
            }
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v51 + 1) + 8 * m) imageData]);
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v51 objects:v68 count:16];
        }
        while (v41);
      }
    }
    v14->_internalReflection = (MTLRenderPipelineReflection *)a6;
    unint64_t v44 = 0x268A83000;
    if (objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      uint64_t v50 = 0;
      v45 = [a5 newSerializedVertexDataWithFlags:28 options:v48 error:&v50];
      unint64_t v44 = 0x268A83000uLL;
      v14->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x263F129D8]), "initWithVertexData:vertexDynamicLibraries:fragmentData:fragmentDynamicLibraries:serializedVertexDescriptor:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "linkedDynamicLibraries"), v45, objc_msgSend(v49, "baseObject"), v48, 0);
      objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      dispatch_release(v45);
    }
    objc_msgSend(*(id *)((char *)&v14->super.super.super.isa + *(int *)(v44 + 2984)), "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v14->_internalReflection, "performanceStatistics"));
    [(MTLGPUDebugRenderPipelineState *)v14 _initConstantsBuffer:a3 device:v49];
  }
  return v14;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 vertexBinaryFunctions:(id)a4 fragmentBinaryFunctions:(id)a5 tileBinaryFunctions:(id)a6 objectBinaryFunctions:(id)a7 meshBinaryFunctions:(id)a8 withState:(id)a9 device:(id)a10 pipelineOptions:(unint64_t)a11
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)MTLGPUDebugRenderPipelineState;
  uint64_t v17 = [(MTLToolsRenderPipelineState *)&v68 initWithBaseObject:a3 parent:a10];
  if (v17)
  {
    [a4 count];
    [a5 count];
    [a6 count];
    [a7 count];
    [a8 count];
    v17->_vertexFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 8);
    v17->_fragmentFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 9);
    v17->_tileFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 10);
    v17->_objectFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 11);
    v17->_meshFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 12);
    id v18 = a8;
    uint64_t v19 = [*((id *)a9 + 7) count];
    uint64_t v20 = [a4 count];
    uint64_t v21 = v20 + [a5 count];
    uint64_t v22 = v21 + [a6 count];
    uint64_t v23 = v22 + [a7 count];
    id v47 = v18;
    uint64_t v24 = v23 + [v18 count] + v19;
    if (v24) {
      v17->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v24];
    }
    if (*((void *)a9 + 7)) {
      -[NSMutableArray addObjectsFromArray:](v17->_binaryFunctionData, "addObjectsFromArray:");
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v25 = [a4 countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(a4);
          }
          [(NSMutableArray *)v17->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v64 + 1) + 8 * i) + 48)];
        }
        uint64_t v26 = [a4 countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v26);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v29 = [a5 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v61 != v31) {
            objc_enumerationMutation(a5);
          }
          [(NSMutableArray *)v17->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v60 + 1) + 8 * j) + 48)];
        }
        uint64_t v30 = [a5 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v30);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v33 = [a6 countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v57 != v35) {
            objc_enumerationMutation(a6);
          }
          [(NSMutableArray *)v17->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v56 + 1) + 8 * k) + 48)];
        }
        uint64_t v34 = [a6 countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v34);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v37 = [a7 countByEnumeratingWithState:&v52 objects:v70 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v53 != v39) {
            objc_enumerationMutation(a7);
          }
          [(NSMutableArray *)v17->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v52 + 1) + 8 * m) + 48)];
        }
        uint64_t v38 = [a7 countByEnumeratingWithState:&v52 objects:v70 count:16];
      }
      while (v38);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v41 = [v47 countByEnumeratingWithState:&v48 objects:v69 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v49;
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(v47);
          }
          [(NSMutableArray *)v17->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v48 + 1) + 8 * n) + 48)];
        }
        uint64_t v42 = [v47 countByEnumeratingWithState:&v48 objects:v69 count:16];
      }
      while (v42);
    }
    v17->_userReflectiouint64_t n = (MTLRenderPipelineReflection *)*((id *)a9 + 6);
    v17->_internalReflectiouint64_t n = (MTLRenderPipelineReflection *)*((id *)a9 + 5);
    v17->_supportsIndirectCommandBuffers = [a9 supportIndirectCommandBuffers];
    uint64_t v45 = 1;
    if ((a11 & 0x800000000) == 0) {
      uint64_t v45 = 2;
    }
    v17->_shaderValidatiouint64_t n = v45;
    v17->_shaderValidationState = v45;
    [(MTLGPUDebugRenderPipelineState *)v17 _initConstantsBuffer:a3 device:v17->super.super._device];
  }
  return v17;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 tileDescriptor:(id)a4 reflection:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)MTLGPUDebugRenderPipelineState;
  uint64_t v12 = [(MTLToolsRenderPipelineState *)&v38 initWithBaseObject:a3 parent:a6];
  if (v12)
  {
    if ((*((unsigned char *)a6 + 292) & 2) != 0) {
      v12->_retainedFunctions = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    }
    unint64_t v29 = a7;
    if (objc_msgSend(a4, "tileFunction", a5))
    {
      v12->_tileMaxCallStackDepth = [a4 maxCallStackDepth];
      uint64_t v13 = [a4 tileFunction];
      v12->_tileFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v13, [a3 tileDebugInstrumentationData]);
      [(NSMutableArray *)v12->_retainedFunctions addObject:v13];
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions"), "count");
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "preloadedLibraries"), "count") + v14;
    if (v15)
    {
      v12->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions");
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            [(NSMutableArray *)v12->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v34 + 1) + 8 * i) + 48)];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v18);
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v21 = (void *)[a4 preloadedLibraries];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v21);
            }
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v30 + 1) + 8 * j) imageData]);
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v23);
      }
    }
    v12->_internalReflectiouint64_t n = (MTLRenderPipelineReflection *)v28;
    v12->_supportsIndirectCommandBuffers = 0;
    uint64_t v26 = 1;
    if ((v29 & 0x800000000) == 0) {
      uint64_t v26 = 2;
    }
    v12->_shaderValidatiouint64_t n = v26;
    v12->_shaderValidationState = v26;
    v12->_userReflectiouint64_t n = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x263F129D8]), "initWithTileData:tileDynamicLibraries:functionType:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "functionType"), objc_msgSend(a6, "baseObject"), 3, 0);
    objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
    [(MTLRenderPipelineReflection *)v12->_userReflection setPerformanceStatistics:[(MTLRenderPipelineReflection *)v12->_internalReflection performanceStatistics]];
    [(MTLGPUDebugRenderPipelineState *)v12 _initConstantsBuffer:a3 device:a6];
  }
  return v12;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 meshDescriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  v78.receiver = self;
  v78.super_class = (Class)MTLGPUDebugRenderPipelineState;
  uint64_t v12 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v78, sel_initWithBaseObject_parent_, a3, a7, a5);
  if (v12)
  {
    id v52 = a7;
    if ((*((unsigned char *)a7 + 292) & 2) != 0) {
      v12->_retainedFunctions = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    }
    if ([a4 meshFunction])
    {
      v12->_meshMaxCallStackDepth = [a4 maxMeshCallStackDepth];
      uint64_t v13 = [a4 meshFunction];
      v12->_meshFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v13, [a3 meshDebugInstrumentationData]);
      [(NSMutableArray *)v12->_retainedFunctions addObject:v13];
    }
    if ([a4 objectFunction])
    {
      v12->_objectMaxCallStackDepth = [a4 maxObjectCallStackDepth];
      uint64_t v14 = [a4 objectFunction];
      v12->_objectFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v14, [a3 objectDebugInstrumentationData]);
      [(NSMutableArray *)v12->_retainedFunctions addObject:v14];
    }
    if ([a4 fragmentFunction])
    {
      v12->_fragmentMaxCallStackDepth = [a4 maxFragmentCallStackDepth];
      uint64_t v15 = [a4 fragmentFunction];
      v12->_fragmentFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v15, [a3 fragmentDebugInstrumentationData]);
      [(NSMutableArray *)v12->_retainedFunctions addObject:v15];
    }
    uint64_t v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions"), "count");
    uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions"), "count")
        + v16;
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "meshPreloadedLibraries"), "count");
    uint64_t v19 = v17 + v18 + objc_msgSend((id)objc_msgSend(a4, "objectPreloadedLibraries"), "count");
    if (v19)
    {
      v12->_binaryFunctionData = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions");
      uint64_t v21 = [v20 countByEnumeratingWithState:&v74 objects:v84 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v75 != v23) {
              objc_enumerationMutation(v20);
            }
            [(NSMutableArray *)v12->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v74 + 1) + 8 * i) + 48)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v74 objects:v84 count:16];
        }
        while (v22);
      }
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v25 = objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions");
      uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v83 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v71 != v28) {
              objc_enumerationMutation(v25);
            }
            [(NSMutableArray *)v12->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v70 + 1) + 8 * j) + 48)];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v70 objects:v83 count:16];
        }
        while (v27);
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v30 = objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v67 != v33) {
              objc_enumerationMutation(v30);
            }
            [(NSMutableArray *)v12->_binaryFunctionData addObject:*(void *)(*(void *)(*((void *)&v66 + 1) + 8 * k) + 48)];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v32);
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v35 = (void *)[a4 meshPreloadedLibraries];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v81 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v63;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v63 != v38) {
              objc_enumerationMutation(v35);
            }
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v62 + 1) + 8 * m) imageData]);
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v81 count:16];
        }
        while (v37);
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v40 = (void *)[a4 objectPreloadedLibraries];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v80 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v59;
        do
        {
          for (uint64_t n = 0; n != v42; ++n)
          {
            if (*(void *)v59 != v43) {
              objc_enumerationMutation(v40);
            }
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v58 + 1) + 8 * n) imageData]);
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v80 count:16];
        }
        while (v42);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v45 = (void *)[a4 fragmentPreloadedLibraries];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v54 objects:v79 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v55;
        do
        {
          for (iuint64_t i = 0; ii != v47; ++ii)
          {
            if (*(void *)v55 != v48) {
              objc_enumerationMutation(v45);
            }
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", [*(id *)(*((void *)&v54 + 1) + 8 * ii) imageData]);
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v54 objects:v79 count:16];
        }
        while (v47);
      }
    }
    v12->_supportsIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    uint64_t v50 = 1;
    if ((a8 & 0x800000000) == 0) {
      uint64_t v50 = 2;
    }
    v12->_shaderValidatiouint64_t n = v50;
    v12->_shaderValidationState = v50;
    v12->_internalReflectiouint64_t n = (MTLRenderPipelineReflection *)a6;
    if (objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      v12->_userReflectiouint64_t n = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x263F129D8]), "initWithObjectData:objectDynamicLibraries:meshData:meshDynamicLibraries:fragmentData:fragmentDynamicLibraries:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), objc_msgSend(
                                                                (id)[a3 fragmentDebugInstrumentationData],
                                                                "linkedDynamicLibraries"),
                                                              [v52 baseObject],
                                                              a8,
                                                              0);
      objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
    }
    [(MTLRenderPipelineReflection *)v12->_userReflection setPerformanceStatistics:[(MTLRenderPipelineReflection *)v12->_internalReflection performanceStatistics]];
    [(MTLGPUDebugRenderPipelineState *)v12 _initConstantsBuffer:a3 device:v52];
  }
  return v12;
}

- (id)unwrapBinaryFunctions:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = [(MTLToolsRenderPipelineState *)self device];
  if (![a3 count]) {
    return 0;
  }
  [(MTLDevice *)v4 baseObject];
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "baseObject"));
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  uint64_t v7 = -[MTLToolsObject functionHandleWithFunction:stage:](self->super.super._baseObject, "functionHandleWithFunction:stage:", [a3 baseObject], a4);
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](self->super.super._device->functionHandleObjectCache, "getCachedObjectForKey:onMiss:", MEMORY[0x263EF8330], 3221225472, __67__MTLGPUDebugRenderPipelineState_functionHandleWithFunction_stage___block_invoke, &unk_264E13120, v7, self, a3, a4);
}

uint64_t __67__MTLGPUDebugRenderPipelineState_functionHandleWithFunction_stage___block_invoke(void *a1)
{
  v2 = [MTLGPUDebugFunctionHandle alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v5 = a1[7];

  return (uint64_t)[(MTLGPUDebugFunctionHandle *)v2 initWithFunctionHandle:v3 renderPipelineState:v4 stage:v5 function:v6];
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  v9 = objc_opt_new();
  objc_msgSend(v9, "setVertexAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a3));
  objc_msgSend(v9, "setFragmentAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a4));
  uint64_t v14 = 0;
  if (!a5) {
    a5 = (id *)&v14;
  }
  uint64_t v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v9, a5);

  if (![v10 vertexDebugInstrumentationData]) {
    objc_msgSend(v10, "setVertexDebugInstrumentationData:", -[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self, "vertexDebugInstrumentationData"));
  }
  if (![v10 fragmentDebugInstrumentationData]) {
    objc_msgSend(v10, "setFragmentDebugInstrumentationData:", -[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self, "fragmentDebugInstrumentationData"));
  }
  long long v11 = [MTLGPUDebugRenderPipelineState alloc];
  long long v12 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v11, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v10, a3, a4, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], self, self->super.super._device, 0, v14);

  return v12;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = [(MTLGPUDebugRenderPipelineState *)self unwrapBinaryFunctions:a3];
  uint64_t v12 = 0;
  if (a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = (id *)&v12;
  }
  uint64_t v8 = (void *)[(MTLToolsObject *)self->super.super._baseObject newTileRenderPipelineStateWithAdditionalBinaryFunctions:v6 error:v7];

  if (![v8 tileDebugInstrumentationData]) {
    objc_msgSend(v8, "setTileDebugInstrumentationData:", objc_msgSend(v8, "tileDebugInstrumentationData"));
  }
  v9 = [MTLGPUDebugRenderPipelineState alloc];
  uint64_t v10 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v6, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], self, self->super.super._device, 0, v12);

  return v10;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_new();
  objc_msgSend(v7, "setVertexAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setFragmentAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setTileAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "tileAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setObjectAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "objectAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setMeshAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "meshAdditionalBinaryFunctions")));
  uint64_t v17 = 0;
  if (!a4) {
    a4 = (id *)&v17;
  }
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);

  if (![v8 vertexDebugInstrumentationData]) {
    objc_msgSend(v8, "setVertexDebugInstrumentationData:", -[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self, "vertexDebugInstrumentationData"));
  }
  if (![v8 fragmentDebugInstrumentationData]) {
    objc_msgSend(v8, "setFragmentDebugInstrumentationData:", -[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self, "fragmentDebugInstrumentationData"));
  }
  if (![v8 tileDebugInstrumentationData]) {
    objc_msgSend(v8, "setTileDebugInstrumentationData:", -[MTLToolsRenderPipelineState tileDebugInstrumentationData](self, "tileDebugInstrumentationData"));
  }
  if (![v8 objectDebugInstrumentationData]) {
    objc_msgSend(v8, "setObjectDebugInstrumentationData:", -[MTLToolsRenderPipelineState objectDebugInstrumentationData](self, "objectDebugInstrumentationData"));
  }
  if (![v8 meshDebugInstrumentationData]) {
    objc_msgSend(v8, "setMeshDebugInstrumentationData:", -[MTLToolsRenderPipelineState meshDebugInstrumentationData](self, "meshDebugInstrumentationData"));
  }
  v9 = [MTLGPUDebugRenderPipelineState alloc];
  uint64_t v10 = [a3 vertexAdditionalBinaryFunctions];
  uint64_t v11 = [a3 fragmentAdditionalBinaryFunctions];
  uint64_t v12 = [a3 tileAdditionalBinaryFunctions];
  uint64_t v13 = [a3 objectAdditionalBinaryFunctions];
  uint64_t v14 = [a3 meshAdditionalBinaryFunctions];
  uint64_t v15 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, v10, v11, v12, v13, v14, self, self->super.super._device, 0, v17);

  return v15;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v8 = result;
    v9 = [[MTLGPUDebugVisibleFunctionTable alloc] initWithVisibleFunctionTable:result descriptor:a3 renderPipeline:self stage:a4];

    return v9;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:1];
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:2];
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:4];
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:8];
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:16];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v8 = result;
    v9 = [[MTLGPUDebugIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result device:[(MTLToolsRenderPipelineState *)self device] descriptor:a3 renderPipelineState:self stage:a4];

    return v9;
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 stage:1];
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 stage:2];
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 stage:4];
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 stage:8];
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLGPUDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 stage:16];
}

- (void)releaseReflection
{
  self->_internalReflectiouint64_t n = 0;
  self->_userReflectiouint64_t n = 0;
}

- (MTLGPUDebugImageData)vertexFunctionData
{
  return self->_vertexFunctionData;
}

- (MTLGPUDebugImageData)fragmentFunctionData
{
  return self->_fragmentFunctionData;
}

- (MTLGPUDebugImageData)tileFunctionData
{
  return self->_tileFunctionData;
}

- (MTLGPUDebugImageData)objectFunctionData
{
  return self->_objectFunctionData;
}

- (MTLGPUDebugImageData)meshFunctionData
{
  return self->_meshFunctionData;
}

- (MTLRenderPipelineReflection)internalReflection
{
  return self->_internalReflection;
}

- (MTLRenderPipelineReflection)userReflection
{
  return self->_userReflection;
}

- (MTLGPUDebugBuffer)vertexConstantsBuffer
{
  vertexFunctionData = self->_vertexFunctionData;
  if (vertexFunctionData) {
    return (MTLGPUDebugBuffer *)*((void *)vertexFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (MTLGPUDebugBuffer)fragmentConstantsBuffer
{
  fragmentFunctionData = self->_fragmentFunctionData;
  if (fragmentFunctionData) {
    return (MTLGPUDebugBuffer *)*((void *)fragmentFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (MTLGPUDebugBuffer)tileConstantsBuffer
{
  tileFunctionData = self->_tileFunctionData;
  if (tileFunctionData) {
    return (MTLGPUDebugBuffer *)*((void *)tileFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (MTLGPUDebugBuffer)objectConstantsBuffer
{
  objectFunctionData = self->_objectFunctionData;
  if (objectFunctionData) {
    return (MTLGPUDebugBuffer *)*((void *)objectFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (MTLGPUDebugBuffer)meshConstantsBuffer
{
  meshFunctionData = self->_meshFunctionData;
  if (meshFunctionData) {
    return (MTLGPUDebugBuffer *)*((void *)meshFunctionData + 1);
  }
  else {
    return 0;
  }
}

- (MTLGPUDebugBuffer)indirectStateBuffer
{
  return self->_indirectStateBuffer;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_supportsIndirectCommandBuffers)
  {
    GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)self->_indirectStateBuffer);

    if ([(MTLGPUDebugRenderPipelineState *)self vertexConstantsBuffer]) {
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self vertexConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self fragmentConstantsBuffer]) {
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self fragmentConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self tileConstantsBuffer]) {
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self tileConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self objectConstantsBuffer]) {
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self objectConstantsBuffer]);
    }
    if ([(MTLGPUDebugRenderPipelineState *)self meshConstantsBuffer]) {
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)[(MTLGPUDebugRenderPipelineState *)self meshConstantsBuffer]);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    uint64_t v4 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(binaryFunctionData);
          }
          uint64_t v8 = *(void *)(*(void *)(*((void *)&v10 + 1) + 8 * i) + 8);
          if (v8) {
            GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v8);
          }
        }
        uint64_t v5 = [(NSMutableArray *)binaryFunctionData countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderPipelineState;
  [(MTLToolsRenderPipelineState *)&v9 dealloc];
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

- (int)vertexMaxCallStackDepth
{
  return self->_vertexMaxCallStackDepth;
}

- (int)fragmentMaxCallStackDepth
{
  return self->_fragmentMaxCallStackDepth;
}

- (int)meshMaxCallStackDepth
{
  return self->_meshMaxCallStackDepth;
}

- (int)objectMaxCallStackDepth
{
  return self->_objectMaxCallStackDepth;
}

- (int)tileMaxCallStackDepth
{
  return self->_tileMaxCallStackDepth;
}

- (NSString)UID
{
  return self->_UID;
}

- (void)setUID:(id)a3
{
}

@end