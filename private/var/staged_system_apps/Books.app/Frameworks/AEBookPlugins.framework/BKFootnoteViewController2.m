@interface BKFootnoteViewController2
- (BEFootnoteDelegate)delegate;
- (BEFootnotePresenter)presenter;
- (BEWebViewFactoryStylesheetSet)stylesheetSet;
- (BKExpandedContentResource)resource;
- (BKFootnoteViewController2)initWithResource:(id)a3 stylesheetSet:(id)a4 backgroundColor:(id)a5 textColor:(id)a6;
- (BOOL)allowsRemoteInspection;
- (BOOL)failedToLoad;
- (BOOL)isBookTheme;
- (BOOL)isNightTheme;
- (BOOL)isPageTheme;
- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4;
- (BOOL)readyForDisplay;
- (IMFadeView)footerMask;
- (IMFadeView)headerMask;
- (NSLayoutConstraint)webViewTopAnchorWhenDoneButtonVisible;
- (NSLayoutConstraint)webViewTopConstraint;
- (UIButton)doneButton;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (WKWebView)webView;
- (_WKUserStyleSheet)themeStylesheet;
- (id)_footNoteTitleHTML;
- (void)_applyCurrentTheme;
- (void)_constructAndActivateConstraints;
- (void)_didDismissFootnoteViewController;
- (void)_doneButtonTapped:(id)a3;
- (void)_footnoteViewControllerPreparationForDisplayFailed:(id)a3;
- (void)_footnoteViewControllerReadyForDisplay;
- (void)_generateAndLoadContent;
- (void)_presentAlertController:(id)a3 completion:(id)a4;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateDoneButton;
- (void)ae_didDismissPopoverContainingThisViewController;
- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)im_themeDidChange;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3;
- (void)releaseViews;
- (void)setAllowsRemoteInspection:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setFailedToLoad:(BOOL)a3;
- (void)setFooterMask:(id)a3;
- (void)setHeaderMask:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setReadyForDisplay:(BOOL)a3;
- (void)setResource:(id)a3;
- (void)setStylesheetSet:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setThemeStylesheet:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewTopAnchorWhenDoneButtonVisible:(id)a3;
- (void)setWebViewTopConstraint:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BKFootnoteViewController2

- (BKFootnoteViewController2)initWithResource:(id)a3 stylesheetSet:(id)a4 backgroundColor:(id)a5 textColor:(id)a6
{
  id v11 = a3;
  id v25 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11) {
    BCReportAssertionFailureWithMessage();
  }
  v14 = [v11 resource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    BCReportAssertionFailureWithMessage();
  }
  v26.receiver = self;
  v26.super_class = (Class)BKFootnoteViewController2;
  v16 = [(BKViewController *)&v26 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    p_resource = (id *)&v16->_resource;
    objc_storeStrong((id *)&v16->_resource, a3);
    v19 = [*p_resource sourceURL];
    v20 = BEURLHandleriBooksImgUrlFromiBooksURL();
    [*p_resource setSourceURL:v20];

    objc_storeStrong((id *)&v17->_stylesheetSet, a4);
    objc_storeStrong((id *)&v17->_backgroundColor, a5);
    objc_storeStrong((id *)&v17->_textColor, a6);
    double height = 667.0;
    if (CGSizeZero.height <= 667.0) {
      double height = CGSizeZero.height;
    }
    -[BKFootnoteViewController2 setPreferredContentSize:](v17, "setPreferredContentSize:", 375.0, height);
    [(BKFootnoteViewController2 *)v17 setModalPresentationStyle:7];
    v22 = +[UITraitCollection bc_allAPITraits];
    id v23 = [(BKFootnoteViewController2 *)v17 registerForTraitChanges:v22 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v17;
}

- (void)releaseViews
{
  v3 = [(WKWebView *)self->_webView be_navigationHandler];
  [v3 setDelegate:0];

  v4 = [(WKWebView *)self->_webView be_uiHandler];
  [v4 setDelegate:0];

  [(WKWebView *)self->_webView stopLoading];
  webView = self->_webView;
  self->_webView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKFootnoteViewController2;
  [(BKViewController *)&v6 releaseViews];
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)BKFootnoteViewController2;
  [(BKFootnoteViewController2 *)&v35 viewDidLoad];
  v3 = [(BKFootnoteViewController2 *)self view];
  [v3 setFrame:CGRectMake(0.0, 0.0, 375.0, 0.0)];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [(BKFootnoteViewController2 *)self allowsRemoteInspection];
  id v13 = [(BKExpandedContentResource *)self->_resource bookID];
  v14 = [(BKExpandedContentResource *)self->_resource cacheItem];
  v15 = +[BEContentCleanupJSOptions expandedContentOptions];
  +[BEWebViewFactory viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:", v12, v13, 0, v14, v15, self->_stylesheetSet, v5, v7, v9, v11);
  v16 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  webView = self->_webView;
  self->_webView = v16;

  [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(WKWebView *)self->_webView be_navigationHandler];
  [v18 setDelegate:self];

  v19 = [(WKWebView *)self->_webView be_uiHandler];
  [v19 setDelegate:self];

  [(BKExpandedContentResource *)self->_resource zoomScale];
  if (v20 > 0.0)
  {
    [(BKExpandedContentResource *)self->_resource zoomScale];
    -[WKWebView _setTextZoomFactor:](self->_webView, "_setTextZoomFactor:");
  }
  v21 = [(WKWebView *)self->_webView scrollView];
  [v21 _setShowsBackgroundShadow:0];
  [v21 setShowsHorizontalScrollIndicator:0];
  [v21 setAlwaysBounceVertical:0];
  v22 = (IMFadeView *)objc_alloc_init((Class)IMFadeView);
  headerMask = self->_headerMask;
  self->_headerMask = v22;

  [(IMFadeView *)self->_headerMask setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = (IMFadeView *)objc_alloc_init((Class)IMFadeView);
  footerMask = self->_footerMask;
  self->_footerMask = v24;

  [(IMFadeView *)self->_footerMask setTranslatesAutoresizingMaskIntoConstraints:0];
  [(IMFadeView *)self->_footerMask setDirection:1];
  objc_super v26 = +[UIButton buttonWithType:1];
  doneButton = self->_doneButton;
  self->_doneButton = v26;

  [(UIButton *)self->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v28) = 1148846080;
  [(UIButton *)self->_doneButton setContentCompressionResistancePriority:0 forAxis:v28];
  LODWORD(v29) = 1148846080;
  [(UIButton *)self->_doneButton setContentCompressionResistancePriority:1 forAxis:v29];
  v30 = self->_doneButton;
  v31 = AEBundle();
  v32 = [v31 localizedStringForKey:@"Done" value:&stru_1DF0D8 table:0];
  [(UIButton *)v30 setTitle:v32 forState:0];

  [(UIButton *)self->_doneButton addTarget:self action:"_doneButtonTapped:" forControlEvents:64];
  v33 = +[UIFont systemFontOfSize:17.0];
  v34 = [(UIButton *)self->_doneButton titleLabel];
  [v34 setFont:v33];

  [v3 addSubview:self->_doneButton];
  [v3 addSubview:self->_webView];
  [v3 addSubview:self->_headerMask];
  [v3 addSubview:self->_footerMask];
  [(BKFootnoteViewController2 *)self _constructAndActivateConstraints];
  [(BKFootnoteViewController2 *)self _applyCurrentTheme];
  [(BKFootnoteViewController2 *)self _generateAndLoadContent];
  [v3 setNeedsUpdateConstraints];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(BKFootnoteViewController2 *)self _updateDoneButton];

  [(BKFootnoteViewController2 *)self _applyCurrentTheme];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKFootnoteViewController2;
  [(BKFootnoteViewController2 *)&v4 viewDidAppear:a3];
  [(BKFootnoteViewController2 *)self _updateDoneButton];
}

- (void)_doneButtonTapped:(id)a3
{
  objc_super v4 = [(BKFootnoteViewController2 *)self presentingViewController];
  double v5 = [v4 presentedViewController];

  if (v5 == self)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_CD6C0;
    v6[3] = &unk_1DAB88;
    v6[4] = self;
    [(BKFootnoteViewController2 *)self dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)ae_didDismissPopoverContainingThisViewController
{
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained footnoteViewController:self handleUserRequestForFrameToLoadExternalURL:v9 completion:v8];
}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained footnoteViewController:self handleExternalLoadRequest:v8 likelyUserInitiated:v5];
}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  id v5 = a4;
  double v6 = [(BKExpandedContentResource *)self->_resource sourceURL];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if (v7)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    id v9 = [(BKExpandedContentResource *)self->_resource sourceURL];
    unsigned __int8 v10 = [v5 be_isEquivalentToURL:v9 ignoringFragment:1];

    if (v10)
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v8 = [WeakRetained footnoteViewController:self handleInternalLoadRequest:v5];
    }
  }

  return v8;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained footnoteViewController:self handleInternalLoadRequestForNewWindow:v6];
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  webView = self->_webView;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_CDA10;
  v9[3] = &unk_1DB660;
  objc_copyWeak(&v10, &location);
  -[WKWebView evaluateJavaScript:completionHandler:](webView, "evaluateJavaScript:completionHandler:", @"var rect = document.documentElement.getBoundingClientRect(); JSON.stringify([rect.width, rect.height])",
    v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  id v5 = [(WKWebView *)self->_webView scrollView];
  [v5 contentSize];
  double v4 = v3;
  [v5 bounds];
  if (v4 > CGRectGetHeight(v7)) {
    [v5 flashScrollIndicators];
  }
}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
}

- (BOOL)isPageTheme
{
  double v3 = [(BKFootnoteViewController2 *)self theme];
  double v4 = [v3 identifier];
  if ([v4 isEqualToString:kIMThemeIdentifierWhitePageTheme])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(BKFootnoteViewController2 *)self theme];
    CGRect v7 = [v6 identifier];
    if ([v7 isEqualToString:kIMThemeIdentifierSepiaPageTheme])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      unsigned __int8 v8 = [(BKFootnoteViewController2 *)self theme];
      id v9 = [v8 identifier];
      if ([v9 isEqualToString:kIMThemeIdentifierGrayPageTheme])
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        id v10 = [(BKFootnoteViewController2 *)self theme];
        double v11 = [v10 identifier];
        unsigned __int8 v5 = [v11 isEqualToString:kIMThemeIdentifierDefaultPageTheme];
      }
    }
  }
  return v5;
}

- (BOOL)isNightTheme
{
  v2 = self;
  double v3 = [(BKFootnoteViewController2 *)self theme];
  LOBYTE(v2) = [v3 isNight:v2];

  return (char)v2;
}

- (BOOL)isBookTheme
{
  if ([(BKFootnoteViewController2 *)self isPageTheme]) {
    return 1;
  }

  return [(BKFootnoteViewController2 *)self isNightTheme];
}

- (void)im_themeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)BKFootnoteViewController2;
  [(BKFootnoteViewController2 *)&v3 im_themeDidChange];
  [(BKFootnoteViewController2 *)self _applyCurrentTheme];
}

- (void)_footnoteViewControllerReadyForDisplay
{
  [(BKFootnoteViewController2 *)self setReadyForDisplay:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained footnoteViewDidFinishLoad:self];
  }
}

- (void)_footnoteViewControllerPreparationForDisplayFailed:(id)a3
{
  [(BKFootnoteViewController2 *)self setFailedToLoad:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained footnoteViewDidFinishLoad:self];
  }
}

- (void)_didDismissFootnoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained footnoteViewDidDisappear:self];
  }
}

- (void)_presentAlertController:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained footnoteViewController:self presentAlertController:v8 completion:v6];
  }
}

- (void)_constructAndActivateConstraints
{
  v53 = [(BKFootnoteViewController2 *)self view];
  objc_super v3 = [v53 safeAreaLayoutGuide];
  double v4 = [(WKWebView *)self->_webView topAnchor];
  unsigned __int8 v5 = [(UIButton *)self->_doneButton bottomAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5 constant:10.0];
  webViewTopAnchorWhenDoneButtonVisible = self->_webViewTopAnchorWhenDoneButtonVisible;
  self->_webViewTopAnchorWhenDoneButtonVisible = v6;

  id v8 = [(WKWebView *)self->_webView topAnchor];
  id v9 = [v3 topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  webViewTopConstraint = self->_webViewTopConstraint;
  self->_webViewTopConstraint = v10;

  v52 = [(UIButton *)self->_doneButton trailingAnchor];
  v51 = [v3 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:-16.0];
  v54[0] = v50;
  v49 = [(UIButton *)self->_doneButton topAnchor];
  v48 = [v3 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  BOOL v12 = self->_webViewTopAnchorWhenDoneButtonVisible;
  v54[1] = v47;
  v54[2] = v12;
  v46 = [(WKWebView *)self->_webView leftAnchor];
  v45 = [v3 leftAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
  v54[3] = v44;
  v43 = [(WKWebView *)self->_webView rightAnchor];
  v42 = [v3 rightAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-16.0];
  v54[4] = v41;
  v40 = [(WKWebView *)self->_webView bottomAnchor];
  v39 = [v3 bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v54[5] = v38;
  v37 = [(IMFadeView *)self->_headerMask leftAnchor];
  v36 = [v3 leftAnchor];
  objc_super v35 = [v37 constraintEqualToAnchor:v36];
  v54[6] = v35;
  v34 = [(IMFadeView *)self->_headerMask rightAnchor];
  v33 = [v3 rightAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v54[7] = v32;
  v31 = [(IMFadeView *)self->_headerMask heightAnchor];
  v30 = [v31 constraintEqualToConstant:5.0];
  v54[8] = v30;
  double v29 = [(IMFadeView *)self->_headerMask topAnchor];
  double v28 = [(WKWebView *)self->_webView topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v54[9] = v27;
  objc_super v26 = [(IMFadeView *)self->_headerMask heightAnchor];
  id v25 = [v26 constraintEqualToConstant:5.0];
  v54[10] = v25;
  v24 = [(IMFadeView *)self->_footerMask leftAnchor];
  id v23 = [v3 leftAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v54[11] = v22;
  id v13 = [(IMFadeView *)self->_footerMask rightAnchor];
  v14 = [v3 rightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v54[12] = v15;
  v16 = [(IMFadeView *)self->_footerMask bottomAnchor];
  v17 = [v3 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v54[13] = v18;
  v19 = [(IMFadeView *)self->_footerMask heightAnchor];
  double v20 = [v19 constraintEqualToConstant:5.0];
  v54[14] = v20;
  v21 = +[NSArray arrayWithObjects:v54 count:15];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)_applyCurrentTheme
{
  objc_super v3 = [(BKFootnoteViewController2 *)self backgroundColor];
  double v4 = v3;
  if (v3)
  {
    id v22 = v3;
  }
  else
  {
    unsigned __int8 v5 = [(BKFootnoteViewController2 *)self themePage];
    id v22 = [v5 backgroundColorForTraitEnvironment:self];
  }
  id v6 = [(BKFootnoteViewController2 *)self textColor];
  CGRect v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(BKFootnoteViewController2 *)self themePage];
    id v8 = [v9 contentTextColor];
  }
  id v10 = [(BKFootnoteViewController2 *)self doneButton];
  [v10 setTitleColor:v8 forState:0];

  double v11 = [(WKWebView *)self->_webView configuration];
  BOOL v12 = [v11 userContentController];

  if (self->_themeStylesheet) {
    [v12 _removeUserStyleSheet:];
  }
  id v13 = [v22 bc_rgbaString];
  v14 = [v8 bc_rgbaString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" html { -webkit-user-select: none; -webkit-column-width: auto; width: 100%%; height: auto; background-color: %@ !important; }body { margin: 12px 16px !important; padding: auto !important; background-color: %@ !important; color: %@; overflow: visible !important; }",
    v13,
    v13,
  v15 = v14);

  v16 = (_WKUserStyleSheet *)[objc_alloc((Class)_WKUserStyleSheet) initWithSource:v15 forMainFrameOnly:1];
  themeStylesheet = self->_themeStylesheet;
  self->_themeStylesheet = v16;

  [v12 _addUserStyleSheet:self->_themeStylesheet];
  v18 = [(BKFootnoteViewController2 *)self headerMask];
  [v18 setBackgroundColor:v22];

  v19 = [(BKFootnoteViewController2 *)self footerMask];
  [v19 setBackgroundColor:v22];

  double v20 = [(BKFootnoteViewController2 *)self webView];
  [v20 setBackgroundColor:v22];

  v21 = [(BKFootnoteViewController2 *)self viewIfLoaded];
  [v21 setBackgroundColor:v22];
}

- (id)_footNoteTitleHTML
{
  v2 = [(BKExpandedContentResource *)self->_resource title];
  if ([v2 length])
  {
    objc_super v3 = +[NSCharacterSet characterSetWithCharactersInString:@" *"];
    if ([v2 rangeOfCharacterFromSet:v3] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [v3 invertedSet];
      BOOL v4 = [v2 rangeOfCharacterFromSet:v6] == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [v7 addObject:@"<div"];
    if (v4) {
      [v7 addObject:@" class=\"enhanced\""];
    }
    [v7 addObject:@"><span><div role=\"heading\" aria-help=\""];
    id v8 = AEAXLocString(@"footnote.link");
    [v7 addObject:v8];

    [v7 addObject:@"\">"];
    [v7 addObject:v2];
    [v7 addObject:@"</div></span></div>"];
    unsigned __int8 v5 = [v7 componentsJoinedByString:&stru_1DF0D8];
  }
  else
  {
    unsigned __int8 v5 = &stru_1DF0D8;
  }

  return v5;
}

- (void)_generateAndLoadContent
{
  objc_super v3 = AEBundle();
  BOOL v4 = [v3 pathForResource:@"footnote" ofType:@"xhtml"];
  id v20 = 0;
  unsigned __int8 v5 = +[NSString stringWithContentsOfFile:v4 encoding:4 error:&v20];
  id v6 = v20;

  if ([v5 length])
  {
    id v7 = +[NSNumber numberWithDouble:343.0];
    id v8 = [v7 stringValue];
    id v9 = [v5 stringByReplacingOccurrencesOfString:@"metaviewport-width-goes-here" withString:v8];

    id v10 = [(BKFootnoteViewController2 *)self _footNoteTitleHTML];
    double v11 = [v9 stringByReplacingOccurrencesOfString:@"<BKASIDETITLEGOESHERE/>" withString:v10];

    objc_opt_class();
    BOOL v12 = [(BKExpandedContentResource *)self->_resource resource];
    id v13 = BUDynamicCast();
    unsigned __int8 v5 = [v11 stringByReplacingOccurrencesOfString:@"<BKASIDEHTMLGOESHERE/>" withString:v13];

    v14 = [v5 dataUsingEncoding:4];
    webView = self->_webView;
    v16 = [(BKExpandedContentResource *)self->_resource contentType];
    uint64_t v17 = BEUTF8StringEncodingName;
    v18 = [(BKExpandedContentResource *)self->_resource sourceURL];
    id v19 = [(WKWebView *)webView loadData:v14 MIMEType:v16 characterEncodingName:v17 baseURL:v18];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    [(BKFootnoteViewController2 *)self _footnoteViewControllerPreparationForDisplayFailed:v6];
  }
}

- (void)_updateDoneButton
{
  id v3 = [(BKFootnoteViewController2 *)self presentingViewController];

  if (v3)
  {
    BOOL v4 = [(BKFootnoteViewController2 *)self presentationController];
    id v3 = [v4 im_isFullScreen];
  }
  [(NSLayoutConstraint *)self->_webViewTopAnchorWhenDoneButtonVisible setActive:v3];
  uint64_t v5 = v3 ^ 1;
  [(NSLayoutConstraint *)self->_webViewTopConstraint setActive:v5];
  doneButton = self->_doneButton;

  [(UIButton *)doneButton setHidden:v5];
}

- (void)setResource:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_resource, a3);
  uint64_t v5 = [v6 sourceURL];

  if (v5) {
    [(BKFootnoteViewController2 *)self _generateAndLoadContent];
  }
}

- (BOOL)failedToLoad
{
  return self->failedToLoad;
}

- (void)setFailedToLoad:(BOOL)a3
{
  self->failedToLoad = a3;
}

- (BOOL)readyForDisplay
{
  return self->readyForDisplay;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->readyForDisplay = a3;
}

- (BOOL)allowsRemoteInspection
{
  return self->_allowsRemoteInspection;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  self->_allowsRemoteInspection = a3;
}

- (BEFootnotePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (BEFootnoteDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BEFootnoteDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMFadeView)headerMask
{
  return self->_headerMask;
}

- (void)setHeaderMask:(id)a3
{
}

- (IMFadeView)footerMask
{
  return self->_footerMask;
}

- (void)setFooterMask:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (BKExpandedContentResource)resource
{
  return self->_resource;
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return self->_stylesheetSet;
}

- (void)setStylesheetSet:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (_WKUserStyleSheet)themeStylesheet
{
  return self->_themeStylesheet;
}

- (void)setThemeStylesheet:(id)a3
{
}

- (NSLayoutConstraint)webViewTopAnchorWhenDoneButtonVisible
{
  return self->_webViewTopAnchorWhenDoneButtonVisible;
}

- (void)setWebViewTopAnchorWhenDoneButtonVisible:(id)a3
{
}

- (NSLayoutConstraint)webViewTopConstraint
{
  return self->_webViewTopConstraint;
}

- (void)setWebViewTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_webViewTopAnchorWhenDoneButtonVisible, 0);
  objc_storeStrong((id *)&self->_themeStylesheet, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_stylesheetSet, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_footerMask, 0);
  objc_storeStrong((id *)&self->_headerMask, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end