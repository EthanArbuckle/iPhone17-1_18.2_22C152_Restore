@interface THGlossaryiOSCanvasViewController
- (BOOL)shouldPreventGestureFromEditingController:(id)a3;
- (IMTheme)theme;
- (THGlossaryiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4;
- (void)_applyCorrectAppearance;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)setTheme:(id)a3;
- (void)setUpGestureRecognizers;
@end

@implementation THGlossaryiOSCanvasViewController

- (BOOL)shouldPreventGestureFromEditingController:(id)a3
{
  return 1;
}

- (void)setUpGestureRecognizers
{
  v13.receiver = self;
  v13.super_class = (Class)THGlossaryiOSCanvasViewController;
  [(THGlossaryiOSCanvasViewController *)&v13 setUpGestureRecognizers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [self view:0].gestureRecognizers;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (v8 != [(THGlossaryiOSCanvasViewController *)self hyperlinkGestureRecognizer]) {
          [v8 requireGestureRecognizerToFail:[self hyperlinkGestureRecognizer]];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (THGlossaryiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryiOSCanvasViewController;
  id v4 = [(THGlossaryiOSCanvasViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(THGlossaryiOSCanvasViewController *)v4 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
}

- (void)_applyCorrectAppearance
{
  objc_opt_class();
  [(THGlossaryiOSCanvasViewController *)self view];
  uint64_t v3 = TSUDynamicCast();
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = (UIColor *)[(IMTheme *)[(THGlossaryiOSCanvasViewController *)self theme] backgroundColorForTraitEnvironment:self];
    if (!v5) {
      id v5 = +[UIColor whiteColor];
    }
    [v4 setBackgroundColor:v5];
    objc_msgSend(objc_msgSend(v4, "enclosingScrollView"), "setBackgroundColor:", v5);
    id v6 = [v4 rootCanvasView];
    [v6 setBackgroundColor:v5];
    id v7 = [v6 enclosingScrollView];
    [v7 setBackgroundColor:v5];
  }
}

- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4
{
  id v5 = [[self interactiveCanvasController] hitRep:a3.x, a3.y];
  if (!a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return v5;
}

- (id)hitRep:(CGPoint)a3
{
  return -[THGlossaryiOSCanvasViewController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 0, a3.x, a3.y);
}

- (void)setTheme:(id)a3
{
  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    id v5 = a3;

    self->_theme = (IMTheme *)a3;
    [(THGlossaryiOSCanvasViewController *)self _applyCorrectAppearance];
  }
}

- (void)dealloc
{
  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryiOSCanvasViewController;
  [(THGlossaryiOSCanvasViewController *)&v3 dealloc];
}

- (IMTheme)theme
{
  return self->_theme;
}

@end