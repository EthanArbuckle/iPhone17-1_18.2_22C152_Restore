@interface VDGMetalUtilsV1
+ (BOOL)isTenBitPixelBufferFormat:(unsigned int)a3;
+ (id)getMetalFormatFor:(unsigned int)a3;
- (CGRect)updateGhostPositionsUsingSourceImageFeatureMatching:(CGRect *)a3 shapeScore:(float *)a4 contextScore:(float *)a5 confidenceOut:(float *)a6 pixelBuffer:(__CVBuffer *)a7 searchRangeInPixel:(int)a8 shapeScoreLambda:(float)a9 contextScoreLambda:(float)a10 contextPaddingInPixel:(int)a11;
- (VDGMetalUtilsV1)initWithMetalContext:(id)a3;
- (int)_compileShaders;
- (int)computeGradientX:(id)a3 GradientY:(id)a4 absGradientX:(id)a5 absGradientY:(id)a6 inputLumaTex:(id)a7 roi:(CGRect)a8 isTenBitInput:(BOOL)a9 commandBuffer:(id)a10;
- (int)computeGradientX:(id)a3 GradientY:(id)a4 absGradientX:(id)a5 absGradientY:(id)a6 inputPixelBuffer:(__CVBuffer *)a7 roi:(CGRect)a8 isTenBitInput:(BOOL)a9 commandBuffer:(id)a10;
- (int)computeImageIntegralSourceTexture:(id)a3 destinationTexture:(id)a4 commandBuffer:(id)a5;
- (int)computeShapeScore:(float *)a3 contextScore:(float *)a4 confidence:(float *)a5 maxScoreXPos:(int *)a6 maxScoreYPos:(int *)a7 inputPixelBuffer:(__CVBuffer *)a8 searchRect:(CGRect)a9 ghostSize:(int)a10 shapeScoreLambda:(float)a11 contextScoreLambda:(float)a12 xSearchRangeInPixel:(int)a13 ySearchRangeInPixel:(int)a14 contextPaddingInPixel:(int)a15 maxSize:(int)a16;
@end

@implementation VDGMetalUtilsV1

- (VDGMetalUtilsV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_7:
    v7 = 0;
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)VDGMetalUtilsV1;
  v6 = [(VDGMetalUtilsV1 *)&v9 init];
  self = v6;
  if (!v6) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if ([(VDGMetalUtilsV1 *)self _compileShaders]) {
    goto LABEL_7;
  }
  self = self;
  v7 = self;
LABEL_5:

  return v7;
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingUtils::computeGradients" constants:0];
  v4 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v3;

  if (self->_pipelineStates[0])
  {
    id v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingUtils::computeScore" constants:0];
    v6 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v5;

    if (self->_pipelineStates[1])
    {
      v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingUtils::sum_r_rows" constants:0];
      v8 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v7;

      if (self->_pipelineStates[2])
      {
        objc_super v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingUtils::sum_r_columns" constants:0];
        v10 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v9;

        if (self->_pipelineStates[3]) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)computeGradientX:(id)a3 GradientY:(id)a4 absGradientX:(id)a5 absGradientY:(id)a6 inputPixelBuffer:(__CVBuffer *)a7 roi:(CGRect)a8 isTenBitInput:(BOOL)a9 commandBuffer:(id)a10
{
  BOOL v10 = a9;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a10;
  if (a7)
  {
    v25 = +[VDGMetalUtilsV1 getMetalFormatFor:CVPixelBufferGetPixelFormatType(a7)];
    if ([v25 count])
    {
      id v37 = v23;
      id v26 = v22;
      id v27 = v21;
      id v28 = v20;
      metalContext = self->_metalContext;
      v30 = [v25 objectAtIndexedSubscript:0];
      v31 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a7, (int)[v30 intValue], 1, 0);

      if (v31)
      {
        id v20 = v28;
        id v32 = v28;
        id v21 = v27;
        id v33 = v27;
        id v22 = v26;
        id v34 = v26;
        id v23 = v37;
        int v35 = -[VDGMetalUtilsV1 computeGradientX:GradientY:absGradientX:absGradientY:inputLumaTex:roi:isTenBitInput:commandBuffer:](self, "computeGradientX:GradientY:absGradientX:absGradientY:inputLumaTex:roi:isTenBitInput:commandBuffer:", v32, v33, v34, v37, v31, v10, x, y, width, height, v24);
      }
      else
      {
        int v35 = FigSignalErrorAt();

        id v20 = v28;
        id v21 = v27;
        id v22 = v26;
        id v23 = v37;
      }
    }
    else
    {
      int v35 = FigSignalErrorAt();
    }
  }
  else
  {
    int v35 = FigSignalErrorAt();
  }

  return v35;
}

- (int)computeGradientX:(id)a3 GradientY:(id)a4 absGradientX:(id)a5 absGradientY:(id)a6 inputLumaTex:(id)a7 roi:(CGRect)a8 isTenBitInput:(BOOL)a9 commandBuffer:(id)a10
{
  BOOL v10 = a9;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  if (v20 && v21 && v22 && v23 && v24)
  {
    id v26 = self->_pipelineStates[0];
    id v27 = [v25 computeCommandEncoder];
    [v27 setComputePipelineState:v26];
    [v27 setTexture:v24 atIndex:0];
    [v27 setTexture:v20 atIndex:1];
    [v27 setTexture:v22 atIndex:2];
    [v27 setTexture:v21 atIndex:3];
    [v27 setTexture:v23 atIndex:4];
    v33[0] = x;
    v33[1] = y;
    float v28 = 255.0;
    if (v10) {
      float v28 = 1023.0;
    }
    *(float *)&v33[2] = v28;
    [v27 setBytes:v33 length:12 atIndex:0];
    v32[0] = (unint64_t)width;
    v32[1] = (unint64_t)height;
    v32[2] = 1;
    v31[0] = [(MTLComputePipelineState *)v26 threadExecutionWidth];
    v31[1] = (unint64_t)[(MTLComputePipelineState *)v26 maxTotalThreadsPerThreadgroup]/ v31[0];
    v31[2] = 1;
    [v27 dispatchThreads:v32 threadsPerThreadgroup:v31];
    [v27 endEncoding];

    int v29 = 0;
  }
  else
  {
    int v29 = FigSignalErrorAt();
  }

  return v29;
}

- (int)computeShapeScore:(float *)a3 contextScore:(float *)a4 confidence:(float *)a5 maxScoreXPos:(int *)a6 maxScoreYPos:(int *)a7 inputPixelBuffer:(__CVBuffer *)a8 searchRect:(CGRect)a9 ghostSize:(int)a10 shapeScoreLambda:(float)a11 contextScoreLambda:(float)a12 xSearchRangeInPixel:(int)a13 ySearchRangeInPixel:(int)a14 contextPaddingInPixel:(int)a15 maxSize:(int)a16
{
  id v101 = 0;
  id v102 = 0;
  id v99 = 0;
  id v100 = 0;
  id v97 = 0;
  id v98 = 0;
  id v95 = 0;
  id v96 = 0;
  id v94 = 0;
  if (!a4) {
    goto LABEL_33;
  }
  if (!a5) {
    goto LABEL_33;
  }
  if (!a6) {
    goto LABEL_33;
  }
  if (!a7) {
    goto LABEL_33;
  }
  if (!a3) {
    goto LABEL_33;
  }
  if (!a8) {
    goto LABEL_33;
  }
  if (a10 <= 0) {
    goto LABEL_33;
  }
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  int v29 = [(FigMetalContext *)self->_metalContext commandQueue];
  v30 = [v29 commandBuffer];

  if (!v30)
  {
LABEL_33:
    int v74 = FigSignalErrorAt();
    goto LABEL_31;
  }
  v31 = [(FigMetalContext *)self->_metalContext allocator];
  id v32 = [v31 newTextureDescriptor];

  if (!v32)
  {
    int v74 = FigSignalErrorAt();

    goto LABEL_31;
  }
  v81 = a7;
  CVPixelBufferRef pixelBuffer = a8;
  id v33 = [v32 desc];
  [v33 setTextureType:2];

  id v34 = [v32 desc];
  [v34 setPixelFormat:25];

  int v35 = [v32 desc];
  [v35 setWidth:(unint64_t)width];

  v36 = [v32 desc];
  [v36 setHeight:(unint64_t)height];

  id v37 = [v32 desc];
  [v37 setUsage:7];

  [v32 setLabel:0];
  v38 = [(FigMetalContext *)self->_metalContext allocator];
  id v102 = [v38 newTextureWithDescriptor:v32];

  if (!v102) {
    goto LABEL_32;
  }
  [v32 setLabel:0];
  v39 = [(FigMetalContext *)self->_metalContext allocator];
  id v40 = [v39 newTextureWithDescriptor:v32];
  id v101 = v40;

  if (!v40) {
    goto LABEL_32;
  }
  id v41 = v40;
  [v32 setLabel:0];
  v42 = [(FigMetalContext *)self->_metalContext allocator];
  id v100 = [v42 newTextureWithDescriptor:v32];

  if (!v100) {
    goto LABEL_32;
  }
  [v32 setLabel:0];
  v43 = [(FigMetalContext *)self->_metalContext allocator];
  id v44 = [v43 newTextureWithDescriptor:v32];
  id v99 = v44;

  if (!v44) {
    goto LABEL_32;
  }
  id v80 = v44;
  if (-[VDGMetalUtilsV1 computeGradientX:GradientY:absGradientX:absGradientY:inputPixelBuffer:roi:isTenBitInput:commandBuffer:](self, "computeGradientX:GradientY:absGradientX:absGradientY:inputPixelBuffer:roi:isTenBitInput:commandBuffer:", v102, v41, v100, v44, pixelBuffer, +[VDGMetalUtilsV1 isTenBitPixelBufferFormat:](VDGMetalUtilsV1, "isTenBitPixelBufferFormat:", CVPixelBufferGetPixelFormatType(pixelBuffer)), x, y, width, height, v30))
  {
    goto LABEL_32;
  }
  v78 = a3;
  v79 = a4;
  v45 = [v32 desc];
  [v45 setTextureType:2];

  v46 = [v32 desc];
  [v46 setPixelFormat:55];

  v47 = [v32 desc];
  [v47 setWidth:(unint64_t)(width + 1.0)];

  v48 = [v32 desc];
  [v48 setHeight:(unint64_t)(height + 1.0)];

  v49 = [v32 desc];
  [v49 setUsage:7];

  [v32 setLabel:0];
  v50 = [(FigMetalContext *)self->_metalContext allocator];
  id v51 = [v50 newTextureWithDescriptor:v32];
  id v98 = v51;

  if (!v51) {
    goto LABEL_32;
  }
  [v32 setLabel:0];
  v52 = [(FigMetalContext *)self->_metalContext allocator];
  id v53 = [v52 newTextureWithDescriptor:v32];
  id v97 = v53;

  if (!v53) {
    goto LABEL_32;
  }
  v77 = a5;
  [v32 setLabel:0];
  v54 = [(FigMetalContext *)self->_metalContext allocator];
  id v55 = [v54 newTextureWithDescriptor:v32];
  id v96 = v55;

  if (!v55) {
    goto LABEL_32;
  }
  v76 = a6;
  [v32 setLabel:0];
  v56 = [(FigMetalContext *)self->_metalContext allocator];
  id v57 = [v56 newTextureWithDescriptor:v32];
  id v95 = v57;

  if (!v57
    || ([(FigMetalContext *)self->_metalContext allocator],
        v58 = objc_claimAutoreleasedReturnValue(),
        id v59 = [v58 newBufferDescriptor],
        v58,
        !v59))
  {
LABEL_32:
    int v74 = FigSignalErrorAt();

LABEL_41:
    goto LABEL_31;
  }
  v60 = v59;
  [v59 setLength:20];
  [v59 setLabel:0];
  v61 = [(FigMetalContext *)self->_metalContext allocator];
  id v94 = [v61 newBufferWithDescriptor:v60];

  id v82 = v94;
  if (!v94
    || (unsigned int v62 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v102, v51, v30), v63 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v41, v53, v30) | v62, v64 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v100, v55, v30), v63 | v64 | -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self,
                      "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:",
                      v80,
                      v57,
                      v30)))
  {
    int v74 = FigSignalErrorAt();

LABEL_40:
    goto LABEL_41;
  }
  v65 = self->_pipelineStates[1];
  v66 = [v30 computeCommandEncoder];
  if (!v66)
  {
    int v74 = FigSignalErrorAt();

    goto LABEL_40;
  }
  v67 = v66;
  int v68 = a16 - a10;
  if (a16 < a10) {
    ++v68;
  }
  int v69 = a15 + (v68 >> 1);
  objc_msgSend(v66, "setComputePipelineState:");
  [v67 setTexture:v51 atIndex:0];
  [v67 setTexture:v53 atIndex:1];
  [v67 setTexture:v55 atIndex:2];
  [v67 setTexture:v57 atIndex:3];
  [v67 setBuffer:v94 offset:0 atIndex:1];
  v87[0] = a10;
  v87[1] = a10;
  *(float *)&v87[2] = (float)v69;
  float v91 = a11;
  float v92 = a12;
  int v93 = a15;
  unsigned int v88 = llroundf((float)a10 / 3.0);
  unsigned int v89 = v88;
  if (+[VDGMetalUtilsV1 isTenBitPixelBufferFormat:CVPixelBufferGetPixelFormatType(pixelBuffer)])
  {
    int v70 = 4;
  }
  else
  {
    int v70 = 1;
  }
  int v90 = v70;
  [v67 setBytes:v87 length:36 atIndex:0];
  v86[0] = a13 + 1;
  v86[1] = a14 + 1;
  v86[2] = 1;
  int64x2_t v84 = vdupq_n_s64(0x20uLL);
  uint64_t v85 = 1;
  [v67 dispatchThreads:v86 threadsPerThreadgroup:&v84];
  [v67 endEncoding];
  if (gGMFigKTraceEnabled)
  {
    v71 = [v30 commandQueue];
    v72 = [v71 commandBuffer];

    [v72 setLabel:@"KTRACE_MTLCMDBUF"];
    [v72 addCompletedHandler:&stru_2C610];
    [v72 commit];
    [v30 addCompletedHandler:&stru_2C630];
  }
  [v30 commit];
  [v30 waitUntilCompleted];
  v73 = (float *)[v82 contents];
  float *v79 = v73[1];
  float *v78 = v73[2];
  float *v77 = *v73;
  int *v76 = *((_DWORD *)v73 + 3);
  int *v81 = *((_DWORD *)v73 + 4);

  int v74 = 0;
LABEL_31:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v74;
}

- (CGRect)updateGhostPositionsUsingSourceImageFeatureMatching:(CGRect *)a3 shapeScore:(float *)a4 contextScore:(float *)a5 confidenceOut:(float *)a6 pixelBuffer:(__CVBuffer *)a7 searchRangeInPixel:(int)a8 shapeScoreLambda:(float)a9 contextScoreLambda:(float)a10 contextPaddingInPixel:(int)a11
{
  if (a8 >= 15) {
    int v11 = 15;
  }
  else {
    int v11 = a8;
  }
  uint64_t v50 = 0;
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (!a7 || !a3 || !a6 || !a4) {
    goto LABEL_17;
  }
  double x = a3->origin.x;
  double y = a3->origin.y;
  CGFloat width = a3->size.width;
  CGFloat height = a3->size.height;
  unsigned int v24 = CVPixelBufferGetWidth(a7);
  unsigned int v25 = CVPixelBufferGetHeight(a7);
  double v26 = (double)v11;
  double v27 = (double)a11;
  int v28 = (int)(a3->origin.x - (double)v11 - (double)a11);
  if ((v28 & 0x80000000) == 0)
  {
    double v29 = a3->origin.y;
    int v30 = (int)(v29 - v26 - v27);
    if ((v30 & 0x80000000) == 0)
    {
      double v31 = a3->size.width;
      double v32 = a3->size.height;
      unsigned int v33 = (int)(a3->origin.x + v31 + v26 + v27);
      unsigned int v34 = (int)(v29 + v32 + v26 + v27);
      if (v33 <= v24 && v34 <= v25)
      {
        double v36 = (float)(int)(v34 - v30);
        double v37 = (float)(int)(v33 - v28);
        float v38 = (float)v28;
        int v39 = (int)v31;
        double v40 = v38;
        double v41 = (double)(2 * a11);
        double v42 = v36 - (double)(int)v32 - v41;
        LODWORD(v48) = (int)v42;
        HIDWORD(v48) = a11;
        LODWORD(v49) = v39;
        LODWORD(v47) = v39;
        HIDWORD(v47) = (int)(v37 - (double)v39 - v41);
        *(float *)&double v42 = a9;
        *(float *)&double v41 = a10;
        if (!-[VDGMetalUtilsV1 computeShapeScore:contextScore:confidence:maxScoreXPos:maxScoreYPos:inputPixelBuffer:searchRect:ghostSize:shapeScoreLambda:contextScoreLambda:xSearchRangeInPixel:ySearchRangeInPixel:contextPaddingInPixel:maxSize:](self, "computeShapeScore:contextScore:confidence:maxScoreXPos:maxScoreYPos:inputPixelBuffer:searchRect:ghostSize:shapeScoreLambda:contextScoreLambda:xSearchRangeInPixel:ySearchRangeInPixel:contextPaddingInPixel:maxSize:", a4, a5, a6, (char *)&v50 + 4, &v50, a7, v40, (float)v30, v37, v36, v42, v41, v47, v48, v49))
        {
          double x = x + (double)SHIDWORD(v50) - v26 - v27;
          double y = y + (double)(int)v50 - v26 - v27;
          goto LABEL_16;
        }
LABEL_17:
        FigSignalErrorAt();
      }
    }
  }
LABEL_16:
  double v43 = x;
  double v44 = y;
  double v45 = width;
  double v46 = height;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

- (int)computeImageIntegralSourceTexture:(id)a3 destinationTexture:(id)a4 commandBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v41 = 0;
  if (v10
    && v8
    && v9
    && ([(FigMetalContext *)self->_metalContext allocator],
        int v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 newTextureDescriptor],
        v11,
        v12))
  {
    v13 = [v12 desc];
    [v13 setTextureType:2];

    v14 = [v12 desc];
    [v14 setPixelFormat:55];

    v15 = (char *)[v9 width] - 1;
    v16 = [v12 desc];
    [v16 setWidth:v15];

    v17 = (char *)[v9 height] - 1;
    v18 = [v12 desc];
    [v18 setHeight:v17];

    v19 = [v12 desc];
    [v19 setUsage:7];

    [v12 setLabel:0];
    id v20 = [(FigMetalContext *)self->_metalContext allocator];
    id v21 = [v20 newTextureWithDescriptor:v12];
    id v41 = v21;

    if (v21 && ([v10 computeCommandEncoder], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v23 = (void *)v22;
      unsigned int v24 = self->_pipelineStates[3];
      unint64_t v25 = (unint64_t)[(MTLComputePipelineState *)v24 threadExecutionWidth];
      id v34 = v10;
      id v26 = v8;
      unint64_t v27 = ((unint64_t)[v21 width] + v25 - 1) / v25;
      v40[0] = (unsigned __int16)[v21 width];
      v40[1] = (unsigned __int16)[v21 height];
      [v23 setComputePipelineState:v24];
      [v23 setTexture:v26 atIndex:0];
      [v23 setTexture:v21 atIndex:1];
      [v23 setBytes:v40 length:4 atIndex:0];
      unint64_t v38 = v27;
      int64x2_t v33 = vdupq_n_s64(1uLL);
      int64x2_t v39 = v33;
      unint64_t v36 = v25;
      int64x2_t v37 = v33;
      [v23 dispatchThreadgroups:&v38 threadsPerThreadgroup:&v36];
      int v28 = self->_pipelineStates[2];

      unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)v28 threadExecutionWidth];
      unint64_t v30 = ((unint64_t)[v9 height] + v29 - 1) / v29;
      v35[0] = (unsigned __int16)[v9 width];
      v35[1] = (unsigned __int16)[v9 height];
      [v23 setComputePipelineState:v28];
      [v23 setTexture:v21 atIndex:0];
      [v23 setTexture:v9 atIndex:1];
      [v23 setBytes:v35 length:4 atIndex:0];
      unint64_t v38 = v30;
      id v8 = v26;
      id v10 = v34;
      int64x2_t v39 = v33;
      unint64_t v36 = v29;
      int64x2_t v37 = v33;
      [v23 dispatchThreadgroups:&v38 threadsPerThreadgroup:&v36];
      [v23 endEncoding];

      int v31 = 0;
    }
    else
    {
      int v31 = FigSignalErrorAt();
    }
  }
  else
  {
    int v31 = FigSignalErrorAt();
  }
  FigMetalDecRef();

  return v31;
}

+ (id)getMetalFormatFor:(unsigned int)a3
{
  id result = 0;
  if ((int)a3 <= 796419633)
  {
    if ((int)a3 > 758674991)
    {
      if ((int)a3 <= 762869297)
      {
        if ((int)a3 <= 762865201)
        {
          if (a3 != 758674992)
          {
            unsigned __int16 v4 = 26160;
LABEL_36:
            int v9 = v4 | 0x2D780000;
            goto LABEL_49;
          }
          return &off_2D980;
        }
        if (a3 != 762865202)
        {
          unsigned __int16 v4 = 30256;
          goto LABEL_36;
        }
        return &off_2D9C8;
      }
      if ((int)a3 > 792229423)
      {
        if (a3 != 792229424)
        {
          int v9 = 796419632;
LABEL_49:
          if (a3 != v9) {
            return result;
          }
          return &off_2D9B0;
        }
        return &off_2D980;
      }
      if (a3 != 762869298)
      {
        int v7 = 792225328;
        goto LABEL_41;
      }
      return &off_2D9C8;
    }
    if ((int)a3 <= 645424689)
    {
      if (a3 == 641230384 || a3 == 641234480) {
        return &off_2D980;
      }
      unsigned __int16 v6 = 26160;
      goto LABEL_30;
    }
    if ((int)a3 <= 645428785)
    {
      if (a3 == 645424690) {
        return &off_2D9C8;
      }
      unsigned __int16 v6 = 30256;
LABEL_30:
      int v9 = v6 | 0x26780000;
      goto LABEL_49;
    }
    if (a3 == 645428786) {
      return &off_2D9C8;
    }
    int v7 = 758670896;
LABEL_41:
    if (a3 != v7) {
      return result;
    }
    return &off_2D980;
  }
  if ((int)a3 > 2019963439)
  {
    if ((int)a3 <= 2088265263)
    {
      if ((int)a3 > 2084070959)
      {
        if (a3 == 2084070960) {
          return &off_2D980;
        }
        int v7 = 2084075056;
        goto LABEL_41;
      }
      if (a3 != 2019963440)
      {
        int v5 = 2019963442;
        goto LABEL_45;
      }
      return &off_2D998;
    }
    if ((int)a3 > 2088269359)
    {
      if (a3 != 2088269360)
      {
        unsigned __int16 v8 = 30258;
        goto LABEL_54;
      }
    }
    else if (a3 != 2088265264)
    {
      unsigned __int16 v8 = 26162;
LABEL_54:
      int v10 = v8 | 0x7C780000;
LABEL_55:
      if (a3 != v10) {
        return result;
      }
      return &off_2D9C8;
    }
    return &off_2D9B0;
  }
  if ((int)a3 <= 875704421)
  {
    if (a3 == 796419634) {
      return &off_2D9C8;
    }
    if (a3 != 796423728)
    {
      int v10 = 796423730;
      goto LABEL_55;
    }
    return &off_2D9B0;
  }
  if ((int)a3 > 2016686639)
  {
    if (a3 != 2016686640)
    {
      int v5 = 2016686642;
LABEL_45:
      if (a3 != v5) {
        return result;
      }
    }
    return &off_2D998;
  }
  if (a3 == 875704422 || a3 == 875704438) {
    return &off_2D968;
  }
  return result;
}

+ (BOOL)isTenBitPixelBufferFormat:(unsigned int)a3
{
  BOOL result = 0;
  if ((int)a3 > 1882468911)
  {
    if ((int)a3 > 2019963439)
    {
      if ((int)a3 > 2088265265)
      {
        if (a3 == 2088265266 || a3 == 2088269362) {
          return 1;
        }
        unsigned __int16 v6 = 30256;
      }
      else
      {
        if (a3 == 2019963440 || a3 == 2019963442) {
          return 1;
        }
        unsigned __int16 v6 = 26160;
      }
      int v4 = v6 | 0x7C780000;
    }
    else if ((int)a3 > 1885745713)
    {
      if (a3 == 1885745714 || a3 == 2016686640) {
        return 1;
      }
      int v4 = 2016686642;
    }
    else
    {
      if (a3 == 1882468912 || a3 == 1882468914) {
        return 1;
      }
      int v4 = 1885745712;
    }
    goto LABEL_34;
  }
  if ((int)a3 > 762869295)
  {
    if ((int)a3 > 796419633)
    {
      if (a3 == 796419634 || a3 == 796423728) {
        return 1;
      }
      unsigned __int16 v5 = 30258;
    }
    else
    {
      if (a3 == 762869296 || a3 == 762869298) {
        return 1;
      }
      unsigned __int16 v5 = 26160;
    }
    int v4 = v5 | 0x2F780000;
    goto LABEL_34;
  }
  if ((int)a3 > 645428785)
  {
    if (a3 == 645428786 || a3 == 762865200) {
      return 1;
    }
    int v4 = 762865202;
LABEL_34:
    if (a3 != v4) {
      return result;
    }
    return 1;
  }
  if (a3 != 645424688 && a3 != 645424690)
  {
    int v4 = 645428784;
    goto LABEL_34;
  }
  return 1;
}

- (void).cxx_destruct
{
  for (uint64_t i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end