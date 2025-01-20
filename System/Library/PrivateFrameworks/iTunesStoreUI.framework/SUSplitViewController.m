@interface SUSplitViewController
+ (BOOL)isValidSplitPositionValue:(id)a3;
+ (BOOL)isValidSplitTypeString:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isSkLoaded;
- (BOOL)isVertical;
- (BOOL)shouldExcludeFromNavigationHistory;
- (BOOL)usesSharedPlaceholder;
- (BOOL)viewIsReady;
- (NSString)mainTitle;
- (NSURL)displayedURL;
- (SUShadow)splitShadow;
- (SUSplitViewController)init;
- (UIViewController)firstViewController;
- (UIViewController)secondViewController;
- (double)minimumPaneSize;
- (double)splitPosition;
- (id)_newGradientWithValue:(id)a3;
- (id)_newViewControllerFromDictionary:(id)a3;
- (id)_splitView;
- (id)copyArchivableContext;
- (id)copyChildViewControllersForReason:(int64_t)a3;
- (id)copyScriptViewController;
- (id)newRotationController;
- (id)splitPositionString;
- (id)splitTypeString;
- (id)storePageProtocol;
- (int64_t)layoutType;
- (void)_loadingDidChangeNotification:(id)a3;
- (void)_navigationItemDidChangeNotification:(id)a3;
- (void)_reloadLoadingState;
- (void)_reloadTitle;
- (void)_reloadView;
- (void)_reloadViewController:(id)a3 fromDictionary:(id)a4;
- (void)_reloadWithStorePageDictionary:(id)a3;
- (void)_setPlaceholderVisible:(BOOL)a3;
- (void)_setStructuredPage:(id)a3;
- (void)_setViewController:(id *)a3 toValue:(id)a4;
- (void)addChildViewController:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)reloadWithStorePage:(id)a3 forURL:(id)a4;
- (void)removeChildViewController:(id)a3;
- (void)restoreArchivableContext:(id)a3;
- (void)setDisplayedURL:(id)a3;
- (void)setFirstViewController:(id)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setMainTitle:(id)a3;
- (void)setMinimumPaneSize:(double)a3;
- (void)setSecondViewController:(id)a3;
- (void)setSkLoading:(BOOL)a3;
- (void)setSplitPosition:(double)a3;
- (void)setSplitPositionAndLayoutTypeFromValue:(id)a3;
- (void)setSplitShadow:(id)a3;
- (void)setSplitTypeString:(id)a3;
- (void)setUsesSharedPlaceholder:(BOOL)a3;
- (void)setVertical:(BOOL)a3;
- (void)setViewIsReady:(BOOL)a3;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
@end

@implementation SUSplitViewController

- (SUSplitViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUSplitViewController;
  v2 = [(SUViewController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(SUShadow);
    v2->_splitShadow = v3;
    -[SUShadow setOffset:](v3, "setOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(SUShadow *)v2->_splitShadow setOpacity:0.670000017];
    [(SUShadow *)v2->_splitShadow setRadius:5.0];
    v2->_usesSharedPlaceholder = 1;
    v2->_viewIsReady = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUViewControllerLoadingDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"SUViewControllerNavigationItemDidChangeNotification" object:0];
  if (self->_firstViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_firstViewController = 0;
  }
  if (self->_placeholderViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_placeholderViewController = 0;
  }
  if (self->_secondViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_secondViewController = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SUSplitViewController;
  [(SUViewController *)&v4 dealloc];
}

- (void)addChildViewController:(id)a3
{
  objc_super v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__loadingDidChangeNotification_ name:@"SUViewControllerLoadingDidChangeNotification" object:a3];
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__navigationItemDidChangeNotification_, @"SUViewControllerNavigationItemDidChangeNotification", objc_msgSend(a3, "navigationItem"));
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  [(SUSplitViewController *)&v6 addChildViewController:a3];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SUSplitViewController;
  unsigned int v7 = -[SUViewController canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_);
  if (v7)
  {
    if (sel_isEqual(a3, sel_storePage_finishedWithSuccess_)
      && (uint64_t v8 = [(SUSplitViewController *)self nextResponder]) != 0)
    {
      v9 = (void *)v8;
      do
      {
        int v10 = [v9 canPerformAction:a3 withSender:a4];
        uint64_t v11 = [v9 nextResponder];
        if (!v11) {
          break;
        }
        v9 = (void *)v11;
      }
      while (!v10);
      LOBYTE(v7) = v10 ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (id)copyArchivableContext
{
  v13.receiver = self;
  v13.super_class = (Class)SUSplitViewController;
  id v3 = [(SUViewController *)&v13 copyArchivableContext];
  [v3 setType:5];
  if (![(SUSplitViewController *)self shouldExcludeFromNavigationHistory])
  {
    id v4 = [(UIViewController *)self->_firstViewController copyArchivableContext];
    objc_super v5 = v4;
    if (v4 && [v4 type]) {
      [v3 setValue:v5 forMetadataKey:@"first"];
    }

    id v6 = [(UIViewController *)self->_secondViewController copyArchivableContext];
    unsigned int v7 = v6;
    if (v6 && [v6 type]) {
      [v3 setValue:v7 forMetadataKey:@"second"];
    }

    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[SUSplitViewController layoutType](self, "layoutType")), @"layoutType");
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUSplitViewController mainTitle](self, "mainTitle"), @"mainTitle");
    uint64_t v8 = NSNumber;
    [(SUSplitViewController *)self minimumPaneSize];
    *(float *)&double v9 = v9;
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(v8, "numberWithFloat:", v9), @"minPaneSize");
    int v10 = NSNumber;
    [(SUSplitViewController *)self splitPosition];
    *(float *)&double v11 = v11;
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(v10, "numberWithFloat:", v11), @"splitPosition");
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUSplitViewController splitShadow](self, "splitShadow"), @"shadow");
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SUSplitViewController usesSharedPlaceholder](self, "usesSharedPlaceholder")), @"sharedLoading");
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(NSNumber, "numberWithBool:", -[SUSplitViewController isVertical](self, "isVertical")), @"vertical");
  }
  return v3;
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  return -[SUViewController copyChildViewControllersForReason:](&v6, sel_copyChildViewControllersForReason_);
}

- (id)copyScriptViewController
{
  uint64_t v3 = objc_alloc_init(SUScriptSplitViewController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (BOOL)isSkLoaded
{
  firstViewController = self->_firstViewController;
  if (!firstViewController || (BOOL v4 = [(UIViewController *)firstViewController isSkLoaded]))
  {
    secondViewController = self->_secondViewController;
    if (secondViewController)
    {
      LOBYTE(v4) = [(UIViewController *)secondViewController isSkLoaded];
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SUSplitViewController;
  [(SUViewController *)&v7 loadView];
  uint64_t v3 = (void *)[(SUSplitViewController *)self view];
  id v4 = [(SUSplitViewController *)self _splitView];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [(SUSplitViewController *)self _reloadView];
  [v3 addSubview:v4];
  placeholderViewController = self->_placeholderViewController;
  if (placeholderViewController)
  {
    objc_super v6 = (void *)[(SUPlaceholderViewController *)placeholderViewController view];
    [v3 bounds];
    objc_msgSend(v6, "setFrame:");
    [v3 addSubview:v6];
  }
}

- (void)removeChildViewController:(id)a3
{
  objc_super v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"SUViewControllerLoadingDidChangeNotification" object:a3];
  objc_msgSend(v5, "removeObserver:name:object:", self, @"SUViewControllerNavigationItemDidChangeNotification", objc_msgSend(a3, "navigationItem"));
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  [(SUSplitViewController *)&v6 removeChildViewController:a3];
}

- (void)restoreArchivableContext:(id)a3
{
  objc_super v5 = (void *)[a3 valueForMetadataKey:@"first"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = (void *)[v5 copyViewController];
    [(SUSplitViewController *)self setFirstViewController:v6];
  }
  objc_super v7 = (void *)[a3 valueForMetadataKey:@"second"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)[v7 copyViewController];
    [(SUSplitViewController *)self setSecondViewController:v8];
  }
  double v9 = (void *)[a3 valueForMetadataKey:@"layoutType"];
  if (objc_opt_respondsToSelector()) {
    -[SUSplitViewController setLayoutType:](self, "setLayoutType:", (int)[v9 intValue]);
  }
  uint64_t v10 = [a3 valueForMetadataKey:@"mainTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUSplitViewController *)self setMainTitle:v10];
  }
  double v11 = (void *)[a3 valueForMetadataKey:@"splitPosition"];
  if (objc_opt_respondsToSelector())
  {
    [v11 floatValue];
    [(SUSplitViewController *)self setSplitPosition:v12];
  }
  uint64_t v13 = [a3 valueForMetadataKey:@"shadow"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUSplitViewController *)self setSplitShadow:v13];
  }
  v14 = (void *)[a3 valueForMetadataKey:@"sharedLoading"];
  if (objc_opt_respondsToSelector()) {
    -[SUSplitViewController setUsesSharedPlaceholder:](self, "setUsesSharedPlaceholder:", [v14 BOOLValue]);
  }
  v15 = (void *)[a3 valueForMetadataKey:@"vertical"];
  if (objc_opt_respondsToSelector()) {
    -[SUSplitViewController setVertical:](self, "setVertical:", [v15 BOOLValue]);
  }
  v16.receiver = self;
  v16.super_class = (Class)SUSplitViewController;
  [(SUViewController *)&v16 restoreArchivableContext:a3];
}

- (void)setSkLoading:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUSplitViewController *)self isSkLoaded] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SUSplitViewController;
    [(SUViewController *)&v5 setSkLoading:v3];
    [(SUSplitViewController *)self _setPlaceholderVisible:v3];
    [(SUPlaceholderViewController *)self->_placeholderViewController setSkLoading:v3];
  }
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  v4.receiver = self;
  v4.super_class = (Class)SUSplitViewController;
  if ([(SUViewController *)&v4 shouldExcludeFromNavigationHistory]
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([(UIViewController *)self->_firstViewController shouldExcludeFromNavigationHistory] & 1) != 0)
  {
    return 1;
  }
  if (objc_opt_respondsToSelector()) {
    return [(UIViewController *)self->_secondViewController shouldExcludeFromNavigationHistory];
  }
  return 0;
}

- (id)newRotationController
{
  BOOL v3 = [SUSplitViewRotationController alloc];

  return [(SURotationController *)v3 initWithViewController:self];
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_alloc_init(SUStructuredPage);
    if ([(SUStructuredPage *)v8 loadFromDictionary:a3])
    {
      [(SUSplitViewController *)self setDisplayedURL:a4];
      [(SUSplitViewController *)self setMainTitle:[(SUStructuredPage *)v8 title]];
      [(SUSplitViewController *)self _setStructuredPage:v8];
      [(SUSplitViewController *)self _reloadWithStorePageDictionary:a3];
    }
    objc_super v7 = v8;
  }
  else
  {
    objc_super v7 = 0;
  }
}

- (id)storePageProtocol
{
  return [(SUStructuredPage *)self->_structuredPage protocol];
}

+ (BOOL)isValidSplitPositionValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  if (([a3 isEqualToString:@"first"] & 1) != 0
    || ([a3 isEqualToString:@"second"] & 1) != 0
    || ([a3 hasSuffix:@"px"] & 1) != 0
    || (int v4 = [a3 hasSuffix:@"%"]) != 0)
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (BOOL)isValidSplitTypeString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 isEqualToString:@"horizontal"]) {
    return 1;
  }

  return [a3 isEqualToString:@"vertical"];
}

- (void)setSplitPositionAndLayoutTypeFromValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = a3;
  }
  else
  {
    if ([a3 isEqualToString:@"first"])
    {
      uint64_t v7 = 2;
      goto LABEL_9;
    }
    if ([a3 isEqualToString:@"second"])
    {
      uint64_t v7 = 3;
      goto LABEL_9;
    }
    if (![a3 hasSuffix:@"px"])
    {
      if (![a3 hasSuffix:@"%"]) {
        return;
      }
      float v6 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "length") - 1), "intValue")/ 100.0;
      uint64_t v7 = 1;
      goto LABEL_4;
    }
    id v5 = (id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "length") - 2);
  }
  [v5 floatValue];
  uint64_t v7 = 0;
LABEL_4:
  [(SUSplitViewController *)self setSplitPosition:v6];
LABEL_9:

  [(SUSplitViewController *)self setLayoutType:v7];
}

- (void)setSplitTypeString:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [a3 isEqualToString:@"horizontal"];
    if ((v5 & 1) != 0 || [a3 isEqualToString:@"vertical"])
    {
      [(SUSplitViewController *)self setVertical:v5 ^ 1u];
    }
  }
}

- (id)splitPositionString
{
  switch([(SUSplitViewController *)self layoutType])
  {
    case 0:
      BOOL v3 = NSString;
      [(SUSplitViewController *)self splitPosition];
      id result = (id)objc_msgSend(v3, "stringWithFormat:", @"%.0fpx", v4);
      break;
    case 1:
      float v6 = NSString;
      [(SUSplitViewController *)self splitPosition];
      id result = (id)objc_msgSend(v6, "stringWithFormat:", @"%.0f%%", floor(v7 * 100.0));
      break;
    case 2:
      id result = @"first";
      break;
    case 3:
      id result = @"second";
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)splitTypeString
{
  if ([(SUSplitViewController *)self isVertical]) {
    return @"vertical";
  }
  else {
    return @"horizontal";
  }
}

- (BOOL)isVertical
{
  id v2 = [(SUSplitViewController *)self _splitView];

  return [v2 isVertical];
}

- (int64_t)layoutType
{
  id v2 = [(SUSplitViewController *)self _splitView];

  return [v2 layoutType];
}

- (double)minimumPaneSize
{
  id v2 = [(SUSplitViewController *)self _splitView];

  [v2 minimumPaneSize];
  return result;
}

- (void)setFirstViewController:(id)a3
{
}

- (void)setLayoutType:(int64_t)a3
{
  id v4 = [(SUSplitViewController *)self _splitView];

  [v4 setLayoutType:a3];
}

- (void)setMainTitle:(id)a3
{
  mainTitle = self->_mainTitle;
  if (mainTitle != a3)
  {

    self->_mainTitle = (NSString *)a3;
    [(SUSplitViewController *)self _reloadTitle];
  }
}

- (void)setMinimumPaneSize:(double)a3
{
  id v4 = [(SUSplitViewController *)self _splitView];

  [v4 setMinimumPaneSize:a3];
}

- (void)setSecondViewController:(id)a3
{
}

- (void)setSplitPosition:(double)a3
{
  id v4 = [(SUSplitViewController *)self _splitView];

  [v4 setSplitPosition:a3];
}

- (void)setSplitShadow:(id)a3
{
  splitShadow = self->_splitShadow;
  if (splitShadow != a3)
  {

    self->_splitShadow = (SUShadow *)[a3 copy];
    [(SUSplitViewController *)self _reloadView];
  }
}

- (void)setUsesSharedPlaceholder:(BOOL)a3
{
  if (self->_usesSharedPlaceholder != a3)
  {
    self->_usesSharedPlaceholder = a3;
    [(SUSplitViewController *)self _reloadLoadingState];
  }
}

- (void)setVertical:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUSplitViewController *)self _splitView];

  [v4 setVertical:v3];
}

- (double)splitPosition
{
  id v2 = [(SUSplitViewController *)self _splitView];

  [v2 splitPosition];
  return result;
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (!a4) {
    [(UIViewController *)self dismissAnimated:1];
  }
}

- (void)_loadingDidChangeNotification:(id)a3
{
  id v4 = (UIViewController *)[a3 object];
  if (v4 == self->_firstViewController || v4 == self->_secondViewController)
  {
    if (([(SUSplitViewController *)self layoutType] & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [(SUSplitViewController *)self _reloadView];
    }
    [(SUSplitViewController *)self _reloadLoadingState];
  }
}

- (void)_navigationItemDidChangeNotification:(id)a3
{
  id v4 = (UINavigationItem *)[a3 object];
  if (v4 == [(UIViewController *)self->_firstViewController navigationItem]
    || v4 == [(UIViewController *)self->_secondViewController navigationItem])
  {
    [(SUSplitViewController *)self _reloadTitle];
  }
}

- (id)_newGradientWithValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [SUGradient alloc];
    return [(SUGradient *)v4 initWithPropertyList:a3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v6 = [objc_alloc(MEMORY[0x263F1C550]) initWithStyleString:a3]) != 0)
    {
      double v7 = (void *)v6;
      uint64_t v8 = +[SUGradient gradientWithColor:v6];

      return v8;
    }
    else
    {
      return 0;
    }
  }
}

- (id)_newViewControllerFromDictionary:(id)a3
{
  int v5 = objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  uint64_t v6 = (void *)[v5 copyScriptProperties];
  double v7 = (void *)[a3 objectForKey:@"loads-progressively"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = [v7 BOOLValue];
  }
  else {
    uint64_t v8 = 0;
  }
  [v6 setShouldLoadProgressively:v8];
  double v9 = (void *)[a3 objectForKey:@"scrolling-enabled"];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setScrollingDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);
  }
  id v10 = -[SUSplitViewController _newGradientWithValue:](self, "_newGradientWithValue:", [a3 objectForKey:@"background-color"]);
  [v6 setPlaceholderBackgroundGradient:v10];

  [v5 setScriptProperties:v6];
  return v5;
}

- (void)_reloadLoadingState
{
  if ([(SUSplitViewController *)self usesSharedPlaceholder])
  {
    if ([(UIViewController *)self->_firstViewController isSkLoaded]) {
      uint64_t v3 = [(UIViewController *)self->_secondViewController isSkLoaded] ^ 1;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  [(SUSplitViewController *)self setSkLoading:v3];
  BOOL v4 = [(SUSplitViewController *)self viewIsReady];
  if ((v3 & 1) == 0 && !v4)
  {
    [(SUSplitViewController *)self _reloadView];
    [(SUSplitViewController *)self setViewIsReady:1];
  }
}

- (void)_reloadTitle
{
  uint64_t v3 = [(SUSplitViewController *)self mainTitle];
  if (!v3)
  {
    firstViewController = self->_firstViewController;
    if (!firstViewController) {
      firstViewController = self->_secondViewController;
    }
    uint64_t v3 = [(UINavigationItem *)[(UIViewController *)firstViewController navigationItem] title];
  }

  [(SUViewController *)self setTitle:v3];
}

- (void)_reloadView
{
  id v3 = [(SUSplitViewController *)self _splitView];
  int64_t v4 = [(SUSplitViewController *)self layoutType];
  if (v4 == 3)
  {
    [v3 bounds];
    double v11 = v10;
    double v13 = v12;
    [(UIViewController *)self->_secondViewController minimumViewSize];
    double v15 = v14;
    double v17 = v16;
    BOOL v18 = [(SUSplitViewController *)self isVertical];
    double v9 = v11 - v15;
    if (v18) {
      double v9 = v13 - v17;
    }
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [(UIViewController *)self->_firstViewController minimumViewSize];
    double v6 = v5;
    double v8 = v7;
    if ([(SUSplitViewController *)self isVertical]) {
      double v9 = v8;
    }
    else {
      double v9 = v6;
    }
LABEL_8:
    [v3 setSplitPosition:v9];
  }
  v19 = [(UIViewController *)self->_firstViewController view];
  v20 = [(UIViewController *)self->_secondViewController view];
  [v3 setFirstView:v19];
  [v3 setSecondView:v20];
  [(CALayer *)[(UIView *)v19 layer] setShadowOpacity:0.0];
  [(CALayer *)[(UIView *)v20 layer] setShadowOpacity:0.0];
  splitShadow = self->_splitShadow;
  if (splitShadow)
  {
    [(SUShadow *)splitShadow radius];
    if (v22 > 0.00000011920929
      || ([(SUShadow *)self->_splitShadow radius], v19 = v20, v23 < -0.00000011920929))
    {
      [v3 bringSubviewToFront:v19];
      [(SUShadow *)self->_splitShadow applyToLayer:[(UIView *)v19 layer]];
    }
  }

  [v3 layoutIfNeeded];
}

- (void)_reloadViewController:(id)a3 fromDictionary:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a4 objectForKey:@"contents"];
  if (!v7) {
    return;
  }
  double v8 = (void *)v7;
  double v9 = (void *)[a4 objectForKey:@"type"];
  if (!v9 || (double v10 = v9, [v9 isEqualToString:@"html-section"]))
  {
    double v11 = [(SUSplitViewController *)self displayedURL];
    [a3 reloadWithStorePage:v8 ofType:1 forURL:v11];
    return;
  }
  if ([v10 isEqualToString:@"plist-section"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = (uint64_t)v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v12 = [v8 dataUsingEncoding:4]) == 0)
      {
LABEL_29:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = objc_alloc_init(SUStructuredPage);
          [(SUStructuredPage *)v24 loadFromDictionary:v8];
          objc_msgSend(a3, "reloadWithStorePage:ofType:forURL:", v24, 0, -[SUSplitViewController displayedURL](self, "displayedURL"));
        }
        return;
      }
    }
    v26 = 0;
    double v8 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:v12 options:0 format:0 error:&v26];
    if (v26)
    {
      BOOL v18 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v20 &= 2u;
      }
      if (v20)
      {
        uint64_t v21 = objc_opt_class();
        int v27 = 138412546;
        uint64_t v28 = v21;
        __int16 v29 = 2112;
        v30 = v26;
        LODWORD(v25) = 22;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          double v23 = (void *)v22;
          objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v27, v25);
          free(v23);
          SSFileLog();
        }
      }
    }
    goto LABEL_29;
  }
  double v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v27 = 138412546;
    uint64_t v28 = objc_opt_class();
    __int16 v29 = 2112;
    v30 = v10;
    LODWORD(v25) = 22;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      double v17 = (void *)v16;
      objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v27, v25);
      free(v17);
      SSFileLog();
    }
  }
}

- (void)_reloadWithStorePageDictionary:(id)a3
{
  -[SUSplitViewController setSplitPositionAndLayoutTypeFromValue:](self, "setSplitPositionAndLayoutTypeFromValue:", [a3 objectForKey:@"split-position"]);
  -[SUSplitViewController setSplitTypeString:](self, "setSplitTypeString:", [a3 objectForKey:@"split-type"]);

  self->_placeholderGradient = (SUGradient *)-[SUSplitViewController _newGradientWithValue:](self, "_newGradientWithValue:", [a3 objectForKey:@"background-color"]);
  if ([(SUStorePageProtocol *)[(SUStructuredPage *)self->_structuredPage protocol] shouldDisplayInOverlay])
  {
    double v5 = (void *)[(SUSplitViewController *)self view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    +[SUOverlayViewController defaultOverlaySize];
    objc_msgSend(v5, "setFrame:", v7, v9, v10, v11);
  }
  [(SUSplitViewController *)self setViewIsReady:0];
  uint64_t v12 = [a3 objectForKey:@"first-section"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(SUSplitViewController *)self _newViewControllerFromDictionary:v12];
    [(SUSplitViewController *)self setFirstViewController:v13];
    [(SUSplitViewController *)self _reloadViewController:v13 fromDictionary:v12];
  }
  uint64_t v14 = [a3 objectForKey:@"second-section"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [(SUSplitViewController *)self _newViewControllerFromDictionary:v14];
    [(SUSplitViewController *)self setSecondViewController:v15];
    [(SUSplitViewController *)self _reloadViewController:v15 fromDictionary:v14];
  }

  [(SUSplitViewController *)self _reloadLoadingState];
}

- (void)_setPlaceholderVisible:(BOOL)a3
{
  placeholderViewController = self->_placeholderViewController;
  if (a3)
  {
    if (!placeholderViewController)
    {
      double v5 = (SUPlaceholderViewController *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
      self->_placeholderViewController = v5;
      [(SUPlaceholderViewController *)v5 setBackgroundGradient:self->_placeholderGradient];
      [(SUViewController *)self->_placeholderViewController setClientInterface:[(SUViewController *)self clientInterface]];
      [(SUSplitViewController *)self addChildViewController:self->_placeholderViewController];
      if ([(SUSplitViewController *)self isViewLoaded])
      {
        double v6 = (void *)[(SUSplitViewController *)self view];
        [(SUViewController *)self->_placeholderViewController viewWillAppear:0];
        double v7 = (void *)[(SUPlaceholderViewController *)self->_placeholderViewController view];
        [v6 bounds];
        objc_msgSend(v7, "setFrame:");
        [v6 addSubview:v7];
        double v8 = self->_placeholderViewController;
        [(SUViewController *)v8 viewDidAppear:0];
      }
    }
  }
  else
  {
    if ([(SUPlaceholderViewController *)placeholderViewController isViewLoaded])
    {
      [(SUViewController *)self->_placeholderViewController viewWillDisappear:0];
      objc_msgSend((id)-[SUPlaceholderViewController view](self->_placeholderViewController, "view"), "removeFromSuperview");
      [(SUViewController *)self->_placeholderViewController viewDidDisappear:0];
    }
    if (self->_placeholderViewController)
    {
      -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

      self->_placeholderViewController = 0;
    }
  }
}

- (void)_setStructuredPage:(id)a3
{
  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    self->_structuredPage = (SUStructuredPage *)a3;
    [(SUViewController *)self storePageProtocolDidChange];
  }
}

- (void)_setViewController:(id *)a3 toValue:(id)a4
{
  if (*a3 != a4)
  {
    id v7 = *a3;

    *a3 = a4;
    if (v7) {
      [(SUSplitViewController *)self removeChildViewController:v7];
    }
    if ([(SUSplitViewController *)self isViewLoaded])
    {
      [v7 viewWillDisappear:0];
      [*a3 viewWillAppear:0];
      [(SUSplitViewController *)self _reloadView];
      [*a3 viewDidAppear:0];
      [v7 viewDidDisappear:0];
    }
    if (*a3) {
      -[SUSplitViewController addChildViewController:](self, "addChildViewController:");
    }
  }
}

- (id)_splitView
{
  id result = self->_splitView;
  if (!result)
  {
    int64_t v4 = objc_alloc_init(SUSplitView);
    self->_splitView = v4;
    [(SUSplitView *)v4 setAutoresizingMask:18];
    return self->_splitView;
  }
  return result;
}

- (NSURL)displayedURL
{
  return self->_displayedURL;
}

- (void)setDisplayedURL:(id)a3
{
}

- (BOOL)viewIsReady
{
  return self->_viewIsReady;
}

- (void)setViewIsReady:(BOOL)a3
{
  self->_viewIsReady = a3;
}

- (UIViewController)firstViewController
{
  return self->_firstViewController;
}

- (NSString)mainTitle
{
  return self->_mainTitle;
}

- (UIViewController)secondViewController
{
  return self->_secondViewController;
}

- (SUShadow)splitShadow
{
  return self->_splitShadow;
}

- (BOOL)usesSharedPlaceholder
{
  return self->_usesSharedPlaceholder;
}

@end