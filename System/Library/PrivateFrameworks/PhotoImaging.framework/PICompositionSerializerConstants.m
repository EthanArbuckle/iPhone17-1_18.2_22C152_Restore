@interface PICompositionSerializerConstants
+ (id)conversionMap;
+ (id)mapForSerialization;
@end

@implementation PICompositionSerializerConstants

+ (id)mapForSerialization
{
  if (mapForSerialization_onceToken != -1) {
    dispatch_once(&mapForSerialization_onceToken, &__block_literal_global_1183);
  }
  v2 = (void *)mapForSerialization__s_inverseMap;
  return v2;
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke()
{
  v118[38] = *MEMORY[0x1E4F143B8];
  v117[0] = @"smartTone";
  v115[0] = @"identifierName";
  v115[1] = @"compositionName";
  v116[0] = @"SmartTone";
  v116[1] = @"smartTone";
  v115[2] = @"inputLight";
  v115[3] = @"statistics";
  v116[2] = @"inputLight";
  v116[3] = @"statistics";
  v115[4] = @"auto";
  v115[5] = @"inputImage";
  v116[4] = @"auto";
  v116[5] = @"inputImage";
  v115[6] = @"customSerialization";
  v115[7] = @"autoValue";
  v116[6] = &__block_literal_global_1186;
  v116[7] = &__block_literal_global_1188;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:8];
  v118[0] = v40;
  v117[1] = @"smartColor";
  v113[0] = @"identifierName";
  v113[1] = @"compositionName";
  v114[0] = @"SmartColor";
  v114[1] = @"smartColor";
  v113[2] = @"inputColor";
  v113[3] = @"statistics";
  v114[2] = @"inputColor";
  v114[3] = @"statistics";
  v113[4] = @"auto";
  v113[5] = @"customSerialization";
  v114[4] = @"auto";
  v114[5] = &__block_literal_global_1193;
  v113[6] = @"autoValue";
  v114[6] = &__block_literal_global_1195;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:7];
  v118[1] = v39;
  v117[2] = @"smartBlackAndWhite";
  v112[0] = @"SmartBlackAndWhite";
  v112[1] = @"smartBlackAndWhite";
  v112[2] = &__block_literal_global_1197;
  v112[3] = @"offsetGrain";
  v111[0] = @"identifierName";
  v111[1] = @"compositionName";
  v111[4] = @"tone";
  v111[5] = @"hue";
  v112[4] = @"offsetTone";
  v112[5] = @"inputBlackAndWhite";
  v111[2] = @"customSerialization";
  v111[3] = @"grain";
  v111[6] = @"neutral";
  v111[7] = @"auto";
  v112[6] = @"offsetNeutralGamma";
  v112[7] = @"auto";
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:8];
  v118[2] = v38;
  v117[3] = @"grain";
  v109[0] = @"identifierName";
  v109[1] = @"compositionName";
  v110[0] = @"Grain";
  v110[1] = @"grain";
  v109[2] = @"iso";
  v109[3] = @"amount";
  v110[2] = @"iso";
  v110[3] = @"amount";
  v109[4] = @"seed";
  v110[4] = @"seed";
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:5];
  v118[3] = v37;
  v117[4] = @"vignette";
  v108[0] = @"DGVignetteEffectOperation";
  v108[1] = @"vignette";
  v107[0] = @"identifierName";
  v107[1] = @"compositionName";
  v107[2] = @"inputKeys";
  v107[3] = @"auto";
  v108[2] = &unk_1F000AE40;
  v108[3] = @"auto";
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:4];
  v118[4] = v36;
  v117[5] = @"definition";
  v105[0] = @"identifierName";
  v105[1] = @"compositionName";
  v106[0] = @"DGDefinition2Operation";
  v106[1] = @"definition";
  v105[2] = @"inputKeys";
  v105[3] = @"auto";
  v106[2] = &unk_1F000AE68;
  v106[3] = @"auto";
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:4];
  v118[5] = v35;
  v117[6] = @"noiseReduction";
  v103[0] = @"identifierName";
  v103[1] = @"compositionName";
  v104[0] = @"RKNoiseReductionOperation";
  v104[1] = @"noiseReduction";
  v103[2] = @"inputKeys";
  v103[3] = @"auto";
  v104[2] = &unk_1F000AE90;
  v104[3] = @"auto";
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:4];
  v118[6] = v34;
  v117[7] = @"sharpen";
  v101[0] = @"identifierName";
  v101[1] = @"compositionName";
  v102[0] = @"RKProSharpenOperation";
  v102[1] = @"sharpen";
  v101[2] = @"inputKeys";
  v101[3] = @"auto";
  v102[2] = &unk_1F000AEB8;
  v102[3] = @"auto";
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:4];
  v118[7] = v33;
  v117[8] = @"effect";
  v99[0] = @"identifierName";
  v99[1] = @"customSerialization";
  v100[0] = @"Effect";
  v100[1] = &__block_literal_global_1213_13151;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
  v118[8] = v32;
  v117[9] = @"effect3D";
  v97[0] = @"identifierName";
  v97[1] = @"customSerialization";
  v98[0] = @"Effect";
  v98[1] = &__block_literal_global_1215;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
  v118[9] = v31;
  v117[10] = @"orientation";
  v95[0] = @"identifierName";
  v95[1] = @"compositionName";
  v96[0] = @"Orientation";
  v96[1] = @"orientation";
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
  v118[10] = v30;
  v117[11] = @"cropStraighten";
  v93[0] = @"identifierName";
  v93[1] = @"compositionName";
  v94[0] = @"Crop";
  v94[1] = @"cropStraighten";
  v93[2] = @"xOrigin";
  v93[3] = @"yOrigin";
  v94[2] = @"xOrigin";
  v94[3] = @"yOrigin";
  v93[4] = @"width";
  v93[5] = @"height";
  v94[4] = @"width";
  v94[5] = @"height";
  v93[6] = @"angle";
  v93[7] = @"pitch";
  v94[6] = @"straightenAngle";
  v94[7] = @"pitch";
  v93[8] = @"yaw";
  v93[9] = @"constraintHeight";
  v94[8] = @"yaw";
  v94[9] = @"constraintHeight";
  v93[10] = @"constraintWidth";
  v93[11] = @"customSerialization";
  v94[10] = @"constraintWidth";
  v94[11] = &__block_literal_global_1217;
  v93[12] = @"auto";
  v93[13] = @"autoValue";
  v94[12] = @"auto";
  v94[13] = &__block_literal_global_1219;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:14];
  v118[11] = v29;
  v117[12] = @"rawNoiseReduction";
  v91[0] = @"identifierName";
  v91[1] = @"compositionName";
  v92[0] = @"DGRAWReduceNoiseOperation";
  v92[1] = @"rawNoiseReduction";
  v92[2] = @"inputDetailAmount";
  v92[3] = @"inputCNRAmount";
  v91[2] = @"detail";
  v91[3] = @"color";
  v91[4] = @"luminance";
  v91[5] = @"auto";
  v92[4] = @"inputLNRAmount";
  v92[5] = @"auto";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:6];
  v118[12] = v28;
  v117[13] = @"raw";
  v90[0] = @"RKRawDecodeOperation";
  v90[1] = @"raw";
  v89[0] = @"identifierName";
  v89[1] = @"compositionName";
  v89[2] = @"inputDecoderVersion";
  v89[3] = @"boostVersion";
  v90[2] = @"inputMethodVersion";
  v90[3] = @"boostVersion";
  v89[4] = @"boostParams";
  v89[5] = @"gainMapVersion";
  v90[4] = @"boostParams";
  v90[5] = @"gainMapVersion";
  v89[6] = @"gainMapParameters";
  v89[7] = @"requiresEnabled";
  uint64_t v0 = MEMORY[0x1E4F1CC38];
  v90[6] = @"gainMapParameters";
  v90[7] = MEMORY[0x1E4F1CC38];
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:8];
  v118[13] = v27;
  v117[14] = @"whiteBalance";
  v87[0] = @"identifierName";
  v87[1] = @"compositionName";
  v88[0] = @"WhiteBalance";
  v88[1] = @"whiteBalance";
  v87[2] = @"faceStrength";
  v87[3] = @"faceWarmth";
  v88[2] = @"faceStrength";
  v88[3] = @"faceWarmth";
  v87[4] = @"faceI";
  v87[5] = @"faceQ";
  v88[4] = @"faceI";
  v88[5] = @"faceQ";
  v87[6] = @"grayWarmth";
  v87[7] = @"grayY";
  v88[6] = @"grayWarmth";
  v88[7] = @"grayY";
  v87[8] = @"grayI";
  v87[9] = @"grayQ";
  v88[8] = @"grayI";
  v88[9] = @"grayQ";
  v87[10] = @"customSerialization";
  v87[11] = @"autoValue";
  v88[10] = &__block_literal_global_1221;
  v88[11] = &__block_literal_global_1223;
  v87[12] = @"temperature";
  v87[13] = @"tint";
  v88[12] = @"temperature";
  v88[13] = @"tint";
  v87[14] = @"warmTemp";
  v87[15] = @"warmTint";
  v88[14] = @"warmTemp";
  v88[15] = @"warmTint";
  v87[16] = @"warmFace";
  v87[17] = @"auto";
  v88[16] = @"warmFace";
  v88[17] = @"auto";
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:18];
  v118[14] = v26;
  v117[15] = @"levels";
  v85[0] = @"identifierName";
  v85[1] = @"compositionName";
  v86[0] = @"RKLevelsOperation";
  v86[1] = @"levels";
  v85[2] = @"colorSpace";
  v85[3] = @"inputKeys";
  v86[2] = @"inputColorSpace";
  v86[3] = &unk_1F000AEE0;
  v85[4] = @"auto";
  v86[4] = @"auto";
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:5];
  v118[15] = v25;
  v117[16] = @"curves";
  v83[0] = @"identifierName";
  v83[1] = @"compositionName";
  v84[0] = @"RKCurvesOperation";
  v84[1] = @"curves";
  v83[2] = @"inputKeys";
  v83[3] = @"auto";
  v84[2] = &unk_1F000AF08;
  v84[3] = @"auto";
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:4];
  v118[16] = v24;
  v117[17] = @"selectiveColor";
  v81[0] = @"identifierName";
  v81[1] = @"compositionName";
  v82[0] = @"RKSelectiveColorOperation";
  v82[1] = @"selectiveColor";
  v81[2] = @"customSerialization";
  v82[2] = &__block_literal_global_1242;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v118[17] = v23;
  v117[18] = @"retouch";
  v79[0] = @"identifierName";
  v79[1] = @"compositionName";
  v80[0] = @"RKRetouchOperation";
  v80[1] = @"retouch";
  v79[2] = @"customSerialization";
  v80[2] = &__block_literal_global_1244;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v118[18] = v22;
  v117[19] = @"inpaint";
  v77[0] = @"identifierName";
  v77[1] = @"compositionName";
  v78[0] = @"Inpaint";
  v78[1] = @"inpaint";
  v77[2] = @"enabled";
  v77[3] = @"operations";
  v78[2] = @"enabled";
  v78[3] = @"operations";
  v77[4] = @"detectedFaces";
  v77[5] = @"version";
  v78[4] = @"detectedFaces";
  v78[5] = @"version";
  v77[6] = @"cleanupVersion";
  v77[7] = @"modelVersionInfo";
  v78[6] = @"cleanupVersion";
  v78[7] = @"modelVersionInfo";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:8];
  v118[19] = v21;
  v117[20] = @"inpaintMasks";
  v75[0] = @"identifierName";
  v75[1] = @"compositionName";
  v76[0] = @"InpaintMasks";
  v76[1] = @"inpaintMasks";
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
  v118[20] = v20;
  v117[21] = @"apertureRedEye";
  v73[0] = @"identifierName";
  v73[1] = @"compositionName";
  v74[0] = @"RKRedEyeOperation";
  v74[1] = @"apertureRedEye";
  v73[2] = @"customSerialization";
  v74[2] = &__block_literal_global_1249;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v118[21] = v19;
  v117[22] = @"redEye";
  v72[0] = @"RedEyeBB";
  v72[1] = @"redEye";
  v71[0] = @"identifierName";
  v71[1] = @"compositionName";
  v71[2] = @"inputCorrectionInfo";
  v71[3] = @"auto";
  v72[2] = @"redEyeCorrections";
  v72[3] = @"auto";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:4];
  v118[22] = v18;
  v117[23] = @"mute";
  v69[0] = @"identifierName";
  v69[1] = @"compositionName";
  v70[0] = @"Mute";
  v70[1] = @"mute";
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
  v118[23] = v17;
  v117[24] = @"trim";
  v67[0] = @"identifierName";
  v67[1] = @"compositionName";
  v68[0] = @"Trim";
  v68[1] = @"trim";
  v67[2] = @"customSerialization";
  v68[2] = &__block_literal_global_1251;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v118[24] = v16;
  v117[25] = @"slomo";
  v65[0] = @"identifierName";
  v65[1] = @"compositionName";
  v66[0] = @"SlowMotion";
  v66[1] = @"slomo";
  v65[2] = @"customSerialization";
  v66[2] = &__block_literal_global_1253;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
  v118[25] = v15;
  v117[26] = @"livePhotoKeyFrame";
  v63[0] = @"identifierName";
  v63[1] = @"compositionName";
  v64[0] = @"LivePhotoKeyFrame";
  v64[1] = @"livePhotoKeyFrame";
  v63[2] = @"customSerialization";
  v64[2] = &__block_literal_global_1255;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
  v118[26] = v14;
  v117[27] = @"videoPosterFrame";
  v61[0] = @"identifierName";
  v61[1] = @"compositionName";
  v62[0] = @"VideoPosterFrame";
  v62[1] = @"videoPosterFrame";
  v61[2] = @"customSerialization";
  v62[2] = &__block_literal_global_1263;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
  v118[27] = v13;
  v117[28] = @"autoLoop";
  v60[0] = @"AutoLoop";
  v60[1] = @"autoLoop";
  v59[0] = @"identifierName";
  v59[1] = @"compositionName";
  v59[2] = @"recipe";
  v59[3] = @"flavor";
  v60[2] = @"recipe";
  v60[3] = @"flavor";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:4];
  v118[28] = v12;
  v117[29] = @"highResFusion";
  v58[0] = @"HighResolutionFusion";
  v58[1] = @"highResFusion";
  v57[0] = @"identifierName";
  v57[1] = @"compositionName";
  v57[2] = @"alignment";
  v57[3] = @"omitIfDisabled";
  v58[2] = @"alignment";
  v58[3] = v0;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:4];
  v118[29] = v11;
  v117[30] = @"depthEffect";
  v56[0] = @"DepthEffect";
  v56[1] = @"depthEffect";
  v55[2] = @"depthInfo";
  v55[3] = @"aperture";
  v56[2] = @"depthInfo";
  v56[3] = @"aperture";
  v55[0] = @"identifierName";
  v55[1] = @"compositionName";
  v55[4] = @"focusRect";
  v55[5] = @"glassesMatteAllowed";
  v56[4] = @"focusRect";
  v56[5] = @"glassesMatteAllowed";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:6];
  v117[31] = @"portraitEffect";
  v54[0] = @"PortraitEffect";
  v54[1] = @"portraitEffect";
  v53[2] = @"portraitInfo";
  v53[3] = @"strength";
  v54[2] = @"portraitInfo";
  v54[3] = @"strength";
  v118[30] = v10;
  v53[4] = @"spillMatteAllowed";
  v53[5] = @"kind";
  v53[0] = @"identifierName";
  v53[1] = @"compositionName";
  v54[4] = @"spillMatteAllowed";
  v54[5] = @"portraitEffectFilterName";
  v53[6] = @"omitIfDisabled";
  v54[6] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:7];
  v118[31] = v1;
  v117[32] = @"videoStabilize";
  v51[0] = @"identifierName";
  v51[1] = @"compositionName";
  v52[0] = @"VideoStabilize";
  v52[1] = @"videoStabilize";
  v51[2] = @"enabled";
  v51[3] = @"customSerialization";
  v52[2] = @"enabled";
  v52[3] = &__block_literal_global_1265;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:4];
  v118[32] = v2;
  v117[33] = @"semanticEnhance";
  v49[0] = @"identifierName";
  v49[1] = @"compositionName";
  v50[0] = @"SemanticEnhance";
  v50[1] = @"semanticEnhance";
  v49[2] = @"enabled";
  v49[3] = @"intensity";
  v49[4] = @"sceneLabel";
  v49[5] = @"sceneConfidence";
  v50[4] = @"sceneLabel";
  v50[5] = @"sceneConfidence";
  v50[2] = @"enabled";
  v50[3] = @"intensity";
  v49[6] = @"boundingBoxes";
  v49[7] = @"faceBoundingBoxes";
  v50[6] = @"boundingBoxes";
  v50[7] = @"faceBoundingBoxes";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:8];
  v118[33] = v3;
  v117[34] = @"semanticStyle";
  v47[0] = @"identifierName";
  v47[1] = @"compositionName";
  v47[7] = @"version";
  v48[0] = @"SemanticStyle";
  v48[1] = @"semanticStyle";
  v47[2] = @"enabled";
  v47[3] = @"tone";
  v48[2] = @"enabled";
  v48[3] = @"tone";
  v47[4] = @"cast";
  v47[5] = @"color";
  v48[4] = @"cast";
  v48[5] = @"color";
  v47[6] = @"intensity";
  v48[6] = @"intensity";
  v48[7] = @"version";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:8];
  v118[34] = v4;
  v117[35] = @"videoCrossfadeLoop";
  v45[0] = @"identifierName";
  v45[1] = @"compositionName";
  v46[0] = @"VideoCrossfadeLoop";
  v46[1] = @"videoCrossfadeLoop";
  v45[2] = @"customSerialization";
  v46[2] = &__block_literal_global_1267;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  v118[35] = v5;
  v117[36] = @"portraitVideo";
  v43[0] = @"identifierName";
  v43[1] = @"compositionName";
  v44[0] = @"PortraitVideo";
  v44[1] = @"portraitVideo";
  v43[2] = @"enabled";
  v43[3] = @"customSerialization";
  v44[2] = @"enabled";
  v44[3] = &__block_literal_global_1269;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
  v118[36] = v6;
  v117[37] = @"cinematicAudio";
  v41[0] = @"identifierName";
  v41[1] = @"compositionName";
  v42[0] = @"CinematicAudio";
  v42[1] = @"cinematicAudio";
  v41[2] = @"enabled";
  v41[3] = @"dialogMixBias";
  v42[2] = @"enabled";
  v42[3] = @"dialogMixBias";
  v41[4] = @"renderingStyle";
  v42[4] = @"renderingStyle";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:5];
  v118[37] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:38];
  v9 = (void *)mapForSerialization__s_inverseMap;
  mapForSerialization__s_inverseMap = v8;
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"disparityKeyframes"];
  [v5 setObject:v6 forKeyedSubscript:@"disparityKeyframes"];

  v7 = [v4 objectForKeyedSubscript:@"apertureKeyframes"];
  [v5 setObject:v7 forKeyedSubscript:@"apertureKeyframes"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"cinematographyState"];
  [v5 setObject:v8 forKeyedSubscript:@"cinematographyState"];

  v9 = [v4 objectForKeyedSubscript:@"debugMode"];
  [v5 setObject:v9 forKeyedSubscript:@"debugMode"];

  id v10 = [v4 objectForKeyedSubscript:@"renderingVersionAtCapture"];

  [v5 setObject:v10 forKeyedSubscript:@"renderingVersionAtCapture"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  memset(&v28, 0, sizeof(v28));
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"crossfadeDurationValue"];
  int64_t v7 = [v6 integerValue];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"crossfadeDurationTimescale"];
  CMTimeMake(&v28, v7, [v8 intValue]);

  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  time.start = v28;
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time.start, v9);
  [v5 setObject:v10 forKeyedSubscript:@"crossfadeDuration"];

  memset(&v27, 0, sizeof(v27));
  v11 = [v4 objectForKeyedSubscript:@"startTimeValue"];
  int64_t v12 = [v11 integerValue];
  v13 = [v4 objectForKeyedSubscript:@"startTimeTimescale"];
  CMTimeMake(&v27, v12, [v13 intValue]);

  time.start = v27;
  CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time.start, v9);
  [v5 setObject:v14 forKeyedSubscript:@"startTime"];

  memset(&v26, 0, sizeof(v26));
  v15 = [v4 objectForKeyedSubscript:@"timeRangeStartValue"];
  int64_t v16 = [v15 longLongValue];
  v17 = [v4 objectForKeyedSubscript:@"timeRangeStartTimescale"];
  CMTimeMake(&v26, v16, [v17 intValue]);

  memset(&v25, 0, sizeof(v25));
  v18 = [v4 objectForKeyedSubscript:@"timeRangeDurationValue"];
  int64_t v19 = [v18 longLongValue];
  v20 = [v4 objectForKeyedSubscript:@"timeRangeDurationTimescale"];

  CMTimeMake(&v25, v19, [v20 intValue]);
  memset(&time, 0, sizeof(time));
  v22.start = v26;
  CMTime duration = v25;
  CMTimeRangeMake(&time, &v22.start, &duration);
  CMTimeRange v22 = time;
  CFDictionaryRef v21 = CMTimeRangeCopyAsDictionary(&v22, v9);
  [v5 setObject:v21 forKeyedSubscript:@"timeRange"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"keyframes"];
  [v5 setObject:v6 forKeyedSubscript:@"keyframes"];

  int64_t v7 = [v4 objectForKeyedSubscript:@"stabCropRect"];
  [v5 setObject:v7 forKeyedSubscript:@"stabCropRect"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"cropFraction"];
  [v5 setObject:v8 forKeyedSubscript:@"cropFraction"];

  id v9 = [v4 objectForKeyedSubscript:@"analysisType"];

  [v5 setObject:v9 forKeyedSubscript:@"analysisType"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"flags";
  v9[1] = @"epoch";
  v10[0] = &unk_1F0009BC0;
  v10[1] = &unk_1F0009B90;
  v9[2] = @"value";
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"time"];
  v10[2] = v6;
  v9[3] = @"timescale";
  int64_t v7 = [v4 objectForKeyedSubscript:@"scale"];

  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v5 setObject:v8 forKeyedSubscript:@"time"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"flags";
  v9[1] = @"epoch";
  v10[0] = &unk_1F0009BC0;
  v10[1] = &unk_1F0009B90;
  v9[2] = @"value";
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"time"];
  v10[2] = v6;
  v9[3] = @"timescale";
  int64_t v7 = [v4 objectForKeyedSubscript:@"scale"];

  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v5 setObject:v8 forKeyedSubscript:@"time"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"start"];
  int64_t v7 = [v6 integerValue];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"startScale"];
  CMTimeMake(&v20, v7, [v8 intValue]);

  memset(&v19, 0, sizeof(v19));
  id v9 = [v4 objectForKeyedSubscript:@"end"];
  int64_t v10 = [v9 integerValue];
  v11 = [v4 objectForKeyedSubscript:@"endScale"];
  CMTimeMake(&v19, v10, [v11 intValue]);

  memset(&v18, 0, sizeof(v18));
  v16.start = v20;
  CMTime end = v19;
  CMTimeRangeFromTimeToTime(&v18, &v16.start, &end);
  CMTimeRange v16 = v18;
  CFDictionaryRef v12 = CMTimeRangeCopyAsDictionary(&v16, 0);
  CFDictionaryRef v21 = @"timeRange";
  CFDictionaryRef v22 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v23[0] = v13;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v5 setObject:v14 forKeyedSubscript:@"regions"];

  v15 = [v4 objectForKeyedSubscript:@"rate"];

  [v5 setObject:v15 forKeyedSubscript:@"rate"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  memset(&v17, 0, sizeof(v17));
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:@"start"];
  int64_t v7 = [v6 integerValue];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"startScale"];
  CMTimeMake(&v17, v7, [v8 intValue]);

  memset(&v16, 0, sizeof(v16));
  id v9 = [v4 objectForKeyedSubscript:@"end"];
  int64_t v10 = [v9 integerValue];
  v11 = [v4 objectForKeyedSubscript:@"endScale"];

  CMTimeMake(&v16, v10, [v11 intValue]);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v15 = v17;
  CFDictionaryRef v13 = CMTimeCopyAsDictionary(&v15, v12);
  [v5 setObject:v13 forKeyedSubscript:@"startTime"];

  CMTime v15 = v16;
  CFDictionaryRef v14 = CMTimeCopyAsDictionary(&v15, v12);
  [v5 setObject:v14 forKeyedSubscript:@"endTime"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CMTime v19 = v4;
  v6 = [v4 objectForKeyedSubscript:@"inputCorrectionInfo"];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      int64_t v10 = [v6 objectAtIndexedSubscript:i];
      v25[0] = @"x";
      v11 = [v10 objectForKeyedSubscript:@"pointX"];
      v25[1] = @"y";
      v26[0] = v11;
      CFAllocatorRef v12 = [v10 objectForKeyedSubscript:@"pointY"];
      v26[1] = v12;
      CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

      v24[0] = v13;
      v23[0] = @"center";
      v23[1] = @"radius";
      CFDictionaryRef v14 = objc_msgSend(v10, "objectForKeyedSubscript:");
      v24[1] = v14;
      void v23[2] = @"sensitivity";
      CMTime v15 = objc_msgSend(v10, "objectForKeyedSubscript:");
      v24[2] = v15;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
      v17 = CMTime v16 = v6;

      [v5 addObject:v17];
      v6 = v16;
    }
  }
  CFDictionaryRef v21 = @"inputSpots";
  id v22 = v5;
  CMTimeRange v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [v20 setObject:v18 forKeyedSubscript:@"inputKeys"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v4 = a3;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v42 = v4;
  [v4 objectForKeyedSubscript:@"inputStrokes"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v56;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v56 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v5;
        v6 = *(void **)(*((void *)&v55 + 1) + 8 * v5);
        uint64_t v7 = objc_opt_new();
        uint64_t v8 = objc_opt_new();
        [v7 setObject:v8 forKeyedSubscript:@"brushStroke"];

        [v7 setObject:&unk_1F0009BA8 forKeyedSubscript:@"version"];
        id v9 = NSNumber;
        int64_t v10 = [v6 objectForKeyedSubscript:@"mode"];
        v11 = [v9 numberWithInt:PIRetouchModeFromString(v10)];
        [v7 setObject:v11 forKeyedSubscript:@"mode"];

        CFAllocatorRef v12 = [v6 objectForKeyedSubscript:@"radius"];
        CFDictionaryRef v13 = [v7 objectForKeyedSubscript:@"brushStroke"];
        [v13 setObject:v12 forKeyedSubscript:@"radius"];

        CFDictionaryRef v14 = [v6 objectForKeyedSubscript:@"softness"];
        CMTime v15 = [v7 objectForKeyedSubscript:@"brushStroke"];
        [v15 setObject:v14 forKeyedSubscript:@"softness"];

        CMTime v16 = [v6 objectForKeyedSubscript:@"opacity"];
        CMTime v17 = [v7 objectForKeyedSubscript:@"brushStroke"];
        [v17 setObject:v16 forKeyedSubscript:@"opacity"];

        CMTimeRange v18 = [v7 objectForKeyedSubscript:@"brushStroke"];
        [v18 setObject:&unk_1F0009BC0 forKeyedSubscript:@"version"];

        CMTime v19 = [v6 objectForKeyedSubscript:@"repairEdges"];
        [v7 setObject:v19 forKeyedSubscript:@"repairEdges"];

        id v20 = [v6 objectForKeyedSubscript:@"sourceOffset"];
        [v7 setObject:v20 forKeyedSubscript:@"sourceOffset"];

        CFDictionaryRef v21 = [v6 objectForKeyedSubscript:@"hasSource"];
        v49 = v7;
        [v7 setObject:v21 forKeyedSubscript:@"hasSource"];

        v48 = v6;
        id v22 = [v6 objectForKeyedSubscript:@"points"];
        v23 = objc_opt_new();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v52 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v61[0] = @"xLocation";
              v30 = [v29 objectForKeyedSubscript:@"x"];
              v62[0] = v30;
              v61[1] = @"yLocation";
              v31 = [v29 objectForKeyedSubscript:@"y"];
              v62[1] = v31;
              v61[2] = @"pressure";
              v32 = [v29 objectForKeyedSubscript:@"p"];
              v62[2] = v32;
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];

              [v23 addObject:v33];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v63 count:16];
          }
          while (v26);
        }

        v34 = [v49 objectForKeyedSubscript:@"brushStroke"];
        [v34 setObject:v23 forKeyedSubscript:@"data"];

        v35 = [v48 objectForKeyedSubscript:@"clipRect"];

        if (v35)
        {
          v36 = [v48 objectForKeyedSubscript:@"clipRect"];
          [v49 setObject:v36 forKeyedSubscript:@"clipRect"];
        }
        [v46 addObject:v49];

        uint64_t v5 = v50 + 1;
      }
      while (v50 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v47);
  }
  v37 = [v4 objectForKeyedSubscript:@"detectedFaces"];
  v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = [MEMORY[0x1E4F1C978] array];
  }
  v40 = v39;

  v59[0] = @"inputStrokes";
  v59[1] = @"inputDetectedFaces";
  v60[0] = v46;
  v60[1] = v40;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  [v43 setObject:v41 forKeyedSubscript:@"inputKeys"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = [a3 objectForKeyedSubscript:@"corrections"];
  if ([v4 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
    [v6 setObject:v5 forKeyedSubscript:@"corrections"];
  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"auto"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"colorType"];
    int v9 = [v8 isEqualToString:@"faceBalance"];

    if (v9)
    {
      v24[0] = @"auto";
      v22[0] = @"faceI";
      int64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:");
      v23[0] = v10;
      v22[1] = @"faceQ";
      v11 = objc_msgSend(v5, "objectForKeyedSubscript:");
      v23[1] = v11;
      v22[2] = @"faceStrength";
      CFAllocatorRef v12 = objc_msgSend(v5, "objectForKeyedSubscript:");
      void v23[2] = v12;
      v22[3] = @"faceWarmth";
      CFDictionaryRef v13 = objc_msgSend(v5, "objectForKeyedSubscript:");
      void v23[3] = v13;
      CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      v24[1] = @"current";
      v25[0] = v14;
      v25[1] = @"face";
      CMTime v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      [v4 setObject:v15 forKeyedSubscript:@"auto"];

LABEL_6:
      goto LABEL_7;
    }
    CMTime v16 = [v5 objectForKeyedSubscript:@"colorType"];
    int v17 = [v16 isEqualToString:@"warmTint"];

    if (v17)
    {
      v20[0] = @"auto";
      v18[0] = @"warmFace";
      int64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:");
      v19[0] = v10;
      v18[1] = @"warmTemp";
      v11 = objc_msgSend(v5, "objectForKeyedSubscript:");
      v19[1] = v11;
      v18[2] = @"warmTint";
      CFAllocatorRef v12 = [v5 objectForKeyedSubscript:@"warmTint"];
      v19[2] = v12;
      CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      v20[1] = @"current";
      v21[0] = v13;
      v21[1] = @"warm";
      CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      [v4 setObject:v14 forKeyedSubscript:@"auto"];
      goto LABEL_6;
    }
  }
LABEL_7:
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  id v7 = [a3 objectForKeyedSubscript:@"colorType"];
  id v6 = objc_msgSend(v4, "numberWithInteger:", +[PIWhiteBalanceAdjustmentController colorTypeForString:](PIWhiteBalanceAdjustmentController, "colorTypeForString:", v7));
  [v5 setObject:v6 forKeyedSubscript:@"colorType"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"auto"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"angle"];
    [v8 doubleValue];
    double v10 = v9 * 3.14159265;

    CMTime v28 = @"auto";
    v26[0] = @"straightenAngle";
    uint64_t v25 = [NSNumber numberWithDouble:v10 / -180.0];
    v27[0] = v25;
    v26[1] = @"xOrigin";
    v11 = NSNumber;
    id v24 = objc_msgSend(v5, "objectForKeyedSubscript:");
    [v24 doubleValue];
    v23 = objc_msgSend(v11, "numberWithDouble:");
    v27[1] = v23;
    v26[2] = @"yOrigin";
    CFAllocatorRef v12 = NSNumber;
    id v22 = objc_msgSend(v5, "objectForKeyedSubscript:");
    [v22 doubleValue];
    CFDictionaryRef v13 = objc_msgSend(v12, "numberWithDouble:");
    v27[2] = v13;
    void v26[3] = @"width";
    CFDictionaryRef v14 = NSNumber;
    CMTime v15 = objc_msgSend(v5, "objectForKeyedSubscript:");
    [v15 doubleValue];
    CMTime v16 = objc_msgSend(v14, "numberWithDouble:");
    v27[3] = v16;
    v26[4] = @"height";
    int v17 = NSNumber;
    CMTimeRange v18 = objc_msgSend(v5, "objectForKeyedSubscript:");
    [v18 doubleValue];
    CMTime v19 = objc_msgSend(v17, "numberWithDouble:");
    v27[4] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
    v29[0] = v20;
    CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    [v4 setObject:v21 forKeyedSubscript:@"auto"];
  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"angle"];
  [v5 doubleValue];
  double v7 = v6 * 3.14159265;

  id v8 = [NSNumber numberWithDouble:v7 / -180.0];
  [v4 setObject:v8 forKeyedSubscript:@"straightenAngle"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  double v6 = [v4 objectForKeyedSubscript:@"kind"];
  [v5 setObject:v6 forKeyedSubscript:@"effectName"];

  double v7 = [v4 objectForKeyedSubscript:@"version"];
  [v5 setObject:v7 forKeyedSubscript:@"effectVersion"];

  id v8 = [v4 objectForKeyedSubscript:@"intensity"];

  [v5 setObject:v8 forKeyedSubscript:@"effectIntensity"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  double v6 = [v4 objectForKeyedSubscript:@"kind"];
  [v5 setObject:v6 forKeyedSubscript:@"effectName"];

  double v7 = [v4 objectForKeyedSubscript:@"version"];
  [v5 setObject:v7 forKeyedSubscript:@"effectVersion"];

  id v8 = [v4 objectForKeyedSubscript:@"intensity"];

  [v5 setObject:v8 forKeyedSubscript:@"effectIntensity"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"strength"];
  [v5 doubleValue];
  double v7 = v6 + -0.5;

  id v8 = [NSNumber numberWithDouble:v7];
  [v4 setObject:v8 forKeyedSubscript:@"offsetStrength"];
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"auto"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v13[0] = @"auto";
    v11 = @"inputColor";
    id v8 = objc_msgSend(v5, "objectForKeyedSubscript:");
    CFAllocatorRef v12 = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v13[1] = @"current";
    v14[0] = v9;
    v14[1] = @"auto";
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v4 setObject:v10 forKeyedSubscript:@"auto"];
  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"offsetSaturation"];

  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"offsetSaturation"];
    [v11 setObject:v6 forKeyedSubscript:@"offsetSaturation"];
  }
  int v7 = [v4 objectForKeyedSubscript:@"offsetCast"];

  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:@"offsetCast"];
    [v11 setObject:v8 forKeyedSubscript:@"offsetCast"];
  }
  double v9 = [v4 objectForKeyedSubscript:@"offsetContrast"];

  if (v9)
  {
    double v10 = [v4 objectForKeyedSubscript:@"offsetContrast"];
    [v11 setObject:v10 forKeyedSubscript:@"offsetContrast"];
  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"auto"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v13[0] = @"auto";
    id v11 = @"inputLight";
    id v8 = objc_msgSend(v5, "objectForKeyedSubscript:");
    CFAllocatorRef v12 = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v13[1] = @"current";
    v14[0] = v9;
    v14[1] = @"auto";
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v4 setObject:v10 forKeyedSubscript:@"auto"];
  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"inputLight"];

  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"inputLight"];
    [v28 setObject:v6 forKeyedSubscript:@"inputLight"];
  }
  int v7 = [v4 objectForKeyedSubscript:@"offsetBlack"];

  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:@"offsetBlack"];
    [v28 setObject:v8 forKeyedSubscript:@"offsetBlackPoint"];
  }
  double v9 = [v4 objectForKeyedSubscript:@"offsetExposure"];

  if (v9)
  {
    double v10 = [v4 objectForKeyedSubscript:@"offsetExposure"];
    [v28 setObject:v10 forKeyedSubscript:@"offsetExposure"];
  }
  id v11 = [v4 objectForKeyedSubscript:@"offsetContrast"];

  if (v11)
  {
    CFAllocatorRef v12 = [v4 objectForKeyedSubscript:@"offsetContrast"];
    [v28 setObject:v12 forKeyedSubscript:@"offsetContrast"];
  }
  CFDictionaryRef v13 = [v4 objectForKeyedSubscript:@"offsetBrightness"];

  if (v13)
  {
    CFDictionaryRef v14 = [v4 objectForKeyedSubscript:@"offsetBrightness"];
    [v28 setObject:v14 forKeyedSubscript:@"offsetBrightness"];
  }
  CMTime v15 = [v4 objectForKeyedSubscript:@"offsetHighlights"];

  if (v15)
  {
    CMTime v16 = [v4 objectForKeyedSubscript:@"offsetHighlights"];
    [v28 setObject:v16 forKeyedSubscript:@"offsetHighlights"];
  }
  int v17 = [v4 objectForKeyedSubscript:@"offsetShadows"];

  if (v17)
  {
    CMTimeRange v18 = [v4 objectForKeyedSubscript:@"offsetShadows"];
    [v28 setObject:v18 forKeyedSubscript:@"offsetShadows"];
  }
  CMTime v19 = [v4 objectForKeyedSubscript:@"offsetLocalLight"];

  if (v19)
  {
    id v20 = [v4 objectForKeyedSubscript:@"offsetLocalLight"];
    [v28 setObject:v20 forKeyedSubscript:@"offsetLocalLight"];
  }
  CFDictionaryRef v21 = [v4 objectForKeyedSubscript:@"statistics"];
  id v22 = v21;
  if (v21)
  {
    v23 = (void *)[v21 mutableCopy];
    id v24 = [v22 objectForKeyedSubscript:@"lightMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = [v24 base64EncodedStringWithOptions:0];
      [v23 setObject:v25 forKeyedSubscript:@"lightMap"];
    }
    uint64_t v26 = [v22 objectForKeyedSubscript:@"lightMapAvg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [v26 base64EncodedStringWithOptions:0];
      [v23 setObject:v27 forKeyedSubscript:@"lightMapAvg"];
    }
  }
  else
  {
    v23 = 0;
  }
  [v28 setObject:v23 forKeyedSubscript:@"statistics"];
}

+ (id)conversionMap
{
  if (conversionMap_onceToken != -1) {
    dispatch_once(&conversionMap_onceToken, &__block_literal_global_13371);
  }
  v2 = (void *)conversionMap__s_conversionMap;
  return v2;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke()
{
  v115[37] = *MEMORY[0x1E4F143B8];
  v114[0] = @"SmartTone";
  v112[0] = @"identifierName";
  v112[1] = @"compositionName";
  v113[0] = @"SmartTone";
  v113[1] = @"smartTone";
  v112[2] = @"inputLight";
  v112[3] = @"offsetBlackPoint";
  v113[2] = @"inputLight";
  v113[3] = @"offsetBlack";
  v112[4] = @"offsetBrightness";
  v112[5] = @"offsetContrast";
  v113[4] = @"offsetBrightness";
  v113[5] = @"offsetContrast";
  v112[6] = @"offsetExposure";
  v112[7] = @"offsetHighlights";
  v113[6] = @"offsetExposure";
  void v113[7] = @"offsetHighlights";
  void v112[8] = @"offsetLocalLight";
  v112[9] = @"offsetShadows";
  v113[8] = @"offsetLocalLight";
  v113[9] = @"offsetShadows";
  v112[10] = @"statistics";
  v112[11] = @"inputRawHighlights";
  v113[10] = @"statistics";
  v113[11] = @"inputRawHighlights";
  v112[12] = @"inputImage";
  v112[13] = @"auto";
  v113[12] = @"inputImage";
  v113[13] = @"auto";
  v112[14] = @"custom";
  v113[14] = &__block_literal_global_151;
  id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:15];
  v115[0] = v39;
  v114[1] = @"SmartColor";
  v110[0] = @"identifierName";
  v110[1] = @"compositionName";
  v111[0] = @"SmartColor";
  v111[1] = @"smartColor";
  v110[2] = @"inputColor";
  v110[3] = @"offsetSaturation";
  v111[2] = @"inputColor";
  v111[3] = @"offsetSaturation";
  v110[4] = @"offsetContrast";
  void v110[5] = @"offsetCast";
  v111[4] = @"offsetContrast";
  v111[5] = @"offsetCast";
  v110[6] = @"statistics";
  v110[7] = @"auto";
  v111[6] = @"statistics";
  v111[7] = @"auto";
  v110[8] = @"custom";
  void v111[8] = &__block_literal_global_170;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:9];
  v115[1] = v38;
  v114[2] = @"SmartBlackAndWhite";
  v109[0] = @"SmartBlackAndWhite";
  v109[1] = @"smartBlackAndWhite";
  v108[2] = @"custom";
  v108[3] = @"offsetGrain";
  v108[0] = @"identifierName";
  v108[1] = @"compositionName";
  void v108[4] = @"offsetTone";
  v108[5] = @"inputBlackAndWhite";
  v109[4] = @"tone";
  void v109[5] = @"hue";
  v109[2] = &__block_literal_global_176;
  v109[3] = @"grain";
  v108[6] = @"offsetNeutralGamma";
  v108[7] = @"auto";
  v109[6] = @"neutral";
  v109[7] = @"auto";
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:8];
  v115[2] = v37;
  v114[3] = @"Grain";
  v106[0] = @"identifierName";
  v106[1] = @"compositionName";
  v107[0] = @"Grain";
  v107[1] = @"grain";
  v106[2] = @"iso";
  v106[3] = @"amount";
  v107[2] = @"iso";
  v107[3] = @"amount";
  void v106[4] = @"seed";
  void v107[4] = @"seed";
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:5];
  v115[3] = v36;
  v114[4] = @"DGVignetteEffectOperation";
  v104[0] = @"identifierName";
  v104[1] = @"compositionName";
  v105[0] = @"Vignette";
  v105[1] = @"vignette";
  v104[2] = @"inputIntensity";
  v104[3] = @"inputRadius";
  v105[2] = @"intensity";
  v105[3] = @"radius";
  void v104[4] = @"inputFalloff";
  v104[5] = @"auto";
  void v105[4] = @"falloff";
  v105[5] = @"auto";
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:6];
  v115[4] = v35;
  v114[5] = @"DGDefinition2Operation";
  v102[0] = @"identifierName";
  v102[1] = @"compositionName";
  v103[0] = @"Definition";
  v103[1] = @"definition";
  v102[2] = @"inputIntensity";
  v102[3] = @"auto";
  v103[2] = @"intensity";
  v103[3] = @"auto";
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:4];
  v115[5] = v34;
  v114[6] = @"RKNoiseReductionOperation";
  v100[0] = @"identifierName";
  v100[1] = @"compositionName";
  v101[0] = @"NoiseReduction";
  v101[1] = @"noiseReduction";
  void v100[2] = @"inputEdgeDetail";
  v100[3] = @"inputRadius";
  v101[2] = @"edgeDetail";
  v101[3] = @"radius";
  v100[4] = @"auto";
  void v101[4] = @"auto";
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:5];
  v115[6] = v33;
  void v114[7] = @"RKProSharpenOperation";
  v98[0] = @"identifierName";
  v98[1] = @"compositionName";
  v99[0] = @"Sharpen";
  v99[1] = @"sharpen";
  void v98[2] = @"inputFalloff";
  v98[3] = @"inputEdgeScale";
  void v99[2] = @"falloff";
  v99[3] = @"edges";
  v98[4] = @"inputSharpness";
  v98[5] = @"auto";
  v99[4] = @"intensity";
  v99[5] = @"auto";
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:6];
  v114[8] = @"Effect";
  v96[0] = @"customIdentifierName";
  v96[1] = @"customCompositionName";
  v97[0] = &__block_literal_global_291;
  v97[1] = &__block_literal_global_298;
  v115[7] = v32;
  void v96[2] = @"effectVersion";
  v96[3] = @"effectIntensity";
  void v97[2] = @"version";
  v97[3] = @"intensity";
  v96[4] = @"custom";
  v97[4] = &__block_literal_global_315_13377;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:5];
  void v115[8] = v31;
  v114[9] = @"Orientation";
  v94[0] = @"identifierName";
  v94[1] = @"compositionName";
  v95[0] = @"Orientation";
  v95[1] = @"orientation";
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  v115[9] = v30;
  v114[10] = @"Crop";
  v93[0] = @"CropStraighten";
  v93[1] = @"cropStraighten";
  v92[2] = @"xOrigin";
  v92[3] = @"yOrigin";
  v93[2] = @"xOrigin";
  v93[3] = @"yOrigin";
  v92[4] = @"width";
  v92[5] = @"height";
  v93[4] = @"width";
  v93[5] = @"height";
  v92[0] = @"identifierName";
  v92[1] = @"compositionName";
  void v92[6] = @"straightenAngle";
  v92[7] = @"pitch";
  v93[6] = @"angle";
  v93[7] = @"pitch";
  v92[8] = @"yaw";
  v92[9] = @"auto";
  v93[8] = @"yaw";
  v93[9] = @"auto";
  v92[10] = @"constraintHeight";
  v92[11] = @"constraintWidth";
  v93[10] = @"constraintHeight";
  v93[11] = @"constraintWidth";
  v92[12] = @"custom";
  v93[12] = &__block_literal_global_362;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:13];
  v115[10] = v29;
  v114[11] = @"DGRAWReduceNoiseOperation";
  v90[0] = @"identifierName";
  v90[1] = @"compositionName";
  v91[0] = @"RawNoiseReduction";
  v91[1] = @"rawNoiseReduction";
  v90[2] = @"inputDetailAmount";
  v90[3] = @"inputCNRAmount";
  v91[2] = @"detail";
  v91[3] = @"color";
  v90[4] = @"inputLNRAmount";
  v91[4] = @"luminance";
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:5];
  v115[11] = v28;
  v114[12] = @"RKRawDecodeOperation";
  v89[0] = @"RAW";
  v89[1] = @"raw";
  v88[0] = @"identifierName";
  v88[1] = @"compositionName";
  v88[2] = @"inputMethodVersion";
  v88[3] = @"boostVersion";
  v89[2] = @"inputDecoderVersion";
  v89[3] = @"boostVersion";
  v88[4] = @"boostParams";
  v88[5] = @"gainMapVersion";
  v89[4] = @"boostParams";
  v89[5] = @"gainMapVersion";
  v88[6] = @"gainMapParameters";
  v89[6] = @"gainMapParameters";
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:7];
  v115[12] = v27;
  v114[13] = @"WhiteBalance";
  v86[0] = @"identifierName";
  v86[1] = @"compositionName";
  v87[0] = @"WhiteBalance";
  v87[1] = @"whiteBalance";
  v86[2] = @"faceStrength";
  v86[3] = @"faceWarmth";
  v87[2] = @"faceStrength";
  v87[3] = @"faceWarmth";
  v86[4] = @"faceI";
  void v86[5] = @"faceQ";
  v87[4] = @"faceI";
  v87[5] = @"faceQ";
  v86[6] = @"grayWarmth";
  v86[7] = @"grayY";
  v87[6] = @"grayWarmth";
  v87[7] = @"grayY";
  v86[8] = @"grayI";
  v86[9] = @"grayQ";
  v87[8] = @"grayI";
  v87[9] = @"grayQ";
  v86[10] = @"auto";
  v86[11] = @"custom";
  v87[10] = @"auto";
  v87[11] = &__block_literal_global_445;
  v86[12] = @"temperature";
  v86[13] = @"tint";
  v87[12] = @"temperature";
  v87[13] = @"tint";
  v86[14] = @"warmTemp";
  v86[15] = @"warmTint";
  v87[14] = @"warmTemp";
  v87[15] = @"warmTint";
  v86[16] = @"warmFace";
  v87[16] = @"warmFace";
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:17];
  v115[13] = v26;
  v114[14] = @"RKLevelsOperation";
  v84[0] = @"identifierName";
  v84[1] = @"compositionName";
  v85[0] = @"Levels";
  v85[1] = @"levels";
  v84[2] = @"colorSpace";
  v84[3] = @"inputBlackSrcRGB";
  v85[2] = @"inputColorSpace";
  v85[3] = @"blackSrcRGB";
  void v84[4] = @"inputBlackDstRGB";
  v84[5] = @"inputShadowSrcRGB";
  v85[4] = @"blackDstRGB";
  void v85[5] = @"shadowSrcRGB";
  v84[6] = @"inputShadowDstRGB";
  v84[7] = @"inputMidSrcRGB";
  v85[6] = @"shadowDstRGB";
  v85[7] = @"midSrcRGB";
  v84[8] = @"inputMidDstRGB";
  v84[9] = @"inputHilightSrcRGB";
  v85[8] = @"midDstRGB";
  v85[9] = @"hilightSrcRGB";
  v84[10] = @"inputHilightDstRGB";
  v84[11] = @"inputWhiteSrcRGB";
  v85[10] = @"hilightDstRGB";
  v85[11] = @"whiteSrcRGB";
  v84[12] = @"inputWhiteDstRGB";
  v84[13] = @"inputBlackSrcRed";
  v85[12] = @"whiteDstRGB";
  v85[13] = @"blackSrcRed";
  v84[14] = @"inputBlackDstRed";
  v84[15] = @"inputShadowSrcRed";
  v85[14] = @"blackDstRed";
  v85[15] = @"shadowSrcRed";
  v84[16] = @"inputShadowDstRed";
  v84[17] = @"inputMidSrcRed";
  v85[16] = @"shadowDstRed";
  v85[17] = @"midSrcRed";
  v84[18] = @"inputMidDstRed";
  v84[19] = @"inputHilightSrcRed";
  v85[18] = @"midDstRed";
  v85[19] = @"hilightSrcRed";
  v84[20] = @"inputHilightDstRed";
  v84[21] = @"inputWhiteSrcRed";
  v85[20] = @"hilightDstRed";
  v85[21] = @"whiteSrcRed";
  v84[22] = @"inputWhiteDstRed";
  v84[23] = @"inputBlackSrcGreen";
  v85[22] = @"whiteDstRed";
  v85[23] = @"blackSrcGreen";
  v84[24] = @"inputBlackDstGreen";
  v84[25] = @"inputShadowSrcGreen";
  v85[24] = @"blackDstGreen";
  v85[25] = @"shadowSrcGreen";
  v84[26] = @"inputShadowDstGreen";
  v84[27] = @"inputMidSrcGreen";
  v85[26] = @"shadowDstGreen";
  v85[27] = @"midSrcGreen";
  v84[28] = @"inputMidDstGreen";
  v84[29] = @"inputHilightSrcGreen";
  v85[28] = @"midDstGreen";
  v85[29] = @"hilightSrcGreen";
  v84[30] = @"inputHilightDstGreen";
  v84[31] = @"inputWhiteSrcGreen";
  v85[30] = @"hilightDstGreen";
  v85[31] = @"whiteSrcGreen";
  v84[32] = @"inputWhiteDstGreen";
  v84[33] = @"inputBlackSrcBlue";
  v85[32] = @"whiteDstGreen";
  v85[33] = @"blackSrcBlue";
  v84[34] = @"inputBlackDstBlue";
  v84[35] = @"inputShadowSrcBlue";
  v85[34] = @"blackDstBlue";
  v85[35] = @"shadowSrcBlue";
  v84[36] = @"inputShadowDstBlue";
  v84[37] = @"inputMidSrcBlue";
  v85[36] = @"shadowDstBlue";
  v85[37] = @"midSrcBlue";
  v84[38] = @"inputMidDstBlue";
  v84[39] = @"inputHilightSrcBlue";
  v85[38] = @"midDstBlue";
  v85[39] = @"hilightSrcBlue";
  v84[40] = @"inputHilightDstBlue";
  v84[41] = @"inputWhiteSrcBlue";
  v85[40] = @"hilightDstBlue";
  v85[41] = @"whiteSrcBlue";
  v84[42] = @"inputWhiteDstBlue";
  v84[43] = @"auto";
  v85[42] = @"whiteDstBlue";
  v85[43] = @"auto";
  v84[44] = @"custom";
  v85[44] = &__block_literal_global_737;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:45];
  v115[14] = v25;
  v114[15] = @"RKCurvesOperation";
  v83[0] = @"Curves";
  v83[1] = @"curves";
  v82[2] = @"RGBCurvePoints";
  void v82[3] = @"redCurvePoints";
  v83[2] = @"pointsL";
  v83[3] = @"pointsR";
  v82[4] = @"greenCurvePoints";
  v82[5] = @"blueCurvePoints";
  v82[0] = @"identifierName";
  v82[1] = @"compositionName";
  void v83[4] = @"pointsG";
  v83[5] = @"pointsB";
  v82[6] = @"auto";
  v83[6] = @"auto";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:7];
  v115[15] = v24;
  v114[16] = @"RKSelectiveColorOperation";
  v80[0] = @"identifierName";
  v80[1] = @"compositionName";
  v81[0] = @"SelectiveColor";
  v81[1] = @"selectiveColor";
  v80[2] = @"custom";
  v81[2] = &__block_literal_global_793;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
  v115[16] = v23;
  v114[17] = @"RKRetouchOperation";
  v78[0] = @"identifierName";
  v78[1] = @"compositionName";
  v79[0] = @"Retouch";
  v79[1] = @"retouch";
  v78[2] = @"supported";
  v78[3] = @"custom";
  v79[2] = &__block_literal_global_809;
  void v79[3] = &__block_literal_global_811;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:4];
  v115[17] = v22;
  v114[18] = @"Inpaint";
  v76[0] = @"identifierName";
  v76[1] = @"compositionName";
  v77[0] = @"Inpaint";
  v77[1] = @"inpaint";
  void v76[2] = @"supported";
  v76[3] = @"enabled";
  v77[2] = &__block_literal_global_878;
  v77[3] = @"enabled";
  v76[4] = @"operations";
  v76[5] = @"detectedFaces";
  v77[4] = @"operations";
  v77[5] = @"detectedFaces";
  v76[6] = @"version";
  v76[7] = @"cleanupVersion";
  v77[6] = @"version";
  v77[7] = @"cleanupVersion";
  v76[8] = @"modelVersionInfo";
  void v77[8] = @"modelVersionInfo";
  CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:9];
  v115[18] = v21;
  v114[19] = @"InpaintMasks";
  v74[0] = @"identifierName";
  v74[1] = @"compositionName";
  v75[0] = @"InpaintMasks";
  v75[1] = @"inpaintMasks";
  v74[2] = @"supported";
  void v75[2] = &__block_literal_global_900;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
  v115[19] = v20;
  v114[20] = @"RKRedEyeOperation";
  v72[0] = @"identifierName";
  v72[1] = @"compositionName";
  v73[0] = @"ApertureRedEye";
  v73[1] = @"apertureRedEye";
  v72[2] = @"custom";
  v73[2] = &__block_literal_global_912;
  CMTime v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];
  v115[20] = v19;
  v114[21] = @"RedEyeBB";
  v70[0] = @"identifierName";
  v70[1] = @"compositionName";
  v71[0] = @"RedEye";
  v71[1] = @"redEye";
  void v70[2] = @"allCorrections";
  v70[3] = @"auto";
  v71[2] = @"inputCorrectionInfo";
  v71[3] = @"auto";
  v70[4] = @"custom";
  void v71[4] = &__block_literal_global_942;
  CMTimeRange v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:5];
  v115[21] = v18;
  v114[22] = @"Mute";
  v68[0] = @"identifierName";
  v68[1] = @"compositionName";
  v69[0] = @"Mute";
  v69[1] = @"mute";
  int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v115[22] = v17;
  v114[23] = @"Trim";
  v66[0] = @"identifierName";
  v66[1] = @"compositionName";
  v67[0] = @"Trim";
  v67[1] = @"trim";
  v66[2] = @"custom";
  v67[2] = &__block_literal_global_957;
  CMTime v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  v115[23] = v16;
  v114[24] = @"SlowMotion";
  v64[0] = @"identifierName";
  v64[1] = @"compositionName";
  v65[0] = @"SlowMotion";
  v65[1] = @"slomo";
  v64[2] = @"custom";
  v65[2] = &__block_literal_global_981;
  CMTime v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v115[24] = v15;
  v114[25] = @"LivePhotoKeyFrame";
  v62[0] = @"identifierName";
  v62[1] = @"compositionName";
  v63[0] = @"LivePhotoKeyFrame";
  v63[1] = @"livePhotoKeyFrame";
  v62[2] = @"custom";
  v63[2] = &__block_literal_global_996;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v115[25] = v14;
  v114[26] = @"VideoPosterFrame";
  v60[0] = @"identifierName";
  v60[1] = @"compositionName";
  v61[0] = @"VideoPosterFrame";
  v61[1] = @"videoPosterFrame";
  void v60[2] = @"custom";
  v61[2] = &__block_literal_global_1014;
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  v115[26] = v13;
  v114[27] = @"AutoLoop";
  v59[0] = @"AutoLoop";
  v59[1] = @"autoLoop";
  v58[0] = @"identifierName";
  v58[1] = @"compositionName";
  v58[2] = @"recipe";
  v58[3] = @"flavor";
  void v59[2] = @"recipe";
  v59[3] = @"flavor";
  CFAllocatorRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:4];
  v115[27] = v12;
  v114[28] = @"HighResolutionFusion";
  v56[0] = @"identifierName";
  v56[1] = @"compositionName";
  v57[0] = @"HighResolutionFusion";
  v57[1] = @"highResFusion";
  v56[2] = @"alignment";
  v56[3] = @"omitIfDisabled";
  uint64_t v0 = MEMORY[0x1E4F1CC38];
  v57[2] = @"alignment";
  v57[3] = MEMORY[0x1E4F1CC38];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
  v115[28] = v11;
  v114[29] = @"DepthEffect";
  v55[0] = @"DepthEffect";
  v55[1] = @"depthEffect";
  v54[2] = @"depthInfo";
  v54[3] = @"aperture";
  v55[2] = @"depthInfo";
  v55[3] = @"aperture";
  v54[0] = @"identifierName";
  v54[1] = @"compositionName";
  v54[4] = @"focusRect";
  v54[5] = @"glassesMatteAllowed";
  v55[4] = @"focusRect";
  v55[5] = @"glassesMatteAllowed";
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:6];
  v115[29] = v10;
  v114[30] = @"PortraitEffect";
  v52[0] = @"identifierName";
  v52[1] = @"compositionName";
  v53[0] = @"PortraitEffect";
  v53[1] = @"portraitEffect";
  v52[2] = @"portraitInfo";
  v52[3] = @"strength";
  v53[2] = @"portraitInfo";
  v53[3] = @"strength";
  void v52[4] = @"spillMatteAllowed";
  v52[5] = @"portraitEffectFilterName";
  v53[4] = @"spillMatteAllowed";
  v53[5] = @"kind";
  v52[6] = @"omitIfDisabled";
  v52[7] = @"custom";
  v53[6] = v0;
  void v53[7] = &__block_literal_global_1062;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:8];
  v115[30] = v9;
  v114[31] = @"VideoStabilize";
  v50[0] = @"identifierName";
  v50[1] = @"compositionName";
  v51[0] = @"VideoStabilize";
  v51[1] = @"videoStabilize";
  v50[2] = @"enabled";
  v50[3] = @"custom";
  v51[2] = @"enabled";
  v51[3] = &__block_literal_global_1071;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
  v115[31] = v1;
  v114[32] = @"VideoCrossfadeLoop";
  v48[0] = @"identifierName";
  v48[1] = @"compositionName";
  v49[0] = @"VideoCrossfadeLoop";
  v49[1] = @"videoCrossfadeLoop";
  v48[2] = @"enabled";
  v48[3] = @"custom";
  v49[2] = @"enabled";
  v49[3] = &__block_literal_global_1089;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];
  v115[32] = v2;
  v114[33] = @"SemanticEnhance";
  v46[0] = @"identifierName";
  v46[1] = @"compositionName";
  v47[0] = @"SemanticEnhance";
  v47[1] = @"semanticEnhance";
  v46[2] = @"enabled";
  void v46[3] = @"intensity";
  v46[4] = @"sceneLabel";
  v46[5] = @"sceneConfidence";
  v47[4] = @"sceneLabel";
  v47[5] = @"sceneConfidence";
  v47[2] = @"enabled";
  v47[3] = @"intensity";
  v46[6] = @"boundingBoxes";
  v46[7] = @"faceBoundingBoxes";
  v47[6] = @"boundingBoxes";
  v47[7] = @"faceBoundingBoxes";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:8];
  v115[33] = v3;
  v114[34] = @"SemanticStyle";
  v44[0] = @"identifierName";
  v44[1] = @"compositionName";
  v45[0] = @"SemanticStyle";
  v45[1] = @"semanticStyle";
  v44[2] = @"enabled";
  v44[3] = @"tone";
  v45[2] = @"enabled";
  void v45[3] = @"tone";
  void v44[4] = @"cast";
  v44[5] = @"color";
  v45[4] = @"cast";
  v45[5] = @"color";
  v44[6] = @"intensity";
  v44[7] = @"version";
  v45[6] = @"intensity";
  v45[7] = @"version";
  v44[8] = @"custom";
  v44[9] = @"supported";
  v45[8] = &__block_literal_global_1143;
  v45[9] = &__block_literal_global_1148;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:10];
  v115[34] = v4;
  v114[35] = @"PortraitVideo";
  v42[0] = @"identifierName";
  v42[1] = @"compositionName";
  v43[0] = @"PortraitVideo";
  v43[1] = @"portraitVideo";
  v42[2] = @"enabled";
  v42[3] = @"custom";
  v43[2] = @"enabled";
  v43[3] = &__block_literal_global_1154;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
  v115[35] = v5;
  v114[36] = @"CinematicAudio";
  v40[0] = @"identifierName";
  v40[1] = @"compositionName";
  v41[0] = @"CinematicAudio";
  v41[1] = @"cinematicAudio";
  v40[2] = @"enabled";
  v40[3] = @"dialogMixBias";
  v41[2] = @"enabled";
  v41[3] = @"dialogMixBias";
  v40[4] = @"renderingStyle";
  v40[5] = @"supported";
  v41[4] = @"renderingStyle";
  void v41[5] = &__block_literal_global_1181;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];
  v115[36] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:37];
  id v8 = (void *)conversionMap__s_conversionMap;
  conversionMap__s_conversionMap = v7;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2_1152(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  double v6 = [v5 objectForKeyedSubscript:@"settings"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"disparityKeyframes"];
  [v4 setObject:v7 forKeyedSubscript:@"disparityKeyframes"];

  id v8 = [v5 objectForKeyedSubscript:@"settings"];
  double v9 = [v8 objectForKeyedSubscript:@"apertureKeyframes"];
  [v4 setObject:v9 forKeyedSubscript:@"apertureKeyframes"];

  double v10 = [v5 objectForKeyedSubscript:@"settings"];
  id v11 = [v10 objectForKeyedSubscript:@"cinematographyState"];
  [v4 setObject:v11 forKeyedSubscript:@"cinematographyState"];

  CFAllocatorRef v12 = [v5 objectForKeyedSubscript:@"settings"];
  CFDictionaryRef v13 = [v12 objectForKeyedSubscript:@"debugMode"];
  [v4 setObject:v13 forKeyedSubscript:@"debugMode"];

  id v15 = [v5 objectForKeyedSubscript:@"settings"];

  CFDictionaryRef v14 = [v15 objectForKeyedSubscript:@"renderingVersionAtCapture"];
  [v4 setObject:v14 forKeyedSubscript:@"renderingVersionAtCapture"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_12_1141(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v4 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v4 objectForKeyedSubscript:@"version"];

  if (!v5) {
    [v6 setObject:&unk_1F0009BC0 forKeyedSubscript:@"version"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_11_1087(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"settings"];
  memset(&v19, 0, sizeof(v19));
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"crossfadeDuration"];
  CMTimeMakeFromDictionary(&v19, v6);

  uint64_t v7 = [NSNumber numberWithLongLong:v19.value];
  [v4 setObject:v7 forKeyedSubscript:@"crossfadeDurationValue"];

  id v8 = [NSNumber numberWithInt:v19.timescale];
  [v4 setObject:v8 forKeyedSubscript:@"crossfadeDurationTimescale"];

  memset(&v18, 0, sizeof(v18));
  CFDictionaryRef v9 = [v5 objectForKeyedSubscript:@"startTime"];
  CMTimeMakeFromDictionary(&v18, v9);

  double v10 = [NSNumber numberWithLongLong:v18.value];
  [v4 setObject:v10 forKeyedSubscript:@"startTimeValue"];

  id v11 = [NSNumber numberWithInt:v18.timescale];
  [v4 setObject:v11 forKeyedSubscript:@"startTimeTimescale"];

  memset(&v17, 0, sizeof(v17));
  CFDictionaryRef v12 = [v5 objectForKeyedSubscript:@"loopTimeRange"];
  CMTimeRangeMakeFromDictionary(&v17, v12);

  CFDictionaryRef v13 = [NSNumber numberWithLongLong:v17.start.value];
  [v4 setObject:v13 forKeyedSubscript:@"timeRangeStartValue"];

  CFDictionaryRef v14 = [NSNumber numberWithInt:v17.start.timescale];
  [v4 setObject:v14 forKeyedSubscript:@"timeRangeStartTimescale"];

  id v15 = [NSNumber numberWithLongLong:v17.duration.value];
  [v4 setObject:v15 forKeyedSubscript:@"timeRangeDurationValue"];

  CMTime v16 = [NSNumber numberWithInt:v17.duration.timescale];
  [v4 setObject:v16 forKeyedSubscript:@"timeRangeDurationTimescale"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_10_1069(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"settings"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"keyframes"];
  [v4 setObject:v7 forKeyedSubscript:@"keyframes"];

  id v8 = [v5 objectForKeyedSubscript:@"settings"];
  CFDictionaryRef v9 = [v8 objectForKeyedSubscript:@"stabCropRect"];
  [v4 setObject:v9 forKeyedSubscript:@"stabCropRect"];

  double v10 = [v5 objectForKeyedSubscript:@"settings"];
  id v11 = [v10 objectForKeyedSubscript:@"cropFraction"];
  [v4 setObject:v11 forKeyedSubscript:@"cropFraction"];

  id v13 = [v5 objectForKeyedSubscript:@"settings"];

  CFDictionaryRef v12 = [v13 objectForKeyedSubscript:@"analysisType"];
  [v4 setObject:v12 forKeyedSubscript:@"analysisType"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_9_1060(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v3 = [v5 objectForKeyedSubscript:@"kind"];
  id v4 = v3;
  if (!v3 || ![v3 length]) {
    [v5 setObject:@"Light" forKeyedSubscript:@"kind"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_8_1012(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v9 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v9 objectForKeyedSubscript:@"time"];
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"value"];
  [v4 setObject:v6 forKeyedSubscript:@"time"];

  uint64_t v7 = [v9 objectForKeyedSubscript:@"time"];
  id v8 = [v7 objectForKeyedSubscript:@"timescale"];
  [v4 setObject:v8 forKeyedSubscript:@"scale"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_7_994(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v9 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v9 objectForKeyedSubscript:@"time"];
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"value"];
  [v4 setObject:v6 forKeyedSubscript:@"time"];

  uint64_t v7 = [v9 objectForKeyedSubscript:@"time"];
  id v8 = [v7 objectForKeyedSubscript:@"timescale"];
  [v4 setObject:v8 forKeyedSubscript:@"scale"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_6_979(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"settings"];
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"regions"];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  CFDictionaryRef v8 = [v7 objectForKeyedSubscript:@"timeRange"];

  memset(&v18, 0, sizeof(v18));
  CMTimeRangeMakeFromDictionary(&v18, v8);
  CMTimeValue value = v18.start.value;
  uint64_t timescale = v18.start.timescale;
  memset(&v17, 0, sizeof(v17));
  CMTimeRange v16 = v18;
  CMTimeRangeGetEnd(&v17, &v16);
  id v11 = [v5 objectForKeyedSubscript:@"rate"];
  [v4 setObject:v11 forKeyedSubscript:@"rate"];

  CFDictionaryRef v12 = [NSNumber numberWithLongLong:value];
  [v4 setObject:v12 forKeyedSubscript:@"start"];

  id v13 = [NSNumber numberWithInt:timescale];
  [v4 setObject:v13 forKeyedSubscript:@"startScale"];

  CFDictionaryRef v14 = [NSNumber numberWithLongLong:v17.value];
  [v4 setObject:v14 forKeyedSubscript:@"end"];

  id v15 = [NSNumber numberWithInt:v17.timescale];
  [v4 setObject:v15 forKeyedSubscript:@"endScale"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_5_955(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"settings"];
  memset(&v13, 0, sizeof(v13));
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"startTime"];
  CMTimeMakeFromDictionary(&v13, v6);

  memset(&v12, 0, sizeof(v12));
  CFDictionaryRef v7 = [v5 objectForKeyedSubscript:@"endTime"];
  CMTimeMakeFromDictionary(&v12, v7);

  CFDictionaryRef v8 = [NSNumber numberWithLongLong:v13.value];
  [v4 setObject:v8 forKeyedSubscript:@"start"];

  id v9 = [NSNumber numberWithLongLong:v12.value];
  [v4 setObject:v9 forKeyedSubscript:@"end"];

  double v10 = [NSNumber numberWithInt:v13.timescale];
  [v4 setObject:v10 forKeyedSubscript:@"startScale"];

  id v11 = [NSNumber numberWithInt:v12.timescale];
  [v4 setObject:v11 forKeyedSubscript:@"endScale"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_4_940(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"settings"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [&unk_1F000AA90 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(&unk_1F000AA90);
        }
        id v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
        CMTime v12 = v11;
        if (v11 && [v11 count]) {
          [v6 addObjectsFromArray:v12];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [&unk_1F000AA90 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  if ([v6 count])
  {
    CMTime v13 = (void *)[v6 copy];
    [v4 setObject:v13 forKeyedSubscript:@"inputCorrectionInfo"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_3_910(uint64_t a1, void *a2, void *a3)
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = v4;
  id v6 = [v4 objectForKeyedSubscript:@"inputKeys"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"inputSpots"];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v21 = v8;
    id v22 = v7;
    do
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
      v23[0] = @"pointX";
      id v11 = [v10 objectForKeyedSubscript:@"center"];
      CMTime v12 = [v11 objectForKeyedSubscript:@"x"];
      v24[0] = v12;
      v23[1] = @"pointY";
      [v10 objectForKeyedSubscript:@"center"];
      long long v14 = v13 = v5;
      long long v15 = [v14 objectForKeyedSubscript:@"y"];
      v24[1] = v15;
      void v23[2] = @"radius";
      long long v16 = objc_msgSend(v10, "objectForKeyedSubscript:");
      void v24[2] = v16;
      void v23[3] = @"sensitivity";
      long long v17 = objc_msgSend(v10, "objectForKeyedSubscript:");
      void v24[3] = v17;
      CMTimeRange v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

      id v5 = v13;
      [v13 addObject:v18];

      uint64_t v7 = v22;
      ++v9;
    }
    while (v21 != v9);
  }
  [v20 setObject:v5 forKeyedSubscript:@"inputCorrectionInfo"];
}

BOOL __49__PICompositionSerializerConstants_conversionMap__block_invoke_2_898()
{
  return +[PIObjectRemoval deviceSupportsObjectRemoval];
}

BOOL __49__PICompositionSerializerConstants_conversionMap__block_invoke_876()
{
  return +[PIObjectRemoval deviceSupportsObjectRemoval];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v4 = [a2 objectForKeyedSubscript:@"settings"];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v42 = v4;
  id v5 = [v4 objectForKeyedSubscript:@"inputKeys"];
  id v6 = [v5 objectForKeyedSubscript:@"inputStrokes"];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v6;
  uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"hasSource"];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = [v8 objectForKeyedSubscript:@"hasSource"];
          int v12 = [v11 BOOLValue];

          if (!v12) {
            continue;
          }
        }
        uint64_t v50 = i;
        CMTime v13 = objc_opt_new();
        [v13 setObject:&unk_1F0009BA8 forKeyedSubscript:@"version"];
        long long v14 = [v8 objectForKeyedSubscript:@"mode"];
        long long v15 = PIRetouchModeToString([v14 integerValue]);
        [v13 setObject:v15 forKeyedSubscript:@"mode"];

        long long v16 = [v8 objectForKeyedSubscript:@"brushStroke"];
        long long v17 = [v16 objectForKeyedSubscript:@"radius"];
        [v13 setObject:v17 forKeyedSubscript:@"radius"];

        CMTimeRange v18 = [v8 objectForKeyedSubscript:@"brushStroke"];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"softness"];
        [v13 setObject:v19 forKeyedSubscript:@"softness"];

        id v20 = [v8 objectForKeyedSubscript:@"brushStroke"];
        uint64_t v21 = [v20 objectForKeyedSubscript:@"opacity"];
        [v13 setObject:v21 forKeyedSubscript:@"opacity"];

        id v22 = [v8 objectForKeyedSubscript:@"repairEdges"];
        [v13 setObject:v22 forKeyedSubscript:@"repairEdges"];

        v23 = [v8 objectForKeyedSubscript:@"sourceOffset"];
        [v13 setObject:v23 forKeyedSubscript:@"sourceOffset"];

        id v24 = [v8 objectForKeyedSubscript:@"hasSource"];
        v48 = v13;
        [v13 setObject:v24 forKeyedSubscript:@"hasSource"];

        v49 = v8;
        uint64_t v25 = [v8 objectForKeyedSubscript:@"brushStroke"];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"data"];

        uint64_t v27 = objc_opt_new();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v28 = v26;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              v59[0] = @"x";
              v34 = [v33 objectForKeyedSubscript:@"xLocation"];
              v60[0] = v34;
              v59[1] = @"y";
              v35 = [v33 objectForKeyedSubscript:@"yLocation"];
              v60[1] = v35;
              void v59[2] = @"p";
              v36 = [v33 objectForKeyedSubscript:@"pressure"];
              void v60[2] = v36;
              v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];

              [v27 addObject:v37];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v30);
        }

        [v48 setObject:v27 forKeyedSubscript:@"points"];
        v38 = [v49 objectForKeyedSubscript:@"clipRect"];

        if (v38)
        {
          id v39 = [v49 objectForKeyedSubscript:@"clipRect"];
          [v48 setObject:v39 forKeyedSubscript:@"clipRect"];
        }
        [v45 addObject:v48];

        uint64_t i = v50;
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v47);
  }

  [v43 setObject:v45 forKeyedSubscript:@"inputStrokes"];
  v40 = [v42 objectForKeyedSubscript:@"inputKeys"];
  v41 = [v40 objectForKeyedSubscript:@"detectedFaces"];

  if (v41) {
    [v43 setObject:v41 forKeyedSubscript:@"detectedFaces"];
  }
}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_12()
{
  return 0;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v4 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v4 objectForKeyedSubscript:@"corrections"];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
    [v7 setObject:v6 forKeyedSubscript:@"corrections"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v4 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v4 objectForKeyedSubscript:@"inputKeys"];
  if (v5)
  {
    id v6 = [v8 objectForKeyedSubscript:@"colorSpace"];
    if ([v6 isEqualToString:@"Generic P3"])
    {
      id v7 = @"Display P3";
    }
    else
    {
      if (([v6 isEqualToString:@"Adobe RGB"] & 1) != 0
        || ([v6 isEqualToString:@"sRGB"] & 1) != 0
        || ([v6 isEqualToString:@"Display P3"] & 1) != 0)
      {
        goto LABEL_8;
      }
      id v7 = @"sRGB";
    }

    id v6 = v7;
LABEL_8:
    [v8 setObject:v6 forKeyedSubscript:@"colorSpace"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  v56[3] = *(double *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"settings"];
  id v6 = [v5 objectForKeyedSubscript:@"colorType"];
  id v7 = +[PIWhiteBalanceAdjustmentController stringForColorType:](PIWhiteBalanceAdjustmentController, "stringForColorType:", [v6 integerValue]);
  [v4 setObject:v7 forKeyedSubscript:@"colorType"];

  id v8 = [v4 valueForKey:@"temperature"];
  [v8 doubleValue];
  double v10 = v9;
  id v11 = +[PICompositionController settingForAdjustmentKey:@"whiteBalance" settingKey:@"temperature"];
  int v12 = [v11 minimumValue];
  [v12 doubleValue];
  double v14 = v13;

  long long v15 = [v11 maximumValue];
  [v15 doubleValue];
  double v17 = v16;

  if (v8)
  {
    if (v10 < v14 || v10 > v17)
    {
      uint64_t v19 = [v11 defaultValue];
      [v4 setObject:v19 forKeyedSubscript:@"temperature"];
    }
  }
  id v20 = [v5 objectForKeyedSubscript:@"grayColor"];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = [v20 objectForKeyedSubscript:@"colorComponents"];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 doubleValue];
    v56[0] = v24;

    uint64_t v25 = [v22 objectAtIndexedSubscript:1];
    [v25 doubleValue];
    v56[1] = v26;

    uint64_t v27 = [v22 objectAtIndexedSubscript:2];
    [v27 doubleValue];
    v56[2] = v28;

    uint64_t v29 = [v5 objectForKeyedSubscript:@"EV"];
    [v29 doubleValue];
    double v31 = v30;

    v32 = [v5 objectForKeyedSubscript:@"slope"];
    [v32 doubleValue];
    double v34 = v33;

    v35 = [v5 objectForKeyedSubscript:@"bias"];
    [v35 doubleValue];
    double v37 = v36;

    double v54 = 0.0;
    double v55 = 0.0;
    double v53 = 0.0;
    YIQFromRGB(v56, &v55, &v54, &v53, v31, v34, v37);
    v38 = [NSNumber numberWithDouble:v55];
    [v4 setObject:v38 forKeyedSubscript:@"grayY"];

    id v39 = [NSNumber numberWithDouble:v54];
    [v4 setObject:v39 forKeyedSubscript:@"grayI"];

    v40 = [NSNumber numberWithDouble:v53];
    [v4 setObject:v40 forKeyedSubscript:@"grayQ"];
  }
  v41 = [v4 objectForKeyedSubscript:@"faceStrength"];

  if (!v41) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"faceStrength"];
  }
  v42 = [v4 objectForKeyedSubscript:@"faceWarmth"];

  if (!v42) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"faceWarmth"];
  }
  id v43 = [v4 objectForKeyedSubscript:@"faceI"];

  if (!v43) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"faceI"];
  }
  v44 = [v4 objectForKeyedSubscript:@"faceQ"];

  if (!v44) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"faceQ"];
  }
  id v45 = [v4 objectForKeyedSubscript:@"faceWarmth"];

  if (!v45) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"faceWarmth"];
  }
  uint64_t v46 = [v4 objectForKeyedSubscript:@"grayWarmth"];

  if (!v46) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"grayWarmth"];
  }
  uint64_t v47 = [v4 objectForKeyedSubscript:@"grayY"];

  if (!v47) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"grayY"];
  }
  v48 = [v4 objectForKeyedSubscript:@"grayI"];

  if (!v48) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"grayI"];
  }
  v49 = [v4 objectForKeyedSubscript:@"grayQ"];

  if (!v49) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"grayQ"];
  }
  uint64_t v50 = [v4 objectForKeyedSubscript:@"warmFace"];

  if (!v50) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"warmFace"];
  }
  long long v51 = [v4 objectForKeyedSubscript:@"warmTemp"];

  if (!v51) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"warmTemp"];
  }
  long long v52 = [v4 objectForKeyedSubscript:@"warmTint"];

  if (!v52) {
    [v4 setObject:&unk_1F0009B90 forKeyedSubscript:@"warmTint"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:@"settings"];
  id v6 = [v5 objectForKeyedSubscript:@"straightenAngle"];
  [v6 doubleValue];
  double v8 = v7 * 180.0;

  double v9 = [NSNumber numberWithDouble:v8 / -3.14159265];
  [v11 setObject:v9 forKeyedSubscript:@"angle"];

  double v10 = [v4 objectForKeyedSubscript:@"auto"];

  if (v10) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"auto"];
  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v7 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v7 objectForKeyedSubscript:@"effectName"];
  id v6 = +[PIPhotoEditHelper effectNameForFilterName:v5];
  [v4 setObject:v6 forKeyedSubscript:@"kind"];
}

__CFString *__49__PICompositionSerializerConstants_conversionMap__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"effectName"];
  if (+[PIPhotoEditHelper is3DEffect:v2]) {
    v3 = @"effect3D";
  }
  else {
    v3 = @"effect";
  }

  return v3;
}

__CFString *__49__PICompositionSerializerConstants_conversionMap__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"effectName"];
  if (+[PIPhotoEditHelper is3DEffect:v2]) {
    v3 = @"Effect3D";
  }
  else {
    v3 = @"Effect";
  }

  return v3;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v9 = [a2 objectForKeyedSubscript:@"settings"];
  id v5 = [v9 valueForKey:@"offsetStrength"];
  id v6 = NSNumber;
  [v5 floatValue];
  double v8 = [v6 numberWithDouble:v7 + 0.5];
  [v4 setObject:v8 forKeyedSubscript:@"strength"];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2_168(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"offsetSaturation"];

  if (!v4) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetSaturation"];
  }
  id v5 = [v3 objectForKeyedSubscript:@"offsetCast"];

  if (!v5) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetCast"];
  }
  id v6 = [v3 objectForKeyedSubscript:@"offsetContrast"];

  if (!v6) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetContrast"];
  }
  float v7 = [[PISmartColorAdjustmentController alloc] initWithAdjustment:v3];
  double v8 = [(PISmartColorAdjustmentController *)v7 computedSettings];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PICompositionSerializerConstants_conversionMap__block_invoke_3;
  v10[3] = &unk_1E5D80120;
  id v11 = v3;
  id v9 = v3;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"offsetBlack"];

  if (!v4) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetBlack"];
  }
  id v5 = [v3 objectForKeyedSubscript:@"offsetExposure"];

  if (!v5) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetExposure"];
  }
  id v6 = [v3 objectForKeyedSubscript:@"offsetContrast"];

  if (!v6) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetContrast"];
  }
  float v7 = [v3 objectForKeyedSubscript:@"offsetBrightness"];

  if (!v7) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetBrightness"];
  }
  double v8 = [v3 objectForKeyedSubscript:@"offsetHighlights"];

  if (!v8) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetHighlights"];
  }
  id v9 = [v3 objectForKeyedSubscript:@"offsetShadows"];

  if (!v9) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetShadows"];
  }
  double v10 = [v3 objectForKeyedSubscript:@"offsetLocalLight"];

  if (!v10) {
    [v3 setObject:&unk_1F0009B90 forKeyedSubscript:@"offsetLocalLight"];
  }
  id v11 = [v3 objectForKeyedSubscript:@"statistics"];
  int v12 = v11;
  if (v11)
  {
    double v13 = (void *)[v11 mutableCopy];
    double v14 = [v12 objectForKeyedSubscript:@"lightMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:1];
      [v13 setObject:v15 forKeyedSubscript:@"lightMap"];
    }
    double v16 = [v12 objectForKeyedSubscript:@"lightMapAvg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:1];
      [v13 setObject:v17 forKeyedSubscript:@"lightMapAvg"];
    }
  }
  else
  {
    double v13 = 0;
  }
  [v3 setObject:v13 forKeyedSubscript:@"statistics"];

  CMTimeRange v18 = [[PISmartToneAdjustmentController alloc] initWithAdjustment:v3];
  uint64_t v19 = [(PISmartToneAdjustmentController *)v18 computedSettings];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __49__PICompositionSerializerConstants_conversionMap__block_invoke_153;
  v21[3] = &unk_1E5D80120;
  id v22 = v3;
  id v20 = v3;
  [v19 enumerateKeysAndObjectsUsingBlock:v21];
}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_153(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

@end