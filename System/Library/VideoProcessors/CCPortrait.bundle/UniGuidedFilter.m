@interface UniGuidedFilter
- (MTLComputePipelineState)combineRGBA;
- (UniGuidedFilter)init;
- (UniGuidedFilter)initWithDevice:(id)a3;
- (id)_combineRGB:(id)a3 weights:(id)a4 tmpRGBA:(id)a5 rgbWeight:(float)a6 buffer:(id)a7;
- (id)_disparityRefinementRGBAGuideKernel;
- (id)_identifyGPU:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inputNameArray;
- (id)outputImage:(id)a3;
- (id)outputNameArray;
- (id)run:(id)a3;
- (void)setCombineRGBA:(id)a3;
@end

@implementation UniGuidedFilter

- (UniGuidedFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)UniGuidedFilter;
  return [(UniKernel *)&v3 init];
}

- (UniGuidedFilter)initWithDevice:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)UniGuidedFilter;
  v5 = [(UniKernel *)&v53 init];
  v7 = (uint64_t *)v5;
  if (!v5) {
    goto LABEL_5;
  }
  objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  if (qword_26B425318 != -1) {
    dispatch_once(&qword_26B425318, &unk_270E12E58);
  }
  v8 = (void *)v7[9];
  v7[9] = 0;

  id v9 = (id)qword_26B4252F0;
  objc_sync_enter(v9);
  uint64_t v11 = objc_msgSend_objectForKey_((void *)qword_26B4252F0, v10, (uint64_t)v4);
  v12 = (void *)v7[9];
  v7[9] = v11;

  objc_sync_exit(v9);
  if (v7[9]) {
    goto LABEL_5;
  }
  v15 = (void *)MEMORY[0x263F086E0];
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = objc_msgSend_bundleForClass_(v15, v17, v16);
  if (!v18)
  {
    v43 = uni_logger_api();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_262E4CD20();
    }

    goto LABEL_21;
  }
  v20 = (void *)v18;
  id v52 = 0;
  v21 = objc_msgSend_newDefaultLibraryWithBundle_error_(v4, v19, v18, &v52);
  id v22 = v52;
  v25 = objc_msgSend_resourcePath(v20, v23, v24);
  uint64_t v48 = objc_msgSend__identifyGPU_(v7, v26, (uint64_t)v4);
  objc_msgSend_stringWithFormat_(NSString, v27, @"%@/%@", v25, v48);
  uint64_t v47 = v51 = v22;
  v49 = objc_msgSend_newPipelineLibraryWithFilePath_error_(v4, v28, v47, &v51);
  id v29 = v51;

  if (v21)
  {
    v46 = v25;
    uint64_t v31 = objc_msgSend_newFunctionWithName_(v21, v30, @"_combineRGBAndAlpha");
    if (!v31) {
      sub_262E4CEEC();
    }
    v32 = v31;
    v33 = objc_opt_new();
    objc_msgSend_setPipelineLibrary_(v33, v34, (uint64_t)v49);
    objc_msgSend_setComputeFunction_(v33, v35, (uint64_t)v32);
    id v50 = v29;
    uint64_t v37 = objc_msgSend_newComputePipelineStateWithDescriptor_error_(v4, v36, (uint64_t)v33, &v50);
    id v45 = v50;

    v38 = (void *)v7[9];
    v7[9] = v37;

    id v39 = (id)qword_26B4252F0;
    objc_sync_enter(v39);
    objc_msgSend_setObject_forKey_((void *)qword_26B4252F0, v40, v7[9], v4);
    objc_sync_exit(v39);

    id v29 = v45;
    v25 = v46;
    v42 = (void *)v47;
    v41 = (void *)v48;
  }
  else
  {
    v44 = uni_logger_api();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_262E4CE50();
    }

    v32 = uni_logger_api();
    v42 = (void *)v47;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_262E4CDD0();
    }
    v41 = (void *)v48;
  }

  if (!v21 || !v7[9])
  {
LABEL_21:
    v13 = 0;
    goto LABEL_6;
  }
LABEL_5:
  v13 = v7;
LABEL_6:

  return v13;
}

- (id)_combineRGB:(id)a3 weights:(id)a4 tmpRGBA:(id)a5 rgbWeight:(float)a6 buffer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  float v51 = a6;
  id v15 = a7;
  if (!v12) {
    sub_262E4CF18();
  }
  if (!v13) {
    sub_262E4CF44();
  }
  uint64_t v16 = v15;
  id v17 = v14;
  v20 = v17;
  if (!v17 || (v21 = v17, (objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_270E2A1A0) & 1) == 0))
  {
    uint64_t v22 = objc_msgSend_pixelFormat(v12, v18, v19);
    v21 = createSimilarTexture(v13, v22);

    if (!v21) {
      sub_262E4CF70();
    }
  }
  v23 = objc_msgSend_computeCommandEncoder(v16, v18, v19);
  objc_msgSend_setComputePipelineState_(v23, v24, (uint64_t)self->combineRGBA);
  objc_msgSend_setTexture_atIndex_(v23, v25, (uint64_t)v12, 0);
  objc_msgSend_setTexture_atIndex_(v23, v26, (uint64_t)v13, 1);
  objc_msgSend_setTexture_atIndex_(v23, v27, (uint64_t)v21, 2);
  objc_msgSend_setBytes_length_atIndex_(v23, v28, (uint64_t)&v51, 4, 0);
  uint64_t v48 = v12;
  uint64_t v31 = objc_msgSend_width(v13, v29, v30);
  uint64_t v34 = objc_msgSend_height(v13, v32, v33);
  uint64_t v37 = objc_msgSend_threadExecutionWidth(self->combineRGBA, v35, v36);
  unint64_t v40 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->combineRGBA, v38, v39);
  unint64_t v43 = objc_msgSend_threadExecutionWidth(self->combineRGBA, v41, v42);
  v50[0] = v31;
  v50[1] = v34;
  v50[2] = 1;
  v49[0] = v37;
  v49[1] = v40 / v43;
  v49[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v44, (uint64_t)v50, v49);
  objc_msgSend_endEncoding(v23, v45, v46);

  return v21;
}

- (id)run:(id)a3
{
  v155[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_inputs(self, v5, v6);
  id v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"source");
  uint64_t v11 = objc_msgSend__mtlTextureForImage_(UniKernel, v10, (uint64_t)v9);

  id v14 = objc_msgSend_inputs(self, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"guidance");
  uint64_t v18 = objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v16);

  v21 = objc_msgSend_inputs(self, v19, v20);
  v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"weights");
  uint64_t v25 = objc_msgSend__mtlTextureForImage_(UniKernel, v24, (uint64_t)v23);

  v28 = objc_msgSend_inputs(self, v26, v27);
  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"destinationCoefficients");
  uint64_t v32 = objc_msgSend__mtlTextureForImage_(UniKernel, v31, (uint64_t)v30);

  v35 = objc_msgSend_inputs(self, v33, v34);
  uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v35, v36, @"tmpRGBA");
  v149 = objc_msgSend__mtlTextureForImage_(UniKernel, v38, (uint64_t)v37);

  v41 = objc_msgSend_inputs(self, v39, v40);
  id v45 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"rgbWeight");
  if (v45)
  {
    uint64_t v46 = objc_msgSend_inputs(self, v43, v44);
    uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v46, v47, @"rgbWeight");
    objc_msgSend_floatValue(v48, v49, v50);
    float v52 = v51;
  }
  else
  {
    float v52 = 1.0;
  }

  if (!v11) {
    sub_262E4CF9C();
  }
  if (!v18) {
    sub_262E4CFC8();
  }
  if (!v25) {
    sub_262E4CFF4();
  }
  if (!v32) {
    sub_262E4D020();
  }
  v57 = objc_msgSend_device(self, v53, v54);
  if (v57) {
    objc_msgSend_device(self, v55, v56);
  }
  else {
  v58 = objc_msgSend_device(v11, v55, v56);
  }

  v143 = v58;
  if (v4) {
    id v61 = v4;
  }
  else {
    id v61 = (id)objc_msgSend_newCommandQueue(v58, v59, v60);
  }
  v147 = (void *)v32;
  v142 = v61;
  v150 = objc_msgSend_commandBuffer(v61, v62, v63);
  objc_msgSend_setLabel_(v150, v64, @"MPSImageSpatioTemporalGuidedFilter");
  v67 = objc_msgSend_inputs(self, v65, v66);
  v71 = objc_msgSend_objectForKeyedSubscript_(v67, v68, @"subsampleFactor");
  if (v71)
  {
    v72 = objc_msgSend_inputs(self, v69, v70);
    objc_msgSend_objectForKeyedSubscript_(v72, v73, @"subsampleFactor");
    v75 = uint64_t v74 = v25;
    uint64_t v144 = objc_msgSend_unsignedIntegerValue(v75, v76, v77);

    uint64_t v25 = v74;
  }
  else
  {
    uint64_t v144 = 8;
  }

  *(float *)&double v78 = v52;
  v146 = objc_msgSend__combineRGB_weights_tmpRGBA_rgbWeight_buffer_(self, v79, (uint64_t)v18, v25, v149, v150, v78);
  if (!v146) {
    sub_262E4D04C();
  }
  v141 = v18;
  v82 = (void *)MEMORY[0x263EFF9A0];
  v155[0] = @"MPSImageSpatioTemporalGuidedFilter";
  v154[0] = @"name";
  v154[1] = @"spatialDiameter";
  v83 = objc_msgSend_inputs(self, v80, v81);
  v87 = objc_msgSend_objectForKeyedSubscript_(v83, v84, @"spatialDiameter");
  v148 = v4;
  v140 = (void *)v25;
  if (v87)
  {
    uint64_t v18 = objc_msgSend_inputs(self, v85, v86);
    v89 = objc_msgSend_objectForKeyedSubscript_(v18, v88, @"spatialDiameter");
  }
  else
  {
    v89 = &unk_270E1E6D8;
  }
  v155[1] = v89;
  v154[2] = @"width";
  v90 = NSNumber;
  uint64_t v91 = objc_msgSend_width(v11, v85, v86);
  v93 = objc_msgSend_numberWithUnsignedInteger_(v90, v92, v91);
  v155[2] = v93;
  v154[3] = @"height";
  v94 = NSNumber;
  v145 = v11;
  uint64_t v97 = objc_msgSend_height(v11, v95, v96);
  v99 = objc_msgSend_numberWithUnsignedInteger_(v94, v98, v97);
  v155[3] = v99;
  v154[4] = @"subsampleFactor";
  v101 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v100, v144);
  v155[4] = v101;
  v103 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v102, (uint64_t)v155, v154, 5);
  v105 = objc_msgSend_dictionaryWithDictionary_(v82, v104, (uint64_t)v103);

  if (v87)
  {
  }
  v108 = objc_msgSend_inputs(self, v106, v107);
  v110 = objc_msgSend_objectForKeyedSubscript_(v108, v109, @"epsilon");

  if (v110)
  {
    v113 = objc_msgSend_inputs(self, v111, v112);
    v115 = objc_msgSend_objectForKeyedSubscript_(v113, v114, @"epsilon");
    objc_msgSend_setObject_forKeyedSubscript_(v105, v116, (uint64_t)v115, @"epsilon");
  }
  v117 = objc_msgSend_device(v148, v111, v112);
  v119 = objc_msgSend_findKernel_device_(UniDeviceCache, v118, (uint64_t)v105, v117);

  objc_msgSend_setLabel_(v119, v120, @"MPSImageSpatioTemporalGuidedFilter");
  if (!v119) {
    sub_262E4D078();
  }
  v122 = v105;
  v153 = v145;
  v123 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v121, (uint64_t)&v153, 1);
  v126 = objc_msgSend_inputs(self, v124, v125);
  v130 = objc_msgSend_objectForKeyedSubscript_(v126, v127, @"iterations");
  if (v130)
  {
    v105 = objc_msgSend_inputs(self, v128, v129);
    objc_msgSend_objectForKeyedSubscript_(v105, v131, @"iterations");
    self = (UniGuidedFilter *)objc_claimAutoreleasedReturnValue();
    uint64_t v134 = objc_msgSend_unsignedIntegerValue(self, v132, v133);
  }
  else
  {
    uint64_t v134 = 50;
  }
  v152 = v147;
  v135 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v128, (uint64_t)&v152, 1);
  objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(v119, v136, (uint64_t)v150, v123, v146, 0, v134, v135);

  if (v130)
  {
  }
  v151[0] = v150;
  v151[1] = v147;
  v138 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v137, (uint64_t)v151, 2);

  return v138;
}

- (id)_disparityRefinementRGBAGuideKernel
{
  return (id)objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, a2, @"_disparityRefinementRGBAGuideKernel");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UniGuidedFilter;
  return [(UniKernel *)&v4 copyWithZone:a3];
}

- (id)outputImage:(id)a3
{
  v211[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_copy(self, v5, v6);
  v10 = objc_msgSend_inputs(v7, v8, v9);
  id v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"source");
  id v14 = objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);

  id v17 = objc_msgSend_inputs(v7, v15, v16);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"guidance");
  v21 = objc_msgSend__ciImageForInput_(v7, v20, (uint64_t)v19);

  uint64_t v24 = objc_msgSend_inputs(v7, v22, v23);
  v26 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"weights");
  v28 = objc_msgSend__ciImageForInput_(v7, v27, (uint64_t)v26);

  if (!v14) {
    sub_262E4D0A4();
  }
  if (!v21) {
    sub_262E4D0D0();
  }
  if (!v28) {
    sub_262E4D0FC();
  }
  objc_msgSend_extent(v21, v29, v30);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  objc_msgSend_extent(v28, v39, v40);
  v214.origin.x = v41;
  v214.origin.y = v42;
  v214.size.width = v43;
  v214.size.height = v44;
  v213.origin.x = v32;
  v213.origin.y = v34;
  v213.size.width = v36;
  v213.size.height = v38;
  if (!CGRectEqualToRect(v213, v214))
  {
    objc_msgSend_extent(v28, v45, v46);
    double v48 = v47;
    objc_msgSend_extent(v21, v49, v50);
    CGFloat v52 = v48 / v51;
    objc_msgSend_extent(v28, v53, v54);
    double v56 = v55;
    objc_msgSend_extent(v21, v57, v58);
    CGAffineTransformMakeScale(&v204, v52, v56 / v59);
    uint64_t v61 = objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v21, v60, (uint64_t)&v204, 0);

    v21 = (void *)v61;
  }
  v202 = objc_msgSend__disparityRefinementRGBAGuideKernel(self, v45, v46);
  if (!v202) {
    sub_262E4D128();
  }
  v64 = objc_msgSend_inputs(v7, v62, v63);
  v68 = objc_msgSend_objectForKeyedSubscript_(v64, v65, @"rgbWeight");
  if (v68)
  {
    v69 = objc_msgSend_inputs(v7, v66, v67);
    v71 = objc_msgSend_objectForKeyedSubscript_(v69, v70, @"rgbWeight");
  }
  else
  {
    v71 = &unk_270E1E6F0;
  }

  objc_msgSend_extent(v21, v72, v73);
  double v75 = v74;
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  v211[0] = v21;
  v211[1] = v28;
  v198 = v71;
  v199 = v28;
  v211[2] = v71;
  v83 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v82, (uint64_t)v211, 3);
  uint64_t v209 = *MEMORY[0x263F009C8];
  v84 = (void *)0x263F08000;
  uint64_t v86 = objc_msgSend_numberWithInt_(NSNumber, v85, *MEMORY[0x263F008B0]);
  v210 = v86;
  v88 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v87, (uint64_t)&v210, &v209, 1);
  v90 = objc_msgSend_applyWithExtent_arguments_options_(v202, v89, (uint64_t)v83, v88, v75, v77, v79, v81);

  if (!v90) {
    sub_262E4D154();
  }
  v93 = (void *)MEMORY[0x263F00680];
  objc_msgSend_extent(v14, v91, v92);
  uint64_t v96 = objc_msgSend_vectorWithCGRect_(v93, v94, v95);
  v208[0] = v96;
  uint64_t v97 = (void *)MEMORY[0x263F00680];
  v200 = v90;
  objc_msgSend_extent(v90, v98, v99);
  v102 = objc_msgSend_vectorWithCGRect_(v97, v100, v101);
  v208[1] = v102;
  v201 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v103, (uint64_t)v208, 2);

  v106 = objc_msgSend_inputs(v7, v104, v105);
  v110 = objc_msgSend_objectForKeyedSubscript_(v106, v107, @"subsampleFactor");
  if (v110)
  {
    v111 = objc_msgSend_inputs(v7, v108, v109);
    v113 = objc_msgSend_objectForKeyedSubscript_(v111, v112, @"subsampleFactor");
    uint64_t v116 = objc_msgSend_unsignedIntegerValue(v113, v114, v115);
  }
  else
  {
    uint64_t v116 = 8;
  }

  v191 = (void *)MEMORY[0x263EFF9A0];
  v207[0] = @"MPSImageSpatioTemporalGuidedFilter";
  v206[0] = @"name";
  v206[1] = @"spatialDiameter";
  v195 = objc_msgSend_inputs(v7, v117, v118);
  v194 = objc_msgSend_objectForKeyedSubscript_(v195, v119, @"spatialDiameter");
  if (v194)
  {
    v188 = objc_msgSend_inputs(v7, v120, v121);
    v123 = objc_msgSend_objectForKeyedSubscript_(v188, v122, @"spatialDiameter");
  }
  else
  {
    v123 = &unk_270E1E6D8;
  }
  v190 = v123;
  v207[1] = v123;
  v207[2] = v201;
  v206[2] = @"imageExtents";
  v206[3] = @"epsilon";
  v192 = objc_msgSend_inputs(v7, v120, v121);
  v127 = objc_msgSend_objectForKeyedSubscript_(v192, v124, @"epsilon");
  v197 = v4;
  if (v127)
  {
    v187 = objc_msgSend_inputs(v7, v125, v126);
    uint64_t v129 = objc_msgSend_objectForKeyedSubscript_(v187, v128, @"epsilon");
  }
  else
  {
    uint64_t v129 = &unk_270E1F118;
  }
  v189 = v129;
  v207[3] = v129;
  v206[4] = @"subsampleFactor";
  v130 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v125, v116);
  v207[4] = v130;
  v206[5] = @"width";
  v131 = NSNumber;
  objc_msgSend_extent(v14, v132, v133);
  v137 = objc_msgSend_numberWithDouble_(v131, v134, v135, v136);
  v207[5] = v137;
  v206[6] = @"height";
  v138 = NSNumber;
  v196 = v14;
  objc_msgSend_extent(v14, v139, v140);
  uint64_t v144 = objc_msgSend_numberWithDouble_(v138, v141, v142, v143);
  v207[6] = v144;
  v206[7] = @"iterations";
  v147 = objc_msgSend_inputs(v7, v145, v146);
  v151 = objc_msgSend_objectForKeyedSubscript_(v147, v148, @"iterations");
  v193 = v7;
  if (v151)
  {
    v84 = objc_msgSend_inputs(v7, v149, v150);
    v153 = objc_msgSend_objectForKeyedSubscript_(v84, v152, @"iterations");
  }
  else
  {
    v153 = &unk_270E1E708;
  }
  v207[7] = v153;
  v154 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v149, (uint64_t)v207, v206, 8);
  v156 = objc_msgSend_dictionaryWithDictionary_(v191, v155, (uint64_t)v154);

  if (v151)
  {
  }
  if (v127)
  {
  }
  v157 = v200;
  if (v194)
  {
  }
  objc_msgSend_extent(v200, v158, v159);
  double v161 = v160;
  double v163 = v162;
  double v165 = v164;
  double v167 = v166;
  v205[0] = v196;
  v205[1] = v200;
  v169 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v168, (uint64_t)v205, 2);
  id v203 = 0;
  v171 = objc_msgSend_applyWithExtent_inputs_arguments_error_(GuidedFilterProcessor, v170, (uint64_t)v169, v156, &v203, v161, v163, v165, v167);
  id v172 = v203;

  if (v172)
  {
    uni_logger_api();
    v174 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v174, OS_LOG_TYPE_ERROR)) {
      sub_262E4D1D8((uint64_t)v172, v174);
    }

    v175 = 0;
  }
  else
  {
    if (!v171) {
      sub_262E4D180();
    }
    v175 = objc_msgSend_imageWithCIImage_(UniImage, v173, (uint64_t)v171);
    v178 = objc_msgSend_inputs(v193, v176, v177);
    v180 = objc_msgSend_objectForKeyedSubscript_(v178, v179, @"destinationCoefficients");
    objc_msgSend_setTexture_(v175, v181, (uint64_t)v180);

    v184 = objc_msgSend_texture(v175, v182, v183);
    if (!v184) {
      sub_262E4D1AC();
    }

    objc_msgSend_setKernel_(v175, v185, (uint64_t)v193);
    v157 = v200;
  }

  return v175;
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
      id v15 = &stru_270E15D18;
      goto LABEL_15;
    }
    uint64_t v6 = objc_msgSend_architecture(v3, v9, v10);
    uint64_t v13 = objc_msgSend_name(v6, v11, v12);
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"applegpu_", &stru_270E15D18);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_revision(v6, v16, v17);
    if (objc_msgSend_containsString_(v18, v19, @"A"))
    {
      char v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, @"g16p"))
    {
      uint64_t v24 = objc_msgSend_revision(v6, v22, v23);
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
      double v31 = objc_msgSend_revision(v6, v28, v29);
      CGFloat v34 = objc_msgSend_lowercaseString(v31, v32, v33);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v30, v35, @"%@_%@", v15, v34);

      id v15 = (__CFString *)v36;
    }
  }
  else
  {
    id v15 = &stru_270E15D18;
  }

LABEL_15:

  return v15;
}

- (id)inputNameArray
{
  return &unk_270E1F140;
}

- (id)outputNameArray
{
  return &unk_270E1F158;
}

- (MTLComputePipelineState)combineRGBA
{
  return self->combineRGBA;
}

- (void)setCombineRGBA:(id)a3
{
}

- (void).cxx_destruct
{
}

@end