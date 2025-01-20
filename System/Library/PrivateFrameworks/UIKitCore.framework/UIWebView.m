@interface UIWebView
+ (id)_relativePathFromAbsolutePath:(id)a3 removingPathComponents:(unint64_t)a4;
+ (void)_fixPathsForSandboxDirectoryChange;
+ (void)_updatePersistentStoragePaths;
+ (void)initialize;
- (BOOL)_allowsPictureInPictureVideo;
- (BOOL)_alwaysConstrainsScale;
- (BOOL)_alwaysDispatchesScrollEvents;
- (BOOL)_appliesExclusiveTouchToSubviewTree;
- (BOOL)_effectiveAppearanceIsDark;
- (BOOL)_effectiveTraitsUseElevatedUserInterfaceLevel;
- (BOOL)_paginationBehavesLikeColumns;
- (BOOL)_shouldUseViewForSceneDraggingBehavior;
- (BOOL)_webView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4;
- (BOOL)allowsInlineMediaPlayback;
- (BOOL)allowsLinkPreview;
- (BOOL)allowsPictureInPictureMediaPlayback;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)detectsPhoneNumbers;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isLoading;
- (BOOL)keyboardDisplayRequiresUserAction;
- (BOOL)mediaPlaybackAllowsAirPlay;
- (BOOL)mediaPlaybackRequiresUserAction;
- (BOOL)scalesPageToFit;
- (BOOL)suppressesIncrementalRendering;
- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6;
- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (CGFloat)gapBetweenPages;
- (CGFloat)pageLength;
- (CGImage)newSnapshotWithRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script;
- (NSUInteger)pageCount;
- (NSURLRequest)request;
- (UIDataDetectorTypes)dataDetectorTypes;
- (UIScrollView)scrollView;
- (UIWebPaginationBreakingMode)paginationBreakingMode;
- (UIWebPaginationMode)paginationMode;
- (UIWebView)initWithCoder:(id)a3;
- (UIWebView)initWithFrame:(CGRect)a3;
- (id)_browserView;
- (id)_documentView;
- (id)_initWithFrame:(CGRect)a3 enableReachability:(BOOL)a4;
- (id)_initWithWebView:(id)a3;
- (id)_networkInterfaceName;
- (id)_pdfViewHandler;
- (id)_scrollView;
- (id)_webView:(id)a3 presentationRectsForPreview:(id)a4;
- (id)_webView:(id)a3 presentationSnapshotForPreview:(id)a4;
- (id)_webView:(id)a3 previewViewControllerForURL:(id)a4;
- (id)delegate;
- (id)viewForZoomingInScrollView:(id)a3;
- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7;
- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5;
- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5;
- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6;
- (unint64_t)_audioSessionCategoryOverride;
- (void)_addShortcut:(id)a3;
- (void)_beginRotation;
- (void)_define:(id)a3;
- (void)_didCompleteScrolling;
- (void)_didRotate:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_finishRotation;
- (void)_frameOrBoundsChanged;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_reportError:(id)a3;
- (void)_rescaleDocument;
- (void)_setAllowsPictureInPictureVideo:(BOOL)a3;
- (void)_setAlwaysConstrainsScale:(BOOL)a3;
- (void)_setAlwaysDispatchesScrollEvents:(BOOL)a3;
- (void)_setAudioSessionCategoryOverride:(unint64_t)a3;
- (void)_setDrawInWebThread:(BOOL)a3;
- (void)_setDrawsCheckeredPattern:(BOOL)a3;
- (void)_setNetworkInterfaceName:(id)a3;
- (void)_setOverridesOrientationChangeEventHandling:(BOOL)a3;
- (void)_setPaginationBehavesLikeColumns:(BOOL)a3;
- (void)_setRichTextReaderViewportSettings;
- (void)_setScalesPageToFitViewportSettings;
- (void)_setSelectionEnabled:(BOOL)a3;
- (void)_share:(id)a3;
- (void)_translate:(id)a3;
- (void)_updateBrowserViewExposedScrollViewRect;
- (void)_updateCheckeredPattern;
- (void)_updateOpaqueAndBackgroundColor;
- (void)_updateRequest;
- (void)_updateScrollViewInsetAdjustmentBehavior;
- (void)_updateScrollerViewForInputView:(id)a3;
- (void)_updateViewSettings;
- (void)_webView:(id)a3 commitPreview:(id)a4;
- (void)_webView:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4;
- (void)_webView:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5;
- (void)_webView:(id)a3 willPresentPreview:(id)a4;
- (void)_webViewCommonInitWithWebView:(id)a3 scalesPageToFit:(BOOL)a4;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)goBack;
- (void)goForward;
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;
- (void)loadRequest:(NSURLRequest *)request;
- (void)reload;
- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4;
- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWasRemoved:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback;
- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview;
- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes;
- (void)setDelegate:(id)delegate;
- (void)setDetectsPhoneNumbers:(BOOL)detectsPhoneNumbers;
- (void)setFrame:(CGRect)a3;
- (void)setGapBetweenPages:(CGFloat)gapBetweenPages;
- (void)setKeyboardDisplayRequiresUserAction:(BOOL)keyboardDisplayRequiresUserAction;
- (void)setMediaPlaybackAllowsAirPlay:(BOOL)mediaPlaybackAllowsAirPlay;
- (void)setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction;
- (void)setOpaque:(BOOL)a3;
- (void)setPageLength:(CGFloat)pageLength;
- (void)setPaginationBreakingMode:(UIWebPaginationBreakingMode)paginationBreakingMode;
- (void)setPaginationMode:(UIWebPaginationMode)paginationMode;
- (void)setScalesPageToFit:(BOOL)scalesPageToFit;
- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering;
- (void)stopLoading;
- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6;
- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4;
- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4;
- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5;
- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6;
- (void)webView:(id)a3 printFrameView:(id)a4;
- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5;
- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5;
- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5;
- (void)webViewClose:(id)a3;
- (void)webViewMainFrameDidCommitLoad:(id)a3;
- (void)webViewMainFrameDidFailLoad:(id)a3 withError:(id)a4;
- (void)webViewMainFrameDidFinishLoad:(id)a3;
- (void)webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:(id)a3;
- (void)webViewSupportedOrientationsUpdated:(id)a3;
@end

@implementation UIWebView

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UIApplicationLoadWebKit();
  }
}

- (BOOL)keyboardDisplayRequiresUserAction
{
  return ![(UIWebBrowserView *)self->_internal->browserView inputViewObeysDOMFocus];
}

- (void)setKeyboardDisplayRequiresUserAction:(BOOL)keyboardDisplayRequiresUserAction
{
}

- (void)_didRotate:(id)a3
{
  internal = self->_internal;
  if ((*((unsigned char *)internal + 40) & 4) == 0 && [(UIView *)internal->browserView window])
  {
    uint64_t v5 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", -[UIView window](self->_internal->browserView, "window"));
    browserView = self->_internal->browserView;
    [(UIWebDocumentView *)browserView sendOrientationEventForOrientation:v5];
  }
}

- (void)_setScalesPageToFitViewportSettings
{
  [(UIView *)self bounds];
  double v4 = v3;
  -[UIWebDocumentView _restoreViewportSettingsWithSize:](self->_internal->browserView, "_restoreViewportSettingsWithSize:", v3, v5);
  LODWORD(v6) = -1.0;
  [(UIWebDocumentView *)self->_internal->browserView setInitialScale:16 forDocumentTypes:v6];
  LODWORD(v7) = 0.25;
  [(UIWebDocumentView *)self->_internal->browserView setMinimumScale:16 forDocumentTypes:v7];
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self->_internal->browserView, "setViewportSize:forDocumentTypes:", 16, 980.0, -1.0);
  LODWORD(v8) = -1.0;
  [(UIWebDocumentView *)self->_internal->browserView setInitialScale:8 forDocumentTypes:v8];
  browserView = self->_internal->browserView;
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](browserView, "setViewportSize:forDocumentTypes:", 8, v4, -1.0);
}

- (void)_setRichTextReaderViewportSettings
{
  LODWORD(v2) = 1.0;
  [(UIWebDocumentView *)self->_internal->browserView setInitialScale:0xFFFFFFLL forDocumentTypes:v2];
  LODWORD(v4) = 1.0;
  [(UIWebDocumentView *)self->_internal->browserView setMinimumScale:0xFFFFFFLL forDocumentTypes:v4];
  LODWORD(v5) = 1.0;
  [(UIWebDocumentView *)self->_internal->browserView setMaximumScale:0xFFFFFFLL forDocumentTypes:v5];
  [(UIWebDocumentView *)self->_internal->browserView setAllowsUserScaling:0 forDocumentTypes:0xFFFFFFLL];
  browserView = self->_internal->browserView;
  [(UIView *)self bounds];
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](browserView, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v7, -1.0);
}

- (void)_updateViewSettings
{
  if ([(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    scroller = self->_internal->scroller;
    [(UIView *)self bounds];
    -[UIScrollView setFrame:](scroller, "setFrame:");
    pdfHandler = self->_internal->pdfHandler;
    [(UIWebPDFViewHandler *)pdfHandler updateViewSettings];
  }
  else
  {
    [(UIView *)self bounds];
    internal = self->_internal;
    if (v7 == 0.0 || (double v10 = v8, v8 == 0.0))
    {
      browserView = internal->browserView;
      [(UIWebTiledView *)browserView removeAllTiles];
    }
    else
    {
      double v11 = v5;
      double v12 = v6;
      double v13 = v7;
      if (*((unsigned char *)internal + 40)) {
        [(UIWebView *)self _setScalesPageToFitViewportSettings];
      }
      else {
        [(UIWebView *)self _setRichTextReaderViewportSettings];
      }
      -[UIScrollView setFrame:](self->_internal->scroller, "setFrame:", v11, v12, v13, v10);
      [(UIWebView *)self _updateScrollViewInsetAdjustmentBehavior];
      v15 = self->_internal;
      v16 = v15->browserView;
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      double v20 = 0.0;
      if ((*((unsigned char *)v15 + 41) & 1) == 0) {
        [(UIView *)self safeAreaInsets];
      }
      -[UIWebBrowserView _setUnobscuredSafeAreaInsets:](v16, "_setUnobscuredSafeAreaInsets:", v17, v18, v19, v20);
      [(UIScrollView *)self->_internal->scroller adjustedContentInset];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      [(UIScrollView *)self->_internal->scroller keyboardBottomInsetAdjustmentDelta];
      double v30 = v10 - (v22 + v26 - v29);
      double v31 = fmax(v13 - (v24 + v28), 1.0);
      double v32 = fmax(v30, 1.0);
      [(UIWebView *)self _updateBrowserViewExposedScrollViewRect];
      v33 = self->_internal;
      v34 = v33->browserView;
      BOOL v35 = (*((unsigned char *)v33 + 40) & 1) == 0 && [(UIWebDocumentView *)v34 documentType] == 4;
      -[UIWebDocumentView setMinimumSize:updateCurrentViewportConfigurationSize:](v34, "setMinimumSize:updateCurrentViewportConfigurationSize:", v35, v31, v32);
      [(UIView *)self->_internal->browserView frame];
      double x = v49.origin.x;
      double y = v49.origin.y;
      double width = v49.size.width;
      double height = v49.size.height;
      double MaxX = CGRectGetMaxX(v49);
      if (MaxX < v31) {
        double MaxX = v31;
      }
      double v41 = round(MaxX);
      v50.origin.double x = x;
      v50.origin.double y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      double MaxY = CGRectGetMaxY(v50);
      if (MaxY < v32) {
        double MaxY = v32;
      }
      -[UIScrollView setContentSize:](self->_internal->scroller, "setContentSize:", v41, round(MaxY));
      -[UIView setFrame:](self->_internal->checkeredPatternView, "setFrame:", x, y, width, height);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v44 = self->_internal;
      v45 = v44->scroller;
      uint64_t v46 = *((unsigned char *)v44 + 40) & 1;
      if (isKindOfClass) {
        [(UIScrollView *)v45 _weaklySetBouncesHorizontally:v46];
      }
      else {
        [(UIScrollView *)v45 setBouncesHorizontally:v46];
      }
      WebThreadLock();
      objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "mainFrame"), "_setTextAutosizingWidth:", v13);
      v47 = self->_internal->browserView;
      [(UIWebTiledView *)v47 layoutTilesNow];
    }
  }
}

- (void)_updateScrollViewInsetAdjustmentBehavior
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(UIWebView *)self _scrollView];
    if (([v3 _contentInsetAdjustmentBehaviorWasExternallyOverridden] & 1) == 0)
    {
      if (*((unsigned char *)self->_internal + 41)) {
        uint64_t v4 = 3;
      }
      else {
        uint64_t v4 = 2;
      }
      [v3 _setContentInsetAdjustmentBehaviorInternal:v4];
    }
  }
}

- (void)_updateBrowserViewExposedScrollViewRect
{
  id v3 = [(UIWebView *)self _scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 adjustedContentInset];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);
  id v20 = [(UIWebView *)self _browserView];
  objc_msgSend(v20, "setExposedScrollViewRect:", v13, v15, v17, v19);
}

+ (id)_relativePathFromAbsolutePath:(id)a3 removingPathComponents:(unint64_t)a4
{
  double v5 = (void *)[a3 componentsSeparatedByString:@"/"];
  unint64_t v6 = [v5 count];
  if (v6 <= a4) {
    return &stru_1ED0E84C0;
  }
  unint64_t v7 = v6;
  double v8 = &stru_1ED0E84C0;
  do
    double v8 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", [v5 objectAtIndex:a4++]);
  while (v7 != a4);
  return v8;
}

+ (void)_fixPathsForSandboxDirectoryChange
{
  double v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = *MEMORY[0x1E4FB6E70];
  uint64_t v4 = [v2 objectForKey:*MEMORY[0x1E4FB6E70]];
  double v5 = (uint64_t *)MEMORY[0x1E4FB6E30];
  uint64_t v6 = [v2 objectForKey:*MEMORY[0x1E4FB6E30]];
  if (v4 | v6)
  {
    unint64_t v7 = (void *)v6;
    if ([(id)v4 hasPrefix:@"/var/mobile/Applications/"])
    {
      [v2 removeObjectForKey:v3];
      uint64_t v4 = 0;
    }
    if ([v7 hasPrefix:@"/var/mobile/Applications/"])
    {
      [v2 removeObjectForKey:*v5];
      unint64_t v7 = 0;
    }
    double v8 = NSHomeDirectory();
    if ([(id)v4 isEqualToString:v8])
    {
      [v2 removeObjectForKey:v3];
      uint64_t v4 = 0;
    }
    if ([v7 isEqualToString:v8])
    {
      [v2 removeObjectForKey:*v5];
      unint64_t v7 = 0;
    }
    uint64_t v9 = [(NSArray *)[(NSString *)v8 componentsSeparatedByString:@"/"] count];
    if (v4 && [(id)v4 rangeOfString:v8 options:8] == 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v2, "setObject:forKey:", -[NSString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", +[UIWebView _relativePathFromAbsolutePath:removingPathComponents:](UIWebView, "_relativePathFromAbsolutePath:removingPathComponents:", v4, v9)), v3);
    }
    if (v7 && [v7 rangeOfString:v8 options:8] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [(NSString *)v8 stringByAppendingPathComponent:+[UIWebView _relativePathFromAbsolutePath:v7 removingPathComponents:v9]];
      uint64_t v11 = *v5;
      [v2 setObject:v10 forKey:v11];
    }
  }
}

+ (void)_updatePersistentStoragePaths
{
  if (_updatePersistentStoragePaths_updatePaths != -1) {
    dispatch_once(&_updatePersistentStoragePaths_updatePaths, &__block_literal_global_679);
  }
}

void __42__UIWebView__updatePersistentStoragePaths__block_invoke()
{
  if (([_UIMainBundleIdentifier() isEqualToString:@"com.apple.webapp"] & 1) == 0)
  {
    if (_sandbox_in_a_container()) {
      +[UIWebView _fixPathsForSandboxDirectoryChange];
    }
    id v0 = [(NSArray *)NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1) objectAtIndex:0];
    uint64_t v1 = [v0 stringByAppendingPathComponent:@"Caches"];
    uint64_t v2 = [v0 stringByAppendingPathComponent:@"WebKit/LocalStorage"];
    uint64_t v3 = [v0 stringByAppendingPathComponent:@"WebKit/Databases"];
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = *MEMORY[0x1E4FB6E70];
    uint64_t v6 = (void *)[v4 objectForKey:*MEMORY[0x1E4FB6E70]];
    unint64_t v7 = (uint64_t *)MEMORY[0x1E4FB6E30];
    double v8 = (void *)[v4 objectForKey:*MEMORY[0x1E4FB6E30]];
    uint64_t v9 = [v4 objectForKey:@"WebKitStoreWebDataForBackup"];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v10 BOOLValue]) {
          uint64_t v2 = v1;
        }
        if (([v6 isEqualToString:v2] & 1) == 0) {
          [v4 setObject:v2 forKey:v5];
        }
        if (([v8 isEqualToString:v2] & 1) == 0)
        {
          uint64_t v11 = *v7;
          [v4 setObject:v2 forKey:v11];
        }
      }
    }
    else if (!v6 || !v8)
    {
      [v4 setObject:v1 forKey:v5];
      [v4 setObject:v1 forKey:*v7];
      [v4 synchronize];
      if ((_UIIsPrivateMainBundle() & 1) == 0)
      {
        global_queue = dispatch_get_global_queue(-2, 0);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __42__UIWebView__updatePersistentStoragePaths__block_invoke_2;
        v13[3] = &unk_1E52EBA80;
        v13[4] = v2;
        v13[5] = v3;
        dispatch_async(global_queue, v13);
      }
    }
  }
}

uint64_t __42__UIWebView__updatePersistentStoragePaths__block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", *(void *)(a1 + 32), 0);
  uint64_t v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 removeItemAtPath:v3 error:0];
}

- (void)_webViewCommonInitWithWebView:(id)a3 scalesPageToFit:(BOOL)a4
{
  +[UIWebView _updatePersistentStoragePaths];
  self->_internal = objc_alloc_init(UIWebViewInternal);
  WebThreadLock();
  [(UIView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [UIWebBrowserView alloc];
  if (a3) {
    double v16 = -[UIWebBrowserView initWithWebView:frame:](v15, "initWithWebView:frame:", a3, v8, v10, v12, v14);
  }
  else {
    double v16 = -[UIWebBrowserView initWithFrame:](v15, "initWithFrame:", v8, v10, v12, v14);
  }
  self->_internal->browserView = v16;
  [(UIWebBrowserView *)self->_internal->browserView set_editingDelegateForEverythingExceptForms:self];
  double v17 = -[_UIWebViewScrollView initWithFrame:]([_UIWebViewScrollView alloc], "initWithFrame:", v8, v10, v12, v14);
  self->_internal->scroller = &v17->super.super;
  [(_UIWebViewScrollView *)v17 _setWebView:self];
  [(UIScrollView *)self->_internal->scroller _forceDelegateScrollViewDidZoom:1];
  [(UIView *)self->_internal->scroller addSubview:self->_internal->browserView];
  [(UIView *)self->_internal->scroller setAutoresizingMask:16];
  *((unsigned char *)self->_internal + 40) = *((unsigned char *)self->_internal + 40) & 0xFE | a4;
  self->_internal->checkeredPatternView = -[UICheckeredPatternView initWithFrame:]([UICheckeredPatternView alloc], "initWithFrame:", v8, v10, v12, v14);
  *((unsigned char *)self->_internal + 40) &= ~8u;
  [(UIWebView *)self _updateCheckeredPattern];
  [(UIWebTiledView *)self->_internal->browserView setTilingEnabled:1];
  [(UIWebView *)self _setDrawInWebThread:1];
  *((unsigned char *)self->_internal + 41) |= 1u;
  [(UIWebDocumentView *)self->_internal->browserView setAutoresizes:1];
  [(UIView *)self->_internal->browserView setContentsPosition:7];
  [(UIWebDocumentView *)self->_internal->browserView setDelegate:self];
  [(UIWebDocumentView *)self->_internal->browserView setSmoothsFonts:1];
  [(UIWebView *)self _updateOpaqueAndBackgroundColor];
  id v18 = [(UIWebDocumentView *)self->_internal->browserView webView];
  self->_internal->webViewDelegate = [[UIWebViewWebViewDelegate alloc] initWithUIWebView:self];
  [v18 setFrameLoadDelegate:self->_internal->webViewDelegate];
  [v18 setPolicyDelegate:self->_internal->webViewDelegate];
  [v18 setUIDelegate:self->_internal->webViewDelegate];
  [v18 setResourceLoadDelegate:self->_internal->webViewDelegate];
  [v18 _setFontFallbackPrefersPictographs:0];
  objc_msgSend(v18, "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", -[UIWebView _effectiveAppearanceIsDark](self, "_effectiveAppearanceIsDark"), -[UIWebView _effectiveTraitsUseElevatedUserInterfaceLevel](self, "_effectiveTraitsUseElevatedUserInterfaceLevel"));
  objc_msgSend((id)objc_msgSend(v18, "window"), "setRootLayer:", -[UIView layer](self, "layer"));
  double v19 = (void *)[v18 preferences];
  [v19 setOfflineWebApplicationCacheEnabled:1];
  objc_msgSend(v19, "_setLocalStorageDatabasePath:", objc_msgSend(MEMORY[0x1E4FB6E00], "_storageDirectoryPath"));
  WebKitGetMinimumZoomFontSize();
  objc_msgSend(v19, "_setMinimumZoomFontSize:");
  [v19 _setAllowMultiElementImplicitFormSubmission:0];
  [(UIView *)self addSubview:self->_internal->scroller];
  [(UIWebView *)self _updateViewSettings];
  [(UIWebDocumentView *)self->_internal->browserView _setDocumentType:4];
  [(UIWebDocumentView *)self->_internal->browserView setDetectsPhoneNumbers:1];
  *((unsigned char *)self->_internal + 40) |= 0x10u;
  if (!_webViewCommonInitWithWebView_scalesPageToFit__backgroundColor) {
    _webViewCommonInitWithWebView_scalesPageToFit__backgroundColor = +[UIColor _webContentBackgroundColor];
  }
  if (![(UIView *)self backgroundColor]) {
    [(UIWebView *)self setBackgroundColor:_webViewCommonInitWithWebView_scalesPageToFit__backgroundColor];
  }
  if (![MEMORY[0x1E4FB6DB8] optionalSharedHistory])
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4FB6DB8]);
    [MEMORY[0x1E4FB6DB8] setOptionalSharedHistory:v20];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__didRotate_, @"UIWindowDidRotateNotification", 0);
  *((unsigned char *)self->_internal + 40) &= ~4u;
  self->_internal->pdfHandler = objc_alloc_init(UIWebPDFViewHandler);
  [(UIWebPDFViewHandler *)self->_internal->pdfHandler setScalesPageToFit:*((unsigned char *)self->_internal + 40) & 1];
  [(UIWebPDFViewHandler *)self->_internal->pdfHandler setShowPageLabels:1];
  if (objc_opt_respondsToSelector())
  {
    [v18 _installVisualIdentificationOverlayForViewIfNeeded:self kind:@"UIWebView"];
  }
}

- (id)_initWithFrame:(CGRect)a3 enableReachability:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  uint64_t v5 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (!a4) {
      [MEMORY[0x1E4FB6E08] _doNotStartObservingNetworkReachability];
    }
    [(UIWebView *)v5 _webViewCommonInitWithWebView:0 scalesPageToFit:0];
  }
  return v5;
}

- (UIWebView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  uint64_t v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    [(UIWebView *)v3 _webViewCommonInitWithWebView:0 scalesPageToFit:0];
  }
  return v4;
}

- (UIWebView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  uint64_t v4 = -[UIView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[UIWebView _webViewCommonInitWithWebView:scalesPageToFit:](v4, "_webViewCommonInitWithWebView:scalesPageToFit:", 0, [a3 decodeBoolForKey:@"UIScalesPageToFit"]);
    v4->_internal->delegate = (UIWebViewDelegate *)[a3 decodeObjectForKey:@"UIDelegate"];
    -[UIWebDocumentView setDataDetectorTypes:](v4->_internal->browserView, "setDataDetectorTypes:", [a3 decodeIntegerForKey:@"UIDataDetectorTypes"]);
  }
  return v4;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  -[UIView _populateArchivedSubviews:](&v6, sel__populateArchivedSubviews_);
  internal = self->_internal;
  if (internal)
  {
    if (internal->scroller) {
      objc_msgSend(a3, "removeObject:");
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  -[UIView encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeConditionalObject:self->_internal->delegate forKey:@"UIDelegate"];
  internal = self->_internal;
  if (*((unsigned char *)internal + 40))
  {
    [a3 encodeBool:1 forKey:@"UIScalesPageToFit"];
    internal = self->_internal;
  }
  uint64_t v6 = [(UIWebDocumentView *)internal->browserView dataDetectorTypes];
  if (v6) {
    [a3 encodeInteger:v6 forKey:@"UIDataDetectorTypes"];
  }
}

- (void)dealloc
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v3 _clearDelegates];
  [(UIWebViewWebViewDelegate *)self->_internal->webViewDelegate _clearUIWebView];

  objc_msgSend((id)objc_msgSend(v3, "window"), "setRootLayer:", 0);
  [(UIScrollView *)self->_internal->scroller setDelegate:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIScrollView *)self->_internal->scroller _setWebView:0];
  }

  [(UIWebBrowserView *)self->_internal->browserView set_editingDelegateForEverythingExceptForms:0];
  [(UIWebDocumentView *)self->_internal->browserView setDelegate:0];

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"UIWindowDidRotateNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)UIWebView;
  [(UIView *)&v4 dealloc];
}

- (BOOL)_shouldUseViewForSceneDraggingBehavior
{
  return 0;
}

- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
  WebThreadLock();
  uint64_t v5 = (NSString *)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "stringByEvaluatingJavaScriptFromString:", script);
  [(UIWebBrowserView *)self->_internal->browserView _startURLificationIfNeededCoalesce:1];
  return v5;
}

- (void)setDetectsPhoneNumbers:(BOOL)detectsPhoneNumbers
{
}

- (BOOL)detectsPhoneNumbers
{
  return [(UIWebDocumentView *)self->_internal->browserView detectsPhoneNumbers];
}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
}

- (UIDataDetectorTypes)dataDetectorTypes
{
  return [(UIWebDocumentView *)self->_internal->browserView dataDetectorTypes];
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
}

- (BOOL)allowsInlineMediaPlayback
{
  return [(UIWebBrowserView *)self->_internal->browserView allowsInlineMediaPlayback];
}

- (void)setMediaPlaybackRequiresUserAction:(BOOL)mediaPlaybackRequiresUserAction
{
}

- (BOOL)mediaPlaybackRequiresUserAction
{
  return [(UIWebBrowserView *)self->_internal->browserView mediaPlaybackRequiresUserAction];
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)mediaPlaybackAllowsAirPlay
{
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  return [(UIWebDocumentView *)self->_internal->browserView mediaPlaybackAllowsAirPlay];
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback
{
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return [(UIWebBrowserView *)self->_internal->browserView allowsPictureInPictureVideo];
}

- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview
{
}

- (BOOL)allowsLinkPreview
{
  return [(UIWebBrowserView *)self->_internal->browserView allowsLinkPreview];
}

- (void)setScalesPageToFit:(BOOL)scalesPageToFit
{
  internal = self->_internal;
  char v4 = *((unsigned char *)internal + 40);
  if (((((v4 & 1) == 0) ^ scalesPageToFit) & 1) == 0)
  {
    *((unsigned char *)internal + 40) = v4 & 0xFE | scalesPageToFit;
    [(UIWebPDFViewHandler *)self->_internal->pdfHandler setScalesPageToFit:*((unsigned char *)self->_internal + 40) & 1];
    [(UIWebView *)self _updateViewSettings];
  }
}

- (BOOL)scalesPageToFit
{
  return *((unsigned char *)self->_internal + 40) & 1;
}

- (BOOL)isLoading
{
  return (*((unsigned __int8 *)self->_internal + 40) >> 1) & 1;
}

- (void)setDelegate:(id)delegate
{
  self->_internal->delegate = (UIWebViewDelegate *)delegate;
}

- (id)delegate
{
  return self->_internal->delegate;
}

- (UIScrollView)scrollView
{
  return self->_internal->scroller;
}

- (void)loadRequest:(NSURLRequest *)request
{
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL
{
}

- (NSURLRequest)request
{
  uint64_t v2 = self->_internal->request;
  return v2;
}

- (void)reload
{
  id v2 = [(UIWebDocumentView *)self->_internal->browserView webView];
  if (v2)
  {
    id v3 = v2;
    WebThreadLock();
    if ([v3 mainFrameURL])
    {
      [v3 reload:0];
    }
    else
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "backForwardList"), "currentItem");
      if (v4)
      {
        [v3 goToBackForwardItem:v4];
      }
    }
  }
}

- (void)stopLoading
{
}

- (void)goBack
{
  id v2 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v2 goBack:0];
}

- (void)goForward
{
  id v2 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v2 goForward:0];
}

- (BOOL)canGoBack
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  return [v3 canGoBack];
}

- (BOOL)canGoForward
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  return [v3 canGoForward];
}

- (BOOL)suppressesIncrementalRendering
{
  return [(UIWebDocumentView *)self->_internal->browserView suppressesIncrementalRendering];
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
}

- (void)_updateCheckeredPattern
{
  internal = self->_internal;
  if ((*((unsigned char *)internal + 40) & 8) != 0
    && (uint64_t v4 = [(UIWebPDFViewHandler *)internal->pdfHandler pdfView], internal = self->_internal, !v4))
  {
    scroller = internal->scroller;
    checkeredPatternView = internal->checkeredPatternView;
    [(UIView *)scroller insertSubview:checkeredPatternView atIndex:0];
  }
  else
  {
    uint64_t v5 = internal->checkeredPatternView;
    [(UIView *)v5 removeFromSuperview];
  }
}

- (BOOL)_effectiveAppearanceIsDark
{
  return [(UITraitCollection *)[(UIView *)self traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark;
}

- (BOOL)_effectiveTraitsUseElevatedUserInterfaceLevel
{
  return [(UITraitCollection *)[(UIView *)self traitCollection] userInterfaceLevel] == UIUserInterfaceLevelElevated;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  BOOL v4 = [(UIWebView *)self _effectiveAppearanceIsDark];
  BOOL v5 = [(UIWebView *)self _effectiveTraitsUseElevatedUserInterfaceLevel];
  [v3 _setUseDarkAppearance:v4 useElevatedUserInterfaceLevel:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIScrollView *)self->_internal->scroller contentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_beginRotation
{
  [(UIView *)self setAutoresizesSubviews:0];
  *((unsigned char *)self->_internal + 40) |= 0x40u;
  *((unsigned char *)self->_internal + 40) &= ~0x80u;
  browserView = self->_internal->browserView;
  [(UIWebDocumentView *)browserView willRotateInteractionSheet];
}

- (void)_finishRotation
{
  *((unsigned char *)self->_internal + 40) &= ~0x40u;
  [(UIWebBrowserView *)self->_internal->browserView redrawScaledDocument];
  [(UIWebView *)self _updateViewSettings];
  [(UIView *)self setAutoresizesSubviews:1];
  browserView = self->_internal->browserView;
  [(UIWebDocumentView *)browserView didRotateInteractionSheet];
}

- (void)_rescaleDocument
{
  internal = self->_internal;
  int v3 = *((char *)internal + 40);
  if ((v3 & 0x80000000) == 0)
  {
    *((unsigned char *)internal + 40) = v3 | 0x80;
    browserView = self->_internal->browserView;
    [(UIView *)self bounds];
    -[UIWebBrowserView rotateEnclosingScrollViewToFrame:](browserView, "rotateEnclosingScrollViewToFrame:");
  }
}

- (void)_frameOrBoundsChanged
{
  internal = self->_internal;
  if (internal)
  {
    if ([(UIWebPDFViewHandler *)internal->pdfHandler pdfView])
    {
      [(UIView *)self bounds];
      double v4 = self->_internal;
      if ((*((unsigned char *)v4 + 40) & 0x40) != 0)
      {
        pdfHandler = v4->pdfHandler;
        -[UIWebPDFViewHandler rotateEnclosingScrollViewToFrame:](pdfHandler, "rotateEnclosingScrollViewToFrame:");
      }
      else
      {
        -[UIScrollView setFrame:](v4->scroller, "setFrame:");
        BOOL v5 = self->_internal->pdfHandler;
        [(UIWebPDFViewHandler *)v5 updateViewSettings];
      }
    }
    else if ((*((unsigned char *)self->_internal + 40) & 0x40) != 0)
    {
      [(UIWebView *)self _rescaleDocument];
    }
    else
    {
      [(UIView *)self bounds];
      double v7 = v6;
      double v9 = v8;
      [(UIView *)self->_internal->browserView frame];
      if (v11 < v7 || v10 < v9) {
        -[UIWebBrowserView setFrame:](self->_internal->browserView, "setFrame:");
      }
      else {
        [(UIWebView *)self _updateViewSettings];
      }
      browserView = self->_internal->browserView;
      [(UIWebDocumentView *)browserView updateInteractionElements];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIWebView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIWebView *)self _frameOrBoundsChanged];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIWebView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIWebView *)self _frameOrBoundsChanged];
  }
}

- (void)_updateOpaqueAndBackgroundColor
{
  internal = self->_internal;
  if ((*((unsigned char *)internal + 40) & 8) != 0
    && (uint64_t v4 = [(UIWebPDFViewHandler *)internal->pdfHandler pdfView], internal = self->_internal, !v4))
  {
    [(UIWebDocumentView *)internal->browserView setOpaque:0];
    browserView = (UIWebPDFView *)self->_internal->browserView;
    double v6 = +[UIColor clearColor];
  }
  else
  {
    [(UIWebDocumentView *)internal->browserView setOpaque:[(UIView *)self isOpaque]];
    [(UIView *)self->_internal->browserView setBackgroundColor:[(UIView *)self backgroundColor]];
    browserView = [(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView];
    [(UIView *)browserView setOpaque:[(UIView *)self isOpaque]];
    double v6 = [(UIView *)self backgroundColor];
  }
  [(UIView *)browserView setBackgroundColor:v6];
  double v7 = self->_internal->browserView;
  BOOL v8 = [(UIView *)self isOpaque];
  [(UIWebDocumentView *)v7 setDrawsBackground:v8];
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isOpaque];
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  [(UIView *)&v6 setOpaque:v3];
  if (self->_internal)
  {
    if (v5 != [(UIView *)self isOpaque]) {
      [(UIWebView *)self _updateOpaqueAndBackgroundColor];
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  BOOL v5 = [(UIView *)self backgroundColor];
  v6.receiver = self;
  v6.super_class = (Class)UIWebView;
  [(UIView *)&v6 setBackgroundColor:a3];
  if (self->_internal)
  {
    if (![(UIColor *)v5 isEqual:[(UIView *)self backgroundColor]]) {
      [(UIWebView *)self _updateOpaqueAndBackgroundColor];
    }
  }
}

- (BOOL)_appliesExclusiveTouchToSubviewTree
{
  return 1;
}

- (BOOL)_webView:(id)a3 previewIsAllowedForPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    return -[UIWebViewDelegate uiWebView:previewIsAllowedForPosition:](delegate, "uiWebView:previewIsAllowedForPosition:", self, x, y);
  }
  else
  {
    return objc_msgSend(a3, "_previewAllowedForPosition:", x, y);
  }
}

- (id)_webView:(id)a3 previewViewControllerForURL:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_internal->delegate;
  return (id)[(UIWebViewDelegate *)delegate uiWebView:self previewViewControllerForURL:a4];
}

- (void)_webView:(id)a3 willPresentPreview:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self willPresentPreview:a4];
  }
}

- (void)_webView:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self didDismissPreview:a4 committing:v5];
  }
}

- (void)_webView:(id)a3 commitPreview:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self commitPreview:a4];
  }
}

- (id)_webView:(id)a3 presentationSnapshotForPreview:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    return (id)[(UIWebViewDelegate *)delegate uiWebView:self presentationSnapshotForPreview:a4];
  }
  else
  {
    id v8 = [(UIWebView *)self _documentView];
    return (id)[v8 _presentationSnapshotForPreview];
  }
}

- (id)_webView:(id)a3 presentationRectsForPreview:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    return (id)[(UIWebViewDelegate *)delegate uiWebView:self presentationRectsForPreview:a4];
  }
  else
  {
    id v8 = [(UIWebView *)self _documentView];
    return (id)[v8 _presentationRectsForPreview];
  }
}

- (void)_updateScrollerViewForInputView:(id)a3
{
  id v4 = [(UIWebView *)self _browserView];
  [v4 _updateScrollerViewForInputView:a3];
}

- (void)webViewMainFrameDidFirstVisuallyNonEmptyLayoutInFrame:(id)a3
{
}

- (void)webViewMainFrameDidCommitLoad:(id)a3
{
}

- (void)webViewMainFrameDidFinishLoad:(id)a3
{
  [(UIWebPDFViewHandler *)self->_internal->pdfHandler updateViewHierarchyForDocumentViewLoadComplete:a3];
  [(UIWebView *)self _updateCheckeredPattern];
  [(UIWebView *)self _updateOpaqueAndBackgroundColor];
}

- (void)webViewMainFrameDidFailLoad:(id)a3 withError:(id)a4
{
}

- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4
{
}

- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4
{
}

- (void)_webView:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4
{
  *((unsigned char *)self->_internal + 41) = *((unsigned char *)self->_internal + 41) & 0xFE | a4;
  [(UIWebView *)self _updateViewSettings];
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id result = [(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView];
  if (!result) {
    return self->_internal->browserView;
  }
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    browserView = self->_internal->browserView;
    [(UIWebDocumentView *)browserView willStartZoom];
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    browserView = self->_internal->browserView;
    [(UIWebDocumentView *)browserView didZoom];
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    [(UIWebBrowserView *)self->_internal->browserView redrawScaledDocument];
    browserView = self->_internal->browserView;
    [(UIWebDocumentView *)browserView didEndZoom];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    browserView = self->_internal->browserView;
    [(UIWebDocumentView *)browserView willStartScroll];
  }
}

- (void)_didCompleteScrolling
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    id v3 = [(UIWebView *)self _browserView];
    [v3 didEndScroll];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(UIWebView *)self _didCompleteScrolling];
  }
}

- (void)scrollViewWasRemoved:(id)a3
{
  if (![(UIWebPDFViewHandler *)self->_internal->pdfHandler pdfView])
  {
    id v4 = [(UIWebView *)self _browserView];
    [v4 scrollViewWasRemoved];
  }
}

- (void)_reportError:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate webView:self didFailLoadWithError:a3];
  }
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
  uint64_t v12 = objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView", a3, a4, a5, a6), "mainFrame");
  [(UIWebView *)self webView:a3 decidePolicyForNavigationAction:a4 request:a5 frame:v12 decisionListener:a7];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v11 = objc_msgSend(a5, "URL", a3);
  uint64_t v12 = [v11 iTunesStoreURL];
  if (v12)
  {
    id v13 = (id)[a5 mutableCopy];
    [v13 setURL:v12];
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
    id v13 = a5;
  }
  if (objc_opt_respondsToSelector())
  {
    unsigned int v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E4FB6E20]), "intValue");
    uint64_t v16 = v15 >= 5 ? 5 : v15;
    if (([(UIWebViewDelegate *)self->_internal->delegate webView:self shouldStartLoadWithRequest:a5 navigationType:v16] & 1) == 0|| v12&& ([(UIWebViewDelegate *)self->_internal->delegate webView:self shouldStartLoadWithRequest:v14 navigationType:v16] & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  if (v12) {
    double v11 = (void *)v12;
  }
  double v17 = (void *)[a4 objectForKey:*MEMORY[0x1E4FB6E18]];
  uint64_t v18 = [v17 objectForKey:*MEMORY[0x1E4FB6E38]];
  if (v18)
  {
    if (+[UIWebURLAction performDefaultActionForURL:v11 andDOMNode:v18 withAllowedTypes:-3 forFrame:a6 inView:self])
    {
LABEL_15:
      [a7 ignore];
      return;
    }
  }
  if (([MEMORY[0x1E4FB6E08] _canHandleRequest:v13] & 1) == 0
    && [v11 isSpringboardHandledURL])
  {
    v24[0] = 0;
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary_1)
    {
      v24[1] = (void *)MEMORY[0x1E4F143A8];
      v24[2] = (void *)3221225472;
      v24[3] = __TelephonyUtilitiesLibraryCore_block_invoke_1;
      v24[4] = &__block_descriptor_40_e5_v8__0l;
      v24[5] = v24;
      long long v25 = xmmword_1E53113C0;
      uint64_t v26 = 0;
      TelephonyUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    }
    if (TelephonyUtilitiesLibraryCore_frameworkLibrary_1)
    {
      double v19 = v24[0];
      if (!v24[0]) {
        goto LABEL_24;
      }
    }
    else
    {
      double v21 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"void *TelephonyUtilitiesLibrary(void)"];
      double v19 = objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"UIWebView.m", 78, @"%s", v24[0]);
      __break(1u);
    }
    free(v19);
LABEL_24:
    if ([v11 hasTelephonyScheme])
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "telephonyURLWithDestinationID:promptUser:", objc_msgSend(v11, "phoneNumber"), 1);
    }
    else
    {
      if (([v11 isFaceTimeURL] & 1) == 0 && !objc_msgSend(v11, "isFaceTimeAudioURL")) {
        goto LABEL_33;
      }
      uint64_t v20 = [MEMORY[0x1E4F1CB10] faceTimePromptURLWithURL:v11];
    }
    double v11 = (void *)v20;
LABEL_33:
    [(id)UIApp _openURL:v11 originatingView:self completionHandler:0];
    [a7 ignore];
    return;
  }
  [a7 use];
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self decidePolicyForMIMEType:a4 request:a5 frame:a6 decisionListener:a7];
  }
  else
  {
    id v14 = (void *)[MEMORY[0x1E4FB6DA0] sharedPolicyDelegate];
    if (objc_opt_respondsToSelector())
    {
      [v14 webView:a3 decidePolicyForMIMEType:a4 request:a5 frame:a6 decisionListener:a7];
    }
  }
}

- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5
{
}

- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self frame:a4 exceededDatabaseQuotaForSecurityOrigin:a5 database:a6];
  }
  else
  {
    double v11 = (void *)[a5 databaseQuotaManager];
    [v11 setQuota:52428800];
  }
}

- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self exceededApplicationCacheOriginQuotaForSecurityOrigin:a4 totalSpaceNeeded:a5];
  }
  else
  {
    double v9 = (void *)[a4 applicationCacheQuotaManager];
    [v9 setQuota:52428800];
  }
}

- (void)webView:(id)a3 printFrameView:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self printFrameView:a4];
  }
}

- (void)webViewSupportedOrientationsUpdated:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebViewSupportedOrientationsUpdated:self];
  }
}

- (void)_updateRequest
{
  WebThreadLock();
  id v3 = (NSURLRequest *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "mainFrame"), "dataSource"), "request");

  self->_internal->request = v3;
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  [(UIWebView *)self _updateRequest];
  [(UIWebBrowserView *)self->_internal->browserView resignFirstResponder];
  *((unsigned char *)self->_internal + 40) |= 2u;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate webViewDidStartLoad:self];
  }
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self didCommitLoadForFrame:a4];
  }
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self didReceiveTitle:a4 forFrame:a5];
  }
}

- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_internal->delegate;
  return (id)[(UIWebViewDelegate *)delegate uiWebView:self connectionPropertiesForResource:a4 dataSource:a5];
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  id v7 = a5;
  id v14 = a4;
  unsigned int v15 = self;
  id v12 = a6;
  id v13 = a5;
  id v11 = a7;
  if (objc_opt_respondsToSelector())
  {
    NSInvocation = (void *)WebThreadMakeNSInvocation();
    [NSInvocation setArgument:&v15 atIndex:2];
    [NSInvocation setArgument:&v14 atIndex:3];
    [NSInvocation setArgument:&v13 atIndex:4];
    [NSInvocation setArgument:&v12 atIndex:5];
    [NSInvocation setArgument:&v11 atIndex:6];
    WebThreadCallDelegate();
    double v10 = 0;
    [NSInvocation getReturnValue:&v10];
    return v10;
  }
  return v7;
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self didClearWindowObject:a4 forFrame:a5];
  }
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  [(UIWebView *)self _updateRequest];
  *((unsigned char *)self->_internal + 40) &= ~2u;
  [(UIWebView *)self _reportError:a4];
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  [(UIWebView *)self _updateRequest];
  if ((id)[a3 mainFrame] == a4)
  {
    *((unsigned char *)self->_internal + 40) &= ~2u;
    internal = self->_internal;
    if ((*((unsigned char *)internal + 40) & 0x10) != 0
      && ([(UIWebDocumentView *)internal->browserView hasBodyElement]
       || ![(UIWebBrowserView *)self->_internal->browserView inputViewObeysDOMFocus]
       || ![(UIWebBrowserView *)self->_internal->browserView _currentAssistedNode]))
    {
      [(UIWebDocumentView *)self->_internal->browserView resetSelectionAssistant];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate webViewDidFinishLoad:self];
  }
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  [(UIWebView *)self _updateRequest];
  *((unsigned char *)self->_internal + 40) &= ~2u;
  [(UIWebView *)self _reportError:a4];
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self didFirstLayoutInFrame:a4];
  }
}

- (void)webViewClose:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebViewClose:self];
  }
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  objc_super v6 = +[UIAlertController alertControllerWithTitle:javaScriptDialogTitle(a5) message:a4 preferredStyle:1];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = [_UIKitBundle() localizedStringForKey:@"OK java script dialog" value:@"OK" table:@"Localizable"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__UIWebView_webView_runJavaScriptAlertPanelWithMessage_initiatedByFrame___block_invoke;
  v10[3] = &unk_1E5311358;
  v10[4] = &v11;
  [(UIAlertController *)v6 addAction:+[UIAlertAction actionWithTitle:v7 style:0 handler:v10]];
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  uint64_t v8 = *MEMORY[0x1E4F1C3A0];
  while (!*((unsigned char *)v12 + 24))
  {
    double v9 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
    objc_msgSend(v9, "runMode:beforeDate:", v8, objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"));
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __73__UIWebView_webView_runJavaScriptAlertPanelWithMessage_initiatedByFrame___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  objc_super v6 = +[UIAlertController alertControllerWithTitle:javaScriptDialogTitle(a5) message:a4 preferredStyle:1];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v7 = [_UIKitBundle() localizedStringForKey:@"Cancel java script dialog" value:@"Cancel" table:@"Localizable"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke;
  v14[3] = &unk_1E5311358;
  v14[4] = &v19;
  [(UIAlertController *)v6 addAction:+[UIAlertAction actionWithTitle:v7 style:1 handler:v14]];
  uint64_t v8 = [_UIKitBundle() localizedStringForKey:@"OK java script dialog" value:@"OK" table:@"Localizable"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke_2;
  v13[3] = &unk_1E5311380;
  v13[4] = &v19;
  v13[5] = &v15;
  [(UIAlertController *)v6 addAction:+[UIAlertAction actionWithTitle:v8 style:0 handler:v13]];
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  uint64_t v9 = *MEMORY[0x1E4F1C3A0];
  while (!*((unsigned char *)v20 + 24))
  {
    double v10 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
    objc_msgSend(v10, "runMode:beforeDate:", v9, objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"));
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __75__UIWebView_webView_runJavaScriptConfirmPanelWithMessage_initiatedByFrame___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:javaScriptDialogTitle(a6) message:a4 preferredStyle:1];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [_UIKitBundle() localizedStringForKey:@"Cancel java script dialog" value:@"Cancel" table:@"Localizable"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke;
  v15[3] = &unk_1E5311358;
  v15[4] = &v20;
  [(UIAlertController *)v7 addAction:+[UIAlertAction actionWithTitle:v8 style:1 handler:v15]];
  uint64_t v9 = [_UIKitBundle() localizedStringForKey:@"OK java script dialog" value:@"OK" table:@"Localizable"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2;
  v14[3] = &unk_1E5311380;
  v14[4] = &v20;
  void v14[5] = &v16;
  [(UIAlertController *)v7 addAction:+[UIAlertAction actionWithTitle:v9 style:0 handler:v14]];
  [(UIAlertController *)v7 addTextFieldWithConfigurationHandler:&__block_literal_global_286_2];
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self), "presentViewController:animated:completion:", v7, 1, 0);
  uint64_t v10 = *MEMORY[0x1E4F1C3A0];
  while (!*((unsigned char *)v21 + 24))
  {
    char v11 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
    objc_msgSend(v11, "runMode:beforeDate:", v10, objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"));
  }
  if (*((unsigned char *)v17 + 24)) {
    id v12 = (id)objc_msgSend(-[NSArray firstObject](-[UIAlertController textFields](v7, "textFields"), "firstObject"), "text");
  }
  else {
    id v12 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __88__UIWebView_webView_runJavaScriptTextInputPanelWithPrompt_defaultText_initiatedByFrame___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self decidePolicyForGeolocationRequestFromOrigin:a4 frame:a5 listener:a6];
  }
  else
  {
    id v12 = +[UIWebGeolocationPolicyDecider sharedPolicyDecider];
    [v12 webView:a3 decidePolicyForGeolocationRequestFromOrigin:a4 frame:a5 listener:a6];
  }
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    return (id)[(UIWebViewDelegate *)delegate uiWebView:self identifierForInitialRequest:a4 fromDataSource:a5];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    return v10;
  }
}

- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self resource:a4 didFinishLoadingFromDataSource:a5];
  }
}

- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self resource:a4 didFailLoadingWithError:a5 fromDataSource:a6];
  }
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self resource:a4 didReceiveAuthenticationChallenge:a5 fromDataSource:a6];
  }
  else if (!objc_msgSend(a5, "previousFailureCount", a3, a4, a5, a6))
  {
    uint64_t v11 = [a5 protectionSpace];
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F18D90], "sharedCredentialStorage"), "defaultCredentialForProtectionSpace:", v11);
    if (v12)
    {
      uint64_t v13 = v12;
      char v14 = (void *)[a5 sender];
      [v14 useCredential:v13 forAuthenticationChallenge:a5];
    }
  }
}

- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    [(UIWebViewDelegate *)delegate uiWebView:self resource:a4 didCancelAuthenticationChallenge:a5 fromDataSource:a6];
  }
}

- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6
{
  if (self->_internal->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    return [(UIWebViewDelegate *)delegate uiWebView:self resource:a4 canAuthenticateAgainstProtectionSpace:a5 forDataSource:a6];
  }
  else
  {
    uint64_t v12 = objc_msgSend(a5, "authenticationMethod", a3, a4, a5, a6);
    if (([v12 isEqualToString:*MEMORY[0x1E4F18C80]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x1E4F18C90]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x1E4F18C98]] & 1) != 0
      || ([v12 isEqualToString:*MEMORY[0x1E4F18C88]] & 1) != 0)
    {
      return 1;
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F18CA0];
      return [v12 isEqualToString:v13];
    }
  }
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
  if ((id)[a3 mainFrame] == a4)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "dataSource"), "request"), "URL"), "fragment");
    pdfHandler = self->_internal->pdfHandler;
    [(UIWebPDFViewHandler *)pdfHandler handleScrollToAnchor:v6];
  }
}

- (CGImage)newSnapshotWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  WebThreadLock();
  [(UIWebTiledView *)self->_internal->browserView layoutTilesNow];
  v9.receiver = self;
  v9.super_class = (Class)UIWebView;
  return -[UIView newSnapshotWithRect:](&v9, sel_newSnapshotWithRect_, x, y, width, height);
}

- (id)_initWithWebView:(id)a3
{
  [a3 frame];
  v8.receiver = self;
  v8.super_class = (Class)UIWebView;
  BOOL v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  uint64_t v6 = v5;
  if (v5) {
    [(UIWebView *)v5 _webViewCommonInitWithWebView:a3 scalesPageToFit:0];
  }
  return v6;
}

- (id)_browserView
{
  return self->_internal->browserView;
}

- (id)_documentView
{
  return self->_internal->browserView;
}

- (id)_scrollView
{
  return self->_internal->scroller;
}

- (id)_pdfViewHandler
{
  return self->_internal->pdfHandler;
}

- (void)_setOverridesOrientationChangeEventHandling:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self->_internal + 40) = *((unsigned char *)self->_internal + 40) & 0xFB | v3;
}

- (void)_setDrawsCheckeredPattern:(BOOL)a3
{
  internal = self->_internal;
  char v4 = *((unsigned char *)internal + 40);
  if (((((v4 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)internal + 40) = v4 & 0xF7 | v6;
    [(UIWebView *)self _updateCheckeredPattern];
    [(UIWebView *)self _updateOpaqueAndBackgroundColor];
  }
}

- (void)_setSelectionEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self->_internal + 40) = *((unsigned char *)self->_internal + 40) & 0xEF | v3;
}

- (void)_setDrawInWebThread:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self->_internal + 40) = *((unsigned char *)self->_internal + 40) & 0xDF | v3;
  [(UIWebTiledView *)self->_internal->browserView setLayoutTilesInMainThread:(*((unsigned char *)self->_internal + 40) & 0x20) == 0];
}

- (UIWebPaginationMode)paginationMode
{
  WebThreadLock();
  unsigned int v3 = objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_paginationMode") - 1;
  if (v3 > 3) {
    return 0;
  }
  else {
    return qword_186B9E7E0[v3];
  }
}

- (void)setPaginationMode:(UIWebPaginationMode)paginationMode
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  switch(paginationMode)
  {
    case UIWebPaginationModeUnpaginated:
      goto LABEL_6;
    case UIWebPaginationModeLeftToRight:
      uint64_t v5 = 1;
      uint64_t v6 = 1;
      goto LABEL_6;
    case UIWebPaginationModeTopToBottom:
      uint64_t v6 = 1;
      uint64_t v5 = 3;
      goto LABEL_6;
    case UIWebPaginationModeBottomToTop:
      uint64_t v6 = 1;
      uint64_t v5 = 4;
      goto LABEL_6;
    case UIWebPaginationModeRightToLeft:
      uint64_t v6 = 1;
      uint64_t v5 = 2;
LABEL_6:
      WebThreadLock();
      [(UIWebDocumentView *)self->_internal->browserView setShouldIgnoreCustomViewport:v6];
      id v7 = [(UIWebDocumentView *)self->_internal->browserView webView];
      [v7 _setPaginationMode:v5];
      break;
    default:
      return;
  }
}

- (BOOL)_paginationBehavesLikeColumns
{
  return [(UIWebView *)self paginationBreakingMode] == UIWebPaginationBreakingModeColumn;
}

- (UIWebPaginationBreakingMode)paginationBreakingMode
{
  return (unint64_t)objc_msgSend(-[UIWebDocumentView webView](self->_internal->browserView, "webView"), "_paginationBehavesLikeColumns");
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
}

- (void)setPaginationBreakingMode:(UIWebPaginationBreakingMode)paginationBreakingMode
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v5 _setPaginationBehavesLikeColumns:paginationBreakingMode == UIWebPaginationBreakingModeColumn];
}

- (CGFloat)pageLength
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v3 _pageLength];
  return result;
}

- (void)setPageLength:(CGFloat)pageLength
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v5 _setPageLength:pageLength];
}

- (CGFloat)gapBetweenPages
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v3 _gapBetweenPages];
  return result;
}

- (void)setGapBetweenPages:(CGFloat)gapBetweenPages
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self->_internal->browserView webView];
  [v5 _setGapBetweenPages:gapBetweenPages];
}

- (NSUInteger)pageCount
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self->_internal->browserView webView];
  return [v3 _pageCount];
}

- (void)_setAlwaysConstrainsScale:(BOOL)a3
{
}

- (BOOL)_alwaysConstrainsScale
{
  return [(UIWebDocumentView *)self->_internal->browserView alwaysConstrainsScale];
}

- (void)_setAlwaysDispatchesScrollEvents:(BOOL)a3
{
}

- (BOOL)_alwaysDispatchesScrollEvents
{
  return [(UIWebBrowserView *)self->_internal->browserView alwaysDispatchesScrollEvents];
}

- (void)_setAudioSessionCategoryOverride:(unint64_t)a3
{
}

- (unint64_t)_audioSessionCategoryOverride
{
  return [(UIWebBrowserView *)self->_internal->browserView audioSessionCategoryOverride];
}

- (void)_setAllowsPictureInPictureVideo:(BOOL)a3
{
}

- (BOOL)_allowsPictureInPictureVideo
{
  return [(UIWebBrowserView *)self->_internal->browserView allowsPictureInPictureVideo];
}

- (void)_setNetworkInterfaceName:(id)a3
{
}

- (id)_networkInterfaceName
{
  return [(UIWebBrowserView *)self->_internal->browserView networkInterfaceName];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return [(UIWebBrowserView *)self->_internal->browserView canPerformAction:a3 withSender:a4];
}

- (void)copy:(id)a3
{
}

- (void)select:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)_define:(id)a3
{
}

- (void)_translate:(id)a3
{
}

- (void)_share:(id)a3
{
}

- (void)_addShortcut:(id)a3
{
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self->_internal->browserView webView];
  if (v5)
  {
    uint64_t v6 = v5;
    [(UIWebDocumentView *)self->_internal->browserView saveStateToCurrentHistoryItem];
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend((id)objc_msgSend(v6, "backForwardList"), "dictionaryRepresentation"), @"kBackForwardDictionaryKey");
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWebView;
  [(UIResponder *)&v7 encodeRestorableStateWithCoder:a3];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), @"kBackForwardDictionaryKey");
  if (v9)
  {
    uint64_t v10 = v9;
    WebThreadLock();
    id v11 = [(UIWebDocumentView *)self->_internal->browserView webView];
    if (v11)
    {
      uint64_t v12 = v11;
      objc_msgSend((id)objc_msgSend(v11, "backForwardList"), "setToMatchDictionaryRepresentation:", v10);
      uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "backForwardList"), "currentItem"), "URL");
      if (v13)
      {
        uint64_t v14 = v13;

        self->_internal->request = (NSURLRequest *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v14];
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)UIWebView;
  [(UIResponder *)&v15 decodeRestorableStateWithCoder:a3];
}

@end