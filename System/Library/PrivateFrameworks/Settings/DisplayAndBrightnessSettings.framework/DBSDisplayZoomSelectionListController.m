@interface DBSDisplayZoomSelectionListController
- (CGSize)preferredContentSize;
- (DBSDisplayZoomSelectionControllerDelegate)delegate;
- (id)confirmationDictForCurrentSelectedScale;
- (id)specifiers;
- (id)supportedDisplayZoomOptions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)selectedDisplayZoomOption;
- (void)_updateNavigationButtonStateWithNewOption:(unint64_t)a3;
- (void)_userDidConfirmDisplayZoomModeWithSpecifier:(id)a3;
- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedDisplayZoomOption:(unint64_t)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateNavigationButtonStateWithCurrentState;
- (void)userDidTapCancel:(id)a3;
- (void)userDidTapDone:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DBSDisplayZoomSelectionListController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)DBSDisplayZoomSelectionListController;
  [(DBSDisplayZoomSelectionListController *)&v16 viewDidLoad];
  if (DBSReverseZoomEnabled())
  {
    v3 = [MEMORY[0x263F82670] currentDevice];
    int v4 = objc_msgSend(v3, "sf_isiPad");

    if (v4)
    {
      v5 = [(DBSDisplayZoomSelectionListController *)self table];
      [v5 _setTopPadding:0.0];

      v6 = [(DBSDisplayZoomSelectionListController *)self table];
      [v6 _setBottomPadding:0.0];

      v7 = [(DBSDisplayZoomSelectionListController *)self table];
      [v7 setBounces:0];
    }
  }
  id v8 = objc_alloc(MEMORY[0x263F824A8]);
  v9 = DBS_LocalizedStringForMagnify(@"DONE");
  v10 = (void *)[v8 initWithTitle:v9 style:2 target:self action:sel_userDidTapDone_];
  v11 = [(DBSDisplayZoomSelectionListController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  v12 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v9) = objc_msgSend(v12, "sf_isiPad");

  if (v9)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_userDidTapCancel_];
    v14 = [(DBSDisplayZoomSelectionListController *)self navigationItem];
    [v14 setLeftBarButtonItem:v13];
  }
  [(DBSDisplayZoomSelectionListController *)self updateNavigationButtonStateWithCurrentState];
  v15 = DBS_LocalizedStringForMagnify(@"DISPLAY_ZOOM");
  [(DBSDisplayZoomSelectionListController *)self setTitle:v15];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBSDisplayZoomSelectionListController;
  [(DBSDisplayZoomSelectionListController *)&v16 viewDidAppear:a3];
  int v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/MAGNIFY"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    id v8 = [v7 bundleURL];
    v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"DISPLAY_ZOOM" defaultValue:0 table:@"Magnify" locale:v11 bundleURL:v13];

    v17[0] = v9;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(DBSDisplayZoomSelectionListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v14 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (void)updateNavigationButtonStateWithCurrentState
{
  id v4 = +[DBSDisplayZoomConfigurationController defaultController];
  v3 = [v4 currentDisplayZoomMode];
  -[DBSDisplayZoomSelectionListController _updateNavigationButtonStateWithNewOption:](self, "_updateNavigationButtonStateWithNewOption:", [v3 displayZoomOption]);
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    if ((DBSReverseZoomEnabled() & 1) == 0)
    {
      v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v6 setIdentifier:@"DISPLAY_ZOOM_SECTION"];
      v7 = DBS_LocalizedStringForMagnify(@"DISPLAY_ZOOM");
      [v6 setName:v7];

      [v5 addObject:v6];
    }
    id v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    [v8 setIdentifier:@"DISPLAY_ZOOM_SELECTION"];
    [v8 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v5 addObject:v8];
    v9 = (objc_class *)[v5 copy];
    id v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DBSDisplayZoomSelectionListController;
  id v5 = [(DBSDisplayZoomSelectionListController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDelegate:self];
    [v5 setSelectionStyle:0];
    [v5 configureView];
  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 performSelector:sel_startAnimation withObject:0 afterDelay:2.0];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 performSelector:sel_stopAnimation withObject:0 afterDelay:0.0];
  }
}

- (CGSize)preferredContentSize
{
  if (DBSReverseZoomEnabled()
    && ([MEMORY[0x263F82670] currentDevice],
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = objc_msgSend(v2, "sf_isiPad"),
        v2,
        (v3 & 1) != 0))
  {
    double v4 = 262.0;
    double v5 = 600.0;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (id)confirmationDictForCurrentSelectedScale
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v4 = DBS_LocalizedStringForMagnify(@"CONFIRMATION_PROMPT");
  [v3 setObject:v4 forKey:*MEMORY[0x263F60010]];

  double v5 = DBS_LocalizedStringForMagnify(@"CONFIRMATION_CANCEL");
  [v3 setObject:v5 forKey:*MEMORY[0x263F5FFF8]];

  unint64_t v6 = [(DBSDisplayZoomSelectionListController *)self selectedDisplayZoomOption];
  if (v6 <= 3)
  {
    objc_super v7 = off_264C7AA48[v6];
    id v8 = DBS_LocalizedStringForMagnify(off_264C7AA28[v6]);
    [v3 setObject:v8 forKey:*MEMORY[0x263F60018]];

    v9 = DBS_LocalizedStringForMagnify(v7);
    [v3 setObject:v9 forKey:*MEMORY[0x263F60008]];
  }
  return v3;
}

- (void)userDidTapDone:(id)a3
{
  id v13 = objc_alloc_init(MEMORY[0x263F5FB40]);
  double v4 = +[DBSDisplayZoomConfigurationController defaultController];
  double v5 = [v4 currentDisplayZoomMode];
  uint64_t v6 = [v5 displayZoomOption];

  if ([(DBSDisplayZoomSelectionListController *)self selectedDisplayZoomOption] == v6)
  {
    objc_super v7 = [MEMORY[0x263F82670] currentDevice];
    int v8 = objc_msgSend(v7, "sf_isiPad");

    v9 = [(DBSDisplayZoomSelectionListController *)self navigationController];
    id v10 = v9;
    if (v8) {
      [v9 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      id v12 = (id)[v9 popViewControllerAnimated:1];
    }
  }
  else
  {
    id v10 = [(DBSDisplayZoomSelectionListController *)self confirmationDictForCurrentSelectedScale];
    [v13 setupWithDictionary:v10];
    [v13 setTarget:self];
    [v13 setConfirmationAction:sel__userDidConfirmDisplayZoomModeWithSpecifier_];
    v11 = [MEMORY[0x263F82670] currentDevice];
    -[DBSDisplayZoomSelectionListController showConfirmationViewForSpecifier:useAlert:](self, "showConfirmationViewForSpecifier:useAlert:", v13, objc_msgSend(v11, "sf_isiPad"));
  }
}

- (void)userDidTapCancel:(id)a3
{
  id v3 = [(DBSDisplayZoomSelectionListController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateNavigationButtonStateWithNewOption:(unint64_t)a3
{
  double v5 = +[DBSDisplayZoomConfigurationController defaultController];
  uint64_t v6 = [v5 currentDisplayZoomMode];
  [v6 displayZoomOption];

  [(DBSDisplayZoomSelectionListController *)self setSelectedDisplayZoomOption:a3];
}

- (void)_userDidConfirmDisplayZoomModeWithSpecifier:(id)a3
{
  uint64_t v3 = [(DBSDisplayZoomSelectionListController *)self selectedDisplayZoomOption];
  double v4 = NSString;
  double v5 = [NSNumber numberWithUnsignedInteger:v3];
  id v13 = [v4 stringWithFormat:@"display-zoom-change-%@", v5];

  uint64_t v6 = [MEMORY[0x263F255A0] sharedAggregateDictionary];
  [v6 addValue:1 forKey:v13];

  objc_super v7 = +[DBSDisplayZoomConfigurationController defaultController];
  int v8 = [v7 displayZoomModes];
  v9 = DBSStringForDisplayZoomOption(v3);
  id v10 = [v8 objectForKeyedSubscript:v9];

  v11 = +[DBSDisplayZoomConfigurationController defaultController];
  id v12 = [NSURL URLWithString:@"prefs:root=DISPLAY&path=MAGNIFY"];
  [v11 setDisplayZoomMode:v10 withRelaunchURL:v12];
}

- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4
{
}

- (id)supportedDisplayZoomOptions
{
  v2 = +[DBSDisplayZoomConfigurationController defaultController];
  uint64_t v3 = [v2 displayZoomModes];

  double v4 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__DBSDisplayZoomSelectionListController_supportedDisplayZoomOptions__block_invoke;
  v7[3] = &unk_264C7A9E0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __68__DBSDisplayZoomSelectionListController_supportedDisplayZoomOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "displayZoomOption"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (DBSDisplayZoomSelectionControllerDelegate)delegate
{
  return (DBSDisplayZoomSelectionControllerDelegate *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedDisplayZoomOption
{
  return self->_selectedDisplayZoomOption;
}

- (void)setSelectedDisplayZoomOption:(unint64_t)a3
{
  self->_selectedDisplayZoomOption = a3;
}

- (void).cxx_destruct
{
}

@end