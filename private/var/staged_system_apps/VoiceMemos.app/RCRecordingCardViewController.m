@interface RCRecordingCardViewController
- (BOOL)canBecomeFirstResponder;
- (RCRecordingCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)hostedView;
- (id)undoManager;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)setHostedView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RCRecordingCardViewController

- (RCRecordingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RCRecordingCardViewController;
  v4 = [(RCRecordingCardViewController *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RCRecordingCardViewController *)v4 navigationItem];
    [v6 setHidesBackButton:1];

    uint64_t v7 = objc_opt_new();
    undoManager = v5->_undoManager;
    v5->_undoManager = (RCUndoManager *)v7;
  }
  return v5;
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(RCRecordingCardViewController *)self setView:v3];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingCardViewController;
  [(RCRecordingCardViewController *)&v4 viewDidAppear:a3];
  [(RCRecordingCardViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCRecordingCardViewController;
  [(RCRecordingCardViewController *)&v4 viewWillDisappear:a3];
  [(RCRecordingCardViewController *)self resignFirstResponder];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (id)undoManager
{
  return self->_undoManager;
}

- (void)setHostedView:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingCardViewController *)self view];
  [v5 setHostedView:v4];
}

- (UIView)hostedView
{
  v2 = [(RCRecordingCardViewController *)self view];
  id v3 = [v2 hostedView];

  return (UIView *)v3;
}

- (void).cxx_destruct
{
}

@end