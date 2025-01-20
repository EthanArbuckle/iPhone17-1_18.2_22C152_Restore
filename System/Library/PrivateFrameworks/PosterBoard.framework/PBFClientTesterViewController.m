@interface PBFClientTesterViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PBFClientTesterViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PBFClientTesterViewController;
  [(PBFClientTesterViewController *)&v4 viewDidLoad];
  [(PBFClientTesterViewController *)self setTitle:@"Client Tester"];
  v3 = [(PBFClientTesterViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"api"];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [a3 dequeueReusableCellWithIdentifier:@"api" forIndexPath:v5];
  uint64_t v7 = [v5 row];

  switch(v7)
  {
    case 0:
      v8 = [v6 textLabel];
      v9 = v8;
      v10 = @"Focus Poster Selection";
      goto LABEL_7;
    case 1:
      v8 = [v6 textLabel];
      v9 = v8;
      v10 = @"Gallery";
      goto LABEL_7;
    case 2:
      v8 = [v6 textLabel];
      v9 = v8;
      v10 = @"Editing";
      goto LABEL_7;
    case 3:
      v8 = [v6 textLabel];
      v9 = v8;
      v10 = @"Switcher";
      goto LABEL_7;
    case 4:
      v8 = [v6 textLabel];
      v9 = v8;
      v10 = @"Poster Selection";
LABEL_7:
      [v8 setText:v10];

      break;
    default:
      break;
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 row];

  switch(v7)
  {
    case 0:
      id v8 = objc_alloc(MEMORY[0x1E4F92428]);
      v9 = objc_opt_new();
      v10 = (void *)[v8 initWithActivityUUID:v9 activityIdentifier:&stru_1F2A71F00];
      goto LABEL_9;
    case 1:
    case 3:
      uint64_t v14 = objc_opt_new();
      goto LABEL_12;
    case 2:
      v9 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:*MEMORY[0x1E4F92790]];
      [v9 setDisplayNameLocalizationKey:@"SAMPLE_POSTER_TITLE"];
      id v20 = 0;
      char v11 = [v9 storeUserInfo:&unk_1F2AAECE0 error:&v20];
      id v12 = v20;
      if ((v11 & 1) == 0)
      {
        v13 = PBFLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[PBFClientTesterViewController tableView:didSelectRowAtIndexPath:]((uint64_t)v12, v13);
        }
      }
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F92420]) initWithExtensionIdentifier:@"com.apple.PosterTester.SamplePoster" configuration:v9];

LABEL_9:
      break;
    case 4:
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F92440]) initWithAllowedConfigurationUUIDs:0];
LABEL_12:
      v10 = (void *)v14;
      break;
    default:
      v10 = 0;
      break;
  }
  v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  v16 = [v15 connectedScenes];
  v17 = [v16 anyObject];

  v18 = (PRUISModalController *)[objc_alloc(MEMORY[0x1E4F92400]) initWithEntryPoint:v10];
  modalController = self->_modalController;
  self->_modalController = v18;

  [(PRUISModalController *)self->_modalController setDelegate:self];
  [(PRUISModalController *)self->_modalController presentFromWindowScene:v17];
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  modalController = self->_modalController;
  self->_modalController = 0;
}

- (void).cxx_destruct
{
}

- (void)tableView:(uint64_t)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Could not store user info: %@", (uint8_t *)&v2, 0xCu);
}

@end