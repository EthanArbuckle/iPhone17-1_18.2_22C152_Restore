@interface TIReporter
+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4;
+ (id)languageForOptions:(id)a3;
+ (id)textCorpusForOptions:(id)a3;
- (BOOL)shouldConcatenateTokensAtBoundaryError;
- (NSDictionary)options;
- (NSMutableArray)resultLoggers;
- (NSString)buildVersion;
- (NSString)language;
- (NSString)localeIdentifierForLanguage;
- (NSString)textCorpus;
- (TIReporter)initWithBuildVersion:(id)a3;
- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4;
- (id)alignedTypingSequenceForTransliteratedResult:(id)a3;
- (id)reportForAutocorrectionResults:(id)a3;
- (id)reportForTrial:(unint64_t)a3;
- (id)resultsForTrial:(unint64_t)a3;
- (void)beginLogTrial;
- (void)collectAggdStatisticsForResult:(id)a3;
- (void)logResult:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation TIReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);
  objc_storeStrong((id *)&self->_resultLoggers, 0);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSMutableArray)resultLoggers
{
  return self->_resultLoggers;
}

- (id)reportForAutocorrectionResults:(id)a3
{
  uint64_t v322 = *MEMORY[0x263EF8340];
  id v203 = a3;
  v195 = [MEMORY[0x263EFF9A0] dictionary];
  v255 = objc_opt_new();
  v201 = [MEMORY[0x263EFF980] array];
  v4 = [(TIReporter *)self options];
  v5 = [v4 objectForKey:@"MAX_PREDICTIONS_REPORTED"];
  v6 = v5;
  if (!v5) {
    v5 = @"0";
  }
  int v200 = [(__CFString *)v5 intValue];

  v7 = [(TIReporter *)self options];
  v8 = [v7 objectForKey:@"MAX_INLINE_COMPLETIONS_REPORTED"];
  v9 = v8;
  if (!v8) {
    v8 = @"0";
  }
  int v199 = [(__CFString *)v8 intValue];

  v10 = [(TIReporter *)self options];
  v11 = [v10 objectForKey:@"REPORT_AGGD_STATISTICS"];
  v12 = v11;
  if (!v11) {
    v11 = @"0";
  }
  int v198 = [(__CFString *)v11 BOOLValue];

  v13 = [(TIReporter *)self options];
  v14 = [v13 objectForKey:@"LOG_DOCUMENT_CONTEXT"];
  v15 = v14;
  if (!v14) {
    v14 = (void *)MEMORY[0x263EFFA80];
  }
  char v197 = [v14 BOOLValue];

  v16 = [(TIReporter *)self options];
  v17 = [v16 objectForKey:@"PREFERS_TRANSLITERATION"];
  v18 = v17;
  if (!v17) {
    v17 = @"0";
  }
  self->_isTransliterating = [(__CFString *)v17 BOOLValue];

  v19 = [(TIReporter *)self options];
  v20 = [v19 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

  if (v20)
  {
    v21 = self;
    v22 = [(TIReporter *)self options];
    v23 = [v22 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"];

    v24 = [v23 lowercaseString];
    v25 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v26 = [v24 stringByTrimmingCharactersInSet:v25];

    if ([v26 isEqualToString:@"none"])
    {
      uint64_t v196 = 0;
    }
    else
    {
      if ([v26 isEqualToString:@"typinglog"])
      {
        uint64_t v27 = 1;
      }
      else
      {
        int v28 = [v26 isEqualToString:@"alignment"];
        uint64_t v27 = 1;
        if (v28) {
          uint64_t v27 = 2;
        }
      }
      uint64_t v196 = v27;
    }
    self = v21;
  }
  else
  {
    uint64_t v196 = 1;
  }
  uint64_t v29 = [v203 count];
  uint64_t v30 = v29;
  if (!v29)
  {
    fputc(10, (FILE *)*MEMORY[0x263EF8348]);
    uint64_t v217 = 0;
    uint64_t v218 = 0;
    uint64_t v216 = 0;
    uint64_t v31 = 0;
    uint64_t v160 = 0;
    uint64_t v161 = 0;
    uint64_t v162 = 0;
    uint64_t v246 = 0;
    uint64_t v241 = 0;
    uint64_t v163 = 0;
    float v164 = 1.0;
    float v165 = 0.0;
    float v157 = 1.0;
    float v159 = 0.0;
    float v166 = 0.0;
    float v167 = 0.0;
    goto LABEL_154;
  }
  uint64_t v232 = 0;
  uint64_t v260 = 0;
  uint64_t v265 = 0;
  uint64_t v241 = 0;
  uint64_t v246 = 0;
  uint64_t v229 = 0;
  uint64_t v230 = 0;
  uint64_t v31 = 0;
  uint64_t v216 = 0;
  uint64_t v217 = 0;
  uint64_t v218 = 0;
  uint64_t v32 = 0;
  uint64_t v202 = v29;
  do
  {
    context = (void *)MEMORY[0x2455C2B00]();
    uint64_t v228 = v32 + 1;
    fprintf((FILE *)*MEMORY[0x263EF8348], "Processing result %lu/%lu\r", v32 + 1, v30);
    v33 = [v203 objectAtIndexedSubscript:v32];
    v235 = [v33 intendedTransliteration];

    v34 = [v33 numberOfTouches];
    uint64_t v226 = [v34 integerValue];

    v35 = [(TIReporter *)self localeIdentifierForLanguage];
    if ([v35 isEqualToString:@"ko_KR"])
    {
      v36 = [v33 intended];
      id v37 = [v36 componentsJoinedByString:&stru_26F2B7E50];
      id v38 = +[TITesterUtils decomposeHangulSequence:v37];
    }
    else
    {
      v36 = [v33 intended];
      id v37 = [v36 componentsJoinedByString:&stru_26F2B7E50];
      id v38 = v37;
    }

    id v231 = v38;
    uint64_t v225 = [v38 length];
    v239 = [NSString string];
    long long v306 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    long long v309 = 0u;
    v233 = v33;
    v39 = [v33 inserted];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v306 objects:v321 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v307;
      do
      {
        uint64_t v43 = 0;
        v44 = v239;
        do
        {
          if (*(void *)v307 != v42) {
            objc_enumerationMutation(v39);
          }
          v45 = [*(id *)(*((void *)&v306 + 1) + 8 * v43) componentsJoinedByString:&stru_26F2B7E50];
          uint64_t v46 = [v44 stringByAppendingString:v45];

          ++v43;
          v44 = (void *)v46;
        }
        while (v41 != v43);
        v239 = (void *)v46;
        uint64_t v41 = [v39 countByEnumeratingWithState:&v306 objects:v321 count:16];
      }
      while (v41);
    }

    v47 = [v239 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"];
    v48 = [v47 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"];
    uint64_t v224 = [v48 length];

    v49 = [v233 intended];
    long long v302 = 0u;
    long long v303 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    obuint64_t j = v49;
    uint64_t v50 = [obj countByEnumeratingWithState:&v302 objects:v320 count:16];
    if (!v50)
    {
      uint64_t v262 = 0;
      uint64_t v267 = 0;
      unint64_t v52 = 0x263F08000uLL;
      goto LABEL_47;
    }
    uint64_t v51 = v50;
    uint64_t v262 = 0;
    uint64_t v267 = 0;
    id v270 = *(id *)v303;
    unint64_t v52 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(id *)v303 != v270) {
          objc_enumerationMutation(obj);
        }
        v54 = *(void **)(*((void *)&v302 + 1) + 8 * i);
        v55 = [*(id *)(v52 + 1800) whitespaceAndNewlineCharacterSet];
        v56 = [v54 stringByTrimmingCharactersInSet:v55];
        if ([v56 length])
        {
          v57 = [*(id *)(v52 + 1800) punctuationCharacterSet];
          v58 = [v54 stringByTrimmingCharactersInSet:v57];
          uint64_t v59 = [v58 length];

          if (v59)
          {
            ++v260;
            ++v262;
            goto LABEL_43;
          }
        }
        else
        {
        }
        v265 += [v54 length];
        v267 += [v54 length];
LABEL_43:
        unint64_t v52 = 0x263F08000;
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v302 objects:v320 count:16];
    }
    while (v51);
LABEL_47:

    if (v235) {
      [(TIReporter *)self alignedTypingSequenceForTransliteratedResult:v233];
    }
    else {
      [(TIReporter *)self alignedTypingSequenceForResult:v233 keystrokeSegmentationMode:v196];
    }
    v61 = v231;
    uint64_t v60 = v232;
    id v62 = (id)objc_claimAutoreleasedReturnValue();

    if (!v62) {
      goto LABEL_134;
    }
    long long v300 = 0u;
    long long v301 = 0u;
    long long v298 = 0u;
    long long v299 = 0u;
    id v215 = v62;
    id v250 = v62;
    uint64_t v63 = [v250 countByEnumeratingWithState:&v298 objects:v319 count:16];
    if (!v63)
    {
      uint64_t v243 = 0;
      uint64_t v247 = 0;
      goto LABEL_68;
    }
    uint64_t v64 = v63;
    uint64_t v243 = 0;
    uint64_t v247 = 0;
    uint64_t v65 = *(void *)v299;
    uint64_t v257 = *(void *)v299;
    while (2)
    {
      uint64_t v66 = 0;
      id v271 = (id)v64;
      while (2)
      {
        if (*(void *)v299 != v65) {
          objc_enumerationMutation(v250);
        }
        v67 = *(void **)(*((void *)&v298 + 1) + 8 * v66);
        v68 = [v67 source];
        v69 = [v67 target];
        if ([v68 length] && objc_msgSend(v69, "isEqualToString:", v68))
        {
          v70 = [*(id *)(v52 + 1800) whitespaceAndNewlineCharacterSet];
          v71 = [v68 stringByTrimmingCharactersInSet:v70];
          if ([v71 length])
          {
            v72 = [*(id *)(v52 + 1800) punctuationCharacterSet];
            v73 = [v68 stringByTrimmingCharactersInSet:v72];
            uint64_t v74 = [v73 length];

            unint64_t v52 = 0x263F08000;
            if (v74)
            {
              ++v241;
              ++v243;
              goto LABEL_63;
            }
          }
          else
          {
          }
          v246 += [v68 length];
          v247 += [v68 length];
LABEL_63:
          uint64_t v65 = v257;
          uint64_t v64 = (uint64_t)v271;
        }

        if (v64 != ++v66) {
          continue;
        }
        break;
      }
      uint64_t v64 = [v250 countByEnumeratingWithState:&v298 objects:v319 count:16];
      if (v64) {
        continue;
      }
      break;
    }
LABEL_68:

    v75 = [(TIReporter *)self localeIdentifierForLanguage];
    if ([v75 isEqualToString:@"ko_KR"])
    {
      v76 = [v233 intended];
      id v77 = [v76 componentsJoinedByString:&stru_26F2B7E50];
      id v78 = +[TITesterUtils decomposeHangulSequence:v77];
    }
    else
    {
      v76 = [v233 intended];
      id v77 = [v76 componentsJoinedByString:&stru_26F2B7E50];
      id v78 = v77;
    }

    uint64_t v213 = [v78 length];
    v79 = [v78 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    if (v235)
    {
      v80 = v79;
      v81 = v233;
      v82 = [v233 intendedTransliteration];
      [v82 componentsJoinedByString:&stru_26F2B7E50];
      v223 = v222 = v80;
    }
    else
    {
      v222 = &stru_26F2B7E50;
      v223 = v79;
      v81 = v233;
    }
    v83 = [v81 input];
    v84 = [v83 componentsJoinedByString:&stru_26F2B7E50];

    v221 = [v84 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v258 = [MEMORY[0x263F089D8] string];
    long long v294 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    long long v297 = 0u;
    id v272 = [v81 touched];
    uint64_t v85 = [v272 countByEnumeratingWithState:&v294 objects:v318 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = 0;
      uint64_t v88 = *(void *)v295;
      do
      {
        for (uint64_t j = 0; j != v86; ++j)
        {
          if (*(void *)v295 != v88) {
            objc_enumerationMutation(v272);
          }
          v90 = *(void **)(*((void *)&v294 + 1) + 8 * j);
          v91 = [v90 componentsJoinedByString:&stru_26F2B7E50];
          [v258 appendString:v91];

          long long v292 = 0u;
          long long v293 = 0u;
          long long v290 = 0u;
          long long v291 = 0u;
          id v92 = v90;
          uint64_t v93 = [v92 countByEnumeratingWithState:&v290 objects:v317 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v291;
            do
            {
              for (uint64_t k = 0; k != v94; ++k)
              {
                if (*(void *)v291 != v95) {
                  objc_enumerationMutation(v92);
                }
                unsigned int v97 = [*(id *)(*((void *)&v290 + 1) + 8 * k) isEqualToString:@"<Delete>"];
                v87 += v97;
                v31 += v97;
              }
              uint64_t v94 = [v92 countByEnumeratingWithState:&v290 objects:v317 count:16];
            }
            while (v94);
          }
        }
        uint64_t v86 = [v272 countByEnumeratingWithState:&v294 objects:v318 count:16];
      }
      while (v86);
    }
    else
    {
      uint64_t v87 = 0;
    }

    v220 = [v258 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    id v273 = [MEMORY[0x263F089D8] string];
    v98 = v233;
    v99 = [v233 touchEvents];
    uint64_t v100 = [v99 count];

    if (v100)
    {
      unint64_t v101 = 0;
      do
      {
        v102 = [v98 touchEvents];
        v103 = [v102 objectAtIndexedSubscript:v101];

        v104 = [NSNumber numberWithInt:v101];
        v105 = [v98 pathsForWords];
        v106 = [v105 objectForKey:v104];

        v236 = v103;
        if (v106)
        {
          v107 = [v98 pathsForWords];
          id v108 = [v107 objectForKeyedSubscript:v104];

          v109 = [v108 toJsonDictionary];
          [v273 appendFormat:@"<CP; %@ >", v109];
        }
        else
        {
          long long v288 = 0u;
          long long v289 = 0u;
          long long v286 = 0u;
          long long v287 = 0u;
          id v108 = v103;
          uint64_t v110 = [v108 countByEnumeratingWithState:&v286 objects:v316 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            uint64_t v112 = *(void *)v287;
            do
            {
              for (uint64_t m = 0; m != v111; ++m)
              {
                if (*(void *)v287 != v112) {
                  objc_enumerationMutation(v108);
                }
                v114 = [*(id *)(*((void *)&v286 + 1) + 8 * m) shortDescription];
                [v273 appendString:v114];
              }
              uint64_t v111 = [v108 countByEnumeratingWithState:&v286 objects:v316 count:16];
            }
            while (v111);
            v98 = v233;
          }
        }

        ++v101;
        v115 = [v98 touchEvents];
        unint64_t v116 = [v115 count];
      }
      while (v116 > v101);
    }
    v117 = [NSString string];
    long long v282 = 0u;
    long long v283 = 0u;
    long long v284 = 0u;
    long long v285 = 0u;
    v118 = [v98 inserted];
    uint64_t v119 = [v118 countByEnumeratingWithState:&v282 objects:v315 count:16];
    if (v119)
    {
      uint64_t v120 = v119;
      uint64_t v121 = *(void *)v283;
      do
      {
        uint64_t v122 = 0;
        v123 = v117;
        do
        {
          if (*(void *)v283 != v121) {
            objc_enumerationMutation(v118);
          }
          v124 = [*(id *)(*((void *)&v282 + 1) + 8 * v122) componentsJoinedByString:&stru_26F2B7E50];
          v117 = [v123 stringByAppendingString:v124];

          ++v122;
          v123 = v117;
        }
        while (v120 != v122);
        uint64_t v120 = [v118 countByEnumeratingWithState:&v282 objects:v315 count:16];
      }
      while (v120);
    }

    v125 = [v117 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"];
    v126 = [v125 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"];
    uint64_t v127 = [v126 length];

    v237 = [v117 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v128 = [v233 corrected];
    v129 = [v128 componentsJoinedByString:&stru_26F2B7E50];

    v219 = [v129 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    v130 = TIPlistFormattedAlignedTypingSequence(v250, v200 > 0, v197, v199 > 0);
    long long v278 = 0u;
    long long v279 = 0u;
    long long v280 = 0u;
    long long v281 = 0u;
    id v251 = v130;
    uint64_t v131 = [v251 countByEnumeratingWithState:&v278 objects:v314 count:16];
    uint64_t v211 = v127;
    if (v131)
    {
      uint64_t v132 = v131;
      uint64_t v133 = 0;
      uint64_t v134 = 0;
      uint64_t v135 = 0;
      uint64_t v136 = *(void *)v279;
      do
      {
        for (uint64_t n = 0; n != v132; ++n)
        {
          if (*(void *)v279 != v136) {
            objc_enumerationMutation(v251);
          }
          v138 = [*(id *)(*((void *)&v278 + 1) + 8 * n) objectForKeyedSubscript:@"autocorrectionType"];
          v133 += TIAutoCorrectionTypeCorrectedIsNotIntended(v138);
          v134 += TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(v138);
          v135 += TIAutoCorrectionTypeCorrectedIsNotInserted(v138);
          [v255 addObject:v138];
        }
        uint64_t v132 = [v251 countByEnumeratingWithState:&v278 objects:v314 count:16];
      }
      while (v132);
    }
    else
    {
      uint64_t v133 = 0;
      uint64_t v134 = 0;
      uint64_t v135 = 0;
    }

    v206 = (void *)MEMORY[0x263EFF9A0];
    v312[0] = @"Seed";
    v210 = [v233 seed];
    v313[0] = v210;
    v312[1] = @"CorpusId";
    uint64_t v139 = [v233 corpusId];
    v209 = (void *)v139;
    if (v139) {
      v140 = (__CFString *)v139;
    }
    else {
      v140 = &stru_26F2B7E50;
    }
    v313[1] = v140;
    v312[2] = @"Metadata";
    uint64_t v141 = [v233 sourceMetadata];
    v208 = (void *)v141;
    uint64_t v142 = MEMORY[0x263EFFA78];
    if (v141) {
      uint64_t v142 = v141;
    }
    v313[2] = v142;
    v313[3] = v223;
    v312[3] = @"Intended";
    v312[4] = @"Input";
    v313[4] = v221;
    v313[5] = v220;
    v312[5] = @"Touched";
    v312[6] = @"TouchPoints";
    v313[6] = v273;
    v313[7] = v237;
    v312[7] = @"Inserted";
    v312[8] = @"Corrected";
    v313[8] = v219;
    v313[9] = v222;
    v312[9] = @"IntendedTransliteration";
    v312[10] = @"WordCount";
    v207 = [NSNumber numberWithInteger:v262];
    v313[10] = v207;
    v312[11] = @"WordErrorCount";
    v263 = [NSNumber numberWithInteger:v262 - v243];
    v313[11] = v263;
    v312[12] = @"SeparatorCount";
    v244 = [NSNumber numberWithInteger:v267];
    v313[12] = v244;
    v312[13] = @"SeparatorErrorCount";
    v268 = [NSNumber numberWithUnsignedInteger:v267 - v247];
    v313[13] = v268;
    v312[14] = @"KeystrokeCount";
    v248 = [v233 numberOfTouches];
    v313[14] = v248;
    v312[15] = @"CharacterCount";
    v214 = [NSNumber numberWithUnsignedInteger:v213];
    v313[15] = v214;
    v312[16] = @"DeleteCount";
    v205 = [NSNumber numberWithInteger:v87];
    v313[16] = v205;
    v312[17] = @"InsertedCharacterCount";
    v212 = [NSNumber numberWithUnsignedInteger:v211];
    v313[17] = v212;
    v313[18] = v251;
    v312[18] = @"Alignment";
    v312[19] = @"incorrectCount";
    v204 = [NSNumber numberWithInteger:v133];
    v313[19] = v204;
    v312[20] = @"badAutocorrectionCount";
    v143 = [NSNumber numberWithInteger:v134];
    v313[20] = v143;
    v312[21] = @"autocorrectionCount";
    v144 = [NSNumber numberWithInteger:v135];
    v313[21] = v144;
    v145 = [NSDictionary dictionaryWithObjects:v313 forKeys:v312 count:22];
    v146 = [v206 dictionaryWithDictionary:v145];

    v147 = [v233 debugData];

    if (v147)
    {
      v148 = [v233 debugData];
      [v146 setObject:v148 forKey:@"DebugData"];
    }
    if (v198)
    {
      v149 = [v233 aggdStatistics];

      if (v149)
      {
        v150 = [v233 aggdStatistics];
        [v146 setObject:v150 forKey:@"AggdStatistics"];
      }
    }
    v151 = [v233 typologyLogURL];

    if (v151)
    {
      v152 = [v233 typologyLogURL];
      v153 = [v152 path];
      [v146 setObject:v153 forKey:@"typologyLogPath"];
    }
    v154 = [v233 typologyTraceLogURL];

    if (v154)
    {
      v155 = [v233 typologyTraceLogURL];
      v156 = [v155 path];
      [v146 setObject:v156 forKey:@"typologyTraceLogPath"];
    }
    v216 += v133;
    v217 += v134;
    v218 += v135;
    [v201 addObject:v146];

    v61 = v231;
    uint64_t v60 = v232;
    id v62 = v215;
LABEL_134:
    uint64_t v232 = v226 + v60;
    v229 += v225;
    v230 += v224;

    uint64_t v32 = v228;
    uint64_t v30 = v202;
  }
  while (v228 != v202);
  fputc(10, (FILE *)*MEMORY[0x263EF8348]);
  float v157 = 1.0;
  uint64_t v30 = v265;
  if (v229 > v265)
  {
    float v157 = 0.0;
    if (v229 > v230) {
      float v157 = (float)(v229 - v230) / (float)(v229 - v265);
    }
  }
  float v158 = (float)v260;
  if (v260 < 1) {
    float v159 = 0.0;
  }
  else {
    float v159 = (float)v241 / v158;
  }
  if (v265 >= 1) {
    float v164 = (float)v246 / (float)v265;
  }
  else {
    float v164 = 1.0;
  }
  if (v229 < 1)
  {
    float v166 = 0.0;
    float v165 = 0.0;
    if (v260 >= 1) {
      goto LABEL_149;
    }
  }
  else
  {
    float v166 = (float)v31 / (float)v229;
    if (v260 <= 0)
    {
      float v165 = 0.0;
      goto LABEL_150;
    }
LABEL_149:
    float v165 = (float)v216 / v158;
  }
LABEL_150:
  if (v218 >= 1) {
    float v167 = (float)v217 / (float)v218;
  }
  else {
    float v167 = 0.0;
  }
  uint64_t v163 = v260;
  uint64_t v160 = v230;
  uint64_t v161 = v229;
  uint64_t v162 = v232;
LABEL_154:
  v168 = [MEMORY[0x263EFF9A0] dictionary];
  v275[0] = MEMORY[0x263EF8330];
  v275[1] = 3221225472;
  v275[2] = __45__TIReporter_reportForAutocorrectionResults___block_invoke;
  v275[3] = &unk_265050028;
  id v274 = v255;
  id v276 = v274;
  id v169 = v168;
  id v277 = v169;
  v238 = v169;
  [v274 enumerateObjectsUsingBlock:v275];
  v310[0] = @"Language";
  uint64_t v170 = [(TIReporter *)self language];
  v269 = (void *)v170;
  if (v170) {
    v171 = (__CFString *)v170;
  }
  else {
    v171 = &stru_26F2B7E50;
  }
  v311[0] = v171;
  v310[1] = @"TextCorpus";
  uint64_t v172 = [(TIReporter *)self textCorpus];
  v266 = (void *)v172;
  if (v172) {
    v173 = (__CFString *)v172;
  }
  else {
    v173 = &stru_26F2B7E50;
  }
  v311[1] = v173;
  v310[2] = @"BuildVersion";
  uint64_t v174 = [(TIReporter *)self buildVersion];
  v264 = (void *)v174;
  if (v174) {
    v175 = (__CFString *)v174;
  }
  else {
    v175 = &stru_26F2B7E50;
  }
  v311[2] = v175;
  v310[3] = @"Options";
  uint64_t v176 = [(TIReporter *)self options];
  v261 = (void *)v176;
  uint64_t v177 = MEMORY[0x263EFFA78];
  if (v176) {
    uint64_t v177 = v176;
  }
  v311[3] = v177;
  v310[4] = @"KeystrokeCount";
  v259 = [NSNumber numberWithInteger:v162];
  v311[4] = v259;
  v310[5] = @"CharacterCount";
  v256 = [NSNumber numberWithInteger:v161];
  v311[5] = v256;
  v310[6] = @"DeleteCount";
  id obja = [NSNumber numberWithInteger:v31];
  v311[6] = obja;
  v310[7] = @"DeleteRatio";
  *(float *)&double v178 = v166;
  id v252 = [NSNumber numberWithFloat:v178];
  v311[7] = v252;
  v310[8] = @"InsertedCharacterCount";
  v249 = [NSNumber numberWithInteger:v160];
  v311[8] = v249;
  v311[9] = v201;
  v310[9] = @"Results";
  v310[10] = @"KeystrokeSavingsRatio";
  *(float *)&double v179 = v157;
  v245 = [NSNumber numberWithFloat:v179];
  v311[10] = v245;
  v310[11] = @"WordCount";
  v240 = [NSNumber numberWithInteger:v163];
  v311[11] = v240;
  v310[12] = @"WordErrorCount";
  v242 = [NSNumber numberWithInteger:v163 - v241];
  v311[12] = v242;
  v310[13] = @"WordAccuracy";
  *(float *)&double v180 = v159;
  v234 = [NSNumber numberWithFloat:v180];
  v311[13] = v234;
  v310[14] = @"SeparatorCount";
  v181 = [NSNumber numberWithInteger:v30];
  v311[14] = v181;
  v310[15] = @"SeparatorErrorCount";
  v182 = [NSNumber numberWithInteger:v30 - v246];
  v311[15] = v182;
  v310[16] = @"SeparatorAccuracy";
  *(float *)&double v183 = v164;
  v184 = [NSNumber numberWithFloat:v183];
  v311[16] = v184;
  v311[17] = @"1.14";
  v310[17] = @"ActVersion";
  v310[18] = @"TotalRevisionCount";
  v185 = [NSNumber numberWithInteger:v216];
  v311[18] = v185;
  v310[19] = @"TotalRevisionRate";
  *(float *)&double v186 = v165;
  v187 = [NSNumber numberWithFloat:v186];
  v311[19] = v187;
  v310[20] = @"TotalBadAutocorrectionCount";
  v188 = [NSNumber numberWithInteger:v217];
  v311[20] = v188;
  v311[21] = v169;
  v310[21] = @"AutocorrectionTypeCounts";
  v310[22] = @"TotalAutocorrectionCount";
  v189 = [NSNumber numberWithInteger:v218];
  v311[22] = v189;
  v310[23] = @"AutoCorrectionRevisionRate";
  *(float *)&double v190 = v167;
  v191 = [NSNumber numberWithFloat:v190];
  v311[23] = v191;
  v192 = [NSDictionary dictionaryWithObjects:v311 forKeys:v310 count:24];
  [v195 addEntriesFromDictionary:v192];

  id v193 = v195;
  return v193;
}

void __45__TIReporter_reportForAutocorrectionResults___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 countForObject:v4];
  id v6 = [NSNumber numberWithUnsignedInteger:v5];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v4];
}

- (id)reportForTrial:(unint64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TIReporter *)self resultLoggers];
  id v6 = [v5 objectAtIndex:a3];

  v7 = [v6 allResults];
  v8 = [(TIReporter *)self reportForAutocorrectionResults:v7];
  v12 = @"TrialIndex";
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v13[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v8 addEntriesFromDictionary:v10];

  return v8;
}

- (id)alignedTypingSequenceForTransliteratedResult:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v3 intended];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = objc_alloc_init(TIAlignedTyping);
      v9 = [v3 intendedTransliteration];
      v10 = [v9 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setSource:v10];

      v11 = [v3 intended];
      v12 = [v11 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setSourceTransliteration:v12];

      v13 = [v3 touched];
      v14 = [v13 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setTouched:v14];

      v15 = [v3 inserted];
      v16 = [v15 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setInserted:v16];

      v17 = [v3 corrected];
      v18 = [v17 objectAtIndex:v7];
      [(TIAlignedTokens *)v8 setTarget:v18];

      v19 = [v3 predicted];
      v20 = [v19 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setPredicted:v20];

      v21 = [v3 inlineCompletions];
      v22 = [v21 objectAtIndex:v7];
      [(TIAlignedTyping *)v8 setInlineCompletions:v22];

      v23 = [NSNumber numberWithInteger:v7];
      v24 = [v3 pathsForWords];
      v25 = [v24 objectForKey:v23];

      if (v25)
      {
        v26 = [v3 pathsForWords];
        uint64_t v27 = [v26 objectForKeyedSubscript:v23];

        [(TIAlignedTyping *)v8 setPath:v27];
      }
      [v4 addObject:v8];

      ++v7;
      int v28 = [v3 intended];
      unint64_t v29 = [v28 count];
    }
    while (v7 < v29);
  }

  return v4;
}

- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [v6 intended];
  v8 = TICharSequenceForTokenSequence(v7);

  v9 = [v6 corrected];
  v10 = TICharSequenceForTokenSequence(v9);

  v11 = (void *)MEMORY[0x263EFF960];
  v12 = [(TIReporter *)self language];
  v13 = [v11 localeWithLocaleIdentifier:v12];

  v123[0] = MEMORY[0x263EF8330];
  v123[1] = 3221225472;
  v123[2] = __71__TIReporter_alignedTypingSequenceForResult_keystrokeSegmentationMode___block_invoke;
  v123[3] = &unk_265050000;
  id v14 = v13;
  id v124 = v14;
  v15 = (void *)MEMORY[0x2455C2CF0](v123);
  v16 = TIOptimalSequenceAlignment(v8, v10, v15);
  id v17 = [v6 intended];
  uint64_t v88 = [v6 corrected];
  TITokenAlignmentForKeyAlignment(v16, v8, v10, v17, v88);
  v94 = id v93 = v6;
  id v91 = v14;
  id v92 = v8;
  id v89 = v16;
  id v90 = v15;
  if (a4 == 2)
  {
    uint64_t v86 = self;
    uint64_t v87 = v10;
    uint64_t v27 = [MEMORY[0x263EFF980] array];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    int v28 = [v6 inserted];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v119 objects:v129 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v120 != v31) {
            objc_enumerationMutation(v28);
          }
          [v27 addObjectsFromArray:*(void *)(*((void *)&v119 + 1) + 8 * i)];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v119 objects:v129 count:16];
      }
      while (v30);
    }

    v33 = TICharSequenceForTokenSequence(v27);
    v34 = TIOptimalSequenceAlignment(v8, v33, v15);
    v83 = &v81;
    id v84 = v33;
    id v85 = v34;
    v102 = &v81 - 2 * [v17 count] - 2;
    TITargetKeyRangesForSourceTokens(v34, v8, v84, v17, v84, (uint64_t)v102);
    v35 = [MEMORY[0x263EFF980] array];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v36 = [v6 touched];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v115 objects:v128 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v116;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v116 != v39) {
            objc_enumerationMutation(v36);
          }
          [v35 addObjectsFromArray:*(void *)(*((void *)&v115 + 1) + 8 * j)];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v115 objects:v128 count:16];
      }
      while (v38);
    }

    uint64_t v41 = [MEMORY[0x263EFF980] array];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v42 = [v6 predicted];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v111 objects:v127 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v112;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v112 != v45) {
            objc_enumerationMutation(v42);
          }
          [v41 addObjectsFromArray:*(void *)(*((void *)&v111 + 1) + 8 * k)];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v111 objects:v127 count:16];
      }
      while (v44);
    }
    id v95 = v17;

    v47 = [MEMORY[0x263EFF980] array];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v48 = [v6 inlineCompletions];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v107 objects:v126 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v108;
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v108 != v51) {
            objc_enumerationMutation(v48);
          }
          [v47 addObjectsFromArray:*(void *)(*((void *)&v107 + 1) + 8 * m)];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v107 objects:v126 count:16];
      }
      while (v50);
    }

    v53 = [MEMORY[0x263EFF980] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v54 = [v93 documentStates];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v103 objects:v125 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v104;
      do
      {
        for (uint64_t n = 0; n != v56; ++n)
        {
          if (*(void *)v104 != v57) {
            objc_enumerationMutation(v54);
          }
          [v53 addObjectsFromArray:*(void *)(*((void *)&v103 + 1) + 8 * n)];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v103 objects:v125 count:16];
      }
      while (v56);
    }

    id v101 = [MEMORY[0x263EFF980] array];
    id v100 = [MEMORY[0x263EFF980] array];
    id v99 = [MEMORY[0x263EFF980] array];
    id v98 = [MEMORY[0x263EFF980] array];
    id v97 = [MEMORY[0x263EFF980] array];
    id v17 = v95;
    if ([v95 count])
    {
      unint64_t v59 = 0;
      uint64_t v60 = (uint64_t **)(v102 + 1);
      do
      {
        uint64_t v61 = (uint64_t)*(v60 - 1);
        if (v61 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v62 = MEMORY[0x263EFFA68];
          [v101 addObject:MEMORY[0x263EFFA68]];
          [v100 addObject:v62];
          [v99 addObject:v62];
          [v97 addObject:v62];
          [v98 addObject:v62];
        }
        else
        {
          v102 = *v60;
          uint64_t v63 = [v27 subarrayWithRange:v61];
          [v101 addObject:v63];

          uint64_t v64 = objc_msgSend(v35, "subarrayWithRange:", v61, v102);
          [v100 addObject:v64];

          uint64_t v96 = v59;
          uint64_t v65 = v102;
          uint64_t v66 = objc_msgSend(v41, "subarrayWithRange:", v61, v102);
          [v99 addObject:v66];

          v67 = objc_msgSend(v47, "subarrayWithRange:", v61, v65);
          [v98 addObject:v67];

          v68 = v65;
          id v17 = v95;
          unint64_t v59 = v96;
          v69 = objc_msgSend(v53, "subarrayWithRange:", v61, v68);
          [v97 addObject:v69];
        }
        ++v59;
        v60 += 2;
      }
      while (v59 < [v17 count]);
    }
    v102 = (uint64_t *)[v101 copy];
    uint64_t v96 = [v100 copy];
    id v95 = (id)[v99 copy];
    id v70 = v98;
    uint64_t v82 = [v98 copy];
    id v71 = v97;
    v26 = (void *)[v97 copy];

    v72 = v84;
    v18 = v102;

    v23 = (void *)v82;
    id v24 = v95;
    v25 = (void *)v96;
    self = v86;
    v10 = v87;
  }
  else if (a4 == 1)
  {
    v18 = [v6 inserted];
    uint64_t v19 = [v6 touched];
    uint64_t v20 = [v6 predicted];
    uint64_t v21 = [v6 inlineCompletions];
    uint64_t v22 = [v6 documentStates];
    v23 = (void *)v21;
    id v24 = (id)v20;
    v25 = (void *)v19;
    v26 = (void *)v22;
  }
  else
  {
    v26 = (void *)MEMORY[0x263EFFA68];
    v23 = (void *)MEMORY[0x263EFFA68];
    id v24 = (id)MEMORY[0x263EFFA68];
    v25 = (void *)MEMORY[0x263EFFA68];
    v18 = (void *)MEMORY[0x263EFFA68];
  }
  v73 = v18;
  uint64_t v74 = v25;
  v75 = v24;
  v76 = v23;
  id v77 = TIAlignedTypingSequenceForAlignedTokenSequence(v94, v18, v25, v24, v23, v26);
  if (v77 && [(TIReporter *)self shouldConcatenateTokensAtBoundaryError])
  {
    TIConcatenateAlignedTypingAtBoundaryErrors(v77);
    v79 = id v78 = v17;

    id v77 = (void *)v79;
    id v17 = v78;
  }

  return v77;
}

BOOL __71__TIReporter_alignedTypingSequenceForResult_keystrokeSegmentationMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "compare:options:range:locale:", v5, 129, 0, objc_msgSend(v6, "length"), *(void *)(a1 + 32));

  return v7 == 0;
}

- (BOOL)shouldConcatenateTokensAtBoundaryError
{
  v2 = [(TIReporter *)self localeIdentifierForLanguage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TIReporter_shouldConcatenateTokensAtBoundaryError__block_invoke;
  v7[3] = &unk_26504FFD8;
  id v8 = v2;
  id v3 = v2;
  id v4 = [&unk_26F2C9DF8 indexesOfObjectsPassingTest:v7];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

uint64_t __52__TIReporter_shouldConcatenateTokensAtBoundaryError__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

- (id)resultsForTrial:(unint64_t)a3
{
  id v4 = [(TIReporter *)self resultLoggers];
  BOOL v5 = [v4 objectAtIndex:a3];
  id v6 = [v5 allResults];

  return v6;
}

- (void)collectAggdStatisticsForResult:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x263F08910];
  uint64_t v7 = [(id)__aggdReportMock toDictionary];
  id v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:0 error:0];
  v9 = [v3 unarchivedObjectOfClass:v5 fromData:v8 error:0];
  [v4 setAggdStatistics:v9];

  v10 = (void *)__aggdReportMock;
  [v10 clear];
}

- (void)logResult:(id)a3
{
  id v9 = a3;
  id v4 = [(TIReporter *)self options];
  uint64_t v5 = [v4 objectForKey:@"REPORT_AGGD_STATISTICS"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [(TIReporter *)self collectAggdStatisticsForResult:v9];
  }
  uint64_t v7 = [(TIReporter *)self resultLoggers];
  id v8 = [v7 lastObject];

  [v8 addResult:v9];
}

- (void)beginLogTrial
{
  id v3 = [(TIReporter *)self options];
  id v4 = [v3 valueForKey:@"USE_PARTFILE"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    int v6 = [(TIReporter *)self options];
    uint64_t v7 = [v6 valueForKey:@"PARTFILE_FLUSH_THRESHOLD"];

    id v8 = objc_opt_class();
    uint64_t v9 = [(NSMutableArray *)self->_resultLoggers count];
    v10 = [(TIReporter *)self options];
    v11 = [v8 fileURLForTrial:v9 withOptions:v10];

    id v14 = [[TISerializingResultLogger alloc] initWithOutputURL:v11 flushThreshold:v7];
  }
  else
  {
    id v14 = objc_alloc_init(TIInMemoryResultLogger);
  }
  [(NSMutableArray *)self->_resultLoggers addObject:v14];
  v12 = (FILE *)*MEMORY[0x263EF8348];
  id v13 = [(TISerializingResultLogger *)v14 description];
  fprintf(v12, "The following result logger will be used for this trial %s\n", (const char *)[v13 cStringUsingEncoding:4]);
}

- (NSString)textCorpus
{
  id v3 = objc_opt_class();
  id v4 = [(TIReporter *)self options];
  int v5 = [v3 textCorpusForOptions:v4];

  return (NSString *)v5;
}

- (NSString)localeIdentifierForLanguage
{
  v2 = [(TIReporter *)self language];
  uint64_t v3 = [v2 rangeOfString:@"-"];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 substringToIndex:v3];

    v2 = (void *)v4;
  }
  if ([v2 hasPrefix:@"zh"])
  {
    uint64_t v5 = [v2 rangeOfString:@"_"];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"_", @"-", 0, v5, v6);

      v2 = (void *)v7;
    }
  }
  return (NSString *)v2;
}

- (NSString)language
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(TIReporter *)self options];
  uint64_t v5 = [v3 languageForOptions:v4];

  return (NSString *)v5;
}

- (TIReporter)initWithBuildVersion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIReporter;
  uint64_t v6 = [(TIReporter *)&v10 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resultLoggers = v6->_resultLoggers;
    v6->_resultLoggers = v7;

    objc_storeStrong((id *)&v6->_buildVersion, a3);
  }

  return v6;
}

+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(id)objc_opt_class() languageForOptions:v5];
  uint64_t v7 = [(id)objc_opt_class() textCorpusForOptions:v5];
  id v8 = [v5 valueForKey:@"OUTPATH"];

  uint64_t v9 = @"./";
  if (v8) {
    uint64_t v9 = v8;
  }
  objc_super v10 = v9;

  v11 = [NSString stringWithFormat:@"test-typer-%@-%@-trial%03lu.json", v6, v7, a3];
  v12 = [(__CFString *)v10 stringByAppendingPathComponent:v11];

  id v13 = [NSURL fileURLWithPath:v12];

  return v13;
}

+ (id)textCorpusForOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForKey:@"TEXT"];
  if (!v4)
  {
    uint64_t v4 = [v3 valueForKey:@"CANDIDATE_SENTENCES"];
    if (!v4)
    {
      uint64_t v4 = [v3 valueForKey:@"CANDIDATE_PHRASES"];
      if (!v4)
      {
        id v5 = [v3 valueForKey:@"TESTCASE"];
        uint64_t v4 = [v5 lastPathComponent];
      }
    }
  }
  uint64_t v6 = [v4 lastPathComponent];

  uint64_t v7 = [v6 rangeOfString:@"." options:4];
  if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v6 substringToIndex:v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

+ (id)languageForOptions:(id)a3
{
  id v3 = [a3 objectForKey:@"KEYBOARD_LANGUAGE"];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = &stru_26F2B7E50;
  }
  id v5 = v3;

  return v5;
}

@end