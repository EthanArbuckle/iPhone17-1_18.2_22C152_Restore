@interface CRWrappingEvaluationResult
- (BOOL)bothBeginWithDigits;
- (BOOL)centerAligned;
- (BOOL)contextNoText;
- (BOOL)continuesToNewColumn;
- (BOOL)contributesToVerticalSpacing;
- (BOOL)eosLMScoreSet;
- (BOOL)excessiveVerticalDistance;
- (BOOL)f1EndsWithDD;
- (BOOL)f2BeginsWithDD;
- (BOOL)f2FullyDD;
- (BOOL)f2StartOfSentence;
- (BOOL)featureInTestNoText;
- (BOOL)featureTokensSet;
- (BOOL)isHyphenatedPrefixOfWord;
- (BOOL)isOversegmented;
- (BOOL)leadingAligned;
- (BOOL)lmScoreSet;
- (BOOL)matchingLocales;
- (BOOL)midSentencePunctuated;
- (BOOL)multilineDD;
- (BOOL)oversegmentedListItem;
- (BOOL)shouldAllowWhitespaceDelimiter;
- (BOOL)similarAngles;
- (BOOL)similarHeights;
- (CGSize)featureInTestSize;
- (CGSize)imageSize;
- (CGSize)lastFeatureSize;
- (CRLineWrappable)featureInTest;
- (CRLineWrappingContext)context;
- (CRLineWrappingParameters)parameters;
- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6;
- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6 skipTextComputation:(BOOL)a7;
- (NSString)paragraphText;
- (NSString)sentencePuncStringToCheck;
- (double)cachedEOSLMScore;
- (double)cachedLMScore;
- (double)eosLMScore;
- (double)lmScore;
- (double)verticalSpacing;
- (double)verticalSpacingToHeightRatio;
- (double)widthGrowth;
- (float)angleDiff;
- (float)horizontalOverlap;
- (float)leftDistance;
- (float)midDistance;
- (float)newParagraphIndentDistanceRatio;
- (float)rightDistance;
- (float)textHeightRatio;
- (float)textWidthRatio;
- (float)topDistanceLeft;
- (float)topDistanceRight;
- (float)topDistanceRightToBottomLeft;
- (float)verticalOverlap;
- (float)xSpace;
- (float)ySpace;
- (id).cxx_construct;
- (id)_spaceSeparatedTokens:(id)a3;
- (id)description;
- (id)resultByMerging:(id)a3;
- (int64_t)_tokenCountForString:(id)a3;
- (int64_t)caseWrappingScoreUsingCustomConfiguration:(BOOL)a3;
- (int64_t)punctuationWrappingScoreUsingCustomConfiguration:(BOOL)a3;
- (int64_t)textBasedEvaluation;
- (int64_t)textContentWrappingScore;
- (int64_t)tokenCountDiff;
- (int64_t)wordCountWrappingScore;
- (vector<unsigned)cachedFeatureTokens;
- (vector<unsigned)featureTokens;
- (void)_computeCharLMScores;
- (void)_computeDDPropertiesWithContext:(id)a3;
- (void)_computeGeometricProperties;
- (void)_computeIsHyphenatedPrefixOfWord:(id)a3;
- (void)_computeLMScoreComputingEOS:(BOOL)a3;
- (void)_computeNoTextWithContext:(id)a3;
- (void)_setParagraphTextWithString:(id)a3 context:(id)a4;
- (void)setAngleDiff:(float)a3;
- (void)setBothBeginWithDigits:(BOOL)a3;
- (void)setCachedEOSLMScore:(double)a3;
- (void)setCachedFeatureTokens:(vector<unsigned)int;
- (void)setCachedLMScore:(double)a3;
- (void)setCenterAligned:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setContextNoText:(BOOL)a3;
- (void)setContinuesToNewColumn:(BOOL)a3;
- (void)setEosLMScoreSet:(BOOL)a3;
- (void)setF1EndsWithDD:(BOOL)a3;
- (void)setF2BeginsWithDD:(BOOL)a3;
- (void)setF2FullyDD:(BOOL)a3;
- (void)setF2StartOfSentence:(BOOL)a3;
- (void)setFeatureInTest:(id)a3;
- (void)setFeatureInTestNoText:(BOOL)a3;
- (void)setFeatureInTestSize:(CGSize)a3;
- (void)setFeatureTokensSet:(BOOL)a3;
- (void)setHorizontalOverlap:(float)a3;
- (void)setIsOversegmented:(BOOL)a3;
- (void)setLastFeatureSize:(CGSize)a3;
- (void)setLeadingAligned:(BOOL)a3;
- (void)setLeftDistance:(float)a3;
- (void)setLmScoreSet:(BOOL)a3;
- (void)setMatchingLocales:(BOOL)a3;
- (void)setMidDistance:(float)a3;
- (void)setMidSentencePunctuated:(BOOL)a3;
- (void)setMultilineDD:(BOOL)a3;
- (void)setNewParagraphIndentDistanceRatio:(float)a3;
- (void)setOversegmentedListItem:(BOOL)a3;
- (void)setParagraphText:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRightDistance:(float)a3;
- (void)setSentencePuncStringToCheck:(id)a3;
- (void)setTextHeightRatio:(float)a3;
- (void)setTextWidthRatio:(float)a3;
- (void)setTopDistanceLeft:(float)a3;
- (void)setTopDistanceRight:(float)a3;
- (void)setTopDistanceRightToBottomLeft:(float)a3;
- (void)setVerticalOverlap:(float)a3;
- (void)setVerticalSpacing:(double)a3;
- (void)setXSpace:(float)a3;
- (void)setYSpace:(float)a3;
@end

@implementation CRWrappingEvaluationResult

- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6
{
  return -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:skipTextComputation:](self, "initWithTextFeature:context:imageSize:parameters:skipTextComputation:", a3, a4, a6, 0, a5.width, a5.height);
}

- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6 skipTextComputation:(BOOL)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CRWrappingEvaluationResult;
  v17 = [(CRWrappingEvaluationResult *)&v28 init];
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    p_featureInTest = (id *)&v17->_featureInTest;
    objc_storeStrong((id *)&v17->_featureInTest, a3);
    objc_storeWeak((id *)&v18->_context, v15);
    objc_storeStrong((id *)&v18->_parameters, a6);
    v21 = [v15 locale];
    v22 = [*p_featureInTest locale];
    v23 = [v22 languageIdentifier];
    v19->_matchingLocales = [v21 isEqualToString:v23];

    *(_WORD *)&v19->_isHyphenatedPrefixOfWord = 256;
    if (v19->_matchingLocales)
    {
      v24 = [v14 text];
      v19->_shouldAllowWhitespaceDelimiter = [v15 shouldAllowWhitespaceDelimiterForString:v24];
    }
    [(CRWrappingEvaluationResult *)v19 _computeGeometricProperties];
    if ([v15 lineCount] && v19->_matchingLocales && !a7)
    {
      [(CRWrappingEvaluationResult *)v19 _computeDDPropertiesWithContext:v15];
      [(CRWrappingEvaluationResult *)v19 _computeNoTextWithContext:v15];
      [(CRWrappingEvaluationResult *)v19 _computeIsHyphenatedPrefixOfWord:v15];
      v25 = [*p_featureInTest text];
      v19->_f2StartOfSentence = [v25 _crIsStartOfSentence];
    }
    v19->_imageSize.CGFloat width = width;
    v19->_imageSize.CGFloat height = height;
    if (!a7)
    {
      v26 = [v14 text];
      [(CRWrappingEvaluationResult *)v19 _setParagraphTextWithString:v26 context:v15];
    }
  }

  return v19;
}

- (id)resultByMerging:(id)a3
{
  id v4 = a3;
  if ([v4 isOversegmented])
  {
    v5 = [(CRWrappingEvaluationResult *)self featureInTest];
    v6 = [v4 featureInTest];
    [v5 mergeWithLine:v6];

    v7 = [CRWrappingEvaluationResult alloc];
    v8 = [(CRWrappingEvaluationResult *)self featureInTest];
    v9 = [(CRWrappingEvaluationResult *)self context];
    [(CRWrappingEvaluationResult *)self imageSize];
    double v11 = v10;
    double v13 = v12;
    id v14 = [(CRWrappingEvaluationResult *)self parameters];
    id v15 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:skipTextComputation:](v7, "initWithTextFeature:context:imageSize:parameters:skipTextComputation:", v8, v9, v14, 1, v11, v13);
  }
  else
  {
    id v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "Unable to merge results that are not due to oversegmentation", v18, 2u);
    }

    id v15 = self;
  }

  return v15;
}

- (void)_setParagraphTextWithString:(id)a3 context:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v6 lineCount])
  {
    v7 = [v6 text];
    if ([v7 _crEndsWithHyphen]) {
      BOOL isHyphenatedPrefixOfWord = self->_isHyphenatedPrefixOfWord;
    }
    else {
      BOOL isHyphenatedPrefixOfWord = 0;
    }

    double v10 = [v6 text];
    double v11 = [v6 locale];
    double v12 = [v10 _crStringByAppendingString:v14 locale:v11 mergeHyphenatedWord:isHyphenatedPrefixOfWord allowWhitespaceDelimiter:self->_shouldAllowWhitespaceDelimiter];
    paragraphText = self->_paragraphText;
    self->_paragraphText = v12;
  }
  else
  {
    v9 = (NSString *)v14;
    double v10 = self->_paragraphText;
    self->_paragraphText = v9;
  }
}

- (void)_computeNoTextWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 text];
  self->_contextNoText = [v4 _crContainsText] ^ 1;

  v5 = [(CRLineWrappable *)self->_featureInTest text];
  self->_featureInTestNoText = [v5 _crContainsText] ^ 1;
}

- (void)_computeIsHyphenatedPrefixOfWord:(id)a3
{
  id v4 = a3;
  self->_BOOL isHyphenatedPrefixOfWord = 0;
  id v14 = v4;
  v5 = [v4 text];
  id v6 = [(CRWrappingEvaluationResult *)self _spaceSeparatedTokens:v5];
  v7 = [v6 lastObject];

  if (v7 && (unint64_t)[v7 length] >= 3 && objc_msgSend(v7, "_crEndsWithHyphen"))
  {
    v8 = [(CRLineWrappable *)self->_featureInTest text];
    v9 = [(CRWrappingEvaluationResult *)self _spaceSeparatedTokens:v8];
    double v10 = [v9 firstObject];

    if (v10 && [v10 length])
    {
      double v11 = (void *)MEMORY[0x1E4F28E78];
      double v12 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
      double v13 = [v11 stringWithString:v12];

      [v13 appendString:v10];
      self->_BOOL isHyphenatedPrefixOfWord = [v14 isValidWordString:v13];
    }
  }
}

- (void)_computeGeometricProperties
{
  v3 = [(CRWrappingEvaluationResult *)self context];

  if (v3)
  {
    id v220 = [(CRWrappingEvaluationResult *)self featureInTest];
    id v4 = [v220 boundingQuad];
    v5 = [v4 denormalizedQuad];
    [v5 size];
    -[CRWrappingEvaluationResult setFeatureInTestSize:](self, "setFeatureInTestSize:");

    id v221 = [(CRWrappingEvaluationResult *)self context];
    uint64_t v6 = [v221 lineCount];

    if (!v6) {
      return;
    }
    v7 = [(CRWrappingEvaluationResult *)self context];
    id v222 = [v7 lastFeature];

    v8 = [v222 boundingQuad];
    v9 = [v8 denormalizedQuad];

    [v9 size];
    -[CRWrappingEvaluationResult setLastFeatureSize:](self, "setLastFeatureSize:");
    [v9 size];
    double v11 = v10;
    double v13 = v12;
    [(CRWrappingEvaluationResult *)self featureInTestSize];
    double v15 = v14;
    double v17 = v16;
    if (v16 <= 0.0)
    {
      double v19 = 0.0;
    }
    else
    {
      v8 = [(CRWrappingEvaluationResult *)self context];
      [v8 averageLineHeight];
      double v19 = v18 / v17;
    }
    *(float *)&double v19 = v19;
    [(CRWrappingEvaluationResult *)self setTextHeightRatio:v19];
    if (v17 > 0.0) {

    }
    double v21 = v15 / v11;
    if (v11 <= 0.0) {
      double v21 = 0.0;
    }
    *(float *)&double v21 = v21;
    [(CRWrappingEvaluationResult *)self setTextWidthRatio:v21];
    v22 = [(CRWrappingEvaluationResult *)self context];
    v23 = [v22 lastFeature];
    v24 = [v23 boundingQuad];
    [v24 baselineAngle];
    double v26 = v25;
    if (v25 <= 3.14159265)
    {
      if (v25 > -3.14159265) {
        goto LABEL_19;
      }
      double v27 = 6.28318531;
    }
    else
    {
      double v27 = -6.28318531;
    }
    double v26 = v26 + v27;
LABEL_19:
    objc_super v28 = [(CRWrappingEvaluationResult *)self featureInTest];
    v29 = [v28 boundingQuad];
    [v29 baselineAngle];
    if (v30 <= 3.14159265)
    {
      if (v30 > -3.14159265) {
        goto LABEL_24;
      }
      double v31 = 6.28318531;
    }
    else
    {
      double v31 = -6.28318531;
    }
    double v30 = v30 + v31;
LABEL_24:
    double v32 = v26 - v30;
    if (v32 <= 3.14159265)
    {
      if (v32 > -3.14159265)
      {
LABEL_29:
        *(float *)&double v32 = v32;
        [(CRWrappingEvaluationResult *)self setAngleDiff:v32];

        v34 = [v222 boundingQuad];
        v35 = [(CRWrappingEvaluationResult *)self featureInTest];
        v36 = [v35 boundingQuad];

        v37 = [(CRWrappingEvaluationResult *)self context];
        v38 = [v37 lastFeature];
        v39 = [v38 boundingQuad];
        [v39 baselineAngle];
        double v41 = v40;
        v42 = [(CRWrappingEvaluationResult *)self featureInTest];
        v43 = [v42 boundingQuad];
        [v43 baselineAngle];
        double v45 = (1.0 - v11 / (v11 + v15)) * v44 + v41 * (v11 / (v11 + v15));

        *(float *)&double v45 = v45;
        LODWORD(v46) = LODWORD(v45);
        v47 = objc_msgSend(v34, "rotatedAroundNormalizedPoint:angle:", 0.5, 0.5, v46);
        v48 = [v47 denormalizedQuad];

        LODWORD(v49) = LODWORD(v45);
        v50 = objc_msgSend(v36, "rotatedAroundNormalizedPoint:angle:", 0.5, 0.5, v49);
        v51 = [v50 denormalizedQuad];

        [v51 topLeft];
        double v53 = v52;
        [v48 bottomLeft];
        [(CRWrappingEvaluationResult *)self setVerticalSpacing:v53 - v54];
        [v34 topLeft];
        double v56 = v55;
        double v58 = v57;
        [v36 topLeft];
        double v60 = v59;
        double v62 = v61;
        [v34 normalizationSize];
        if (v63 > 0.0)
        {
          BOOL v65 = v64 <= 0.0;
          double v66 = v56 * v63;
          double v67 = v58 * v64;
          double v68 = v60 * v63;
          double v69 = v62 * v64;
          if (!v65)
          {
            double v60 = v68;
            double v62 = v69;
            double v56 = v66;
            double v58 = v67;
          }
        }
        double v70 = sqrt((v58 - v62) * (v58 - v62) + (v56 - v60) * (v56 - v60));
        *(float *)&double v70 = v70;
        [(CRWrappingEvaluationResult *)self setTopDistanceLeft:v70];
        [v34 topRight];
        double v72 = v71;
        double v74 = v73;
        [v36 topLeft];
        double v76 = v75;
        double v78 = v77;
        [v34 normalizationSize];
        if (v79 > 0.0 && v80 > 0.0)
        {
          double v72 = v72 * v79;
          double v74 = v74 * v80;
          double v76 = v76 * v79;
          double v78 = v78 * v80;
        }
        double v81 = sqrt((v74 - v78) * (v74 - v78) + (v72 - v76) * (v72 - v76));
        *(float *)&double v81 = v81;
        [(CRWrappingEvaluationResult *)self setTopDistanceRight:v81];
        [v34 topRight];
        double v83 = v82;
        double v85 = v84;
        v86 = [(CRWrappingEvaluationResult *)self featureInTest];
        v87 = [v86 boundingQuad];
        [v87 bottomLeft];
        double v89 = v88;
        double v91 = v90;
        [v34 normalizationSize];
        if (v92 > 0.0 && v93 > 0.0)
        {
          double v83 = v83 * v92;
          double v85 = v85 * v93;
          double v89 = v89 * v92;
          double v91 = v91 * v93;
        }
        double v94 = sqrt((v85 - v91) * (v85 - v91) + (v83 - v89) * (v83 - v89));
        *(float *)&double v94 = v94;
        [(CRWrappingEvaluationResult *)self setTopDistanceRightToBottomLeft:v94];

        [v34 bottomLeft];
        double v96 = v95;
        double v98 = v97;
        [v36 topLeft];
        double v100 = v99;
        double v102 = v101;
        [v34 normalizationSize];
        if (v103 > 0.0 && v104 > 0.0)
        {
          double v96 = v96 * v103;
          double v98 = v98 * v104;
          double v100 = v100 * v103;
          double v102 = v102 * v104;
        }
        double v105 = sqrt((v98 - v102) * (v98 - v102) + (v96 - v100) * (v96 - v100));
        *(float *)&double v105 = v105;
        [(CRWrappingEvaluationResult *)self setLeftDistance:v105];
        [v34 bottomRight];
        double v107 = v106;
        double v109 = v108;
        [v36 topRight];
        double v111 = v110;
        double v113 = v112;
        [v34 normalizationSize];
        if (v114 > 0.0 && v115 > 0.0)
        {
          double v107 = v107 * v114;
          double v109 = v109 * v115;
          double v111 = v111 * v114;
          double v113 = v113 * v115;
        }
        double v116 = sqrt((v109 - v113) * (v109 - v113) + (v107 - v111) * (v107 - v111));
        *(float *)&double v116 = v116;
        [(CRWrappingEvaluationResult *)self setRightDistance:v116];
        [v34 midPoint];
        double v118 = v117;
        double v120 = v119;
        [v36 midPoint];
        double v122 = v121;
        double v124 = v123;
        [v34 normalizationSize];
        if (v125 > 0.0 && v126 > 0.0)
        {
          double v118 = v118 * v125;
          double v120 = v120 * v126;
          double v122 = v122 * v125;
          double v124 = v124 * v126;
        }
        double v127 = sqrt((v120 - v124) * (v120 - v124) + (v118 - v122) * (v118 - v122));
        *(float *)&double v127 = v127;
        [(CRWrappingEvaluationResult *)self setMidDistance:v127];
        [v51 topRight];
        double v129 = v128;
        [v48 topLeft];
        double v131 = v129 - v130;
        *(float *)&double v131 = v131;
        [(CRWrappingEvaluationResult *)self setHorizontalOverlap:v131];
        [v51 bottomLeft];
        double v133 = v132;
        [v48 topLeft];
        double v135 = v133 - v134;
        *(float *)&double v135 = v133 - v134;
        [(CRWrappingEvaluationResult *)self setVerticalOverlap:v135];
        [v51 topLeft];
        double v137 = v136;
        [v48 topRight];
        double v139 = v137 - v138;
        *(float *)&double v139 = v139;
        [(CRWrappingEvaluationResult *)self setXSpace:v139];
        [v48 topRight];
        double v141 = v140;
        [v51 bottomLeft];
        double v143 = v141 - v142;
        *(float *)&double v143 = v141 - v142;
        [(CRWrappingEvaluationResult *)self setYSpace:v143];
        if (![(CRWrappingEvaluationResult *)self similarHeights]
          || ![(CRWrappingEvaluationResult *)self similarAngles])
        {
          goto LABEL_93;
        }
        [(CRWrappingEvaluationResult *)self topDistanceLeft];
        float v145 = v144;
        [(CRWrappingEvaluationResult *)self topDistanceRight];
        if (v145 > v146)
        {
          [(CRWrappingEvaluationResult *)self topDistanceRight];
          float v148 = v147;
          [(CRWrappingEvaluationResult *)self topDistanceRightToBottomLeft];
          if (v148 < v149)
          {
            [(CRWrappingEvaluationResult *)self topDistanceRight];
            float v151 = v150;
            v152 = [(CRWrappingEvaluationResult *)self parameters];
            [v152 oversegmentedDistanceHeightRatioTolerance];
            double v154 = (v13 + v17) * v153 * 0.5;

            if (v154 > v151) {
              [(CRWrappingEvaluationResult *)self setIsOversegmented:1];
            }
            v155 = [(CRWrappingEvaluationResult *)self context];
            uint64_t v156 = [v155 lineCount];

            if (v156 == 1)
            {
              if ([(CRWrappingEvaluationResult *)self isOversegmented]
                || ([(CRWrappingEvaluationResult *)self topDistanceRight],
                    float v158 = v157,
                    [(CRWrappingEvaluationResult *)self parameters],
                    v159 = objc_claimAutoreleasedReturnValue(),
                    [v159 oversegmentedDistanceHeightRatioListItemTolerance],
                    double v161 = (v13 + v17) * v160 * 0.5,
                    v159,
                    v161 > v158))
              {
                v162 = [(CRWrappingEvaluationResult *)self context];
                v163 = [v162 text];
                if ([v163 _crIsListItemMarker])
                {
                  v218 = [(CRWrappingEvaluationResult *)self featureInTest];
                  v164 = [v218 text];
                  int v165 = [v164 _crContainsText];

                  if (v165)
                  {
                    [(CRWrappingEvaluationResult *)self setOversegmentedListItem:1];
                    [(CRWrappingEvaluationResult *)self setIsOversegmented:1];
                  }
                }
                else
                {
                }
              }
            }
          }
        }
        if ([(CRWrappingEvaluationResult *)self isOversegmented]) {
          goto LABEL_93;
        }
        [(CRWrappingEvaluationResult *)self verticalSpacing];
        double v167 = v166;
        v168 = [(CRWrappingEvaluationResult *)self parameters];
        [v168 verticalSpacingRatioTolerance];
        double v170 = v13 * v169;

        if (v167 < v170)
        {
          v171 = [(CRWrappingEvaluationResult *)self context];
          if ([v171 isRTL]) {
            [(CRWrappingEvaluationResult *)self rightDistance];
          }
          else {
            [(CRWrappingEvaluationResult *)self leftDistance];
          }
          float v173 = v172;

          v174 = [(CRWrappingEvaluationResult *)self context];
          if ([v174 isRTL])
          {
            [v48 topRight];
            double v176 = v175;
            [v51 topLeft];
            BOOL v178 = v176 > v177;
          }
          else
          {
            [v48 topLeft];
            double v180 = v179;
            [v51 topRight];
            BOOL v178 = v180 < v181;
          }

          v182 = [(CRWrappingEvaluationResult *)self parameters];
          [v182 leadingDistanceRatioTolerance];
          double v183 = v173;
          double v185 = v13 * v184;

          if (v185 > v183) {
            goto LABEL_80;
          }
          v186 = [(CRWrappingEvaluationResult *)self context];
          if ([v186 lineCount] != 1) {
            BOOL v178 = 0;
          }

          if (!v178) {
            goto LABEL_81;
          }
          v187 = [(CRWrappingEvaluationResult *)self parameters];
          [v187 newParagraphIndentDistanceRatioTolerance];
          double v189 = v13 * v188;

          if (fabs(v183) >= v189) {
            goto LABEL_81;
          }
          v190 = [(CRWrappingEvaluationResult *)self context];
          if ([v190 isRTL])
          {
            [v48 topLeft];
            double v192 = v191;
            [v51 topLeft];
            double v194 = v193;

            if (v192 > v194) {
              goto LABEL_80;
            }
          }
          else
          {
            [v48 topRight];
            double v196 = v195;
            [v51 topRight];
            double v198 = v197;

            if (v196 < v198)
            {
LABEL_80:
              [(CRWrappingEvaluationResult *)self setLeadingAligned:1];
              goto LABEL_81;
            }
          }
          v219 = [(CRWrappingEvaluationResult *)self context];
          v217 = [v219 lastFeature];
          v199 = [v217 text];
          if ([v199 _crStartsWithListItemIndicator])
          {

            goto LABEL_80;
          }
          v216 = [(CRWrappingEvaluationResult *)self context];
          v200 = [v216 lastFeature];
          v201 = [v200 text];
          int v202 = [v201 _crStartsWithDigit];

          if (v202) {
            goto LABEL_80;
          }
        }
LABEL_81:
        [(CRWrappingEvaluationResult *)self midDistance];
        if (v13 + v17 > v203) {
          [(CRWrappingEvaluationResult *)self setCenterAligned:1];
        }
        v204 = [(CRWrappingEvaluationResult *)self context];
        v205 = [v204 lastFeature];
        v206 = [v205 text];
        unint64_t v207 = [(CRWrappingEvaluationResult *)self _tokenCountForString:v206];

        if (![(CRWrappingEvaluationResult *)self centerAligned])
        {
          BOOL v208 = [(CRWrappingEvaluationResult *)self leadingAligned];
          char v209 = v207 < 3 || v208;
          if ((v209 & 1) == 0)
          {
            v210 = [(CRWrappingEvaluationResult *)self featureInTest];
            v211 = [v210 text];
            unint64_t v212 = [v211 length];

            if (v212 >= 3)
            {
              [(CRWrappingEvaluationResult *)self ySpace];
              if (v17 < v213)
              {
                [(CRWrappingEvaluationResult *)self xSpace];
                if (v214 > 0.0)
                {
                  [(CRWrappingEvaluationResult *)self xSpace];
                  if (v11 * 0.25 > v215) {
                    [(CRWrappingEvaluationResult *)self setContinuesToNewColumn:1];
                  }
                }
              }
            }
          }
        }
LABEL_93:

        return;
      }
      double v33 = 6.28318531;
    }
    else
    {
      double v33 = -6.28318531;
    }
    double v32 = v32 + v33;
    goto LABEL_29;
  }
  v20 = CROSLogForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
  }
}

- (void)_computeDDPropertiesWithContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v4 = [v35 text];
  v38 = [v4 _crDDFriendlyTextWithIndexMapping:0];

  v5 = [(CRLineWrappable *)self->_featureInTest text];
  uint64_t v6 = [v5 _crDDFriendlyTextWithIndexMapping:0];

  v36 = v6;
  v7 = [v38 stringByAppendingFormat:@"\n%@", v6];
  double v40 = v7;
  uint64_t v39 = [v38 length];
  NSUInteger range1 = [v6 length];
  if ([(CRWrappingEvaluationResult *)self matchingLocales])
  {
    uint64_t v8 = [v35 locale];
  }
  else
  {
    uint64_t v8 = 0;
  }
  double v33 = (void *)v8;
  v37 = objc_msgSend(MEMORY[0x1E4F5F160], "_crConfigForLocale:");
  v34 = objc_msgSend(MEMORY[0x1E4F5F158], "scanString:range:configuration:", v7, 0, objc_msgSend(v7, "length"), v37);
  [(CRWrappingEvaluationResult *)self setSentencePuncStringToCheck:v38];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v34;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v9)
  {
    unint64_t v10 = v39 + 1;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v12 category])
        {
          uint64_t v13 = [v12 urlificationRange];
          uint64_t v15 = v14;
          double v16 = [(CRWrappingEvaluationResult *)self sentencePuncStringToCheck];
          BOOL v17 = v13 < (unint64_t)[v16 length];

          if (v17)
          {
            if (v13 <= 2) {
              uint64_t v13 = 2;
            }
            double v18 = [(CRWrappingEvaluationResult *)self sentencePuncStringToCheck];
            uint64_t v19 = v13 - 2;
            uint64_t v20 = v15 + 2;
            if ([v18 length] - v19 < (unint64_t)(v15 + 2))
            {
              double v21 = [(CRWrappingEvaluationResult *)self sentencePuncStringToCheck];
              uint64_t v22 = [v21 length];

              uint64_t v20 = v22 - v19;
            }

            v23 = objc_msgSend(v40, "substringWithRange:", v19, v20);
            v24 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
            int v25 = [v23 _crContainsCharactersInSet:v24];

            if (v25)
            {
              double v26 = [(CRWrappingEvaluationResult *)self sentencePuncStringToCheck];
              double v27 = [&stru_1F38EED68 stringByPaddingToLength:v20 withString:@"-" startingAtIndex:0];
              objc_super v28 = objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", v19, v20, v27);
              [(CRWrappingEvaluationResult *)self setSentencePuncStringToCheck:v28];
            }
          }
          v51.location = [v12 urlificationRange];
          v51.length = v29;
          v50.location = v39 + 1;
          v50.length = range1;
          NSRange v30 = NSIntersectionRange(v50, v51);
          if (v30.length)
          {
            if ([v12 urlificationRange] < v10) {
              [(CRWrappingEvaluationResult *)self setMultilineDD:1];
            }
            if (v30.location == v10)
            {
              [(CRWrappingEvaluationResult *)self setF2BeginsWithDD:1];
              if (v30.length >= range1 - 1) {
                [(CRWrappingEvaluationResult *)self setF2FullyDD:1];
              }
            }
          }
          else
          {
            uint64_t v31 = [v12 urlificationRange];
            [v12 urlificationRange];
            if (v32 + v31 == v39) {
              [(CRWrappingEvaluationResult *)self setF1EndsWithDD:1];
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v9);
  }
}

- (id)description
{
  v24 = NSString;
  NSRange v30 = [NSNumber numberWithBool:self->_matchingLocales];
  objc_super v28 = [(CRWrappingEvaluationResult *)self context];
  NSUInteger v29 = [v28 locale];
  double v26 = [(CRWrappingEvaluationResult *)self featureInTest];
  double v27 = [v26 locale];
  int64_t v22 = [(CRWrappingEvaluationResult *)self textContentWrappingScore];
  int64_t v21 = [(CRWrappingEvaluationResult *)self caseWrappingScoreUsingCustomConfiguration:1];
  int64_t v19 = [(CRWrappingEvaluationResult *)self wordCountWrappingScore];
  int64_t v18 = [(CRWrappingEvaluationResult *)self punctuationWrappingScoreUsingCustomConfiguration:1];
  [(CRWrappingEvaluationResult *)self textHeightRatio];
  float v4 = v3;
  [(CRWrappingEvaluationResult *)self textWidthRatio];
  float v6 = v5;
  [(CRWrappingEvaluationResult *)self angleDiff];
  float v8 = v7;
  int v25 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented"));
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult leadingAligned](self, "leadingAligned"));
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult centerAligned](self, "centerAligned"));
  BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult continuesToNewColumn](self, "continuesToNewColumn"));
  double v16 = [(CRWrappingEvaluationResult *)self paragraphText];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult lmScoreSet](self, "lmScoreSet"));
  [(CRWrappingEvaluationResult *)self cachedLMScore];
  uint64_t v10 = v9;
  double v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CRWrappingEvaluationResult eosLMScoreSet](self, "eosLMScoreSet"));
  [(CRWrappingEvaluationResult *)self cachedEOSLMScore];
  objc_msgSend(v24, "stringWithFormat:", @"{\nmatchingLocales:\t%@ -(%@/%@)\ntextContentWrappingScore/caseScore/wcScore/puncScore:\t%ld/%ld/%ld/%ld\ntextHeightRatio/textWidthRatio/angleDiff:\t%f/%f/%f\noverSegmented/leadingAligned/centerAligned/newColumn:\t%@/%@/%@/%@\ntext:%@\nlmScoreSet/lmScore/eosScoreSet/eosLMScore:%@/%.4f/%@/%.4f\n}", v30, v29, v27, v22, v21, v19, v18, v4, v6, v8, v25, v23, v20, v17, v16, v15,
    v10,
    v11,
  uint64_t v13 = v12);

  return v13;
}

- (int64_t)textContentWrappingScore
{
  if ([(CRWrappingEvaluationResult *)self multilineDD]) {
    return -10;
  }
  if ([(CRWrappingEvaluationResult *)self oversegmentedListItem]
    || [(CRWrappingEvaluationResult *)self isHyphenatedPrefixOfWord])
  {
    return 10;
  }
  if (![(CRWrappingEvaluationResult *)self contextNoText]
    && ![(CRWrappingEvaluationResult *)self featureInTestNoText])
  {
    float v5 = [(CRWrappingEvaluationResult *)self featureInTest];
    float v6 = [v5 text];
    if ([v6 _crIsProgrammingStatement])
    {
    }
    else
    {
      float v7 = [(CRWrappingEvaluationResult *)self context];
      float v8 = [v7 lastFeature];
      uint64_t v9 = [v8 text];
      char v10 = [v9 _crIsProgrammingStatement];

      if ((v10 & 1) == 0 && ![(CRWrappingEvaluationResult *)self f2StartOfSentence])
      {
        if (![(CRWrappingEvaluationResult *)self f1EndsWithDD]
          || ![(CRWrappingEvaluationResult *)self f2BeginsWithDD])
        {
          if ([(CRWrappingEvaluationResult *)self f2FullyDD]) {
            return -2;
          }
          double v11 = [(CRWrappingEvaluationResult *)self featureInTest];
          uint64_t v12 = [v11 text];
          if ((unint64_t)[v12 length] <= 1)
          {
          }
          else
          {
            uint64_t v13 = [(CRWrappingEvaluationResult *)self context];
            uint64_t v14 = [v13 lastFeature];
            uint64_t v15 = [v14 text];
            unint64_t v16 = [v15 length];

            if (v16 > 1) {
              return 0;
            }
          }
        }
        return -6;
      }
    }
    return -10;
  }
  int64_t v3 = -2;
  if ([(CRWrappingEvaluationResult *)self contextNoText]
    && [(CRWrappingEvaluationResult *)self featureInTestNoText])
  {
    return -10;
  }
  return v3;
}

- (int64_t)caseWrappingScoreUsingCustomConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(CRWrappingEvaluationResult *)self context];

  if (v5)
  {
    if (![(CRWrappingEvaluationResult *)self multilineDD])
    {
      float v6 = [(CRWrappingEvaluationResult *)self context];
      char v7 = [v6 shouldConsiderLetterCase];

      if (v7)
      {
        float v8 = [(CRWrappingEvaluationResult *)self context];
        uint64_t v9 = [v8 lastFeature];
        char v10 = [v9 text];
        double v11 = [(CRWrappingEvaluationResult *)self _spaceSeparatedTokens:v10];
        uint64_t v12 = [v11 lastObject];

        uint64_t v13 = [(CRWrappingEvaluationResult *)self featureInTest];
        uint64_t v14 = [v13 text];
        uint64_t v15 = [(CRWrappingEvaluationResult *)self _spaceSeparatedTokens:v14];
        unint64_t v16 = [v15 firstObject];

        if ([(CRWrappingEvaluationResult *)self f1EndsWithDD]
          || [(CRWrappingEvaluationResult *)self f2BeginsWithDD]
          || ([(CRWrappingEvaluationResult *)self featureInTest],
              BOOL v17 = objc_claimAutoreleasedReturnValue(),
              [v17 text],
              int64_t v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 _crStartsWithLowercase],
              v18,
              v17,
              !v19))
        {
          if ([v12 _crIsAllCaps]
            && [v16 _crIsAllCaps]
            && ![(CRWrappingEvaluationResult *)self f1EndsWithDD]
            && ![(CRWrappingEvaluationResult *)self f2BeginsWithDD])
          {
            int64_t v21 = 6;
          }
          else
          {
            int v24 = [v12 _crIsAllCaps];
            if (v24 != [v16 _crIsAllCaps]
              && [v12 _crContainsText]
              && [v16 _crContainsText]
              && (unint64_t)[v12 length] >= 2
              && (unint64_t)[v16 length] > 1)
            {
              int64_t v21 = -6;
            }
            else
            {
              if (![(CRWrappingEvaluationResult *)self contextNoText]
                && ![(CRWrappingEvaluationResult *)self featureInTestNoText])
              {
                int v25 = [(CRWrappingEvaluationResult *)self featureInTest];
                double v26 = [v25 text];
                if ([v26 _crStartsWithUppercase])
                {
                  char v27 = [v16 isEqualToString:@"I"];

                  if ((v27 & 1) == 0 && ([v12 _crStartsWithUppercase] & 1) == 0)
                  {
                    if ([(CRWrappingEvaluationResult *)self f2BeginsWithDD]) {
                      int64_t v21 = 0;
                    }
                    else {
                      int64_t v21 = -2;
                    }
                    goto LABEL_34;
                  }
                }
                else
                {
                }
              }
              int64_t v21 = 0;
            }
          }
        }
        else if (v3)
        {
          uint64_t v20 = [(CRWrappingEvaluationResult *)self parameters];
          int64_t v21 = [v20 caseWrappingScoreWithNoCapitalization];
        }
        else
        {
          int64_t v21 = 10;
        }
LABEL_34:

        return v21;
      }
    }
  }
  else
  {
    int64_t v22 = CROSLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)objc_super v28 = 0;
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_FAULT, "Unexpected nil context", v28, 2u);
    }
  }
  return 0;
}

- (int64_t)wordCountWrappingScore
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self context];

  if (!v3)
  {
    uint64_t v14 = CROSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_FAULT, "Unexpected nil context", v20, 2u);
    }

    return 0;
  }
  float v4 = [(CRWrappingEvaluationResult *)self context];
  int v5 = [v4 usesWordTokens];

  if (!v5) {
    return 0;
  }
  float v6 = [(CRWrappingEvaluationResult *)self context];
  char v7 = [v6 lastFeature];
  float v8 = [v7 text];
  int64_t v9 = [(CRWrappingEvaluationResult *)self _tokenCountForString:v8];

  char v10 = [(CRWrappingEvaluationResult *)self featureInTest];
  double v11 = [v10 text];
  uint64_t v12 = [(CRWrappingEvaluationResult *)self _tokenCountForString:v11];

  if (v9 != 1 || v12 < 3)
  {
    if (v12 == 1)
    {
      uint64_t v15 = [(CRWrappingEvaluationResult *)self featureInTest];
      unint64_t v16 = [v15 text];
      if ([v16 _crEndsWithEOS])
      {

        return 6;
      }
      BOOL v17 = [(CRWrappingEvaluationResult *)self featureInTest];
      int64_t v18 = [v17 text];
      int v19 = [v18 _crEndsWithClosingPunctuation];

      if (v19) {
        return 6;
      }
    }
    return 0;
  }
  if ([(CRWrappingEvaluationResult *)self isOversegmented]) {
    return 0;
  }
  else {
    return -2;
  }
}

- (int64_t)punctuationWrappingScoreUsingCustomConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CRWrappingEvaluationResult *)self context];

  if (!v5)
  {
    uint64_t v12 = CROSLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
    }

    return 0;
  }
  float v6 = [(CRWrappingEvaluationResult *)self context];
  char v7 = [v6 lastFeature];
  float v8 = [v7 text];
  if (![v8 _crEndsWithEOS])
  {

LABEL_10:
    uint64_t v14 = [(CRWrappingEvaluationResult *)self context];
    uint64_t v15 = [v14 lastFeature];
    unint64_t v16 = [v15 text];
    int v17 = [v16 _crEndsWithMOS];

    if (v17)
    {
      if (!v3) {
        return 10;
      }
      int64_t v18 = [(CRWrappingEvaluationResult *)self parameters];
      uint64_t v19 = [v18 punctuationWrappingScoreWithEndingMOS];
      goto LABEL_13;
    }
    uint64_t v20 = [(CRWrappingEvaluationResult *)self context];
    double v54 = [v20 lastFeature];
    double v53 = [v54 text];
    int v21 = [v53 _crStartsWithDigit];
    char v22 = v21;
    if (v21)
    {
      double v52 = [(CRWrappingEvaluationResult *)self featureInTest];
      NSRange v51 = [v52 text];
      if ([v51 _crStartsWithDigit])
      {

        return -6;
      }
    }
    v23 = [(CRWrappingEvaluationResult *)self context];
    int v24 = [v23 lastFeature];
    int v25 = [v24 text];
    if ([v25 _crEndsWithDigit])
    {
      double v26 = [(CRWrappingEvaluationResult *)self featureInTest];
      char v27 = [v26 text];
      char v28 = [v27 _crEndsWithDigit];

      if (v22)
      {
      }
      if (v28) {
        return -6;
      }
    }
    else
    {

      if (v22)
      {
      }
    }
    if ([(CRWrappingEvaluationResult *)self textContentWrappingScore] < 0
      || ([(CRWrappingEvaluationResult *)self sentencePuncStringToCheck],
          NSUInteger v29 = objc_claimAutoreleasedReturnValue(),
          [(CRWrappingEvaluationResult *)self context],
          NSRange v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = objc_msgSend(v29, "_crIsSentencePunctuatedIncludingWhitespace:", objc_msgSend(v30, "usesWordTokens")),
          v30,
          v29,
          !v31))
    {
      v36 = [(CRWrappingEvaluationResult *)self context];
      v37 = [v36 lastFeature];
      v38 = [v37 text];
      int v39 = [v38 _crEndsWithClosingPunctuation];

      if (v39) {
        return -2;
      }
      else {
        return 0;
      }
    }
    uint64_t v32 = [(CRWrappingEvaluationResult *)self context];
    double v33 = [v32 lastFeature];
    v34 = [v33 text];
    char v35 = [v34 _crEndsWithClosingPunctuation];

    if (v35) {
      return 2;
    }
    if (!v3)
    {
      int64_t v18 = [(CRWrappingEvaluationResult *)self context];
      uint64_t v43 = [v18 lastFeature];
      long long v44 = [v43 locale];
      long long v45 = [v44 languageIdentifier];
      if (+[CRImageReader languageIsChinese:v45])
      {
        int64_t v13 = 2;
      }
      else
      {
        long long v46 = [(CRWrappingEvaluationResult *)self context];
        long long v47 = [v46 lastFeature];
        v48 = [v47 locale];
        uint64_t v49 = [v48 languageIdentifier];
        BOOL v50 = +[CRImageReader languageIsJapanese:v49];

        if (v50) {
          int64_t v13 = 2;
        }
        else {
          int64_t v13 = 10;
        }
      }

      goto LABEL_14;
    }
    int64_t v18 = [(CRWrappingEvaluationResult *)self parameters];
    uint64_t v19 = [v18 punctuationWrappingScoreWithNoClosingPunctuation];
LABEL_13:
    int64_t v13 = v19;
LABEL_14:

    return v13;
  }
  BOOL v9 = [(CRWrappingEvaluationResult *)self oversegmentedListItem];

  if (v9) {
    goto LABEL_10;
  }
  char v10 = [(CRWrappingEvaluationResult *)self featureInTest];
  double v11 = [v10 text];
  if ([v11 _crStartsWithUppercase])
  {

    return -10;
  }
  double v40 = [(CRWrappingEvaluationResult *)self context];
  char v41 = [v40 shouldConsiderLetterCase];

  if ((v41 & 1) == 0) {
    return -10;
  }
  return -2;
}

- (BOOL)similarHeights
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self parameters];
  [v3 heightSimilarityRatio];
  float v5 = v4;

  float v6 = [(CRWrappingEvaluationResult *)self context];
  char v7 = [v6 text];
  if ((unint64_t)[v7 length] <= 2)
  {
  }
  else
  {
    float v8 = [(CRWrappingEvaluationResult *)self featureInTest];
    BOOL v9 = [v8 text];
    unint64_t v10 = [v9 length];

    if (v10 > 2) {
      goto LABEL_6;
    }
  }
  float v5 = v5 * 1.5;
LABEL_6:
  [(CRWrappingEvaluationResult *)self textHeightRatio];
  return fabsf(v11 + -1.0) < v5;
}

- (BOOL)similarAngles
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self parameters];
  [v3 angleSimilarityThreshold];
  float v5 = v4;

  float v6 = [(CRWrappingEvaluationResult *)self context];
  char v7 = [v6 text];
  if ((unint64_t)[v7 length] <= 2)
  {
  }
  else
  {
    float v8 = [(CRWrappingEvaluationResult *)self featureInTest];
    BOOL v9 = [v8 text];
    unint64_t v10 = [v9 length];

    if (v10 > 2) {
      goto LABEL_6;
    }
  }
  float v5 = v5 * 3.0;
LABEL_6:
  [(CRWrappingEvaluationResult *)self angleDiff];
  return fabsf(v11) < v5;
}

- (double)widthGrowth
{
  [(CRWrappingEvaluationResult *)self textWidthRatio];
  return (float)(v2 + -1.0);
}

- (BOOL)excessiveVerticalDistance
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self context];

  if (!v3)
  {
    float v4 = CROSLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int64_t v18 = 0;
      _os_log_impl(&dword_1DD733000, v4, OS_LOG_TYPE_FAULT, "Unexpected nil context", v18, 2u);
    }
    goto LABEL_8;
  }
  float v4 = [(CRWrappingEvaluationResult *)self context];
  if ((unint64_t)[v4 lineCount] < 2)
  {
LABEL_8:

    return 0;
  }
  BOOL v5 = [(CRWrappingEvaluationResult *)self contributesToVerticalSpacing];

  if (!v5) {
    return 0;
  }
  [(CRWrappingEvaluationResult *)self verticalSpacingToHeightRatio];
  double v7 = v6;
  float v8 = [(CRWrappingEvaluationResult *)self parameters];
  [v8 smallestVerticalDistanceHeightRatio];
  if (v7 > v9)
  {
    [(CRWrappingEvaluationResult *)self verticalSpacingToHeightRatio];
    double v12 = v15;
  }
  else
  {
    unint64_t v10 = [(CRWrappingEvaluationResult *)self parameters];
    [v10 smallestVerticalDistanceHeightRatio];
    double v12 = v11;
  }
  unint64_t v16 = [(CRWrappingEvaluationResult *)self parameters];
  [v16 maximumVerticalDistanceGrowthRatio];
  BOOL v13 = v12 > v17;

  return v13;
}

- (BOOL)contributesToVerticalSpacing
{
  if ([(CRWrappingEvaluationResult *)self continuesToNewColumn]) {
    return 0;
  }
  else {
    return ![(CRWrappingEvaluationResult *)self isOversegmented];
  }
}

- (double)verticalSpacingToHeightRatio
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self context];
  uint64_t v4 = [v3 lineCount];

  [(CRWrappingEvaluationResult *)self featureInTestSize];
  double v6 = v5;
  double v7 = [(CRWrappingEvaluationResult *)self context];
  [v7 averageLineHeight];
  double v9 = v8;

  unint64_t v10 = [(CRWrappingEvaluationResult *)self context];
  [v10 averageVerticalSpacing];
  double v12 = v11;
  BOOL v13 = [(CRWrappingEvaluationResult *)self parameters];
  [v13 smallestVerticalDistanceHeightRatio];
  double v14 = (1.0 - 1.0 / (double)(unint64_t)(v4 + 1)) * v9 + v6 * (1.0 / (double)(unint64_t)(v4 + 1));
  if (v12 <= v14 * v15)
  {
    unint64_t v16 = [(CRWrappingEvaluationResult *)self parameters];
    [v16 smallestVerticalDistanceHeightRatio];
    double v18 = v14 * v19;
  }
  else
  {
    unint64_t v16 = [(CRWrappingEvaluationResult *)self context];
    [v16 averageVerticalSpacing];
    double v18 = v17;
  }

  [(CRWrappingEvaluationResult *)self verticalSpacing];
  return v20 / v18;
}

- (int64_t)tokenCountDiff
{
  BOOL v3 = [(CRWrappingEvaluationResult *)self featureInTest];
  uint64_t v4 = [v3 text];
  int64_t v5 = [(CRWrappingEvaluationResult *)self _tokenCountForString:v4];
  double v6 = [(CRWrappingEvaluationResult *)self context];
  double v7 = [v6 lastFeature];
  double v8 = [v7 text];
  int64_t v9 = v5 - [(CRWrappingEvaluationResult *)self _tokenCountForString:v8];

  return v9;
}

- (int64_t)textBasedEvaluation
{
  uint64_t v3 = consolidateWrapScores([(CRWrappingEvaluationResult *)self textContentWrappingScore], [(CRWrappingEvaluationResult *)self caseWrappingScoreUsingCustomConfiguration:1]);
  uint64_t v4 = consolidateWrapScores(v3, [(CRWrappingEvaluationResult *)self wordCountWrappingScore]);
  uint64_t v5 = [(CRWrappingEvaluationResult *)self punctuationWrappingScoreUsingCustomConfiguration:1];
  return consolidateWrapScores(v4, v5);
}

- (double)lmScore
{
  if (![(CRWrappingEvaluationResult *)self lmScoreSet]) {
    [(CRWrappingEvaluationResult *)self _computeLMScoreComputingEOS:0];
  }
  [(CRWrappingEvaluationResult *)self cachedLMScore];
  return result;
}

- (double)eosLMScore
{
  if (![(CRWrappingEvaluationResult *)self eosLMScoreSet]) {
    [(CRWrappingEvaluationResult *)self _computeLMScoreComputingEOS:1];
  }
  [(CRWrappingEvaluationResult *)self cachedEOSLMScore];
  return result;
}

- (void)_computeLMScoreComputingEOS:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRWrappingEvaluationResult *)self context];

  if (v5)
  {
    if (v3)
    {
      if ([(CRWrappingEvaluationResult *)self eosLMScoreSet]) {
        return;
      }
    }
    else if ([(CRWrappingEvaluationResult *)self lmScoreSet])
    {
      return;
    }
    double v7 = [(CRWrappingEvaluationResult *)self context];
    int v8 = [v7 usesWordTokens];

    if (v8)
    {
      int64_t v9 = [(CRWrappingEvaluationResult *)self context];
      unint64_t v10 = v9;
      if (v3)
      {
        [v9 wordLMScoreByAddingToken:2];
        self->_cachedEOSLMScore = v11;

        [(CRWrappingEvaluationResult *)self setEosLMScoreSet:1];
      }
      else
      {
        [(CRWrappingEvaluationResult *)self featureTokens];
        [v10 wordLMScoreByAddingTokens:__p];
        self->_cachedLMScore = v12;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        [(CRWrappingEvaluationResult *)self setLmScoreSet:1];
      }
    }
    else
    {
      [(CRWrappingEvaluationResult *)self _computeCharLMScores];
    }
  }
  else
  {
    double v6 = CROSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1DD733000, v6, OS_LOG_TYPE_FAULT, "Unexpected nil context", (uint8_t *)__p, 2u);
    }
  }
}

- (void)_computeCharLMScores
{
  double v7 = 0.0;
  BOOL v3 = [(CRWrappingEvaluationResult *)self context];
  uint64_t v4 = [(CRWrappingEvaluationResult *)self featureInTest];
  uint64_t v5 = [v4 text];
  [v3 charLMScoreByAddingString:v5 eosScore:&v7];
  self->_cachedLMScore = v6;

  self->_cachedEOSLMScore = v7;
  [(CRWrappingEvaluationResult *)self setLmScoreSet:1];
  [(CRWrappingEvaluationResult *)self setEosLMScoreSet:1];
}

- (vector<unsigned)featureTokens
{
  uint64_t v4 = [(CRWrappingEvaluationResult *)self context];

  if (v4)
  {
    if (![(CRWrappingEvaluationResult *)self featureTokensSet])
    {
      uint64_t v5 = [(CRWrappingEvaluationResult *)self context];
      int v6 = [v5 usesWordTokens];

      if (v6)
      {
        double v7 = [(CRWrappingEvaluationResult *)self context];
        int v8 = [(CRWrappingEvaluationResult *)self featureInTest];
        int64_t v9 = [v8 text];
        if (v7)
        {
          [v7 tokenizeStringIntoWords:v9];
        }
        else
        {
          __p = 0;
          BOOL v13 = 0;
          uint64_t v14 = 0;
        }
        [(CRWrappingEvaluationResult *)self setCachedFeatureTokens:&__p];
        if (__p)
        {
          BOOL v13 = __p;
          operator delete(__p);
        }

        [(CRWrappingEvaluationResult *)self setFeatureTokensSet:1];
      }
    }
  }
  else
  {
    unint64_t v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
    }
  }
  return [(CRWrappingEvaluationResult *)self cachedFeatureTokens];
}

- (int64_t)_tokenCountForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRWrappingEvaluationResult *)self context];
  int v6 = [v5 usesWordTokens];

  if (v6)
  {
    double v7 = [(CRWrappingEvaluationResult *)self _spaceSeparatedTokens:v4];
    int64_t v8 = [v7 count];
  }
  else
  {
    int64_t v8 = [v4 length];
  }

  return v8;
}

- (id)_spaceSeparatedTokens:(id)a3
{
  BOOL v3 = [a3 componentsSeparatedByString:@" "];
  return v3;
}

- (BOOL)matchingLocales
{
  return self->_matchingLocales;
}

- (void)setMatchingLocales:(BOOL)a3
{
  self->_matchingLocales = a3;
}

- (CRLineWrappable)featureInTest
{
  return (CRLineWrappable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFeatureInTest:(id)a3
{
}

- (NSString)paragraphText
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setParagraphText:(id)a3
{
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

- (void)setVerticalSpacing:(double)a3
{
  self->_verticalSpacing = a3;
}

- (float)textHeightRatio
{
  return self->_textHeightRatio;
}

- (void)setTextHeightRatio:(float)a3
{
  self->_textHeightRatio = a3;
}

- (float)textWidthRatio
{
  return self->_textWidthRatio;
}

- (void)setTextWidthRatio:(float)a3
{
  self->_textWidthRatio = a3;
}

- (float)angleDiff
{
  return self->_angleDiff;
}

- (void)setAngleDiff:(float)a3
{
  self->_angleDiff = a3;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (BOOL)isOversegmented
{
  return self->_isOversegmented;
}

- (void)setIsOversegmented:(BOOL)a3
{
  self->_isOversegmented = a3;
}

- (BOOL)leadingAligned
{
  return self->_leadingAligned;
}

- (void)setLeadingAligned:(BOOL)a3
{
  self->_leadingAligned = a3;
}

- (BOOL)centerAligned
{
  return self->_centerAligned;
}

- (void)setCenterAligned:(BOOL)a3
{
  self->_centerAligned = a3;
}

- (BOOL)continuesToNewColumn
{
  return self->_continuesToNewColumn;
}

- (void)setContinuesToNewColumn:(BOOL)a3
{
  self->_continuesToNewColumn = a3;
}

- (CGSize)lastFeatureSize
{
  objc_copyStruct(v4, &self->_lastFeatureSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setLastFeatureSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_lastFeatureSize, &v3, 16, 1, 0);
}

- (CGSize)featureInTestSize
{
  objc_copyStruct(v4, &self->_featureInTestSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setFeatureInTestSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_featureInTestSize, &v3, 16, 1, 0);
}

- (float)topDistanceLeft
{
  return self->_topDistanceLeft;
}

- (void)setTopDistanceLeft:(float)a3
{
  self->_topDistanceLeft = a3;
}

- (float)topDistanceRight
{
  return self->_topDistanceRight;
}

- (void)setTopDistanceRight:(float)a3
{
  self->_topDistanceRight = a3;
}

- (float)topDistanceRightToBottomLeft
{
  return self->_topDistanceRightToBottomLeft;
}

- (void)setTopDistanceRightToBottomLeft:(float)a3
{
  self->_topDistanceRightToBottomLeft = a3;
}

- (float)leftDistance
{
  return self->_leftDistance;
}

- (void)setLeftDistance:(float)a3
{
  self->_leftDistance = a3;
}

- (float)rightDistance
{
  return self->_rightDistance;
}

- (void)setRightDistance:(float)a3
{
  self->_rightDistance = a3;
}

- (float)midDistance
{
  return self->_midDistance;
}

- (void)setMidDistance:(float)a3
{
  self->_midDistance = a3;
}

- (float)newParagraphIndentDistanceRatio
{
  return self->_newParagraphIndentDistanceRatio;
}

- (void)setNewParagraphIndentDistanceRatio:(float)a3
{
  self->_newParagraphIndentDistanceRatio = a3;
}

- (float)horizontalOverlap
{
  return self->_horizontalOverlap;
}

- (void)setHorizontalOverlap:(float)a3
{
  self->_horizontalOverlap = a3;
}

- (float)verticalOverlap
{
  return self->_verticalOverlap;
}

- (void)setVerticalOverlap:(float)a3
{
  self->_verticalOverlap = a3;
}

- (float)xSpace
{
  return self->_xSpace;
}

- (void)setXSpace:(float)a3
{
  self->_xSpace = a3;
}

- (float)ySpace
{
  return self->_ySpace;
}

- (void)setYSpace:(float)a3
{
  self->_ySpace = a3;
}

- (BOOL)midSentencePunctuated
{
  return self->_midSentencePunctuated;
}

- (void)setMidSentencePunctuated:(BOOL)a3
{
  self->_midSentencePunctuated = a3;
}

- (BOOL)bothBeginWithDigits
{
  return self->_bothBeginWithDigits;
}

- (void)setBothBeginWithDigits:(BOOL)a3
{
  self->_bothBeginWithDigits = a3;
}

- (BOOL)f2StartOfSentence
{
  return self->_f2StartOfSentence;
}

- (void)setF2StartOfSentence:(BOOL)a3
{
  self->_f2StartOfSentence = a3;
}

- (BOOL)oversegmentedListItem
{
  return self->_oversegmentedListItem;
}

- (void)setOversegmentedListItem:(BOOL)a3
{
  self->_oversegmentedListItem = a3;
}

- (BOOL)isHyphenatedPrefixOfWord
{
  return self->_isHyphenatedPrefixOfWord;
}

- (BOOL)shouldAllowWhitespaceDelimiter
{
  return self->_shouldAllowWhitespaceDelimiter;
}

- (BOOL)f2BeginsWithDD
{
  return self->_f2BeginsWithDD;
}

- (void)setF2BeginsWithDD:(BOOL)a3
{
  self->_f2BeginsWithDD = a3;
}

- (BOOL)f1EndsWithDD
{
  return self->_f1EndsWithDD;
}

- (void)setF1EndsWithDD:(BOOL)a3
{
  self->_f1EndsWithDD = a3;
}

- (BOOL)f2FullyDD
{
  return self->_f2FullyDD;
}

- (void)setF2FullyDD:(BOOL)a3
{
  self->_f2FullyDD = a3;
}

- (BOOL)multilineDD
{
  return self->_multilineDD;
}

- (void)setMultilineDD:(BOOL)a3
{
  self->_multilineDD = a3;
}

- (CRLineWrappingParameters)parameters
{
  return (CRLineWrappingParameters *)objc_getProperty(self, a2, 112, 1);
}

- (void)setParameters:(id)a3
{
}

- (CRLineWrappingContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (CRLineWrappingContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSString)sentencePuncStringToCheck
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSentencePuncStringToCheck:(id)a3
{
}

- (BOOL)lmScoreSet
{
  return self->_lmScoreSet;
}

- (void)setLmScoreSet:(BOOL)a3
{
  self->_lmScoreSet = a3;
}

- (BOOL)eosLMScoreSet
{
  return self->_eosLMScoreSet;
}

- (void)setEosLMScoreSet:(BOOL)a3
{
  self->_eosLMScoreSet = a3;
}

- (double)cachedLMScore
{
  return self->_cachedLMScore;
}

- (void)setCachedLMScore:(double)a3
{
  self->_cachedLMScore = a3;
}

- (double)cachedEOSLMScore
{
  return self->_cachedEOSLMScore;
}

- (void)setCachedEOSLMScore:(double)a3
{
  self->_cachedEOSLMScore = a3;
}

- (BOOL)featureTokensSet
{
  return self->_featureTokensSet;
}

- (void)setFeatureTokensSet:(BOOL)a3
{
  self->_featureTokensSet = a3;
}

- (vector<unsigned)cachedFeatureTokens
{
  objc_copyCppObjectAtomic(retstr, &self->_cachedFeatureTokens, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__0);
  return result;
}

- (void)setCachedFeatureTokens:(vector<unsigned)int
{
}

- (BOOL)contextNoText
{
  return self->_contextNoText;
}

- (void)setContextNoText:(BOOL)a3
{
  self->_contextNoText = a3;
}

- (BOOL)featureInTestNoText
{
  return self->_featureInTestNoText;
}

- (void)setFeatureInTestNoText:(BOOL)a3
{
  self->_featureInTestNoText = a3;
}

- (void).cxx_destruct
{
  begin = self->_cachedFeatureTokens.__begin_;
  if (begin)
  {
    self->_cachedFeatureTokens.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sentencePuncStringToCheck, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_featureInTest, 0);
}

- (id).cxx_construct
{
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  return self;
}

@end