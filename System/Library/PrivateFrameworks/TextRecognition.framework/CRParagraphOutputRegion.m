@interface CRParagraphOutputRegion
+ (id)paragraphWithLines:(id)a3 confidence:(int)a4 baselineAngle:(double)a5;
+ (id)paragraphsWithLines:(id)a3;
- (BOOL)computesNumberOfLinesFromChildren;
- (BOOL)contributesToDocumentHierarchy;
- (BOOL)useLineSeparatorAsJoiningDelimiter;
- (CRNormalizedQuad)topBottomEdgesQuad;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)joiningDelimiter;
- (id)layoutComponents;
- (unint64_t)textAlignment;
- (unint64_t)type;
- (void)_computeGeometryInfo;
- (void)setTopBottomEdgesQuad:(id)a3;
- (void)setUseLineSeparatorAsJoiningDelimiter:(BOOL)a3;
@end

@implementation CRParagraphOutputRegion

+ (id)paragraphsWithLines:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v26;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "baselineAngle", (void)v25);
        if (v10)
        {
          __double2 v16 = __sincos_stret(v15);
          __double2 v17 = __sincos_stret(v12);
          double v15 = atan2(v17.__sinval * (double)v10 + v16.__sinval, v17.__cosval * (double)v10 + v16.__cosval);
        }
        double v12 = v15;
        [v6 addObject:v14];
        if ([v14 shouldWrapToNextLine])
        {
          ++v10;
        }
        else
        {
          v18 = (void *)[v6 copy];
          v19 = [a1 paragraphWithLines:v18 confidence:1 baselineAngle:v12];
          [v5 addObject:v19];

          uint64_t v20 = objc_opt_new();
          int v10 = 0;
          v6 = (void *)v20;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = 0.0;
  }

  if ([v6 count])
  {
    v21 = (void *)[v6 copy];
    v22 = [a1 paragraphWithLines:v21 confidence:1 baselineAngle:v12];
    [v5 addObject:v22];
  }
  v23 = objc_msgSend(v5, "copy", (void)v25);

  return v23;
}

+ (id)paragraphWithLines:(id)a3 confidence:(int)a4 baselineAngle:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(CROutputRegion *)[CRParagraphOutputRegion alloc] initWithConfidence:v6 baselineAngle:a5];
  [(CRCompositeOutputRegion *)v8 setShouldComputeBoundsFromChildren:1];
  [(CROutputRegion *)v8 setShouldComputeTranscriptFromChildren:1];
  [(CROutputRegion *)v8 setChildren:v7];
  -[CROutputRegion setNumberOfLines:](v8, "setNumberOfLines:", [v7 count]);
  [(CRParagraphOutputRegion *)v8 setUseLineSeparatorAsJoiningDelimiter:0];
  if ([v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    -[CROutputRegion setLayoutDirection:](v8, "setLayoutDirection:", [v9 layoutDirection]);
  }
  id v10 = v7;
  self;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v60;
    double v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v19 = [v18 text];
        unint64_t v20 = [v19 length];

        [v18 activationProbability];
        double v16 = v16 + v21 * (double)v20;
        v14 += v20;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v13);
    double v22 = (double)v14;
  }
  else
  {
    double v22 = 0.0;
    double v16 = 0.0;
  }

  [(CROutputRegion *)v8 setActivationProbability:v16 / v22];
  v23 = [CRNormalizedQuad alloc];
  v58 = [(CROutputRegion *)v8 children];
  v57 = [v58 firstObject];
  v56 = [v57 boundingQuad];
  [v56 topLeft];
  double v25 = v24;
  double v27 = v26;
  v55 = [(CROutputRegion *)v8 children];
  v54 = [v55 firstObject];
  v53 = [v54 boundingQuad];
  [v53 topRight];
  double v29 = v28;
  double v31 = v30;
  v52 = [(CROutputRegion *)v8 children];
  v51 = [v52 lastObject];
  v32 = [v51 boundingQuad];
  [v32 bottomRight];
  double v34 = v33;
  double v36 = v35;
  v37 = [(CROutputRegion *)v8 children];
  v38 = [v37 lastObject];
  v39 = [v38 boundingQuad];
  [v39 bottomLeft];
  double v41 = v40;
  double v43 = v42;
  v44 = [(CROutputRegion *)v8 children];
  v45 = [v44 firstObject];
  v46 = [v45 boundingQuad];
  [v46 normalizationSize];
  v49 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v23, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v25, v27, v29, v31, v34, v36, v41, v43, v47, v48);
  [(CRParagraphOutputRegion *)v8 setTopBottomEdgesQuad:v49];

  return v8;
}

- (unint64_t)type
{
  return 4;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  if ([(CRParagraphOutputRegion *)self useLineSeparatorAsJoiningDelimiter]) {
    return @"\u2028";
  }
  else {
    return @"\n";
  }
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (void)_computeGeometryInfo
{
  id v3 = [[CRRegionGroupGeometryInfo alloc] initFromRegionGroup:self];
  [(CROutputRegion *)self setGeometryInfo:v3];
}

- (unint64_t)textAlignment
{
  if ([(CROutputRegion *)self layoutDirection] != 5)
  {
    id v4 = [(CROutputRegion *)self geometryInfo];
    if ([v4 isCenterJustified])
    {
      unint64_t v3 = 1;
LABEL_18:

      return v3;
    }
    if (![v4 isLeftJustified] || (objc_msgSend(v4, "isRightJustified") & 1) == 0)
    {
      if ([(CROutputRegion *)self layoutDirection] == 1
        && ([v4 isLeftJustified] & 1) != 0
        || [(CROutputRegion *)self layoutDirection] == 2
        && ([v4 isRightJustified] & 1) != 0)
      {
        unint64_t v3 = 2;
        goto LABEL_18;
      }
      if ([(CROutputRegion *)self layoutDirection] == 1
        && ([v4 isRightJustified] & 1) != 0
        || [(CROutputRegion *)self layoutDirection] == 2
        && ([v4 isLeftJustified] & 1) != 0)
      {
        unint64_t v3 = 3;
        goto LABEL_18;
      }
    }
    unint64_t v3 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)layoutComponents
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CRParagraphOutputRegion;
  id v7 = [(CROutputRegion *)&v10 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  objc_msgSend(v7, "setUseLineSeparatorAsJoiningDelimiter:", -[CRParagraphOutputRegion useLineSeparatorAsJoiningDelimiter](self, "useLineSeparatorAsJoiningDelimiter"));
  uint64_t v8 = [(CRParagraphOutputRegion *)self topBottomEdgesQuad];
  [v7 setTopBottomEdgesQuad:v8];

  return v7;
}

- (BOOL)useLineSeparatorAsJoiningDelimiter
{
  return self->_useLineSeparatorAsJoiningDelimiter;
}

- (void)setUseLineSeparatorAsJoiningDelimiter:(BOOL)a3
{
  self->_useLineSeparatorAsJoiningDelimiter = a3;
}

- (CRNormalizedQuad)topBottomEdgesQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTopBottomEdgesQuad:(id)a3
{
}

- (void).cxx_destruct
{
}

@end