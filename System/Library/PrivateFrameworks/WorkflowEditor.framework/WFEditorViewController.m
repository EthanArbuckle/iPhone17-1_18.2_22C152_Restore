@interface WFEditorViewController
- (BOOL)canShowEmptyState;
- (BOOL)canShowInputAction;
- (BOOL)isEditable;
- (BOOL)isRunning;
- (Class)triggerInputType;
- (HMHome)home;
- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter;
- (WFEditorHostingViewController)hostingViewController;
- (WFEditorViewController)initWithWorkflow:(id)a3;
- (WFEditorViewControllerDelegate)delegate;
- (WFWorkflow)workflow;
- (double)actionCanvasWidth;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)actionsDidChangeInEditorHostingViewController:(id)a3;
- (void)appendAction:(id)a3;
- (void)editorHostingViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6;
- (void)editorHostingViewController:(id)a3 didChangeVariablePickingState:(BOOL)a4;
- (void)editorHostingViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4;
- (void)loadView;
- (void)performScrollingTest:(id)a3;
- (void)runWithSource:(id)a3;
- (void)scrollToAction:(id)a3;
- (void)setAuxiliaryViewPresenter:(id)a3;
- (void)setCanShowEmptyState:(BOOL)a3;
- (void)setCanShowInputAction:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setTriggerInputType:(Class)a3;
- (void)showActionError:(id)a3 for:(id)a4;
- (void)stop;
- (void)stopPickingVariables;
@end

@implementation WFEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);

  objc_destroyWeak((id *)&self->_delegate);
}

- (WFEditorHostingViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);

  return (WFEditorAuxiliaryViewPresenter *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WFEditorViewControllerDelegate *)WeakRetained;
}

- (void)actionsDidChangeInEditorHostingViewController:(id)a3
{
  id v4 = [(WFEditorViewController *)self delegate];
  [v4 actionsDidChangeInEditorViewController:self];
}

- (void)editorHostingViewController:(id)a3 didChangeVariablePickingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WFEditorViewController *)self delegate];
  [v6 editorViewController:self didChangeVariablePickingState:v4];
}

- (void)editorHostingViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WFEditorViewController *)self delegate];
  [v6 editorViewControllerDidFinishRunning:self cancelled:v4];
}

- (void)editorHostingViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = [(WFEditorViewController *)self delegate];
  [v10 editorViewController:self didChangeRunningState:v8 fractionCompleted:v6 isWaiting:a5];
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  BOOL v4 = [(WFEditorViewController *)self hostingViewController];
  v5 = [v4 contentScrollViewForEdge:a3];

  return v5;
}

- (void)performScrollingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditorViewController *)self hostingViewController];
  [v5 performScrollingTest:v4];
}

- (void)showActionError:(id)a3 for:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFEditorViewController *)self hostingViewController];
  [v8 showActionError:v7 for:v6];
}

- (void)scrollToAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditorViewController *)self hostingViewController];
  [v5 scrollToAction:v4];
}

- (void)appendAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditorViewController *)self hostingViewController];
  [v5 appendAction:v4 selectionAware:1];
}

- (void)stopPickingVariables
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  [v2 stopPickingVariables];
}

- (void)stop
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  [v2 stop];
}

- (void)runWithSource:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditorViewController *)self hostingViewController];
  [v5 runWithSource:v4];
}

- (double)actionCanvasWidth
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  [v2 actionCanvasWidth];
  double v4 = v3;

  return v4;
}

- (void)setHome:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEditorViewController *)self hostingViewController];
  [v5 setHome:v4];
}

- (HMHome)home
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  double v3 = [v2 home];

  return (HMHome *)v3;
}

- (void)setTriggerInputType:(Class)a3
{
  id v4 = [(WFEditorViewController *)self hostingViewController];
  [v4 setTriggerInputType:a3];
}

- (Class)triggerInputType
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  double v3 = [v2 triggerInputType];

  return (Class)v3;
}

- (void)setCanShowInputAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFEditorViewController *)self hostingViewController];
  [v4 setCanShowInputAction:v3];
}

- (BOOL)canShowInputAction
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  char v3 = [v2 canShowInputAction];

  return v3;
}

- (void)setCanShowEmptyState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFEditorViewController *)self hostingViewController];
  [v4 setCanShowEmptyState:v3];
}

- (BOOL)canShowEmptyState
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  char v3 = [v2 canShowEmptyState];

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFEditorViewController *)self hostingViewController];
  [v4 setIsEditable:v3];
}

- (BOOL)isEditable
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  char v3 = [v2 isEditable];

  return v3;
}

- (BOOL)isRunning
{
  id v2 = [(WFEditorViewController *)self hostingViewController];
  char v3 = [v2 isRunning];

  return v3;
}

- (void)loadView
{
  char v3 = objc_opt_new();
  [(WFEditorViewController *)self setView:v3];

  id v18 = [(WFEditorViewController *)self hostingViewController];
  id v4 = [(WFEditorViewController *)self auxiliaryViewPresenter];
  [v18 setAuxiliaryViewPresenter:v4];

  [(WFEditorViewController *)self addChildViewController:v18];
  id v5 = [(WFEditorViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v18 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [v18 view];
  [v15 setAutoresizingMask:18];

  v16 = [(WFEditorViewController *)self view];
  v17 = [v18 view];
  [v16 addSubview:v17];

  [v18 didMoveToParentViewController:self];
}

- (WFEditorViewController)initWithWorkflow:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFEditorViewController;
  double v6 = [(WFEditorViewController *)&v12 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflow, a3);
    double v8 = [[WFEditorHostingViewController alloc] initWithWorkflow:v5];
    hostingViewController = v7->_hostingViewController;
    v7->_hostingViewController = v8;

    [(WFEditorHostingViewController *)v7->_hostingViewController setDelegate:v7];
    double v10 = v7;
  }

  return v7;
}

@end