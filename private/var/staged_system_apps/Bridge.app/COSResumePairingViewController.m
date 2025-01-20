@interface COSResumePairingViewController
- (COSResumePairingViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)dismissSetupFlow:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSResumePairingViewController

- (COSResumePairingViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSResumePairingViewController;
  v2 = [(COSResumePairingViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSResumePairingViewController *)v2 setStyle:10];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)COSResumePairingViewController;
  [(COSResumePairingViewController *)&v9 viewWillAppear:a3];
  v4 = [(COSResumePairingViewController *)self navigationItem];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"CANCEL_SETUP_FLOW" value:&stru_100249230 table:@"Localizable"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"dismissSetupFlow:"];

  [v4 setRightBarButtonItem:v8 animated:0];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESUME_SETUP_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESUME_SETUP_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESUME_SETUP_CONTINUE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"RESUME_SETUP_START_OVER" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = [(COSResumePairingViewController *)self delegate];
  id v5 = [v4 resumePairingController];
  [v5 resumePairing];

  id v6 = [(COSResumePairingViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)alternateButtonPressed:(id)a3
{
  v4 = [(COSResumePairingViewController *)self delegate];
  id v5 = [v4 resumePairingController];
  [v5 startPairingOver];

  id v6 = [(COSResumePairingViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)dismissSetupFlow:(id)a3
{
  +[PBBridgeCAReporter incrementSuccessType:17];
  v3 = (void *)UIApp;

  [v3 dismissSetupFlowComplete:0 animated:1];
}

@end