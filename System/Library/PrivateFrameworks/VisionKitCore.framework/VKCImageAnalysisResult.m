@interface VKCImageAnalysisResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImageData;
- (CGRect)rectForMrcActionInPresentingViewController;
- (NSArray)appClipDataDetectorElements;
- (NSArray)barcodeActions;
- (NSArray)mrcDataDetectorElements;
- (NSArray)textDataDetectorElements;
- (NSArray)visualSearchResultItems;
- (UIImage)cachedCustomImageForRemoveBackground;
- (UIMenu)mrcMenu;
- (UIViewController)presentingViewControllerForMrcAction;
- (VKCImageAnalysisResult)initWithCoder:(id)a3;
- (VKCImageAnalysisResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5;
- (VKCImageSubjectContext)cachedSubjectContext;
- (VKCVisualSearchResult)visualSearchResult;
- (double)totalBoundingBoxTextArea;
- (double)totalQuadTextArea;
- (id)dataDetectorsFromRecognitionResult:(id)a3;
- (id)ddDictionaryFromDataDetectorElement:(id)a3;
- (id)dictionaryRepresentation;
- (id)imageFromNormalizedSubrect:(CGRect)a3;
- (id)linesPlistFromSourceDocument:(id)a3;
- (id)wordPlistFromOutputRegion:(id)a3 document:(id)a4;
- (id)wordsPlistFromRegion:(id)a3 sourceDocument:(id)a4;
- (int)analysisRequestID;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalysisRequestID:(int)a3;
- (void)setCachedCustomImageForRemoveBackground:(id)a3;
- (void)setCachedSubjectContext:(id)a3;
- (void)setPresentingViewControllerForMrcAction:(id)a3;
- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3;
- (void)setRequest:(id)a3;
- (void)setTotalBoundingBoxTextArea:(double)a3;
- (void)setTotalQuadTextArea:(double)a3;
- (void)setVisualSearchResult:(id)a3;
@end

@implementation VKCImageAnalysisResult

- (void)setVisualSearchResult:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_visualSearchResult, a3);
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"updatedTypes";
  v9[0] = &unk_1F357DA28;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"VKAnalysisDidUpdateNotification" object:self userInfo:v7];
}

- (NSArray)visualSearchResultItems
{
  v2 = [(VKCImageAnalysisResult *)self visualSearchResult];
  v3 = [v2 resultItems];
  v4 = objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_2);

  return (NSArray *)v4;
}

VKCVisualSearchResultInfo *__49__VKCImageAnalysisResult_visualSearchResultItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[VKCVisualSearchResultInfo alloc] initWithResultItem:v2];

  return v3;
}

- (BOOL)hasImageData
{
  id v2 = [(VKCTextRecognitionResult *)self request];
  char v3 = [v2 hasImageData];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VKCImageAnalysisResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageAnalysisResult;
  result = -[VKCTextRecognitionResult initWithDocumentObservation:mrcDataDetectors:imageSize:](&v6, sel_initWithDocumentObservation_mrcDataDetectors_imageSize_, a3, a4, a5.width, a5.height);
  result->_totalBoundingBoxTextArea = -1.0;
  result->_totalQuadTextArea = -1.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisResult;
  [(VKCTextRecognitionResult *)&v3 encodeWithCoder:a3];
}

- (VKCImageAnalysisResult)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisResult;
  return [(VKCTextRecognitionResult *)&v4 initWithCoder:a3];
}

- (void)setRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKCImageAnalysisResult;
  id v4 = a3;
  [(VKCTextRecognitionResult *)&v7 setRequest:v4];
  id v5 = objc_msgSend(v4, "locales", v7.receiver, v7.super_class);
  [(VKCTextRecognitionResult *)self setRequestLocales:v5];

  objc_super v6 = [v4 barcodeSymbologies];

  [(VKCTextRecognitionResult *)self setRequestBarcodeSymbologies:v6];
  [(VKCTextRecognitionResult *)self updateInspectableElements];
}

- (double)totalBoundingBoxTextArea
{
  double result = self->_totalBoundingBoxTextArea;
  if (result < 0.0)
  {
    self->_totalBoundingBoxTextArea = 0.0;
    id v4 = [(VKCTextRecognitionResult *)self allLineQuads];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__VKCImageAnalysisResult_totalBoundingBoxTextArea__block_invoke;
    v5[3] = &unk_1E6BF1190;
    v5[4] = self;
    [v4 enumerateObjectsUsingBlock:v5];

    return self->_totalBoundingBoxTextArea;
  }
  return result;
}

double __50__VKCImageAnalysisResult_totalBoundingBoxTextArea__block_invoke(uint64_t a1, void *a2)
{
  [a2 boundingBoxArea];
  uint64_t v3 = *(void *)(a1 + 32);
  double result = v4 + *(double *)(v3 + 272);
  *(double *)(v3 + 272) = result;
  return result;
}

- (double)totalQuadTextArea
{
  double result = self->_totalQuadTextArea;
  if (result < 0.0)
  {
    self->_totalQuadTextArea = 0.0;
    double v4 = [(VKCTextRecognitionResult *)self allLineQuads];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__VKCImageAnalysisResult_totalQuadTextArea__block_invoke;
    v5[3] = &unk_1E6BF1190;
    v5[4] = self;
    [v4 enumerateObjectsUsingBlock:v5];

    return self->_totalQuadTextArea;
  }
  return result;
}

double __43__VKCImageAnalysisResult_totalQuadTextArea__block_invoke(uint64_t a1, void *a2)
{
  [a2 area];
  uint64_t v3 = *(void *)(a1 + 32);
  double result = v4 + *(double *)(v3 + 280);
  *(double *)(v3 + 280) = result;
  return result;
}

- (UIMenu)mrcMenu
{
  id v2 = [(VKCImageAnalysisResult *)self mrcDataDetectorElements];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [v2 firstObject];
    if (!v3) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult mrcMenu]", 0, 0, @"Expected non-nil value for '%s'", "mrcElement");
    }
    double v4 = [v3 mrcMenu];
  }
  else
  {
    double v4 = 0;
  }

  return (UIMenu *)v4;
}

- (UIViewController)presentingViewControllerForMrcAction
{
  id v2 = [(VKCImageAnalysisResult *)self mrcDataDetectorElements];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [v2 firstObject];
    if (!v3) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult presentingViewControllerForMrcAction]", 0, 0, @"Expected non-nil value for '%s'", "mrcElement");
    }
    double v4 = [v3 presentingViewControllerForMrcAction];
  }
  else
  {
    double v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
  id v6 = a3;
  double v4 = [(VKCImageAnalysisResult *)self mrcDataDetectorElements];
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    if (!v5) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult setPresentingViewControllerForMrcAction:]", 0, 0, @"Expected non-nil value for '%s'", "mrcElement");
    }
    [v5 setPresentingViewControllerForMrcAction:v6];
  }
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(VKCImageAnalysisResult *)self mrcDataDetectorElements];
  BOOL v7 = [v10 count] == 1;
  v8 = v10;
  if (v7)
  {
    v9 = [v10 firstObject];
    if (!v9) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult setRectForMrcActionInPresentingViewController:]", 0, 0, @"Expected non-nil value for '%s'", "mrcElement");
    }
    objc_msgSend(v9, "setRectForMrcActionInPresentingViewController:", x, y, width, height);

    v8 = v10;
  }
}

- (NSArray)barcodeActions
{
  id v2 = [(VKCImageAnalysisResult *)self mrcDataDetectorElements];
  uint64_t v3 = objc_msgSend(v2, "vk_compactMap:", &__block_literal_global_53);

  return (NSArray *)v3;
}

uint64_t __40__VKCImageAnalysisResult_barcodeActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 barcodeAction];
}

- (NSArray)textDataDetectorElements
{
  id v2 = [(VKCTextRecognitionResult *)self dataDetectors];
  uint64_t v3 = objc_msgSend(v2, "vk_objectsPassingTest:", &__block_literal_global_56);

  return (NSArray *)v3;
}

uint64_t __50__VKCImageAnalysisResult_textDataDetectorElements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTextDataDetector];
}

- (NSArray)mrcDataDetectorElements
{
  id v2 = [(VKCTextRecognitionResult *)self dataDetectors];
  uint64_t v3 = objc_msgSend(v2, "vk_objectsPassingTest:", &__block_literal_global_58);

  return (NSArray *)v3;
}

uint64_t __49__VKCImageAnalysisResult_mrcDataDetectorElements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMRCDataDetector];
}

- (NSArray)appClipDataDetectorElements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)imageFromNormalizedSubrect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v7 = [(VKCTextRecognitionResult *)self request];
  v8 = [v7 blockingGenerateCIImage];

  if (v8)
  {
    double v9 = VKMFlipRect(x, y, width, height, 0.0, 0.0, 1.0, 1.0);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v8 extent];
    VKMRectFromNormalizedSubrect(v16, v17, v18, v19, v9, v11, v13, v15);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
    v29 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v8, v21, v23, v25, v27);
    v30 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", v29);
    CGImageRelease(v29);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (VKCImageSubjectContext)cachedSubjectContext
{
  return self->_cachedSubjectContext;
}

- (void)setCachedSubjectContext:(id)a3
{
}

- (UIImage)cachedCustomImageForRemoveBackground
{
  return self->_cachedCustomImageForRemoveBackground;
}

- (void)setCachedCustomImageForRemoveBackground:(id)a3
{
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (int)analysisRequestID
{
  return self->_analysisRequestID;
}

- (void)setAnalysisRequestID:(int)a3
{
  self->_analysisRequestID = a3;
}

- (void)setTotalBoundingBoxTextArea:(double)a3
{
  self->_totalBoundingBoxTextArea = a3;
}

- (void)setTotalQuadTextArea:(double)a3
{
  self->_totalQuadTextArea = a3;
}

- (CGRect)rectForMrcActionInPresentingViewController
{
  double x = self->_rectForMrcActionInPresentingViewController.origin.x;
  double y = self->_rectForMrcActionInPresentingViewController.origin.y;
  double width = self->_rectForMrcActionInPresentingViewController.size.width;
  double height = self->_rectForMrcActionInPresentingViewController.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
  objc_storeStrong((id *)&self->_cachedCustomImageForRemoveBackground, 0);
  objc_storeStrong((id *)&self->_cachedSubjectContext, 0);
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = VKCMockResultImageSizeKey;
  [(VKCTextRecognitionResult *)self imageSize];
  id v5 = +[VKCMockHelper plistFromSize:](VKCMockHelper, "plistFromSize:");
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v4, v5);

  id v6 = VKCMockResultTextKey;
  BOOL v7 = [(VKCTextRecognitionResult *)self text];
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v6, v7);

  v8 = VKCMockResultTextForReferenceKey;
  double v9 = [(VKCTextRecognitionResult *)self text];
  double v10 = objc_msgSend(v9, "vk_stringByReplacingNewlineCharactersWithWhiteSpace");
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v8, v10);

  CGFloat v11 = VKCMockResultLinesKey;
  double v12 = [(VKCTextRecognitionResult *)self sourceDocument];
  CGFloat v13 = [(VKCImageAnalysisResult *)self linesPlistFromSourceDocument:v12];
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v11, v13);

  double v14 = VKCMockResultDataDetectorsKey;
  CGFloat v15 = [(VKCImageAnalysisResult *)self dataDetectorsFromRecognitionResult:self];
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v14, v15);

  return v3;
}

- (id)linesPlistFromSourceDocument:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__VKCImageAnalysisResult_MockAdditions__linesPlistFromSourceDocument___block_invoke;
  v10[3] = &unk_1E6BF2AC0;
  id v11 = v4;
  id v6 = v5;
  id v12 = v6;
  CGFloat v13 = self;
  id v7 = v4;
  [v7 enumerateContentsWithTypes:8 usingBlock:v10];
  id v8 = v6;

  return v8;
}

void __70__VKCImageAnalysisResult_MockAdditions__linesPlistFromSourceDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 rangeOfContentRegion:a2];
  objc_msgSend(v3, "outputRegionWithContentsOfCharacterRange:", v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) wordsPlistFromRegion:v8 sourceDocument:*(void *)(a1 + 32)];
  objc_msgSend(v6, "vk_addNonNilObject:", v7);
}

- (id)wordsPlistFromRegion:(id)a3 sourceDocument:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__VKCImageAnalysisResult_MockAdditions__wordsPlistFromRegion_sourceDocument___block_invoke;
  v15[3] = &unk_1E6BF2AC0;
  id v10 = v9;
  id v16 = v10;
  CGFloat v17 = self;
  id v18 = v6;
  id v11 = v6;
  [v8 enumerateContentsWithTypes:16 usingBlock:v15];

  id v12 = v18;
  id v13 = v10;

  return v13;
}

void __77__VKCImageAnalysisResult_MockAdditions__wordsPlistFromRegion_sourceDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) wordPlistFromOutputRegion:a2 document:*(void *)(a1 + 48)];
  objc_msgSend(v2, "vk_addNonNilObject:", v3);
}

- (id)wordPlistFromOutputRegion:(id)a3 document:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = VKCMockResultTextKey;
  id v10 = [v7 text];
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v9, v10);

  id v11 = VKCMockResultRangeKey;
  uint64_t v12 = [v6 rangeOfContentRegion:v7];
  uint64_t v14 = v13;

  CGFloat v15 = +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v12, v14);
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v11, v15);

  id v16 = VKCMockResultQuadKey;
  CGFloat v17 = [v7 boundingQuad];

  id v18 = [v17 vkQuad];
  CGFloat v19 = [v18 dictionaryRepresentation];
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v16, v19);

  return v8;
}

- (id)dataDetectorsFromRecognitionResult:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 dataDetectors];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__VKCImageAnalysisResult_MockAdditions__dataDetectorsFromRecognitionResult___block_invoke;
  v11[3] = &unk_1E6BF2AE8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = self;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = v8;
  return v9;
}

void __76__VKCImageAnalysisResult_MockAdditions__dataDetectorsFromRecognitionResult___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) ddDictionaryFromDataDetectorElement:a2];
  [v2 addObject:v3];
}

- (id)ddDictionaryFromDataDetectorElement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "dataDetectorTypes"));
  [v4 setObject:v5 forKeyedSubscript:VKCMockResultDataDetectorTypesKey];

  uint64_t v6 = objc_opt_class();
  id v7 = VKDynamicCast(v6, (uint64_t)v3);
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 characterRange];
    id v11 = +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v9, v10);
    [v4 setObject:v11 forKeyedSubscript:VKCMockResultRangeKey];
  }
  id v12 = [v3 boundingQuads];
  uint64_t v13 = objc_msgSend(v12, "vk_compactMap:", &__block_literal_global_21);
  [v4 setObject:v13 forKeyedSubscript:VKCMockResultDataDetectorQuadsKey];

  return v4;
}

uint64_t __77__VKCImageAnalysisResult_MockAdditions__ddDictionaryFromDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

@end