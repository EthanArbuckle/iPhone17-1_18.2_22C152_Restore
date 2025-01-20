@interface QuartzCore_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation QuartzCore_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239857668;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A057F0 != -1) {
    dispatch_once(&qword_268A057F0, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v10 = a3;
  objc_msgSend_initializeJSContext_(TMLTransform3D, v4, v5, v10);
  objc_msgSend_defineConstants_(a1, v6, v7, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v8, v9, &unk_26ECEC4E8, @"CACurrentMediaTime");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v316 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v316, v8, v9, *MEMORY[0x263F15EC8], *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"kCAMediaTimingFunctionLinear", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v12, v13, *MEMORY[0x263F15EB0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"kCAMediaTimingFunctionEaseIn", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v16, v17, *MEMORY[0x263F15EC0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"kCAMediaTimingFunctionEaseOut", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v20, v21, *MEMORY[0x263F15EB8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"kCAMediaTimingFunctionEaseInEaseOut", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v24, v25, *MEMORY[0x263F15EA0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"kCAMediaTimingFunctionDefault", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v28, v29, *MEMORY[0x263F15AB0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"kCAFillModeForwards", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v32, v33, *MEMORY[0x263F15AA0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"kCAFillModeBackwards", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v36, v37, *MEMORY[0x263F15AA8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"kCAFillModeBoth", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v40, v41, *MEMORY[0x263F15AB8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"kCAFillModeRemoved", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v44, v45, *MEMORY[0x263F16038], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"kCAValueFunctionRotateX", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v48, v49, *MEMORY[0x263F16040], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"kCAValueFunctionRotateY", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v52, v53, *MEMORY[0x263F16048], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"kCAValueFunctionRotateZ", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v56, v57, *MEMORY[0x263F16050], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"kCAValueFunctionScale", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v60, v61, *MEMORY[0x263F16058], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, @"kCAValueFunctionScaleX", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v64, v65, *MEMORY[0x263F16060], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v66, v67, @"kCAValueFunctionScaleY", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v68, v69, *MEMORY[0x263F16068], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v70, v71, @"kCAValueFunctionScaleZ", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v72, v73, *MEMORY[0x263F16070], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, @"kCAValueFunctionTranslate", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v76, v77, *MEMORY[0x263F16078], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v78, v79, @"kCAValueFunctionTranslateX", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v80, v81, *MEMORY[0x263F16080], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v82, v83, @"kCAValueFunctionTranslateY", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v84, v85, *MEMORY[0x263F16088], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v86, v87, @"kCAValueFunctionTranslateZ", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v88, v89, *MEMORY[0x263F15970], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v90, v91, @"kCAAnimationLinear", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v92, v93, *MEMORY[0x263F15968], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v94, v95, @"kCAAnimationDiscrete", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v96, v97, *MEMORY[0x263F15978], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v98, v99, @"kCAAnimationPaced", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v100, v101, *MEMORY[0x263F15958], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v102, v103, @"kCAAnimationCubic", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v104, v105, *MEMORY[0x263F15960], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v106, v107, @"kCAAnimationCubicPaced", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v108, v109, *MEMORY[0x263F15988], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v110, v111, @"kCAAnimationRotateAuto", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v112, v113, *MEMORY[0x263F15990], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v114, v115, @"kCAAnimationRotateAutoReverse", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v116, v117, *MEMORY[0x263F15FD8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v118, v119, @"kCATransitionFade", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v120, v121, *MEMORY[0x263F16000], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v122, v123, @"kCATransitionMoveIn", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v124, v125, *MEMORY[0x263F16008], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v126, v127, @"kCATransitionPush", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v128, v129, *MEMORY[0x263F16010], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v130, v131, @"kCATransitionReveal", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v132, v133, *MEMORY[0x263F15FF0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v134, v135, @"kCATransitionFromRight", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v136, v137, *MEMORY[0x263F15FE8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v138, v139, @"kCATransitionFromLeft", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v140, v141, *MEMORY[0x263F15FF8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v142, v143, @"kCATransitionFromTop", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v144, v145, *MEMORY[0x263F15FE0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v146, v147, @"kCATransitionFromBottom", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v148, v149, *MEMORY[0x263F15E00], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v150, v151, @"kCAGravityCenter", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v152, v153, *MEMORY[0x263F15E30], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v154, v155, @"kCAGravityTop", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v156, v157, *MEMORY[0x263F15DE8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v158, v159, @"kCAGravityBottom", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v160, v161, *MEMORY[0x263F15E08], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v162, v163, @"kCAGravityLeft", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v164, v165, *MEMORY[0x263F15E28], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v166, v167, @"kCAGravityRight", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v168, v169, *MEMORY[0x263F15E38], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v170, v171, @"kCAGravityTopLeft", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v172, v173, *MEMORY[0x263F15E40], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v174, v175, @"kCAGravityTopRight", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v176, v177, *MEMORY[0x263F15DF0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v178, v179, @"kCAGravityBottomLeft", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v180, v181, *MEMORY[0x263F15DF8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v182, v183, @"kCAGravityBottomRight", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v184, v185, *MEMORY[0x263F15E10], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v186, v187, @"kCAGravityResize", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v188, v189, *MEMORY[0x263F15E18], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v190, v191, @"kCAGravityResizeAspect", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v192, v193, *MEMORY[0x263F15E20], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v194, v195, @"kCAGravityResizeAspectFill", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v196, v197, *MEMORY[0x263F15D28], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v198, v199, @"kCAFilterNearest", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v200, v201, *MEMORY[0x263F15CC8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v202, v203, @"kCAFilterLinear", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v204, v205, *MEMORY[0x263F15DA8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v206, v207, @"kCAFilterTrilinear", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v208, v209, *MEMORY[0x263F15ED0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v210, v211, @"kCAOnOrderIn", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v212, v213, *MEMORY[0x263F15ED8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v214, v215, @"kCAOnOrderOut", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v216, v217, *MEMORY[0x263F15FD0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v218, v219, @"kCATransition", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v220, v221, *MEMORY[0x263F15DD0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v222, v223, @"kCAGradientLayerAxial", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v224, v225, *MEMORY[0x263F15F20], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v226, v227, @"kCAScrollNone", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v228, v229, *MEMORY[0x263F15F28], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v230, v231, @"kCAScrollVertically", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v232, v233, *MEMORY[0x263F15F18], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v234, v235, @"kCAScrollHorizontally", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v236, v237, *MEMORY[0x263F15F10], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v238, v239, @"kCAScrollBoth", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v240, v241, *MEMORY[0x263F15AC8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v242, v243, @"kCAFillRuleNonZero", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v244, v245, *MEMORY[0x263F15AC0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v246, v247, @"kCAFillRuleEvenOdd", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v248, v249, *MEMORY[0x263F15E88], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v250, v251, @"kCALineJoinMiter", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v252, v253, *MEMORY[0x263F15E98], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v254, v255, @"kCALineJoinRound", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v256, v257, *MEMORY[0x263F15E80], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v258, v259, @"kCALineJoinBevel", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v260, v261, *MEMORY[0x263F15E68], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v262, v263, @"kCALineCapButt", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v264, v265, *MEMORY[0x263F15E70], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v266, v267, @"kCALineCapRound", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v268, v269, *MEMORY[0x263F15E78], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v270, v271, @"kCALineCapSquare", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v272, v273, *MEMORY[0x263F16028], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v274, v275, @"kCATruncationNone", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v276, v277, *MEMORY[0x263F16030], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v278, v279, @"kCATruncationStart", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v280, v281, *MEMORY[0x263F16018], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v282, v283, @"kCATruncationEnd", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v284, v285, *MEMORY[0x263F16020], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v286, v287, @"kCATruncationMiddle", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v288, v289, *MEMORY[0x263F15940], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v290, v291, @"kCAAlignmentNatural", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v292, v293, *MEMORY[0x263F15938], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v294, v295, @"kCAAlignmentLeft", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v296, v297, *MEMORY[0x263F15948], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v298, v299, @"kCAAlignmentRight", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v300, v301, *MEMORY[0x263F15928], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v302, v303, @"kCAAlignmentCenter", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v304, v305, *MEMORY[0x263F15930], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v306, v307, @"kCAAlignmentJustified", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v308, v309, *MEMORY[0x263F15A10], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v310, v311, @"kCACornerCurveCircular", v316);
  objc_msgSend_setObject_forKeyedSubscript_(v316, v312, v313, *MEMORY[0x263F15A20], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v314, v315, @"kCACornerCurveContinuous", v316);
}

@end