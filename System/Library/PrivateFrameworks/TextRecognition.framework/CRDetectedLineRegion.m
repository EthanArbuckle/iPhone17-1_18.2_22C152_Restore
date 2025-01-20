@interface CRDetectedLineRegion
- (BOOL)isCurved;
- (BOOL)shouldRotate180DetectorOrientationFallback;
- (BOOL)shouldRunSequenceOrientation;
- (BOOL)shouldRunSequenceScript;
- (CGSize)rectifiedSize;
- (CRDetectedLineRegion)init;
- (CRNormalizedPolyline)polygon;
- (CRNormalizedQuad)boundingQuad;
- (CRScriptCategory)topScriptCategory;
- (NSArray)scriptCategoryResults;
- (NSDictionary)scriptCategoryCounts;
- (NSString)sequenceScriptOutputResult;
- (NSUUID)uuid;
- (double)aspectRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)rotated180;
- (unint64_t)layoutDirection;
- (unint64_t)nmsOutputScale;
- (unint64_t)textType;
- (void)_copyContentsToObject:(id)a3;
- (void)_rotate180;
- (void)setBoundingQuad:(id)a3;
- (void)setIsCurved:(BOOL)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setNmsOutputScale:(unint64_t)a3;
- (void)setPolygon:(id)a3;
- (void)setScriptCategoryCounts:(id)a3;
- (void)setScriptCategoryResults:(id)a3;
- (void)setSequenceScriptOutputResult:(id)a3;
- (void)setShouldRotate180DetectorOrientationFallback:(BOOL)a3;
- (void)setShouldRunSequenceOrientation:(BOOL)a3;
- (void)setShouldRunSequenceScript:(BOOL)a3;
- (void)setTextType:(unint64_t)a3;
- (void)setTopScriptCategory:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CRDetectedLineRegion

- (CRDetectedLineRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRDetectedLineRegion;
  v2 = [(CRDetectedLineRegion *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4) {
    [(CRDetectedLineRegion *)self _copyContentsToObject:v4];
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CRMutableDetectedLineRegion);
  if (v4) {
    [(CRDetectedLineRegion *)self _copyContentsToObject:v4];
  }
  return v4;
}

- (id)rotated180
{
  v2 = (void *)[(CRDetectedLineRegion *)self copy];
  [v2 _rotate180];
  return v2;
}

- (CGSize)rectifiedSize
{
  uint64_t v3 = [(CRDetectedLineRegion *)self polygon];

  if (v3)
  {
    id v4 = [(CRDetectedLineRegion *)self polygon];
    v5 = [v4 denormalizedPolyline];
    [v5 estimatedLineSizeForPairedPointPolygon];
  }
  else
  {
    id v4 = [(CRDetectedLineRegion *)self boundingQuad];
    v5 = [v4 denormalizedQuad];
    [v5 size];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)aspectRatio
{
  [(CRDetectedLineRegion *)self rectifiedSize];
  double v4 = v3 / v2;
  BOOL v5 = v2 == 0.0;
  double result = 0.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)_rotate180
{
  double v3 = [(CRDetectedLineRegion *)self boundingQuad];
  double v4 = [v3 rotated180];
  [(CRDetectedLineRegion *)self setBoundingQuad:v4];

  id v6 = [(CRDetectedLineRegion *)self polygon];
  BOOL v5 = [v6 rotated180];
  [(CRDetectedLineRegion *)self setPolygon:v5];
}

- (void)_copyContentsToObject:(id)a3
{
  id v10 = a3;
  double v4 = [(CRDetectedLineRegion *)self boundingQuad];
  [v10 setBoundingQuad:v4];

  objc_msgSend(v10, "setLayoutDirection:", -[CRDetectedLineRegion layoutDirection](self, "layoutDirection"));
  objc_msgSend(v10, "setIsCurved:", -[CRDetectedLineRegion isCurved](self, "isCurved"));
  BOOL v5 = [(CRDetectedLineRegion *)self polygon];
  [v10 setPolygon:v5];

  id v6 = [(CRDetectedLineRegion *)self scriptCategoryResults];
  [v10 setScriptCategoryResults:v6];

  double v7 = [(CRDetectedLineRegion *)self topScriptCategory];
  [v10 setTopScriptCategory:v7];

  double v8 = [(CRDetectedLineRegion *)self scriptCategoryCounts];
  [v10 setScriptCategoryCounts:v8];

  double v9 = [(CRDetectedLineRegion *)self sequenceScriptOutputResult];
  [v10 setSequenceScriptOutputResult:v9];

  objc_msgSend(v10, "setNmsOutputScale:", -[CRDetectedLineRegion nmsOutputScale](self, "nmsOutputScale"));
  objc_msgSend(v10, "setShouldRunSequenceScript:", -[CRDetectedLineRegion shouldRunSequenceScript](self, "shouldRunSequenceScript"));
  objc_msgSend(v10, "setShouldRunSequenceOrientation:", -[CRDetectedLineRegion shouldRunSequenceOrientation](self, "shouldRunSequenceOrientation"));
  objc_msgSend(v10, "setShouldRotate180DetectorOrientationFallback:", -[CRDetectedLineRegion shouldRotate180DetectorOrientationFallback](self, "shouldRotate180DetectorOrientationFallback"));
  objc_msgSend(v10, "setTextType:", -[CRDetectedLineRegion textType](self, "textType"));
}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPolygon:(id)a3
{
}

- (BOOL)shouldRunSequenceScript
{
  return self->_shouldRunSequenceScript;
}

- (void)setShouldRunSequenceScript:(BOOL)a3
{
  self->_shouldRunSequenceScript = a3;
}

- (BOOL)shouldRunSequenceOrientation
{
  return self->_shouldRunSequenceOrientation;
}

- (void)setShouldRunSequenceOrientation:(BOOL)a3
{
  self->_shouldRunSequenceOrientation = a3;
}

- (BOOL)shouldRotate180DetectorOrientationFallback
{
  return self->_shouldRotate180DetectorOrientationFallback;
}

- (void)setShouldRotate180DetectorOrientationFallback:(BOOL)a3
{
  self->_shouldRotate180DetectorOrientationFallback = a3;
}

- (CRScriptCategory)topScriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTopScriptCategory:(id)a3
{
}

- (NSArray)scriptCategoryResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScriptCategoryResults:(id)a3
{
}

- (NSDictionary)scriptCategoryCounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScriptCategoryCounts:(id)a3
{
}

- (NSString)sequenceScriptOutputResult
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSequenceScriptOutputResult:(id)a3
{
}

- (unint64_t)nmsOutputScale
{
  return self->_nmsOutputScale;
}

- (void)setNmsOutputScale:(unint64_t)a3
{
  self->_nmsOutputScale = a3;
}

- (unint64_t)textType
{
  return self->_textType;
}

- (void)setTextType:(unint64_t)a3
{
  self->_textType = a3;
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

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_sequenceScriptOutputResult, 0);
  objc_storeStrong((id *)&self->_scriptCategoryCounts, 0);
  objc_storeStrong((id *)&self->_scriptCategoryResults, 0);
  objc_storeStrong((id *)&self->_topScriptCategory, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
}

@end