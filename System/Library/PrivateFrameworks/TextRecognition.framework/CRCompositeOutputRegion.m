@interface CRCompositeOutputRegion
- (CRCompositeOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (CRCompositeOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3;
- (CRCompositeOutputRegion)outputRegionWithContentsOfQuad:(id)a3;
- (unint64_t)textRegionType;
- (void)setShouldComputeBoundsFromChildren:(BOOL)a3;
@end

@implementation CRCompositeOutputRegion

- (CRCompositeOutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRCompositeOutputRegion;
  v3 = [(CROutputRegion *)&v5 outputRegionWithContentsOfQuad:a3];
  [v3 setShouldComputeBoundsFromChildren:1];
  return (CRCompositeOutputRegion *)v3;
}

- (CRCompositeOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRCompositeOutputRegion;
  v4 = -[CROutputRegion outputRegionWithContentsBetweenStartPoint:endPoint:](&v6, sel_outputRegionWithContentsBetweenStartPoint_endPoint_, a3.x, a3.y, a4.x, a4.y);
  [v4 setShouldComputeBoundsFromChildren:1];
  return (CRCompositeOutputRegion *)v4;
}

- (CRCompositeOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRCompositeOutputRegion;
  v3 = -[CROutputRegion outputRegionWithContentsOfCharacterRange:](&v9, sel_outputRegionWithContentsOfCharacterRange_, a3.location, a3.length);
  uint64_t v4 = [v3 boundingQuad];
  if (!v4
    || (objc_super v5 = (void *)v4,
        [v3 children],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    [v3 setShouldComputeBoundsFromChildren:1];
  }
  return (CRCompositeOutputRegion *)v3;
}

- (void)setShouldComputeBoundsFromChildren:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRCompositeOutputRegion;
  -[CROutputRegion setShouldComputeBoundsFromChildren:](&v5, sel_setShouldComputeBoundsFromChildren_);
  if (v3) {
    [(CROutputRegion *)self setBoundingQuad:0];
  }
}

- (unint64_t)textRegionType
{
  return 3;
}

@end