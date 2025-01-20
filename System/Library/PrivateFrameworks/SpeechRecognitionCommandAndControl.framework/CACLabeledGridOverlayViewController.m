@interface CACLabeledGridOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (BOOL)isSmallEnoughForZooming;
- (BOOL)showsElementsAsClickable;
- (BOOL)showsNumbersInTopLeft;
- (CACLabeledGridOverlayView)gridOverlayView;
- (int64_t)zOrder;
- (void)hide;
- (void)loadView;
- (void)setGridOverlayView:(id)a3;
- (void)setLabeledElements:(id)a3;
- (void)setShowsElementsAsClickable:(BOOL)a3;
- (void)setShowsNumbersInTopLeft:(BOOL)a3;
- (void)show;
- (void)zoomOverRegion:(CGRect)a3;
@end

@implementation CACLabeledGridOverlayViewController

- (void)loadView
{
  v3 = [CACLabeledGridOverlayView alloc];
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  v5 = -[CACLabeledGridOverlayView initWithFrame:](v3, "initWithFrame:");
  gridOverlayView = self->_gridOverlayView;
  self->_gridOverlayView = v5;

  v7 = self->_gridOverlayView;
  [(CACLabeledGridOverlayViewController *)self setView:v7];
}

- (void)setShowsNumbersInTopLeft:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  [v4 setShowsNumbersInTopLeft:v3];
}

- (BOOL)showsNumbersInTopLeft
{
  v2 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  char v3 = [v2 showsNumbersInTopLeft];

  return v3;
}

- (BOOL)isSmallEnoughForZooming
{
  v2 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  char v3 = [v2 isSmallEnoughForZooming];

  return v3;
}

- (void)show
{
  id v2 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  [v2 show];
}

- (void)hide
{
  id v2 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  [v2 hide];
}

- (void)setLabeledElements:(id)a3
{
  id v4 = a3;
  v5 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  [v5 clearLabeledElements];

  v6 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  objc_msgSend(v6, "setShowsElementsAsClickable:", -[CACLabeledGridOverlayViewController showsElementsAsClickable](self, "showsElementsAsClickable"));

  id v7 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  [v7 addLabeledElements:v4];
}

- (void)zoomOverRegion:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CACLabeledGridOverlayViewController *)self gridOverlayView];
  objc_msgSend(v7, "zoomOverRect:", x, y, width, height);
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)showsElementsAsClickable
{
  return self->_showsElementsAsClickable;
}

- (void)setShowsElementsAsClickable:(BOOL)a3
{
  self->_showsElementsAsClickable = a3;
}

- (CACLabeledGridOverlayView)gridOverlayView
{
  return self->_gridOverlayView;
}

- (void)setGridOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end