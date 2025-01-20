@interface CRFuthark
+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4;
+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4 withProgressHandler:(id)a5;
+ (id)detectAndRecognizeTextInImage:(id)a3 withMaxNumScales:(unint64_t)a4 options:(id)a5 withProgressHandler:(id)a6;
+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 options:(id)a5;
+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 withMaxNumScales:(unint64_t)a5 withThresholdingAlgorithm:(int64_t)a6 options:(id)a7 withProgressHandler:(id)a8;
@end

@implementation CRFuthark

+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
  int v8 = [v7 BOOLValue];

  v9 = [(id)objc_opt_class() runFutharkOnImage:v5 recognizeFeatures:v8 ^ 1u options:v6];

  return v9;
}

+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4 withProgressHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
  int v11 = [v10 BOOLValue];

  v12 = [(id)objc_opt_class() runFutharkOnImage:v7 recognizeFeatures:v11 ^ 1u withMaxNumScales:0 withThresholdingAlgorithm:4 options:v8 withProgressHandler:v9];

  return v12;
}

+ (id)detectAndRecognizeTextInImage:(id)a3 withMaxNumScales:(unint64_t)a4 options:(id)a5 withProgressHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 objectForKeyedSubscript:@"CRImageReaderDetectionOnly"];
  int v13 = [v12 BOOLValue];

  v14 = [(id)objc_opt_class() runFutharkOnImage:v9 recognizeFeatures:v13 ^ 1u withMaxNumScales:a4 withThresholdingAlgorithm:4 options:v10 withProgressHandler:v11];

  return v14;
}

+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [(id)objc_opt_class() runFutharkOnImage:v7 recognizeFeatures:v6 withMaxNumScales:0 withThresholdingAlgorithm:4 options:v8 withProgressHandler:0];

  return v9;
}

+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 withMaxNumScales:(unint64_t)a5 withThresholdingAlgorithm:(int64_t)a6 options:(id)a7 withProgressHandler:(id)a8
{
  BOOL v132 = a4;
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v128 = a7;
  v118 = (void (**)(double))a8;
  v123 = objc_msgSend(objc_alloc(MEMORY[0x1E4F62BA8]), "initWithDimensions:", 128.0, 128.0);
  [v123 setReturnSubFeatures:1];
  [v123 setMinimizeFalseDetections:1];
  unint64_t v12 = [v124 height];
  unint64_t v13 = [v124 width];
  if (v13 >= v12) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = v13;
  }
  int v15 = (int)((double)v14 * 0.005);
  if (v15 <= 5) {
    uint64_t v16 = 5;
  }
  else {
    uint64_t v16 = v15;
  }
  [v123 setMinimumCharacterHeight:v16];
  [v123 setDetectDiacritics:1];
  [v123 setThresholdingAlgorithm:a6];
  if (v132)
  {
    v17 = [v128 objectForKey:@"CRImageReaderDisableLanguageCorrection"];
    char v18 = [v17 BOOLValue];

    if ((v18 & 1) == 0)
    {
      v19 = (__CFString *)objc_opt_new();
      long long v159 = 0u;
      long long v160 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      v27 = +[CRImageReader languageSetFromOptionsDictionary:v128];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v157 objects:v167 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v158;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v158 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v157 + 1) + 8 * i)];
            v32 = [v31 languageCode];

            [(__CFString *)v19 addObject:v32];
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v157 objects:v167 count:16];
        }
        while (v28);
      }

      v20 = [(__CFString *)v19 array];
      [v123 setRecognitionLanguages:v20];
      goto LABEL_33;
    }
    v19 = [v128 objectForKey:@"CRImageReaderLanguageKey"];
    v20 = [MEMORY[0x1E4F1CA48] array];
    if (v19)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v22 = v19;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v113 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unrecognized language argument type when calling Futhark" userInfo:0];
              objc_exception_throw(v113);
            }
          }
        }
        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        v23 = v19;
        uint64_t v24 = [(__CFString *)v23 countByEnumeratingWithState:&v153 objects:v166 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v154;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v154 != v25) {
                objc_enumerationMutation(v23);
              }
              [v20 addObject:*(void *)(*((void *)&v153 + 1) + 8 * j)];
            }
            uint64_t v24 = [(__CFString *)v23 countByEnumeratingWithState:&v153 objects:v166 count:16];
          }
          while (v24);
        }

        goto LABEL_32;
      }
    }
    else
    {
      v22 = @"en";
    }
    [v20 addObject:v22];
LABEL_32:
    [v123 setRecognitionLanguages:v20];
LABEL_33:
  }
  if (a5) {
    [v123 setMergeSettings:a5 << 32];
  }
  v33 = [v124 imageByConvertingToColorSpace:0];

  v125 = v33;
  CVPixelBufferRef texture = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CVPixelBufferRef texture = (CVPixelBufferRef)[v33 pixelBuffer];
    CVPixelBufferRetain(texture);
  }
  else
  {
    size_t v34 = [v33 width];
    size_t v35 = [v125 height];
    if (v125)
    {
      [v125 vImage];
      v36 = *(void **)buf;
      [v125 vImage];
      size_t v37 = *((void *)&v151 + 1);
    }
    else
    {
      size_t v37 = 0;
      v36 = 0;
      *(_OWORD *)buf = 0u;
      long long v165 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
    }
    CVReturn v38 = CVPixelBufferCreateWithBytes(0, v34, v35, 0x4C303038u, v36, v37, 0, 0, 0, &texture);
    if (v38)
    {
      v39 = CROSLogForCategory(3);
      v117 = v39;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v38;
        _os_log_impl(&dword_1DD733000, v39, OS_LOG_TYPE_ERROR, "Unable to create pixel buffer for CRImage. Error: %d", buf, 8u);
      }
      v40 = 0;
      goto LABEL_52;
    }
  }
  if (v118) {
    v118[2](0.200000003);
  }
  v115 = [MEMORY[0x1E4F1C9C8] date];
  id v149 = 0;
  v116 = [v123 detectFeaturesInBuffer:texture error:&v149];
  v117 = v149;
  if (v117)
  {
    CVPixelBufferRelease(texture);
    v41 = CROSLogForCategory(3);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v117;
      _os_log_impl(&dword_1DD733000, v41, OS_LOG_TYPE_ERROR, "Error running Futhark: %@", buf, 0xCu);
    }
    v40 = 0;
  }
  else
  {
    uint64_t v114 = [MEMORY[0x1E4F1C9C8] date];
    CVPixelBufferRelease(texture);
    v122 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v116, "count"));
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    obuint64_t j = v116;
    uint64_t v121 = [obj countByEnumeratingWithState:&v145 objects:v163 count:16];
    if (v121)
    {
      uint64_t v120 = *(void *)v146;
      do
      {
        for (uint64_t k = 0; k != v121; ++k)
        {
          if (*(void *)v146 != v120) {
            objc_enumerationMutation(obj);
          }
          v43 = *(void **)(*((void *)&v145 + 1) + 8 * k);
          v127 = objc_alloc_init(CRTextFeature);
          [v43 boundingBox];
          -[CRTextFeature setBounds:](v127, "setBounds:");
          [(CRTextFeature *)v127 bounds];
          -[CRTextFeature setTopLeft:](v127, "setTopLeft:");
          [(CRTextFeature *)v127 bounds];
          double v45 = v44;
          [(CRTextFeature *)v127 bounds];
          double v47 = v46;
          [(CRTextFeature *)v127 bounds];
          -[CRTextFeature setBottomLeft:](v127, "setBottomLeft:", v45, v47 + v48);
          [(CRTextFeature *)v127 bounds];
          double v50 = v49;
          [(CRTextFeature *)v127 bounds];
          double v52 = v51;
          [(CRTextFeature *)v127 bounds];
          [(CRTextFeature *)v127 setTopRight:v50 + v52];
          [(CRTextFeature *)v127 bounds];
          double v54 = v53;
          [(CRTextFeature *)v127 bounds];
          double v56 = v55;
          [(CRTextFeature *)v127 bounds];
          double v58 = v57;
          [(CRTextFeature *)v127 bounds];
          -[CRTextFeature setBottomRight:](v127, "setBottomRight:", v54 + v56, v58 + v59);
          if (v132)
          {
            v60 = [v43 text];
            [(CRTextFeature *)v127 setStringValue:v60];
          }
          v61 = (void *)MEMORY[0x1E4F1CA48];
          v62 = [(CRTextFeature *)v127 subFeatures];
          v133 = objc_msgSend(v61, "arrayWithCapacity:", objc_msgSend(v62, "count"));

          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          id v129 = [v43 subFeatures];
          uint64_t v134 = [v129 countByEnumeratingWithState:&v141 objects:v162 count:16];
          if (v134)
          {
            uint64_t v131 = *(void *)v142;
            do
            {
              for (uint64_t m = 0; m != v134; ++m)
              {
                if (*(void *)v142 != v131) {
                  objc_enumerationMutation(v129);
                }
                v63 = *(void **)(*((void *)&v141 + 1) + 8 * m);
                v64 = objc_alloc_init(CRTextFeature);
                [v63 boundingBox];
                -[CRTextFeature setBounds:](v64, "setBounds:");
                [(CRTextFeature *)v64 bounds];
                -[CRTextFeature setTopLeft:](v64, "setTopLeft:");
                [(CRTextFeature *)v64 bounds];
                double v66 = v65;
                [(CRTextFeature *)v64 bounds];
                double v68 = v67;
                [(CRTextFeature *)v64 bounds];
                -[CRTextFeature setBottomLeft:](v64, "setBottomLeft:", v66, v68 + v69);
                [(CRTextFeature *)v64 bounds];
                double v71 = v70;
                [(CRTextFeature *)v64 bounds];
                double v73 = v72;
                [(CRTextFeature *)v64 bounds];
                [(CRTextFeature *)v64 setTopRight:v71 + v73];
                [(CRTextFeature *)v64 bounds];
                double v75 = v74;
                [(CRTextFeature *)v64 bounds];
                double v77 = v76;
                [(CRTextFeature *)v64 bounds];
                double v79 = v78;
                [(CRTextFeature *)v64 bounds];
                -[CRTextFeature setBottomRight:](v64, "setBottomRight:", v75 + v77, v79 + v80);
                if (v132)
                {
                  v81 = [v63 text];
                  [(CRTextFeature *)v64 setStringValue:v81];

                  v135 = [v128 objectForKey:@"CRTextRecognizerNumberResultsNeeded"];
                  if (v135)
                  {
                    v82 = [v63 candidates];
                    BOOL v83 = [v82 count] == 0;

                    if (!v83)
                    {
                      uint64_t v84 = [v135 integerValue];
                      v85 = (void *)MEMORY[0x1E4F1CA48];
                      v86 = [v63 candidates];
                      v87 = objc_msgSend(v85, "arrayWithCapacity:", objc_msgSend(v86, "count"));
                      uint64_t v130 = v84;

                      v88 = (void *)MEMORY[0x1E4F1CA48];
                      v89 = [v63 candidates];
                      v90 = objc_msgSend(v88, "arrayWithCapacity:", objc_msgSend(v89, "count"));

                      long long v139 = 0u;
                      long long v140 = 0u;
                      long long v137 = 0u;
                      long long v138 = 0u;
                      v91 = [v63 candidates];
                      uint64_t v92 = [v91 countByEnumeratingWithState:&v137 objects:v161 count:16];
                      if (v92)
                      {
                        uint64_t v93 = *(void *)v138;
LABEL_72:
                        uint64_t v94 = 0;
                        uint64_t v95 = v130 - 1;
                        v130 -= v92;
                        while (1)
                        {
                          if (*(void *)v138 != v93) {
                            objc_enumerationMutation(v91);
                          }
                          v96 = *(void **)(*((void *)&v137 + 1) + 8 * v94);
                          v97 = NSNumber;
                          [v96 confidence];
                          v98 = objc_msgSend(v97, "numberWithFloat:");
                          [v87 addObject:v98];

                          v99 = [v96 text];
                          [v90 addObject:v99];

                          if (v95 == v94) {
                            break;
                          }
                          if (v92 == ++v94)
                          {
                            uint64_t v92 = [v91 countByEnumeratingWithState:&v137 objects:v161 count:16];
                            if (v92) {
                              goto LABEL_72;
                            }
                            break;
                          }
                        }
                      }

                      [(CRTextFeature *)v64 setCandidateProbs:v87];
                      [(CRTextFeature *)v64 setStringValueCandidates:v90];
                    }
                  }
                }
                [v133 addObject:v64];
              }
              uint64_t v134 = [v129 countByEnumeratingWithState:&v141 objects:v162 count:16];
            }
            while (v134);
          }

          [(CRTextFeature *)v127 setSubFeatures:v133];
          [v122 addObject:v127];
        }
        uint64_t v121 = [obj countByEnumeratingWithState:&v145 objects:v163 count:16];
      }
      while (v121);
    }

    v40 = objc_opt_new();
    v100 = objc_opt_new();
    [v40 setDetectorResults:v100];

    v101 = [v40 detectorResults];
    [v101 setStartTime:v115];

    v102 = [v40 detectorResults];
    [v102 setEndTime:v114];

    v103 = [v40 detectorResults];
    [v103 setInputOptions:v128];

    v104 = [v40 detectorResults];
    [v104 setTextFeatures:v122];

    if (v132)
    {
      v105 = objc_opt_new();
      [v40 setRecognizerResults:v105];

      v106 = [v40 recognizerResults];
      [v106 setStartTime:v115];

      v107 = [v40 recognizerResults];
      [v107 setEndTime:v114];

      v108 = [v40 recognizerResults];
      [v108 setCodeMaps:MEMORY[0x1E4F1CBF0]];

      v109 = [v40 recognizerResults];
      [v109 setTextFeatures:v122];

      v110 = [v40 recognizerResults];
      [v110 setInputOptions:v128];

      [v40 recognizerResults];
    }
    else
    {
      [v40 detectorResults];
    v111 = };
    v112 = [v111 textFeatures];
    [v40 setTextFeatures:v112];

    if (v118) {
      ((void (*)(void (**)(double), void, double))v118[2])(v118, 0, 0.700000003);
    }

    v41 = v114;
  }

LABEL_52:
  return v40;
}

@end