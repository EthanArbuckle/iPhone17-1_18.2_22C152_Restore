@interface PIModernPhotosPipeline
- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)evaluate:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIModernPhotosPipeline

- (id)evaluate:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v785 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v743 = a4;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A628]) initWithPipelineState:v9];
  v11 = [v8 objectForKeyedSubscript:@"debug"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v725 = [v9 mediaComponentType];
  uint64_t v747 = [v9 mediaComponentType];
  BOOL v738 = v747 == 1;
  v13 = [v8 objectForKeyedSubscript:@"raw"];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 objectForKeyedSubscript:@"inputDecoderVersion"];
    [v12 setObject:v15 forKeyedSubscript:@"inputDecoderVersion"];

    v16 = [v14 objectForKeyedSubscript:@"inputSushiLevel"];
    if (v16) {
      [v12 setObject:v16 forKeyedSubscript:@"kCGImageSourceShouldExtendRaw"];
    }
    v17 = [v14 objectForKeyedSubscript:@"gainMapVersion"];
    [v12 setObject:v17 forKeyedSubscript:@"gainMapVersion"];

    v18 = [v14 objectForKeyedSubscript:@"gainMapParameters"];
    [v12 setObject:v18 forKeyedSubscript:@"gainMapParameters"];

    v19 = [v14 objectForKeyedSubscript:@"boostVersion"];
    [v12 setObject:v19 forKeyedSubscript:@"boostVersion"];

    v20 = [v14 objectForKeyedSubscript:@"boostParams"];
    [v12 setObject:v20 forKeyedSubscript:@"boostParams"];

    v21 = [v11 objectForKeyedSubscript:@"raw_transferTone"];
    [v12 setObject:v21 forKeyedSubscript:@"debugTransferTone"];

    v22 = [v11 objectForKeyedSubscript:@"raw_boost"];
    [v12 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1E428]];

    v23 = [v11 objectForKeyedSubscript:@"raw_exposure"];
    [v12 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F1E470]];

    v24 = [v11 objectForKeyedSubscript:@"raw_blackPoint"];
    [v12 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F1E420]];

    v25 = [v11 objectForKeyedSubscript:@"raw_toneMapping"];
    [v12 setObject:v25 forKeyedSubscript:@"inputToneMapping"];

    v26 = [v11 objectForKeyedSubscript:@"raw_gamutMapping"];
    [v12 setObject:v26 forKeyedSubscript:@"inputGamutMapMax"];
  }
  v27 = [v8 objectForKeyedSubscript:@"rawNoiseReduction"];
  if ([v27 isEnabled])
  {
    v28 = [v27 objectForKeyedSubscript:@"detail"];
    [v12 setObject:v28 forKeyedSubscript:@"inputNoiseReductionDetailAmount"];

    v29 = [v27 objectForKeyedSubscript:@"color"];
    [v12 setObject:v29 forKeyedSubscript:@"inputUIColorNoiseReductionAmount"];

    v30 = [v27 objectForKeyedSubscript:@"luminance"];
    [v12 setObject:v30 forKeyedSubscript:@"inputUILuminanceNoiseReductionAmount"];

    v31 = [v27 objectForKeyedSubscript:@"sharpness"];
    [v12 setObject:v31 forKeyedSubscript:@"inputNoiseReductionSharpnessAmount"];

    v32 = [v27 objectForKeyedSubscript:@"contrast"];
    [v12 setObject:v32 forKeyedSubscript:@"inputNoiseReductionContrastAmount"];
  }
  v742 = v27;
  v33 = [v8 objectForKeyedSubscript:@"whiteBalance"];
  v34 = v33;
  if (v14)
  {
    if ([v33 isEnabled])
    {
      v35 = [v34 objectForKeyedSubscript:@"colorType"];
      int v36 = [v35 isEqualToString:@"tempTint"];

      if (v36)
      {
        v37 = [v34 objectForKeyedSubscript:@"temperature"];
        [v12 setObject:v37 forKeyedSubscript:@"inputNeutralTemperature"];

        v38 = [v34 objectForKeyedSubscript:@"tint"];
        [v12 setObject:v38 forKeyedSubscript:@"inputNeutralTint"];
      }
    }
  }
  v744 = v9;
  uint64_t v783 = *MEMORY[0x1E4F1F9F8];
  unsigned int v735 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  unsigned int v784 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v730 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v39 = [v8 objectForKeyedSubscript:@"autoLoop"];
  v751 = v10;
  uint64_t v40 = [v10 mediaTypeForComposition:v8];
  if ([v39 isEnabled])
  {
    id v41 = 0;
  }
  else
  {
    id v41 = [v8 objectForKeyedSubscript:@"livePhotoKeyFrame"];
  }
  v746 = [v8 objectForKeyedSubscript:@"videoPosterFrame"];
  v42 = [v8 objectForKeyedSubscript:@"trim"];
  unint64_t v43 = v40 & 0xFFFFFFFFFFFFFFFELL;
  v745 = v14;
  v750 = v8;
  if (v747 == 1 && v43 == 2)
  {
    v44 = a6;
    if ([v751 hasStaticTime])
    {
      [v12 setObject:@"Video" forKeyedSubscript:@"mediaComponentType"];
      if ([v39 isEnabled]) {
        uint64_t v45 = MEMORY[0x1E4F1CC28];
      }
      else {
        uint64_t v45 = MEMORY[0x1E4F1CC38];
      }
      [v12 setObject:v45 forKeyedSubscript:@"hardCropCleanAperture"];
      goto LABEL_38;
    }
    if (v40 != 2)
    {
      if (v40 == 3)
      {
        if (v41)
        {
          v723 = v42;
          v53 = [v41 objectForKeyedSubscript:@"time"];
          uint64_t v54 = [v53 longLongValue];
          [v41 objectForKeyedSubscript:@"scale"];
          v705 = v39;
          v56 = v55 = v34;
          int32_t v57 = [v56 intValue];
          int64_t v58 = v54;
          v44 = a6;
          CMTimeMake((CMTime *)v760, v58, v57);
          uint64_t v783 = *(void *)v760;
          unsigned int v59 = *(_DWORD *)&v760[12];
          unsigned int v784 = *(_DWORD *)&v760[8];
          v60 = v11;
          id v61 = v41;
          uint64_t v62 = *(void *)&v760[16];

          v34 = v55;
          v39 = v705;

          v63 = (void *)MEMORY[0x1E4F29238];
          *(void *)v760 = v783;
          *(void *)&v760[8] = __PAIR64__(v59, v784);
          unsigned int v735 = v59;
          uint64_t v730 = v62;
          *(void *)&v760[16] = v62;
          id v41 = v61;
          v11 = v60;
LABEL_56:
          v91 = [v63 valueWithCMTime:v760];
          [v12 setObject:v91 forKeyedSubscript:@"defaultFrameTime"];

          [v12 setObject:@"Video" forKeyedSubscript:@"mediaComponentType"];
          [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hardCropCleanAperture"];
          goto LABEL_57;
        }
        if ([v39 isEnabled])
        {
          v64 = [v39 objectForKeyedSubscript:@"flavor"];
          if (([v64 isEqualToString:@"LongExposure"] & 1) == 0)
          {
            v710 = v34;
            if ([v42 isEnabled])
            {
              v736 = [v42 objectForKeyedSubscript:@"start"];
              int64_t v77 = [v736 longLongValue];
              v78 = [v42 objectForKeyedSubscript:@"startScale"];
              CMTimeMake((CMTime *)v760, v77, [v78 intValue]);
              uint64_t v783 = *(void *)v760;
              unsigned int v79 = *(_DWORD *)&v760[12];
              unsigned int v784 = *(_DWORD *)&v760[8];
              uint64_t v80 = *(void *)&v760[16];

              uint64_t v81 = v80;
              id v41 = 0;
            }
            else
            {
              CMTimeMake((CMTime *)v760, 0, 60);
              uint64_t v783 = *(void *)v760;
              unsigned int v79 = *(_DWORD *)&v760[12];
              unsigned int v784 = *(_DWORD *)&v760[8];
              uint64_t v81 = *(void *)&v760[16];
            }
            *(void *)v760 = v783;
            *(void *)&v760[8] = __PAIR64__(v79, v784);
            unsigned int v735 = v79;
            uint64_t v730 = v81;
            *(void *)&v760[16] = v81;
            v143 = [MEMORY[0x1E4F29238] valueWithCMTime:v760];
            [v12 setObject:v143 forKeyedSubscript:@"defaultFrameTime"];

            [v12 setObject:@"Video" forKeyedSubscript:@"mediaComponentType"];
            v34 = v710;
          }
          goto LABEL_36;
        }
      }
      goto LABEL_38;
    }
    v723 = v42;
    if (v746)
    {
      v73 = [v746 objectForKeyedSubscript:@"time"];
      uint64_t v74 = [v73 longLongValue];
      v75 = @"scale";
      v76 = v746;
    }
    else
    {
      if (![v42 isEnabled])
      {
        CMTimeMake((CMTime *)v760, 0, 60);
        uint64_t v783 = *(void *)v760;
        unsigned int v86 = *(_DWORD *)&v760[12];
        unsigned int v784 = *(_DWORD *)&v760[8];
        uint64_t v90 = *(void *)&v760[16];
        goto LABEL_55;
      }
      v73 = [v42 objectForKeyedSubscript:@"start"];
      uint64_t v74 = [v73 longLongValue];
      v75 = @"startScale";
      v76 = v42;
    }
    [v76 objectForKeyedSubscript:v75];
    v706 = v39;
    v83 = v82 = v34;
    int32_t v84 = [v83 intValue];
    int64_t v85 = v74;
    v44 = a6;
    CMTimeMake((CMTime *)v760, v85, v84);
    uint64_t v783 = *(void *)v760;
    unsigned int v86 = *(_DWORD *)&v760[12];
    unsigned int v784 = *(_DWORD *)&v760[8];
    v87 = v11;
    id v88 = v41;
    uint64_t v89 = *(void *)&v760[16];

    v34 = v82;
    v39 = v706;

    uint64_t v90 = v89;
    id v41 = v88;
    v11 = v87;
LABEL_55:
    v63 = (void *)MEMORY[0x1E4F29238];
    *(void *)v760 = v783;
    *(void *)&v760[8] = __PAIR64__(v86, v784);
    unsigned int v735 = v86;
    uint64_t v730 = v90;
    *(void *)&v760[16] = v90;
    goto LABEL_56;
  }
  if (v43 != 2)
  {
LABEL_37:
    v44 = a6;
    goto LABEL_38;
  }
  v46 = [v8 objectForKeyedSubscript:@"cropStraighten"];

  if (v46 && ([v39 isEnabled] & 1) == 0)
  {
    if (v40 == 3) {
      uint64_t v47 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v47 = MEMORY[0x1E4F1CC38];
    }
    [v12 setObject:v47 forKeyedSubscript:@"hardCropCleanAperture"];
  }
  if (v41)
  {
    v723 = v42;
    v48 = [v41 objectForKeyedSubscript:@"time"];
    int64_t v49 = [v48 longLongValue];
    [v41 objectForKeyedSubscript:@"scale"];
    v50 = v39;
    v52 = v51 = v34;
    CMTimeMake((CMTime *)v760, v49, [v52 intValue]);
    uint64_t v783 = *(void *)v760;
    unsigned int v735 = *(_DWORD *)&v760[12];
    unsigned int v784 = *(_DWORD *)&v760[8];
    uint64_t v730 = *(void *)&v760[16];

    v34 = v51;
    v39 = v50;

    v44 = a6;
LABEL_57:
    int v71 = 0;
    BOOL v720 = v41 != 0;
    v42 = v723;
    goto LABEL_58;
  }
  v44 = a6;
  if (v746)
  {
    v64 = [v746 objectForKeyedSubscript:@"time"];
    v65 = v39;
    v66 = v34;
    uint64_t v67 = [v64 longLongValue];
    [v746 objectForKeyedSubscript:@"scale"];
    v68 = v713 = v11;
    int32_t v69 = [v68 intValue];
    int64_t v70 = v67;
    v34 = v66;
    v39 = v65;
    id v41 = 0;
    CMTimeMake((CMTime *)v760, v70, v69);
    uint64_t v783 = *(void *)v760;
    unsigned int v735 = *(_DWORD *)&v760[12];
    unsigned int v784 = *(_DWORD *)&v760[8];
    uint64_t v730 = *(void *)&v760[16];

    v11 = v713;
LABEL_36:

    goto LABEL_37;
  }
LABEL_38:
  int v71 = 0;
  if (v40 != 3 || v41)
  {
    BOOL v720 = v41 != 0;
  }
  else if ([v39 isEnabled])
  {
    BOOL v720 = 0;
    int v71 = 0;
  }
  else if (v725 == 2)
  {
    BOOL v720 = 0;
    int v71 = 1;
  }
  else
  {
    v72 = [v12 objectForKeyedSubscript:@"mediaComponentType"];
    int v71 = [v72 isEqualToString:@"Video"];

    BOOL v720 = 0;
  }
LABEL_58:
  if ([v39 isEnabled])
  {
    v92 = [v39 objectForKeyedSubscript:@"flavor"];
    int v93 = [v92 isEqualToString:@"LongExposure"];
    if (v747 == 1) {
      BOOL v94 = v93;
    }
    else {
      BOOL v94 = 0;
    }
    BOOL v738 = v94;
    [v12 setObject:@"Video" forKeyedSubscript:@"mediaComponentType"];
  }
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"skipOrientation"];
  v95 = [v750 objectForKeyedSubscript:@"semanticStyle"];
  int v96 = [v95 isEnabled];
  if (v14) {
    int v97 = 0;
  }
  else {
    int v97 = v96;
  }
  if (v97 == 1) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"revertToOriginalStyle"];
  }
  id v98 = (id)[v751 beginGroupWithName:@"Master" error:v44];
  if (v44 && *v44)
  {
    v99 = 0;
    goto LABEL_348;
  }
  int v716 = v71;
  v729 = v95;
  v100 = [v750 objectForKeyedSubscript:@"source"];
  v101 = [v751 renderNodeFromSource:v100 settings:v12 error:v44];

  if (!v44 || !*v44)
  {
    if (v97)
    {
      [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"revertToOriginalStyle"];
      v102 = [v750 objectForKeyedSubscript:@"source"];
      v718 = [v751 renderNodeFromSource:v102 settings:v12 error:a6];

      if (a6 && *a6)
      {
        v99 = 0;
LABEL_346:

        goto LABEL_347;
      }
    }
    else
    {
      v718 = 0;
    }
    id v772 = 0;
    v103 = [v751 inputForPath:@"RAW/Linear" error:&v772];
    id v715 = v772;
    if (v103)
    {
      v104 = a6;
      v719 = [v751 addTagWithName:@"Source" inputNode:v103 error:a6];

      if (a6)
      {
        if (*a6)
        {
          v99 = 0;
LABEL_345:

          goto LABEL_346;
        }
        v105 = v101;
        goto LABEL_88;
      }
      v105 = v101;
    }
    else
    {
      v104 = a6;
      v105 = [v751 addTagWithName:@"Source" inputNode:v101 error:a6];

      if (a6)
      {
        v719 = 0;
        if (*a6)
        {
          v101 = v105;
          v99 = 0;
          goto LABEL_345;
        }
LABEL_88:
        [v751 endGroupWithName:@"Master" error:v104];
        if (*v104)
        {
          v99 = 0;
LABEL_344:
          v101 = v105;
          goto LABEL_345;
        }
        v106 = [(NURenderNode *)v105 imageProperties:v104];
        if (*v104)
        {
          v99 = 0;
LABEL_343:

          goto LABEL_344;
        }
LABEL_92:
        id v708 = v106;
        v714 = v11;
        id v709 = v41;
        v711 = v34;
        v724 = v42;
        if ([MEMORY[0x1E4F7A4A0] enableHDRSupport]
          && [v744 auxiliaryImageType] == 1
          && (([MEMORY[0x1E4F7A4A0] allAssetsCanUseHDRPipeline] & 1) != 0
           || [v708 isHDR]))
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_1260);
          }
          v107 = (id)*MEMORY[0x1E4F7A758];
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v760 = 0;
            _os_log_debug_impl(&dword_1A9680000, v107, OS_LOG_TYPE_DEBUG, "Evaluating pipeline as HDR input", v760, 2u);
          }
          v108 = v751;

          unsigned int v703 = 1;
        }
        else
        {
          v108 = v751;
          unsigned int v703 = 0;
        }
        v109 = v105;
        v712 = v109;
        if (v719)
        {
          v110 = [v11 objectForKeyedSubscript:@"raw_applyFirst"];
          if ([v110 BOOLValue])
          {
LABEL_106:

            goto LABEL_107;
          }
          v111 = +[PIGlobalSettings globalSettings];
          char v112 = [v111 rawApplyBoostFirst];

          if ((v112 & 1) == 0)
          {
            v110 = [v745 objectForKeyedSubscript:@"boostAmount"];
            v113 = [v745 objectForKeyedSubscript:@"boostVersion"];
            v114 = [v745 objectForKeyedSubscript:@"boostParams"];
            v115 = NUMakeDictionary4();
            v109 = [v108 nodeByApplyingFilterWithName:@"PIForwardFakeBoost" useHDRFilter:v703 settingsAndInputs:v115];

            goto LABEL_106;
          }
        }
LABEL_107:
        v105 = [v108 addTagWithName:@"pre-SemanticStyle" inputNode:v109 error:a6];

        v116 = a6;
        if (a6 && *a6)
        {
          v99 = 0;
          v11 = v714;
          id v41 = v709;
          v34 = v711;
LABEL_342:

          v106 = v708;
          goto LABEL_343;
        }
        if ([v729 isEnabled])
        {
          v117 = (PIDepthEffectNode *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v118 = [v729 objectForKeyedSubscript:@"tone"];
          [(PIDepthEffectNode *)v117 setObject:v118 forKeyedSubscript:@"tone"];

          v119 = [v729 objectForKeyedSubscript:@"color"];
          [(PIDepthEffectNode *)v117 setObject:v119 forKeyedSubscript:@"color"];

          v120 = [v729 objectForKeyedSubscript:@"cast"];
          [(PIDepthEffectNode *)v117 setObject:v120 forKeyedSubscript:@"cast"];

          v121 = [v729 objectForKeyedSubscript:@"intensity"];
          [(PIDepthEffectNode *)v117 setObject:v121 forKeyedSubscript:@"intensity"];

          uint64_t v122 = [v729 objectForKeyedSubscript:@"version"];
          [(PIDepthEffectNode *)v117 setObject:v122 forKeyedSubscript:@"version"];

          v123 = [v729 objectForKeyedSubscript:@"debugDisableStyleEngine"];
          int v124 = [v123 BOOLValue];

          v125 = +[PIGlobalSettings globalSettings];
          LOBYTE(v122) = [v125 semanticStyleDisableStyleEngine];

          if ((v122 & 1) != 0 || v124)
          {
            v126 = v117;
            v129 = [[PISemanticStyleRenderNode alloc] initWithInput:v105 settings:v117];

            v704 = 0;
            v105 = (PIDepthEffectNode *)v129;
            v11 = v714;
            id v41 = v709;
            v34 = v711;
            v42 = v724;
            v116 = a6;
          }
          else
          {
            v126 = v117;
            v127 = [(PISemanticStyleRenderNode *)[PISemanticStyleLearnNode alloc] initWithInput:v105 settings:v117];
            v116 = a6;
            id v128 = (id)[v751 addTagWithName:@"semanticStyleLearn" inputNode:v127 error:a6];
            v11 = v714;
            v42 = v724;
            v704 = v127;
            if (a6)
            {
              id v41 = v709;
              if (*a6)
              {
                v99 = 0;
                v34 = v711;
LABEL_339:

                goto LABEL_340;
              }
              v34 = v711;
            }
            else
            {
              id v41 = v709;
              v34 = v711;
            }
          }
        }
        else
        {
          v704 = 0;
          v11 = v714;
          id v41 = v709;
          v34 = v711;
        }
        [v751 addTagWithName:@"pre-AutoLoop" inputNode:v105 error:v116];
        v130 = v116;
        v131 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

        if (v130 && *v130) {
          goto LABEL_126;
        }
        if (![v39 isEnabled]) {
          goto LABEL_152;
        }
        if (v704)
        {
          v132 = [[PISemanticStyleApplyNode alloc] initWithInput:v131 style:v704 thumbnail:0];

          v131 = [v751 cacheNode:v132 type:@"Video" settings:MEMORY[0x1E4F1CC08] error:a6];

          if (a6 && *a6) {
            goto LABEL_126;
          }
        }
        v133 = [v39 objectForKeyedSubscript:@"flavor"];
        v134 = [v39 objectForKeyedSubscript:@"recipe"];
        v135 = NUMakeDictionary2();
        v126 = (PIDepthEffectNode *)[v135 mutableCopy];

        if ([v724 isEnabled])
        {
          v136 = [v724 objectForKeyedSubscript:@"start"];
          v137 = [v724 objectForKeyedSubscript:@"end"];
          v138 = [v724 objectForKeyedSubscript:@"startScale"];
          v139 = [v724 objectForKeyedSubscript:@"endScale"];
          v140 = NUMakeDictionary4();
          [(PIDepthEffectNode *)v126 setObject:v140 forKeyedSubscript:@"trim"];
        }
        v699 = v126;
        v105 = [v751 cacheNode:v131 type:@"AutoLoop" settings:v126 error:a6];

        v34 = v711;
        if (a6 && *a6)
        {
          v704 = 0;
          v99 = 0;
          v11 = v714;
          id v41 = v709;
          v42 = v724;
          goto LABEL_339;
        }
        v141 = [v39 objectForKeyedSubscript:@"flavor"];
        int v142 = [v141 isEqualToString:@"LongExposure"];

        if (v142)
        {
          id v41 = v709;
          if (v747 == 1)
          {
            v698 = [v750 objectForKeyedSubscript:@"highResFusion"];
            v11 = v714;
            if ([v698 isEnabled]) {
              [v751 performLongExposureFusionForComposition:v750 longExposureImage:v105 useHDRFilter:v703 error:a6];
            }
            else {
              objc_msgSend(v751, "scaleNode:scale:error:", v105, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8), a6);
            }
            v144 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

            v42 = v724;
            if (a6 && *a6)
            {
              v704 = 0;
LABEL_188:
              v99 = 0;
              v126 = v699;
LABEL_338:

              v105 = v144;
              goto LABEL_339;
            }

            v105 = v144;
            goto LABEL_151;
          }
          v11 = v714;
        }
        else
        {
          v11 = v714;
          id v41 = v709;
        }
        v42 = v724;
LABEL_151:

        v704 = 0;
        v131 = v105;
LABEL_152:
        if ((v735 & 1) != 0 && v747 == 1)
        {
          id v145 = objc_alloc(MEMORY[0x1E4F7A5C0]);
          *(void *)v760 = v783;
          *(void *)&v760[8] = __PAIR64__(v735, v784);
          *(void *)&v760[16] = v730;
          v700 = [MEMORY[0x1E4F29238] valueWithCMTime:v760];
          v146 = NUMakeDictionary2();
          NUMakeDictionary1();
          v147 = v39;
          v149 = v148 = v34;
          uint64_t v150 = [v145 initWithSettings:v146 inputs:v149];

          v34 = v148;
          v39 = v147;

          id v41 = v709;
          v11 = v714;
          v131 = (PIDepthEffectNode *)v150;
        }
        if (v97 && ([v39 isEnabled] & 1) == 0)
        {
          uint64_t v152 = [v751 addTagWithName:@"ShowOriginalSource" inputNode:v718 error:a6];

          if (a6 && *a6)
          {
            v99 = 0;
            v718 = (void *)v152;
            goto LABEL_341;
          }
          v718 = (void *)v152;
          v105 = v131;
          v151 = a6;
        }
        else
        {
          v105 = [v751 addTagWithName:@"ShowOriginalSource" inputNode:v131 error:a6];

          v151 = a6;
          if (a6 && *a6)
          {
            v99 = 0;
LABEL_340:
            v131 = v105;
            goto LABEL_341;
          }
        }
        if (!v703 || ([MEMORY[0x1E4F7A4A0] HLGOpticalScale], v153 <= 1.0))
        {
LABEL_169:
          v126 = v105;
          v105 = [v751 addTagWithName:@"pre-Adjustments" inputNode:v126 error:v151];

          if (v151 && *v151)
          {
            v99 = 0;
            goto LABEL_339;
          }
          v699 = v126;
          if (v738)
          {
            v155 = [v750 objectForKeyedSubscript:@"retouch"];
            v698 = v155;
            if ([v155 isEnabled])
            {
              id v156 = v41;
              v781 = @"retouch";
              v782 = v155;
              v157 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v782 forKeys:&v781 count:1];
              v158 = a6;
              v693 = [v751 cacheNode:v105 type:@"Retouch" settings:v157 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v11 = v714;
                v34 = v711;
                id v41 = v156;
                v42 = v724;
LABEL_337:

                v144 = v105;
                goto LABEL_338;
              }
              v779[0] = @"image";
              v779[1] = @"retouchedImage";
              v780[0] = v105;
              v780[1] = v693;
              v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v780 forKeys:v779 count:2];
              v172 = v751;
              uint64_t v174 = [v751 switchFromNodes:v173 mainInput:@"image" selector:&__block_literal_global_21341];

              int v171 = 1;
              v105 = (PIDepthEffectNode *)v174;
              v11 = v714;
              v34 = v711;
              id v41 = v156;
              v42 = v724;
            }
            else
            {
              int v171 = 0;
              v158 = a6;
              v172 = v751;
            }
            [v172 addTagWithName:@"Pre-Inpaint" inputNode:v105 error:v158];
            v175 = v158;
            v144 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

            if (v175 && *v175) {
              goto LABEL_188;
            }
            v176 = [v750 objectForKeyedSubscript:@"inpaint"];
            v693 = v176;
            if ([v176 isEnabled])
            {
              v177 = [v750 objectForKeyedSubscript:@"inpaintMasks"];
              v692 = [v176 objectForKeyedSubscript:@"operations"];
              +[PIInpaintCacheNode inpaintNodeWithInput:operations:masks:error:](PIInpaintCacheNode, "inpaintNodeWithInput:operations:masks:error:", v144);
              v694 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

              v178 = a6;
              if (a6 && *a6)
              {
                v690 = v177;
                v99 = 0;
                goto LABEL_193;
              }

              int v171 = 1;
              v179 = v694;
            }
            else
            {
              v179 = v144;
              v178 = a6;
            }
            v105 = [v751 addTagWithName:@"Inpaint" inputNode:v179 error:v178];

            v126 = v699;
            if (v178 && *v178)
            {
              v99 = 0;
              v42 = v724;
              id v41 = v709;
              goto LABEL_337;
            }
            v209 = [v750 objectForKeyedSubscript:@"apertureRedEye"];
            if ([v209 isEnabled])
            {
              v210 = v11;
              v211 = v209;
              uint64_t v212 = [v751 performApertureRedeyeOnImage:v105 useHDRFilter:v703 redEyeAdjustment:v209];

              int v171 = 1;
              v105 = (PIDepthEffectNode *)v212;
            }
            else
            {
              v211 = v209;
              v210 = v11;
            }
            v213 = [v750 objectForKeyedSubscript:@"redEye"];
            if ([v213 isEnabled])
            {
              uint64_t v214 = [v751 performRedeyeOnImage:v105 useHDRFilter:v703 redEyeAdjustment:v213];

              int v171 = 1;
              v105 = (PIDepthEffectNode *)v214;
            }
            v11 = v210;

            BOOL v159 = v171 != 0;
          }
          else
          {
            BOOL v159 = 0;
          }
          v160 = v105;
          v161 = [v750 objectForKeyedSubscript:@"depthEffect"];
          v162 = [v750 objectForKeyedSubscript:@"effect3D"];
          v163 = [v750 objectForKeyedSubscript:@"portraitEffect"];
          int v687 = [v161 isEnabled];
          v690 = v162;
          int v685 = [v162 isEnabled];
          v692 = v163;
          int v164 = [v163 isEnabled];
          v693 = v161;
          v698 = v160;
          int v701 = v164;
          if (v747 == 1)
          {
            char v165 = v164;
            v166 = v11;
            v167 = v160;
            v168 = v708;
            if ((v165 & 1) == 0)
            {
              v777 = @"keepCacheWhenAtOneToOne";
              v169 = [NSNumber numberWithBool:v159];
              v778 = v169;
              v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v778 forKeys:&v777 count:1];
              v694 = [v751 cacheNode:v160 type:@"Intermediate" settings:v170 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v11 = v166;
                id v41 = v709;
                v34 = v711;
                v42 = v724;
LABEL_193:
                v126 = v699;
LABEL_336:

                v105 = v694;
                goto LABEL_337;
              }
              v168 = v708;
              v167 = (PIPortraitEffectNode *)v694;
            }
            v180 = [v168 auxiliaryImagePropertiesForType:2];

            if (v180)
            {
              v181 = [MEMORY[0x1E4F1CA60] dictionary];
              v182 = [v161 objectForKeyedSubscript:@"depthInfo"];
              [v181 setObject:v182 forKeyedSubscript:@"depthInfo"];

              v183 = [v161 objectForKeyedSubscript:@"aperture"];
              [v181 setObject:v183 forKeyedSubscript:@"aperture"];

              v184 = [v161 objectForKeyedSubscript:@"focusRect"];
              [v181 setObject:v184 forKeyedSubscript:@"focusRect"];

              v185 = [v161 objectForKeyedSubscript:@"glassesMatteAllowed"];
              [v181 setObject:v185 forKeyedSubscript:@"glassesMatteAllowed"];

              v691 = [[PIPortraitMakeBlurMapNode alloc] initWithInput:v167 settings:v181];
            }
            else
            {
              v691 = 0;
            }
            v11 = v166;
          }
          else
          {
            v691 = 0;
            v167 = v160;
          }
          v186 = [v11 objectForKeyedSubscript:@"inputExposure"];
          [v186 doubleValue];
          double v188 = v187;

          if (v188 != 0.0)
          {
            v189 = [v11 objectForKeyedSubscript:@"inputExposure"];
            v190 = NUMakeDictionary2();
            uint64_t v191 = [v751 nodeByApplyingFilterWithName:@"CIExposureAdjust" useHDRFilter:v703 settingsAndInputs:v190];

            v167 = (PIPortraitEffectNode *)v191;
          }
          v192 = a6;
          if (v747 == 1) {
            int v193 = v701;
          }
          else {
            int v193 = 0;
          }
          v126 = v699;
          if (v193 == 1)
          {
            v194 = [MEMORY[0x1E4F1CA60] dictionary];
            v195 = [v692 objectForKeyedSubscript:@"kind"];
            [v194 setObject:v195 forKeyedSubscript:@"kind"];

            v196 = [v692 objectForKeyedSubscript:@"portraitInfo"];
            [v194 setObject:v196 forKeyedSubscript:@"portraitInfo"];

            v197 = [v692 objectForKeyedSubscript:@"strength"];
            [v194 setObject:v197 forKeyedSubscript:@"strength"];

            v198 = [v692 objectForKeyedSubscript:@"spillMatteAllowed"];
            [v194 setObject:v198 forKeyedSubscript:@"spillMatteAllowed"];

            v199 = v194;
            v200 = [[PIPortraitEffectNode alloc] initWithInput:v167 blurMap:v691 settings:v194];

            v42 = v724;
            if ([v751 versionForPortraitEffect:v692] >= 2)
            {
              uint64_t v201 = [v751 addTagWithName:@"PortraitV2" inputNode:v200 error:a6];

              if (a6 && *a6)
              {
                v694 = (PIDepthEffectNode *)v201;
                v689 = v199;
LABEL_253:
                v99 = 0;
                v11 = v714;
                id v41 = v709;
                v34 = v711;
LABEL_335:

                goto LABEL_336;
              }
              v200 = (PIPortraitEffectNode *)v201;
            }

            v202 = v200;
            v192 = a6;
            v203 = v751;
          }
          else
          {
            v202 = v167;
            v203 = v751;
            v42 = v724;
          }
          v204 = [v750 objectForKeyedSubscript:@"portraitVideo"];
          v205 = [v203 addTagWithName:@"pre-PortraitVideo" inputNode:v202 error:v192];

          v689 = v204;
          if (v192 && *v192)
          {
            v694 = v205;
            goto LABEL_253;
          }
          if (![v204 isEnabled]) {
            goto LABEL_251;
          }
          v694 = v205;
          v206 = [v750 objectForKeyedSubscript:@"source"];
          int v207 = [v751 isSourceAvailable:v206 sourceSettings:&unk_1F000AFF8];

          if (!v207) {
            goto LABEL_251;
          }
          v208 = [v751 auxiliaryImageFromComposition:v750 type:@"Disparity" mediaComponentType:@"Video" error:v192];
          v684 = v208;
          if (v192 && *v192) {
            goto LABEL_220;
          }
          v215 = [v689 objectForKeyedSubscript:@"disparityKeyframes"];
          v216 = [v689 objectForKeyedSubscript:@"apertureKeyframes"];
          v217 = [v689 objectForKeyedSubscript:@"debugMode"];
          objc_msgSend(v751, "portraitVideo:disparityInput:disparityKeyframes:apertureKeyframes:debugMode:error:", v205, v208, v215, v216, objc_msgSend(v217, "integerValue"), a6);
          v205 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

          if (a6 && *a6)
          {
            v99 = 0;
            v694 = v205;
            goto LABEL_235;
          }
          if (v747 != 1)
          {
            v220 = v689;
LABEL_244:
            v225 = [v220 objectForKeyedSubscript:@"debugMode"];
            int v226 = [v225 intValue];

            if ((v226 & 0xFFFFFFFE) == 6)
            {
              BOOL v227 = v226 == 7;
              uint64_t v228 = [v750 objectForKeyedSubscript:@"source"];
              v229 = v220;
              v230 = (void *)v228;
              v231 = [v229 objectForKeyedSubscript:@"cinematographyState"];
              v694 = [v751 portraitVideoDebugDetectedObjects:v205 source:v230 cinematographyState:v231 monochrome:v227 error:a6];

              v192 = a6;
              if (a6)
              {
                if (*a6)
                {
LABEL_220:
                  v99 = 0;
LABEL_235:
                  v11 = v714;
                  id v41 = v709;
                  v34 = v711;
LABEL_334:

                  goto LABEL_335;
                }
                v205 = v694;
                v192 = a6;
                v208 = v684;
              }
              else
              {
                v205 = v694;
              }
            }
            else
            {
              v192 = a6;
            }

LABEL_251:
            v694 = [v751 addTagWithName:@"post-PortraitVideo" inputNode:v205 error:v192];

            if (v192 && *v192) {
              goto LABEL_253;
            }
            if (v747 == 1) {
              int v232 = v687;
            }
            else {
              int v232 = 0;
            }
            v11 = v714;
            id v41 = v709;
            v707 = v39;
            if (v232 == 1 && v691)
            {
              v233 = [MEMORY[0x1E4F1CA60] dictionary];
              v234 = [v161 objectForKeyedSubscript:@"depthInfo"];
              [v233 setObject:v234 forKeyedSubscript:@"depthInfo"];

              v235 = [v161 objectForKeyedSubscript:@"aperture"];
              [v233 setObject:v235 forKeyedSubscript:@"aperture"];

              if (v701)
              {
                v236 = [v692 objectForKeyedSubscript:@"kind"];
                [v233 setObject:v236 forKeyedSubscript:@"portraitEffect"];
              }
              else
              {
                [v233 setObject:0 forKeyedSubscript:@"portraitEffect"];
              }
              v11 = v714;
              id v41 = v709;
              v238 = [[PIDepthEffectNode alloc] initWithInput:v694 blurMap:v691 settings:v233];

              v237 = v238;
              v34 = v711;
              v42 = v724;
              v192 = a6;
              v126 = v699;
            }
            else
            {
              v34 = v711;
              v237 = v694;
            }
            v694 = [v751 addTagWithName:@"masterSpace" inputNode:v237 error:v192];

            if (v192 && *v192)
            {
              v99 = 0;
              v39 = v707;
              goto LABEL_335;
            }
            v239 = v694;
            v748 = [v750 objectForKeyedSubscript:@"noiseReduction"];
            v684 = v239;
            if ([v748 isEnabled])
            {
              v240 = [v748 objectForKeyedSubscript:@"radius"];
              [v240 doubleValue];
              double v242 = v241;

              v243 = [v748 objectForKeyedSubscript:@"edgeDetail"];
              [v243 doubleValue];
              double v245 = v244;

              double v246 = v242 * 0.5;
              if (v725 != 2) {
                double v246 = v242;
              }
              v247 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v246];
              [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v245];
              v249 = id v248 = v41;
              v250 = NUMakeDictionary3();
              v239 = [v751 nodeByApplyingFilterWithName:@"PIBilateralFilter" useHDRFilter:v703 settingsAndInputs:v250];

              v126 = v699;
              v42 = v724;

              id v41 = v248;
              v192 = a6;
              v11 = v714;
            }
            if (v704)
            {
              v251 = [[PISemanticStyleApplyNode alloc] initWithInput:v239 style:v704 thumbnail:v698];

              v239 = (PIDepthEffectNode *)v251;
            }
            v694 = [v751 addTagWithName:@"pre-WB" inputNode:v239 error:v192];

            if (v192 && *v192) {
              goto LABEL_301;
            }
            if (![v34 isEnabled])
            {
LABEL_299:
              v274 = v694;
              v694 = [v751 addTagWithName:@"pre-Mute" inputNode:v694 error:v192];

              if (v192 && *v192)
              {
LABEL_301:
                v99 = 0;
                v39 = v707;
LABEL_333:

                goto LABEL_334;
              }
              v275 = [v750 objectForKeyedSubscript:@"mute"];
              if ([v275 isEnabled])
              {
                v276 = (PIDepthEffectNode *)[objc_alloc(MEMORY[0x1E4F7A5A8]) initWithInput:v694];

                v11 = v714;
              }
              else
              {
                v276 = v694;
              }
              v694 = [v751 addTagWithName:@"Mute" inputNode:v276 error:v192];

              if (v192 && *v192)
              {
                v99 = 0;
                v39 = v707;
LABEL_332:

                goto LABEL_333;
              }
              v737 = v275;
              if ([v707 isEnabled]
                && ([v707 objectForKeyedSubscript:@"flavor"],
                    v277 = objc_claimAutoreleasedReturnValue(),
                    int v278 = [v277 isEqualToString:@"LongExposure"],
                    v277,
                    !v278))
              {
                v702 = v12;
                int v286 = 1;
              }
              else
              {
                v279 = [v751 addTagWithName:@"pre-LivePhotoKeyFrame" inputNode:v694 error:v192];

                if (v192 && *v192)
                {
                  v99 = 0;
                  v694 = v279;
LABEL_331:
                  v39 = v707;
                  v42 = v724;
                  v275 = v737;
                  goto LABEL_332;
                }
                v702 = v12;
                if (v720)
                {
                  v280 = [v41 objectForKeyedSubscript:@"time"];
                  uint64_t v281 = [v280 longLongValue];
                  v282 = v41;
                  int64_t v283 = v281;
                  v284 = [v282 objectForKeyedSubscript:@"scale"];
                  CMTimeMake((CMTime *)v760, v283, [v284 intValue]);
                  uint64_t v783 = *(void *)v760;
                  LODWORD(v283) = *(_DWORD *)&v760[12];
                  unsigned int v784 = *(_DWORD *)&v760[8];
                  uint64_t v285 = *(void *)&v760[16];

                  *(void *)v760 = v783;
                  *(void *)&v760[8] = __PAIR64__(v283, v784);
                  *(void *)&v760[16] = v285;
                  v694 = [v751 livePhotoKeyFrameMetadataFromNode:v279 time:v760 error:a6];

                  if (a6 && *a6) {
                    goto LABEL_329;
                  }
                  v279 = v694;
                }
                v694 = [v751 addTagWithName:@"LivePhotoKeyFrame" inputNode:v279 error:a6];

                if (a6 && *a6)
                {
LABEL_329:
                  v99 = 0;
LABEL_330:
                  v11 = v714;
                  v126 = v699;
                  v12 = v702;
                  id v41 = v709;
                  v34 = v711;
                  goto LABEL_331;
                }
                int v286 = 0;
              }
              v287 = v694;
              v694 = [v751 addTagWithName:@"pre-Trim" inputNode:v694 error:a6];

              if (a6 && *a6) {
                goto LABEL_329;
              }
              if ((v286 | [v724 isEnabled] ^ 1))
              {
                v288 = v694;
              }
              else
              {
                memset(v760, 0, 24);
                v289 = [v724 objectForKeyedSubscript:@"start"];
                int64_t v290 = [v289 longLongValue];
                v291 = [v724 objectForKeyedSubscript:@"startScale"];
                CMTimeMake((CMTime *)v760, v290, [v291 intValue]);

                memset(v759, 0, 24);
                v292 = [v724 objectForKeyedSubscript:@"end"];
                int64_t v293 = [v292 longLongValue];
                v294 = [v724 objectForKeyedSubscript:@"endScale"];
                CMTimeMake((CMTime *)v759, v293, [v294 intValue]);

                CMTime v764 = *(CMTime *)v760;
                CMTime v763 = *(CMTime *)v759;
                v288 = [v751 trimInput:v694 startTime:&v764 endTime:&v763 error:a6];

                if (a6 && *a6) {
                  goto LABEL_353;
                }
              }
              v694 = [v751 addTagWithName:@"Trim" inputNode:v288 error:a6];

              if (a6 && *a6) {
                goto LABEL_329;
              }
              v288 = [v751 addTagWithName:@"pre-SloMo" inputNode:v694 error:a6];

              if (a6 && *a6)
              {
LABEL_353:
                v99 = 0;
                v694 = v288;
                goto LABEL_330;
              }
              v688 = [v750 objectForKeyedSubscript:@"slomo"];
              if (v688)
              {
                memset(v760, 0, 24);
                v296 = [v688 objectForKeyedSubscript:@"start"];
                int64_t v297 = [v296 longLongValue];
                v298 = [v688 objectForKeyedSubscript:@"startScale"];
                CMTimeMake((CMTime *)v760, v297, [v298 intValue]);

                memset(v759, 0, 24);
                v299 = [v688 objectForKeyedSubscript:@"end"];
                int64_t v300 = [v299 longLongValue];
                v301 = [v688 objectForKeyedSubscript:@"endScale"];
                CMTimeMake((CMTime *)v759, v300, [v301 intValue]);

                if (((v286 | [v724 isEnabled] ^ 1) & 1) == 0)
                {
                  memset(&v764, 0, sizeof(v764));
                  v302 = [v724 objectForKeyedSubscript:@"start"];
                  int64_t v303 = [v302 longLongValue];
                  v304 = [v724 objectForKeyedSubscript:@"startScale"];
                  CMTimeMake(&v764, v303, [v304 intValue]);

                  CMTime lhs = *(CMTime *)v760;
                  CMTime rhs = v764;
                  CMTimeSubtract(&v763, &lhs, &rhs);
                  *(CMTime *)v760 = v763;
                  CMTime lhs = *(CMTime *)v759;
                  CMTime rhs = v764;
                  CMTimeSubtract(&v763, &lhs, &rhs);
                  *(CMTime *)v759 = v763;
                }
                v305 = [v688 objectForKeyedSubscript:@"rate"];
                [v305 floatValue];
                unsigned int v307 = v306;

                CMTime v764 = *(CMTime *)v760;
                CMTime v763 = *(CMTime *)v759;
                objc_msgSend(v751, "createSloMoWithInput:startTime:endTime:rate:error:", v288, &v764, &v763, a6, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v759[4], v307)));
                v694 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

                if (a6 && *a6) {
                  goto LABEL_377;
                }
              }
              else
              {
                v694 = v288;
              }
              v308 = v694;
              v694 = [v751 addTagWithName:@"SloMo" inputNode:v694 error:a6];

              if (a6 && *a6) {
                goto LABEL_377;
              }
              if (v738)
              {
                v309 = [v750 objectForKeyedSubscript:@"semanticEnhance"];
                if ([v309 isEnabled])
                {
                  v310 = v694;
                  v311 = [v309 objectForKeyedSubscript:@"sceneLabel"];
                  v312 = (void *)MEMORY[0x1E4F1CA60];
                  v694 = v310;
                  v775[0] = @"inputImage";
                  v775[1] = @"inputConfidence";
                  v776[0] = v310;
                  v313 = [v309 objectForKeyedSubscript:@"sceneConfidence"];
                  v776[1] = v313;
                  v314 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v776 forKeys:v775 count:2];
                  v315 = [v312 dictionaryWithDictionary:v314];

                  v316 = [v309 objectForKeyedSubscript:@"faceBoundingBoxes"];
                  [v315 setObject:v316 forKeyedSubscript:@"inputFaceBoxArray"];

                  if ([v311 isEqualToString:@"platedFood"])
                  {
                    v317 = [v309 objectForKeyedSubscript:@"boundingBoxes"];
                    [v315 setObject:v317 forKeyedSubscript:@"inputBoundingBoxArray"];

                    v318 = @"CIDynamicFood";
                  }
                  else
                  {
                    if (([v311 isEqualToString:@"sunsetOrSunrise"] & 1) == 0
                      && ([v311 isEqualToString:@"genericLandscape"] & 1) == 0)
                    {
                      if (a6)
                      {
                        *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Unknown sceneLabel when rendering semantic enhance adjustment" object:v309];
                      }

                      goto LABEL_377;
                    }
                    v318 = @"CIDynamicRender";
                  }
                  v319 = [v751 nodeByApplyingFilterWithName:v318 useHDRFilter:v703 settingsAndInputs:v315];

                  v320 = [v309 objectForKeyedSubscript:@"intensity"];

                  if (v320)
                  {
                    v321 = [v309 objectForKeyedSubscript:@"intensity"];
                    v322 = NUMakeDictionary4();
                    uint64_t v323 = [v751 nodeByApplyingFilterWithName:@"CIDissolveTransition" useHDRFilter:v703 settingsAndInputs:v322];

                    v319 = (PIDepthEffectNode *)v323;
                  }

                  v694 = v319;
                }
              }
              v324 = v694;
              v694 = [v751 addTagWithName:@"pre-SmartTone" inputNode:v694 error:a6];

              if (a6)
              {
                if (*a6)
                {
LABEL_377:
                  v99 = 0;
LABEL_594:

                  goto LABEL_330;
                }
              }
              v675 = [v750 objectForKeyedSubscript:@"smartTone"];
              if ([v675 isEnabled])
              {
                v325 = [v675 objectForKeyedSubscript:@"inputShadows"];
                [v325 doubleValue];
                double v327 = v326;
                v328 = [v675 objectForKeyedSubscript:@"offsetShadows"];
                [v328 doubleValue];
                double v330 = v327 + v329;

                if (v738)
                {
                  v331 = [v675 objectForKeyedSubscript:@"statistics"];
                  v332 = v331;
                  if (v331)
                  {
                    v333 = [v331 objectForKeyedSubscript:@"lightMap"];

                    if (v333)
                    {
                      v731 = [v332 objectForKeyedSubscript:@"lightMap"];
                      double v334 = fmax(v330, 0.0);
                      if ([v751 isCIFilterAvailable:@"CILocalLightMapPrepare" propertyName:0])
                      {
                        v335 = NUMakeDictionary3();
                        v336 = [v751 nodeByApplyingFilterWithName:@"CILocalLightMapPrepare" useHDRFilter:v703 settingsAndInputs:v335];

                        v337 = NSNumber;
                        v726 = [v675 objectForKeyedSubscript:@"inputLocalLight"];
                        [v726 doubleValue];
                        double v339 = v338;
                        v340 = [v675 objectForKeyedSubscript:@"offsetLocalLight"];
                        [v340 doubleValue];
                        uint64_t v342 = [v337 numberWithDouble:v339 + v341];
                        v343 = [NSNumber numberWithDouble:v334];
                        v344 = (void *)v342;
                        v345 = NUMakeDictionary5();
                        uint64_t v346 = objc_msgSend(v751, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", @"CILocalLightFilter", v703, v345, @"__dominantInputSettingsKey", @"inputImage");
                      }
                      else
                      {
                        v347 = NSNumber;
                        v336 = [v675 objectForKeyedSubscript:@"inputLocalLight"];
                        [v336 doubleValue];
                        double v349 = v348;
                        v726 = [v675 objectForKeyedSubscript:@"offsetLocalLight"];
                        [v726 doubleValue];
                        uint64_t v351 = [v347 numberWithDouble:v349 + v350];
                        [NSNumber numberWithDouble:v334];
                        v344 = v340 = (void *)v351;
                        v343 = NUMakeDictionary6();
                        uint64_t v346 = objc_msgSend(v751, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", @"CILocalLightFilter", v703, v343, @"inputGuideImage", v699, @"__dominantInputSettingsKey", @"inputImage");
                      }
                      v694 = (PIDepthEffectNode *)v346;
                    }
                  }
                }
                v352 = [v675 objectForKeyedSubscript:@"inputExposure"];
                [v352 doubleValue];
                double v354 = v353;
                v355 = [v675 objectForKeyedSubscript:@"offsetExposure"];
                [v355 doubleValue];
                double v357 = v354 + v356;

                v358 = [v675 objectForKeyedSubscript:@"inputContrast"];
                [v358 doubleValue];
                double v360 = v359;
                v361 = [v675 objectForKeyedSubscript:@"offsetContrast"];
                [v361 doubleValue];
                double v363 = v360 + v362;

                v364 = [v675 objectForKeyedSubscript:@"inputBrightness"];
                [v364 doubleValue];
                double v366 = v365;
                v367 = [v675 objectForKeyedSubscript:@"offsetBrightness"];
                [v367 doubleValue];
                double v369 = v366 + v368;

                v370 = [v675 objectForKeyedSubscript:@"inputHighlights"];
                [v370 doubleValue];
                double v372 = v371;
                v373 = [v675 objectForKeyedSubscript:@"offsetHighlights"];
                [v373 doubleValue];
                double v375 = v372 + v374;

                v376 = [v675 objectForKeyedSubscript:@"inputBlack"];
                [v376 doubleValue];
                double v378 = v377;
                v379 = [v675 objectForKeyedSubscript:@"offsetBlack"];
                [v379 doubleValue];
                double v381 = v378 + v380;

                v382 = [NSNumber numberWithDouble:v369];
                v383 = NUMakeDictionary2();
                v384 = [v751 nodeByApplyingFilterWithName:@"CIHighKey" useHDRFilter:v703 settingsAndInputs:v383];

                double v385 = fmin(v330, 0.0);
                if (v738) {
                  double v386 = v385;
                }
                else {
                  double v386 = v330;
                }
                v387 = [NSNumber numberWithDouble:v357];
                v388 = [NSNumber numberWithDouble:v363];
                v389 = [NSNumber numberWithDouble:v386];
                v390 = [NSNumber numberWithDouble:v375];
                v391 = [NSNumber numberWithDouble:v381];
                v392 = [v675 objectForKeyedSubscript:@"inputRawHighlights"];
                v393 = NUMakeDictionary7();
                objc_msgSend(v751, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", @"CISmartToneFilter", v703, v393, @"inputHighlights", v390, @"inputBlack", v391, @"inputRawHighlights", v392);
                v694 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();
              }
              v674 = [v750 objectForKeyedSubscript:@"smartColor"];
              if ([v674 isEnabled])
              {
                v394 = NSNumber;
                v739 = [v674 objectForKeyedSubscript:@"inputCast"];
                [v739 doubleValue];
                double v396 = v395;
                v732 = [v674 objectForKeyedSubscript:@"offsetCast"];
                [v732 doubleValue];
                v398 = [v394 numberWithDouble:v396 + v397];
                v399 = NSNumber;
                v400 = [v674 objectForKeyedSubscript:@"inputSaturation"];
                [v400 doubleValue];
                double v402 = v401;
                v403 = [v674 objectForKeyedSubscript:@"offsetSaturation"];
                [v403 doubleValue];
                v405 = [v399 numberWithDouble:v402 + v404];
                v406 = NUMakeDictionary3();
                v407 = [v751 nodeByApplyingFilterWithName:@"CISmartColorFilter" useHDRFilter:v703 settingsAndInputs:v406];

                v408 = NSNumber;
                v409 = [v674 objectForKeyedSubscript:@"inputContrast"];
                [v409 doubleValue];
                double v411 = v410;
                v412 = [v674 objectForKeyedSubscript:@"offsetContrast"];
                [v412 doubleValue];
                v414 = [v408 numberWithDouble:v411 + v413];
                v415 = NUMakeDictionary2();
                v694 = [v751 nodeByApplyingFilterWithName:@"CIVibrance" useHDRFilter:v703 settingsAndInputs:v415];
              }
              v676 = [v751 addTagWithName:@"pre-Curves" inputNode:v694 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
LABEL_593:

                v694 = v676;
                goto LABEL_594;
              }
              v672 = [v750 objectForKeyedSubscript:@"curves"];
              if ([v672 isEnabled])
              {
                v416 = [v672 objectForKeyedSubscript:@"pointsR"];
                v417 = [v672 objectForKeyedSubscript:@"pointsG"];
                v418 = [v672 objectForKeyedSubscript:@"pointsB"];
                v419 = [v672 objectForKeyedSubscript:@"pointsL"];
                v420 = NUMakeDictionary4();

                v421 = [v751 nodeByApplyingFilterWithName:@"PICurvesLUTFilter" useHDRFilter:v703 settingsAndInputs:v420];
                v422 = NUMakeDictionary3();
                uint64_t v423 = [v751 nodeByApplyingFilterWithName:@"PICurvesFilter" useHDRFilter:v703 settingsAndInputs:v422];

                v676 = (PIDepthEffectNode *)v423;
              }
              v673 = [v750 objectForKeyedSubscript:@"selectiveColor"];
              if ([v673 isEnabled])
              {
                v682 = [v673 objectForKeyedSubscript:@"corrections"];
                uint64_t v678 = [v682 count];
                if (v678)
                {
                  v680 = [MEMORY[0x1E4F1CA48] array];
                  for (uint64_t i = 0; i != v678; ++i)
                  {
                    v425 = [v682 objectAtIndexedSubscript:i];
                    v733 = [v425 objectForKeyedSubscript:@"red"];
                    v727 = [v425 objectForKeyedSubscript:@"green"];
                    v426 = [v425 objectForKeyedSubscript:@"blue"];
                    v427 = [v425 objectForKeyedSubscript:@"spread"];
                    v428 = NSNumber;
                    v740 = [v425 objectForKeyedSubscript:@"hueShift"];
                    [v740 doubleValue];
                    v696 = [v428 numberWithDouble:v429 / 60.0];
                    v430 = NSNumber;
                    v721 = [v425 objectForKeyedSubscript:@"saturation"];
                    [v721 doubleValue];
                    v432 = [v430 numberWithDouble:v431 / 100.0];
                    v433 = NSNumber;
                    v434 = [v425 objectForKeyedSubscript:@"luminance"];
                    [v434 doubleValue];
                    v436 = [v433 numberWithDouble:v435 / 70.0];
                    v437 = NUMakeDictionary7();
                    objc_msgSend(v680, "addObject:", v437, @"hueShift", v696, @"saturation", v432, @"luminance", v436);
                  }
                  v438 = NUMakeDictionary2();
                  uint64_t v439 = [v751 nodeByApplyingFilterWithName:@"PISelectiveColorFilter" useHDRFilter:v703 settingsAndInputs:v438];

                  v676 = (PIDepthEffectNode *)v439;
                }
              }
              v440 = [v751 addTagWithName:@"pre-Levels" inputNode:v676 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
LABEL_592:

                v676 = v440;
                goto LABEL_593;
              }
              v741 = [v750 objectForKeyedSubscript:@"levels"];
              if ([v741 isEnabled])
              {
                v441 = [MEMORY[0x1E4F1CA60] dictionary];
                [v441 setObject:v440 forKeyedSubscript:@"inputImage"];
                v442 = [v741 objectForKeyedSubscript:@"colorSpace"];
                [v441 setObject:v442 forKeyedSubscript:@"inputColorSpace"];

                v443 = [v741 objectForKeyedSubscript:@"blackSrcRGB"];
                [v441 setObject:v443 forKeyedSubscript:@"inputBlackSrcRGB"];

                v444 = [v741 objectForKeyedSubscript:@"blackDstRGB"];
                [v441 setObject:v444 forKeyedSubscript:@"inputBlackDstRGB"];

                v445 = [v741 objectForKeyedSubscript:@"shadowSrcRGB"];
                [v441 setObject:v445 forKeyedSubscript:@"inputShadowSrcRGB"];

                v446 = [v741 objectForKeyedSubscript:@"shadowDstRGB"];
                [v441 setObject:v446 forKeyedSubscript:@"inputShadowDstRGB"];

                v447 = [v741 objectForKeyedSubscript:@"midSrcRGB"];
                [v441 setObject:v447 forKeyedSubscript:@"inputMidSrcRGB"];

                v448 = [v741 objectForKeyedSubscript:@"midDstRGB"];
                [v441 setObject:v448 forKeyedSubscript:@"inputMidDstRGB"];

                v449 = [v741 objectForKeyedSubscript:@"hilightSrcRGB"];
                [v441 setObject:v449 forKeyedSubscript:@"inputHilightSrcRGB"];

                v450 = [v741 objectForKeyedSubscript:@"hilightDstRGB"];
                [v441 setObject:v450 forKeyedSubscript:@"inputHilightDstRGB"];

                v451 = [v741 objectForKeyedSubscript:@"whiteSrcRGB"];
                [v441 setObject:v451 forKeyedSubscript:@"inputWhiteSrcRGB"];

                v452 = [v741 objectForKeyedSubscript:@"whiteDstRGB"];
                [v441 setObject:v452 forKeyedSubscript:@"inputWhiteDstRGB"];

                v453 = [v741 objectForKeyedSubscript:@"blackSrcRed"];
                [v441 setObject:v453 forKeyedSubscript:@"inputBlackSrcRed"];

                v454 = [v741 objectForKeyedSubscript:@"blackDstRed"];
                [v441 setObject:v454 forKeyedSubscript:@"inputBlackDstRed"];

                v455 = [v741 objectForKeyedSubscript:@"shadowSrcRed"];
                [v441 setObject:v455 forKeyedSubscript:@"inputShadowSrcRed"];

                v456 = [v741 objectForKeyedSubscript:@"shadowDstRed"];
                [v441 setObject:v456 forKeyedSubscript:@"inputShadowDstRed"];

                v457 = [v741 objectForKeyedSubscript:@"midSrcRed"];
                [v441 setObject:v457 forKeyedSubscript:@"inputMidSrcRed"];

                v458 = [v741 objectForKeyedSubscript:@"midDstRed"];
                [v441 setObject:v458 forKeyedSubscript:@"inputMidDstRed"];

                v459 = [v741 objectForKeyedSubscript:@"hilightSrcRed"];
                [v441 setObject:v459 forKeyedSubscript:@"inputHilightSrcRed"];

                v460 = [v741 objectForKeyedSubscript:@"hilightDstRed"];
                [v441 setObject:v460 forKeyedSubscript:@"inputHilightDstRed"];

                v461 = [v741 objectForKeyedSubscript:@"whiteSrcRed"];
                [v441 setObject:v461 forKeyedSubscript:@"inputWhiteSrcRed"];

                v462 = [v741 objectForKeyedSubscript:@"whiteDstRed"];
                [v441 setObject:v462 forKeyedSubscript:@"inputWhiteDstRed"];

                v463 = [v741 objectForKeyedSubscript:@"blackSrcGreen"];
                [v441 setObject:v463 forKeyedSubscript:@"inputBlackSrcGreen"];

                v464 = [v741 objectForKeyedSubscript:@"blackDstGreen"];
                [v441 setObject:v464 forKeyedSubscript:@"inputBlackDstGreen"];

                v465 = [v741 objectForKeyedSubscript:@"shadowSrcGreen"];
                [v441 setObject:v465 forKeyedSubscript:@"inputShadowSrcGreen"];

                v466 = [v741 objectForKeyedSubscript:@"shadowDstGreen"];
                [v441 setObject:v466 forKeyedSubscript:@"inputShadowDstGreen"];

                v467 = [v741 objectForKeyedSubscript:@"midSrcGreen"];
                [v441 setObject:v467 forKeyedSubscript:@"inputMidSrcGreen"];

                v468 = [v741 objectForKeyedSubscript:@"midDstGreen"];
                [v441 setObject:v468 forKeyedSubscript:@"inputMidDstGreen"];

                v469 = [v741 objectForKeyedSubscript:@"hilightSrcGreen"];
                [v441 setObject:v469 forKeyedSubscript:@"inputHilightSrcGreen"];

                v470 = [v741 objectForKeyedSubscript:@"hilightDstGreen"];
                [v441 setObject:v470 forKeyedSubscript:@"inputHilightDstGreen"];

                v471 = [v741 objectForKeyedSubscript:@"whiteSrcGreen"];
                [v441 setObject:v471 forKeyedSubscript:@"inputWhiteSrcGreen"];

                v472 = [v741 objectForKeyedSubscript:@"whiteDstGreen"];
                [v441 setObject:v472 forKeyedSubscript:@"inputWhiteDstGreen"];

                v473 = [v741 objectForKeyedSubscript:@"blackSrcBlue"];
                [v441 setObject:v473 forKeyedSubscript:@"inputBlackSrcBlue"];

                v474 = [v741 objectForKeyedSubscript:@"blackDstBlue"];
                [v441 setObject:v474 forKeyedSubscript:@"inputBlackDstBlue"];

                v475 = [v741 objectForKeyedSubscript:@"shadowSrcBlue"];
                [v441 setObject:v475 forKeyedSubscript:@"inputShadowSrcBlue"];

                v476 = [v741 objectForKeyedSubscript:@"shadowDstBlue"];
                [v441 setObject:v476 forKeyedSubscript:@"inputShadowDstBlue"];

                v477 = [v741 objectForKeyedSubscript:@"midSrcBlue"];
                [v441 setObject:v477 forKeyedSubscript:@"inputMidSrcBlue"];

                v478 = [v741 objectForKeyedSubscript:@"midDstBlue"];
                [v441 setObject:v478 forKeyedSubscript:@"inputMidDstBlue"];

                v479 = [v741 objectForKeyedSubscript:@"hilightSrcBlue"];
                [v441 setObject:v479 forKeyedSubscript:@"inputHilightSrcBlue"];

                v480 = [v741 objectForKeyedSubscript:@"hilightDstBlue"];
                [v441 setObject:v480 forKeyedSubscript:@"inputHilightDstBlue"];

                v481 = [v741 objectForKeyedSubscript:@"whiteSrcBlue"];
                [v441 setObject:v481 forKeyedSubscript:@"inputWhiteSrcBlue"];

                v482 = [v741 objectForKeyedSubscript:@"whiteDstBlue"];
                [v441 setObject:v482 forKeyedSubscript:@"inputWhiteDstBlue"];

                uint64_t v483 = [v751 nodeByApplyingFilterWithName:@"PILevelsFilter" useHDRFilter:v703 settingsAndInputs:v441];

                v440 = (PIDepthEffectNode *)v483;
              }
              v734 = [v750 objectForKeyedSubscript:@"smartBlackAndWhite"];
              if ([v734 isEnabled])
              {
                v484 = [v734 objectForKeyedSubscript:@"grain"];
                [v484 doubleValue];
                double v486 = v485;

                v487 = [v734 objectForKeyedSubscript:@"hue"];
                v488 = [v734 objectForKeyedSubscript:@"strength"];
                v489 = [v734 objectForKeyedSubscript:@"neutral"];
                v490 = [v734 objectForKeyedSubscript:@"tone"];
                v491 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v486];
                v492 = [MEMORY[0x1E4F7A620] grainInputSeedFromFrameTime];
                v493 = v440;
                v494 = NUMakeDictionary7();
                objc_msgSend(v751, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", @"CISmartBlackAndWhite", v703, v494, @"inputTone", v490, @"inputGrain", v491, @"inputSeed", v492);
                v440 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();
              }
              v728 = [v750 objectForKeyedSubscript:@"sharpen"];
              if ([v728 isEnabled])
              {
                v495 = [v728 objectForKeyedSubscript:@"falloff"];
                [v495 doubleValue];
                double v497 = v496;

                v498 = [v728 objectForKeyedSubscript:@"intensity"];
                [v498 doubleValue];
                double v500 = v499;

                v501 = v440;
                v502 = (void *)[objc_alloc(MEMORY[0x1E4F7A3E8]) initWithInput:v440];
                v503 = NSNumber;
                v504 = [v728 objectForKeyedSubscript:@"edges"];
                [v504 doubleValue];
                v506 = [v503 numberWithDouble:v505 * 5.5];
                v507 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v497];
                v508 = [MEMORY[0x1E4F7A620] sharpnessWithIntensity:v500];
                v509 = NUMakeDictionary4();
                v510 = [v751 nodeByApplyingFilterWithName:@"CIProSharpenEdges" useHDRFilter:v703 settingsAndInputs:v509];

                v511 = [(NURenderNode *)v510 outputImageGeometry:a6];
                v512 = v511;
                if (a6 && *a6)
                {
                  v99 = 0;
LABEL_591:

                  v440 = v510;
                  goto LABEL_592;
                }
                memset(v760, 0, sizeof(v760));
                if (v511) {
                  [v511 extent];
                }
                *(_OWORD *)v759 = *(_OWORD *)v760;
                *(_OWORD *)&v759[16] = *(_OWORD *)&v760[16];
                v440 = [v751 cropNode:v510 cropRect:v759 cropSettings:0];
              }
              v512 = [v750 objectForKeyedSubscript:@"definition"];
              if ([v512 isEnabled])
              {
                v513 = NSNumber;
                v514 = [v512 objectForKeyedSubscript:@"intensity"];
                [v514 doubleValue];
                v516 = [v513 numberWithDouble:v515 + v515];
                v517 = NUMakeDictionary2();
                v510 = [v751 nodeByApplyingFilterWithName:@"PILocalContrastHDR" useHDRFilter:v703 settingsAndInputs:v517];

                v518 = [(NURenderNode *)v510 outputImageGeometry:a6];
                v519 = v518;
                if (a6 && *a6)
                {
                  v99 = 0;
LABEL_590:

                  goto LABEL_591;
                }
                memset(v760, 0, sizeof(v760));
                if (v518) {
                  [v518 extent];
                }
                *(_OWORD *)v759 = *(_OWORD *)v760;
                *(_OWORD *)&v759[16] = *(_OWORD *)&v760[16];
                v440 = [v751 cropNode:v510 cropRect:v759 cropSettings:0];
              }
              v519 = [v750 objectForKeyedSubscript:@"effect"];
              if (v519)
              {
                v520 = v440;
                v521 = NSString;
                v522 = [v519 objectForKeyedSubscript:@"kind"];
                v523 = [v521 stringWithFormat:@"CIPhotoEffect%@", v522];

                v524 = [v519 objectForKeyedSubscript:@"version"];
                v525 = NUMakeDictionary2();
                v440 = [v751 nodeByApplyingFilterWithName:v523 useHDRFilter:v703 settingsAndInputs:v525];

                v526 = [v519 objectForKeyedSubscript:@"intensity"];

                if (v526)
                {
                  v527 = [v519 objectForKeyedSubscript:@"intensity"];
                  v528 = NUMakeDictionary4();
                  uint64_t v529 = [v751 nodeByApplyingFilterWithName:@"CIDissolveTransition" useHDRFilter:v703 settingsAndInputs:v528];

                  v440 = (PIDepthEffectNode *)v529;
                }
              }
              if (v685)
              {
                v530 = [MEMORY[0x1E4F1CA60] dictionary];
                v531 = [v690 objectForKeyedSubscript:@"kind"];
                [v530 setObject:v531 forKeyedSubscript:@"kind"];

                v532 = [v690 objectForKeyedSubscript:@"intensity"];
                [v530 setObject:v532 forKeyedSubscript:@"intensity"];

                v533 = [NSNumber numberWithBool:v703];
                [v530 setObject:v533 forKeyedSubscript:@"isHDR"];

                v534 = [[PIPhotoEffect3DNode alloc] initWithInput:v440 blurMap:v691 settings:v530];
                v440 = (PIDepthEffectNode *)v534;
              }
              v722 = [v750 objectForKeyedSubscript:@"grain"];
              if ([v722 isEnabled])
              {
                v535 = [v722 objectForKeyedSubscript:@"amount"];
                [v535 doubleValue];
                double v537 = v536;

                v538 = [v722 objectForKeyedSubscript:@"iso"];
                v539 = [v722 objectForKeyedSubscript:@"seed"];
                if (v539) {
                  [v722 objectForKeyedSubscript:@"seed"];
                }
                else {
                v540 = [MEMORY[0x1E4F7A620] grainInputSeedFromFrameTime];
                }
                v541 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v537];
                v542 = v440;
                v543 = NUMakeDictionary4();
                v440 = [v751 nodeByApplyingFilterWithName:@"CIPhotoGrain" useHDRFilter:v703 settingsAndInputs:v543];
              }
              v510 = [v751 addTagWithName:@"pre-VideoStabilize" inputNode:v440 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
LABEL_589:

                goto LABEL_590;
              }
              v697 = [v750 objectForKeyedSubscript:@"videoStabilize"];
              if (v697 && [v697 isEnabled])
              {
                v544 = [v751 videoReframe:v510 reframes:v697 error:a6];

                if (a6 && *a6) {
                  goto LABEL_449;
                }
                v510 = v544;
              }
              v544 = [v751 addTagWithName:@"VideoStabilize" inputNode:v510 error:a6];

              if (a6 && *a6)
              {
LABEL_449:
                v99 = 0;
LABEL_588:

                v510 = v544;
                goto LABEL_589;
              }
              v545 = [v751 addTagWithName:@"pre-VideoCrossfadeLoop" inputNode:v544 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v544 = v545;
                goto LABEL_588;
              }
              v686 = [v750 objectForKeyedSubscript:@"videoCrossfadeLoop"];
              if (v686 && [v686 isEnabled])
              {
                v544 = [v751 videoCrossfadeLoop:v545 crossfadeAdjustment:v686 error:a6];

                if (a6 && *a6) {
                  goto LABEL_465;
                }
                v545 = v544;
              }
              v544 = [v751 addTagWithName:@"VideoCrossfadeLoop" inputNode:v545 error:a6];

              if (a6 && *a6) {
                goto LABEL_465;
              }
              v546 = [v751 addTagWithName:@"pre-Geometry" inputNode:v544 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v544 = v546;
LABEL_587:

                goto LABEL_588;
              }
              v544 = [v751 addTagWithName:@"pre-Crop" inputNode:v546 error:a6];

              if (a6)
              {
                if (*a6)
                {
LABEL_465:
                  v99 = 0;
                  goto LABEL_587;
                }
              }
              v681 = [v750 objectForKeyedSubscript:@"cropStraighten"];
              if ([v681 isEnabled])
              {
                v679 = [(NURenderNode *)v544 outputImageGeometry:a6];
                if (a6 && *a6) {
                  goto LABEL_514;
                }
                v547 = [v681 objectForKeyedSubscript:@"pitch"];
                [v547 doubleValue];
                double v549 = v548;

                v550 = [v681 objectForKeyedSubscript:@"yaw"];
                [v550 doubleValue];
                double v552 = v551;

                v553 = [v681 objectForKeyedSubscript:@"angle"];
                [v553 doubleValue];
                double v555 = v554;

                if (v549 == 0.0 && v552 == 0.0)
                {
                  if (v679) {
                    [v679 extent];
                  }
                  else {
                    memset(v758, 0, 32);
                  }
                  uint64_t v556 = [v751 straightenTransformWithAngle:v758 extent:v555];
                }
                else
                {
                  if (v679) {
                    [v679 extent];
                  }
                  else {
                    memset(&v758[2], 0, 32);
                  }
                  NUPixelRectToCGRect();
                  uint64_t v556 = objc_msgSend(v751, "perspectiveTransformWithPitch:yaw:roll:imageRect:", v549, v552, v555, v557, v558, v559, v560);
                }
                v677 = (void *)v556;
                v561 = [MEMORY[0x1E4F7A6C8] transformNodeWithInput:v544 transform:v556 error:a6];

                if (a6 && *a6)
                {
                  v99 = 0;
LABEL_584:

                  v544 = v561;
                  goto LABEL_585;
                }
                v671 = [v751 addTagWithName:@"perspectiveStraighten" inputNode:v561 error:a6];

                if (a6 && *a6)
                {
                  v99 = 0;
LABEL_583:
                  v561 = (PIDepthEffectNode *)v671;
                  goto LABEL_584;
                }
                v683 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F000B020];
                if (v716)
                {
                  v562 = [(NURenderNode *)v671 videoProperties:a6];
                  v563 = v562;
                  if (a6 && *a6)
                  {

LABEL_581:
                    v99 = 0;
LABEL_582:

                    goto LABEL_583;
                  }
                  if (v562)
                  {
                    memset(v760, 0, sizeof(v760));
                    [v562 originalCleanAperture];
                    v564 = [MEMORY[0x1E4F29238] valueWithBytes:v760 objCType:"{?={?=qq}{?=qq}}"];
                    [v683 setObject:v564 forKeyedSubscript:@"projectUsingCleanAperture"];

                    *(_OWORD *)v759 = 0uLL;
                    *(void *)v759 = [v563 originalSize];
                    *(void *)&v759[8] = v565;
                    v566 = [MEMORY[0x1E4F29238] valueWithBytes:v759 objCType:"{?=qq}"];
                    [v683 setObject:v566 forKeyedSubscript:@"projectUsingOriginalSize"];

                    long long v756 = 0u;
                    long long v757 = 0u;
                    long long v754 = 0u;
                    long long v755 = 0u;
                    v567 = [v563 metadata];
                    uint64_t v568 = [v567 countByEnumeratingWithState:&v754 objects:v774 count:16];
                    if (v568)
                    {
                      uint64_t v569 = v568;
                      uint64_t v570 = *(void *)v755;
                      do
                      {
                        for (uint64_t j = 0; j != v569; ++j)
                        {
                          if (*(void *)v755 != v570) {
                            objc_enumerationMutation(v567);
                          }
                          v572 = [*(id *)(*((void *)&v754 + 1) + 8 * j) key];
                          int v573 = [v572 isEqual:@"com.apple.quicktime.live-photo.vitality-disabled"];

                          if (v573) {
                            [v683 setObject:&unk_1F000A798 forKeyedSubscript:@"projectUsingEstimatedCleanAperture"];
                          }
                        }
                        uint64_t v569 = [v567 countByEnumeratingWithState:&v754 objects:v774 count:16];
                      }
                      while (v569);
                    }
                  }
                }
                v574 = [v681 objectForKeyedSubscript:@"xOrigin"];
                uint64_t v575 = [v574 integerValue];
                v576 = [v681 objectForKeyedSubscript:@"yOrigin"];
                uint64_t v577 = [v576 integerValue];
                v578 = [v681 objectForKeyedSubscript:@"width"];
                uint64_t v579 = [v578 integerValue];
                v580 = [v681 objectForKeyedSubscript:@"height"];
                uint64_t v581 = [v580 integerValue];

                *(void *)v760 = v575;
                *(void *)&v760[8] = v577;
                *(void *)&v760[16] = v579;
                *(void *)&v760[24] = v581;
                v544 = [v751 cropNode:v671 cropRect:v760 cropSettings:v683];
              }
              v582 = v544;
              v544 = [v751 addTagWithName:@"Crop" inputNode:v544 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
LABEL_586:

                goto LABEL_587;
              }
              v583 = [v751 addTagWithName:@"pre-Orientation" inputNode:v544 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v544 = v583;
                goto LABEL_586;
              }
              v679 = [v750 objectForKeyedSubscript:@"orientation"];
              if (v679)
              {
                v584 = [v679 objectForKeyedSubscript:@"value"];
                uint64_t v585 = [v584 integerValue];

                v544 = [v751 orientedNode:v583 withOrientation:v585];

                if (a6 && *a6) {
                  goto LABEL_514;
                }
                v583 = v544;
              }
              v544 = [v751 addTagWithName:@"Orientation" inputNode:v583 error:a6];

              if (a6 && *a6)
              {
LABEL_514:
                v99 = 0;
LABEL_585:

                goto LABEL_586;
              }
              v586 = [v751 addTagWithName:@"post-Geometry" inputNode:v544 error:a6];

              if (a6 && *a6)
              {
                v99 = 0;
                v544 = (PIDepthEffectNode *)v586;
                goto LABEL_585;
              }
              v677 = [v750 objectForKeyedSubscript:@"cinematicAudio"];
              if (_os_feature_enabled_impl()
                && [v677 isEnabled]
                && ([v737 isEnabled] & 1) == 0)
              {
                uint64_t v590 = [v677 objectForKeyedSubscript:@"dialogMixBias"];
                v591 = (void *)v590;
                v592 = &unk_1F000A7A8;
                if (v590) {
                  v592 = (void *)v590;
                }
                id v593 = v592;

                uint64_t v594 = [v677 objectForKeyedSubscript:@"renderingStyle"];
                v595 = (void *)v594;
                v596 = @"original";
                if (v594) {
                  v596 = (__CFString *)v594;
                }
                v597 = v596;

                v598 = [PICinematicAudioRenderNode alloc];
                v683 = v593;
                [v593 doubleValue];
                v671 = -[PICinematicAudioRenderNode initWithInput:dialogMixBias:renderingStyle:](v598, "initWithInput:dialogMixBias:renderingStyle:", v586, v597);

                if (a6 && *a6)
                {

                  goto LABEL_581;
                }
              }
              else
              {
                v671 = v586;
              }
              v683 = [v750 objectForKeyedSubscript:@"vignette"];
              if ([v683 isEnabled])
              {
                v587 = [(NURenderNode *)v671 outputImageGeometry:a6];
                v588 = v587;
                if (a6 && *a6) {
                  goto LABEL_580;
                }
                if (v587)
                {
                  [v587 extent];
                  uint64_t v589 = v753;
                }
                else
                {
                  uint64_t v589 = 0;
                }
                double v599 = (double)v589;
                double v600 = (double)[v588 size];
                if (v588)
                {
                  [v588 extent];
                  uint64_t v601 = v752;
                }
                else
                {
                  uint64_t v601 = 0;
                }
                double v602 = v599 + v600 * 0.5;
                double v603 = (double)v601;
                [v588 size];
                double v605 = v603 + (double)v604 * 0.5;
                v606 = [v683 objectForKeyedSubscript:@"falloff"];
                [v606 doubleValue];
                double v608 = v607;

                v609 = [v683 objectForKeyedSubscript:@"intensity"];
                [v609 doubleValue];
                long double v611 = v610;

                v612 = [v683 objectForKeyedSubscript:@"radius"];
                [v612 doubleValue];
                double v614 = 1.0 - v613;

                if (v611 >= 0.0)
                {
                  double v615 = pow(v611, 0.6);
                  double v616 = (v614 + -0.5) * 0.3 + 0.5;
                }
                else
                {
                  double v615 = -pow(-v611, 0.6);
                  double v616 = (v614 + -0.5) * 0.4 + 0.7;
                }
                [v588 size];
                double v618 = (double)v617;
                double v619 = (double)[v588 size];
                if (v618 >= v619) {
                  double v619 = v618;
                }
                double v620 = v616 * v619;
                v621 = (void *)MEMORY[0x1E4F7A620];
                v622 = [NSNumber numberWithDouble:v602];
                v773[0] = v622;
                v717 = [NSNumber numberWithDouble:v605];
                v773[1] = v717;
                v670 = [MEMORY[0x1E4F1C978] arrayWithObjects:v773 count:2];
                v623 = [v621 scaledVector:v670];
                v624 = [NSNumber numberWithDouble:v615];
                v625 = [MEMORY[0x1E4F7A620] scaleMultiplyOfScalar:v620];
                v626 = [NSNumber numberWithDouble:v608];
                v627 = NUMakeDictionary5();
                uint64_t v669 = objc_msgSend(v751, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", @"CIVignetteEffect", v703, v627, @"inputFalloff", v626);

                v671 = (PICinematicAudioRenderNode *)v669;
              }
              v628 = v671;
              v671 = [v751 addTagWithName:@"post-Adjustments" inputNode:v671 error:a6];

              if (a6 && *a6) {
                goto LABEL_581;
              }
              if (v719)
              {
                v629 = [v714 objectForKeyedSubscript:@"raw_applyFirst"];
                if ([v629 BOOLValue])
                {
LABEL_550:

                  goto LABEL_551;
                }
                v630 = +[PIGlobalSettings globalSettings];
                char v631 = [v630 rawApplyBoostFirst];

                if ((v631 & 1) == 0)
                {
                  v632 = [v745 objectForKeyedSubscript:@"boostAmount"];
                  v633 = [v745 objectForKeyedSubscript:@"boostVersion"];
                  v634 = [v745 objectForKeyedSubscript:@"boostParams"];
                  v635 = NUMakeDictionary4();
                  v629 = [v751 nodeByApplyingFilterWithName:@"PIInverseFakeBoost" useHDRFilter:v703 settingsAndInputs:v635];

                  [v751 resetTag:@"Master/RAW/Linear" input:v629];
                  v671 = v712;
                  goto LABEL_550;
                }
              }
LABEL_551:
              v636 = v671;
              if (v703)
              {
                [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
                if (v637 > 1.0)
                {
                  [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
                  v671 = [v751 HDROpticalScaleNode:v671 scale:1.0 / v638];

                  if (a6 && *a6) {
                    goto LABEL_581;
                  }
                  v636 = v671;
                }
              }
              v639 = [v714 objectForKeyedSubscript:@"outputExposure"];
              [v639 doubleValue];
              double v641 = v640;

              if (v641 != 0.0)
              {
                v642 = [v714 objectForKeyedSubscript:@"outputExposure"];
                v643 = NUMakeDictionary2();
                uint64_t v644 = [v751 nodeByApplyingFilterWithName:@"CIExposureAdjust" useHDRFilter:v703 settingsAndInputs:v643];

                v636 = (void *)v644;
              }
              v645 = [v714 objectForKeyedSubscript:@"headroomAdjust"];
              [v645 doubleValue];
              double v647 = v646;

              if (v647 != 0.0)
              {
                v648 = [v714 objectForKeyedSubscript:@"headroomAdjust"];
                [v648 floatValue];
                double v650 = v649;

                uint64_t v651 = [v751 gainMapHeadroomNode:v636 headroomOffset:v650];

                v636 = (void *)v651;
              }
              v652 = [v714 objectForKeyedSubscript:@"falseColorHDR"];
              [v652 doubleValue];
              if (v653 == 0.0)
              {
                v654 = +[PIGlobalSettings globalSettings];
                int v655 = [v654 falseColorHDR];

                if (!v655) {
                  goto LABEL_568;
                }
              }
              else
              {
              }
              v656 = [v714 objectForKeyedSubscript:@"falseColorHDR"];
              [v656 doubleValue];
              if (v657 == 0.0)
              {
                id v658 = &unk_1F000A788;
              }
              else
              {
                id v658 = [v714 objectForKeyedSubscript:@"falseColorHDR"];
              }
              v659 = NUMakeDictionary2();
              uint64_t v660 = [v751 debugNodeByApplyingFilterWithName:@"PIFalseColorHDRDebug" useHDRFilter:v703 settingsAndInputs:v659];

              v636 = (void *)v660;
LABEL_568:
              v671 = [v751 addTagWithName:@"Image" inputNode:v636 error:a6];

              if (a6 && *a6) {
                goto LABEL_581;
              }
              v661 = [v714 objectForKeyedSubscript:@"useStyleEngine"];
              if ([v661 BOOLValue])
              {
              }
              else
              {
                v662 = +[PIGlobalSettings globalSettings];
                int v663 = [v662 debugUseStyleEngine];

                if (!v663) {
                  goto LABEL_596;
                }
              }
              v588 = [v751 getTagWithPath:@"masterSpace" error:a6];
              if (a6)
              {
                if (*a6)
                {
                  v664 = 0;
LABEL_579:

LABEL_580:
                  goto LABEL_581;
                }
                v664 = [v751 getTagWithPath:@"pre-Geometry" error:a6];
                if (*a6) {
                  goto LABEL_579;
                }
              }
              else
              {
                v664 = [v751 getTagWithPath:@"pre-Geometry" error:0];
              }
              v665 = (void *)MEMORY[0x1E4F7A628];
              v666 = [v664 inputs];
              v667 = [v666 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];
              v668 = [v665 styleTransferNodeWithInput:v588 target:v667 settings:MEMORY[0x1E4F1CC08]];

              [v751 resetTag:@"pre-Geometry" input:v668];
LABEL_596:
              v99 = v671;
              v671 = v99;
              goto LABEL_582;
            }
            v252 = [MEMORY[0x1E4F1CA60] dictionary];
            v253 = [v34 objectForKeyedSubscript:@"colorType"];
            int v254 = [v253 isEqualToString:@"warmTint"];

            if (v254)
            {
              [v252 setObject:v694 forKeyedSubscript:@"inputImage"];
              v255 = [v34 objectForKeyedSubscript:@"warmTemp"];
              [v252 setObject:v255 forKeyedSubscript:@"inputWarmTemp"];

              v256 = [v34 objectForKeyedSubscript:@"warmTint"];
              [v252 setObject:v256 forKeyedSubscript:@"inputWarmTint"];

              v257 = [v34 objectForKeyedSubscript:@"warmFace"];
              [v252 setObject:v257 forKeyedSubscript:@"inputHasFace"];

              v258 = [NSNumber numberWithInt:v719 != 0];
              [v252 setObject:v258 forKeyedSubscript:@"inputIsRaw"];
              v259 = @"PIColorBalanceFilter";
            }
            else
            {
              v260 = [v34 objectForKeyedSubscript:@"colorType"];
              int v261 = [v260 isEqualToString:@"tempTint"];

              if (!v261 || v719)
              {
                v263 = [v711 objectForKeyedSubscript:@"colorType"];
                int v264 = [v263 isEqualToString:@"faceBalance"];

                if (v264)
                {
                  v258 = [v711 objectForKeyedSubscript:@"faceI"];
                  v265 = [v711 objectForKeyedSubscript:@"faceQ"];
                  if (!v258 || [v258 isEqualToNumber:&unk_1F0009CC8])
                  {

                    v258 = &unk_1F000F0F8;
                  }
                  if (!v265 || [v265 isEqualToNumber:&unk_1F0009CC8])
                  {

                    v265 = &unk_1F000F108;
                  }
                  [v252 setObject:v694 forKeyedSubscript:@"inputImage"];
                  [v252 setObject:v258 forKeyedSubscript:@"inputOrigI"];
                  [v252 setObject:v265 forKeyedSubscript:@"inputOrigQ"];
                  v266 = [v711 objectForKeyedSubscript:@"faceStrength"];
                  [v252 setObject:v266 forKeyedSubscript:@"inputStrength"];

                  v267 = [v711 objectForKeyedSubscript:@"faceWarmth"];
                  [v252 setObject:v267 forKeyedSubscript:@"inputWarmth"];

                  if (v719) {
                    v259 = @"PIRAWFaceBalance";
                  }
                  else {
                    v259 = @"CIFaceBalance";
                  }
                }
                else
                {
                  v268 = [v711 objectForKeyedSubscript:@"colorType"];
                  int v269 = [v268 isEqualToString:@"neutralGray"];

                  if (!v269)
                  {
                    id v41 = v709;
                    v34 = v711;
                    v42 = v724;
                    v126 = v699;
LABEL_298:

                    v192 = a6;
                    goto LABEL_299;
                  }
                  [v252 setObject:v694 forKeyedSubscript:@"inputImage"];
                  [v252 setObject:&unk_1F000A788 forKeyedSubscript:@"strength"];
                  v270 = [v711 objectForKeyedSubscript:@"grayWarmth"];
                  [v252 setObject:v270 forKeyedSubscript:@"warmth"];

                  v271 = [v711 objectForKeyedSubscript:@"grayY"];
                  [v252 setObject:v271 forKeyedSubscript:@"y"];

                  v272 = [v711 objectForKeyedSubscript:@"grayI"];
                  [v252 setObject:v272 forKeyedSubscript:@"i"];

                  v258 = [v711 objectForKeyedSubscript:@"grayQ"];
                  [v252 setObject:v258 forKeyedSubscript:@"q"];
                  v259 = @"PINeutralGrayWhiteBalanceFilter";
                }
                v42 = v724;
                v126 = v699;
              }
              else
              {
                [v252 setObject:v694 forKeyedSubscript:@"inputImage"];
                v262 = [v711 objectForKeyedSubscript:@"temperature"];
                [v252 setObject:v262 forKeyedSubscript:@"temperature"];

                v258 = [v711 objectForKeyedSubscript:@"tint"];
                [v252 setObject:v258 forKeyedSubscript:@"tint"];
                v259 = @"PITempTintFilter";
              }
            }

            id v41 = v709;
            if (v252)
            {
              uint64_t v273 = [v751 nodeByApplyingFilterWithName:v259 useHDRFilter:v703 settingsAndInputs:v252];

              v694 = (PIDepthEffectNode *)v273;
            }
            v34 = v711;
            goto LABEL_298;
          }
          id v218 = objc_alloc(MEMORY[0x1E4F7A5C0]);
          v219 = (void *)MEMORY[0x1E4F29238];
          id v695 = v218;
          if (v744)
          {
            [v744 time];
            if ((v766 & 0x100000000) != 0)
            {
              [v744 time];
LABEL_243:
              v221 = [v219 valueWithCMTime:&v768];
              v222 = NUMakeDictionary2();
              v223 = NUMakeDictionary1();
              uint64_t v224 = [v695 initWithSettings:v222 inputs:v223];

              v205 = (PIDepthEffectNode *)v224;
              v220 = v689;
              v208 = v684;
              goto LABEL_244;
            }
          }
          else
          {
            uint64_t v766 = 0;
            uint64_t v765 = 0;
            uint64_t v767 = 0;
          }
          uint64_t v768 = v783;
          unsigned int v769 = v784;
          unsigned int v770 = v735;
          uint64_t v771 = v730;
          goto LABEL_243;
        }
        [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
        objc_msgSend(v751, "HDROpticalScaleNode:scale:", v105);
        v154 = v151;
        v131 = (PIDepthEffectNode *)objc_claimAutoreleasedReturnValue();

        if (!v154 || !*v154)
        {
          v105 = v131;
          v151 = v154;
          goto LABEL_169;
        }
LABEL_126:
        v99 = 0;
LABEL_341:

        v105 = v131;
        goto LABEL_342;
      }
      v719 = 0;
    }
    [v751 endGroupWithName:@"Master" error:0];
    v106 = [(NURenderNode *)v105 imageProperties:0];
    goto LABEL_92;
  }
  v99 = 0;
LABEL_347:

  v95 = v729;
LABEL_348:

  return v99;
}

__CFString *__61__PIModernPhotosPipeline_evaluate_input_pipelineState_error___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 auxiliaryImageType] == 1) {
    v2 = @"retouchedImage";
  }
  else {
    v2 = @"image";
  }
  return v2;
}

- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = NUAssertLogger_21879();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_21879();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v34 = dispatch_get_specific(*v18);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v18 = [v35 callStackSymbols];
        v37 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v34;
        __int16 v49 = 2114;
        v50 = v37;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v26 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  v13 = v12;
  if (!v12)
  {
    v23 = NUAssertLogger_21879();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineState != nil");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_21879();
    int v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v18 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v18;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v31 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v26)
    {
      v38 = dispatch_get_specific(*v18);
      v39 = (void *)MEMORY[0x1E4F29060];
      id v40 = v38;
      v18 = [v39 callStackSymbols];
      id v41 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v38;
      __int16 v49 = 2114;
      v50 = v41;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!a6)
  {
    v28 = NUAssertLogger_21879();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_21879();
    int v31 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v33;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v31)
    {
      v42 = dispatch_get_specific(*v18);
      unint64_t v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      uint64_t v45 = [v43 callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v42;
      __int16 v49 = 2114;
      v50 = v46;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  v14 = [(PIModernPhotosPipeline *)self evaluate:v10 input:v11 pipelineState:v12 error:a6];

  return v14;
}

@end