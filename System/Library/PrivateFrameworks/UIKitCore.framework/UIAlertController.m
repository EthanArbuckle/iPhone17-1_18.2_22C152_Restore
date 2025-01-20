@interface UIAlertController
+ (BOOL)_allowInteractiveSheetDismissal;
+ (UIAlertController)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;
+ (id)_alertControllerContainedInViewController:(id)a3;
+ (id)_alertControllerWithTitle:(id)a3 message:(id)a4;
+ (id)_createTransitioningDelegateForIdiom:(int64_t)a3;
+ (void)registerPlatformStyleProvider:(id)a3 forIdiom:(int64_t)a4;
- (BOOL)_alignsToKeyboard;
- (BOOL)_allowsShowingDimmingView;
- (BOOL)_canBePresentedAtLocation:(CGPoint)a3;
- (BOOL)_canDismissWithGestureRecognizer;
- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations;
- (BOOL)_dismissedFromShim;
- (BOOL)_hasAttributedMessage;
- (BOOL)_hasAttributedTitle;
- (BOOL)_hasContentToDisplay;
- (BOOL)_hasDetailMessage;
- (BOOL)_hasMessage;
- (BOOL)_hasPreservedInputViews;
- (BOOL)_hasTitle;
- (BOOL)_idiomSupportsBackGesture:(int64_t)a3;
- (BOOL)_isHidden;
- (BOOL)_isPresented;
- (BOOL)_isPresentedAsPopover;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_needsPreferredSizeCalculated;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_shouldAlignToKeyboard;
- (BOOL)_shouldAllowNilParameters;
- (BOOL)_shouldBecomeFirstResponder;
- (BOOL)_shouldDismissOnSizeChange;
- (BOOL)_shouldFitWidthToContentViewControllerWidth;
- (BOOL)_shouldFlipFrameForShimDismissal;
- (BOOL)_shouldInvokeCancelActionOnDimmingViewTap;
- (BOOL)_shouldPreserveInputViews;
- (BOOL)_shouldProvideDimmingView;
- (BOOL)_shouldReverseActions;
- (BOOL)_shouldSizeToFillSuperview;
- (BOOL)_shouldSupportReturnKeyPresses;
- (BOOL)_shouldTreatEmptyStringsAsNil;
- (BOOL)_viewControllerIsPresentedInModalPresentationContext:(id)a3;
- (BOOL)_wantsUnclippedContentViewControllerContainer;
- (BOOL)_wantsUnclippedHeaderContentViewControllerContainer;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isSpringLoaded;
- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3;
- (BOOL)shouldAutorotate;
- (NSArray)actions;
- (NSArray)textFields;
- (NSAttributedString)_attributedDetailMessage;
- (NSAttributedString)_attributedMessage;
- (NSAttributedString)_attributedTitle;
- (NSIndexSet)_indexesOfActionSectionSeparators;
- (NSMutableArray)_actionDelimiterIndices;
- (NSMutableArray)_actions;
- (NSString)description;
- (NSString)message;
- (UIAlertAction)_cancelAction;
- (UIAlertAction)_focusedAction;
- (UIAlertAction)preferredAction;
- (UIAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIAlertControllerCoordinatedActionPerforming)coordinatedActionPerformingDelegate;
- (UIAlertControllerSeverity)severity;
- (UIAlertControllerStyle)preferredStyle;
- (UIAlertControllerSystemProvidedPresentationDelegate)_systemProvidedPresentationDelegate;
- (UIAlertControllerVisualStyle)_visualStyle;
- (UIAlertControllerVisualStyleProviding)_styleProvider;
- (UIEdgeInsets)_contentInsets;
- (UIGestureRecognizer)_systemProvidedGestureRecognizer;
- (UIImage)_accessoryImage;
- (UIImage)image;
- (UIPopoverController)_compatibilityPopoverController;
- (UIPreviewInteractionController)_previewInteractionController;
- (UIView)_dimmingView;
- (UIView)_foregroundView;
- (UIView)_presentationSourceRepresentationView;
- (UIView)_systemProvidedPresentationView;
- (UIViewController)_headerContentViewController;
- (UIViewController)_separatedHeaderContentViewController;
- (UIViewController)contentViewController;
- (_UIAlertControllerTextFieldViewController)_textFieldViewController;
- (_UIAnimationCoordinator)temporaryAnimationCoordinator;
- (__CFString)_powerLoggingEventName;
- (double)_effectAlpha;
- (id)_actionForReturnKey;
- (id)_alertControllerContainer;
- (id)_alertControllerView;
- (id)_currentDescriptor;
- (id)_dismissGestureRecognizer;
- (id)_keyCommandForAction:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_returnKeyCommand;
- (id)_setView:(id)a3 forSystemProvidedPresentationWithDelegate:(id)a4;
- (id)_textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4;
- (id)cancelAction;
- (id)linkedAlertControllers;
- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4;
- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6;
- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5;
- (int64_t)_buttonTypeForBackGestureForIdiom:(int64_t)a3;
- (int64_t)_modalPresentationStyleForResolvedStyle;
- (int64_t)_resolvedStyle;
- (int64_t)_titleLineBreakMode;
- (int64_t)_titleMaximumLineCount;
- (void)_action:(id)a3 changedToKeyCommandWithInput:(id)a4 modifierFlags:(int64_t)a5;
- (void)_addActionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6;
- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 shouldDismissHandler:(id)a6;
- (void)_addKeyCommandForAction:(id)a3 withInput:(id)a4 modifierFlags:(int64_t)a5;
- (void)_addReturnKeyCommandIfAppropriate;
- (void)_addSectionDelimiter;
- (void)_attemptAnimatedDismissWithGestureRecognizer:(id)a3;
- (void)_becomeFirstResponderIfAppropriate;
- (void)_beginNoPresentingViewControllerPresentation:(id)a3;
- (void)_childViewController:(id)a3 willTransitionToSize:(CGSize)a4 withAnimations:(id)a5;
- (void)_clearActionHandlers;
- (void)_contentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4;
- (void)_didParentTextFieldViewController;
- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4;
- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4 triggeredByPopoverDimmingView:(BOOL)a5 dismissCompletion:(id)a6;
- (void)_dismissFromBackButton:(id)a3;
- (void)_dismissFromPopoverDimmingView;
- (void)_dismissWithAction:(id)a3;
- (void)_dismissWithAction:(id)a3 dismissCompletion:(id)a4;
- (void)_dismissWithCancelOrEmptyAction;
- (void)_endNoPresentingViewControllerPresentation;
- (void)_flipFrameForShimDismissalIfNecessary;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_handleKeyCommand:(id)a3;
- (void)_handleReturn;
- (void)_headerContentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4;
- (void)_installBackGestureRecognizer;
- (void)_invokeHandlersForAction:(id)a3;
- (void)_logBeingDismissed;
- (void)_logBeingPresented;
- (void)_performAction:(id)a3 invokeActionBlock:(id)a4 dismissAndPerformActionIfNotAlreadyPerformed:(id)a5;
- (void)_performBatchActionChangesWithBlock:(id)a3;
- (void)_postDidBeginSystemProvidedDismissalOfAlertController;
- (void)_postWillBeginSystemProvidedDismissalOfAlertController;
- (void)_preserveInputViewsAnimated:(BOOL)a3;
- (void)_recomputePreferredContentSize;
- (void)_reevaluateResolvedStyle;
- (void)_removeAllActions;
- (void)_removeAllTextFields;
- (void)_removeKeyCommandForAction:(id)a3;
- (void)_resolvedStyleChanged;
- (void)_restoreInputViewsAnimated:(BOOL)a3;
- (void)_setAccessoryImage:(id)a3;
- (void)_setActions:(id)a3;
- (void)_setAttributedDetailMessage:(id)a3;
- (void)_setAttributedMessage:(id)a3;
- (void)_setAttributedTitle:(id)a3;
- (void)_setCompatibilityPopoverController:(id)a3;
- (void)_setDismissedFromShim:(BOOL)a3;
- (void)_setEffectAlpha:(double)a3;
- (void)_setHasPreservedInputViews:(BOOL)a3;
- (void)_setHeaderContentViewController:(id)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setIndexesOfActionSectionSeparators:(id)a3;
- (void)_setPresentationSourceRepresentationView:(id)a3;
- (void)_setPreviewInteractionController:(id)a3;
- (void)_setSeparatedHeaderContentViewController:(id)a3;
- (void)_setShouldAlignToKeyboard:(BOOL)a3;
- (void)_setShouldAllowNilParameters:(BOOL)a3;
- (void)_setShouldInvokeCancelActionOnDimmingViewTap:(BOOL)a3;
- (void)_setShouldReverseActions:(BOOL)a3;
- (void)_setStyleProvider:(id)a3;
- (void)_setSystemProvidedGestureRecognizer:(id)a3;
- (void)_setSystemProvidedPresentationDelegate:(id)a3;
- (void)_setSystemProvidedPresentationView:(id)a3;
- (void)_setTitleLineBreakMode:(int64_t)a3;
- (void)_setTitleMaximumLineCount:(int64_t)a3;
- (void)_setVisualStyle:(id)a3;
- (void)_setWantsUnclippedContentViewControllerContainer:(BOOL)a3;
- (void)_setWantsUnclippedHeaderContentViewControllerContainer:(BOOL)a3;
- (void)_uninstallBackGestureRecognizer;
- (void)_updateModalPresentationStyle;
- (void)_updateProvidedStyle;
- (void)_updateProvidedStyleWithTraitCollection:(id)a3;
- (void)_updateShouldAlignToKeyboard;
- (void)_updateTextFieldViewControllerWithVisualStyle:(id)a3;
- (void)_updateViewFrameForLandscapePresentationInShimIfNecessary;
- (void)_userInterfaceIdiomChanged;
- (void)_willParentTextFieldViewController;
- (void)addAction:(UIAlertAction *)action;
- (void)addTextFieldWithConfigurationHandler:(void *)configurationHandler;
- (void)dealloc;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6;
- (void)setCancelAction:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setCoordinatedActionPerformingDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setMessage:(NSString *)message;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPreferredAction:(UIAlertAction *)preferredAction;
- (void)setPreferredStyle:(int64_t)a3;
- (void)setSeverity:(UIAlertControllerSeverity)severity;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setTemporaryAnimationCoordinator:(id)a3;
- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3;
- (void)setTitle:(NSString *)title;
- (void)set_shouldFlipFrameForShimDismissal:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIAlertController

+ (BOOL)_allowInteractiveSheetDismissal
{
  return 1;
}

- (UIAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)UIAlertController;
  v4 = [(UIViewController *)&v27 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    _UIApplicationAssertForExtensionType(&unk_1ED3EF158);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v6->_actions;
    v6->_actions = v7;

    uint64_t v9 = [MEMORY[0x1E4F28D60] indexSet];
    indexesOfActionSectionSeparators = v6->_indexesOfActionSectionSeparators;
    v6->_indexesOfActionSectionSeparators = (NSIndexSet *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionToKeyCommandsDictionary = v6->_actionToKeyCommandsDictionary;
    v6->_actionToKeyCommandsDictionary = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    keyCommandToActionMapTable = v6->_keyCommandToActionMapTable;
    v6->_keyCommandToActionMapTable = (NSMapTable *)v13;

    v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    linkedAlertControllers = v6->_linkedAlertControllers;
    v6->_linkedAlertControllers = v15;

    v17 = objc_alloc_init(_UIAlertControllerTextFieldViewController);
    textFieldViewController = v6->_textFieldViewController;
    v6->_textFieldViewController = v17;

    uint64_t v19 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    actionsWithInvokedHandlers = v6->_actionsWithInvokedHandlers;
    v6->_actionsWithInvokedHandlers = (NSPointerArray *)v19;

    v21 = +[UIDevice currentDevice];
    uint64_t v22 = +[UIAlertController _createTransitioningDelegateForIdiom:](UIAlertController, "_createTransitioningDelegateForIdiom:", [v21 userInterfaceIdiom]);
    id ownedTransitioningDelegate = v6->_ownedTransitioningDelegate;
    v6->_id ownedTransitioningDelegate = (id)v22;

    [(UIViewController *)v6 setTransitioningDelegate:v6->_ownedTransitioningDelegate];
    [(UIAlertController *)v6 _updateModalPresentationStyle];
    [(UIAlertController *)v6 set_shouldFlipFrameForShimDismissal:0];
    v6->_titleMaximumLineCount = -1;
    v6->_titleLineBreakMode = 4;
    v6->__shouldAlignToKeyboard = 1;
    v6->__shouldInvokeCancelActionOnDimmingViewTap = 1;
    v28[0] = 0x1ED3F5A30;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v25 = [(UIViewController *)v6 _registerForTraitTokenChanges:v24 withTarget:v6 action:sel__userInterfaceIdiomChanged];
  }
  return v5;
}

+ (UIAlertController)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
  v7 = title;
  v8 = message;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  if ([(NSString *)v7 length] >= 0x3E8)
  {
    uint64_t v10 = [(NSString *)v7 substringToIndex:999];

    v7 = (NSString *)v10;
  }
  if ([(NSString *)v8 length] >> 4 >= 0x271)
  {
    uint64_t v11 = [(NSString *)v8 substringToIndex:9999];

    v8 = (NSString *)v11;
  }
  [v9 setTitle:v7];
  [v9 setMessage:v8];
  [v9 setPreferredStyle:preferredStyle];

  return (UIAlertController *)v9;
}

- (void)addAction:(UIAlertAction *)action
{
  uint64_t v10 = action;
  if ([(UIAlertAction *)v10 style] == UIAlertActionStyleCancel)
  {
    if (self->_cancelAction)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UIAlertController.m" lineNumber:291 description:@"UIAlertController can only have one action with a style of UIAlertActionStyleCancel"];
    }
    v5 = [(UIAlertController *)self _visualStyle];
    v6 = [v5 _keyCommandInputForCancelAction];
    [(UIAlertAction *)v10 _setKeyCommandInput:v6 modifierFlags:0];

    [(UIAlertController *)self setCancelAction:v10];
  }
  [(NSMutableArray *)self->_actions addObject:v10];
  [(UIAlertAction *)v10 _setAlertController:self];
  v7 = [(UIAlertAction *)v10 _keyCommandInput];
  [(UIAlertController *)self _action:v10 changedToKeyCommandWithInput:v7 modifierFlags:[(UIAlertAction *)v10 _keyCommandModifierFlags]];

  v8 = [(UIAlertController *)self _alertControllerView];
  [v8 _actionsChanged];

  [(UIAlertController *)self _updateProvidedStyle];
}

+ (id)_alertControllerWithTitle:(id)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() alertControllerWithTitle:v6 message:v5 preferredStyle:0];

  return v7;
}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = +[UIAlertAction actionWithTitle:a3 style:a4 handler:0];
  [v9 setSimpleHandler:v8];

  [(UIAlertController *)self addAction:v9];
}

- (void)_addActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 shouldDismissHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[UIAlertAction actionWithTitle:a3 style:a4 handler:0];
  [v12 setSimpleHandler:v11];

  [v12 setShouldDismissHandler:v10];
  [(UIAlertController *)self addAction:v12];
}

- (void)_addActionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = +[UIAlertAction actionWithTitle:a3 style:a5 handler:0];
  [v12 setSimpleHandler:v10];

  [v12 setImage:v11];
  [(UIAlertController *)self addAction:v12];
}

- (void)_setActions:(id)a3
{
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  if (([(NSMutableArray *)self->_actions isEqual:v5] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__UIAlertController__setActions___block_invoke;
    v6[3] = &unk_1E52D9F98;
    v6[4] = self;
    id v7 = v5;
    [(UIAlertController *)self _performBatchActionChangesWithBlock:v6];
  }
}

void __33__UIAlertController__setActions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _removeAllActions];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "addAction:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performBatchActionChangesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(UIAlertController *)self _alertControllerView];
  if (v5)
  {
    ++self->_batchActionChangesInProgressCount;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    long long v8 = __57__UIAlertController__performBatchActionChangesWithBlock___block_invoke;
    long long v9 = &unk_1E52DB330;
    long long v10 = self;
    id v11 = v4;
    [v5 _performBatchActionChangesWithBlock:&v6];
    [(UIAlertController *)self _updateProvidedStyle];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __57__UIAlertController__performBatchActionChangesWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  --*(void *)(*(void *)(a1 + 32) + 1104);
  return result;
}

- (void)_removeAllActions
{
  [(NSMutableArray *)self->_actions removeAllObjects];
  cancelAction = self->_cancelAction;
  self->_cancelAction = 0;
}

- (void)setPreferredAction:(UIAlertAction *)preferredAction
{
  id v11 = preferredAction;
  uint64_t v6 = [(UIAlertController *)self preferredAction];

  uint64_t v7 = v11;
  if (v6 != v11)
  {
    char v8 = [(NSMutableArray *)self->_actions containsObject:v11];
    if (v11 && (v8 & 1) == 0)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIAlertController.m" lineNumber:396 description:@"The -preferredAction of an alert controller must be contained in the -actions array or be nil."];
    }
    objc_storeStrong((id *)&self->_preferredAction, preferredAction);
    long long v9 = [(UIAlertController *)self _alertControllerView];
    [v9 _updatePreferredAction];

    uint64_t v7 = v11;
  }
}

- (void)_addSectionDelimiter
{
  id v4 = (id)[(NSIndexSet *)self->_indexesOfActionSectionSeparators mutableCopy];
  uint64_t v3 = [(UIAlertController *)self actions];
  objc_msgSend(v4, "addIndex:", objc_msgSend(v3, "count"));

  [(UIAlertController *)self _setIndexesOfActionSectionSeparators:v4];
}

- (void)_setIndexesOfActionSectionSeparators:(id)a3
{
  id v6 = a3;
  if (!-[NSIndexSet isEqualToIndexSet:](self->_indexesOfActionSectionSeparators, "isEqualToIndexSet:"))
  {
    objc_storeStrong((id *)&self->_indexesOfActionSectionSeparators, a3);
    uint64_t v5 = [(UIAlertController *)self _alertControllerView];
    [v5 _actionsChanged];
  }
}

- (void)_action:(id)a3 changedToKeyCommandWithInput:(id)a4 modifierFlags:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(UIAlertController *)self _removeKeyCommandForAction:v9];
  [(UIAlertController *)self _addKeyCommandForAction:v9 withInput:v8 modifierFlags:a5];
}

- (void)_addKeyCommandForAction:(id)a3 withInput:(id)a4 modifierFlags:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = [(UIAlertController *)self _keyCommandForAction:v10 input:v8 modifierFlags:a5];
    [(UIViewController *)self addKeyCommand:v9];
  }
}

- (void)_removeKeyCommandForAction:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_actionToKeyCommandsDictionary, "objectForKey:");
  if (v4)
  {
    [(NSMapTable *)self->_keyCommandToActionMapTable removeObjectForKey:v4];
    [(UIViewController *)self removeKeyCommand:v4];
  }
  [(NSMutableDictionary *)self->_actionToKeyCommandsDictionary removeObjectForKey:v5];
}

- (id)_keyCommandForAction:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[UIKeyCommand keyCommandWithInput:v9 modifierFlags:a5 action:sel__handleKeyCommand_];
  if ([v8 style] == 1 && objc_msgSend(v9, "isEqualToString:", @"UIKeyInputEscape"))
  {
    [v10 setDiscoverabilityTitle:&stru_1ED0E84C0];
  }
  else
  {
    id v11 = [v8 title];
    [v10 setDiscoverabilityTitle:v11];
  }
  [(NSMapTable *)self->_keyCommandToActionMapTable setObject:v8 forKey:v10];

  return v10;
}

- (void)_handleKeyCommand:(id)a3
{
  id v4 = [(NSMapTable *)self->_keyCommandToActionMapTable objectForKey:a3];
  if ([v4 isEnabled]) {
    [(UIAlertController *)self _dismissAnimated:1 triggeringAction:v4];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__handleReturn == a3)
  {
    id v5 = [(UIAlertController *)self textFields];
    BOOL v4 = [v5 count] == 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAlertController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)_handleReturn
{
  uint64_t v3 = [(UIAlertController *)self _actionForReturnKey];
  if (v3)
  {
    BOOL v4 = v3;
    [(UIAlertController *)self _dismissAnimated:1 triggeringAction:v3];
    uint64_t v3 = v4;
  }
}

- (id)_returnKeyCommand
{
  return +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:sel__handleReturn];
}

- (void)_addReturnKeyCommandIfAppropriate
{
  if ([(UIAlertController *)self _resolvedStyle] == 1)
  {
    uint64_t v3 = [(UIViewController *)self _focusSystem];

    if (!v3)
    {
      id v4 = [(UIAlertController *)self _returnKeyCommand];
      [(UIViewController *)self addKeyCommand:v4];
    }
  }
}

- (NSArray)actions
{
  id v2 = [(UIAlertController *)self _actions];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)_actionForReturnKey
{
  uint64_t v3 = [(UIAlertController *)self preferredAction];

  if (v3)
  {
    id v4 = [(UIAlertController *)self preferredAction];
    goto LABEL_11;
  }
  id v5 = [(UIAlertController *)self actions];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__UIAlertController__actionForReturnKey__block_invoke;
  v11[3] = &unk_1E52DB1D8;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = [v7 count];
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      id v4 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = [v7 firstObject];
    goto LABEL_8;
  }
  id v4 = [(UIAlertController *)self _cancelAction];

  if (v4)
  {
    uint64_t v9 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_17));
LABEL_8:
    id v4 = (void *)v9;
  }
LABEL_10:

LABEL_11:
  return v4;
}

void __40__UIAlertController__actionForReturnKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

BOOL __40__UIAlertController__actionForReturnKey__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 style] != 1;
}

- (void)addTextFieldWithConfigurationHandler:(void *)configurationHandler
{
  uint64_t v8 = configurationHandler;
  if ([(UIAlertController *)self preferredStyle] != UIAlertControllerStyleAlert)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIAlertController.m" lineNumber:586 description:@"Text fields can only be added to an alert controller of style UIAlertControllerStyleAlert"];
  }
  [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController setContainer:self];
  id v5 = [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController addTextFieldWithPlaceholder:0];
  if (v8) {
    v8[2](v8, v5);
  }
  [(UIAlertController *)self _updateShouldAlignToKeyboard];
  id v6 = [(UIAlertController *)self _alertControllerView];
  [v6 _textFieldsChanged];
}

- (NSArray)textFields
{
  return [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController textFields];
}

- (_UIAlertControllerTextFieldViewController)_textFieldViewController
{
  return self->_textFieldViewController;
}

- (BOOL)_shouldSupportReturnKeyPresses
{
  id v3 = [(UIViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 2)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(UIViewController *)self traitCollection];
    BOOL v4 = [v5 userInterfaceIdiom] != 8;
  }
  return v4;
}

- (id)_textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIAlertController *)self _visualStyle];
  uint64_t v8 = [v7 textFieldContainingViewWithTextField:v6 position:a4];

  return v8;
}

- (void)_willParentTextFieldViewController
{
}

- (void)_didParentTextFieldViewController
{
  [(UIViewController *)self addChildViewController:self->_textFieldViewController];
  textFieldViewController = self->_textFieldViewController;
  [(UIViewController *)textFieldViewController didMoveToParentViewController:self];
}

- (void)setTextFieldsCanBecomeFirstResponder:(BOOL)a3
{
  textFieldViewController = self->_textFieldViewController;
  if (textFieldViewController) {
    [(_UIAlertControllerTextFieldViewController *)textFieldViewController setTextFieldsCanBecomeFirstResponder:a3];
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  id v3 = [(UIAlertController *)&v8 description];
  if (os_variant_has_internal_diagnostics())
  {
    id v6 = [(UIViewController *)self title];
    id v7 = [(UIAlertController *)self message];
    [v3 stringByAppendingFormat:@" title=\"%@\" message=\"%@\"", v6, v7];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }

  return (NSString *)v4;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_presenter)
  {
    +[_UIAlertControllerShimPresenter _removePresenter:](_UIAlertControllerShimPresenter, "_removePresenter:");
    presenter = self->_presenter;
    self->_presenter = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_actions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 _setAlertController:0];
        [(UIAlertController *)self _removeKeyCommandForAction:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(UIAlertController *)self _uninstallBackGestureRecognizer];
  id v10 = [(UIAlertController *)self _alertControllerView];
  [v10 setAlertController:0];

  [(UIAlertController *)self _clearActionHandlers];
  [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController setContainer:0];
  id ownedTransitioningDelegate = self->_ownedTransitioningDelegate;
  self->_id ownedTransitioningDelegate = 0;

  v12.receiver = self;
  v12.super_class = (Class)UIAlertController;
  [(UIViewController *)&v12 dealloc];
}

- (BOOL)shouldAutorotate
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  uint64_t v5 = [(UIViewController *)self presentingViewController];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 _isSupportedInterfaceOrientation:a3];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIAlertController;
    unsigned __int8 v7 = [(UIViewController *)&v10 _isSupportedInterfaceOrientation:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)_getRotationContentSettings:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v6 = [(UIViewController *)self view];
    uint64_t v7 = [v6 window];
    BOOL v8 = (void *)v7;
    if (has_internal_diagnostics)
    {
      if (v7)
      {
        long long v16 = [(UIViewController *)self view];
        v17 = [v16 window];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
LABEL_12:
          a3->var6 = 0;
          return;
        }
        uint64_t v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v19 = [(UIViewController *)self view];
          v20 = [v19 window];
          int v21 = 138412290;
          uint64_t v22 = v20;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Surprising window for legacy alert presentation: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else if (v7)
    {
      uint64_t v9 = [(UIViewController *)self view];
      objc_super v10 = [v9 window];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0)
      {
        objc_super v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_getRotationContentSettings____s_category) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v13 = v12;
          long long v14 = [(UIViewController *)self view];
          long long v15 = [v14 window];
          int v21 = 138412290;
          uint64_t v22 = v15;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Surprising window for legacy alert presentation: %@", (uint8_t *)&v21, 0xCu);
        }
      }
      goto LABEL_12;
    }

    goto LABEL_12;
  }
}

- (void)loadView
{
  [(UIAlertController *)self _updateProvidedStyle];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v4 = [(UIAlertController *)self _visualStyle];

  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      char v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "We must we have a _visualStyle before creating the _UIAlertControllerView", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    objc_super v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &loadView___s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "We must we have a _visualStyle before creating the _UIAlertControllerView", buf, 2u);
    }
  }
  uint64_t v5 = [(UIViewController *)self traitCollection];
  uint64_t v6 = -[UIAlertController platformStyleViewForAlertController:inIdiom:](self, "platformStyleViewForAlertController:inIdiom:", self, [v5 userInterfaceIdiom]);

  if (objc_opt_respondsToSelector())
  {
    id v7 = v6;
    objc_msgSend(v7, "setSpringLoaded:", -[UIAlertController isSpringLoaded](self, "isSpringLoaded"));
  }
  [v6 setAlertController:self];
  [(UIViewController *)self setView:v6];
  BOOL v8 = [(UIViewController *)self _screen];
  [v8 bounds];
  objc_msgSend(v6, "setFrame:");

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__UIAlertController_loadView__block_invoke;
  v13[3] = &unk_1E52D9F70;
  id v14 = v6;
  id v9 = v6;
  +[UIView _performSystemAppearanceModifications:v13];
  [(UIAlertController *)self _updateShouldAlignToKeyboard];
  [v9 _actionsChanged];
  [v9 _textFieldsChanged];
  objc_super v10 = [(UIAlertController *)self _visualStyle];
  [v9 _setVisualStyle:v10];
}

uint64_t __29__UIAlertController_loadView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasDimmingView:", +[UIAlertController _shouldUsePresentationController](UIAlertController, "_shouldUsePresentationController") ^ 1);
  id v2 = *(void **)(a1 + 32);
  return [v2 setShouldHaveBackdropView:1];
}

- (void)_updateShouldAlignToKeyboard
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__UIAlertController__updateShouldAlignToKeyboard__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

void __49__UIAlertController__updateShouldAlignToKeyboard__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _alertControllerView];
  objc_msgSend(v2, "setAlignsToKeyboard:", objc_msgSend(*(id *)(a1 + 32), "_alignsToKeyboard"));
}

- (BOOL)_alignsToKeyboard
{
  id v3 = [(UIViewController *)self _window];
  if ([v3 _isHostedInAnotherProcess]) {
    LOBYTE(v4) = 1;
  }
  else {
    int v4 = [v3 _windowOwnsInterfaceOrientation] ^ 1;
  }
  if ([(UIAlertController *)self _shouldAlignToKeyboard])
  {
    uint64_t v5 = [(UIAlertController *)self contentViewController];
    uint64_t v6 = [(UIAlertController *)self textFields];
    uint64_t v7 = [v6 count];
    BOOL v8 = [(UIAlertController *)self _visualStyle];
    char v9 = [v8 placementAvoidsKeyboard];
    if (v5) {
      char v10 = 1;
    }
    else {
      char v10 = v4;
    }
    if (v7) {
      char v10 = 1;
    }
    char v11 = v10 & v9;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_setShouldReverseActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIAlertController *)self _alertControllerView];
  [v4 _setActionsReversed:v3];
}

- (BOOL)_shouldReverseActions
{
  id v2 = [(UIAlertController *)self _alertControllerView];
  char v3 = [v2 _actionsReversed];

  return v3;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)UIAlertController;
  [(UIViewController *)&v16 viewDidLoad];
  char v3 = [(UIAlertController *)self _alertControllerView];
  id v4 = [(UIViewController *)self traitCollection];
  BOOL v5 = -[UIAlertController _idiomSupportsBackGesture:](self, "_idiomSupportsBackGesture:", [v4 userInterfaceIdiom]);

  if (v5) {
    [(UIAlertController *)self _installBackGestureRecognizer];
  }
  uint64_t v6 = [(UIViewController *)self title];

  if (v6)
  {
    uint64_t v7 = [(UIViewController *)self title];
    [v3 _setTitle:v7];
  }
  BOOL v8 = [(UIAlertController *)self message];

  if (v8)
  {
    char v9 = [(UIAlertController *)self message];
    [v3 _setMessage:v9];
  }
  char v10 = [(UIAlertController *)self _attributedTitle];

  if (v10)
  {
    char v11 = [(UIAlertController *)self _attributedTitle];
    [v3 _setAttributedTitle:v11];
  }
  objc_super v12 = [(UIAlertController *)self _attributedMessage];

  if (v12)
  {
    long long v13 = [(UIAlertController *)self _attributedMessage];
    [v3 _setAttributedMessage:v13];
  }
  id v14 = [(UIAlertController *)self _attributedDetailMessage];

  if (v14)
  {
    long long v15 = [(UIAlertController *)self _attributedDetailMessage];
    [v3 _setAttributedDetailMessage:v15];
  }
}

- (id)_alertControllerView
{
  if ([(UIViewController *)self isViewLoaded])
  {
    char v3 = [(UIViewController *)self view];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (BOOL)_needsPreferredSizeCalculated
{
  if ([(UIViewController *)self _isInPopoverPresentation]) {
    return 1;
  }
  return [(UIAlertController *)self _isPresentedAsPopover];
}

- (void)_recomputePreferredContentSize
{
  self->_isInRecomputePreferredContentSize = 1;
  if ([(UIAlertController *)self _needsPreferredSizeCalculated])
  {
    char v3 = [(UIAlertController *)self _alertControllerView];
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v5 = v4;
    double v7 = v6;

    -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
    -[UIViewController setContentSizeForViewInPopover:](self, "setContentSizeForViewInPopover:", v5, v7);
  }
  self->_isInRecomputePreferredContentSize = 0;
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  [(UIViewController *)&v6 viewWillLayoutSubviews];
  char v3 = [(UIAlertController *)self _alertControllerView];
  [(UIAlertController *)self _resolvedStyleChanged];
  [(UIAlertController *)self _reevaluateResolvedStyle];
  if ([v3 conformsToProtocol:&unk_1ED547688])
  {
    id v4 = v3;
    double v5 = v4;
    if (self->_separatedHeaderContentViewController) {
      [v4 _addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary];
    }
    if (self->_headerContentViewController) {
      [v5 _addHeaderContentViewControllerToViewHierarchyIfNecessary];
    }
  }
  if ([v3 conformsToProtocol:&unk_1ED547778] && self->_contentViewController) {
    [v3 _addContentViewControllerToViewHierarchyIfNecessary];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  [(UIViewController *)&v6 viewDidLayoutSubviews];
  char v3 = [(UIAlertController *)self _alertControllerView];
  if ([v3 conformsToProtocol:&unk_1ED547688]) {
    [v3 _recomputeActionMetrics];
  }
  id v4 = [v3 window];
  if (v4)
  {
    BOOL isInRecomputePreferredContentSize = self->_isInRecomputePreferredContentSize;

    if (!isInRecomputePreferredContentSize) {
      [(UIAlertController *)self _recomputePreferredContentSize];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UIAlertController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ([(UIAlertController *)self _shouldDismissOnSizeChange]) {
    [(UIAlertController *)self _dismissWithCancelOrEmptyAction];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__UIAlertController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E52DA598;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __72__UIAlertController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _alertControllerView];
  [v1 _actionLayoutDirectionChanged];
}

- (void)_reevaluateResolvedStyle
{
  UIAlertControllerStyle v3 = [(UIAlertController *)self preferredStyle];
  int64_t resolvedStyle = self->_resolvedStyle;
  self->_int64_t resolvedStyle = v3;
  if (_UIAppUseModernRotationAndPresentationBehaviors() || [(UIViewController *)self isViewLoaded]) {
    [(UIAlertController *)self _updateModalPresentationStyle];
  }
  if (resolvedStyle != v3)
  {
    [(UIAlertController *)self _resolvedStyleChanged];
  }
}

- (void)_updateProvidedStyleWithTraitCollection:(id)a3
{
  id v4 = a3;
  if (self->_batchActionChangesInProgressCount <= 0)
  {
    id v19 = v4;
    int64_t v5 = [(UIAlertController *)self _resolvedStyle];
    objc_super v6 = [(UIAlertController *)self _currentDescriptor];
    id v7 = [(UIAlertController *)self _styleProvider];
    BOOL v8 = [v7 visualStyleForAlertControllerStyle:v5 traitCollection:v19 descriptor:v6];
    objc_super v9 = (void *)[v8 copy];

    if (v9
      || ([(UIAlertController *)self visualStyleForAlertControllerStyle:v5 traitCollection:v19 descriptor:v6], (objc_super v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v9 setTraitCollection:v19];
      [v9 setDescriptor:v6];
      char v10 = [(UIAlertController *)self _visualStyle];
      char v11 = [v10 isEqual:v9];

      if ((v11 & 1) == 0)
      {
        [(UIAlertController *)self _setVisualStyle:v9];
        [(UIAlertController *)self _updateShouldAlignToKeyboard];
      }
      objc_super v12 = [(UIAlertController *)self _alertControllerView];
      long long v13 = [v12 _visualStyle];
      char v14 = [v13 isEqual:v9];

      if ((v14 & 1) == 0) {
        [v12 _setVisualStyle:v9];
      }
      long long v15 = [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController visualStyle];
      char v16 = [v15 isEqual:v9];

      if ((v16 & 1) == 0) {
        [(UIAlertController *)self _updateTextFieldViewControllerWithVisualStyle:v9];
      }
      v17 = [(UIAlertController *)self _headerContentViewController];
      [v17 _containingAlertControllerDidChangeVisualStyle:v9];

      uint64_t v18 = [(UIAlertController *)self contentViewController];
      [v18 _containingAlertControllerDidChangeVisualStyle:v9];
    }
    id v4 = v19;
  }
}

- (void)_updateProvidedStyle
{
  id v3 = [(UIViewController *)self traitCollection];
  [(UIAlertController *)self _updateProvidedStyleWithTraitCollection:v3];
}

- (id)_currentDescriptor
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(UIAlertControllerDescriptor);
  id v4 = [(UIAlertController *)self _headerContentViewController];
  [(UIAlertControllerDescriptor *)v3 setHasHeaderContentViewController:v4 != 0];

  [(UIAlertControllerDescriptor *)v3 setHasTitle:[(UIAlertController *)self _hasTitle]];
  [(UIAlertControllerDescriptor *)v3 setHasMessage:[(UIAlertController *)self _hasMessage]];
  int64_t v5 = [(UIAlertController *)self contentViewController];
  [(UIAlertControllerDescriptor *)v3 setHasContentViewController:v5 != 0];

  objc_super v6 = [(UIAlertController *)self actions];
  -[UIAlertControllerDescriptor setNumberOfActions:](v3, "setNumberOfActions:", [v6 count]);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(UIAlertController *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 style] == 1)
        {
          char v14 = [(UIAlertController *)self _visualStyle];
          char v15 = [v14 hideCancelAction:v13 inAlertController:self];

          if (v15) {
            continue;
          }
        }
        ++v10;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  [(UIAlertControllerDescriptor *)v3 setNumberOfVisibleActions:v10];
  char v16 = [(UIViewController *)self _existingView];
  v17 = [v16 superview];
  [v17 safeAreaInsets];
  -[UIAlertControllerDescriptor setContainerViewSafeAreaInsets:](v3, "setContainerViewSafeAreaInsets:");

  uint64_t v18 = [(UIViewController *)self _window];
  -[UIAlertControllerDescriptor setApplicationIsFullscreen:](v3, "setApplicationIsFullscreen:", [v18 _windowOwnsInterfaceOrientation]);

  return v3;
}

- (void)_resolvedStyleChanged
{
  [(UIAlertController *)self _updateProvidedStyle];
  [(UIAlertController *)self _updateModalPresentationStyle];
}

- (void)_userInterfaceIdiomChanged
{
  [(UIAlertController *)self _updateProvidedStyle];
  id v3 = [(UIViewController *)self traitCollection];
  BOOL v4 = -[UIAlertController _idiomSupportsBackGesture:](self, "_idiomSupportsBackGesture:", [v3 userInterfaceIdiom]);

  if (v4)
  {
    [(UIAlertController *)self _installBackGestureRecognizer];
  }
  else
  {
    [(UIAlertController *)self _uninstallBackGestureRecognizer];
  }
}

- (BOOL)_idiomSupportsBackGesture:(int64_t)a3
{
  return a3 == 8 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)_buttonTypeForBackGestureForIdiom:(int64_t)a3
{
  if (a3 == 8 || a3 == 2) {
    return 5;
  }
  else {
    return 7;
  }
}

- (void)_installBackGestureRecognizer
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!self->_backButtonDismissGestureRecognizer)
  {
    id v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__dismissFromBackButton_];
    backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
    self->_backButtonDismissGestureRecognizer = v3;

    int64_t v5 = self->_backButtonDismissGestureRecognizer;
    objc_super v6 = NSNumber;
    id v7 = [(UIViewController *)self traitCollection];
    uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", -[UIAlertController _buttonTypeForBackGestureForIdiom:](self, "_buttonTypeForBackGestureForIdiom:", objc_msgSend(v7, "userInterfaceIdiom")));
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(UITapGestureRecognizer *)v5 setAllowedPressTypes:v9];
  }
  uint64_t v10 = [(UIAlertController *)self _alertControllerView];
  [v10 addGestureRecognizer:self->_backButtonDismissGestureRecognizer];
}

- (void)_uninstallBackGestureRecognizer
{
  id v3 = [(UIAlertController *)self _alertControllerView];
  [v3 removeGestureRecognizer:self->_backButtonDismissGestureRecognizer];

  backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
  self->_backButtonDismissGestureRecognizer = 0;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
  [(UIAlertController *)self _reevaluateResolvedStyle];
}

- (UIAlertControllerStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (UIAlertControllerSeverity)severity
{
  return self->_severity;
}

- (void)setSeverity:(UIAlertControllerSeverity)severity
{
  self->_severity = severity;
}

- (BOOL)_shouldProvideDimmingView
{
  return !+[UIAlertController _shouldUsePresentationController];
}

- (BOOL)_shouldDismissOnSizeChange
{
  return [(UIAlertController *)self _resolvedStyle] == 1000
      || [(UIAlertController *)self _resolvedStyle] == 1001;
}

+ (void)registerPlatformStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  id v9 = a3;
  int64_t v5 = (void *)_MergedGlobals_7;
  if (!_MergedGlobals_7)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = (void *)_MergedGlobals_7;
    _MergedGlobals_7 = v6;

    int64_t v5 = (void *)_MergedGlobals_7;
  }
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [v5 setObject:v9 forKey:v8];
}

+ (id)_createTransitioningDelegateForIdiom:(int64_t)a3
{
  id v3 = (void *)_MergedGlobals_7;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [v3 objectForKey:v4];

  if (!v5
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v5 preferredTransitioningDelegate],
        (uint64_t v6 = (_UIAlertControllerTransitioningDelegate *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = objc_alloc_init(_UIAlertControllerTransitioningDelegate);
  }

  return v6;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [v7 userInterfaceIdiom];
  if (v9 == -1)
  {
    uint64_t v10 = +[UITraitCollection _fallbackTraitCollection]();
    unint64_t v9 = [v10 userInterfaceIdiom];
  }
  uint64_t v11 = (void *)_MergedGlobals_7;
  objc_super v12 = [NSNumber numberWithInteger:v9];
  long long v13 = [v11 objectForKey:v12];

  if (v13)
  {
    id v14 = [v13 visualStyleForAlertControllerStyle:a3 traitCollection:v7 descriptor:v8];
    if (v14) {
      goto LABEL_30;
    }
  }
  if (v9 == -1) {
    goto LABEL_15;
  }
  if ((unint64_t)(a3 - 1000) < 2)
  {
LABEL_9:
    if (v9 < 2) {
      goto LABEL_12;
    }
    if (v9 != 3)
    {
      if (v9 == 5)
      {
LABEL_12:
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8) {
          char v15 = off_1E52D3440;
        }
        else {
          char v15 = off_1E52D3430;
        }
        goto LABEL_27;
      }
      goto LABEL_15;
    }
    char v15 = off_1E52D3438;
LABEL_27:
    id v14 = objc_alloc_init(*v15);
    goto LABEL_28;
  }
  if (a3 != 1)
  {
    if (!a3) {
      goto LABEL_9;
    }
LABEL_15:
    id v14 = 0;
    goto LABEL_28;
  }
  id v14 = 0;
  if (v9 > 8) {
    goto LABEL_28;
  }
  if (((1 << v9) & 0x23) != 0)
  {
    char v15 = off_1E52D3448;
    goto LABEL_27;
  }
  if (((1 << v9) & 0x104) != 0)
  {
    if dyld_program_sdk_at_least() && (_os_feature_enabled_impl()) {
      char v15 = off_1E52D3458;
    }
    else {
      char v15 = off_1E52D3460;
    }
    goto LABEL_27;
  }
  if (v9 == 3)
  {
    char v15 = off_1E52D3450;
    goto LABEL_27;
  }
LABEL_28:
  if (os_variant_has_internal_diagnostics())
  {
    if (v14) {
      goto LABEL_30;
    }
    v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v19 = 134217984;
      unint64_t v20 = v9;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "No visual style provided for idiom %ld", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    if (v14) {
      goto LABEL_30;
    }
    uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D498) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134217984;
      unint64_t v20 = v9;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "No visual style provided for idiom %ld", (uint8_t *)&v19, 0xCu);
    }
  }
  id v14 = 0;
LABEL_30:

  return v14;
}

- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)_MergedGlobals_7;
  id v7 = [NSNumber numberWithInteger:a4];
  id v8 = [v6 objectForKey:v7];

  if (!v8
    || ([v8 platformStyleViewForAlertController:v5 inIdiom:a4],
        (unint64_t v9 = (_UIAlertControllerPhoneTVMacView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v9 = objc_alloc_init(_UIAlertControllerPhoneTVMacView);
  }

  return v9;
}

- (void)_dismissWithAction:(id)a3 dismissCompletion:(id)a4
{
}

- (void)_dismissWithAction:(id)a3
{
}

- (void)_invokeHandlersForAction:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 handler];

  if (v4)
  {
    id v5 = [v8 handler];
    ((void (**)(void, id))v5)[2](v5, v8);
  }
  uint64_t v6 = [v8 simpleHandler];

  if (v6)
  {
    id v7 = [v8 simpleHandler];
    v7[2]();
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  [(NSPointerArray *)self->_actionsWithInvokedHandlers addPointer:v8];
LABEL_7:
}

- (void)_clearActionHandlers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_actions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setHandler:", 0, (void)v8);
        [v7 setSimpleHandler:0];
        [v7 setShouldDismissHandler:0];
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_dismissGestureRecognizer
{
  id v2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__attemptAnimatedDismissWithGestureRecognizer_];
  return v2;
}

- (BOOL)_canDismissWithGestureRecognizer
{
  int64_t v2 = [(UIAlertController *)self _resolvedStyle];
  return (unint64_t)(v2 - 1000) < 2 || v2 == 0;
}

- (void)_attemptAnimatedDismissWithGestureRecognizer:(id)a3
{
  if ([a3 state] == 3
    && [(UIAlertController *)self _canDismissWithGestureRecognizer])
  {
    [(UIAlertController *)self _dismissWithCancelOrEmptyAction];
  }
}

- (void)_dismissFromBackButton:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UIAlertController *)self _dismissWithCancelOrEmptyAction];
  }
}

- (void)_dismissWithCancelOrEmptyAction
{
  if ([(UIAlertController *)self _shouldInvokeCancelActionOnDimmingViewTap]) {
    [(UIAlertController *)self cancelAction];
  }
  else {
  id v3 = +[UIAlertAction actionWithTitle:&stru_1ED0E84C0 style:0 handler:0];
  }
  [(UIAlertController *)self _dismissAnimated:1 triggeringAction:v3];
}

- (void)_dismissFromPopoverDimmingView
{
  id v3 = [(UIAlertController *)self cancelAction];
  [(UIAlertController *)self _dismissAnimated:1 triggeringAction:v3 triggeredByPopoverDimmingView:1 dismissCompletion:0];
}

- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4
{
}

- (void)_beginNoPresentingViewControllerPresentation:(id)a3
{
  id v4 = a3;
  presenter = self->_presenter;
  id v8 = v4;
  if (!presenter)
  {
    uint64_t v6 = objc_alloc_init(_UIAlertControllerShimPresenter);
    id v7 = self->_presenter;
    self->_presenter = v6;

    [(_UIAlertControllerShimPresenter *)self->_presenter setAlertController:self];
    id v4 = v8;
    presenter = self->_presenter;
  }
  [(_UIAlertControllerShimPresenter *)presenter _presentAlertControllerAnimated:1 hostingScene:v4 completion:0];
}

- (void)_endNoPresentingViewControllerPresentation
{
}

- (void)_dismissAnimated:(BOOL)a3 triggeringAction:(id)a4 triggeredByPopoverDimmingView:(BOOL)a5 dismissCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v12 = v10;
  id v41 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  if (v7)
  {
    id v14 = self;
    goto LABEL_3;
  }
  if (v12)
  {
    uint64_t v21 = [v12 shouldDismissHandler];
    if (!v21
      || (long long v22 = (void *)v21,
          [v12 shouldDismissHandler],
          long long v23 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          char v24 = v23[2](),
          v23,
          v22,
          (v24 & 1) != 0))
    {
      uint64_t v25 = self;
      v26 = [(UIViewController *)v25 _parentModalViewController];

      if (v26)
      {
        objc_super v27 = [(UIViewController *)v25 popoverPresentationController];
        v28 = [v27 delegate];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v28 delegate],
              v29 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v29,
              (isKindOfClass & 1) != 0))
        {
          char v15 = &__block_literal_global_657;
        }
        else
        {
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __manualPopoverPresentationControllerDidDismissPopoverInvocationForDismiss_block_invoke_2;
          v42[3] = &unk_1E52D9F70;
          id v43 = v27;
          char v15 = _Block_copy(v42);
        }
        goto LABEL_4;
      }
LABEL_3:
      char v15 = &__block_literal_global_657;
LABEL_4:
      char v16 = _Block_copy(v15);

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_2;
      v36[3] = &unk_1E52DB220;
      id v17 = v13;
      id v37 = v17;
      id v38 = v16;
      id v39 = v11;
      id v18 = v16;
      int v19 = _Block_copy(v36);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_3;
      v31[3] = &unk_1E52DB248;
      BOOL v34 = v7;
      BOOL v35 = a3;
      v31[4] = self;
      id v33 = v19;
      id v32 = v12;
      id v20 = v19;
      [(UIAlertController *)self _performAction:v32 invokeActionBlock:v17 dismissAndPerformActionIfNotAlreadyPerformed:v31];

      goto LABEL_16;
    }
    [(UIAlertController *)self _performAction:v12 invokeActionBlock:v13 dismissAndPerformActionIfNotAlreadyPerformed:0];
  }
  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  self->_actionInvokedOnDismiss = 0;
LABEL_16:
}

uint64_t __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 1144))
  {
    *(unsigned char *)(v1 + 1144) = 1;
    return [*(id *)(result + 32) _invokeHandlersForAction:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t result = a1[6];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __103__UIAlertController__dismissAnimated_triggeringAction_triggeredByPopoverDimmingView_dismissCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(a1 + 32) presentingViewController];
  if (v3 && !*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _postWillBeginSystemProvidedDismissalOfAlertController];
    [v3 dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 57) completion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _postDidBeginSystemProvidedDismissalOfAlertController];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _compatibilityPopoverController];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _compatibilityPopoverController];
      [v5 dismissPopoverAnimated:*(unsigned __int8 *)(a1 + 57)];

LABEL_6:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
    if (os_variant_has_internal_diagnostics())
    {
      char v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3B8];
      BOOL v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      long long v9 = [v7 view];
      id v10 = [*(id *)(a1 + 32) view];
      id v11 = [v10 window];
      uint64_t v12 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      if (*(unsigned char *)(v12 + 1144)) {
        id v14 = @"YES";
      }
      else {
        id v14 = @"NO";
      }
      char v15 = [*(id *)(v12 + 1120) allObjects];
      [v16 raise:v6, @"Attempt to dismiss %@ with unknown presenter, action will not be performed.\nDebug Info: \n\taction = %@, \n\tpresentingViewController = %@, view = %@, window = %@, \n\ttriggeredByPopoverDimmingView = %@, \n\tlocal.performActionInvoked = %@, \n\t_actionsWithInvokedHandlers = %@", v7, v8, v3, v9, v11, v13, v14, v15 format];
    }
  }
LABEL_9:
  if (v17) {
    v17[2]();
  }
}

- (void)_performAction:(id)a3 invokeActionBlock:(id)a4 dismissAndPerformActionIfNotAlreadyPerformed:(id)a5
{
  id v10 = (void (**)(void))a4;
  BOOL v7 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatedActionPerformingDelegate);
  long long v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _performActionForAlertController:self invokeActionBlock:v10 dismissControllerBlock:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
  else if (v10)
  {
    v10[2]();
  }
}

- (void)_postWillBeginSystemProvidedDismissalOfAlertController
{
  id v3 = [(UIAlertController *)self _systemProvidedPresentationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _willBeginSystemProvidedDismissalOfAlertController:self];
  }
}

- (void)_postDidBeginSystemProvidedDismissalOfAlertController
{
  id v3 = [(UIAlertController *)self _systemProvidedPresentationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _didBeginSystemProvidedDismissalOfAlertController:self];
  }
}

- (id)linkedAlertControllers
{
  return 0;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[UIAlertController _shouldUsePresentationController])
  {
    BOOL v11 = [(UIAlertController *)self _viewControllerIsPresentedInModalPresentationContext:v10];
    int64_t v12 = [(UIAlertController *)self _resolvedStyle];
    uint64_t v13 = (void *)_MergedGlobals_7;
    id v14 = NSNumber;
    char v15 = [v10 traitCollection];
    char v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "userInterfaceIdiom"));
    id v17 = [v13 objectForKey:v16];

    if (objc_opt_respondsToSelector())
    {
      id v18 = [v17 platformStylePresentationControllerForPresentedController:v8 presentingController:v9 sourceController:v10 style:v12];
      if (v18)
      {
        int v19 = v18;

        goto LABEL_27;
      }
    }
    if ((unint64_t)(v12 - 1000) < 2) {
      goto LABEL_9;
    }
    if (v12 == 1)
    {
      id v20 = [(_UIAlertControllerPresentationController *)[_UIAlertControllerAlertPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
    }
    else
    {
      if (!v12)
      {
LABEL_9:
        uint64_t v21 = +[UIDevice currentDevice];
        uint64_t v22 = [v21 userInterfaceIdiom];

        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          BOOL v23 = 1;
        }
        else
        {
          char v24 = [v10 traitCollection];
          if ([v24 userInterfaceIdiom] == 1)
          {
            BOOL v23 = 1;
          }
          else
          {
            uint64_t v25 = [v9 traitCollection];
            BOOL v23 = [v25 userInterfaceIdiom] == 1;
          }
        }
        if (!v23 || v11)
        {
          v26 = [(_UIAlertControllerPresentationController *)[_UIAlertControllerActionSheetCompactPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v10];
          id v20 = (_UIAlertControllerAlertPresentationController *)v26;
          if (v11) {
            [(_UIAlertControllerPresentationController *)v26 _setIsCurrentContext:1];
          }
          if ([v10 _ancestorViewControllerIsInPopover]) {
            [(_UIAlertControllerPresentationController *)v20 _setShouldRespectNearestCurrentContextPresenter:1];
          }
        }
        else
        {
          id v20 = [(UIPopoverPresentationController *)[_UIAlertControllerActionSheetRegularPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
          if (dyld_program_sdk_at_least() && _UIIsPrivateMainBundle())
          {
            [(_UIAlertControllerAlertPresentationController *)v20 _setCentersPopoverIfSourceViewNotSet:1];
            [(_UIAlertControllerAlertPresentationController *)v20 _setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:1];
          }
        }
        goto LABEL_25;
      }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unknown style %ld when trying to generate a presentation controller to present %@", v12, self format];
      id v20 = 0;
    }
LABEL_25:

    goto LABEL_26;
  }
  id v20 = 0;
LABEL_26:
  int v19 = v20;
LABEL_27:

  return v19;
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)_updateModalPresentationStyle
{
  int64_t v3 = [(UIAlertController *)self _modalPresentationStyleForResolvedStyle];
  [(UIAlertController *)self setModalPresentationStyle:v3];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIAlertController;
  [(UIViewController *)&v3 setModalPresentationStyle:[(UIAlertController *)self _modalPresentationStyleForResolvedStyle]];
}

- (int64_t)_modalPresentationStyleForResolvedStyle
{
  if ([(UIAlertController *)self _resolvedStyle]) {
    return 4;
  }
  int64_t v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 4;
  }
  if (_UIAppUseModernRotationAndPresentationBehaviors()) {
    return 7;
  }
  return 18;
}

- (void)_updateViewFrameForLandscapePresentationInShimIfNecessary
{
  memset(&v20, 0, sizeof(v20));
  uint64_t v3 = [(UIViewController *)self view];
  id v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }

  uint64_t v5 = [(UIViewController *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGAffineTransformMakeRotation(&v18, 1.57079633);
  *(float64x2_t *)&v18.a = vrndaq_f64(*(float64x2_t *)&v18.a);
  *(float64x2_t *)&v18.c = vrndaq_f64(*(float64x2_t *)&v18.c);
  *(float64x2_t *)&v18.tx = vrndaq_f64(*(float64x2_t *)&v18.tx);
  CGAffineTransform t2 = v18;
  CGAffineTransform t1 = v20;
  if (CGAffineTransformEqualToTransform(&t1, &t2)
    || (CGAffineTransformMakeRotation(&v15, -1.57079633),
        *(float64x2_t *)&v15.a = vrndaq_f64(*(float64x2_t *)&v15.a),
        *(float64x2_t *)&v15.c = vrndaq_f64(*(float64x2_t *)&v15.c),
        *(float64x2_t *)&v15.tx = vrndaq_f64(*(float64x2_t *)&v15.tx),
        CGAffineTransform v16 = v15,
        CGAffineTransform t1 = v20,
        CGAffineTransformEqualToTransform(&t1, &v16)))
  {
    if (v11 > v13)
    {
      id v14 = [(UIViewController *)self view];
      objc_msgSend(v14, "setFrame:", v7, v9, v13, v11);

      [(UIAlertController *)self set_shouldFlipFrameForShimDismissal:1];
    }
  }
}

- (void)_flipFrameForShimDismissalIfNecessary
{
  if ([(UIAlertController *)self _shouldFlipFrameForShimDismissal])
  {
    uint64_t v3 = [(UIViewController *)self view];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(UIViewController *)self view];
    objc_msgSend(v12, "setFrame:", v5, v7, v11, v9);

    [(UIAlertController *)self set_shouldFlipFrameForShimDismissal:0];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIAlertController;
  [(UIViewController *)&v10 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__UIAlertController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E52DB270;
    v8[4] = self;
    id v9 = v6;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
  else
  {
    [(UIAlertController *)self _updateProvidedStyleWithTraitCollection:v6];
  }
}

uint64_t __79__UIAlertController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProvidedStyleWithTraitCollection:*(void *)(a1 + 40)];
}

- (BOOL)_isPresentedAsPopover
{
  uint64_t v3 = [(UIAlertController *)self _alertControllerContainer];
  if (+[UIAlertController _shouldUsePresentationController])
  {
    double v4 = [v3 _existingPresentationControllerImmediate:1 effective:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    id v6 = [(UIViewController *)self _popoverController];
    double v4 = v6;
    if (v6)
    {
      id v7 = [v6 contentViewController];
      char isKindOfClass = v7 == v3;
    }
    else
    {
      char isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)_allowsShowingDimmingView
{
  return 1;
}

- (BOOL)_viewControllerIsPresentedInModalPresentationContext:(id)a3
{
  id v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    char v4 = 0;
  }
  else if ([v3 _isInPopoverPresentation])
  {
    char v4 = 1;
  }
  else
  {
    double v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || !dyld_program_sdk_at_least()
      || (char v4 = 1,
          ([v3 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:1] & 1) == 0))
    {
      char v4 = [v3 _ancestorViewControllerIsInPopover];
    }
  }

  return v4;
}

- (id)_alertControllerContainer
{
  id v3 = [(UIViewController *)self parentViewController];
  if ([(UIAlertController *)v3 conformsToProtocol:&unk_1ED466988]) {
    char v4 = v3;
  }
  else {
    char v4 = self;
  }
  double v5 = v4;

  return v5;
}

- (BOOL)_shouldSizeToFillSuperview
{
  if (!+[UIAlertController _shouldUsePresentationController])
  {
    id v3 = [(UIAlertController *)self _alertControllerView];
    int v4 = [v3 presentedAsPopover];

    if (!v4) {
      return 1;
    }
  }
  return [(UIAlertController *)self _isPresentedAsPopover];
}

- (BOOL)_shouldFitWidthToContentViewControllerWidth
{
  if (![(UIAlertController *)self _isPresentedAsPopover]) {
    return 0;
  }
  id v3 = [(UIAlertController *)self contentViewController];
  [v3 preferredContentSize];
  BOOL v5 = v4 > 0.0;

  return v5;
}

- (void)setTitle:(NSString *)title
{
  v6.receiver = self;
  v6.super_class = (Class)UIAlertController;
  double v4 = title;
  [(UIViewController *)&v6 setTitle:v4];
  BOOL v5 = [(UIAlertController *)self _alertControllerView];
  [v5 _setTitle:v4];
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(NSString *)message
{
  id v7 = message;
  if (([(NSString *)v7 isEqual:self->_message] & 1) == 0)
  {
    double v4 = (NSString *)[(NSString *)v7 copy];
    BOOL v5 = self->_message;
    self->_message = v4;

    objc_super v6 = [(UIAlertController *)self _alertControllerView];
    [v6 _setMessage:v7];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSAttributedString)_attributedTitle
{
  return self->_attributedTitle;
}

- (void)_setAttributedTitle:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_attributedTitle] & 1) == 0)
  {
    double v4 = (NSAttributedString *)[v7 copy];
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    objc_super v6 = [(UIAlertController *)self _alertControllerView];
    [v6 _setAttributedTitle:v7];
  }
}

- (void)_setTitleMaximumLineCount:(int64_t)a3
{
  if (self->_titleMaximumLineCount != a3)
  {
    self->_titleMaximumLineCount = a3;
    id v3 = [(UIAlertController *)self _alertControllerView];
    [v3 _updateLabelProperties];
  }
}

- (void)_setTitleLineBreakMode:(int64_t)a3
{
  if (self->_titleLineBreakMode != a3)
  {
    self->_titleLineBreakMode = a3;
    id v3 = [(UIAlertController *)self _alertControllerView];
    [v3 _updateLabelProperties];
  }
}

- (NSAttributedString)_attributedMessage
{
  return self->_attributedMessage;
}

- (void)_setAttributedMessage:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_attributedMessage] & 1) == 0)
  {
    double v4 = (NSAttributedString *)[v7 copy];
    attributedMessage = self->_attributedMessage;
    self->_attributedMessage = v4;

    objc_super v6 = [(UIAlertController *)self _alertControllerView];
    [v6 _setAttributedMessage:v7];
  }
}

- (NSAttributedString)_attributedDetailMessage
{
  return self->_attributedDetailMessage;
}

- (void)_setAttributedDetailMessage:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_attributedDetailMessage] & 1) == 0)
  {
    double v4 = (NSAttributedString *)[v7 copy];
    attributedDetailMessage = self->_attributedDetailMessage;
    self->_attributedDetailMessage = v4;

    objc_super v6 = [(UIAlertController *)self _alertControllerView];
    [v6 _setAttributedDetailMessage:v7];
  }
}

- (BOOL)_hasTitle
{
  id v3 = [(UIViewController *)self title];

  if (![(UIAlertController *)self _shouldTreatEmptyStringsAsNil])
  {
    if (!v3) {
      goto LABEL_4;
    }
    return 1;
  }
  if (v3)
  {
    double v4 = [(UIViewController *)self title];
    uint64_t v5 = [v4 length];

    if (v5) {
      return 1;
    }
  }
LABEL_4:
  return [(UIAlertController *)self _hasAttributedTitle];
}

- (BOOL)_hasAttributedTitle
{
  id v3 = [(UIAlertController *)self _attributedTitle];

  int v4 = ![(UIAlertController *)self _shouldTreatEmptyStringsAsNil];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if ((v4 & 1) == 0 && v3)
  {
    objc_super v6 = [(UIAlertController *)self _attributedTitle];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)_hasMessage
{
  id v3 = [(UIAlertController *)self message];

  if (![(UIAlertController *)self _shouldTreatEmptyStringsAsNil])
  {
    if (!v3) {
      goto LABEL_4;
    }
    return 1;
  }
  if (v3)
  {
    int v4 = [(UIAlertController *)self message];
    uint64_t v5 = [v4 length];

    if (v5) {
      return 1;
    }
  }
LABEL_4:
  return [(UIAlertController *)self _hasAttributedMessage];
}

- (BOOL)_hasAttributedMessage
{
  id v3 = [(UIAlertController *)self _attributedMessage];

  int v4 = ![(UIAlertController *)self _shouldTreatEmptyStringsAsNil];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if ((v4 & 1) == 0 && v3)
  {
    objc_super v6 = [(UIAlertController *)self _attributedMessage];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)_hasDetailMessage
{
  id v3 = [(UIAlertController *)self _attributedDetailMessage];

  int v4 = ![(UIAlertController *)self _shouldTreatEmptyStringsAsNil];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if ((v4 & 1) == 0 && v3)
  {
    objc_super v6 = [(UIAlertController *)self _attributedDetailMessage];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)_shouldTreatEmptyStringsAsNil
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)setCancelAction:(id)a3
{
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (UIAlertAction)_focusedAction
{
  int64_t v2 = [(UIAlertController *)self _alertControllerView];
  id v3 = [v2 _focusedAction];

  return (UIAlertAction *)v3;
}

- (UIView)_foregroundView
{
  int64_t v2 = [(UIAlertController *)self _alertControllerView];
  id v3 = [v2 _contentView];

  return (UIView *)v3;
}

- (UIView)_dimmingView
{
  if ([(UIAlertController *)self _shouldProvideDimmingView])
  {
    id v3 = [(UIAlertController *)self _alertControllerView];
LABEL_4:
    int v4 = [v3 _dimmingView];
    goto LABEL_6;
  }
  id v3 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  int v4 = 0;
LABEL_6:

  return (UIView *)v4;
}

- (UIEdgeInsets)_contentInsets
{
  id v3 = [(UIAlertController *)self _alertControllerView];
  int v4 = [v3 _visualStyle];
  BOOL v5 = [(UIViewController *)self _existingView];
  objc_super v6 = [v5 superview];
  [v4 contentInsetsForContainerView:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_setSeparatedHeaderContentViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_separatedHeaderContentViewController != v5)
  {
    double v11 = v5;
    objc_super v6 = [(UIAlertController *)self _separatedHeaderContentViewController];
    [v6 removeFromParentViewController];
    double v7 = [(UIAlertController *)self _alertControllerView];
    if ([v7 conformsToProtocol:&unk_1ED547688]) {
      [v7 _removeSeparatedHeaderContentViewControllerFromHierarchy];
    }
    objc_storeStrong((id *)&self->_separatedHeaderContentViewController, a3);
    double v8 = v11;
    if (v11)
    {
      double v9 = [(UIViewController *)v11 view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(UIViewController *)self addChildViewController:v11];
      [(UIViewController *)v11 didMoveToParentViewController:self];
      double v8 = v11;
      if (v7)
      {
        int v10 = [v7 conformsToProtocol:&unk_1ED547688];
        double v8 = v11;
        if (v10)
        {
          [v7 _addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary];
          double v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      [v7 _propertiesChanged];
      [(UIAlertController *)self _updateProvidedStyle];
    }

    BOOL v5 = v11;
  }
}

- (void)_setHeaderContentViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_headerContentViewController != v5)
  {
    double v11 = v5;
    objc_super v6 = [(UIAlertController *)self _headerContentViewController];
    [v6 removeFromParentViewController];
    double v7 = [(UIAlertController *)self _alertControllerView];
    if ([v7 conformsToProtocol:&unk_1ED547688]) {
      [v7 _removeHeaderContentViewControllerViewFromHierarchy];
    }
    objc_storeStrong((id *)&self->_headerContentViewController, a3);
    double v8 = v11;
    if (v11)
    {
      double v9 = [(UIViewController *)v11 view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(UIViewController *)self addChildViewController:v11];
      [(UIViewController *)v11 didMoveToParentViewController:self];
      double v8 = v11;
      if (v7)
      {
        int v10 = [v7 conformsToProtocol:&unk_1ED547688];
        double v8 = v11;
        if (v10)
        {
          [v7 _addHeaderContentViewControllerToViewHierarchyIfNecessary];
          double v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      [v7 _propertiesChanged];
      [(UIAlertController *)self _updateProvidedStyle];
    }

    BOOL v5 = v11;
  }
}

- (void)setContentViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_contentViewController != v5)
  {
    double v11 = v5;
    objc_super v6 = [(UIAlertController *)self contentViewController];
    [v6 removeFromParentViewController];
    double v7 = [(UIAlertController *)self _alertControllerView];
    if ([v7 conformsToProtocol:&unk_1ED547778]) {
      [v7 _removeContentViewControllerViewFromHierarchy];
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    double v8 = v11;
    if (v11)
    {
      double v9 = [(UIViewController *)v11 view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(UIViewController *)self addChildViewController:v11];
      [(UIViewController *)v11 didMoveToParentViewController:self];
      double v8 = v11;
      if (v7)
      {
        int v10 = [v7 conformsToProtocol:&unk_1ED547778];
        double v8 = v11;
        if (v10)
        {
          [v7 _addContentViewControllerToViewHierarchyIfNecessary];
          double v8 = v11;
        }
      }
    }
    if ((v8 != 0) == (v6 == 0))
    {
      [v7 _propertiesChanged];
      [(UIAlertController *)self _updateProvidedStyle];
    }

    BOOL v5 = v11;
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v12 = a3;
  int v4 = [(UIAlertController *)self _alertControllerView];
  int v5 = [v4 conformsToProtocol:&unk_1ED547778];

  if (v5)
  {
    objc_super v6 = [(UIAlertController *)self _alertControllerView];
    id v7 = [(UIAlertController *)self contentViewController];

    if (v7 == v12) {
      [v6 _sizeOfContentViewControllerChanged];
    }
  }
  double v8 = [(UIAlertController *)self _alertControllerView];
  int v9 = [v8 conformsToProtocol:&unk_1ED547688];

  if (v9)
  {
    int v10 = [(UIAlertController *)self _alertControllerView];
    id v11 = [(UIAlertController *)self _headerContentViewController];

    if (v11 == v12) {
      [v10 _sizeOfHeaderContentViewControllerChanged];
    }
    else {
      [v10 _sizeOfTextFieldViewControllerChanged];
    }
    [(UIAlertController *)self _recomputePreferredContentSize];
  }
}

- (void)_headerContentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(UIAlertController *)self _headerContentViewController];
  -[UIAlertController _childViewController:willTransitionToSize:withAnimations:](self, "_childViewController:willTransitionToSize:withAnimations:", v8, v7, width, height);
}

- (void)_contentViewControllerWillTransitionToSize:(CGSize)a3 withAnimations:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(UIAlertController *)self contentViewController];
  -[UIAlertController _childViewController:willTransitionToSize:withAnimations:](self, "_childViewController:willTransitionToSize:withAnimations:", v8, v7, width, height);
}

- (void)_childViewController:(id)a3 willTransitionToSize:(CGSize)a4 withAnimations:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  int v10 = (void (**)(void))a5;
  if (![(UIViewController *)self isBeingPresented]
    && ![(UIViewController *)self isBeingDismissed])
  {
    double v14 = objc_alloc_init(_UIAnimationCoordinator);
    double v15 = [(UIAlertController *)self _alertControllerView];
    id v16 = v9;
    [(_UIAnimationCoordinator *)v14 setDuration:0.35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_2;
    v33[3] = &__block_descriptor_48_e33_v16__0___UIAnimationCoordinator_8l;
    *(CGFloat *)&v33[4] = width;
    *(CGFloat *)&v33[5] = height;
    [(_UIAnimationCoordinator *)v14 setPreperation:v33];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_3;
    v30[3] = &unk_1E52DB2E0;
    id v32 = v10;
    id v17 = v15;
    id v31 = v17;
    [(_UIAnimationCoordinator *)v14 setAnimator:v30];
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_4;
    v27[3] = &unk_1E52DB308;
    objc_copyWeak(&v28, &location);
    [(_UIAnimationCoordinator *)v14 setCompletion:v27];
    [(_UIAnimationCoordinator *)v14 setContainerView:v17];
    [(_UIAnimationCoordinator *)v14 setViewController:v16];
    double v18 = [v16 view];
    [v18 frame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    -[_UIAnimationCoordinator setStartFrame:](v14, "setStartFrame:", v20, v22, v24, v26);
    -[_UIAnimationCoordinator setEndFrame:](v14, "setEndFrame:", v20, v22, v24, v26);
    [(UIAlertController *)self setTemporaryAnimationCoordinator:v14];
    [(_UIAnimationCoordinator *)v14 animate];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
  id v11 = [(UIViewController *)self transitionCoordinator];

  if (!v11) {
    goto LABEL_5;
  }
  id v12 = [(UIViewController *)self transitionCoordinator];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke;
  v34[3] = &unk_1E52DB298;
  BOOL v35 = v10;
  char v13 = [v12 animateAlongsideTransition:v34 completion:0];

  if ((v13 & 1) == 0)
  {
LABEL_5:
    v10[2](v10);
    double v14 = [(UIAlertController *)self _alertControllerView];
    [(_UIAnimationCoordinator *)v14 layoutIfNeeded];
LABEL_7:
  }
}

uint64_t __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 viewController];
  int v4 = [v3 transitionContext];

  int v5 = [v4 _transitionCoordinator];
  objc_msgSend(v6, "viewWillTransitionToSize:withTransitionCoordinator:", v5, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = [*(id *)(a1 + 32) conformsToProtocol:&unk_1ED547688];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _layoutAndPositionInParentIfNeeded];
  }
  return result;
}

void __78__UIAlertController__childViewController_willTransitionToSize_withAnimations___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTemporaryAnimationCoordinator:0];
}

+ (id)_alertControllerContainedInViewController:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1ED466988] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"UIAlertController.m" lineNumber:2182 description:@"A view controller not containing an alert controller was asked for its contained alert controller."];
  }
  id v6 = [v5 _containedAlertController];

  return v6;
}

- (BOOL)_hasContentToDisplay
{
  int64_t v2 = self;
  uint64_t v3 = [(UIViewController *)v2 title];
  if (v3) {
    goto LABEL_2;
  }
  id v6 = [(UIAlertController *)v2 _attributedTitle];

  if (v6) {
    return 1;
  }
  id v8 = v2;
  uint64_t v3 = [(UIAlertController *)v8 message];
  if (v3)
  {
LABEL_2:
    int v4 = (void *)v3;
    goto LABEL_3;
  }
  id v9 = [(UIAlertController *)v8 _attributedMessage];

  if (v9) {
    return 1;
  }
  int v10 = v8;
  int v4 = [(UIAlertController *)v10 _headerContentViewController];
  if (!v4)
  {
    id v11 = [(UIAlertController *)v10 contentViewController];
    if (v11)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v12 = [(UIAlertController *)v10 _actions];
      BOOL v5 = [v12 count] != 0;
    }
    goto LABEL_4;
  }
LABEL_3:
  BOOL v5 = 1;
LABEL_4:

  return v5;
}

- (void)_updateTextFieldViewControllerWithVisualStyle:(id)a3
{
}

- (void)_removeAllTextFields
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(UIViewController *)self _window];
  id v7 = [v6 windowScene];
  id v8 = [v7 _alertControllerStackManager];
  objc_storeWeak((id *)&self->_alertControllerStackManager, v8);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  [WeakRetained _alertControllerWillAppear:self];

  [(UIAlertController *)self _preserveInputViewsAnimated:v3];
  [(UIAlertController *)self _becomeFirstResponderIfAppropriate];
  [(UIAlertController *)self _addReturnKeyCommandIfAppropriate];
  int v10 = [(UIViewController *)self transitionCoordinator];
  id v11 = v10;
  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__UIAlertController_viewWillAppear___block_invoke;
    v17[3] = &unk_1E52DB270;
    v17[4] = self;
    id v18 = v10;
    [v18 animateAlongsideTransition:v17 completion:0];
  }
  else
  {
    id v12 = [(UIAlertController *)self _alertControllerView];
    [v12 configureForPresentAlongsideTransitionCoordinator:0];
  }
  v16.receiver = self;
  v16.super_class = (Class)UIAlertController;
  [(UIViewController *)&v16 viewWillAppear:v3];
  if (![(UIAlertController *)self _shouldAllowNilParameters]
    && ![(UIAlertController *)self _hasContentToDisplay])
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIAlertController.m", 2253, @"UIAlertController must have a title, a message or an action to display" object file lineNumber description];
  }
  self->_actionInvokedOnDismiss = 0;
  if (!+[UIAlertController _shouldUsePresentationController]&& ![(UIAlertController *)self _isPresentedAsPopover])
  {
    char v13 = [(UIAlertController *)self _alertControllerView];
    [v13 setShouldHaveBackdropView:1];

    double v14 = [(UIAlertController *)self _alertControllerView];
    [v14 setHasDimmingView:1];
  }
  if ([(UIViewController *)self isBeingPresented]) {
    [(UIAlertController *)self _logBeingPresented];
  }
}

void __36__UIAlertController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _alertControllerView];
  [v2 configureForPresentAlongsideTransitionCoordinator:*(void *)(a1 + 40)];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  [WeakRetained _alertControllerDidAppear:self];

  id v6 = [(UIAlertController *)self _alertControllerView];
  id v7 = [(UIAlertController *)self _systemProvidedGestureRecognizer];
  [v6 beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:v7];

  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  [(UIViewController *)&v8 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  [WeakRetained _alertControllerWillDisappear:self];

  [(_UIAlertControllerTextFieldViewController *)self->_textFieldViewController resignFirstResponder];
  if (v3) {
    [(UIAlertController *)self _restoreInputViewsAnimated:1];
  }
  id v6 = [(UIAlertController *)self _alertControllerView];
  id v7 = [(UIViewController *)self transitionCoordinator];
  [v6 configureForDismissAlongsideTransitionCoordinator:v7];

  v8.receiver = self;
  v8.super_class = (Class)UIAlertController;
  [(UIViewController *)&v8 viewWillDisappear:v3];
  if ([(UIViewController *)self isBeingDismissed]) {
    [(UIAlertController *)self _logBeingDismissed];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertControllerStackManager);
  [WeakRetained _alertControllerDidDisappear:self];

  if (!v3) {
    [(UIAlertController *)self _restoreInputViewsAnimated:0];
  }
  id v6 = [(UIAlertController *)self _alertControllerView];
  [v6 deselectAllActions];

  v7.receiver = self;
  v7.super_class = (Class)UIAlertController;
  [(UIViewController *)&v7 viewDidDisappear:v3];
}

- (BOOL)_shouldPreserveInputViews
{
  if ([(UIAlertController *)self _shouldBecomeFirstResponder])
  {
    if (+[UIAlertController _shouldUsePresentationController])
    {
      BOOL v3 = [(UIViewController *)self _window];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v4 = [(UIViewController *)self presentationController];
        int v5 = [v4 _preserveResponderAcrossWindows] ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_preserveInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIAlertController *)self _hasPreservedInputViews]
    && [(UIAlertController *)self _shouldPreserveInputViews])
  {
    [(UIAlertController *)self _setHasPreservedInputViews:1];
    id v8 = [(UIViewController *)self _window];
    int v5 = [v8 windowScene];
    id v6 = [v5 keyboardSceneDelegate];
    objc_super v7 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _preserveInputViewsWithId:v7 animated:v3];
  }
}

- (void)_restoreInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIAlertController *)self _hasPreservedInputViews])
  {
    int v5 = [(UIViewController *)self _window];
    id v6 = [v5 windowScene];
    objc_super v7 = [v6 keyboardSceneDelegate];
    id v8 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v7 _restoreInputViewsWithId:v8 animated:v3];

    [(UIAlertController *)self _setHasPreservedInputViews:0];
  }
}

- (BOOL)_shouldBecomeFirstResponder
{
  BOOL v3 = [(UIAlertController *)self _resolvedStyle];
  int v4 = v3;
  if (v3 == (void *)1000 || v3 == (void *)1)
  {
    BOOL v3 = [(UIViewController *)self _focusSystem];
    BOOL v5 = v3 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (v4 == (void *)1000 || v4 == (void *)1) {

  }
  return v5;
}

- (void)_becomeFirstResponderIfAppropriate
{
  if ([(UIAlertController *)self _shouldBecomeFirstResponder])
  {
    [(UIResponder *)self becomeFirstResponder];
  }
}

- (void)_setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    BOOL v3 = a3;
    self->_hidden = a3;
    BOOL v5 = [(UIViewController *)self view];
    [v5 setHidden:self->_hidden];

    if (+[UIAlertController _shouldUsePresentationController])
    {
      id v6 = [(UIViewController *)self presentationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 _setChromeHidden:v3];
      }
    }
  }
}

- (void)_setEffectAlpha:(double)a3
{
  id v4 = [(UIAlertController *)self _alertControllerView];
  [v4 setEffectAlpha:a3];
}

- (double)_effectAlpha
{
  id v2 = [(UIAlertController *)self _alertControllerView];
  [v2 effectAlpha];
  double v4 = v3;

  return v4;
}

- (void)setSpringLoaded:(BOOL)a3
{
  if (self->_springLoaded != a3)
  {
    self->_springLoaded = a3;
    id v4 = [(UIAlertController *)self _alertControllerView];
    if ([v4 conformsToProtocol:&unk_1ED44FE38]) {
      [v4 setSpringLoaded:self->_springLoaded];
    }
  }
}

- (id)_setView:(id)a3 forSystemProvidedPresentationWithDelegate:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIAlertController *)self _systemProvidedPresentationView];
  id v9 = (void *)v8;
  if ((id)v8 != v6)
  {
    if (v8)
    {
      int v10 = [(UIAlertController *)self _previewInteractionController];
      id v11 = [v10 gestureRecognizers];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            [v9 removeGestureRecognizer:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v14);
      }

      [(UIAlertController *)self _setSystemProvidedPresentationDelegate:0];
      [(UIAlertController *)self _setSystemProvidedPresentationView:0];
      [(UIAlertController *)self _setPreviewInteractionController:0];
    }
    if (v6)
    {
      id v17 = objc_alloc_init(UIPreviewInteractionController);
      id v18 = [[UIPreviewForceInteractionProgress alloc] initWithView:v6 targetState:2];
      [(UIPreviewInteractionController *)v17 setInteractionProgressForPresentation:v18];
      double v19 = [(UIPreviewInteractionController *)v17 beginPreviewGestureRecognizer];
      [(UIPreviewForceInteractionProgress *)v18 _setGestureBeginObservable:v19];

      [(UIPreviewInteractionController *)v17 setDelegate:self];
      double v20 = [(UIPreviewInteractionController *)v17 gestureRecognizers];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            [v6 addGestureRecognizer:*(void *)(*((void *)&v28 + 1) + 8 * j)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v22);
      }
      [(UIAlertController *)self _setSystemProvidedPresentationDelegate:v7];
      [(UIAlertController *)self _setSystemProvidedPresentationView:v6];
      [(UIAlertController *)self _setPreviewInteractionController:v17];
    }
  }
  double v25 = [(UIAlertController *)self _previewInteractionController];
  double v26 = [v25 presentationGestureRecognizer];

  return v26;
}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6
{
  if (-[UIAlertController _canBePresentedAtLocation:](self, "_canBePresentedAtLocation:", a3, a5, a4.x, a4.y))
  {
    uint64_t v8 = [(UIAlertController *)self _systemProvidedPresentationDelegate];
    *a6 = [v8 _presentingViewControllerForSystemProvidedPresentationOfAlertController:self];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  id v7 = [(UIAlertController *)self _systemProvidedPresentationDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 _willBeginSystemProvidedPresentationOfAlertController:self];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v7 _willPerformSystemProvidedPresentationOfAlertController:self];
  }
}

- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3
{
  return 0;
}

- (BOOL)_isPresented
{
  double v3 = [(UIViewController *)self presentingViewController];
  if (v3) {
    BOOL v4 = ![(UIViewController *)self isBeingPresented];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_canBePresentedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIAlertController *)self _isPresented]
    || [(UIViewController *)self isBeingPresented])
  {
    int v6 = 0;
  }
  else
  {
    int v6 = ![(UIViewController *)self isBeingDismissed];
  }
  id v7 = [(UIAlertController *)self _systemProvidedPresentationDelegate];
  int v8 = objc_opt_respondsToSelector() ^ 1;
  char v9 = v8 & v6;
  if ((v8 & 1) == 0 && v6) {
    char v9 = objc_msgSend(v7, "_shouldPerformSystemProvidedPresentationOfAlertController:atSystemProvidedPresentationRegisteredViewLocation:", self, x, y);
  }

  return v9;
}

- (void)_setSystemProvidedGestureRecognizer:(id)a3
{
}

- (__CFString)_powerLoggingEventName
{
  int64_t v4 = [(UIAlertController *)self _resolvedStyle];
  if ((unint64_t)(v4 - 1000) < 2 || v4 == 0) {
    return @"UIKit-ActionSheet";
  }
  if (v4 == 1) {
    return @"UIKit-Alert";
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"UIAlertController.m" lineNumber:2603 description:@"Unknown resolved alert controller style while trying to log."];

  return 0;
}

- (void)_logBeingPresented
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Process-ID";
  double v3 = [NSNumber numberWithInt:getpid()];
  v7[0] = v3;
  v7[1] = &unk_1ED3F2B50;
  v6[1] = @"Status";
  v6[2] = @"Timestamp";
  int64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  v7[2] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  [(UIAlertController *)self _powerLoggingEventName];
  PLLogRegisteredEvent();
}

- (void)_logBeingDismissed
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Process-ID";
  double v3 = [NSNumber numberWithInt:getpid()];
  v7[0] = v3;
  v7[1] = &unk_1ED3F2B68;
  v6[1] = @"Status";
  v6[2] = @"Timestamp";
  int64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  v7[2] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  [(UIAlertController *)self _powerLoggingEventName];
  PLLogRegisteredEvent();
}

- (NSMutableArray)_actions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1160, 1);
}

- (UIAlertAction)_cancelAction
{
  return (UIAlertAction *)objc_getProperty(self, a2, 1016, 1);
}

- (UIViewController)_headerContentViewController
{
  return self->_headerContentViewController;
}

- (UIViewController)_separatedHeaderContentViewController
{
  return self->_separatedHeaderContentViewController;
}

- (BOOL)_dismissedFromShim
{
  return self->dismissedFromShim;
}

- (void)_setDismissedFromShim:(BOOL)a3
{
  self->dismissedFromShim = a3;
}

- (int64_t)_resolvedStyle
{
  return self->_resolvedStyle;
}

- (UIAlertControllerVisualStyleProviding)_styleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);
  return (UIAlertControllerVisualStyleProviding *)WeakRetained;
}

- (void)_setStyleProvider:(id)a3
{
}

- (BOOL)_isHidden
{
  return self->_hidden;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIAlertAction)preferredAction
{
  return self->_preferredAction;
}

- (BOOL)_shouldFlipFrameForShimDismissal
{
  return self->__shouldFlipFrameForShimDismissal;
}

- (void)set_shouldFlipFrameForShimDismissal:(BOOL)a3
{
  self->__shouldFlipFrameForShimDismissal = a3;
}

- (_UIAnimationCoordinator)temporaryAnimationCoordinator
{
  return self->_temporaryAnimationCoordinator;
}

- (void)setTemporaryAnimationCoordinator:(id)a3
{
}

- (UIPreviewInteractionController)_previewInteractionController
{
  return self->_previewInteractionController;
}

- (void)_setPreviewInteractionController:(id)a3
{
}

- (UIAlertControllerVisualStyle)_visualStyle
{
  return self->__visualStyle;
}

- (void)_setVisualStyle:(id)a3
{
}

- (NSIndexSet)_indexesOfActionSectionSeparators
{
  return self->_indexesOfActionSectionSeparators;
}

- (NSMutableArray)_actionDelimiterIndices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1232, 1);
}

- (BOOL)_shouldAllowNilParameters
{
  return self->__shouldAllowNilParameters;
}

- (void)_setShouldAllowNilParameters:(BOOL)a3
{
  self->__shouldAllowNilParameters = a3;
}

- (UIPopoverController)_compatibilityPopoverController
{
  return self->__compatibilityPopoverController;
}

- (void)_setCompatibilityPopoverController:(id)a3
{
  self->__compatibilityPopoverController = (UIPopoverController *)a3;
}

- (BOOL)_hasPreservedInputViews
{
  return self->_hasPreservedInputViews;
}

- (void)_setHasPreservedInputViews:(BOOL)a3
{
  self->_hasPreservedInputViews = a3;
}

- (UIView)_systemProvidedPresentationView
{
  return self->__systemProvidedPresentationView;
}

- (void)_setSystemProvidedPresentationView:(id)a3
{
}

- (UIAlertControllerSystemProvidedPresentationDelegate)_systemProvidedPresentationDelegate
{
  return self->__systemProvidedPresentationDelegate;
}

- (void)_setSystemProvidedPresentationDelegate:(id)a3
{
}

- (UIGestureRecognizer)_systemProvidedGestureRecognizer
{
  return self->_systemProvidedGestureRecognizer;
}

- (BOOL)_wantsUnclippedContentViewControllerContainer
{
  return self->__wantsUnclippedContentViewControllerContainer;
}

- (void)_setWantsUnclippedContentViewControllerContainer:(BOOL)a3
{
  self->__wantsUnclippedContentViewControllerContainer = a3;
}

- (BOOL)_wantsUnclippedHeaderContentViewControllerContainer
{
  return self->__wantsUnclippedHeaderContentViewControllerContainer;
}

- (void)_setWantsUnclippedHeaderContentViewControllerContainer:(BOOL)a3
{
  self->__wantsUnclippedHeaderContentViewControllerContainer = a3;
}

- (UIAlertControllerCoordinatedActionPerforming)coordinatedActionPerformingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatedActionPerformingDelegate);
  return (UIAlertControllerCoordinatedActionPerforming *)WeakRetained;
}

- (void)setCoordinatedActionPerformingDelegate:(id)a3
{
}

- (UIView)_presentationSourceRepresentationView
{
  return self->__presentationSourceRepresentationView;
}

- (void)_setPresentationSourceRepresentationView:(id)a3
{
}

- (int64_t)_titleMaximumLineCount
{
  return self->_titleMaximumLineCount;
}

- (int64_t)_titleLineBreakMode
{
  return self->_titleLineBreakMode;
}

- (UIImage)_accessoryImage
{
  return self->_accessoryImage;
}

- (void)_setAccessoryImage:(id)a3
{
}

- (BOOL)_shouldAlignToKeyboard
{
  return self->__shouldAlignToKeyboard;
}

- (void)_setShouldAlignToKeyboard:(BOOL)a3
{
  self->__shouldAlignToKeyboard = a3;
}

- (BOOL)_shouldInvokeCancelActionOnDimmingViewTap
{
  return self->__shouldInvokeCancelActionOnDimmingViewTap;
}

- (void)_setShouldInvokeCancelActionOnDimmingViewTap:(BOOL)a3
{
  self->__shouldInvokeCancelActionOnDimmingViewTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->__presentationSourceRepresentationView, 0);
  objc_destroyWeak((id *)&self->_coordinatedActionPerformingDelegate);
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__systemProvidedPresentationDelegate, 0);
  objc_storeStrong((id *)&self->__systemProvidedPresentationView, 0);
  objc_storeStrong((id *)&self->__actionDelimiterIndices, 0);
  objc_storeStrong((id *)&self->_indexesOfActionSectionSeparators, 0);
  objc_storeStrong((id *)&self->__visualStyle, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_temporaryAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewController, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_alertControllerStackManager);
  objc_storeStrong((id *)&self->_actionsWithInvokedHandlers, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong(&self->_ownedTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_backButtonDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textFieldViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_keyCommandToActionMapTable, 0);
  objc_storeStrong((id *)&self->_actionToKeyCommandsDictionary, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_linkedAlertControllers, 0);
  objc_storeStrong((id *)&self->_attributedDetailMessage, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end