@interface _UIContextMenuUIController
- (BOOL)_dragWasCanceled;
- (BOOL)_isAnimatingPresentation;
- (BOOL)_isPresented;
- (BOOL)_needsToAvoidKeyboardForResponder:(id)a3;
- (BOOL)didAvoidKeyboard;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)menuIsConcealed;
- (BOOL)previewSizeDidChange;
- (BOOL)shouldMaintainKeyboardAssertionForFirstResponder:(id)a3;
- (CGSize)previewSize;
- (UITapGestureRecognizer)dismissalTapGestureRecognizer;
- (UITapGestureRecognizer)platterActionTapGestureRecognizer;
- (UIView)_dragContainerView;
- (UIView)platterContainerView;
- (UIView)platterTransitionView;
- (UIViewFloatAnimatableProperty)backgroundViewAnimationProgress;
- (UIVisualEffectView)backgroundEffectView;
- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)actionScrubbingHandoffGestureRecognizer;
- (_UIContextMenuLayoutArbiter)layoutArbiter;
- (_UIContextMenuLayoutArbiterOutput)currentLayout;
- (_UIContextMenuPanController)platterPanController;
- (_UIContextMenuStyle)menuStyle;
- (_UIContextMenuSubterraneanContainerView)_subterraneanViewContainer;
- (_UIContextMenuUIController)initWithConfiguration:(id)a3 style:(id)a4;
- (_UIContextMenuUIControllerDelegate)delegate;
- (_UIContextMenuView)menuView;
- (_UIFlocker)flocker;
- (_UIFulfilledContextMenuConfiguration)menuConfiguration;
- (_UIMorphingPlatterView)contentPlatterView;
- (_UIPlatterView)_destinationPlatterView;
- (id)_layoutWithUpdatedAttachment:(BOOL)a3 concealedMenu:(BOOL)a4;
- (id)_platformMetrics;
- (id)_postMorphDragItemUpdate;
- (id)_primaryPlatterDragPreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4;
- (id)contextMenuView:(id)a3 willDisplayMenu:(id)a4;
- (id)dismissalPreviewForSecondaryItem:(id)a3 style:(unint64_t)a4;
- (id)dismissalPreviewForStyle:(unint64_t)a3 clientReturnedPreview:(BOOL *)a4;
- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4;
- (id)previewForCancellingDragItem:(id)a3;
- (id)windowSceneActivationPreview;
- (int64_t)_interfaceIdiom;
- (unint64_t)_preferredSubmenuHierarchyStyle;
- (unint64_t)state;
- (void)_adjustViewForKeyboardVisibility:(BOOL)a3 keyboardInfo:(id)a4;
- (void)_cleanUpDragViews;
- (void)_concealMenu;
- (void)_createMenuViewIfNecessaryForMenu:(id)a3;
- (void)_didBeginMorphToDragPreview;
- (void)_didCompleteMorphToDragPreview;
- (void)_displayMenu:(id)a3 updateType:(unint64_t)a4;
- (void)_enumeratePlatterViewsWithBlock:(id)a3;
- (void)_handleActionHandoffGesture:(id)a3;
- (void)_handleDismissalTapGesture:(id)a3;
- (void)_handlePlatterActionTapGesture:(id)a3;
- (void)_installViewsIntoDragContainerView:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_replaceVisibleMenu:(id)a3 withMenu:(id)a4;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_testing_dismissByTappingOutside;
- (void)_testing_tapAnAction;
- (void)_updateActionsViewReversesOrderForAttachment:(unint64_t)a3;
- (void)_updateLayoutAndAttachment:(BOOL)a3;
- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4;
- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4 adjustDetent:(BOOL)a5;
- (void)_updatePlatterContainerViewTraitCollection;
- (void)contextMenuView:(id)a3 didSelectElement:(id)a4;
- (void)dealloc;
- (void)didSelectCancelActionInContextMenuView:(id)a3;
- (void)dismissalTransitionDidEnd;
- (void)dismissalTransitionWillBegin;
- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4;
- (void)dragWillCancelWithAnimator:(id)a3;
- (void)platterPanControllerDidSwipeDown:(id)a3;
- (void)platterPanControllerDidTearOff:(id)a3;
- (void)platterPanInteractionBegan:(id)a3 allowSwipeToDismiss:(BOOL *)a4;
- (void)platterPanInteractionEnded:(id)a3;
- (void)presentationTransitionDidEnd;
- (void)presentationTransitionWillBegin;
- (void)previewSizeDidChange:(CGSize)a3;
- (void)retargetDismissingMenuToPreview:(id)a3;
- (void)setActionScrubbingHandoffGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAvoidKeyboard:(BOOL)a3;
- (void)setDismissalTapGestureRecognizer:(id)a3;
- (void)setLayoutArbiter:(id)a3;
- (void)setMenuConfiguration:(id)a3;
- (void)setMenuIsConcealed:(BOOL)a3;
- (void)setMenuStyle:(id)a3;
- (void)setPlatterActionTapGestureRecognizer:(id)a3;
- (void)setPlatterPanController:(id)a3;
- (void)setPreviewSize:(CGSize)a3;
- (void)setPreviewSizeDidChange:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)set_destinationPlatterView:(id)a3;
- (void)set_dragContainerView:(id)a3;
- (void)set_dragWasCanceled:(BOOL)a3;
- (void)set_postMorphDragItemUpdate:(id)a3;
- (void)set_subterraneanViewContainer:(id)a3;
- (void)viewTraitCollectionDidChange;
@end

@implementation _UIContextMenuUIController

- (_UIContextMenuUIController)initWithConfiguration:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIContextMenuUIController *)self init];
  v9 = v8;
  if (v8)
  {
    [(_UIContextMenuUIController *)v8 setMenuConfiguration:v6];
    [(_UIContextMenuUIController *)v9 setMenuStyle:v7];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__keyboardWillShow_ name:@"UIKeyboardWillShowNotification" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v9 selector:sel__keyboardWillHide_ name:@"UIKeyboardWillHideNotification" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel__sceneWillDeactivate_ name:@"UISceneWillDeactivateNotification" object:0];
  }
  return v9;
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (![(_UIContextMenuUIController *)self _dragWasCanceled]) {
    [(_UIContextMenuUIController *)self _cleanUpDragViews];
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIKeyboardWillShowNotification";
  v6[1] = @"UIKeyboardWillHideNotification";
  v6[2] = @"UISceneWillDeactivateNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuUIController;
  [(_UIContextMenuUIController *)&v5 dealloc];
}

- (void)presentationTransitionWillBegin
{
  v3 = [(_UIContextMenuUIController *)self menuStyle];
  v4 = [v3 containerView];

  if (v4)
  {
    objc_super v5 = [(_UIContextMenuUIController *)self menuStyle];
    id v35 = [v5 containerView];
  }
  else
  {
    objc_super v5 = [(_UIContextMenuUIController *)self menuConfiguration];
    id v6 = [v5 sourcePreview];
    id v7 = [v6 view];
    id v35 = [v7 _window];
  }
  v8 = _UIContextMenuGetPlatformMetrics([(_UIContextMenuUIController *)self _interfaceIdiom]);
  v9 = [v8 containerViewProvider];

  if (v9)
  {
    v10 = [(_UIContextMenuUIController *)self menuConfiguration];
    v11 = [v10 sourcePreview];
    v12 = [(_UIContextMenuUIController *)self menuConfiguration];
    v13 = [v12 menu];
    uint64_t v14 = ((void (**)(void, id, void *, void *))v9)[2](v9, v35, v11, v13);

    id v35 = (id)v14;
  }
  v15 = [(_UIContextMenuUIController *)self platterContainerView];
  [v35 bounds];
  objc_msgSend(v15, "setFrame:");
  [v15 setAutoresizingMask:18];
  [v15 setUserInteractionEnabled:1];
  v16 = [(_UIContextMenuUIController *)self menuStyle];
  objc_msgSend(v15, "setPassesBackgroundViewTouchesThrough:", objc_msgSend(v16, "_backgroundInteractionStyle") == 1);

  [v35 addSubview:v15];
  v17 = [(_UIContextMenuUIController *)self menuConfiguration];
  v18 = [v17 menu];

  if (([v18 metadata] & 0x1000000) != 0)
  {
    [(_UIContextMenuUIController *)self _createMenuViewIfNecessaryForMenu:v18];
    v19 = [(_UIContextMenuUIController *)self menuView];
    [v19 displayMenu:v18 updateType:0 alongsideAnimations:0];
  }
  v20 = [_UIContextMenuPanController alloc];
  v21 = [(_UIContextMenuUIController *)self contentPlatterView];
  v22 = [(_UIContextMenuUIController *)self menuView];
  v23 = [(_UIContextMenuPanController *)v20 initWithContainerView:v15 platterView:v21 menuView:v22];
  [(_UIContextMenuUIController *)self setPlatterPanController:v23];

  v24 = [(_UIContextMenuUIController *)self platterPanController];
  [v24 setDelegate:self];

  v25 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleDismissalTapGesture_];
  [(UIGestureRecognizer *)v25 setName:@"com.apple.UIKit.ContextMenuDismissalTap"];
  [(UIGestureRecognizer *)v25 setDelegate:self];
  [v15 addGestureRecognizer:v25];
  [(_UIContextMenuUIController *)self setDismissalTapGestureRecognizer:v25];
  v26 = [(_UIContextMenuUIController *)self menuView];
  if ([(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)v26 scrubbingEnabled])
  {
    int64_t v27 = [(_UIContextMenuUIController *)self _interfaceIdiom];

    if (v27 == 6) {
      goto LABEL_14;
    }
    v26 = [[_UIContextMenuActionScrubbingHandoffGestureRecognizer alloc] initWithTarget:self action:sel__handleActionHandoffGesture_];
    [(UIGestureRecognizer *)v26 setDelegate:self];
    v28 = [(_UIContextMenuUIController *)self menuStyle];
    int v29 = [v28 _allowsImmediateSelection];

    if (v29) {
      [(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)v26 setHysteresis:0.0];
    }
    [v15 addGestureRecognizer:v26];
    [(_UIContextMenuUIController *)self setActionScrubbingHandoffGestureRecognizer:v26];
  }

LABEL_14:
  [(_UIContextMenuUIController *)self _updatePlatterContainerViewTraitCollection];
  v30 = [_UIContextMenuLayoutArbiter alloc];
  v31 = [(_UIContextMenuUIController *)self menuStyle];
  v32 = -[_UIContextMenuLayoutArbiter initWithContainerView:layout:](v30, "initWithContainerView:layout:", v15, [v31 preferredLayout]);
  [(_UIContextMenuUIController *)self setLayoutArbiter:v32];

  [(_UIContextMenuUIController *)self setState:1];
  v33 = [v15 _focusSystemSceneComponent];
  v34 = [(_UIContextMenuUIController *)self menuView];
  [v33 pushPreferredFocusEnvironmentOverride:v34];
}

- (void)presentationTransitionDidEnd
{
}

- (void)dismissalTransitionWillBegin
{
  v3 = [(_UIContextMenuUIController *)self platterContainerView];
  v4 = [v3 _focusSystemSceneComponent];
  objc_super v5 = [(_UIContextMenuUIController *)self menuView];
  [v4 removePreferredFocusEnvironmentOverride:v5];

  [(_UIContextMenuUIController *)self setState:0];
  id v6 = [(_UIContextMenuUIController *)self platterContainerView];
  [v6 setUserInteractionEnabled:0];

  id v7 = [(_UIContextMenuUIController *)self _platformMetrics];
  v11 = [v7 preDismissalHandler];

  if (v11)
  {
    v8 = [(_UIContextMenuUIController *)self platterContainerView];
    v11[2](v11, v8);
  }
  v9 = [(_UIContextMenuUIController *)self platterPanController];
  [v9 setEnabled:0];

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];
}

- (void)dismissalTransitionDidEnd
{
  v3 = [(_UIContextMenuUIController *)self _platformMetrics];
  objc_super v5 = [v3 postDismissalHandler];

  if (v5)
  {
    v4 = [(_UIContextMenuUIController *)self platterContainerView];
    v5[2](v5, v4);
  }
}

- (void)platterPanControllerDidTearOff:(id)a3
{
  v4 = [a3 panGestureRecognizer];
  objc_super v5 = [v4 _allActiveTouches];
  id v7 = [v5 anyObject];

  id v6 = [(_UIContextMenuUIController *)self delegate];
  [v6 contextMenuUIController:self didBeginDragWithTouch:v7];
}

- (void)platterPanControllerDidSwipeDown:(id)a3
{
  id v4 = [(_UIContextMenuUIController *)self delegate];
  [v4 contextMenuUIController:self didRequestDismissalWithReason:2 alongsideActions:0 completion:0];
}

- (void)platterPanInteractionBegan:(id)a3 allowSwipeToDismiss:(BOOL *)a4
{
  id v6 = [(_UIContextMenuUIController *)self delegate];
  *a4 = [v6 contextMenuUIControllerShouldAllowSwipeToDismissForBeginningPanInteraction:self];
}

- (void)platterPanInteractionEnded:(id)a3
{
  id v4 = [(_UIContextMenuUIController *)self delegate];
  [v4 contextMenuUIControllerDidEndPanInteraction:self];
}

- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__205;
  v46 = __Block_byref_object_dispose__205;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke;
  v29[3] = &unk_1E530A330;
  v31 = &v42;
  id v7 = v6;
  id v30 = v7;
  v32 = &v38;
  v33 = &v34;
  [(_UIContextMenuUIController *)self _enumeratePlatterViewsWithBlock:v29];
  if (!v43[5])
  {
    v8 = [(_UIContextMenuUIController *)self flocker];
    v9 = [v8 secondaryPlatterViews];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      uint64_t v11 = [(_UIContextMenuUIController *)self contentPlatterView];
      v12 = (void *)v43[5];
      v43[5] = v11;

      *((unsigned char *)v39 + 24) = 1;
      v35[3] = 0;
    }
  }
  v13 = (void *)v43[5];
  if (v13)
  {
    if (*((unsigned char *)v39 + 24))
    {
      uint64_t v14 = [(_UIContextMenuUIController *)self _primaryPlatterDragPreviewForDragItem:v7 preferringFullSize:v4];
      objc_initWeak((id *)&location, self);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_2;
      v27[3] = &unk_1E52DC308;
      objc_copyWeak(&v28, (id *)&location);
      objc_msgSend(v14, "set_fenceHandler:", v27);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)&location);
    }
    else
    {
      memset(&location, 0, sizeof(location));
      [v13 transform];
      [(id)v43[5] bounds];
      double Width = CGRectGetWidth(v49);
      v16 = [(id)v43[5] collapsedPreview];
      [v16 size];
      CGFloat v18 = Width / v17;

      CGAffineTransform v24 = location;
      CGAffineTransformScale(&v25, &v24, v18, v18);
      CGAffineTransform location = v25;
      v19 = [UIDragPreviewTarget alloc];
      v20 = [(id)v43[5] superview];
      [(id)v43[5] center];
      CGAffineTransform v25 = location;
      v21 = -[UIPreviewTarget initWithContainer:center:transform:](v19, "initWithContainer:center:transform:", v20, &v25);

      v22 = [v7 _targetedLiftPreview];
      uint64_t v14 = [v22 retargetedPreviewWithTarget:v21];

      [v14 _setApplyTargetTransformToFlock:1];
    }
    [v14 _setPreferredStackOrder:v35[3]];
  }
  else
  {
    uint64_t v14 = 0;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v14;
}

- (id)_primaryPlatterDragPreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  id v6 = a3;
  [v6 _setDeferPreviewUpdates:1];
  id v7 = [v6 previewProvider];

  if (!v7)
  {
    v8 = 0;
LABEL_6:
    v9 = [v6 _targetedLiftPreview];
    uint64_t v10 = [v6 _previewProviderForType:1];

    v8 = (void *)v10;
    goto LABEL_7;
  }
  v8 = [v6 _previewProviderForType:2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v9 = [v8 preview];
  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:
  [v9 _setPreventAfterScreenUpdatesSnapshot:1];
  uint64_t v11 = [v8 _duiPreview];
  v12 = [(_UIContextMenuUIController *)self menuConfiguration];
  if (([v12 isMultiItemMenu] & 1) != 0 || objc_msgSend(v11, "isOversized"))
  {

LABEL_10:
    [v11 scaledSize];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = 1;
    goto LABEL_11;
  }
  [v11 scaleFactor];
  double v43 = v42;

  if (v43 < 1.0 && !a4) {
    goto LABEL_10;
  }
  [v11 unscaledSize];
  double v14 = v44;
  double v16 = v45;
  uint64_t v17 = 0;
LABEL_11:
  id v47 = v9;
  if (v11)
  {
    [v11 liftTransform];
    double v18 = *((double *)&v51 + 1);
    double v19 = *(double *)&v51;
    double v20 = *((double *)&v52 + 1);
    double v21 = *(double *)&v52;
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    double v20 = 0.0;
    double v18 = 0.0;
    double v21 = 0.0;
    double v19 = 0.0;
  }
  double v22 = v16 * v21 + v14 * v19;
  v23 = -[UIView initWithFrame:]([_UIContextMenuDragContainerView alloc], "initWithFrame:", 0.0, 0.0, v22, v16 * v20 + v14 * v18);
  [(_UIContextMenuUIController *)self set_dragContainerView:v23];
  [(_UIContextMenuUIController *)self _installViewsIntoDragContainerView:v23];
  if (v17)
  {
    [v11 scaledSize];
    double v25 = v24;
    [v11 unscaledSize];
    double v27 = v25 / v26 * 33.0;
  }
  else
  {
    double v27 = 33.0;
  }
  [v11 setAvoidAnimation:1];
  id v28 = objc_opt_new();
  [v28 _setPreviewMode:3];
  int v29 = [(UITargetedPreview *)[UITargetedDragPreview alloc] initWithView:v23 parameters:v28];
  -[UITargetedDragPreview setLiftAnchorPoint:](v29, "setLiftAnchorPoint:", v22 * 0.5, v27);

  id v30 = [_UIPlatterView alloc];
  v31 = [v8 imageComponent];
  v32 = [(_UIPlatterView *)v30 initWithDUIPreview:v11 imageComponent:v31];

  [(_UIPlatterView *)v32 setConstrainSize:v17];
  [(_UIPlatterView *)v32 setLifted:1];
  [(_UIPlatterView *)v32 setShadowVisible:0];
  [(_UIPlatterView *)v32 setTransformAppliedExternally:1];
  [(_UIPlatterView *)v32 setAppliesOriginalRotation:1];
  [(_UIContextMenuUIController *)self set_destinationPlatterView:v32];
  v46 = [(_UIContextMenuUIController *)self platterContainerView];
  v33 = objc_opt_new();
  [v33 setAlpha:0.0];
  [(_UIContextMenuUIController *)self platterContainerView];
  id v35 = v34 = v8;
  uint64_t v36 = [v35 window];
  [v36 insertSubview:v33 atIndex:0];

  [(_UIContextMenuUIController *)self set_subterraneanViewContainer:v33];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke;
  v48[3] = &unk_1E52D9F98;
  id v49 = v6;
  id v50 = v47;
  id v37 = v47;
  id v38 = v6;
  [(_UIContextMenuUIController *)self set_postMorphDragItemUpdate:v48];
  v39 = [(_UIContextMenuUIController *)self flocker];
  uint64_t v40 = [(UITargetedPreview *)v29 view];
  [v39 badgeLocationInView:v40];
  -[UITargetedDragPreview _setInitialBadgeLocation:](v29, "_setInitialBadgeLocation:");

  return v29;
}

- (id)previewForCancellingDragItem:(id)a3
{
  BOOL v4 = [(_UIContextMenuUIController *)self _postMorphDragItemUpdate];

  if (v4)
  {
    [(_UIContextMenuUIController *)self set_postMorphDragItemUpdate:0];
    [(_UIContextMenuUIController *)self set_dragWasCanceled:1];
    objc_super v5 = [(_UIContextMenuUIController *)self _subterraneanViewContainer];
    id v6 = [(_UIContextMenuUIController *)self _dragContainerView];
    [v5 addSubview:v6];

    id v7 = [UITargetedDragPreview alloc];
    v8 = [(_UIContextMenuUIController *)self _dragContainerView];
    v9 = [(UITargetedDragPreview *)v7 initWithView:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_didBeginMorphToDragPreview
{
  id v2 = [(_UIContextMenuUIController *)self _dragContainerView];
  [v2 setAlpha:0.0];
}

- (void)_didCompleteMorphToDragPreview
{
  v3 = [(_UIContextMenuUIController *)self platterContainerView];
  [v3 setAlpha:0.0];

  uint64_t v5 = [(_UIContextMenuUIController *)self _postMorphDragItemUpdate];
  [(_UIContextMenuUIController *)self set_postMorphDragItemUpdate:0];
  BOOL v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    BOOL v4 = (void *)v5;
  }
}

- (void)dragWillCancelWithAnimator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIContextMenuUIController *)self contentPlatterView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke;
  v8[3] = &unk_1E52D9F70;
  id v9 = v5;
  id v6 = v5;
  [v4 addAnimations:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke_2;
  v7[3] = &unk_1E52DC698;
  v7[4] = self;
  [v4 addCompletion:v7];
}

- (void)_installViewsIntoDragContainerView:(id)a3
{
  id v19 = a3;
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v14 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v4 >= v14)
      {
        _UIInternalPreferenceSync(v4, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v14 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v4 == _UIInternalPreference_ClickUIDebugEnabled) {
          goto LABEL_4;
        }
      }
      if (byte_1E8FD4F1C)
      {
        id v15 = +[UIColor yellowColor];
        uint64_t v16 = [v15 CGColor];
        uint64_t v17 = [v19 layer];
        [v17 setBorderColor:v16];

        double v18 = [v19 layer];
        [v18 setBorderWidth:3.0];
      }
    }
  }
LABEL_4:
  uint64_t v5 = [(_UIContextMenuUIController *)self contentPlatterView];
  [v5 freezeExpandedPreview];

  id v6 = [(_UIContextMenuUIController *)self platterTransitionView];
  id v7 = [(_UIContextMenuUIController *)self platterContainerView];
  [v7 addSubview:v19];
  v8 = [(_UIContextMenuUIController *)self platterPanController];
  id v9 = [v8 panGestureRecognizer];
  [v9 locationInView:v7];
  objc_msgSend(v19, "setCenter:");

  [v6 center];
  double v11 = v10;
  double v13 = v12;
  [v19 addSubview:v6];
  objc_msgSend(v7, "convertPoint:toView:", v19, v11, v13);
  objc_msgSend(v6, "setCenter:");
}

- (void)_cleanUpDragViews
{
  [(UIView *)self->_platterContainerView removeFromSuperview];
  [(UIView *)self->_platterTransitionView removeFromSuperview];
  id v3 = [(_UIContextMenuUIController *)self _subterraneanViewContainer];
  [v3 removeFromSuperview];
}

- (id)windowSceneActivationPreview
{
  id v2 = [(_UIContextMenuUIController *)self contentPlatterView];
  id v3 = v2;
  if (v2)
  {
    if ([v2 alwaysCompact])
    {
      int v4 = [v3 collapsedPreview];
    }
    else
    {
      int v4 = [v3 expandedPreview];
      [v3 _continuousCornerRadius];
      double v7 = v6;
      v8 = [v4 view];
      [v8 _setContinuousCornerRadius:v7];
    }
    id v9 = [v3 window];
    double v10 = [v3 superview];
    [v3 center];
    objc_msgSend(v10, "convertPoint:toView:", v9);
    double v12 = v11;
    double v14 = v13;

    id v15 = [UIPreviewTarget alloc];
    [v3 transform];
    uint64_t v16 = -[UIPreviewTarget initWithContainer:center:transform:](v15, "initWithContainer:center:transform:", v9, &v18, v12, v14);
    uint64_t v5 = [v4 retargetedPreviewWithTarget:v16];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v5 = [(_UIContextMenuUIController *)self contentPlatterView];
  double v6 = v5;
  if (v5)
  {
    if ([v5 allowsUserInteractionInExpandedPreview])
    {
      id v7 = [(_UIContextMenuUIController *)self dismissalTapGestureRecognizer];

      if (v7 == v4)
      {
        [v6 bounds];
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        [v4 locationInView:v6];
        v41.x = v16;
        v41.y = v17;
        v43.origin.x = v9;
        v43.origin.y = v11;
        v43.size.width = v13;
        v43.size.height = v15;
        *((unsigned char *)v38 + 24) = !CGRectContainsPoint(v43, v41);
      }
    }
  }
  if (*((unsigned char *)v38 + 24))
  {
    uint64_t v18 = [(_UIContextMenuUIController *)self menuView];
    if (v18)
    {
      id v19 = [(_UIContextMenuUIController *)self dismissalTapGestureRecognizer];

      if (v19 == v4)
      {
        [v18 bounds];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        [v4 locationInView:v18];
        v42.x = v28;
        v42.y = v29;
        v44.origin.x = v21;
        v44.origin.y = v23;
        v44.size.width = v25;
        v44.size.height = v27;
        *((unsigned char *)v38 + 24) = !CGRectContainsPoint(v44, v42);
      }
    }
  }
  id v30 = [(_UIContextMenuUIController *)self menuConfiguration];
  v31 = [v30 accessoryViews];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __59___UIContextMenuUIController_gestureRecognizerShouldBegin___block_invoke;
  v34[3] = &unk_1E530A380;
  id v32 = v4;
  id v35 = v32;
  uint64_t v36 = &v37;
  [v31 enumerateObjectsUsingBlock:v34];

  LOBYTE(v30) = *((unsigned char *)v38 + 24);
  _Block_object_dispose(&v37, 8);

  return (char)v30;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuUIController *)self actionScrubbingHandoffGestureRecognizer];

  if (v8 == v7)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v9 = [(_UIContextMenuUIController *)self actionScrubbingHandoffGestureRecognizer];
    BOOL v10 = v9 == v6;
  }
  return v10;
}

- (void)_handleDismissalTapGesture:(id)a3
{
  id v5 = a3;
  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented") && [v5 state] == 3)
  {
    id v4 = [(_UIContextMenuUIController *)self delegate];
    [v4 contextMenuUIController:self didRequestDismissalWithReason:0 alongsideActions:0 completion:0];
  }
}

- (void)_handlePlatterActionTapGesture:(id)a3
{
  id v7 = a3;
  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented") && [v7 state] == 3)
  {
    id v4 = [(_UIContextMenuUIController *)self menuConfiguration];
    id v5 = [v4 previewAction];
    id v6 = [(_UIContextMenuUIController *)self delegate];
    [v5 performWithSender:v6 target:0];
  }
}

- (void)_handleActionHandoffGesture:(id)a3
{
  id v15 = a3;
  if ([v15 state] >= 1 && objc_msgSend(v15, "state") <= 2)
  {
    id v4 = [(_UIContextMenuUIController *)self menuView];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v15 locationInView:v4];
    v17.x = v13;
    v17.y = v14;
    v18.origin.x = v6;
    v18.origin.y = v8;
    v18.size.width = v10;
    v18.size.height = v12;
    if (CGRectContainsPoint(v18, v17) && [v4 kickstartActionScrubbingWithGesture:v15])
    {
      [v15 setEnabled:0];
      [v15 setEnabled:1];
    }
  }
}

- (void)viewTraitCollectionDidChange
{
  id v3 = [(_UIContextMenuUIController *)self menuStyle];
  id v4 = [v3 _parentTraitEnvironmentForUserInterfaceStyle];

  if (v4)
  {
    [(_UIContextMenuUIController *)self _updatePlatterContainerViewTraitCollection];
  }
}

- (void)_updatePlatterContainerViewTraitCollection
{
  if ([(_UIContextMenuUIController *)self _interfaceIdiom] != 6)
  {
    id v3 = [(_UIContextMenuUIController *)self menuStyle];
    id v11 = [v3 _parentTraitEnvironmentForUserInterfaceStyle];

    id v4 = v11;
    if (v11)
    {
      double v5 = [(_UIContextMenuUIController *)self platterContainerView];
      CGFloat v6 = [v11 _traitCollectionForChildEnvironment:v5];

      uint64_t v7 = [v6 userInterfaceStyle];
      CGFloat v8 = [(_UIContextMenuUIController *)self platterContainerView];
      double v9 = -[UIView _internalTraitOverrides](v8);
      CGFloat v10 = v9;
      if (v7) {
        [v9 setUserInterfaceStyle:v7];
      }
      else {
        [v9 _removeTraitToken:0x1ED3F5A48];
      }

      id v4 = v11;
    }
  }
}

- (void)previewSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIContextMenuUIController *)self previewSize];
  if (width != v7 || height != v6)
  {
    -[_UIContextMenuUIController setPreviewSize:](self, "setPreviewSize:", width, height);
    [(_UIContextMenuUIController *)self setPreviewSizeDidChange:1];
    [(_UIContextMenuUIController *)self _updatePlatterAndActionViewLayoutForce:0 updateAttachment:1];
  }
}

- (BOOL)shouldMaintainKeyboardAssertionForFirstResponder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v15 = 0;
  CGFloat v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  double v5 = [(_UIContextMenuUIController *)self menuConfiguration];
  double v6 = [v5 accessoryViews];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __79___UIContextMenuUIController_shouldMaintainKeyboardAssertionForFirstResponder___block_invoke;
  CGFloat v12 = &unk_1E530A380;
  id v13 = v4;
  CGFloat v14 = &v15;
  [v6 enumerateObjectsUsingBlock:&v9];

  if (!*((unsigned char *)v16 + 24))
  {

    _Block_object_dispose(&v15, 8);
LABEL_5:
    -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 0, v9, v10, v11, v12);
    BOOL v7 = 1;
    goto LABEL_6;
  }
  -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 1, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (void)_keyboardWillShow:(id)a3
{
  id v7 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v5 = [v4 responder];

  if (v5
    && [(_UIContextMenuUIController *)self _needsToAvoidKeyboardForResponder:v5])
  {
    double v6 = [v7 userInfo];
    [(_UIContextMenuUIController *)self _adjustViewForKeyboardVisibility:1 keyboardInfo:v6];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v5 = a3;
  if (![(_UIContextMenuUIController *)self _isAnimatingPresentation]
    && [(_UIContextMenuUIController *)self didAvoidKeyboard])
  {
    id v4 = [v5 userInfo];
    [(_UIContextMenuUIController *)self _adjustViewForKeyboardVisibility:0 keyboardInfo:v4];
  }
}

- (void)_adjustViewForKeyboardVisibility:(BOOL)a3 keyboardInfo:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(_UIContextMenuUIController *)self setDidAvoidKeyboard:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  id v7 = _Block_copy(aBlock);
  if ([(_UIContextMenuUIController *)self _isAnimatingPresentation])
  {
    id v8 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.35];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_2;
    v17[3] = &unk_1E52DA040;
    id v18 = v7;
    id v9 = v7;
    +[UIView _animateUsingSpringBehavior:v8 tracking:0 animations:v17 completion:0];
  }
  else
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"UIKeyboardAnimationDurationUserInfoKey"];
    [v10 doubleValue];
    double v12 = v11;

    id v13 = [v6 objectForKeyedSubscript:@"UIKeyboardAnimationCurveUserInfoKey"];
    uint64_t v14 = [v13 integerValue];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_3;
    v15[3] = &unk_1E52DA040;
    CGFloat v16 = v7;
    id v8 = v7;
    +[UIView animateWithDuration:v14 delay:v15 options:0 animations:v12 completion:0.0];
    id v9 = v16;
  }
}

- (BOOL)_needsToAvoidKeyboardForResponder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuUIController *)self menuStyle];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if ([(_UIContextMenuUIController *)self _isPresented])
  {
    id v6 = [(_UIContextMenuUIController *)self menuConfiguration];
    id v7 = [v6 previewViewController];

    if (v7)
    {
      int v8 = [v5 _layoutAllowsPreview];
      if (v8) {
        int v8 = [v5 hasInteractivePreview];
      }
      *((unsigned char *)v17 + 24) = v8;
      if (!v8) {
        goto LABEL_8;
      }
    }
    else if (!*((unsigned char *)v17 + 24))
    {
LABEL_8:
      id v9 = [(_UIContextMenuUIController *)self menuConfiguration];
      uint64_t v10 = [v9 accessoryViews];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64___UIContextMenuUIController__needsToAvoidKeyboardForResponder___block_invoke;
      v13[3] = &unk_1E530A380;
      id v14 = v4;
      uint64_t v15 = &v16;
      [v10 enumerateObjectsUsingBlock:v13];
    }
  }
  char v11 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (_UIContextMenuLayoutArbiterOutput)currentLayout
{
  currentLayout = self->_currentLayout;
  if (!currentLayout)
  {
    [(_UIContextMenuUIController *)self _updateLayoutAndAttachment:1];
    currentLayout = self->_currentLayout;
  }
  return currentLayout;
}

- (void)_updateLayoutAndAttachment:(BOOL)a3
{
  BOOL v3 = a3;
  v124[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(_UIContextMenuUIController *)self platterContainerView];
  id v6 = [(_UIContextMenuUIController *)self menuStyle];
  uint64_t v7 = [v6 preferredAttachmentEdge];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v122 = 0;
    long long v120 = 0u;
    long long v121 = 0u;
    int v8 = [(_UIContextMenuUIController *)self menuStyle];
    id v9 = v8;
    if (v8)
    {
      [v8 _preferredAnchor];
    }
    else
    {
      uint64_t v122 = 0;
      long long v120 = 0u;
      long long v121 = 0u;
    }

    *(void *)&long long v120 = v7;
    uint64_t v119 = v122;
    long long v117 = v120;
    long long v118 = v121;
    uint64_t v10 = [(_UIContextMenuUIController *)self menuStyle];
    v115[0] = v117;
    v115[1] = v118;
    uint64_t v116 = v119;
    objc_msgSend(v10, "set_preferredAnchor:", v115);
  }
  char v11 = [(_UIContextMenuUIController *)self _layoutWithUpdatedAttachment:v3 concealedMenu:[(_UIContextMenuUIController *)self menuIsConcealed]];
  double v12 = [(_UIContextMenuUIController *)self menuStyle];
  int v13 = [v12 ignoresDefaultSizingRules];

  if (v13)
  {
    [(_UIContextMenuUIController *)self previewSize];
    double v15 = v14;
    if (v11)
    {
      [(_UIContextMenuLayoutArbiterOutput *)v11 preview];
      uint64_t v17 = *((void *)&v107 + 1);
      uint64_t v16 = v107;
      uint64_t v19 = *((void *)&v108 + 1);
      uint64_t v18 = v108;
    }
    else
    {
      long long v114 = 0u;
      long long v113 = 0u;
      long long v112 = 0u;
      long long v111 = 0u;
      long long v110 = 0u;
      long long v109 = 0u;
      uint64_t v19 = 0;
      uint64_t v18 = 0;
      uint64_t v17 = 0;
      uint64_t v16 = 0;
      long long v107 = 0u;
      long long v108 = 0u;
    }
    double v20 = v15 / CGRectGetWidth(*(CGRect *)&v16);
    if (v20 >= 1.0) {
      double v21 = v20;
    }
    else {
      double v21 = 1.0;
    }
    if (v11)
    {
      [(_UIContextMenuLayoutArbiterOutput *)v11 preview];
    }
    else
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
    }
    CGAffineTransformMakeScale(&v98, v21, v21);
    double v22 = [(_UIContextMenuUIController *)self platterContainerView];
    UIRoundToViewScale(v22);
    double v24 = v23;
    CGFloat v25 = [(_UIContextMenuUIController *)self platterContainerView];
    UIRoundToViewScale(v25);
    -[_UIContextMenuUIController setPreviewSize:](self, "setPreviewSize:", v24, v26);
  }
  if (v11)
  {
    [(_UIContextMenuLayoutArbiterOutput *)v11 menu];
    double v27 = *((double *)&v93 + 1);
    double v28 = *(double *)&v94;
  }
  else
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    double v28 = 0.0;
    double v27 = 0.0;
    long long v90 = 0u;
    long long v91 = 0u;
  }
  CGFloat v29 = [(_UIContextMenuUIController *)self menuView];
  id v30 = [v29 layer];
  objc_msgSend(v30, "setAnchorPoint:", v27, v28);

  if (v11)
  {
    [(_UIContextMenuLayoutArbiterOutput *)v11 menu];
    double v31 = *((double *)&v83 + 1);
    double v32 = *(double *)&v83;
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    double v31 = 0.0;
    double v32 = 0.0;
    long long v82 = 0u;
    long long v83 = 0u;
  }
  v33 = [(_UIContextMenuUIController *)self menuView];
  objc_msgSend(v33, "setVisibleContentSize:", v32, v31);

  uint64_t v34 = [(_UIContextMenuUIController *)self platterPanController];
  id v35 = v34;
  if (v11)
  {
    [(_UIContextMenuLayoutArbiterOutput *)v11 preview];
    [v35 setOriginalPlatterCenter:v76];
    [(_UIContextMenuLayoutArbiterOutput *)v11 menu];
    [v35 setOriginalMenuCenter:v68];
    [(_UIContextMenuLayoutArbiterOutput *)v11 anchor];
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    objc_msgSend(v34, "setOriginalPlatterCenter:", 0.0, 0.0);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    objc_msgSend(v35, "setOriginalMenuCenter:", 0.0, 0.0);
    uint64_t v65 = 0;
    long long v63 = 0u;
    long long v64 = 0u;
  }
  v61[0] = v63;
  v61[1] = v64;
  uint64_t v62 = v65;
  [v35 setMenuAnchor:v61];
  uint64_t v36 = [(_UIContextMenuUIController *)self menuConfiguration];
  uint64_t v37 = [v36 accessoryViews];
  [v35 setAccessoryViews:v37];

  id v38 = [(_UIContextMenuUIController *)self menuConfiguration];
  objc_msgSend(v35, "setPlatterPivotRotationEnabled:", objc_msgSend(v38, "isMultiItemMenu") ^ 1);

  uint64_t v39 = [(_UIContextMenuUIController *)self menuStyle];
  uint64_t v40 = [v39 preferredLayout];

  if ((v40 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if ([(_UIContextMenuUIController *)self _interfaceIdiom] != 6) {
      [v35 setRubberbandingEdges:11];
    }
    if (v11)
    {
      [(_UIContextMenuLayoutArbiterOutput *)v11 menu];
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      memset(&v54, 0, sizeof(v54));
    }
    v125.origin.x = _UIContextMenuItemFrameFromLayout(&v54);
    double MaxY = CGRectGetMaxY(v125);
    [(_UIContextMenuLayoutArbiterOutput *)v11 contentBounds];
    double v42 = MaxY - CGRectGetMaxY(v126);
    if (v42 < 0.0) {
      double v42 = 0.0;
    }
    if (fabs(v42) <= 2.22044605e-16)
    {
      long long v51 = *MEMORY[0x1E4F1DAD8];
      CGRect v43 = [MEMORY[0x1E4F29238] valueWithBytes:&v51 objCType:"{CGPoint=dd}"];
      v123 = v43;
      double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
    }
    else
    {
      v53[0] = 0;
      *(double *)&v53[1] = -v42;
      CGRect v43 = [MEMORY[0x1E4F29238] valueWithBytes:v53 objCType:"{CGPoint=dd}"];
      v124[0] = v43;
      long long v52 = *MEMORY[0x1E4F1DAD8];
      CGRect v44 = [MEMORY[0x1E4F29238] valueWithBytes:&v52 objCType:"{CGPoint=dd}"];
      v124[1] = v44;
      double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
    }
    [v35 setDetents:v45];
  }
  if (v11)
  {
    [(_UIContextMenuLayoutArbiterOutput *)v11 anchor];
    uint64_t v46 = v48;
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
  }
  -[_UIContextMenuUIController _updateActionsViewReversesOrderForAttachment:](self, "_updateActionsViewReversesOrderForAttachment:", v46, v48, v49, v50);
  currentLayout = self->_currentLayout;
  self->_currentLayout = v11;
}

- (id)_layoutWithUpdatedAttachment:(BOOL)a3 concealedMenu:(BOOL)a4
{
  BOOL v49 = a4;
  BOOL v4 = a3;
  id v6 = [(_UIContextMenuUIController *)self layoutArbiter];
  uint64_t v7 = [(_UIContextMenuUIController *)self platterContainerView];
  int v8 = [(_UIContextMenuUIController *)self menuStyle];
  uint64_t v9 = [v8 preferredAttachmentEdge];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v10 = [(_UIContextMenuUIController *)self menuStyle];
    char v11 = v10;
    if (v10)
    {
      [v10 _preferredAnchor];
    }
    else
    {
      uint64_t v64 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
    }

    *(void *)&long long v62 = v9;
    uint64_t v61 = v64;
    long long v59 = v62;
    long long v60 = v63;
    double v12 = [(_UIContextMenuUIController *)self menuStyle];
    v57[0] = v59;
    v57[1] = v60;
    uint64_t v58 = v61;
    objc_msgSend(v12, "set_preferredAnchor:", v57);
  }
  int v13 = objc_opt_new();
  double v14 = [(_UIContextMenuUIController *)self menuConfiguration];
  double v15 = [v14 sourcePreview];
  [v13 setSourcePreview:v15];

  uint64_t v16 = [(_UIContextMenuUIController *)self menuStyle];
  [v16 preferredEdgeInsets];
  objc_msgSend(v13, "setPreferredEdgeInsets:");

  uint64_t v17 = [(_UIContextMenuUIController *)self menuStyle];
  uint64_t v18 = v17;
  if (v17)
  {
    [v17 _preferredAnchor];
  }
  else
  {
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
  }
  v52[0] = v54;
  v52[1] = v55;
  uint64_t v53 = v56;
  [v13 setPreferredAnchor:v52];

  [(_UIContextMenuUIController *)self previewSize];
  objc_msgSend(v13, "setPreferredPreviewSize:");
  uint64_t v19 = [(_UIContextMenuUIController *)self menuStyle];
  int v20 = [v19 ignoresDefaultSizingRules];

  if (v20) {
    [v13 setPreferredPreviewFittingStrategy:1];
  }
  double v21 = [(_UIContextMenuUIController *)self menuView];
  if ([v21 hierarchyStyle] == 2)
  {
    double v22 = [(_UIContextMenuUIController *)self menuConfiguration];
    double v23 = [v22 menu];
    unint64_t v24 = ((unint64_t)[v23 metadata] >> 16) & 1;
  }
  else
  {
    LODWORD(v24) = 0;
  }

  CGFloat v25 = [(_UIContextMenuUIController *)self menuConfiguration];
  double v26 = [v25 menu];
  unint64_t v27 = ((unint64_t)[v26 metadata] >> 8) & 1;

  double v28 = [(_UIContextMenuUIController *)self menuConfiguration];
  CGFloat v29 = [v28 menu];
  unint64_t v30 = ((unint64_t)[v29 metadata] >> 32) & 1;

  double v31 = [(_UIContextMenuUIController *)self menuStyle];
  [v31 _preferredMenuWidth];
  double v33 = v32;

  double v34 = _UIContextMenuActionsViewWidth(v7, v27, v24, v30, [(_UIContextMenuUIController *)self _interfaceIdiom]);
  if (v33 < v34) {
    double v33 = v34;
  }
  [v7 bounds];
  double Height = CGRectGetHeight(v66);
  uint64_t v36 = [(_UIContextMenuUIController *)self menuView];
  objc_msgSend(v36, "preferredContentSizeWithinContainerSize:", v33, Height);
  objc_msgSend(v13, "setPreferredMenuSize:");

  uint64_t v37 = [(_UIContextMenuUIController *)self menuStyle];
  [v37 _preferredMenuAttachmentPoint];
  objc_msgSend(v13, "setPreferredMenuAttachmentPoint:");

  id v38 = [(_UIContextMenuUIController *)self menuConfiguration];
  uint64_t v39 = [v38 accessoryViews];
  [v13 setAccessoryViews:v39];

  [v13 setShouldUpdateAttachment:v4];
  uint64_t v40 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  objc_msgSend(v13, "setShouldAvoidInputViews:", objc_msgSend(v40, "isOnScreen"));

  [v13 setShouldConcealMenu:v49];
  CGPoint v41 = [v7 traitCollection];
  double v42 = _UIContextMenuGetPlatformMetrics([v41 userInterfaceIdiom]);

  [v42 menuMaximumHeight];
  double v44 = v43;

  [v13 setMaximumMenuHeight:v44];
  double v45 = [(_UIContextMenuUIController *)self menuView];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __73___UIContextMenuUIController__layoutWithUpdatedAttachment_concealedMenu___block_invoke;
  v50[3] = &unk_1E52DCB08;
  id v51 = v45;
  id v46 = v45;
  [v13 setComputePreferredScrollTruncationDetentForHeight:v50];
  id v47 = [v6 computedLayoutWithInput:v13];

  return v47;
}

- (void)_updateActionsViewReversesOrderForAttachment:(unint64_t)a3
{
  if (a3 == 1) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [(_UIContextMenuUIController *)self menuView];
  [v6 setAttachmentEdge:v5];

  uint64_t v7 = [(_UIContextMenuUIController *)self menuStyle];
  int v8 = [v7 _orderMenuBasedOnPriority];

  if (a3 == 1 && v8)
  {
    id v9 = [(_UIContextMenuUIController *)self menuView];
    [v9 setReversesActionOrder:1];
  }
}

- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4
{
}

- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4 adjustDetent:(BOOL)a5
{
  if ([(_UIContextMenuUIController *)self _isPresented])
  {
    id v9 = [(_UIContextMenuUIController *)self layoutArbiter];

    if (v9)
    {
      if (a3 || [(_UIContextMenuUIController *)self previewSizeDidChange])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke;
        aBlock[3] = &unk_1E52DF220;
        aBlock[4] = self;
        BOOL v17 = a4;
        BOOL v18 = a5;
        uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
        if ([(_UIContextMenuUIController *)self _isAnimatingPresentation]
          && +[UIView areAnimationsEnabled]
          && !+[UIView _isInRetargetableAnimationBlock])
        {
          if (+[UIView _isInRetargetableAnimationBlock]
            || !+[UIView _isInAnimationBlock])
          {
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_3;
            v14[3] = &unk_1E52DA040;
            double v15 = v10;
            +[UIView _animateByRetargetingAnimations:v14 completion:0];
            char v11 = v15;
          }
          else
          {
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_4;
            v12[3] = &unk_1E52DA040;
            int v13 = v10;
            dispatch_async(MEMORY[0x1E4F14428], v12);
            char v11 = v13;
          }
        }
        else
        {
          v10[2](v10);
        }
      }
    }
  }
}

- (void)_createMenuViewIfNecessaryForMenu:(id)a3
{
  if (([a3 metadata] & 0x1000000) != 0)
  {
    [(_UIContextMenuUIController *)self setMenuIsConcealed:0];
    BOOL v4 = [_UIContextMenuView alloc];
    uint64_t v5 = -[_UIContextMenuView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    menuView = self->_menuView;
    self->_menuView = v5;

    [(_UIContextMenuView *)self->_menuView setHierarchyStyle:[(_UIContextMenuUIController *)self _preferredSubmenuHierarchyStyle]];
    [(_UIContextMenuView *)self->_menuView setDelegate:self];
    uint64_t v7 = [(_UIContextMenuUIController *)self menuStyle];
    int v8 = v7;
    if (v7)
    {
      [v7 _preferredAnchor];
      if ((void)v10 == 1) {
        [(_UIContextMenuUIController *)self _updateActionsViewReversesOrderForAttachment:1];
      }
    }
    else
    {
      uint64_t v12 = 0;
      long long v10 = 0u;
      long long v11 = 0u;
    }
    -[_UIContextMenuView setShouldAvoidInputViews:](self->_menuView, "setShouldAvoidInputViews:", objc_msgSend(v8, "_shouldAvoidInputViews", v10, v11, v12));
    BOOL v9 = [v8 preferredLayout] == 1 || objc_msgSend(v8, "preferredLayout") == 3;
    [(_UIContextMenuView *)self->_menuView setScrubbingEnabled:v9];
    -[_UIContextMenuView setAllowsBackgroundViewInteraction:](self->_menuView, "setAllowsBackgroundViewInteraction:", [v8 _backgroundInteractionStyle] != 0);
  }
}

- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4
{
  if (a4) {
    [(_UIContextMenuUIController *)self _replaceVisibleMenu:a4 withMenu:a3];
  }
  else {
    [(_UIContextMenuUIController *)self _displayMenu:a3 updateType:3];
  }
}

- (void)retargetDismissingMenuToPreview:(id)a3
{
  if (!a3)
  {
    v7[9] = v3;
    v7[10] = v4;
    id v6 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke;
    v7[3] = &unk_1E52D9F70;
    v7[4] = self;
    +[UIView _animateUsingSpringBehavior:v6 tracking:0 animations:v7 completion:0];
  }
}

- (void)didSelectCancelActionInContextMenuView:(id)a3
{
  id v4 = [(_UIContextMenuUIController *)self delegate];
  [v4 contextMenuUIController:self didRequestDismissalWithReason:0 alongsideActions:0 completion:0];
}

- (void)contextMenuView:(id)a3 didSelectElement:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIContextMenuUIController *)self delegate];
  if ([v5 _isLeaf])
  {
    id v7 = v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63___UIContextMenuUIController_contextMenuView_didSelectElement___block_invoke;
    aBlock[3] = &unk_1E52DCB30;
    id v8 = v6;
    id v11 = v8;
    uint64_t v12 = self;
    id v13 = v7;
    BOOL v9 = (void (**)(void))_Block_copy(aBlock);
    if ([v7 keepsMenuPresented]) {
      v9[2](v9);
    }
    else {
      [v8 contextMenuUIController:self didRequestDismissalWithReason:1 alongsideActions:v9 completion:0];
    }
  }
  else
  {
    [(_UIContextMenuUIController *)self _displayMenu:v5 updateType:1];
  }
}

- (id)contextMenuView:(id)a3 willDisplayMenu:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIContextMenuUIController *)self delegate];
  id v7 = [v6 contextMenuUIController:self willDisplayMenu:v5];

  return v7;
}

- (void)_displayMenu:(id)a3 updateType:(unint64_t)a4
{
  id v6 = a3;
  [(_UIContextMenuUIController *)self setMenuIsConcealed:0];
  id v7 = [(_UIContextMenuUIController *)self menuView];

  if (v7)
  {
    if (a4 == 1)
    {
      id v8 = [(_UIContextMenuUIController *)self menuView];
      BOOL v9 = [v8 visibleMenus];
      char v10 = [v9 containsObject:v6] ^ 1;
    }
    else
    {
      char v10 = 0;
    }
    uint64_t v12 = [(_UIContextMenuUIController *)self menuView];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_4;
    v13[3] = &unk_1E530A3C8;
    void v13[4] = self;
    char v14 = v10;
    [v12 displayMenu:v6 updateType:a4 alongsideAnimations:v13];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke;
    v16[3] = &unk_1E52D9F98;
    v16[4] = self;
    id v17 = v6;
    +[UIView performWithoutAnimation:v16];
    id v11 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.32];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_2;
    v15[3] = &unk_1E52D9F70;
    void v15[4] = self;
    +[UIView _animateUsingSpringBehavior:v11 tracking:0 animations:v15 completion:0];

    uint64_t v12 = v17;
  }
}

- (void)_replaceVisibleMenu:(id)a3 withMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIContextMenuUIController *)self menuView];

  if (v8)
  {
    BOOL v9 = [(_UIContextMenuUIController *)self menuView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59___UIContextMenuUIController__replaceVisibleMenu_withMenu___block_invoke;
    v10[3] = &unk_1E52EBCD8;
    v10[4] = self;
    [v9 replaceVisibleMenu:v6 withMenu:v7 alongsideAnimations:v10];
  }
  else
  {
    [(_UIContextMenuUIController *)self _displayMenu:v7 updateType:0];
  }
}

- (void)_concealMenu
{
  uint64_t v3 = [(_UIContextMenuUIController *)self menuConfiguration];
  id v4 = [v3 previewViewController];

  if (v4)
  {
    id v5 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.32];
    id v6 = [(_UIContextMenuUIController *)self menuView];
    [v6 setUserInteractionEnabled:0];
    [(_UIContextMenuUIController *)self setMenuIsConcealed:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42___UIContextMenuUIController__concealMenu__block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42___UIContextMenuUIController__concealMenu__block_invoke_3;
    v9[3] = &unk_1E52DA9F8;
    v9[4] = self;
    id v10 = v6;
    id v7 = v6;
    +[UIView _animateUsingSpringBehavior:v5 tracking:0 animations:v11 completion:v9];
  }
  else
  {
    id v8 = [(_UIContextMenuUIController *)self delegate];
    [v8 contextMenuUIController:self didRequestDismissalWithReason:5 alongsideActions:0 completion:0];
  }
}

- (_UIMorphingPlatterView)contentPlatterView
{
  contentPlatterView = self->_contentPlatterView;
  if (!contentPlatterView)
  {
    id v4 = [(_UIContextMenuUIController *)self menuConfiguration];
    id v5 = [(_UIContextMenuUIController *)self menuStyle];
    uint64_t v6 = [v4 isMultiItemMenu];
    if ((v6 & 1) != 0 || [v5 _layoutAllowsPreview])
    {
      id v7 = (_UIMorphingPlatterView *)objc_opt_new();
      id v8 = self->_contentPlatterView;
      self->_contentPlatterView = v7;

      BOOL v9 = [(_UIContextMenuUIController *)self platterContainerView];
      id v10 = [v9 traitCollection];
      id v11 = _UIContextMenuGetPlatformMetrics([v10 userInterfaceIdiom]);

      if (v6)
      {
        BOOL v12 = 1;
      }
      else if ([v5 preferredLayout] == 1)
      {
        id v13 = [v4 previewViewController];
        BOOL v12 = v13 == 0;
      }
      else
      {
        BOOL v12 = 0;
      }
      [(_UIMorphingPlatterView *)self->_contentPlatterView setAlwaysCompact:v12];
      -[_UIMorphingPlatterView setAllowsUserInteractionInExpandedPreview:](self->_contentPlatterView, "setAllowsUserInteractionInExpandedPreview:", [v5 hasInteractivePreview]);
      -[_UIMorphingPlatterView setPreventPreviewRasterization:](self->_contentPlatterView, "setPreventPreviewRasterization:", [v5 preventPreviewRasterization]);
      [(_UIMorphingPlatterView *)self->_contentPlatterView setWantsEdgeAntialiasing:v6];
      [(_UIMorphingPlatterView *)self->_contentPlatterView setCollapsedShadowStyle:1];
      if (v12) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
      [(_UIMorphingPlatterView *)self->_contentPlatterView setExpandedShadowStyle:v14];
      double v15 = [v11 previewShadowSettings];
      [(_UIMorphingPlatterView *)self->_contentPlatterView setShadowSettings:v15];

      uint64_t v16 = [v11 submenuSeparatedOptions];
      [(_UIMorphingPlatterView *)self->_contentPlatterView setSeparatedOptions:v16];

      id v17 = [v11 shouldApplyClippingHandler];
      [(_UIMorphingPlatterView *)self->_contentPlatterView setShouldApplyClippingHandler:v17];

      if ([v5 ignoresDefaultSizingRules]) {
        [(_UIMorphingPlatterView *)self->_contentPlatterView setPreferredMorphingAxis:1];
      }
      BOOL v18 = [v4 previewAction];

      if (v18)
      {
        uint64_t v19 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handlePlatterActionTapGesture_];
        [(_UIContextMenuUIController *)self setPlatterActionTapGestureRecognizer:v19];

        int v20 = [(_UIContextMenuUIController *)self platterActionTapGestureRecognizer];
        [v20 setName:@"com.apple.UIKit.ContextMenuPreviewActionTap"];

        double v21 = [(_UIContextMenuUIController *)self platterActionTapGestureRecognizer];
        [v21 setDelegate:self];

        double v22 = self->_contentPlatterView;
        double v23 = [(_UIContextMenuUIController *)self platterActionTapGestureRecognizer];
        [(UIView *)v22 addGestureRecognizer:v23];
      }
    }

    contentPlatterView = self->_contentPlatterView;
  }
  return contentPlatterView;
}

- (_UIFlocker)flocker
{
  if (!self->_flocker)
  {
    uint64_t v3 = [(_UIContextMenuUIController *)self menuConfiguration];
    int v4 = [v3 isMultiItemMenu];

    if (v4)
    {
      id v5 = [_UIFlocker alloc];
      uint64_t v6 = [(_UIContextMenuUIController *)self platterTransitionView];
      id v7 = [(_UIFlocker *)v5 initWithContainerView:v6];
      flocker = self->_flocker;
      self->_flocker = v7;

      BOOL v9 = [(_UIContextMenuUIController *)self menuConfiguration];
      -[_UIFlocker setItemCount:](self->_flocker, "setItemCount:", [v9 representedItemCount]);

      id v10 = [(_UIContextMenuUIController *)self menuConfiguration];
      -[_UIFlocker setBadgeValue:](self->_flocker, "setBadgeValue:", [v10 badgeCount]);
    }
  }
  id v11 = self->_flocker;
  return v11;
}

- (UIView)platterTransitionView
{
  if (!self->_platterTransitionView)
  {
    uint64_t v3 = [_UIContextMenuPlatterTransitionView alloc];
    int v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    platterTransitionView = self->_platterTransitionView;
    self->_platterTransitionView = v4;

    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v9 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v6 >= v9)
        {
          _UIInternalPreferenceSync(v6, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v9 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v6 == _UIInternalPreference_ClickUIDebugEnabled) {
            goto LABEL_5;
          }
        }
        if (byte_1E8FD4F1C)
        {
          id v10 = +[UIColor magentaColor];
          uint64_t v11 = [v10 CGColor];
          BOOL v12 = [(UIView *)self->_platterTransitionView layer];
          [v12 setBorderColor:v11];

          id v13 = [(UIView *)self->_platterTransitionView layer];
          [v13 setBorderWidth:6.0];
        }
      }
    }
  }
LABEL_5:
  id v7 = self->_platterTransitionView;
  return v7;
}

- (UIView)platterContainerView
{
  platterContainerView = self->_platterContainerView;
  if (!platterContainerView)
  {
    int v4 = [(_UIContextMenuUIController *)self menuStyle];
    BOOL v5 = [v4 _backgroundInteractionStyle] == 2;

    int v6 = [_UIContextMenuContainerView alloc];
    id v7 = -[_UIContextMenuContainerView initWithFrame:allowsBackgroundInteractionAcrossProccesses:](v6, "initWithFrame:allowsBackgroundInteractionAcrossProccesses:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke;
    v22[3] = &unk_1E530A3F0;
    objc_copyWeak(&v23, &location);
    [(UIView *)v7 setSubtreeTraitPropagationHandler:v22];
    id v8 = [(UIView *)v7 traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9
      || ([(_UIContextMenuUIController *)self menuStyle],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 preferredLayout],
          v10,
          v11 == 3))
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_3;
      v20[3] = &unk_1E52DC308;
      objc_copyWeak(&v21, &location);
      [(UIView *)v7 setDismissalHandler:v20];
      BOOL v12 = [(_UIContextMenuUIController *)self platterTransitionView];
      [(UIView *)v7 setContentWrapperView:v12];

      objc_destroyWeak(&v21);
    }
    id v13 = [(_UIContextMenuUIController *)self menuStyle];
    -[UIView setAllowsDragEventsToPassthrough:](v7, "setAllowsDragEventsToPassthrough:", [v13 preferredLayout] == 3);

    uint64_t v14 = [(_UIContextMenuUIController *)self menuStyle];
    char v15 = [v14 ignoresContainerSizeChange];

    if ((v15 & 1) == 0)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_4;
      v18[3] = &unk_1E530A418;
      objc_copyWeak(&v19, &location);
      [(UIView *)v7 setSizeChangeHandler:v18];
      objc_destroyWeak(&v19);
    }
    uint64_t v16 = self->_platterContainerView;
    self->_platterContainerView = v7;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    platterContainerView = self->_platterContainerView;
  }
  return platterContainerView;
}

- (UIVisualEffectView)backgroundEffectView
{
  backgroundEffectView = self->_backgroundEffectView;
  if (!backgroundEffectView)
  {
    int v4 = [UIVisualEffectView alloc];
    BOOL v5 = -[UIVisualEffectView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_backgroundEffectView;
    self->_backgroundEffectView = v5;

    backgroundEffectView = self->_backgroundEffectView;
  }
  return backgroundEffectView;
}

- (id)dismissalPreviewForStyle:(unint64_t)a3 clientReturnedPreview:(BOOL *)a4
{
  id v7 = [(_UIContextMenuUIController *)self menuConfiguration];
  if (a3 == 1)
  {
    id v8 = [(_UIContextMenuUIController *)self _destinationPlatterView];
    if (v8)
    {
      uint64_t v9 = [(_UIContextMenuUIController *)self _dragContainerView];
      id v10 = [v9 superview];
      [v9 center];
      double v12 = v11;
      double v14 = v13;
      char v15 = [(_UIContextMenuUIController *)self _subterraneanViewContainer];
      objc_msgSend(v10, "convertPoint:toView:", v15, v12, v14);
      double v17 = v16;
      double v19 = v18;

      int v20 = [(_UIContextMenuUIController *)self _subterraneanViewContainer];
      [v20 addSubview:v9];

      objc_msgSend(v9, "setCenter:", v17, v19);
      id v21 = [UIPreviewTarget alloc];
      double v22 = [v9 superview];
      [v9 center];
      double v24 = v23;
      double v26 = v25;
      [v8 targetTransform];
      CATransform3DGetAffineTransform(&v42, &v41);
      unint64_t v27 = -[UIPreviewTarget initWithContainer:center:transform:](v21, "initWithContainer:center:transform:", v22, &v42, v24, v26);

      double v28 = objc_opt_new();
      CGFloat v29 = +[UIColor clearColor];
      [v28 setBackgroundColor:v29];

      unint64_t v30 = [v8 preview];
      double v31 = [v30 outline];
      [v28 setVisiblePath:v31];

      double v32 = [v8 preview];
      double v33 = [v32 shadowPath];
      [v28 setShadowPath:v33];

      [v28 setAppliesShadow:1];
      double v34 = [[UITargetedPreview alloc] initWithView:v8 parameters:v28 target:v27];
      id v35 = [v8 preview];
      uint64_t v36 = [v35 previewMode];

      if (v36 == 4) {
        [(UITargetedPreview *)v34 _setPreviewMode:4];
      }
    }
    else
    {
      double v34 = 0;
    }
  }
  else
  {
    uint64_t v37 = [(_UIContextMenuUIController *)self delegate];
    id v38 = [(_UIContextMenuUIController *)self menuConfiguration];
    uint64_t v39 = [v38 identifier];
    double v34 = [v37 contextMenuUIController:self dismissalPreviewForItem:v39 clientReturnedPreview:a4];
  }
  return v34;
}

- (id)dismissalPreviewForSecondaryItem:(id)a3 style:(unint64_t)a4
{
  char v9 = 0;
  id v5 = a3;
  int v6 = [(_UIContextMenuUIController *)self delegate];
  id v7 = [v6 contextMenuUIController:self dismissalPreviewForItem:v5 clientReturnedPreview:&v9];

  return v7;
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuUIController *)self platterContainerView];
  id v12 = [v5 _window];

  int v6 = [v4 object];

  id v7 = [v12 windowScene];

  id v8 = v12;
  if (v6 == v7)
  {
    if ([(_UIContextMenuUIController *)self _isPresented])
    {
      char v9 = [(_UIContextMenuUIController *)self _platformMetrics];
      if ([v9 shouldDismissMenuOnSceneDeactivation])
      {
        id v10 = [(_UIContextMenuUIController *)self delegate];
        [v10 contextMenuUIController:self didRequestDismissalWithReason:3 alongsideActions:0 completion:0];
      }
    }
    else
    {
      double v11 = [(_UIContextMenuUIController *)self platterContainerView];
      [v11 setHidden:1];

      char v9 = [(_UIContextMenuUIController *)self contentPlatterView];
      [v9 setHidesCollapsedSourceView:0];
    }

    id v8 = v12;
  }
}

- (unint64_t)_preferredSubmenuHierarchyStyle
{
  uint64_t v3 = [(_UIContextMenuUIController *)self menuStyle];
  char v4 = [v3 prefersStackedHierarchy];

  if ((v4 & 1) != 0 || ![(_UIContextMenuUIController *)self _interfaceIdiom]) {
    return 1;
  }
  id v5 = [(_UIContextMenuUIController *)self platterContainerView];
  [v5 bounds];
  double Width = CGRectGetWidth(v11);
  id v7 = [(_UIContextMenuUIController *)self platterContainerView];
  double v8 = _UIContextMenuActionsViewWidth(v7, 0, 0, 0, [(_UIContextMenuUIController *)self _interfaceIdiom]);
  BOOL v9 = Width > v8 + v8;

  if (v9) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_enumeratePlatterViewsWithBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void *, uint64_t, uint64_t, unsigned char *))a3;
  char v26 = 0;
  id v5 = [(_UIContextMenuUIController *)self contentPlatterView];

  if (!v5) {
    goto LABEL_6;
  }
  int v6 = [(_UIContextMenuUIController *)self contentPlatterView];
  id v7 = [(_UIContextMenuUIController *)self flocker];
  unint64_t v8 = [v7 itemCount] - 1;

  uint64_t v9 = v8 >= 4 ? 4 : v8;
  v4[2](v4, v6, v9, 1, &v26);

  if (!v26)
  {
LABEL_6:
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(_UIContextMenuUIController *)self flocker];
    CGRect v11 = [v10 secondaryPlatterViews];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v18 = [v17 view];
          [v18 alpha];
          double v20 = fabs(v19);

          if (v20 >= 2.22044605e-16)
          {
            id v21 = [v17 view];
            v4[2](v4, v21, v14, 0, &v26);

            if (v26) {
              goto LABEL_16;
            }
            ++v14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }
LABEL_16:
  }
}

- (BOOL)_isPresented
{
  return [(_UIContextMenuUIController *)self state] != 0;
}

- (BOOL)_isAnimatingPresentation
{
  return [(_UIContextMenuUIController *)self state] == 1;
}

- (int64_t)_interfaceIdiom
{
  id v2 = [(_UIContextMenuUIController *)self menuConfiguration];
  uint64_t v3 = [v2 sourcePreview];
  char v4 = [v3 view];
  id v5 = [v4 traitCollection];
  int64_t v6 = [v5 userInterfaceIdiom];

  return v6;
}

- (id)_platformMetrics
{
  uint64_t v2 = [(_UIContextMenuUIController *)self _interfaceIdiom];
  return _UIContextMenuGetPlatformMetrics(v2);
}

- (UIViewFloatAnimatableProperty)backgroundViewAnimationProgress
{
  backgroundViewAnimationProgress = self->_backgroundViewAnimationProgress;
  if (!backgroundViewAnimationProgress)
  {
    char v4 = (UIViewFloatAnimatableProperty *)objc_opt_new();
    id v5 = self->_backgroundViewAnimationProgress;
    self->_backgroundViewAnimationProgress = v4;

    backgroundViewAnimationProgress = self->_backgroundViewAnimationProgress;
  }
  return backgroundViewAnimationProgress;
}

- (void)_testing_dismissByTappingOutside
{
  id v3 = [(_UIContextMenuUIController *)self delegate];
  [v3 contextMenuUIController:self didRequestDismissalWithReason:0 alongsideActions:0 completion:0];
}

- (void)_testing_tapAnAction
{
  id v2 = [(_UIContextMenuUIController *)self menuView];
  [v2 performSelector:sel__testing_tapAnAction];
}

- (_UIContextMenuView)menuView
{
  return self->_menuView;
}

- (_UIContextMenuUIControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIContextMenuUIControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIFulfilledContextMenuConfiguration)menuConfiguration
{
  return self->_menuConfiguration;
}

- (void)setMenuConfiguration:(id)a3
{
}

- (_UIContextMenuStyle)menuStyle
{
  return self->_menuStyle;
}

- (void)setMenuStyle:(id)a3
{
}

- (UITapGestureRecognizer)platterActionTapGestureRecognizer
{
  return self->_platterActionTapGestureRecognizer;
}

- (void)setPlatterActionTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)dismissalTapGestureRecognizer
{
  return self->_dismissalTapGestureRecognizer;
}

- (void)setDismissalTapGestureRecognizer:(id)a3
{
}

- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)actionScrubbingHandoffGestureRecognizer
{
  return self->_actionScrubbingHandoffGestureRecognizer;
}

- (void)setActionScrubbingHandoffGestureRecognizer:(id)a3
{
}

- (_UIContextMenuPanController)platterPanController
{
  return self->_platterPanController;
}

- (void)setPlatterPanController:(id)a3
{
}

- (_UIContextMenuLayoutArbiter)layoutArbiter
{
  return self->_layoutArbiter;
}

- (void)setLayoutArbiter:(id)a3
{
}

- (CGSize)previewSize
{
  double width = self->_previewSize.width;
  double height = self->_previewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  self->_previewSize = a3;
}

- (BOOL)previewSizeDidChange
{
  return self->_previewSizeDidChange;
}

- (void)setPreviewSizeDidChange:(BOOL)a3
{
  self->_previewSizeDidChange = a3;
}

- (BOOL)menuIsConcealed
{
  return self->_menuIsConcealed;
}

- (void)setMenuIsConcealed:(BOOL)a3
{
  self->_menuIsConcealed = a3;
}

- (BOOL)didAvoidKeyboard
{
  return self->_didAvoidKeyboard;
}

- (void)setDidAvoidKeyboard:(BOOL)a3
{
  self->_didAvoidKeyboard = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_UIContextMenuSubterraneanContainerView)_subterraneanViewContainer
{
  return self->__subterraneanViewContainer;
}

- (void)set_subterraneanViewContainer:(id)a3
{
}

- (_UIPlatterView)_destinationPlatterView
{
  return self->__destinationPlatterView;
}

- (void)set_destinationPlatterView:(id)a3
{
}

- (UIView)_dragContainerView
{
  return self->__dragContainerView;
}

- (void)set_dragContainerView:(id)a3
{
}

- (id)_postMorphDragItemUpdate
{
  return self->__postMorphDragItemUpdate;
}

- (void)set_postMorphDragItemUpdate:(id)a3
{
}

- (BOOL)_dragWasCanceled
{
  return self->__dragWasCanceled;
}

- (void)set_dragWasCanceled:(BOOL)a3
{
  self->__dragWasCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postMorphDragItemUpdate, 0);
  objc_storeStrong((id *)&self->__dragContainerView, 0);
  objc_storeStrong((id *)&self->__destinationPlatterView, 0);
  objc_storeStrong((id *)&self->__subterraneanViewContainer, 0);
  objc_storeStrong((id *)&self->_layoutArbiter, 0);
  objc_storeStrong((id *)&self->_platterPanController, 0);
  objc_storeStrong((id *)&self->_actionScrubbingHandoffGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_platterActionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuStyle, 0);
  objc_storeStrong((id *)&self->_menuConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundViewAnimationProgress, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_flocker, 0);
  objc_storeStrong((id *)&self->_menuView, 0);
  objc_storeStrong((id *)&self->_contentPlatterView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_platterTransitionView, 0);
  objc_storeStrong((id *)&self->_platterContainerView, 0);
}

@end