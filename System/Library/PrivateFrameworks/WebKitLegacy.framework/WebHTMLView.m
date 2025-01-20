@interface WebHTMLView
+ (id)supportedImageMIMETypes;
+ (id)supportedMIMETypes;
+ (id)supportedMediaMIMETypes;
+ (id)supportedNonImageMIMETypes;
+ (id)unsupportedTextMIMETypes;
- (BOOL)_beginPrintModeWithMinimumPageWidth:(double)a3 height:(double)a4 maximumPageWidth:(double)a5;
- (BOOL)_beginPrintModeWithPageWidth:(float)a3 height:(float)a4 shrinkToFit:(BOOL)a5;
- (BOOL)_beginScreenPaginationModeWithPageSize:(CGSize)a3 shrinkToFit:(BOOL)a4;
- (BOOL)_canAlterCurrentSelection;
- (BOOL)_canDecreaseSelectionListLevel;
- (BOOL)_canEdit;
- (BOOL)_canEditRichly;
- (BOOL)_canIncreaseSelectionListLevel;
- (BOOL)_canSmartCopyOrDelete;
- (BOOL)_findString:(id)a3 options:(unint64_t)a4;
- (BOOL)_handleEditingKeyEvent:(void *)a3;
- (BOOL)_hasInsertionPoint;
- (BOOL)_hasSelection;
- (BOOL)_hasSelectionOrInsertionPoint;
- (BOOL)_isEditable;
- (BOOL)_isInPrintMode;
- (BOOL)_isInScreenPaginationMode;
- (BOOL)_isSelectionEvent:(id)a3;
- (BOOL)_isTopHTMLView;
- (BOOL)_isUsingAcceleratedCompositing;
- (BOOL)_needsLayout;
- (BOOL)_shouldInsertFragment:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5;
- (BOOL)_shouldInsertText:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5;
- (BOOL)_shouldReplaceSelectionWithText:(id)a3 givenAction:(int64_t)a4;
- (BOOL)_wantsKeyDownForEvent:(id)a3;
- (BOOL)acceptsFirstResponder;
- (BOOL)becomeFirstResponder;
- (BOOL)callDelegateDoCommandBySelectorIfNeeded:(SEL)a3;
- (BOOL)hasMarkedText;
- (BOOL)isOpaque;
- (BOOL)maintainsInactiveSelection;
- (BOOL)markedTextMatchesAreHighlighted;
- (BOOL)providesWritingToolsContextMenu;
- (BOOL)resignFirstResponder;
- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6;
- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7;
- (BOOL)supportsTextEncoding;
- (CGImage)selectionImageForcingBlackText:(BOOL)a3;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3;
- (CGRect)selectionImageRect;
- (CGRect)selectionRect;
- (Command)coreCommandByName:(SEL)a3;
- (Command)coreCommandBySelector:(SEL)a3;
- (WebHTMLView)initWithFrame:(CGRect)a3;
- (_NSRange)markedRange;
- (_NSRange)selectedRange;
- (double)_adjustedBottomOfPageWithTop:(double)a3 bottom:(double)a4 limit:(double)a5;
- (id)_accessibilityParentForSubview:(id)a3;
- (id)_compositingLayersHostingView;
- (id)_dataSource;
- (id)_documentRange;
- (id)_emptyStyle;
- (id)_frame;
- (id)_frameView;
- (id)_increaseSelectionListLevel;
- (id)_increaseSelectionListLevelOrdered;
- (id)_increaseSelectionListLevelUnordered;
- (id)_insertOrderedList;
- (id)_insertUnorderedList;
- (id)_pluginController;
- (id)_selectedRange;
- (id)_topHTMLView;
- (id)_webView;
- (id)accessibilityFocusedUIElement;
- (id)accessibilityHitTest:(CGPoint)a3;
- (id)accessibilityRootElement;
- (id)elementAtPoint:(CGPoint)a3;
- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4;
- (id)hitTest:(CGPoint)a3;
- (id)rectsForTextMatches;
- (id)selectedString;
- (id)selectionTextRects;
- (id)string;
- (int64_t)writingToolsBehavior;
- (unint64_t)characterIndexForPoint:(CGPoint)a3;
- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7;
- (unsigned)_scrollbarWidthStyle;
- (void)_applyEditingStyleToSelection:(void *)a3 withUndoAction:(unsigned __int8)a4;
- (void)_applyStyleToSelection:(id)a3 withUndoAction:(unsigned __int8)a4;
- (void)_changeWordCaseWithSelector:(SEL)a3;
- (void)_decreaseSelectionListLevel;
- (void)_destroyAllWebPlugins;
- (void)_endPrintMode;
- (void)_endScreenPaginationMode;
- (void)_executeSavedKeypressCommands;
- (void)_frameOrBoundsChanged;
- (void)_layoutIfNeeded;
- (void)_setMouseDownEvent:(id)a3;
- (void)_setPrinting:(BOOL)a3 minimumPageLogicalWidth:(float)a4 logicalHeight:(float)a5 originalPageWidth:(float)a6 originalPageHeight:(float)a7 maximumShrinkRatio:(float)a8 adjustViewSize:(BOOL)a9 paginateScreenContent:(BOOL)a10;
- (void)_web_updateLayoutAndStyleIfNeededRecursive;
- (void)addSubview:(id)a3;
- (void)alignCenter:(id)a3;
- (void)alignJustified:(id)a3;
- (void)alignLeft:(id)a3;
- (void)alignRight:(id)a3;
- (void)capitalizeWord:(id)a3;
- (void)centerSelectionInVisibleArea:(id)a3;
- (void)clearFocus;
- (void)clearText:(id)a3;
- (void)close;
- (void)closeIfNotCurrentView;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deleteBackward:(id)a3;
- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3;
- (void)deleteForward:(id)a3;
- (void)deleteToBeginningOfLine:(id)a3;
- (void)deleteToBeginningOfParagraph:(id)a3;
- (void)deleteToEndOfLine:(id)a3;
- (void)deleteToEndOfParagraph:(id)a3;
- (void)deleteToMark:(id)a3;
- (void)deleteWordBackward:(id)a3;
- (void)deleteWordForward:(id)a3;
- (void)deselectAll;
- (void)doCommandBySelector:(SEL)a3;
- (void)drawRect:(CGRect)a3;
- (void)drawSingleRect:(CGRect)a3;
- (void)executeCoreCommandByName:(const char *)a3;
- (void)executeCoreCommandBySelector:(SEL)a3;
- (void)ignoreSpelling:(id)a3;
- (void)indent:(id)a3;
- (void)insertBacktab:(id)a3;
- (void)insertLineBreak:(id)a3;
- (void)insertNewline:(id)a3;
- (void)insertNewlineIgnoringFieldEditor:(id)a3;
- (void)insertParagraphSeparator:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertTabIgnoringFieldEditor:(id)a3;
- (void)insertText:(id)a3;
- (void)jumpToSelection:(id)a3;
- (void)keyDown:(id)a3;
- (void)keyUp:(id)a3;
- (void)layout;
- (void)layoutToMinimumPageWidth:(float)a3 height:(float)a4 originalPageWidth:(float)a5 originalPageHeight:(float)a6 maximumShrinkRatio:(float)a7 adjustingViewSize:(BOOL)a8;
- (void)lowercaseWord:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)markedTextUpdate:(id)a3;
- (void)mouseDown:(id)a3;
- (void)mouseMoved:(id)a3;
- (void)mouseUp:(id)a3;
- (void)moveBackward:(id)a3;
- (void)moveBackwardAndModifySelection:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveDownAndModifySelection:(id)a3;
- (void)moveForward:(id)a3;
- (void)moveForwardAndModifySelection:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftAndModifySelection:(id)a3;
- (void)moveParagraphBackwardAndModifySelection:(id)a3;
- (void)moveParagraphForwardAndModifySelection:(id)a3;
- (void)moveRight:(id)a3;
- (void)moveRightAndModifySelection:(id)a3;
- (void)moveToBeginningOfDocument:(id)a3;
- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3;
- (void)moveToBeginningOfLine:(id)a3;
- (void)moveToBeginningOfLineAndModifySelection:(id)a3;
- (void)moveToBeginningOfParagraph:(id)a3;
- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3;
- (void)moveToBeginningOfSentence:(id)a3;
- (void)moveToBeginningOfSentenceAndModifySelection:(id)a3;
- (void)moveToEndOfDocument:(id)a3;
- (void)moveToEndOfDocumentAndModifySelection:(id)a3;
- (void)moveToEndOfLine:(id)a3;
- (void)moveToEndOfLineAndModifySelection:(id)a3;
- (void)moveToEndOfParagraph:(id)a3;
- (void)moveToEndOfParagraphAndModifySelection:(id)a3;
- (void)moveToEndOfSentence:(id)a3;
- (void)moveToEndOfSentenceAndModifySelection:(id)a3;
- (void)moveToLeftEndOfLine:(id)a3;
- (void)moveToLeftEndOfLineAndModifySelection:(id)a3;
- (void)moveToRightEndOfLine:(id)a3;
- (void)moveToRightEndOfLineAndModifySelection:(id)a3;
- (void)moveUp:(id)a3;
- (void)moveUpAndModifySelection:(id)a3;
- (void)moveWordBackward:(id)a3;
- (void)moveWordBackwardAndModifySelection:(id)a3;
- (void)moveWordForward:(id)a3;
- (void)moveWordForwardAndModifySelection:(id)a3;
- (void)moveWordLeft:(id)a3;
- (void)moveWordLeftAndModifySelection:(id)a3;
- (void)moveWordRight:(id)a3;
- (void)moveWordRightAndModifySelection:(id)a3;
- (void)outdent:(id)a3;
- (void)overWrite:(id)a3;
- (void)pageDown:(id)a3;
- (void)pageDownAndModifySelection:(id)a3;
- (void)pageUp:(id)a3;
- (void)pageUpAndModifySelection:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAsPlainText:(id)a3;
- (void)reapplyStyles;
- (void)scrollWheel:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)selectLine:(id)a3;
- (void)selectParagraph:(id)a3;
- (void)selectSentence:(id)a3;
- (void)selectToMark:(id)a3;
- (void)selectWord:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMark:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextMatchesAreHighlighted:(BOOL)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsLayout:(BOOL)a3;
- (void)setNeedsToApplyStyles:(BOOL)a3;
- (void)setScale:(float)a3;
- (void)subscript:(id)a3;
- (void)superscript:(id)a3;
- (void)swapWithMark:(id)a3;
- (void)toggleBold:(id)a3;
- (void)toggleItalic:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)touch:(id)a3;
- (void)transpose:(id)a3;
- (void)underline:(id)a3;
- (void)unmarkAllTextMatches;
- (void)unmarkText;
- (void)unscript:(id)a3;
- (void)uppercaseWord:(id)a3;
- (void)viewDidMoveToWindow;
- (void)viewWillDraw;
- (void)viewWillMoveToWindow:(id)a3;
- (void)willRemoveSubview:(id)a3;
- (void)yank:(id)a3;
- (void)yankAndSelect:(id)a3;
@end

@implementation WebHTMLView

- (id)_documentRange
{
  v2 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "DOMDocument");
  return (id)[v2 _documentRange];
}

- (id)_dataSource
{
  return self->_private->dataSource.m_ptr;
}

- (id)_webView
{
  return (id)[self->_private->dataSource.m_ptr _webView];
}

- (id)_frameView
{
  v2 = (void *)[self->_private->dataSource.m_ptr webFrame];
  return (id)[v2 frameView];
}

- (BOOL)_shouldInsertFragment:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5
{
  id v8 = [(WebHTMLView *)self _webView];
  v9 = (void *)[a3 firstChild];
  if (void *)[a3 lastChild] == v9 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v10 = (void *)[v8 _editingDelegateForwarder];
    uint64_t v11 = [v9 data];
    return [v10 webView:v8 shouldInsertText:v11 replacingDOMRange:a4 givenAction:a5];
  }
  else
  {
    v13 = (void *)[v8 _editingDelegateForwarder];
    return [v13 webView:v8 shouldInsertNode:a3 replacingDOMRange:a4 givenAction:a5];
  }
}

- (BOOL)_shouldInsertText:(id)a3 replacingDOMRange:(id)a4 givenAction:(int64_t)a5
{
  id v8 = [(WebHTMLView *)self _webView];
  v9 = (void *)[v8 _editingDelegateForwarder];
  return [v9 webView:v8 shouldInsertText:a3 replacingDOMRange:a4 givenAction:a5];
}

- (BOOL)_shouldReplaceSelectionWithText:(id)a3 givenAction:(int64_t)a4
{
  id v7 = [(WebHTMLView *)self _selectedRange];
  return [(WebHTMLView *)self _shouldInsertText:a3 replacingDOMRange:v7 givenAction:a4];
}

- (id)_selectedRange
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)&v8, (WebCore::VisibleSelection *)(*(void *)(*(void *)(v3 + 296) + 3096) + 56));
  v4 = kit();
  if (!v10) {
    return v4;
  }
  v5 = v9;
  v9 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  id v7 = v8;
  id v8 = 0;
  if (!v7) {
    return v4;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (void)_setMouseDownEvent:(id)a3
{
  v4 = self->_private;
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = v4->mouseDownEvent.m_ptr;
  v4->mouseDownEvent.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)_topHTMLView
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_private->dataSource.m_ptr, "_webView"), "mainFrame"), "frameView");
  return (id)[v2 documentView];
}

- (BOOL)_isTopHTMLView
{
  return [(WebHTMLView *)self _topHTMLView] == self;
}

+ (id)supportedMIMETypes
{
  return +[WebHTMLRepresentation supportedMIMETypes];
}

+ (id)supportedMediaMIMETypes
{
  return +[WebHTMLRepresentation supportedMediaMIMETypes];
}

+ (id)supportedImageMIMETypes
{
  return +[WebHTMLRepresentation supportedImageMIMETypes];
}

+ (id)supportedNonImageMIMETypes
{
  return +[WebHTMLRepresentation supportedNonImageMIMETypes];
}

+ (id)unsupportedTextMIMETypes
{
  return +[WebHTMLRepresentation unsupportedTextMIMETypes];
}

- (void)mouseMoved:(id)a3
{
  v4 = [(WebHTMLView *)self _frame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 624);
      MEMORY[0x1F416CD48](v6, a3);
    }
  }
}

- (void)_frameOrBoundsChanged
{
  id v3 = [(WebHTMLView *)self _webView];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "mainFrame"), "frameView"), "_scrollView");
  objc_msgSend((id)-[WebHTMLView superview](self, "superview"), "bounds");
  v13.x = v5;
  v13.y = v6;
  v12.x = v5;
  v12.y = v6;
  if (!NSEqualPoints(self->_private->lastScrollPosition, v13) && ([v4 inProgrammaticScroll] & 1) == 0)
  {
    id v7 = [(WebHTMLView *)self _frame];
    if (v7)
    {
      uint64_t v8 = *(void *)(v7[1] + 8);
      if (v8)
      {
        v9 = *(WebCore::ScrollView **)(v8 + 288);
        if (v9)
        {
          self->_private->inScrollPositionChanged = 1;
          WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v11, &self->_private->lastScrollPosition);
          WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v10, &v12);
          WebCore::ScrollView::scrollOffsetChangedViaPlatformWidget(v9, &v11, &v10);
          self->_private->inScrollPositionChanged = 0;
        }
      }
    }
    objc_msgSend(v3, "_didScrollDocumentInFrameView:", -[WebHTMLView _frameView](self, "_frameView"));
  }
  self->_private->lastScrollPosition = v12;
}

- (void)viewWillDraw
{
  if (self->_private->dataSource.m_ptr && [(WebHTMLView *)self _isTopHTMLView])
  {
    [(WebHTMLView *)self _web_updateLayoutAndStyleIfNeededRecursive];
    objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_flushCompositingChanges");
  }
  v3.receiver = self;
  v3.super_class = (Class)WebHTMLView;
  [(WebHTMLView *)&v3 viewWillDraw];
}

- (id)hitTest:(CGPoint)a3
{
  if (self->_private->closed) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  id v7 = (void *)[(WebHTMLView *)self superview];
  [(WebHTMLView *)self frame];
  if (objc_msgSend(v7, "mouse:inRect:", x, y, v8, v9, v10, v11)) {
    return self;
  }
  else {
    return 0;
  }
}

- (void)setScale:(float)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WebHTMLView;
  -[WebHTMLView setScale:](&v10, sel_setScale_);
  CGFloat v5 = [(WebHTMLView *)self _frame];
  if (v5)
  {
    uint64_t v6 = *(void *)(v5[1] + 8);
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 24);
      if (v7)
      {
        double v8 = *(WebCore::Page **)(v7 + 8);
        if (v8)
        {
          IntPoint v9 = 0;
          WebCore::Page::setPageScaleFactor(v8, a3, &v9);
        }
      }
      objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_documentScaleChanged");
    }
  }
}

- (BOOL)_canEdit
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return WebCore::Editor::canEdit(v4);
}

- (BOOL)_canEditRichly
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return MEMORY[0x1F4175F20](v4);
}

- (BOOL)_canAlterCurrentSelection
{
  BOOL v3 = [(WebHTMLView *)self _hasSelectionOrInsertionPoint];
  if (v3)
  {
    LOBYTE(v3) = [(WebHTMLView *)self _isEditable];
  }
  return v3;
}

- (BOOL)_hasSelection
{
  v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3) {
      LOBYTE(v2) = *(unsigned char *)(*(void *)(*(void *)(v3 + 296) + 3096) + 153) == 2;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (BOOL)_hasSelectionOrInsertionPoint
{
  v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3) {
      LOBYTE(v2) = *(unsigned char *)(*(void *)(*(void *)(v3 + 296) + 3096) + 153) != 0;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (BOOL)_hasInsertionPoint
{
  v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3) {
      LOBYTE(v2) = *(unsigned char *)(*(void *)(*(void *)(v3 + 296) + 3096) + 153) == 1;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (BOOL)_isEditable
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::VisibleSelection *)(*(void *)(*(void *)(v3 + 296) + 3096) + 56);
  return WebCore::VisibleSelection::isContentEditable(v4);
}

- (id)_insertOrderedList
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::insertOrderedList((uint64_t *)&v8, v4);
  CGFloat v5 = kit(v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v6);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  return v5;
}

- (id)_insertUnorderedList
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::insertUnorderedList((uint64_t *)&v8, v4);
  CGFloat v5 = kit(v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v6);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  return v5;
}

- (BOOL)_canIncreaseSelectionListLevel
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return MEMORY[0x1F4172C78](v4);
}

- (BOOL)_canDecreaseSelectionListLevel
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  return MEMORY[0x1F4172C70](v4);
}

- (id)_increaseSelectionListLevel
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevel((uint64_t *)&v8, v4);
  CGFloat v5 = kit(v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v6);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  return v5;
}

- (id)_increaseSelectionListLevelOrdered
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevelOrdered((uint64_t *)&v8, v4);
  CGFloat v5 = kit(v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v6);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  return v5;
}

- (id)_increaseSelectionListLevelUnordered
{
  v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::increaseSelectionListLevelUnordered((uint64_t *)&v8, v4);
  CGFloat v5 = kit(v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v6);
        return v5;
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  return v5;
}

- (void)_decreaseSelectionListLevel
{
  v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      uint64_t v4 = WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
      MEMORY[0x1F4172C50](v4);
    }
  }
}

- (void)close
{
  v2 = self->_private;
  if (v2 && !v2->closed)
  {
    v2->closed = 1;
    [self->_private->pluginController.m_ptr destroyAllPlugins];
    [self->_private->pluginController.m_ptr setDataSource:0];
    uint64_t v4 = self->_private;
    [(WebHTMLViewPrivate *)v4 clear];
  }
}

- (BOOL)_isUsingAcceleratedCompositing
{
  return self->_private->layerHostingView != 0;
}

- (id)_compositingLayersHostingView
{
  return self->_private->layerHostingView;
}

- (BOOL)_isInPrintMode
{
  return self->_private->printing;
}

- (BOOL)_beginPrintModeWithMinimumPageWidth:(double)a3 height:(double)a4 maximumPageWidth:(double)a5
{
  IntPoint v9 = [(WebHTMLView *)self _frame];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = *(void *)(v9[1] + 8);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *(void *)(v10 + 296);
  if (v11 && ((*(uint64_t (**)(uint64_t))(*(void *)v11 + 392))(v11) & 1) != 0)
  {
    float v12 = 0.0;
    a4 = 0.0;
    a3 = 0.0;
  }
  else
  {
    float v12 = 0.0;
    if (a3 > 0.0) {
      float v12 = a5 / a3;
    }
  }
  float v14 = a3;
  float v15 = a4;
  BOOL v16 = [(WebHTMLView *)self _isInScreenPaginationMode];
  *(float *)&double v17 = v14;
  *(float *)&double v18 = v15;
  *(float *)&double v19 = v14;
  *(float *)&double v20 = v15;
  *(float *)&double v21 = v12;
  [(WebHTMLView *)self _setPrinting:1 minimumPageLogicalWidth:1 logicalHeight:v16 originalPageWidth:v17 originalPageHeight:v18 maximumShrinkRatio:v19 adjustViewSize:v20 paginateScreenContent:v21];
  return 1;
}

- (BOOL)_beginPrintModeWithPageWidth:(float)a3 height:(float)a4 shrinkToFit:(BOOL)a5
{
  IntPoint v9 = [(WebHTMLView *)self _frame];
  if (v9)
  {
    uint64_t v10 = *(WebCore::LocalFrame **)(v9[1] + 8);
    if (v10)
    {
      uint64_t v11 = (void *)*((void *)v10 + 37);
      if (v11)
      {
        uint64_t v12 = v11[248];
        if (v12)
        {
          unsigned int v13 = (*(_DWORD *)(v12 + 120) & 6) - 2;
          if (v13 >= 4) {
            float v14 = a3;
          }
          else {
            float v14 = a4;
          }
          if (v13 < 4) {
            a4 = a3;
          }
          a3 = v14;
        }
        float v15 = 1.0;
        if (!a5)
        {
          float v16 = a4;
          float v17 = a3;
          goto LABEL_18;
        }
        float v16 = a4;
        float v17 = a3;
        if ((*(uint64_t (**)(void *))(*v11 + 392))(v11)) {
          goto LABEL_18;
        }
      }
      else
      {
        float v15 = 1.0;
        float v16 = a4;
        float v17 = a3;
        if (!a5)
        {
LABEL_18:
          BOOL v20 = [(WebHTMLView *)self _isInScreenPaginationMode];
          LOBYTE(v10) = 1;
          *(float *)&double v21 = v17;
          *(float *)&double v22 = v16;
          *(float *)&double v23 = a3;
          *(float *)&double v24 = a4;
          *(float *)&double v25 = v15;
          [(WebHTMLView *)self _setPrinting:1 minimumPageLogicalWidth:1 logicalHeight:v20 originalPageWidth:v21 originalPageHeight:v22 maximumShrinkRatio:v23 adjustViewSize:v24 paginateScreenContent:v25];
          return (char)v10;
        }
      }
      v28.var0 = a3;
      v28.var1 = a4;
      v27.var0 = a3 * 1.25;
      v27.var1 = a4 * 1.25;
      WebCore::LocalFrame::resizePageRectsKeepingRatio(v10, &v28, &v27);
      float v17 = v18;
      float v16 = v19;
      float v15 = 1.6;
      goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (void)_endPrintMode
{
  BOOL v3 = [(WebHTMLView *)self _isInScreenPaginationMode];
  [(WebHTMLView *)self _setPrinting:0 minimumPageLogicalWidth:1 logicalHeight:v3 originalPageWidth:0.0 originalPageHeight:0.0 maximumShrinkRatio:0.0 adjustViewSize:0.0 paginateScreenContent:0.0];
}

- (BOOL)_isInScreenPaginationMode
{
  return self->_private->paginateScreenContent;
}

- (BOOL)_beginScreenPaginationModeWithPageSize:(CGSize)a3 shrinkToFit:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v8 = [(WebHTMLView *)self _frame];
  if (v8)
  {
    IntPoint v9 = *(WebCore::LocalFrame **)(v8[1] + 8);
    if (v9)
    {
      uint64_t v10 = (void *)*((void *)v9 + 37);
      if (v10)
      {
        uint64_t v11 = v10[248];
        if (v11 && (*(_DWORD *)(v11 + 120) & 6u) - 2 < 4)
        {
          float v12 = height;
          float v13 = width;
          float v14 = 1.0;
          float v15 = v13;
          float v16 = v12;
          if (!v4) {
            goto LABEL_14;
          }
          goto LABEL_10;
        }
        float v12 = width;
        float v13 = height;
        float v14 = 1.0;
        float v15 = v13;
        float v16 = v12;
        if (v4)
        {
LABEL_10:
          float v15 = v13;
          float v16 = v12;
          if ((*(uint64_t (**)(void *))(*v10 + 392))(v10)) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
      else
      {
        float v12 = width;
        float v13 = height;
        float v14 = 1.0;
        float v15 = v13;
        float v16 = v12;
        if (v4)
        {
LABEL_13:
          v28.var0 = v12;
          v28.var1 = v13;
          v27.var0 = v12 * 1.25;
          v27.var1 = v13 * 1.25;
          WebCore::LocalFrame::resizePageRectsKeepingRatio(v9, &v28, &v27);
          float v16 = v17;
          float v15 = v18;
          float v14 = 1.6;
        }
      }
LABEL_14:
      BOOL v19 = [(WebHTMLView *)self _isInPrintMode];
      BOOL v20 = [(WebHTMLView *)self _isInScreenPaginationMode];
      LOBYTE(v9) = 1;
      *(float *)&double v21 = v16;
      *(float *)&double v22 = v15;
      *(float *)&double v23 = v12;
      *(float *)&double v24 = v13;
      *(float *)&double v25 = v14;
      [(WebHTMLView *)self _setPrinting:v19 minimumPageLogicalWidth:1 logicalHeight:v20 originalPageWidth:v21 originalPageHeight:v22 maximumShrinkRatio:v23 adjustViewSize:v24 paginateScreenContent:v25];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (void)_endScreenPaginationMode
{
  BOOL v3 = [(WebHTMLView *)self _isInPrintMode];
  [(WebHTMLView *)self _setPrinting:v3 minimumPageLogicalWidth:1 logicalHeight:0 originalPageWidth:0.0 originalPageHeight:0.0 maximumShrinkRatio:0.0 adjustViewSize:0.0 paginateScreenContent:0.0];
}

- (double)_adjustedBottomOfPageWithTop:(double)a3 bottom:(double)a4 limit:(double)a5
{
  double v8 = [(WebHTMLView *)self _frame];
  if (!v8) {
    return a4;
  }
  uint64_t v9 = *(void *)(v8[1] + 8);
  if (!v9) {
    return a4;
  }
  uint64_t v10 = *(WebCore::LocalFrameView **)(v9 + 288);
  if (!v10) {
    return a4;
  }
  float v24 = 0.0;
  float v11 = a3;
  float v12 = a4;
  float v13 = a5;
  WebCore::LocalFrameView::adjustPageHeightDeprecated(v10, &v24, v11, v12, v13);
  if (v24 == v12) {
    return a4;
  }
  float v15 = vabds_f32(v12, v24);
  float v16 = fabsf(v12);
  if (v16 < 1.0 && (float)(v16 * 3.4028e38) < v15) {
    return v24;
  }
  BOOL v18 = (float)(v16 * 1.1755e-38) <= v15 || v16 <= 1.0;
  float v19 = v15 / v16;
  if (v18 && v19 > 0.00000011921) {
    return v24;
  }
  float v21 = fabsf(v24);
  if (v21 < 1.0 && (float)(v21 * 3.4028e38) < v15) {
    return v24;
  }
  BOOL v23 = v21 <= 1.0 || (float)(v21 * 1.1755e-38) <= v15;
  if (v23 && (float)(v15 / v21) > 0.00000011921) {
    return v24;
  }
  else {
    return a4;
  }
}

- (id)accessibilityRootElement
{
  id v2 = [(WebHTMLView *)self _frame];
  return (id)[v2 accessibilityRoot];
}

- (WebHTMLView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WebHTMLView;
  BOOL v3 = -[WebHTMLView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    [(WebHTMLView *)v3 _setDrawsOwnDescendants:1];
    v4->_private = objc_alloc_init(WebHTMLViewPrivate);
    CGFloat v5 = [[WebPluginController alloc] initWithDocumentView:v4];
    uint64_t v6 = v4->_private;
    m_ptr = v6->pluginController.m_ptr;
    v6->pluginController.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_markedTextUpdate_, @"WebMarkedTextUpdated", 0);
    id v8 = [NSString alloc];
    CFStringRef v9 = (const __CFString *)[v8 initWithCString:*MEMORY[0x1E4F64CE0] encoding:4];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)hardwareKeyboardAvailabilityChangedCallback, v9, 0, (CFNotificationSuspensionBehavior)1026);
    if (v9) {
      CFRelease(v9);
    }
  }
  return v4;
}

- (void)dealloc
{
  BOOL v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"WebMarkedTextUpdated", 0);
    id v4 = [NSString alloc];
    CFStringRef v5 = (const __CFString *)[v4 initWithCString:*MEMORY[0x1E4F64CE0] encoding:4];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);
    [(WebHTMLView *)self close];

    self->_private = 0;
    v7.receiver = self;
    v7.super_class = (Class)WebHTMLView;
    [(WebHTMLView *)&v7 dealloc];
    if (v5) {
      CFRelease(v5);
    }
  }
}

- (BOOL)callDelegateDoCommandBySelectorIfNeeded:(SEL)a3
{
  id v4 = self->_private;
  selectorForDoCommandBySelector = v4->selectorForDoCommandBySelector;
  v4->selectorForDoCommandBySelector = 0;
  if (selectorForDoCommandBySelector == a3) {
    return 0;
  }
  id v6 = [(WebHTMLView *)self _webView];
  objc_super v7 = (void *)[v6 _editingDelegateForwarder];
  return [v7 webView:v6 doCommandBySelector:a3];
}

- (Command)coreCommandBySelector:(SEL)a3
{
  id v6 = [(WebHTMLView *)self _frame];
  if (v6)
  {
    uint64_t v7 = *(void *)(v6[1] + 8);
    if (v7)
    {
      id v8 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
      if (byte_1EB3A96A9 == 1)
      {
        uint64_t v9 = *(void *)qword_1EB3A96B8;
        if (!*(void *)qword_1EB3A96B8) {
          goto LABEL_14;
        }
      }
      else
      {
        qword_1EB3A96B8 = (uint64_t)createSelectorExceptionMap();
        byte_1EB3A96A9 = 1;
        uint64_t v9 = *(void *)qword_1EB3A96B8;
        if (!*(void *)qword_1EB3A96B8) {
          goto LABEL_14;
        }
      }
      unsigned int v10 = *(_DWORD *)(v9 - 8);
      unint64_t v11 = (unint64_t)&a4[~((void)a4 << 32)] ^ ((unint64_t)&a4[~((void)a4 << 32)] >> 22);
      unint64_t v12 = 9 * ((v11 + ~(v11 << 13)) ^ ((v11 + ~(v11 << 13)) >> 8));
      unint64_t v13 = (v12 ^ (v12 >> 15)) + ~((v12 ^ (v12 >> 15)) << 27);
      uint64_t v14 = v10 & ((v13 >> 31) ^ v13);
      float v15 = *(const char **)(v9 + 16 * v14);
      if (v15 == a4)
      {
LABEL_9:
        if (v14 != *(_DWORD *)(v9 - 4))
        {
          float v19 = *(WTF::StringImpl **)(v9 + 16 * v14 + 8);
          if (v19) {
            *(_DWORD *)v19 += 2;
          }
          double v22 = v19;
          goto LABEL_21;
        }
      }
      else
      {
        int v16 = 1;
        while (v15)
        {
          uint64_t v14 = (v14 + v16) & v10;
          float v15 = *(const char **)(v9 + 16 * v14);
          ++v16;
          if (v15 == a4) {
            goto LABEL_9;
          }
        }
      }
LABEL_14:
      Name = sel_getName(a4);
      size_t v18 = strlen(Name);
      if (v18 >= 2 && Name[v18 - 1] == 58) {
        WTF::String::String();
      }
      else {
        double v22 = 0;
      }
LABEL_21:
      WebCore::Editor::command(v8, (const WTF::String *)&v22);
      result = (Command *)v22;
      double v22 = 0;
      if (result)
      {
        if (LODWORD(result->var0) == 2) {
          return (Command *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v20);
        }
        else {
          LODWORD(result->var0) -= 2;
        }
      }
      return result;
    }
  }
  return (Command *)MEMORY[0x1F4172CD8](retstr);
}

- (Command)coreCommandByName:(SEL)a3
{
  id v6 = [(WebHTMLView *)self _frame];
  if (v6 && (uint64_t v7 = *(void *)(v6[1] + 8)) != 0)
  {
    id v8 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
    WTF::String::String((WTF::String *)&v11, a4);
    WebCore::Editor::command(v8, (const WTF::String *)&v11);
    result = (Command *)v11;
    unint64_t v11 = 0;
    if (result)
    {
      if (LODWORD(result->var0) == 2) {
        return (Command *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v9);
      }
      else {
        LODWORD(result->var0) -= 2;
      }
    }
  }
  else
  {
    return (Command *)MEMORY[0x1F4172CD8](retstr);
  }
  return result;
}

- (void)executeCoreCommandBySelector:(SEL)a3
{
  if (!-[WebHTMLView callDelegateDoCommandBySelectorIfNeeded:](self, "callDelegateDoCommandBySelectorIfNeeded:"))
  {
    if (self) {
      [(WebHTMLView *)self coreCommandBySelector:a3];
    }
    else {
      *(_OWORD *)uint64_t v7 = 0u;
    }
    WebCore::Editor::Command::execute();
    if (v7[1])
    {
      CFStringRef v5 = (unsigned int *)((char *)v7[1] + 8);
      if (atomic_fetch_add((atomic_uint *volatile)v7[1] + 2, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v5);
        id v6 = (void *)WTF::fastMalloc((WTF *)0x10);
        *id v6 = &unk_1F3C797F0;
        v6[1] = v5;
        id v8 = v6;
        WTF::ensureOnMainThread();
        if (v8) {
          (*(void (**)(void *))(*v8 + 8))(v8);
        }
      }
    }
    if (v7[0])
    {
      if (*((_DWORD *)v7[0] + 7) == 2)
      {
        if ((*((_WORD *)v7[0] + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7[0]);
        }
      }
      else
      {
        *((_DWORD *)v7[0] + 7) -= 2;
      }
    }
  }
}

- (void)executeCoreCommandByName:(const char *)a3
{
  if (self) {
    [(WebHTMLView *)self coreCommandByName:a3];
  }
  else {
    *(_OWORD *)CFStringRef v5 = 0u;
  }
  WebCore::Editor::Command::execute();
  if (v5[1])
  {
    BOOL v3 = (unsigned int *)((char *)v5[1] + 8);
    if (atomic_fetch_add((atomic_uint *volatile)v5[1] + 2, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v3);
      id v4 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v4 = &unk_1F3C797F0;
      v4[1] = v3;
      id v6 = v4;
      WTF::ensureOnMainThread();
      if (v6) {
        (*(void (**)(void *))(*v6 + 8))(v6);
      }
    }
  }
  if (v5[0])
  {
    if (*((_DWORD *)v5[0] + 7) == 2)
    {
      if ((*((_WORD *)v5[0] + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5[0]);
      }
    }
    else
    {
      *((_DWORD *)v5[0] + 7) -= 2;
    }
  }
}

- (void)alignCenter:(id)a3
{
}

- (void)alignJustified:(id)a3
{
}

- (void)alignLeft:(id)a3
{
}

- (void)alignRight:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)cut:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (void)deleteBackward:(id)a3
{
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
}

- (void)deleteForward:(id)a3
{
}

- (void)deleteToBeginningOfLine:(id)a3
{
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
}

- (void)deleteToEndOfLine:(id)a3
{
}

- (void)deleteToEndOfParagraph:(id)a3
{
}

- (void)deleteToMark:(id)a3
{
}

- (void)deleteWordBackward:(id)a3
{
}

- (void)deleteWordForward:(id)a3
{
}

- (void)ignoreSpelling:(id)a3
{
}

- (void)indent:(id)a3
{
}

- (void)insertBacktab:(id)a3
{
}

- (void)insertLineBreak:(id)a3
{
}

- (void)insertNewline:(id)a3
{
}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
}

- (void)insertParagraphSeparator:(id)a3
{
}

- (void)insertTab:(id)a3
{
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)moveBackward:(id)a3
{
}

- (void)moveBackwardAndModifySelection:(id)a3
{
}

- (void)moveDown:(id)a3
{
}

- (void)moveDownAndModifySelection:(id)a3
{
}

- (void)moveForward:(id)a3
{
}

- (void)moveForwardAndModifySelection:(id)a3
{
}

- (void)moveLeft:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
}

- (void)moveRight:(id)a3
{
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfDocument:(id)a3
{
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfLine:(id)a3
{
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfParagraph:(id)a3
{
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfSentence:(id)a3
{
}

- (void)moveToBeginningOfSentenceAndModifySelection:(id)a3
{
}

- (void)moveToEndOfDocument:(id)a3
{
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveToEndOfLine:(id)a3
{
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToEndOfParagraph:(id)a3
{
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToEndOfSentence:(id)a3
{
}

- (void)moveToEndOfSentenceAndModifySelection:(id)a3
{
}

- (void)moveToLeftEndOfLine:(id)a3
{
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToRightEndOfLine:(id)a3
{
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveUp:(id)a3
{
}

- (void)moveUpAndModifySelection:(id)a3
{
}

- (void)moveWordBackward:(id)a3
{
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
}

- (void)moveWordForward:(id)a3
{
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
}

- (void)moveWordLeft:(id)a3
{
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
}

- (void)moveWordRight:(id)a3
{
}

- (void)moveWordRightAndModifySelection:(id)a3
{
}

- (void)outdent:(id)a3
{
}

- (void)overWrite:(id)a3
{
}

- (void)pageDown:(id)a3
{
}

- (void)pageDownAndModifySelection:(id)a3
{
}

- (void)pageUp:(id)a3
{
}

- (void)pageUpAndModifySelection:(id)a3
{
}

- (void)pasteAsPlainText:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)selectLine:(id)a3
{
}

- (void)selectParagraph:(id)a3
{
}

- (void)selectSentence:(id)a3
{
}

- (void)selectToMark:(id)a3
{
}

- (void)selectWord:(id)a3
{
}

- (void)setMark:(id)a3
{
}

- (void)subscript:(id)a3
{
}

- (void)superscript:(id)a3
{
}

- (void)swapWithMark:(id)a3
{
}

- (void)transpose:(id)a3
{
}

- (void)underline:(id)a3
{
}

- (void)unscript:(id)a3
{
}

- (void)yank:(id)a3
{
}

- (void)yankAndSelect:(id)a3
{
}

- (void)clearText:(id)a3
{
}

- (void)toggleBold:(id)a3
{
}

- (void)toggleItalic:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (void)jumpToSelection:(id)a3
{
  if (![(WebHTMLView *)self callDelegateDoCommandBySelectorIfNeeded:a2])
  {
    id v4 = [(WebHTMLView *)self _frame];
    if (v4)
    {
      uint64_t v5 = *(void *)(v4[1] + 8);
      if (v5)
      {
        uint64_t v6 = MEMORY[0x1E4FB64C0];
        uint64_t v7 = *(void *)(*(void *)(v5 + 296) + 3096);
        MEMORY[0x1F416D818](v7, 0, v6, 1, 1);
      }
    }
  }
}

- (BOOL)acceptsFirstResponder
{
  BOOL v3 = (void *)[MEMORY[0x1E4FB61C0] currentEvent];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  if ([v3 type]) {
    return 1;
  }
  if (self->_private->handlingMouseDownEvent) {
    return 1;
  }
  [v4 locationInWindow];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(WebHTMLView *)self visibleRect];
  -[WebHTMLView convertRect:toView:](self, "convertRect:toView:", 0);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v18.double x = v6;
  v18.double y = v8;
  v19.origin.double x = v10;
  v19.origin.double y = v12;
  v19.size.double width = v14;
  v19.size.double height = v16;
  return !NSPointInRect(v18, v19);
}

- (BOOL)maintainsInactiveSelection
{
  if (objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "maintainsInactiveSelection"))
  {
    LOBYTE(v3) = 1;
  }
  else if ((WebHTMLView *)objc_msgSend((id)-[WebHTMLView window](self, "window"), "_newFirstResponderAfterResigning") == self)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(WebHTMLView *)self _frame];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3[1] + 8);
      if (v4)
      {
        double v5 = (WebCore::VisibleSelection *)(*(void *)(*(void *)(v4 + 296) + 3096) + 56);
        LOBYTE(v3) = WebCore::VisibleSelection::isContentEditable(v5);
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (void)viewWillMoveToWindow:(id)a3
{
  if (self->_private)
  {
    id v3 = [(WebHTMLView *)self _pluginController];
    [v3 stopAllPlugins];
  }
}

- (void)viewDidMoveToWindow
{
  id v2 = self->_private;
  if (v2 && !v2->closed)
  {
    [(WebHTMLView *)self _stopAutoscrollTimer];
    if ([(WebHTMLView *)self window])
    {
      objc_msgSend((id)-[WebHTMLView superview](self, "superview"), "bounds");
      uint64_t v4 = self->_private;
      v4->lastScrollPosition.double x = v5;
      v4->lastScrollPosition.double y = v6;
      objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "startAllPlugins");
      self->_private->lastScrollPosition = (CGPoint)*MEMORY[0x1E4F28AD0];
    }
  }
}

- (void)addSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WebHTMLView;
  -[WebHTMLView addSubview:](&v6, sel_addSubview_);
  if (+[WebPluginController isPlugInView:a3])
  {
    id v5 = [(WebHTMLView *)self _webView];
    objc_msgSend((id)objc_msgSend(v5, "_UIKitDelegateForwarder"), "webView:willAddPlugInView:", v5, a3);
    objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "addPlugin:", a3);
  }
}

- (void)willRemoveSubview:(id)a3
{
  if (+[WebPluginController isPlugInView:](WebPluginController, "isPlugInView:")) {
    objc_msgSend(-[WebHTMLView _pluginController](self, "_pluginController"), "destroyPlugin:", a3);
  }
  v5.receiver = self;
  v5.super_class = (Class)WebHTMLView;
  [(WebHTMLView *)&v5 willRemoveSubview:a3];
}

- (void)reapplyStyles
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      WebCore::Style::Scope::didChangeStyleSheetEnvironment(*(WebCore::Style::Scope **)(*(void *)(v3 + 296) + 1368));
      uint64_t v4 = *(WebCore::Document **)(v3 + 296);
      WebCore::Document::updateStyleIfNeeded(v4);
    }
  }
}

- (void)layoutToMinimumPageWidth:(float)a3 height:(float)a4 originalPageWidth:(float)a5 originalPageHeight:(float)a6 maximumShrinkRatio:(float)a7 adjustingViewSize:(BOOL)a8
{
  double v11 = [(WebHTMLView *)self _frame];
  if (v11)
  {
    uint64_t v12 = *(void *)(v11[1] + 8);
    if (v12)
    {
      double v13 = *(WebCore::Document **)(v12 + 296);
      if (v13)
      {
        if (*((unsigned char *)v13 + 3410)) {
          return;
        }
        WebCore::Document::updateStyleIfNeeded(v13);
      }
      if ([(WebHTMLView *)self _needsLayout])
      {
        uint64_t v14 = *(void *)(v12 + 288);
        if (v14)
        {
          if (a3 <= 0.0)
          {
            WebCore::LocalFrameView::forceLayout(*(WebCore::LocalFrameView **)(v12 + 288));
            if (a8)
            {
              MEMORY[0x1F416DA38](v14);
            }
          }
          else
          {
            WebCore::LocalFrameView::forceLayoutForPagination();
          }
        }
      }
    }
  }
}

- (void)layout
{
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6
{
  return [(WebHTMLView *)self searchFor:a3 direction:a4 caseSensitive:a5 wrap:a6 startInSelection:0];
}

- (void)clearFocus
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      uint64_t v4 = *(WebCore::Document **)(v3 + 296);
      if (v4)
      {
        WebCore::Document::setFocusedElement(v4, 0);
      }
    }
  }
}

- (BOOL)isOpaque
{
  id v2 = [(WebHTMLView *)self _webView];
  return [v2 drawsBackground];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_private->inScrollPositionChanged) {
    [(WebHTMLView *)self superview];
  }
  v8.receiver = self;
  v8.super_class = (Class)WebHTMLView;
  -[WebHTMLView setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (void)setNeedsLayout:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = [(WebHTMLView *)self _frame];
    if (v3)
    {
      uint64_t v5 = *(void *)(v3[1] + 8);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 296);
        if (!v6 || !*(unsigned char *)(v6 + 3410))
        {
          uint64_t v7 = *(void *)(v5 + 288);
          if (v7)
          {
            MEMORY[0x1F416DBC0](v7, v4);
          }
        }
      }
    }
  }
}

- (void)setNeedsToApplyStyles:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = [(WebHTMLView *)self _frame];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3[1] + 8);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 296);
        if (!v5 || !*(unsigned char *)(v5 + 3410))
        {
          MEMORY[0x1F41731F8]();
        }
      }
    }
  }
}

- (void)drawSingleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(WebHTMLView *)self _frame];
  objc_msgSend(v7, "_drawRect:contentsOnly:", 1, x, y, width, height);
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  kdebug_trace();
  -[WebHTMLView drawSingleRect:](self, "drawSingleRect:", x, y, width, height);
  objc_super v8 = [(WebHTMLView *)self _webView];
  if (v8) {
    CallUIDelegate(v8, (objc_selector *)sel_webView_didDrawFrame_, (objc_object *)[(WebHTMLView *)self _frame]);
  }
  kdebug_trace();
}

- (void)scrollWheel:(id)a3
{
  uint64_t v4 = [(WebHTMLView *)self _frame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 624);
      MEMORY[0x1F416CD60](v6, a3);
    }
  }
}

- (BOOL)_isSelectionEvent:(id)a3
{
  [a3 locationInWindow];
  -[WebHTMLView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
  id v4 = -[WebHTMLView elementAtPoint:allowShadowContent:](self, "elementAtPoint:allowShadowContent:", 0);
  uint64_t v5 = (void *)[v4 objectForKey:WebElementIsSelectedKey];
  return [v5 BOOLValue];
}

- (void)mouseDown:(id)a3
{
  objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "prepareForMouseDown");
  if (self) {
    CFRetain(self);
  }
  self->_private->handlingMouseDownEvent = 1;
  [(WebHTMLView *)self _setMouseDownEvent:a3];
  self->_private->ignoringMouseDraggedEvents = 0;
  uint64_t v5 = [(WebHTMLView *)self _frame];
  if (v5 && *(void *)(v5[1] + 8)) {
    WebCore::EventHandler::mouseDown();
  }
  self->_private->handlingMouseDownEvent = 0;
  CFRelease(self);
}

- (void)touch:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  id v4 = [(WebHTMLView *)self _frame];
  if (v4 && *(void *)(v4[1] + 8)) {
    WebCore::EventHandler::touchEvent();
  }
  if (self)
  {
    CFRelease(self);
  }
}

- (void)mouseUp:(id)a3
{
  objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "prepareForMouseUp");
  [(WebHTMLView *)self _setMouseDownEvent:0];
  uint64_t v3 = self;
  [(WebHTMLView *)self _stopAutoscrollTimer];
  id v4 = [(WebHTMLView *)self _frame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 8);
        if (v7)
        {
          uint64_t v8 = *(void *)(v7 + 160);
          if (v8 && *(unsigned char *)(v8 + 144) == 0) {
            WebCore::EventHandler::mouseUp();
          }
        }
      }
    }
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus"))
  {
    uint64_t v3 = 0;
    id v4 = [(WebHTMLView *)self _frame];
    if (!v4) {
      return 1;
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend((id)-[WebHTMLView window](self, "window"), "keyViewSelectionDirection");
    id v4 = [(WebHTMLView *)self _frame];
    if (!v4) {
      return 1;
    }
  }
  uint64_t v5 = *(void *)(v4[1] + 8);
  if (v5)
  {
    *(unsigned char *)(WebCore::Document::editor(*(WebCore::Document **)(v5 + 296)) + 89) = 1;
    uint64_t v6 = *(void *)(v5 + 24);
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 8);
      if (v7)
      {
        if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0) {
          WebCore::FocusController::setFocusedFrame();
        }
        WebCore::FocusController::setFocused(*(WebCore::FocusController **)(v7 + 72));
        if (v3)
        {
          uint64_t v8 = *(WebCore::Document **)(v5 + 296);
          if (v8) {
            WebCore::Document::setFocusedElement(v8, 0);
          }
          double v9 = (void *)[MEMORY[0x1E4FB61C0] currentEvent];
          if (v9 && ([v9 type] & 0xFFFFFFFE) == 4)
          {
            CGFloat v10 = *(WebCore::Document **)(v5 + 296);
            WebCore::PlatformEventFactory::createPlatformKeyboardEvent();
            if (v10)
            {
              double v11 = (WebCore::WindowProxy *)WebCore::Document::windowProxy(v10);
              if (v11) {
                ++*(_DWORD *)v11;
              }
            }
            else
            {
              double v11 = 0;
            }
            float v17 = v11;
            WebCore::KeyboardEvent::create();
            uint64_t v12 = v18;
            if (v17)
            {
              if (*(_DWORD *)v17 == 1)
              {
                WebCore::WindowProxy::~WindowProxy(v17);
                WTF::fastFree(v14, v15);
              }
              else
              {
                --*(_DWORD *)v17;
              }
            }
            WebCore::PlatformKeyboardEvent::~PlatformKeyboardEvent((WebCore::PlatformKeyboardEvent *)v19, v13);
          }
          else
          {
            uint64_t v12 = 0;
          }
          WebCore::FocusController::setInitialFocus();
          if (v12)
          {
            if (v12[4] == 1) {
              (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
            }
            else {
              --v12[4];
            }
          }
        }
      }
    }
  }
  return 1;
}

- (BOOL)resignFirstResponder
{
  v11.receiver = self;
  v11.super_class = (Class)WebHTMLView;
  BOOL v3 = [(WAKResponder *)&v11 resignFirstResponder];
  if (v3)
  {
    id v4 = [(WebHTMLView *)self _frame];
    if (v4)
    {
      uint64_t v5 = *(void *)(v4[1] + 8);
      if (v5)
      {
        uint64_t v6 = *(WebCore::Document **)(v5 + 296);
        if (v6)
        {
          if (!*((void *)v6 + 192)) {
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(v5 + 296));
          }
          WebCore::DocumentMarkerController::removeMarkers();
          if (!*((void *)v6 + 192)) {
            WebCore::Document::ensureMarkers(v6);
          }
          WebCore::DocumentMarkerController::removeMarkers();
        }
        uint64_t v7 = *(void *)(v5 + 24);
        if (v7)
        {
          uint64_t v8 = *(void *)(v7 + 8);
          if (v8)
          {
            if (![(WebHTMLView *)self maintainsInactiveSelection])
            {
              [(WebHTMLView *)self deselectAll];
              if ((objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0) {
                [(WebHTMLView *)self clearFocus];
              }
            }
            double v9 = objc_msgSend((id)-[WebHTMLView window](self, "window"), "_newFirstResponderAfterResigning");
            objc_opt_class();
            if (((objc_opt_isKindOfClass() & 1) == 0
               || (objc_msgSend(v9, "isDescendantOf:", objc_msgSend((id)objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "mainFrame"), "frameView")) & 1) == 0)&& (objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "_isPerformingProgrammaticFocus") & 1) == 0)
            {
              WebCore::FocusController::setFocused(*(WebCore::FocusController **)(v8 + 72));
            }
          }
        }
      }
    }
  }
  return v3;
}

- (void)setDataSource:(id)a3
{
  id v4 = self->_private;
  id m_ptr = v4->dataSource.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = v4->dataSource.m_ptr;
    }
    v4->dataSource.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v7 = self->_private->pluginController.m_ptr;
    [v7 setDataSource:a3];
  }
}

- (void)_setPrinting:(BOOL)a3 minimumPageLogicalWidth:(float)a4 logicalHeight:(float)a5 originalPageWidth:(float)a6 originalPageHeight:(float)a7 maximumShrinkRatio:(float)a8 adjustViewSize:(BOOL)a9 paginateScreenContent:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v11 = a9;
  BOOL v17 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (__PAIR64__(self->_private->paginateScreenContent, self->_private->printing) != __PAIR64__(a10, a3))
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    NSRect v19 = objc_msgSend(-[WebHTMLView _frame](self, "_frame", 80), "childFrames");
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(v19);
          }
          BOOL v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          float v24 = (void *)[v23 frameView];
          if (objc_msgSend((id)objc_msgSend(v23, "_dataSource"), "_isDocumentHTML")) {
            objc_msgSend((id)objc_msgSend(v24, "documentView"), "_setPrinting:minimumPageLogicalWidth:logicalHeight:originalPageWidth:originalPageHeight:maximumShrinkRatio:adjustViewSize:paginateScreenContent:", v17, v11, v10, 0.0, 0.0, 0.0, 0.0, 0.0);
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v20);
    }
    uint64_t v25 = *(uint64_t *)((char *)&self->super.super.super.isa + v43);
    v26 = *(const void **)(v25 + 88);
    *(void *)(v25 + 88) = 0;
    if (v26) {
      CFRelease(v26);
    }
    (*(unsigned char **)((char *)&self->super.super.super.isa + v43))[10] = v17;
    (*(unsigned char **)((char *)&self->super.super.super.isa + v43))[11] = v10;
    FloatSize v27 = [(WebHTMLView *)self _frame];
    if (!v27) {
      goto LABEL_29;
    }
    uint64_t v28 = *(void *)(v27[1] + 8);
    if (!v28) {
      goto LABEL_29;
    }
    if (*(void *)(v28 + 288))
    {
      WTF::AtomStringImpl::add();
      v44 = v49;
      WebCore::LocalFrameView::setMediaType();
      if (v44)
      {
        if (*(_DWORD *)v44 == 2)
        {
          WTF::StringImpl::destroy(v44, v29);
          uint64_t v30 = *(void *)(v28 + 296);
          if (v30)
          {
LABEL_20:
            uint64_t v31 = *(void *)(v30 + 752);
            if (v31)
            {
              if (!*(void *)(v31 + 8)) {
                goto LABEL_24;
              }
            }
            else
            {
              uint64_t v31 = WebCore::Document::ensureCachedResourceLoader((WebCore::Document *)v30);
              if (!*(void *)(v31 + 8))
              {
LABEL_24:
                uint64_t v33 = WTF::fastCompactMalloc((WTF *)0x10);
                *(_DWORD *)uint64_t v33 = 1;
                *(void *)(v33 + 8) = v31;
                v34 = *(unsigned int **)(v31 + 8);
                *(void *)(v31 + 8) = v33;
                if (v34 && atomic_fetch_add((atomic_uint *volatile)v34, 0xFFFFFFFF) == 1)
                {
                  atomic_store(1u, v34);
                  WTF::fastFree((WTF *)v34, v32);
                }
              }
            }
            uint64_t v35 = *(void *)(v31 + 8);
            atomic_fetch_add((atomic_uint *volatile)v35, 1u);
            char v36 = *(unsigned char *)(v31 + 274);
            *(unsigned char *)(*(void *)(v35 + 8) + 274) = 1;
            *(unsigned char *)(v30 + 3437) = (*(unsigned char **)((char *)&self->super.super.super.isa + v43))[11];
            *(unsigned char *)(v30 + 3436) = (*(unsigned char **)((char *)&self->super.super.super.isa + v43))[10];
            WebCore::Style::Scope::didChangeStyleSheetEnvironment(*(WebCore::Style::Scope **)(v30 + 1368));
            *(unsigned char *)(*(void *)(v35 + 8) + 274) = v36;
            if (atomic_fetch_add((atomic_uint *volatile)v35, 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, (unsigned int *)v35);
              WTF::fastFree((WTF *)v35, v37);
            }
          }
LABEL_29:
          [(WebHTMLView *)self setNeedsLayout:1];
          *(float *)&double v38 = a4;
          *(float *)&double v39 = a5;
          *(float *)&double v40 = a6;
          *(float *)&double v41 = a7;
          *(float *)&double v42 = a8;
          [(WebHTMLView *)self layoutToMinimumPageWidth:v11 height:v38 originalPageWidth:v39 originalPageHeight:v40 maximumShrinkRatio:v41 adjustingViewSize:v42];
          if (!v17) {
            [(WebHTMLView *)self setNeedsDisplay:0];
          }
          return;
        }
        *(_DWORD *)v44 -= 2;
      }
    }
    uint64_t v30 = *(void *)(v28 + 296);
    if (v30) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
}

- (void)keyDown:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  uint64_t v5 = self->_private;
  id m_ptr = v5->keyDownEvent.m_ptr;
  if (!a3)
  {
    uint64_t v7 = v5->keyDownEvent.m_ptr;
    v5->keyDownEvent.id m_ptr = 0;
    if (!m_ptr) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CFRetain(a3);
  uint64_t v7 = v5->keyDownEvent.m_ptr;
  v5->keyDownEvent.id m_ptr = a3;
  if (v7) {
LABEL_5:
  }
    CFRelease(v7);
LABEL_6:
  uint64_t v8 = [(WebHTMLView *)self _frame];
  if (v8)
  {
    if (m_ptr != a3 && *(void *)(v8[1] + 8) != 0) {
      WebCore::EventHandler::keyEvent();
    }
  }
  CFRelease(self);
}

- (void)keyUp:(id)a3
{
  id m_ptr = self->_private->keyDownEvent.m_ptr;
  CFRetain(self);
  uint64_t v6 = [(WebHTMLView *)self _frame];
  if (!v6 || (*(void *)(v6[1] + 8) ? (BOOL v7 = m_ptr == a3) : (BOOL v7 = 1), v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)WebHTMLView;
    [(WAKResponder *)&v8 keyUp:a3];
  }
  else
  {
    WebCore::EventHandler::keyEvent();
  }
  CFRelease(self);
}

- (id)accessibilityFocusedUIElement
{
  BOOL v3 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (!v3) {
    return self;
  }
  return (id)[v3 accessibilityFocusedUIElement];
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (!v6) {
    return self;
  }
  return (id)objc_msgSend(v6, "accessibilityHitTest:", x, y);
}

- (id)_accessibilityParentForSubview:(id)a3
{
  id v4 = self;
  uint64_t v5 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "accessibilityRoot");
  if (v5)
  {
    uint64_t v6 = (void *)[v5 _accessibilityParentForSubview:a3];
    if (v6) {
      return v6;
    }
  }
  return v4;
}

- (void)centerSelectionInVisibleArea:(id)a3
{
  if (![(WebHTMLView *)self callDelegateDoCommandBySelectorIfNeeded:a2])
  {
    id v4 = [(WebHTMLView *)self _frame];
    if (v4)
    {
      uint64_t v5 = *(void *)(v4[1] + 8);
      if (v5)
      {
        uint64_t v6 = MEMORY[0x1E4FB64C0];
        uint64_t v7 = *(void *)(*(void *)(v5 + 296) + 3096);
        MEMORY[0x1F416D818](v7, 0, v6, 1, 1);
      }
    }
  }
}

- (id)_emptyStyle
{
  id v2 = objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "DOMDocument");
  return (id)[v2 createCSSStyleDeclaration];
}

- (void)_applyStyleToSelection:(id)a3 withUndoAction:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = (WebCore::EditingStyle *)WTF::fastMalloc((WTF *)0x18);
  WebCore::EditingStyle::EditingStyle();
  BOOL v10 = v6;
  [(WebHTMLView *)self _applyEditingStyleToSelection:&v10 withUndoAction:v4];
  uint64_t v7 = v10;
  BOOL v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 1)
    {
      WebCore::EditingStyle::~EditingStyle(v7);
      WTF::fastFree(v8, v9);
    }
    else
    {
      --*(_DWORD *)v7;
    }
  }
}

- (void)_applyEditingStyleToSelection:(void *)a3 withUndoAction:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = [(WebHTMLView *)self _frame];
  if (v6)
  {
    uint64_t v7 = *(void *)(v6[1] + 8);
    if (v7)
    {
      uint64_t v8 = WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
      MEMORY[0x1F4172BE0](v8, a3, v4, 0);
    }
  }
}

- (void)_changeWordCaseWithSelector:(SEL)a3
{
  if ([(WebHTMLView *)self _canEdit])
  {
    id v5 = [(WebHTMLView *)self _frame];
    [(WebHTMLView *)self selectWord:0];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "_selectedString"), "performSelector:", a3);
    if ([(WebHTMLView *)self _shouldReplaceSelectionWithText:v6 givenAction:0])
    {
      [v5 _replaceSelectionWithText:v6 selectReplacement:0 smartReplace:0];
    }
  }
}

- (void)uppercaseWord:(id)a3
{
  if (![(WebHTMLView *)self callDelegateDoCommandBySelectorIfNeeded:a2])
  {
    [(WebHTMLView *)self _changeWordCaseWithSelector:sel_uppercaseString];
  }
}

- (void)lowercaseWord:(id)a3
{
  if (![(WebHTMLView *)self callDelegateDoCommandBySelectorIfNeeded:a2])
  {
    [(WebHTMLView *)self _changeWordCaseWithSelector:sel_lowercaseString];
  }
}

- (void)capitalizeWord:(id)a3
{
  if (![(WebHTMLView *)self callDelegateDoCommandBySelectorIfNeeded:a2])
  {
    [(WebHTMLView *)self _changeWordCaseWithSelector:sel_capitalizedString];
  }
}

- (BOOL)_wantsKeyDownForEvent:(id)a3
{
  BOOL v3 = [(WebHTMLView *)self _frame];
  if (v3) {
    LOBYTE(v3) = *(void *)(v3[1] + 8) != 0;
  }
  return (char)v3;
}

- (void)markedTextUpdate:(id)a3
{
  uint64_t v4 = (void *)[a3 object];
  uint64_t v5 = [v4 length];
  -[WebHTMLView setMarkedText:selectedRange:](self, "setMarkedText:selectedRange:", v4, 0, v5);
}

- (BOOL)_canSmartCopyOrDelete
{
  LODWORD(v3) = objc_msgSend(-[WebHTMLView _webView](self, "_webView"), "smartInsertDeleteEnabled");
  if (v3)
  {
    BOOL v3 = [(WebHTMLView *)self _frame];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3[1] + 8);
      if (v4) {
        LOBYTE(v3) = *(unsigned char *)(*(void *)(*(void *)(v4 + 296) + 3096) + 184) == 1;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (id)_frame
{
  return (id)[self->_private->dataSource.m_ptr webFrame];
}

- (void)closeIfNotCurrentView
{
  if ((WebHTMLView *)objc_msgSend((id)objc_msgSend(-[WebHTMLView _frame](self, "_frame"), "frameView"), "documentView") != self)
  {
    [(WebHTMLView *)self close];
  }
}

- (void)_executeSavedKeypressCommands
{
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    var0 = interpretKeyEventsParameters->var0;
    if (*((_DWORD *)interpretKeyEventsParameters->var0 + 43))
    {
      if (!interpretKeyEventsParameters->var4)
      {
        uint64_t v5 = 0;
        unint64_t v6 = 0;
        BOOL var2 = interpretKeyEventsParameters->var2;
        interpretKeyEventsParameters->BOOL var2 = 0;
        interpretKeyEventsParameters->var4 = 1;
        do
        {
          int v10 = MEMORY[0x1E4E44240](*(void *)(*((void *)var0 + 20) + v5), "insertText:", 11);
          unint64_t v11 = *((unsigned int *)var0 + 43);
          if (v10)
          {
            if (v6 >= v11)
            {
              __break(0xC471u);
              JUMPOUT(0x1E13EF3E0);
            }
            if (*(void *)(*((void *)var0 + 20) + v5 + 8)) {
              uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
            }
            else {
              uint64_t v8 = &stru_1F3C7DA90;
            }
            [(WebHTMLView *)self insertText:v8];
          }
          else
          {
            if (v6 >= v11) {
              goto LABEL_39;
            }
            if ((MEMORY[0x1E4E44240](*(void *)(*((void *)var0 + 20) + v5), "noop:", 5) & 1) == 0)
            {
              if (v6 >= *((unsigned int *)var0 + 43))
              {
LABEL_39:
                __break(0xC471u);
                JUMPOUT(0x1E13EF3D8);
              }
              if (*(void *)(*((void *)var0 + 20) + v5)) {
                uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
              }
              else {
                uint64_t v12 = &stru_1F3C7DA90;
              }
              [(WebHTMLView *)self doCommandBySelector:NSSelectorFromString(&v12->isa)];
            }
          }
          ++v6;
          v5 += 16;
        }
        while (v6 < *((unsigned int *)var0 + 43));
        double v13 = interpretKeyEventsParameters->var0;
        if (*((_DWORD *)interpretKeyEventsParameters->var0 + 42))
        {
          uint64_t v14 = *((unsigned int *)v13 + 43);
          if (v14)
          {
            uint64_t v15 = 16 * v14;
            CGFloat v16 = (WTF::StringImpl **)(*((void *)v13 + 20) + 8);
            while (1)
            {
              BOOL v17 = *v16;
              *CGFloat v16 = 0;
              if (!v17) {
                goto LABEL_27;
              }
              if (*(_DWORD *)v17 != 2) {
                break;
              }
              WTF::StringImpl::destroy(v17, v9);
              NSPoint v18 = *(v16 - 1);
              *(v16 - 1) = 0;
              if (v18)
              {
LABEL_30:
                if (*(_DWORD *)v18 == 2) {
                  WTF::StringImpl::destroy(v18, v9);
                }
                else {
                  *(_DWORD *)v18 -= 2;
                }
              }
LABEL_23:
              v16 += 2;
              v15 -= 16;
              if (!v15)
              {
                *((_DWORD *)v13 + 43) = 0;
                goto LABEL_33;
              }
            }
            *(_DWORD *)v17 -= 2;
LABEL_27:
            NSPoint v18 = *(v16 - 1);
            *(v16 - 1) = 0;
            if (v18) {
              goto LABEL_30;
            }
            goto LABEL_23;
          }
LABEL_33:
          NSRect v19 = (WTF *)*((void *)v13 + 20);
          if (v19)
          {
            *((void *)v13 + 20) = 0;
            *((_DWORD *)v13 + 42) = 0;
            WTF::fastFree(v19, v9);
          }
        }
        interpretKeyEventsParameters->BOOL var2 = var2;
        interpretKeyEventsParameters->var4 = 0;
      }
    }
  }
}

- (BOOL)_handleEditingKeyEvent:(void *)a3
{
  uint64_t v3 = *((void *)a3 + 11);
  if (!v3) {
    goto LABEL_22;
  }
  uint64_t v5 = *(void **)(v3 + 104);
  if (([v5 keyboardFlags] & 0x20) != 0) {
    goto LABEL_22;
  }
  id v6 = [(WebHTMLView *)self _webView];
  if (([v6 isEditable] & 1) != 0 || (objc_msgSend(v5, "isTabKey") & 1) == 0)
  {
    int v8 = *(unsigned __int8 *)(v3 + 8);
    double v9 = (void *)[v6 _UIKitDelegateForwarder];
    if (v8 == 4)
    {
      if (([v9 handleKeyAppCommandForCurrentEvent] & 1) == 0) {
        goto LABEL_8;
      }
    }
    else if (([v9 handleKeyTextCommandForCurrentEvent] & 1) == 0)
    {
LABEL_8:
      int v10 = (void *)[v5 characters];
      uint64_t v7 = [v10 length];
      if (!v7) {
        return v7;
      }
      int v11 = [v10 characterAtIndex:0];
      if (v11 > 12)
      {
        if (v11 != 13)
        {
          if (v11 != 127)
          {
LABEL_12:
            if (v8 == 4)
            {
              objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "addInputString:withFlags:", objc_msgSend(v5, "characters"), objc_msgSend(v5, "keyboardFlags"));
              LOBYTE(v7) = 1;
              return v7;
            }
LABEL_22:
            LOBYTE(v7) = 0;
            return v7;
          }
LABEL_19:
          objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "deleteFromInputWithFlags:", objc_msgSend(v5, "keyboardFlags"));
          LOBYTE(v7) = 1;
          return v7;
        }
      }
      else if (v11 != 3)
      {
        if (v11 != 8) {
          goto LABEL_12;
        }
        goto LABEL_19;
      }
      if (v8 == 4)
      {
        objc_msgSend((id)objc_msgSend(v6, "_UIKitDelegateForwarder"), "addInputString:withFlags:", @"\n", 0);
        LOBYTE(v7) = 1;
        return v7;
      }
      goto LABEL_22;
    }
    LOBYTE(v7) = 1;
    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)_layoutIfNeeded
{
  if ([(WebHTMLView *)self _needsLayout])
  {
    [(WebHTMLView *)self layout];
  }
}

- (void)_web_updateLayoutAndStyleIfNeededRecursive
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      if (*(void *)(v3 + 288))
      {
        MEMORY[0x1F416DB98]();
      }
    }
  }
}

- (void)_destroyAllWebPlugins
{
  id v2 = [(WebHTMLView *)self _pluginController];
  [v2 destroyAllPlugins];
}

- (BOOL)_needsLayout
{
  id v2 = [(WebHTMLView *)self _frame];
  return [v2 _needsLayout];
}

- (id)_pluginController
{
  return self->_private->pluginController.m_ptr;
}

- (unsigned)_scrollbarWidthStyle
{
  id v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return 0;
  }
  uint64_t v6 = *(void *)(v2[1] + 8);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = *(void *)(v6 + 296);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void *)(v7 + 1304);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = *(void *)(v8 + 72) & 0xFFFFFFFFFFFFLL;
  if (!v9) {
    return 0;
  }
  if ((*(unsigned char *)(v9 + 45) & 2) != 0)
  {
    uint64_t v3 = "/AppleInternal/Library/BuildRoots/7a5643da-a7fb-11ef-987a-36218cb420d5/Applications/Xcode.app/Contents/Develope"
         "r/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/wtf/TypeCasts.h";
    uint64_t v4 = "match_constness_t<Source, Target> *WTF::downcast(Source *) [Target = WebCore::RenderElement, Source = WebCore::RenderObject]";
    uint64_t v10 = 105;
    uint64_t v5 = 2;
    __break(0xC471u);
  }
  else
  {
    uint64_t v10 = v9 + 80;
  }
  return MEMORY[0x1F4174580](v10, v3, v4, v5);
}

- (unint64_t)characterIndexForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  uint64_t v6 = (void *)[(WebHTMLView *)self window];
  id v7 = [(WebHTMLView *)self _frame];
  if (v6)
  {
    objc_msgSend(v6, "convertRectFromScreen:", x, y, *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8));
    double x = v8;
    double y = v9;
  }
  -[WebHTMLView convertPoint:fromView:](self, "convertPoint:fromView:", 0, x, y);
  uint64_t v10 = objc_msgSend(v7, "_characterRangeAtPoint:");
  if (v10) {
    return [v7 _convertDOMRangeToNSRange:v10];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  id v6 = [(WebHTMLView *)self _frame];
  id v7 = v6;
  if (location + length) {
    BOOL v8 = location + length >= location;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    NSUInteger v9 = length;
  }
  else {
    NSUInteger v9 = 0;
  }
  uint64_t v10 = objc_msgSend(v6, "_convertNSRangeToDOMRange:", location, v9);
  if (v10)
  {
    [v7 _firstRectForDOMRange:v10];
    -[WebHTMLView convertRect:toView:](self, "convertRect:toView:", 0);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    NSRect v19 = (void *)[(WebHTMLView *)self window];
    if (v19)
    {
      objc_msgSend(v19, "convertRectToScreen:", v12, v14, v16, v18);
      double v12 = v20;
      double v14 = v21;
    }
  }
  else
  {
    double v12 = *MEMORY[0x1E4F28AD8];
    double v14 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  double v25 = v18;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (_NSRange)selectedRange
{
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  uint64_t v3 = [(WebHTMLView *)self _frame];
  if (v3
    && (uint64_t v4 = *(void *)(v3[1] + 8)) != 0
    && (uint64_t v5 = *(void *)(*(void *)(v4 + 296) + 3096), *(unsigned char *)(v5 + 153))
    && WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(v5 + 56)))
  {
    id v6 = [(WebHTMLView *)self _frame];
    NSUInteger v7 = [v6 _selectedNSRange];
  }
  else
  {
    NSUInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v8 = 0;
  }
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (_NSRange)markedRange
{
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  uint64_t v3 = [(WebHTMLView *)self _frame];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(v3[1] + 8);
    if (!v5)
    {
      NSUInteger v10 = 0;
      NSUInteger v11 = 0;
      goto LABEL_19;
    }
    id v6 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
    WebCore::Editor::compositionRange((uint64_t *)v13, v6);
    if (!v15)
    {
      NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v11 = 0;
      goto LABEL_19;
    }
    uint64_t v7 = [v4 _convertToNSRange:v13];
    uint64_t v4 = v8;
    if (v15)
    {
      NSUInteger v9 = v14;
      double v14 = 0;
      if (v9)
      {
        if (*((_DWORD *)v9 + 7) == 2)
        {
          if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v9);
          }
        }
        else
        {
          *((_DWORD *)v9 + 7) -= 2;
        }
      }
      double v12 = v13[0];
      v13[0] = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 7) != 2)
        {
          *((_DWORD *)v12 + 7) -= 2;
          NSUInteger v10 = v7;
          NSUInteger v11 = (NSUInteger)v4;
          goto LABEL_19;
        }
        if ((*((_WORD *)v12 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v12);
          NSUInteger v10 = v7;
          NSUInteger v11 = (NSUInteger)v4;
          goto LABEL_19;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  NSUInteger v10 = v7;
  NSUInteger v11 = (NSUInteger)v4;
LABEL_19:
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)hasMarkedText
{
  uint64_t v3 = [(WebHTMLView *)self _frame];
  if (v3)
  {
    uint64_t v4 = *(void *)(v3[1] + 8);
    if (v4
      && (*(void *)(WebCore::Document::editor(*(WebCore::Document **)(v4 + 296)) + 32)
        ? (uint64_t v5 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance)
        : (uint64_t v5 = 0),
          v5))
    {
      [(WebHTMLView *)self _executeSavedKeypressCommands];
      if (*(void *)(WebCore::Document::editor(*(WebCore::Document **)(v4 + 296)) + 32)) {
        id v6 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
      }
      else {
        id v6 = 0;
      }
      LOBYTE(v3) = v6 != 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (void)unmarkText
{
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var1 = 1;
    interpretKeyEventsParameters->var3 = 0;
  }
  uint64_t v4 = [(WebHTMLView *)self _frame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      uint64_t v6 = WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      MEMORY[0x1F4172BB0](v6);
    }
  }
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  [(WebHTMLView *)self _executeSavedKeypressCommands];
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var1 = 1;
    interpretKeyEventsParameters->var3 = 0;
  }
  uint64_t v7 = [(WebHTMLView *)self _frame];
  if (!v7) {
    return;
  }
  uint64_t v8 = *(void *)(v7[1] + 8);
  if (!v8 || ![(WebHTMLView *)self _isEditable]) {
    return;
  }
  NSRect v19 = 0;
  uint64_t v20 = 0;
  WebCore::Document::editor(*(WebCore::Document **)(v8 + 296));
  MEMORY[0x1E4E442D0](&v18, a3);
  WebCore::Editor::setComposition();
  NSUInteger v10 = v18;
  double v18 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
    {
      WTF::StringImpl::destroy(v10, v9);
      uint64_t v11 = HIDWORD(v20);
      double v12 = v19;
      if (!HIDWORD(v20))
      {
LABEL_10:
        if (!v12) {
          return;
        }
        goto LABEL_11;
      }
      goto LABEL_14;
    }
    *(_DWORD *)v10 -= 2;
  }
  uint64_t v11 = HIDWORD(v20);
  double v12 = v19;
  if (!HIDWORD(v20)) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v13 = 32 * v11;
  double v14 = (uint64_t *)((char *)v12 + 16);
  do
  {
    uint64_t v16 = *v14;
    v14 += 4;
    uint64_t v15 = v16;
    if ((v16 & 0x8000000000000) != 0)
    {
      double v17 = (unsigned int *)(v15 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v17);
        WTF::fastFree((WTF *)v17, v9);
      }
    }
    v13 -= 32;
  }
  while (v13);
  double v12 = v19;
  if (v19)
  {
LABEL_11:
    NSRect v19 = 0;
    LODWORD(v20) = 0;
    WTF::fastFree(v12, v9);
  }
}

- (void)doCommandBySelector:(SEL)a3
{
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters)
  {
    interpretKeyEventsParameters->var3 = 0;
    var0 = (unsigned int *)interpretKeyEventsParameters->var0;
    BOOL var2 = interpretKeyEventsParameters->var2;
    uint64_t v8 = [(WebHTMLView *)self _frame];
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v9 = 0;
    BOOL v12 = 0;
    char v10 = 1;
    if (!var0) {
      goto LABEL_33;
    }
    goto LABEL_11;
  }
  var0 = 0;
  BOOL var2 = 0;
  uint64_t v8 = [(WebHTMLView *)self _frame];
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v9 = *(void *)(v8[1] + 8);
  char v10 = 1;
  if (v9)
  {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 8), 1u);
    char v10 = 0;
    if (*(void *)(WebCore::Document::editor(*(WebCore::Document **)(v9 + 296)) + 32)) {
      uint64_t v11 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
    }
    else {
      uint64_t v11 = 0;
    }
    BOOL v12 = v11 != 0;
    if (!var0) {
      goto LABEL_33;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (!var0) {
      goto LABEL_33;
    }
  }
LABEL_11:
  if (var2 && !v12)
  {
    uint64_t v13 = NSStringFromSelector(a3);
    MEMORY[0x1E4E442D0](&v38, v13);
    uint64_t v15 = v38;
    if (v38) {
      *(_DWORD *)v38 += 2;
    }
    v34 = v15;
    uint64_t v35 = 0;
    uint64_t v16 = var0[43];
    if (v16 == var0[42])
    {
      double v17 = (WTF::StringImpl **)WTF::Vector<WebCore::KeypressCommand,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(var0 + 40, v16 + 1, (unint64_t)&v34);
      uint64_t v16 = var0[43];
      double v18 = (WTF::StringImpl **)(*((void *)var0 + 20) + 16 * v16);
      uint64_t v15 = *v17;
      *double v17 = 0;
      NSRect v19 = v17 + 1;
    }
    else
    {
      NSRect v19 = &v35;
      double v18 = (WTF::StringImpl **)(*((void *)var0 + 20) + 16 * v16);
      v34 = 0;
    }
    *double v18 = v15;
    uint64_t v20 = *v19;
    *NSRect v19 = 0;
    v18[1] = v20;
    var0[43] = v16 + 1;
    double v21 = v35;
    uint64_t v35 = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2)
      {
        WTF::StringImpl::destroy(v21, v14);
        double v22 = v34;
        v34 = 0;
        if (!v22) {
          goto LABEL_26;
        }
LABEL_24:
        if (*(_DWORD *)v22 == 2)
        {
          WTF::StringImpl::destroy(v22, v14);
          double v23 = v38;
          double v38 = 0;
          if (!v23) {
            goto LABEL_48;
          }
          goto LABEL_29;
        }
        *(_DWORD *)v22 -= 2;
LABEL_26:
        double v23 = v38;
        double v38 = 0;
        if (!v23) {
          goto LABEL_48;
        }
LABEL_29:
        if (*(_DWORD *)v23 == 2) {
          WTF::StringImpl::destroy(v23, v14);
        }
        else {
          *(_DWORD *)v23 -= 2;
        }
        goto LABEL_48;
      }
      *(_DWORD *)v21 -= 2;
    }
    double v22 = v34;
    v34 = 0;
    if (!v22) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_33:
  self->_private->interpretKeyEventsParameters = 0;
  id v24 = [(WebHTMLView *)self _webView];
  if (objc_msgSend((id)objc_msgSend(v24, "_editingDelegateForwarder"), "webView:doCommandBySelector:", v24, a3))
  {
    char v25 = 1;
  }
  else
  {
    [(WebHTMLView *)self coreCommandBySelector:a3];
    if (WebCore::Editor::Command::isSupported((WebCore::Editor::Command *)&v34)) {
      char v25 = WebCore::Editor::Command::execute();
    }
    else {
      char v25 = 0;
    }
    uint64_t v26 = v37;
    uint64_t v37 = 0;
    if (v26)
    {
      FloatSize v27 = (unsigned int *)(v26 + 8);
      if (atomic_fetch_add((atomic_uint *volatile)(v26 + 8), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v27);
        v32 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
        *(void *)v32 = &unk_1F3C797F0;
        *((void *)v32 + 1) = v27;
        double v38 = v32;
        WTF::ensureOnMainThread();
        uint64_t v33 = v38;
        double v38 = 0;
        if (v33) {
          (*(void (**)(WTF::StringImpl *))(*(void *)v33 + 8))(v33);
        }
      }
    }
    uint64_t v28 = v36;
    char v36 = 0;
    if (v28)
    {
      if (*((_DWORD *)v28 + 7) == 2)
      {
        if ((*((_WORD *)v28 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v28);
        }
      }
      else
      {
        *((_DWORD *)v28 + 7) -= 2;
      }
    }
  }
  if (interpretKeyEventsParameters) {
    interpretKeyEventsParameters->var1 |= v25;
  }
  self->_private->interpretKeyEventsParameters = interpretKeyEventsParameters;
LABEL_48:
  if ((v10 & 1) == 0)
  {
    v29 = (unsigned int *)(v9 + 8);
    if (atomic_fetch_add((atomic_uint *volatile)(v9 + 8), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v29);
      uint64_t v30 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
      *(void *)uint64_t v30 = &unk_1F3C797F0;
      *((void *)v30 + 1) = v29;
      v34 = v30;
      WTF::ensureOnMainThread();
      uint64_t v31 = v34;
      v34 = 0;
      if (v31) {
        (*(void (**)(WTF::StringImpl *))(*(void *)v31 + 8))(v31);
      }
    }
  }
}

- (void)insertText:(id)a3
{
  interpretKeyEventsParameters = self->_private->interpretKeyEventsParameters;
  if (interpretKeyEventsParameters) {
    interpretKeyEventsParameters->var3 = 0;
  }
  uint64_t v5 = [(WebHTMLView *)self _frame];
  if (v5)
  {
    uint64_t v6 = *(void *)(v5[1] + 8);
    char v7 = 1;
    if (v6)
    {
      atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 1u);
      char v7 = 0;
      if (*(void *)(WebCore::Document::editor(*(WebCore::Document **)(v6 + 296)) + 32)) {
        uint64_t v8 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
      }
      else {
        uint64_t v8 = 0;
      }
      BOOL v9 = v8 != 0;
      if (!interpretKeyEventsParameters) {
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (!interpretKeyEventsParameters) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
    BOOL v9 = 0;
    char v7 = 1;
    if (!interpretKeyEventsParameters) {
      goto LABEL_23;
    }
  }
  var0 = (unsigned int *)interpretKeyEventsParameters->var0;
  if (interpretKeyEventsParameters->var0) {
    BOOL v11 = !interpretKeyEventsParameters->var2;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    BOOL v9 = 1;
  }
  if (v9)
  {
LABEL_23:
    if (v7) {
      return;
    }
    uint64_t v20 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
    if (WebCore::Editor::canEdit(v20))
    {
      MEMORY[0x1E4E442D0](&v37, a3);
      if (v37)
      {
        WTF::StringImpl::replace();
        double v22 = v37;
        double v40 = v38;
        uint64_t v37 = 0;
        if (v22)
        {
          if (*(_DWORD *)v22 == 2) {
            WTF::StringImpl::destroy(v22, v21);
          }
          else {
            *(_DWORD *)v22 -= 2;
          }
        }
      }
      else
      {
        double v40 = 0;
      }
      if (*(void *)(WebCore::Document::editor(*(WebCore::Document **)(v6 + 296)) + 32)) {
        FloatSize v27 = WTF::RefPtr<WebCore::Text,WTF::RawPtrTraits<WebCore::Text>,WTF::DefaultRefDerefTraits<WebCore::Text>>::unspecifiedBoolTypeInstance;
      }
      else {
        FloatSize v27 = 0;
      }
      uint64_t v28 = *(WebCore::Document **)(v6 + 296);
      if (v27)
      {
        v29 = (WebCore::Editor *)WebCore::Document::editor(v28);
        WebCore::Editor::confirmComposition(v29, (const WTF::String *)&v40);
        char inserted = 1;
      }
      else
      {
        WebCore::Document::editor(v28);
        char inserted = WebCore::Editor::insertText();
      }
      if (interpretKeyEventsParameters) {
        interpretKeyEventsParameters->var1 |= inserted;
      }
      v32 = v40;
      double v40 = 0;
      if (v32)
      {
        if (*(_DWORD *)v32 == 2)
        {
          WTF::StringImpl::destroy(v32, v30);
          uint64_t v33 = (unsigned int *)(v6 + 8);
          unsigned int add = atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 0xFFFFFFFF);
          if (add != 1) {
            return;
          }
          goto LABEL_68;
        }
        *(_DWORD *)v32 -= 2;
      }
    }
    goto LABEL_65;
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  BOOL v12 = v40;
  MEMORY[0x1E4E442D0](&v40, a3);
  if (v12) {
    *(_DWORD *)v12 += 2;
  }
  double v38 = v12;
  double v14 = v40;
  if (v40) {
    *(_DWORD *)v40 += 2;
  }
  double v39 = v14;
  uint64_t v15 = var0[43];
  if (v15 == var0[42])
  {
    uint64_t v16 = (WTF::StringImpl **)WTF::Vector<WebCore::KeypressCommand,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(var0 + 40, v15 + 1, (unint64_t)&v38);
    uint64_t v15 = var0[43];
    double v17 = (WTF::StringImpl **)(*((void *)var0 + 20) + 16 * v15);
    double v18 = *v16;
    *uint64_t v16 = 0;
    NSRect v19 = v16 + 1;
    *double v17 = v18;
  }
  else
  {
    NSRect v19 = &v39;
    double v17 = (WTF::StringImpl **)(*((void *)var0 + 20) + 16 * v15);
    double v38 = 0;
    *double v17 = v12;
  }
  double v23 = *v19;
  *NSRect v19 = 0;
  v17[1] = v23;
  var0[43] = v15 + 1;
  id v24 = v39;
  double v39 = 0;
  if (!v24)
  {
LABEL_33:
    char v25 = v38;
    double v38 = 0;
    if (!v25) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  if (*(_DWORD *)v24 != 2)
  {
    *(_DWORD *)v24 -= 2;
    goto LABEL_33;
  }
  WTF::StringImpl::destroy(v24, v13);
  char v25 = v38;
  double v38 = 0;
  if (!v25) {
    goto LABEL_38;
  }
LABEL_36:
  if (*(_DWORD *)v25 == 2)
  {
    WTF::StringImpl::destroy(v25, v13);
    uint64_t v26 = v40;
    double v40 = 0;
    if (!v26) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  *(_DWORD *)v25 -= 2;
LABEL_38:
  uint64_t v26 = v40;
  double v40 = 0;
  if (!v26)
  {
LABEL_43:
    if (!v12)
    {
LABEL_48:
      if (v7) {
        return;
      }
      goto LABEL_65;
    }
    goto LABEL_46;
  }
LABEL_41:
  if (*(_DWORD *)v26 != 2)
  {
    *(_DWORD *)v26 -= 2;
    goto LABEL_43;
  }
  WTF::StringImpl::destroy(v26, v13);
  if (!v12) {
    goto LABEL_48;
  }
LABEL_46:
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_48;
  }
  WTF::StringImpl::destroy(v12, v13);
  if (v7) {
    return;
  }
LABEL_65:
  uint64_t v33 = (unsigned int *)(v6 + 8);
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 0xFFFFFFFF);
  if (add != 1) {
    return;
  }
LABEL_68:
  atomic_store(add, v33);
  uint64_t v35 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v35 = &unk_1F3C797F0;
  *((void *)v35 + 1) = v33;
  double v38 = v35;
  WTF::ensureOnMainThread();
  char v36 = v38;
  double v38 = 0;
  if (v36) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v36 + 8))(v36);
  }
}

- (CGRect)selectionRect
{
  if ([(WebHTMLView *)self _hasSelection])
  {
    [(WebHTMLView *)self _frame];
    WebCore::FrameSelection::selectionBounds();
    WebCore::FloatRect::operator CGRect();
  }
  else
  {
    double v3 = *MEMORY[0x1E4F28AD8];
    double v4 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)selectionTextRects
{
  if (![(WebHTMLView *)self _hasSelection]) {
    return 0;
  }
  double v3 = [(WebHTMLView *)self _frame];
  if (v3 && *(void *)(v3[1] + 8)) {
    WebCore::FrameSelection::getClippedVisibleTextRectangles();
  }
  return (id)(id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0]);
}

- (CGImage)selectionImageForcingBlackText:(BOOL)a3
{
  if (![(WebHTMLView *)self _hasSelection]) {
    return 0;
  }
  double v4 = [(WebHTMLView *)self _frame];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4[1] + 8);
  if (!v5) {
    return 0;
  }
  atomic_fetch_add((atomic_uint *volatile)(v5 + 8), 1u);
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::Document::updateLayout();
  WebCore::FrameSelection::selectionBounds();
  WebCore::FloatRect::operator CGRect();
  uint64_t v10 = *(void *)(v5 + 24);
  if (!v10
    || (uint64_t v11 = *(void *)(v10 + 8)) == 0
    || (double v12 = v6,
        double v13 = v7,
        double v14 = v8,
        double v15 = v9,
        (uint64_t v16 = (void *)WebCore::ScrollView::documentView(*(WebCore::ScrollView **)(v5 + 288))) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_16:
    CGImageRef Image = 0;
    goto LABEL_17;
  }
  WebCore::LocalFrameView::paintBehavior(*(WebCore::LocalFrameView **)(v5 + 288));
  WebCore::LocalFrameView::setPaintBehavior();
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  float v21 = *(float *)(v11 + 356);
  float v22 = *(float *)(v11 + 364);
  objc_msgSend(v16, "convertRect:toView:", 0, v12, v13, v14, v15);
  double v23 = (WebCore *)objc_msgSend(v16, "convertRect:fromView:", 0);
  double v28 = v27;
  CGImageRef Image = 0;
  if (v27 != 0.0)
  {
    double v30 = v26;
    if (v26 != 0.0)
    {
      double v31 = v24;
      double v32 = v25;
      uint64_t v33 = (CGColorSpace *)WebCore::sRGBColorSpaceRef(v23);
      double v34 = (float)(v21 * v22);
      size_t v35 = (unint64_t)(v28 * v34);
      char v36 = CGBitmapContextCreate(0, v35, (unint64_t)(v30 * v34), 8uLL, 4 * v35, v33, 1u);
      if (v36)
      {
        WKGetCurrentGraphicsContext();
        WKSetCurrentGraphicsContext();
        v42.size.double width = (double)v35;
        v42.size.double height = (double)(unint64_t)(v30 * v34);
        v42.origin.double x = 0.0;
        v42.origin.double y = 0.0;
        CGContextClearRect(v36, v42);
        CGContextSaveGState(v36);
        CGContextScaleCTM(v36, v34, v34);
        CGAffineTransformMakeScale(&v41, v34, v34);
        CGContextSetBaseCTM();
        CGContextTranslateCTM(v36, v18 - v31, v20 - v32);
        objc_msgSend(v16, "drawSingleRect:", v31, v32, v28, v30);
        CGContextRestoreGState(v36);
        CGImageRef Image = CGBitmapContextCreateImage(v36);
        WKSetCurrentGraphicsContext();
        WebCore::LocalFrameView::setPaintBehavior();
        if (Image) {
          CFAutorelease(Image);
        }
        CFRelease(v36);
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
LABEL_17:
  WebCore::LocalFrameView::setPaintBehavior();
  double v38 = (unsigned int *)(v5 + 8);
  if (atomic_fetch_add((atomic_uint *volatile)(v5 + 8), 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v38);
    double v39 = (void *)WTF::fastMalloc((WTF *)0x10);
    *double v39 = &unk_1F3C797F0;
    v39[1] = v38;
    *(void *)&v41.CGFloat a = v39;
    WTF::ensureOnMainThread();
    CGFloat a = v41.a;
    v41.CGFloat a = 0.0;
    if (a != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&a + 8))(COERCE_CGFLOAT(*(void *)&a));
    }
  }
  return Image;
}

- (CGRect)selectionImageRect
{
  if ([(WebHTMLView *)self _hasSelection])
  {
    [(WebHTMLView *)self _frame];
    WebCore::FrameSelection::selectionBounds();
    WebCore::FloatRect::operator CGRect();
  }
  else
  {
    double v3 = *MEMORY[0x1E4F28AD8];
    double v4 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)selectAll
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v4 = *(void *)(v2[1] + 8);
    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(v4 + 296) + 3096);
      MEMORY[0x1F416D8A0](v5, v3);
    }
  }
}

- (void)deselectAll
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      uint64_t v4 = *(void *)(*(void *)(v3 + 296) + 3096);
      MEMORY[0x1F416D880](v4);
    }
  }
}

- (id)string
{
  id v3 = [(WebHTMLView *)self _frame];
  id v4 = [(WebHTMLView *)self _documentRange];
  return (id)[v3 _stringForRange:v4];
}

- (id)selectedString
{
  id v2 = [(WebHTMLView *)self _frame];
  return (id)[v2 _selectedString];
}

- (BOOL)supportsTextEncoding
{
  return 1;
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7
{
  uint64_t v7 = 8;
  if (a4) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 16;
  if (!a6) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v7 | v8 | !a5;
  uint64_t v10 = 32;
  if (!a7) {
    uint64_t v10 = 0;
  }
  return [(WebHTMLView *)self _findString:a3 options:v9 | v10];
}

- (id)elementAtPoint:(CGPoint)a3
{
  return -[WebHTMLView elementAtPoint:allowShadowContent:](self, "elementAtPoint:allowShadowContent:", 0, a3.x, a3.y);
}

- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4
{
  CGPoint v11 = a3;
  id v4 = [(WebHTMLView *)self _frame];
  if (!v4 || !*(void *)(v4[1] + 8)) {
    return 0;
  }
  uint64_t v5 = [WebElementDictionary alloc];
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v9, &v11);
  int8x8_t v6 = (int8x8_t)vcgt_s32(v9[0], (int32x2_t)0xFE000000FE000000);
  v9[1] = (int32x2_t)vorr_s8((int8x8_t)(*(void *)&v6 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, v9[0]), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32(v9[0], 6uLL)), v6));
  WebCore::EventHandler::hitTestResultAtPoint();
  CFTypeRef v7 = (id)CFMakeCollectable([(WebElementDictionary *)v5 initWithHitTestResult:v10]);
  MEMORY[0x1E4E450F0](v10);
  return (id)v7;
}

- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  uint64_t v8 = [(WebHTMLView *)self _frame];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = *(void *)(v8[1] + 8);
  if (!v9) {
    return 0;
  }
  WebCore::Document::editor(*(WebCore::Document **)(v9 + 296));
  MEMORY[0x1E4E442D0](&v17, a3);
  WebCore::makeSimpleRange();
  LODWORD(v10) = WebCore::Editor::countMatchesForText();
  if (v16)
  {
    if (v15)
    {
      if (*((_DWORD *)v15 + 7) == 2)
      {
        if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v15);
        }
      }
      else
      {
        *((_DWORD *)v15 + 7) -= 2;
      }
    }
    if (v14)
    {
      if (*((_DWORD *)v14 + 7) == 2)
      {
        if ((*((_WORD *)v14 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v14);
        }
      }
      else
      {
        *((_DWORD *)v14 + 7) -= 2;
      }
    }
  }
  unint64_t v10 = v10;
  double v12 = v17;
  double v17 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v11);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  return v10;
}

- (void)setMarkedTextMatchesAreHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WebHTMLView *)self _frame];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4[1] + 8);
    if (v5)
    {
      uint64_t v6 = WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      MEMORY[0x1F4172CA8](v6, v3);
    }
  }
}

- (BOOL)markedTextMatchesAreHighlighted
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3) {
      LOBYTE(v2) = *(unsigned char *)(WebCore::Document::editor(*(WebCore::Document **)(v3 + 296)) + 304) != 0;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (void)unmarkAllTextMatches
{
  id v2 = [(WebHTMLView *)self _frame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[1] + 8);
    if (v3)
    {
      id v4 = *(WebCore::Document **)(v3 + 296);
      if (v4)
      {
        if (*((void *)v4 + 192))
        {
        }
        else
        {
          WebCore::Document::ensureMarkers(v4);
        }
        WebCore::DocumentMarkerController::removeMarkers();
      }
    }
  }
}

- (id)rectsForTextMatches
{
  id v2 = [(WebHTMLView *)self _frame];
  if (!v2) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v3 = *(void *)(v2[1] + 8);
  if (!v3) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  id v4 = *(WebCore::Document **)(v3 + 296);
  if (!v4) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  if (!*((void *)v4 + 192)) {
    WebCore::Document::ensureMarkers(v4);
  }
  WebCore::DocumentMarkerController::renderedRectsForMarkers();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  if (v14)
  {
    CFTypeRef v7 = v13;
    uint64_t v8 = 16 * v14;
    do
    {
      uint64_t NSArrayElement = WebCore::makeNSArrayElement(v7, v5);
      if (NSArrayElement) {
        [v6 addObject:NSArrayElement];
      }
      CFTypeRef v7 = (WebCore *)((char *)v7 + 16);
      v8 -= 16;
    }
    while (v8);
  }
  CFTypeRef v10 = (id)CFMakeCollectable(v6);
  if (!v13) {
    return (id)v10;
  }
  WTF::fastFree(v13, v12);
  return (id)v10;
}

- (BOOL)_findString:(id)a3 options:(unint64_t)a4
{
  if (![a3 length]) {
    return 0;
  }
  uint64_t v6 = [(WebHTMLView *)self _frame];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = *(void *)(v6[1] + 8);
  if (!v7) {
    return 0;
  }
  WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
  MEMORY[0x1E4E442D0](&v12, a3);
  char String = WebCore::Editor::findString();
  CFTypeRef v10 = v12;
  double v12 = 0;
  if (!v10) {
    return String;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return String;
  }
  WTF::StringImpl::destroy(v10, v8);
  return String;
}

- (int64_t)writingToolsBehavior
{
  return -1;
}

- (BOOL)providesWritingToolsContextMenu
{
  return 1;
}

@end