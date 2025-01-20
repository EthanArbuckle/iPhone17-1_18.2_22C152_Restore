@interface VFXMTLMorphDeformer
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5;
- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5;
- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6;
- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9;
- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11;
- (void)dealloc;
- (void)setupMorphTargetsWithComputeContext:(id)a3;
@end

@implementation VFXMTLMorphDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)dealloc
{
  morpher = self->_morpher;
  if (morpher)
  {
    CFRelease(morpher);
    self->_morpher = 0;
  }

  free(self->_morphTargets);
  v4.receiver = self;
  v4.super_class = (Class)VFXMTLMorphDeformer;
  [(VFXMTLMorphDeformer *)&v4 dealloc];
}

- (void)setupMorphTargetsWithComputeContext:(id)a3
{
  id v8 = a3;
  uint64_t v10 = sub_1B6588E20((uint64_t)self->_morpher, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  uint64_t v24 = sub_1B63CCE68(v10, v11, v12, v13, v14, v15, v16, v17);
  if (!v24) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v18, v19, v20, v21, v22, v23, (uint64_t)"baseMesh");
  }
  uint64_t v31 = sub_1B63CD09C((uint64_t)self->_morpher);
  if (!v31) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v25, v26, v27, v28, v29, v30, (uint64_t)"morph");
  }
  BOOL v32 = sub_1B65873F4(v31) == 0;
  char v352 = sub_1B65880A4(v31, v33, v34, v35, v36, v37, v38, v39);
  if (v352)
  {
    unsigned __int8 finalMeshDataKind = 0;
    signed __int16 v41 = 43;
    unint64_t v42 = 1;
  }
  else
  {
    unint64_t v42 = 0;
    unsigned __int8 finalMeshDataKind = self->_finalMeshDataKind;
    signed __int16 v41 = 8;
  }
  v350 = v8;
  BOOL v43 = !self->_morphNormals;
  self->_unint64_t morphKind = v42;
  if (v43) {
    signed __int16 v44 = 0;
  }
  else {
    signed __int16 v44 = 22;
  }
  self->_dataKindForComputeKernel = finalMeshDataKind;
  self->_basePositionDataType = 8;
  self->_baseNormalDataType = v44;
  self->_morphTargetPositionDataType = v41;
  self->_morphTargetNormalDataType = v44;
  CFArrayRef v45 = (const __CFArray *)sub_1B63CD09C(v31);
  uint64_t Count = CFArrayGetCount(v45);
  if (!Count) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Internal consistency error", v46, v47, v48, v49, v50, v51, (uint64_t)"maxMorphTargetCount > 0");
  }
  v53 = sub_1B64AC5F8(v24, 0, 0, self->_finalMeshDataKind, v48, v49, v50, v51);
  v365[0] = 0;
  uint64_t v54 = sub_1B64AD1D4(v24, v365);
  uint64_t v346 = sub_1B644805C(v24);
  v344 = sub_1B64AC5F8(v24, 0, 0, self->_dataKindForComputeKernel, v55, v56, v57, v58);
  if (!v344) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v60, v61, v62, v63, v64, v65, (uint64_t)"basePositionSource");
  }
  v351 = self;
  uint64_t v343 = v31;
  BOOL v66 = v32;
  if (self->_morphNormals)
  {
    v67 = sub_1B64AC5F8(v24, 1, 0, self->_dataKindForComputeKernel, v62, v63, v64, v65);
    if (!v67)
    {
      v67 = (const void *)sub_1B63DE310(v24, self->_dataKindForComputeKernel, 0, v61, v62, v63, v64, v65);
      if (!v67) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v68, v69, v70, v71, v72, v73, (uint64_t)"baseNormalSource");
      }
      CFAutorelease(v67);
    }
  }
  else
  {
    v67 = 0;
  }
  self->_vertexCountForComputeKernel = sub_1B641D8A0((uint64_t)v344, v59, v60, v61, v62, v63, v64, v65);
  self->_finalMeshVertexuint64_t Count = sub_1B641D8A0((uint64_t)v53, v74, v75, v76, v77, v78, v79, v80);
  v81 = malloc_type_malloc(40 * Count, 0x10600401818AB88uLL);
  v361[0] = MEMORY[0x1E4F143A8];
  v361[1] = 3221225472;
  v361[2] = sub_1B6592D5C;
  v361[3] = &unk_1E61449D8;
  v361[4] = self;
  v361[5] = v24;
  char v363 = v352;
  v361[6] = v344;
  v361[7] = v67;
  int v362 = v365[0];
  BOOL v364 = v66;
  v361[8] = v54;
  v361[9] = v81;
  sub_1B63CC9FC(v45, (uint64_t)v361);
  morphTargetuint64_t Count = self->_morphTargetCount;
  v83 = self;
  CFArrayRef v342 = v45;
  if (morphTargetCount)
  {
    self->_morphTargets = ($4C9AEC9213DCD68D17C013290EF3C758 *)malloc_type_malloc(32 * morphTargetCount, 0x100004017768742uLL);
    uint64_t v91 = sub_1B63CA534(self->_morphTargetPositionDataType, v84, v85, v86, v87, v88, v89, v90);
    uint64_t v99 = sub_1B63CA534(self->_morphTargetNormalDataType, v92, v93, v94, v95, v96, v97, v98);
    v100 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
    v340 = v67;
    if (sub_1B64D9854(v100, v101, v102, v103)) {
      unint64_t v111 = (v99 + ((v91 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else {
      unint64_t v111 = v99 + v91;
    }
    unint64_t v353 = v111;
    unsigned int v114 = self->_vertexCountForComputeKernel - 1;
    uint64_t v115 = 1;
    if (v114 > 0xFF) {
      uint64_t v115 = 2;
    }
    unsigned int v116 = HIWORD(v114);
    if (HIWORD(v114)) {
      uint64_t v115 = 4;
    }
    uint64_t v345 = v115;
    sub_1B64D8030(self->_morphTargetPositionDataType, v104, v105, v106, v107, v108, v109, v110);
    v341 = v81;
    if (self->_morphTargetCount)
    {
      unint64_t v117 = 0;
      uint64_t size = 0;
      uint64_t v118 = 0;
      if (v116) {
        char v119 = 2;
      }
      else {
        char v119 = v114 > 0xFF;
      }
      v120 = v81 + 4;
      do
      {
        uint64_t Alignment = MTLDataTypeGetAlignment();
        uint64_t v122 = *v120;
        if (*v120 != v83->_vertexCountForComputeKernel)
        {
          uint64_t v123 = MTLDataTypeGetAlignment();
          uint64_t size = ((size + v123 - 1) & -v123) + (*v120 << v119);
        }
        uint64_t v118 = ((v118 + Alignment - 1) & -Alignment) + v122 * v353;
        ++v117;
        v120 += 5;
      }
      while (v117 < v83->_morphTargetCount);
      v347 = (char *)malloc_type_malloc(v118, 0xE5A8494uLL);
      v124 = (char *)size;
      if (size) {
        v124 = (char *)malloc_type_malloc(size, 0x8F4755B6uLL);
      }
      else {
        uint64_t size = 0;
      }
      v81 = v341;
    }
    else
    {
      v347 = (char *)malloc_type_malloc(0, 0xE5A8494uLL);
      uint64_t size = 0;
      uint64_t v118 = 0;
      v124 = 0;
    }
    v348 = v124;
    if (v83->_morphTargetCount)
    {
      uint64_t v125 = (uint64_t)v81;
      uint64_t v126 = 0;
      unint64_t v127 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      if (v116) {
        char v130 = 2;
      }
      else {
        char v130 = v114 > 0xFF;
      }
      uint64_t v131 = v125;
      do
      {
        uint64_t v132 = (uint64_t)&v83->_morphTargets[v126];
        *(_DWORD *)(v132 + 4) = *(_DWORD *)v131;
        uint64_t v133 = MTLDataTypeGetAlignment();
        uint64_t v134 = (v129 + v133 - 1) & -v133;
        uint64_t v135 = MTLDataTypeGetAlignment();
        uint64_t v136 = (v128 + v135 - 1) & -v135;
        objc_msgSend_createVertexBufferForMorphTarget_withSetupTarget_vertexBuffer_vertexBufferOffset_indicesBuffer_indicesBufferOffset_indexSize_originalToFirstDeindexedTable_computeContext_(v83, v137, v132, v131, v347, v134, v348, v136, v345, v346, v350);
        uint64_t v138 = *(void *)(v131 + 32);
        if (v138 == v83->_vertexCountForComputeKernel) {
          uint64_t v139 = 0;
        }
        else {
          uint64_t v139 = v138 << v130;
        }
        CFRelease(*(CFTypeRef *)(v131 + 16));
        v140 = *(const void **)(v131 + 24);
        if (v140)
        {
          CFRelease(v140);
          *(void *)(v131 + 24) = 0;
        }
        uint64_t v129 = v134 + v138 * v353;
        uint64_t v128 = v139 + v136;
        v131 += 40;
        ++v127;
        v83 = v351;
        ++v126;
      }
      while (v127 < v351->_morphTargetCount);
    }
    else
    {
      uint64_t v129 = 0;
      uint64_t v128 = 0;
    }
    free(v341);
    uint64_t resourceManager = (uint64_t)v83->_resourceManager;
    id v8 = v350;
    v145 = objc_msgSend_currentBlitEncoder(v350, v142, v143, v144);
    v83->_morphTargetsVertexBuffer = (MTLBuffer *)sub_1B653D738(resourceManager, v347, v118, v145);
    free(v347);
    if (v348)
    {
      uint64_t v152 = (uint64_t)v83->_resourceManager;
      v153 = objc_msgSend_currentBlitEncoder(v350, v112, v146, v147);
      v83->_morphTargetsSparseIndicesBuffer = (MTLBuffer *)sub_1B653D738(v152, v348, size, v153);
      free(v348);
    }
    BOOL v43 = v129 == v118;
    CFArrayRef v45 = v342;
    v67 = v340;
    if (!v43) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Vertex buffer has not been completely written to", v146, v147, v148, v149, v150, v151, (uint64_t)"vertexBufferOffset == vertexBufferLength");
    }
    uint64_t v113 = v343;
    if (v128 != size) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Sparse indices buffer has not been completely written to", v146, v147, v148, v149, v150, v151, (uint64_t)"sparseIndicesBufferOffset == sparseIndicesBufferLength");
    }
  }
  else
  {
    free(v81);
    uint64_t v113 = v343;
  }
  uint64_t v359 = 0;
  uint64_t v360 = 0;
  uint64_t v358 = 0;
  LOBYTE(v337) = 1;
  v83->_baseBufferForComputeKernel = (MTLBuffer *)objc_msgSend_newBufferForDataKind_positionSource_normalSource_positionDataType_normalDataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_outPositionOffset_outNormalOffset_(v8, v112, v83->_dataKindForComputeKernel, (uint64_t)v344, v67, v83->_basePositionDataType, v83->_baseNormalDataType, 1, v337, &v360, &v359, &v358);
  uint64_t v161 = sub_1B63CA534(v83->_morphTargetPositionDataType, v154, v155, v156, v157, v158, v159, v160);
  uint64_t v169 = sub_1B63CA534(v83->_morphTargetNormalDataType, v162, v163, v164, v165, v166, v167, v168);
  v170 = (void *)sub_1B653EFB8((uint64_t)v83->_resourceManager);
  if (sub_1B64D9854(v170, v171, v172, v173))
  {
    uint64_t v161 = (v161 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v181 = (v169 + v161 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  else
  {
    unint64_t v181 = v169 + v161;
  }
  unint64_t morphKind = v351->_morphKind;
  if (!morphKind)
  {
    v200 = v351->_resourceManager;
    if (v351->_morphNormals)
    {
      v351->_incrementalInitPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_(v200, v174, @"blend_inc_init_8x_pn_kernel", v176);
      v203 = objc_msgSend_computePipelineStateForKernel_(v351->_resourceManager, v201, @"blend_inc_add_8x_pn_kernel", v202);
    }
    else
    {
      v351->_incrementalInitPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_(v200, v174, @"blend_inc_init_8x_p_kernel", v176);
      v203 = objc_msgSend_computePipelineStateForKernel_(v351->_resourceManager, v211, @"blend_inc_add_8x_p_kernel", v212);
    }
    v351->_incrementalAddPipeline = (VFXMTLComputePipeline *)v203;
    goto LABEL_113;
  }
  if (morphKind != 1)
  {
    sub_1B63F2F54(16, @"Unreachable code: Unsupported morph kind", v175, v176, v177, v178, v179, v180, v338);
    goto LABEL_113;
  }
  uint64_t v356 = 0;
  uint64_t v357 = 0;
  if (!v351->_dataKindForComputeKernel && v351->_finalMeshDataKind == 1 && v346)
  {
    uint64_t v183 = objc_msgSend_currentBlitEncoder(v8, v174, v175, v176);
    v351->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend_originalToFirstDeindexedTableBufferWithBlitEncoder_indexSizeOut_(v8, v184, v183, (uint64_t)&v357);
    v351->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend_deindexedToFirstDeindexedTableBufferWithBlitEncoder_indexSizeOut_(v8, v185, v183, (uint64_t)&v356);
  }
  BOOL morphNormals = v351->_morphNormals;
  id v186 = objc_alloc_init(MEMORY[0x1E4F35228]);
  objc_msgSend_setConstantValue_type_withName_(v186, v187, (uint64_t)&morphNormals, 53, @"morphNormal");
  uint64_t v190 = 78;
  if (!v351->_morphNormals) {
    uint64_t v190 = 45;
  }
  uint64_t v197 = objc_msgSend_stringWithFormat_(NSString, v188, @"%c", v189, v190);
  if (!v351->_originalToFirstDeindexedTableBuffer) {
    goto LABEL_86;
  }
  if (v357 == 1)
  {
    char v198 = 0;
    v354 = @"blend_indexed_u8_generic";
    v199 = @"copy_indexed_u8_generic";
    goto LABEL_87;
  }
  if (v357 == 4)
  {
    char v198 = 0;
    v354 = @"blend_indexed_u32_generic";
    v199 = @"copy_indexed_u32_generic";
    goto LABEL_87;
  }
  if (v357 != 2)
  {
    sub_1B63F2F54(16, @"Unreachable code: Unsupported index size for compute kernel", v191, v192, v193, v194, v195, v196, v339);
LABEL_86:
    v354 = 0;
    char v198 = 1;
    v199 = @"copy_generic";
    goto LABEL_87;
  }
  char v198 = 0;
  v354 = @"blend_indexed_u16_generic";
  v199 = @"copy_indexed_u16_generic";
LABEL_87:
  id v213 = objc_alloc_init(MEMORY[0x1E4F35310]);
  v217 = objc_msgSend_layouts(v213, v214, v215, v216);
  v220 = objc_msgSend_objectAtIndexedSubscript_(v217, v218, 1, v219);
  objc_msgSend_setStepFunction_(v220, v221, 5, v222);
  objc_msgSend_setStride_(v220, v223, v360, v224);
  v228 = objc_msgSend_attributes(v213, v225, v226, v227);
  v231 = objc_msgSend_objectAtIndexedSubscript_(v228, v229, 0, v230);
  uint64_t v239 = sub_1B64D8088(v351->_basePositionDataType, v232, v233, v234, v235, v236, v237, v238);
  objc_msgSend_setFormat_(v231, v240, v239, v241);
  objc_msgSend_setOffset_(v231, v242, v359, v243);
  objc_msgSend_setBufferIndex_(v231, v244, 1, v245);
  if (v351->_morphNormals)
  {
    v249 = objc_msgSend_attributes(v213, v246, v247, v248);
    v252 = objc_msgSend_objectAtIndexedSubscript_(v249, v250, 1, v251);
    uint64_t v260 = sub_1B64D8088(v351->_baseNormalDataType, v253, v254, v255, v256, v257, v258, v259);
    objc_msgSend_setFormat_(v252, v261, v260, v262);
    objc_msgSend_setOffset_(v252, v263, v358, v264);
    objc_msgSend_setBufferIndex_(v252, v265, 1, v266);
  }
  v351->_copyBaseBufferPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v246, (uint64_t)v199, (uint64_t)v213, 0, v186, v197);
  objc_msgSend_reset(v213, v267, v268, v269);
  v273 = objc_msgSend_layouts(v213, v270, v271, v272);
  v276 = objc_msgSend_objectAtIndexedSubscript_(v273, v274, 1, v275);
  objc_msgSend_setStepFunction_(v276, v277, 5, v278);
  objc_msgSend_setStride_(v276, v279, v181, v280);
  v284 = objc_msgSend_attributes(v213, v281, v282, v283);
  v287 = objc_msgSend_objectAtIndexedSubscript_(v284, v285, 0, v286);
  uint64_t v295 = sub_1B64D8088(v351->_morphTargetPositionDataType, v288, v289, v290, v291, v292, v293, v294);
  objc_msgSend_setFormat_(v287, v296, v295, v297);
  objc_msgSend_setOffset_(v287, v298, 0, v299);
  objc_msgSend_setBufferIndex_(v287, v300, 1, v301);
  if (morphNormals)
  {
    v305 = objc_msgSend_attributes(v213, v302, v303, v304);
    v308 = objc_msgSend_objectAtIndexedSubscript_(v305, v306, 1, v307);
    uint64_t v316 = sub_1B64D8088(v351->_morphTargetNormalDataType, v309, v310, v311, v312, v313, v314, v315);
    objc_msgSend_setFormat_(v308, v317, v316, v318);
    objc_msgSend_setOffset_(v308, v319, v161, v320);
    objc_msgSend_setBufferIndex_(v308, v321, 1, v322);
  }
  v351->_blendDensePipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v302, @"blend_generic", (uint64_t)v213, 0, v186, v197);
  if ((v198 & 1) == 0) {
    v351->_blendDenseIndexedPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, (uint64_t)v354, (uint64_t)v213, 0, v186, v197);
  }
  unsigned int v324 = v351->_vertexCountForComputeKernel - 1;
  uint64_t v325 = 1;
  if (v324 > 0xFF) {
    uint64_t v325 = 2;
  }
  BOOL v43 = HIWORD(v324) == 0;
  uint64_t v326 = 4;
  if (v43) {
    uint64_t v326 = v325;
  }
  if (v326 == 1)
  {
    updated = objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, @"blend_indexed_u8_generic", (uint64_t)v213, 0, v186, v197);
  }
  else if (v326 == 4)
  {
    updated = objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, @"blend_indexed_u32_generic", (uint64_t)v213, 0, v186, v197);
  }
  else
  {
    updated = objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, @"blend_indexed_u16_generic", (uint64_t)v213, 0, v186, v197);
  }
  v351->_blendSparsePipeline = (VFXMTLComputePipeline *)updated;

  CFArrayRef v45 = v342;
  if (v351->_deindexedToFirstDeindexedTableBuffer)
  {
    switch(v356)
    {
      case 1:
        v335 = objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, @"splat_indexed_s8_vertices", (uint64_t)v186, v197);
        break;
      case 4:
        v335 = objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, @"splat_indexed_s32_vertices", (uint64_t)v186, v197);
        break;
      case 2:
        v335 = objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, @"splat_indexed_s16_vertices", (uint64_t)v186, v197);
        break;
      default:
        sub_1B63F2F54(16, @"Unreachable code: Unsupported index size for compute kernel", v329, v330, v331, v332, v333, v334, v339);
        v335 = objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v336, 0, (uint64_t)v186, v197);
        break;
    }
    v351->_splatPipeline = (VFXMTLComputePipeline *)v335;
  }

LABEL_113:
  if (sub_1B6588318(v113, v204, v205, v206, v207, v208, v209, v210)) {
    sub_1B63CC9FC(v45, (uint64_t)&unk_1F0FB5EA8);
  }
}

- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11
{
  uint64_t v119 = sub_1B641D478((uint64_t)a4->var2, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8);
  uint64_t v25 = v18;
  if (self->_morphNormals)
  {
    uint64_t v117 = sub_1B641D478((uint64_t)a4->var3, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    __int16 v26 = WORD2(v18);
  }
  else
  {
    __int16 v26 = 0;
    uint64_t v117 = 0;
  }
  a3->var2 = a4->var4;
  if (self->_morphKind == 1) {
    objc_msgSend_createSparseIndicesBufferForMorphTarget_withSetupTarget_indicesBuffer_indicesBufferOffset_indexSize_originalToFirstDeindexedTable_computeContext_(self, v18, (uint64_t)a3, (uint64_t)a4, a7, a8, a9, a10, a11);
  }
  else {
    a3->var4 = 0;
  }
  int morphTargetPositionDataType = (unsigned __int16)self->_morphTargetPositionDataType;
  if (morphTargetPositionDataType == 22)
  {
    *(double *)v28.i64 = sub_1B641DC34((uint64_t)a4->var2, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    float v29 = vmaxvq_f32(v28);
    LOWORD(morphTargetPositionDataType) = self->_morphTargetPositionDataType;
    float v30 = 1.0 / v29;
  }
  else
  {
    float v29 = 1.0;
    float v30 = 1.0;
  }
  float v118 = v30;
  a3->var0 = v29;
  uint64_t v31 = sub_1B63CA534((__int16)morphTargetPositionDataType, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
  uint64_t v39 = sub_1B63CA534(self->_morphTargetNormalDataType, v32, v33, v34, v35, v36, v37, v38);
  v40 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
  int v44 = sub_1B64D9854(v40, v41, v42, v43);
  unint64_t v54 = (v31 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v55 = (v39 + v54 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (!v44) {
    unint64_t v54 = v31;
  }
  unint64_t v116 = v54;
  if (v44) {
    unint64_t v56 = v55;
  }
  else {
    unint64_t v56 = v39 + v31;
  }
  uint64_t v57 = &a5[a6];
  v112 = a3;
  unint64_t v113 = a6;
  uint64_t v110 = &a5[a6];
  unint64_t v111 = v56 * a3->var2;
  if (self->_morphKind == 1)
  {
    if (self->_morphNormals)
    {
      if (v25)
      {
        __int16 v58 = v26;
        uint64_t v59 = 0;
        unsigned int v60 = 0;
        int v61 = BYTE4(v25);
        uint64_t v62 = BYTE5(v25);
        int v63 = v58;
        uint64_t v64 = v25;
        int v65 = HIBYTE(v58);
        BOOL v66 = v57;
        do
        {
          *(double *)v67.i64 = sub_1B65D6198(v61, (const float *)(v119 + v59), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
          float32x4_t v114 = v67;
          *(double *)v76.i64 = sub_1B65D6198(v63, (const float *)(v117 + v60), v68, v69, v70, v71, v72, v73, v67, v74, v75);
          float32x4_t v53 = v76;
          v52.i64[0] = 0x3400000034000000;
          v52.i64[1] = 0x3400000034000000;
          if ((vminvq_u32((uint32x4_t)vcgeq_f32(v52, (float32x4_t)(*(_OWORD *)&v114 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) == 0|| (float32x4_t v51 = (float32x4_t)vcgeq_f32(v52, vabsq_f32(v76)), v51.i32[0] = vminvq_u32((uint32x4_t)v51), (v51.i32[0] & 0x80000000) == 0))
          {
            float32x4_t v77 = vmulq_n_f32(v114, v118);
            float32x4_t v115 = v53;
            sub_1B65D6678(self->_morphTargetPositionDataType, (uint64_t)v66, v45, v46, v47, v48, v49, v50, v77);
            sub_1B65D6678(self->_morphTargetNormalDataType, (uint64_t)&v66[v116], v78, v79, v80, v81, v82, v83, v115);
            v66 += v56;
          }
          v60 += v65;
          v59 += v62;
          --v64;
        }
        while (v64);
        goto LABEL_37;
      }
LABEL_36:
      BOOL v66 = &a5[a6];
      goto LABEL_37;
    }
    if (!v25) {
      goto LABEL_36;
    }
    unsigned int v106 = 0;
    int v107 = BYTE4(v25);
    int v108 = BYTE5(v25);
    uint64_t v109 = v25;
    BOOL v66 = v57;
    do
    {
      *(double *)v51.i64 = sub_1B65D6198(v107, (const float *)(v119 + v106), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
      v53.i64[0] = 0x3400000034000000;
      v53.i64[1] = 0x3400000034000000;
      v52.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v53, (float32x4_t)(*(_OWORD *)&v51 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if ((v52.i32[0] & 0x80000000) == 0)
      {
        sub_1B65D6678(self->_morphTargetPositionDataType, (uint64_t)v66, v45, v46, v47, v48, v49, v50, vmulq_n_f32(v51, v118));
        v66 += v56;
      }
      v106 += v108;
      --v109;
    }
    while (v109);
  }
  else
  {
    if (!v25) {
      goto LABEL_36;
    }
    unsigned int v84 = 0;
    unsigned int v85 = 0;
    int v86 = BYTE4(v25);
    int v87 = BYTE5(v25);
    int v88 = v26;
    unsigned __int8 v89 = HIBYTE(v26);
    uint64_t v90 = v25;
    int v91 = v89;
    BOOL v66 = v57;
    do
    {
      *(double *)v92.i64 = sub_1B65D6198(v86, (const float *)(v119 + v84), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
      sub_1B65D6678(self->_morphTargetPositionDataType, (uint64_t)v66, v93, v94, v95, v96, v97, v98, vmulq_n_f32(v92, v118));
      if (self->_morphNormals)
      {
        *(double *)v99.i64 = sub_1B65D6198(v88, (const float *)(v117 + v85), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
        sub_1B65D6678(self->_morphTargetNormalDataType, (uint64_t)&v66[v116], v100, v101, v102, v103, v104, v105, v99);
      }
      v66 += v56;
      v85 += v91;
      v84 += v87;
      --v90;
    }
    while (v90);
  }
LABEL_37:
  if (v66 != &v110[v111]) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Buffer has not been completely written to", v45, v46, v47, v48, v49, v50, (uint64_t)"dstForWriting == dst + length");
  }
  v112->var3 = v113;
}

- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9
{
  if (a3->var2 == self->_vertexCountForComputeKernel)
  {
    a3->var3 = 0;
    a3->var4 = 0;
    return;
  }
  var3 = a4->var3;
  if (self->_dataKindForComputeKernel)
  {
    int v113 = 0;
  }
  else
  {
    if (a8) {
      BOOL v15 = self->_finalMeshDataKind == 1;
    }
    else {
      BOOL v15 = 0;
    }
    int v16 = v15;
    int v113 = v16;
  }
  uint64_t v114 = sub_1B641D478((uint64_t)a4->var2, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
  uint64_t v24 = v17;
  int v107 = a3;
  if (var3)
  {
    uint64_t v112 = sub_1B641D478((uint64_t)a4->var3, v17, v18, v19, v20, v21, v22, v23);
    __int16 v25 = WORD2(v17);
  }
  else
  {
    __int16 v25 = 0;
    uint64_t v112 = 0;
  }
  __int16 v26 = &a5[a6];
  if (a7 == 1) {
    uint64_t v27 = &a5[a6];
  }
  else {
    uint64_t v27 = 0;
  }
  if (a7 == 2) {
    float32x4_t v28 = &a5[a6];
  }
  else {
    float32x4_t v28 = 0;
  }
  if (a7 != 4) {
    __int16 v26 = 0;
  }
  uint64_t v110 = (unsigned int *)v26;
  unint64_t v111 = v28;
  var1 = a4->var1;
  unint64_t v106 = a6;
  if ((uint64_t)sub_1B64ABD08((uint64_t)var1, v17, v18, v19, v20, v21, v22, v23) < 1)
  {
    uint64_t v72 = v24;
    if (var3)
    {
      if (v24)
      {
        __int16 v73 = v25;
        uint64_t v74 = 0;
        unsigned int v75 = 0;
        uint64_t v76 = 0;
        int v77 = 0;
        LODWORD(v24) = v73;
        int v78 = HIBYTE(v73);
        while (1)
        {
          *(double *)v79.i64 = sub_1B65D6198(BYTE4(v24), (const float *)(v114 + v74), v30, v31, v32, v33, v34, v35, v36, v37.f32[0], *(float *)&v38);
          float32x4_t v116 = v79;
          *(double *)v36.i64 = sub_1B65D6198(v24, (const float *)(v112 + v75), v80, v81, v82, v83, v84, v85, v79, v86, v87);
          unsigned long long v38 = *(_OWORD *)&v116 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
          v37.i64[0] = 0x3400000034000000;
          v37.i64[1] = 0x3400000034000000;
          v37.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v37, (float32x4_t)(*(_OWORD *)&v116 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
          if (v37.i32[0] < 0)
          {
            v37.i64[0] = 0x3400000034000000;
            v37.i64[1] = 0x3400000034000000;
            float32x4_t v36 = (float32x4_t)vcgeq_f32(v37, vabsq_f32(v36));
            v36.i32[0] = vminvq_u32((uint32x4_t)v36);
            if (v36.i32[0] < 0) {
              goto LABEL_63;
            }
          }
          if (v113)
          {
            unsigned int v88 = a8[v76];
            if (!v27) {
              goto LABEL_59;
            }
          }
          else
          {
            unsigned int v88 = v76;
            if (!v27)
            {
LABEL_59:
              uint64_t v27 = 0;
              if (v111)
              {
                *(_WORD *)unint64_t v111 = v88;
                v111 += 2;
              }
              else
              {
                *v110++ = v88;
                unint64_t v111 = 0;
              }
              goto LABEL_62;
            }
          }
          *v27++ = v88;
LABEL_62:
          ++v77;
LABEL_63:
          ++v76;
          v75 += v78;
          v74 += BYTE5(v24);
          if (v72 == v76) {
            goto LABEL_107;
          }
        }
      }
LABEL_106:
      int v77 = 0;
LABEL_107:
      unint64_t v99 = v106;
      uint64_t v98 = v107;
      if (v77 != v107->var2) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. Buffer has not been completely written to", v30, v31, v32, v33, v34, v35, (uint64_t)"writtenIndexCount == runtimeTarget->vertexCount");
      }
      goto LABEL_109;
    }
    if (!v24) {
      goto LABEL_106;
    }
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    int v77 = 0;
    int v102 = BYTE4(v24);
    uint64_t v103 = BYTE5(v24);
    while (1)
    {
      v104.i64[0] = COERCE_UNSIGNED_INT64(sub_1B65D6198(v102, (const float *)(v114 + v100), v30, v31, v32, v33, v34, v35, v36, v37.f32[0], *(float *)&v38)) & 0x7FFFFFFF7FFFFFFFLL;
      v104.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v37.i64[0] = 0x3400000034000000;
      v37.i64[1] = 0x3400000034000000;
      float32x4_t v36 = (float32x4_t)vcgeq_f32(v37, v104);
      v36.i32[0] = vminvq_u32((uint32x4_t)v36);
      if ((v36.i32[0] & 0x80000000) == 0) {
        break;
      }
LABEL_104:
      ++v101;
      v100 += v103;
      if (v72 == v101) {
        goto LABEL_107;
      }
    }
    if (v113)
    {
      unsigned int v105 = a8[v101];
      if (v27)
      {
LABEL_98:
        *v27++ = v105;
LABEL_103:
        ++v77;
        goto LABEL_104;
      }
    }
    else
    {
      unsigned int v105 = v101;
      if (v27) {
        goto LABEL_98;
      }
    }
    uint64_t v27 = 0;
    if (v111)
    {
      *(_WORD *)unint64_t v111 = v105;
      v111 += 2;
    }
    else
    {
      *v110++ = v105;
      unint64_t v111 = 0;
    }
    goto LABEL_103;
  }
  uint64_t v39 = sub_1B64ABD78((uint64_t)var1, 0, 0, v31, v32, v33, v34, v35);
  uint64_t v120 = 0;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v117 = 0u;
  sub_1B63D11F0((uint64_t)v39, 0, v40, v41, v42, v43, v44, v45, (uint64_t)&v117);
  if (!var3)
  {
    if (!DWORD2(v117))
    {
      int v90 = 0;
LABEL_111:
      uint64_t v98 = v107;
      if (v90 == v107->var2) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    uint64_t v89 = 0;
    int v90 = 0;
    int v91 = 0;
    while (BYTE11(v118) != 4)
    {
      if (BYTE11(v118) == 2)
      {
        unsigned int v92 = *(unsigned __int16 *)(v117 + 2 * (*((void *)&v119 + 1) + v120 * 2 * v89));
        unsigned int v93 = *(unsigned __int16 *)(v117 + 2 * (*((void *)&v119 + 1) + v120 * ((2 * v89) | 1)));
LABEL_73:
        if (v92 < v93)
        {
          uint64_t v94 = &a8[v92];
          unsigned int v95 = BYTE5(v24) * v91;
          do
          {
            v96.i64[0] = COERCE_UNSIGNED_INT64(sub_1B65D6198(BYTE4(v24), (const float *)(v114 + v95), v46, v47, v48, v49, v50, v51, v52, v53.f32[0], *(float *)&v54)) & 0x7FFFFFFF7FFFFFFFLL;
            v96.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
            v53.i64[0] = 0x3400000034000000;
            v53.i64[1] = 0x3400000034000000;
            float32x4_t v52 = (float32x4_t)vcgeq_f32(v53, v96);
            v52.i32[0] = vminvq_u32((uint32x4_t)v52);
            if ((v52.i32[0] & 0x80000000) == 0)
            {
              unsigned int v97 = v92;
              if (v113) {
                unsigned int v97 = *v94;
              }
              if (v27)
              {
                *v27++ = v97;
              }
              else
              {
                uint64_t v27 = 0;
                if (v111)
                {
                  *(_WORD *)unint64_t v111 = v97;
                  v111 += 2;
                }
                else
                {
                  *v110++ = v97;
                  unint64_t v111 = 0;
                }
              }
              ++v90;
            }
            ++v91;
            ++v94;
            ++v92;
            v95 += BYTE5(v24);
          }
          while (v93 != v92);
        }
        goto LABEL_87;
      }
      if (BYTE11(v118) == 1)
      {
        unsigned int v92 = *(unsigned __int8 *)(v117 + *((void *)&v119 + 1) + v120 * 2 * v89);
        unsigned int v93 = *(unsigned __int8 *)(v117 + *((void *)&v119 + 1) + v120 * ((2 * v89) | 1));
        goto LABEL_73;
      }
      sub_1B63F2F54(16, @"Unreachable code: Invalid bytes per index (%d)", v46, v47, v48, v49, v50, v51, BYTE11(v118));
LABEL_87:
      if (++v89 >= (unint64_t)DWORD2(v117)) {
        goto LABEL_111;
      }
    }
    unsigned int v92 = *(_DWORD *)(v117 + 4 * (*((void *)&v119 + 1) + v120 * 2 * v89));
    unsigned int v93 = *(_DWORD *)(v117 + 4 * (*((void *)&v119 + 1) + v120 * ((2 * v89) | 1)));
    goto LABEL_73;
  }
  if (DWORD2(v117))
  {
    uint64_t v55 = 0;
    int v56 = 0;
    int v57 = 0;
    while (1)
    {
      uint64_t v109 = v55;
      if (BYTE11(v118) == 4) {
        break;
      }
      if (BYTE11(v118) == 2)
      {
        unsigned int v58 = *(unsigned __int16 *)(v117 + 2 * (*((void *)&v119 + 1) + v120 * 2 * v55));
        unsigned int v59 = *(unsigned __int16 *)(v117 + 2 * (*((void *)&v119 + 1) + v120 * ((2 * v55) | 1)));
LABEL_33:
        if (v58 < v59)
        {
          unsigned int v60 = &a8[v58];
          unsigned int v61 = BYTE5(v24) * v57;
          LODWORD(v24) = HIBYTE(v25) * v57;
          do
          {
            *(double *)v62.i64 = sub_1B65D6198(BYTE4(v24), (const float *)(v114 + v61), v46, v47, v48, v49, v50, v51, v52, v53.f32[0], *(float *)&v54);
            float32x4_t v115 = v62;
            *(double *)v52.i64 = sub_1B65D6198(v25, (const float *)(v112 + v24), v63, v64, v65, v66, v67, v68, v62, v69, v70);
            unsigned long long v54 = *(_OWORD *)&v115 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
            v53.i64[0] = 0x3400000034000000;
            v53.i64[1] = 0x3400000034000000;
            v53.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v53, (float32x4_t)(*(_OWORD *)&v115 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
            if ((v53.i32[0] & 0x80000000) == 0
              || (v53.i64[0] = 0x3400000034000000,
                  v53.i64[1] = 0x3400000034000000,
                  float32x4_t v52 = (float32x4_t)vcgeq_f32(v53, vabsq_f32(v52)),
                  v52.i32[0] = vminvq_u32((uint32x4_t)v52),
                  (v52.i32[0] & 0x80000000) == 0))
            {
              unsigned int v71 = v58;
              if (v113) {
                unsigned int v71 = *v60;
              }
              if (v27)
              {
                *v27++ = v71;
              }
              else
              {
                uint64_t v27 = 0;
                if (v111)
                {
                  *(_WORD *)unint64_t v111 = v71;
                  v111 += 2;
                }
                else
                {
                  *v110++ = v71;
                  unint64_t v111 = 0;
                }
              }
              ++v56;
            }
            ++v57;
            ++v60;
            ++v58;
            v61 += BYTE5(v24);
            LODWORD(v24) = v24 + HIBYTE(v25);
          }
          while (v59 != v58);
        }
        goto LABEL_48;
      }
      if (BYTE11(v118) == 1)
      {
        unsigned int v58 = *(unsigned __int8 *)(v117 + *((void *)&v119 + 1) + v120 * 2 * v55);
        unsigned int v59 = *(unsigned __int8 *)(v117 + *((void *)&v119 + 1) + v120 * ((2 * v55) | 1));
        goto LABEL_33;
      }
      sub_1B63F2F54(16, @"Unreachable code: Invalid bytes per index (%d)", v46, v47, v48, v49, v50, v51, BYTE11(v118));
LABEL_48:
      uint64_t v55 = v109 + 1;
      if (v109 + 1 >= (unint64_t)DWORD2(v117)) {
        goto LABEL_90;
      }
    }
    unsigned int v58 = *(_DWORD *)(v117 + 4 * (*((void *)&v119 + 1) + v120 * 2 * v55));
    unsigned int v59 = *(_DWORD *)(v117 + 4 * (*((void *)&v119 + 1) + v120 * ((2 * v55) | 1)));
    goto LABEL_33;
  }
  int v56 = 0;
LABEL_90:
  uint64_t v98 = v107;
  if (v56 == v107->var2) {
    goto LABEL_92;
  }
LABEL_91:
  sub_1B63F2F54(17, @"Assertion '%s' failed. Buffer has not been completely written to", v46, v47, v48, v49, v50, v51, (uint64_t)"writtenIndexCount == runtimeTarget->vertexCount");
LABEL_92:
  unint64_t v99 = v106;
LABEL_109:
  v98->var4 = v99;
}

- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6
{
  unint64_t v9 = objc_msgSend_currentFrameHash(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  if (self->_currentFrameHash == v9) {
    return 0;
  }
  self->_currentFrameHash = v9;
  if (self->_morphKind == 1)
  {
    return MEMORY[0x1F4181798](self, sel_morphSparseWithComputeContext_positions_normals_, a3, a4);
  }
  else
  {
    return MEMORY[0x1F4181798](self, sel_morphIncrementallyWithComputeContext_positions_normals_, a3, a4);
  }
}

- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  unsigned int v65 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  float v62 = 0.0;
  int v11 = sub_1B6588C8C((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v64, &v63, &v65, &v62, v5, v6);
  if (!v11) {
    return 0;
  }
  int v15 = v11;
  int v16 = (void **)objc_msgSend_currentComputeEncoder(a3, v12, v13, v14);
  objc_msgSend_resetCache(*v16, v17, v18, v19);
  objc_msgSend_setBuffer_offset_atIndex_(*v16, v20, (uint64_t)a4, 0, 0);
  if (a5) {
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)a5, 0, 4);
  }
  if (v15 == 2)
  {
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)self->_baseBufferForComputeKernel, 0, 1);
    unsigned int vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
    v60[0] = 0.0;
    unsigned int var2 = vertexCountForComputeKernel;
    objc_msgSend_setBytes_length_atIndex_(*v16, v28, (uint64_t)v60, 12, 3);
    float v29 = *v16;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v69 = var2;
    int64x2_t v70 = vdupq_n_s64(1uLL);
    objc_msgSend_setStageInRegion_(v29, v30, (uint64_t)&v66, v31);
    originalToFirstDeindexedTableBuffer = self->_originalToFirstDeindexedTableBuffer;
    if (originalToFirstDeindexedTableBuffer) {
      objc_msgSend_setBuffer_offset_atIndex_(*v16, v32, (uint64_t)originalToFirstDeindexedTableBuffer, 0, 2);
    }
    uint64_t v34 = sub_1B653EFB8((uint64_t)self->_copyBaseBufferPipeline);
    objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v35, v34, var2);
    bzero(v64, 4 * v65);
  }
  if (self->_morphTargetCount)
  {
    uint64_t v36 = 0;
    unint64_t v37 = 0;
    int64x2_t v59 = vdupq_n_s64(1uLL);
    do
    {
      morphTargets = self->_morphTargets;
      uint64_t v39 = &morphTargets[v36];
      uint64_t var1 = morphTargets[v36].var1;
      float v41 = *(float *)&v63[4 * var1];
      float v42 = *((float *)v64 + var1);
      if (vabds_f32(v41, v42) > v62)
      {
        v60[0] = v41 - v42;
        v60[1] = (float)(v41 - v42) * v39->var0;
        unsigned int var2 = v39->var2;
        objc_msgSend_setBytes_length_atIndex_(*v16, v21, (uint64_t)v60, 12, 3);
        uint64_t v43 = *v16;
        uint64_t v66 = 0;
        uint64_t v67 = 0;
        uint64_t v68 = 0;
        uint64_t v69 = var2;
        int64x2_t v70 = v59;
        objc_msgSend_setStageInRegion_(v43, v44, (uint64_t)&v66, v45);
        unsigned int v46 = v39->var2;
        unsigned int v47 = self->_vertexCountForComputeKernel;
        objc_msgSend_setBuffer_offset_atIndex_(*v16, v48, (uint64_t)self->_morphTargetsVertexBuffer, v39->var3, 1);
        if (v46 == v47)
        {
          uint64_t v50 = self->_originalToFirstDeindexedTableBuffer;
          p_blendDensePipeline = (uint64_t *)&self->_blendDensePipeline;
          if (v50)
          {
            objc_msgSend_setBuffer_offset_atIndex_(*v16, v49, (uint64_t)v50, 0, 2);
            p_blendDensePipeline = (uint64_t *)&self->_blendDenseIndexedPipeline;
          }
        }
        else
        {
          objc_msgSend_setBuffer_offset_atIndex_(*v16, v49, (uint64_t)self->_morphTargetsSparseIndicesBuffer, morphTargets[v36].var4, 2);
          p_blendDensePipeline = (uint64_t *)&self->_blendSparsePipeline;
        }
        uint64_t v52 = sub_1B653EFB8(*p_blendDensePipeline);
        objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v53, v52, var2);
      }
      ++v37;
      ++v36;
    }
    while (v37 < self->_morphTargetCount);
  }
  deindexedToFirstDeindexedTableBuffer = self->_deindexedToFirstDeindexedTableBuffer;
  if (deindexedToFirstDeindexedTableBuffer)
  {
    unsigned int var2 = self->_finalMeshVertexCount;
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)deindexedToFirstDeindexedTableBuffer, 0, 2);
    objc_msgSend_setBytes_length_atIndex_(*v16, v55, (uint64_t)v60, 12, 3);
    uint64_t v56 = sub_1B653EFB8((uint64_t)self->_splatPipeline);
    objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v57, v56, self->_finalMeshVertexCount);
  }
  self->_lastMorpherIncrementalPassState = sub_1B6588D9C((uint64_t)self->_morpher, (uint64_t)v21, (uint64_t)deindexedToFirstDeindexedTableBuffer, v22, v23, v24, v25, v26);
  return 1;
}

- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  unsigned int v87 = 0;
  float v86 = 0;
  uint64_t v85 = 0;
  float v84 = 0.0;
  int v11 = sub_1B6588C8C((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v86, &v85, &v87, &v84, v5, v6);
  if (!v11) {
    return 0;
  }
  int v15 = v11;
  int v16 = (void **)objc_msgSend_currentComputeEncoder(a3, v12, v13, v14);
  uint64_t v20 = objc_msgSend_resetCache(*v16, v17, v18, v19);
  uint64_t v73 = (uint64_t)&v73;
  MEMORY[0x1F4188790](v20, v21);
  uint64_t v23 = (float *)((char *)&v73 - v22);
  MEMORY[0x1F4188790](v24, v25);
  uint64_t v27 = (MTLBuffer **)((char *)&v73 - ((v26 + 15) & 0xFFFFFFFF0));
  double v31 = MEMORY[0x1F4188790](v28, v29);
  uint64_t v33 = (uint64_t *)((char *)&v73 - v32);
  BOOL v79 = v15 == 2;
  float v34 = 1.0;
  if (v15 == 2)
  {
    float v34 = 0.0;
    if (v87) {
      bzero(v86, 4 * v87);
    }
  }
  objc_msgSend_setBuffer_offset_atIndex_(*v16, v30, (uint64_t)a4, 0, 0, v31);
  if (a5) {
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v35, (uint64_t)a5, 0, 1);
  }
  if (vabds_f32(1.0, v34) <= 0.00000011921)
  {
    unsigned int v42 = 0;
  }
  else
  {
    *uint64_t v23 = 1.0 - v34;
    *uint64_t v27 = self->_baseBufferForComputeKernel;
    *uint64_t v33 = 0;
    unsigned int v42 = 1;
  }
  unsigned int v44 = v87;
  if (v87 != self->_morphTargetCount)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Internal consistency error", v36, v37, v38, v39, v40, v41, (uint64_t)"weightCount == _morphTargetCount");
    unsigned int v44 = v87;
  }
  if (v44)
  {
    unint64_t v45 = 0;
    unsigned int v46 = v85;
    unsigned int v47 = v86;
    uint64_t v48 = 4 * v44;
    float v49 = v84;
    do
    {
      float v50 = *(float *)&v46[v45];
      float v51 = *(float *)&v47[v45];
      if (vabds_f32(v50, v51) > v49)
      {
        v23[v42] = v50 - v51;
        v27[v42] = self->_morphTargetsVertexBuffer;
        v33[v42++] = self->_morphTargets[v45 / 4].var3;
      }
      v45 += 4;
    }
    while (v48 != v45);
  }
  uint64_t v76 = v16;
  memset(v82, 0, sizeof(v82));
  unsigned int vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  memset(v89, 0, sizeof(v89));
  memset(&v88[2], 0, 32);
  uint64_t v52 = 136;
  if (v15 == 2) {
    uint64_t v52 = 128;
  }
  memset(v88, 0, 32);
  uint64_t v74 = self;
  uint64_t v78 = sub_1B653EFB8(*(uint64_t *)((char *)&self->super.isa + v52));
  unsigned int v77 = v42 + 7;
  if (v42 + 7 >= 8)
  {
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v75 = v77 >> 3;
    p_baseBufferForComputeKernel = &v74->_baseBufferForComputeKernel;
    do
    {
      uint64_t v63 = 0;
      uint64_t v64 = v27;
      do
      {
        if (v60 + v63 >= (unint64_t)v42)
        {
          uint64_t v66 = 0;
          float v65 = 0.0;
          uint64_t v67 = p_baseBufferForComputeKernel;
        }
        else
        {
          float v65 = v23[v63];
          uint64_t v66 = v33[v63];
          uint64_t v67 = v64;
        }
        uint64_t v68 = *v67;
        v82[v63] = v65;
        *((void *)v89 + v63) = v68;
        *((void *)v88 + v63++) = v66;
        ++v64;
      }
      while (v63 != 8);
      uint64_t v81 = v27;
      BOOL v80 = v77 > 0xF;
      uint64_t v69 = v76;
      objc_msgSend_setBuffers_offsets_withRange_(*v76, v53, (uint64_t)v89, (uint64_t)v88, 5, 8);
      objc_msgSend_setBytes_length_atIndex_(*v69, v70, (uint64_t)v82, 36, 3);
      objc_msgSend_dispatchOnVertices_vertexCount_(*v69, v71, v78, vertexCountForComputeKernel);
      if (v80 && v79)
      {
        uint64_t v78 = sub_1B653EFB8((uint64_t)v74->_incrementalAddPipeline);
        BOOL v79 = 0;
      }
      ++v61;
      v23 += 8;
      uint64_t v27 = v81 + 8;
      v33 += 8;
      v60 += 8;
    }
    while (v61 != v75);
  }
  uint64_t v72 = v74;
  v72->_lastMorpherIncrementalPassState = sub_1B6588D9C((uint64_t)v74->_morpher, (uint64_t)v53, v54, v55, v56, v57, v58, v59);
  return 1;
}

@end