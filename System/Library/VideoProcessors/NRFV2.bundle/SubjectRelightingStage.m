@interface SubjectRelightingStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)mitigationNeeded;
- (SubjectRelightingStage)initWithMetalContext:(id)a3;
- (float)curveParameter;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5;
- (int)runSRLForLivePhotosWithInputBuffer:(__CVBuffer *)a3 skinMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5 instanceMasks:(id)a6 instanceMaskConfidences:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 exifOrientation:(int)a12 srlV2Plist:(id)a13;
- (int)runSubjectRelightingVersion:(id)a3 toneMap:(id)a4 luma:(id)a5 chroma:(id)a6 ltmChroma:(id)a7 skinMask:(id)a8 personMask:(id)a9 instanceMask0:(id)a10 instanceMask1:(id)a11 instanceMask2:(id)a12 instanceMask3:(id)a13 gammaCurve:(id)a14 instanceMaskConfidences:(id)a15 skinToneClassification:(id)a16 validROI:(CGRect)a17 expBias:(float)a18 faceExpRatio:(float)a19 exifOrientation:(int)a20 numFacesISPDetected:(unint64_t)a21 faceBoundingBoxesFromISP:(id)a22[10] isChromaGainAdjusted:(BOOL)a23 inputIsLinear:(BOOL)a24 chromaBias:(float)a25 srlV2Plist:(id *)a26 mstmParams:(id)a27 mstmSRLParams:(id)a28 blackPoint:(id)a29 playBackCurve:(id)a30;
- (unsigned)getSRLStatus;
- (void)reset;
@end

@implementation SubjectRelightingStage

- (SubjectRelightingStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)SubjectRelightingStage;
  v6 = [(SubjectRelightingStage *)&v27 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v8 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_label_(self, v7, 8460, 0, @"srlV2_Global_Stats");
  srlV2GlobalStatsBuffer = self->_srlV2GlobalStatsBuffer;
  self->_srlV2GlobalStatsBuffer = v8;

  if (!self->_srlV2GlobalStatsBuffer) {
    goto LABEL_11;
  }
  v11 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_label_(self, v10, 271680, 0, @"srlV2_Face_Stats");
  srlV2FaceStatsBuffer = self->_srlV2FaceStatsBuffer;
  self->_srlV2FaceStatsBuffer = v11;

  if (!self->_srlV2FaceStatsBuffer) {
    goto LABEL_11;
  }
  v14 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_label_(self, v13, 84, 0, @"srlV2_Rendering_Params");
  srlV2CoeffsBuffer = self->_srlV2CoeffsBuffer;
  self->_srlV2CoeffsBuffer = v14;

  if (!self->_srlV2CoeffsBuffer) {
    goto LABEL_11;
  }
  v19 = objc_msgSend_sharedInstance(SubjectRelightingShared, v16, v17, v18);
  objc_msgSend_getShaders_(v19, v20, (uint64_t)self->_metalContext, v21);
  v22 = (SubjectRelightingShaders *)objc_claimAutoreleasedReturnValue();
  shaders = self->_shaders;
  self->_shaders = v22;

  if (!self->_shaders)
  {
LABEL_11:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
    goto LABEL_8;
  }
  v24 = objc_alloc_init(SRLv2Plist);
  srlV2Plist = self->_srlV2Plist;
  self->_srlV2Plist = v24;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
  *(_WORD *)&self->_srlInLivePhotos = 1;
LABEL_8:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [SubjectRelightingShaders alloc];
    v7 = objc_msgSend_initWithMetalContext_(v4, v5, (uint64_t)v3, v6);
    if (v7)
    {
      int v8 = 0;
    }
    else
    {
      FigDebugAssert3();
      v7 = 0;
      int v8 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    v7 = 0;
  }

  return v8;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  v7 = objc_msgSend_device(self->_metalContext, a2, a3, a4, a5);
  v9 = objc_msgSend_newBufferWithLength_options_(v7, v8, a3, a4);

  objc_msgSend_setLabel_(v9, v10, 0, v11);
  return v9;
}

- (void)reset
{
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
}

- (unsigned)getSRLStatus
{
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  if (lastSRLCommandBuffer)
  {
    objc_msgSend_waitUntilCompleted(lastSRLCommandBuffer, a2, v2, v3);
    uint64_t v9 = objc_msgSend_contents(self->_srlV2CoeffsBuffer, v6, v7, v8);
    self->_curveParameter = *(float *)(v9 + 80);
    float v10 = *(float *)(v9 + 80);
    unsigned int v11 = vcvts_n_u32_f32(v10, 8uLL);
    if (v10 >= 0.5 || v10 <= 0.25)
    {
      unsigned int v13 = v11;
    }
    else
    {
      unsigned int v13 = v11 | 0x80000000;
      self->_mitigationNeeded = 1;
    }
  }
  else
  {
    unsigned int v13 = 0;
    unsigned int v11 = 0;
  }
  if (self->_srlInLivePhotos) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = v13;
  }
  v15 = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  return v14;
}

- (BOOL)mitigationNeeded
{
  objc_msgSend_getSRLStatus(self, a2, v2, v3);
  return self->_forceSrlOnInLivePhotos || self->_mitigationNeeded;
}

- (float)curveParameter
{
  objc_msgSend_getSRLStatus(self, a2, v2, v3);
  return self->_curveParameter;
}

- (int)runSRLForLivePhotosWithInputBuffer:(__CVBuffer *)a3 skinMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5 instanceMasks:(id)a6 instanceMaskConfidences:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 exifOrientation:(int)a12 srlV2Plist:(id)a13
{
  CGFloat height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  uint64_t v279 = *MEMORY[0x263EF8340];
  id v25 = a6;
  id v26 = a7;
  id v245 = a8;
  float v276 = a10;
  float v275 = a11;
  id v244 = a13;
  memset(v278, 0, sizeof(v278));
  v29 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v27, (uint64_t)a3, 10, 17, 0);
  if (v29
    && (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v28, (uint64_t)a3, 30, 17, 1), (v243 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v242 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v30, (uint64_t)a4, 10, 17, 0);
    if (v242)
    {
      v241 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v31, (uint64_t)a5, 25, 17, 0);
      if (v241)
      {
        uint64_t v239 = (uint64_t)v29;
        v240 = v26;
        long long v273 = 0u;
        long long v274 = 0u;
        long long v271 = 0u;
        long long v272 = 0u;
        id v32 = v25;
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v271, (uint64_t)v277, 16);
        if (v34)
        {
          uint64_t v36 = v34;
          int v37 = 0;
          uint64_t v38 = *(void *)v272;
          while (2)
          {
            uint64_t v39 = 0;
            int v40 = v37;
            v41 = (char *)v278 + 8 * v37;
            do
            {
              if (*(void *)v272 != v38) {
                objc_enumerationMutation(v32);
              }
              uint64_t v42 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v35, *(void *)(*((void *)&v271 + 1) + 8 * v39), 25, 17, 0);
              v43 = *(void **)&v41[8 * v39];
              *(void *)&v41[8 * v39] = v42;

              if (!v42)
              {
                FigDebugAssert3();

                v248 = 0;
                v171 = 0;
                v164 = 0;
                int v234 = 0;
                goto LABEL_46;
              }
              ++v39;
            }
            while (v36 != v39);
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v271, (uint64_t)v277, 16);
            int v37 = v40 + v39;
            if (v36) {
              continue;
            }
            break;
          }
        }

        if (objc_msgSend_readPlist_(self->_srlV2Plist, v44, (uint64_t)v244, v45))
        {
          FigDebugAssert3();
          v248 = 0;
          v171 = 0;
          v164 = 0;
          int v234 = -12780;
        }
        else
        {
          memset(&v270, 0, sizeof(v270));
          CGFloat v46 = sub_262F8A92C(a12, (uint64_t)&v270);
          size_t v50 = objc_msgSend_count(v245, v47, v48, v49, v46);
          float v246 = (float)(unint64_t)objc_msgSend_width(v29, v51, v52, v53);
          uint64_t v57 = objc_msgSend_height(v29, v54, v55, v56);
          v58.f32[0] = v246;
          v58.f32[1] = (float)(unint64_t)v57;
          float32x2_t v247 = v58;
          long long v261 = 0u;
          long long v264 = 0u;
          long long v265 = 0u;
          long long v266 = 0u;
          long long v267 = 0u;
          long long v268 = 0u;
          memset(v269, 0, sizeof(v269));
          v260[0] = v50;
          v260[1] = 6;
          *(void *)((char *)&v261 + 4) = 0x3F8000003F000000;
          float32x2_t v262 = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240((float64x2_t)*(unint64_t *)&x, y)), v58);
          v59.f64[0] = width;
          uint64_t v60 = 0;
          float32x2_t v263 = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240(v59, height)), v247);
          srlV2Plist = self->_srlV2Plist;
          *(float *)&long long v264 = srlV2Plist->maskThreshold;
          *(void *)((char *)&v264 + 4) = *(void *)&srlV2Plist->targetMedian_I;
          HIDWORD(v264) = LODWORD(srlV2Plist->targetMedian_III);
          long long v265 = *(_OWORD *)&srlV2Plist->targetMedian_IV;
          long long v266 = *(_OWORD *)&srlV2Plist->maxBoost_II;
          *(float *)&long long v267 = srlV2Plist->maxBoost_VI;
          *(void *)((char *)&v267 + 4) = *(void *)&srlV2Plist->minFaceSize;
          HIDWORD(v267) = LODWORD(srlV2Plist->minCurveBoost);
          long long v268 = *(_OWORD *)&srlV2Plist->maxTargetRatioDarkening;
          *(float *)v269 = srlV2Plist->faceExpDifThreshold;
          *(void *)((char *)&v269[1] + 4) = 0;
          *(void *)((char *)v269 + 4) = 0;
          BYTE4(v269[2]) = srlV2Plist->relightOnlyPersonMask;
          *(_WORD *)((char *)&v269[2] + 5) = 1;
          id v26 = v240;
          do
          {
            v64 = objc_msgSend_objectAtIndexedSubscript_(v240, v61, v60, v62);
            objc_msgSend_floatValue(v64, v65, v66, v67);
            if (v68 <= 0.95) {
              float v69 = 0.0;
            }
            else {
              float v69 = 1.0;
            }
            *((float *)v269 + v60 + 1) = v69;

            ++v60;
          }
          while (v60 != 4);
          v248 = (char *)malloc_type_calloc(v50, 0x30uLL, 0x100004064842E6AuLL);
          if (!v248)
          {
            FigDebugAssert3();
            v171 = 0;
            v164 = 0;
            int v234 = -12786;
            free(0);
            goto LABEL_48;
          }
          id v237 = v25;
          if (v50)
          {
            uint64_t v73 = 0;
            v74 = v248 + 16;
            do
            {
              size_t v75 = v50;
              v76 = objc_msgSend_objectAtIndexedSubscript_(v245, v70, v73, v72);
              v80 = objc_msgSend_faceAttributes(v76, v77, v78, v79);
              objc_msgSend_boundingBox(v76, v81, v82, v83);
              CGFloat v85 = v84;
              v89 = objc_msgSend_facemaskCategory(v80, v86, v87, v88);
              v93 = objc_msgSend_label(v89, v90, v91, v92);
              v97 = objc_msgSend_identifier(v93, v94, v95, v96);
              int isEqualToString = objc_msgSend_isEqualToString_(v97, v98, @"UNKNOWN_17_unknown0", v99);

              objc_msgSend_boundingBox(v76, v101, v102, v103);
              double v108 = v107;
              if (isEqualToString)
              {
                objc_msgSend_boundingBox(v76, v104, v105, v106);
                float v111 = v110;
                float v109 = v108;
                float v112 = (float)(v111 / 2.5) + v109;
                float v113 = 1.0;
                if (v112 < 1.0)
                {
                  objc_msgSend_boundingBox(v76, v104, v105, v106);
                  float v115 = v114;
                  objc_msgSend_boundingBox(v76, v116, v117, v118);
                  float v120 = v119;
                  float v113 = (float)(v120 / 2.5) + v115;
                }
                double v108 = v113;
              }
              objc_msgSend_boundingBox(v76, v104, v105, v106);
              CGFloat v122 = v121;
              objc_msgSend_boundingBox(v76, v123, v124, v125);
              CGAffineTransform v259 = v270;
              v280.origin.CGFloat x = v85;
              v280.origin.CGFloat y = v108;
              v280.size.CGFloat height = v122;
              CGRect v281 = CGRectApplyAffineTransform(v280, &v259);
              CGFloat v126 = v281.size.width;
              CGFloat v127 = v281.size.height;
              v128 = (float64_t *)&v248[48 * v73];
              float64_t *v128 = sub_262FF6240((float64x2_t)v281.origin, v281.origin.y);
              v129.f64[0] = v126;
              v128[1] = sub_262FF6240(v129, v127);
              v133 = objc_msgSend_yaw(v76, v130, v131, v132);
              objc_msgSend_floatValue(v133, v134, v135, v136);
              *((float *)v128 + 10) = (float)(v137 * 3.0) / 1.5708;

              v141 = objc_msgSend_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq(v80, v138, v139, v140);
              v145 = objc_msgSend_allLabelsWithConfidences(v141, v142, v143, v144);

              if (objc_msgSend_count(v145, v146, v147, v148))
              {
                unint64_t v151 = 0;
                do
                {
                  v152 = objc_msgSend_objectAtIndexedSubscript_(v145, v149, v151, v150);
                  objc_msgSend_confidence(v152, v153, v154, v155);
                  *(_DWORD *)&v74[4 * v151] = v156;

                  ++v151;
                }
                while (v151 < objc_msgSend_count(v145, v157, v158, v159));
              }

              ++v73;
              v74 += 48;
              size_t v50 = v75;
            }
            while (v73 != v75);
          }
          v160 = objc_msgSend_commandQueue(self->_metalContext, v70, v71, v72);
          v164 = objc_msgSend_commandBuffer(v160, v161, v162, v163);

          if (v164)
          {
            v171 = objc_msgSend_computeCommandEncoder(v164, v165, v166, v167);
            id v25 = v237;
            v29 = (void *)v239;
            id v26 = v240;
            if (!v171)
            {
              FigDebugAssert3();
              int v234 = FigSignalErrorAt();
              goto LABEL_47;
            }
            unint64_t v172 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_shaders->_srlV2GlobalHistogramLivePhotos, v168, v169, v170);
            unint64_t v176 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_shaders->_srlV2FaceHistogramLivePhotos, v173, v174, v175);
            uint64_t v180 = 40;
            if (v172 < v176) {
              uint64_t v180 = 32;
            }
            unint64_t v181 = objc_msgSend_maxTotalThreadsPerThreadgroup(*(void **)((char *)&self->_shaders->super.isa + v180), v177, v178, v179);
            float v182 = log2f((float)(v181 >> 6));
            unint64_t v183 = (unint64_t)exp2f(floorf(v182));
            objc_msgSend_setTexture_atIndex_(v171, v184, v239, 1);
            objc_msgSend_setTexture_atIndex_(v171, v185, (uint64_t)v243, 2);
            objc_msgSend_setTexture_atIndex_(v171, v186, (uint64_t)v242, 5);
            objc_msgSend_setTexture_atIndex_(v171, v187, (uint64_t)v241, 6);
            for (uint64_t i = 0; i != 4; ++i)
              objc_msgSend_setTexture_atIndex_(v171, v188, *((void *)v278 + i), i + 7);
            if (v183 >= 0x40) {
              unint64_t v183 = 64;
            }
            objc_msgSend_setBytes_length_atIndex_(v171, v188, (uint64_t)v260, 144, 0);
            objc_msgSend_setBytes_length_atIndex_(v171, v190, (uint64_t)v248, 48 * v50, 1);
            objc_msgSend_setBytes_length_atIndex_(v171, v191, (uint64_t)&v276, 4, 7);
            objc_msgSend_setBytes_length_atIndex_(v171, v192, (uint64_t)&v275, 4, 8);
            if ((unint64_t)objc_msgSend_length(self->_srlV2GlobalStatsBuffer, v193, v194, v195) >> 2 <= 0x842
              || (objc_msgSend_setBuffer_offset_atIndex_(v171, v196, (uint64_t)self->_srlV2GlobalStatsBuffer, 0, 2),
                  objc_msgSend_length(self->_srlV2FaceStatsBuffer, v197, v198, v199) < 16980 * v50)
              || (objc_msgSend_setBuffer_offset_atIndex_(v171, v200, (uint64_t)self->_srlV2FaceStatsBuffer, 0, 3),
                  (unint64_t)objc_msgSend_length(self->_srlV2CoeffsBuffer, v201, v202, v203) <= 0x53))
            {
              FigDebugAssert3();
              int v234 = -12780;
              goto LABEL_47;
            }
            objc_msgSend_setBuffer_offset_atIndex_(v171, v204, (uint64_t)self->_srlV2CoeffsBuffer, 0, 4);
            objc_msgSend_setComputePipelineState_(v171, v205, (uint64_t)self->_shaders->_srlV2GlobalHistogramLivePhotos, v206);
            int64x2_t v238 = vdupq_n_s64(1uLL);
            int64x2_t v257 = v238;
            uint64_t v258 = 1;
            v256[0] = 64;
            v256[1] = v183;
            v256[2] = 1;
            objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v171, v207, (uint64_t)&v257, (uint64_t)v256);
            objc_msgSend_setComputePipelineState_(v171, v208, (uint64_t)self->_shaders->_srlV2FaceHistogramLivePhotos, v209);
            v253[2] = 1;
            size_t v254 = v50;
            int64x2_t v255 = v238;
            v253[0] = 64;
            v253[1] = v183;
            objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v171, v210, (uint64_t)&v254, (uint64_t)v253);
            objc_msgSend_setComputePipelineState_(v171, v211, (uint64_t)self->_shaders->_srlV2CalcCoefficientsLivePhotos, v212);
            int64x2_t v251 = v238;
            uint64_t v252 = 1;
            int64x2_t v249 = v238;
            uint64_t v250 = 1;
            objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v171, v213, (uint64_t)&v251, (uint64_t)&v249);
            objc_msgSend_endEncoding(v171, v214, v215, v216);
            if (*MEMORY[0x263F00E10])
            {
              v220 = objc_msgSend_commandQueue(v164, v217, v218, v219);
              v224 = objc_msgSend_commandBuffer(v220, v221, v222, v223);

              objc_msgSend_setLabel_(v224, v225, @"KTRACE_MTLCMDBUF", v226);
              objc_msgSend_addCompletedHandler_(v224, v227, (uint64_t)&unk_270E33D48, v228);
              objc_msgSend_commit(v224, v229, v230, v231);
              objc_msgSend_addCompletedHandler_(v164, v232, (uint64_t)&unk_270E33D68, v233);
            }
            objc_msgSend_commit(v164, v217, v218, v219);
            objc_storeStrong((id *)&self->_lastSRLCommandBuffer, v164);
            goto LABEL_44;
          }
          FigDebugAssert3();
          int v234 = FigSignalErrorAt();
          v171 = 0;
          id v25 = v237;
        }
LABEL_46:
        v29 = (void *)v239;
        id v26 = v240;
        goto LABEL_47;
      }
      FigDebugAssert3();
      v241 = 0;
    }
    else
    {
      FigDebugAssert3();
      v241 = 0;
      v242 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v241 = 0;
    v242 = 0;
    v243 = 0;
  }
  v248 = 0;
  v171 = 0;
  v164 = 0;
LABEL_44:
  int v234 = 0;
LABEL_47:
  free(v248);
LABEL_48:
  for (uint64_t j = 24; j != -8; j -= 8)

  return v234;
}

- (int)runSubjectRelightingVersion:(id)a3 toneMap:(id)a4 luma:(id)a5 chroma:(id)a6 ltmChroma:(id)a7 skinMask:(id)a8 personMask:(id)a9 instanceMask0:(id)a10 instanceMask1:(id)a11 instanceMask2:(id)a12 instanceMask3:(id)a13 gammaCurve:(id)a14 instanceMaskConfidences:(id)a15 skinToneClassification:(id)a16 validROI:(CGRect)a17 expBias:(float)a18 faceExpRatio:(float)a19 exifOrientation:(int)a20 numFacesISPDetected:(unint64_t)a21 faceBoundingBoxesFromISP:(id)a22[10] isChromaGainAdjusted:(BOOL)a23 inputIsLinear:(BOOL)a24 chromaBias:(float)a25 srlV2Plist:(id *)a26 mstmParams:(id)a27 mstmSRLParams:(id)a28 blackPoint:(id)a29 playBackCurve:(id)a30
{
  CGFloat height = a17.size.height;
  CGFloat width = a17.size.width;
  CGFloat y = a17.origin.y;
  CGFloat x = a17.origin.x;
  id v41 = a4;
  id v280 = a5;
  id v42 = a6;
  id v278 = a7;
  id v43 = a8;
  id v44 = a9;
  id v45 = a10;
  id v46 = a11;
  id v47 = a12;
  id v48 = a13;
  id v49 = a15;
  id v285 = a16;
  float v311 = a19;
  v312[0] = a18;
  id v284 = a27;
  id v283 = a28;
  memset(&v310, 0, sizeof(v310));
  double v53 = sub_262F8A92C(a20, (uint64_t)&v310);
  v282 = v41;
  uint64_t v279 = v42;
  float v276 = v48;
  v277 = v47;
  if (!v41)
  {
    FigDebugAssert3();
    id v42 = 0;
    int v93 = -12780;
    v54 = v280;
    free(0);
    goto LABEL_73;
  }
  v54 = v280;
  if (!v280) {
    goto LABEL_78;
  }
  if (!v42)
  {
    FigDebugAssert3();
    v288 = 0;
LABEL_79:
    id v41 = 0;
    int v93 = -12780;
    goto LABEL_72;
  }
  if (!v43 || !v44 || !v45 || !v46 || !v47 || !v48)
  {
LABEL_78:
    FigDebugAssert3();
    v288 = 0;
    id v42 = 0;
    goto LABEL_79;
  }
  uint64_t v273 = (uint64_t)v44;
  uint64_t v274 = (uint64_t)v45;
  uint64_t v281 = (uint64_t)v43;
  uint64_t v55 = objc_msgSend_count(v285, v50, v51, v52, v53);
  size_t v59 = v55;
  if (a21) {
    BOOL v60 = v55 == 0;
  }
  else {
    BOOL v60 = 0;
  }
  char v61 = v60;
  if (v60)
  {
    size_t v59 = a21;
    if (!a22)
    {
      FigDebugAssert3();
      v288 = 0;
      id v42 = 0;
      id v41 = 0;
      int v93 = -12780;
      goto LABEL_87;
    }
  }
  if (!(v59 | a21) || a21 >= 0x11 && v59 > 0x10)
  {
    v288 = 0;
    id v42 = 0;
    id v41 = 0;
    int v93 = 0;
LABEL_87:
    id v45 = (id)v274;
    goto LABEL_72;
  }
  uint64_t v272 = (uint64_t)v46;
  float v286 = (float)(unint64_t)objc_msgSend_width(v280, v56, v57, v58);
  uint64_t v65 = objc_msgSend_height(v280, v62, v63, v64);
  v66.f32[0] = v286;
  v66.f32[1] = (float)(unint64_t)v65;
  float32x2_t v287 = v66;
  long long v304 = 0u;
  memset(v307, 0, sizeof(v307));
  int v309 = 0;
  v303[0] = v59;
  v303[1] = 6;
  LOBYTE(v304) = a24;
  *(void *)((char *)&v304 + 4) = LODWORD(a25) | 0x3F80000000000000;
  float32x2_t v305 = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240((float64x2_t)*(unint64_t *)&x, y)), v66);
  v67.f64[0] = width;
  uint64_t v68 = 0;
  v308[1] = 0;
  v308[0] = 0;
  float32x2_t v306 = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240(v67, height)), v287);
  v307[0] = LODWORD(a26->var0);
  *(_OWORD *)&v307[1] = *(_OWORD *)&a26->var10;
  *(_OWORD *)&v307[5] = *(_OWORD *)&a26->var14;
  *(_OWORD *)&v307[9] = *(_OWORD *)&a26->var18;
  *(_OWORD *)&v307[13] = *(_OWORD *)&a26->var1;
  *(_OWORD *)&v307[17] = *(_OWORD *)&a26->var5;
  LOBYTE(v309) = a26->var9;
  if (v284) {
    BOOL v71 = v283 == 0;
  }
  else {
    BOOL v71 = 1;
  }
  char v72 = v71;
  BYTE1(v309) = v72;
  BYTE2(v309) = v61;
  do
  {
    uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(v49, v69, v68, v70);
    objc_msgSend_floatValue(v73, v74, v75, v76);
    if (v77 <= 0.95) {
      float v78 = 0.0;
    }
    else {
      float v78 = 1.0;
    }
    *((float *)v308 + v68) = v78;

    ++v68;
  }
  while (v68 != 4);
  v288 = (char *)malloc_type_calloc(v59, 0x30uLL, 0x100004064842E6AuLL);
  if (v288)
  {
    if (v61)
    {
      if (v59)
      {
        p_size = &a22->var0.size;
        float v84 = 0.0;
        size_t v85 = v59;
        v86 = (float64_t *)v288;
        do
        {
          memset_pattern16(v86 + 2, &unk_2630177F0, 0x18uLL);
          v87.f64[0] = p_size[-1].width;
          float64_t v88 = p_size[-1].height;
          float64_t v89 = p_size->width;
          float64_t v90 = p_size->height;
          p_size = (CGSize *)((char *)p_size + 40);
          float64_t *v86 = sub_262FF6240(v87, v88);
          v91.f64[0] = v89;
          float64_t v92 = sub_262FF6240(v91, v90);
          v86[1] = v92;
          if (*(float *)&v92 <= *((float *)&v92 + 1)) {
            *(float *)&float64_t v92 = *((float *)&v92 + 1);
          }
          if (v84 < *(float *)&v92) {
            float v84 = *(float *)&v92;
          }
          *((_DWORD *)v86 + 10) = 1077936128;
          v86 += 6;
          --v85;
        }
        while (v85);
        double v82 = v84;
        if (v84 >= 0.35)
        {
          id v42 = 0;
          id v41 = 0;
          int v93 = 0;
LABEL_82:
          v54 = v280;
          goto LABEL_70;
        }
      }
    }
    else if (v59)
    {
      uint64_t v94 = 0;
      uint64_t v95 = v288 + 16;
      do
      {
        uint64_t v96 = objc_msgSend_objectAtIndexedSubscript_(v285, v79, v94, v81);
        v100 = objc_msgSend_faceAttributes(v96, v97, v98, v99);
        objc_msgSend_boundingBox(v96, v101, v102, v103);
        CGFloat v105 = v104;
        float v109 = objc_msgSend_facemaskCategory(v100, v106, v107, v108);
        float v113 = objc_msgSend_label(v109, v110, v111, v112);
        uint64_t v117 = objc_msgSend_identifier(v113, v114, v115, v116);
        int isEqualToString = objc_msgSend_isEqualToString_(v117, v118, @"UNKNOWN_17_unknown0", v119);

        objc_msgSend_boundingBox(v96, v121, v122, v123);
        double v128 = v127;
        if (isEqualToString)
        {
          objc_msgSend_boundingBox(v96, v124, v125, v126);
          float v131 = v130;
          float v129 = v128;
          float v132 = (float)(v131 / 2.5) + v129;
          float v133 = 1.0;
          if (v132 < 1.0)
          {
            objc_msgSend_boundingBox(v96, v124, v125, v126);
            float v135 = v134;
            objc_msgSend_boundingBox(v96, v136, v137, v138);
            float v140 = v139;
            float v133 = (float)(v140 / 2.5) + v135;
          }
          double v128 = v133;
        }
        objc_msgSend_boundingBox(v96, v124, v125, v126);
        CGFloat v142 = v141;
        objc_msgSend_boundingBox(v96, v143, v144, v145);
        CGAffineTransform v302 = v310;
        v313.origin.CGFloat x = v105;
        v313.origin.CGFloat y = v128;
        v313.size.CGFloat height = v142;
        CGRect v314 = CGRectApplyAffineTransform(v313, &v302);
        CGFloat v146 = v314.size.width;
        CGFloat v147 = v314.size.height;
        uint64_t v148 = (float64_t *)&v288[48 * v94];
        *uint64_t v148 = sub_262FF6240((float64x2_t)v314.origin, v314.origin.y);
        v149.f64[0] = v146;
        v148[1] = sub_262FF6240(v149, v147);
        v153 = objc_msgSend_yaw(v96, v150, v151, v152);
        objc_msgSend_floatValue(v153, v154, v155, v156);
        *((float *)v148 + 10) = (float)(v157 * 3.0) / 1.5708;

        v161 = objc_msgSend_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq(v100, v158, v159, v160);
        v165 = objc_msgSend_allLabelsWithConfidences(v161, v162, v163, v164);

        if (objc_msgSend_count(v165, v166, v167, v168))
        {
          unint64_t v171 = 0;
          do
          {
            unint64_t v172 = objc_msgSend_objectAtIndexedSubscript_(v165, v169, v171, v170);
            objc_msgSend_confidence(v172, v173, v174, v175);
            *(_DWORD *)&v95[4 * v171] = v176;

            ++v171;
          }
          while (v171 < objc_msgSend_count(v165, v177, v178, v179));
        }

        ++v94;
        v95 += 48;
      }
      while (v94 != v59);
    }
    uint64_t v180 = objc_msgSend_commandQueue(self->_metalContext, v79, v80, v81, v82);
    objc_msgSend_commandBuffer(v180, v181, v182, v183);
    id v41 = (id)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();
      id v42 = 0;
      goto LABEL_82;
    }
    objc_msgSend_computeCommandEncoder(v41, v184, v185, v186);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    v54 = v280;
    id v43 = (id)v281;
    id v46 = (id)v272;
    id v44 = (id)v273;
    if (!v42)
    {
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();
      id v45 = (id)v274;
      goto LABEL_72;
    }
    unint64_t v190 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_shaders->_srlV2GlobalHistogram, v187, v188, v189);
    unint64_t v194 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_shaders->_srlV2FaceHistogram, v191, v192, v193);
    uint64_t v198 = 16;
    if (v190 < v194) {
      uint64_t v198 = 8;
    }
    unint64_t v199 = objc_msgSend_maxTotalThreadsPerThreadgroup(*(void **)((char *)&self->_shaders->super.isa + v198), v195, v196, v197);
    float v200 = log2f((float)(v199 >> 6));
    float v202 = exp2f(floorf(v200));
    if ((unint64_t)v202 >= 0x40) {
      unint64_t v203 = 64;
    }
    else {
      unint64_t v203 = (unint64_t)v202;
    }
    objc_msgSend_setTexture_atIndex_(v42, v201, (uint64_t)v282, 0);
    objc_msgSend_setTexture_atIndex_(v42, v204, (uint64_t)v280, 1);
    objc_msgSend_setTexture_atIndex_(v42, v205, (uint64_t)v279, 2);
    if (a23) {
      objc_msgSend_setTexture_atIndex_(v42, v206, (uint64_t)v278, 4);
    }
    else {
      objc_msgSend_setTexture_atIndex_(v42, v206, (uint64_t)v278, 3);
    }
    objc_msgSend_setTexture_atIndex_(v42, v207, v281, 5);
    objc_msgSend_setTexture_atIndex_(v42, v208, v273, 6);
    objc_msgSend_setTexture_atIndex_(v42, v209, v274, 7);
    objc_msgSend_setTexture_atIndex_(v42, v210, v272, 8);
    objc_msgSend_setTexture_atIndex_(v42, v211, (uint64_t)v277, 9);
    objc_msgSend_setTexture_atIndex_(v42, v212, (uint64_t)v276, 10);
    objc_msgSend_setBytes_length_atIndex_(v42, v213, (uint64_t)v303, 144, 0);
    objc_msgSend_setBytes_length_atIndex_(v42, v214, (uint64_t)v288, 48 * v59, 1);
    objc_msgSend_setBytes_length_atIndex_(v42, v215, (uint64_t)v312, 4, 7);
    objc_msgSend_setBytes_length_atIndex_(v42, v216, (uint64_t)&v311, 4, 8);
    if ((unint64_t)objc_msgSend_length(self->_srlV2GlobalStatsBuffer, v217, v218, v219) >> 2 <= 0x842
      || (objc_msgSend_setBuffer_offset_atIndex_(v42, v220, (uint64_t)self->_srlV2GlobalStatsBuffer, 0, 2),
          objc_msgSend_length(self->_srlV2FaceStatsBuffer, v221, v222, v223) < 16980 * v59))
    {
      FigDebugAssert3();
      int v93 = -12780;
      id v45 = (id)v274;
      id v46 = (id)v272;
      id v43 = (id)v281;
      goto LABEL_72;
    }
    objc_msgSend_setBuffer_offset_atIndex_(v42, v224, (uint64_t)self->_srlV2FaceStatsBuffer, 0, 3);
    id v43 = (id)v281;
    if ((unint64_t)objc_msgSend_length(self->_srlV2CoeffsBuffer, v225, v226, v227) <= 0x53)
    {
      FigDebugAssert3();
      int v93 = -12780;
      goto LABEL_71;
    }
    objc_msgSend_setBuffer_offset_atIndex_(v42, v228, (uint64_t)self->_srlV2CoeffsBuffer, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(v42, v229, (uint64_t)v284, 0, 5);
    objc_msgSend_setBuffer_offset_atIndex_(v42, v230, (uint64_t)v283, 0, 6);
    objc_msgSend_setComputePipelineState_(v42, v231, (uint64_t)self->_shaders->_srlV2GlobalHistogram, v232);
    int64x2_t v271 = vdupq_n_s64(1uLL);
    int64x2_t v300 = v271;
    uint64_t v301 = 1;
    v299[0] = 64;
    v299[1] = v203;
    v299[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v42, v233, (uint64_t)&v300, (uint64_t)v299);
    objc_msgSend_setComputePipelineState_(v42, v234, (uint64_t)self->_shaders->_srlV2FaceHistogram, v235);
    v296[2] = 1;
    size_t v297 = v59;
    int64x2_t v298 = v271;
    v296[0] = 64;
    v296[1] = v203;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v42, v236, (uint64_t)&v297, (uint64_t)v296);
    objc_msgSend_setComputePipelineState_(v42, v237, (uint64_t)self->_shaders->_srlV2CalcCoefficients, v238);
    int64x2_t v294 = v271;
    uint64_t v295 = 1;
    int64x2_t v292 = v271;
    uint64_t v293 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v42, v239, (uint64_t)&v294, (uint64_t)&v292);
    objc_msgSend_setComputePipelineState_(v42, v240, (uint64_t)self->_shaders->_srlV2Apply, v241);
    objc_msgSend_setImageblockWidth_height_(v42, v242, 32, 32);
    v291[0] = (unint64_t)objc_msgSend_width(v282, v243, v244, v245) >> 1;
    v291[1] = (unint64_t)objc_msgSend_height(v282, v246, v247, v248) >> 1;
    v291[2] = 1;
    int64x2_t v289 = vdupq_n_s64(0x10uLL);
    uint64_t v290 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v42, v249, (uint64_t)v291, (uint64_t)&v289);
    objc_msgSend_endEncoding(v42, v250, v251, v252);
    if (*MEMORY[0x263F00E10])
    {
      v256 = objc_msgSend_commandQueue(v41, v253, v254, v255);
      v260 = objc_msgSend_commandBuffer(v256, v257, v258, v259);

      objc_msgSend_setLabel_(v260, v261, @"KTRACE_MTLCMDBUF", v262);
      objc_msgSend_addCompletedHandler_(v260, v263, (uint64_t)&unk_270E33D88, v264);
      objc_msgSend_commit(v260, v265, v266, v267);
      objc_msgSend_addCompletedHandler_(v41, v268, (uint64_t)&unk_270E33DA8, v269);
    }
    objc_msgSend_commit(v41, v253, v254, v255);
    objc_storeStrong((id *)&self->_lastSRLCommandBuffer, v41);
    int v93 = 0;
  }
  else
  {
    FigDebugAssert3();
    v288 = 0;
    id v42 = 0;
    id v41 = 0;
    int v93 = -12786;
  }
LABEL_70:
  id v43 = (id)v281;
  id v44 = (id)v273;
LABEL_71:
  id v45 = (id)v274;
  id v46 = (id)v272;
LABEL_72:
  free(v288);
LABEL_73:

  return v93;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSRLCommandBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2CoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2FaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2Plist, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end