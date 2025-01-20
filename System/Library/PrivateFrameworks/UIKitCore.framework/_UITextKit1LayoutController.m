@interface _UITextKit1LayoutController
- (BOOL)canAccessLayoutManager;
- (BOOL)drawsDebugBaselines;
- (BOOL)includesTextListMarkers;
- (BOOL)isEditable;
- (BOOL)usesTiledViews;
- (CGRect)boundingRectForCharacterRange:(_NSRange)a3;
- (CGRect)boundingRectForRange:(id)a3;
- (CGRect)extraLineFragmentRect;
- (CGRect)insertionRectForPosition:(id)a3 typingAttributes:(id)a4 placeholderAttachment:(id)a5 textContainer:(id *)a6;
- (CGRect)unionRectForCharacterRange:(_NSRange)a3 bottomInset:(double)a4;
- (CGRect)updateLayoutForSizeChangeOfTextContainer:(id)a3;
- (CGRect)usedRectForTextContainer:(id)a3;
- (CUIStyleEffectConfiguration)styleEffectConfiguration;
- (NSArray)textContainers;
- (NSLayoutManager)layoutManager;
- (NSLayoutManagerDelegate)layoutManagerDelegate;
- (NSTextStorage)textStorage;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)documentRange;
- (_NSRange)characterRangeForTextRange:(id)a3;
- (_NSRange)characterRangeForTextRange:(id)a3 clippedToDocument:(BOOL)a4;
- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4;
- (double)baselineOffsetForFirstGlyph;
- (double)maxTileHeight;
- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)_writingToolsMinimumContextualRangeForRange:(id)a3;
- (id)annotatedSubstringForRange:(id)a3;
- (id)annotationAttribute:(id)a3 atPosition:(id)a4;
- (id)attributedTextInRange:(id)a3;
- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4;
- (id)dequeueCanvasViewForTextContainer:(id)a3;
- (id)emptyTextRangeAtPosition:(id)a3;
- (id)initWithTextView:(void *)a3 textContainer:;
- (id)initWithTextView:(void *)a3 textContainer:(void *)a4 layoutManager:(void *)a5 textStorage:;
- (id)nearestPositionAtPoint:(CGPoint)a3 inContainer:(id)a4;
- (id)originalLayoutManager;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5;
- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4;
- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4;
- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5;
- (id)textContainerForPosition:(id)a3;
- (id)textRangeForBounds:(CGRect)a3 inTextContainer:(id)a4 layoutIfNeeded:(BOOL)a5;
- (id)textRangeForCharacterRange:(_NSRange)a3;
- (id)textRangeForLineEnclosingPosition:(id)a3;
- (id)textRangeForLineEnclosingPosition:(id)a3 effectiveAffinity:(int64_t)a4;
- (id)textRangeForTextKit2Ranges:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)viewportRangeForTextContainer:(id)a3;
- (int64_t)affinityForPosition:(id)a3;
- (int64_t)baseWritingDirectionAtPosition:(id)a3;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (unint64_t)_textStorageLength;
- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5;
- (void)addGhostedRange:(id)a3;
- (void)addInvisibleRange:(id)a3;
- (void)addRenderingAttributes:(id)a3 forRange:(id)a4;
- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4;
- (void)ensureLayoutForRange:(id)a3;
- (void)ensureLayoutForTextContainer:(id)a3;
- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4;
- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5;
- (void)invalidateDisplayForCharacterRange:(_NSRange)a3;
- (void)invalidateLayoutForRange:(id)a3;
- (void)removeAllGhostedRanges;
- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4;
- (void)removeInvisibleRange:(id)a3;
- (void)removeRenderingAttributes:(id)a3 forRange:(id)a4;
- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5;
- (void)resetFontForExtraBulletRendering;
- (void)resumeTiling;
- (void)setDrawsDebugBaselines:(BOOL)a3;
- (void)setLayoutManagerDelegate:(id)a3;
- (void)setMaxTileHeight:(double)a3;
- (void)setStyleEffectConfiguration:(id)a3;
- (void)setUsesTiledViews:(BOOL)a3;
- (void)suspendTiling;
@end

@implementation _UITextKit1LayoutController

- (id)initWithTextView:(void *)a3 textContainer:(void *)a4 layoutManager:(void *)a5 textStorage:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v13 = [v10 layoutManager];

    if (v13)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:sel_initWithTextView_textContainer_layoutManager_textStorage_ object:a1 file:@"_UITextKit1LayoutController.m" lineNumber:50 description:@"text container should not already have a layout manager"];
    }
    v21.receiver = a1;
    v21.super_class = (Class)_UITextKit1LayoutController;
    v14 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeWeak(v14 + 5, v9);
      if (v11)
      {
        objc_storeStrong(a1 + 6, a4);
      }
      else
      {
        id v15 = objc_alloc_init((Class)off_1E52D2CC0);
        id v16 = a1[6];
        a1[6] = v15;

        [v12 addLayoutManager:a1[6]];
      }
      objc_msgSend(a1[6], "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v12, "length"), 0);
      v17 = [v11 textContainers];
      char v18 = [v17 containsObject:v10];

      if ((v18 & 1) == 0) {
        [a1[6] addTextContainer:v10];
      }
    }
  }

  return a1;
}

- (id)initWithTextView:(void *)a3 textContainer:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [a3 layoutManager];
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel_initWithTextView_textContainer_ object:a1 file:@"_UITextKit1LayoutController.m" lineNumber:74 description:@"text container must already have a layout manager"];
    }
    v11.receiver = a1;
    v11.super_class = (Class)_UITextKit1LayoutController;
    v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 5, v5);
      objc_storeStrong(v8 + 6, v6);
    }
    a1 = v8;
  }
  return a1;
}

- (unint64_t)_textStorageLength
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(_UITextKit1LayoutController *)self textStorage];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___UITextKit1LayoutController__textStorageLength__block_invoke;
  v5[3] = &unk_1E52DF988;
  v5[4] = &v6;
  [v2 coordinateReading:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained layoutManager];
  }
  else
  {
    id v5 = self->_originalLayoutManager;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)originalLayoutManager
{
  if (a1)
  {
    a1 = (id *)a1[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSTextStorage)textStorage
{
  v2 = [(_UITextKit1LayoutController *)self layoutManager];
  unint64_t v3 = [v2 textStorage];

  return (NSTextStorage *)v3;
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)+[_UITextKitTextPosition positionWithOffset:0 affinity:0];
}

- (UITextPosition)endOfDocument
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self _textStorageLength];
  return (UITextPosition *)+[_UITextKitTextPosition positionWithOffset:v2];
}

- (UITextRange)documentRange
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self _textStorageLength];
  return (UITextRange *)+[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, v2);
}

- (id)viewportRangeForTextContainer:(id)a3
{
  return 0;
}

- (id)emptyTextRangeAtPosition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 offset];
  uint64_t v5 = [v3 affinity];

  return +[_UITextKitTextRange rangeWithRange:affinity:](_UITextKitTextRange, "rangeWithRange:affinity:", v4, 0, v5);
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return +[_UITextKitTextRange rangeWithStart:a3 end:a4];
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a4)
  {
    id v14 = v8;
    goto LABEL_6;
  }
  unint64_t v10 = [v8 offset] + a4;
  objc_super v11 = [(_UITextKit1LayoutController *)self textStorage];
  unint64_t v12 = [v11 length];

  v13 = 0;
  if ((v10 & 0x8000000000000000) == 0 && v10 <= v12)
  {
    id v14 = +[_UITextKitTextPosition positionWithOffset:v10 affinity:a5];
LABEL_6:
    v13 = v14;
  }

  return v13;
}

- (id)textRangeForLineEnclosingPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextKit1LayoutController *)self textRangeForLineEnclosingPosition:v4 effectiveAffinity:[(_UITextKit1LayoutController *)self affinityForPosition:v4]];

  return v5;
}

- (id)textRangeForLineEnclosingPosition:(id)a3 effectiveAffinity:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__23;
  v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  v7 = [(_UITextKit1LayoutController *)self layoutManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83___UITextKit1LayoutController_textRangeForLineEnclosingPosition_effectiveAffinity___block_invoke;
  v11[3] = &unk_1E52DF9B0;
  v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int64_t v14 = a4;
  [v7 coordinateAccess:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)textRangeForTextKit2Ranges:(id)a3
{
  return 0;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  return -[_UITextKit1LayoutController textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", a5, a3, a6, a4.x, a4.y);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return [a3 compare:a4];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 offset];
  uint64_t v7 = [v5 offset];

  return v6 - v7;
}

- (int64_t)affinityForPosition:(id)a3
{
  return [a3 affinity];
}

- (CGRect)insertionRectForPosition:(id)a3 typingAttributes:(id)a4 placeholderAttachment:(id)a5 textContainer:(id *)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v40 = a4;
  id v41 = a5;
  id v11 = v10;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v66 = [v11 offset];
  uint64_t v57 = 0;
  v58 = (double *)&v57;
  uint64_t v59 = 0x4010000000;
  v60 = &unk_186D7DBA7;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v61 = *MEMORY[0x1E4F1DB20];
  long long v62 = v12;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__23;
  v55 = __Block_byref_object_dispose__23;
  id v56 = 0;
  v13 = [(_UITextKit1LayoutController *)self textStorage];
  uint64_t v14 = [v11 affinity];
  unint64_t v15 = v64[3];
  BOOL v17 = v14 == 1 && v15 != 0;
  if (v15 <= [v13 length] || v64[3] == 0x7FFFFFFFFFFFFFFFLL && v17)
  {
    char v18 = [(_UITextKit1LayoutController *)self layoutManager];
    if (v17)
    {
      v19 = [v13 string];
      uint64_t v20 = v64[3];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = [v19 length];
        v64[3] = v20;
      }
      if (v20)
      {
        uint64_t v21 = [v19 rangeOfComposedCharacterSequenceAtIndex:v20 - 1];
        v23 = objc_msgSend(v19, "substringWithRange:", v21, v22);
        v24 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        BOOL v25 = [v23 rangeOfCharacterFromSet:v24] == 0;

        if (!v25)
        {
          uint64_t v26 = [v18 rangeOfCharacterClusterAtIndex:v64[3] - 1 type:3];
          v64[3] = v26;
        }
      }
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __109___UITextKit1LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke;
    v42[3] = &unk_1E52DF9D8;
    v46 = &v63;
    id v43 = v41;
    v47 = &v51;
    id v44 = v40;
    v45 = self;
    BOOL v50 = v17;
    v48 = &v57;
    SEL v49 = a2;
    [v18 coordinateAccess:v42];
    if (a6) {
      *a6 = (id) v52[5];
    }
    double v27 = v58[4];
    double v28 = v58[5];
    double v29 = v58[6];
    double v30 = v58[7];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v37 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        uint64_t v38 = v64[3];
        *(_DWORD *)buf = 134217984;
        uint64_t v68 = v38;
        _os_log_fault_impl(&dword_1853B0000, v37, OS_LOG_TYPE_FAULT, "requesting caretRectForPosition: with a position beyond the NSTextStorage (%ld)", buf, 0xCu);
      }
    }
    else
    {
      v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer____s_category)+ 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = v64[3];
        *(_DWORD *)buf = 134217984;
        uint64_t v68 = v32;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "requesting caretRectForPosition: with a position beyond the NSTextStorage (%ld)", buf, 0xCu);
      }
    }
    double v27 = v58[4];
    double v28 = v58[5];
    double v29 = v58[6];
    double v30 = v58[7];
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  double v33 = v27;
  double v34 = v28;
  double v35 = v29;
  double v36 = v30;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)textRangeForBounds:(CGRect)a3 inTextContainer:(id)a4 layoutIfNeeded:(BOOL)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3010000000;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  double v27 = &unk_186D7DBA7;
  long long v12 = [(_UITextKit1LayoutController *)self layoutManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81___UITextKit1LayoutController_textRangeForBounds_inTextContainer_layoutIfNeeded___block_invoke;
  v16[3] = &unk_1E52DFA00;
  BOOL v23 = a5;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  id v13 = v11;
  id v17 = v13;
  char v18 = &v24;
  [v12 coordinateAccess:v16];

  uint64_t v14 = -[_UITextKit1LayoutController textRangeForCharacterRange:](self, "textRangeForCharacterRange:", v25[4], v25[5]);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__23;
  CGFloat v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  uint64_t v7 = [(_UITextKit1LayoutController *)self textStorage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64___UITextKit1LayoutController_attributesAtPosition_inDirection___block_invoke;
  v11[3] = &unk_1E52DFA28;
  id v13 = &v15;
  id v8 = v6;
  id v12 = v8;
  int64_t v14 = a4;
  [v7 coordinateReading:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (int64_t)baseWritingDirectionAtPosition:(id)a3
{
  char v11 = 0;
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v6 = [v4 offset];

  uint64_t v7 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v6, 1, 0);
  objc_msgSend(v5, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v7, v8 != 0, 0, 0, 0, &v11);
  int64_t v9 = v11 & 1;

  return v9;
}

- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [MEMORY[0x1E4F1CA48] array];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__23;
  v26[4] = __Block_byref_object_dispose__23;
  id v27 = 0;
  id v12 = [(_UITextKit1LayoutController *)self layoutManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke;
  v20[3] = &unk_1E52DFA78;
  id v13 = v8;
  id v21 = v13;
  BOOL v25 = v26;
  id v14 = v10;
  id v24 = v14;
  id v15 = v9;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  [v12 coordinateAccess:v20];

  uint64_t v17 = v23;
  id v18 = v16;

  _Block_object_dispose(v26, 8);
  return v18;
}

- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  CGFloat v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 1;
  id v8 = [(_UITextKit1LayoutController *)self layoutManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___UITextKit1LayoutController_cursorPositionAtPoint_inContainer___block_invoke;
  v12[3] = &unk_1E52DFAA0;
  CGFloat v16 = x;
  CGFloat v17 = y;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v18;
  id v15 = &v22;
  [v8 coordinateAccess:v12];

  id v10 = +[_UITextKitTextPosition positionWithOffset:v23[3] affinity:v19[3]];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)nearestPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v8 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __66___UITextKit1LayoutController_nearestPositionAtPoint_inContainer___block_invoke;
  id v15 = &unk_1E52DFAC8;
  CGFloat v18 = x;
  CGFloat v19 = y;
  id v9 = v7;
  id v16 = v9;
  CGFloat v17 = &v20;
  [v8 coordinateAccess:&v12];

  id v10 = +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", v21[3], v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v9 = [v7 asRange];
  uint64_t v11 = v10;

  uint64_t v12 = objc_msgSend(v8, "glyphRangeForCharacterRange:actualCharacterRange:", v9, v11, 0);
  uint64_t v14 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76___UITextKit1LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke;
  v17[3] = &unk_1E52DFAF0;
  id v18 = v8;
  id v19 = v6;
  id v15 = v6;
  id v16 = v8;
  objc_msgSend(v16, "enumerateLineFragmentsForGlyphRange:usingBlock:", v12, v14, v17);
}

- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v16 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v11 = [v10 asRange];
  uint64_t v13 = v12;

  uint64_t v14 = objc_msgSend(v16, "glyphRangeForCharacterRange:actualCharacterRange:", v11, v13, 0);
  objc_msgSend(v16, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v14, v15, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v8);
}

- (CGRect)extraLineFragmentRect
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  [v2 extraLineFragmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v11 = [v8 asRange];
  uint64_t v13 = v12;

  objc_msgSend(v14, "addTemporaryAttribute:value:forCharacterRange:", v10, v9, v11, v13);
}

- (id)annotationAttribute:(id)a3 atPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v9 = [v6 offset];

  id v10 = [v8 temporaryAttribute:v7 atCharacterIndex:v9 effectiveRange:0];

  return v10;
}

- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v8 = [v6 asRange];
  uint64_t v10 = v9;

  objc_msgSend(v11, "removeTemporaryAttribute:forCharacterRange:", v7, v8, v10);
}

- (void)addRenderingAttributes:(id)a3 forRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v8 = [v6 asRange];
  uint64_t v10 = v9;

  objc_msgSend(v11, "addTemporaryAttributes:forCharacterRange:", v7, v8, v10);
}

- (void)removeRenderingAttributes:(id)a3 forRange:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        uint64_t v13 = [(_UITextKit1LayoutController *)self layoutManager];
        uint64_t v14 = [v7 asRange];
        objc_msgSend(v13, "removeTemporaryAttribute:forCharacterRange:", v12, v14, v15);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)addGhostedRange:(id)a3
{
  canvasView = self->_canvasView;
  uint64_t v5 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  -[_UITextCanvasView addGhostedRange:](canvasView, "addGhostedRange:", v5, v4);
}

- (void)removeAllGhostedRanges
{
}

- (void)addInvisibleRange:(id)a3
{
  canvasView = self->_canvasView;
  uint64_t v5 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  -[_UITextCanvasView addInvisibleRange:](canvasView, "addInvisibleRange:", v5, v4);
}

- (void)removeInvisibleRange:(id)a3
{
  canvasView = self->_canvasView;
  uint64_t v5 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  -[_UITextCanvasView removeInvisibleRange:](canvasView, "removeInvisibleRange:", v5, v4);
}

- (BOOL)isEditable
{
  return 0;
}

- (void)setStyleEffectConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  [v5 setStyleEffectConfiguration:v4];
}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  double v3 = [v2 styleEffectConfiguration];

  return (CUIStyleEffectConfiguration *)v3;
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self textStorage];
  uint64_t v6 = [v4 asRange];
  uint64_t v8 = v7;

  uint64_t v9 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v8);

  return v9;
}

- (id)annotatedSubstringForRange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_UITextKit1LayoutController *)self textStorage];
  unint64_t v7 = [v6 length];
  unint64_t v8 = [v5 asRange];
  unint64_t v10 = v8;
  uint64_t v11 = 0;
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  if (!v9 || v7 <= v8) {
    goto LABEL_12;
  }
  if (v8 + v9 <= v7) {
    unint64_t v12 = v9;
  }
  else {
    unint64_t v12 = v7 - v8;
  }
  uint64_t v13 = [v6 string];
  uint64_t v11 = objc_msgSend(v13, "substringWithRange:", v10, v12);

  unint64_t v20 = v10;
  uint64_t v21 = 0;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11 attributes:0];
  uint64_t v15 = [(_UITextKit1LayoutController *)self layoutManager];
  if (!v15)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UITextKit1LayoutController.m", 615, @"Invalid parameter not satisfying: %@", @"layoutManager" object file lineNumber description];
  }
  if (v10 < v12 + v10)
  {
    unint64_t v16 = v10;
    do
    {
      long long v17 = objc_msgSend(v15, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v16, &v20, v10, v12);
      objc_msgSend(v14, "setAttributes:range:", v17, v20 - v10, v21);

      unint64_t v16 = v21 + v20;
    }
    while (v21 + v20 < v12 + v10);
  }

  if (!v14)
  {
LABEL_12:
    if (v7 >= v10) {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    }
    else {
      uint64_t v14 = 0;
    }
  }

  return v14;
}

- (double)baselineOffsetForFirstGlyph
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  if ([v2 numberOfGlyphs])
  {
    [v2 baselineOffsetForGlyphAtIndex:0];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5
{
  id v40 = a3;
  unint64_t v8 = (void (**)(id, void *, double, double, double, double, double))a5;
  unint64_t v9 = [(_UITextKit1LayoutController *)self layoutManager];
  if ([v9 numberOfGlyphs])
  {
    uint64_t v10 = [v40 offset];
    if (v10 <= 0) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v10 - 1;
    }
    uint64_t v12 = [v9 glyphIndexForCharacterAtIndex:v11];
    uint64_t v13 = [v9 textContainerForGlyphAtIndex:v12 effectiveRange:0];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
    }
    else
    {
      uint64_t v25 = [v9 textContainers];
      if ([v25 count] != 1)
      {
        v39 = [MEMORY[0x1E4F28B00] currentHandler];
        [v39 handleFailureInMethod:a2, self, @"_UITextKit1LayoutController.m", 646, @"Invalid parameter not satisfying: %@", @"textContainers.count == 1" object file lineNumber description];
      }
      uint64_t v14 = [v25 firstObject];
      uint64_t v26 = [v9 glyphRangeForTextContainer:v14];
      if (v26 + v27) {
        uint64_t v12 = v26 + v27 - 1;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v28 = +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", [v9 characterIndexForGlyphAtIndex:v12]);

      id v40 = (id)v28;
    }
    [v9 lineFragmentRectForGlyphAtIndex:v12 effectiveRange:0];
    double v17 = v29;
    double v19 = v30;
    double v21 = v31;
    double v23 = v32;
    [v9 baselineOffsetForGlyphAtIndex:v12];
    double v24 = v33;
  }
  else
  {
    uint64_t v15 = [v9 extraLineFragmentTextContainer];
    if (v15)
    {
      uint64_t v14 = (void *)v15;
      [v9 extraLineFragmentRect];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v24 = 0.0;
    }
    else
    {
      uint64_t v34 = MEMORY[0x1E4F1DB20];
      double v17 = *MEMORY[0x1E4F1DB20];
      double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v35 = [v9 textContainers];
      uint64_t v14 = [v35 firstObject];

      [v14 size];
      double v24 = 0.0;
      if (v36 <= 0.0)
      {
        double v21 = *(double *)(v34 + 16);
        double v23 = *(double *)(v34 + 24);
      }
      else
      {
        [v14 size];
        double v21 = v37;
        double v23 = v38;
      }
    }
  }
  v8[2](v8, v14, v17, v19, v21, v23, v24);
}

- (NSArray)textContainers
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__23;
  uint64_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___UITextKit1LayoutController_textContainers__block_invoke;
  v5[3] = &unk_1E52DFB18;
  v5[4] = &v6;
  [v2 coordinateAccess:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)textContainerForPosition:(id)a3
{
  uint64_t v3 = objc_msgSend(0, "glyphIndexForCharacterAtIndex:", objc_msgSend(a3, "offset"));
  return (id)[0 textContainerForGlyphAtIndex:v3 effectiveRange:0];
}

- (id)dequeueCanvasViewForTextContainer:(id)a3
{
  canvasView = self->_canvasView;
  if (!canvasView)
  {
    id v5 = (_UITextCanvasView *)objc_alloc_init(self->super._classicCanvasViewClass);
    uint64_t v6 = self->_canvasView;
    self->_canvasView = v5;

    canvasView = self->_canvasView;
  }
  return canvasView;
}

- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  uint64_t v8 = v7;
  unint64_t v9 = [UITextDragPreviewRenderer alloc];
  uint64_t v10 = [(_UITextKit1LayoutController *)self layoutManager];
  id v11 = -[UITextDragPreviewRenderer initWithLayoutManager:range:unifyRects:](v9, "initWithLayoutManager:range:unifyRects:", v10, v6, v8, v4);

  return v11;
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  [v5 ensureLayoutForTextContainer:v4];
}

- (CGRect)usedRectForTextContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  [v5 usedRectForTextContainer:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  double v10 = [(_UITextKit1LayoutController *)self layoutManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69___UITextKit1LayoutController_ensureLayoutForBounds_inTextContainer___block_invoke;
  v12[3] = &unk_1E52DFB40;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v13 = v9;
  id v11 = v9;
  [v10 coordinateAccess:v12];
}

- (CGRect)updateLayoutForSizeChangeOfTextContainer:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)ensureLayoutForRange:(id)a3
{
  id v4 = a3;
  id v8 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v5 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:v4];
  uint64_t v7 = v6;

  objc_msgSend(v8, "ensureLayoutForCharacterRange:", v5, v7);
}

- (void)invalidateLayoutForRange:(id)a3
{
  uint64_t v4 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  uint64_t v6 = v5;
  id v7 = [(_UITextKit1LayoutController *)self layoutManager];
  objc_msgSend(v7, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", v4, v6, 0, 0);
  objc_msgSend(v7, "invalidateLayoutForCharacterRange:actualCharacterRange:", v4, v6, 0);
}

- (CGRect)boundingRectForRange:(id)a3
{
  uint64_t v5 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3];
  -[_UITextKit1LayoutController boundingRectForCharacterRange:](self, "boundingRectForCharacterRange:", v5, v4);
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (id)_writingToolsMinimumContextualRangeForRange:(id)a3
{
  return 0;
}

- (BOOL)includesTextListMarkers
{
  return 1;
}

- (BOOL)canAccessLayoutManager
{
  return 1;
}

- (_NSRange)characterRangeForTextRange:(id)a3
{
  NSUInteger v3 = [(_UITextKit1LayoutController *)self characterRangeForTextRange:a3 clippedToDocument:0];
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)characterRangeForTextRange:(id)a3 clippedToDocument:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t location = [a3 asRange];
  NSUInteger v8 = location;
  NSUInteger v9 = length;
  if (v4)
  {
    v11.NSUInteger length = [(_UITextKit1LayoutController *)self _textStorageLength];
    v10.uint64_t location = v8;
    v10.NSUInteger length = v9;
    v11.uint64_t location = 0;
    NSRange v12 = NSIntersectionRange(v10, v11);
    NSUInteger length = v12.length;
    uint64_t location = v12.location;
  }
  result.NSUInteger length = length;
  result.uint64_t location = location;
  return result;
}

- (id)textRangeForCharacterRange:(_NSRange)a3
{
  return +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", a3.location, a3.length);
}

- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  return +[_UITextKitTextPosition positionWithOffset:a3 affinity:a4];
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3010000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  CGFloat v15 = &unk_186D7DBA7;
  double v6 = [(_UITextKit1LayoutController *)self layoutManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___UITextKit1LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke;
  v11[3] = &unk_1E52DFB68;
  void v11[4] = &v12;
  void v11[5] = a3;
  v11[6] = a4;
  [v6 coordinateAccess:v11];

  NSUInteger v7 = v13[4];
  NSUInteger v8 = v13[5];
  _Block_object_dispose(&v12, 8);
  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.uint64_t location = v9;
  return result;
}

- (CGRect)boundingRectForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v6 = [(_UITextKit1LayoutController *)self layoutManager];
  uint64_t v7 = objc_msgSend(v6, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  uint64_t v9 = v8;
  uint64_t v40 = 0;
  id v41 = (CGRect *)&v40;
  uint64_t v42 = 0x4010000000;
  id v43 = &unk_186D7DBA7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v44 = *MEMORY[0x1E4F1DB20];
  long long v45 = v10;
  NSRange v11 = [(_UITextKit1LayoutController *)self textStorage];
  int v12 = objc_msgSend(v11, "_ui_containsTables");

  if (v12)
  {
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    double v36 = __61___UITextKit1LayoutController_boundingRectForCharacterRange___block_invoke;
    double v37 = &unk_1E52DFB90;
    id v38 = v6;
    v39 = &v40;
    objc_msgSend(v38, "ui_enumerateTextBlocksInGlyphRange:usingBlock:", v7, v9, &v34);
  }
  id v13 = objc_msgSend(v6, "textContainerForGlyphAtIndex:effectiveRange:", v7, 0, v34, v35, v36, v37);
  if (CGRectIsNull(v41[1]))
  {
    objc_msgSend(v6, "boundingRectForGlyphRange:inTextContainer:", v7, v9, v13);
    CGFloat x = v14;
    CGFloat y = v16;
    CGFloat width = v18;
    CGFloat height = v20;
  }
  else
  {
    CGFloat x = v41[1].origin.x;
    CGFloat y = v41[1].origin.y;
    CGFloat width = v41[1].size.width;
    CGFloat height = v41[1].size.height;
  }
  [v13 textContainerOrigin];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGRect v47 = CGRectOffset(v46, v23, v25);
  CGFloat v26 = v47.origin.x;
  CGFloat v27 = v47.origin.y;
  CGFloat v28 = v47.size.width;
  CGFloat v29 = v47.size.height;

  _Block_object_dispose(&v40, 8);
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)unionRectForCharacterRange:(_NSRange)a3 bottomInset:(double)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v30 = 0;
  double v31 = (CGRect *)&v30;
  uint64_t v32 = 0x4010000000;
  double v33 = &unk_186D7DBA7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v34 = *MEMORY[0x1E4F1DB20];
  long long v35 = v8;
  uint64_t v9 = [(_UITextKit1LayoutController *)self layoutManager];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke;
  v29[3] = &unk_1E52DFB68;
  v29[5] = location;
  v29[6] = length;
  v29[4] = &v30;
  [v9 coordinateAccess:v29];
  [v9 extraLineFragmentRect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v18 = [(_UITextKit1LayoutController *)self textStorage];
  if (location + length == [v18 length])
  {
    v36.origin.CGFloat x = v11;
    v36.origin.CGFloat y = v13;
    v36.size.CGFloat width = v15;
    v36.size.CGFloat height = v17;
    IsEmptCGFloat y = CGRectIsEmpty(v36);

    p_CGFloat x = &v31->origin.x;
    if (!IsEmpty)
    {
      v39.size.CGFloat height = v17 + a4;
      v39.origin.CGFloat x = v11;
      v39.origin.CGFloat y = v13;
      v39.size.CGFloat width = v15;
      CGRect v37 = CGRectUnion(v31[1], v39);
      p_CGFloat x = &v31->origin.x;
      v31[1] = v37;
    }
  }
  else
  {

    p_CGFloat x = &v31->origin.x;
  }
  double v21 = p_x[4];
  double v22 = p_x[5];
  double v23 = p_x[6];
  double v24 = p_x[7];

  _Block_object_dispose(&v30, 8);
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)invalidateDisplayForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  objc_msgSend(v5, "invalidateDisplayForCharacterRange:", location, length);
}

- (void)setUsesTiledViews:(BOOL)a3
{
}

- (BOOL)usesTiledViews
{
  return [(_UITextCanvasView *)self->_canvasView isTilingEnabled];
}

- (void)setMaxTileHeight:(double)a3
{
}

- (double)maxTileHeight
{
  [(_UITextCanvasView *)self->_canvasView maxTileHeight];
  return result;
}

- (void)suspendTiling
{
}

- (void)resumeTiling
{
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITextKit1LayoutController *)self layoutManager];
  [v4 _setDrawsDebugBaselines:v3];
}

- (BOOL)drawsDebugBaselines
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  char v3 = [v2 _drawsDebugBaselines];

  return v3;
}

- (void)setLayoutManagerDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit1LayoutController *)self layoutManager];
  [v5 setDelegate:v4];
}

- (NSLayoutManagerDelegate)layoutManagerDelegate
{
  unint64_t v2 = [(_UITextKit1LayoutController *)self layoutManager];
  char v3 = [v2 delegate];

  return (NSLayoutManagerDelegate *)v3;
}

- (void)resetFontForExtraBulletRendering
{
  id v2 = [(_UITextKit1LayoutController *)self layoutManager];
  if (objc_opt_respondsToSelector()) {
    [v2 resetFontForExtraBulletRendering];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_originalLayoutManager, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end