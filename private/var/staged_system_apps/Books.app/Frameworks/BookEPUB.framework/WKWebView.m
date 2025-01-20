@interface WKWebView
- (BENavigationHandler)be_navigationHandler;
- (BEUIHandler)be_uiHandler;
- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate;
- (BOOL)be_hasCompletedLoad;
- (BOOL)be_hasPendingOperations;
- (BOOL)be_hasSelectablePositionAtPoint:(CGPoint)a3;
- (BOOL)be_hasSelection;
- (BOOL)be_isFontRegistered:(id)a3;
- (BOOL)be_isHorizontalScroll;
- (BOOL)be_paginationBehavesLikeColumns;
- (BOOL)be_paginationLineGridEnabled;
- (BOOL)be_requiresReload;
- (CGPoint)be_convertPointFromContentsToView:(CGPoint)a3;
- (NSArray)be_fontFamiliesHavingFailedRegistration;
- (NSArray)be_selectionRects;
- (NSArray)be_webSelectionRects;
- (NSString)be_configurationKey;
- (NSString)be_identifier;
- (NSString)be_logDescription;
- (NSString)be_selectedText;
- (NSValue)be_estimatedContentSizeValue;
- (NSValue)be_requestedContentOffset;
- (UITextInteractionDelegatePrivate)be_textInteractionDelegate;
- (UIWKInteractionViewProtocol)be_textInputChild;
- (WKUserContentController)be_userContentController;
- (double)be_gapBetweenPages;
- (double)be_gutterLength;
- (double)be_pageLength;
- (double)be_scale;
- (double)be_scrollingPageHeight;
- (double)be_scrollingPageWidth;
- (double)be_textZoomFactor;
- (double)be_viewScale;
- (id)_be_contentViewStateDescriptionForState:(int)a3;
- (id)_be_failedFontFamilies;
- (id)be_requestedContentOffsetShouldBypassJS;
- (id)be_updateAXValueForMessage:(id)a3;
- (id)be_viewForFindUI;
- (int)be_contentViewState;
- (int64_t)be_paginationMode;
- (unint64_t)be_appliedContentBlockingRule;
- (unint64_t)be_imageFilterMode;
- (unint64_t)be_pageCount;
- (void)_invalidStateTransition:(id)a3;
- (void)be_applyRequestedContentOffset;
- (void)be_clearRegisteredFonts;
- (void)be_clearSelection;
- (void)be_completedLoad;
- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4;
- (void)be_discardingContentView;
- (void)be_doAfterNextPresentationUpdate:(id)a3;
- (void)be_doAfterNextStablePresentationUpdate:(id)a3;
- (void)be_evaluateJavaScript:(id)a3 afterNextPresentationUpdate:(BOOL)a4 completion:(id)a5;
- (void)be_evaluateJavaScript:(id)a3 completion:(id)a4;
- (void)be_failedLoad;
- (void)be_fontFamilyFailedToRegister:(id)a3;
- (void)be_fontFamilySuccessfullyRegistered:(id)a3;
- (void)be_fontRegistrationCompleted:(BOOL)a3;
- (void)be_paginationOperationCanceled;
- (void)be_prepareForLoad;
- (void)be_prepareForReload;
- (void)be_preparingForReuse;
- (void)be_processingContentViewForHost;
- (void)be_resumeAllMediaPlayback;
- (void)be_returningContentViewToPool;
- (void)be_selectForWebView:(id)a3;
- (void)be_setContentOffset:(CGPoint)a3;
- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4;
- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4 completion:(id)a5;
- (void)be_setContentOffset:(CGPoint)a3 completion:(id)a4;
- (void)be_suspendAllMediaPlayback;
- (void)be_takeSnapshotWithDefaultConfigurationCompletion:(id)a3;
- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4;
- (void)be_willAttemptFontRegistration;
- (void)be_willAttemptLoad:(id)a3;
- (void)be_willFullyConfigure;
- (void)be_willLoadAboutBlank;
- (void)be_willProcessDeferredFontRegistration;
- (void)be_willSkipLoad;
- (void)setBe_appliedContentBlockingRule:(unint64_t)a3;
- (void)setBe_configurationKey:(id)a3;
- (void)setBe_contentViewState:(int)a3;
- (void)setBe_estimatedContentSizeValue:(id)a3;
- (void)setBe_gutterLength:(double)a3;
- (void)setBe_hasCompletedLoad:(BOOL)a3;
- (void)setBe_hasPendingOperations:(BOOL)a3;
- (void)setBe_identifier:(id)a3;
- (void)setBe_isHorizontalScroll:(BOOL)a3;
- (void)setBe_navigationHandler:(id)a3;
- (void)setBe_paginationMode:(int64_t)a3;
- (void)setBe_requestedContentOffset:(id)a3;
- (void)setBe_requestedContentOffsetShouldBypassJS:(id)a3;
- (void)setBe_requiresReload:(BOOL)a3;
- (void)setBe_textInteractionAssistantDelegate:(id)a3;
- (void)setBe_textInteractionDelegate:(id)a3;
- (void)setBe_textZoomFactor:(double)a3;
- (void)setBe_uiHandler:(id)a3;
- (void)setBe_userContentController:(id)a3;
- (void)setBe_viewScale:(double)a3;
@end

@implementation WKWebView

- (unint64_t)be_imageFilterMode
{
  return 0;
}

- (id)_be_contentViewStateDescriptionForState:(int)a3
{
  if (a3 > 0xE) {
    return @"unknown";
  }
  else {
    return off_3C0E20[a3];
  }
}

- (void)setBe_contentViewState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(WKWebView *)self be_contentViewState];
  v6 = _BookEPUBLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(WKWebView *)self be_identifier];
    v8 = [(WKWebView *)self _be_contentViewStateDescriptionForState:v5];
    v9 = [(WKWebView *)self _be_contentViewStateDescriptionForState:v3];
    v10 = [(WKWebView *)self URL];
    int v12 = 138544386;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v9;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_DEFAULT, "Transitioning webView:%{public}@ #webViewState from:%{public}@ to:%{public}@ for url:%{mask.hash}@", (uint8_t *)&v12, 0x34u);
  }
  v11 = +[NSNumber numberWithUnsignedInt:v3];
  objc_setAssociatedObject(self, "be_contentViewState", v11, (char *)&def_7BFC0 + 1);
}

- (int)be_contentViewState
{
  v2 = objc_getAssociatedObject(self, "be_contentViewState");
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void)_invalidStateTransition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WKWebView *)self be_contentViewState];
  v6 = _BookEPUBLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = [(WKWebView *)self be_identifier];
    v8 = [(WKWebView *)self _be_contentViewStateDescriptionForState:v5];
    int v9 = 138543874;
    v10 = v7;
    __int16 v11 = 2114;
    int v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_ERROR, "Error Transitioning webView:%{public}@ #webViewState from:%{public}@ in Method:%{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)be_willAttemptFontRegistration
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 > 0xB || ((1 << v3) & 0x991) == 0) {
    [(WKWebView *)self _invalidStateTransition:@"be_willAttemptFontRegistration"];
  }

  [(WKWebView *)self setBe_contentViewState:5];
}

- (void)be_fontRegistrationCompleted:(BOOL)a3
{
  if (([(WKWebView *)self be_contentViewState] & 0xFFFFFFFE) != 4) {
    [(WKWebView *)self _invalidStateTransition:@"be_fontRegistrationCompleted"];
  }

  [(WKWebView *)self setBe_contentViewState:6];
}

- (void)be_willSkipLoad
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 > 0xD || ((1 << v3) & 0x2840) == 0) {
    [(WKWebView *)self _invalidStateTransition:@"be_willSkipLoad"];
  }

  [(WKWebView *)self setBe_contentViewState:10];
}

- (void)be_willAttemptLoad:(id)a3
{
  id v4 = a3;
  if ([(WKWebView *)self be_contentViewState] == 8)
  {
    uint64_t v5 = _BookEPUBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(WKWebView *)self be_identifier];
      int v7 = 138543618;
      v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&def_7BFC0, v5, OS_LOG_TYPE_INFO, "#webViewState webView:%{public}@ attempting load of:%{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [(WKWebView *)self _invalidStateTransition:@"be_willAttemptLoad"];
  }
  [(WKWebView *)self setBe_contentViewState:9];
}

- (void)be_completedLoad
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState] - 2;
  if (v3 < 9 && ((0x183u >> v3) & 1) != 0)
  {
    uint64_t v4 = dword_32ACA0[v3];
  }
  else
  {
    [(WKWebView *)self _invalidStateTransition:@"be_completedLoad"];
    uint64_t v4 = 11;
  }

  [(WKWebView *)self setBe_contentViewState:v4];
}

- (void)be_paginationOperationCanceled
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 > 0xE) {
    goto LABEL_6;
  }
  if (((1 << v3) & 0x40EE) != 0) {
    return;
  }
  if (((1 << v3) & 0x3C00) == 0)
  {
    if (v3 == 9)
    {
      [(WKWebView *)self stopLoading];
      goto LABEL_7;
    }
LABEL_6:
    [(WKWebView *)self _invalidStateTransition:@"be_paginationOperationCanceled"];
  }
LABEL_7:

  [(WKWebView *)self setBe_contentViewState:13];
}

- (void)be_failedLoad
{
  if (([(WKWebView *)self be_contentViewState] | 4) == 0xD)
  {
    [(WKWebView *)self setBe_contentViewState:12];
  }
  else
  {
    [(WKWebView *)self _invalidStateTransition:@"be_failedLoad"];
  }
}

- (void)be_preparingForReuse
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 - 8 >= 6 && v3 != 6) {
    [(WKWebView *)self _invalidStateTransition:@"be_preparingForReuse"];
  }

  [(WKWebView *)self setBe_contentViewState:1];
}

- (void)be_willLoadAboutBlank
{
  if ([(WKWebView *)self be_contentViewState] != 1) {
    [(WKWebView *)self _invalidStateTransition:@"be_willLoadAboutBlank"];
  }

  [(WKWebView *)self setBe_contentViewState:2];
}

- (void)be_processingContentViewForHost
{
  if ([(WKWebView *)self be_contentViewState] != 3) {
    [(WKWebView *)self _invalidStateTransition:@"be_processingContentViewForHost"];
  }

  [(WKWebView *)self setBe_contentViewState:4];
}

- (void)be_returningContentViewToPool
{
  if ([(WKWebView *)self be_contentViewState] != 3)
  {
    [(WKWebView *)self _invalidStateTransition:@"be_returningContentViewToPool"];
  }
}

- (void)be_discardingContentView
{
  if ([(WKWebView *)self be_contentViewState] != 3) {
    [(WKWebView *)self _invalidStateTransition:@"be_discardingContentView"];
  }

  [(WKWebView *)self setBe_contentViewState:14];
}

- (void)be_prepareForLoad
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 > 0xD || ((1 << v3) & 0x3940) == 0) {
    [(WKWebView *)self _invalidStateTransition:@"be_prepareForLoad"];
  }

  [(WKWebView *)self setBe_contentViewState:8];
}

- (void)be_prepareForReload
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 > 0xB || ((1 << v3) & 0xB40) == 0) {
    [(WKWebView *)self _invalidStateTransition:@"be_prepareForLoad"];
  }

  [(WKWebView *)self setBe_contentViewState:8];
}

- (void)be_willFullyConfigure
{
  unsigned int v3 = [(WKWebView *)self be_contentViewState];
  if (v3 - 10 >= 4)
  {
    if (v3 == 5) {
      return;
    }
    if (v3 != 6) {
      [(WKWebView *)self _invalidStateTransition:@"be_willFullyConfigure"];
    }
  }

  [(WKWebView *)self setBe_contentViewState:7];
}

- (void)be_willProcessDeferredFontRegistration
{
  if (([(WKWebView *)self be_contentViewState] & 0xFFFFFFFE) != 6) {
    [(WKWebView *)self _invalidStateTransition:@"be_willProcessDeferredFontRegistration"];
  }

  [(WKWebView *)self setBe_contentViewState:7];
}

- (void)setBe_identifier:(id)a3
{
}

- (NSString)be_identifier
{
  return (NSString *)objc_getAssociatedObject(self, "be_identifier");
}

- (void)setBe_textZoomFactor:(double)a3
{
}

- (double)be_textZoomFactor
{
  [(WKWebView *)self _textZoomFactor];
  return result;
}

- (void)setBe_paginationMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    a3 = 0;
  }
  [(WKWebView *)self _setPaginationMode:a3];
}

- (int64_t)be_paginationMode
{
  int64_t result = (int64_t)[(WKWebView *)self _paginationMode];
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (double)be_pageLength
{
  [(WKWebView *)self _pageLength];
  return result;
}

- (unint64_t)be_pageCount
{
  return (unint64_t)[(WKWebView *)self _pageCount];
}

- (double)be_gapBetweenPages
{
  [(WKWebView *)self _gapBetweenPages];
  return result;
}

- (BOOL)be_paginationBehavesLikeColumns
{
  return [(WKWebView *)self _paginationBehavesLikeColumns];
}

- (BOOL)be_paginationLineGridEnabled
{
  return [(WKWebView *)self _paginationLineGridEnabled];
}

- (void)setBe_viewScale:(double)a3
{
}

- (double)be_viewScale
{
  [(WKWebView *)self _viewScale];
  return result;
}

- (id)be_viewForFindUI
{
  return [(WKWebView *)self _viewForFindUI];
}

- (void)be_suspendAllMediaPlayback
{
}

- (void)be_resumeAllMediaPlayback
{
}

- (void)be_doAfterNextPresentationUpdate:(id)a3
{
}

- (void)be_doAfterNextStablePresentationUpdate:(id)a3
{
}

- (CGPoint)be_convertPointFromContentsToView:(CGPoint)a3
{
  -[WKWebView _convertPointFromContentsToView:](self, "_convertPointFromContentsToView:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setBe_navigationHandler:(id)a3
{
}

- (BENavigationHandler)be_navigationHandler
{
  return (BENavigationHandler *)objc_getAssociatedObject(self, "be_navigationHandler");
}

- (void)setBe_userContentController:(id)a3
{
}

- (WKUserContentController)be_userContentController
{
  return (WKUserContentController *)objc_getAssociatedObject(self, "be_userContentController");
}

- (void)setBe_gutterLength:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:a3];
  objc_setAssociatedObject(self, "be_gutterLength", v4, (char *)&def_7BFC0 + 1);
}

- (double)be_gutterLength
{
  v2 = objc_getAssociatedObject(self, "be_gutterLength");
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setBe_isHorizontalScroll:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "be_isHorizontalScroll", v4, (char *)&def_7BFC0 + 1);
}

- (BOOL)be_isHorizontalScroll
{
  v2 = objc_getAssociatedObject(self, "be_isHorizontalScroll");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBe_uiHandler:(id)a3
{
}

- (BEUIHandler)be_uiHandler
{
  return (BEUIHandler *)objc_getAssociatedObject(self, "be_uiHandler");
}

- (void)setBe_appliedContentBlockingRule:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, "be_appliedContentBlockingRule", v4, (char *)&def_7BFC0 + 1);
}

- (unint64_t)be_appliedContentBlockingRule
{
  v2 = objc_getAssociatedObject(self, "be_appliedContentBlockingRule");
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (double)be_scrollingPageWidth
{
  unint64_t v3 = (unint64_t)[(WKWebView *)self _paginationMode];
  if (v3 > 4) {
    return 0.0;
  }
  if (((1 << v3) & 0x19) != 0)
  {
    [(WKWebView *)self bounds];
    return CGRectGetWidth(*(CGRect *)&v4);
  }
  else
  {
    [(WKWebView *)self _pageLength];
  }
  return result;
}

- (double)be_scrollingPageHeight
{
  unint64_t v3 = (char *)[(WKWebView *)self _paginationMode];
  if ((unint64_t)v3 >= 3)
  {
    if ((unint64_t)(v3 - 3) > 1)
    {
      return 0.0;
    }
    else
    {
      [(WKWebView *)self _pageLength];
    }
  }
  else
  {
    [(WKWebView *)self bounds];
    return CGRectGetHeight(*(CGRect *)&v4);
  }
  return result;
}

- (double)be_scale
{
  objc_opt_class();
  v2 = BUDynamicCast();
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 be_initialScale];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (NSString)be_logDescription
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  __int16 v18 = NSStringFromClass(v3);
  double v4 = [(WKWebView *)self be_identifier];
  uint64_t v19 = [(WKWebView *)self URL];
  double v5 = [v19 absoluteString];
  v6 = [(WKWebView *)self scrollView];
  [v6 contentOffset];
  v21[0] = v7;
  v21[1] = v8;
  __int16 v9 = +[NSValue valueWithBytes:v21 objCType:"{CGPoint=dd}"];
  id v10 = [(WKWebView *)self be_requestedContentOffset];
  __int16 v11 = [(WKWebView *)self scrollView];
  [v11 contentSize];
  v20[0] = v12;
  v20[1] = v13;
  id v14 = +[NSValue valueWithBytes:v20 objCType:"{CGSize=dd}"];
  v15 = [(WKWebView *)self be_estimatedContentSizeValue];
  __int16 v16 = +[NSString stringWithFormat:@"<%@: %@> url: %@\n\tcontentOffset: %@ requestedOffset: %@\n\tcontentSize: %@ estimatedSize: %@", v18, v4, v5, v9, v10, v14, v15];

  return (NSString *)v16;
}

- (BOOL)be_hasPendingOperations
{
  v2 = objc_getAssociatedObject(self, "be_hasPendingOperations");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBe_hasPendingOperations:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = NSStringFromSelector("be_hasPendingOperations");
  [(WKWebView *)self willChangeValueForKey:v5];

  v6 = +[NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, "be_hasPendingOperations", v6, (char *)&def_7BFC0 + 1);

  NSStringFromSelector("be_hasPendingOperations");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(WKWebView *)self didChangeValueForKey:v7];
}

- (NSString)be_configurationKey
{
  return (NSString *)objc_getAssociatedObject(self, "be_configurationKey");
}

- (void)setBe_configurationKey:(id)a3
{
}

- (NSValue)be_estimatedContentSizeValue
{
  return (NSValue *)objc_getAssociatedObject(self, "be_estimatedContentSizeValue");
}

- (void)setBe_estimatedContentSizeValue:(id)a3
{
}

- (NSValue)be_requestedContentOffset
{
  return (NSValue *)objc_getAssociatedObject(self, "be_requestedContentOffset");
}

- (void)setBe_requestedContentOffset:(id)a3
{
}

- (id)be_requestedContentOffsetShouldBypassJS
{
  return objc_getAssociatedObject(self, "be_requestedContentOffsetShouldBypassJS");
}

- (void)setBe_requestedContentOffsetShouldBypassJS:(id)a3
{
}

- (void)be_setContentOffset:(CGPoint)a3
{
}

- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4
{
}

- (void)be_setContentOffset:(CGPoint)a3 completion:(id)a4
{
}

- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  *(double *)v26 = x;
  *(double *)&v26[1] = y;
  id v10 = +[NSValue valueWithBytes:v26 objCType:"{CGPoint=dd}"];
  [(WKWebView *)self setBe_requestedContentOffset:v10];

  __int16 v11 = +[NSNumber numberWithBool:v5];
  [(WKWebView *)self setBe_requestedContentOffsetShouldBypassJS:v11];

  uint64_t v12 = [(WKWebView *)self scrollView];
  -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", v12, x, y);
  -[WKWebView _convertPointFromViewToContents:](self, "_convertPointFromViewToContents:");
  double v14 = v13;
  double v16 = v15;

  v17 = [(WKWebView *)self scrollView];
  [v17 setContentOffset:CGPointMake(x, y)];

  if (v5)
  {
    id v18 = objc_retainBlock(v9);
    uint64_t v19 = v18;
    if (v18) {
      (*((void (**)(id))v18 + 2))(v18);
    }
  }
  else
  {
    __int16 v20 = +[NSNumber numberWithDouble:v14];
    v21 = +[NSNumber numberWithDouble:v16];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"window.scrollTo(%@, %@);",
      v20,
    uint64_t v19 = v21);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_240DC;
    v22[3] = &unk_3C0D88;
    v22[4] = self;
    double v24 = x;
    double v25 = y;
    id v23 = v9;
    [(WKWebView *)self evaluateJavaScript:v19 completionHandler:v22];
  }
}

- (void)be_applyRequestedContentOffset
{
  BOOL v3 = [(WKWebView *)self be_requestedContentOffset];
  double v4 = [(WKWebView *)self be_requestedContentOffsetShouldBypassJS];
  id v5 = [v4 BOOLValue];

  if (v3)
  {
    [v3 CGPointValue];
    double v7 = v6;
    double v9 = v8;
    CGFloat y = CGPointZero.y;
    __int16 v11 = [(WKWebView *)self scrollView];
    [v11 contentSize];
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v28.origin.double x = CGPointZero.x;
    v28.origin.CGFloat y = y;
    v28.size.width = v13;
    v28.size.height = v15;
    v27.double x = v7;
    v27.CGFloat y = v9;
    if (CGRectContainsPoint(v28, v27))
    {
      -[WKWebView be_setContentOffset:bypassingJS:](self, "be_setContentOffset:bypassingJS:", v5, v7, v9);
      [(WKWebView *)self setBe_requestedContentOffset:0];
      [(WKWebView *)self setBe_requestedContentOffsetShouldBypassJS:0];
    }
    else
    {
      double v16 = _BookEPUBLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [(WKWebView *)self be_identifier];
        v29.origin.double x = CGPointZero.x;
        v29.origin.CGFloat y = y;
        v29.size.width = v13;
        v29.size.height = v15;
        id v18 = NSStringFromCGRect(v29);
        v26.double x = v7;
        v26.CGFloat y = v9;
        uint64_t v19 = NSStringFromCGPoint(v26);
        int v20 = 138543874;
        v21 = v17;
        __int16 v22 = 2114;
        id v23 = v18;
        __int16 v24 = 2114;
        double v25 = v19;
        _os_log_impl(&def_7BFC0, v16, OS_LOG_TYPE_ERROR, "be_applyRequestedContentOffset - contentSizeRect: WebView: %{public}@ %{public}@ does not contain %{public}@.  Skipping..", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (BOOL)be_hasCompletedLoad
{
  v2 = objc_getAssociatedObject(self, "be_hasCompletedLoad");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBe_hasCompletedLoad:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSStringFromSelector("be_hasCompletedLoad");
  [(WKWebView *)self willChangeValueForKey:v5];

  double v6 = +[NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, "be_hasCompletedLoad", v6, (char *)&def_7BFC0 + 1);

  NSStringFromSelector("be_hasCompletedLoad");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(WKWebView *)self didChangeValueForKey:v7];
}

- (BOOL)be_requiresReload
{
  v2 = objc_getAssociatedObject(self, "be_requiresReload");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBe_requiresReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSStringFromSelector("be_requiresReload");
  [(WKWebView *)self willChangeValueForKey:v5];

  double v6 = +[NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, "be_requiresReload", v6, (char *)&def_7BFC0 + 1);

  NSStringFromSelector("be_requiresReload");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(WKWebView *)self didChangeValueForKey:v7];
}

- (NSArray)be_fontFamiliesHavingFailedRegistration
{
  v2 = [(WKWebView *)self _be_failedFontFamilies];
  BOOL v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)_be_failedFontFamilies
{
  objc_getAssociatedObject(self, "_be_failedFontFamilies");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    objc_setAssociatedObject(self, "_be_failedFontFamilies", v3, (char *)&def_7BFC0 + 1);
  }

  return v3;
}

- (void)be_fontFamilyFailedToRegister:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  double v6 = _BookEPUBLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister #staleCache failing '%@'", (uint8_t *)&v10, 0xCu);
    }

    double v8 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
    [(WKWebView *)self willChangeValueForKey:v8];

    double v9 = [(WKWebView *)self _be_failedFontFamilies];
    [v9 addObject:v4];

    double v6 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
    [(WKWebView *)self didChangeValueForKey:v6];
  }
  else if (v7)
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister: #staleCache Attempt to mark fontFamily '%@' as failed!", (uint8_t *)&v10, 0xCu);
  }
}

- (void)be_fontFamilySuccessfullyRegistered:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(WKWebView *)self _be_failedFontFamilies];
    unsigned int v6 = [v5 containsObject:v4];

    if (v6)
    {
      BOOL v7 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
      [(WKWebView *)self willChangeValueForKey:v7];

      double v8 = [(WKWebView *)self _be_failedFontFamilies];
      [v8 removeObject:v4];

      double v9 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
      [(WKWebView *)self didChangeValueForKey:v9];
    }
  }
  else
  {
    int v10 = _BookEPUBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&def_7BFC0, v10, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister: Attempt to mark fontFamily '%@' as failed!", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)be_isFontRegistered:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();
  unsigned __int8 v5 = [v4 be_isFontRegistered:v3];

  return v5;
}

- (void)be_clearRegisteredFonts
{
  objc_opt_class();
  BUDynamicCast();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 be_clearRegisteredFonts];
}

- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 be_configureFontWithStyleManager:v6 completion:v5];
}

- (void)setBe_textInteractionDelegate:(id)a3
{
}

- (UITextInteractionDelegatePrivate)be_textInteractionDelegate
{
  return (UITextInteractionDelegatePrivate *)BEGetWeakAssociatedObject(self, "be_textInteractionDelegate");
}

- (void)setBe_textInteractionAssistantDelegate:(id)a3
{
}

- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate
{
  return (BEUIWKTextInteractionAssistantDelegate *)BEGetWeakAssociatedObject(self, "be_textInteractionAssistantDelegate");
}

- (NSString)be_selectedText
{
  if ([(WKWebView *)self be_hasSelection])
  {
    id v3 = [(WKWebView *)self be_textInputChild];
    id v4 = [v3 selectedText];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)be_clearSelection
{
  id v2 = [(WKWebView *)self be_textInputChild];
  [v2 clearSelection];
}

- (BOOL)be_hasSelection
{
  id v2 = [(WKWebView *)self be_webSelectionRects];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)be_webSelectionRects
{
  id v2 = [(WKWebView *)self be_textInputChild];
  BOOL v3 = [v2 webSelectionRects];

  return (NSArray *)v3;
}

- (NSArray)be_selectionRects
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(WKWebView *)self be_webSelectionRects];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) rect];
        double v9 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  if (![v3 count])
  {

    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)be_selectForWebView:(id)a3
{
  id v4 = a3;
  id v5 = [(WKWebView *)self be_textInputChild];
  [v5 selectForWebView:0];
  id v6 = [v5 interactionAssistant];
  uint64_t v7 = [v6 selectionView];
  [v7 showSelectionCommandsAfterDelay:0.2];

  if (v4)
  {
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_24E80;
    block[3] = &unk_3C0DB0;
    id v10 = v4;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)be_hasSelectablePositionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(WKWebView *)self be_textInputChild];
  unsigned __int8 v6 = [v5 hasSelectablePositionAtPoint:x, y];

  return v6;
}

- (UIWKInteractionViewProtocol)be_textInputChild
{
  id v3 = objc_getAssociatedObject(self, "be_textInputChild");
  if (!v3)
  {
    id v4 = self;
    id v5 = [objc_alloc((Class)NSMutableArray) initWithObjects:v4, 0];
    if ([v5 count])
    {
      while (1)
      {
        id v3 = [v5 firstObject];
        if ([v3 conformsToProtocol:&OBJC_PROTOCOL___UIWKInteractionViewProtocol])
        {
          if ([v3 conformsToProtocol:&OBJC_PROTOCOL___UITextInputPrivate]) {
            break;
          }
        }
        [v5 removeObjectAtIndex:0];
        unsigned __int8 v6 = [v3 subviews];
        [v5 addObjectsFromArray:v6];

        if (![v5 count]) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      id v3 = 0;
    }

    objc_setAssociatedObject(v4, "be_textInputChild", v3, (char *)&def_7BFC0 + 1);
  }

  return (UIWKInteractionViewProtocol *)v3;
}

- (void)be_takeSnapshotWithDefaultConfigurationCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)WKSnapshotConfiguration);
  [(WKWebView *)self takeSnapshotWithConfiguration:v5 completionHandler:v4];
}

- (void)be_evaluateJavaScript:(id)a3 completion:(id)a4
{
}

- (void)be_evaluateJavaScript:(id)a3 afterNextPresentationUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_251E0;
  v16[3] = &unk_3C0E00;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  v16[4] = self;
  long long v12 = objc_retainBlock(v16);
  long long v13 = v12;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_25620;
    v14[3] = &unk_3C0DB0;
    CGFloat v15 = v12;
    [(WKWebView *)self _doAfterNextPresentationUpdateWithoutWaitingForPainting:v14];
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 be_updateAXCurrentReadingStateWithMessage:v6 forValue:v5];
}

- (id)be_updateAXValueForMessage:(id)a3
{
  v8[0] = @"BEWebProcessPluginIdentifierParameterKey";
  id v4 = a3;
  id v5 = [(WKWebView *)self be_identifier];
  v8[1] = @"BEWebProcessPluginMessageParameterKey";
  v9[0] = v5;
  v9[1] = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

@end