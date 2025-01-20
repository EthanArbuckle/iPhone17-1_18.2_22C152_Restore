@interface WFHUShortcutsTriggerViewAccessoryViewController
- (UIViewController)accessoryPickerViewController;
- (WFHUShortcutsTriggerViewAccessoryViewController)initWithHome:(id)a3 services:(id)a4;
- (WFHUShortcutsTriggerViewAccessoryViewControllerDelegate)delegate;
- (void)cancelEditor;
- (void)dismissEditor;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFHUShortcutsTriggerViewAccessoryViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryPickerViewController, 0);
}

- (void)setDelegate:(id)a3
{
}

- (WFHUShortcutsTriggerViewAccessoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFHUShortcutsTriggerViewAccessoryViewControllerDelegate *)WeakRetained;
}

- (UIViewController)accessoryPickerViewController
{
  return self->_accessoryPickerViewController;
}

- (void)cancelEditor
{
  id v3 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self delegate];
  [v3 servicePickerDidCancel:self];
}

- (void)dismissEditor
{
  id v6 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self delegate];
  Class HUShortcutsTriggerViewUtilitiesClass_4831 = getHUShortcutsTriggerViewUtilitiesClass_4831();
  v4 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  v5 = [(objc_class *)HUShortcutsTriggerViewUtilitiesClass_4831 getServicesOnAccessoryPicker:v4];
  [v6 servicePickerDidFinish:self selectedServices:v5];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  [(WFHUShortcutsTriggerViewAccessoryViewController *)&v7 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissEditor];
  v4 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelEditor];
  id v6 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  [(WFHUShortcutsTriggerViewAccessoryViewController *)&v21 loadView];
  id v3 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  [(WFHUShortcutsTriggerViewAccessoryViewController *)self addChildViewController:v3];

  v4 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  v14 = [v13 view];
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  v15 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  v16 = [v15 view];
  [v16 setAutoresizingMask:18];

  v17 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self view];
  v18 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  v19 = [v18 view];
  [v17 addSubview:v19];

  v20 = [(WFHUShortcutsTriggerViewAccessoryViewController *)self accessoryPickerViewController];
  [v20 didMoveToParentViewController:self];
}

- (WFHUShortcutsTriggerViewAccessoryViewController)initWithHome:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  double v8 = [(WFHUShortcutsTriggerViewAccessoryViewController *)&v14 initWithNibName:0 bundle:0];
  if (v8)
  {
    getHUShortcutsTriggerViewAccessoryPickerConfigurationClass();
    double v9 = objc_opt_new();
    [v9 setServicesOnly:1];
    uint64_t v10 = [(objc_class *)getHUShortcutsTriggerViewUtilitiesClass_4831() accessoryPickerViewControllerInHome:v6 withConfiguration:v9];
    [(objc_class *)getHUShortcutsTriggerViewUtilitiesClass_4831() setServices:v7 onAccessoryPicker:v10];
    accessoryPickerViewController = v8->_accessoryPickerViewController;
    v8->_accessoryPickerViewController = (UIViewController *)v10;

    double v12 = v8;
  }

  return v8;
}

@end