@interface ToneMapSmoothingResources
+ (unint64_t)calcMaxNPyramidLevelsForWidth:(unint64_t)a3 height:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForOddEvenLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5;
- (MTLBuffer)mstmTuningParams;
- (MTLBuffer)sffDescriptorsBuffer;
- (MTLBuffer)sffNThreadGroupsBuffer;
- (MTLBuffer)srlCoeffsBuffer;
- (MTLBuffer)srlFaceStatsBuffer;
- (MTLBuffer)srlGlobalStatsBuffer;
- (MTLBuffer)srlOnMSTMTuningParams;
- (NSMutableArray)masksPyramid;
- (NSMutableArray)outputPyramidEven;
- (NSMutableArray)outputPyramidOdd;
- (NSMutableArray)referencePyramidEven;
- (NSMutableArray)referencePyramidOdd;
- (ToneMapSmoothingResources)initWithMetalContext:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 mtlSubAllocatorID:(unsigned int)a6 srlVersion:(int)a7;
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
  uint64_t v3 = objc_msgSend_calcMaxNPyramidLevelsForWidth_height_(ToneMapSmoothingResources, a2, self->_width, self->_height);
  uint64_t v4 = v3 - 1;
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
  v120.receiver = self;
  v120.super_class = (Class)ToneMapSmoothingResources;
  v14 = [(ToneMapSmoothingResources *)&v120 init];
  v16 = v14;
  if (v14)
  {
    v14->_mtlSubAllocatorID = a6;
    v14->_unint64_t width = a4;
    v14->_unint64_t height = a5;
    v14->_maxNPyramidLevels = objc_msgSend_calcMaxNPyramidLevelsForWidth_height_(ToneMapSmoothingResources, v15, a4, a5);
    objc_storeStrong((id *)&v16->_metalContext, a3);
    v16->_srlVersion = a7;
    v17 = (ToneMapSmoothingResources *)objc_opt_new();
    v20 = v17;
    if (!v17)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_13;
    }
    objc_msgSend_setStorageMode_(v17, v18, 0, v19);
    objc_msgSend_setHazardTrackingMode_(v20, v21, 2, v22);
    objc_msgSend_setSize_(v20, v23, 512000, v24);
    v28 = objc_msgSend_device(v13, v25, v26, v27);
    uint64_t v31 = objc_msgSend_newHeapWithDescriptor_(v28, v29, (uint64_t)v20, v30);
    internalHeap = v16->_internalHeap;
    v16->_internalHeap = (MTLHeap *)v31;

    if (!v16->_internalHeap) {
      goto LABEL_15;
    }
    v16->_dimensions = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)malloc_type_calloc(v16->_maxNPyramidLevels, 0x18uLL, 0x1000040504FFAC1uLL);
    v33 = v16->_internalHeap;
    uint64_t v37 = objc_msgSend_resourceOptions(v33, v34, v35, v36);
    uint64_t v39 = objc_msgSend_newBufferWithLength_options_(v33, v38, 16916, v37);
    srlGlobalStatsBuffer = v16->_srlGlobalStatsBuffer;
    v16->_srlGlobalStatsBuffer = (MTLBuffer *)v39;

    if (!v16->_srlGlobalStatsBuffer) {
      goto LABEL_15;
    }
    v44 = v16->_internalHeap;
    uint64_t v45 = objc_msgSend_resourceOptions(v44, v41, v42, v43);
    uint64_t v47 = objc_msgSend_newBufferWithLength_options_(v44, v46, 217856, v45);
    srlFaceStatsBuffer = v16->_srlFaceStatsBuffer;
    v16->_srlFaceStatsBuffer = (MTLBuffer *)v47;

    if (!v16->_srlFaceStatsBuffer) {
      goto LABEL_15;
    }
    v52 = v16->_internalHeap;
    uint64_t v53 = objc_msgSend_resourceOptions(v52, v49, v50, v51);
    uint64_t v55 = objc_msgSend_newBufferWithLength_options_(v52, v54, 48, v53);
    srlCoeffsBuffer = v16->_srlCoeffsBuffer;
    v16->_srlCoeffsBuffer = (MTLBuffer *)v55;

    if (!v16->_srlCoeffsBuffer) {
      goto LABEL_15;
    }
    v60 = v16->_internalHeap;
    uint64_t v61 = objc_msgSend_resourceOptions(v60, v57, v58, v59);
    uint64_t v63 = objc_msgSend_newBufferWithLength_options_(v60, v62, 1536, v61);
    sffDescriptorsBuffer = v16->_sffDescriptorsBuffer;
    v16->_sffDescriptorsBuffer = (MTLBuffer *)v63;

    if (!v16->_sffDescriptorsBuffer) {
      goto LABEL_15;
    }
    v68 = v16->_internalHeap;
    uint64_t v69 = objc_msgSend_resourceOptions(v68, v65, v66, v67);
    uint64_t v71 = objc_msgSend_newBufferWithLength_options_(v68, v70, 384, v69);
    sffNThreadGroupsBuffer = v16->_sffNThreadGroupsBuffer;
    v16->_sffNThreadGroupsBuffer = (MTLBuffer *)v71;

    if (!v16->_sffNThreadGroupsBuffer) {
      goto LABEL_15;
    }
    uint64_t v76 = v16->_maxNPyramidLevels << 7;
    v77 = v16->_internalHeap;
    uint64_t v78 = objc_msgSend_resourceOptions(v77, v73, v74, v75);
    uint64_t v80 = objc_msgSend_newBufferWithLength_options_(v77, v79, v76, v78);
    mstmTuningParams = v16->_mstmTuningParams;
    v16->_mstmTuningParams = (MTLBuffer *)v80;

    if (!v16->_mstmTuningParams
      || (uint64_t v85 = v16->_maxNPyramidLevels << 7,
          v86 = v16->_internalHeap,
          uint64_t v87 = objc_msgSend_resourceOptions(v86, v82, v83, v84),
          uint64_t v89 = objc_msgSend_newBufferWithLength_options_(v86, v88, v85, v87),
          srlOnMSTMTuningParams = v16->_srlOnMSTMTuningParams,
          v16->_srlOnMSTMTuningParams = (MTLBuffer *)v89,
          srlOnMSTMTuningParams,
          !v16->_srlOnMSTMTuningParams))
    {
LABEL_15:
      FigDebugAssert3();
      FigSignalErrorAt();

      v20 = 0;
      goto LABEL_13;
    }
    objc_msgSend_calcPyramidDimensions(v16, v91, v92, v93);
    id v94 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v97 = objc_msgSend_initWithCapacity_(v94, v95, v16->_maxNPyramidLevels, v96);
    masksPyramid = v16->_masksPyramid;
    v16->_masksPyramid = (NSMutableArray *)v97;

    id v99 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v102 = objc_msgSend_initWithCapacity_(v99, v100, v16->_maxNPyramidLevels, v101);
    referencePyramidOdd = v16->_referencePyramidOdd;
    v16->_referencePyramidOdd = (NSMutableArray *)v102;

    id v104 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v107 = objc_msgSend_initWithCapacity_(v104, v105, v16->_maxNPyramidLevels, v106);
    referencePyramidEven = v16->_referencePyramidEven;
    v16->_referencePyramidEven = (NSMutableArray *)v107;

    id v109 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v112 = objc_msgSend_initWithCapacity_(v109, v110, v16->_maxNPyramidLevels, v111);
    outputPyramidOdd = v16->_outputPyramidOdd;
    v16->_outputPyramidOdd = (NSMutableArray *)v112;

    id v114 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v117 = objc_msgSend_initWithCapacity_(v114, v115, v16->_maxNPyramidLevels, v116);
    outputPyramidEven = v16->_outputPyramidEven;
    v16->_outputPyramidEven = (NSMutableArray *)v117;
  }
  v20 = v16;
LABEL_13:

  return v20;
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
    v10 = 0;
    int v112 = -12780;
    goto LABEL_16;
  }
  BOOL v6 = a5;
  v7 = objc_msgSend_allocator(self->_metalContext, a2, a3, a4);
  v10 = objc_msgSend_newTextureDescriptor_(v7, v8, self->_mtlSubAllocatorID, v9);

  if (!v10) {
    goto LABEL_17;
  }
  if (self->_maxNPyramidLevels != 1)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    v16 = 0;
    while (1)
    {
      if (v6)
      {
        unint64_t var0 = self->_dimensions[v14].var0;
        v18 = objc_msgSend_desc(v10, v11, v12, v13);
        objc_msgSend_setWidth_(v18, v19, var0, v20);

        unint64_t var2 = self->_dimensions[v14].var2;
        v25 = objc_msgSend_desc(v10, v22, v23, v24);
        objc_msgSend_setHeight_(v25, v26, var2, v27);

        uint64_t v31 = objc_msgSend_desc(v10, v28, v29, v30);
        objc_msgSend_setPixelFormat_(v31, v32, 30, v33);

        uint64_t v37 = objc_msgSend_desc(v10, v34, v35, v36);
        objc_msgSend_setUsage_(v37, v38, 3, v39);

        objc_msgSend_setLabel_(v10, v40, 0, v41);
        uint64_t v45 = objc_msgSend_allocator(self->_metalContext, v42, v43, v44);
        uint64_t v47 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v45, v46, (uint64_t)v10, self->_mtlSubAllocatorID);

        if (!v47) {
          break;
        }
        objc_msgSend_addObject_(self->_masksPyramid, v48, v47, v49);
        v16 = (void *)v47;
      }
      unint64_t var1 = self->_dimensions[v14].var1;
      uint64_t v51 = objc_msgSend_desc(v10, v11, v12, v13);
      objc_msgSend_setWidth_(v51, v52, var1, v53);

      unint64_t v54 = self->_dimensions[v14].var2;
      uint64_t v58 = objc_msgSend_desc(v10, v55, v56, v57);
      objc_msgSend_setHeight_(v58, v59, v54, v60);

      v64 = objc_msgSend_desc(v10, v61, v62, v63);
      objc_msgSend_setPixelFormat_(v64, v65, 25, v66);

      v70 = objc_msgSend_desc(v10, v67, v68, v69);
      objc_msgSend_setUsage_(v70, v71, 3, v72);

      objc_msgSend_setLabel_(v10, v73, 0, v74);
      uint64_t v78 = objc_msgSend_allocator(self->_metalContext, v75, v76, v77);
      uint64_t v80 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v78, v79, (uint64_t)v10, self->_mtlSubAllocatorID);

      if (!v80) {
        break;
      }
      objc_msgSend_addObject_(self->_referencePyramidOdd, v81, (uint64_t)v80, v82);
      objc_msgSend_setLabel_(v10, v83, 0, v84);
      v88 = objc_msgSend_allocator(self->_metalContext, v85, v86, v87);
      v90 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v88, v89, (uint64_t)v10, self->_mtlSubAllocatorID);

      if (!v90) {
        break;
      }
      objc_msgSend_addObject_(self->_referencePyramidEven, v91, (uint64_t)v90, v92);
      objc_msgSend_setLabel_(v10, v93, 0, v94);
      v98 = objc_msgSend_allocator(self->_metalContext, v95, v96, v97);
      v100 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v98, v99, (uint64_t)v10, self->_mtlSubAllocatorID);

      if (!v100) {
        break;
      }
      objc_msgSend_addObject_(self->_outputPyramidOdd, v101, (uint64_t)v100, v102);
      objc_msgSend_setLabel_(v10, v103, 0, v104);
      v108 = objc_msgSend_allocator(self->_metalContext, v105, v106, v107);
      v16 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v108, v109, (uint64_t)v10, self->_mtlSubAllocatorID);

      if (!v16) {
        break;
      }
      objc_msgSend_addObject_(self->_outputPyramidEven, v110, (uint64_t)v16, v111);
      ++v15;
      ++v14;
      if (v15 >= self->_maxNPyramidLevels - 1)
      {

        goto LABEL_15;
      }
    }
LABEL_17:
    FigDebugAssert3();
    int v112 = FigSignalErrorAt();
    goto LABEL_16;
  }
LABEL_15:
  int v112 = 0;
LABEL_16:

  return v112;
}

- (void)makeResourcesAliasable
{
  uint64_t v41 = 0;
  if (self->_maxNPyramidLevels != 1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(self->_referencePyramidOdd, a2, v5, v3);
      v7 = v41;
      uint64_t v42 = (void *)v6;

      FigMetalDecRef();
      uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(self->_referencePyramidEven, v8, v5, v9);
      v11 = v42;
      uint64_t v43 = (void *)v10;

      FigMetalDecRef();
      uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(self->_outputPyramidOdd, v12, v5, v13);
      unint64_t v15 = v43;
      uint64_t v44 = (void *)v14;

      FigMetalDecRef();
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_outputPyramidEven, v16, v5, v17);
      uint64_t v19 = v44;
      uint64_t v41 = (void *)v18;

      FigMetalDecRef();
      ++v5;
    }
    while (v5 < self->_maxNPyramidLevels - 1);
  }
  objc_msgSend_removeAllObjects(self->_referencePyramidOdd, a2, v2, v3);
  objc_msgSend_removeAllObjects(self->_referencePyramidEven, v20, v21, v22);
  objc_msgSend_removeAllObjects(self->_outputPyramidOdd, v23, v24, v25);
  objc_msgSend_removeAllObjects(self->_outputPyramidEven, v26, v27, v28);
  if (objc_msgSend_count(self->_masksPyramid, v29, v30, v31))
  {
    unint64_t v35 = 0;
    do
    {
      uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(self->_masksPyramid, v32, v35, v34);
      uint64_t v37 = v41;
      uint64_t v41 = (void *)v36;

      FigMetalDecRef();
      ++v35;
    }
    while (v35 < objc_msgSend_count(self->_masksPyramid, v38, v39, v40));
  }
  objc_msgSend_removeAllObjects(self->_masksPyramid, v32, v33, v34);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeSizeForLevel:(SEL)a3 xDivisor:(unint64_t)a4 yDivisor:(unint64_t)a5
{
  retstr->unint64_t var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  if (self[2].var1 > a4)
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
  if (self[2].var1 > a4)
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

- (MTLBuffer)srlGlobalStatsBuffer
{
  return self->_srlGlobalStatsBuffer;
}

- (MTLBuffer)srlFaceStatsBuffer
{
  return self->_srlFaceStatsBuffer;
}

- (MTLBuffer)srlCoeffsBuffer
{
  return self->_srlCoeffsBuffer;
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

- (MTLBuffer)srlOnMSTMTuningParams
{
  return self->_srlOnMSTMTuningParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srlOnMSTMTuningParams, 0);
  objc_storeStrong((id *)&self->_mstmTuningParams, 0);
  objc_storeStrong((id *)&self->_sffNThreadGroupsBuffer, 0);
  objc_storeStrong((id *)&self->_sffDescriptorsBuffer, 0);
  objc_storeStrong((id *)&self->_srlCoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlFaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlGlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_outputPyramidEven, 0);
  objc_storeStrong((id *)&self->_outputPyramidOdd, 0);
  objc_storeStrong((id *)&self->_referencePyramidEven, 0);
  objc_storeStrong((id *)&self->_referencePyramidOdd, 0);
  objc_storeStrong((id *)&self->_masksPyramid, 0);
  objc_storeStrong((id *)&self->_internalHeap, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end