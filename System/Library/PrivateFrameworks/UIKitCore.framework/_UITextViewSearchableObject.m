@interface _UITextViewSearchableObject
- ($96EE1C12479E9B303E9C2794B92A11A2)_wordTerminationCharacteristicsForRange:(_NSRange)a3;
- (BOOL)_usesTransientHighlightBehavior;
- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (BOOL)supportsTextReplacement;
- (UITextRange)selectedTextRange;
- (UITextView)textView;
- (_UITextViewSearchableObject)initWithTextView:(id)a3;
- (id)_activeFindSession;
- (id)_rangeProvider;
- (id)targetedPreviewForHighlightRange:(id)a3;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (void)_ensureSubviewOrder;
- (void)_performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultHandler:(id)a5;
- (void)_setDimmingViewVisible:(BOOL)a3;
- (void)_setHighlightViewVisible:(BOOL)a3;
- (void)_updateHighlightLabelForMatchedRange:(id)a3;
- (void)clearAllDecoratedFoundText;
- (void)clearHighlightView;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)didEndFindSession;
- (void)layoutManagedSubviews;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5;
- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)useSelectionForFind;
@end

@implementation _UITextViewSearchableObject

- (void)layoutManagedSubviews
{
  v2 = self;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  if (self->_highlightedTextRange)
  {
    [(_UITextViewSearchableObject *)self _setHighlightViewVisible:1];
    objc_storeStrong((id *)&v2->_visuallyHighlightedTextRange, v2->_highlightedTextRange);
    p_textView = (id *)&v2->_textView;
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_textView);
    v5 = [WeakRetained _textLineRectsForRange:v2->_highlightedTextRange];

    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v116 objects:v122 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v117 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v116 + 1) + 8 * i) CGRectValue];
          v133.origin.double x = v15;
          v133.origin.double y = v16;
          v133.size.double width = v17;
          v133.size.double height = v18;
          v126.origin.double x = x;
          v126.origin.double y = y;
          v126.size.double width = width;
          v126.size.double height = height;
          CGRect v127 = CGRectUnion(v126, v133);
          double x = v127.origin.x;
          double y = v127.origin.y;
          double width = v127.size.width;
          double height = v127.size.height;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v116 objects:v122 count:16];
      }
      while (v12);
    }

    v19 = +[UITextHighlightView preferredPreviewParametersForTextLineRects:v10];
    v2 = self;
    [(UITextHighlightView *)self->_highlightView setOverriddenPreviewParameters:v19];
    [v19 _textPathInsets];
    double v21 = x + v20;
    double v23 = y + v22;
    double v25 = width - (v20 + v24);
    double v27 = height - (v22 + v26);
    id v28 = objc_loadWeakRetained(p_textView);
    [v28 contentScaleFactor];
    double v30 = UIRectIntegralWithScale(v21, v23, v25, v27, v29);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    [(UIView *)self->_highlightView frame];
    v134.origin.double x = v30;
    v134.origin.double y = v32;
    v134.size.double width = v34;
    v134.size.double height = v36;
    if (!CGRectEqualToRect(v128, v134))
    {
      -[UIView setFrame:](self->_highlightView, "setFrame:", v30, v32, v34, v36);
      [(UITextHighlightView *)self->_highlightView invalidateContentView];
    }
  }
  else
  {
    [(_UITextViewSearchableObject *)self _setHighlightViewVisible:0];
  }
  if ([(NSMutableSet *)v2->_decoratedTextRanges count]
    && ![(_UITextViewSearchableObject *)v2 _usesTransientHighlightBehavior])
  {
    [(_UITextViewSearchableObject *)v2 _setDimmingViewVisible:1];
    id v37 = objc_loadWeakRetained((id *)&v2->_textView);
    NSUInteger v100 = [v37 _visibleRangeWithLayout:0];
    NSUInteger v39 = v38;

    NSUInteger v99 = v39;
    location = (id *)&v2->_textView;
    if (!v39)
    {
      id v40 = objc_loadWeakRetained((id *)&v2->_textView);
      [v40 visibleRect];
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;

      v129.origin.double x = v42;
      v129.origin.double y = v44;
      v129.size.double width = v46;
      v129.size.double height = v48;
      double MinX = CGRectGetMinX(v129);
      v130.origin.double x = v42;
      v130.origin.double y = v44;
      v130.size.double width = v46;
      v130.size.double height = v48;
      double MinY = CGRectGetMinY(v130);
      v131.origin.double x = v42;
      v131.origin.double y = v44;
      v131.size.double width = v46;
      v131.size.double height = v48;
      double MaxX = CGRectGetMaxX(v131);
      v132.origin.double x = v42;
      v132.origin.double y = v44;
      v132.size.double width = v46;
      v132.size.double height = v48;
      double MaxY = CGRectGetMaxY(v132);
      id v53 = objc_loadWeakRetained((id *)&v2->_textView);
      v54 = objc_msgSend(v53, "closestPositionToPoint:", MinX, MinY);

      id v55 = objc_loadWeakRetained((id *)&v2->_textView);
      v56 = objc_msgSend(v55, "closestPositionToPoint:", MaxX, MaxY);

      id v57 = objc_loadWeakRetained((id *)&v2->_textView);
      v58 = [v57 textRangeFromPosition:v54 toPosition:v56];

      v59 = [(_UITextViewSearchableObject *)v2 _rangeProvider];
      uint64_t v60 = [v59 _nsrangeForTextRange:v58];
      NSUInteger v99 = v61;
      NSUInteger v100 = v60;
    }
    v62 = [MEMORY[0x1E4F1CA48] array];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    obuint64_t j = v2->_decoratedTextRanges;
    uint64_t v63 = [(NSMutableSet *)obj countByEnumeratingWithState:&v112 objects:v121 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v64; ++j)
        {
          if (*(void *)v113 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v67 = *(void *)(*((void *)&v112 + 1) + 8 * j);
          v68 = [(_UITextViewSearchableObject *)v2 _rangeProvider];
          NSUInteger v69 = [v68 _nsrangeForTextRange:v67];
          NSUInteger v71 = v70;

          v124.location = v69;
          v124.length = v71;
          v125.length = v99;
          v125.location = v100;
          if (NSIntersectionRange(v124, v125).length)
          {
            id v72 = objc_loadWeakRetained(location);
            v73 = [v72 selectionRectsForRange:v67];

            long long v110 = 0u;
            long long v111 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            id v74 = v73;
            uint64_t v75 = [v74 countByEnumeratingWithState:&v108 objects:v120 count:16];
            if (v75)
            {
              uint64_t v76 = v75;
              uint64_t v77 = *(void *)v109;
              do
              {
                for (uint64_t k = 0; k != v76; ++k)
                {
                  if (*(void *)v109 != v77) {
                    objc_enumerationMutation(v74);
                  }
                  v79 = (void *)MEMORY[0x1E4F29238];
                  [*(id *)(*((void *)&v108 + 1) + 8 * k) rect];
                  v80 = objc_msgSend(v79, "valueWithCGRect:");
                  [v62 addObject:v80];
                }
                uint64_t v76 = [v74 countByEnumeratingWithState:&v108 objects:v120 count:16];
              }
              while (v76);
            }

            v2 = self;
          }
        }
        uint64_t v64 = [(NSMutableSet *)obj countByEnumeratingWithState:&v112 objects:v121 count:16];
      }
      while (v64);
    }

    id v81 = objc_loadWeakRetained(location);
    [v81 contentSize];
    double v83 = v82;

    id v84 = objc_loadWeakRetained(location);
    [v84 bounds];
    double v86 = v85;

    if (v83 >= v86) {
      double v87 = v83;
    }
    else {
      double v87 = v86;
    }
    id v88 = objc_loadWeakRetained(location);
    [v88 contentSize];
    double v90 = v89;

    id v91 = objc_loadWeakRetained(location);
    [v91 bounds];
    double v93 = v92;

    if (v90 >= v93) {
      double v94 = v90;
    }
    else {
      double v94 = v93;
    }
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __52___UITextViewSearchableObject_layoutManagedSubviews__block_invoke;
    v101[3] = &unk_1E52DF190;
    int64x2_t v103 = vdupq_n_s64(0xC089000000000000);
    int64x2_t v104 = v103;
    v101[4] = v2;
    id v102 = v62;
    int64x2_t v105 = v103;
    double v106 = v87 + 1600.0;
    double v107 = v94 + 1600.0;
    id v95 = v62;
    +[UIView performWithoutAnimation:v101];
  }
  else
  {
    [(_UITextViewSearchableObject *)v2 _setDimmingViewVisible:0];
  }
}

- (void)_setHighlightViewVisible:(BOOL)a3
{
  if (self->_highlightViewVisible != a3)
  {
    self->_highlightViewVisible = a3;
    if (a3)
    {
      if (!self->_highlightView)
      {
        objc_initWeak(&location, self);
        v4 = [UITextHighlightView alloc];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke;
        v13[3] = &unk_1E52DF140;
        objc_copyWeak(&v14, &location);
        v5 = [(UITextHighlightView *)v4 initWithPreviewProvider:v13];
        highlightView = self->_highlightView;
        self->_highlightView = v5;

        id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
        v8 = [WeakRetained matchHighlightColor];
        [(UITextHighlightView *)self->_highlightView setFillColor:v8];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      [(_UITextViewSearchableObject *)self _ensureSubviewOrder];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_2;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      +[UIView animateWithDuration:4 delay:v12 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_3;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_4;
      v9[3] = &unk_1E52DF168;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      +[UIView animateWithDuration:4 delay:v11 options:v9 animations:0.2 completion:0.0];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setDimmingViewVisible:(BOOL)a3
{
  if (self->_dimmingViewVisible != a3)
  {
    self->_dimmingViewVisible = a3;
    if (a3)
    {
      if (!self->_dimmingView)
      {
        v4 = [UITextSearchingDimmingView alloc];
        v5 = -[UITextSearchingDimmingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        dimmingView = self->_dimmingView;
        self->_dimmingView = v5;

        [(UIView *)self->_dimmingView setAlpha:0.0];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke;
      v16[3] = &unk_1E52D9F70;
      v16[4] = self;
      +[UIView animateWithDuration:4 delay:v16 options:0 animations:0.2 completion:0.0];
      [(_UITextViewSearchableObject *)self _ensureSubviewOrder];
    }
    else
    {
      objc_initWeak(&location, self);
      v7 = self->_dimmingView;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_2;
      v13[3] = &unk_1E52D9F70;
      v8 = v7;
      id v14 = v8;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_3;
      v10[3] = &unk_1E52DF118;
      objc_copyWeak(&v12, &location);
      v10[4] = self;
      v9 = v8;
      uint64_t v11 = v9;
      +[UIView animateWithDuration:4 delay:v13 options:v10 animations:0.2 completion:0.0];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (_UITextViewSearchableObject)initWithTextView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewSearchableObject;
  v5 = [(_UITextViewSearchableObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_textView, v4);
  }

  return v6;
}

- (id)_activeFindSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v3 = [WeakRetained findInteraction];
  id v4 = [v3 activeFindSession];

  return v4;
}

- (id)_rangeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return WeakRetained;
}

- (UITextRange)selectedTextRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v3 = [WeakRetained selectedTextRange];

  return (UITextRange *)v3;
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  if (a3 == a4) {
    return 0;
  }
  id v7 = a4;
  objc_super v8 = [a3 start];
  v9 = [v7 start];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  int64_t v11 = [WeakRetained comparePosition:v8 toPosition:v9];

  return v11;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)_wordTerminationCharacteristicsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".!?։۔।።᙮‼‽⁈⁉。！．？｡,\"'’“”"];
  if (!location) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v9 = [WeakRetained textStorage];
  id v10 = [v9 string];
  uint64_t v11 = [v10 characterAtIndex:location - 1];

  if (([v6 characterIsMember:v11] & 1) == 0) {
    __int16 v12 = [v7 characterIsMember:v11];
  }
  else {
LABEL_3:
  }
    __int16 v12 = 1;
  unint64_t v13 = location + length;
  p_textView = &self->_textView;
  id v15 = objc_loadWeakRetained((id *)p_textView);
  CGFloat v16 = [v15 textStorage];
  unint64_t v17 = [v16 length];

  id v18 = objc_loadWeakRetained((id *)p_textView);
  v19 = [v18 textStorage];
  double v20 = v19;
  if (v13 >= v17)
  {
    uint64_t v23 = [v19 length];

    if (v13 == v23) {
      goto LABEL_9;
    }
LABEL_11:
    __int16 v24 = 0;
    return ($96EE1C12479E9B303E9C2794B92A11A2)(v24 | v12);
  }
  double v21 = [v19 string];
  uint64_t v22 = [v21 characterAtIndex:v13];

  if (![v6 characterIsMember:v22])
  {
    int v25 = [v7 characterIsMember:v22];

    if (v25) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }

LABEL_9:
  __int16 v24 = 256;
  return ($96EE1C12479E9B303E9C2794B92A11A2)(v24 | v12);
}

- (void)_performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultHandler:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  uint64_t v11 = [WeakRetained textStorage];
  __int16 v12 = [v11 string];

  uint64_t v13 = [v12 length];
  for (i = 0; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t v13 = [v12 length] - i)
  {
    uint64_t v15 = objc_msgSend(v12, "rangeOfString:options:range:", v22, objc_msgSend(v8, "stringCompareOptions"), i, v13);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    if ([v8 wordMatchMethod] == 2 || objc_msgSend(v8, "wordMatchMethod") == 1)
    {
      int v19 = (int)-[_UITextViewSearchableObject _wordTerminationCharacteristicsForRange:](self, "_wordTerminationCharacteristicsForRange:", v17, v18);
      if ([v8 wordMatchMethod] == 2)
      {
        if ((~v19 & 0x101) != 0) {
          goto LABEL_11;
        }
      }
      else if ([v8 wordMatchMethod] == 1 && (v19 & 1) == 0)
      {
        goto LABEL_11;
      }
    }
    double v20 = [(_UITextViewSearchableObject *)self _rangeProvider];
    double v21 = objc_msgSend(v20, "_textRangeFromNSRange:", v17, v18);

    v9[2](v9, v21);
LABEL_11:
    uint64_t i = v17 + v18;
  }
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __94___UITextViewSearchableObject_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke;
  uint64_t v15 = &unk_1E52DF0C8;
  id v16 = v9;
  id v17 = v8;
  id v10 = v8;
  id v11 = v9;
  [(_UITextViewSearchableObject *)self _performTextSearchWithQueryString:v10 usingOptions:a4 resultHandler:&v12];
  objc_msgSend(v11, "finishedSearching", v12, v13, v14, v15);
}

- (BOOL)supportsTextReplacement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  char v3 = [WeakRetained isEditable];

  return v3;
}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  return 1;
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  p_textView = &self->_textView;
  id v7 = a5;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  [WeakRetained replaceRange:v8 withText:v7];
}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88___UITextViewSearchableObject_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke;
  v30[3] = &unk_1E52DF0F0;
  id v12 = v11;
  id v31 = v12;
  int v25 = v8;
  [(_UITextViewSearchableObject *)self _performTextSearchWithQueryString:v8 usingOptions:v9 resultHandler:v30];
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  uint64_t v15 = [WeakRetained undoManager];
  [v15 beginUndoGrouping];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = [v12 reverseObjectEnumerator];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
        id v22 = objc_loadWeakRetained((id *)p_textView);
        [v22 replaceRange:v21 withText:v10];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v18);
  }

  id v23 = objc_loadWeakRetained((id *)p_textView);
  __int16 v24 = [v23 undoManager];
  [v24 endUndoGrouping];
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (!self->_decoratedTextRanges)
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
    decoratedTextRanges = self->_decoratedTextRanges;
    self->_decoratedTextRanges = v9;
  }
  if (a5 == 2)
  {
    [(_UITextViewSearchableObject *)self _updateHighlightLabelForMatchedRange:v14];
  }
  else
  {
    if (![(_UITextViewSearchableObject *)self compareFoundRange:self->_highlightedTextRange toRange:v14 inDocument:v8])
    {
      highlightedTextRange = self->_highlightedTextRange;
      self->_highlightedTextRange = 0;
    }
    id v12 = self->_decoratedTextRanges;
    if (a5) {
      [(NSMutableSet *)v12 addObject:v14];
    }
    else {
      [(NSMutableSet *)v12 removeObject:v14];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    [WeakRetained setNeedsLayout];
  }
}

- (void)clearAllDecoratedFoundText
{
  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  [(NSMutableSet *)self->_decoratedTextRanges removeAllObjects];
  id v4 = [(_UITextViewSearchableObject *)self _activeFindSession];
  int v5 = [v4 isSearching];

  if (v5)
  {
    v6 = [(_UITextViewSearchableObject *)self _activeFindSession];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57___UITextViewSearchableObject_clearAllDecoratedFoundText__block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    [v6 _performBlockWhenSearchResultsAreAvailable:v8];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    [WeakRetained setNeedsLayout];
  }
}

- (void)clearHighlightView
{
}

- (void)didEndFindSession
{
  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  [(NSMutableSet *)self->_decoratedTextRanges removeAllObjects];
  [(_UITextViewSearchableObject *)self _setHighlightViewVisible:0];
  [(_UITextViewSearchableObject *)self _setDimmingViewVisible:0];
}

- (void)useSelectionForFind
{
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v6 = [WeakRetained selectedText];

  if ([v6 length])
  {
    id v4 = objc_loadWeakRetained((id *)p_textView);
    int v5 = [v4 findInteraction];
    [v5 setSearchText:v6];

    +[UIFindInteraction _setGlobalFindBuffer:v6];
  }
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v5 = a3;
  id v6 = [(_UITextViewSearchableObject *)self _rangeProvider];
  uint64_t v7 = [v6 _nsrangeForTextRange:v5];
  uint64_t v9 = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "scrollRangeToVisible:", v7, v9);
}

- (void)_ensureSubviewOrder
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = objc_msgSend(WeakRetained, "subviews", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v10 = objc_loadWeakRetained((id *)p_textView);
  id v11 = [v10 subviews];
  id v12 = objc_loadWeakRetained((id *)p_textView);
  uint64_t v13 = [v12 _containerView];
  uint64_t v14 = [v11 indexOfObject:v13];

  if (self->_dimmingViewVisible) {
    dimmingView = self->_dimmingView;
  }
  else {
    dimmingView = 0;
  }
  v22[0] = dimmingView;
  if (self->_highlightViewVisible) {
    highlightView = self->_highlightView;
  }
  else {
    highlightView = 0;
  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v14 + 1;
  }
  v22[1] = highlightView;
  v22[2] = v6;
  [WeakRetained _ensureViewsAreInstalledInRelativeOrder:v22 viewCount:3 insertionStartIndex:v17];
}

- (BOOL)_usesTransientHighlightBehavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  char v3 = [WeakRetained findInteraction];
  char v4 = [v3 isFindNavigatorVisible] ^ 1;

  return v4;
}

- (void)_updateHighlightLabelForMatchedRange:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_highlightedTextRange, a3);
  if ([(_UITextViewSearchableObject *)self _usesTransientHighlightBehavior])
  {
    int v6 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    int v6 = [WeakRetained _range:v5 isEqualToRange:self->_visuallyHighlightedTextRange] ^ 1;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_textView);
  [v8 setSelectedTextRange:v5];

  id v9 = objc_loadWeakRetained((id *)&self->_textView);
  id v10 = [v9 _textInteraction];
  id v11 = [v10 assistantDelegate];

  if ([(_UITextViewSearchableObject *)self _usesTransientHighlightBehavior])
  {
    id v12 = [v11 grabberSuppressionAssertion];

    if (!v12)
    {
      uint64_t v13 = [v11 obtainSelectionGrabberSuppressionAssertion];
      [v11 setGrabberSuppressionAssertion:v13];
    }
  }
  [(_UITextViewSearchableObject *)self layoutManagedSubviews];
  if (v6)
  {
    highlightView = self->_highlightView;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68___UITextViewSearchableObject__updateHighlightLabelForMatchedRange___block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    [(UITextHighlightView *)highlightView animateWithCompletion:v15];
  }
}

- (id)targetedPreviewForHighlightRange:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = *(void *)off_1E52D2048;
  id v4 = a3;
  id v5 = +[UIColor blackColor];
  v12[0] = v5;
  v11[1] = *(void *)off_1E52D1F58;
  int v6 = +[UIColor clearColor];
  v12[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v9 = [WeakRetained _targetedPreviewForRange:v4 withRenderingAttributes:v7];

  return v9;
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_visuallyHighlightedTextRange, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
  objc_storeStrong((id *)&self->_highlightContentsImageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_decorationAttributes, 0);
  objc_storeStrong((id *)&self->_decoratedTextRanges, 0);
}

@end