@interface CRBlockOutputRegion
+ (CRBlockOutputRegion)blockWithGroupRegion:(void *)a3 children:(uint64_t)a4 confidenceThresholdProvider:(uint64_t)a5 canWrapToNextBlock:;
+ (id)blockWithBlock:(id)a3 children:(id)a4;
+ (id)blockWithLines:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6;
- (BOOL)canWrapToNextGroup;
- (BOOL)computesNumberOfLinesFromChildren;
- (id)joiningDelimiter;
- (unint64_t)type;
- (void)removeSubregion:(id)a3;
- (void)setCanWrapToNextGroup:(BOOL)a3;
@end

@implementation CRBlockOutputRegion

+ (CRBlockOutputRegion)blockWithGroupRegion:(void *)a3 children:(uint64_t)a4 confidenceThresholdProvider:(uint64_t)a5 canWrapToNextBlock:
{
  id v7 = a3;
  id v8 = a2;
  self;
  v9 = [CRBlockOutputRegion alloc];
  v10 = [v8 boundingQuad];
  [v10 baselineAngle];
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:](v9, "initWithConfidence:baselineAngle:", 2);

  [(CRCompositeOutputRegion *)v11 setShouldComputeBoundsFromChildren:0];
  [(CROutputRegion *)v11 setShouldComputeTranscriptFromChildren:1];
  v12 = [v8 boundingQuad];

  [(CROutputRegion *)v11 setBoundingQuad:v12];
  [(CROutputRegion *)v11 setChildren:v7];
  uint64_t v13 = [v7 count];

  [(CROutputRegion *)v11 setNumberOfLines:v13];
  [(CRBlockOutputRegion *)v11 setCanWrapToNextGroup:a5];
  return v11;
}

+ (id)blockWithBlock:(id)a3 children:(id)a4
{
  id v5 = a4;
  v6 = (void *)[a3 copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:0];
  [v6 setChildren:v5];
  uint64_t v7 = [v5 count];

  [v6 setNumberOfLines:v7];
  return v6;
}

+ (id)blockWithLines:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(CROutputRegion *)[CRBlockOutputRegion alloc] initWithConfidence:v7 baselineAngle:a6];
  [(CROutputRegion *)v11 setShouldComputeTranscriptFromChildren:1];
  if (v9)
  {
    [(CRCompositeOutputRegion *)v11 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v11 setBoundingQuad:v9];
  }
  else
  {
    [(CRCompositeOutputRegion *)v11 setShouldComputeBoundsFromChildren:1];
  }
  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", [v10 count]);
  [(CROutputRegion *)v11 setChildren:v10];

  return v11;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  v3 = [(CROutputRegion *)self children];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(CROutputRegion *)self children];
    v6 = [v5 lastObject];
    uint64_t v7 = [v6 joiningDelimiter];
  }
  else
  {
    uint64_t v7 = @"\n";
  }
  return v7;
}

- (void)removeSubregion:(id)a3
{
  id v4 = a3;
  id v5 = [(CROutputRegion *)self children];
  v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(CROutputRegion *)self children];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [(CROutputRegion *)self children];
        id v11 = [v10 objectAtIndexedSubscript:v9];

        if (v11 == v4) {
          break;
        }
      }
      ++v9;
      v12 = [(CROutputRegion *)self children];
      unint64_t v13 = [v12 count];

      if (v13 <= v9) {
        goto LABEL_8;
      }
    }
    [v6 removeObjectAtIndex:v9];
  }
LABEL_8:
  v14 = [(CROutputRegion *)self children];
  uint64_t v15 = [v14 count];
  uint64_t v16 = [v6 count] + 1;

  if (v15 == v16)
  {
    [(CROutputRegion *)self setChildren:v6];
    [(CROutputRegion *)self setNumberOfLines:[(CROutputRegion *)self numberOfLines] - 1];
    [(CROutputRegion *)self _invalidateTranscript];
  }
  else
  {
    v17 = CROSLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_FAULT, "Could not find line to remove", v18, 2u);
    }
  }
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (void)setCanWrapToNextGroup:(BOOL)a3
{
  self->_canWrapToNextGroup = a3;
}

@end