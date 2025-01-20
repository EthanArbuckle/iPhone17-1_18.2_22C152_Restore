@interface SBEntityRemovalAnimationSettings
+ (id)settingsControllerModule;
- (SBEntityRemovalDosidoDefaultAnimationSettings)dosidoDeleteIntentAnimationSettings;
- (SBEntityRemovalDosidoSlideOutDownwardAnimationSettings)dosidoDeclineIntentAnimationSettings;
- (SBEntityRemovalDosidoSlideOutUpwardAnimationSettings)dosidoCommitIntentAnimationSettings;
- (SBEntityRemovalFloatingDefaultAnimationSettings)floatingDeleteIntentAnimationSettings;
- (SBEntityRemovalFloatingSlideOutDownwardAnimationSettings)floatingDeclineIntentAnimationSettings;
- (SBEntityRemovalFloatingSlideOutUpwardAnimationSettings)floatingCommitIntentAnimationSettings;
- (SBEntityRemovalMedusaDefaultAnimationSettings)medusaDeleteIntentAnimationSettings;
- (SBEntityRemovalMedusaSlideOutDownwardAnimationSettings)medusaDeclineIntentAnimationSettings;
- (SBEntityRemovalMedusaSlideOutUpwardAnimationSettings)medusaCommitIntentAnimationSettings;
- (void)setDosidoCommitIntentAnimationSettings:(id)a3;
- (void)setDosidoDeclineIntentAnimationSettings:(id)a3;
- (void)setDosidoDeleteIntentAnimationSettings:(id)a3;
- (void)setFloatingCommitIntentAnimationSettings:(id)a3;
- (void)setFloatingDeclineIntentAnimationSettings:(id)a3;
- (void)setFloatingDeleteIntentAnimationSettings:(id)a3;
- (void)setMedusaCommitIntentAnimationSettings:(id)a3;
- (void)setMedusaDeclineIntentAnimationSettings:(id)a3;
- (void)setMedusaDeleteIntentAnimationSettings:(id)a3;
@end

@implementation SBEntityRemovalAnimationSettings

+ (id)settingsControllerModule
{
  v19[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v17 = [MEMORY[0x1E4F94138] rowWithTitle:@"Medusa — Delete" childSettingsKeyPath:@"medusaDeleteIntentAnimationSettings"];
  v19[0] = v17;
  v3 = [MEMORY[0x1E4F94138] rowWithTitle:@"Medusa — Commit" childSettingsKeyPath:@"medusaCommitIntentAnimationSettings"];
  v19[1] = v3;
  v4 = [MEMORY[0x1E4F94138] rowWithTitle:@"Medusa — Decline" childSettingsKeyPath:@"medusaDeclineIntentAnimationSettings"];
  v19[2] = v4;
  v5 = [MEMORY[0x1E4F94138] rowWithTitle:@"Floating — Delete" childSettingsKeyPath:@"floatingDeleteIntentAnimationSettings"];
  v19[3] = v5;
  v6 = [MEMORY[0x1E4F94138] rowWithTitle:@"Floating — Commit" childSettingsKeyPath:@"floatingCommitIntentAnimationSettings"];
  v19[4] = v6;
  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Floating — Decline" childSettingsKeyPath:@"floatingDeclineIntentAnimationSettings"];
  v19[5] = v7;
  v8 = [MEMORY[0x1E4F94138] rowWithTitle:@"To Home Screen — Delete" childSettingsKeyPath:@"dosidoDeleteIntentAnimationSettings"];
  v19[6] = v8;
  v9 = [MEMORY[0x1E4F94138] rowWithTitle:@"To Home Screen — Commit" childSettingsKeyPath:@"dosidoCommitIntentAnimationSettings"];
  v19[7] = v9;
  v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"To Home Screen — Decline" childSettingsKeyPath:@"dosidoDeclineIntentAnimationSettings"];
  v19[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:9];
  v12 = [v2 sectionWithRows:v11 title:@"App Scene Entity Removal"];

  v13 = (void *)MEMORY[0x1E4F94168];
  v18 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v15 = [v13 moduleWithTitle:@"App Scene Entity Removal Animations" contents:v14];

  return v15;
}

- (SBEntityRemovalMedusaDefaultAnimationSettings)medusaDeleteIntentAnimationSettings
{
  return self->_medusaDeleteIntentAnimationSettings;
}

- (void)setMedusaDeleteIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalMedusaSlideOutUpwardAnimationSettings)medusaCommitIntentAnimationSettings
{
  return self->_medusaCommitIntentAnimationSettings;
}

- (void)setMedusaCommitIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalMedusaSlideOutDownwardAnimationSettings)medusaDeclineIntentAnimationSettings
{
  return self->_medusaDeclineIntentAnimationSettings;
}

- (void)setMedusaDeclineIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalFloatingDefaultAnimationSettings)floatingDeleteIntentAnimationSettings
{
  return self->_floatingDeleteIntentAnimationSettings;
}

- (void)setFloatingDeleteIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalFloatingSlideOutUpwardAnimationSettings)floatingCommitIntentAnimationSettings
{
  return self->_floatingCommitIntentAnimationSettings;
}

- (void)setFloatingCommitIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalFloatingSlideOutDownwardAnimationSettings)floatingDeclineIntentAnimationSettings
{
  return self->_floatingDeclineIntentAnimationSettings;
}

- (void)setFloatingDeclineIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalDosidoDefaultAnimationSettings)dosidoDeleteIntentAnimationSettings
{
  return self->_dosidoDeleteIntentAnimationSettings;
}

- (void)setDosidoDeleteIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalDosidoSlideOutUpwardAnimationSettings)dosidoCommitIntentAnimationSettings
{
  return self->_dosidoCommitIntentAnimationSettings;
}

- (void)setDosidoCommitIntentAnimationSettings:(id)a3
{
}

- (SBEntityRemovalDosidoSlideOutDownwardAnimationSettings)dosidoDeclineIntentAnimationSettings
{
  return self->_dosidoDeclineIntentAnimationSettings;
}

- (void)setDosidoDeclineIntentAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dosidoDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dosidoCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dosidoDeleteIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_floatingDeleteIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaDeclineIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaCommitIntentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaDeleteIntentAnimationSettings, 0);
}

@end