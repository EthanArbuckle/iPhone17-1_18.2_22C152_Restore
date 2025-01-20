@interface PNPWhatsNewController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)addScribbleBulletIfNecessary;
- (int64_t)bulletCount;
- (void)addDoubleTapBullet;
- (void)addDoubleTapBulletForPro;
- (void)addHoverBullet;
- (void)addQuickNoteBullet;
- (void)addScreenshotsBullet;
- (void)addScreenshotsBulletForPro;
- (void)addSmarterNotesBullet;
- (void)addSqueezeBullet;
- (void)configureFor532;
- (void)configureForType:(int64_t)a3;
- (void)setBulletCount:(int64_t)a3;
- (void)tempDoTheNormalThing;
- (void)viewDidLoad;
@end

@implementation PNPWhatsNewController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = [PNPWhatsNewController alloc];
  v11 = PencilPairingUIBundle();
  v12 = [v11 localizedStringForKey:@"WHATS_NEW_TITLE" value:&stru_26ECD9920 table:0];
  v13 = PencilPairingUIBundle();
  v14 = [v13 localizedStringForKey:@"WELCOME_DETAIL_TEXT" value:&stru_26ECD9920 table:0];
  v15 = [(PNPWhatsNewController *)v10 initWithTitle:v12 detailText:v14 icon:0];

  [(PNPWelcomeController *)v15 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v9];
  return v15;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PNPWhatsNewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(PNPWhatsNewController *)self configureForType:[(PNPWelcomeController *)self deviceType]];
}

- (void)configureForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(PNPWhatsNewController *)self configureForGeneric];
      break;
    case 1:
      [(PNPWhatsNewController *)self configureFor222];
      break;
    case 2:
      [(PNPWhatsNewController *)self configureFor332];
      break;
    case 3:
      [(PNPWhatsNewController *)self configureFor482];
      break;
    case 4:
      [(PNPWhatsNewController *)self configureFor532];
      break;
    default:
      return;
  }
}

- (void)addHoverBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"PENCIL_HOVER_PREVIEW_TITLE" value:&stru_26ECD9920 table:0];
  v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"PENCIL_HOVER_PREVIEW_DESCRIPTION" value:&stru_26ECD9920 table:0];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"Preview"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addQuickNoteBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_NOTES_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_NOTES_DESCRIPTION_RTOL";
  }
  else {
    id v7 = @"WELCOME_NOTES_DESCRIPTION";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:0];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"Notes"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (void)addSmarterNotesBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SMARTER_NOTES_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"WELCOME_SMARTER_NOTES_DESCRIPTION" value:&stru_26ECD9920 table:0];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"Notes"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (BOOL)addScribbleBulletIfNecessary
{
  objc_super v3 = [MEMORY[0x263F14BF0] sharedSettings];
  int v4 = [v3 supportedKeyboardLocaleExists];

  if (v4)
  {
    [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
    v5 = PencilPairingUIBundle();
    v6 = [v5 localizedStringForKey:@"WELCOME_SCRIBBLE_TITLE" value:&stru_26ECD9920 table:0];
    id v7 = PencilPairingUIBundle();
    v8 = [v7 localizedStringForKey:@"WELCOME_SCRIBBLE_DESCRIPTION" value:&stru_26ECD9920 table:0];
    id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_scribble"];
    [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v6 description:v8 image:v9];
  }
  return v4;
}

- (void)addDoubleTapBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_TITLE" value:&stru_26ECD9920 table:0];
  int v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_DESCRIPTION" value:&stru_26ECD9920 table:0];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_double_tap"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addScreenshotsBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_SCREENSHOT_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_RTOL";
  }
  else {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:0];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_swipe"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (void)addSqueezeBullet
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SQUEEZE_TITLE" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  BOOL v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"WELCOME_SQUEEZE_DESCRIPTION" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_squeeze"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addDoubleTapBulletForPro
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v7 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = PencilPairingUIBundle();
  v5 = [v4 localizedStringForKey:@"WELCOME_SWITCH_TOOLS_DESCRIPTION_PRO" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v6 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_double_tap"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v5 image:v6];
}

- (void)addScreenshotsBulletForPro
{
  [(PNPWhatsNewController *)self setBulletCount:[(PNPWhatsNewController *)self bulletCount] + 1];
  PencilPairingUIBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v10 localizedStringForKey:@"WELCOME_SCREENSHOT_TITLE" value:&stru_26ECD9920 table:0];
  BOOL v4 = [(PNPWelcomeController *)self isRTL];
  v5 = PencilPairingUIBundle();
  v6 = v5;
  if (v4) {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_RTOL_PRO";
  }
  else {
    id v7 = @"WELCOME_SCREENSHOT_DESCRIPTION_PRO";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  id v9 = [(PNPWelcomeController *)self bundleImageNamed:@"welcome_swipe"];
  [(PNPWhatsNewController *)self addBulletedListItemWithTitle:v3 description:v8 image:v9];
}

- (void)configureFor532
{
  [(PNPWhatsNewController *)self addScribbleBulletIfNecessary];
  [(PNPWhatsNewController *)self addSqueezeBullet];
  [(PNPWhatsNewController *)self addDoubleTapBulletForPro];
  [(PNPWhatsNewController *)self addScreenshotsBulletForPro];
}

- (void)tempDoTheNormalThing
{
  if ([MEMORY[0x263F14B30] isHoverActive]) {
    [(PNPWhatsNewController *)self addHoverBullet];
  }
  [(PNPWhatsNewController *)self addScribbleBulletIfNecessary];
  [(PNPWhatsNewController *)self addSmarterNotesBullet];
  if ([(PNPWelcomeController *)self deviceType] == 2
    || [(PNPWelcomeController *)self deviceType] == 4)
  {
    [(PNPWhatsNewController *)self addDoubleTapBullet];
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