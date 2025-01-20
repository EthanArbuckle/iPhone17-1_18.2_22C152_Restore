@interface VKCMockImageAnalysisResult
+ (id)mockImageAnalysisResultFromDictionary:(id)a3;
- (BOOL)isRunningTest;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (CGSize)imageSize;
- (NSDictionary)sourceDict;
- (NSString)text;
- (VKCMockTextProvider)textProvider;
- (id)adjustTextRangeToSelectableRange:(id)a3;
- (id)allLineQuads;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)dataDetectors;
- (id)rangeOfLineForPosition:(id)a3;
- (id)rangeOfWordForPosition:(id)a3;
- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (id)smallestSelectableRangeForPosition:(id)a3;
- (id)stringForLine:(id)a3;
- (void)addMockDataDetectorElementsFromArray:(id)a3;
- (void)generateText;
- (void)setImageSize:(CGSize)a3;
- (void)setIsRunningTest:(BOOL)a3;
- (void)setSourceDict:(id)a3;
- (void)setText:(id)a3;
- (void)setTextProvider:(id)a3;
@end

@implementation VKCMockImageAnalysisResult

+ (id)mockImageAnalysisResultFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(VKCMockImageAnalysisResult);
  v5 = [v3 objectForKeyedSubscript:VKCMockResultRecognitionResultKey];

  [(VKCMockImageAnalysisResult *)v4 setSourceDict:v5];
  [(VKCMockImageAnalysisResult *)v4 generateText];
  v6 = [[VKCMockTextProvider alloc] initWithDictionary:v5];
  [(VKCMockImageAnalysisResult *)v4 setTextProvider:v6];

  v7 = [v5 objectForKeyedSubscript:VKCMockResultDataDetectorsKey];
  [(VKCMockImageAnalysisResult *)v4 addMockDataDetectorElementsFromArray:v7];

  v8 = [v5 objectForKeyedSubscript:VKCMockResultImageSizeKey];
  +[VKCMockHelper sizeFromPlistDictionary:v8];
  -[VKCMockImageAnalysisResult setImageSize:](v4, "setImageSize:");

  return v4;
}

- (void)setIsRunningTest:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isRunningTest = a3;
  id v4 = [(VKCMockImageAnalysisResult *)self textProvider];
  [v4 setIsRunningTest:v3];
}

- (void)addMockDataDetectorElementsFromArray:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__VKCMockImageAnalysisResult_addMockDataDetectorElementsFromArray___block_invoke;
  v10[3] = &unk_1E6BF2B30;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  v8 = (NSArray *)[v7 copy];
  dataDetectors = self->_dataDetectors;
  self->_dataDetectors = v8;
}

void __67__VKCMockImageAnalysisResult_addMockDataDetectorElementsFromArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[VKCMockDataDetectorElement alloc] initWithDictionary:v3];

  objc_msgSend(v2, "vk_addNonNilObject:", v4);
}

- (void)generateText
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(VKCMockImageAnalysisResult *)self sourceDict];
  id v5 = [v4 objectForKeyedSubscript:VKCMockResultLinesKey];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__VKCMockImageAnalysisResult_generateText__block_invoke;
  v8[3] = &unk_1E6BF2B58;
  v8[4] = self;
  id v9 = v3;
  id v10 = v5;
  id v6 = v5;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v8];
  [(VKCMockImageAnalysisResult *)self setText:v7];
}

void __42__VKCMockImageAnalysisResult_generateText__block_invoke(id *a1, uint64_t a2, unint64_t a3)
{
  id v5 = [a1[4] stringForLine:a2];
  objc_msgSend(a1[5], "appendString:");
  if ([a1[6] count] > a3) {
    [a1[5] appendString:@"\n"];
  }
}

- (id)stringForLine:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__VKCMockImageAnalysisResult_stringForLine___block_invoke;
  v10[3] = &unk_1E6BF16A0;
  id v5 = v4;
  id v11 = v5;
  id v12 = v3;
  id v6 = v3;
  [v6 enumerateObjectsUsingBlock:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __44__VKCMockImageAnalysisResult_stringForLine___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = [a2 objectForKeyedSubscript:VKCMockResultTextKey];
  objc_msgSend(*(id *)(a1 + 32), "appendString:");
  if ([*(id *)(a1 + 40) count] - 1 > a3) {
    [*(id *)(a1 + 32) appendString:@" "];
  }
}

- (id)allLineQuads
{
  allLineQuads = self->_allLineQuads;
  if (!allLineQuads)
  {
    id v4 = [(VKCMockImageAnalysisResult *)self textProvider];
    id v5 = [v4 allLineQuads];
    id v6 = self->_allLineQuads;
    self->_allLineQuads = v5;

    allLineQuads = self->_allLineQuads;
  }
  return allLineQuads;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  [v5 caretRectForPosition:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v6 = objc_msgSend(v5, "characterRangeAtPoint:", x, y);

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v9 = objc_msgSend(v8, "closestPositionToPoint:withinRange:", v7, x, y);

  return v9;
}

- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  double v13 = [(VKCMockImageAnalysisResult *)self textProvider];
  objc_msgSend(v13, "firstRectForRange:documentView:contentRect:", v12, v11, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  double v13 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v14 = objc_msgSend(v13, "selectionRectsForRange:documentView:contentRect:", v12, v11, x, y, width, height);

  return v14;
}

- (id)rangeOfLineForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v6 = [v5 rangeOfLineForPosition:v4];

  return v6;
}

- (id)rangeOfWordForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v6 = [v5 rangeOfWordForPosition:v4];

  return v6;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v6 = [v5 smallestSelectableRangeForPosition:v4];

  return v6;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCMockImageAnalysisResult *)self textProvider];
  double v6 = [v5 adjustTextRangeToSelectableRange:v4];

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (id)dataDetectors
{
  return self->_dataDetectors;
}

- (BOOL)isRunningTest
{
  return self->_isRunningTest;
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

- (NSDictionary)sourceDict
{
  return self->_sourceDict;
}

- (void)setSourceDict:(id)a3
{
}

- (VKCMockTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_sourceDict, 0);
  objc_storeStrong((id *)&self->_allLineQuads, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end