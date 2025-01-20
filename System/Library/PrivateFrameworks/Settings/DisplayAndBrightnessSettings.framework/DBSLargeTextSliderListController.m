@interface DBSLargeTextSliderListController
- (BOOL)showsExtendedRangeSwitch;
- (BOOL)showsLargerSizesHelpText;
- (BOOL)showsResetSliderButton;
- (BOOL)usesExtendedRange;
- (DBSLargeTextController)largeTextController;
- (NSArray)contentSizeCategories;
- (id)getDynamicTypeValueForSpecifier:(id)a3;
- (id)initUsingExtendedRange:(BOOL)a3;
- (id)specifiers;
- (int64_t)selectedCategoryIndex;
- (void)loadView;
- (void)resetSliderValue;
- (void)setContentSizeCategories:(id)a3;
- (void)setDynamicTypeValue:(id)a3 forSpecifier:(id)a4;
- (void)setLargeTextController:(id)a3;
- (void)setSelectedCategoryIndex:(int64_t)a3;
- (void)setShowsExtendedRangeSwitch:(BOOL)a3;
- (void)setShowsLargerSizesHelpText:(BOOL)a3;
- (void)setShowsResetSliderButton:(BOOL)a3;
- (void)setUsesExtendedRange:(BOOL)a3;
- (void)updateSliderValue;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DBSLargeTextSliderListController

- (id)initUsingExtendedRange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBSLargeTextSliderListController;
  id result = [(DBSLargeTextSliderListController *)&v5 init];
  if (result) {
    *((unsigned char *)result + 1394) = a3;
  }
  return result;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)DBSLargeTextSliderListController;
  [(DBSLargeTextSliderListController *)&v13 loadView];
  v3 = objc_opt_new();
  [(DBSLargeTextSliderListController *)self setAppearanceProvider:v3];

  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v5 = *MEMORY[0x263F83430];
  v6 = objc_msgSend(v4, "initWithObjects:", *MEMORY[0x263F83458], *MEMORY[0x263F83488], *MEMORY[0x263F83470], *MEMORY[0x263F83468], *MEMORY[0x263F83450], *MEMORY[0x263F83440], *MEMORY[0x263F83430], *MEMORY[0x263F83420], *MEMORY[0x263F83418], *MEMORY[0x263F83410], *MEMORY[0x263F83408], *MEMORY[0x263F83400], 0);
  [(DBSLargeTextSliderListController *)self setContentSizeCategories:v6];

  [(DBSLargeTextSliderListController *)self updateSliderValue];
  v7 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
  uint64_t v8 = [v7 indexOfObject:v5];

  BOOL v9 = ![(DBSLargeTextSliderListController *)self showsExtendedRangeSwitch]
    && ![(DBSLargeTextSliderListController *)self usesExtendedRange]
    && [(DBSLargeTextSliderListController *)self selectedCategoryIndex] == v8;
  [(DBSLargeTextSliderListController *)self setShowsLargerSizesHelpText:v9];
  v10 = [(DBSLargeTextSliderListController *)self table];
  [v10 setScrollEnabled:0];

  v11 = [(DBSLargeTextSliderListController *)self table];
  [v11 _setTopPadding:0.0];

  v12 = [(DBSLargeTextSliderListController *)self table];
  [v12 _setDisableReuseQueuePurgeOnTextSizeChanges:1];
}

- (void)viewSafeAreaInsetsDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)DBSLargeTextSliderListController;
  [(DBSLargeTextSliderListController *)&v11 viewSafeAreaInsetsDidChange];
  v3 = [MEMORY[0x263F82670] currentDevice];
  if ((objc_msgSend(v3, "sf_isiPhone") & 1) == 0)
  {

    goto LABEL_5;
  }
  id v4 = [(DBSLargeTextSliderListController *)self view];
  [v4 safeAreaInsets];
  double v6 = v5;

  if (v6 <= 0.0)
  {
LABEL_5:
    v7 = [(DBSLargeTextSliderListController *)self table];
    [v7 _setBottomPadding:0.0];
    goto LABEL_6;
  }
  v7 = [(DBSLargeTextSliderListController *)self view];
  [v7 safeAreaInsets];
  double v9 = v8;
  v10 = [(DBSLargeTextSliderListController *)self table];
  [v10 _setBottomPadding:v9];

LABEL_6:
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextSliderListController;
  [(DBSLargeTextSliderListController *)&v4 viewWillAppear:a3];
  self->_viewIsDisappearing = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBSLargeTextSliderListController;
  [(DBSLargeTextSliderListController *)&v16 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/TEXT_SIZE"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    double v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    double v8 = [v7 bundleURL];
    double v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    objc_super v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    objc_super v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"TEXT_SIZE" defaultValue:0 table:@"Display" locale:v11 bundleURL:v13];

    v17[0] = v9;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(DBSLargeTextSliderListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v14 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextSliderListController;
  [(DBSLargeTextSliderListController *)&v4 viewWillDisappear:a3];
  self->_viewIsDisappearing = 1;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_17;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!self->_sliderGroupSpecifier)
  {
    double v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    sliderGroupSpecifier = self->_sliderGroupSpecifier;
    self->_sliderGroupSpecifier = v6;
  }
  BOOL v8 = [(DBSLargeTextSliderListController *)self showsLargerSizesHelpText];
  double v9 = self->_sliderGroupSpecifier;
  if (v8)
  {
    id v10 = (objc_class *)objc_opt_class();
    objc_super v11 = NSStringFromClass(v10);
    [(PSSpecifier *)v9 setProperty:v11 forKey:*MEMORY[0x263F60118]];
  }
  else
  {
    [(PSSpecifier *)self->_sliderGroupSpecifier removePropertyForKey:*MEMORY[0x263F60118]];
  }
  v12 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v12, "sf_isiPhone"))
  {
  }
  else
  {
    BOOL showsResetSliderButton = self->_showsResetSliderButton;

    if (!showsResetSliderButton)
    {
      v14 = self->_sliderGroupSpecifier;
      v15 = (objc_class *)objc_opt_class();
      objc_super v16 = NSStringFromClass(v15);
      [(PSSpecifier *)v14 setProperty:v16 forKey:*MEMORY[0x263F600C0]];

      goto LABEL_12;
    }
  }
  [(PSSpecifier *)self->_sliderGroupSpecifier removePropertyForKey:*MEMORY[0x263F600C0]];
LABEL_12:
  [v5 addObject:self->_sliderGroupSpecifier];
  v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setDynamicTypeValue_forSpecifier_ get:sel_getDynamicTypeValueForSpecifier_ detail:0 cell:5 edit:0];
  [v17 setIdentifier:@"DYNAMIC_TYPE_SLIDER"];
  [v17 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v18 = MEMORY[0x263EFFA88];
  [v17 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60230]];
  [v17 setProperty:v18 forKey:*MEMORY[0x263F60238]];
  [v17 setProperty:&unk_26E939080 forKey:*MEMORY[0x263F60038]];
  [v17 setProperty:&unk_26E939220 forKey:*MEMORY[0x263F602A8]];
  v19 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
  BOOL v20 = [(DBSLargeTextSliderListController *)self usesExtendedRange];
  v21 = (void *)MEMORY[0x263F83400];
  if (!v20) {
    v21 = (void *)MEMORY[0x263F83430];
  }
  uint64_t v22 = [v19 indexOfObject:*v21];

  v23 = [NSNumber numberWithUnsignedInteger:v22];
  [v17 setProperty:v23 forKey:*MEMORY[0x263F60030]];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange"));
  [v17 setProperty:v24 forKey:@"largeTextUsesExtendedRange"];

  [v5 addObject:v17];
  if (self->_showsResetSliderButton)
  {
    v25 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v25];
    v26 = (void *)MEMORY[0x263F5FC40];
    v27 = DBS_LocalizedStringForLargeFontSettings(@"RESET_BUTTON_TEXT");
    v28 = [v26 preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v28 setButtonAction:sel_resetSliderValue];
    [v28 setObject:&unk_26E939098 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
    [v28 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    [v5 addObject:v28];
  }
  v29 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_17:
  return v4;
}

- (void)setSelectedCategoryIndex:(int64_t)a3
{
  if (![(DBSLargeTextSliderListController *)self usesExtendedRange])
  {
    id v5 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
    unint64_t v6 = [v5 indexOfObject:*MEMORY[0x263F83430]];

    if (v6 < a3) {
      a3 = v6;
    }
  }
  self->_selectedCategoryIndex = a3;
  id v7 = [NSNumber numberWithInteger:a3];
  [(DBSLargeTextSliderListController *)self setDynamicTypeValue:v7 forSpecifier:0];
}

- (void)setUsesExtendedRange:(BOOL)a3
{
  self->_usesExtendedRange = a3;
}

- (void)setDynamicTypeValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_viewIsDisappearing)
  {
    uint64_t v8 = [v6 integerValue];
    if (v8 != [(DBSLargeTextSliderListController *)self selectedCategoryIndex]
      || !v7 && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
    {
      double v9 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
      uint64_t v10 = [v9 indexOfObject:*MEMORY[0x263F83430]];

      BOOL v11 = [(DBSLargeTextSliderListController *)self showsLargerSizesHelpText];
      self->_selectedCategoryIndex = [v6 integerValue];
      v12 = [(DBSLargeTextSliderListController *)self view];
      [v12 setNeedsLayout];

      BOOL v13 = ![(DBSLargeTextSliderListController *)self showsExtendedRangeSwitch]
         && ![(DBSLargeTextSliderListController *)self usesExtendedRange]
         && [(DBSLargeTextSliderListController *)self selectedCategoryIndex] == v10;
      [(DBSLargeTextSliderListController *)self setShowsLargerSizesHelpText:v13];
      if (v11 != [(DBSLargeTextSliderListController *)self showsLargerSizesHelpText])
      {
        BOOL v14 = [(DBSLargeTextSliderListController *)self showsLargerSizesHelpText];
        sliderGroupSpecifier = self->_sliderGroupSpecifier;
        if (v14)
        {
          objc_super v16 = (objc_class *)objc_opt_class();
          v17 = NSStringFromClass(v16);
          [(PSSpecifier *)sliderGroupSpecifier setProperty:v17 forKey:*MEMORY[0x263F60118]];
        }
        else
        {
          [(PSSpecifier *)self->_sliderGroupSpecifier removePropertyForKey:*MEMORY[0x263F60118]];
        }
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke;
      v18[3] = &unk_264C7A5E8;
      id v19 = v7;
      BOOL v20 = self;
      dispatch_async(MEMORY[0x263EF83A0], v18);
    }
  }
}

void __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) largeTextController],
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 savesCategoryNameOnlyOnSliderEvent],
        v2,
        (v3 & 1) == 0))
  {
    objc_super v4 = [*(id *)(a1 + 40) contentSizeCategories];
    id v5 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "selectedCategoryIndex"));

    id v6 = [*(id *)(a1 + 40) largeTextController];
    [v6 savePreferredContentSizeCategoryName:v5];
  }
  id v7 = MEMORY[0x263EF83A0];
  dispatch_async(v7, &__block_literal_global_6);
}

void __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"DidPostContentSizeChanged" object:0];
}

- (id)getDynamicTypeValueForSpecifier:(id)a3
{
  objc_super v4 = [(DBSLargeTextSliderListController *)self largeTextController];
  id v5 = [v4 readPreferredContentSizeCategoryName];

  id v6 = NSNumber;
  if (v5)
  {
    id v7 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
    uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "indexOfObject:", v5));
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[DBSLargeTextSliderListController selectedCategoryIndex](self, "selectedCategoryIndex"));
  }

  return v8;
}

- (void)updateSliderValue
{
  char v3 = [(DBSLargeTextSliderListController *)self largeTextController];
  id v6 = [v3 readPreferredContentSizeCategoryName];

  objc_super v4 = [(DBSLargeTextSliderListController *)self contentSizeCategories];
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = (id)*MEMORY[0x263F83468];
  }
  -[DBSLargeTextSliderListController setSelectedCategoryIndex:](self, "setSelectedCategoryIndex:", [v4 indexOfObject:v5]);
}

- (void)resetSliderValue
{
  char v3 = [(DBSLargeTextSliderListController *)self largeTextController];
  [v3 resetContentSizeCategoryName];

  [(DBSLargeTextSliderListController *)self reloadSpecifiers];
}

- (NSArray)contentSizeCategories
{
  return self->_contentSizeCategories;
}

- (void)setContentSizeCategories:(id)a3
{
}

- (int64_t)selectedCategoryIndex
{
  return self->_selectedCategoryIndex;
}

- (BOOL)showsExtendedRangeSwitch
{
  return self->_showsExtendedRangeSwitch;
}

- (void)setShowsExtendedRangeSwitch:(BOOL)a3
{
  self->_showsExtendedRangeSwitch = a3;
}

- (BOOL)usesExtendedRange
{
  return self->_usesExtendedRange;
}

- (BOOL)showsLargerSizesHelpText
{
  return self->_showsLargerSizesHelpText;
}

- (void)setShowsLargerSizesHelpText:(BOOL)a3
{
  self->_showsLargerSizesHelpText = a3;
}

- (BOOL)showsResetSliderButton
{
  return self->_showsResetSliderButton;
}

- (void)setShowsResetSliderButton:(BOOL)a3
{
  self->_BOOL showsResetSliderButton = a3;
}

- (DBSLargeTextController)largeTextController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_largeTextController);
  return (DBSLargeTextController *)WeakRetained;
}

- (void)setLargeTextController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_largeTextController);
  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
  objc_storeStrong((id *)&self->_sliderGroupSpecifier, 0);
}

@end