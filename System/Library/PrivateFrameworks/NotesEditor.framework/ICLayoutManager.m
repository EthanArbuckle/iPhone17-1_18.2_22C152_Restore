@interface ICLayoutManager
- (BOOL)isDraggingChecklistItem;
- (BOOL)isRenderingImageForPrint;
- (BOOL)isRenderingPreviewForDragAndDrop;
- (BOOL)isSettingLinkTextAttributes;
- (BOOL)isUpdatingForAttachmentViewTypeChange;
- (BOOL)isZooming;
- (BOOL)lineHeightIncludeParagraphSpacing;
- (BOOL)needsClearRemovedAttachments;
- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3;
- (BOOL)shouldAdjustTodoButtonFramesForPrinting;
- (BOOL)shouldIgnoreCachedOriginUpdates;
- (BOOL)shouldManuallyRenderSeparateSubviews;
- (BOOL)unhideSupplementalView:(id)a3 forIdentifier:(id)a4;
- (CGPoint)cachedOrigin;
- (CGRect)boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4;
- (CGRect)layoutEnsuredBounds;
- (CGRect)lineFragmentRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (CGRect)lineRectForRange:(_NSRange)a3;
- (CGRect)usedLineRectForRange:(_NSRange)a3;
- (CGSize)cachedTextContainerSize;
- (ICAttachmentViewDelegate)attachmentViewDelegate;
- (ICLayoutManager)init;
- (ICNAEventReporter)eventReporter;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICSelectorDelayer)updateHiddenViewsSelectorDelayer;
- (ICTextAttachmentLocationCache)inlineAttachmentLocationCache;
- (NSDictionary)trackedToDoParagraphs;
- (NSManagedObjectContext)workerContext;
- (NSMutableDictionary)activeSupplementalViews;
- (NSMutableDictionary)delayedScrollOutViewDictionary;
- (NSMutableDictionary)hiddenSupplementalViews;
- (NSMutableDictionary)supplementalViewControllers;
- (NSMutableDictionary)supplementalViewProviders;
- (NSMutableDictionary)todoButtonsByTrackingUUID;
- (NSSet)hiddenTodosForManualLayout;
- (UITraitCollection)overrideTraitCollection;
- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4;
- (_NSRange)rangeForBaseAttachment:(id)a3 withTextAttachment:(id *)a4;
- (id)drawTodoViewForListRange:(_NSRange)a3 paragraphStyle:(id)a4 checkmarkHighlightValue:(id)a5 atPoint:(CGPoint)a6;
- (id)glyphIndexesForMatchesInTextStorage:(id)a3 regexFinder:(id)a4 glyphRange:(_NSRange)a5;
- (id)icaxTodoButtonForParagraphStyle:(id)a3;
- (id)initForTemporaryProcessing:(BOOL)a3;
- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)paragraphStyleForCharacterIndex:(unint64_t)a3;
- (id)supplementalViewForIdentifier:(id)a3 allowHiddenViews:(BOOL)a4;
- (id)textContainerForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)todoButtonForTrackedParagraphIfExists:(id)a3;
- (id)todoButtonsForCharacterRange:(_NSRange)a3;
- (id)trackedTodoParagraphAtIndexIfExists:(unint64_t)a3;
- (id)viewControllerForTextAttachment:(id)a3;
- (id)viewControllerForTextAttachment:(id)a3 createIfNeeded:(BOOL)a4;
- (id)viewControllerForTextAttachmentNoCreate:(id)a3;
- (id)viewForBaseTextAttachmentNoCreate:(id)a3;
- (id)viewForTextAttachment:(id)a3;
- (id)viewForTextAttachment:(id)a3 initialCharacterIndex:(unint64_t)a4;
- (id)viewForTextAttachmentNoCreate:(id)a3;
- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5;
- (unint64_t)lineCountForCharacterRange:(_NSRange)a3;
- (void)_clearRemovedAttachments;
- (void)attachmentDidLoad:(id)a3;
- (void)attachmentInlineDrawingMergeableDataDidChange:(id)a3;
- (void)cleanUpAfterScreenshot;
- (void)cleanupStaleTodoButtons;
- (void)cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:(id)a3;
- (void)clearAllSupplementalViews;
- (void)clearAllTodoSupplementalViews;
- (void)clearAllTodos;
- (void)clearLayoutEnsuredBounds;
- (void)clearRemovedAttachmentsIfNeeded;
- (void)clearSupplementalViewForIdentifier:(id)a3;
- (void)clearViewForTextAttachment:(id)a3;
- (void)clearViewsForAllTextAttachmentsThatSupportThumbnailMode;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)didAddViewForTextAttachment:(id)a3;
- (void)didPressTodoButton:(id)a3;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4 updateAttachments:(BOOL)a5;
- (void)ensureLayoutForSurroundingPages;
- (void)ensureLayoutForTextContainer:(id)a3;
- (void)ensureViewIsAddedForAttachment:(id)a3 inCharacterRange:(_NSRange)a4;
- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)eventReporterLostSession:(id)a3;
- (void)fillBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6;
- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5;
- (void)handleTodoButtonPress:(id)a3;
- (void)hideSupplementalView:(id)a3 forIdentifier:(id)a4;
- (void)hideVisibleTodoButtons;
- (void)icReplaceTextStorage:(id)a3;
- (void)invalidateLayoutAfterAttachmentViewTypeChange;
- (void)invalidateLayoutAfterAttachmentViewTypeChangeIfNecessary;
- (void)invalidateLayoutForAttachment:(id)a3;
- (void)invalidateLayoutForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4;
- (void)layoutViewForInlineTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4;
- (void)manuallyRenderSubviewsForCharacterRange:(_NSRange)a3;
- (void)mediaDidLoad:(id)a3;
- (void)prepareForScreenshotWithVisibleRange:(_NSRange)a3;
- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7;
- (void)receivedMemoryWarning:(id)a3;
- (void)removeClearingControllerForView:(id)a3;
- (void)removeClearingControllerForView:(id)a3 viewIdentifier:(id)a4;
- (void)setActiveSupplementalViews:(id)a3;
- (void)setAttachmentViewDelegate:(id)a3;
- (void)setCachedOrigin:(CGPoint)a3;
- (void)setCachedTextContainerSize:(CGSize)a3;
- (void)setDelayedScrollOutViewDictionary:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setHiddenSupplementalViews:(id)a3;
- (void)setHiddenTodosForManualLayout:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setInlineAttachmentLocationCache:(id)a3;
- (void)setIsDraggingChecklistItem:(BOOL)a3;
- (void)setIsRenderingImageForPrint:(BOOL)a3;
- (void)setIsRenderingPreviewForDragAndDrop:(BOOL)a3;
- (void)setIsSettingLinkTextAttributes:(BOOL)a3;
- (void)setIsUpdatingForAttachmentViewTypeChange:(BOOL)a3;
- (void)setIsZooming:(BOOL)a3;
- (void)setLayoutEnsuredBounds:(CGRect)a3;
- (void)setLineHeightIncludeParagraphSpacing:(BOOL)a3;
- (void)setNeedsClearRemovedAttachments:(BOOL)a3;
- (void)setOverrideTraitCollection:(id)a3;
- (void)setShouldAdjustTodoButtonFramesForPrinting:(BOOL)a3;
- (void)setShouldIgnoreCachedOriginUpdates:(BOOL)a3;
- (void)setShouldManuallyRenderSeparateSubviews:(BOOL)a3;
- (void)setSupplementalViewControllers:(id)a3;
- (void)setSupplementalViewProviders:(id)a3;
- (void)setTodoButtonsByTrackingUUID:(id)a3;
- (void)setTrackedToDoParagraphs:(id)a3;
- (void)setUpdateHiddenViewsSelectorDelayer:(id)a3;
- (void)setWorkerContext:(id)a3;
- (void)textContainerChangedGeometry:(id)a3;
- (void)textController:(id)a3 removedTrackedAttribute:(id)a4;
- (void)textStorageDidEndEditingNotification:(id)a3;
- (void)unHideVisibleTodoButtons;
- (void)updateHiddenSupplementalViews;
- (void)updateInlineDrawingViews;
- (void)updateSubviewsForCharacterRange:(_NSRange)a3;
- (void)updateSubviewsForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)updateVisibleSupplementalViews;
- (void)willPlaceView:(id)a3 forTextAttachment:(id)a4;
- (void)zoomFactorOrInsetsDidChange;
@end

@implementation ICLayoutManager

- (ICLayoutManager)init
{
  return (ICLayoutManager *)[(ICLayoutManager *)self initForTemporaryProcessing:0];
}

- (id)initForTemporaryProcessing:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ICLayoutManager;
  v4 = [(ICLayoutManager *)&v21 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(ICLayoutManager *)v4 setTodoButtonsByTrackingUUID:v5];

    if (!a3)
    {
      v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:v4 selector:sel_attachmentDidLoad_ name:*MEMORY[0x263F5A948] object:0];

      v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:v4 selector:sel_mediaDidLoad_ name:*MEMORY[0x263F5AA00] object:0];

      v8 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v9 = *MEMORY[0x263F5B1E0];
      v10 = [(ICLayoutManager *)v4 textStorage];
      [v8 addObserver:v4 selector:sel_textStorageDidEndEditingNotification_ name:v9 object:v10];

      v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:v4 selector:sel_attachmentInlineDrawingMergeableDataDidChange_ name:*MEMORY[0x263F5AFF8] object:0];

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v4 selector:sel_receivedMemoryWarning_ name:*MEMORY[0x263F83340] object:0];
    }
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICLayoutManager *)v4 setActiveSupplementalViews:v13];

    v14 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICLayoutManager *)v4 setHiddenSupplementalViews:v14];

    v15 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICLayoutManager *)v4 setSupplementalViewControllers:v15];

    v16 = [[ICTextAttachmentLocationCache alloc] initWithLayoutManager:v4 cachedTextAttachmentType:objc_opt_class()];
    [(ICLayoutManager *)v4 setInlineAttachmentLocationCache:v16];

    v17 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICLayoutManager *)v4 setSupplementalViewProviders:v17];

    v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(ICLayoutManager *)v4 setDelayedScrollOutViewDictionary:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:v4 selector:sel_updateHiddenSupplementalViews delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.1];
    [(ICLayoutManager *)v4 setUpdateHiddenViewsSelectorDelayer:v19];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(ICLayoutManager *)self updateHiddenViewsSelectorDelayer];
  [v3 cancelPreviousFireRequests];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(ICLayoutManager *)self clearAllSupplementalViews];
  v5.receiver = self;
  v5.super_class = (Class)ICLayoutManager;
  [(ICLayoutManager *)&v5 dealloc];
}

- (NSDictionary)trackedToDoParagraphs
{
  v3 = [(ICBaseLayoutManager *)self textController];
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 trackedToDoParagraphs];
  }
  else
  {
    objc_super v5 = self->_trackedToDoParagraphs;
  }
  v6 = v5;

  return v6;
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(ICLayoutManager *)self setLineHeightIncludeParagraphSpacing:1];
  -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:updateAttachments:](self, "drawGlyphsForGlyphRange:atPoint:updateAttachments:", location, length, 1, x, y);

  [(ICLayoutManager *)self setLineHeightIncludeParagraphSpacing:0];
}

- (id)textContainerForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v7 = -[ICLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:");
  v8 = [(ICLayoutManager *)self textStorage];
  unint64_t v9 = [v8 length];

  if (v7 <= v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICLayoutManager;
    v11 = [(ICLayoutManager *)&v13 textContainerForGlyphAtIndex:a3 effectiveRange:a4];
  }
  else
  {
    if (a4) {
      a4->NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    }
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICLayoutManager textContainerForGlyphAtIndex:effectiveRange:](v10);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5 = a3;
  char v6 = [(ICSearchResultRegexMatchFinder *)self->_highlightPatternRegexFinder isEqual:v5];
  if ((v6 & 1) == 0) {
    objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  }
  unint64_t v7 = [(ICLayoutManager *)self supplementalViewControllers];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  objc_super v21 = __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke;
  v22 = &unk_2640B8EF0;
  id v8 = v5;
  id v23 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v19];

  unint64_t v9 = [(ICLayoutManager *)self activeSupplementalViews];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke_2;
  v17 = &unk_2640B8F18;
  id v18 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:&v14];

  if ((v6 & 1) == 0)
  {
    v11 = [(ICLayoutManager *)self textStorage];
    uint64_t v12 = objc_msgSend(v11, "ic_range");
    -[ICLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v12, v13);
  }
}

void __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setHighlightPatternRegexFinder:v3];
}

void __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setHighlightPatternRegexFinder:*(void *)(a1 + 32)];
}

- (void)setCachedOrigin:(CGPoint)a3
{
  if (!self->_shouldIgnoreCachedOriginUpdates) {
    self->_cachedOrigin = a3;
  }
}

- (id)glyphIndexesForMatchesInTextStorage:(id)a3 regexFinder:(id)a4 glyphRange:(_NSRange)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  id v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  unint64_t v9 = [v7 string];
  id v10 = [v8 matchesInDocumentWithPerTokenFallback:v9];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__ICLayoutManager_glyphIndexesForMatchesInTextStorage_regexFinder_glyphRange___block_invoke;
  v13[3] = &unk_2640B8F40;
  v13[4] = self;
  v13[5] = &v14;
  [v10 enumerateObjectsUsingBlock:v13];
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v11;
}

void __78__ICLayoutManager_glyphIndexesForMatchesInTextStorage_regexFinder_glyphRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    char v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v11;
  }
  uint64_t v7 = [v3 range];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", v7, v8, 0);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addIndexesInRange:", v9, v10);
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4 updateAttachments:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  uint64_t v13 = v12;
  [(ICLayoutManager *)self cachedOrigin];
  double v15 = v14;
  double v17 = v16;
  if (v5) {
    -[ICLayoutManager updateSubviewsForCharacterRange:atPoint:](self, "updateSubviewsForCharacterRange:atPoint:", v11, v13, x, y);
  }
  -[ICBaseLayoutManager drawListStylesForCharacterRange:atPoint:](self, "drawListStylesForCharacterRange:atPoint:", v11, v13, x, y);
  v18.receiver = self;
  v18.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v18, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  if ([(ICLayoutManager *)self shouldManuallyRenderSeparateSubviews])
  {
    -[ICLayoutManager manuallyRenderSubviewsForCharacterRange:](self, "manuallyRenderSubviewsForCharacterRange:", v11, v13);
    -[ICLayoutManager updateSubviewsForCharacterRange:atPoint:](self, "updateSubviewsForCharacterRange:atPoint:", v11, v13, v15, v17);
  }
}

- (void)icReplaceTextStorage:(id)a3
{
  id v5 = a3;
  id v4 = [(ICLayoutManager *)self textStorage];
  [v4 removeLayoutManager:self];

  [v5 addLayoutManager:self];
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a3;
  [(ICLayoutManager *)self setNeedsClearRemovedAttachments:1];
  uint64_t v13 = [(ICLayoutManager *)self textStorage];
  uint64_t v14 = *MEMORY[0x263F814A0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__ICLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
  v20[3] = &unk_2640B8F68;
  v20[4] = self;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, location, length, 0, v20);

  double v15 = [(ICLayoutManager *)self icTextView];
  uint64_t v16 = [v15 isInProcessEditingForTextStorage];

  double v17 = [(ICLayoutManager *)self icTextView];
  [v17 setIsInProcessEditingForTextStorage:1];

  v19.receiver = self;
  v19.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v19, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, v12, a4, location, length, a6, a7.location, a7.length);

  objc_super v18 = [(ICLayoutManager *)self icTextView];
  [v18 setIsInProcessEditingForTextStorage:v16];
}

void __93__ICLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) layoutViewForInlineTextAttachment:v5 atCharacterIndex:a3];
  }
}

- (void)textContainerChangedGeometry:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [(ICLayoutManager *)self cachedTextContainerSize];
  if (v6 != v10 || v8 != v9)
  {
    [v4 size];
    -[ICLayoutManager setCachedTextContainerSize:](self, "setCachedTextContainerSize:");
    v12.receiver = self;
    v12.super_class = (Class)ICLayoutManager;
    [(ICLayoutManager *)&v12 textContainerChangedGeometry:v4];
  }
}

- (CGRect)lineFragmentRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v103.receiver = self;
  v103.super_class = (Class)ICLayoutManager;
  [(ICLayoutManager *)&v103 lineFragmentRectForGlyphAtIndex:a3 effectiveRange:a4];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  if (![(ICLayoutManager *)self lineHeightIncludeParagraphSpacing])
  {
    unint64_t v14 = [(ICLayoutManager *)self characterIndexForGlyphAtIndex:a3];
    double v15 = [(ICLayoutManager *)self textStorage];
    unint64_t v16 = [v15 length];

    if (v14 >= v16) {
      int64_t v17 = v16;
    }
    else {
      int64_t v17 = v14;
    }
    objc_super v18 = [(ICLayoutManager *)self textStorage];
    uint64_t v19 = [v18 length] - 1;

    if (v17 >= v19)
    {
      uint64_t v20 = [(ICBaseLayoutManager *)self textView];
      v22 = [v20 typingAttributes];
      objc_super v21 = [v22 objectForKeyedSubscript:*MEMORY[0x263F81540]];
    }
    else
    {
      uint64_t v20 = [(ICLayoutManager *)self textStorage];
      objc_super v21 = [v20 attribute:*MEMORY[0x263F81540] atIndex:v17 effectiveRange:0];
    }

    if (v21)
    {
      CGFloat v97 = v11;
      CGFloat v98 = v7;
      id v23 = [(ICBaseLayoutManager *)self textView];
      uint64_t v24 = [v23 selectedRange];
      uint64_t v26 = v25;

      uint64_t v27 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v24, v26, 0);
      if (v26)
      {
        uint64_t v29 = v27;
        uint64_t v30 = v28;
        v102.receiver = self;
        v102.super_class = (Class)ICLayoutManager;
        [(ICLayoutManager *)&v102 lineFragmentRectForGlyphAtIndex:v27 effectiveRange:0];
        double rect = v31;
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        v101.receiver = self;
        v101.super_class = (Class)ICLayoutManager;
        [(ICLayoutManager *)&v101 lineFragmentRectForGlyphAtIndex:v30 + v29 - 1 effectiveRange:0];
        CGFloat rect_24a = v39;
        CGFloat v95 = v38;
        CGFloat rect_8 = v41;
        CGFloat rect_16 = v40;
        v104.origin.double x = v98;
        v104.origin.double y = v9;
        v104.size.width = v97;
        v104.size.height = v13;
        double MinY = CGRectGetMinY(v104);
        v105.origin.double x = rect;
        v105.origin.double y = v33;
        v105.size.width = v35;
        v105.size.height = v37;
        BOOL v43 = MinY != CGRectGetMinY(v105);
        v106.origin.double x = v98;
        v106.origin.double y = v9;
        v106.size.width = v97;
        v106.size.height = v13;
        double v44 = CGRectGetMinY(v106);
        v107.origin.double y = rect_24a;
        v107.origin.double x = v95;
        v107.size.height = rect_8;
        v107.size.width = rect_16;
        BOOL v45 = v44 != CGRectGetMinY(v107);
      }
      else
      {
        BOOL v43 = 0;
        BOOL v45 = 0;
      }
      v46 = [(ICLayoutManager *)self textStorage];
      v47 = [v46 string];
      uint64_t v48 = objc_msgSend(v47, "paragraphRangeForRange:", v17, 0);
      uint64_t v50 = v49;

      uint64_t v51 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v48, v50, 0);
      uint64_t v53 = v52;
      v100.receiver = self;
      v100.super_class = (Class)ICLayoutManager;
      [(ICLayoutManager *)&v100 lineFragmentRectForGlyphAtIndex:v51 effectiveRange:0];
      CGFloat rect_24 = v54;
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      v99.receiver = self;
      v99.super_class = (Class)ICLayoutManager;
      [(ICLayoutManager *)&v99 lineFragmentRectForGlyphAtIndex:v53 + v51 - 1 effectiveRange:0];
      CGFloat v64 = v61;
      CGFloat v65 = v62;
      CGFloat v96 = v66;
      CGFloat v67 = v63;
      if (v48)
      {
        CGFloat rect_8a = v60;
        double rect_16a = v63;
        double v68 = v62;
        double v69 = v61;
        CGFloat v70 = v56;
        CGFloat v7 = v98;
        v108.origin.double x = v98;
        v108.origin.double y = v9;
        CGFloat v71 = v58;
        CGFloat v11 = v97;
        v108.size.width = v97;
        v108.size.height = v13;
        double rect = CGRectGetMinY(v108);
        v109.origin.double y = v70;
        CGFloat v64 = v69;
        CGFloat v65 = v68;
        CGFloat v67 = rect_16a;
        v109.origin.double x = rect_24;
        v109.size.width = v71;
        v109.size.height = rect_8a;
        char v72 = rect != CGRectGetMinY(v109) || v43;
      }
      else
      {
        char v72 = 1;
        CGFloat v11 = v97;
        CGFloat v7 = v98;
      }
      v110.origin.double x = v7;
      v110.origin.double y = v9;
      v110.size.width = v11;
      v110.size.height = v13;
      double v73 = CGRectGetMinY(v110);
      v111.origin.double x = v64;
      v111.origin.double y = v65;
      v111.size.width = v96;
      v111.size.height = v67;
      double v74 = CGRectGetMinY(v111);
      if ((v72 & 1) == 0)
      {
        [v21 paragraphSpacingBefore];
        double v9 = v9 + v75;
        [v21 paragraphSpacingBefore];
        double v13 = v13 - v76;
      }
      char v77 = v73 != v74 || v45;
      if ((v77 & 1) == 0)
      {
        v78 = [(ICLayoutManager *)self textStorage];
        v79 = [v78 string];
        uint64_t v80 = objc_msgSend(v79, "paragraphRangeForRange:", v48 + v50, 0);
        uint64_t v82 = v81;

        if (v48 != v80 || v50 != v82)
        {
          objc_msgSend(v21, "paragraphSpacing", *(void *)&rect);
          double v13 = v13 - v83;
        }
      }
    }
  }
  double v84 = v7;
  double v85 = v9;
  double v86 = v11;
  double v87 = v13;
  result.size.height = v87;
  result.size.width = v86;
  result.origin.double y = v85;
  result.origin.double x = v84;
  return result;
}

- (CGRect)lineRectForRange:(_NSRange)a3
{
  uint64_t v16 = 0;
  int64_t v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  uint64_t v19 = &unk_20C1E2BF2;
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v20 = *MEMORY[0x263F001A0];
  long long v21 = v4;
  uint64_t v5 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", a3.location, a3.length, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __36__ICLayoutManager_lineRectForRange___block_invoke;
  v15[3] = &unk_2640B8F90;
  v15[4] = &v16;
  -[ICLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", v5, v6, v15);
  double v7 = v17[4];
  double v8 = v17[5];
  double v9 = v17[6];
  double v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

void __36__ICLayoutManager_lineRectForRange___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v5.size.height = a5;
  v5.size.width = a4;
  v5.origin.double y = a3;
  v5.origin.double x = a2;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v5);
}

- (CGRect)usedLineRectForRange:(_NSRange)a3
{
  uint64_t v16 = 0;
  int64_t v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  uint64_t v19 = &unk_20C1E2BF2;
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v20 = *MEMORY[0x263F001A0];
  long long v21 = v4;
  uint64_t v5 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", a3.location, a3.length, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__ICLayoutManager_usedLineRectForRange___block_invoke;
  v15[3] = &unk_2640B8F90;
  v15[4] = &v16;
  -[ICLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", v5, v6, v15);
  double v7 = v17[4];
  double v8 = v17[5];
  double v9 = v17[6];
  double v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

void __40__ICLayoutManager_usedLineRectForRange___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), *(CGRect *)&a6);
}

- (void)textController:(id)a3 removedTrackedAttribute:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "paragraph", a3);
  id v10 = [v5 todoTrackingUUID];

  uint64_t v6 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  double v7 = [v6 objectForKeyedSubscript:v10];

  [v7 removeFromSuperview];
  double v8 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  [v8 removeObjectForKey:v10];

  double v9 = [v10 UUIDString];
  [(ICLayoutManager *)self clearSupplementalViewForIdentifier:v9];
}

- (void)contentSizeCategoryDidChange
{
  id v3 = [(ICLayoutManager *)self textStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  uint64_t v5 = [(ICLayoutManager *)self textStorage];
  uint64_t v6 = [v5 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__ICLayoutManager_contentSizeCategoryDidChange__block_invoke;
  v7[3] = &unk_2640B89D0;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);
}

uint64_t __47__ICLayoutManager_contentSizeCategoryDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    uint64_t v4 = [*(id *)(a1 + 32) viewForTextAttachment:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 contentSizeCategoryDidChange];
    }
    uint64_t v5 = [*(id *)(a1 + 32) viewControllerForTextAttachmentNoCreate:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 contentSizeCategoryDidChange];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)zoomFactorOrInsetsDidChange
{
  id v3 = [(ICLayoutManager *)self textStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  uint64_t v5 = [(ICLayoutManager *)self textStorage];
  uint64_t v6 = [v5 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ICLayoutManager_zoomFactorOrInsetsDidChange__block_invoke;
  v7[3] = &unk_2640B89D0;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);
}

uint64_t __46__ICLayoutManager_zoomFactorOrInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v4 = [*(id *)(a1 + 32) viewControllerForTextAttachmentNoCreate:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 zoomFactorOrInsetsDidChange];
    }
  }

  return MEMORY[0x270F9A790](isKindOfClass);
}

- (id)drawTodoViewForListRange:(_NSRange)a3 paragraphStyle:(id)a4 checkmarkHighlightValue:(id)a5 atPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v12 = a4;
  id v13 = a5;
  double v14 = [(ICLayoutManager *)self trackedToDoParagraphs];
  double v15 = [v12 todoTrackingUUID];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  if (!v16)
  {
    if (![(ICLayoutManager *)self shouldManuallyRenderSeparateSubviews])
    {
      id v20 = 0;
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  int64_t v17 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  uint64_t v18 = [v16 paragraph];
  uint64_t v19 = [v18 todoTrackingUUID];
  id v20 = [v17 objectForKeyedSubscript:v19];

  if (!v20)
  {
LABEL_5:
    id v21 = objc_alloc(MEMORY[0x263F5B510]);
    v22 = [(ICLayoutManager *)self icTextView];
    id v23 = [v22 textDragInteraction];
    uint64_t v24 = [v23 delegate];
    id v20 = (id)[v21 initWithDragDelegate:v24];

    uint64_t v25 = [(ICLayoutManager *)self overrideTraitCollection];

    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x263F825C8];
      uint64_t v27 = [(ICLayoutManager *)self overrideTraitCollection];
      uint64_t v28 = objc_msgSend(v26, "ic_tintColorWithTraitCollection:", v27);
      [v20 setOverrideTintColor:v28];
    }
    [v20 setTrackedParagraph:v16];
    uint64_t v29 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
    uint64_t v30 = [v12 todoTrackingUUID];
    [v29 setObject:v20 forKeyedSubscript:v30];

    double v31 = [(ICLayoutManager *)self activeSupplementalViews];
    double v32 = [v12 todoTrackingUUID];
    CGFloat v33 = [v32 UUIDString];
    [v31 setObject:v20 forKeyedSubscript:v33];

    [v20 addTarget:self action:sel_didPressTodoButton_ forControlEvents:64];
  }
  double v34 = [v20 superview];

  if (!v34)
  {
    CGFloat v35 = [(ICLayoutManager *)self icTextView];
    double v36 = [v35 containerViewForAttachments];
    [v36 addSubview:v20];
  }
  CGFloat v37 = [v12 todo];
  objc_msgSend(v20, "setDone:animated:", objc_msgSend(v37, "done"), 0);

  [v13 foregroundAlpha];
  if (v38 == 0.0) {
    double v38 = 1.0;
  }
  objc_msgSend(v20, "ic_setAlpha:", v38);
  double v39 = [v13 highlightColor];
  [v20 setHighlightColor:v39];

  -[ICLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0), 0);
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = x + v44;
  CGFloat v47 = y + v46;
  uint64_t v48 = [(ICBaseLayoutManager *)self textContainer];
  [v48 lineFragmentPadding];
  CGFloat v50 = v49;
  v79.origin.double x = v45;
  v79.origin.double y = v47;
  v79.size.CGFloat width = v41;
  v79.size.CGFloat height = v43;
  CGRect v80 = CGRectInset(v79, v50, 0.0);
  CGFloat v51 = v80.origin.x;
  CGFloat v52 = v80.origin.y;
  CGFloat width = v80.size.width;
  CGFloat height = v80.size.height;

  v81.origin.double x = v51;
  v81.origin.double y = v52;
  v81.size.CGFloat width = width;
  v81.size.CGFloat height = height;
  if (!CGRectIsNull(v81))
  {
    [v20 frame];
    double v56 = v55;
    uint64_t v58 = v57;
    uint64_t v59 = [v12 layoutWritingDirection];
    CGFloat v60 = v51;
    CGFloat v61 = v52;
    CGFloat v62 = width;
    CGFloat v63 = height;
    if (v59)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v60);
      double v65 = 4.0;
    }
    else
    {
      double MaxX = CGRectGetMinX(*(CGRect *)&v60) - v56;
      double v65 = -4.0;
    }
    double v66 = MaxX + v65;
    v82.origin.double x = v51;
    v82.origin.double y = v52;
    v82.size.CGFloat width = width;
    v82.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v82);
    [v20 frame];
    double v68 = round(MidY + CGRectGetHeight(v83) * -0.5);
    double v69 = (void *)MEMORY[0x263F82E00];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __91__ICLayoutManager_drawTodoViewForListRange_paragraphStyle_checkmarkHighlightValue_atPoint___block_invoke;
    v71[3] = &unk_2640B8B58;
    id v20 = v20;
    id v72 = v20;
    double v74 = v66;
    double v75 = v68;
    double v76 = v56;
    uint64_t v77 = v58;
    id v73 = v12;
    objc_msgSend(v69, "ic_performWithoutAnimation:", v71);
  }
LABEL_18:

  return v20;
}

uint64_t __91__ICLayoutManager_drawTodoViewForListRange_paragraphStyle_checkmarkHighlightValue_atPoint___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) layoutWritingDirection] == 0;
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "setFrame:leftToRight:", v3, v4, v5, v6, v7);
}

- (void)didPressTodoButton:(id)a3
{
  id v6 = a3;
  double v4 = [(ICLayoutManager *)self icTextView];
  char v5 = [v4 isDraggingChecklistItem];

  if ((v5 & 1) == 0) {
    [(ICLayoutManager *)self handleTodoButtonPress:v6];
  }
}

- (void)handleTodoButtonPress:(id)a3
{
  id v4 = a3;
  char v5 = [(ICLayoutManager *)self icTextView];
  id v6 = [v5 delegate];
  double v7 = [(ICBaseLayoutManager *)self textView];
  int v8 = [v6 textViewShouldBeginEditing:v7];

  double v9 = [v4 trackedParagraph];
  uint64_t v10 = [v9 characterRange];
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  uint64_t v14 = [v4 isDone] ^ 1;
  double v15 = [(ICBaseLayoutManager *)self textController];
  uint64_t v16 = [(ICLayoutManager *)self textStorage];
  int v17 = objc_msgSend(v15, "setDone:range:inTextStorage:", v14, v12, v13, v16);

  if (v17)
  {
    [v4 setDone:v14];
    [v4 wasPressed];
    uint64_t v18 = [(ICLayoutManager *)self icTextView];
    uint64_t v19 = [v18 icDelegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = [(ICLayoutManager *)self icTextView];
      v22 = [v21 icDelegate];
      [v22 didInvokeAnalyticsChecklistActionChecked:v14];
    }
  }
  id v23 = [MEMORY[0x263F82950] sharedMenuController];
  int v24 = [v23 isMenuVisible];

  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263F82950] sharedMenuController];
    [v25 setMenuVisible:0 animated:1];
  }
  uint64_t v26 = [(ICBaseLayoutManager *)self textView];
  if ([v26 isFirstResponder])
  {
    BOOL v27 = -[ICLayoutManager selectedRangesIntersectWithRange:](self, "selectedRangesIntersectWithRange:", v12, v13);

    if (v27) {
      goto LABEL_13;
    }
    if (v12 <= v13 + v12 - 1) {
      uint64_t v12 = v13 + v12 - 1;
    }
    uint64_t v26 = [(ICBaseLayoutManager *)self textView];
    objc_msgSend(v26, "setSelectedRange:", v12, 0);
  }

LABEL_13:
  if (v17)
  {
    uint64_t v28 = [(ICBaseLayoutManager *)self textView];
    uint64_t v29 = [v28 delegate];
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      double v31 = [(ICBaseLayoutManager *)self textView];
      double v32 = [v31 delegate];
      CGFloat v33 = [(ICBaseLayoutManager *)self textView];
      [v32 textViewDidChange:v33];
    }
    objc_opt_class();
    double v34 = [(ICLayoutManager *)self icTextView];
    CGFloat v35 = ICDynamicCast();

    if (v35)
    {
      objc_initWeak(&location, self);
      double v36 = [(ICBaseLayoutManager *)self textController];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __41__ICLayoutManager_handleTodoButtonPress___block_invoke;
      v37[3] = &unk_2640B8FB8;
      objc_copyWeak(&v38, &location);
      [v36 autoSortChecklistIfNecessaryForTrackedParagraph:v9 textView:v35 analyticsHandler:v37];

      dispatchMainAfterDelay();
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
  }
LABEL_19:
}

void __41__ICLayoutManager_handleTodoButtonPress___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained eventReporter];
  [v3 submitMoveCheckedItemsToBottomSwitchEventWithNewState:a2 isInApp:1];
}

void __41__ICLayoutManager_handleTodoButtonPress___block_invoke_2()
{
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    id v4 = (objc_class *)objc_opt_class();
    char v5 = NSStringFromClass(v4);
    id v6 = [(ICBaseLayoutManager *)self textView];
    double v7 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    double v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  uint64_t v10 = self->_eventReporter;

  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  double v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(ICBaseLayoutManager *)self textView];
  uint64_t v6 = objc_msgSend(v5, "ic_selectedRanges");

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        NSUInteger v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) rangeValue];
        v13.NSUInteger location = v11;
        v13.NSUInteger length = v12;
        if (v12 || (v11 >= location ? (BOOL v14 = v11 - location >= length) : (BOOL v14 = 1), v14))
        {
          v23.NSUInteger location = location;
          v23.NSUInteger length = length;
          if (!NSIntersectionRange(v23, v13).length) {
            continue;
          }
        }
        BOOL v15 = 1;
        goto LABEL_17;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (void)clearAllTodos
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        [v10 removeFromSuperview];
        NSUInteger v11 = [v8 UUIDString];
        [(ICLayoutManager *)self clearSupplementalViewForIdentifier:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  NSUInteger v12 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  [v12 removeAllObjects];
}

- (void)prepareForScreenshotWithVisibleRange:(_NSRange)a3
{
  -[ICLayoutManager setShouldManuallyRenderSeparateSubviews:](self, "setShouldManuallyRenderSeparateSubviews:", 1, a3.length);

  [(ICLayoutManager *)self hideVisibleTodoButtons];
}

- (void)cleanUpAfterScreenshot
{
  [(ICLayoutManager *)self setShouldManuallyRenderSeparateSubviews:0];
  [(ICLayoutManager *)self cleanupStaleTodoButtons];
  [(ICLayoutManager *)self clearAllSupplementalViews];

  [(ICLayoutManager *)self updateVisibleSupplementalViews];
}

- (void)hideVisibleTodoButtons
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
        NSUInteger v11 = [v10 objectForKeyedSubscript:v9];

        if (([v11 isHidden] & 1) == 0)
        {
          [v11 setHidden:1];
          objc_msgSend(v3, "ic_addNonNilObject:", v11);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(ICLayoutManager *)self setHiddenTodosForManualLayout:v3];
}

- (void)unHideVisibleTodoButtons
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(ICLayoutManager *)self hiddenTodosForManualLayout];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setHidden:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(ICLayoutManager *)self setHiddenTodosForManualLayout:0];
}

- (void)layoutViewForInlineTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICLayoutManager *)self inlineAttachmentLocationCache];
  uint64_t v8 = [v6 viewIdentifier];
  [v7 setLocation:a4 forTextAttachmentOfViewIdentifier:v8];

  objc_opt_class();
  long long v9 = [(ICLayoutManager *)self supplementalViewControllers];
  long long v10 = [v6 viewIdentifier];

  long long v11 = [v9 objectForKeyedSubscript:v10];
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  long long v12 = v13;
  if (v13)
  {
    [v13 layoutWithStyleAttributesOfCharacterIndex:a4];
    long long v12 = v13;
  }
}

- (void)manuallyRenderSubviewsForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v24 = *MEMORY[0x263EF8340];
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke;
  aBlock[3] = &__block_descriptor_40_e22_v24__0__UIView_8B16B20l;
  aBlock[4] = CurrentContext;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = [(ICLayoutManager *)self textStorage];
  uint64_t v9 = *MEMORY[0x263F814A0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke_2;
  v20[3] = &unk_2640B9000;
  v20[4] = self;
  id v10 = v7;
  id v21 = v10;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v20);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v11 = -[ICLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", location, length, 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*((void (**)(id, void, BOOL, void))v10 + 2))(v10, *(void *)(*((void *)&v16 + 1) + 8 * v15++), [(ICLayoutManager *)self shouldAdjustTodoButtonFramesForPrinting], 0);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v13);
  }
}

void __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  id v13 = a2;
  uint64_t v7 = [v13 isHidden];
  [v13 setHidden:0];
  [v13 layoutIfNeeded];
  CGContextSaveGState(*(CGContextRef *)(a1 + 32));
  uint64_t v8 = [v13 layer];
  if (!v8) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"layer", "-[ICLayoutManager manuallyRenderSubviewsForCharacterRange:]_block_invoke", 1, 0, @"Subview does not have any layer for rendering %@", v13 functionName simulateCrash showAlert format];
  }
  [v13 frame];
  double v10 = v9;
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), v11, v12);
  if (a3)
  {
    CGContextScaleCTM(*(CGContextRef *)(a1 + 32), v10 / (v10 + 3.0), v10 / (v10 + 3.0));
    CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), 0.0, 3.0);
  }
  if (a4)
  {
    [v13 bounds];
    objc_msgSend(v13, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
  }
  else
  {
    [v8 renderInContext:*(void *)(a1 + 32)];
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 32));
  [v13 setHidden:v7];
}

uint64_t __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v20 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![*(id *)(a1 + 32) isRenderingPreviewForDragAndDrop]) {
        goto LABEL_15;
      }
      id v6 = v20;
      uint64_t v7 = [*(id *)(a1 + 32) viewForTextAttachment:v6];
      if (v7)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        double v9 = [v6 viewIdentifier];
        [v8 unhideSupplementalView:v7 forIdentifier:v9];

        objc_opt_class();
        double v10 = [*(id *)(a1 + 32) viewControllerForTextAttachment:v6];
        CGFloat v11 = ICDynamicCast();
        [v11 prepareForPrinting];

        objc_opt_class();
        CGFloat v12 = ICDynamicCast();
        [v12 prepareForPrinting];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v20;
      uint64_t v14 = [*(id *)(a1 + 32) textView];
      uint64_t v7 = [v13 viewProviderForParentView:v14 characterIndex:a3 layoutManager:*(void *)(a1 + 32)];

      uint64_t v15 = [v7 view];
      if (!v15)
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      long long v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      id v17 = v20;
      long long v18 = [*(id *)(a1 + 32) textView];
      uint64_t v7 = [v17 viewProviderForParentView:v18 characterIndex:a3 layoutManager:*(void *)(a1 + 32)];

      uint64_t v15 = [v7 view];
      if (!v15) {
        goto LABEL_13;
      }
      long long v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v16();
    goto LABEL_13;
  }
LABEL_15:

  return MEMORY[0x270F9A758]();
}

- (id)todoButtonsForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(ICLayoutManager *)self textStorage];
  uint64_t v8 = *MEMORY[0x263F5AB28];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __48__ICLayoutManager_todoButtonsForCharacterRange___block_invoke;
  uint64_t v15 = &unk_2640B8EA0;
  long long v16 = self;
  id v17 = v6;
  id v9 = v6;
  objc_msgSend(v7, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v8, location, length, 0, &v12);

  double v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);

  return v10;
}

uint64_t __48__ICLayoutManager_todoButtonsForCharacterRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v8 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v8 isList]
      && [v8 style] == 103)
    {
      uint64_t v4 = [*(id *)(a1 + 32) todoButtonsByTrackingUUID];
      id v5 = [v8 todoTrackingUUID];
      id v6 = [v4 objectForKeyedSubscript:v5];

      if (v6) {
        [*(id *)(a1 + 40) addObject:v6];
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)trackedTodoParagraphAtIndexIfExists:(unint64_t)a3
{
  uint64_t v4 = [(ICLayoutManager *)self paragraphStyleForCharacterIndex:a3];
  id v5 = [(ICLayoutManager *)self trackedToDoParagraphs];
  id v6 = [v4 todoTrackingUUID];
  uint64_t v7 = objc_msgSend(v5, "ic_objectForNonNilKey:", v6);

  return v7;
}

- (id)todoButtonForTrackedParagraphIfExists:(id)a3
{
  uint64_t v4 = [a3 paragraph];
  id v5 = [v4 todoTrackingUUID];

  id v6 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  uint64_t v7 = objc_msgSend(v6, "ic_objectForNonNilKey:", v5);

  return v7;
}

- (unint64_t)lineCountForCharacterRange:(_NSRange)a3
{
  NSUInteger v3 = a3.location + a3.length;
  if (__CFADD__(a3.location, a3.length)) {
    return 0;
  }
  unint64_t v5 = 0;
  do
  {
    [(ICLayoutManager *)self lineFragmentRectForGlyphAtIndex:0 effectiveRange:0];
    ++v5;
  }
  while (v8 + v7 <= v3);
  return v5;
}

- (void)cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        double v10 = [v3 objectForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CGFloat v11 = [v10 viewIdentifier];

          if (!v11)
          {
            [v10 removeFromSuperview];
            [v3 removeObjectForKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)cleanupStaleTodoButtons
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(ICLayoutManager *)self activeSupplementalViews];
  [(ICLayoutManager *)self cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:v3];

  uint64_t v4 = [(ICLayoutManager *)self hiddenSupplementalViews];
  [(ICLayoutManager *)self cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:v4];

  uint64_t v5 = [(ICLayoutManager *)self icTextView];
  uint64_t v6 = [v5 containerViewForAttachments];
  uint64_t v7 = [v6 subviews];
  uint64_t v8 = (void *)[v7 copy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        long long v15 = ICDynamicCast();
        uint64_t v16 = objc_msgSend(v15, "viewIdentifier", (void)v19);
        uint64_t v17 = (void *)v16;
        if (v15) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18) {
          [v14 removeFromSuperview];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)updateSubviewsForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[ICLayoutManager setCachedOrigin:](self, "setCachedOrigin:", a4.x, a4.y);

  -[ICLayoutManager updateSubviewsForCharacterRange:](self, "updateSubviewsForCharacterRange:", location, length);
}

- (void)updateSubviewsForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(ICLayoutManager *)self textStorage];
  uint64_t v7 = *MEMORY[0x263F5AB28];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ICLayoutManager_updateSubviewsForCharacterRange___block_invoke;
  v8[3] = &unk_2640B9028;
  v8[4] = self;
  objc_msgSend(v6, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v7, location, length, 0, v8);
}

void __51__ICLayoutManager_updateSubviewsForCharacterRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v11 isList]
      && [v11 style] == 103)
    {
      uint64_t v7 = [*(id *)(a1 + 32) textStorage];
      uint64_t v8 = [v7 attribute:*MEMORY[0x263F5AD70] atIndex:a3 effectiveRange:0];

      id v9 = *(void **)(a1 + 32);
      [v9 cachedOrigin];
      id v10 = (id)[v9 drawTodoViewForListRange:a3 paragraphStyle:a4 checkmarkHighlightValue:v11 atPoint:v8];
    }
  }
}

- (void)clearAllSupplementalViews
{
  v1 = [a1 supplementalViewControllers];
  v2 = [v1 allKeys];
  OUTLINED_FUNCTION_1(&dword_20BE60000, v3, v4, "Cleaning up remaining view controllers after clearing supplemental views: %@", v5, v6, v7, v8, 2u);
}

- (void)clearAllTodoSupplementalViews
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICLayoutManager *)self activeSupplementalViews];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = [(ICLayoutManager *)self hiddenSupplementalViews];
  uint64_t v6 = [v5 allValues];
  uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        uint64_t v13 = ICDynamicCast();
        if (v13) {
          -[ICLayoutManager removeClearingControllerForView:](self, "removeClearingControllerForView:", v13, v15);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  long long v14 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
  [v14 removeAllObjects];
}

- (void)textStorageDidEndEditingNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = [(ICLayoutManager *)self textStorage];

  if (v4 == v5)
  {
    [(ICLayoutManager *)self clearRemovedAttachmentsIfNeeded];
  }
}

- (void)removeClearingControllerForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewIdentifier];
  if (!v5)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICLayoutManager removeClearingControllerForView:](v4);
    }
  }
  [(ICLayoutManager *)self removeClearingControllerForView:v4 viewIdentifier:v5];
}

- (void)removeClearingControllerForView:(id)a3 viewIdentifier:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(ICLayoutManager *)self supplementalViewProviders];
    id v8 = [v7 objectForKeyedSubscript:v6];

    objc_opt_class();
    uint64_t v9 = [(ICLayoutManager *)self supplementalViewControllers];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];
    uint64_t v11 = ICDynamicCast();
  }
  else
  {
    uint64_t v11 = 0;
    id v8 = 0;
  }
  [v11 willMoveToParentViewController:0];
  uint64_t v12 = [v8 textAttachment];

  if (v12)
  {
    uint64_t v13 = [v8 textAttachment];
    long long v14 = [v18 superview];
    [v13 detachView:v18 fromParentView:v14];

    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v18 removeFromSuperview];
  if (v11)
  {
LABEL_6:
    long long v15 = [(ICLayoutManager *)self supplementalViewControllers];
    [v15 removeObjectForKey:v6];
  }
LABEL_7:
  if (v6)
  {
    long long v16 = [(ICLayoutManager *)self supplementalViewProviders];
    [v16 removeObjectForKey:v6];

    long long v17 = [(ICLayoutManager *)self inlineAttachmentLocationCache];
    [v17 forgetLocationForViewIdentifier:v6];
  }
  [v11 removeFromParentViewController];
}

- (void)clearRemovedAttachmentsIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  if ([(ICLayoutManager *)obj needsClearRemovedAttachments])
  {
    [(ICLayoutManager *)obj _clearRemovedAttachments];
    [(ICLayoutManager *)obj setNeedsClearRemovedAttachments:0];
  }
  objc_sync_exit(obj);
}

- (void)_clearRemovedAttachments
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(ICLayoutManager *)self textStorage];
  uint64_t v5 = *MEMORY[0x263F814A0];
  id v6 = [(ICLayoutManager *)self textStorage];
  uint64_t v7 = [v6 length];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __43__ICLayoutManager__clearRemovedAttachments__block_invoke;
  v36[3] = &unk_2640B89D0;
  id v8 = v3;
  id v37 = v8;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v36);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [(ICLayoutManager *)self hiddenSupplementalViews];
  v39[0] = v9;
  uint64_t v10 = [(ICLayoutManager *)self activeSupplementalViews];
  v39[1] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];

  id obj = v11;
  uint64_t v26 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v12;
        uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v14 = [v13 allKeys];
        long long v15 = (void *)[v14 copy];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v21 = [v13 objectForKeyedSubscript:v20];
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                if (![v8 containsObject:v20]
                  || ([v21 viewIdentifier],
                      long long v22 = objc_claimAutoreleasedReturnValue(),
                      v22,
                      !v22))
                {
                  [(ICLayoutManager *)self removeClearingControllerForView:v21 viewIdentifier:v20];
                  [v13 removeObjectForKey:v20];
                  NSRange v23 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
                  [v23 removeObjectForKey:v20];
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
          }
          while (v17);
        }

        uint64_t v12 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v26);
  }
}

void __43__ICLayoutManager__clearRemovedAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = [v4 viewIdentifier];
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v3);
}

- (void)setNeedsClearRemovedAttachments:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    objc_opt_class();
    uint64_t v5 = [(ICLayoutManager *)self textStorage];
    id v6 = ICDynamicCast();
    char v7 = [v6 isEditing];

    if ((v7 & 1) == 0)
    {
      [(ICLayoutManager *)self _clearRemovedAttachments];
      BOOL v3 = 0;
    }
  }
  self->_needsClearRemovedAttachments = v3;
}

- (void)ensureViewIsAddedForAttachment:(id)a3 inCharacterRange:(_NSRange)a4
{
  id v12 = a3;
  uint64_t v5 = -[ICLayoutManager viewForTextAttachment:](self, "viewForTextAttachment:");
  objc_opt_class();
  id v6 = ICDynamicCast();
  char v7 = v6;
  if (v6)
  {
    id v8 = [v6 attachment];
    uint64_t v9 = [v12 attachment];

    if (v8 != v9)
    {
      [(ICLayoutManager *)self clearViewForTextAttachment:v12];
      uint64_t v10 = [(ICLayoutManager *)self viewForTextAttachment:v12];

      uint64_t v5 = (void *)v10;
    }
  }
  uint64_t v11 = [v12 viewIdentifier];
  [(ICLayoutManager *)self unhideSupplementalView:v5 forIdentifier:v11];
}

- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6 = a3;
  char v7 = [(ICLayoutManager *)self textStorage];
  uint64_t v8 = objc_msgSend(v7, "ic_rangeForAttachment:withTextAttachment:", v6, a4);
  NSUInteger v10 = v9;

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)rangeForBaseAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6 = a3;
  char v7 = [(ICLayoutManager *)self textStorage];
  uint64_t v8 = objc_msgSend(v7, "ic_rangeForBaseAttachment:withTextAttachment:", v6, a4);
  NSUInteger v10 = v9;

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [(ICLayoutManager *)self textStorage];
  uint64_t v9 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__ICLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke;
  v11[3] = &unk_2640B9050;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v11);
}

uint64_t __62__ICLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    objc_opt_class();
    id v4 = [*(id *)(a1 + 32) viewForTextAttachmentNoCreate:v3];
    uint64_t v5 = ICDynamicCast();

    if (v5) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 viewIdentifier];
  NSUInteger v11 = [(ICLayoutManager *)self supplementalViewProviders];
  id v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    uint64_t v13 = (void *)MEMORY[0x263F81678];
    long long v14 = [v8 fileType];
    long long v15 = (void *)[v13 textAttachmentViewProviderClassForFileType:v14];

    if ((([v15 isSubclassOfClass:objc_opt_class()] & 1) == 0 && v15
       || [v8 isUnsupported]
       && (uint64_t v17 = (void *)MEMORY[0x263F5ACE8],
           [v8 fileType],
           uint64_t v18 = objc_claimAutoreleasedReturnValue(),
           LODWORD(v17) = [v17 typeUTIIsInlineAttachment:v18],
           v18,
           v17)
       && (long long v15 = (void *)[MEMORY[0x263F81678] textAttachmentViewProviderClassForFileType:*MEMORY[0x263F5AAD0]]) != 0)&& !objc_msgSend(v8, "isUnsupported"))
    {
      int v16 = 0;
    }
    else
    {
      long long v15 = objc_opt_class();
      int v16 = 1;
    }
    id v12 = (void *)[objc_alloc((Class)v15) initWithTextAttachment:v8 parentView:v9 characterIndex:a5 layoutManager:self];
    if (v16 && v10)
    {
      long long v19 = [(ICLayoutManager *)self supplementalViewProviders];
      [v19 setObject:v12 forKeyedSubscript:v10];
    }
  }

  return v12;
}

- (void)willPlaceView:(id)a3 forTextAttachment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v9;
    id v8 = [(ICBaseLayoutManager *)self textContainer];
    [v6 attachmentSizeForTextContainer:v8];
    objc_msgSend(v7, "setAttachmentContentSize:");
  }
}

- (void)didAddViewForTextAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICLayoutManager *)self icTextView];

  if (!v5) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.icTextView) != nil)", "-[ICLayoutManager didAddViewForTextAttachment:]", 1, 0, @"Expected non-nil value for '%s'", "self.icTextView");
  }
  id v6 = [(ICLayoutManager *)self supplementalViewControllers];
  id v7 = [v4 viewIdentifier];

  id v16 = [v6 objectForKeyedSubscript:v7];

  if (v16)
  {
    id v8 = [(ICLayoutManager *)self icTextView];
    id v9 = [v8 editorController];
    id v10 = [v9 textViewController];
    [v10 addChildViewController:v16];

    NSUInteger v11 = [(ICLayoutManager *)self icTextView];
    id v12 = [v11 editorController];
    uint64_t v13 = [v12 textViewController];
    [v16 didMoveToParentViewController:v13];

    long long v14 = [(ICLayoutManager *)self highlightPatternRegexFinder];
    objc_opt_class();
    long long v15 = ICDynamicCast();
    [v15 setHighlightPatternRegexFinder:v14];
  }
}

- (id)paragraphStyleForCharacterIndex:(unint64_t)a3
{
  id v4 = [(ICLayoutManager *)self textStorage];
  uint64_t v5 = [v4 attribute:*MEMORY[0x263F5AB28] atIndex:a3 effectiveRange:0];

  return v5;
}

- (void)receivedMemoryWarning:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  uint64_t v5 = [v4 allKeys];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        id v12 = [(ICLayoutManager *)self supplementalViewForIdentifier:v11 allowHiddenViews:1];
        uint64_t v13 = ICDynamicCast();

        long long v14 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
        [v14 removeObjectForKey:v11];

        [v13 didScrollOutOfVisibleRange];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  [v15 removeAllObjects];

  id v16 = [(ICLayoutManager *)self updateHiddenViewsSelectorDelayer];
  [v16 cancelPreviousFireRequests];
}

- (void)updateHiddenSupplementalViews
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  id v4 = [v3 allKeys];
  uint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v11 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
        id v12 = [v11 objectForKeyedSubscript:v10];

        [v12 timeIntervalSinceNow];
        if (v13 <= -0.1)
        {
          objc_opt_class();
          long long v14 = [(ICLayoutManager *)self supplementalViewForIdentifier:v10 allowHiddenViews:1];
          long long v15 = ICDynamicCast();

          id v16 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
          [v16 removeObjectForKey:v10];

          [v15 didScrollOutOfVisibleRange];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  long long v17 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  uint64_t v18 = [v17 count];

  long long v19 = [(ICLayoutManager *)self updateHiddenViewsSelectorDelayer];
  long long v20 = v19;
  if (v18) {
    [v19 requestFire];
  }
  else {
    [v19 cancelPreviousFireRequests];
  }
}

- (BOOL)unhideSupplementalView:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    long long v19 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v21 = 0;
      _os_log_impl(&dword_20BE60000, v19, OS_LOG_TYPE_DEFAULT, "Asked to unhide a view with a nil identifier", v21, 2u);
    }

    goto LABEL_9;
  }
  uint64_t v8 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  uint64_t v9 = [v8 objectForKey:v7];

  uint64_t v10 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
  [v10 removeObjectForKey:v7];

  uint64_t v11 = [(ICLayoutManager *)self hiddenSupplementalViews];
  id v12 = [v11 objectForKey:v7];

  if (!v12)
  {
LABEL_9:
    BOOL v18 = 0;
    goto LABEL_10;
  }
  double v13 = [(ICLayoutManager *)self hiddenSupplementalViews];
  [v13 removeObjectForKey:v7];

  long long v14 = [(ICLayoutManager *)self activeSupplementalViews];
  [v14 setObject:v6 forKeyedSubscript:v7];

  long long v15 = [(ICLayoutManager *)self highlightPatternRegexFinder];
  objc_opt_class();
  id v16 = ICDynamicCast();
  [v16 setHighlightPatternRegexFinder:v15];

  [v6 setHidden:0];
  if (!v9)
  {
    objc_opt_class();
    long long v17 = ICDynamicCast();
    [v17 didScrollIntoVisibleRange];
  }
  BOOL v18 = 1;
LABEL_10:

  return v18;
}

- (void)hideSupplementalView:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(ICLayoutManager *)self activeSupplementalViews];
    uint64_t v9 = [v8 objectForKey:v7];

    if (!v9)
    {
LABEL_16:
      [(ICLayoutManager *)self updateHiddenSupplementalViews];
      goto LABEL_17;
    }
    objc_opt_class();
    uint64_t v10 = [(ICLayoutManager *)self supplementalViewControllers];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
    id v12 = ICDynamicCast();

    if (!v12 || ([v12 isInResponderChain] & 1) == 0)
    {
      double v13 = [(ICLayoutManager *)self activeSupplementalViews];
      [v13 removeObjectForKey:v7];

      long long v14 = [(ICLayoutManager *)self hiddenSupplementalViews];
      [v14 setObject:v6 forKeyedSubscript:v7];

      [v6 setHidden:1];
    }
    objc_opt_class();
    long long v15 = ICDynamicCast();
    id v16 = v15;
    if (v15)
    {
      int v17 = [v15 cancelDidScrollIntoVisibleRange];
      BOOL v18 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
      long long v19 = v18;
      if (v17)
      {
        [v18 removeObjectForKey:v7];
LABEL_14:

        goto LABEL_15;
      }
      long long v21 = [v18 objectForKeyedSubscript:v7];

      if (!v21)
      {
        long long v19 = [MEMORY[0x263EFF910] date];
        long long v22 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
        [v22 setObject:v19 forKeyedSubscript:v7];

        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  long long v20 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v23 = 0;
    _os_log_impl(&dword_20BE60000, v20, OS_LOG_TYPE_DEFAULT, "Asked to hide a view with a nil identifier", v23, 2u);
  }

LABEL_17:
}

- (void)ensureLayoutForSurroundingPages
{
  id v3 = [(ICBaseLayoutManager *)self textView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  [(ICLayoutManager *)self layoutEnsuredBounds];
  if (!CGRectIsInfinite(v32))
  {
    [(ICLayoutManager *)self layoutEnsuredBounds];
    if (CGRectIsNull(v33)
      || (v34.origin.CGFloat x = v5,
          v34.origin.CGFloat y = v7,
          v34.size.CGFloat width = v9,
          v34.size.CGFloat height = v11,
          double MinY = CGRectGetMinY(v34),
          [(ICLayoutManager *)self layoutEnsuredBounds],
          MinY < v11 * 0.125 + CGRectGetMinY(v35)))
    {
      v36.origin.CGFloat x = v5;
      v36.origin.CGFloat y = v7;
      v36.size.CGFloat width = v9;
      v36.size.CGFloat height = v11;
      CGRect v37 = CGRectOffset(v36, 0.0, v11 * -2.0);
      v48.origin.CGFloat x = v5;
      v48.origin.CGFloat y = v7;
      v48.size.CGFloat width = v9;
      v48.size.CGFloat height = v11;
      CGRect v38 = CGRectUnion(v37, v48);
      CGFloat x = v38.origin.x;
      CGFloat y = v38.origin.y;
      CGFloat width = v38.size.width;
      CGFloat height = v38.size.height;
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
      CGFloat height = v11;
      CGFloat width = v9;
      CGFloat y = v7;
      CGFloat x = v5;
    }
    [(ICLayoutManager *)self layoutEnsuredBounds];
    if (CGRectIsNull(v39)) {
      goto LABEL_8;
    }
    v40.origin.CGFloat x = v5;
    v40.origin.CGFloat y = v7;
    v40.size.CGFloat width = v9;
    v40.size.CGFloat height = v11;
    double v29 = width;
    double v18 = height;
    double MaxY = CGRectGetMaxY(v40);
    [(ICLayoutManager *)self layoutEnsuredBounds];
    BOOL v20 = MaxY <= CGRectGetMaxY(v41) + v11 * -0.125;
    CGFloat height = v18;
    CGFloat width = v29;
    if (v20)
    {
      if (!v17) {
        return;
      }
    }
    else
    {
LABEL_8:
      v42.origin.CGFloat x = v5;
      v42.origin.CGFloat y = v7;
      v42.size.CGFloat width = v9;
      v42.size.CGFloat height = v11;
      CGRect v43 = CGRectOffset(v42, 0.0, v11 + v11);
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      CGRect v44 = CGRectUnion(v43, v49);
      CGFloat x = v44.origin.x;
      CGFloat y = v44.origin.y;
      CGFloat width = v44.size.width;
      CGFloat height = v44.size.height;
    }
    [(ICLayoutManager *)self layoutEnsuredBounds];
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRect v46 = CGRectUnion(v45, v50);
    -[ICLayoutManager setLayoutEnsuredBounds:](self, "setLayoutEnsuredBounds:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
    [(ICLayoutManager *)self layoutEnsuredBounds];
    if (!CGRectIsNull(v47))
    {
      [(ICLayoutManager *)self layoutEnsuredBounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      id v30 = [(ICBaseLayoutManager *)self textContainer];
      -[ICLayoutManager ensureLayoutForBoundingRect:inTextContainer:](self, "ensureLayoutForBoundingRect:inTextContainer:", v30, v22, v24, v26, v28);
    }
  }
}

- (void)clearLayoutEnsuredBounds
{
}

- (void)invalidateLayoutForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (![(ICLayoutManager *)self isSettingLinkTextAttributes])
  {
    [(ICLayoutManager *)self clearLayoutEnsuredBounds];
    v8.receiver = self;
    v8.super_class = (Class)ICLayoutManager;
    -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](&v8, sel_invalidateLayoutForCharacterRange_actualCharacterRange_, location, length, a4);
  }
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  double v4 = *MEMORY[0x263F00190];
  double v5 = *(double *)(MEMORY[0x263F00190] + 8);
  double v6 = *(double *)(MEMORY[0x263F00190] + 16);
  double v7 = *(double *)(MEMORY[0x263F00190] + 24);
  id v8 = a3;
  -[ICLayoutManager setLayoutEnsuredBounds:](self, "setLayoutEnsuredBounds:", v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)ICLayoutManager;
  [(ICLayoutManager *)&v9 ensureLayoutForTextContainer:v8];
}

- (CGRect)boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager boundingRectForGlyphRange:inTextContainer:](&v42, sel_boundingRectForGlyphRange_inTextContainer_, location, length, v7);
  double x = v8;
  CGFloat y = v10;
  double width = v12;
  CGFloat height = v14;
  if ([(ICLayoutManager *)self isDraggingChecklistItem])
  {
    uint64_t v16 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    uint64_t v18 = v17;
    long long v19 = [(ICLayoutManager *)self paragraphStyleForCharacterIndex:v16];
    uint64_t v20 = [v19 writingDirection];
    double v21 = -[ICLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", v16, v18);
    [v7 textContainerOrigin];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      TSDMultiplyPointScalar();
      uint64_t v25 = *(void *)v39;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v26), "frame", (void)v38);
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          TSDAddPoints();
          v49.origin.double x = v31;
          v49.origin.CGFloat y = v32;
          v45.origin.double x = x;
          v45.origin.CGFloat y = y;
          v45.size.double width = width;
          v45.size.CGFloat height = height;
          v49.size.double width = v28;
          v49.size.CGFloat height = v30;
          CGRect v46 = CGRectUnion(v45, v49);
          CGRect v47 = CGRectIntegral(v46);
          double x = v47.origin.x;
          CGFloat y = v47.origin.y;
          double width = v47.size.width;
          CGFloat height = v47.size.height;
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v24);
    }

    double v33 = -0.0;
    if (v20 != 1) {
      double v33 = x;
    }
    double width = width + v33;
    if (v20 != 1) {
      double x = 0.0;
    }
  }
  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.CGFloat height = v37;
  result.size.double width = v36;
  result.origin.CGFloat y = v35;
  result.origin.double x = v34;
  return result;
}

- (void)updateVisibleSupplementalViews
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [(ICLayoutManager *)self textStorage];

  if (v3)
  {
    double v4 = [(ICBaseLayoutManager *)self textView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    double v13 = [(ICBaseLayoutManager *)self textContainer];
    -[ICLayoutManager ensureLayoutForBoundingRect:inTextContainer:](self, "ensureLayoutForBoundingRect:inTextContainer:", v13, v6, v8, v10, v12);

    double v14 = [(ICBaseLayoutManager *)self textContainer];
    uint64_t v15 = -[ICLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", v14, v6, v8, v10, v12);
    uint64_t v17 = v16;

    uint64_t v18 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v15, v17, 0);
    uint64_t v20 = v19;
    double v21 = [MEMORY[0x263EFF9C0] set];
    id v22 = v21;
    if (v20 && v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke;
      v44[3] = &unk_2640B9078;
      v44[4] = self;
      id v23 = v21;
      id v45 = v23;
      -[ICLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", v18, v20, v44);
      uint64_t v24 = (void *)MEMORY[0x263F82E00];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_2;
      v40[3] = &unk_2640B8A70;
      v40[4] = self;
      uint64_t v42 = v18;
      uint64_t v43 = v20;
      id v41 = v23;
      objc_msgSend(v24, "ic_performWithoutAnimation:", v40);
    }
    uint64_t v25 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v26 = [(ICLayoutManager *)self activeSupplementalViews];
    double v27 = [v26 allValues];
    CGFloat v28 = [v25 setWithArray:v27];

    [v28 minusSet:v22];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          double v35 = objc_msgSend(v34, "viewIdentifier", (void)v36);
          [(ICLayoutManager *)self hideSupplementalView:v34 forIdentifier:v35];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v31);
    }

    [(ICLayoutManager *)self updateHiddenSupplementalViews];
  }
}

void __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v7 = a2;
  double v6 = [a3 viewIdentifier];
  [v5 unhideSupplementalView:v7 forIdentifier:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

void __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textStorage];
  uint64_t v3 = *MEMORY[0x263F5AB28];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_3;
  v5[3] = &unk_2640B8EA0;
  double v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(v2, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v3, *(void *)(a1 + 48), *(void *)(a1 + 56), 0, v5);
}

uint64_t __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v15 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v15 isList]
      && [v15 style] == 103)
    {
      double v8 = [*(id *)(a1 + 32) textStorage];
      double v9 = [v8 attribute:*MEMORY[0x263F5AD70] atIndex:a3 effectiveRange:0];

      double v10 = *(void **)(a1 + 32);
      [v10 cachedOrigin];
      double v11 = [v10 drawTodoViewForListRange:a3 paragraphStyle:a4 checkmarkHighlightValue:v15 atPoint:v9];
      if (v11)
      {
        [*(id *)(a1 + 40) addObject:v11];
        double v12 = *(void **)(a1 + 32);
        double v13 = [v11 viewIdentifier];
        [v12 unhideSupplementalView:v11 forIdentifier:v13];
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)updateInlineDrawingViews
{
  uint64_t v3 = [(ICBaseLayoutManager *)self textView];
  double v4 = [v3 textStorage];

  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v4 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ICLayoutManager_updateInlineDrawingViews__block_invoke;
  v7[3] = &unk_2640B89D0;
  v7[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v7);
}

uint64_t __43__ICLayoutManager_updateInlineDrawingViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  double v14 = ICDynamicCast();

  if (v14)
  {
    id v7 = [*(id *)(a1 + 32) viewProviderForTextAttachment:v14 characterIndex:a3];
    double v8 = [v7 view];
    if ([v8 conformsToProtocol:&unk_26C1E8988]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double v9 = [v14 attachment];
      double v10 = [v9 managedObjectContext];
      objc_msgSend(v10, "ic_refreshObject:mergeChanges:", v9, 1);

      double v11 = [v9 inlineDrawingModel];
      double v12 = (void *)[v11 newDrawingFromMergeableData];

      [v8 drawingDataDidChange:v12];
    }
  }

  return MEMORY[0x270F9A790](v6);
}

- (void)attachmentDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F5AB78];
  id v29 = v4;
  uint64_t v6 = [v4 object];
  id v7 = [(ICBaseLayoutManager *)self textController];
  double v8 = [v7 note];
  double v9 = [v8 managedObjectContext];
  double v10 = objc_msgSend(v5, "ic_existingObjectWithID:context:", v6, v9);

  if (v10)
  {
    double v11 = 0;
    double v12 = v10;
  }
  else
  {
    double v13 = (void *)MEMORY[0x263F5AC68];
    double v14 = [v29 object];
    uint64_t v15 = [(ICBaseLayoutManager *)self textController];
    uint64_t v16 = [v15 note];
    uint64_t v17 = [v16 managedObjectContext];
    double v12 = objc_msgSend(v13, "ic_existingObjectWithID:context:", v14, v17);

    double v11 = v12;
  }
  id v18 = v12;
  uint64_t v19 = [v18 note];
  uint64_t v20 = [(ICBaseLayoutManager *)self textController];
  double v21 = [v20 note];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    uint64_t v23 = [(ICLayoutManager *)self rangeForBaseAttachment:v18 withTextAttachment:0];
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v25 = v23;
      uint64_t v26 = v24;
      objc_opt_class();
      double v27 = [(ICLayoutManager *)self textStorage];
      CGFloat v28 = ICDynamicCast();

      -[ICLayoutManager filterAttachmentsInTextStorage:range:targetAttachment:](self, "filterAttachmentsInTextStorage:range:targetAttachment:", v28, v25, v26, v18);
      -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", v25, v26, 0);
    }
  }
}

- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = [a5 note];
  objc_msgSend(v9, "filterAttachmentsInTextStorage:range:", v8, location, length);
}

- (void)mediaDidLoad:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5AC80];
  id v5 = [a3 object];
  uint64_t v6 = [(ICBaseLayoutManager *)self textController];
  id v7 = [v6 note];
  id v8 = [v7 managedObjectContext];
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v8);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v13 attachment];
  double v10 = [v9 note];
  double v11 = [(ICBaseLayoutManager *)self textController];
  double v12 = [v11 note];

  if (v10 == v12) {
    [(ICLayoutManager *)self invalidateLayoutForAttachment:v9];
  }
}

- (void)invalidateLayoutForAttachment:(id)a3
{
  uint64_t v4 = [(ICLayoutManager *)self rangeForAttachment:a3 withTextAttachment:0];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", v4, v5, 0);
  }
}

- (void)attachmentInlineDrawingMergeableDataDidChange:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 object];

  uint64_t v5 = ICCheckedDynamicCast();

  if (v5)
  {
    id v6 = v5;
    performBlockOnMainThreadAndWait();
  }
}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F5ACA0] sharedContext];
  id v3 = [v2 managedObjectContext];

  objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v24 = 0;
  uint64_t v5 = [v3 existingObjectWithID:v4 error:&v24];
  id v6 = v24;
  id v7 = ICCheckedDynamicCast();

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    id v23 = 0;
    uint64_t v9 = [v8 rangeForAttachment:v7 withTextAttachment:&v23];
    double v10 = v23;
    if (v10)
    {
      double v11 = [*(id *)(a1 + 40) viewProviderForTextAttachment:v10 characterIndex:v9];
      double v12 = [v11 view];
      if ([v12 conformsToProtocol:&unk_26C1E8988]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v13 = [*(id *)(a1 + 40) workerContext];

        if (!v13)
        {
          double v14 = [MEMORY[0x263F5ACA0] sharedContext];
          uint64_t v15 = [v14 workerManagedObjectContext];
          [*(id *)(a1 + 40) setWorkerContext:v15];
        }
        uint64_t v16 = [*(id *)(a1 + 40) workerContext];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_2;
        v19[3] = &unk_2640B89A8;
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        id v20 = v17;
        uint64_t v21 = v18;
        id v22 = v12;
        [v16 performBlockAndWait:v19];
      }
    }
  }
  else
  {
    double v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_cold_1((uint64_t)v6, v10);
    }
  }
}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F5AB78];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) workerContext];
  uint64_t v5 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);

  if (v5)
  {
    id v6 = [v5 inlineDrawingModel];
    id v7 = (void *)[v6 newDrawingFromMergeableData];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_3;
    v9[3] = &unk_2640B82D8;
    id v10 = *(id *)(a1 + 48);
    id v11 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawingDataDidChange:*(void *)(a1 + 40)];
}

- (id)supplementalViewForIdentifier:(id)a3 allowHiddenViews:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = [(ICLayoutManager *)self activeSupplementalViews];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (!v8 && v4)
    {
      uint64_t v9 = [(ICLayoutManager *)self hiddenSupplementalViews];
      id v8 = [v9 objectForKeyedSubscript:v6];
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_20BE60000, v10, OS_LOG_TYPE_DEFAULT, "Asked for a supplemental view for a nil-identifier", v12, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)clearSupplementalViewForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ICLayoutManager *)self activeSupplementalViews];
    [v5 removeObjectForKey:v4];

    id v6 = [(ICLayoutManager *)self hiddenSupplementalViews];
    [v6 removeObjectForKey:v4];

    id v7 = [(ICLayoutManager *)self delayedScrollOutViewDictionary];
    [v7 removeObjectForKey:v4];
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_DEFAULT, "Asked to clear a supplemental view for a nil-identifier", v8, 2u);
    }
  }
}

- (id)viewForTextAttachment:(id)a3
{
  return [(ICLayoutManager *)self viewForTextAttachment:a3 initialCharacterIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (id)viewForTextAttachment:(id)a3 initialCharacterIndex:(unint64_t)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ICLayoutManager *)self viewForTextAttachmentNoCreate:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(ICBaseLayoutManager *)self textContainer];
    [v6 attachmentViewClassForTextContainer:v9];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_34;
    }
    id v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_DEFAULT, "Found view of wrong type. Recreating.", buf, 2u);
    }

    [(ICLayoutManager *)self clearViewForTextAttachment:v6];
  }
  id v8 = [v6 viewIdentifier];

  if (v8)
  {
    if ([(ICLayoutManager *)self shouldManuallyRenderSeparateSubviews]) {
      uint64_t v12 = [(ICLayoutManager *)self isRenderingPreviewForDragAndDrop] ^ 1;
    }
    else {
      uint64_t v12 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [(ICLayoutManager *)self inlineAttachmentLocationCache];
      double v14 = [v6 viewIdentifier];
      if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
        a4 = [v13 locationForTextAttachmentOfViewIdentifier:v14];
      }
      else {
        [v13 setLocation:a4 forTextAttachmentOfViewIdentifier:v14];
      }
    }
    uint64_t v15 = [v6 newlyCreatedViewControllerForManualRendering:v12 layoutManager:self initialCharacterIndex:a4];
    if (v15)
    {
      uint64_t v16 = [(ICLayoutManager *)self highlightPatternRegexFinder];
      objc_opt_class();
      id v17 = ICDynamicCast();
      [v17 setHighlightPatternRegexFinder:v16];

      uint64_t v18 = [(ICLayoutManager *)self supplementalViewControllers];
      uint64_t v19 = [v6 viewIdentifier];
      [v18 setObject:v15 forKeyedSubscript:v19];

      id v8 = [v15 view];
    }
    else
    {
      if ([(ICLayoutManager *)self shouldManuallyRenderSeparateSubviews]
        && ![(ICLayoutManager *)self isRenderingPreviewForDragAndDrop])
      {
        id v20 = [(ICBaseLayoutManager *)self textContainer];
        uint64_t v21 = [v6 newlyCreatedViewForManualRenderingInTextContainer:v20];
      }
      else
      {
        id v20 = [(ICBaseLayoutManager *)self textContainer];
        uint64_t v21 = [v6 newlyCreatedViewForTextContainer:v20];
      }
      id v8 = (void *)v21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = [(ICLayoutManager *)self icTextView];
      id v23 = [v22 editorController];
      [v6 setLinkMenuDelegate:v23];
    }
    id v24 = [(ICLayoutManager *)self activeSupplementalViews];
    uint64_t v25 = [v6 viewIdentifier];
    [v24 setObject:v8 forKeyedSubscript:v25];

    objc_opt_class();
    uint64_t v26 = ICDynamicCast();
    double v27 = [(ICLayoutManager *)self highlightPatternRegexFinder];
    [v26 setHighlightPatternRegexFinder:v27];

    CGFloat v28 = [(ICBaseLayoutManager *)self textController];
    id v29 = [v28 authorHighlightsController];

    if (v29)
    {
      [v6 foregroundAlpha];
      objc_msgSend(v26, "setForegroundAlpha:");
      uint64_t v30 = [v6 highlightColor];
      [v26 setHighlightColor:v30];
    }
    uint64_t v31 = [v6 attachment];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v31;
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        double v33 = [v32 managedObjectContext];
        int v34 = objc_msgSend(v33, "ic_isMainThreadContext");

        if (v34)
        {
          double v35 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            CGRect v46 = [v32 shortLoggingDescription];
            id v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v32, "markedForDeletion"));
            long long v36 = NSNumber;
            uint64_t v44 = [v32 mergeableData];
            uint64_t v42 = objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
            uint64_t v43 = [v32 media];
            uint64_t v37 = [v43 shortLoggingDescription];
            *(_DWORD *)buf = 138413314;
            CGRect v48 = v46;
            __int16 v49 = 2112;
            CGRect v50 = v45;
            __int16 v51 = 2112;
            CGFloat v52 = v42;
            __int16 v53 = 2112;
            id v54 = v6;
            __int16 v55 = 2112;
            uint64_t v56 = v37;
            long long v38 = (void *)v37;
            _os_log_impl(&dword_20BE60000, v35, OS_LOG_TYPE_INFO, "Created view for attachment %@ markedForDeletion=%@ mergeableDataLength=%@ textAttachment=%@ media=%@", buf, 0x34u);
          }
        }
      }
    }
  }
LABEL_34:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v8;
    long long v40 = [(ICLayoutManager *)self attachmentViewDelegate];
    [v39 setDelegate:v40];
  }

  return v8;
}

- (id)viewForTextAttachmentNoCreate:(id)a3
{
  id v4 = [a3 attachmentIdentifier];
  uint64_t v5 = [(ICLayoutManager *)self supplementalViewForIdentifier:v4 allowHiddenViews:1];

  return v5;
}

- (id)viewForBaseTextAttachmentNoCreate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICLayoutManager *)self viewForTextAttachmentNoCreate:v4];
  }
  else
  {
    id v6 = [v4 attachment];
    uint64_t v7 = [(ICLayoutManager *)self viewProviderForTextAttachment:v4 characterIndex:[(ICLayoutManager *)self rangeForAttachment:v6 withTextAttachment:0]];
    uint64_t v5 = [v7 view];
  }

  return v5;
}

- (id)viewControllerForTextAttachment:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(ICLayoutManager *)self supplementalViewControllers];
  id v8 = [v6 viewIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9 && v4)
  {
    id v10 = [(ICLayoutManager *)self viewForTextAttachment:v6];
    id v11 = [(ICLayoutManager *)self supplementalViewControllers];
    uint64_t v12 = [v6 viewIdentifier];
    uint64_t v9 = [v11 objectForKeyedSubscript:v12];

    id v13 = [(ICLayoutManager *)self highlightPatternRegexFinder];
    objc_opt_class();
    double v14 = ICDynamicCast();
    [v14 setHighlightPatternRegexFinder:v13];
  }

  return v9;
}

- (id)viewControllerForTextAttachment:(id)a3
{
  return [(ICLayoutManager *)self viewControllerForTextAttachment:a3 createIfNeeded:1];
}

- (id)viewControllerForTextAttachmentNoCreate:(id)a3
{
  return [(ICLayoutManager *)self viewControllerForTextAttachment:a3 createIfNeeded:0];
}

- (void)clearViewsForAllTextAttachmentsThatSupportThumbnailMode
{
  uint64_t v3 = [(ICLayoutManager *)self textStorage];
  uint64_t v4 = [v3 length];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__ICLayoutManager_clearViewsForAllTextAttachmentsThatSupportThumbnailMode__block_invoke;
  v5[3] = &unk_2640B90A0;
  v5[4] = self;
  -[ICLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", 0, v4, v5);
}

void __74__ICLayoutManager_clearViewsForAllTextAttachmentsThatSupportThumbnailMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 supportsMultiplePresentationSizes]) {
    [*(id *)(a1 + 32) clearViewForTextAttachment:v4];
  }
}

- (void)clearViewForTextAttachment:(id)a3
{
  id v7 = a3;
  id v4 = -[ICLayoutManager viewForTextAttachmentNoCreate:](self, "viewForTextAttachmentNoCreate:");
  if (v4)
  {
    uint64_t v5 = [v7 viewIdentifier];
    [(ICLayoutManager *)self clearSupplementalViewForIdentifier:v5];

    id v6 = [v7 viewIdentifier];
    [(ICLayoutManager *)self removeClearingControllerForView:v4 viewIdentifier:v6];
  }
}

- (void)invalidateLayoutAfterAttachmentViewTypeChangeIfNecessary
{
  if (![(ICLayoutManager *)self isUpdatingForAttachmentViewTypeChange])
  {
    [(ICLayoutManager *)self clearViewsForAllTextAttachmentsThatSupportThumbnailMode];
    [(ICLayoutManager *)self invalidateLayoutAfterAttachmentViewTypeChange];
  }
}

- (void)invalidateLayoutAfterAttachmentViewTypeChange
{
  uint64_t v3 = [(ICLayoutManager *)self textStorage];
  uint64_t v4 = [v3 length];

  uint64_t v5 = [(ICLayoutManager *)self textStorage];
  uint64_t v6 = *MEMORY[0x263F814A0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__ICLayoutManager_invalidateLayoutAfterAttachmentViewTypeChange__block_invoke;
  v9[3] = &unk_2640B89D0;
  void v9[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v9);

  id v7 = [(ICBaseLayoutManager *)self textView];
  id v8 = [v7 textContainer];
  [(ICLayoutManager *)self ensureLayoutForTextContainer:v8];
}

void __64__ICLayoutManager_invalidateLayoutAfterAttachmentViewTypeChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 supportsMultiplePresentationSizes])
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 32), "invalidateDisplayForCharacterRange:", a3, a4);
  }
}

- (void)fillBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6
{
  unint64_t v6 = a4;
  objc_msgSend(a6, "set", a3, a4, a5.location, a5.length);
  if (v6)
  {
    p_size = &a3->size;
    do
    {
      double width = p_size[-1].width;
      double height = p_size[-1].height;
      double v11 = p_size->width;
      double v12 = p_size->height;
      p_size += 2;
      id v13 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", width, height, v11, v12, 3.0);
      [v13 fill];

      --v6;
    }
    while (v6);
  }
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  unint64_t v6 = objc_msgSend(MEMORY[0x263F5B288], "defaultLinkTextAttributes", a3);
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [MEMORY[0x263F394E8] sharedController];
  uint64_t v9 = [(ICLayoutManager *)self textStorage];
  id v10 = [v8 preferredTextAttributesForLinkAtCharacterIndex:a4 ofStorage:v9];

  uint64_t v11 = [v10 mutableCopy];
  double v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v7;
  }
  id v14 = v13;

  uint64_t v15 = [(ICLayoutManager *)self textStorage];
  uint64_t v16 = [v15 attribute:*MEMORY[0x263F5AD78] atIndex:a4 effectiveRange:0];
  [v16 floatValue];
  double v18 = v17;

  objc_opt_class();
  uint64_t v19 = *MEMORY[0x263F81500];
  id v20 = [v14 objectForKeyedSubscript:*MEMORY[0x263F81500]];
  uint64_t v21 = ICDynamicCast();

  double v22 = fabs(v18);
  if (v22 >= 0.00999999978)
  {
    id v23 = [MEMORY[0x263F825C8] preferredDefaultFontColor];
    id v24 = objc_msgSend(v21, "ic_colorBlendedWithColor:fraction:", v23, v22);

    double v25 = v18 * 0.6 + 1.0;
    if (v25 < 0.0) {
      double v25 = 0.0;
    }
    uint64_t v21 = objc_msgSend(v24, "colorWithAlphaComponent:", fmin(v25, 1.0));
  }
  objc_msgSend(v14, "ic_setNonNilObject:forKey:", v21, v19);
  if (v18 <= -0.1) {
    uint64_t v26 = &unk_26C138E80;
  }
  else {
    uint64_t v26 = &unk_26C138E68;
  }
  objc_msgSend(v14, "ic_setNonNilObject:forKey:", v26, *MEMORY[0x263F815F8]);
  double v27 = (void *)[v14 copy];

  return v27;
}

- (id)icaxTodoButtonForParagraphStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICLayoutManager *)self trackedToDoParagraphs];
  unint64_t v6 = [v4 todoTrackingUUID];

  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [(ICLayoutManager *)self todoButtonsByTrackingUUID];
    uint64_t v9 = [v7 paragraph];
    id v10 = [v9 todoTrackingUUID];
    uint64_t v11 = [v8 objectForKeyedSubscript:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (void)setIsZooming:(BOOL)a3
{
  self->_isZooming = a3;
}

- (BOOL)isUpdatingForAttachmentViewTypeChange
{
  return self->_isUpdatingForAttachmentViewTypeChange;
}

- (void)setIsUpdatingForAttachmentViewTypeChange:(BOOL)a3
{
  self->_isUpdatingForAttachmentViewTypeChange = a3;
}

- (BOOL)lineHeightIncludeParagraphSpacing
{
  return self->_lineHeightIncludeParagraphSpacing;
}

- (void)setLineHeightIncludeParagraphSpacing:(BOOL)a3
{
  self->_lineHeightIncludeParagraphSpacing = a3;
}

- (BOOL)shouldManuallyRenderSeparateSubviews
{
  return self->_shouldManuallyRenderSeparateSubviews;
}

- (void)setShouldManuallyRenderSeparateSubviews:(BOOL)a3
{
  self->_shouldManuallyRenderSeparateSubviews = a3;
}

- (BOOL)shouldAdjustTodoButtonFramesForPrinting
{
  return self->_shouldAdjustTodoButtonFramesForPrinting;
}

- (void)setShouldAdjustTodoButtonFramesForPrinting:(BOOL)a3
{
  self->_shouldAdjustTodoButtonFramesForPrinting = a3;
}

- (BOOL)isRenderingPreviewForDragAndDrop
{
  return self->_isRenderingPreviewForDragAndDrop;
}

- (void)setIsRenderingPreviewForDragAndDrop:(BOOL)a3
{
  self->_isRenderingPreviewForDragAndDrop = a3;
}

- (BOOL)shouldIgnoreCachedOriginUpdates
{
  return self->_shouldIgnoreCachedOriginUpdates;
}

- (void)setShouldIgnoreCachedOriginUpdates:(BOOL)a3
{
  self->_shouldIgnoreCachedOriginUpdates = a3;
}

- (BOOL)isRenderingImageForPrint
{
  return self->_isRenderingImageForPrint;
}

- (void)setIsRenderingImageForPrint:(BOOL)a3
{
  self->_isRenderingImageForPrint = a3;
}

- (BOOL)isSettingLinkTextAttributes
{
  return self->_isSettingLinkTextAttributes;
}

- (void)setIsSettingLinkTextAttributes:(BOOL)a3
{
  self->_isSettingLinkTextAttributes = a3;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
}

- (void)setTrackedToDoParagraphs:(id)a3
{
}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentViewDelegate);

  return (ICAttachmentViewDelegate *)WeakRetained;
}

- (void)setAttachmentViewDelegate:(id)a3
{
}

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  self->_isDraggingChecklistItem = a3;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (BOOL)needsClearRemovedAttachments
{
  return self->_needsClearRemovedAttachments;
}

- (NSMutableDictionary)todoButtonsByTrackingUUID
{
  return self->_todoButtonsByTrackingUUID;
}

- (void)setTodoButtonsByTrackingUUID:(id)a3
{
}

- (CGPoint)cachedOrigin
{
  double x = self->_cachedOrigin.x;
  double y = self->_cachedOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSMutableDictionary)activeSupplementalViews
{
  return self->_activeSupplementalViews;
}

- (void)setActiveSupplementalViews:(id)a3
{
}

- (NSMutableDictionary)hiddenSupplementalViews
{
  return self->_hiddenSupplementalViews;
}

- (void)setHiddenSupplementalViews:(id)a3
{
}

- (NSMutableDictionary)supplementalViewControllers
{
  return self->_supplementalViewControllers;
}

- (void)setSupplementalViewControllers:(id)a3
{
}

- (ICTextAttachmentLocationCache)inlineAttachmentLocationCache
{
  return self->_inlineAttachmentLocationCache;
}

- (void)setInlineAttachmentLocationCache:(id)a3
{
}

- (NSMutableDictionary)supplementalViewProviders
{
  return self->_supplementalViewProviders;
}

- (void)setSupplementalViewProviders:(id)a3
{
}

- (CGSize)cachedTextContainerSize
{
  double width = self->_cachedTextContainerSize.width;
  double height = self->_cachedTextContainerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedTextContainerSize:(CGSize)a3
{
  self->_cachedTextContainerSize = a3;
}

- (ICSelectorDelayer)updateHiddenViewsSelectorDelayer
{
  return self->_updateHiddenViewsSelectorDelayer;
}

- (void)setUpdateHiddenViewsSelectorDelayer:(id)a3
{
}

- (NSMutableDictionary)delayedScrollOutViewDictionary
{
  return self->_delayedScrollOutViewDictionary;
}

- (void)setDelayedScrollOutViewDictionary:(id)a3
{
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (CGRect)layoutEnsuredBounds
{
  double x = self->_layoutEnsuredBounds.origin.x;
  double y = self->_layoutEnsuredBounds.origin.y;
  double width = self->_layoutEnsuredBounds.size.width;
  double height = self->_layoutEnsuredBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLayoutEnsuredBounds:(CGRect)a3
{
  self->_layoutEnsuredBounds = a3;
}

- (void)setEventReporter:(id)a3
{
}

- (NSSet)hiddenTodosForManualLayout
{
  return self->_hiddenTodosForManualLayout;
}

- (void)setHiddenTodosForManualLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenTodosForManualLayout, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_delayedScrollOutViewDictionary, 0);
  objc_storeStrong((id *)&self->_updateHiddenViewsSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_supplementalViewProviders, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentLocationCache, 0);
  objc_storeStrong((id *)&self->_supplementalViewControllers, 0);
  objc_storeStrong((id *)&self->_hiddenSupplementalViews, 0);
  objc_storeStrong((id *)&self->_activeSupplementalViews, 0);
  objc_storeStrong((id *)&self->_todoButtonsByTrackingUUID, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_destroyWeak((id *)&self->_attachmentViewDelegate);
  objc_storeStrong((id *)&self->_trackedToDoParagraphs, 0);

  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
}

- (void)textContainerForGlyphAtIndex:(os_log_t)log effectiveRange:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "-[ICLayoutManager textContainerForGlyphAtIndex:effectiveRange:] Error: index out of bounds", v1, 2u);
}

- (void)removeClearingControllerForView:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 className];
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "View identifier was nil when clearing view of type: %@", v4, v5, v6, v7, 2u);
}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Unable to find attachment in attachmentInlineDrawingMergeableDataDidChange: %@", (uint8_t *)&v2, 0xCu);
}

@end