@interface RAPDirectionsStepsTableViewController
+ (Class)dataSourceClass;
- (BOOL)RAPDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5;
- (RAPDirectionsStepsTableViewController)init;
- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate;
- (int64_t)tableViewStyle;
- (void)setInstructionDelegate:(id)a3;
@end

@implementation RAPDirectionsStepsTableViewController

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (RAPDirectionsStepsTableViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAPDirectionsStepsTableViewController;
  v2 = [(DirectionsStepsTableViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(DirectionsStepsTableViewController *)v2 dataSource];
    [v4 setRapDelegate:v3];
  }
  return v3;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (BOOL)RAPDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(RAPDirectionsStepsTableViewController *)self instructionDelegate];
  LOBYTE(self) = [v9 viewController:self shouldShowFlagForStep:v8 listItem:v7];

  return (char)self;
}

- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionDelegate);

  return (RAPDirectionsStepsTableViewControllerDelegate *)WeakRetained;
}

- (void)setInstructionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end