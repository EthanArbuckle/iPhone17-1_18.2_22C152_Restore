@interface CRTrackedRegionGroup
+ (id)groupsFromOutputRegions:(id)a3;
- (BOOL)addGroupRegionIfValid:(id)a3 context:(id)a4;
- (BOOL)addInlineGroupIfValid:(id)a3;
- (BOOL)isInlineGroup;
- (BOOL)trackNeedsReplacement;
- (CRImageSpaceQuad)boundingQuadAfterOCR;
- (CRNormalizedQuad)boundingQuad;
- (CRNormalizedQuad)boundingQuadAtOCRDispatch;
- (CRNormalizedQuad)originalBoundingQuad;
- (CRTrackedRegionGroup)initWithRegion:(id)a3;
- (CRVCQuad)vcQuad;
- (NSArray)children;
- (NSArray)regionTrackingIDs;
- (NSNumber)averageLineHeight;
- (NSNumber)homographyGroupID;
- (NSString)description;
- (NSUUID)trackingID;
- (double)boundingQuadHomography;
- (double)boundingQuadHomographySinceOCRDispatch;
- (double)initialOrthogonalityScore;
- (double)lastOriginalBoundingQuadUpdateTime;
- (id)estimatedPerspectiveQuad;
- (unint64_t)layoutDirection;
- (unint64_t)numberOfLines;
- (unint64_t)textAlignment;
- (void)_commitRegionToGroup:(void *)a3 unionQuad:(void *)a4 totalLineHeight:;
- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5;
- (void)setBoundingQuad:(id)a3;
- (void)setBoundingQuadAfterOCR:(id)a3;
- (void)setBoundingQuadAtOCRDispatch:(id)a3;
- (void)setBoundingQuadHomography:(__n128)a3;
- (void)setHomographyGroupID:(id)a3;
- (void)setInitialOrthogonalityScore:(double)a3;
- (void)setOriginalBoundingQuad:(id)a3;
- (void)setTextAlignment:(unint64_t)a3;
- (void)setTrackNeedsReplacement:(BOOL)a3;
- (void)setTrackingID:(id)a3;
- (void)updateBoundingQuadAfterOCR;
- (void)updatePreviousAssociationQuad;
@end

@implementation CRTrackedRegionGroup

- (CRTrackedRegionGroup)initWithRegion:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRTrackedRegionGroup;
  v5 = [(CRTrackedRegionGroup *)&v29 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v7 = [v4 trackingID];
    v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);
    objc_setProperty_atomic(v5, v9, v8, 56);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
    objc_setProperty_atomic(v5, v11, v10, 64);

    v5->_numberOfLines = [v4 numberOfLines];
    v5->_isInlineGroup = 0;
    objc_setProperty_atomic(v5, v12, 0, 128);
    v13 = [v4 boundingQuad];
    [(CRTrackedRegionGroup *)v5 setBoundingQuad:v13];

    v14 = [v4 boundingQuad];
    [(CRTrackedRegionGroup *)v5 setOriginalBoundingQuad:v14];

    -[CRTrackedRegionGroup setBoundingQuadHomography:](v5, "setBoundingQuadHomography:", *MEMORY[0x1E4F14998], *(double *)(MEMORY[0x1E4F14998] + 16), *(double *)(MEMORY[0x1E4F14998] + 32));
    [(CRTrackedRegionGroup *)v5 setHomographyGroupID:0];
    [(CRTrackedRegionGroup *)v5 setInitialOrthogonalityScore:1.0];
    [(CRTrackedRegionGroup *)v5 setTrackNeedsReplacement:0];
    v15 = [MEMORY[0x1E4F29128] UUID];
    objc_setProperty_atomic(v5, v16, v15, 136);

    v17 = [CRVCQuad alloc];
    v18 = [v4 boundingQuad];
    v19 = [v18 denormalizedQuad];
    v21 = [(CRVCQuad *)v17 initWithImageSpaceQuad:v19 uuid:objc_getProperty(v5, v20, 136, 1)];
    objc_setProperty_atomic(v5, v22, v21, 80);

    -[CRTrackedRegionGroup setTextAlignment:](v5, "setTextAlignment:", [v4 textAlignment]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [v4 geometryInfo];
      if ([v4 numberOfLines] < 2)
      {
        char v24 = 1;
        v5->_isTextLeftJustified = 1;
      }
      else
      {
        v5->_isTextLeftJustified = [v23 isLeftJustified];
        char v24 = [v23 isRightJustified];
      }
      v5->_isTextRightJustified = v24;
      v25 = NSNumber;
      [v23 estimatedLineHeight];
      v26 = objc_msgSend(v25, "numberWithDouble:");
      objc_setProperty_atomic(v5, v27, v26, 128);
    }
    else
    {
      *(_WORD *)&v5->_isTextLeftJustified = 0;
    }
    v5->_groupChildrenAlignment = 0;
    v5->_layoutDirection = [v4 layoutDirection];
  }

  return v5;
}

- (BOOL)addGroupRegionIfValid:(id)a3 context:(id)a4
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 layoutDirection];
  if (v8 == [(CRTrackedRegionGroup *)self layoutDirection])
  {
    SEL v9 = [(NSMutableArray *)self->_children lastObject];
    [v9 baselineAngle];
    double v11 = v10;
    [v6 baselineAngle];
    double v13 = v11 - v12;
    if (v13 <= 3.14159265)
    {
      if (v13 > -3.14159265) {
        goto LABEL_8;
      }
      double v14 = 6.28318531;
    }
    else
    {
      double v14 = -6.28318531;
    }
    double v13 = v13 + v14;
LABEL_8:
    if (fabs(v13) > 0.34906585)
    {
      BOOL v15 = 0;
LABEL_84:

      goto LABEL_85;
    }
    SEL v16 = [v9 geometryInfo];
    v17 = [v6 geometryInfo];
    [v6 baselineAngle];
    double v19 = v18;
    SEL v20 = [(CRTrackedRegionGroup *)self boundingQuad];
    [v20 baselineAngle];
    double v22 = v21;
    v23 = [(CRTrackedRegionGroup *)self children];
    double v24 = (double)(unint64_t)[v23 count];
    __double2 v25 = __sincos_stret(v19);
    __double2 v26 = __sincos_stret(v22);
    double v27 = atan2(v25.__sinval + v26.__sinval * v24, v25.__cosval + v26.__cosval * v24);

    v28 = [(CRTrackedRegionGroup *)self boundingQuad];
    objc_super v29 = [v6 boundingQuad];
    if (v27 <= 3.14159265)
    {
      HIDWORD(v30) = -1073143301;
      if (v27 > -3.14159265) {
        goto LABEL_15;
      }
      double v30 = 6.28318531;
    }
    else
    {
      double v30 = -6.28318531;
    }
    double v27 = v27 + v30;
LABEL_15:
    *(float *)&double v30 = v27;
    v31 = [v28 unionWithNormalizedQuad:v29 baselineAngle:v30];

    objc_opt_class();
    v181 = v31;
    if (objc_opt_isKindOfClass())
    {
      id v32 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v9, [v9 layoutDirection]);
      id v175 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v6, [v6 layoutDirection]);
      v33 = objc_msgSend(v32, "mutualGeometryInfoWith:");
      v34 = [v9 geometryInfo];
      v35 = [v6 geometryInfo];
      [v34 estimatedLineHeight];
      double v172 = v36;
      v171 = v35;
      [v35 estimatedLineHeight];
      double v173 = v37;
      v180 = v33;
      v174 = v34;
      if ([v33 isCenterJustified] && (objc_msgSend(v34, "isLeftJustified") & 1) == 0) {
        char v38 = [v34 isRightJustified] ^ 1;
      }
      else {
        char v38 = 0;
      }
      v53 = v32;
      [v180 leftOffsetAlongBaseline];
      double v177 = v54;
      [v180 rightOffsetAlongBaseline];
      double v167 = v55;
      [v180 leftOffsetAlongBaseline];
      double v169 = v56;
      [v16 size];
      double v165 = v57;
      [v17 size];
      double v163 = v58;
      [v180 rightOffsetAlongBaseline];
      double v60 = v59;
      [v16 size];
      double v62 = v61;
      [v17 size];
      double v64 = v63;
      [v180 leftOffsetAlongBaseline];
      double v66 = v65;
      [v16 size];
      double v68 = v67;
      [v17 size];
      double v70 = v66 / fmin(v68, v69);
      [v180 rightOffsetAlongBaseline];
      double v72 = v71;
      [v16 size];
      double v74 = v73;
      [v17 size];
      double v76 = v75;
      [v180 leftOffsetAlongBaseline];
      double v78 = v77;
      [v32 size];
      BOOL v80 = fabs(v70) < 1.0 || fabs(-v72 / fmin(v74, v76)) < 1.0;
      BOOL v81 = v173 / v172 >= 0.588235294;
      if (v173 / v172 > 1.7) {
        BOOL v81 = 0;
      }
      if (v38)
      {
        int v82 = 1;
      }
      else
      {
        double v83 = -v167 / v172;
        double v84 = v169 / fmax(v165, v163);
        double v85 = -v60 / fmax(v62, v64);
        BOOL v86 = v177 / v172 < -1.6;
        if (v177 / v172 > 1.6) {
          BOOL v86 = 1;
        }
        if (v84 < -0.4) {
          BOOL v86 = 1;
        }
        if (v84 > 0.4) {
          BOOL v86 = 1;
        }
        BOOL v87 = v83 < -1.6;
        if (v83 > 1.6) {
          BOOL v87 = 1;
        }
        if (v85 < -0.4) {
          BOOL v87 = 1;
        }
        if (v85 > 0.4) {
          BOOL v87 = 1;
        }
        int v82 = !v86 || !v87;
      }
      v52 = 0;
      int v88 = 1;
      if (v80 && v81)
      {
        if (v82)
        {
          double v89 = (v78 - v79) / v172;
          if (v89 >= -1.0 && v89 <= 1.0)
          {
            v164 = v53;
            v166 = v17;
            v168 = v16;
            v170 = v9;
            v90 = [(CRTrackedRegionGroup *)self boundingQuad];
            v91 = [v90 denormalizedQuad];
            [v91 bottomLeft];
            double v93 = v92;
            double v95 = v94;

            v96 = [(CRTrackedRegionGroup *)self boundingQuad];
            v97 = [v96 denormalizedQuad];
            [v97 bottomRight];
            double v99 = v98;
            double v178 = v98;
            double v101 = v100;
            double v162 = v100;

            [v175 bottomLeft];
            double v102 = *MEMORY[0x1E4F1DB30];
            double v103 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
            double v106 = squaredDistanceFromPointToLineDefinedByPoints(v104, v105, v93, v95, v99, v101, *MEMORY[0x1E4F1DB30], v103);
            [v175 bottomRight];
            double v159 = squaredDistanceFromPointToLineDefinedByPoints(v107, v108, v93, v95, v99, v101, v102, v103);
            double v109 = atan2(v101 - v95, v99 - v93);
            double v161 = rotatedPointAroundPoint(v99, v101, v93, v95, v109);
            [v175 bottomLeft];
            double v112 = rotatedPointAroundPoint(v110, v111, v93, v95, v109);
            double v114 = v113;
            [v175 bottomRight];
            double v118 = rotatedPointAroundPoint(v115, v116, v93, v95, v109);
            if (v106 <= v159) {
              double v119 = v114;
            }
            else {
              double v119 = v117;
            }
            [v174 estimatedLineHeight];
            double v121 = v119 + v120 * -0.2;
            double v122 = rotatedPointAroundPoint(v93, v121, v93, v95, -v109);
            double v160 = v123;
            double v124 = rotatedPointAroundPoint(v161, v121, v93, v95, -v109);
            v126 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v93, v95, v178, v162, v124, v125, v122, v160);
            long long v182 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v185 = 0u;
            id v179 = v7;
            id v127 = v7;
            uint64_t v128 = [v127 countByEnumeratingWithState:&v182 objects:v186 count:16];
            if (v128)
            {
              uint64_t v129 = v128;
              uint64_t v130 = *(void *)v183;
              while (2)
              {
                for (uint64_t i = 0; i != v129; ++i)
                {
                  if (*(void *)v183 != v130) {
                    objc_enumerationMutation(v127);
                  }
                  v132 = *(void **)(*((void *)&v182 + 1) + 8 * i);
                  v133 = [v132 boundingQuad];
                  v134 = [v133 denormalizedQuad];
                  [v134 bottomLeft];
                  double v137 = rotatedPointAroundPoint(v135, v136, v93, v95, v109);

                  v138 = [v132 boundingQuad];
                  v139 = [v138 denormalizedQuad];
                  [v139 bottomRight];
                  double v142 = rotatedPointAroundPoint(v140, v141, v93, v95, v109);

                  if ((v137 <= v112 || v137 >= v118)
                    && (v142 <= v112 || v142 >= v118)
                    && (v137 >= v112 || v142 <= v118))
                  {
                    v146 = [v132 boundingQuad];
                    v147 = [v146 denormalizedQuad];
                    char v148 = [v147 intersectsQuad:v126];

                    if (v148)
                    {
                      v52 = 0;
                      int v88 = 1;
                      id v7 = v179;
                      goto LABEL_78;
                    }
                  }
                }
                uint64_t v129 = [v127 countByEnumeratingWithState:&v182 objects:v186 count:16];
                if (v129) {
                  continue;
                }
                break;
              }
            }

            uint64_t v149 = [(CRTrackedRegionGroup *)self averageLineHeight];
            id v7 = v179;
            if (!v149
              || (v150 = (void *)v149,
                  [(CRTrackedRegionGroup *)self children],
                  v151 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v152 = [v151 count],
                  v151,
                  v150,
                  v152 == 1))
            {
              v154 = [NSNumber numberWithDouble:v172];
              if (self) {
                objc_setProperty_atomic(self, v153, v154, 128);
              }
            }
            v155 = NSNumber;
            id v127 = [(CRTrackedRegionGroup *)self averageLineHeight];
            [v127 doubleValue];
            v52 = objc_msgSend(v155, "numberWithDouble:", v173 * (double)objc_msgSend(v6, "numberOfLines")+ v156 * (double)-[CRTrackedRegionGroup numberOfLines](self, "numberOfLines"));
            int v88 = 0;
LABEL_78:
            SEL v9 = v170;

            v17 = v166;
            SEL v16 = v168;
            v53 = v164;
            v34 = v174;
          }
        }
      }

      if (v88)
      {
        BOOL v15 = 0;
        goto LABEL_81;
      }
    }
    else
    {
      id v176 = v7;
      v39 = v17;
      v40 = v16;
      v41 = [v31 denormalizedQuad];
      [v41 area];
      double v43 = v42;

      v44 = [(CRTrackedRegionGroup *)self boundingQuad];
      v45 = [v44 denormalizedQuad];
      [v45 area];
      double v47 = v46;
      v48 = [v6 boundingQuad];
      v49 = [v48 denormalizedQuad];
      [v49 area];
      double v51 = v47 + v50;

      v52 = 0;
      if (v43 > v51 * 1.5)
      {
        BOOL v15 = 0;
        SEL v16 = v40;
        v17 = v39;
        id v7 = v176;
LABEL_81:
        v157 = v181;
LABEL_83:

        goto LABEL_84;
      }
      SEL v16 = v40;
      v17 = v39;
      id v7 = v176;
    }
    v157 = v181;
    -[CRTrackedRegionGroup _commitRegionToGroup:unionQuad:totalLineHeight:]((uint64_t)self, v6, v181, v52);
    BOOL v15 = 1;
    goto LABEL_83;
  }
  BOOL v15 = 0;
LABEL_85:

  return v15;
}

- (void)_commitRegionToGroup:(void *)a3 unionQuad:(void *)a4 totalLineHeight:
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!a1) {
    goto LABEL_86;
  }
  id v9 = a3;
  [(id)a1 setBoundingQuad:v9];
  [(id)a1 setOriginalBoundingQuad:v9];
  objc_msgSend((id)a1, "setBoundingQuadHomography:", *MEMORY[0x1E4F14998], *(double *)(MEMORY[0x1E4F14998] + 16), *(double *)(MEMORY[0x1E4F14998] + 32));
  double v10 = [(id)a1 vcQuad];
  double v11 = [v9 denormalizedQuad];

  [v10 updateWithQuad:v11];
  double v12 = [(id)a1 regionTrackingIDs];
  double v13 = [v7 trackingID];
  [v12 addObject:v13];

  double v14 = [(id)a1 children];
  [v14 addObject:v7];

  if (([(id)a1 isInlineGroup] & 1) == 0)
  {
    uint64_t v15 = [v7 numberOfLines];
    *(void *)(a1 + 72) = [(id)a1 numberOfLines] + v15;
  }
  if (v8)
  {
    SEL v16 = NSNumber;
    [v8 doubleValue];
    double v18 = objc_msgSend(v16, "numberWithDouble:", v17 / (double)(unint64_t)objc_msgSend((id)a1, "numberOfLines"));
    objc_setProperty_atomic((id)a1, v19, v18, 128);
  }
  SEL v20 = CROSLogForCategory(4);
  double v21 = @"-";
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = [(id)a1 numberOfLines];
    v23 = [(id)a1 children];
    uint64_t v24 = [v23 count];
    if (*(unsigned char *)(a1 + 10)) {
      __double2 v25 = @"L";
    }
    else {
      __double2 v25 = @"-";
    }
    if (*(unsigned char *)(a1 + 11)) {
      __double2 v26 = @"R";
    }
    else {
      __double2 v26 = @"-";
    }
    *(_DWORD *)double v83 = 134218754;
    *(void *)&v83[4] = v22;
    *(_WORD *)&v83[12] = 2048;
    *(void *)&v83[14] = v24;
    *(_WORD *)&v83[22] = 2112;
    double v84 = v25;
    __int16 v85 = 2112;
    BOOL v86 = v26;
    _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEBUG, "ALIGNMENT: %ld line(s) %ld child(ren)\t%@-%@", v83, 0x2Au);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 numberOfLines] < 2)
    {
      int v33 = 0;
    }
    else
    {
      double v27 = [v7 geometryInfo];
      int v28 = [v27 isCenterJustified];
      objc_super v29 = CROSLogForCategory(4);
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v28)
      {
        if (v30)
        {
          if (*(unsigned char *)(a1 + 10)) {
            v31 = @"L";
          }
          else {
            v31 = @"-";
          }
          id v32 = @"R";
          if ((*(unsigned char *)(a1 + 11) & 1) == 0) {
            id v32 = @"-";
          }
          *(_DWORD *)double v83 = 138412546;
          *(void *)&v83[4] = v31;
          *(_WORD *)&v83[12] = 2112;
          *(void *)&v83[14] = v32;
          _os_log_impl(&dword_1DD733000, v29, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: multiline: C before: %@-%@", v83, 0x16u);
        }

        if (*(unsigned char *)(a1 + 10) & 1) != 0 && (*(unsigned char *)(a1 + 11)) {
          [(id)a1 setTextAlignment:1];
        }
        int v33 = 0;
      }
      else
      {
        if (v30)
        {
          if ([v27 isLeftJustified]) {
            v35 = @"L";
          }
          else {
            v35 = @"-";
          }
          if ([v27 isRightJustified]) {
            double v36 = @"R";
          }
          else {
            double v36 = @"-";
          }
          char v37 = *(unsigned char *)(a1 + 11);
          if (*(unsigned char *)(a1 + 10)) {
            char v38 = @"L";
          }
          else {
            char v38 = @"-";
          }
          *(_DWORD *)double v83 = 138413058;
          if (v37) {
            v39 = @"R";
          }
          else {
            v39 = @"-";
          }
          *(void *)&v83[4] = v35;
          *(_WORD *)&v83[12] = 2112;
          *(void *)&v83[14] = v36;
          *(_WORD *)&v83[22] = 2112;
          double v84 = v38;
          __int16 v85 = 2112;
          BOOL v86 = v39;
          _os_log_impl(&dword_1DD733000, v29, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: multiline: %@-%@ before: %@-%@", v83, 0x2Au);
        }

        if ([v27 isLeftJustified]) {
          int v33 = [v27 isRightJustified];
        }
        else {
          int v33 = 0;
        }
        if (*(unsigned char *)(a1 + 10)) {
          char v40 = [v27 isLeftJustified];
        }
        else {
          char v40 = 0;
        }
        *(unsigned char *)(a1 + 10) = v40;
        if (*(unsigned char *)(a1 + 11)) {
          char v41 = [v27 isRightJustified];
        }
        else {
          char v41 = 0;
        }
        *(unsigned char *)(a1 + 11) = v41;
      }
    }
    if (*(unsigned char *)(a1 + 10) & 1) != 0 || (BOOL v34 = v33 != 0, (*(unsigned char *)(a1 + 11)))
    {
      double v42 = objc_msgSend((id)a1, "children", *(void *)v83);
      double v43 = [(id)a1 boundingQuad];
      [v43 baselineAngle];
      v44 = +[CRParagraphOutputRegion paragraphWithLines:confidence:baselineAngle:](CRParagraphOutputRegion, "paragraphWithLines:confidence:baselineAngle:", v42, 2);

      v45 = [v44 geometryInfo];
      *(void *)(a1 + 144) = [v44 textAlignment];
      double v46 = CROSLogForCategory(4);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = *(void *)(a1 + 144);
        if (*(unsigned char *)(a1 + 10)) {
          v48 = @"L";
        }
        else {
          v48 = @"-";
        }
        v49 = @"R";
        if ((*(unsigned char *)(a1 + 11) & 1) == 0) {
          v49 = @"-";
        }
        *(_DWORD *)double v83 = 134218498;
        *(void *)&v83[4] = v47;
        *(_WORD *)&v83[12] = 2112;
        *(void *)&v83[14] = v48;
        *(_WORD *)&v83[22] = 2112;
        double v84 = v49;
        _os_log_impl(&dword_1DD733000, v46, OS_LOG_TYPE_DEBUG, "  ALIGNMENT: SETGROUP %ld   %@-%@", v83, 0x20u);
      }

      if (*(unsigned char *)(a1 + 10)) {
        char v50 = [v45 isLeftJustified];
      }
      else {
        char v50 = 0;
      }
      *(unsigned char *)(a1 + 10) = v50;
      if (*(unsigned char *)(a1 + 11)) {
        char v51 = [v45 isRightJustified];
      }
      else {
        char v51 = 0;
      }
      *(unsigned char *)(a1 + 11) = v51;

      BOOL v34 = v33 != 0;
    }
  }
  else
  {
    BOOL v34 = 0;
  }
  uint64_t v52 = objc_msgSend((id)a1, "numberOfLines", *(void *)v83);
  v53 = [(id)a1 children];
  uint64_t v54 = [v53 count];

  if (v52 == v54)
  {
    double v55 = CROSLogForCategory(4);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
LABEL_73:
      uint64_t v56 = [(id)a1 textAlignment];
      uint64_t v57 = *(void *)(a1 + 144);
      *(_DWORD *)double v83 = 134218240;
      *(void *)&v83[4] = v56;
      *(_WORD *)&v83[12] = 2048;
      *(void *)&v83[14] = v57;
      _os_log_impl(&dword_1DD733000, v55, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit group children alignment %ld->%ld", v83, 0x16u);
    }
LABEL_74:

    uint64_t v58 = *(void *)(a1 + 144);
LABEL_75:
    objc_msgSend((id)a1, "setTextAlignment:", v58, *(_OWORD *)v83, *(void *)&v83[16]);
    goto LABEL_76;
  }
  uint64_t v69 = [(id)a1 numberOfLines];
  uint64_t v70 = v69 - [v7 numberOfLines];
  double v71 = [(id)a1 children];
  uint64_t v72 = [v71 count] - 1;

  if (v70 != v72)
  {
    uint64_t v78 = [(id)a1 textAlignment];
    if (v78 != [v7 textAlignment] && objc_msgSend(v7, "numberOfLines") >= 2 && !v34)
    {
      [(id)a1 setTextAlignment:0];
      BOOL v80 = CROSLogForCategory(4);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v83 = 0;
        _os_log_impl(&dword_1DD733000, v80, OS_LOG_TYPE_DEBUG, "ALIGNMENT: mixed alignments", v83, 2u);
      }
    }
    goto LABEL_76;
  }
  uint64_t v73 = *(void *)(a1 + 144);
  if (v73 == [v7 textAlignment])
  {
    double v74 = CROSLogForCategory(4);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v75 = [(id)a1 textAlignment];
      uint64_t v76 = [v7 textAlignment];
      *(_DWORD *)double v83 = 134218240;
      *(void *)&v83[4] = v75;
      *(_WORD *)&v83[12] = 2048;
      *(void *)&v83[14] = v76;
      _os_log_impl(&dword_1DD733000, v74, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit new region's alignment (same children+text alignment) %ld->%ld", v83, 0x16u);
    }

    objc_msgSend((id)a1, "setTextAlignment:", objc_msgSend(v7, "textAlignment"));
  }
  if ((*(unsigned char *)(a1 + 10) & 1) != (*(unsigned char *)(a1 + 11) & 1) && ![(id)a1 textAlignment])
  {
    double v55 = CROSLogForCategory(4);
    BOOL v77 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
    if (!v34)
    {
      if (v77)
      {
        uint64_t v81 = [(id)a1 textAlignment];
        uint64_t v82 = [v7 textAlignment];
        *(_DWORD *)double v83 = 134218240;
        *(void *)&v83[4] = v81;
        *(_WORD *)&v83[12] = 2048;
        *(void *)&v83[14] = v82;
        _os_log_impl(&dword_1DD733000, v55, OS_LOG_TYPE_DEBUG, "ALIGNMENT: inherit new region's alignment (text L^R and unknown) %ld->%ld", v83, 0x16u);
      }

      uint64_t v58 = [v7 textAlignment];
      goto LABEL_75;
    }
    if (v77) {
      goto LABEL_73;
    }
    goto LABEL_74;
  }
LABEL_76:
  double v59 = CROSLogForCategory(4);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v60 = [(id)a1 numberOfLines];
    double v61 = [(id)a1 children];
    uint64_t v62 = [v61 count];
    if (*(unsigned char *)(a1 + 10)) {
      double v63 = @"L";
    }
    else {
      double v63 = @"-";
    }
    if (*(unsigned char *)(a1 + 11)) {
      double v21 = @"R";
    }
    uint64_t v64 = [(id)a1 textAlignment];
    *(_DWORD *)double v83 = 134219010;
    *(void *)&v83[4] = v60;
    *(_WORD *)&v83[12] = 2048;
    *(void *)&v83[14] = v62;
    *(_WORD *)&v83[22] = 2112;
    double v84 = v63;
    __int16 v85 = 2112;
    BOOL v86 = v21;
    __int16 v87 = 2048;
    uint64_t v88 = v64;
    _os_log_impl(&dword_1DD733000, v59, OS_LOG_TYPE_DEBUG, "ALIGNMENT: DONE %ld line(s) %ld child(ren)\t%@-%@\t%ld", v83, 0x34u);
  }
  double v65 = CROSLogForCategory(4);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    double v66 = [(id)a1 children];
    double v67 = [v66 lastObject];
    double v68 = [v67 text];
    *(_DWORD *)double v83 = 138412290;
    *(void *)&v83[4] = v68;
    _os_log_impl(&dword_1DD733000, v65, OS_LOG_TYPE_DEBUG, "*  ALIGNMENT: DONE %@", v83, 0xCu);
  }
LABEL_86:
}

- (BOOL)addInlineGroupIfValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 layoutDirection];
  if (v5 == [(CRTrackedRegionGroup *)self layoutDirection])
  {
    id v6 = [v4 children];
    id v7 = [v6 lastObject];

    id v8 = [(NSMutableArray *)self->_children lastObject];
    [v8 baselineAngle];
    double v10 = v9;
    [v7 baselineAngle];
    double v12 = v10 - v11;
    if (v12 <= 3.14159265)
    {
      if (v12 > -3.14159265) {
        goto LABEL_8;
      }
      double v13 = 6.28318531;
    }
    else
    {
      double v13 = -6.28318531;
    }
    double v12 = v12 + v13;
LABEL_8:
    if (fabs(v12) > 0.34906585)
    {
      LOBYTE(v14) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v15 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v8, [v8 layoutDirection]);
    id v16 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v7, [v7 layoutDirection]);
    double v17 = [v15 mutualGeometryInfoWith:v16];
    [v15 estimatedLineHeight];
    double v19 = v18;
    [v16 estimatedLineHeight];
    double v21 = v20;
    [v17 inlineSpacingAlongBaseline];
    double v23 = v22 / v19;
    [v17 leftOffsetAlongBaseline];
    double v25 = v24 / v19;
    BOOL v26 = v21 / v19 >= 0.588235294;
    if (v21 / v19 > 1.7) {
      BOOL v26 = 0;
    }
    BOOL v27 = v23 >= -0.5;
    if (v23 > 0.3) {
      BOOL v27 = 0;
    }
    int v28 = v26 && v27;
    if (v25 < -0.3) {
      int v28 = 0;
    }
    if (v25 <= 0.3) {
      BOOL v14 = v28;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
LABEL_26:

      goto LABEL_27;
    }
    v49 = v15;
    [v7 baselineAngle];
    double v30 = v29;
    v31 = [(CRTrackedRegionGroup *)self boundingQuad];
    [v31 baselineAngle];
    double v33 = v32;
    BOOL v34 = [(CRTrackedRegionGroup *)self children];
    double v35 = (double)(unint64_t)[v34 count];
    __double2 v36 = __sincos_stret(v30);
    __double2 v37 = __sincos_stret(v33);
    double v38 = atan2(v36.__sinval + v37.__sinval * v35, v36.__cosval + v37.__cosval * v35);

    v39 = [(CRTrackedRegionGroup *)self boundingQuad];
    char v40 = [v7 boundingQuad];
    if (v38 <= 3.14159265)
    {
      HIDWORD(v41) = -1073143301;
      if (v38 > -3.14159265)
      {
LABEL_25:
        *(float *)&double v41 = v38;
        double v42 = [v39 unionWithNormalizedQuad:v40 baselineAngle:v41];

        double v43 = NSNumber;
        id v15 = v49;
        [v49 estimatedLineHeight];
        double v45 = v44;
        [v16 estimatedLineHeight];
        uint64_t v47 = [v43 numberWithDouble:v45 + v46];
        -[CRTrackedRegionGroup _commitRegionToGroup:unionQuad:totalLineHeight:]((uint64_t)self, v7, v42, v47);

        goto LABEL_26;
      }
      double v41 = 6.28318531;
    }
    else
    {
      double v41 = -6.28318531;
    }
    double v38 = v38 + v41;
    goto LABEL_25;
  }
  LOBYTE(v14) = 0;
LABEL_28:

  return v14;
}

- (id)estimatedPerspectiveQuad
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  if ([(CRTrackedRegionGroup *)self isInlineGroup]) {
    goto LABEL_7;
  }
  v3 = [(CRTrackedRegionGroup *)self children];
  id v4 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  unint64_t v6 = [(CRTrackedRegionGroup *)self numberOfLines];
  id v7 = 0;
  if (self && v6 >= 2)
  {
    if (!self->_isTextLeftJustified && !self->_isTextRightJustified)
    {
LABEL_7:
      id v7 = 0;
      goto LABEL_8;
    }
    v224 = [MEMORY[0x1E4F1CA48] array];
    long long v229 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    double v9 = self;
    obuint64_t j = [(CRTrackedRegionGroup *)self children];
    uint64_t v10 = [obj countByEnumeratingWithState:&v229 objects:v234 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v230;
      double v16 = *MEMORY[0x1E4F1DAD8];
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v18 = 1.79769313e308;
      double v19 = 2.22507386e-308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v230 != v15) {
            objc_enumerationMutation(obj);
          }
          double v21 = *(void **)(*((void *)&v229 + 1) + 8 * i);
          double v22 = [v21 children];
          [v224 addObjectsFromArray:v22];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 topBottomEdgesQuad];
          }
          else {
          double v23 = [v21 boundingQuad];
          }
          [v23 topLeft];
          double v25 = v24;
          double v27 = v26;
          int v28 = [(CRTrackedRegionGroup *)v9 boundingQuad];
          [v28 baselineAngle];
          rotatedPointAroundPoint(v25, v27, v16, v17, v29);
          double v31 = v30;

          if (v31 < v18)
          {
            uint64_t v14 = v12 + i;
            double v18 = v31;
          }
          if (v31 > v19)
          {
            uint64_t v13 = v12 + i;
            double v19 = v31;
          }
        }
        v12 += v11;
        uint64_t v11 = [obj countByEnumeratingWithState:&v229 objects:v234 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }

    BOOL isTextLeftJustified = v9->_isTextLeftJustified;
    BOOL isTextRightJustified = v9->_isTextRightJustified;
    if (!isTextLeftJustified && !isTextRightJustified)
    {
      id v7 = 0;
LABEL_64:

      goto LABEL_8;
    }
    BOOL v34 = v9;
    double v35 = [(CRTrackedRegionGroup *)v9 children];
    __double2 v36 = [v35 objectAtIndexedSubscript:v14];
    __double2 v37 = [v36 boundingQuad];
    double v38 = [v37 denormalizedQuad];
    [v38 topLeft];
    double v40 = v39;
    double v42 = v41;

    double v43 = [(CRTrackedRegionGroup *)v34 children];
    double v44 = [v43 objectAtIndexedSubscript:v14];
    double v45 = [v44 boundingQuad];
    double v46 = [v45 denormalizedQuad];
    [v46 topRight];
    double v216 = v47;
    double v214 = v48;

    v49 = [(CRTrackedRegionGroup *)v34 children];
    char v50 = [v49 objectAtIndexedSubscript:v13];
    char v51 = [v50 boundingQuad];
    uint64_t v52 = [v51 denormalizedQuad];
    [v52 bottomLeft];
    double v54 = v53;
    double v56 = v55;

    uint64_t v57 = [(CRTrackedRegionGroup *)v34 children];
    uint64_t v58 = [v57 objectAtIndexedSubscript:v13];
    uint64_t v59 = [v58 boundingQuad];
    uint64_t v60 = [(id)v59 denormalizedQuad];
    [v60 bottomRight];
    double v62 = v61;
    double v64 = v63;

    double v65 = [(CRTrackedRegionGroup *)v34 children];
    double v66 = [v65 objectAtIndexedSubscript:v14];
    objc_opt_class();
    LOBYTE(v59) = objc_opt_isKindOfClass();

    if (v59)
    {
      double v67 = [(CRTrackedRegionGroup *)v34 children];
      double v68 = [v67 objectAtIndexedSubscript:v14];
      uint64_t v69 = [v68 topBottomEdgesQuad];
      uint64_t v70 = [v69 denormalizedQuad];
      [v70 topLeft];
      double v40 = v71;
      double v42 = v72;

      uint64_t v73 = [(CRTrackedRegionGroup *)v34 children];
      double v74 = [v73 objectAtIndexedSubscript:v14];
      uint64_t v75 = [v74 topBottomEdgesQuad];
      uint64_t v76 = [v75 denormalizedQuad];
      [v76 topRight];
      double v216 = v77;
      double v214 = v78;
    }
    double v79 = [(CRTrackedRegionGroup *)v34 children];
    BOOL v80 = [v79 objectAtIndexedSubscript:v13];
    objc_opt_class();
    char v81 = objc_opt_isKindOfClass();

    double v218 = v42;
    if (v81)
    {
      uint64_t v82 = [(CRTrackedRegionGroup *)v34 children];
      double v83 = [v82 objectAtIndexedSubscript:v13];
      double v84 = [v83 topBottomEdgesQuad];
      __int16 v85 = [v84 denormalizedQuad];
      [v85 bottomLeft];
      double v54 = v86;
      double v56 = v87;

      uint64_t v88 = [(CRTrackedRegionGroup *)v34 children];
      uint64_t v89 = [v88 objectAtIndexedSubscript:v13];
      v90 = [v89 topBottomEdgesQuad];
      v91 = [v90 denormalizedQuad];
      [v91 bottomRight];
      double v93 = v92;
      double v212 = v94;
    }
    else
    {
      double v212 = v64;
      double v93 = v62;
    }
    double v95 = (double *)MEMORY[0x1E4F1DAD8];
    v96 = [(CRTrackedRegionGroup *)v34 children];
    v97 = [v96 objectAtIndexedSubscript:v14];
    [v97 baselineAngle];
    double v99 = v98;

    double v100 = [(CRTrackedRegionGroup *)v34 children];
    double v101 = [v100 objectAtIndexedSubscript:v13];
    [v101 baselineAngle];
    double v103 = v102;

    __double2 v104 = __sincos_stret(v99);
    __double2 v105 = __sincos_stret(v103);
    double v106 = atan2(v104.__sinval + v105.__sinval, v104.__cosval + v105.__cosval);
    double v107 = *v95;
    double v108 = v95[1];
    double v209 = v40;
    double v109 = rotatedPointAroundPoint(v40, v218, *v95, v108, v106);
    double v202 = v110;
    double v203 = v109;
    double v111 = rotatedPointAroundPoint(v216, v214, v107, v108, v106);
    double v113 = v112;
    double v205 = v56;
    double v207 = v54;
    double v114 = rotatedPointAroundPoint(v54, v56, v107, v108, v106);
    double v116 = v115;
    double v204 = v93;
    double obja = v107;
    double v117 = v107;
    double v118 = v108;
    double v119 = rotatedPointAroundPoint(v93, v212, v117, v108, v106);
    if (!isTextLeftJustified || isTextRightJustified)
    {
      if (isTextLeftJustified || !isTextRightJustified)
      {
        double v128 = v207;
        double v125 = v209;
        double v127 = v218;
        double v129 = v205;
        double v122 = obja;
LABEL_46:
        long long v227 = 0u;
        long long v228 = 0u;
        long long v225 = 0u;
        long long v226 = 0u;
        v132 = [(CRTrackedRegionGroup *)v34 children];
        uint64_t v133 = [v132 countByEnumeratingWithState:&v225 objects:v233 count:16];
        if (v133)
        {
          uint64_t v134 = v133;
          double v206 = v129;
          double v208 = v128;
          double v219 = v127;
          double v210 = v125;
          uint64_t v135 = *(void *)v226;
          double v136 = 1.79769313e308;
          double v137 = v122;
          double v138 = 2.22507386e-308;
          float v139 = v106;
          double v140 = v108;
          double v141 = v137;
          double v142 = v137;
          do
          {
            for (uint64_t j = 0; j != v134; ++j)
            {
              if (*(void *)v226 != v135) {
                objc_enumerationMutation(v132);
              }
              v144 = [*(id *)(*((void *)&v225 + 1) + 8 * j) boundingQuad];
              v145 = [v144 denormalizedQuad];
              *(float *)&double v146 = v139;
              v147 = objc_msgSend(v145, "rotatedAroundPoint:angle:", obja, v108, v146);

              [v147 topLeft];
              if (v148 < v136)
              {
                [v147 topLeft];
                double v136 = v149;
                v150 = [v144 denormalizedQuad];
                [v150 topLeft];
                double v142 = v151;
                double v118 = v152;
              }
              [v147 bottomLeft];
              if (v153 < v136)
              {
                [v147 bottomLeft];
                double v136 = v154;
                v155 = [v144 denormalizedQuad];
                [v155 bottomLeft];
                double v142 = v156;
                double v118 = v157;
              }
              [v147 topRight];
              if (v158 > v138)
              {
                [v147 topRight];
                double v138 = v159;
                double v160 = [v144 denormalizedQuad];
                [v160 topRight];
                double v141 = v161;
                double v140 = v162;
              }
              [v147 bottomRight];
              if (v163 > v138)
              {
                [v147 bottomRight];
                double v138 = v164;
                double v165 = [v144 denormalizedQuad];
                [v165 bottomRight];
                double v141 = v166;
                double v140 = v167;
              }
            }
            uint64_t v134 = [v132 countByEnumeratingWithState:&v225 objects:v233 count:16];
          }
          while (v134);
          double v122 = v141;
          double v108 = v140;
          double v128 = v208;
          double v125 = v210;
          double v127 = v219;
          double v129 = v206;
        }
        else
        {
          double v142 = v122;
        }

        v168 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v125, v127, v216, v214, v204, v212, v128, v129);
        double v169 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", 0.0, 0.0, 1.0, 1.0);
        [(CRImageSpaceQuad *)v168 homographyFromSelfToQuad:v169];
        v170.i32[3] = 0;
        v171.i32[3] = 0;
        float32x4_t v213 = v171;
        float32x4_t v215 = v170;
        v172.i32[3] = 0;
        float32x4_t v211 = v172;
        [(CRImageSpaceQuad *)v169 homographyFromSelfToQuad:v168];
        HIDWORD(v173) = 0;
        v174.i32[3] = 0;
        float32x4_t v220 = v174;
        *(_OWORD *)objb = v173;
        v175.i32[3] = 0;
        float32x4_t v217 = v175;
        double v176 = applyHomographyMatrix(v215, v213, v211, v142, v118);
        double v177 = applyHomographyMatrix(v215, v213, v211, v122, v108);
        double v178 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v176, 0.0, v177, 0.0, v177, 1.0, v176, 1.0);
        [(CRImageSpaceQuad *)v178 topLeft];
        double v181 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v179, v180);
        double v183 = v182;
        [(CRImageSpaceQuad *)v178 topRight];
        double v186 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v184, v185);
        double v188 = v187;
        [(CRImageSpaceQuad *)v178 bottomLeft];
        double v191 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v189, v190);
        double v193 = v192;
        [(CRImageSpaceQuad *)v178 bottomRight];
        double v196 = applyHomographyMatrix(*(float32x4_t *)objb, v220, v217, v194, v195);
        v198 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v181, v183, v186, v188, v196, v197, v191, v193);
        v199 = [(CRTrackedRegionGroup *)v34 boundingQuad];
        [v199 normalizationSize];
        id v7 = -[CRImageSpaceQuad normalizedQuadForImageSize:](v198, "normalizedQuadForImageSize:");

        goto LABEL_64;
      }
      double v124 = -v106;
      if (v114 <= v203)
      {
        double v200 = v120 + (v120 - v116) / (v119 - v114) * (v203 - v119);
        double v122 = obja;
        double v128 = rotatedPointAroundPoint(v203, v200, obja, v108, v124);
        double v129 = v201;
        double v125 = v209;
        double v127 = v218;
        goto LABEL_46;
      }
      double v122 = obja;
      double v125 = rotatedPointAroundPoint(v114, v113 + (v113 - v202) / (v111 - v203) * (v114 - v111), obja, v108, v124);
      double v127 = v126;
    }
    else
    {
      double v121 = -v106;
      if (v119 <= v111)
      {
        double v130 = v120 + (v120 - v116) / (v119 - v114) * (v111 - v119);
        double v122 = obja;
        double v204 = rotatedPointAroundPoint(v111, v130, obja, v108, v121);
        double v212 = v131;
      }
      else
      {
        double v122 = obja;
        double v216 = rotatedPointAroundPoint(v119, v113 + (v113 - v202) / (v111 - v203) * (v119 - v111), obja, v108, v121);
        double v214 = v123;
      }
      double v125 = v209;
      double v127 = v218;
    }
    double v129 = v205;
    double v128 = v207;
    goto LABEL_46;
  }
LABEL_8:
  return v7;
}

- (CRNormalizedQuad)originalBoundingQuad
{
  return self->_originalBoundingQuad;
}

- (void)setOriginalBoundingQuad:(id)a3
{
  uint64_t v5 = (CRNormalizedQuad *)a3;
  if (self->_originalBoundingQuad != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_originalBoundingQuad, a3);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = v7;
    self->_lastOriginalBoundingQuadUpdateTime = Current;
  }
}

- (void)updatePreviousAssociationQuad
{
  v3 = [(CRTrackedRegionGroup *)self boundingQuad];
  boundingQuadAtOCRDispatch = self->_boundingQuadAtOCRDispatch;
  self->_boundingQuadAtOCRDispatch = v3;

  uint64_t v5 = MEMORY[0x1E4F14998];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  *(_OWORD *)self->_anon_a0 = *MEMORY[0x1E4F14998];
  *(_OWORD *)&self->_anon_a0[16] = v6;
  *(_OWORD *)&self->_anon_a0[32] = *(_OWORD *)(v5 + 32);
}

- (void)updateBoundingQuadAfterOCR
{
  id v5 = [(CRTrackedRegionGroup *)self boundingQuad];
  v3 = [v5 denormalizedQuad];
  boundingQuadAfterOCR = self->_boundingQuadAfterOCR;
  self->_boundingQuadAfterOCR = v3;
}

- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5
{
  float32x4_t v45 = a3;
  float32x4_t v44 = a2;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v9 = a7;
  uint64_t v10 = [(id)a1 boundingQuad];
  uint64_t v11 = [v10 denormalizedQuad];
  *(float *)&double v12 = a5;
  uint64_t v13 = objc_msgSend(v11, "applyHomographyTransform:downscaleRate:", *(double *)v44.i64, *(double *)v45.i64, *(double *)a4.i64, v12);

  [v10 normalizationSize];
  if (v9[2](v9, v13))
  {
    [v10 normalizationSize];
    uint64_t v14 = objc_msgSend(v13, "normalizedQuadForImageSize:");
    [(id)a1 setBoundingQuad:v14];

    uint64_t v15 = [(id)a1 vcQuad];
    [v15 updateWithQuad:v13];

    double v16 = [(id)a1 originalBoundingQuad];

    if (v16)
    {
      if (a4.f32[2] != 0.0)
      {
        uint64_t v17 = 0;
        long long v18 = *(_OWORD *)(a1 + 176);
        long long v19 = *(_OWORD *)(a1 + 192);
        long long v51 = *(_OWORD *)(a1 + 160);
        long long v52 = v18;
        long long v53 = v19;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        do
        {
          *(long long *)((char *)&v54 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(long long *)((char *)&v51 + v17))), v45, *(float32x2_t *)((char *)&v51 + v17), 1), a4, *(float32x4_t *)((char *)&v51 + v17), 2);
          v17 += 16;
        }
        while (v17 != 48);
        uint64_t v20 = 0;
        uint64_t v21 = v54;
        long long v22 = v55;
        long long v23 = v56;
        *(_DWORD *)(a1 + 168) = DWORD2(v54);
        *(void *)(a1 + 160) = v21;
        *(_DWORD *)(a1 + 184) = DWORD2(v22);
        *(void *)(a1 + 176) = v22;
        *(float *)&uint64_t v21 = 1.0 / *((float *)&v23 + 2);
        float32x4_t v24 = *(float32x4_t *)(a1 + 176);
        float32x4_t v25 = vmulq_n_f32(*(float32x4_t *)(a1 + 160), 1.0 / *((float *)&v23 + 2));
        *(_DWORD *)(a1 + 168) = v25.i32[2];
        *(_DWORD *)(a1 + 200) = DWORD2(v23);
        *(void *)(a1 + 192) = v23;
        *(void *)(a1 + 160) = v25.i64[0];
        float32x4_t v26 = vmulq_n_f32(v24, 1.0 / *((float *)&v23 + 2));
        *(_DWORD *)(a1 + 184) = v26.i32[2];
        *(void *)(a1 + 176) = v26.i64[0];
        long long v27 = *(_OWORD *)(a1 + 208);
        float32x4_t v28 = vmulq_n_f32(*(float32x4_t *)(a1 + 192), *(float *)&v21);
        *(_DWORD *)(a1 + 200) = v28.i32[2];
        *(void *)(a1 + 192) = v28.i64[0];
        long long v29 = *(_OWORD *)(a1 + 224);
        long long v30 = *(_OWORD *)(a1 + 240);
        long long v51 = v27;
        long long v52 = v29;
        long long v53 = v30;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        do
        {
          *(long long *)((char *)&v54 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(long long *)((char *)&v51 + v20))), v45, *(float32x2_t *)((char *)&v51 + v20), 1), a4, *(float32x4_t *)((char *)&v51 + v20), 2);
          v20 += 16;
        }
        while (v20 != 48);
        uint64_t v31 = v54;
        long long v32 = v55;
        long long v33 = v56;
        *(_DWORD *)(a1 + 216) = DWORD2(v54);
        *(_DWORD *)(a1 + 232) = DWORD2(v32);
        *(void *)(a1 + 208) = v31;
        *(void *)(a1 + 224) = v32;
        *(_DWORD *)(a1 + 248) = DWORD2(v33);
        *(void *)(a1 + 240) = v33;
        *(float *)&uint64_t v31 = 1.0 / *((float *)&v33 + 2);
        float32x4_t v34 = *(float32x4_t *)(a1 + 240);
        float32x4_t v35 = vmulq_n_f32(*(float32x4_t *)(a1 + 208), 1.0 / *((float *)&v33 + 2));
        float32x4_t v36 = vmulq_n_f32(*(float32x4_t *)(a1 + 224), 1.0 / *((float *)&v33 + 2));
        *(_DWORD *)(a1 + 216) = v35.i32[2];
        *(_DWORD *)(a1 + 232) = v36.i32[2];
        *(void *)(a1 + 208) = v35.i64[0];
        *(void *)(a1 + 224) = v36.i64[0];
        float32x4_t v37 = vmulq_n_f32(v34, *(float *)&v31);
        *(_DWORD *)(a1 + 248) = v37.i32[2];
        *(void *)(a1 + 240) = v37.i64[0];
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 32), v10);
      *(float32x4_t *)(a1 + 208) = v44;
      *(float32x4_t *)(a1 + 224) = v45;
      *(float32x4_t *)(a1 + 240) = a4;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v38 = *(id *)(a1 + 64);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v39)
    {
      uint64_t v41 = v39;
      uint64_t v42 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v48 != v42) {
            objc_enumerationMutation(v38);
          }
          *(float *)&double v40 = a5;
          objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "applyHomographyTransform:downscaleRate:shouldApply:", &__block_literal_global_19, *(double *)v44.i64, *(double *)v45.i64, *(double *)a4.i64, v40, *(_OWORD *)&v44, *(_OWORD *)&v45);
        }
        uint64_t v41 = [v38 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v41);
    }
  }
}

uint64_t __75__CRTrackedRegionGroup_applyHomographyTransform_downscaleRate_shouldApply___block_invoke()
{
  return 1;
}

+ (id)groupsFromOutputRegions:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v58 = objc_opt_new();
  id v4 = objc_opt_new();
  double v61 = (void *)[v3 mutableCopy];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v89;
    uint64_t v62 = *(void *)v89;
    do
    {
      uint64_t v8 = 0;
      uint64_t v64 = v6;
      do
      {
        if (*(void *)v89 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v88 + 1) + 8 * v8);
        uint64_t v10 = [v9 trackingID];
        uint64_t v11 = [v4 objectForKey:v10];

        if (!v11)
        {
          uint64_t v66 = v8;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v12 = v58;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v84 objects:v96 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v85;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v85 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count") + objc_msgSend(v61, "count"));
                [v18 addObjectsFromArray:v61];
                [v18 addObjectsFromArray:v12];
                [v18 removeObject:v9];
                [v18 removeObject:v17];
                if ([v17 addGroupRegionIfValid:v9 context:v18])
                {
                  long long v22 = [v9 trackingID];
                  [v4 setObject:v17 forKeyedSubscript:v22];

                  [v61 removeObject:v9];
                  goto LABEL_17;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v84 objects:v96 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          long long v19 = [[CRTrackedRegionGroup alloc] initWithRegion:v9];
          [v12 addObject:v19];

          uint64_t v20 = [v12 lastObject];
          uint64_t v21 = [v9 trackingID];
          [v4 setObject:v20 forKeyedSubscript:v21];

          [v61 removeObject:v9];
LABEL_17:
          uint64_t v7 = v62;
          uint64_t v6 = v64;
          uint64_t v8 = v66;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v6);
  }

  double v63 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v23 = v58;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (!v24) {
    goto LABEL_36;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v81;
  do
  {
    for (uint64_t j = 0; j != v25; ++j)
    {
      if (*(void *)v81 != v26) {
        objc_enumerationMutation(v23);
      }
      float32x4_t v28 = *(unsigned char **)(*((void *)&v80 + 1) + 8 * j);
      if ((unint64_t)[v28 numberOfLines] <= 1)
      {
        long long v29 = [v28 children];
        if ((unint64_t)[v29 count] <= 1)
        {

          if (!v28) {
            continue;
          }
LABEL_33:
          v28[8] = 1;
          continue;
        }
        int v30 = [v28 isInlineGroup];

        if (v28) {
          BOOL v31 = v30 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31) {
          goto LABEL_33;
        }
      }
    }
    uint64_t v25 = [v23 countByEnumeratingWithState:&v80 objects:v95 count:16];
  }
  while (v25);
LABEL_36:

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v32 = v23;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v77;
    uint64_t v55 = *(void *)v77;
    id v56 = v32;
    do
    {
      uint64_t v36 = 0;
      uint64_t v57 = v34;
      do
      {
        if (*(void *)v77 != v35) {
          objc_enumerationMutation(v32);
        }
        float32x4_t v37 = *(void **)(*((void *)&v76 + 1) + 8 * v36);
        if ([v37 isInlineGroup])
        {
          id v38 = [v37 children];
          unint64_t v39 = [v38 count];

          if (v39 <= 1)
          {
            uint64_t v59 = v36;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v40 = v32;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v72 objects:v93 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v73;
              uint64_t v65 = *(void *)v73;
              id v67 = v40;
              do
              {
                for (uint64_t k = 0; k != v42; ++k)
                {
                  if (*(void *)v73 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  float32x4_t v45 = *(void **)(*((void *)&v72 + 1) + 8 * k);
                  int v46 = [v45 isInlineGroup];
                  BOOL v47 = v37 == v45 || v46 == 0;
                  if (!v47 && [v45 addInlineGroupIfValid:v37])
                  {
                    [v63 addObject:v37];
                    long long v70 = 0u;
                    long long v71 = 0u;
                    long long v68 = 0u;
                    long long v69 = 0u;
                    long long v48 = [v37 children];
                    uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v92 count:16];
                    if (v49)
                    {
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v69;
                      do
                      {
                        for (uint64_t m = 0; m != v50; ++m)
                        {
                          if (*(void *)v69 != v51) {
                            objc_enumerationMutation(v48);
                          }
                          long long v53 = [*(id *)(*((void *)&v68 + 1) + 8 * m) trackingID];
                          [v4 setObject:v45 forKeyedSubscript:v53];
                        }
                        uint64_t v50 = [v48 countByEnumeratingWithState:&v68 objects:v92 count:16];
                      }
                      while (v50);
                    }

                    uint64_t v43 = v65;
                    id v40 = v67;
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v72 objects:v93 count:16];
              }
              while (v42);
            }

            uint64_t v35 = v55;
            id v32 = v56;
            uint64_t v34 = v57;
            uint64_t v36 = v59;
          }
        }
        ++v36;
      }
      while (v36 != v34);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v34);
  }

  [v32 removeObjectsInArray:v63];
  return v32;
}

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<CRTrackedRegionGroup:\n"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CRTrackedRegionGroup *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) text];
        [v3 appendFormat:@"  %@\n", v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  uint64_t v10 = (void *)[v3 copy];

  return (NSString *)v10;
}

- (CRImageSpaceQuad)boundingQuadAfterOCR
{
  return (CRImageSpaceQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuadAfterOCR:(id)a3
{
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBoundingQuad:(id)a3
{
}

- (CRNormalizedQuad)boundingQuadAtOCRDispatch
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBoundingQuadAtOCRDispatch:(id)a3
{
}

- (double)boundingQuadHomographySinceOCRDispatch
{
  objc_copyStruct(&v2, (const void *)(a1 + 160), 48, 1, 0);
  return *(double *)&v2;
}

- (NSUUID)trackingID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTrackingID:(id)a3
{
}

- (NSArray)regionTrackingIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (CRVCQuad)vcQuad
{
  return (CRVCQuad *)objc_getProperty(self, a2, 80, 1);
}

- (double)lastOriginalBoundingQuadUpdateTime
{
  return self->_lastOriginalBoundingQuadUpdateTime;
}

- (double)boundingQuadHomography
{
  objc_copyStruct(&v2, (const void *)(a1 + 208), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setBoundingQuadHomography:(__n128)a3
{
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 208), v4, 48, 1, 0);
}

- (NSNumber)homographyGroupID
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHomographyGroupID:(id)a3
{
}

- (double)initialOrthogonalityScore
{
  return self->_initialOrthogonalityScore;
}

- (void)setInitialOrthogonalityScore:(double)a3
{
  self->_initialOrthogonalityScore = a3;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSNumber)averageLineHeight
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isInlineGroup
{
  return self->_isInlineGroup;
}

- (BOOL)trackNeedsReplacement
{
  return self->_trackNeedsReplacement;
}

- (void)setTrackNeedsReplacement:(BOOL)a3
{
  self->_trackNeedsReplacement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_averageLineHeight, 0);
  objc_storeStrong((id *)&self->_homographyGroupID, 0);
  objc_storeStrong((id *)&self->_vcQuad, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_regionTrackingIDs, 0);
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_boundingQuadAtOCRDispatch, 0);
  objc_storeStrong((id *)&self->_originalBoundingQuad, 0);
  objc_storeStrong((id *)&self->boundingQuad, 0);
  objc_storeStrong((id *)&self->_boundingQuadAfterOCR, 0);
}

@end