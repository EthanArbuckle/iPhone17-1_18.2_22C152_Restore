@interface MSDLearnMoreViewController
- (MSDLearnMoreViewController)init;
- (OBWelcomeController)contentViewController;
- (void)setContentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MSDLearnMoreViewController

- (MSDLearnMoreViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)MSDLearnMoreViewController;
  v2 = [(MSDLearnMoreViewController *)&v19 init];
  if (v2)
  {
    v18 = +[MSDSetupUILocalization localizedStringForKey:@"LEARN_MORE_TITLE"];
    v17 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.triangle.2.circlepath.doc.on.clipboard"];
    v3 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v18 detailText:0 icon:v17];
    [(MSDLearnMoreViewController *)v2 setContentViewController:v3];

    v4 = +[MSDSetupUILocalization localizedStringForKey:@"LATEST_APP_BULLET"];
    v5 = +[MSDSetupUILocalization localizedStringForKey:@"REMOTE_MANAGEMENT_BULLET"];
    v6 = +[MSDSetupUILocalization localizedStringForKey:@"PROGRAMS_BULLET"];
    v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"app.badge.fill"];
    v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"rectangle.inset.filled.and.person.filled"];
    v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"plus.circle.fill"];
    v10 = [(MSDLearnMoreViewController *)v2 contentViewController];
    [v10 addBulletedListItemWithTitle:v4 description:&stru_26EC8FB50 image:v7];

    v11 = [(MSDLearnMoreViewController *)v2 contentViewController];
    [v11 addBulletedListItemWithTitle:v5 description:&stru_26EC8FB50 image:v8];

    v12 = [(MSDLearnMoreViewController *)v2 contentViewController];
    [v12 addBulletedListItemWithTitle:v6 description:&stru_26EC8FB50 image:v9];

    v13 = [(MSDLearnMoreViewController *)v2 contentViewController];
    v14 = [v13 navigationItem];
    [v14 setHidesBackButton:1];

    v15 = +[MSDSetupUILocalization localizedStringForKey:@"LEARN_MORE_HEADER"];
    [(MSDLearnMoreViewController *)v2 setTitle:v15];
  }
  return v2;
}

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)MSDLearnMoreViewController;
  [(MSDLearnMoreViewController *)&v29 viewDidLoad];
  v3 = [(MSDLearnMoreViewController *)self contentViewController];
  [(MSDLearnMoreViewController *)self addChildViewController:v3];

  v4 = [(MSDLearnMoreViewController *)self contentViewController];
  v5 = [v4 view];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(MSDLearnMoreViewController *)self view];
  [v6 addSubview:v5];

  v27 = [v5 topAnchor];
  v28 = [(MSDLearnMoreViewController *)self view];
  v26 = [v28 safeAreaLayoutGuide];
  v25 = [v26 topAnchor];
  v24 = [v27 constraintEqualToAnchor:v25];
  v30[0] = v24;
  v22 = [v5 bottomAnchor];
  v23 = [(MSDLearnMoreViewController *)self view];
  v21 = [v23 safeAreaLayoutGuide];
  v20 = [v21 bottomAnchor];
  objc_super v19 = [v22 constraintEqualToAnchor:v20];
  v30[1] = v19;
  v16 = [v5 leftAnchor];
  v18 = [(MSDLearnMoreViewController *)self view];
  v7 = [v18 safeAreaLayoutGuide];
  v8 = [v7 leftAnchor];
  v9 = [v16 constraintEqualToAnchor:v8];
  v30[2] = v9;
  v10 = [v5 rightAnchor];
  v11 = [(MSDLearnMoreViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 rightAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  v30[3] = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];

  [MEMORY[0x263F08938] activateConstraints:v17];
  v15 = [(MSDLearnMoreViewController *)self contentViewController];
  [v15 didMoveToParentViewController:self];
}

- (OBWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end