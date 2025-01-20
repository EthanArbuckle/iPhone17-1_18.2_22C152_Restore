@interface WebFrame
+ (Ref<WebCore::LocalFrame,)_createFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5 ownerElement:(void *)a6;
+ (Ref<WebCore::LocalFrame,)_createSubframeWithOwnerElement:(void *)a3 page:(void *)a4 frameName:(const void *)a5 frameView:(id)a6;
+ (id)stringWithData:(id)a3 textEncodingName:(id)a4;
+ (void)_createMainFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5;
+ (void)_createMainFrameWithSimpleHTMLDocumentWithPage:(void *)a3 frameView:(id)a4 style:(id)a5;
- (BOOL)_allowsFollowingLink:(id)a3;
- (BOOL)_canProvideDocumentSource;
- (BOOL)_firstLayoutDone;
- (BOOL)_getVisibleRect:(CGRect *)a3;
- (BOOL)_hasSelection;
- (BOOL)_isCommitting;
- (BOOL)_isDescendantOfFrame:(id)a3;
- (BOOL)_isDisplayingStandaloneImage;
- (BOOL)_isFrameSet;
- (BOOL)_isIncludedInWebKitStatistics;
- (BOOL)_isVisuallyNonEmpty;
- (BOOL)_loadsSynchronously;
- (BOOL)_needsLayout;
- (BOOL)enhancedAccessibilityEnabled;
- (BOOL)focusedNodeHasContent;
- (BOOL)hasEditableSelection;
- (BOOL)hasRichlyEditableDragCaret;
- (BOOL)hasRichlyEditableSelection;
- (BOOL)hasSelection;
- (BOOL)isTelephoneNumberParsingAllowed;
- (BOOL)isTelephoneNumberParsingEnabled;
- (BOOL)needsLayout;
- (BOOL)renderedCharactersExceed:(unint64_t)a3;
- (BOOL)selectionAtDocumentStart;
- (BOOL)selectionAtSentenceStart;
- (BOOL)selectionAtWordStart;
- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5;
- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5;
- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5 allowFlipping:(BOOL)a6;
- (BOOL)spaceFollowsWordInRange:(id)a3;
- (CGColor)_bodyBackgroundColor;
- (CGColor)caretColor;
- (CGRect)_caretRectAtPosition:(const void *)a3 affinity:(unint64_t)a4;
- (CGRect)_firstRectForDOMRange:(id)a3;
- (CGRect)caretRect;
- (CGRect)caretRectAtNode:(id)a3 offset:(int)a4 affinity:(unint64_t)a5;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3;
- (CGRect)elementRectAtPoint:(CGPoint)a3;
- (CGRect)rectForScrollToVisible;
- (CGRect)renderRectForPoint:(CGPoint)a3 isReplaced:(BOOL *)a4 fontSize:(float *)a5;
- (CGSize)renderedSizeOfNode:(id)a3 constrainedToWidth:(float)a4;
- (DOMDocument)DOMDocument;
- (DOMHTMLElement)frameElement;
- (JSContext)javaScriptContext;
- (JSGlobalContextRef)globalContext;
- (NSArray)childFrames;
- (NSString)name;
- (OpaqueJSContext)_globalContextForScriptWorld:(id)a3;
- (OpaqueJSValue)jsWrapperForNode:(id)a3 inScriptWorld:(id)a4;
- (OptionSet<WebCore::PaintBehavior>)_paintBehaviorForDestinationContext:(CGContext *)a3;
- (VisiblePosition)_visiblePositionForPoint:(SEL)a3;
- (VisiblePosition)closestWordBoundary:(SEL)a3;
- (VisiblePosition)visiblePositionForPoint:(SEL)a3;
- (WebDataSource)dataSource;
- (WebDataSource)provisionalDataSource;
- (WebFrame)findFrameNamed:(NSString *)name;
- (WebFrame)init;
- (WebFrame)initWithName:(NSString *)name webFrameView:(WebFrameView *)view webView:(WebView *)webView;
- (WebFrame)parentFrame;
- (WebFrameView)frameView;
- (WebScriptObject)windowObject;
- (WebView)webView;
- (_NSRange)_convertDOMRangeToNSRange:(id)a3;
- (_NSRange)_convertToNSRange:(const void *)a3;
- (_NSRange)_selectedNSRange;
- (__CTFont)fontForSelection:(BOOL *)a3;
- (id)_cacheabilityDictionary;
- (id)_characterRangeAtPoint:(CGPoint)a3;
- (id)_computePageRectsWithPrintScaleFactor:(float)a3 pageSize:(CGSize)a4;
- (id)_convertNSRangeToDOMRange:(_NSRange)a3;
- (id)_dataSource;
- (id)_documentFragmentForImageData:(id)a3 withRelativeURLPart:(id)a4 andMIMEType:(id)a5;
- (id)_documentFragmentForText:(id)a3;
- (id)_documentFragmentForWebArchive:(id)a3;
- (id)_documentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4;
- (id)_documentFragmentWithNodesAsParagraphs:(id)a3;
- (id)_findFrameWithSelection;
- (id)_initWithWebFrameView:(id)a3 webView:(id)a4;
- (id)_internalLoadDelegate;
- (id)_javaScriptContextForScriptWorld:(id)a3;
- (id)_layerTreeAsText;
- (id)_markDOMRange;
- (id)_rectsForRange:(id)a3;
- (id)_selectedString;
- (id)_selectionRangeForFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (id)_selectionRangeForPoint:(CGPoint)a3;
- (id)_stringByEvaluatingJavaScriptFromString:(id)a3;
- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 forceUserGesture:(BOOL)a4;
- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 withGlobalObject:(OpaqueJSValue *)a4 inScriptWorld:(id)a5;
- (id)_stringForRange:(id)a3;
- (id)_typingStyle;
- (id)_unreachableURL;
- (id)_webHTMLDocumentView;
- (id)accessibilityRoot;
- (id)approximateNodeAtViewportLocation:(CGPoint *)a3;
- (id)deepestNodeAtViewportLocation:(CGPoint)a3;
- (id)dictationResultMetadataForRange:(id)a3;
- (id)documentView;
- (id)elementAtPoint:(CGPoint)a3;
- (id)elementRangeContainingCaretSelection;
- (id)endPosition;
- (id)interpretationsForCurrentRoot;
- (id)markedTextDOMRange;
- (id)rangeByExtendingCurrentSelection:(int)a3;
- (id)rangeByMovingCurrentSelection:(int)a3;
- (id)renderTreeAsExternalRepresentationForPrinting;
- (id)renderTreeAsExternalRepresentationWithOptions:(unint64_t)a3;
- (id)scrollableNodeAtViewportLocation:(CGPoint)a3;
- (id)selectedDOMRange;
- (id)selectionRects;
- (id)selectionRectsForCoreRange:(const void *)a3;
- (id)selectionRectsForRange:(id)a3;
- (id)startPosition;
- (id)webVisiblePositionForPoint:(CGPoint)a3;
- (id)wordAtPoint:(CGPoint)a3;
- (id)wordInRange:(id)a3;
- (id)wordRangeContainingCaretSelection;
- (id)wordsInCurrentParagraph;
- (int)_loadType;
- (int)innerLineHeight:(id)a3;
- (int)layoutCount;
- (int)numberOfPagesWithPageWidth:(float)a3 pageHeight:(float)a4;
- (int)preferredHeight;
- (int)selectionBaseWritingDirection;
- (int)selectionState;
- (int)wordOffsetInRange:(id)a3;
- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3;
- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3 rangeIsRelativeTo:(_NSRange)a4;
- (unint64_t)selectionAffinity;
- (unsigned)_pendingFrameUnloadEventCount;
- (unsigned)_selectionGranularity;
- (unsigned)characterAfterCaretSelection;
- (unsigned)characterBeforeCaretSelection;
- (unsigned)characterInRelationToCaretSelection:(int)a3;
- (void)_attachScriptDebugger;
- (void)_clearCoreFrame;
- (void)_clearOpener;
- (void)_clearSelection;
- (void)_clearSelectionInOtherFrames;
- (void)_commitData:(id)a3;
- (void)_createCaptionPreferencesTestingModeToken;
- (void)_detachScriptDebugger;
- (void)_dispatchDidReceiveTitle:(id)a3;
- (void)_drawRect:(CGRect)a3 contentsOnly:(BOOL)a4;
- (void)_generateTestReport:(id)a3 withGroup:(id)a4;
- (void)_handleKeyEvent:(id)a3;
- (void)_insertParagraphSeparatorInQuotedContent;
- (void)_loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 unreachableURL:(id)a7;
- (void)_loadHTMLString:(id)a3 baseURL:(id)a4 unreachableURL:(id)a5;
- (void)_replaceSelectionWithFragment:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6;
- (void)_replaceSelectionWithMarkupString:(id)a3 baseURLString:(id)a4 selectReplacement:(BOOL)a5 smartReplace:(BOOL)a6;
- (void)_replaceSelectionWithNode:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6;
- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5;
- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6;
- (void)_replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5;
- (void)_restoreViewState;
- (void)_saveViewState;
- (void)_scrollDOMRangeToVisible:(id)a3;
- (void)_scrollDOMRangeToVisible:(id)a3 withInset:(double)a4;
- (void)_selectAll;
- (void)_selectNSRange:(_NSRange)a3;
- (void)_setCaptionDisplayMode:(id)a3;
- (void)_setInternalLoadDelegate:(id)a3;
- (void)_setIsCommitting:(BOOL)a3;
- (void)_setLoadsSynchronously:(BOOL)a3;
- (void)_setProhibitsScrolling:(BOOL)a3;
- (void)_setSelectionFromNone;
- (void)_setShouldCreateRenderers:(BOOL)a3;
- (void)_setTextAutosizingWidth:(double)a3;
- (void)_setTypingStyle:(id)a3 withUndoAction:(unsigned __int8)a4;
- (void)_unmarkAllBadGrammar;
- (void)_updateBackgroundAndUpdatesWhileOffscreen;
- (void)_userScrolled;
- (void)aggressivelyExpandSelectionToWordContainingCaretSelection;
- (void)clearRangedSelectionInitialExtent;
- (void)clearSelection;
- (void)collapseSelection;
- (void)confirmMarkedText:(id)a3;
- (void)coreFrame;
- (void)dealloc;
- (void)deviceOrientationChanged;
- (void)ensureRangedSelectionContainsInitialStartPoint:(CGPoint)a3 initialEndPoint:(CGPoint)a4;
- (void)expandSelectionToElementContainingCaretSelection;
- (void)expandSelectionToSentence;
- (void)expandSelectionToStartOfWordContainingCaretSelection;
- (void)expandSelectionToWordContainingCaretSelection;
- (void)extendSelection:(BOOL)a3;
- (void)forceLayoutAdjustingViewSize:(BOOL)a3;
- (void)getDictationResultRanges:(id *)a3 andMetadatas:(id *)a4;
- (void)loadAlternateHTMLString:(NSString *)string baseURL:(NSURL *)baseURL forUnreachableURL:(NSURL *)unreachableURL;
- (void)loadArchive:(WebArchive *)archive;
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)encodingName baseURL:(NSURL *)URL;
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)URL;
- (void)loadRequest:(NSURLRequest *)request;
- (void)moveSelectionToEnd;
- (void)moveSelectionToPoint:(CGPoint)a3;
- (void)moveSelectionToStart;
- (void)prepareForPause;
- (void)printToCGContext:(CGContext *)a3 pageWidth:(float)a4 pageHeight:(float)a5;
- (void)recursiveSetUpdateAppearanceEnabled:(BOOL)a3;
- (void)reload;
- (void)reloadFromOrigin;
- (void)removeUnchangeableStyles;
- (void)resetSelection;
- (void)resetTextAutosizingBeforeLayout;
- (void)resumeFromPause;
- (void)revealSelectionAtExtent:(BOOL)a3;
- (void)selectNSRange:(_NSRange)a3 onElement:(id)a4;
- (void)selectWithoutClosingTypingNSRange:(_NSRange)a3;
- (void)sendScrollEvent;
- (void)setAccessibleName:(id)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setCaretColor:(CGColor *)a3;
- (void)setDictationPhrases:(id)a3 metadata:(id)a4 asChildOfElement:(id)a5;
- (void)setEnhancedAccessibility:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMarkedText:(id)a3 forCandidates:(BOOL)a4;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setNeedsLayout;
- (void)setPluginsPaused:(BOOL)a3;
- (void)setRangedSelectionBaseToCurrentSelection;
- (void)setRangedSelectionBaseToCurrentSelectionEnd;
- (void)setRangedSelectionBaseToCurrentSelectionStart;
- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd;
- (void)setRangedSelectionInitialExtentToCurrentSelectionStart;
- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3;
- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5;
- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5 userTriggered:(BOOL)a6;
- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3;
- (void)setSelectionGranularity:(int)a3;
- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (void)setText:(id)a3 asChildOfElement:(id)a4;
- (void)setTimeoutsPaused:(BOOL)a3;
- (void)smartExtendRangedSelection:(int)a3;
- (void)stopLoading;
- (void)toggleBaseWritingDirection;
- (void)updateLayout;
@end

@implementation WebFrame

+ (Ref<WebCore::LocalFrame,)_createFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5 ownerElement:(void *)a6
{
  v10 = v6;
  if ((*(uint64_t (**)(void, SEL))(**(void **)(*((void *)a3 + 6) + 16) + 1368))(*(void *)(*((void *)a3 + 6) + 16), a2))id Weak = 0; {
  else
  }
    id Weak = objc_loadWeak((id *)(*(void *)(*((void *)a3 + 6) + 16) + 16));
  v12 = (void *)[objc_alloc((Class)a1) _initWithWebFrameView:a5 webView:Weak];
  v13 = v12;
  if (v12) {
    CFRetain(v12);
  }
  v14 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v14 = &unk_1F3C7AC18;
  v14[1] = v13;
  v21 = v14;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>::m_generationProtected)
  {
    v20.var0 = (LocalFrame *)138;
    __break(0xC471u);
  }
  else
  {
    IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
    WebCore::Process::identifier(IdentifierInternal);
    WebCore::LocalFrame::createSubframe();
    if (v21) {
      (*(void (**)(void *))(*v21 + 8))(v21);
    }
    *(void *)(v13[1] + 8) = *v10;
    WebCore::FrameTree::setSpecifiedName();
    WebCore::LocalFrame::init(*v10);
    [Weak _realZoomMultiplier];
    int v17 = v16;
    uint64_t v18 = [Weak _realZoomMultiplierIsTextOnly];
    LODWORD(v19) = v17;
    [Weak _setZoomMultiplier:v18 isTextOnly:v19];
    CFRelease(v13);
  }
  return v20;
}

+ (void)_createMainFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5
{
  if (a3
    && ((*(uint64_t (**)(void, SEL, void *, const void *))(**(void **)(*((void *)a3 + 6) + 16) + 1368))(*(void *)(*((void *)a3 + 6) + 16), a2, a3, a4) & 1) == 0)
  {
    id Weak = objc_loadWeak((id *)(*(void *)(*((void *)a3 + 6) + 16) + 16));
  }
  else
  {
    id Weak = 0;
  }
  v9 = (void *)[objc_alloc((Class)a1) _initWithWebFrameView:a5 webView:Weak];
  v10 = v9;
  uint64_t v11 = *((void *)a3 + 20);
  if (v11) {
    BOOL v12 = *(unsigned char *)(v11 + 144) == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    *(void *)(v9[1] + 8) = v11;
    uint64_t v13 = *(void *)(*(void *)(v11 + 280) + 16);
    CFRetain(v9);
    v14 = *(const void **)(v13 + 16);
    *(void *)(v13 + 16) = v10;
    if (v14) {
      CFRelease(v14);
    }
    WebCore::FrameTree::setSpecifiedName();
    WebCore::LocalFrame::init((WebCore::LocalFrame *)v11);
    [Weak _realZoomMultiplier];
    int v16 = v15;
    uint64_t v17 = [Weak _realZoomMultiplierIsTextOnly];
    LODWORD(v18) = v16;
    [Weak _setZoomMultiplier:v17 isTextOnly:v18];
  }
  else if (!v9)
  {
    return;
  }
  CFRelease(v10);
}

+ (Ref<WebCore::LocalFrame,)_createSubframeWithOwnerElement:(void *)a3 page:(void *)a4 frameName:(const void *)a5 frameView:(id)a6
{
  if (a1) {
    return (Ref<WebCore::LocalFrame, WTF::RawPtrTraits<WebCore::LocalFrame>, WTF::DefaultRefDerefTraits<WebCore::LocalFrame>>)[a1 _createFrameWithPage:a4 frameName:a5 frameView:a6 ownerElement:a3];
  }
  else {
    void *v6 = 0;
  }
  return (Ref<WebCore::LocalFrame, WTF::RawPtrTraits<WebCore::LocalFrame>, WTF::DefaultRefDerefTraits<WebCore::LocalFrame>>)a1;
}

- (BOOL)_isIncludedInWebKitStatistics
{
  v2 = self->_private;
  return v2 && v2->includedInWebKitStatistics;
}

+ (void)_createMainFrameWithSimpleHTMLDocumentWithPage:(void *)a3 frameView:(id)a4 style:(id)a5
{
  uint64_t v5 = *((void *)a3 + 20);
  if (v5) {
    BOOL v6 = *(unsigned char *)(v5 + 144) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if ((*(uint64_t (**)(void, SEL))(**(void **)(*((void *)a3 + 6) + 16) + 1368))(*(void *)(*((void *)a3 + 6) + 16), a2))id Weak = 0; {
    else
    }
      id Weak = objc_loadWeak((id *)(*(void *)(*((void *)a3 + 6) + 16) + 16));
    BOOL v12 = (void *)[objc_alloc((Class)a1) _initWithWebFrameView:a4 webView:Weak];
    *(void *)(v12[1] + 8) = v5;
    uint64_t v13 = *(void *)(*(void *)(v5 + 280) + 16);
    CFRetain(v12);
    int v15 = *(const void **)(v13 + 16);
    *(void *)(v13 + 16) = v12;
    if (v15) {
      CFRelease(v15);
    }
    WTF::AtomStringImpl::add((uint64_t *)v20, (WTF::AtomStringImpl *)a5, v14);
    v21 = v20[0];
    uint64_t UniqueWebDataURL = createUniqueWebDataURL();
    MEMORY[0x1E4E441F0](v20, UniqueWebDataURL);
    WebCore::LocalFrame::initWithSimpleHTMLDocument();
    double v18 = v20[0];
    v20[0] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
      {
        WTF::StringImpl::destroy(v18, v17);
        double v19 = v21;
        v21 = 0;
        if (!v19)
        {
LABEL_20:
          CFRelease(v12);
          return;
        }
LABEL_17:
        if (*(_DWORD *)v19 == 2) {
          WTF::StringImpl::destroy(v19, v17);
        }
        else {
          *(_DWORD *)v19 -= 2;
        }
        goto LABEL_20;
      }
      *(_DWORD *)v18 -= 2;
    }
    double v19 = v21;
    v21 = 0;
    if (!v19) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
}

- (void)_attachScriptDebugger
{
  v3 = (WebCore::WindowProxy *)*((void *)self->_private->coreFrame.m_ptr + 14);
  v4 = (WebCore *)WebCore::mainThreadNormalWorld((WebCore *)self);
  uint64_t v5 = **((void **)v3 + 2);
  if (v5)
  {
    unsigned int v6 = *(_DWORD *)(v5 - 8);
    unint64_t v7 = ((unint64_t)v4 + ~((void)v4 << 32)) ^ (((unint64_t)v4 + ~((void)v4 << 32)) >> 22);
    unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    uint64_t v10 = v6 & ((v9 >> 31) ^ v9);
    uint64_t v11 = *(WebCore **)(v5 + 16 * v10);
    if (v11 == v4)
    {
LABEL_6:
      if (v10 != *(_DWORD *)(v5 - 4))
      {
        uint64_t v13 = *(void **)(v5 + 16 * v10 + 8);
        if (v13)
        {
          if (*v13)
          {
            CFStringRef v14 = (DOMWrapperWorld *)WebCore::mainThreadNormalWorld(v4);
            uint64_t v15 = WebCore::WindowProxy::globalObject(v3, v14);
            if (v15)
            {
              if (!self->_private->scriptDebugger.__ptr_.__value_)
              {
                uint64_t v16 = v15;
                uint64_t v17 = (JSC::Debugger *)WTF::fastMalloc((WTF *)0xF8);
                WebScriptDebugger::WebScriptDebugger(v17, v16);
                double v18 = self->_private;
                value = v18->scriptDebugger.__ptr_.__value_;
                v18->scriptDebugger.__ptr_.__value_ = (WebScriptDebugger *)v17;
                if (value)
                {
                  uint64_t v20 = *((void *)value + 30);
                  if (v20)
                  {
                    v21 = (uint64_t *)(v20 - 16);
                    uint64_t v22 = *(void *)(((v20 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
                    v23 = *(uint64_t **)(v20 - 8);
                    if (v23)
                    {
                      uint64_t v24 = *v21;
                      uint64_t *v23 = *v21;
                      *(void *)(v24 + 8) = v23;
                      uint64_t *v21 = 0;
                      v21[1] = 0;
                    }
                    uint64_t *v21 = *(void *)(v22 + 40);
                    *(void *)(v22 + 40) = v21;
                    *((void *)value + 30) = 0;
                  }
                  JSC::Debugger::~Debugger((JSC::Debugger *)value);
                  WTF::fastFree(v25, v26);
                }
              }
            }
          }
        }
      }
    }
    else
    {
      int v12 = 1;
      while (v11)
      {
        uint64_t v10 = (v10 + v12) & v6;
        uint64_t v11 = *(WebCore **)(v5 + 16 * v10);
        ++v12;
        if (v11 == v4) {
          goto LABEL_6;
        }
      }
    }
  }
}

- (void)_detachScriptDebugger
{
  v2 = self->_private;
  value = v2->scriptDebugger.__ptr_.__value_;
  v2->scriptDebugger.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *((void *)value + 30);
    if (v4)
    {
      uint64_t v5 = (uint64_t *)(v4 - 16);
      uint64_t v6 = *(void *)(((v4 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
      unint64_t v7 = *(uint64_t **)(v4 - 8);
      if (v7)
      {
        uint64_t v8 = *v5;
        *unint64_t v7 = *v5;
        *(void *)(v8 + 8) = v7;
        *uint64_t v5 = 0;
        v5[1] = 0;
      }
      *uint64_t v5 = *(void *)(v6 + 40);
      *(void *)(v6 + 40) = v5;
      *((void *)value + 30) = 0;
    }
    JSC::Debugger::~Debugger((JSC::Debugger *)value);
    WTF::fastFree(v9, v10);
  }
}

- (id)_initWithWebFrameView:(id)a3 webView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WebFrame;
  uint64_t v5 = [(WebFrame *)&v8 init];
  if (v5)
  {
    v5->_private = objc_alloc_init(WebFramePrivate);
    int v6 = [(id)objc_opt_class() shouldIncludeInWebKitStatistics];
    v5->_private->includedInWebKitStatistics = v6;
    if (v6) {
      ++WebFrameCount;
    }
    if (a3)
    {
      [(WebFramePrivate *)v5->_private setWebFrameView:a3];
      [a3 _setWebFrame:v5];
    }
    v5->_private->shouldCreateRenderers = 1;
  }
  return v5;
}

- (void)_clearCoreFrame
{
  self->_private->coreFrame.m_ptr = 0;
}

- (id)_webHTMLDocumentView
{
  v2 = (void *)[self->_private->webFrameView.m_ptr documentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)_updateBackgroundAndUpdatesWhileOffscreen
{
  if (!self) {
    goto LABEL_6;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    goto LABEL_6;
  }
  uint64_t v4 = *((void *)m_ptr + 3);
  if (!v4) {
    goto LABEL_6;
  }
  id Weak = *(void **)(v4 + 8);
  if (!Weak) {
    goto LABEL_7;
  }
  if (((*(uint64_t (**)(void, SEL))(**(void **)(Weak[6] + 16) + 1368))(*(void *)(Weak[6] + 16), a2) & 1) == 0)id Weak = objc_loadWeak((id *)(*(void *)(Weak[6] + 16) + 16)); {
  else
  }
LABEL_6:
    id Weak = 0;
LABEL_7:
  char v6 = [Weak drawsBackground];
  uint64_t v7 = [Weak backgroundColor];
  objc_super v8 = self->_private;
  unint64_t v9 = (const WebCore::Frame *)v8->coreFrame.m_ptr;
  if (v9)
  {
    uint64_t v10 = (WebCore *)v7;
    uint64_t v11 = (uint64_t)v8->coreFrame.m_ptr;
    while (*(unsigned char *)(v11 + 144))
    {
LABEL_9:
      uint64_t v11 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v11 + 48), v9);
      if (!v11) {
        return;
      }
    }
    int v12 = *(void **)(*(void *)(v11 + 280) + 16);
    if ((*(uint64_t (**)(void *))(*v12 + 1072))(v12))
    {
      uint64_t v13 = 0;
      if (v6)
      {
LABEL_16:
        CFStringRef v14 = *(WebCore::LocalFrameView **)(v11 + 288);
        if (v14)
        {
          WebCore::LocalFrameView::setTransparent(*(WebCore::LocalFrameView **)(v11 + 288));
          uint64_t v16 = WebCore::roundAndClampToSRGBALossy(v10, v15);
          uint64_t v17 = bswap32(v16) | 0x1104000000000000;
          if (!BYTE4(v16)) {
            uint64_t v17 = 0;
          }
          uint64_t v20 = v17;
          WebCore::LocalFrameView::setBaseBackgroundColor();
          [Weak shouldUpdateWhileOffscreen];
          WebCore::LocalFrameView::setShouldUpdateWhileOffscreen(v14);
          if ((v20 & 0x8000000000000) != 0)
          {
            double v19 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFLL);
            if (atomic_fetch_add((atomic_uint *volatile)(v20 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v19);
              WTF::fastFree((WTF *)v19, v18);
            }
          }
        }
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v13 = (void *)v12[2];
      if (v6) {
        goto LABEL_16;
      }
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "frameView"), "_scrollView"), "setDrawsBackground:", 0);
    goto LABEL_16;
  }
}

- (void)_setInternalLoadDelegate:(id)a3
{
  self->_private->internalLoadDelegate = a3;
}

- (id)_internalLoadDelegate
{
  return self->_private->internalLoadDelegate;
}

- (void)_unmarkAllBadGrammar
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v3 = self->_private->coreFrame.m_ptr;
    do
    {
      if (!*((unsigned char *)v3 + 144))
      {
        uint64_t v4 = (WebCore::Document *)*((void *)v3 + 37);
        if (v4)
        {
          if (!*((void *)v4 + 192)) {
            WebCore::Document::ensureMarkers(v4);
          }
          WebCore::DocumentMarkerController::removeMarkers();
        }
      }
      v3 = (LocalFrame *)WebCore::FrameTree::traverseNext((WebCore::FrameTree *)((char *)v3 + 48), (const WebCore::Frame *)m_ptr);
    }
    while (v3);
  }
}

- (BOOL)_hasSelection
{
  v3 = (void *)[self->_private->webFrameView.m_ptr documentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (m_ptr = self->_private->coreFrame.m_ptr) != 0)
  {
    LOBYTE(v5) = *(unsigned char *)(*(void *)(*((void *)m_ptr + 37) + 3096) + 153) == 2;
  }
  else
  {
    int v5 = [v3 conformsToProtocol:&unk_1F3CAAAF8];
    if (v5) {
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(v3, "selectedString"), "length") != 0;
    }
  }
  return v5;
}

- (void)_clearSelection
{
  v2 = (void *)[self->_private->webFrameView.m_ptr documentView];
  if ([v2 conformsToProtocol:&unk_1F3CAAAF8])
  {
    [v2 deselectAll];
  }
}

- (id)_findFrameWithSelection
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v3 = self->_private->coreFrame.m_ptr;
    do
    {
      if (!*((unsigned char *)v3 + 144))
      {
        int v5 = *(void **)(*((void *)v3 + 35) + 16);
        if ((*(uint64_t (**)(void *, SEL))(*v5 + 1072))(v5, a2))
        {
          uint64_t v4 = 0;
          if ([0 _hasSelection]) {
            return v4;
          }
        }
        else
        {
          uint64_t v4 = (void *)v5[2];
          if ([v4 _hasSelection]) {
            return v4;
          }
        }
      }
      v3 = (LocalFrame *)WebCore::FrameTree::traverseNext((WebCore::FrameTree *)((char *)v3 + 48), (const WebCore::Frame *)m_ptr);
    }
    while (v3);
  }
  return 0;
}

- (void)_clearSelectionInOtherFrames
{
  v2 = self;
  if (!self)
  {
LABEL_9:
    char v6 = (WebFrame *)objc_msgSend((id)-[WebFrame mainFrame](self, "mainFrame"), "_findFrameWithSelection");
    if (v6 == v2) {
      return;
    }
    goto LABEL_10;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr || (uint64_t v4 = *((void *)m_ptr + 3)) == 0)
  {
LABEL_6:
    char v6 = (WebFrame *)objc_msgSend((id)objc_msgSend(0, "mainFrame"), "_findFrameWithSelection");
    if (v6 == v2) {
      return;
    }
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)(v4 + 8);
  if (!v5)
  {
    self = 0;
    goto LABEL_9;
  }
  if ((*(uint64_t (**)(void, SEL))(**(void **)(*(void *)(v5 + 48) + 16) + 1368))(*(void *)(*(void *)(v5 + 48) + 16), a2))goto LABEL_6; {
  char v6 = (WebFrame *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(void *)(*(void *)(v5 + 48) + 16) + 16)), "mainFrame"), "_findFrameWithSelection");
  }
  if (v6 == v2) {
    return;
  }
LABEL_10:
  [(WebFrame *)v6 _clearSelection];
}

- (id)_dataSource
{
  uint64_t v2 = *(void *)(*((void *)self->_private->coreFrame.m_ptr + 35) + 88);
  if (v2) {
    return *(id *)(v2 + 3568);
  }
  else {
    return 0;
  }
}

- (BOOL)_isCommitting
{
  return self->_private->isCommitting;
}

- (void)_setIsCommitting:(BOOL)a3
{
  self->_private->isCommitting = a3;
}

- (id)_selectedString
{
  m_ptr = self->_private->coreFrame.m_ptr;
  v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  WebCore::Editor::selectedText((uint64_t *)&v9, v3);
  WebCore::LocalFrame::displayStringModifiedByEncoding((uint64_t *)&v10, (WebCore::LocalFrame *)m_ptr, (const WTF::String *)&v9);
  if (v10)
  {
    uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    char v6 = v10;
    uint64_t v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
        uint64_t v7 = v9;
        unint64_t v9 = 0;
        if (!v7) {
          return v5;
        }
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        uint64_t v7 = v9;
        unint64_t v9 = 0;
        if (!v7) {
          return v5;
        }
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v5 = &stru_1F3C7DA90;
  }
  uint64_t v7 = v9;
  unint64_t v9 = 0;
  if (!v7) {
    return v5;
  }
LABEL_8:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v7, v4);
  return v5;
}

- (id)_stringForRange:(id)a3
{
  if (!a3) {
    return &stru_1F3C7DA90;
  }
  WebCore::makeSimpleRange();
  WebCore::plainText();
  if (v9)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      uint64_t v5 = v8;
      if (!v8) {
        goto LABEL_14;
      }
LABEL_9:
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
      goto LABEL_14;
    }
    WTF::StringImpl::destroy(v9, v3);
    uint64_t v5 = v8;
    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = &stru_1F3C7DA90;
    uint64_t v5 = v8;
    if (v8) {
      goto LABEL_9;
    }
  }
LABEL_14:
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

- (OptionSet<WebCore::PaintBehavior>)_paintBehaviorForDestinationContext:(CGContext *)a3
{
  if (CGContextGetType() == 4 || CGContextGetType() == 6)
  {
    id v4 = [(WebFrame *)self _webHTMLDocumentView];
    if (v4)
    {
      if (objc_msgSend((id)objc_msgSend(v4, "window"), "isInSnapshottingPaint")) {
        return (OptionSet<WebCore::PaintBehavior>)0x20000;
      }
      else {
        return (OptionSet<WebCore::PaintBehavior>)0;
      }
    }
    else
    {
      return (OptionSet<WebCore::PaintBehavior>)132096;
    }
  }
  else
  {
    return (OptionSet<WebCore::PaintBehavior>)0;
  }
}

- (void)_drawRect:(CGRect)a3 contentsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CGRect v10 = a3;
  uint64_t v6 = WKGetCurrentGraphicsContext();
  WebCore::GraphicsContextCG::GraphicsContextCG();
  WebCore::LocalFrameView::paintBehavior(*((WebCore::LocalFrameView **)self->_private->coreFrame.m_ptr + 36));
  uint64_t v7 = WebCore::FrameTree::parent((WebCore::FrameTree *)((char *)self->_private->coreFrame.m_ptr + 48));
  if (v7 && !*(unsigned char *)(v7 + 144))
  {
    unint64_t v9 = *(WebCore::LocalFrameView **)(v7 + 288);
    if (v9) {
      WebCore::LocalFrameView::paintBehavior(v9);
    }
  }
  else
  {
    [(WebFrame *)self _paintBehaviorForDestinationContext:v6];
  }
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::enclosingIntRect((WebCore *)&v10, v8);
  if (v4) {
    WebCore::LocalFrameView::paintContents();
  }
  else {
    WebCore::ScrollView::paint();
  }
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v11);
}

- (BOOL)_getVisibleRect:(CGRect *)a3
{
  BOOL v4 = (WebCore::RenderObject *)WebCore::Frame::ownerRenderer((WebCore::Frame *)self->_private->coreFrame.m_ptr);
  uint64_t v6 = v4;
  if (v4)
  {
    if ((*((unsigned char *)v4 + 20) & 0xF8) != 0)
    {
      char v5 = 0;
    }
    else
    {
      WebCore::RenderObject::pixelSnappedAbsoluteClippedOverflowRect(v4);
      WebCore::IntRect::operator CGRect();
      a3->origin.x = v7;
      a3->origin.y = v8;
      a3->size.width = v9;
      a3->size.height = v10;
      char v5 = 1;
    }
  }
  return (v6 != 0) & v5;
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3
{
  return [(WebFrame *)self _stringByEvaluatingJavaScriptFromString:a3 forceUserGesture:1];
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 forceUserGesture:(BOOL)a4
{
  if (!a3) {
    return &stru_1F3C7DA90;
  }
  isMainThread = (WebCore *)WTF::isMainThread((WTF *)self);
  if (isMainThread)
  {
    if (self) {
      isMainThread = (WebCore *)CFRetain(self);
    }
    CGFloat v7 = (WebCore::ScriptController *)*((void *)self->_private->coreFrame.m_ptr + 38);
    CGFloat v8 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld(isMainThread);
    WebCore::ScriptController::jsWindowProxy(v7, v8);
    JSC::JSLockHolder::JSLockHolder();
    MEMORY[0x1E4E442D0](v17, a3);
    unint64_t v10 = WebCore::ScriptController::executeScriptIgnoringException();
    v17[1] = (WTF::StringImpl *)v10;
    uint64_t v11 = v17[0];
    v17[0] = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v9);
        uint64_t v12 = &stru_1F3C7DA90;
        if (!self->_private->coreFrame.m_ptr) {
          goto LABEL_28;
        }
        goto LABEL_12;
      }
      *(_DWORD *)v11 -= 2;
    }
    uint64_t v12 = &stru_1F3C7DA90;
    if (!self->_private->coreFrame.m_ptr) {
      goto LABEL_28;
    }
LABEL_12:
    if (v10)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 6) {
        goto LABEL_16;
      }
      if ((v10 & 0xFFFE000000000002) == 0)
      {
        if (*(unsigned char *)(v10 + 5) != 2) {
          goto LABEL_28;
        }
        uint64_t v15 = *(WTF::StringImpl **)(v10 + 8);
        if (v15) {
          uint64_t v15 = *(WTF::StringImpl **)JSC::JSRopeString::resolveRope();
        }
        if (v15) {
          *(_DWORD *)v15 += 2;
        }
        v17[0] = v15;
        if (!v15) {
          goto LABEL_28;
        }
        goto LABEL_17;
      }
      if (v10 >> 49)
      {
LABEL_16:
        JSC::JSValue::toWTFStringSlowCase();
        if (v17[0])
        {
LABEL_17:
          uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
          CFStringRef v14 = v17[0];
          v17[0] = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2) {
              WTF::StringImpl::destroy(v14, v13);
            }
            else {
              *(_DWORD *)v14 -= 2;
            }
          }
        }
      }
    }
LABEL_28:
    MEMORY[0x1E4E43B10](v18);
    CFRelease(self);
    return v12;
  }
  id result = (id)693;
  __break(0xC471u);
  return result;
}

- (CGRect)_caretRectAtPosition:(const void *)a3 affinity:(unint64_t)a4
{
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v17, 0);
  WebCore::IntRect::operator CGRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = v17;
  uint64_t v17 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_firstRectForDOMRange:(id)a3
{
  if (a3)
  {
    v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
    WebCore::makeSimpleRange();
    uint64_t RectForRange = WebCore::Editor::firstRectForRange(v3, (const WebCore::SimpleRange *)&v19);
    uint64_t v22 = v4;
    WebCore::IntRect::operator CGRect();
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = v20;
    uint64_t v20 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 7) == 2)
      {
        if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v13);
        }
      }
      else
      {
        *((_DWORD *)v13 + 7) -= 2;
      }
    }
    double v14 = v19;
    double v19 = 0;
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
  else
  {
    double v6 = *MEMORY[0x1E4F28AD8];
    double v8 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_scrollDOMRangeToVisible:(id)a3
{
  -[WebFrame _firstRectForDOMRange:](self, "_firstRectForDOMRange:");
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  uint64_t v9 = [a3 startContainer];
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
      double v11 = (WebCore::RenderObject *)(*(void *)(v10 + 72) & 0xFFFFFFFFFFFFLL);
      if (v11)
      {
        if (WebCore::RenderObject::enclosingLayer(v11))
        {
          WebCore::enclosingIntRect((WebCore *)v13, v12);
          WebCore::LocalFrameView::scrollRectToVisible();
          *(unsigned char *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 24) = 1;
          WebCore::FrameSelection::updateAppearance(*(WebCore::FrameSelection **)(*((void *)self->_private->coreFrame.m_ptr
                                                                                  + 37)
                                                                                + 3096));
        }
      }
    }
  }
}

- (void)_scrollDOMRangeToVisible:(id)a3 withInset:(double)a4
{
  -[WebFrame _firstRectForDOMRange:](self, "_firstRectForDOMRange:");
  NSRect v13 = NSInsetRect(v14, a4, a4);
  uint64_t v7 = [a3 startContainer];
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = (WebCore::RenderObject *)(*(void *)(v8 + 72) & 0xFFFFFFFFFFFFLL);
      if (v9)
      {
        if (WebCore::RenderObject::enclosingLayer(v9))
        {
          WebCore::enclosingIntRect((WebCore *)&v13, v10);
          WebCore::LocalFrameView::scrollRectToVisible();
          if (self)
          {
            m_ptr = self->_private->coreFrame.m_ptr;
            if (m_ptr)
            {
              double v12 = *(WebCore::FrameSelection **)(*((void *)m_ptr + 37) + 3096);
              *((unsigned char *)v12 + 24) = 1;
              WebCore::FrameSelection::updateAppearance(v12);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_needsLayout
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 36);
  if (v2) {
    LOBYTE(v2) = MEMORY[0x1F4174A60](v2, a2);
  }
  return v2;
}

- (unsigned)_selectionGranularity
{
  return *(unsigned char *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 184);
}

- (_NSRange)_convertToNSRange:(const void *)a3
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr
    && (uint64_t v5 = WebCore::FrameSelection::rootEditableElementOrDocumentElement(*(WebCore::FrameSelection **)(*((void *)m_ptr + 37) + 3096))) != 0)
  {
    *(_DWORD *)(v5 + 28) += 2;
    v13.var0.var0 = (Node *)v5;
    v13.var1 = 0;
    WebCore::SimpleRange::SimpleRange((WebCore::SimpleRange *)&v14, &v13, (const BoundaryPoint *)a3);
    uint64_t v6 = WebCore::characterCount();
    uint64_t v7 = WebCore::characterCount();
    uint64_t v8 = v15;
    double v15 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
    double v11 = v14;
    NSRect v14 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 7) == 2)
      {
        if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v11);
        }
      }
      else
      {
        *((_DWORD *)v11 + 7) -= 2;
      }
    }
    var0 = v13.var0.var0;
    v13.var0.var0 = 0;
    if (var0)
    {
      if (*((_DWORD *)var0 + 7) != 2)
      {
        *((_DWORD *)var0 + 7) -= 2;
        NSUInteger v9 = v6;
        NSUInteger v10 = v7;
        goto LABEL_20;
      }
      if ((*((_WORD *)var0 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
        NSUInteger v9 = v6;
        NSUInteger v10 = v7;
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v9 = v6;
  NSUInteger v10 = v7;
LABEL_20:
  result.length = v10;
  result.location = v9;
  return result;
}

- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3
{
  if (self) {
    return (optional<WebCore::SimpleRange> *)unk_1F3CC9110(self, "_convertToDOMRange:rangeIsRelativeTo:", a4.location, a4.length, 0);
  }
  *(void *)&retstr->var1 = 0;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  retstr->var0.var1.var1 = 0u;
  return self;
}

- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3 rangeIsRelativeTo:(_NSRange)a4
{
  if (a4.location == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  if (a5)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::startOfParagraph();
    WebCore::makeBoundaryPoint((uint64_t *)&v16, (WebCore *)&v20, v8);
    NSUInteger v9 = v20;
    uint64_t v20 = 0;
    if (v9)
    {
      if (*((_DWORD *)v9 + 7) == 2)
      {
        if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v9);
        }
      }
      else
      {
        *((_DWORD *)v9 + 7) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v18;
    double v18 = 0;
    if (self)
    {
      if (*(&self->var0.var1.var1.var1 + 1) == 2)
      {
        if ((*((_WORD *)&self->var1 + 1) & 0x400) == 0) {
          self = (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef((WebCore::Node *)self);
        }
      }
      else
      {
        *(&self->var0.var1.var1.var1 + 1) -= 2;
      }
    }
    if (!v17) {
      goto LABEL_2;
    }
    uint64_t v10 = **((void **)v16 + 6);
    *(_DWORD *)(v10 + 28) += 2;
    uint64_t v20 = (Node *)v10;
    __int16 v11 = *(_WORD *)(v10 + 32);
    if ((v11 & 1) == 0 && (v11 & 4) != 0)
    {
      self = (optional<WebCore::SimpleRange> *)WebCore::ContainerNode::countChildNodes((WebCore::ContainerNode *)v10);
      double v15 = (WebCore::Node *)v10;
      if (!v17)
      {
        __break(1u);
        return self;
      }
    }
    else
    {
      double v15 = (WebCore::Node *)v10;
    }
    WebCore::SimpleRange::SimpleRange();
    WebCore::resolveCharacterRange();
    retstr->var0.var1.var0.var0.var0 = v20;
    retstr->var0.var1.var0.var1 = v21;
    retstr->var0.var1.var1.var0.var0 = v22;
    retstr->var0.var1.var1.var1 = v23;
    retstr->var1 = 1;
    uint64_t v22 = 0;
    uint64_t v20 = 0;
    double v12 = v19;
    double v19 = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 7) == 2)
      {
        if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v12);
        }
      }
      else
      {
        *((_DWORD *)v12 + 7) -= 2;
      }
    }
    BoundaryPoint v13 = v18;
    double v18 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 7) == 2)
      {
        if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v13);
        }
      }
      else
      {
        *((_DWORD *)v13 + 7) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v15;
    if (v15)
    {
      if (*((_DWORD *)v15 + 7) == 2)
      {
        if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
          self = (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef(v15);
        }
      }
      else
      {
        *((_DWORD *)v15 + 7) -= 2;
      }
    }
    if (v17)
    {
      self = (optional<WebCore::SimpleRange> *)v16;
      double v16 = 0;
      if (self)
      {
        unsigned int v14 = *(&self->var0.var1.var1.var1 + 1) - 2;
        if (*(&self->var0.var1.var1.var1 + 1) == 2)
        {
          if ((*((_WORD *)&self->var1 + 1) & 0x400) == 0) {
            return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef((WebCore::Node *)self);
          }
          return self;
        }
LABEL_49:
        *(&self->var0.var1.var1.var1 + 1) = v14;
      }
    }
  }
  else
  {
    self = (optional<WebCore::SimpleRange> *)WebCore::FrameSelection::rootEditableElementOrDocumentElement(*(WebCore::FrameSelection **)(*(void *)(*(void *)(*(void *)&self->var0.var1.var0.var1 + 8) + 296) + 3096));
    if (!self)
    {
LABEL_2:
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      return self;
    }
    WebCore::makeRangeSelectingNodeContents((uint64_t *)&v18, (WebCore *)self, v6);
    WebCore::resolveCharacterRange();
    retstr->var0.var1.var0.var0.var0 = v20;
    retstr->var0.var1.var0.var1 = v21;
    retstr->var0.var1.var1.var0.var0 = v22;
    retstr->var0.var1.var1.var1 = v23;
    retstr->var1 = 1;
    uint64_t v22 = 0;
    uint64_t v20 = 0;
    uint64_t v7 = v19;
    double v19 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v18;
    double v18 = 0;
    if (self)
    {
      unsigned int v14 = *(&self->var0.var1.var1.var1 + 1) - 2;
      if (*(&self->var0.var1.var1.var1 + 1) != 2) {
        goto LABEL_49;
      }
      if ((*((_WORD *)&self->var1 + 1) & 0x400) == 0) {
        return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef((WebCore::Node *)self);
      }
    }
  }
  return self;
}

- (id)_convertNSRangeToDOMRange:(_NSRange)a3
{
  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
  }
  else
  {
    char v7 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  v3 = kit();
  if (!v7) {
    return v3;
  }
  if (v6)
  {
    if (*(_DWORD *)(v6 + 28) == 2)
    {
      if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
      }
    }
    else
    {
      *(_DWORD *)(v6 + 28) -= 2;
    }
  }
  if (!v5) {
    return v3;
  }
  if (*(_DWORD *)(v5 + 28) != 2)
  {
    *(_DWORD *)(v5 + 28) -= 2;
    return v3;
  }
  if ((*(_WORD *)(v5 + 34) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)v5);
  return v3;
}

- (_NSRange)_convertDOMRangeToNSRange:(id)a3
{
  if (a3)
  {
    WebCore::makeSimpleRange();
    uint64_t v4 = [(WebFrame *)self _convertToNSRange:&v11];
    NSUInteger v6 = v5;
    char v7 = v12;
    double v12 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    uint64_t v10 = v11;
    __int16 v11 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 7) != 2)
      {
        *((_DWORD *)v10 + 7) -= 2;
        NSUInteger v8 = v4;
        NSUInteger v9 = v6;
        goto LABEL_14;
      }
      if ((*((_WORD *)v10 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v10);
        NSUInteger v8 = v4;
        NSUInteger v9 = v6;
        goto LABEL_14;
      }
    }
  }
  else
  {
    NSUInteger v6 = 0;
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v8 = v4;
  NSUInteger v9 = v6;
LABEL_14:
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_markDOMRange
{
  uint64_t v2 = WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)&v7, (WebCore::VisibleSelection *)(v2 + 200));
  v3 = kit();
  if (!v9) {
    return v3;
  }
  uint64_t v4 = v8;
  NSUInteger v8 = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 7) == 2)
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      *((_DWORD *)v4 + 7) -= 2;
    }
  }
  NSUInteger v5 = v7;
  char v7 = 0;
  if (!v5) {
    return v3;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (id)_documentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  NSUInteger v5 = (WebCore::Node *)*((void *)m_ptr + 37);
  if (!v5) {
    return v5;
  }
  MEMORY[0x1E4E442D0](&v13, a3);
  MEMORY[0x1E4E442D0](&v12, a4);
  WebCore::createFragmentFromMarkup();
  NSUInteger v5 = kit(v14);
  NSUInteger v8 = v14;
  unsigned int v14 = 0;
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  uint64_t v10 = v12;
  double v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 != 2)
    {
      *(_DWORD *)v10 -= 2;
      goto LABEL_13;
    }
    WTF::StringImpl::destroy(v10, v7);
    __int16 v11 = v13;
    BoundaryPoint v13 = 0;
    if (v11) {
      goto LABEL_16;
    }
    return v5;
  }
LABEL_13:
  __int16 v11 = v13;
  BoundaryPoint v13 = 0;
  if (!v11) {
    return v5;
  }
LABEL_16:
  if (*(_DWORD *)v11 == 2) {
    WTF::StringImpl::destroy(v11, v7);
  }
  else {
    *(_DWORD *)v11 -= 2;
  }
  return v5;
}

- (id)_documentFragmentWithNodesAsParagraphs:(id)a3
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = (WebCore::Node *)*((void *)m_ptr + 37);
  if (v4)
  {
    NSUInteger v5 = (void *)[a3 objectEnumerator];
    NSUInteger v6 = 0;
    unsigned int v7 = 0;
    v30 = 0;
    for (uint64_t i = 0; ; HIDWORD(i) = v7)
    {
      uint64_t v8 = [v5 nextObject];
      if (!v8) {
        break;
      }
      char v9 = *(WebCore::Node **)(v8 + 16);
      v29 = v9;
      if (v7 == i)
      {
        uint64_t v10 = (void *)WTF::Vector<WTF::Ref<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v30, v7 + 1, (unint64_t)&v29);
        unsigned int v7 = HIDWORD(i);
        NSUInteger v6 = v30;
        *((void *)v30 + HIDWORD(i)) = *v10;
      }
      else
      {
        *((void *)v6 + v7) = v9;
      }
      ++v7;
    }
    WebCore::Document::createDocumentFragment((uint64_t *)&v29, v4);
    if (v7)
    {
      uint64_t v12 = 8 * v7;
      BoundaryPoint v13 = (Node **)v6;
      while (1)
      {
        unsigned int v14 = *v13;
        WebCore::createDefaultParagraphElement((uint64_t *)&v28, v4, v11);
        WebCore::ContainerNode::appendChild(&v25, v28, v14);
        if (v27)
        {
          double v16 = v26;
          v26 = 0;
          if (v16)
          {
            if (*(_DWORD *)v16 == 2) {
              WTF::StringImpl::destroy(v16, v15);
            }
            else {
              *(_DWORD *)v16 -= 2;
            }
          }
        }
        WebCore::ContainerNode::appendChild(&v22, v29, (Node *)v28);
        if (!v24) {
          goto LABEL_22;
        }
        char v17 = v23;
        unsigned int v23 = 0;
        if (!v17) {
          goto LABEL_22;
        }
        if (*(_DWORD *)v17 != 2) {
          break;
        }
        WTF::StringImpl::destroy(v17, (StringImpl *)v11);
        double v18 = v28;
        v28 = 0;
        if (v18)
        {
LABEL_23:
          if (*((_DWORD *)v18 + 7) == 2)
          {
            if ((*((_WORD *)v18 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v18);
            }
          }
          else
          {
            *((_DWORD *)v18 + 7) -= 2;
          }
        }
LABEL_12:
        ++v13;
        v12 -= 8;
        if (!v12) {
          goto LABEL_28;
        }
      }
      *(_DWORD *)v17 -= 2;
LABEL_22:
      double v18 = v28;
      v28 = 0;
      if (v18) {
        goto LABEL_23;
      }
      goto LABEL_12;
    }
LABEL_28:
    uint64_t v4 = kit(v29);
    uint64_t v20 = v29;
    v29 = 0;
    if (v20)
    {
      if (*((_DWORD *)v20 + 7) == 2)
      {
        if ((*((_WORD *)v20 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v20);
        }
      }
      else
      {
        *((_DWORD *)v20 + 7) -= 2;
      }
    }
    if (v6)
    {
      v30 = 0;
      LODWORD(i) = 0;
      WTF::fastFree(v6, v19);
    }
  }
  return v4;
}

- (void)_replaceSelectionWithNode:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  WebCore::Document::createDocumentFragment((uint64_t *)&v13, *((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  __int16 v11 = kit(v13);
  uint64_t v12 = v13;
  BoundaryPoint v13 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  [(WebCore::Node *)v11 appendChild:a3];
  [(WebFrame *)self _replaceSelectionWithFragment:v11 selectReplacement:v8 smartReplace:v7 matchStyle:v6];
}

- (void)_insertParagraphSeparatorInQuotedContent
{
  uint64_t v2 = (WebCore::Document *)*((void *)self->_private->coreFrame.m_ptr + 37);
  if (*(unsigned char *)(*((void *)v2 + 387) + 153))
  {
    uint64_t v3 = WebCore::Document::editor(v2);
    MEMORY[0x1F4172CC0](v3);
  }
}

- (VisiblePosition)_visiblePositionForPoint:(SEL)a3
{
  CGPoint v7 = a4;
  m_ptr = self->_private->coreFrame.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v6, &v7);
  return (VisiblePosition *)WebCore::LocalFrame::visiblePositionForPoint((WebCore::LocalFrame *)m_ptr, (const WebCore::IntPoint *)v6);
}

- (id)_characterRangeAtPoint:(CGPoint)a3
{
  CGPoint v12 = a3;
  m_ptr = self->_private->coreFrame.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v8, &v12);
  WebCore::LocalFrame::rangeForPoint((uint64_t *)&v9, (WebCore::LocalFrame *)m_ptr, &v8);
  uint64_t v4 = kit();
  if (!v11) {
    return v4;
  }
  NSUInteger v5 = v10;
  uint64_t v10 = 0;
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
  BOOL v6 = v9;
  char v9 = 0;
  if (!v6) {
    return v4;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)_typingStyle
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  WebCore::FrameSelection::copyTypingStyle((uint64_t *)&v9, *(WebCore::FrameSelection **)(*((void *)m_ptr + 37) + 3096));
  if (!v9) {
    return 0;
  }
  uint64_t v3 = (DOMObjectInternal *)WebCore::MutableStyleProperties::ensureCSSStyleDeclaration(v9);
  uint64_t v4 = kit(v3);
  NSUInteger v5 = v9;
  char v9 = 0;
  if (!v5) {
    return v4;
  }
  if (*(_DWORD *)v5 != 1)
  {
    --*(_DWORD *)v5;
    return v4;
  }
  WebCore::MutableStyleProperties::~MutableStyleProperties(v5);
  WTF::fastFree(v7, v8);
  return v4;
}

- (void)_setTypingStyle:(id)a3 withUndoAction:(unsigned __int8)a4
{
  if (a3)
  {
    if (self->_private->coreFrame.m_ptr)
    {
      (*(void (**)(WebCore::MutableStyleProperties **__return_ptr))(**((void **)a3 + 2) + 160))(&v8);
      WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
      WebCore::Editor::computeAndSetTypingStyle();
      NSUInteger v5 = v8;
      IntPoint v8 = 0;
      if (v5)
      {
        if (*(_DWORD *)v5 == 1)
        {
          WebCore::MutableStyleProperties::~MutableStyleProperties(v5);
          WTF::fastFree(v6, v7);
        }
        else
        {
          --*(_DWORD *)v5;
        }
      }
    }
  }
}

- (BOOL)_canProvideDocumentSource
{
  m_ptr = self->_private->coreFrame.m_ptr;
  uint64_t v4 = *(WTF::StringImpl **)(WebCore::Document::loader(*((WebCore::Document **)m_ptr + 37)) + 120);
  if (v4) {
    *(_DWORD *)v4 += 2;
  }
  CGPoint v12 = v4;
  uint64_t v5 = *((void *)m_ptr + 3);
  if (v5 && (BOOL v6 = *(WebCore::Page **)(v5 + 8)) != 0) {
    uint64_t v7 = WebCore::Page::pluginData(v6);
  }
  else {
    uint64_t v7 = 0;
  }
  if ((WebCore::MIMETypeRegistry::isTextMIMEType((WebCore::MIMETypeRegistry *)&v12, v3) & 1) != 0
    || (WebCore::Image::supportsType((WebCore::Image *)&v12, v8) & 1) != 0
    || v7
    && ((WebCore::PluginData::supportsWebVisibleMimeType() & 1) != 0
     || (WebCore::PluginData::supportsWebVisibleMimeType() & 1) != 0))
  {
    BOOL v9 = 0;
    uint64_t v10 = v12;
    CGPoint v12 = 0;
    if (!v10) {
      return v9;
    }
  }
  else
  {
    BOOL v9 = 1;
    uint64_t v10 = v12;
    CGPoint v12 = 0;
    if (!v10) {
      return v9;
    }
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return v9;
  }
  WTF::StringImpl::destroy(v10, (StringImpl *)v8);
  return v9;
}

- (void)_commitData:(id)a3
{
  WebCore::Document::setShouldCreateRenderers(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  WebCore::FragmentedSharedBuffer::create(&v9, (WebCore::FragmentedSharedBuffer *)a3, v4);
  uint64_t v5 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1E4E44F40](v5, &v9);
  uint64_t v8 = v5;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v9, v6);
  WebCore::DocumentLoader::commitData();
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v8, v7);
}

- (BOOL)_isDescendantOfFrame:(id)a3
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (a3) {
    uint64_t v4 = *(void *)(*((void *)a3 + 1) + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  return MEMORY[0x1F41763F8]((char *)m_ptr + 48, v4);
}

- (void)_setShouldCreateRenderers:(BOOL)a3
{
  self->_private->shouldCreateRenderers = a3;
}

- (CGColor)_bodyBackgroundColor
{
  _NSRange result = (CGColor *)*((void *)self->_private->coreFrame.m_ptr + 37);
  if (result)
  {
    _NSRange result = (CGColor *)WebCore::Document::bodyOrFrameset(result);
    if (result)
    {
      if ((*((void *)result + 9) & 0xFFFFFFFFFFFFLL) == 0) {
        return 0;
      }
      if ((*(unsigned char *)((*((void *)result + 9) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
      {
        _NSRange result = (CGColor *)105;
        __break(0xC471u);
        return result;
      }
      WebCore::RenderStyle::visitedDependentColorWithColorFilter();
      uint64_t v4 = v8;
      if ((v8 & 0x4000000000000) == 0)
      {
        _NSRange result = 0;
        if ((v8 & 0x8000000000000) == 0) {
          return result;
        }
        goto LABEL_12;
      }
      WebCore::cachedCGColor();
      _NSRange result = arg;
      if (arg)
      {
        CFAutorelease(arg);
        _NSRange result = arg;
      }
      uint64_t v4 = v8;
      if ((v8 & 0x8000000000000) != 0)
      {
LABEL_12:
        uint64_t v5 = (unsigned int *)(v4 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)v5, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v5);
          BOOL v6 = result;
          WTF::fastFree((WTF *)v5, v3);
          return v6;
        }
      }
    }
  }
  return result;
}

- (BOOL)_isFrameSet
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 37);
  if (v2) {
    LOBYTE(v2) = (*(uint64_t (**)(void))(*(void *)v2 + 392))();
  }
  return v2;
}

- (BOOL)_firstLayoutDone
{
  return MEMORY[0x1F41759E8](*((void *)self->_private->coreFrame.m_ptr + 35) + 64, a2);
}

- (BOOL)_isVisuallyNonEmpty
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 36);
  return v2 && v2 != 0 && *(unsigned char *)(v2 + 1404) != 0;
}

- (int)_loadType
{
  unsigned int v2 = WebCore::FrameLoader::loadType(*((WebCore::FrameLoader **)self->_private->coreFrame.m_ptr + 35)) - 1;
  if (v2 > 8) {
    return 0;
  }
  else {
    return dword_1E149DD60[(char)v2];
  }
}

- (BOOL)needsLayout
{
  return self->_private->coreFrame.m_ptr && [(WebFrame *)self _needsLayout];
}

- (void)_setLoadsSynchronously:(BOOL)a3
{
  *(unsigned char *)(*((void *)self->_private->coreFrame.m_ptr + 35) + 324) = a3;
}

- (BOOL)_loadsSynchronously
{
  return *(unsigned char *)(*((void *)self->_private->coreFrame.m_ptr + 35) + 324);
}

- (id)_rectsForRange:(id)a3
{
  if (a3) {
    return (id)[a3 textRects];
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)_selectionRangeForFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  if (self)
  {
    double y = a4.y;
    double x = a4.x;
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a3.x, a3.y);
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", x, y);
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    memset(&v17, 0, sizeof(v17));
  }
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v13, &v18, &v17);
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)&v14, (WebCore::VisibleSelection *)v13);
  uint64_t v7 = kit();
  if (v16)
  {
    uint64_t v8 = v15;
    double v15 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
    uint64_t v9 = v14;
    unsigned int v14 = 0;
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
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v13);
  var0 = v17.var0.var0.var0;
  v17.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  char v11 = v18.var0.var0.var0;
  v18.var0.var0.var0 = 0;
  if (!v11) {
    return v7;
  }
  if (*((_DWORD *)v11 + 7) != 2)
  {
    *((_DWORD *)v11 + 7) -= 2;
    return v7;
  }
  if ((*((_WORD *)v11 + 17) & 0x400) != 0) {
    return v7;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)v11);
  return v7;
}

- (id)_selectionRangeForPoint:(CGPoint)a3
{
  if (self) {
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a3.x, a3.y);
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v9, &v8);
  WebCore::VisibleSelection::toNormalizedRange(&v10, (WebCore::VisibleSelection *)v9);
  uint64_t v3 = kit();
  if (v12)
  {
    uint64_t v4 = v11;
    uint64_t v11 = 0;
    if (v4)
    {
      if (*(_DWORD *)(v4 + 28) == 2)
      {
        if ((*(_WORD *)(v4 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v4);
        }
      }
      else
      {
        *(_DWORD *)(v4 + 28) -= 2;
      }
    }
    uint64_t v5 = v10;
    uint64_t v10 = 0;
    if (v5)
    {
      if (*(_DWORD *)(v5 + 28) == 2)
      {
        if ((*(_WORD *)(v5 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v5);
        }
      }
      else
      {
        *(_DWORD *)(v5 + 28) -= 2;
      }
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v9);
  var0 = v8.var0.var0.var0;
  v8.var0.var0.var0 = 0;
  if (!var0) {
    return v3;
  }
  if (*((_DWORD *)var0 + 7) != 2)
  {
    *((_DWORD *)var0 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)var0 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)var0);
  return v3;
}

- (_NSRange)_selectedNSRange
{
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)v10, (WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56));
  if (v12)
  {
    uint64_t v3 = [(WebFrame *)self _convertToNSRange:v10];
    NSUInteger v5 = v4;
    if (v12)
    {
      BOOL v6 = v11;
      uint64_t v11 = 0;
      if (v6)
      {
        if (*((_DWORD *)v6 + 7) == 2)
        {
          if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v6);
          }
        }
        else
        {
          *((_DWORD *)v6 + 7) -= 2;
        }
      }
      uint64_t v9 = v10[0];
      v10[0] = 0;
      if (v9)
      {
        if (*((_DWORD *)v9 + 7) != 2)
        {
          *((_DWORD *)v9 + 7) -= 2;
          NSUInteger v7 = v3;
          NSUInteger v8 = v5;
          goto LABEL_15;
        }
        if ((*((_WORD *)v9 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v9);
          NSUInteger v7 = v3;
          NSUInteger v8 = v5;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    NSUInteger v5 = 0;
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v7 = v3;
  NSUInteger v8 = v5;
LABEL_15:
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)_selectNSRange:(_NSRange)a3
{
  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
    if (v8)
    {
      WebCore::VisibleSelection::VisibleSelection();
      WebCore::FrameSelection::setSelection();
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v5);
      if (v8)
      {
        uint64_t v3 = v7;
        uint64_t v7 = 0;
        if (v3)
        {
          if (*(_DWORD *)(v3 + 28) == 2)
          {
            if ((*(_WORD *)(v3 + 34) & 0x400) == 0) {
              WebCore::Node::removedLastRef((WebCore::Node *)v3);
            }
          }
          else
          {
            *(_DWORD *)(v3 + 28) -= 2;
          }
        }
        uint64_t v4 = v6;
        uint64_t v6 = 0;
        if (v4)
        {
          if (*(_DWORD *)(v4 + 28) == 2)
          {
            if ((*(_WORD *)(v4 + 34) & 0x400) == 0) {
              WebCore::Node::removedLastRef((WebCore::Node *)v4);
            }
          }
          else
          {
            *(_DWORD *)(v4 + 28) -= 2;
          }
        }
      }
    }
  }
}

- (BOOL)_isDisplayingStandaloneImage
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 37);
  if (v2) {
    return (*(unsigned __int16 *)(v2 + 3406) >> 2) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unsigned)_pendingFrameUnloadEventCount
{
  return MEMORY[0x1F4174A48](*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 728), a2);
}

- (void)setTimeoutsPaused:(BOOL)a3
{
  if ([(WebFrame *)self _webHTMLDocumentView] && self->_private->coreFrame.m_ptr)
  {
    MEMORY[0x1F416C160]();
  }
}

- (void)setPluginsPaused:(BOOL)a3
{
  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v4 = *((void *)m_ptr + 3);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 8);
        if (v5)
        {
          BOOL v6 = a3;
          if (((*(uint64_t (**)(void, SEL))(**(void **)(*(void *)(v5 + 48) + 16) + 1368))(*(void *)(*(void *)(v5 + 48) + 16), a2) & 1) == 0)
          {
            id Weak = objc_loadWeak((id *)(*(void *)(*(void *)(v5 + 48) + 16) + 16));
            if (Weak)
            {
              if (v6)
              {
                [Weak _stopAllPlugIns];
              }
              else
              {
                [Weak _startAllPlugIns];
              }
            }
          }
        }
      }
    }
  }
}

- (void)prepareForPause
{
  if ([(WebFrame *)self _webHTMLDocumentView] && self->_private->coreFrame.m_ptr)
  {
    MEMORY[0x1F416C1F0]();
  }
}

- (void)resumeFromPause
{
  if ([(WebFrame *)self _webHTMLDocumentView] && self->_private->coreFrame.m_ptr)
  {
    MEMORY[0x1F416C208]();
  }
}

- (void)selectWithoutClosingTypingNSRange:(_NSRange)a3
{
  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
    if (v10)
    {
      WebCore::VisibleSelection::VisibleSelection();
      WebCore::FrameSelection::setSelection();
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v7);
      uint64_t v4 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
      WebCore::Editor::ensureLastEditCommandHasCurrentSelectionIfOpenForMoreTyping(v4);
      if (v10)
      {
        uint64_t v5 = v9;
        uint64_t v9 = 0;
        if (v5)
        {
          if (*(_DWORD *)(v5 + 28) == 2)
          {
            if ((*(_WORD *)(v5 + 34) & 0x400) == 0) {
              WebCore::Node::removedLastRef((WebCore::Node *)v5);
            }
          }
          else
          {
            *(_DWORD *)(v5 + 28) -= 2;
          }
        }
        uint64_t v6 = v8;
        uint64_t v8 = 0;
        if (v6)
        {
          if (*(_DWORD *)(v6 + 28) == 2)
          {
            if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
              WebCore::Node::removedLastRef((WebCore::Node *)v6);
            }
          }
          else
          {
            *(_DWORD *)(v6 + 28) -= 2;
          }
        }
      }
    }
  }
}

- (void)forceLayoutAdjustingViewSize:(BOOL)a3
{
  BOOL v4 = !a3;
  WebCore::LocalFrameView::forceLayout(*((WebCore::LocalFrameView **)self->_private->coreFrame.m_ptr + 36));
  if (!v4)
  {
    uint64_t v5 = *((void *)self->_private->coreFrame.m_ptr + 36);
    MEMORY[0x1F416DA38](v5);
  }
}

- (void)_handleKeyEvent:(id)a3
{
}

- (void)_selectAll
{
}

- (void)_setSelectionFromNone
{
}

- (void)_restoreViewState
{
}

- (void)_saveViewState
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (*(void *)(*((void *)m_ptr + 23) + 16)) {
    (*(void (**)(void))(**(void **)(*((void *)m_ptr + 35) + 16) + 720))();
  }
}

- (void)deviceOrientationChanged
{
}

uint64_t __48__WebFrame_WebPrivate__deviceOrientationChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (v3 = *(void *)(*(void *)(v2 + 8) + 8)) == 0 || (uint64_t v4 = *(void *)(v3 + 24)) == 0)
  {
LABEL_6:
    id Weak = 0;
    goto LABEL_7;
  }
  id Weak = *(void **)(v4 + 8);
  if (Weak)
  {
    if (((*(uint64_t (**)(void))(**(void **)(Weak[6] + 16) + 1368))(*(void *)(Weak[6] + 16)) & 1) == 0)
    {
      id Weak = objc_loadWeak((id *)(*(void *)(Weak[6] + 16) + 16));
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  uint64_t result = objc_msgSend(Weak, "_setDeviceOrientation:", (int)objc_msgSend((id)objc_msgSend(Weak, "_UIKitDelegateForwarder"), "deviceOrientation"));
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t result = *(void *)(*(void *)(v7 + 8) + 8);
    if (result)
    {
      return MEMORY[0x1F416C178]();
    }
  }
  return result;
}

- (void)setNeedsLayout
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 36);
  if (v2) {
    MEMORY[0x1F416DBC0](v2, a2);
  }
}

- (CGSize)renderedSizeOfNode:(id)a3 constrainedToWidth:(float)a4
{
  if (a3 && (uint64_t v5 = *((void *)a3 + 2)) != 0) {
    uint64_t v6 = *(void *)(v5 + 72) & 0xFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v6 = 0;
  }
  int v7 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v6 + 416))(v6, a2);
  double v8 = 0.0;
  double v9 = 0.0;
  if ((*(unsigned char *)(v6 + 45) & 4) != 0)
  {
    float v10 = (float)v7 * 0.015625;
    if (v10 > a4) {
      float v10 = a4;
    }
    double v8 = v10;
    double v9 = (double)*(int *)(v6 + 164) * 0.015625;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)deepestNodeAtViewportLocation:(CGPoint)a3
{
  CGPoint v7 = a3;
  if (self) {
    m_ptr = self->_private->coreFrame.m_ptr;
  }
  else {
    m_ptr = 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  uint64_t v4 = (WebCore::Node *)WebCore::LocalFrame::deepestNodeAtLocation((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v6);
  return kit(v4);
}

- (id)scrollableNodeAtViewportLocation:(CGPoint)a3
{
  CGPoint v7 = a3;
  if (self) {
    m_ptr = self->_private->coreFrame.m_ptr;
  }
  else {
    m_ptr = 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  uint64_t v4 = (WebCore::Node *)WebCore::LocalFrame::nodeRespondingToScrollWheelEvents((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v6);
  return kit(v4);
}

- (id)approximateNodeAtViewportLocation:(CGPoint *)a3
{
  if (self) {
    m_ptr = self->_private->coreFrame.m_ptr;
  }
  else {
    m_ptr = 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v10, a3);
  uint64_t v9 = 0;
  uint64_t v5 = (WebCore::Node *)WebCore::LocalFrame::approximateNodeAtViewportLocationLegacy((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v10, (WebCore::FloatPoint *)&v9);
  WebCore::FloatPoint::operator CGPoint();
  a3->double x = v6;
  a3->double y = v7;
  return kit(v5);
}

- (CGRect)renderRectForPoint:(CGPoint)a3 isReplaced:(BOOL *)a4 fontSize:(float *)a5
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  BOOL v10 = 0;
  WebCore::LocalFrame::renderRectForPoint((WebCore::LocalFrame *)self, a3, &v10, a5);
  *a4 = v10;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_setProhibitsScrolling:(BOOL)a3
{
  *(unsigned char *)(*((void *)self->_private->coreFrame.m_ptr + 36) + 315) = a3;
}

- (void)revealSelectionAtExtent:(BOOL)a3
{
}

- (void)resetSelection
{
}

- (BOOL)hasEditableSelection
{
  return WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr
                                                                                                + 37)
                                                                                              + 3096)
                                                                                  + 56));
}

- (int)preferredHeight
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  return MEMORY[0x1F4173DE0](self, a2);
}

- (int)innerLineHeight:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = *((void *)a3 + 2);
  WebCore::Document::updateLayout();
  uint64_t v4 = *(void *)(v3 + 72) & 0xFFFFFFFFFFFFLL;
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)v4 + 304);
  return v5();
}

- (void)updateLayout
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  MEMORY[0x1F4173DD0](self, a2);
}

- (void)setIsActive:(BOOL)a3
{
}

- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  MEMORY[0x1F416C220](self, a3);
}

- (CGRect)caretRect
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  MEMORY[0x1F416C278](self, a2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)rectForScrollToVisible
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  MEMORY[0x1F416C1A0](self, a2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCaretColor:(CGColor *)a3
{
  if (a3)
  {
    uint64_t v3 = WebCore::roundAndClampToSRGBALossy(a3, (CGColor *)a2);
    uint64_t v4 = bswap32(v3) | 0x1104000000000000;
    if (!BYTE4(v3)) {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0x11040000000000FFLL;
  }
  uint64_t v7 = v4;
  WebCore::FrameSelection::setCaretColor();
  if ((v7 & 0x8000000000000) != 0)
  {
    double v6 = (unsigned int *)(v7 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v7 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, v5);
    }
  }
}

- (CGColor)caretColor
{
  if (!self) {
    return self;
  }
  uint64_t v2 = *(void *)(*((void *)self + 1) + 8);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 296);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 1280);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 72) & 0xFFFFFFFFFFFFLL;
  if (!v5) {
    return 0;
  }
  if ((*(unsigned char *)(v5 + 45) & 2) != 0) {
    goto LABEL_20;
  }
  if (*(unsigned char *)(v5 + 45))
  {
    WebCore::CaretBase::computeCaretColor();
    uint64_t v8 = v12;
    if ((v12 & 0x4000000000000) == 0)
    {
LABEL_11:
      self = 0;
      if ((v8 & 0x8000000000000) == 0) {
        return self;
      }
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(*(void *)(v5 + 24) + 8);
  if (v6)
  {
    if ((*(_WORD *)(v6 + 32) & 8) == 0)
    {
LABEL_20:
      __break(0xC471u);
      JUMPOUT(0x1E13E1690);
    }
  }
  WebCore::CaretBase::computeCaretColor();
  uint64_t v8 = v12;
  if ((v12 & 0x4000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_15:
  WebCore::cachedCGColor();
  self = arg;
  if (arg)
  {
    CFAutorelease(arg);
    self = arg;
  }
  uint64_t v8 = v12;
  if ((v12 & 0x8000000000000) != 0)
  {
LABEL_18:
    double v9 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)v9, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v9);
      BOOL v10 = self;
      WTF::fastFree((WTF *)v9, v7);
      return v10;
    }
  }
  return self;
}

- (id)documentView
{
  if (!self)
  {
LABEL_5:
    uint64_t v4 = [(WebFrame *)self frameView];
    return [(WebFrameView *)v4 documentView];
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v3 = *(id **)(*((void *)m_ptr + 35) + 16);
    if ((*((uint64_t (**)(id *, SEL))*v3 + 134))(v3, a2))
    {
      self = 0;
      goto LABEL_5;
    }
    uint64_t v4 = (WebFrameView *)[v3[2] frameView];
  }
  else
  {
    uint64_t v4 = (WebFrameView *)[0 frameView];
  }
  return [(WebFrameView *)v4 documentView];
}

- (int)layoutCount
{
  if (self && (m_ptr = self->_private->coreFrame.m_ptr) != 0 && (uint64_t v3 = *((void *)m_ptr + 36)) != 0) {
    return MEMORY[0x1F416DA58](v3, a2);
  }
  else {
    return 0;
  }
}

- (BOOL)isTelephoneNumberParsingAllowed
{
  if (self && (m_ptr = self->_private->coreFrame.m_ptr) != 0 && (uint64_t v3 = *((void *)m_ptr + 37)) != 0) {
    return MEMORY[0x1F4176230](v3, a2);
  }
  else {
    return 0;
  }
}

- (BOOL)isTelephoneNumberParsingEnabled
{
  if (self && (m_ptr = self->_private->coreFrame.m_ptr) != 0 && (uint64_t v3 = *((void *)m_ptr + 37)) != 0) {
    return MEMORY[0x1F4176238](v3, a2);
  }
  else {
    return 0;
  }
}

- (id)selectedDOMRange
{
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)&v6, (WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56));
  uint64_t v2 = kit();
  if (!v8) {
    return v2;
  }
  uint64_t v3 = v7;
  uint64_t v7 = 0;
  if (v3)
  {
    if (*((_DWORD *)v3 + 7) == 2)
    {
      if ((*((_WORD *)v3 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v3);
      }
    }
    else
    {
      *((_DWORD *)v3 + 7) -= 2;
    }
  }
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (!v4) {
    return v2;
  }
  if (*((_DWORD *)v4 + 7) != 2)
  {
    *((_DWORD *)v4 + 7) -= 2;
    return v2;
  }
  if ((*((_WORD *)v4 + 17) & 0x400) != 0) {
    return v2;
  }
  WebCore::Node::removedLastRef(v4);
  return v2;
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5
{
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5 userTriggered:(BOOL)a6
{
  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    uint64_t v8 = *((void *)m_ptr + 3);
    if (!v8) {
      return;
    }
  }
  else
  {
    m_ptr = 0;
    uint64_t v8 = MEMORY[0x18];
    if (!MEMORY[0x18]) {
      return;
    }
  }
  if (*(void *)(v8 + 8))
  {
    double v9 = (WAKView *)WebCore::ScrollView::documentView(*((WebCore::ScrollView **)m_ptr + 36));
    if (v9) {
      WebCore::Chrome::focusNSView(*(WebCore::Chrome **)(*(void *)(*((void *)m_ptr + 3) + 8) + 48), v9);
    }
    WebCore::makeSimpleRange();
    WebCore::FrameSelection::setSelectedRange();
    if (v13)
    {
      if (v12)
      {
        if (*((_DWORD *)v12 + 7) == 2)
        {
          if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v12);
          }
        }
        else
        {
          *((_DWORD *)v12 + 7) -= 2;
        }
      }
      if (v11)
      {
        if (*((_DWORD *)v11 + 7) == 2)
        {
          if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v11);
          }
        }
        else
        {
          *((_DWORD *)v11 + 7) -= 2;
        }
      }
    }
    if (!a5)
    {
      BOOL v10 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      WebCore::Editor::ensureLastEditCommandHasCurrentSelectionIfOpenForMoreTyping(v10);
    }
  }
}

- (unint64_t)selectionAffinity
{
  return *(unsigned __int8 *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 152);
}

- (void)expandSelectionToElementContainingCaretSelection
{
}

- (id)elementRangeContainingCaretSelection
{
  WebCore::FrameSelection::elementRangeContainingCaretSelection((uint64_t *)&v6, *(WebCore::FrameSelection **)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096));
  uint64_t v2 = kit();
  if (!v8) {
    return v2;
  }
  uint64_t v3 = v7;
  uint64_t v7 = 0;
  if (v3)
  {
    if (*((_DWORD *)v3 + 7) == 2)
    {
      if ((*((_WORD *)v3 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v3);
      }
    }
    else
    {
      *((_DWORD *)v3 + 7) -= 2;
    }
  }
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (!v4) {
    return v2;
  }
  if (*((_DWORD *)v4 + 7) != 2)
  {
    *((_DWORD *)v4 + 7) -= 2;
    return v2;
  }
  if ((*((_WORD *)v4 + 17) & 0x400) != 0) {
    return v2;
  }
  WebCore::Node::removedLastRef(v4);
  return v2;
}

- (void)expandSelectionToWordContainingCaretSelection
{
}

- (void)expandSelectionToStartOfWordContainingCaretSelection
{
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  return MEMORY[0x1F4174A08](*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096), *(void *)&a3);
}

- (unsigned)characterBeforeCaretSelection
{
  if (!self)
  {
    LOWORD(m_ptr) = 0;
    return (unsigned __int16)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (unsigned __int16)m_ptr;
  }
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::previous();
  LOWORD(m_ptr) = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v6);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 7) == 2)
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      *((_DWORD *)v4 + 7) -= 2;
    }
  }
  if (!v5) {
    return (unsigned __int16)m_ptr;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return (unsigned __int16)m_ptr;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return (unsigned __int16)m_ptr;
  }
  WebCore::Node::removedLastRef(v5);
  return (unsigned __int16)m_ptr;
}

- (unsigned)characterAfterCaretSelection
{
  if (!self)
  {
    LOWORD(m_ptr) = 0;
    return (unsigned __int16)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (unsigned __int16)m_ptr;
  }
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  LOWORD(m_ptr) = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v5);
  uint64_t v4 = v5;
  uint64_t v5 = 0;
  if (!v4) {
    return (unsigned __int16)m_ptr;
  }
  if (*((_DWORD *)v4 + 7) != 2)
  {
    *((_DWORD *)v4 + 7) -= 2;
    return (unsigned __int16)m_ptr;
  }
  if ((*((_WORD *)v4 + 17) & 0x400) != 0) {
    return (unsigned __int16)m_ptr;
  }
  WebCore::Node::removedLastRef(v4);
  return (unsigned __int16)m_ptr;
}

- (id)wordRangeContainingCaretSelection
{
  WebCore::FrameSelection::wordRangeContainingCaretSelection((uint64_t *)&v6, *(WebCore::FrameSelection **)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096));
  uint64_t v2 = kit();
  if (!v8) {
    return v2;
  }
  uint64_t v3 = v7;
  uint64_t v7 = 0;
  if (v3)
  {
    if (*((_DWORD *)v3 + 7) == 2)
    {
      if ((*((_WORD *)v3 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v3);
      }
    }
    else
    {
      *((_DWORD *)v3 + 7) -= 2;
    }
  }
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (!v4) {
    return v2;
  }
  if (*((_DWORD *)v4 + 7) != 2)
  {
    *((_DWORD *)v4 + 7) -= 2;
    return v2;
  }
  if ((*((_WORD *)v4 + 17) & 0x400) != 0) {
    return v2;
  }
  WebCore::Node::removedLastRef(v4);
  return v2;
}

- (id)wordInRange:(id)a3
{
  if (a3) {
    return -[WebFrame _stringForRange:](self, "_stringForRange:");
  }
  else {
    return 0;
  }
}

- (int)wordOffsetInRange:(id)a3
{
  if (!a3) {
    return -1;
  }
  uint64_t v4 = *(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096);
  uint64_t v5 = *(void *)(v4 + 56);
  if (v5) {
    *(_DWORD *)(v5 + 28) += 2;
  }
  uint64_t v16 = v5;
  int v17 = *(_DWORD *)(v4 + 64);
  char v18 = *(unsigned char *)(v4 + 68);
  uint64_t v6 = *(void *)(v4 + 72);
  if (v6) {
    *(_DWORD *)(v6 + 28) += 2;
  }
  uint64_t v19 = v6;
  int v20 = *(_DWORD *)(v4 + 80);
  char v21 = *(unsigned char *)(v4 + 84);
  uint64_t v7 = *(void *)(v4 + 88);
  if (v7) {
    *(_DWORD *)(v7 + 28) += 2;
  }
  uint64_t v22 = v7;
  int v23 = *(_DWORD *)(v4 + 96);
  char v24 = *(unsigned char *)(v4 + 100);
  uint64_t v8 = *(void *)(v4 + 104);
  if (v8) {
    *(_DWORD *)(v8 + 28) += 2;
  }
  uint64_t v25 = v8;
  int v26 = *(_DWORD *)(v4 + 112);
  char v27 = *(unsigned char *)(v4 + 116);
  uint64_t v9 = *(void *)(v4 + 120);
  if (v9) {
    *(_DWORD *)(v9 + 28) += 2;
  }
  uint64_t v28 = v9;
  int v29 = *(_DWORD *)(v4 + 128);
  char v30 = *(unsigned char *)(v4 + 132);
  uint64_t v10 = *(void *)(v4 + 136);
  if (v10) {
    *(_DWORD *)(v10 + 28) += 2;
  }
  uint64_t v31 = v10;
  int v32 = *(_DWORD *)(v4 + 144);
  char v33 = *(unsigned char *)(v4 + 148);
  __int16 v34 = *(_WORD *)(v4 + 152);
  char v35 = *(unsigned char *)(v4 + 154);
  if (HIBYTE(v34) == 1)
  {
    if ((v30 & 8) == 0 && ((int v11 = v30 & 7, v11 == 2) || v11 == 4)) {
      int v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    }
    else {
      int v12 = v29;
    }
    int v15 = v12 - *(_DWORD *)(*((void *)a3 + 2) + 40);
    int v14 = v15 & ~(v15 >> 31);
  }
  else
  {
    int v14 = -1;
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v16);
  return v14;
}

- (BOOL)spaceFollowsWordInRange:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL result = WebCore::makeSimpleRange();
  if (v15)
  {
    WebCore::makeDeprecatedLegacyPosition((uint64_t *)&v16, (WebCore *)&v14, v4);
    uint64_t v5 = (WebCore::VisiblePosition *)WebCore::VisiblePosition::VisiblePosition();
    unsigned __int16 v6 = WebCore::VisiblePosition::characterAfter(v5);
    int v7 = v6;
    if (v6 > 0xFFu)
    {
      BOOL v9 = MEMORY[0x1E4E4B6C0]() == 9;
    }
    else
    {
      BOOL v8 = (v6 < 0x21u) & (0x100003600uLL >> v6);
      BOOL v9 = v7 == 11 || v8;
    }
    uint64_t v10 = v17;
    uint64_t v17 = 0;
    if (v10)
    {
      if (*(_DWORD *)(v10 + 28) == 2)
      {
        if ((*(_WORD *)(v10 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v10);
        }
      }
      else
      {
        *(_DWORD *)(v10 + 28) -= 2;
      }
    }
    int v11 = v16;
    uint64_t v16 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 7) == 2)
      {
        if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v11);
        }
      }
      else
      {
        *((_DWORD *)v11 + 7) -= 2;
      }
    }
    if (v15)
    {
      int v12 = v14;
      int v14 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 7) == 2)
        {
          if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v12);
          }
        }
        else
        {
          *((_DWORD *)v12 + 7) -= 2;
        }
      }
      if (v13)
      {
        if (*((_DWORD *)v13 + 7) != 2)
        {
          *((_DWORD *)v13 + 7) -= 2;
          return v9;
        }
        if ((*((_WORD *)v13 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v13);
          return v9;
        }
      }
    }
    return v9;
  }
  __break(1u);
  return result;
}

- (id)wordsInCurrentParagraph
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  return (id)MEMORY[0x1F4173E08](self, a2);
}

- (BOOL)selectionAtDocumentStart
{
  if (!self)
  {
    LOBYTE(m_ptr) = 0;
    return (char)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (char)m_ptr;
  }
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  LOBYTE(m_ptr) = WebCore::isStartOfDocument((WebCore *)&v6, v4);
  uint64_t v5 = v6;
  unsigned __int16 v6 = 0;
  if (!v5) {
    return (char)m_ptr;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return (char)m_ptr;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return (char)m_ptr;
  }
  WebCore::Node::removedLastRef(v5);
  return (char)m_ptr;
}

- (BOOL)selectionAtSentenceStart
{
  if (!self)
  {
    m_ptr = 0;
    if (*(unsigned char *)(*(void *)(MEMORY[0x128] + 3096) + 153)) {
      goto LABEL_3;
    }
    return 0;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!*(unsigned char *)(*(void *)(*((void *)m_ptr + 37) + 3096) + 153)) {
    return 0;
  }
LABEL_3:
  WebCore::Document::updateLayout();
  uint64_t v3 = *(void *)(*((void *)m_ptr + 37) + 3096);
  return MEMORY[0x1F41749E8](v3);
}

- (BOOL)selectionAtWordStart
{
  if (!self)
  {
    m_ptr = 0;
    if (*(unsigned char *)(*(void *)(MEMORY[0x128] + 3096) + 153)) {
      goto LABEL_3;
    }
    return 0;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!*(unsigned char *)(*(void *)(*((void *)m_ptr + 37) + 3096) + 153)) {
    return 0;
  }
LABEL_3:
  WebCore::Document::updateLayout();
  uint64_t v3 = *(void *)(*((void *)m_ptr + 37) + 3096);
  return MEMORY[0x1F41749E0](v3);
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  WebCore::FrameSelection::rangeByMovingCurrentSelection(*(WebCore::FrameSelection **)(*((void *)self->_private->coreFrame.m_ptr
                                                                                       + 37)
                                                                                     + 3096));
  uint64_t v3 = kit();
  if (!v7) {
    return v3;
  }
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (!v5) {
    return v3;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  WebCore::FrameSelection::rangeByExtendingCurrentSelection(*(WebCore::FrameSelection **)(*((void *)self->_private->coreFrame.m_ptr
                                                                                          + 37)
                                                                                        + 3096));
  uint64_t v3 = kit();
  if (!v7) {
    return v3;
  }
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (!v5) {
    return v3;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (void)selectNSRange:(_NSRange)a3 onElement:(id)a4
{
  if (self && a4 && self->_private->coreFrame.m_ptr)
  {
    uint64_t v4 = (WebCore::Node *)core((uint64_t)a4);
    *((_DWORD *)v4 + 7) += 4;
    WebCore::SimpleRange::SimpleRange();
    WebCore::VisibleSelection::VisibleSelection();
    WebCore::FrameSelection::setSelection();
    WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v7);
    if (v6)
    {
      if (*((_DWORD *)v6 + 7) == 2)
      {
        if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v6);
        }
      }
      else
      {
        *((_DWORD *)v6 + 7) -= 2;
      }
    }
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
    if (v4)
    {
      if (*((_DWORD *)v4 + 7) == 2)
      {
        if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v4);
        }
      }
      else
      {
        *((_DWORD *)v4 + 7) -= 2;
      }
    }
    if (v4)
    {
      if (*((_DWORD *)v4 + 7) == 2)
      {
        if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v4);
        }
      }
      else
      {
        *((_DWORD *)v4 + 7) -= 2;
      }
    }
  }
}

- (id)markedTextDOMRange
{
  if (!self) {
    return 0;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  WebCore::Editor::compositionRange((uint64_t *)&v8, v3);
  uint64_t v4 = kit();
  if (!v10) {
    return v4;
  }
  uint64_t v5 = v9;
  BOOL v9 = 0;
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
  char v7 = v8;
  BOOL v8 = 0;
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

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      (*(void (**)(void))(**(void **)(*(void *)(*(void *)(*((void *)m_ptr + 3) + 8) + 48) + 16) + 680))();
      WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      MEMORY[0x1E4E442D0](&v16, a3);
      WebCore::Editor::setComposition();
      char v7 = v16;
      uint64_t v16 = 0;
      if (v7)
      {
        if (*(_DWORD *)v7 == 2) {
          WTF::StringImpl::destroy(v7, v6);
        }
        else {
          *(_DWORD *)v7 -= 2;
        }
      }
      uint64_t v8 = *(void *)(*(void *)(*(void *)(*((void *)m_ptr + 3) + 8) + 48) + 16);
      (*(void (**)(uint64_t))(*(void *)v8 + 688))(v8);
      char v10 = v17;
      if (HIDWORD(v18))
      {
        uint64_t v11 = 32 * HIDWORD(v18);
        int v12 = (uint64_t *)((char *)v17 + 16);
        do
        {
          uint64_t v14 = *v12;
          v12 += 4;
          uint64_t v13 = v14;
          if ((v14 & 0x8000000000000) != 0)
          {
            char v15 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFLL);
            if (atomic_fetch_add((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v15);
              WTF::fastFree((WTF *)v15, v9);
            }
          }
          v11 -= 32;
        }
        while (v11);
        char v10 = v17;
      }
      if (v10)
      {
        uint64_t v17 = 0;
        LODWORD(v18) = 0;
        WTF::fastFree(v10, v9);
      }
    }
  }
}

- (void)setMarkedText:(id)a3 forCandidates:(BOOL)a4
{
  if (!self) {
    return;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  MEMORY[0x1E4E442D0](&v15, a3);
  [a3 length];
  WebCore::Editor::setComposition();
  char v7 = v15;
  char v15 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      uint64_t v8 = HIDWORD(v17);
      BOOL v9 = v16;
      if (!HIDWORD(v17))
      {
LABEL_7:
        if (!v9) {
          return;
        }
        goto LABEL_8;
      }
      goto LABEL_11;
    }
    *(_DWORD *)v7 -= 2;
  }
  uint64_t v8 = HIDWORD(v17);
  BOOL v9 = v16;
  if (!HIDWORD(v17)) {
    goto LABEL_7;
  }
LABEL_11:
  uint64_t v10 = 32 * v8;
  uint64_t v11 = (uint64_t *)((char *)v9 + 16);
  do
  {
    uint64_t v13 = *v11;
    v11 += 4;
    uint64_t v12 = v13;
    if ((v13 & 0x8000000000000) != 0)
    {
      uint64_t v14 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v14);
        WTF::fastFree((WTF *)v14, v6);
      }
    }
    v10 -= 32;
  }
  while (v10);
  BOOL v9 = v16;
  if (v16)
  {
LABEL_8:
    uint64_t v16 = 0;
    LODWORD(v17) = 0;
    WTF::fastFree(v9, v6);
  }
}

- (void)confirmMarkedText:(id)a3
{
  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v5 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      if (WebCore::Editor::client(v5))
      {
        uint64_t v6 = *(void *)(*(void *)(*(void *)(*((void *)m_ptr + 3) + 8) + 48) + 16);
        (*(void (**)(uint64_t))(*(void *)v6 + 680))(v6);
        char v7 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
        uint64_t v8 = v7;
        if (a3)
        {
          MEMORY[0x1E4E442D0](&v12, a3);
          WebCore::Editor::confirmComposition(v8, (const WTF::String *)&v12);
          uint64_t v10 = v12;
          uint64_t v12 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2) {
              WTF::StringImpl::destroy(v10, v9);
            }
            else {
              *(_DWORD *)v10 -= 2;
            }
          }
        }
        else
        {
          WebCore::Editor::confirmMarkedText(v7);
        }
        uint64_t v11 = *(void *)(*(void *)(*(void *)(*((void *)m_ptr + 3) + 8) + 48) + 16);
        (*(void (**)(uint64_t))(*(void *)v11 + 688))(v11);
      }
    }
  }
}

- (void)setText:(id)a3 asChildOfElement:(id)a4
{
  if (self)
  {
    if (a4)
    {
      m_ptr = self->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        uint64_t v6 = (WebCore::Document *)*((void *)m_ptr + 37);
        if (v6)
        {
          WebCore::Document::editor(v6);
          MEMORY[0x1E4E442D0](&v10, a3);
          core((uint64_t)a4);
          WebCore::Editor::setTextAsChildOfElement();
          BOOL v9 = v10;
          uint64_t v10 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2) {
              WTF::StringImpl::destroy(v9, v8);
            }
            else {
              *(_DWORD *)v9 -= 2;
            }
          }
        }
      }
    }
  }
}

- (void)setDictationPhrases:(id)a3 metadata:(id)a4 asChildOfElement:(id)a5
{
  if (self)
  {
    if (a5)
    {
      m_ptr = self->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
        vectorForDictationPhrasesArray((NSArray *)a3, (unsigned int *)&v16);
        core((uint64_t)a5);
        WebCore::Editor::setDictationPhrasesAsChildOfElement();
        BOOL v9 = v16;
        if (v18)
        {
          uint64_t v10 = (WTF *)((char *)v16 + 16 * v18);
          do
          {
            uint64_t v11 = *((unsigned int *)v9 + 3);
            if (v11)
            {
              uint64_t v12 = *(WTF::StringImpl ***)v9;
              uint64_t v13 = 8 * v11;
              do
              {
                uint64_t v14 = *v12;
                WTF::StringImpl *v12 = 0;
                if (v14)
                {
                  if (*(_DWORD *)v14 == 2) {
                    WTF::StringImpl::destroy(v14, v8);
                  }
                  else {
                    *(_DWORD *)v14 -= 2;
                  }
                }
                ++v12;
                v13 -= 8;
              }
              while (v13);
            }
            char v15 = *(WTF **)v9;
            if (*(void *)v9)
            {
              *(void *)BOOL v9 = 0;
              *((_DWORD *)v9 + 2) = 0;
              WTF::fastFree(v15, v8);
            }
            BOOL v9 = (WTF *)((char *)v9 + 16);
          }
          while (v9 != v10);
          BOOL v9 = v16;
        }
        if (v9)
        {
          uint64_t v16 = 0;
          int v17 = 0;
          WTF::fastFree(v9, v8);
        }
      }
    }
  }
}

- (id)interpretationsForCurrentRoot
{
  if (self) {
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  }
  return (id)MEMORY[0x1F4173E18](self, a2);
}

- (void)getDictationResultRanges:(id *)a3 andMetadatas:(id *)a4
{
  if (!a3) {
    return;
  }
  *a3 = 0;
  if (!a4) {
    return;
  }
  *a4 = 0;
  char v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v9 = (WebCore::Document *)*((void *)self->_private->coreFrame.m_ptr + 37);
  uint64_t v10 = *((void *)v9 + 387);
  int v26 = v9;
  if (*(unsigned char *)(v10 + 153))
  {
    uint64_t v11 = WebCore::VisibleSelection::rootEditableElement((WebCore::VisibleSelection *)(v10 + 56));
    if (v11) {
      goto LABEL_5;
    }
LABEL_50:
    *a3 = v7;
    *a4 = v8;
    return;
  }
  uint64_t v11 = WebCore::Document::bodyOrFrameset(v9);
  if (!v11) {
    goto LABEL_50;
  }
LABEL_5:
  char v24 = a3;
  uint64_t v25 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = v26;
  do
  {
    if (!*((void *)v14 + 192)) {
      WebCore::Document::ensureMarkers(v14);
    }
    WebCore::DocumentMarkerController::markersFor();
    int v17 = v29;
    if (v30)
    {
      uint64_t v18 = 8 * v30;
      do
      {
        if (*(void *)v17)
        {
          uint64_t v16 = *(void *)(*(void *)v17 + 8);
          if (*(_DWORD *)(v16 + 8) == 4096)
          {
            if (*(_DWORD *)(v16 + 80) != 3)
            {
              std::__throw_bad_variant_access[abi:sn180100]();
              __break(1u);
              return;
            }
            uint64_t v19 = *(void *)(v16 + 32);
            if (v19)
            {
              WebCore::makeSimpleRange();
              int v20 = kit();
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
              if (v27)
              {
                if (*((_DWORD *)v27 + 7) == 2)
                {
                  if ((*((_WORD *)v27 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v27);
                  }
                }
                else
                {
                  *((_DWORD *)v27 + 7) -= 2;
                }
              }
              uint64_t v28 = 0;
              char v27 = 0;
              if (v19 == v12)
              {
                [v7 removeLastObject];
                [(DOMObjectInternal *)v13 setEnd:[(DOMObjectInternal *)v20 startContainer] offset:[(DOMObjectInternal *)v20 startOffset]];
                [v7 addObject:v13];
              }
              else
              {
                [v8 addObject:v19];
                [v7 addObject:v20];
                if (v20) {
                  CFRetain(v20);
                }
                if (v13) {
                  CFRelease(v13);
                }
                uint64_t v13 = v20;
                uint64_t v12 = v19;
              }
            }
          }
        }
        int v17 = (WTF *)((char *)v17 + 8);
        v18 -= 8;
      }
      while (v18);
      char v21 = (atomic_uint **)v29;
      uint64_t v22 = 8 * v30;
      do
      {
        while (1)
        {
          int v23 = *v21;
          uint64_t *v21 = 0;
          if (v23)
          {
            if (atomic_fetch_add(v23, 0xFFFFFFFF) == 1) {
              break;
            }
          }
          ++v21;
          v22 -= 8;
          if (!v22) {
            goto LABEL_41;
          }
        }
        atomic_store(1u, (unsigned int *)v23);
        WTF::fastFree((WTF *)v23, (void *)v16);
        ++v21;
        v22 -= 8;
      }
      while (v22);
LABEL_41:
      int v17 = v29;
      uint64_t v14 = v26;
    }
    if (v17)
    {
      int v29 = 0;
      WTF::fastFree(v17, (void *)v16);
    }
    if ((*(_WORD *)(v11 + 32) & 4) == 0 || (uint64_t AncestorSibling = *(void *)(v11 + 88)) == 0)
    {
      uint64_t AncestorSibling = *(void *)(v11 + 64);
      if (!AncestorSibling) {
        uint64_t AncestorSibling = WebCore::NodeTraversal::nextAncestorSibling((WebCore::NodeTraversal *)v11, (const Node *)v16);
      }
    }
    uint64_t v11 = AncestorSibling;
  }
  while (AncestorSibling);
  *char v24 = v7;
  id *v25 = v8;
  if (v13) {
    CFRelease(v13);
  }
}

- (id)dictationResultMetadataForRange:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  uint64_t v4 = (WebCore::Document *)*((void *)self->_private->coreFrame.m_ptr + 37);
  if (!*((void *)v4 + 192)) {
    WebCore::Document::ensureMarkers(v4);
  }
  WebCore::makeSimpleRange();
  WebCore::DocumentMarkerController::markersInRange();
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  if (v11)
  {
    if (*((_DWORD *)v11 + 7) == 2)
    {
      if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v11);
      }
    }
    else
    {
      *((_DWORD *)v11 + 7) -= 2;
    }
  }
  uint64_t v6 = v13;
  if (!v14)
  {
    id v3 = 0;
    if (!v13) {
      return v3;
    }
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)(*(void *)v13 + 8);
  if (*(_DWORD *)(v7 + 80) == 3)
  {
    id v3 = *(id *)(v7 + 32);
    uint64_t v8 = 8 * v14;
    do
    {
      while (1)
      {
        BOOL v9 = *(atomic_uint **)v6;
        *(void *)uint64_t v6 = 0;
        if (v9)
        {
          if (atomic_fetch_add(v9, 0xFFFFFFFF) == 1) {
            break;
          }
        }
        uint64_t v6 = (WTF *)((char *)v6 + 8);
        v8 -= 8;
        if (!v8) {
          goto LABEL_22;
        }
      }
      atomic_store(1u, (unsigned int *)v9);
      WTF::fastFree((WTF *)v9, v5);
      uint64_t v6 = (WTF *)((char *)v6 + 8);
      v8 -= 8;
    }
    while (v8);
LABEL_22:
    uint64_t v6 = v13;
    if (!v13) {
      return v3;
    }
LABEL_23:
    WTF::fastFree(v6, v5);
    return v3;
  }
  id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)recursiveSetUpdateAppearanceEnabled:(BOOL)a3
{
  if (self)
  {
    if (self->_private->coreFrame.m_ptr) {
      MEMORY[0x1F416C218]();
    }
  }
}

+ (id)stringWithData:(id)a3 textEncodingName:(id)a4
{
  MEMORY[0x1E4E442D0](&v13, a4);
  PAL::TextEncoding::TextEncoding((PAL::TextEncoding *)v14, (const WTF::String *)&v13);
  uint64_t v6 = v13;
  uint64_t v13 = 0;
  if (!v6)
  {
LABEL_4:
    if (*((void *)&v15 + 1)) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_4;
  }
  uint64_t v6 = (WTF::StringImpl *)WTF::StringImpl::destroy(v6, v5);
  if (*((void *)&v15 + 1))
  {
LABEL_5:
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_8:
  uint64_t v7 = PAL::WindowsLatin1Encoding(v6);
  __int16 v8 = *(_WORD *)(v7 + 24);
  long long v15 = *(_OWORD *)(v7 + 8);
  __int16 v16 = v8;
  if (a3)
  {
LABEL_6:
    objc_msgSend(a3, "bytes", v13);
    [a3 length];
  }
LABEL_9:
  char v17 = 0;
  PAL::TextEncoding::decode();
  if (!v13) {
    return &stru_1F3C7DA90;
  }
  uint64_t v10 = (void *)WTF::StringImpl::operator NSString *();
  uint64_t v11 = v13;
  uint64_t v13 = 0;
  if (!v11) {
    return v10;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    return v10;
  }
  WTF::StringImpl::destroy(v11, v9);
  return v10;
}

- (CGRect)caretRectAtNode:(id)a3 offset:(int)a4 affinity:(unint64_t)a5
{
  if (a3)
  {
    uint64_t v7 = (WebCore::Node *)*((void *)a3 + 2);
    if (v7) {
      *((_DWORD *)v7 + 7) += 2;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v21 = v7;
  WebCore::Position::Position();
  [(WebFrame *)self _caretRectAtPosition:&v22 affinity:a5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  __int16 v16 = v22;
  uint64_t v22 = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 7) == 2)
    {
      if ((*((_WORD *)v16 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v16);
      }
    }
    else
    {
      *((_DWORD *)v16 + 7) -= 2;
    }
  }
  if (v21)
  {
    if (*((_DWORD *)v21 + 7) == 2)
    {
      if ((*((_WORD *)v21 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v21);
      }
    }
    else
    {
      *((_DWORD *)v21 + 7) -= 2;
    }
  }
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (__CTFont)fontForSelection:(BOOL *)a3
{
  BOOL v12 = 0;
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
    WebCore::Editor::fontForSelection(&v11, v5, &v12);
    uint64_t v6 = (_DWORD *)v11;
    if (v11)
    {
      uint64_t v7 = *(__CTFont **)(v11 + 88);
      uint64_t v11 = 0;
      if (*v6 == 1)
      {
        double v9 = (WTF *)MEMORY[0x1E4E479D0](v6);
        WTF::fastFree(v9, v10);
        if (!a3) {
          return v7;
        }
      }
      else
      {
        --*v6;
        if (!a3) {
          return v7;
        }
      }
      goto LABEL_7;
    }
  }
  uint64_t v7 = 0;
  if (a3) {
LABEL_7:
  }
    *a3 = v12;
  return v7;
}

- (void)sendScrollEvent
{
}

- (void)_userScrolled
{
  if (*((void *)self->_private->coreFrame.m_ptr + 36)) {
    MEMORY[0x1F416DAB8]();
  }
}

- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)v20, (WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56));
  if (v22)
  {
    MEMORY[0x1E4E442D0](&v18, a3);
    WebCore::createFragmentFromText((uint64_t *)&v19, (WebCore *)v20, (const WebCore::SimpleRange *)&v18, v11);
    double v13 = kit(v19);
    double v14 = v19;
    double v19 = 0;
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
    double v15 = v18;
    double v18 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v12);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
  }
  else
  {
    double v13 = 0;
  }
  [(WebFrame *)self _replaceSelectionWithFragment:v13 selectReplacement:v8 smartReplace:v7 matchStyle:v6];
  if (v22)
  {
    __int16 v16 = v21;
    char v21 = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 7) == 2)
      {
        if ((*((_WORD *)v16 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v16);
        }
      }
      else
      {
        *((_DWORD *)v16 + 7) -= 2;
      }
    }
    double v17 = v20[0];
    v20[0] = 0;
    if (v17)
    {
      if (*((_DWORD *)v17 + 7) == 2)
      {
        if ((*((_WORD *)v17 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v17);
        }
      }
      else
      {
        *((_DWORD *)v17 + 7) -= 2;
      }
    }
  }
}

- (void)_replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v9 = (void *)[a3 subresources];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        while (1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (!-[WebDataSource subresourceForURL:](-[WebFrame dataSource](self, "dataSource"), "subresourceForURL:", [v14 URL]))break; {
          if (v11 == ++v13)
          }
            goto LABEL_3;
        }
        [(WebDataSource *)[(WebFrame *)self dataSource] addSubresource:v14];
        ++v13;
      }
      while (v11 != v13);
LABEL_3:
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  [(WebFrame *)self _replaceSelectionWithFragment:[(WebDataSource *)[(WebFrame *)self dataSource] _documentFragmentWithArchive:a3] selectReplacement:v6 smartReplace:v5 matchStyle:0];
}

- (void)resetTextAutosizingBeforeLayout
{
  id v3 = [(WebFrame *)self _webHTMLDocumentView];
  if (self)
  {
    if (v3)
    {
      uint64_t v4 = self->_private;
      m_ptr = (const WebCore::Frame *)v4->coreFrame.m_ptr;
      if (m_ptr)
      {
        uint64_t v6 = (uint64_t)v4->coreFrame.m_ptr;
        do
        {
          if (!*(unsigned char *)(v6 + 144))
          {
            uint64_t v7 = *(void *)(v6 + 296);
            if (v7)
            {
              BOOL v8 = *(WebCore::RenderElement **)(v7 + 1984);
              if (v8) {
                WebCore::RenderElement::resetTextAutosizing(v8);
              }
            }
          }
          uint64_t v6 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v6 + 48), m_ptr);
        }
        while (v6);
      }
    }
  }
}

- (void)_setTextAutosizingWidth:(double)a3
{
  uint64_t v3 = *((void *)self->_private->coreFrame.m_ptr + 3);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (v4)
    {
      float v5 = a3;
      *(float *)(v4 + 456) = v5;
    }
  }
}

- (void)_createCaptionPreferencesTestingModeToken
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 3);
  if (v2)
  {
    uint64_t v4 = *(WebCore::Page **)(v2 + 8);
    if (v4)
    {
      float v5 = (WebCore::PageGroup *)WebCore::Page::group(v4);
      uint64_t v6 = (WebCore::CaptionUserPreferences *)WebCore::PageGroup::ensureCaptionPreferences(v5);
      WebCore::CaptionUserPreferences::createTestingModeToken((uint64_t *)&v21, v6);
      BOOL v8 = v21;
      char v21 = 0;
      double v9 = self->_private;
      value = (WTF *)v9->captionPreferencesTestingModeToken.__ptr_.__value_;
      v9->captionPreferencesTestingModeToken.__ptr_.__value_ = (CaptionUserPreferencesTestingModeToken *)v8;
      if (value)
      {
        uint64_t v11 = *(void *)value;
        if (*(void *)value)
        {
          uint64_t v12 = *(void *)(v11 + 8);
          if (v12)
          {
            int v13 = *(_DWORD *)(v12 + 136);
            if (v13) {
              *(_DWORD *)(v12 + 136) = v13 - 1;
            }
          }
          *(void *)value = 0;
          if (atomic_fetch_add((atomic_uint *volatile)v11, 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, (unsigned int *)v11);
            double v14 = value;
            WTF::fastFree((WTF *)v11, v7);
            value = v14;
          }
        }
        else
        {
          *(void *)value = 0;
        }
        WTF::fastFree(value, v7);
        long long v16 = v21;
        char v21 = 0;
        if (v16)
        {
          uint64_t v17 = *(void *)v16;
          if (*(void *)v16)
          {
            uint64_t v18 = *(void *)(v17 + 8);
            if (v18)
            {
              int v19 = *(_DWORD *)(v18 + 136);
              if (v19) {
                *(_DWORD *)(v18 + 136) = v19 - 1;
              }
            }
            *(void *)long long v16 = 0;
            if (atomic_fetch_add((atomic_uint *volatile)v17, 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, (unsigned int *)v17);
              uint64_t v20 = v16;
              WTF::fastFree((WTF *)v17, v15);
              long long v16 = v20;
            }
          }
          else
          {
            *(void *)long long v16 = 0;
          }
          WTF::fastFree(v16, v15);
        }
      }
    }
  }
}

- (void)_setCaptionDisplayMode:(id)a3
{
  uint64_t v3 = *((void *)self->_private->coreFrame.m_ptr + 3);
  if (!v3) {
    return;
  }
  uint64_t v4 = *(WebCore::Page **)(v3 + 8);
  if (!v4) {
    return;
  }
  uint64_t v6 = (WebCore::PageGroup *)WebCore::Page::group(v4);
  uint64_t v7 = WebCore::PageGroup::ensureCaptionPreferences(v6);
  MEMORY[0x1E4E442D0](&v17, a3);
  double v9 = v17;
  if (!v17) {
    return;
  }
  uint64_t v10 = 0;
  char v11 = 1;
  switch(*((_DWORD *)v17 + 1))
  {
    case 6:
      uint64_t v12 = *((void *)v17 + 1);
      if ((*((unsigned char *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v12 & 0xFFDF) != 0x4D
          || (*(_WORD *)(v12 + 2) & 0xFFDF) != 0x41
          || (*(_WORD *)(v12 + 4) & 0xFFDF) != 0x4E
          || (*(_WORD *)(v12 + 6) & 0xFFDF) != 0x55
          || (*(_WORD *)(v12 + 8) & 0xFFDF) != 0x41
          || (*(_WORD *)(v12 + 10) & 0xFFDF) != 0x4C)
        {
          goto LABEL_82;
        }
LABEL_51:
        uint64_t v10 = 3;
        goto LABEL_71;
      }
      if ((*(unsigned char *)v12 & 0xDF) == 0x4D
        && (*(unsigned char *)(v12 + 1) & 0xDF) == 0x41
        && (*(unsigned char *)(v12 + 2) & 0xDF) == 0x4E
        && (*(unsigned char *)(v12 + 3) & 0xDF) == 0x55
        && (*(unsigned char *)(v12 + 4) & 0xDF) == 0x41
        && (*(unsigned char *)(v12 + 5) & 0xDF) == 0x4C)
      {
        goto LABEL_51;
      }
      goto LABEL_82;
    case 8:
      uint64_t v13 = *((void *)v17 + 1);
      if ((*((unsigned char *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v13 & 0xFFDF) != 0x41
          || (*(_WORD *)(v13 + 2) & 0xFFDF) != 0x4C
          || (*(_WORD *)(v13 + 4) & 0xFFDF) != 0x57
          || (*(_WORD *)(v13 + 6) & 0xFFDF) != 0x41
          || (*(_WORD *)(v13 + 8) & 0xFFDF) != 0x59
          || (*(_WORD *)(v13 + 10) & 0xFFDF) != 0x53
          || (*(_WORD *)(v13 + 12) & 0xFFDF) != 0x4F
          || (*(_WORD *)(v13 + 14) & 0xFFDF) != 0x4E)
        {
          goto LABEL_82;
        }
LABEL_60:
        uint64_t v10 = 2;
        goto LABEL_71;
      }
      if ((*(unsigned char *)v13 & 0xDF) == 0x41
        && (*(unsigned char *)(v13 + 1) & 0xDF) == 0x4C
        && (*(unsigned char *)(v13 + 2) & 0xDF) == 0x57
        && (*(unsigned char *)(v13 + 3) & 0xDF) == 0x41
        && (*(unsigned char *)(v13 + 4) & 0xDF) == 0x59
        && (*(unsigned char *)(v13 + 5) & 0xDF) == 0x53
        && (*(unsigned char *)(v13 + 6) & 0xDF) == 0x4F
        && (*(unsigned char *)(v13 + 7) & 0xDF) == 0x4E)
      {
        goto LABEL_60;
      }
      goto LABEL_82;
    case 9:
      uint64_t v14 = *((void *)v17 + 1);
      if ((*((unsigned char *)v17 + 16) & 4) != 0)
      {
        if ((*(unsigned char *)v14 & 0xDF) != 0x41
          || (*(unsigned char *)(v14 + 1) & 0xDF) != 0x55
          || (*(unsigned char *)(v14 + 2) & 0xDF) != 0x54
          || (*(unsigned char *)(v14 + 3) & 0xDF) != 0x4F
          || (*(unsigned char *)(v14 + 4) & 0xDF) != 0x4D
          || (*(unsigned char *)(v14 + 5) & 0xDF) != 0x41
          || (*(unsigned char *)(v14 + 6) & 0xDF) != 0x54
          || (*(unsigned char *)(v14 + 7) & 0xDF) != 0x49)
        {
          goto LABEL_82;
        }
        uint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(v14 + 8);
      }
      else
      {
        if ((*(_WORD *)v14 & 0xFFDF) != 0x41
          || (*(_WORD *)(v14 + 2) & 0xFFDF) != 0x55
          || (*(_WORD *)(v14 + 4) & 0xFFDF) != 0x54
          || (*(_WORD *)(v14 + 6) & 0xFFDF) != 0x4F
          || (*(_WORD *)(v14 + 8) & 0xFFDF) != 0x4D
          || (*(_WORD *)(v14 + 10) & 0xFFDF) != 0x41
          || (*(_WORD *)(v14 + 12) & 0xFFDF) != 0x54
          || (*(_WORD *)(v14 + 14) & 0xFFDF) != 0x49)
        {
          goto LABEL_82;
        }
        uint64_t v10 = 0;
        int v15 = *(unsigned __int16 *)(v14 + 16);
      }
      if ((v15 & 0xFFFFFFDF) != 0x43) {
        goto LABEL_83;
      }
      goto LABEL_71;
    case 0xA:
      uint64_t v16 = *((void *)v17 + 1);
      if ((*((unsigned char *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v16 & 0xFFDF) != 0x46) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 2) & 0xFFDF) != 0x4F) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 4) & 0xFFDF) != 0x52) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 6) & 0xFFDF) != 0x43) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 8) & 0xFFDF) != 0x45) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 10) & 0xFFDF) != 0x44) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 12) & 0xFFDF) != 0x4F) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 14) & 0xFFDF) != 0x4E) {
          goto LABEL_82;
        }
        if ((*(_WORD *)(v16 + 16) & 0xFFDF) != 0x4C) {
          goto LABEL_82;
        }
        uint64_t v10 = 1;
        if ((*(_WORD *)(v16 + 18) & 0xFFDF) != 0x59) {
          goto LABEL_82;
        }
LABEL_71:
        char v11 = 0;
        goto LABEL_83;
      }
      if ((*(unsigned char *)v16 & 0xDF) == 0x46
        && (*(unsigned char *)(v16 + 1) & 0xDF) == 0x4F
        && (*(unsigned char *)(v16 + 2) & 0xDF) == 0x52
        && (*(unsigned char *)(v16 + 3) & 0xDF) == 0x43
        && (*(unsigned char *)(v16 + 4) & 0xDF) == 0x45
        && (*(unsigned char *)(v16 + 5) & 0xDF) == 0x44
        && (*(unsigned char *)(v16 + 6) & 0xDF) == 0x4F
        && (*(unsigned char *)(v16 + 7) & 0xDF) == 0x4E
        && (*(unsigned char *)(v16 + 8) & 0xDF) == 0x4C)
      {
        uint64_t v10 = 1;
        if ((*(unsigned char *)(v16 + 9) & 0xDF) == 0x59) {
          goto LABEL_71;
        }
      }
LABEL_82:
      uint64_t v10 = 0;
LABEL_83:
      uint64_t v17 = 0;
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v8);
        if (v11) {
          return;
        }
      }
      else
      {
        *(_DWORD *)v9 -= 2;
        if (v11) {
          return;
        }
      }
      (*(void (**)(uint64_t, uint64_t))(*(void *)v7 + 24))(v7, v10);
      return;
    default:
      goto LABEL_83;
  }
}

- (void)_replaceSelectionWithFragment:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  if (a3)
  {
    uint64_t v6 = (WebCore::Document *)*((void *)self->_private->coreFrame.m_ptr + 37);
    if (*(unsigned char *)(*((void *)v6 + 387) + 153))
    {
      BOOL v7 = a6;
      BOOL v8 = a5;
      BOOL v9 = a4;
      uint64_t v11 = WebCore::Document::editor(v6);
      uint64_t v12 = *((void *)a3 + 2);
      MEMORY[0x1F4172C68](v11, v12, v9, v8, v7, 14, 0);
    }
  }
}

- (void)removeUnchangeableStyles
{
  uint64_t v2 = WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  MEMORY[0x1F4172C30](v2);
}

- (BOOL)hasRichlyEditableSelection
{
  return MEMORY[0x1F4175100](*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56, a2);
}

- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)v18, (WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56));
  if (v20)
  {
    MEMORY[0x1E4E442D0](&v16, a3);
    WebCore::createFragmentFromText((uint64_t *)&v17, (WebCore *)v18, (const WebCore::SimpleRange *)&v16, v9);
    uint64_t v11 = kit(v17);
    uint64_t v12 = v17;
    uint64_t v17 = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 7) == 2)
      {
        if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v12);
        }
      }
      else
      {
        *((_DWORD *)v12 + 7) -= 2;
      }
    }
    uint64_t v13 = v16;
    uint64_t v16 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v10);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(WebFrame *)self _replaceSelectionWithFragment:v11 selectReplacement:v6 smartReplace:v5 matchStyle:1];
  if (v20)
  {
    uint64_t v14 = v19;
    int v19 = 0;
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
    int v15 = v18[0];
    v18[0] = 0;
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
  }
}

- (void)_replaceSelectionWithMarkupString:(id)a3 baseURLString:(id)a4 selectReplacement:(BOOL)a5 smartReplace:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = [(WebFrame *)self _documentFragmentWithMarkupString:a3 baseURLString:a4];
  [(WebFrame *)self _replaceSelectionWithFragment:v9 selectReplacement:v7 smartReplace:v6 matchStyle:0];
}

- (id)_cacheabilityDictionary
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = v3;
  uint64_t v5 = *((void *)self->_private->coreFrame.m_ptr + 35);
  uint64_t v6 = *(void *)(v5 + 88);
  if (v6 && *(unsigned char *)(v6 + 1588)) {
    uint64_t v3 = (void *)[v3 setObject:MEMORY[0x1E4E49B20](v6 + 1528) forKey:WebFrameMainDocumentError];
  }
  if (**(unsigned char **)(v5 + 56)) {
    uint64_t v3 = (void *)[v4 setObject:MEMORY[0x1E4F1CC38] forKey:WebFrameHasPlugins];
  }
  uint64_t v7 = *(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 728);
  if (v7)
  {
    uint64_t v8 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
    if (v8 && (id v9 = *(WebCore::ThreadGlobalData **)(v8 + 96)) != 0)
    {
      if (*((void *)v9 + 5)) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v3 = (void *)WebCore::threadGlobalDataSlow((WebCore *)v3);
      id v9 = (WebCore::ThreadGlobalData *)v3;
      if (v3[5])
      {
LABEL_10:
        if ((*(void *)(v7 + 16) & 0x1000000000000) == 0) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
    uint64_t v3 = (void *)WebCore::ThreadGlobalData::initializeEventNames(v9);
    if ((*(void *)(v7 + 16) & 0x1000000000000) == 0) {
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v3 = (void *)WebCore::EventListenerMap::find();
    if (v3) {
      uint64_t v3 = (void *)[v4 setObject:MEMORY[0x1E4F1CC38] forKey:WebFrameHasUnloadListener];
    }
  }
LABEL_13:
  uint64_t v10 = (Document *)*((void *)self->_private->coreFrame.m_ptr + 37);
  if (v10)
  {
    uint64_t v11 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)v3);
    if (WebCore::DatabaseManager::hasOpenDatabases(v11, v10)) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKey:WebFrameUsesDatabases];
    }
  }
  return v4;
}

- (BOOL)_allowsFollowingLink:(id)a3
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 1;
  }
  WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*((void *)m_ptr + 37) + 208));
  uint64_t v5 = (WebCore::OriginAccessPatternsForWebProcess *)MEMORY[0x1E4E441F0](&v10, a3);
  WebCore::OriginAccessPatternsForWebProcess::singleton(v5);
  canDispladouble y = WebCore::SecurityOrigin::canDisplay();
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (!v8) {
    return canDisplay;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return canDisplay;
  }
  WTF::StringImpl::destroy(v8, v6);
  return canDisplay;
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 withGlobalObject:(OpaqueJSValue *)a4 inScriptWorld:(id)a5
{
  uint64_t v5 = &stru_1F3C7DA90;
  if (!a3 || !a5) {
    return v5;
  }
  id v9 = (WebCore::ScriptController *)*((void *)self->_private->coreFrame.m_ptr + 38);
  uint64_t v10 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)self);
  uint64_t v11 = *(WebCore::JSDOMWindowBase **)(WebCore::ScriptController::jsWindowProxy(v9, v10) + 16);
  if (!strcmp(*(const char **)(16 * *(unsigned int *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C)), "JSWindowProxy"))
  {
    uint64_t v11 = (WebCore::JSDOMWindowBase *)*((void *)a4 + 2);
    uint64_t v12 = *(unsigned int *)(16 * (*(_DWORD *)v11 & 0xFFFFFFFE) + 0x4C);
    BOOL v13 = *(_DWORD *)(16 * (*(_DWORD *)v11 & 0xFFFFFFFE) + 0x4C) != 0;
    uint64_t v14 = 16 * v12;
    if (v12) {
      BOOL v15 = v14 == MEMORY[0x1E4FB64A0];
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      do
      {
        uint64_t v14 = *(void *)(v14 + 16);
        BOOL v13 = v14 != 0;
      }
      while (v14 != MEMORY[0x1E4FB64A0] && v14 != 0);
    }
    if (!v13) {
      return &stru_1F3C7DA90;
    }
  }
  if (!v11) {
    return &stru_1F3C7DA90;
  }
  uint64_t v17 = WebCore::JSDOMWindowBase::wrapped(v11);
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 104))(v17);
  int v19 = *(void **)(*(void *)(v18 + 280) + 16);
  if ((*(uint64_t (**)(void *))(*v19 + 1072))(v19))
  {
    char v20 = 0;
  }
  else
  {
    char v20 = (void *)v19[2];
    if (v20)
    {
      CFRetain(v20);
      char v21 = 0;
      goto LABEL_21;
    }
  }
  char v21 = 1;
LABEL_21:
  char v22 = *(WebCore::ScriptController **)(v18 + 304);
  int v23 = *(WebCore::DOMWrapperWorld **)(*((void *)a5 + 1) + 8);
  MEMORY[0x1E4E442D0](v31, a3);
  unint64_t v25 = WebCore::ScriptController::executeUserAgentScriptInWorldIgnoringException(v22, v23, (const WTF::String *)v31);
  v31[1] = (WTF::StringImpl *)v25;
  int v26 = v31[0];
  v31[0] = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2)
    {
      WTF::StringImpl::destroy(v26, v24);
      uint64_t v5 = &stru_1F3C7DA90;
      if (!*(void *)(v20[1] + 8)) {
        goto LABEL_47;
      }
      goto LABEL_27;
    }
    *(_DWORD *)v26 -= 2;
  }
  uint64_t v5 = &stru_1F3C7DA90;
  if (!*(void *)(v20[1] + 8)) {
    goto LABEL_47;
  }
LABEL_27:
  if (!v25) {
    goto LABEL_47;
  }
  if ((v25 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    goto LABEL_33;
  }
  if ((v25 & 0xFFFE000000000002) == 0)
  {
    if (*(unsigned char *)(v25 + 5) != 2) {
      goto LABEL_47;
    }
LABEL_33:
    JSC::JSLockHolder::JSLockHolder();
    if ((v25 & 0xFFFE000000000002) != 0 || *(unsigned char *)(v25 + 5) != 2)
    {
      JSC::JSValue::toWTFStringSlowCase();
      char v27 = v30;
    }
    else
    {
      char v27 = *(WTF::StringImpl **)(v25 + 8);
      if (v27) {
        char v27 = *(WTF::StringImpl **)JSC::JSRopeString::resolveRope();
      }
      if (v27) {
        *(_DWORD *)v27 += 2;
      }
      unsigned int v30 = v27;
    }
    if (v27)
    {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (v30)
      {
        if (*(_DWORD *)v30 == 2) {
          WTF::StringImpl::destroy(v30, v28);
        }
        else {
          *(_DWORD *)v30 -= 2;
        }
      }
    }
    MEMORY[0x1E4E43B10](v31);
    goto LABEL_47;
  }
  if (v25 >> 49) {
    goto LABEL_33;
  }
LABEL_47:
  if ((v21 & 1) == 0) {
    CFRelease(v20);
  }
  return v5;
}

- (OpaqueJSContext)_globalContextForScriptWorld:(id)a3
{
  CGRect result = 0;
  if (a3)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v6 = *(WebCore::DOMWrapperWorld **)(*((void *)a3 + 1) + 8);
      if (v6) {
        return *(OpaqueJSContext **)(WebCore::ScriptController::jsWindowProxy(*((WebCore::ScriptController **)m_ptr + 38), v6)+ 16);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)_javaScriptContextForScriptWorld:(id)a3
{
  id result = [(WebFrame *)self _globalContextForScriptWorld:a3];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = (void *)MEMORY[0x1E4F30920];
    return (id)[v5 contextWithJSGlobalContextRef:v4];
  }
  return result;
}

- (void)setAccessibleName:(id)a3
{
  unsigned __int8 v3 = atomic_load(MEMORY[0x1E4FB64B0]);
  if (v3)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v5 = (WebCore::Document *)*((void *)m_ptr + 37);
      if (v5)
      {
        uint64_t v7 = (WebCore::AXObjectCache *)WebCore::Document::axObjectCache(v5);
        uint64_t v8 = WebCore::AXObjectCache::rootObject(v7);
        if (v8)
        {
          uint64_t v10 = v8;
          WTF::AtomStringImpl::add((uint64_t *)&v13, (WTF::AtomStringImpl *)a3, v9);
          (*(void (**)(uint64_t, WTF::StringImpl **))(*(void *)v10 + 1352))(v10, &v13);
          uint64_t v12 = v13;
          BOOL v13 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2) {
              WTF::StringImpl::destroy(v12, v11);
            }
            else {
              *(_DWORD *)v12 -= 2;
            }
          }
        }
      }
    }
  }
}

- (BOOL)enhancedAccessibilityEnabled
{
  return MEMORY[0x1F416D258](self, a2);
}

- (void)setEnhancedAccessibility:(BOOL)a3
{
}

- (id)_layerTreeAsText
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return &stru_1F3C7DA90;
  }
  unsigned __int8 v3 = (WebCore::RenderView *)WebCore::LocalFrame::contentRenderer((WebCore::LocalFrame *)m_ptr);
  WebCore::RenderView::compositor(v3);
  WebCore::RenderLayerCompositor::layerTreeAsText();
  if (!v7) {
    return &stru_1F3C7DA90;
  }
  uint64_t v5 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v7 == 2)
  {
    WTF::StringImpl::destroy(v7, v4);
    return v5;
  }
  else
  {
    *(_DWORD *)v7 -= 2;
    return v5;
  }
}

- (id)accessibilityRoot
{
  unsigned __int8 v3 = atomic_load(MEMORY[0x1E4FB64B0]);
  if ((v3 & 1) == 0) {
    atomic_store(1u, MEMORY[0x1E4FB64B0]);
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v5 = (WebCore::Document *)*((void *)m_ptr + 37);
  if (!v5) {
    return 0;
  }
  id result = (id)WebCore::Document::axObjectCache(*((WebCore::Document **)m_ptr + 37));
  if (result)
  {
    uint64_t v7 = (WebCore::AXObjectCache *)WebCore::Document::axObjectCache(v5);
    id result = (id)WebCore::AXObjectCache::rootObjectForFrame(v7, (WebCore::LocalFrame *)self->_private->coreFrame.m_ptr);
    if (result)
    {
      uint64_t v8 = (id *)result;
      if ((*(unsigned int (**)(id))(*(void *)result + 128))(result))
      {
        if ((*((uint64_t (**)(id *))*v8 + 364))(v8)) {
          uint64_t v8 = (id *)(*((uint64_t (**)(id *))*v8 + 364))(v8);
        }
      }
      return v8[3];
    }
  }
  return result;
}

- (void)_clearOpener
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F4172A08](m_ptr, a2);
  }
}

- (BOOL)hasRichlyEditableDragCaret
{
  uint64_t v2 = *((void *)self->_private->coreFrame.m_ptr + 3);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
    return MEMORY[0x1F41753D0](*(void *)(v3 + 56), a2);
  }
  else {
    return 0;
  }
}

- (id)_computePageRectsWithPrintScaleFactor:(float)a3 pageSize:(CGSize)a4
{
  if (a3 <= 0.0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  if (!*((void *)m_ptr + 37)) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = (WebCore::ScrollView *)*((void *)m_ptr + 36);
  if (!v6) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  double height = a4.height;
  double width = a4.width;
  if (!WebCore::ScrollView::documentView(v6)) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = *((void *)self->_private->coreFrame.m_ptr + 37);
  uint64_t v11 = *(void *)(v10 + 1984);
  if (!v11) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  WebCore::RenderView::documentRect(*(WebCore::RenderView **)(v10 + 1984));
  float v14 = height;
  if ((*(_DWORD *)(v11 + 120) & 6u) - 2 >= 4) {
    float v15 = (float)v12 / a3;
  }
  else {
    float v15 = width;
  }
  if ((*(_DWORD *)(v11 + 120) & 6u) - 2 >= 4) {
    float v16 = v14;
  }
  else {
    float v16 = (float)v13 / a3;
  }
  WebCore::PrintContext::PrintContext((WebCore::PrintContext *)v25, (WebCore::LocalFrame *)self->_private->coreFrame.m_ptr);
  v24.var0 = v15;
  v24.var1 = v16;
  WebCore::PrintContext::computePageRectsWithPageSize((WebCore::PrintContext *)v25, &v24);
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = (void *)[v17 initWithCapacity:v27];
  if (v27)
  {
    uint64_t v19 = v26;
    uint64_t v20 = 16 * v27;
    do
    {
      uint64_t NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement) {
        [v18 addObject:NSArrayElement];
      }
      v19 += 16;
      v20 -= 16;
    }
    while (v20);
  }
  CFTypeRef v22 = (id)CFMakeCollectable(v18);
  MEMORY[0x1E4E44E80](v25);
  return (id)v22;
}

- (id)_documentFragmentForText:(id)a3
{
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)v14, (WebCore::VisibleSelection *)(*(void *)(*((void *)self->_private->coreFrame.m_ptr + 37) + 3096) + 56));
  if (!v16) {
    return 0;
  }
  MEMORY[0x1E4E442D0](&v12, a3);
  WebCore::createFragmentFromText((uint64_t *)&v13, (WebCore *)v14, (const WebCore::SimpleRange *)&v12, v4);
  uint64_t v6 = kit(v13);
  uint64_t v7 = v13;
  int v13 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  CFStringRef v9 = v12;
  int v12 = 0;
  if (!v9) {
    goto LABEL_12;
  }
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
LABEL_12:
    if (!v16) {
      return v6;
    }
    goto LABEL_15;
  }
  WTF::StringImpl::destroy(v9, v5);
  if (!v16) {
    return v6;
  }
LABEL_15:
  uint64_t v10 = v15;
  float v15 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  uint64_t v11 = v14[0];
  v14[0] = 0;
  if (!v11) {
    return v6;
  }
  if (*((_DWORD *)v11 + 7) != 2)
  {
    *((_DWORD *)v11 + 7) -= 2;
    return v6;
  }
  if ((*((_WORD *)v11 + 17) & 0x400) != 0) {
    return v6;
  }
  WebCore::Node::removedLastRef(v11);
  return v6;
}

- (id)_documentFragmentForWebArchive:(id)a3
{
  id v4 = [(WebFrame *)self dataSource];
  return [(WebDataSource *)v4 _documentFragmentWithArchive:a3];
}

- (id)_documentFragmentForImageData:(id)a3 withRelativeURLPart:(id)a4 andMIMEType:(id)a5
{
  CFStringRef v9 = [WebResource alloc];
  MEMORY[0x1E4E442D0](&v16, a4);
  WTF::URL::fakeURLWithRelativePart();
  uint64_t v11 = [(WebResource *)v9 initWithData:a3 URL:WTF::URL::operator NSURL *() MIMEType:a5 textEncodingName:0 frameName:0];
  int v12 = v17;
  id v17 = 0;
  if (!v12)
  {
LABEL_4:
    int v13 = v16;
    char v16 = 0;
    if (!v13) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v10);
  int v13 = v16;
  char v16 = 0;
  if (!v13) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v13 == 2) {
    WTF::StringImpl::destroy(v13, v10);
  }
  else {
    *(_DWORD *)v13 -= 2;
  }
LABEL_10:
  float v14 = objc_msgSend(-[WebFrame _dataSource](self, "_dataSource", v16, v17), "_documentFragmentWithImageResource:", v11);
  if (v11) {
    CFRelease(v11);
  }
  return v14;
}

- (BOOL)focusedNodeHasContent
{
  m_ptr = self->_private->coreFrame.m_ptr;
  uint64_t v3 = (WebCore::Document *)*((void *)m_ptr + 37);
  uint64_t v4 = *((void *)v3 + 387);
  if (!*(unsigned char *)(v4 + 153))
  {
LABEL_6:
    uint64_t v6 = WebCore::Document::bodyOrFrameset(v3);
    if (!v6) {
      return v6;
    }
    goto LABEL_7;
  }
  uint64_t v5 = (WebCore::VisibleSelection *)(v4 + 56);
  if ((WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(v4 + 56)) & 1) == 0)
  {
    uint64_t v3 = (WebCore::Document *)*((void *)m_ptr + 37);
    goto LABEL_6;
  }
  uint64_t v6 = WebCore::VisibleSelection::rootEditableElement(v5);
  if (!v6) {
    return v6;
  }
LABEL_7:
  if (!*(void *)(v6 + 88)) {
    return 0;
  }
  *(_DWORD *)(v6 + 28) += 2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  uint64_t v8 = v12;
  int v12 = 0;
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  if (*(_DWORD *)(v6 + 28) == 2)
  {
    if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
      WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
  }
  else
  {
    *(_DWORD *)(v6 + 28) -= 2;
  }
  *(_DWORD *)(v6 + 28) += 2;
  WebCore::ContainerNode::countChildNodes((WebCore::ContainerNode *)v6);
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  if (*(_DWORD *)(v6 + 28) == 2)
  {
    if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
      WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
  }
  else
  {
    *(_DWORD *)(v6 + 28) -= 2;
  }
  BOOL v9 = WebCore::operator==((uint64_t)v13, (uint64_t)&v12);
  uint64_t v10 = v12;
  int v12 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  LOBYTE(v6) = !v9;
  uint64_t v11 = v13[0];
  v13[0] = 0;
  if (!v11) {
    return v6;
  }
  if (*(_DWORD *)(v11 + 28) == 2)
  {
    if ((*(_WORD *)(v11 + 34) & 0x400) != 0) {
      return v6;
    }
    WebCore::Node::removedLastRef((WebCore::Node *)v11);
    return v6;
  }
  else
  {
    *(_DWORD *)(v11 + 28) -= 2;
    return v6;
  }
}

- (void)_dispatchDidReceiveTitle:(id)a3
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *(void *)(*((void *)m_ptr + 35) + 16);
    MEMORY[0x1E4E442D0](&v7, a3);
    char v8 = 0;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(void *)v4 + 296))(v4, &v7);
    uint64_t v6 = v7;
    uint64_t v7 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
}

- (OpaqueJSValue)jsWrapperForNode:(id)a3 inScriptWorld:(id)a4
{
  uint64_t v4 = 0;
  if (a4)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v7 = *(void *)(WebCore::ScriptController::jsWindowProxy(*((WebCore::ScriptController **)m_ptr + 38), *(WebCore::DOMWrapperWorld **)(*((void *)a4 + 1) + 8))+ 16);
      JSC::JSLockHolder::JSLockHolder();
      if (a3) {
        uint64_t v8 = *((void *)a3 + 2);
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v4 = (OpaqueJSValue *)WebCore::toJS(v7, v7, v8);
      MEMORY[0x1E4E43B10](v10);
    }
  }
  return v4;
}

- (id)elementAtPoint:(CGPoint)a3
{
  CGPoint v9 = a3;
  if (!self->_private->coreFrame.m_ptr) {
    return 0;
  }
  uint64_t v3 = [WebElementDictionary alloc];
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v7, &v9);
  int8x8_t v4 = (int8x8_t)vcgt_s32(v7[0], (int32x2_t)0xFE000000FE000000);
  v7[1] = (int32x2_t)vorr_s8((int8x8_t)(*(void *)&v4 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, v7[0]), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32(v7[0], 6uLL)), v4));
  WebCore::EventHandler::hitTestResultAtPoint();
  CFTypeRef v5 = (id)CFMakeCollectable([(WebElementDictionary *)v3 initWithHitTestResult:v8]);
  MEMORY[0x1E4E450F0](v8);
  return (id)v5;
}

- (id)_unreachableURL
{
  id v2 = [(WebFrame *)self _dataSource];
  return (id)[v2 unreachableURL];
}

- (void)_generateTestReport:(id)a3 withGroup:(id)a4
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = *((void *)m_ptr + 37);
    if (v5)
    {
      *(_DWORD *)(v5 + 28) += 2;
      if (!*(void *)(v5 + 3232)) {
        WebCore::Document::ensureReportingScope((WebCore::Document *)v5);
      }
      MEMORY[0x1E4E442D0](&v13, a3);
      MEMORY[0x1E4E442D0](&v12, a4);
      WebCore::ReportingScope::generateTestReport();
      CGPoint v9 = v12;
      int v12 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
        {
          WTF::StringImpl::destroy(v9, v8);
          uint64_t v10 = v13;
          int v13 = 0;
          if (!v10) {
            goto LABEL_13;
          }
LABEL_11:
          if (*(_DWORD *)v10 == 2)
          {
            WTF::StringImpl::destroy(v10, v8);
            int v11 = *(_DWORD *)(v5 + 28) - 2;
            if (*(_DWORD *)(v5 + 28) != 2) {
              goto LABEL_14;
            }
LABEL_17:
            if ((*(_WORD *)(v5 + 34) & 0x400) == 0) {
              WebCore::Node::removedLastRef((WebCore::Node *)v5);
            }
            return;
          }
          *(_DWORD *)v10 -= 2;
LABEL_13:
          int v11 = *(_DWORD *)(v5 + 28) - 2;
          if (*(_DWORD *)(v5 + 28) != 2)
          {
LABEL_14:
            *(_DWORD *)(v5 + 28) = v11;
            return;
          }
          goto LABEL_17;
        }
        *(_DWORD *)v9 -= 2;
      }
      uint64_t v10 = v13;
      int v13 = 0;
      if (!v10) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
}

- (WebFrame)init
{
  return 0;
}

- (WebFrame)initWithName:(NSString *)name webFrameView:(WebFrameView *)view webView:(WebView *)webView
{
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics) {
    --WebFrameCount;
  }

  v4.receiver = self;
  v4.super_class = (Class)WebFrame;
  [(WebFrame *)&v4 dealloc];
}

- (NSString)name
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  WebCore::FrameTree::uniqueName((uint64_t *)&v7, (WebCore::FrameTree *)((char *)m_ptr + 48));
  if (!v7) {
    return (NSString *)&stru_1F3C7DA90;
  }
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (!v5) {
    return v4;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v5, v3);
  return v4;
}

- (WebFrameView)frameView
{
  return (WebFrameView *)self->_private->webFrameView.m_ptr;
}

- (WebView)webView
{
  if (!self) {
    return 0;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = *((void *)m_ptr + 3);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if (!v4
    || ((*(uint64_t (**)(void, SEL))(**(void **)(*(void *)(v4 + 48) + 16) + 1368))(*(void *)(*(void *)(v4 + 48) + 16), a2) & 1) != 0)
  {
    return 0;
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(v4 + 48) + 16) + 16);
  return (WebView *)objc_loadWeak(v6);
}

- (DOMDocument)DOMDocument
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (!objc_msgSend(-[WebFrame _dataSource](self, "_dataSource"), "_isDocumentHTML")) {
    return 0;
  }
  uint64_t v3 = (WebCore::Node *)*((void *)m_ptr + 37);
  if (v3)
  {
    if ((*((_WORD *)v3 + 1703) & 0xC) != 0) {
      return 0;
    }
  }
  return (DOMDocument *)kit(v3);
}

- (DOMHTMLElement)frameElement
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = *((void *)m_ptr + 15);
  if (v3) {
    return (DOMHTMLElement *)kit(*(WebCore::Node **)(v3 + 8));
  }
  else {
    return (DOMHTMLElement *)kit(0);
  }
}

- (WebDataSource)provisionalDataSource
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr && (uint64_t v3 = *(void *)(*((void *)m_ptr + 35) + 96)) != 0) {
    return *(WebDataSource **)(v3 + 3568);
  }
  else {
    return 0;
  }
}

- (WebDataSource)dataSource
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr || !WebCore::FrameLoader::frameHasLoaded(*((WebCore::FrameLoader **)m_ptr + 35))) {
    return 0;
  }
  return (WebDataSource *)[(WebFrame *)self _dataSource];
}

- (void)loadRequest:(NSURLRequest *)request
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = (WebCore::ResourceRequestBase *)MEMORY[0x1E4E45D10](v14, request);
    if ((*(unsigned char *)(WebCore::ResourceRequestBase::url(v5) + 8) & 1) == 0)
    {
      uint64_t v6 = *(void *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)v14);
      if (v6)
      {
        if (*(_DWORD *)(v6 + 4))
        {
          MEMORY[0x1E4E441F0](v13, [MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(@"file:", "stringByAppendingString:", -[NSURL absoluteString](-[NSURLRequest URL](request, "URL"), "absoluteString"))]);
          WebCore::ResourceRequestBase::setURL((WebCore::ResourceRequestBase *)v14, (const WTF::URL *)v13);
          uint64_t v8 = v13[0];
          v13[0] = 0;
          if (v8)
          {
            if (*(_DWORD *)v8 == 2) {
              WTF::StringImpl::destroy(v8, v7);
            }
            else {
              *(_DWORD *)v8 -= 2;
            }
          }
        }
      }
    }
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v11);
    MEMORY[0x1E4E46090](v13, m_ptr, v14, v11);
    WebCore::FrameLoader::load();
    MEMORY[0x1E4E460A0](v13);
    WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v11, v9);
    WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v14, v10);
  }
}

- (void)_loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 unreachableURL:(id)a7
{
  if (a6)
  {
    uint64_t v12 = [a6 absoluteURL];
    uint64_t UniqueWebDataURL = 0;
  }
  else
  {
    WTF::aboutBlankURL((WTF *)self);
    uint64_t v12 = WTF::URL::operator NSURL *();
    uint64_t UniqueWebDataURL = createUniqueWebDataURL();
  }
  MEMORY[0x1E4E442D0](&v105, a4);
  if (((WebCore::MIMETypeRegistry::isSupportedNonImageMIMEType((WebCore::MIMETypeRegistry *)&v105, v14) & 1) != 0
     || (WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v105, v15) & 1) != 0
     || (MEMORY[0x1E4E44240](v105, "text/css", 8) & 1) != 0
     || MEMORY[0x1E4E44240](v105, "application/pdf", 15))
    && (MEMORY[0x1E4E44240](v105, "text/plain", 10) & 1) == 0
    && (MEMORY[0x1E4E44240](v105, "text/xml", 8) & 1) == 0)
  {
    int v18 = MEMORY[0x1E4E44240](v105, "application/xml", 15);
    uint64_t v19 = v105;
    v105 = 0;
    if (!v19) {
      goto LABEL_15;
    }
  }
  else
  {
    int v18 = 1;
    uint64_t v19 = v105;
    v105 = 0;
    if (!v19) {
      goto LABEL_15;
    }
  }
  if (*(_DWORD *)v19 == 2)
  {
    WTF::StringImpl::destroy(v19, v16);
    if (!v18) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  *(_DWORD *)v19 -= 2;
LABEL_15:
  if (!v18) {
    goto LABEL_24;
  }
LABEL_18:
  if (UniqueWebDataURL) {
    uint64_t v20 = (WebCore *)UniqueWebDataURL;
  }
  else {
    uint64_t v20 = (WebCore *)v12;
  }
  WebCore::registerQLPreviewConverterIfNeeded((uint64_t *)cf, v20, (NSURL *)a4, (NSString *)a3, v17);
  if (!cf[0])
  {
LABEL_24:
    MEMORY[0x1E4E441F0](&v105, v12);
    WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)cf, (uint64_t)&v105, 0);
    uint64_t v86 = 0;
    uint64_t v26 = (_DWORD *)*MEMORY[0x1E4F30980];
    if (*MEMORY[0x1E4F30980]) {
      *v26 += 2;
    }
    v87 = v26;
    uint64_t v88 = 0;
    char v89 = 0;
    char v90 = 0;
    char v91 = v91 & 0xE0 | 5;
    v85 |= 2u;
    uint64_t v92 = 0;
    unsigned int v27 = v105;
    v105 = 0;
    if (v27)
    {
      if (*(_DWORD *)v27 == 2) {
        WTF::StringImpl::destroy(v27, v25);
      }
      else {
        *(_DWORD *)v27 -= 2;
      }
    }
    MEMORY[0x1E4E441F0](&v105, UniqueWebDataURL);
    MEMORY[0x1E4E442D0](v93, a4);
    uint64_t v28 = [a3 length];
    MEMORY[0x1E4E442D0](&v60, a5);
    WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)&v61, (const WTF::URL *)&v105, (const WTF::String *)v93, v28, (const WTF::String *)&v60);
    CFTypeRef v82 = 0;
    char v83 = 0;
    BYTE2(v76) = BYTE2(v76) & 0xF1 | 4;
    unsigned int v30 = v60;
    v60 = 0;
    if (v30)
    {
      if (*(_DWORD *)v30 == 2)
      {
        WTF::StringImpl::destroy(v30, v29);
        uint64_t v31 = v93[0];
        v93[0] = 0;
        if (!v31) {
          goto LABEL_38;
        }
LABEL_36:
        if (*(_DWORD *)v31 == 2)
        {
          WTF::StringImpl::destroy(v31, v29);
          int v32 = v105;
          v105 = 0;
          if (!v32) {
            goto LABEL_44;
          }
LABEL_41:
          if (*(_DWORD *)v32 == 2) {
            WTF::StringImpl::destroy(v32, v29);
          }
          else {
            *(_DWORD *)v32 -= 2;
          }
LABEL_44:
          WebCore::FragmentedSharedBuffer::create((uint64_t *)&v105, (WebCore::FragmentedSharedBuffer *)a3, (NSData *)v29);
          char v33 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x38);
          MEMORY[0x1E4E44F40](v33, &v105);
          v60 = v33;
          WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v105, v34);
          char v35 = v60;
          MEMORY[0x1E4E441F0](&v105, objc_msgSend(a7, "absoluteURL", 0));
          v93[0] = v35;
          v37 = v105;
          if (v105) {
            *(_DWORD *)v105 += 2;
          }
          v93[1] = v37;
          long long v94 = v106;
          long long v95 = v107;
          v38 = v61;
          if (v61) {
            *v61 += 2;
          }
          *(void *)&v96[0] = v38;
          *(_OWORD *)((char *)v96 + 8) = v62;
          *(_OWORD *)((char *)&v96[1] + 8) = v63;
          v39 = v64;
          if (v64) {
            *v64 += 2;
          }
          v40 = v66;
          *((void *)&v96[2] + 1) = v39;
          *(void *)&long long v97 = v65;
          if (v66) {
            *v66 += 2;
          }
          *((void *)&v97 + 1) = v40;
          v41 = v67;
          if (v67) {
            *v67 += 2;
          }
          *(void *)&long long v98 = v41;
          v42 = v68;
          if (v68) {
            *v68 += 2;
          }
          unsigned int v43 = v70;
          DWORD2(v99) = 0;
          *((void *)&v98 + 1) = v42;
          *(void *)&long long v99 = 0;
          HIDWORD(v99) = v70;
          if (v70)
          {
            if (v70 >> 28) {
              goto LABEL_88;
            }
            uint64_t v44 = WTF::fastMalloc((WTF *)(16 * v70));
            DWORD2(v99) = v43;
            *(void *)&long long v99 = v44;
            if (v70)
            {
              uint64_t v45 = v69;
              uint64_t v46 = v69 + 16 * v70;
              do
              {
                *(_WORD *)uint64_t v44 = *(_WORD *)v45;
                v47 = *(_DWORD **)(v45 + 8);
                if (v47) {
                  *v47 += 2;
                }
                *(void *)(v44 + 8) = v47;
                v45 += 16;
                v44 += 16;
              }
              while (v45 != v46);
            }
          }
          unsigned int v48 = v72;
          DWORD2(v100) = 0;
          *(void *)&long long v100 = 0;
          HIDWORD(v100) = v72;
          if (!v72)
          {
LABEL_72:
            v54 = v73;
            if (v73) {
              atomic_fetch_add(v73, 1u);
            }
            *(void *)&long long v101 = v54;
            BYTE8(v101) = 0;
            LOBYTE(v102[0]) = 0;
            if (v75)
            {
              *((void *)&v101 + 1) = v74;
              if (v74) {
                CFRetain(v74);
              }
              LOBYTE(v102[0]) = 1;
            }
            *(_OWORD *)((char *)&v102[5] + 8) = *(_OWORD *)v81;
            *(_DWORD *)((char *)&v102[6] + 7) = *(_DWORD *)&v81[15];
            *(_OWORD *)((char *)&v102[3] + 8) = v79;
            *(_OWORD *)((char *)&v102[4] + 8) = v80;
            *(_OWORD *)((char *)v102 + 8) = v76;
            *(_OWORD *)((char *)&v102[1] + 8) = v77;
            *(_OWORD *)((char *)&v102[2] + 8) = v78;
            *(void *)&long long v103 = v82;
            if (v82) {
              CFRetain(v82);
            }
            BYTE8(v103) = v83;
            LOBYTE(v104) = 1;
            v55 = v105;
            v105 = 0;
            if (v55)
            {
              if (*(_DWORD *)v55 == 2) {
                WTF::StringImpl::destroy(v55, v36);
              }
              else {
                *(_DWORD *)v55 -= 2;
              }
            }
            WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v60, v36);
            MEMORY[0x1E4E46090](&v105);
            WebCore::FrameLoader::load();
            MEMORY[0x1E4E460A0](&v105);
            WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v93, v56);
            CFTypeRef v58 = v82;
            CFTypeRef v82 = 0;
            if (v58) {
              CFRelease(v58);
            }
            WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v61, v57);
            WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)cf, v59);
            return;
          }
          if (!(v72 >> 28))
          {
            v49 = (void *)WTF::fastMalloc((WTF *)(16 * v72));
            DWORD2(v100) = v48;
            *(void *)&long long v100 = v49;
            if (v72)
            {
              uint64_t v50 = v71;
              uint64_t v51 = v71 + 16 * v72;
              do
              {
                v52 = *(_DWORD **)v50;
                if (*(void *)v50) {
                  *v52 += 2;
                }
                void *v49 = v52;
                v53 = *(_DWORD **)(v50 + 8);
                if (v53) {
                  *v53 += 2;
                }
                v49[1] = v53;
                v50 += 16;
                v49 += 2;
              }
              while (v50 != v51);
            }
            goto LABEL_72;
          }
LABEL_88:
          __break(0xC471u);
          JUMPOUT(0x1E13E6EF0);
        }
        *(_DWORD *)v31 -= 2;
LABEL_38:
        int v32 = v105;
        v105 = 0;
        if (!v32) {
          goto LABEL_44;
        }
        goto LABEL_41;
      }
      *(_DWORD *)v30 -= 2;
    }
    uint64_t v31 = v93[0];
    v93[0] = 0;
    if (!v31) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  MEMORY[0x1E4E45D10](&v61);
  uint64_t v104 = 0;
  long long v103 = 0u;
  memset(v102, 0, sizeof(v102));
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v97 = 0u;
  memset(v96, 0, sizeof(v96));
  long long v94 = 0u;
  long long v95 = 0u;
  *(_OWORD *)v93 = 0u;
  WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v93);
  MEMORY[0x1E4E46090](&v105, m_ptr, &v61, v93);
  WebCore::FrameLoader::load();
  MEMORY[0x1E4E460A0](&v105);
  WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v93, v22);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)&v61, v23);
  CFTypeRef v24 = cf[0];
  cf[0] = 0;
  if (v24) {
    CFRelease(v24);
  }
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)encodingName baseURL:(NSURL *)URL
{
  if (MIMEType) {
    CGPoint v9 = (__CFString *)MIMEType;
  }
  else {
    CGPoint v9 = @"text/html";
  }
  id v10 = [(NSURL *)URL _webkit_URLFromURLOrSchemelessFileURL];
  [(WebFrame *)self _loadData:data MIMEType:v9 textEncodingName:encodingName baseURL:v10 unreachableURL:0];
}

- (void)_loadHTMLString:(id)a3 baseURL:(id)a4 unreachableURL:(id)a5
{
  uint64_t v8 = [a3 dataUsingEncoding:4];
  [(WebFrame *)self _loadData:v8 MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:a4 unreachableURL:a5];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)URL
{
  id v6 = [(NSURL *)URL _webkit_URLFromURLOrSchemelessFileURL];
  [(WebFrame *)self _loadHTMLString:string baseURL:v6 unreachableURL:0];
}

- (void)loadAlternateHTMLString:(NSString *)string baseURL:(NSURL *)baseURL forUnreachableURL:(NSURL *)unreachableURL
{
  id v8 = [(NSURL *)baseURL _webkit_URLFromURLOrSchemelessFileURL];
  id v9 = [(NSURL *)unreachableURL _webkit_URLFromURLOrSchemelessFileURL];
  [(WebFrame *)self _loadHTMLString:string baseURL:v8 unreachableURL:v9];
}

- (void)loadArchive:(WebArchive *)archive
{
  uint64_t v3 = [(WebArchive *)archive _coreLegacyWebArchive];
  if (v3)
  {
    ++v3[2];
    uint64_t v4 = v3;
    WebCore::FrameLoader::loadArchive();
    if (v4[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v4 + 8))(v4);
    }
    else {
      --v4[2];
    }
  }
}

- (void)stopLoading
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr) {
    MEMORY[0x1F416C5B8](*((void *)m_ptr + 35), 0);
  }
}

- (void)reload
{
}

- (void)reloadFromOrigin
{
}

- (WebFrame)findFrameNamed:(NSString *)name
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (WebFrame *)m_ptr;
  }
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)name, (const __CFString *)a2);
  uint64_t v4 = WebCore::FrameTree::findByUniqueName();
  if (!v4
    || *(unsigned char *)(v4 + 144)
    || (id v6 = *(void **)(*(void *)(v4 + 280) + 16),
        ((*(uint64_t (**)(void *))(*v6 + 1072))(v6) & 1) != 0))
  {
    m_ptr = 0;
    uint64_t v7 = v9;
    id v9 = 0;
    if (!v7) {
      return (WebFrame *)m_ptr;
    }
  }
  else
  {
    m_ptr = (LocalFrame *)v6[2];
    uint64_t v7 = v9;
    id v9 = 0;
    if (!v7) {
      return (WebFrame *)m_ptr;
    }
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return (WebFrame *)m_ptr;
  }
  WTF::StringImpl::destroy(v7, v5);
  return (WebFrame *)m_ptr;
}

- (WebFrame)parentFrame
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    uint64_t v3 = WebCore::FrameTree::parent((WebCore::FrameTree *)((char *)m_ptr + 48));
    if (v3)
    {
      if (*(unsigned char *)(v3 + 144))
      {
        uint64_t v4 = 0;
LABEL_5:
        uint64_t v5 = (void *)CFMakeCollectable(v4);
        return (WebFrame *)v5;
      }
      uint64_t v7 = *(void **)(*(void *)(v3 + 280) + 16);
      if (((*(uint64_t (**)(void *))(*v7 + 1072))(v7) & 1) == 0)
      {
        uint64_t v4 = (const void *)v7[2];
        if (v4)
        {
          CFRetain(v4);
          uint64_t v5 = (void *)CFMakeCollectable(v4);
          return (WebFrame *)v5;
        }
        goto LABEL_5;
      }
    }
    uint64_t v5 = (void *)CFMakeCollectable(0);
    return (WebFrame *)v5;
  }
  return 0;
}

- (NSArray)childFrames
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:WebCore::FrameTree::childCount((WebCore::FrameTree *)((char *)m_ptr + 48))];
  for (uint64_t i = *((void *)m_ptr + 11); i; uint64_t i = *(void *)(i + 72))
  {
    while (1)
    {
      if (!*(unsigned char *)(i + 144))
      {
        uint64_t v5 = *(void **)(*(void *)(i + 280) + 16);
        if (((*(uint64_t (**)(void *))(*v5 + 1072))(v5) & 1) == 0) {
          break;
        }
      }
      [(NSArray *)v3 addObject:0];
      uint64_t i = *(void *)(i + 72);
      if (!i) {
        return v3;
      }
    }
    [(NSArray *)v3 addObject:v5[2]];
  }
  return v3;
}

- (WebScriptObject)windowObject
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr) {
    return (WebScriptObject *)WebCore::ScriptController::windowScriptObject(*((WebCore::ScriptController **)m_ptr + 38));
  }
  else {
    return 0;
  }
}

- (JSGlobalContextRef)globalContext
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = (WebCore::ScriptController *)*((void *)m_ptr + 38);
  uint64_t v4 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)self);
  return *(JSGlobalContextRef *)(WebCore::ScriptController::jsWindowProxy(v3, v4) + 16);
}

- (JSContext)javaScriptContext
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr) {
    return (JSContext *)WebCore::ScriptController::javaScriptContext(*((WebCore::ScriptController **)m_ptr + 38));
  }
  else {
    return 0;
  }
}

- (id)renderTreeAsExternalRepresentationForPrinting
{
  WebCore::externalRepresentation();
  if (!v5) {
    return &stru_1F3C7DA90;
  }
  uint64_t v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)renderTreeAsExternalRepresentationWithOptions:(unint64_t)a3
{
  WebCore::externalRepresentation();
  if (!v6) {
    return &stru_1F3C7DA90;
  }
  uint64_t v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (int)numberOfPagesWithPageWidth:(float)a3 pageHeight:(float)a4
{
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return -1;
  }
  *(float *)uint64_t v7 = a3;
  *(float *)&v7[1] = a4;
  return WebCore::PrintContext::numberOfPages((WebCore::PrintContext *)m_ptr, (WebCore::LocalFrame *)v7, v4);
}

- (void)printToCGContext:(CGContext *)a3 pageWidth:(float)a4 pageHeight:(float)a5
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_private->coreFrame.m_ptr)
  {
    WebCore::GraphicsContextCG::GraphicsContextCG();
    WebCore::PrintContext::spoolAllPagesWithBoundaries();
    WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v5);
  }
}

- (void)coreFrame
{
  return self->_private->coreFrame.m_ptr;
}

- (VisiblePosition)visiblePositionForPoint:(SEL)a3
{
  if (self) {
    return (VisiblePosition *)-[VisiblePosition _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a4.x, a4.y);
  }
  retstr->var0.var0.var0 = 0;
  *(void *)&retstr->var0.var1 = 0;
  *(void *)&retstr->var1 = 0;
  return self;
}

- (VisiblePosition)closestWordBoundary:(SEL)a3
{
  WebCore::startOfWord();
  WebCore::endOfWord();
  var0 = a4->var0.var0.var0;
  if (a4->var0.var0.var0) {
    *((_DWORD *)var0 + 7) += 2;
  }
  uint64_t v31 = (WebCore::Node *)var0;
  unsigned int var1 = a4->var0.var1;
  char v33 = *((unsigned char *)&a4->var0 + 12);
  if ((v33 & 8) == 0 && ((int v7 = v33 & 7, v7 != 2) ? (v8 = v7 == 4) : (v8 = 1), v8)) {
    unsigned int v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v31);
  }
  else {
    unsigned int v9 = var1;
  }
  id v10 = v38;
  if (v38) {
    *((_DWORD *)v38 + 7) += 2;
  }
  uint64_t v28 = v10;
  unsigned int v29 = v39;
  char v30 = v40;
  if ((v40 & 8) == 0 && ((int v11 = v40 & 7, v11 == 2) || v11 == 4))
  {
    unsigned int v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    id v10 = v28;
  }
  else
  {
    unsigned int v12 = v29;
  }
  uint64_t v28 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  int v13 = v31;
  uint64_t v31 = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 7) == 2)
    {
      if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v13);
      }
    }
    else
    {
      *((_DWORD *)v13 + 7) -= 2;
    }
  }
  float v14 = v34;
  if (v34) {
    *((_DWORD *)v34 + 7) += 2;
  }
  uint64_t v31 = v14;
  unsigned int var1 = v35;
  char v33 = v36;
  if ((v36 & 8) == 0 && ((int v15 = v36 & 7, v15 == 2) || v15 == 4)) {
    unsigned int v16 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v31);
  }
  else {
    unsigned int v16 = var1;
  }
  id v17 = a4->var0.var0.var0;
  if (a4->var0.var0.var0) {
    *((_DWORD *)v17 + 7) += 2;
  }
  uint64_t v28 = (WebCore::Node *)v17;
  unsigned int v29 = a4->var0.var1;
  char v30 = *((unsigned char *)&a4->var0 + 12);
  if ((v30 & 8) == 0 && ((int v18 = v30 & 7, v18 == 2) || v18 == 4))
  {
    unsigned int v19 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    id v17 = (Node *)v28;
  }
  else
  {
    unsigned int v19 = v29;
  }
  uint64_t v28 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 7) == 2)
    {
      if ((*((_WORD *)v17 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v17);
      }
    }
    else
    {
      *((_DWORD *)v17 + 7) -= 2;
    }
  }
  signed int v20 = v9 - v12;
  signed int v21 = v16 - v19;
  CFTypeRef v22 = v31;
  uint64_t v31 = 0;
  if (v22)
  {
    if (*((_DWORD *)v22 + 7) == 2)
    {
      if ((*((_WORD *)v22 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v22);
      }
    }
    else
    {
      *((_DWORD *)v22 + 7) -= 2;
    }
  }
  int v23 = &v39;
  id result = (VisiblePosition *)v38;
  unint64_t v25 = v34;
  if (v20 >= v21) {
    uint64_t v26 = v34;
  }
  else {
    uint64_t v26 = v38;
  }
  if (v26) {
    *((_DWORD *)v26 + 7) += 2;
  }
  retstr->var0.var0.var0 = (Node *)v26;
  if (v20 >= v21) {
    int v23 = &v35;
  }
  retstr->var0.unsigned int var1 = *v23;
  *((unsigned char *)&retstr->var0 + 12) = *((unsigned char *)v23 + 4);
  unsigned int v27 = (BOOL *)&v41;
  if (v20 >= v21) {
    unsigned int v27 = (BOOL *)&v37;
  }
  retstr->unsigned int var1 = *v27;
  __int16 v34 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 7) == 2)
    {
      if ((*((_WORD *)v25 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v25);
        id result = (VisiblePosition *)v38;
      }
    }
    else
    {
      *((_DWORD *)v25 + 7) -= 2;
    }
  }
  v38 = 0;
  if (result)
  {
    if (HIDWORD(result[1].var0.var0.var0) == 2)
    {
      if ((result[1].var0.var1 & 0x4000000) == 0) {
        return (VisiblePosition *)WebCore::Node::removedLastRef((WebCore::Node *)result);
      }
    }
    else
    {
      HIDWORD(result[1].var0.var0.var0) -= 2;
    }
  }
  return result;
}

- (void)clearSelection
{
  id v2 = [(WebFrame *)self coreFrame];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2[37] + 3096);
    MEMORY[0x1F416D848](v3);
  }
}

- (int)selectionState
{
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)([(WebFrame *)self coreFrame] + 296) + 3096) + 153);
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (BOOL)hasSelection
{
  return [(WebFrame *)self selectionState] - 1 < 2;
}

- (CGRect)caretRectForPosition:(id)a3
{
  if (a3)
  {
    [a3 _visiblePosition];
    v17[3] = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)v17, 0);
    v17[4] = v3;
    WebCore::IntRect::operator CGRect();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    unsigned int v12 = v17[0];
    v17[0] = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 7) == 2)
      {
        if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v12);
        }
      }
      else
      {
        *((_DWORD *)v12 + 7) -= 2;
      }
    }
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(WebFrame *)self coreFrame];
  double v7 = 0.0;
  if (!v6)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    goto LABEL_65;
  }
  double v8 = v6;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v6[37])
  {
    WebCore::Document::updateLayout();
    unsigned int v12 = (WebCore::Editor *)WebCore::Document::editor((WebCore::Document *)v8[37]);
    WebCore::Editor::compositionRange(&v55, v12);
    if (v57) {
      WebCore::VisibleSelection::VisibleSelection();
    }
    else {
      WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v54);
    }
    if (v54[97] == 2)
    {
      if (v57)
      {
        WebCore::RenderObject::absoluteTextRects();
        if (v52)
        {
          WebCore::IntRect::operator CGRect();
          double v14 = v13;
          WebCore::IntRect::operator CGRect();
          double v16 = v15;
          WebCore::VisiblePosition::VisiblePosition();
          WebCore::VisiblePosition::VisiblePosition();
          uint64_t v45 = 0;
          int v46 = 0;
          v47 &= 0xF0u;
          char v48 = 1;
          if (y >= v14)
          {
            if (y >= v16)
            {
              if (self)
              {
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, v16);
                uint64_t v45 = v42;
              }
              else
              {
                uint64_t v43 = 0;
                uint64_t v45 = 0;
              }
              int v46 = v43;
              char v47 = BYTE4(v43);
              char v41 = 1;
            }
            else
            {
              if (self)
              {
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
                uint64_t v45 = v42;
                char v41 = v44;
              }
              else
              {
                char v41 = 0;
                uint64_t v43 = 0;
                uint64_t v45 = 0;
              }
              int v46 = v43;
              char v47 = BYTE4(v43);
            }
            char v48 = v41;
          }
          else
          {
            if (self)
            {
              -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, v14);
              uint64_t v45 = v42;
            }
            else
            {
              uint64_t v43 = 0;
              uint64_t v45 = 0;
            }
            int v46 = v43;
            char v47 = BYTE4(v43);
            char v48 = 0;
          }
          if (WebCore::operator==((uint64_t)&v45, (uint64_t)&v53)
            || (int v25 = (char)WebCore::documentOrder((WebCore *)&v45, &v53, v23), v25 != -127) && v25 < 0)
          {
            v53.unsigned int var1 = 0;
            WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v53, 0);
            WebCore::IntRect::operator CGRect();
          }
          else
          {
            if ((char)WebCore::documentOrder((WebCore *)&v45, &v49, v24) < 1)
            {
              WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v45, 0);
            }
            else
            {
              v49.unsigned int var1 = 1;
              WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v49, 0);
            }
            WebCore::IntRect::operator CGRect();
          }
          double v11 = v27;
          double v10 = v28;
          double v9 = v29;
          double v7 = v30;
          uint64_t v31 = v45;
          uint64_t v45 = 0;
          if (v31)
          {
            if (*((_DWORD *)v31 + 7) == 2)
            {
              if ((*((_WORD *)v31 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v31);
              }
            }
            else
            {
              *((_DWORD *)v31 + 7) -= 2;
            }
          }
          var0 = v49.var0.var0.var0;
          v49.var0.var0.var0 = 0;
          if (var0)
          {
            if (*((_DWORD *)var0 + 7) == 2)
            {
              if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef((WebCore::Node *)var0);
              }
            }
            else
            {
              *((_DWORD *)var0 + 7) -= 2;
            }
          }
          char v33 = v53.var0.var0.var0;
          v53.var0.var0.var0 = 0;
          if (v33)
          {
            if (*((_DWORD *)v33 + 7) == 2)
            {
              if ((*((_WORD *)v33 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef((WebCore::Node *)v33);
              }
            }
            else
            {
              *((_DWORD *)v33 + 7) -= 2;
            }
          }
          __int16 v34 = v50;
          if (v50)
          {
            uint64_t v50 = 0;
            int v51 = 0;
            WTF::fastFree(v34, v26);
          }
LABEL_54:
          WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v54);
          if (v57)
          {
            uint64_t v35 = v56;
            uint64_t v56 = 0;
            if (v35)
            {
              if (*(_DWORD *)(v35 + 28) == 2)
              {
                if ((*(_WORD *)(v35 + 34) & 0x400) == 0) {
                  WebCore::Node::removedLastRef((WebCore::Node *)v35);
                }
              }
              else
              {
                *(_DWORD *)(v35 + 28) -= 2;
              }
            }
            uint64_t v36 = v55;
            uint64_t v55 = 0;
            if (v36)
            {
              if (*(_DWORD *)(v36 + 28) == 2)
              {
                if ((*(_WORD *)(v36 + 34) & 0x400) == 0) {
                  WebCore::Node::removedLastRef((WebCore::Node *)v36);
                }
              }
              else
              {
                *(_DWORD *)(v36 + 28) -= 2;
              }
            }
          }
          goto LABEL_65;
        }
      }
      else
      {
        __break(1u);
      }
      __break(0xC471u);
      JUMPOUT(0x1E1442934);
    }
    if (self) {
      -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
    }
    else {
      memset(&v53, 0, sizeof(v53));
    }
    v49.var0.var0.var0 = (Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v53, 0);
    *(void *)&v49.var0.unsigned int var1 = v17;
    WebCore::IntRect::operator CGRect();
    double v11 = v18;
    double v10 = v19;
    double v9 = v20;
    double v7 = v21;
    CFTypeRef v22 = v53.var0.var0.var0;
    v53.var0.var0.var0 = 0;
    if (v22)
    {
      if (*((_DWORD *)v22 + 7) == 2)
      {
        if ((*((_WORD *)v22 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v22);
        }
      }
      else
      {
        *((_DWORD *)v22 + 7) -= 2;
      }
    }
    goto LABEL_54;
  }
LABEL_65:
  double v37 = v11;
  double v38 = v10;
  double v39 = v9;
  double v40 = v7;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (void)collapseSelection
{
  if ([(WebFrame *)self selectionState] == 2)
  {
    [(WebFrame *)self coreFrame];
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    if (v3)
    {
      if (*((_DWORD *)v3 + 7) == 2)
      {
        if ((*((_WORD *)v3 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v3);
        }
      }
      else
      {
        *((_DWORD *)v3 + 7) -= 2;
      }
    }
  }
}

- (void)extendSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WebFrame *)self selectionState] == 2)
  {
    [(WebFrame *)self coreFrame];
    if (v3)
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::startOfWord();
      if (v7)
      {
        if (*((_DWORD *)v7 + 7) == 2)
        {
          if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v7);
          }
        }
        else
        {
          *((_DWORD *)v7 + 7) -= 2;
        }
      }
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      double v5 = v8;
      if (v8)
      {
        int v6 = *((_DWORD *)v8 + 7) - 2;
        if (*((_DWORD *)v8 + 7) == 2)
        {
          if ((*((_WORD *)v8 + 17) & 0x400) != 0) {
            return;
          }
LABEL_23:
          WebCore::Node::removedLastRef(v5);
          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::endOfWord();
      if (v7)
      {
        if (*((_DWORD *)v7 + 7) == 2)
        {
          if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v7);
          }
        }
        else
        {
          *((_DWORD *)v7 + 7) -= 2;
        }
      }
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      double v5 = v8;
      if (v8)
      {
        int v6 = *((_DWORD *)v8 + 7) - 2;
        if (*((_DWORD *)v8 + 7) == 2)
        {
          if ((*((_WORD *)v8 + 17) & 0x400) != 0) {
            return;
          }
          goto LABEL_23;
        }
LABEL_21:
        *((_DWORD *)v5 + 7) = v6;
      }
    }
  }
}

- (id)selectionRectsForCoreRange:(const void *)a3
{
  WebCore::RenderObject::collectSelectionGeometries((uint64_t *)&v13, (WebCore::RenderObject *)a3, (const WebCore::SimpleRange *)a2);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v4 = (void *)[v3 initWithCapacity:v15];
  if (v15)
  {
    double v5 = (unsigned __int8 *)v13;
    int v6 = (unsigned __int8 *)v13 + 84 * v15;
    do
    {
      id v7 = +[WebSelectionRect selectionRect];
      uint64_t v16 = WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)v5);
      uint64_t v17 = v8;
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v7, "setRect:");
      [v7 setWritingDirection:v5[33]];
      [v7 setIsLineBreak:v5[52]];
      [v7 setIsFirstOnLine:v5[53]];
      [v7 setIsLastOnLine:v5[54]];
      [v7 setContainsStart:v5[55]];
      [v7 setContainsEnd:v5[56]];
      [v7 setIsInFixedPosition:v5[58]];
      [v7 setIsHorizontal:v5[57]];
      if (v7) {
        [v4 addObject:v7];
      }
      v5 += 84;
    }
    while (v5 != v6);
  }
  CFTypeRef v10 = (id)CFMakeCollectable(v4);
  double v11 = v13;
  if (v13)
  {
    double v13 = 0;
    int v14 = 0;
    WTF::fastFree(v11, v9);
  }
  return (id)v10;
}

- (id)selectionRectsForRange:(id)a3
{
  if (a3)
  {
    WebCore::makeSimpleRange();
    if (v10) {
      goto LABEL_3;
    }
    return 0;
  }
  WebCore::makeSimpleRange();
  if (!v10) {
    return 0;
  }
LABEL_3:
  id v4 = [(WebFrame *)self selectionRectsForCoreRange:&v8];
  if (!v10) {
    return v4;
  }
  double v5 = v9;
  double v9 = 0;
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
  uint64_t v8 = 0;
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

- (id)selectionRects
{
  WebCore::VisibleSelection::toNormalizedRange((uint64_t *)v7, (WebCore::VisibleSelection *)(*(void *)(*(void *)([(WebFrame *)self coreFrame] + 296) + 3096)+ 56));
  if (!v9) {
    return 0;
  }
  id v3 = [(WebFrame *)self selectionRectsForCoreRange:v7];
  if (!v9) {
    return v3;
  }
  id v4 = v8;
  uint64_t v8 = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 7) == 2)
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      *((_DWORD *)v4 + 7) -= 2;
    }
  }
  int v6 = v7[0];
  v7[0] = 0;
  if (!v6) {
    return v3;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)wordAtPoint:(CGPoint)a3
{
  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  WebCore::startOfWord();
  WebCore::endOfWord();
  WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((WebCore *)&v12, &v11, (uint64_t)&v13);
  WebCore::createLiveRange();
  id v3 = kit(v19);
  id v4 = v19;
  double v19 = 0;
  if (!v4)
  {
LABEL_7:
    if (!v15) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (*((_DWORD *)v4 + 2) != 1)
  {
    --*((_DWORD *)v4 + 2);
    goto LABEL_7;
  }
  (*(void (**)(DOMObjectInternal *))(*(void *)v4 + 8))(v4);
  if (!v15) {
    goto LABEL_20;
  }
LABEL_10:
  double v5 = v14;
  int v14 = 0;
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
  int v6 = v13;
  double v13 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
LABEL_20:
  var0 = v11.var0.var0.var0;
  v11.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  uint64_t v8 = v12;
  unsigned int v12 = 0;
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  uint64_t v9 = v16;
  uint64_t v16 = 0;
  if (!v9) {
    return v3;
  }
  if (*(_DWORD *)(v9 + 28) != 2)
  {
    *(_DWORD *)(v9 + 28) -= 2;
    return v3;
  }
  if ((*(_WORD *)(v9 + 34) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)v9);
  return v3;
}

- (id)webVisiblePositionForPoint:(CGPoint)a3
{
  if (self) {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  id v3 = +[WebVisiblePosition _wrapVisiblePosition:v6];
  id v4 = v6[0];
  v6[0] = 0;
  if (!v4) {
    return v3;
  }
  if (*((_DWORD *)v4 + 7) != 2)
  {
    *((_DWORD *)v4 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v4 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v4);
  return v3;
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C240](v2);
}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C250](v2);
}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C248](v2);
}

- (void)clearRangedSelectionInitialExtent
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C200](v2);
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C268](v2);
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  int v2 = [(WebFrame *)self coreFrame];
  MEMORY[0x1F416C260](v2);
}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(WebFrame *)self coreFrame];
  if (self) {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  WebCore::LocalFrame::rangedSelectionBase(v15, v6);
  if (v17[0] && v16 == 2)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    int v9 = (char)WebCore::documentOrder((WebCore *)v17, &v14, v7);
    if (v9 == -127 || (v9 & 0x80000000) == 0) {
      WebCore::documentOrder((WebCore *)v17, &v13, v8);
    }
    WebCore::FrameSelection::moveTo();
    var0 = v13.var0.var0.var0;
    v13.var0.var0.var0 = 0;
    if (var0)
    {
      if (*((_DWORD *)var0 + 7) == 2)
      {
        if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)var0);
        }
      }
      else
      {
        *((_DWORD *)var0 + 7) -= 2;
      }
    }
    VisiblePosition v11 = v14.var0.var0.var0;
    v14.var0.var0.var0 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 7) == 2)
      {
        if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v11);
        }
      }
      else
      {
        *((_DWORD *)v11 + 7) -= 2;
      }
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v15);
  uint64_t v12 = v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)(v12 + 28) == 2)
    {
      if ((*(_WORD *)(v12 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v12);
      }
    }
    else
    {
      *(_DWORD *)(v12 + 28) -= 2;
    }
  }
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  double y = a3.y;
  double x = a3.x;
  WebCore::LocalFrame::rangedSelectionBase(v82, (WebCore::LocalFrame *)[(WebFrame *)self coreFrame]);
  WebCore::VisiblePosition::VisiblePosition();
  v77.var0.var0.var0 = 0;
  v77.var0.BOOL var1 = 0;
  *((unsigned char *)&v77.var0 + 12) = 0;
  v77.BOOL var1 = 1;
  if (!v83) {
    goto LABEL_135;
  }
  if (v83 == 1)
  {
    VisiblePosition v11 = (Node *)v78;
    if (v78) {
      *((_DWORD *)v78 + 7) += 2;
    }
    v77.var0.var0.var0 = v11;
    v77.var0.BOOL var1 = v79;
    *((unsigned char *)&v77.var0 + 12) = v80;
    BOOL var1 = v81;
  }
  else
  {
    WebCore::VisiblePosition::VisiblePosition();
    var0 = v76.var0.var0.var0;
    v76.var0.var0.var0 = 0;
    v77.var0.var0.var0 = var0;
    v77.var0.BOOL var1 = v76.var0.var1;
    *((unsigned char *)&v77.var0 + 12) = *((unsigned char *)&v76.var0 + 12);
    BOOL var1 = v76.var1;
  }
  v77.BOOL var1 = var1;
  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
    if (v83 != 2)
    {
LABEL_16:
      if (v6) {
        uint64_t v17 = (WebCore::VisiblePosition *)&v78;
      }
      else {
        uint64_t v17 = (WebCore::VisiblePosition *)&v77;
      }
      v75.var0.var0.var0 = (Node *)WebCore::VisiblePosition::absoluteCaretBounds(v17, 0);
      *(void *)&v75.var0.BOOL var1 = v18;
      WebCore::IntRect::operator CGRect();
      if (v5)
      {
        if (vabdd_f64(v20, x) <= 30.0)
        {
          BOOL v22 = vabdd_f64(v21, y) > 30.0;
          if (!v6) {
            goto LABEL_38;
          }
        }
        else
        {
          BOOL v22 = 1;
          if (!v6)
          {
LABEL_38:
            double v29 = v77.var0.var0.var0;
            if (v77.var0.var0.var0) {
              *((_DWORD *)v77.var0.var0.var0 + 7) += 2;
            }
            v75.var0.var0.var0 = v29;
            v75.var0.BOOL var1 = v77.var0.var1;
            *((unsigned char *)&v75.var0 + 12) = *((unsigned char *)&v77.var0 + 12);
            v75.BOOL var1 = v77.var1;
            int v30 = (char)WebCore::documentOrder((WebCore *)&v76, &v75, v19);
            char v28 = v30 > 0;
            char v31 = v30 < 1 || v22;
            if (v31)
            {
LABEL_115:
              if (!WebCore::operator==((uint64_t)&v75, (uint64_t)&v76)) {
                goto LABEL_120;
              }
              WebCore::VisiblePosition::previous();
              long long v62 = (Node *)v72;
              unsigned int v72 = 0;
              char v57 = v76.var0.var0.var0;
              v76.var0.var0.var0 = v62;
              if (!v57) {
                goto LABEL_119;
              }
              int v58 = *((_DWORD *)v57 + 7) - 2;
              if (*((_DWORD *)v57 + 7) != 2)
              {
LABEL_118:
                *((_DWORD *)v57 + 7) = v58;
                goto LABEL_119;
              }
              if ((*((_WORD *)v57 + 17) & 0x400) != 0) {
                goto LABEL_119;
              }
              WebCore::Node::removedLastRef((WebCore::Node *)v57);
              v59 = v72;
              v76.var0.BOOL var1 = v73;
              *((unsigned char *)&v76.var0 + 12) = BYTE4(v73);
              v76.BOOL var1 = v74;
              unsigned int v72 = 0;
              if (!v59)
              {
LABEL_120:
                WebCore::FrameSelection::moveTo();
                LOBYTE(v6) = v28 ^ v6;
                long long v63 = v75.var0.var0.var0;
                v75.var0.var0.var0 = 0;
                if (v63)
                {
                  if (*((_DWORD *)v63 + 7) == 2)
                  {
                    if ((*((_WORD *)v63 + 17) & 0x400) == 0) {
                      WebCore::Node::removedLastRef((WebCore::Node *)v63);
                    }
                  }
                  else
                  {
                    *((_DWORD *)v63 + 7) -= 2;
                  }
                }
                goto LABEL_125;
              }
              int v60 = *((_DWORD *)v59 + 7) - 2;
              if (*((_DWORD *)v59 + 7) != 2)
              {
LABEL_144:
                *((_DWORD *)v59 + 7) = v60;
                goto LABEL_120;
              }
LABEL_103:
              if ((*((_WORD *)v59 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v59);
              }
              goto LABEL_120;
            }
            unsigned int v72 = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v75, 0);
            uint64_t v73 = v32;
            WebCore::IntRect::operator CGRect();
            if (v36 <= v35)
            {
              double x = CGRectGetMidX(*(CGRect *)&v33);
              if (self)
              {
LABEL_46:
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
                if (v72) {
                  double v38 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
                }
                else {
                  double v38 = 0;
                }
                if (v38)
                {
                  int v46 = (char)WebCore::documentOrder((WebCore *)&v72, &v75, v37);
                  if (v46 != -127 && v46 < 0)
                  {
                    char v47 = (Node *)v72;
                    if (v72) {
                      *((_DWORD *)v72 + 7) += 2;
                    }
                    char v48 = v76.var0.var0.var0;
                    v76.var0.var0.var0 = v47;
                    if (v48)
                    {
                      if (*((_DWORD *)v48 + 7) == 2)
                      {
                        if ((*((_WORD *)v48 + 17) & 0x400) == 0) {
                          WebCore::Node::removedLastRef((WebCore::Node *)v48);
                        }
                      }
                      else
                      {
                        *((_DWORD *)v48 + 7) -= 2;
                      }
                    }
                    v76.var0.BOOL var1 = v73;
                    *((unsigned char *)&v76.var0 + 12) = BYTE4(v73);
                    BOOL v53 = v74;
                    goto LABEL_108;
                  }
                }
LABEL_67:
                WebCore::VisiblePosition::previous();
                VisiblePosition v49 = v76.var0.var0.var0;
                v76.var0.var0.var0 = v68;
                if (v49)
                {
                  if (*((_DWORD *)v49 + 7) == 2)
                  {
                    if ((*((_WORD *)v49 + 17) & 0x400) == 0)
                    {
                      WebCore::Node::removedLastRef((WebCore::Node *)v49);
                      v76.var0.BOOL var1 = v69;
                      *((unsigned char *)&v76.var0 + 12) = v70;
                      v76.BOOL var1 = v71;
LABEL_109:
                      v61 = v72;
                      unsigned int v72 = 0;
                      if (v61)
                      {
                        if (*((_DWORD *)v61 + 7) == 2)
                        {
                          if ((*((_WORD *)v61 + 17) & 0x400) == 0) {
                            WebCore::Node::removedLastRef(v61);
                          }
                        }
                        else
                        {
                          *((_DWORD *)v61 + 7) -= 2;
                        }
                      }
                      char v28 = 0;
                      goto LABEL_115;
                    }
                  }
                  else
                  {
                    *((_DWORD *)v49 + 7) -= 2;
                  }
                }
                v76.var0.BOOL var1 = v69;
                *((unsigned char *)&v76.var0 + 12) = v70;
                BOOL v53 = v71;
LABEL_108:
                v76.BOOL var1 = v53;
                goto LABEL_109;
              }
            }
            else
            {
              double y = CGRectGetMidY(*(CGRect *)&v33);
              if (self) {
                goto LABEL_46;
              }
            }
            unsigned int v72 = 0;
            uint64_t v73 = 0;
            BOOL v74 = 0;
            goto LABEL_67;
          }
        }
      }
      else
      {
        BOOL v22 = 0;
        if (!v6) {
          goto LABEL_38;
        }
      }
      int v23 = (Node *)v78;
      if (v78) {
        *((_DWORD *)v78 + 7) += 2;
      }
      v75.var0.var0.var0 = v23;
      v75.var0.BOOL var1 = v79;
      *((unsigned char *)&v75.var0 + 12) = v80;
      v75.BOOL var1 = v81;
      int v24 = (char)WebCore::documentOrder((WebCore *)&v76, &v75, v19);
      BOOL v25 = v24 != -127 && v24 < 0;
      char v26 = !v25;
      char v27 = !v25 || v22;
      if (v27)
      {
        char v28 = v26 ^ 1;
        goto LABEL_97;
      }
      unsigned int v72 = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v75, 0);
      uint64_t v73 = v39;
      WebCore::IntRect::operator CGRect();
      if (v43 <= v42)
      {
        double x = CGRectGetMidX(*(CGRect *)&v40);
        if (self)
        {
LABEL_53:
          -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
          if (v72) {
            uint64_t v45 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
          }
          else {
            uint64_t v45 = 0;
          }
          if (v45 && (char)WebCore::documentOrder((WebCore *)&v72, &v75, v44) >= 1)
          {
            uint64_t v50 = (Node *)v72;
            if (v72) {
              *((_DWORD *)v72 + 7) += 2;
            }
            int v51 = v76.var0.var0.var0;
            v76.var0.var0.var0 = v50;
            if (v51)
            {
              if (*((_DWORD *)v51 + 7) == 2)
              {
                if ((*((_WORD *)v51 + 17) & 0x400) == 0) {
                  WebCore::Node::removedLastRef((WebCore::Node *)v51);
                }
              }
              else
              {
                *((_DWORD *)v51 + 7) -= 2;
              }
            }
            v76.var0.BOOL var1 = v73;
            *((unsigned char *)&v76.var0 + 12) = BYTE4(v73);
            BOOL v54 = v74;
            goto LABEL_90;
          }
LABEL_78:
          WebCore::VisiblePosition::next();
          int v52 = v76.var0.var0.var0;
          v76.var0.var0.var0 = v68;
          if (v52)
          {
            if (*((_DWORD *)v52 + 7) == 2)
            {
              if ((*((_WORD *)v52 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef((WebCore::Node *)v52);
                v76.var0.BOOL var1 = v69;
                *((unsigned char *)&v76.var0 + 12) = v70;
                v76.BOOL var1 = v71;
LABEL_91:
                uint64_t v55 = v72;
                unsigned int v72 = 0;
                if (v55)
                {
                  if (*((_DWORD *)v55 + 7) == 2)
                  {
                    if ((*((_WORD *)v55 + 17) & 0x400) == 0) {
                      WebCore::Node::removedLastRef(v55);
                    }
                  }
                  else
                  {
                    *((_DWORD *)v55 + 7) -= 2;
                  }
                }
                char v28 = 0;
LABEL_97:
                if (!WebCore::operator==((uint64_t)&v75, (uint64_t)&v76)) {
                  goto LABEL_120;
                }
                WebCore::VisiblePosition::next();
                uint64_t v56 = (Node *)v72;
                unsigned int v72 = 0;
                char v57 = v76.var0.var0.var0;
                v76.var0.var0.var0 = v56;
                if (!v57) {
                  goto LABEL_119;
                }
                int v58 = *((_DWORD *)v57 + 7) - 2;
                if (*((_DWORD *)v57 + 7) != 2) {
                  goto LABEL_118;
                }
                if ((*((_WORD *)v57 + 17) & 0x400) != 0)
                {
LABEL_119:
                  v76.var0.BOOL var1 = v73;
                  *((unsigned char *)&v76.var0 + 12) = BYTE4(v73);
                  v76.BOOL var1 = v74;
                  goto LABEL_120;
                }
                WebCore::Node::removedLastRef((WebCore::Node *)v57);
                v59 = v72;
                v76.var0.BOOL var1 = v73;
                *((unsigned char *)&v76.var0 + 12) = BYTE4(v73);
                v76.BOOL var1 = v74;
                unsigned int v72 = 0;
                if (!v59) {
                  goto LABEL_120;
                }
                int v60 = *((_DWORD *)v59 + 7) - 2;
                if (*((_DWORD *)v59 + 7) != 2) {
                  goto LABEL_144;
                }
                goto LABEL_103;
              }
            }
            else
            {
              *((_DWORD *)v52 + 7) -= 2;
            }
          }
          v76.var0.BOOL var1 = v69;
          *((unsigned char *)&v76.var0 + 12) = v70;
          BOOL v54 = v71;
LABEL_90:
          v76.BOOL var1 = v54;
          goto LABEL_91;
        }
      }
      else
      {
        double y = CGRectGetMidY(*(CGRect *)&v40);
        if (self) {
          goto LABEL_53;
        }
      }
      unsigned int v72 = 0;
      uint64_t v73 = 0;
      BOOL v74 = 0;
      goto LABEL_78;
    }
  }
  else
  {
    memset(&v76, 0, sizeof(v76));
    if (v83 != 2) {
      goto LABEL_16;
    }
  }
  int v15 = (char)WebCore::documentOrder((WebCore *)&v78, &v76, v10);
  if (v15 == -127) {
    goto LABEL_16;
  }
  if ((v15 & 0x80000000) == 0) {
    goto LABEL_16;
  }
  int v16 = (char)WebCore::documentOrder((WebCore *)&v76, &v77, v14);
  if (v16 == -127 || (v16 & 0x80000000) == 0) {
    goto LABEL_16;
  }
  WebCore::FrameSelection::moveTo();
  LOBYTE(v6) = 0;
LABEL_125:
  v64 = v76.var0.var0.var0;
  v76.var0.var0.var0 = 0;
  if (v64)
  {
    if (*((_DWORD *)v64 + 7) == 2)
    {
      if ((*((_WORD *)v64 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v64);
      }
    }
    else
    {
      *((_DWORD *)v64 + 7) -= 2;
    }
  }
  uint64_t v65 = v77.var0.var0.var0;
  v77.var0.var0.var0 = 0;
  if (v65)
  {
    if (*((_DWORD *)v65 + 7) == 2)
    {
      if ((*((_WORD *)v65 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v65);
      }
    }
    else
    {
      *((_DWORD *)v65 + 7) -= 2;
    }
  }
LABEL_135:
  v66 = v78;
  long long v78 = 0;
  if (v66)
  {
    if (*((_DWORD *)v66 + 7) == 2)
    {
      if ((*((_WORD *)v66 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v66);
      }
    }
    else
    {
      *((_DWORD *)v66 + 7) -= 2;
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v82);
  return v6;
}

- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5 allowFlipping:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(WebFrame *)self coreFrame];
  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", v11, v10);
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  }
  else
  {
    memset(&v35, 0, sizeof(v35));
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
  }
  BOOL v13 = x >= v11 + 30.0;
  if (y >= v10 + 30.0) {
    BOOL v13 = 1;
  }
  BOOL v14 = x <= v11 + -30.0;
  if (y <= v10 + -30.0) {
    BOOL v14 = 1;
  }
  if (v7) {
    BOOL v13 = v14;
  }
  char v15 = v6 && v13;
  if (WebCore::operator==((uint64_t)&v32, (uint64_t)&v35))
  {
    if (v7)
    {
LABEL_34:
      WebCore::VisiblePosition::next();
LABEL_35:
      int v24 = v32;
      uint64_t v32 = v28;
      if (v24)
      {
        if (*((_DWORD *)v24 + 7) == 2)
        {
          if ((*((_WORD *)v24 + 17) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v24);
            LODWORD(v33) = v29;
            BYTE4(v33) = v30;
            LOBYTE(v34) = v31;
LABEL_41:
            char v21 = 0;
            goto LABEL_42;
          }
        }
        else
        {
          *((_DWORD *)v24 + 7) -= 2;
        }
      }
      LODWORD(v33) = v29;
      BYTE4(v33) = v30;
      LOBYTE(v34) = v31;
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  if (v7)
  {
    int v17 = (char)WebCore::documentOrder((WebCore *)&v32, &v35, v16);
    BOOL v18 = v17 != -127 && v17 < 0;
    char v19 = !v18;
    if (v18) {
      char v20 = v15;
    }
    else {
      char v20 = 1;
    }
    if (v20)
    {
      char v21 = v19 ^ 1;
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  int v22 = (char)WebCore::documentOrder((WebCore *)&v32, &v35, v16);
  char v21 = v22 > 0;
  if (v22 < 1) {
    char v23 = 1;
  }
  else {
    char v23 = v15;
  }
  if ((v23 & 1) == 0)
  {
LABEL_33:
    WebCore::VisiblePosition::previous();
    goto LABEL_35;
  }
LABEL_42:
  WebCore::FrameSelection::moveTo();
  BOOL v25 = v32;
  uint64_t v32 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 7) == 2)
    {
      if ((*((_WORD *)v25 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v25);
      }
    }
    else
    {
      *((_DWORD *)v25 + 7) -= 2;
    }
  }
  var0 = v35.var0.var0.var0;
  v35.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  return v21 ^ v7;
}

- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5
{
  return -[WebFrame setSelectionWithBasePoint:extentPoint:baseIsStart:allowFlipping:](self, "setSelectionWithBasePoint:extentPoint:baseIsStart:allowFlipping:", a5, 1, a3.x, a3.y, a4.x, a4.y);
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  if (self)
  {
    double y = a4.y;
    double x = a4.x;
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  }
  else
  {
    double v11 = 0;
    BOOL v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  [(WebFrame *)self coreFrame];
  WebCore::FrameSelection::moveTo();
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  if (v11)
  {
    if (*((_DWORD *)v11 + 7) == 2)
    {
      if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v11);
      }
    }
    else
    {
      *((_DWORD *)v11 + 7) -= 2;
    }
  }
}

- (void)ensureRangedSelectionContainsInitialStartPoint:(CGPoint)a3 initialEndPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v9 = *(void *)(*(void *)([(WebFrame *)self coreFrame] + 296) + 3096);
  if (!self)
  {
    uint64_t v25 = 0;
    char v26 = 0;
    int v27 = 0;
    char v23 = 0;
    char v28 = 0;
    uint64_t v24 = 0;
LABEL_6:
    char v20 = 0;
    int v21 = v24;
    char v22 = BYTE4(v24);
    goto LABEL_14;
  }
  -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", v7, v6);
  uint64_t v10 = v23;
  if (v23)
  {
    int v11 = *((_DWORD *)v23 + 7);
    *((_DWORD *)v23 + 7) = v11 + 2;
    char v26 = v10;
    int v27 = v24;
    char v28 = BYTE4(v24);
    char v23 = 0;
    if (v11)
    {
      *((_DWORD *)v10 + 7) = v11;
    }
    else if ((*((_WORD *)v10 + 17) & 0x400) == 0)
    {
      WebCore::Node::removedLastRef(v10);
    }
  }
  else
  {
    char v26 = 0;
    int v27 = v24;
    char v28 = BYTE4(v24);
  }
  -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  uint64_t v12 = v23;
  if (!v23) {
    goto LABEL_6;
  }
  int v13 = *((_DWORD *)v23 + 7);
  *((_DWORD *)v23 + 7) = v13 + 2;
  char v20 = v12;
  int v21 = v24;
  char v22 = BYTE4(v24);
  char v23 = 0;
  if (v13)
  {
    *((_DWORD *)v12 + 7) = v13;
  }
  else if ((*((_WORD *)v12 + 17) & 0x400) == 0)
  {
    WebCore::Node::removedLastRef(v12);
  }
LABEL_14:
  if ((char)MEMORY[0x1E4E45260](v9 + 120, &v26) < 1)
  {
    int v14 = (char)MEMORY[0x1E4E45260](v9 + 136, &v20);
    if (v14 != -127 && v14 < 0)
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      if (v19)
      {
        if (*((_DWORD *)v19 + 7) == 2)
        {
          if ((*((_WORD *)v19 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v19);
          }
        }
        else
        {
          *((_DWORD *)v19 + 7) -= 2;
        }
      }
      char v15 = v23;
      char v23 = 0;
      if (v15)
      {
        int v16 = *((_DWORD *)v15 + 7) - 2;
        if (*((_DWORD *)v15 + 7) != 2) {
          goto LABEL_27;
        }
LABEL_32:
        if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v15);
        }
      }
    }
  }
  else
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    if (v19)
    {
      if (*((_DWORD *)v19 + 7) == 2)
      {
        if ((*((_WORD *)v19 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v19);
        }
      }
      else
      {
        *((_DWORD *)v19 + 7) -= 2;
      }
    }
    char v15 = v23;
    char v23 = 0;
    if (v15)
    {
      int v16 = *((_DWORD *)v15 + 7) - 2;
      if (*((_DWORD *)v15 + 7) != 2)
      {
LABEL_27:
        *((_DWORD *)v15 + 7) = v16;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
  }
LABEL_34:
  int v17 = v20;
  char v20 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 7) == 2)
    {
      if ((*((_WORD *)v17 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v17);
      }
    }
    else
    {
      *((_DWORD *)v17 + 7) -= 2;
    }
  }
  BOOL v18 = v26;
  char v26 = 0;
  if (v18)
  {
    if (*((_DWORD *)v18 + 7) == 2)
    {
      if ((*((_WORD *)v18 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v18);
      }
    }
    else
    {
      *((_DWORD *)v18 + 7) -= 2;
    }
  }
}

- (void)aggressivelyExpandSelectionToWordContainingCaretSelection
{
  uint64_t v3 = *(void *)(*(void *)([(WebFrame *)self coreFrame] + 296) + 3096);
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::endOfDocument((uint64_t *)&v32, (WebCore *)v36, v4);
  if (WebCore::operator==((uint64_t)v36, (uint64_t)&v32))
  {
    WebCore::startOfDocument((uint64_t *)v31, (WebCore *)v36, v5);
    if (WebCore::operator==((uint64_t)v36, (uint64_t)v31))
    {
      BOOL v7 = 0;
    }
    else
    {
      WebCore::startOfLine((uint64_t *)&v27, (WebCore *)v36, v6);
      BOOL v7 = WebCore::operator==((uint64_t)v36, (uint64_t)&v27);
      uint64_t v8 = v27;
      int v27 = 0;
      if (v8)
      {
        if (*((_DWORD *)v8 + 7) == 2)
        {
          if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v8);
          }
        }
        else
        {
          *((_DWORD *)v8 + 7) -= 2;
        }
      }
    }
    uint64_t v9 = v31[0];
    v31[0] = 0;
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
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v10 = v32;
  uint64_t v32 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  if (v7)
  {
    WebCore::VisiblePosition::previous();
    WebCore::FrameSelection::moveTo();
    int v11 = v32;
    uint64_t v32 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 7) == 2)
      {
        if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v11);
        }
      }
      else
      {
        *((_DWORD *)v11 + 7) -= 2;
      }
    }
  }
  [(WebFrame *)self expandSelectionToWordContainingCaretSelection];
  if (*(unsigned char *)(v3 + 184) == 1)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    uint64_t v12 = v31[0];
    v31[0] = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 7) == 2)
      {
        if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v12);
        }
      }
      else
      {
        *((_DWORD *)v12 + 7) -= 2;
      }
    }
    int v13 = v32;
    uint64_t v32 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 7) == 2)
      {
        if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v13);
        }
      }
      else
      {
        *((_DWORD *)v13 + 7) -= 2;
      }
    }
  }
  if (*(unsigned char *)(v3 + 153) != 1) {
    goto LABEL_79;
  }
  WebCore::VisiblePosition::VisiblePosition();
  if (!WebCore::isStartOfLine((WebCore *)&v32, v14)
    || !WebCore::isEndOfLine((WebCore *)&v32, v15))
  {
    while (1)
    {
      if (v32) {
        BOOL v18 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18) {
        goto LABEL_74;
      }
      WebCore::startOfWord();
      BOOL v19 = WebCore::operator==((uint64_t)v31, (uint64_t)&v32);
      if (v19)
      {
        WebCore::VisiblePosition::previous();
        char v20 = v27;
        int v27 = 0;
        int v21 = v32;
        uint64_t v32 = v20;
        if (!v21) {
          goto LABEL_67;
        }
        if (*((_DWORD *)v21 + 7) != 2)
        {
          *((_DWORD *)v21 + 7) -= 2;
LABEL_67:
          int v33 = v28;
          char v34 = v29;
          char v35 = v30;
          goto LABEL_68;
        }
        if ((*((_WORD *)v21 + 17) & 0x400) != 0) {
          goto LABEL_67;
        }
        WebCore::Node::removedLastRef(v21);
        char v22 = v27;
        int v33 = v28;
        char v34 = v29;
        char v35 = v30;
        int v27 = 0;
        if (v22)
        {
          int v23 = *((_DWORD *)v22 + 7) - 2;
          if (*((_DWORD *)v22 + 7) == 2)
          {
LABEL_65:
            if ((*((_WORD *)v22 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v22);
            }
            goto LABEL_68;
          }
          goto LABEL_61;
        }
      }
      else
      {
        WebCore::VisiblePosition::VisiblePosition();
        WebCore::FrameSelection::moveTo();
        char v22 = v27;
        int v27 = 0;
        if (v22)
        {
          int v23 = *((_DWORD *)v22 + 7) - 2;
          if (*((_DWORD *)v22 + 7) == 2) {
            goto LABEL_65;
          }
LABEL_61:
          *((_DWORD *)v22 + 7) = v23;
        }
      }
LABEL_68:
      uint64_t v24 = v31[0];
      v31[0] = 0;
      if (v24)
      {
        if (*((_DWORD *)v24 + 7) == 2)
        {
          if ((*((_WORD *)v24 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v24);
          }
        }
        else
        {
          *((_DWORD *)v24 + 7) -= 2;
        }
      }
      if (!v19) {
        goto LABEL_74;
      }
    }
  }
  WebCore::VisiblePosition::next();
  int v16 = v31[0];
  if (v31[0]) {
    int v17 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
  }
  else {
    int v17 = 0;
  }
  if (v17)
  {
    WebCore::FrameSelection::moveTo();
    int v16 = v31[0];
  }
  v31[0] = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 7) == 2)
    {
      if ((*((_WORD *)v16 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v16);
      }
    }
    else
    {
      *((_DWORD *)v16 + 7) -= 2;
    }
  }
LABEL_74:
  uint64_t v25 = v32;
  uint64_t v32 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 7) == 2)
    {
      if ((*((_WORD *)v25 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v25);
      }
    }
    else
    {
      *((_DWORD *)v25 + 7) -= 2;
    }
  }
LABEL_79:
  char v26 = v36[0];
  v36[0] = 0;
  if (v26)
  {
    if (*((_DWORD *)v26 + 7) == 2)
    {
      if ((*((_WORD *)v26 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v26);
      }
    }
    else
    {
      *((_DWORD *)v26 + 7) -= 2;
    }
  }
}

- (void)expandSelectionToSentence
{
  [(WebFrame *)self coreFrame];
  int v2 = (WebCore *)WebCore::VisiblePosition::VisiblePosition();
  WebCore::startOfSentence((uint64_t *)&v9, v2, v3);
  WebCore::endOfSentence((uint64_t *)&v8, (WebCore *)v10, v4);
  WebCore::FrameSelection::moveTo();
  BOOL v5 = v8;
  uint64_t v8 = 0;
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
  double v6 = v9;
  uint64_t v9 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  uint64_t v7 = v10[0];
  v10[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)(v7 + 28) == 2)
    {
      if ((*(_WORD *)(v7 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v7);
      }
    }
    else
    {
      *(_DWORD *)(v7 + 28) -= 2;
    }
  }
}

- (int)selectionBaseWritingDirection
{
  int v2 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)([(WebFrame *)self coreFrame]
                                                                          + 296));
  return WebCore::Editor::baseWritingDirectionForSelectionStart(v2) == 2;
}

- (void)toggleBaseWritingDirection
{
  BOOL v3 = [(WebFrame *)self selectionBaseWritingDirection] != 1;
  [(WebFrame *)self setBaseWritingDirection:v3];
}

- (void)setBaseWritingDirection:(int)a3
{
  int v5 = [(WebFrame *)self selectionBaseWritingDirection];
  double v6 = [(WebFrame *)self coreFrame];
  if (WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*((void *)v6[37] + 387)
                                                                                              + 56)))
  {
    char v7 = a3 == 1 ? 2 : 1;
    unsigned __int8 v8 = a3 == -1 ? 0 : v7;
    WebCore::Document::editor(v6[37]);
    WebCore::Editor::setBaseWritingDirection();
    if (v5 != [(WebFrame *)self selectionBaseWritingDirection])
    {
      uint64_t v9 = WebCore::Document::editor(v6[37]);
      MEMORY[0x1F4172CC8](v9, v8);
    }
  }
}

- (void)moveSelectionToStart
{
  int v2 = [(WebFrame *)self coreFrame];
  WebCore::startOfDocument((uint64_t *)&v5, v2[37], v3);
  WebCore::FrameSelection::moveTo();
  id v4 = v5;
  int v5 = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 7) == 2)
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      *((_DWORD *)v4 + 7) -= 2;
    }
  }
}

- (void)moveSelectionToEnd
{
  int v2 = [(WebFrame *)self coreFrame];
  WebCore::endOfDocument((uint64_t *)&v5, v2[37], v3);
  WebCore::FrameSelection::moveTo();
  id v4 = v5;
  int v5 = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 7) == 2)
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      *((_DWORD *)v4 + 7) -= 2;
    }
  }
}

- (void)moveSelectionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(WebFrame *)self coreFrame];
  if (self) {
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", x, y);
  }
  else {
    double v6 = 0;
  }
  WebCore::FrameSelection::moveTo();
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
}

- (void)setSelectionGranularity:(int)a3
{
}

- (void)smartExtendRangedSelection:(int)a3
{
  if ([(WebFrame *)self selectionState] != 2) {
    return;
  }
  int v5 = [(WebFrame *)self coreFrame];
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::LocalFrame::rangedSelectionBase((uint64_t *)v99, v5);
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v99);
  if (WebCore::operator==((uint64_t)v101, (uint64_t)&v106) || WebCore::operator==((uint64_t)v101, (uint64_t)&v102))
  {
    WebCore::VisiblePosition::VisiblePosition();
    UChar32 v6 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v98);
    unsigned int IntPropertyValue = u_getIntPropertyValue(v6, UCHAR_LINE_BREAK);
    if (IntPropertyValue <= 0x25 && ((1 << IntPropertyValue) & 0x2001004000) != 0) {
      goto LABEL_6;
    }
    WebCore::VisiblePosition::previous();
    UChar32 v12 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v99);
    int v13 = v99[0];
    v99[0] = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 7) == 2)
      {
        if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v13);
        }
      }
      else
      {
        *((_DWORD *)v13 + 7) -= 2;
      }
    }
    unsigned int v14 = u_getIntPropertyValue(v12, UCHAR_LINE_BREAK);
    if (v14 <= 0x25 && ((1 << v14) & 0x2001004000) != 0) {
      goto LABEL_6;
    }
    WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v99);
    if (a3)
    {
      WebCore::LocalFrame::rangedSelectionInitialExtent((uint64_t *)&v94, v5);
      WebCore::VisibleSelection::operator=((uint64_t *)v99, (uint64_t *)&v94);
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v94);
    }
    char v90 = 0;
    int v91 = 0;
    v92 &= 0xF0u;
    char v93 = 1;
    if (WebCore::operator==((uint64_t)v101, (uint64_t)&v102))
    {
      char v15 = v106;
      if (v106) {
        *((_DWORD *)v106 + 7) += 2;
      }
      v122 = v15;
      int v123 = v107;
      char v124 = v108;
      char v125 = v109;
      v118 = 0;
      int v119 = 0;
      char v120 = 0;
      char v121 = 1;
      if (v100)
      {
        WebCore::VisiblePosition::VisiblePosition();
        int v16 = v94;
        long long v94 = 0;
        int v17 = v118;
        v118 = v16;
        if (!v17)
        {
LABEL_53:
          int v119 = v95;
          char v120 = v96;
          char v121 = v97;
          goto LABEL_54;
        }
        if (*((_DWORD *)v17 + 7) != 2)
        {
          *((_DWORD *)v17 + 7) -= 2;
          goto LABEL_53;
        }
        if ((*((_WORD *)v17 + 17) & 0x400) != 0) {
          goto LABEL_53;
        }
        WebCore::Node::removedLastRef(v17);
        int v21 = v94;
        int v119 = v95;
        char v120 = v96;
        char v121 = v97;
        long long v94 = 0;
        if (v21)
        {
          if (*((_DWORD *)v21 + 7) == 2)
          {
            if ((*((_WORD *)v21 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v21);
            }
          }
          else
          {
            *((_DWORD *)v21 + 7) -= 2;
          }
        }
      }
LABEL_54:
      if (WebCore::operator==((uint64_t)&v118, (uint64_t)&v106)) {
        goto LABEL_55;
      }
      WebCore::VisiblePosition::previous();
      UniChar v24 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      uint64_t v25 = v94;
      long long v94 = 0;
      if (v25)
      {
        if (*((_DWORD *)v25 + 7) == 2)
        {
          if ((*((_WORD *)v25 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v25);
          }
        }
        else
        {
          *((_DWORD *)v25 + 7) -= 2;
        }
      }
      UniChar v30 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
      if (_MergedGlobals_15 == 1)
      {
        CFCharacterSetRef Predefined = (const __CFCharacterSet *)qword_1EB3A9760;
      }
      else
      {
        CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1EB3A9760 = (uint64_t)Predefined;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(Predefined, v30))
      {
        if (_MergedGlobals_15 == 1)
        {
          CFCharacterSetRef v32 = (const __CFCharacterSet *)qword_1EB3A9760;
        }
        else
        {
          CFCharacterSetRef v32 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          qword_1EB3A9760 = (uint64_t)v32;
          _MergedGlobals_15 = 1;
        }
        if (!CFCharacterSetIsCharacterMember(v32, v24))
        {
LABEL_55:
          char v22 = v122;
          v122 = 0;
          int v88 = v123;
          char v89 = v124;
          char v23 = v125;
          goto LABEL_167;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        CFCharacterSetRef v33 = (const __CFCharacterSet *)qword_1EB3A9760;
      }
      else
      {
        CFCharacterSetRef v33 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1EB3A9760 = (uint64_t)v33;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v33, v24))
      {
        if (_MergedGlobals_15 == 1)
        {
          CFCharacterSetRef v34 = (const __CFCharacterSet *)qword_1EB3A9760;
        }
        else
        {
          CFCharacterSetRef v34 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          qword_1EB3A9760 = (uint64_t)v34;
          _MergedGlobals_15 = 1;
        }
        if (!CFCharacterSetIsCharacterMember(v34, v30))
        {
          WebCore::VisiblePosition::next();
          char v35 = v94;
          long long v94 = 0;
          double v36 = v122;
          v122 = v35;
          if (!v36)
          {
LABEL_111:
            int v123 = v95;
            char v124 = v96;
            char v125 = v97;
            goto LABEL_112;
          }
          if (*((_DWORD *)v36 + 7) != 2)
          {
            *((_DWORD *)v36 + 7) -= 2;
            goto LABEL_111;
          }
          if ((*((_WORD *)v36 + 17) & 0x400) != 0) {
            goto LABEL_111;
          }
          WebCore::Node::removedLastRef(v36);
          char v44 = v94;
          int v123 = v95;
          char v124 = v96;
          char v125 = v97;
          long long v94 = 0;
          if (v44)
          {
            if (*((_DWORD *)v44 + 7) == 2)
            {
              if ((*((_WORD *)v44 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v44);
              }
            }
            else
            {
              *((_DWORD *)v44 + 7) -= 2;
            }
          }
        }
      }
LABEL_112:
      WebCore::startOfWord();
      if (WebCore::operator==((uint64_t)&v94, (uint64_t)&v118))
      {
        WebCore::endOfWord();
        int v46 = v114;
        if (v114) {
          *((_DWORD *)v114 + 7) += 2;
        }
        char v47 = v122;
        v122 = v46;
        if (v47)
        {
          if (*((_DWORD *)v47 + 7) == 2)
          {
            if ((*((_WORD *)v47 + 17) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v47);
              int v46 = v122;
            }
          }
          else
          {
            *((_DWORD *)v47 + 7) -= 2;
          }
        }
        int v123 = v115;
        char v124 = v116;
        char v125 = v117;
        if (v46) {
          char v48 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
        }
        else {
          char v48 = 0;
        }
        if (v48)
        {
          do
          {
            if ((WebCore::isStartOfLine((WebCore *)&v122, v45) & 1) != 0
              || (WebCore::isEndOfLine((WebCore *)&v122, v49) & 1) != 0
              || WebCore::operator==((uint64_t)&v122, (uint64_t)&v102))
            {
              break;
            }
            UniChar v50 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
            if (_MergedGlobals_15 == 1)
            {
              CFCharacterSetRef v51 = (const __CFCharacterSet *)qword_1EB3A9760;
            }
            else
            {
              CFCharacterSetRef v51 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
              qword_1EB3A9760 = (uint64_t)v51;
              _MergedGlobals_15 = 1;
            }
            if (CFCharacterSetIsCharacterMember(v51, v50)) {
              break;
            }
            WebCore::VisiblePosition::next();
            int v52 = v110;
            v110 = 0;
            BOOL v53 = v122;
            v122 = v52;
            if (v53)
            {
              if (*((_DWORD *)v53 + 7) == 2)
              {
                if ((*((_WORD *)v53 + 17) & 0x400) == 0)
                {
                  WebCore::Node::removedLastRef(v53);
                  BOOL v54 = v110;
                  int v123 = v111;
                  char v124 = v112;
                  char v125 = v113;
                  v110 = 0;
                  if (v54)
                  {
                    if (*((_DWORD *)v54 + 7) == 2)
                    {
                      if ((*((_WORD *)v54 + 17) & 0x400) == 0) {
                        WebCore::Node::removedLastRef(v54);
                      }
                    }
                    else
                    {
                      *((_DWORD *)v54 + 7) -= 2;
                    }
                  }
                  goto LABEL_139;
                }
              }
              else
              {
                *((_DWORD *)v53 + 7) -= 2;
              }
            }
            int v123 = v111;
            char v124 = v112;
            char v125 = v113;
LABEL_139:
            if (v122) {
              uint64_t v55 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
            }
            else {
              uint64_t v55 = 0;
            }
          }
          while (v55);
        }
        if (WebCore::operator==((uint64_t)&v122, (uint64_t)&v102))
        {
          uint64_t v56 = v94;
          if (v94) {
            *((_DWORD *)v94 + 7) += 2;
          }
          char v57 = v122;
          v122 = v56;
          if (v57)
          {
            if (*((_DWORD *)v57 + 7) == 2)
            {
              if ((*((_WORD *)v57 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v57);
              }
            }
            else
            {
              *((_DWORD *)v57 + 7) -= 2;
            }
          }
          int v123 = v95;
          char v124 = v96;
          char v23 = v97;
          char v125 = v97;
        }
        else
        {
          char v23 = v125;
        }
        char v22 = v122;
        v122 = 0;
        int v88 = v123;
        char v89 = v124;
        int v58 = v114;
        v114 = 0;
        if (v58)
        {
          if (*((_DWORD *)v58 + 7) == 2)
          {
            if ((*((_WORD *)v58 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v58);
            }
          }
          else
          {
            *((_DWORD *)v58 + 7) -= 2;
          }
        }
        v59 = v94;
        long long v94 = 0;
        if (v59)
        {
          if (*((_DWORD *)v59 + 7) == 2)
          {
            if ((*((_WORD *)v59 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v59);
            }
          }
          else
          {
            *((_DWORD *)v59 + 7) -= 2;
          }
        }
      }
      else
      {
        char v22 = v94;
        int v88 = v95;
        char v89 = v96;
        char v23 = v97;
      }
LABEL_167:
      int v60 = v118;
      v118 = 0;
      if (v60)
      {
        if (*((_DWORD *)v60 + 7) == 2)
        {
          if ((*((_WORD *)v60 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v60);
          }
        }
        else
        {
          *((_DWORD *)v60 + 7) -= 2;
        }
      }
      v61 = v122;
      v122 = 0;
      if (v61)
      {
        if (*((_DWORD *)v61 + 7) == 2)
        {
          if ((*((_WORD *)v61 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v61);
          }
        }
        else
        {
          *((_DWORD *)v61 + 7) -= 2;
        }
      }
      long long v62 = v90;
      char v90 = v22;
      if (!v62) {
        goto LABEL_267;
      }
      int v63 = *((_DWORD *)v62 + 7) - 2;
      if (*((_DWORD *)v62 + 7) != 2) {
        goto LABEL_179;
      }
      goto LABEL_265;
    }
    BOOL v18 = v102;
    if (v102) {
      *((_DWORD *)v102 + 7) += 2;
    }
    v122 = v18;
    int v123 = v103;
    char v124 = v104;
    char v125 = v105;
    v118 = 0;
    int v119 = 0;
    char v120 = 0;
    char v121 = 1;
    if (v100)
    {
      WebCore::VisiblePosition::VisiblePosition();
      BOOL v19 = v94;
      long long v94 = 0;
      char v20 = v118;
      v118 = v19;
      if (!v20)
      {
LABEL_63:
        int v119 = v95;
        char v120 = v96;
        char v121 = v97;
        goto LABEL_64;
      }
      if (*((_DWORD *)v20 + 7) != 2)
      {
        *((_DWORD *)v20 + 7) -= 2;
        goto LABEL_63;
      }
      if ((*((_WORD *)v20 + 17) & 0x400) != 0) {
        goto LABEL_63;
      }
      WebCore::Node::removedLastRef(v20);
      char v26 = v94;
      int v119 = v95;
      char v120 = v96;
      char v121 = v97;
      long long v94 = 0;
      if (v26)
      {
        if (*((_DWORD *)v26 + 7) == 2)
        {
          if ((*((_WORD *)v26 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v26);
          }
        }
        else
        {
          *((_DWORD *)v26 + 7) -= 2;
        }
      }
    }
LABEL_64:
    if (WebCore::operator==((uint64_t)&v118, (uint64_t)&v102)) {
      goto LABEL_65;
    }
    WebCore::VisiblePosition::previous();
    UniChar v28 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
    char v29 = v94;
    long long v94 = 0;
    if (v29)
    {
      if (*((_DWORD *)v29 + 7) == 2)
      {
        if ((*((_WORD *)v29 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v29);
        }
      }
      else
      {
        *((_DWORD *)v29 + 7) -= 2;
      }
    }
    UniChar v37 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
    if (_MergedGlobals_15 == 1)
    {
      CFCharacterSetRef v38 = (const __CFCharacterSet *)qword_1EB3A9760;
    }
    else
    {
      CFCharacterSetRef v38 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1EB3A9760 = (uint64_t)v38;
      _MergedGlobals_15 = 1;
    }
    if (CFCharacterSetIsCharacterMember(v38, v28))
    {
      if (_MergedGlobals_15 == 1)
      {
        CFCharacterSetRef v39 = (const __CFCharacterSet *)qword_1EB3A9760;
      }
      else
      {
        CFCharacterSetRef v39 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1EB3A9760 = (uint64_t)v39;
        _MergedGlobals_15 = 1;
      }
      if (!CFCharacterSetIsCharacterMember(v39, v37))
      {
LABEL_65:
        int v27 = v122;
        v122 = 0;
        int v88 = v123;
        char v89 = v124;
        char v23 = v125;
        goto LABEL_253;
      }
    }
    if (_MergedGlobals_15 == 1)
    {
      CFCharacterSetRef v40 = (const __CFCharacterSet *)qword_1EB3A9760;
    }
    else
    {
      CFCharacterSetRef v40 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1EB3A9760 = (uint64_t)v40;
      _MergedGlobals_15 = 1;
    }
    if (CFCharacterSetIsCharacterMember(v40, v28)) {
      goto LABEL_185;
    }
    if (_MergedGlobals_15 == 1)
    {
      CFCharacterSetRef v41 = (const __CFCharacterSet *)qword_1EB3A9760;
    }
    else
    {
      CFCharacterSetRef v41 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1EB3A9760 = (uint64_t)v41;
      _MergedGlobals_15 = 1;
    }
    if (!CFCharacterSetIsCharacterMember(v41, v37)) {
      goto LABEL_185;
    }
    WebCore::VisiblePosition::previous();
    double v42 = v94;
    long long v94 = 0;
    double v43 = v122;
    v122 = v42;
    if (v43)
    {
      if (*((_DWORD *)v43 + 7) == 2)
      {
        if ((*((_WORD *)v43 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v43);
          v64 = v94;
          int v123 = v95;
          char v124 = v96;
          char v125 = v97;
          long long v94 = 0;
          if (v64)
          {
            if (*((_DWORD *)v64 + 7) == 2)
            {
              if ((*((_WORD *)v64 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v64);
              }
            }
            else
            {
              *((_DWORD *)v64 + 7) -= 2;
            }
          }
          goto LABEL_185;
        }
      }
      else
      {
        *((_DWORD *)v43 + 7) -= 2;
      }
    }
    int v123 = v95;
    char v124 = v96;
    char v125 = v97;
LABEL_185:
    WebCore::endOfWord();
    if (!WebCore::operator==((uint64_t)&v114, (uint64_t)&v118))
    {
      WebCore::VisiblePosition::previous();
      UniChar v65 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      v66 = v94;
      long long v94 = 0;
      if (v66)
      {
        if (*((_DWORD *)v66 + 7) == 2)
        {
          if ((*((_WORD *)v66 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v66);
          }
        }
        else
        {
          *((_DWORD *)v66 + 7) -= 2;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        CFCharacterSetRef v67 = (const __CFCharacterSet *)qword_1EB3A9760;
      }
      else
      {
        CFCharacterSetRef v67 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1EB3A9760 = (uint64_t)v67;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v67, v65))
      {
        int v27 = v114;
        int v88 = v115;
        char v89 = v116;
        char v23 = v117;
        goto LABEL_253;
      }
    }
    WebCore::startOfWord();
    unsigned int v69 = v110;
    if (v110) {
      *((_DWORD *)v110 + 7) += 2;
    }
    char v70 = v122;
    v122 = v69;
    if (v70)
    {
      if (*((_DWORD *)v70 + 7) == 2)
      {
        if ((*((_WORD *)v70 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v70);
          unsigned int v69 = v122;
        }
      }
      else
      {
        *((_DWORD *)v70 + 7) -= 2;
      }
    }
    int v123 = v111;
    char v124 = v112;
    char v125 = v113;
    if (v69) {
      BOOL v71 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
    }
    else {
      BOOL v71 = 0;
    }
    if (!v71)
    {
LABEL_233:
      if (WebCore::operator==((uint64_t)&v122, (uint64_t)&v106))
      {
        char v80 = v114;
        if (v114) {
          *((_DWORD *)v114 + 7) += 2;
        }
        BOOL v81 = v122;
        v122 = v80;
        if (v81)
        {
          if (*((_DWORD *)v81 + 7) == 2)
          {
            if ((*((_WORD *)v81 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v81);
            }
          }
          else
          {
            *((_DWORD *)v81 + 7) -= 2;
          }
        }
        int v123 = v115;
        char v124 = v116;
        char v23 = v117;
        char v125 = v117;
      }
      else
      {
        char v23 = v125;
      }
      int v27 = v122;
      v122 = 0;
      int v88 = v123;
      char v89 = v124;
      CFTypeRef v82 = v110;
      v110 = 0;
      if (v82)
      {
        if (*((_DWORD *)v82 + 7) == 2)
        {
          if ((*((_WORD *)v82 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v82);
          }
        }
        else
        {
          *((_DWORD *)v82 + 7) -= 2;
        }
      }
      char v83 = v114;
      v114 = 0;
      if (v83)
      {
        if (*((_DWORD *)v83 + 7) == 2)
        {
          if ((*((_WORD *)v83 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v83);
          }
        }
        else
        {
          *((_DWORD *)v83 + 7) -= 2;
        }
      }
LABEL_253:
      v84 = v118;
      v118 = 0;
      if (v84)
      {
        if (*((_DWORD *)v84 + 7) == 2)
        {
          if ((*((_WORD *)v84 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v84);
          }
        }
        else
        {
          *((_DWORD *)v84 + 7) -= 2;
        }
      }
      char v85 = v122;
      v122 = 0;
      if (v85)
      {
        if (*((_DWORD *)v85 + 7) == 2)
        {
          if ((*((_WORD *)v85 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v85);
          }
        }
        else
        {
          *((_DWORD *)v85 + 7) -= 2;
        }
      }
      long long v62 = v90;
      char v90 = v27;
      if (!v62) {
        goto LABEL_267;
      }
      int v63 = *((_DWORD *)v62 + 7) - 2;
      if (*((_DWORD *)v62 + 7) != 2)
      {
LABEL_179:
        *((_DWORD *)v62 + 7) = v63;
LABEL_267:
        int v91 = v88;
        char v92 = v89;
        char v93 = v23;
        if (v90) {
          uint64_t v86 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
        }
        else {
          uint64_t v86 = 0;
        }
        if (v86 && !WebCore::operator==((uint64_t)&v90, (uint64_t)v98)) {
          WebCore::FrameSelection::moveTo();
        }
        v87 = v90;
        char v90 = 0;
        if (v87)
        {
          if (*((_DWORD *)v87 + 7) == 2)
          {
            if ((*((_WORD *)v87 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v87);
            }
          }
          else
          {
            *((_DWORD *)v87 + 7) -= 2;
          }
        }
        WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v99);
LABEL_6:
        unsigned __int8 v8 = v98[0];
        v98[0] = 0;
        if (v8)
        {
          if (*((_DWORD *)v8 + 7) == 2)
          {
            if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v8);
            }
          }
          else
          {
            *((_DWORD *)v8 + 7) -= 2;
          }
        }
        goto LABEL_11;
      }
LABEL_265:
      if ((*((_WORD *)v62 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v62);
      }
      goto LABEL_267;
    }
    while (1)
    {
      if ((WebCore::isStartOfLine((WebCore *)&v122, v68) & 1) != 0
        || (WebCore::isEndOfLine((WebCore *)&v122, v72) & 1) != 0
        || WebCore::operator==((uint64_t)&v122, (uint64_t)&v106))
      {
        goto LABEL_233;
      }
      WebCore::VisiblePosition::previous();
      UniChar v73 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      BOOL v74 = v94;
      long long v94 = 0;
      if (v74)
      {
        if (*((_DWORD *)v74 + 7) == 2)
        {
          if ((*((_WORD *)v74 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v74);
          }
        }
        else
        {
          *((_DWORD *)v74 + 7) -= 2;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        CFCharacterSetRef v75 = (const __CFCharacterSet *)qword_1EB3A9760;
      }
      else
      {
        CFCharacterSetRef v75 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1EB3A9760 = (uint64_t)v75;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v75, v73)) {
        goto LABEL_233;
      }
      WebCore::VisiblePosition::previous();
      VisiblePosition v76 = v94;
      long long v94 = 0;
      VisiblePosition v77 = v122;
      v122 = v76;
      if (v77)
      {
        if (*((_DWORD *)v77 + 7) == 2)
        {
          if ((*((_WORD *)v77 + 17) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v77);
            long long v78 = v94;
            int v123 = v95;
            char v124 = v96;
            char v125 = v97;
            long long v94 = 0;
            if (v78)
            {
              if (*((_DWORD *)v78 + 7) == 2)
              {
                if ((*((_WORD *)v78 + 17) & 0x400) == 0) {
                  WebCore::Node::removedLastRef(v78);
                }
              }
              else
              {
                *((_DWORD *)v78 + 7) -= 2;
              }
            }
            goto LABEL_225;
          }
        }
        else
        {
          *((_DWORD *)v77 + 7) -= 2;
        }
      }
      int v123 = v95;
      char v124 = v96;
      char v125 = v97;
LABEL_225:
      if (v122) {
        unsigned int v79 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
      }
      else {
        unsigned int v79 = 0;
      }
      if (!v79) {
        goto LABEL_233;
      }
    }
  }
LABEL_11:
  uint64_t v9 = v101[0];
  v101[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)(v9 + 28) == 2)
    {
      if ((*(_WORD *)(v9 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v9);
      }
    }
    else
    {
      *(_DWORD *)(v9 + 28) -= 2;
    }
  }
  uint64_t v10 = v102;
  v102 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  int v11 = v106;
  long long v106 = 0;
  if (v11)
  {
    if (*((_DWORD *)v11 + 7) == 2)
    {
      if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v11);
      }
    }
    else
    {
      *((_DWORD *)v11 + 7) -= 2;
    }
  }
}

- (id)startPosition
{
  int v2 = [(WebFrame *)self coreFrame];
  WebCore::startOfDocument((uint64_t *)v7, v2[37], v3);
  id v4 = +[WebVisiblePosition _wrapVisiblePosition:v7];
  int v5 = v7[0];
  v7[0] = 0;
  if (!v5) {
    return v4;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (id)endPosition
{
  int v2 = [(WebFrame *)self coreFrame];
  WebCore::endOfDocument((uint64_t *)v7, v2[37], v3);
  id v4 = +[WebVisiblePosition _wrapVisiblePosition:v7];
  int v5 = v7[0];
  v7[0] = 0;
  if (!v5) {
    return v4;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (BOOL)renderedCharactersExceed:(unint64_t)a3
{
  uint64_t v4 = *(void *)([(WebFrame *)self coreFrame] + 288);
  return MEMORY[0x1F416DAE0](v4, a3);
}

- (CGRect)elementRectAtPoint:(CGPoint)a3
{
  CGPoint v30 = a3;
  BOOL v3 = *(WebCore::ScrollView **)([(WebFrame *)self coreFrame] + 288);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v26, &v30);
  float v4 = roundf(*(float *)&v26);
  uint64_t v5 = 0x7FFFFFFFLL;
  uint64_t v6 = (int)v4;
  if (v4 <= -2147500000.0) {
    uint64_t v6 = 0x80000000;
  }
  if (v4 < 2147500000.0) {
    uint64_t v5 = v6;
  }
  float v7 = roundf(*((float *)&v26 + 1));
  uint64_t v8 = 0x7FFFFFFF00000000;
  unint64_t v9 = 0x8000000000000000;
  if (v7 > -2147500000.0) {
    unint64_t v9 = (unint64_t)(int)v7 << 32;
  }
  if (v7 < 2147500000.0) {
    uint64_t v8 = v9;
  }
  v28[0] = v8 | v5;
  int32x2_t v10 = (int32x2_t)WebCore::ScrollView::windowToContents(v3, (const WebCore::IntPoint *)v28);
  int8x8_t v11 = (int8x8_t)vcgt_s32(v10, (int32x2_t)0xFE000000FE000000);
  uint64_t v26 = (uint64_t)vorr_s8((int8x8_t)(*(void *)&v11 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, v10), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32(v10, 6uLL)), v11));
  WebCore::EventHandler::hitTestResultAtPoint();
  uint64_t v12 = v29;
  if (v29 && (*(void *)(v29 + 72) & 0xFFFFFFFFFFFFLL) != 0)
  {
    WebCore::HitTestResult::innerNodeFrame((WebCore::HitTestResult *)v28);
    WebCore::RenderObject::absoluteBoundingBoxRect((WebCore::RenderObject *)(*(void *)(v12 + 72) & 0xFFFFFFFFFFFFLL), 1, 0);
    uint64_t v26 = WebCore::ScrollView::contentsToWindow();
    uint64_t v27 = v13;
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    WebCore::IntRect::operator CGRect();
  }
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  MEMORY[0x1E4E450F0](v28);
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

@end