@interface ICTextDragPreviewRenderer
- (BOOL)isDraggingChecklistItem;
- (CGPoint)origin;
- (CGPoint)originAdjustment;
- (CGRect)_correctlyOffsetBoundingRect;
- (CGRect)_rawBoundingRect;
- (CGRect)bodyRect;
- (CGRect)firstLineRect;
- (CGRect)lastLineRect;
- (ICTTTextStorage)textStorage;
- (ICTextDragPreviewRenderer)initWithLayoutManager:(id)a3 range:(_NSRange)a4 textStorage:(id)a5;
- (NSLayoutManager)layoutManager;
- (UIImage)image;
- (_NSRange)renderedGlyphRange;
- (double)renderOffset;
- (void)_calculate;
- (void)_calculateRectsUsingLayoutManager:(id)a3;
- (void)setIsDraggingChecklistItem:(BOOL)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setOriginAdjustment:(CGPoint)a3;
- (void)setRenderOffset:(double)a3;
- (void)setRenderedGlyphRange:(_NSRange)a3;
- (void)setTextStorage:(id)a3;
@end

@implementation ICTextDragPreviewRenderer

- (ICTextDragPreviewRenderer)initWithLayoutManager:(id)a3 range:(_NSRange)a4 textStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICTextDragPreviewRenderer;
  v12 = [(ICTextDragPreviewRenderer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutManager, a3);
    v13->_range.NSUInteger location = location;
    v13->_range.NSUInteger length = length;
    *(_WORD *)&v13->_calculated = 256;
    objc_storeStrong((id *)&v13->_textStorage, a5);
  }

  return v13;
}

- (UIImage)image
{
  [(ICTextDragPreviewRenderer *)self _calculate];
  image = self->_image;
  return image;
}

- (CGRect)firstLineRect
{
  [(ICTextDragPreviewRenderer *)self _calculate];
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
  [(ICTextDragPreviewRenderer *)self _calculate];
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
  [(ICTextDragPreviewRenderer *)self _calculate];
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
    v5 = [(ICTextDragPreviewRenderer *)self layoutManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__ICTextDragPreviewRenderer__calculate__block_invoke;
    v6[3] = &unk_1E5FDB258;
    v6[4] = self;
    [v5 coordinateAccess:v6];
  }
}

void __39__ICTextDragPreviewRenderer__calculate__block_invoke(uint64_t a1, void *a2)
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
      objc_super v15 = [v3 textContainerForGlyphAtIndex:v12 effectiveRange:0];
      v28.origin.double x = v9;
      v28.origin.double y = v10;
      v28.size.double width = v11;
      v28.size.double height = v8;
      CGRect v29 = CGRectOffset(v28, -*(double *)(*(void *)(a1 + 32) + 120), -*(double *)(*(void *)(a1 + 32) + 128));
      v26.NSUInteger location = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", v15, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
      v27.NSUInteger location = v12;
      v27.NSUInteger length = v14;
      NSRange v16 = NSIntersectionRange(v26, v27);
      long long v25 = *(_OWORD *)(*(void *)(a1 + 32) + 120);
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v11, v8);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39__ICTextDragPreviewRenderer__calculate__block_invoke_2;
      v21[3] = &unk_1E5FDB230;
      id v22 = v3;
      NSRange v23 = v16;
      long long v24 = v25;
      uint64_t v18 = [v17 imageWithActions:v21];
      uint64_t v19 = *(void *)(a1 + 32);
      v20 = *(void **)(v19 + 136);
      *(void *)(v19 + 136) = v18;
    }
  }
}

uint64_t __39__ICTextDragPreviewRenderer__calculate__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "drawGlyphsForGlyphRange:atPoint:", v3, v4, v5, v6);
}

- (void)_calculateRectsUsingLayoutManager:(id)a3
{
  id v4 = a3;
  uint64_t v66 = 0;
  v67 = (double *)&v66;
  uint64_t v68 = 0x4010000000;
  v69 = &unk_1B0BF84BB;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v70 = *MEMORY[0x1E4F1DB20];
  long long v71 = v5;
  uint64_t v60 = 0;
  v61 = (double *)&v60;
  uint64_t v62 = 0x4010000000;
  v63 = &unk_1B0BF84BB;
  long long v64 = v70;
  long long v65 = v5;
  uint64_t v55 = 0;
  v56 = (_NSRange *)&v55;
  uint64_t v57 = 0x3010000000;
  v58 = &unk_1B0BF84BB;
  long long v59 = xmmword_1B0B987A0;
  double v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", self->_range.location, self->_range.length, 0);
  uint64_t v9 = v8;
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  v45 = __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke;
  v46 = &unk_1E5FDB2A8;
  uint64_t v53 = v7;
  uint64_t v54 = v8;
  v47 = self;
  v50 = &v55;
  id v10 = v4;
  id v48 = v10;
  id v11 = v6;
  id v49 = v11;
  v51 = &v66;
  v52 = &v60;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", v7, v9, &v43);
  if (objc_msgSend(v11, "count", v43, v44, v45, v46, v47) == 1)
  {
    NSUInteger v12 = [v11 firstObject];
    [v12 CGRectValue];
    self->_middleRect.origin.double x = v13;
    self->_middleRect.origin.double y = v14;
    self->_middleRect.size.double width = v15;
    self->_middleRect.size.double height = v16;
  }
  else if ([v11 count])
  {
    v17 = [v11 firstObject];
    [v17 CGRectValue];
    self->_firstRect.origin.double x = v18;
    self->_firstRect.origin.double y = v19;
    self->_firstRect.size.double width = v20;
    self->_firstRect.size.double height = v21;

    id v22 = [v11 lastObject];
    [v22 CGRectValue];
    self->_lastRect.origin.double x = v23;
    self->_lastRect.origin.double y = v24;
    self->_lastRect.size.double width = v25;
    self->_lastRect.size.double height = v26;

    if ((unint64_t)[v11 count] < 3)
    {
      if (self->_unifyRects)
      {
        double MinX = CGRectGetMinX(self->_firstRect);
        if (MinX > CGRectGetMaxX(self->_lastRect))
        {
          self->_middleRect = CGRectUnion(self->_firstRect, self->_lastRect);
          CGPoint v39 = (CGPoint)*MEMORY[0x1E4F1DB28];
          CGSize v40 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
          self->_firstRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
          self->_firstRect.size = v40;
          self->_lastRect.origin = v39;
          self->_lastRect.size = v40;
        }
      }
    }
    else
    {
      NSRange v27 = [v11 objectAtIndexedSubscript:1];
      [v27 CGRectValue];
      self->_middleRect.origin.double x = v28;
      self->_middleRect.origin.double y = v29;
      self->_middleRect.size.double width = v30;
      self->_middleRect.size.double height = v31;

      for (unint64_t i = 2; i < [v11 count] - 1; ++i)
      {
        v33 = [v11 objectAtIndexedSubscript:i];
        [v33 CGRectValue];
        v72.origin.double x = v34;
        v72.origin.double y = v35;
        v72.size.double width = v36;
        v72.size.double height = v37;
        self->_middleRect = CGRectUnion(self->_middleRect, v72);
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
  self->_renderedGlyphRange = v56[2];
  -[ICTextDragPreviewRenderer setOriginAdjustment:](self, "setOriginAdjustment:", v67[4] - v61[4], v67[5] - v61[5]);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);
}

void __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, unsigned char *a5)
{
  id v9 = a2;
  v36.NSUInteger location = a3;
  v36.NSUInteger length = a4;
  NSRange v10 = NSIntersectionRange(v36, *(NSRange *)(a1 + 80));
  if (!v10.length)
  {
    CGFloat v18 = [*(id *)(a1 + 32) layoutManager];
    uint64_t v19 = objc_msgSend(v18, "characterRangeForGlyphRange:actualGlyphRange:", v10.location, 0, 0);
    if (v20)
    {
      uint64_t v21 = v19;
      uint64_t v22 = v20;
      CGFloat v23 = [v18 textStorage];
      CGFloat v24 = objc_msgSend(v23, "attributedSubstringFromRange:", v21, v22);
      CGFloat v25 = [v24 string];

      CGFloat v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      NSRange v27 = [v25 stringByTrimmingCharactersInSet:v26];
      uint64_t v28 = [v27 length];

      if (v28) {
        goto LABEL_2;
      }
    }
    else
    {
    }
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 146)) {
      goto LABEL_9;
    }
  }
LABEL_2:
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12.NSUInteger location = *(void *)(v11 + 32);
  if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(NSRange *)(v11 + 32) = v10;
  }
  else
  {
    v12.NSUInteger length = *(void *)(v11 + 40);
    *(NSRange *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = NSUnionRange(v12, v10);
  }
  CGFloat v13 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2;
  v29[3] = &unk_1E5FDB280;
  id v30 = v13;
  NSRange v35 = v10;
  id v14 = v9;
  uint64_t v15 = *(void *)(a1 + 32);
  id v31 = v14;
  uint64_t v32 = v15;
  id v33 = *(id *)(a1 + 48);
  long long v34 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v30, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, *(void *)(a1 + 80), *(void *)(a1 + 88), v14, v29);
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  double v17 = *(double *)(v16 + 56);
  if (v17 > 400.0 && *(double *)(v16 + 48) / v17 <= 0.8) {
    *a5 = 1;
  }

LABEL_9:
}

void __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 40));
  v53.origin.CGFloat y = v10;
  v53.size.CGFloat height = v11;
  v48.origin.CGFloat x = a2;
  v48.origin.CGFloat y = a3;
  v48.size.CGFloat width = a4;
  v48.size.CGFloat height = a5;
  v53.origin.CGFloat x = a2;
  v53.size.CGFloat width = a4;
  CGRect v49 = CGRectUnion(v48, v53);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  uint64_t v16 = [*(id *)(a1 + 48) layoutManager];
  uint64_t v17 = objc_msgSend(v16, "characterRangeForGlyphRange:actualGlyphRange:", *(void *)(a1 + 80), *(void *)(a1 + 88), 0);
  uint64_t v19 = v18;

  uint64_t v20 = [*(id *)(a1 + 48) textStorage];
  id v46 = [v20 attribute:*MEMORY[0x1E4F83220] atIndex:v17 effectiveRange:0];

  if (v17)
  {
    uint64_t v21 = [*(id *)(a1 + 48) textStorage];
    uint64_t v22 = [v21 string];
    uint64_t v23 = [(id)v22 characterAtIndex:v17 - 1];

    CGFloat v24 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    LOBYTE(v22) = [v24 characterIsMember:v23];

    if ((v22 & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  if (!v46)
  {
LABEL_15:
    id v46 = 0;
    goto LABEL_16;
  }
  if (![v46 isList])
  {
LABEL_16:
    double v30 = height;
    double v35 = width;
    double v32 = y;
    double v37 = x;
    goto LABEL_17;
  }
  CGFloat v25 = [*(id *)(a1 + 48) textStorage];
  CGFloat v26 = [v25 attributedString];
  +[ICTextController extraWidthNeededForStyle:range:attributedString:textView:](ICTextController, "extraWidthNeededForStyle:range:attributedString:textView:", v46, v17, v19, v26, 0);
  double v28 = v27;

  double v29 = v28 + 4.0;
  if (v28 <= 0.0) {
    double v29 = v28;
  }
  double v30 = height;
  double v31 = width;
  double v32 = y;
  double v33 = x;
  if (objc_msgSend(v46, "style", *(void *)&v29) == 103)
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRect v51 = CGRectInset(v50, 0.0, -6.0);
    double v33 = v51.origin.x;
    double v32 = v51.origin.y;
    double v31 = v51.size.width;
    double v30 = v51.size.height;
  }
  uint64_t v34 = [v46 layoutWritingDirection];
  if (v34 == -1) {
    uint64_t v34 = [MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:0];
  }
  double v35 = v45 + v31;
  double v36 = 0.0;
  if (!v34) {
    double v36 = v45;
  }
  double v37 = v33 - v36;
LABEL_17:
  v38 = *(void **)(a1 + 56);
  CGPoint v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v37, v32, v35, v30);
  [v38 addObject:v39];

  IsEmptCGFloat y = CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  v41 = *(CGRect **)(*(void *)(a1 + 64) + 8);
  if (IsEmpty)
  {
    v41[1].origin.CGFloat x = x;
    v41[1].origin.CGFloat y = y;
    uint64_t v42 = a1 + 72;
    v41[1].size.CGFloat width = width;
    v41[1].size.CGFloat height = height;
  }
  else
  {
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    *(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = CGRectUnion(v41[1], v54);
    uint64_t v43 = *(void *)(a1 + 72);
    uint64_t v42 = a1 + 72;
    v55.origin.CGFloat x = v37;
    v55.origin.CGFloat y = v32;
    v55.size.CGFloat width = v35;
    v55.size.CGFloat height = v30;
    CGRect v52 = CGRectUnion(*(CGRect *)(*(void *)(v43 + 8) + 32), v55);
    double v37 = v52.origin.x;
    double v32 = v52.origin.y;
    double v35 = v52.size.width;
    double v30 = v52.size.height;
  }
  uint64_t v44 = *(double **)(*(void *)v42 + 8);
  v44[4] = v37;
  v44[5] = v32;
  v44[6] = v35;
  v44[7] = v30;
}

- (CGRect)_correctlyOffsetBoundingRect
{
  [(ICTextDragPreviewRenderer *)self _rawBoundingRect];
  self->_origin.CGFloat x = -v3;
  self->_origin.CGFloat y = -v4;
  if (!CGRectIsEmpty(self->_firstRect)) {
    self->_firstRect = CGRectOffset(self->_firstRect, self->_origin.x, self->_origin.y);
  }
  if (!CGRectIsEmpty(self->_middleRect)) {
    self->_middleRect = CGRectOffset(self->_middleRect, self->_origin.x, self->_origin.y);
  }
  if (!CGRectIsEmpty(self->_lastRect)) {
    self->_lastRect = CGRectOffset(self->_lastRect, self->_origin.x, self->_origin.y);
  }
  [(ICTextDragPreviewRenderer *)self _rawBoundingRect];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
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

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  self->_isDraggingChecklistItem = a3;
}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (CGPoint)originAdjustment
{
  double x = self->_originAdjustment.x;
  double y = self->_originAdjustment.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginAdjustment:(CGPoint)a3
{
  self->_originAdjustment = a3;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (_NSRange)renderedGlyphRange
{
  NSUInteger length = self->_renderedGlyphRange.length;
  NSUInteger location = self->_renderedGlyphRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRenderedGlyphRange:(_NSRange)a3
{
  self->_renderedGlyphRange = a3;
}

- (ICTTTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
}

- (double)renderOffset
{
  return self->_renderOffset;
}

- (void)setRenderOffset:(double)a3
{
  self->_renderOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end