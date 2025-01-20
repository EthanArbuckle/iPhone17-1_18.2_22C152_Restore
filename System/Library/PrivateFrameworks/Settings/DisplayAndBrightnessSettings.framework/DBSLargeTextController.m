@interface DBSLargeTextController
- (BOOL)readUsesExtendedRange;
- (BOOL)savesCategoryNameOnlyOnSliderEvent;
- (BOOL)showsExtendedRangeSwitch;
- (BOOL)showsResetSliderButton;
- (DBSLargeTextController)init;
- (id)readPreferredContentSizeCategoryName;
- (id)specifiers;
- (id)usesExtendedRangeForSpecifier:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)savePreferredContentSizeCategoryName:(id)a3;
- (void)saveUsesExtendedRange:(BOOL)a3;
- (void)setSavesCategoryNameOnlyOnSliderEvent:(BOOL)a3;
- (void)setShowsExtendedRangeSwitch:(BOOL)a3;
- (void)setShowsResetSliderButton:(BOOL)a3;
- (void)setUsesExtendedRange:(id)a3 forSpecifier:(id)a4;
- (void)sizeCategoryDidChange:(id)a3;
- (void)updateSlider;
- (void)updateSlidersForNewUsesExtendedRangeValue:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation DBSLargeTextController

- (DBSLargeTextController)init
{
  v14.receiver = self;
  v14.super_class = (Class)DBSLargeTextController;
  v2 = [(DBSLargeTextController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sliderListController = v2->_sliderListController;
    v2->_sliderListController = (DBSLargeTextSliderListController *)v3;

    [(DBSLargeTextSliderListController *)v2->_sliderListController setUsesExtendedRange:0];
    [(DBSLargeTextSliderListController *)v2->_sliderListController setShowsResetSliderButton:v2->_showsResetSliderButton];
    [(DBSLargeTextSliderListController *)v2->_sliderListController setLargeTextController:v2];
    uint64_t v5 = objc_opt_new();
    extendedRangeSliderListController = v2->_extendedRangeSliderListController;
    v2->_extendedRangeSliderListController = (DBSLargeTextSliderListController *)v5;

    [(DBSLargeTextSliderListController *)v2->_extendedRangeSliderListController setUsesExtendedRange:1];
    [(DBSLargeTextSliderListController *)v2->_extendedRangeSliderListController setShowsResetSliderButton:v2->_showsResetSliderButton];
    [(DBSLargeTextSliderListController *)v2->_extendedRangeSliderListController setLargeTextController:v2];
    BOOL v7 = [(DBSLargeTextController *)v2 readUsesExtendedRange];
    v2->_usesExtendedRange = v7;
    if (v7) {
      uint64_t v8 = 1392;
    }
    else {
      uint64_t v8 = 1384;
    }
    id v9 = *(id *)((char *)&v2->super.super.super.super.super.isa + v8);
    [(DBSLargeTextController *)v2 addChildViewController:v9];
    v10 = [(DBSLargeTextController *)v2 view];
    uint64_t v11 = [v9 view];
    [v10 addSubview:v11];

    [v9 didMoveToParentViewController:v2];
    v12 = [MEMORY[0x263F82670] currentDevice];
    LOBYTE(v11) = objc_msgSend(v12, "sf_isiPhone");

    if ((v11 & 1) == 0) {
      [*(id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setClipsToBounds:1];
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextController;
  [(DBSLargeTextController *)&v4 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextController;
  [(DBSLargeTextController *)&v4 loadView];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_sizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
}

- (void)viewDidLayoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)DBSLargeTextController;
  [(DBSLargeTextController *)&v56 viewDidLayoutSubviews];
  if (self->_usesExtendedRange) {
    uint64_t v3 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    uint64_t v3 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  uint64_t v5 = [v4 table];
  uint64_t v6 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  BOOL v7 = [v5 cellForRowAtIndexPath:v6];

  uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
  LOBYTE(v6) = objc_msgSend(v8, "sf_isiPhone");

  if (v6)
  {
    id v9 = [v4 table];
    [v9 contentSize];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(DBSLargeTextController *)self interfaceOrientation];
    v15 = [v4 table];
    [v15 _bottomPadding];
    double v17 = v16;

    id v18 = v7;
    if (self->_showsResetSliderButton)
    {
      v19 = [v4 table];
      uint64_t v20 = [v19 numberOfSections];

      if (v20 == 2)
      {
        v21 = [v4 table];
        v22 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
        uint64_t v23 = [v21 cellForRowAtIndexPath:v22];

        id v18 = (id)v23;
      }
    }
    if (v18)
    {
      if (v17 <= 0.0 && (unint64_t)(v14 - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        [v18 frame];
        double MaxY = CGRectGetMaxY(v57);
        v26 = [v4 table];
        [v26 frame];
        double v13 = MaxY - CGRectGetMinY(v58);
      }
    }
  }
  else
  {
    v27 = [(DBSLargeTextController *)self table];
    [v27 frame];
    double v11 = v28;
    double v30 = v29;

    double v13 = v30 * 0.55;
    if (![v4 showsLargerSizesHelpText]) {
      goto LABEL_18;
    }
    [v7 frame];
    double MinY = CGRectGetMinY(v59);
    id v18 = [v4 table];
    [v18 frame];
    double v13 = v13 + MinY - CGRectGetMinY(v60);
  }

LABEL_18:
  v32 = [v4 table];
  [v32 frame];
  double v34 = v33;
  double v36 = v35;

  v37 = [v4 table];
  objc_msgSend(v37, "setFrame:", v34, v36, v11, v13);

  v38 = [v4 view];
  [v38 frame];

  v39 = [(DBSLargeTextController *)self view];
  [v39 frame];
  CGRectGetHeight(v61);
  PSRoundToPixel();
  double v41 = v40;

  v42 = [v4 view];
  objc_msgSend(v42, "setFrame:", 0.0, v41, v11, v13);

  v43 = [(DBSLargeTextController *)self table];
  [v43 frame];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  double v52 = v51 - v13;
  v53 = [MEMORY[0x263F82670] currentDevice];
  int v54 = objc_msgSend(v53, "sf_isiPhone");

  if (!v54) {
    double v52 = v52 + -20.0;
  }
  v55 = [(DBSLargeTextController *)self table];
  objc_msgSend(v55, "setFrame:", v45, v47, v49, v52);
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    BOOL v7 = [MEMORY[0x263F82670] currentDevice];
    int v8 = objc_msgSend(v7, "sf_isiPhone");

    if (v8) {
      [v6 setProperty:@"DBSLargeTextExplanationView" forKey:*MEMORY[0x263F600C0]];
    }
    [v5 addObject:v6];
    if (self->_showsExtendedRangeSwitch)
    {
      id v9 = (void *)MEMORY[0x263F5FC40];
      double v10 = DBS_LocalizedStringForLargeFontSettings(@"LARGER_DYNAMIC_TYPE");
      double v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel_setUsesExtendedRange_forSpecifier_ get:sel_usesExtendedRangeForSpecifier_ detail:0 cell:6 edit:0];

      [v11 setIdentifier:@"LARGER_DYNAMIC_TYPE_SWITCH"];
      [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
      [v5 addObject:v11];
    }
    double v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)sizeCategoryDidChange:(id)a3
{
  if (self->_usesExtendedRange) {
    id v4 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    id v4 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  id v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
  uint64_t v6 = [v5 contentSizeCategories];
  uint64_t v7 = [v5 selectedCategoryIndex];

  id v9 = [v6 objectAtIndexedSubscript:v7];

  +[DBSAnalytics logTextSizeEvent:v9];
  int v8 = [(DBSLargeTextController *)self view];
  [v8 setNeedsLayout];
}

- (void)setShowsExtendedRangeSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsExtendedRangeSwitch = a3;
  -[DBSLargeTextSliderListController setShowsExtendedRangeSwitch:](self->_sliderListController, "setShowsExtendedRangeSwitch:");
  [(DBSLargeTextSliderListController *)self->_extendedRangeSliderListController setShowsExtendedRangeSwitch:v3];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    [(DBSLargeTextController *)self reloadSpecifiers];
  }
}

- (void)setUsesExtendedRange:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  if (self->_usesExtendedRange != v5)
  {
    uint64_t v6 = v5;
    [(DBSLargeTextController *)self updateSlidersForNewUsesExtendedRangeValue:v5];
    [(DBSLargeTextController *)self saveUsesExtendedRange:v6];
  }
}

- (void)updateSlidersForNewUsesExtendedRangeValue:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesExtendedRange) {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  id v22 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
  uint64_t v6 = [v22 view];
  [v6 removeFromSuperview];

  [v22 removeFromParentViewController];
  [v22 didMoveToParentViewController:0];
  if (v3) {
    uint64_t v7 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    uint64_t v7 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  id v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);
  [(DBSLargeTextController *)self addChildViewController:v8];
  id v9 = [(DBSLargeTextController *)self view];
  double v10 = [v8 view];
  [v9 addSubview:v10];

  [v8 didMoveToParentViewController:self];
  objc_msgSend(v8, "setSelectedCategoryIndex:", objc_msgSend(v22, "selectedCategoryIndex"));
  double v11 = [v22 view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v8 view];

  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  v21 = [(DBSLargeTextController *)self view];
  [v21 setNeedsLayout];

  self->_usesExtendedRange = v3;
}

- (id)usesExtendedRangeForSpecifier:(id)a3
{
  return (id)[NSNumber numberWithBool:self->_usesExtendedRange];
}

- (void)setShowsResetSliderButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsResetSliderButton = a3;
  -[DBSLargeTextSliderListController setShowsResetSliderButton:](self->_sliderListController, "setShowsResetSliderButton:");
  [(DBSLargeTextSliderListController *)self->_extendedRangeSliderListController setShowsResetSliderButton:v3];
  if (self->_usesExtendedRange) {
    uint64_t v5 = 1392;
  }
  else {
    uint64_t v5 = 1384;
  }
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
  [v6 reloadSpecifiers];
}

- (void)updateSlider
{
  BOOL v3 = [(DBSLargeTextController *)self readUsesExtendedRange];
  BOOL usesExtendedRange = self->_usesExtendedRange;
  if (usesExtendedRange != v3)
  {
    [(DBSLargeTextController *)self updateSlidersForNewUsesExtendedRangeValue:v3];
    BOOL usesExtendedRange = self->_usesExtendedRange;
  }
  if (usesExtendedRange) {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v5);
  [v6 updateSliderValue];
}

- (id)readPreferredContentSizeCategoryName
{
  CFStringRef v3 = (const __CFString *)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  id v4 = (void *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v3);
  if (self->_usesExtendedRange) {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    uint64_t v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  uint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v5) contentSizeCategories];
  int v7 = [v6 containsObject:v4];

  if (v7) {
    id v8 = v4;
  }
  else {
    id v8 = (void *)*MEMORY[0x263F83468];
  }
  id v9 = v8;

  return v9;
}

- (void)savePreferredContentSizeCategoryName:(id)a3
{
  id v11 = a3;
  if (self->_usesExtendedRange) {
    id v4 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  }
  else {
    id v4 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  }
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v4) contentSizeCategories];
  int v6 = [v5 containsObject:v11];

  if (v6) {
    int v7 = v11;
  }
  else {
    int v7 = (const void *)*MEMORY[0x263F83468];
  }
  CFStringRef v8 = (const __CFString *)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  CFPreferencesSetAppValue(@"UIPreferredContentSizeCategoryName", v7, v8);
  CFStringRef v9 = (const __CFString *)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  CFPreferencesAppSynchronize(v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"ApplePreferredContentSizeCategoryChangedNotification", 0, 0, 1u);
}

- (BOOL)readUsesExtendedRange
{
  return CFPreferencesGetAppBooleanValue(@"largeTextUsesExtendedRange", @"com.apple.preferences-framework", 0) != 0;
}

- (void)saveUsesExtendedRange:(BOOL)a3
{
  CFStringRef v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFStringRef v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"largeTextUsesExtendedRange", *v3, @"com.apple.preferences-framework");
  CFPreferencesAppSynchronize(@"com.apple.preferences-framework");
}

- (BOOL)showsExtendedRangeSwitch
{
  return self->_showsExtendedRangeSwitch;
}

- (BOOL)showsResetSliderButton
{
  return self->_showsResetSliderButton;
}

- (BOOL)savesCategoryNameOnlyOnSliderEvent
{
  return self->_savesCategoryNameOnlyOnSliderEvent;
}

- (void)setSavesCategoryNameOnlyOnSliderEvent:(BOOL)a3
{
  self->_savesCategoryNameOnlyOnSliderEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedRangeSliderListController, 0);
  objc_storeStrong((id *)&self->_sliderListController, 0);
}

@end