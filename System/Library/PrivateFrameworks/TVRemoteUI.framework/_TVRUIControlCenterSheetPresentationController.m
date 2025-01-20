@interface _TVRUIControlCenterSheetPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (UIViewController)sourceViewController;
- (unint64_t)layoutStyle;
- (void)presentationTransitionWillBegin;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setSourceViewController:(id)a3;
@end

@implementation _TVRUIControlCenterSheetPresentationController

- (void)presentationTransitionWillBegin
{
  v7.receiver = self;
  v7.super_class = (Class)_TVRUIControlCenterSheetPresentationController;
  [(_TVRUIControlCenterSheetPresentationController *)&v7 presentationTransitionWillBegin];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  [(_TVRUIControlCenterSheetPresentationController *)self frameOfPresentedViewInContainerView];
  v4 = objc_msgSend(v3, "initWithFrame:");
  v5 = [MEMORY[0x263F825C8] blackColor];
  [v4 setBackgroundColor:v5];

  CCUIExpandedModuleContinuousCornerRadius();
  objc_msgSend(v4, "_setContinuousCornerRadius:");
  [v4 setClipsToBounds:1];
  v6 = [(_TVRUIControlCenterSheetPresentationController *)self containerView];
  [v6 setMaskView:v4];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  id v3 = [(_TVRUIControlCenterSheetPresentationController *)self presentingViewController];
  v4 = [v3 view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v39 = v7;
  CGFloat v40 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(_TVRUIControlCenterSheetPresentationController *)self sourceViewController];
  v14 = [v13 view];

  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(_TVRUIControlCenterSheetPresentationController *)self containerView];
  objc_msgSend(v23, "convertRect:fromView:", v14, v16, v18, v20, v22);
  double v44 = v25;
  double v45 = v24;
  double v42 = v27;
  double v43 = v26;

  v46.origin.x = v6;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  CGFloat v28 = CGRectGetWidth(v46) * 0.5;
  v47.origin.x = v16;
  v47.origin.y = v18;
  v47.size.width = v20;
  v47.size.height = v22;
  double v41 = v28 - CGRectGetWidth(v47) * 0.5;
  v48.origin.y = v39;
  v48.origin.x = v40;
  v48.size.width = v10;
  v48.size.height = v12;
  CGFloat v29 = CGRectGetHeight(v48) * 0.5;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  double v30 = v29 - CGRectGetHeight(v49) * 0.5;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  double Width = CGRectGetWidth(v50);
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  double Height = CGRectGetHeight(v51);
  unint64_t v33 = [(_TVRUIControlCenterSheetPresentationController *)self layoutStyle];
  if (v33 == 2) {
    double v34 = v41;
  }
  else {
    double v34 = v45;
  }
  if (v33 != 2)
  {
    double v30 = v44;
    double Width = v43;
    double Height = v42;
  }

  double v35 = v34;
  double v36 = v30;
  double v37 = Width;
  double v38 = Height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
}

@end