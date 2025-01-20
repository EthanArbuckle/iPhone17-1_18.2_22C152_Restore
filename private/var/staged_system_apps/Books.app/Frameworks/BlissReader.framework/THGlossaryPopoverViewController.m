@interface THGlossaryPopoverViewController
+ (double)toolbarButtonHInset;
+ (id)p_navigationBarArrowBackgroundColor;
+ (id)p_toolbarArrowBackgroundColor;
- (BOOL)glossaryEntryLayoutHasFooter;
- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3;
- (BOOL)isCanvasInteractive;
- (CGRect)glossaryEntryLayoutViewFrame;
- (CGSize)glossaryEntryLayoutContentSize;
- (Class)wpEditorClassOverride;
- (NSString)term;
- (THBookViewController)bookViewController;
- (THGlossaryController)glossaryController;
- (THGlossaryEntryLayout)glossaryEntryLayout;
- (THGlossaryInteractiveCanvasController)icc;
- (THGlossaryPopoverViewController)initWithTerm:(id)a3 glossaryController:(id)a4;
- (THGlossaryPresenting)glossaryPresenting;
- (THGlossaryiOSCanvasViewController)cvc;
- (TSKDocumentRoot)documentRoot;
- (UIButton)textBubble;
- (UILabel)notFoundLabel;
- (UIScrollView)definition;
- (UIToolbar)bottomButtons;
- (UIView)container;
- (UIView)glossaryRootView;
- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3;
- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3;
- (double)glossaryEntryLayoutValueForDistance:(int)a3;
- (id)glossaryEntryLayoutBackgroundColor;
- (id)glossaryEntryLayoutForegroundColor;
- (id)p_glossaryEntryForTerm:(id)a3;
- (int)glossaryEntryLayoutFloatingStyle;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)p_cleanup;
- (void)p_insetScrollerContentEdges;
- (void)p_updateColors;
- (void)p_updateGlossaryDefinitionSynchronous:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBookViewController:(id)a3;
- (void)setBottomButtons:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCvc:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setGlossaryController:(id)a3;
- (void)setGlossaryEntryLayout:(id)a3;
- (void)setGlossaryPresenting:(id)a3;
- (void)setGlossaryRootView:(id)a3;
- (void)setIcc:(id)a3;
- (void)setNotFoundLabel:(id)a3;
- (void)setTerm:(id)a3;
- (void)setTextBubble:(id)a3;
- (void)setTheme:(id)a3;
- (void)showDictionaryEntry;
- (void)showGlossaryIndex;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation THGlossaryPopoverViewController

+ (double)toolbarButtonHInset
{
  return 8.0;
}

- (THGlossaryPopoverViewController)initWithTerm:(id)a3 glossaryController:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)THGlossaryPopoverViewController;
  v6 = [(THGlossaryPopoverViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(THGlossaryPopoverViewController *)v6 setTerm:a3];
    [(THGlossaryPopoverViewController *)v7 setGlossaryController:a4];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    THCanvasCreateWithClass(v7, (id *)&v7->_icc, &v7->_cvc, v8, v9);
    [(THGlossaryInteractiveCanvasController *)[(THGlossaryPopoverViewController *)v7 icc] disableAllGestures];
    [(THGlossaryPopoverViewController *)v7 setTheme:+[IMTheme themeWithIdentifier:kIMThemeIdentifierBlissClassicTheme]];
    [(THGlossaryPopoverViewController *)v7 p_updateGlossaryDefinitionSynchronous:1];
    [(THGlossaryPopoverViewController *)v7 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

- (id)p_glossaryEntryForTerm:(id)a3
{
  v4 = [(THDocumentRoot *)[(THGlossaryController *)[(THGlossaryPopoverViewController *)self glossaryController] documentRoot] glossary];
  if ([(THModelGlossary *)v4 entryCount] < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = [(THModelGlossary *)v4 entryAtIndex:v5];
    if (!objc_msgSend(a3, "compare:options:", objc_msgSend(v6, "term"), 1)) {
      break;
    }
    if (++v5 >= [(THModelGlossary *)v4 entryCount]) {
      return 0;
    }
  }
  return v6;
}

- (void)showGlossaryIndex
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_C1780;
  v2[3] = &unk_456E38;
  v3 = self;
  v4 = [(THGlossaryPopoverViewController *)self bookViewController];
  [(THGlossaryPopoverViewController *)v3 dismissViewControllerAnimated:0 completion:v2];
}

- (TSKDocumentRoot)documentRoot
{
  v2 = [(THGlossaryPopoverViewController *)self glossaryController];

  return (TSKDocumentRoot *)[(THGlossaryController *)v2 documentRoot];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 320.0, 366.0];
  [(THGlossaryPopoverViewController *)self setGlossaryRootView:v3];
  [v3 setAutoresizingMask:18];
  id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(15.0, 94.0, 290.0, 30.0)];
  [(THGlossaryPopoverViewController *)self setNotFoundLabel:v4];
  [v4 setFont:[UIFont fontWithName:@"Baskerville-Italic" size:24.0]];
  [v4 setText:[THBundle localizedStringForKey:@"Not found." value:&stru_46D7E8 table:0]];
  [v4 setHidden:1];
  [v4 setAutoresizingMask:18];
  [v3 addSubview:v4];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7 + -22.0;
  id v10 = [objc_alloc((Class)TSKScrollView) initWithFrame:v9 22.0 v5 v7 + -22.0];
  [(THGlossaryPopoverViewController *)self setDefinition:v10];
  [v10 setOpaque:0];
  [v10 setDelegate:self];
  [v10 setAutoresizingMask:18];
  [v3 addSubview:v10];
  id v11 = objc_alloc((Class)UIView);
  [v10 bounds];
  id v12 = [v11 initWithFrame:];
  [(THGlossaryPopoverViewController *)self setContainer:v12];
  [v10 addSubview:v12];
  id v13 = [(THGlossaryInteractiveCanvasController *)[(THGlossaryPopoverViewController *)self icc] canvasView];
  [v12 addSubview:v13];
  [v13 setFrame:0.0, 22.0, v6, v8];
  [v13 setAutoresizingMask:0];
  [(THGlossaryPopoverViewController *)self setView:v3];

  -[THGlossaryPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 366.0);

  [(THGlossaryPopoverViewController *)self p_updateColors];
}

+ (id)p_toolbarArrowBackgroundColor
{
  return +[UIColor colorWithWhite:0.964705882 alpha:1.0];
}

+ (id)p_navigationBarArrowBackgroundColor
{
  return +[UIColor colorWithWhite:0.976470588 alpha:1.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewDidAppear:](&v5, "viewDidAppear:");
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] viewDidDisappear:v3];
}

- (void)dealloc
{
  [(THGlossaryPopoverViewController *)self p_cleanup];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryPopoverViewController;
  [(THGlossaryPopoverViewController *)&v3 dealloc];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(THGlossaryPopoverViewController *)self p_updateColors];

  [(THGlossaryPopoverViewController *)self p_updateGlossaryDefinitionSynchronous:1];
}

- (void)setTheme:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController setTheme:](&v5, "setTheme:");
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] setTheme:a3];
  [(THGlossaryPopoverViewController *)self p_updateColors];
}

- (void)p_insetScrollerContentEdges
{
  id v3 = [(THGlossaryPopoverViewController *)self navigationController];
  id v4 = [[[self view] window] windowScene].statusBarManager;
  double v5 = 0.0;
  double v6 = 0.0;
  if (([(THGlossaryPopoverViewController *)self _isInPopoverPresentation] & 1) == 0)
  {
    [v4 statusBarHeight];
    double v6 = v7;
  }
  objc_msgSend(objc_msgSend(v3, "navigationBar"), "frameHeight");
  double v9 = v8;
  unsigned int v10 = [v3 isNavigationBarHidden];
  if (([v3 isToolbarHidden] & 1) == 0)
  {
    objc_msgSend(objc_msgSend(v3, "toolbar"), "frameHeight");
    double v5 = v11 + 0.0;
  }
  double v12 = -0.0;
  if (!v10) {
    double v12 = v9;
  }
  double v13 = v6 + v12;
  [(UIScrollView *)[(THGlossaryPopoverViewController *)self definition] contentOffset];
  double v15 = v14;
  double v17 = v16;
  -[UIScrollView setContentInset:]([(THGlossaryPopoverViewController *)self definition], "setContentInset:", v13, 0.0, v5, 0.0);
  -[UIScrollView setScrollIndicatorInsets:]([(THGlossaryPopoverViewController *)self definition], "setScrollIndicatorInsets:", v9, 0.0, v5, 0.0);
  if (v17 - v13 >= -v13) {
    double v18 = v17 - v13;
  }
  else {
    double v18 = -v13;
  }
  v19 = [(THGlossaryPopoverViewController *)self definition];

  -[UIScrollView setContentOffset:](v19, "setContentOffset:", v15, v18);
}

- (void)p_updateGlossaryDefinitionSynchronous:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(THGlossaryPopoverViewController *)self term];
  if ([(NSString *)v5 length]
    && (id v6 = [(THGlossaryPopoverViewController *)self p_glossaryEntryForTerm:v5]) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_C1F44;
    v8[3] = &unk_458F88;
    v8[4] = self;
    if (v3) {
      [v6 synchronouslyLoadInfoOnComplete:v8];
    }
    else {
      [v6 loadInfoOnComplete:v8];
    }
  }
  else
  {
    [(UILabel *)[(THGlossaryPopoverViewController *)self notFoundLabel] setHidden:0];
    double v7 = [(THGlossaryPopoverViewController *)self definition];
    [(UIScrollView *)v7 setHidden:1];
  }
}

- (void)showDictionaryEntry
{
  v2 = [(THGlossaryPopoverViewController *)self glossaryPresenting];
  if (v2)
  {
    BOOL v3 = v2;
    if (objc_opt_respondsToSelector())
    {
      id v4 = self;
      [(THGlossaryPresenting *)v3 replaceGlossaryPopoverWithDictionaryForTerm:[(THGlossaryPopoverViewController *)self term]];
    }
  }
}

- (void)p_cleanup
{
  [(THGlossaryEntryLayout *)[(THGlossaryPopoverViewController *)self glossaryEntryLayout] setLayoutStyleProvider:0];
  [(UIButton *)[(THGlossaryPopoverViewController *)self textBubble] removeFromSuperview];
  [(UIScrollView *)[(THGlossaryPopoverViewController *)self definition] setDelegate:0];
  [(THGlossaryInteractiveCanvasController *)[(THGlossaryPopoverViewController *)self icc] setDelegate:0];
  [(THGlossaryInteractiveCanvasController *)[(THGlossaryPopoverViewController *)self icc] teardown];
  [(THGlossaryiOSCanvasViewController *)[(THGlossaryPopoverViewController *)self cvc] teardown];
  [(THGlossaryPopoverViewController *)self setGlossaryController:0];
  [(THGlossaryPopoverViewController *)self setGlossaryEntryLayout:0];
  [(THGlossaryPopoverViewController *)self setTextBubble:0];
  [(THGlossaryPopoverViewController *)self setIcc:0];
  [(THGlossaryPopoverViewController *)self setCvc:0];
  [(THGlossaryPopoverViewController *)self setNotFoundLabel:0];
  [(THGlossaryPopoverViewController *)self setTerm:0];
  [(THGlossaryPopoverViewController *)self setDefinition:0];
  [(THGlossaryPopoverViewController *)self setContainer:0];
  [(THGlossaryPopoverViewController *)self setGlossaryRootView:0];

  [(THGlossaryPopoverViewController *)self setBottomButtons:0];
}

- (void)p_updateColors
{
  id v3 = [(THGlossaryPopoverViewController *)self themePage];
  if (v3)
  {
    id v4 = v3;
    double v5 = (UIColor *)[v3 contentTextColor];
    id v6 = [v4 backgroundColorForTraitEnvironment:self];
  }
  else
  {
    double v5 = +[UIColor colorWithRed:0.129411765 green:0.22745098 blue:0.411764706 alpha:1.0];
    id v6 = [self glossaryEntryLayoutBackgroundColor];
  }
  double v7 = v6;
  [(UIView *)[(THGlossaryPopoverViewController *)self glossaryRootView] setBackgroundColor:v6];
  double v8 = [(THGlossaryPopoverViewController *)self notFoundLabel];
  [(UILabel *)v8 setBackgroundColor:v7];
  [(UILabel *)v8 setTextColor:v5];
  [(UIView *)[(THGlossaryPopoverViewController *)self container] setBackgroundColor:v7];
  id v9 = [(THGlossaryInteractiveCanvasController *)[(THGlossaryPopoverViewController *)self icc] canvasView];
  id v10 = [v7 CGColor];
  id v11 = [v9 layer];

  [v11 setBackgroundColor:v10];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(THGlossaryPopoverViewController *)self icc];

  [(THInteractiveCanvasController *)v4 scrollViewDidScroll:a3];
}

- (int)glossaryEntryLayoutFloatingStyle
{
  return 0;
}

- (CGRect)glossaryEntryLayoutViewFrame
{
  id v2 = [(THGlossaryPopoverViewController *)self view];

  [v2 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)glossaryEntryLayoutContentSize
{
  [(THGlossaryPopoverViewController *)self glossaryEntryLayoutViewFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)glossaryEntryLayoutValueForDistance:(int)a3
{
  double result = 0.0;
  if (a3 <= 2) {
    return dbl_344580[a3];
  }
  return result;
}

- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3
{
  return dbl_344530[a3];
}

- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3
{
  return dbl_344558[a3];
}

- (id)glossaryEntryLayoutBackgroundColor
{
  double v2 = [self theme].backgroundColorForTraitEnvironment(self);
  if (!v2) {
    double v2 = +[UIColor whiteColor];
  }

  return +[TSUColor colorWithUIColor:v2];
}

- (id)glossaryEntryLayoutForegroundColor
{
  double v2 = [[THGlossaryPopoverViewController theme] contentTextColor];
  if (!v2) {
    double v2 = +[UIColor blackColor];
  }

  return +[TSUColor colorWithUIColor:v2];
}

- (BOOL)glossaryEntryLayoutHasFooter
{
  return 0;
}

- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3
{
  return (a3 - 1) < 2;
}

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
}

- (THGlossaryPresenting)glossaryPresenting
{
  return self->_glossaryPresenting;
}

- (void)setGlossaryPresenting:(id)a3
{
  self->_glossaryPresenting = (THGlossaryPresenting *)a3;
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (void)setBookViewController:(id)a3
{
  self->_bookViewController = (THBookViewController *)a3;
}

- (UIView)glossaryRootView
{
  return self->_glossaryRootView;
}

- (void)setGlossaryRootView:(id)a3
{
}

- (UILabel)notFoundLabel
{
  return self->_notFoundLabel;
}

- (void)setNotFoundLabel:(id)a3
{
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THGlossaryEntryLayout)glossaryEntryLayout
{
  return self->_glossaryEntryLayout;
}

- (void)setGlossaryEntryLayout:(id)a3
{
}

- (THGlossaryInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
}

- (THGlossaryiOSCanvasViewController)cvc
{
  return self->_cvc;
}

- (void)setCvc:(id)a3
{
}

- (UIScrollView)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (UIToolbar)bottomButtons
{
  return self->_bottomButtons;
}

- (void)setBottomButtons:(id)a3
{
}

- (UIButton)textBubble
{
  return self->_textBubble;
}

- (void)setTextBubble:(id)a3
{
}

@end