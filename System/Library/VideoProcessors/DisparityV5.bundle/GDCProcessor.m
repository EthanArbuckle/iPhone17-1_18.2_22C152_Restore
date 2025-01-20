@interface GDCProcessor
- (GDCProcessor)initWithMetalContext:(id)a3;
- (int)GDCDistort:(id)a3 to:(id)a4 parameters:(id *)a5;
- (int)GDCDistort:(id)a3 to:(id)a4 parameters:(id *)a5 commandBuffer:(id)a6;
- (int)GDCDistortPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 parameters:(id *)a5;
- (int)GDCFrom:(id)a3 to:(id)a4 parameters:(id *)a5;
- (int)GDCFrom:(id)a3 to:(id)a4 parameters:(id *)a5 commandBuffer:(id)a6;
- (int)GDCFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 parameters:(id *)a5;
- (int)compileShadersWithLib:(id)a3;
- (int)initMetal;
- (int)setSamplers:(BOOL)a3;
- (void)dealloc;
@end

@implementation GDCProcessor

- (GDCProcessor)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_9;
  }
  v59.receiver = self;
  v59.super_class = (Class)GDCProcessor;
  v13 = [(GDCProcessor *)&v59 init];
  if (v13)
  {
    uint64_t v15 = objc_msgSend_device(v5, v6, v7, v8, v9, v10, v11, v12, v14);
    mtlDevice = v13->_mtlDevice;
    v13->_mtlDevice = (MTLDevice *)v15;

    uint64_t v25 = objc_msgSend_commandQueue(v5, v17, v18, v19, v20, v21, v22, v23, v24);
    mtlCommandQueue = v13->_mtlCommandQueue;
    v13->_mtlCommandQueue = (MTLCommandQueue *)v25;

    objc_storeStrong((id *)&v13->_metalContext, a3);
    v35 = objc_msgSend_library(v5, v27, v28, v29, v30, v31, v32, v33, v34);
    int v43 = objc_msgSend_compileShadersWithLib_(v13, v36, (uint64_t)v35, v37, v38, v39, v40, v41, v42);

    if (!v43 && !objc_msgSend_setSamplers_(v13, v44, 1, v45, v46, v47, v48, v49, v50))
    {
      objc_msgSend_prewarmInternalMetalShadersForFormatsList_(v13->_metalContext, v51, (uint64_t)&unk_270E29D78, v52, v53, v54, v55, v56, v57);
      goto LABEL_6;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

LABEL_9:
    FigSignalErrorAt();
    v13 = 0;
  }
LABEL_6:

  return v13;
}

- (void)dealloc
{
  mtlDevice = self->_mtlDevice;
  self->_mtlDevice = 0;

  mtlCommandQueue = self->_mtlCommandQueue;
  self->_mtlCommandQueue = 0;

  id v5 = self->_samplers[1];
  self->_samplers[1] = 0;

  v6 = self->_samplers[2];
  self->_samplers[2] = 0;

  uint64_t v7 = self->_pipelineStates[0];
  self->_pipelineStates[0] = 0;

  uint64_t v8 = self->_pipelineStates[1];
  self->_pipelineStates[1] = 0;

  v9.receiver = self;
  v9.super_class = (Class)GDCProcessor;
  [(GDCProcessor *)&v9 dealloc];
}

- (int)GDCFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 parameters:(id *)a5
{
  if (!a5) {
    goto LABEL_7;
  }
  if (CVPixelBufferIsPlanar(a3) && CVPixelBufferGetPlaneCount(a3) != 1) {
    return -12780;
  }
  uint64_t v13 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v9, (uint64_t)a3, 80, 17, 0, v10, v11, v12);
  if (v13)
  {
    uint64_t v18 = (void *)v13;
    uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v14, (uint64_t)a4, 80, 22, 0, v15, v16, v17);
    if (v19)
    {
      uint64_t v25 = (void *)v19;
      int v26 = objc_msgSend_GDCFrom_to_parameters_(self, v20, (uint64_t)v18, v19, (uint64_t)a5, v21, v22, v23, v24);
    }
    else
    {
      int v26 = FigSignalErrorAt();
    }

    return v26;
  }
  else
  {
LABEL_7:
    return FigSignalErrorAt();
  }
}

- (int)GDCFrom:(id)a3 to:(id)a4 parameters:(id *)a5
{
  mtlCommandQueue = self->_mtlCommandQueue;
  id v9 = a4;
  id v10 = a3;
  uint64_t v19 = objc_msgSend_commandBuffer(mtlCommandQueue, v11, v12, v13, v14, v15, v16, v17, v18);
  int v24 = objc_msgSend_GDCFrom_to_parameters_commandBuffer_(self, v20, (uint64_t)v10, (uint64_t)v9, (uint64_t)a5, (uint64_t)v19, v21, v22, v23);

  if (*MEMORY[0x263F00E10])
  {
    uint64_t v33 = objc_msgSend_commandQueue(v19, v25, v26, v27, v28, v29, v30, v31, v32);
    float v42 = objc_msgSend_commandBuffer(v33, v34, v35, v36, v37, v38, v39, v40, v41);

    objc_msgSend_setLabel_(v42, v43, @"KTRACE_MTLCMDBUF", v44, v45, v46, v47, v48, v49);
    objc_msgSend_addCompletedHandler_(v42, v50, (uint64_t)&unk_270E25620, v51, v52, v53, v54, v55, v56);
    objc_msgSend_commit(v42, v57, v58, v59, v60, v61, v62, v63, v64);
    objc_msgSend_addCompletedHandler_(v19, v65, (uint64_t)&unk_270E25640, v66, v67, v68, v69, v70, v71);
  }
  objc_msgSend_commit(v19, v25, v26, v27, v28, v29, v30, v31, v32);

  return v24;
}

- (int)GDCFrom:(id)a3 to:(id)a4 parameters:(id *)a5 commandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int8x16_t v160 = 0u;
  long long v161 = 0u;
  int8x16_t v158 = 0u;
  int8x16_t v159 = 0u;
  memset(v157, 0, sizeof(v157));
  int8x16_t v155 = 0u;
  int8x16_t v156 = 0u;
  uint64_t v13 = objc_opt_new();
  uint64_t v22 = v13;
  if (!v13) {
    goto LABEL_4;
  }
  float v23 = objc_msgSend_colorAttachments(v13, v14, v15, v16, v17, v18, v19, v20, v21, *(_OWORD *)&v155, *(_OWORD *)&v156, v157[0], v157[1], *(_OWORD *)&v158, *(_OWORD *)&v159, *(_OWORD *)&v160, v161);
  uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v23, v24, 0, v25, v26, v27, v28, v29, v30);
  objc_msgSend_setLoadAction_(v31, v32, 0, v33, v34, v35, v36, v37, v38);

  uint64_t v47 = objc_msgSend_colorAttachments(v22, v39, v40, v41, v42, v43, v44, v45, v46);
  uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0, v49, v50, v51, v52, v53, v54);
  objc_msgSend_setStoreAction_(v55, v56, 1, v57, v58, v59, v60, v61, v62);

  float v71 = objc_msgSend_colorAttachments(v22, v63, v64, v65, v66, v67, v68, v69, v70);
  v79 = objc_msgSend_objectAtIndexedSubscript_(v71, v72, 0, v73, v74, v75, v76, v77, v78);
  objc_msgSend_setTexture_(v79, v80, (uint64_t)v11, v81, v82, v83, v84, v85, v86);

  v94 = objc_msgSend_renderCommandEncoderWithDescriptor_(v12, v87, (uint64_t)v22, v88, v89, v90, v91, v92, v93);
  if (v94)
  {
    v102 = v94;
    objc_msgSend_setRenderPipelineState_(v94, v95, (uint64_t)self->_pipelineStates[0], v96, v97, v98, v99, v100, v101);
    v111 = objc_msgSend_fullRangeVertexBuf(self->_metalContext, v103, v104, v105, v106, v107, v108, v109, v110);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v102, v112, (uint64_t)v111, 0, 0, v113, v114, v115, v116);

    objc_msgSend_setFragmentSamplerState_atIndex_(v102, v117, (uint64_t)self->_samplers[2], 0, v118, v119, v120, v121, v122);
    v123.i32[0] = 0;
    v124.i64[0] = *(void *)a5->var1;
    uint64_t v125 = *(void *)&a5->var2;
    *(void *)&v157[0] = *(void *)&a5->var1[6];
    v126.i32[0] = LODWORD(a5->var7[0]);
    DWORD2(v157[0]) = LODWORD(a5->var6);
    int8x16_t v127 = *(int8x16_t *)&a5->var1[2];
    *(void *)((char *)v157 + 12) = v125;
    v128.i64[0] = *(void *)&a5->var4;
    v128.i64[1] = v124.i64[0];
    int8x16_t v155 = v128;
    int8x16_t v156 = v127;
    v126.i32[1] = LODWORD(a5->var7[3]);
    v126.i32[2] = LODWORD(a5->var7[6]);
    v124.i32[0] = LODWORD(a5->var7[1]);
    v127.i32[0] = LODWORD(a5->var7[2]);
    v124.i32[1] = LODWORD(a5->var7[4]);
    v124.i32[2] = LODWORD(a5->var7[7]);
    v127.i32[1] = LODWORD(a5->var7[5]);
    v127.i32[2] = LODWORD(a5->var7[8]);
    v128.i8[0] = a5->var9;
    int8x16_t v129 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v128, v123), 0);
    int8x16_t v158 = vbslq_s8(v129, v126, (int8x16_t)xmmword_262EEDE50);
    int8x16_t v159 = vbslq_s8(v129, v124, (int8x16_t)xmmword_262EEDE40);
    int8x16_t v160 = vbslq_s8(v129, v127, (int8x16_t)xmmword_262EEDE20);
    objc_msgSend_setFragmentBytes_length_atIndex_(v102, v130, (uint64_t)&v155, 128, 0, v131, v132, v133, *(float *)v158.i32);
    objc_msgSend_setFragmentTexture_atIndex_(v102, v134, (uint64_t)v10, 0, v135, v136, v137, v138, v139);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v102, v140, 4, 0, 4, v141, v142, v143, v144);
    objc_msgSend_endEncoding(v102, v145, v146, v147, v148, v149, v150, v151, v152);

    int v153 = 0;
  }
  else
  {
LABEL_4:
    int v153 = FigSignalErrorAt();
  }

  return v153;
}

- (int)GDCDistortPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 parameters:(id *)a5
{
  uint64_t v14 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, a2, (uint64_t)a3, 25, 17, 0, v5, v6, v7);
  if (v14
    && (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v11, (uint64_t)a4, 25, 22, 0, v12, v13, v15), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = (void *)v16;
    int v23 = objc_msgSend_GDCDistort_to_parameters_(self, v17, (uint64_t)v14, v16, (uint64_t)a5, v18, v19, v20, v21);
  }
  else
  {
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (int)GDCDistort:(id)a3 to:(id)a4 parameters:(id *)a5
{
  mtlCommandQueue = self->_mtlCommandQueue;
  id v9 = a4;
  id v10 = a3;
  uint64_t v19 = objc_msgSend_commandBuffer(mtlCommandQueue, v11, v12, v13, v14, v15, v16, v17, v18);
  int v24 = objc_msgSend_GDCDistort_to_parameters_commandBuffer_(self, v20, (uint64_t)v10, (uint64_t)v9, (uint64_t)a5, (uint64_t)v19, v21, v22, v23);

  if (*MEMORY[0x263F00E10])
  {
    uint64_t v33 = objc_msgSend_commandQueue(v19, v25, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v42 = objc_msgSend_commandBuffer(v33, v34, v35, v36, v37, v38, v39, v40, v41);

    objc_msgSend_setLabel_(v42, v43, @"KTRACE_MTLCMDBUF", v44, v45, v46, v47, v48, v49);
    objc_msgSend_addCompletedHandler_(v42, v50, (uint64_t)&unk_270E25660, v51, v52, v53, v54, v55, v56);
    objc_msgSend_commit(v42, v57, v58, v59, v60, v61, v62, v63, v64);
    objc_msgSend_addCompletedHandler_(v19, v65, (uint64_t)&unk_270E25680, v66, v67, v68, v69, v70, v71);
  }
  objc_msgSend_commit(v19, v25, v26, v27, v28, v29, v30, v31, v32);

  return v24;
}

- (int)GDCDistort:(id)a3 to:(id)a4 parameters:(id *)a5 commandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int8x16_t v159 = 0u;
  long long v160 = 0u;
  int8x16_t v157 = 0u;
  int8x16_t v158 = 0u;
  memset(v156, 0, sizeof(v156));
  int8x16_t v154 = 0u;
  int8x16_t v155 = 0u;
  uint64_t v13 = objc_opt_new();
  uint64_t v22 = v13;
  if (!v13) {
    goto LABEL_4;
  }
  float v23 = objc_msgSend_colorAttachments(v13, v14, v15, v16, v17, v18, v19, v20, v21, *(_OWORD *)&v154, *(_OWORD *)&v155, v156[0], v156[1], *(_OWORD *)&v157, *(_OWORD *)&v158, *(_OWORD *)&v159, v160);
  uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v23, v24, 0, v25, v26, v27, v28, v29, v30);
  objc_msgSend_setLoadAction_(v31, v32, 0, v33, v34, v35, v36, v37, v38);

  uint64_t v47 = objc_msgSend_colorAttachments(v22, v39, v40, v41, v42, v43, v44, v45, v46);
  uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0, v49, v50, v51, v52, v53, v54);
  objc_msgSend_setStoreAction_(v55, v56, 1, v57, v58, v59, v60, v61, v62);

  float v71 = objc_msgSend_colorAttachments(v22, v63, v64, v65, v66, v67, v68, v69, v70);
  v79 = objc_msgSend_objectAtIndexedSubscript_(v71, v72, 0, v73, v74, v75, v76, v77, v78);
  objc_msgSend_setTexture_(v79, v80, (uint64_t)v11, v81, v82, v83, v84, v85, v86);

  v94 = objc_msgSend_renderCommandEncoderWithDescriptor_(v12, v87, (uint64_t)v22, v88, v89, v90, v91, v92, v93);
  if (v94)
  {
    v102 = v94;
    objc_msgSend_setRenderPipelineState_(v94, v95, (uint64_t)self->_pipelineStates[1], v96, v97, v98, v99, v100, v101);
    v111 = objc_msgSend_fullRangeVertexBuf(self->_metalContext, v103, v104, v105, v106, v107, v108, v109, v110);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v102, v112, (uint64_t)v111, 0, 0, v113, v114, v115, v116);

    objc_msgSend_setFragmentSamplerState_atIndex_(v102, v117, (uint64_t)self->_samplers[2], 0, v118, v119, v120, v121, v122);
    v123.i32[0] = 0;
    v124.i64[0] = *(void *)a5->var0;
    int8x16_t v125 = *(int8x16_t *)&a5->var0[2];
    *(void *)&v156[0] = *(void *)&a5->var0[6];
    DWORD2(v156[0]) = LODWORD(a5->var6);
    v126.i64[0] = *(void *)&a5->var4;
    *(void *)((char *)v156 + 12) = *(void *)&a5->var2;
    v126.i64[1] = v124.i64[0];
    v124.i32[0] = LODWORD(a5->var8[0]);
    v127.i32[0] = LODWORD(a5->var8[1]);
    v124.i32[1] = LODWORD(a5->var8[3]);
    v124.i32[2] = LODWORD(a5->var8[6]);
    v127.i32[1] = LODWORD(a5->var8[4]);
    v127.i32[2] = LODWORD(a5->var8[7]);
    int8x16_t v154 = v126;
    int8x16_t v155 = v125;
    v125.i32[0] = LODWORD(a5->var8[2]);
    v125.i32[1] = LODWORD(a5->var8[5]);
    v125.i32[2] = LODWORD(a5->var8[8]);
    v126.i8[0] = a5->var9;
    int8x16_t v128 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v126, v123), 0);
    int8x16_t v157 = vbslq_s8(v128, v124, (int8x16_t)xmmword_262EEDE50);
    int8x16_t v158 = vbslq_s8(v128, v127, (int8x16_t)xmmword_262EEDE40);
    int8x16_t v159 = vbslq_s8(v128, v125, (int8x16_t)xmmword_262EEDE20);
    objc_msgSend_setFragmentBytes_length_atIndex_(v102, v129, (uint64_t)&v154, 128, 0, v130, v131, v132, *(float *)v157.i32);
    objc_msgSend_setFragmentTexture_atIndex_(v102, v133, (uint64_t)v10, 0, v134, v135, v136, v137, v138);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v102, v139, 4, 0, 4, v140, v141, v142, v143);
    objc_msgSend_endEncoding(v102, v144, v145, v146, v147, v148, v149, v150, v151);

    int v152 = 0;
  }
  else
  {
LABEL_4:
    int v152 = FigSignalErrorAt();
  }

  return v152;
}

- (int)compileShadersWithLib:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v14 = v5;
    if (v5)
    {
      uint64_t v15 = objc_msgSend_colorAttachments(v5, v6, v7, v8, v9, v10, v11, v12, v13);
      float v23 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0, v17, v18, v19, v20, v21, v22);
      objc_msgSend_setPixelFormat_(v23, v24, 80, v25, v26, v27, v28, v29, v30);

      float v38 = objc_msgSend_newFunctionWithName_(v4, v31, @"VertexGDC", v32, v33, v34, v35, v36, v37);
      objc_msgSend_setVertexFunction_(v14, v39, (uint64_t)v38, v40, v41, v42, v43, v44, v45);

      uint64_t v53 = objc_msgSend_newFunctionWithName_(v4, v46, @"FragmentGDC", v47, v48, v49, v50, v51, v52);
      objc_msgSend_setFragmentFunction_(v14, v54, (uint64_t)v53, v55, v56, v57, v58, v59, v60);

      uint64_t v69 = objc_msgSend_fullRangeVertexDesc(self->_metalContext, v61, v62, v63, v64, v65, v66, v67, v68);
      objc_msgSend_setVertexDescriptor_(v14, v70, (uint64_t)v69, v71, v72, v73, v74, v75, v76);

      uint64_t v85 = objc_msgSend_pipelineLibrary(self->_metalContext, v77, v78, v79, v80, v81, v82, v83, v84);
      objc_msgSend_setPipelineLibrary_(v14, v86, (uint64_t)v85, v87, v88, v89, v90, v91, v92);

      uint64_t v99 = (MTLRenderPipelineState *)objc_msgSend_newRenderPipelineStateWithDescriptor_error_(self->_mtlDevice, v93, (uint64_t)v14, 0, v94, v95, v96, v97, v98);
      uint64_t v100 = self->_pipelineStates[0];
      self->_pipelineStates[0] = v99;

      if (self->_pipelineStates[0])
      {
        float v101 = objc_opt_new();

        if (v101)
        {
          float v110 = objc_msgSend_colorAttachments(v101, v102, v103, v104, v105, v106, v107, v108, v109);
          uint64_t v118 = objc_msgSend_objectAtIndexedSubscript_(v110, v111, 0, v112, v113, v114, v115, v116, v117);
          objc_msgSend_setPixelFormat_(v118, v119, 25, v120, v121, v122, v123, v124, v125);

          uint64_t v133 = objc_msgSend_newFunctionWithName_(v4, v126, @"VertexGDC", v127, v128, v129, v130, v131, v132);
          objc_msgSend_setVertexFunction_(v101, v134, (uint64_t)v133, v135, v136, v137, v138, v139, v140);

          uint64_t v148 = objc_msgSend_newFunctionWithName_(v4, v141, @"FragmentGDC_DISTORT", v142, v143, v144, v145, v146, v147);
          objc_msgSend_setFragmentFunction_(v101, v149, (uint64_t)v148, v150, v151, v152, v153, v154, v155);

          v164 = objc_msgSend_fullRangeVertexDesc(self->_metalContext, v156, v157, v158, v159, v160, v161, v162, v163);
          objc_msgSend_setVertexDescriptor_(v101, v165, (uint64_t)v164, v166, v167, v168, v169, v170, v171);

          v180 = objc_msgSend_pipelineLibrary(self->_metalContext, v172, v173, v174, v175, v176, v177, v178, v179);
          objc_msgSend_setPipelineLibrary_(v101, v181, (uint64_t)v180, v182, v183, v184, v185, v186, v187);

          v194 = (MTLRenderPipelineState *)objc_msgSend_newRenderPipelineStateWithDescriptor_error_(self->_mtlDevice, v188, (uint64_t)v101, 0, v189, v190, v191, v192, v193);
          v195 = self->_pipelineStates[1];
          self->_pipelineStates[1] = v194;

          if (self->_pipelineStates[1])
          {
            int v196 = 0;
LABEL_11:

            goto LABEL_12;
          }
          uint64_t v14 = v101;
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
    }
    int v196 = FigSignalErrorAt();
    float v101 = v14;
    goto LABEL_11;
  }
  int v196 = FigSignalErrorAt();
LABEL_12:

  return v196;
}

- (int)setSamplers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_new();
  float v13 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  objc_msgSend_setMinFilter_(v5, v6, 1, v7, v8, v9, v10, v11, v12);
  objc_msgSend_setMagFilter_(v13, v14, 1, v15, v16, v17, v18, v19, v20);
  objc_msgSend_setSAddressMode_(v13, v21, 0, v22, v23, v24, v25, v26, v27);
  objc_msgSend_setTAddressMode_(v13, v28, 0, v29, v30, v31, v32, v33, v34);
  objc_msgSend_setNormalizedCoordinates_(v13, v35, v3, v36, v37, v38, v39, v40, v41);
  uint64_t v49 = (MTLSamplerState *)objc_msgSend_newSamplerStateWithDescriptor_(self->_mtlDevice, v42, (uint64_t)v13, v43, v44, v45, v46, v47, v48);
  uint64_t v50 = self->_samplers[1];
  self->_samplers[1] = v49;

  if (!self->_samplers[1]) {
    goto LABEL_10;
  }
  uint64_t v51 = objc_opt_new();

  if (!v51)
  {
    float v13 = 0;
LABEL_10:
    int v140 = FigSignalErrorAt();
    goto LABEL_11;
  }
  objc_msgSend_setMinFilter_(v51, v52, 0, v53, v54, v55, v56, v57, v58);
  objc_msgSend_setMagFilter_(v51, v59, 0, v60, v61, v62, v63, v64, v65);
  objc_msgSend_setSAddressMode_(v51, v66, 0, v67, v68, v69, v70, v71, v72);
  objc_msgSend_setTAddressMode_(v51, v73, 0, v74, v75, v76, v77, v78, v79);
  objc_msgSend_setNormalizedCoordinates_(v51, v80, v3, v81, v82, v83, v84, v85, v86);
  uint64_t v94 = (MTLSamplerState *)objc_msgSend_newSamplerStateWithDescriptor_(self->_mtlDevice, v87, (uint64_t)v51, v88, v89, v90, v91, v92, v93);
  uint64_t v95 = self->_samplers[0];
  self->_samplers[0] = v94;

  if (!self->_samplers[0])
  {
    float v13 = v51;
    goto LABEL_10;
  }
  float v13 = objc_opt_new();

  if (!v13) {
    goto LABEL_10;
  }
  objc_msgSend_setMinFilter_(v13, v96, 2, v97, v98, v99, v100, v101, v102);
  objc_msgSend_setMagFilter_(v13, v103, 2, v104, v105, v106, v107, v108, v109);
  objc_msgSend_setSAddressMode_(v13, v110, 0, v111, v112, v113, v114, v115, v116);
  objc_msgSend_setTAddressMode_(v13, v117, 0, v118, v119, v120, v121, v122, v123);
  objc_msgSend_setNormalizedCoordinates_(v13, v124, v3, v125, v126, v127, v128, v129, v130);
  uint64_t v138 = (MTLSamplerState *)objc_msgSend_newSamplerStateWithDescriptor_(self->_mtlDevice, v131, (uint64_t)v13, v132, v133, v134, v135, v136, v137);
  uint64_t v139 = self->_samplers[2];
  self->_samplers[2] = v138;

  if (!self->_samplers[2]) {
    goto LABEL_10;
  }
  int v140 = 0;
LABEL_11:

  return v140;
}

- (int)initMetal
{
  objc_msgSend_metalDevice(MEMORY[0x263F2EE30], a2, v2, v3, v4, v5, v6, v7, v8);
  uint64_t v10 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  mtlDevice = self->_mtlDevice;
  self->_mtlDevice = v10;

  float v20 = self->_mtlDevice;
  if (v20)
  {
    uint64_t v21 = (MTLCommandQueue *)objc_msgSend_newCommandQueue(v20, v12, v13, v14, v15, v16, v17, v18, v19);
    mtlCommandQueue = self->_mtlCommandQueue;
    self->_mtlCommandQueue = v21;

    if (self->_mtlCommandQueue) {
      return 0;
    }
  }

  return FigSignalErrorAt();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unDistortUniforms, 0);
  objc_storeStrong((id *)&self->_distortUniforms, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_pipelineStates[i + 1], 0);
  for (uint64_t j = 40; j != 16; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_mtlCommandQueue, 0);

  objc_storeStrong((id *)&self->_mtlDevice, 0);
}

@end