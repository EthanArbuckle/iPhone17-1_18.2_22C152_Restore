@interface THGlossaryEntryViewController
- (BOOL)allowCopy;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsHyperlinkInteraction;
- (BOOL)editorAllowsMagnifier;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)isCanvasInteractive;
- (BOOL)loading;
- (Class)wpEditorClassOverride;
- (IMTheme)theme;
- (THBookNavigation)bookNavigator;
- (THDocumentRoot)documentRoot;
- (THGlossaryController)glossaryController;
- (THGlossaryEntryInfo)info;
- (THGlossaryEntryViewController)initWithDocumentRoot:(id)a3 bookNavigator:(id)a4;
- (THModalViewControllerProvider)modalViewControllerProvider;
- (THModelGlossaryEntry)entry;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSKDocumentRoot)_documentRoot;
- (TSKScrollView)scrollView;
- (id)unloadCallback;
- (void)_stylizeForTheme;
- (void)dealloc;
- (void)loadEntry:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5;
- (void)loadView;
- (void)p_didLayoutOnComplete:(id)a3;
- (void)p_layoutOnComplete:(id)a3;
- (void)p_setupCanvasForInfo:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5;
- (void)p_unloadEntry;
- (void)scrollToLocation:(int)a3 animated:(BOOL)a4;
- (void)setGlossaryController:(id)a3;
- (void)setLinkHandler:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setModalViewControllerProvider:(id)a3;
- (void)setTheme:(id)a3;
- (void)setUnloadCallback:(id)a3;
- (void)set_documentRoot:(id)a3;
- (void)teardown;
- (void)unloadEntryOnComplete:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation THGlossaryEntryViewController

- (THGlossaryEntryViewController)initWithDocumentRoot:(id)a3 bookNavigator:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THGlossaryEntryViewController;
  v6 = [(THGlossaryEntryViewController *)&v12 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    [(THGlossaryEntryViewController *)v6 set_documentRoot:a3];
    v7->_bookNavigator = (THBookNavigation *)a4;
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    THCanvasCreateWithClass(v7, (id *)&v7->mICC, &v7->mCVC, v8, v9);
    [(TSDInteractiveCanvasController *)[(THGlossaryEntryViewController *)v7 interactiveCanvasController] disableNormalGestures];
    v10 = [(THGlossaryEntryViewController *)v7 interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v10 enableGestureKinds:+[NSArray arrayWithObject:TSWPImmediateSingleTap]];
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THGlossaryEntryViewController interactiveCanvasController](v7, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
    [(THGlossaryEntryViewController *)v7 setExtendedLayoutIncludesOpaqueBars:1];
    [(THGlossaryEntryViewController *)v7 setEdgesForExtendedLayout:15];
    [(THGlossaryEntryViewController *)v7 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (void)teardown
{
  self->_bookNavigator = 0;
  [(THGlossaryInteractiveCanvasController *)self->mICC teardown];
  mCVC = self->mCVC;

  [(THGlossaryiOSCanvasViewController *)mCVC teardown];
}

- (void)dealloc
{
  if (self->mEntry) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m") lineNumber:111 description:@"Unload Entry should be called before dealloc."];
  }
  [(THGlossaryEntryViewController *)self unloadEntryOnComplete:0];

  self->mICC = 0;
  self->mCVC = 0;
  [(TSKScrollView *)self->mScrollView setDelegate:0];

  self->mScrollView = 0;
  id mUnloadCallback = self->mUnloadCallback;
  if (mUnloadCallback)
  {
    _Block_release(mUnloadCallback);
    self->id mUnloadCallback = 0;
  }
  [(THGlossaryEntryViewController *)self set_documentRoot:0];

  self->_theme = 0;
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryViewController;
  [(THGlossaryEntryViewController *)&v4 dealloc];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (void)setLinkHandler:(id)a3
{
}

- (THDocumentRoot)documentRoot
{
  if ([(THGlossaryEntryViewController *)self _documentRoot])
  {
    return (THDocumentRoot *)[(THGlossaryEntryViewController *)self _documentRoot];
  }
  else
  {
    mEntry = self->mEntry;
    return (THDocumentRoot *)[(THModelGlossaryEntry *)mEntry documentRoot];
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)THGlossaryEntryViewController;
  [(THGlossaryEntryViewController *)&v10 loadView];
  [self view].frame;
  double v4 = v3;
  double v6 = v5;
  double y = CGPointZero.y;
  v8 = [objc_alloc((Class)TSKScrollView) initWithFrame:CGPointZero.x, y, v3, v5];
  self->mScrollView = v8;
  [(TSKScrollView *)v8 setAutoresizingMask:18];
  [(TSKScrollView *)self->mScrollView setBackgroundColor:+[UIColor bc_booksBackground]];
  [(TSKScrollView *)self->mScrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
  [self->mScrollView addSubview:[self view]];
  id v9 = [(THGlossaryInteractiveCanvasController *)self->mICC canvasView];
  [v9 setAutoresizingMask:0];
  [v9 setBackgroundColor:[UIColor bc_booksBackground]];
  [(TSKScrollView *)self->mScrollView addSubview:v9];
  [v9 setFrame:0.0 y:v4 v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(THGlossaryiOSCanvasViewController *)self->mCVC viewWillAppear:v3];
  [(THGlossaryEntryViewController *)self _stylizeForTheme];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewDidAppear:](&v5, "viewDidAppear:");
  [(THGlossaryiOSCanvasViewController *)self->mCVC viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  [(THGlossaryiOSCanvasViewController *)self->mCVC viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryEntryViewController;
  -[THGlossaryEntryViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(THGlossaryiOSCanvasViewController *)self->mCVC viewDidDisappear:v3];
}

- (void)setTheme:(id)a3
{
  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    id v5 = a3;

    self->_theme = (IMTheme *)a3;
    [(THGlossaryEntryViewController *)self _stylizeForTheme];
  }
}

- (void)_stylizeForTheme
{
  id v3 = [(IMTheme *)[(THGlossaryEntryViewController *)self theme] backgroundColorForTraitEnvironment:self];
  if (!v3) {
    id v3 = +[UIColor bc_booksBackground];
  }
  if ([(THGlossaryEntryViewController *)self viewIfLoaded])
  {
    [(TSKScrollView *)[(THGlossaryEntryViewController *)self scrollView] setBackgroundColor:v3];
    [self view].backgroundColor = v3;
  }
  id v4 = [(THGlossaryInteractiveCanvasController *)self->mICC canvasView];

  [v4 setBackgroundColor:v3];
}

- (void)p_didLayoutOnComplete:(id)a3
{
  if (self->mLoadCancelled)
  {
    [(THGlossaryEntryViewController *)self p_unloadEntry];
  }
  else
  {
    id v5 = [(THGlossaryInteractiveCanvasController *)self->mICC layoutForInfo:self->mInfo];
    [v5 frame];
    objc_msgSend(objc_msgSend(-[THGlossaryInteractiveCanvasController canvasView](self->mICC, "canvasView"), "canvasLayer"), "setUnscaledSize:", v6, v7);
    [v5 frame];
    -[TSKScrollView setContentSize:](self->mScrollView, "setContentSize:", v8, v9);
    [(TSKScrollView *)self->mScrollView setDelegate:self->mICC];
  }
  [(THGlossaryEntryViewController *)self setLoading:0];
  objc_super v10 = (void (*)(id, THGlossaryEntryViewController *))*((void *)a3 + 2);

  v10(a3, self);
}

- (void)p_layoutOnComplete:(id)a3
{
  if (!self->mLoadCancelled)
  {
    id v5 = [(THDocumentRoot *)[(THGlossaryController *)[(THGlossaryEntryViewController *)self glossaryController] documentRoot] accessController];
    id v6 = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_C911C;
    v8[3] = &unk_456DE0;
    v8[4] = self;
    [v5 performRead:v8];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C9130;
  v7[3] = &unk_456E88;
  v7[4] = self;
  v7[5] = a3;
  [+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue") addOperation:+[NSBlockOperation blockOperationWithBlock:v7]];
}

- (void)p_setupCanvasForInfo:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5
{
  if (self->mLoadCancelled)
  {
    [(THGlossaryEntryViewController *)self p_unloadEntry];
    [(THGlossaryEntryViewController *)self setLoading:0];
    double v7 = (void (*)(id, THGlossaryEntryViewController *))*((void *)a5 + 2);
    v7(a5, self);
  }
  else
  {
    mEntrdouble y = self->mEntry;
    if (mEntry != [a3 entry]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THGlossaryEntryViewController p_setupCanvasForInfo:withLayoutStyleProvider:onComplete:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"] lineNumber:326 description:@"Must unload a glossary entry before re-loading."];
    }
    -[TSKScrollView setContentOffset:](self->mScrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    self->mInfo = (THGlossaryEntryInfo *)a3;
    [(THGlossaryInteractiveCanvasController *)self->mICC setInfosToDisplay:+[NSArray arrayWithObject:a3]];
    [self view].frame;
    double v12 = v11;
    [a4 glossaryEntryLayoutContentSize];
    [(THGlossaryInteractiveCanvasController *)self->mICC setViewScale:v12 / v13];
    [(THGlossaryInteractiveCanvasController *)self->mICC viewScale];
    if (v14 != 1.0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController p_setupCanvasForInfo:withLayoutStyleProvider:onComplete:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m") lineNumber:337 description:@"Expected glossary canvas viewScale to be 1."];
    }
    [(THGlossaryInteractiveCanvasController *)self->mICC recreateAllLayoutsAndReps];
    objc_opt_class();
    [(THGlossaryInteractiveCanvasController *)self->mICC layoutForInfo:self->mInfo];
    [(id)TSUDynamicCast() setLayoutStyleProvider:a4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_C93E8;
    v15[3] = &unk_456E88;
    v15[4] = self;
    v15[5] = a5;
    [+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue") addOperation:+[NSBlockOperation blockOperationWithBlock:v15]];
  }
}

- (void)loadEntry:(id)a3 withLayoutStyleProvider:(id)a4 onComplete:(id)a5
{
  mEntrdouble y = self->mEntry;
  if (mEntry == a3)
  {
    double v11 = (void (*)(id, THGlossaryEntryViewController *))*((void *)a5 + 2);
    v11(a5, self);
  }
  else if (mEntry)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryViewController loadEntry:withLayoutStyleProvider:onComplete:]");
    objc_super v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryViewController.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:365 description:@"Must unload a glossary entry before re-loading."];
  }
  else
  {
    [(THGlossaryEntryViewController *)self setLoading:1];
    self->mEntrdouble y = (THModelGlossaryEntry *)a3;
    [(THGlossaryInteractiveCanvasController *)self->mICC setDelegate:self];
    double v14 = _Block_copy(a5);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_C958C;
    v15[3] = &unk_459038;
    v15[4] = self;
    v15[5] = a4;
    void v15[6] = v14;
    [a3 loadInfoOnComplete:v15];
  }
}

- (void)p_unloadEntry
{
  self->mInfo = 0;
  if (self->mEntry)
  {
    [(THGlossaryInteractiveCanvasController *)self->mICC setInfosToDisplay:+[NSArray array]];
    self->mEntrdouble y = 0;
  }
  if ([(THGlossaryEntryViewController *)self unloadCallback])
  {
    id v3 = [(THGlossaryEntryViewController *)self unloadCallback];
    v3[2](v3, self);
    _Block_release(self->mUnloadCallback);
    self->id mUnloadCallback = 0;
  }
  self->mLoadCancelled = 0;
}

- (void)unloadEntryOnComplete:(id)a3
{
  id mUnloadCallback = self->mUnloadCallback;
  if (mUnloadCallback) {
    _Block_release(mUnloadCallback);
  }
  self->id mUnloadCallback = _Block_copy(a3);
  if ([(THGlossaryEntryViewController *)self loading])
  {
    self->mLoadCancelled = 1;
  }
  else
  {
    [(THGlossaryEntryViewController *)self p_unloadEntry];
  }
}

- (void)scrollToLocation:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 != 2)
  {
    if (a3 != 1) {
      return;
    }
    p_mScrollView = &self->mScrollView;
    [(TSKScrollView *)self->mScrollView contentOffset];
    if (v7 == 0.0) {
      return;
    }
    double v8 = v6;
    double v9 = 0.0;
    goto LABEL_8;
  }
  p_mScrollView = &self->mScrollView;
  [(TSKScrollView *)self->mScrollView contentOffset];
  double v8 = v10;
  double v12 = v11;
  [(TSKScrollView *)*p_mScrollView contentSize];
  double v14 = v13;
  [(TSKScrollView *)*p_mScrollView bounds];
  double v9 = 0.0;
  if (v14 - v15 >= 0.0) {
    double v9 = v14 - v15;
  }
  if (v12 != v9)
  {
LABEL_8:
    v16 = *p_mScrollView;
    -[TSKScrollView setContentOffset:animated:](v16, "setContentOffset:animated:", v4, v8, v9);
  }
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)allowCopy
{
  v2 = [(THDocumentRoot *)[(THGlossaryController *)[(THGlossaryEntryViewController *)self glossaryController] documentRoot] bookDescription];

  return [(THBookDescription *)v2 allowCopy];
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (BOOL)loading
{
  return self->mLoading;
}

- (void)setLoading:(BOOL)a3
{
  self->mLoading = a3;
}

- (id)unloadCallback
{
  return self->mUnloadCallback;
}

- (void)setUnloadCallback:(id)a3
{
  self->id mUnloadCallback = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return (TSDInteractiveCanvasController *)self->mICC;
}

- (TSKScrollView)scrollView
{
  return self->mScrollView;
}

- (THGlossaryEntryInfo)info
{
  return self->mInfo;
}

- (THModalViewControllerProvider)modalViewControllerProvider
{
  return self->_modalViewControllerProvider;
}

- (void)setModalViewControllerProvider:(id)a3
{
  self->_modalViewControllerProvider = (THModalViewControllerProvider *)a3;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (THBookNavigation)bookNavigator
{
  return self->_bookNavigator;
}

- (TSKDocumentRoot)_documentRoot
{
  return self->__documentRoot;
}

- (void)set_documentRoot:(id)a3
{
}

@end