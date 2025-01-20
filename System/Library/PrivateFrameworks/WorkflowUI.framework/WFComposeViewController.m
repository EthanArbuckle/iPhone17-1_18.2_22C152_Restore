@interface WFComposeViewController
+ (BOOL)canShowInputAction;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)actionCanvasIsEmpty;
- (BOOL)backActionTapped;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canExpandDrawerAsAuxiliaryViewPresenter;
- (BOOL)displaysInlineRenameInHeader;
- (BOOL)isEditingNewWorkflow;
- (BOOL)isNewShortcutFlow;
- (BOOL)isRenameSessionActive;
- (BOOL)needsAdditionalSpaceInNavBar;
- (BOOL)observingSharingEnabledUserDefault;
- (BOOL)shouldAnchorIconViewToRenameTextField;
- (BOOL)shouldShowShareButton;
- (BOOL)shouldUseOverlaidDrawer;
- (BOOL)showsDetailsButton;
- (BOOL)suppressDocumentMenuUpdates;
- (BOOL)usesDocumentMenu;
- (BOOL)willDeleteWhenClosed;
- (BOOL)workflowHasContent;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (Class)triggerInputType;
- (HMHome)home;
- (NSHashTable)movedDragControllers;
- (NSMutableArray)editingStates;
- (NSUndoManager)undoManager;
- (UIAction)backAction;
- (UIButton)iconView;
- (UIButton)settingsButton;
- (UIButton)titleAccessorySettingsButton;
- (UIButton)titleViewSettingsButton;
- (UILabel)titleViewLabel;
- (UIView)separatorView;
- (WFActionDrawerCoordinator)drawerCoordinator;
- (WFAddToHomeScreenActivity)addToHomeScreenActivity;
- (WFComposeFlowController)flowController;
- (WFComposeUserActivityManager)userActivityManager;
- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4;
- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4 home:(id)a5 shouldShowShareButton:(BOOL)a6;
- (WFComposeViewControllerDelegate)delegate;
- (WFComposeViewControllerPresenter)presenter;
- (WFDatabase)database;
- (WFEditorDocumentMenuDelegate)editorDocumentMenuDelegate;
- (WFEditorViewController)editorViewController;
- (WFMoveToFolderCoordinator)moveCoordinator;
- (WFRunWorkflowToolbar)toolbar;
- (WFWorkflow)workflow;
- (WFWorkflowSettingsViewController)settingsViewController;
- (double)actionCanvasWidthForActionDrawerCoordinator:(id)a3;
- (double)bottomContentInset;
- (id)activityControllerWithFileActivity:(id)a3 sender:(id)a4;
- (id)cancelBarButtonItem;
- (id)doneBarButtonItem;
- (id)drawerHostingViewController;
- (id)drawerViewController;
- (id)findViewInNavigationBarWithName:(id)a3;
- (id)findViewInView:(id)a3 withName:(id)a4;
- (id)keyCommands;
- (id)navigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5;
- (id)placeholderName;
- (id)settingsButtonWithConfiguration:(id)a3;
- (id)workflowView;
- (int64_t)positionForBar:(id)a3;
- (unint64_t)editingState;
- (unint64_t)navigationUpdateBehavior;
- (unint64_t)visibleToolbarPlacement;
- (void)actionDrawerCoordinator:(id)a3 didAppendAction:(id)a4;
- (void)actionsDidChangeInEditorViewController:(id)a3;
- (void)addAskForInputActionFromKeyPress;
- (void)addChooseFromMenuActionFromKeyPress;
- (void)addCommentActionFromKeyPress;
- (void)addConditionalActionFromKeyPress;
- (void)addRepeatCountActionFromKeyPress;
- (void)addRepeatEachActionFromKeyPress;
- (void)addSetVariableActionFromKeyPress;
- (void)addShowResultActionFromKeyPress;
- (void)adjustLargeTitleSize;
- (void)appendActionWithIdentifier:(id)a3;
- (void)applicationWillEnterForeground;
- (void)beginEditing;
- (void)collapseDrawerAsAuxiliaryViewPresenter;
- (void)createRenameShortcutEvent;
- (void)dealloc;
- (void)didTapCancel:(id)a3;
- (void)didTapDone;
- (void)didTapDone:(id)a3;
- (void)didTapNext;
- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4;
- (void)editorViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6;
- (void)editorViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4;
- (void)expandDrawer;
- (void)finishEditing;
- (void)finishEditingAndDismissForTutorial:(BOOL)a3 completionHandler:(id)a4;
- (void)iconEditorWillDisappear:(id)a3;
- (void)inspectorPaneSegmentedControl:(id)a3 didSelectPane:(int64_t)a4;
- (void)layoutDocumentMenuControl;
- (void)layoutIconView;
- (void)layoutSupplementaryViewsIfNeeded;
- (void)layoutTitleView;
- (void)loadView;
- (void)navigationItem:(id)a3 didEndRenamingWithTitle:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performScrollingTest:(id)a3;
- (void)popEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentAddToHomeScreen;
- (void)presentDrawerViewControllerAsAuxiliaryViewPresenter:(id)a3 inPopover:(BOOL)a4 sourceRect:(CGRect)a5;
- (void)presentIconPickerWithSourceItem:(id)a3;
- (void)presentSettingsViewController;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pushEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)redoLastWorkflowEdit;
- (void)renameWorkflow;
- (void)resetToolbar;
- (void)runToolbarPlayTapped:(id)a3;
- (void)runToolbarRedoTapped:(id)a3;
- (void)runToolbarShareTapped:(id)a3 sender:(id)a4;
- (void)runToolbarStopTapped:(id)a3;
- (void)runToolbarUndoTapped:(id)a3;
- (void)runWorkflowFromKeyPress;
- (void)searchActions;
- (void)setAddToHomeScreenActivity:(id)a3;
- (void)setBackAction:(id)a3;
- (void)setBackActionTapped:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentMenuControlWithTitle:(id)a3 navigationItem:(id)a4;
- (void)setDrawerCoordinator:(id)a3;
- (void)setEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setEditorDocumentMenuDelegate:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setHome:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIsEditingNewWorkflow:(BOOL)a3;
- (void)setMoveCoordinator:(id)a3;
- (void)setObservingSharingEnabledUserDefault:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setRenameSessionActive:(BOOL)a3;
- (void)setShouldAnchorIconViewToRenameTextField:(BOOL)a3;
- (void)setShouldShowShareButton:(BOOL)a3;
- (void)setSuppressDocumentMenuUpdates:(BOOL)a3;
- (void)setTitleAccessorySettingsButton:(id)a3;
- (void)setTitleViewLabel:(id)a3;
- (void)setTitleViewSettingsButton:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setUpToolbar;
- (void)setUserActivityManager:(id)a3;
- (void)shareWorkflowWithSender:(id)a3;
- (void)stopWorkflow;
- (void)traitCollectionDidChange:(id)a3;
- (void)undoLastWorkflowEdit;
- (void)updateBackActionForDocumentMenu;
- (void)updateBottomContentInset;
- (void)updateDocumentMenuWithTitle:(id)a3 navigationItem:(id)a4;
- (void)updateEditingStateAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)updateNavigationBarStateAnimated:(BOOL)a3;
- (void)updateShareButtonVisibility;
- (void)updateTitleItemIfNeeded;
- (void)updateTitleView:(id)a3;
- (void)updateToolbarVisibility;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFComposeViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_addToHomeScreenActivity, 0);
  objc_storeStrong((id *)&self->_moveCoordinator, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_drawerCoordinator, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleAccessorySettingsButton, 0);
  objc_storeStrong((id *)&self->_titleViewSettingsButton, 0);
  objc_storeStrong((id *)&self->_titleViewLabel, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_editingStates, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_movedDragControllers, 0);
  objc_destroyWeak((id *)&self->_separatorView);
  objc_destroyWeak((id *)&self->_settingsButton);
  objc_destroyWeak((id *)&self->_editorDocumentMenuDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setAddToHomeScreenActivity:(id)a3
{
}

- (WFAddToHomeScreenActivity)addToHomeScreenActivity
{
  return self->_addToHomeScreenActivity;
}

- (void)setMoveCoordinator:(id)a3
{
}

- (WFMoveToFolderCoordinator)moveCoordinator
{
  return self->_moveCoordinator;
}

- (void)setFlowController:(id)a3
{
}

- (WFComposeFlowController)flowController
{
  return self->_flowController;
}

- (void)setDrawerCoordinator:(id)a3
{
}

- (WFActionDrawerCoordinator)drawerCoordinator
{
  return self->_drawerCoordinator;
}

- (void)setBackActionTapped:(BOOL)a3
{
  self->_backActionTapped = a3;
}

- (BOOL)backActionTapped
{
  return self->_backActionTapped;
}

- (void)setBackAction:(id)a3
{
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (void)setSuppressDocumentMenuUpdates:(BOOL)a3
{
  self->_suppressDocumentMenuUpdates = a3;
}

- (BOOL)suppressDocumentMenuUpdates
{
  return self->_suppressDocumentMenuUpdates;
}

- (void)setShouldAnchorIconViewToRenameTextField:(BOOL)a3
{
  self->_shouldAnchorIconViewToRenameTextField = a3;
}

- (BOOL)shouldAnchorIconViewToRenameTextField
{
  return self->_shouldAnchorIconViewToRenameTextField;
}

- (void)setIconView:(id)a3
{
}

- (UIButton)iconView
{
  return self->_iconView;
}

- (void)setTitleAccessorySettingsButton:(id)a3
{
}

- (void)setTitleViewSettingsButton:(id)a3
{
}

- (UIButton)titleViewSettingsButton
{
  return self->_titleViewSettingsButton;
}

- (void)setTitleViewLabel:(id)a3
{
}

- (UILabel)titleViewLabel
{
  return self->_titleViewLabel;
}

- (void)setObservingSharingEnabledUserDefault:(BOOL)a3
{
  self->_observingSharingEnabledUserDefault = a3;
}

- (BOOL)observingSharingEnabledUserDefault
{
  return self->_observingSharingEnabledUserDefault;
}

- (void)setShouldShowShareButton:(BOOL)a3
{
  self->_shouldShowShareButton = a3;
}

- (BOOL)shouldShowShareButton
{
  return self->_shouldShowShareButton;
}

- (void)setRenameSessionActive:(BOOL)a3
{
  self->_renameSessionActive = a3;
}

- (BOOL)isRenameSessionActive
{
  return self->_renameSessionActive;
}

- (void)setToolbar:(id)a3
{
}

- (WFRunWorkflowToolbar)toolbar
{
  return self->_toolbar;
}

- (NSMutableArray)editingStates
{
  return self->_editingStates;
}

- (void)setUserActivityManager:(id)a3
{
}

- (WFComposeUserActivityManager)userActivityManager
{
  return self->_userActivityManager;
}

- (NSHashTable)movedDragControllers
{
  return self->_movedDragControllers;
}

- (UIView)separatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
  return (UIView *)WeakRetained;
}

- (UIButton)settingsButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsButton);
  return (UIButton *)WeakRetained;
}

- (void)setIsEditingNewWorkflow:(BOOL)a3
{
  self->_isEditingNewWorkflow = a3;
}

- (BOOL)isEditingNewWorkflow
{
  return self->_isEditingNewWorkflow;
}

- (void)setEditorDocumentMenuDelegate:(id)a3
{
}

- (WFEditorDocumentMenuDelegate)editorDocumentMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorDocumentMenuDelegate);
  return (WFEditorDocumentMenuDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFComposeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFComposeViewControllerDelegate *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (WFComposeViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (WFComposeViewControllerPresenter *)WeakRetained;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (WFEditorViewController)editorViewController
{
  return self->_editorViewController;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)performScrollingTest:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"shortcutsEditor"])
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__WFComposeViewController_performScrollingTest___block_invoke;
    v11[3] = &unk_2649CC018;
    v11[4] = self;
    v6 = &v12;
    id v12 = v4;
    v7 = MEMORY[0x263EF83A0];
    v8 = v11;
LABEL_5:
    dispatch_after(v5, v7, v8);

    goto LABEL_6;
  }
  if ([v4 hasPrefix:@"shortcutsDrawer"])
  {
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__WFComposeViewController_performScrollingTest___block_invoke_2;
    v9[3] = &unk_2649CC018;
    v9[4] = self;
    v6 = &v10;
    id v10 = v4;
    v7 = MEMORY[0x263EF83A0];
    v8 = v9;
    goto LABEL_5;
  }
LABEL_6:
}

void __48__WFComposeViewController_performScrollingTest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) editorViewController];
  [v2 performScrollingTest:*(void *)(a1 + 40)];
}

void __48__WFComposeViewController_performScrollingTest___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) drawerCoordinator];
  [v2 performScrollingTest:*(void *)(a1 + 40)];
}

- (void)iconEditorWillDisappear:(id)a3
{
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)appendActionWithIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [MEMORY[0x263F86898] sharedRegistry];
  dispatch_time_t v5 = [v4 createActionWithIdentifier:v7 serializedParameters:0];

  v6 = [(WFComposeViewController *)self editorViewController];
  [v6 appendAction:v5];
}

- (void)addRepeatEachActionFromKeyPress
{
}

- (void)addRepeatCountActionFromKeyPress
{
}

- (void)addConditionalActionFromKeyPress
{
}

- (void)addChooseFromMenuActionFromKeyPress
{
}

- (void)addShowResultActionFromKeyPress
{
}

- (void)addAskForInputActionFromKeyPress
{
}

- (void)addSetVariableActionFromKeyPress
{
}

- (void)addCommentActionFromKeyPress
{
}

- (void)redoLastWorkflowEdit
{
  if ([(WFComposeViewController *)self editingState] == 1)
  {
    id v3 = [(WFComposeViewController *)self undoManager];
    [v3 redo];
  }
}

- (void)undoLastWorkflowEdit
{
  if ([(WFComposeViewController *)self editingState] == 1)
  {
    id v3 = [(WFComposeViewController *)self undoManager];
    [v3 undo];
  }
}

- (void)searchActions
{
  if ([(WFComposeViewController *)self editingState] == 1)
  {
    id v3 = [(WFComposeViewController *)self drawerCoordinator];
    [v3 focusSearchBar];
  }
}

- (void)stopWorkflow
{
  id v2 = [(WFComposeViewController *)self editorViewController];
  [v2 stop];
}

- (void)runWorkflowFromKeyPress
{
  id v2 = [(WFComposeViewController *)self editorViewController];
  [v2 runWithSource:*MEMORY[0x263F85AA0]];
}

- (void)renameWorkflow
{
  id v2 = [(WFComposeViewController *)self editorViewController];
  id v3 = [v2 navigationController];

  if (objc_opt_respondsToSelector()) {
    [v3 rename:0];
  }
}

- (id)keyCommands
{
  id v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x263F82890];
  dispatch_time_t v5 = WFLocalizedString(@"Run Shortcut");
  v6 = [v4 commandWithTitle:v5 image:0 action:sel_runWorkflowFromKeyPress input:@"r" modifierFlags:0x100000 propertyList:0];
  [v3 addObject:v6];

  id v7 = (void *)MEMORY[0x263F82890];
  v8 = WFLocalizedString(@"Stop Shortcut");
  v9 = [v7 commandWithTitle:v8 image:0 action:sel_stopWorkflow input:*MEMORY[0x263F83758] modifierFlags:0 propertyList:0];
  [v3 addObject:v9];

  id v10 = (void *)MEMORY[0x263F82890];
  v11 = WFLocalizedString(@"Rename Shortcut");
  id v12 = [v10 commandWithTitle:v11 image:0 action:sel_renameWorkflow input:@"r" modifierFlags:1310720 propertyList:0];
  [v3 addObject:v12];

  if ([(WFComposeViewController *)self editingState] == 1)
  {
    v13 = (void *)MEMORY[0x263F82890];
    v14 = WFLocalizedString(@"Search Actions");
    v15 = [v13 commandWithTitle:v14 image:0 action:sel_searchActions input:@"f" modifierFlags:0x100000 propertyList:0];
    [v3 addObject:v15];

    v16 = (void *)MEMORY[0x263F82890];
    v17 = WFLocalizedString(@"Undo");
    v18 = [v16 commandWithTitle:v17 image:0 action:sel_undoLastWorkflowEdit input:@"z" modifierFlags:0x100000 propertyList:0];
    [v3 addObject:v18];

    v19 = (void *)MEMORY[0x263F82890];
    v20 = WFLocalizedString(@"Redo");
    v21 = [v19 commandWithTitle:v20 image:0 action:sel_redoLastWorkflowEdit input:@"z" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v21];

    v22 = (void *)MEMORY[0x263F82890];
    v23 = WFLocalizedString(@"Comment");
    v24 = [v22 commandWithTitle:v23 image:0 action:sel_addCommentActionFromKeyPress input:@"c" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v24];

    v25 = (void *)MEMORY[0x263F82890];
    v26 = WFLocalizedString(@"Set Variable");
    v27 = [v25 commandWithTitle:v26 image:0 action:sel_addSetVariableActionFromKeyPress input:@"v" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v27];

    v28 = (void *)MEMORY[0x263F82890];
    v29 = WFLocalizedString(@"Ask For Input");
    v30 = [v28 commandWithTitle:v29 image:0 action:sel_addAskForInputActionFromKeyPress input:@"a" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v30];

    v31 = (void *)MEMORY[0x263F82890];
    v32 = WFLocalizedString(@"Show Result");
    v33 = [v31 commandWithTitle:v32 image:0 action:sel_addShowResultActionFromKeyPress input:@"s" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v33];

    v34 = (void *)MEMORY[0x263F82890];
    v35 = WFLocalizedString(@"Choose From Menu");
    v36 = [v34 commandWithTitle:v35 image:0 action:sel_addChooseFromMenuActionFromKeyPress input:@"m" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v36];

    v37 = (void *)MEMORY[0x263F82890];
    v38 = WFLocalizedString(@"If");
    v39 = [v37 commandWithTitle:v38 image:0 action:sel_addConditionalActionFromKeyPress input:@"i" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v39];

    v40 = (void *)MEMORY[0x263F82890];
    v41 = WFLocalizedString(@"Repeat Count");
    v42 = [v40 commandWithTitle:v41 image:0 action:sel_addRepeatCountActionFromKeyPress input:@"r" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v42];

    v43 = (void *)MEMORY[0x263F82890];
    v44 = WFLocalizedString(@"Repeat Each");
    v45 = [v43 commandWithTitle:v44 image:0 action:sel_addRepeatEachActionFromKeyPress input:@"e" modifierFlags:1179648 propertyList:0];
    [v3 addObject:v45];
  }
  v46 = (void *)MEMORY[0x263F82890];
  v47 = WFLocalizedString(@"Close Shortcut");
  v48 = [v46 commandWithTitle:v47 image:0 action:sel_didTapDone input:@"w" modifierFlags:0x100000 propertyList:0];
  [v3 addObject:v48];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)presentDrawerViewControllerAsAuxiliaryViewPresenter:(id)a3 inPopover:(BOOL)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  id v12 = a3;
  v11 = [(WFComposeViewController *)self drawerCoordinator];
  objc_msgSend(v11, "presentDrawerViewController:inPopover:withSourceRect:", v12, v9, x, y, width, height);
}

- (void)collapseDrawerAsAuxiliaryViewPresenter
{
  id v2 = [(WFComposeViewController *)self drawerCoordinator];
  [v2 collapseDrawer];
}

- (BOOL)canExpandDrawerAsAuxiliaryViewPresenter
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  unint64_t v3 = [(WFComposeViewController *)self editingState];
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      id v4 = [(WFComposeViewController *)self editorViewController];
      [v4 stop];
    }
  }
  else
  {
    [(WFComposeViewController *)self didTapDone];
  }
  return 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  unint64_t v3 = [(WFComposeViewController *)self editingState];
  if (v3 < 2)
  {
    id v4 = [(WFComposeViewController *)self editorViewController];
    [v4 runWithSource:*MEMORY[0x263F85A78]];
LABEL_5:

    return 1;
  }
  if (v3 == 2)
  {
    id v4 = [(WFComposeViewController *)self editorViewController];
    [v4 stop];
    goto LABEL_5;
  }
  return 1;
}

- (void)inspectorPaneSegmentedControl:(id)a3 didSelectPane:(int64_t)a4
{
  id v8 = a3;
  if (a4 == 1)
  {
    v6 = [(WFComposeViewController *)self drawerCoordinator];
    id v7 = [(WFComposeViewController *)self settingsViewController];
    [v6 setInspectorPaneViewController:v7];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    v6 = [(WFComposeViewController *)self drawerCoordinator];
    id v7 = [(WFComposeViewController *)self drawerViewController];
    [v6 setInspectorPaneViewController:v7];
  }

LABEL_6:
}

- (BOOL)actionCanvasIsEmpty
{
  id v2 = [(WFComposeViewController *)self workflow];
  unint64_t v3 = [v2 actions];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (double)actionCanvasWidthForActionDrawerCoordinator:(id)a3
{
  unint64_t v3 = [(WFComposeViewController *)self editorViewController];
  [v3 actionCanvasWidth];
  double v5 = v4;

  return v5;
}

- (void)actionDrawerCoordinator:(id)a3 didAppendAction:(id)a4
{
  id v6 = a4;
  double v5 = [(WFComposeViewController *)self editorViewController];
  [v5 appendAction:v6];
}

- (void)actionsDidChangeInEditorViewController:(id)a3
{
  double v4 = [(WFComposeViewController *)self drawerCoordinator];
  [v4 clearSearchBar];

  [(WFComposeViewController *)self updateNavigationBarStateAnimated:0];
}

- (void)editorViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4
{
}

- (void)editorViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6
{
  if (a4) {
    -[WFComposeViewController pushEditingState:animated:completionHandler:](self, "pushEditingState:animated:completionHandler:", 2, 1, 0, a5);
  }
}

- (void)runToolbarRedoTapped:(id)a3
{
  id v3 = [(WFComposeViewController *)self undoManager];
  [v3 redo];
}

- (void)runToolbarUndoTapped:(id)a3
{
  id v3 = [(WFComposeViewController *)self undoManager];
  [v3 undo];
}

- (void)runToolbarShareTapped:(id)a3 sender:(id)a4
{
}

- (void)runToolbarStopTapped:(id)a3
{
  id v3 = [(WFComposeViewController *)self editorViewController];
  [v3 stop];
}

- (void)runToolbarPlayTapped:(id)a3
{
  id v4 = [(WFComposeViewController *)self editorViewController];
  [v4 runWithSource:*MEMORY[0x263F85AB0]];

  id v5 = [(WFComposeViewController *)self view];
  [v5 endEditing:1];
}

- (void)resetToolbar
{
  id v8 = [(WFComposeViewController *)self toolbar];
  [v8 setDelegate:self];

  id v9 = [(WFComposeViewController *)self toolbar];
  [v9 setEditing:1];

  id v10 = [(WFComposeViewController *)self undoManager];
  id v3 = [(WFComposeViewController *)self toolbar];
  [v3 setWorkflowUndoManager:v10];

  id v11 = [(WFComposeViewController *)self editorViewController];
  uint64_t v4 = [v11 isRunning];
  id v5 = [(WFComposeViewController *)self toolbar];
  [v5 setRunning:v4];

  id v12 = [(WFComposeViewController *)self workflow];
  id v6 = [v12 actions];
  BOOL v7 = [v6 count] != 0;

  id v13 = [(WFComposeViewController *)self toolbar];
  [v13 setPlayEnabled:v7];

  id v14 = [(WFComposeViewController *)self toolbar];
  [v14 setShareEnabled:v7];
}

- (void)expandDrawer
{
  id v3 = [(WFComposeViewController *)self drawerCoordinator];
  [v3 expandDrawer];

  id v4 = [(WFComposeViewController *)self view];
  [v4 endEditing:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)WFWorkflowNameContext == a6 || WFWorkflowReferenceContext == (void)a6)
  {
    [(WFComposeViewController *)self updateNavigationBarStateAnimated:1];
  }
  else if ((void *)WFWorkflowActionsContext == a6)
  {
    id v14 = [(WFComposeViewController *)self drawerCoordinator];
    [v14 updateDrawerSheetBottomInset:1];

    v15 = [(WFComposeViewController *)self editorViewController];

    if (v15) {
      [(WFComposeViewController *)self resetToolbar];
    }
  }
  else if ((void *)WFWorkflowDeletedContext == a6)
  {
    v16 = [(WFComposeViewController *)self workflow];
    int v17 = [v16 isDeleted];

    if (v17) {
      [(WFComposeViewController *)self finishEditing];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WFComposeViewController;
    [(WFComposeViewController *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(WFComposeViewController *)self traitCollection];
  id v9 = [(WFComposeViewController *)self view];
  [v9 safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  id v18 = [(WFComposeViewController *)self drawerHostingViewController];

  if (v18 == v7)
  {
    objc_msgSend(MEMORY[0x263F865B0], "drawerSizeFromParentSize:safeAreaInsets:traitCollection:", v8, width, height, v11, v13, v15, v17);
  }
  else
  {
    id v19 = [(WFComposeViewController *)self editorViewController];

    if (v19 == v7)
    {
      objc_msgSend(MEMORY[0x263F865B0], "workflowViewSizeFromParentSize:safeAreaInsets:traitCollection:", v8, width, height, v11, v13, v15, v17);
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)WFComposeViewController;
      -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](&v26, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    }
  }
  double v22 = v20;
  double v23 = v21;

  double v24 = v22;
  double v25 = v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)createRenameShortcutEvent
{
  id v2 = objc_alloc_init(MEMORY[0x263F86E20]);
  [v2 setKey:@"RenameShortcutEvent"];
  [v2 setSource:@"ShortcutSourceEditorDocumentMenu"];
  [v2 track];
}

- (void)navigationItem:(id)a3 didEndRenamingWithTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WFComposeViewController *)self setRenameSessionActive:0];
  id v8 = [v6 navigationBar];
  [v8 setAccessibilityIdentifier:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v9 = [(WFComposeViewController *)self workflow];
  id v10 = [v9 name];
  if (v10 == v7)
  {
    double v14 = v7;
    goto LABEL_13;
  }
  char v11 = objc_msgSend(v7, "wf_isEmpty");

  if ((v11 & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      double v12 = [(WFComposeViewController *)self workflow];
      id v22 = 0;
      char v13 = [v12 renameWorkflowTo:v7 error:&v22];
      id v9 = v22;

      if (v13)
      {
        [(WFComposeViewController *)self createRenameShortcutEvent];
LABEL_14:

        goto LABEL_15;
      }
      double v14 = [MEMORY[0x263F336E8] alertWithError:v9];
      double v20 = WFUserInterfaceFromViewController();
      [v20 presentAlert:v14];
LABEL_12:

      goto LABEL_13;
    }
    double v15 = [(WFComposeViewController *)self database];
    double v16 = [(WFComposeViewController *)self workflow];
    double v17 = [v16 reference];
    id v23 = 0;
    double v14 = [v15 renameReference:v17 to:v7 error:&v23];
    id v9 = v23;

    if (!v14)
    {
      if (!v9)
      {
        double v14 = 0;
        goto LABEL_13;
      }
      double v20 = [MEMORY[0x263F336E8] alertWithError:v9];
      double v21 = WFUserInterfaceFromViewController();
      [v21 presentAlert:v20];

      double v14 = 0;
      goto LABEL_12;
    }
    id v18 = [(WFComposeViewController *)self workflow];
    [v18 setName:v7];

    id v19 = [(WFComposeViewController *)self workflow];
    [v19 save];

    [(WFComposeViewController *)self createRenameShortcutEvent];
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  [(WFComposeViewController *)self updateNavigationBarStateAnimated:1];
  [(WFComposeViewController *)self layoutDocumentMenuControl];
}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldAnchorIconViewToRenameTextField:0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_2;
  v3[3] = &unk_2649CBF20;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v3 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.25 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_3;
  v4[3] = &unk_2649CBF20;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIconView];
}

- (id)navigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(WFComposeViewController *)self setRenameSessionActive:1];
  id v10 = [v8 navigationBar];
  [v10 setAccessibilityIdentifier:@"workflow.editor.navigationbar"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  char v11 = [v9 stringByReplacingOccurrencesOfString:@"‌        ‌" withString:&stru_26E1A5FC0];
  NSUInteger v12 = [v11 length];
  a5->location = 0;
  a5->length = v12;
  dispatch_time_t v13 = dispatch_time(0, 100000000);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_5;
  v16[3] = &unk_2649CBF20;
  v16[4] = self;
  double v14 = (void *)MEMORY[0x263EF83A0];
  dispatch_after(v13, MEMORY[0x263EF83A0], v16);

  return v11;
}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) findViewInNavigationBarWithName:@"_UINavigationBarTitleRenameTextField"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 setAutocapitalizationType:WFAutocapitalizationTypeFromLocale()];
    [v7 reloadInputViews];
    id v2 = [*(id *)(a1 + 32) view];
    id v3 = [v2 traitCollection];
    uint64_t v4 = [v3 horizontalSizeClass];

    if (v4 == 2) {
      CAFrameRateRange v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 28.0, 0.0);
    }
    else {
      CAFrameRateRange v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 30.0, 0.0);
    }
    [v7 setLeftView:v5];
    [v7 setLeftViewMode:3];

    dispatch_time_t v6 = dispatch_time(0, 50000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_2;
    block[3] = &unk_2649CBF20;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
  else
  {
  }
}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) findViewInNavigationBarWithName:@"UIFieldEditor"];
  [v1 setClipsToBounds:0];
}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) findViewInNavigationBarWithName:@"_UITextFieldRoundedRectBackgroundViewNeue"];
  id v3 = [v2 layer];
  [v3 setCornerRadius:10.0];

  [*(id *)(a1 + 32) setShouldAnchorIconViewToRenameTextField:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_3;
  v4[3] = &unk_2649CBF20;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v4 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.25 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

uint64_t __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_4;
  v4[3] = &unk_2649CBF20;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIconView];
}

- (id)findViewInView:(id)a3 withName:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_time_t v6 = (NSString *)a4;
  id v7 = [MEMORY[0x263EFF980] arrayWithObject:v5];
  while ([v7 count])
  {
    id v8 = [v7 lastObject];
    [v7 removeLastObject];
    NSClassFromString(v6);
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = objc_msgSend(v8, "subviews", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          [v7 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

- (id)findViewInNavigationBarWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(WFComposeViewController *)self editorViewController];
  dispatch_time_t v6 = [v5 navigationItem];
  id v7 = [v6 navigationBar];

  if (v7)
  {
    id v8 = [(WFComposeViewController *)self findViewInView:v7 withName:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)presentAddToHomeScreen
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = [(WFComposeViewController *)self workflow];
  id v4 = [v3 reference];

  if (v4)
  {
    id v5 = [WFAddToHomeScreenActivity alloc];
    dispatch_time_t v6 = [(WFComposeViewController *)self workflow];
    id v7 = [v6 reference];
    id v8 = [(WFAddToHomeScreenActivity *)v5 initWithReference:v7];

    id v9 = [(WFComposeViewController *)self workflow];
    uint64_t v10 = (void *)[v9 copy];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [(WFAddToHomeScreenActivity *)v8 prepareWithActivityItems:v11];

    [(WFComposeViewController *)self setAddToHomeScreenActivity:v8];
    NSUInteger v12 = [(WFAddToHomeScreenActivity *)v8 activityViewController];
    [(WFComposeViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (void)presentIconPickerWithSourceItem:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [WFIconPickerViewController alloc];
    id v5 = [(WFComposeViewController *)self workflow];
    double v25 = [(WFIconPickerViewController *)v4 initWithWorkflow:v5];

    dispatch_time_t v6 = [[WFPreviewNavigationController alloc] initWithRootViewController:v25 isInSheetView:1];
    objc_super v26 = (WFShortcutIconEditorViewController *)v6;
  }
  else
  {
    id v7 = [WFShortcutIconEditorViewController alloc];
    id v8 = [(WFComposeViewController *)self workflow];
    objc_super v26 = [(WFShortcutIconEditorViewController *)v7 initWithWorkflow:v8];

    [(WFShortcutIconEditorViewController *)v26 setDelegate:self];
    id v9 = [(WFComposeViewController *)self traitCollection];
    uint64_t v10 = [v9 horizontalSizeClass];

    if (v10 == 2) {
      [(WFShortcutIconEditorViewController *)v26 setShowsDoneButton:0];
    }
  }
  uint64_t v11 = [(WFComposeViewController *)self traitCollection];
  uint64_t v12 = [v11 horizontalSizeClass];

  if (v12 == 2)
  {
    -[WFShortcutIconEditorViewController setPreferredContentSize:](v26, "setPreferredContentSize:", 390.0, 700.0);
    [(WFShortcutIconEditorViewController *)v26 setModalPresentationStyle:7];
    dispatch_time_t v13 = [(WFShortcutIconEditorViewController *)v26 popoverPresentationController];
    [v13 setDelegate:self];
    [v13 setPermittedArrowDirections:1];
    long long v14 = [(WFComposeViewController *)self findViewInNavigationBarWithName:@"LPLinkView"];
    [v14 bounds];
    if (v14)
    {
      double v19 = v15;
      double v20 = v16;
      double v21 = v17;
      double v22 = v18;
    }
    else
    {
      id v23 = [(WFComposeViewController *)self editorViewController];
      double v24 = [v23 navigationItem];
      long long v14 = [v24 navigationBar];

      if ([(WFComposeViewController *)self needsAdditionalSpaceInNavBar]) {
        double v19 = 60.0;
      }
      else {
        double v19 = 130.0;
      }
      double v21 = 0.0;
      double v20 = 44.0;
      double v22 = 0.0;
    }
    [v13 setSourceView:v14];
    objc_msgSend(v13, "setSourceRect:", v19, v20, v21, v22);
    [(WFComposeViewController *)self presentViewController:v26 animated:1 completion:0];
  }
  else
  {
    if (!_os_feature_enabled_impl())
    {
      [(WFComposeViewController *)self presentViewController:v26 animated:1 completion:0];
      goto LABEL_17;
    }
    dispatch_time_t v13 = [(WFComposeViewController *)self drawerCoordinator];
    objc_msgSend(v13, "presentDrawerViewController:inPopover:withSourceRect:", v26, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }

LABEL_17:
}

- (void)applicationWillEnterForeground
{
  [(WFComposeViewController *)self updateNavigationBarStateAnimated:0];
  [(WFComposeViewController *)self layoutDocumentMenuControl];
}

- (void)updateBackActionForDocumentMenu
{
  if ([(WFComposeViewController *)self usesDocumentMenu]
    && ![(WFComposeViewController *)self backActionTapped])
  {
    id v3 = [(WFComposeViewController *)self editorViewController];
    id v4 = [v3 navigationItem];

    if ([(WFComposeViewController *)self needsAdditionalSpaceInNavBar])
    {
      id v5 = &stru_26E1A5FC0;
    }
    else
    {
      WFLocalizedString(@"Shortcuts");
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    dispatch_time_t v6 = [(WFComposeViewController *)self backAction];

    if (!v6)
    {
      objc_initWeak(&location, self);
      id v7 = (void *)MEMORY[0x263F823D0];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      double v16 = __58__WFComposeViewController_updateBackActionForDocumentMenu__block_invoke;
      double v17 = &unk_2649CB390;
      objc_copyWeak(&v18, &location);
      id v8 = [v7 actionWithTitle:v5 image:0 identifier:0 handler:&v14];
      id v9 = WFLocalizedString(@"Closes the shortcut");
      objc_msgSend(v8, "setAccessibilityHint:", v9, v14, v15, v16, v17);

      [(WFComposeViewController *)self setBackAction:v8];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    [v4 setBackAction:0];
    uint64_t v10 = [(WFComposeViewController *)self traitCollection];
    if ([v10 horizontalSizeClass] == 2)
    {
    }
    else
    {
      char v11 = _os_feature_enabled_impl();

      if ((v11 & 1) == 0)
      {
        [v4 setStyle:0];
        goto LABEL_13;
      }
    }
    uint64_t v12 = [(WFComposeViewController *)self backAction];
    [v12 setTitle:v5];

    [v4 setStyle:1];
    dispatch_time_t v13 = [(WFComposeViewController *)self backAction];
    [v4 setBackAction:v13];

LABEL_13:
  }
}

void __58__WFComposeViewController_updateBackActionForDocumentMenu__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setBackActionTapped:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 didTapDone];
}

- (void)layoutDocumentMenuControl
{
  id v3 = [(WFComposeViewController *)self findViewInNavigationBarWithName:@"_UIDocumentPropertiesIconView"];
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 150000000);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__WFComposeViewController_layoutDocumentMenuControl__block_invoke;
    v5[3] = &unk_2649CC018;
    v5[4] = self;
    id v6 = v3;
    dispatch_after(v4, MEMORY[0x263EF83A0], v5);
  }
}

void __52__WFComposeViewController_layoutDocumentMenuControl__block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) findViewInView:*(void *)(a1 + 40) withName:@"LPImageView"];
  if (v12)
  {
    [v12 frame];
    double v3 = v2;
    double v5 = v4;
    id v6 = [*(id *)(a1 + 32) view];
    UIRoundToViewScale();
    double v8 = v7;

    id v9 = [*(id *)(a1 + 32) view];
    UIRoundToViewScale();
    double v11 = v10;

    objc_msgSend(v12, "setFrame:", v8, v11, v3, v5);
  }
}

- (void)setDocumentMenuControlWithTitle:(id)a3 navigationItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(WFComposeViewController *)self workflow];
  id v9 = [v8 resolvedAssociatedAppBundleIdentifier];

  if (v9
    && ([(WFComposeViewController *)self workflow],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 shouldAutoUpdateAssociatedAppBundleIdentifier],
        v10,
        v11))
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F85148]) initWithBundleIdentifier:v9];
  }
  else
  {
    dispatch_time_t v13 = [(WFComposeViewController *)self workflow];
    uint64_t v14 = [v13 icon];
    id v12 = [v14 icon];
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke;
  aBlock[3] = &unk_2649CB480;
  id v15 = v6;
  id v39 = v15;
  id v16 = v7;
  id v40 = v16;
  objc_copyWeak(&v41, location);
  double v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_4;
  v37[3] = &unk_2649CB4A8;
  v37[4] = self;
  id v18 = _Block_copy(v37);
  double v19 = (void (**)(void, void))v18;
  if (v12)
  {
    double v20 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v21 = [v20 applicationState];

    if (!v21)
    {
      double v22 = objc_msgSend(MEMORY[0x263F87B70], "loadIcon:size:style:", v12, 4, 52.0, 52.0);
      uint64_t v23 = objc_msgSend(MEMORY[0x263F87B70], "loadIcon:size:style:", v12, 5, 52.0, 52.0);
      double v24 = (void *)v23;
      if (v22 && v23)
      {
        ((void (**)(void, void *))v19)[2](v19, v22);
        v17[2](v17, v24);
      }
      else
      {
        v32 = (void *)v23;
        v33 = v22;
        id v25 = v12;
        objc_opt_class();
        int v26 = objc_opt_isKindOfClass() & 1;
        if (v26) {
          v27 = v25;
        }
        else {
          v27 = 0;
        }
        id v31 = v27;

        if (v26)
        {
          v29 = (void *)MEMORY[0x263F85308];
          v28 = v25;
          double v24 = v32;
          double v22 = v33;
          v30 = [v28 bundleIdentifier];
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_6;
          v34[3] = &unk_2649CB4D0;
          v35 = v19;
          v36 = v17;
          [v29 applicationIconImageForBundleIdentifier:v30 length:v34 scale:52.0 completionHandler:3.0];
        }
        else
        {
          double v24 = v32;
          double v22 = v33;
          v19[2](v19, 0);
          v17[2](v17, 0);
        }
      }
    }
  }
  else
  {
    (*((void (**)(void *, void))v18 + 2))(v18, 0);
    v17[2](v17, 0);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(location);
}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_2;
  v5[3] = &unk_2649CB458;
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v9);
}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_5;
  v5[3] = &unk_2649CC018;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_6(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 scale];
    double v5 = v4 * 52.0;

    id v6 = objc_msgSend(v13, "roundedWithContinuousCornerRadius:size:", v5 * 0.225, v5, v5);
    id v7 = [v6 UIImage];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    double v10 = v9 * 86.0;

    int v11 = objc_msgSend(v13, "roundedWithContinuousCornerRadius:size:", 0.0, v10, v10);
    id v12 = [v11 UIImage];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconView];
  [v2 setImage:*(void *)(a1 + 40) forState:0];
}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F103D8]);
  [v2 setTitle:*(void *)(a1 + 32)];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithObject:*(void *)(a1 + 40)];
  [v2 setIconProvider:v3];

  double v4 = [*(id *)(a1 + 48) documentProperties];
  double v5 = v4;
  if (v4)
  {
    [v4 setMetadata:v2];
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F826A0]) initWithMetadata:v2];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_3;
    v8[3] = &unk_2649CB430;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    [v6 setActivityViewControllerProvider:v8];
    [*(id *)(a1 + 48) setDocumentProperties:v6];
    objc_destroyWeak(&v9);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained layoutDocumentMenuControl];
}

id __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_3(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained shouldShowShareButton])
  {
    id v3 = objc_loadWeakRetained(v1);
    double v4 = [v3 activityControllerWithFileActivity:0 sender:0];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)layoutIconView
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v3 = [(WFComposeViewController *)self findViewInNavigationBarWithName:@"_UINavigationBarTitleControl"];
  double v4 = [(WFComposeViewController *)self iconView];
  double v5 = [v4 superview];

  if (!v5)
  {
    if (!v3)
    {
      v33 = getWFEditorLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[WFComposeViewController layoutIconView]";
        _os_log_impl(&dword_22D994000, v33, OS_LOG_TYPE_ERROR, "%s Failed to prepare icon view. Could not find title control in view hierarchy.", (uint8_t *)location, 0xCu);
      }
      goto LABEL_17;
    }
    id v6 = [v3 superview];
    id v7 = [(WFComposeViewController *)self iconView];
    [v7 setAdjustsImageWhenHighlighted:0];
    id v8 = [v7 layer];
    [v8 setShadowRadius:8.0];

    id v9 = [v7 layer];
    LODWORD(v10) = 1036831949;
    [v9 setShadowOpacity:v10];

    int v11 = [v7 layer];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 1.0);

    objc_initWeak(location, self);
    id v12 = (void *)MEMORY[0x263F823D0];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __41__WFComposeViewController_layoutIconView__block_invoke;
    v81[3] = &unk_2649CB390;
    objc_copyWeak(&v82, location);
    id v13 = [v12 actionWithHandler:v81];
    [v7 addAction:v13 forControlEvents:64];

    uint64_t v14 = (void *)MEMORY[0x263F823D0];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __41__WFComposeViewController_layoutIconView__block_invoke_2;
    v79[3] = &unk_2649CB998;
    id v15 = v7;
    id v80 = v15;
    id v16 = [v14 actionWithHandler:v79];
    [v15 addAction:v16 forControlEvents:1];

    double v17 = (void *)MEMORY[0x263F823D0];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __41__WFComposeViewController_layoutIconView__block_invoke_4;
    v77[3] = &unk_2649CB998;
    id v18 = v15;
    id v78 = v18;
    double v19 = [v17 actionWithHandler:v77];
    [v18 addAction:v19 forControlEvents:16];

    double v20 = (void *)MEMORY[0x263F823D0];
    uint64_t v72 = MEMORY[0x263EF8330];
    uint64_t v73 = 3221225472;
    v74 = __41__WFComposeViewController_layoutIconView__block_invoke_6;
    v75 = &unk_2649CB998;
    uint64_t v21 = (UIButton *)v18;
    v76 = v21;
    double v22 = [v20 actionWithHandler:&v72];
    -[UIButton addAction:forControlEvents:](v21, "addAction:forControlEvents:", v22, 352, v72, v73, v74, v75);

    [v6 addSubview:v21];
    iconView = self->_iconView;
    self->_iconView = v21;
    double v24 = v21;

    objc_destroyWeak(&v82);
    objc_destroyWeak(location);
  }
  [v3 frame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  if (![(WFComposeViewController *)self shouldAnchorIconViewToRenameTextField])
  {
    v57 = [MEMORY[0x263F82B60] mainScreen];
    v58 = [v57 traitCollection];
    BOOL v59 = [v58 layoutDirection] == 0;

    [v3 frame];
    if (!v59) {
      CGRectGetMaxX(*(CGRect *)&v60);
    }
    v64 = [(WFComposeViewController *)self traitCollection];
    [v64 displayScale];
    BSFloatRoundForScale();
    double v56 = v65;

    v85.origin.double x = v26;
    v85.origin.double y = v28;
    v85.size.double width = v30;
    v85.size.double height = v32;
    CGRectGetMidY(v85);
    v33 = [(WFComposeViewController *)self traitCollection];
    [v33 displayScale];
    BSFloatRoundForScale();
    goto LABEL_16;
  }
  v33 = [(WFComposeViewController *)self findViewInNavigationBarWithName:@"_UINavigationBarTitleRenameTextField"];
  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v33 bounds];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      v42 = [v3 superview];
      -[NSObject convertRect:toView:](v33, "convertRect:toView:", v42, v35, v37, v39, v41);
      double v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;

      v51 = [MEMORY[0x263F82B60] mainScreen];
      v52 = [v51 traitCollection];
      BOOL v53 = [v52 layoutDirection] == 0;

      if (v53)
      {
        CGFloat v55 = v50;
        double v56 = v44 + 5.0;
      }
      else
      {
        v84.origin.double x = v44;
        v84.origin.double y = v46;
        v84.size.double width = v48;
        v84.size.double height = v50;
        CGFloat MaxX = CGRectGetMaxX(v84);
        CGFloat v55 = v50;
        double v56 = MaxX + -24.0 + -5.0;
      }
      double v66 = v44;
      CGFloat v67 = v46;
      CGFloat v68 = v48;
      CGRectGetMidY(*(CGRect *)(&v55 - 3));
      v69 = [(WFComposeViewController *)self traitCollection];
      [v69 displayScale];
      BSFloatRoundForScale();

LABEL_16:
      v33 = [(WFComposeViewController *)self iconView];
      v86.origin.double x = v26;
      v86.origin.double y = v28;
      v86.size.double width = v30;
      v86.size.double height = v32;
      CGRectGetMidY(v86);
      v70 = [(WFComposeViewController *)self traitCollection];
      [v70 displayScale];
      BSFloatRoundForScale();
      -[NSObject setFrame:](v33, "setFrame:", v56, v71, 24.0, 24.0);
    }
  }
LABEL_17:
}

void __41__WFComposeViewController_layoutIconView__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [WeakRetained findViewInNavigationBarWithName:@"_UINavigationBarTitleRenameTextField"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 resignFirstResponder];
  id v8 = objc_loadWeakRetained(v3);
  id v9 = [v10 presentationSourceItem];
  [v8 presentIconPickerWithSourceItem:v9];
}

void __41__WFComposeViewController_layoutIconView__block_invoke_2(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_3;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.07];
}

void __41__WFComposeViewController_layoutIconView__block_invoke_4(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_5;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.3];
}

void __41__WFComposeViewController_layoutIconView__block_invoke_6(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_7;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.3];
}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.5];
}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.5];
}

- (void)updateDocumentMenuWithTitle:(id)a3 navigationItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WFComposeViewController *)self usesDocumentMenu]
    || [(WFComposeViewController *)self suppressDocumentMenuUpdates])
  {
    goto LABEL_31;
  }
  id v8 = [(WFComposeViewController *)self findViewInNavigationBarWithName:@"_UINavigationBarTitleControl"];
  if (v8)
  {
    id v9 = [(WFComposeViewController *)self findViewInView:v8 withName:@"UILabel"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;

    CGFloat v28 = [v11 text];
  }
  else
  {
    CGFloat v28 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    id v12 = [(WFComposeViewController *)self workflow];
    id v13 = [v12 name];
    uint64_t v14 = [@"‌        ‌" stringByAppendingString:v13];

LABEL_19:
    goto LABEL_20;
  }
  id v15 = [(WFComposeViewController *)self workflow];
  if ([v15 isUntitled])
  {
    uint64_t v16 = [(WFComposeViewController *)self placeholderName];

    if (v16)
    {
      id v12 = [(WFComposeViewController *)self placeholderName];
      LOBYTE(v16) = 1;
      goto LABEL_18;
    }
  }
  else
  {

    LOBYTE(v16) = 0;
  }
  id v12 = v6;
LABEL_18:
  uint64_t v14 = [@"‌        ‌" stringByAppendingString:v12];
  if (v16) {
    goto LABEL_19;
  }
LABEL_20:
  [v7 setTitle:v14];
  double v17 = objc_opt_new();
  [v7 setStandardAppearance:v17];
  [v7 setScrollEdgeAppearance:v17];
  objc_initWeak(&location, self);
  id v18 = objc_initWeak(&from, v7);
  [(WFComposeViewController *)self setDocumentMenuControlWithTitle:v6 navigationItem:v7];

  [v7 setRenameDelegate:self];
  id v19 = objc_loadWeakRetained(&location);
  double v20 = [v19 findViewInNavigationBarWithName:@"_UINavigationBarTitleRenameTextField"];

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = v21;

  [v22 setClearButtonMode:3];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke;
  v29[3] = &unk_2649CB408;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  v29[4] = self;
  [v7 setTitleMenuProvider:v29];
  char v23 = [v28 isEqualToString:v14];
  if (v8) {
    char v24 = v23;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    double v25 = [(WFComposeViewController *)self editorViewController];
    CGFloat v26 = [v25 navigationItem];
    double v27 = [v26 navigationBar];

    [v27 setNeedsLayout];
    [v27 layoutIfNeeded];
    [(WFComposeViewController *)self layoutIconView];
  }
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_31:
}

id __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke(id *a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v40 = a2;
  id v2 = (void *)MEMORY[0x263F823D0];
  id v3 = WFLocalizedString(@"Duplicate");
  double v4 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.rectangle.on.rectangle"];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2;
  v65[3] = &unk_2649CB390;
  objc_copyWeak(&v66, a1 + 5);
  double v43 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:v65];

  double v5 = (void *)MEMORY[0x263F823D0];
  id v6 = WFLocalizedString(@"Choose Icon");
  id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"app.dashed"];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_328;
  v63[3] = &unk_2649CB390;
  objc_copyWeak(&v64, a1 + 5);
  double v45 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v63];

  id v8 = (void *)MEMORY[0x263F823D0];
  id v9 = WFLocalizedString(@"Move");
  id v10 = [MEMORY[0x263F827E8] systemImageNamed:@"folder"];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2_338;
  v61[3] = &unk_2649CB390;
  objc_copyWeak(&v62, a1 + 5);
  double v44 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:v61];

  id v11 = (void *)MEMORY[0x263F823D0];
  id v12 = WFLocalizedString(@"Add to Home Screen");
  id v13 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.app"];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3_345;
  v59[3] = &unk_2649CB390;
  objc_copyWeak(&v60, a1 + 5);
  double v41 = [v11 actionWithTitle:v12 image:v13 identifier:0 handler:v59];

  uint64_t v14 = (void *)MEMORY[0x263F823D0];
  id v15 = WFLocalizedString(@"Export File");
  uint64_t v16 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up.on.square"];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_4;
  v56[3] = &unk_2649CB3E0;
  objc_copyWeak(&v57, a1 + 5);
  objc_copyWeak(&v58, a1 + 6);
  v42 = [v14 actionWithTitle:v15 image:v16 identifier:0 handler:v56];

  double v17 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v40;
  uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = v21;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          char v23 = [v22 children];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v68 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v49 != v25) {
                  objc_enumerationMutation(v23);
                }
                [v17 addObject:*(void *)(*((void *)&v48 + 1) + 8 * j)];
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v68 count:16];
            }
            while (v24);
          }
        }
        else
        {
          [v17 addObject:v21];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
    }
    while (v18);
  }

  [v17 addObject:v45];
  double v27 = [a1[4] workflow];
  CGFloat v28 = [v27 reference];
  BOOL v29 = v28 == 0;

  if (!v29)
  {
    [v17 addObject:v43];
    [v17 addObject:v44];
  }
  id v30 = objc_opt_new();
  id v31 = [MEMORY[0x263F82940] menuWithTitle:&stru_26E1A5FC0 image:0 identifier:0 options:1 children:v17];
  [v30 addObject:v31];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if ([WeakRetained shouldShowShareButton])
  {
    v33 = [a1[4] workflow];
    double v34 = [v33 reference];
    BOOL v35 = v34 == 0;

    if (v35) {
      goto LABEL_24;
    }
    double v36 = (void *)MEMORY[0x263F82940];
    v67[0] = v41;
    v67[1] = v42;
    double v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
    id WeakRetained = [v36 menuWithTitle:&stru_26E1A5FC0 image:0 identifier:0 options:1 children:v37];

    [v30 addObject:WeakRetained];
  }

LABEL_24:
  double v38 = [MEMORY[0x263F82940] menuWithChildren:v30];

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);

  return v38;
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained database];
  id v4 = objc_loadWeakRetained(v1);
  double v5 = [v4 workflow];
  id v6 = [v5 reference];
  id v14 = 0;
  id v7 = [v3 duplicateReference:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    id v9 = objc_loadWeakRetained(v1);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3;
    v11[3] = &unk_2649CB368;
    objc_copyWeak(&v13, v1);
    id v12 = v7;
    [v9 dismissViewControllerAnimated:1 completion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    id v10 = getWFEditorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[WFComposeViewController updateDocumentMenuWithTitle:navigationItem:]_block_invoke_2";
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_ERROR, "%s Unable to duplicate workflow in editor: %@", buf, 0x16u);
    }
  }
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_328(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentIconPickerWithSourceItem:0];
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2_338(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained moveCoordinator];
  id v4 = objc_loadWeakRetained(v1);
  double v5 = [v4 workflow];
  id v6 = [v5 reference];
  v9[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v8 = objc_loadWeakRetained(v1);
  [v3 move:v7 presentingViewController:v8 source:10];
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3_345(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentAddToHomeScreen];
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained findViewInNavigationBarWithName:@"_UINavigationBarTitleControl"];

  [v4 bounds];
  if (v4)
  {
    double v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    id v12 = v8;
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [v13 navigationBar];

    id v14 = objc_loadWeakRetained(v2);
    if ([v14 needsAdditionalSpaceInNavBar]) {
      double v9 = 100.0;
    }
    else {
      double v9 = 170.0;
    }
    id v11 = 0;
    uint64_t v10 = 0x4046000000000000;

    id v12 = 0;
  }
  id v15 = [MEMORY[0x263F336E8] alertWithPreferredStyle:1];
  uint64_t v16 = [MEMORY[0x263F87988] sourceWithView:0];
  [v15 setPresentationSource:v16];

  __int16 v17 = WFLocalizedString(@"Create iCloud Link");
  [v15 setTitle:v17];

  id v18 = WFLocalizedString(@"When you export a shortcut file for anyone, Apple will validate a copy of your shortcut using iCloud.");
  [v15 setMessage:v18];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_5;
  aBlock[3] = &unk_2649CB3B8;
  objc_copyWeak(v38, v2);
  id v19 = v4;
  id v37 = v19;
  v38[1] = *(id *)&v9;
  v38[2] = (id)v10;
  v38[3] = v11;
  v38[4] = v12;
  double v20 = _Block_copy(aBlock);
  uint64_t v21 = (void *)MEMORY[0x263F336F0];
  id v22 = WFLocalizedString(@"Anyone");
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_6;
  v34[3] = &unk_2649CBAD8;
  id v23 = v20;
  id v35 = v23;
  uint64_t v24 = [v21 buttonWithTitle:v22 style:0 preferred:0 handler:v34];

  uint64_t v25 = (void *)MEMORY[0x263F336F0];
  CGFloat v26 = WFLocalizedString(@"People Who Know Me");
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_7;
  v32[3] = &unk_2649CBAD8;
  id v27 = v23;
  id v33 = v27;
  CGFloat v28 = [v25 buttonWithTitle:v26 style:0 preferred:0 handler:v32];

  [v15 addButton:v24];
  [v15 addButton:v28];
  BOOL v29 = [MEMORY[0x263F336F0] cancelButtonWithHandler:0];
  [v15 addButton:v29];

  id v30 = objc_loadWeakRetained(v2);
  id v31 = WFUserInterfaceFromViewController();
  [v31 presentAlert:v15];

  objc_destroyWeak(v38);
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained activityControllerWithFileActivity:0 sender:0];

  [v8 setSelectedMode:1];
  [v8 setSelectedDestination:a2];
  [v8 _customizationsDidChange];
  uint64_t v6 = [v8 popoverPresentationController];
  [v6 setCanOverlapSourceViewRect:1];
  [v6 setSourceView:*(void *)(a1 + 32)];
  objc_msgSend(v6, "setSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v7 = objc_loadWeakRetained(v4);
  [v7 presentViewController:v8 animated:1 completion:0];
}

uint64_t __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained editorDocumentMenuDelegate];
  [v3 documentMenuDidDuplicateWorkflow:*(void *)(a1 + 32)];

  id v8 = objc_alloc_init(MEMORY[0x263F868B8]);
  id v4 = objc_loadWeakRetained(v2);
  double v5 = [v4 workflow];
  uint64_t v6 = [v5 actions];
  objc_msgSend(v8, "setActionCount:", objc_msgSend(v6, "count"));

  [v8 setShortcutSource:@"ShortcutSourceEditorDocumentMenu"];
  [v8 track];
}

- (id)activityControllerWithFileActivity:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  double v9 = [(WFComposeViewController *)self workflow];
  uint64_t v10 = [v9 reference];

  if (v10)
  {
    id v11 = [WFAddToHomeScreenActivity alloc];
    id v12 = [(WFComposeViewController *)self workflow];
    id v13 = [v12 reference];
    id v14 = [(WFAddToHomeScreenActivity *)v11 initWithReference:v13];

    [v8 addObject:v14];
  }
  if ([MEMORY[0x263F86E70] shortcutFileSharingEnabled])
  {
    id v15 = [WFWorkflowFileActivity alloc];
    uint64_t v16 = -[WFWorkflowFileActivity initWithSourceView:sourceRect:barButtonItem:](v15, "initWithSourceView:sourceRect:barButtonItem:", 0, v7, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));

    id v6 = (id)v16;
    [v8 addObject:v16];
  }
  __int16 v17 = [WFWorkflowActivityViewController alloc];
  id v18 = [(WFComposeViewController *)self workflow];
  id v19 = [(WFWorkflowActivityViewController *)v17 initWithWorkflow:v18 applicationActivities:v8];

  return v19;
}

- (Class)triggerInputType
{
  return 0;
}

- (void)shareWorkflowWithSender:(id)a3
{
  id v4 = a3;
  double v5 = [(WFComposeViewController *)self activityControllerWithFileActivity:0 sender:v4];
  id v6 = [v5 popoverPresentationController];
  [v6 setBarButtonItem:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__WFComposeViewController_shareWorkflowWithSender___block_invoke;
  v8[3] = &unk_2649CC018;
  id v9 = 0;
  id v7 = v5;
  id v10 = v7;
  [(WFComposeViewController *)self presentViewController:v7 animated:1 completion:v8];
}

void __51__WFComposeViewController_shareWorkflowWithSender___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) popoverPresentationController];
  objc_msgSend(*(id *)(a1 + 32), "setArrowDirection:", objc_msgSend(v2, "arrowDirection"));
}

- (WFWorkflowSettingsViewController)settingsViewController
{
  p_settingsViewController = &self->_settingsViewController;
  id v4 = self->_settingsViewController;
  if (!v4)
  {
    double v5 = [WFWorkflowSettingsViewController alloc];
    id v6 = [(WFComposeViewController *)self workflow];
    id v7 = [(WFComposeViewController *)self database];
    id v4 = [(WFWorkflowSettingsViewController *)v5 initWithWorkflow:v6 database:v7 hideNavigationBar:1];

    [(WFWorkflowSettingsViewController *)v4 setDelegate:self];
    objc_storeStrong((id *)p_settingsViewController, v4);
  }
  return v4;
}

- (void)presentSettingsViewController
{
  id v4 = [(WFComposeViewController *)self workflow];
  id v3 = [(WFComposeViewController *)self database];
  WFPresentWorkflowSettingsViewController(v4, v3, self, self);
}

- (id)cancelBarButtonItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel_];
  id v3 = WFLocalizedString(@"Cancels editing the shortcut");
  [v2 setAccessibilityHint:v3];

  return v2;
}

- (BOOL)needsAdditionalSpaceInNavBar
{
  id v3 = [(WFComposeViewController *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  BOOL result = v4 == 2
        && ([(WFComposeViewController *)self view],
            double v5 = objc_claimAutoreleasedReturnValue(),
            [v5 bounds],
            double v7 = v6,
            v5,
            v7 < 1100.0)
        || v4 == 1;
  return result;
}

- (BOOL)usesDocumentMenu
{
  if (![(WFComposeViewController *)self displaysInlineRenameInHeader]) {
    return 0;
  }
  id v3 = [(WFComposeViewController *)self presenter];
  uint64_t v4 = [v3 presentingViewControllerForComposeViewController:self];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)displaysInlineRenameInHeader
{
  return ([(WFComposeViewController *)self navigationUpdateBehavior] >> 3) & 1;
}

- (BOOL)isNewShortcutFlow
{
  id v3 = [(WFComposeViewController *)self workflow];
  if ([v3 isUntitled])
  {
    uint64_t v4 = [(WFComposeViewController *)self flowController];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)placeholderName
{
  id v3 = [(WFComposeViewController *)self workflow];
  uint64_t v4 = [v3 actions];
  BOOL v5 = [v4 lastObject];

  double v6 = [(WFComposeViewController *)self workflow];
  double v7 = [v6 actionsGroupedWithAction:v5];

  id v8 = [v7 firstObject];
  id v9 = v8;
  id v10 = 0;
  if (v5 && v7 && v8)
  {
    id v10 = [v8 localizedName];
  }

  return v10;
}

- (id)doneBarButtonItem
{
  BOOL v3 = [(WFComposeViewController *)self isNewShortcutFlow];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = WFLocalizedString(@"Next");
    double v6 = (void *)[v4 initWithTitle:v5 style:2 target:self action:sel_didTapNext];

    double v7 = WFLocalizedString(@"Goes to shortcut name set up step");
    [v6 setAccessibilityHint:v7];

    id v8 = [(WFComposeViewController *)self flowController];
    uint64_t v9 = [v8 workflowHasContent];
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone_];
    id v10 = WFLocalizedString(@"Closes the shortcut");
    [v8 setAccessibilityHint:v10];

    uint64_t v9 = 1;
    double v6 = v8;
  }
  [v6 setEnabled:v9];
  if (v3) {

  }
  [v6 setSpringLoaded:1];
  return v6;
}

- (void)adjustLargeTitleSize
{
  BOOL v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835E0]];
  id v4 = (void *)MEMORY[0x263F81708];
  id v33 = v3;
  [v3 pointSize];
  BOOL v5 = objc_msgSend(v4, "systemFontOfSize:weight:");
  double v6 = [(WFComposeViewController *)self editorViewController];
  double v7 = [v6 navigationController];
  id v8 = [v7 navigationBar];

  uint64_t v9 = [(WFComposeViewController *)self drawerHostingViewController];
  id v10 = [v9 navigationController];
  id v11 = [v10 navigationBar];

  id v12 = [(WFComposeViewController *)self editorViewController];
  id v13 = [v12 navigationItem];
  id v14 = [v13 title];

  id v15 = [(WFComposeViewController *)self editorViewController];
  uint64_t v16 = [v15 navigationItem];
  __int16 v17 = [v16 _largeTitleAccessoryView];
  [v17 frame];
  double v19 = v18;

  [v8 frame];
  double v21 = v20;
  id v22 = [v8 largeTitleTextAttributes];
  id v23 = (void *)[v22 mutableCopy];
  uint64_t v24 = v23;
  if (v23) {
    id v25 = v23;
  }
  else {
    id v25 = (id)objc_opt_new();
  }
  CGFloat v26 = v25;

  uint64_t v27 = *MEMORY[0x263F814F0];
  [v26 setObject:v5 forKeyedSubscript:*MEMORY[0x263F814F0]];
  [v14 sizeWithAttributes:v26];
  double v29 = v21 - v19;
  while (v28 > v29)
  {
    [v5 pointSize];
    if (v30 <= 18.0) {
      break;
    }
    [v5 pointSize];
    uint64_t v32 = [v5 fontWithSize:v31 + -4.0];

    [v26 setObject:v32 forKeyedSubscript:v27];
    [v14 sizeWithAttributes:v26];
    BOOL v5 = (void *)v32;
  }
  [v8 setLargeTitleTextAttributes:v26];
  [v11 setLargeTitleTextAttributes:v26];
}

- (void)updateNavigationBarStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v48[1] = *MEMORY[0x263EF8340];
  [(WFComposeViewController *)self updateBackActionForDocumentMenu];
  if ([(WFComposeViewController *)self isRenameSessionActive]
    || [(WFComposeViewController *)self suppressDocumentMenuUpdates])
  {
    return;
  }
  BOOL v5 = [(WFComposeViewController *)self workflow];
  double v6 = [v5 name];

  if ([(WFComposeViewController *)self visibleToolbarPlacement] == 2)
  {
    CGFloat v46 = v6;
    double v7 = [(WFComposeViewController *)self toolbar];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    uint64_t v9 = [v7 runItems];
    id v10 = [v9 reverseObjectEnumerator];
    id v11 = [v10 allObjects];

    id v12 = objc_opt_new();
    id v13 = objc_opt_new();
    if (([(WFComposeViewController *)self navigationUpdateBehavior] & 4) != 0)
    {
      [v12 addObject:v8];
      [v12 addObject:v8];
      [v12 addObject:v8];
      id v23 = [v7 undoRedoItems];
      [v12 addObjectsFromArray:v23];

      uint64_t v16 = [(WFComposeViewController *)self doneBarButtonItem];
      if (v16) {
        [v13 addObject:v16];
      }
      [v13 addObjectsFromArray:v11];
      id v17 = v12;
    }
    else
    {
      [v13 addObject:v8];
      [v13 addObjectsFromArray:v11];
      if (![(WFComposeViewController *)self needsAdditionalSpaceInNavBar])
      {
        [v13 addObject:v8];
        [v13 addObject:v8];
        [v13 addObject:v8];
      }
      id v14 = objc_msgSend(v7, "undoRedoItemsWithSpacer:", -[WFComposeViewController needsAdditionalSpaceInNavBar](self, "needsAdditionalSpaceInNavBar") ^ 1);
      id v15 = [v14 reverseObjectEnumerator];
      uint64_t v16 = [v15 allObjects];

      [v13 addObjectsFromArray:v16];
      id v17 = 0;
    }

    double v6 = v46;
    goto LABEL_37;
  }
  unint64_t v18 = [(WFComposeViewController *)self editingState];
  switch(v18)
  {
    case 2uLL:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        uint64_t v24 = [(WFComposeViewController *)self doneBarButtonItem];
        id v25 = (void *)v24;
        if (v24)
        {
          uint64_t v47 = v24;
          id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
        }
        else
        {
          id v13 = 0;
        }

        goto LABEL_29;
      }
      break;
    case 1uLL:
      id v17 = (id)objc_opt_new();
      if (_os_feature_enabled_impl())
      {
        id v13 = 0;
      }
      else
      {
        CGFloat v26 = [(WFComposeViewController *)self doneBarButtonItem];
        if (v26)
        {
          id v13 = [MEMORY[0x263EFF980] arrayWithObject:v26];
        }
        else
        {
          id v13 = 0;
        }
      }
      if ([(WFComposeViewController *)self displaysInlineRenameInHeader])
      {
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
        [v17 addObject:v27];
      }
      else
      {
        double v28 = [(WFComposeViewController *)self workflow];
        int v29 = [v28 isUntitled];

        if (!v29) {
          goto LABEL_37;
        }
        uint64_t v27 = [(WFComposeViewController *)self cancelBarButtonItem];
        [v17 addObject:v27];
      }

      goto LABEL_37;
    case 0uLL:
      double v19 = (void *)MEMORY[0x263EFF8C0];
      double v20 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel_beginEditing];
      id v17 = [v19 arrayWithObject:v20];

      uint64_t v21 = [(WFComposeViewController *)self doneBarButtonItem];
      id v22 = (void *)v21;
      if (v21)
      {
        v48[0] = v21;
        id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
      }
      else
      {
        id v13 = 0;
      }

      goto LABEL_37;
  }
  id v13 = 0;
LABEL_29:
  id v17 = 0;
LABEL_37:
  double v30 = [(WFComposeViewController *)self presenter];
  double v31 = [v30 presentingViewControllerForComposeViewController:self];
  BOOL v32 = v31 == 0;

  if (v32)
  {
    double v34 = [(WFComposeViewController *)self navigationItem];
  }
  else
  {
    id v33 = [(WFComposeViewController *)self editorViewController];
    double v34 = [v33 navigationItem];
  }
  id v35 = [(WFComposeViewController *)self drawerHostingViewController];
  double v36 = [v35 navigationItem];

  if ([(WFComposeViewController *)self navigationUpdateBehavior])
  {
    if ([(WFComposeViewController *)self displaysInlineRenameInHeader]) {
      uint64_t v37 = 2;
    }
    else {
      uint64_t v37 = 0;
    }
    if ([(WFComposeViewController *)self visibleToolbarPlacement] == 1) {
      double v38 = v6;
    }
    else {
      double v38 = 0;
    }
    [v34 setTitle:v38];
    [(WFComposeViewController *)self updateTitleItemIfNeeded];
    [v34 setLargeTitleDisplayMode:v37];
    [v36 setLargeTitleDisplayMode:v37];
    [(WFComposeViewController *)self adjustLargeTitleSize];
  }
  [v34 setLeftItemsSupplementBackButton:1];
  double v39 = [v34 leftBarButtonItems];
  BOOL v40 = WFUIBarButtonItemsEqualToItems(v39, v17);

  if (!v40) {
    [v34 setLeftBarButtonItems:v17 animated:v3];
  }
  double v41 = [v34 rightBarButtonItems];
  BOOL v42 = WFUIBarButtonItemsEqualToItems(v41, v13);

  if (!v42) {
    [v34 setRightBarButtonItems:v13];
  }
  id v43 = objc_alloc(MEMORY[0x263F824A8]);
  double v44 = WFLocalizedString(@"Back");
  double v45 = (void *)[v43 initWithTitle:v44 style:0 target:0 action:0];

  [v34 setBackBarButtonItem:v45];
  [(WFComposeViewController *)self updateDocumentMenuWithTitle:v6 navigationItem:v34];
}

- (void)setEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  double v19 = (void (**)(void))a5;
  id v8 = [(WFComposeViewController *)self editingStates];
  if ([v8 count])
  {
    uint64_t v9 = [v8 count];
    id v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 replaceObjectAtIndex:v9 - 1 withObject:v10];
  }
  else
  {
    id v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 addObject:v10];
  }

  if (a3 != 2)
  {
    id v11 = [(WFComposeViewController *)self editorViewController];
    [v11 stop];
  }
  id v12 = [(WFComposeViewController *)self titleViewSettingsButton];
  [v12 setEnabled:a3 == 1];

  id v13 = [(WFComposeViewController *)self titleAccessorySettingsButton];
  [v13 setEnabled:a3 == 1];

  id v14 = [(WFComposeViewController *)self toolbar];
  [v14 setRunning:a3 == 2];

  id v15 = [(WFComposeViewController *)self drawerViewController];

  if (v15)
  {
    uint64_t v16 = [(WFComposeViewController *)self drawerViewController];
    id v17 = [v16 view];
    [v17 setUserInteractionEnabled:a3 == 1];
  }
  if (a3 != 1)
  {
    unint64_t v18 = [(WFComposeViewController *)self view];
    [v18 endEditing:1];
  }
  [(WFComposeViewController *)self updateNavigationBarStateAnimated:v5];
  if (v19) {
    v19[2]();
  }
}

- (void)updateEditingStateAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(WFComposeViewController *)self setEditingState:[(WFComposeViewController *)self editingState] animated:v4 completionHandler:v6];
}

- (void)popEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v12 = a5;
  id v8 = [(WFComposeViewController *)self editingStates];
  uint64_t v9 = [v8 lastObject];
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  char v11 = [v9 isEqualToNumber:v10];

  if (v11)
  {
    [v8 removeLastObject];
    [(WFComposeViewController *)self updateEditingStateAnimated:v5 completionHandler:v12];
  }
}

- (void)pushEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  id v8 = [(WFComposeViewController *)self editingStates];
  uint64_t v9 = [v8 lastObject];
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  char v11 = [v9 isEqualToNumber:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 addObject:v12];

    [(WFComposeViewController *)self updateEditingStateAnimated:v5 completionHandler:v13];
  }
}

- (unint64_t)editingState
{
  id v2 = [(WFComposeViewController *)self editingStates];
  BOOL v3 = [v2 lastObject];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)didTapCancel:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(WFComposeViewController *)self editorViewController];
  [v4 stop];

  BOOL v5 = [(WFComposeViewController *)self workflow];
  int v6 = [v5 isUntitled];

  if (v6)
  {
    double v7 = [(WFComposeViewController *)self flowController];
    [v7 startCancelFlowWithButton:v8];
  }
  else
  {
    [(WFComposeViewController *)self finishEditing];
  }
}

- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([(WFComposeViewController *)self isBeingDismissed] & 1) == 0)
  {
    int v6 = [(WFComposeViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 composeViewControllerRequestsDismissal:self forTutorial:v4 withCompletionHandler:v7];
    }
    else {
      [(WFComposeViewController *)self dismissViewControllerAnimated:1 completion:v7];
    }
  }
}

- (void)finishEditingAndDismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  int v6 = [(WFComposeViewController *)self view];
  [v6 endEditing:1];

  [(WFComposeViewController *)self dismissForTutorial:v4 completionHandler:v7];
}

- (void)finishEditing
{
}

- (void)beginEditing
{
}

- (void)didTapDone:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(WFComposeViewController *)self setSuppressDocumentMenuUpdates:1];
  BOOL v4 = [(WFComposeViewController *)self editorViewController];
  [v4 stop];

  if ([(WFComposeViewController *)self displaysInlineRenameInHeader])
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if ([(WFComposeViewController *)self willDeleteWhenClosed])
      {
        BOOL v5 = [(WFComposeViewController *)self database];
        int v6 = [(WFComposeViewController *)self workflow];
        id v7 = [v6 reference];
        id v34 = 0;
        [v5 deleteReference:v7 error:&v34];
        id v8 = v34;

        id v9 = objc_alloc_init(MEMORY[0x263F86A90]);
        id v10 = [(WFComposeViewController *)self workflow];
        char v11 = [v10 associatedAppBundleIdentifier];
        [v9 setAddToSiriBundleIdentifier:v11];

        id v12 = [(WFComposeViewController *)self workflow];
        id v13 = [v12 galleryIdentifier];
        [v9 setGalleryIdentifier:v13];

        id v14 = [(WFComposeViewController *)self workflow];
        id v15 = [v14 source];
        [v9 setShortcutSource:v15];

        [v9 track];
        if (v8)
        {
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __38__WFComposeViewController_didTapDone___block_invoke;
          v33[3] = &unk_2649CBF20;
          v33[4] = self;
          uint64_t v16 = [MEMORY[0x263F336E8] alertWithError:v8 confirmationHandler:v33];
          id v17 = WFUserInterfaceFromViewController();
          [v17 presentAlert:v16];

LABEL_21:
          return;
        }
      }
      id v8 = [(WFComposeViewController *)self placeholderName];
      unint64_t v18 = [(WFComposeViewController *)self workflow];
      int v19 = [v18 isUntitled];
      if (v8) {
        int v20 = v19;
      }
      else {
        int v20 = 0;
      }

      if (v20)
      {
        uint64_t v21 = [(WFComposeViewController *)self database];
        id v9 = [v21 suggestedWorkflowNameForName:v8];

        id v22 = [(WFComposeViewController *)self database];
        id v23 = [(WFComposeViewController *)self workflow];
        uint64_t v24 = [v23 reference];
        id v32 = 0;
        id v25 = [v22 renameReference:v24 to:v9 error:&v32];
        id v26 = v32;

        if (!v25)
        {
          double v31 = getWFEditorLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            double v36 = "-[WFComposeViewController didTapDone:]";
            __int16 v37 = 2112;
            id v38 = v9;
            __int16 v39 = 2112;
            id v40 = v26;
            _os_log_impl(&dword_22D994000, v31, OS_LOG_TYPE_ERROR, "%s Unable to save placeholder name %@ in editor: %@", buf, 0x20u);
          }

          goto LABEL_21;
        }
        uint64_t v27 = [(WFComposeViewController *)self workflow];
        [v27 setName:v9];

        double v28 = [(WFComposeViewController *)self workflow];
        [v28 save];
      }
    }
    if ([(WFComposeViewController *)self isEditingNewWorkflow])
    {
      int v29 = [(WFComposeViewController *)self workflow];
      double v30 = [v29 record];
      [v30 addWatchWorkflowTypeIfEligible];

      [(WFComposeViewController *)self setIsEditingNewWorkflow:0];
    }
  }
  [(WFComposeViewController *)self finishEditing];
}

uint64_t __38__WFComposeViewController_didTapDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishEditing];
}

- (void)didTapDone
{
}

- (BOOL)willDeleteWhenClosed
{
  if ([(WFComposeViewController *)self displaysInlineRenameInHeader])
  {
    BOOL v3 = [(WFComposeViewController *)self workflow];
    if ([v3 isUntitled]) {
      BOOL v4 = ![(WFComposeViewController *)self workflowHasContent];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)workflowHasContent
{
  BOOL v3 = [(WFComposeViewController *)self workflow];
  BOOL v4 = [v3 actions];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    int v6 = [(WFComposeViewController *)self workflow];
    id v7 = [v6 inputAction];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)didTapNext
{
  id v3 = [(WFComposeViewController *)self editorViewController];
  [v3 stop];

  id v4 = [(WFComposeViewController *)self flowController];
  [v4 startSaveFlow];
}

- (id)drawerHostingViewController
{
  id v2 = [(WFComposeViewController *)self drawerCoordinator];
  id v3 = [v2 inspectorPaneContainerViewController];

  return v3;
}

- (id)drawerViewController
{
  id v2 = [(WFComposeViewController *)self drawerCoordinator];
  id v3 = [v2 drawerViewController];

  return v3;
}

- (void)layoutSupplementaryViewsIfNeeded
{
  BOOL v3 = [(WFComposeViewController *)self shouldUseOverlaidDrawer];
  id v4 = [(WFComposeViewController *)self drawerCoordinator];
  id v13 = v4;
  if (v3)
  {
    if ([v4 presentationMode] != 1)
    {
      BOOL v5 = [(WFComposeViewController *)self presenter];
      uint64_t v6 = [v5 presentingViewControllerForComposeViewController:self];
      id v7 = (void *)v6;
      if (v6) {
        id v8 = (WFComposeViewController *)v6;
      }
      else {
        id v8 = self;
      }
      id v9 = v8;

      id v10 = [(WFComposeViewController *)self toolbar];
      [v13 configureAsBottomSheetInParentViewController:v9 belowSubview:v10];

      if (_os_feature_enabled_impl())
      {
        char v11 = [(WFComposeViewController *)self presentedViewController];
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v12 = [v11 view];
          [v12 setHidden:1];

          [v11 dismissViewControllerAnimated:0 completion:0];
        }
        else
        {

          char v11 = 0;
        }
      }
    }
  }
  else if ([v4 presentationMode] != 2)
  {
    [v13 configureAsNavigationStackInParentViewController:self];
  }
  [(WFComposeViewController *)self updateToolbarVisibility];
  [(WFComposeViewController *)self updateShareButtonVisibility];
  [(WFComposeViewController *)self resetToolbar];
}

- (void)updateShareButtonVisibility
{
  uint64_t v3 = [(WFComposeViewController *)self shouldShowShareButton] ^ 1;
  id v4 = [(WFComposeViewController *)self toolbar];
  [v4 setShareHidden:v3];
}

- (void)updateToolbarVisibility
{
  if ([(WFComposeViewController *)self visibleToolbarPlacement] != 1) {
    return;
  }
  BOOL v4 = [(WFComposeViewController *)self shouldUseOverlaidDrawer];
  if (v4)
  {
    id v2 = [(WFComposeViewController *)self drawerCoordinator];
    if ([v2 visibility] == 3)
    {
      BOOL v5 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  BOOL v5 = [(WFComposeViewController *)self visibleToolbarPlacement] == 2;
  if (v4) {
    goto LABEL_6;
  }
LABEL_7:
  double v6 = 0.15;
  if (v5) {
    double v6 = 0.1;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__WFComposeViewController_updateToolbarVisibility__block_invoke;
  v8[3] = &unk_2649CBA30;
  if (v5) {
    uint64_t v7 = 0x10000;
  }
  else {
    uint64_t v7 = 0x20000;
  }
  void v8[4] = self;
  BOOL v9 = v5;
  [MEMORY[0x263F82E00] animateWithDuration:v7 delay:v8 options:0 animations:v6 completion:0.0];
}

void __50__WFComposeViewController_updateToolbarVisibility__block_invoke(uint64_t a1)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) toolbar];
    [v1 bounds];
    CGFloat Height = CGRectGetHeight(v9);
  }
  else
  {
    CGFloat Height = 0.0;
  }
  CGAffineTransformMakeTranslation(&v7, 0.0, Height);
  CGAffineTransform v8 = v7;
  BOOL v5 = [*(id *)(a1 + 32) toolbar];
  CGAffineTransform v6 = v8;
  [v5 setTransform:&v6];

  if (v3) {
}
  }

- (void)updateBottomContentInset
{
  id v21 = [(WFComposeViewController *)self drawerCoordinator];
  uint64_t v3 = [v21 presentationMode];

  double height = 0.0;
  if (v3 == 1)
  {
    id v22 = [(WFComposeViewController *)self drawerCoordinator];
    [v22 collapsedDrawerRect];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    id v23 = [(WFComposeViewController *)self editorViewController];
    id v13 = [v23 view];
    [v13 frame];
    v28.origin.double x = v14;
    v28.origin.double y = v15;
    v28.size.double width = v16;
    v28.size.double height = v17;
    v26.origin.double x = v6;
    v26.origin.double y = v8;
    v26.size.double width = v10;
    v26.size.double height = v12;
    CGRect v27 = CGRectIntersection(v26, v28);
    double height = v27.size.height;
  }
  id v24 = [(WFComposeViewController *)self view];
  [v24 safeAreaInsets];
  double v19 = v18;
  int v20 = [(WFComposeViewController *)self editorViewController];
  objc_msgSend(v20, "setAdditionalSafeAreaInsets:", 0.0, 0.0, height - v19, 0.0);
}

- (BOOL)shouldUseOverlaidDrawer
{
  id v2 = [(WFComposeViewController *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] != 2;

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v9 traitCollectionDidChange:v4];
  [(WFComposeViewController *)self updateNavigationBarStateAnimated:0];
  uint64_t v5 = [v4 horizontalSizeClass];
  CGFloat v6 = [(WFComposeViewController *)self traitCollection];
  uint64_t v7 = [v6 horizontalSizeClass];

  if (v5 != v7)
  {
    if ([(WFComposeViewController *)self isRenameSessionActive])
    {
      CGFloat v8 = [(WFComposeViewController *)self view];
      [v8 endEditing:1];
    }
    [(WFComposeViewController *)self layoutDocumentMenuControl];
    [(WFComposeViewController *)self setUpToolbar];
  }
  [(WFComposeViewController *)self updateToolbarVisibility];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(WFComposeViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(WFComposeViewController *)self userActivityManager];
  [v4 setActive:0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(WFComposeViewController *)self presenter];
  CGFloat v6 = [v5 presentingViewControllerForComposeViewController:self];

  if (v6)
  {
    [(WFComposeViewController *)self setUpToolbar];
    [(WFComposeViewController *)self updateNavigationBarStateAnimated:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(WFComposeViewController *)self userActivityManager];
  [v4 setActive:1];

  [(WFComposeViewController *)self updateShareButtonVisibility];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v4 viewDidLayoutSubviews];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WFComposeViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__WFComposeViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIconView];
}

- (void)viewWillLayoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v44 viewWillLayoutSubviews];
  BOOL v3 = [(WFComposeViewController *)self view];
  objc_super v4 = [(WFComposeViewController *)self separatorView];
  objc_super v5 = [(WFComposeViewController *)self workflowView];
  CGFloat v6 = [(WFComposeViewController *)self traitCollection];
  [v3 bounds];
  CGFloat rect = v7;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = [(WFComposeViewController *)self editorViewController];
  -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v14, v11, v13);
  double v16 = v15;
  double v18 = v17;

  double v19 = [MEMORY[0x263F82B60] mainScreen];
  [v19 scale];
  double v21 = v20;

  id v22 = [MEMORY[0x263F33718] sharedContext];
  int v23 = [v22 shouldReverseLayoutDirection];

  [(WFComposeViewController *)self layoutSupplementaryViewsIfNeeded];
  if ([(WFComposeViewController *)self visibleToolbarPlacement] == 1)
  {
    id v24 = [(WFComposeViewController *)self toolbar];
    [v24 bounds];
    double v26 = v25;
    CGRect v27 = [(WFComposeViewController *)self drawerCoordinator];
    [v27 setBottomInset:v26];
  }
  BOOL v28 = [(WFComposeViewController *)self displaysInlineRenameInHeader];
  int v29 = [(WFComposeViewController *)self drawerCoordinator];
  double v30 = v29;
  double v31 = 20.0;
  if (v28) {
    double v31 = 4.0;
  }
  [v29 setTopInset:v31];

  [(WFComposeViewController *)self updateNavigationBarStateAnimated:0];
  [(WFComposeViewController *)self updateBottomContentInset];
  if ([v6 horizontalSizeClass] == 2)
  {
    id v32 = [(WFComposeViewController *)self drawerHostingViewController];
    id v33 = [v32 navigationController];
    id v34 = [v33 view];

    -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v32, v11, v13);
    double v36 = v35;
    double v38 = v37;
    v45.origin.double x = v9;
    v45.origin.double y = rect;
    v45.size.double width = v11;
    v45.size.double height = v13;
    double Height = CGRectGetHeight(v45);
    if (v23) {
      double v40 = v36;
    }
    else {
      double v40 = v16;
    }
    objc_msgSend(v4, "setFrame:", v40, 0.0, 1.0 / v21, Height);
    double v41 = v16 + 1.0 / v21;
    if (v23) {
      double v41 = 0.0;
    }
    objc_msgSend(v34, "setFrame:", v41, 0.0, v36, v38);
    double v42 = 1.0 / v21 + v36;
    if (!v23) {
      double v42 = 0.0;
    }
    objc_msgSend(v5, "setFrame:", v42, 0.0, v16, v18);
    [v4 setHidden:0];
    [(WFComposeViewController *)self layoutTitleView];
  }
  else
  {
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v16, v18);
    objc_msgSend(v4, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v4 setHidden:1];
  }
}

- (unint64_t)visibleToolbarPlacement
{
  id v2 = [(WFComposeViewController *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];

  if (v3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)updateTitleItemIfNeeded
{
  char v3 = [(WFComposeViewController *)self navigationUpdateBehavior];
  if ((v3 & 1) != 0 && [(WFComposeViewController *)self displaysInlineRenameInHeader])
  {
    id v26 = [(WFComposeViewController *)self drawerHostingViewController];
    objc_super v4 = [v26 navigationItem];
    objc_super v5 = [v4 titleView];

    if (!v5)
    {
      CGRect v27 = [[WFDrawerNavigationBarTitleView alloc] initWithDelegate:self showsDetailsButton:[(WFComposeViewController *)self showsDetailsButton]];
      CGFloat v6 = [(WFComposeViewController *)self drawerHostingViewController];
      double v7 = [v6 navigationItem];
      [v7 setTitleView:v27];
    }
    id v28 = (id)objc_opt_new();
    double v8 = [(WFComposeViewController *)self editorViewController];
    CGFloat v9 = [v8 navigationItem];
    [v9 setScrollEdgeAppearance:v28];

    double v10 = [(WFComposeViewController *)self editorViewController];
    double v11 = [v10 navigationItem];
    [v11 setCompactScrollEdgeAppearance:v28];
    goto LABEL_11;
  }
  unint64_t v12 = [(WFComposeViewController *)self visibleToolbarPlacement];
  if (v12 == 1)
  {
    id v28 = [(WFComposeViewController *)self editorViewController];
    double v10 = [v28 navigationItem];
    double v11 = [(WFComposeViewController *)self titleAccessorySettingsButton];
    [v10 _setLargeTitleAccessoryView:v11 alignToBaseline:0];
LABEL_11:

    goto LABEL_12;
  }
  if (v12 != 2 || (v3 & 1) == 0) {
    return;
  }
  double v13 = [(WFComposeViewController *)self workflow];
  id v28 = [v13 name];

  CGFloat v14 = [(WFComposeViewController *)self titleViewLabel];
  double v15 = [v14 text];
  int v16 = [v28 isEqualToString:v15];

  if (v16)
  {
    double v17 = [(WFComposeViewController *)self editorViewController];
    double v18 = [v17 navigationItem];
    double v19 = [v18 titleView];
    if (v19)
    {
      double v20 = [(WFComposeViewController *)self editorViewController];
      double v21 = [v20 navigationController];
      id v22 = [v21 navigationBar];
      int v23 = [v22 _defaultTitleFont];
      id v24 = [(WFComposeViewController *)self titleViewLabel];
      double v25 = [v24 font];

      if (v23 == v25) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  [(WFComposeViewController *)self updateTitleView:v28];
  [(WFComposeViewController *)self layoutTitleView];
LABEL_12:
}

- (id)workflowView
{
  char v3 = [(WFComposeViewController *)self presenter];
  objc_super v4 = [v3 presentingViewControllerForComposeViewController:self];

  objc_super v5 = [(WFComposeViewController *)self editorViewController];
  CGFloat v6 = v5;
  if (v4)
  {
    double v7 = [v5 navigationController];
    double v8 = [v7 view];
  }
  else
  {
    double v8 = [v5 view];
  }

  return v8;
}

- (UIButton)titleAccessorySettingsButton
{
  titleAccessorySettingsButton = self->_titleAccessorySettingsButton;
  if (titleAccessorySettingsButton)
  {
    char v3 = titleAccessorySettingsButton;
  }
  else
  {
    objc_super v5 = [MEMORY[0x263F82818] configurationWithPointSize:30.0];
    CGFloat v6 = [(WFComposeViewController *)self settingsButtonWithConfiguration:v5];
    double v7 = self->_titleAccessorySettingsButton;
    self->_titleAccessorySettingsButton = v6;
    double v8 = v6;

    char v3 = self->_titleAccessorySettingsButton;
  }
  return v3;
}

- (void)layoutTitleView
{
  char v3 = [(WFComposeViewController *)self navigationController];
  id v22 = [v3 navigationBar];

  objc_super v4 = [v22 topItem];
  objc_super v5 = [v4 titleView];

  CGFloat v6 = [(WFComposeViewController *)self titleViewLabel];
  double v7 = [(WFComposeViewController *)self titleViewSettingsButton];
  [v7 sizeToFit];
  [v22 sizeToFit];
  [v6 sizeToFit];
  [v22 frame];
  double v9 = v8;
  [v6 frame];
  objc_msgSend(v6, "setFrame:");
  [v7 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v6 frame];
  objc_msgSend(v7, "setFrame:", v16 + 8.0, v11, v13, v15);
  [v7 center];
  double v18 = v17;
  [v6 center];
  [v7 setCenter:v18];
  [v6 frame];
  double v20 = v19;
  [v7 frame];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v20 + 8.0 + v21, v9);
}

- (void)updateTitleView:(id)a3
{
  id v20 = a3;
  id v4 = objc_alloc(MEMORY[0x263F828E0]);
  objc_super v5 = (double *)MEMORY[0x263F001A8];
  CGFloat v6 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UILabel *)v6 setText:v20];
  double v7 = [(WFComposeViewController *)self editorViewController];
  double v8 = [v7 navigationController];
  double v9 = [v8 navigationBar];
  double v10 = [v9 _defaultTitleFont];

  [(UILabel *)v6 setFont:v10];
  double v11 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v6 setTextColor:v11];

  double v12 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  double v13 = [(WFComposeViewController *)self settingsButtonWithConfiguration:v12];
  double v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", *v5, v5[1], v5[2], v5[3]);
  [v14 addSubview:v6];
  [v14 addSubview:v13];
  double v15 = [(WFComposeViewController *)self editorViewController];
  double v16 = [v15 navigationItem];
  [v16 setTitleView:v14];

  titleViewLabel = self->_titleViewLabel;
  self->_titleViewLabel = v6;
  double v18 = v6;

  titleViewSettingsButton = self->_titleViewSettingsButton;
  self->_titleViewSettingsButton = v13;
}

- (unint64_t)navigationUpdateBehavior
{
  return 11;
}

- (id)settingsButtonWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F824E8] buttonWithType:0];
  CGFloat v6 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle.fill" withConfiguration:v4];
  [v5 setImage:v6 forState:0];

  double v7 = WFLocalizedString(@"Details");
  [v5 setAccessibilityLabel:v7];

  [v5 setAccessibilityIdentifier:@"shortcut_details_button"];
  [v5 addTarget:self action:sel_presentSettingsViewController forControlEvents:64];

  return v5;
}

- (void)setUpToolbar
{
  v60[3] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WFComposeViewController *)self visibleToolbarPlacement];
  if (v3 == 1)
  {
    double v16 = [(WFComposeViewController *)self editorViewController];
    double v17 = [v16 navigationItem];
    [v17 setRightBarButtonItems:0];

    if ([(WFComposeViewController *)self navigationUpdateBehavior])
    {
      double v18 = [(WFComposeViewController *)self editorViewController];
      double v19 = [v18 navigationItem];
      [v19 setTitleView:0];

      id v20 = [(WFComposeViewController *)self drawerHostingViewController];
      double v21 = [v20 navigationItem];
      [v21 setTitleView:0];

      id v22 = [(WFComposeViewController *)self editorViewController];
      int v23 = [v22 navigationController];
      id v24 = [v23 navigationBar];
      [v24 setPrefersLargeTitles:1];
    }
    double v25 = [(WFComposeViewController *)self toolbar];
    [v25 removeFromSuperview];

    id v26 = objc_alloc(MEMORY[0x263F86600]);
    BOOL v27 = [(WFComposeViewController *)self showsDetailsButton];
    id v28 = [(WFComposeViewController *)self workflow];
    int v29 = (void *)[v26 initShowingDetailsButton:v27 workflow:v28];

    long long v51 = v29;
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&self->_toolbar, v29);
    double v30 = [(WFComposeViewController *)self presenter];
    double v31 = [v30 presentingViewControllerForComposeViewController:self];

    id v58 = v31;
    id v32 = [v31 view];
    id v33 = v32;
    if (v32)
    {
      id v56 = v32;
    }
    else
    {
      id v56 = [(WFComposeViewController *)self view];
    }

    id v34 = [(WFComposeViewController *)self toolbar];
    [v56 addSubview:v34];

    if (v56)
    {
      id v59 = v56;
    }
    else
    {
      double v35 = [(WFComposeViewController *)self editorViewController];
      id v59 = [v35 view];
    }
    double v36 = (void *)MEMORY[0x263F08938];
    long long v55 = [(WFComposeViewController *)self toolbar];
    id v57 = [v55 leadingAnchor];
    long long v54 = [v59 leadingAnchor];
    long long v53 = objc_msgSend(v57, "constraintEqualToAnchor:");
    v60[0] = v53;
    long long v52 = [(WFComposeViewController *)self toolbar];
    double v37 = [v52 trailingAnchor];
    double v38 = [v59 trailingAnchor];
    __int16 v39 = [v37 constraintEqualToAnchor:v38];
    v60[1] = v39;
    double v40 = [(WFComposeViewController *)self toolbar];
    double v41 = [v40 bottomAnchor];
    double v42 = [v59 bottomAnchor];
    id v43 = [v41 constraintEqualToAnchor:v42];
    v60[2] = v43;
    objc_super v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
    [v36 activateConstraints:v44];

    CGRect v45 = [v58 view];
    [v45 setNeedsLayout];

    CGFloat v46 = [v58 view];
    [v46 layoutIfNeeded];

    uint64_t v47 = [(WFComposeViewController *)self toolbar];
    [v47 frame];
    double v49 = v48;
    long long v50 = [(WFComposeViewController *)self drawerCoordinator];
    [v50 setBottomInset:v49];
  }
  else if (v3 == 2)
  {
    id v4 = [(WFComposeViewController *)self toolbar];
    [v4 removeFromSuperview];

    id v5 = objc_alloc(MEMORY[0x263F86600]);
    BOOL v6 = [(WFComposeViewController *)self showsDetailsButton];
    double v7 = [(WFComposeViewController *)self workflow];
    double v8 = (WFRunWorkflowToolbar *)[v5 initShowingDetailsButton:v6 workflow:v7];
    toolbar = self->_toolbar;
    self->_toolbar = v8;

    if ([(WFComposeViewController *)self navigationUpdateBehavior])
    {
      double v10 = [(WFComposeViewController *)self editorViewController];
      double v11 = [v10 navigationController];
      double v12 = [v11 navigationBar];
      [v12 setPrefersLargeTitles:0];

      double v13 = [(WFComposeViewController *)self drawerHostingViewController];
      double v14 = [v13 navigationController];
      double v15 = [v14 navigationBar];
      [v15 setPrefersLargeTitles:0];
    }
  }
  [(WFComposeViewController *)self updateShareButtonVisibility];
  [(WFComposeViewController *)self resetToolbar];
}

- (BOOL)showsDetailsButton
{
  id v2 = [(WFComposeViewController *)self home];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)dealloc
{
  if ([(WFComposeViewController *)self isViewLoaded])
  {
    BOOL v3 = [(WFComposeViewController *)self workflow];
    [v3 removeObserver:self forKeyPath:@"name" context:WFWorkflowNameContext];

    id v4 = [(WFComposeViewController *)self workflow];
    [v4 removeObserver:self forKeyPath:@"reference" context:WFWorkflowReferenceContext];

    id v5 = [(WFComposeViewController *)self workflow];
    [v5 removeObserver:self forKeyPath:@"actions" context:WFWorkflowActionsContext];

    BOOL v6 = [(WFComposeViewController *)self workflow];
    [v6 removeObserver:self forKeyPath:@"deleted" context:WFWorkflowDeletedContext];

    double v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self];
  }
  v8.receiver = self;
  v8.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v8 dealloc];
}

- (void)loadView
{
  v35.receiver = self;
  v35.super_class = (Class)WFComposeViewController;
  [(WFComposeViewController *)&v35 loadView];
  BOOL v3 = [(WFComposeViewController *)self view];
  [v3 setClipsToBounds:1];

  id v4 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  id v5 = [(WFComposeViewController *)self view];
  [v5 setBackgroundColor:v4];

  BOOL v6 = [(WFComposeViewController *)self editorViewController];
  [v6 loadViewIfNeeded];

  uint64_t v7 = [(WFComposeViewController *)self database];
  if (!v7) {
    goto LABEL_9;
  }
  objc_super v8 = (void *)v7;
  flowController = [(WFComposeViewController *)self workflow];
  if ([flowController isUntitled])
  {
    BOOL v10 = [(WFComposeViewController *)self displaysInlineRenameInHeader];

    if (v10) {
      goto LABEL_9;
    }
    double v11 = [(WFComposeViewController *)self presenter];
    double v12 = [v11 presentingViewControllerForComposeViewController:self];

    if (v12)
    {
      double v13 = [(WFComposeViewController *)self editorViewController];
      uint64_t v14 = [v13 navigationController];

      objc_super v8 = (void *)v14;
    }
    else
    {
      objc_super v8 = [(WFComposeViewController *)self navigationController];
    }
    double v15 = [WFComposeFlowController alloc];
    double v16 = [(WFComposeViewController *)self database];
    double v17 = [(WFComposeViewController *)self workflow];
    double v18 = [(WFComposeFlowController *)v15 initWithPresenter:self navigationController:v8 database:v16 workflow:v17];

    [(WFComposeFlowController *)v18 setDelegate:self];
    flowController = self->_flowController;
    self->_flowController = v18;
  }

LABEL_9:
  double v19 = [(WFComposeViewController *)self presenter];
  id v20 = [v19 presentingViewControllerForComposeViewController:self];

  if (v20) {
    double v21 = [[WFComposeNavigationController alloc] initWithRootViewController:self->_editorViewController];
  }
  else {
    double v21 = self->_editorViewController;
  }
  id v22 = [(WFComposeNavigationController *)v21 view];
  [v22 setAccessibilityIdentifier:@"editor"];

  [(WFComposeViewController *)self addChildViewController:v21];
  int v23 = [(WFComposeViewController *)self view];
  id v24 = [(WFComposeNavigationController *)v21 view];
  [v23 addSubview:v24];

  [(WFComposeNavigationController *)v21 didMoveToParentViewController:self];
  id v25 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v26 = [MEMORY[0x263F825C8] separatorColor];
  [v25 setBackgroundColor:v26];

  BOOL v27 = [(WFComposeViewController *)self view];
  [v27 addSubview:v25];

  objc_storeWeak((id *)&self->_separatorView, v25);
  [(WFComposeViewController *)self updateTitleItemIfNeeded];
  id v28 = [(WFComposeViewController *)self presenter];
  int v29 = [v28 presentingViewControllerForComposeViewController:self];

  if (!v29)
  {
    [(WFComposeViewController *)self setUpToolbar];
    [(WFComposeViewController *)self layoutSupplementaryViewsIfNeeded];
  }
  double v30 = [(WFComposeViewController *)self workflow];
  [v30 addObserver:self forKeyPath:@"name" options:4 context:WFWorkflowNameContext];

  double v31 = [(WFComposeViewController *)self workflow];
  [v31 addObserver:self forKeyPath:@"reference" options:4 context:WFWorkflowReferenceContext];

  id v32 = [(WFComposeViewController *)self workflow];
  [v32 addObserver:self forKeyPath:@"actions" options:0 context:WFWorkflowActionsContext];

  id v33 = [(WFComposeViewController *)self workflow];
  [v33 addObserver:self forKeyPath:@"deleted" options:0 context:WFWorkflowDeletedContext];

  id v34 = [MEMORY[0x263F08A00] defaultCenter];
  [v34 addObserver:self selector:sel_applicationWillEnterForeground name:*MEMORY[0x263F833B8] object:0];
}

- (void)updateUserActivityState:(id)a3
{
  id v5 = a3;
  id v4 = [(WFComposeViewController *)self userActivityManager];
  [v4 updateUserActivityState:v5];
}

- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4 home:(id)a5 shouldShowShareButton:(BOOL)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    double v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"WFComposeViewController.mm", 133, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)WFComposeViewController;
  double v15 = [(WFComposeViewController *)&v38 init];
  double v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workflow, a3);
    objc_storeStrong((id *)&v16->_database, a4);
    objc_storeStrong((id *)&v16->_home, a5);
    v16->_shouldAnchorIconViewToRenameTextField = 0;
    v16->_suppressDocumentMenuUpdates = 0;
    v16->_shouldShowShareButton = a6;
    uint64_t v17 = objc_opt_new();
    undoManager = v16->_undoManager;
    v16->_undoManager = (NSUndoManager *)v17;

    double v19 = [WFMoveToFolderCoordinator alloc];
    id v20 = [(WFComposeViewController *)v16 database];
    uint64_t v21 = [(WFMoveToFolderCoordinator *)v19 initWithDatabase:v20];
    moveCoordinator = v16->_moveCoordinator;
    v16->_moveCoordinator = (WFMoveToFolderCoordinator *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F865B8]) initWithWorkflow:v12];
    editorViewController = v16->_editorViewController;
    v16->_editorViewController = (WFEditorViewController *)v23;

    [(WFEditorViewController *)v16->_editorViewController setDelegate:v16];
    [(WFEditorViewController *)v16->_editorViewController setAuxiliaryViewPresenter:v16];
    [(WFEditorViewController *)v16->_editorViewController setCanShowEmptyState:1];
    -[WFEditorViewController setCanShowInputAction:](v16->_editorViewController, "setCanShowInputAction:", [(id)objc_opt_class() canShowInputAction]);
    [(WFEditorViewController *)v16->_editorViewController setTriggerInputType:[(WFComposeViewController *)v16 triggerInputType]];
    [(WFEditorViewController *)v16->_editorViewController setHome:v14];
    id v25 = [[_TtC10WorkflowUI24WFUIKitDrawerCoordinator alloc] initWithWorkflow:v12 home:v14];
    drawerCoordinator = v16->_drawerCoordinator;
    v16->_drawerCoordinator = (WFActionDrawerCoordinator *)v25;

    [(WFActionDrawerCoordinator *)v16->_drawerCoordinator setDelegate:v16];
    BOOL v27 = [[WFComposeUserActivityManager alloc] initWithWorkflow:v12 targetResponder:v16];
    userActivityManager = v16->_userActivityManager;
    v16->_userActivityManager = v27;

    uint64_t v29 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    movedDragControllers = v16->_movedDragControllers;
    v16->_movedDragControllers = (NSHashTable *)v29;

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", &unk_26E1CA4E0, 0);
    editingStates = v16->_editingStates;
    v16->_editingStates = (NSMutableArray *)v31;

    uint64_t v33 = [MEMORY[0x263F824E8] buttonWithType:0];
    iconView = v16->_iconView;
    v16->_iconView = (UIButton *)v33;

    objc_super v35 = v16;
  }

  return v16;
}

- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4
{
  return [(WFComposeViewController *)self initWithWorkflow:a3 database:a4 home:0 shouldShowShareButton:1];
}

+ (BOOL)canShowInputAction
{
  return 1;
}

@end