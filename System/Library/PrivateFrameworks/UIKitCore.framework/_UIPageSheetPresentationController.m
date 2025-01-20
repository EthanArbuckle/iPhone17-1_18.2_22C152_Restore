@interface _UIPageSheetPresentationController
+ (int64_t)_initialMode;
- (BOOL)_shouldHideBottomCorner;
- (BOOL)shouldSubscribeToKeyboardNotifications;
- (CGRect)frameOfPresentedViewInContainerView;
@end

@implementation _UIPageSheetPresentationController

+ (int64_t)_initialMode
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(UIPresentationController *)self presentedViewController];
  int v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPageSheetPresentationController;
    [(_UIFormSheetPresentationController *)&v14 frameOfPresentedViewInContainerView];
  }
  else
  {
    v9 = [(UIPresentationController *)self containerView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 >= v13) {
      double v7 = v13;
    }
    else {
      double v7 = v11;
    }
    double v5 = (v11 - v7) * 0.5;
    double v8 = v13 + -20.0;
    double v6 = 20.0;
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_shouldHideBottomCorner
{
  return 1;
}

- (BOOL)shouldSubscribeToKeyboardNotifications
{
  return 0;
}

@end