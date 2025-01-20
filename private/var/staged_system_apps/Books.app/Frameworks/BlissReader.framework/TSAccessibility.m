@interface TSAccessibility
+ (Class)specializedClass;
+ (id)sharedInstance;
- (BOOL)_isKeyboardVisible;
- (BOOL)_systemVersionIsGreaterOrEqualTo:(id)a3;
- (BOOL)accessibilitySupportLoaded;
- (BOOL)isKeyboardVisible;
- (BOOL)isQuickSpeakEnabled;
- (BOOL)quickSpeakSupportLoaded;
- (BOOL)shouldFakeQuickSpeakAlwaysSpeaking;
- (BOOL)supportsAdvancedTextSearchExperience;
- (BOOL)supportsCharts;
- (BOOL)supportsTableEditing;
- (CGRect)_keyboardFrame;
- (CGRect)keyboardFrame;
- (id)cachedCurrentlyFocusedElement;
- (id)cachedFirstElementForUpcomingPageTurn;
- (id)cachedFirstElementForUpcomingScreenChange;
- (id)canvasViewDescription;
- (id)currentlyFocusedElement;
- (id)preferencesDomain;
- (unint64_t)firstElementForUpcomingPageTurnResetCount;
- (unint64_t)firstElementForUpcomingScreenChangeResetCount;
- (void)_keyboardWasShown:(id)a3;
- (void)_keyboardWillBeHidden:(id)a3;
- (void)_setCurrentlyFocusedElement:(id)a3;
- (void)_setKeyboardFrame:(CGRect)a3;
- (void)_setKeyboardVisible:(BOOL)a3;
- (void)addExtraSafeCategoryNamesToCollection:(id)a3;
- (void)addSafeCategoryNamesToCollection:(id)a3;
- (void)dealloc;
- (void)handlePostingAnnouncement:(id)a3 sender:(id)a4 priority:(int)a5;
- (void)loadAccessibilitySupport;
- (void)loadExtraAccessibilitySupport;
- (void)loadQuickSpeakSupport;
- (void)performExtraValidation;
- (void)performValidation;
- (void)setAccessibilitySupportLoaded:(BOOL)a3;
- (void)setCachedCurrentlyFocusedElement:(id)a3;
- (void)setCachedFirstElementForUpcomingPageTurn:(id)a3;
- (void)setCachedFirstElementForUpcomingScreenChange:(id)a3;
- (void)setFirstElementForUpcomingPageTurn:(id)a3;
- (void)setFirstElementForUpcomingPageTurnResetCount:(unint64_t)a3;
- (void)setFirstElementForUpcomingScreenChange:(id)a3;
- (void)setFirstElementForUpcomingScreenChangeResetCount:(unint64_t)a3;
- (void)setQuickSpeakSupportLoaded:(BOOL)a3;
- (void)setShouldFakeQuickSpeakAlwaysSpeaking:(BOOL)a3;
- (void)unloadExtraAccessibilitySupport;
@end

@implementation TSAccessibility

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_249BF8;
  block[3] = &unk_456DE0;
  block[4] = a1;
  if (qword_573830 != -1) {
    dispatch_once(&qword_573830, block);
  }
  return (id)qword_573828;
}

- (void)dealloc
{
  if [(TSAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityExtras]&& (objc_opt_respondsToSelector())
  {
    [(TSAccessibility *)self unloadExtraAccessibilitySupport];
  }
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibility;
  [(TSAccessibility *)&v3 dealloc];
}

- (void)performValidation
{
  if ([(TSAccessibility *)self supportsCharts])
  {
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCH3DFill", @"identifier", "@", v2, v3, v4, v5, v6, 0);
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCH3DFillSetIdentifier", @"textureSetFilename", "@", v7, v8, v9, v10, v11, 0);
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCHChartDrawableInfo", @"chart", "@", v12, v13, v14, v15, v16, 0);
    __TSAccessibilityValidateIsKindOfClass(@"TSCHChartDrawableInfo", @"TSDDrawableInfo");
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCHChartInfo", @"chartType", "@", v17, v18, v19, v20, v21, 0);
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCHChartRep", @"chartInfo", "@", v22, v23, v24, v25, v26, 0);
    __TSAccessibilityValidateIsKindOfClass(@"TSCHChartSeriesStyle", @"TSSStyle");
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCHChartStylePreset", @"seriesStyles", "@", v27, v28, v29, v30, v31, 0);
    __TSAccessibilityValidateInstanceMethodComplete(@"TSCHChartType", @"userInterfaceName", "@", v32, v33, v34, v35, v36, 0);
  }
  __TSAccessibilityValidateIsKindOfClass(@"TSDAngleGradient", @"TSDGradient");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDAngleGradient", @"gradientAngleInDegrees", "d", v37, v38, v39, v40, v41, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDAnnotationController", @"hasAnnotations", "B", v42, v43, v44, v45, v46, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDAudioRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDAudioRep", @"movieInfo", "@", v47, v48, v49, v50, v51, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDAudioRep", @"playerController", "@", v52, v53, v54, v55, v56, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isCircular", "B", v57, v58, v59, v60, v61, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isDiamond", "B", v62, v63, v64, v65, v66, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isLineSegment", "B", v67, v68, v69, v70, v71, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isRectangular", "B", v72, v73, v74, v75, v76, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isTriangular", "B", v77, v78, v79, v80, v81, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"elementCount", "q", v82, v83, v84, v85, v86, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDBezierPath", @"isFlat", "B", v87, v88, v89, v90, v91, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDBezierPathSource", @"TSDPathSource");
  __TSAccessibilityValidateIvarType(@"TSDBezierPathSource", "mPath", "TSDBezierPath");
  __TSAccessibilityValidateIsKindOfClass(@"TSDBrushStroke", @"TSDSmartStroke");
  __TSAccessibilityValidateIsKindOfClass(@"TSDCalligraphyStroke", @"TSDSmartStroke");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCalloutPathSource", @"isTailAtCenter", "B", v92, v93, v94, v95, v96, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDCalloutPathSource", @"TSDPathSource");
  __TSAccessibilityValidateIvarType(@"TSDCanvas", "mInLayout", "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"accessController", "@", v97, v98, v99, v100, v101, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"canvasController", "@", v102, v103, v104, v105, v106, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"convertBoundsToUnscaledPoint:", "{CGPoint=dd}", v107, v108, v109, v110, v111, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"convertUnscaledToBoundsRect:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v112, v113, v114, v115, v116, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"delegate", "@", v117, v118, v119, v120, v121, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"i_registerRep:", "v", v122, v123, v124, v125, v126, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"i_unregisterRep:", "v", v127, v128, v129, v130, v131, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"layoutController", "@", v132, v133, v134, v135, v136, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"p_updateRepsFromLayouts", "B", v137, v138, v139, v140, v141, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"topLevelReps", "@", v142, v143, v144, v145, v146, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvas", @"viewScale", "d", v147, v148, v149, v150, v151, 0);
  __TSAccessibilityValidateProtocolMethod(@"TSDCanvasEditor", @"canPerformEditorAction:withSender:", 1, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasEditor", @"canvasEditorHelper", "@", v152, v153, v154, v155, v156, 0);
  __TSAccessibilityValidateProtocolMethod(@"TSDCanvasEditor", @"canvasSelection", 1, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasEditor", @"canvasSelectionWithInfos:", "@", v157, v158, v159, v160, v161, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasEditor", @"interactiveCanvasController", "@", v162, v163, v164, v165, v166, 0);
  __TSAccessibilityValidateProtocolMethod(@"TSDCanvasEditor", @"canvasSelection", 1, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasEditorHelper", @"canvasEditor", "@", v167, v168, v169, v170, v171, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDCanvasLayer", @"CALayer");
  __TSAccessibilityValidateProtocolMethod(@"TSDCanvasSelection", @"unlockedInfos", 1, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasView", @"canvasLayer", "@", v172, v173, v174, v175, v176, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCanvasView", @"controller", "@", v177, v178, v179, v180, v181, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDColorFill", @"TSDFill");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDColorFill", @"color", "@", v182, v183, v184, v185, v186, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDConnectionLinePathSource", @"TSDPathSource");
  __TSAccessibilityValidateIsKindOfClass(@"TSDContactShadow", @"TSDShadow");
  __TSAccessibilityValidateIsKindOfClass(@"TSDCurvedShadow", @"TSDShadow");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDefaultPartitioner", @"i_repForCanvas:", "@", v187, v188, v189, v190, v191, "@");
  __TSAccessibilityValidateClassMethodComplete(@"TSDDefaultRenderingObjects", @"defaultEndpoints", "@", v192, v193, v194, v195, v196, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDrawableEditor", @"interactiveCanvasController", "@", v197, v198, v199, v200, v201, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDrawableInfo", @"accessibilityDescription", "@", v202, v203, v204, v205, v206, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDrawableInfo", @"comment", "@", v207, v208, v209, v210, v211, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDDropShadow", @"TSDShadow");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDEditableBezierPathSource", @"bezierPath", "@", v212, v213, v214, v215, v216, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDEditableBezierPathSource", @"TSDPathSource");
  __TSAccessibilityValidateProtocolMethod(@"TSDEditor", @"canPerformEditorAction:withSender:", 0, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDEditorController", @"currentEditors", "@", v217, v218, v219, v220, v221, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDEditorController", @"editorForEditAction:withSender:", "@", v222, v223, v224, v225, v226, ":");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDEditorController", @"mostSpecificCurrentEditorOfClass:", "@", v227, v228, v229, v230, v231, "#");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDEditorController", @"textInputEditor", "@", v232, v233, v234, v235, v236, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDFill", @"fillType", "i", v237, v238, v239, v240, v241, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDFill", @"referenceColor", "@", v242, v243, v244, v245, v246, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDFrame", @"TSDStroke");
  __TSAccessibilityValidateIvarType(@"TSDFrame", "mSpec", "TSDFrameSpec");
  __TSAccessibilityValidateIvarType(@"TSDFrameSpec", "mFrameName", "NSString");
  __TSAccessibilityValidateIsKindOfClass(@"TSDGradient", @"TSDFill");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDGradient", @"gradientStops", "@", v247, v248, v249, v250, v251, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDGradient", @"gradientType", "Q", v252, v253, v254, v255, v256, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDGradientStop", @"color", "@", v257, v258, v259, v260, v261, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDImageFill", @"TSDFill");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDImageFill", @"technique", "i", v262, v263, v264, v265, v266, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDImageFill", @"tintColor", "@", v267, v268, v269, v270, v271, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDImageInfo", @"imageData", "@", v272, v273, v274, v275, v276, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDImageInfo", @"TSDDrawableInfo");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDImageRep", @"imageInfo", "@", v277, v278, v279, v280, v281, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDImageRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInfoGeometry", @"angle", "d", v282, v283, v284, v285, v286, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInfoGeometry", @"position", "{CGPoint=dd}", v287, v288, v289, v290, v291, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInfoGeometry", @"size", "{CGSize=dd}", v292, v293, v294, v295, v296, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"annotationController", "@", v297, v298, v299, v300, v301, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"canvas", "@", v302, v303, v304, v305, v306, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"canvasEditor", "@", v307, v308, v309, v310, v311, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"canvasView", "@", v312, v313, v314, v315, v316, 0);
  v317 = "{CGPoint=dd}";
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"convertBoundsToUnscaledPoint:", "{CGPoint=dd}", v318, v319, v320, v321, v322, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"convertBoundsToUnscaledRect:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v323, v324, v325, v326, v327, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"convertUnscaledToBoundsPoint:", "{CGPoint=dd}", v328, v329, v330, v331, v332, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"convertUnscaledToBoundsRect:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v333, v334, v335, v336, v337, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"currentlyWaitingOnThreadedLayoutAndRender", "B", v338, v339, v340, v341, v342, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"delegate", "@", v343, v344, v345, v346, v347, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"editorController", "@", v348, v349, v350, v351, v352, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"endEditing", "v", v353, v354, v355, v356, v357, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"hitRep:", "@", v358, v359, v360, v361, v362, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"infosToDisplay", "@", v363, v364, v365, v366, v367, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"layerHost", "@", v368, v369, v370, v371, v372, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"repForInfo:", "@", v373, v374, v375, v376, v377, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"repForLayout:", "@", v378, v379, v380, v381, v382, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"repsForInfo:", "@", v383, v384, v385, v386, v387, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"scrollToPrimarySelection", "v", v388, v389, v390, v391, v392, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"teardown", "v", v393, v394, v395, v396, v397, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"topLevelRepsForHitTesting", "@", v398, v399, v400, v401, v402, 0);
  __TSAccessibilityValidateProtocolMethod(@"TSDInteractiveCanvasControllerDelegate", @"inPrintPreviewMode", 0, 1);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnob", @"isHitByUnscaledPoint:andRep:returningDistance:", "B", v403, v404, v405, v406, v407, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnob", @"layer", "@", v408, v409, v410, v411, v412, 0);
  __TSAccessibilityValidateIvarType(@"TSDKnob", "mRep", "TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnob", @"position", "{CGPoint=dd}", v413, v414, v415, v416, v417, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnob", @"tag", "Q", v418, v419, v420, v421, v422, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"beginMovingKnob", "v", v423, v424, v425, v426, v427, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"currentBoundsForStandardKnobs", "{CGRect={CGPoint=dd}{CGSize=dd}}", v428, v429, v430, v431, v432, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"endMovingKnob", "v", v433, v434, v435, v436, v437, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"initWithRep:knob:", "@", v438, v439, v440, v441, v442, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"knob", "@", v443, v444, v445, v446, v447, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"moveKnobToRepPosition:", "v", v448, v449, v450, v451, v452, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDKnobTracker", @"setDidDrag:", "v", v453, v454, v455, v456, v457, "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayout", @"dragBy:", "v", v458, v459, v460, v461, v462, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayout", @"info", "@", v463, v464, v465, v466, v467, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayout", @"inspectorGeometry", "@", v468, v469, v470, v471, v472, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayout", @"invalidate", "v", v473, v474, v475, v476, v477, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayout", @"layoutController", "@", v478, v479, v480, v481, v482, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayoutController", @"canvas", "@", v483, v484, v485, v486, v487, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayoutController", @"rootLayout", "@", v488, v489, v490, v491, v492, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayoutGeometry", @"frame", "{CGRect={CGPoint=dd}{CGSize=dd}}", v493, v494, v495, v496, v497, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLayoutGeometry", @"transform", "{CGAffineTransform=dddddd}", v498, v499, v500, v501, v502, 0);
  __TSAccessibilityValidateIvarType(@"TSDLineEnd", "mIdentifier", "NSString");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLinePreset", @"headLineEnd", "@", v503, v504, v505, v506, v507, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLinePreset", @"stroke", "@", v508, v509, v510, v511, v512, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDLinePreset", @"tailLineEnd", "@", v513, v514, v515, v516, v517, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDMediaStyle", @"TSSStyle");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMediaStyle", @"presetKind", "@", v518, v519, v520, v521, v522, 0);
  __TSAccessibilityValidateIvarType(@"TSDMovieInfo", "mMovieData", "TSPData");
  __TSAccessibilityValidateIsKindOfClass(@"TSDMovieInfo", @"TSDDrawableInfo");
  __TSAccessibilityValidateIsKindOfClass(@"TSDMovieKnob", @"TSDKnob");
  __TSAccessibilityValidateIsKindOfClass(@"TSDMovieRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMovieRep", @"isPlayable", "B", v523, v524, v525, v526, v527, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMovieRep", @"movieInfo", "@", v528, v529, v530, v531, v532, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMovieRep", @"p_playForKnob", "v", v533, v534, v535, v536, v537, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMovieRep", @"p_togglePlaying", "v", v538, v539, v540, v541, v542, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDMovieRep", @"playerController", "@", v543, v544, v545, v546, v547, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPartitionedPartialLayout", @"partitioner", "@", v548, v549, v550, v551, v552, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDPartitionedPartialRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPartitionedPartialRep", @"canvas", "@", v553, v554, v555, v556, v557, 0);
  __TSAccessibilityValidateClassMethod(@"TSDPathSource", @"pathSourceForShapeType:naturalSize:");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPathSource", @"copyWithZone:", "@", v558, v559, v560, v561, v562, "^{_NSZone=}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPathSource", @"naturalSize", "{CGSize=dd}", v563, v564, v565, v566, v567, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPointPathSource", @"type", "i", v568, v569, v570, v571, v572, 0);
  __TSAccessibilityValidateIvarType(@"TSDReflection", "mOpacity", "d");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"becameNotSelected", "v", v573, v574, v575, v576, v577, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"becameSelected", "v", v578, v579, v580, v581, v582, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"canvas", "@", v583, v584, v585, v586, v587, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"convertNaturalPointFromUnscaledCanvas:", v317, v588, v589, v590, v591, v592, v317);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"convertNaturalRectFromUnscaledCanvas:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v593, v594, v595, v596, v597, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"convertNaturalPointToUnscaledCanvas:", v317, v598, v599, v600, v601, v602, v317);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"convertNaturalRectToUnscaledCanvas:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v603, v604, v605, v606, v607, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"frameInUnscaledCanvas", "{CGRect={CGPoint=dd}{CGSize=dd}}", v608, v609, v610, v611, v612, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"handleSingleTapAtPoint:", "B", v613, v614, v615, v616, v617, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"handleDoubleTapAtPoint:", "B", v618, v619, v620, v621, v622, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"i_willBeRemoved", "v", v623, v624, v625, v626, v627, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"info", "@", v628, v629, v630, v631, v632, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"invalidateKnobs", "v", v633, v634, v635, v636, v637, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"isLocked", "B", v638, v639, v640, v641, v642, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"isSelected", "B", v643, v644, v645, v646, v647, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"layerFrameInScaledCanvas", "{CGRect={CGPoint=dd}{CGSize=dd}}", v648, v649, v650, v651, v652, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"layout", "@", v653, v654, v655, v656, v657, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"knobForTag:", "@", v658, v659, v660, v661, v662, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"knobs", "@", v663, v664, v665, v666, v667, 0);
  __TSAccessibilityValidateIvarType(@"TSDRep", "mKnobs", "NSArray");
  __TSAccessibilityValidateIvarType(@"TSDRep", "mKnobsAreShowing", "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"naturalBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", v668, v669, v670, v671, v672, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"newTrackerForKnob:", "@", v673, v674, v675, v676, v677, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"parentRep", "@", v678, v679, v680, v681, v682, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"repForSelecting", "@", v683, v684, v685, v686, v687, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"shouldCreateKnobs", "B", v688, v689, v690, v691, v692, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"texture", "@", v693, v694, v695, v696, v697, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"transformToConvertNaturalFromLayerRelative", "{CGAffineTransform=dddddd}", v698, v699, v700, v701, v702, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDScalarPathSource", @"type", "i", v703, v704, v705, v706, v707, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDScalarPathSource", @"scalar", "d", v708, v709, v710, v711, v712, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDScalarPathSource", @"TSDPathSource");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShadow", @"TSUColor", "@", v713, v714, v715, v716, v717, 0);
  __TSAccessibilityValidateIvarType(@"TSDShadow", "mAngle", "d");
  __TSAccessibilityValidateIvarType(@"TSDShadow", "mEnabled", "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShapeInfo", @"pathSource", "@", v718, v719, v720, v721, v722, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShapeInfo", @"shapeStyle", "@", v723, v724, v725, v726, v727, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDShapeLayout", @"TSDLayout");
  __TSAccessibilityValidateIsKindOfClass(@"TSDShapeRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShapeRep", @"shapeInfo", "@", v728, v729, v730, v731, v732, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShapeRep", @"shapeLayout", "@", v733, v734, v735, v736, v737, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDShapeStyle", @"TSSStyle");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextureSet", @"layer", "@", v738, v739, v740, v741, v742, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPShapeRep", @"willBeginEditingContainedRep", "v", v743, v744, v745, v746, v747, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDShapeStyle", @"valueForProperty:", "@", v748, v749, v750, v751, v752, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDSmartStroke", @"strokeName", "@", v753, v754, v755, v756, v757, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDSmartStroke", @"TSDStroke");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDStroke", @"color", "@", v758, v759, v760, v761, v762, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDStroke", @"pattern", "@", v763, v764, v765, v766, v767, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDStroke", @"isNullStroke", "B", v768, v769, v770, v771, v772, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDStroke", @"width", "d", v773, v774, v775, v776, v777, 0);
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"solidPattern");
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"emptyPattern");
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"shortDashPattern");
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"mediumDashPattern");
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"longDashPattern");
  __TSAccessibilityValidateClassMethod(@"TSDStrokePattern", @"roundDashPattern");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDStrokePattern", @"patternType", "i", v778, v779, v780, v781, v782, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSKAVPlayerController", @"isPlaying", "B", v783, v784, v785, v786, v787, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSKDocumentRoot", @"theme", "@", v788, v789, v790, v791, v792, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSKRulerUnits", @"convertPointsToRulerUnits:", "d", v793, v794, v795, v796, v797, "d");
  __TSAccessibilityValidateClassMethodComplete(@"TSKRulerUnits", @"instance", "@", v798, v799, v800, v801, v802, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSKScrollView", @"delegate", "@", v803, v804, v805, v806, v807, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSPData", @"filename", "@", v808, v809, v810, v811, v812, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSStyle", @"floatValueForProperty:", "f", v813, v814, v815, v816, v817, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSStyle", @"intValueForProperty:", "i", v818, v819, v820, v821, v822, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSStyle", @"name", "@", v823, v824, v825, v826, v827, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSStyle", @"objectForProperty:", "@", v828, v829, v830, v831, v832, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSStyle", @"styleIdentifier", "@", v833, v834, v835, v836, v837, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSTheme", @"presetsOfKind:", "@", v838, v839, v840, v841, v842, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSSPropertySet", @"enumeratePropertiesUsingBlock:", "v", v843, v844, v845, v846, v847, "@?");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPParagraphStyle", @"TSSStyle");
  __TSAccessibilityValidateClass(@"TSTCell");
  __TSAccessibilityValidateClassMethodComplete(@"TSTCellRegion", @"regionFromRange:", "@", v848, v849, v850, v851, v852, "{?={?=SCC}{?=SS}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTCellRegion", @"boundingCellRange", "{?={?=SCC}{?=SS}}", v853, v854, v855, v856, v857, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTCellRegion", @"enumerateCellRangesUsingBlock:", "v", v858, v859, v860, v861, v862, "@?");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTCellRegion", @"equalsCellRange:", "B", v863, v864, v865, v866, v867, "{?={?=SCC}{?=SS}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTCellRegion", @"isEmpty", "B", v868, v869, v870, v871, v872, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTCellRegion", @"isRectangle", "B", v873, v874, v875, v876, v877, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSTCellStyle", @"TSSStyle");
  __TSAccessibilityValidateClassMethodComplete(@"TSTConfiguration", @"sharedTableConfiguration", "@", v878, v879, v880, v881, v882, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTConfiguration", @"beginEditingOnSingleTap", "B", v883, v884, v885, v886, v887, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTConfiguration", @"supportsContainedTextEditing", "B", v888, v889, v890, v891, v892, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTEditingState", @"editingMode", "i", v893, v894, v895, v896, v897, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTEditingState", @"selection", "@", v898, v899, v900, v901, v902, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTMasterLayout", @"updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:", "B", v903, v904, v905, v906, v907, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTMasterLayout", @"updateDynamicSelectionRegion:", "v", v908, v909, v910, v911, v912, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTSearchReference", @"cellID", "{?=SCC}", v913, v914, v915, v916, v917, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTSearchReference", @"range", "{_NSRange=QQ}", v918, v919, v920, v921, v922, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTSearchReference", @"tableInfo", "@", v923, v924, v925, v926, v927, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableInfo", @"editingCellID", "{?=SCC}", v928, v929, v930, v931, v932, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableInfo", @"masterLayout", "@", v933, v934, v935, v936, v937, 0);
  __TSAccessibilityValidateIvarType(@"TSTTableInfo", "mMasterLayout", "TSTMasterLayout");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableInfo", @"setEditingCellID:", "v", v938, v939, v940, v941, v942, "{?=SCC}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableModel", @"numberOfColumns", "S", v943, v944, v945, v946, v947, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableModel", @"numberOfRows", "S", v948, v949, v950, v951, v952, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableModel", @"range", "{?={?=SCC}{?=SS}}", v953, v954, v955, v956, v957, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableModel", @"tableName", "@", v958, v959, v960, v961, v962, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSTTableRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"canvasView", "@", v963, v964, v965, v966, v967, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"deviceBoundsForCellRange:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v968, v969, v970, v971, v972, "{?={?=SCC}{?=SS}}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"editorSelection", "@", v973, v974, v975, v976, v977, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"masterLayout", "@", v978, v979, v980, v981, v982, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"tableChrome", "@", v983, v984, v985, v986, v987, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"tableLayout", "@", v988, v989, v990, v991, v992, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"tableModel", "@", v993, v994, v995, v996, v997, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"updateChildrenFromLayout", "v", v998, v999, v1000, v1001, v1002, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableRep", @"updateFromLayout", "v", v1003, v1004, v1005, v1006, v1007, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableSelection", @"anchorCellID", "{?=SCC}", v1008, v1009, v1010, v1011, v1012, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableSelection", @"cellRegion", "@", v1013, v1014, v1015, v1016, v1017, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableSelection", @"enumerateSelectedCellsInTable:withFlags:usingBlock:", "v", v1018, v1019, v1020, v1021, v1022, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableSelection", @"initWithTableModel:andCellID:", "@", v1023, v1024, v1025, v1026, v1027, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableSelection", @"selectionType", "i", v1028, v1029, v1030, v1031, v1032, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSTTableStylePreset", @"index", "Q", v1033, v1034, v1035, v1036, v1037, 0);
  __TSAccessibilityValidateClassMethod(@"NSString", @"stringForValue:withListNumberFormat:");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPAttachment", @"findCharIndex", "Q", v1038, v1039, v1040, v1041, v1042, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPAttachment", @"parentStorage", "@", v1043, v1044, v1045, v1046, v1047, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPAttachment", @"setParentStorage:", "v", v1048, v1049, v1050, v1051, v1052, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPAttachment", @"wasRemovedFromDocumentRoot:", "v", v1053, v1054, v1055, v1056, v1057, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"boundsOfLineFragmentAtIndex:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v1058, v1059, v1060, v1061, v1062, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"columnRectForRange:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v1063, v1064, v1065, v1066, v1067, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"countLines", "Q", v1068, v1069, v1070, v1071, v1072, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"glyphRectForRange:includingLabel:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v1073, v1074, v1075, v1076, v1077, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"lineIndexForCharIndex:eol:", "Q", v1078, v1079, v1080, v1081, v1082, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"range", "{_NSRange=QQ}", v1083, v1084, v1085, v1086, v1087, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"rangeOfLineFragmentAtIndex:", "{_NSRange=QQ}", v1088, v1089, v1090, v1091, v1092, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPColumn", @"styleProvider", "@", v1093, v1094, v1095, v1096, v1097, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPDrawableAttachment", @"drawable", "@", v1098, v1099, v1100, v1101, v1102, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"editingReps", "@", v1103, v1104, v1105, v1106, v1107, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"endEditing", "v", v1108, v1109, v1110, v1111, v1112, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"initWithStorage:interactiveCanvasController:", "@", v1113, v1114, v1115, v1116, v1117, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"insertionPoint", "Q", v1118, v1119, v1120, v1121, v1122, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"interactiveCanvasController", "@", v1123, v1124, v1125, v1126, v1127, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", "Q", v1128, v1129, v1130, v1131, v1132, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"selection", "@", v1133, v1134, v1135, v1136, v1137, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"selectionChangedWithFlags:wpFlags:", "v", v1138, v1139, v1140, v1141, v1142, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"replaceRange:withText:", "v", v1143, v1144, v1145, v1146, v1147, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"setInsertionPoint:", "v", v1148, v1149, v1150, v1151, v1152, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"setSelection:", "v", v1153, v1154, v1155, v1156, v1157, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"storage", "@", v1158, v1159, v1160, v1161, v1162, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"tsax_listItemLabelForCharIndex:textIsLiteral:", "@", v1163, v1164, v1165, v1166, v1167, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPEditingController", @"tsax_rangeOfLineFragmentAtCharIndex:", "{_NSRange=QQ}", v1168, v1169, v1170, v1171, v1172, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPFootnoteReferenceAttachment", @"containedStorage", "@", v1173, v1174, v1175, v1176, v1177, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPFilteredStorage", @"initWithStorage:subRange:", "@", v1178, v1179, v1180, v1181, v1182, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPFilteredStorage", @"previousCharacterIndex:", "Q", v1183, v1184, v1185, v1186, v1187, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPFilteredStorage", @"nextCharacterIndex:", "Q", v1188, v1189, v1190, v1191, v1192, "Q");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPHyperlinkField", @"TSWPSmartField");
  __TSAccessibilityValidateClassMethodComplete(@"TSWPFontCache", @"sharedCache", "@", v1193, v1194, v1195, v1196, v1197, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPFontCache", @"availableMembersOfFontFamily:", "@", v1198, v1199, v1200, v1201, v1202, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPHyperlinkField", @"displayText", "@", v1203, v1204, v1205, v1206, v1207, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPHyperlinkField", @"url", "@", v1208, v1209, v1210, v1211, v1212, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSWPInteractiveCanvasController", @"TSDInteractiveCanvasController");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPInteractiveCanvasController", @"hyperlinkPopoverIsShown", "B", v1213, v1214, v1215, v1216, v1217, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPInteractiveCanvasController", @"p_repsForStorage:", "@", v1218, v1219, v1220, v1221, v1222, "@");
  __TSAccessibilityValidateProtocolMethod(@"TSWPInteractiveCanvasControllerDelegate", @"interactiveCanvasController:tappedOnFootnoteAttachment:", 0, 1);
  __TSAccessibilityValidateIsKindOfClass(@"TSWPLayout", @"TSDLayout");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPListStyle", @"TSSStyle");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPParagraphStyle", @"TSSStyle");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPPlaceholderSmartField", @"TSWPSmartField");
  __TSAccessibilityValidateIsKindOfClass(@"TSWPRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"caretRectForCharIndex:caretAffinity:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v1223, v1224, v1225, v1226, v1227, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"columns", "@", v1228, v1229, v1230, v1231, v1232, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"isEditing", "B", v1233, v1234, v1235, v1236, v1237, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"isSelectionHighlightSuppressed", "B", v1238, v1239, v1240, v1241, v1242, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"p_canRepBeginEditingOnDoubleTap", "B", v1243, v1244, v1245, v1246, v1247, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"pulseCaret", "v", v1248, v1249, v1250, v1251, v1252, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"range", "{_NSRange=QQ}", v1253, v1254, v1255, v1256, v1257, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"rectForSelection:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v1258, v1259, v1260, v1261, v1262, "@");
  __TSAccessibilityValidateIvarType(@"TSWPRep", "_selectionHighlightLayer", "CAShapeLayer");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPRep", @"storage", "@", v1263, v1264, v1265, v1266, v1267, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSearchReference", @"selection", "@", v1268, v1269, v1270, v1271, v1272, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSearchReference", @"storage", "@", v1273, v1274, v1275, v1276, v1277, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSelection", @"initWithRange:", "@", v1278, v1279, v1280, v1281, v1282, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSelection", @"range", "{_NSRange=QQ}", v1283, v1284, v1285, v1286, v1287, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSWPShapeInfo", @"TSDDrawableInfo");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPShapeInfo", @"containedStorage", "@", v1288, v1289, v1290, v1291, v1292, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPShapeInfo", @"displaysInstructionalText", "B", v1293, v1294, v1295, v1296, v1297, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSWPShapeRep", @"TSDShapeRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPShapeRep", @"containedRep", "@", v1298, v1299, v1300, v1301, v1302, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSWPShapeStyle", @"TSDShapeStyle");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPShapeStyle", @"presetKind", "@", v1303, v1304, v1305, v1306, v1307, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSmartField", @"parentStorage", "@", v1308, v1309, v1310, v1311, v1312, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPSmartField", @"range", "{_NSRange=QQ}", v1313, v1314, v1315, v1316, v1317, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"attachmentOrFootnoteAtCharIndex:", "@", v1318, v1319, v1320, v1321, v1322, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"createFontAtCharIndex:scaleTextPercent:effectiveRange:styleProvider:", "^{__CTFont=}", v1323, v1324, v1325, v1326, v1327, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"enumerateAttachmentsInTextRange:usingBlock:", "v", v1328, v1329, v1330, v1331, v1332, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", "v", v1333, v1334, v1335, v1336, v1337, "i");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"findCharIndexForFootnoteAttachment:", "Q", v1338, v1339, v1340, v1341, v1342, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"footnoteAtFootnoteIndex:outCharIndex:", "@", v1343, v1344, v1345, v1346, v1347, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"footnoteCount", "Q", v1348, v1349, v1350, v1351, v1352, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"footnoteIndexForFootnote:", "Q", v1353, v1354, v1355, v1356, v1357, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"footnoteStorages", "@", v1358, v1359, v1360, v1361, v1362, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"hasSmartFields", "B", v1363, v1364, v1365, v1366, v1367, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"length", "Q", v1368, v1369, v1370, v1371, v1372, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"listNumberForParagraphIndex:numberingData:", "Q", v1373, v1374, v1375, v1376, v1377, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"listStyleCount", "Q", v1378, v1379, v1380, v1381, v1382, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"listStyleAtCharIndex:effectiveRange:", "@", v1383, v1384, v1385, v1386, v1387, "Q");
  __TSAccessibilityValidateIvarType(@"TSWPStorage", "_owningAttachment", "TSPObject<TSDOwningAttachment>");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"paragraphCount", "Q", v1388, v1389, v1390, v1391, v1392, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"paragraphIndexAtCharIndex:", "Q", v1393, v1394, v1395, v1396, v1397, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"paragraphLevelAtCharIndex:", "Q", v1398, v1399, v1400, v1401, v1402, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"paragraphIndexRangeForCharRange:", "{_NSRange=QQ}", v1403, v1404, v1405, v1406, v1407, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"paragraphStyleAtCharIndex:effectiveRange:", "@", v1408, v1409, v1410, v1411, v1412, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"range", "{_NSRange=QQ}", v1413, v1414, v1415, v1416, v1417, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"selectionRangeMaxForCharIndex:", "Q", v1418, v1419, v1420, v1421, v1422, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"smartFieldAtCharIndex:attributeKind:effectiveRange:", "@", v1423, v1424, v1425, v1426, v1427, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"string", "@", v1428, v1429, v1430, v1431, v1432, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"stringEquivalentFromRange:", "@", v1433, v1434, v1435, v1436, v1437, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"substringWithRange:", "@", v1438, v1439, v1440, v1441, v1442, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"textRangeForParagraphAtIndex:", "{_NSRange=QQ}", v1443, v1444, v1445, v1446, v1447, "Q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorage", @"wpKind", "i", v1448, v1449, v1450, v1451, v1452, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPStorageBroadcaster", @"broadcastStorage:didChangeRange:delta:broadcastKind:", "v", v1453, v1454, v1455, v1456, v1457, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPTabs", @"count", "Q", v1458, v1459, v1460, v1461, v1462, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPTabs", @"indexForTabWithPosition:alignment:leader:", "Q", v1463, v1464, v1465, v1466, v1467, "d");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSWPTabs", @"removeTabAtIndex:", "v", v1468, v1469, v1470, v1471, v1472, "Q");
  __TSAccessibilityValidateClassMethodComplete(@"TSUColor", @"colorWithHue:saturation:brightness:alpha:", "@", v1473, v1474, v1475, v1476, v1477, "d");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"redComponent", "d", v1478, v1479, v1480, v1481, v1482, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"blueComponent", "d", v1483, v1484, v1485, v1486, v1487, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"greenComponent", "d", v1488, v1489, v1490, v1491, v1492, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"alphaComponent", "d", v1493, v1494, v1495, v1496, v1497, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"hueComponent", "d", v1498, v1499, v1500, v1501, v1502, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"saturationComponent", "d", v1503, v1504, v1505, v1506, v1507, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"getRGBAComponents:", "v", v1508, v1509, v1510, v1511, v1512, "^d");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUImage", @"size", "{CGSize=dd}", v1513, v1514, v1515, v1516, v1517, 0);
  __TSAccessibilityValidateClassMethodComplete(@"TSUNumberFormatter", @"displayNameForCurrencyCode:", "@", v1518, v1519, v1520, v1521, v1522, "@");
  __TSAccessibilityValidateProtocolMethod(@"TSKScrollViewDelegate", @"scrollView:willAnimateToContentOffset:", 0, 1);
  __TSAccessibilityValidateClass(@"TSDStroke");
  __TSAccessibilityValidateClass(@"TSDShapeLayout");
  __TSAccessibilityValidateClass(@"TSDShadowSwatch");
  __TSAccessibilityValidateClass(@"TSKToolbar");
  __TSAccessibilityValidateClass(@"TSTCell");
  __TSAccessibilityValidateClass(@"TSWPColumn");
  __TSAccessibilityValidateClass(@"TSUColor");
  __TSAccessibilityValidateIsKindOfClass(@"TSDContainerRep", @"TSDRep");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDContainerRep", @"childReps", "@", v1523, v1524, v1525, v1526, v1527, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSAInteractiveCanvasController", @"TSDInteractiveCanvasController");
  __TSAccessibilityValidateIsKindOfClass(@"TSKScrollView", @"UIScrollView");
  __TSAccessibilityValidateClassMethod(@"TSWPEditMenuController", @"sharedEditMenuController");
  __TSAccessibilityValidateInstanceMethod(@"TSDRep", @"setParentRep:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPRep", @"overlayLayers");
  __TSAccessibilityValidateInstanceMethod(@"TSPObject", @"context");
  __TSAccessibilityValidateInstanceMethod(@"TSSStyle", @"name");
  __TSAccessibilityValidateInstanceMethod(@"TSSStyle", @"name");
  __TSAccessibilityValidateInstanceMethod(@"TSDShapeLayout", @"layoutInfoGeometry");
  __TSAccessibilityValidateInstanceMethod(@"TSDInteractiveCanvasController", @"setViewScale:andScrollViewFrame:maintainPosition:animated:");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"scrollView:willAnimateToContentOffset:", "v", v1528, v1529, v1530, v1531, v1532, "@");
  __TSAccessibilityValidateInstanceMethod(@"TSDDrawableInfo", @"parentInfo");
  __TSAccessibilityValidateInstanceMethod(@"TSDStroke", @"pattern");
  __TSAccessibilityValidateInstanceMethod(@"TSSStyle", @"styleIdentifier");
  __TSAccessibilityValidateInstanceMethod(@"TSDShadowSwatch", @"shadow");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDRep", @"initWithLayout:canvas:", "@", v1533, v1534, v1535, v1536, v1537, "@");
  __TSAccessibilityValidateInstanceMethod(@"TSPData", @"filename");
  __TSAccessibilityValidateInstanceMethod(@"TSWPRep", @"beginEditing");
  __TSAccessibilityValidateInstanceMethod(@"TSWPRep", @"canEditWithEditor:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"selectAll:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"copy:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"p_sendHandleTapNotification");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"unfilteredText");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"insertText:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"deleteBackward");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"deleteForward");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"definitionAction:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"styleAction:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"replaceAction:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"p_updateHUDState");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditMenuController", @"p_setMenuVisible:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"setIsBecomingActive:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"canPerformEditorAction:withSender:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"shouldShowEditMenu");
  __TSAccessibilityValidateInstanceMethod(@"TSWPEditingController", @"editorCanHideEditMenu");
  __TSAccessibilityValidateInstanceMethod(@"TSDKnob", @"knobImage");
  __TSAccessibilityValidateInstanceMethod(@"TSDInteractiveCanvasController", @"hitKnobAtPoint:returningRep:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPColumn", @"lineIndexForCharIndex:eol:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPColumn", @"rangeOfLineFragmentAtIndex:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPColumn", @"glyphRectForRange:includingLabel:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPRep", @"columnForCharIndex:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPRep", @"charIndexForPointWithPinning:");
  __TSAccessibilityValidateInstanceMethod(@"TSWPStorage", @"valueForProperty:atCharIndex:effectiveRange:");
  __TSAccessibilityValidateInstanceMethod(@"TSUIntegerKeyDictionary", @"objectForKey:");
  __TSAccessibilityValidateInstanceMethod(@"TSUIntegerKeyDictionary", @"valueEnumerator");
  __TSAccessibilityValidateInstanceMethod(@"UITableViewCell", @"editControlWasClicked:");
  __TSAccessibilityValidateInstanceMethod(@"TSDDrawableInfo", @"owningAttachment");
  __TSAccessibilityValidateIvar(@"TSDInteractiveCanvasController", "mRepsByRepLayer");
  __TSAccessibilityValidateIvar(@"TSKSegmentedControl", "mButtonSegments");
  __TSAccessibilityValidateIvar(@"TSDCanvas", "mAllReps");
  __TSAccessibilityValidateProtocolMethod(@"TSDInfo", @"owningAttachment", 1, 1);
  if ([(TSAccessibility *)self supportsTableEditing])
  {
    __TSAccessibilityValidateIsKindOfClass(@"TSTiOSCellEditorViewController", @"UIViewController");
    __TSAccessibilityValidateIvarType(@"TSTNumberCellEditor", "mCachedCurrencyCode", "NSString");
    __TSAccessibilityValidateInstanceMethodComplete(@"TSTNumberCellEditor", @"deleteBackward", "v", v1538, v1539, v1540, v1541, v1542, 0);
    __TSAccessibilityValidateInstanceMethod(@"TSTTableKnob", @"knobVariant");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mNumberSegment");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mBackSegment");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mDateDurationSegment");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mTextSegment");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mFormulaSegment");
    __TSAccessibilityValidateIvar(@"TSTiOSCellEditorViewController", "mDoneCancelSubView");
  }
  __TSAccessibilityValidateClassMethod(@"UICalloutBar", @"sharedCalloutBar");
  __TSAccessibilityValidateInstanceMethod(@"UIDimmingView", @"passthroughViews");
  __TSAccessibilityValidateInstanceMethod(@"UIPopoverController", @"dimmingViewWasTapped:");
  __TSAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"_setContentOffset:duration:animationCurve:", "v", v1543, v1544, v1545, v1546, v1547, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethod(@"NSObject", @"_accessibilityShouldUseViewHierarchyForFindingScrollParent");
  __TSAccessibilityValidateInstanceMethod(@"UIApplication", @"_accessibilityMainWindow");
  __TSAccessibilityValidateInstanceMethod(@"UIApplication", @"_accessibilityElementFirst:last:forFocus:");
  __TSAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollAnimationDurationDelay");
  __TSAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollStatus");
  __TSAccessibilityValidateInstanceMethod(@"UIScrollView", @"_accessibilityScrollStatusFormatString");

  __TSAccessibilityValidateInstanceMethod(@"UIView", @"_accessibleSubviews");
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  [a3 addObject:@"TSCALayerAccessibility"];
  if ([(TSAccessibility *)self supportsCharts])
  {
    [a3 addObject:@"TSCH3DFillAccessibility"];
    [a3 addObject:@"TSCHChartDrawableInfoAccessibility"];
    [a3 addObject:@"TSCHChartInfoAccessibility"];
    [a3 addObject:@"TSCHChartRepAccessibility"];
    [a3 addObject:@"TSCHChartSeriesStyleAccessibility"];
    [a3 addObject:@"TSCHChartStylePresetAccessibility"];
    [a3 addObject:@"TSCHChartTypeAccessibility"];
  }
  [a3 addObject:@"TSDAngleGradientAccessibility"];
  [a3 addObject:@"TSDAudioRepAccessibility"];
  [a3 addObject:@"TSDBezierPathAccessibility"];
  [a3 addObject:@"TSDBezierPathSourceAccessibility"];
  [a3 addObject:@"TSDBrushStrokeAccessibility"];
  [a3 addObject:@"TSDCalloutPathSourceAccessibility"];
  [a3 addObject:@"TSDCanvasAccessibility"];
  [a3 addObject:@"TSDCanvasViewAccessibility"];
  [a3 addObject:@"TSDColorFillAccessibility"];
  [a3 addObject:@"TSDConnectionLinePathSourceAccessibility"];
  [a3 addObject:@"TSDContactShadowAccessibility"];
  [a3 addObject:@"TSDContainerRepAccessibility"];
  [a3 addObject:@"TSDCurvedShadowAccessibility"];
  [a3 addObject:@"TSDDrawableInfoAccessibility"];
  [a3 addObject:@"TSDDropShadowAccessibility"];
  [a3 addObject:@"TSDEditableBezierPathSourceAccessibility"];
  [a3 addObject:@"TSDEditorControllerAccessibility"];
  [a3 addObject:@"TSDFillAccessibility"];
  [a3 addObject:@"TSDFrameAccessibility"];
  [a3 addObject:@"TSDGradientAccessibility"];
  [a3 addObject:@"TSDGradientStopAccessibility"];
  [a3 addObject:@"TSDImageFillAccessibility"];
  [a3 addObject:@"TSDImageInfoAccessibility"];
  [a3 addObject:@"TSDImageRepAccessibility"];
  [a3 addObject:@"TSDInfoGeometryAccessibility"];
  [a3 addObject:@"TSDInteractiveCanvasControllerAccessibility"];
  [a3 addObject:@"TSDKnobAccessibility"];
  [a3 addObject:@"TSDKnobTrackerAccessibility"];
  [a3 addObject:@"TSDLayoutAccessibility"];
  [a3 addObject:@"TSDLayoutGeometryAccessibility"];
  [a3 addObject:@"TSDMediaStyleAccessibility"];
  [a3 addObject:@"TSDMovieInfoAccessibility"];
  [a3 addObject:@"TSDMovieKnobAccessibility"];
  [a3 addObject:@"TSDMovieRepAccessibility"];
  [a3 addObject:@"TSDPathSourceAccessibility"];
  [a3 addObject:@"TSDPointPathSourceAccessibility"];
  [a3 addObject:@"TSDReflectionAccessibility"];
  [a3 addObject:@"TSDRepAccessibility"];
  [a3 addObject:@"TSDScalarPathSourceAccessibility"];
  [a3 addObject:@"TSDShadowAccessibility"];
  [a3 addObject:@"TSDShapeInfoAccessibility"];
  [a3 addObject:@"TSDShapeLayoutAccessibility"];
  [a3 addObject:@"TSDShapeRepAccessibility"];
  [a3 addObject:@"TSDShapeStyleAccessibility"];
  [a3 addObject:@"TSDSmartStrokeAccessibility"];
  [a3 addObject:@"TSDStrokeAccessibility"];
  [a3 addObject:@"TSDStrokePatternAccessibility"];
  [a3 addObject:@"TSKAVPlayerControllerAccessibility"];
  [a3 addObject:@"TSKRulerUnitsAccessibility"];
  [a3 addObject:@"TSPDataAccessibility"];
  [a3 addObject:@"TSTCellAccessibility"];
  [a3 addObject:@"TSTCellRegionAccessibility"];
  [a3 addObject:@"TSTConfigurationAccessibility"];
  [a3 addObject:@"TSTMasterLayoutAccessibility"];
  [a3 addObject:@"TSTTableRepAccessibility"];
  [a3 addObject:@"TSTTableSelectionAccessibility"];
  [a3 addObject:@"TSTTableStylePresetAccessibility"];
  [a3 addObject:@"TSWPAttachmentAccessibility"];
  [a3 addObject:@"TSWPColumnAccessibility"];
  [a3 addObject:@"TSWPEditingControllerAccessibility"];
  [a3 addObject:@"TSWPFilteredStorageAccessibility"];
  [a3 addObject:@"TSWPFootnoteReferenceAttachmentAccessibility"];
  [a3 addObject:@"TSWPHyperlinkFieldAccessibility"];
  [a3 addObject:@"TSWPInteractiveCanvasControllerAccessibility"];
  [a3 addObject:@"TSWPListStyleAccessibility"];
  [a3 addObject:@"TSWPLayoutAccessibility"];
  [a3 addObject:@"TSWPRepAccessibility"];
  [a3 addObject:@"TSWPSelectionAccessibility"];
  [a3 addObject:@"TSWPShapeInfoAccessibility"];
  [a3 addObject:@"TSWPShapeRepAccessibility"];
  [a3 addObject:@"TSWPSmartFieldAccessibility"];
  [a3 addObject:@"TSWPStorageAccessibility"];
  [a3 addObject:@"TSWPStorageBroadcasterAccessibility"];
  [a3 addObject:@"TSSStyleAccessibility"];
  [a3 addObject:@"TSSPropertySetAccessibility"];
  [a3 addObject:@"TSSThemeAccessibility"];
  [a3 addObject:@"TSWPParagraphStyleAccessibility"];
  [a3 addObject:@"TSUColorAccessibility"];
  [a3 addObject:@"TSDBrushStrokeAccessibility"];
  [a3 addObject:@"TSDShadowSwatchAccessibility"];
  [a3 addObject:@"TSUIAccessibilityElementKBKey"];
  [a3 addObject:@"TSUIApplicationAccessibility"];
  [a3 addObject:@"TSUIButtonAccessibility"];
  [a3 addObject:@"TSUILabelAccessibility"];
  [a3 addObject:@"TSUIPageControlAccessibility"];
  [a3 addObject:@"TSUIReferenceLibraryViewControllerAccessibility"];
  [a3 addObject:@"TSUIScrollViewAccessibility"];
  [a3 addObject:@"TSUISliderAccessibility"];
  [a3 addObject:@"TSWPEditMenuControllerAccessibility"];
  [a3 addObject:@"TSWPShapeInfoAccessibility"];
  if ([(TSAccessibility *)self supportsTableEditing])
  {
    [a3 addObject:@"TSTiOSCellEditorViewControllerAccessibility"];
    [a3 addObject:@"TSTNumberCellEditorAccessibility"];
    [a3 addObject:@"TSTTableKnobAccessibility"];
  }
}

- (void)loadAccessibilitySupport
{
  if (![(TSAccessibility *)self accessibilitySupportLoaded])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      [(TSAccessibility *)self performValidation];
      if ([(TSAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityExtras])
      {
        if (objc_opt_respondsToSelector()) {
          [(TSAccessibility *)self performExtraValidation];
        }
      }
    }
    uint64_t v3 = objc_opt_new();
    [(TSAccessibility *)self addSafeCategoryNamesToCollection:v3];
    if [(TSAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityExtras]&& (objc_opt_respondsToSelector())
    {
      [(TSAccessibility *)self addExtraSafeCategoryNamesToCollection:v3];
    }
    TSAccessibilityInstallSafeCategories(v3);

    if [(TSAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityExtras]&& (objc_opt_respondsToSelector())
    {
      [(TSAccessibility *)self loadExtraAccessibilitySupport];
    }
    [(TSAccessibility *)self setAccessibilitySupportLoaded:1];
  }
}

- (BOOL)supportsCharts
{
  return 1;
}

- (BOOL)supportsTableEditing
{
  return 1;
}

- (BOOL)supportsAdvancedTextSearchExperience
{
  return 0;
}

- (id)canvasViewDescription
{
  return TSAccessibilityLocalizedString(@"canvas.general.description");
}

- (BOOL)accessibilitySupportLoaded
{
  return self->_accessibilitySupportLoaded;
}

- (void)setAccessibilitySupportLoaded:(BOOL)a3
{
  self->_accessibilitySupportLoaded = a3;
}

- (BOOL)quickSpeakSupportLoaded
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F8);
}

- (void)setQuickSpeakSupportLoaded:(BOOL)a3
{
}

- (BOOL)shouldFakeQuickSpeakAlwaysSpeaking
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F9);
}

- (void)setShouldFakeQuickSpeakAlwaysSpeaking:(BOOL)a3
{
}

- (BOOL)_isKeyboardVisible
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739FA);
}

- (void)_setKeyboardVisible:(BOOL)a3
{
}

- (CGRect)_keyboardFrame
{
  double AssociatedCGRect = __TSAccessibilityGetAssociatedCGRect(self, &unk_5739FB);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = AssociatedCGRect;
  return result;
}

- (void)_setKeyboardFrame:(CGRect)a3
{
}

- (id)cachedCurrentlyFocusedElement
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5739FC);
}

- (void)setCachedCurrentlyFocusedElement:(id)a3
{
}

- (id)cachedFirstElementForUpcomingScreenChange
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5739FD);
}

- (void)setCachedFirstElementForUpcomingScreenChange:(id)a3
{
}

- (unint64_t)firstElementForUpcomingScreenChangeResetCount
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_5739FE);
}

- (void)setFirstElementForUpcomingScreenChangeResetCount:(unint64_t)a3
{
}

- (id)cachedFirstElementForUpcomingPageTurn
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5739FF);
}

- (void)setCachedFirstElementForUpcomingPageTurn:(id)a3
{
}

- (unint64_t)firstElementForUpcomingPageTurnResetCount
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_573A00);
}

- (void)setFirstElementForUpcomingPageTurnResetCount:(unint64_t)a3
{
}

- (BOOL)_systemVersionIsGreaterOrEqualTo:(id)a3
{
  return [(NSString *)[+[UIDevice currentDevice] systemVersion] compare:a3 options:64] != NSOrderedAscending;
}

- (void)_keyboardWasShown:(id)a3
{
  [(TSAccessibility *)self _setKeyboardVisible:1];
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", UIKeyboardFrameEndUserInfoKey), "CGRectValue");

  -[TSAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:");
}

- (void)_keyboardWillBeHidden:(id)a3
{
  [(TSAccessibility *)self _setKeyboardVisible:0];
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;

  -[TSAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, y, width, height);
}

- (void)_setCurrentlyFocusedElement:(id)a3
{
}

- (id)preferencesDomain
{
  return @"com.apple.Accessibility";
}

- (void)performExtraValidation
{
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityFrameForSorting", "{CGRect={CGPoint=dd}{CGSize=dd}}", v2, v3, v4, v5, v6, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityHasTextOperations", "B", v8, v9, v10, v11, v12, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityLoadAccessibilityInformation", "v", v13, v14, v15, v16, v17, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityOverridesInstructionsHint", "B", v18, v19, v20, v21, v22, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityParentView", "@", v23, v24, v25, v26, v27, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityPerformCustomActionWithIdentifier:", "B", v28, v29, v30, v31, v32, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityScrollToVisible", "B", v33, v34, v35, v36, v37, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextOperationAction:", "B", v38, v39, v40, v41, v42, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextViewTextOperationResponder", "@", v43, v44, v45, v46, v47, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"_accessibilityTextOperations", "@", v48, v49, v50, v51, v52, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"accessibilityMenuActions", "@", v53, v54, v55, v56, v57, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"NSObject", @"accessibilityEditOperationAction:", "B", v58, v59, v60, v61, v62, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"UISlider", @"_setValue:andSendAction:", "v", v63, v64, v65, v66, v67, "f");
  __TSAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"_accessibilityScrollStatusPrefersVertical", "B", v68, v69, v70, v71, v72, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UIScrollView", @"accessibilityApplyScrollContent:sendScrollStatus:animated:", "v", v73, v74, v75, v76, v77, "{CGPoint=dd}");
  __TSAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityRetrieveTableViewCellText", "@", v78, v79, v80, v81, v82, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityRetrieveTableViewIvarsText", "@", v83, v84, v85, v86, v87, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UITableViewCell", @"_accessibilityTableViewCellSubclassShouldExist", "B", v88, v89, v90, v91, v92, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UIView", @"_accessibilityViewController", "@", v93, v94, v95, v96, v97, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UIView", @"_accessibleSubviews", "@", v98, v99, v100, v101, v102, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"UIWindow", @"firstResponder", "@", v103, v104, v105, v106, v107, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSADocumentViewController", @"TSAViewController");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSADocumentViewController", @"allowEditMenuToAppear", "B", v108, v109, v110, v111, v112, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSADocumentViewController", @"coachingTipsButton", "@", v113, v114, v115, v116, v117, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSADocumentViewController", @"setDocumentMode:animated:", "v", v118, v119, v120, v121, v122, "q");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSADocumentViewController", @"sharingButton", "@", v123, v124, v125, v126, v127, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSAViewController", @"toolbarButtonItemForCoachingTipsWithTarget:action:", "@", v128, v129, v130, v131, v132, "@");
  __TSAccessibilityValidateIsKindOfClass(@"TSDCheckableTableViewCell", @"UITableViewCell");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCheckableTableViewCell", @"checked", "B", v133, v134, v135, v136, v137, 0);
  __TSAccessibilityValidateIvarType(@"TSDCheckableTableViewCell", "mImageButton", "UIButton");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCheckableTableViewCell", @"setChecked:", "v", v138, v139, v140, v141, v142, "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDCheckableTableViewCell", @"setImage:forState:", "v", v143, v144, v145, v146, v147, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDoubleSegmentedControlTableViewCell", @"leftSegmentedControl", "@", v148, v149, v150, v151, v152, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDDoubleSegmentedControlTableViewCell", @"rightSegmentedControl", "@", v153, v154, v155, v156, v157, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDInteractiveCanvasController", @"textInputResponder", "@", v158, v159, v160, v161, v162, 0);
  __TSAccessibilityValidateIsKindOfClass(@"TSDiOSCanvasViewController", @"UIViewController");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"asiOSCVC", "@", v163, v164, v165, v166, v167, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"delegate", "@", v168, v169, v170, v171, v172, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"extraMenuItems", "@", v173, v174, v175, v176, v177, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"interactiveCanvasController", "@", v178, v179, v180, v181, v182, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"setContextMenuMightBeDisplayed:", "v", v183, v184, v185, v186, v187, "B");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDiOSCanvasViewController", @"showEditMenuForSelection:", "v", v188, v189, v190, v191, v192, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDPointPathSource", @"initWithType:point:naturalSize:", "@", v193, v194, v195, v196, v197, "i");
  __TSAccessibilityValidateIsKindOfClass(@"TSDTextInputResponder", @"UIResponder");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextInputResponder", @"editingTextRep", "@", v198, v199, v200, v201, v202, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextInputResponder", @"editingTextReps", "@", v203, v204, v205, v206, v207, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextInputResponder", @"editor", "@", v208, v209, v210, v211, v212, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextInputResponder", @"selectAll:", "v", v213, v214, v215, v216, v217, "@");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextInputResponder", @"p_ICC", "@", v218, v219, v220, v221, v222, 0);
  __TSAccessibilityValidateIvarType(@"TSDTextInputResponder", "_editor", "NSObject<TSDTextInput>");
  __TSAccessibilityValidateIvarType(@"TSDTextInputResponder", "_nextResponder", "UIResponder");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextRange", @"initWithRange:", "@", v223, v224, v225, v226, v227, "{_NSRange=QQ}");
  __TSAccessibilityValidateInstanceMethodComplete(@"TSDTextRange", @"range", "{_NSRange=QQ}", v228, v229, v230, v231, v232, 0);
  __TSAccessibilityValidateInstanceMethodComplete(@"TSKPopoverBasedViewController", @"p_newCloseImageBarButtonWithTarget:action:", "@", v233, v234, v235, v236, v237, "@");
  __TSAccessibilityValidateIvarType(@"TSKPopoverBasedViewController", "mPopoverController", "TSKPopoverController");
  __TSAccessibilityValidateIvarType(@"TSKSegmentedControl", "mButtonSegments", "NSMutableArray");
  if ([(TSAccessibility *)self supportsCharts]) {
    __TSAccessibilityValidateInstanceMethodComplete(@"TSAInsertPopoverController", @"p_orderedChartTypeArrayForPage:", "@", v238, v239, v240, v241, v242, "Q");
  }
  __TSAccessibilityValidateInstanceMethodComplete(@"TSUColor", @"UIColor", "@", v238, v239, v240, v241, v242, 0);
}

- (void)addExtraSafeCategoryNamesToCollection:(id)a3
{
  [a3 addObject:@"TSNSObjectAccessibility_iOS"];
  [a3 addObject:@"TSUICollectionViewCellAccessibility"];
  [a3 addObject:@"TSUIInputSetHostViewAccessibility"];
  [a3 addObject:@"TSUIMenuControllerAccessibility"];
  [a3 addObject:@"TSUINavigationItemAccessibility"];
  [a3 addObject:@"TSUIPopoverPresentationControllerAccessibility"];
  [a3 addObject:@"TSUITableViewCellAccessibility"];
  [a3 addObject:@"TSUIViewAccessibility"];
  [a3 addObject:@"TSUIViewControllerAccessibility"];
  [a3 addObject:@"TSUIWindowAccessibility"];
  [a3 addObject:@"TSAViewControllerAccessibility"];
  [a3 addObject:@"TSDCheckableTableViewCellAccessibility"];
  [a3 addObject:@"TSDDoubleSegmentedControlTableViewCellAccessibility"];
  [a3 addObject:@"TSDiOSCanvasViewControllerAccessibility"];
  [a3 addObject:@"TSDTextInputResponderAccessibility"];
  [a3 addObject:@"TSDTextRangeAccessibility"];
  [a3 addObject:@"TSWPEquationRepAccessibility"];
  [a3 addObject:@"TSKPopoverBasedViewControllerAccessibility"];

  [a3 addObject:@"TSKSegmentedControlAccessibility"];
}

- (void)loadExtraAccessibilitySupport
{
  -[TSAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"_keyboardWasShown:" name:UIKeyboardDidShowNotification object:0];

  [(NSNotificationCenter *)v3 addObserver:self selector:"_keyboardWillBeHidden:" name:UIKeyboardWillHideNotification object:0];
}

- (void)unloadExtraAccessibilitySupport
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;

  -[TSAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, y, width, height);
}

- (void)handlePostingAnnouncement:(id)a3 sender:(id)a4 priority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!+[NSThread isMainThread])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Need to post announcements from main thread only.", v8, v9, v10, v11, v12, v16))abort(); {
    }
      }
  }
  if (v5 == 5 || ![a3 length])
  {
    id v15 = a3;
  }
  else
  {
    id v13 = [objc_alloc((Class)NSNumber) initWithInt:v5];
    id v14 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v13, @"UIAccessibilityTokenAnnouncementPriority", 0];

    id v17 = [objc_alloc((Class)NSAttributedString) initWithString:a3 attributes:v14];
    id v15 = v17;
  }
  id v18 = v15;
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v15);
}

- (void)loadQuickSpeakSupport
{
  if (![(TSAccessibility *)self quickSpeakSupportLoaded]
    && NSClassFromString(@"AXQuickSpeak"))
  {
    [(TSAccessibility *)self setQuickSpeakSupportLoaded:1];
    if (TSAccessibilityShouldPerformValidationChecks()) {
      __TSAccessibilityValidateInstanceMethod(@"AXQuickSpeak", @"isSpeaking");
    }
    TSAccessibilityInstallSafeCategory(@"TSAXQuickSpeak");
  }
}

- (BOOL)isQuickSpeakEnabled
{
  BOOL v3 = [(TSAccessibility *)self quickSpeakSupportLoaded];
  if (v3)
  {
    BOOL v4 = [(TSAccessibility *)self shouldFakeQuickSpeakAlwaysSpeaking];
    [(TSAccessibility *)self setShouldFakeQuickSpeakAlwaysSpeaking:1];
    unsigned __int8 v5 = [(TSAccessibility *)self tsaxBoolValueForKey:@"_accessibilityShouldShowPauseBubble"];
    [(TSAccessibility *)self setShouldFakeQuickSpeakAlwaysSpeaking:v4];
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isKeyboardVisible
{
  return [(TSAccessibility *)self _isKeyboardVisible];
}

- (CGRect)keyboardFrame
{
  [(TSAccessibility *)self _keyboardFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

- (id)currentlyFocusedElement
{
  return [(TSAccessibility *)self cachedCurrentlyFocusedElement];
}

- (void)setFirstElementForUpcomingScreenChange:(id)a3
{
  if ([(TSAccessibility *)self cachedFirstElementForUpcomingScreenChange] != a3)
  {
    [(TSAccessibility *)self setCachedFirstElementForUpcomingScreenChange:a3];
    [(TSAccessibility *)self setFirstElementForUpcomingScreenChangeResetCount:(char *)[(TSAccessibility *)self firstElementForUpcomingScreenChangeResetCount]+ 1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_275638;
    v5[3] = &unk_456DE0;
    v5[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

- (void)setFirstElementForUpcomingPageTurn:(id)a3
{
  if ([(TSAccessibility *)self cachedFirstElementForUpcomingPageTurn] != a3)
  {
    [(TSAccessibility *)self setCachedFirstElementForUpcomingPageTurn:a3];
    [(TSAccessibility *)self setFirstElementForUpcomingPageTurnResetCount:(char *)[(TSAccessibility *)self firstElementForUpcomingPageTurnResetCount]+ 1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_275758;
    v5[3] = &unk_456DE0;
    v5[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

+ (Class)specializedClass
{
  return (Class)objc_opt_class();
}

@end