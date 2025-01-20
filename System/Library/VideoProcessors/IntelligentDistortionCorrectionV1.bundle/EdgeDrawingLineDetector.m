@interface EdgeDrawingLineDetector
+ (void)getDefaultConfigurationParameters:(id *)a3;
- (BOOL)linesAreCollinearWithSortedPoints:(EdgeDrawingLineDetector *)self;
- (EdgeDrawingLineDetector)initWithFigMetalContext:(id)a3 idcUtilities:(id)a4;
- (int)compileShaders:(BOOL)a3;
- (int)computeSortedPointsWithLine:(int)a3 andLine:axis:intoPointArray:;
- (int)detectLinesPart1:(id *)a3 inputImageTexture:(id)a4 inputSegmentationMaskTexture:(id)a5;
- (int)detectLinesPart2:(id *)a3 results:(id *)a4;
- (int)determineWorkingBufferRequirements:(id *)a3 bundleConfiguration:(id *)a4 maximumInputImageWidth:(unsigned int)a5 maximumInputImageHeight:(unsigned int)a6 maximumSegmentationMaskWidth:(unsigned int)a7 maximumSegmentationMaskHeight:(unsigned int)a8;
- (int)doEdgeDrawing:(EdgeDrawingLineDetector *)self outputLineData:(SEL)a2 sharedMemoryPtr:(id *)a3;
- (int)doLineFitting:(id *)a3 outputLineData:;
- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id *)a4 sharedMemoryBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7;
- (int)processImage:(id *)a3 inputImageTexture:(id)a4 inputSegmentationMaskTexture:(id)a5;
- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
- (unsigned)runFullLsr:(EdgeDrawingLineDetector *)self lsr:(SEL)a2 points:(id *)a3 numPointsLeft:(id *)a4;
- (void)dealloc;
- (void)doLineMerging:(id *)a3 outputLineData:;
- (void)findCollinearLinesWithOutputLineData:(EdgeDrawingLineDetector *)self;
- (void)rebuildLsr:(EdgeDrawingLineDetector *)self points:(SEL)a2 numPoints:(id *)a3;
- (void)releaseResources;
- (void)runTraceBackward:(unsigned int)a3 anchorPoint:(unsigned int)a4 initialGradDir:(char *)a5 sharedMemoryPtr:;
- (void)runTraceForward:(unsigned int)a3 anchorPoint:(unsigned int)a4 initialGradDir:(char *)a5 sharedMemoryPtr:;
- (void)sort4Points:(EdgeDrawingLineDetector *)self onAxis:(SEL)a2;
@end

@implementation EdgeDrawingLineDetector

+ (void)getDefaultConfigurationParameters:(id *)a3
{
  *(void *)&a3->var21[0].var0[1] = 0x3E4CCCCD00000004;
  LODWORD(a3->var21[0].var0[3]) = 1;
  *(void *)&a3->var21[1].var0[1] = 0x1440400000;
  *(void *)&a3->var21[0].var0[4] = 0xA00000002;
  *(void *)&a3->var21[0].var0[6] = 0x3D23D70A40400000;
  LODWORD(a3->var21[1].var0[3]) = 3;
}

- (EdgeDrawingLineDetector)initWithFigMetalContext:(id)a3 idcUtilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)EdgeDrawingLineDetector;
    v10 = [(EdgeDrawingLineDetector *)&v14 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_metalContext, a3);
      objc_storeStrong(p_isa + 2, a4);
      [p_isa compileShaders:0];
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
  }

  return v12;
}

- (int)compileShaders:(BOOL)a3
{
  if (self->_haveShadersBeenCompiled) {
    return 0;
  }
  v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::convertToRgba" constants:0];
  convertToRgba = self->_kernels.convertToRgba;
  self->_kernels.convertToRgba = v5;

  if (!self->_kernels.convertToRgba) {
    goto LABEL_12;
  }
  id v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::convertToRgbaAndDownscale2To1" constants:0];
  convertToRgbaAndDownscale2To1 = self->_kernels.convertToRgbaAndDownscale2To1;
  self->_kernels.convertToRgbaAndDownscale2To1 = v7;

  if (!self->_kernels.convertToRgbaAndDownscale2To1) {
    goto LABEL_12;
  }
  v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::convertToRgbaAndDownscale4To1" constants:0];
  convertToRgbaAndDownscale4To1 = self->_kernels.convertToRgbaAndDownscale4To1;
  self->_kernels.convertToRgbaAndDownscale4To1 = v9;

  if (!self->_kernels.convertToRgbaAndDownscale4To1) {
    goto LABEL_12;
  }
  v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::computeGradients" constants:0];
  computeGradients = self->_kernels.computeGradients;
  self->_kernels.computeGradients = v11;

  if (!self->_kernels.computeGradients) {
    goto LABEL_12;
  }
  v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::computeGradientsWithMask" constants:0];
  computeGradientsWithMask = self->_kernels.computeGradientsWithMask;
  self->_kernels.computeGradientsWithMask = v13;

  if (!self->_kernels.computeGradientsWithMask) {
    goto LABEL_12;
  }
  v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::sparseAnchors" constants:0];
  sparseAnchors = self->_kernels.sparseAnchors;
  self->_kernels.sparseAnchors = v15;

  if (!self->_kernels.sparseAnchors) {
    goto LABEL_12;
  }
  v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::findMaxOfAreaPass1" constants:0];
  findMaxOfAreaPass1 = self->_kernels.findMaxOfAreaPass1;
  self->_kernels.findMaxOfAreaPass1 = v17;

  if (!self->_kernels.findMaxOfAreaPass1) {
    goto LABEL_12;
  }
  v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"edld_kernels::gradientNormalize" constants:0];
  gradientNormalize = self->_kernels.gradientNormalize;
  self->_kernels.gradientNormalize = v19;

  if (self->_kernels.gradientNormalize)
  {
    int result = 0;
    self->_haveShadersBeenCompiled = 1;
  }
  else
  {
LABEL_12:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  return result;
}

- (void)releaseResources
{
  p_output = &self->_output;
  *(_OWORD *)&self->_maximumMemoryAllocationParameters.segmentationMaskHeight = 0u;
  *(_OWORD *)&self->_maximumMemoryAllocationParameters.downscaledImageWidth = 0u;
  *(_OWORD *)&self->_currentMemoryAllocationParameters.downscaledImageWidth = 0u;
  *(_OWORD *)&self->_currentMemoryAllocationParameters.segmentationMaskHeight = 0u;
  buffer = self->_sharedMetalBuffer.buffer;
  self->_sharedMetalBuffer.buffer = 0;

  self->_sharedMetalBuffer.offset = 0;
  self->_sharedMetalBuffer.size = 0;
  self->_sharedMetalBuffer.resourcesAssigned = 0;
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  *(_DWORD *)self->_anon_11c = 0;
  *(void *)&self->_anchorArray.backwardIndex = 0;
  *(_OWORD *)&self->_offsets.anchors = 0u;
  *(_OWORD *)&self->_offsets.gradientMagnitude = 0u;
  v5 = p_output->buffer;
  p_output->buffer = 0;

  *(void *)&p_output->curNum = 0;
  p_output->offset = 0;
}

- (void)dealloc
{
  [(EdgeDrawingLineDetector *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)EdgeDrawingLineDetector;
  [(EdgeDrawingLineDetector *)&v3 dealloc];
}

- (int)determineWorkingBufferRequirements:(id *)a3 bundleConfiguration:(id *)a4 maximumInputImageWidth:(unsigned int)a5 maximumInputImageHeight:(unsigned int)a6 maximumSegmentationMaskWidth:(unsigned int)a7 maximumSegmentationMaskHeight:(unsigned int)a8
{
  if (a3
    && a4
    && ((float v8 = a4->var21[0].var0[1], LODWORD(v8) <= 4) ? (v9 = ((1 << SLOBYTE(v8)) & 0x16) == 0) : (v9 = 1), !v9))
  {
    a3->var0 = 0;
    *(_OWORD *)&self->_maximumMemoryAllocationParameters.segmentationMaskHeight = 0u;
    *(_OWORD *)&self->_maximumMemoryAllocationParameters.downscaledImageWidth = 0u;
    unsigned int v13 = (LODWORD(v8) - 1 + a5) / LODWORD(v8);
    unsigned int v14 = (LODWORD(v8) - 1 + a6) / LODWORD(v8);
    unsigned int v15 = LODWORD(a4->var21[0].var0[4]);
    int v16 = -[EdgeDrawingLineDetector memoryAllocationHandler:memoryAllocationParameters:sharedMemoryBuffer:sharedMetalBufferOffset:sharedMetalBufferSize:](self, "memoryAllocationHandler:memoryAllocationParameters:sharedMemoryBuffer:sharedMetalBufferOffset:sharedMetalBufferSize:");
    if (v16)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_maximumMemoryAllocationParameters.downscaledImageWidth = v13;
      self->_maximumMemoryAllocationParameters.downscaledImageHeight = v14;
      self->_maximumMemoryAllocationParameters.anchorScanInterval = v15;
      self->_maximumMemoryAllocationParameters.segmentationMaskWidth = a7;
      self->_maximumMemoryAllocationParameters.segmentationMaskHeight = a8;
      self->_maximumMemoryAllocationParameters.anchorGridWidth = v13 / v15;
      self->_maximumMemoryAllocationParameters.anchorGridHeight = v14 / v15;
      self->_maximumMemoryAllocationParameters.anchorMaxCount = v13 / v15 * v15 * (v14 / v15);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v16;
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
    *(_OWORD *)&self->_currentMemoryAllocationParameters.downscaledImageWidth = 0u;
    *(_OWORD *)&self->_currentMemoryAllocationParameters.segmentationMaskHeight = 0u;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v10 = -12780;
  }

  return v10;
}

- (int)detectLinesPart1:(id *)a3 inputImageTexture:(id)a4 inputSegmentationMaskTexture:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  self->_detectLinesPart1CompletedSuccessfully = 0;
  if (!v8 || !a3) {
    goto LABEL_28;
  }
  float v11 = a3->var21[0].var0[1];
  BOOL v12 = LODWORD(v11) > 4 || ((1 << SLOBYTE(v11)) & 0x16) == 0;
  if (v12
    || !self->_sharedMetalBuffer.buffer
    || v9 && [v9 pixelFormat] != 25 && objc_msgSend(v10, "pixelFormat") != 10)
  {
    goto LABEL_28;
  }
  int v13 = [v8 width];
  int v14 = [v8 height];
  v30 = a3;
  unsigned int v15 = LODWORD(a3->var21[0].var0[4]);
  unsigned int v16 = (LODWORD(v11) - 1 + v13) / LODWORD(v11);
  unsigned int v17 = [v10 width];
  v32 = v10;
  unsigned int v18 = [v10 height];
  if (v16 <= 0xF)
  {
LABEL_28:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v28 = -12780;
    goto LABEL_29;
  }
  id v31 = v8;
  unsigned int v19 = (LODWORD(v11) - 1 + v14) / LODWORD(v11);
  if (v19 <= 0xF
    || v16 > self->_maximumMemoryAllocationParameters.downscaledImageWidth
    || v19 > self->_maximumMemoryAllocationParameters.downscaledImageHeight
    || (unsigned int v20 = v16 / v15, v16 / v15 > self->_maximumMemoryAllocationParameters.anchorGridWidth)
    || (unsigned int v21 = v19 / v15, v19 / v15 > self->_maximumMemoryAllocationParameters.anchorGridHeight)
    || (unsigned int v22 = v20 * v15 * v21, v22 > self->_maximumMemoryAllocationParameters.anchorMaxCount))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v28 = -12780;
LABEL_35:
    id v8 = v31;
    int v10 = v32;
    goto LABEL_29;
  }
  unsigned int v23 = v18;
  if (self->_sharedMetalBuffer.resourcesAssigned
    && v16 == self->_currentMemoryAllocationParameters.downscaledImageWidth
    && v19 == self->_currentMemoryAllocationParameters.downscaledImageHeight
    && v15 == self->_currentMemoryAllocationParameters.anchorScanInterval
    && self->_currentMemoryAllocationParameters.segmentationMaskWidth == v17
    && self->_currentMemoryAllocationParameters.segmentationMaskHeight == v18)
  {
    goto LABEL_26;
  }
  self->_sharedMetalBuffer.resourcesAssigned = 0;
  buffer = self->_sharedMetalBuffer.buffer;
  unint64_t offset = self->_sharedMetalBuffer.offset;
  unint64_t size = self->_sharedMetalBuffer.size;
  v33[0] = v16;
  v33[1] = v19;
  v33[2] = v15;
  v33[3] = v17;
  v33[4] = v18;
  v33[5] = v16 / v15;
  v33[6] = v19 / v15;
  v33[7] = v20 * v15 * v21;
  int v27 = [(EdgeDrawingLineDetector *)self memoryAllocationHandler:0 memoryAllocationParameters:v33 sharedMemoryBuffer:buffer sharedMetalBufferOffset:offset sharedMetalBufferSize:size];
  if (v27)
  {
    int v28 = v27;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_35;
  }
  self->_sharedMetalBuffer.resourcesAssigned = 1;
  self->_currentMemoryAllocationParameters.downscaledImageWidth = v16;
  self->_currentMemoryAllocationParameters.downscaledImageHeight = v19;
  self->_currentMemoryAllocationParameters.anchorScanInterval = v15;
  self->_currentMemoryAllocationParameters.segmentationMaskWidth = v17;
  self->_currentMemoryAllocationParameters.segmentationMaskHeight = v23;
  self->_currentMemoryAllocationParameters.anchorGridWidth = v20;
  self->_currentMemoryAllocationParameters.anchorGridHeight = v21;
  self->_currentMemoryAllocationParameters.anchorMaxCount = v22;
LABEL_26:
  id v8 = v31;
  int v10 = v32;
  int v28 = [(EdgeDrawingLineDetector *)self processImage:v30 inputImageTexture:v31 inputSegmentationMaskTexture:v32];
  if (v28)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_detectLinesPart1CompletedSuccessfully = 1;
  }
LABEL_29:

  return v28;
}

- (int)detectLinesPart2:(id *)a3 results:(id *)a4
{
  if (a4 && self->_sharedMetalBuffer.buffer)
  {
    if (self->_detectLinesPart1CompletedSuccessfully)
    {
      p_output = &self->_output;
      unsigned int var0 = a4->var0;
      self->_output.curNum = 0;
      self->_output.maxNum = var0;
      objc_storeStrong((id *)&self->_output.buffer, a4->var3);
      self->_output.unint64_t offset = a4->var2;
      uint64_t v9 = [(MTLBuffer *)self->_output.buffer contents];
      uint64_t v10 = [(MTLBuffer *)self->_sharedMetalBuffer.buffer contents];
      if (v9 && v10)
      {
        unint64_t v11 = v9 + self->_output.offset;
        int v12 = [(EdgeDrawingLineDetector *)self doEdgeDrawing:a3 outputLineData:v11 sharedMemoryPtr:v10];
        if (v12)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        else
        {
          [(EdgeDrawingLineDetector *)self findCollinearLinesWithOutputLineData:v11];
          a4->var1 = p_output->curNum;
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return -12786;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12782;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return v12;
}

- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id *)a4 sharedMemoryBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7
{
  unint64_t v12 = (unint64_t)a5;
  int v13 = (void *)v12;
  unint64_t v53 = 0;
  unint64_t v54 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  if (a3) {
    BOOL v14 = (v12 | a7 | a6) == 0;
  }
  else {
    BOOL v14 = 0;
  }
  char v15 = v14;
  if (v14 || (int v16 = -12780, !a3) && v12)
  {
    *(void *)&long long v17 = *(void *)&a4->var0;
    *((void *)&v17 + 1) = HIDWORD(*(void *)&a4->var0);
    long long v51 = v17;
    long long v52 = xmmword_262F34730;
    [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v51];
    unint64_t v18 = v54;
    *(void *)&long long v17 = *(void *)&a4->var0;
    *((void *)&v17 + 1) = HIDWORD(*(void *)&a4->var0);
    long long v48 = v17;
    long long v49 = xmmword_262F34740;
    [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v48];
    unint64_t v19 = *((void *)&v50 + 1);
    if (v18 > *((void *)&v50 + 1)) {
      unint64_t v19 = v18;
    }
    if (v19 <= ((4 * a4->var7 + 255) & 0x7FFFFFF00uLL)) {
      unint64_t v20 = (4 * a4->var7 + 255) & 0x7FFFFFF00;
    }
    else {
      unint64_t v20 = v19;
    }
    if (v15) {
      goto LABEL_20;
    }
    BOOL v21 = a7 >= v20;
    a7 -= v20;
    if (!v21) {
      goto LABEL_47;
    }
    self->_offsets.anchors = a6;
    unsigned int v22 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:a6 textureDescriptor:&v51];
    scaledImage = self->_textures.scaledImage;
    self->_textures.scaledImage = v22;

    if (self->_textures.scaledImage)
    {
      v24 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:a6 textureDescriptor:&v48];
      localMaxPass1 = self->_textures.localMaxPass1;
      self->_textures.localMaxPass1 = v24;

      if (self->_textures.localMaxPass1)
      {
LABEL_20:
        *(void *)&long long v26 = *(void *)&a4->var0;
        *((void *)&v26 + 1) = HIDWORD(*(void *)&a4->var0);
        long long v51 = v26;
        long long v52 = xmmword_262F34750;
        [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v51];
        unint64_t v27 = v54;
        if ((v15 & 1) == 0)
        {
          if (v54 > a7) {
            goto LABEL_47;
          }
          int v28 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:v20 + a6 textureDescriptor:&v51];
          gradientFlags = self->_textures.gradientFlags;
          self->_textures.gradientFlags = v28;

          if (!self->_textures.gradientFlags) {
            goto LABEL_48;
          }
          unsigned int v30 = v53;
          unint64_t v27 = v54;
          a7 -= v54;
          self->_offsets.gradientFlags = v20 + a6;
          self->_elemStride.gradientFlags = v30;
        }
        unint64_t v31 = v27 + v20;
        *(void *)&long long v32 = *(void *)&a4->var0;
        *((void *)&v32 + 1) = HIDWORD(*(void *)&a4->var0);
        long long v51 = v32;
        long long v52 = xmmword_262F34740;
        [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v51];
        unint64_t v33 = v54;
        if ((v15 & 1) == 0)
        {
          if (v54 > a7) {
            goto LABEL_47;
          }
          v34 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:v31 + a6 textureDescriptor:&v51];
          gradientMagnitude = self->_textures.gradientMagnitude;
          self->_textures.gradientMagnitude = v34;

          if (!self->_textures.gradientMagnitude) {
            goto LABEL_48;
          }
          unint64_t v36 = v53;
          unint64_t v33 = v54;
          a7 -= v54;
          self->_offsets.gradientMagnitude = v31 + a6;
          self->_elemStride.gradientMagnitude = v36 >> 1;
        }
        unint64_t v37 = v33 + v31;
        uint64_t v38 = *(void *)&a4->var3;
        *(void *)&long long v39 = v38;
        *((void *)&v39 + 1) = HIDWORD(v38);
        long long v51 = v39;
        long long v52 = xmmword_262F34760;
        [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v51];
        unint64_t v40 = v54;
        if ((v15 & 1) == 0)
        {
          if (v54 > a7) {
            goto LABEL_47;
          }
          v41 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:v37 + a6 textureDescriptor:&v51];
          dilatedSegmentationMask = self->_textures.dilatedSegmentationMask;
          self->_textures.dilatedSegmentationMask = v41;

          if (!self->_textures.dilatedSegmentationMask) {
            goto LABEL_48;
          }
          unint64_t v40 = v54;
          a7 -= v54;
        }
        unint64_t v43 = v40 + v37;
        *(void *)&long long v44 = *(void *)&a4->var0;
        *((void *)&v44 + 1) = HIDWORD(*(void *)&a4->var0);
        long long v51 = v44;
        long long v52 = xmmword_262F34730;
        [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities computeTextureStrideForBufferAllocation:&v51];
        if (v15)
        {
LABEL_36:
          int v16 = 0;
          a3->unsigned int var0 = v54 + v43;
          goto LABEL_37;
        }
        if (v54 > a7)
        {
LABEL_47:
          fig_log_get_emitter();
          FigDebugAssert3();
          int v16 = -12780;
          goto LABEL_37;
        }
        v45 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities textureFromBuffer:v13 bufferOffset:v43 + a6 textureDescriptor:&v51];
        scaledUndistortedImage = self->_textures.scaledUndistortedImage;
        self->_textures.scaledUndistortedImage = v45;

        if (self->_textures.scaledUndistortedImage)
        {
          if (!a3)
          {
            int v16 = 0;
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }
    }
LABEL_48:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = -12786;
  }
LABEL_37:

  return v16;
}

- (int)processImage:(id *)a3 inputImageTexture:(id)a4 inputSegmentationMaskTexture:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t downscaledImageWidth = self->_currentMemoryAllocationParameters.downscaledImageWidth;
  unint64_t downscaledImageHeight = self->_currentMemoryAllocationParameters.downscaledImageHeight;
  unint64_t v12 = [(FigMetalContext *)self->_metalContext commandQueue];
  int v13 = [v12 commandBuffer];

  if (!v13 || ([v13 computeCommandEncoder], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v28 = -12786;
    goto LABEL_20;
  }
  char v15 = (void *)v14;
  float32x2_t v44 = (float32x2_t)downscaledImageWidth;
  v45 = v13;
  float v16 = a3->var21[0].var0[1];
  unint64_t v43 = downscaledImageHeight;
  id v17 = v9;
  if (LODWORD(v16) == 2)
  {
    convertToRgbaAndDownscale2To1 = self->_kernels.convertToRgbaAndDownscale2To1;
    goto LABEL_7;
  }
  if (LODWORD(v16) == 4)
  {
    convertToRgbaAndDownscale2To1 = self->_kernels.convertToRgbaAndDownscale4To1;
LABEL_7:
    unint64_t v19 = convertToRgbaAndDownscale2To1;
    unint64_t v20 = downscaledImageWidth;
    goto LABEL_9;
  }
  unint64_t v19 = self->_kernels.convertToRgba;
  unint64_t v20 = (unint64_t)self->_currentMemoryAllocationParameters.downscaledImageWidth >> 1;
  unint64_t downscaledImageHeight = (unint64_t)self->_currentMemoryAllocationParameters.downscaledImageHeight >> 1;
LABEL_9:
  [v15 setComputePipelineState:v19];
  id v21 = v8;
  [v15 setTexture:v8 atIndex:0];
  p_textures = &self->_textures;
  [v15 setTexture:self->_textures.scaledImage atIndex:2];
  v60[0] = [(MTLComputePipelineState *)v19 threadExecutionWidth];
  v60[1] = (unint64_t)[(MTLComputePipelineState *)v19 maxTotalThreadsPerThreadgroup]/ v60[0];
  v60[2] = 1;
  float32x2_t v57 = (float32x2_t)v20;
  unint64_t v58 = downscaledImageHeight;
  uint64_t v59 = 1;
  [v15 dispatchThreads:&v57 threadsPerThreadgroup:v60];
  float v23 = a3->var21[0].var0[1];
  int v24 = (a3->var15.var0.var2 + LODWORD(v23) - 1) / SLODWORD(v23);
  LODWORD(v54) = (a3->var15.var0.var1 + LODWORD(v23) - 1) / SLODWORD(v23);
  DWORD1(v54) = v24;
  int v25 = a3->var15.var0.var3 / SLODWORD(v23);
  int v26 = a3->var15.var0.var4 / SLODWORD(v23);
  *((void *)&v54 + 1) = __PAIR64__(v26, v25);
  int v55 = v25 - v54 + 1;
  int v56 = v26 - v24 + 1;
  if (LOBYTE(a3->var12.var4))
  {
    p_textures = ($E5D7FFF375B6FE39F906AC3642077DF5 *)&self->_textures.scaledUndistortedImage;
    int v27 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities undistortBGRATexture:a3 inputBGRATexture:self->_textures.scaledImage intoOutputBGRA:self->_textures.scaledUndistortedImage encoder:v15 crop:&v54];
    id v9 = v17;
    if (v27)
    {
      int v28 = v27;
      fig_log_get_emitter();
      FigDebugAssert3();

      id v8 = v21;
      int v13 = v45;
      goto LABEL_20;
    }
  }
  else
  {
    id v9 = v17;
  }
  v29 = p_textures->scaledImage;
  int v13 = v45;
  if (v9)
  {
    int v30 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities dilateSegmentationMask:v9 to:self->_textures.dilatedSegmentationMask radius:LODWORD(a3->var21[1].var0[3]) commandEncoder:v15];
    id v8 = v21;
    if (v30)
    {
      int v28 = v30;
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_20;
    }
    uint64_t v31 = 160;
  }
  else
  {
    uint64_t v31 = 152;
    id v8 = v21;
  }
  float v52 = a3->var21[0].var0[2];
  long long v53 = v54;
  id v32 = *(id *)((char *)&self->super.isa + v31);

  [v15 setComputePipelineState:v32];
  [v15 setTexture:v29 atIndex:0];
  [v15 setTexture:self->_textures.gradientFlags atIndex:1];
  [v15 setTexture:self->_textures.gradientMagnitude atIndex:2];
  if (v9) {
    [v15 setTexture:self->_textures.dilatedSegmentationMask atIndex:3];
  }
  [v15 setBytes:&v52 length:20 atIndex:0];
  v51[0] = [v32 threadExecutionWidth];
  v51[1] = (unint64_t)[v32 maxTotalThreadsPerThreadgroup] / v51[0];
  v51[2] = 1;
  float32x2_t v57 = v44;
  unint64_t v58 = v43;
  uint64_t v59 = 1;
  [v15 dispatchThreads:&v57 threadsPerThreadgroup:v51];
  float v52 = a3->var21[0].var0[2];
  *(float *)&long long v53 = a3->var21[0].var0[3];
  [v15 setComputePipelineState:self->_kernels.findMaxOfAreaPass1];
  [v15 setTexture:self->_textures.gradientMagnitude atIndex:0];
  [v15 setTexture:self->_textures.localMaxPass1 atIndex:1];
  [v15 setBytes:&v52 length:8 atIndex:0];
  unint64_t v33 = [(MTLComputePipelineState *)self->_kernels.findMaxOfAreaPass1 threadExecutionWidth];
  unint64_t v34 = [(MTLComputePipelineState *)self->_kernels.findMaxOfAreaPass1 maxTotalThreadsPerThreadgroup];
  v50[0] = v33;
  v50[1] = v34 / v33;
  v50[2] = 1;
  float32x2_t v57 = v44;
  unint64_t v58 = v43;
  uint64_t v59 = 1;
  [v15 dispatchThreads:&v57 threadsPerThreadgroup:v50];
  [v15 setComputePipelineState:self->_kernels.gradientNormalize];
  [v15 setTexture:self->_textures.gradientMagnitude atIndex:0];
  [v15 setTexture:self->_textures.localMaxPass1 atIndex:1];
  [v15 setTexture:self->_textures.gradientFlags atIndex:2];
  [v15 setBytes:&v52 length:8 atIndex:0];
  unint64_t v35 = [(MTLComputePipelineState *)self->_kernels.gradientNormalize threadExecutionWidth];
  unint64_t v36 = [(MTLComputePipelineState *)self->_kernels.gradientNormalize maxTotalThreadsPerThreadgroup];
  v49[0] = v35;
  v49[1] = v36 / v35;
  v49[2] = 1;
  float32x2_t v57 = v44;
  unint64_t v58 = v43;
  uint64_t v59 = 1;
  [v15 dispatchThreads:&v57 threadsPerThreadgroup:v49];
  uint32x2_t v37 = *(uint32x2_t *)&self->_currentMemoryAllocationParameters.anchorGridWidth;
  float32x2_t v57 = vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_currentMemoryAllocationParameters.downscaledImageWidth), vcvt_f32_u32(v37));
  *(float *)&unint64_t v58 = a3->var21[0].var0[4];
  HIDWORD(v58) = v37.i32[0];
  [v15 setComputePipelineState:self->_kernels.sparseAnchors];
  [v15 setTexture:self->_textures.gradientMagnitude atIndex:0];
  [v15 setBuffer:self->_sharedMetalBuffer.buffer offset:self->_offsets.anchors atIndex:0];
  [v15 setBytes:&v57 length:16 atIndex:1];
  unint64_t v38 = [(MTLComputePipelineState *)self->_kernels.sparseAnchors threadExecutionWidth];
  unint64_t v39 = [(MTLComputePipelineState *)self->_kernels.sparseAnchors maxTotalThreadsPerThreadgroup];
  uint64_t v40 = *(void *)&self->_currentMemoryAllocationParameters.anchorGridWidth;
  *(void *)&long long v41 = v40;
  *((void *)&v41 + 1) = HIDWORD(v40);
  long long v47 = v41;
  uint64_t v48 = 1;
  v46[0] = v38;
  v46[1] = v39 / v38;
  v46[2] = 1;
  [v15 dispatchThreads:&v47 threadsPerThreadgroup:v46];
  [v15 endEncoding];
  [v45 commit];

  int v28 = 0;
LABEL_20:

  return v28;
}

- (int)doEdgeDrawing:(EdgeDrawingLineDetector *)self outputLineData:(SEL)a2 sharedMemoryPtr:(id *)a3
{
  uint64_t v33 = v3;
  unsigned int v5 = self->_currentMemoryAllocationParameters.anchorGridHeight
     * self->_currentMemoryAllocationParameters.anchorGridWidth;
  if (v5)
  {
    uint64_t v6 = v4;
    id v9 = &self->_anon_1f928[16132];
    p_backwardIndex = &self->_anchorArray.backwardIndex;
    uint64_t v11 = v4 + self->_offsets.gradientFlags;
    float v12 = a3->var21[0].var0[4];
    int v13 = (unsigned __int16 *)(v4 + self->_offsets.anchors);
    unint64_t v36 = &self->_anon_1f928[4];
    uint64_t v34 = LODWORD(v12);
    do
    {
      unsigned int v35 = v5;
      if (v12 != 0.0)
      {
        int v14 = v34;
        char v15 = v13;
        do
        {
          __int16 v16 = *v15;
          if ((*v15 & 0x8000) != 0) {
            break;
          }
          signed __int16 v17 = v15[1];
          uint64_t v18 = self->_elemStride.gradientFlags * v17 + *v15;
          char v19 = *(unsigned char *)(v11 + v18);
          if ((v19 & 2) == 0)
          {
            *(unsigned char *)(v11 + v18) = v19 | 2;
            *(void *)p_backwardIndex = 0xFC000000FC1;
            *((_WORD *)v9 + 1) = v17;
            *(_WORD *)id v9 = v16;
            HIWORD(v37) = v17;
            LOWORD(v37) = v16;
            if (v19)
            {
              [(EdgeDrawingLineDetector *)self runTraceForward:2 anchorPoint:v37 initialGradDir:1 sharedMemoryPtr:v6];
              unint64_t v20 = self;
              uint64_t v21 = 1;
              uint64_t v22 = v37;
              uint64_t v23 = 1;
            }
            else
            {
              [(EdgeDrawingLineDetector *)self runTraceForward:8 anchorPoint:v37 initialGradDir:0 sharedMemoryPtr:v6];
              unint64_t v20 = self;
              uint64_t v21 = 4;
              uint64_t v22 = v37;
              uint64_t v23 = 0;
            }
            [(EdgeDrawingLineDetector *)v20 runTraceBackward:v21 anchorPoint:v22 initialGradDir:v23 sharedMemoryPtr:v6];
            uint64_t v24 = p_backwardIndex[1];
            unsigned int v25 = *p_backwardIndex - v24;
            if (v25 >= LODWORD(a3->var21[1].var0[2]) && v25 >= LODWORD(a3->var21[0].var0[5]))
            {
              int v30 = [(EdgeDrawingLineDetector *)self doLineFitting:a3 outputLineData:v33];
              if (v30)
              {
                int v31 = v30;
                fig_log_get_emitter();
                FigDebugAssert3();
                return v31;
              }
            }
            else if (v25)
            {
              int v26 = &v36[4 * v24];
              int v27 = v24 - *p_backwardIndex;
              do
              {
                unsigned int v28 = *(__int16 *)v26 + self->_elemStride.gradientFlags * *((__int16 *)v26 + 1);
                *(unsigned char *)(v11 + v28) &= ~2u;
                v26 += 4;
              }
              while (!__CFADD__(v27++, 1));
            }
          }
          v15 += 2;
          --v14;
        }
        while (v14);
      }
      float v12 = *(float *)&v34;
      v13 += 2 * v34;
      unsigned int v5 = v35 - 1;
    }
    while (v35 != 1);
  }
  return 0;
}

- (int)doLineFitting:(id *)a3 outputLineData:
{
  int result = 0;
  unsigned int v6 = LODWORD(a3->var21[0].var0[5]);
  uint64_t v7 = *(unsigned int *)self->_anon_1f928;
  uint64_t v8 = (self->_anchorArray.backwardIndex - v7);
  *(_DWORD *)self->_anon_11c = 0;
  if (v8 >= v6)
  {
    uint64_t v9 = v3;
    uint64_t v11 = &self->_anon_1f928[4 * v7 + 4];
    do
    {
      uint64_t v12 = *(unsigned int *)self->_anon_11c;
      if (v12 >= 0xFC0)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return -12786;
      }
      *(_DWORD *)self->_anon_11c = v12 + 1;
      unsigned int v13 = [(EdgeDrawingLineDetector *)self runFullLsr:a3 lsr:&self->_anon_11c[32 * v12 + 8] points:v11 numPointsLeft:v8];
      v11 += 4 * v13;
      uint64_t v8 = v8 - v13;
    }
    while (v8 >= v6);
    if (*(_DWORD *)self->_anon_11c) {
      [(EdgeDrawingLineDetector *)self doLineMerging:a3 outputLineData:v9];
    }
    return 0;
  }
  return result;
}

- (void)doLineMerging:(id *)a3 outputLineData:
{
  uint64_t v5 = v3;
  p_output = &self->_output;
  float v8 = (float)LODWORD(a3->var21[1].var0[2]) * (float)LODWORD(a3->var21[1].var0[2]);
  *(float *)v4.i32 = (float)LODWORD(a3->var21[0].var0[1]);
  *(float32x2_t *)v9.f32 = vcvt_f32_s32(*(int32x2_t *)&a3->var15.var0.var1);
  v9.i64[1] = v9.i64[0];
  float32x4_t v40 = vnegq_f32(v9);
  unint64_t v10 = *(unsigned int *)self->_anon_11c;
  if (v10 >= 2)
  {
    unint64_t v14 = 0;
    float v15 = a3->var21[1].var0[0];
    float v16 = a3->var21[1].var0[1];
    memset(v41, 0, sizeof(v41));
    signed __int16 v17 = &self->_anon_11c[8];
    float32x4_t v39 = (float32x4_t)vdupq_lane_s32(v4, 0);
    do
    {
      uint64_t v18 = (float32x2_t *)&v17[32 * v14];
      unsigned int v19 = v14 + 1;
      if (v14 + 1 >= v10)
      {
        ++v14;
      }
      else
      {
        int v20 = 0;
        uint64_t v21 = 32 * v14;
        unint64_t v22 = v14;
        while (1)
        {
          float32x2_t v23 = *(float32x2_t *)&v17[32 * v22 + 8];
          float32x2_t v24 = *(float32x2_t *)&self->_anon_11c[v21 + 40];
          float32x2_t v25 = vsub_f32(v23, v24);
          if (sqrtf(vaddv_f32(vmul_f32(v25, v25))) > v16)
          {
            unint64_t v36 = (v22 + 1);
            if (!v20) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
          float32x2_t v26 = vsub_f32(v23, *(float32x2_t *)&v17[32 * v22]);
          float32x2_t v27 = vmul_f32(v26, v26);
          v27.i32[0] = vadd_f32(v27, (float32x2_t)vdup_lane_s32((int32x2_t)v27, 1)).u32[0];
          float32x2_t v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
          float32x2_t v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)));
          float32x2_t v30 = vmul_n_f32(v26, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
          float32x2_t v31 = vsub_f32(*(float32x2_t *)&self->_anon_11c[v21 + 48], v24);
          float32x2_t v32 = vmul_f32(v31, v31);
          v32.i32[0] = vadd_f32(v32, (float32x2_t)vdup_lane_s32((int32x2_t)v32, 1)).u32[0];
          float32x2_t v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
          float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
          float32x2_t v35 = vmul_n_f32(v31, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
          if (fabsf(vmlas_n_f32((float)-v30.f32[1] * v35.f32[0], v35.f32[1], v30.f32[0])) > v15) {
            break;
          }
          v20 += *(_DWORD *)&self->_anon_11c[v21 + 64];
          ++v19;
          ++v22;
          v21 += 32;
          if (v10 - 1 == v22)
          {
            unint64_t v36 = v10;
            if (!v20) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
        }
        unint64_t v36 = v19;
        if (v20)
        {
LABEL_17:
          uint64_t v18 = (float32x2_t *)v41;
          -[EdgeDrawingLineDetector rebuildLsr:points:numPoints:](self, "rebuildLsr:points:numPoints:", v41, *(void *)&v17[32 * v14 + 16], (*(_DWORD *)&v17[32 * v14 + 24] + v20), *(_OWORD *)&v39);
        }
LABEL_18:
        unint64_t v14 = v36;
      }
      float32x2_t v37 = vsub_f32(*v18, v18[1]);
      if (vaddv_f32(vmul_f32(v37, v37)) > v8)
      {
        uint64_t curNum = p_output->curNum;
        if (curNum < p_output->maxNum)
        {
          *(float32x4_t *)(v5 + 16 * curNum) = vmlaq_f32(v40, v39, *(float32x4_t *)v18->f32);
          LODWORD(curNum) = p_output->curNum;
        }
        p_output->uint64_t curNum = curNum + 1;
      }
      unint64_t v10 = *(unsigned int *)self->_anon_11c;
    }
    while (v14 < v10);
  }
  else
  {
    v11.i64[0] = *(void *)&self->_anon_11c[8];
    float32x2_t v12 = vsub_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)&self->_anon_11c[16]);
    if (vaddv_f32(vmul_f32(v12, v12)) > v8)
    {
      uint64_t v13 = p_output->curNum;
      if (v13 < self->_output.maxNum)
      {
        v11.i64[1] = *(void *)&self->_anon_11c[16];
        *(float32x4_t *)(v3 + 16 * v13) = vmlaq_n_f32(v40, v11, *(float *)v4.i32);
        LODWORD(v13) = p_output->curNum;
      }
      p_output->uint64_t curNum = v13 + 1;
    }
  }
}

- (void)runTraceForward:(unsigned int)a3 anchorPoint:(unsigned int)a4 initialGradDir:(char *)a5 sharedMemoryPtr:
{
  if ((int)(a4 << 16) >= 0x10000)
  {
    uint64_t v6 = v5 + self->_offsets.gradientFlags;
    uint64_t v7 = v5 + self->_offsets.gradientMagnitude;
    int v8 = (unsigned __int16)a4;
    int v9 = (int)a4 >> 16;
    signed int downscaledImageHeight = self->_currentMemoryAllocationParameters.downscaledImageHeight;
    uint64_t downscaledImageWidth = (int)self->_currentMemoryAllocationParameters.downscaledImageWidth;
    uint64_t v12 = ~downscaledImageWidth;
    uint64_t v13 = 1 - (int)downscaledImageWidth;
    uint64_t v14 = (int)downscaledImageWidth - 1;
    uint64_t v15 = (int)downscaledImageWidth + 1;
    p_backwardIndex = &self->_anchorArray.backwardIndex;
    while (1)
    {
      _ZF = v8 + 1 >= (int)downscaledImageWidth || v9 < 1 || v9 + 1 >= downscaledImageHeight || a3 == 0;
      if (_ZF) {
        return;
      }
      uint64_t v20 = v7 + 2 * v8 + 2 * self->_elemStride.gradientMagnitude * v9;
      __asm { FCMP            H1, #0 }
      if (_ZF) {
        return;
      }
      if (a3)
      {
        __asm { FCMP            H1, #0 }
        if (_NF ^ _VF | _ZF) {
          unsigned int v23 = 0;
        }
        else {
          unsigned int v23 = 12;
        }
        if (_NF ^ _VF | _ZF) {
          _H1 = COERCE_SHORT_FLOAT(0);
        }
        if (_NF ^ _VF | _ZF) {
          int v25 = 0;
        }
        else {
          int v25 = -1;
        }
        if (_H1 >= *(short float *)(v20 + 2 * v12))
        {
          int v24 = 0;
        }
        else
        {
          int v24 = -1;
          unsigned int v23 = 4;
          _H1 = *(short float *)(v20 + 2 * v12);
          int v25 = -1;
        }
        _H2 = *(short float *)(v20 + 2 * v13);
        if (_H1 >= _H2)
        {
          __asm { FCVT            S1, H1 }
          if ((a3 & 2) != 0)
          {
LABEL_33:
            _H2 = *(_WORD *)(v20 + 2 * downscaledImageWidth);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v24 = 0;
              int v25 = 1;
              unsigned int v23 = 12;
              _S1 = _S2;
            }
            _H2 = *(_WORD *)(v20 + 2 * v14);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v25 = 1;
              int v24 = -1;
              unsigned int v23 = 4;
              _S1 = _S2;
            }
            _H2 = *(_WORD *)(v20 + 2 * v15);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v24 = 1;
              unsigned int v23 = 8;
              _S1 = _S2;
              int v25 = 1;
            }
          }
        }
        else
        {
          __asm { FCVT            S1, H2 }
          int v25 = -1;
          int v24 = 1;
          unsigned int v23 = 8;
          if ((a3 & 2) != 0) {
            goto LABEL_33;
          }
        }
      }
      else
      {
        unsigned int v23 = 0;
        int v24 = 0;
        int v25 = 0;
        _S1 = 0.0;
        if ((a3 & 2) != 0) {
          goto LABEL_33;
        }
      }
      if ((a3 & 4) != 0)
      {
        _H2 = *(_WORD *)(v20 - 2);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v25 = 0;
          int v24 = -1;
          unsigned int v23 = 3;
          _S1 = _S2;
        }
        _H2 = *(_WORD *)(v20 + 2 * v12);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v24 = -1;
          unsigned int v23 = 1;
          _S1 = _S2;
          int v25 = -1;
        }
        _H2 = *(_WORD *)(v20 + 2 * v14);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v25 = 1;
          int v24 = -1;
          unsigned int v23 = 2;
          _S1 = _S2;
        }
      }
      if ((a3 & 8) == 0) {
        goto LABEL_53;
      }
      _H2 = *(_WORD *)(v20 + 2);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        unsigned int v23 = 3;
        _S1 = _S2;
        int v24 = 1;
        int v25 = 0;
      }
      _H2 = *(_WORD *)(v20 + 2 * v13);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        int v25 = -1;
        unsigned int v23 = 1;
        _S1 = _S2;
        int v24 = 1;
      }
      _H2 = *(_WORD *)(v20 + 2 * v15);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        unsigned int v23 = 2;
        ++v9;
        ++v8;
      }
      else
      {
LABEL_53:
        if (!v23) {
          return;
        }
        v8 += v24;
        v9 += v25;
      }
      uint64_t v50 = v8 + self->_elemStride.gradientFlags * v9;
      unsigned int v51 = *(unsigned __int8 *)(v6 + v50);
      if (v51 <= 1)
      {
        *(unsigned char *)(v6 + v50) = v51 | 2;
        uint64_t v52 = *p_backwardIndex;
        if (v52 >> 7 <= 0x3E)
        {
          if (a5 != v51) {
            a3 = v23;
          }
          a5 = (char *)&self->_anon_1f928[4 * v52 + 4];
          *((_WORD *)a5 + 1) = v9;
          *(_WORD *)a5 = v8;
          unsigned int *p_backwardIndex = v52 + 1;
          LODWORD(a5) = v51;
          if (v8 > 0) {
            continue;
          }
        }
      }
      return;
    }
  }
}

- (void)runTraceBackward:(unsigned int)a3 anchorPoint:(unsigned int)a4 initialGradDir:(char *)a5 sharedMemoryPtr:
{
  if ((int)(a4 << 16) >= 0x10000)
  {
    uint64_t v6 = v5 + self->_offsets.gradientFlags;
    uint64_t v7 = v5 + self->_offsets.gradientMagnitude;
    int v8 = (unsigned __int16)a4;
    int v9 = (int)a4 >> 16;
    signed int downscaledImageHeight = self->_currentMemoryAllocationParameters.downscaledImageHeight;
    uint64_t downscaledImageWidth = (int)self->_currentMemoryAllocationParameters.downscaledImageWidth;
    uint64_t v12 = ~downscaledImageWidth;
    uint64_t v13 = 1 - (int)downscaledImageWidth;
    uint64_t v14 = (int)downscaledImageWidth - 1;
    uint64_t v15 = (int)downscaledImageWidth + 1;
    anon_1f928 = self->_anon_1f928;
    while (1)
    {
      _ZF = v8 + 1 >= (int)downscaledImageWidth || v9 < 1 || v9 + 1 >= downscaledImageHeight || a3 == 0;
      if (_ZF) {
        return;
      }
      uint64_t v20 = v7 + 2 * v8 + 2 * self->_elemStride.gradientMagnitude * v9;
      __asm { FCMP            H1, #0 }
      if (_ZF) {
        return;
      }
      if (a3)
      {
        __asm { FCMP            H1, #0 }
        if (_NF ^ _VF | _ZF) {
          unsigned int v23 = 0;
        }
        else {
          unsigned int v23 = 12;
        }
        if (_NF ^ _VF | _ZF) {
          _H1 = COERCE_SHORT_FLOAT(0);
        }
        if (_NF ^ _VF | _ZF) {
          int v25 = 0;
        }
        else {
          int v25 = -1;
        }
        if (_H1 >= *(short float *)(v20 + 2 * v12))
        {
          int v24 = 0;
        }
        else
        {
          int v24 = -1;
          unsigned int v23 = 4;
          _H1 = *(short float *)(v20 + 2 * v12);
          int v25 = -1;
        }
        _H2 = *(short float *)(v20 + 2 * v13);
        if (_H1 >= _H2)
        {
          __asm { FCVT            S1, H1 }
          if ((a3 & 2) != 0)
          {
LABEL_33:
            _H2 = *(_WORD *)(v20 + 2 * downscaledImageWidth);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v24 = 0;
              int v25 = 1;
              unsigned int v23 = 12;
              _S1 = _S2;
            }
            _H2 = *(_WORD *)(v20 + 2 * v14);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v25 = 1;
              int v24 = -1;
              unsigned int v23 = 4;
              _S1 = _S2;
            }
            _H2 = *(_WORD *)(v20 + 2 * v15);
            __asm { FCVT            S2, H2 }
            if (_S1 < _S2)
            {
              int v24 = 1;
              unsigned int v23 = 8;
              _S1 = _S2;
              int v25 = 1;
            }
          }
        }
        else
        {
          __asm { FCVT            S1, H2 }
          int v25 = -1;
          int v24 = 1;
          unsigned int v23 = 8;
          if ((a3 & 2) != 0) {
            goto LABEL_33;
          }
        }
      }
      else
      {
        unsigned int v23 = 0;
        int v24 = 0;
        int v25 = 0;
        _S1 = 0.0;
        if ((a3 & 2) != 0) {
          goto LABEL_33;
        }
      }
      if ((a3 & 4) != 0)
      {
        _H2 = *(_WORD *)(v20 - 2);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v25 = 0;
          int v24 = -1;
          unsigned int v23 = 3;
          _S1 = _S2;
        }
        _H2 = *(_WORD *)(v20 + 2 * v12);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v24 = -1;
          unsigned int v23 = 1;
          _S1 = _S2;
          int v25 = -1;
        }
        _H2 = *(_WORD *)(v20 + 2 * v14);
        __asm { FCVT            S2, H2 }
        if (_S1 < _S2)
        {
          int v25 = 1;
          int v24 = -1;
          unsigned int v23 = 2;
          _S1 = _S2;
        }
      }
      if ((a3 & 8) == 0) {
        goto LABEL_53;
      }
      _H2 = *(_WORD *)(v20 + 2);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        unsigned int v23 = 3;
        _S1 = _S2;
        int v24 = 1;
        int v25 = 0;
      }
      _H2 = *(_WORD *)(v20 + 2 * v13);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        int v25 = -1;
        unsigned int v23 = 1;
        _S1 = _S2;
        int v24 = 1;
      }
      _H2 = *(_WORD *)(v20 + 2 * v15);
      __asm { FCVT            S2, H2 }
      if (_S1 < _S2)
      {
        unsigned int v23 = 2;
        ++v9;
        ++v8;
      }
      else
      {
LABEL_53:
        if (!v23) {
          return;
        }
        v8 += v24;
        v9 += v25;
      }
      uint64_t v50 = v8 + self->_elemStride.gradientFlags * v9;
      unsigned int v51 = *(unsigned __int8 *)(v6 + v50);
      if (v51 <= 1)
      {
        *(unsigned char *)(v6 + v50) = v51 | 2;
        int v52 = *(_DWORD *)anon_1f928;
        if (*(_DWORD *)anon_1f928)
        {
          if (a5 != v51) {
            a3 = v23;
          }
          *(_DWORD *)anon_1f928 = v52 - 1;
          a5 = (char *)&self->_anon_1f928[4 * (v52 - 1) + 4];
          *((_WORD *)a5 + 1) = v9;
          *(_WORD *)a5 = v8;
          LODWORD(a5) = v51;
          if (v8 > 0) {
            continue;
          }
        }
      }
      return;
    }
  }
}

- (void)rebuildLsr:(EdgeDrawingLineDetector *)self points:(SEL)a2 numPoints:(id *)a3
{
  a3[2].unsigned int var0 = (unsigned int *)v3;
  LODWORD(a3[3].var0) = v4;
  int v5 = *v3;
  *(float *)&uint64_t v6 = (float)v5;
  int v7 = v3[1];
  float v8 = (float)v7;
  v9.f32[0] = (float)v5;
  v9.f32[1] = (float)v7;
  double v10 = (double)v5;
  double v11 = (double)v7;
  double v12 = v10 * v10;
  double v13 = (double)v5 * (double)v7;
  double v14 = v11 * v11;
  _D0 = 0;
  if (v4 < 2)
  {
    float32x2_t v18 = v9;
  }
  else
  {
    float v16 = v3 + 3;
    uint64_t v17 = v4 - 1;
    float32x2_t v18 = v9;
    do
    {
      int v19 = *(v16 - 1);
      *(float *)&_D0 = (float)v19;
      int v20 = *v16;
      *((float *)&_D0 + 1) = (float)v20;
      double v10 = v10 + (double)v19;
      double v11 = v11 + (double)v20;
      double v12 = v12 + (double)v19 * (double)v19;
      double v13 = v13 + (double)v19 * (double)v20;
      double v14 = v14 + (double)v20 * (double)v20;
      float32x2_t v18 = vminnm_f32(v18, (float32x2_t)_D0);
      float32x2_t v9 = vmaxnm_f32(v9, (float32x2_t)_D0);
      v16 += 2;
      --v17;
    }
    while (v17);
  }
  double v21 = 1.0 / (double)v4;
  float v22 = v21 * v10;
  float v23 = v21 * v11;
  float32x2_t v24 = vsub_f32(v9, v18);
  double v25 = v13 + -(v10 * v11) * v21;
  if (vmvn_s8((int8x8_t)vcge_f32(v24, (float32x2_t)vdup_lane_s32((int32x2_t)v24, 1))).u8[0])
  {
    double v26 = v14 + -(v11 * v11) * v21;
    _S1 = 0.0;
    if (fabs(v26) >= 1.0e-10) {
      _S1 = v25 / v26;
    }
    *(float *)&float32x2_t v28 = (float)(v22 - (float)(_S1 * v23)) + (float)(_S1 * v8);
    *((float *)&v28 + 1) = v8;
    a3->unsigned int var0 = v28;
    __asm { FMLA            S3, S1, V0.S[1] }
    LODWORD(_D0) = _S3;
  }
  else
  {
    double v34 = v12 + v10 * -v10 * v21;
    float v35 = 0.0;
    if (fabs(v34) >= 1.0e-10) {
      float v35 = v25 / v34;
    }
    float v36 = v23 - (float)(v35 * v22);
    *((float *)&v6 + 1) = v36 + (float)(v35 * *(float *)&v6);
    a3->unsigned int var0 = v6;
    HIDWORD(_D0) = vmlas_n_f32(v36, v35, *(float *)&_D0);
  }
  a3[1].unsigned int var0 = _D0;
}

- (unsigned)runFullLsr:(EdgeDrawingLineDetector *)self lsr:(SEL)a2 points:(id *)a3 numPointsLeft:(id *)a4
{
  a4[2].unsigned int var0 = (unsigned int *)v4;
  int v6 = *v4;
  *(float *)&int v7 = (float)v6;
  int v8 = v4[1];
  float v9 = (float)v8;
  double v10 = (double)v6;
  uint64_t v11 = LODWORD(a3->var21[0].var0[5]);
  v12.f32[0] = (float)v6;
  v12.f32[1] = (float)v8;
  double v13 = (double)v8;
  float v14 = a3->var21[0].var0[6];
  double v15 = v10 * v10;
  double v16 = (double)v6 * (double)v8;
  double v17 = v13 * v13;
  _D3 = 0;
  if (v11 < 2)
  {
    float32x2_t v21 = v12;
  }
  else
  {
    int v19 = v4 + 3;
    uint64_t v20 = v11 - 1;
    float32x2_t v21 = v12;
    do
    {
      int v22 = *(v19 - 1);
      *(float *)&_D3 = (float)v22;
      int v23 = *v19;
      *((float *)&_D3 + 1) = (float)v23;
      double v10 = v10 + (double)v22;
      double v13 = v13 + (double)v23;
      double v15 = v15 + (double)v22 * (double)v22;
      double v16 = v16 + (double)v22 * (double)v23;
      double v17 = v17 + (double)v23 * (double)v23;
      float32x2_t v21 = vminnm_f32(v21, (float32x2_t)_D3);
      float32x2_t v12 = vmaxnm_f32(v12, (float32x2_t)_D3);
      v19 += 2;
      --v20;
    }
    while (v20);
  }
  double v24 = 1.0 / (double)v11;
  float v25 = v24 * v10;
  float v26 = v24 * v13;
  float32x2_t v27 = vsub_f32(v12, v21);
  if (vmvn_s8((int8x8_t)vcge_f32(v27, (float32x2_t)vdup_lane_s32((int32x2_t)v27, 1))).u8[0])
  {
    double v28 = v17 + -(v13 * v13) * v24;
    double v29 = fabs(v28);
    float v30 = 0.0;
    float v31 = 0.0;
    if (v29 >= 1.0e-10) {
      float v31 = (v16 + -(v10 * v13) * v24) / v28;
    }
    float v32 = v25 - (float)(v31 * v26);
    if (v11)
    {
      float32x2_t v33 = v4 + 1;
      uint64_t v34 = LODWORD(a3->var21[0].var0[5]);
      do
      {
        float v35 = (float)*(v33 - 1) - (float)(v32 + (float)(v31 * (float)*v33));
        float v30 = v30 + (float)(v35 * v35);
        v33 += 2;
        --v34;
      }
      while (v34);
      uint64_t v36 = LODWORD(a3->var21[0].var0[5]);
    }
    else
    {
      uint64_t v36 = 0;
    }
    if (v5 != v11)
    {
      if (v30 <= (float)(v14 * (float)v11))
      {
        v46 = &v4[2 * v36];
        unsigned int v47 = v11 + 1;
        while (1)
        {
          int v48 = *v46;
          int v49 = v46[1];
          double v10 = v10 + (double)v48;
          double v13 = v13 + (double)v49;
          double v16 = v16 + (double)v48 * (double)v49;
          double v17 = v17 + (double)v49 * (double)v49;
          if (v5 == v47) {
            break;
          }
          float v30 = v30
              + (float)((float)((float)v48 - (float)(v32 + (float)(v31 * (float)v49)))
                      * (float)((float)v48 - (float)(v32 + (float)(v31 * (float)v49))));
          float v50 = v14 * (float)v47++;
          v46 += 2;
          if (v30 > v50)
          {
            unsigned int v5 = v47 - 1;
            break;
          }
        }
        *((float *)&_D3 + 1) = (float)v49;
        LODWORD(v11) = v5;
      }
      double v24 = 1.0 / (double)v11;
      float v25 = v10 * v24;
      float v26 = v13 * v24;
      double v28 = v17 + -(v13 * v13) * v24;
      double v29 = fabs(v28);
    }
    _S4 = 0.0;
    if (v29 >= 1.0e-10) {
      _S4 = (v16 + -(v10 * v13) * v24) / v28;
    }
    *(float *)&int v52 = (float)(v25 - (float)(_S4 * v26)) + (float)(_S4 * v9);
    *((float *)&v52 + 1) = v9;
    a4->unsigned int var0 = v52;
    __asm { FMLA            S0, S4, V3.S[1] }
    LODWORD(_D3) = _S0;
  }
  else
  {
    double v37 = v15 + -(v10 * v10) * v24;
    double v38 = fabs(v37);
    float v39 = 0.0;
    float v40 = 0.0;
    if (v38 >= 1.0e-10) {
      float v40 = (v16 + v13 * -v10 * v24) / v37;
    }
    float v41 = v26 - (float)(v40 * v25);
    if (v11)
    {
      v42 = v4 + 1;
      uint64_t v43 = LODWORD(a3->var21[0].var0[5]);
      do
      {
        float v44 = (float)*v42 - (float)(v41 + (float)(v40 * (float)*(v42 - 1)));
        float v39 = v39 + (float)(v44 * v44);
        v42 += 2;
        --v43;
      }
      while (v43);
      uint64_t v45 = LODWORD(a3->var21[0].var0[5]);
    }
    else
    {
      uint64_t v45 = 0;
    }
    if (v5 != v11)
    {
      if (v39 <= (float)(v14 * (float)v11))
      {
        unint64_t v58 = &v4[2 * v45];
        unsigned int v59 = v11 + 1;
        while (1)
        {
          int v60 = *v58;
          *(float *)&_D3 = (float)v60;
          int v61 = v58[1];
          double v10 = v10 + (double)v60;
          double v13 = v13 + (double)v61;
          double v15 = v15 + (double)v60 * (double)v60;
          double v16 = v16 + (double)v60 * (double)v61;
          if (v5 == v59) {
            break;
          }
          float v39 = v39
              + (float)((float)((float)v61 - (float)(v41 + (float)(v40 * *(float *)&_D3)))
                      * (float)((float)v61 - (float)(v41 + (float)(v40 * *(float *)&_D3))));
          float v62 = v14 * (float)v59++;
          v58 += 2;
          if (v39 > v62)
          {
            unsigned int v5 = v59 - 1;
            break;
          }
        }
        LODWORD(v11) = v5;
      }
      double v24 = 1.0 / (double)v11;
      float v25 = v10 * v24;
      float v26 = v13 * v24;
      double v37 = v15 + -(v10 * v10) * v24;
      double v38 = fabs(v37);
    }
    float v63 = 0.0;
    if (v38 >= 1.0e-10) {
      float v63 = (v16 + -(v13 * v10) * v24) / v37;
    }
    float v64 = v26 - (float)(v63 * v25);
    *((float *)&v7 + 1) = v64 + (float)(v63 * *(float *)&v7);
    a4->unsigned int var0 = v7;
    HIDWORD(_D3) = vmlas_n_f32(v64, v63, *(float *)&_D3);
  }
  a4[1].unsigned int var0 = _D3;
  LODWORD(a4[3].var0) = v11;
  return v11;
}

- (void)sort4Points:(EdgeDrawingLineDetector *)self onAxis:(SEL)a2
{
  if (v3 == 1)
  {
    float32x2_t v7 = *v2;
    float32x2_t v5 = v2[2];
    if (vcgt_f32(*v2, v5).i32[1])
    {
      float32x2_t *v2 = v5;
      v2[2] = v7;
      float32x2_t v8 = v7;
    }
    else
    {
      float32x2_t v8 = v2[2];
      float32x2_t v5 = *v2;
    }
    float32x2_t v13 = v2[1];
    float32x2_t v14 = v2[3];
    float v15 = v14.f32[1];
    if (v13.f32[1] <= v14.f32[1])
    {
      LODWORD(v15) = HIDWORD(*(void *)&v2[1]);
      float32x2_t v16 = v2[3];
      float32x2_t v14 = v2[1];
    }
    else
    {
      v2[1] = v14;
      v2[3] = v13;
      float32x2_t v16 = v13;
    }
    if (v5.f32[1] <= v15)
    {
      float32x2_t v5 = v14;
    }
    else
    {
      float32x2_t *v2 = v14;
      v2[1] = v5;
    }
    float v17 = v16.f32[1];
    if (v8.f32[1] <= v16.f32[1])
    {
      float v17 = v8.f32[1];
      float32x2_t v16 = v8;
    }
    else
    {
      v2[2] = v16;
      v2[3] = v8;
    }
    if (v5.f32[1] > v17)
    {
      v2[1] = v16;
      goto LABEL_31;
    }
  }
  else if (!v3)
  {
    float32x2_t v4 = *v2;
    float32x2_t v5 = v2[2];
    if (vcgt_f32(*v2, v5).u8[0])
    {
      float32x2_t *v2 = v5;
      v2[2] = v4;
      float32x2_t v6 = v4;
    }
    else
    {
      float32x2_t v6 = v2[2];
      float32x2_t v5 = *v2;
    }
    float32x2_t v9 = v2[1];
    float32x2_t v10 = v2[3];
    if (vcgt_f32(v9, v10).u8[0])
    {
      v2[1] = v10;
      v2[3] = v9;
      float v11 = v10.f32[0];
      float32x2_t v12 = v9;
      float32x2_t v9 = v10;
    }
    else
    {
      LODWORD(v11) = v2[1];
      float32x2_t v12 = v2[3];
    }
    if (v5.f32[0] <= v11)
    {
      float32x2_t v5 = v9;
    }
    else
    {
      float32x2_t *v2 = v9;
      v2[1] = v5;
    }
    if (vcgt_f32(v6, v12).u8[0])
    {
      v2[2] = v12;
      v2[3] = v6;
      float32x2_t v6 = v12;
    }
    else
    {
      v12.i32[0] = v6.i32[0];
    }
    if (v5.f32[0] > v12.f32[0])
    {
      v2[1] = v6;
LABEL_31:
      v2[2] = v5;
    }
  }
}

- (int)computeSortedPointsWithLine:(int)a3 andLine:axis:intoPointArray:
{
  uint64_t v6 = *(void *)&a3;
  *int v3 = v4;
  v3[1] = v5;
  if (a3 == -1)
  {
    float32x2_t v7 = (float32x2_t)vextq_s8(v4, v4, 8uLL).u64[0];
    float32x2_t v8 = (float32x2_t)vextq_s8(v5, v5, 8uLL).u64[0];
    float32x2_t v9 = vsub_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(*(float32x2_t *)v4.i8, v7), *(float32x2_t *)v5.i8), v8), vminnm_f32(vminnm_f32(vminnm_f32(*(float32x2_t *)v4.i8, v7), *(float32x2_t *)v5.i8), v8));
    uint64_t v6 = *(void *)&vmvn_s8((int8x8_t)vcgt_f32(v9, (float32x2_t)vdup_lane_s32((int32x2_t)v9, 1))) & 1;
  }
  [(EdgeDrawingLineDetector *)self sort4Points:v3 onAxis:v6];
  return v6;
}

- (BOOL)linesAreCollinearWithSortedPoints:(EdgeDrawingLineDetector *)self
{
  float32x2_t v4 = *v2;
  float32x2_t v5 = v2[3];
  float32x2_t v6 = vsub_f32(v5, *v2);
  if (v6.f32[0] != 0.0 || (int32x4_t v3 = 0uLL, v6.f32[1] != 0.0))
  {
    float32x2_t v7 = vmul_f32(v6, v6);
    v7.i32[0] = vadd_f32(v7, (float32x2_t)vdup_lane_s32((int32x2_t)v7, 1)).u32[0];
    float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
    float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
    float32x2_t v10 = vmul_n_f32(v6, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
    *(float *)v3.i32 = -v10.f32[1];
    v3.i32[1] = v10.i32[0];
    v3.i32[2] = vmlas_n_f32((float)-v4.f32[1] * v10.f32[0], v10.f32[1], v4.f32[0]);
  }
  float32x2_t v12 = v2[1];
  float32x2_t v11 = v2[2];
  __asm { FMOV            V5.2S, #10.0 }
  int32x2_t v17 = vcgt_f32(_D5, vabs_f32(vadd_f32((float32x2_t)vdup_laneq_s32(v3, 2), vmla_n_f32(vmul_lane_f32((float32x2_t)vzip2_s32((int32x2_t)v11, (int32x2_t)v12), *(float32x2_t *)v3.i8, 1), (float32x2_t)vzip1_s32((int32x2_t)v11, (int32x2_t)v12), *(float *)v3.i32))));
  BOOL result = 0;
  if (v17.i32[1] & v17.i32[0])
  {
    float32x2_t v18 = vsub_f32(v4, v12);
    float32x2_t v19 = vsub_f32(v12, v11);
    float v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    float32x2_t v21 = vsub_f32(v11, v5);
    float v22 = sqrtf(vaddv_f32(vmul_f32(v21, v21))) * 8.0;
    if (v20 < (float)(sqrtf(vaddv_f32(vmul_f32(v18, v18))) * 8.0) && v20 < v22) {
      return 1;
    }
  }
  return result;
}

- (void)findCollinearLinesWithOutputLineData:(EdgeDrawingLineDetector *)self
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_output = &self->_output;
  unsigned int curNum = self->_output.curNum;
  unsigned int maxNum = self->_output.maxNum;
  if (curNum >= maxNum) {
    uint64_t v6 = maxNum;
  }
  else {
    uint64_t v6 = curNum;
  }
  if (v6)
  {
    float32x2_t v7 = v2;
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    do
    {
      int8x16_t v16 = *(int8x16_t *)&v7[2 * v9];
      int32x2_t v11 = vceq_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&v7[2 * v9]), (float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)));
      if ((v11.i32[1] & v11.i32[0] & 1) == 0)
      {
        if (v10)
        {
          uint64_t v12 = v10;
          uint64_t v13 = v10;
          float32x2_t v14 = v7;
          while (1)
          {
            -[EdgeDrawingLineDetector computeSortedPointsWithLine:andLine:axis:intoPointArray:](self, "computeSortedPointsWithLine:andLine:axis:intoPointArray:", 0xFFFFFFFFLL, &v17, *(double *)v16.i64, *v14, *(_OWORD *)&v16);
            if ([(EdgeDrawingLineDetector *)self linesAreCollinearWithSortedPoints:&v17])
            {
              break;
            }
            v14 += 2;
            if (!--v13) {
              goto LABEL_13;
            }
          }
          *(void *)&long long v15 = v17;
          *((void *)&v15 + 1) = v18;
          *(_OWORD *)float32x2_t v14 = v15;
        }
        else
        {
          uint64_t v12 = 0;
LABEL_13:
          *(int8x16_t *)&v7[2 * v12] = v16;
          ++v10;
        }
      }
      ++v9;
    }
    while (v9 != v6);
  }
  else
  {
    unsigned int v10 = 0;
  }
  p_output->unsigned int curNum = v10;
}

- (void).cxx_destruct
{
  sub_262F2B658((uint64_t)&self->_textures);
  sub_262F2B6B4((uint64_t)&self->_kernels);

  objc_storeStrong((id *)&self->_idcUtilities, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end