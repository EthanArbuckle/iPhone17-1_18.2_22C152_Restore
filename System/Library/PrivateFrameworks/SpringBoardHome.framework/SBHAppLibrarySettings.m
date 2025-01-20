@interface SBHAppLibrarySettings
+ (id)settingsControllerModule;
- (double)criticalDismissalThresholdDurationFactor;
- (double)minimumTranslationFractionForSwipeToDismiss;
- (double)minimumVelocityForSwipeToDismiss;
- (unint64_t)minimumNumberOfIconsToShowSectionHeaderInDeweySearch;
- (void)setCriticalDismissalThresholdDurationFactor:(double)a3;
- (void)setDefaultValues;
- (void)setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:(unint64_t)a3;
- (void)setMinimumTranslationFractionForSwipeToDismiss:(double)a3;
- (void)setMinimumVelocityForSwipeToDismiss:(double)a3;
@end

@implementation SBHAppLibrarySettings

- (void)setDefaultValues
{
  [(SBHAppLibrarySettings *)self setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:75];
  [(SBHAppLibrarySettings *)self setCriticalDismissalThresholdDurationFactor:0.0];
  [(SBHAppLibrarySettings *)self setMinimumVelocityForSwipeToDismiss:450.0];
  [(SBHAppLibrarySettings *)self setMinimumTranslationFractionForSwipeToDismiss:0.25];
}

+ (id)settingsControllerModule
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F940F8];
  v3 = [MEMORY[0x1E4F94170] action];
  v26 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v26;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v25 = [v4 sectionWithRows:v5];

  v6 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Section Header Minimum Icons" valueKeyPath:@"minimumNumberOfIconsToShowSectionHeaderInDeweySearch"];
  v24 = [v6 minValue:25.0 maxValue:150.0];

  [v24 setValueValidatator:&__block_literal_global_50];
  v7 = (void *)MEMORY[0x1E4F94160];
  v29 = v24;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v23 = [v7 sectionWithRows:v8 title:@"Search"];

  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Critical Dismissal Duration Factor" valueKeyPath:@"criticalDismissalThresholdDurationFactor"];
  v11 = [v10 between:0.0 and:1.0];
  v12 = [v11 precision:3];
  v28[0] = v12;
  v13 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Velocity for Swipe To Dismiss" valueKeyPath:@"minimumVelocityForSwipeToDismiss"];
  v14 = [v13 minValue:100.0 maxValue:2500.0];
  v28[1] = v14;
  v15 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Translation Fraction for Swipe To Dismiss" valueKeyPath:@"minimumTranslationFractionForSwipeToDismiss"];
  v16 = [v15 minValue:0.0 maxValue:1.0];
  v28[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v18 = [v9 sectionWithRows:v17 title:@"Trailing Page"];

  v19 = (void *)MEMORY[0x1E4F94160];
  v27[0] = v23;
  v27[1] = v18;
  v27[2] = v25;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v21 = [v19 moduleWithTitle:@"Icons" contents:v20];

  return v21;
}

uint64_t __49__SBHAppLibrarySettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 floatValue];
  *(float *)&double v3 = floorf(*(float *)&v3);
  return [v2 numberWithFloat:v3];
}

- (unint64_t)minimumNumberOfIconsToShowSectionHeaderInDeweySearch
{
  return self->_minimumNumberOfIconsToShowSectionHeaderInDeweySearch;
}

- (void)setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:(unint64_t)a3
{
  self->_minimumNumberOfIconsToShowSectionHeaderInDeweySearch = a3;
}

- (double)criticalDismissalThresholdDurationFactor
{
  return self->_criticalDismissalThresholdDurationFactor;
}

- (void)setCriticalDismissalThresholdDurationFactor:(double)a3
{
  self->_criticalDismissalThresholdDurationFactor = a3;
}

- (double)minimumVelocityForSwipeToDismiss
{
  return self->_minimumVelocityForSwipeToDismiss;
}

- (void)setMinimumVelocityForSwipeToDismiss:(double)a3
{
  self->_minimumVelocityForSwipeToDismiss = a3;
}

- (double)minimumTranslationFractionForSwipeToDismiss
{
  return self->_minimumTranslationFractionForSwipeToDismiss;
}

- (void)setMinimumTranslationFractionForSwipeToDismiss:(double)a3
{
  self->_minimumTranslationFractionForSwipeToDismiss = a3;
}

@end