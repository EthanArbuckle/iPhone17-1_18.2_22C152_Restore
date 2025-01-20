@interface _UIEditMenuContentPresentation
- (BOOL)_shouldReuseVisibleMenu;
- (BOOL)canPresentEditMenu;
- (BOOL)observingSourceView;
- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3;
- (CGRect)_convertSourceWindowRectToContainerView:(CGRect)a3;
- (CGRect)_queryMenuSourceRectForConfiguration:(id)a3 reuseTargetRect:(BOOL)a4 isValid:(BOOL *)a5;
- (CGRect)menuFrameInCoordinateSpace:(id)a3;
- (CGRect)targetRectInSourceView;
- (UIEdgeInsets)_preferredContentInsetsForContainerViewWithConfiguration:(id)a3;
- (_UIEditMenuListView)currentListView;
- (_UIEditMenuPresentationLayout)currentMenuLayout;
- (id)_currentPlatformMetrics;
- (id)_queryMenuSourceRectsPreferredLayoutRectsForConfiguration:(id)a3;
- (id)_resolvedLayoutForMenuWithConfiguration:(id)a3 sourceRect:(CGRect)a4 axis:(int64_t)a5;
- (id)configureContainerViewWithConfiguration:(id)a3;
- (int64_t)_listViewAxisForTraitCollection:(id)a3;
- (int64_t)userInterfaceStyle;
- (void)_displayMenu:(id)a3 reason:(int64_t)a4;
- (void)_displayPreparedMenu:(id)a3 titleView:(id)a4 reason:(int64_t)a5 didDismissMenu:(BOOL)a6 configuration:(id)a7;
- (void)_endSourceViewObservation;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_observeSourceViewIfNeeded;
- (void)_reloadMenuLayoutWithSourceRect:(CGRect)a3 animated:(BOOL)a4;
- (void)_resolvedMenuPositionForArrowDirection:(int64_t *)a3 availableBounds:(CGRect)a4 sourceRect:(CGRect)a5 menuSize:(CGSize)a6 menuPosition:(CGPoint *)a7 anchorPoint:(CGPoint *)a8;
- (void)_updateMenuPositionAnimated:(BOOL)a3 reuseTargetRect:(BOOL)a4 forced:(BOOL)a5;
- (void)contentSizeCategoryDidChangeInEditMenuListView:(id)a3;
- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)displayMenu:(id)a3 configuration:(id)a4;
- (void)editMenuListView:(id)a3 didSelectMenuElement:(id)a4;
- (void)hideMenuWithReason:(int64_t)a3;
- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4;
- (void)setCurrentMenuLayout:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)sourceViewDidUpdateFromTraitCollection:(id)a3;
- (void)updateMenuPositionAnimated:(BOOL)a3;
@end

@implementation _UIEditMenuContentPresentation

- (void)displayMenu:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  [(_UIEditMenuPresentation *)self setActiveConfiguration:a4];
  [(_UIEditMenuContentPresentation *)self _displayMenu:v6 reason:0];
}

- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4
{
  id v9 = a3;
  v7 = [(_UIEditMenuContentPresentation *)self currentListView];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIEditMenuContentPresentation.m" lineNumber:98 description:@"Cannot replace the visible menu if there are no visible menus present."];
  }
  [(_UIEditMenuContentPresentation *)self _displayMenu:v9 reason:a4];
}

- (void)_displayMenu:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  v8 = [(_UIEditMenuPresentation *)self activeConfiguration];
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIEditMenuContentPresentation.m" lineNumber:105 description:@"Cannot update the visible menu without an active configuration"];
  }
  uint64_t v9 = [(_UIEditMenuContentPresentation *)self currentListView];
  if (v9
    && (v10 = (void *)v9,
        BOOL v11 = [(_UIEditMenuContentPresentation *)self _shouldReuseVisibleMenu],
        v10,
        !v11))
  {
    if ((unint64_t)a4 > 2) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = qword_186B9DA40[a4];
    }
    [(_UIEditMenuContentPresentation *)self hideMenuWithReason:v13];
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
  }
  if ([(_UIEditMenuContentPresentation *)self canPresentEditMenu])
  {
    v14 = [(_UIEditMenuPresentation *)self delegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54___UIEditMenuContentPresentation__displayMenu_reason___block_invoke;
    v16[3] = &unk_1E52EA450;
    v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    int64_t v19 = a4;
    char v20 = v12;
    [v14 _editMenuPresentation:self preparedMenuForDisplay:v17 completion:v16];
  }
}

- (void)_displayPreparedMenu:(id)a3 titleView:(id)a4 reason:(int64_t)a5 didDismissMenu:(BOOL)a6 configuration:(id)a7
{
  BOOL v8 = a6;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12) {
    unint64_t v15 = ((unint64_t)[v12 metadata] >> 24) & 1;
  }
  else {
    LOBYTE(v15) = 0;
  }
  if (v13 || (v15 & 1) != 0)
  {
    id v17 = [(_UIEditMenuContentPresentation *)self configureContainerViewWithConfiguration:v14];
    [(_UIEditMenuContentPresentation *)self setUserInterfaceStyle:[(_UIEditMenuContentPresentation *)self initialUserInterfaceStyle]];
    char v63 = 1;
    [(_UIEditMenuContentPresentation *)self _queryMenuSourceRectForConfiguration:v14 reuseTargetRect:0 isValid:&v63];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    if (v63)
    {
      [(_UIEditMenuPresentation *)self setActiveConfiguration:v14];
      [(_UIEditMenuPresentation *)self setDisplayedMenu:v12];
      BOOL v26 = +[UIView areAnimationsEnabled];
      uint64_t v27 = [v14 _preferredElementDisplayMode];
      if ([(_UIEditMenuContentPresentation *)self _shouldReuseVisibleMenu])
      {
        v28 = [(_UIEditMenuContentPresentation *)self currentListView];
        [v28 setPreferredElementDisplayMode:v27];

        v29 = [(_UIEditMenuContentPresentation *)self currentListView];
        [v29 reloadWithMenu:v12 titleView:v13 animated:0];

        [(_UIEditMenuContentPresentation *)self _updateMenuPositionAnimated:v26 reuseTargetRect:0 forced:1];
      }
      else
      {
        BOOL v55 = v26;
        BOOL v56 = v8;
        v34 = [v17 traitCollection];
        v57 = v17;
        int64_t v35 = [(_UIEditMenuContentPresentation *)self _listViewAxisForTraitCollection:v34];

        v36 = [[_UIEditMenuListView alloc] initWithDelegate:self menu:v12 titleView:v13 preferredElementDisplayMode:v27];
        [(UIView *)v36 setAlpha:0.0];
        [(_UIEditMenuListView *)v36 setAxis:v35];
        objc_storeStrong((id *)&self->_currentListView, v36);
        v37 = -[_UIEditMenuContentPresentation _resolvedLayoutForMenuWithConfiguration:sourceRect:axis:](self, "_resolvedLayoutForMenuWithConfiguration:sourceRect:axis:", v14, v35, v19, v21, v23, v25);
        -[_UIEditMenuListView setArrowDirection:](v36, "setArrowDirection:", [v37 arrowDirection]);
        [v37 containerBounds];
        -[_UIEditMenuListView setBounds:](v36, "setBounds:");
        [v37 menuPosition];
        -[UIView setCenter:](v36, "setCenter:");
        [v37 anchorPoint];
        double v39 = v38;
        double v41 = v40;
        v42 = [(UIView *)v36 layer];
        objc_msgSend(v42, "setAnchorPoint:", v39, v41);

        [v57 addSubview:v36];
        [(UIView *)v36 layoutIfNeeded];
        [(_UIEditMenuContentPresentation *)self _observeSourceViewIfNeeded];
        objc_storeStrong((id *)&self->_currentListView, v36);
        objc_storeStrong((id *)&self->_currentMenuLayout, v37);
        if (a5)
        {
          uint64_t v43 = 4;
        }
        else
        {
          [(_UIEditMenuPresentation *)self forceEndDismissalIfNeeded];
          uint64_t v43 = 0;
        }
        [(_UIEditMenuPresentation *)self transitionWithEvent:v43];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke;
        aBlock[3] = &unk_1E52DC3A0;
        aBlock[4] = self;
        v44 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        int v45 = _AXSReduceMotionEnabled();
        int v46 = v45;
        BOOL v47 = a5 != 2 && v45 == 0;
        int v48 = !v47;
        int v54 = v48;
        if (v47)
        {
          CGAffineTransformMakeScale(&v60, 0.2, 0.2);
          CGAffineTransform v59 = v60;
          [(UIView *)v36 setTransform:&v59];
          v49 = v58;
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v50 = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_3;
        }
        else
        {
          v49 = v61;
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v50 = __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_2;
        }
        v49[2] = v50;
        v49[3] = &unk_1E52D9F98;
        v51 = v36;
        v49[4] = v51;
        v49[5] = self;
        v52 = (void (**)(void, __n128))_Block_copy(v49);

        v53.n128_u64[0] = 0x3FC3333333333333;
        if (!v56) {
          v53.n128_f64[0] = 0.0;
        }
        if (v55)
        {
          if (v46)
          {
            [(_UIEditMenuPresentation *)self animateReducedMotionTransitionWithDelay:v52 animations:v44 completion:v53.n128_f64[0]];
          }
          else if (v54)
          {
            [(_UIEditMenuPresentation *)self animateFadeWithDelay:v52 animations:v44 completion:v53.n128_f64[0]];
          }
          else
          {
            [(_UIEditMenuPresentation *)self animateScalePresentWithDelay:v52 animations:v44 completion:v53.n128_f64[0]];
          }
        }
        else
        {
          v52[2](v52, v53);
          v44[2](v44, 1);
        }

        id v17 = v57;
      }
    }
    else
    {
      v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("EditMenuInteraction", &qword_1EB25D228) + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        v32 = [(_UIEditMenuPresentation *)self activeConfiguration];
        v69.origin.x = v19;
        v69.origin.y = v21;
        v69.size.width = v23;
        v69.size.height = v25;
        v33 = NSStringFromCGRect(v69);
        *(_DWORD *)buf = 138412546;
        id v65 = v32;
        __int16 v66 = 2112;
        v67 = v33;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) has an invalid target rect (%@); ignoring present.",
          buf,
          0x16u);
      }
      [(_UIEditMenuContentPresentation *)self teardownContainerView];
    }
  }
  else
  {
    v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("EditMenuInteraction", &_MergedGlobals_9_7) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v65 = v14;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) did not have performable commands and/or actions; ignoring present.",
        buf,
        0xCu);
    }
    if ((unint64_t)(a5 - 1) > 1)
    {
      [(_UIEditMenuContentPresentation *)self hideMenuWithReason:0];
    }
    else
    {
      [(_UIEditMenuPresentation *)self forceEndPresentIfNeeded];
      [(_UIEditMenuPresentation *)self transitionWithEvent:2];
    }
  }
}

- (void)hideMenuWithReason:(int64_t)a3
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__220;
  v21[4] = __Block_byref_object_dispose__220;
  id v22 = [(_UIEditMenuContentPresentation *)self currentListView];
  v5 = [(_UIEditMenuContentPresentation *)self containerView];
  int v6 = _AXSReduceMotionEnabled();
  id v7 = [(_UIEditMenuContentPresentation *)self currentListView];

  if (v7)
  {
    BOOL v8 = a3 != 4 && v6 == 0;
    int v9 = !v8;
    if (v8)
    {
      v10 = aBlock;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      BOOL v11 = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_2;
    }
    else
    {
      v10 = v20;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      BOOL v11 = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke;
    }
    v10[2] = v11;
    v10[3] = &unk_1E52E3210;
    v10[4] = self;
    v10[5] = v21;
    id v12 = (void (**)(void))_Block_copy(v10);
    id v13 = [(_UIEditMenuPresentation *)self activeConfiguration];
    [(_UIEditMenuPresentation *)self setDismissingConfiguration:v13];

    if ((unint64_t)(a3 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      [(_UIEditMenuPresentation *)self forceEndPresentIfNeeded];
      [(_UIEditMenuPresentation *)self transitionWithEvent:2];
    }
    currentListView = self->_currentListView;
    self->_currentListView = 0;

    currentMenuLayout = self->_currentMenuLayout;
    self->_currentMenuLayout = 0;

    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_targetRectInSourceView.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_targetRectInSourceView.size = v16;
    [(_UIEditMenuPresentation *)self setDisplayedMenu:0];
    [(_UIEditMenuPresentation *)self setActiveConfiguration:0];
    [(_UIEditMenuContentPresentation *)self _endSourceViewObservation];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_3;
    v18[3] = &unk_1E52E5B98;
    v18[4] = self;
    v18[5] = v21;
    id v17 = (void (**)(void *, uint64_t))_Block_copy(v18);
    if (+[UIView areAnimationsEnabled])
    {
      if (v6)
      {
        [(_UIEditMenuPresentation *)self animateReducedMotionTransitionWithDelay:v12 animations:v17 completion:0.0];
      }
      else if (v9)
      {
        [(_UIEditMenuPresentation *)self animateFadeWithDelay:v12 animations:v17 completion:0.0];
      }
      else
      {
        [(_UIEditMenuPresentation *)self animateScaleDismissalWithAnimations:v12 completion:v17];
      }
    }
    else
    {
      v12[2](v12);
      v17[2](v17, 1);
    }
  }
  _Block_object_dispose(v21, 8);
}

- (void)updateMenuPositionAnimated:(BOOL)a3
{
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(_UIEditMenuContentPresentation *)self currentMenuLayout];

  if (v5)
  {
    currentListView = self->_currentListView;
    id v7 = [(_UIEditMenuContentPresentation *)self currentMenuLayout];
    [v7 containerBounds];
    -[UIView convertRect:toCoordinateSpace:](currentListView, "convertRect:toCoordinateSpace:", v4);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    [(UIView *)self->_currentListView _currentScreenScale];
    double v17 = UIRectRoundToScale(v9, v11, v13, v15, v16);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB20];
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)canPresentEditMenu
{
  return 1;
}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIEditMenuContentPresentation;
  -[_UIEditMenuPresentation didTransitionFrom:to:](&v9, sel_didTransitionFrom_to_, a3);
  if (a4 == 5)
  {
    double v8 = [(_UIEditMenuContentPresentation *)self containerView];
    id v7 = +[_UIEditMenuSceneComponent sceneComponentForView:v8];

    [v7 removeActivePresentation:self];
    [(_UIEditMenuContentPresentation *)self teardownContainerView];
    [(_UIEditMenuPresentation *)self setDismissingConfiguration:0];
  }
  else
  {
    if (a4 != 2) {
      return;
    }
    int v6 = [(_UIEditMenuContentPresentation *)self containerView];
    id v7 = +[_UIEditMenuSceneComponent sceneComponentForView:v6];

    [v7 setActivePresentation:self];
  }
}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  return 0;
}

- (void)_observeSourceViewIfNeeded
{
  if (!self->_observingSourceView)
  {
    v3 = [(_UIEditMenuPresentation *)self sourceView];
    -[UIView _addGeometryChangeObserver:](v3, self);
    self->_observingSourceView = 1;
  }
}

- (void)_endSourceViewObservation
{
  if (self->_observingSourceView)
  {
    v3 = [(_UIEditMenuPresentation *)self sourceView];
    -[UIView _removeGeometryChangeObserver:](v3, self);
    self->_observingSourceView = 0;
  }
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
}

- (void)contentSizeCategoryDidChangeInEditMenuListView:(id)a3
{
  id v8 = a3;
  id v4 = [(_UIEditMenuPresentation *)self sourceView];

  if (v4)
  {
    v5 = [v8 traitCollection];
    int64_t v6 = [(_UIEditMenuContentPresentation *)self _listViewAxisForTraitCollection:v5];
    id v7 = [(_UIEditMenuContentPresentation *)self currentListView];
    [v7 setAxis:v6];

    [(_UIEditMenuContentPresentation *)self _updateMenuPositionAnimated:0 reuseTargetRect:0 forced:1];
  }
  else
  {
    [(_UIEditMenuContentPresentation *)self hideMenuWithReason:0];
  }
}

- (void)editMenuListView:(id)a3 didSelectMenuElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 _isLeaf])
  {
    id v8 = v7;
    objc_super v9 = [(_UIEditMenuPresentation *)self displayedMenu];
    objc_initWeak(&location, self);
    double v10 = [(_UIEditMenuPresentation *)self delegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72___UIEditMenuContentPresentation_editMenuListView_didSelectMenuElement___block_invoke;
    v13[3] = &unk_1E52DF708;
    objc_copyWeak(&v16, &location);
    id v11 = v8;
    id v14 = v11;
    id v12 = v9;
    id v15 = v12;
    [v10 _editMenuPresentation:self didSelectMenuLeaf:v11 completion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_UIEditMenuContentPresentation *)self replaceVisibleMenuWithMenu:v7 reason:1];
  }
}

- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3
{
  return 1;
}

- (id)_currentPlatformMetrics
{
  v2 = [(_UIEditMenuPresentation *)self sourceView];
  v3 = _UIEditMenuGetPlatformMetrics([v2 _userInterfaceIdiom]);

  return v3;
}

- (CGRect)_convertSourceWindowRectToContainerView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(_UIEditMenuContentPresentation *)self containerView];
  objc_super v9 = [v8 _window];
  double v10 = [(_UIEditMenuPresentation *)self sourceView];
  id v11 = [v10 _window];

  if (v9 != v11)
  {
    id v12 = [(_UIEditMenuContentPresentation *)self containerView];
    double v13 = [v12 _window];
    id v14 = [(_UIEditMenuPresentation *)self sourceView];
    id v15 = [v14 _window];
    objc_msgSend(v13, "convertRect:fromWindow:", v15, x, y, width, height);
    double x = v16;
    double y = v17;
    double width = v18;
    double height = v19;
  }
  double v20 = [(_UIEditMenuPresentation *)self sourceView];
  [v20 _currentScreenScale];
  double v22 = UIRectRoundToScale(x, y, width, height, v21);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_queryMenuSourceRectForConfiguration:(id)a3 reuseTargetRect:(BOOL)a4 isValid:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6 && !CGRectIsNull(self->_targetRectInSourceView))
  {
    double x = self->_targetRectInSourceView.origin.x;
    double y = self->_targetRectInSourceView.origin.y;
    double width = self->_targetRectInSourceView.size.width;
    double height = self->_targetRectInSourceView.size.height;
  }
  else
  {
    objc_super v9 = [(_UIEditMenuPresentation *)self delegate];
    [v9 _editMenuPresentation:self targetRectForConfiguration:v8];
    double x = v10;
    double y = v12;
    double width = v14;
    double height = v16;

    self->_targetRectInSourceView.origin.double x = x;
    self->_targetRectInSourceView.origin.double y = y;
    self->_targetRectInSourceView.size.double width = width;
    self->_targetRectInSourceView.size.double height = height;
  }
  double v18 = [(_UIEditMenuPresentation *)self sourceView];
  double v19 = [(_UIEditMenuPresentation *)self sourceView];
  double v20 = [v19 _window];
  objc_msgSend(v18, "convertRect:toView:", v20, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v22, v24, v26, v28);
  double v33 = v29;
  double v34 = v30;
  double v35 = v31;
  double v36 = v32;
  if (a5) {
    *a5 = !CGRectIsNull(*(CGRect *)&v29);
  }

  double v37 = v33;
  double v38 = v34;
  double v39 = v35;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (id)_queryMenuSourceRectsPreferredLayoutRectsForConfiguration:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIEditMenuPresentation *)self delegate];
  BOOL v6 = [v5 _editMenuPresentation:self preferredLayoutRectsForConfiguration:v4];

  if (v6)
  {
    id v7 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v38 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "CGRectValue", v38);
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v21 = [(_UIEditMenuPresentation *)self sourceView];
          double v22 = [(_UIEditMenuPresentation *)self sourceView];
          double v23 = [v22 _window];
          objc_msgSend(v21, "convertRect:toView:", v23, v14, v16, v18, v20);
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v25, v27, v29, v31);
          double x = v46.origin.x;
          double y = v46.origin.y;
          double width = v46.size.width;
          double height = v46.size.height;
          if (!CGRectIsNull(v46))
          {
            double v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
            [v7 addObject:v36];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v10);
    }

    BOOL v6 = v38;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)_listViewAxisForTraitCollection:(id)a3
{
  v3 = [a3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)_shouldReuseVisibleMenu
{
  v3 = [(_UIEditMenuPresentation *)self sourceView];
  id v4 = [v3 traitCollection];
  int64_t v5 = [(_UIEditMenuContentPresentation *)self _listViewAxisForTraitCollection:v4];

  return [(_UIEditMenuPresentation *)self currentState] == 2 && v5 == 0;
}

- (void)_reloadMenuLayoutWithSourceRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v10 = [(_UIEditMenuPresentation *)self activeConfiguration];
  uint64_t v11 = [(_UIEditMenuContentPresentation *)self currentListView];
  double v12 = [(_UIEditMenuContentPresentation *)self containerView];
  double v13 = [v12 traitCollection];
  int64_t v14 = [(_UIEditMenuContentPresentation *)self _listViewAxisForTraitCollection:v13];

  double v15 = -[_UIEditMenuContentPresentation _resolvedLayoutForMenuWithConfiguration:sourceRect:axis:](self, "_resolvedLayoutForMenuWithConfiguration:sourceRect:axis:", v10, v14, x, y, width, height);
  [(_UIEditMenuContentPresentation *)self setCurrentMenuLayout:v15];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __75___UIEditMenuContentPresentation__reloadMenuLayoutWithSourceRect_animated___block_invoke;
  double v23 = &unk_1E52D9F98;
  id v24 = v11;
  id v25 = v15;
  id v16 = v15;
  id v17 = v11;
  double v18 = _Block_copy(&v20);
  double v19 = v18;
  if (v4) {
    -[_UIEditMenuPresentation animateFadeWithDelay:animations:completion:](self, "animateFadeWithDelay:animations:completion:", v18, 0, 0.0, v20, v21, v22, v23, v24, v25);
  }
  else {
    (*((void (**)(void *))v18 + 2))(v18);
  }
}

- (void)sourceViewDidUpdateFromTraitCollection:(id)a3
{
  int64_t v4 = [(_UIEditMenuPresentation *)self resolvedUserInterfaceStyle];
  [(_UIEditMenuContentPresentation *)self setUserInterfaceStyle:v4];
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    id v4 = [(_UIEditMenuContentPresentation *)self containerView];
    [v4 setOverrideUserInterfaceStyle:a3];
  }
}

- (void)_updateMenuPositionAnimated:(BOOL)a3 reuseTargetRect:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(_UIEditMenuPresentation *)self activeConfiguration];
  if (v9)
  {
    char v27 = 1;
    [(_UIEditMenuContentPresentation *)self _queryMenuSourceRectForConfiguration:v9 reuseTargetRect:v6 isValid:&v27];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    if (v27)
    {
      double v18 = [(_UIEditMenuContentPresentation *)self currentMenuLayout];
      [v18 menuSourceRect];
      v35.origin.double x = v19;
      v35.origin.double y = v20;
      v35.size.double width = v21;
      v35.size.double height = v22;
      v33.origin.double x = v11;
      v33.origin.double y = v13;
      v33.size.double width = v15;
      v33.size.double height = v17;
      BOOL v23 = CGRectEqualToRect(v33, v35);

      if (a5 || !v23) {
        -[_UIEditMenuContentPresentation _reloadMenuLayoutWithSourceRect:animated:](self, "_reloadMenuLayoutWithSourceRect:animated:", v7, v11, v13, v15, v17);
      }
    }
    else
    {
      id v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("EditMenuInteraction", &_updateMenuPositionAnimated_reuseTargetRect_forced____s_category)+ 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = v24;
        v34.origin.double x = v11;
        v34.origin.double y = v13;
        v34.size.double width = v15;
        v34.size.double height = v17;
        double v26 = NSStringFromCGRect(v34);
        *(_DWORD *)buf = 138412546;
        double v29 = v9;
        __int16 v30 = 2112;
        double v31 = v26;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) has an invalid target rect (%@); ignoring update.",
          buf,
          0x16u);
      }
    }
  }
}

- (id)_resolvedLayoutForMenuWithConfiguration:(id)a3 sourceRect:(CGRect)a4 axis:(int64_t)a5
{
  double rect = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  double v12 = [(_UIEditMenuContentPresentation *)self currentListView];

  if (!v12)
  {
    v155 = [MEMORY[0x1E4F28B00] currentHandler];
    [v155 handleFailureInMethod:a2 object:self file:@"_UIEditMenuContentPresentation.m" lineNumber:637 description:@"Cannot resolve the menu layout without a list view."];
  }
  CGFloat v164 = y;
  CGFloat v165 = x;
  CGFloat v163 = width;
  double v13 = [(_UIEditMenuPresentation *)self sourceView];

  if (!v13)
  {
    v156 = [MEMORY[0x1E4F28B00] currentHandler];
    [v156 handleFailureInMethod:a2 object:self file:@"_UIEditMenuContentPresentation.m" lineNumber:638 description:@"Cannot resolve the menu layout without a source view to the edit menu."];
  }
  unint64_t v14 = [v11 preferredArrowDirection] - 3;
  double v15 = [(_UIEditMenuContentPresentation *)self containerView];
  +[UIViewController _horizontalContentMarginForView:v15];
  CGFloat v17 = v16;

  [(_UIEditMenuContentPresentation *)self _preferredContentInsetsForContainerViewWithConfiguration:v11];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v26 = [(_UIEditMenuContentPresentation *)self containerView];
  [v26 bounds];
  CGFloat v28 = v21 + v27;
  CGFloat v30 = v19 + v29;
  CGFloat v32 = v31 - (v21 + v25);
  CGFloat v34 = v33 - (v19 + v23);

  v199.origin.CGFloat x = v28;
  v199.origin.CGFloat y = v30;
  v199.size.CGFloat width = v32;
  v199.size.double height = v34;
  CGRect v200 = CGRectInset(v199, v17, 0.0);
  double v183 = v200.origin.y;
  double v185 = v200.origin.x;
  double v35 = v200.size.width;
  double height = v200.size.height;
  uint64_t v37 = [v11 preferredArrowDirection];
  uint64_t v195 = v37;
  double v38 = v164;
  v201.origin.CGFloat x = v165;
  v201.origin.CGFloat y = v164;
  double v39 = v163;
  v201.size.CGFloat width = v163;
  v201.size.double height = rect;
  CGFloat MidX = CGRectGetMidX(v201);
  v202.origin.CGFloat x = v165;
  v202.origin.CGFloat y = v164;
  v202.size.CGFloat width = v163;
  v202.size.double height = rect;
  double v193 = MidX;
  double MidY = CGRectGetMidY(v202);
  __asm { FMOV            V0.2D, #0.5 }
  long long v192 = _Q0;
  int v45 = [(_UIEditMenuContentPresentation *)self currentListView];
  CGRect v46 = [(_UIEditMenuContentPresentation *)self containerView];
  double r2_16 = height;
  double r2_24 = v35;
  objc_msgSend(v45, "intrinsicContentSizeForContainer:containerSize:", v46, v35, height);
  double v48 = v47;
  double v50 = v49;

  v51 = [(_UIEditMenuContentPresentation *)self currentListView];
  [v51 arrowSizeForDirection:v37];
  double v53 = v52;
  double v55 = v54;

  double v56 = -0.0;
  if (v14 >= 2) {
    double v57 = v55;
  }
  else {
    double v57 = -0.0;
  }
  double v58 = v50 + v57;
  if (v14 < 2) {
    double v56 = v53;
  }
  if (v37)
  {
    double v59 = v165;
  }
  else
  {
    double r2 = v56;
    double r2_8 = v48;
    double v186 = v58;
    double v60 = v58 + 6.0;
    if ([v11 _prefersMenuPresentationInView])
    {
      double v61 = v60;
      double v62 = v60 * 5.0;
      char v63 = [(_UIEditMenuPresentation *)self sourceView];
      v64 = [(_UIEditMenuPresentation *)self sourceView];
      [v64 bounds];
      double v66 = v65;
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;
      v73 = [(_UIEditMenuPresentation *)self sourceView];
      v74 = [v73 _window];
      objc_msgSend(v63, "convertRect:toView:", v74, v66, v68, v70, v72);
      CGFloat v76 = v75;
      CGFloat v78 = v77;
      CGFloat v80 = v79;
      CGFloat v82 = v81;

      v83 = [(_UIEditMenuPresentation *)self sourceView];
      v84 = [v83 _window];
      [v84 bounds];
      v240.origin.CGFloat x = v85;
      v240.origin.CGFloat y = v86;
      v240.size.CGFloat width = v87;
      v240.size.double height = v88;
      v203.origin.CGFloat x = v76;
      v203.origin.CGFloat y = v78;
      v203.size.CGFloat width = v80;
      v203.size.double height = v82;
      CGRect v204 = CGRectIntersection(v203, v240);
      double v89 = v204.origin.x;
      double v90 = v204.origin.y;
      double v91 = v204.size.width;
      double v92 = v204.size.height;

      -[_UIEditMenuContentPresentation _convertSourceWindowRectToContainerView:](self, "_convertSourceWindowRectToContainerView:", v89, v90, v91, v92);
      if (v96 > v62)
      {
        v241.origin.CGFloat x = v93;
        v241.origin.CGFloat y = v94;
        v241.size.CGFloat width = v95;
        v241.size.double height = v96;
        v205.origin.CGFloat y = v183;
        v205.origin.CGFloat x = v185;
        v205.size.double height = r2_16;
        v205.size.CGFloat width = r2_24;
        CGRect v206 = CGRectIntersection(v205, v241);
        double v183 = v206.origin.y;
        double v185 = v206.origin.x;
        double r2_16 = v206.size.height;
        double r2_24 = v206.size.width;
      }
      double v39 = v163;
      double v59 = v165;
      double v60 = v61;
    }
    else
    {
      double v59 = v165;
    }
    v207.origin.CGFloat x = v185;
    v207.origin.CGFloat y = v183;
    v207.size.CGFloat width = r2_24;
    v207.size.double height = r2_16;
    double v97 = v60 + CGRectGetMinY(v207);
    v208.origin.CGFloat x = v185;
    v208.origin.CGFloat y = v183;
    v208.size.CGFloat width = r2_24;
    v208.size.double height = r2_16;
    double MaxY = CGRectGetMaxY(v208);
    if (a5)
    {
      double v99 = MaxY - v60;
      v209.origin.CGFloat x = v59;
      double v38 = v164;
      v209.origin.CGFloat y = v164;
      v209.size.CGFloat width = v39;
      v209.size.double height = rect;
      double v100 = v97 - CGRectGetMinY(v209);
      v210.origin.CGFloat x = v59;
      v210.origin.CGFloat y = v164;
      v210.size.CGFloat width = v39;
      v210.size.double height = rect;
      _NF = CGRectGetMaxY(v210) - v99 < v100;
    }
    else
    {
      v211.origin.CGFloat x = v59;
      double v38 = v164;
      v211.origin.CGFloat y = v164;
      v211.size.CGFloat width = v39;
      v211.size.double height = rect;
      _NF = CGRectGetMinY(v211) < v97;
    }
    int v102 = _NF;
    double v56 = r2;
    double v48 = r2_8;
    if (v102) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = 2;
    }
    uint64_t v195 = v37;
    double v58 = v186;
  }
  double v103 = v48 + v56;
  if (a5)
  {
    if (v37 == 2)
    {
      v214.origin.CGFloat x = v59;
      v214.origin.CGFloat y = v38;
      v214.size.CGFloat width = v39;
      v214.size.double height = rect;
      double v105 = v58;
      double MinY = CGRectGetMinY(v214);
      v215.origin.CGFloat y = v183;
      v215.origin.CGFloat x = v185;
      v215.size.double height = r2_16;
      v215.size.CGFloat width = r2_24;
      double v107 = CGRectGetMinY(v215);
    }
    else
    {
      double v104 = v58;
      if (v37 != 1)
      {
LABEL_33:
        double v58 = fmin(v58, fmax(v58 * 0.5, v104));
        goto LABEL_34;
      }
      v212.origin.CGFloat y = v183;
      v212.origin.CGFloat x = v185;
      v212.size.double height = r2_16;
      v212.size.CGFloat width = r2_24;
      double v105 = v58;
      double MinY = CGRectGetMaxY(v212);
      v213.origin.CGFloat x = v59;
      v213.origin.CGFloat y = v38;
      v213.size.CGFloat width = v39;
      v213.size.double height = rect;
      double v107 = CGRectGetMaxY(v213);
    }
    double v108 = MinY - v107;
    double v58 = v105;
    double v104 = v108 + -6.0;
    goto LABEL_33;
  }
LABEL_34:
  double v175 = v103;
  -[_UIEditMenuContentPresentation _resolvedMenuPositionForArrowDirection:availableBounds:sourceRect:menuSize:menuPosition:anchorPoint:](self, "_resolvedMenuPositionForArrowDirection:availableBounds:sourceRect:menuSize:menuPosition:anchorPoint:", &v195, &v193, &v192, v185, v183, r2_24, r2_16, v59, v38, v39, rect, *(void *)&v103, *(void *)&v58);
  v216.origin.CGFloat x = v185;
  v216.origin.CGFloat y = v183;
  v216.size.CGFloat width = r2_24;
  v216.size.double height = r2_16;
  double r2_8a = CGRectGetMinX(v216);
  v217.origin.CGFloat x = v185;
  v217.origin.CGFloat y = v183;
  v217.size.CGFloat width = r2_24;
  v217.size.double height = r2_16;
  double v162 = CGRectGetMinY(v217);
  v218.origin.CGFloat x = v185;
  v218.origin.CGFloat y = v183;
  v218.size.CGFloat width = r2_24;
  v218.size.double height = r2_16;
  double MaxX = CGRectGetMaxX(v218);
  v219.origin.CGFloat x = v185;
  v219.origin.CGFloat y = v183;
  double v109 = v103;
  v219.size.CGFloat width = r2_24;
  v219.size.double height = r2_16;
  double v110 = CGRectGetMaxY(v219);
  double v111 = v193 - v109 * *(double *)&v192;
  double v112 = MidY - v58 * *((double *)&v192 + 1);
  double v161 = v109 + v111;
  v113 = [(_UIEditMenuContentPresentation *)self _queryMenuSourceRectsPreferredLayoutRectsForConfiguration:v11];
  v114 = v113;
  CGFloat v187 = v58;
  if (v14 >= 2 && v113)
  {
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    id v115 = v113;
    uint64_t v116 = [v115 countByEnumeratingWithState:&v188 objects:v196 count:16];
    if (v116)
    {
      uint64_t v117 = v116;
      CGFloat v171 = v111;
      double v158 = v110;
      CGFloat v174 = v112;
      int64_t v157 = a5;
      uint64_t v118 = *(void *)v189;
LABEL_38:
      uint64_t v119 = 0;
      while (1)
      {
        if (*(void *)v189 != v118) {
          objc_enumerationMutation(v115);
        }
        [*(id *)(*((void *)&v188 + 1) + 8 * v119) CGRectValue];
        CGFloat v120 = v220.origin.x;
        CGFloat v121 = v220.origin.y;
        CGFloat v122 = v220.size.width;
        CGFloat v123 = v220.size.height;
        double v173 = CGRectGetMaxX(v220);
        v221.origin.CGFloat y = v183;
        v221.origin.CGFloat x = v185;
        v221.size.double height = r2_16;
        v221.size.CGFloat width = r2_24;
        double v172 = CGRectGetMaxX(v221);
        CGFloat r2a = v120;
        v222.origin.CGFloat x = v120;
        v222.origin.CGFloat y = v121;
        v222.size.CGFloat width = v122;
        v222.size.double height = v123;
        v242.origin.CGFloat x = r2_8a;
        v242.origin.CGFloat y = v112;
        v242.size.CGFloat width = r2_24;
        v242.size.double height = v58;
        CGRect v223 = CGRectIntersection(v222, v242);
        CGRect v224 = CGRectStandardize(v223);
        CGFloat v124 = v224.origin.x;
        CGFloat v125 = v224.origin.y;
        CGFloat v126 = v224.size.width;
        CGFloat v127 = v224.size.height;
        if (!CGRectIsNull(v224))
        {
          v225.origin.CGFloat x = v171;
          v225.origin.CGFloat y = v112;
          v225.size.CGFloat width = v175;
          v225.size.double height = v187;
          if (!CGRectIsNull(v225))
          {
            v226.origin.CGFloat x = v124;
            v226.origin.CGFloat y = v125;
            v226.size.CGFloat width = v126;
            v226.size.double height = v127;
            CGRect v227 = CGRectStandardize(v226);
            CGFloat v168 = v227.origin.y;
            CGFloat v169 = v227.origin.x;
            CGFloat v166 = v227.size.height;
            CGFloat v167 = v227.size.width;
            v227.origin.CGFloat x = v171;
            v227.origin.CGFloat y = v112;
            v227.size.CGFloat width = v175;
            v227.size.double height = v187;
            CGRect v228 = CGRectStandardize(v227);
            CGRect v243 = CGRectInset(v228, 0.0001, 0.0001);
            v229.origin.CGFloat y = v168;
            v229.origin.CGFloat x = v169;
            v229.size.double height = v166;
            v229.size.CGFloat width = v167;
            if (CGRectContainsRect(v229, v243))
            {
              double v109 = v175;
              double v39 = v163;
              double v38 = v164;
              double v59 = v165;
              a5 = v157;
              double v58 = v187;
LABEL_56:
              double v110 = v158;
              double v111 = v171;
              goto LABEL_57;
            }
          }
        }
        v230.origin.CGFloat x = v124;
        v230.origin.CGFloat y = v125;
        v230.size.CGFloat width = v126;
        v230.size.double height = v127;
        if (CGRectGetWidth(v230) > 180.0) {
          break;
        }
        ++v119;
        double v58 = v187;
        if (v117 == v119)
        {
          uint64_t v117 = [v115 countByEnumeratingWithState:&v188 objects:v196 count:16];
          if (v117) {
            goto LABEL_38;
          }
          double v109 = v175;
          double v39 = v163;
          double v38 = v164;
          double v59 = v165;
          a5 = v157;
          goto LABEL_56;
        }
      }
      v231.origin.CGFloat x = v124;
      v231.origin.CGFloat y = v125;
      v231.size.CGFloat width = v126;
      v231.size.double height = v127;
      double v128 = CGRectGetWidth(v231);
      if (v175 >= v128) {
        double v129 = v128;
      }
      else {
        double v129 = v175;
      }
      if (v173 <= v172)
      {
        v232.origin.CGFloat x = r2a;
        v232.origin.CGFloat y = v121;
        v232.size.CGFloat width = v122;
        v232.size.double height = v123;
        double v130 = CGRectGetMaxX(v232) - v129;
        a5 = v157;
      }
      else
      {
        a5 = v157;
        double v130 = r2a;
      }
      double v109 = v129;
      CGFloat r2b = v130;
      double v161 = v129 + v130;
      v233.origin.CGFloat x = v124;
      v233.origin.CGFloat y = v125;
      v233.size.CGFloat width = v126;
      v233.size.double height = v127;
      double r2_8a = CGRectGetMinX(v233);
      v234.origin.CGFloat x = v124;
      v234.origin.CGFloat y = v125;
      v234.size.CGFloat width = v126;
      v234.size.double height = v127;
      double v162 = CGRectGetMinY(v234);
      v235.origin.CGFloat x = v124;
      v235.origin.CGFloat y = v125;
      v235.size.CGFloat width = v126;
      v235.size.double height = v127;
      double MaxX = CGRectGetMaxX(v235);
      v236.origin.CGFloat x = v124;
      v236.origin.CGFloat y = v125;
      v236.size.CGFloat width = v126;
      v236.size.double height = v127;
      CGFloat v159 = CGRectGetMaxY(v236);
      long long v184 = v192;
      v237.origin.CGFloat x = v171;
      double v112 = v174;
      v237.size.CGFloat width = v175;
      v237.origin.CGFloat y = v174;
      v237.size.double height = v187;
      CGRect v238 = CGRectStandardize(v237);
      double v131 = v238.origin.x;
      double v132 = v238.origin.y;
      double v133 = v238.size.width;
      double v134 = v238.size.height;
      v238.origin.CGFloat x = r2b;
      v238.origin.CGFloat y = v174;
      v238.size.CGFloat width = v109;
      v238.size.double height = v187;
      CGRect v239 = CGRectStandardize(v238);
      double v135 = *(double *)&v184 * v133;
      double v110 = v159;
      double v136 = v131 + v135;
      double v58 = v187;
      *(double *)&long long v192 = (v136 - v239.origin.x) / v239.size.width;
      *((double *)&v192 + 1) = (v132 + *((double *)&v184 + 1) * v134 - v239.origin.y) / v239.size.height;
      double v111 = r2b;
      double v39 = v163;
      double v38 = v164;
      double v59 = v165;
    }
LABEL_57:
  }
  if (v111 >= r2_8a)
  {
    if (v161 <= MaxX) {
      goto LABEL_69;
    }
    double v140 = fmax(v109 - (v161 - MaxX), 180.0);
    double v141 = v140 - v109;
    if (v14 < 2) {
      double v109 = v140;
    }
    else {
      double v141 = -0.0;
    }
    double v139 = (v161 - MaxX + v141) / v109 + *(double *)&v192;
  }
  else
  {
    double v137 = fmax(v109 - (r2_8a - v111), 180.0);
    double v138 = v137 - v109;
    if (v14 < 2) {
      double v109 = v137;
    }
    else {
      double v138 = -0.0;
    }
    double v139 = *(double *)&v192 - (r2_8a - v111 + v138) / v109;
  }
  *(double *)&long long v192 = v139;
LABEL_69:
  if (v112 >= v162)
  {
    if (v58 + v112 <= v110) {
      goto LABEL_74;
    }
    double v142 = (v58 + v112 - v110) / v58 + *((double *)&v192 + 1);
  }
  else
  {
    double v142 = *((double *)&v192 + 1) - (v162 - v112) / v58;
  }
  *((double *)&v192 + 1) = v142;
LABEL_74:
  if (v14 >= 2)
  {
    v143 = [(_UIEditMenuPresentation *)self sourceView];
    v144 = [v143 traitCollection];
    +[_UIEditMenuListView minimumRequiredWidthForArrowInRoundedListViewForAxis:a5 traitCollection:v144];
    double v146 = v145 / v109;

    if (*(double *)&v192 >= v146)
    {
      double v147 = 1.0 - v146;
      BOOL v148 = *(double *)&v192 <= 1.0 - v146;
      double v58 = v187;
      if (!v148)
      {
        double v193 = v109 * (v147 - *(double *)&v192) + v193;
        *(double *)&long long v192 = v147;
      }
    }
    else
    {
      double v193 = v109 * (v146 - *(double *)&v192) + v193;
      *(double *)&long long v192 = v146;
      double v58 = v187;
    }
  }
  v149 = objc_opt_new();
  objc_msgSend(v149, "setContainerBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v109, v58);
  v150 = [(_UIEditMenuContentPresentation *)self containerView];
  double v151 = v193;
  double v152 = MidY;
  [v150 _currentScreenScale];
  objc_msgSend(v149, "setMenuPosition:", UIPointRoundToScale(v151, v152, v153));

  [v149 setAnchorPoint:v192];
  [v149 setArrowDirection:v195];
  objc_msgSend(v149, "setMenuSourceRect:", v59, v38, v39, rect);

  return v149;
}

- (UIEdgeInsets)_preferredContentInsetsForContainerViewWithConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIEditMenuContentPresentation *)self containerView];
  [v5 safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  unint64_t v14 = [v5 window];
  if ([v14 _isRemoteKeyboardWindow])
  {
LABEL_9:

    goto LABEL_10;
  }
  char v15 = [v4 _ignoresKeyboardAvoidance];

  if ((v15 & 1) == 0)
  {
    unint64_t v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    if ([v14 isOnScreen])
    {
      double v16 = [v5 window];
      char v17 = [v16 _isTextEffectsWindow];

      if (v17)
      {
        [v14 visibleInputViewFrameInView:v5];
        CGFloat rect = v18;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [v5 bounds];
        double MaxY = CGRectGetMaxY(v33);
        v34.origin.CGFloat x = rect;
        v34.origin.CGFloat y = v20;
        v34.size.CGFloat width = v22;
        v34.size.double height = v24;
        double v26 = fmax(MaxY - CGRectGetMinY(v34), 0.0);
      }
      else
      {
        [v14 verticalOverlapForView:v5 usingKeyboardInfo:0];
      }
      double v27 = v26 + 6.0;
      if (v11 < v27) {
        double v11 = v27;
      }
    }
    goto LABEL_9;
  }
LABEL_10:

  double v28 = v7;
  double v29 = v9;
  double v30 = v11;
  double v31 = v13;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (void)_resolvedMenuPositionForArrowDirection:(int64_t *)a3 availableBounds:(CGRect)a4 sourceRect:(CGRect)a5 menuSize:(CGSize)a6 menuPosition:(CGPoint *)a7 anchorPoint:(CGPoint *)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v11 = a5.size.height;
  CGFloat v12 = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v15 = a4.size.width;
  CGFloat v16 = a4.origin.y;
  CGFloat v17 = a4.origin.x;
  int64_t v19 = *a3;
  CGFloat r1 = a4.size.height;
  if ((unint64_t)(*a3 - 3) <= 1)
  {
    double MaxX = CGRectGetMaxX(a4);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = v12;
    v66.size.CGFloat height = v11;
    CGFloat v21 = CGRectGetMaxX(v66);
    v67.size.CGFloat width = v12;
    v67.size.CGFloat height = v11;
    double v22 = MaxX - v21 + -6.0;
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    double MinX = CGRectGetMinX(v67);
    v68.origin.CGFloat x = v17;
    v68.origin.CGFloat y = v16;
    v68.size.CGFloat width = v15;
    v68.size.CGFloat height = r1;
    double v24 = MinX - CGRectGetMinX(v68) + -6.0;
    double v25 = [(_UIEditMenuPresentation *)self sourceView];
    double v26 = _UIEditMenuGetPlatformMetrics([v25 _userInterfaceIdiom]);
    [v26 horizontalMenuMaximumWidth];
    double v28 = v27 * 0.35;

    if ((v19 != 3 || (v64 > v22 ? (BOOL v29 = v22 < v28) : (BOOL v29 = 0), v29 ? (v30 = v24 <= v22) : (v30 = 1), v30))
      && (v19 != 4 || (v64 > v24 ? (BOOL v31 = v24 < v28) : (BOOL v31 = 0), v31 ? (v32 = v24 <= v22) : (v32 = 0), v32)))
    {
      *a3 = 3;
      **(void **)&CGFloat height = 0;
      double v52 = CGRectGetMaxX(a5);
      v75.origin.CGFloat x = v17;
      v75.origin.CGFloat y = v16;
      v75.size.CGFloat width = v15;
      v75.size.CGFloat height = r1;
      double v34 = fmin(v52, CGRectGetMaxX(v75));
      double v35 = 6.0;
    }
    else
    {
      *a3 = 4;
      **(void **)&CGFloat height = 0x3FF0000000000000;
      double v33 = CGRectGetMinX(a5);
      v69.origin.CGFloat x = v17;
      v69.origin.CGFloat y = v16;
      v69.size.CGFloat width = v15;
      v69.size.CGFloat height = r1;
      double v34 = fmax(v33, CGRectGetMinX(v69));
      double v35 = -6.0;
    }
    **(double **)&CGFloat width = v34 + v35;
    return;
  }
  CGFloat v59 = a4.size.width;
  CGFloat v37 = a4.size.height;
  double MaxY = CGRectGetMaxY(a4);
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.CGFloat width = v12;
  v70.size.CGFloat height = v11;
  CGFloat v39 = CGRectGetMaxY(v70);
  v71.size.CGFloat height = v11;
  double v40 = -6.0;
  v71.size.CGFloat width = v12;
  double v41 = MaxY - v39 + -6.0;
  v71.origin.CGFloat x = x;
  v71.origin.CGFloat y = y;
  double MinY = CGRectGetMinY(v71);
  v72.origin.CGFloat x = v17;
  v72.origin.CGFloat y = v16;
  v72.size.CGFloat width = v59;
  v72.size.CGFloat height = v37;
  double v43 = MinY - CGRectGetMinY(v72) + -6.0;
  if (v19 == 1 && v65 > v41 && v43 > v41) {
    goto LABEL_33;
  }
  if (v19 == 2)
  {
    if (v65 <= v43 || v43 > v41)
    {
LABEL_33:
      *a3 = 2;
      *(void *)(*(void *)&height + 8) = 0x3FF0000000000000;
      v73.origin.CGFloat x = v17;
      v73.origin.CGFloat y = v16;
      v73.size.CGFloat width = v59;
      v73.size.CGFloat height = v37;
      double v47 = v65 + CGRectGetMinY(v73) + 6.0;
      v74.origin.CGFloat x = v17;
      v74.origin.CGFloat y = v16;
      v74.size.CGFloat width = v59;
      v74.size.CGFloat height = v37;
      double v48 = CGRectGetMaxY(v74) + 6.0;
      CGFloat v49 = a5.origin.x;
      CGFloat v50 = a5.origin.y;
      double v51 = CGRectGetMinY(a5);
      goto LABEL_42;
    }
    *a3 = 1;
LABEL_41:
    *(void *)(*(void *)&height + 8) = 0;
    v76.origin.CGFloat x = v17;
    v76.origin.CGFloat y = v16;
    v76.size.CGFloat width = v59;
    v76.size.CGFloat height = v37;
    double v47 = CGRectGetMinY(v76) + -6.0;
    v77.origin.CGFloat x = v17;
    v77.origin.CGFloat y = v16;
    v77.size.CGFloat width = v59;
    v77.size.CGFloat height = v37;
    double v48 = CGRectGetMaxY(v77) - v65 + -6.0;
    CGFloat v49 = a5.origin.x;
    CGFloat v50 = a5.origin.y;
    double v51 = CGRectGetMaxY(a5);
    double v40 = 6.0;
LABEL_42:
    double v58 = v47;
    double v53 = fmax(v47, fmin(v51, v48));
    if (v53 == v51)
    {
      *(double *)(*(void *)&width + 8) = v51 + v40;
    }
    else
    {
      v78.origin.CGFloat x = v17;
      v78.origin.CGFloat y = v16;
      v78.size.CGFloat width = v59;
      v78.size.CGFloat height = r1;
      v81.origin.CGFloat x = v49;
      v81.origin.CGFloat y = v50;
      v81.size.CGFloat width = a5.size.width;
      v81.size.CGFloat height = a5.size.height;
      CGRect v79 = CGRectIntersection(v78, v81);
      CGFloat v54 = v79.origin.x;
      CGFloat v55 = v79.origin.y;
      CGFloat v56 = v79.size.width;
      CGFloat v57 = v79.size.height;
      if (!CGRectIsNull(v79))
      {
        v80.origin.CGFloat x = v54;
        v80.origin.CGFloat y = v55;
        v80.size.CGFloat width = v56;
        v80.size.CGFloat height = v57;
        double v53 = fmax(v58, fmin(CGRectGetMidY(v80), v48));
      }
      *(double *)(*(void *)&width + 8) = v53;
    }
    return;
  }
  *a3 = v19;
  if (v19 == 1) {
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v43);
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEditMenuContentPresentation.m", 926, @"Failed to resolve undefined UIEditMenuArrowDirection: %ld", v19);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (_UIEditMenuListView)currentListView
{
  return self->_currentListView;
}

- (_UIEditMenuPresentationLayout)currentMenuLayout
{
  return self->_currentMenuLayout;
}

- (void)setCurrentMenuLayout:(id)a3
{
}

- (CGRect)targetRectInSourceView
{
  double x = self->_targetRectInSourceView.origin.x;
  double y = self->_targetRectInSourceView.origin.y;
  double width = self->_targetRectInSourceView.size.width;
  double height = self->_targetRectInSourceView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)observingSourceView
{
  return self->_observingSourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMenuLayout, 0);
  objc_storeStrong((id *)&self->_currentListView, 0);
}

@end