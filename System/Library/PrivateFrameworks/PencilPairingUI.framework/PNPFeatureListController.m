@interface PNPFeatureListController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)addScribbleBulletIfNecessary;
- (int64_t)bulletCount;
- (void)addDoubleTapBullet;
- (void)addDoubleTapBulletForPro;
- (void)addHoverBullet;
- (void)addQuickNoteBullet;
- (void)addScreenshotsBullet;
- (void)addScreenshotsBulletForPro;
- (void)addSqueezeBullet;
- (void)configureFor532;
- (void)configureForType:(int64_t)a3;
- (void)setBulletCount:(int64_t)a3;
- (void)tempDoTheNormalThing;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PNPFeatureListController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = PencilPairingUIBundle();
  v11 = [v10 localizedStringForKey:@"WELCOME_TITLE" value:&stru_26ECD9920 table:0];

  v12 = [PNPFeatureListController alloc];
  v13 = PencilPairingUIBundle();
  v14 = [v13 localizedStringForKey:@"WELCOME_DETAIL_TEXT" value:&stru_26ECD9920 table:0];
  v15 = [(PNPFeatureListController *)v12 initWithTitle:v11 detailText:v14 icon:0];

  if (a5 == 4)
  {
    v16 = PencilPairingUIBundle();
    int64_t v23 = a4;
    uint64_t v17 = [v16 localizedStringForKey:@"WELCOME_TITLE_PRO" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];

    v18 = [PNPFeatureListController alloc];
    v19 = PencilPairingUIBundle();
    v20 = [v19 localizedStringForKey:@"WELCOME_DETAIL_TEXT_PRO" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
    uint64_t v21 = [(PNPFeatureListController *)v18 initWithTitle:v17 detailText:v20 icon:0];

    v11 = (void *)v17;
    v15 = (PNPFeatureListController *)v21;
    a4 = v23;
  }
  [(PNPWelcomeController *)v15 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v9];

  return v15;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PNPFeatureListController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(PNPFeatureListController *)self configureForType:[(PNPWelcomeController *)self deviceType]];
}

- (void)configureForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(PNPFeatureListController *)self configureForGeneric];
      break;
    case 1:
      [(PNPFeatureListController *)self configureFor222];
      break;
    case 2:
      [(PNPFeatureListController *)self configureFor332];
      break;
    case 3:
      [(PNPFeatureListController *)self configureFor482];
      break;
    case 4:
      [(PNPFeatureListController *)self configureFor532];
      break;
    default:
      return;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PNPFeatureListController;
  [(PNPFeatureListController *)&v5 viewWillAppear:1];
  v4 = [(PNPFeatureListController *)self view];
  [v4 setHidden:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PNPFeatureListController;
  [(PNPFeatureListController *)&v5 viewDidDisappear:a3];
  v4 = [(PNPFeatureListController *)self view];
  [v4 setHidden:1];
}

- (void)configureFor532
{
  [(PNPFeatureListController *)self addSqueezeBullet];
  [(PNPFeatureListController *)self addDoubleTapBulletForPro];
  [(PNPFeatureListController *)self addScribbleBulletIfNecessary];
  [(PNPFeatureListController *)self addScreenshotsBulletForPro];
}

- (void)addHoverBullet
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"PENCIL_HOVER_PREVIEW_TITLE" value:&stru_26ECD9920 table:0];
  v4 = PencilPairingUIBundle();
  objc_super v5 = [v4 localizedStringForKey:@"PENCIL_HOVER_PREVIEW_DESCRIPTION" value:&stru_26ECD9920 table:0];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"Preview"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addQuickNoteBullet
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_NOTES_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  objc_super v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_NOTES_DESCRIPTION_RTOL";
  }
  else {
    id v7 = @"WELCOME_NOTES_DESCRIPTION";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:0];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"Notes"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (BOOL)addScribbleBulletIfNecessary
{
  objc_super v3 = [MEMORY[0x263F14BF0] sharedSettings];
  int v4 = [v3 supportedKeyboardLocaleExists];

  if (v4)
  {
    [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
    objc_super v5 = PencilPairingUIBundle();
    v6 = [v5 localizedStringForKey:@"WELCOME_SCRIBBLE_TITLE" value:&stru_26ECD9920 table:0];
    id v7 = PencilPairingUIBundle();
    v8 = [v7 localizedStringForKey:@"WELCOME_SCRIBBLE_DESCRIPTION" value:&stru_26ECD9920 table:0];
    id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_scribble"];
    [(PNPFeatureListController *)self addBulletedListItemWithTitle:v6 description:v8 image:v9];
  }
  return v4;
}

- (void)addDoubleTapBullet
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_TITLE" value:&stru_26ECD9920 table:0];
  int v4 = PencilPairingUIBundle();
  objc_super v5 = [v4 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_DESCRIPTION" value:&stru_26ECD9920 table:0];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_double_tap"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addScreenshotsBullet
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_SCREENSHOT_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  objc_super v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_RTOL";
  }
  else {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:0];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_swipe"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (void)addSqueezeBullet
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SQUEEZE_TITLE" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  BOOL v4 = PencilPairingUIBundle();
  objc_super v5 = [v4 localizedStringForKey:@"WELCOME_SQUEEZE_DESCRIPTION" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_squeeze"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addDoubleTapBulletForPro
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = PencilPairingUIBundle();
  objc_super v5 = [v4 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_DESCRIPTION_PRO" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_double_tap"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addScreenshotsBulletForPro
{
  [(PNPFeatureListController *)self setBulletCount:[(PNPFeatureListController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_SCREENSHOT_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  objc_super v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_RTOL_PRO";
  }
  else {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_PRO";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_swipe"];
  [(PNPFeatureListController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (void)tempDoTheNormalThing
{
  int v3 = [MEMORY[0x263F14B30] isHoverActive];
  char v4 = v3;
  if (v3) {
    [(PNPFeatureListController *)self addHoverBullet];
  }
  [(PNPFeatureListController *)self addQuickNoteBullet];
  [(PNPFeatureListController *)self addScribbleBulletIfNecessary];
  if ([(PNPWelcomeController *)self deviceType] == 2) {
    [(PNPFeatureListController *)self addDoubleTapBullet];
  }
  if ((v4 & 1) == 0)
  {
    [(PNPFeatureListController *)self addScreenshotsBullet];
  }
}

- (int64_t)bulletCount
{
  return self->_bulletCount;
}

- (void)setBulletCount:(int64_t)a3
{
  self->_bulletCount = a3;
}

@end