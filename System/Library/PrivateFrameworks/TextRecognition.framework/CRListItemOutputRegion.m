@interface CRListItemOutputRegion
+ (BOOL)textStartsWithListItem:(id)a3;
+ (id)listItemForParagraph:(id)a3;
- (BOOL)contributesToDocumentHierarchy;
- (CRListItemOutputRegion)initWithLayoutListItem:(id)a3;
- (_NSRange)markerRange;
- (id)listItemByAppendingParagraph:(id)a3;
- (int64_t)markerType;
- (unint64_t)type;
- (void)initWithParagraphs:(void *)a3 marker:;
@end

@implementation CRListItemOutputRegion

- (CRListItemOutputRegion)initWithLayoutListItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 groups];
  [v5 count];

  v6 = [v4 groups];
  v7 = [v4 marker];

  v8 = (CRListItemOutputRegion *)-[CRListItemOutputRegion initWithParagraphs:marker:](self, v6, v7);
  return v8;
}

- (void)initWithParagraphs:(void *)a3 marker:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if ([v5 count])
      {
        id newValue = v6;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v28;
          double v12 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v7);
              }
              v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              [v14 baselineAngle];
              double v16 = v15;
              [a1 baselineAngle];
              double v18 = v16 - v17;
              if (v16 - v17 <= 3.14159265)
              {
                if (v18 <= -3.14159265) {
                  double v18 = v18 + 6.28318531;
                }
              }
              else
              {
                double v18 = v18 + -6.28318531;
              }
              uint64_t v19 = v10 + i + 1;
              double v20 = v17 + v18 * (float)(1.0 / (float)v19);
              if (v20 <= 3.14159265)
              {
                if (v20 <= -3.14159265) {
                  double v20 = v20 + 6.28318531;
                }
              }
              else
              {
                double v20 = v20 + -6.28318531;
              }
              [a1 setBaselineAngle:v20];
              unsigned int v21 = [v14 confidence];
              if (v19 < (unint64_t)[v7 count])
              {
                [v14 setUseLineSeparatorAsJoiningDelimiter:1];
                v22 = [v14 children];
                v23 = [v22 lastObject];
                [v23 setUseLineSeparatorAsLineBreak:1];
              }
              double v12 = v12 + (double)v21;
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
            v10 += i;
          }
          while (v9);
        }
        else
        {
          double v12 = 0.0;
        }

        objc_msgSend(a1, "setConfidence:", (v12 / (double)(unint64_t)objc_msgSend(v7, "count")));
        [a1 setShouldComputeBoundsFromChildren:1];
        [a1 setShouldComputeTranscriptFromChildren:1];
        [a1 setChildren:v7];
        [a1 setParagraphRegions:v7];
        id v6 = newValue;
        objc_setProperty_atomic(a1, v24, newValue, 336);
      }
    }
  }

  return a1;
}

- (id)listItemByAppendingParagraph:(id)a3
{
  id v4 = a3;
  id v5 = [(CROutputRegion *)self paragraphRegions];
  id v6 = [v5 lastObject];

  [v6 setUseLineSeparatorAsJoiningDelimiter:1];
  id v7 = [v6 children];
  uint64_t v8 = [v7 lastObject];
  [v8 setUseLineSeparatorAsLineBreak:1];

  uint64_t v9 = [(CROutputRegion *)self paragraphRegions];
  uint64_t v10 = [v9 arrayByAddingObject:v4];

  double v12 = [CRListItemOutputRegion alloc];
  if (self) {
    id Property = objc_getProperty(self, v11, 336, 1);
  }
  else {
    id Property = 0;
  }
  v14 = -[CRListItemOutputRegion initWithParagraphs:marker:](v12, v10, Property);

  return v14;
}

- (unint64_t)type
{
  return 512;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (_NSRange)markerRange
{
  if (self)
  {
    self = (CRListItemOutputRegion *)objc_getProperty(self, a2, 336, 1);
    uint64_t v2 = vars8;
  }
  NSUInteger v3 = [(CRListItemOutputRegion *)self range];
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)markerType
{
  if (self)
  {
    self = (CRListItemOutputRegion *)objc_getProperty(self, a2, 336, 1);
    uint64_t v2 = vars8;
  }
  return [(CRListItemOutputRegion *)self type];
}

+ (BOOL)textStartsWithListItem:(id)a3
{
  NSUInteger v3 = +[CRListItemMarker listItemMarkerForText:a3 requiresAdjacentText:1];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)listItemForParagraph:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 text];
  id v5 = +[CRListItemMarker listItemMarkerForText:v4 requiresAdjacentText:1];

  if (v5)
  {
    id v6 = [CRListItemOutputRegion alloc];
    v10[0] = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v8 = -[CRListItemOutputRegion initWithParagraphs:marker:](v6, v7, v5);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end