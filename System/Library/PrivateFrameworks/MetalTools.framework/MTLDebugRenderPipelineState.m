@interface MTLDebugRenderPipelineState
- (BOOL)isAncestorOf:(id)a3;
- (BOOL)isImageBlockLayoutInputCompatibleWithOutputOf:(id)a3;
- (BOOL)isMeshShaderPipeline;
- (BOOL)rasterizationEnabled;
- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6;
- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 meshDescriptor:(id)a6;
- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 tileDescriptor:(id)a6;
- (MTLMeshRenderPipelineDescriptor)meshDescriptor;
- (MTLRenderPipelineDescriptor)descriptor;
- (MTLRenderPipelineReflection)reflection;
- (MTLTileRenderPipelineDescriptor)tileDescriptor;
- (id)_findMasterStruct:(id)a3 includeImageBlockData:(BOOL)a4;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4 stage:(unint64_t)a5;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5;
- (id)getParameter:(id)a3;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 withStage:(unint64_t)a4 selector:(SEL)a5;
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
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)outputImageBlockData;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)validateBinaryFunctions:(id)a3 stage:(unint64_t)a4;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (unint64_t)attachmentWriteMask;
- (void)_updateCachedMeshPipelineState;
- (void)_updateCachedPipelineState;
- (void)_updateCachedTilePipelineState;
- (void)_validateThreadgroupSize:(id *)a3 stage:(unint64_t)a4 context:(_MTLMessageContext *)a5;
- (void)dealloc;
- (void)validateHandleForSetFunction:(id)a3;
@end

@implementation MTLDebugRenderPipelineState

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderPipelineState;
  v8 = [(MTLToolsRenderPipelineState *)&v12 initWithBaseObject:a3 parent:a5];
  if (v8)
  {
    v9 = (MTLRenderPipelineDescriptor *)[a6 copy];
    v8->_descriptor = v9;
    [(MTLRenderPipelineDescriptor *)v9 setBinaryArchives:0];
    uint64_t v10 = MEMORY[0x263EFFA68];
    [(MTLRenderPipelineDescriptor *)v8->_descriptor setVertexPreloadedLibraries:MEMORY[0x263EFFA68]];
    [(MTLRenderPipelineDescriptor *)v8->_descriptor setFragmentPreloadedLibraries:v10];
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    [(MTLDebugRenderPipelineState *)v8 _updateCachedPipelineState];
  }
  return v8;
}

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 tileDescriptor:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugRenderPipelineState;
  v8 = [(MTLToolsRenderPipelineState *)&v11 initWithBaseObject:a3 parent:a5];
  if (v8)
  {
    v9 = (MTLTileRenderPipelineDescriptor *)[a6 copy];
    v8->_tileDescriptor = v9;
    [(MTLTileRenderPipelineDescriptor *)v9 setBinaryArchives:0];
    [(MTLTileRenderPipelineDescriptor *)v8->_tileDescriptor setPreloadedLibraries:MEMORY[0x263EFFA68]];
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    [(MTLDebugRenderPipelineState *)v8 _updateCachedTilePipelineState];
  }
  return v8;
}

- (void)_updateCachedTilePipelineState
{
  uint64_t v3 = [(MTLTileRenderPipelineDescriptor *)self->_tileDescriptor _descriptorPrivate];
  uint64_t v4 = 0;
  self->_rasterSampleCount = *(void *)(v3 + 8);
  do
  {
    v5 = (void *)[*(id *)v3 objectAtIndexedSubscript:v4];
    if (v5) {
      v5 = (void *)[v5 pixelFormat];
    }
    self->_colorPixelFormat[v4++] = (unint64_t)v5;
  }
  while (v4 != 8);
  self->_threadgroupSizeMatchesTileSize = *(unsigned char *)(v3 + 32);
}

- (id)_findMasterStruct:(id)a3 includeImageBlockData:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id result = (id)[a3 count];
  if (!result) {
    return result;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "type");
    if (v8 == 16) {
      break;
    }
    if (v8 == 17) {
      goto LABEL_11;
    }
LABEL_8:
    if ([a3 count] <= (unint64_t)++v7) {
      return 0;
    }
  }
  if (!v4) {
    goto LABEL_8;
  }
LABEL_11:
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "imageBlockMasterStructMembers");
  if (!result)
  {
    v9 = (void *)[a3 objectAtIndexedSubscript:v7];
    return (id)[v9 dataTypeDescription];
  }
  return result;
}

- (id)outputImageBlockData
{
  id result = -[MTLDebugRenderPipelineState _findMasterStruct:includeImageBlockData:](self, "_findMasterStruct:includeImageBlockData:", (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", -[MTLRenderPipelineReflection imageBlockDataReturn](self->_reflection, "imageBlockDataReturn"), 0), 1);
  if (!result)
  {
    BOOL v4 = [(MTLRenderPipelineReflection *)self->_reflection tileArguments];
    return [(MTLDebugRenderPipelineState *)self _findMasterStruct:v4 includeImageBlockData:0];
  }
  return result;
}

- (BOOL)isImageBlockLayoutInputCompatibleWithOutputOf:(id)a3
{
  id v5 = [(MTLDebugRenderPipelineState *)self _findMasterStruct:[(MTLRenderPipelineReflection *)[(MTLDebugRenderPipelineState *)self reflection] tileArguments] includeImageBlockData:1];
  if (!v5) {
    id v5 = [(MTLDebugRenderPipelineState *)self _findMasterStruct:[(MTLRenderPipelineReflection *)[(MTLDebugRenderPipelineState *)self reflection] fragmentArguments] includeImageBlockData:1];
  }
  v6 = (void *)[a3 outputImageBlockData];
  if (!v6 || !v5) {
    return 1;
  }

  return [v6 isStructLayoutThreadSafeWith:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugRenderPipelineState;
  [(MTLToolsRenderPipelineState *)&v3 dealloc];
}

- (BOOL)rasterizationEnabled
{
  if (self->_descriptor) {
    return [(MTLRenderPipelineDescriptor *)self->_descriptor isRasterizationEnabled];
  }
  else {
    return self->_tileDescriptor != 0;
  }
}

- (void)_updateCachedPipelineState
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTLRenderPipelineDescriptor *)self->_descriptor _descriptorPrivate];
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  self->_rasterSampleCount = *(void *)(v3 + 184);
  do
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)v3, "_descriptorAtIndex:", v5), "_descriptorPrivate");
    if (v7)
    {
      unint64_t v8 = *v7 >> 36;
      self->_colorPixelFormat[v5] = v8;
      if (v8) {
        uint64_t v6 = (((*v7 >> 27) & 0xFLL) << v4) | v6 & ~(15 << v4);
      }
    }
    else
    {
      self->_colorPixelFormat[v5] = 0;
    }
    ++v5;
    v4 += 4;
  }
  while (v5 != 8);
  unint64_t v9 = *(void *)(v3 + 72);
  self->_depthPixelFormat = v9;
  if (v9) {
    unint64_t v10 = v6 | 0x100000000;
  }
  else {
    unint64_t v10 = v6;
  }
  unint64_t v11 = *(void *)(v3 + 80);
  self->_stencilPixelFormat = v11;
  if (v11) {
    v10 |= 0x600000000uLL;
  }
  self->_attachmentWriteMask = v10;
  objc_super v12 = *(void **)(v3 + 272);
  if (v12)
  {
    v13 = (void *)[v12 layouts];
    unint64_t v14 = 0;
    self->_vertexDescriptorLayoutCount = 0;
    do
    {
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v14), "stride");
      if (v15)
      {
        v16 = &self->_vertexDescriptorLayouts[self->_vertexDescriptorLayoutCount];
        v16->bufferIndex = v14;
        v16->bufferStride = v15;
        ++self->_vertexDescriptorLayoutCount;
      }
      ++v14;
    }
    while (v14 != 31);
  }
  p_maxInstanceCount = &self->_maxInstanceCount;
  self->_maxInstanceCount = 0xFFFFFFFFLL;
  p_maxPatchCount = &self->_maxPatchCount;
  self->_maxPatchCount = 0xFFFFFFFFLL;
  p_maxVertexCount = &self->_maxVertexCount;
  self->_maxVertexCount = 0xFFFFFFFFLL;
  v20 = (void *)[(MTLRenderPipelineReflection *)self->_reflection vertexBuiltInArguments];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
LABEL_19:
    uint64_t v24 = 0;
    while (2)
    {
      if (*(void *)v32 != v23) {
        objc_enumerationMutation(v20);
      }
      v25 = *(void **)(*((void *)&v31 + 1) + 8 * v24);
      unint64_t v26 = __ROR8__([v25 builtInDataType] - 29, 2);
      if (v26 > 3) {
        unint64_t v27 = 0xFFFFFFFFLL;
      }
      else {
        unint64_t v27 = qword_23BE4ADC8[v26];
      }
      uint64_t v28 = [v25 builtInType];
      v29 = p_maxVertexCount;
      switch(v28)
      {
        case 1:
        case 3:
          goto LABEL_29;
        case 2:
        case 4:
          v29 = p_maxInstanceCount;
          goto LABEL_29;
        default:
          if (v28 != 13) {
            goto LABEL_32;
          }
          v29 = p_maxPatchCount;
LABEL_29:
          unint64_t v30 = *v29;
          if (*v29 >= v27) {
            unint64_t v30 = v27;
          }
          unint64_t *v29 = v30;
LABEL_32:
          if (v22 != ++v24) {
            continue;
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (!v22) {
            return;
          }
          goto LABEL_19;
      }
    }
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugRenderPipelineState;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLToolsObject description](&v4, sel_description), -[MTLRenderPipelineDescriptor formattedDescription:](self->_descriptor, "formattedDescription:", a3 + 4)];
}

- (id)description
{
  return [(MTLDebugRenderPipelineState *)self formattedDescription:0];
}

- (id)getParameter:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 getParameter:a3];
}

- (BOOL)isAncestorOf:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = a3;
  id v5 = a3;
  while (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v6 = (MTLDebugRenderPipelineState *)[v3 parent];

    uint64_t v3 = v6;
    if (v6 == self)
    {
      BOOL v7 = 1;
      uint64_t v3 = self;
      goto LABEL_8;
    }
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)validateHandleForSetFunction:(id)a3
{
  [a3 function];
  id v5 = (id)[a3 parent];
  if (([v5 isAncestorOf:self] & 1) == 0
    && ![(MTLDebugRenderPipelineState *)self isAncestorOf:v5])
  {
    objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
    MTLReportFailure();
  }
}

- (id)validateBinaryFunctions:(id)a3 stage:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(MTLToolsRenderPipelineState *)self device];
  if (![a3 count]) {
    return 0;
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](v6, "baseObject"), "supportsFunctionPointers") & 1) == 0)
  {
    unint64_t v14 = MTLDebugStageToString(a4);
    MTLReportFailure();
  }
  BOOL v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count", v14));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_super v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "baseObject", v15, v16);
        [v7 addObject:v12];
        if (![v12 precompiledOutput])
        {
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "name"), "UTF8String");
          v16 = MTLDebugStageToString(a4);
          MTLReportFailure();
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  return v7;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  if ([a3 count]
    && ![(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingVertexBinaryFunctions])
  {
    MTLReportFailure();
  }
  if ([a4 count]
    && ![(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingFragmentBinaryFunctions])
  {
    MTLReportFailure();
  }
  id v9 = [(MTLDebugRenderPipelineState *)self validateBinaryFunctions:a3 stage:2];
  id v10 = [(MTLDebugRenderPipelineState *)self validateBinaryFunctions:a4 stage:3];
  uint64_t v19 = 0;
  if (!a5) {
    a5 = (id *)&v19;
  }
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", v9, v10, a5);
  objc_super v12 = (void *)v11;
  if (v19)
  {
    uint64_t v18 = v19;
    MTLReportFailure();
    if (v12) {
      goto LABEL_11;
    }
    return 0;
  }
  if (!v11) {
    return 0;
  }
LABEL_11:
  v13 = (void *)[(MTLRenderPipelineDescriptor *)self->_descriptor copy];
  id v14 = objc_alloc_init(MEMORY[0x263F12940]);
  [v14 setBinaryFunctions:a3];
  [v13 setVertexLinkedFunctions:v14];

  id v15 = objc_alloc_init(MEMORY[0x263F12940]);
  [v15 setBinaryFunctions:a4];
  [v13 setFragmentLinkedFunctions:v15];

  v16 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:v12 reflection:self->_reflection parent:self descriptor:v13];
  return v16;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  if (![(MTLTileRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self tileDescriptor] supportAddingBinaryFunctions])MTLReportFailure(); {
  id v7 = [(MTLDebugRenderPipelineState *)self validateBinaryFunctions:a3 stage:4];
  }
  uint64_t v15 = 0;
  if (!a4) {
    a4 = (id *)&v15;
  }
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);
  id v9 = (void *)v8;
  if (v15)
  {
    uint64_t v14 = v15;
    MTLReportFailure();
    if (v9) {
      goto LABEL_7;
    }
    return 0;
  }
  if (!v8) {
    return 0;
  }
LABEL_7:
  id v10 = (void *)[(MTLTileRenderPipelineDescriptor *)self->_tileDescriptor copy];
  id v11 = objc_alloc_init(MEMORY[0x263F12940]);
  [v11 setBinaryFunctions:a3];
  [v10 setLinkedFunctions:v11];

  objc_super v12 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:v9 reflection:self->_reflection parent:self tileDescriptor:v10];
  return v12;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count") != 0;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count") != 0;
  if (v8 == v7) {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count")
    && ![(MTLTileRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self tileDescriptor] supportAddingBinaryFunctions])
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), "count")
    && ![(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingFragmentBinaryFunctions])
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), "count")
    && ![(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingVertexBinaryFunctions])
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    && ([(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingObjectBinaryFunctions] & 1) == 0)
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count")
    && ([(MTLRenderPipelineDescriptor *)[(MTLDebugRenderPipelineState *)self descriptor] supportAddingMeshBinaryFunctions] & 1) == 0)
  {
    MTLReportFailure();
  }
  id v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setVertexAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), 2));
  objc_msgSend(v9, "setFragmentAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), 3));
  objc_msgSend(v9, "setTileAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"), 4));
  objc_msgSend(v9, "setObjectAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "objectAdditionalBinaryFunctions"), 5));
  objc_msgSend(v9, "setMeshAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "meshAdditionalBinaryFunctions"), 6));
  uint64_t v20 = 0;
  if (!a4) {
    a4 = (id *)&v20;
  }
  id v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v9, a4);
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
  {
    id v11 = (void *)[(MTLTileRenderPipelineDescriptor *)self->_tileDescriptor copy];
    id v12 = (id)objc_opt_new();
    objc_msgSend(v12, "setBinaryFunctions:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"));
    [v11 setLinkedFunctions:v12];
    v13 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:v10 reflection:self->_reflection parent:self tileDescriptor:v11];
  }
  else
  {
    id v11 = (void *)[(MTLRenderPipelineDescriptor *)self->_descriptor copy];
    id v14 = (id)objc_opt_new();
    objc_msgSend(v14, "setBinaryFunctions:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"));
    [v11 setVertexLinkedFunctions:v14];
    id v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setBinaryFunctions:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"));
    [v11 setFragmentLinkedFunctions:v15];
    id v16 = (id)objc_opt_new();
    objc_msgSend(v16, "setBinaryFunctions:", objc_msgSend(a3, "objectAdditionalBinaryFunctions"));
    [v11 setObjectLinkedFunctions:v16];
    id v17 = (id)objc_opt_new();
    objc_msgSend(v17, "setBinaryFunctions:", objc_msgSend(a3, "meshAdditionalBinaryFunctions"));
    [v11 setMeshLinkedFunctions:v17];
    v13 = [[MTLDebugRenderPipelineState alloc] initWithPipelineState:v10 reflection:self->_reflection parent:self descriptor:v11];
  }
  uint64_t v18 = v13;

  return v18;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5
{
  if (objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsRenderPipelineState device](self, "device"), "baseObject"), "supportsFunctionPointers"))
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
    }
  }
  MTLReportFailure();
LABEL_4:
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, a3);
  if (result)
  {
    id v10 = result;
    id v11 = [MTLDebugVisibleFunctionTable alloc];
    return [(MTLDebugVisibleFunctionTable *)v11 initWithVisibleFunctionTable:v10 parent:self descriptor:a3 pipelineState:self stage:a4];
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:2 selector:a2];
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:3 selector:a2];
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:4 selector:a2];
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:5 selector:a2];
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newVisibleFunctionTableWithDescriptor:a3 stage:6 selector:a2];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_4:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_5;
      }
    }
  }
  MTLReportFailure();
LABEL_5:
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLDebugVisibleFunctionTable alloc] initWithVisibleFunctionTable:result parent:self descriptor:a3 pipelineState:self stage:MTLRenderStagesToDebugStage(a4)];

    return v9;
  }
  return result;
}

- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4 stage:(unint64_t)a5
{
  id v9 = *(void **)([a4 device] + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__MTLDebugRenderPipelineState_functionHandleToDebugFunctionHandle_parentFunction_stage___block_invoke;
  v11[3] = &unk_264E13120;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a4;
  v11[7] = a5;
  return (id)[v9 getCachedObjectForKey:a3 onMiss:v11];
}

uint64_t __88__MTLDebugRenderPipelineState_functionHandleToDebugFunctionHandle_parentFunction_stage___block_invoke(void *a1)
{
  v2 = [MTLDebugFunctionHandle alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];

  return (uint64_t)[(MTLDebugFunctionHandle *)v2 initWithBaseObject:v3 parent:v4 function:v5 stage:v6];
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5
{
  if (!a3 || ([a3 conformsToProtocol:&unk_26EF98320] & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, objc_msgSend(a3, "baseObject"));

  return [(MTLDebugRenderPipelineState *)self functionHandleToDebugFunctionHandle:v9 parentFunction:a3 stage:a4];
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self functionHandleWithFunction:a3 stage:2 selector:a2];
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self functionHandleWithFunction:a3 stage:3 selector:a2];
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self functionHandleWithFunction:a3 stage:4 selector:a2];
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self functionHandleWithFunction:a3 stage:5 selector:a2];
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self functionHandleWithFunction:a3 stage:6 selector:a2];
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_4:
      if ([a3 conformsToProtocol:&unk_26EF98320]) {
        goto LABEL_5;
      }
    }
  }
  MTLReportFailure();
LABEL_5:
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4);
  uint64_t v8 = MTLRenderStagesToDebugStage(a4);

  return [(MTLDebugRenderPipelineState *)self functionHandleToDebugFunctionHandle:v7 parentFunction:a3 stage:v8];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 withStage:(unint64_t)a4 selector:(SEL)a5
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, a3);
  if (result)
  {
    id v10 = result;
    id v11 = [MTLDebugIntersectionFunctionTable alloc];
    return [(MTLDebugIntersectionFunctionTable *)v11 initWithIntersectionFunctionTable:v10 parent:self descriptor:a3 stage:a4];
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 withStage:2 selector:a2];
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 withStage:3 selector:a2];
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 withStage:4 selector:a2];
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 withStage:5 selector:a2];
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return [(MTLDebugRenderPipelineState *)self newIntersectionFunctionTableWithDescriptor:a3 withStage:6 selector:a2];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_4:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_5;
      }
    }
  }
  MTLReportFailure();
LABEL_5:
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLDebugIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result parent:self descriptor:a3 stage:MTLRenderStagesToDebugStage(a4)];

    return v9;
  }
  return result;
}

- (BOOL)isMeshShaderPipeline
{
  return [(MTLRenderPipelineDescriptor *)self->_descriptor meshFunction] || self->_meshDescriptor != 0;
}

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 meshDescriptor:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderPipelineState;
  id v8 = [(MTLToolsRenderPipelineState *)&v12 initWithBaseObject:a3 parent:a5];
  if (v8)
  {
    uint64_t v9 = (MTLMeshRenderPipelineDescriptor *)[a6 copy];
    v8->_meshDescriptor = v9;
    [(MTLMeshRenderPipelineDescriptor *)v9 setBinaryArchives:0];
    uint64_t v10 = MEMORY[0x263EFFA68];
    [(MTLMeshRenderPipelineDescriptor *)v8->_meshDescriptor setObjectPreloadedLibraries:MEMORY[0x263EFFA68]];
    [(MTLMeshRenderPipelineDescriptor *)v8->_meshDescriptor setMeshPreloadedLibraries:v10];
    [(MTLMeshRenderPipelineDescriptor *)v8->_meshDescriptor setFragmentPreloadedLibraries:v10];
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    [(MTLDebugRenderPipelineState *)v8 _updateCachedMeshPipelineState];
  }
  return v8;
}

- (void)_updateCachedMeshPipelineState
{
  uint64_t v3 = [(MTLMeshRenderPipelineDescriptor *)self->_meshDescriptor _descriptorPrivate];
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  self->_rasterSampleCount = *(void *)(v3 + 32);
  do
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)v3, "_descriptorAtIndex:", v5), "_descriptorPrivate");
    if (v7)
    {
      unint64_t v8 = *v7 >> 36;
      self->_colorPixelFormat[v5] = v8;
      if (v8) {
        uint64_t v6 = (((*v7 >> 27) & 0xFLL) << v4) | v6 & ~(15 << v4);
      }
    }
    else
    {
      self->_colorPixelFormat[v5] = 0;
    }
    ++v5;
    v4 += 4;
  }
  while (v5 != 8);
  unint64_t v9 = *(void *)(v3 + 8);
  self->_depthPixelFormat = v9;
  uint64_t v10 = v6 | 0x100000000;
  BOOL v11 = v9 == 0;
  unint64_t v12 = *(void *)(v3 + 16);
  self->_stencilPixelFormat = v12;
  if (v11) {
    uint64_t v10 = v6;
  }
  if (v12) {
    unint64_t v13 = v10 | 0x600000000;
  }
  else {
    unint64_t v13 = v10;
  }
  self->_attachmentWriteMask = v13;
  self->_vertexDescriptorLayoutCount = 0;
  self->_maxInstanceCount = 0;
  self->_maxPatchCount = 0;
  self->_maxVertexCount = 0;
}

- (void)_validateThreadgroupSize:(id *)a3 stage:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  meshDescriptor = self->_meshDescriptor;
  if (!meshDescriptor) {
    meshDescriptor = self->_descriptor;
  }
  if (a4 == 16)
  {
    if (!objc_msgSend(meshDescriptor, "meshFunction", a3, 16, a5)) {
      return;
    }
    unint64_t v8 = [(MTLToolsObject *)self->super.super._baseObject maxTotalThreadsPerMeshThreadgroup];
    int v9 = [meshDescriptor meshThreadgroupSizeIsMultipleOfThreadExecutionWidth];
    unint64_t v10 = [(MTLToolsObject *)self->super.super._baseObject meshThreadExecutionWidth];
  }
  else
  {
    if (a4 != 8 || !objc_msgSend(meshDescriptor, "objectFunction", a3, 8, a5)) {
      return;
    }
    unint64_t v8 = [(MTLToolsObject *)self->super.super._baseObject maxTotalThreadsPerObjectThreadgroup];
    int v9 = [meshDescriptor objectThreadgroupSizeIsMultipleOfThreadExecutionWidth];
    unint64_t v10 = [(MTLToolsObject *)self->super.super._baseObject objectThreadExecutionWidth];
  }
  unint64_t v11 = a3->var1 * a3->var0 * a3->var2;
  if (v11 > v8) {
    _MTLMessageContextPush_();
  }
  if (v10) {
    int v12 = v9;
  }
  else {
    int v12 = 0;
  }
  if (v12 == 1)
  {
    if (v11 % v10) {
      _MTLMessageContextPush_();
    }
  }
}

- (int64_t)shaderValidation
{
  id v2 = [(MTLToolsObject *)self baseObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 2;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v2 = (id)[v2 baseObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 2;
    }
  }

  return [v2 shaderValidation];
}

- (int64_t)shaderValidationState
{
  id v2 = [(MTLToolsObject *)self baseObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 2;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v2 = (id)[v2 baseObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 2;
    }
  }

  return [v2 shaderValidationState];
}

- (unint64_t)attachmentWriteMask
{
  return self->_attachmentWriteMask;
}

- (MTLRenderPipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (MTLRenderPipelineReflection)reflection
{
  return self->_reflection;
}

- (MTLTileRenderPipelineDescriptor)tileDescriptor
{
  return self->_tileDescriptor;
}

- (MTLMeshRenderPipelineDescriptor)meshDescriptor
{
  return self->_meshDescriptor;
}

@end