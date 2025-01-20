@interface Demosaic
- (Demosaic)initWithMetalContext:(id)a3;
- (float)gatNoiseStdInFullResolution;
- (float)tuningNoiseProcessingScale;
- (int)_compileShaders;
- (int)convertLinearRGB:(id)a3 toLuma:(id)a4;
- (int)demosaic2x:(id)a3 rawImagePixelFormat:(unsigned int)a4 toLuma:(id)a5 toRGBA:(id)a6;
- (int)downscaleRGBA:(id)a3 toRGBA:(id)a4 scalingFactor:(id)a5 commandBuffer:;
- (int)fillLSCGainsTextureFrom:(id *)a3;
- (int)preProcessMetadata:(id)a3 cameraInfoByPortType:(id)a4;
- (int)resampleLuma:(id)a3 toLuma:(id)a4 magnification:(float)a5 preShift:;
- (unsigned)outputImageHeight;
- (void)setGatNoiseStdInFullResolution:(float)a3;
- (void)setOutputImageHeight:(unsigned int)a3;
- (void)setTuningNoiseProcessingScale:(float)a3;
@end

@implementation Demosaic

- (Demosaic)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)Demosaic;
    v6 = [(Demosaic *)&v16 init];
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_metalContext, a3);
      if (objc_msgSend__compileShaders(self, v7, v8, v9, v10, v11, v12, v13, v14))
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        self = 0;
      }
      else
      {
        self->_outputImageHeight = 0;
        *(void *)&self->_gatNoiseStdInFullResolution = 0x3F80000000000000;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return self;
}

- (int)demosaic2x:(id)a3 rawImagePixelFormat:(unsigned int)a4 toLuma:(id)a5 toRGBA:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t rawSensorWidth = self->_metadataParameters.rawSensorWidth;
  float v218 = (float)(unint64_t)(rawSensorWidth - objc_msgSend_width(v10, v14, v15, v16, v17, v18, v19, v20, v21))
       * 0.5;
  uint64_t rawSensorHeight = self->_metadataParameters.rawSensorHeight;
  float v217 = (float)((float)(unint64_t)(rawSensorHeight
                                         - objc_msgSend_height(v10, v23, v24, v25, v26, v27, v28, v29, v218))
               * 0.5)
       + (float)self->_metadataParameters.outputOffsetY;
  uint64_t v37 = objc_msgSend_width(self->_lscGainsTex, v30, v31, v32, v33, v34, v35, v36, v217);
  unsigned int v216 = self->_metadataParameters.rawSensorWidth;
  uint64_t v45 = objc_msgSend_height(self->_lscGainsTex, v38, v39, v40, v41, v42, v43, v44, *(float *)&v216);
  v53.i64[0] = v37;
  v53.i64[1] = v45;
  __asm { FMOV            V1.2S, #-1.0 }
  v59.i32[0] = v216;
  v59.i32[1] = self->_metadataParameters.rawSensorHeight;
  float32x2_t v60 = vdiv_f32(vadd_f32(vcvt_f32_f64(vcvtq_f64_u64(v53)), _D1), vadd_f32(vcvt_f32_u32(v59), _D1));
  *(void *)self->_anon_88 = __PAIR64__(LODWORD(v217), LODWORD(v218));
  *(float32x2_t *)&self->_anon_88[8] = v60;
  if (a4 == 1919379252)
  {
    int v61 = 0;
    *(_DWORD *)&self->_anon_88[16] = 0;
  }
  else if (a4 == 1650943796)
  {
    int v61 = 0;
    *(_DWORD *)&self->_anon_88[16] = 1;
  }
  else
  {
    int v61 = FigSignalErrorAt();
  }
  v62 = objc_msgSend_commandQueue(self->_metalContext, v46, v47, v48, v49, v50, v51, v52, v60.f32[0]);
  v71 = objc_msgSend_commandBuffer(v62, v63, v64, v65, v66, v67, v68, v69, v70);

  if (v71)
  {
    int v219 = v61;
    v80 = objc_msgSend_computeCommandEncoder(v71, v72, v73, v74, v75, v76, v77, v78, v79);
    v81 = self->_pipelineStates[0];
    objc_msgSend_setComputePipelineState_(v80, v82, (uint64_t)v81, v83, v84, v85, v86, v87, v88);
    objc_msgSend_setTexture_atIndex_(v80, v89, (uint64_t)v10, 0, v90, v91, v92, v93, v94);
    objc_msgSend_setTexture_atIndex_(v80, v95, (uint64_t)self->_lscGainsTex, 1, v96, v97, v98, v99, v100);
    id v101 = v11;
    objc_msgSend_setTexture_atIndex_(v80, v102, (uint64_t)v11, 2, v103, v104, v105, v106, v107);
    objc_msgSend_setTexture_atIndex_(v80, v108, (uint64_t)v12, 3, v109, v110, v111, v112, v113);
    objc_msgSend_setBytes_length_atIndex_(v80, v114, (uint64_t)&self->_metadataParameters, 112, 0, v115, v116, v117, v118);
    unint64_t v127 = objc_msgSend_threadExecutionWidth(v81, v119, v120, v121, v122, v123, v124, v125, v126);
    unint64_t v136 = objc_msgSend_maxTotalThreadsPerThreadgroup(v81, v128, v129, v130, v131, v132, v133, v134, v135) / v127;
    v221[0] = objc_msgSend_width(v12, v137, v138, v139, v140, v141, v142, v143, v144);
    v221[1] = objc_msgSend_height(v12, v145, v146, v147, v148, v149, v150, v151, v152);
    v221[2] = 1;
    v220[0] = v127;
    v220[1] = v136;
    v220[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v80, v153, (uint64_t)v221, (uint64_t)v220, v154, v155, v156, v157, v158);
    objc_msgSend_endEncoding(v80, v159, v160, v161, v162, v163, v164, v165, v166);
    if (*MEMORY[0x263F00E10])
    {
      v175 = objc_msgSend_commandQueue(v71, v167, v168, v169, v170, v171, v172, v173, v174);
      v184 = objc_msgSend_commandBuffer(v175, v176, v177, v178, v179, v180, v181, v182, v183);

      objc_msgSend_setLabel_(v184, v185, @"KTRACE_MTLCMDBUF", v186, v187, v188, v189, v190, v191);
      objc_msgSend_addCompletedHandler_(v184, v192, (uint64_t)&unk_270E254A0, v193, v194, v195, v196, v197, v198);
      objc_msgSend_commit(v184, v199, v200, v201, v202, v203, v204, v205, v206);
      objc_msgSend_addCompletedHandler_(v71, v207, (uint64_t)&unk_270E254C0, v208, v209, v210, v211, v212, v213);
    }
    objc_msgSend_commit(v71, v167, v168, v169, v170, v171, v172, v173, v174);

    id v11 = v101;
    int v214 = v219;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v214 = FigSignalErrorAt();
  }

  return v214;
}

- (int)convertLinearRGB:(id)a3 toLuma:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = v7;
  if (v6
    && v7
    && (uint64_t v17 = objc_msgSend_width(v6, v8, v9, v10, v11, v12, v13, v14, v15),
        v17 == objc_msgSend_width(v16, v18, v19, v20, v21, v22, v23, v24, v25))
    && (uint64_t v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33),
        v34 == objc_msgSend_height(v16, v35, v36, v37, v38, v39, v40, v41, v42)))
  {
    uint64_t v51 = objc_msgSend_commandQueue(self->_metalContext, v43, v44, v45, v46, v47, v48, v49, v50);
    float32x2_t v60 = objc_msgSend_commandBuffer(v51, v52, v53, v54, v55, v56, v57, v58, v59);

    if (v60)
    {
      uint64_t v69 = objc_msgSend_computeCommandEncoder(v60, v61, v62, v63, v64, v65, v66, v67, v68);
      float v70 = self->_pipelineStates[1];
      objc_msgSend_setComputePipelineState_(v69, v71, (uint64_t)v70, v72, v73, v74, v75, v76, v77);
      objc_msgSend_setTexture_atIndex_(v69, v78, (uint64_t)v6, 0, v79, v80, v81, v82, v83);
      objc_msgSend_setTexture_atIndex_(v69, v84, (uint64_t)v16, 1, v85, v86, v87, v88, v89);
      objc_msgSend_setBytes_length_atIndex_(v69, v90, (uint64_t)&self->_metadataParameters, 112, 0, v91, v92, v93, v94);
      unint64_t v103 = objc_msgSend_threadExecutionWidth(v70, v95, v96, v97, v98, v99, v100, v101, v102);
      unint64_t v112 = objc_msgSend_maxTotalThreadsPerThreadgroup(v70, v104, v105, v106, v107, v108, v109, v110, v111) / v103;
      v154[0] = objc_msgSend_width(v16, v113, v114, v115, v116, v117, v118, v119, v120);
      v154[1] = objc_msgSend_height(v16, v121, v122, v123, v124, v125, v126, v127, v128);
      v154[2] = 1;
      v153[0] = v103;
      v153[1] = v112;
      v153[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v69, v129, (uint64_t)v154, (uint64_t)v153, v130, v131, v132, v133, v134);
      objc_msgSend_endEncoding(v69, v135, v136, v137, v138, v139, v140, v141, v142);
      objc_msgSend_commit(v60, v143, v144, v145, v146, v147, v148, v149, v150);

      int v151 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v151 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v151 = -12780;
  }

  return v151;
}

- (int)resampleLuma:(id)a3 toLuma:(id)a4 magnification:(float)a5 preShift:
{
  uint64_t v197 = v5;
  id v9 = a3;
  id v10 = a4;
  float v19 = (float)(unint64_t)objc_msgSend_width(v9, v11, v12, v13, v14, v15, v16, v17, v18);
  float v28 = (float)(unint64_t)objc_msgSend_height(v9, v20, v21, v22, v23, v24, v25, v26, v27);
  float v37 = (float)(unint64_t)objc_msgSend_width(v10, v29, v30, v31, v32, v33, v34, v35, v36);
  uint64_t v46 = objc_msgSend_height(v10, v38, v39, v40, v41, v42, v43, v44, v45);
  *(float *)&long long v47 = v19 / (float)(v37 * a5);
  float v48 = (float)(1.0 - (float)(1.0 / a5)) * 0.5;
  *((float *)&v47 + 1) = *(float *)&v197 + (float)(v48 * v19);
  *((float *)&v47 + 2) = v28 / (float)((float)(unint64_t)v46 * a5);
  *((float *)&v47 + 3) = *((float *)&v197 + 1) + (float)(v48 * v28);
  long long v200 = v47;
  uint64_t v56 = objc_msgSend_commandQueue(self->_metalContext, v49, v50, v51, v52, v53, v54, v55, *((float *)&v47 + 2));
  uint64_t v65 = objc_msgSend_commandBuffer(v56, v57, v58, v59, v60, v61, v62, v63, v64);

  if (v65)
  {
    uint64_t v74 = objc_msgSend_computeCommandEncoder(v65, v66, v67, v68, v69, v70, v71, v72, v73);
    uint64_t v75 = self->_pipelineStates[2];
    objc_msgSend_setComputePipelineState_(v74, v76, (uint64_t)v75, v77, v78, v79, v80, v81, v82);
    objc_msgSend_setTexture_atIndex_(v74, v83, (uint64_t)v9, 0, v84, v85, v86, v87, v88);
    objc_msgSend_setTexture_atIndex_(v74, v89, (uint64_t)v10, 1, v90, v91, v92, v93, v94);
    objc_msgSend_setBytes_length_atIndex_(v74, v95, (uint64_t)&v200, 16, 0, v96, v97, v98, v99);
    unint64_t v108 = objc_msgSend_threadExecutionWidth(v75, v100, v101, v102, v103, v104, v105, v106, v107);
    unint64_t v117 = objc_msgSend_maxTotalThreadsPerThreadgroup(v75, v109, v110, v111, v112, v113, v114, v115, v116) / v108;
    v199[0] = objc_msgSend_width(v10, v118, v119, v120, v121, v122, v123, v124, v125);
    v199[1] = objc_msgSend_height(v10, v126, v127, v128, v129, v130, v131, v132, v133);
    v199[2] = 1;
    v198[0] = v108;
    v198[1] = v117;
    v198[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v74, v134, (uint64_t)v199, (uint64_t)v198, v135, v136, v137, v138, v139);
    objc_msgSend_endEncoding(v74, v140, v141, v142, v143, v144, v145, v146, v147);
    if (*MEMORY[0x263F00E10])
    {
      uint64_t v156 = objc_msgSend_commandQueue(v65, v148, v149, v150, v151, v152, v153, v154, v155);
      uint64_t v165 = objc_msgSend_commandBuffer(v156, v157, v158, v159, v160, v161, v162, v163, v164);

      objc_msgSend_setLabel_(v165, v166, @"KTRACE_MTLCMDBUF", v167, v168, v169, v170, v171, v172);
      objc_msgSend_addCompletedHandler_(v165, v173, (uint64_t)&unk_270E254E0, v174, v175, v176, v177, v178, v179);
      objc_msgSend_commit(v165, v180, v181, v182, v183, v184, v185, v186, v187);
      objc_msgSend_addCompletedHandler_(v65, v188, (uint64_t)&unk_270E25500, v189, v190, v191, v192, v193, v194);
    }
    objc_msgSend_commit(v65, v148, v149, v150, v151, v152, v153, v154, v155);

    int v195 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v195 = FigSignalErrorAt();
  }

  return v195;
}

- (int)downscaleRGBA:(id)a3 toRGBA:(id)a4 scalingFactor:(id)a5 commandBuffer:
{
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v104 = vdiv_f32(_D1, v5);
  id v14 = a4;
  id v15 = a3;
  uint64_t v24 = objc_msgSend_computeCommandEncoder(a5, v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v25 = self->_pipelineStates[3];
  objc_msgSend_setComputePipelineState_(v24, v26, (uint64_t)v25, v27, v28, v29, v30, v31, v32);
  objc_msgSend_setTexture_atIndex_(v24, v33, (uint64_t)v15, 0, v34, v35, v36, v37, v38);

  objc_msgSend_setTexture_atIndex_(v24, v39, (uint64_t)v14, 1, v40, v41, v42, v43, v44);
  objc_msgSend_setBytes_length_atIndex_(v24, v45, (uint64_t)&v104, 8, 0, v46, v47, v48, v49);
  unint64_t v58 = objc_msgSend_threadExecutionWidth(v25, v50, v51, v52, v53, v54, v55, v56, v57);
  unint64_t v67 = objc_msgSend_maxTotalThreadsPerThreadgroup(v25, v59, v60, v61, v62, v63, v64, v65, v66);

  unint64_t v68 = v67 / v58;
  uint64_t v77 = objc_msgSend_width(v14, v69, v70, v71, v72, v73, v74, v75, v76);
  uint64_t v86 = objc_msgSend_height(v14, v78, v79, v80, v81, v82, v83, v84, v85);

  v103[0] = v77;
  v103[1] = v86;
  v103[2] = 1;
  v102[0] = v58;
  v102[1] = v68;
  v102[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v24, v87, (uint64_t)v103, (uint64_t)v102, v88, v89, v90, v91, v92);
  objc_msgSend_endEncoding(v24, v93, v94, v95, v96, v97, v98, v99, v100);

  return 0;
}

- (int)_compileShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, a2, @"demosaic2xKernel", 0, v2, v3, v4, v5, v6);
  uint64_t v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  id v9 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v8;

  if (self->_pipelineStates[0])
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v10, @"resampleKernel", 0, v11, v12, v13, v14, v15);
    uint64_t v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self->_pipelineStates[2];
    self->_pipelineStates[2] = v16;

    if (self->_pipelineStates[2])
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v18, @"downscaleKernel", 0, v19, v20, v21, v22, v23);
      uint64_t v24 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = self->_pipelineStates[3];
      self->_pipelineStates[3] = v24;

      if (self->_pipelineStates[3])
      {
        objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v26, @"rgbToLumaKernel", 0, v27, v28, v29, v30, v31);
        float v32 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = self->_pipelineStates[1];
        self->_pipelineStates[1] = v32;

        if (self->_pipelineStates[1]) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (int)preProcessMetadata:(id)a3 cameraInfoByPortType:(id)a4
{
  id v6 = a3;
  id v13 = a4;
  if (!self->_outputImageHeight) {
    goto LABEL_57;
  }
  float v15 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"SushiRawBlackLevel", v8, v9, v10, v11, v12, v14);
  if (!v15) {
    goto LABEL_57;
  }
  uint64_t v24 = v15;
  unsigned int v25 = objc_msgSend_intValue(v15, v16, v17, v18, v19, v20, v21, v22, v23);
  self->_metadataParameters.unsigned int sensorBlack = v25;
  self->_metadataParameters.unsigned int sensorWhite = 16232;
  float v26 = 16232.0 / (float)(16232.0 - (float)v25);
  self->_metadataParameters.sensorGainCeilingToFullRange = v26;
  uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v6, v27, @"AGC", v28, v29, v30, v31, v32, v26);

  if (!v33) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v33, v34, v35, v36, v37, v38, v39, v40, v41);
  float v43 = v42 * 0.0039062;
  self->_metadataParameters.float sensorAGC = v43;
  uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v6, v44, @"ReadNoise_1x", v45, v46, v47, v48, v49, v43);

  if (!v50) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v50, v51, v52, v53, v54, v55, v56, v57, v58);
  float v60 = v59 * 0.000015259;
  self->_metadataParameters.noiseE1x8x[0] = v60;
  objc_msgSend_objectForKeyedSubscript_(v6, v61, @"ReadNoise_8x", v62, v63, v64, v65, v66, v60);
  id v67 = (id)objc_claimAutoreleasedReturnValue();

  if (!v67) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v67, v68, v69, v70, v71, v72, v73, v74, v75);
  float v77 = v76 * 0.000015259;
  self->_metadataParameters.noiseE1x8x[1] = v77;
  v78.i32[0] = LODWORD(self->_metadataParameters.noiseE1x8x[0]);
  v78.f32[1] = v77;
  float32x2_t v79 = vmul_f32(v78, v78);
  float32x2_t v581 = vmla_lane_f32((float32x2_t)vdup_lane_s32((int32x2_t)v79, 0), (float32x2_t)0x3C8000003F800000, v79, 1);
  v582.columns[0] = (simd_float2)0x3F82000040000000;
  v582.columns[1] = (simd_float2)0x3F8008003F820000;
  simd_float2x2 v86 = __invert_f2(v582);
  float32x2_t v87 = vmla_lane_f32(vmul_n_f32((float32x2_t)v86.columns[0], v581.f32[0]), (float32x2_t)v86.columns[1], v581, 1);
  float32x2_t v88 = vrsqrte_f32(v87);
  float32x2_t v89 = vmul_f32(v88, vrsqrts_f32(v87, vmul_f32(v88, v88)));
  float32x2_t v90 = vmul_f32(v89, vrsqrts_f32(v87, vmul_f32(v89, v89)));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v96 = vdiv_f32(_D1, v90);
  float sensorAGC = self->_metadataParameters.sensorAGC;
  _D1.f32[1] = sensorAGC;
  float32x2_t v98 = vdiv_f32(v96, _D1);
  self->_metadataParameters.readnoiseStdE = sqrtf(vaddv_f32(vmul_f32(v98, v98)));
  if (sensorAGC < 1.0 || sensorAGC > 8.0) {
    goto LABEL_59;
  }
  uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v6, v80, @"sensorDGain", v81, v82, v83, v84, v85, sensorAGC);

  if (!v99) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v99, v100, v101, v102, v103, v104, v105, v106, v107);
  float v109 = (float)(v108 * 0.0039062) * self->_metadataParameters.sensorAGC;
  self->_metadataParameters.sensorGain = v109;
  float v116 = objc_msgSend_objectForKeyedSubscript_(v6, v110, @"ConversionGain", v111, v112, v113, v114, v115, v109);

  if (!v116) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v116, v117, v118, v119, v120, v121, v122, v123, v124);
  float v126 = v125;
  float v133 = objc_msgSend_objectForKeyedSubscript_(v6, v127, @"SensorBlackLevel", v128, v129, v130, v131, v132, v125);

  if (!v133) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v133, v134, v135, v136, v137, v138, v139, v140, 0.000015259);
  unsigned int sensorBlack = self->_metadataParameters.sensorBlack;
  unsigned int sensorWhite = self->_metadataParameters.sensorWhite;
  float v144 = (float)(sensorWhite - sensorBlack) / (float)(1023.0 - v143);
  self->_metadataParameters.scaleSashimi = v144;
  float v145 = 1.0 / (float)((float)(v126 * 0.000015259) * (float)(self->_metadataParameters.sensorGain * v144));
  float v146 = (float)(self->_metadataParameters.readnoiseStdE * self->_metadataParameters.readnoiseStdE) + 0.375;
  self->_metadataParameters.gatScale = v145;
  self->_metadataParameters.gatBias = v146;
  float v147 = sqrtf(v146 + (float)((float)((float)sensorWhite - (float)sensorBlack) * v145));
  float v148 = v147 + v147;
  float v149 = sqrtf(v146);
  self->_metadataParameters.gatBlackNormalized = (float)(v149 + v149) / v148;
  self->_metadataParameters.gatWhite = v148;
  float v150 = 1.0 / v148;
  self->_gatNoiseStdInFullResolution = v150;
  uint64_t v157 = objc_msgSend_objectForKeyedSubscript_(v6, v151, @"ispDGain", v152, v153, v154, v155, v156, v150);

  if (!v157) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v157, v158, v159, v160, v161, v162, v163, v164, v165);
  self->_metadataParameters.expIspGain = v166;
  uint64_t v173 = objc_msgSend_objectForKeyedSubscript_(v6, v167, @"ispDGainRangeExpansionFactor", v168, v169, v170, v171, v172, v166);

  if (!v173) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v173, v174, v175, v176, v177, v178, v179, v180, v181);
  float v183 = self->_metadataParameters.expIspGain / (float)(v182 * 256.0);
  self->_metadataParameters.expIspGain = v183;
  uint64_t v190 = objc_msgSend_objectForKeyedSubscript_(v6, v184, *MEMORY[0x263F2F638], v185, v186, v187, v188, v189, v183);
  if (objc_msgSend_BOOLValue(v190, v191, v192, v193, v194, v195, v196, v197, v198))
  {
  }
  else
  {
    float v213 = objc_msgSend_objectForKeyedSubscript_(v6, v199, *MEMORY[0x263F2F170], v200, v201, v202, v203, v204, v205);
    objc_msgSend_floatValue(v213, v214, v215, v216, v217, v218, v219, v220, v221);
    float v223 = v222;

    if (v223 >= 0.0) {
      goto LABEL_24;
    }
  }
  v224 = objc_msgSend_objectForKeyedSubscript_(v6, v206, @"EVZeroMetadata", v207, v208, v209, v210, v211, v212);
  v232 = v224;
  if (v224)
  {
    v233 = objc_msgSend_objectForKeyedSubscript_(v224, v225, @"ispDGain", v226, v227, v228, v229, v230, v231);
    objc_msgSend_floatValue(v233, v234, v235, v236, v237, v238, v239, v240, v241);
    float v243 = v242;
    v250 = objc_msgSend_objectForKeyedSubscript_(v232, v244, @"sensorDGain", v245, v246, v247, v248, v249, v242);
    objc_msgSend_floatValue(v250, v251, v252, v253, v254, v255, v256, v257, v258);
    float v260 = v243 * v259;
    v267 = objc_msgSend_objectForKeyedSubscript_(v232, v261, @"ExposureTime", v262, v263, v264, v265, v266, v259);
    objc_msgSend_floatValue(v267, v268, v269, v270, v271, v272, v273, v274, v275);
    float v277 = v260 * v276;
    v284 = objc_msgSend_objectForKeyedSubscript_(v232, v278, @"AGC", v279, v280, v281, v282, v283, v276);
    objc_msgSend_floatValue(v284, v285, v286, v287, v288, v289, v290, v291, v292);
    float v294 = v277 * v293;

    v302 = objc_msgSend_objectForKeyedSubscript_(v6, v295, @"ispDGain", v296, v297, v298, v299, v300, v301);
    objc_msgSend_floatValue(v302, v303, v304, v305, v306, v307, v308, v309, v310);
    float v312 = v311;
    v319 = objc_msgSend_objectForKeyedSubscript_(v6, v313, @"sensorDGain", v314, v315, v316, v317, v318, v311);
    objc_msgSend_floatValue(v319, v320, v321, v322, v323, v324, v325, v326, v327);
    float v329 = v328;
    v336 = objc_msgSend_objectForKeyedSubscript_(v6, v330, @"ExposureTime", v331, v332, v333, v334, v335, v328);
    objc_msgSend_floatValue(v336, v337, v338, v339, v340, v341, v342, v343, v344);
    float v346 = v345;
    v353 = objc_msgSend_objectForKeyedSubscript_(v6, v347, @"AGC", v348, v349, v350, v351, v352, v345);
    objc_msgSend_floatValue(v353, v354, v355, v356, v357, v358, v359, v360, v361);
    float v363 = v362;

    if (v294 > 0.0)
    {
      float v364 = (float)((float)(v312 * v329) * v346) * v363;
      if (v364 > 0.0)
      {
        float v365 = v294 / v364;
        float v366 = v365 * 0.81;
        BOOL v367 = v365 <= 4.0;
        float v368 = 3.24;
        if (v367) {
          float v368 = v366;
        }
        self->_metadataParameters.expIspGain = v368 * self->_metadataParameters.expIspGain;
      }
    }
  }

LABEL_24:
  v369 = objc_msgSend_objectForKeyedSubscript_(v6, v206, @"AWBComboRGain", v207, v208, v209, v210, v211, v212);

  if (!v369) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v369, v370, v371, v372, v373, v374, v375, v376, v377);
  float v379 = v378 * 0.00024414;
  self->_metadataParameters.expAwbRgb[0] = v379;
  v386 = objc_msgSend_objectForKeyedSubscript_(v6, v380, @"AWBComboGGain", v381, v382, v383, v384, v385, v379);

  if (!v386) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v386, v387, v388, v389, v390, v391, v392, v393, v394);
  float v396 = v395 * 0.00024414;
  self->_metadataParameters.expAwbRgb[1] = v396;
  v403 = objc_msgSend_objectForKeyedSubscript_(v6, v397, @"AWBComboBGain", v398, v399, v400, v401, v402, v396);

  if (!v403) {
    goto LABEL_57;
  }
  objc_msgSend_floatValue(v403, v404, v405, v406, v407, v408, v409, v410, v411);
  float v413 = v412 * 0.00024414;
  self->_metadataParameters.expAwbRgb[2] = v413;
  self->_metadataParameters.outputOffsetY = 0;
  v420 = objc_msgSend_objectForKeyedSubscript_(v6, v414, @"ValidBufferRectForProcessedRaw", v415, v416, v417, v418, v419, v413);
  v428 = objc_msgSend_objectForKeyedSubscript_(v420, v421, @"Height", v422, v423, v424, v425, v426, v427);

  if (!v428) {
    goto LABEL_57;
  }
  self->_metadataParameters.outputSizeY = objc_msgSend_intValue(v428, v429, v430, v431, v432, v433, v434, v435, v436);
  self->_metadataParameters.scaleRawTo16bits = 4;
  objc_msgSend_objectForKeyedSubscript_(v6, v437, @"RawSensorHeight", v438, v439, v440, v441, v442, v443);
  id v67 = (id)objc_claimAutoreleasedReturnValue();

  if (!v67) {
    goto LABEL_57;
  }
  int v458 = objc_msgSend_intValue(v67, v444, v445, v446, v447, v448, v449, v450, v451) - self->_outputImageHeight;
  if (v458 < 0)
  {
LABEL_59:
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_60;
  }
  v460 = objc_msgSend_objectForKeyedSubscript_(v6, v452, @"TotalSensorCropRectForProcessedRaw", v453, v454, v455, v456, v457, v459);
  v468 = objc_msgSend_objectForKeyedSubscript_(v460, v461, @"Y", v462, v463, v464, v465, v466, v467);

  if (!v468)
  {
LABEL_57:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_60:
    int v579 = -12780;
    goto LABEL_39;
  }
  int v477 = objc_msgSend_intValue(v468, v469, v470, v471, v472, v473, v474, v475, v476);
  self->_metadataParameters.outputOffsetY = (v477 - (v458 >> 1)) & ~((int)(v477 - (v458 >> 1)) >> 31);
  v485 = objc_msgSend_objectForKeyedSubscript_(v6, v478, @"PortType", v479, v480, v481, v482, v483, v484);
  v493 = objc_msgSend_objectForKeyedSubscript_(v13, v486, (uint64_t)v485, v487, v488, v489, v490, v491, v492);
  v501 = objc_msgSend_objectForKeyedSubscript_(v493, v494, @"LSCGains", v495, v496, v497, v498, v499, v500);

  if (!v501)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_60;
  }
  id v67 = v501;
  uint64_t v510 = objc_msgSend_bytes(v67, v502, v503, v504, v505, v506, v507, v508, v509);
  if (objc_msgSend_width(self->_lscGainsTex, v511, v512, v513, v514, v515, v516, v517, v518) != *(_DWORD *)(v510 + 20))
  {
    uint64_t v527 = objc_msgSend_height(self->_lscGainsTex, v519, v520, v521, v522, v523, v524, v525, v526);
    uint64_t v522 = *(unsigned int *)(v510 + 24);
    if (v527 != v522)
    {
      v528 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v519, 115, *(unsigned int *)(v510 + 20), v522, 0, v524, v525, v526);
      v537 = objc_msgSend_device(self->_metalContext, v529, v530, v531, v532, v533, v534, v535, v536);
      v545 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v537, v538, (uint64_t)v528, v539, v540, v541, v542, v543, v544);
      lscGainsTex = self->_lscGainsTex;
      self->_lscGainsTex = v545;

      if (!self->_lscGainsTex)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        int v579 = -12786;
        goto LABEL_39;
      }
    }
  }
  objc_msgSend_fillLSCGainsTextureFrom_(self, v519, v510, v521, v522, v523, v524, v525, v526);
  v554 = objc_msgSend_objectForKeyedSubscript_(v6, v547, @"RawSensorWidth", v548, v549, v550, v551, v552, v553);

  if (!v554) {
    goto LABEL_59;
  }
  self->_metadataParameters.uint64_t rawSensorWidth = objc_msgSend_intValue(v554, v555, v556, v557, v558, v559, v560, v561, v562);
  v570 = objc_msgSend_objectForKeyedSubscript_(v6, v563, @"RawSensorHeight", v564, v565, v566, v567, v568, v569);

  if (!v570) {
    goto LABEL_59;
  }
  self->_metadataParameters.uint64_t rawSensorHeight = objc_msgSend_intValue(v570, v571, v572, v573, v574, v575, v576, v577, v578);

  int v579 = 0;
LABEL_39:

  return v579;
}

- (int)fillLSCGainsTextureFrom:(id *)a3
{
  uint64_t var4 = a3->var1.var0.var4;
  uint64_t var5 = a3->var1.var0.var5;
  uint64_t var6 = a3->var1.var0.var6;
  uint64_t var7 = a3->var1.var0.var7;
  uint64_t var8 = a3->var1.var0.var8;
  uint64_t var9 = a3->var1.var0.var9;
  uint64_t v11 = (var5 * var4);
  uint64_t v12 = malloc_type_malloc(8 * v11, 0x1D87F678uLL);
  if (v12)
  {
    uint64_t v17 = v12;
    if (v11)
    {
      uint64_t v18 = 0;
      do
      {
        _S0 = *(unsigned int *)((char *)&a3->var1.var1.var10 + 4 * var6 + v18);
        __asm { FCVT            H0, S0 }
        *((_WORD *)v12 + v18) = _S0;
        _S0 = *(unsigned int *)((char *)&a3->var1.var1.var10 + 4 * var9 + v18);
        __asm { FCVT            H0, S0 }
        *((_WORD *)v12 + (v18 + 1)) = _S0;
        _S0 = *(unsigned int *)((char *)&a3->var1.var1.var10 + 4 * var7 + v18);
        __asm { FCVT            H0, S0 }
        *((_WORD *)v12 + (v18 + 2)) = _S0;
        _S0 = *(float *)((char *)&a3->var1.var1.var10 + 4 * var8 + v18);
        __asm { FCVT            H0, S0 }
        *((_WORD *)v12 + (v18 + 3)) = LOWORD(_S0);
        v18 += 4;
      }
      while (4 * v11 != v18);
    }
    lscGainsTex = self->_lscGainsTex;
    memset(v28, 0, 24);
    v28[3] = var4;
    v28[4] = var5;
    v28[5] = 1;
    objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(lscGainsTex, v13, (uint64_t)v28, 0, (uint64_t)v17, 8 * var4, v14, v15, _S0);
    free(v17);
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
}

- (unsigned)outputImageHeight
{
  return self->_outputImageHeight;
}

- (void)setOutputImageHeight:(unsigned int)a3
{
  self->_outputImageHeight = a3;
}

- (float)gatNoiseStdInFullResolution
{
  return self->_gatNoiseStdInFullResolution;
}

- (void)setGatNoiseStdInFullResolution:(float)a3
{
  self->_gatNoiseStdInFullResolution = a3;
}

- (float)tuningNoiseProcessingScale
{
  return self->_tuningNoiseProcessingScale;
}

- (void)setTuningNoiseProcessingScale:(float)a3
{
  self->_tuningNoiseProcessingScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  uint64_t v3 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end