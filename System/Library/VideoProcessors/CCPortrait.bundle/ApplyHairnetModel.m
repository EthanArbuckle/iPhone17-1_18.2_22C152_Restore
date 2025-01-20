@interface ApplyHairnetModel
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)apply:(id)a3 sdof:(id)a4 mask:(id)a5 alpha:(id)a6 chromaWeight:(float)a7 chromaBlurSigma:(float)a8 model:(id)a9;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation ApplyHairnetModel

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v504 = *MEMORY[0x263EF8340];
  id v432 = a3;
  id v8 = a4;
  id v9 = a5;
  v442 = v8;
  v11 = objc_msgSend_objectForKeyedSubscript_(v8, v10, @"fullWidth");
  uint64_t v14 = objc_msgSend_unsignedLongValue(v11, v12, v13);

  v16 = objc_msgSend_objectForKeyedSubscript_(v442, v15, @"fullHeight");
  uint64_t v19 = objc_msgSend_unsignedLongValue(v16, v17, v18);

  v21 = objc_msgSend_objectForKeyedSubscript_(v442, v20, @"tileSize");
  unint64_t v460 = objc_msgSend_unsignedLongValue(v21, v22, v23);

  v25 = objc_msgSend_objectForKeyedSubscript_(v442, v24, @"tileOverlap");
  uint64_t v28 = objc_msgSend_unsignedLongValue(v25, v26, v27);

  v30 = objc_msgSend_objectForKeyedSubscript_(v442, v29, @"chromaWeight");
  objc_msgSend_floatValue(v30, v31, v32);
  float v441 = v33;

  v35 = objc_msgSend_objectForKeyedSubscript_(v442, v34, @"chromaBlurSigma");
  objc_msgSend_floatValue(v35, v36, v37);
  float v39 = v38;

  id v464 = v9;
  v42 = objc_msgSend_metalTexture(v464, v40, v41);
  if (!v42) {
    sub_262E4ACB4();
  }

  v435 = objc_msgSend_objectForKeyedSubscript_(v442, v43, @"model");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v425 = objc_msgSend_objectAtIndexedSubscript_(v432, v45, 0, Current);
  v424 = objc_msgSend_objectAtIndexedSubscript_(v432, v46, 1);
  objc_msgSend_objectAtIndexedSubscript_(v432, v47, 2);
  id v458 = (id)objc_claimAutoreleasedReturnValue();
  v423 = objc_msgSend_objectAtIndexedSubscript_(v432, v48, 3);
  v450 = sub_262E28CDC(v425);
  v447 = sub_262E28CDC(v424);
  v449 = sub_262E28CDC(v458);
  v448 = sub_262E28CDC(v423);
  v51 = objc_msgSend_metalContext(v464, v49, v50);
  v54 = v51;
  if (v51)
  {
    id v462 = v51;
  }
  else
  {
    v55 = (void *)MEMORY[0x263F00628];
    v56 = objc_msgSend_metalContext(v464, v52, v53);
    v59 = objc_msgSend_internalCommandQueue(v56, v57, v58);
    uint64_t v60 = *MEMORY[0x263F00808];
    v500[0] = *MEMORY[0x263F00830];
    v500[1] = v60;
    v501[0] = @"HairnetProcessor";
    v501[1] = MEMORY[0x263EFFA80];
    v500[2] = *MEMORY[0x263F00818];
    v501[2] = &unk_270E1E6C0;
    v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)v501, v500, 3);
    objc_msgSend_contextWithMTLCommandQueue_options_(v55, v63, (uint64_t)v59, v62);
    id v462 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTimeGetCurrent();
  v499[1] = 0;
  v499[0] = 0;
  unint64_t v64 = v460 + 2 * v28;
  v498[1] = 0;
  v498[0] = 0;
  v497[1] = 0;
  v497[0] = 0;
  v496[1] = 0;
  v496[0] = 0;
  v495[1] = 0;
  v495[0] = 0;
  sub_262E28E3C(v64, (const char *)(3 * v64), (uint64_t)v499);
  sub_262E28E3C(v64, (const char *)(3 * v64), (uint64_t)v498);
  sub_262E28E3C(v64, (const char *)v64, (uint64_t)v497);
  sub_262E28E3C(v64, (const char *)v64, (uint64_t)v496);
  sub_262E28E3C(v64, (const char *)(3 * v64), (uint64_t)v495);
  v67 = objc_msgSend_metalTexture(v464, v65, v66);
  v70 = objc_msgSend_device(v67, v68, v69);
  v439 = sub_262E28F74(v70, (uint64_t)v499);

  v73 = objc_msgSend_metalTexture(v464, v71, v72);
  v76 = objc_msgSend_device(v73, v74, v75);
  v438 = sub_262E28F74(v76, (uint64_t)v498);

  v79 = objc_msgSend_metalTexture(v464, v77, v78);
  v82 = objc_msgSend_device(v79, v80, v81);
  v437 = sub_262E28F74(v82, (uint64_t)v497);

  v85 = objc_msgSend_metalTexture(v464, v83, v84);
  v88 = objc_msgSend_device(v85, v86, v87);
  v436 = sub_262E28F74(v88, (uint64_t)v496);

  v91 = objc_msgSend_metalTexture(v464, v89, v90);
  v94 = objc_msgSend_device(v91, v92, v93);
  v434 = sub_262E28F74(v94, (uint64_t)v495);

  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTime v95 = CFAbsoluteTimeGetCurrent();
  v433 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v96, @"addR", v95);
  v444 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v97, @"multiply_weight");
  v446 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v98, @"make_corrupt");
  v422 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v99, @"weights");
  v101 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v100, v64);
  v494[0] = v101;
  double v451 = (double)(unint64_t)v28;
  v104 = objc_msgSend_numberWithDouble_(NSNumber, v102, v103, v451 + v451);
  v494[1] = v104;
  v106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v105, (uint64_t)v494, 2);
  double v107 = (double)v64;
  v443 = objc_msgSend_applyWithExtent_arguments_(v422, v108, (uint64_t)v106, 0.0, 0.0, (double)v64, (double)v64);

  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTime v109 = CFAbsoluteTimeGetCurrent();
  v112 = objc_msgSend_internalCommandQueue(v462, v110, v111, v109);
  v427 = objc_msgSend_commandBuffer(v112, v113, v114);

  id v115 = objc_alloc(MEMORY[0x263F00670]);
  v118 = objc_msgSend_metalTexture(v464, v116, v117);
  v440 = objc_msgSend_initWithMTLTexture_commandBuffer_(v115, v119, (uint64_t)v118, v427);

  objc_msgSend_setFlipped_(v440, v120, 1);
  objc_msgSend_setColorSpace_(v440, v121, 0);
  v124 = objc_msgSend_componentAdd(MEMORY[0x263F005F8], v122, v123);
  objc_msgSend_setBlendKernel_(v440, v125, (uint64_t)v124);

  objc_msgSend_setBlendsInDestinationColorSpace_(v440, v126, 1);
  id v128 = (id)objc_msgSend_startTaskToClear_error_(v462, v127, (uint64_t)v440, 0);
  objc_msgSend_commit(v427, v129, v130);
  CFAbsoluteTimeGetCurrent();
  unint64_t v133 = v460;
  unint64_t v134 = v460 - 1;
  unint64_t v135 = v460 - 1 + v19;
  if (v460 <= v135)
  {
    int v445 = 0;
    uint64_t v428 = 0;
    unint64_t v421 = v134 + v14;
    unint64_t v419 = (v134 + v14) / v460;
    if (v419 <= 1) {
      uint64_t v138 = 1;
    }
    else {
      uint64_t v138 = (v134 + v14) / v460;
    }
    uint64_t v456 = v138;
    unint64_t v139 = v135 / v460;
    if (v139 <= 1) {
      unint64_t v139 = 1;
    }
    unint64_t v420 = v139;
    uint64_t v431 = *MEMORY[0x263F00900];
    uint64_t v430 = *MEMORY[0x263F009C8];
    unsigned int v429 = *MEMORY[0x263F008D0];
    double v426 = v39;
    while (v133 > v421)
    {
LABEL_87:
      ++v428;
      unint64_t v133 = v460;
      if (v428 == v420) {
        goto LABEL_6;
      }
    }
    uint64_t v466 = 0;
    double v457 = (double)(v428 * v133);
    double r2 = v457 - v451;
    while (1)
    {
      objc_msgSend_region(v464, v131, v132);
      v511.origin.double x = v140;
      v511.origin.double y = v141;
      v511.size.double width = v142;
      v511.size.double height = v143;
      double v144 = (double)(v466 * v460);
      v505.origin.double x = v144;
      v505.size.double width = (double)v460;
      v505.origin.double y = v457;
      v505.size.double height = (double)v460;
      if (CGRectIntersectsRect(v505, v511)) {
        break;
      }
LABEL_86:
      if (++v466 == v456) {
        goto LABEL_87;
      }
    }
    CFAbsoluteTimeGetCurrent();
    CGFloat v145 = v144 - v451;
    v148 = sub_262E290A8(v450, v146, v147, v144 - v451, r2, v107, v107);
    v461 = sub_262E290A8(v449, v149, v150, v144 - v451, r2, v107, v107);
    v459 = sub_262E290A8(v448, v151, v152, v144 - v451, r2, v107, v107);
    v463 = sub_262E290A8(v447, v153, v154, v144 - v451, r2, v107, v107);
    objc_msgSend_extent(v463, v155, v156);
    double v158 = v157;
    double v160 = v159;
    double v162 = v161;
    double v164 = v163;
    v493[0] = v463;
    v493[1] = v461;
    v166 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v165, (uint64_t)v493, 2);
    v168 = objc_msgSend_applyWithExtent_arguments_(v446, v167, (uint64_t)v166, v158, v160, v162, v164);

    CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v169 = CFAbsoluteTimeGetCurrent();
    objc_msgSend_region(v458, v170, v171, v169);
    v512.origin.double x = v145;
    v512.origin.double y = v457 - v451;
    v512.size.double width = v107;
    v512.size.double height = v107;
    CGRect v507 = CGRectIntersection(v506, v512);
    double x = v507.origin.x;
    double y = v507.origin.y;
    double width = v507.size.width;
    double height = v507.size.height;
    id v176 = v458;
    uint64_t v179 = objc_msgSend_baseAddress(v176, v177, v178);
    uint64_t v182 = objc_msgSend_bytesPerRow(v176, v180, v181);
    objc_msgSend_region(v176, v183, v184);
    double v186 = v185;
    objc_msgSend_region(v176, v187, v188);
    double v190 = v189;
    objc_msgSend_region(v176, v191, v192);
    uint64_t v194 = (uint64_t)height;
    if ((uint64_t)height < 1)
    {
      BOOL v200 = 0;
    }
    else
    {
      uint64_t v195 = 0;
      uint64_t v196 = v179 + (uint64_t)x - (uint64_t)v186 + ((uint64_t)v190 - v194 - (uint64_t)(y - v193)) * v182;
      uint64_t v197 = (uint64_t)width;
      do
      {
        if ((int)v197 < 1)
        {
          BOOL v200 = 0;
        }
        else
        {
          uint64_t v198 = 0;
          int v199 = 0;
          do
          {
            v199 |= ~*(_DWORD *)(v196 + v198);
            v198 += 4;
          }
          while ((int)v198 < (int)v197);
          BOOL v200 = v199 != 0;
        }
        if (++v195 >= v194) {
          break;
        }
        v196 += v182;
      }
      while (!v200);
    }
    double v203 = CFAbsoluteTimeGetCurrent();
    uint64_t v204 = ((_BYTE)v466 + (_BYTE)v428 * (_BYTE)v419) & 1;
    uint64_t v205 = v499[v204];
    uint64_t v206 = v498[v204];
    uint64_t v207 = v497[v204];
    uint64_t v208 = v495[v204];
    if (v205) {
      BOOL v209 = v206 == 0;
    }
    else {
      BOOL v209 = 1;
    }
    BOOL v210 = v209 || v207 == 0;
    uint64_t v453 = v496[v204];
    BOOL v211 = v210 || v496[v204] == 0;
    int v212 = !v211;
    if (v211)
    {
      v213 = uni_logger_api();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR)) {
        sub_262E4AF6C(v491, &v492, v213);
      }
    }
    if (!v208)
    {
      v214 = uni_logger_api();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR)) {
        sub_262E4AF28(v489, &v490, v214);
      }
    }
    if (v208) {
      int v215 = v212;
    }
    else {
      int v215 = 0;
    }
    objc_msgSend_region(v464, v201, v202, v203);
    objc_msgSend_region(v464, v216, v217);
    if ((v215 & v200 & 1) == 0)
    {
      id v246 = v463;
LABEL_85:
      CFAbsoluteTime v373 = CFAbsoluteTimeGetCurrent();
      objc_msgSend_extent(v246, v374, v375, v373);
      double v377 = v376;
      double v379 = v378;
      double v381 = v380;
      double v383 = v382;
      v471[0] = v246;
      v471[1] = v443;
      v385 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v384, (uint64_t)v471, 2);
      v387 = objc_msgSend_applyWithExtent_arguments_(v444, v386, (uint64_t)v385, v377, v379, v381, v383);

      CFAbsoluteTimeGetCurrent();
      CFAbsoluteTime v388 = CFAbsoluteTimeGetCurrent();
      v391 = objc_msgSend_internalCommandQueue(v462, v389, v390, v388);
      v394 = objc_msgSend_commandBuffer(v391, v392, v393);

      v397 = objc_msgSend_metalTexture(v464, v395, v396);
      id v398 = v462;
      id v399 = v387;
      v400 = (objc_class *)MEMORY[0x263F00670];
      id v401 = v394;
      id v402 = [v400 alloc];
      v404 = objc_msgSend_initWithMTLTexture_commandBuffer_(v402, v403, (uint64_t)v397, v401);

      objc_msgSend_setFlipped_(v404, v405, 1);
      objc_msgSend_setColorSpace_(v404, v406, 0);
      v409 = objc_msgSend_componentAdd(MEMORY[0x263F005F8], v407, v408);
      objc_msgSend_setBlendKernel_(v404, v410, (uint64_t)v409);

      objc_msgSend_setBlendsInDestinationColorSpace_(v404, v411, 1);
      objc_msgSend_extent(v399, v412, v413);
      id v415 = (id)objc_msgSend_startTaskToRender_fromRect_toDestination_atPoint_error_(v398, v414, (uint64_t)v399, v404, 0);

      objc_msgSend_commit(v401, v416, v417);
      CFAbsoluteTimeGetCurrent();

      goto LABEL_86;
    }
    CFAbsoluteTimeGetCurrent();
    v218 = sub_262E293B0(v148);
    v452 = sub_262E29158(v218);

    v219 = sub_262E293B0(v168);
    v455 = sub_262E29158(v219);

    CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v220 = CFAbsoluteTimeGetCurrent();
    v223 = objc_msgSend_internalCommandQueue(v462, v221, v222, v220);
    v226 = objc_msgSend_commandBuffer(v223, v224, v225);

    v228 = objc_msgSend_objectAtIndexedSubscript_(v439, v227, v204);
    sub_262E294BC(v462, v452, v228, v226);

    v230 = objc_msgSend_objectAtIndexedSubscript_(v438, v229, v204);
    sub_262E294BC(v462, v455, v230, v226);

    v232 = objc_msgSend_objectAtIndexedSubscript_(v437, v231, v204);
    sub_262E294BC(v462, v461, v232, v226);

    uint64_t v234 = objc_msgSend_objectAtIndexedSubscript_(v436, v233, v204);
    sub_262E294BC(v462, v459, (void *)v234, v226);

    objc_msgSend_commit(v226, v235, v236);
    objc_msgSend_waitUntilScheduled(v226, v237, v238);
    CFAbsoluteTimeGetCurrent();
    CFAbsoluteTimeGetCurrent();
    id v239 = v435;
    objc_sync_enter(v239);
    LOBYTE(v234) = objc_msgSend_buildWait(v239, v240, v241);
    CFAbsoluteTimeGetCurrent();
    if (v234)
    {
      CFAbsoluteTime v242 = CFAbsoluteTimeGetCurrent();
      int v445 = objc_msgSend_bind_buffer_(v239, v243, (uint64_t)"input_ref", v205, v242);
      if (v445)
      {
        v245 = uni_logger_api();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
          sub_262E4AEA0(v485, &v486, v245);
        }
LABEL_74:

LABEL_75:
        objc_sync_exit(v239);

        CFAbsoluteTimeGetCurrent();
        CFAbsoluteTime v252 = CFAbsoluteTimeGetCurrent();
        v253 = (void *)MEMORY[0x263F00650];
        v255 = objc_msgSend_objectAtIndexedSubscript_(v434, v254, v204, v252);
        uint64_t v475 = v431;
        uint64_t v476 = MEMORY[0x263EFFA88];
        v257 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v256, (uint64_t)&v476, &v475, 1);
        v454 = objc_msgSend_imageWithMTLTexture_options_(v253, v258, (uint64_t)v255, v257);

        objc_msgSend_extent(v454, v259, v260);
        double v262 = v261;
        double v264 = v263;
        double v266 = v265;
        double v268 = v267;
        v474[0] = v455;
        v474[1] = v454;
        v270 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v269, (uint64_t)v474, 2);
        uint64_t v472 = v430;
        v272 = objc_msgSend_numberWithInt_(NSNumber, v271, v429);
        v473 = v272;
        v274 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v273, (uint64_t)&v473, &v472, 1);
        v276 = objc_msgSend_applyWithExtent_arguments_options_(v433, v275, (uint64_t)v270, v274, v262, v264, v266, v268);

        id v277 = v276;
        v281 = objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v278, @"ccp_planarToInterleaved");
        if (v277)
        {
          objc_msgSend_extent(v277, v279, v280);
          if (CGRectIsInfinite(v508))
          {
            v284 = 0;
            id v285 = v277;
          }
          else
          {
            objc_msgSend_extent(v277, v282, v283);
            uint64_t v287 = v286;
            objc_msgSend_extent(v277, v288, v289);
            CGFloat v291 = v290;
            CGFloat v293 = v292;
            CGFloat v295 = v294;
            CGFloat v297 = v296;
            CGAffineTransformMakeScale(&v503, 1.0, 0.333333333);
            v509.origin.double x = v291;
            v509.origin.double y = v293;
            v509.size.double width = v295;
            v509.size.double height = v297;
            CGRect v510 = CGRectApplyAffineTransform(v509, &v503);
            double v298 = v510.origin.x;
            double v299 = v510.origin.y;
            double v300 = v510.size.width;
            double v301 = v510.size.height;
            v470[0] = MEMORY[0x263EF8330];
            v470[1] = 3221225472;
            v470[2] = sub_262E29F8C;
            v470[3] = &unk_2655BCCC8;
            v470[4] = v287;
            v502[0] = v277;
            v304 = objc_msgSend_numberWithDouble_(NSNumber, v302, v303, v510.size.height);
            v502[1] = v304;
            v306 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v305, (uint64_t)v502, 2);
            v308 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v281, v307, (uint64_t)v470, v306, v298, v299, v300, v301);

            id v285 = v308;
            v284 = v285;
          }
        }
        else
        {
          id v285 = 0;
          v284 = 0;
        }

        id v309 = v284;
        v311 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v310, @"from_range_m1_p1");
        objc_msgSend_extent(v309, v312, v313);
        double v315 = v314;
        double v317 = v316;
        double v319 = v318;
        double v321 = v320;
        *(void *)&v503.a = v309;
        v323 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v322, (uint64_t)&v503, 1);

        v325 = objc_msgSend_applyWithExtent_arguments_(v311, v324, (uint64_t)v323, v315, v317, v319, v321);

        id v326 = v325;
        id v328 = v463;
        if (v441 >= 1.0)
        {
          id v246 = v326;
        }
        else
        {
          v329 = objc_msgSend_imageYCC444_matrix_fullRange_precision_colorSpace_(MEMORY[0x263F00650], v327, (uint64_t)v328, 709, 1, 0, 0);
          v331 = objc_msgSend_imageYCC444_matrix_fullRange_precision_colorSpace_(MEMORY[0x263F00650], v330, (uint64_t)v326, 709, 1, 0, 0);
          id v332 = v329;
          objc_msgSend_extent(v332, v333, v334);
          double v336 = v335;
          double v338 = v337;
          double v340 = v339;
          double v342 = v341;
          v345 = objc_msgSend_imageByClampingToExtent(v332, v343, v344);

          v348 = objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v345, v346, v347, v426);

          v351 = objc_msgSend_imageByCroppingToRect_(v348, v349, v350, v336, v338, v340, v342);

          if (!v351) {
            sub_262E4ACE0();
          }
          v353 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v352, @"blend_chroma");
          objc_msgSend_setPerservesAlpha_(v353, v354, 1);
          objc_msgSend_extent(v331, v355, v356);
          double v358 = v357;
          double v360 = v359;
          double v362 = v361;
          double v364 = v363;
          *(void *)&v503.a = v331;
          *(void *)&v503.b = v351;
          *(float *)&double v357 = v441;
          v367 = objc_msgSend_numberWithFloat_(NSNumber, v365, v366, v357);
          *(void *)&v503.c = v367;
          v369 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v368, (uint64_t)&v503, 3);
          v371 = objc_msgSend_applyWithExtent_arguments_(v353, v370, (uint64_t)v369, v358, v360, v362, v364);

          objc_msgSend_imageWithYCCImage_matrix_fullRange_precision_colorSpace_(MEMORY[0x263F00650], v372, (uint64_t)v371, 709, 1, 0, 0);
          id v246 = (id)objc_claimAutoreleasedReturnValue();
        }
        CFAbsoluteTimeGetCurrent();

        v168 = v455;
        v148 = v452;
        goto LABEL_85;
      }
      int v445 = objc_msgSend_bind_buffer_(v239, v244, (uint64_t)"input_corrupted", v206);
      if (v445)
      {
        v245 = uni_logger_api();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
          sub_262E4AE5C(v483, &v484, v245);
        }
        goto LABEL_74;
      }
      int v445 = objc_msgSend_bind_buffer_(v239, v249, (uint64_t)"input_mask", v207);
      if (v445)
      {
        v245 = uni_logger_api();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
          sub_262E4AE18(v481, &v482, v245);
        }
        goto LABEL_74;
      }
      int v445 = objc_msgSend_bind_buffer_(v239, v250, (uint64_t)"input_alpha", v453);
      if (v445)
      {
        v245 = uni_logger_api();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
          sub_262E4ADD4(v479, &v480, v245);
        }
        goto LABEL_74;
      }
      int v445 = objc_msgSend_bind_buffer_(v239, v251, (uint64_t)"output_residual", v208);
      if (v445)
      {
        v245 = uni_logger_api();
        if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
          sub_262E4AD90(v477, &v478, v245);
        }
        goto LABEL_74;
      }
    }
    else
    {
      v247 = uni_logger_api();
      if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR)) {
        sub_262E4AEE4(v487, &v488, v247);
      }

      if (v445) {
        goto LABEL_75;
      }
    }
    v468[0] = MEMORY[0x263EF8330];
    v468[1] = 3221225472;
    v468[2] = sub_262E296A4;
    v468[3] = &unk_2655BCCA8;
    v469 = v464;
    if (objc_msgSend_executeAsync_(v239, v248, (uint64_t)v468))
    {
      v418 = uni_logger_api();
      if (os_log_type_enabled(v418, OS_LOG_TYPE_ERROR)) {
        sub_262E4AD0C(v418);
      }

      __assert_rtn("+[ApplyHairnetModel processWithInputs:arguments:output:error:]", "HairnetProcessor.m", 536, "status==0");
    }
    int v445 = 0;
    v245 = v469;
    goto LABEL_74;
  }
LABEL_6:
  v136 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_262E29730;
  block[3] = &unk_2655BCBF8;
  block[4] = v462;
  dispatch_async(v136, block);

  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  v3 = (int *)MEMORY[0x263F00890];
  v4 = (int *)MEMORY[0x263F008C0];
  if (a3 >= 2) {
    v4 = (int *)MEMORY[0x263F008D0];
  }
  if (a3 != 2) {
    v3 = v4;
  }
  return *v3;
}

+ (int)outputFormat
{
  return *MEMORY[0x263F008C0];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5 = a4;
  v7 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"fullWidth");
  uint64_t v10 = objc_msgSend_unsignedLongValue(v7, v8, v9);

  v12 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"fullHeight");
  uint64_t v15 = objc_msgSend_unsignedLongValue(v12, v13, v14);

  v17 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"tileSize");
  unint64_t v20 = objc_msgSend_unsignedLongValue(v17, v18, v19);

  v22 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"tileOverlap");
  uint64_t v25 = objc_msgSend_unsignedLongValue(v22, v23, v24);

  unint64_t v26 = v20 - 1;
  unint64_t v27 = v20 - 1 + v15;
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  if (v20 <= v27)
  {
    uint64_t v32 = 0;
    unint64_t v33 = v26 + v10;
    double v34 = (double)(unint64_t)v25;
    double v35 = (double)(v20 + 2 * v25);
    unint64_t v36 = (v26 + v10) / v20;
    if (v36 <= 1) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = v36;
    }
    unint64_t v38 = v27 / v20;
    if (v38 <= 1) {
      uint64_t v39 = 1;
    }
    else {
      uint64_t v39 = v38;
    }
    do
    {
      if (v20 <= v33)
      {
        unint64_t v40 = 0;
        uint64_t v41 = v37;
        do
        {
          v51.origin.CGFloat x = (double)v40 - v34;
          v51.origin.CGFloat y = (double)(v32 * v20) - v34;
          v51.size.CGFloat width = v35;
          v51.size.CGFloat height = v35;
          if (CGRectIntersectsRect(v51, a5))
          {
            v52.origin.CGFloat x = x;
            v52.origin.CGFloat y = y;
            v52.size.CGFloat width = width;
            v52.size.CGFloat height = height;
            v57.origin.CGFloat x = (double)v40 - v34;
            v57.origin.CGFloat y = (double)(v32 * v20) - v34;
            v57.size.CGFloat width = v35;
            v57.size.CGFloat height = v35;
            CGRect v53 = CGRectUnion(v52, v57);
            CGFloat x = v53.origin.x;
            CGFloat y = v53.origin.y;
            CGFloat width = v53.size.width;
            CGFloat height = v53.size.height;
          }
          v40 += v20;
          --v41;
        }
        while (v41);
      }
      ++v32;
    }
    while (v32 != v39);
  }
  v58.size.CGFloat width = (double)(unint64_t)v10;
  v58.size.CGFloat height = (double)(unint64_t)v15;
  v58.origin.CGFloat x = 0.0;
  v58.origin.CGFloat y = 0.0;
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  CGRect v55 = CGRectIntersection(v54, v58);
  CGFloat v42 = v55.origin.x;
  CGFloat v43 = v55.origin.y;
  CGFloat v44 = v55.size.width;
  CGFloat v45 = v55.size.height;

  double v46 = v42;
  double v47 = v43;
  double v48 = v44;
  double v49 = v45;
  result.size.CGFloat height = v49;
  result.size.CGFloat width = v48;
  result.origin.CGFloat y = v47;
  result.origin.CGFloat x = v46;
  return result;
}

+ (id)apply:(id)a3 sdof:(id)a4 mask:(id)a5 alpha:(id)a6 chromaWeight:(float)a7 chromaBlurSigma:(float)a8 model:(id)a9
{
  v97[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = v18;
  if (!v21) {
    sub_262E4B060();
  }
  uint64_t v23 = v21;
  uint64_t v24 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v22, @"invertMask");
  if (!v24) {
    sub_262E4B08C();
  }
  unint64_t v27 = (void *)v24;
  v89 = v19;
  id v90 = a1;
  objc_msgSend_extent(v23, v25, v26);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v97[0] = v23;
  uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v36, (uint64_t)v97, 1);
  uint64_t v95 = *MEMORY[0x263F009C8];
  uint64_t v39 = objc_msgSend_numberWithInt_(NSNumber, v38, *MEMORY[0x263F008D0]);
  v96 = v39;
  uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)&v96, &v95, 1);
  uint64_t v43 = objc_msgSend_applyWithExtent_arguments_options_(v27, v42, (uint64_t)v37, v41, v29, v31, v33, v35);

  v88 = (void *)v43;
  if (!v43) {
    sub_262E4B0B8();
  }

  v93[0] = @"fullWidth";
  CGFloat v44 = NSNumber;
  objc_msgSend_extent(v16, v45, v46);
  uint64_t v50 = objc_msgSend_numberWithDouble_(v44, v47, v48, v49);
  v94[0] = v50;
  v93[1] = @"fullHeight";
  CGRect v51 = NSNumber;
  objc_msgSend_extent(v16, v52, v53);
  CGRect v57 = objc_msgSend_numberWithDouble_(v51, v54, v55, v56);
  v94[1] = v57;
  v93[2] = @"tileSize";
  v59 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v58, 336);
  v94[2] = v59;
  v93[3] = @"tileOverlap";
  v61 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v60, 24);
  v94[3] = v61;
  v93[4] = @"chromaWeight";
  *(float *)&double v62 = a7;
  objc_msgSend_numberWithFloat_(NSNumber, v63, v64, v62);
  uint64_t v66 = v65 = v17;
  v94[4] = v66;
  v93[5] = @"chromaBlurSigma";
  *(float *)&double v67 = a8;
  v70 = objc_msgSend_numberWithFloat_(NSNumber, v68, v69, v67);
  v93[6] = @"model";
  v94[5] = v70;
  v94[6] = v20;
  uint64_t v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v71, (uint64_t)v94, v93, 7);

  objc_msgSend_extent(v16, v73, v74);
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;
  double v82 = v81;
  v92[0] = v16;
  v92[1] = v65;
  v92[2] = v88;
  v92[3] = v89;
  uint64_t v84 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v83, (uint64_t)v92, 4);
  uint64_t v91 = 0;
  v86 = objc_msgSend_applyWithExtent_inputs_arguments_error_(v90, v85, (uint64_t)v84, v72, &v91, v76, v78, v80, v82);

  return v86;
}

@end