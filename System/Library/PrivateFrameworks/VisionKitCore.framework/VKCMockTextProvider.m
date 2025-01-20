@interface VKCMockTextProvider
- (BOOL)isRunningTest;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (NSMutableArray)lines;
- (NSString)text;
- (VKCMockTextProvider)initWithDictionary:(id)a3;
- (id)adjustTextRangeToSelectableRange:(id)a3;
- (id)allLineQuads;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)lineForIndex:(unint64_t)a3;
- (id)rangeOfLineForPosition:(id)a3;
- (id)rangeOfWordForPosition:(id)a3;
- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5;
- (id)smallestSelectableRangeForPosition:(id)a3;
- (id)wordForIndex:(unint64_t)a3;
- (void)loadInfoFromDictionary:(id)a3;
- (void)setIsRunningTest:(BOOL)a3;
- (void)setLines:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VKCMockTextProvider

- (VKCMockTextProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCMockTextProvider;
  v5 = [(VKCMockTextProvider *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lines = v5->_lines;
    v5->_lines = v6;

    [(VKCMockTextProvider *)v5 loadInfoFromDictionary:v4];
  }

  return v5;
}

- (void)loadInfoFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(VKCMockTextProvider *)self lines];
  v6 = [v4 objectForKeyedSubscript:VKCMockResultLinesKey];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __46__VKCMockTextProvider_loadInfoFromDictionary___block_invoke;
  v14 = &unk_1E6BF3FE0;
  v18 = v19;
  id v8 = v5;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  [v10 enumerateObjectsUsingBlock:&v11];
  -[VKCMockTextProvider setText:](self, "setText:", v9, v11, v12, v13, v14);

  _Block_object_dispose(v19, 8);
}

void __46__VKCMockTextProvider_loadInfoFromDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = [[VKCMockTextLine alloc] initWithWordsArray:v5 startingIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

  [*(id *)(a1 + 32) addObject:v10];
  uint64_t v6 = [(VKCMockTextLine *)v10 range];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6 + v7;
  id v8 = *(void **)(a1 + 40);
  id v9 = [(VKCMockTextLine *)v10 text];
  [v8 appendString:v9];

  if ([*(id *)(a1 + 48) count] - 1 != a3)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [*(id *)(a1 + 40) appendString:@"\n"];
  }
}

- (id)allLineQuads
{
  v2 = [(VKCMockTextProvider *)self lines];
  v3 = objc_msgSend(v2, "vk_compactMap:", &__block_literal_global_40);

  return v3;
}

uint64_t __35__VKCMockTextProvider_allLineQuads__block_invoke(uint64_t a1, void *a2)
{
  return [a2 quad];
}

- (id)lineForIndex:(unint64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21;
  id v15 = __Block_byref_object_dispose__21;
  id v16 = 0;
  id v5 = [(VKCMockTextProvider *)self text];
  unint64_t v6 = [v5 length];

  if (v6 > a3)
  {
    uint64_t v7 = [(VKCMockTextProvider *)self lines];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__VKCMockTextProvider_lineForIndex___block_invoke;
    v10[3] = &unk_1E6BF4028;
    v10[4] = &v11;
    v10[5] = a3;
    [v7 enumerateObjectsUsingBlock:v10];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __36__VKCMockTextProvider_lineForIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unint64_t v7 = [v9 range];
  if (VKMRangeContainsIndex(v7, v8, *(void *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)wordForIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  id v4 = -[VKCMockTextProvider lineForIndex:](self, "lineForIndex:");
  id v5 = [v4 words];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__VKCMockTextProvider_wordForIndex___block_invoke;
  v8[3] = &unk_1E6BF4050;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__VKCMockTextProvider_wordForIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unint64_t v7 = [v9 range];
  if (VKMRangeContainsIndex(v7, v8, *(void *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__21;
  id v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  double v5 = [(VKCMockTextProvider *)self lines];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke;
  v11[3] = &unk_1E6BF40A0;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  v11[4] = &v12;
  [v5 enumerateObjectsUsingBlock:v11];

  double v6 = (void *)v13[5];
  if (v6)
  {
    uint64_t v7 = [v6 range];
    id v9 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v7, v8);
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 quad];
  int v8 = objc_msgSend(v7, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  if (v8)
  {
    id v9 = [v6 words];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke_2;
    v10[3] = &unk_1E6BF4078;
    long long v11 = *(_OWORD *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v10];
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __45__VKCMockTextProvider_characterRangeAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 quad];
  int v8 = objc_msgSend(v7, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__21;
  v43 = __Block_byref_object_dispose__21;
  id v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0x7FF0000000000000;
  int v8 = [(VKCMockTextProvider *)self lines];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke;
  v29[3] = &unk_1E6BF40C8;
  id v9 = v7;
  CGFloat v33 = x;
  CGFloat v34 = y;
  id v30 = v9;
  v31 = &v35;
  v32 = &v39;
  [v8 enumerateObjectsUsingBlock:v29];

  id v10 = v40;
  if (v40[5])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__21;
    v27 = __Block_byref_object_dispose__21;
    id v28 = 0;
    v36[3] = 0x7FF0000000000000;
    long long v11 = [(id)v10[5] words];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke_2;
    id v17 = &unk_1E6BF40F0;
    CGFloat v21 = x;
    CGFloat v22 = y;
    id v18 = v9;
    v19 = &v35;
    v20 = &v23;
    [v11 enumerateObjectsUsingBlock:&v14];

    uint64_t v12 = +[VKTextPosition positionWithOffset:](VKTextPosition, "positionWithOffset:", objc_msgSend((id)v24[5], "range", v14, v15, v16, v17));

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v12;
}

void __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v4 = [v14 range];
  uint64_t v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) nsRange];
  VKMClampRange(v4, v6, v7, v8);
  if (v9)
  {
    id v10 = [v14 quad];
    objc_msgSend(v10, "mininumDistanceToPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v12 = v11;

    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v12 < *(double *)(v13 + 24))
    {
      *(double *)(v13 + 24) = v12;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

void __58__VKCMockTextProvider_closestPositionToPoint_withinRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v4 = [v14 range];
  uint64_t v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) nsRange];
  VKMClampRange(v4, v6, v7, v8);
  if (v9)
  {
    id v10 = [v14 quad];
    objc_msgSend(v10, "mininumDistanceToPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v12 = v11;

    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v12 < *(double *)(v13 + 24))
    {
      *(double *)(v13 + 24) = v12;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  double v12 = -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", [a3 startOffset]);
  uint64_t v13 = [v12 quad];
  id v14 = objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v11, x, y, width, height);

  [v14 boundingBox];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  if ([v11 isEmpty])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v15 = [(VKCMockTextProvider *)self lines];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    double v20 = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke;
    double v21 = &unk_1E6BF4168;
    double v22 = self;
    id v23 = v11;
    CGFloat v26 = x;
    CGFloat v27 = y;
    CGFloat v28 = width;
    CGFloat v29 = height;
    id v24 = v12;
    id v25 = v14;
    id v16 = v14;
    [v15 enumerateObjectsUsingBlock:&v18];

    uint64_t v13 = objc_msgSend(v16, "vk_compactMap:", &__block_literal_global_47, v18, v19, v20, v21, v22);
  }
  return v13;
}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isRunningTest])
  {
    uint64_t v4 = [v3 words];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_2;
    v31[3] = &unk_1E6BF4118;
    id v32 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 48);
    long long v5 = *(_OWORD *)(a1 + 80);
    long long v35 = *(_OWORD *)(a1 + 64);
    long long v36 = v5;
    id v34 = *(id *)(a1 + 56);
    [v4 enumerateObjectsUsingBlock:v31];

    uint64_t v6 = v32;
LABEL_6:

    goto LABEL_7;
  }
  NSUInteger v7 = [*(id *)(a1 + 40) nsRange];
  NSUInteger v9 = v8;
  v38.location = [v3 range];
  v38.length = v10;
  v37.location = v7;
  v37.length = v9;
  if (!VKMRangeEnclosesRange(v37, v38))
  {
    uint64_t v25 = 0;
    CGFloat v26 = &v25;
    uint64_t v27 = 0x3032000000;
    CGFloat v28 = __Block_byref_object_copy__21;
    CGFloat v29 = __Block_byref_object_dispose__21;
    id v30 = 0;
    uint64_t v13 = [v3 words];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_3;
    uint64_t v19 = &unk_1E6BF4140;
    id v20 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    long long v15 = *(_OWORD *)(a1 + 80);
    long long v23 = *(_OWORD *)(a1 + 64);
    long long v24 = v15;
    id v21 = v14;
    double v22 = &v25;
    [v13 enumerateObjectsUsingBlock:&v16];

    objc_msgSend(*(id *)(a1 + 56), "vk_addNonNilObject:", v26[5], v16, v17, v18, v19);
    _Block_object_dispose(&v25, 8);
    uint64_t v6 = v30;
    goto LABEL_6;
  }
  id v11 = [v3 quad];
  id v12 = objc_msgSend(v11, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  [*(id *)(a1 + 56) addObject:v12];
LABEL_7:
}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  NSUInteger v3 = [*(id *)(a1 + 32) nsRange];
  NSUInteger v5 = v4;
  v12.location = [v9 range];
  v12.length = v6;
  v11.location = v3;
  v11.length = v5;
  if (NSIntersectionRange(v11, v12).length)
  {
    NSUInteger v7 = [v9 quad];
    NSUInteger v8 = objc_msgSend(v7, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

    objc_msgSend(*(id *)(a1 + 48), "vk_addNonNilObject:", v8);
  }
}

void __71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_3(uint64_t a1, void *a2)
{
  id v17 = a2;
  NSUInteger v3 = [*(id *)(a1 + 32) nsRange];
  NSUInteger v5 = v4;
  v20.location = [v17 range];
  v20.NSUInteger length = v6;
  v19.location = v3;
  v19.NSUInteger length = v5;
  NSUInteger length = NSIntersectionRange(v19, v20).length;
  NSUInteger v8 = v17;
  if (length)
  {
    id v9 = [v17 quad];
    NSUInteger v10 = objc_msgSend(v9, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    NSRange v12 = *(void **)(v11 + 40);
    if (v12)
    {
      uint64_t v13 = [v12 quadFromUnionWithQuad:v10];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      id v16 = v10;
      long long v15 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v16;
    }

    NSUInteger v8 = v17;
  }
}

VKTextSelectionRect *__71__VKCMockTextProvider_selectionRectsForRange_documentView_contentRect___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = a3 == 0;
  BOOL v5 = a3 == a4;
  id v6 = a2;
  [v6 boundingBox];
  NSUInteger v7 = objc_msgSend(v6, "quadFromSubtractingPoint:");
  NSUInteger v8 = [VKTextSelectionRect alloc];
  [v6 boundingBox];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id v17 = -[VKTextSelectionRect initWithRect:containsStart:containsEnd:layoutDirection:quad:](v8, "initWithRect:containsStart:containsEnd:layoutDirection:quad:", v4, v5, 1, v7, v10, v12, v14, v16);
  return v17;
}

- (id)rangeOfLineForPosition:(id)a3
{
  NSUInteger v3 = -[VKCMockTextProvider lineForIndex:](self, "lineForIndex:", [a3 offset]);
  uint64_t v4 = [v3 range];
  id v6 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v4, v5);

  return v6;
}

- (id)rangeOfWordForPosition:(id)a3
{
  NSUInteger v3 = -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", [a3 offset]);
  uint64_t v4 = [v3 range];
  id v6 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v4, v5);

  return v6;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[VKCMockTextProvider wordForIndex:](self, "wordForIndex:", [v4 offset]);
  if (v5 && (v6 = [v4 offset], uint64_t v7 = objc_msgSend(v5, "range"), v6 != v7 + v8))
  {
    uint64_t v9 = [v5 range];
    uint64_t v10 = v11;
  }
  else
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0;
  }
  double v12 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v9, v10);

  return v12;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  id v3 = a3;
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)isRunningTest
{
  return self->_isRunningTest;
}

- (void)setIsRunningTest:(BOOL)a3
{
  self->_isRunningTest = a3;
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end