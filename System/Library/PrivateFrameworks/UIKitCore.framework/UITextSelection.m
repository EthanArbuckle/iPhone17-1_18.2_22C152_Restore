@interface UITextSelection
- (BOOL)_allowsSelectionInversion;
- (BOOL)hasEditableSelection;
- (BOOL)isCommitting;
- (BOOL)isRangedSelectionSpanningDocument;
- (BOOL)isValid;
- (BOOL)pointAtEndOfLine:(CGPoint)a3;
- (BOOL)pointAtStartOfLine:(CGPoint)a3;
- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4;
- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5;
- (BOOL)willSelectionChange;
- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4;
- (CGRect)caretRect;
- (CGRect)caretRectAtBeginOfDocument;
- (CGRect)caretRectAtEndOfDocument;
- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4;
- (DOMRange)_domRange;
- (UITextInputPrivate)document;
- (UITextRange)base;
- (UITextRange)initialExtent;
- (UITextRange)selectedRange;
- (UITextSelection)initWithDocument:(id)a3;
- (id)_boundedOrInvertedSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)debugDescription;
- (id)selectedText;
- (id)selectionRects;
- (id)underlineRectsForRange:(id)a3;
- (id)wordContainingCaretSelection;
- (int64_t)granularity;
- (unint64_t)offsetInMarkedText;
- (void)aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection;
- (void)aggressivelyExpandSelectionToWordContainingCaretSelection;
- (void)alterSelection:(CGPoint)a3 granularity:(int64_t)a4;
- (void)alterSelectionGranularity:(int64_t)a3;
- (void)clearRangedSelectionInitialExtent;
- (void)clearSelection;
- (void)collapseSelection;
- (void)commit;
- (void)dealloc;
- (void)extendSelectionToPoint:(CGPoint)a3;
- (void)increaseSelectionGranularity;
- (void)invalidate;
- (void)moveCaretToBoundaryOfWhitespaceOrLine;
- (void)selectAll;
- (void)selectionChanged;
- (void)setBase:(id)a3;
- (void)setGranularRangedSelectionWithExtentPoint:(CGPoint)a3;
- (void)setGranularity:(int64_t)a3;
- (void)setHybridSelectionWithPoint:(CGPoint)a3;
- (void)setInitialExtent:(id)a3;
- (void)setRangedSelectionBaseToCurrentSelection;
- (void)setRangedSelectionBaseToCurrentSelectionEnd;
- (void)setRangedSelectionBaseToCurrentSelectionStart;
- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd;
- (void)setRangedSelectionInitialExtentToCurrentSelectionStart;
- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3;
- (void)setSelectedRange:(id)a3;
- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (void)setSelectionWithPoint:(CGPoint)a3;
- (void)smartExtendRangedSelection:(int)a3 downstream:(BOOL)a4;
@end

@implementation UITextSelection

- (UITextRange)selectedRange
{
  return self->_selectedRange;
}

- (void)selectionChanged
{
  id v4 = [(UITextSelection *)self document];
  v3 = [v4 selectedTextRange];
  [(UITextSelection *)self setSelectedRange:v3];
}

- (UITextInputPrivate)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (UITextInputPrivate *)WeakRetained;
}

- (void)setSelectedRange:(id)a3
{
}

- (UITextSelection)initWithDocument:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelection;
  v5 = [(UITextSelection *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v6->_isCommitting = 0;
    [(UITextSelection *)v6 selectionChanged];
  }

  return v6;
}

- (BOOL)hasEditableSelection
{
  uint64_t v3 = [(UITextSelection *)self selectedRange];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(UITextSelection *)self document];
    char v6 = [v5 isEditable];

    if (v6) {
      return 1;
    }
  }
  objc_super v8 = [(UITextSelection *)self _domRange];
  v9 = [v8 startPosition];
  char v10 = [v9 isEditable];

  return v10;
}

- (DOMRange)_domRange
{
  uint64_t v3 = [(UITextSelection *)self selectedRange];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(UITextSelection *)self selectedRange];
    char v6 = [v5 domRange];
  }
  else
  {
    char v6 = 0;
  }
  return (DOMRange *)v6;
}

- (void)dealloc
{
  [(UITextSelection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UITextSelection;
  [(UITextSelection *)&v3 dealloc];
}

- (void)invalidate
{
  [(UITextSelection *)self setBase:0];
  [(UITextSelection *)self setInitialExtent:0];
  [(UITextSelection *)self setSelectedRange:0];
  objc_storeWeak((id *)&self->_document, 0);
}

- (void)setInitialExtent:(id)a3
{
}

- (void)setBase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialExtent, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_selectedRange, 0);
  objc_destroyWeak((id *)&self->_document);
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)commit
{
  v9 = self;
  v2 = [(UITextSelection *)v9 document];
  BOOL v3 = [v2 interactionAssistant];

  v9->_isCommitting = 1;
  id v4 = [(UITextSelection *)v9 document];
  uint64_t v5 = [v4 selectedTextRange];
  uint64_t v6 = [(UITextSelection *)v9 selectedRange];
  v7 = (void *)v6;
  if (!(v5 | v6) || v5 && v6 && [(id)v5 isEqual:v6])
  {
    objc_super v8 = [v4 interactionAssistant];
    [v8 updateDisplayedSelection];
  }
  else
  {
    [v4 setSelectedTextRange:v7];
    objc_super v8 = [v4 interactionAssistant];
    [v8 setNeedsSelectionDisplayUpdate];
  }

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "setSelectionGranularity:", -[UITextSelection granularity](v9, "granularity"));
  }
  v9->_isCommitting = 0;
}

- (BOOL)willSelectionChange
{
  self->_isCommitting = 1;
  BOOL v3 = [(UITextSelection *)self document];
  uint64_t v4 = [v3 selectedTextRange];
  uint64_t v5 = [(UITextSelection *)self selectedRange];
  uint64_t v6 = (void *)v5;
  if (v4 | v5)
  {
    LOBYTE(v7) = 1;
    if (v4 && v5) {
      int v7 = [(id)v4 isEqual:v5] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  self->_isCommitting = 0;

  return v7;
}

- (id)selectionRects
{
  BOOL v3 = [(UITextSelection *)self document];
  uint64_t v4 = [(UITextSelection *)self selectedRange];
  uint64_t v5 = [v3 selectionRectsForRange:v4];

  return v5;
}

- (id)underlineRectsForRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextSelection *)self document];
  uint64_t v6 = [v5 selectionRectsForRange:v4];

  return v6;
}

- (CGRect)caretRect
{
  BOOL v3 = [(UITextSelection *)self selectedRange];

  if (v3)
  {
    id v4 = [(UITextSelection *)self document];
    uint64_t v5 = [(UITextSelection *)self selectedRange];
    uint64_t v6 = [v5 start];
    [v4 caretRectForPosition:v6];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)caretRectAtEndOfDocument
{
  v2 = [(UITextSelection *)self document];
  BOOL v3 = [v2 endOfDocument];
  [v2 caretRectForPosition:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)caretRectAtBeginOfDocument
{
  v2 = [(UITextSelection *)self document];
  BOOL v3 = [v2 beginningOfDocument];
  [v2 caretRectForPosition:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)wordContainingCaretSelection
{
  BOOL v3 = [(UITextSelection *)self document];
  double v4 = [(UITextSelection *)self selectedRange];
  double v5 = [v4 start];
  double v6 = [v3 _rangeOfEnclosingWord:v5];

  if (v6)
  {
    double v7 = [v3 textInRange:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)selectedText
{
  BOOL v3 = [(UITextSelection *)self document];
  double v4 = [(UITextSelection *)self selectedRange];
  double v5 = [v3 textInRange:v4];

  return v5;
}

- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(UITextSelection *)self document];
  double v9 = v8;
  if (!v4)
  {
    double v11 = objc_msgSend(v8, "closestPositionToPoint:", x, y);
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    double v13 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_6;
  }
  double v10 = [(UITextSelection *)self selectedRange];
  double v11 = objc_msgSend(v9, "closestPositionToPoint:withinRange:", v10, x, y);

  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  [v9 caretRectForPosition:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
LABEL_6:

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (unint64_t)offsetInMarkedText
{
  BOOL v3 = [(UITextSelection *)self selectedRange];
  BOOL v4 = [v3 start];

  double v5 = [(UITextSelection *)self document];
  double v6 = [v5 markedTextRange];
  double v7 = [v6 start];

  unint64_t v8 = [v5 offsetFromPosition:v7 toPosition:v4];
  return v8;
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(UITextSelection *)self document];
  double v6 = objc_msgSend(v8, "closestPositionToPoint:", x, y);
  double v7 = [v8 textRangeFromPosition:v6 toPosition:v6];
  [(UITextSelection *)self setSelectedRange:v7];
}

- (void)extendSelectionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v20 = [(UITextSelection *)self document];
  double v6 = objc_msgSend(v20, "closestPositionToPoint:", x, y);
  double v7 = [(UITextSelection *)self selectedRange];
  id v8 = [v7 start];
  uint64_t v9 = [v20 comparePosition:v6 toPosition:v8];

  double v10 = [(UITextSelection *)self selectedRange];
  double v11 = [v10 end];
  uint64_t v12 = [v20 comparePosition:v11 toPosition:v6];

  double v13 = [(UITextSelection *)self selectedRange];
  if (v9 == -1)
  {
    double v14 = [(UITextSelection *)self selectedRange];
    double v15 = [v14 end];
    double v16 = v20;
    double v17 = v6;
    double v18 = v15;
  }
  else
  {
    if (v12 != -1) {
      goto LABEL_6;
    }
    double v14 = [(UITextSelection *)self selectedRange];
    double v15 = [v14 start];
    double v16 = v20;
    double v17 = v15;
    double v18 = v6;
  }
  uint64_t v19 = [v16 textRangeFromPosition:v17 toPosition:v18];

  double v13 = (void *)v19;
LABEL_6:
  [(UITextSelection *)self setSelectedRange:v13];
}

- (void)setHybridSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v36 = [(UITextSelection *)self document];
  double v6 = objc_msgSend(v36, "closestPositionToPoint:", x, y);
  double v7 = [v36 _rangeOfTextUnit:1 enclosingPosition:v6];
  id v8 = v7;
  if (!v7)
  {
    v26 = [v36 textRangeFromPosition:v6 toPosition:v6];
    [(UITextSelection *)self setSelectedRange:v26];

    [(UITextSelection *)self setGranularity:0];
    goto LABEL_20;
  }
  uint64_t v9 = [v7 start];
  [v36 caretRectForPosition:v9];
  double MidX = CGRectGetMidX(v38);

  double v11 = [v8 end];
  [v36 caretRectForPosition:v11];
  double v12 = CGRectGetMidX(v39);

  double v13 = +[_UITextSelectionSettings sharedInstance];
  [v13 pinkWidthFactor];
  double v15 = v14;

  double v16 = +[_UITextSelectionSettings sharedInstance];
  [v16 minPinkWidth];
  double v18 = v17;

  uint64_t v19 = +[_UITextSelectionSettings sharedInstance];
  [v19 maxPinkWidth];
  double v21 = v20;

  double v23 = vabdd_f64(v12, MidX) * v15;
  if (v23 < v18) {
    double v23 = v18;
  }
  if (v23 >= v21) {
    double v23 = v21;
  }
  if (x < MidX || (double v22 = x - MidX, x - MidX < v23))
  {
    v27 = +[_UITextSelectionSettings sharedInstance];
    v28 = [v27 shouldPreferEndOfWord];
    int v29 = [v28 BOOLValue];

    if (v29
      && ([v8 start],
          v30 = objc_claimAutoreleasedReturnValue(),
          [v36 _positionFromPosition:v30 pastTextUnit:1 inDirection:1],
          v31 = objc_claimAutoreleasedReturnValue(),
          v30,
          v31))
    {
      id v32 = v31;
      v33 = v32;
    }
    else
    {
      id v32 = [v8 start];
      v33 = 0;
    }
    id v24 = [v36 textRangeFromPosition:v32 toPosition:v32];

    goto LABEL_18;
  }
  if (v12 < x || v12 - x < v23)
  {
    v34 = [v8 end];
    v35 = [v8 end];
    id v24 = [v36 textRangeFromPosition:v34 toPosition:v35];

LABEL_18:
    uint64_t v25 = 0;
    goto LABEL_19;
  }
  id v24 = v8;
  uint64_t v25 = 1;
LABEL_19:
  [(UITextSelection *)self setSelectedRange:v24];
  [(UITextSelection *)self setGranularity:v25];

LABEL_20:
}

- (void)selectAll
{
  id v6 = [(UITextSelection *)self document];
  BOOL v3 = [v6 beginningOfDocument];
  BOOL v4 = [v6 endOfDocument];
  double v5 = [v6 textRangeFromPosition:v3 toPosition:v4];
  [(UITextSelection *)self setSelectedRange:v5];
}

- (void)clearSelection
{
}

- (void)collapseSelection
{
  BOOL v3 = [(UITextSelection *)self selectedRange];
  if (v3)
  {
    id v7 = v3;
    BOOL v4 = [v3 end];
    double v5 = [(UITextSelection *)self document];
    id v6 = [v5 textRangeFromPosition:v4 toPosition:v4];

    [(UITextSelection *)self setSelectedRange:v6];
    BOOL v3 = v7;
  }
}

- (void)aggressivelyExpandSelectionToWordContainingCaretSelection
{
  id v40 = [(UITextSelection *)self document];
  BOOL v3 = [(UITextSelection *)self selectedRange];
  BOOL v4 = [v3 start];
  id v5 = [v40 _rangeOfEnclosingWord:v4];

  if (v5)
  {
    id v6 = [v40 textInRange:v5];
    int v7 = [v6 _containsEmoji];

    if (v7)
    {
      id v8 = [(UITextSelection *)self selectedRange];
      uint64_t v9 = [v8 start];
      double v10 = [v40 _rangeOfTextUnit:0 enclosingPosition:v9];

      double v11 = [v40 textInRange:v10];
      LODWORD(v9) = [v11 _containsEmoji];

      if (v9)
      {
        id v12 = v10;

        id v5 = v12;
      }
    }
    [(UITextSelection *)self setSelectedRange:v5];
  }
  else
  {
    double v13 = [(UITextSelection *)self selectedRange];
    id v5 = [v13 start];

    id v14 = 0;
    while (1)
    {
      double v15 = v14;
      id v14 = v5;

      double v16 = [v40 tokenizer];
      id v5 = [v16 positionFromPosition:v14 toBoundary:1 inDirection:1];

      if (!v5) {
        break;
      }
      if ([v40 comparePosition:v5 toPosition:v14])
      {
        double v17 = [v40 tokenizer];
        int v18 = [v17 isPosition:v5 atBoundary:1 inDirection:1];

        if (!v18) {
          continue;
        }
      }
      uint64_t v19 = [(UITextSelection *)self selectedRange];
      double v20 = [v19 start];

      if (!v20) {
        goto LABEL_22;
      }
      double v21 = [v40 tokenizer];
      double v22 = [(UITextSelection *)self selectedRange];
      double v23 = [v22 start];
      id v24 = [v21 positionFromPosition:v23 toBoundary:3 inDirection:1];

      if (v24 && [v40 comparePosition:v5 toPosition:v24] == -1)
      {
        id v25 = v24;

        id v5 = v25;
      }
      goto LABEL_21;
    }
    v26 = [v40 endOfDocument];
    v27 = [(UITextSelection *)self selectedRange];
    v28 = [v27 start];
    uint64_t v29 = [v40 comparePosition:v26 toPosition:v28];

    if (!v29)
    {
      v33 = [v40 tokenizer];
      v34 = [(UITextSelection *)self selectedRange];
      v35 = [v34 start];
      id v24 = [v33 positionFromPosition:v35 toBoundary:4 inDirection:1];

      if (v24)
      {
        id v36 = [v40 tokenizer];
        id v5 = [v36 positionFromPosition:v24 toBoundary:1 inDirection:1];

        if (!v5) {
          id v5 = v24;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    v30 = [v40 tokenizer];
    v31 = [(UITextSelection *)self selectedRange];
    id v32 = [v31 start];
    id v5 = [v30 positionFromPosition:v32 toBoundary:1 inDirection:0];

    if (!v5) {
      goto LABEL_23;
    }
LABEL_22:
    v37 = [(UITextSelection *)self selectedRange];
    CGRect v38 = [v37 start];
    CGRect v39 = [v40 textRangeFromPosition:v5 toPosition:v38];

    [(UITextSelection *)self setSelectedRange:v39];
LABEL_23:
  }
}

- (void)aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection
{
  id v6 = [(UITextSelection *)self document];
  BOOL v3 = [(UITextSelection *)self selectedRange];
  uint64_t v4 = [v6 _rangeOfSmartSelectionIncludingRange:v3];
  id v5 = (void *)v4;
  if (v3 == (void *)v4)
  {
    [(UITextSelection *)self aggressivelyExpandSelectionToWordContainingCaretSelection];
  }
  else if (v4)
  {
    [(UITextSelection *)self setSelectedRange:v4];
  }
}

- (void)alterSelection:(CGPoint)a3 granularity:(int64_t)a4
{
  -[UITextSelection setSelectionWithPoint:](self, "setSelectionWithPoint:", a3.x, a3.y);
  [(UITextSelection *)self alterSelectionGranularity:a4];
}

- (void)alterSelectionGranularity:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v9 = [(UITextSelection *)self selectedRange];

      if (v9)
      {
        if ([(UITextSelection *)self hasEditableSelection]) {
          [(UITextSelection *)self aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection];
        }
        else {
          [(UITextSelection *)self aggressivelyExpandSelectionToWordContainingCaretSelection];
        }
        break;
      }
      return;
    case 2:
      id v5 = [(UITextSelection *)self document];
      id v6 = [(UITextSelection *)self selectedRange];
      int v7 = [v6 start];
      uint64_t v8 = [v5 _rangeOfSentenceEnclosingPosition:v7];
      goto LABEL_7;
    case 3:
    case 4:
      id v5 = [(UITextSelection *)self document];
      id v6 = [(UITextSelection *)self selectedRange];
      int v7 = [v6 start];
      uint64_t v8 = [v5 _rangeOfParagraphEnclosingPosition:v7];
LABEL_7:
      double v10 = (void *)v8;

      goto LABEL_9;
    case 5:
      id v5 = [(UITextSelection *)self document];
      double v10 = [v5 _fullRange];
LABEL_9:

      if (v10) {
        [(UITextSelection *)self setSelectedRange:v10];
      }

      break;
    default:
      break;
  }
  [(UITextSelection *)self setGranularity:a3];
}

- (void)increaseSelectionGranularity
{
  if ([(UITextSelection *)self granularity] <= 2) {
    int64_t v3 = [(UITextSelection *)self granularity] + 1;
  }
  else {
    int64_t v3 = 5;
  }
  [(UITextSelection *)self alterSelectionGranularity:v3];
}

- (void)moveCaretToBoundaryOfWhitespaceOrLine
{
  int64_t v3 = [(UITextSelection *)self selectedRange];
  id v7 = [v3 start];

  uint64_t v4 = [(UITextSelection *)self document];
  id v5 = [v4 _findPleasingWordBoundaryFromPosition:v7];
  id v6 = [v4 textRangeFromPosition:v5 toPosition:v5];
  [(UITextSelection *)self setSelectedRange:v6];
}

- (BOOL)pointAtStartOfLine:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextSelection *)self document];
  id v6 = objc_msgSend(v5, "closestPositionToPoint:", x, y);
  id v7 = [v5 tokenizer];
  char v8 = [v7 isPosition:v6 atBoundary:4 inDirection:1];

  return v8;
}

- (BOOL)pointAtEndOfLine:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UITextSelection *)self document];
  id v6 = objc_msgSend(v5, "closestPositionToPoint:", x, y);
  id v7 = [v5 tokenizer];
  char v8 = [v7 isPosition:v6 atBoundary:4 inDirection:0];

  return v8;
}

- (BOOL)isRangedSelectionSpanningDocument
{
  int64_t v3 = [(UITextSelection *)self selectedRange];
  uint64_t v4 = v3;
  if (v3 && [v3 _isRanged])
  {
    id v5 = [(UITextSelection *)self document];
    id v6 = [v4 start];
    id v7 = [v5 beginningOfDocument];
    if ([v5 comparePosition:v6 toPosition:v7])
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v9 = [v4 end];
      double v10 = [v5 endOfDocument];
      BOOL v8 = [v5 comparePosition:v9 toPosition:v10] == 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  id v3 = [(UITextSelection *)self selectedRange];
  [(UITextSelection *)self setBase:v3];
}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  id v3 = [(UITextSelection *)self selectedRange];
  id v6 = [v3 start];

  if (v6)
  {
    uint64_t v4 = [(UITextSelection *)self document];
    id v5 = [v4 textRangeFromPosition:v6 toPosition:v6];
    [(UITextSelection *)self setBase:v5];
  }
  else
  {
    [(UITextSelection *)self setBase:0];
  }
}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  id v3 = [(UITextSelection *)self selectedRange];
  id v6 = [v3 end];

  if (v6)
  {
    uint64_t v4 = [(UITextSelection *)self document];
    id v5 = [v4 textRangeFromPosition:v6 toPosition:v6];
    [(UITextSelection *)self setBase:v5];
  }
  else
  {
    [(UITextSelection *)self setBase:0];
  }
}

- (void)clearRangedSelectionInitialExtent
{
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  id v3 = [(UITextSelection *)self selectedRange];
  id v6 = [v3 start];

  if (v6)
  {
    uint64_t v4 = [(UITextSelection *)self document];
    id v5 = [v4 textRangeFromPosition:v6 toPosition:v6];
    [(UITextSelection *)self setInitialExtent:v5];
  }
  else
  {
    [(UITextSelection *)self setInitialExtent:0];
  }
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  id v3 = [(UITextSelection *)self selectedRange];
  id v6 = [v3 end];

  if (v6)
  {
    uint64_t v4 = [(UITextSelection *)self document];
    id v5 = [v4 textRangeFromPosition:v6 toPosition:v6];
    [(UITextSelection *)self setInitialExtent:v5];
  }
  else
  {
    [(UITextSelection *)self setInitialExtent:0];
  }
}

- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MinY = a3.y;
  double MinX = a3.x;
  if (a3.x >= CGRectGetMinX(a4))
  {
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    if (MinX >= CGRectGetMaxX(v14))
    {
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      double MinX = CGRectGetMaxX(v15) + -1.0;
    }
  }
  else
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v13);
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (MinY >= CGRectGetMinY(v16))
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    if (MinY >= CGRectGetMaxY(v18))
    {
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      double MinY = CGRectGetMaxY(v19) + -1.0;
    }
  }
  else
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v17);
  }
  double v10 = MinX;
  double v11 = MinY;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (BOOL)_allowsSelectionInversion
{
  return 1;
}

- (id)_boundedOrInvertedSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = a5;
  CGRect v13 = [(UITextSelection *)self document];
  if (a6) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = 1;
  }
  if (!_os_feature_enabled_impl()
    || ![(UITextSelection *)self _allowsSelectionInversion]
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v11, v12, a6, x, y),
        (CGRect v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CGRect v15 = [v13 textRangeFromPosition:v12 toPosition:v11];
    if ([v13 comparePosition:v11 toPosition:v12] != v14)
    {
      if ([(UITextSelection *)self _allowsSelectionInversion])
      {
        uint64_t v16 = [v13 textRangeFromPosition:v11 toPosition:v12];
      }
      else
      {
        [v13 caretRectForPosition:v12];
        if (v20 <= v19) {
          double x = CGRectGetMidX(*(CGRect *)&v17);
        }
        else {
          double y = CGRectGetMidY(*(CGRect *)&v17);
        }
        double v21 = objc_msgSend(v13, "closestPositionToPoint:", x, y);
        if (v21 && [v13 comparePosition:v21 toPosition:v12] == v14)
        {
          id v22 = v21;
        }
        else
        {
          double v23 = [v13 tokenizer];
          id v22 = [v23 positionFromPosition:v12 toBoundary:0 inDirection:a6];
        }
        uint64_t v16 = [v13 textRangeFromPosition:v12 toPosition:v22];

        CGRect v15 = v22;
      }

      CGRect v15 = (void *)v16;
    }
  }
  id v24 = v15;

  return v24;
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v9 = [(UITextSelection *)self base];

  if (v9)
  {
    double v10 = [(UITextSelection *)self document];
    id v11 = [v10 textInputView];
    id v12 = [v11 _scroller];
    CGRect v13 = v12;
    if (v12 && ([v12 isScrollEnabled] & 1) == 0)
    {
      [v11 visibleBounds];
      -[UITextSelection clipPoint:inRect:](self, "clipPoint:inRect:", x, y, v14, v15, v16, v17);
      double x = v18;
      double y = v19;
    }
    double v20 = objc_msgSend(v10, "closestPositionToPoint:", x, y);
    if (v20) {
      goto LABEL_11;
    }
    double v21 = [v10 beginningOfDocument];
    [v10 caretRectForPosition:v21];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v30 = [v10 endOfDocument];
    [v10 caretRectForPosition:v30];
    CGFloat v49 = v32;
    CGFloat v51 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    v53.origin.double x = v23;
    v53.origin.double y = v25;
    v53.size.CGFloat width = v27;
    v53.size.CGFloat height = v29;
    if (y <= CGRectGetMinY(v53))
    {
      uint64_t v37 = [v10 beginningOfDocument];
    }
    else
    {
      v54.origin.double y = v49;
      v54.origin.double x = v51;
      v54.size.CGFloat width = v34;
      v54.size.CGFloat height = v36;
      if (y < CGRectGetMaxY(v54)) {
        goto LABEL_21;
      }
      uint64_t v37 = [v10 endOfDocument];
    }
    double v20 = (void *)v37;
    if (v37)
    {
LABEL_11:
      CGRect v38 = [(UITextSelection *)self base];
      if ([v38 isEmpty])
      {
LABEL_14:

LABEL_15:
        v41 = [(UITextSelection *)self base];
        v42 = v41;
        if (v5) {
          [v41 start];
        }
        else {
        v43 = [v41 end];
        }

        v44 = -[UITextSelection _boundedOrInvertedSelectionRangeForExtent:forPoint:fromPosition:inDirection:](self, "_boundedOrInvertedSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v20, v43, !v5, x, y);
        if (v44) {
          [(UITextSelection *)self setSelectedRange:v44];
        }

        goto LABEL_25;
      }
      CGRect v39 = [(UITextSelection *)self base];
      id v40 = [v39 start];
      if ([v10 comparePosition:v40 toPosition:v20] != -1)
      {

        goto LABEL_14;
      }
      v45 = [(UITextSelection *)self base];
      [v45 end];
      v46 = v52 = v11;
      uint64_t v50 = [v10 comparePosition:v46 toPosition:v20];

      id v11 = v52;
      if (v50 != 1) {
        goto LABEL_15;
      }
      v47 = [(UITextSelection *)self base];
      [(UITextSelection *)self setSelectedRange:v47];

LABEL_24:
      LOBYTE(v5) = 0;
LABEL_25:

      return v5;
    }
LABEL_21:
    double v20 = [(UITextSelection *)self base];
    [(UITextSelection *)self setSelectedRange:v20];
    goto LABEL_24;
  }
  return v5;
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4
{
  return -[UITextSelection setRangedSelectionExtentPoint:baseIsStart:allowFlipping:](self, "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", a4, 0, a3.x, a3.y);
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v13 = [(UITextSelection *)self document];
  uint64_t v9 = objc_msgSend(v13, "closestPositionToPoint:", v7, v6);
  uint64_t v10 = objc_msgSend(v13, "closestPositionToPoint:", x, y);
  id v11 = (void *)v10;
  if (v9 && v10)
  {
    id v12 = [v13 textRangeFromPosition:v9 toPosition:v10];
    [(UITextSelection *)self setSelectedRange:v12];
  }
  else
  {
    [(UITextSelection *)self setSelectedRange:0];
  }
}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v20 = [(UITextSelection *)self document];
  double v6 = objc_msgSend(v20, "closestPositionToPoint:", x, y);
  if (v6)
  {
    double v7 = [(UITextSelection *)self base];

    if (v7)
    {
      BOOL v8 = [(UITextSelection *)self base];
      id v9 = [v8 start];

      uint64_t v10 = [(UITextSelection *)self base];
      id v11 = [v10 end];

      uint64_t v12 = [v20 offsetFromPosition:v9 toPosition:v6];
      uint64_t v13 = [v20 offsetFromPosition:v6 toPosition:v11];
      if (v12 <= 0)
      {
        id v17 = v6;
        double v16 = v9;
        id v9 = v17;
      }
      else
      {
        unint64_t v14 = v13;
        if (v13 <= 0)
        {
          id v18 = v6;
          double v16 = v11;
          id v11 = v18;
        }
        else
        {
          id v15 = v6;
          if (v12 >= v14) {
            double v16 = v11;
          }
          else {
            double v16 = v9;
          }
          if (v12 >= v14) {
            id v11 = v15;
          }
          else {
            id v9 = v15;
          }
        }
      }

      double v19 = [v20 textRangeFromPosition:v9 toPosition:v11];
      [(UITextSelection *)self setSelectedRange:v19];
    }
  }
}

- (void)setGranularRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v20 = [(UITextSelection *)self document];
  double v6 = objc_msgSend(v20, "closestPositionToPoint:", x, y);
  if (v6)
  {
    double v7 = [(UITextSelection *)self base];

    if (v7)
    {
      BOOL v8 = objc_msgSend(v20, "_rangeOfTextUnit:enclosingPosition:", -[UITextSelection granularity](self, "granularity"), v6);
      id v9 = [(UITextSelection *)self base];
      uint64_t v10 = [v9 start];

      id v11 = [(UITextSelection *)self base];
      uint64_t v12 = [v11 end];

      if ([v20 comparePosition:v6 toPosition:v10] == -1)
      {
        uint64_t v17 = [v8 start];
        unint64_t v14 = (void *)v17;
        if (v17) {
          id v15 = (void *)v17;
        }
        else {
          id v15 = v6;
        }
        double v16 = v10;
        uint64_t v10 = v15;
      }
      else
      {
        if ([v20 comparePosition:v6 toPosition:v12] != 1)
        {
LABEL_14:
          double v19 = [v20 textRangeFromPosition:v10 toPosition:v12];
          [(UITextSelection *)self setSelectedRange:v19];

          goto LABEL_15;
        }
        uint64_t v13 = [v8 end];
        unint64_t v14 = (void *)v13;
        if (v13) {
          id v15 = (void *)v13;
        }
        else {
          id v15 = v6;
        }
        double v16 = v12;
        uint64_t v12 = v15;
      }
      id v18 = v15;

      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)smartExtendRangedSelection:(int)a3 downstream:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(UITextSelection *)self selectedRange];
  if (!v7) {
    return;
  }
  BOOL v8 = (void *)v7;
  id v9 = [(UITextSelection *)self selectedRange];
  char v10 = [v9 isEmpty];

  if (v10) {
    return;
  }
  id v49 = [(UITextSelection *)self document];
  id v11 = [(UITextSelection *)self selectedRange];
  uint64_t v12 = [v11 start];

  uint64_t v13 = [(UITextSelection *)self selectedRange];
  unint64_t v14 = [v13 end];

  if (a3 == -1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v15 = [(UITextSelection *)self initialExtent];
    double v16 = v15;
    if (v4) {
      [v15 end];
    }
    else {
    uint64_t v17 = [v15 start];
    }
  }
  if (v4) {
    id v18 = v12;
  }
  else {
    id v18 = v14;
  }
  if (v4) {
    double v19 = v14;
  }
  else {
    double v19 = v12;
  }
  id v20 = v18;
  id v21 = v19;
  if (!v17 || ([v17 isEqual:v21] & 1) == 0)
  {
    v48 = v12;
    BOOL v22 = !v4;
    CGFloat v23 = [v49 tokenizer];
    char v24 = [v23 isPosition:v21 atBoundary:1 inDirection:v22];

    if (v24)
    {
      uint64_t v12 = v48;
      goto LABEL_49;
    }
    CGFloat v25 = [v49 tokenizer];
    BOOL v47 = v4;
    int v26 = [v25 isPosition:v21 atBoundary:1 inDirection:v4];

    if (v26)
    {
      if (v4) {
        uint64_t v27 = -1;
      }
      else {
        uint64_t v27 = 1;
      }
      uint64_t v28 = [v49 positionFromPosition:v21 offset:v27];

      id v21 = (id)v28;
    }
    CGFloat v29 = [v49 tokenizer];
    v30 = [v29 positionFromPosition:v21 toBoundary:1 inDirection:!v4];

    if (v30)
    {
      double v31 = [v49 tokenizer];
      int v32 = [v31 isPosition:v30 atBoundary:1 inDirection:!v4];
      int v33 = v32;
      if (v17 && v32)
      {
        char v34 = [v17 isEqual:v30];

        if ((v34 & 1) == 0)
        {
LABEL_29:
          id v35 = v30;

          id v21 = v35;
          uint64_t v12 = v48;
          goto LABEL_47;
        }
      }
      else
      {

        if (v33) {
          goto LABEL_29;
        }
      }
    }
    if (v21)
    {
      uint64_t v36 = 1;
      if (!v4) {
        uint64_t v36 = -1;
      }
      v45 = v30;
      uint64_t v46 = v36;
      while (1)
      {
        uint64_t v37 = [v49 tokenizer];
        if (([v37 isPosition:v21 atBoundary:1 inDirection:v22] & 1) != 0
          || ([v21 isEqual:v20] & 1) != 0)
        {
          break;
        }
        CGRect v38 = [v49 tokenizer];
        if ([v38 isPosition:v21 atBoundary:4 inDirection:v22])
        {

          break;
        }
        CGRect v39 = [v49 tokenizer];
        char v40 = [v39 isPosition:v21 atBoundary:4 inDirection:v47];

        if (v40) {
          goto LABEL_44;
        }
        uint64_t v41 = [v49 positionFromPosition:v21 offset:v46];

        id v21 = (id)v41;
        if (!v41)
        {
          uint64_t v12 = v48;
          v30 = v45;
          goto LABEL_45;
        }
      }

LABEL_44:
      uint64_t v12 = v48;
      v30 = v45;
      if (![v21 isEqual:v20]) {
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v12 = v48;
    }
LABEL_45:
    id v42 = v30;

    if (!v30)
    {
      id v21 = 0;
      goto LABEL_48;
    }
    id v21 = v42;
LABEL_47:
    [v49 textRangeFromPosition:v20 toPosition:v21];
    v44 = v43 = v30;
    [(UITextSelection *)self setSelectedRange:v44];

    v30 = v43;
LABEL_48:
  }
LABEL_49:
}

- (id)debugDescription
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double v6 = (void *)v5;
  if (self->_isCommitting) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p base: %@; granularity: %ld; initialExtent: %@; selectedRange: %@; isCommitting: %@>",
    v5,
    self,
    self->_base,
    self->_granularity,
    self->_initialExtent,
    self->_selectedRange,
  BOOL v8 = v7);

  return v8;
}

- (UITextRange)base
{
  return self->_base;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int64_t)a3
{
  self->_granularitdouble y = a3;
}

- (UITextRange)initialExtent
{
  return self->_initialExtent;
}

- (BOOL)isCommitting
{
  return self->_isCommitting;
}

@end