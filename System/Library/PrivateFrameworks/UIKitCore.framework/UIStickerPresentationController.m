@interface UIStickerPresentationController
- (BOOL)_shouldRestoreFirstResponder;
- (CGRect)frameOfPresentedViewInContainerView;
- (void)presentationTransitionDidEnd:(BOOL)a3;
@end

@implementation UIStickerPresentationController

- (void)presentationTransitionDidEnd:(BOOL)a3
{
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = [(UIPresentationController *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldRestoreFirstResponder
{
  v2 = self;
  double v3 = [(UIPresentationController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(UIPresentationController *)v2 presentedViewController];
    LODWORD(v2) = [v5 keyWindowChangedDuringInsert] ^ 1;
  }
  else
  {
    double v6 = _stickersLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unexpected presented controller", buf, 2u);
    }

    v8.receiver = v2;
    v8.super_class = (Class)UIStickerPresentationController;
    LOBYTE(v2) = [(UIPresentationController *)&v8 _shouldRestoreFirstResponder];
  }
  return (char)v2;
}

@end