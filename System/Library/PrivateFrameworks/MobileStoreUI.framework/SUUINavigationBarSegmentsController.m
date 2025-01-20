@interface SUUINavigationBarSegmentsController
- (SUUINavigationBarSegmentsController)initWithViewElement:(id)a3;
- (id)view;
- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3;
- (void)willAppearInNavigationBar;
@end

@implementation SUUINavigationBarSegmentsController

- (SUUINavigationBarSegmentsController)initWithViewElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarSegmentsController;
  v5 = [(SUUINavigationBarSegmentsController *)&v9 init];
  if (v5)
  {
    v6 = [[SUUISegmentedControlViewElementController alloc] initWithViewElement:v4];
    underlyingController = v5->_underlyingController;
    v5->_underlyingController = v6;

    [(SUUISegmentedControlViewElementController *)v5->_underlyingController setDesiredSegmentWidth:0.0];
  }

  return v5;
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  underlyingController = self->_underlyingController;
  id v5 = a3;
  [(SUUISegmentedControlViewElementController *)underlyingController reloadAfterDocumentUpdate];
  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationBarSegmentsController;
  [(SUUINavigationBarSectionController *)&v6 reloadAfterDocumentUpdateWithNavigationItem:v5];
}

- (id)view
{
  return [(SUUISegmentedControlViewElementController *)self->_underlyingController segmentedControlView];
}

- (void)willAppearInNavigationBar
{
  v3 = [(SUUINavigationBarSectionController *)self context];
  [v3 maximumNavigationBarWidth];
  double v5 = v4;
  objc_super v6 = [v3 parentViewController];
  if ([v6 isViewLoaded])
  {
    v7 = [v6 view];
    [v7 bounds];
    double v5 = v8;
  }
  if (v5 <= 320.0) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 5;
  }
  [(SUUISegmentedControlViewElementController *)self->_underlyingController setDefaultMaximumNumberOfVisibleItems:v9];
  v10.receiver = self;
  v10.super_class = (Class)SUUINavigationBarSegmentsController;
  [(SUUINavigationBarSectionController *)&v10 willAppearInNavigationBar];
}

- (void).cxx_destruct
{
}

@end