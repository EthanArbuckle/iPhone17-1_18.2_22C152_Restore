@interface CRDocumentOutputRegion
+ (id)documentWithLines:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6;
+ (id)documentWithRegions:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6;
+ (id)groupedParagraphBlocksFromParagraphs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReprocessDocument;
- (CRDocumentOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5;
- (CRDocumentOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
- (CRDocumentOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3;
- (CRDocumentOutputRegion)outputRegionWithContentsOfQuad:(id)a3;
- (CRDocumentOutputRegionMetadata)additionalMetadata;
- (CROutputRegion)title;
- (CRTextDetectorResults)detectorResults;
- (NSArray)cachedLayoutComponents;
- (NSString)imagePath;
- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6;
- (id)crCodableDataRepresentation;
- (id)detectedFieldRegionsExcludingFields:(id)a3 updateExcludedFields:(BOOL)a4;
- (id)fieldRegionsExcludingAnnotatedFields:(id)a3 updateContentTypeOfAnnotatedFields:(BOOL)a4;
- (id)layoutComponents;
- (id)proposedFieldForPoint:(CGPoint)a3 existingFields:(id)a4;
- (id)trackingDocumentWithTrackedType:(unint64_t)a3 includeLines:(BOOL)a4;
- (id)writeToFileInFolder:(id)a3 basename:(id)a4;
- (int)formness;
- (unint64_t)documentRevision;
- (unint64_t)type;
- (void)collectMetadataForNumFilteredRegions:(int64_t)a3;
- (void)setAdditionalMetadata:(id)a3;
- (void)setCachedLayoutComponents:(id)a3;
- (void)setChildren:(id)a3;
- (void)setDetectorResults:(id)a3;
- (void)setDocumentRevision:(unint64_t)a3;
- (void)setImagePath:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CRDocumentOutputRegion

- (CRDocumentOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_info = CRImageSpacePolyline.info;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v10 = CRImageSpacePolyline.info;
  v11 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v13 = (id)CRSignpostLog_signPostOSLog;
  v14 = v13;
  unint64_t v41 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "OCRDeserializationTime", "", buf, 2u);
  }

  v46.receiver = self;
  v46.super_class = (Class)CRDocumentOutputRegion;
  v15 = [(CROutputRegion *)&v46 initWithCRCodableDataRepresentation:v8 version:a4 offset:a5];
  if (v15)
  {
    BOOL v16 = a4 >= 3
       && +[CRCodingUtilities integerFromEncodingData:v8 offset:a5] > 0;
    v17 = +[CRCodingUtilities objectDataFromEncodingData:v8 offset:a5];
    uint64_t v18 = +[CROutputRegion outputRegionWithCRCodableDataRepresentation:v17];
    title = v15->_title;
    v15->_title = (CROutputRegion *)v18;

    if (v16)
    {
      v15->_documentRevision = +[CRCodingUtilities unsignedIntegerFromEncodingData:v8 offset:a5];
      v20 = +[CRCodingUtilities objectDataFromEncodingData:v8 offset:a5];
      v10 = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
      if (v20)
      {
        v21 = [[CRDocumentOutputRegionMetadata alloc] initWithCRCodableDataRepresentation:v20];
        additionalMetadata = v15->_additionalMetadata;
        v15->_additionalMetadata = v21;
      }
      p_info = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
    }
    else
    {
      v15->_documentRevision = 0;
      p_info = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
      v10 = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
    }
    if (a4 <= 9)
    {
      os_signpost_id_t v40 = v12;
      v23 = objc_opt_new();
      v24 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v25 = [(CROutputRegion *)v15 children];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v30, "type", v40) == 64)
            {
              v31 = [v30 contentsWithTypes:2];
              [v23 addObjectsFromArray:v31];
              [v24 addObject:v30];
            }
            else
            {
              [v23 addObject:v30];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v53 count:16];
        }
        while (v27);
      }

      os_signpost_id_t v12 = v40;
      p_info = CRImageSpacePolyline.info;
      v10 = (__objc2_class_ro **)(CRImageSpacePolyline + 32);
      if ([v24 count])
      {
        v32 = CROSLogForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [v24 count];
          v34 = [(CROutputRegion *)v15 children];
          uint64_t v35 = [v34 count];
          uint64_t v36 = [v23 count];
          *(_DWORD *)buf = 134218496;
          uint64_t v48 = v33;
          v10 = CRImageSpacePolyline.info;
          __int16 v49 = 2048;
          uint64_t v50 = v35;
          __int16 v51 = 2048;
          uint64_t v52 = v36;
          _os_log_impl(&dword_1DD733000, v32, OS_LOG_TYPE_DEFAULT, "Encountered %ld table(s) in hierarchy. Updating children from %ld to %ld", buf, 0x20u);
        }
        [(CRDocumentOutputRegion *)v15 setChildren:v23];
        [(CROutputRegion *)v15 setTableRegions:v24];
      }
    }
  }
  if (p_info[496] != (__objc2_class_ro *)-1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v37 = v10[497];
  v38 = v37;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v38, OS_SIGNPOST_INTERVAL_END, v12, "OCRDeserializationTime", "", buf, 2u);
  }

  return v15;
}

+ (id)documentWithRegions:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v8 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  os_signpost_id_t v12 = [(CROutputRegion *)[CRDocumentOutputRegion alloc] initWithConfidence:v8 baselineAngle:0.0];
  [(CRDocumentOutputRegion *)v12 setTitle:v10];

  v13 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", 0.0, 0.0, 1.0, 1.0, width, height);
  [(CROutputRegion *)v12 setBoundingQuad:v13];

  [(CROutputRegion *)v12 setShouldComputeBoundsFromChildren:0];
  [(CRDocumentOutputRegion *)v12 setChildren:v11];

  [(CRDocumentOutputRegion *)v12 setDocumentRevision:1];
  return v12;
}

+ (id)documentWithLines:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v8 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  os_signpost_id_t v12 = objc_msgSend((id)objc_opt_class(), "documentWithRegions:title:confidence:imageSize:", v11, v10, v8, width, height);

  return v12;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRDocumentOutputRegion *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CRDocumentOutputRegion *)self title];

      if (v6)
      {
        v7 = [(CRDocumentOutputRegion *)self title];
        uint64_t v8 = [(CRDocumentOutputRegion *)v5 title];
        int v9 = [v7 isEqual:v8];

        if (!v9) {
          goto LABEL_11;
        }
      }
      else
      {
        id v11 = [(CRDocumentOutputRegion *)v5 title];

        if (v11)
        {
LABEL_11:
          BOOL v10 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      os_signpost_id_t v12 = [(CRDocumentOutputRegion *)self additionalMetadata];
      uint64_t v13 = [(CRDocumentOutputRegion *)v5 additionalMetadata];
      if (v12 == (void *)v13)
      {
      }
      else
      {
        v14 = (void *)v13;
        v15 = [(CRDocumentOutputRegion *)self additionalMetadata];
        BOOL v16 = [(CRDocumentOutputRegion *)v5 additionalMetadata];
        int v17 = [v15 isEqual:v16];

        if (!v17) {
          goto LABEL_11;
        }
      }
      v19.receiver = self;
      v19.super_class = (Class)CRDocumentOutputRegion;
      BOOL v10 = [(CROutputRegion *)&v19 isEqual:v5];
      goto LABEL_14;
    }
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)setChildren:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRDocumentOutputRegion;
  [(CROutputRegion *)&v4 setChildren:a3];
  [(CRDocumentOutputRegion *)self setCachedLayoutComponents:0];
}

- (CRDocumentOutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRDocumentOutputRegion;
  id v3 = a3;
  objc_super v4 = [(CROutputRegion *)&v6 outputRegionWithContentsOfQuad:v3];
  objc_msgSend(v4, "setBoundingQuad:", v3, v6.receiver, v6.super_class);

  return (CRDocumentOutputRegion *)v4;
}

- (CRDocumentOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  if ([(CROutputRegion *)self shouldComputeBoundsFromChildren])
  {
    v12.receiver = self;
    v12.super_class = (Class)CRDocumentOutputRegion;
    int v9 = -[CROutputRegion outputRegionWithContentsBetweenStartPoint:endPoint:](&v12, sel_outputRegionWithContentsBetweenStartPoint_endPoint_, v7, v6, x, y);
  }
  else
  {
    BOOL v10 = (void *)[(CRDocumentOutputRegion *)self copy];
    [v10 setShouldComputeBoundsFromChildren:1];
    int v9 = objc_msgSend(v10, "outputRegionWithContentsBetweenStartPoint:endPoint:", v7, v6, x, y);
  }
  return (CRDocumentOutputRegion *)v9;
}

- (CRDocumentOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(CROutputRegion *)self shouldComputeBoundsFromChildren])
  {
    v9.receiver = self;
    v9.super_class = (Class)CRDocumentOutputRegion;
    double v6 = -[CROutputRegion outputRegionWithContentsOfCharacterRange:](&v9, sel_outputRegionWithContentsOfCharacterRange_, location, length);
  }
  else
  {
    id v7 = [(CRDocumentOutputRegion *)self copyWithZone:0 copyChildren:1 copyCandidates:0 deepCopy:0];
    [v7 setShouldComputeBoundsFromChildren:1];
    double v6 = objc_msgSend(v7, "outputRegionWithContentsOfCharacterRange:", location, length);
  }
  return (CRDocumentOutputRegion *)v6;
}

- (id)crCodableDataRepresentation
{
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v3 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v5 = (id)CRSignpostLog_signPostOSLog;
  double v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRSerializationTime", "", buf, 2u);
  }

  id v7 = (void *)MEMORY[0x1E4F1CA58];
  v15.receiver = self;
  v15.super_class = (Class)CRDocumentOutputRegion;
  uint64_t v8 = [(CROutputRegion *)&v15 crCodableDataRepresentation];
  objc_super v9 = [v7 dataWithData:v8];

  +[CRCodingUtilities appendInteger:1 toData:v9];
  BOOL v10 = [(CRDocumentOutputRegion *)self title];
  +[CRCodingUtilities appendCodable:v10 toData:v9];

  +[CRCodingUtilities appendUInteger:1 toData:v9];
  id v11 = [(CRDocumentOutputRegion *)self additionalMetadata];
  +[CRCodingUtilities appendCodable:v11 toData:v9];

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  objc_super v12 = (id)CRSignpostLog_signPostOSLog;
  uint64_t v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_END, v4, "OCRSerializationTime", "", buf, 2u);
  }

  return v9;
}

- (BOOL)shouldReprocessDocument
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(CRDocumentOutputRegion *)self documentRevision] == 1 && self)
  {
    id v3 = [(CRDocumentOutputRegion *)self additionalMetadata];

    if (v3)
    {
      os_signpost_id_t v4 = [(CROutputRegion *)self contentsWithTypes:8];
      id v3 = (void *)[v4 count];
      v5 = [(CRDocumentOutputRegion *)self additionalMetadata];
      uint64_t v6 = [v5 numFilteredRegions];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        uint64_t v11 = v6;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "rawConfidence", (void)v15);
            if (v13 <= 0.6) {
              ++v11;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      else
      {
        uint64_t v11 = v6;
      }

      LOBYTE(v3) = (float)((float)v11 / (float)((uint64_t)v3 + v6)) >= 0.75;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)collectMetadataForNumFilteredRegions:(int64_t)a3
{
  id v5 = (id)objc_opt_new();
  [v5 setNumFilteredRegions:a3];
  [(CRDocumentOutputRegion *)self setAdditionalMetadata:v5];
}

- (int)formness
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  uint64_t v12 = 0;
  float v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CRDocumentOutputRegion_formness__block_invoke;
  v7[3] = &unk_1E6CDB338;
  v7[4] = &v12;
  v7[5] = v16;
  v7[6] = &v8;
  [(CROutputRegion *)self enumerateContentsWithTypes:0x2000 usingBlock:v7];
  if (v9[3]) {
    int v2 = 2;
  }
  else {
    int v2 = v13[3] != 0;
  }
  id v3 = CROSLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v13[3];
    uint64_t v5 = v9[3];
    *(_DWORD *)buf = 136315906;
    long long v18 = "-[CRDocumentOutputRegion formness]";
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v5;
    __int16 v23 = 1024;
    int v24 = v2;
    _os_log_impl(&dword_1DD733000, v3, OS_LOG_TYPE_DEFAULT, "%s: #fields:%lu #boundedAutoFillable:%lu result:%u", buf, 0x26u);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return v2;
}

void __34__CRDocumentOutputRegion_formness__block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  if ([v4 fieldSource] == 1)
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v4;
      if ([v3 fieldType] == 1)
      {
        if (+[CRFormContentTypeUtilities contentTypeIsAutoFillable:](CRFormContentTypeUtilities, "contentTypeIsAutoFillable:", [v3 textContentType]))
        {
          ++*(void *)(*(void *)(a1[5] + 8) + 24);
          if (([v3 hasBoundedWidth] & 1) != 0 || objc_msgSend(v3, "hasBoundedHeight")) {
            ++*(void *)(*(void *)(a1[6] + 8) + 24);
          }
        }
      }
    }
  }
}

- (id)detectedFieldRegionsExcludingFields:(id)a3 updateExcludedFields:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CRDocumentOutputRegion detectedFieldRegionsExcludingFields:updateExcludedFields:]";
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEFAULT, "%s: #fields:%lu updateExcludedFields:%d", (uint8_t *)&v10, 0x1Cu);
  }

  uint64_t v8 = +[CRFormUtilities detectedFieldRegionsInDocument:self excludingFields:v6 updateExcludedFields:v4];

  return v8;
}

- (id)proposedFieldForPoint:(CGPoint)a3 existingFields:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = CROSLogForCategory(6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315906;
    int v24 = "-[CRDocumentOutputRegion proposedFieldForPoint:existingFields:]";
    __int16 v25 = 2048;
    double v26 = x;
    __int16 v27 = 2048;
    double v28 = y;
    __int16 v29 = 2048;
    uint64_t v30 = [v7 count];
    _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEFAULT, "%s: x:%lf y:%lf #existingFields:%lu", (uint8_t *)&v23, 0x2Au);
  }

  uint64_t v9 = +[CRFormUtilities proposedFieldForPoint:inDocument:existingFields:](CRFormUtilities, "proposedFieldForPoint:inDocument:existingFields:", self, v7, x, y);
  int v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 boundingQuad];
    [v11 boundingBox];
    double v13 = v12;
    __int16 v14 = [v9 boundingQuad];
    [v14 boundingBox];
    double v16 = v15;
    long long v17 = [v9 boundingQuad];
    [v17 boundingBox];
    uint64_t v19 = v18;
    uint64_t v20 = [v9 boundingQuad];
    [v20 boundingBox];
    int v23 = 136316162;
    int v24 = "-[CRDocumentOutputRegion proposedFieldForPoint:existingFields:]";
    __int16 v25 = 2048;
    double v26 = v13;
    __int16 v27 = 2048;
    double v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = v19;
    __int16 v31 = 2048;
    uint64_t v32 = v21;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEFAULT, "%s: output: x:%lf y:%lf w:%lf h:%lf", (uint8_t *)&v23, 0x34u);
  }
  return v9;
}

- (id)fieldRegionsExcludingAnnotatedFields:(id)a3 updateContentTypeOfAnnotatedFields:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CRDocumentOutputRegion fieldRegionsExcludingAnnotatedFields:updateContentTypeOfAnnotatedFields:]";
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEFAULT, "%s: #annotatedFields:%lu updateContentType:%d", (uint8_t *)&v10, 0x1Cu);
  }

  uint64_t v8 = +[CRFormUtilities detectedFieldRegionsInDocument:self excludingFields:v6 updateExcludedFields:v4];

  return v8;
}

- (id)layoutComponents
{
  int v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(CRDocumentOutputRegion *)self cachedLayoutComponents];

  if (!v3)
  {
    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    BOOL v4 = (id)CRSignpostLog_signPostOSLog;
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    id v6 = (id)CRSignpostLog_signPostOSLog;
    id v7 = v6;
    unint64_t v8 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OCRLayoutAnalysisTime", "", buf, 2u);
    }

    uint64_t v36 = objc_opt_new();
    uint64_t v9 = [(CROutputRegion *)v2 contentsWithTypes:64];
    uint64_t v10 = [(CROutputRegion *)v2 contentsWithTypes:256];
    v34 = [(CROutputRegion *)v2 contentsWithTypes:4];
    uint64_t v35 = (void *)v10;
    uint64_t v11 = [v34 arrayByAddingObjectsFromArray:v10];
    os_signpost_id_t v40 = [v11 arrayByAddingObjectsFromArray:v9];

    [(CROutputRegion *)v2 contentsWithTypes:8];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v30 = v5 - 1;
      __int16 v31 = v9;
      os_signpost_id_t v32 = v5;
      uint64_t v33 = v2;
      int v38 = 0;
      uint64_t v39 = *(void *)v46;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v16 = v40;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = 0;
            uint64_t v20 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v42 != v20) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                int v23 = [v22 contentsWithTypes:8];
                if ([v23 containsObject:v15])
                {
                  int v24 = v22;

                  uint64_t v19 = v24;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v18);

            if (v19)
            {
              objc_opt_class();
              v38 |= objc_opt_isKindOfClass();
              [v36 addObject:v19];
              goto LABEL_28;
            }
          }
          else
          {
          }
          uint64_t v19 = CROSLogForCategory(0);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD733000, v19, OS_LOG_TYPE_FAULT, "Encountered a line that doesn't belong in a layout component", buf, 2u);
          }
LABEL_28:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (!v13)
        {
          os_signpost_id_t v5 = v32;
          int v2 = v33;
          unint64_t v8 = v30;
          uint64_t v9 = v31;
          if (v38) {
            [(CROutputRegion *)v33 _invalidateTranscriptRecursivelyThrough:objc_opt_class()];
          }
          break;
        }
      }
    }
    __int16 v25 = [v36 array];
    [(CRDocumentOutputRegion *)v2 setCachedLayoutComponents:v25];

    if (CRSignpostLog_onceToken != -1) {
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
    }
    double v26 = (id)CRSignpostLog_signPostOSLog;
    __int16 v27 = v26;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD733000, v27, OS_SIGNPOST_INTERVAL_END, v5, "OCRLayoutAnalysisTime", "", buf, 2u);
    }
  }
  double v28 = [(CRDocumentOutputRegion *)v2 cachedLayoutComponents];
  return v28;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CRDocumentOutputRegion;
  id v7 = [(CROutputRegion *)&v12 copyWithZone:a3 copyChildren:a4 copyCandidates:a5 deepCopy:a6];
  unint64_t v8 = [(CRDocumentOutputRegion *)self title];
  [v7 setTitle:v8];

  uint64_t v9 = [(CRDocumentOutputRegion *)self additionalMetadata];
  uint64_t v10 = (void *)[v9 copy];
  [v7 setAdditionalMetadata:v10];

  return v7;
}

+ (id)groupedParagraphBlocksFromParagraphs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v9 = [v8 trackingID];

        if (!v9)
        {
          uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
          [v8 setTrackingID:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  uint64_t v11 = +[CRTrackedRegionGroup groupsFromOutputRegions:v3];
  objc_super v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = +[CRTrackedDocumentOutputRegion _blockFromTrackedRegionGroup:trackedType:]((uint64_t)CRTrackedDocumentOutputRegion, *(void **)(*((void *)&v21 + 1) + 8 * j), 4);
        objc_msgSend(v12, "addObject:", v18, (void)v21);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  uint64_t v19 = (void *)[v12 copy];
  return v19;
}

- (id)trackingDocumentWithTrackedType:(unint64_t)a3 includeLines:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 2;
  if (a4) {
    uint64_t v6 = 10;
  }
  id v7 = [(CROutputRegion *)self copyIncludingChildrenOfTypes:v6 | a3];
  uint64_t v8 = [v7 children];
  uint64_t v9 = (void *)v8;
  if (a3 != 2)
  {
    long long v26 = (void *)v8;
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [v7 contentsWithTypes:a3];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = +[CRTrackedDocumentOutputRegion _blockFromRegion:trackedType:]((uint64_t)CRTrackedDocumentOutputRegion, *(void **)(*((void *)&v27 + 1) + 8 * i), a3);
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
    uint64_t v9 = (void *)[v10 copy];
  }
  uint64_t v17 = [CRTrackedDocumentOutputRegion alloc];
  uint64_t v18 = [(CROutputRegion *)self confidence];
  [(CROutputRegion *)self baselineAngle];
  uint64_t v19 = -[CROutputRegion initWithConfidence:baselineAngle:](v17, "initWithConfidence:baselineAngle:", v18);
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_trackedRegionType = a3;
    [(CROutputRegion *)v19 setShouldComputeBoundsFromChildren:0];
    [(CROutputRegion *)v20 setShouldComputeParagraphsFromChildren:0];
    long long v21 = [v7 text];
    [(CROutputRegion *)v20 setText:v21];

    [(CRDocumentOutputRegion *)v20 setChildren:v9];
    long long v22 = [v7 paragraphRegions];
    [(CROutputRegion *)v20 setParagraphRegions:v22];

    v20->_trackedRegionType = a3;
  }
  else
  {
    [0 setShouldComputeBoundsFromChildren:0];
    [0 setShouldComputeParagraphsFromChildren:0];
    long long v24 = [v7 text];
    [0 setText:v24];

    [0 setChildren:v9];
    long long v25 = [v7 paragraphRegions];
    [0 setParagraphRegions:v25];
  }
  return v20;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v9 = [v6 absoluteString];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v11 = 0;
LABEL_4:
    uint64_t v13 = v11;
    uint64_t v14 = [v6 URLByAppendingPathComponent:v7];
    uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    id v21 = v11;
    [v15 writeToURL:v14 options:1 error:&v21];
    id v11 = v21;

    uint64_t v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v14 absoluteString];
      uint64_t v18 = [v11 description];
      *(_DWORD *)buf = 136315650;
      long long v24 = "-[CRDocumentOutputRegion writeToFileInFolder:basename:]";
      __int16 v25 = 2112;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEFAULT, "%s: saving document output at URL %@, error = %@", buf, 0x20u);
    }
    if (v11)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = [v14 absoluteString];
    }

    goto LABEL_13;
  }
  id v22 = 0;
  char v12 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v11 = v22;
  if (v12) {
    goto LABEL_4;
  }
  uint64_t v14 = CROSLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    long long v24 = "-[CRDocumentOutputRegion writeToFileInFolder:basename:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_ERROR, "%s: Unable to create folder at URL %@: Error %@", buf, 0x20u);
  }
  uint64_t v19 = 0;
LABEL_13:

  return v19;
}

- (CROutputRegion)title
{
  return (CROutputRegion *)objc_getProperty(self, a2, 336, 1);
}

- (void)setTitle:(id)a3
{
}

- (CRTextDetectorResults)detectorResults
{
  return (CRTextDetectorResults *)objc_getProperty(self, a2, 344, 1);
}

- (void)setDetectorResults:(id)a3
{
}

- (NSString)imagePath
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setImagePath:(id)a3
{
}

- (unint64_t)documentRevision
{
  return self->_documentRevision;
}

- (void)setDocumentRevision:(unint64_t)a3
{
  self->_documentRevision = a3;
}

- (CRDocumentOutputRegionMetadata)additionalMetadata
{
  return (CRDocumentOutputRegionMetadata *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAdditionalMetadata:(id)a3
{
}

- (NSArray)cachedLayoutComponents
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCachedLayoutComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLayoutComponents, 0);
  objc_storeStrong((id *)&self->_additionalMetadata, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_detectorResults, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end