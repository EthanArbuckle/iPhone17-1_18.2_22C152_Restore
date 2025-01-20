@interface UITextViewPrintFormatter
- (BOOL)calculatingUsedRects;
- (BOOL)initializedUsedRects;
- (CGRect)rectForPageAtIndex:(int64_t)a3;
- (NSArray)pageData;
- (double)adjustedPageBottom:(double)a3;
- (id)attributedText;
- (id)color;
- (id)font;
- (id)text;
- (int64_t)_recalcPageCount;
- (int64_t)textAlignment;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)setAttributedText:(id)a3;
- (void)setCalculatingUsedRects:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setInitializedUsedRects:(BOOL)a3;
- (void)setPageData:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation UITextViewPrintFormatter

- (double)adjustedPageBottom:(double)a3
{
  v4 = [(UIViewPrintFormatter *)self view];
  v5 = [v4 textContainer];

  v6 = [v5 textLayoutManager];
  [v5 textContainerOrigin];
  double v8 = v7;
  double v9 = a3 - v7;
  v10 = objc_msgSend(v6, "textLayoutFragmentForPosition:", 0.0, a3 - v7);
  v11 = v10;
  if (v10)
  {
    [v10 layoutFragmentFrame];
    if (v12 + v13 > v9)
    {
      double v14 = v12;
      v15 = [v11 textLineFragmentForVerticalOffset:1 requiresExactMatch:v9 - v12];
      v16 = v15;
      if (v15)
      {
        [v15 typographicBounds];
        a3 = v8 + v14 + v17;
      }
    }
  }

  return a3;
}

- (NSArray)pageData
{
  if (![(UITextViewPrintFormatter *)self initializedUsedRects]
    && ![(UITextViewPrintFormatter *)self calculatingUsedRects])
  {
    [(UITextViewPrintFormatter *)self setCalculatingUsedRects:1];
    v3 = [(UIViewPrintFormatter *)self view];
    v4 = [v3 textContainer];

    uint64_t v5 = [v4 textLayoutManager];
    if (v5)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = [v4 layoutManager];
    }
    double v7 = [v4 textView];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v4 && v5 | v6 && v7)
    {
      [(UIPrintFormatter *)self _pageContentRect:1];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      double y = v15;
      [(UIPrintFormatter *)self _pageContentRect:0];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      v77.size.height = v23;
      v73.origin.x = v10;
      v73.origin.double y = v12;
      v73.size.double width = v14;
      v73.size.height = y;
      v77.origin.x = v18;
      v77.origin.double y = v20;
      v77.size.double width = v22;
      rect2.origin.double y = v77.size.height;
      CGRect v74 = CGRectIntersection(v73, v77);
      double width = v74.size.width;
      uint64_t v25 = objc_msgSend(v4, "widthTracksTextView", v74.origin.x, v74.origin.y);
      uint64_t v26 = [v4 heightTracksTextView];
      [v4 setTextView:0];
      [v4 setWidthTracksTextView:0];
      [v4 setHeightTracksTextView:0];
      [v4 size];
      double v53 = v28;
      double v54 = v27;
      objc_msgSend(v4, "setSize:", width, 3.40282347e38);
      if (v5)
      {
        double v55 = v22;
        double v56 = v20;
        double v57 = v18;
        unsigned int v50 = v26;
        unsigned int v51 = v25;
        uint64_t v52 = v6;
        v29 = [(id)v5 textContentManager];
        uint64_t v30 = [v29 documentRange];

        v49 = (void *)v30;
        [(id)v5 ensureLayoutForRange:v30];
        [(id)v5 usageBoundsForTextContainer];
        rect2.origin.x = v31;
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        double v38 = 0.0;
        uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          [(UITextViewPrintFormatter *)self adjustedPageBottom:v38 + y];
          double v41 = v40 - v38;
          v75.origin.x = 0.0;
          v75.origin.double y = v38;
          v75.size.double width = v14;
          v75.size.height = v41;
          v78.origin.x = rect2.origin.x;
          v78.origin.double y = v33;
          v78.size.double width = v35;
          v78.size.height = v37;
          if (!CGRectIntersectsRect(v75, v78)) {
            break;
          }
          *(CGFloat *)v71 = v10;
          *(CGFloat *)&v71[1] = v12;
          *(CGFloat *)&v71[2] = v14;
          *(double *)&v71[3] = v41;
          *(double *)&v71[4] = v38;
          v42 = [MEMORY[0x1E4F29238] valueWithBytes:v71 objCType:"{?={CGRect={CGPoint=dd}{CGSize=dd}}d}"];
          [v8 addObject:v42];

          v76.origin.x = 0.0;
          v76.origin.double y = v38;
          v76.size.double width = v14;
          v76.size.height = v41;
          double y = rect2.origin.y;
          double v38 = v38 + CGRectGetHeight(v76);
          CGFloat v14 = v55;
          CGFloat v12 = v56;
          CGFloat v10 = v57;
          --v39;
        }
        while (v39);
        uint64_t v6 = v52;
        uint64_t v26 = v50;
        uint64_t v25 = v51;
        double v44 = v53;
        double v43 = v54;
        v45 = v49;
      }
      else
      {
        *(void *)&rect2.size.double width = MEMORY[0x1E4F143A8];
        *(void *)&rect2.size.height = 3221225472;
        v59 = __36__UITextViewPrintFormatter_pageData__block_invoke;
        v60 = &unk_1E6DA1EA8;
        id v61 = v4;
        CGFloat v63 = v10;
        CGFloat v64 = v12;
        CGFloat v65 = v14;
        double v66 = y;
        id v62 = v8;
        CGFloat v67 = v18;
        CGFloat v68 = v20;
        CGFloat v69 = v22;
        CGFloat v70 = rect2.origin.y;
        [(id)v6 coordinateAccess:&rect2.size];

        v45 = v61;
        double v44 = v53;
        double v43 = v54;
      }

      objc_storeStrong((id *)&self->_pageData, v8);
      objc_msgSend(v4, "setSize:", v43, v44);
      [v4 setWidthTracksTextView:v25];
      [v4 setHeightTracksTextView:v26];
      [v4 setTextView:v7];
    }
    else
    {
      pageData = self->_pageData;
      self->_pageData = 0;
    }
    [(UITextViewPrintFormatter *)self setInitializedUsedRects:1];
    [(UITextViewPrintFormatter *)self setCalculatingUsedRects:0];
  }
  v47 = self->_pageData;
  return v47;
}

void __36__UITextViewPrintFormatter_pageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 allowsNonContiguousLayout]) {
    [v3 ensureLayoutForTextContainer:*(void *)(a1 + 32)];
  }
  long long v26 = *(_OWORD *)(a1 + 48);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  uint64_t v6 = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 32), 0.0, 0.0, v4, v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = v6 + v7;
      if ((unint64_t)(v6 + v7) <= 1) {
        uint64_t v11 = 1;
      }
      objc_msgSend(v3, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v11 - 1, 0, *(void *)&v9);
      CGFloat x = v27.origin.x;
      CGFloat y = v27.origin.y;
      CGFloat width = v27.size.width;
      CGFloat height = v27.size.height;
      double MaxY = CGRectGetMaxY(v27);
      v28.origin.CGFloat x = 0.0;
      v28.origin.CGFloat y = v10;
      v28.size.CGFloat width = v4;
      v28.size.CGFloat height = v5;
      if (MaxY > CGRectGetMaxY(v28))
      {
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.CGFloat height = height;
        double v17 = CGRectGetMaxY(v29);
        v30.origin.CGFloat x = 0.0;
        v30.origin.CGFloat y = v10;
        v30.size.CGFloat width = v4;
        v30.size.CGFloat height = v5;
        CGFloat v18 = CGRectGetMaxY(v30) - v17;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        double v19 = v5 - (v18 + CGRectGetHeight(v31));
        if (v19 > 0.00000011920929) {
          double v5 = v19;
        }
      }
      *(_OWORD *)&rect.origin.CGFloat y = v26;
      rect.size.CGFloat height = v4;
      double v24 = v5;
      double v25 = v22;
      CGFloat v20 = *(void **)(a1 + 40);
      double v21 = [MEMORY[0x1E4F29238] valueWithBytes:&rect.origin.y objCType:"{?={CGRect={CGPoint=dd}{CGSize=dd}}d}"];
      [v20 addObject:v21];

      long long v26 = *(_OWORD *)(a1 + 80);
      v32.origin.CGFloat x = 0.0;
      v32.origin.CGFloat y = v10;
      v32.size.CGFloat width = v4;
      v32.size.CGFloat height = v5;
      double v10 = v22 + CGRectGetHeight(v32);
      double v4 = *(double *)(a1 + 96);
      double v5 = *(double *)(a1 + 104);
      uint64_t v6 = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 32), 0.0, v10, v4, v5);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      double v9 = v10;
    }
    while (v7);
  }
}

- (int64_t)_recalcPageCount
{
  [(UITextViewPrintFormatter *)self setInitializedUsedRects:0];
  id v3 = [(UITextViewPrintFormatter *)self pageData];
  int64_t v4 = [v3 count];

  return v4;
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  [(UIPrintFormatter *)self _recalcIfNecessary];
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = [(UITextViewPrintFormatter *)self pageData];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndex:", a3 - -[UIPrintFormatter startPage](self, "startPage"));
  [v6 getValue:&v11];

  double v8 = *((double *)&v11 + 1);
  double v7 = *(double *)&v11;
  double v10 = *((double *)&v12 + 1);
  double v9 = *(double *)&v12;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v53 = *MEMORY[0x1E4F1DB28];
  long long v54 = v10;
  double v55 = 0.0;
  long long v11 = [(UITextViewPrintFormatter *)self pageData];
  long long v12 = objc_msgSend(v11, "objectAtIndex:", a4 - -[UIPrintFormatter startPage](self, "startPage"));
  [v12 getValue:&v53];

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.double width = width;
  v56.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v56);
  CGContextTranslateCTM(CurrentContext, x, y);
  double v14 = v55;
  CGContextTranslateCTM(CurrentContext, 0.0, -v55);
  double v15 = [(UIViewPrintFormatter *)self view];
  v16 = [v15 textContainer];

  uint64_t v17 = [v16 textLayoutManager];
  uint64_t v18 = 0;
  if (!v17)
  {
    uint64_t v18 = [v16 layoutManager];
  }
  uint64_t v19 = [v16 textView];
  CGFloat v20 = (void *)v19;
  if (v16 && v17 | v18 && v19)
  {
    uint64_t v21 = [v16 widthTracksTextView];
    uint64_t v22 = [v16 heightTracksTextView];
    [v16 setTextView:0];
    [v16 setWidthTracksTextView:0];
    [v16 setHeightTracksTextView:0];
    [v16 size];
    double v24 = v23;
    double v26 = v25;
    objc_msgSend(v16, "setSize:", width, 3.40282347e38);
    if (v17)
    {
      long long v52 = v54;
      double v27 = *(double *)&v53 - *(double *)&v53;
      double v28 = *((double *)&v53 + 1) + v55 - *((double *)&v53 + 1);
      CGRect v29 = [(id)v17 textContentManager];
      CGRect v30 = [v29 documentRange];

      [(id)v17 ensureLayoutForRange:v30];
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      char v51 = 0;
      CGRect v31 = objc_msgSend((id)v17, "textLayoutFragmentForPosition:", v27, v28);
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      char v49 = 0;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke;
      v40[3] = &unk_1E6DA1EF8;
      id v32 = v31;
      id v41 = v32;
      v42 = v48;
      double v44 = v27;
      double v45 = v28;
      long long v46 = v52;
      v47 = CurrentContext;
      double v43 = v50;
      id v33 = (id)[(id)v17 enumerateTextLayoutFragmentsFromLocation:0 options:4 usingBlock:v40];

      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v50, 8);

      uint64_t v22 = v22;
      uint64_t v21 = v21;
    }
    else if (v18)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_3;
      v34[3] = &unk_1E6DA1F20;
      id v35 = v16;
      uint64_t v36 = 0;
      double v37 = v14;
      double v38 = width;
      CGFloat v39 = height;
      [(id)v18 coordinateAccess:v34];
    }
    objc_msgSend(v16, "setSize:", v24, v26);
    [v16 setWidthTracksTextView:v21];
    [v16 setHeightTracksTextView:v22];
    [v16 setTextView:v20];
  }
  CGContextRestoreGState(CurrentContext);
}

BOOL __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  if (*(id *)(a1 + 32) == v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v3 layoutFragmentFrame];
    [v4 layoutFragmentFrame];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    double v9 = [v4 textLineFragments];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_2;
    v12[3] = &unk_1E6DA1ED0;
    v12[5] = v6;
    v12[6] = v8;
    long long v13 = *(_OWORD *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 88);
    v12[4] = *(void *)(a1 + 48);
    [v9 enumerateObjectsUsingBlock:v12];
  }
  BOOL v10 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;

  return v10;
}

void __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  [v16 typographicBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = *(double *)(a1 + 40) + v10;
  double v13 = v12 + *(double *)(a1 + 48);
  v20.origin.CGFloat x = v11;
  v20.origin.CGFloat y = v13;
  v20.size.double width = v6;
  v20.size.CGFloat height = v8;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v20))
  {
    v18.origin.CGFloat x = v11;
    v18.origin.CGFloat y = v13;
    v18.size.double width = v7;
    v18.size.CGFloat height = v9;
    double MaxY = CGRectGetMaxY(v18);
    if (MaxY <= CGRectGetMaxY(*(CGRect *)(a1 + 56))) {
      objc_msgSend(v16, "drawAtPoint:inContext:", *(void *)(a1 + 88), v11, v13);
    }
  }
  else
  {
    v19.origin.CGFloat x = v11;
    v19.origin.CGFloat y = v13;
    v19.size.double width = v7;
    v19.size.CGFloat height = v9;
    double MinY = CGRectGetMinY(v19);
    if (MinY > CGRectGetMaxY(*(CGRect *)(a1 + 56)))
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

void __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 allowsNonContiguousLayout]) {
    [v9 ensureLayoutForTextContainer:*(void *)(a1 + 32)];
  }
  uint64_t v3 = objc_msgSend(v9, "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v9, "drawBackgroundForGlyphRange:atPoint:", v3, v4, *MEMORY[0x1E4F1DAD8], v8);
    objc_msgSend(v9, "drawGlyphsForGlyphRange:atPoint:", v5, v6, v7, v8);
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextViewPrintFormatter *)self _textView];
  [v5 setText:v4];

  [(UIPrintFormatter *)self _setNeedsRecalc];
}

- (id)text
{
  v2 = [(UITextViewPrintFormatter *)self _textView];
  uint64_t v3 = [v2 text];

  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextViewPrintFormatter *)self _textView];
  [v5 setAttributedText:v4];

  [(UIPrintFormatter *)self _setNeedsRecalc];
}

- (id)attributedText
{
  v2 = [(UITextViewPrintFormatter *)self _textView];
  uint64_t v3 = [v2 attributedText];

  return v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextViewPrintFormatter *)self _textView];
  [v5 setFont:v4];

  [(UIPrintFormatter *)self _setNeedsRecalc];
}

- (id)font
{
  v2 = [(UITextViewPrintFormatter *)self _textView];
  uint64_t v3 = [v2 font];

  return v3;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextViewPrintFormatter *)self _textView];
  [v5 setTextColor:v4];
}

- (id)color
{
  v2 = [(UITextViewPrintFormatter *)self _textView];
  uint64_t v3 = [v2 textColor];

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v5 = [(UITextViewPrintFormatter *)self _textView];
  [v5 setTextAlignment:a3];

  [(UIPrintFormatter *)self _setNeedsRecalc];
}

- (int64_t)textAlignment
{
  v2 = [(UITextViewPrintFormatter *)self _textView];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (BOOL)initializedUsedRects
{
  return self->_initializedUsedRects;
}

- (void)setInitializedUsedRects:(BOOL)a3
{
  self->_initializedUsedRects = a3;
}

- (BOOL)calculatingUsedRects
{
  return self->_calculatingUsedRects;
}

- (void)setCalculatingUsedRects:(BOOL)a3
{
  self->_calculatingUsedRects = a3;
}

- (void)setPageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end