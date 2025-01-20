@interface TITypingSessionAligned
+ (BOOL)supportsSecureCoding;
+ (id)alignedEntryForWord:(id)a3;
+ (id)alignedPathTouchesForWord:(id)a3;
+ (id)completeStringFromWordEntry:(id)a3 leadingInputs:(id)a4 trailingInputs:(id)a5 followsContinuousPath:(BOOL)a6;
+ (id)resolveBackspacesInKeyboardInputs:(id)a3;
- (BOOL)compareForConfidenceContextA:(id)a3 contextB:(id)a4;
- (BOOL)containsCPEntries;
- (BOOL)isNewLineScenarioWithCurrentWord:(id)a3 andPreviousWord:(id)a4;
- (BOOL)success;
- (NSArray)alignedEntries;
- (NSArray)layouts;
- (NSLocale)locale;
- (NSString)alignedText;
- (NSString)completeText;
- (NSString)highConfAlignedSubSegment;
- (TITypingSessionAligned)initWithCoder:(id)a3;
- (TITypingSessionAligned)initWithSession:(id)a3;
- (id)restrictedAlignedSessionWithWordLimit:(unint64_t)a3;
- (id)textToAppendForEntry:(id)a3 sessionIndx:(unint64_t)a4;
- (unint64_t)firstCPEntryIndex;
- (void)computeAlignedWordsFromSession:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getAlignedTextAndConfidence;
- (void)setAlignedEntries:(id)a3;
- (void)setAlignedText:(id)a3;
- (void)setContainsCPEntries:(BOOL)a3;
- (void)setFirstCPEntryIndex:(unint64_t)a3;
- (void)setHighConfAlignedSubSegment:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation TITypingSessionAligned

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highConfAlignedSubSegment, 0);
  objc_storeStrong((id *)&self->_completeText, 0);
  objc_storeStrong((id *)&self->_alignedText, 0);
  objc_storeStrong((id *)&self->_alignedEntries, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_layouts, 0);
}

- (void)setFirstCPEntryIndex:(unint64_t)a3
{
  self->_firstCPEntryIndex = a3;
}

- (unint64_t)firstCPEntryIndex
{
  return self->_firstCPEntryIndex;
}

- (void)setContainsCPEntries:(BOOL)a3
{
  self->_containsCPEntries = a3;
}

- (BOOL)containsCPEntries
{
  return self->_containsCPEntries;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setHighConfAlignedSubSegment:(id)a3
{
}

- (NSString)highConfAlignedSubSegment
{
  return self->_highConfAlignedSubSegment;
}

- (NSString)completeText
{
  return self->_completeText;
}

- (void)setAlignedText:(id)a3
{
}

- (NSString)alignedText
{
  return self->_alignedText;
}

- (void)setAlignedEntries:(id)a3
{
}

- (NSArray)alignedEntries
{
  return self->_alignedEntries;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (BOOL)isNewLineScenarioWithCurrentWord:(id)a3 andPreviousWord:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 acceptedCandidate];
  char v8 = [v7 isContinuousPathConversion];

  char v9 = [v6 startsWithNewLine];
  char v10 = v8 ^ 1 | v9;
  if ((v8 & 1) == 0 && (v9 & 1) == 0) {
    char v10 = [v5 endsWithNewLine];
  }

  return v10;
}

- (void)computeAlignedWordsFromSession:(id)a3
{
  uint64_t v306 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 userActionHistory];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v250 = [MEMORY[0x1E4F1CA48] array];
    context = (void *)MEMORY[0x1E4E7C3D0]();
    id v6 = objc_alloc_init(TIDocumentWordsAligned);
    v7 = [v3 userActionHistory];
    uint64_t v8 = [v7 count];

    char v9 = [v3 userActionHistory];
    char v10 = [v9 firstObject];
    v11 = [v10 documentState];
    v12 = [v11 contextBeforeInput];
    v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v251 = [v12 stringByTrimmingCharactersInSet:v13];

    v263 = [MEMORY[0x1E4F28E78] string];
    id v253 = v3;
    v270 = v6;
    uint64_t v260 = v8;
    if (v8)
    {
      v14 = 0;
      v262 = 0;
      v15 = 0;
      char v254 = 0;
      char v269 = 0;
      char v261 = 0;
      id v267 = 0;
      uint64_t v16 = 0;
      while (1)
      {
        v17 = v14;
        v18 = [v3 userActionHistory];
        v14 = [v18 objectAtIndexedSubscript:v16];

        uint64_t v264 = v16;
        if ([v14 actionType] == 10)
        {
          if (!v16)
          {
            v19 = [v14 keyboardState];
            char v20 = [v19 emojiSearchMode];

            if ((v20 & 1) == 0)
            {
              v21 = [v14 originalWordEntries];
              [v3 setOriginalWords:v21];

              long long v299 = 0u;
              long long v300 = 0u;
              long long v297 = 0u;
              long long v298 = 0u;
              id v22 = [v3 originalWords];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v297 objects:v305 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                v25 = v14;
                uint64_t v26 = *(void *)v298;
                do
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v298 != v26) {
                      objc_enumerationMutation(v22);
                    }
                    [(TIDocumentWordsAligned *)v6 pushWordToDocument:*(void *)(*((void *)&v297 + 1) + 8 * i)];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v297 objects:v305 count:16];
                }
                while (v24);
                v14 = v25;
              }
              goto LABEL_177;
            }
          }
          goto LABEL_178;
        }
        if ([v14 actionType])
        {
          if ([v14 actionType] == 1
            && [(TIDocumentWordsAligned *)v6 wordsCount])
          {
            v28 = v14;
            id v29 = v14;
            v30 = [v29 documentState];
            v31 = [v30 contextAfterInput];
            uint64_t v32 = [v31 length];

            v33 = [v29 documentState];
            v34 = [v33 contextBeforeInput];
            if (v32)
            {
              v35 = [(TIDocumentWordsAligned *)v6 wordsFromContext:v34];

              long long v283 = 0u;
              long long v284 = 0u;
              long long v281 = 0u;
              long long v282 = 0u;
              id v36 = v35;
              uint64_t v37 = [v36 countByEnumeratingWithState:&v281 objects:v301 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v282;
                do
                {
                  for (uint64_t j = 0; j != v38; ++j)
                  {
                    if (*(void *)v282 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    v41 = *(void **)(*((void *)&v281 + 1) + 8 * j);
                    v42 = [v41 editedEntry];

                    if (v42) {
                      [v41 setWordAlignmentConf:1];
                    }
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v281 objects:v301 count:16];
                }
                while (v38);
                v43 = v36;
                id v3 = v253;
              }
              else
              {
                v43 = v36;
              }
LABEL_174:
              v14 = v28;
LABEL_175:

LABEL_176:
              id v22 = v14;
              goto LABEL_177;
            }
            v43 = [(TIDocumentWordsAligned *)v6 deleteWordsUpToContext:v34];

            v56 = [(TIDocumentWordsAligned *)v6 inDocumentWordsStack];
            id v36 = [v56 lastObject];

            if ([v43 count])
            {
              v57 = [v43 firstObject];
              v58 = v57;
              if (!v57) {
                goto LABEL_173;
              }
              if ([v57 followsContinuousPath])
              {
                if (v36)
                {
                  uint64_t v59 = 2;
                  goto LABEL_172;
                }
                goto LABEL_173;
              }
              if (!v36) {
                goto LABEL_173;
              }
              v206 = [v29 documentState];
              v207 = [v206 contextBeforeInput];
              if ([v207 endsInWhitespace])
              {

                goto LABEL_165;
              }
              v214 = [v29 documentState];
              v215 = [v214 contextBeforeInput];
              int v280 = [v215 endsInPunctuation];

              if (v280) {
LABEL_165:
              }
                uint64_t v59 = 2;
              else {
                uint64_t v59 = 1;
              }
              id v6 = v270;
LABEL_172:
              [v36 setUnfinishedWordEntryTreatment:v59];
LABEL_173:

              goto LABEL_174;
            }
            v118 = [v29 allKeyboardInputs];
            if ([v118 count] != 1)
            {

              char v254 = 1;
              goto LABEL_174;
            }
            v119 = [v29 allKeyboardInputs];
            v120 = [v119 firstObject];
            int v121 = [v120 isBackspace];

            char v254 = 1;
            if (v121)
            {
              v14 = v28;
              if (v36)
              {
                v122 = [v36 allKeyboardInputs];
                if ([v122 count])
                {
                  v278 = [v36 allKeyboardInputs];
                  v123 = [v278 lastObject];
                  v124 = [v123 string];
                  v125 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                  v126 = [v124 stringByTrimmingCharactersInSet:v125];
                  uint64_t v275 = [v126 length];

                  char v254 = 1;
                  if (!v275) {
                    [v36 setUnfinishedWordEntryTreatment:1];
                  }
                  goto LABEL_218;
                }

                char v254 = 1;
              }
              id v6 = v270;
              goto LABEL_175;
            }
LABEL_218:
            id v6 = v270;
            goto LABEL_174;
          }
          if ([v14 actionType] == 2)
          {
            id v22 = v14;
            if ([v22 isSelection])
            {
              if ([v262 actionType] == 2)
              {
                v43 = v267;
                char v269 = 1;
                id v267 = v262;
                goto LABEL_176;
              }
              char v269 = 1;
            }
LABEL_177:

LABEL_178:
            char v261 = 0;
            id v44 = v15;
LABEL_179:
            id v221 = v14;

            v262 = v221;
            goto LABEL_180;
          }
          char v261 = 0;
          id v44 = v15;
          goto LABEL_180;
        }
        id v44 = v14;

        if ([v44 cancelled])
        {
          [v44 setDeleted:1];
          char v261 = 0;
          goto LABEL_180;
        }
        [v44 setFollowsContinuousPath:v261 & 1];
        v45 = [v44 acceptedCandidate];
        char v261 = [v45 isContinuousPathConversion];

        v46 = [v44 acceptedString];
        if (([v46 isEqualToString:&stru_1F3F7A998] & 1) == 0) {
          break;
        }
        char v47 = [v44 candidateContainsEmoji];

        if (v47) {
          goto LABEL_53;
        }
LABEL_41:
        v50 = v14;
        v51 = [v44 allKeyboardInputs];
        v46 = [v51 lastObject];

        v52 = [v46 acceptedCandidate];
        v53 = [v52 candidate];
        v54 = [(TIDocumentWordsAligned *)v6 lastWord];
        int v55 = [v53 isEqualToString:v54];

        if (!v55)
        {
          id v6 = v270;
          v14 = v50;
          goto LABEL_52;
        }
        id v44 = v44;

        v262 = v44;
        id v6 = v270;
        v14 = v50;
LABEL_180:
        uint64_t v16 = v264 + 1;
        v15 = v44;
        if (v264 + 1 == v260) {
          goto LABEL_225;
        }
      }
      v48 = [v44 acceptedString];
      if ([v48 isEqualToString:@" "])
      {
        char v49 = [v44 candidateContainsEmoji];

        if (v49) {
          goto LABEL_53;
        }
        goto LABEL_41;
      }

LABEL_52:
LABEL_53:
      v255 = v14;
      v60 = [v44 allKeyboardInputs];
      v273 = v44;
      if ([v60 count])
      {
        v61 = [v44 allKeyboardInputs];
        v62 = [v61 firstObject];
        char v63 = [v62 isBackspace];

        v64 = v267;
        if (v63)
        {
          char v254 = 1;
LABEL_58:
          v65 = [v44 acceptedString];
          v66 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v67 = [v65 componentsSeparatedByCharactersInSet:v66];

          v68 = [v44 acceptedCandidate];
          v69 = [v68 input];
          v70 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v71 = [v69 componentsSeparatedByCharactersInSet:v70];

          v259 = v67;
          uint64_t v72 = [v67 count];
          v258 = v71;
          uint64_t v73 = [v71 count];
          v74 = [(TIDocumentWordsAligned *)v6 inDocumentWordsStack];
          uint64_t v75 = [v74 count];

          v14 = v255;
          if (v72 >= 2 && v72 == v73)
          {
            v76 = [v44 documentContextBeforeInput];
            v77 = [(TIDocumentWordsAligned *)v6 wordsForContext:v76];
            if ([v77 count])
            {
              v78 = [(TIDocumentWordsAligned *)v6 inDocumentWordsStack];
              v79 = [v77 objectAtIndexedSubscript:0];
              uint64_t v80 = [v78 indexOfObject:v79];

              if ((v80 & 0x8000000000000000) == 0)
              {
                unint64_t v81 = v72 - 1;
                uint64_t v271 = v80;
                if (v80 + v72 - 1 <= v75)
                {
                  obuint64_t j = v77;
                  uint64_t v82 = 0;
                  if (v81 >= v72) {
                    unint64_t v81 = v72;
                  }
                  unint64_t v274 = v81;
                  id v6 = v270;
                  uint64_t v83 = v80;
                  while (1)
                  {
                    v84 = [(TIDocumentWordsAligned *)v6 inDocumentWordsStack];
                    v85 = [v84 objectAtIndexedSubscript:v83 + v82];

                    v86 = [v259 objectAtIndexedSubscript:v82];
                    v87 = [v258 objectAtIndexedSubscript:v82];
                    v88 = [v85 acceptedCandidate];
                    v89 = [v88 candidate];
                    v277 = v87;
                    if ([v86 isEqualToString:v89])
                    {
                      v90 = [v85 acceptedCandidate];
                      v91 = [v90 input];
                      char v92 = [v87 isEqualToString:v91];

                      if (v92) {
                        goto LABEL_71;
                      }
                    }
                    else
                    {
                    }
                    [(TIDocumentWordsAligned *)v270 removeFromContextMap:v85];
                    v93 = [v273 acceptedCandidate];
                    v94 = [v85 acceptedCandidate];
                    v95 = [v94 input];
                    v96 = [v93 candidateByReplacingWithCandidate:v86 input:v95];
                    [v85 setAcceptedCandidate:v96];

                    v97 = [v85 acceptedCandidate];
                    v98 = [v97 candidate];
                    [v85 setAcceptedString:v98];

                    v99 = (void *)MEMORY[0x1E4FAE2A8];
                    v100 = [v85 documentState];
                    v101 = [v100 selectedText];
                    v102 = [v85 documentState];
                    v103 = [v102 contextAfterInput];
                    v104 = [v99 documentStateWithContextBefore:v76 selectedText:v101 contextAfter:v103];
                    [v85 setDocumentState:v104];

                    objc_msgSend(v85, "setWordEntryType:", objc_msgSend(v85, "wordEntryType") | 1);
                    [v85 setIsRetrocorrection:1];
                    uint64_t v83 = v271;
                    [(TIDocumentWordsAligned *)v270 addToContextMap:v85];
LABEL_71:
                    v105 = [NSString stringWithFormat:@"%@ %@", v76, v86];

                    ++v82;
                    v76 = v105;
                    id v6 = v270;
                    if (v274 == v82)
                    {
                      v106 = [v273 acceptedCandidate];
                      v107 = [v259 lastObject];
                      v108 = [v258 lastObject];
                      v109 = [v106 candidateByReplacingWithCandidate:v107 input:v108];
                      [v273 setAcceptedCandidate:v109];

                      v110 = [v273 acceptedCandidate];
                      v111 = [v110 candidate];
                      [v273 setAcceptedString:v111];

                      v112 = (void *)MEMORY[0x1E4FAE2A8];
                      v113 = [v273 documentState];
                      v114 = [v113 selectedText];
                      v115 = [v273 documentState];
                      v116 = [v115 contextAfterInput];
                      v117 = [v112 documentStateWithContextBefore:v105 selectedText:v114 contextAfter:v116];
                      [v273 setDocumentState:v117];

                      id v3 = v253;
                      v14 = v255;
                      v77 = obj;
                      v64 = v267;
                      goto LABEL_81;
                    }
                  }
                }
              }
              v105 = v76;
              id v6 = v270;
              v14 = v255;
            }
            else
            {
              v105 = v76;
            }
LABEL_81:
          }
          v127 = [v273 documentState];
          uint64_t v128 = [v127 contextBeforeInput];
          v129 = (void *)v128;
          v130 = &stru_1F3F7A998;
          if (v128) {
            v130 = (__CFString *)v128;
          }
          v131 = v130;

          v132 = v131;
          v133 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v134 = [(__CFString *)v131 stringByTrimmingCharactersInSet:v133];
          v135 = [(TIDocumentWordsAligned *)v6 wordsForContext:v134];

          id obja = v135;
          v252 = v132;
          if (![v135 count]
            && ([v262 actionType] != 2
             || ![(TIDocumentWordsAligned *)v6 wordsCount]))
          {
            id v44 = v273;
            [v273 setWordAlignmentConf:3];
            if (v264)
            {
              v147 = [(TIDocumentWordsAligned *)v6 description];
              if ([v251 length])
              {
                uint64_t v148 = [NSString stringWithFormat:@"%@ %@", v147, v132];

                v147 = (void *)v148;
              }
              v149 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v150 = [(__CFString *)v132 stringByTrimmingCharactersInSet:v149];

              if (v150 && ([v147 isEqualToString:v150] & 1) == 0) {
                [v273 setWordAlignmentConf:2];
              }

              v14 = v255;
            }
            goto LABEL_102;
          }
          if ([v262 actionType] == 2
            || [v262 actionType] == 10)
          {
            id v136 = v262;
            v279 = v136;
            if (![v136 extendsPriorWord])
            {
              [v273 setWordAlignmentConf:1];
              if ([v135 count])
              {
                v151 = [v135 objectAtIndexedSubscript:0];
                -[TIDocumentWordsAligned insertWord:atIndex:](v6, "insertWord:atIndex:", v273, [v151 sessionIndex]);
              }
LABEL_150:
              id v267 = v64;

              char v146 = 1;
LABEL_151:
              id v44 = v273;
              goto LABEL_152;
            }
            id v44 = v273;
            v137 = [v273 documentState];

            if (v137)
            {
              v138 = [v273 acceptedCandidate];
              if (([v138 isContinuousPathConversion] & 1) == 0)
              {
                v139 = [v273 allKeyboardInputs];
                uint64_t v140 = [v139 count];

                if (!v140)
                {
                  v141 = [obja lastObject];
                  v142 = [v141 acceptedCandidate];
                  v143 = [v142 candidate];
                  v144 = [v273 acceptedString];
                  int v145 = [v143 isEqualToString:v144];

                  if (v145)
                  {

                    char v146 = 0;
                    id v6 = v270;
                    goto LABEL_152;
                  }
                  v216 = [v273 acceptedCandidate];
                  v217 = [v216 input];
                  v218 = [v141 acceptedCandidate];
                  v219 = [v218 candidate];
                  char v220 = [v217 isEqualToString:v219];

                  if ((v220 & 1) == 0)
                  {

                    char v146 = 0;
                    id v6 = v270;
                    goto LABEL_151;
                  }
                  id v6 = v270;
                }
                goto LABEL_113;
              }
            }
            else
            {
              v157 = [v136 documentState];
              v138 = [v157 contextBeforeInput];

              if ([v136 inWordRange] != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v158 = objc_msgSend(v138, "substringToIndex:", objc_msgSend(v136, "inWordRange"));

                v138 = (void *)v158;
              }
              uint64_t v159 = [(TIDocumentWordsAligned *)v6 wordsForContext:v138];

              id obja = (id)v159;
            }

LABEL_113:
            if ([obja count])
            {
              long long v295 = 0u;
              long long v296 = 0u;
              long long v293 = 0u;
              long long v294 = 0u;
              id v160 = obja;
              id obja = v160;
              uint64_t v276 = [v160 countByEnumeratingWithState:&v293 objects:v304 count:16];
              if (!v276) {
                goto LABEL_147;
              }
              uint64_t v272 = *(void *)v294;
              while (1)
              {
                uint64_t v161 = 0;
                v162 = v279;
                do
                {
                  if (*(void *)v294 != v272) {
                    objc_enumerationMutation(obja);
                  }
                  v163 = *(void **)(*((void *)&v293 + 1) + 8 * v161);
                  v164 = [v163 documentState];
                  uint64_t v165 = [v164 contextBeforeInput];

                  if (v165) {
                    v166 = (__CFString *)v165;
                  }
                  else {
                    v166 = &stru_1F3F7A998;
                  }
                  v167 = NSString;
                  v168 = [v163 acceptedString];
                  v169 = [v167 stringWithFormat:@"%@%@", v166, v168];

                  v170 = [v162 inWord];
                  v171 = [v163 acceptedString];
                  int v172 = [v170 isEqualToString:v171];

                  if (v172)
                  {
                    v173 = [v162 documentState];
                    v174 = [v173 contextBeforeInput];

                    v175 = [v162 documentState];
                    v176 = [v175 contextAfterInput];

                    if (v176)
                    {
                      v177 = [v162 documentState];
                      v178 = [v177 contextBeforeInput];
                      [v162 documentState];
                      v268 = v166;
                      v179 = v169;
                      v181 = v180 = v64;
                      v182 = [v181 contextAfterInput];
                      uint64_t v183 = [v178 stringByAppendingString:v182];

                      v162 = v279;
                      v64 = v180;
                      v169 = v179;
                      v166 = v268;

                      v174 = (void *)v183;
                      id v6 = v270;
                    }
                    if ([v162 inWordRange] != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v184 = [v162 inWordRange];
                      v185 = v162;
                      uint64_t v186 = v184;
                      [v185 inWordRange];
                      uint64_t v188 = v187 + v186;
                      if (v187 + v186 <= (unint64_t)[v174 length])
                      {
                        v191 = [v174 substringToIndex:v188];
                        v162 = v279;
                        if ([v191 isEqualToString:v169])
                        {
                          [v163 addUserEdit:v273];
                          objc_msgSend(v163, "setEditActionType:", objc_msgSend(v279, "actionType"));
                          objc_msgSend(v163, "setEditActionExtendsPriorWord:", objc_msgSend(v279, "extendsPriorWord"));
                          [v163 setWordAlignmentConf:3];
                        }
                      }
                      else
                      {
                        v162 = v279;
                      }
                    }
                    goto LABEL_144;
                  }
                  if (v269)
                  {
                    v189 = [v64 inWord];
                    v190 = [v163 acceptedString];
                    if ([v189 isEqualToString:v190])
                    {

LABEL_135:
                      [v163 addUserEdit:v273];
                      v162 = v279;
                      objc_msgSend(v163, "setEditActionType:", objc_msgSend(v279, "actionType"));
                      objc_msgSend(v163, "setEditActionExtendsPriorWord:", objc_msgSend(v279, "extendsPriorWord"));
                      [v163 setWordAlignmentConf:3];
                      char v269 = 0;
                      v174 = v64;
                      v64 = 0;
                      goto LABEL_144;
                    }
                    int v192 = [v273 wordEntryType] & 0xC0;

                    if (v192) {
                      goto LABEL_135;
                    }
                  }
                  v193 = [v273 documentState];
                  v194 = [v193 contextAfterInput];
                  if (v194)
                  {
                  }
                  else
                  {
                    v195 = [(TIDocumentWordsAligned *)v6 lastWord];
                    v196 = [v163 acceptedCandidate];
                    v197 = [v196 candidate];
                    char v198 = [v195 isEqualToString:v197];

                    if (v198)
                    {
                      id v6 = v270;
                      v162 = v279;
                      goto LABEL_145;
                    }
                  }
                  [v263 appendString:@"<BOS>"];
                  v199 = [v273 documentState];
                  uint64_t v200 = [v199 contextBeforeInput];
                  v201 = (void *)v200;
                  if (v200) {
                    v202 = (__CFString *)v200;
                  }
                  else {
                    v202 = &stru_1F3F7A998;
                  }
                  v174 = [v263 stringByAppendingString:v202];

                  v203 = [MEMORY[0x1E4FAE2A8] documentStateWithContextBefore:v174 selectedText:0 contextAfter:0];
                  [v273 setDocumentState:v203];

                  id v6 = v270;
                  [(TIDocumentWordsAligned *)v270 pushWordToDocument:v273];
                  v162 = v279;
LABEL_144:

LABEL_145:
                  ++v161;
                }
                while (v276 != v161);
                id v160 = obja;
                uint64_t v276 = [obja countByEnumeratingWithState:&v293 objects:v304 count:16];
                if (!v276)
                {
LABEL_147:

                  id v3 = v253;
                  v14 = v255;
                  goto LABEL_150;
                }
              }
            }
            v204 = [v273 documentState];
            v205 = [v204 contextAfterInput];

            if (!v205) {
              [(TIDocumentWordsAligned *)v6 pushWordToDocument:v273];
            }
            goto LABEL_150;
          }
          if ((([v135 count] != 0) & v254) != 1)
          {
            id v44 = v273;
            v208 = [v273 documentState];
            v209 = [v208 contextAfterInput];
            uint64_t v210 = [v209 length];

            if (v210) {
              goto LABEL_103;
            }
            if ([v262 actionType]
              || ![(TITypingSessionAligned *)self isNewLineScenarioWithCurrentWord:v273 andPreviousWord:v262])
            {
              v211 = [v273 documentState];
              v212 = [v211 contextBeforeInput];
              id v213 = [(TIDocumentWordsAligned *)v6 deleteWordsUpToContext:v212];
            }
LABEL_102:
            [(TIDocumentWordsAligned *)v6 pushWordToDocument:v44];
LABEL_103:
            char v146 = 1;
            goto LABEL_152;
          }
          v152 = [v135 firstObject];
          id v44 = v273;
          v153 = [v273 documentState];
          uint64_t v154 = [v153 contextAfterInput];
          if (v154)
          {
            v155 = (void *)v154;
            v156 = 0;
          }
          else
          {
            if ([v262 actionType])
            {
            }
            else
            {
              BOOL v222 = [(TITypingSessionAligned *)self isNewLineScenarioWithCurrentWord:v273 andPreviousWord:v262];

              if (v222)
              {
                v156 = 0;
                goto LABEL_186;
              }
            }
            v153 = [v273 documentState];
            v155 = [v153 contextBeforeInput];
            v156 = [(TIDocumentWordsAligned *)v270 deleteWordsUpToContext:v155];
          }

LABEL_186:
          long long v291 = 0u;
          long long v292 = 0u;
          long long v289 = 0u;
          long long v290 = 0u;
          v223 = [v273 allKeyboardInputs];
          uint64_t v224 = [v223 countByEnumeratingWithState:&v289 objects:v303 count:16];
          if (v224)
          {
            uint64_t v225 = v224;
            uint64_t v226 = *(void *)v290;
            while (2)
            {
              for (uint64_t k = 0; k != v225; ++k)
              {
                if (*(void *)v290 != v226) {
                  objc_enumerationMutation(v223);
                }
                if ([*(id *)(*((void *)&v289 + 1) + 8 * k) isBackspace])
                {
                  char v228 = 1;
                  goto LABEL_196;
                }
              }
              uint64_t v225 = [v223 countByEnumeratingWithState:&v289 objects:v303 count:16];
              if (v225) {
                continue;
              }
              break;
            }
            char v228 = 0;
LABEL_196:
            id v3 = v253;
          }
          else
          {
            char v228 = 0;
          }

          v229 = [v273 acceptedCandidate];
          char v254 = [v229 isContinuousPathConversion];
          if (v254)
          {
            v230 = v273;
          }
          else
          {
            if (v228)
            {
            }
            else
            {
              int v231 = [v262 actionType];

              if (v231 != 1)
              {
                char v254 = 1;
                v230 = v273;
LABEL_222:
                [(TIDocumentWordsAligned *)v270 pushWordToDocument:v230];
                goto LABEL_223;
              }
            }
            [v152 addUserEdit:v273];
            v232 = [v152 editedEntry];
            [v232 setExtendsPriorWord:1];

            objc_msgSend(v152, "setEditActionType:", objc_msgSend(v262, "actionType"));
            BOOL v233 = (objc_opt_respondsToSelector() & 1) != 0
                && [v262 performSelector:sel_extendsPriorWord] != 0;
            [v152 setEditActionExtendsPriorWord:v233];
            if (![v156 count])
            {
              char v254 = 0;
LABEL_223:

              char v146 = 1;
              id v6 = v270;
              v14 = v255;
LABEL_152:

              if ((v146 & 1) == 0) {
                goto LABEL_180;
              }
              goto LABEL_179;
            }
            [v152 setDeleted:0];
            long long v287 = 0u;
            long long v288 = 0u;
            long long v285 = 0u;
            long long v286 = 0u;
            v229 = [v152 allEdits];
            uint64_t v234 = [v229 countByEnumeratingWithState:&v285 objects:v302 count:16];
            if (v234)
            {
              uint64_t v235 = v234;
              uint64_t v236 = *(void *)v286;
              do
              {
                for (uint64_t m = 0; m != v235; ++m)
                {
                  if (*(void *)v286 != v236) {
                    objc_enumerationMutation(v229);
                  }
                  [*(id *)(*((void *)&v285 + 1) + 8 * m) setDeleted:0];
                }
                uint64_t v235 = [v229 countByEnumeratingWithState:&v285 objects:v302 count:16];
              }
              while (v235);
              v230 = v152;
              id v3 = v253;
            }
            else
            {
              v230 = v152;
            }
          }

          goto LABEL_222;
        }
      }
      else
      {

        v64 = v267;
      }
      v254 |= [v262 actionType] == 1;
      goto LABEL_58;
    }
    id v267 = 0;
    id v44 = 0;
    v262 = 0;
    v14 = 0;
LABEL_225:
    v256 = v14;
    int v238 = [(TIDocumentWordsAligned *)v6 wordsCount];
    [(TITypingSessionAligned *)self setFirstCPEntryIndex:-1];
    if (v238 >= 1)
    {
      uint64_t v239 = 0;
      uint64_t v240 = v238;
      do
      {
        v241 = [(TIDocumentWordsAligned *)v270 inDocumentWordsStack];
        v242 = [v241 objectAtIndexedSubscript:v239];

        if ([v242 origin] != 1
          || ([v242 allEdits],
              v243 = objc_claimAutoreleasedReturnValue(),
              [v243 firstObject],
              uint64_t v244 = objc_claimAutoreleasedReturnValue(),
              v242,
              v243,
              (v242 = (void *)v244) != 0))
        {
          v245 = +[TITypingSessionAligned alignedEntryForWord:v242];
          v246 = [v245 completeString];
          uint64_t v247 = [v246 length];

          if (v247)
          {
            [(NSArray *)v250 addObject:v245];
            if ([v245 isContinuousPathConversion])
            {
              if ([(TITypingSessionAligned *)self firstCPEntryIndex] == -1)
              {
                [(TITypingSessionAligned *)self setFirstCPEntryIndex:v239];
                [(TITypingSessionAligned *)self setContainsCPEntries:1];
              }
            }
          }
        }
        ++v239;
      }
      while (v240 != v239);
    }

    alignedEntries = self->_alignedEntries;
    self->_alignedEntries = v250;

    id v3 = v253;
  }
}

- (id)textToAppendForEntry:(id)a3 sessionIndx:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!a4) {
    goto LABEL_4;
  }
  v7 = [v5 originalWord];
  if ([v7 isPunctuationEntryFollowingAWord])
  {
    uint64_t v8 = [v6 originalWord];
    char v9 = [v8 acceptedString];
    unint64_t v10 = [v9 length];

    if (v10 <= 1)
    {
LABEL_4:
      v11 = [v6 expectedString];
      goto LABEL_7;
    }
  }
  else
  {
  }
  v12 = NSString;
  v13 = [v6 expectedString];
  v11 = [v12 stringWithFormat:@" %@", v13];

LABEL_7:

  return v11;
}

- (void)getAlignedTextAndConfidence
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__8191;
  v25 = __Block_byref_object_dispose__8192;
  uint64_t v26 = &stru_1F3F7A998;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  id v3 = [(TITypingSessionAligned *)self alignedEntries];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke;
  v18[3] = &unk_1E6E2B228;
  v18[4] = self;
  v18[5] = &v21;
  v18[6] = v19;
  [v3 enumerateObjectsUsingBlock:v18];

  objc_storeStrong((id *)&self->_alignedText, (id)v22[5]);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8191;
  uint64_t v16 = __Block_byref_object_dispose__8192;
  v17 = &stru_1F3F7A998;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_2;
  aBlock[3] = &unk_1E6E2B250;
  aBlock[4] = &v12;
  v4 = _Block_copy(aBlock);
  id v5 = [(TITypingSessionAligned *)self alignedEntries];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_3;
  v9[3] = &unk_1E6E2B278;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v9];

  objc_storeStrong((id *)&self->_completeText, (id)v13[5]);
  v7 = [(TITypingSessionAligned *)self alignedEntries];
  uint64_t v8 = [v7 lastObject];

  self->_success = [v8 inSessionAlignmentConfidence] == 3;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

void __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  id v6 = [v29 originalWord];
  v7 = [v6 documentContextBeforeInput];

  if ([*(id *)(a1 + 32) compareForConfidenceContextA:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) contextB:v7])uint64_t v8 = 3; {
  else
  }
    uint64_t v8 = 1;
  [v29 setInSessionAlignmentConfidence:v8];
  char v9 = [v29 expectedString];
  uint64_t v10 = [v9 length];

  v11 = v29;
  if (v10)
  {
    uint64_t v12 = [v29 expectedString];
    char v13 = [v12 endsInPunctuation];

    uint64_t v14 = v29;
    if (a3)
    {
      v15 = [v29 originalWord];
      int v16 = [v15 isPunctuationEntryFollowingAWord];
      char v17 = v16;
      if (v16)
      {
        uint64_t v12 = [v29 originalWord];
        id v3 = [v12 acceptedString];
        if ((unint64_t)[v3 length] < 2) {
          goto LABEL_13;
        }
      }
      v18 = [v29 expectedString];
      if ([v18 length] == 1) {
        char v19 = v13;
      }
      else {
        char v19 = 0;
      }
      if (v19)
      {

        if ((v17 & 1) == 0)
        {
LABEL_14:

          uint64_t v14 = v29;
          goto LABEL_18;
        }
LABEL_13:

        goto LABEL_14;
      }
      char v20 = [v29 originalWord];
      uint64_t v21 = [v20 acceptedCandidate];
      char v22 = [v21 isMecabraCandidate];

      if (v17)
      {
      }
      uint64_t v14 = v29;
      if ((v22 & 1) == 0)
      {
        v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v24 = [v29 expectedString];
        [v28 stringByAppendingFormat:@" %@", v24];
        goto LABEL_19;
      }
    }
LABEL_18:
    uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v24 = [v14 expectedString];
    [v23 stringByAppendingFormat:@"%@", v24];
    uint64_t v25 = LABEL_19:;
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    v11 = v29;
  }
  if ([v11 inSessionAlignmentConfidence] != 3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_2(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 originalWord];
  v4 = [v3 keyboardState];
  char v5 = [v4 emojiSearchMode];

  if ((v5 & 1) == 0)
  {
    id v6 = [v19 originalWord];
    v7 = [v6 editedEntry];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v19 originalWord];
    }
    uint64_t v10 = v9;

    if ([v10 isPeriodFromDoubleSpaceEntry]
      && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) endsInWhitespace])
    {
      uint64_t v11 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "length") - 1);
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      char v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v15 = [v19 completeString];
    uint64_t v16 = [v14 stringByAppendingString:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

uint64_t __53__TITypingSessionAligned_getAlignedTextAndConfidence__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)compareForConfidenceContextA:(id)a3 contextB:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v8 = [v5 stringByTrimmingCharactersInSet:v7];

    id v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v6 stringByTrimmingCharactersInSet:v9];

    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v12 = [v8 componentsSeparatedByCharactersInSet:v11];

    char v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v14 = [v10 componentsSeparatedByCharactersInSet:v13];

    char v22 = v10;
    uint64_t v23 = v8;
    if ([v12 count])
    {
      unint64_t v15 = 0;
      int v16 = 0;
      int v17 = 0;
      while (objc_msgSend(v14, "count", v22, v23) > (unint64_t)v16)
      {
        v18 = [v12 objectAtIndexedSubscript:v15];
        id v19 = [v14 objectAtIndexedSubscript:v16];
        if (([v18 isEqualToString:&stru_1F3F7A998] & 1) != 0
          || [v18 isEqualToString:@" "])
        {
          ++v17;
        }
        else
        {
          if (([v19 isEqualToString:&stru_1F3F7A998] & 1) == 0
            && ![v19 isEqualToString:@" "])
          {
            if (([v18 isEqualToString:v19] & 1) == 0)
            {

              goto LABEL_18;
            }
            ++v17;
          }
          ++v16;
        }

        unint64_t v15 = v17;
        if ([v12 count] <= (unint64_t)v17) {
          break;
        }
      }
    }
    else
    {
      int v16 = 0;
      unint64_t v15 = 0;
    }
    if (objc_msgSend(v12, "count", v22, v23) <= v15) {
      BOOL v20 = [v14 count] <= (unint64_t)v16;
    }
    else {
LABEL_18:
    }
      BOOL v20 = 0;
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (TITypingSessionAligned)initWithSession:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TITypingSessionAligned;
  id v5 = [(TITypingSessionAligned *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    [(TITypingSessionAligned *)v5 computeAlignedWordsFromSession:v4];
    uint64_t v7 = [v4 layouts];
    layouts = v6->_layouts;
    v6->_layouts = (NSArray *)v7;

    uint64_t v9 = [v4 locale];
    locale = v6->_locale;
    v6->_locale = (NSLocale *)v9;

    [(TITypingSessionAligned *)v6 getAlignedTextAndConfidence];
  }

  return v6;
}

- (id)restrictedAlignedSessionWithWordLimit:(unint64_t)a3
{
  id v5 = [(TITypingSessionAligned *)self alignedEntries];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = objc_alloc_init(TITypingSessionAligned);
    uint64_t v8 = [(TITypingSessionAligned *)self alignedEntries];
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, a3);
    [(TITypingSessionAligned *)v7 setAlignedEntries:v9];

    uint64_t v10 = [(TITypingSessionAligned *)self alignedText];
    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    objc_super v12 = [v10 componentsSeparatedByCharactersInSet:v11];

    unint64_t v13 = [v12 count];
    if (v13 >= a3) {
      unint64_t v14 = a3;
    }
    else {
      unint64_t v14 = v13;
    }
    unint64_t v15 = objc_msgSend(v12, "subarrayWithRange:", 0, v14);
    uint64_t v16 = [(TITypingSessionAligned *)self layouts];
    layouts = v7->_layouts;
    v7->_layouts = (NSArray *)v16;

    uint64_t v18 = [v15 componentsJoinedByString:@" "];
    alignedText = v7->_alignedText;
    v7->_alignedText = (NSString *)v18;

    uint64_t v20 = [(TITypingSessionAligned *)self locale];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v20;

    v7->_success = [(TITypingSessionAligned *)self success];
    char v22 = [(TITypingSessionAligned *)v7 alignedText];
    unint64_t v23 = [v22 length];
    uint64_t v24 = [(TITypingSessionAligned *)self highConfAlignedSubSegment];
    if (v23 >= [v24 length]) {
      [(TITypingSessionAligned *)self highConfAlignedSubSegment];
    }
    else {
    uint64_t v25 = [(TITypingSessionAligned *)v7 alignedText];
    }
    highConfAlignedSubSegment = v7->_highConfAlignedSubSegment;
    v7->_highConfAlignedSubSegment = (NSString *)v25;

    BOOL v27 = [(TITypingSessionAligned *)self firstCPEntryIndex] < a3
       && [(TITypingSessionAligned *)self containsCPEntries];
    v7->_containsCPEntries = v27;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  alignedEntries = self->_alignedEntries;
  id v5 = a3;
  [v5 encodeObject:alignedEntries forKey:@"alignedEntries"];
  [v5 encodeObject:self->_alignedText forKey:@"alignedText"];
  [v5 encodeObject:self->_highConfAlignedSubSegment forKey:@"highConfAlignedSubSegment"];
  [v5 encodeBool:self->_success forKey:@"success"];
  [v5 encodeObject:self->_layouts forKey:@"layouts"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeBool:self->_containsCPEntries forKey:@"containsCPEntries"];
}

- (TITypingSessionAligned)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TITypingSessionAligned;
  id v5 = [(TITypingSessionAligned *)&v23 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"alignedEntries"];
    alignedEntries = v5->_alignedEntries;
    v5->_alignedEntries = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alignedText"];
    alignedText = v5->_alignedText;
    v5->_alignedText = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highConfAlignedSubSegment"];
    highConfAlignedSubSegment = v5->_highConfAlignedSubSegment;
    v5->_highConfAlignedSubSegment = (NSString *)v13;

    v5->_success = [v4 decodeBoolForKey:@"success"];
    unint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    int v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"layouts"];
    layouts = v5->_layouts;
    v5->_layouts = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v20;

    v5->_containsCPEntries = [v4 decodeBoolForKey:@"containsCPEntries"];
  }

  return v5;
}

+ (id)resolveBackspacesInKeyboardInputs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v4, "lastObject", (void)v14);
        if (v11 && [v10 isBackspace] && (objc_msgSend(v11, "isBackspace") & 1) == 0) {
          [v4 removeLastObject];
        }
        else {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  return v4;
}

+ (id)completeStringFromWordEntry:(id)a3 leadingInputs:(id)a4 trailingInputs:(id)a5 followsContinuousPath:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 acceptedCandidate];
  if ([v9 isPeriodFromDoubleSpaceEntry])
  {
    uint64_t v13 = @". ";
    goto LABEL_54;
  }
  id v46 = v10;
  BOOL v47 = v6;
  if (!v10)
  {
    uint64_t v18 = &stru_1F3F7A998;
    goto LABEL_20;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (!v15)
  {
    uint64_t v18 = &stru_1F3F7A998;
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v53;
  uint64_t v18 = &stru_1F3F7A998;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v53 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      if ([v20 isBackspace])
      {
        if (![(__CFString *)v18 length]) {
          continue;
        }
        uint64_t v21 = [(__CFString *)v18 substringToIndex:[(__CFString *)v18 length] - 1];
      }
      else
      {
        uint64_t v22 = [v20 string];
        uint64_t v21 = [(__CFString *)v18 stringByAppendingString:v22];

        uint64_t v18 = (__CFString *)v22;
      }

      uint64_t v18 = (__CFString *)v21;
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
  }
  while (v16);
LABEL_19:

  BOOL v6 = v47;
LABEL_20:
  uint64_t v23 = [v12 candidate];
  uint64_t v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = &stru_1F3F7A998;
  }
  uint64_t v26 = v25;

  if ([(__CFString *)v26 endsInPunctuation])
  {
    uint64_t v27 = [(__CFString *)v26 substringToIndex:[(__CFString *)v26 length] - 1];

    uint64_t v26 = (__CFString *)v27;
  }
  if ([v12 isContinuousPathConversion])
  {
    if ([(__CFString *)v18 length])
    {
      uint64_t v28 = [(__CFString *)v26 characterAtIndex:0];
      if (v28 == [(__CFString *)v18 characterAtIndex:[(__CFString *)v18 length] - 1])
      {
        id v29 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        int v30 = [v29 characterIsMember:v28];

        if (v30)
        {
          uint64_t v31 = [(__CFString *)v26 substringFromIndex:1];

          uint64_t v26 = (__CFString *)v31;
        }
      }
    }
  }
  if (!-[__CFString length](v18, "length") && v6 && ([v12 isMecabraCandidate] & 1) == 0)
  {
    if ([(__CFString *)v26 length])
    {
      uint64_t v32 = [(__CFString *)v26 characterAtIndex:0];
      v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      LOBYTE(v32) = [v33 characterIsMember:v32];

      if ((v32 & 1) == 0)
      {
        uint64_t v34 = [(__CFString *)v18 stringByAppendingString:@" "];

        uint64_t v18 = (__CFString *)v34;
      }
    }
  }
  uint64_t v13 = [(__CFString *)v18 stringByAppendingString:v26];

  if (v11)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v45 = v11;
    id v35 = v11;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v49;
      do
      {
        uint64_t v39 = 0;
        v40 = v13;
        do
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v35);
          }
          v41 = [*(id *)(*((void *)&v48 + 1) + 8 * v39) string];
          uint64_t v13 = [(__CFString *)v40 stringByAppendingString:v41];

          ++v39;
          v40 = v13;
        }
        while (v37 != v39);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v37);
    }

    id v11 = v45;
    LOBYTE(v6) = v47;
  }
  if ([v9 unfinishedWordEntryTreatment] != 1 || v6)
  {
    if ([v9 unfinishedWordEntryTreatment] == 2
      && ([(__CFString *)v13 endsInWhitespace] & 1) == 0)
    {
      uint64_t v42 = [(__CFString *)v13 stringByAppendingString:@" "];
LABEL_52:
      v43 = (__CFString *)v42;

      uint64_t v13 = v43;
    }
  }
  else if ([(__CFString *)v13 endsInWhitespace])
  {
    uint64_t v42 = [(__CFString *)v13 substringToIndex:[(__CFString *)v13 length] - 1];
    goto LABEL_52;
  }

  id v10 = v46;
LABEL_54:

  return v13;
}

+ (id)alignedPathTouchesForWord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(TIWordEntryAligned);
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__8191;
  v27[4] = __Block_byref_object_dispose__8192;
  id v28 = 0;
  BOOL v6 = [v3 allTouches];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke;
  v24[3] = &unk_1E6E2B2F0;
  uint64_t v26 = v27;
  id v7 = v5;
  id v25 = v7;
  [v6 enumerateObjectsUsingBlock:v24];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke_2;
  v18[3] = &unk_1E6E2B318;
  v18[4] = v23;
  v18[5] = &v19;
  [v7 enumerateObjectsUsingBlock:v18];
  unint64_t v8 = v20[3];
  if (v8 < [v7 count])
  {
    id v9 = [v7 objectAtIndexedSubscript:v20[3]];
    [(TIWordEntryAligned *)v4 setAlignedTouches:v9];
  }
  [(TIWordEntryAligned *)v4 setIsContinuousPathConversion:1];
  uint64_t v10 = [v3 editedEntry];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = v3;
  }
  id v13 = v12;

  id v14 = [v13 acceptedString];
  [(TIWordEntryAligned *)v4 setExpectedString:v14];

  uint64_t v15 = [v3 allKeyboardInputs];
  uint64_t v16 = +[TITypingSessionAligned completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:](TITypingSessionAligned, "completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:", v13, v15, 0, [v13 followsContinuousPath]);
  [(TIWordEntryAligned *)v4 setCompleteString:v16];

  [(TIWordEntryAligned *)v4 setOriginalWord:v3];
  [v3 setOriginalWordInAlignment:1];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v27, 8);

  return v4;
}

void __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (![v8 stage])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  if (([v8 stage] == 2
     || [v8 stage] == 3
     || [v8 stage] == 4)
    && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __52__TITypingSessionAligned_alignedPathTouchesForWord___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[v5 count] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 count];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

+ (id)alignedEntryForWord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 acceptedCandidate];
  int v5 = [v4 isContinuousPathConversion];

  if (v5)
  {
    uint64_t v6 = +[TITypingSessionAligned alignedPathTouchesForWord:v3];
    goto LABEL_32;
  }
  uint64_t v6 = objc_alloc_init(TIWordEntryAligned);
  id v7 = [v3 allKeyboardInputs];
  id v8 = +[TITypingSessionAligned resolveBackspacesInKeyboardInputs:v7];

  id v9 = [v3 inputTriggeredTextAccepted];

  if (v9)
  {
    uint64_t v10 = [v3 inputTriggeredTextAccepted];
    [v8 removeObject:v10];
  }
  id v11 = [v3 editedEntry];

  if (v11)
  {
    if ([v3 editActionType] == 2
      && ([v3 editActionExtendsPriorWord] & 1) != 0)
    {
      int v12 = 0;
    }
    else
    {
      id v11 = [v3 editedEntry];
      if (([v11 extendsPriorWord] & 1) == 0)
      {

LABEL_25:
        id v28 = [v3 editedEntry];
        id v29 = [v28 acceptedString];
        [(TIWordEntryAligned *)v6 setExpectedString:v29];

        goto LABEL_26;
      }
      int v12 = 1;
    }
    id v13 = [v3 editedEntry];
    id v14 = [v13 allKeyboardInputs];
    uint64_t v15 = [v14 count];

    if (v12) {
    if (v15)
    }
    {
      uint64_t v16 = [v3 editedEntry];
      uint64_t v17 = [v16 allKeyboardInputs];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        do
        {
          uint64_t v20 = [v3 editedEntry];
          uint64_t v21 = [v20 allKeyboardInputs];
          uint64_t v22 = [v21 objectAtIndexedSubscript:v19];

          uint64_t v23 = [v3 editedEntry];
          uint64_t v24 = [v23 inputTriggeredTextAccepted];

          if (v22 != v24)
          {
            if ([v22 isBackspace])
            {
              if ([v8 count]) {
                [v8 removeLastObject];
              }
            }
            else
            {
              [v8 addObject:v22];
            }
          }

          ++v19;
          id v25 = [v3 editedEntry];
          uint64_t v26 = [v25 allKeyboardInputs];
          unint64_t v27 = [v26 count];
        }
        while (v27 > v19);
      }
    }
    goto LABEL_25;
  }
  id v28 = [v3 acceptedString];
  [(TIWordEntryAligned *)v6 setExpectedString:v28];
LABEL_26:

  [(TIWordEntryAligned *)v6 setAlignedKeyboardInputs:v8];
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  int v54 = -1;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  int v52 = -1;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __46__TITypingSessionAligned_alignedEntryForWord___block_invoke;
  v50[3] = &unk_1E6E2B2A0;
  v50[4] = v53;
  v50[5] = v51;
  [v8 enumerateObjectsUsingBlock:v50];
  int v30 = objc_opt_new();
  uint64_t v31 = objc_opt_new();
  uint64_t v42 = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  id v44 = __46__TITypingSessionAligned_alignedEntryForWord___block_invoke_2;
  id v45 = &unk_1E6E2B2C8;
  long long v48 = v53;
  long long v49 = v51;
  id v46 = v30;
  id v32 = v31;
  id v47 = v32;
  id v33 = v30;
  [v8 enumerateObjectsUsingBlock:&v42];
  uint64_t v34 = objc_msgSend(v3, "editedEntry", v42, v43, v44, v45);
  id v35 = (void *)v34;
  if (v34) {
    uint64_t v36 = (void *)v34;
  }
  else {
    uint64_t v36 = v3;
  }
  id v37 = v36;

  uint64_t v38 = [v37 inputTriggeredTextAccepted];

  if (v38)
  {
    uint64_t v39 = [v37 inputTriggeredTextAccepted];
    [v32 addObject:v39];
  }
  v40 = +[TITypingSessionAligned completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:](TITypingSessionAligned, "completeStringFromWordEntry:leadingInputs:trailingInputs:followsContinuousPath:", v37, v33, v32, [v37 followsContinuousPath]);
  [(TIWordEntryAligned *)v6 setCompleteString:v40];

  [(TIWordEntryAligned *)v6 setOriginalWord:v3];
  [v3 setOriginalWordInAlignment:1];

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

LABEL_32:

  return v6;
}

void __46__TITypingSessionAligned_alignedEntryForWord___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v20 = a2;
  int v5 = [v20 string];
  uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  if (![v7 length]) {
    goto LABEL_10;
  }
  id v8 = [v20 string];
  id v9 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
  if (![v10 length])
  {
LABEL_9:

LABEL_10:
    uint64_t v15 = v20;
    goto LABEL_11;
  }
  uint64_t v19 = a1;
  id v11 = [v20 string];
  int v12 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v13 = [v11 stringByTrimmingCharactersInSet:v12];
  if (![v13 length])
  {

    goto LABEL_9;
  }
  int v17 = a3;
  id v14 = [v20 string];
  char v18 = [v14 _containsEmoji];

  uint64_t v15 = v20;
  if ((v18 & 1) == 0)
  {
    uint64_t v16 = *(void *)(*(void *)(v19 + 32) + 8);
    if (*(_DWORD *)(v16 + 24) == -1) {
      *(_DWORD *)(v16 + 24) = v17;
    }
    *(_DWORD *)(*(void *)(*(void *)(v19 + 40) + 8) + 24) = v17 + 1;
  }
LABEL_11:
}

uint64_t __46__TITypingSessionAligned_alignedEntryForWord___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  unint64_t v7 = *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v8 = v7 == -1 || v7 > a3;
  id v10 = v5;
  if (v8)
  {
    id v5 = (id)[*(id *)(a1 + 32) addObject:v5];
    id v6 = v10;
  }
  if (*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= a3)
  {
    id v5 = (id)[*(id *)(a1 + 40) addObject:v10];
    id v6 = v10;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end