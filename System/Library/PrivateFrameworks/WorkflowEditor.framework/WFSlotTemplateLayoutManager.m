@interface WFSlotTemplateLayoutManager
- (BOOL)extendSlotBackgroundOffEdges;
- (BOOL)isLayoutManagerForTextView;
- (BOOL)layoutManager:(id)a3 shouldBreakLineByWordBeforeCharacterAtIndex:(unint64_t)a4;
- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8;
- (BOOL)shouldDrawTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4;
- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8;
- (WFSlotTemplateLayoutManager)init;
- (double)preferredHeightForDrawingTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4 withProposedHeight:(double)a5;
- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5;
- (unint64_t)numberOfLaidLines;
- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)drawGradientInEnclosingRect:(id)a3 enclosingRect:(CGRect *)a4 lineFragmentPadding:(double)a5 runsOffLeft:(BOOL)a6 runsOffRight:(BOOL)a7;
- (void)enumerateEnclosingRectsForGlyphRange:(_NSRange)a3 insetForBackground:(BOOL)a4 standaloneTextAttachment:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateEnclosingRectsForSlot:(id)a3 includeInsideSpacing:(BOOL)a4 insetForBackground:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateInsetEnclosingRectsForGlyphRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)getCalculatedLineHeight:(double *)a3 originalFontLineHeight:(double *)a4;
- (void)getPreferredLeadingSpacing:(double *)a3 trailingSpacing:(double *)a4 forDrawingTextAttachment:(id)a5 atCharacterIndex:(unint64_t)a6;
- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3;
- (void)setIsLayoutManagerForTextView:(BOOL)a3;
@end

@implementation WFSlotTemplateLayoutManager

- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3
{
  *(&self->super._delegateIsWeakValue + 2) = a3;
}

- (BOOL)extendSlotBackgroundOffEdges
{
  return *(&self->super._delegateIsWeakValue + 2);
}

- (void)setIsLayoutManagerForTextView:(BOOL)a3
{
  *(&self->super._delegateIsWeakValue + 1) = a3;
}

- (BOOL)isLayoutManagerForTextView
{
  return *(&self->super._delegateIsWeakValue + 1);
}

- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8
{
  double x = a7.x;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat v13 = a6.origin.x;
  v15 = [(WFSlotTemplateLayoutManager *)self textStorage];
  uint64_t v16 = [v15 slotSpacingOpportunityAtCharacterIndex:a8];

  if (v16 == 2)
  {
    if (x != 0.0)
    {
      v27.origin.double x = v13;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      if (CGRectGetMaxX(v27) - x >= 15.0)
      {
        long long v22 = xmmword_234B79620;
        int8x16_t v21 = 0uLL;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  if (v16 != 1)
  {
LABEL_9:
    int8x16_t v21 = *(int8x16_t *)MEMORY[0x263F001A8];
    long long v22 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    goto LABEL_10;
  }
  v17 = [(WFSlotTemplateLayoutManager *)self textStorage];
  v18 = [v17 slotAtCharacterIndex:a8 effectiveRange:0 effectiveContentRange:0];

  if ([v18 standaloneTextAttachment]) {
    unint64_t v19 = -1;
  }
  else {
    unint64_t v19 = 0;
  }
  int8x16_t v20 = (int8x16_t)vdupq_n_s64(v19);
  int8x16_t v25 = vandq_s8(*MEMORY[0x263F001A8], v20);
  int8x16_t v26 = vbslq_s8(v20, *(int8x16_t *)(MEMORY[0x263F001A8] + 16), (int8x16_t)xmmword_234B79630);

  int8x16_t v21 = v25;
  long long v22 = (__int128)v26;
LABEL_10:
  double v23 = *(double *)&v21.i64[1];
  double v24 = *((double *)&v22 + 1);
  result.size.CGFloat width = *(double *)&v22;
  result.origin.double x = *(double *)v21.i64;
  result.size.CGFloat height = v24;
  result.origin.CGFloat y = v23;
  return result;
}

- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5
{
  v7 = [(WFSlotTemplateLayoutManager *)self textStorage];
  uint64_t v8 = [v7 slotSpacingOpportunityAtCharacterIndex:a5];

  if (v8) {
    return 2;
  }
  else {
    return a4;
  }
}

- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8
{
  double v19 = 0.0;
  double v20 = 0.0;
  -[WFSlotTemplateLayoutManager getCalculatedLineHeight:originalFontLineHeight:](self, "getCalculatedLineHeight:originalFontLineHeight:", &v19, &v20, a5, a6, a7);
  double height = a4->size.height;
  double v13 = v19;
  if (height < v19) {
    double height = v19;
  }
  a4->size.double height = height;
  a5->size.double height = height;
  double v14 = (v13 - v20) * -0.5;
  v15 = [(WFSlotTemplateLayoutManager *)self textStorage];
  uint64_t v16 = [v15 font];
  [v16 descender];
  *a6 = v13 + v17 + v14;

  return 1;
}

- (BOOL)layoutManager:(id)a3 shouldBreakLineByWordBeforeCharacterAtIndex:(unint64_t)a4
{
  long long v10 = xmmword_234B79650;
  v5 = [(WFSlotTemplateLayoutManager *)self textStorage];
  v6 = [v5 slotAtCharacterIndex:a4 effectiveRange:0 effectiveContentRange:&v10];

  if (v6)
  {
    if (a4 < (unint64_t)v10 || a4 - (unint64_t)v10 >= *((void *)&v10 + 1)) {
      LOBYTE(v8) = 0;
    }
    else {
      int v8 = [v6 prefersNoWrapping] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (void)getCalculatedLineHeight:(double *)a3 originalFontLineHeight:(double *)a4
{
  v7 = [(WFSlotTemplateLayoutManager *)self textStorage];
  id v17 = [v7 font];

  int v8 = [(WFSlotTemplateLayoutManager *)self textStorage];
  v9 = [v8 paragraphStyle];

  [v17 lineHeight];
  double v11 = v10;
  *a4 = v10;
  [v9 lineHeightMultiple];
  if (v12 > 0.0)
  {
    [v9 lineHeightMultiple];
    double v11 = v11 * v13;
  }
  [v9 maximumLineHeight];
  if (v14 > 0.0)
  {
    [v9 maximumLineHeight];
    if (v15 < v11) {
      double v11 = v15;
    }
  }
  [v9 minimumLineHeight];
  if (v16 < v11) {
    double v16 = v11;
  }
  *a3 = v16;
}

- (void)getPreferredLeadingSpacing:(double *)a3 trailingSpacing:(double *)a4 forDrawingTextAttachment:(id)a5 atCharacterIndex:(unint64_t)a6
{
  id v10 = a5;
  long long v23 = xmmword_234B79650;
  BOOL v11 = [(WFSlotTemplateLayoutManager *)self isLayoutManagerForTextView];
  double v12 = [(WFSlotTemplateLayoutManager *)self textStorage];
  double v13 = v12;
  if (v11)
  {
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = [v12 length];
  }
  else
  {
    id v14 = (id)[v12 slotAtCharacterIndex:a6 effectiveRange:0 effectiveContentRange:&v23];
  }

  double v15 = 2.0;
  if (a6 && a6 - 1 >= (unint64_t)v23 && a6 - 1 - (unint64_t)v23 < *((void *)&v23 + 1))
  {
    double v16 = [(WFSlotTemplateLayoutManager *)self textStorage];
    id v17 = [v16 attribute:*MEMORY[0x263F814A0] atIndex:a6 - 1 effectiveRange:0];

    if (v17) {
      double v15 = 1.0;
    }
    else {
      double v15 = 2.0;
    }
  }
  v18 = [(WFSlotTemplateLayoutManager *)self textStorage];
  if ([v18 length] - 1 <= a6
    || (unint64_t v19 = a6 + 1, v19 < (unint64_t)v23)
    || v19 - (unint64_t)v23 >= *((void *)&v23 + 1))
  {

    double v22 = 2.0;
  }
  else
  {
    double v20 = [(WFSlotTemplateLayoutManager *)self textStorage];
    int8x16_t v21 = [v20 attribute:*MEMORY[0x263F814A0] atIndex:v19 effectiveRange:0];

    double v22 = 1.0;
    if (!v21) {
      double v22 = 2.0;
    }
  }
  *a3 = v15;
  *a4 = v22;
}

- (double)preferredHeightForDrawingTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4 withProposedHeight:(double)a5
{
  int v8 = [(WFSlotTemplateLayoutManager *)self textStorage];
  v9 = [v8 attribute:@"WFSlot" atIndex:a4 effectiveRange:0];

  if ([v9 standaloneTextAttachment])
  {
    uint64_t v11 = 0;
    double v12 = 0.0;
    [(WFSlotTemplateLayoutManager *)self getCalculatedLineHeight:&v12 originalFontLineHeight:&v11];
    a5 = v12 + -5.0;
  }

  return a5;
}

- (BOOL)shouldDrawTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  if ([(WFSlotTemplateLayoutManager *)self isLayoutManagerForTextView])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v7 = [(WFSlotTemplateLayoutManager *)self textStorage];
    int v8 = [v7 attribute:@"WFSlot" atIndex:a4 effectiveRange:0];

    v9 = [(WFSlotTemplateLayoutManager *)self textStorage];
    id v10 = [v9 typingSlots];
    int v6 = [v10 containsObject:v8] ^ 1;
  }
  return v6;
}

- (void)drawGradientInEnclosingRect:(id)a3 enclosingRect:(CGRect *)a4 lineFragmentPadding:(double)a5 runsOffLeft:(BOOL)a6 runsOffRight:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a3;
  id v13 = [v12 colorWithAlphaComponent:0.0];
  uint64_t v14 = [v13 CGColor];
  id v15 = v12;
  uint64_t v16 = [v15 CGColor];

  CFArrayRef v17 = (const __CFArray *)objc_msgSend(v11, "arrayWithObjects:", v14, v16, 0, 0, 0x3FF0000000000000);
  v18 = CGGradientCreateWithColors(0, v17, locations);
  id v19 = [MEMORY[0x263F85188] currentContextWithScale:0.0];
  double v20 = (CGContext *)[v19 CGContext];

  if (v8)
  {
    CGContextSaveGState(v20);
    CGFloat v21 = CGRectGetMinX(*a4) - a5;
    CGFloat MinY = CGRectGetMinY(*a4);
    CGFloat Height = CGRectGetHeight(*a4);
    v39.origin.double x = v21;
    v39.origin.CGFloat y = MinY;
    v39.size.CGFloat width = a5;
    v39.size.double height = Height;
    CGContextClipToRect(v20, v39);
    v40.origin.double x = v21;
    v40.origin.CGFloat y = MinY;
    v40.size.CGFloat width = a5;
    v40.size.double height = Height;
    CGFloat MinX = CGRectGetMinX(v40);
    v41.origin.double x = v21;
    v41.origin.CGFloat y = MinY;
    v41.size.CGFloat width = a5;
    v41.size.double height = Height;
    CGFloat MidY = CGRectGetMidY(v41);
    v42.origin.double x = v21;
    v42.origin.CGFloat y = MinY;
    v42.size.CGFloat width = a5;
    v42.size.double height = Height;
    CGFloat MaxX = CGRectGetMaxX(v42);
    v43.origin.double x = v21;
    v43.origin.CGFloat y = MinY;
    v43.size.CGFloat width = a5;
    v43.size.double height = Height;
    v37.CGFloat y = CGRectGetMidY(v43);
    v35.double x = MinX;
    v35.CGFloat y = MidY;
    v37.double x = MaxX;
    CGContextDrawLinearGradient(v20, v18, v35, v37, 0);
    CGContextRestoreGState(v20);
  }
  if (v7)
  {
    CGContextSaveGState(v20);
    CGFloat v27 = CGRectGetMaxX(*a4);
    CGFloat v28 = CGRectGetMinY(*a4);
    CGFloat v29 = CGRectGetHeight(*a4);
    v44.origin.double x = v27;
    v44.origin.CGFloat y = v28;
    v44.size.CGFloat width = a5;
    v44.size.double height = v29;
    CGContextClipToRect(v20, v44);
    v45.origin.double x = v27;
    v45.origin.CGFloat y = v28;
    v45.size.CGFloat width = a5;
    v45.size.double height = v29;
    CGFloat v30 = CGRectGetMinX(v45);
    v46.origin.double x = v27;
    v46.origin.CGFloat y = v28;
    v46.size.CGFloat width = a5;
    v46.size.double height = v29;
    CGFloat v31 = CGRectGetMidY(v46);
    v47.origin.double x = v27;
    v47.origin.CGFloat y = v28;
    v47.size.CGFloat width = a5;
    v47.size.double height = v29;
    CGFloat v32 = CGRectGetMaxX(v47);
    v48.origin.double x = v27;
    v48.origin.CGFloat y = v28;
    v48.size.CGFloat width = a5;
    v48.size.double height = v29;
    v36.CGFloat y = CGRectGetMidY(v48);
    v36.double x = v32;
    v38.double x = v30;
    v38.CGFloat y = v31;
    CGContextDrawLinearGradient(v20, v18, v36, v38, 0);
    CGContextRestoreGState(v20);
  }
}

- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(WFSlotTemplateLayoutManager *)self isLayoutManagerForTextView])
  {
    v14.receiver = self;
    v14.super_class = (Class)WFSlotTemplateLayoutManager;
    -[WFSlotTemplateLayoutManager drawBackgroundForGlyphRange:atPoint:](&v14, sel_drawBackgroundForGlyphRange_atPoint_, location, length, x, y);
  }
  else
  {
    uint64_t v9 = -[WFSlotTemplateLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    uint64_t v11 = v10;
    id v12 = [(WFSlotTemplateLayoutManager *)self textStorage];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke;
    v13[3] = &unk_264BFD890;
    v13[4] = self;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"WFSlot", v9, v11, 0, v13);
  }
}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  BOOL v8 = v7;
  if (v7 && ([v7 standaloneTextAttachment] & 1) == 0)
  {
    uint64_t v9 = [*(id *)(a1 + 32) textStorage];
    uint64_t v10 = [v9 attribute:*MEMORY[0x263F814A8] atIndex:a3 effectiveRange:0];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x263F825C8] clearColor];
    }
    id v13 = v12;

    [v13 set];
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    uint64_t v16 = v15;
    CFArrayRef v17 = [*(id *)(a1 + 32) textContainerForGlyphAtIndex:v14 effectiveRange:0];
    v18 = objc_opt_new();
    id v19 = *(void **)(a1 + 32);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_2;
    v28[3] = &unk_264BFD840;
    id v20 = v18;
    id v29 = v20;
    objc_msgSend(v19, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v14, v16, v28);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_3;
    v24[3] = &unk_264BFD868;
    v24[4] = *(void *)(a1 + 32);
    id v25 = v20;
    id v26 = v17;
    id v27 = v13;
    id v21 = v13;
    id v22 = v17;
    id v23 = v20;
    [v23 enumerateObjectsUsingBlock:v24];
  }
}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "wf_valueWithCGRect:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "wf_CGRectValue");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  int v13 = objc_msgSend(*(id *)(a1 + 32), "extendSlotBackgroundOffEdges", *(void *)&v5, *(void *)&v7, *(void *)&v9, *(void *)&v11);
  int v14 = v13;
  if (!a3 || (v13 & 1) == 0)
  {
    v18 = [MEMORY[0x263F33718] sharedContext];
    uint64_t v17 = [v18 shouldReverseLayoutDirection];

    uint64_t v16 = v17 ^ 1;
    if (v17) {
      uint64_t v15 = 10;
    }
    else {
      uint64_t v15 = 5;
    }
    if (!v14) {
      goto LABEL_10;
    }
LABEL_9:
    if ([*(id *)(a1 + 40) count] - 1 != a3) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 1;
  uint64_t v17 = 1;
  if (v13) {
    goto LABEL_9;
  }
LABEL_10:
  id v19 = [MEMORY[0x263F33718] sharedContext];
  int v20 = [v19 shouldReverseLayoutDirection];

  if (v20) {
    uint64_t v16 = v16;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v20) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v17;
  }
  if (v20) {
    v15 |= 5uLL;
  }
  else {
    v15 |= 0xAuLL;
  }
LABEL_19:
  [*(id *)(a1 + 48) lineFragmentPadding];
  double v22 = v21;
  if (a3)
  {
    double v23 = -v21;
    if (v17) {
      double v24 = -v22;
    }
    else {
      double v24 = 0.0;
    }
    if (!v16) {
      double v23 = 0.0;
    }
    double v6 = v24 + v6;
    double v8 = v8 + 0.0;
    double v26 = v6;
    double v27 = v8;
    double v10 = v10 - (v24 + v23);
    double v28 = v10;
    double v29 = v12;
  }
  id v25 = objc_msgSend(MEMORY[0x263F824C0], "wf_bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v15, v6, v8, v10, v12, 8.0, 8.0, *(void *)&v26, *(void *)&v27, *(void *)&v28, *(void *)&v29);
  [v25 fill];
  if (!a3) {
    [*(id *)(a1 + 32) drawGradientInEnclosingRect:*(void *)(a1 + 56) enclosingRect:&v26 lineFragmentPadding:v17 runsOffLeft:v16 runsOffRight:v22];
  }
}

- (void)enumerateEnclosingRectsForGlyphRange:(_NSRange)a3 insetForBackground:(BOOL)a4 standaloneTextAttachment:(BOOL)a5 usingBlock:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke;
  v13[3] = &unk_264BFD810;
  NSUInteger v15 = location;
  NSUInteger v16 = length;
  BOOL v17 = a4;
  BOOL v18 = a5;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  -[WFSlotTemplateLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", location, length, v13);
}

void __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  id v17 = a2;
  v34.NSUInteger location = a3;
  v34.NSUInteger length = a4;
  NSRange v18 = NSIntersectionRange(*(NSRange *)(a1 + 48), v34);
  id v19 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke_2;
  v21[3] = &unk_264BFD7E8;
  char v32 = *(unsigned char *)(a1 + 64);
  long long v24 = *(_OWORD *)(a1 + 48);
  NSUInteger v25 = a3;
  NSUInteger v26 = a4;
  double v27 = a6;
  double v28 = a7;
  double v29 = a8;
  double v30 = a9;
  id v22 = v17;
  char v33 = *(unsigned char *)(a1 + 65);
  id v23 = *(id *)(a1 + 40);
  uint64_t v31 = a5;
  id v20 = v17;
  objc_msgSend(v19, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v18.location, v18.length, 0x7FFFFFFFFFFFFFFFLL, 0, v20, v21);
}

uint64_t __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke_2(uint64_t result, CGFloat a2, CGFloat a3, double a4, CGFloat a5)
{
  if (a4 != 0.0)
  {
    double v6 = a4;
    uint64_t v9 = result;
    if (!*(unsigned char *)(result + 120)) {
      goto LABEL_15;
    }
    if (*(void *)(result + 56) + *(void *)(result + 48) > *(void *)(result + 72) + *(void *)(result + 64))
    {
      double v10 = [MEMORY[0x263F33718] sharedContext];
      int v11 = [v10 shouldReverseLayoutDirection];

      if (v11)
      {
        v19.origin.double x = a2;
        v19.origin.double y = a3;
        v19.size.CGFloat width = v6;
        v19.size.double height = a5;
        double MaxX = CGRectGetMaxX(v19);
        double MinX = CGRectGetMinX(*(CGRect *)(v9 + 80));
        CGRect result = [*(id *)(v9 + 32) lineFragmentPadding];
        a2 = MinX + v14;
        double v6 = MaxX - a2;
      }
      else
      {
        CGFloat v15 = CGRectGetMaxX(*(CGRect *)(v9 + 80)) - a2;
        CGRect result = [*(id *)(v9 + 32) lineFragmentPadding];
        double v6 = v15 - v16;
      }
    }
    if (*(unsigned char *)(v9 + 120))
    {
      a2 = a2 + 0.0;
      a3 = a3 + 2.5;
      a5 = a5 + -5.0;
    }
    else
    {
LABEL_15:
      if (!*(unsigned char *)(v9 + 121))
      {
        [*(id *)(v9 + 32) lineFragmentPadding];
        a2 = a2 - v17;
        CGRect result = [*(id *)(v9 + 32) lineFragmentPadding];
        double v6 = v6 + v18 * 2.0;
      }
    }
    if (v6 != 0.0) {
      return (*(uint64_t (**)(double, double, double, double))(*(void *)(v9 + 40) + 16))(a2, a3, v6, a5);
    }
  }
  return result;
}

- (void)enumerateInsetEnclosingRectsForGlyphRange:(_NSRange)a3 usingBlock:(id)a4
{
}

- (void)enumerateEnclosingRectsForSlot:(id)a3 includeInsideSpacing:(BOOL)a4 insetForBackground:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v19 = a6;
  id v10 = a3;
  int v11 = [(WFSlotTemplateLayoutManager *)self textStorage];
  uint64_t v12 = [v11 characterRangeForSlot:v10 includingInsideSpacingOpportunities:v7];
  uint64_t v14 = v13;

  uint64_t v15 = -[WFSlotTemplateLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v12, v14, 0);
  uint64_t v17 = v16;
  uint64_t v18 = [v10 standaloneTextAttachment];

  -[WFSlotTemplateLayoutManager enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:](self, "enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:", v15, v17, v6, v18, v19);
}

- (unint64_t)numberOfLaidLines
{
  uint64_t v3 = [(WFSlotTemplateLayoutManager *)self numberOfGlyphs];
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    if (!v3) {
      break;
    }
    -[WFSlotTemplateLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:");
    IsEmptdouble y = CGRectIsEmpty(v8);
    unint64_t v4 = v5 + 1;
  }
  while (!IsEmpty);
  return v5;
}

- (WFSlotTemplateLayoutManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateLayoutManager;
  id v2 = [(WFSlotTemplateLayoutManager *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(WFSlotTemplateLayoutManager *)v2 setDelegate:v2];
    [(WFSlotTemplateLayoutManager *)v3 setShowsControlCharacters:0];
    [(WFSlotTemplateLayoutManager *)v3 setShowsInvisibleCharacters:0];
    unint64_t v4 = v3;
  }

  return v3;
}

@end