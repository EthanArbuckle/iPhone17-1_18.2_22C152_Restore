@interface UITextDragPreviewRenderer
- (BOOL)excludeBackground;
- (CGRect)_correctlyOffsetBoundingRect;
- (CGRect)_rawBoundingRect;
- (CGRect)bodyRect;
- (CGRect)firstLineRect;
- (CGRect)lastLineRect;
- (NSLayoutManager)layoutManager;
- (UIImage)image;
- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range;
- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range unifyRects:(BOOL)unifyRects;
- (void)_calculate;
- (void)_calculateRectsUsingLayoutManager:(id)a3;
- (void)addRenderingAttributes:(id)a3;
- (void)removeRenderingAttributes:(id)a3;
- (void)setExcludeBackground:(BOOL)a3;
@end

@implementation UITextDragPreviewRenderer

- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range
{
  return -[UITextDragPreviewRenderer initWithLayoutManager:range:unifyRects:](self, "initWithLayoutManager:range:unifyRects:", layoutManager, range.location, range.length, 1);
}

- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range unifyRects:(BOOL)unifyRects
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v10 = layoutManager;
  v14.receiver = self;
  v14.super_class = (Class)UITextDragPreviewRenderer;
  v11 = [(UITextDragPreviewRenderer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layoutManager, layoutManager);
    v12->_range.NSUInteger location = location;
    v12->_range.NSUInteger length = length;
    v12->_calculated = 0;
    v12->_unifyRects = unifyRects;
  }

  return v12;
}

- (UIImage)image
{
  [(UITextDragPreviewRenderer *)self _calculate];
  image = self->_image;
  return image;
}

- (CGRect)firstLineRect
{
  [(UITextDragPreviewRenderer *)self _calculate];
  double x = self->_firstRect.origin.x;
  double y = self->_firstRect.origin.y;
  double width = self->_firstRect.size.width;
  double height = self->_firstRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bodyRect
{
  [(UITextDragPreviewRenderer *)self _calculate];
  double x = self->_middleRect.origin.x;
  double y = self->_middleRect.origin.y;
  double width = self->_middleRect.size.width;
  double height = self->_middleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lastLineRect
{
  [(UITextDragPreviewRenderer *)self _calculate];
  double x = self->_lastRect.origin.x;
  double y = self->_lastRect.origin.y;
  double width = self->_lastRect.size.width;
  double height = self->_lastRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_calculate
{
  if (!self->_calculated)
  {
    self->_calculated = 1;
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_firstRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_firstRect.size = v4;
    self->_middleRect.origin = v3;
    self->_middleRect.size = v4;
    self->_lastRect.origin = v3;
    self->_lastRect.size = v4;
    BOOL v5 = !self->_excludeBackground;
    v6 = [(UITextDragPreviewRenderer *)self layoutManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__UITextDragPreviewRenderer__calculate__block_invoke;
    v7[3] = &unk_1E5309F90;
    v7[4] = self;
    BOOL v8 = v5;
    [v6 coordinateAccess:v7];
  }
}

void __39__UITextDragPreviewRenderer__calculate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _calculateRectsUsingLayoutManager:v3];
  [*(id *)(a1 + 32) _correctlyOffsetBoundingRect];
  if (v6 > 0.0)
  {
    double v8 = v7;
    if (v7 > 0.0)
    {
      CGFloat v9 = v4;
      CGFloat v10 = v5;
      double v11 = v6;
      NSUInteger v12 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 16), 0);
      NSUInteger v14 = v13;
      v15 = [v3 textContainerForGlyphAtIndex:v12 effectiveRange:0];
      v30.origin.double x = v9;
      v30.origin.double y = v10;
      v30.size.double width = v11;
      v30.size.double height = v8;
      CGRect v31 = CGRectOffset(v30, -*(double *)(*(void *)(a1 + 32) + 120), -*(double *)(*(void *)(a1 + 32) + 128));
      v28.NSUInteger location = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", v15, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
      v29.NSUInteger location = v12;
      v29.NSUInteger length = v14;
      NSRange v16 = NSIntersectionRange(v28, v29);
      v17 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v11, v8);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __39__UITextDragPreviewRenderer__calculate__block_invoke_2;
      v23[3] = &unk_1E5309F68;
      char v27 = *(unsigned char *)(a1 + 40);
      id v18 = v3;
      NSRange v26 = v16;
      uint64_t v19 = *(void *)(a1 + 32);
      id v24 = v18;
      uint64_t v25 = v19;
      uint64_t v20 = [(UIGraphicsImageRenderer *)v17 imageWithActions:v23];
      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(void **)(v21 + 136);
      *(void *)(v21 + 136) = v20;
    }
  }
}

uint64_t __39__UITextDragPreviewRenderer__calculate__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  double v6 = *(double *)(v3 + 120);
  double v7 = *(double *)(v3 + 128);
  return objc_msgSend(v2, "drawGlyphsForGlyphRange:atPoint:", v4, v5, v6, v7);
}

- (void)_calculateRectsUsingLayoutManager:(id)a3
{
  id v4 = a3;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x4010000000;
  v54[3] = &unk_186D7DBA7;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v55 = *MEMORY[0x1E4F1DB20];
  long long v56 = v5;
  double v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", self->_range.location, self->_range.length, 0);
  uint64_t v9 = v8;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke;
  v48[3] = &unk_1E5309FE0;
  uint64_t v52 = v7;
  uint64_t v53 = v8;
  v48[4] = self;
  id v10 = v4;
  id v49 = v10;
  id v11 = v6;
  id v50 = v11;
  v51 = v54;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", v7, v9, v48);
  NSUInteger v12 = [v10 textStorage];
  int v13 = objc_msgSend(v12, "_ui_containsTables");

  if (v13)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_3;
    v45 = &unk_1E530A008;
    id v46 = v10;
    id v47 = v11;
    objc_msgSend(v46, "ui_enumerateTextBlocksInGlyphRange:usingBlock:", v7, v9, &v42);
  }
  if (objc_msgSend(v11, "count", v42, v43, v44, v45) == 1)
  {
    NSUInteger v14 = [v11 firstObject];
    [v14 CGRectValue];
    self->_middleRect.origin.double x = v15;
    self->_middleRect.origin.double y = v16;
    self->_middleRect.size.double width = v17;
    self->_middleRect.size.double height = v18;
  }
  else if ([v11 count])
  {
    uint64_t v19 = [v11 firstObject];
    [v19 CGRectValue];
    self->_firstRect.origin.double x = v20;
    self->_firstRect.origin.double y = v21;
    self->_firstRect.size.double width = v22;
    self->_firstRect.size.double height = v23;

    id v24 = [v11 lastObject];
    [v24 CGRectValue];
    self->_lastRect.origin.double x = v25;
    self->_lastRect.origin.double y = v26;
    self->_lastRect.size.double width = v27;
    self->_lastRect.size.double height = v28;

    if ((unint64_t)[v11 count] >= 3)
    {
      NSRange v29 = [v11 objectAtIndexedSubscript:1];
      [v29 CGRectValue];
      self->_middleRect.origin.double x = v30;
      self->_middleRect.origin.double y = v31;
      self->_middleRect.size.double width = v32;
      self->_middleRect.size.double height = v33;

      for (unint64_t i = 2; i < [v11 count] - 1; ++i)
      {
        v35 = [v11 objectAtIndexedSubscript:i];
        [v35 CGRectValue];
        v57.origin.double x = v36;
        v57.origin.double y = v37;
        v57.size.double width = v38;
        v57.size.double height = v39;
        self->_middleRect = CGRectUnion(self->_middleRect, v57);
      }
      if (self->_unifyRects)
      {
        double MinY = CGRectGetMinY(self->_middleRect);
        self->_firstRect.size.double height = MinY + 1.0 - CGRectGetMinY(self->_firstRect);
        double MaxY = CGRectGetMaxY(self->_lastRect);
        self->_lastRect.size.double height = MaxY - CGRectGetMaxY(self->_middleRect) + 1.0;
        self->_lastRect.origin.double y = CGRectGetMaxY(self->_middleRect) + -1.0;
      }
    }
  }

  _Block_object_dispose(v54, 8);
}

void __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, unsigned char *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v21 = a2;
  v50.NSUInteger location = a3;
  v50.NSUInteger length = a4;
  NSRange v22 = NSIntersectionRange(v50, *(NSRange *)(a1 + 64));
  if (v22.length > 1) {
    goto LABEL_4;
  }
  CGFloat v23 = [*(id *)(a1 + 32) layoutManager];
  uint64_t v24 = objc_msgSend(v23, "characterRangeForGlyphRange:actualGlyphRange:", v22.location, v22.length, 0);
  if (!v25)
  {

    goto LABEL_9;
  }
  uint64_t v26 = v24;
  uint64_t v27 = v25;
  CGFloat v28 = [v23 textStorage];
  NSRange v29 = objc_msgSend(v28, "attributedSubstringFromRange:", v26, v27);
  CGFloat v30 = [v29 string];

  CGFloat v31 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  CGFloat v32 = [v30 stringByTrimmingCharactersInSet:v31];
  uint64_t v33 = [v32 length];

  if (v33)
  {
LABEL_4:
    v34 = *(void **)(a1 + 40);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2;
    v40[3] = &unk_1E5309FB8;
    id v41 = v34;
    NSRange v45 = v22;
    id v42 = v21;
    double v46 = a10;
    double v47 = a11;
    double v48 = a12;
    double v49 = a13;
    id v35 = *(id *)(a1 + 48);
    uint64_t v37 = *(void *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 64);
    id v43 = v35;
    uint64_t v44 = v37;
    objc_msgSend(v41, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v22.location, v22.length, v36, *(void *)(a1 + 72), v42, v40);
    uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
    double v39 = *(double *)(v38 + 56);
    if (v39 > 400.0 && *(double *)(v38 + 48) / v39 <= 0.8) {
      *a5 = 1;
    }
  }
LABEL_9:
}

void __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 40));
  v24.origin.CGFloat y = v10;
  v24.size.CGFloat height = v11;
  v20.origin.CGFloat x = a2;
  v20.origin.CGFloat y = a3;
  v20.size.CGFloat width = a4;
  v20.size.CGFloat height = a5;
  v24.origin.CGFloat x = a2;
  v24.size.CGFloat width = a4;
  CGRect v21 = CGRectUnion(v20, v24);
  CGRect v22 = CGRectIntersection(v21, *(CGRect *)(a1 + 80));
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  CGFloat v16 = *(void **)(a1 + 48);
  CGFloat v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  [v16 addObject:v17];

  IsEmptCGFloat y = CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  uint64_t v19 = *(CGRect **)(*(void *)(a1 + 56) + 8);
  if (IsEmpty)
  {
    v19[1].origin.CGFloat x = x;
  }
  else
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v23 = CGRectUnion(v19[1], v25);
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    uint64_t v19 = *(CGRect **)(*(void *)(a1 + 56) + 8);
    v19[1].origin.CGFloat x = v23.origin.x;
  }
  v19[1].origin.CGFloat y = y;
  v19[1].size.CGFloat width = width;
  v19[1].size.CGFloat height = height;
}

void __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "boundsRectForTextBlock:glyphRange:", a2, a3, a4);
  long long v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];
}

- (CGRect)_correctlyOffsetBoundingRect
{
  [(UITextDragPreviewRenderer *)self _rawBoundingRect];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = -v3;
  v13.origin.CGFloat x = self->_firstRect.origin.x;
  self->_origin.CGFloat x = v7;
  self->_origin.CGFloat y = -v6;
  v13.origin.CGFloat y = self->_firstRect.origin.y;
  v13.size.CGFloat width = self->_firstRect.size.width;
  v13.size.CGFloat height = self->_firstRect.size.height;
  if (!CGRectIsEmpty(v13)) {
    self->_firstRect = CGRectOffset(self->_firstRect, self->_origin.x, self->_origin.y);
  }
  if (!CGRectIsEmpty(self->_middleRect)) {
    self->_middleRect = CGRectOffset(self->_middleRect, self->_origin.x, self->_origin.y);
  }
  if (!CGRectIsEmpty(self->_lastRect)) {
    self->_lastRect = CGRectOffset(self->_lastRect, self->_origin.x, self->_origin.y);
  }
  -[UITextDragPreviewRenderer adjustFirstLineRect:bodyRect:lastLineRect:textOrigin:](self, "adjustFirstLineRect:bodyRect:lastLineRect:textOrigin:", &self->_firstRect, &self->_middleRect, &self->_lastRect, v4, v6);
  [(UITextDragPreviewRenderer *)self _rawBoundingRect];
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)_rawBoundingRect
{
  if (CGRectIsEmpty(self->_firstRect))
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    CGFloat x = self->_firstRect.origin.x;
    CGFloat y = self->_firstRect.origin.y;
    CGFloat width = self->_firstRect.size.width;
    CGFloat height = self->_firstRect.size.height;
  }
  if (CGRectIsEmpty(self->_middleRect))
  {
    CGFloat v7 = x;
  }
  else
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    IsEmptCGFloat y = CGRectIsEmpty(v20);
    CGFloat v7 = self->_middleRect.origin.x;
    if (IsEmpty)
    {
      CGFloat y = self->_middleRect.origin.y;
      CGFloat width = self->_middleRect.size.width;
      CGFloat height = self->_middleRect.size.height;
    }
    else
    {
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGRect v21 = CGRectUnion(self->_middleRect, v24);
      CGFloat v7 = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
    }
  }
  if (CGRectIsEmpty(self->_lastRect))
  {
    CGFloat v9 = v7;
  }
  else
  {
    v22.origin.CGFloat x = v7;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    BOOL v10 = CGRectIsEmpty(v22);
    CGFloat v9 = self->_lastRect.origin.x;
    if (v10)
    {
      CGFloat y = self->_lastRect.origin.y;
      CGFloat width = self->_lastRect.size.width;
      CGFloat height = self->_lastRect.size.height;
    }
    else
    {
      CGFloat v11 = self->_lastRect.origin.y;
      CGFloat v12 = self->_lastRect.size.width;
      CGFloat v13 = self->_lastRect.size.height;
      v25.origin.CGFloat x = v7;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      *(CGRect *)&CGFloat v9 = CGRectUnion(*(CGRect *)&v9, v25);
      CGFloat y = v14;
      CGFloat width = v15;
      CGFloat height = v16;
    }
  }
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)addRenderingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextDragPreviewRenderer *)self layoutManager];
  objc_msgSend(v5, "addTemporaryAttributes:forCharacterRange:", v4, self->_range.location, self->_range.length);
}

- (void)removeRenderingAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        BOOL v10 = [(UITextDragPreviewRenderer *)self layoutManager];
        objc_msgSend(v10, "removeTemporaryAttribute:forCharacterRange:", v9, self->_range.location, self->_range.length);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)excludeBackground
{
  return self->_excludeBackground;
}

- (void)setExcludeBackground:(BOOL)a3
{
  self->_excludeBackground = a3;
}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end