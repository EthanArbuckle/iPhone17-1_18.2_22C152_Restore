@interface CRRecognizedTextRegion
- (BOOL)isCurved;
- (BOOL)whitespaceInjected;
- (CRDetectedLineRegion)detectedLineRegion;
- (CRNormalizedPolyline)polygon;
- (CRNormalizedQuad)boundingQuad;
- (CRRecognizedTextRegion)initWithType:(unint64_t)a3 detectedLineRegion:(id)a4;
- (NSArray)candidates;
- (NSArray)subregions;
- (NSString)description;
- (NSString)locale;
- (NSString)text;
- (double)activationProbability;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCharacterSubFeaturesTopWhiteSpacePoints:(id)a3 bottomWhiteSpacePoints:(id)a4 falsePositiveFiltering:(BOOL)a5;
- (id)createSubregionsForString:(id)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7 tokenPermutation:(id)a8;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)layoutDirection;
- (unint64_t)textRegionType;
- (void)_copyContentsToObject:(void *)a1;
- (void)setActivationProbability:(double)a3;
- (void)setBoundingQuad:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setDetectedLineRegion:(id)a3;
- (void)setIsCurved:(BOOL)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setPolygon:(id)a3;
- (void)setSubregions:(id)a3;
- (void)setText:(id)a3;
- (void)setTextRegionType:(unint64_t)a3;
- (void)setWhitespaceInjected:(BOOL)a3;
@end

@implementation CRRecognizedTextRegion

- (CRRecognizedTextRegion)initWithType:(unint64_t)a3 detectedLineRegion:(id)a4
{
  id v7 = a4;
  v8 = [(CRRecognizedTextRegion *)self init];
  if (v8)
  {
    uint64_t v9 = [v7 boundingQuad];
    boundingQuad = v8->_boundingQuad;
    v8->_boundingQuad = (CRNormalizedQuad *)v9;

    v8->_isCurved = [v7 isCurved];
    v8->_layoutDirection = [v7 layoutDirection];
    uint64_t v11 = [v7 polygon];
    polygon = v8->_polygon;
    v8->_polygon = (CRNormalizedPolyline *)v11;

    v8->_textRegionType = a3;
    objc_storeStrong((id *)&v8->_detectedLineRegion, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CRRecognizedTextRegion);
  if (v4) {
    -[CRRecognizedTextRegion _copyContentsToObject:](self, v4);
  }
  return v4;
}

- (void)_copyContentsToObject:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = [a1 boundingQuad];
    [v3 setBoundingQuad:v4];

    v5 = [a1 polygon];
    [v3 setPolygon:v5];

    objc_msgSend(v3, "setLayoutDirection:", objc_msgSend(a1, "layoutDirection"));
    objc_msgSend(v3, "setTextRegionType:", objc_msgSend(a1, "textRegionType"));
    v6 = [a1 text];
    [v3 setText:v6];

    id v7 = [a1 subregions];
    [v3 setSubregions:v7];

    v8 = [a1 candidates];
    [v3 setCandidates:v8];

    objc_msgSend(v3, "setIsCurved:", objc_msgSend(a1, "isCurved"));
    [a1 activationProbability];
    objc_msgSend(v3, "setActivationProbability:");
    [a1 confidence];
    objc_msgSend(v3, "setConfidence:");
    uint64_t v9 = [a1 locale];
    [v3 setLocale:v9];

    objc_msgSend(v3, "setWhitespaceInjected:", objc_msgSend(a1, "whitespaceInjected"));
    id v10 = [a1 detectedLineRegion];
    [v3 setDetectedLineRegion:v10];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CRMutableRecognizedTextRegion);
  if (v4) {
    -[CRRecognizedTextRegion _copyContentsToObject:](self, v4);
  }
  return v4;
}

- (id)createSubregionsForString:(id)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7 tokenPermutation:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v165[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  BOOL v150 = v9;
  BOOL v152 = !v9;
  v145 = v16;
  if (v10)
  {
    v18 = [v15 objectAtIndexedSubscript:0];
    [v18 pointValue];
    double v20 = v19;
    double v22 = v21;
    v23 = [v15 objectAtIndexedSubscript:1];
    [v23 pointValue];
    if (v20 == v25 && v22 == v24)
    {
      v30 = [v16 objectAtIndexedSubscript:0];
      [v30 pointValue];
      double v32 = v31;
      double v34 = v33;
      v35 = [v145 objectAtIndexedSubscript:1];
      [v35 pointValue];
      BOOL v37 = v32 == v36;
      if (v34 != v38) {
        BOOL v37 = 0;
      }
      int v151 = v37;

      id v16 = v145;
    }
    else
    {
      int v151 = 0;
    }

    v39 = [v15 lastObject];
    [v39 pointValue];
    double v41 = v40;
    double v43 = v42;
    v44 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 2);
    [v44 pointValue];
    int v141 = 0;
    if (v41 == v46 && v43 == v45)
    {
      v47 = [v16 lastObject];
      [v47 pointValue];
      double v49 = v48;
      double v51 = v50;
      v52 = objc_msgSend(v145, "objectAtIndexedSubscript:", objc_msgSend(v145, "count") - 2);
      [v52 pointValue];
      BOOL v54 = v49 == v53;
      if (v51 != v55) {
        BOOL v54 = 0;
      }
      int v141 = v54;

      id v16 = v145;
    }

    if ([v15 count] == 4)
    {
      if ((v151 & v141) != 1) {
        goto LABEL_27;
      }
    }
    else if ([v16 count] != 4 || ((v151 ^ 1) & 1) != 0 || ((v141 ^ 1) & 1) != 0)
    {
      goto LABEL_27;
    }
    v27 = (void *)[(CRRecognizedTextRegion *)self mutableCopy];
    [v27 setText:v14];
    [v27 setSubregions:0];
    [v27 setCandidates:0];
    [v27 setTextRegionType:v152];
    v164 = v27;
    v28 = (void *)MEMORY[0x1E4F1C978];
    v29 = &v164;
LABEL_26:
    v56 = [v28 arrayWithObjects:v29 count:1];
    goto LABEL_68;
  }
  if (![v15 count] || !objc_msgSend(v16, "count"))
  {
    v27 = (void *)[(CRRecognizedTextRegion *)self mutableCopy];
    [v27 setText:v14];
    [v27 setCandidates:0];
    [v27 setSubregions:0];
    [v27 setTextRegionType:v152];
    v165[0] = v27;
    v28 = (void *)MEMORY[0x1E4F1C978];
    v29 = (void **)v165;
    goto LABEL_26;
  }
  int v141 = 1;
  int v151 = 1;
LABEL_27:
  BOOL v142 = v10;
  v27 = [MEMORY[0x1E4F1CA48] array];
  v57 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v58 = [v14 componentsSeparatedByCharactersInSet:v57];

  v59 = (void *)[v58 mutableCopy];
  v60 = v59;
  id v135 = v17;
  if (v17)
  {
    v133 = v58;
    v148 = v27;
    v61 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v62 = v17;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v157 objects:v163 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v158;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v158 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = objc_msgSend(v60, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v157 + 1) + 8 * i), "unsignedIntegerValue"));
          [v61 addObject:v67];
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v157 objects:v163 count:16];
      }
      while (v64);
    }

    id v16 = v145;
    v27 = v148;
    v58 = v133;
  }
  else
  {
    v61 = v59;
  }
  [v61 removeObject:&stru_1F38EED68];
  uint64_t v68 = [v61 count];
  uint64_t v69 = 2;
  if (!v142) {
    uint64_t v69 = -2;
  }
  uint64_t v70 = v69 + 2 * v68;
  if ([v15 count] == v70 && objc_msgSend(v16, "count") == v70)
  {
    id v132 = v14;
    v134 = v58;
    v147 = v15;
    v149 = v27;
    uint64_t v71 = [v61 count];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id obj = v61;
    uint64_t v72 = [obj countByEnumeratingWithState:&v153 objects:v162 count:16];
    if (!v72) {
      goto LABEL_65;
    }
    uint64_t v73 = v72;
    uint64_t v74 = v142;
    uint64_t v146 = *(void *)v154;
    uint64_t v139 = 2 * (v71 - !v142) - 1;
    uint64_t v75 = 2;
    if (!v142) {
      uint64_t v75 = 0;
    }
    uint64_t v140 = v75;
    uint64_t v137 = !v142 - v71;
    uint64_t v136 = -(uint64_t)v142;
    while (1)
    {
      uint64_t v76 = 0;
      uint64_t v77 = 2 * v74;
      uint64_t v143 = v137 + v74;
      uint64_t v138 = v74;
      uint64_t v78 = v136 + v74;
      do
      {
        if (*(void *)v154 != v146) {
          objc_enumerationMutation(obj);
        }
        v79 = *(void **)(*((void *)&v153 + 1) + 8 * v76);
        if (v78 + v76) {
          int v80 = 0;
        }
        else {
          int v80 = v151;
        }
        if (v80 == 1)
        {
          v81 = [(CRRecognizedTextRegion *)self boundingQuad];
          [v81 topLeft];
          double v83 = v82;
          double v85 = v84;

          v86 = [(CRRecognizedTextRegion *)self boundingQuad];
          [v86 bottomLeft];
          double v88 = v87;
          double v90 = v89;

          v91 = [v147 objectAtIndexedSubscript:v140];
          [v91 pointValue];
          double v93 = v92;
          double v95 = v94;

          v96 = v16;
          uint64_t v97 = v140;
        }
        else
        {
          if (v143 + v76) {
            int v98 = 0;
          }
          else {
            int v98 = v141;
          }
          if (v98 == 1)
          {
            v99 = [v147 objectAtIndexedSubscript:v139];
            [v99 pointValue];
            double v83 = v100;
            double v85 = v101;

            v102 = [v16 objectAtIndexedSubscript:v139];
            [v102 pointValue];
            double v88 = v103;
            double v90 = v104;

            v105 = [(CRRecognizedTextRegion *)self boundingQuad];
            [v105 topRight];
            double v93 = v106;
            double v95 = v107;

            v108 = [(CRRecognizedTextRegion *)self boundingQuad];
            [v108 bottomRight];
            goto LABEL_60;
          }
          v111 = [v147 objectAtIndexedSubscript:v77 - 1];
          [v111 pointValue];
          double v83 = v112;
          double v85 = v113;

          v114 = [v145 objectAtIndexedSubscript:v77 - 1];
          [v114 pointValue];
          double v88 = v115;
          double v90 = v116;

          id v16 = v145;
          v117 = [v147 objectAtIndexedSubscript:v77];
          [v117 pointValue];
          double v93 = v118;
          double v95 = v119;

          v96 = v145;
          uint64_t v97 = v77;
        }
        v108 = [v96 objectAtIndexedSubscript:v97];
        [v108 pointValue];
LABEL_60:
        double v120 = v109;
        double v121 = v110;

        v122 = (void *)[(CRRecognizedTextRegion *)self mutableCopy];
        v123 = v122;
        if (v150)
        {
          v124 = [v79 combinedTokenSequenceString];
          [v123 setText:v124];
        }
        else
        {
          [v122 setText:v79];
        }
        [v123 setTextRegionType:v152];
        [v123 setSubregions:0];
        v125 = [CRNormalizedQuad alloc];
        v126 = [(CRRecognizedTextRegion *)self boundingQuad];
        [v126 normalizationSize];
        v129 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v125, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v83, v85, v93, v95, v120, v121, v88, v90, v127, v128);
        [v123 setBoundingQuad:v129];

        [v123 setPolygon:0];
        [v149 addObject:v123];

        ++v76;
        v77 += 2;
      }
      while (v73 != v76);
      uint64_t v73 = [obj countByEnumeratingWithState:&v153 objects:v162 count:16];
      uint64_t v74 = v138 + v76;
      if (!v73)
      {
LABEL_65:

        v27 = v149;
        v56 = [MEMORY[0x1E4F1C978] arrayWithArray:v149];
        id v14 = v132;
        v58 = v134;
        id v15 = v147;
        goto LABEL_67;
      }
    }
  }
  v130 = (void *)[(CRRecognizedTextRegion *)self mutableCopy];
  [v130 setText:v14];
  [v130 setSubregions:0];
  [v130 setCandidates:0];
  [v130 setTextRegionType:v152];
  v161 = v130;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];

LABEL_67:
  id v17 = v135;
LABEL_68:

  return v56;
}

- (id)createCharacterSubFeaturesTopWhiteSpacePoints:(id)a3 bottomWhiteSpacePoints:(id)a4 falsePositiveFiltering:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [(CRRecognizedTextRegion *)self text];
  uint64_t v12 = characterCount(v11);

  if (v8 && v9 && [v8 count] && objc_msgSend(v9, "count"))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    v13 = [(CRRecognizedTextRegion *)self text];
    id v14 = [(CRRecognizedTextRegion *)self text];
    uint64_t v15 = [v14 length];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2;
    v23[3] = &unk_1E6CDBE38;
    id v24 = v8;
    uint64_t v29 = 2 * v12 - 2;
    BOOL v31 = a5;
    id v25 = v9;
    v26 = self;
    v28 = v32;
    uint64_t v30 = v12;
    id v16 = v10;
    id v27 = v16;
    objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v23);

    id v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v18 = [(CRRecognizedTextRegion *)self text];
    double v19 = [(CRRecognizedTextRegion *)self text];
    uint64_t v20 = [v19 length];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke;
    v33[3] = &unk_1E6CDBE10;
    v33[4] = self;
    id v21 = v10;
    id v34 = v21;
    objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 2, v33);

    id v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v21];
  }
  return v17;
}

void __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)[v3 mutableCopy];
  [v5 setTextRegionType:0];
  [v5 setText:v4];

  [*(id *)(a1 + 40) addObject:v5];
}

void __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2(uint64_t a1, void *a2)
{
  id v47 = a2;
  if ([*(id *)(a1 + 32) count] != *(void *)(a1 + 72)
    || [*(id *)(a1 + 40) count] != *(void *)(a1 + 72))
  {
    id v25 = (void *)[*(id *)(a1 + 48) mutableCopy];
    [v25 setText:v47];
    [v25 setCandidates:0];
    [v25 setSubregions:0];
    [v25 setTextRegionType:0];
LABEL_9:
    [*(id *)(a1 + 56) addObject:v25];

    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 88)
    || ([MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v47 rangeOfCharacterFromSet:v3],
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 80) - 1;
      id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2 * v5 - 1];
      [v7 pointValue];
      double v9 = v8;
      double v11 = v10;

      uint64_t v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - 1];
      [v12 pointValue];
      double v14 = v13;
      double v16 = v15;

      if (v5 == v6)
      {
        id v17 = [*(id *)(a1 + 48) boundingQuad];
        [v17 topRight];
        double v19 = v18;
        double v21 = v20;

        double v22 = [*(id *)(a1 + 48) boundingQuad];
        [v22 bottomRight];
LABEL_16:
        double v40 = v23;
        double v41 = v24;

        id v25 = (void *)[*(id *)(a1 + 48) mutableCopy];
        [v25 setTextRegionType:0];
        [v25 setText:v47];
        double v42 = [CRNormalizedQuad alloc];
        double v43 = [*(id *)(a1 + 48) boundingQuad];
        [v43 normalizationSize];
        double v46 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v42, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v9, v11, v19, v21, v40, v41, v14, v16, v44, v45);
        [v25 setBoundingQuad:v46];

        [v25 setPolygon:0];
        goto LABEL_9;
      }
      BOOL v37 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      [v37 pointValue];
      double v19 = v38;
      double v21 = v39;

      v35 = *(void **)(a1 + 40);
      uint64_t v36 = 2 * *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    else
    {
      v26 = [*(id *)(a1 + 48) boundingQuad];
      [v26 topLeft];
      double v9 = v27;
      double v11 = v28;

      uint64_t v29 = [*(id *)(a1 + 48) boundingQuad];
      [v29 bottomLeft];
      double v14 = v30;
      double v16 = v31;

      double v32 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      [v32 pointValue];
      double v19 = v33;
      double v21 = v34;

      v35 = *(void **)(a1 + 40);
      uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    double v22 = [v35 objectAtIndexedSubscript:v36];
    [v22 pointValue];
    goto LABEL_16;
  }
LABEL_10:
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  uint64_t v4 = [(CRRecognizedTextRegion *)self text];
  uint64_t v5 = [(CRRecognizedTextRegion *)self boundingQuad];
  uint64_t v6 = [v3 stringWithFormat:@"\"%@\"\t%@", v4, v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(CRRecognizedTextRegion *)self subregions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v6;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v6 = [v12 stringByAppendingFormat:@"\n\t%@", *(void *)(*((void *)&v14 + 1) + 8 * v11)];

        ++v11;
        uint64_t v12 = v6;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSString *)v6;
}

- (double)activationProbability
{
  return self->_activationProbability;
}

- (void)setActivationProbability:(double)a3
{
  self->_activationProbability = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPolygon:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocale:(id)a3
{
}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (BOOL)whitespaceInjected
{
  return self->_whitespaceInjected;
}

- (void)setWhitespaceInjected:(BOOL)a3
{
  self->_whitespaceInjected = a3;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubregions:(id)a3
{
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCandidates:(id)a3
{
}

- (CRDetectedLineRegion)detectedLineRegion
{
  return (CRDetectedLineRegion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDetectedLineRegion:(id)a3
{
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBoundingQuad:(id)a3
{
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setText:(id)a3
{
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (void)setTextRegionType:(unint64_t)a3
{
  self->_textRegionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_detectedLineRegion, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
}

@end