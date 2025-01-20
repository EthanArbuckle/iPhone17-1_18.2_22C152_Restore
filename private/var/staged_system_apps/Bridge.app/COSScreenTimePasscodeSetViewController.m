@interface COSScreenTimePasscodeSetViewController
- (COSScreenTimePasscodeSetViewController)init;
- (STSMiniFlowControllerDelegate)miniFlowDelegate;
- (id)alternateButtonString;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSScreenTimePasscodeSetViewController

- (COSScreenTimePasscodeSetViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSScreenTimePasscodeSetViewController;
  v2 = [(COSScreenTimePasscodeSetViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSScreenTimePasscodeSetViewController *)v2 setStyle:2];
  }
  return v3;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)COSScreenTimePasscodeSetViewController;
  [(COSScreenTimePasscodeSetViewController *)&v23 viewDidLoad];
  v3 = [(COSScreenTimePasscodeSetViewController *)self miniFlowDelegate];
  v4 = [v3 familyMemberFirstName];

  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_COMM_RESTRICTIONS" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_COMM_RESTRICTIONS_BODY_%@" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);
  v10 = +[UIImage imageNamed:@"CommRestrictions"];
  [(COSScreenTimePasscodeSetViewController *)self addBulletedListItemWithTitle:v6 description:v9 image:v10];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_DOWNTIME" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_DOWNTIME_BODY" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v4);
  v16 = +[UIImage imageNamed:@"Downtime"];
  [(COSScreenTimePasscodeSetViewController *)self addBulletedListItemWithTitle:v12 description:v15 image:v16];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_CONTENT_AND_RESTRICTIONS" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"SCREEN_TIME_HIGHLIGHT_CONTENT_AND_RESTRICTIONS_BODY" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];
  v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v4);
  v22 = +[UIImage imageNamed:@"ContentAndRestrictions"];
  [(COSScreenTimePasscodeSetViewController *)self addBulletedListItemWithTitle:v18 description:v21 image:v22];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SCREEN_TIME_PASSCODE_SET_TITLE" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SCREEN_TIME_PASSCODE_SET_DETAIL" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SCREEN_TIME_CONTINUE" value:&stru_100249230 table:@"ScreenTimeSetupLocalizable"];

  return v3;
}

- (id)alternateButtonString
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(COSScreenTimePasscodeSetViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (STSMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (STSMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end