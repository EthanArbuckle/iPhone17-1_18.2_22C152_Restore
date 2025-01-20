@interface BKTOCWebViewController2
+ (id)classNameFromChapterInfo:(id)a3 excludedFromSample:(BOOL)a4;
+ (id)hairlineImageURIWithColor:(id)a3 horizontal:(BOOL)a4;
+ (id)pageNumberStringForChapter:(id)a3 directoryDelegate:(id)a4;
+ (id)tocHTMLWithFetchedResultsController:(id)a3 directoryDelegate:(id)a4 chapterTopLevelFont:(id)a5 chapterSubLevelFont:(id)a6 pageLabelFont:(id)a7 themeContentBackgroundColor:(id)a8 textColor:(id)a9 selectedTextColor:(id)a10 pageNumberTextColor:(id)a11 separatorColor:(id)a12 highlightedBackgroundColor:(id)a13 highlightedTextColor:(id)a14 contentInsets:(UIEdgeInsets)a15 completionBlock:(id)a16;
+ (int64_t)pageNumberForChapter:(id)a3 directoryDelegate:(id)a4;
- (BKActivityIndicatorOverlayView)activityIndicator;
- (BOOL)_webViewWantsToLoadURL:(id)a3 navigationIsClickOrOther:(BOOL)a4;
- (BOOL)fetchedResultsControllerAscendingOrder;
- (BOOL)htmlLoaded;
- (CGSize)contentSize;
- (NSDictionary)tocData;
- (WKWebView)webView;
- (id)_indexPathForURL:(id)a3;
- (id)chapterInfoForCurrentNode;
- (id)chapterInfoForPageNumber:(id)a3;
- (id)elementIdForChapterInfo:(id)a3;
- (id)elementIdForCurrentNode;
- (id)htmlMarkup;
- (id)pageLabelFont;
- (id)scrollView;
- (id)tocDelegate;
- (int64_t)tocContentType;
- (unint64_t)pageIndexForLocation:(id)a3;
- (unint64_t)tocDataIndexFromChapterHref:(id)a3;
- (void)_doInitialWebViewPositionAndLoad;
- (void)_updateContentInsets;
- (void)applyClassName:(id)a3 toOnlyLinkWithHref:(id)a4;
- (void)centerWebView;
- (void)highlightCurrentNode;
- (void)highlightCurrentNodeWithCompletionBlock:(id)a3;
- (void)installJavaScriptWithCompletionBlock:(id)a3;
- (void)invalidateFollowingThemeChange;
- (void)loadHTML;
- (void)releaseViews;
- (void)scrollToItemId:(id)a3 completionBlock:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setHtmlLoaded:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setTocData:(id)a3;
- (void)setWebView:(id)a3;
- (void)updatePageNumberStrings;
- (void)updatePageStylesheet;
- (void)updateView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation BKTOCWebViewController2

- (id)tocDelegate
{
  v2 = [(BKDirectoryContent *)self directoryDelegate];
  v3 = BUProtocolCast();

  return v3;
}

- (int64_t)tocContentType
{
  return 0;
}

- (void)releaseViews
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4 = *(void **)&self->_htmlLoaded;
  *(void *)&self->_htmlLoaded = 0;

  [(BKActivityIndicatorOverlayView *)self->_activityIndicator setNavigationDelegate:0];
  [(BKActivityIndicatorOverlayView *)self->_activityIndicator stopLoading];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewController2;
  [(BKTOCViewController *)&v6 releaseViews];
}

- (void)setTheme:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewController2;
  [(BKTOCViewController *)&v6 setTheme:a3];
  [(BKTOCWebViewController2 *)self updateView];
  v4 = [(BKTOCWebViewController2 *)self theme];
  v5 = [(BKTOCWebViewController2 *)self scrollView];
  [v4 stylizeScrollView:v5];
}

+ (id)pageNumberStringForChapter:(id)a3 directoryDelegate:(id)a4
{
  id v5 = a3;
  objc_super v6 = [a4 tocViewController:0 pageTitleForChapter:v5];
  unsigned __int8 v7 = [v5 isExcludedFromSample];

  if (v7)
  {
    CFStringRef v8 = &stru_1DF0D8;
  }
  else
  {
    if ([v6 length]) {
      goto LABEL_6;
    }
    v9 = AEBundle();
    CFStringRef v8 = [v9 localizedStringForKey:@"…" value:&stru_1DF0D8 table:0];

    objc_super v6 = v9;
  }

  objc_super v6 = (void *)v8;
LABEL_6:

  return v6;
}

+ (int64_t)pageNumberForChapter:(id)a3 directoryDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isExcludedFromSample]) {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v7 = (int64_t)[v6 tocViewController:0 pageNumberForChapter:v5];
  }

  return v7;
}

- (void)updatePageNumberStrings
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_49E7C;
  v21 = sub_49E8C;
  id v22 = +[NSMutableArray array];
  v3 = [(BKTOCViewController *)self fetchedResultsController];
  v4 = [v3 fetchedObjects];

  id v5 = [(BKTOCWebViewController2 *)self tocData];
  id v6 = [v5 objectForKeyedSubscript:@"chapters"];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_49E94;
  v14[3] = &unk_1DBB88;
  v14[4] = self;
  v16 = &v17;
  id v7 = v6;
  id v15 = v7;
  [v4 enumerateObjectsUsingBlock:v14];
  uint64_t v8 = v18[5];
  id v13 = 0;
  v9 = +[NSJSONSerialization dataWithJSONObject:v8 options:1 error:&v13];
  id v10 = v13;
  if ([v9 length])
  {
    id v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"updatePageNumberStrings(%@);",
    v12 = v11);
    [(BKActivityIndicatorOverlayView *)self->_activityIndicator evaluateJavaScript:v12 completionHandler:&stru_1DBBC8];
  }
  _Block_object_dispose(&v17, 8);
}

+ (id)classNameFromChapterInfo:(id)a3 excludedFromSample:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 objectForKeyedSubscript:@"indentationLevel"];
  id v6 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"indentation%lu", [v5 unsignedLongValue]);

  if (v4) {
    [v6 appendString:@" notPageExists"];
  }

  return v6;
}

+ (id)hairlineImageURIWithColor:(id)a3 horizontal:(BOOL)a4
{
  [a3 CGColor];
  BOOL v4 = +[UIScreen mainScreen];
  [v4 scale];
  id v5 = (void *)BCCreateHairlineImageAsDataForColor();

  if (v5)
  {
    [v5 bu_dataURIString];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    id v6 = &stru_1DF0D8;
  }

  return v6;
}

+ (id)tocHTMLWithFetchedResultsController:(id)a3 directoryDelegate:(id)a4 chapterTopLevelFont:(id)a5 chapterSubLevelFont:(id)a6 pageLabelFont:(id)a7 themeContentBackgroundColor:(id)a8 textColor:(id)a9 selectedTextColor:(id)a10 pageNumberTextColor:(id)a11 separatorColor:(id)a12 highlightedBackgroundColor:(id)a13 highlightedTextColor:(id)a14 contentInsets:(UIEdgeInsets)a15 completionBlock:(id)a16
{
  double right = a15.right;
  double left = a15.left;
  id v78 = a3;
  id v76 = a4;
  id v24 = a5;
  id v79 = a6;
  id v75 = a7;
  id v25 = a8;
  id v83 = a9;
  id v26 = a10;
  id v80 = a11;
  id v27 = a12;
  id v82 = a13;
  id v81 = a14;
  v74 = (void (**)(id, id))a16;
  v28 = +[NSMutableDictionary dictionary];
  v72 = v27;
  v29 = [a1 hairlineImageURIWithColor:v27 horizontal:0];
  [v28 setObject:@"vertical-rl" forKeyedSubscript:@"toc_writing_mode"];
  v30 = +[NSMutableArray array];
  [v28 setObject:v30 forKeyedSubscript:@"chapters"];

  uint64_t v31 = [v76 tocViewControllerTocIdCssRules:0];
  v32 = (void *)v31;
  if (v31) {
    CFStringRef v33 = (const __CFString *)v31;
  }
  else {
    CFStringRef v33 = &stru_1DF0D8;
  }
  [v28 setObject:v33 forKeyedSubscript:@"idCssRules"];

  v73 = v26;
  v34 = [v26 bc_rgbaString];
  v35 = +[NSString stringWithFormat:@"%@", v34];
  [v28 setObject:v35 forKeyedSubscript:@"selectedTextColor"];

  v36 = +[UIColor grayColor];
  v37 = [v36 bc_rgbaString];
  v38 = +[NSString stringWithFormat:@"%@", v37];
  [v28 setObject:v38 forKeyedSubscript:@"textNotPageExistsColor"];

  [v28 setObject:v29 forKeyedSubscript:@"dividerImageURI"];
  v39 = [v24 bc_cssFontFamily];
  [v28 setObject:v39 forKeyedSubscript:@"chapterTopLevelFontFamily"];

  v40 = [v24 bc_cssFontWeight];
  [v28 setObject:v40 forKeyedSubscript:@"chapterTopLevelFontWeight"];

  v41 = [v24 bc_cssFontSize];
  [v28 setObject:v41 forKeyedSubscript:@"chapterTopLevelFontSize"];

  v42 = [v79 bc_cssFontFamily];
  [v28 setObject:v42 forKeyedSubscript:@"chapterSubLevelFontFamily"];

  v43 = [v79 bc_cssFontWeight];
  [v28 setObject:v43 forKeyedSubscript:@"chapterSubLevelFontWeight"];

  v44 = [v79 bc_cssFontSize];
  [v28 setObject:v44 forKeyedSubscript:@"chapterSubLevelFontSize"];

  v45 = [v75 bc_cssFontFamily];
  [v28 setObject:v45 forKeyedSubscript:@"pageLabelFontFamily"];

  v46 = [v75 bc_cssFontWeight];
  [v28 setObject:v46 forKeyedSubscript:@"pageLabelFontWeight"];

  v47 = [v75 bc_cssFontSize];
  [v28 setObject:v47 forKeyedSubscript:@"pageLabelFontSize"];

  v48 = [v25 bc_rgbaString];
  v49 = +[NSString stringWithFormat:@"%@", v48];
  [v28 setObject:v49 forKeyedSubscript:@"themeContentBackgroundColor"];

  v50 = [v83 bc_rgbaString];
  v51 = +[NSString stringWithFormat:@"%@", v50];
  [v28 setObject:v51 forKeyedSubscript:@"textColor"];

  v52 = [v80 bc_rgbaString];
  v53 = +[NSString stringWithFormat:@"%@", v52];
  [v28 setObject:v53 forKeyedSubscript:@"pageNumberTextColor"];

  v54 = [v82 bc_rgbaString];
  v55 = +[NSString stringWithFormat:@"%@", v54];
  [v28 setObject:v55 forKeyedSubscript:@"highlightedBackgroundColor"];

  v56 = [v81 bc_rgbaString];
  v57 = +[NSString stringWithFormat:@"%@", v56];
  [v28 setObject:v57 forKeyedSubscript:@"highlightedTextColor"];

  v58 = +[NSString stringWithFormat:@"%ldpx", llround(left)];
  [v28 setObject:v58 forKeyedSubscript:@"leftContentInset"];

  v59 = +[NSString stringWithFormat:@"%ldpx", llround(44.0)];
  [v28 setObject:v59 forKeyedSubscript:@"leftIndentZero"];

  v60 = +[NSString stringWithFormat:@"%ldpx", llround(44.0 + 16.0)];
  [v28 setObject:v60 forKeyedSubscript:@"leftIndentOne"];

  v61 = +[NSString stringWithFormat:@"%ldpx", llround(16.0 * 2.0 + 44.0)];
  [v28 setObject:v61 forKeyedSubscript:@"leftIndentTwo"];

  v62 = +[NSString stringWithFormat:@"%ldpx", llround(right)];
  [v28 setObject:v62 forKeyedSubscript:@"rightContentInset"];

  v63 = +[NSString stringWithFormat:@"%ldpx", llround(34.0)];
  [v28 setObject:v63 forKeyedSubscript:@"rightIndent"];

  v64 = [v78 fetchedObjects];
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  v90[3] = 0;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_4AA0C;
  v85[3] = &unk_1DBBF0;
  v88 = v90;
  id v89 = a1;
  id v65 = v76;
  id v86 = v65;
  id v66 = v28;
  id v87 = v66;
  [v64 enumerateObjectsUsingBlock:v85];
  v67 = AEBundle();
  v68 = [v67 URLForResource:@"BEVerticalTOC.xhtml" withExtension:@"tmpl"];

  id v84 = 0;
  v69 = +[AEMinimalTemplate evaluateTemplateWithURL:v68 data:v66 error:&v84];
  id v70 = v84;
  if (v74) {
    v74[2](v74, v66);
  }

  _Block_object_dispose(v90, 8);

  return v69;
}

- (id)scrollView
{
  return [(BKActivityIndicatorOverlayView *)self->_activityIndicator scrollView];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)BKTOCWebViewController2;
  [(BKContentViewController *)&v24 viewDidLoad];
  +[BEWebViewFactory viewConfiguredForWebTOC:](BEWebViewFactory, "viewConfiguredForWebTOC:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (BKActivityIndicatorOverlayView *)objc_claimAutoreleasedReturnValue();
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  [(BKActivityIndicatorOverlayView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKActivityIndicatorOverlayView *)self->_activityIndicator setNavigationDelegate:self];
  id v5 = +[UIColor clearColor];
  [(BKActivityIndicatorOverlayView *)self->_activityIndicator setBackgroundColor:v5];

  id v6 = +[UIColor clearColor];
  id v7 = [(BKActivityIndicatorOverlayView *)self->_activityIndicator scrollView];
  [v7 setBackgroundColor:v6];

  [(BKActivityIndicatorOverlayView *)self->_activityIndicator setOpaque:0];
  uint64_t v8 = [(BKActivityIndicatorOverlayView *)self->_activityIndicator configuration];
  v9 = [v8 defaultWebpagePreferences];
  [v9 _setMouseEventPolicy:1];

  id v10 = [(BKTOCWebViewController2 *)self scrollView];
  [v10 setBounces:1];
  [v10 setAlwaysBounceVertical:0];
  [v10 setDecelerationRate:UIScrollViewDecelerationRateNormal];
  [v10 setContentInsetAdjustmentBehavior:2];
  [v10 _setShowsBackgroundShadow:0];
  id v11 = [(BKTOCWebViewController2 *)self theme];
  v12 = [(BKTOCWebViewController2 *)self scrollView];
  [v11 stylizeScrollView:v12];

  id v13 = [BKActivityIndicatorOverlayView alloc];
  v14 = [(BKTOCWebViewController2 *)self theme];
  id v15 = [v14 contentTextColor];
  v16 = [v15 colorWithAlphaComponent:0.7];
  uint64_t v17 = [(BKTOCWebViewController2 *)self theme];
  v18 = [v17 backgroundColorForTraitEnvironment:self];
  uint64_t v19 = [(BKActivityIndicatorOverlayView *)v13 initWithBackgroundColor:v16 foregroundColor:v18];
  v20 = *(void **)&self->_htmlLoaded;
  *(void *)&self->_htmlLoaded = v19;

  v21 = *(void **)&self->_htmlLoaded;
  id v22 = [(BKTOCWebViewController2 *)self view];
  [v21 showIndicatorCenteredInView:v22 animated:1 animationDelay:0.0];

  v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_doInitialWebViewPositionAndLoad
{
  id v8 = [(BKTOCWebViewController2 *)self view];
  [v8 bounds];
  -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:");
  [v8 insertSubview:self->_activityIndicator atIndex:0];
  [(BKTOCWebViewController2 *)self _updateContentInsets];
  if ([(BKTOCViewController *)self isVertical])
  {
    [(BKContentViewController *)self contentInsets];
    double v4 = v3;
    id v5 = [(BKTOCWebViewController2 *)self view];
    [v5 bounds];
    -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:", v6 + 0.0, v4 + v7);
  }
  [(BKTOCWebViewController2 *)self loadHTML];
}

- (void)_updateContentInsets
{
  double v3 = [(BKContentViewController *)self layoutDelegate];

  if (v3)
  {
    double v4 = [(BKContentViewController *)self layoutDelegate];
    [v4 edgeInsetsForContentViewController:self];
    -[BKContentViewController setContentInsets:](self, "setContentInsets:");

    id v5 = [(BKContentViewController *)self layoutDelegate];
    [v5 separatorInsetsForContentViewController:self];
    -[BKContentViewController setSeparatorInsets:](self, "setSeparatorInsets:");
  }
}

- (void)centerWebView
{
  if ([(BKTOCViewController *)self isVertical])
  {
    [(BKContentViewController *)self contentInsets];
    double v4 = v3;
    double v6 = v5;
    double v7 = [(BKTOCWebViewController2 *)self view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    activityIndicator = self->_activityIndicator;
    if (activityIndicator)
    {
      double v17 = round(v15) - (v4 + v6);
      double v18 = v9 + 0.0;
      double v19 = v4 + v11;
      [(BKActivityIndicatorOverlayView *)activityIndicator frame];
      v25.origin.x = v18;
      v25.origin.y = v19;
      v25.size.width = v13;
      v25.size.height = v17;
      if (!CGRectEqualToRect(v23, v25))
      {
        v24.origin.x = v18;
        v24.origin.y = v19;
        v24.size.width = v13;
        v24.size.height = v17;
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"document.getElementById('setupWritingMode').style.height = '%ldpx';",
          llround(CGRectGetHeight(v24)));
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        [(BKActivityIndicatorOverlayView *)self->_activityIndicator evaluateJavaScript:v21 completionHandler:&stru_1DBC10];
        -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:", v18, v19, v13, v17);
        v20 = [(BKActivityIndicatorOverlayView *)self->_activityIndicator scrollView];
        [v20 setContentSize:v13, v17];
      }
    }
  }
}

- (void)updateView
{
  if (BYTE4(self->super._verticalCenteringInsets.right))
  {
    [(BKTOCWebViewController2 *)self _updateContentInsets];
    [(BKTOCWebViewController2 *)self updatePageStylesheet];
    [(BKTOCWebViewController2 *)self updatePageNumberStrings];
    [(BKTOCWebViewController2 *)self centerWebView];
  }
}

- (void)invalidateFollowingThemeChange
{
  id v2 = [(BKTOCWebViewController2 *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKTOCWebViewController2;
  [(BKTOCViewController *)&v5 viewWillAppear:a3];
  [(BKTOCWebViewController2 *)self _doInitialWebViewPositionAndLoad];
  double v4 = [(BKTOCWebViewController2 *)self view];
  [v4 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKTOCWebViewController2;
  [(BKTOCWebViewController2 *)&v3 viewWillLayoutSubviews];
  if (![(BKTOCViewController *)self shouldIgnoreViewLayoutUpdates])
  {
    [(BKTOCWebViewController2 *)self updateView];
    [(BKTOCViewController *)self reload];
  }
}

- (id)_indexPathForURL:(id)a3
{
  objc_super v3 = [a3 lastPathComponent];
  if ([v3 hasPrefix:@"row-"])
  {
    double v4 = [v3 substringFromIndex:[@"row-" length]];
    id v5 = [v4 integerValue];

    double v6 = +[NSIndexPath indexPathForRow:v5 inSection:0];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v19 = a5;
  id v7 = a4;
  double v8 = [v7 request];
  double v9 = [v8 URL];
  double v10 = [(BKTOCWebViewController2 *)self _indexPathForURL:v9];

  id v11 = [v7 navigationType];
  if ((unint64_t)v11 + 1 <= 1 && v10)
  {
    double v12 = [(BKTOCViewController *)self fetchedResultsController];
    double v13 = [v12 objectAtIndexPath:v10];

    if (v13)
    {
      double v14 = [(BKTOCViewController *)self eventEngagement];
      [v14 sendReaderEventNewSectionViaToC];

      double v15 = [(BKTOCWebViewController2 *)self tocDelegate];
      [v15 tocViewController:self didSelectChapter:v13];

      activityIndicator = self->_activityIndicator;
      if (activityIndicator) {
        -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", @"clearSelectedLink();",
      }
          &stru_1DBC30);
    }
  }
  id v17 = objc_retainBlock(v19);
  double v18 = v17;
  if (v17) {
    (*((void (**)(id, BOOL))v17 + 2))(v17, v10 == 0);
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4B780;
  v4[3] = &unk_1DABD8;
  v4[4] = self;
  -[BKTOCWebViewController2 installJavaScriptWithCompletionBlock:](self, "installJavaScriptWithCompletionBlock:", v4, a4);
}

- (BOOL)_webViewWantsToLoadURL:(id)a3 navigationIsClickOrOther:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(BKTOCWebViewController2 *)self _indexPathForURL:a3];
  id v7 = (void *)v6;
  if (v4 && v6)
  {
    double v8 = [(BKTOCViewController *)self fetchedResultsController];
    double v9 = [v8 objectAtIndexPath:v7];

    if (v9)
    {
      double v10 = [(BKTOCWebViewController2 *)self tocDelegate];
      [v10 tocViewController:self didSelectChapter:v9];
    }
  }

  return v7 == 0;
}

- (BOOL)fetchedResultsControllerAscendingOrder
{
  return 1;
}

- (id)pageLabelFont
{
  [(BKTOCViewController *)self calculateFontSize];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (void)scrollToItemId:(id)a3 completionBlock:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4BB0C;
  v13[3] = &unk_1DBC58;
  id v6 = a4;
  id v14 = v6;
  id v7 = a3;
  double v8 = objc_retainBlock(v13);
  double v9 = +[NSString stringWithFormat:@"scrollToItemWithId(\"%@\")", v7];

  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_4BBAC;
    v11[3] = &unk_1DB508;
    double v12 = v8;
    [(BKActivityIndicatorOverlayView *)activityIndicator evaluateJavaScript:v9 completionHandler:v11];
  }
}

- (id)chapterInfoForPageNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKTOCWebViewController2 *)self tocData];
    id v6 = [v5 objectForKeyedSubscript:@"chapters"];

    id v7 = [v6 reverseObjectEnumerator];
    id v8 = [v7 nextObject];
    if (v8)
    {
      while (1)
      {
        double v9 = [v8 objectForKeyedSubscript:@"pageInteger"];
        if ([v9 integerValue] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = [v4 integerValue];
          if ((uint64_t)v10 >= (uint64_t)[v9 integerValue]) {
            break;
          }
        }

        uint64_t v11 = [v7 nextObject];

        id v8 = (id)v11;
        if (!v11) {
          goto LABEL_9;
        }
      }
      id v8 = v8;
    }
LABEL_9:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)tocDataIndexFromChapterHref:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKTOCWebViewController2 *)self tocData];
    id v6 = [v5 objectForKeyedSubscript:@"chapters"];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    id v8 = (char *)[v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      double v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        double v12 = 0;
        double v13 = &v9[(void)v10];
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v12) objectForKeyedSubscript:@"href" v18];
          unsigned __int8 v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            unint64_t v16 = (unint64_t)&v12[(void)v10];
            goto LABEL_12;
          }
          ++v12;
        }
        while (v9 != v12);
        double v9 = (char *)[v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        id v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
  }
  else
  {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

- (void)applyClassName:(id)a3 toOnlyLinkWithHref:(id)a4
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"applyClassNameToOnlyLinkWithHref(\"%@\", \"%@\");",
    a4,
  uint64_t v5 = a3);
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    uint64_t v7 = v5;
    activityIndicator = (BKActivityIndicatorOverlayView *)[(BKActivityIndicatorOverlayView *)activityIndicator evaluateJavaScript:v5 completionHandler:&stru_1DBC78];
    uint64_t v5 = v7;
  }

  _objc_release_x1(activityIndicator, v5);
}

- (unint64_t)pageIndexForLocation:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = a3;
  uint64_t v5 = [(BKDirectoryContent *)self directoryDelegate];
  id v6 = [v5 directoryContent:self pageNumberForLocation:v4];

  return (unint64_t)v6;
}

- (id)chapterInfoForCurrentNode
{
  objc_super v3 = [(BKTOCWebViewController2 *)self tocDelegate];
  id v4 = [v3 tocViewControllerCurrentLocation:self];

  unint64_t v5 = [(BKTOCWebViewController2 *)self pageIndexForLocation:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v5 + 1];
    id v8 = [(BKTOCWebViewController2 *)self chapterInfoForPageNumber:v7];
    double v9 = v8;
    if (v8)
    {
      id v6 = v8;
    }
    else
    {
      id v10 = [(BKTOCWebViewController2 *)self tocData];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"chapters"];
      id v6 = [v11 firstObject];
    }
  }

  return v6;
}

- (id)elementIdForCurrentNode
{
  objc_super v3 = [(BKTOCWebViewController2 *)self chapterInfoForCurrentNode];
  id v4 = [(BKTOCWebViewController2 *)self elementIdForChapterInfo:v3];

  return v4;
}

- (id)elementIdForChapterInfo:(id)a3
{
  id v4 = (char *)a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"href"];
    if (!v6)
    {
      id v17 = BCIMLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v24 = 136315650;
        CGRect v25 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
        __int16 v26 = 2080;
        id v27 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
        __int16 v28 = 1024;
        int v29 = 615;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v24, 0x1Cu);
      }

      double v9 = BCIMLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      int v24 = 138412290;
      CGRect v25 = v5;
      id v10 = "@\"Expected a toc href for chapter: %@\"";
      goto LABEL_19;
    }
    if (BYTE4(self->super._verticalCenteringInsets.right)) {
      [(BKTOCWebViewController2 *)self applyClassName:@"currentLocation" toOnlyLinkWithHref:v6];
    }
    unint64_t v7 = [(BKTOCWebViewController2 *)self tocDataIndexFromChapterHref:v6];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = BCIMLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v24 = 136315650;
        CGRect v25 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
        __int16 v26 = 2080;
        id v27 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
        __int16 v28 = 1024;
        int v29 = 612;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v24, 0x1Cu);
      }

      double v9 = BCIMLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      int v24 = 138412290;
      CGRect v25 = (const char *)v6;
      id v10 = "@\"Expected a toc data for href: %@\"";
LABEL_19:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v24, 0xCu);
LABEL_20:
      unint64_t v16 = &stru_1DF0D8;
LABEL_21:

      goto LABEL_22;
    }
    unint64_t v19 = v7;
    long long v20 = [(BKTOCWebViewController2 *)self tocData];
    long long v21 = [v20 objectForKeyedSubscript:@"chapters"];
    id v22 = [v21 objectAtIndexedSubscript:v19];
    unint64_t v16 = [v22 objectForKeyedSubscript:@"id"];

    if (!v16)
    {
      CGRect v23 = BCIMLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = 136315650;
        CGRect v25 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
        __int16 v26 = 2080;
        id v27 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
        __int16 v28 = 1024;
        int v29 = 609;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v24, 0x1Cu);
      }

      double v9 = BCIMLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        CGRect v25 = (const char *)v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "@\"Expected a toc element id for href: %@\"", (uint8_t *)&v24, 0xCu);
      }
      unint64_t v16 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v11 = [(BKTOCWebViewController2 *)self tocDelegate];
    double v12 = [v11 tocViewControllerCurrentLocation:self];
    unint64_t v13 = [(BKTOCWebViewController2 *)self pageIndexForLocation:v12];

    id v14 = BCIMLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v24 = 136315650;
      CGRect v25 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
      __int16 v26 = 2080;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
      __int16 v28 = 1024;
      int v29 = 619;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v24, 0x1Cu);
    }

    id v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v15 = +[NSNumber numberWithUnsignedInteger:v13];
      int v24 = 138412290;
      CGRect v25 = v15;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"Expected a toc entry for page %@\"", (uint8_t *)&v24, 0xCu);
    }
    unint64_t v16 = &stru_1DF0D8;
  }
LABEL_22:

  return v16;
}

- (void)highlightCurrentNodeWithCompletionBlock:(id)a3
{
  id v8 = (void (**)(id, BOOL))a3;
  id v4 = [(BKTOCWebViewController2 *)self elementIdForCurrentNode];
  if (v4)
  {
    [(BKTOCWebViewController2 *)self scrollToItemId:v4 completionBlock:v8];
    activityIndicator = self->_activityIndicator;
    id v6 = +[NSString stringWithFormat:@"selectItemWithId(\"%@\");", v4];
    [(BKActivityIndicatorOverlayView *)activityIndicator evaluateJavaScript:v6 completionHandler:&stru_1DBC98];
  }
  else
  {
    id v6 = [(BKTOCWebViewController2 *)self tocDelegate];
    unint64_t v7 = [v6 tocViewControllerCurrentLocation:self];
    v8[2](v8, v7 == 0);
  }
}

- (void)highlightCurrentNode
{
}

- (void)installJavaScriptWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKTOCWebViewController2 *)self tocData];
  id v6 = [v5 objectForKeyedSubscript:@"chapters"];
  id v19 = 0;
  unint64_t v7 = +[NSJSONSerialization dataWithJSONObject:v6 options:1 error:&v19];
  id v8 = v19;

  if ([v7 length])
  {
    id v9 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    id v10 = +[NSString stringWithFormat:@"setupTOCWithChapters(%@);", v9];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_4C96C;
    v16[3] = &unk_1DBD00;
    v16[4] = self;
    id v18 = v4;
    id v17 = v8;
    uint64_t v11 = objc_retainBlock(v16);
    double v12 = v11;
    activityIndicator = self->_activityIndicator;
    if (activityIndicator)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_4CB84;
      v14[3] = &unk_1DB508;
      unsigned __int8 v15 = v11;
      [(BKActivityIndicatorOverlayView *)activityIndicator evaluateJavaScript:v10 completionHandler:v14];
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)htmlMarkup
{
  [(BKTOCViewController *)self establishChapterFonts];
  objc_super v3 = [(BKTOCWebViewController2 *)self themePage];
  CGRect v25 = [v3 separatorColor];
  id v4 = [(BKTOCWebViewController2 *)self traitCollection];
  double v5 = dbl_18EA10[[v4 userInterfaceStyle] == (char *)&dword_0 + 2];

  id v6 = +[UIColor tintColor];
  unint64_t v7 = [v6 colorWithAlphaComponent:v5];

  int v24 = v7;
  if ([(BKTOCViewController *)self usesPopoverStyle])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v3 tableViewCellSelectedColor];
  }
  id v9 = v8;
  id v18 = v8;
  CGRect v23 = +[UIColor clearColor];
  id v10 = [v3 primaryTextColor];
  uint64_t v11 = [v3 tintColor];
  id v19 = [v3 tocPageNumberTextColor];
  id v21 = (id)objc_opt_class();
  long long v20 = [(BKTOCViewController *)self fetchedResultsController];
  double v12 = [(BKTOCWebViewController2 *)self tocDelegate];
  unint64_t v13 = BUProtocolCast();
  id v14 = [(BKTOCViewController *)self chapterTopLevelFont];
  unsigned __int8 v15 = [(BKTOCViewController *)self chapterSubLevelFont];
  unint64_t v16 = [(BKTOCWebViewController2 *)self pageLabelFont];
  [(BKContentViewController *)self contentInsets];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_4CEB0;
  v26[3] = &unk_1DBD28;
  v26[4] = self;
  [v21 tocHTMLWithFetchedResultsController:v20 directoryDelegate:v13 chapterTopLevelFont:v14 chapterSubLevelFont:v15 pageLabelFont:v16 themeContentBackgroundColor:v23 textColor:v10 selectedTextColor:v11 pageNumberTextColor:v19 separatorColor:v25 highlightedBackgroundColor:v10 highlightedTextColor:v26 contentInsets:v26];
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)loadHTML
{
  id v13 = [(BKTOCWebViewController2 *)self htmlMarkup];
  objc_super v3 = [(BKContentViewController *)self book];
  id v4 = [v3 tocPageHref];
  double v5 = [v3 urlForHref:v4];

  id v6 = [v5 absoluteString];
  unint64_t v7 = [(BKTOCWebViewController2 *)self elementIdForCurrentNode];
  id v8 = +[NSString stringWithFormat:@"%@#%@", v6, v7];

  id v9 = +[NSURL URLWithString:v8];
  id v10 = BEURLHandleriBooksImgUrlFromiBooksURL();

  uint64_t v11 = [v13 dataUsingEncoding:4];
  id v12 = [(BKActivityIndicatorOverlayView *)self->_activityIndicator loadData:v11 MIMEType:BEXBEHTMLContentType characterEncodingName:BEUTF8StringEncodingName baseURL:v10];
}

- (void)updatePageStylesheet
{
  id v3 = [(BKTOCWebViewController2 *)self htmlMarkup];
  id v4 = AEBundle();
  double v5 = [v4 URLForResource:@"BEVerticalTOC.xhtml" withExtension:@"tmpl"];

  id v6 = [(BKTOCWebViewController2 *)self tocData];
  id v21 = 0;
  unint64_t v7 = +[AEMinimalTemplate evaluateTemplateWithURL:v5 data:v6 error:&v21];
  id v8 = v21;

  id v9 = [v7 rangeOfString:@"<style"];
  id v10 = [v7 rangeOfString:@">" options:0 range:(NSRange){v9, [v7 length] - v9}];
  id v12 = objc_msgSend(v7, "substringWithRange:", &v10[v11], (unsigned char *)objc_msgSend(v7, "rangeOfString:options:range:", @"</style>", 0, &v10[v11], (unsigned char *)objc_msgSend(v7, "length") - &v10[v11])- &v10[v11]);
  id v22 = v12;
  id v13 = +[NSArray arrayWithObjects:&v22 count:1];
  id v20 = 0;
  id v14 = +[NSJSONSerialization dataWithJSONObject:v13 options:1 error:&v20];
  id v15 = v20;

  id v16 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
  id v17 = [(BKTOCWebViewController2 *)self elementIdForCurrentNode];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"updatePageStylesheet(%@); clearSelectedLink(); scrollToItemWithId(\"%@\")",
    v16,
  id v18 = v17);
  activityIndicator = self->_activityIndicator;
  if (activityIndicator) {
    [(BKActivityIndicatorOverlayView *)activityIndicator evaluateJavaScript:v18 completionHandler:&stru_1DBD48];
  }
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return *(BKActivityIndicatorOverlayView **)&self->_htmlLoaded;
}

- (void)setActivityIndicator:(id)a3
{
}

- (WKWebView)webView
{
  return (WKWebView *)self->_activityIndicator;
}

- (void)setWebView:(id)a3
{
}

- (NSDictionary)tocData
{
  return (NSDictionary *)self->_webView;
}

- (void)setTocData:(id)a3
{
}

- (CGSize)contentSize
{
  tocData = self->_tocData;
  double width = self->_contentSize.width;
  result.height = width;
  result.double width = *(double *)&tocData;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  *(CGSize *)&self->_tocData = a3;
}

- (BOOL)htmlLoaded
{
  return BYTE4(self->super._verticalCenteringInsets.right);
}

- (void)setHtmlLoaded:(BOOL)a3
{
  BYTE4(self->super._verticalCenteringInsets.right) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_htmlLoaded, 0);
}

@end