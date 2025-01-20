@interface UIWebBrowserView
+ (id)getUIWebBrowserViewForWebFrame:(id)a3;
+ (void)initialize;
- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3;
- (BOOL)_dumpWebArchiveAtPath:(id)a3;
- (BOOL)_hasSubviewContainingWebContent:(id)a3;
- (BOOL)_isAutoFilling;
- (BOOL)_keepKeyboardVisibleDuringFocusRedirects;
- (BOOL)_requiresKeyboardResetOnReload;
- (BOOL)_requiresKeyboardWhenFirstResponder;
- (BOOL)_resignFirstResponderAndBlurFocusedElement;
- (BOOL)_restoreFocusWithToken:(id)a3;
- (BOOL)_shouldDeferEvents;
- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder;
- (BOOL)allowDOMFocusRedirects;
- (BOOL)allowsInlineMediaPlayback;
- (BOOL)allowsLinkPreview;
- (BOOL)allowsPictureInPictureVideo;
- (BOOL)alwaysDispatchesScrollEvents;
- (BOOL)appendOverflowScrollForNode:(id)a3 offset:(CGPoint)a4 whileScrolling:(BOOL)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hasEditedTextField;
- (BOOL)inputViewObeysDOMFocus;
- (BOOL)isAccessoryEnabled;
- (BOOL)isAnyTouchOverActiveArea:(id)a3;
- (BOOL)isAutoFillMode;
- (BOOL)isDispatchingTouchEvents;
- (BOOL)isEditable;
- (BOOL)mediaPlaybackRequiresUserAction;
- (BOOL)playsNicelyWithGestures;
- (CGPoint)_convertWindowPointToViewport:(CGPoint)a3;
- (CGRect)_activeRectForRectToCenter:(CGRect)a3;
- (CGSize)_defaultScrollViewContentSize;
- (DOMNode)_currentAssistedNode;
- (NSString)networkInterfaceName;
- (UIFormPeripheral)_input;
- (UIResponder)_editingDelegateForEverythingExceptForms;
- (UIWebAutoFillDelegate)autoFillDelegate;
- (UIWebBrowserView)initWithFrame:(CGRect)a3;
- (UIWebBrowserView)initWithWebView:(id)a3 frame:(CGRect)a4;
- (UIWebFormAccessory)_accessory;
- (double)heightToKeepVisible;
- (double)minimumVerticalContentOffset;
- (double)scaleForProposedNewScale:(double)a3 andOldScale:(double)a4;
- (id)_absoluteUrlRelativeToDocumentURL:(id)a3;
- (id)_collectAdditionalSubviews;
- (id)_editingDelegate;
- (id)_keyboardResponder;
- (id)addFindOnPageHighlighter;
- (id)formElement;
- (id)inputAccessoryView;
- (id)inputView;
- (id)keyCommands;
- (id)messagesMatchingMask:(int)a3;
- (id)textDocument;
- (id)textFormElement;
- (uint64_t)_zoomToRect:(CGFloat)a3 ensuringVisibilityOfRect:(CGFloat)a4 withScale:(CGFloat)a5 forceScroll:(CGFloat)a6 formAssistantFrame:(CGFloat)a7 animationDuration:(CGFloat)a8;
- (unsigned)audioSessionCategoryOverride;
- (void)_addAdditionalSubview:(id)a3;
- (void)_assistFormNode:(id)a3;
- (void)_autoFillFrame:(id)a3;
- (void)_beginAllowingFocusRedirects;
- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6;
- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6 toValue:(double)a7;
- (void)_clearAllConsoleMessages;
- (void)_clearFormAutoFillStateForFrame:(id)a3;
- (void)_clearSelectionAndUI;
- (void)_clearToken:(id)a3;
- (void)_deferWebEvent:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didScroll;
- (void)_dispatchWebEvent:(id)a3;
- (void)_displayFormNodeInputView;
- (void)_endAllowingFocusRedirects;
- (void)_endDeferringEvents;
- (void)_focusAndAssistFormNode:(id)a3;
- (void)_handleDeferredEvents;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_nextAccessoryTab:(id)a3;
- (void)_noteOverflowScrollViewPendingDeletion:(id)a3;
- (void)_noteOverflowScrollViewPendingInsertion:(id)a3;
- (void)_overflowScrollView:(id)a3 didEndScrollingForNode:(id)a4;
- (void)_overflowScrollView:(id)a3 scrollOffsetChangedForNode:(id)a4 whileScrolling:(BOOL)a5;
- (void)_overflowScrollView:(id)a3 willStartScrollingForNode:(id)a4;
- (void)_preserveFocusWithToken:(id)a3 destructively:(BOOL)a4;
- (void)_prevAccessoryTab:(id)a3;
- (void)_promptForReplace:(id)a3;
- (void)_reloadInputViewsAfterPotentialFocusRedirect;
- (void)_removeAdditionalSubview:(id)a3;
- (void)_removeFindOnPageHighlighter:(id)a3;
- (void)_resetFormDataForFrame:(id)a3;
- (void)_scrollCaretToVisible:(id)a3;
- (void)_setInputViewBoundsForAutomaticKeyboardInfo:(id)a3 adjustScrollView:(BOOL)a4;
- (void)_setSelectedDOMRangeAndUpdateUI:(id)a3;
- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_startAssistingNode:(id)a3;
- (void)_startDeferringEvents;
- (void)_startRelinquishingFirstResponderToFocusedElement;
- (void)_startURLificationIfNeededCoalesce:(BOOL)a3;
- (void)_stopAssistingFormNode;
- (void)_stopAssistingNode:(id)a3;
- (void)_stopRelinquishingFirstResponderToFocusedElement;
- (void)_transliterateChinese:(id)a3;
- (void)_updateAccessory;
- (void)_updateAutoFillButton;
- (void)_updateFixedPositionContent;
- (void)_updateFixedPositioningObjectsLayoutAfterScroll;
- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange;
- (void)_updateFixedPositioningObjectsLayoutDuringScroll;
- (void)_updateFixedPositioningObjectsLayoutSoon;
- (void)_updateScrollerViewForInputView:(id)a3;
- (void)_webThreadOverflowScrollOffsetChanged;
- (void)_webTouchEventsRecognized:(id)a3;
- (void)_webViewFormEditedStatusHasChanged:(id)a3;
- (void)_zoomToNode:(id)a3 forceScroll:(BOOL)a4;
- (void)_zoomToRect:(CGRect)a3 ensuringVisibilityOfRect:(CGRect)a4 withScale:(double)a5 forceScroll:(BOOL)a6;
- (void)_zoomToRect:(CGRect)a3 withScale:(double)a4;
- (void)acceptedAutoFillWord:(id)a3;
- (void)accessoryAutoFill;
- (void)accessoryClear;
- (void)accessoryTab:(BOOL)a3;
- (void)assistFormNode:(id)a3;
- (void)clearMessagesMatchingMask:(int)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)formDelegateTextDidChange;
- (void)installGestureRecognizers;
- (void)redrawScaledDocument;
- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3;
- (void)setAccessoryEnabled:(BOOL)a3;
- (void)setAllowDOMFocusRedirects:(BOOL)a3;
- (void)setAllowsInlineMediaPlayback:(BOOL)a3;
- (void)setAllowsLinkPreview:(BOOL)a3;
- (void)setAllowsPictureInPictureVideo:(BOOL)a3;
- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3;
- (void)setAudioSessionCategoryOverride:(unsigned int)a3;
- (void)setAutoFillDelegate:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInputViewObeysDOMFocus:(BOOL)a3;
- (void)setMediaPlaybackRequiresUserAction:(BOOL)a3;
- (void)setNetworkInterfaceName:(id)a3;
- (void)set_accessory:(id)a3;
- (void)set_currentAssistedNode:(id)a3;
- (void)set_editingDelegateForEverythingExceptForms:(id)a3;
- (void)set_input:(id)a3;
- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4;
- (void)webView:(id)a3 addMessageToConsole:(id)a4 withSource:(id)a5;
- (void)webView:(id)a3 didCreateOrUpdateScrollingLayer:(id)a4 withContentsLayer:(id)a5 scrollSize:(id)a6 forNode:(id)a7 allowHorizontalScrollbar:(BOOL)a8 allowVerticalScrollbar:(BOOL)a9;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4;
- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webView:(id)a3 elementDidBlurNode:(id)a4;
- (void)webView:(id)a3 elementDidFocusNode:(id)a4;
- (void)webView:(id)a3 willCloseFrame:(id)a4;
- (void)webView:(id)a3 willRemoveScrollingLayer:(id)a4 withContentsLayer:(id)a5 forNode:(id)a6;
- (void)webViewDidCommitCompositingLayerChanges:(id)a3;
- (void)webViewDidPreventDefaultForEvent:(id)a3;
@end

@implementation UIWebBrowserView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UIApplicationLoadWebKit();
  }
}

+ (id)getUIWebBrowserViewForWebFrame:(id)a3
{
  v3 = (void *)[a3 webView];
  return (id)[v3 _UIKitDelegate];
}

- (UIWebBrowserView)initWithWebView:(id)a3 frame:(CGRect)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIWebBrowserView;
  v4 = -[UIWebDocumentView initWithWebView:frame:](&v9, sel_initWithWebView_frame_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)&v4->super + 953) |= 4u;
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__keyboardWillChangeFrame_ name:@"UIKeyboardWillChangeFrameNotification" object:0];
    [v6 addObserver:v5 selector:sel__keyboardDidChangeFrame_ name:@"UIKeyboardDidChangeFrameNotification" object:0];
    [v6 addObserver:v5 selector:sel__keyboardWillShow_ name:@"UIKeyboardWillShowNotification" object:0];
    [v6 addObserver:v5 selector:sel__keyboardWillHide_ name:@"UIKeyboardWillHideNotification" object:0];
    [v6 addObserver:v5 selector:sel__keyboardDidHide_ name:@"UIKeyboardDidHideNotification" object:0];
    *((unsigned char *)v5 + 1608) |= 1u;
    v7 = [[UIWebFormDelegate alloc] initWithWebBrowserView:v5];
    v5->_formDelegate = v7;
    [(WebView *)v5->super._webView _setFormDelegate:v7];
    [(WebView *)v5->super._webView _setUIWebViewUserAgentWithBuildVersion:[+[UIDevice currentDevice] buildVersion]];
    [(WebPreferences *)[(WebView *)v5->super._webView preferences] setShrinksStandaloneImagesToFit:1];
  }
  return v5;
}

- (UIWebBrowserView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  v3 = -[UIWebDocumentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(WebView *)v3->super._webView _setUIWebViewUserAgentWithBuildVersion:[+[UIDevice currentDevice] buildVersion]];
  }
  return v4;
}

- (void)dealloc
{
  v15[5] = *MEMORY[0x1E4F143B8];
  [(UIWebBrowserView *)self _clearFormAutoFillStateForFrame:[(WebView *)self->super._webView mainFrame]];
  [(UIWebBrowserView *)self set_accessory:0];
  [(UIWebBrowserView *)self set_input:0];
  [(UIWebBrowserView *)self set_currentAssistedNode:0];
  self->_editingDelegateForEverythingExceptForms = 0;
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v15[0] = @"UIKeyboardWillChangeFrameNotification";
  v15[1] = @"UIKeyboardDidChangeFrameNotification";
  v15[2] = @"UIKeyboardWillShowNotification";
  v15[3] = @"UIKeyboardWillHideNotification";
  v15[4] = @"UIKeyboardDidHideNotification";
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5]);
  [(UIGestureRecognizer *)self->_webTouchEventsGestureRecognizer setDelegate:0];

  v4 = (void *)[(NSHashTable *)self->_activeHighlighters copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) clearBrowserView];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)UIWebBrowserView;
  [(UIWebDocumentView *)&v9 dealloc];
}

- (void)installGestureRecognizers
{
  if (!self->_webTouchEventsGestureRecognizer)
  {
    v3 = [[UIWebTouchEventsGestureRecognizer alloc] initWithTarget:self action:sel__webTouchEventsRecognized_ touchDelegate:self];
    self->_webTouchEventsGestureRecognizer = v3;
    [(UIGestureRecognizer *)v3 setDelegate:self];
    [(UIView *)self addGestureRecognizer:self->_webTouchEventsGestureRecognizer];
    v4.receiver = self;
    v4.super_class = (Class)UIWebBrowserView;
    [(UIWebDocumentView *)&v4 installGestureRecognizers];
  }
}

- (BOOL)isEditable
{
  if ([(DOMNode *)self->_currentAssistedNode _requiresInputView]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebBrowserView;
  return [(UIWebDocumentView *)&v4 isEditable];
}

- (BOOL)_keepKeyboardVisibleDuringFocusRedirects
{
  BOOL v3 = [(UIWebBrowserView *)self allowDOMFocusRedirects];
  if (v3)
  {
    assistedNodeStartingFocusRedirects = self->_assistedNodeStartingFocusRedirects;
    LOBYTE(v3) = [(DOMNode *)assistedNodeStartingFocusRedirects _requiresInputView];
  }
  return v3;
}

- (BOOL)_requiresKeyboardWhenFirstResponder
{
  if ((*((unsigned char *)self + 1608) & 2) != 0
    || [(DOMNode *)self->_currentAssistedNode _requiresInputView])
  {
    return 1;
  }
  return [(UIWebBrowserView *)self _keepKeyboardVisibleDuringFocusRedirects];
}

- (BOOL)_requiresKeyboardResetOnReload
{
  return 1;
}

- (id)_keyboardResponder
{
  v2 = self;
  if ([(DOMNode *)self->_currentAssistedNode conformsToProtocol:&unk_1ED42EEC0]) {
    return v2->_currentAssistedNode;
  }
  return v2;
}

- (id)textDocument
{
  id result = [(UIWebBrowserView *)self formElement];
  if (!result) {
    return self;
  }
  return result;
}

- (BOOL)_resignFirstResponderAndBlurFocusedElement
{
  if (self->_currentAssistedNode)
  {
    WebThreadLock();
    if ([(DOMNode *)self->_currentAssistedNode nodeType] == 1) {
      [(DOMNode *)self->_currentAssistedNode blur];
    }
    if (self->_currentAssistedNode) {
      [(UIWebBrowserView *)self _stopAssistingFormNode];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebBrowserView;
  return [(UIWebDocumentView *)&v4 resignFirstResponder];
}

- (id)keyCommands
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = +[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0 action:sel__nextAccessoryTab_];
  v3[1] = +[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel__prevAccessoryTab_];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
}

- (void)_nextAccessoryTab:(id)a3
{
}

- (void)_prevAccessoryTab:(id)a3
{
}

- (id)inputAccessoryView
{
  if (!self->_accessory)
  {
    [(UIWebBrowserView *)self set_accessory:[[UIWebFormAccessory alloc] initWithInputAssistantItem:[(UIResponder *)self inputAssistantItem]]];
    [(UIWebFormAccessory *)self->_accessory setDelegate:self];
  }
  if ((*((unsigned char *)self + 1608) & 1) != 0
    && ((*((unsigned char *)self + 1608) & 2) != 0
     || [(DOMNode *)self->_currentAssistedNode _requiresAccessoryView]
     || [(UIWebBrowserView *)self _keepKeyboardVisibleDuringFocusRedirects]))
  {
    return self->_accessory;
  }
  else
  {
    return 0;
  }
}

- (id)inputView
{
  if (self->_input) {
    [(UIWebBrowserView *)self _displayFormNodeInputView];
  }
  else {
    [(UIWebBrowserView *)self set_input:[(DOMNode *)self->_currentAssistedNode createPeripheral]];
  }
  input = self->_input;
  return (id)[(UIFormPeripheral *)input assistantView];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__promptForReplace_ == a3 || sel__transliterateChinese_ == a3)
  {
    id v7 = [(UIWebBrowserView *)self textFormElement];
    if (!v7) {
      return (char)v7;
    }
    uint64_t v8 = v7;
    if ([v7 isSecure]) {
      goto LABEL_24;
    }
    id v7 = (id)[v8 selectedTextRange];
    if (!v7) {
      return (char)v7;
    }
    id v9 = v7;
    if ([v7 isEmpty]) {
      goto LABEL_24;
    }
    id v10 = [(UIWebDocumentView *)self textInRange:v9];
    LOBYTE(v7) = [(UIResponder *)self _shouldPerformUICalloutBarButtonReplaceAction:a3 forText:v10 checkAutocorrection:0];
  }
  else
  {
    if (sel__nextAccessoryTab_ != a3)
    {
      if (sel__prevAccessoryTab_ != a3)
      {
        v14.receiver = self;
        v14.super_class = (Class)UIWebBrowserView;
        LOBYTE(v7) = [(UIWebDocumentView *)&v14 canPerformAction:a3 withSender:a4];
        return (char)v7;
      }
      if (self->_currentAssistedNode)
      {
        accessory = self->_accessory;
        LOBYTE(v7) = [(UIWebFormAccessory *)accessory isPreviousEnabled];
        return (char)v7;
      }
LABEL_24:
      LOBYTE(v7) = 0;
      return (char)v7;
    }
    if (!self->_currentAssistedNode) {
      goto LABEL_24;
    }
    long long v11 = self->_accessory;
    LOBYTE(v7) = [(UIWebFormAccessory *)v11 isNextEnabled];
  }
  return (char)v7;
}

- (void)copy:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebBrowserView;
  [(UIWebDocumentView *)&v5 copy:a3];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:0x1ED18B240 forKey:0x1ED18B240];
  objc_super v4 = +[UIPasteboard generalPasteboard];
  -[UIPasteboard addItems:](v4, "addItems:", [MEMORY[0x1E4F1C978] arrayWithObject:v3]);
}

- (id)_editingDelegate
{
  v2 = self;
  if (![(UIWebBrowserView *)self formElement])
  {
    uint64_t v3 = [(UIWebBrowserView *)v2 _editingDelegateForEverythingExceptForms];
    if (v3) {
      return v3;
    }
  }
  return v2;
}

- (BOOL)playsNicelyWithGestures
{
  if ([(UIWebBrowserView *)self formElement]
    || ([(UIWebBrowserView *)self _editingDelegateForEverythingExceptForms],
        (objc_opt_respondsToSelector() & 1) == 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebBrowserView;
    return [(UIWebDocumentView *)&v5 playsNicelyWithGestures];
  }
  else
  {
    uint64_t v3 = [(UIWebBrowserView *)self _editingDelegateForEverythingExceptForms];
    return [(UIResponder *)v3 playsNicelyWithGestures];
  }
}

- (void)_promptForReplace:(id)a3
{
}

- (void)_transliterateChinese:(id)a3
{
}

- (void)_startAssistingNode:(id)a3
{
}

- (void)_stopAssistingNode:(id)a3
{
  [(UIFormPeripheral *)self->_input endEditing];
  [(UIWebBrowserView *)self set_input:0];
}

- (void)_startRelinquishingFirstResponderToFocusedElement
{
}

- (void)_stopRelinquishingFirstResponderToFocusedElement
{
}

- (void)_setInputViewBoundsForAutomaticKeyboardInfo:(id)a3 adjustScrollView:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    BOOL v9 = [(UIWindow *)[(UIView *)self window] _isHostedInAnotherProcess];
    id v10 = [(UIView *)self window];
    [v8 CGRectValue];
    double x = v11;
    double y = v13;
    double width = v15;
    double height = v17;
    if (!v9)
    {
      [(UIScreen *)[(UIWindow *)[(UIView *)self window] screen] bounds];
      v31.origin.double x = v19;
      v31.origin.double y = v20;
      v31.size.double width = v21;
      v31.size.double height = v22;
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = width;
      v29.size.double height = height;
      CGRect v30 = CGRectIntersection(v29, v31);
      double x = v30.origin.x;
      double y = v30.origin.y;
      double width = v30.size.width;
      double height = v30.size.height;
    }
    -[UIWindow convertRect:fromWindow:](v10, "convertRect:fromWindow:", 0, x, y, width, height);
    self->_inputViewBounds.origin.double x = v23;
    self->_inputViewBounds.origin.double y = v24;
    self->_inputViewBounds.size.double width = v25;
    self->_inputViewBounds.size.double height = v26;
    if (v4)
    {
      id v27 = [(UIView *)self _scroller];
      [v27 _adjustForAutomaticKeyboardInfo:a3 animated:1 lastAdjustment:&self->_lastAdjustmentForScroller];
    }
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  if (self->_currentAssistedNode)
  {
    uint64_t v4 = [a3 userInfo];
    [(UIWebBrowserView *)self _setInputViewBoundsForAutomaticKeyboardInfo:v4 adjustScrollView:1];
  }
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [(UIWebBrowserView *)self _setInputViewBoundsForAutomaticKeyboardInfo:v4 adjustScrollView:0];
}

- (void)_keyboardWillShow:(id)a3
{
  if (self->_currentAssistedNode)
  {
    -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", [a3 userInfo], 1);
    *((unsigned char *)self + 1608) = *((unsigned char *)self + 1608) & 0xFD | (2
                                                              * (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1));
  }
}

- (void)_keyboardWillHide:(id)a3
{
  if ((objc_msgSend(+[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance"), "isRotating") & 1) == 0)
  {
    -[UIWebBrowserView _setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:](self, "_setInputViewBoundsForAutomaticKeyboardInfo:adjustScrollView:", [a3 userInfo], 1);
    *((unsigned char *)self + 1608) &= ~2u;
  }
}

- (void)_updateFixedPositioningObjectsLayoutDuringScroll
{
  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    [(UIWebDocumentView *)&v2 _updateFixedPositioningObjectsLayoutDuringScroll];
  }
}

- (void)_updateFixedPositioningObjectsLayoutAfterScroll
{
  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    [(UIWebDocumentView *)&v2 _updateFixedPositioningObjectsLayoutAfterScroll];
  }
}

- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange
{
  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    [(UIWebDocumentView *)&v2 _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange];
  }
}

- (void)_updateFixedPositionContent
{
  if (!self->_currentAssistedNode)
  {
    v2.receiver = self;
    v2.super_class = (Class)UIWebBrowserView;
    [(UIWebDocumentView *)&v2 _updateFixedPositionContent];
  }
}

- (void)_updateFixedPositioningObjectsLayoutSoon
{
  if (!self->_currentAssistedNode) {
    [(UIWebBrowserView *)self _updateFixedPositioningObjectsLayoutAfterScroll];
  }
}

- (void)_updateScrollerViewForInputView:(id)a3
{
  id v5 = [(UIView *)self _scroller];
  [v5 _adjustForAutomaticKeyboardInfo:a3 animated:1 lastAdjustment:&self->_lastAdjustmentForScroller];
}

- (void)_didScroll
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserView;
  [(UIWebDocumentView *)&v3 _didScroll];
  if ((*((unsigned char *)self + 1608) & 0x40) != 0) {
    [(UIWebDocumentView *)self sendScrollEventIfNecessary];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebBrowserView;
    -[UIWebDocumentView setFrame:](&v8, sel_setFrame_, x, y, width, height);
    if (self->_currentAssistedNode) {
      objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &self->_lastAdjustmentForScroller);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebBrowserView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
    if (self->_currentAssistedNode) {
      objc_msgSend(-[UIView _scroller](self, "_scroller"), "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", 0, 0, &self->_lastAdjustmentForScroller);
    }
  }
}

- (void)_stopAssistingFormNode
{
  objc_super v3 = self->_currentAssistedNode;
  [(DOMNode *)self->_currentAssistedNode _stopAssistingDocumentView:self];
  [(UIWebBrowserView *)self set_currentAssistedNode:0];
  [(UIResponder *)self reloadInputViews];

  [(UIWebBrowserView *)self performSelector:sel__updateFixedPositioningObjectsLayoutSoon withObject:0 afterDelay:0.0];
}

- (void)_displayFormNodeInputView
{
  if (![(UIWebBrowserView *)self allowDOMFocusRedirects]
    && !self->super._interaction.isWriting)
  {
    WebThreadLock();
    [(UIWebBrowserView *)self _zoomToNode:self->_currentAssistedNode forceScroll:[(DOMNode *)self->_currentAssistedNode _requiresInputView]];
    [(DOMNode *)self->_currentAssistedNode _startAssistingDocumentView:self];
    [(UIWebBrowserView *)self _updateAccessory];
  }
}

- (void)_updateAutoFillButton
{
  if (![(DOMNode *)self->_currentAssistedNode _supportsAutoFill])
  {
    accessordouble y = self->_accessory;
    goto LABEL_8;
  }
  char v3 = objc_opt_respondsToSelector();
  autoFillDelegate = self->_autoFillDelegate;
  if (v3)
  {
    uint64_t v5 = [(UIWebAutoFillDelegate *)autoFillDelegate titleOfAutoFillButtonInWebBrowserView:self];
    accessordouble y = self->_accessory;
    if (v5)
    {
      -[UIWebFormAccessory showAutoFillButtonWithTitle:](accessory, "showAutoFillButtonWithTitle:");
      return;
    }
    goto LABEL_8;
  }
  int v7 = [(UIWebAutoFillDelegate *)autoFillDelegate webBrowserViewShouldShowAutoFillButton:self];
  accessordouble y = self->_accessory;
  if (!v7)
  {
LABEL_8:
    [(UIWebFormAccessory *)accessory hideAutoFillButton];
    return;
  }
  [(UIWebFormAccessory *)accessory showAutoFillButton];
  objc_super v8 = self->_autoFillDelegate;
  CGRect v9 = [(UIWebFormAccessory *)self->_accessory _autofill];
  [(UIWebAutoFillDelegate *)v8 webBrowserView:self updateAutoFillButton:v9];
}

- (void)_updateAccessory
{
  if (![(UIWebBrowserView *)self allowDOMFocusRedirects])
  {
    BOOL v3 = [(DOMNode *)self->_currentAssistedNode _nextAssistedNode] != 0;
    BOOL v4 = [(DOMNode *)self->_currentAssistedNode _previousAssistedNode] != 0;
    [(UIWebFormAccessory *)self->_accessory setNextEnabled:v3];
    [(UIWebFormAccessory *)self->_accessory setPreviousEnabled:v4];
    [(UIWebBrowserView *)self _updateAutoFillButton];
    accessordouble y = self->_accessory;
    BOOL v6 = [(DOMNode *)self->_currentAssistedNode _supportsAccessoryClear];
    [(UIWebFormAccessory *)accessory setClearVisible:v6];
  }
}

- (void)_focusAndAssistFormNode:(id)a3
{
  WebThreadLock();
  [(UIWebBrowserView *)self _beginAllowingFocusRedirects];
  [(UIWebBrowserView *)self assistFormNode:a3];
  [a3 focus];
  [(UIWebBrowserView *)self _endAllowingFocusRedirects];
}

- (void)_beginAllowingFocusRedirects
{
  self->_assistedNodeStartingFocusRedirects = self->_currentAssistedNode;
}

- (void)_endAllowingFocusRedirects
{
  self->_assistedNodeStartingFocusRedirects = 0;
}

- (void)_assistFormNode:(id)a3
{
  [(UIWebBrowserView *)self _beginAllowingFocusRedirects];
  [(UIWebBrowserView *)self assistFormNode:a3];
  [(UIWebBrowserView *)self _endAllowingFocusRedirects];
}

- (void)assistFormNode:(id)a3
{
  currentAssistedNode = self->_currentAssistedNode;
  if (!currentAssistedNode
    || !-[DOMNode isSameNode:](currentAssistedNode, "isSameNode:", [a3 _realNode]))
  {
    if (objc_opt_respondsToSelector()) {
      [self->super._delegate webView:self willAssistFormNode:a3];
    }
    BOOL v6 = +[UIThreadSafeNode threadSafeNodeWithNode:a3];
    [(UIWebBrowserView *)self set_currentAssistedNode:v6];
  }
}

- (void)_reloadInputViewsAfterPotentialFocusRedirect
{
  [(DOMNode *)self->_assistedNodeStartingFocusRedirects _stopAssistingDocumentView:self];
  [(UIResponder *)self reloadInputViews];
  if (self->_currentAssistedNode) {
    [(UIWebBrowserView *)self _displayFormNodeInputView];
  }
  BOOL v3 = (void *)MEMORY[0x1E4FBA8A8];
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__updateFixedPositioningObjectsLayoutSoon object:0];
}

- (void)_preserveFocusWithToken:(id)a3 destructively:(BOOL)a4
{
  BOOL v4 = a4;
  focusPreservingTokens = self->_focusPreservingTokens;
  if (!focusPreservingTokens)
  {
    focusPreservingTokens = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    self->_focusPreservingTokens = focusPreservingTokens;
  }
  currentAssistedNode = self->_currentAssistedNode;
  if (!currentAssistedNode)
  {
    currentAssistedNode = (DOMNode *)[MEMORY[0x1E4F1CA98] null];
    focusPreservingTokens = self->_focusPreservingTokens;
  }
  [(NSMutableDictionary *)focusPreservingTokens setObject:currentAssistedNode forKey:a3];
  if (v4 && self->_currentAssistedNode)
  {
    [(UIWebBrowserView *)self _stopAssistingFormNode];
  }
}

- (BOOL)_restoreFocusWithToken:(id)a3
{
  uint64_t v5 = (DOMNode *)-[NSMutableDictionary objectForKey:](self->_focusPreservingTokens, "objectForKey:");
  if (-[DOMNode isEqual:](v5, "isEqual:", [MEMORY[0x1E4F1CA98] null]))
  {
    [(UIWebBrowserView *)self _stopAssistingFormNode];
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIWebBrowserView *)self _focusAndAssistFormNode:v5];
      BOOL v6 = self->_currentAssistedNode == v5;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  [(NSMutableDictionary *)self->_focusPreservingTokens removeObjectForKey:a3];
  return v6;
}

- (void)_clearToken:(id)a3
{
}

- (void)setAllowsInlineMediaPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  uint64_t v5 = [(WebView *)self->super._webView preferences];
  [(WebPreferences *)v5 setMediaPlaybackAllowsInline:v3];
}

- (BOOL)allowsInlineMediaPlayback
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  BOOL v3 = [(WebView *)self->super._webView preferences];
  return [(WebPreferences *)v3 mediaPlaybackAllowsInline];
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)a3
{
  BOOL v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  uint64_t v5 = [(WebView *)self->super._webView preferences];
  [(WebPreferences *)v5 setMediaPlaybackRequiresUserGesture:v3];
}

- (BOOL)mediaPlaybackRequiresUserAction
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  BOOL v3 = [(WebView *)self->super._webView preferences];
  return [(WebPreferences *)v3 mediaPlaybackRequiresUserGesture];
}

- (void)setAudioSessionCategoryOverride:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  uint64_t v5 = [(WebView *)self->super._webView preferences];
  [(WebPreferences *)v5 setAudioSessionCategoryOverride:v3];
}

- (void)setAllowsPictureInPictureVideo:(BOOL)a3
{
  BOOL v3 = a3;
  [(WebView *)self->super._webView preferences];
  if (objc_opt_respondsToSelector())
  {
    if ((WebThreadIsLocked() & 1) == 0) {
      WebThreadLock();
    }
    uint64_t v5 = [(WebView *)self->super._webView preferences];
    [(WebPreferences *)v5 setAllowsAlternateFullscreen:v3];
  }
}

- (BOOL)allowsPictureInPictureVideo
{
  [(WebView *)self->super._webView preferences];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  BOOL v3 = [(WebView *)self->super._webView preferences];
  return [(WebPreferences *)v3 allowsAlternateFullscreen];
}

- (void)setAllowsLinkPreview:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 1609);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 1609) = v3 & 0xFE | a3;
    if (a3) {
      [(UIWebDocumentView *)self _registerPreview];
    }
    else {
      [(UIWebDocumentView *)self _unregisterPreview];
    }
  }
}

- (BOOL)allowsLinkPreview
{
  return *((unsigned char *)self + 1609) & 1;
}

- (unsigned)audioSessionCategoryOverride
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  char v3 = [(WebView *)self->super._webView preferences];
  return [(WebPreferences *)v3 audioSessionCategoryOverride];
}

- (void)setNetworkInterfaceName:(id)a3
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  uint64_t v5 = [(WebView *)self->super._webView preferences];
  [(WebPreferences *)v5 setNetworkInterfaceName:a3];
}

- (NSString)networkInterfaceName
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  char v3 = [(WebView *)self->super._webView preferences];
  return (NSString *)[(WebPreferences *)v3 networkInterfaceName];
}

- (void)accessoryTab:(BOOL)a3
{
  BOOL v3 = a3;
  WebThreadLock();
  currentAssistedNode = self->_currentAssistedNode;
  if (v3) {
    uint64_t v6 = [(DOMNode *)currentAssistedNode _nextAssistedNode];
  }
  else {
    uint64_t v6 = [(DOMNode *)currentAssistedNode _previousAssistedNode];
  }
  if (v6)
  {
    [(UIWebBrowserView *)self _focusAndAssistFormNode:v6];
  }
  else
  {
    [(UIWebBrowserView *)self _updateAccessory];
  }
}

- (void)accessoryAutoFill
{
}

- (void)accessoryClear
{
  WebThreadLock();
  currentAssistedNode = self->_currentAssistedNode;
  [(DOMNode *)currentAssistedNode _accessoryClear];
}

- (void)_scrollCaretToVisible:(id)a3
{
  id v4 = [(UIWebBrowserView *)self formElement];
  if (v4 && !self->super._interaction.isWriting)
  {
    id v5 = v4;
    WebThreadLock();
    [(UIWebBrowserView *)self _zoomToNode:v5 forceScroll:0];
  }
}

- (void)formDelegateTextDidChange
{
  if (!self->super._interaction.isWriting) {
    [(UIWebBrowserView *)self performSelector:sel__scrollCaretToVisible_ withObject:self afterDelay:0.0];
  }
}

- (id)formElement
{
  return self->_currentAssistedNode;
}

- (id)textFormElement
{
  id v2 = [(UIWebBrowserView *)self formElement];
  return (id)[v2 _textFormElement];
}

- (void)_resetFormDataForFrame:(id)a3
{
  [(UIWebFormDelegate *)self->_formDelegate dataSourceHasChangedForFrame:a3];
  if (self->_currentAssistedNode)
  {
    [(UIWebBrowserView *)self _stopAssistingFormNode];
  }
}

- (void)_autoFillFrame:(id)a3
{
  if ([a3 isMainFrame]
    && (*((char *)&self->super + 955) & 0x80000000) == 0
    && (*((unsigned char *)&self->super + 955) & 0x40) != 0)
  {
    *((unsigned char *)self + 1608) |= 4u;
    [(UIWebAutoFillDelegate *)self->_autoFillDelegate webBrowserView:self preFillInFrame:a3];
    *((unsigned char *)self + 1608) &= ~4u;
  }
}

- (void)webView:(id)a3 willCloseFrame:(id)a4
{
}

- (void)_clearFormAutoFillStateForFrame:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    autoFillDelegate = self->_autoFillDelegate;
    [(UIWebAutoFillDelegate *)autoFillDelegate webBrowserView:self clearFormAutoFillStateForFrame:a3];
  }
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  if (self->_currentAssistedNode)
  {
    id v6 = [(UIWebDocumentView *)self _focusedOrMainFrame];
    if (v6 == a4 || [v6 _isDescendantOfFrame:a4])
    {
      currentAssistedNode = self->_currentAssistedNode;
      [(DOMNode *)currentAssistedNode blur];
    }
  }
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFinishLoadForFrame:](&v6, sel_webView_didFinishLoadForFrame_, a3);
  [(UIWebBrowserView *)self _autoFillFrame:a4];
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFailLoadWithError:forFrame:](&v7, sel_webView_didFailLoadWithError_forFrame_, a3, a4);
  [(UIWebBrowserView *)self _autoFillFrame:a5];
}

- (void)acceptedAutoFillWord:(id)a3
{
  *((unsigned char *)self + 1608) |= 4u;
  [(UIWebFormDelegate *)self->_formDelegate acceptedAutoFillWord:a3];
  *((unsigned char *)self + 1608) &= ~4u;
}

- (BOOL)isAutoFillMode
{
  id v3 = [(UIWebBrowserView *)self formElement];
  if (!v3 || ![v3 isTextControl]) {
    return 0;
  }
  formDelegate = self->_formDelegate;
  return [(UIWebFormDelegate *)formDelegate hasCurrentSuggestions];
}

- (BOOL)_isAutoFilling
{
  return (*((unsigned __int8 *)self + 1608) >> 2) & 1;
}

- (void)_webViewFormEditedStatusHasChanged:(id)a3
{
  *((unsigned char *)self + 1608) ^= 0x20u;
}

- (void)webView:(id)a3 elementDidFocusNode:(id)a4
{
  if ((*((unsigned char *)&self->super + 956) & 0x10) == 0)
  {
    if (objc_msgSend(a4, "nodeCanBecomeFirstResponder", a3)
      && ((*((unsigned char *)self + 1608) & 8) != 0
       || self->super._interaction.element
       || [(UIWebBrowserView *)self allowDOMFocusRedirects]
       || [(UIWebBrowserView *)self isDispatchingTouchEvents]))
    {
      if (![(UIView *)self isFirstResponder]
        && ((*((unsigned char *)self + 1608) & 8) != 0
         || [(UIWebBrowserView *)self isDispatchingTouchEvents]))
      {
        [(UIWebDocumentView *)self becomeFirstResponder];
      }
      if ([(UIWebBrowserView *)self allowDOMFocusRedirects]) {
        [(UIWebBrowserView *)self assistFormNode:a4];
      }
      else {
        [(UIWebBrowserView *)self _assistFormNode:a4];
      }
    }
    [(UIWebBrowserView *)self _updateAccessory];
  }
}

- (void)webView:(id)a3 elementDidBlurNode:(id)a4
{
  currentAssistedNode = self->_currentAssistedNode;
  if (currentAssistedNode)
  {
    if ([(DOMNode *)currentAssistedNode isSameNode:a4])
    {
      if ([a4 nodeType] == 1)
      {
        *((unsigned char *)self + 1608) &= ~2u;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [a4 isContentEditable])
        {
          [(UIWebBrowserView *)self _stopAssistingFormNode];
        }
      }
    }
  }
  [(UIWebBrowserView *)self _updateAccessory];
}

- (BOOL)_shouldDeferEvents
{
  return self->_dispatchedTouchEvents != 0;
}

- (void)_dispatchWebEvent:(id)a3
{
}

- (void)_startDeferringEvents
{
  [(UIView *)self setUserInteractionEnabled:0];
  id v3 = [(UIView *)self _scroller];
  [v3 setUserInteractionEnabled:0];
}

- (void)_endDeferringEvents
{
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "setUserInteractionEnabled:", 1);
  [(UIView *)self setUserInteractionEnabled:1];
}

- (void)_deferWebEvent:(id)a3
{
  deferredTouchEvents = self->_deferredTouchEvents;
  if (!deferredTouchEvents)
  {
    deferredTouchEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_deferredTouchEvents = deferredTouchEvents;
  }
  if (![(NSMutableArray *)deferredTouchEvents count]) {
    [(UIWebBrowserView *)self _startDeferringEvents];
  }
  objc_super v6 = self->_deferredTouchEvents;
  [(NSMutableArray *)v6 addObject:a3];
}

- (void)_handleDeferredEvents
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_deferredTouchEvents count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    deferredTouchEvents = self->_deferredTouchEvents;
    uint64_t v4 = [(NSMutableArray *)deferredTouchEvents countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(deferredTouchEvents);
          }
          [(UIWebBrowserView *)self _dispatchWebEvent:*(void *)(*((void *)&v8 + 1) + 8 * i)];
        }
        uint64_t v5 = [(NSMutableArray *)deferredTouchEvents countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    [(NSMutableArray *)self->_deferredTouchEvents removeAllObjects];

    self->_deferredTouchEvents = 0;
    [(UIWebBrowserView *)self _endDeferringEvents];
  }
}

- (void)_webTouchEventsRecognized:(id)a3
{
  uint64_t v4 = [a3 lastTouchEvent];
  uint64_t v5 = *(unsigned int *)(v4 + 80);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  if (v5)
  {
    uint64_t v9 = 0;
    do
    {
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *(double *)(*(void *)(v4 + 72) + v9 + 16), *(double *)(*(void *)(v4 + 72) + v9 + 24)));
      objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(v4 + 72) + v9 + 32)));
      objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(v4 + 72) + v9 + 40)));
      v9 += 88;
    }
    while (88 * v5 != v9);
  }
  if ((*(_DWORD *)v4 - 1) >= 3) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = (*(_DWORD *)v4 + 6);
  }
  id v11 = objc_alloc(MEMORY[0x1E4FB6DA8]);
  double v12 = *(double *)(v4 + 8);
  unsigned int v13 = [a3 modifierFlags];
  *(float *)&double v14 = *(double *)(v4 + 48);
  *(float *)&double v15 = *(double *)(v4 + 56);
  LOBYTE(v16) = *(unsigned char *)(v4 + 64);
  id v18 = (id)objc_msgSend(v11, "initWithTouchEventType:timeStamp:location:modifiers:touchCount:touchLocations:touchIdentifiers:touchPhases:isGesture:gestureScale:gestureRotation:", v10, v13 & 0xA0000 | ((HIWORD(v13) & 1) << 18) & 0xFBEFFFFF | (v13 >> 4) & 0x10000 | (((v13 >> 18) & 1) << 20) & 0xFBFFFFFF | (((v13 >> 23) & 1) << 26), v5, v6, v7, v8, v12, *(double *)(v4 + 32), *(double *)(v4 + 40), v14, v15, v16);

  if ([(UIWebBrowserView *)self _shouldDeferEvents])
  {
    [(UIWebBrowserView *)self _deferWebEvent:v18];
  }
  else
  {
    WebThreadLock();
    [(UIWebBrowserView *)self _dispatchWebEvent:v18];

    [(UIWebBrowserView *)self _handleDeferredEvents];
  }
}

- (BOOL)isDispatchingTouchEvents
{
  return [(UIWebTouchEventsGestureRecognizer *)self->_webTouchEventsGestureRecognizer isDispatchingTouchEvents];
}

- (CGPoint)_convertWindowPointToViewport:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0, x, y);
  double v12 = fmax(v11, 0.0);
  if (v12 >= v7) {
    double v12 = v7;
  }
  double v13 = fmax(v10, 0.0);
  if (v13 >= v9) {
    double v13 = v9;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)webViewDidPreventDefaultForEvent:(id)a3
{
  [(UIWebTouchEventsGestureRecognizer *)self->_webTouchEventsGestureRecognizer setDefaultPrevented:1];
  [(UIWebDocumentView *)self cancelInteraction];
}

- (CGRect)_activeRectForRectToCenter:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  WebThreadLock();
  element = [(UIWebBrowserView *)self formElement];
  if (!element)
  {
    if (self->super._interaction.var0) {
      element = self->super._interaction.element;
    }
    else {
      element = 0;
    }
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "documentView");
  if (element)
  {
    double v10 = [(DOMDocument *)[(DOMNode *)element ownerDocument] webFrame];
    double v11 = (void *)[(WebFrame *)v10 documentView];
    if (self->super._interaction.var0)
    {
      [(DOMNode *)element absoluteQuad];
      double v12 = quadBoundingBox(&v35);
    }
    else
    {
      [(WebFrame *)v10 rectForScrollToVisible];
    }
    double v22 = v12;
    double v23 = v13;
    double v24 = v14;
    double v25 = v15;
LABEL_16:
    objc_msgSend(v11, "convertRect:toView:", v9, v22, v23, v24, v25);
    double documentScale = self->super._documentScale;
    double v26 = v31 * documentScale;
    double v27 = v32 * documentScale;
    double v28 = v33 * documentScale;
    double v29 = v34 * documentScale;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([self->super._delegate webViewRotateShouldCenterSelectionRect:self] & 1) != 0)
  {
    uint64_t v16 = objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "selectedFrame");
    if (!v16) {
      uint64_t v16 = objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame");
    }
    double v11 = (void *)[v16 documentView];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "frameView"), "documentView"), "selectionRect");
    v39.origin.double x = v17;
    v39.origin.double y = v18;
    v39.size.double width = v19;
    v39.size.double height = v20;
    double v21 = 1.0 / self->super._documentScale;
    v36.origin.double x = x * v21;
    v36.origin.double y = y * v21;
    v36.size.double width = width * v21;
    v36.size.double height = height * v21;
    CGRect v37 = CGRectIntersection(v36, v39);
    double v22 = v37.origin.x;
    double v23 = v37.origin.y;
    double v24 = v37.size.width;
    double v25 = v37.size.height;
    if (!CGRectIsEmpty(v37)) {
      goto LABEL_16;
    }
  }
  double v26 = *MEMORY[0x1E4F1DB20];
  double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_17:
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6 toValue:(double)a7
{
  BOOL v10 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    double v64 = a5;
    double v66 = a7;
    id v16 = [(UIView *)self _scroller];
    [v16 bounds];
    double v18 = v17;
    double v65 = v19;
    objc_msgSend(v16, "convertRect:fromView:", self, x, y, width, height);
    double v21 = v20;
    double v23 = v22;
    double v26 = v25 + (v18 - v24) * -0.5;
    if (v10)
    {
      -[UIWebBrowserView _activeRectForRectToCenter:](self, "_activeRectForRectToCenter:", x, y, width, height);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
    }
    else
    {
      double v28 = *MEMORY[0x1E4F1DB20];
      double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v32 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    double v35 = round(v26);
    v68.origin.double x = v28;
    v68.origin.double y = v30;
    v68.size.double width = v32;
    v68.size.double height = v34;
    IsEmptdouble y = CGRectIsEmpty(v68);
    if (IsEmpty)
    {
      double v37 = v65;
      double v38 = round(v21 + (v65 - v23) * -0.5);
    }
    else
    {
      objc_msgSend(v16, "convertRect:fromView:", self, v28, v30, v32, v34);
      CGFloat v39 = v69.origin.x;
      CGFloat v40 = v69.origin.y;
      CGFloat v41 = v69.size.width;
      CGFloat v42 = v69.size.height;
      double v43 = round(CGRectGetMidY(v69) + v64 * -0.5);
      v70.origin.double x = v39;
      v70.origin.double y = v40;
      v70.size.double width = v41;
      v70.size.double height = v42;
      double v44 = CGRectGetMinX(v70) + -20.0;
      if (v35 >= v44) {
        double v35 = v44;
      }
      v71.origin.double x = v39;
      v71.origin.double y = v40;
      v71.size.double width = v41;
      v71.size.double height = v42;
      double v45 = CGRectGetMinY(v71) + -20.0;
      if (v43 >= v45) {
        double v43 = v45;
      }
      v72.origin.double x = v39;
      v72.origin.double y = v40;
      v72.size.double width = v41;
      v72.size.double height = v42;
      double v46 = CGRectGetMaxX(v72) + 20.0 - v18;
      if (v35 < v46) {
        double v35 = v46;
      }
      v73.origin.double x = v39;
      v73.origin.double y = v40;
      v73.size.double width = v41;
      v73.size.double height = v42;
      double v37 = v65;
      double v47 = CGRectGetMaxY(v73) + 20.0 - v65;
      if (v43 >= v47) {
        double v38 = v43;
      }
      else {
        double v38 = v47;
      }
    }
    [v16 contentSize];
    double v49 = v48;
    double v51 = v50;
    [v16 contentInset];
    double v56 = v49 + v54 + v55 - v18;
    if (v35 >= v56) {
      double v57 = v56;
    }
    else {
      double v57 = v35;
    }
    if (v57 < 0.0) {
      double v57 = 0.0;
    }
    double v58 = round(v57);
    BOOL v59 = a6 == 1 && IsEmpty;
    double v60 = v66;
    if (!v59)
    {
      double v61 = v51 + v52 + v53 - v37;
      if (v38 < v61) {
        double v61 = v38;
      }
      if (v61 < 0.0) {
        double v61 = 0.0;
      }
      char v62 = !IsEmpty;
      if (a6 != 4) {
        char v62 = 1;
      }
      if (v62)
      {
        double v60 = round(v61);
      }
      else
      {
        objc_msgSend(v16, "contentSize", v61, v66);
        double v60 = v63 - v37;
      }
    }
    objc_msgSend(v16, "setContentOffset:", v58, v60);
  }
}

- (void)_centerRect:(CGRect)a3 forSizeChange:(BOOL)a4 withVisibleHeight:(double)a5 pinningEdge:(unint64_t)a6
{
}

- (void)_zoomToNode:(id)a3 forceScroll:(BOOL)a4
{
  BOOL v4 = a4;
  if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1|| ![(_UIWebViewportHandler *)self->super._viewportHandler allowsUserScaling])
  {
    float documentScale = self->super._documentScale;
  }
  else
  {
    [a3 computedFontSize];
    float v8 = 16.0 / v7;
    [(_UIWebViewportHandler *)self->super._viewportHandler minimumScale];
    if (v8 < v9) {
      float v8 = v9;
    }
    [(_UIWebViewportHandler *)self->super._viewportHandler maximumScale];
    if (v8 < documentScale) {
      float documentScale = v8;
    }
  }
  [(_UIWebViewportHandler *)self->super._viewportHandler integralScaleForScale:0 keepingPointFixed:documentScale];
  double v12 = v11;
  double v13 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame");
  double v14 = (void *)[v13 documentView];
  uint64_t v15 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "documentView");
  if (a3) {
    [a3 absoluteQuad];
  }
  else {
    memset(v40, 0, sizeof(v40));
  }
  v41.origin.double x = quadBoundingBox((double *)v40);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  if (!CGRectIsEmpty(v41))
  {
    float v20 = v12;
    float v39 = v20;
    objc_msgSend(v14, "convertRect:toView:", v15, x, y, width, height);
    double v21 = self->super._documentScale;
    double v23 = v22 * v21;
    double v25 = v24 * v21;
    double v27 = v26 * v21;
    double v29 = v28 * v21;
    [v13 rectForScrollToVisible];
    objc_msgSend(v14, "convertRect:toView:", v15);
    double v30 = self->super._documentScale;
    double v32 = v31 * v30;
    double v34 = v33 * v30;
    double v36 = v35 * v30;
    double v38 = v37 * v30;
    v42.origin.double x = v23;
    v42.origin.double y = v25;
    v42.size.double width = v27;
    v42.size.double height = v29;
    v43.origin.double x = v32;
    v43.origin.double y = v34;
    v43.size.double width = v36;
    v43.size.double height = v38;
    if (!CGRectContainsRect(v42, v43))
    {
      double v32 = *MEMORY[0x1E4F1DB20];
      double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v36 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:](self, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:", v4, v23, v25, v27, v29, v32, v34, v36, v38, v39);
  }
}

- (void)_zoomToRect:(CGRect)a3 ensuringVisibilityOfRect:(CGRect)a4 withScale:(double)a5 forceScroll:(BOOL)a6
{
}

- (uint64_t)_zoomToRect:(CGFloat)a3 ensuringVisibilityOfRect:(CGFloat)a4 withScale:(CGFloat)a5 forceScroll:(CGFloat)a6 formAssistantFrame:(CGFloat)a7 animationDuration:(CGFloat)a8
{
  double v24 = (void *)[(id)a1 _scroller];
  double v25 = (void *)[v24 window];
  double v26 = a12 / *(float *)(a1 + 892);
  [v24 minimumZoomScale];
  if (v26 < v27) {
    double v26 = v27;
  }
  [v24 maximumZoomScale];
  if (v26 < v28) {
    double v28 = v26;
  }
  double v117 = v28;
  uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "_viewControllerForAncestor"), "_rootAncestorViewController"), "_viewControllerForSupportedInterfaceOrientations"), "view");
  if (v29) {
    double v30 = (void *)v29;
  }
  else {
    double v30 = v25;
  }
  [v30 bounds];
  objc_msgSend(v30, "convertRect:toView:", v24);
  CGFloat v125 = v31;
  CGFloat v105 = v33;
  CGFloat v106 = v32;
  CGFloat r2 = v34;
  [(id)a1 exposedScrollViewRect];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  [v24 bounds];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  v131.origin.CGFloat x = v36;
  v131.origin.CGFloat y = v38;
  v131.size.double width = v40;
  v131.size.double height = v42;
  BOOL IsNull = CGRectIsNull(v131);
  double v102 = v48;
  double v103 = v50;
  if (IsNull) {
    double v52 = v48;
  }
  else {
    double v52 = v40;
  }
  if (IsNull) {
    double v53 = v50;
  }
  else {
    double v53 = v42;
  }
  double v100 = v44;
  double v101 = v46;
  if (IsNull) {
    CGFloat v54 = v46;
  }
  else {
    CGFloat v54 = v38;
  }
  if (IsNull) {
    CGFloat v55 = v44;
  }
  else {
    CGFloat v55 = v36;
  }
  double v122 = v55;
  double v123 = v54;
  v147.origin.CGFloat x = v125;
  v147.size.double width = v105;
  v147.origin.CGFloat y = v106;
  v147.size.double height = r2;
  CGRect v132 = CGRectIntersection(*(CGRect *)(&v52 - 2), v147);
  CGFloat x = v132.origin.x;
  CGFloat y = v132.origin.y;
  double width = v132.size.width;
  double height = v132.size.height;
  objc_msgSend(v25, "convertRect:toView:", v24, a13, a14, a15, a16);
  v148.origin.CGFloat x = v60;
  v148.origin.CGFloat y = v61;
  v148.size.double width = v62;
  v148.size.double height = v63;
  v133.origin.CGFloat x = x;
  CGFloat rect = y;
  v133.origin.CGFloat y = y;
  v133.size.double width = width;
  v133.size.double height = height;
  CGRect v134 = CGRectIntersection(v133, v148);
  CGFloat v64 = v134.origin.x;
  CGFloat v65 = v134.origin.y;
  CGFloat v66 = v134.size.width;
  CGFloat v67 = v134.size.height;
  double v126 = width;
  double v127 = 0.0;
  if (CGRectIsEmpty(v134)) {
    goto LABEL_26;
  }
  v135.origin.CGFloat x = v64;
  v135.origin.CGFloat y = v65;
  v135.size.double width = v66;
  v135.size.double height = v67;
  double MinY = CGRectGetMinY(v135);
  v136.origin.CGFloat x = x;
  v136.origin.CGFloat y = rect;
  v136.size.double width = width;
  v136.size.double height = height;
  CGFloat v68 = CGRectGetMinY(v136);
  CGFloat v69 = x;
  double v70 = MinY - v68;
  CGFloat v107 = v69;
  v137.origin.CGFloat x = v69;
  v137.origin.CGFloat y = rect;
  CGFloat v71 = height;
  v137.size.double width = width;
  v137.size.double height = height;
  double MaxY = CGRectGetMaxY(v137);
  v138.origin.CGFloat x = v64;
  v138.origin.CGFloat y = v65;
  v138.size.double width = v66;
  v138.size.double height = v67;
  double height = MaxY - CGRectGetMaxY(v138);
  double v129 = v70;
  if (v70 < 106.0 && height >= v70)
  {
    v139.origin.CGFloat x = v64;
    v139.origin.CGFloat y = v65;
    v139.size.double width = v66;
    v139.size.double height = v67;
    double v74 = CGRectGetMaxY(v139);
    v140.origin.CGFloat x = v107;
    v140.origin.CGFloat y = rect;
    v140.size.double width = width;
    v140.size.double height = v71;
    double v127 = v74 - CGRectGetMinY(v140);
LABEL_26:
    double v129 = height;
  }
  v141.origin.CGFloat x = a6;
  v141.origin.CGFloat y = a7;
  v141.size.double width = a8;
  v141.size.double height = a9;
  BOOL v75 = CGRectIsNull(v141);
  if ((a11 & 1) == 0)
  {
    objc_msgSend(v24, "convertPoint:toView:", a1, v122, v123);
    CGFloat v76 = v142.origin.x;
    v142.size.double width = width;
    double v78 = v127 + v77;
    v142.origin.CGFloat y = v127 + v77;
    v142.size.double height = v129;
    v149.origin.CGFloat x = a2;
    v149.origin.CGFloat y = a3;
    v149.size.double width = a4;
    v149.size.double height = a5;
    uint64_t result = CGRectContainsRect(v142, v149);
    if (result) {
      return result;
    }
    if (!v75)
    {
      v143.origin.CGFloat x = v76;
      v143.origin.CGFloat y = v78;
      v150.origin.CGFloat x = a6;
      v143.size.double width = width;
      v143.size.double height = v129;
      v150.origin.CGFloat y = a7;
      v150.size.double width = a8;
      v150.size.double height = a9;
      uint64_t result = CGRectContainsRect(v143, v150);
      if (result) {
        return result;
      }
    }
  }
  double v80 = v117;
  double v81 = width;
  double v82 = (width - a4 * v117) * 0.5;
  if (v82 < 0.0) {
    double v82 = 0.0;
  }
  double v83 = v129;
  double v84 = (v129 - a5 * v117) * 0.5;
  if (v84 < 0.0) {
    double v84 = 0.0;
  }
  double v85 = a2 * v117 - v82;
  double v121 = a3 * v117 - v84;
  [*(id *)(a1 + 880) documentBounds];
  objc_msgSend((id)a1, "convertRect:toView:", v24, v86 * a12, v87 * a12, v88 * a12, v89 * a12);
  CGFloat v119 = v90;
  CGFloat v111 = v92;
  CGFloat v113 = v91;
  CGFloat recta = v93;
  if (v75)
  {
    double v94 = -INFINITY;
    goto LABEL_41;
  }
  v144.origin.CGFloat x = a6 * v117;
  v144.origin.CGFloat y = a7 * v117;
  v144.size.double width = a8 * v117;
  v144.size.double height = a9 * v117;
  double v95 = CGRectGetMaxX(v144) + 20.0 - v126;
  v145.origin.CGFloat x = a6 * v117;
  v145.origin.CGFloat y = a7 * v117;
  double v83 = v129;
  v145.size.double width = a8 * v117;
  v145.size.double height = a9 * v117;
  double v94 = CGRectGetMaxY(v145) + 20.0 - v129 - v127;
  if (v85 >= v95)
  {
    double v80 = v117;
    double v90 = v119;
    double v81 = v126;
    double v92 = v111;
    double v91 = v113;
    double v93 = recta;
LABEL_41:
    int v96 = !v75;
    double v97 = CGRectGetMaxX(*(CGRect *)&v90) - v81;
    if (v85 <= v97) {
      double v95 = v85;
    }
    else {
      double v95 = v97;
    }
    goto LABEL_44;
  }
  int v96 = 1;
  double v80 = v117;
LABEL_44:
  double v98 = v121 - v127;
  if (!v96 || v98 >= v94)
  {
    v146.origin.CGFloat x = v119;
    v146.size.double width = v111;
    v146.origin.CGFloat y = v113;
    v146.size.double height = recta;
    double v99 = CGRectGetMaxY(v146) - v83;
    if (v98 <= v99) {
      double v94 = v121 - v127;
    }
    else {
      double v94 = v99;
    }
  }
  return objc_msgSend(v24, "_zoomToCenter:scale:duration:force:", 1, (v102 * 0.5 + v95 - (v122 - v100)) / v80, (v103 * 0.5 + v94 - (v123 - v101)) / v80, v80, a17);
}

- (void)_zoomToRect:(CGRect)a3 withScale:(double)a4
{
}

- (CGSize)_defaultScrollViewContentSize
{
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "bounds");
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self frame];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double MaxX = CGRectGetMaxX(v17);
  if (MaxX < v4) {
    double MaxX = v4;
  }
  double v12 = round(MaxX);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  if (MaxY < v6) {
    double MaxY = v6;
  }
  double v14 = round(MaxY);
  double v15 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3
{
  double v4 = _UIWebRotateToFrame(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(UIView *)self _scroller];
  [v11 bounds];
  objc_msgSend(v11, "convertRect:toView:", self);
  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v6;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v10;
  CGRect v14 = CGRectUnion(v13, v15);
  -[UIWebDocumentView _flattenAndSwapContentLayersInRect:](self, "_flattenAndSwapContentLayersInRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
}

- (void)webView:(id)a3 addMessageToConsole:(id)a4 withSource:(id)a5
{
  p_messages = &self->_messages;
  all = self->_messages.all;
  if (!all)
  {
    all = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    p_messages->all = all;
  }
  -[NSMutableArray addObject:](all, "addObject:", a4, a4, a5);
  __int16 v9 = objc_msgSend(a4, "_web_messageType");
  char v10 = v9;
  if ((v9 & 0x20) != 0)
  {
    html = p_messages->html;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->html = html;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    html = p_messages->javascript;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->javascript = html;
    }
  }
  else
  {
    if ((v9 & 0x100) == 0) {
      goto LABEL_13;
    }
    html = p_messages->css;
    if (!html)
    {
      html = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->css = html;
    }
  }
  [(NSMutableArray *)html addObject:a4];
LABEL_13:
  if ((v10 & 0x10) != 0)
  {
    error = p_messages->error;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->error = error;
    }
  }
  else if ((v10 & 8) != 0)
  {
    error = p_messages->warning;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->warning = error;
    }
  }
  else if ((v10 & 2) != 0)
  {
    error = p_messages->tip;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->tip = error;
    }
  }
  else
  {
    if ((v10 & 4) == 0) {
      goto LABEL_26;
    }
    error = p_messages->log;
    if (!error)
    {
      error = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      p_messages->log = error;
    }
  }
  [(NSMutableArray *)error addObject:a4];
LABEL_26:
  CGRect v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"UIWebViewDidReceiveMessageNotification" object:self];
}

- (id)messagesMatchingMask:(int)a3
{
  double v3 = 0;
  if (a3 > 995)
  {
    if (a3 > 1007)
    {
      if (a3 == 1008)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.error;
        return p_error->all;
      }
      if (a3 == 1022)
      {
        p_error = &self->_messages;
        return p_error->all;
      }
    }
    else
    {
      if (a3 == 996)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.log;
        return p_error->all;
      }
      if (a3 == 1000)
      {
        p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.warning;
        return p_error->all;
      }
    }
  }
  else if (a3 > 285)
  {
    if (a3 == 286)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.css;
      return p_error->all;
    }
    if (a3 == 994)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.tip;
      return p_error->all;
    }
  }
  else
  {
    if (a3 == 62)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.html;
      return p_error->all;
    }
    if (a3 == 158)
    {
      p_error = ($1CF94A04F8ADBB3673F9BB79AC4F7AE2 *)&self->_messages.javascript;
      return p_error->all;
    }
  }
  return v3;
}

- (void)clearMessagesMatchingMask:(int)a3
{
  p_messages = &self->_messages;
  uint64_t v6 = [(NSMutableArray *)self->_messages.all count];
  int v7 = v6;
  if (a3 == 1022)
  {
    BOOL v8 = v6 != 0;
    [(NSMutableArray *)p_messages->all removeAllObjects];
    goto LABEL_21;
  }
  if ((int)v6 < 1)
  {
    BOOL v8 = 0;
    if ((a3 & 0x20) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    int v9 = 0;
    BOOL v8 = 0;
    do
    {
      if ((objc_msgSend((id)-[NSMutableArray objectAtIndex:](p_messages->all, "objectAtIndex:", v9), "_web_messageType") & a3) != 0)
      {
        [(NSMutableArray *)p_messages->all removeObjectAtIndex:v9];
        --v7;
        BOOL v8 = 1;
      }
      else
      {
        ++v9;
      }
    }
    while (v9 < v7);
    if ((a3 & 0x20) == 0)
    {
LABEL_10:
      if ((a3 & 0x80) != 0) {
        goto LABEL_22;
      }
LABEL_11:
      if ((a3 & 0x100) != 0) {
        goto LABEL_23;
      }
LABEL_12:
      if ((a3 & 0x10) != 0) {
        goto LABEL_24;
      }
LABEL_13:
      if ((a3 & 8) != 0) {
        goto LABEL_25;
      }
LABEL_14:
      if ((a3 & 2) != 0) {
        goto LABEL_26;
      }
LABEL_15:
      if ((a3 & 4) != 0) {
        goto LABEL_27;
      }
      goto LABEL_16;
    }
  }
LABEL_21:
  [(NSMutableArray *)p_messages->html removeAllObjects];
  if ((a3 & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_22:
  [(NSMutableArray *)p_messages->javascript removeAllObjects];
  if ((a3 & 0x100) == 0) {
    goto LABEL_12;
  }
LABEL_23:
  [(NSMutableArray *)p_messages->css removeAllObjects];
  if ((a3 & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_24:
  [(NSMutableArray *)p_messages->error removeAllObjects];
  if ((a3 & 8) == 0) {
    goto LABEL_14;
  }
LABEL_25:
  [(NSMutableArray *)p_messages->warning removeAllObjects];
  if ((a3 & 2) == 0) {
    goto LABEL_15;
  }
LABEL_26:
  [(NSMutableArray *)p_messages->tip removeAllObjects];
  if ((a3 & 4) != 0)
  {
LABEL_27:
    [(NSMutableArray *)p_messages->log removeAllObjects];
    if (!v8) {
      return;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (!v8) {
    return;
  }
LABEL_17:
  char v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"UIWebViewDidClearMessagesNotification" object:self];
}

- (void)_clearAllConsoleMessages
{
}

- (BOOL)_dumpWebArchiveAtPath:(id)a3
{
  if ((WebThreadIsCurrent() & 1) == 0) {
    WebThreadLock();
  }
  if (([a3 hasSuffix:@".webarchive"] & 1) == 0) {
    a3 = (id)[a3 stringByAppendingString:@".webarchive"];
  }
  uint64_t v7 = 0;
  char v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "DOMDocument"), "webArchive"), "data"), "writeToFile:options:error:", a3, 0, &v7);
  if ((v5 & 1) == 0) {
    NSLog(&cfstr_CouldNotArchiv.isa, self, a3, v7);
  }
  return v5;
}

- (void)_clearSelectionAndUI
{
}

- (void)_setSelectedDOMRangeAndUpdateUI:(id)a3
{
  WebThreadLock();
  [(WebView *)self->super._webView setSelectedDOMRange:a3 affinity:1];
  [(UIWebDocumentView *)self selectionChanged];
}

- (void)_startURLificationIfNeededCoalesce:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWebDocumentView *)self _dataDetectionIsActivated])
  {
    WebThreadLock();
    char v5 = (void *)[DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
    uint64_t v6 = [(WebView *)self->super._webView mainFrame];
    unint64_t v7 = [(UIWebDocumentView *)self effectiveDataDetectorTypes];
    if (v3) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    [v5 startURLificationForFrame:v6 detectedTypes:v7 options:v8];
  }
}

- (id)_absoluteUrlRelativeToDocumentURL:(id)a3
{
  WebThreadLock();
  char v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "dataSource"), "request"), "URL"), "absoluteURL");
  if (([a3 hasPrefix:@"#"] & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v5, "absoluteString"), "hasSuffix:", @"/") & 1) == 0)
  {
    char v5 = (void *)[v5 URLByDeletingLastPathComponent];
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:relativeToURL:", a3, v5), "absoluteURL");
  return (id)[v6 standardizedURL];
}

- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView webView:didFirstVisuallyNonEmptyLayoutInFrame:](&v6, sel_webView_didFirstVisuallyNonEmptyLayoutInFrame_, a3);
  if (objc_opt_respondsToSelector()) {
    [self->super._delegate webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:self];
  }
  [(UIWebBrowserView *)self _autoFillFrame:a4];
}

- (BOOL)alwaysDispatchesScrollEvents
{
  return (*((unsigned __int8 *)self + 1608) >> 6) & 1;
}

- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 1608);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 64;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 1608) = v3 & 0xBF | v4;
    -[UIWebTiledView setAllowsPaintingAndScriptsWhilePanning:](self, "setAllowsPaintingAndScriptsWhilePanning:");
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3
{
  -[UIWebDocumentView minimumScaleForMinimumSize:](self, "minimumScaleForMinimumSize:", a3.width, a3.height);
  double v5 = v4;
  [(UIWebDocumentView *)self maximumScale];
  double v7 = v6;
  double v8 = 0.0;
  double v9 = v5;
  result.vaCGFloat r2 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4
{
  double var0 = a4.var0;
  [(UIWebDocumentView *)self zoomedDocumentScale];
  double v7 = var0 / v6;
  [a3 setMinimumZoomScale:v7];
}

- (double)minimumVerticalContentOffset
{
  return 0.0;
}

- (double)heightToKeepVisible
{
  return 0.0;
}

- (double)scaleForProposedNewScale:(double)a3 andOldScale:(double)a4
{
  if (![(UIWebBrowserView *)self _currentAssistedNode] && !self->super._interaction.var0) {
    return a3;
  }
  return a4;
}

- (id)addFindOnPageHighlighter
{
  char v3 = [[UIWebBrowserFindOnPageHighlighter alloc] initWithBrowserView:self];
  activeHighlighters = self->_activeHighlighters;
  if (!activeHighlighters)
  {
    activeHighlighters = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:1];
    self->_activeHighlighters = activeHighlighters;
  }
  [(NSHashTable *)activeHighlighters addObject:v3];
  return v3;
}

- (void)_removeFindOnPageHighlighter:(id)a3
{
}

- (void)redrawScaledDocument
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)UIWebBrowserView;
  [(UIWebDocumentView *)&v12 redrawScaledDocument];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  activeHighlighters = self->_activeHighlighters;
  uint64_t v4 = [(NSHashTable *)activeHighlighters countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(activeHighlighters);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateHighlightBubbleWobble:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)activeHighlighters countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)UIWebBrowserView;
  -[UIWebDocumentView _didMoveFromWindow:toWindow:](&v16, sel__didMoveFromWindow_toWindow_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  overflowScrollViews = self->_overflowScrollViews;
  uint64_t v8 = [(NSMutableSet *)overflowScrollViews countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(overflowScrollViews);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _didMoveFromWindow:a3 toWindow:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)overflowScrollViews countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)webView:(id)a3 didCreateOrUpdateScrollingLayer:(id)a4 withContentsLayer:(id)a5 scrollSize:(id)a6 forNode:(id)a7 allowHorizontalScrollbar:(BOOL)a8 allowVerticalScrollbar:(BOOL)a9
{
  BOOL v9 = a8;
  if (objc_msgSend(a4, "delegate", a3))
  {
    long long v15 = (UIWebOverflowScrollView *)[a4 delegate];
    objc_super v16 = [(UIWebOverflowScrollView *)v15 overflowContentView];
    if ([(UIView *)v16 layer] == a5) {
      goto LABEL_6;
    }
    [(UIWebOverflowContentView *)v16 replaceLayer:a5];
  }
  else
  {
    long long v15 = [[UIWebOverflowScrollView alloc] initWithLayer:a4 node:a7 webBrowserView:self];
    [(UIWebBrowserView *)self _noteOverflowScrollViewPendingInsertion:v15];

    CGRect v17 = [[UIWebOverflowContentView alloc] initWithLayer:a5];
    [(UIWebOverflowScrollView *)v15 setOverflowContentView:v17];
  }
  [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:1];
LABEL_6:
  [(UIScrollView *)v15 setShowsHorizontalScrollIndicator:v9];
  [(UIScrollView *)v15 setShowsVerticalScrollIndicator:a9];
  [a6 sizeValue];
  -[UIScrollView setContentSize:](v15, "setContentSize:");
  uint64_t v18 = [(UIScrollView *)v15 panGestureRecognizer];
  +[UIPanGestureRecognizer _defaultHysteresis];
  double v20 = v19;
  [(UIWebDocumentView *)self _zoomedDocumentScale];
  double v22 = v20 / v21;
  [(UIPanGestureRecognizer *)v18 _setHysteresis:v22];
}

- (void)webView:(id)a3 willRemoveScrollingLayer:(id)a4 withContentsLayer:(id)a5 forNode:(id)a6
{
  uint64_t v8 = objc_msgSend(a5, "delegate", a3);
  if (v8)
  {
    BOOL v9 = v8;
    [v8 willBeRemoved];
    [v9 removeFromSuperview];
  }
  uint64_t v10 = (void *)[a4 delegate];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 willBeRemoved];
    [v11 setBeingRemoved:1];
    [v11 _webCustomViewWillBeRemovedFromSuperview];
    [(UIWebBrowserView *)self _noteOverflowScrollViewPendingDeletion:v11];
    [v11 setBeingRemoved:0];
    [(UIWebBrowserView *)self _removeAdditionalSubview:v11];
    [v11 setNode:0];
  }
  [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:1];
}

- (void)_overflowScrollView:(id)a3 willStartScrollingForNode:(id)a4
{
  [(UITextInteractionAssistant *)self->super._textSelectionAssistant willStartScrollingOrZooming];
  [(UIWebDocumentView *)self cancelInteraction];
  [(UIWebDocumentView *)self _cancelLongPressGestureRecognizer];
}

- (void)_webThreadOverflowScrollOffsetChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_pendingOverflowDataLock lock];
  BOOL pendingGeometryChangeAfterOverflowScroll = self->_pendingGeometryChangeAfterOverflowScroll;
  self->_BOOL pendingGeometryChangeAfterOverflowScroll = 0;
  uint64_t v4 = (void *)[(NSMutableArray *)self->_pendingOverflowScrolls copy];
  [(NSMutableArray *)self->_pendingOverflowScrolls removeAllObjects];
  [(NSLock *)self->_pendingOverflowDataLock unlock];
  if (pendingGeometryChangeAfterOverflowScroll) {
    [(WebView *)self->super._webView _viewGeometryDidChange];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        webView = self->super._webView;
        [v9 offset];
        -[WebView _overflowScrollPositionChangedTo:forNode:isUserScroll:](webView, "_overflowScrollPositionChangedTo:forNode:isUserScroll:", [v9 node], objc_msgSend(v9, "isUserScroll"), v11, v12);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)appendOverflowScrollForNode:(id)a3 offset:(CGPoint)a4 whileScrolling:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  pendingOverflowScrolls = self->_pendingOverflowScrolls;
  if (!pendingOverflowScrolls)
  {
    pendingOverflowScrolls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_pendingOverflowScrolls = pendingOverflowScrolls;
  }
  if ([(NSMutableArray *)pendingOverflowScrolls count]
    && (objc_msgSend((id)-[NSMutableArray lastObject](self->_pendingOverflowScrolls, "lastObject"), "coalesceScrollForNode:offset:isUserScroll:", a3, v5, x, y) & 1) != 0)
  {
    return 0;
  }
  double v12 = -[UIWebOverflowScrollInfo initWithNode:offset:isUserScroll:]([UIWebOverflowScrollInfo alloc], "initWithNode:offset:isUserScroll:", a3, v5, x, y);
  [(NSMutableArray *)self->_pendingOverflowScrolls addObject:v12];

  return 1;
}

- (void)_overflowScrollView:(id)a3 scrollOffsetChangedForNode:(id)a4 whileScrolling:(BOOL)a5
{
  if (a4)
  {
    BOOL v5 = a5;
    pendingOverflowDataLock = self->_pendingOverflowDataLock;
    if (!pendingOverflowDataLock)
    {
      pendingOverflowDataLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      self->_pendingOverflowDataLock = pendingOverflowDataLock;
    }
    [(NSLock *)pendingOverflowDataLock lock];
    BOOL v10 = !self->_pendingGeometryChangeAfterOverflowScroll;
    self->_BOOL pendingGeometryChangeAfterOverflowScroll = 1;
    if (!v5
      || [a3 isTracking]
      && [(UIWebBrowserView *)self isDispatchingTouchEvents]
      || (BOOL v11 = v10, [(UIWebBrowserView *)self alwaysDispatchesScrollEvents]))
    {
      [a3 contentOffset];
      BOOL v12 = -[UIWebBrowserView appendOverflowScrollForNode:offset:whileScrolling:](self, "appendOverflowScrollForNode:offset:whileScrolling:", a4, v5);
      BOOL v11 = v10 || v12;
    }
    [(NSLock *)self->_pendingOverflowDataLock unlock];
    long long v13 = (void *)[(WebView *)self->super._webView _fixedPositionContent];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 hasFixedOrStickyPositionLayers])
    {
      uint64_t v14 = [a3 layer];
      [a3 contentOffset];
      objc_msgSend(v13, "overflowScrollPositionForLayer:changedTo:", v14);
    }
    if (v11) {
      WebThreadRun();
    }
  }
}

uint64_t __82__UIWebBrowserView__overflowScrollView_scrollOffsetChangedForNode_whileScrolling___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _webThreadOverflowScrollOffsetChanged];
}

- (void)_overflowScrollView:(id)a3 didEndScrollingForNode:(id)a4
{
}

- (BOOL)_hasSubviewContainingWebContent:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return [a3 isDescendantOfView:self];
}

- (void)_noteOverflowScrollViewPendingInsertion:(id)a3
{
  overflowScrollViewsPendingInsertion = self->_overflowScrollViewsPendingInsertion;
  if (!overflowScrollViewsPendingInsertion)
  {
    overflowScrollViewsPendingInsertion = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_overflowScrollViewsPendingInsertion = overflowScrollViewsPendingInsertion;
  }
  [(NSMutableSet *)overflowScrollViewsPendingInsertion addObject:a3];
}

- (void)_noteOverflowScrollViewPendingDeletion:(id)a3
{
  if (!self->_overflowScrollViewsPendingDeletion) {
    self->_overflowScrollViewsPendingDeletion = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  BOOL v5 = [[UIWebOverflowScrollViewInfo alloc] initWithScrollView:a3];
  objc_msgSend((id)objc_msgSend(a3, "layer"), "removeFromSuperlayer");
  [(NSMutableSet *)self->_overflowScrollViewsPendingDeletion addObject:v5];
}

- (void)_addAdditionalSubview:(id)a3
{
  overflowScrollViews = self->_overflowScrollViews;
  if (!overflowScrollViews)
  {
    overflowScrollViews = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_overflowScrollViews = overflowScrollViews;
  }
  [(NSMutableSet *)overflowScrollViews addObject:a3];
}

- (void)_removeAdditionalSubview:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_overflowScrollViewsPendingInsertion removeObject:a3];
  [(NSMutableSet *)self->_overflowScrollViews removeObject:a3];
}

- (void)webViewDidCommitCompositingLayerChanges:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)UIWebBrowserView;
  [(UIWebDocumentView *)&v24 webViewDidCommitCompositingLayerChanges:a3];
  overflowScrollViewsPendingInsertion = self->_overflowScrollViewsPendingInsertion;
  if (*(_OWORD *)&self->_overflowScrollViewsPendingInsertion != 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [(NSMutableSet *)overflowScrollViewsPendingInsertion countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(overflowScrollViewsPendingInsertion);
          }
          BOOL v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 fixUpViewAfterInsertion])
          {
            [(UIWebBrowserView *)self _addAdditionalSubview:v10];
            [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:1];
          }
          else
          {
            if (!v7) {
              uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [(NSMutableSet *)v7 addObject:v10];
          }
        }
        uint64_t v6 = [(NSMutableSet *)overflowScrollViewsPendingInsertion countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    self->_overflowScrollViewsPendingInsertion = v7;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    overflowScrollViewsPendingDeletion = self->_overflowScrollViewsPendingDeletion;
    uint64_t v12 = [(NSMutableSet *)overflowScrollViewsPendingDeletion countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(overflowScrollViewsPendingDeletion);
          }
          -[UIView _webCustomViewWasRemovedFromSuperview:]((void *)[*(id *)(*((void *)&v16 + 1) + 8 * j) scrollView], objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "oldSuperview"));
        }
        uint64_t v13 = [(NSMutableSet *)overflowScrollViewsPendingDeletion countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v13);
    }

    self->_overflowScrollViewsPendingDeletion = 0;
  }
}

- (id)_collectAdditionalSubviews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  overflowScrollViewsPendingDeletion = self->_overflowScrollViewsPendingDeletion;
  if (overflowScrollViewsPendingDeletion)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableSet count](overflowScrollViewsPendingDeletion, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = self->_overflowScrollViewsPendingDeletion;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "scrollView"));
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  updateSubviewsOfScrollContentViews(self->super._contentLayersHostingLayer, self, v3, v5);
  return v3;
}

- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  if (objc_opt_respondsToSelector())
  {
    webView = self->super._webView;
    -[WebView _setUnobscuredSafeAreaInsets:](webView, "_setUnobscuredSafeAreaInsets:", top, left, bottom, right);
  }
}

- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder
{
  return 1;
}

- (UIWebFormAccessory)_accessory
{
  return self->_accessory;
}

- (void)set_accessory:(id)a3
{
}

- (UIFormPeripheral)_input
{
  return self->_input;
}

- (void)set_input:(id)a3
{
}

- (DOMNode)_currentAssistedNode
{
  return self->_currentAssistedNode;
}

- (void)set_currentAssistedNode:(id)a3
{
}

- (UIResponder)_editingDelegateForEverythingExceptForms
{
  return self->_editingDelegateForEverythingExceptForms;
}

- (void)set_editingDelegateForEverythingExceptForms:(id)a3
{
  self->_editingDelegateForEverythingExceptForms = (UIResponder *)a3;
}

- (BOOL)isAccessoryEnabled
{
  return *((unsigned char *)self + 1608) & 1;
}

- (void)setAccessoryEnabled:(BOOL)a3
{
  *((unsigned char *)self + 1608) = *((unsigned char *)self + 1608) & 0xFE | a3;
}

- (BOOL)inputViewObeysDOMFocus
{
  return (*((unsigned __int8 *)self + 1608) >> 3) & 1;
}

- (void)setInputViewObeysDOMFocus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 1608) = *((unsigned char *)self + 1608) & 0xF7 | v3;
}

- (BOOL)allowDOMFocusRedirects
{
  return (*((unsigned __int8 *)self + 1608) >> 4) & 1;
}

- (void)setAllowDOMFocusRedirects:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 1608) = *((unsigned char *)self + 1608) & 0xEF | v3;
}

- (BOOL)hasEditedTextField
{
  return (*((unsigned __int8 *)self + 1608) >> 5) & 1;
}

- (UIWebAutoFillDelegate)autoFillDelegate
{
  return self->_autoFillDelegate;
}

- (void)setAutoFillDelegate:(id)a3
{
  self->_autoFillDelegate = (UIWebAutoFillDelegate *)a3;
}

- (BOOL)isAnyTouchOverActiveArea:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(WebView *)self->super._webView _touchEventRegions];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) locationInView:0];
          -[UIWebBrowserView _convertWindowPointToViewport:](self, "_convertWindowPointToViewport:");
          double v11 = v10;
          double v13 = v12;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v14 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v20;
            while (2)
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v5);
                }
                if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "hitTest:", v11, v13))
                {
                  LOBYTE(v6) = 1;
                  return v6;
                }
                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
        LOBYTE(v6) = 0;
      }
      while (v7);
    }
  }
  return v6;
}

@end