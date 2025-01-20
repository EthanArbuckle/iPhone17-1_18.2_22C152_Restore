@interface UniHighlightRecovery
+ (BOOL)runHighlightRecoveryWithInputTexture:(id)a3 outputTexture:(id)a4 temporaryTexture:(id)a5 dynamicParams:(id)a6 iterations:(int)a7 tileSize:(int)a8 scanKernel:(id)a9 diffuseKernel:(id)a10 copyBackKernel:(id)a11 copyKernel:(id)a12 commandBuffer:(id)a13 constants:(id)a14 forCoreImage:(BOOL)a15;
+ (id)generateCIImage:(id)a3;
+ (id)processList:(id)a3 tileSize:(int)a4;
- (MTLComputePipelineState)hlrCopyBackKernel;
- (MTLComputePipelineState)hlrCopyKernel;
- (MTLComputePipelineState)hlrDiffuseKernel;
- (MTLComputePipelineState)hlrScanKernel;
- (NSDictionary)hlrConstants;
- (UniHighlightRecovery)init;
- (UniHighlightRecovery)initWithDevice:(id)a3;
- (UniHighlightRecovery)initWithDevice:(id)a3 library:(id)a4 constants:(id)a5;
- (id)_identifyGPU:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
- (int)hlrTileSize;
- (void)setHlrConstants:(id)a3;
- (void)setHlrCopyBackKernel:(id)a3;
- (void)setHlrCopyKernel:(id)a3;
- (void)setHlrDiffuseKernel:(id)a3;
- (void)setHlrScanKernel:(id)a3;
- (void)setHlrTileSize:(int)a3;
@end

@implementation UniHighlightRecovery

- (UniHighlightRecovery)init
{
  v3.receiver = self;
  v3.super_class = (Class)UniHighlightRecovery;
  return [(UniKernel *)&v3 init];
}

- (UniHighlightRecovery)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniHighlightRecovery;
  v5 = [(UniKernel *)&v9 init];
  v7 = v5;
  if (v5) {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  }

  return v7;
}

- (UniHighlightRecovery)initWithDevice:(id)a3 library:(id)a4 constants:(id)a5
{
  v49[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v12 = (UniHighlightRecovery *)objc_msgSend_initWithDevice_(self, v10, (uint64_t)a3);
  if (v12)
  {
    v13 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"SparseRenderer::kXhlrbTileSize");
    uint64_t v16 = objc_msgSend_intValue(v13, v14, v15);
    objc_msgSend_setHlrTileSize_(v12, v17, v16);

    v48 = @"SparseRenderer::kXhlrbTileSize";
    v19 = objc_msgSend_objectForKeyedSubscript_(v9, v18, @"SparseRenderer::kXhlrbTileSize");
    v49[0] = v19;
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)v49, &v48, 1);

    v23 = objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v22, @"sparserendering_xhlrb_scan", v8, v9);
    v26 = objc_msgSend_mk(v23, v24, v25);
    objc_msgSend_setHlrScanKernel_(v12, v27, (uint64_t)v26);

    v29 = objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v28, @"sparserendering_xhlrb_diffuse", v8, v9);
    v32 = objc_msgSend_mk(v29, v30, v31);
    objc_msgSend_setHlrDiffuseKernel_(v12, v33, (uint64_t)v32);

    v35 = objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v34, @"sparserendering_xhlrb_copy_back", v8, v21);
    v38 = objc_msgSend_mk(v35, v36, v37);
    objc_msgSend_setHlrCopyBackKernel_(v12, v39, (uint64_t)v38);

    v41 = objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v40, @"plain_or_sRGB_copy", v8, 0);
    v44 = objc_msgSend_mk(v41, v42, v43);
    objc_msgSend_setHlrCopyKernel_(v12, v45, (uint64_t)v44);

    objc_msgSend_setHlrConstants_(v12, v46, (uint64_t)v9);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)UniHighlightRecovery;
  id v6 = [(UniKernel *)&v30 copyWithZone:a3];
  if (v6)
  {
    v7 = objc_msgSend_hlrScanKernel(self, v4, v5);
    objc_msgSend_setHlrScanKernel_(v6, v8, (uint64_t)v7);

    v11 = objc_msgSend_hlrDiffuseKernel(self, v9, v10);
    objc_msgSend_setHlrDiffuseKernel_(v6, v12, (uint64_t)v11);

    uint64_t v15 = objc_msgSend_hlrCopyKernel(self, v13, v14);
    objc_msgSend_setHlrCopyKernel_(v6, v16, (uint64_t)v15);

    v19 = objc_msgSend_hlrCopyBackKernel(self, v17, v18);
    objc_msgSend_setHlrCopyBackKernel_(v6, v20, (uint64_t)v19);

    uint64_t v23 = objc_msgSend_hlrTileSize(self, v21, v22);
    objc_msgSend_setHlrTileSize_(v6, v24, v23);
    v27 = objc_msgSend_hlrConstants(self, v25, v26);
    objc_msgSend_setHlrConstants_(v6, v28, (uint64_t)v27);
  }
  return v6;
}

+ (id)processList:(id)a3 tileSize:(int)a4
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_width(v5, v6, v7);
  size_t v11 = 2 * (v8 + a4 - 1) / (unint64_t)a4 * ((objc_msgSend_height(v5, v9, v10) + a4 - 1) / (unint64_t)a4)
      + 4;
  uint64_t v12 = 4 * v11;
  v13 = malloc_type_calloc(v11, 4uLL, 0x100004052888210uLL);
  uint64_t v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v14, (uint64_t)v13, v12);
  free(v13);
  uint64_t v18 = objc_msgSend_device(v5, v16, v17);

  v20 = objc_msgSend_bufferFromData_device_(UniDeviceCache, v19, (uint64_t)v15, v18);

  objc_msgSend_setLabel_(v20, v21, @"XHLRB ProcList");

  return v20;
}

- (id)inputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F00968];
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)outputNameArray
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F009D0];
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

+ (BOOL)runHighlightRecoveryWithInputTexture:(id)a3 outputTexture:(id)a4 temporaryTexture:(id)a5 dynamicParams:(id)a6 iterations:(int)a7 tileSize:(int)a8 scanKernel:(id)a9 diffuseKernel:(id)a10 copyBackKernel:(id)a11 copyKernel:(id)a12 commandBuffer:(id)a13 constants:(id)a14 forCoreImage:(BOOL)a15
{
  id v178 = a3;
  id v19 = a4;
  id v20 = a5;
  id v181 = a6;
  id v183 = a9;
  id v184 = a10;
  id v21 = a11;
  id v22 = a12;
  id v182 = a13;
  id v23 = a14;
  id v24 = v178;
  id v25 = v19;
  id v26 = v24;
  id v27 = v25;
  objc_super v30 = objc_msgSend_device(v26, v28, v29);
  int v180 = objc_msgSend_supportsNonUniformThreadgroupSize(v30, v31, v32);

  id v35 = v26;
  if (a15)
  {
    v36 = objc_msgSend_blitCommandEncoder(v182, v33, v34);
    objc_msgSend_setLabel_(v182, v37, @"XHLRBComputeBlit");
    if (!v20) {
      sub_262E4D298();
    }
    unint64_t v40 = objc_msgSend_width(v26, v38, v39);
    if (v40 > objc_msgSend_width(v20, v41, v42)) {
      sub_262E4D2C4();
    }
    unint64_t v45 = objc_msgSend_height(v26, v43, v44);
    if (v45 > objc_msgSend_height(v20, v46, v47)) {
      sub_262E4D2F0();
    }
    uint64_t v50 = objc_msgSend_pixelFormat(v26, v48, v49);
    if (v50 != objc_msgSend_pixelFormat(v20, v51, v52)) {
      sub_262E4D3A0();
    }
    memset(v210, 0, 24);
    v209[0] = objc_msgSend_width(v26, v53, v54);
    v209[1] = objc_msgSend_height(v26, v55, v56);
    v209[2] = 1;
    memset(v208, 0, sizeof(v208));
    objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v36, v57, (uint64_t)v26, 0, 0, v210, v209, v20, 0, 0, v208);
    objc_msgSend_endEncoding(v36, v58, v59);
    id v60 = v20;

    id v35 = v60;
  }
  id v177 = v20;
  uint64_t v207 = 0;
  long long v206 = 0u;
  long long v205 = 0u;
  long long v204 = 0u;
  v61 = objc_msgSend_device(v35, v33, v34);
  objc_msgSend_pixelFormat(v35, v62, v63);
  MTLPixelFormatGetInfoForDevice();

  char v203 = 0;
  uint64_t v202 = 0;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  v66 = objc_msgSend_device(v27, v64, v65);
  objc_msgSend_pixelFormat(v27, v67, v68);
  MTLPixelFormatGetInfoForDevice();

  v173 = v23;
  v179 = v22;
  char v198 = 0;
  v70 = objc_msgSend_processList_tileSize_(UniHighlightRecovery, v69, (uint64_t)v26, a8);
  float v73 = (float)(unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(v183, v71, v72);
  float v76 = (float)(unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(v184, v74, v75);
  v172 = v21;
  uint64_t v79 = objc_msgSend_maxTotalThreadsPerThreadgroup(v21, v77, v78);
  float v80 = log2f(fminf(v73, fminf(v76, (float)(unint64_t)v79)));
  unsigned int v83 = exp2f(floorf(v80)) / a8;
  if (v83 >= a8 >> 1) {
    unint64_t v84 = a8 >> 1;
  }
  else {
    unint64_t v84 = v83;
  }
  uint64_t v85 = objc_msgSend_width(v26, v81, v82);
  id v176 = v26;
  uint64_t v88 = objc_msgSend_height(v26, v86, v87);
  memset(v197, 0, sizeof(v197));
  if (objc_msgSend_length(v181, v89, v90) != 22) {
    sub_262E4D31C();
  }
  unint64_t v92 = a8;
  uint64_t v93 = a8 - 1;
  unint64_t v94 = (v93 + v88) / (unint64_t)a8;
  unint64_t v95 = (v93 + v85) / (unint64_t)a8;
  objc_msgSend_getBytes_length_(v181, v91, (uint64_t)v197, 22);
  v98 = objc_msgSend_blitCommandEncoder(v182, v96, v97);
  objc_msgSend_setLabel_(v98, v99, @"SR XHLRB Init");
  uint64_t v102 = objc_msgSend_length(v70, v100, v101);
  objc_msgSend_fillBuffer_range_value_(v98, v103, (uint64_t)v70, 0, v102, 0);
  v175 = v98;
  objc_msgSend_endEncoding(v98, v104, v105);
  v108 = objc_msgSend_computeCommandEncoder(v182, v106, v107);
  objc_msgSend_setLabel_(v108, v109, @"SS XHLRB Compute");
  objc_msgSend_setComputePipelineState_(v108, v110, (uint64_t)v183);
  objc_msgSend_setBytes_length_atIndex_(v108, v111, (uint64_t)v197, 22, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v108, v112, (uint64_t)v70, 0, 1);
  objc_msgSend_setTexture_atIndex_(v108, v113, (uint64_t)v35, 0);
  unint64_t v194 = v95;
  unint64_t v195 = v94;
  uint64_t v196 = 1;
  v193[0] = v84;
  v193[1] = v92;
  v193[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v114, (uint64_t)&v194, v193);
  LOBYTE(v193[0]) = 0;
  objc_msgSend_setBytes_length_atIndex_(v108, v115, (uint64_t)v193, 1, 30);
  if (a7 >= 1)
  {
    do
    {
      objc_msgSend_setComputePipelineState_(v108, v116, (uint64_t)v184);
      objc_msgSend_setBytes_length_atIndex_(v108, v118, (uint64_t)v197, 22, 0);
      objc_msgSend_setBuffer_offset_atIndex_(v108, v119, (uint64_t)v70, 0, 1);
      objc_msgSend_setTexture_atIndex_(v108, v120, (uint64_t)v35, 0);
      objc_msgSend_setTexture_atIndex_(v108, v121, (uint64_t)v27, 1);
      unint64_t v194 = v84;
      unint64_t v195 = v92;
      uint64_t v196 = 1;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v108, v122, (uint64_t)v70, 0, &v194);
      objc_msgSend_setComputePipelineState_(v108, v123, (uint64_t)v172);
      objc_msgSend_setBuffer_offset_atIndex_(v108, v124, (uint64_t)v70, 0, 0);
      objc_msgSend_setTexture_atIndex_(v108, v125, (uint64_t)v27, 0);
      objc_msgSend_setTexture_atIndex_(v108, v126, (uint64_t)v35, 1);
      unint64_t v194 = v84;
      unint64_t v195 = v92;
      uint64_t v196 = 1;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v108, v127, (uint64_t)v70, 0, &v194);
      --a7;
    }
    while (a7);
  }
  v128 = v179;
  unint64_t v129 = objc_msgSend_threadExecutionWidth(v179, v116, v117);
  unint64_t v132 = objc_msgSend_maxTotalThreadsPerThreadgroup(v179, v130, v131) / v129;
  objc_msgSend_setComputePipelineState_(v108, v133, (uint64_t)v179);
  objc_msgSend_setTexture_atIndex_(v108, v134, (uint64_t)v35, 0);
  objc_msgSend_setTexture_atIndex_(v108, v135, (uint64_t)v27, 1);
  objc_msgSend_setBytes_length_atIndex_(v108, v136, (uint64_t)&v198, 1, 0);
  if (v180)
  {
    v192[0] = objc_msgSend_width(v35, v137, v138);
    v192[1] = objc_msgSend_height(v35, v139, v140);
    v192[2] = 1;
    v191[0] = v129;
    v191[1] = v132;
    v191[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v108, v141, (uint64_t)v192, v191);
  }
  else
  {
    unint64_t v144 = objc_msgSend_threadExecutionWidth(v179, v137, v138);
    unint64_t v147 = objc_msgSend_maxTotalThreadsPerThreadgroup(v179, v145, v146) / v144;
    v190[0] = (v144 + objc_msgSend_width(v35, v148, v149) - 1) / v144;
    v190[1] = (v147 + objc_msgSend_height(v35, v150, v151) - 1) / v147;
    v128 = v179;
    v190[2] = 1;
    v189[0] = v144;
    v189[1] = v147;
    v189[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v152, (uint64_t)v190, v189);
  }
  v154 = v176;
  v153 = v177;
  if (!a15)
  {
    objc_msgSend_setTexture_atIndex_(v108, v142, (uint64_t)v27, 0);
    objc_msgSend_setTexture_atIndex_(v108, v155, (uint64_t)v35, 1);
    LOBYTE(v193[0]) = 0;
    objc_msgSend_setBytes_length_atIndex_(v108, v156, (uint64_t)v193, 1, 0);
    if (v180)
    {
      v188[0] = objc_msgSend_width(v35, v157, v158);
      v188[1] = objc_msgSend_height(v35, v159, v160);
      v154 = v176;
      v188[2] = 1;
      v187[0] = v129;
      v187[1] = v132;
      v187[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v108, v161, (uint64_t)v188, v187);
    }
    else
    {
      unint64_t v162 = objc_msgSend_threadExecutionWidth(v128, v157, v158);
      unint64_t v165 = objc_msgSend_maxTotalThreadsPerThreadgroup(v128, v163, v164) / v162;
      v186[0] = (v162 + objc_msgSend_width(v35, v166, v167) - 1) / v162;
      v186[1] = (v165 + objc_msgSend_height(v35, v168, v169) - 1) / v165;
      v153 = v177;
      v186[2] = 1;
      v185[0] = v162;
      v185[1] = v165;
      v185[2] = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v170, (uint64_t)v186, v185);
    }
  }
  objc_msgSend_endEncoding(v108, v142, v143);

  return 1;
}

- (id)run:(id)a3
{
  v66[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v65 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    uint64_t v10 = objc_msgSend_device(self, v5, v6);
    id v9 = (id)objc_msgSend_newCommandQueue(v10, v11, v12);
  }
  uint64_t v63 = v9;
  v13 = objc_msgSend_inputs(self, v7, v8);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x263F00968]);
  uint64_t v17 = objc_msgSend__mtlTextureForImage_(UniKernel, v16, (uint64_t)v15);

  id v20 = objc_msgSend_inputs(self, v18, v19);
  id v22 = objc_msgSend_objectForKeyedSubscript_(v20, v21, *MEMORY[0x263F009D0]);
  id v24 = objc_msgSend__mtlTextureForImage_(UniKernel, v23, (uint64_t)v22);

  id v27 = objc_msgSend_commandBuffer(v9, v25, v26);
  objc_msgSend_setLabel_(v27, v28, @"SR XHLRB");
  v64 = objc_msgSend_inputs(self, v29, v30);
  id v60 = objc_msgSend_objectForKeyedSubscript_(v64, v31, @"dynamic_params");
  v62 = objc_msgSend_inputs(self, v32, v33);
  v61 = objc_msgSend_objectForKeyedSubscript_(v62, v34, @"inputIterations");
  unsigned int v59 = objc_msgSend_intValue(v61, v35, v36);
  uint64_t v39 = objc_msgSend_hlrTileSize(self, v37, v38);
  uint64_t v42 = objc_msgSend_hlrScanKernel(self, v40, v41);
  unint64_t v45 = objc_msgSend_hlrDiffuseKernel(self, v43, v44);
  v48 = objc_msgSend_hlrCopyBackKernel(self, v46, v47);
  v51 = objc_msgSend_hlrCopyKernel(self, v49, v50);
  uint64_t v54 = objc_msgSend_hlrConstants(self, v52, v53);
  objc_msgSend_runHighlightRecoveryWithInputTexture_outputTexture_temporaryTexture_dynamicParams_iterations_tileSize_scanKernel_diffuseKernel_copyBackKernel_copyKernel_commandBuffer_constants_forCoreImage_(UniHighlightRecovery, v55, (uint64_t)v17, v24, 0, v60, v59, v39, v42, v45, v48, v51, v27, v54, 0);

  v66[0] = v27;
  v66[1] = v24;
  v57 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v56, (uint64_t)v66, 2);

  return v57;
}

+ (id)generateCIImage:(id)a3
{
  v71[9] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_inputs(v3, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F00968]);
  uint64_t v10 = objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);

  if (v10)
  {
    objc_msgSend_extent(v10, v11, v12);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v23 = objc_msgSend_imageByClampingToExtent(v10, v21, v22);

    v70[0] = @"inputScale";
    v69 = objc_msgSend_inputs(v3, v24, v25);
    uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v69, v26, *MEMORY[0x263F00990]);
    v71[0] = v68;
    v70[1] = @"inputIterations";
    v67 = objc_msgSend_inputs(v3, v27, v28);
    v66 = objc_msgSend_objectForKeyedSubscript_(v67, v29, @"inputIterations");
    v71[1] = v66;
    v70[2] = @"inputDynamicParams";
    uint64_t v65 = objc_msgSend_inputs(v3, v30, v31);
    v64 = objc_msgSend_objectForKeyedSubscript_(v65, v32, @"dynamic_params");
    v71[2] = v64;
    v70[3] = @"inputTileSize";
    uint64_t v33 = NSNumber;
    uint64_t v36 = objc_msgSend_hlrTileSize(v3, v34, v35);
    uint64_t v38 = objc_msgSend_numberWithInt_(v33, v37, v36);
    v71[3] = v38;
    v70[4] = @"inputScanKernel";
    uint64_t v41 = objc_msgSend_hlrScanKernel(v3, v39, v40);
    v71[4] = v41;
    v70[5] = @"inputDiffuseKernel";
    uint64_t v44 = objc_msgSend_hlrDiffuseKernel(v3, v42, v43);
    v71[5] = v44;
    v70[6] = @"inputCopyBackKernel";
    uint64_t v47 = objc_msgSend_hlrCopyBackKernel(v3, v45, v46);
    v71[6] = v47;
    v70[7] = @"inputCopyKernel";
    uint64_t v50 = objc_msgSend_hlrCopyKernel(v3, v48, v49);
    v71[7] = v50;
    v70[8] = @"inputConstants";
    uint64_t v53 = objc_msgSend_hlrConstants(v3, v51, v52);
    v71[8] = v53;
    v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)v71, v70, 9);
    uint64_t v63 = v23;
    v57 = objc_msgSend_imageByApplyingFilter_withInputParameters_(v23, v56, @"SDOFHighlightRecovery", v55);
    id v60 = objc_msgSend_imageByCroppingToRect_(v57, v58, v59, v14, v16, v18, v20);

    if (!v60) {
      sub_262E4D3CC();
    }
    uint64_t v10 = objc_msgSend_imageWithCIImage_(UniImage, v61, (uint64_t)v60);
  }

  return v10;
}

- (id)outputImage:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_copy(self, v5, v6);
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_generateCIImage_(v8, v9, (uint64_t)v7);
  if (v10)
  {
    uint64_t v12 = v10;
    objc_msgSend_setKernel_(v10, v11, (uint64_t)v7);
  }
  else
  {
    double v15 = [UniImage alloc];
    uint64_t v12 = objc_msgSend_initWithKernel_(v15, v16, (uint64_t)v7);
  }
  double v17 = objc_msgSend_inputs(v7, v13, v14);
  double v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, *MEMORY[0x263F009D0]);
  objc_msgSend_setTexture_(v12, v20, (uint64_t)v19);

  id v23 = objc_msgSend_texture(v12, v21, v22);
  if (!v23) {
    sub_262E4D3F8();
  }

  return v12;
}

- (id)_identifyGPU:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_name(v3, v4, v5);
  if (objc_msgSend_containsString_(v6, v7, @"Apple"))
  {
    NSSelectorFromString(&cfstr_Architecture.isa);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      double v15 = &stru_270E15D18;
      goto LABEL_15;
    }
    uint64_t v6 = objc_msgSend_architecture(v3, v9, v10);
    double v13 = objc_msgSend_name(v6, v11, v12);
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"applegpu_", &stru_270E15D18);
    double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v18 = objc_msgSend_revision(v6, v16, v17);
    if (objc_msgSend_containsString_(v18, v19, @"A"))
    {
      char v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, @"g16p"))
    {
      id v24 = objc_msgSend_revision(v6, v22, v23);
      char v21 = objc_msgSend_containsString_(v24, v25, @"B0") ^ 1;
    }
    else
    {
      char v21 = 1;
    }

    char v27 = objc_msgSend_containsString_(v15, v26, @"g17p");
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      uint64_t v30 = NSString;
      uint64_t v31 = objc_msgSend_revision(v6, v28, v29);
      uint64_t v34 = objc_msgSend_lowercaseString(v31, v32, v33);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v30, v35, @"%@_%@", v15, v34);

      double v15 = (__CFString *)v36;
    }
  }
  else
  {
    double v15 = &stru_270E15D18;
  }

LABEL_15:

  return v15;
}

- (MTLComputePipelineState)hlrScanKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHlrScanKernel:(id)a3
{
}

- (MTLComputePipelineState)hlrDiffuseKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHlrDiffuseKernel:(id)a3
{
}

- (MTLComputePipelineState)hlrCopyBackKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHlrCopyBackKernel:(id)a3
{
}

- (MTLComputePipelineState)hlrCopyKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHlrCopyKernel:(id)a3
{
}

- (int)hlrTileSize
{
  return self->hlrTileSize;
}

- (void)setHlrTileSize:(int)a3
{
  self->hlrTileSize = a3;
}

- (NSDictionary)hlrConstants
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHlrConstants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hlrConstants, 0);
  objc_storeStrong((id *)&self->hlrCopyKernel, 0);
  objc_storeStrong((id *)&self->hlrCopyBackKernel, 0);
  objc_storeStrong((id *)&self->hlrDiffuseKernel, 0);

  objc_storeStrong((id *)&self->hlrScanKernel, 0);
}

@end