@interface CRTextFeature
+ (id)lineFeatures:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5;
+ (id)overlayFeatures:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5;
+ (id)overlayFeaturesPolygonVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5;
+ (id)overlayFeaturesQuadVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5;
+ (id)sortedTextFeaturesByAspectRatio:(id)a3 imageSize:(CGSize)a4;
- (BOOL)appliedOrientationCorrection;
- (BOOL)isCurved;
- (BOOL)isDown;
- (BOOL)isUp;
- (BOOL)isVerticalLayout;
- (BOOL)shouldExpandToFullWidth;
- (BOOL)shouldRotate180;
- (BOOL)shouldRotate180DetectorOrientationFallBack;
- (BOOL)useSequenceOrientation;
- (BOOL)useSequenceScriptLocale;
- (BOOL)whitespaceInjected;
- (CGPoint)baselineOrigin;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGPoint)toplineOrigin;
- (CGRect)bounds;
- (CGSize)originalImageSize;
- (CGSize)sizeForImageSize:(CGSize)a3;
- (CRImage)imageCut;
- (CRNormalizedPolyline)polygon;
- (CRNormalizedQuad)boundingQuad;
- (CRScriptCategory)selectedScriptCategory;
- (CRTextFeature)init;
- (CRTextFeature)initWithCCFeatureRect:(id)a3 subFeatureRects:(id)a4 rotatePortrait:(BOOL)a5;
- (CRTextFeature)initWithCoder:(id)a3;
- (CRTextFeature)initWithFeatureRect:(CGRect)a3 inImage:(id)a4;
- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4;
- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4 inImage:(id)a5;
- (CRTextFeature)initWithSubfeatures:(id)a3;
- (CRTextFeature)initWithSubfeatures:(id)a3 stringValue:(id)a4;
- (CRTextFeature)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6;
- (NSArray)candidateActivationProbs;
- (NSArray)candidateProbs;
- (NSArray)scriptCategoryResults;
- (NSArray)stringValueCandidates;
- (NSArray)subFeatureCandidates;
- (NSArray)subFeatures;
- (NSDictionary)scriptCounts;
- (NSLocale)locale;
- (NSNumber)confidence;
- (NSString)description;
- (NSString)gtStringValue;
- (NSString)selectedLocale;
- (NSString)sequenceScriptOutputResult;
- (NSString)stringValue;
- (NSUUID)uuid;
- (double)confidenceScore;
- (float)aspectRatioWithImageSize:(CGSize)a3;
- (float)baselineAngle;
- (float)calculateTextBoxHeightForImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4;
- (float)caseInsensitiveProbabilityCandidateIndex:(int)a3;
- (float)textlineHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3;
- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 falsePositiveFiltering:(BOOL)a6;
- (id)createSubFeaturesFromStringsForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7;
- (id)textFeatureScaledToImage:(id)a3;
- (id)textFeatureScaledToImageWidth:(float)a3 height:(float)a4;
- (id)textFeatureSplitForStringValue:(id)a3;
- (id)textFeaturebyPaddingToWidth:(float)a3 height:(float)a4;
- (id)wordFeatures;
- (int)featureID;
- (int)featureMapID;
- (int64_t)bestCandidateIndex;
- (unint64_t)layoutDirection;
- (unint64_t)lineWrappingType;
- (unint64_t)nmsOutputScale;
- (unint64_t)subFeatureType;
- (unint64_t)textRegionType;
- (unint64_t)textType;
- (unint64_t)type;
- (unsigned)sizeHint;
- (void)addKohlsDigitProjection;
- (void)adjustBoundsBasedOnSubfeaturesForImageSize:(CGSize)a3;
- (void)appendTextFeature:(id)a3 imageSize:(CGSize)a4;
- (void)encodeWithCoder:(id)a3;
- (void)flipHorizontally;
- (void)mergeWithLine:(id)a3;
- (void)scale:(CGPoint)a3 offset:(CGPoint)a4;
- (void)setAppliedOrientationCorrection:(BOOL)a3;
- (void)setBaselineAngle:(float)a3;
- (void)setBaselineOrigin:(CGPoint)a3 toplineOrigin:(CGPoint)a4 slope:(float)a5;
- (void)setBestCandidateIndex:(int64_t)a3;
- (void)setBottomLeft:(CGPoint)a3;
- (void)setBottomRight:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCandidateActivationProbs:(id)a3;
- (void)setCandidateProbs:(id)a3;
- (void)setConfidence:(id)a3;
- (void)setFeatureID:(int)a3;
- (void)setFeatureMapID:(int)a3;
- (void)setGtStringValue:(id)a3;
- (void)setImageCut:(id)a3;
- (void)setIsCurved:(BOOL)a3;
- (void)setIsVerticalLayout:(BOOL)a3;
- (void)setLineWrappingType:(unint64_t)a3;
- (void)setNmsOutputScale:(unint64_t)a3;
- (void)setOriginalImageSize:(CGSize)a3;
- (void)setPolygon:(id)a3;
- (void)setScriptCategoryResults:(id)a3;
- (void)setScriptCounts:(id)a3;
- (void)setSelectedLocale:(id)a3;
- (void)setSelectedLocale:(id)a3 includeSubfeatures:(BOOL)a4;
- (void)setSelectedScriptCategory:(id)a3;
- (void)setSelectedScriptCategory:(id)a3 includeSubfeatures:(BOOL)a4;
- (void)setSequenceScriptOutputResult:(id)a3;
- (void)setShouldExpandToFullWidth:(BOOL)a3;
- (void)setShouldRotate180:(BOOL)a3;
- (void)setShouldRotate180DetectorOrientationFallBack:(BOOL)a3;
- (void)setSizeHint:(unsigned __int8)a3;
- (void)setStringValue:(id)a3;
- (void)setStringValueByReplacingCharactersInSet:(id)a3 withString:(id)a4;
- (void)setStringValueCandidates:(id)a3;
- (void)setSubFeatureCandidates:(id)a3;
- (void)setSubFeatures:(id)a3;
- (void)setTextType:(unint64_t)a3;
- (void)setTextlineHeight:(float)a3;
- (void)setTopLeft:(CGPoint)a3;
- (void)setTopRight:(CGPoint)a3;
- (void)setType:(unint64_t)a3;
- (void)setUseSequenceOrientation:(BOOL)a3;
- (void)setUseSequenceScriptLocale:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setWhitespaceInjected:(BOOL)a3;
- (void)updateSizeHints;
@end

@implementation CRTextFeature

- (CRTextFeature)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRTextFeature;
  return [(CRTextFeature *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  [v14 encodeObject:self->_subFeatures forKey:@"subFeatures"];
  objc_msgSend(v14, "encodePoint:forKey:", @"topLeft", self->_topLeft.x, self->_topLeft.y);
  objc_msgSend(v14, "encodePoint:forKey:", @"topRight", self->_topRight.x, self->_topRight.y);
  objc_msgSend(v14, "encodePoint:forKey:", @"bottomLeft", self->_bottomLeft.x, self->_bottomLeft.y);
  objc_msgSend(v14, "encodePoint:forKey:", @"bottomRight", self->_bottomRight.x, self->_bottomRight.y);
  objc_msgSend(v14, "encodeRect:forKey:", @"bounds", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  objc_msgSend(v14, "encodePoint:forKey:", @"toplineOrigin", self->_toplineOrigin.x, self->_toplineOrigin.y);
  objc_msgSend(v14, "encodePoint:forKey:", @"baselineOrigin", self->_baselineOrigin.x, self->_baselineOrigin.y);
  [v14 encodeObject:self->_stringValue forKey:@"stringValue"];
  *(float *)&double v4 = self->_baselineAngle;
  v5 = [NSNumber numberWithFloat:v4];
  [v14 encodeObject:v5 forKey:@"baselineAngle"];

  *(float *)&double v6 = self->_textlineHeight;
  v7 = [NSNumber numberWithFloat:v6];
  [v14 encodeObject:v7 forKey:@"textlineHeight"];

  v8 = [NSNumber numberWithInteger:self->_bestCandidateIndex];
  [v14 encodeObject:v8 forKey:@"bestCandidateIndex"];

  v9 = [NSNumber numberWithInteger:self->_type];
  [v14 encodeObject:v9 forKey:@"type"];

  [v14 encodeObject:self->_polygon forKey:@"polygon"];
  v10 = [NSNumber numberWithBool:self->_lineWrappingType != 0];
  [v14 encodeObject:v10 forKey:@"lineWrappingType"];

  v11 = [NSNumber numberWithBool:self->_nmsOutputScale != 0];
  [v14 encodeObject:v11 forKey:@"nmsOutputScale"];

  v12 = [NSNumber numberWithBool:self->_textType != 0];
  [v14 encodeObject:v12 forKey:@"textType"];

  v13 = [NSNumber numberWithBool:self->_whitespaceInjected];
  [v14 encodeObject:v13 forKey:@"whitespaceInjected"];
}

- (CRTextFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRTextFeature;
  v5 = [(CRTextFeature *)&v24 init];
  double v6 = [v4 decodeObjectForKey:@"subFeatures"];
  [(CRTextFeature *)v5 setSubFeatures:v6];

  [v4 decodePointForKey:@"topRight"];
  -[CRTextFeature setTopRight:](v5, "setTopRight:");
  [v4 decodePointForKey:@"topLeft"];
  -[CRTextFeature setTopLeft:](v5, "setTopLeft:");
  [v4 decodePointForKey:@"bottomLeft"];
  -[CRTextFeature setBottomLeft:](v5, "setBottomLeft:");
  [v4 decodePointForKey:@"bottomRight"];
  -[CRTextFeature setBottomRight:](v5, "setBottomRight:");
  [v4 decodeRectForKey:@"bounds"];
  -[CRTextFeature setBounds:](v5, "setBounds:");
  v7 = [v4 decodeObjectForKey:@"stringValue"];
  [(CRTextFeature *)v5 setStringValue:v7];

  v8 = [v4 decodeObjectForKey:@"baselineAngle"];
  [v8 floatValue];
  v5->_baselineAngle = v9;

  [v4 decodePointForKey:@"toplineOrigin"];
  v5->_toplineOrigin.x = v10;
  v5->_toplineOrigin.y = v11;
  [v4 decodePointForKey:@"baselineOrigin"];
  v5->_baselineOrigin.x = v12;
  v5->_baselineOrigin.y = v13;
  id v14 = [v4 decodeObjectForKey:@"textlineHeight"];
  [v14 floatValue];
  -[CRTextFeature setTextlineHeight:](v5, "setTextlineHeight:");

  v15 = [v4 decodeObjectForKey:@"bestCandidateIndex"];
  -[CRTextFeature setBestCandidateIndex:](v5, "setBestCandidateIndex:", [v15 integerValue]);

  v16 = [v4 decodeObjectForKey:@"type"];
  -[CRTextFeature setType:](v5, "setType:", [v16 unsignedIntegerValue]);

  v17 = [MEMORY[0x1E4F29128] UUID];
  [(CRTextFeature *)v5 setUuid:v17];

  v18 = [v4 decodeObjectForKey:@"polygon"];
  [(CRTextFeature *)v5 setPolygon:v18];

  v19 = [v4 decodeObjectForKey:@"lineWrappingType"];
  -[CRTextFeature setLineWrappingType:](v5, "setLineWrappingType:", [v19 unsignedIntegerValue]);

  v20 = [v4 decodeObjectForKey:@"nmsOutputScale"];
  -[CRTextFeature setNmsOutputScale:](v5, "setNmsOutputScale:", [v20 unsignedIntegerValue]);

  v21 = [v4 decodeObjectForKey:@"textType"];
  -[CRTextFeature setTextType:](v5, "setTextType:", [v21 unsignedIntegerValue]);

  v22 = [v4 decodeObjectForKey:@"whitespaceInjected"];
  -[CRTextFeature setWhitespaceInjected:](v5, "setWhitespaceInjected:", [v22 BOOLValue]);

  return v5;
}

- (CRTextFeature)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)CRTextFeature;
  id v14 = [(CRTextFeature *)&v19 init];
  if (v14)
  {
    points.double x = v13;
    points.double y = v12;
    double v21 = v11;
    double v22 = v10;
    double v23 = x;
    double v24 = y;
    double v25 = v9;
    double v26 = v8;
    Mutable = CGPathCreateMutable();
    CGPathAddLines(Mutable, 0, &points, 4uLL);
    PathBoundingBodouble x = CGPathGetPathBoundingBox(Mutable);
    -[CRTextFeature setBounds:](v14, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
    -[CRTextFeature setTopLeft:](v14, "setTopLeft:", v13, v12);
    -[CRTextFeature setTopRight:](v14, "setTopRight:", v11, v10);
    -[CRTextFeature setBottomLeft:](v14, "setBottomLeft:", v9, v8);
    -[CRTextFeature setBottomRight:](v14, "setBottomRight:", x, y);
    [(CRTextFeature *)v14 setShouldExpandToFullWidth:0];
    v16 = [MEMORY[0x1E4F28C28] zero];
    [(CRTextFeature *)v14 setConfidence:v16];

    [(CRTextFeature *)v14 setSubFeatures:0];
    [(CRTextFeature *)v14 setType:0];
    CGPathRelease(Mutable);
    v17 = [MEMORY[0x1E4F29128] UUID];
    [(CRTextFeature *)v14 setUuid:v17];

    [(CRTextFeature *)v14 setPolygon:0];
    [(CRTextFeature *)v14 setLineWrappingType:0];
    [(CRTextFeature *)v14 setNmsOutputScale:0];
    [(CRTextFeature *)v14 setTextType:0];
  }
  return v14;
}

- (unint64_t)subFeatureType
{
  objc_super v3 = [(CRTextFeature *)self subFeatures];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(CRTextFeature *)self subFeatures];
  double v6 = [v5 firstObject];
  unint64_t v7 = [v6 type];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v5 = [+[CRTextFeature allocWithZone:](CRTextFeature, "allocWithZone:") init];
  [(CRTextFeature *)self bounds];
  -[CRTextFeature setBounds:](v5, "setBounds:");
  [(CRTextFeature *)self bottomLeft];
  -[CRTextFeature setBottomLeft:](v5, "setBottomLeft:");
  [(CRTextFeature *)self bottomRight];
  -[CRTextFeature setBottomRight:](v5, "setBottomRight:");
  [(CRTextFeature *)self topLeft];
  -[CRTextFeature setTopLeft:](v5, "setTopLeft:");
  [(CRTextFeature *)self topRight];
  -[CRTextFeature setTopRight:](v5, "setTopRight:");
  double v6 = [MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v7 = [(CRTextFeature *)self subFeatures];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v47;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * v10) copy];
        [v6 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v8);
  }

  [(CRTextFeature *)v5 setSubFeatures:v6];
  [(CRTextFeature *)v5 setShouldExpandToFullWidth:[(CRTextFeature *)self shouldExpandToFullWidth]];
  double v12 = [(CRTextFeature *)self stringValue];
  [(CRTextFeature *)v5 setStringValue:v12];

  double v13 = [(CRTextFeature *)self imageCut];
  [(CRTextFeature *)v5 setImageCut:v13];

  id v14 = [(CRTextFeature *)self stringValueCandidates];
  v15 = (void *)[v14 copyWithZone:a3];
  [(CRTextFeature *)v5 setStringValueCandidates:v15];

  v16 = [(CRTextFeature *)self subFeatureCandidates];
  v17 = (void *)[v16 copyWithZone:a3];
  [(CRTextFeature *)v5 setSubFeatureCandidates:v17];

  v18 = [(CRTextFeature *)self candidateProbs];
  objc_super v19 = (void *)[v18 copyWithZone:a3];
  [(CRTextFeature *)v5 setCandidateProbs:v19];

  v20 = [(CRTextFeature *)self gtStringValue];
  [(CRTextFeature *)v5 setGtStringValue:v20];

  double v21 = [(CRTextFeature *)self confidence];
  [(CRTextFeature *)v5 setConfidence:v21];

  [(CRTextFeature *)v5 setFeatureMapID:[(CRTextFeature *)self featureMapID]];
  [(CRTextFeature *)v5 setBestCandidateIndex:[(CRTextFeature *)self bestCandidateIndex]];
  [(CRTextFeature *)self textlineHeight];
  -[CRTextFeature setTextlineHeight:](v5, "setTextlineHeight:");
  [(CRTextFeature *)self baselineOrigin];
  double v23 = v22;
  double v25 = v24;
  [(CRTextFeature *)self toplineOrigin];
  double v27 = v26;
  double v29 = v28;
  [(CRTextFeature *)self baselineAngle];
  LODWORD(v31) = v30;
  -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v5, "setBaselineOrigin:toplineOrigin:slope:", v23, v25, v27, v29, v31);
  [(CRTextFeature *)v5 setSizeHint:[(CRTextFeature *)self sizeHint]];
  id v32 = objc_alloc(MEMORY[0x1E4F1C978]);
  v33 = [(CRTextFeature *)self scriptCategoryResults];
  v34 = (void *)[v32 initWithArray:v33 copyItems:1];
  [(CRTextFeature *)v5 setScriptCategoryResults:v34];

  v35 = (void *)MEMORY[0x1E4F1C9E8];
  v36 = [(CRTextFeature *)self scriptCounts];
  v37 = [v35 dictionaryWithDictionary:v36];
  [(CRTextFeature *)v5 setScriptCounts:v37];

  v38 = [(CRTextFeature *)self selectedLocale];
  v39 = (void *)[v38 copyWithZone:a3];
  [(CRTextFeature *)v5 setSelectedLocale:v39];

  v40 = [(CRTextFeature *)self sequenceScriptOutputResult];
  v41 = (void *)[v40 copyWithZone:a3];
  [(CRTextFeature *)v5 setSequenceScriptOutputResult:v41];

  [(CRTextFeature *)v5 setIsCurved:[(CRTextFeature *)self isCurved]];
  [(CRTextFeature *)v5 setIsVerticalLayout:[(CRTextFeature *)self isVerticalLayout]];
  [(CRTextFeature *)v5 setShouldRotate180:[(CRTextFeature *)self shouldRotate180]];
  [(CRTextFeature *)v5 setShouldRotate180DetectorOrientationFallBack:[(CRTextFeature *)self shouldRotate180DetectorOrientationFallBack]];
  [(CRTextFeature *)v5 setUseSequenceOrientation:[(CRTextFeature *)self useSequenceOrientation]];
  [(CRTextFeature *)v5 setUseSequenceScriptLocale:[(CRTextFeature *)self useSequenceScriptLocale]];
  [(CRTextFeature *)v5 setAppliedOrientationCorrection:[(CRTextFeature *)self appliedOrientationCorrection]];
  [(CRTextFeature *)v5 setWhitespaceInjected:[(CRTextFeature *)self whitespaceInjected]];
  [(CRTextFeature *)v5 setType:[(CRTextFeature *)self type]];
  v42 = [(CRTextFeature *)self uuid];
  [(CRTextFeature *)v5 setUuid:v42];

  [(CRTextFeature *)v5 setFeatureID:[(CRTextFeature *)self featureID]];
  v43 = [(CRTextFeature *)self polygon];
  v44 = (void *)[v43 copyWithZone:a3];
  [(CRTextFeature *)v5 setPolygon:v44];

  [(CRTextFeature *)v5 setLineWrappingType:[(CRTextFeature *)self lineWrappingType]];
  [(CRTextFeature *)v5 setNmsOutputScale:[(CRTextFeature *)self nmsOutputScale]];
  [(CRTextFeature *)v5 setTextType:[(CRTextFeature *)self textType]];

  return v5;
}

- (NSString)description
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  uint64_t v4 = [(CRTextFeature *)self uuid];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@"CRTextFeature (%@)\n", v5];

  double v6 = [(CRTextFeature *)self stringValue];
  [v3 appendFormat:@"stringValue: '%@'\n", v6];

  objc_msgSend(v3, "appendFormat:", @"type: %ld\n", -[CRTextFeature type](self, "type"));
  objc_msgSend(v3, "appendFormat:", @"subFeatureType: %ld\n", -[CRTextFeature subFeatureType](self, "subFeatureType"));
  unint64_t v7 = [(CRTextFeature *)self selectedLocale];
  [v3 appendFormat:@"selectedLocale: %@\n", v7];

  uint64_t v8 = [(CRTextFeature *)self confidence];
  [v8 floatValue];
  objc_msgSend(v3, "appendFormat:", @"confidence: %lf\n", v9);

  [(CRTextFeature *)self topLeft];
  uint64_t v11 = v10;
  [(CRTextFeature *)self topLeft];
  [v3 appendFormat:@"topLeft: (%lf, %lf)\n", v11, v12];
  double v13 = [(CRTextFeature *)self subFeatures];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v3 appendString:@"subFeatures:\n"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = [(CRTextFeature *)self subFeatures];
    uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          objc_super v19 = [v18 description];
          v20 = [v19 componentsSeparatedByString:@"\n"];

          uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v27 != v22) {
                  objc_enumerationMutation(v20);
                }
                [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v26 + 1) + 8 * j)];
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v21);
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v15);
    }
  }
  return (NSString *)v3;
}

- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v6 = (NSString *)a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CRTextFeature;
  uint64_t v8 = [(CRTextFeature *)&v30 init];
  if (v8)
  {
    NSRect v33 = NSRectFromString(v6);
    double x = v33.origin.x;
    double y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    -[CRTextFeature setBounds:](v8, "setBounds:");
    -[CRTextFeature setTopLeft:](v8, "setTopLeft:", x, y);
    double v13 = x + width;
    -[CRTextFeature setTopRight:](v8, "setTopRight:", v13, y);
    double v14 = y + height;
    -[CRTextFeature setBottomLeft:](v8, "setBottomLeft:", x, v14);
    -[CRTextFeature setBottomRight:](v8, "setBottomRight:", v13, v14);
    uint64_t v15 = [MEMORY[0x1E4F28C28] zero];
    [(CRTextFeature *)v8 setConfidence:v15];

    if (v7)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      uint64_t v16 = 0;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
          uint64_t v22 = [CRTextFeature alloc];
          double v23 = -[CRTextFeature initWithFeatureRect:subFeatureRects:](v22, "initWithFeatureRect:subFeatureRects:", v21, 0, (void)v26);
          [v16 addObject:v23];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v18);
    }

    [(CRTextFeature *)v8 setSubFeatures:v16];
    [(CRTextFeature *)v8 setType:0];
    double v24 = [MEMORY[0x1E4F29128] UUID];
    [(CRTextFeature *)v8 setUuid:v24];

    [(CRTextFeature *)v8 setPolygon:0];
    [(CRTextFeature *)v8 setLineWrappingType:0];
    [(CRTextFeature *)v8 setNmsOutputScale:0];
    [(CRTextFeature *)v8 setTextType:0];
  }
  return v8;
}

- (CRTextFeature)initWithFeatureRect:(id)a3 subFeatureRects:(id)a4 inImage:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = v8;
  NSRect v26 = NSRectFromString(v8);
  uint64_t v11 = -[CRTextFeature initWithFeatureRect:inImage:](self, "initWithFeatureRect:inImage:", v10, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  if (v11)
  {
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      uint64_t v12 = 0;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = [[CRTextFeature alloc] initWithFeatureRect:*(void *)(*((void *)&v20 + 1) + 8 * v16) subFeatureRects:0 inImage:v10];
          [v12 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [(CRTextFeature *)v11 setSubFeatures:v12];
  }

  return v11;
}

- (CRTextFeature)initWithCCFeatureRect:(id)a3 subFeatureRects:(id)a4 rotatePortrait:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  aString = (NSString *)a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CRTextFeature;
  id v9 = [(CRTextFeature *)&v32 init];
  if (v9)
  {
    NSRectFromString(aString);
    NSRect v35 = NSRectFromString(aString);
    double v10 = 54.05;
    if (v5) {
      double v11 = 85.685;
    }
    else {
      double v11 = 54.05;
    }
    if (!v5) {
      double v10 = 85.685;
    }
    CGFloat v12 = v35.size.height / v11;
    double v13 = 1.0 - v35.origin.y / v11 - v35.size.height / v11;
    CGFloat v14 = v35.origin.x / v10;
    CGFloat v15 = v35.size.width / v10;
    -[CRTextFeature setBounds:](v9, "setBounds:", v35.origin.x / v10, v13, v35.size.width / v10, v35.size.height / v11);
    -[CRTextFeature setTopLeft:](v9, "setTopLeft:", v14, v13);
    CGFloat v16 = v14 + v15;
    -[CRTextFeature setTopRight:](v9, "setTopRight:", v16, v13);
    CGFloat v17 = v12 + v13;
    -[CRTextFeature setBottomLeft:](v9, "setBottomLeft:", v14, v17);
    -[CRTextFeature setBottomRight:](v9, "setBottomRight:", v16, v17);
    uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
    [(CRTextFeature *)v9 setConfidence:v18];

    if (v8)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      uint64_t v19 = 0;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v20);
          }
          double v24 = [[CRTextFeature alloc] initWithCCFeatureRect:*(void *)(*((void *)&v28 + 1) + 8 * i) subFeatureRects:0 rotatePortrait:v5];
          [v19 addObject:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);
    }

    [(CRTextFeature *)v9 setSubFeatures:v19];
    [(CRTextFeature *)v9 setType:0];
    uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
    [(CRTextFeature *)v9 setUuid:v25];

    [(CRTextFeature *)v9 setPolygon:0];
    [(CRTextFeature *)v9 setLineWrappingType:0];
    [(CRTextFeature *)v9 setNmsOutputScale:0];
    [(CRTextFeature *)v9 setTextType:0];
  }
  return v9;
}

- (CRTextFeature)initWithSubfeatures:(id)a3
{
  return [(CRTextFeature *)self initWithSubfeatures:a3 stringValue:0];
}

- (CRTextFeature)initWithSubfeatures:(id)a3 stringValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CRTextFeature;
  id v8 = [(CRTextFeature *)&v26 init];
  if (v8)
  {
    id v9 = [v6 objectAtIndex:0];
    [v9 bounds];
    double x = v10;
    double y = v12;
    CGFloat width = v14;
    CGFloat height = v16;

    for (unint64_t i = 1; [v6 count] > i; ++i)
    {
      uint64_t v19 = [v6 objectAtIndex:i];
      [v19 bounds];
      v35.origin.double x = v20;
      v35.origin.double y = v21;
      v35.size.CGFloat width = v22;
      v35.size.CGFloat height = v23;
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRect v28 = CGRectUnion(v27, v35);
      double x = v28.origin.x;
      double y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
    }
    -[CRTextFeature setTopLeft:](v8, "setTopLeft:", x, y);
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectOffset(v29, 0.0, width);
    -[CRTextFeature setTopRight:](v8, "setTopRight:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRect v32 = CGRectOffset(v31, height, width);
    -[CRTextFeature setBottomRight:](v8, "setBottomRight:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRect v34 = CGRectOffset(v33, height, 0.0);
    -[CRTextFeature setBottomLeft:](v8, "setBottomLeft:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
    -[CRTextFeature setBounds:](v8, "setBounds:", x, y, width, height);
    [(CRTextFeature *)v8 setSubFeatures:v6];
    [(CRTextFeature *)v8 setStringValue:v7];
    [(CRTextFeature *)v8 setType:0];
    double v24 = [MEMORY[0x1E4F29128] UUID];
    [(CRTextFeature *)v8 setUuid:v24];

    [(CRTextFeature *)v8 setPolygon:0];
    [(CRTextFeature *)v8 setLineWrappingType:0];
    [(CRTextFeature *)v8 setNmsOutputScale:0];
    [(CRTextFeature *)v8 setTextType:0];
  }

  return v8;
}

- (CRTextFeature)initWithFeatureRect:(CGRect)a3 inImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CRTextFeature;
  double v10 = [(CRTextFeature *)&v50 init];
  if (v10)
  {
    [v9 extent];
    double v12 = v11;
    [v9 extent];
    float v13 = v12;
    float v15 = v14;
    -[CRTextFeature setBounds:](v10, "setBounds:", x / v13, y / v15, width / v13, height / v15);
    [(CRTextFeature *)v10 bounds];
    -[CRTextFeature setTopLeft:](v10, "setTopLeft:");
    [(CRTextFeature *)v10 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [(CRTextFeature *)v10 bounds];
    CGFloat v25 = v24;
    v51.origin.double x = v17;
    v51.origin.double y = v19;
    v51.size.double width = v21;
    v51.size.double height = v23;
    CGRect v52 = CGRectOffset(v51, 0.0, v25);
    -[CRTextFeature setTopRight:](v10, "setTopRight:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    [(CRTextFeature *)v10 bounds];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    [(CRTextFeature *)v10 bounds];
    CGFloat v35 = v34;
    [(CRTextFeature *)v10 bounds];
    CGFloat v37 = v36;
    v53.origin.double x = v27;
    v53.origin.double y = v29;
    v53.size.double width = v31;
    v53.size.double height = v33;
    CGRect v54 = CGRectOffset(v53, v35, v37);
    -[CRTextFeature setBottomRight:](v10, "setBottomRight:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
    [(CRTextFeature *)v10 bounds];
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    [(CRTextFeature *)v10 bounds];
    CGFloat v47 = v46;
    v55.origin.double x = v39;
    v55.origin.double y = v41;
    v55.size.double width = v43;
    v55.size.double height = v45;
    CGRect v56 = CGRectOffset(v55, v47, 0.0);
    -[CRTextFeature setBottomLeft:](v10, "setBottomLeft:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    [(CRTextFeature *)v10 setType:0];
    long long v48 = [MEMORY[0x1E4F29128] UUID];
    [(CRTextFeature *)v10 setUuid:v48];

    [(CRTextFeature *)v10 setPolygon:0];
    [(CRTextFeature *)v10 setLineWrappingType:0];
    [(CRTextFeature *)v10 setNmsOutputScale:0];
    [(CRTextFeature *)v10 setTextType:0];
  }

  return v10;
}

- (id)textFeatureSplitForStringValue:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  if (!v26) {
    goto LABEL_15;
  }
  if (![v26 containsString:@" "]) {
    goto LABEL_15;
  }
  uint64_t v4 = [v26 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];
  uint64_t v5 = [v4 length];
  id v6 = [(CRTextFeature *)self subFeatures];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    id v27 = [MEMORY[0x1E4F1CA48] array];
    [v26 componentsSeparatedByString:@" "];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      int v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          double v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v12 isEqualToString:&stru_1F38EED68] & 1) == 0)
          {
            uint64_t v13 = [v12 length];
            double v14 = [(CRTextFeature *)self subFeatures];
            BOOL v15 = v13 + v9 > (unint64_t)[v14 count];

            if (v15) {
              goto LABEL_14;
            }
            id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
            CGFloat v17 = [(CRTextFeature *)self subFeatures];
            uint64_t v18 = objc_msgSend(v17, "subarrayWithRange:", v9, v13);
            CGFloat v19 = (void *)[v16 initWithArray:v18 copyItems:1];

            double v20 = [[CRTextFeature alloc] initWithSubfeatures:v19 stringValue:v12];
            [v27 addObject:v20];
            LODWORD(v18) = [v12 length];

            v9 += v18;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
LABEL_14:

    CGFloat v21 = obj;
  }
  else
  {
LABEL_15:
    double v22 = [(CRTextFeature *)self stringValue];
    int v23 = [v26 isEqualToString:v22];

    if (v23)
    {
      v34[0] = self;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      goto LABEL_19;
    }
    CGFloat v21 = (void *)[(CRTextFeature *)self copy];
    [v21 setStringValue:v26];
    CGFloat v33 = v21;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  }

LABEL_19:
  return v27;
}

- (id)wordFeatures
{
  v49[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CRTextFeature *)self stringValue];
  uint64_t v4 = [v3 rangeOfString:@" "];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v49[0] = self;
    id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    goto LABEL_27;
  }
  for (unint64_t i = 0; ; ++i)
  {
    id v6 = [(CRTextFeature *)self stringValue];
    if (i >= [v6 length]) {
      break;
    }
    uint64_t v7 = [(CRTextFeature *)self stringValue];
    int v8 = [v7 characterAtIndex:i];

    if (v8 != 32) {
      goto LABEL_8;
    }
  }

LABEL_8:
  id v40 = [MEMORY[0x1E4F1CA48] array];
  int v9 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = [(CRTextFeature *)self subFeatures];
  uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v42 = *(void *)v45;
  unint64_t v11 = i;
  do
  {
    uint64_t v43 = v10;
    for (uint64_t j = 0; j != v43; ++j)
    {
      if (*(void *)v45 != v42) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * j);
      [v9 addObject:v13];
      double v14 = [v13 stringValue];
      BOOL v15 = [v14 length] == 0;

      if (!v15)
      {
        id v16 = [v13 stringValue];
        uint64_t v17 = [v16 length];

        uint64_t v18 = [(CRTextFeature *)self stringValue];
        if (v17 + v11 >= [v18 length])
        {
        }
        else
        {
          CGFloat v19 = [(CRTextFeature *)self stringValue];
          BOOL v20 = [v19 characterAtIndex:v17 + v11] == 32;

          if (!v20)
          {
            v11 += v17;
            continue;
          }
        }
        CGFloat v21 = [(CRTextFeature *)self stringValue];
        double v22 = objc_msgSend(v21, "substringWithRange:", i, v17 + v11 - i);

        int v23 = [[CRTextFeature alloc] initWithSubfeatures:v9 stringValue:v22];
        [(CRTextFeature *)self baselineOrigin];
        double v25 = v24;
        double v27 = v26;
        [(CRTextFeature *)self toplineOrigin];
        double v29 = v28;
        double v31 = v30;
        [(CRTextFeature *)self baselineAngle];
        LODWORD(v33) = v32;
        -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v23, "setBaselineOrigin:toplineOrigin:slope:", v25, v27, v29, v31, v33);
        [(CRTextFeature *)v23 updateSizeHints];
        [v40 addObject:v23];
        uint64_t v34 = v11 + v17 + 1;
        while (1)
        {
          unint64_t i = v34;
          CGFloat v35 = [(CRTextFeature *)self stringValue];
          if (i >= [v35 length]) {
            break;
          }
          double v36 = [(CRTextFeature *)self stringValue];
          BOOL v37 = [v36 characterAtIndex:i] == 32;

          uint64_t v34 = i + 1;
          if (!v37) {
            goto LABEL_23;
          }
        }

LABEL_23:
        uint64_t v38 = [MEMORY[0x1E4F1CA48] array];

        int v9 = (void *)v38;
        unint64_t v11 = i;
      }
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  }
  while (v10);
LABEL_26:

LABEL_27:
  return v40;
}

- (id)textFeatureScaledToImage:(id)a3
{
  id v4 = a3;
  [v4 extent];
  double v6 = v5;
  [v4 extent];
  *(float *)&double v7 = v6;
  *(float *)&double v9 = v8;
  uint64_t v10 = [(CRTextFeature *)self textFeatureScaledToImageWidth:v7 height:v9];

  return v10;
}

- (id)textFeatureScaledToImageWidth:(float)a3 height:(float)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  double v7 = objc_alloc_init(CRTextFeature);
  [(CRTextFeature *)self bounds];
  double v9 = v8;
  [(CRTextFeature *)self bounds];
  double v11 = v10;
  [(CRTextFeature *)self bounds];
  double v13 = v12;
  [(CRTextFeature *)self bounds];
  double v15 = v14;
  [(CRTextFeature *)self bounds];
  double v16 = a3;
  double v17 = a4;
  -[CRTextFeature setBounds:](v7, "setBounds:", v9 * a3, v17 - (v11 + v13) * v17, v15 * a3, v18 * a4);
  [(CRTextFeature *)self topLeft];
  double v20 = v19;
  [(CRTextFeature *)self topLeft];
  -[CRTextFeature setTopLeft:](v7, "setTopLeft:", v20 * a3, v17 - v21 * v17);
  [(CRTextFeature *)self topRight];
  double v23 = v22;
  [(CRTextFeature *)self topRight];
  -[CRTextFeature setTopRight:](v7, "setTopRight:", v23 * a3, v17 - v24 * v17);
  [(CRTextFeature *)self bottomLeft];
  double v26 = v25;
  [(CRTextFeature *)self bottomLeft];
  -[CRTextFeature setBottomLeft:](v7, "setBottomLeft:", v26 * a3, v17 - v27 * v17);
  [(CRTextFeature *)self bottomRight];
  double v29 = v28;
  [(CRTextFeature *)self bottomRight];
  -[CRTextFeature setBottomRight:](v7, "setBottomRight:", v29 * a3, v17 - v30 * v17);
  double v31 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  int v32 = [(CRTextFeature *)self subFeatures];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v33)
  {
    uint64_t v36 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v32);
        }
        *(float *)&double v34 = a3;
        *(float *)&double v35 = a4;
        uint64_t v38 = [*(id *)(*((void *)&v52 + 1) + 8 * i) textFeatureScaledToImageWidth:v34 height:v35];
        [v31 addObject:v38];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v33);
  }

  [(CRTextFeature *)v7 setSubFeatures:v31];
  CGFloat v39 = [(CRTextFeature *)self stringValue];
  [(CRTextFeature *)v7 setStringValue:v39];

  [(CRTextFeature *)self baselineOrigin];
  double v41 = v40;
  [(CRTextFeature *)self baselineOrigin];
  double v43 = v42;
  [(CRTextFeature *)self toplineOrigin];
  double v45 = v44;
  [(CRTextFeature *)self toplineOrigin];
  double v47 = v46;
  [(CRTextFeature *)self baselineAngle];
  LODWORD(v49) = v48;
  -[CRTextFeature setBaselineOrigin:toplineOrigin:slope:](v7, "setBaselineOrigin:toplineOrigin:slope:", v41 * v16, v17 - v43 * v17, v45 * v16, v17 - v47 * v17, v49);
  [(CRTextFeature *)v7 setSizeHint:[(CRTextFeature *)self sizeHint]];
  [(CRTextFeature *)v7 setType:[(CRTextFeature *)self type]];
  objc_super v50 = [(CRTextFeature *)self uuid];
  [(CRTextFeature *)v7 setUuid:v50];

  return v7;
}

- (id)textFeaturebyPaddingToWidth:(float)a3 height:(float)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v7 = [(CRTextFeature *)self subFeatures];
  if (v7
    && ([(CRTextFeature *)self subFeatures],
        double v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    double v10 = objc_alloc_init(CRTextFeature);
    double v11 = (void *)MEMORY[0x1E4F1CA48];
    double v12 = [(CRTextFeature *)self subFeatures];
    double v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    double v14 = [(CRTextFeature *)self subFeatures];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v15)
    {
      uint64_t v18 = *(void *)v65;
      float v19 = 3.4028e38;
      float v20 = 1.1755e-38;
      float v21 = 1.1755e-38;
      float v22 = 3.4028e38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v65 != v18) {
            objc_enumerationMutation(v14);
          }
          *(float *)&double v16 = a3;
          *(float *)&double v17 = a4;
          double v24 = [*(id *)(*((void *)&v64 + 1) + 8 * i) textFeaturebyPaddingToWidth:v16 height:v17];
          [v13 addObject:v24];
          [v24 bounds];
          if (v25 < v22)
          {
            [v24 bounds];
            float v22 = v26;
          }
          [v24 bounds];
          if (v27 < v19)
          {
            [v24 bounds];
            float v19 = v28;
          }
          [v24 bounds];
          double v30 = v29;
          [v24 bounds];
          if (v30 + v31 >= v21)
          {
            objc_msgSend(v24, "bounds", v21, v30 + v31);
            double v33 = v32;
            [v24 bounds];
            float v21 = v33 + v34;
          }
          [v24 bounds];
          double v36 = v35;
          [v24 bounds];
          if (v36 + v37 >= v20)
          {
            objc_msgSend(v24, "bounds", v20, v36 + v37);
            double v39 = v38;
            [v24 bounds];
            float v20 = v39 + v40;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v15);
    }
    else
    {
      float v19 = 3.4028e38;
      float v20 = 1.1755e-38;
      float v21 = 1.1755e-38;
      float v22 = 3.4028e38;
    }

    [(CRTextFeature *)v10 setSubFeatures:v13];
    -[CRTextFeature setBounds:](v10, "setBounds:", v22, v19, (float)(v21 - v22), (float)(v20 - v19));
    [(CRTextFeature *)v10 setType:[(CRTextFeature *)self type]];
    v62 = [(CRTextFeature *)self uuid];
    [(CRTextFeature *)v10 setUuid:v62];
  }
  else
  {
    [(CRTextFeature *)self bounds];
    double v43 = v42;
    double v44 = v41;
    float v45 = v41 * a3 / a4;
    float v46 = v42;
    if (v43 <= v45) {
      float v47 = v41 * a3 / a4;
    }
    else {
      float v47 = v46;
    }
    if (v41 <= (float)((float)(v46 * a4) / a3)) {
      float v48 = (float)(v46 * a4) / a3;
    }
    else {
      float v48 = v41;
    }
    double v10 = (CRTextFeature *)[(CRTextFeature *)self copy];
    [(CRTextFeature *)self bounds];
    float v49 = (v47 - v43) * 0.5;
    double v50 = v49;
    double v52 = 0.0;
    if (v51 - v49 >= 0.0)
    {
      [(CRTextFeature *)self bounds];
      double v52 = v53 - v50;
    }
    [(CRTextFeature *)self bounds];
    float v54 = (v48 - v44) * 0.5;
    double v55 = v54;
    double v57 = v56 - v54;
    double v58 = 0.0;
    if (v57 >= 0.0)
    {
      [(CRTextFeature *)self bounds];
      double v58 = v59 - v55;
    }
    double v60 = 1.0 - v52;
    if (v52 + v47 <= 1.0) {
      double v60 = v47;
    }
    if (v58 + v48 <= 1.0) {
      double v61 = v48;
    }
    else {
      double v61 = 1.0 - v58;
    }
    -[CRTextFeature setBounds:](v10, "setBounds:", v52, v58, v60, v61);
  }
  return v10;
}

- (void)setStringValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_stringValue, a3);
  if (v5)
  {
    double v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];
    uint64_t v7 = [v6 length];
    if (v7 == [(NSArray *)self->_subFeatures count])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      double v8 = [(CRTextFeature *)self subFeatures];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            double v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
            double v14 = objc_msgSend(v6, "substringWithRange:", v10 + v12, 1);
            [v13 setStringValue:v14];

            ++v12;
          }
          while (v9 != v12);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          v10 += v12;
        }
        while (v9);
      }
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v6 = [(CRTextFeature *)self subFeatures];
    uint64_t v15 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v17++) setStringValue:0];
        }
        while (v15 != v17);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

uint64_t __35__CRTextFeature_slopeOfSubFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 bounds];
  double v6 = v5;
  [v4 bounds];
  if (v6 <= v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

BOOL __35__CRTextFeature_slopeOfSubFeatures__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 bounds];
  float v4 = v3;
  return (float)(vabds_f32(v4, *(float *)(a1 + 32)) / *(float *)(a1 + 32)) < 0.1;
}

- (float)caseInsensitiveProbabilityCandidateIndex:(int)a3
{
  double v5 = [(CRTextFeature *)self stringValueCandidates];
  uint64_t v6 = a3;
  double v7 = [v5 objectAtIndexedSubscript:a3];

  uint64_t v8 = [(CRTextFeature *)self stringValueCandidates];
  uint64_t v9 = [v7 uppercaseString];
  uint64_t v10 = [v8 indexOfObject:v9];

  uint64_t v11 = [(CRTextFeature *)self stringValueCandidates];
  uint64_t v12 = [v7 lowercaseString];
  uint64_t v13 = [v11 indexOfObject:v12];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL || v10 == v13)
  {
    double v14 = [(CRTextFeature *)self candidateProbs];
    uint64_t v15 = [v14 objectAtIndexedSubscript:v6];
    [v15 doubleValue];
    double v21 = v22;
  }
  else
  {
    double v14 = [(CRTextFeature *)self candidateProbs];
    uint64_t v15 = [v14 objectAtIndexedSubscript:v10];
    [v15 doubleValue];
    double v17 = v16;
    long long v18 = [(CRTextFeature *)self candidateProbs];
    long long v19 = [v18 objectAtIndexedSubscript:v13];
    [v19 doubleValue];
    double v21 = v17 + v20;
  }
  return v21;
}

- (void)addKohlsDigitProjection
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    double v3 = [(CRTextFeature *)self subFeatures];
    float v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_36];

    double v5 = objc_msgSend(v4, "objectAtIndex:", (unint64_t)objc_msgSend(v4, "count") >> 1);
    [v5 bounds];
    double v7 = v6;

    uint64_t v8 = [(CRTextFeature *)self subFeatures];
    float v9 = v7;
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __35__CRTextFeature_slopeOfSubFeatures__block_invoke_2;
    v88[3] = &__block_descriptor_36_e40_B24__0__CRTextFeature_8__NSDictionary_16l;
    float v89 = v9;
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v88];
    uint64_t v11 = [v8 filteredArrayUsingPredicate:v10];

    uint64_t v12 = [v11 firstObject];
    [v12 bounds];
    double v14 = v13;

    uint64_t v15 = [v11 firstObject];
    [v15 bounds];
    double v17 = v16;

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v84 objects:v90 count:16];
    if (v19)
    {
      float v20 = v14;
      float v21 = v17;
      uint64_t v22 = *(void *)v85;
      float v23 = 0.0;
      float v24 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v85 != v22) {
            objc_enumerationMutation(v18);
          }
          double v26 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          [v26 bounds];
          double v28 = v27;
          [v26 bounds];
          float v29 = v28;
          *(float *)&double v30 = v30;
          float v31 = v29 - v20;
          float v24 = v24 + (float)(v31 * (float)(*(float *)&v30 - v21));
          float v23 = v23 + (float)(v31 * v31);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v84 objects:v90 count:16];
      }
      while (v19);
    }
    else
    {
      float v23 = 0.0;
      float v24 = 0.0;
    }

    double v32 = (float)(v24 / v23);
  }
  else
  {
    double v32 = 0.0;
  }
  double v33 = [(CRTextFeature *)self subFeatures];
  double v34 = [v33 lastObject];
  [v34 bounds];
  CGFloat recta = v35;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  double v42 = [(CRTextFeature *)self subFeatures];
  double v43 = [(CRTextFeature *)self subFeatures];
  double v44 = objc_msgSend(v42, "objectAtIndex:", objc_msgSend(v43, "count") - 2);
  CGFloat v81 = v41;
  [v44 bounds];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  CGFloat v52 = v51;

  float v53 = v37 - (v46 + v50);
  CGFloat v54 = v39;
  float v55 = v39 - v48;
  CGFloat v56 = (float)(sqrtf((float)(v55 * v55) + (float)(v53 * v53)) * 6.5);
  CGFloat v57 = v32 * v56;
  v93.origin.double x = v46;
  v93.origin.double y = v48;
  v93.size.double width = v50;
  v93.size.double height = v52;
  CGRect v94 = CGRectOffset(v93, v56, v57);
  CGRect v95 = CGRectInset(v94, v94.size.width * -0.200000003, 0.0);
  double x = v95.origin.x;
  double y = v95.origin.y;
  double width = v95.size.width;
  double height = v95.size.height;
  v62 = objc_alloc_init(CRTextFeature);
  -[CRTextFeature setBounds:](v62, "setBounds:", x, y, width, height);
  v63 = [(CRTextFeature *)self subFeatures];
  long long v64 = (void *)[v63 mutableCopy];

  [v64 addObject:v62];
  v96.origin.double x = v37;
  v96.size.double width = v81;
  v96.origin.double y = v54;
  v96.size.double height = recta;
  CGRect v97 = CGRectOffset(v96, v56, v57);
  CGRect v98 = CGRectInset(v97, v97.size.width * -0.200000003, 0.0);
  double v65 = v98.origin.x;
  double v66 = v98.origin.y;
  double v67 = v98.size.width;
  double v68 = v98.size.height;
  rect = objc_alloc_init(CRTextFeature);

  -[CRTextFeature setBounds:](rect, "setBounds:", v65, v66, v67, v68);
  objc_msgSend(v64, "addObject:");
  [(CRTextFeature *)self setSubFeatures:v64];
  [(CRTextFeature *)self bounds];
  CGFloat v70 = v69;
  CGFloat v72 = v71;
  CGFloat v74 = v73;
  CGFloat v76 = v75;
  [(CRTextFeature *)rect bounds];
  v101.origin.double x = v77;
  v101.origin.double y = v78;
  v101.size.double width = v79;
  v101.size.double height = v80;
  v99.origin.double x = v70;
  v99.origin.double y = v72;
  v99.size.double width = v74;
  v99.size.double height = v76;
  CGRect v100 = CGRectUnion(v99, v101);
  -[CRTextFeature setBounds:](self, "setBounds:", v100.origin.x, v100.origin.y, v100.size.width, v100.size.height);
}

+ (id)lineFeatures:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v115 = a3;
  v124 = [MEMORY[0x1E4F1CA48] array];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  obunint64_t j = v115;
  uint64_t v7 = [obj countByEnumeratingWithState:&v129 objects:v133 count:16];
  if (v7)
  {
    uint64_t v126 = v7;
    unint64_t v127 = 0;
    uint64_t v8 = 0;
    float v9 = 0;
    uint64_t v125 = *(void *)v130;
    double v120 = (double)a4;
    double v116 = (double)a5;
    do
    {
      uint64_t v128 = 0;
      do
      {
        if (*(void *)v130 != v125) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v129 + 1) + 8 * v128);
        if (!v9) {
          goto LABEL_16;
        }
        [*(id *)(*((void *)&v129 + 1) + 8 * v128) bounds];
        double v12 = v11;
        [v9 bounds];
        if (v12 <= v13) {
          goto LABEL_16;
        }
        [v9 bounds];
        double v15 = v14;
        [v9 bounds];
        double v17 = v16;
        [v9 bounds];
        double v123 = v18;
        [v9 bounds];
        double v119 = v19;
        [v9 bounds];
        double v122 = v20;
        [v10 bounds];
        double v121 = v21;
        [v10 bounds];
        double v23 = v22;
        [v10 bounds];
        double v25 = v24;
        [v10 bounds];
        double v27 = v26;
        [v10 bounds];
        double v29 = v28;
        [v10 baselineAngle];
        float v31 = v30;
        [v10 baselineAngle];
        float v33 = v32;
        double v118 = v27;
        double v34 = v17;
        float v35 = cosf(v31);
        LODWORD(v17) = sinf(v33);
        [v9 baselineAngle];
        float v37 = v36;
        [v9 baselineAngle];
        double v39 = v15 * v120;
        double v40 = v116;
        double v41 = v40 - (v23 + v25) * v40 + v29 * v116;
        double v42 = v39 - (v121 * v120 + v35);
        double v43 = v40 - (v34 + v123) * v40 + v122 * v116 - (v41 - *(float *)&v17);
        double v44 = sqrt(v43 * v43 + v42 * v42);
        if (v44 >= 0.01)
        {
          double v45 = (float)-sinf(v38);
          if (fabs(fabs((v43 * v45 + cosf(v37) * v42) / v44) + -1.0) >= 0.01) {
            goto LABEL_16;
          }
        }
        if (v121 * v120 - (v39 + v119 * v120) < v118 * v120 * 0.5)
        {
          double v46 = [v9 stringValue];
          double v47 = NSString;
          double v48 = [v10 stringValue];
          double v49 = [v47 stringWithFormat:@" %@", v48];
          double v50 = [v46 stringByAppendingString:v49];
          [v9 setStringValue:v50];

          double v51 = [MEMORY[0x1E4F1CA48] array];
          for (unint64_t i = 0; ; ++i)
          {
            float v53 = [v9 stringValueCandidates];
            BOOL v54 = i < [v53 count];

            if (!v54) {
              break;
            }
            float v55 = [v9 stringValueCandidates];
            CGFloat v56 = [v55 objectAtIndexedSubscript:i];

            CGFloat v57 = [v10 stringValueCandidates];
            double v58 = [v57 objectAtIndexedSubscript:0];

            double v59 = [v10 stringValueCandidates];
            BOOL v60 = i < [v59 count];

            if (v60)
            {
              double v61 = [v10 stringValueCandidates];
              uint64_t v62 = [v61 objectAtIndexedSubscript:i];

              double v58 = (void *)v62;
            }
            v63 = [NSString stringWithFormat:@" %@", v58];
            long long v64 = [v56 stringByAppendingString:v63];

            [v51 addObject:v64];
          }
          [v9 setStringValueCandidates:v51];
          [v9 bounds];
          double v76 = v75;
          [v9 bounds];
          double v78 = v77;
          [v10 bounds];
          if (v78 >= v79) {
            [v10 bounds];
          }
          else {
            [v9 bounds];
          }
          double v81 = v80;
          [v9 bounds];
          double v83 = v82;
          [v9 bounds];
          double v85 = v84;
          [v10 bounds];
          double v87 = v86;
          [v10 bounds];
          double v88 = v83 + v85;
          if (v83 + v85 <= v87 + v89)
          {
            objc_msgSend(v10, "bounds", v88);
            double v91 = v93;
            [v10 bounds];
          }
          else
          {
            objc_msgSend(v9, "bounds", v88);
            double v91 = v90;
            [v9 bounds];
          }
          double v94 = v92;
          [v10 bounds];
          double v96 = v95;
          [v10 bounds];
          objc_msgSend(v9, "setBounds:", v76, v81, v96 + v97 - v76, v91 + v94 - v81);
          for (unint64_t j = 0; j < [v8 count]; ++j)
          {
            CGRect v99 = [v10 candidateProbs];
            CGRect v100 = [v99 objectAtIndexedSubscript:0];
            [v100 floatValue];
            float v102 = v101;

            v103 = [v10 candidateProbs];
            LODWORD(v99) = j < [v103 count];

            if (v99)
            {
              v104 = [v10 candidateProbs];
              v105 = [v104 objectAtIndexedSubscript:j];
              [v105 floatValue];
              float v102 = v106;
            }
            v107 = [v8 objectAtIndexedSubscript:j];
            [v107 floatValue];
            float v109 = v108;

            *(float *)&double v110 = v102 + v109;
            v111 = [NSNumber numberWithFloat:v110];
            [v8 setObject:v111 atIndexedSubscript:j];
          }
          ++v127;
        }
        else
        {
LABEL_16:
          if (v127 >= 2)
          {
            for (unint64_t k = 0; k < [v8 count]; ++k)
            {
              double v66 = NSNumber;
              double v67 = [v8 objectAtIndexedSubscript:k];
              [v67 floatValue];
              *(float *)&double v69 = v68 / (float)v127;
              CGFloat v70 = [v66 numberWithFloat:v69];
              [v8 setObject:v70 atIndexedSubscript:k];
            }
            double v71 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
            [v9 setCandidateProbs:v71];
          }
          CGFloat v72 = (void *)[v10 copy];

          double v73 = [v72 candidateProbs];
          uint64_t v74 = [v73 mutableCopy];

          [v124 addObject:v72];
          unint64_t v127 = 1;
          uint64_t v8 = (void *)v74;
          float v9 = v72;
        }
        ++v128;
      }
      while (v128 != v126);
      uint64_t v112 = [obj countByEnumeratingWithState:&v129 objects:v133 count:16];
      uint64_t v126 = v112;
    }
    while (v112);
  }
  else
  {
    uint64_t v8 = 0;
    float v9 = 0;
  }

  v113 = [MEMORY[0x1E4F1C978] arrayWithArray:v124];

  return v113;
}

+ (id)overlayFeatures:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  double v28 = v6;
  [v33 extent];
  if (v6 && (double v9 = v7, v10 = v8, [v6 count]))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), DeviceRGB, 2u);
    *(_OWORD *)components = xmmword_1DD8CEC90;
    long long v46 = unk_1DD8CECA0;
    double v13 = CGColorCreate(DeviceRGB, components);
    CGContextSetStrokeColorWithColor(v12, v13);
    color = v13;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v40;
      uint64_t v29 = *(void *)v40;
      do
      {
        uint64_t v34 = v14;
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(obj);
          }
          double v17 = [*(id *)(*((void *)&v39 + 1) + 8 * i) textFeatureScaledToImage:v33];
          CGContextSetStrokeColorWithColor(v12, color);
          CGContextSetLineWidth(v12, 7.0);
          [v17 bounds];
          CGContextStrokeRect(v12, v49);
          if (v32)
          {
            double v18 = CGColorCreate(DeviceRGB, components);
            CGContextSetStrokeColorWithColor(v12, v18);
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            double v19 = [v17 subFeatures];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v36 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  double v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  CGContextSetLineWidth(v12, 1.0);
                  [v23 bounds];
                  CGContextStrokeRect(v12, v50);
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v20);
            }

            uint64_t v15 = v29;
            CGColorRelease(v18);
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v14);
    }

    Image = CGBitmapContextCreateImage(v12);
    double v25 = [MEMORY[0x1E4F1E050] imageWithCGImage:Image];
    double v26 = [v25 imageByCompositingOverImage:v33];

    CGImageRelease(Image);
    CGContextRelease(v12);
    CGColorRelease(color);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    double v26 = v33;
  }

  return v26;
}

+ (id)overlayFeaturesQuadVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  BOOL v63 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v64 = a4;
  double v58 = v6;
  [v64 extent];
  if (v6 && (double v9 = v7, v10 = v8, [v6 count]))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), DeviceRGB, 2u);
    SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
    CGContextSetStrokeColorWithColor(v12, SRGB);
    color = SRGB;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v70;
      uint64_t v59 = *(void *)v70;
      do
      {
        uint64_t v16 = 0;
        uint64_t v60 = v14;
        do
        {
          if (*(void *)v70 != v15) {
            objc_enumerationMutation(obj);
          }
          double v17 = [*(id *)(*((void *)&v69 + 1) + 8 * v16) textFeatureScaledToImage:v64];
          CGContextSetStrokeColorWithColor(v12, color);
          CGContextSetLineWidth(v12, 7.0);
          [v17 topLeft];
          CGFloat v19 = v18;
          [v17 topLeft];
          CGContextMoveToPoint(v12, v19, v20);
          [v17 topRight];
          CGFloat v22 = v21;
          [v17 topRight];
          CGContextAddLineToPoint(v12, v22, v23);
          [v17 bottomRight];
          CGFloat v25 = v24;
          [v17 bottomRight];
          CGContextAddLineToPoint(v12, v25, v26);
          [v17 bottomLeft];
          CGFloat v28 = v27;
          [v17 bottomLeft];
          CGContextAddLineToPoint(v12, v28, v29);
          [v17 topLeft];
          CGFloat v31 = v30;
          [v17 topLeft];
          CGContextAddLineToPoint(v12, v31, v32);
          CGContextStrokePath(v12);
          if (v63)
          {
            id v33 = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
            CGContextSetStrokeColorWithColor(v12, v33);
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            uint64_t v34 = [v17 subFeatures];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v65 objects:v73 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v66;
              do
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v66 != v36) {
                    objc_enumerationMutation(v34);
                  }
                  long long v38 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                  CGContextSetLineWidth(v12, 1.0);
                  [v38 topLeft];
                  CGFloat v40 = v39;
                  [v38 topLeft];
                  CGContextMoveToPoint(v12, v40, v41);
                  [v38 topRight];
                  CGFloat v43 = v42;
                  [v38 topRight];
                  CGContextAddLineToPoint(v12, v43, v44);
                  [v38 bottomRight];
                  CGFloat v46 = v45;
                  [v38 bottomRight];
                  CGContextAddLineToPoint(v12, v46, v47);
                  [v38 bottomLeft];
                  CGFloat v49 = v48;
                  [v38 bottomLeft];
                  CGContextAddLineToPoint(v12, v49, v50);
                  [v38 topLeft];
                  CGFloat v52 = v51;
                  [v38 topLeft];
                  CGContextAddLineToPoint(v12, v52, v53);
                  CGContextStrokePath(v12);
                }
                uint64_t v35 = [v34 countByEnumeratingWithState:&v65 objects:v73 count:16];
              }
              while (v35);
            }

            uint64_t v15 = v59;
            uint64_t v14 = v60;
            CGColorRelease(v33);
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v14);
    }

    Image = CGBitmapContextCreateImage(v12);
    float v55 = [MEMORY[0x1E4F1E050] imageWithCGImage:Image];
    CGFloat v56 = [v55 imageByCompositingOverImage:v64];

    CGImageRelease(Image);
    CGContextRelease(v12);
    CGColorRelease(color);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    CGFloat v56 = v64;
  }

  return v56;
}

+ (id)overlayFeaturesPolygonVertices:(id)a3 onImage:(id)a4 showSubFeatures:(BOOL)a5
{
  BOOL v64 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v57 = a4;
  double v58 = v6;
  [v57 extent];
  if (v6 && (double v9 = v7, v10 = v8, [v6 count]))
  {
    space = CGColorSpaceCreateDeviceRGB();
    double v11 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v10, 8uLL, vcvtd_n_u64_f64(v9, 5uLL), space, 2u);
    SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.5);
    CGContextSetStrokeColorWithColor(v11, SRGB);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obunint64_t j = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    color = SRGB;
    if (v13)
    {
      uint64_t v62 = *(void *)v70;
      do
      {
        uint64_t v63 = v13;
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v70 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          uint64_t v16 = [v15 polygon];
          if (v16)
          {
            double v17 = [v15 polygon];
            BOOL v18 = (unint64_t)[v17 pointCount] > 3;

            if (v18)
            {
              CGFloat v19 = [v15 polygon];
              CGFloat v20 = [v19 denormalizedPolyline];
              double v21 = [v20 pointValues];

              CGContextSetStrokeColorWithColor(v11, color);
              CGContextSetLineWidth(v11, 7.0);
              CGFloat v22 = [v21 objectAtIndex:0];
              [v22 pointValue];
              CGFloat v24 = v23;
              double v26 = v10 - v25;
              CGContextMoveToPoint(v11, v23, v10 - v25);
              for (unint64_t j = 1; [v21 count] > j; ++j)
              {
                CGFloat v28 = [v21 objectAtIndex:j];

                [v28 pointValue];
                CGContextAddLineToPoint(v11, v30, v10 - v29);
                CGFloat v22 = v28;
              }
              CGContextAddLineToPoint(v11, v24, v26);
              CGContextStrokePath(v11);
            }
          }
          if (v64)
          {
            CGFloat v31 = CGColorCreateSRGB(0.0, 1.0, 0.0, 0.5);
            CGContextSetStrokeColorWithColor(v11, v31);
            double v61 = v31;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            CGFloat v32 = [v15 subFeatures];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v73 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v66;
              do
              {
                for (uint64_t k = 0; k != v33; ++k)
                {
                  if (*(void *)v66 != v34) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v36 = *(void **)(*((void *)&v65 + 1) + 8 * k);
                  long long v37 = [v36 polygon];
                  if (v37)
                  {
                    long long v38 = [v36 polygon];
                    BOOL v39 = (unint64_t)[v38 pointCount] > 3;

                    if (v39)
                    {
                      CGFloat v40 = [v36 polygon];
                      CGFloat v41 = [v40 denormalizedPolyline];
                      double v42 = [v41 pointValues];

                      CGContextSetLineWidth(v11, 7.0);
                      CGFloat v43 = [v42 objectAtIndex:0];
                      [v43 pointValue];
                      CGFloat v45 = v44;
                      double v47 = v10 - v46;
                      CGContextMoveToPoint(v11, v44, v10 - v46);
                      for (unint64_t m = 1; [v42 count] > m; ++m)
                      {
                        CGFloat v49 = [v42 objectAtIndex:m];

                        [v49 pointValue];
                        CGContextAddLineToPoint(v11, v51, v10 - v50);
                        CGFloat v43 = v49;
                      }
                      CGContextAddLineToPoint(v11, v45, v47);
                      CGContextStrokePath(v11);
                    }
                  }
                }
                uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v73 count:16];
              }
              while (v33);
            }

            CGColorRelease(v61);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v13);
    }

    Image = CGBitmapContextCreateImage(v11);
    CGFloat v53 = [MEMORY[0x1E4F1E050] imageWithCGImage:Image];
    BOOL v54 = [v53 imageByCompositingOverImage:v57];

    CGImageRelease(Image);
    CGContextRelease(v11);
    CGColorRelease(color);
    CGColorSpaceRelease(space);
  }
  else
  {
    BOOL v54 = v57;
  }

  return v54;
}

+ (id)sortedTextFeaturesByAspectRatio:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = (void *)[a3 mutableCopy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CRTextFeature_sortedTextFeaturesByAspectRatio_imageSize___block_invoke;
  v9[3] = &__block_descriptor_48_e41_q24__0__CRTextFeature_8__CRTextFeature_16l;
  *(CGFloat *)&v9[4] = width;
  *(CGFloat *)&v9[5] = height;
  [v6 sortUsingComparator:v9];
  double v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v7;
}

uint64_t __59__CRTextFeature_sortedTextFeaturesByAspectRatio_imageSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(v5, "aspectRatioWithImageSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  float v8 = v7;
  objc_msgSend(v6, "aspectRatioWithImageSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  if (v8 > v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)scale:(CGPoint)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  a4.double x = a3.y;
  a4.double y = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CGFloat v6 = y + self->_bounds.origin.y * a3.y;
  self->_bounds.origin.double x = x + self->_bounds.origin.x * a3.x;
  self->_bounds.origin.double y = v6;
  v7.f64[0] = a3.x;
  v7.f64[1] = a4.x;
  self->_bounds.size = (CGSize)vmulq_f64(v7, (float64x2_t)self->_bounds.size);
  v7.f64[0] = y + self->_topLeft.y * a4.x;
  self->_topLeft.double x = x + self->_topLeft.x * a3.x;
  self->_topLeft.double y = v7.f64[0];
  v7.f64[0] = y + self->_topRight.y * a4.x;
  self->_topRight.double x = x + self->_topRight.x * a3.x;
  self->_topRight.double y = v7.f64[0];
  v7.f64[0] = y + self->_bottomRight.y * a4.x;
  self->_bottomRight.double x = x + self->_bottomRight.x * a3.x;
  self->_bottomRight.double y = v7.f64[0];
  v7.f64[0] = y + self->_bottomLeft.y * a4.x;
  self->_bottomLeft.double x = x + self->_bottomLeft.x * a3.x;
  self->_bottomLeft.double y = v7.f64[0];
  long long v12 = *(long long *)&a4.y;
  CGPoint v13 = a4;
  self->_toplineOrigin.double x = x + self->_toplineOrigin.x * a3.x;
  self->_baselineOrigin.double y = y + self->_baselineOrigin.y * a4.x;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v8 = self->_subFeatures;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "scale:offset:", *(double *)&v12, v13.x, x, y, v12, v13, (void)v14);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)setBaselineOrigin:(CGPoint)a3 toplineOrigin:(CGPoint)a4 slope:(float)a5
{
  if (!self || !self->_contextSet)
  {
    self->_baselineOrigin = a3;
    self->_toplineOrigin = a4;
    self->_baselineAngle = a5;
    self->_contextSet = 1;
  }
}

uint64_t __39__CRTextFeature_estimateTopAndBaseline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 bounds];
  double v6 = v5;
  [v4 bounds];
  if (v6 <= v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

- (void)updateSizeHints
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  double v3 = [(CRTextFeature *)self subFeatures];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    if (self)
    {
      if (!self->_contextSet)
      {
        double v5 = [(CRTextFeature *)self subFeatures];
        unsigned int v6 = [v5 count];

        if ((int)v6 > 1)
        {
          CGFloat v22 = [(CRTextFeature *)self subFeatures];
          CGFloat v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_114];

          if (v6)
          {
            double v25 = [v23 objectAtIndex:v6 >> 1];
            [v25 bounds];
            double v30 = v31;
          }
          else
          {
            unsigned int v24 = v6 >> 1;
            double v25 = [v23 objectAtIndex:v6 >> 1];
            [v25 bounds];
            double v27 = v26;
            CGFloat v28 = [v23 objectAtIndex:v24 - 1];
            [v28 bounds];
            double v30 = (v27 + v29) * 0.5;
          }
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          CGFloat v32 = [(CRTextFeature *)self subFeatures];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v109 objects:v114 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v110;
            double v20 = -1.0;
            double v103 = 0.0;
            double v101 = 0.0;
            double v19 = -1.0;
            CGFloat v18 = -1.0;
            double v21 = -1.0;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v110 != v34) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v36 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                [v36 bounds];
                double v38 = v37;
                [v36 bounds];
                double v40 = v39;
                [v36 bounds];
                double v42 = v41;
                [v36 bounds];
                double v44 = v38 + v40 * 0.5;
                double v45 = vabdd_f64(v42, v30);
                if (v43 >= v30) {
                  double v46 = v43;
                }
                else {
                  double v46 = v30;
                }
                if (v45 < v46 * 0.1 && v21 < 0.0)
                {
                  [v36 bounds];
                  CGFloat v18 = v47;
                  double v21 = v44;
                }
                [v36 bounds];
                double v49 = v48;
                [v36 bounds];
                double v51 = vabdd_f64(v49, v30);
                if (v50 >= v30) {
                  double v52 = v50;
                }
                else {
                  double v52 = v30;
                }
                if (v51 < v52 * 0.3)
                {
                  [v36 bounds];
                  double v54 = v53;
                  [v36 bounds];
                  if (v19 < 0.0)
                  {
                    double v20 = v54 + v55;
                    double v19 = v44;
                  }
                  double v101 = v101 + (v44 - v19) * (v54 + v55 - v20);
                  double v103 = v103 + (v44 - v19) * (v44 - v19);
                }
              }
              uint64_t v33 = [v32 countByEnumeratingWithState:&v109 objects:v114 count:16];
            }
            while (v33);

            if (v103 <= 0.0) {
              float v56 = NAN;
            }
            else {
              float v56 = v101 / v103;
            }
          }
          else
          {

            double v21 = -1.0;
            float v56 = NAN;
            CGFloat v18 = -1.0;
            double v19 = -1.0;
            double v20 = -1.0;
          }
          self->_float baselineAngle = v56;
        }
        else
        {
          self->_float baselineAngle = NAN;
          double v7 = [(CRTextFeature *)self subFeatures];
          uint64_t v8 = [v7 firstObject];

          [v8 bounds];
          double v10 = v9;
          [v8 bounds];
          double v12 = v11;
          [v8 bounds];
          double v14 = v13;
          [v8 bounds];
          double v16 = v15;
          [v8 bounds];
          CGFloat v18 = v17;
          double v19 = v10 + v12 * 0.5;
          double v20 = v14 + v16;

          double v21 = v19;
        }
        self->_baselineOrigin.double x = v19;
        self->_baselineOrigin.double y = v20;
        self->_toplineOrigin.double x = v21;
        self->_toplineOrigin.double y = v18;
        self->_contextSet = 1;
      }
      float baselineAngle = self->_baselineAngle;
      float v58 = sqrtf((float)(baselineAngle * baselineAngle) + 1.0);
      double v104 = (float)(1.0 / v58);
      double v59 = (float)(baselineAngle / v58);
    }
    else
    {
      double v59 = 0.0;
      double v104 = 0.0;
    }
    [(CRTextFeature *)self toplineOrigin];
    double v61 = v60;
    [(CRTextFeature *)self baselineOrigin];
    double v63 = v62;
    [(CRTextFeature *)self toplineOrigin];
    double v65 = v64;
    [(CRTextFeature *)self baselineOrigin];
    double v67 = v66;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v68 = [(CRTextFeature *)self subFeatures];
    uint64_t v69 = [v68 countByEnumeratingWithState:&v105 objects:v113 count:16];
    if (v69)
    {
      double v102 = -v59;
      double v70 = fabs(v104 * (v65 - v67) - (v61 - v63) * v59);
      double v96 = v70 * 0.3;
      uint64_t v71 = *(void *)v106;
      double v97 = v70 + v70 * 0.2;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v106 != v71) {
            objc_enumerationMutation(v68);
          }
          double v73 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          [v73 setSizeHint:0];
          [v73 topLeft];
          double v100 = v74;
          [(CRTextFeature *)self baselineOrigin];
          double v99 = v75;
          [v73 topLeft];
          double v77 = v76;
          [(CRTextFeature *)self baselineOrigin];
          double v79 = v78;
          [v73 bottomLeft];
          double v98 = v80;
          [(CRTextFeature *)self baselineOrigin];
          double v82 = v81;
          [v73 bottomLeft];
          double v84 = v83;
          [(CRTextFeature *)self baselineOrigin];
          double v86 = v85;
          [v73 bottomLeft];
          double v88 = v87;
          [v73 topLeft];
          double v90 = v89;
          [v73 bottomLeft];
          double v92 = v91;
          [v73 topLeft];
          double v93 = -(v104 * (v77 - v79) + (v100 - v99) * v102);
          double v95 = v104 * (v92 - v94) + (v88 - v90) * v102;
          if (v95 < v93) {
            double v93 = v95;
          }
          if (v93 > v97) {
            objc_msgSend(v73, "setSizeHint:", objc_msgSend(v73, "sizeHint") | 2);
          }
          if (v104 * (v84 - v86) + (v98 - v82) * v102 > v96) {
            objc_msgSend(v73, "setSizeHint:", objc_msgSend(v73, "sizeHint") | 1);
          }
        }
        uint64_t v69 = [v68 countByEnumeratingWithState:&v105 objects:v113 count:16];
      }
      while (v69);
    }
  }
}

- (BOOL)isUp
{
  return ([(CRTextFeature *)self sizeHint] >> 1) & 1;
}

- (BOOL)isDown
{
  return [(CRTextFeature *)self sizeHint] & 1;
}

- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3
{
  double v5 = [(CRTextFeature *)self stringValueCandidates];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v7 = [(CRTextFeature *)self stringValueCandidates];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

    double v9 = objc_opt_new();
    uint64_t v10 = [v8 length];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __63__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex___block_invoke;
    double v17 = &unk_1E6CDC1C8;
    CGFloat v18 = self;
    id v11 = v9;
    id v19 = v11;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, &v14);
    double v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v11, v14, v15, v16, v17, v18);
  }
  return v12;
}

void __63__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isEqual:@" "] & 1) == 0)
  {
    uint64_t v4 = objc_alloc_init(CRTextFeature);
    v7[0] = v3;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(CRTextFeature *)v4 setStringValueCandidates:v5];

    [(CRTextFeature *)v4 setCandidateProbs:&unk_1F3935CF8];
    [(CRTextFeature *)v4 setStringValue:v3];
    [*(id *)(a1 + 32) bounds];
    -[CRTextFeature setBounds:](v4, "setBounds:");
    [*(id *)(a1 + 32) topLeft];
    -[CRTextFeature setTopLeft:](v4, "setTopLeft:");
    [*(id *)(a1 + 32) topRight];
    -[CRTextFeature setTopRight:](v4, "setTopRight:");
    [*(id *)(a1 + 32) bottomRight];
    -[CRTextFeature setBottomRight:](v4, "setBottomRight:");
    [*(id *)(a1 + 32) bottomLeft];
    -[CRTextFeature setBottomLeft:](v4, "setBottomLeft:");
    unint64_t v6 = [*(id *)(a1 + 32) selectedLocale];
    [(CRTextFeature *)v4 setSelectedLocale:v6];

    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)createCharacterSubFeaturesForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 falsePositiveFiltering:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  double v12 = [(CRTextFeature *)self stringValueCandidates];
  unint64_t v13 = [v12 count];

  if (v13 <= a3)
  {
    CGFloat v23 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = [(CRTextFeature *)self stringValueCandidates];
    double v16 = [v15 objectAtIndexedSubscript:a3];

    uint64_t v17 = characterCount(v16);
    if (v10 && v11 && (uint64_t v18 = v17, [v10 count]) && objc_msgSend(v11, "count"))
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = 0;
      id v19 = [MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet];
      uint64_t v20 = [(NSString *)v16 length];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      double v29 = __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2;
      double v30 = &unk_1E6CDC1F0;
      id v31 = v10;
      uint64_t v37 = 2 * v18 - 2;
      id v32 = v11;
      BOOL v39 = a6;
      id v21 = v19;
      id v33 = v21;
      uint64_t v34 = self;
      uint64_t v36 = v40;
      uint64_t v38 = v18;
      id v22 = v14;
      id v35 = v22;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 2, &v27);
      CGFloat v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v22, v27, v28, v29, v30);

      _Block_object_dispose(v40, 8);
    }
    else
    {
      uint64_t v24 = [(NSString *)v16 length];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke;
      v41[3] = &unk_1E6CDC1C8;
      v41[4] = self;
      id v25 = v14;
      id v42 = v25;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 2, v41);
      CGFloat v23 = [MEMORY[0x1E4F1C978] arrayWithArray:v25];
    }
  }

  return v23;
}

void __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [CRTextFeature alloc];
  [*(id *)(a1 + 32) topLeft];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) topRight];
  double v10 = v9;
  double v12 = v11;
  [*(id *)(a1 + 32) bottomLeft];
  double v14 = v13;
  double v16 = v15;
  [*(id *)(a1 + 32) bottomRight];
  id v19 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v4, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v6, v8, v10, v12, v14, v16, v17, v18);
  [*(id *)(a1 + 32) bounds];
  -[CRTextFeature setBounds:](v19, "setBounds:");
  [(CRTextFeature *)v19 setStringValue:v3];
  v26[0] = v3;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [(CRTextFeature *)v19 setStringValueCandidates:v20];

  id v21 = [*(id *)(a1 + 32) confidence];
  [(CRTextFeature *)v19 setConfidence:v21];

  id v22 = [*(id *)(a1 + 32) confidence];
  id v25 = v22;
  CGFloat v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [(CRTextFeature *)v19 setCandidateProbs:v23];

  [*(id *)(a1 + 32) baselineAngle];
  -[CRTextFeature setBaselineAngle:](v19, "setBaselineAngle:");
  [(CRTextFeature *)v19 setType:4];
  uint64_t v24 = [*(id *)(a1 + 32) selectedLocale];
  [(CRTextFeature *)v19 setSelectedLocale:v24];

  [*(id *)(a1 + 40) addObject:v19];
}

void __129__CRTextFeature_createCharacterSubFeaturesForCandidateAtIndex_topWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2(uint64_t a1, void *a2)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count] == *(void *)(a1 + 80)
    && [*(id *)(a1 + 40) count] == *(void *)(a1 + 80))
  {
    if (!*(unsigned char *)(a1 + 96)
      || [v3 rangeOfCharacterFromSet:*(void *)(a1 + 48)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v4)
      {
        double v5 = *(void **)(a1 + 32);
        uint64_t v6 = 2 * v4 - 1;
        if (v4 == *(void *)(a1 + 88) - 1)
        {
          double v7 = [v5 objectAtIndexedSubscript:v6];
          [v7 pointValue];
          double v9 = v8;
          double v11 = v10;

          double v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 1];
          [v12 pointValue];
          double v14 = v13;
          double v16 = v15;

          [*(id *)(a1 + 56) topRight];
          double v18 = v17;
          double v20 = v19;
          [*(id *)(a1 + 56) bottomRight];
          double v22 = v21;
          double v24 = v23;
LABEL_13:
          double v46 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v9, v11, v18, v20, v14, v16, v22, v24);
          [(CRTextFeature *)v46 setStringValue:v3];
          v52[0] = v3;
          double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
          [(CRTextFeature *)v46 setStringValueCandidates:v47];

          double v48 = [*(id *)(a1 + 56) confidence];
          [(CRTextFeature *)v46 setConfidence:v48];

          double v49 = [*(id *)(a1 + 56) confidence];
          double v51 = v49;
          double v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
          [(CRTextFeature *)v46 setCandidateProbs:v50];

          [*(id *)(a1 + 56) baselineAngle];
          -[CRTextFeature setBaselineAngle:](v46, "setBaselineAngle:");
          [(CRTextFeature *)v46 setType:4];
          [*(id *)(a1 + 64) addObject:v46];

          goto LABEL_9;
        }
        uint64_t v37 = [v5 objectAtIndexedSubscript:v6];
        [v37 pointValue];
        double v9 = v38;
        double v11 = v39;

        double v40 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 1];
        [v40 pointValue];
        double v14 = v41;
        double v16 = v42;

        double v43 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [v43 pointValue];
        double v18 = v44;
        double v20 = v45;

        uint64_t v34 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [v34 pointValue];
      }
      else
      {
        [*(id *)(a1 + 56) topLeft];
        double v9 = v27;
        double v11 = v28;
        [*(id *)(a1 + 56) bottomLeft];
        double v14 = v29;
        double v16 = v30;
        id v31 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [v31 pointValue];
        double v18 = v32;
        double v20 = v33;

        uint64_t v34 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [v34 pointValue];
      }
      double v22 = v35;
      double v24 = v36;

      goto LABEL_13;
    }
  }
  else
  {
    id v25 = *(void **)(a1 + 64);
    double v26 = (void *)[*(id *)(a1 + 56) copy];
    [v25 addObject:v26];
  }
LABEL_9:
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

- (CGSize)sizeForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(CRTextFeature *)self polygon];

  if (v6)
  {
    double v7 = [(CRTextFeature *)self polygon];
    double v8 = [v7 denormalizedPolyline];
    [v8 estimatedLineSizeForPairedPointPolygon];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v14 = v13;
    double v16 = v15;
    [(CRTextFeature *)self topRight];
    BOOL v19 = v14 == v18 && v16 == v17;
    if (v19
      || ([(CRTextFeature *)self topLeft],
          double v21 = v20,
          double v23 = v22,
          [(CRTextFeature *)self bottomLeft],
          v21 == v25)
      && v23 == v24)
    {
      [(CRTextFeature *)self bounds];
      double v10 = v26;
      [(CRTextFeature *)self bounds];
      double v12 = v27;
    }
    else
    {
      [(CRTextFeature *)self topLeft];
      double v29 = v28;
      [(CRTextFeature *)self topRight];
      double v31 = width * (v29 - v30);
      [(CRTextFeature *)self topLeft];
      double v33 = v32;
      [(CRTextFeature *)self topRight];
      double v35 = height * (v33 - v34);
      [(CRTextFeature *)self bottomLeft];
      double v37 = v36;
      [(CRTextFeature *)self topLeft];
      double v39 = width * (v37 - v38);
      [(CRTextFeature *)self bottomLeft];
      double v41 = v40;
      [(CRTextFeature *)self topLeft];
      double v43 = height * (v41 - v42);
      double v10 = sqrt(v35 * v35 + v31 * v31);
      double v12 = sqrt(v43 * v43 + v39 * v39);
    }
  }
  double v44 = v10;
  double v45 = v12;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (float)aspectRatioWithImageSize:(CGSize)a3
{
  -[CRTextFeature sizeForImageSize:](self, "sizeForImageSize:", a3.width, a3.height);
  float v5 = v4;
  float result = 0.0;
  if (v5 != 0.0)
  {
    float v7 = v3;
    float result = v7 / v5;
    if (v5 <= 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (void)setStringValueByReplacingCharactersInSet:(id)a3 withString:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v38 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  stringValue = self->_stringValue;
  if (stringValue)
  {
    double v9 = self;
    double v10 = [(NSString *)stringValue componentsSeparatedByCharactersInSet:v6];
    double v11 = [v10 componentsJoinedByString:v7];
    uint64_t v12 = [v11 stringByTrimmingCharactersInSet:v38];

    self = v9;
    double v13 = v9->_stringValue;
    v9->_stringValue = (NSString *)v12;
  }
  double v14 = [(CRTextFeature *)self stringValueCandidates];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    double v40 = [MEMORY[0x1E4F1CA48] array];
    double v16 = [MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = [v37 stringValueCandidates];
    uint64_t v17 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if ([v20 rangeOfCharacterFromSet:v16] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v40 addObject:v20];
          }
          else
          {
            double v21 = [v20 componentsSeparatedByCharactersInSet:v6];
            double v22 = [v21 componentsJoinedByString:v7];
            double v23 = [v22 stringByTrimmingCharactersInSet:v38];

            [v40 addObject:v23];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v17);
    }

    [v37 setStringValueCandidates:v40];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v24 = [v37 subFeatures];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * j) setStringValueByReplacingCharactersInSet:v6 withString:v7];
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v25);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  double v28 = [v37 subFeatureCandidates];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v28);
        }
        double v32 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v42;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v42 != v35) {
                objc_enumerationMutation(v33);
              }
              [*(id *)(*((void *)&v41 + 1) + 8 * m) setStringValueByReplacingCharactersInSet:v6 withString:v7];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v57 count:16];
          }
          while (v34);
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v29);
  }
}

- (void)adjustBoundsBasedOnSubfeaturesForImageSize:(CGSize)a3
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  double v4 = [(CRTextFeature *)self subFeatures];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v138 objects:v158 count:16];
  v6.f64[0] = v135;
  double v7 = v135 * 0.5;
  double v8 = v136 * 0.5;
  if (v5)
  {
    uint64_t v9 = *(void *)v139;
    v6.f64[1] = v136;
    float64x2_t v137 = v6;
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
    double v12 = -1.79769313e308;
    double v13 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v139 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        [v15 topLeft];
        double v150 = v16;
        double v151 = v17;
        [v15 topRight];
        double v152 = v18;
        double v153 = v19;
        [v15 bottomRight];
        double v154 = v20;
        double v155 = v21;
        [v15 bottomLeft];
        uint64_t v22 = 0;
        double v156 = v23;
        double v157 = v24;
        do
        {
          uint64_t v25 = (float64x2_t *)((char *)&v150 + v22);
          float64x2_t v26 = vmulq_f64(v137, *(float64x2_t *)((char *)&v152 + v22));
          *uint64_t v25 = vmulq_f64(v137, *(float64x2_t *)((char *)&v150 + v22));
          v25[1] = v26;
          v22 += 32;
        }
        while (v22 != 64);
        [(CRTextFeature *)self baselineAngle];
        rotatePolygon(&v150, &v142, v7, v8, v27);
        double v28 = v142;
        if (v13 >= v142) {
          double v29 = v142;
        }
        else {
          double v29 = v13;
        }
        if (v29 >= v144) {
          double v30 = v144;
        }
        else {
          double v30 = v29;
        }
        if (v30 >= v146)
        {
          double v13 = v148;
          if (v146 < v148) {
            double v13 = v146;
          }
        }
        else if (v30 >= v148)
        {
          double v13 = v148;
        }
        else
        {
          double v13 = v30;
        }
        if (v12 > v142) {
          double v28 = v12;
        }
        if (v28 <= v144) {
          double v28 = v144;
        }
        if (v28 <= v146)
        {
          double v12 = v148;
          if (v146 > v148) {
            double v12 = v146;
          }
        }
        else if (v28 <= v148)
        {
          double v12 = v148;
        }
        else
        {
          double v12 = v28;
        }
        double v31 = v143;
        if (v10 >= v143) {
          double v32 = v143;
        }
        else {
          double v32 = v10;
        }
        if (v32 >= v145) {
          double v33 = v145;
        }
        else {
          double v33 = v32;
        }
        if (v33 >= v147)
        {
          double v10 = v149;
          if (v147 < v149) {
            double v10 = v147;
          }
        }
        else if (v33 >= v149)
        {
          double v10 = v149;
        }
        else
        {
          double v10 = v33;
        }
        if (v11 > v143) {
          double v31 = v11;
        }
        if (v31 <= v145) {
          double v31 = v145;
        }
        if (v31 <= v147)
        {
          double v11 = v149;
          if (v147 > v149) {
            double v11 = v147;
          }
        }
        else
        {
          double v11 = v149;
          if (v31 > v149) {
            double v11 = v31;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v138 objects:v158 count:16];
    }
    while (v5);
  }
  else
  {
    double v10 = 1.79769313e308;
    double v11 = -1.79769313e308;
    double v12 = -1.79769313e308;
    double v13 = 1.79769313e308;
  }

  double v150 = v13;
  double v151 = v10;
  double v152 = v12;
  double v153 = v10;
  double v154 = v12;
  double v155 = v11;
  double v156 = v13;
  double v157 = v11;
  [(CRTextFeature *)self baselineAngle];
  rotatePolygon(&v150, &v142, v7, v8, (float)-v34);
  double v35 = v142;
  double v36 = v143;
  BOOL v37 = v135 == 0.0 || v136 == 0.0;
  if (!v37)
  {
    double v35 = v142 / v135;
    double v36 = v143 / v136;
  }
  -[CRTextFeature setTopLeft:](self, "setTopLeft:", v35, v36, v136, v135);
  double v38 = v144;
  double v39 = v145;
  if (!v37)
  {
    double v38 = v144 / v135;
    double v39 = v145 / v136;
  }
  -[CRTextFeature setTopRight:](self, "setTopRight:", v38, v39);
  double v40 = v146;
  double v41 = v147;
  if (!v37)
  {
    double v40 = v146 / v135;
    double v41 = v147 / v136;
  }
  -[CRTextFeature setBottomRight:](self, "setBottomRight:", v40, v41);
  double v42 = v148;
  double v43 = v149;
  if (!v37)
  {
    double v42 = v148 / v135;
    double v43 = v149 / v136;
  }
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:", v42, v43);
  [(CRTextFeature *)self topLeft];
  double v45 = v44;
  [(CRTextFeature *)self bottomLeft];
  if (v45 >= v46) {
    [(CRTextFeature *)self bottomLeft];
  }
  else {
    [(CRTextFeature *)self topLeft];
  }
  double v48 = v47;
  [(CRTextFeature *)self topRight];
  if (v48 >= v49)
  {
    [(CRTextFeature *)self topRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v51 = v50;
    [(CRTextFeature *)self bottomLeft];
    if (v51 >= v52) {
      [(CRTextFeature *)self bottomLeft];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
  }
  double v54 = v53;
  [(CRTextFeature *)self bottomRight];
  if (v54 >= v55)
  {
    [(CRTextFeature *)self bottomRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v57 = v56;
    [(CRTextFeature *)self bottomLeft];
    if (v57 >= v58) {
      [(CRTextFeature *)self bottomLeft];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
    double v61 = v59;
    [(CRTextFeature *)self topRight];
    if (v61 >= v62)
    {
      [(CRTextFeature *)self topRight];
    }
    else
    {
      [(CRTextFeature *)self topLeft];
      double v64 = v63;
      [(CRTextFeature *)self bottomLeft];
      if (v64 >= v65) {
        [(CRTextFeature *)self bottomLeft];
      }
      else {
        [(CRTextFeature *)self topLeft];
      }
    }
  }
  double v66 = v60;
  [(CRTextFeature *)self topLeft];
  double v68 = v67;
  [(CRTextFeature *)self bottomLeft];
  if (v68 <= v69) {
    [(CRTextFeature *)self bottomLeft];
  }
  else {
    [(CRTextFeature *)self topLeft];
  }
  double v71 = v70;
  [(CRTextFeature *)self topRight];
  if (v71 <= v72)
  {
    [(CRTextFeature *)self topRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v74 = v73;
    [(CRTextFeature *)self bottomLeft];
    if (v74 <= v75) {
      [(CRTextFeature *)self bottomLeft];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
  }
  double v77 = v76;
  [(CRTextFeature *)self bottomRight];
  if (v77 <= v78)
  {
    [(CRTextFeature *)self bottomRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v80 = v79;
    [(CRTextFeature *)self bottomLeft];
    if (v80 <= v81) {
      [(CRTextFeature *)self bottomLeft];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
    double v84 = v82;
    [(CRTextFeature *)self topRight];
    if (v84 <= v85)
    {
      [(CRTextFeature *)self topRight];
    }
    else
    {
      [(CRTextFeature *)self topLeft];
      double v87 = v86;
      [(CRTextFeature *)self bottomLeft];
      if (v87 <= v88) {
        [(CRTextFeature *)self bottomLeft];
      }
      else {
        [(CRTextFeature *)self topLeft];
      }
    }
  }
  double v89 = v83;
  [(CRTextFeature *)self topLeft];
  double v91 = v90;
  [(CRTextFeature *)self topRight];
  if (v91 >= v92) {
    [(CRTextFeature *)self topRight];
  }
  else {
    [(CRTextFeature *)self topLeft];
  }
  double v94 = v93;
  [(CRTextFeature *)self bottomRight];
  if (v94 >= v95)
  {
    [(CRTextFeature *)self bottomRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v97 = v96;
    [(CRTextFeature *)self topRight];
    if (v97 >= v98) {
      [(CRTextFeature *)self topRight];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
  }
  double v100 = v99;
  [(CRTextFeature *)self bottomLeft];
  if (v100 >= v101)
  {
    [(CRTextFeature *)self bottomLeft];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v103 = v102;
    [(CRTextFeature *)self topRight];
    if (v103 >= v104) {
      [(CRTextFeature *)self topRight];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
    double v107 = v105;
    [(CRTextFeature *)self bottomRight];
    if (v107 >= v108)
    {
      [(CRTextFeature *)self bottomRight];
    }
    else
    {
      [(CRTextFeature *)self topLeft];
      double v110 = v109;
      [(CRTextFeature *)self topRight];
      if (v110 >= v111) {
        [(CRTextFeature *)self topRight];
      }
      else {
        [(CRTextFeature *)self topLeft];
      }
    }
  }
  double v112 = v106;
  [(CRTextFeature *)self topLeft];
  double v114 = v113;
  [(CRTextFeature *)self topRight];
  if (v114 <= v115) {
    [(CRTextFeature *)self topRight];
  }
  else {
    [(CRTextFeature *)self topLeft];
  }
  double v117 = v116;
  [(CRTextFeature *)self bottomRight];
  if (v117 <= v118)
  {
    [(CRTextFeature *)self bottomRight];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v120 = v119;
    [(CRTextFeature *)self topRight];
    if (v120 <= v121) {
      [(CRTextFeature *)self topRight];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
  }
  double v123 = v122;
  [(CRTextFeature *)self bottomLeft];
  if (v123 <= v124)
  {
    [(CRTextFeature *)self bottomLeft];
  }
  else
  {
    [(CRTextFeature *)self topLeft];
    double v126 = v125;
    [(CRTextFeature *)self topRight];
    if (v126 <= v127) {
      [(CRTextFeature *)self topRight];
    }
    else {
      [(CRTextFeature *)self topLeft];
    }
    double v130 = v128;
    [(CRTextFeature *)self bottomRight];
    if (v130 <= v131)
    {
      [(CRTextFeature *)self bottomRight];
    }
    else
    {
      [(CRTextFeature *)self topLeft];
      double v133 = v132;
      [(CRTextFeature *)self topRight];
      if (v133 <= v134) {
        [(CRTextFeature *)self topRight];
      }
      else {
        [(CRTextFeature *)self topLeft];
      }
    }
  }
  -[CRTextFeature setBounds:](self, "setBounds:", v66, v112, v89 - v66, v129 - v112);
}

- (void)flipHorizontally
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(CRTextFeature *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(CRTextFeature *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(CRTextFeature *)self bottomRight];
  -[CRTextFeature setTopLeft:](self, "setTopLeft:");
  [(CRTextFeature *)self bottomLeft];
  -[CRTextFeature setTopRight:](self, "setTopRight:");
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:", v8, v10);
  -[CRTextFeature setBottomRight:](self, "setBottomRight:", v4, v6);
  [(CRTextFeature *)self baselineAngle];
  double v12 = v11 + 3.14159265;
  if (v12 <= 3.14159265)
  {
    if (v12 > -3.14159265) {
      goto LABEL_6;
    }
    double v13 = 6.28318531;
  }
  else
  {
    double v13 = -6.28318531;
  }
  double v12 = v12 + v13;
LABEL_6:
  *(float *)&double v12 = v12;
  [(CRTextFeature *)self setBaselineAngle:v12];
  double v14 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v15 = [(CRTextFeature *)self subFeatures];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v15);
        }
        double v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (([v14 containsObject:v19] & 1) == 0)
        {
          [v19 flipHorizontally];
          [v14 addObject:v19];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v16);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v20 = [(CRTextFeature *)self subFeatureCandidates];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v20);
        }
        double v24 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v31;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v31 != v27) {
                objc_enumerationMutation(v25);
              }
              double v29 = *(void **)(*((void *)&v30 + 1) + 8 * k);
              if (([v14 containsObject:v29] & 1) == 0)
              {
                [v29 flipHorizontally];
                [v14 addObject:v29];
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v26);
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v21);
  }
}

- (id)createSubFeaturesFromStringsForCandidateAtIndex:(int64_t)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v155[1] = *MEMORY[0x1E4F143B8];
  id v142 = a4;
  id v141 = a5;
  double v12 = [(CRTextFeature *)self stringValueCandidates];
  unint64_t v13 = [v12 count];

  if (v13 <= a3)
  {
    double v48 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_65;
  }
  if (v8)
  {
    double v14 = [v142 objectAtIndexedSubscript:0];
    [v14 pointValue];
    double v16 = v15;
    double v18 = v17;
    double v19 = [v142 objectAtIndexedSubscript:1];
    [v19 pointValue];
    int v139 = 0;
    if (v16 == v21 && v18 == v20)
    {
      uint64_t v22 = [v141 objectAtIndexedSubscript:0];
      [v22 pointValue];
      double v24 = v23;
      double v26 = v25;
      uint64_t v27 = [v141 objectAtIndexedSubscript:1];
      [v27 pointValue];
      BOOL v29 = v24 == v28;
      if (v26 != v30) {
        BOOL v29 = 0;
      }
      int v139 = v29;
    }
    long long v31 = [v142 lastObject];
    [v31 pointValue];
    double v33 = v32;
    double v35 = v34;
    long long v36 = objc_msgSend(v142, "objectAtIndexedSubscript:", objc_msgSend(v142, "count") - 2);
    [v36 pointValue];
    int v133 = 0;
    if (v33 == v38 && v35 == v37)
    {
      long long v39 = [v141 lastObject];
      [v39 pointValue];
      double v41 = v40;
      double v43 = v42;
      double v44 = objc_msgSend(v141, "objectAtIndexedSubscript:", objc_msgSend(v141, "count") - 2);
      [v44 pointValue];
      BOOL v46 = v41 == v45;
      if (v43 != v47) {
        BOOL v46 = 0;
      }
      int v133 = v46;
    }
    if ([v142 count] == 4)
    {
      if ((v139 & v133) != 1) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    if ([v141 count] == 4 && ((v139 ^ 1) & 1) == 0 && ((v133 ^ 1) & 1) == 0)
    {
LABEL_24:
      long long v140 = (void *)[(CRTextFeature *)self copy];
      double v56 = [(CRTextFeature *)self stringValueCandidates];
      double v57 = [v56 objectAtIndexedSubscript:a3];
      double v152 = v57;
      double v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v152 count:1];
      [v140 setStringValueCandidates:v58];

      double v59 = [(CRTextFeature *)self candidateProbs];
      double v60 = [v59 objectAtIndexedSubscript:a3];
      double v151 = v60;
      double v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
      [v140 setCandidateProbs:v61];

      double v150 = v140;
      uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
      goto LABEL_25;
    }
LABEL_26:
    long long v140 = [MEMORY[0x1E4F1CA48] array];
    double v62 = [(CRTextFeature *)self stringValueCandidates];
    double v63 = [v62 objectAtIndexedSubscript:a3];
    double v64 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    double v65 = [v63 componentsSeparatedByCharactersInSet:v64];

    double v128 = v65;
    double v66 = (void *)[v65 mutableCopy];
    [v66 removeObject:&stru_1F38EED68];
    uint64_t v67 = [v66 count];
    if (v8) {
      uint64_t v68 = 2;
    }
    else {
      uint64_t v68 = -2;
    }
    uint64_t v69 = v68 + 2 * v67;
    if ([v142 count] == v69 && objc_msgSend(v141, "count") == v69)
    {
      double v127 = v66;
      if (v8) {
        uint64_t v70 = [v66 count];
      }
      else {
        uint64_t v70 = [v66 count] - 1;
      }
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      obuint64_t j = v66;
      uint64_t v72 = [obj countByEnumeratingWithState:&v143 objects:v149 count:16];
      if (v72)
      {
        uint64_t v73 = v8;
        uint64_t v74 = 3;
        if (v7) {
          uint64_t v74 = 4;
        }
        uint64_t v136 = v74;
        uint64_t v132 = 2 * v70 - 1;
        uint64_t v75 = 2;
        if (!v8) {
          uint64_t v75 = 0;
        }
        uint64_t v137 = v75;
        uint64_t v138 = *(void *)v144;
        uint64_t v130 = -v70;
        uint64_t v129 = -(uint64_t)v8;
        do
        {
          uint64_t v76 = 0;
          uint64_t v77 = 2 * v73;
          uint64_t v134 = v130 + v73;
          uint64_t v131 = v73;
          uint64_t v78 = v129 + v73;
          do
          {
            if (*(void *)v144 != v138) {
              objc_enumerationMutation(obj);
            }
            double v79 = *(void **)(*((void *)&v143 + 1) + 8 * v76);
            if (v78 + v76) {
              int v80 = 0;
            }
            else {
              int v80 = v139;
            }
            if (v80 == 1)
            {
              [(CRTextFeature *)self topLeft];
              double v82 = v81;
              double v84 = v83;
              [(CRTextFeature *)self bottomLeft];
              double v86 = v85;
              double v88 = v87;
              double v89 = [v142 objectAtIndexedSubscript:v137];
              [v89 pointValue];
              double v91 = v90;
              double v93 = v92;

              double v94 = [v141 objectAtIndexedSubscript:v137];
              [v94 pointValue];
            }
            else
            {
              if (v134 + v76) {
                int v97 = 0;
              }
              else {
                int v97 = v133;
              }
              if (v97 == 1)
              {
                double v98 = [v142 objectAtIndexedSubscript:v132];
                [v98 pointValue];
                double v82 = v99;
                double v84 = v100;

                double v101 = [v141 objectAtIndexedSubscript:v132];
                [v101 pointValue];
                double v86 = v102;
                double v88 = v103;

                [(CRTextFeature *)self topRight];
                double v91 = v104;
                double v93 = v105;
                [(CRTextFeature *)self bottomRight];
                double v107 = v106;
                double v109 = v108;
                goto LABEL_56;
              }
              double v110 = [v142 objectAtIndexedSubscript:v77 - 1];
              [v110 pointValue];
              double v82 = v111;
              double v84 = v112;

              double v113 = [v141 objectAtIndexedSubscript:v77 - 1];
              [v113 pointValue];
              double v86 = v114;
              double v88 = v115;

              double v116 = [v142 objectAtIndexedSubscript:v77];
              [v116 pointValue];
              double v91 = v117;
              double v93 = v118;

              double v94 = [v141 objectAtIndexedSubscript:v77];
              [v94 pointValue];
            }
            double v107 = v95;
            double v109 = v96;

LABEL_56:
            double v119 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v82, v84, v91, v93, v86, v88, v107, v109);
            if (v7)
            {
              uint64_t v70 = [v79 combinedTokenSequenceString];
              double v79 = (void *)v70;
            }
            -[CRTextFeature setStringValue:](v119, "setStringValue:", v79, v127);
            if (v7) {

            }
            double v120 = [(CRTextFeature *)v119 stringValue];
            double v148 = v120;
            double v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v148 count:1];
            [(CRTextFeature *)v119 setStringValueCandidates:v121];

            double v122 = [(CRTextFeature *)self confidence];
            [(CRTextFeature *)v119 setConfidence:v122];

            double v123 = [(CRTextFeature *)self confidence];
            double v147 = v123;
            double v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
            [(CRTextFeature *)v119 setCandidateProbs:v124];

            [(CRTextFeature *)self baselineAngle];
            -[CRTextFeature setBaselineAngle:](v119, "setBaselineAngle:");
            double v125 = [(CRTextFeature *)self selectedLocale];
            [(CRTextFeature *)v119 setSelectedLocale:v125];

            [(CRTextFeature *)v119 setType:v136];
            [v140 addObject:v119];

            ++v76;
            v77 += 2;
          }
          while (v72 != v76);
          uint64_t v72 = [obj countByEnumeratingWithState:&v143 objects:v149 count:16];
          uint64_t v73 = v131 + v76;
        }
        while (v72);
      }

      double v66 = v127;
    }
    else
    {
      double v71 = (void *)[(CRTextFeature *)self copy];
      [v140 addObject:v71];
    }
    double v48 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v140, v127);

    goto LABEL_64;
  }
  if ([v142 count] && objc_msgSend(v141, "count"))
  {
    int v133 = 1;
    int v139 = 1;
    goto LABEL_26;
  }
  long long v140 = (void *)[(CRTextFeature *)self copy];
  double v49 = [(CRTextFeature *)self stringValueCandidates];
  double v50 = [v49 objectAtIndexedSubscript:a3];
  v155[0] = v50;
  double v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:1];
  [v140 setStringValueCandidates:v51];

  double v52 = [(CRTextFeature *)self candidateProbs];
  double v53 = [v52 objectAtIndexedSubscript:a3];
  double v154 = v53;
  double v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
  [v140 setCandidateProbs:v54];

  double v153 = v140;
  uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
LABEL_25:
  double v48 = (void *)v55;
LABEL_64:

LABEL_65:
  return v48;
}

- (float)calculateTextBoxHeightForImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4
{
  [(CRTextFeature *)self topLeft];
  double v8 = v7;
  [(CRTextFeature *)self bottomLeft];
  float v10 = (v8 - v9) * (double)a3;
  [(CRTextFeature *)self topLeft];
  double v12 = v11;
  [(CRTextFeature *)self bottomLeft];
  float v14 = (v12 - v13) * (double)a4;
  [(CRTextFeature *)self topRight];
  double v16 = v15;
  [(CRTextFeature *)self bottomRight];
  float v18 = (v16 - v17) * (double)a3;
  [(CRTextFeature *)self topRight];
  double v20 = v19;
  [(CRTextFeature *)self bottomRight];
  float v22 = (v20 - v21) * (double)a4;
  float v23 = sqrtf((float)(v14 * v14) + (float)(v10 * v10));
  float result = sqrtf((float)(v22 * v22) + (float)(v18 * v18));
  if (v23 > result) {
    return v23;
  }
  return result;
}

- (void)setSelectedLocale:(id)a3 includeSubfeatures:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CRTextFeature *)self setSelectedLocale:v6];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v7 = [(CRTextFeature *)self subFeatures];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setSelectedLocale:v6 includeSubfeatures:1];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setSelectedScriptCategory:(id)a3 includeSubfeatures:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CRTextFeature *)self setSelectedScriptCategory:v6];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v7 = [(CRTextFeature *)self subFeatures];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setSelectedScriptCategory:v6 includeSubfeatures:1];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)appendTextFeature:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v137 = a3;
  double v7 = [(CRTextFeature *)self stringValue];
  unint64_t v8 = [v7 length];
  uint64_t v9 = [(CRTextFeature *)self stringValue];
  uint64_t v10 = [v9 length];
  long long v11 = [v137 stringValue];
  uint64_t v12 = [v11 length];

  long long v13 = NSNumber;
  long long v14 = [(CRTextFeature *)self confidence];
  [v14 floatValue];
  float v16 = v15;
  double v17 = [v137 confidence];
  [v17 floatValue];
  float v18 = (float)v8 / (float)(unint64_t)(v12 + v10);
  *(float *)&double v20 = (float)((float)(1.0 - v18) * v19) + (float)(v16 * v18);
  double v21 = [v13 numberWithFloat:v20];
  [(CRTextFeature *)self setConfidence:v21];

  float v22 = [(CRTextFeature *)self subFeatures];
  float v23 = [v137 subFeatures];
  double v24 = [v22 arrayByAddingObjectsFromArray:v23];
  [(CRTextFeature *)self setSubFeatures:v24];

  double v25 = [(CRTextFeature *)self stringValue];
  double v26 = [v137 stringValue];
  uint64_t v27 = [(CRTextFeature *)self selectedLocale];
  double v28 = [v25 _crStringByAppendingString:v26 locale:v27];
  [(CRTextFeature *)self setStringValue:v28];

  uint64_t v136 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; ; ++i)
  {
    double v30 = [(CRTextFeature *)self stringValueCandidates];
    unint64_t v31 = [v30 count];
    double v32 = [v137 stringValueCandidates];
    if (v31 >= [v32 count]) {
      [v137 stringValueCandidates];
    }
    else {
    double v33 = [(CRTextFeature *)self stringValueCandidates];
    }
    unint64_t v34 = [v33 count];

    if (v34 <= i) {
      break;
    }
    double v35 = [(CRTextFeature *)self stringValueCandidates];
    long long v36 = [v35 objectAtIndexedSubscript:i];
    double v37 = [v137 stringValueCandidates];
    double v38 = [v37 objectAtIndexedSubscript:i];
    long long v39 = [(CRTextFeature *)self selectedLocale];
    double v40 = [v36 _crStringByAppendingString:v38 locale:v39];

    [v136 addObject:v40];
  }
  double v41 = (void *)[v136 copy];
  [(CRTextFeature *)self setStringValueCandidates:v41];

  double v42 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t j = 0; ; ++j)
  {
    double v44 = [(CRTextFeature *)self candidateProbs];
    unint64_t v45 = [v44 count];
    BOOL v46 = [v137 candidateProbs];
    if (v45 >= [v46 count]) {
      [v137 candidateProbs];
    }
    else {
    double v47 = [(CRTextFeature *)self candidateProbs];
    }
    unint64_t v48 = [v47 count];

    if (v48 <= j) {
      break;
    }
    double v49 = NSNumber;
    double v50 = [(CRTextFeature *)self candidateProbs];
    double v51 = [v50 objectAtIndexedSubscript:j];
    [v51 floatValue];
    float v53 = v52;
    double v54 = [v137 candidateProbs];
    uint64_t v55 = [v54 objectAtIndexedSubscript:j];
    [v55 floatValue];
    *(float *)&double v57 = (float)((float)(1.0 - v18) * v56) + (float)(v53 * v18);
    double v58 = [v49 numberWithFloat:v57];

    [v42 addObject:v58];
  }
  double v59 = (void *)[v42 copy];
  [(CRTextFeature *)self setCandidateProbs:v59];

  double v60 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t k = 0; ; ++k)
  {
    double v62 = [(CRTextFeature *)self candidateActivationProbs];
    unint64_t v63 = [v62 count];
    double v64 = [v137 candidateActivationProbs];
    if (v63 >= [v64 count]) {
      [v137 candidateActivationProbs];
    }
    else {
    double v65 = [(CRTextFeature *)self candidateActivationProbs];
    }
    unint64_t v66 = [v65 count];

    if (v66 <= k) {
      break;
    }
    uint64_t v67 = NSNumber;
    uint64_t v68 = [(CRTextFeature *)self candidateActivationProbs];
    uint64_t v69 = [v68 objectAtIndexedSubscript:k];
    [v69 floatValue];
    float v71 = v70;
    uint64_t v72 = [v137 candidateActivationProbs];
    uint64_t v73 = [v72 objectAtIndexedSubscript:k];
    [v73 floatValue];
    *(float *)&double v75 = (float)(v71 + v74) * 0.5;
    uint64_t v76 = [v67 numberWithFloat:v75];

    [v60 addObject:v76];
  }
  uint64_t v77 = (void *)[v60 copy];
  [(CRTextFeature *)self setCandidateActivationProbs:v77];

  uint64_t v78 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t m = 0; ; ++m)
  {
    int v80 = [(CRTextFeature *)self subFeatureCandidates];
    unint64_t v81 = [v80 count];
    double v82 = [v137 subFeatureCandidates];
    if (v81 >= [v82 count]) {
      [v137 subFeatureCandidates];
    }
    else {
    double v83 = [(CRTextFeature *)self subFeatureCandidates];
    }
    unint64_t v84 = [v83 count];

    if (v84 <= m) {
      break;
    }
    double v85 = [(CRTextFeature *)self subFeatureCandidates];
    double v86 = [v85 objectAtIndexedSubscript:m];
    double v87 = [v137 subFeatureCandidates];
    double v88 = [v87 objectAtIndexedSubscript:m];
    double v89 = [v86 arrayByAddingObjectsFromArray:v88];

    [v78 addObject:v89];
  }
  double v90 = (void *)[v78 copy];
  [(CRTextFeature *)self setSubFeatureCandidates:v90];

  -[CRTextFeature sizeForImageSize:](self, "sizeForImageSize:", width, height);
  double v92 = v91;
  objc_msgSend(v137, "sizeForImageSize:", width, height);
  double v94 = v93;
  [(CRTextFeature *)self baselineAngle];
  float v96 = v95;
  [v137 baselineAngle];
  double v98 = v97;
  double v99 = v96 - v98;
  if (v99 <= 3.14159265)
  {
    if (v99 > -3.14159265) {
      goto LABEL_30;
    }
    double v100 = 6.28318531;
  }
  else
  {
    double v100 = -6.28318531;
  }
  double v99 = v99 + v100;
LABEL_30:
  double v101 = v92 / (v92 + v94) * v99 + v98;
  if (v101 <= 3.14159265)
  {
    if (v101 > -3.14159265) {
      goto LABEL_35;
    }
    double v102 = 6.28318531;
  }
  else
  {
    double v102 = -6.28318531;
  }
  double v101 = v101 + v102;
LABEL_35:
  *(float *)&double v101 = v101;
  [(CRTextFeature *)self setBaselineAngle:v101];
  double v103 = [CRNormalizedQuad alloc];
  [(CRTextFeature *)self topLeft];
  double v105 = v104;
  double v107 = v106;
  [(CRTextFeature *)self topRight];
  double v109 = v108;
  double v111 = v110;
  [(CRTextFeature *)self bottomRight];
  double v113 = v112;
  double v115 = v114;
  [(CRTextFeature *)self bottomLeft];
  double v118 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v103, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v105, v107, v109, v111, v113, v115, v116, v117, *(void *)&width, *(void *)&height);
  double v119 = [CRNormalizedQuad alloc];
  [v137 topLeft];
  double v121 = v120;
  double v123 = v122;
  [v137 topRight];
  double v125 = v124;
  double v127 = v126;
  [v137 bottomRight];
  double v129 = v128;
  double v131 = v130;
  [v137 bottomLeft];
  uint64_t v134 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v119, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v121, v123, v125, v127, v129, v131, v132, v133, *(void *)&width, *(void *)&height);
  [(CRTextFeature *)self baselineAngle];
  double v135 = -[CRNormalizedQuad unionWithNormalizedQuad:baselineAngle:](v118, "unionWithNormalizedQuad:baselineAngle:", v134);
  [v135 topLeft];
  -[CRTextFeature setTopLeft:](self, "setTopLeft:");
  [v135 topRight];
  -[CRTextFeature setTopRight:](self, "setTopRight:");
  [v135 bottomRight];
  -[CRTextFeature setBottomRight:](self, "setBottomRight:");
  [v135 bottomLeft];
  -[CRTextFeature setBottomLeft:](self, "setBottomLeft:");
  [v135 boundingBox];
  -[CRTextFeature setBounds:](self, "setBounds:");
}

- (NSLocale)locale
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  double v3 = [(CRTextFeature *)self selectedLocale];
  BOOL v4 = [v2 localeWithLocaleIdentifier:v3];

  return (NSLocale *)v4;
}

- (double)confidenceScore
{
  v2 = [(CRTextFeature *)self confidence];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)textRegionType
{
  unint64_t v2 = [(CRTextFeature *)self type];
  if (v2 - 2 >= 3) {
    return 2;
  }
  else {
    return 4 - v2;
  }
}

- (void)mergeWithLine:(id)a3
{
  id v4 = a3;
  [(CRTextFeature *)self originalImageSize];
  -[CRTextFeature appendTextFeature:imageSize:](self, "appendTextFeature:imageSize:", v4);
}

- (CRNormalizedQuad)boundingQuad
{
  double v3 = [CRNormalizedQuad alloc];
  [(CRTextFeature *)self topLeft];
  double v5 = v4;
  double v7 = v6;
  [(CRTextFeature *)self topRight];
  double v9 = v8;
  double v11 = v10;
  [(CRTextFeature *)self bottomRight];
  double v13 = v12;
  double v15 = v14;
  [(CRTextFeature *)self bottomLeft];
  double v17 = v16;
  double v19 = v18;
  [(CRTextFeature *)self originalImageSize];
  float v22 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v3, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v5, v7, v9, v11, v13, v15, v17, v19, v20, v21);
  return v22;
}

- (unint64_t)layoutDirection
{
  return 1;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (CGPoint)topLeft
{
  objc_copyStruct(v4, &self->_topLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_topLeft, &v3, 16, 1, 0);
}

- (CGPoint)topRight
{
  objc_copyStruct(v4, &self->_topRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_topRight, &v3, 16, 1, 0);
}

- (CGPoint)bottomLeft
{
  objc_copyStruct(v4, &self->_bottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_bottomLeft, &v3, 16, 1, 0);
}

- (CGPoint)bottomRight
{
  objc_copyStruct(v4, &self->_bottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_bottomRight, &v3, 16, 1, 0);
}

- (NSArray)subFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubFeatures:(id)a3
{
}

- (NSArray)stringValueCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStringValueCandidates:(id)a3
{
}

- (NSArray)candidateProbs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCandidateProbs:(id)a3
{
}

- (NSArray)candidateActivationProbs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCandidateActivationProbs:(id)a3
{
}

- (NSArray)subFeatureCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubFeatureCandidates:(id)a3
{
}

- (int64_t)bestCandidateIndex
{
  return self->_bestCandidateIndex;
}

- (void)setBestCandidateIndex:(int64_t)a3
{
  self->_bestCandidateIndedouble x = a3;
}

- (BOOL)shouldExpandToFullWidth
{
  return self->_shouldExpandToFullWidth;
}

- (void)setShouldExpandToFullWidth:(BOOL)a3
{
  self->_shouldExpandToFullWidth = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)gtStringValue
{
  return self->_gtStringValue;
}

- (void)setGtStringValue:(id)a3
{
}

- (CRImage)imageCut
{
  return (CRImage *)objc_getProperty(self, a2, 112, 1);
}

- (void)setImageCut:(id)a3
{
}

- (NSNumber)confidence
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConfidence:(id)a3
{
}

- (CGPoint)toplineOrigin
{
  objc_copyStruct(v4, &self->_toplineOrigin, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)baselineOrigin
{
  objc_copyStruct(v4, &self->_baselineOrigin, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (float)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(float)a3
{
  self->_float baselineAngle = a3;
}

- (unsigned)sizeHint
{
  return self->_sizeHint;
}

- (void)setSizeHint:(unsigned __int8)a3
{
  self->_sizeHint = a3;
}

- (float)textlineHeight
{
  return self->_textlineHeight;
}

- (void)setTextlineHeight:(float)a3
{
  self->_textlineHeight = a3;
}

- (int)featureMapID
{
  return self->_featureMapID;
}

- (void)setFeatureMapID:(int)a3
{
  self->_featureMapID = a3;
}

- (NSArray)scriptCategoryResults
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setScriptCategoryResults:(id)a3
{
}

- (CRScriptCategory)selectedScriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSelectedScriptCategory:(id)a3
{
}

- (NSDictionary)scriptCounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setScriptCounts:(id)a3
{
}

- (NSString)selectedLocale
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSelectedLocale:(id)a3
{
}

- (NSString)sequenceScriptOutputResult
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSequenceScriptOutputResult:(id)a3
{
}

- (BOOL)shouldRotate180
{
  return self->_shouldRotate180;
}

- (void)setShouldRotate180:(BOOL)a3
{
  self->_shouldRotate180 = a3;
}

- (BOOL)shouldRotate180DetectorOrientationFallBack
{
  return self->_shouldRotate180DetectorOrientationFallBack;
}

- (void)setShouldRotate180DetectorOrientationFallBack:(BOOL)a3
{
  self->_shouldRotate180DetectorOrientationFallBacunint64_t k = a3;
}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (BOOL)isVerticalLayout
{
  return self->_isVerticalLayout;
}

- (void)setIsVerticalLayout:(BOOL)a3
{
  self->_isVerticalLayout = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUuid:(id)a3
{
}

- (int)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(int)a3
{
  self->_featureID = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPolygon:(id)a3
{
}

- (BOOL)useSequenceScriptLocale
{
  return self->_useSequenceScriptLocale;
}

- (void)setUseSequenceScriptLocale:(BOOL)a3
{
  self->_useSequenceScriptLocale = a3;
}

- (BOOL)useSequenceOrientation
{
  return self->_useSequenceOrientation;
}

- (void)setUseSequenceOrientation:(BOOL)a3
{
  self->_useSequenceOrientation = a3;
}

- (BOOL)appliedOrientationCorrection
{
  return self->_appliedOrientationCorrection;
}

- (void)setAppliedOrientationCorrection:(BOOL)a3
{
  self->_appliedOrientationCorrection = a3;
}

- (BOOL)whitespaceInjected
{
  return self->_whitespaceInjected;
}

- (void)setWhitespaceInjected:(BOOL)a3
{
  self->_whitespaceInjected = a3;
}

- (unint64_t)lineWrappingType
{
  return self->_lineWrappingType;
}

- (void)setLineWrappingType:(unint64_t)a3
{
  self->_lineWrappingType = a3;
}

- (CGSize)originalImageSize
{
  objc_copyStruct(v4, &self->_originalImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_originalImageSize, &v3, 16, 1, 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sequenceScriptOutputResult, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_scriptCounts, 0);
  objc_storeStrong((id *)&self->_selectedScriptCategory, 0);
  objc_storeStrong((id *)&self->_scriptCategoryResults, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_imageCut, 0);
  objc_storeStrong((id *)&self->_gtStringValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_subFeatureCandidates, 0);
  objc_storeStrong((id *)&self->_candidateActivationProbs, 0);
  objc_storeStrong((id *)&self->_candidateProbs, 0);
  objc_storeStrong((id *)&self->_stringValueCandidates, 0);
  objc_storeStrong((id *)&self->_subFeatures, 0);
}

@end