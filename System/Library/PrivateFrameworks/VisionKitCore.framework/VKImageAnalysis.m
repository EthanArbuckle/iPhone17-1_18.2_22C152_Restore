@interface VKImageAnalysis
+ (BOOL)supportsSecureCoding;
+ (id)analysisWithDocumentObservation:(id)a3;
+ (id)analysisWithDocumentObservation:(id)a3 imageSize:(CGSize)a4;
+ (id)analysisWithDocumentObservation:(id)a3 request:(id)a4;
- (BOOL)_hasVisualSearchElements;
- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3;
- (BOOL)writeSecureCodedArchiveToURL:(id)a3 error:(id *)a4;
- (CGRect)rectForMrcActionInPresentingViewController;
- (NSArray)filteredNormalizedRectangleQuads;
- (NSArray)formRegions;
- (NSArray)layoutComponents;
- (NSArray)rectangleObservations;
- (NSDictionary)localeMap;
- (NSString)requestIdentifier;
- (NSString)transcript;
- (VKCDataDetectorInfo)dataDetectorInfo;
- (VKCImageAnalysisResult)imageAnalysisResult;
- (VKFeedbackProvider)feedbackProvider;
- (VKImageAnalysis)initWithAnalysisResult:(id)a3;
- (VKImageAnalysis)initWithCoder:(id)a3;
- (id)_attributedStringForRange:(_NSRange)a3;
- (id)allLines;
- (id)analysisByReplacingTypes:(unint64_t)a3 fromAnalysis:(id)a4;
- (id)barcodeActions;
- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4;
- (id)mrcMenu;
- (id)presentingViewControllerForMrcAction;
- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5;
- (id)textDataDetectors;
- (id)visualSearchResultItems;
- (int)analysisRequestID;
- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3;
- (unint64_t)recognitionConfidence;
- (void)checkForTranslationResultsWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateDataDetectorInfoWithTypes:(unint64_t)a3;
- (void)generateDataDetectorInfoWithTypes:(unint64_t)a3 unfiltered:(BOOL)a4;
- (void)setDataDetectorInfo:(id)a3;
- (void)setFeedbackProvider:(id)a3;
- (void)setImageAnalysisResult:(id)a3;
- (void)setLocaleMap:(id)a3;
- (void)setPresentingViewControllerForMrcAction:(id)a3;
- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)translateFrom:(id)a3 to:(id)a4 withCompletion:(id)a5;
- (void)translateTo:(id)a3 withCompletion:(id)a4;
@end

@implementation VKImageAnalysis

+ (id)analysisWithDocumentObservation:(id)a3
{
  return (id)objc_msgSend(a1, "analysisWithDocumentObservation:imageSize:", a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (id)analysisWithDocumentObservation:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v7 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v6, 0, width, height);

  v8 = [(VKImageAnalysis *)[VKCImageAnalysis alloc] initWithAnalysisResult:v7];
  return v8;
}

+ (id)analysisWithDocumentObservation:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 imageSize];
  v8 = objc_msgSend(a1, "analysisWithDocumentObservation:imageSize:", v7);

  v9 = [v8 imageAnalysisResult];
  [v9 setRequest:v6];

  return v8;
}

- (VKImageAnalysis)initWithAnalysisResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKImageAnalysis;
  id v6 = [(VKImageAnalysis *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageAnalysisResult, a3);
    [(VKImageAnalysis *)v7 setFeedbackProvider:0];
  }

  return v7;
}

- (NSString)transcript
{
  v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  v3 = [v2 text];
  v4 = v3;
  if (!v3) {
    v3 = &stru_1F35566F8;
  }
  id v5 = v3;

  return v5;
}

- (NSDictionary)localeMap
{
  v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  v3 = [v2 localeMap];

  return (NSDictionary *)v3;
}

- (int)analysisRequestID
{
  v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 analysisRequestID];

  return v3;
}

- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3
{
  char v6 = a3;
  v8 = [(VKImageAnalysis *)self imageAnalysisResult];
  objc_super v9 = v8;
  if (v6)
  {
    int v3 = [v8 text];
    if ([v3 length])
    {
      BOOL v10 = 1;
LABEL_22:

      goto LABEL_23;
    }
  }
  if ((v6 & 2) != 0)
  {
    v4 = [v9 textDataDetectorElements];
    if ([v4 count])
    {

      BOOL v10 = 1;
      goto LABEL_21;
    }
  }
  if ((v6 & 4) != 0)
  {
    id v5 = [v9 mrcDataDetectorElements];
    if ([v5 count])
    {
      BOOL v10 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  if ((v6 & 8) != 0)
  {
    v11 = [v9 appClipDataDetectorElements];
    uint64_t v12 = [v11 count];
    BOOL v10 = v12 != 0;
    if ((v6 & 0x10) != 0 && !v12) {
      BOOL v10 = [(VKImageAnalysis *)self _hasVisualSearchElements];
    }

    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((v6 & 0x10) != 0)
  {
    BOOL v10 = [(VKImageAnalysis *)self _hasVisualSearchElements];
    if ((v6 & 4) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    BOOL v10 = 0;
    if ((v6 & 4) != 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  if ((v6 & 2) != 0) {

  }
LABEL_21:
  if (v6) {
    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

- (BOOL)_hasVisualSearchElements
{
  int v3 = [(VKImageAnalysis *)self imageAnalysisResult];
  v4 = [v3 visualSearchResult];

  if (!v4) {
    return 0;
  }
  id v5 = [(VKImageAnalysis *)self imageAnalysisResult];
  char v6 = [v5 visualSearchResult];
  id v7 = [v6 resultItems];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (id)visualSearchResultItems
{
  v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 visualSearchResultItems];

  return v3;
}

- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  id v5 = [(VKImageAnalysis *)self imageAnalysisResult];
  char v6 = [v5 dataDetectors];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__VKImageAnalysis_countOfDataDetectorsWithTypes___block_invoke;
  v10[3] = &unk_1E6BF4388;
  v10[4] = v11;
  v10[5] = a3;
  [v6 enumerateObjectsUsingBlock:v10];

  id v7 = [(VKImageAnalysis *)self imageAnalysisResult];
  unint64_t v8 = [v7 countOfDataDetectorsWithTypes:a3];

  _Block_object_dispose(v11, 8);
  return v8;
}

uint64_t __49__VKImageAnalysis_countOfDataDetectorsWithTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 elementType];
  if ((*(void *)(a1 + 40) & result) != 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_attributedStringForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(VKImageAnalysis *)self imageAnalysisResult];
  char v6 = [v5 text];
  uint64_t v7 = objc_msgSend(v6, "vk_range");
  uint64_t v9 = VKMClampRange(location, length, v7, v8);
  uint64_t v11 = v10;

  uint64_t v12 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v9, v11);
  v13 = [v5 convertPlainTextRangeToAttributedRange:v12];
  uint64_t v14 = [v13 nsRange];
  uint64_t v16 = v15;

  v17 = [v5 attributedText];
  v18 = objc_msgSend(v17, "vk_attributedSubstringFromRange:", v14, v16);

  return v18;
}

- (id)analysisByReplacingTypes:(unint64_t)a3 fromAnalysis:(id)a4
{
  return 0;
}

- (void)setFeedbackProvider:(id)a3
{
}

- (VKFeedbackProvider)feedbackProvider
{
  return self->_feedbackProvider;
}

- (void)checkForTranslationResultsWithCompletion:(id)a3
{
  id v4 = a3;
  if (vk_isSeedBuild()
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLForKey:@"DebugVisionKitCatalystTranslation"],
        v5,
        !v6))
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2050000000;
    uint64_t v7 = (void *)getLTUIVisualTranslationViewClass_softClass_0;
    uint64_t v16 = getLTUIVisualTranslationViewClass_softClass_0;
    if (!getLTUIVisualTranslationViewClass_softClass_0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getLTUIVisualTranslationViewClass_block_invoke_0;
      v12[3] = &unk_1E6BF0A90;
      v12[4] = &v13;
      __getLTUIVisualTranslationViewClass_block_invoke_0((uint64_t)v12);
      uint64_t v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    uint64_t v9 = [(VKImageAnalysis *)self allLines];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__VKImageAnalysis_checkForTranslationResultsWithCompletion___block_invoke;
    v10[3] = &unk_1E6BF14D8;
    id v11 = v4;
    [v8 isTranslatable:v9 completion:v10];
  }
}

uint64_t __60__VKImageAnalysis_checkForTranslationResultsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)writeSecureCodedArchiveToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v6 URLByDeletingLastPathComponent];
    uint64_t v10 = [v9 path];
    char v11 = [v8 fileExistsAtPath:v10];

    if ((v11 & 1) == 0) {
      [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a4];
    }
    [v7 writeToURL:v6 options:1 error:a4];
  }
  return a4 != 0;
}

- (id)textDataDetectors
{
  v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 textDataDetectorElements];
  id v4 = objc_msgSend(v3, "vk_map:", &__block_literal_global_43);

  return v4;
}

VKWKDataDetectorInfo *__36__VKImageAnalysis_textDataDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_alloc_init(VKWKDataDetectorInfo);
  id v4 = [v2 boundingQuads];
  [(VKWKDataDetectorInfo *)v3 setBoundingQuads:v4];

  uint64_t v5 = [v2 characterRange];
  -[VKWKDataDetectorInfo setCharacterRange:](v3, "setCharacterRange:", v5, v6);
  uint64_t v7 = [v2 scannerResult];

  [(VKWKDataDetectorInfo *)v3 setResult:v7];
  return v3;
}

- (id)allLines
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 sourceVNDocument];

  id v4 = objc_msgSend(v3, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);
  uint64_t v5 = objc_msgSend(v4, "vk_map:", &__block_literal_global_122);

  return v5;
}

VKWKLineInfo *__27__VKImageAnalysis_allLines__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_alloc_init(VKWKLineInfo);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = VKDynamicCast(v4, (uint64_t)v2);

  uint64_t v6 = [v5 vkQuad];
  [(VKWKTextInfo *)v3 setQuad:v6];

  uint64_t v7 = [v5 getTranscript];
  [(VKWKTextInfo *)v3 setString:v7];

  id v8 = [v5 getCROutputRegion];
  -[VKWKLineInfo setLayoutDirection:](v3, "setLayoutDirection:", [v8 layoutDirection]);

  uint64_t v9 = [v5 getChildren];
  uint64_t v10 = objc_msgSend(v9, "vk_map:", &__block_literal_global_127_0);
  [(VKWKLineInfo *)v3 setChildren:v10];

  -[VKWKLineInfo setShouldWrap:](v3, "setShouldWrap:", [v5 shouldBeWrappedWithNextLine]);
  return v3;
}

VKWKTextInfo *__27__VKImageAnalysis_allLines__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_alloc_init(VKWKTextInfo);
  uint64_t v4 = [v2 getCROutputRegion];
  uint64_t v5 = [v4 boundingQuad];
  uint64_t v6 = [v5 vkQuad];
  [(VKWKTextInfo *)v3 setQuad:v6];

  uint64_t v7 = [v2 string];

  [(VKWKTextInfo *)v3 setString:v7];
  return v3;
}

- (NSArray)rectangleObservations
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 rectangleObservations];

  return (NSArray *)v3;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 filteredNormalizedRectangleQuads];

  return (NSArray *)v3;
}

- (NSArray)layoutComponents
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 layoutComponents];

  return (NSArray *)v3;
}

- (void)generateDataDetectorInfoWithTypes:(unint64_t)a3
{
}

- (void)generateDataDetectorInfoWithTypes:(unint64_t)a3 unfiltered:(BOOL)a4
{
  id v5 = +[VKCDataDetectorInfo dataDetectorInfoFromAnalysis:self dataDetectorTypes:a3 unfiltered:a4];
  [(VKImageAnalysis *)self setDataDetectorInfo:v5];
}

- (id)mrcMenu
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 mrcMenu];

  return v3;
}

- (id)presentingViewControllerForMrcAction
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  int v3 = [v2 presentingViewControllerForMrcAction];

  return v3;
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
  id v4 = a3;
  id v5 = [(VKImageAnalysis *)self imageAnalysisResult];
  [v5 setPresentingViewControllerForMrcAction:v4];
}

- (CGRect)rectForMrcActionInPresentingViewController
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  [v2 rectForMrcActionInPresentingViewController];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(VKImageAnalysis *)self imageAnalysisResult];
  objc_msgSend(v7, "setRectForMrcActionInPresentingViewController:", x, y, width, height);
}

- (id)barcodeActions
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  double v3 = [v2 barcodeActions];

  return v3;
}

- (void)translateTo:(id)a3 withCompletion:(id)a4
{
}

- (void)translateFrom:(id)a3 to:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(VKImageAnalysis *)self imageAnalysisResult];
  double v12 = [v11 sourceVNDocument];

  double v13 = objc_msgSend(v12, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  double v14 = (void *)getLTUIVisualTranslationServiceClass_softClass;
  uint64_t v31 = getLTUIVisualTranslationServiceClass_softClass;
  if (!getLTUIVisualTranslationServiceClass_softClass)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getLTUIVisualTranslationServiceClass_block_invoke;
    v27[3] = &unk_1E6BF0A90;
    v27[4] = &v28;
    __getLTUIVisualTranslationServiceClass_block_invoke((uint64_t)v27);
    double v14 = (void *)v29[3];
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v28, 8);
  id v16 = objc_alloc_init(v15);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __51__VKImageAnalysis_translateFrom_to_withCompletion___block_invoke;
  v25 = &unk_1E6BF4410;
  id v17 = v10;
  id v26 = v17;
  v18 = (void *)MEMORY[0x1E018E600](&v22);
  if (v8 && v9)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1CA20]);
    v20 = objc_msgSend(v19, "initWithLocaleIdentifier:", v8, v22, v23, v24, v25);
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v9];
    if (objc_opt_respondsToSelector()) {
      [v16 translate:v13 sourceLocale:v20 targetLocale:v21 completion:v18];
    }
    else {
      [v16 translate:v13 targetLocale:v21 completion:v18];
    }
  }
}

void __51__VKImageAnalysis_translateFrom_to_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v32 = a3;
  double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v11 = [v10 string];
        double v12 = [VKQuad alloc];
        [v10 bottomLeft];
        double v14 = v13;
        double v16 = v15;
        [v10 bottomRight];
        double v18 = v17;
        double v20 = v19;
        [v10 topLeft];
        double v22 = v21;
        double v24 = v23;
        [v10 topRight];
        v27 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v12, "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v18, v20, v22, v24, v25, v26);
        if (objc_opt_respondsToSelector()) {
          uint64_t v28 = [v10 isPassthrough];
        }
        else {
          uint64_t v28 = 0;
        }
        v29 = [[VKCTranslatedParagraph alloc] initWithText:v11 quad:v27 isPassthrough:v28];
        [v5 addObject:v29];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }

  uint64_t v30 = [[VKCImageAnalysisTranslation alloc] initWithParagraphs:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)formRegions
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  double v3 = [v2 formRegions];
  id v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v5 = v3;

  return v5;
}

- (unint64_t)recognitionConfidence
{
  id v2 = [(VKImageAnalysis *)self imageAnalysisResult];
  unint64_t v3 = [v2 recognitionConfidence];

  return v3;
}

- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(VKImageAnalysis *)self imageAnalysisResult];
  uint64_t v8 = [v7 formRegionsExcluding:v6 updateExcludedFields:v4];

  return v8;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a3.y;
  double x = a3.x;
  id v10 = a4;
  double v11 = [(VKImageAnalysis *)self imageAnalysisResult];
  double v12 = objc_msgSend(v11, "proposedFormRegionForPoint:existingFields:formSize:", v10, x, y, width, height);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(VKImageAnalysis *)self imageAnalysisResult];
  [v4 encodeObject:v5 forKey:@"Result"];
}

- (VKImageAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Result"];

  id v6 = [(VKImageAnalysis *)self initWithAnalysisResult:v5];
  return v6;
}

- (VKCImageAnalysisResult)imageAnalysisResult
{
  return self->_imageAnalysisResult;
}

- (void)setImageAnalysisResult:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void)setLocaleMap:(id)a3
{
}

- (VKCDataDetectorInfo)dataDetectorInfo
{
  return (VKCDataDetectorInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataDetectorInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorInfo, 0);
  objc_storeStrong((id *)&self->_localeMap, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_imageAnalysisResult, 0);
  objc_storeStrong((id *)&self->_feedbackProvider, 0);
}

@end