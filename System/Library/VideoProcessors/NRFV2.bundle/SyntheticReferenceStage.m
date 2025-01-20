@interface SyntheticReferenceStage
+ (int)prewarmShaders:(id)a3;
+ (unint64_t)computeScratchBufferSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5;
+ (unint64_t)pyramidLevels;
- (SidecarWriter)sidecarWriter;
- (SyntheticReferenceStage)initWithMetalContext:(id)a3;
- (int)_doColorConvertEv0ToOutput:(id)a3 ev0:(id)a4 ev0Properties:(const frameProperties_t *)a5 srPlist:(id)a6 intermediateMetadata:(id)a7;
- (int)allocateResourcesWithScratchBuffer:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)collectDetectorsResultsWithGrayGhost:(id)a3 motionDetection:(id)a4 nrfPlist:(id)a5;
- (int)getSyntheticReferenceMode;
- (int)startDetectorsWithGrayGhost:(id)a3 motionDetection:(id)a4 evm:(id)a5 ev0:(id)a6 evmProperties:(const frameProperties_t *)a7 ev0Properties:(const frameProperties_t *)a8 nrfPlist:(id)a9;
- (uint64_t)_doDeepShadowRecovery:(__n128)a3 noiseDivisorOutputTex:(__n128)a4 lscGainsTex:(__n128)a5 evm:(__n128)a6 ev0:(__n128)a7 evmHomography:(__n128)a8 ev0Homography:(__n128)a9 evmProperties:(uint64_t)a10 evmGreenTintAdjustmentParams:(void *)a11 ev0Properties:(void *)a12 srPlist:(void *)a13 intermediateMetadata:(void *)a14;
- (uint64_t)_doHighlightRecovery:(__n128)a3 noiseDivisorOutputTex:(__n128)a4 evm:(__n128)a5 ev0:(__n128)a6 evmHomography:(__n128)a7 ev0Homography:(__n128)a8 evmProperties:(__n128)a9 evmGreenTintAdjustmentParams:(uint64_t)a10 ev0Properties:(void *)a11 srPlist:(void *)a12 intermediateMetadata:(void *)a13;
- (uint64_t)doSyntheticReference:(double)a3 noiseDivisorOutputTex:(double)a4 lscGainsTex:(double)a5 evm:(double)a6 ev0:(double)a7 evmHomography:(double)a8 ev0Homography:(double)a9 evmProperties:(uint64_t)a10 evmGreenTintAdjustment:(void *)a11 ev0Properties:(void *)a12 nrfPlist:(void *)a13 intermediateMetadata:(void *)a14;
- (uint64_t)generateNoiseMap:(__n128)a3 outputNoiseMapChroma:(__n128)a4 lscGainsTex:(uint64_t)a5 ev0:(void *)a6 ev0Homography:(void *)a7 ev0Properties:(void *)a8;
- (uint64_t)generateNoiseMap:(__n128)a3 outputNoiseMapChroma:(__n128)a4 noiseDivisorTex:(__n128)a5 lscGainsTex:(__n128)a6 evm:(__n128)a7 ev0:(__n128)a8 evmHomography:(__n128)a9 ev0Homography:(uint64_t)a10 evmProperties:(void *)a11 evmGreenTintAdjustmentParams:(void *)a12 ev0Properties:(void *)a13;
- (void)setSidecarWriter:(id)a3;
@end

@implementation SyntheticReferenceStage

+ (unint64_t)pyramidLevels
{
  return 4;
}

- (SyntheticReferenceStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SyntheticReferenceStage;
  v6 = [(SyntheticReferenceStage *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(SyntheticReferenceShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, (uint64_t)v7->_metal, v13);
    shaders = v7->_shaders;
    v7->_shaders = (SyntheticReferenceShaders *)v14;

    if (v7->_shaders)
    {
      v7->_pyramidLevels = objc_msgSend_pyramidLevels(SyntheticReferenceStage, v16, v17, v18);
      v7->_syntheticReferenceMode = 0;
      v19 = v7;
    }
    else
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v19 = 0;
      }
      else {
        v19 = v7;
      }
    }
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  return v20;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [SyntheticReferenceShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

+ (unint64_t)computeScratchBufferSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5
{
  return 0;
}

- (int)allocateResourcesWithScratchBuffer:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return 0;
}

- (uint64_t)_doHighlightRecovery:(__n128)a3 noiseDivisorOutputTex:(__n128)a4 evm:(__n128)a5 ev0:(__n128)a6 evmHomography:(__n128)a7 ev0Homography:(__n128)a8 evmProperties:(__n128)a9 evmGreenTintAdjustmentParams:(uint64_t)a10 ev0Properties:(void *)a11 srPlist:(void *)a12 intermediateMetadata:(void *)a13
{
  v24 = a11;
  id v177 = a12;
  v179 = a13;
  id v178 = a14;
  id v25 = a17;
  id v29 = a18;
  v30 = (int *)MEMORY[0x263F00E10];
  int v31 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v31 = *v30;
  }
  if (v31)
  {
    v32 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v26, v27, v28);
    v36 = objc_msgSend_commandBuffer(v32, v33, v34, v35);

    objc_msgSend_setLabel_(v36, v37, @"KTRACE_START_MTL", v38);
    objc_msgSend_addCompletedHandler_(v36, v39, (uint64_t)&unk_270E340A8, v40);
    objc_msgSend_commit(v36, v41, v42, v43);
  }
  uint64_t v188 = 0;
  uint64_t v189 = 0;
  int v166 = *(unsigned __int8 *)(a16 + 224147);
  LODWORD(v188) = sub_262F98A00((uint64_t)(a15 + 1), a16 + 16, a16);
  long long v44 = *(_OWORD *)(a16 + 224128);
  v187[10] = *(_OWORD *)(a16 + 224112);
  v187[11] = v44;
  long long v45 = *(_OWORD *)(a16 + 224064);
  v187[6] = *(_OWORD *)(a16 + 224048);
  v187[7] = v45;
  long long v46 = *(_OWORD *)(a16 + 224096);
  v187[8] = *(_OWORD *)(a16 + 224080);
  v187[9] = v46;
  long long v47 = *(_OWORD *)(a16 + 224000);
  v187[2] = *(_OWORD *)(a16 + 223984);
  v187[3] = v47;
  long long v48 = *(_OWORD *)(a16 + 224032);
  v187[4] = *(_OWORD *)(a16 + 224016);
  v187[5] = v48;
  long long v49 = *(_OWORD *)(a16 + 223968);
  v187[0] = *(_OWORD *)(a16 + 223952);
  v187[1] = v49;
  long long v50 = a15[14007];
  long long v51 = a15[14008];
  long long v52 = a15[14005];
  v187[22] = a15[14006];
  v187[23] = v50;
  long long v53 = a15[14009];
  v187[24] = v51;
  v187[25] = v53;
  long long v54 = a15[14003];
  long long v55 = a15[14004];
  long long v56 = a15[14001];
  v187[18] = a15[14002];
  v187[19] = v54;
  v187[20] = v55;
  v187[21] = v52;
  long long v57 = a15[13999];
  long long v58 = a15[14000];
  long long v59 = a15[13997];
  v187[14] = a15[13998];
  v187[15] = v57;
  v187[16] = v58;
  v187[17] = v56;
  v187[12] = *(_OWORD *)(a16 + 224144);
  v187[13] = v59;
  __n128 v190 = a5;
  __n128 v191 = a6;
  __n128 v192 = a7;
  __n128 v193 = a2;
  __n128 v194 = a3;
  __n128 v195 = a4;
  __n128 v196 = a8;
  __n128 v197 = a9;
  objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v60, a16 + 16, *((void *)v25 + 7));
  float v198 = v61;
  v65 = objc_msgSend_numberWithFloat_(NSNumber, v62, v63, v64);
  objc_msgSend_setObject_forKeyedSubscript_(v29, v66, (uint64_t)v65, @"syntheticReferencePedestal");

  v70 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v67, v68, v69);
  v74 = objc_msgSend_commandBuffer(v70, v71, v72, v73);

  uint64_t v176 = a1;
  if (!v74)
  {
    FigDebugAssert3();
    uint64_t v150 = FigSignalErrorAt();
    v81 = (void **)v178;
    v80 = v179;
LABEL_15:
    v151 = (int *)MEMORY[0x263F00E10];
    goto LABEL_16;
  }
  v78 = objc_msgSend_computeCommandEncoder(v74, v75, v76, v77);
  v81 = (void **)v178;
  v80 = v179;
  if (!v78)
  {
    FigDebugAssert3();
    uint64_t v150 = FigSignalErrorAt();
    goto LABEL_15;
  }
  v82 = v78;
  objc_msgSend_setBytes_length_atIndex_(v78, v79, (uint64_t)v187, 688, 0);
  uint64_t v86 = objc_msgSend_width(*((void **)v178 + 42), v83, v84, v85);
  uint64_t v90 = objc_msgSend_height(*((void **)v178 + 42), v87, v88, v89);
  v93 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v91, 0, v92);

  if (!v93)
  {
    FigDebugAssert3();
    uint64_t v150 = FigSignalErrorAt();

    goto LABEL_15;
  }
  v173 = v74;
  v96 = v24;
  uint64_t v185 = 0;
  objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v94, 0, v95);
  v97 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v184[0] = v97[5];
  objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v98, 0, v99);
  v100 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v184[1] = v100[6];
  objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v101, 0, v102);
  v103 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v184[2] = v103[3];
  objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v104, 0, v105);
  v106 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v184[3] = v106[4];
  objc_msgSend_objectAtIndexedSubscript_(*((void **)v25 + 1), v107, 0, v108);
  v109 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v110.i64[0] = v86;
  v110.i64[1] = v90;
  LODWORD(v185) = v109[2];
  float32x2_t v186 = vdiv_f32((float32x2_t)0x3F0000003F000000, vcvt_f32_f64(vcvtq_f64_u64(v110)));

  objc_msgSend_setBytes_length_atIndex_(v82, v111, (uint64_t)v184, 32, 1);
  if (!v166)
  {
    v81 = (void **)v178;
    objc_msgSend_setTexture_atIndex_(v82, v112, *((void *)v178 + 42), 0);
    objc_msgSend_setTexture_atIndex_(v82, v120, *((void *)v178 + 62), 1);
    v80 = v179;
    objc_msgSend_setTexture_atIndex_(v82, v121, v179[42], 2);
    int v119 = 0;
    uint64_t v118 = v179[62];
    v24 = v96;
    uint64_t v114 = v176;
LABEL_13:
    v74 = v173;
    objc_msgSend_setTexture_atIndex_(v82, v117, v118, 3);
    objc_msgSend_setTexture_atIndex_(v82, v122, v24[2], 4);
    objc_msgSend_setTexture_atIndex_(v82, v123, v24[3], 5);
    objc_msgSend_setTexture_atIndex_(v82, v124, (uint64_t)v177, 6);
    *(float *)&double v125 = v198;
    uint64_t v127 = objc_msgSend_getKernel_configFlags_(*(void **)(v114 + 16), v126, 0, v119 | (4 * (v198 != 0.0)), v125);
    if (v127)
    {
      v130 = (void *)v127;
      objc_msgSend_setComputePipelineState_(v82, v128, v127, v129);
      objc_msgSend_setImageblockWidth_height_(v82, v131, 8, 4);
      uint64_t v135 = objc_msgSend_width(v81[42], v132, v133, v134);
      uint64_t v139 = objc_msgSend_height(v81[42], v136, v137, v138);
      v183[0] = v135;
      v183[1] = v139;
      v183[2] = 1;
      long long v181 = xmmword_263117D20;
      uint64_t v182 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v82, v140, (uint64_t)v183, (uint64_t)&v181);
      objc_msgSend_endEncoding(v82, v141, v142, v143);
      objc_msgSend_commit(v173, v144, v145, v146);

      uint64_t v150 = 0;
    }
    else
    {
      FigDebugAssert3();
      uint64_t v150 = FigSignalErrorAt();
    }
    goto LABEL_15;
  }
  v81 = (void **)v178;
  v80 = v179;
  uint64_t v113 = *((void *)v178 + 82);
  uint64_t v114 = v176;
  if (v113)
  {
    v24 = v96;
    if (v179[82])
    {
      objc_msgSend_setTexture_atIndex_(v82, v112, v113, 0);
      objc_msgSend_setTexture_atIndex_(v82, v115, 0, 1);
      objc_msgSend_setTexture_atIndex_(v82, v116, v179[82], 2);
      uint64_t v118 = 0;
      int v119 = 8;
      goto LABEL_13;
    }
    FigDebugAssert3();
    uint64_t v150 = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    uint64_t v150 = FigSignalErrorAt();

    v24 = v96;
  }
  v151 = (int *)MEMORY[0x263F00E10];
  v74 = v173;
LABEL_16:
  int v152 = *v151;
  if (*v151 == 1)
  {
    kdebug_trace();
    int v152 = *v151;
  }
  if (v152)
  {
    v153 = objc_msgSend_commandQueue(*(void **)(v176 + 8), v147, v148, v149);
    v157 = objc_msgSend_commandBuffer(v153, v154, v155, v156);

    objc_msgSend_setLabel_(v157, v158, @"KTRACE_END_MTL", v159);
    v180[0] = MEMORY[0x263EF8330];
    v180[1] = 3221225472;
    v180[2] = sub_262FA9434;
    v180[3] = &unk_2655C32E8;
    v180[5] = 0;
    v180[6] = 0;
    v180[4] = 1;
    objc_msgSend_addCompletedHandler_(v157, v160, (uint64_t)v180, v161);
    objc_msgSend_commit(v157, v162, v163, v164);
  }
  return v150;
}

- (uint64_t)_doDeepShadowRecovery:(__n128)a3 noiseDivisorOutputTex:(__n128)a4 lscGainsTex:(__n128)a5 evm:(__n128)a6 ev0:(__n128)a7 evmHomography:(__n128)a8 ev0Homography:(__n128)a9 evmProperties:(uint64_t)a10 evmGreenTintAdjustmentParams:(void *)a11 ev0Properties:(void *)a12 srPlist:(void *)a13 intermediateMetadata:(void *)a14
{
  v222 = a11;
  id v221 = a12;
  id v233 = a13;
  v232 = a14;
  v24 = a15;
  id v236 = a18;
  id v28 = a19;
  float gain = a17->meta.exposureParams.gain;
  id v252 = 0;
  v30 = (int *)MEMORY[0x263F00E10];
  int v31 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v31 = *v30;
  }
  if (v31)
  {
    v32 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v25, v26, v27);
    v36 = objc_msgSend_commandBuffer(v32, v33, v34, v35);

    objc_msgSend_setLabel_(v36, v37, @"KTRACE_START_MTL", v38);
    objc_msgSend_addCompletedHandler_(v36, v39, (uint64_t)&unk_270E340C8, v40);
    objc_msgSend_commit(v36, v41, v42, v43);
  }
  uint64_t v254 = 0;
  uint64_t v255 = 0;
  int v231 = a17[1].meta.ltmCurves.ltmLut.bytes[179];
  uint64_t v44 = a16 + 16;
  LODWORD(v254) = sub_262F98A00(a16 + 16, (uint64_t)&a17->meta.exposureParams, (uint64_t)a17);
  long long v45 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  v253[10] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  v253[11] = v45;
  long long v46 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  v253[6] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  v253[7] = v46;
  long long v47 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v253[8] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v253[9] = v47;
  long long v48 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  v253[2] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  v253[3] = v48;
  long long v49 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v253[4] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v253[5] = v49;
  long long v50 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.version;
  v253[0] = *(_OWORD *)&a17[1].meta.ROI.size.height;
  v253[1] = v50;
  long long v51 = *(_OWORD *)(a16 + 224112);
  long long v52 = *(_OWORD *)(a16 + 224128);
  long long v53 = *(_OWORD *)(a16 + 224080);
  v253[22] = *(_OWORD *)(a16 + 224096);
  v253[23] = v51;
  long long v54 = *(_OWORD *)(a16 + 224144);
  v253[24] = v52;
  v253[25] = v54;
  long long v55 = *(_OWORD *)(a16 + 224048);
  long long v56 = *(_OWORD *)(a16 + 224064);
  long long v57 = *(_OWORD *)(a16 + 224016);
  v253[18] = *(_OWORD *)(a16 + 224032);
  v253[19] = v55;
  v253[20] = v56;
  v253[21] = v53;
  long long v58 = *(_OWORD *)(a16 + 223984);
  long long v59 = *(_OWORD *)(a16 + 224000);
  long long v60 = *(_OWORD *)(a16 + 223952);
  v253[14] = *(_OWORD *)(a16 + 223968);
  v253[15] = v58;
  v253[16] = v59;
  v253[17] = v57;
  v253[12] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  v253[13] = v60;
  __n128 v256 = a5;
  __n128 v257 = a6;
  __n128 v258 = a7;
  __n128 v259 = a2;
  __n128 v260 = a3;
  __n128 v261 = a4;
  v263[3] = a8;
  v263[4] = a9;
  objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v61, (uint64_t)&a17->meta.exposureParams, *((void *)v236 + 7));
  float v264 = v62;
  float v262 = a17->meta.exposureParams.exposure_time / *(float *)(a16 + 64);
  v66 = objc_msgSend_numberWithFloat_(NSNumber, v63, v64, v65);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v67, (uint64_t)v66, @"syntheticReferencePedestal");

  uint64_t v72 = v232;
  if ((objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v68, (uint64_t)v263, v44) & 1) == 0)
  {
    FigDebugAssert3();
    uint64_t v202 = FigSignalErrorAt();
    v158 = 0;
    v225 = 0;
    v79 = 0;
LABEL_55:
    uint64_t v118 = 0;
    v117 = 0;
    goto LABEL_38;
  }
  float v73 = v264;
  int v74 = *(_DWORD *)(a1 + 24);
  v75 = objc_msgSend_allocator(*(void **)(a1 + 8), v69, v70, v71);
  v79 = objc_msgSend_newTextureDescriptor(v75, v76, v77, v78);

  if (!v79)
  {
    FigDebugAssert3();
    uint64_t v202 = FigSignalErrorAt();
    v158 = 0;
    v225 = 0;
    goto LABEL_55;
  }
  uint64_t v83 = (v74 - 1);
  uint64_t v84 = objc_msgSend_width(v24[(int)v83 + 42], v80, v81, v82);
  uint64_t v88 = objc_msgSend_desc(v79, v85, v86, v87);
  objc_msgSend_setWidth_(v88, v89, v84, v90);

  uint64_t v94 = objc_msgSend_height(v24[(int)v83 + 42], v91, v92, v93);
  v98 = objc_msgSend_desc(v79, v95, v96, v97);
  objc_msgSend_setHeight_(v98, v99, v94, v100);

  v104 = objc_msgSend_desc(v79, v101, v102, v103);
  objc_msgSend_setUsage_(v104, v105, 3, v106);

  v225 = v79;
  uint64x2_t v110 = objc_msgSend_desc(v79, v107, v108, v109);
  objc_msgSend_setPixelFormat_(v110, v111, 115, v112);

  v223 = (uint64_t *)v24;
  id v219 = v28;
  if (v74 < 1)
  {
    v79 = 0;
    uint64_t v118 = 0;
    v117 = 0;
LABEL_35:
    id v28 = v219;
    if (v252)
    {
      FigDebugAssert3();
      uint64_t v202 = FigSignalErrorAt();
      v158 = 0;
    }
    else
    {
      v158 = 0;
      uint64_t v202 = 0;
    }
    v24 = (void **)v223;
    goto LABEL_38;
  }
  uint64_t v116 = 0;
  v117 = 0;
  uint64_t v118 = 0;
  v79 = 0;
  v235 = &v232[v83];
  int v119 = &v24[v83];
  int64x2_t v227 = vdupq_n_s64(0x10uLL);
  uint64_t v229 = (v74 - 1);
  while (1)
  {
    v120 = v117;
    v121 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v113, v114, v115);
    v117 = objc_msgSend_commandBuffer(v121, v122, v123, v124);

    if (!v117)
    {
      FigDebugAssert3();
      uint64_t v202 = FigSignalErrorAt();
      v158 = 0;
LABEL_47:
      v24 = (void **)v223;
      id v28 = v219;
      goto LABEL_38;
    }
    v128 = objc_msgSend_computeCommandEncoder(v117, v125, v126, v127);

    if (!v128)
    {
      FigDebugAssert3();
      uint64_t v202 = FigSignalErrorAt();
      v158 = 0;
      uint64_t v118 = 0;
      goto LABEL_47;
    }
    v241 = v79;
    uint64_t v130 = v83 + v116;
    uint64_t v118 = v128;
    objc_msgSend_setBytes_length_atIndex_(v128, v129, (uint64_t)v253, 688, 0);
    uint64_t v134 = objc_msgSend_width(v119[v116 + 42], v131, v132, v133);
    uint64_t v238 = objc_msgSend_height(v119[v116 + 42], v135, v136, v137);
    if (v231)
    {
      if (!v130) {
        break;
      }
    }
    objc_msgSend_setTexture_atIndex_(v128, v138, (uint64_t)v119[v116 + 42], 0);
    objc_msgSend_setTexture_atIndex_(v128, v144, (uint64_t)v119[v116 + 62], 1);
    objc_msgSend_setTexture_atIndex_(v128, v145, v235[v116 + 42], 4);
    objc_msgSend_setTexture_atIndex_(v128, v146, v235[v116 + 62], 5);
LABEL_17:
    if (v116)
    {
      objc_msgSend_setTexture_atIndex_(v128, v143, (uint64_t)v119[v116 + 43], 2);
      objc_msgSend_setTexture_atIndex_(v128, v147, (uint64_t)v119[v116 + 63], 3);
      objc_msgSend_setTexture_atIndex_(v128, v148, v235[v116 + 43], 6);
      objc_msgSend_setTexture_atIndex_(v128, v149, v235[v116 + 63], 7);
    }
    objc_msgSend_setTexture_atIndex_(v128, v143, (uint64_t)v233, 11);
    if (v130)
    {
      objc_msgSend_setLabel_(v225, v150, 0, v151);
      uint64_t v155 = objc_msgSend_allocator(*(void **)(a1 + 8), v152, v153, v154);
      v158 = objc_msgSend_newTextureWithDescriptor_(v155, v156, (uint64_t)v225, v157);

      if (!v158)
      {
        FigDebugAssert3();
        uint64_t v202 = FigSignalErrorAt();
        v24 = (void **)v223;
        id v28 = v219;
        goto LABEL_52;
      }
      objc_msgSend_setTexture_atIndex_(v118, v159, (uint64_t)v158, 13);
      uint64_t v163 = objc_msgSend_desc(v225, v160, v161, v162);
      uint64_t v167 = objc_msgSend_width(v163, v164, v165, v166);
      objc_msgSend_setWidth_(v163, v168, 2 * v167, v169);

      v173 = objc_msgSend_desc(v225, v170, v171, v172);
      uint64_t v177 = objc_msgSend_height(v173, v174, v175, v176);
      objc_msgSend_setHeight_(v173, v178, 2 * v177, v179);

      if (v116)
      {
LABEL_26:
        if (!v252) {
          goto LABEL_49;
        }
        objc_msgSend_setTexture_atIndex_(v118, v180, (uint64_t)v252, 12);
      }
    }
    else
    {
      objc_msgSend_setTexture_atIndex_(v128, v150, (uint64_t)v221, 16);
      uint64_t v183 = v222[2];
      if (!v183 || !v222[3]) {
        goto LABEL_50;
      }
      objc_msgSend_setTexture_atIndex_(v128, v182, v183, 14);
      objc_msgSend_setTexture_atIndex_(v128, v184, v222[3], 15);
      v158 = 0;
      if (v116) {
        goto LABEL_26;
      }
    }
    uint64_t v185 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v236 + 2), v180, v130, v181);
    if (!v185)
    {
LABEL_49:
      FigDebugAssert3();
      uint64_t v202 = FigSignalErrorAt();
      goto LABEL_51;
    }
    float32x2_t v186 = (uint64_t *)v185;
    float32x2_t v251 = 0;
    long long v249 = 0u;
    long long v250 = 0u;
    long long v248 = 0u;
    LODWORD(v248) = sub_262FCDA18(*(void *)(v185 + 8), gain);
    DWORD1(v248) = sub_262FCDA18(v186[2], gain);
    DWORD2(v248) = sub_262FCDA18(v186[5], gain);
    HIDWORD(v248) = sub_262FCDA18(v186[6], gain);
    LODWORD(v249) = sub_262FCDA18(v186[3], gain);
    DWORD1(v249) = sub_262FCDA18(v186[4], gain);
    DWORD2(v249) = sub_262FCDA18(v186[7], gain);
    HIDWORD(v249) = sub_262FCDA18(v186[8], gain);
    LODWORD(v250) = sub_262FCDA18(v186[9], gain);
    DWORD1(v250) = sub_262FCDA18(v186[10], gain);
    DWORD2(v250) = sub_262FCDA18(v186[11], gain);
    v187.i64[0] = v134;
    v187.i64[1] = v238;
    int64x2_t v239 = (int64x2_t)v187;
    float32x2_t v251 = vdiv_f32((float32x2_t)0x3F0000003F000000, vcvt_f32_f64(vcvtq_f64_u64(v187)));
    objc_msgSend_setBytes_length_atIndex_(v118, v188, (uint64_t)&v248, 56, 1);
    v79 = objc_msgSend_getKernel_configFlags_(*(void **)(a1 + 16), v189, 4, (8 * (v231 != 0)) | (4 * (v73 != 0.0)) | (v116 == 0) | (2 * (v130 == 0)));

    if (!v79)
    {
      FigDebugAssert3();
      uint64_t v202 = FigSignalErrorAt();

      uint64_t v72 = v232;
      goto LABEL_47;
    }
    objc_msgSend_setImageblockWidth_height_(v118, v190, 16, 16);
    objc_msgSend_setComputePipelineState_(v118, v191, (uint64_t)v79, v192);
    int64x2_t v193 = vaddq_s64(v239, vdupq_n_s64(0xBuLL));
    v193.i64[0] /= 0xCuLL;
    v193.i64[1] /= 0xCuLL;
    int64x2_t v246 = v193;
    uint64_t v247 = 1;
    int64x2_t v244 = v227;
    uint64_t v245 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v118, v194, (uint64_t)&v246, (uint64_t)&v244);
    objc_msgSend_endEncoding(v118, v195, v196, v197);
    objc_msgSend_commit(v117, v198, v199, v200);
    uint64_t v72 = v232;
    if (v252) {
      FigMetalDecRef();
    }
    id v201 = v252;
    id v252 = v158;

    --v116;
    uint64_t v83 = v229;
    if (v229 + v116 + 1 <= 0) {
      goto LABEL_35;
    }
  }
  uint64_t v139 = v223[82];
  if (v139 && v72[82])
  {
    objc_msgSend_setTexture_atIndex_(v128, v138, v139, 0);
    objc_msgSend_setTexture_atIndex_(v128, v140, 0, 1);
    objc_msgSend_setTexture_atIndex_(v128, v141, v72[82], 4);
    objc_msgSend_setTexture_atIndex_(v128, v142, 0, 5);
    goto LABEL_17;
  }
LABEL_50:
  FigDebugAssert3();
  uint64_t v202 = FigSignalErrorAt();
  v158 = 0;
LABEL_51:
  v24 = (void **)v223;
  id v28 = v219;
LABEL_52:
  v79 = v241;
LABEL_38:
  v203 = (int *)MEMORY[0x263F00E10];
  int v204 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v204 = *v203;
  }
  if (v204)
  {
    v205 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v113, v114, v115);
    objc_msgSend_commandBuffer(v205, v206, v207, v208);
    v210 = v209 = v79;

    objc_msgSend_setLabel_(v210, v211, @"KTRACE_END_MTL", v212);
    v243[0] = MEMORY[0x263EF8330];
    v243[1] = 3221225472;
    v243[2] = sub_262FAA674;
    v243[3] = &unk_2655C32E8;
    v243[5] = 0;
    v243[6] = 0;
    v243[4] = 2;
    objc_msgSend_addCompletedHandler_(v210, v213, (uint64_t)v243, v214);
    objc_msgSend_commit(v210, v215, v216, v217);

    v79 = v209;
  }

  return v202;
}

- (uint64_t)generateNoiseMap:(__n128)a3 outputNoiseMapChroma:(__n128)a4 noiseDivisorTex:(__n128)a5 lscGainsTex:(__n128)a6 evm:(__n128)a7 ev0:(__n128)a8 evmHomography:(__n128)a9 ev0Homography:(uint64_t)a10 evmProperties:(void *)a11 evmGreenTintAdjustmentParams:(void *)a12 ev0Properties:(void *)a13
{
  id v130 = a11;
  id v131 = a12;
  id v140 = a13;
  id v141 = a14;
  v23 = a15;
  uint64_t v27 = a16;
  id v28 = (int *)MEMORY[0x263F00E10];
  int v29 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v29 = *v28;
  }
  if (v29)
  {
    v30 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v24, v25, v26);
    uint64_t v34 = objc_msgSend_commandBuffer(v30, v31, v32, v33);

    objc_msgSend_setLabel_(v34, v35, @"KTRACE_START_MTL", v36);
    objc_msgSend_addCompletedHandler_(v34, v37, (uint64_t)&unk_270E340E8, v38);
    objc_msgSend_commit(v34, v39, v40, v41);
  }
  uint64_t v148 = 0;
  uint64_t v149 = 0;
  int v42 = a18[1].meta.ltmCurves.ltmLut.bytes[179];
  LODWORD(v148) = sub_262F98A00((uint64_t)&a17->meta.exposureParams, (uint64_t)&a18->meta.exposureParams, (uint64_t)a18);
  long long v43 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  v147[10] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  v147[11] = v43;
  long long v44 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  v147[6] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  v147[7] = v44;
  long long v45 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v147[8] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v147[9] = v45;
  long long v46 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  v147[2] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  v147[3] = v46;
  long long v47 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v147[4] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v147[5] = v47;
  long long v48 = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.version;
  v147[0] = *(_OWORD *)&a18[1].meta.ROI.size.height;
  v147[1] = v48;
  long long v49 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  long long v50 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  long long v51 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  v147[22] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  v147[23] = v49;
  long long v52 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  v147[24] = v50;
  v147[25] = v52;
  long long v53 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  long long v54 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  long long v55 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  v147[18] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  v147[19] = v53;
  v147[20] = v54;
  v147[21] = v51;
  long long v56 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  long long v57 = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  long long v58 = *(_OWORD *)&a17[1].meta.ROI.size.height;
  v147[14] = *(_OWORD *)&a17[1].meta.ltmCurves.ltmLut.version;
  v147[15] = v56;
  v147[16] = v57;
  v147[17] = v55;
  v147[12] = *(_OWORD *)&a18[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  v147[13] = v58;
  __n128 v150 = a5;
  __n128 v151 = a6;
  __n128 v152 = a7;
  __n128 v153 = a2;
  __n128 v154 = a3;
  __n128 v155 = a4;
  v158[3] = a8;
  v158[4] = a9;
  float v156 = a18->meta.exposureParams.exposure_time / a17->meta.exposureParams.exposure_time;
  if ((objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v59, (uint64_t)&v157, (uint64_t)&a18->meta.exposureParams) & 1) == 0)
  {
    FigDebugAssert3();
    uint64_t v114 = FigSignalErrorAt();
    v79 = v130;
    float v73 = v131;
    uint64_t v64 = v140;
    goto LABEL_16;
  }
  uint64_t v64 = v140;
  if ((objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v60, (uint64_t)v158, (uint64_t)&a17->meta.exposureParams) & 1) == 0)
  {
    FigDebugAssert3();
    uint64_t v114 = FigSignalErrorAt();
    v79 = v130;
    float v73 = v131;
    goto LABEL_16;
  }
  uint64_t v65 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v61, v62, v63);
  uint64_t v69 = objc_msgSend_commandBuffer(v65, v66, v67, v68);

  float v73 = v131;
  if (!v69)
  {
    FigDebugAssert3();
    uint64_t v114 = FigSignalErrorAt();
LABEL_28:
    v79 = v130;
    goto LABEL_16;
  }
  int v74 = objc_msgSend_computeCommandEncoder(v69, v70, v71, v72);
  if (!v74)
  {
    FigDebugAssert3();
    uint64_t v114 = FigSignalErrorAt();
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v76 = v74;
  objc_msgSend_setBytes_length_atIndex_(v74, v75, (uint64_t)v147, 688, 0);
  if (!v42)
  {
    objc_msgSend_setTexture_atIndex_(v76, v77, v27[42], 0);
    objc_msgSend_setTexture_atIndex_(v76, v85, v27[62], 1);
    objc_msgSend_setTexture_atIndex_(v76, v86, v23[42], 2);
    uint64_t v82 = 0;
    v79 = v130;
    objc_msgSend_setTexture_atIndex_(v76, v87, v23[62], 3);
LABEL_14:
    objc_msgSend_setTexture_atIndex_(v76, v84, (uint64_t)v141, 4);
    objc_msgSend_setTexture_atIndex_(v76, v88, (uint64_t)v140, 5);
    objc_msgSend_setTexture_atIndex_(v76, v89, (uint64_t)v79, 6);
    objc_msgSend_setTexture_atIndex_(v76, v90, (uint64_t)v131, 7);
    uint64_t v92 = objc_msgSend_getKernel_configFlags_(*(void **)(a1 + 16), v91, 1, v82);
    if (v92)
    {
      uint64_t v95 = (void *)v92;
      objc_msgSend_setComputePipelineState_(v76, v93, v92, v94);
      uint64_t v99 = objc_msgSend_width((void *)v27[42], v96, v97, v98);
      uint64_t v103 = objc_msgSend_height((void *)v27[42], v100, v101, v102);
      v146[0] = v99;
      v146[1] = v103;
      v146[2] = 1;
      long long v144 = xmmword_263117D20;
      uint64_t v145 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v76, v104, (uint64_t)v146, (uint64_t)&v144);
      objc_msgSend_endEncoding(v76, v105, v106, v107);
      objc_msgSend_commit(v69, v108, v109, v110);

      uint64_t v114 = 0;
      goto LABEL_16;
    }
    goto LABEL_29;
  }
  uint64_t v78 = v27[82];
  if (!v78)
  {
    FigDebugAssert3();
    uint64_t v114 = FigSignalErrorAt();

    goto LABEL_27;
  }
  v79 = v130;
  if (v23[82])
  {
    objc_msgSend_setTexture_atIndex_(v76, v77, v78, 0);
    objc_msgSend_setTexture_atIndex_(v76, v80, 0, 1);
    objc_msgSend_setTexture_atIndex_(v76, v81, v23[82], 2);
    uint64_t v82 = 8;
    objc_msgSend_setTexture_atIndex_(v76, v83, 0, 3);
    goto LABEL_14;
  }
LABEL_29:
  FigDebugAssert3();
  uint64_t v114 = FigSignalErrorAt();

LABEL_16:
  uint64_t v115 = (int *)MEMORY[0x263F00E10];
  int v116 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v116 = *v115;
  }
  if (v116)
  {
    v117 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v111, v112, v113);
    v121 = objc_msgSend_commandBuffer(v117, v118, v119, v120);

    objc_msgSend_setLabel_(v121, v122, @"KTRACE_END_MTL", v123);
    v143[0] = MEMORY[0x263EF8330];
    v143[1] = 3221225472;
    v143[2] = sub_262FAB050;
    v143[3] = &unk_2655C32E8;
    v143[5] = 0;
    v143[6] = 0;
    v143[4] = 3;
    objc_msgSend_addCompletedHandler_(v121, v124, (uint64_t)v143, v125);
    objc_msgSend_commit(v121, v126, v127, v128);
  }
  return v114;
}

- (uint64_t)generateNoiseMap:(__n128)a3 outputNoiseMapChroma:(__n128)a4 lscGainsTex:(uint64_t)a5 ev0:(void *)a6 ev0Homography:(void *)a7 ev0Properties:(void *)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21 = a9;
  long long v117 = 0u;
  memset(v118, 0, 144);
  long long v115 = 0u;
  long long v116 = 0u;
  __n128 v113 = 0u;
  long long v114 = 0u;
  __n128 v111 = 0u;
  __n128 v112 = 0u;
  long long v110 = 0u;
  memset(&v109[13], 0, 208);
  objc_super v22 = (int *)MEMORY[0x263F00E10];
  int v23 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v23 = *v22;
  }
  if (v23)
  {
    v24 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v18, v19, v20);
    id v28 = objc_msgSend_commandBuffer(v24, v25, v26, v27);

    objc_msgSend_setLabel_(v28, v29, @"KTRACE_START_MTL", v30);
    objc_msgSend_addCompletedHandler_(v28, v31, (uint64_t)&unk_270E34108, v32);
    objc_msgSend_commit(v28, v33, v34, v35);
  }
  uint64_t v36 = *(unsigned __int8 *)(a10 + 224147);
  LODWORD(v110) = 1065353216;
  long long v37 = *(_OWORD *)(a10 + 224128);
  v109[10] = *(_OWORD *)(a10 + 224112);
  v109[11] = v37;
  v109[12] = *(_OWORD *)(a10 + 224144);
  long long v38 = *(_OWORD *)(a10 + 224064);
  v109[6] = *(_OWORD *)(a10 + 224048);
  v109[7] = v38;
  long long v39 = *(_OWORD *)(a10 + 224096);
  v109[8] = *(_OWORD *)(a10 + 224080);
  v109[9] = v39;
  long long v40 = *(_OWORD *)(a10 + 224000);
  v109[2] = *(_OWORD *)(a10 + 223984);
  v109[3] = v40;
  long long v41 = *(_OWORD *)(a10 + 224032);
  v109[4] = *(_OWORD *)(a10 + 224016);
  v109[5] = v41;
  long long v42 = *(_OWORD *)(a10 + 223968);
  v109[0] = *(_OWORD *)(a10 + 223952);
  v109[1] = v42;
  __n128 v111 = a2;
  __n128 v112 = a3;
  __n128 v113 = a4;
  LODWORD(v117) = 1065353216;
  if ((objc_msgSend_fillRawNoiseModelParameters_exposureParams_(DeepFusionCommon, v18, (uint64_t)v118, a10 + 16) & 1) != 0&& (objc_msgSend_commandQueue(*(void **)(a1 + 8), v43, v44, v45), long long v46 = objc_claimAutoreleasedReturnValue(), objc_msgSend_commandBuffer(v46, v47, v48, v49), v50 = objc_claimAutoreleasedReturnValue(), v46, v50))
  {
    long long v54 = objc_msgSend_computeCommandEncoder(v50, v51, v52, v53);
    if (v54)
    {
      long long v56 = v54;
      objc_msgSend_setBytes_length_atIndex_(v54, v55, (uint64_t)v109, 688, 0);
      if (v36)
      {
        uint64_t v58 = v21[82];
        if (!v58) {
          goto LABEL_22;
        }
        objc_msgSend_setTexture_atIndex_(v56, v57, v58, 0);
        uint64_t v36 = 8;
        objc_msgSend_setTexture_atIndex_(v56, v59, 0, 1);
      }
      else
      {
        objc_msgSend_setTexture_atIndex_(v56, v57, v21[42], 0);
        objc_msgSend_setTexture_atIndex_(v56, v61, v21[62], 1);
      }
      objc_msgSend_setTexture_atIndex_(v56, v60, (uint64_t)v17, 2);
      objc_msgSend_setTexture_atIndex_(v56, v62, (uint64_t)v15, 3);
      objc_msgSend_setTexture_atIndex_(v56, v63, (uint64_t)v16, 4);
      uint64_t v65 = objc_msgSend_getKernel_configFlags_(*(void **)(a1 + 16), v64, 2, v36);
      if (v65)
      {
        uint64_t v68 = (void *)v65;
        objc_msgSend_setComputePipelineState_(v56, v66, v65, v67);
        uint64_t v72 = objc_msgSend_width((void *)v21[42], v69, v70, v71);
        uint64_t v76 = objc_msgSend_height((void *)v21[42], v73, v74, v75);
        v108[0] = v72;
        v108[1] = v76;
        v108[2] = 1;
        long long v106 = xmmword_263117D20;
        uint64_t v107 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v56, v77, (uint64_t)v108, (uint64_t)&v106);
        objc_msgSend_endEncoding(v56, v78, v79, v80);
        objc_msgSend_commit(v50, v81, v82, v83);

        uint64_t v87 = 0;
LABEL_14:
        objc_super v22 = (int *)MEMORY[0x263F00E10];
        goto LABEL_15;
      }
LABEL_22:
      FigDebugAssert3();
      uint64_t v87 = FigSignalErrorAt();

      goto LABEL_14;
    }
    FigDebugAssert3();
    uint64_t v87 = FigSignalErrorAt();
  }
  else
  {
    FigDebugAssert3();
    uint64_t v87 = FigSignalErrorAt();
  }
LABEL_15:
  int v88 = *v22;
  if (*v22 == 1)
  {
    kdebug_trace();
    int v88 = *v22;
  }
  if (v88)
  {
    uint64_t v89 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v84, v85, v86);
    uint64_t v93 = objc_msgSend_commandBuffer(v89, v90, v91, v92);

    objc_msgSend_setLabel_(v93, v94, @"KTRACE_END_MTL", v95);
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = sub_262FAB7F8;
    v105[3] = &unk_2655C32E8;
    v105[5] = 0;
    v105[6] = 0;
    v105[4] = 4;
    objc_msgSend_addCompletedHandler_(v93, v96, (uint64_t)v105, v97);
    objc_msgSend_commit(v93, v98, v99, v100);
  }
  return v87;
}

- (int)_doColorConvertEv0ToOutput:(id)a3 ev0:(id)a4 ev0Properties:(const frameProperties_t *)a5 srPlist:(id)a6 intermediateMetadata:(id)a7
{
  v12 = (uint64_t *)a3;
  uint64_t v13 = (uint64_t *)a4;
  uint64_t v14 = (uint64_t *)a6;
  id v18 = a7;
  uint64_t v19 = (int *)MEMORY[0x263F00E10];
  int v20 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v20 = *v19;
  }
  if (v20)
  {
    v21 = objc_msgSend_commandQueue(self->_metal, v15, v16, v17);
    uint64_t v25 = objc_msgSend_commandBuffer(v21, v22, v23, v24);

    objc_msgSend_setLabel_(v25, v26, @"KTRACE_START_MTL", v27);
    objc_msgSend_addCompletedHandler_(v25, v28, (uint64_t)&unk_270E34128, v29);
    objc_msgSend_commit(v25, v30, v31, v32);
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  if (!v12) {
    goto LABEL_21;
  }
  if (!v13) {
    goto LABEL_21;
  }
  int v33 = a5[1].meta.ltmCurves.ltmLut.bytes[179];
  long long v152 = 0uLL;
  *(_OWORD *)__n128 v153 = 0uLL;
  long long v150 = 0uLL;
  long long v151 = 0uLL;
  long long v148 = 0uLL;
  long long v149 = 0uLL;
  long long v146 = 0uLL;
  long long v147 = 0uLL;
  long long v144 = 0uLL;
  long long v145 = 0uLL;
  long long v142 = 0uLL;
  long long v143 = 0uLL;
  long long v140 = 0uLL;
  long long v141 = 0uLL;
  long long v138 = 0uLL;
  long long v139 = 0uLL;
  long long v136 = 0uLL;
  long long v137 = 0uLL;
  long long v134 = 0uLL;
  long long v135 = 0uLL;
  long long v132 = 0uLL;
  long long v133 = 0uLL;
  long long v130 = 0uLL;
  long long v131 = 0uLL;
  long long v128 = 0uLL;
  long long v129 = 0uLL;
  long long v126 = 0uLL;
  long long v127 = 0uLL;
  long long v124 = 0uLL;
  long long v125 = 0uLL;
  long long v34 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid;
  long long v113 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding;
  long long v114 = v34;
  long long v35 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows;
  long long v117 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid;
  long long v118 = v35;
  long long v36 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights;
  long long v115 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows;
  long long v116 = v36;
  long long v37 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid;
  long long v122 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights;
  long long v123 = v37;
  long long v38 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows;
  long long v39 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid;
  long long v119 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights;
  long long v120 = v39;
  long long v121 = v38;
  long long v40 = *(_OWORD *)&a5[1].meta.ltmCurves.ltmLut.version;
  long long v111 = *(_OWORD *)&a5[1].meta.ROI.size.height;
  long long v112 = v40;
  objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v15, (uint64_t)&a5->meta.exposureParams, v14[7]);
  v153[0] = v41;
  uint64_t v45 = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v44);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v46, (uint64_t)v45, @"syntheticReferencePedestal");

  long long v50 = objc_msgSend_commandQueue(self->_metal, v47, v48, v49);
  long long v54 = objc_msgSend_commandBuffer(v50, v51, v52, v53);

  if (v54)
  {
    uint64_t v58 = objc_msgSend_computeCommandEncoder(v54, v55, v56, v57);
    if (v58)
    {
      long long v60 = v58;
      objc_msgSend_setBytes_length_atIndex_(v58, v59, (uint64_t)&v111, 688, 0);
      if (v33)
      {
        uint64_t v62 = v13[82];
        if (!v62) {
          goto LABEL_23;
        }
        objc_msgSend_setTexture_atIndex_(v60, v61, v62, 0);
        int v63 = 8;
        objc_msgSend_setTexture_atIndex_(v60, v64, 0, 1);
      }
      else
      {
        objc_msgSend_setTexture_atIndex_(v60, v61, v13[42], 0);
        int v63 = 0;
        objc_msgSend_setTexture_atIndex_(v60, v66, v13[62], 1);
      }
      objc_msgSend_setTexture_atIndex_(v60, v65, v12[2], 2);
      objc_msgSend_setTexture_atIndex_(v60, v67, v12[3], 3);
      *(float *)&double v68 = v153[0];
      uint64_t v70 = objc_msgSend_getKernel_configFlags_(self->_shaders, v69, 3, v63 | (4 * (v153[0] != 0.0)), v68);
      if (v70)
      {
        float v73 = (void *)v70;
        objc_msgSend_setComputePipelineState_(v60, v71, v70, v72);
        uint64_t v77 = objc_msgSend_width((void *)v13[42], v74, v75, v76);
        uint64_t v81 = objc_msgSend_height((void *)v13[42], v78, v79, v80);
        v110[0] = v77;
        v110[1] = v81;
        v110[2] = 1;
        long long v108 = xmmword_263117D20;
        uint64_t v109 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v60, v82, (uint64_t)v110, (uint64_t)&v108);
        objc_msgSend_endEncoding(v60, v83, v84, v85);
        objc_msgSend_commit(v54, v86, v87, v88);

        int v92 = 0;
LABEL_15:
        uint64_t v19 = (int *)MEMORY[0x263F00E10];
        goto LABEL_16;
      }
LABEL_23:
      FigDebugAssert3();
      int v92 = FigSignalErrorAt();

      goto LABEL_15;
    }
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
  }
  else
  {
LABEL_21:
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
  }
LABEL_16:
  int v93 = *v19;
  if (*v19 == 1)
  {
    kdebug_trace();
    int v93 = *v19;
  }
  if (v93)
  {
    uint64_t v94 = objc_msgSend_commandQueue(self->_metal, v89, v90, v91);
    uint64_t v98 = objc_msgSend_commandBuffer(v94, v95, v96, v97);

    objc_msgSend_setLabel_(v98, v99, @"KTRACE_END_MTL", v100);
    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = sub_262FAC050;
    v107[3] = &unk_2655C32E8;
    v107[5] = 0;
    v107[6] = 0;
    v107[4] = 5;
    objc_msgSend_addCompletedHandler_(v98, v101, (uint64_t)v107, v102);
    objc_msgSend_commit(v98, v103, v104, v105);
  }
  return v92;
}

- (int)startDetectorsWithGrayGhost:(id)a3 motionDetection:(id)a4 evm:(id)a5 ev0:(id)a6 evmProperties:(const frameProperties_t *)a7 ev0Properties:(const frameProperties_t *)a8 nrfPlist:(id)a9
{
  id v15 = (unsigned int *)a3;
  id v16 = a4;
  long long v35 = (uint64_t *)a5;
  uint64_t v17 = a6;
  id v18 = (id *)a9;
  uint64_t v19 = v18;
  self->_syntheticReferenceMode = 0;
  self->_useMotionDetector = 0;
  long long v34 = v15;
  if (!v15) {
    goto LABEL_19;
  }
  if (!v16 || !v35 || !v17 || !a7 || !a8 || !v18)
  {
    FigDebugAssert3();
    int started = FigSignalErrorAt();
    id v15 = 0;
LABEL_20:
    v21 = 0;
    objc_super v22 = 0;
    goto LABEL_16;
  }
  int v20 = (unsigned int *)v18[7];
  id v15 = v20;
  if (!v20)
  {
LABEL_19:
    FigDebugAssert3();
    int started = FigSignalErrorAt();
    goto LABEL_20;
  }
  v36[0] = v20[9];
  v36[1] = v20[8];
  v36[2] = v20[10];
  v21 = malloc_type_malloc(0x36BE0uLL, 0x1020040DF6BF6F3uLL);
  if (!v21)
  {
    FigDebugAssert3();
    objc_super v22 = 0;
LABEL_23:
    int started = -12786;
    goto LABEL_16;
  }
  objc_super v22 = malloc_type_malloc(0x36BE0uLL, 0x1020040DF6BF6F3uLL);
  if (!v22)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  memcpy(v21, a7, 0x36BE0uLL);
  memcpy(v22, a8, 0x36BE0uLL);
  uint64_t v23 = MEMORY[0x263EF89A0];
  long long v24 = *MEMORY[0x263EF89A0];
  long long v25 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  v21[13993] = *MEMORY[0x263EF89A0];
  v21[13994] = v25;
  long long v26 = *(_OWORD *)(v23 + 32);
  v21[13995] = v26;
  v22[13993] = v24;
  v22[13994] = v25;
  v22[13995] = v26;
  int hasChromaBias_atBand_params = objc_msgSend_runGrayGhostDetection_ev0Bands_evmProperties_ev0Properties_hasChromaBias_atBand_params_(v34, v27, (uint64_t)v35, (uint64_t)v17, v21, v22, 0, v15[6], v36);
  if (hasChromaBias_atBand_params)
  {
    int started = hasChromaBias_atBand_params;
LABEL_25:
    FigDebugAssert3();
    goto LABEL_16;
  }
  float v30 = a7->meta.exposureParams.exposure_time * a7->meta.exposureParams.gain;
  BOOL v31 = v30 <= (float)(*((float *)v15 + 12) / 0.98) && v30 >= (float)(*((float *)v15 + 13) * 0.98);
  self->_useMotionDetector = v31;
  int started = objc_msgSend_startMotionDetection_evm_ev0_evmProperties_ev0Properties_(v16, v29, (uint64_t)v19, v35[43], v17[43], v21, v22);
  if (started) {
    goto LABEL_25;
  }
LABEL_16:
  free(v21);
  free(v22);

  return started;
}

- (int)collectDetectorsResultsWithGrayGhost:(id)a3 motionDetection:(id)a4 nrfPlist:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (id *)a5;
  v11 = v10;
  if (v8 && v9 && v10 && (v12 = (float *)v10[7]) != 0)
  {
    id v16 = v12;
    objc_msgSend_getGrayGhostResultSync(v8, v13, v14, v15);
    float v18 = v17;
    objc_msgSend_getMotionDetectionResultSync(v9, v19, v20, v21);
    BOOL v23 = !self->_useMotionDetector || v22 <= v16[11];
    if (v18 > v16[7] || !v23) {
      int v25 = 2;
    }
    else {
      int v25 = 1;
    }
    self->_syntheticReferenceMode = v25;

    int v26 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)getSyntheticReferenceMode
{
  return self->_syntheticReferenceMode;
}

- (uint64_t)doSyntheticReference:(double)a3 noiseDivisorOutputTex:(double)a4 lscGainsTex:(double)a5 evm:(double)a6 ev0:(double)a7 evmHomography:(double)a8 ev0Homography:(double)a9 evmProperties:(uint64_t)a10 evmGreenTintAdjustment:(void *)a11 ev0Properties:(void *)a12 nrfPlist:(void *)a13 intermediateMetadata:(void *)a14
{
  int v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  uint64_t v29 = a15;
  float v30 = (id *)a18;
  id v75 = a19;
  uint64_t v78 = v25;
  if (v28)
  {
    unint64_t v34 = *(void *)(a1 + 24);
    if (v34 > v28[2] || !*(_DWORD *)(a1 + 32)) {
      goto LABEL_36;
    }
  }
  else
  {
    unint64_t v34 = *(void *)(a1 + 24);
  }
  if (v34 > v29[2]
    || !v25
    || (uint64_t v35 = objc_msgSend_width(v26, v31, v32, v33), objc_msgSend_width(v25[2], v36, v37, v38) != 2 * v35)
    || (uint64_t v42 = objc_msgSend_height(v26, v39, v40, v41), objc_msgSend_height(v25[2], v43, v44, v45) != 2 * v42)
    || !v27)
  {
LABEL_36:
    FigDebugAssert3();
    uint64_t v59 = FigSignalErrorAt();
LABEL_41:
    uint64_t v53 = v75;
    goto LABEL_28;
  }
  uint64_t v77 = (uint64_t)v26;
  id v46 = v30[7];
  if (!v46)
  {
    FigDebugAssert3();
    uint64_t v59 = FigSignalErrorAt();
LABEL_38:
    id v26 = (id)v77;
    goto LABEL_41;
  }
  uint64_t v49 = v46;
  if (LODWORD(a17[1].meta.ROI.origin.y) != 2 || a17[1].meta.ltmCurves.ltmLut.bytes[179] && !*((void *)v29 + 82))
  {
    FigDebugAssert3();
    uint64_t v59 = FigSignalErrorAt();

    goto LABEL_38;
  }
  id v76 = v27;
  if (v28)
  {
    if (*(_DWORD *)(a16 + 223936) != 2)
    {
      FigDebugAssert3();
      uint64_t v59 = FigSignalErrorAt();

      id v26 = (id)v77;
      goto LABEL_41;
    }
    v66 = v30;
    long long v50 = v29;
    if (*(unsigned char *)(a16 + 224147) && (!*((void *)v28 + 82) || !a17[1].meta.ltmCurves.ltmLut.bytes[179]))
    {
      FigDebugAssert3();
      uint64_t v59 = FigSignalErrorAt();

      id v26 = (id)v77;
      float v30 = v66;
      goto LABEL_41;
    }
    int v51 = *(_DWORD *)(a1 + 32);
    uint64_t v52 = objc_msgSend_numberWithBool_(NSNumber, v47, v51 != 1, v48);
    uint64_t v53 = v75;
    objc_msgSend_setObject_forKeyedSubscript_(v75, v54, (uint64_t)v52, @"DSR");

    if (v51 == 1)
    {
      uint64_t v29 = v50;
      uint64_t v62 = objc_msgSend__doHighlightRecovery_noiseDivisorOutputTex_evm_ev0_evmHomography_ev0Homography_evmProperties_evmGreenTintAdjustmentParams_ev0Properties_srPlist_intermediateMetadata_((void *)a1, v55, (uint64_t)v78, v77, v28, v50, a16, a17, a2, a3, a4, a5, a6, a7, a8, a9, v49, v75);
      float v30 = v66;
      if (v62)
      {
        uint64_t v59 = v62;
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v29 = v50;
      uint64_t v56 = objc_msgSend__doDeepShadowRecovery_noiseDivisorOutputTex_lscGainsTex_evm_ev0_evmHomography_ev0Homography_evmProperties_evmGreenTintAdjustmentParams_ev0Properties_srPlist_intermediateMetadata_((void *)a1, v55, (uint64_t)v78, v77, v76, v28, v50, a16, a2, a3, a4, a5, a6, a7, a8, a9, a17, v49, v75);
      float v30 = v66;
      if (v56)
      {
        uint64_t v59 = v56;
LABEL_43:
        FigDebugAssert3();

        goto LABEL_27;
      }
    }
  }
  else
  {
    uint64_t v60 = (uint64_t)v25;
    uint64_t v53 = v75;
    uint64_t v61 = objc_msgSend__doColorConvertEv0ToOutput_ev0_ev0Properties_srPlist_intermediateMetadata_((void *)a1, v47, v60, (uint64_t)v29, a17, v46, v75);
    if (v61)
    {
      uint64_t v59 = v61;
      goto LABEL_43;
    }
  }
  int v63 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v57, *(unsigned int *)(a1 + 32), v58);
  objc_msgSend_setObject_forKeyedSubscript_(v53, v64, (uint64_t)v63, @"Mode");

  uint64_t v59 = 0;
LABEL_27:
  id v27 = v76;
  id v26 = (id)v77;
LABEL_28:

  return v59;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end