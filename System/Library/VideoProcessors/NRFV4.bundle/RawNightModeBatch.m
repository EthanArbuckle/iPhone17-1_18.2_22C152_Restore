@interface RawNightModeBatch
- (BOOL)ready;
- (FigMetalContext)metalContext;
- (NSArray)nonReferenceFrames;
- (RawNightModeBatch)initWithReferenceFrame:(id)a3 batchSize:(unsigned int)a4;
- (RawNightModeFusionInferencePyramid)accumulator;
- (RawNightModeInputFrame)referenceFrame;
- (id)description;
- (int)addFrame:(id)a3;
- (int)populateInferenceInputs:(id)a3 first:(BOOL)a4 last:(BOOL)a5;
- (int)releaseMemory;
- (unint64_t)count;
- (void)setAccumulator:(id)a3;
- (void)setMetalContext:(id)a3;
@end

@implementation RawNightModeBatch

- (RawNightModeBatch)initWithReferenceFrame:(id)a3 batchSize:(unsigned int)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawNightModeBatch;
  v8 = [(RawNightModeBatch *)&v14 init];
  v9 = v8;
  if (v8
    && v7
    && (objc_storeStrong((id *)&v8->_referenceFrame, a3),
        uint64_t v10 = objc_opt_new(),
        nonReferenceFrames = v9->_nonReferenceFrames,
        v9->_nonReferenceFrames = (NSMutableArray *)v10,
        nonReferenceFrames,
        v9->_batchSize = a4,
        v9->_nonReferenceFrames))
  {
    v12 = v9;
  }
  else
  {
    FigDebugAssert3();
    v12 = 0;
  }

  return v12;
}

- (int)addFrame:(id)a3
{
  id v4 = a3;
  if (dword_26B430EA8)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4)
  {
    [(NSMutableArray *)self->_nonReferenceFrames addObject:v4];
    int v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_nonReferenceFrames count];
}

- (id)description
{
  if ([(NSMutableArray *)self->_nonReferenceFrames count])
  {
    unint64_t v3 = 0;
    id v4 = &stru_270E53418;
    do
    {
      if (v3) {
        v5 = @", %@";
      }
      else {
        v5 = @"%@";
      }
      int v6 = [(NSMutableArray *)self->_nonReferenceFrames objectAtIndexedSubscript:v3];
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", v5, v6);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v3;
      id v4 = v7;
    }
    while ([(NSMutableArray *)self->_nonReferenceFrames count] > v3);
  }
  else
  {
    id v7 = &stru_270E53418;
  }
  v8 = [NSString stringWithFormat:@"<%@ %p> Batch size:%d, reference frame:%@, non-reference frames:%@", objc_opt_class(), self, self->_batchSize, self->_referenceFrame, v7];

  return v8;
}

- (BOOL)ready
{
  return [(NSMutableArray *)self->_nonReferenceFrames count] >= (unint64_t)self->_batchSize;
}

- (int)populateInferenceInputs:(id)a3 first:(BOOL)a4 last:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v76[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8 || !-[RawNightModeInputFrame sampleBuffer]((uint64_t)self->_referenceFrame))
  {
    FigDebugAssert3();
    int v65 = FigSignalErrorAt();
    uint64_t v10 = 0;
    objc_super v14 = 0;
    goto LABEL_33;
  }
  v9 = (const void *)-[RawNightModeInputFrame sampleBuffer]((uint64_t)self->_referenceFrame);
  uint64_t v10 = CMGetAttachment(v9, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  if (!v10)
  {
    FigDebugAssert3();
    objc_super v14 = 0;
    int v65 = -28668;
    goto LABEL_33;
  }
  if (v5) {
    uint64_t v11 = v6 | 2u;
  }
  else {
    uint64_t v11 = v6;
  }
  v75[0] = @"FirstLastFlags";
  v12 = [NSNumber numberWithInt:v11];
  v75[1] = @"NonReferenceFrameCount";
  v76[0] = v12;
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_nonReferenceFrames, "count"));
  v76[1] = v13;
  objc_super v14 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];

  v15 = objc_opt_new();
  [v8 setReferenceInputFrame:v15];

  v16 = [v8 referenceInputFrame];

  if (!v16)
  {
    FigDebugAssert3();
    int v65 = -28603;
    goto LABEL_33;
  }
  [v8 setBatchMetadata:v14];
  v17 = (opaqueCMSampleBuffer *)-[RawNightModeInputFrame sampleBuffer]((uint64_t)self->_referenceFrame);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v17);
  if (!ImageBuffer)
  {
    FigDebugAssert3();
LABEL_32:
    int v65 = 0;
    goto LABEL_33;
  }
  v19 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:ImageBuffer pixelFormat:115 usage:7 plane:0];
  v20 = [v8 referenceInputFrame];
  [v20 setInputFrameTexture:v19];

  v21 = [v8 referenceInputFrame];
  v22 = [v21 inputFrameTexture];

  if (!v22)
  {
    FigDebugAssert3();
    int v65 = -28666;
    goto LABEL_33;
  }
  v23 = (double *)MEMORY[0x263EF89A0];
  v24 = [v8 referenceInputFrame];
  objc_msgSend(v24, "setHomographies:", *v23, v23[2], v23[4]);

  v25 = [v8 referenceInputFrame];
  [v25 setShiftMapTexture:0];

  v26 = [v8 referenceInputFrame];
  [v26 setBlendWeightTexture:0];

  v27 = [v8 referenceInputFrame];
  LODWORD(v28) = 1.0;
  [v27 setEitRatio:v28];

  uint64_t v29 = -[RawNightModeInputFrame firstPix]((uint64_t)self->_referenceFrame);
  v30 = [v8 referenceInputFrame];
  [v30 setFirstPix:v29];

  uint64_t v31 = -[RawNightModeInputFrame cfaLayout]((uint64_t)self->_referenceFrame);
  v32 = [v8 referenceInputFrame];
  [v32 setCfaLayout:v31];

  v33 = [v8 referenceInputFrame];
  [v33 setMetadata:v10];

  v34 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
  v35 = [v34 meta];
  int v36 = *(_DWORD *)([v35 exposureParams] + 108);
  v37 = [v8 referenceInputFrame];
  LODWORD(v38) = v36;
  [v37 setAeTargetGain:v38];

  if (![(NSMutableArray *)self->_nonReferenceFrames count]) {
    goto LABEL_32;
  }
  v67 = v14;
  v68 = v10;
  v69 = v8;
  uint64_t v39 = 0;
  v74 = self;
  while (1)
  {
    v40 = objc_opt_new();
    if (!v40)
    {
      FigDebugAssert3();
      int v65 = -28603;
LABEL_24:

      goto LABEL_19;
    }
    v41 = [v8 nonReferenceInputFrames];

    if (!v41)
    {
      FigDebugAssert3();
LABEL_23:
      int v65 = -28601;
      goto LABEL_24;
    }
    v42 = [(NSMutableArray *)self->_nonReferenceFrames objectAtIndexedSubscript:v39];
    nonReferenceFrames = self->_nonReferenceFrames;
    if (!nonReferenceFrames)
    {
      FigDebugAssert3();

      goto LABEL_23;
    }
    v44 = [(NSMutableArray *)nonReferenceFrames objectAtIndexedSubscript:v39];
    v45 = -[RawNightModeInputFrame properties]((uint64_t)v44);
    v46 = (long long *)[v45 regHomography];
    long long v71 = v46[1];
    long long v72 = *v46;
    long long v70 = v46[2];

    v47 = (opaqueCMSampleBuffer *)-[RawNightModeInputFrame sampleBuffer]((uint64_t)v42);
    CVImageBufferRef v48 = CMSampleBufferGetImageBuffer(v47);
    if (!v48) {
      break;
    }
    v49 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v48 pixelFormat:115 usage:7 plane:0];
    [v40 setInputFrameTexture:v49];

    v50 = [v40 inputFrameTexture];

    if (!v50)
    {
      FigDebugAssert3();
      int v65 = -28666;
      goto LABEL_27;
    }
    objc_msgSend(v40, "setHomographies:", *(double *)&v72, *(double *)&v71, *(double *)&v70);
    v51 = -[RawNightModeInputFrame blendingWeight]((uint64_t)v44);
    [v40 setBlendWeightTexture:v51];

    v52 = -[RawNightModeInputFrame shiftMap]((uint64_t)v44);
    [v40 setShiftMapTexture:v52];

    v53 = -[RawNightModeInputFrame properties]((uint64_t)self->_referenceFrame);
    v54 = [v53 meta];
    uint64_t v55 = [v54 exposureParams];
    v56 = -[RawNightModeInputFrame properties]((uint64_t)v42);
    v57 = [v56 meta];
    v73 = v42;
    uint64_t v58 = [v57 exposureParams];
    v59 = -[RawNightModeInputFrame properties]((uint64_t)v74->_referenceFrame);
    *(float *)&double v60 = getRelativeBrightnessForProperties(v55, v58, v59);
    [v40 setEitRatio:v60];

    self = v74;
    [v40 setFirstPix:-[RawNightModeInputFrame firstPix]((uint64_t)v44)];
    [v40 setCfaLayout:-[RawNightModeInputFrame cfaLayout]((uint64_t)v44)];
    v61 = -[RawNightModeInputFrame properties]((uint64_t)v44);
    v62 = [v61 meta];
    LODWORD(v63) = *(_DWORD *)([v62 exposureParams] + 108);
    [v40 setAeTargetGain:v63];

    id v8 = v69;
    v64 = [v69 nonReferenceInputFrames];
    [v64 addObject:v40];

    if ([(NSMutableArray *)v74->_nonReferenceFrames count] <= (unint64_t)++v39)
    {
      int v65 = 0;
      goto LABEL_19;
    }
  }
  FigDebugAssert3();
  int v65 = 0;
LABEL_27:

LABEL_19:
  objc_super v14 = v67;
  uint64_t v10 = v68;
LABEL_33:

  return v65;
}

- (int)releaseMemory
{
  uint64_t v15 = -[RawNightModeInputFrame shiftMap]((uint64_t)self->_referenceFrame);
  FigMetalDecRef();
  -[RawNightModeInputFrame setShiftMap:]((uint64_t)self->_referenceFrame, 0);
  uint64_t v4 = -[RawNightModeInputFrame blendingWeight]((uint64_t)self->_referenceFrame);
  BOOL v5 = (void *)v15;
  v16 = (void *)v4;

  FigMetalDecRef();
  -[RawNightModeInputFrame setBlendingWeight:]((uint64_t)self->_referenceFrame, 0);
  if ([(NSMutableArray *)self->_nonReferenceFrames count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_nonReferenceFrames, "objectAtIndexedSubscript:", v6, v13, v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = -[RawNightModeInputFrame shiftMap]((uint64_t)v7);
        v9 = v16;
        v17 = (void *)v8;

        FigMetalDecRef();
        -[RawNightModeInputFrame setShiftMap:]((uint64_t)v7, 0);
        uint64_t v10 = -[RawNightModeInputFrame blendingWeight]((uint64_t)v7);
        uint64_t v11 = v17;
        v16 = (void *)v10;

        FigMetalDecRef();
        -[RawNightModeInputFrame setBlendingWeight:]((uint64_t)v7, 0);
      }
      else
      {
        uint64_t v14 = v2;
        LODWORD(v13) = 0;
        FigDebugAssert3();
      }

      ++v6;
    }
    while ([(NSMutableArray *)self->_nonReferenceFrames count] > v6);
  }

  return 0;
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (RawNightModeInputFrame)referenceFrame
{
  return self->_referenceFrame;
}

- (RawNightModeFusionInferencePyramid)accumulator
{
  return self->_accumulator;
}

- (void)setAccumulator:(id)a3
{
}

- (NSArray)nonReferenceFrames
{
  return &self->_nonReferenceFrames->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_referenceFrame, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_nonReferenceFrames, 0);
}

@end