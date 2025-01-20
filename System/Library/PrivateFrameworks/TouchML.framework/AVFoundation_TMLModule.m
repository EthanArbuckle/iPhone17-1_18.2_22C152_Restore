@interface AVFoundation_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation AVFoundation_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23986BC78;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A058E8 != -1) {
    dispatch_once(&qword_268A058E8, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v20 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v20, v6, v7, &unk_26ECED188, @"CMTimeMakeWithSeconds");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v8, v9, &unk_26ECED1A8, @"CMTimeAdd");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v10, v11, &unk_26ECED1C8, @"CMTimeRangeMake");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v12, v13, &unk_26ECED1E8, @"CMTimeRangeFromTimeToTime");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v14, v15, &unk_26ECED208, @"CMTimeGetSeconds");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v16, v17, &unk_26ECED228, @"CMTimeMultiplyByFloat64");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v18, v19, &unk_26ECED248, @"CMTimeCompare");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  double v7 = objc_msgSend_dictionary(v3, v5, v6);
  uint64_t v8 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v7, v9, v10, &unk_26ED19E68, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v11, v12, @"AVPlayerStatusUnknown", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v13, v14, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v15, v16, @"AVPlayerStatusReadyToPlay", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v17, v18, &unk_26ED19E98, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v19, v20, @"AVPlayerStatusFailed", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v21, v22, &unk_26ED19E68, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v23, v24, @"AVPlayerItemStatusUnknown", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v25, v26, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v27, v28, @"AVPlayerItemStatusReadyToPlay", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v29, v30, &unk_26ED19E98, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v31, v32, @"AVPlayerItemStatusFailed", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v33, v34, &unk_26ED19E68, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v35, v36, @"AVPlayerTimeControlStatusPaused", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v37, v38, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v39, v40, @"AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v41, v42, &unk_26ED19E98, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v43, v44, @"AVPlayerTimeControlStatusPlaying", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v45, v46, &unk_26ED19E68, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v47, v48, @"AVPlayerActionAtItemEndAdvance", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v49, v50, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v51, v52, @"AVPlayerActionAtItemEndPause", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v53, v54, &unk_26ED19E98, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v55, v56, @"AVPlayerActionAtItemEndNone", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v57, v58, *MEMORY[0x263EFA0E0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v59, v60, @"AVPlayerItemTimeJumpedNotification", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v61, v62, *MEMORY[0x263EFA050], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v63, v64, @"AVPlayerItemDidPlayToEndTimeNotification", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v65, v66, *MEMORY[0x263EFA060], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v67, v68, @"AVPlayerItemFailedToPlayToEndTimeNotification", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v69, v70, *MEMORY[0x263EFA0B8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v71, v72, @"AVPlayerItemPlaybackStalledNotification", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v73, v74, *MEMORY[0x263EFA058], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v75, v76, @"AVPlayerItemFailedToPlayToEndTimeErrorKey", v7);
  long long v351 = *MEMORY[0x263F010E0];
  *(void *)&long long v352 = *(void *)(MEMORY[0x263F010E0] + 16);
  v78 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v77, *(double *)&v351, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v79, v80, v78, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v81, v82, @"kCMTimeZero", v7);
  long long v351 = *MEMORY[0x263F01088];
  *(void *)&long long v352 = *(void *)(MEMORY[0x263F01088] + 16);
  v84 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v83, *(double *)&v351, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v85, v86, v84, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v87, v88, @"kCMTimeIndefinite", v7);
  long long v351 = *MEMORY[0x263F01090];
  *(void *)&long long v352 = *(void *)(MEMORY[0x263F01090] + 16);
  v90 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v89, *(double *)&v351, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v91, v92, v90, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v93, v94, @"kCMTimeInvalid", v7);
  long long v351 = *MEMORY[0x263F010B8];
  *(void *)&long long v352 = *(void *)(MEMORY[0x263F010B8] + 16);
  v96 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v95, *(double *)&v351, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v97, v98, v96, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v99, v100, @"kCMTimePositiveInfinity", v7);
  long long v351 = *MEMORY[0x263F010A0];
  *(void *)&long long v352 = *(void *)(MEMORY[0x263F010A0] + 16);
  v102 = objc_msgSend_valueWithCMTime_(MEMORY[0x263F08D40], v101, *(double *)&v351, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v103, v104, v102, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v105, v106, @"kCMTimeNegativeInfinity", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v107, v108, *MEMORY[0x263EF9C70], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v109, v110, @"AVLayerVideoGravityResizeAspect", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v111, v112, *MEMORY[0x263EF9C78], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v113, v114, @"AVLayerVideoGravityResizeAspectFill", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v115, v116, *MEMORY[0x263EF9C68], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v117, v118, @"AVLayerVideoGravityResize", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v119, v120, *MEMORY[0x263EF9590], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v121, v122, @"AVAssetExportPresetLowQuality", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v123, v124, *MEMORY[0x263EF95A0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v125, v126, @"AVAssetExportPresetMediumQuality", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v127, v128, *MEMORY[0x263EF9588], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v129, v130, @"AVAssetExportPresetHighestQuality", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v131, v132, *MEMORY[0x263EF9550], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v133, v134, @"AVAssetExportPreset640x480", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v135, v136, *MEMORY[0x263EF9558], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v137, v138, @"AVAssetExportPreset960x540", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v139, v140, *MEMORY[0x263EF9530], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v141, v142, @"AVAssetExportPreset1280x720", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v143, v144, *MEMORY[0x263EF9538], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v145, v146, @"AVAssetExportPreset1920x1080", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v147, v148, *MEMORY[0x263EF9568], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v149, v150, @"AVAssetExportPresetAppleM4A", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v151, v152, *MEMORY[0x263EF95C0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v153, v154, @"AVAssetExportPresetPassthrough", v7);
  long long v155 = *(_OWORD *)(MEMORY[0x263F010D0] + 16);
  long long v351 = *MEMORY[0x263F010D0];
  long long v352 = v155;
  long long v353 = *(_OWORD *)(MEMORY[0x263F010D0] + 32);
  v157 = objc_msgSend_valueWithCMTimeRange_(MEMORY[0x263F08D40], v156, *(double *)&v353, &v351);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v158, v159, v157, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v160, v161, @"kCMTimeRangeZero", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v162, v163, &unk_26ED19E68, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v164, v165, @"AVSpeechBoundaryImmediate", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v166, v167, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v168, v169, @"AVSpeechBoundaryWord", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v170, v171, &unk_26ED19E80, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v172, v173, @"AVSpeechSynthesisVoiceQualityDefault", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v174, v175, &unk_26ED19E98, v8);
  objc_msgSend_defineProperty_descriptor_(v4, v176, v177, @"AVSpeechSynthesisVoiceQualityEnhanced", v7);
  LODWORD(v178) = *MEMORY[0x263EF9318];
  v180 = objc_msgSend_numberWithFloat_(NSNumber, v179, v178);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v181, v182, v180, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v183, v184, @"AVSpeechUtteranceMinimumSpeechRate", v7);
  LODWORD(v185) = *MEMORY[0x263EF9310];
  v187 = objc_msgSend_numberWithFloat_(NSNumber, v186, v185);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v188, v189, v187, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v190, v191, @"AVSpeechUtteranceMaximumSpeechRate", v7);
  LODWORD(v192) = *MEMORY[0x263EF9308];
  v194 = objc_msgSend_numberWithFloat_(NSNumber, v193, v192);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v195, v196, v194, v8);

  objc_msgSend_defineProperty_descriptor_(v4, v197, v198, @"AVSpeechUtteranceDefaultSpeechRate", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v199, v200, *MEMORY[0x263EF9300], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v201, v202, @"AVSpeechSynthesisVoiceIdentifierAlex", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v203, v204, *MEMORY[0x263EF9D48], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v205, v206, @"AVMediaTypeVideo", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v207, v208, *MEMORY[0x263EF9CE8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v209, v210, @"AVMediaTypeAudio", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v211, v212, *MEMORY[0x263EF9D38], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v213, v214, @"AVMediaTypeText", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v215, v216, *MEMORY[0x263EF9CF0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v217, v218, @"AVMediaTypeClosedCaption", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v219, v220, *MEMORY[0x263EF9D30], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v221, v222, @"AVMediaTypeSubtitle", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v223, v224, *MEMORY[0x263EF9D40], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v225, v226, @"AVMediaTypeTimecode", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v227, v228, *MEMORY[0x263EF9D08], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v229, v230, @"AVMediaTypeMetadata", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v231, v232, *MEMORY[0x263EF9D18], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v233, v234, @"AVMediaTypeMuxed", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v235, v236, *MEMORY[0x263EFA248], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v237, v238, @"AVURLAssetHTTPCookiesKey", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v239, v240, *MEMORY[0x263EFA1D0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v241, v242, @"AVURLAssetAllowsCellularAccessKey", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v243, v244, *MEMORY[0x263EFA1E0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v245, v246, @"AVURLAssetAllowsExpensiveNetworkAccessKey", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v247, v248, *MEMORY[0x263EFA1D8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v249, v250, @"AVURLAssetAllowsConstrainedNetworkAccessKey", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v251, v252, *MEMORY[0x263EF9780], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v253, v254, @"AVCaptureSessionPresetPhoto", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v255, v256, *MEMORY[0x263EF9758], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v257, v258, @"AVCaptureSessionPresetHigh", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v259, v260, *MEMORY[0x263EF9778], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v261, v262, @"AVCaptureSessionPresetMedium", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v263, v264, *MEMORY[0x263EF9770], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v265, v266, @"AVCaptureSessionPresetLow", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v267, v268, *MEMORY[0x263EF9768], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v269, v270, @"AVCaptureSessionPresetInputPriority", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v271, v272, *MEMORY[0x263EF9740], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v273, v274, @"AVCaptureSessionPreset352x288", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v275, v276, *MEMORY[0x263EF9750], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v277, v278, @"AVCaptureSessionPreset640x480", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v279, v280, *MEMORY[0x263EF9730], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v281, v282, @"AVCaptureSessionPreset1280x720", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v283, v284, *MEMORY[0x263EF9738], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v285, v286, @"AVCaptureSessionPreset1920x1080", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v287, v288, *MEMORY[0x263EF9748], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v289, v290, @"AVCaptureSessionPreset3840x2160", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v291, v292, *MEMORY[0x263EF9790], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v293, v294, @"AVCaptureSessionPresetiFrame960x540", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v295, v296, *MEMORY[0x263EF9788], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v297, v298, @"AVCaptureSessionPresetiFrame1280x720", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v299, v300, *MEMORY[0x263EF9F60], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v301, v302, @"AVMetadataObjectTypeUPCECode", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v303, v304, *MEMORY[0x263EF9EC0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v305, v306, @"AVMetadataObjectTypeCode39Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v307, v308, *MEMORY[0x263EF9EC8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v309, v310, @"AVMetadataObjectTypeCode39Mod43Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v311, v312, *MEMORY[0x263EF9EF0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v313, v314, @"AVMetadataObjectTypeEAN13Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v315, v316, *MEMORY[0x263EF9EF8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v317, v318, @"AVMetadataObjectTypeEAN8Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v319, v320, *MEMORY[0x263EF9ED0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v321, v322, @"AVMetadataObjectTypeCode93Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v323, v324, *MEMORY[0x263EF9EB8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v325, v326, @"AVMetadataObjectTypeCode128Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v327, v328, *MEMORY[0x263EF9F38], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v329, v330, @"AVMetadataObjectTypePDF417Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v331, v332, *MEMORY[0x263EF9F40], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v333, v334, @"AVMetadataObjectTypeQRCode", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v335, v336, *MEMORY[0x263EF9EA0], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v337, v338, @"AVMetadataObjectTypeAztecCode", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v339, v340, *MEMORY[0x263EF9F30], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v341, v342, @"AVMetadataObjectTypeInterleaved2of5Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v343, v344, *MEMORY[0x263EF9F28], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v345, v346, @"AVMetadataObjectTypeITF14Code", v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v347, v348, *MEMORY[0x263EF9ED8], v8);
  objc_msgSend_defineProperty_descriptor_(v4, v349, v350, @"AVMetadataObjectTypeDataMatrixCode", v7);
}

@end