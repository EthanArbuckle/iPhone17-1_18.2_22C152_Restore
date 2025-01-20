@interface CROutputRegion
+ (BOOL)supportsSecureCoding;
+ (id)decodableSubclasses;
+ (id)outputRegionFromTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5;
+ (id)outputRegionWithCRCodableDataRepresentation:(id)a3;
- (BOOL)computesNumberOfLinesFromChildren;
- (BOOL)contributesToDocumentHierarchy;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAlwaysAddDelimiter;
- (BOOL)shouldComputeBoundsFromChildren;
- (BOOL)shouldComputeParagraphsFromChildren;
- (BOOL)shouldComputeTranscriptFromChildren;
- (BOOL)significantTranscriptChange;
- (CGSize)rectifiedSize;
- (CRNormalizedPolyline)polygon;
- (CRNormalizedQuad)boundingQuad;
- (CRNormalizedQuad)boundingQuadAfterOCR;
- (CRNormalizedQuad)boundingQuadAtOCRDispatch;
- (CRNormalizedQuad)originalBoundingQuad;
- (CROutputRegion)init;
- (CROutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CROutputRegion)initWithCoder:(id)a3;
- (CROutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4;
- (CROutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (CROutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3;
- (CROutputRegion)outputRegionWithContentsOfQuad:(id)a3;
- (CRRegionGeometryInfo)geometryInfo;
- (CRVCQuad)vcImageSpaceQuad;
- (NSArray)candidates;
- (NSArray)children;
- (NSArray)contentBaselines;
- (NSArray)dataDetectorGroupRegions;
- (NSArray)dataDetectorRegions;
- (NSArray)formFieldRegions;
- (NSArray)listRegions;
- (NSArray)paragraphRegions;
- (NSArray)regionsSuitableForDataDetectorOutput;
- (NSArray)tableRegions;
- (NSArray)transcriptComponents;
- (NSNumber)homographyGroupID;
- (NSString)recognizedLocale;
- (NSString)text;
- (NSUUID)trackingID;
- (NSUUID)uuid;
- (_NSRange)rangeOfContentRegion:(id)a3;
- (__n128)boundingQuadHomography;
- (__n128)setBoundingQuadHomography:(__n128)a3;
- (double)activationProbability;
- (double)baselineAngle;
- (double)boundingQuadHomographySinceOCRDispatch;
- (float)rawConfidence;
- (float)visualTextAngle;
- (id)closestContentRegionOfType:(unint64_t)a3 toNormalizedPoint:(CGPoint)a4 maxPixelDistance:(int64_t)a5;
- (id)contentRegionOfType:(unint64_t)a3 containingTextAtIndex:(int64_t)a4;
- (id)contentsWithTypes:(unint64_t)a3;
- (id)copyIncludingChildrenOfTypes:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)decodeOutputsArrayFromData:(uint64_t)a1 offset:(uint64_t)a2;
- (id)joiningDelimiter;
- (id)outputRegionByApplyingWarpTransform:(double)a3 downscaleRate:(double)a4 shouldApply:(float)a5;
- (id)outputRegionWithContentsEndingAtPoint:(double)a3;
- (id)outputRegionWithContentsStartingAtPoint:(double)a3;
- (id)quadForTextInCharacterRange:(_NSRange)a3;
- (id)scriptCategoryResults;
- (id)sequenceScriptOutputResult;
- (int)confidence;
- (int64_t)numberOfLines;
- (int64_t)wordCount;
- (int64_t)wordCountInCharacterRange:(_NSRange)a3;
- (uint64_t)_indexOfNearestRegionToPoint:(char)a3 regions:(void *)a4 returnFirstMatch:(double)a5 distance:(double)a6;
- (unint64_t)layoutDirection;
- (unint64_t)nmsOutputScale;
- (unint64_t)textAlignment;
- (unint64_t)textType;
- (unint64_t)type;
- (void)_computeDataDetectorRegions;
- (void)_computeGeometryInfo;
- (void)_computeNumberOfLines;
- (void)_computeTranscript;
- (void)_copyChildrenInRange:(uint64_t)a3;
- (void)_enumerateRegions:(uint64_t)a3 withTypes:(uint64_t)a4 recursively:(void *)a5 passingTest:(void *)a6 usingBlock:;
- (void)_indexOfNearestChildToPoint:(double)a3 returnFirstMatch:(double)a4;
- (void)_invalidateTranscript;
- (void)_invalidateTranscriptRecursivelyThrough:(Class)a3;
- (void)_overrideSetBoundingQuad:(id)a3;
- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateContentsWithTypes:(unint64_t)a3 usingBlock:(id)a4;
- (void)scaleBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4;
- (void)setActivationProbability:(double)a3;
- (void)setBaselineAngle:(double)a3;
- (void)setBoundingQuad:(id)a3;
- (void)setBoundingQuadAfterOCR:(id)a3;
- (void)setBoundingQuadAtOCRDispatch:(id)a3;
- (void)setBoundingQuadHomographySinceOCRDispatch:(__n128)a3;
- (void)setCandidates:(id)a3;
- (void)setChildren:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setDataDetectorGroupRegions:(id)a3;
- (void)setDataDetectorRegions:(id)a3;
- (void)setFormFieldRegions:(id)a3;
- (void)setGeometryInfo:(id)a3;
- (void)setHomographyGroupID:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setListRegions:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOriginalBoundingQuad:(id)a3;
- (void)setParagraphRegions:(id)a3;
- (void)setPolygon:(id)a3;
- (void)setRawConfidence:(float)a3;
- (void)setRecognizedLocale:(id)a3;
- (void)setShouldComputeBoundsFromChildren:(BOOL)a3;
- (void)setShouldComputeParagraphsFromChildren:(BOOL)a3;
- (void)setShouldComputeTranscriptFromChildren:(BOOL)a3;
- (void)setSignificantTranscriptChange:(BOOL)a3;
- (void)setTableRegions:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(unint64_t)a3;
- (void)setTrackingID:(id)a3;
- (void)setTranscriptComponents:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVisualTextAngle:(float)a3;
- (void)updateBoundingQuadAfterOCR;
- (void)updatePreviousAssociationQuad;
@end

@implementation CROutputRegion

- (CROutputRegion)init
{
  v3.receiver = self;
  v3.super_class = (Class)CROutputRegion;
  result = [(CROutputRegion *)&v3 init];
  if (result)
  {
    result->_shouldComputeParagraphsFromChildren = 1;
    *(_WORD *)&result->_shouldComputeBoundsFromChildren = 257;
    result->_numberOfLines = 0;
    result->_textAlignment = 0;
    result->_layoutDirection = 0;
    result->_activationProbability = 1.0;
  }
  return result;
}

- (CRVCQuad)vcImageSpaceQuad
{
  if (!self->_trackingID)
  {
    objc_super v3 = CROSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DD733000, v3, OS_LOG_TYPE_ERROR, "Unexpectedly encountered regions without trackIDs.", v14, 2u);
    }

    v4 = [MEMORY[0x1E4F29128] UUID];
    trackingID = self->_trackingID;
    self->_trackingID = v4;
  }
  vcImageSpaceQuad = self->_vcImageSpaceQuad;
  if (vcImageSpaceQuad)
  {
    v7 = [(CROutputRegion *)self boundingQuad];
    v8 = [v7 denormalizedQuad];
    [(CRVCQuad *)vcImageSpaceQuad updateWithQuad:v8];
  }
  else
  {
    v9 = [CRVCQuad alloc];
    v7 = [(CROutputRegion *)self boundingQuad];
    v8 = [v7 denormalizedQuad];
    v10 = [(CRVCQuad *)v9 initWithImageSpaceQuad:v8 uuid:self->_trackingID];
    v11 = self->_vcImageSpaceQuad;
    self->_vcImageSpaceQuad = v10;
  }
  v12 = self->_vcImageSpaceQuad;
  return v12;
}

- (CROutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4
{
  result = [(CROutputRegion *)self init];
  if (result)
  {
    result->_confidence = a3;
    result->_baselineAngle = a4;
  }
  return result;
}

+ (id)outputRegionFromTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v41 = v8;
  v42 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v10 = [v8 subregions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v17 = [a1 outputRegionFromTextRegion:v16 confidenceThresholdProvider:v9 injectSpaceCharacter:v5];
        [v42 addObject:v17];

        v13 |= [v16 textRegionType] == 1;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  v18 = v41;
  v19 = [v41 locale];
  v20 = [v9 thresholdsForTextRegion:v41 withLocale:v19];

  [v41 confidence];
  uint64_t v21 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v20);
  uint64_t v22 = [v41 textRegionType];
  if (!v22)
  {
    v24 = [v41 text];
    v25 = [v41 boundingQuad];
    v26 = [v41 boundingQuad];
    [v26 baselineAngle];
    v23 = +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v24, v21, v25);

    goto LABEL_20;
  }
  if (v22 == 1)
  {
    if ([v42 count])
    {
      if ((v13 & 1) == 0)
      {
        v23 = 0;
        goto LABEL_21;
      }
      v24 = [v41 boundingQuad];
      v25 = [v41 boundingQuad];
      [v25 baselineAngle];
      v23 = +[CRWordOutputRegion wordWithCharacters:confidence:quad:baselineAngle:](CRWordOutputRegion, "wordWithCharacters:confidence:quad:baselineAngle:", v42, v21, v24);
    }
    else
    {
      v24 = [v41 text];
      v25 = [v41 boundingQuad];
      v27 = [v41 boundingQuad];
      [v27 baselineAngle];
      v23 = +[CRWordOutputRegion wordWithText:confidence:quad:baselineAngle:](CRWordOutputRegion, "wordWithText:confidence:quad:baselineAngle:", v24, v21, v25);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v22 != 2)
  {
    v23 = 0;
    goto LABEL_30;
  }
  v23 = +[CRLineOutputRegion lineWithTextRegion:v41 confidenceThresholdProvider:v9 injectSpaceCharacter:v5];
LABEL_21:
  v28 = [v41 locale];
  [v23 setRecognizedLocale:v28];

  [v41 confidence];
  *(float *)&double v29 = v29;
  [v23 setRawConfidence:v29];
  [v41 activationProbability];
  objc_msgSend(v23, "setActivationProbability:");
  v30 = [v41 polygon];
  [v23 setPolygon:v30];

  objc_msgSend(v23, "setLayoutDirection:", objc_msgSend(v41, "layoutDirection"));
  v31 = [v41 candidates];

  if (v31)
  {
    v40 = v20;
    v32 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v33 = [v41 candidates];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [a1 outputRegionFromTextRegion:*(void *)(*((void *)&v43 + 1) + 8 * j) confidenceThresholdProvider:v9 injectSpaceCharacter:v5];
          [v32 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v35);
    }

    [v23 setCandidates:v32];
    v20 = v40;
    v18 = v41;
  }
LABEL_30:

  return v23;
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    BOOL v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 1;
}

- (id)joiningDelimiter
{
  return @"\n";
}

- (BOOL)shouldAlwaysAddDelimiter
{
  return 0;
}

- (void)setChildren:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_children, a3);
  dataDetectorRegions = self->_dataDetectorRegions;
  self->_dataDetectorRegions = 0;

  listRegions = self->_listRegions;
  self->_listRegions = 0;

  tableRegions = self->_tableRegions;
  self->_tableRegions = 0;

  if ([(CROutputRegion *)self shouldComputeParagraphsFromChildren])
  {
    paragraphRegions = self->_paragraphRegions;
    self->_paragraphRegions = 0;
  }
  if ([(CROutputRegion *)self computesBoundsFromChildren])
  {
    boundingQuad = self->_boundingQuad;
    self->_boundingQuad = 0;

    geometryInfo = self->_geometryInfo;
    self->_geometryInfo = 0;
  }
  if ([(CROutputRegion *)self computesTranscriptFromChildren]) {
    [(CROutputRegion *)self _invalidateTranscript];
  }
  if ([(CROutputRegion *)self computesNumberOfLinesFromChildren]) {
    [(CROutputRegion *)self _computeNumberOfLines];
  }
}

- (CGSize)rectifiedSize
{
  objc_super v3 = [(CROutputRegion *)self polygon];

  if (v3)
  {
    v4 = [(CROutputRegion *)self polygon];
    BOOL v5 = [v4 denormalizedPolyline];
    [v5 estimatedLineSizeForPairedPointPolygon];
  }
  else
  {
    v4 = [(CROutputRegion *)self boundingQuad];
    BOOL v5 = [v4 denormalizedQuad];
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

- (void)_invalidateTranscript
{
  text = self->_text;
  self->_text = 0;

  transcriptComponents = self->_transcriptComponents;
  self->_transcriptComponents = 0;
}

- (void)_invalidateTranscriptRecursivelyThrough:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CROutputRegion *)self computesTranscriptFromChildren])
  {
    [(CROutputRegion *)self _invalidateTranscript];
    if ((Class)objc_opt_class() != a3)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      BOOL v5 = [(CROutputRegion *)self children];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _invalidateTranscriptRecursivelyThrough:a3];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (id)copyIncludingChildrenOfTypes:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v5 = [(CROutputRegion *)self copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
    if ((a3 & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = 0;
  if ((a3 & 8) == 0) {
LABEL_3:
  }
    [v5 setShouldComputeParagraphsFromChildren:0];
LABEL_4:
  uint64_t v6 = [(CROutputRegion *)self children];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [(CROutputRegion *)self children];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (([v13 type] & a3) != 0)
          {
            uint64_t v14 = (void *)[v13 copyIncludingChildrenOfTypes:a3];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v10);
    }

    [v5 setChildren:v7];
  }
  uint64_t v15 = [(CROutputRegion *)self children];
  unint64_t v16 = [v15 count];
  v17 = [v5 children];
  unint64_t v18 = [v17 count];

  if (v16 > v18)
  {
    [v5 setShouldComputeBoundsFromChildren:0];
    [v5 setShouldComputeTranscriptFromChildren:0];
    v19 = [(CROutputRegion *)self boundingQuad];
    [v5 setBoundingQuad:v19];

    v20 = [(CROutputRegion *)self text];
    [v5 setText:v20];
LABEL_21:

    goto LABEL_22;
  }
  if (![(CROutputRegion *)self shouldComputeTranscriptFromChildren])
  {
    uint64_t v21 = [(CROutputRegion *)self text];
    [v5 setText:v21];

    [v5 setShouldComputeTranscriptFromChildren:0];
  }
  if (![(CROutputRegion *)self shouldComputeBoundsFromChildren])
  {
    [v5 setShouldComputeBoundsFromChildren:0];
    v20 = [(CROutputRegion *)self boundingQuad];
    [v5 setBoundingQuad:v20];
    goto LABEL_21;
  }
LABEL_22:
  if ((a3 & 4) != 0 && [(CROutputRegion *)self type] != 4)
  {
    uint64_t v22 = [(CROutputRegion *)self contentsWithTypes:4];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          double v29 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v30 = objc_msgSend(v29, "copyIncludingChildrenOfTypes:", a3, (void)v35);
          v31 = [v29 geometryInfo];
          [v30 setGeometryInfo:v31];

          [v23 addObject:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v26);
    }

    v32 = [(CROutputRegion *)self paragraphRegions];
    if (v32)
    {
      v33 = (void *)[v23 copy];
      [v5 setParagraphRegions:v33];
    }
    else
    {
      [v5 setParagraphRegions:0];
    }
  }
  return v5;
}

- (NSString)text
{
  text = self->_text;
  if (!text)
  {
    -[CROutputRegion _computeTranscript](self);
    text = self->_text;
  }
  return text;
}

- (void)_computeTranscript
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    if ([a1 computesTranscriptFromChildren])
    {
      v2 = [v1 children];

      if (v2)
      {
        objc_super v3 = objc_opt_new();
        uint64_t v22 = objc_opt_new();
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        obuint64_t j = [v1 children];
        uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (!v24) {
          goto LABEL_21;
        }
        uint64_t v23 = *(void *)v26;
        while (1)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v26 != v23) {
              objc_enumerationMutation(obj);
            }
            id v5 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v6 = [v5 text];
            if (v6)
            {
              uint64_t v7 = [v3 length];
              uint64_t v8 = [v5 joiningDelimiter];
              uint64_t v9 = v1;
              uint64_t v10 = [v1 children];
              uint64_t v11 = [v10 lastObject];
              if (v5 != v11)
              {

                long long v12 = v8;
                goto LABEL_13;
              }
              char v13 = [v5 shouldAlwaysAddDelimiter];

              uint64_t v10 = v8;
              long long v12 = &stru_1F38EED68;
              if ((v13 & 1) == 0)
              {
LABEL_13:

                uint64_t v8 = v12;
              }
              if ([(__CFString *)v8 isEqualToString:@"\b"]
                && [v6 _crEndsWithHyphen])
              {
                uint64_t v14 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
                [v3 appendString:v14];
              }
              else
              {
                [v3 appendString:v6];
                [v3 appendString:v8];
              }
              uint64_t v15 = [v6 length];
              id v16 = v5;
              self;
              v17 = -[CROutputRegionTranscriptComponent initWithOutputRegion:range:]([CROutputRegionTranscriptComponent alloc], "initWithOutputRegion:range:", v16, v7, v15);

              [v22 addObject:v17];
              v1 = v9;
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (!v24)
          {
LABEL_21:

            uint64_t v18 = [NSString stringWithString:v3];
            v19 = (void *)v1[6];
            v1[6] = v18;

            v20 = (void *)v1[19];
            v1[19] = v22;

            return;
          }
        }
      }
      [v1 _invalidateTranscript];
    }
  }
}

- (NSArray)transcriptComponents
{
  transcriptComponents = self->_transcriptComponents;
  if (!transcriptComponents)
  {
    -[CROutputRegion _computeTranscript](self);
    transcriptComponents = self->_transcriptComponents;
  }
  return transcriptComponents;
}

- (NSArray)regionsSuitableForDataDetectorOutput
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (CRNormalizedQuad)boundingQuad
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  boundingQuad = self->_boundingQuad;
  if (!boundingQuad)
  {
    if (![(CROutputRegion *)self computesBoundsFromChildren])
    {
      uint64_t v14 = 0;
      goto LABEL_18;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = [(CROutputRegion *)self children];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) boundingQuad];
          uint64_t v11 = v10;
          if (v7)
          {
            [(CROutputRegion *)self baselineAngle];
            *(float *)&double v12 = v12;
            uint64_t v13 = [(CRNormalizedQuad *)v7 unionWithNormalizedQuad:v11 baselineAngle:v12];

            uint64_t v7 = (CRNormalizedQuad *)v13;
          }
          else
          {
            uint64_t v7 = v10;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v15 = self->_boundingQuad;
    self->_boundingQuad = v7;

    boundingQuad = self->_boundingQuad;
  }
  uint64_t v14 = boundingQuad;
LABEL_18:
  return v14;
}

- (NSArray)contentBaselines
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CROutputRegion *)self children];
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
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) contentBaselines];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v10;
}

- (int64_t)wordCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(CROutputRegion *)self contentsWithTypes:8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) wordCount];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (float)visualTextAngle
{
  float result = self->_visualTextAngle;
  if (result == 0.0)
  {
    double baselineAngle = self->_baselineAngle;
    if (self->_layoutDirection == 5)
    {
      double baselineAngle = baselineAngle + 1.57079633;
      if (baselineAngle > 3.14159265)
      {
        double v4 = -6.28318531;
LABEL_7:
        double baselineAngle = baselineAngle + v4;
        goto LABEL_8;
      }
      if (baselineAngle <= -3.14159265)
      {
        double v4 = 6.28318531;
        goto LABEL_7;
      }
    }
LABEL_8:
    float result = baselineAngle;
    self->_visualTextAngle = result;
  }
  return result;
}

- (void)_computeDataDetectorRegions
{
  if (a1)
  {
    id v12 = [a1 recognizedLocale];
    id v2 = a1;
    uint64_t v3 = 4;
    double v4 = v2;
    while (!v12)
    {
      int64_t v5 = [v4 children];
      uint64_t v6 = [v5 firstObject];

      if (!v6)
      {
        id v12 = 0;
        break;
      }
      uint64_t v7 = [v4 children];
      uint64_t v8 = [v7 firstObject];

      id v12 = [v8 recognizedLocale];
      if (--v3)
      {
        double v4 = v8;
        if ([v8 type] != 8) {
          continue;
        }
      }
      goto LABEL_10;
    }
    uint64_t v8 = v4;
LABEL_10:
    long long v9 = [v2 text];
    long long v10 = [v2 transcriptComponents];
    long long v11 = +[CRDataDetectorUtilities computeDataDetectorRegionsForText:v9 locale:v12 transcriptComponents:v10 ddQOS:2];
    [v2 setDataDetectorRegions:v11];
  }
}

- (id)contentsWithTypes:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__CROutputRegion_contentsWithTypes___block_invoke;
  v11[3] = &unk_1E6CDBF70;
  id v6 = v5;
  id v12 = v6;
  [(CROutputRegion *)self enumerateContentsWithTypes:a3 usingBlock:v11];
  if ((a3 & 0x2000) != 0 && [(CROutputRegion *)self type] == 1)
  {
    uint64_t v7 = CROSLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 count];
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[CROutputRegion contentsWithTypes:]";
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEFAULT, "%s: Returning %lu form fields.", buf, 0x16u);
    }
  }
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v9;
}

uint64_t __36__CROutputRegion_contentsWithTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateContentsWithTypes:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFC7FFLL) != 0)
  {
    uint64_t v7 = [(CROutputRegion *)self children];
    if (self) {
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v7, a3 & 0xFFFFFFFFFFFFC7FFLL, 1, 0, v6);
    }
  }
  if ((a3 & 0x800) != 0)
  {
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v8 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    long long v10 = (id)CRSignpostLog_signPostOSLog;
    long long v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OCRDataDetectorTime", "", buf, 2u);
    }

    id v12 = [(CROutputRegion *)self dataDetectorRegions];

    if (!v12) {
      -[CROutputRegion _computeDataDetectorRegions](self);
    }
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    long long v13 = (id)CRSignpostLog_signPostOSLog;
    uint64_t v14 = v13;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v14, OS_SIGNPOST_INTERVAL_END, v9, "OCRDataDetectorTime", "", buf, 2u);
    }

    __int16 v15 = CROSLogForCategory(7);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v16)
    {
      unint64_t v64 = a3;
      uint64_t v17 = CROSLogForCategory(7);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
        _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_DEBUG, "%s: Data requested", buf, 0xCu);
      }

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v62 = self;
      long long v18 = [(CROutputRegion *)self dataDetectorRegions];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v73 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v24 = CROSLogForCategory(7);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              long long v25 = [v23 debugDescription];
              *(_DWORD *)buf = 136315395;
              v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
              __int16 v78 = 2117;
              v79 = v25;
              _os_log_impl(&dword_1DD733000, v24, OS_LOG_TYPE_DEBUG, "%s: - Result %{sensitive}@", buf, 0x16u);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v83 count:16];
        }
        while (v20);
      }

      a3 = v64;
      self = v62;
    }
    long long v26 = [(CROutputRegion *)self dataDetectorRegions];
    if (self) {
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v26, a3, 0, 0, v6);
    }

    if ((a3 & 0x1000) == 0)
    {
LABEL_7:
      if ((a3 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_73;
    }
  }
  else if ((a3 & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  long long v27 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v28 = os_signpost_id_generate(v27);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  double v29 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v30 = v29;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "OCRDataDetectorTime", "", buf, 2u);
  }

  v31 = [(CROutputRegion *)self dataDetectorRegions];

  if (!v31) {
    -[CROutputRegion _computeDataDetectorRegions](self);
  }
  v32 = [(CROutputRegion *)self dataDetectorGroupRegions];

  if (!v32)
  {
    v33 = [(CROutputRegion *)self dataDetectorRegions];
    uint64_t v34 = +[CRDataDetectorUtilities computeGroupRegionsWithDataDetectorRegions:v33 inRegion:self];
    [(CROutputRegion *)self setDataDetectorGroupRegions:v34];
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  long long v35 = (id)CRSignpostLog_signPostOSLog;
  long long v36 = v35;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v36, OS_SIGNPOST_INTERVAL_END, v28, "OCRDataDetectorTime", "", buf, 2u);
  }

  long long v37 = CROSLogForCategory(7);
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);

  if (v38)
  {
    id v65 = v6;
    long long v39 = CROSLogForCategory(7);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
      _os_log_impl(&dword_1DD733000, v39, OS_LOG_TYPE_DEBUG, "%s: DataGroup requested", buf, 0xCu);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v63 = self;
    long long v40 = [(CROutputRegion *)self dataDetectorGroupRegions];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v69 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          long long v46 = CROSLogForCategory(7);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            long long v47 = [v45 debugDescription];
            uint64_t v48 = [v45 groupType];
            *(_DWORD *)buf = 136315651;
            v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
            __int16 v78 = 2117;
            v79 = v47;
            __int16 v80 = 2048;
            uint64_t v81 = v48;
            _os_log_impl(&dword_1DD733000, v46, OS_LOG_TYPE_DEBUG, "%s: - Result '%{sensitive}@' (type:%lu)", buf, 0x20u);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v68 objects:v82 count:16];
      }
      while (v42);
    }

    id v6 = v65;
    self = v63;
  }
  long long v49 = [(CROutputRegion *)self dataDetectorGroupRegions];
  if (self) {
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v49, a3, 0, 0, v6);
  }

  if ((a3 & 4) == 0)
  {
LABEL_8:
    if ((a3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_82;
  }
LABEL_73:
  long long v50 = [(CROutputRegion *)self paragraphRegions];
  if (!v50)
  {
    if ([(CROutputRegion *)self type] == 4)
    {
      long long v50 = 0;
    }
    else
    {
      if (![(CROutputRegion *)self shouldComputeParagraphsFromChildren]) {
        goto LABEL_79;
      }
      long long v50 = [(CROutputRegion *)self contentsWithTypes:8];
      v51 = +[CRParagraphOutputRegion paragraphsWithLines:v50];
      [(CROutputRegion *)self setParagraphRegions:v51];
    }
  }

LABEL_79:
  v52 = [(CROutputRegion *)self paragraphRegions];
  if (self) {
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v52, a3, 0, 0, v6);
  }

  if ((a3 & 0x100) == 0)
  {
LABEL_9:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_87;
  }
LABEL_82:
  uint64_t v53 = [(CROutputRegion *)self listRegions];

  if (!v53)
  {
    v54 = [(CROutputRegion *)self contentsWithTypes:4];
    v55 = +[CRListOutputRegion listsWithParagraphs:v54];
    [(CROutputRegion *)self setListRegions:v55];
  }
  v56 = [(CROutputRegion *)self listRegions];
  if (self) {
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v56, a3, 0, 0, v6);
  }

  if ((a3 & 0x2000) != 0)
  {
LABEL_87:
    if ([(CROutputRegion *)self type] == 1)
    {
      v57 = CROSLogForCategory(6);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
        _os_log_impl(&dword_1DD733000, v57, OS_LOG_TYPE_DEBUG, "%s: FormField requested", buf, 0xCu);
      }
    }
    v58 = [(CROutputRegion *)self formFieldRegions];

    if (v58)
    {
      formFieldRegions = self->_formFieldRegions;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __56__CROutputRegion_enumerateContentsWithTypes_usingBlock___block_invoke;
      v66[3] = &unk_1E6CDBF98;
      id v67 = v6;
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, formFieldRegions, a3, 0, 0, v66);
    }
  }
LABEL_93:
  if ((a3 & 0x40) != 0)
  {
    v60 = [(CROutputRegion *)self tableRegions];

    if (v60)
    {
      v61 = [(CROutputRegion *)self tableRegions];
      if (self) {
        -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v61, a3, 0, 0, v6);
      }
    }
  }
}

void __56__CROutputRegion_enumerateContentsWithTypes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 fieldSource] == 1) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (CROutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(CROutputRegion *)self boundingQuad];
  int v6 = [v5 overlapsNormalizedQuad:v4];

  if (v6)
  {
    if (self) {
      id v7 = [(CROutputRegion *)self copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = [(CROutputRegion *)self children];
    if (v8) {
      os_signpost_id_t v9 = objc_opt_new();
    }
    else {
      os_signpost_id_t v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v11 = [(CROutputRegion *)self children];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) outputRegionWithContentsOfQuad:v4];
          if (v16) {
            [v9 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    if ([v9 count]
      || ([(CROutputRegion *)self children],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = [v17 count],
          v17,
          !v18))
    {
      [v7 setChildren:v9];
      id v10 = v7;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return (CROutputRegion *)v10;
}

- (void)updatePreviousAssociationQuad
{
  id v3 = [(CROutputRegion *)self boundingQuad];
  boundingQuadAtOCRDispatch = self->_boundingQuadAtOCRDispatch;
  self->_boundingQuadAtOCRDispatch = v3;

  uint64_t v5 = MEMORY[0x1E4F14998];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E4F14998];
  *(_OWORD *)&self[1]._visualTextAngle = v6;
  *(_OWORD *)&self[1]._uuid = *(_OWORD *)(v5 + 32);
}

- (void)updateBoundingQuadAfterOCR
{
  id v3 = [(CROutputRegion *)self boundingQuad];
  boundingQuadAfterOCR = self->_boundingQuadAfterOCR;
  self->_boundingQuadAfterOCR = v3;
}

- (id)outputRegionByApplyingWarpTransform:(double)a3 downscaleRate:(double)a4 shouldApply:(float)a5
{
  id v9 = a7;
  id v10 = (void *)[a1 copy];
  *(float *)&double v11 = a5;
  objc_msgSend(v10, "applyHomographyTransform:downscaleRate:shouldApply:", v9, a2, a3, a4, v11);

  return v10;
}

- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a7;
  id v10 = [(id)a1 boundingQuad];
  double v11 = [v10 denormalizedQuad];
  *(float *)&double v12 = a5;
  uint64_t v13 = objc_msgSend(v11, "applyHomographyTransform:downscaleRate:", *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, v12);

  [v10 normalizationSize];
  if (v9[2](v9, v13))
  {
    [v13 baselineAngle];
    objc_msgSend((id)a1, "setBaselineAngle:");
    uint64_t v14 = [(id)a1 originalBoundingQuad];

    if (v14)
    {
      if (a4.f32[2] != 0.0)
      {
        uint64_t v15 = 0;
        BOOL v16 = (void *)(a1 + 256);
        long long v17 = *(_OWORD *)(a1 + 304);
        long long v18 = *(_OWORD *)(a1 + 320);
        long long v52 = *(_OWORD *)(a1 + 288);
        long long v53 = v17;
        long long v54 = v18;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        do
        {
          *(long long *)((char *)&v55 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v52 + v15))), a3, *(float32x2_t *)((char *)&v52 + v15), 1), a4, *(float32x4_t *)((char *)&v52 + v15), 2);
          v15 += 16;
        }
        while (v15 != 48);
        uint64_t v19 = 0;
        uint64_t v20 = v55;
        long long v21 = v56;
        long long v22 = v57;
        *(_DWORD *)(a1 + 296) = DWORD2(v55);
        *(_DWORD *)(a1 + 312) = DWORD2(v21);
        *(void *)(a1 + 288) = v20;
        *(float *)&uint64_t v20 = 1.0 / *((float *)&v22 + 2);
        long long v23 = *(_OWORD *)(a1 + 272);
        float32x4_t v24 = vmulq_n_f32(*(float32x4_t *)(a1 + 288), 1.0 / *((float *)&v22 + 2));
        *(_DWORD *)(a1 + 296) = v24.i32[2];
        *(_DWORD *)(a1 + 328) = DWORD2(v22);
        *(void *)(a1 + 304) = v21;
        *(void *)(a1 + 320) = v22;
        *(void *)(a1 + 288) = v24.i64[0];
        float32x4_t v25 = *(float32x4_t *)(a1 + 320);
        float32x4_t v26 = vmulq_n_f32(*(float32x4_t *)(a1 + 304), *(float *)&v20);
        *(_DWORD *)(a1 + 312) = v26.i32[2];
        *(void *)(a1 + 304) = v26.i64[0];
        float32x4_t v27 = vmulq_n_f32(v25, *(float *)&v20);
        *(_DWORD *)(a1 + 328) = v27.i32[2];
        *(void *)(a1 + 320) = v27.i64[0];
        long long v28 = *(_OWORD *)(a1 + 256);
        long long v52 = *(_OWORD *)(a1 + 240);
        long long v53 = v28;
        long long v54 = v23;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        do
        {
          *(long long *)((char *)&v55 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v52 + v19))), a3, *(float32x2_t *)((char *)&v52 + v19), 1), a4, *(float32x4_t *)((char *)&v52 + v19), 2);
          v19 += 16;
        }
        while (v19 != 48);
        uint64_t v29 = v55;
        long long v30 = v56;
        long long v31 = v57;
        *(_DWORD *)(a1 + 248) = DWORD2(v55);
        *(_DWORD *)(a1 + 264) = DWORD2(v30);
        *(void *)(a1 + 240) = v29;
        void *v16 = v30;
        *(_DWORD *)(a1 + 280) = DWORD2(v31);
        *(void *)(a1 + 272) = v31;
        *(float *)&uint64_t v29 = 1.0 / *((float *)&v31 + 2);
        float32x4_t v32 = *(float32x4_t *)(a1 + 272);
        float32x4_t v33 = vmulq_n_f32(*(float32x4_t *)(a1 + 240), 1.0 / *((float *)&v31 + 2));
        float32x4_t v34 = vmulq_n_f32(*(float32x4_t *)(a1 + 256), 1.0 / *((float *)&v31 + 2));
        *(_DWORD *)(a1 + 248) = v33.i32[2];
        *(_DWORD *)(a1 + 264) = v34.i32[2];
        *(void *)(a1 + 240) = v33.i64[0];
        void *v16 = v34.i64[0];
        float32x4_t v35 = vmulq_n_f32(v32, *(float *)&v29);
        *(_DWORD *)(a1 + 280) = v35.i32[2];
        *(void *)(a1 + 272) = v35.i64[0];
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 136), v10);
      *(float32x4_t *)(a1 + 240) = a2;
      *(float32x4_t *)(a1 + 256) = a3;
      *(float32x4_t *)(a1 + 272) = a4;
    }
    objc_msgSend(v10, "normalizationSize", *(_OWORD *)&a2, *(_OWORD *)&a3);
    long long v36 = objc_msgSend(v13, "normalizedQuadForImageSize:");
    [(id)a1 setBoundingQuad:v36];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v37 = [(id)a1 children];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v38)
    {
      uint64_t v40 = v38;
      uint64_t v41 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v49 != v41) {
            objc_enumerationMutation(v37);
          }
          *(float *)&double v39 = a5;
          objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "applyHomographyTransform:downscaleRate:shouldApply:", v9, v44, v46, *(double *)a4.i64, v39);
        }
        uint64_t v40 = [v37 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v40);
    }
  }
}

- (CROutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = [(CROutputRegion *)self children];
  if ([v9 count])
  {
  }
  else
  {
    id v10 = [(CROutputRegion *)self boundingQuad];
    int v11 = objc_msgSend(v10, "containsNormalizedPoint:", v7, v6);

    if (v11)
    {
      id v12 = (id)[(CROutputRegion *)self copy];
      goto LABEL_49;
    }
  }
  uint64_t v13 = (char *)[(CROutputRegion *)self _indexOfNearestChildToPoint:v7 returnFirstMatch:v6];
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = 0;
    goto LABEL_49;
  }
  uint64_t v14 = v13;
  uint64_t v15 = [(CROutputRegion *)self children];
  uint64_t v16 = [v15 objectAtIndexedSubscript:v14];

  long long v17 = (char *)[(CROutputRegion *)self _indexOfNearestChildToPoint:x returnFirstMatch:y];
  if (v17 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = v17;
    uint64_t v20 = [(CROutputRegion *)self children];
    uint64_t v21 = [v20 objectAtIndexedSubscript:v19];

    BOOL v22 = v19 >= v14;
    if (v19 < v14) {
      unint64_t v23 = (unint64_t)v19;
    }
    else {
      unint64_t v23 = (unint64_t)v14;
    }
    if (v19 < v14) {
      long long v18 = (void *)v21;
    }
    else {
      long long v18 = (void *)v16;
    }
    if (v19 < v14) {
      float32x4_t v24 = v14;
    }
    else {
      float32x4_t v24 = v19;
    }
    if (v19 < v14) {
      float32x4_t v25 = (void *)v16;
    }
    else {
      float32x4_t v25 = (void *)v21;
    }
    if (v22) {
      double v26 = v7;
    }
    else {
      double v26 = x;
    }
    if (v22) {
      double v27 = v6;
    }
    else {
      double v27 = y;
    }
    if (!v22)
    {
      double x = v7;
      double y = v6;
    }
    if (self) {
      id v28 = [(CROutputRegion *)self copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
    }
    else {
      id v28 = 0;
    }
    if (v18 == v25)
    {
      uint64_t v31 = objc_msgSend(v18, "outputRegionWithContentsBetweenStartPoint:endPoint:", v26, v27, x, y);
      float32x4_t v32 = (void *)v31;
      if (v31)
      {
        v40[0] = v31;
        float32x4_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
        [v28 setChildren:v33];
      }
    }
    else
    {
      uint64_t v29 = [(CROutputRegion *)self children];
      if (v29) {
        long long v30 = objc_opt_new();
      }
      else {
        long long v30 = 0;
      }

      float32x4_t v34 = [(CROutputRegion *)v18 outputRegionWithContentsStartingAtPoint:v27];
      if (v34) {
        [v30 addObject:v34];
      }
      if (&v24[~v23])
      {
        float32x4_t v35 = [(CROutputRegion *)self _copyChildrenInRange:(uint64_t)&v24[~v23]];
        [v30 addObjectsFromArray:v35];
      }
      long long v36 = [(CROutputRegion *)v25 outputRegionWithContentsEndingAtPoint:y];
      if (v36) {
        [v30 addObject:v36];
      }
      if (![v30 count])
      {
        uint64_t v38 = [(CROutputRegion *)self children];
        uint64_t v39 = [v38 count];

        if (v39)
        {

          id v12 = 0;
          goto LABEL_47;
        }
      }
      [v28 setChildren:v30];
    }
    id v12 = v28;
LABEL_47:

    goto LABEL_48;
  }
  id v12 = 0;
  long long v18 = (void *)v16;
LABEL_48:

LABEL_49:
  return (CROutputRegion *)v12;
}

- (void)_indexOfNearestChildToPoint:(double)a3 returnFirstMatch:(double)a4
{
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    uint64_t v8 = [result children];
    uint64_t v9 = [(CROutputRegion *)v7 _indexOfNearestRegionToPoint:a2 regions:0 returnFirstMatch:a3 distance:a4];

    return (void *)v9;
  }
  return result;
}

- (id)outputRegionWithContentsStartingAtPoint:(double)a3
{
  if (!a1) {
    goto LABEL_7;
  }
  double v6 = [a1 children];
  if ([v6 count])
  {
  }
  else
  {
    uint64_t v7 = [a1 boundingQuad];
    int v8 = objc_msgSend(v7, "containsNormalizedPoint:", a2, a3);

    if (v8)
    {
      uint64_t v9 = (void *)[a1 copy];
      goto LABEL_16;
    }
  }
  id v10 = [(CROutputRegion *)a1 _indexOfNearestChildToPoint:a2 returnFirstMatch:a3];
  if (v10 != (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = (unint64_t)v10;
    id v12 = [a1 children];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v11];

    uint64_t v9 = (void *)[a1 copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
    uint64_t v14 = [a1 children];
    if (v14) {
      uint64_t v15 = objc_opt_new();
    }
    else {
      uint64_t v15 = 0;
    }

    uint64_t v16 = [(CROutputRegion *)v13 outputRegionWithContentsStartingAtPoint:a3];
    if (v16) {
      [v15 addObject:v16];
    }
    long long v17 = [a1 children];
    uint64_t v18 = [v17 count] + ~v11;

    if (v18)
    {
      uint64_t v19 = [(CROutputRegion *)a1 _copyChildrenInRange:v18];
      [v15 addObjectsFromArray:v19];
    }
    [v9 setChildren:v15];
  }
  else
  {
LABEL_7:
    uint64_t v9 = 0;
  }
LABEL_16:
  return v9;
}

- (void)_copyChildrenInRange:(uint64_t)a3
{
  if (result)
  {
    if (a3
      && (uint64_t v5 = result,
          [result children],
          double v6 = objc_claimAutoreleasedReturnValue(),
          unint64_t v7 = [v6 count],
          v6,
          a2 < v7))
    {
      int v8 = [v5 children];
      uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", a2, a3);

      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9 copyItems:1];
      return (void *)v10;
    }
    else
    {
      return (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return result;
}

- (id)outputRegionWithContentsEndingAtPoint:(double)a3
{
  if (a1)
  {
    double v6 = [(CROutputRegion *)a1 _indexOfNearestChildToPoint:a2 returnFirstMatch:a3];
    unint64_t v7 = (void *)[a1 copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
    if (v6 != (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      int v8 = [a1 children];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v6];

      uint64_t v10 = [a1 children];
      if (v10) {
        unint64_t v11 = objc_opt_new();
      }
      else {
        unint64_t v11 = 0;
      }

      if (v6)
      {
        id v12 = [(CROutputRegion *)a1 _copyChildrenInRange:(uint64_t)v6];
        [v11 addObjectsFromArray:v12];
      }
      uint64_t v13 = [(CROutputRegion *)v9 outputRegionWithContentsEndingAtPoint:a3];
      if (v13) {
        [v11 addObject:v13];
      }
      [v7 setChildren:v11];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (CROutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (self) {
    id v6 = [(CROutputRegion *)self copyWithZone:0 copyChildren:0 copyCandidates:0 deepCopy:1];
  }
  else {
    id v6 = 0;
  }
  unint64_t v7 = [(CROutputRegion *)self transcriptComponents];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(CROutputRegion *)self children];
    float32x4_t v33 = v6;
    if (v9) {
      float32x4_t v34 = objc_opt_new();
    }
    else {
      float32x4_t v34 = 0;
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    float32x4_t v32 = self;
    uint64_t v15 = [(CROutputRegion *)self transcriptComponents];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v42.NSUInteger location = [v20 representedRange];
          v43.NSUInteger location = location;
          v43.NSUInteger length = length;
          NSRange v21 = NSIntersectionRange(v42, v43);
          if (v21.length)
          {
            NSUInteger v22 = v21.location - [v20 representedRange];
            unint64_t v23 = [v20 outputRegion];
            float32x4_t v24 = objc_msgSend(v23, "outputRegionWithContentsOfCharacterRange:", v22, v21.length);

            if (v24) {
              [v34 addObject:v24];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v17);
    }

    if (![v34 count])
    {
      uint64_t v29 = [(CROutputRegion *)v32 children];
      uint64_t v30 = [v29 count];

      if (v30)
      {
        id v14 = 0;
        id v6 = v33;
LABEL_31:

        goto LABEL_32;
      }
    }
    id v6 = v33;
    uint64_t v25 = [v33 boundingQuad];
    if (v25)
    {
      double v26 = (void *)v25;
      if (![v34 count])
      {

LABEL_29:
        [v33 setShouldComputeBoundsFromChildren:0];
        goto LABEL_30;
      }
      double v27 = [v34 firstObject];
      id v28 = [v27 boundingQuad];

      if (!v28) {
        goto LABEL_29;
      }
    }
LABEL_30:
    [v33 setChildren:v34];
    id v14 = v33;
    goto LABEL_31;
  }
  uint64_t v10 = [v6 text];
  unint64_t v11 = [v10 length];

  if (length < v11)
  {
    id v12 = [v6 text];
    uint64_t v13 = objc_msgSend(v12, "substringWithRange:", location, length);
    [v6 setText:v13];
  }
  id v14 = v6;
LABEL_32:

  return (CROutputRegion *)v14;
}

- (int64_t)wordCountInCharacterRange:(_NSRange)a3
{
  id v3 = -[CROutputRegion outputRegionWithContentsOfCharacterRange:](self, "outputRegionWithContentsOfCharacterRange:", a3.location, a3.length);
  int64_t v4 = [v3 wordCount];

  return v4;
}

- (id)closestContentRegionOfType:(unint64_t)a3 toNormalizedPoint:(CGPoint)a4 maxPixelDistance:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = [(CROutputRegion *)self contentsWithTypes:a3];
  double v13 = 1.79769313e308;
  uint64_t v10 = [(CROutputRegion *)(uint64_t)self _indexOfNearestRegionToPoint:1 regions:&v13 returnFirstMatch:x distance:y];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 > (double)a5)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", v10, v13);
  }

  return v11;
}

- (uint64_t)_indexOfNearestRegionToPoint:(char)a3 regions:(void *)a4 returnFirstMatch:(double)a5 distance:(double)a6
{
  id v11 = a2;
  id v12 = v11;
  if (a1)
  {
    uint64_t v21 = 0;
    NSUInteger v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__CROutputRegion__indexOfNearestRegionToPoint_regions_returnFirstMatch_distance___block_invoke;
    v15[3] = &unk_1E6CDC058;
    *(double *)&v15[6] = a5;
    *(double *)&v15[7] = a6;
    char v16 = a3;
    v15[4] = &v21;
    v15[5] = &v17;
    [v11 enumerateObjectsUsingBlock:v15];
    if (a4) {
      *a4 = v22[3];
    }
    uint64_t v13 = v18[3];
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)quadForTextInCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = [(CROutputRegion *)self transcriptComponents];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = [(CROutputRegion *)self transcriptComponents];
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v21 = self;
      id v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v30.NSUInteger location = objc_msgSend(v13, "representedRange", v21);
          v31.NSUInteger location = location;
          v31.NSUInteger length = length;
          NSRange v14 = NSIntersectionRange(v30, v31);
          if (v14.length)
          {
            NSUInteger v15 = v14.location - [v13 representedRange];
            char v16 = [v13 outputRegion];
            uint64_t v17 = objc_msgSend(v16, "quadForTextInCharacterRange:", v15, v14.length);

            if (v10)
            {
              [(CROutputRegion *)v21 baselineAngle];
              *(float *)&double v18 = v18;
              uint64_t v19 = [v10 unionWithNormalizedQuad:v17 baselineAngle:v18];

              id v10 = (id)v19;
            }
            else
            {
              id v10 = v17;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = [(CROutputRegion *)self boundingQuad];
  }
  return v10;
}

- (_NSRange)rangeOfContentRegion:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CROutputRegion *)self children];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 type];
  uint64_t v8 = [v4 type];

  if (v7 != v8) {
    goto LABEL_14;
  }
  double v44 = v5;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v9 = [(CROutputRegion *)self children];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v55;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v55 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(id *)(*((void *)&v54 + 1) + 8 * i);
      uint64_t v15 = [v14 uuid];
      if (v15)
      {
        char v16 = (void *)v15;
        uint64_t v17 = [v14 uuid];
        double v18 = [v4 uuid];
        if ([v17 isEqual:v18])
        {

          goto LABEL_41;
        }
      }
      if (v14 == v4)
      {
        id v14 = v4;
LABEL_41:
        id v35 = v14;
        uint64_t v5 = v44;
        if (self)
        {
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v36 = [(CROutputRegion *)self transcriptComponents];
          uint64_t length = [v36 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (length)
          {
            uint64_t v37 = *(void *)v59;
            while (2)
            {
              for (uint64_t j = 0; j != length; ++j)
              {
                if (*(void *)v59 != v37) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v39 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                id v40 = [v39 outputRegion];

                if (v40 == v35)
                {
                  uint64_t location = [v39 representedRange];
                  uint64_t length = v41;
                  goto LABEL_52;
                }
              }
              uint64_t length = [v36 countByEnumeratingWithState:&v58 objects:v65 count:16];
              if (length) {
                continue;
              }
              break;
            }
          }
          uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:
        }
        else
        {
          uint64_t length = 0;
          uint64_t location = 0;
        }

        goto LABEL_54;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_13:

  uint64_t v5 = v44;
LABEL_14:
  if (([v4 contributesToDocumentHierarchy] & 1) == 0)
  {
    uint64_t v9 = [v4 children];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v29 = [v9 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t length = 0;
      uint64_t v31 = *(void *)v51;
      uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v9);
          }
          v33.uint64_t location = [(CROutputRegion *)self rangeOfContentRegion:*(void *)(*((void *)&v50 + 1) + 8 * k)];
          if (v33.location != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (location == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t length = v33.length;
              uint64_t location = v33.location;
            }
            else
            {
              v68.uint64_t location = location;
              v68.uint64_t length = length;
              NSRange v34 = NSUnionRange(v33, v68);
              uint64_t location = v34.location;
              uint64_t length = v34.length;
            }
          }
        }
        uint64_t v30 = [v9 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v30);
      goto LABEL_54;
    }
LABEL_36:
    uint64_t length = 0;
    uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_54;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v9 = [(CROutputRegion *)self transcriptComponents];
  uint64_t v19 = [v9 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (!v19) {
    goto LABEL_36;
  }
  uint64_t v20 = v19;
  uint64_t v45 = v5;
  uint64_t v21 = *(void *)v47;
  while (2)
  {
    for (uint64_t m = 0; m != v20; ++m)
    {
      if (*(void *)v47 != v21) {
        objc_enumerationMutation(v9);
      }
      long long v23 = *(void **)(*((void *)&v46 + 1) + 8 * m);
      long long v24 = [v23 outputRegion];
      uint64_t v25 = [v24 rangeOfContentRegion:v4];
      uint64_t length = v26;

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t location = [v23 representedRange] + v25;
        goto LABEL_38;
      }
    }
    uint64_t v20 = [v9 countByEnumeratingWithState:&v46 objects:v62 count:16];
    uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    if (v20) {
      continue;
    }
    break;
  }
  uint64_t length = 0;
LABEL_38:
  uint64_t v5 = v45;
LABEL_54:

  NSUInteger v42 = location;
  NSUInteger v43 = length;
  result.uint64_t length = v43;
  result.uint64_t location = v42;
  return result;
}

- (id)contentRegionOfType:(unint64_t)a3 containingTextAtIndex:(int64_t)a4
{
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__17;
  uint64_t v21 = __Block_byref_object_dispose__17;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke;
  v16[3] = &unk_1E6CDBFC0;
  v16[4] = self;
  v16[5] = a4;
  id v6 = (void *)MEMORY[0x1E01BFAC0](v16, a2);
  uint64_t v7 = [(CROutputRegion *)self children];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_2;
  v15[3] = &unk_1E6CDBFE8;
  v15[4] = &v17;
  -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v7, a3 & 0xFFFFFFFFFFFFC7FFLL, 1, v6, v15);

  unint64_t v8 = a3 & 0x3800;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_3;
  v12[3] = &unk_1E6CDC010;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v17;
  [(CROutputRegion *)self enumerateContentsWithTypes:v8 usingBlock:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

BOOL __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) rangeOfContentRegion:a2];
  unint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = v5 >= v3;
  unint64_t v6 = v5 - v3;
  BOOL v7 = !v7 || v6 >= v4;
  return !v7;
}

void __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)_enumerateRegions:(uint64_t)a3 withTypes:(uint64_t)a4 recursively:(void *)a5 passingTest:(void *)a6 usingBlock:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  uint64_t v11 = a5;
  uint64_t v12 = a6;
  if (a1)
  {
    char v29 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      uint64_t v17 = v11 + 16;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        if (v29) {
          break;
        }
        uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        if (!v11
          || (*((unsigned int (**)(char *, void))v11 + 2))(v11, *(void *)(*((void *)&v25 + 1) + 8 * v18)))
        {
          if (([v19 type] & a3) != 0) {
            v12[2](v12, v19, &v29);
          }
          if (v29) {
            break;
          }
          if (a4)
          {
            [v19 children];
            uint64_t v20 = v17;
            v22 = uint64_t v21 = a4;
            -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:](v19, v22, a3, 1, v11, v12);

            a4 = v21;
            uint64_t v17 = v20;
          }
        }
        if (v15 == ++v18)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v10 = v23;
  }
}

void __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CROutputRegion *)a3;
  if (self == v4)
  {
    char v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      BOOL v6 = [(CROutputRegion *)self shouldComputeBoundsFromChildren];
      if (v6 != [(CROutputRegion *)v5 shouldComputeBoundsFromChildren]) {
        goto LABEL_26;
      }
      BOOL v7 = [(CROutputRegion *)self shouldComputeTranscriptFromChildren];
      if (v7 != [(CROutputRegion *)v5 shouldComputeTranscriptFromChildren]) {
        goto LABEL_26;
      }
      int v8 = [(CROutputRegion *)self confidence];
      if (v8 != [(CROutputRegion *)v5 confidence]) {
        goto LABEL_26;
      }
      [(CROutputRegion *)self rawConfidence];
      float v10 = v9;
      [(CROutputRegion *)v5 rawConfidence];
      if (v10 != v11) {
        goto LABEL_26;
      }
      [(CROutputRegion *)self baselineAngle];
      double v13 = v12;
      [(CROutputRegion *)v5 baselineAngle];
      if (v13 != v14) {
        goto LABEL_26;
      }
      unint64_t v15 = [(CROutputRegion *)self layoutDirection];
      if (v15 != [(CROutputRegion *)v5 layoutDirection]) {
        goto LABEL_26;
      }
      uint64_t v16 = [(CROutputRegion *)self boundingQuad];
      uint64_t v17 = [(CROutputRegion *)v5 boundingQuad];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_26;
      }
      uint64_t v19 = [(CROutputRegion *)self recognizedLocale];
      uint64_t v20 = [(CROutputRegion *)v5 recognizedLocale];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        uint64_t v21 = (void *)v20;
        id v22 = [(CROutputRegion *)self recognizedLocale];
        id v23 = [(CROutputRegion *)v5 recognizedLocale];
        int v24 = [v22 isEqualToString:v23];

        if (!v24) {
          goto LABEL_26;
        }
      }
      long long v26 = [(CROutputRegion *)self text];
      uint64_t v27 = [(CROutputRegion *)v5 text];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        long long v28 = (void *)v27;
        char v29 = [(CROutputRegion *)self text];
        uint64_t v30 = [(CROutputRegion *)v5 text];
        int v31 = [v29 isEqualToString:v30];

        if (!v31) {
          goto LABEL_26;
        }
      }
      float32x4_t v32 = [(CROutputRegion *)self transcriptComponents];
      uint64_t v33 = [(CROutputRegion *)v5 transcriptComponents];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        NSRange v34 = (void *)v33;
        id v35 = [(CROutputRegion *)self transcriptComponents];
        long long v36 = [(CROutputRegion *)v5 transcriptComponents];
        int v37 = [v35 isEqualToArray:v36];

        if (!v37) {
          goto LABEL_26;
        }
      }
      long long v38 = [(CROutputRegion *)self children];
      uint64_t v39 = [(CROutputRegion *)v5 children];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        id v40 = (void *)v39;
        uint64_t v41 = [(CROutputRegion *)self children];
        NSUInteger v42 = [(CROutputRegion *)v5 children];
        int v43 = [v41 isEqualToArray:v42];

        if (!v43)
        {
LABEL_26:
          char v25 = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      uint64_t v45 = [(CROutputRegion *)self candidates];
      uint64_t v46 = [(CROutputRegion *)v5 candidates];
      if (v45 == (void *)v46)
      {
        char v25 = 1;
        long long v47 = v45;
      }
      else
      {
        long long v47 = (void *)v46;
        long long v48 = [(CROutputRegion *)self candidates];
        long long v49 = [(CROutputRegion *)v5 candidates];
        char v25 = [v48 isEqualToArray:v49];
      }
      goto LABEL_27;
    }
    char v25 = 0;
  }
LABEL_28:

  return v25;
}

- (id)scriptCategoryResults
{
  return 0;
}

- (id)sequenceScriptOutputResult
{
  return 0;
}

- (unint64_t)nmsOutputScale
{
  return 0;
}

- (unint64_t)textType
{
  return 0;
}

- (void)scaleBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  float v9 = [(CROutputRegion *)self boundingQuad];
  id v10 = (id)objc_msgSend(v9, "scaledBy:normalizedOffset:", v7, v6, x, y);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  float v11 = [(CROutputRegion *)self children];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "scaleBy:normalizedOffset:", v7, v6, x, y);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(CROutputRegion *)self crCodableDataRepresentation];
  unint64_t v5 = compressData(v6);
  [v4 encodeObject:v5 forKey:@"kCROutputRegionData"];
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), @"kCROutputRegionUncompressedDataSize");
}

- (CROutputRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCROutputRegionData"];
  int64_t v6 = [v4 decodeIntegerForKey:@"kCROutputRegionUncompressedDataSize"];

  double v7 = uncompressDataOfSize(v5, v6);
  int v8 = +[CROutputRegion outputRegionWithCRCodableDataRepresentation:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(CROutputRegion *)self copyWithZone:a3 copyChildren:1 copyCandidates:1 deepCopy:1];
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  float v11 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v12 = [(CROutputRegion *)self confidence];
  [(CROutputRegion *)self baselineAngle];
  uint64_t v13 = objc_msgSend(v11, "initWithConfidence:baselineAngle:", v12);
  uint64_t v14 = [(CROutputRegion *)self boundingQuad];
  [v13 setBoundingQuad:v14];

  [(CROutputRegion *)self boundingQuadHomographySinceOCRDispatch];
  objc_msgSend(v13, "setBoundingQuadHomographySinceOCRDispatch:");
  uint64_t v15 = [(CROutputRegion *)self boundingQuadAtOCRDispatch];
  [v13 setBoundingQuadAtOCRDispatch:v15];

  long long v16 = [(CROutputRegion *)self originalBoundingQuad];
  [v13 setOriginalBoundingQuad:v16];

  [(CROutputRegion *)self boundingQuadHomography];
  objc_msgSend(v13, "setBoundingQuadHomography:");
  long long v17 = [(CROutputRegion *)self homographyGroupID];
  [v13 setHomographyGroupID:v17];

  objc_msgSend(v13, "setNumberOfLines:", -[CROutputRegion numberOfLines](self, "numberOfLines"));
  objc_msgSend(v13, "setTextAlignment:", -[CROutputRegion textAlignment](self, "textAlignment"));
  [v13 setGeometryInfo:self->_geometryInfo];
  long long v18 = [(CROutputRegion *)self polygon];
  long long v19 = (void *)[v18 copyWithZone:a3];
  [v13 setPolygon:v19];

  objc_msgSend(v13, "setConfidence:", -[CROutputRegion confidence](self, "confidence"));
  [(CROutputRegion *)self rawConfidence];
  objc_msgSend(v13, "setRawConfidence:");
  [(CROutputRegion *)self activationProbability];
  objc_msgSend(v13, "setActivationProbability:");
  [(CROutputRegion *)self baselineAngle];
  objc_msgSend(v13, "setBaselineAngle:");
  objc_msgSend(v13, "setShouldComputeBoundsFromChildren:", -[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"));
  objc_msgSend(v13, "setShouldComputeTranscriptFromChildren:", -[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"));
  objc_msgSend(v13, "setShouldComputeParagraphsFromChildren:", -[CROutputRegion shouldComputeParagraphsFromChildren](self, "shouldComputeParagraphsFromChildren"));
  uint64_t v20 = [(CROutputRegion *)self recognizedLocale];
  [v13 setRecognizedLocale:v20];

  objc_msgSend(v13, "setLayoutDirection:", -[CROutputRegion layoutDirection](self, "layoutDirection"));
  uint64_t v21 = [(CROutputRegion *)self children];

  if (v21 && v8)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v23 = [(CROutputRegion *)self children];
    int v24 = (void *)[v22 initWithArray:v23 copyItems:v6];
    [v13 setChildren:v24];
  }
  else
  {
    [v13 setChildren:0];
  }
  char v25 = [(CROutputRegion *)self candidates];

  if (v25 && v7)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v27 = [(CROutputRegion *)self candidates];
    long long v28 = (void *)[v26 initWithArray:v27 copyItems:v6];
    [v13 setCandidates:v28];
  }
  else
  {
    [v13 setCandidates:0];
  }
  [v13 setParagraphRegions:0];
  if (![(CROutputRegion *)self shouldComputeParagraphsFromChildren])
  {
    char v29 = [(CROutputRegion *)self paragraphRegions];

    if (v29)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F1C978]);
      int v31 = [(CROutputRegion *)self paragraphRegions];
      float32x4_t v32 = (void *)[v30 initWithArray:v31 copyItems:v6];
      [v13 setParagraphRegions:v32];
    }
  }
  if ([(CROutputRegion *)self shouldComputeTranscriptFromChildren] && !v8)
  {
    uint64_t v33 = [(CROutputRegion *)self text];
    [v13 setText:v33];

    NSRange v34 = [(CROutputRegion *)self transcriptComponents];
    [v13 setTranscriptComponents:v34];
LABEL_20:

    goto LABEL_21;
  }
  if ([(CROutputRegion *)self shouldComputeTranscriptFromChildren])
  {
    if (!v8)
    {
      NSRange v34 = [(CROutputRegion *)self text];
      [v13 setText:v34];
      goto LABEL_20;
    }
  }
  else
  {
    id v35 = [(CROutputRegion *)self text];
    [v13 setText:v35];

    long long v36 = [(CROutputRegion *)self transcriptComponents];

    if (v36)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F1C978]);
      NSRange v34 = [(CROutputRegion *)self transcriptComponents];
      long long v38 = (void *)[v37 initWithArray:v34 copyItems:0];
      [v13 setTranscriptComponents:v38];

      goto LABEL_20;
    }
  }
LABEL_21:
  uint64_t v39 = [(CROutputRegion *)self uuid];
  [v13 setUuid:v39];

  id v40 = [(CROutputRegion *)self trackingID];
  [v13 setTrackingID:v40];

  id v41 = objc_alloc(MEMORY[0x1E4F1C978]);
  NSUInteger v42 = [(CROutputRegion *)self formFieldRegions];
  int v43 = (void *)[v41 initWithArray:v42 copyItems:v6];
  [v13 setFormFieldRegions:v43];

  id v44 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v45 = [(CROutputRegion *)self tableRegions];
  uint64_t v46 = (void *)[v44 initWithArray:v45 copyItems:v6];
  [v13 setTableRegions:v46];

  return v13;
}

- (id)crCodableDataRepresentation
{
  unint64_t v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:11 toData:v3];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  +[CRCodingUtilities appendCodable:v5 toData:v3];

  +[CRCodingUtilities appendBool:[(CROutputRegion *)self shouldComputeBoundsFromChildren] toData:v3];
  +[CRCodingUtilities appendBool:[(CROutputRegion *)self shouldComputeTranscriptFromChildren] toData:v3];
  if (![(CROutputRegion *)self computesTranscriptFromChildren])
  {
    BOOL v6 = [(CROutputRegion *)self text];
    +[CRCodingUtilities appendCodable:v6 toData:v3];
  }
  if (![(CROutputRegion *)self computesBoundsFromChildren])
  {
    BOOL v7 = [(CROutputRegion *)self boundingQuad];
    +[CRCodingUtilities appendCodable:v7 toData:v3];
  }
  +[CRCodingUtilities appendInteger:[(CROutputRegion *)self confidence] toData:v3];
  [(CROutputRegion *)self rawConfidence];
  +[CRCodingUtilities appendFloat:toData:](CRCodingUtilities, "appendFloat:toData:", v3);
  [(CROutputRegion *)self baselineAngle];
  +[CRCodingUtilities appendCGFloat:toData:](CRCodingUtilities, "appendCGFloat:toData:", v3);
  BOOL v8 = [(CROutputRegion *)self children];
  +[CRCodingUtilities appendCodable:v8 toData:v3];

  float v9 = [(CROutputRegion *)self candidates];
  +[CRCodingUtilities appendCodable:v9 toData:v3];

  id v10 = [(CROutputRegion *)self recognizedLocale];
  +[CRCodingUtilities appendCodable:v10 toData:v3];

  +[CRCodingUtilities appendInteger:[(CROutputRegion *)self layoutDirection] toData:v3];
  +[CRCodingUtilities appendInteger:[(CROutputRegion *)self numberOfLines] toData:v3];
  float v11 = [(CROutputRegion *)self formFieldRegions];
  +[CRCodingUtilities appendCodable:v11 toData:v3];

  uint64_t v12 = [(CROutputRegion *)self uuid];
  uint64_t v13 = [v12 UUIDString];
  +[CRCodingUtilities appendCodable:v13 toData:v3];

  +[CRCodingUtilities appendInteger:[(CROutputRegion *)self textAlignment] toData:v3];
  uint64_t v14 = [(CROutputRegion *)self tableRegions];
  +[CRCodingUtilities appendCodable:v14 toData:v3];

  return v3;
}

+ (id)outputRegionWithCRCodableDataRepresentation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v10 = 0;
    int64_t v4 = +[CRCodingUtilities integerFromEncodingData:v3 offset:&v10];
    if ((unint64_t)(v4 - 12) > 0xFFFFFFFFFFFFFFF4)
    {
      unint64_t v5 = +[CRCodingUtilities stringFromEncodingData:v3 offset:&v10];
      uint64_t v7 = self;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v12 = __46__CROutputRegion_decodableClassFromClassName___block_invoke;
      uint64_t v13 = &__block_descriptor_40_e5_v8__0l;
      uint64_t v14 = v7;
      if (qword_1EB58CD68 != -1) {
        dispatch_once(&qword_1EB58CD68, &buf);
      }
      BOOL v8 = [(id)qword_1EB58CD60 objectForKeyedSubscript:v5];

      BOOL v6 = (void *)[objc_alloc((Class)v8) initWithCRCodableDataRepresentation:v3 version:v4 offset:&v10];
    }
    else
    {
      unint64_t v5 = CROSLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1DD733000, v5, OS_LOG_TYPE_FAULT, "Unexpected data version %ld for CROutputRegion decoding", (uint8_t *)&buf, 0xCu);
      }
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CROutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((unint64_t)(a4 - 12) > 0xFFFFFFFFFFFFFFF4)
  {
    float v11 = [(CROutputRegion *)self init];
    if (v11)
    {
      v11->_shouldComputeBoundsFromChildren = +[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5];
      BOOL v12 = +[CRCodingUtilities BOOLFromEncodingData:v8 offset:a5];
      v11->_shouldComputeTranscriptFromChildren = v12;
      if (!v12)
      {
        uint64_t v13 = +[CRCodingUtilities stringFromEncodingData:v8 offset:a5];
        text = v11->_text;
        v11->_text = (NSString *)v13;
      }
      if (!v11->_shouldComputeBoundsFromChildren)
      {
        uint64_t v15 = [CRNormalizedQuad alloc];
        long long v16 = +[CRCodingUtilities objectDataFromEncodingData:v8 offset:a5];
        uint64_t v17 = [(CRNormalizedQuad *)v15 initWithCRCodableDataRepresentation:v16];
        boundingQuad = v11->_boundingQuad;
        v11->_boundingQuad = (CRNormalizedQuad *)v17;
      }
      v11->_confidence = +[CRCodingUtilities integerFromEncodingData:v8 offset:a5];
      +[CRCodingUtilities floatFromEncodingData:v8 offset:a5];
      v11->_rawConfidence = v19;
      +[CRCodingUtilities cgFloatFromEncodingData:v8 offset:a5];
      v11->_double baselineAngle = v20;
      uint64_t v21 = +[CRCodingUtilities arrayFromEncodingData:v8 offset:a5 objectProviderBlock:&__block_literal_global_104_0];
      children = v11->_children;
      v11->_children = (NSArray *)v21;

      uint64_t v23 = +[CRCodingUtilities arrayFromEncodingData:v8 offset:a5 objectProviderBlock:&__block_literal_global_104_0];
      candidates = v11->_candidates;
      v11->_candidates = (NSArray *)v23;

      if ((unint64_t)a4 < 2
        || (+[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v8, a5), uint64_t v25 = objc_claimAutoreleasedReturnValue(), recognizedLocale = v11->_recognizedLocale, v11->_recognizedLocale = (NSString *)v25, recognizedLocale, (unint64_t)a4 < 6)|| (v11->_layoutDirection = +[CRCodingUtilities integerFromEncodingData:v8 offset:a5], (unint64_t)a4 <= 7))
      {
        [(CROutputRegion *)v11 _computeNumberOfLines];
      }
      else
      {
        v11->_numberOfLines = +[CRCodingUtilities integerFromEncodingData:v8 offset:a5];
        if (a4 != 8)
        {
          uint64_t v27 = -[CROutputRegion decodeOutputsArrayFromData:offset:]((uint64_t)v8, (uint64_t)a5);
          formFieldRegions = v11->_formFieldRegions;
          v11->_formFieldRegions = (NSArray *)v27;

          if ((unint64_t)a4 >= 0xA)
          {
            char v29 = +[CRCodingUtilities stringFromEncodingData:v8 offset:a5];
            if (v29)
            {
              uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v29];
              uuid = v11->_uuid;
              v11->_uuid = (NSUUID *)v30;
            }
            v11->_textAlignment = +[CRCodingUtilities integerFromEncodingData:v8 offset:a5];
            uint64_t v32 = -[CROutputRegion decodeOutputsArrayFromData:offset:]((uint64_t)v8, (uint64_t)a5);
            tableRegions = v11->_tableRegions;
            v11->_tableRegions = (NSArray *)v32;

            goto LABEL_20;
          }
        }
      }
      v11->_textAlignment = 0;
    }
LABEL_20:
    self = v11;
    uint64_t v10 = self;
    goto LABEL_21;
  }
  float v9 = CROSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v35 = 134217984;
    int64_t v36 = a4;
    _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_FAULT, "Unexpected data version %ld for CROutputRegion decoding", (uint8_t *)&v35, 0xCu);
  }

  uint64_t v10 = 0;
LABEL_21:

  return v10;
}

- (id)decodeOutputsArrayFromData:(uint64_t)a1 offset:(uint64_t)a2
{
  id v2 = +[CRCodingUtilities arrayFromEncodingData:a1 offset:a2 objectProviderBlock:&__block_literal_global_104_0];
  return v2;
}

+ (id)decodableSubclasses
{
  if (qword_1EB58CD58 != -1) {
    dispatch_once(&qword_1EB58CD58, &__block_literal_global_31);
  }
  id v2 = (void *)_MergedGlobals_30;
  return v2;
}

void __37__CROutputRegion_decodableSubclasses__block_invoke()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = v0;
}

void __46__CROutputRegion_decodableClassFromClassName___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "decodableSubclasses", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(objc_class **)(*((void *)&v12 + 1) + 8 * i);
        float v9 = NSStringFromClass(v8);
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [v2 copy];
  float v11 = (void *)qword_1EB58CD60;
  qword_1EB58CD60 = v10;
}

CROutputRegion *__52__CROutputRegion_decodeOutputsArrayFromData_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CROutputRegion outputRegionWithCRCodableDataRepresentation:a2];
}

- (BOOL)contributesToDocumentHierarchy
{
  return 1;
}

- (void)_overrideSetBoundingQuad:(id)a3
{
  [(CROutputRegion *)self setBoundingQuad:a3];
  [(CROutputRegion *)self setGeometryInfo:0];
}

- (void)_computeNumberOfLines
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CROutputRegion *)self children];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v9 + 1) + 8 * i) numberOfLines];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(CROutputRegion *)self setNumberOfLines:v6];
}

void __81__CROutputRegion__indexOfNearestRegionToPoint_regions_returnFirstMatch_distance___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 boundingQuad];
  objc_msgSend(v7, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v9 = v8;

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  double v11 = *(double *)(v10 + 24);
  if (v9 < v11 || v9 == v11 && !*(unsigned char *)(a1 + 64))
  {
    *(double *)(v10 + 24) = v9;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  if (v9 == 0.0)
  {
    if (*(unsigned char *)(a1 + 64)) {
      *a4 = 1;
    }
  }
}

- (CRRegionGeometryInfo)geometryInfo
{
  geometryInfo = self->_geometryInfo;
  if (!geometryInfo)
  {
    [(CROutputRegion *)self _computeGeometryInfo];
    geometryInfo = self->_geometryInfo;
  }
  return geometryInfo;
}

- (void)_computeGeometryInfo
{
  id v3 = [[CRRegionGeometryInfo alloc] initFromRegion:self layoutDirection:self->_layoutDirection];
  geometryInfo = self->_geometryInfo;
  self->_geometryInfo = v3;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setText:(id)a3
{
}

- (NSString)recognizedLocale
{
  return self->_recognizedLocale;
}

- (void)setRecognizedLocale:(id)a3
{
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (void)setBoundingQuad:(id)a3
{
}

- (NSUUID)trackingID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTrackingID:(id)a3
{
}

- (CRNormalizedPolyline)polygon
{
  return self->_polygon;
}

- (void)setPolygon:(id)a3
{
}

- (NSNumber)homographyGroupID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHomographyGroupID:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
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

- (void)setVisualTextAngle:(float)a3
{
  self->_visualTextAngle = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (CRNormalizedQuad)originalBoundingQuad
{
  return self->_originalBoundingQuad;
}

- (void)setOriginalBoundingQuad:(id)a3
{
}

- (__n128)boundingQuadHomography
{
  return a1[15];
}

- (__n128)setBoundingQuadHomography:(__n128)a3
{
  result[15] = a2;
  result[16] = a3;
  result[17] = a4;
  return result;
}

- (CRNormalizedQuad)boundingQuadAtOCRDispatch
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBoundingQuadAtOCRDispatch:(id)a3
{
}

- (double)boundingQuadHomographySinceOCRDispatch
{
  objc_copyStruct(&v2, (const void *)(a1 + 288), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setBoundingQuadHomographySinceOCRDispatch:(__n128)a3
{
  v4[0] = a2;
  v4[1] = a3;
  void v4[2] = a4;
  objc_copyStruct((void *)(a1 + 288), v4, 48, 1, 0);
}

- (void)setTranscriptComponents:(id)a3
{
}

- (BOOL)significantTranscriptChange
{
  return self->_significantTranscriptChange;
}

- (void)setSignificantTranscriptChange:(BOOL)a3
{
  self->_significantTranscriptChange = a3;
}

- (float)rawConfidence
{
  return self->_rawConfidence;
}

- (void)setRawConfidence:(float)a3
{
  self->_rawConfidence = a3;
}

- (double)activationProbability
{
  return self->_activationProbability;
}

- (void)setActivationProbability:(double)a3
{
  self->_activationProbabilitdouble y = a3;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(double)a3
{
  self->_double baselineAngle = a3;
}

- (CRNormalizedQuad)boundingQuadAfterOCR
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBoundingQuadAfterOCR:(id)a3
{
}

- (void)setGeometryInfo:(id)a3
{
}

- (BOOL)shouldComputeBoundsFromChildren
{
  return self->_shouldComputeBoundsFromChildren;
}

- (void)setShouldComputeBoundsFromChildren:(BOOL)a3
{
  self->_shouldComputeBoundsFromChildren = a3;
}

- (BOOL)shouldComputeTranscriptFromChildren
{
  return self->_shouldComputeTranscriptFromChildren;
}

- (void)setShouldComputeTranscriptFromChildren:(BOOL)a3
{
  self->_shouldComputeTranscriptFromChildren = a3;
}

- (BOOL)shouldComputeParagraphsFromChildren
{
  return self->_shouldComputeParagraphsFromChildren;
}

- (void)setShouldComputeParagraphsFromChildren:(BOOL)a3
{
  self->_shouldComputeParagraphsFromChildren = a3;
}

- (NSArray)dataDetectorRegions
{
  return self->_dataDetectorRegions;
}

- (void)setDataDetectorRegions:(id)a3
{
}

- (NSArray)dataDetectorGroupRegions
{
  return self->_dataDetectorGroupRegions;
}

- (void)setDataDetectorGroupRegions:(id)a3
{
}

- (NSArray)paragraphRegions
{
  return self->_paragraphRegions;
}

- (void)setParagraphRegions:(id)a3
{
}

- (NSArray)listRegions
{
  return self->_listRegions;
}

- (void)setListRegions:(id)a3
{
}

- (NSArray)tableRegions
{
  return self->_tableRegions;
}

- (void)setTableRegions:(id)a3
{
}

- (NSArray)formFieldRegions
{
  return self->_formFieldRegions;
}

- (void)setFormFieldRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formFieldRegions, 0);
  objc_storeStrong((id *)&self->_tableRegions, 0);
  objc_storeStrong((id *)&self->_listRegions, 0);
  objc_storeStrong((id *)&self->_paragraphRegions, 0);
  objc_storeStrong((id *)&self->_dataDetectorGroupRegions, 0);
  objc_storeStrong((id *)&self->_dataDetectorRegions, 0);
  objc_storeStrong((id *)&self->_geometryInfo, 0);
  objc_storeStrong((id *)&self->_boundingQuadAfterOCR, 0);
  objc_storeStrong((id *)&self->_transcriptComponents, 0);
  objc_storeStrong((id *)&self->_boundingQuadAtOCRDispatch, 0);
  objc_storeStrong((id *)&self->_originalBoundingQuad, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_homographyGroupID, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_recognizedLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_vcImageSpaceQuad, 0);
}

@end