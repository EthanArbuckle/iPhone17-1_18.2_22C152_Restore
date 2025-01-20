@interface CRMutableRecognizedTextRegion
- (id)_removeUnknownScriptMarkersFromString:(void *)a3 replacementString:;
- (void)adjustBoundsBasedOnSubregions;
- (void)removeUnknownScriptMarkersFromTranscripts:(id)a3;
@end

@implementation CRMutableRecognizedTextRegion

- (void)adjustBoundsBasedOnSubregions
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = [(CRRecognizedTextRegion *)self boundingQuad];
  v4 = [v3 denormalizedQuad];
  [v4 midPoint];
  double v39 = v6;
  double v40 = v5;

  v7 = [(CRRecognizedTextRegion *)self boundingQuad];
  [v7 baselineAngle];
  double v9 = v8;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v10 = [(CRRecognizedTextRegion *)self subregions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    float v14 = v9;
    double v15 = 1.79769313e308;
    double v16 = -1.79769313e308;
    double v17 = -1.79769313e308;
    double v41 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        v19 = [*(id *)(*((void *)&v42 + 1) + 8 * i) boundingQuad];
        v20 = [v19 denormalizedQuad];
        *(float *)&double v21 = v14;
        v22 = objc_msgSend(v20, "rotatedAroundPoint:angle:", v40, v39, v21);

        [v22 boundingBox];
        CGFloat x = v48.origin.x;
        CGFloat y = v48.origin.y;
        CGFloat width = v48.size.width;
        float v26 = v14;
        CGFloat height = v48.size.height;
        double MinX = CGRectGetMinX(v48);
        if (v15 >= MinX) {
          double v15 = MinX;
        }
        v49.origin.CGFloat x = x;
        v49.origin.CGFloat y = y;
        v49.size.CGFloat width = width;
        v49.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v49);
        if (v17 < MaxX) {
          double v17 = MaxX;
        }
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.CGFloat width = width;
        v50.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v50);
        double v31 = v41;
        if (v41 >= MinY) {
          double v31 = MinY;
        }
        double v41 = v31;
        v51.origin.CGFloat x = x;
        v51.origin.CGFloat y = y;
        v51.size.CGFloat width = width;
        v51.size.CGFloat height = height;
        float v14 = v26;
        double MaxY = CGRectGetMaxY(v51);
        if (v16 < MaxY) {
          double v16 = MaxY;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v12);
    double v33 = v41;
  }
  else
  {
    float v14 = v9;
    double v33 = 1.79769313e308;
    double v16 = -1.79769313e308;
    double v17 = -1.79769313e308;
    double v15 = 1.79769313e308;
  }

  v34 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", v15, v33, v17 - v15, v16 - v33);
  *(float *)&double v35 = -v14;
  v36 = -[CRImageSpaceQuad rotatedAroundPoint:angle:](v34, "rotatedAroundPoint:angle:", v40, v39, v35);
  v37 = [(CRRecognizedTextRegion *)self boundingQuad];
  [v37 normalizationSize];
  v38 = objc_msgSend(v36, "normalizedQuadForImageSize:");

  [(CRRecognizedTextRegion *)self setBoundingQuad:v38];
}

- (void)removeUnknownScriptMarkersFromTranscripts:(id)a3
{
  id v19 = a3;
  v4 = [(CRRecognizedTextRegion *)self text];
  double v5 = -[CRMutableRecognizedTextRegion _removeUnknownScriptMarkersFromString:replacementString:]((uint64_t)self, v4, v19);
  [(CRRecognizedTextRegion *)self setText:v5];

  double v6 = (void *)MEMORY[0x1E4F1CA48];
  v7 = [(CRRecognizedTextRegion *)self subregions];
  double v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  double v9 = [(CRRecognizedTextRegion *)self subregions];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [(CRRecognizedTextRegion *)self subregions];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v11];
      float v14 = (void *)[v13 mutableCopy];

      double v15 = [v14 text];
      double v16 = -[CRMutableRecognizedTextRegion _removeUnknownScriptMarkersFromString:replacementString:]((uint64_t)self, v15, v19);
      [v14 setText:v16];

      [v8 addObject:v14];
      ++v11;
      double v17 = [(CRRecognizedTextRegion *)self subregions];
      unint64_t v18 = [v17 count];
    }
    while (v11 < v18);
  }
  [(CRRecognizedTextRegion *)self setSubregions:v8];
}

- (id)_removeUnknownScriptMarkersFromString:(void *)a3 replacementString:
{
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E4F28B88];
    id v5 = a3;
    id v6 = a2;
    v7 = [v4 whitespaceCharacterSet];
    double v8 = [MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet];
    double v9 = [v6 componentsSeparatedByCharactersInSet:v8];

    uint64_t v10 = [v9 componentsJoinedByString:v5];

    unint64_t v11 = [v10 stringByTrimmingCharactersInSet:v7];
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v11;
}

@end