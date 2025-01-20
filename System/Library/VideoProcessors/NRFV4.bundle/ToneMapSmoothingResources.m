@interface ToneMapSmoothingResources
+ (unint64_t)calcMaxNPyramidLevelsForWidth:(unint64_t)a3 height:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForOddEvenLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5;
- (MTLBuffer)blackPoint;
- (MTLBuffer)mstmTuningParams;
- (MTLBuffer)mstmv2TuningParams;
- (MTLBuffer)playbackCurve;
- (MTLBuffer)sffDescriptorsBuffer;
- (MTLBuffer)sffNThreadGroupsBuffer;
- (MTLBuffer)srlOnMSTMTuningParams;
- (NSMutableArray)masksPyramid;
- (NSMutableArray)outputPyramidEven;
- (NSMutableArray)outputPyramidOdd;
- (NSMutableArray)referencePyramidEven;
- (NSMutableArray)referencePyramidOdd;
- (ToneMapSmoothingResources)initWithMetalContext:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 mtlSubAllocatorID:(unsigned int)a6 srlVersion:(int)a7;
- (float)saturationControl;
- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 useMaskPyramid:(BOOL)a5;
- (int)srlVersion;
- (unint64_t)height;
- (unint64_t)maxNPyramidLevels;
- (unint64_t)width;
- (void)calcPyramidDimensions;
- (void)dealloc;
- (void)makeResourcesAliasable;
@end

@implementation ToneMapSmoothingResources

+ (unint64_t)calcMaxNPyramidLevelsForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return (unint64_t)log2(fmin((double)a3, (double)a4)) - 2;
}

- (void)calcPyramidDimensions
{
  unint64_t v3 = +[ToneMapSmoothingResources calcMaxNPyramidLevelsForWidth:self->_width height:self->_height];
  unint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    unint64_t width = self->_width;
    unint64_t height = self->_height;
    dimensions = self->_dimensions;
    p_var2 = &dimensions->var2;
    do
    {
      unint64_t width = (width + 1) >> 1;
      unint64_t height = (height + 1) >> 1;
      if (dimensions)
      {
        *(p_var2 - 2) = width;
        *(p_var2 - 1) = (width + 1) >> 1;
        unint64_t *p_var2 = height;
      }
      p_var2 += 3;
      --v4;
    }
    while (v4);
  }
}

- (ToneMapSmoothingResources)initWithMetalContext:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 mtlSubAllocatorID:(unsigned int)a6 srlVersion:(int)a7
{
  id v13 = a3;
  v46.receiver = self;
  v46.super_class = (Class)ToneMapSmoothingResources;
  v14 = [(ToneMapSmoothingResources *)&v46 init];
  v15 = v14;
  if (v14)
  {
    v14->_mtlSubAllocatorID = a6;
    v14->_unint64_t width = a4;
    v14->_unint64_t height = a5;
    v14->_maxNPyramidLevels = +[ToneMapSmoothingResources calcMaxNPyramidLevelsForWidth:a4 height:a5];
    objc_storeStrong((id *)&v15->_metalContext, a3);
    v15->_srlVersion = a7;
    v16 = (ToneMapSmoothingResources *)objc_opt_new();
    v17 = v16;
    if (!v16)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_13;
    }
    [(ToneMapSmoothingResources *)v16 setStorageMode:0];
    [(ToneMapSmoothingResources *)v17 setHazardTrackingMode:2];
    [(ToneMapSmoothingResources *)v17 setSize:512000];
    v18 = [v13 device];
    uint64_t v19 = [v18 newHeapWithDescriptor:v17];
    internalHeap = v15->_internalHeap;
    v15->_internalHeap = (MTLHeap *)v19;

    if (!v15->_internalHeap) {
      goto LABEL_15;
    }
    v15->_dimensions = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)malloc_type_calloc(v15->_maxNPyramidLevels, 0x18uLL, 0x1000040504FFAC1uLL);
    uint64_t v21 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:1536 options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    sffDescriptorsBuffer = v15->_sffDescriptorsBuffer;
    v15->_sffDescriptorsBuffer = (MTLBuffer *)v21;

    if (!v15->_sffDescriptorsBuffer) {
      goto LABEL_15;
    }
    uint64_t v23 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:384 options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    sffNThreadGroupsBuffer = v15->_sffNThreadGroupsBuffer;
    v15->_sffNThreadGroupsBuffer = (MTLBuffer *)v23;

    if (!v15->_sffNThreadGroupsBuffer) {
      goto LABEL_15;
    }
    uint64_t v25 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:176 * v15->_maxNPyramidLevels options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    mstmTuningParams = v15->_mstmTuningParams;
    v15->_mstmTuningParams = (MTLBuffer *)v25;

    if (!v15->_mstmTuningParams) {
      goto LABEL_15;
    }
    uint64_t v27 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:176 * v15->_maxNPyramidLevels options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    mstmv2TuningParams = v15->_mstmv2TuningParams;
    v15->_mstmv2TuningParams = (MTLBuffer *)v27;

    if (!v15->_mstmv2TuningParams) {
      goto LABEL_15;
    }
    uint64_t v29 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:176 * v15->_maxNPyramidLevels options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    srlOnMSTMTuningParams = v15->_srlOnMSTMTuningParams;
    v15->_srlOnMSTMTuningParams = (MTLBuffer *)v29;

    if (!v15->_srlOnMSTMTuningParams) {
      goto LABEL_15;
    }
    uint64_t v31 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:4 options:[(MTLHeap *)v15->_internalHeap resourceOptions]];
    blackPoint = v15->_blackPoint;
    v15->_blackPoint = (MTLBuffer *)v31;

    if (!v15->_blackPoint
      || (uint64_t v33 = [(MTLHeap *)v15->_internalHeap newBufferWithLength:4 options:[(MTLHeap *)v15->_internalHeap resourceOptions]], playbackCurve = v15->_playbackCurve, v15->_playbackCurve = (MTLBuffer *)v33, playbackCurve, !v15->_playbackCurve))
    {
LABEL_15:
      FigDebugAssert3();
      FigSignalErrorAt();

      v17 = 0;
      goto LABEL_13;
    }
    v15->_saturationControl = 0.1;
    [(ToneMapSmoothingResources *)v15 calcPyramidDimensions];
    uint64_t v35 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15->_maxNPyramidLevels];
    masksPyramid = v15->_masksPyramid;
    v15->_masksPyramid = (NSMutableArray *)v35;

    uint64_t v37 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15->_maxNPyramidLevels];
    referencePyramidOdd = v15->_referencePyramidOdd;
    v15->_referencePyramidOdd = (NSMutableArray *)v37;

    uint64_t v39 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15->_maxNPyramidLevels];
    referencePyramidEven = v15->_referencePyramidEven;
    v15->_referencePyramidEven = (NSMutableArray *)v39;

    uint64_t v41 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15->_maxNPyramidLevels];
    outputPyramidOdd = v15->_outputPyramidOdd;
    v15->_outputPyramidOdd = (NSMutableArray *)v41;

    uint64_t v43 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15->_maxNPyramidLevels];
    outputPyramidEven = v15->_outputPyramidEven;
    v15->_outputPyramidEven = (NSMutableArray *)v43;
  }
  v17 = v15;
LABEL_13:

  return v17;
}

- (void)dealloc
{
  free(self->_dimensions);
  v3.receiver = self;
  v3.super_class = (Class)ToneMapSmoothingResources;
  [(ToneMapSmoothingResources *)&v3 dealloc];
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 useMaskPyramid:(BOOL)a5
{
  if (self->_width != a3 || self->_height != a4)
  {
    FigDebugAssert3();
    v8 = 0;
    int v37 = -12780;
    goto LABEL_17;
  }
  BOOL v6 = a5;
  v7 = [(FigMetalContext *)self->_metalContext allocator];
  v8 = (void *)[v7 newTextureDescriptor:self->_mtlSubAllocatorID];

  if (!v8)
  {
LABEL_18:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
    goto LABEL_17;
  }
  if (self->_maxNPyramidLevels == 1)
  {
LABEL_16:
    int v37 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  v11 = 0;
  while (1)
  {
    if (!v6) {
      goto LABEL_10;
    }
    v12 = [(FigMetalContext *)self->_metalContext allocator];
    id v13 = (void *)[v12 newTextureDescriptor:self->_mtlSubAllocatorID];

    if (!v13)
    {
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();

      goto LABEL_21;
    }
    unint64_t var0 = self->_dimensions[v9].var0;
    v15 = [v13 desc];
    [v15 setWidth:var0];

    unint64_t var2 = self->_dimensions[v9].var2;
    v17 = [v13 desc];
    [v17 setHeight:var2];

    v18 = [v13 desc];
    [v18 setPixelFormat:30];

    uint64_t v19 = [v13 desc];
    [v19 setUsage:3];

    v20 = [v13 desc];
    [v20 setCompressionFootprint:1];

    uint64_t v21 = [v13 desc];
    [v21 setCompressionMode:1];

    [v13 setLabel:0];
    v22 = [(FigMetalContext *)self->_metalContext allocator];
    uint64_t v23 = [v22 newTextureWithDescriptor:v13 subAllocatorID:self->_mtlSubAllocatorID];

    if (!v23) {
      break;
    }
    [(NSMutableArray *)self->_masksPyramid addObject:v23];

    v11 = (void *)v23;
LABEL_10:
    unint64_t var1 = self->_dimensions[v9].var1;
    uint64_t v25 = [v8 desc];
    [v25 setWidth:var1];

    unint64_t v26 = self->_dimensions[v9].var2;
    uint64_t v27 = [v8 desc];
    [v27 setHeight:v26];

    v28 = [v8 desc];
    [v28 setPixelFormat:25];

    uint64_t v29 = [v8 desc];
    [v29 setUsage:3];

    [v8 setLabel:0];
    v30 = [(FigMetalContext *)self->_metalContext allocator];
    uint64_t v31 = (void *)[v30 newTextureWithDescriptor:v8 subAllocatorID:self->_mtlSubAllocatorID];

    if (!v31) {
      goto LABEL_18;
    }
    [(NSMutableArray *)self->_referencePyramidOdd addObject:v31];
    [v8 setLabel:0];
    v32 = [(FigMetalContext *)self->_metalContext allocator];
    uint64_t v33 = (void *)[v32 newTextureWithDescriptor:v8 subAllocatorID:self->_mtlSubAllocatorID];

    if (!v33) {
      goto LABEL_18;
    }
    [(NSMutableArray *)self->_referencePyramidEven addObject:v33];
    [v8 setLabel:0];
    v34 = [(FigMetalContext *)self->_metalContext allocator];
    uint64_t v35 = (void *)[v34 newTextureWithDescriptor:v8 subAllocatorID:self->_mtlSubAllocatorID];

    if (!v35) {
      goto LABEL_18;
    }
    [(NSMutableArray *)self->_outputPyramidOdd addObject:v35];
    [v8 setLabel:0];
    v36 = [(FigMetalContext *)self->_metalContext allocator];
    v11 = (void *)[v36 newTextureWithDescriptor:v8 subAllocatorID:self->_mtlSubAllocatorID];

    if (!v11) {
      goto LABEL_18;
    }
    [(NSMutableArray *)self->_outputPyramidEven addObject:v11];
    ++v10;
    ++v9;
    if (v10 >= self->_maxNPyramidLevels - 1)
    {

      goto LABEL_16;
    }
  }
  FigDebugAssert3();
  int v37 = FigSignalErrorAt();
LABEL_21:

LABEL_17:
  return v37;
}

- (void)makeResourcesAliasable
{
  v15 = 0;
  if (self->_maxNPyramidLevels != 1)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [(NSMutableArray *)self->_referencePyramidOdd objectAtIndexedSubscript:v3];
      v5 = v15;
      v16 = (void *)v4;

      FigMetalDecRef();
      uint64_t v6 = [(NSMutableArray *)self->_referencePyramidEven objectAtIndexedSubscript:v3];
      v7 = v16;
      v17 = (void *)v6;

      FigMetalDecRef();
      uint64_t v8 = [(NSMutableArray *)self->_outputPyramidOdd objectAtIndexedSubscript:v3];
      uint64_t v9 = v17;
      v18 = (void *)v8;

      FigMetalDecRef();
      uint64_t v10 = [(NSMutableArray *)self->_outputPyramidEven objectAtIndexedSubscript:v3];
      v11 = v18;
      v15 = (void *)v10;

      FigMetalDecRef();
      ++v3;
    }
    while (v3 < self->_maxNPyramidLevels - 1);
  }
  [(NSMutableArray *)self->_referencePyramidOdd removeAllObjects];
  [(NSMutableArray *)self->_referencePyramidEven removeAllObjects];
  [(NSMutableArray *)self->_outputPyramidOdd removeAllObjects];
  [(NSMutableArray *)self->_outputPyramidEven removeAllObjects];
  if ([(NSMutableArray *)self->_masksPyramid count])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [(NSMutableArray *)self->_masksPyramid objectAtIndexedSubscript:v12];
      v14 = v15;
      v15 = (void *)v13;

      FigMetalDecRef();
      ++v12;
    }
    while (v12 < [(NSMutableArray *)self->_masksPyramid count]);
  }
  [(NSMutableArray *)self->_masksPyramid removeAllObjects];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5
{
  retstr->unint64_t var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  if (self[2].var2 > a4)
  {
    uint64_t v6 = (void *)(self[1].var0 + 24 * a4);
    unint64_t v7 = (a5 + *v6 - 1) / a5;
    unint64_t v8 = (a6 + v6[2] - 1) / a6;
    retstr->unint64_t var0 = v7;
    retstr->unint64_t var1 = v8;
    retstr->unint64_t var2 = 1;
  }
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForOddEvenLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5
{
  retstr->unint64_t var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  if (self[2].var2 > a4)
  {
    unint64_t v6 = self[1].var0 + 24 * a4;
    unint64_t v7 = (a5 + *(void *)(v6 + 8) - 1) / a5;
    unint64_t v8 = (a6 + *(void *)(v6 + 16) - 1) / a6;
    retstr->unint64_t var0 = v7;
    retstr->unint64_t var1 = v8;
    retstr->unint64_t var2 = 1;
  }
  return self;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)maxNPyramidLevels
{
  return self->_maxNPyramidLevels;
}

- (NSMutableArray)masksPyramid
{
  return self->_masksPyramid;
}

- (NSMutableArray)referencePyramidOdd
{
  return self->_referencePyramidOdd;
}

- (NSMutableArray)referencePyramidEven
{
  return self->_referencePyramidEven;
}

- (NSMutableArray)outputPyramidOdd
{
  return self->_outputPyramidOdd;
}

- (NSMutableArray)outputPyramidEven
{
  return self->_outputPyramidEven;
}

- (int)srlVersion
{
  return self->_srlVersion;
}

- (MTLBuffer)sffDescriptorsBuffer
{
  return self->_sffDescriptorsBuffer;
}

- (MTLBuffer)sffNThreadGroupsBuffer
{
  return self->_sffNThreadGroupsBuffer;
}

- (MTLBuffer)mstmTuningParams
{
  return self->_mstmTuningParams;
}

- (MTLBuffer)mstmv2TuningParams
{
  return self->_mstmv2TuningParams;
}

- (MTLBuffer)srlOnMSTMTuningParams
{
  return self->_srlOnMSTMTuningParams;
}

- (MTLBuffer)blackPoint
{
  return self->_blackPoint;
}

- (MTLBuffer)playbackCurve
{
  return self->_playbackCurve;
}

- (float)saturationControl
{
  return self->_saturationControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackCurve, 0);
  objc_storeStrong((id *)&self->_blackPoint, 0);
  objc_storeStrong((id *)&self->_srlOnMSTMTuningParams, 0);
  objc_storeStrong((id *)&self->_mstmv2TuningParams, 0);
  objc_storeStrong((id *)&self->_mstmTuningParams, 0);
  objc_storeStrong((id *)&self->_sffNThreadGroupsBuffer, 0);
  objc_storeStrong((id *)&self->_sffDescriptorsBuffer, 0);
  objc_storeStrong((id *)&self->_outputPyramidEven, 0);
  objc_storeStrong((id *)&self->_outputPyramidOdd, 0);
  objc_storeStrong((id *)&self->_referencePyramidEven, 0);
  objc_storeStrong((id *)&self->_referencePyramidOdd, 0);
  objc_storeStrong((id *)&self->_masksPyramid, 0);
  objc_storeStrong((id *)&self->_internalHeap, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end