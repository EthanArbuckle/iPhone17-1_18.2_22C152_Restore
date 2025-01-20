@interface _UITextKit2LayoutController
+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
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
- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContainer:(id)a4;
- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContentStorage:(id)a4 textContainer:(id)a5;
- (double)baselineOffsetForFirstGlyph;
- (double)maxTileHeight;
- (id)_locationWithOffset:(int64_t)a3;
- (id)_rangeForCharacterRange:(_NSRange)a3;
- (id)_updateSelectionWithTextRange:(id)a3 affinity:(int64_t)a4 typingAttributes:(id)a5;
- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)_writingToolsMinimumContextualRangeForRange:(id)a3;
- (id)annotatedSubstringForRange:(id)a3;
- (id)annotationAttribute:(id)a3 atPosition:(id)a4;
- (id)attributedTextInRange:(id)a3;
- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4;
- (id)dequeueCanvasViewForTextContainer:(id)a3;
- (id)emptyTextRangeAtPosition:(id)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 affinity:(int64_t)a6 anchorPositionOffset:(double)a7;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5;
- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4;
- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4;
- (id)searchableObject;
- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5;
- (id)textContainerForPosition:(id)a3;
- (id)textLayoutManager:(id)a3 renderingAttributesForLink:(id)a4 atLocation:(id)a5 defaultAttributes:(id)a6;
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
- (void)_invalidateTemporaryAttributesInRange:(id)a3;
- (void)_textContentStorageAddedUnsupportedAttribute:(id)a3;
- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5;
- (void)addGhostedRange:(id)a3;
- (void)addInvisibleRange:(id)a3;
- (void)addRenderingAttributes:(id)a3 forRange:(id)a4;
- (void)dealloc;
- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4;
- (void)ensureLayoutForRange:(id)a3;
- (void)ensureLayoutForTextContainer:(id)a3;
- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4;
- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5;
- (void)invalidateLayoutForRange:(id)a3;
- (void)removeAllGhostedRanges;
- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4;
- (void)removeInvisibleRange:(id)a3;
- (void)removeRenderingAttributes:(id)a3 forRange:(id)a4;
- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5;
- (void)resetTextViewportLayoutControllerLayoutForPosition:(id)a3;
- (void)setDocumentObscured:(BOOL)a3;
- (void)setDrawsDebugBaselines:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setUnobscuredRange:(id)a3;
@end

@implementation _UITextKit2LayoutController

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v6 = [(_UITextKit2LayoutController *)self beginningOfDocument];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    id v8 = v6;
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v9 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
  v10 = [v6 location];
  v11 = [v8 location];
  int64_t v12 = [v9 offsetFromLocation:v10 toLocation:v11];

  return v12;
}

- (_NSRange)characterRangeForTextRange:(id)a3
{
  NSUInteger v3 = [(_UITextKit2LayoutController *)self characterRangeForTextRange:a3 clippedToDocument:0];
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4 affinity:(int64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    if (!v8)
    {
      id v9 = [(_UITextKit2LayoutController *)self beginningOfDocument];
    }
    v10 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
    v11 = [v9 location];
    int64_t v12 = [v10 locationFromLocation:v11 withOffset:a4];

    if (v12)
    {
      v13 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v12 affinity:a5];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    id v9 = v8;
    v13 = v9;
  }

  return v13;
}

- (UITextPosition)beginningOfDocument
{
  NSUInteger v3 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  NSUInteger v4 = [v3 location];

  v5 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v4 affinity:0];

  return (UITextPosition *)v5;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v5 = a4;
  id v6 = [a3 location];
  id v7 = [v5 location];

  int64_t v8 = [v6 compare:v7];
  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = [(_UITextKit2LayoutController *)self beginningOfDocument];
    if (v9) {
      goto LABEL_3;
    }
  }
  id v9 = v7;
LABEL_3:
  v10 = [v7 location];
  uint64_t v11 = [v9 location];
  uint64_t v12 = [v10 compare:v11];
  if (v12 == 1) {
    v13 = (void *)v11;
  }
  else {
    v13 = v10;
  }
  if (v12 != 1) {
    v10 = (void *)v11;
  }
  v14 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v13 endLocation:v10];
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UITextKit2LayoutController.m", 231, @"couldn't create text range with %@ and %@.", v7, v9 object file lineNumber description];
  }
  textContentStorage = self->_textContentStorage;
  v20[0] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17 = +[_UITextKitTextRange rangeWithTextContentManager:textRanges:startAffinity:endAffinity:](_UITextKitTextRange, "rangeWithTextContentManager:textRanges:startAffinity:endAffinity:", textContentStorage, v16, [v7 affinity], objc_msgSend(v9, "affinity"));

  return v17;
}

- (_NSRange)characterRangeForTextRange:(id)a3 clippedToDocument:(BOOL)a4
{
  BOOL v4 = a4;
  textLayoutManager = self->_textLayoutManager;
  id v6 = a3;
  id v7 = [(NSTextLayoutManager *)textLayoutManager textContentManager];
  id v8 = [v7 documentRange];
  id v9 = [v6 unionTextRange];

  if (v4)
  {
    uint64_t v10 = [v9 textRangeByIntersectingWithTextRange:v8];

    id v9 = (void *)v10;
  }
  if (v9)
  {
    uint64_t v11 = [v8 location];
    id v12 = v9;
    id v13 = v7;
    v14 = [v12 location];
    uint64_t v15 = [v13 offsetFromLocation:v11 toLocation:v14];

    v16 = [v12 endLocation];

    uint64_t v17 = [v13 offsetFromLocation:v11 toLocation:v16];
    NSUInteger v18 = v17 - v15;
  }
  else
  {
    uint64_t v15 = 0;
    NSUInteger v18 = 0;
  }

  NSUInteger v19 = v15;
  NSUInteger v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (NSTextStorage)textStorage
{
  return [(NSTextContentStorage *)self->_textContentStorage textStorage];
}

- (UITextRange)documentRange
{
  v7[1] = *MEMORY[0x1E4F143B8];
  textContentStorage = self->_textContentStorage;
  NSUInteger v3 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v4 affinity:0];

  return (UITextRange *)v5;
}

- (id)searchableObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  NSUInteger v3 = [WeakRetained searchableObject];

  return v3;
}

- (double)baselineOffsetForFirstGlyph
{
  uint64_t v11 = 0;
  id v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  NSUInteger v3 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  if (([v3 isEmpty] & 1) == 0)
  {
    id v4 = objc_alloc((Class)off_1E52D2EF8);
    id v5 = [v3 location];
    id v6 = (void *)[v4 initWithLocation:v5];

    textLayoutManager = self->_textLayoutManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___UITextKit2LayoutController_baselineOffsetForFirstGlyph__block_invoke;
    v10[3] = &unk_1E52F02D8;
    v10[4] = &v11;
    [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v6 type:0 options:0 usingBlock:v10];
  }
  double v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled
{
  if (coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken != -1) {
    dispatch_once(&coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken, &__block_literal_global_247);
  }
  return coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
}

- (CGRect)updateLayoutForSizeChangeOfTextContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit2LayoutController *)self documentRange];
  [(_UITextKit2LayoutController *)self invalidateLayoutForRange:v5];
  [(_UITextKit2LayoutController *)self ensureLayoutForRange:v5];
  [(_UITextKit2LayoutController *)self usedRectForTextContainer:v4];
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

- (CGRect)usedRectForTextContainer:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  id v5 = a3;
  double v6 = [(NSTextLayoutManager *)textLayoutManager textContainers];
  id v7 = [v6 lastObject];

  if (v7 == v5)
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(NSTextLayoutManager *)self->_textLayoutManager ui_contentSizeForLastContainerView];
    double v10 = v12;
    double v11 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v14 = v8;
  double v15 = v9;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)invalidateLayoutForRange:(id)a3
{
  id v9 = [a3 unionTextRange];
  [(NSTextLayoutManager *)self->_textLayoutManager invalidateLayoutForRange:"invalidateLayoutForRange:"];
  if ([(NSTextLayoutManager *)self->_textLayoutManager usesContiguousLayout])
  {
    id v4 = [(NSTextContentStorage *)self->_textContentStorage documentRange];
    int v5 = [v4 isEqualToTextRange:v9];

    if (v5)
    {
      textLayoutManager = self->_textLayoutManager;
      id v7 = [v9 location];
      double v8 = [(NSTextLayoutManager *)textLayoutManager textContainerForLocation:v7];
      [(NSTextLayoutManager *)textLayoutManager textContainerChangedGeometry:v8];
    }
  }
}

- (void)ensureLayoutForRange:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  id v4 = [a3 unionTextRange];
  [(NSTextLayoutManager *)textLayoutManager ensureLayoutForRange:v4];
}

- (BOOL)canAccessLayoutManager
{
  return 0;
}

- (id)emptyTextRangeAtPosition:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(_UITextKit2LayoutController *)self beginningOfDocument];
  }
  id v5 = objc_alloc((Class)off_1E52D2EF8);
  double v6 = [v4 location];
  id v7 = (void *)[v5 initWithLocation:v6];

  textContentStorage = self->_textContentStorage;
  v12[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  double v10 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v9 affinity:0];

  return v10;
}

- (void)setUnobscuredRange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextKit2LayoutController;
  [(_UITextLayoutControllerBase *)&v10 setUnobscuredRange:a3];
  id v4 = self;
  if (objc_opt_isKindOfClass()) {
    textContentStorage = self->_textContentStorage;
  }
  else {
    textContentStorage = 0;
  }
  double v6 = textContentStorage;

  id v7 = [(_UITextLayoutControllerBase *)self unobscuredRange];
  uint64_t v8 = [(_UITextKit2LayoutController *)self characterRangeForTextRange:v7];
  -[NSTextContentStorage setUnobscuredRange:](v6, "setUnobscuredRange:", v8, v9);
}

- (NSArray)textContainers
{
  return (NSArray *)[(NSTextLayoutManager *)self->_textLayoutManager textContainers];
}

- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContentStorage:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UITextKit2LayoutController;
  double v11 = [(_UITextKit2LayoutController *)&v21 init];
  double v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_textView, v8);
    double v13 = (NSTextLayoutManager *)objc_alloc_init((Class)off_1E52D2EE0);
    textLayoutManager = v12->_textLayoutManager;
    v12->_textLayoutManager = v13;

    [(NSTextLayoutManager *)v12->_textLayoutManager setTextContainer:v10];
    [(NSTextLayoutManager *)v12->_textLayoutManager setDelegate:v12];
    if (objc_opt_respondsToSelector())
    {
      double v15 = v12->_textLayoutManager;
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_textView);
      -[NSTextLayoutManager setBreaksLinesForInteractiveText:](v15, "setBreaksLinesForInteractiveText:", [WeakRetained isEditable]);
    }
    objc_storeStrong((id *)&v12->_textContentStorage, a4);
    [(NSTextContentStorage *)v12->_textContentStorage addTextLayoutManager:v12->_textLayoutManager];
    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v12 selector:sel__textContentStorageAddedUnsupportedAttribute_ name:*(void *)off_1E52D22A8 object:v12->_textContentStorage];

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    textCanvasViews = v12->_textCanvasViews;
    v12->_textCanvasViews = (NSMapTable *)v18;
  }
  return v12;
}

- (void)dealloc
{
  NSUInteger v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*(void *)off_1E52D22A8 object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UITextKit2LayoutController;
  [(_UITextKit2LayoutController *)&v4 dealloc];
}

- (CGRect)insertionRectForPosition:(id)a3 typingAttributes:(id)a4 placeholderAttachment:(id)a5 textContainer:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v50 = 0;
  v51 = (CGRect *)&v50;
  uint64_t v52 = 0x4010000000;
  v53 = &unk_186D7DBA7;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v54 = *MEMORY[0x1E4F1DB20];
  long long v55 = v13;
  if (!v10)
  {
    id v10 = [(_UITextKit2LayoutController *)self beginningOfDocument];
  }
  id v14 = v10;
  id v15 = objc_alloc((Class)off_1E52D2EF8);
  double v16 = [v14 location];
  double v17 = (void *)[v15 initWithLocation:v16];

  if ([v14 affinity] == 1) {
    uint64_t v18 = 17;
  }
  else {
    uint64_t v18 = 1;
  }
  NSUInteger v19 = -[_UITextKit2LayoutController _updateSelectionWithTextRange:affinity:typingAttributes:](self, "_updateSelectionWithTextRange:affinity:typingAttributes:", v17, [v14 affinity], v11);

  [(NSTextLayoutManager *)self->_textLayoutManager ui_ensureLayoutForViewportBoundsAtRange:v19];
  textLayoutManager = self->_textLayoutManager;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke;
  v49[3] = &unk_1E52F02D8;
  v49[4] = &v50;
  [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v19 type:1 options:v18 usingBlock:v49];
  if (CGRectIsNull(v51[1]))
  {
    v40 = a6;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__99;
    v47 = __Block_byref_object_dispose__99;
    id v48 = 0;
    objc_super v21 = self->_textLayoutManager;
    v22 = [v19 location];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_74;
    v42[3] = &unk_1E52F0300;
    v42[4] = &v43;
    id v23 = [(NSTextLayoutManager *)v21 enumerateTextLayoutFragmentsFromLocation:v22 options:1 usingBlock:v42];

    uint64_t v24 = v44[5];
    if (v24)
    {
      v25 = self->_textLayoutManager;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_2;
      v41[3] = &unk_1E52F02D8;
      v41[4] = &v50;
      [(NSTextLayoutManager *)v25 enumerateTextSegmentsInRange:v24 type:1 options:v18 usingBlock:v41];
    }
    _Block_object_dispose(&v43, 8);

    a6 = v40;
  }
  if (!CGRectIsNull(v51[1]))
  {
    v26 = self->_textLayoutManager;
    v27 = [v14 location];
    v28 = [(NSTextLayoutManager *)v26 textContainerForLocation:v27];

    uint64_t v29 = [v28 layoutOrientation];
    v30 = v51;
    if (v29)
    {
      v51[1].origin.double y = v51[1].origin.y + -1.0;
      p_double height = (void *)&v30[1].size.height;
    }
    else
    {
      v51[1].origin.double x = v51[1].origin.x + -1.0;
      p_double height = (void *)&v30[1].size.width;
    }
    void *p_height = 0x4000000000000000;
    if (a6) {
      *a6 = v28;
    }
  }
  double x = v51[1].origin.x;
  double y = v51[1].origin.y;
  double width = v51[1].size.width;
  double height = v51[1].size.height;

  _Block_object_dispose(&v50, 8);
  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (id)_updateSelectionWithTextRange:(id)a3 affinity:(int64_t)a4 typingAttributes:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)off_1E52D2F00) initWithRange:v9 affinity:a4 == 0 granularity:0];

  [v10 setTypingAttributes:v8];
  v15[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(NSTextLayoutManager *)self->_textLayoutManager setTextSelections:v11];

  id v12 = [v10 textRanges];
  long long v13 = [v12 firstObject];

  return v13;
}

- (id)dequeueCanvasViewForTextContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_textCanvasViews objectForKey:v4];
  if (!v5)
  {
    id v5 = [[_UITextLayoutCanvasView alloc] initWithTextLayoutManager:self->_textLayoutManager textContainer:v4];
    [(NSMapTable *)self->_textCanvasViews setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)textRangeForTextKit2Ranges:(id)a3
{
  return +[_UITextKitTextRange rangeWithTextContentManager:self->_textContentStorage textRanges:a3 affinity:0];
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    BOOL v3 = a3;
    self->_editable = a3;
    if (objc_opt_respondsToSelector())
    {
      textLayoutManager = self->_textLayoutManager;
      [(NSTextLayoutManager *)textLayoutManager setBreaksLinesForInteractiveText:v3];
    }
  }
}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  return 0;
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  id v5 = a3;
  double v6 = [(NSTextLayoutManager *)textLayoutManager textContainers];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(NSTextLayoutManager *)self->_textLayoutManager rangeForTextContainerAtIndex:v7];
    if (v8)
    {
      id v9 = v8;
      [(NSTextLayoutManager *)self->_textLayoutManager ensureLayoutForRange:v8];
      id v8 = v9;
    }
  }
}

- (void)ensureLayoutForBounds:(CGRect)a3 inTextContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  textLayoutManager = self->_textLayoutManager;
  id v10 = a4;
  id v11 = [(NSTextLayoutManager *)textLayoutManager textContainers];
  id v12 = [v11 lastObject];

  if (v12 == v10)
  {
    long long v13 = self->_textLayoutManager;
    -[NSTextLayoutManager ensureLayoutForBounds:](v13, "ensureLayoutForBounds:", x, y, width, height);
  }
}

- (CGRect)unionRectForCharacterRange:(_NSRange)a3 bottomInset:(double)a4
{
  uint64_t v25 = 0;
  v26 = (double *)&v25;
  uint64_t v27 = 0x4010000000;
  v28 = &unk_186D7DBA7;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v29 = *MEMORY[0x1E4F1DB20];
  long long v30 = v6;
  uint64_t v7 = -[_UITextKit2LayoutController _rangeForCharacterRange:](self, "_rangeForCharacterRange:", a3.location, a3.length);
  [(NSTextLayoutManager *)self->_textLayoutManager ui_ensureLayoutForViewportBoundsAtRange:v7];
  textLayoutManager = self->_textLayoutManager;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke;
  v24[3] = &unk_1E52F02D8;
  v24[4] = &v25;
  [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v7 type:1 options:3 usingBlock:v24];
  id v9 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  id v10 = [v9 endLocation];

  id v11 = [v7 endLocation];
  int v12 = [v11 isEqual:v10];

  if (v12)
  {
    long long v13 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v10];
    id v14 = self->_textLayoutManager;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2;
    v23[3] = &unk_1E52F0580;
    v23[4] = &v25;
    *(double *)&v23[5] = a4;
    [(NSTextLayoutManager *)v14 enumerateTextSegmentsInRange:v13 type:1 options:3 usingBlock:v23];
  }
  double v15 = v26[4];
  double v16 = v26[5];
  double v17 = v26[6];
  double v18 = v26[7];

  _Block_object_dispose(&v25, 8);
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)_rangeForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
  long long v6 = [v5 documentRange];
  uint64_t v7 = [v6 location];
  id v8 = [v5 locationFromLocation:v7 withOffset:location];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 endLocation];
  }
  id v11 = v10;

  int v12 = [v5 locationFromLocation:v11 withOffset:length];
  long long v13 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v11 endLocation:v12];

  return v13;
}

- (id)textRangeForBounds:(CGRect)a3 inTextContainer:(id)a4 layoutIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v11 = [(NSMapTable *)self->_textCanvasViews objectForKey:a4];
  int v12 = objc_msgSend(v11, "textRangeForBounds:layoutIfNeeded:", v5, x, y, width, height);
  textContentStorage = self->_textContentStorage;
  v17[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v15 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v14 affinity:0];

  return v15;
}

- (id)viewportRangeForTextContainer:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSTextLayoutManager *)self->_textLayoutManager viewportRangeForTextContainer:a3];
  BOOL v5 = (void *)v4;
  if (v4)
  {
    textContentStorage = self->_textContentStorage;
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v8 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v7 affinity:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)usesTiledViews
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3 fromView:(id)a4 forContainerPassingTest:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = -1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  id v12 = v8;
  long long v13 = [v12 textKit2Ranges];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke;
  v37[3] = &unk_1E52F03C8;
  v42 = v48;
  v37[4] = self;
  id v14 = v11;
  id v38 = v14;
  id v15 = v9;
  id v41 = v15;
  id v16 = v12;
  id v39 = v16;
  uint64_t v43 = &v53;
  id v17 = v10;
  id v40 = v17;
  v44 = &v49;
  uint64_t v45 = v47;
  long long v46 = xmmword_186B852C0;
  [v13 enumerateObjectsUsingBlock:v37];

  if ([v17 count])
  {
    double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    long long v30 = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_3;
    v31 = &unk_1E52F03F0;
    id v32 = v14;
    id v33 = v27;
    v35 = v48;
    double v36 = v47;
    id v19 = v18;
    id v34 = v19;
    [v17 enumerateObjectsUsingBlock:&v28];
    if ([v19 count])
    {
      uint64_t v20 = v54[3];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = 0;
        v54[3] = 0;
      }
      if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v21 = objc_msgSend(v19, "count", v20);
        v50[3] = v21 - 1;
        uint64_t v20 = v54[3];
      }
      double v22 = objc_msgSend(v19, "objectAtIndexedSubscript:", v20, v27, v28, v29, v30, v31, v32, v33);
      [v22 setContainsStart:1];

      id v23 = [v19 objectAtIndexedSubscript:v50[3]];
      [v23 setContainsEnd:1];
    }
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    uint64_t v24 = v19;
  }
  id v25 = v24;

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v25;
}

- (void)requestTextGeometryAtPosition:(id)a3 typingAttributes:(id)a4 resultBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, id, double, double, double, double, double))a5;
  uint64_t v38 = 0;
  id v39 = (double *)&v38;
  uint64_t v40 = 0x4010000000;
  id v41 = &unk_186D7DBA7;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v42 = *MEMORY[0x1E4F1DB20];
  long long v43 = v12;
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  id v13 = objc_alloc((Class)off_1E52D2EF8);
  id v14 = [v9 location];
  id v15 = (void *)[v13 initWithLocation:v14];

  textLayoutManager = self->_textLayoutManager;
  id v17 = [v15 endLocation];
  double v18 = [(NSTextLayoutManager *)textLayoutManager textContainerForLocation:v17];

  if (!v18)
  {
    id v27 = a2;
    id v19 = [(NSTextLayoutManager *)self->_textLayoutManager textContainers];
    if ([v19 count] != 1)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"_UITextKit2LayoutController.m", 882, @"Invalid parameter not satisfying: %@", @"textContainers.count == 1" object file lineNumber description];
    }
    double v18 = [v19 firstObject];
    uint64_t v20 = [(NSTextLayoutManager *)self->_textLayoutManager rangeForTextContainerAtIndex:0];

    uint64_t v21 = [v20 endLocation];
    id v15 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v21];

    uint64_t v22 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v21 affinity:0];

    id v9 = (id)v22;
    a2 = v27;
  }
  id v23 = [(_UITextKit2LayoutController *)self _updateSelectionWithTextRange:v15 affinity:0 typingAttributes:v10];
  uint64_t v24 = self->_textLayoutManager;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90___UITextKit2LayoutController_requestTextGeometryAtPosition_typingAttributes_resultBlock___block_invoke;
  v28[3] = &unk_1E52F0508;
  id v25 = v18;
  id v29 = v25;
  long long v30 = self;
  v31 = &v38;
  id v32 = &v34;
  SEL v33 = a2;
  [(NSTextLayoutManager *)v24 enumerateTextSegmentsInRange:v15 type:0 options:0 usingBlock:v28];
  v11[2](v11, v25, v9, v39[4], v39[5], v39[6], v39[7], v35[3]);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCanvasViews, 0);
  objc_storeStrong((id *)&self->_invisibleRanges, 0);
  objc_storeStrong((id *)&self->_ghostedRanges, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textContentStorage, 0);
  objc_destroyWeak((id *)&self->_textView);
}

- (UITextPosition)endOfDocument
{
  BOOL v3 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  uint64_t v4 = [v3 endLocation];

  BOOL v5 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v4 affinity:0];

  return (UITextPosition *)v5;
}

- (_UITextKit2LayoutController)initWithTextView:(id)a3 textContainer:(id)a4
{
  id v7 = a3;
  id v8 = [a4 textLayoutManager];
  v27.receiver = self;
  v27.super_class = (Class)_UITextKit2LayoutController;
  id v9 = [(_UITextKit2LayoutController *)&v27 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_textView, v7);
    objc_storeStrong((id *)&v10->_textLayoutManager, v8);
    id v11 = [(NSTextLayoutManager *)v10->_textLayoutManager delegate];

    if (!v11) {
      [(NSTextLayoutManager *)v10->_textLayoutManager setDelegate:v10];
    }
    long long v12 = [v8 textContentManager];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        textContentStorage = v10->_textContentStorage;
        v10->_textContentStorage = v12;

        id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v14 addObserver:v10 selector:sel__textContentStorageAddedUnsupportedAttribute_ name:*(void *)off_1E52D22A8 object:v10->_textContentStorage];

        uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        textCanvasViews = v10->_textCanvasViews;
        v10->_textCanvasViews = (NSMapTable *)v15;

        goto LABEL_7;
      }
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v21);
      uint64_t v22 = NSString;
      id v23 = v12;
      uint64_t v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];

      [v18 handleFailureInMethod:a2, v10, @"_UITextKit2LayoutController.m", 114, @"%@ should be an instance inheriting from %@, but it is %@", @"textLayoutManager.textContentManager", v20, v26 object file lineNumber description];
    }
    else
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      id v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      [v18 handleFailureInMethod:a2, v10, @"_UITextKit2LayoutController.m", 114, @"%@ should be an instance inheriting from %@, but it is nil", @"textLayoutManager.textContentManager", v20 object file lineNumber description];
    }

    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (id)_locationWithOffset:(int64_t)a3
{
  uint64_t v4 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
  BOOL v5 = [v4 documentRange];
  long long v6 = [v5 location];

  id v7 = [v4 locationFromLocation:v6 withOffset:a3];

  return v7;
}

- (BOOL)includesTextListMarkers
{
  return [(NSTextContentStorage *)self->_textContentStorage includesTextListMarkers];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 affinity:(int64_t)a6 anchorPositionOffset:(double)a7
{
  id v12 = a3;
  id v13 = [v12 location];
  id v14 = objc_msgSend(objc_alloc((Class)off_1E52D2F00), "initWithLocation:affinity:", v13, objc_msgSend(v12, "affinity") == 0);
  [v14 setAnchorPositionOffset:a7];
  if ((unint64_t)(a4 - 2) >= 4) {
    int64_t v15 = 3;
  }
  else {
    int64_t v15 = a4;
  }
  id v16 = [(NSTextLayoutManager *)self->_textLayoutManager textSelectionNavigation];
  if (a5 < 1)
  {
    id v17 = v14;
  }
  else
  {
    do
    {
      id v17 = [v16 destinationSelectionForTextSelection:v14 direction:v15 destination:0 extending:0 confined:0];

      id v14 = v17;
      --a5;
    }
    while (a5);
  }
  double v18 = [v17 textRanges];
  if ([v18 count] == 1)
  {
    id v19 = [v17 textRanges];
    uint64_t v20 = [v19 firstObject];
    int v21 = [v20 isEmpty];
  }
  else
  {
    int v21 = 0;
  }

  uint64_t v22 = [v17 affinity];
  id v23 = [v17 textRanges];
  uint64_t v24 = v23;
  if (v22)
  {
    id v25 = [v23 lastObject];
    [v25 endLocation];
  }
  else
  {
    id v25 = [v23 firstObject];
    [v25 location];
  v26 = };

  if (v21) {
    a6 = [v17 affinity] == 0;
  }
  if (v26)
  {
    objc_super v27 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v26 affinity:a6];
  }
  else
  {
    objc_super v27 = 0;
  }

  return v27;
}

- (id)textRangeForLineEnclosingPosition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITextKit2LayoutController *)self textRangeForLineEnclosingPosition:v4 effectiveAffinity:[(_UITextKit2LayoutController *)self affinityForPosition:v4]];

  return v5;
}

- (id)textRangeForLineEnclosingPosition:(id)a3 effectiveAffinity:(int64_t)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v6 = [(_UITextKit2LayoutController *)self beginningOfDocument];
  }
  uint64_t v36 = v6;
  uint64_t v7 = [v6 location];
  id v8 = [(NSTextLayoutManager *)self->_textLayoutManager textSelectionNavigation];
  BOOL v9 = a4 == 0;
  uint64_t v10 = [objc_alloc((Class)off_1E52D2F00) initWithLocation:v7 affinity:v9];
  id v11 = [v8 destinationSelectionForTextSelection:v10 direction:1 destination:2 extending:0 confined:1];
  uint64_t v34 = (void *)v10;
  v35 = v8;
  id v12 = [v8 destinationSelectionForTextSelection:v10 direction:0 destination:2 extending:0 confined:1];
  id v13 = [v11 textRanges];
  id v14 = [v13 firstObject];
  int64_t v15 = [v14 location];

  id v16 = [v12 textRanges];
  id v17 = [v16 lastObject];
  double v18 = [v17 endLocation];

  SEL v33 = v11;
  uint64_t v19 = [v11 affinity];
  uint64_t v20 = [v12 affinity];
  if (v15) {
    BOOL v21 = v18 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    uint64_t v22 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v7];
    uint64_t v23 = v9;
  }
  else
  {
    uint64_t v24 = v20;
    uint64_t v25 = [v15 compare:v18];
    v26 = self;
    if (v25 == 1) {
      objc_super v27 = v18;
    }
    else {
      objc_super v27 = v15;
    }
    if (v25 == 1)
    {
      double v18 = v15;
      BOOL v9 = v24;
    }
    else
    {
      BOOL v9 = v19;
    }
    if (v25 == 1) {
      uint64_t v23 = v19;
    }
    else {
      uint64_t v23 = v24;
    }
    uint64_t v22 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v27 endLocation:v18];
    int64_t v15 = v27;
    self = v26;
  }
  uint64_t v28 = (void *)v7;
  textContentStorage = self->_textContentStorage;
  v37[0] = v22;
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v31 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v30 startAffinity:!v9 endAffinity:v23 == 0];

  return v31;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  v33[1] = *MEMORY[0x1E4F143B8];
  textLayoutManager = self->_textLayoutManager;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(NSTextLayoutManager *)textLayoutManager textSelectionNavigation];
  int64_t v15 = [v12 location];

  id v16 = (void *)[objc_alloc((Class)off_1E52D2F00) initWithLocation:v15 affinity:a6 == 0];
  id v17 = [v13 location];

  double v18 = [(NSTextLayoutManager *)self->_textLayoutManager textContainerForLocation:v17];
  double v19 = *MEMORY[0x1E4F1DAD8];
  double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v18 size];
  double v22 = v21;
  double v24 = v23;
  v33[0] = v16;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v26 = objc_msgSend(v14, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", v17, v25, 2, 1, x, y, v19, v20, v22, v24);

  objc_super v27 = [MEMORY[0x1E4F1CA48] array];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __96___UITextKit2LayoutController__visualSelectionRangeForExtent_forPoint_fromPosition_inDirection___block_invoke;
  v31[3] = &unk_1E52F02B0;
  id v28 = v27;
  id v32 = v28;
  [v26 enumerateObjectsUsingBlock:v31];
  if ([v28 count])
  {
    id v29 = +[_UITextKitTextRange rangeWithTextContentManager:self->_textContentStorage textRanges:v28 affinity:a6];
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (int64_t)affinityForPosition:(id)a3
{
  return [a3 affinity];
}

- (id)attributesAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v7 = a3;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__99;
  uint64_t v25 = __Block_byref_object_dispose__99;
  id v26 = 0;
  id v8 = [v7 location];
  BOOL v9 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __64___UITextKit2LayoutController_attributesAtPosition_inDirection___block_invoke;
  v15[3] = &unk_1E52F0328;
  SEL v19 = a2;
  v15[4] = self;
  id v10 = v9;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  double v18 = &v21;
  int64_t v20 = a4;
  id v12 = (id)[v10 enumerateTextElementsFromLocation:v11 options:0 usingBlock:v15];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (int64_t)baseWritingDirectionAtPosition:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  id v4 = [a3 location];
  int64_t v5 = [(NSTextLayoutManager *)textLayoutManager baseWritingDirectionAtLocation:v4];

  return v5;
}

- (void)enumerateTextLineFragmentsInRange:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = self->_textLayoutManager;
  id v8 = [a3 unionTextRange];
  BOOL v9 = [v8 location];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76___UITextKit2LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke;
  v14[3] = &unk_1E52F0350;
  id v15 = v8;
  id v16 = v7;
  id v17 = self;
  id v18 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = [(NSTextLayoutManager *)v11 enumerateTextLayoutFragmentsFromLocation:v9 options:4 usingBlock:v14];
}

- (void)enumerateTextSegmentsInRange:(id)a3 inTextContainer:(id)a4 usingBlock:(id)a5
{
  id v7 = a5;
  textLayoutManager = self->_textLayoutManager;
  BOOL v9 = [a3 unionTextRange];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87___UITextKit2LayoutController_enumerateTextSegmentsInRange_inTextContainer_usingBlock___block_invoke;
  v11[3] = &unk_1E52F0378;
  id v12 = v7;
  id v10 = v7;
  [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v9 type:0 options:1 usingBlock:v11];
}

- (id)cursorPositionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(NSTextLayoutManager *)self->_textLayoutManager textContainers];
  uint64_t v9 = [v8 indexOfObject:v7];

  id v10 = [(NSTextLayoutManager *)self->_textLayoutManager rangeForTextContainerAtIndex:v9];
  id v11 = [v10 location];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  if (WeakRetained)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v13, "_convertPointFromRenderSpace:", x, y);
    double x = v14;
    double y = v15;
  }
  id v16 = [(NSTextLayoutManager *)self->_textLayoutManager textSelectionNavigation];
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v7 size];
  uint64_t v21 = objc_msgSend(v16, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", v11, MEMORY[0x1E4F1CBF0], 0, 1, x, y, v17, v18, v19, v20);
  double v22 = [v21 firstObject];
  uint64_t v23 = [v22 textRanges];
  double v24 = [v23 firstObject];

  uint64_t v25 = [v22 affinity];
  if (v24)
  {
    BOOL v26 = v25 == 0;
    textContentStorage = self->_textContentStorage;
    id v28 = [v24 location];
    id v29 = +[_UITextKitTextPosition positionWithTextContentManager:textContentStorage location:v28 affinity:v26];
  }
  else
  {
    id v29 = [(_UITextKit2LayoutController *)self endOfDocument];
  }

  return v29;
}

- (CGRect)extraLineFragmentRect
{
  id v3 = objc_alloc((Class)off_1E52D2EF8);
  id v4 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  int64_t v5 = [v4 endLocation];
  id v6 = (void *)[v3 initWithLocation:v5];

  uint64_t v18 = 0;
  double v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  uint64_t v21 = &unk_186D7DBA7;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v22 = *MEMORY[0x1E4F1DB28];
  long long v23 = v7;
  textLayoutManager = self->_textLayoutManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __52___UITextKit2LayoutController_extraLineFragmentRect__block_invoke;
  v17[3] = &unk_1E52F02D8;
  v17[4] = &v18;
  [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v6 type:0 options:13 usingBlock:v17];
  double v9 = v19[4];
  double v10 = v19[5];
  double v11 = v19[6];
  double v12 = v19[7];
  _Block_object_dispose(&v18, 8);

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_invalidateTemporaryAttributesInRange:(id)a3
{
  textCanvasViews = self->_textCanvasViews;
  id v4 = a3;
  NSAllMapTableValues(textCanvasViews);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 makeObjectsPerformSelector:sel_invalidateTemporaryAttributesInRange_ withObject:v4];
}

- (void)addAnnotationAttribute:(id)a3 value:(id)a4 forRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 textKit2Ranges];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69___UITextKit2LayoutController_addAnnotationAttribute_value_forRange___block_invoke;
  v14[3] = &unk_1E52F0418;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 enumerateObjectsUsingBlock:v14];

  [(_UITextKit2LayoutController *)self _invalidateTemporaryAttributesInRange:v10];
}

- (id)annotationAttribute:(id)a3 atPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__99;
  uint64_t v20 = __Block_byref_object_dispose__99;
  id v21 = 0;
  textLayoutManager = self->_textLayoutManager;
  id v9 = [v7 location];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62___UITextKit2LayoutController_annotationAttribute_atPosition___block_invoke;
  v13[3] = &unk_1E52F0440;
  id v15 = &v16;
  id v10 = v6;
  id v14 = v10;
  [(NSTextLayoutManager *)textLayoutManager enumerateTemporaryAttributesFromLocation:v9 reverse:0 usingBlock:v13];

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)removeAnnotationAttribute:(id)a3 forRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 textKit2Ranges];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __66___UITextKit2LayoutController_removeAnnotationAttribute_forRange___block_invoke;
  id v13 = &unk_1E52F0468;
  id v14 = self;
  id v15 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:&v10];

  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v7, v10, v11, v12, v13, v14);
}

- (void)addRenderingAttributes:(id)a3 forRange:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke;
  uint64_t v11 = &unk_1E52DA238;
  id v12 = v6;
  id v13 = self;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:&v8];
  -[_UITextKit2LayoutController _invalidateTemporaryAttributesInRange:](self, "_invalidateTemporaryAttributesInRange:", v7, v8, v9, v10, v11);
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
  id obj = v6;
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
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = [v7 textKit2Ranges];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        void v15[2] = __66___UITextKit2LayoutController_removeRenderingAttributes_forRange___block_invoke;
        v15[3] = &unk_1E52F0468;
        v15[4] = self;
        void v15[5] = v12;
        [v13 enumerateObjectsUsingBlock:v15];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  [(_UITextKit2LayoutController *)self _invalidateTemporaryAttributesInRange:v7];
}

- (void)addGhostedRange:(id)a3
{
  id v4 = a3;
  ghostedRanges = self->_ghostedRanges;
  id v8 = v4;
  if (!ghostedRanges)
  {
    id v6 = (NSMutableSet *)objc_opt_new();
    id v7 = self->_ghostedRanges;
    self->_ghostedRanges = v6;

    id v4 = v8;
    ghostedRanges = self->_ghostedRanges;
  }
  [(NSMutableSet *)ghostedRanges addObject:v4];
}

- (void)removeAllGhostedRanges
{
}

- (void)addInvisibleRange:(id)a3
{
  id v4 = a3;
  invisibleRanges = self->_invisibleRanges;
  id v8 = v4;
  if (!invisibleRanges)
  {
    id v6 = (NSMutableSet *)objc_opt_new();
    id v7 = self->_invisibleRanges;
    self->_invisibleRanges = v6;

    id v4 = v8;
    invisibleRanges = self->_invisibleRanges;
  }
  [(NSMutableSet *)invisibleRanges addObject:v4];
}

- (void)removeInvisibleRange:(id)a3
{
}

- (void)setDocumentObscured:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self;
  if (objc_opt_isKindOfClass()) {
    textContentStorage = self->_textContentStorage;
  }
  else {
    textContentStorage = 0;
  }
  id v7 = textContentStorage;

  [(NSTextContentStorage *)v7 setObscured:v3];
}

- (id)attributedTextInRange:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = v5;
  id v8 = [v7 unionTextRange];
  uint64_t v9 = [v8 location];

  uint64_t v10 = [v7 unionTextRange];

  uint64_t v11 = [v10 endLocation];

  uint64_t v12 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53___UITextKit2LayoutController_attributedTextInRange___block_invoke;
  v21[3] = &unk_1E52F0490;
  SEL v26 = a2;
  v21[4] = self;
  id v22 = v9;
  id v23 = v12;
  id v24 = v11;
  id v13 = v6;
  id v25 = v13;
  id v14 = v11;
  id v15 = v12;
  id v16 = v9;
  id v17 = (id)[v15 enumerateTextElementsFromLocation:v16 options:0 usingBlock:v21];
  long long v18 = v25;
  id v19 = v13;

  return v19;
}

- (id)annotatedSubstringForRange:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextKit2LayoutController *)self attributedTextInRange:v4];
  id v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "removeAttribute:range:", *(void *)off_1E52D2238, 0, objc_msgSend(v6, "length"));
  id v7 = [v4 unionTextRange];

  id v8 = [v7 location];
  textLayoutManager = self->_textLayoutManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58___UITextKit2LayoutController_annotatedSubstringForRange___block_invoke;
  v16[3] = &unk_1E52F04B8;
  id v17 = v7;
  id v18 = v8;
  id v10 = v6;
  id v19 = v10;
  id v11 = v8;
  id v12 = v7;
  [(NSTextLayoutManager *)textLayoutManager enumerateTemporaryAttributesFromLocation:v11 reverse:0 usingBlock:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)_writingToolsMinimumContextualRangeForRange:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  objc_super v27 = __Block_byref_object_copy__99;
  id v28 = __Block_byref_object_dispose__99;
  id v29 = 0;
  if (([v6 isEmpty] & 1) == 0)
  {
    id v7 = [v5 unionTextRange];
    id v8 = [v7 location];

    uint64_t v9 = [v5 unionTextRange];
    id v10 = [v9 endLocation];

    textContentStorage = self->_textContentStorage;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75___UITextKit2LayoutController__writingToolsMinimumContextualRangeForRange___block_invoke;
    v19[3] = &unk_1E52F04E0;
    v19[4] = self;
    id v22 = &v24;
    SEL v23 = a2;
    id v12 = v8;
    id v20 = v12;
    id v13 = v10;
    id v21 = v13;
    id v14 = [(NSTextContentStorage *)textContentStorage enumerateTextElementsFromLocation:v12 options:0 usingBlock:v19];
  }
  id v15 = v5;
  if (v25[5])
  {
    v30[0] = v25[5];
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v15 = [(_UITextKit2LayoutController *)self textRangeForTextKit2Ranges:v16];
  }
  id v17 = v15;
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (id)textContainerForPosition:(id)a3
{
  textLayoutManager = self->_textLayoutManager;
  id v4 = [a3 location];
  id v5 = [(NSTextLayoutManager *)textLayoutManager textContainerForLocation:v4];

  return v5;
}

- (id)previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [_UITextLayoutPreviewRenderer alloc];
  textLayoutManager = self->_textLayoutManager;
  uint64_t v9 = [v6 unionTextRange];

  id v10 = [(_UITextLayoutPreviewRenderer *)v7 initWithTextLayoutManager:textLayoutManager range:v9 unifyRects:v4];
  return v10;
}

- (CGRect)boundingRectForRange:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  objc_super v27 = (CGRect *)&v26;
  uint64_t v28 = 0x4010000000;
  id v29 = &unk_186D7DBA7;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v30 = *MEMORY[0x1E4F1DB20];
  long long v31 = v5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  SEL v23 = __Block_byref_object_copy__99;
  uint64_t v24 = __Block_byref_object_dispose__99;
  id v25 = 0;
  textLayoutManager = self->_textLayoutManager;
  id v7 = [v4 unionTextRange];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52___UITextKit2LayoutController_boundingRectForRange___block_invoke;
  v19[3] = &unk_1E52F0530;
  v19[4] = &v20;
  void v19[5] = &v26;
  [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v7 type:0 options:1 usingBlock:v19];

  id v8 = (void *)v21[5];
  if (v8)
  {
    [v8 textContainerOrigin];
    CGRect v32 = CGRectOffset(v27[1], v9, v10);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    v27[1] = v32;
  }
  else
  {
    CGFloat x = v27[1].origin.x;
    CGFloat y = v27[1].origin.y;
    CGFloat width = v27[1].size.width;
    CGFloat height = v27[1].size.height;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (NSLayoutManager)layoutManager
{
  return 0;
}

- (void)_textContentStorageAddedUnsupportedAttribute:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  int v5 = [WeakRetained isWritingToolsActive];

  if (v5)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_textContentStorageAddedUnsupportedAttribute____s_category)+ 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = v6;
        id v8 = objc_loadWeakRetained((id *)p_textView);
        *(_DWORD *)buf = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Ignoring unsupported attributes in Writing Tools replacement for %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)p_textView);
    [v9 _reconfigureWithLayoutManager:0 triggeredByLayoutManagerAccess:0 triggeringSelector:0];
  }
}

- (id)textRangeForCharacterRange:(_NSRange)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = -[_UITextKit2LayoutController _rangeForCharacterRange:](self, "_rangeForCharacterRange:", a3.location, a3.length);
  textContentStorage = self->_textContentStorage;
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = +[_UITextKitTextRange rangeWithTextContentManager:textContentStorage textRanges:v6 affinity:0];

  return v7;
}

- (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  id v6 = [(_UITextKit2LayoutController *)self _locationWithOffset:a3];
  id v7 = +[_UITextKitTextPosition positionWithTextContentManager:self->_textContentStorage location:v6 affinity:a4];

  return v7;
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3010000000;
  uint64_t v20 = &unk_186D7DBA7;
  unint64_t v21 = a3;
  uint64_t v22 = 0;
  id v8 = -[_UITextKit2LayoutController _locationWithOffset:](self, "_locationWithOffset:");
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4 == 3)
    {
      uint64_t v9 = 2053;
    }
    else if (a4 == 4)
    {
      uint64_t v9 = 2054;
    }
    else
    {
      CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITextKit2LayoutController.m", 1065, @"Unexpected clusterType = %lu", a4);

      uint64_t v9 = 2048;
    }
  }
  else
  {
    uint64_t v9 = 2050;
  }
  textLayoutManager = self->_textLayoutManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67___UITextKit2LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke;
  v16[3] = &unk_1E52F0558;
  void v16[4] = self;
  v16[5] = &v17;
  v16[6] = a3;
  [(NSTextLayoutManager *)textLayoutManager enumerateSubstringsFromLocation:v8 options:v9 usingBlock:v16];
  NSUInteger v12 = v18[4];
  NSUInteger v13 = v18[5];

  _Block_object_dispose(&v17, 8);
  NSUInteger v14 = v12;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (CGRect)boundingRectForCharacterRange:(_NSRange)a3
{
  id v4 = -[_UITextKit2LayoutController textRangeForCharacterRange:](self, "textRangeForCharacterRange:", a3.location, a3.length);
  [(_UITextKit2LayoutController *)self boundingRectForRange:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (double)maxTileHeight
{
  return 0.0;
}

- (NSLayoutManagerDelegate)layoutManagerDelegate
{
  return 0;
}

- (id)textLayoutManager:(id)a3 renderingAttributesForLink:(id)a4 atLocation:(id)a5 defaultAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v10 textContainerForLocation:v12];
  double v15 = [v14 textView];

  if (objc_opt_respondsToSelector())
  {
    double v16 = [(NSTextLayoutManager *)self->_textLayoutManager textContentManager];
    uint64_t v17 = [v16 documentRange];
    double v18 = [v17 location];
    uint64_t v19 = objc_msgSend(v15, "linkAttributesForLink:forCharacterAtIndex:", v11, objc_msgSend(v10, "offsetFromLocation:toLocation:", v18, v12));
  }
  else
  {
    uint64_t v19 = [v15 linkTextAttributes];
  }
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v13;
  }
  id v21 = v20;

  return v21;
}

- (void)resetTextViewportLayoutControllerLayoutForPosition:(id)a3
{
  id v8 = a3;
  if (v8 && ([v8 location], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v5 = (void *)v4;
    double v6 = [(NSTextLayoutManager *)self->_textLayoutManager textContainerForLocation:v4];
  }
  else
  {
    double v6 = [(NSTextLayoutManager *)self->_textLayoutManager textContainer];
  }
  double v7 = [v6 textViewportLayoutController];
  [v7 _resetLayout];
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)drawsDebugBaselines
{
  return self->_drawsDebugBaselines;
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  self->_drawsDebugBaselines = a3;
}

@end