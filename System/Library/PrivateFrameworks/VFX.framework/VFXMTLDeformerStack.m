@interface VFXMTLDeformerStack
- (MTLBlitCommandEncoder)currentBlitEncoder;
- (MTLStageInputOutputDescriptor)stageInputDescriptor;
- (VFXMTLComputeCommandEncoder)currentComputeEncoder;
- (__n128)_currentFrustumInfo;
- (__n128)currentTransforms;
- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__CFXMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8;
- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__CFXMeshSource *)a4 normalSource:(__CFXMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12;
- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (unint64_t)currentFrameHash;
- (void)dealloc;
- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4;
- (void)setStageInputOutputBuffersToEncoder:(VFXMTLComputeCommandEncoder *)a3;
- (void)setupFinalMeshWithMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5 usingDrawIndirect:(BOOL)a6;
- (void)setupInitialBuffersWithBaseMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5;
@end

@implementation VFXMTLDeformerStack

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLDeformerStack;
  [(VFXMTLDeformerStack *)&v3 dealloc];
}

- (void)setupInitialBuffersWithBaseMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5
{
  uint64_t v5 = *(void *)&a5.var0;
  initialPositionBuffer = self->_initialPositionBuffer;
  if (initialPositionBuffer)
  {
    CFRelease(initialPositionBuffer);
    self->_initialPositionBuffer = 0;
  }
  initialNormalBuffer = self->_initialNormalBuffer;
  if (initialNormalBuffer)
  {
    CFRelease(initialNormalBuffer);
    self->_initialNormalBuffer = 0;
  }
  initialTangentBuffer = self->_initialTangentBuffer;
  if (initialTangentBuffer)
  {
    CFRelease(initialTangentBuffer);
    self->_initialTangentBuffer = 0;
  }
  initialBuffersStageInputDescriptor = self->_initialBuffersStageInputDescriptor;
  if (initialBuffersStageInputDescriptor)
  {
    CFRelease(initialBuffersStageInputDescriptor);
    self->_initialBuffersStageInputDescriptor = 0;
  }
  self->_initialPositionStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialNormalStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialTangentStageInputOutputDescriptorInfo.isActive = 0;
  if ((v5 & 0x100010001) != 0)
  {
    self->_initialBuffersStageInputDescriptor = (MTLStageInputOutputDescriptor *)objc_alloc_init(MEMORY[0x1E4F35310]);
    v16 = sub_1B64AC5F8((uint64_t)a3, 0, 0, self->_deformDataKind, v12, v13, v14, v15);
    uint64_t v27 = sub_1B641D8A0((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    if (v5)
    {
      v28 = objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
      v31 = objc_msgSend_objectAtIndexedSubscript_(v28, v29, 0, v30);
      objc_msgSend_setFormat_(v31, v32, 30, v33);
      objc_msgSend_setOffset_(v31, v34, 0, v35);
      objc_msgSend_setBufferIndex_(v31, v36, 10, v37);
      v41 = objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v38, v39, v40);
      uint64_t v45 = objc_msgSend_bufferIndex(v31, v42, v43, v44);
      v48 = objc_msgSend_objectAtIndexedSubscript_(v41, v46, v45, v47);
      objc_msgSend_setStepFunction_(v48, v49, 5, v50);
      if ((v5 & 0x100) != 0)
      {
        uint64_t v186 = 0;
        self->_initialPositionBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v51, self->_deformDataKind, (uint64_t)v16, 8, 1, 1, &v186);
        objc_msgSend_setStride_(v48, v58, v186, v59);
      }
      else
      {
        uint64_t v52 = sub_1B64D80E0(30);
        self->_initialPositionBuffer = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v27 * v52), 32);
        objc_msgSend_setStride_(v48, v53, v52, v54);
      }
      unint64_t v60 = objc_msgSend_format(v31, v55, v56, v57);
      unint64_t v64 = objc_msgSend_offset(v31, v61, v62, v63);
      unint64_t v68 = objc_msgSend_stride(v48, v65, v66, v67);
      self->_initialPositionStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = v60;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v64;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v68;
      if ((v5 & 0x10000) == 0)
      {
LABEL_12:
        if ((v5 & 0x100000000) == 0) {
          return;
        }
        goto LABEL_26;
      }
    }
    else if ((v5 & 0x10000) == 0)
    {
      goto LABEL_12;
    }
    v69 = objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
    v72 = objc_msgSend_objectAtIndexedSubscript_(v69, v70, 1, v71);
    objc_msgSend_setFormat_(v72, v73, 30, v74);
    objc_msgSend_setOffset_(v72, v75, 0, v76);
    objc_msgSend_setBufferIndex_(v72, v77, 11, v78);
    v82 = objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v79, v80, v81);
    uint64_t v86 = objc_msgSend_bufferIndex(v72, v83, v84, v85);
    v89 = objc_msgSend_objectAtIndexedSubscript_(v82, v87, v86, v88);
    objc_msgSend_setStepFunction_(v89, v90, 5, v91);
    if ((v5 & 0x1000000) != 0)
    {
      v108 = sub_1B64AC5F8((uint64_t)a3, 1, 0, self->_deformDataKind, v92, v93, v94, v95);
      if (!v108)
      {
        v108 = (const void *)sub_1B63DE310((uint64_t)a3, self->_deformDataKind, 0, v103, v104, v105, v106, v107);
        if (!v108) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v109, v110, v111, v112, v113, v114, (uint64_t)"baseNormalSource");
        }
        CFAutorelease(v108);
      }
      uint64_t v186 = 0;
      self->_initialNormalBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v102, self->_deformDataKind, (uint64_t)v108, 8, 1, 1, &v186);
      objc_msgSend_setStride_(v89, v115, v186, v116);
    }
    else
    {
      uint64_t v96 = sub_1B64D80E0(30);
      self->_initialNormalBuffer = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v27 * v96), 32);
      objc_msgSend_setStride_(v89, v97, v96, v98);
    }
    unint64_t v117 = objc_msgSend_format(v72, v99, v100, v101);
    unint64_t v121 = objc_msgSend_offset(v72, v118, v119, v120);
    unint64_t v125 = objc_msgSend_stride(v89, v122, v123, v124);
    self->_initialNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = v117;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v121;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v125;
    if ((v5 & 0x100000000) != 0)
    {
LABEL_26:
      v126 = objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
      v129 = objc_msgSend_objectAtIndexedSubscript_(v126, v127, 2, v128);
      objc_msgSend_setFormat_(v129, v130, 31, v131);
      objc_msgSend_setOffset_(v129, v132, 0, v133);
      objc_msgSend_setBufferIndex_(v129, v134, 12, v135);
      v139 = objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v136, v137, v138);
      uint64_t v143 = objc_msgSend_bufferIndex(v129, v140, v141, v142);
      v146 = objc_msgSend_objectAtIndexedSubscript_(v139, v144, v143, v145);
      objc_msgSend_setStepFunction_(v146, v147, 5, v148);
      if ((v5 & 0x10000000000) != 0)
      {
        v161 = sub_1B64AC5F8((uint64_t)a3, 4, 0, self->_deformDataKind, v149, v150, v151, v152);
        if (!v161)
        {
          sub_1B63DEF50((uint64_t)a3, self->_deformDataKind, v160, 0, v162, v163, v164, v165);
          v161 = sub_1B64AC5F8((uint64_t)a3, 4, 0, self->_deformDataKind, v166, v167, v168, v169);
          if (!v161)
          {
            sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v170, 0, v171, v172, v173, v174, (uint64_t)"baseTangentSource");
            v161 = 0;
          }
        }
        uint64_t v186 = 0;
        self->_initialTangentBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v159, self->_deformDataKind, (uint64_t)v161, 9, 1, 1, &v186);
        objc_msgSend_setStride_(v146, v175, v186, v176);
      }
      else
      {
        uint64_t v153 = sub_1B64D80E0(31);
        self->_initialTangentBuffer = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v27 * v153), 32);
        objc_msgSend_setStride_(v146, v154, v153, v155);
      }
      unint64_t v177 = objc_msgSend_format(v129, v156, v157, v158);
      unint64_t v181 = objc_msgSend_offset(v129, v178, v179, v180);
      unint64_t v185 = objc_msgSend_stride(v146, v182, v183, v184);
      self->_initialTangentStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = v177;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v181;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v185;
    }
  }
}

- (void)setupFinalMeshWithMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5 usingDrawIndirect:(BOOL)a6
{
  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  int finalDataKind = self->_finalDataKind;
  BOOL v17 = self->_finalDataKind == 0;
  uint64_t v18 = objc_msgSend_vertexDescriptor(MEMORY[0x1E4F35358], a2, (uint64_t)a3, (uint64_t)a4, *(void *)&a5.var0, a6);
  uint64_t v19 = sub_1B64AD17C((uint64_t)a3);
  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = objc_msgSend_initWithCapacity_(v20, v21, v19, v22);
  uint64_t v238 = 0;
  v239 = &v238;
  uint64_t v240 = 0x2020000000;
  uint64_t v241 = 0;
  int v24 = self->_finalDataKind;
  v236[0] = MEMORY[0x1E4F143A8];
  v236[1] = 3221225472;
  v236[2] = sub_1B64A76BC;
  v236[3] = &unk_1E6142CD8;
  v236[7] = &v238;
  v236[8] = a3;
  v236[4] = self;
  v236[5] = v23;
  v231 = (void *)v18;
  v236[6] = v18;
  BOOL v237 = v17;
  sub_1B64AAFB4((uint64_t)a3, v24, (uint64_t)v236, v25, v26, v27, v28, v29);
  if (a5.var0)
  {
    unsigned int v37 = sub_1B64D80E0(30);
    v42 = sub_1B64AC5F8((uint64_t)a3, 0, 0, self->_deformDataKind, v38, v39, v40, v41);
    uint64_t v50 = sub_1B641D8A0((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49);
    if ((*(_WORD *)&a5.var0 & 0x100) != 0) {
      uint64_t v52 = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v51, self->_deformDataKind, (uint64_t)v42, 8, 0, 0, 0);
    }
    else {
      uint64_t v52 = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v50 * v37), 32);
    }
    self->_deformNormalBuffer = v52;
    uint64_t v57 = self->_finalDataKind;
    if (v57 == self->_deformDataKind)
    {
      v58 = v52;
    }
    else
    {
      uint64_t v62 = sub_1B64AC5F8((uint64_t)a3, 0, 0, v57, v53, v54, v55, v56);
      uint64_t v70 = sub_1B641D8A0((uint64_t)v62, v63, v64, v65, v66, v67, v68, v69);
      v58 = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v70 * v37), 32);
    }
    self->_finalNormalBuffer = v58;
    uint64_t v71 = objc_msgSend_count(v23, v59, v60, v61);
    objc_msgSend_addObject_(v23, v72, (uint64_t)self->_finalNormalBuffer, v73);
    v77 = objc_msgSend_attributes(v231, v74, v75, v76);
    uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(v77, v78, 1, v79);
    objc_msgSend_setFormat_(v80, v81, 30, v82);
    objc_msgSend_setOffset_(v80, v83, 0, v84);
    objc_msgSend_setBufferIndex_(v80, v85, v71 + 18, v86);
    v90 = objc_msgSend_layouts(v231, v87, v88, v89);
    uint64_t v94 = objc_msgSend_bufferIndex(v80, v91, v92, v93);
    v97 = objc_msgSend_objectAtIndexedSubscript_(v90, v95, v94, v96);
    objc_msgSend_setStride_(v97, v98, v37, v99);
    objc_msgSend_setStepFunction_(v97, v100, 1, v101);
    unint64_t v105 = objc_msgSend_offset(v80, v102, v103, v104);
    unint64_t v109 = objc_msgSend_stride(v97, v106, v107, v108);
    self->_deformNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v105;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v109;
  }
  if ((*(_DWORD *)&a5 & 0x10000) != 0)
  {
    unsigned int v110 = sub_1B64D80E0(31);
    v115 = sub_1B64AC5F8((uint64_t)a3, 0, 0, self->_deformDataKind, v111, v112, v113, v114);
    uint64_t v123 = sub_1B641D8A0((uint64_t)v115, v116, v117, v118, v119, v120, v121, v122);
    if ((*(_DWORD *)&a5 & 0x1000000) != 0) {
      unint64_t v125 = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v124, self->_deformDataKind, (uint64_t)v115, 9, 0, 0, 0);
    }
    else {
      unint64_t v125 = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v123 * v110), 32);
    }
    self->_deformTangentBuffer = v125;
    uint64_t v130 = self->_finalDataKind;
    if (v130 == self->_deformDataKind)
    {
      uint64_t v131 = v125;
    }
    else
    {
      uint64_t v135 = sub_1B64AC5F8((uint64_t)a3, 0, 0, v130, v126, v127, v128, v129);
      uint64_t v143 = sub_1B641D8A0((uint64_t)v135, v136, v137, v138, v139, v140, v141, v142);
      uint64_t v131 = (MTLBuffer *)sub_1B653D7E8((uint64_t)self->_resourceManager, (const char *)(v143 * v110), 32);
    }
    self->_finalTangentBuffer = v131;
    uint64_t v144 = objc_msgSend_count(v23, v132, v133, v134);
    objc_msgSend_addObject_(v23, v145, (uint64_t)self->_finalTangentBuffer, v146);
    uint64_t v150 = objc_msgSend_attributes(v231, v147, v148, v149);
    uint64_t v153 = objc_msgSend_objectAtIndexedSubscript_(v150, v151, 2, v152);
    objc_msgSend_setFormat_(v153, v154, 31, v155);
    objc_msgSend_setOffset_(v153, v156, 0, v157);
    objc_msgSend_setBufferIndex_(v153, v158, v144 + 18, v159);
    uint64_t v163 = objc_msgSend_layouts(v231, v160, v161, v162);
    uint64_t v167 = objc_msgSend_bufferIndex(v153, v164, v165, v166);
    uint64_t v170 = objc_msgSend_objectAtIndexedSubscript_(v163, v168, v167, v169);
    objc_msgSend_setStride_(v170, v171, v110, v172);
    objc_msgSend_setStepFunction_(v170, v173, 1, v174);
    unint64_t v178 = objc_msgSend_offset(v153, v175, v176, v177);
    unint64_t v182 = objc_msgSend_stride(v170, v179, v180, v181);
    self->_deformTangentStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = 31;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v178;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v182;
  }
  uint64_t v183 = (uint64_t)sub_1B64ABD08((uint64_t)a3, v30, v31, v32, v33, v34, v35, v36);
  id v184 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v192 = objc_msgSend_initWithCapacity_(v184, v185, v183, v186);
  if (v183 >= 1)
  {
    for (CFIndex i = 0; i != v183; ++i)
    {
      v194 = sub_1B64ABD78((uint64_t)a3, i, self->_finalDataKind, v187, v188, v189, v190, v191);
      unsigned int v202 = sub_1B63D0C08((uint64_t)v194, v195, v196, v197, v198, v199, v200, v201);
      if (sub_1B64D7C58(v202))
      {
        v204 = sub_1B653C040((uint64_t)self->_resourceManager, (uint64_t)v194);
        objc_msgSend_addObject_(v192, v205, (uint64_t)v204, v206);
      }
      else if (self->_finalDataKind | finalDataKind)
      {
        sub_1B63F2F54(17, @"Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", v203, v187, v188, v189, v190, v191, (uint64_t)"_finalDataKind == kCFXMeshDataKindOriginal && subdivIsUsed");
      }
    }
  }
  uint64_t v207 = self->_finalDataKind;
  if (self->_deformDataKind != v207)
  {
    v208 = sub_1B64AC5F8((uint64_t)a3, 0, 0, v207, v188, v189, v190, v191);
    self->_splatUniforms.maxIndex = sub_1B641D8A0((uint64_t)v208, v209, v210, v211, v212, v213, v214, v215);
    uint64_t v235 = 0;
    uint64_t v219 = objc_msgSend_currentBlitEncoder(self, v216, v217, v218);
    objc_msgSend_deindexedToOriginalTableBufferWithBlitEncoder_indexSizeOut_(self, v220, v219, (uint64_t)&v235);
    int v234 = v235;
    v221 = self->_deformTangentBuffer;
    BOOL v233 = self->_deformNormalBuffer != 0;
    BOOL v232 = v221 != 0;
    id v222 = objc_alloc_init(MEMORY[0x1E4F35228]);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v223, (uint64_t)&v234, 33, 0);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v224, (uint64_t)&v233, 53, 1);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v225, (uint64_t)&v232, 53, 2);
    uint64_t v228 = objc_msgSend_stringWithFormat_(NSString, v226, @"UInt%d-%d-%d", v227, (8 * v234), v233, v232);
    self->_splatDeformedToFinalPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(self->_resourceManager, v229, @"deformer_splat", (uint64_t)v222, v228);
  }
  v230 = objc_alloc_init(VFXMTLMesh);
  self->_finalMesh = v230;
  sub_1B659C270((uint64_t)v230, v231);
  sub_1B659C6E4(self->_finalMesh, (char *)v23);
  sub_1B659C704(self->_finalMesh, (char *)v192);
  sub_1B659C780((uint64_t)self->_finalMesh, v239[3]);

  _Block_object_dispose(&v238, 8);
}

- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  if (self->_deindexedToOriginalTableBuffer)
  {
    *a4 = self->_deindexedToOriginalTableBufferIndexSize;
  }
  else
  {
    sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    unsigned int v47 = 0;
    uint64_t v11 = sub_1B64AD1D4((uint64_t)self->_baseMesh, &v47);
    id result = (id)sub_1B644805C((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    BOOL v17 = sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 0, v13, v14, v15, v16);
    unsigned int v25 = sub_1B641D8A0((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v26 = v47;
    unsigned int v27 = v47 - 1;
    if ((int)(v47 - 1) < 0)
    {
      unint64_t v30 = 8;
    }
    else
    {
      unsigned int v28 = v27 >> 15;
      BOOL v29 = v27 > 0x7F;
      unint64_t v30 = 1;
      if (v29) {
        unint64_t v30 = 2;
      }
      if (v28) {
        unint64_t v30 = 4;
      }
    }
    self->_unint64_t deindexedToOriginalTableBufferIndexSize = v30;
    *a4 = v30;
    unint64_t v45 = self->_deindexedToOriginalTableBufferIndexSize * v26;
    uint64_t v31 = (char *)malloc_type_malloc(v45, 0xAB8D993uLL);
    uint64_t v38 = v31;
    unint64_t deindexedToOriginalTableBufferIndexSize = self->_deindexedToOriginalTableBufferIndexSize;
    if (deindexedToOriginalTableBufferIndexSize == 1) {
      uint64_t v40 = v31;
    }
    else {
      uint64_t v40 = 0;
    }
    if (deindexedToOriginalTableBufferIndexSize == 2) {
      uint64_t v41 = v31;
    }
    else {
      uint64_t v41 = 0;
    }
    if (deindexedToOriginalTableBufferIndexSize == 4) {
      v42 = v31;
    }
    else {
      v42 = 0;
    }
    uint64_t v46 = v42;
    if (v47)
    {
      for (unint64_t i = 0; i < v47; ++i)
      {
        unsigned int v44 = *(_DWORD *)(v11 + 4 * i);
        if (v44 >= v25) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. buffer overflow", v32, v33, v34, v35, v36, v37, (uint64_t)"orig < originalVertexCount");
        }
        if (v40)
        {
          v40[i] = v44;
        }
        else if (v41)
        {
          *(_WORD *)&v41[2 * i] = v44;
        }
        else
        {
          *(_DWORD *)&v46[4 * i] = v44;
        }
      }
    }
    self->_deindexedToOriginalTableBuffer = (MTLBuffer *)sub_1B653D738((uint64_t)self->_resourceManager, v38, v45, a3);
    free(v38);
  }
  return self->_deindexedToOriginalTableBuffer;
}

- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  if (self->_deindexedToFirstDeindexedTableBuffer)
  {
    *a4 = self->_deindexedToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    unsigned int v51 = 0;
    uint64_t v11 = sub_1B64AD1D4((uint64_t)self->_baseMesh, &v51);
    id result = (id)sub_1B644805C((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    BOOL v17 = (unsigned int *)result;
    id v49 = a3;
    uint64_t v18 = sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 0, v13, v14, v15, v16);
    unsigned int v26 = sub_1B641D8A0((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v27 = v51;
    unsigned int v28 = v51 - 1;
    if ((int)(v51 - 1) < 0)
    {
      unint64_t v31 = 8;
    }
    else
    {
      unsigned int v29 = v28 >> 15;
      BOOL v30 = v28 > 0x7F;
      unint64_t v31 = 1;
      if (v30) {
        unint64_t v31 = 2;
      }
      if (v29) {
        unint64_t v31 = 4;
      }
    }
    self->_unint64_t deindexedToFirstDeindexedTableBufferIndexSize = v31;
    *a4 = v31;
    unint64_t v48 = self->_deindexedToFirstDeindexedTableBufferIndexSize * v27;
    uint64_t v32 = (char *)malloc_type_malloc(v48, 0x66AA2CBCuLL);
    unint64_t deindexedToFirstDeindexedTableBufferIndexSize = self->_deindexedToFirstDeindexedTableBufferIndexSize;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 1) {
      uint64_t v40 = v32;
    }
    else {
      uint64_t v40 = 0;
    }
    if (deindexedToFirstDeindexedTableBufferIndexSize == 2) {
      uint64_t v41 = v32;
    }
    else {
      uint64_t v41 = 0;
    }
    unsigned int v47 = v32;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 4) {
      v42 = v32;
    }
    else {
      v42 = 0;
    }
    uint64_t v50 = v42;
    unsigned int v43 = v51;
    if (v51)
    {
      for (unint64_t i = 0; i < v51; ++i)
      {
        uint64_t v45 = *(unsigned int *)(v11 + 4 * i);
        uint64_t v46 = v17[v45];
        if (v45 >= v26)
        {
          sub_1B63F2F54(17, @"Assertion '%s' failed. buffer overflow", v33, v34, v35, v36, v37, v38, (uint64_t)"orig < originalVertexCount");
          unsigned int v43 = v51;
        }
        if (v46 >= v43) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. buffer overflow", v33, v34, v35, v36, v37, v38, (uint64_t)"prov < deindexedVertexCount");
        }
        if (i == v46)
        {
          if (v40)
          {
            v40[i] = -1;
          }
          else if (v41)
          {
            *(_WORD *)&v41[2 * i] = -1;
          }
          else
          {
            *(_DWORD *)&v50[4 * i] = -1;
          }
        }
        else if (v40)
        {
          v40[i] = v46;
        }
        else if (v41)
        {
          *(_WORD *)&v41[2 * i] = v46;
        }
        else
        {
          *(_DWORD *)&v50[4 * i] = v46;
        }
        unsigned int v43 = v51;
      }
    }
    self->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)sub_1B653D738((uint64_t)self->_resourceManager, v47, v48, v49);
    free(v47);
  }
  return self->_deindexedToFirstDeindexedTableBuffer;
}

- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  if (self->_originalToFirstDeindexedTableBuffer)
  {
    *a4 = self->_originalToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    id result = (id)sub_1B644805C((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    uint64_t v16 = (int *)result;
    BOOL v17 = sub_1B64AC5F8((uint64_t)self->_baseMesh, 0, 0, 0, v12, v13, v14, v15);
    unsigned int v25 = sub_1B641D8A0((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    unsigned int v26 = v25;
    uint64_t v27 = 1;
    if (v25 - 1 > 0xFF) {
      uint64_t v27 = 2;
    }
    unint64_t v28 = 4;
    if (!((v25 - 1) >> 16)) {
      unint64_t v28 = v27;
    }
    self->_unint64_t originalToFirstDeindexedTableBufferIndexSize = v28;
    *a4 = v28;
    uint64_t v29 = v25;
    unint64_t v30 = self->_originalToFirstDeindexedTableBufferIndexSize * v25;
    unint64_t v31 = (const char *)malloc_type_malloc(v30, 0x127B04FCuLL);
    uint64_t v32 = (char *)v31;
    unint64_t originalToFirstDeindexedTableBufferIndexSize = self->_originalToFirstDeindexedTableBufferIndexSize;
    if (originalToFirstDeindexedTableBufferIndexSize == 1) {
      uint64_t v34 = v31;
    }
    else {
      uint64_t v34 = 0;
    }
    if (originalToFirstDeindexedTableBufferIndexSize == 2) {
      uint64_t v35 = v31;
    }
    else {
      uint64_t v35 = 0;
    }
    if (originalToFirstDeindexedTableBufferIndexSize == 4) {
      uint64_t v36 = (char *)v31;
    }
    else {
      uint64_t v36 = 0;
    }
    if (v26)
    {
      uint64_t v37 = (char *)v35;
      uint64_t v38 = (char *)v34;
      do
      {
        int v40 = *v16++;
        int v39 = v40;
        if (v34)
        {
          char *v38 = v39;
        }
        else if (v35)
        {
          *(_WORD *)uint64_t v37 = v39;
        }
        else
        {
          *(_DWORD *)uint64_t v36 = v39;
        }
        ++v38;
        v37 += 2;
        v36 += 4;
        --v29;
      }
      while (v29);
    }
    self->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)sub_1B653D738((uint64_t)self->_resourceManager, v31, v30, a3);
    free(v32);
  }
  return self->_originalToFirstDeindexedTableBuffer;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__CFXMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8
{
  BOOL v8 = a6;
  int v9 = a5;
  uint64_t v12 = sub_1B641D8A0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8);
  unint64_t v20 = sub_1B63CA534(v9, v13, v14, v15, v16, v17, v18, v19);
  if (v8)
  {
    uint64_t v21 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
    if (sub_1B64D9854(v21, v22, v23, v24)) {
      unint64_t v20 = (v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
  }
  uint64_t v63 = (uint64_t *)self;
  uint64_t v25 = v20 * v12;
  unsigned int v26 = (char *)malloc_type_malloc(v20 * v12, 0xA622EBE9uLL);
  uint64_t v34 = sub_1B641D478((uint64_t)a4, v27, v28, v29, v30, v31, v32, v33);
  if (v12)
  {
    uint64_t v45 = v34;
    unsigned int v46 = 0;
    int v47 = BYTE4(v35);
    int v48 = BYTE5(v35);
    uint64_t v49 = (uint64_t)v26;
    do
    {
      *(double *)v50.i64 = sub_1B65D6198(v47, (const float *)(v45 + v46), v36, v37, v38, v39, v40, v41, v42, v43, v44);
      sub_1B65D6678(v9, v49, v51, v52, v53, v54, v55, v56, v50);
      v49 += v20;
      v46 += v48;
      --v12;
    }
    while (v12);
  }
  uint64_t v57 = v63[1];
  if (a7)
  {
    v58 = objc_msgSend_currentBlitEncoder(v63, v35, v36, v37);
    uint64_t v59 = sub_1B653D738(v57, v26, v25, v58);
  }
  else
  {
    uint64_t v59 = sub_1B653D6DC(v63[1], v26, v25, 0);
  }
  uint64_t v60 = (void *)v59;
  free(v26);
  if (a8) {
    *a8 = v20;
  }
  return v60;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__CFXMeshSource *)a4 normalSource:(__CFXMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12
{
  BOOL v12 = a8;
  int v103 = a7;
  int v105 = a6;
  if (a3 == 1
    && a5
    && (uint64_t v16 = sub_1B641D8A0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8),
        v16 != sub_1B641D8A0((uint64_t)a5, v17, v18, v19, v20, v21, v22, v23)))
  {
    sub_1B63F2F54(16, @"Unreachable code: Can't create an interleaved buffer for the renderable topology, possible vector count mismatch between semantics", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v97);
    return 0;
  }
  else
  {
    uint64_t v24 = sub_1B641D8A0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
    unint64_t v32 = sub_1B63CA534(v105, v25, v26, v27, v28, v29, v30, v31);
    uint64_t v40 = sub_1B63CA534(v103, v33, v34, v35, v36, v37, v38, v39);
    unint64_t v41 = v40 + v32;
    if (v12)
    {
      uint64_t v42 = v40;
      float v43 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
      int v47 = sub_1B64D9854(v43, v44, v45, v46);
      unint64_t v48 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v47)
      {
        unint64_t v32 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v41 = (v42 + v48 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    uint64_t v98 = v41 * v24;
    uint64_t v100 = (const char *)malloc_type_malloc(v41 * v24, 0xA38DB08EuLL);
    uint64_t v63 = sub_1B641D478((uint64_t)a4, v49, v50, v51, v52, v53, v54, v55);
    __int16 v67 = WORD2(v56);
    unint64_t v102 = v32;
    uint64_t v99 = (uint64_t *)self;
    unint64_t v104 = v41;
    if (a5)
    {
      uint64_t v68 = a5;
      uint64_t v101 = sub_1B641D478((uint64_t)a5, v56, v57, v58, v59, v60, v61, v62);
    }
    else
    {
      uint64_t v68 = 0;
      uint64_t v101 = 0;
      uint64_t v69 = 0;
    }
    if (v24)
    {
      unsigned int v70 = 0;
      unsigned int v71 = 0;
      int v72 = v67;
      int v73 = HIBYTE(v67);
      int v74 = BYTE4(v69);
      uint64_t v75 = (uint64_t)v100;
      int v76 = BYTE5(v69);
      do
      {
        *(double *)v77.i64 = sub_1B65D6198(v72, (const float *)(v63 + v70), v57, v58, v59, v60, v61, v62, v64, v65, v66);
        sub_1B65D6678(v105, v75, v78, v79, v80, v81, v82, v83, v77);
        if (v68)
        {
          *(double *)v84.i64 = sub_1B65D6198(v74, (const float *)(v101 + v71), v57, v58, v59, v60, v61, v62, v64, v65, v66);
          sub_1B65D6678(v103, v75 + v102, v85, v86, v87, v88, v89, v90, v84);
        }
        v75 += v104;
        v71 += v76;
        v70 += v73;
        --v24;
      }
      while (v24);
    }
    uint64_t v91 = v99[1];
    if (a9)
    {
      uint64_t v92 = objc_msgSend_currentBlitEncoder(v99, v69, v57, v58);
      uint64_t v93 = (char *)v100;
      uint64_t v94 = sub_1B653D738(v91, v100, v98, v92);
    }
    else
    {
      uint64_t v93 = (char *)v100;
      uint64_t v94 = sub_1B653D6DC(v99[1], v100, v98, 0);
    }
    uint64_t v95 = (void *)v94;
    free(v93);
    if (a10) {
      *a10 = v104;
    }
    if (a11) {
      *a11 = 0;
    }
    if (a12) {
      *a12 = v102;
    }
  }
  return v95;
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  id result = self->_currentInitResourceBlitEncoder;
  if (!result)
  {
    id result = *(MTLBlitCommandEncoder **)objc_msgSend_resourceBlitEncoder(self->_currentInitRenderContext, a2, v2, v3);
    self->_currentInitResourceBlitEncoder = result;
  }
  return result;
}

- (MTLStageInputOutputDescriptor)stageInputDescriptor
{
  return self->_initialBuffersStageInputDescriptor;
}

- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4
{
  int v8 = *(_DWORD *)&a4.var0;
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  if (self->_isValid && (!a4.var0 || self->_finalTangentBuffer)) {
    return;
  }
  self->_currentInitRenderContext = (VFXMTLRenderContext *)a3;
  uint64_t v10 = sub_1B65E1BBC((uint64_t)self->_deformers, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4.var0, v4, v5, v6, v7);
  uint64_t v18 = (__CFXMesh *)sub_1B63CCE68(v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v206 = sub_1B6583470((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
  if (!v206) {
    uint64_t v206 = sub_1B6583470(v10, v26, v27, v28, v29, v30, v31, v32);
  }
  baseMesh = self->_baseMesh;
  if (baseMesh != v18) {
    self->_baseMesh = v18;
  }
  int finalDataKind = self->_finalDataKind;
  uint64_t v34 = sub_1B65E1CD8((uint64_t)self->_deformers, v26, v27, v28, v29, v30, v31, v32);
  uint64_t v49 = sub_1B65E1E14((uint64_t)self->_deformers, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v199 = v10;
  if (v49)
  {
    sub_1B65E1BBC((uint64_t)self->_deformers, v42, v43, v44, v45, v46, v47, v48);
    BOOL v215 = !sub_1B6524E80(v49);
  }
  else
  {
    BOOL v215 = 0;
  }
  uint64_t v50 = (void *)sub_1B65E1F44((uint64_t)self->_deformers, v42, v43, v44, v45, v46, v47, v48);
  uint64_t v57 = objc_msgSend_count(v50, v51, v52, v53);
  BOOL v204 = v34 == 0;
  if (v34) {
    uint64_t v58 = objc_msgSend_requiredInputs(VFXMTLMorphDeformer, v54, v55, v56);
  }
  else {
    uint64_t v58 = 0;
  }
  uint64_t v213 = self;
  if (v215) {
    v58 |= objc_msgSend_requiredInputs(VFXMTLSkinDeformer, v54, v55, v56);
  }
  uint64_t v208 = v57;
  long long v238 = 0u;
  long long v237 = 0u;
  long long v236 = 0u;
  long long v235 = 0u;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v235, (uint64_t)v243, 16);
  if (v59)
  {
    uint64_t v67 = v59;
    uint64_t v68 = *(void *)v236;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v236 != v68) {
          objc_enumerationMutation(v50);
        }
        LODWORD(v58) = objc_msgSend_requiredInputs(*(void **)(*((void *)&v235 + 1) + 8 * i), v60, v61, v62) | v58;
      }
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v60, (uint64_t)&v235, (uint64_t)v243, 16);
    }
    while (v67);
  }
  BOOL v70 = finalDataKind != 0;
  BOOL v71 = sub_1B64AC77C((uint64_t)v18, 1, 0, 0, v63, v64, v65, v66);
  finalNormalBuffer = v213->_finalNormalBuffer;
  int v79 = v8 | sub_1B64AC77C((uint64_t)v18, 4, 0, 0, v72, v73, v74, v75);
  finalTangentBuffer = v213->_finalTangentBuffer;
  uint64_t v214 = (const void *)v34;
  if (v34)
  {
    unint64_t v80 = sub_1B6591F70((uint64_t)VFXMTLMorphDeformer, v34);
    char v81 = v80;
  }
  else
  {
    unint64_t v80 = 0;
    char v81 = -1;
  }
  unsigned int v82 = v71 | (v58 >> 1);
  unsigned int v83 = v79 | (v58 >> 2);
  if (v215)
  {
    uint64_t v84 = objc_msgSend_supportedOutputs(VFXMTLSkinDeformer, v76, v77, v78);
    v80 |= v84;
    v81 &= v84;
  }
  uint64_t v212 = v82 & v70;
  int v211 = v83 & v70;
  long long v234 = 0u;
  long long v233 = 0u;
  long long v232 = 0u;
  long long v231 = 0u;
  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v76, (uint64_t)&v231, (uint64_t)v242, 16);
  if (v85)
  {
    uint64_t v89 = v85;
    uint64_t v90 = *(void *)v232;
    uint64_t v91 = v213;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v232 != v90) {
          objc_enumerationMutation(v50);
        }
        uint64_t v93 = objc_msgSend_supportedOutputs(*(void **)(*((void *)&v231 + 1) + 8 * j), v86, v87, v88);
        v80 |= v93;
        v81 &= v93;
      }
      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v86, (uint64_t)&v231, (uint64_t)v242, 16);
    }
    while (v89);
  }
  else
  {
    uint64_t v91 = v213;
  }
  int v210 = v212 & ((v81 & 2) == 0);
  uint64_t v94 = 3;
  if (v210) {
    uint64_t v94 = 1;
  }
  if (!v212) {
    uint64_t v94 = 1;
  }
  if (v211) {
    uint64_t v95 = v94 | 4;
  }
  else {
    uint64_t v95 = v94;
  }
  if (v214)
  {
    unint64_t v96 = objc_msgSend_requiredOutputs(VFXMTLMorphDeformer, v86, v87, v88);
    v95 |= v96;
    uint64_t v97 = (v96 >> 3) & 1;
  }
  else
  {
    LODWORD(v97) = 0;
  }
  if (v215)
  {
    unint64_t v98 = objc_msgSend_requiredOutputs(VFXMTLSkinDeformer, v86, v87, v88);
    v95 |= v98;
    LODWORD(v97) = (v98 >> 3) & 1 | v97;
  }
  uint64_t v200 = (const void *)v49;
  long long v230 = 0u;
  long long v229 = 0u;
  long long v228 = 0u;
  long long v227 = 0u;
  uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v86, (uint64_t)&v227, (uint64_t)v241, 16);
  if (v99)
  {
    uint64_t v103 = v99;
    uint64_t v104 = *(void *)v228;
    do
    {
      for (uint64_t k = 0; k != v103; ++k)
      {
        if (*(void *)v228 != v104) {
          objc_enumerationMutation(v50);
        }
        unint64_t v106 = objc_msgSend_requiredOutputs(*(void **)(*((void *)&v227 + 1) + 8 * k), v100, v101, v102);
        v95 |= v106;
        LODWORD(v97) = (v106 >> 3) & 1 | v97;
      }
      uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v100, (uint64_t)&v227, (uint64_t)v241, 16);
    }
    while (v103);
  }
  uint64_t v209 = (uint64_t)v18;
  smoothNormalsDeformer = v91->_smoothNormalsDeformer;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  uint64_t v107 = (void *)sub_1B659C6F8((uint64_t)v91->_finalMesh);
  uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v108, (uint64_t)&v223, (uint64_t)v240, 16);
  if (v109)
  {
    uint64_t v110 = v109;
    int v111 = 0;
    uint64_t v112 = *(void *)v224;
    do
    {
      for (uint64_t m = 0; m != v110; ++m)
      {
        if (*(void *)v224 != v112) {
          objc_enumerationMutation(v107);
        }
        v111 |= v97 ^ (sub_1B659C6D8(*(void *)(*((void *)&v223 + 1) + 8 * m)) != 0);
      }
      uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v114, (uint64_t)&v223, (uint64_t)v240, 16);
    }
    while (v110);
  }
  else
  {
    LOBYTE(v111) = 0;
  }
  uint64_t v115 = 0;
  if (v208) {
    uint64_t v116 = 1;
  }
  else {
    uint64_t v116 = v215;
  }
  if (v212 == (v210 & 1))
  {
    int v117 = v204;
    LODWORD(v118) = v204;
    uint64_t v119 = v213;
  }
  else
  {
    int v117 = v204;
    LODWORD(v118) = v204;
    uint64_t v119 = v213;
    if ((v81 & 2) == 0)
    {
      uint64_t v118 = (v80 >> 1) & 1;
      if (!v214) {
        LODWORD(v118) = 1;
      }
      uint64_t v115 = ((v80 & 2) << 7) ^ 0x100;
    }
  }
  int v120 = v211;
  if ((v81 & 4) != 0) {
    int v120 = 0;
  }
  if (v120 == 1)
  {
    uint64_t v121 = v214;
    if (v214) {
      int v117 = (v80 >> 2) & 1;
    }
    else {
      int v117 = 1;
    }
    uint64_t v122 = ((v80 & 4) << 22) ^ 0x1000000;
  }
  else
  {
    uint64_t v122 = 0;
    uint64_t v121 = v214;
  }
  BOOL v123 = finalTangentBuffer != 0;
  BOOL v124 = v121 == 0;
  unsigned int v125 = (finalNormalBuffer != 0) ^ v212;
  if (baseMesh == (__CFXMesh *)v209) {
    char v126 = (finalNormalBuffer != 0) ^ v212;
  }
  else {
    char v126 = 1;
  }
  int v127 = v123 ^ v211;
  unsigned __int8 v128 = v126 | v123 ^ v211;
  int v129 = v116 ^ (v119->_initialBuffersStageInputDescriptor != 0);
  int v130 = v124 ^ (v119->_morphDeformer == 0);
  if ((v128 & 1) != 0 || (v129 & 1) != 0 || v130)
  {
    uint64_t v131 = 0x10000000000;
    if (!v117) {
      uint64_t v131 = 0;
    }
    uint64_t v132 = 0x100000000;
    if ((v211 & v116) == 0) {
      uint64_t v132 = 0;
    }
    BOOL v133 = v118 == 0;
    uint64_t v134 = 0x1000000;
    if (v133) {
      uint64_t v134 = 0;
    }
    uint64_t v135 = 0x10000;
    if ((v212 & v116) == 0) {
      uint64_t v135 = 0;
    }
    int v205 = v127;
    int v136 = v116 ^ (v119->_initialBuffersStageInputDescriptor != 0);
    int v137 = v124 ^ (v119->_morphDeformer == 0);
    uint64_t v138 = v115;
    uint64_t v139 = v122;
    objc_msgSend_setupInitialBuffersWithBaseMesh_entityName_info_(v119, (const char *)v122, v209, v206, v116 | ((unint64_t)(v214 == 0) << 8) | v135 | v132 | v134 | v131);
    uint64_t v122 = v139;
    uint64_t v115 = v138;
    int v130 = v137;
    int v129 = v136;
    unsigned int v125 = (finalNormalBuffer != 0) ^ v212;
    int v127 = v205;
  }
  if ((v128 | v111))
  {
    uint64_t v140 = 0x10000;
    if (!v211) {
      uint64_t v140 = 0;
    }
    objc_msgSend_setupFinalMeshWithMesh_entityName_info_usingDrawIndirect_(v119, (const char *)v122, v209, v206, v140 | v212 | v115 | v122, v97 & 1);
  }
  if ((const void *)sub_1B653EFB8((uint64_t)v119->_morphDeformer) == v214) {
    int v141 = v125;
  }
  else {
    int v141 = 1;
  }
  int v142 = v210 ^ (smoothNormalsDeformer != 0);
  if ((v141 | v127) & 1) != 0 || (v142)
  {
    uint64_t v144 = (uint64_t)v213;
    morphDeformer = v213->_morphDeformer;
    uint64_t v145 = v208;
    if (morphDeformer)
    {
      CFRelease(morphDeformer);
      v213->_morphDeformer = 0;
    }
    uint64_t v146 = v200;
    if (v214) {
      v213->_morphDeformer = (VFXMTLMorphDeformer *)sub_1B6591FC8([VFXMTLMorphDeformer alloc], v214, v95, v213->_deformDataKind, (uint64_t)v213->_resourceManager, (uint64_t)v213);
    }
  }
  else
  {
    int v143 = v129 | v130;
    uint64_t v144 = (uint64_t)v213;
    uint64_t v145 = v208;
    uint64_t v146 = v200;
    if (v143 == 1) {
      sub_1B6592134((uint64_t)v213->_morphDeformer);
    }
  }
  if ((const void *)sub_1B653EFB8(*(void *)(v144 + 744)) == v146) {
    int v148 = v125;
  }
  else {
    int v148 = 1;
  }
  if ((v148 | v127 | v142))
  {
    uint64_t v149 = *(const void **)(v144 + 744);
    if (v149)
    {
      CFRelease(v149);
      *(void *)(v144 + 744) = 0;
    }
    if (v215) {
      *(void *)(v144 + 744) = sub_1B65D6DD0([VFXMTLSkinDeformer alloc], v146, v199, v95, *(unsigned char *)(v144 + 41), *(void *)(v144 + 8), v144);
    }
  }
  if ((v210 & 1) == 0)
  {

    uint64_t v150 = 0;
    goto LABEL_125;
  }
  if (baseMesh != (__CFXMesh *)v209)
  {

    uint64_t v150 = sub_1B64AA09C([VFXMTLSmoothNormalsDeformer alloc], v209, *(unsigned __int8 *)(v144 + 40), *(void **)(v144 + 8), (void *)v144);
LABEL_125:
    *(void *)(v144 + 752) = v150;
  }
  uint64_t v151 = (void *)(v144 + 400);

  *(void *)(v144 + 760) = 0;
  long long v152 = *(_OWORD *)(v144 + 248);
  __src[0] = *(_OWORD *)(v144 + 232);
  __src[1] = v152;
  __src[2] = __src[0];
  __src[3] = v152;
  long long v153 = *(_OWORD *)(v144 + 280);
  __src[4] = *(_OWORD *)(v144 + 264);
  __src[5] = v153;
  __src[6] = __src[4];
  __src[7] = v153;
  long long v154 = *(_OWORD *)(v144 + 312);
  __src[8] = *(_OWORD *)(v144 + 296);
  __src[9] = v154;
  __src[10] = __src[8];
  __src[11] = v154;
  memset(&__src[12], 0, 192);
  if (v145)
  {
    v216 = sub_1B6583674(*(id **)(v144 + 24));
    uint64_t v159 = sub_1B64AC5F8(v209, 0, 0, *(unsigned __int8 *)(v144 + 41), v155, v156, v157, v158);
    uint64_t v167 = sub_1B641D8A0((uint64_t)v159, v160, v161, v162, v163, v164, v165, v166);
    id v168 = objc_alloc(MEMORY[0x1E4F28E10]);
    uint64_t v170 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v168, v169, 258, 0, v145);
    if (objc_msgSend_count(v50, v171, v172, v173))
    {
      id v174 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v178 = objc_msgSend_count(v50, v175, v176, v177);
      *(void *)(v144 + 760) = objc_msgSend_initWithCapacity_(v174, v179, v178, v180);
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v181, (uint64_t)&v218, (uint64_t)v239, 16);
      if (v182)
      {
        uint64_t v185 = v182;
        uint64_t v186 = *(void *)v219;
        do
        {
          for (uint64_t n = 0; n != v185; ++n)
          {
            if (*(void *)v219 != v186) {
              objc_enumerationMutation(v50);
            }
            uint64_t v188 = *(void **)(*((void *)&v218 + 1) + 8 * n);
            uint64_t v189 = objc_msgSend_objectForKey_(*(void **)(v144 + 768), v183, (uint64_t)v188, v184);
            if (v189)
            {
              uint64_t v192 = v189;
              objc_msgSend_addObject_(*(void **)(v144 + 760), v190, v189, v191);
              objc_msgSend_setObject_forKey_(v170, v193, v192, (uint64_t)v188);
            }
            else
            {
              v194 = [VFXModelDeformerInstanceWrapper alloc];
              memcpy(__dst, __src, sizeof(__dst));
              uint64_t v195 = sub_1B64A8CE8(v194, v144, v188, (uint64_t)v216, v95, v167, __dst);
              objc_msgSend_addObject_(*(void **)(v144 + 760), v196, (uint64_t)v195, v197);
              objc_msgSend_setObject_forKey_(v170, v198, (uint64_t)v195, (uint64_t)v188);
            }
          }
          uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v183, (uint64_t)&v218, (uint64_t)v239, 16);
        }
        while (v185);
      }
    }

    *(void *)(v144 + 768) = v170;
    uint64_t v151 = (void *)(v144 + 400);
  }
  else
  {

    *(void *)(v144 + 768) = 0;
  }
  *(unsigned char *)(v144 + 42) = 1;
  *uint64_t v151 = 0;
  v151[1] = 0;
}

- (unint64_t)currentFrameHash
{
  currentUpdateRenderContext = self->_currentUpdateRenderContext;
  uint64_t v5 = objc_msgSend_engineContext(currentUpdateRenderContext, a2, v2, v3);
  double v6 = sub_1B6447718(v5);
  uint64_t v10 = objc_msgSend_currentFrameIndex(currentUpdateRenderContext, v7, v8, v9);
  unint64_t v11 = 0x9DDFEA08EB382D69
      * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)));
  unint64_t v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * *(void *)&v6) ^ ((0xC6A4A7935BD1E995 * *(void *)&v6) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))));
  return (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
}

- (__n128)currentTransforms
{
  long long v2 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v2;
  long long v3 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v3;
  long long v4 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v4;
  long long v5 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v5;
  long long v6 = *(_OWORD *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)(a2 + 16) = v6;
  __n128 result = *(__n128 *)(a1 + 448);
  long long v8 = *(_OWORD *)(a1 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

- (__n128)_currentFrustumInfo
{
  long long v2 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 704);
  long long v3 = *(_OWORD *)(a1 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 608);
  *(_OWORD *)(a2 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (VFXMTLComputeCommandEncoder)currentComputeEncoder
{
  __n128 result = self->_currentUpdateComputeCommandEncoder;
  if (!result)
  {
    long long v6 = (VFXMTLComputeCommandEncoder *)objc_msgSend_resourceComputeEncoder(self->_currentUpdateRenderContext, a2, v2, v3);
    self->_currentUpdateComputeCommandEncoder = v6;
    objc_msgSend_pushDebugGroup_(v6->_encoder, v7, @"VFX: Deformers", v8);
    return self->_currentUpdateComputeCommandEncoder;
  }
  return result;
}

- (void)setStageInputOutputBuffersToEncoder:(VFXMTLComputeCommandEncoder *)a3
{
  objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_initialPositionBuffer, 0, 10);
  objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, v5, (uint64_t)self->_initialNormalBuffer, 0, 11);
  initialTangentBuffer = self->_initialTangentBuffer;
  encoder = a3->_encoder;

  objc_msgSend_setBuffer_offset_atIndex_(encoder, v6, (uint64_t)initialTangentBuffer, 0, 12);
}

@end