@interface _UIContextMenuPresentation
- (BOOL)contextMenuUIControllerShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3;
- (BOOL)suppressInputViewDuringPresentation;
- (NSArray)visibleMenus;
- (_UIContextMenuPresentation)initWithPresentingViewController:(id)a3 configuration:(id)a4 style:(id)a5;
- (_UIContextMenuPresentationDelegate)delegate;
- (_UIContextMenuUIController)uiController;
- (_UIFulfilledContextMenuConfiguration)menuConfiguration;
- (id)_platformMetrics;
- (id)contextMenuUIController:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5;
- (id)contextMenuUIController:(id)a3 willDisplayMenu:(id)a4;
- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4;
- (id)preferredFocusEnvironmentsForContextMenuPreviewPresentationController:(id)a3;
- (id)previewForCancellingDragItem:(id)a3;
- (id)windowSceneActivationPreview;
- (void)contextMenuPreviewPresentationController:(id)a3 didChangePreviewContentSize:(CGSize)a4;
- (void)contextMenuUIController:(id)a3 didBeginDragWithTouch:(id)a4;
- (void)contextMenuUIController:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6;
- (void)contextMenuUIController:(id)a3 didSelectMenuLeaf:(id)a4;
- (void)contextMenuUIControllerDidEndPanInteraction:(id)a3;
- (void)contextMenuUIControllerWillPerformLayout:(id)a3 withPreviewSize:(CGSize)a4;
- (void)dismiss;
- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4;
- (void)dragWillCancelWithAnimator:(id)a3;
- (void)prepareToDismiss;
- (void)prepareToPresent;
- (void)present;
- (void)requestMenuDismissal;
- (void)retargetDismissingMenuToPreview:(id)a3;
- (void)setAlongsideAnimatorForDismissal:(id)a3;
- (void)setAlongsideAnimatorForPresentation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuppressInputViewDuringPresentation:(BOOL)a3;
- (void)viewTraitCollectionDidChange;
@end

@implementation _UIContextMenuPresentation

- (_UIContextMenuPresentation)initWithPresentingViewController:(id)a3 configuration:(id)a4 style:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 previewViewController];
  if ([v9 preferredLayout] == 3 || objc_msgSend(v9, "preferredLayout") == 1 && !v11)
  {
    v12 = [_UIContextMenuActionsOnlyViewController alloc];
    v13 = [v8 sourcePreview];
    uint64_t v14 = [(_UIContextMenuActionsOnlyViewController *)v12 initWithTargetedPreview:v13];

    v11 = (void *)v14;
  }
  v15 = [(UIPresentationController *)[_UIContextMenuPreviewPresentationController alloc] initWithPresentedViewController:v11 presentingViewController:v10];

  [(_UIContextMenuPreviewPresentationController *)v15 setMenuPresentationDelegate:self];
  [(_UIContextMenuPreviewPresentationController *)v15 setMenuStyle:v9];
  v24.receiver = self;
  v24.super_class = (Class)_UIContextMenuPresentation;
  v16 = [(_UIClickPresentation *)&v24 initWithPresentedViewController:v11 presentationController:v15];
  if (v16)
  {
    v17 = [[_UIContextMenuUIController alloc] initWithConfiguration:v8 style:v9];
    uiController = v16->_uiController;
    v16->_uiController = v17;
    v19 = v17;

    [(_UIContextMenuUIController *)v16->_uiController setDelegate:v16];
    v20 = [(_UIContextMenuUIController *)v19 platterContainerView];
    [(_UIClickPresentation *)v16 setCustomViewForTouchContinuation:v20];

    v21 = [[_UIContextMenuPresentationAnimation alloc] initWithUIController:v19 asDismissal:0];
    [(_UIClickPresentation *)v16 setAppearanceTransition:v21];

    v22 = [[_UIContextMenuPresentationAnimation alloc] initWithUIController:v19 asDismissal:1];
    [(_UIClickPresentation *)v16 setDisappearanceTransition:v22];
  }
  return v16;
}

- (_UIFulfilledContextMenuConfiguration)menuConfiguration
{
  v2 = [(_UIContextMenuPresentation *)self uiController];
  v3 = [v2 menuConfiguration];

  return (_UIFulfilledContextMenuConfiguration *)v3;
}

- (NSArray)visibleMenus
{
  v2 = [(_UIContextMenuPresentation *)self uiController];
  v3 = [v2 menuView];
  v4 = [v3 visibleMenus];

  return (NSArray *)v4;
}

- (id)_platformMetrics
{
  v2 = [(_UIContextMenuPresentation *)self uiController];
  v3 = [v2 platterContainerView];
  v4 = [v3 traitCollection];
  v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);

  return v5;
}

- (void)setAlongsideAnimatorForPresentation:(id)a3
{
  id v4 = a3;
  v5 = [(_UIClickPresentation *)self appearanceTransition];
  [v5 setAlongsideAnimator:v4];

  v6 = [(_UIContextMenuPresentation *)self _platformMetrics];
  v7 = [v6 animateAlongsideTransition];

  if (v7)
  {
    id v8 = [v5 alongsideAnimator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66___UIContextMenuPresentation_setAlongsideAnimatorForPresentation___block_invoke;
    v9[3] = &unk_1E52DB330;
    v9[4] = self;
    id v10 = v7;
    [v8 addAnimations:v9];
  }
}

- (void)prepareToPresent
{
  v3 = [(_UIContextMenuPresentation *)self uiController];
  [v3 presentationTransitionWillBegin];
  id v4 = [(_UIClickPresentation *)self appearanceTransition];
  v5 = [(_UIClickPresentation *)self presentationController];
  v6 = [v5 presentedViewController];
  v7 = [v6 view];
  [v4 prepareTransitionToView:v7];

  id v8 = [v4 alongsideAnimator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46___UIContextMenuPresentation_prepareToPresent__block_invoke;
  v10[3] = &unk_1E52D9F70;
  id v11 = v3;
  id v9 = v3;
  [v8 addCompletion:v10];
}

- (void)present
{
  v3 = [(_UIClickPresentation *)self appearanceTransition];
  [v3 performTransition];

  id v4 = [(_UIClickPresentation *)self presentationController];
  v5 = [(_UIContextMenuUIController *)self->_uiController contentPlatterView];
  [v4 menuDidPresentWithContentPlatterView:v5];

  id v8 = [(_UIContextMenuPresentation *)self uiController];
  v6 = [v8 platterContainerView];
  v7 = +[_UIContextMenuSceneComponent sceneComponentForView:v6];
  [v7 registerPresentation:self];
}

- (void)setAlongsideAnimatorForDismissal:(id)a3
{
  id v4 = a3;
  v5 = [(_UIClickPresentation *)self disappearanceTransition];
  [v5 setAlongsideAnimator:v4];

  v6 = [(_UIContextMenuPresentation *)self _platformMetrics];
  v7 = [v6 animateAlongsideTransition];

  if (v7)
  {
    id v8 = [v5 alongsideAnimator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63___UIContextMenuPresentation_setAlongsideAnimatorForDismissal___block_invoke;
    v9[3] = &unk_1E52DB330;
    v9[4] = self;
    id v10 = v7;
    [v8 addAnimations:v9];
  }
}

- (void)prepareToDismiss
{
  v3 = [(_UIContextMenuPresentation *)self uiController];
  [v3 dismissalTransitionWillBegin];
  id v4 = [(_UIContextMenuPresentation *)self uiController];
  v5 = [v4 platterContainerView];
  v6 = +[_UIContextMenuSceneComponent sceneComponentForView:v5];
  [v6 removePresentation:self];

  v7 = [(_UIClickPresentation *)self disappearanceTransition];
  id v8 = [v7 sourcePreview];
  id v9 = [v8 view];
  [v7 prepareTransitionToView:v9];

  id v10 = [v7 alongsideAnimator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46___UIContextMenuPresentation_prepareToDismiss__block_invoke;
  v12[3] = &unk_1E52D9F70;
  id v13 = v3;
  id v11 = v3;
  [v10 addCompletion:v12];
}

- (void)dismiss
{
  id v2 = [(_UIClickPresentation *)self disappearanceTransition];
  [v2 performTransition];
}

- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuPresentation *)self uiController];
  [v8 displayMenu:v7 inPlaceOfMenu:v6];
}

- (void)retargetDismissingMenuToPreview:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuPresentation *)self uiController];
  [v5 retargetDismissingMenuToPreview:v4];
}

- (void)viewTraitCollectionDidChange
{
  id v2 = [(_UIContextMenuPresentation *)self uiController];
  [v2 viewTraitCollectionDidChange];
}

- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UIContextMenuPresentation *)self uiController];
  id v8 = [v7 livePreviewForDragItem:v6 preferringFullSize:v4];

  return v8;
}

- (id)previewForCancellingDragItem:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuPresentation *)self uiController];
  id v6 = [v5 previewForCancellingDragItem:v4];

  return v6;
}

- (void)dragWillCancelWithAnimator:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuPresentation *)self uiController];
  [v5 dragWillCancelWithAnimator:v4];
}

- (id)windowSceneActivationPreview
{
  id v2 = [(_UIContextMenuPresentation *)self uiController];
  v3 = [v2 windowSceneActivationPreview];

  return v3;
}

- (void)requestMenuDismissal
{
  id v3 = [(_UIContextMenuPresentation *)self delegate];
  [v3 contextMenuPresentation:self didRequestDismissalWithReason:5 alongsideActions:0 completion:0];
}

- (id)contextMenuUIController:(id)a3 willDisplayMenu:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIContextMenuPresentation *)self delegate];
  id v7 = [v6 contextMenuPresentation:self willDisplayMenu:v5];

  return v7;
}

- (void)contextMenuUIControllerWillPerformLayout:(id)a3 withPreviewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [(_UIClickPresentation *)self presentationController];
  objc_msgSend(v6, "menuLayoutDidProducePreviewSize:", width, height);
}

- (void)contextMenuUIController:(id)a3 didSelectMenuLeaf:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIContextMenuPresentation *)self delegate];
  [v6 contextMenuPresentation:self didSelectMenuLeaf:v5];
}

- (void)contextMenuUIController:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(_UIContextMenuPresentation *)self delegate];
  [v11 contextMenuPresentation:self didRequestDismissalWithReason:a4 alongsideActions:v10 completion:v9];
}

- (BOOL)contextMenuUIControllerShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3
{
  id v3 = self;
  id v4 = [(_UIContextMenuPresentation *)self delegate];
  LOBYTE(v3) = [v4 contextMenuPresentationShouldAllowSwipeToDismissForBeginningPanInteraction:v3];

  return (char)v3;
}

- (void)contextMenuUIControllerDidEndPanInteraction:(id)a3
{
  id v4 = [(_UIContextMenuPresentation *)self delegate];
  [v4 contextMenuPresentationDidEndPanInteraction:self];
}

- (void)contextMenuUIController:(id)a3 didBeginDragWithTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIContextMenuPresentation *)self delegate];
  [v6 contextMenuPresentation:self didBeginDragWithTouch:v5];
}

- (id)contextMenuUIController:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5
{
  id v7 = a4;
  id v8 = [(_UIContextMenuPresentation *)self delegate];
  id v9 = [v8 contextMenuPresentation:self dismissalPreviewForItem:v7 clientReturnedPreview:a5];

  return v9;
}

- (void)contextMenuPreviewPresentationController:(id)a3 didChangePreviewContentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [(_UIContextMenuPresentation *)self uiController];
  objc_msgSend(v6, "previewSizeDidChange:", width, height);
}

- (id)preferredFocusEnvironmentsForContextMenuPreviewPresentationController:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(_UIContextMenuPresentation *)self uiController];
  id v5 = [v4 menuView];

  if (v5)
  {
    id v6 = [(_UIContextMenuPresentation *)self uiController];
    id v7 = [v6 menuView];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (_UIContextMenuPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIContextMenuPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIContextMenuUIController)uiController
{
  return self->_uiController;
}

- (BOOL)suppressInputViewDuringPresentation
{
  return self->_suppressInputViewDuringPresentation;
}

- (void)setSuppressInputViewDuringPresentation:(BOOL)a3
{
  self->_suppressInputViewDuringPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end