@interface ExpandableMacPopoverPresentationController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)minimizedMode;
- (UIPanGestureRecognizer)scrollExpandGestureRecognizer;
- (void)configurePopoverSize;
- (void)expandPopover;
- (void)handlePanGesture:(id)a3;
- (void)setMinimizedMode:(BOOL)a3;
- (void)setScrollExpandGestureRecognizer:(id)a3;
@end

@implementation ExpandableMacPopoverPresentationController

- (void)setMinimizedMode:(BOOL)a3
{
  if (self->_minimizedMode != a3)
  {
    self->_minimizedMode = a3;
    if (a3)
    {
      v4 = +[NSUserDefaults standardUserDefaults];
      unsigned int v5 = [v4 BOOLForKey:@"SCROLLING_OPENS_PLACECARD_KEY_ROTATED"];

      if (v5)
      {
        v6 = [(MacPopoverPresentationController *)self containeeViewController];
        v7 = [v6 view];
        v8 = [(ExpandableMacPopoverPresentationController *)self scrollExpandGestureRecognizer];
        [v7 addGestureRecognizer:v8];
      }
      v9 = [(MacPopoverPresentationController *)self containeeViewController];
      [v9 macContaineeWidth];
      double v11 = v10;
      double v12 = 374.0;
    }
    else
    {
      v13 = [(MacPopoverPresentationController *)self containeeViewController];
      v14 = [v13 view];
      v15 = [(ExpandableMacPopoverPresentationController *)self scrollExpandGestureRecognizer];
      [v14 removeGestureRecognizer:v15];

      v16 = [(MacPopoverPresentationController *)self containeeViewController];
      [v16 heightForLayout:3];
      double v12 = v17;

      v9 = [(MacPopoverPresentationController *)self containeeViewController];
      [v9 macContaineeWidth];
      double v11 = v18;
      if (v12 > 610.0) {
        double v12 = 610.0;
      }
    }

    -[MacPopoverPresentationController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v12);
  }
}

- (UIPanGestureRecognizer)scrollExpandGestureRecognizer
{
  scrollExpandGestureRecognizer = self->_scrollExpandGestureRecognizer;
  if (!scrollExpandGestureRecognizer)
  {
    v4 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePanGesture:"];
    unsigned int v5 = self->_scrollExpandGestureRecognizer;
    self->_scrollExpandGestureRecognizer = v4;

    [(UIPanGestureRecognizer *)self->_scrollExpandGestureRecognizer setAllowedScrollTypesMask:3];
    [(UIPanGestureRecognizer *)self->_scrollExpandGestureRecognizer setDelegate:self];
    scrollExpandGestureRecognizer = self->_scrollExpandGestureRecognizer;
  }

  return scrollExpandGestureRecognizer;
}

- (void)expandPopover
{
}

- (void)configurePopoverSize
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(ExpandableMacPopoverPresentationController *)self scrollExpandGestureRecognizer];

  return v6 == v5;
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(MacPopoverPresentationController *)self containeeViewController];
  id v6 = [v5 view];
  [v4 translationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = fabs(v10);
  double v12 = fabs(v8);
  if (v10 != 0.0 && v11 > v12)
  {
    [(ExpandableMacPopoverPresentationController *)self expandPopover];
  }
}

- (BOOL)minimizedMode
{
  return self->_minimizedMode;
}

- (void)setScrollExpandGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end