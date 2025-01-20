@interface IdcContentPreservingWarping
+ (void)getDefaultConfigurationParameters:(id *)a3;
- (IdcContentPreservingWarping)initWithMetalContext:(id)a3 idcUtilities:(id)a4;
- (int)compileShaders:(BOOL)a3;
- (int)computeSizeOfSharedMetalBuffer:(id *)a3 maximumSegmentationMaskWidth:(unsigned int)a4 maximumSegmentationMaskHeight:(unsigned int)a5;
- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id *)a4 sharedMemoryBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7;
- (int)process:(id *)a3 segmentationMaskTex:(id)a4 extendedMeshTex:(id)a5 invertedMeshTex:(id)a6 detectedLines:(id *)a7 executionErrorInformation:(id *)a8;
- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
- (void)dealloc;
- (void)fillEdParameters:(id *)a3;
- (void)releaseResources;
@end

@implementation IdcContentPreservingWarping

+ (void)getDefaultConfigurationParameters:(id *)a3
{
  if (a3)
  {
    *(_OWORD *)&a3->var21[1].var0[4] = xmmword_262F34790;
    *(void *)&a3->var21[2].var0[1] = 10;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (IdcContentPreservingWarping)initWithMetalContext:(id)a3 idcUtilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)IdcContentPreservingWarping;
    v10 = [(IdcContentPreservingWarping *)&v13 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_metalContext, a3);
      objc_storeStrong((id *)&v11->_idcUtilities, a4);
      v11->_sharedMetalBuffer.resourcesAssigned = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    v11 = 0;
  }

  return v11;
}

- (int)compileShaders:(BOOL)a3
{
  v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEdStage1" constants:0];
  generateEdStage1 = self->_kernels.generateEdStage1;
  self->_kernels.generateEdStage1 = v5;

  if (!self->_kernels.generateEdStage1) {
    goto LABEL_23;
  }
  id v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEdStage2" constants:0];
  generateEdStage2 = self->_kernels.generateEdStage2;
  self->_kernels.generateEdStage2 = v7;

  if (!self->_kernels.generateEdStage2) {
    goto LABEL_23;
  }
  v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEdStage3" constants:0];
  generateEdStage3 = self->_kernels.generateEdStage3;
  self->_kernels.generateEdStage3 = v9;

  if (!self->_kernels.generateEdStage3) {
    goto LABEL_23;
  }
  v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEdColumns" constants:0];
  generateEdColumns = self->_kernels.generateEdColumns;
  self->_kernels.generateEdColumns = v11;

  if (!self->_kernels.generateEdColumns) {
    goto LABEL_23;
  }
  objc_super v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEdBuildAtA_Atb" constants:0];
  generateEdBuildAtA_Atb = self->_kernels.generateEdBuildAtA_Atb;
  self->_kernels.generateEdBuildAtA_Atb = v13;

  if (!self->_kernels.generateEdBuildAtA_Atb) {
    goto LABEL_23;
  }
  v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEsPresetWeightArray" constants:0];
  generateEsPresetWeightArray = self->_kernels.generateEsPresetWeightArray;
  self->_kernels.generateEsPresetWeightArray = v15;

  if (!self->_kernels.generateEsPresetWeightArray) {
    goto LABEL_23;
  }
  v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEsBuildWeightArray" constants:0];
  generateEsBuildWeightArray = self->_kernels.generateEsBuildWeightArray;
  self->_kernels.generateEsBuildWeightArray = v17;

  if (!self->_kernels.generateEsBuildWeightArray) {
    goto LABEL_23;
  }
  v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEsStage1" constants:0];
  generateEsStage1 = self->_kernels.generateEsStage1;
  self->_kernels.generateEsStage1 = v19;

  if (!self->_kernels.generateEsStage1) {
    goto LABEL_23;
  }
  v21 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEsStage2" constants:0];
  generateEsStage2 = self->_kernels.generateEsStage2;
  self->_kernels.generateEsStage2 = v21;

  if (!self->_kernels.generateEsStage2) {
    goto LABEL_23;
  }
  v23 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateEsStage3" constants:0];
  generateEsStage3 = self->_kernels.generateEsStage3;
  self->_kernels.generateEsStage3 = v23;

  if (!self->_kernels.generateEsStage3) {
    goto LABEL_23;
  }
  v25 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateElStage1" constants:0];
  generateElStage1 = self->_kernels.generateElStage1;
  self->_kernels.generateElStage1 = v25;

  if (!self->_kernels.generateElStage1) {
    goto LABEL_23;
  }
  v27 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateElStage2" constants:0];
  generateElStage2 = self->_kernels.generateElStage2;
  self->_kernels.generateElStage2 = v27;

  if (!self->_kernels.generateElStage2) {
    goto LABEL_23;
  }
  v29 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::substitution" constants:0];
  substitution = self->_kernels.substitution;
  self->_kernels.substitution = v29;

  if (!self->_kernels.substitution) {
    goto LABEL_23;
  }
  v31 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::generateExtendedMesh" constants:0];
  generateExtendedMesh = self->_kernels.generateExtendedMesh;
  self->_kernels.generateExtendedMesh = v31;

  if (!self->_kernels.generateExtendedMesh) {
    goto LABEL_23;
  }
  v33 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::validateExtendedMesh" constants:0];
  validateExtendedMesh = self->_kernels.validateExtendedMesh;
  self->_kernels.validateExtendedMesh = v33;

  if (!self->_kernels.validateExtendedMesh) {
    goto LABEL_23;
  }
  v35 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"icpw_kernels::invertMesh" constants:0];
  invertMesh = self->_kernels.invertMesh;
  self->_kernels.invertMesh = v35;

  if (self->_kernels.invertMesh)
  {
    if (!a3)
    {
      id v37 = objc_alloc(MEMORY[0x263F13338]);
      v38 = [(FigMetalContext *)self->_metalContext device];
      v39 = (MPSMatrixDecompositionCholesky *)[v37 initWithDevice:v38 lower:1 order:216];
      choleskyDecomposition = self->_choleskyDecomposition;
      self->_choleskyDecomposition = v39;

      if (self->_choleskyDecomposition)
      {
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        int v44 = 0;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_262F2C3E8;
        block[3] = &unk_2655C1BE8;
        block[4] = self;
        block[5] = v43;
        if (qword_26B425E50 != -1) {
          dispatch_once(&qword_26B425E50, block);
        }
        _Block_object_dispose(v43, 8);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    return 0;
  }
  else
  {
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
}

- (void)releaseResources
{
  v2 = self;
  buffer = self->_sharedMetalBuffer.buffer;
  self->_sharedMetalBuffer.buffer = 0;

  v2->_sharedMetalBuffer.offset = 0;
  v2->_sharedMetalBuffer.size = 0;
  v2->_sharedMetalBuffer.resourcesAssigned = 0;
  FigMetalDecRef();
  *(_OWORD *)&v2->_offsets.es.arrayOfContainers = 0u;
  v2 = (IdcContentPreservingWarping *)((char *)v2 + 184);
  *(_OWORD *)&v2->_sharedMetalBuffer.resourcesAssigned = 0u;
  v2 = (IdcContentPreservingWarping *)((char *)v2 + 176);
  v2[-1]._AtA_matrix = 0;
  *(_OWORD *)&v2[-1]._offsets.matrixAtA = 0u;
  *(_OWORD *)&v2[-1]._textures.erodedSegmentationMask = 0u;
  *(_OWORD *)&v2[-1]._offsets.edRowSubSeqData = 0u;
  *(_OWORD *)&v2[-1]._offsets.edOffset = 0u;
  *(_OWORD *)&v2[-1]._offsets.edNumSamplesPerCell = 0u;
  *(void *)&v2[-1]._currentMemoryAllocationParameters.numCells = 0;
  *(void *)&v2[-1]._currentMemoryAllocationParameters.meshNumNodes = 0;
  *(void *)&v2[-1]._currentMemoryAllocationParameters.segmentationMaskWidth = 0;
  *(void *)v2[-1]._edParameters.invPolynomial = 0;
  *(void *)&v2[-1]._edParameters.invPolynomial[2] = 0;
  *(void *)&v2[-1]._edParameters.invPolynomial[4] = 0;
  *(_OWORD *)&v2->_idcUtilities = 0u;
  *(_OWORD *)&v2->_kernels.generateEdStage2 = 0u;
  *(_OWORD *)&v2->_kernels.generateEdColumns = 0u;
  *(_OWORD *)&v2->_kernels.generateEsPresetWeightArray = 0u;
  *(_OWORD *)&v2->_kernels.generateEsStage1 = 0u;
  *(_OWORD *)&v2->_kernels.generateEsStage3 = 0u;
  v2->_kernels.generateElStage2 = 0;
}

- (void)dealloc
{
  [(IdcContentPreservingWarping *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)IdcContentPreservingWarping;
  [(IdcContentPreservingWarping *)&v3 dealloc];
}

- (int)computeSizeOfSharedMetalBuffer:(id *)a3 maximumSegmentationMaskWidth:(unsigned int)a4 maximumSegmentationMaskHeight:(unsigned int)a5
{
  if (a3)
  {
    a3->var0 = 0;
    int v8 = -[IdcContentPreservingWarping memoryAllocationHandler:memoryAllocationParameters:sharedMemoryBuffer:sharedMetalBufferOffset:sharedMetalBufferSize:](self, "memoryAllocationHandler:memoryAllocationParameters:sharedMemoryBuffer:sharedMetalBufferOffset:sharedMetalBufferSize:");
    if (v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      *(_OWORD *)&self->_maximumMemoryAllocationParameters.numCells = xmmword_262F347A0;
      self->_maximumMemoryAllocationParameters.segmentationMaskWidth = a4;
      self->_maximumMemoryAllocationParameters.segmentationMaskHeight = a5;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v8;
}

- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v9 = a3;
  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedMetalBuffer.buffer, a3);
    int v10 = 0;
    self->_sharedMetalBuffer.offset = a4;
    self->_sharedMetalBuffer.size = a5;
    self->_sharedMetalBuffer.resourcesAssigned = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v10 = -12780;
  }

  return v10;
}

- (int)process:(id *)a3 segmentationMaskTex:(id)a4 extendedMeshTex:(id)a5 invertedMeshTex:(id)a6 detectedLines:(id *)a7 executionErrorInformation:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a3) {
    goto LABEL_46;
  }
  if ((a3->var15.var0.var5 - 4225) < 0xFFFFEF9F || (a3->var16.var0 - 3169) < 0xFFFFF3BF) {
    goto LABEL_4;
  }
  if (!v14)
  {
LABEL_46:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_4:
    int v17 = -12780;
    goto LABEL_5;
  }
  int v19 = [v14 width];
  int v20 = [v14 height];
  int v17 = -12780;
  if ((v19 - 513) >= 0xFFFFFE1F && (v20 - 385) >= 0xFFFFFE9F)
  {
    if (!a7 || (v94 = a8, !a7->var3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_5;
    }
    v91 = v15;
    v92 = v16;
    [(IdcContentPreservingWarping *)self fillEdParameters:a3];
    unsigned int generateEdStage1_high = HIDWORD(self[1]._kernels.generateEdStage1);
    unsigned int generateEsBuildWeightArray = self[1]._kernels.generateEsBuildWeightArray;
    unsigned int idcUtilities = self[1]._idcUtilities;
    unsigned int generateEsBuildWeightArray_high = HIDWORD(self[1]._kernels.generateEsBuildWeightArray);
    unsigned int v25 = [v14 width];
    id v93 = v14;
    unsigned int v26 = [v14 height];
    if (generateEdStage1_high > self->_maximumMemoryAllocationParameters.numCells
      || generateEsBuildWeightArray > self->_maximumMemoryAllocationParameters.storageSizePerCell
      || idcUtilities > self->_maximumMemoryAllocationParameters.meshNumNodes
      || generateEsBuildWeightArray_high > self->_maximumMemoryAllocationParameters.aDimensions)
    {
      fig_log_get_emitter();
    }
    else
    {
      unsigned int v27 = v26;
      if (self->_sharedMetalBuffer.resourcesAssigned
        && generateEdStage1_high == self->_currentMemoryAllocationParameters.numCells
        && generateEsBuildWeightArray == self->_currentMemoryAllocationParameters.storageSizePerCell
        && idcUtilities == self->_currentMemoryAllocationParameters.meshNumNodes
        && generateEsBuildWeightArray_high == self->_currentMemoryAllocationParameters.aDimensions
        && self->_currentMemoryAllocationParameters.segmentationMaskWidth == v25
        && self->_currentMemoryAllocationParameters.segmentationMaskHeight == v26)
      {
LABEL_24:
        uint64_t v32 = HIDWORD(self[1]._kernels.generateEsBuildWeightArray);
        v159[0] = HIDWORD(self[1]._kernels.generateEsBuildWeightArray);
        unsigned int var1 = a7->var1;
        if (var1 >= 0x800) {
          uint64_t v34 = 2048;
        }
        else {
          uint64_t v34 = var1;
        }
        v35 = [(FigMetalContext *)self->_metalContext commandQueue];
        v36 = [v35 commandBuffer];

        if (v36)
        {
          uint64_t v37 = [v36 computeCommandEncoderWithDispatchType:1];
          id v15 = v91;
          if (v37)
          {
            v38 = (void *)v37;
            int v39 = -[IntelligentDistortionCorrection_Utilities zeroMetalBuffer:range:commandEncoder:](self->_idcUtilities, "zeroMetalBuffer:range:commandEncoder:", v94->var0, 0, 16, v37);
            if (v39
              || (int v39 = -[IntelligentDistortionCorrection_Utilities zeroMetalBuffer:range:commandEncoder:](self->_idcUtilities, "zeroMetalBuffer:range:commandEncoder:", self->_sharedMetalBuffer.buffer, self->_offsets.es.numElementsPerContainer, 4 * v32, v38)) != 0|| (int v39 = -[IntelligentDistortionCorrection_Utilities zeroMetalBuffer:range:commandEncoder:](self->_idcUtilities, "zeroMetalBuffer:range:commandEncoder:", self->_sharedMetalBuffer.buffer, self->_offsets.edNumSamplesPerCell, 4 * (HIDWORD(self[1]._kernels.generateEdStage1) + 1), v38)) != 0|| (v88 = 2 * v34 + 3, (int v39 = -[IntelligentDistortionCorrection_Utilities zeroMetalBuffer:range:commandEncoder:](self->_idcUtilities, "zeroMetalBuffer:range:commandEncoder:", self->_sharedMetalBuffer.buffer, self->_offsets.elFullMatrix,
                           v32 * (unint64_t)(16 * (v88 >> 2)),
                           v38)) != 0))
            {
              int v17 = v39;
              fig_log_get_emitter();
              FigDebugAssert3();

LABEL_62:
              id v14 = v93;
              id v16 = v92;
              goto LABEL_5;
            }
            [v38 endEncoding];
            v158[0] = MEMORY[0x263EF8330];
            v158[1] = 3221225472;
            v158[2] = sub_262F2E188;
            v158[3] = &unk_2655C1C08;
            v158[4] = v94;
            [v36 addCompletedHandler:v158];
            [v36 commit];
            v40 = [(FigMetalContext *)self->_metalContext commandQueue];
            v41 = [v40 commandBuffer];

            if (v41)
            {
              v42 = [v41 computeCommandEncoder];

              if (v42)
              {
                v90 = v41;
                p_edParameters = &self->_edParameters;
                *(float *)v102 = a3->var21[1].var0[4];
                [v42 setComputePipelineState:self->_kernels.generateEsPresetWeightArray];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.weights atIndex:0];
                [v42 setBytes:v102 length:4 atIndex:1];
                long long v156 = xmmword_262F347B0;
                uint64_t v157 = 1;
                uint64_t v154 = [(MTLComputePipelineState *)self->_kernels.generateEsPresetWeightArray maxTotalThreadsPerThreadgroup];
                int64x2_t v155 = vdupq_n_s64(1uLL);
                [v42 dispatchThreads:&v156 threadsPerThreadgroup:&v154];
                if (v34 && LOBYTE(a3->var21[2].var0[3]))
                {
                  *(void *)&v120[16] = 0;
                  generateEdStage3 = self[1]._kernels.generateEdStage3;
                  v119 = (MTLComputePipelineState *)vcvt_f32_s32(vadd_s32(*(int32x2_t *)&a3->var15.var0.var5, (int32x2_t)0x100000001));
                  *(void *)v120 = generateEdStage3;
                  *(float *)&v120[8] = a3->var21[1].var0[5];
                  *(void *)&v120[12] = 0xD00000015;
                  [v42 setComputePipelineState:self->_kernels.generateEsBuildWeightArray];
                  [v42 setBuffer:a7->var3 offset:a7->var2 atIndex:0];
                  [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.weights atIndex:1];
                  [v42 setBytes:&v119 length:32 atIndex:2];
                  uint64_t v152 = v34;
                  int64x2_t v95 = vdupq_n_s64(1uLL);
                  int64x2_t v153 = v95;
                  uint64_t v150 = [(MTLComputePipelineState *)self->_kernels.generateEsBuildWeightArray maxTotalThreadsPerThreadgroup];
                  int64x2_t v151 = v95;
                  [v42 dispatchThreads:&v152 threadsPerThreadgroup:&v150];
                }
                *(void *)&v120[8] = 0;
                float32x2_t v44 = vcvt_f32_s32(vadd_s32(*(int32x2_t *)&a3->var16.var5, (int32x2_t)-1));
                __asm { FMOV            V9.2S, #11.0 }
                LODWORD(v50) = vdiv_f32(v44, _D9).u32[0];
                HIDWORD(v50) = vmul_f32(v44, (float32x2_t)0x3E0000003E000000).i32[1];
                v119 = v50;
                *(void *)v120 = 0x90000000CLL;
                *(_DWORD *)&v120[8] = 13;
                [v42 setComputePipelineState:self->_kernels.generateEsStage1];
                [v42 setBytes:&v119 length:24 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.arrayOfContainers atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.numElementsPerContainer atIndex:2];
                v51 = v94;
                [v42 setBuffer:v94->var0 offset:8 atIndex:3];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.weights atIndex:4];
                unint64_t v52 = [(MTLComputePipelineState *)self->_kernels.generateEsStage1 threadExecutionWidth];
                unint64_t v53 = [(MTLComputePipelineState *)self->_kernels.generateEsStage1 maxTotalThreadsPerThreadgroup];
                long long v148 = xmmword_262F347C0;
                uint64_t v149 = 1;
                v147[0] = v52;
                v147[1] = v53 / v52;
                v147[2] = 1;
                [v42 dispatchThreads:&v148 threadsPerThreadgroup:v147];
                [v42 setComputePipelineState:self->_kernels.generateEsStage2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.arrayOfContainers atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.numElementsPerContainer atIndex:1];
                uint64_t v145 = v32;
                int64x2_t v96 = vdupq_n_s64(1uLL);
                int64x2_t v146 = v96;
                uint64_t v143 = [(MTLComputePipelineState *)self->_kernels.generateEsStage2 maxTotalThreadsPerThreadgroup];
                int64x2_t v144 = v96;
                [v42 dispatchThreads:&v145 threadsPerThreadgroup:&v143];
                int v142 = v32;
                [v42 setComputePipelineState:self->_kernels.generateEsStage3];
                [v42 setBytes:&v142 length:4 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.arrayOfContainers atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.es.numElementsPerContainer atIndex:2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.matrixAtA atIndex:3];
                uint64_t v140 = (v32 * v32);
                int64x2_t v141 = v96;
                uint64_t v138 = [(MTLComputePipelineState *)self->_kernels.generateEsStage3 maxTotalThreadsPerThreadgroup];
                int64x2_t v139 = v96;
                [v42 dispatchThreads:&v140 threadsPerThreadgroup:&v138];
                [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities erodeSegmentationMask:v93 to:self->_textures.erodedSegmentationMask radius:LODWORD(a3->var21[2].var0[2]) commandEncoder:v42];
                [v42 setComputePipelineState:self->_kernels.generateEdStage1];
                [v42 setTexture:self->_textures.erodedSegmentationMask atIndex:0];
                [v42 setBytes:p_edParameters length:120 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edPhatk atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edPk atIndex:2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edNumSamplesPerCell atIndex:3];
                unint64_t v54 = [(MTLComputePipelineState *)self->_kernels.generateEdStage1 threadExecutionWidth];
                unint64_t v55 = [(MTLComputePipelineState *)self->_kernels.generateEdStage1 maxTotalThreadsPerThreadgroup];
                uint64_t v56 = *(uint64_t *)((char *)&self[1]._kernels.generateEdColumns + 4);
                *(void *)&long long v57 = v56;
                *((void *)&v57 + 1) = HIDWORD(v56);
                long long v136 = v57;
                uint64_t v137 = 1;
                v135[0] = v54;
                v135[1] = v55 / v54;
                v135[2] = 1;
                [v42 dispatchThreads:&v136 threadsPerThreadgroup:v135];
                [v42 setComputePipelineState:self->_kernels.generateEdStage2];
                [v42 setBytes:p_edParameters length:120 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edNumSamplesPerCell atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edOffset atIndex:2];
                int64x2_t v133 = v96;
                uint64_t v134 = 1;
                int64x2_t v131 = v96;
                uint64_t v132 = 1;
                [v42 dispatchThreads:&v133 threadsPerThreadgroup:&v131];
                [v42 setComputePipelineState:self->_kernels.generateEdStage3];
                [v42 setBytes:p_edParameters length:120 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edPhatk atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edNumSamplesPerCell atIndex:2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edOffset atIndex:3];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqHeader atIndex:4];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqData atIndex:5];
                unint64_t v58 = [(MTLComputePipelineState *)self->_kernels.generateEdStage3 threadExecutionWidth];
                unint64_t v59 = [(MTLComputePipelineState *)self->_kernels.generateEdStage3 maxTotalThreadsPerThreadgroup];
                generateEdStage2 = self[1]._kernels.generateEdStage2;
                *(void *)&long long v57 = generateEdStage2;
                *((void *)&v57 + 1) = HIDWORD(generateEdStage2);
                long long v129 = v57;
                uint64_t v130 = 1;
                v128[0] = v58;
                v128[1] = v59 / v58;
                v128[2] = 1;
                [v42 dispatchThreads:&v129 threadsPerThreadgroup:v128];
                [v42 setComputePipelineState:self->_kernels.generateEdColumns];
                [v42 setBytes:p_edParameters length:120 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqHeader atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqData atIndex:2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edColumnHeaders atIndex:3];
                uint64_t v61 = v159[0];
                uint64_t v126 = v159[0];
                int64x2_t v127 = v96;
                uint64_t v124 = [(MTLComputePipelineState *)self->_kernels.generateEdColumns maxTotalThreadsPerThreadgroup];
                int64x2_t v125 = v96;
                [v42 dispatchThreads:&v126 threadsPerThreadgroup:&v124];
                [v42 setComputePipelineState:self->_kernels.generateEdBuildAtA_Atb];
                [v42 setBytes:p_edParameters length:120 atIndex:0];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqHeader atIndex:1];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edRowSubSeqData atIndex:2];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edColumnHeaders atIndex:3];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.matrixAtA atIndex:4];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.vectorAtb atIndex:5];
                [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.edPk atIndex:6];
                unint64_t v62 = [(MTLComputePipelineState *)self->_kernels.generateEdBuildAtA_Atb threadExecutionWidth];
                unint64_t v63 = [(MTLComputePipelineState *)self->_kernels.generateEdBuildAtA_Atb maxTotalThreadsPerThreadgroup];
                v123[0] = v61;
                v123[1] = v61;
                v123[2] = 1;
                v122[0] = v62;
                v122[1] = v63 / v62;
                v122[2] = 1;
                [v42 dispatchThreads:v123 threadsPerThreadgroup:v122];
                if (v34)
                {
                  *(void *)&v120[24] = 0;
                  uint64_t v64 = *(uint64_t *)((char *)&self[1]._idcUtilities + 4);
                  v119 = self[1]._kernels.generateEdStage3;
                  *(void *)v120 = v64;
                  *(float *)&v120[8] = a3->var21[2].var0[0];
                  *(_DWORD *)&v120[12] = 256;
                  *(_DWORD *)&v120[16] = v88 & 0x3FFC;
                  *(void *)&v120[20] = *(void *)&a3->var15.var0.var5;
                  float32x2_t v121 = vcvt_f32_s32(vsub_s32(*(int32x2_t *)&a3->var15.var0.var1, *(int32x2_t *)&a3->var16.var1));
                  [v42 setComputePipelineState:self->_kernels.generateElStage1];
                  [v42 setBytes:&v119 length:48 atIndex:0];
                  [v42 setBuffer:a7->var3 offset:a7->var2 atIndex:1];
                  [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.elFullMatrix atIndex:2];
                  uint64_t v117 = v34;
                  int64x2_t v97 = vdupq_n_s64(1uLL);
                  int64x2_t v118 = v97;
                  uint64_t v115 = [(MTLComputePipelineState *)self->_kernels.generateElStage1 maxTotalThreadsPerThreadgroup];
                  int64x2_t v116 = v97;
                  [v42 dispatchThreads:&v117 threadsPerThreadgroup:&v115];
                  LODWORD(v102[0]) = v61;
                  HIDWORD(v102[0]) = v88 >> 2;
                  [v42 setComputePipelineState:self->_kernels.generateElStage2];
                  [v42 setBytes:v102 length:8 atIndex:0];
                  [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.elFullMatrix atIndex:1];
                  [v42 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.matrixAtA atIndex:2];
                  unint64_t v65 = [(MTLComputePipelineState *)self->_kernels.generateEdBuildAtA_Atb threadExecutionWidth];
                  unint64_t v66 = [(MTLComputePipelineState *)self->_kernels.generateEdBuildAtA_Atb maxTotalThreadsPerThreadgroup];
                  v114[0] = v61;
                  v114[1] = v61;
                  v114[2] = 1;
                  v113[0] = v65;
                  v113[1] = v66 / v65;
                  v113[2] = 1;
                  v51 = v94;
                  [v42 dispatchThreads:v114 threadsPerThreadgroup:v113];
                }
                [v42 endEncoding];
                v112[0] = MEMORY[0x263EF8330];
                v112[1] = 3221225472;
                v112[2] = sub_262F2E1B8;
                v112[3] = &unk_2655C1C08;
                v112[4] = v51;
                [v90 addCompletedHandler:v112];
                [v90 commit];
                v67 = [(FigMetalContext *)self->_metalContext commandQueue];
                v68 = [v67 commandBuffer];

                if (v68)
                {
                  [(MPSMatrixDecompositionCholesky *)self->_choleskyDecomposition encodeToCommandBuffer:v68 sourceMatrix:self->_AtA_matrix resultMatrix:self->_AtA_matrix status:v51->var0];
                  v111[0] = MEMORY[0x263EF8330];
                  v111[1] = 3221225472;
                  v111[2] = sub_262F2E1E8;
                  v111[3] = &unk_2655C1C08;
                  v111[4] = v51;
                  [v68 addCompletedHandler:v111];
                  [v68 commit];
                  v69 = [(FigMetalContext *)self->_metalContext commandQueue];
                  v36 = [v69 commandBuffer];

                  if (v36)
                  {
                    v70 = [v36 computeCommandEncoder];

                    if (v70)
                    {
                      unint64_t v71 = [(MTLComputePipelineState *)self->_kernels.substitution maxTotalThreadsPerThreadgroup];
                      uint64_t v72 = v159[0];
                      if (v71 < v159[0]) {
                        uint64_t v72 = [(MTLComputePipelineState *)self->_kernels.substitution maxTotalThreadsPerThreadgroup];
                      }
                      [v70 setComputePipelineState:self->_kernels.substitution];
                      [v70 setBytes:v159 length:4 atIndex:0];
                      [v70 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.matrixAtA atIndex:1];
                      [v70 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.vectorAtb atIndex:2];
                      [v70 setThreadgroupMemoryLength:128 atIndex:0];
                      uint64_t v109 = v159[0];
                      int64x2_t v110 = vdupq_n_s64(1uLL);
                      uint64_t v107 = v72;
                      int64x2_t v108 = v110;
                      [v70 dispatchThreads:&v109 threadsPerThreadgroup:&v107];
                      *(void *)&v120[8] = 0;
                      v119 = self[1]._kernels.generateEdStage3;
                      *(_DWORD *)v120 = 9;
                      *(void *)&v120[4] = *(void *)&a3->var16.var5;
                      unint64_t v73 = [(MTLComputePipelineState *)self->_kernels.generateExtendedMesh threadExecutionWidth];
                      unint64_t v74 = [(MTLComputePipelineState *)self->_kernels.generateExtendedMesh maxTotalThreadsPerThreadgroup]/ v73;
                      [v70 setComputePipelineState:self->_kernels.generateExtendedMesh];
                      [v70 setTexture:v91 atIndex:0];
                      [v70 setBytes:&v119 length:24 atIndex:0];
                      [v70 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.vectorAtb atIndex:1];
                      uint64_t v75 = [v91 width];
                      uint64_t v76 = [v91 height];
                      v106[0] = v75;
                      v106[1] = v76;
                      v106[2] = 1;
                      v105[0] = v73;
                      v105[1] = v74;
                      v105[2] = 1;
                      [v70 dispatchThreads:v106 threadsPerThreadgroup:v105];
                      unint64_t v77 = [(MTLComputePipelineState *)self->_kernels.validateExtendedMesh threadExecutionWidth];
                      unint64_t v78 = [(MTLComputePipelineState *)self->_kernels.validateExtendedMesh maxTotalThreadsPerThreadgroup]/ v77;
                      [v70 setComputePipelineState:self->_kernels.validateExtendedMesh];
                      [v70 setTexture:v91 atIndex:0];
                      [v70 setBytes:&v119 length:24 atIndex:1];
                      [v70 setBuffer:v94->var0 offset:12 atIndex:2];
                      uint64_t v79 = [v91 width] - 1;
                      uint64_t v80 = [v91 height];
                      v104[0] = v79;
                      v104[1] = v80 - 1;
                      v104[2] = 1;
                      v103[0] = v77;
                      v103[1] = v78;
                      v103[2] = 1;
                      [v70 dispatchThreads:v104 threadsPerThreadgroup:v103];
                      float32x2_t v81 = vcvt_f32_s32(vadd_s32(*(int32x2_t *)&a3->var16.var5, (int32x2_t)-1));
                      LODWORD(v82) = vdiv_f32(v81, _D9).u32[0];
                      HIDWORD(v82) = vmul_f32(v81, (float32x2_t)0x3E0000003E000000).i32[1];
                      v102[0] = v82;
                      id v16 = v92;
                      float v98 = v81.f32[0] / (float)(unint64_t)([v92 width] - 1);
                      float v83 = (float)(a3->var17.var0 - 1);
                      uint64_t v84 = [v92 height];
                      *(float *)&uint64_t v85 = v98;
                      *((float *)&v85 + 1) = v83 / (float)(unint64_t)(v84 - 1);
                      v102[1] = v85;
                      unint64_t v86 = [(MTLComputePipelineState *)self->_kernels.invertMesh threadExecutionWidth];
                      unint64_t v87 = [(MTLComputePipelineState *)self->_kernels.invertMesh maxTotalThreadsPerThreadgroup]/ v86;
                      [v70 setComputePipelineState:self->_kernels.invertMesh];
                      [v70 setTexture:v91 atIndex:0];
                      [v70 setTexture:v92 atIndex:1];
                      [v70 setBytes:v102 length:16 atIndex:0];
                      [v70 setBuffer:v94->var0 offset:4 atIndex:1];
                      v101[0] = [v92 width];
                      v101[1] = [v92 height];
                      v101[2] = 1;
                      v100[0] = v86;
                      v100[1] = v87;
                      v100[2] = 1;
                      [v70 dispatchThreads:v101 threadsPerThreadgroup:v100];
                      [v70 endEncoding];
                      v99[0] = MEMORY[0x263EF8330];
                      v99[1] = 3221225472;
                      v99[2] = sub_262F2E218;
                      v99[3] = &unk_2655C1C08;
                      v99[4] = v94;
                      [v36 addCompletedHandler:v99];
                      [v36 commit];

                      int v17 = 0;
                      id v14 = v93;
                      goto LABEL_5;
                    }
                    fig_log_get_emitter();
                    goto LABEL_60;
                  }
                }
                fig_log_get_emitter();
                FigDebugAssert3();
              }
              else
              {
                fig_log_get_emitter();
                FigDebugAssert3();
              }
            }
            else
            {
              fig_log_get_emitter();
              FigDebugAssert3();
            }
LABEL_61:
            int v17 = -12786;
            goto LABEL_62;
          }
          fig_log_get_emitter();
LABEL_60:
          FigDebugAssert3();

          goto LABEL_61;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        int v17 = -12786;
LABEL_52:
        id v14 = v93;
        id v15 = v91;
        id v16 = v92;
        goto LABEL_5;
      }
      self->_sharedMetalBuffer.resourcesAssigned = 0;
      buffer = self->_sharedMetalBuffer.buffer;
      unint64_t offset = self->_sharedMetalBuffer.offset;
      unint64_t size = self->_sharedMetalBuffer.size;
      v119 = (MTLComputePipelineState *)__PAIR64__(generateEsBuildWeightArray, generateEdStage1_high);
      *(_DWORD *)v120 = idcUtilities;
      *(_DWORD *)&v120[4] = generateEsBuildWeightArray_high;
      *(_DWORD *)&v120[8] = v25;
      *(_DWORD *)&v120[12] = v26;
      int v31 = [(IdcContentPreservingWarping *)self memoryAllocationHandler:0 memoryAllocationParameters:&v119 sharedMemoryBuffer:buffer sharedMetalBufferOffset:offset sharedMetalBufferSize:size];
      if (!v31)
      {
        self->_sharedMetalBuffer.resourcesAssigned = 1;
        self->_currentMemoryAllocationParameters.numCells = generateEdStage1_high;
        self->_currentMemoryAllocationParameters.storageSizePerCell = generateEsBuildWeightArray;
        self->_currentMemoryAllocationParameters.meshNumNodes = idcUtilities;
        self->_currentMemoryAllocationParameters.aDimensions = generateEsBuildWeightArray_high;
        self->_currentMemoryAllocationParameters.segmentationMaskWidth = v25;
        self->_currentMemoryAllocationParameters.segmentationMaskHeight = v27;
        goto LABEL_24;
      }
      int v17 = v31;
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_52;
  }
LABEL_5:

  return v17;
}

- (void)fillEdParameters:(id *)a3
{
  uint64_t v3 = 0;
  unsigned int v4 = LODWORD(a3->var21[2].var0[1]);
  int var5 = a3->var16.var5;
  unsigned int var0 = a3->var17.var0;
  do
  {
    LODWORD(self->_edParameters.invPolynomial[v3]) = *(int *)((char *)&a3->var14.var2.var1 + v3 * 4);
    ++v3;
  }
  while (v3 != 6);
  float v7 = (float)(var5 - 1) / 11.0;
  unsigned int v8 = v7 / v4;
  *(float *)&id v9 = (float)((v7 % v4) >> 1);
  float v10 = (float)(int)(var0 - 1) * 0.125;
  unsigned int v11 = v10 / v4;
  *((float *)&v9 + 1) = (float)((v10 % v4) >> 1);
  self[1].super.isa = (Class)vdiv_f32(vcvt_f32_s32(*(int32x2_t *)&a3->var20), vcvt_f32_s32(*(int32x2_t *)&a3->var14.var3.var5));
  *(float *)&self[1]._metalContext = a3->var21[1].var0[6];
  *((float *)&self[1]._metalContext + 1) = (float)v4;
  *(_OWORD *)&self[1]._unsigned int idcUtilities = xmmword_262F347D0;
  self[1]._kernels.generateEdStage2 = (MTLComputePipelineState *)0x80000000BLL;
  *(float *)&self[1]._kernels.generateEdStage3 = v7;
  *((float *)&self[1]._kernels.generateEdStage3 + 1) = v10;
  LODWORD(self[1]._kernels.generateEdColumns) = v8 * v11;
  HIDWORD(self[1]._kernels.generateEdColumns) = v8;
  LODWORD(self[1]._kernels.generateEdBuildAtA_Atb) = v11;
  self[1]._kernels.generateEsPresetWeightArray = v9;
  LODWORD(self[1]._kernels.generateEsBuildWeightArray) = v8 * v11;
  HIDWORD(self[1]._kernels.generateEsBuildWeightArray) = 216;
  *(void *)&long long v12 = *(void *)&a3->var16.var1;
  *((void *)&v12 + 1) = *(void *)&a3->var16.var5;
  *(_OWORD *)&self[1]._kernels.generateEsStage1 = v12;
}

- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id *)a4 sharedMemoryBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7
{
  unint64_t v13 = (unint64_t)a5;
  id v14 = (void *)v13;
  uint64_t v70 = 0;
  unint64_t v71 = 0;
  uint64_t var3 = a4->var3;
  if (a3) {
    BOOL v16 = (v13 | a7 | a6) == 0;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = v16;
  if (v16 || (int v18 = -12780, !a3) && v13)
  {
    uint64_t v19 = *(void *)&a4->var4;
    *(void *)&long long v20 = v19;
    *((void *)&v20 + 1) = HIDWORD(v19);
    v69[0] = v20;
    v69[1] = xmmword_262F34760;
    [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:v69];
    if (v17)
    {
      uint64_t v21 = (v71 + 63) & 0xFFFFFFC0;
      unint64_t v22 = v21 + a6;
      unint64_t v23 = 4 * var3;
      uint64_t v24 = (v21 + 4 * var3 * var3 + 63) & 0xFFFFFFC0;
      self->_offsets.matrixAtA = v22;
      self->_offsets.vectorAtb = v24 + a6;
    }
    else
    {
      if (v71 > a7) {
        goto LABEL_31;
      }
      unsigned int v25 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v14 bufferOffset:a6 textureDescriptor:v69];
      erodedSegmentationMask = self->_textures.erodedSegmentationMask;
      self->_textures.erodedSegmentationMask = v25;

      if (!self->_textures.erodedSegmentationMask)
      {
        fig_log_get_emitter();
        uint64_t v68 = v7;
        LODWORD(v67) = 0;
        FigDebugAssert3();
        goto LABEL_64;
      }
      unint64_t v27 = a7 - v71;
      uint64_t v28 = (v71 + 63) & 0xFFFFFFC0;
      self->_offsets.matrixAtA = v28 + a6;
      if (v27 < 4 * (unint64_t)(var3 * var3)) {
        goto LABEL_31;
      }
      uint64_t v29 = 4 * (var3 * var3);
      unint64_t v30 = v27 - v29;
      uint64_t v24 = (v29 + v28 + 63) & 0xFFFFFFC0;
      self->_offsets.vectorAtb = v24 + a6;
      if (v30 < 4 * var3) {
        goto LABEL_31;
      }
      unint64_t v23 = 4 * var3;
      a7 = v30 - 4 * var3;
    }
    unint64_t v31 = 8 * (40 * var3);
    int v32 = v23 + 63 + v24;
    self->_offsets.es.arrayOfContainers = (v32 & 0xFFFFFFC0) + a6;
    if (v17)
    {
      uint64_t v33 = (v32 + 320 * var3) & 0xFFFFFFC0;
      uint64_t v34 = (v33 + 583) & 0xFFFFFFC0;
      self->_offsets.es.weights = v33 + a6;
      self->_offsets.es.numElementsPerContainer = v34 + a6;
    }
    else
    {
      unint64_t v35 = a7 - v31;
      if (a7 < v31) {
        goto LABEL_31;
      }
      uint64_t v36 = (v32 + 320 * var3) & 0xFFFFFFC0;
      self->_offsets.es.weights = v36 + a6;
      if (v35 <= 0x207) {
        goto LABEL_31;
      }
      unint64_t v37 = v35 - 520;
      uint64_t v34 = (v36 + 583) & 0xFFFFFFC0;
      self->_offsets.es.numElementsPerContainer = v34 + a6;
      a7 = v37 - v23;
      if (v37 < v23) {
        goto LABEL_31;
      }
    }
    uint64_t var0 = a4->var0;
    unsigned int var1 = a4->var1;
    unint64_t v40 = 8 * var1 * var0;
    uint64_t v41 = (v23 + 63 + v34) & 0xFFFFFFC0;
    self->_offsets.edPhatk = v41 + a6;
    if (v17)
    {
      uint64_t v42 = (v40 + 63 + v41) & 0xFFFFFFC0;
      uint64_t v43 = (v40 + 63 + v42) & 0xFFFFFFC0;
      self->_offsets.edPk = v42 + a6;
      self->_offsets.edNumSamplesPerCell = v43 + a6;
      int v44 = 36 * var0;
      uint64_t v45 = (v43 + 4 * var0 + 67) & 0xFFFFFFC0;
      self->_offsets.edRowSubSeqHeader = v45 + a6;
    }
    else
    {
      unint64_t v46 = a7 - v40;
      if (a7 < v40) {
        goto LABEL_31;
      }
      uint64_t v47 = (v40 + 63 + v41) & 0xFFFFFFC0;
      self->_offsets.edPk = v47 + a6;
      unint64_t v48 = v46 - v40;
      if (v46 < v40) {
        goto LABEL_31;
      }
      uint64_t v49 = (v40 + 63 + v47) & 0xFFFFFFC0;
      self->_offsets.edNumSamplesPerCell = v49 + a6;
      if (v48 < 4 * (unint64_t)(var0 + 1)) {
        goto LABEL_31;
      }
      uint64_t v50 = 4 * (var0 + 1);
      unint64_t v51 = v48 - v50;
      uint64_t v45 = (v50 + v49 + 63) & 0xFFFFFFC0;
      self->_offsets.edRowSubSeqHeader = v45 + a6;
      if (v48 - v50 < 36 * var0) {
        goto LABEL_31;
      }
      int v44 = 36 * var0;
      a7 = v51 - 36 * var0;
    }
    unint64_t v52 = 32 * var0 * var1;
    uint64_t v53 = ((v45 | 0x3C) + v44) & 0xFFFFFFC0;
    self->_offsets.edRowSubSeqData = v53 + a6;
    if ((v17 & 1) == 0)
    {
      BOOL v54 = a7 >= v52;
      a7 -= v52;
      if (!v54)
      {
LABEL_31:
        fig_log_get_emitter();
        uint64_t v68 = v7;
        LODWORD(v67) = 0;
LABEL_61:
        FigDebugAssert3();
        int v18 = -12780;
LABEL_62:
        [(IdcContentPreservingWarping *)self releaseResources];
        goto LABEL_46;
      }
    }
    unint64_t v55 = 72 * a4->var2;
    int v56 = v52 + v53 + 63;
    self->_offsets.edColumnHeaders = (v56 & 0xFFFFFFC0) + a6;
    if (v17)
    {
      uint64_t v57 = v7;
      LODWORD(var0) = 4 * var0;
      uint64_t v58 = ((v56 | 0x38) + v55) & 0xFFFFFFC0;
      self->_offsets.edOffset = v58 + a6;
    }
    else
    {
      unint64_t v59 = a7 - v55;
      if (a7 < v55) {
        goto LABEL_31;
      }
      uint64_t v58 = ((v56 | 0x38) + v55) & 0xFFFFFFC0;
      self->_offsets.edOffset = v58 + a6;
      if (v59 < 4 * var0) {
        goto LABEL_31;
      }
      uint64_t v57 = v7;
      var0 *= 4;
      a7 = v59 - var0;
    }
    uint64_t v60 = var3 << 14;
    uint64_t v61 = ((v58 | 0x3C) + var0) & 0xFFFFFFC0;
    self->_offsets.elFullMatrix = v61 + a6;
    if (var3 << 14 <= a7) {
      char v62 = 1;
    }
    else {
      char v62 = v17;
    }
    if ((v62 & 1) == 0)
    {
      fig_log_get_emitter();
      uint64_t v68 = v57;
      LODWORD(v67) = 0;
      goto LABEL_61;
    }
    if (v17)
    {
LABEL_45:
      int v18 = 0;
      a3->uint64_t var0 = v61 + v60;
      goto LABEL_46;
    }
    unint64_t v63 = objc_msgSend(MEMORY[0x263F13340], "matrixDescriptorWithRows:columns:rowBytes:dataType:", var3, var3);
    if (v63)
    {
      uint64_t v64 = (MPSMatrix *)[objc_alloc(MEMORY[0x263F13318]) initWithBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.matrixAtA descriptor:v63];
      AtA_matrix = self->_AtA_matrix;
      self->_AtA_matrix = v64;

      if (self->_AtA_matrix)
      {

        if (!a3)
        {
          int v18 = 0;
          goto LABEL_46;
        }
        goto LABEL_45;
      }
    }
    fig_log_get_emitter();
    uint64_t v68 = v57;
    LODWORD(v67) = 0;
    FigDebugAssert3();

LABEL_64:
    int v18 = -12786;
    goto LABEL_62;
  }
LABEL_46:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AtA_matrix, 0);
  objc_storeStrong((id *)&self->_choleskyDecomposition, 0);

  sub_262F2744C((uint64_t)&self->_kernels);
  objc_storeStrong((id *)&self->_idcUtilities, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end