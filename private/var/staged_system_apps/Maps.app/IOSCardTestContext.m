@interface IOSCardTestContext
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectLabelMarker:(id)a3;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)showsMapView;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsMapSelectionControl;
- (BOOL)wantsWeatherShowing;
- (CardTestPopoverContainee)popover;
- (ChromeViewController)chromeViewController;
- (IOSCardTestContext)init;
- (IOSCardTestContext)initWithFloatingControlsOptions:(int64_t)a3;
- (NSMutableArray)containees;
- (id)desiredCards;
- (int64_t)desiredFloatingControls;
- (unint64_t)indexOfContainee:(id)a3;
- (unint64_t)indexOfContext;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)popContainee;
- (void)popContext;
- (void)pushContainee;
- (void)pushContext;
- (void)pushContextWithFloatingControls:(int64_t)a3;
- (void)setChromeViewController:(id)a3;
- (void)setContainees:(id)a3;
- (void)setPopover:(id)a3;
@end

@implementation IOSCardTestContext

- (IOSCardTestContext)initWithFloatingControlsOptions:(int64_t)a3
{
  result = [(IOSCardTestContext *)self init];
  if (result) {
    result->_floatingControls = a3;
  }
  return result;
}

- (IOSCardTestContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)IOSCardTestContext;
  v2 = [(IOSCardTestContext *)&v7 init];
  if (v2)
  {
    v3 = [[CardTestContainee alloc] initWithContext:v2];
    v4 = [objc_alloc((Class)NSMutableArray) initWithObjects:v3, 0];
    containees = v2->_containees;
    v2->_containees = v4;

    v2->_floatingControls = 67;
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  return self->_containees;
}

- (unint64_t)indexOfContext
{
  v3 = [(IOSCardTestContext *)self chromeViewController];
  v4 = [v3 contexts];
  id v5 = [v4 indexOfObject:self];

  return (unint64_t)v5;
}

- (unint64_t)indexOfContainee:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_containees indexOfObject:a3];
}

- (void)pushContainee
{
  v4 = [[CardTestContainee alloc] initWithContext:self];
  [(NSMutableArray *)self->_containees addObject:v4];
  v3 = [(IOSCardTestContext *)self chromeViewController];
  [v3 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)popContainee
{
  if ((unint64_t)[(NSMutableArray *)self->_containees count] >= 2)
  {
    [(NSMutableArray *)self->_containees removeLastObject];
    id v3 = [(IOSCardTestContext *)self chromeViewController];
    [v3 setNeedsUpdateComponent:@"cards" animated:1];
  }
}

- (void)pushContext
{
  id v3 = [(IOSCardTestContext *)self chromeViewController];
  v2 = objc_alloc_init(IOSCardTestContext);
  [v3 pushContext:v2 animated:1 completion:0];
}

- (void)pushContextWithFloatingControls:(int64_t)a3
{
  id v5 = [(IOSCardTestContext *)self chromeViewController];
  v4 = [[IOSCardTestContext alloc] initWithFloatingControlsOptions:a3];
  [v5 pushContext:v4 animated:1 completion:0];
}

- (void)popContext
{
  id v3 = [(IOSCardTestContext *)self chromeViewController];
  v4 = [v3 contexts];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    id v6 = [(IOSCardTestContext *)self chromeViewController];
    [v6 popContextAnimated:1 completion:0];
  }
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v13 = a3;
  unsigned int v5 = [(NSMutableArray *)self->_containees containsObject:v13];
  id v6 = v13;
  if (v5)
  {
    [(NSMutableArray *)self->_containees removeObject:v13];
    objc_super v7 = [(IOSCardTestContext *)self popover];

    if (v7)
    {
      v8 = [(IOSCardTestContext *)self chromeViewController];
      v9 = [v8 mapSelectionManager];
      [v9 clearSelectionAnimated:1];
    }
    id v10 = [(NSMutableArray *)self->_containees count];
    v11 = [(IOSCardTestContext *)self chromeViewController];
    v12 = v11;
    if (v10) {
      [v11 setNeedsUpdateComponent:@"cards" animated:1];
    }
    else {
      [v11 popContext:self animated:1 completion:0];
    }

    id v6 = v13;
  }
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(IOSCardTestContext *)self chromeViewController];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5)
  {
    objc_super v7 = [(IOSCardTestContext *)self popover];
    if (v7) {
      [(NSMutableArray *)self->_containees removeObject:v7];
    }
    v8 = [[CardTestPopoverContainee alloc] initWithContext:self forLabelMarker:v4];
    [(NSMutableArray *)self->_containees addObject:v8];
    [(IOSCardTestContext *)self setPopover:v8];
    v9 = [(IOSCardTestContext *)self chromeViewController];
    [v9 setNeedsUpdateComponent:@"cards" animated:1];
  }
  return v6 == 5;
}

- (BOOL)chromeDidClearMapSelection
{
  id v3 = [(IOSCardTestContext *)self popover];
  if (v3)
  {
    [(NSMutableArray *)self->_containees removeObject:v3];
    id v4 = [(IOSCardTestContext *)self chromeViewController];
    [v4 setNeedsUpdateComponent:@"cards" animated:1];
  }
  return 1;
}

- (int64_t)desiredFloatingControls
{
  return self->_floatingControls;
}

- (BOOL)wantsWeatherShowing
{
  return 1;
}

- (BOOL)permitsWeatherShowing
{
  return 1;
}

- (BOOL)wantsLookAroundShowing
{
  return 1;
}

- (BOOL)permitsLookAroundShowing
{
  return 1;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (NSMutableArray)containees
{
  return self->_containees;
}

- (void)setContainees:(id)a3
{
}

- (CardTestPopoverContainee)popover
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popover);

  return (CardTestPopoverContainee *)WeakRetained;
}

- (void)setPopover:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popover);
  objc_storeStrong((id *)&self->_containees, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end