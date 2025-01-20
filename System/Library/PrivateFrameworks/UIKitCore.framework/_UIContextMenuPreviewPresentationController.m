@interface _UIContextMenuPreviewPresentationController
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldPreserveFirstResponder;
- (BOOL)_shouldRestoreFirstResponder;
- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController;
- (BOOL)platterContentSizeDidChange;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)platterContentSize;
- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4;
- (_UIContextMenuPreviewPresentationControllerDelegate)menuPresentationDelegate;
- (_UIContextMenuStyle)menuStyle;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)_viewForRemoteTextEffectsWindowMatchAnimation;
- (id)preferredFocusEnvironments;
- (int64_t)presentationStyle;
- (void)_updatePlatterContentSizeWithPreferredContentSize:(CGSize)a3;
- (void)dismissalTransitionWillBegin;
- (void)menuDidPresentWithContentPlatterView:(id)a3;
- (void)menuLayoutDidProducePreviewSize:(CGSize)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setMenuPresentationDelegate:(id)a3;
- (void)setMenuStyle:(id)a3;
- (void)setPlatterContentSize:(CGSize)a3;
- (void)setPlatterContentSizeDidChange:(BOOL)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation _UIContextMenuPreviewPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  v13.receiver = self;
  v13.super_class = (Class)_UIContextMenuPreviewPresentationController;
  [(UIPresentationController *)&v13 frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 0;
}

- (BOOL)_shouldPreserveFirstResponder
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (BOOL)_shouldRestoreFirstResponder
{
  return 0;
}

- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController
{
  double v3 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  int v4 = [v3 keepsInputViewsVisible];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIContextMenuPreviewPresentationController;
  return [(UIPresentationController *)&v6 _wantsAutomaticFirstResponderWhenPresentingRemoteViewController];
}

- (int64_t)presentationStyle
{
  return 20;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuPreviewPresentationController;
  [(UIPresentationController *)&v8 _baseContentInsetsWithLeftMargin:a3 rightMargin:a4];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuPreviewPresentationController;
  [(UIPresentationController *)&v15 presentationTransitionWillBegin];
  double v3 = [(UIPresentationController *)self presentedView];
  double v4 = [(UIPresentationController *)self containerView];
  [v4 setUserInteractionEnabled:0];
  [v4 frame];
  CGFloat Width = CGRectGetWidth(v16);
  CATransform3DMakeTranslation(&v14, -Width, 0.0, 0.0);
  double v6 = [v4 layer];
  CATransform3D v13 = v14;
  [v6 setSublayerTransform:&v13];

  [v4 setAlpha:0.0];
  [v4 addSubview:v3];
  double v7 = [(UIPresentationController *)self presentedViewController];
  [v7 preferredContentSize];
  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:");

  [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(UIPresentationController *)self presentedView];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);

  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
}

- (void)dismissalTransitionWillBegin
{
  double v3 = [(UIPresentationController *)self containerView];
  [v3 setUserInteractionEnabled:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuPreviewPresentationController;
  [(UIPresentationController *)&v4 dismissalTransitionWillBegin];
}

- (id)preferredFocusEnvironments
{
  double v3 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  int v4 = [v3 hasInteractivePreview];

  double v5 = [(_UIContextMenuPreviewPresentationController *)self menuPresentationDelegate];
  double v6 = [v5 preferredFocusEnvironmentsForContextMenuPreviewPresentationController:self];
  double v7 = (void *)[v6 mutableCopy];

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIContextMenuPreviewPresentationController;
    double v8 = [(UIPresentationController *)&v10 preferredFocusEnvironments];
    if ([v8 count]) {
      [v7 addObjectsFromArray:v8];
    }
  }
  return v7;
}

- (void)menuLayoutDidProducePreviewSize:(CGSize)a3
{
  double width = a3.width;
  [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  int v10 = [v9 ignoresDefaultSizingRules];

  if (v10)
  {
    [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
    double v12 = v11 / width;
    if (v12 < 1.0) {
      double v12 = 1.0;
    }
    CGAffineTransformMakeScale(&v18, v12, v12);
    CATransform3D v13 = [(UIPresentationController *)self containerView];
    UIRoundToViewScale(v13);
    double v6 = v14;
    objc_super v15 = [(UIPresentationController *)self containerView];
    UIRoundToViewScale(v15);
    double v8 = v16;
  }
  v17 = [(UIPresentationController *)self presentedView];
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v6, v8);
}

- (void)menuDidPresentWithContentPlatterView:(id)a3
{
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuPreviewPresentationController;
  id v4 = a3;
  [(UIPresentationController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:", v6, v8);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuPreviewPresentationController;
  id v4 = a3;
  [(UIPresentationController *)&v14 systemLayoutFittingSizeDidChangeForChildContentContainer:v4];
  double v5 = [(UIPresentationController *)self presentedView];
  [v4 preferredContentSize];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v5, "systemLayoutSizeFittingSize:", v7, v9);
  double v11 = v10;
  double v13 = v12;

  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:", v11, v13);
}

- (void)_updatePlatterContentSizeWithPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v72 = [(UIPresentationController *)self containerView];
  double v6 = [v72 traitCollection];
  double v7 = _UIContextMenuGetPlatformMetrics([v6 userInterfaceIdiom]);

  [v7 previewPlatterMaximumSize];
  double v9 = v8;
  [v7 previewPlatterMaximumSize];
  double v11 = v10;
  double v12 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  if ([v12 preferredLayout] == 1)
  {

LABEL_30:
    objc_super v15 = v72;
    goto LABEL_31;
  }
  double v13 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  uint64_t v14 = [v13 preferredLayout];

  objc_super v15 = v72;
  if (v14 == 3) {
    goto LABEL_31;
  }
  if (v72)
  {
    double v16 = [v72 traitCollection];
    uint64_t v17 = [v16 verticalSizeClass];

    if (v17 == 1)
    {
      double v18 = v9 / v11;
      [v72 bounds];
      double v11 = CGRectGetHeight(v74);
      double v9 = v18 * v11;
    }
    else
    {
      [v72 bounds];
      double v20 = v19;
      double v22 = v21;
      v23 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
      uint64_t v24 = [v23 preferredLayout];

      if (!v24)
      {
        double v71 = v20;
        id v25 = v72;
        [v25 safeAreaInsets];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        v34 = [v25 traitCollection];
        uint64_t v35 = [v34 verticalSizeClass];

        double v36 = v33 + 0.0;
        if (v35 == 1) {
          double v36 = v33;
        }
        double v70 = v36;
        if (v35 == 1)
        {
          double v37 = v27;
        }
        else
        {
          double v31 = v31 + 20.0;
          double v29 = v29 + 0.0;
          double v37 = v27 + 20.0;
        }
        id v38 = v25;
        v39 = [v38 traitCollection];
        uint64_t v40 = [v39 userInterfaceIdiom];

        v41 = _UIContextMenuGetPlatformMetrics(v40);
        +[UIViewController _horizontalContentMarginForView:v38];
        double v43 = v42;
        uint64_t v44 = [v41 contentSpacingForContainer];
        v45 = (void *)v44;
        if (v44) {
          double v43 = (*(double (**)(uint64_t, id))(v44 + 16))(v44, v38);
        }

        double v46 = fmax(v37, 20.0);
        double v47 = fmax(v29, v43);

        [v38 bounds];
        v75.origin.x = v47 + v48;
        v75.origin.y = v46 + v49;
        v75.size.double width = v50 - (v47 + fmax(v70, v43));
        v75.size.double height = v51 - (fmax(v31, 20.0) + v46) - (v47 + 135.0);
        double v20 = v71;
        double v22 = CGRectGetHeight(v75) * (v71 / v75.size.width);
      }
      v52 = [v72 traitCollection];
      uint64_t v53 = [v52 userInterfaceIdiom];

      if (!v53)
      {
        [v72 bounds];
        CGFloat v54 = CGRectGetWidth(v76);
        double v11 = v11 * (v54 / v9);
        double v9 = v54;
      }
      if (v20 < v9) {
        double v9 = v20;
      }
      if (v22 < v11) {
        double v11 = v22;
      }
    }
  }
  if (width <= 0.0) {
    double v55 = v9;
  }
  else {
    double v55 = width;
  }
  if (height <= 0.0) {
    double v56 = v11;
  }
  else {
    double v56 = height;
  }
  v57 = [(_UIContextMenuPreviewPresentationController *)self menuStyle];
  char v58 = [v57 ignoresDefaultSizingRules];

  if (v58)
  {
    double height = v56;
    goto LABEL_30;
  }
  double v68 = fmin(v9 / v55, 1.0);
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (v56 * v68 >= v11) {
      double height = v11;
    }
    else {
      double height = v56 * v68;
    }
  }
  else
  {
    double v69 = fmin(v11 / v56, 1.0);
    if (v68 >= v69) {
      double v68 = v69;
    }
    double height = v56 * v68;
  }
  objc_super v15 = v72;
LABEL_31:
  UIRoundToViewScale(v15);
  if (v59 >= 1.0) {
    double v60 = v59;
  }
  else {
    double v60 = 1.0;
  }
  v61 = [v72 _screen];
  [v61 scale];
  UIFloorToScale(height, v62);
  double v64 = v63;

  if (v64 < 1.0) {
    double v64 = 1.0;
  }
  [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
  if (v60 != v66 || v64 != v65)
  {
    -[_UIContextMenuPreviewPresentationController setPlatterContentSize:](self, "setPlatterContentSize:", v60, v64);
    v67 = [(_UIContextMenuPreviewPresentationController *)self menuPresentationDelegate];
    objc_msgSend(v67, "contextMenuPreviewPresentationController:didChangePreviewContentSize:", self, v60, v64);
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuPreviewPresentationController;
  id v4 = a3;
  double v5 = [(UIPresentationController *)&v15 _traitCollectionForChildEnvironment:v4];
  double v6 = [(UIPresentationController *)self presentedViewController];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
    uint64_t v9 = _UIUserInterfaceSizeClassForWidth(v8);
    [(_UIContextMenuPreviewPresentationController *)self platterContentSize];
    uint64_t v11 = _UIUserInterfaceSizeClassForHeight(v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83___UIContextMenuPreviewPresentationController__traitCollectionForChildEnvironment___block_invoke;
    v14[3] = &__block_descriptor_48_e86_v24__0_____UITraitCollection____8_____UITraitCollection_UIMutableTraitsInternal_____16l;
    v14[4] = v9;
    v14[5] = v11;
    uint64_t v12 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)v14);

    double v5 = (void *)v12;
  }
  return v5;
}

- (id)_viewForRemoteTextEffectsWindowMatchAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
  return WeakRetained;
}

- (_UIContextMenuPreviewPresentationControllerDelegate)menuPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuPresentationDelegate);
  return (_UIContextMenuPreviewPresentationControllerDelegate *)WeakRetained;
}

- (void)setMenuPresentationDelegate:(id)a3
{
}

- (_UIContextMenuStyle)menuStyle
{
  return self->_menuStyle;
}

- (void)setMenuStyle:(id)a3
{
}

- (CGSize)platterContentSize
{
  double width = self->_platterContentSize.width;
  double height = self->_platterContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPlatterContentSize:(CGSize)a3
{
  self->_platterContentSize = a3;
}

- (BOOL)platterContentSizeDidChange
{
  return self->_platterContentSizeDidChange;
}

- (void)setPlatterContentSizeDidChange:(BOOL)a3
{
  self->_platterContentSizeDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuStyle, 0);
  objc_destroyWeak((id *)&self->_menuPresentationDelegate);
  objc_destroyWeak((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
}

@end