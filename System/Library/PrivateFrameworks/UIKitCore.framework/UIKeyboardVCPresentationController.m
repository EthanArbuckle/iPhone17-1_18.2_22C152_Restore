@interface UIKeyboardVCPresentationController
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)shouldPresentInFullscreen;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
@end

@implementation UIKeyboardVCPresentationController

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ([(id)UIApp _isClassic])
  {
    v8 = +[UIScreen mainScreen];
    [v8 bounds];
  }
  else
  {
    v11 = [(UIPresentationController *)self containerView];
    v8 = [v11 _window];

    if (([v8 _isTextEffectsWindow] & 1) == 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)UIKeyboardVCPresentationController;
      -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](&v18, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      double v12 = v14;
      double v13 = v15;
      goto LABEL_7;
    }
    [v8 actualSceneFrame];
  }
  double v12 = v9;
  double v13 = v10;
LABEL_7:

  double v16 = v12;
  double v17 = v13;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v5 = [(UIPresentationController *)self presentedViewController];
  v6 = [(UIPresentationController *)self containerView];
  [v6 bounds];
  -[UIKeyboardVCPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v5, v7, v8);
  double v10 = v9;
  double v12 = v11;

  double v13 = v3;
  double v14 = v4;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end