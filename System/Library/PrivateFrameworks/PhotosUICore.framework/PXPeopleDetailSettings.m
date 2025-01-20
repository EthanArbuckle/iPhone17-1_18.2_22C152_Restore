@interface PXPeopleDetailSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)showAnnotateButton;
- (id)parentSettings;
- (unint64_t)unverifiedPeopleAnnotationMinimumFaceCount;
- (void)setDefaultValues;
- (void)setShowAnnotateButton:(BOOL)a3;
- (void)setUnverifiedPeopleAnnotationMinimumFaceCount:(unint64_t)a3;
@end

@implementation PXPeopleDetailSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDetailSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPeopleDetailSettings *)self setShowAnnotateButton:0];
  [(PXPeopleDetailSettings *)self setUnverifiedPeopleAnnotationMinimumFaceCount:5];
}

- (void)setUnverifiedPeopleAnnotationMinimumFaceCount:(unint64_t)a3
{
  self->_unverifiedPeopleAnnotationMinimumFaceCount = a3;
}

- (void)setShowAnnotateButton:(BOOL)a3
{
  self->_showAnnotateButton = a3;
}

- (unint64_t)unverifiedPeopleAnnotationMinimumFaceCount
{
  return self->_unverifiedPeopleAnnotationMinimumFaceCount;
}

- (BOOL)showAnnotateButton
{
  return self->_showAnnotateButton;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Person Details", &__block_literal_global_6);
  v27[0] = v3;
  v4 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Face Crop Details", &__block_literal_global_12_88762);
  v27[1] = v4;
  v5 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"People Donation", &__block_literal_global_18_88764);
  v27[2] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Pet Details", &__block_literal_global_24);
  v27[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  v8 = [v2 sectionWithRows:v7];

  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F941F0];
  v11 = NSStringFromSelector(sel_showAnnotateButton);
  v12 = [v10 rowWithTitle:@"People Annotation" valueKeyPath:v11];
  v26[0] = v12;
  v13 = (void *)MEMORY[0x1E4F941D8];
  v14 = NSStringFromSelector(sel_unverifiedPeopleAnnotationMinimumFaceCount);
  v15 = [v13 rowWithTitle:@"Unverified Person Minimum Face Count" valueKeyPath:v14];
  v16 = [v15 minValue:1.0 maxValue:50.0];
  v17 = objc_msgSend(v16, "px_increment:", 1.0);
  v18 = [v17 conditionFormat:@"showAnnotateButton == YES"];
  v26[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v20 = [v9 sectionWithRows:v19 title:@"People Annotation Settings"];

  v21 = (void *)MEMORY[0x1E4F94160];
  v25[0] = v8;
  v25[1] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v23 = [v21 moduleWithTitle:@"Faces Debug UI" contents:v22];

  return v23;
}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [[PXPeopleDetailSettingsViewController alloc] initWithPersonDetectionType:2];
  [v2 pushViewController:v3 animated:1];
}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = objc_alloc_init(PXPeopleDonationSettingsViewController);
  [v2 pushViewController:v3 animated:1];
}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = objc_alloc_init(PXPeopleDetailSettingsFaceCropController);
  [v2 pushViewController:v3 animated:1];
}

void __50__PXPeopleDetailSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = objc_alloc_init(PXPeopleDetailSettingsViewController);
  [v2 pushViewController:v3 animated:1];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_88799 != -1) {
    dispatch_once(&sharedInstance_onceToken_88799, &__block_literal_global_88800);
  }
  id v2 = (void *)sharedInstance_sharedInstance_88801;
  return v2;
}

void __40__PXPeopleDetailSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 peopleDetail];
  v1 = (void *)sharedInstance_sharedInstance_88801;
  sharedInstance_sharedInstance_88801 = v0;
}

@end