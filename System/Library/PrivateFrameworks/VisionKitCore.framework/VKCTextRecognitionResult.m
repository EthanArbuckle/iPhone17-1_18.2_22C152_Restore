@interface VKCTextRecognitionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)containsRichPasteboardElementsForRange:(id)a3;
- (BOOL)shouldShowTextMarkerForMarkerType:(int64_t)a3;
- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (CGSize)imageSize;
- (CRDocumentOutputRegion)sourceDocument;
- (CROutputRegion)crTitleOutput;
- (Class)textListClass;
- (NSArray)allLineQuads;
- (NSArray)dataDetectors;
- (NSArray)filteredNormalizedRectangleQuads;
- (NSArray)filteredTextDataDetectors;
- (NSArray)formRegions;
- (NSArray)inspectableElements;
- (NSArray)layoutComponents;
- (NSArray)mrcDataDetectors;
- (NSArray)normalizedTextLineBoundingBoxes;
- (NSArray)rectangleObservations;
- (NSArray)requestBarcodeSymbologies;
- (NSArray)requestLocales;
- (NSArray)textElements;
- (NSArray)unfilteredDataDetectors;
- (NSArray)unfilteredTextDataDetectors;
- (NSAttributedString)attributedText;
- (NSDate)creationDate;
- (NSDictionary)attributedTextRangeMapping;
- (NSDictionary)localeMap;
- (NSIndexSet)richPasteBoardIndexes;
- (NSString)buildString;
- (NSString)text;
- (NSString)title;
- (VKCImageAnalyzerRequest)request;
- (VKCTextRecognitionResult)initWithCoder:(id)a3;
- (VKCTextRecognitionResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5;
- (VKCTextRecognitionResultTextDelegate)textDelegate;
- (VKTextRange)vk_documentRange;
- (VNDocumentObservation)sourceVNDocument;
- (VNRecognizedTextBlockObservation)titleObservation;
- (id)_adjustTextRangeToSelectableRange:(id)a3;
- (id)_normalizedSelectionQuadsForRange:(id)a3;
- (id)_selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6;
- (id)adjustTextRangeToSelectableRange:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4 maxDistance:(int64_t)a5;
- (id)convertPlainTextRangeToAttributedRange:(id)a3;
- (id)createLocaleMap;
- (id)documentElements;
- (id)elementMatchingOutputRegion:(id)a3;
- (id)filterTextRectanglesFromRectangleObservations:(id)a3;
- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4;
- (id)markerFormatForListItem:(id)a3;
- (id)normalizedSelectionQuadsForRange:(id)a3;
- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5;
- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFormFields:(id)a4;
- (id)rangeOfLineForPosition:(id)a3;
- (id)rangeOfWordForPosition:(id)a3;
- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6;
- (id)smallestSelectableRangeForPosition:(id)a3;
- (id)zeroWidthStringOfLength:(unint64_t)a3;
- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3;
- (unint64_t)imageSource;
- (unint64_t)recognitionConfidence;
- (void)encodeWithCoder:(id)a3;
- (void)processListItemsItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6 textListClass:(Class)a7;
- (void)processTableItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTextRangeMapping:(id)a3;
- (void)setBuildString:(id)a3;
- (void)setCrTitleOutput:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDataDetectors:(id)a3;
- (void)setFilteredNormalizedRectangleQuads:(id)a3;
- (void)setFilteredTextDataDetectors:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageSource:(unint64_t)a3;
- (void)setInspectableElements:(id)a3;
- (void)setLocaleMap:(id)a3;
- (void)setMrcDataDetectors:(id)a3;
- (void)setNormalizedTextLineBoundingBoxes:(id)a3;
- (void)setRectangleObservations:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestBarcodeSymbologies:(id)a3;
- (void)setRequestLocales:(id)a3;
- (void)setRichPasteBoardIndexes:(id)a3;
- (void)setSourceDocument:(id)a3;
- (void)setSourceVNDocument:(id)a3;
- (void)setText:(id)a3;
- (void)setTextDelegate:(id)a3;
- (void)setTextElements:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleObservation:(id)a3;
- (void)setUnfilteredTextDataDetectors:(id)a3;
- (void)updateAttributedText;
- (void)updateMRCDataDetectors:(id)a3;
- (void)updateTextDataDetectors;
- (void)updateVNDocumentObservation:(id)a3;
@end

@implementation VKCTextRecognitionResult

- (VKCTextRecognitionResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  id v11 = a4;
  v42.receiver = self;
  v42.super_class = (Class)VKCTextRecognitionResult;
  v12 = [(VKCTextRecognitionResult *)&v42 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    uint64_t v15 = [v10 getTranscript];
    text = v12->_text;
    v12->_text = (NSString *)v15;

    v17 = [v10 getTitle];
    uint64_t v18 = [v17 getTranscript];
    title = v12->_title;
    v12->_title = (NSString *)v18;

    uint64_t v20 = [v10 getTitle];
    titleObservation = v12->_titleObservation;
    v12->_titleObservation = (VNRecognizedTextBlockObservation *)v20;

    v22 = [v10 getCRDocumentOutputRegion];
    v23 = +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:v22 shouldFilter:1];

    filteredTextDataDetectors = v12->_filteredTextDataDetectors;
    v12->_filteredTextDataDetectors = v23;
    v25 = v23;

    uint64_t v26 = [(NSArray *)v25 vk_arrayByAddingObjectsFromNonNilArray:v11];
    dataDetectors = v12->_dataDetectors;
    v12->_dataDetectors = (NSArray *)v26;

    v28 = [v10 getCRDocumentOutputRegion];
    uint64_t v29 = +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:v28 shouldFilter:0];
    unfilteredDataDetectors = v12->_unfilteredDataDetectors;
    v12->_unfilteredDataDetectors = (NSArray *)v29;

    objc_storeStrong((id *)&v12->_sourceVNDocument, a3);
    uint64_t v31 = [v10 getCRDocumentOutputRegion];
    sourceDocument = v12->_sourceDocument;
    v12->_sourceDocument = (CRDocumentOutputRegion *)v31;

    v12->_imageSize.CGFloat width = width;
    v12->_imageSize.CGFloat height = height;
    v33 = [v10 getCRDocumentOutputRegion];
    v34 = +[VKCTextElementProcessor textElementsFromCRDocumentOutputRegion:v33];

    textElements = v12->_textElements;
    v12->_textElements = v34;
    v36 = v34;

    v37 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v38 = [v37 operatingSystemVersionString];
    buildString = v12->_buildString;
    v12->_buildString = (NSString *)v38;

    id v40 = [(VKCTextRecognitionResult *)v12 normalizedTextLineBoundingBoxes];
    [(VKCTextRecognitionResult *)v12 updateInspectableElements];
    [(VKCTextRecognitionResult *)v12 updateAttributedText];
  }

  return v12;
}

- (void)updateVNDocumentObservation:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(VKCTextRecognitionResult *)self buildString];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28F80] processInfo];
    v7 = [v6 operatingSystemVersionString];
    [(VKCTextRecognitionResult *)self setBuildString:v7];
  }
  [(VKCTextRecognitionResult *)self setSourceVNDocument:v4];
  v8 = [v4 getCRDocumentOutputRegion];
  [(VKCTextRecognitionResult *)self setSourceDocument:v8];

  v9 = [v4 getTranscript];
  [(VKCTextRecognitionResult *)self setText:v9];

  id v10 = [v4 getTitle];
  id v11 = [v10 getTranscript];
  [(VKCTextRecognitionResult *)self setTitle:v11];

  v12 = [v4 getTitle];

  [(VKCTextRecognitionResult *)self setTitleObservation:v12];
  uint64_t v13 = [(VKCTextRecognitionResult *)self sourceDocument];
  v14 = +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:v13 shouldFilter:1];
  [(VKCTextRecognitionResult *)self setFilteredTextDataDetectors:v14];

  uint64_t v15 = [(VKCTextRecognitionResult *)self sourceDocument];
  v16 = +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:v15 shouldFilter:0];
  [(VKCTextRecognitionResult *)self setUnfilteredTextDataDetectors:v16];

  v17 = [(VKCTextRecognitionResult *)self sourceDocument];
  uint64_t v18 = +[VKCTextElementProcessor textElementsFromCRDocumentOutputRegion:v17];

  textElements = self->_textElements;
  self->_textElements = v18;
  uint64_t v20 = v18;

  [(VKCTextRecognitionResult *)self updateTextDataDetectors];
  [(VKCTextRecognitionResult *)self updateInspectableElements];
  [(VKCTextRecognitionResult *)self updateAttributedText];
  v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v23 = @"updatedTypes";
  v24[0] = &unk_1F357DB78;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  [v21 postNotificationName:@"VKAnalysisDidUpdateNotification" object:self userInfo:v22];
}

- (void)updateMRCDataDetectors:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [(VKCTextRecognitionResult *)self setMrcDataDetectors:a3];
  [(VKCTextRecognitionResult *)self updateTextDataDetectors];
  [(VKCTextRecognitionResult *)self updateInspectableElements];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = @"updatedTypes";
  v7[0] = &unk_1F357DB90;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 postNotificationName:@"VKAnalysisDidUpdateNotification" object:self userInfo:v5];
}

- (void)updateTextDataDetectors
{
  uint64_t v3 = [(VKCTextRecognitionResult *)self filteredTextDataDetectors];
  id v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  id v8 = [(VKCTextRecognitionResult *)self mrcDataDetectors];
  v7 = objc_msgSend(v6, "vk_arrayByAddingObjectsFromNonNilArray:", v8);

  [(VKCTextRecognitionResult *)self setDataDetectors:v7];
}

- (NSArray)normalizedTextLineBoundingBoxes
{
  normalizedTextLineBoundingBoxes = self->_normalizedTextLineBoundingBoxes;
  if (!normalizedTextLineBoundingBoxes)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(VKCTextRecognitionResult *)self sourceVNDocument];
    id v6 = [(VKCTextRecognitionResult *)self sourceVNDocument];
    v7 = [v6 getTranscript];
    uint64_t v8 = objc_msgSend(v7, "vk_range");
    id v10 = objc_msgSend(v5, "textBlockWithCharacterRange:", v8, v9);

    id v11 = [v10 getLines];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__VKCTextRecognitionResult_normalizedTextLineBoundingBoxes__block_invoke;
    v16[3] = &unk_1E6BF2478;
    id v17 = v4;
    id v12 = v4;
    [v11 enumerateObjectsUsingBlock:v16];

    uint64_t v13 = (NSArray *)[v12 copy];
    v14 = self->_normalizedTextLineBoundingBoxes;
    self->_normalizedTextLineBoundingBoxes = v13;

    normalizedTextLineBoundingBoxes = self->_normalizedTextLineBoundingBoxes;
  }
  return normalizedTextLineBoundingBoxes;
}

void __59__VKCTextRecognitionResult_normalizedTextLineBoundingBoxes__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F29238];
  id v5 = [a2 vkQuad];
  [v5 boundingBox];
  id v4 = objc_msgSend(v3, "vk_valueWithRect:");
  [v2 addObject:v4];
}

- (NSArray)layoutComponents
{
  v2 = [(VKCTextRecognitionResult *)self sourceDocument];
  uint64_t v3 = [v2 layoutComponents];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)updateAttributedText
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VKCTextRecognitionResult *)self sourceDocument];
  id v4 = [v3 layoutComponents];
  id v5 = [v3 text];
  if (v5)
  {
    uint64_t v18 = v5;
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v19 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v3 rangeOfContentRegion:v12];
          uint64_t v15 = v14;
          uint64_t v16 = [v12 type];
          if (v16 == 256)
          {
            -[VKCTextRecognitionResult processListItemsItem:regionRange:indexSet:attributedString:textListClass:](self, "processListItemsItem:regionRange:indexSet:attributedString:textListClass:", v12, v13, v15, v6, v20, [(VKCTextRecognitionResult *)self textListClass]);
          }
          else if (v16 == 64)
          {
            if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
              +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "regionRange.location != NSNotFound", "-[VKCTextRecognitionResult updateAttributedText]", 0, 0, @"found NSNotFound processing table region");
            }
            else {
              -[VKCTextRecognitionResult processTableItem:regionRange:indexSet:attributedString:](self, "processTableItem:regionRange:indexSet:attributedString:", v12, v13, v15, v6, v20);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v17 = (void *)[v6 copy];
    [(VKCTextRecognitionResult *)self setRichPasteBoardIndexes:v17];

    [(VKCTextRecognitionResult *)self setAttributedText:v20];
    id v5 = v18;
    id v4 = v19;
  }
}

- (Class)textListClass
{
  return NSClassFromString(&cfstr_Nstextlist.isa);
}

- (void)processTableItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6
{
  NSUInteger location = a4.location;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  uint64_t v10 = objc_opt_class();
  v52 = v8;
  id v11 = VKCheckedDynamicCast(v10, (uint64_t)v8);
  id v12 = [v11 cells];
  id v13 = objc_alloc_init(MEMORY[0x1E4F426B0]);
  v48 = v11;
  uint64_t v14 = [v11 colQuads];
  v51 = v13;
  objc_msgSend(v13, "setNumberOfColumns:", objc_msgSend(v14, "count"));

  uint64_t v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v12 count];
    id v17 = [(VKCTextRecognitionResult *)self request];
    *(_DWORD *)buf = 134218240;
    uint64_t v62 = v16;
    __int16 v63 = 1024;
    int v64 = [v17 requestID];
    _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, "Beginning tableProcessing with cellCount: %lu, id: %d", buf, 0x12u);
  }
  v47 = self;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v60 count:16];
  id obj = v18;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v54;
    uint64_t v22 = *MEMORY[0x1E4F42540];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend(v24, "colRange", v47);
        uint64_t v27 = v26;
        uint64_t v28 = [v24 rowRange];
        v30 = (void *)[objc_alloc(MEMORY[0x1E4F426B8]) initWithTable:v51 startingRow:v28 rowSpan:v29 startingColumn:v25 columnSpan:v27];
        uint64_t v31 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
        v32 = (void *)[v31 mutableCopy];

        v59 = v30;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        [v32 setTextBlocks:v33];

        uint64_t v34 = [v52 rangeOfContentRegion:v24] + location;
        uint64_t v36 = v35 + 1;
        uint64_t v37 = objc_msgSend(v9, "vk_range");
        uint64_t v39 = VKMClampRange(v34, v36, v37, v38);
        uint64_t v41 = v40;
        uint64_t v57 = v22;
        v58 = v32;
        objc_super v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        objc_msgSend(v9, "setAttributes:range:", v42, v39, v41);
      }
      id v18 = obj;
      uint64_t v20 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v20);
  }

  v43 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v18 count];
    v45 = [(VKCTextRecognitionResult *)v47 request];
    int v46 = [v45 requestID];
    *(_DWORD *)buf = 134218240;
    uint64_t v62 = v44;
    __int16 v63 = 1024;
    int v64 = v46;
    _os_log_impl(&dword_1DB266000, v43, OS_LOG_TYPE_DEFAULT, "Table processing complete with cellCount: %lu, id: %d", buf, 0x12u);

    id v18 = obj;
  }
}

- (void)processListItemsItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6 textListClass:(Class)a7
{
  NSUInteger location = a4.location;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v51 = a5;
  id v10 = a6;
  uint64_t v11 = objc_opt_class();
  v52 = v9;
  id v12 = VKCheckedDynamicCast(v11, (uint64_t)v9);
  id v13 = [v12 items];

  uint64_t v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v13 count];
    uint64_t v16 = [(VKCTextRecognitionResult *)self request];
    *(_DWORD *)buf = 134218240;
    uint64_t v67 = v15;
    __int16 v68 = 1024;
    int v69 = [v16 requestID];
    _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_DEFAULT, "Beginning list with itemCount: %lu, id: %d", buf, 0x12u);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v17 = v13;
  uint64_t v53 = [v17 countByEnumeratingWithState:&v58 objects:v65 count:16];
  id v18 = 0;
  if (v53)
  {
    uint64_t v49 = *(void *)v59;
    uint64_t v55 = *MEMORY[0x1E4F42540];
    id obj = v17;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v59 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v21 = [(VKCTextRecognitionResult *)self markerFormatForListItem:v20];
        uint64_t v22 = [v18 markerFormat];
        char v23 = [v22 isEqualToString:v21];

        if (v23)
        {
          uint64_t v57 = v18;
        }
        else
        {
          uint64_t v24 = [[a7 alloc] initWithMarkerFormat:v21 options:0];

          uint64_t v57 = (void *)v24;
        }
        uint64_t v25 = [v52 rangeOfContentRegion:v20] + location;
        uint64_t v27 = v26 + 1;
        uint64_t v28 = objc_msgSend(v10, "vk_range");
        uint64_t v30 = VKMClampRange(v25, v27, v28, v29);
        uint64_t v32 = v31;
        uint64_t v54 = [v20 markerRange];
        uint64_t v34 = v33;
        id v35 = v10;
        uint64_t v36 = objc_msgSend(v10, "attributesAtIndex:longestEffectiveRange:inRange:", v30, 0, v30, v32);
        uint64_t v37 = [v36 objectForKeyedSubscript:v55];
        uint64_t v38 = (void *)[v37 mutableCopy];

        if (!v38)
        {
          uint64_t v39 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
          uint64_t v38 = (void *)[v39 mutableCopy];
        }
        int v64 = v57;
        uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
        [v38 setTextLists:v40];

        id v10 = v35;
        if (!-[VKCTextRecognitionResult shouldShowTextMarkerForMarkerType:](self, "shouldShowTextMarkerForMarkerType:", [v20 markerType]))
        {
          uint64_t v41 = [(VKCTextRecognitionResult *)self zeroWidthStringOfLength:v34];
          objc_msgSend(v10, "replaceCharactersInRange:withString:", v54 + v30, v34, v41);
        }
        uint64_t v62 = v55;
        __int16 v63 = v38;
        objc_super v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        objc_msgSend(v10, "addAttributes:range:", v42, v30, v32);

        objc_msgSend(v51, "addIndexesInRange:", v30, v32);
        id v18 = v57;
      }
      id v17 = obj;
      uint64_t v53 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v53);
  }

  v43 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v17 count];
    v45 = [(VKCTextRecognitionResult *)self request];
    int v46 = [v45 requestID];
    *(_DWORD *)buf = 134218240;
    uint64_t v67 = v44;
    __int16 v68 = 1024;
    int v69 = v46;
    _os_log_impl(&dword_1DB266000, v43, OS_LOG_TYPE_DEFAULT, "List processing complete with itemCount: %lu, id: %D", buf, 0x12u);
  }
}

- (BOOL)containsRichPasteboardElementsForRange:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(VKCTextRecognitionResult *)self richPasteBoardIndexes];
  id v6 = [v4 rangeArray];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__VKCTextRecognitionResult_containsRichPasteboardElementsForRange___block_invoke;
  v9[3] = &unk_1E6BF24A0;
  uint64_t v11 = &v12;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

uint64_t __67__VKCTextRecognitionResult_containsRichPasteboardElementsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 nsRange];
  uint64_t result = objc_msgSend(v6, "containsIndexesInRange:", v7, v8);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)zeroWidthStringOfLength:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 6)
  {
    id v4 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    do
    {
      [(__CFString *)v4 appendString:@"🎛"];
      --v3;
    }
    while (v3);
  }
  else
  {
    id v4 = off_1E6BF2658[a3];
  }
  return v4;
}

- (BOOL)shouldShowTextMarkerForMarkerType:(int64_t)a3
{
  return a3 == 7;
}

- (id)markerFormatForListItem:(id)a3
{
  uint64_t v3 = [a3 markerType];
  if ((unint64_t)(v3 - 2) > 4) {
    id v4 = (void **)MEMORY[0x1E4F42598];
  }
  else {
    id v4 = (void **)qword_1E6BF2688[v3 - 2];
  }
  id v5 = *v4;
  return v5;
}

- (id)convertPlainTextRangeToAttributedRange:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)documentElements
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  id v5 = [(VKCTextRecognitionResult *)self buildString];
  id v6 = [v4 stringWithFormat:@"Build: %@", v5];
  uint64_t v7 = +[VKCElementInfo infoWithText:v6 parent:0];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [(VKCTextRecognitionResult *)self creationDate];
  id v10 = objc_msgSend(v9, "vk_localDateWithSeconds");
  uint64_t v11 = [v8 stringWithFormat:@"Date: %@", v10];
  uint64_t v12 = +[VKCElementInfo infoWithText:v11 parent:0];
  [v3 addObject:v12];

  id v13 = NSString;
  [(VKCTextRecognitionResult *)self imageSize];
  uint64_t v16 = VKMUIStringForSize(v14, v15);
  id v17 = [v13 stringWithFormat:@"ImageSize: %@", v16];
  id v18 = +[VKCElementInfo infoWithText:v17 parent:0];
  [v3 addObject:v18];

  uint64_t v19 = NSString;
  [(VKCTextRecognitionResult *)self imageSize];
  uint64_t v22 = objc_msgSend(v19, "stringWithFormat:", @"ImageAspectRatio: %g", VKMAspectRatio(v20, v21));
  char v23 = +[VKCElementInfo infoWithText:v22 parent:0];
  [v3 addObject:v23];

  uint64_t v24 = [(VKCTextRecognitionResult *)self requestLocales];
  uint64_t v25 = objc_msgSend(v24, "vk_compactMap:", &__block_literal_global_15);

  if (v25) {
    +[VKCElementCollection collectionWithTitle:@"Locales" children:v25 parent:0];
  }
  else {
  uint64_t v26 = +[VKCElementInfo infoWithText:@"Locales (None - Default)" parent:0];
  }
  [v3 addObject:v26];

  uint64_t v27 = [(VKCTextRecognitionResult *)self requestBarcodeSymbologies];
  uint64_t v28 = objc_msgSend(v27, "vk_compactMap:", &__block_literal_global_154);

  if (v28) {
    +[VKCElementCollection collectionWithTitle:@"Barcode Symbologies" children:v28 parent:0];
  }
  else {
  uint64_t v29 = +[VKCElementInfo infoWithText:@"Barcode Symbologies (None - Default)" parent:0];
  }
  [v3 addObject:v29];

  uint64_t v30 = (void *)[v3 copy];
  return v30;
}

VKCElementInfo *__44__VKCTextRecognitionResult_documentElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCElementInfo infoWithText:a2 parent:0];
}

VKCElementInfo *__44__VKCTextRecognitionResult_documentElements__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[VKCElementInfo infoWithText:a2 parent:0];
}

- (NSDictionary)localeMap
{
  localeMap = self->_localeMap;
  if (!localeMap)
  {
    id v4 = [(VKCTextRecognitionResult *)self createLocaleMap];
    id v5 = self->_localeMap;
    self->_localeMap = v4;

    localeMap = self->_localeMap;
  }
  return localeMap;
}

- (id)createLocaleMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VKCTextRecognitionResult *)self sourceDocument];
  id v5 = [(VKCTextRecognitionResult *)self sourceDocument];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__VKCTextRecognitionResult_createLocaleMap__block_invoke;
  v11[3] = &unk_1E6BF24E8;
  id v6 = v3;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [v5 enumerateContentsWithTypes:8 usingBlock:v11];

  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __43__VKCTextRecognitionResult_createLocaleMap__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 recognizedLocale];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
    uint64_t v5 = [*(id *)(a1 + 40) rangeOfContentRegion:v7];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "addIndexesInRange:", v5, v6);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCTextRecognitionResult *)self dataDetectors];
  objc_msgSend(v5, "vk_objectsPassingTest:", &__block_literal_global_165);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  [v4 encodeObject:v6 forKey:@"sourceDocument"];

  [v4 encodeObject:v14 forKey:@"MRCDD"];
  [(VKCTextRecognitionResult *)self imageSize];
  *(float *)&double v7 = v7;
  [v4 encodeFloat:@"imageWidth" forKey:v7];
  [(VKCTextRecognitionResult *)self imageSize];
  *(float *)&double v9 = v8;
  [v4 encodeFloat:@"imageHeight" forKey:v9];
  id v10 = [(VKCTextRecognitionResult *)self buildString];
  [v4 encodeObject:v10 forKey:@"build"];

  uint64_t v11 = [(VKCTextRecognitionResult *)self creationDate];
  [v4 encodeObject:v11 forKey:@"date"];

  id v12 = [(VKCTextRecognitionResult *)self requestBarcodeSymbologies];
  [v4 encodeObject:v12 forKey:@"barcodeSymbologies"];

  id v13 = [(VKCTextRecognitionResult *)self requestLocales];
  [v4 encodeObject:v13 forKey:@"locales"];
}

uint64_t __44__VKCTextRecognitionResult_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMRCDataDetector];
}

- (VKCTextRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDocument"];
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MRCDD"];
  [v4 decodeFloatForKey:@"imageWidth"];
  double v7 = v6;
  [v4 decodeFloatForKey:@"imageHeight"];
  double v9 = v8;
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  id v12 = -[VKCTextRecognitionResult initWithDocumentObservation:mrcDataDetectors:imageSize:](self, "initWithDocumentObservation:mrcDataDetectors:imageSize:", v22, v5, v7, v9);
  [(VKCTextRecognitionResult *)v12 setCreationDate:v10];
  [(VKCTextRecognitionResult *)v12 setBuildString:v11];
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  double v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"locales"];
  [(VKCTextRecognitionResult *)v12 setRequestLocales:v16];

  id v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  double v20 = [v4 decodeObjectOfClasses:v19 forKey:@"barcodeSymbologies"];

  [(VKCTextRecognitionResult *)v12 setRequestBarcodeSymbologies:v20];
  [(VKCTextRecognitionResult *)v12 updateInspectableElements];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)elementMatchingOutputRegion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(VKCTextRecognitionResult *)self inspectableElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) recursiveSearchForCROutputRegion:v4];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3
{
  id v4 = [(VKCTextRecognitionResult *)self dataDetectors];
  uint64_t v5 = v4;
  if (a3 == -1)
  {
    uint64_t v6 = [v4 count];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__VKCTextRecognitionResult_countOfDataDetectorsWithTypes___block_invoke;
    v9[3] = &__block_descriptor_40_e43_B32__0__VKCBaseDataDetectorElement_8Q16_B24l;
    void v9[4] = a3;
    uint64_t v6 = objc_msgSend(v4, "vk_countOfObjectsPassingTest:", v9);
  }
  unint64_t v7 = v6;

  return v7;
}

BOOL __58__VKCTextRecognitionResult_countOfDataDetectorsWithTypes___block_invoke(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & ~[a2 dataDetectorTypes]) == 0;
}

- (NSArray)allLineQuads
{
  v2 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  id v3 = objc_msgSend(v2, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);

  id v4 = objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_171);

  return (NSArray *)v4;
}

uint64_t __40__VKCTextRecognitionResult_allLineQuads__block_invoke(uint64_t a1, void *a2)
{
  return [a2 vkQuad];
}

- (void)setRectangleObservations:(id)a3
{
  objc_storeStrong((id *)&self->_rectangleObservations, a3);
  id v5 = a3;
  id v6 = [(VKCTextRecognitionResult *)self filterTextRectanglesFromRectangleObservations:self->_rectangleObservations];

  [(VKCTextRecognitionResult *)self setFilteredNormalizedRectangleQuads:v6];
}

- (id)filterTextRectanglesFromRectangleObservations:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(VKCTextRecognitionResult *)self sourceDocument];
    id v6 = [v5 boundingQuad];
    [v6 normalizationSize];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke;
    v14[3] = &unk_1E6BF2578;
    uint64_t v16 = v8;
    uint64_t v17 = v10;
    id v15 = v5;
    id v11 = v5;
    id v12 = objc_msgSend(v4, "vk_compactMap:", v14);
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

id __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 vkQuad];
  id v5 = objc_alloc(MEMORY[0x1E4FAF188]);
  [v4 topLeft];
  double v7 = v6;
  double v9 = v8;
  [v4 topRight];
  double v11 = v10;
  double v13 = v12;
  [v4 bottomRight];
  double v15 = v14;
  double v17 = v16;
  [v4 bottomLeft];
  double v20 = objc_msgSend(v5, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v7, v9, v11, v13, v15, v17, v18, v19, *(void *)(a1 + 40), *(void *)(a1 + 48));
  double v21 = [*(id *)(a1 + 32) outputRegionWithContentsOfQuad:v20];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  [v4 area];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke_2;
  v26[3] = &unk_1E6BF2550;
  v26[6] = v22;
  v26[7] = 0x3FD999999999999ALL;
  v26[4] = v27;
  v26[5] = &v28;
  [v21 enumerateContentsWithTypes:8 usingBlock:v26];
  if (*((unsigned char *)v29 + 24)) {
    char v23 = 0;
  }
  else {
    char v23 = v4;
  }
  id v24 = v23;
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

  return v24;
}

void __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 boundingQuad];
  id v7 = [v5 vkQuad];

  [v7 area];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) / *(double *)(a1 + 48) > *(double *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (VKTextRange)vk_documentRange
{
  id v3 = [VKTextRange alloc];
  id v4 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  id v5 = [v4 getTranscript];
  uint64_t v6 = objc_msgSend(v5, "vk_range");
  double v8 = -[VKTextRange initWithRange:](v3, "initWithRange:", v6, v7);

  return v8;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  id v4 = a3;
  if ([v4 containsMultipleRanges])
  {
    id v5 = [v4 rangeArray];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__VKCTextRecognitionResult_adjustTextRangeToSelectableRange___block_invoke;
    v9[3] = &unk_1E6BF25A0;
    void v9[4] = self;
    objc_msgSend(v5, "vk_compactMap:", v9);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = +[VKTextRange rangeWithVKRanges:v4];
  }
  else
  {
    uint64_t v6 = [(VKCTextRecognitionResult *)self _adjustTextRangeToSelectableRange:v4];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

uint64_t __61__VKCTextRecognitionResult_adjustTextRangeToSelectableRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustTextRangeToSelectableRange:a2];
}

- (id)_adjustTextRangeToSelectableRange:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (VKTextRange *)a3;
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v6 = [(VKTextRange *)v4 start];
  uint64_t v7 = [(VKTextRange *)v4 end];
  double v8 = [(VKCTextRecognitionResult *)self text];
  if (![v8 length])
  {
    double v15 = v4;
    goto LABEL_19;
  }
  NSUInteger v9 = objc_msgSend(v8, "vk_range");
  NSUInteger v11 = v10;
  unint64_t v12 = [v6 offset];
  if (VKMRangeContainsIndex(v9, v11, v12))
  {
    if ((objc_msgSend(v5, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v12)) & 1) == 0)
    {
      double v13 = [(VKCTextRecognitionResult *)self smallestSelectableRangeForPosition:v6];
      uint64_t v14 = [v13 start];

      uint64_t v6 = (void *)v14;
    }
  }
  else
  {
    double v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v6 offset];
      v37.NSUInteger location = v9;
      v37.length = v11;
      uint64_t v22 = NSStringFromRange(v37);
      uint64_t v28 = [(VKCTextRecognitionResult *)self request];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v27;
      __int16 v31 = 2112;
      uint64_t v32 = v22;
      __int16 v33 = 1024;
      int v34 = [v28 requestID];
      _os_log_error_impl(&dword_1DB266000, v16, OS_LOG_TYPE_ERROR, "AdjustTextRange, but the start offset is outside of the text's total range. StartOffset:%lu range %@, id: %d", buf, 0x1Cu);
    }
  }
  unint64_t v17 = [v7 offset];
  uint64_t v18 = [v8 length];
  if (v17 >= v18 - 1) {
    unint64_t v17 = v18 - 1;
  }
  if (!VKMRangeContainsIndex(v9, v11, v17))
  {
    double v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [v7 offset];
      v38.NSUInteger location = v9;
      v38.length = v11;
      id v24 = NSStringFromRange(v38);
      uint64_t v25 = [(VKCTextRecognitionResult *)self request];
      int v26 = [v25 requestID];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      uint64_t v32 = v24;
      __int16 v33 = 1024;
      int v34 = v26;
      _os_log_error_impl(&dword_1DB266000, v20, OS_LOG_TYPE_ERROR, "AdjustTextRange, but the end offset is outside of the text's total range. endOffset:%lu range %@, id: %d", buf, 0x1Cu);
    }
    double v19 = v20;
    goto LABEL_17;
  }
  if ((objc_msgSend(v5, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v17)) & 1) == 0)
  {
    double v19 = [(VKCTextRecognitionResult *)self smallestSelectableRangeForPosition:v7];
    [v19 end];
    v7 = double v20 = v7;
LABEL_17:
  }
  double v15 = [[VKTextRange alloc] initWithStart:v6 end:v7];

LABEL_19:
  return v15;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCTextRecognitionResult *)self sourceDocument];
  unint64_t v6 = [v4 offset];

  uint64_t v7 = [(VKCTextRecognitionResult *)self text];
  unint64_t v8 = [v7 length] - 1;

  if (v6 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  NSUInteger v10 = [v5 contentRegionOfType:48 containingTextAtIndex:v9];
  if (v10)
  {
    uint64_t v11 = [v5 rangeOfContentRegion:v10];
    double v13 = -[VKTextRange initWithRange:]([VKTextRange alloc], "initWithRange:", v11, v12);
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((region) != nil)", "-[VKCTextRecognitionResult smallestSelectableRangeForPosition:]", 0, 0, @"Expected non-nil value for '%s'", "region");
    double v13 = 0;
  }

  return v13;
}

- (id)rangeOfWordForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  unint64_t v6 = [v4 offset];

  uint64_t v7 = [(VKCTextRecognitionResult *)self text];
  unint64_t v8 = [v7 length] - 1;

  if (v6 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  NSUInteger v10 = [v5 textBlockOfTypes:16 containingTextAtIndex:v9];
  uint64_t v11 = [v5 rangeOfTextBlock:v10];
  double v13 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v11, v12);

  return v13;
}

- (id)rangeOfLineForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  unint64_t v6 = [v4 offset];

  uint64_t v7 = [(VKCTextRecognitionResult *)self text];
  unint64_t v8 = [v7 length] - 1;

  if (v6 >= v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v6;
  }
  NSUInteger v10 = [v5 textBlockOfTypes:8 containingTextAtIndex:v9 & ~(v9 >> 63)];
  uint64_t v11 = [v5 rangeOfTextBlock:v10];
  double v13 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v11, v12);

  return v13;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(VKCTextRecognitionResult *)self vk_documentRange];
  uint64_t v7 = -[VKCTextRecognitionResult closestPositionToPoint:withinRange:maxDistance:](self, "closestPositionToPoint:withinRange:maxDistance:", v6, 0, x, y);

  if (v7)
  {
    unint64_t v8 = [(VKCTextRecognitionResult *)self smallestSelectableRangeForPosition:v7];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return -[VKCTextRecognitionResult closestPositionToPoint:withinRange:maxDistance:](self, "closestPositionToPoint:withinRange:maxDistance:", a4, 0x7FFFFFFFFFFFFFFFLL, a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4 maxDistance:(int64_t)a5
{
  id v7 = a4;
  VKMFlipPoint();
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  double v13 = objc_msgSend(v12, "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", 48, a5, v9, v11);
  uint64_t v14 = objc_msgSend(v13, "vk_textBlock");

  if (v14
    && (uint64_t v15 = [v7 nsRange],
        uint64_t v17 = v16,
        uint64_t v18 = [v12 rangeOfTextBlock:v14],
        uint64_t v20 = VKMClampRange(v18, v19, v15, v17),
        v20 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v23 = v20;
    uint64_t v24 = v21;
    uint64_t v25 = [(VKCTextRecognitionResult *)self textDelegate];

    if (v25)
    {
      int v26 = [(VKCTextRecognitionResult *)self textDelegate];
      uint64_t v27 = [v26 selectedRangeForTextRecognitionResult:self];
      uint64_t v36 = [v27 nsRange];
      uint64_t v29 = v28;

      uint64_t v30 = [(VKCTextRecognitionResult *)self textDelegate];
      __int16 v31 = [v30 preSelectionChangeSelectedRangeForTextRecognitionResult:self];

      uint64_t v32 = [(VKCTextRecognitionResult *)self textDelegate];
      uint64_t v33 = [v32 draggedRectEdgeForTextRecognitionResult:self];

      uint64_t v34 = v23 + v24;
      if (v36 == v23 && v29 == v24 || v34 < 1 || v36 + v29 > (unint64_t)v34 || !v29)
      {
        if (v33 == 2)
        {
          if (v23 <= [v31 endOffset]) {
            uint64_t v33 = 2;
          }
          else {
            uint64_t v33 = 8;
          }
        }
        else if (v33 == 8)
        {
          if (v23 >= [v31 startOffset]) {
            uint64_t v33 = 8;
          }
          else {
            uint64_t v33 = 2;
          }
        }
        if (v33 != 8) {
          uint64_t v34 = v23;
        }
      }
    }
    else
    {
      uint64_t v34 = v23;
    }
    uint64_t v22 = [[VKTextPosition alloc] initWithOffset:v34];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4
{
  VKMFlipPoint();
  double v7 = v6;
  double v9 = v8;
  double v10 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  double v11 = objc_msgSend(v10, "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", a3, 0x7FFFFFFFFFFFFFFFLL, v7, v9);

  return v11;
}

- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  double v13 = [(VKCTextRecognitionResult *)self sourceVNDocument];
  uint64_t v14 = [v12 nsRange];
  uint64_t v16 = v15;

  uint64_t v17 = objc_msgSend(v13, "textBlockWithCharacterRange:", v14, v16);

  uint64_t v18 = [v17 vkQuad];
  uint64_t v19 = objc_msgSend(v18, "quadByConvertingFromNormalizedRectToView:contentsRect:", v11, x, y, width, height);

  [v19 boundingBox];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  return -[VKCTextRecognitionResult selectionRectsForRange:documentView:contentRect:addTranscript:](self, "selectionRectsForRange:documentView:contentRect:addTranscript:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a4;
  id v14 = a3;
  if ([v14 containsMultipleRanges])
  {
    uint64_t v15 = [v14 rangeArray];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__VKCTextRecognitionResult_selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke;
    v18[3] = &unk_1E6BF25C8;
    v18[4] = self;
    id v19 = v13;
    double v20 = x;
    double v21 = y;
    double v22 = width;
    double v23 = height;
    BOOL v24 = v6;
    uint64_t v16 = objc_msgSend(v15, "vk_flatMap:", v18);
  }
  else
  {
    uint64_t v16 = -[VKCTextRecognitionResult _selectionRectsForRange:documentView:contentRect:addTranscript:](self, "_selectionRectsForRange:documentView:contentRect:addTranscript:", v14, v13, v6, x, y, width, height);
  }
  return v16;
}

uint64_t __90__VKCTextRecognitionResult_selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectionRectsForRange:documentView:contentRect:addTranscript:", a2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  if ([v13 isEmpty])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v16 = [(VKCTextRecognitionResult *)self sourceVNDocument];
    uint64_t v17 = [v13 nsRange];
    id v19 = objc_msgSend(v16, "textBlockWithCharacterRange:", v17, v18);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v21 = [v19 getLines];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke;
    v26[3] = &unk_1E6BF25F0;
    CGFloat v29 = x;
    CGFloat v30 = y;
    CGFloat v31 = width;
    CGFloat v32 = height;
    BOOL v33 = a6;
    id v27 = v14;
    id v28 = v20;
    id v22 = v20;
    [v21 enumerateObjectsUsingBlock:v26];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke_2;
    v24[3] = &__block_descriptor_33_e14__32__0_8q16q24l;
    BOOL v25 = a6;
    uint64_t v15 = objc_msgSend(v22, "vk_compactMap:", v24);
  }
  return v15;
}

void __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 vkQuad];
  id v4 = objc_msgSend(v3, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  id v5 = [v8 getCROutputRegion];
  objc_msgSend(v4, "setLayoutDirection:", objc_msgSend(v5, "layoutDirection"));

  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v6 = objc_alloc_init(VKCQuadTranscriptTuple);
    [(VKCQuadTranscriptTuple *)v6 setQuad:v4];
    double v7 = [v8 getTranscript];
    [(VKCQuadTranscriptTuple *)v6 setTranscript:v7];

    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

VKTextSelectionRect *__91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v9 = objc_opt_class();
    double v10 = VKDynamicCast(v9, (uint64_t)v8);
    id v11 = [v10 quad];
    id v12 = [v10 transcript];
  }
  else
  {
    id v11 = v7;
    id v12 = 0;
  }
  BOOL v13 = a3 == 0;
  BOOL v14 = a3 == a4;
  [v11 boundingBox];
  uint64_t v15 = objc_msgSend(v11, "quadFromSubtractingPoint:");
  uint64_t v16 = [VKTextSelectionRect alloc];
  [v11 boundingBox];
  double v21 = -[VKTextSelectionRect initWithRect:containsStart:containsEnd:layoutDirection:quad:](v16, "initWithRect:containsStart:containsEnd:layoutDirection:quad:", v13, v14, [v11 layoutDirection], v15, v17, v18, v19, v20);
  id v22 = v21;
  if (*(unsigned char *)(a1 + 32)) {
    [(VKTextSelectionRect *)v21 set_transcript:v12];
  }

  return v22;
}

- (id)normalizedSelectionQuadsForRange:(id)a3
{
  id v4 = a3;
  if ([v4 containsMultipleRanges])
  {
    id v5 = [v4 rangeArray];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__VKCTextRecognitionResult_normalizedSelectionQuadsForRange___block_invoke;
    v8[3] = &unk_1E6BF2638;
    v8[4] = self;
    BOOL v6 = objc_msgSend(v5, "vk_flatMap:", v8);
  }
  else
  {
    BOOL v6 = [(VKCTextRecognitionResult *)self _normalizedSelectionQuadsForRange:v4];
  }
  return v6;
}

uint64_t __61__VKCTextRecognitionResult_normalizedSelectionQuadsForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _normalizedSelectionQuadsForRange:a2];
}

- (id)_normalizedSelectionQuadsForRange:(id)a3
{
  id v4 = a3;
  if ([v4 containsMultipleRanges])
  {
    id v5 = [(VKCTextRecognitionResult *)self request];
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!range.containsMultipleRanges", "-[VKCTextRecognitionResult _normalizedSelectionQuadsForRange:]", 0, 0, @"_normalizedSelectionQuadsForRange being sent a range with multiple ranges id: %d", [v5 requestID]);
  }
  if ([v4 isEmpty])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v7 = [(VKCTextRecognitionResult *)self sourceVNDocument];
    uint64_t v8 = [v4 nsRange];
    double v10 = objc_msgSend(v7, "textBlockWithCharacterRange:", v8, v9);
    id v11 = [v10 getLines];
    BOOL v6 = objc_msgSend(v11, "vk_compactMap:", &__block_literal_global_194);
  }
  return v6;
}

uint64_t __62__VKCTextRecognitionResult__normalizedSelectionQuadsForRange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vkQuad];
}

- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [(CRDocumentOutputRegion *)self->_sourceDocument detectedFieldRegionsExcludingFields:a3 updateExcludedFields:a4];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    unint64_t v7 = 0;
    *(void *)&long long v6 = 136315394;
    long long v14 = v6;
    do
    {
      uint64_t v8 = objc_msgSend(v4, "objectAtIndexedSubscript:", v7, v14);
      uint64_t v9 = [[VKCFormRegion alloc] initWithSourceRegion:v8];
      double v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [(VKCFormRegion *)v9 debugDescription];
        uint64_t v16 = [v17 UTF8String];
        id v11 = [(VKCTextRecognitionResult *)self request];
        int v12 = [v11 requestID];
        *(_DWORD *)buf = v14;
        uint64_t v19 = v16;
        __int16 v20 = 1024;
        int v21 = v12;
        _os_log_debug_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEBUG, "Adding form region %s, id: %d", buf, 0x12u);
      }
      [v5 addObject:v9];

      ++v7;
    }
    while ([v4 count] > v7);
  }

  return v5;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "crFormFieldWithSize:", width, height, (void)v21);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  double v18 = -[CRDocumentOutputRegion proposedFieldForPoint:existingFields:](self->_sourceDocument, "proposedFieldForPoint:existingFields:", v11, x, y);
  if (v18) {
    uint64_t v19 = [[VKCFormRegion alloc] initWithSourceRegion:v18];
  }
  else {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFormFields:(id)a4
{
  id v4 = -[CRDocumentOutputRegion proposedFieldForPoint:existingFields:](self->_sourceDocument, "proposedFieldForPoint:existingFields:", a4, a3.x, a3.y);
  if (v4) {
    id v5 = [[VKCFormRegion alloc] initWithSourceRegion:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)formRegions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(CRDocumentOutputRegion *)self->_sourceDocument contentsWithTypes:0x2000];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  if ([v2 count])
  {
    unint64_t v5 = 0;
    *(void *)&long long v4 = 136315394;
    long long v12 = v4;
    do
    {
      long long v6 = objc_msgSend(v2, "objectAtIndexedSubscript:", v5, v12);
      unint64_t v7 = [[VKCFormRegion alloc] initWithSourceRegion:v6];
      uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [(VKCFormRegion *)v7 debugDescription];
        uint64_t v14 = [v15 UTF8String];
        uint64_t v9 = [(VKCTextRecognitionResult *)self request];
        int v10 = [v9 requestID];
        *(_DWORD *)buf = v12;
        uint64_t v17 = v14;
        __int16 v18 = 1024;
        int v19 = v10;
        _os_log_debug_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEBUG, "Adding form region %s, id: %d", buf, 0x12u);
      }
      [v3 addObject:v7];

      ++v5;
    }
    while ([v2 count] > v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)recognitionConfidence
{
  int v2 = [(CRDocumentOutputRegion *)self->_sourceDocument formness];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (VKCImageAnalyzerRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (VKCTextRecognitionResultTextDelegate)textDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textDelegate);
  return (VKCTextRecognitionResultTextDelegate *)WeakRetained;
}

- (void)setTextDelegate:(id)a3
{
}

- (CRDocumentOutputRegion)sourceDocument
{
  return self->_sourceDocument;
}

- (void)setSourceDocument:(id)a3
{
}

- (VNDocumentObservation)sourceVNDocument
{
  return self->_sourceVNDocument;
}

- (void)setSourceVNDocument:(id)a3
{
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(unint64_t)a3
{
  self->_imageSource = a3;
}

- (NSArray)textElements
{
  return self->_textElements;
}

- (void)setTextElements:(id)a3
{
}

- (NSArray)dataDetectors
{
  return self->_dataDetectors;
}

- (void)setDataDetectors:(id)a3
{
}

- (NSArray)unfilteredDataDetectors
{
  return self->_unfilteredDataDetectors;
}

- (NSArray)inspectableElements
{
  return self->_inspectableElements;
}

- (void)setInspectableElements:(id)a3
{
}

- (void)setNormalizedTextLineBoundingBoxes:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (NSDictionary)attributedTextRangeMapping
{
  return self->_attributedTextRangeMapping;
}

- (void)setAttributedTextRangeMapping:(id)a3
{
}

- (NSArray)requestLocales
{
  return self->_requestLocales;
}

- (void)setRequestLocales:(id)a3
{
}

- (NSArray)requestBarcodeSymbologies
{
  return self->_requestBarcodeSymbologies;
}

- (void)setRequestBarcodeSymbologies:(id)a3
{
}

- (void)setLocaleMap:(id)a3
{
}

- (NSArray)rectangleObservations
{
  return self->_rectangleObservations;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  return self->_filteredNormalizedRectangleQuads;
}

- (void)setFilteredNormalizedRectangleQuads:(id)a3
{
}

- (NSArray)mrcDataDetectors
{
  return self->_mrcDataDetectors;
}

- (void)setMrcDataDetectors:(id)a3
{
}

- (NSArray)filteredTextDataDetectors
{
  return self->_filteredTextDataDetectors;
}

- (void)setFilteredTextDataDetectors:(id)a3
{
}

- (NSArray)unfilteredTextDataDetectors
{
  return self->_unfilteredTextDataDetectors;
}

- (void)setUnfilteredTextDataDetectors:(id)a3
{
}

- (VNRecognizedTextBlockObservation)titleObservation
{
  return self->_titleObservation;
}

- (void)setTitleObservation:(id)a3
{
}

- (NSString)buildString
{
  return self->_buildString;
}

- (void)setBuildString:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSIndexSet)richPasteBoardIndexes
{
  return self->_richPasteBoardIndexes;
}

- (void)setRichPasteBoardIndexes:(id)a3
{
}

- (CROutputRegion)crTitleOutput
{
  return self->_crTitleOutput;
}

- (void)setCrTitleOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crTitleOutput, 0);
  objc_storeStrong((id *)&self->_richPasteBoardIndexes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_buildString, 0);
  objc_storeStrong((id *)&self->_titleObservation, 0);
  objc_storeStrong((id *)&self->_unfilteredTextDataDetectors, 0);
  objc_storeStrong((id *)&self->_filteredTextDataDetectors, 0);
  objc_storeStrong((id *)&self->_mrcDataDetectors, 0);
  objc_storeStrong((id *)&self->_filteredNormalizedRectangleQuads, 0);
  objc_storeStrong((id *)&self->_rectangleObservations, 0);
  objc_storeStrong((id *)&self->_localeMap, 0);
  objc_storeStrong((id *)&self->_requestBarcodeSymbologies, 0);
  objc_storeStrong((id *)&self->_requestLocales, 0);
  objc_storeStrong((id *)&self->_attributedTextRangeMapping, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_normalizedTextLineBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_inspectableElements, 0);
  objc_storeStrong((id *)&self->_unfilteredDataDetectors, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_textElements, 0);
  objc_storeStrong((id *)&self->_sourceVNDocument, 0);
  objc_storeStrong((id *)&self->_sourceDocument, 0);
  objc_destroyWeak((id *)&self->_textDelegate);
  objc_storeStrong((id *)&self->_request, 0);
}

@end