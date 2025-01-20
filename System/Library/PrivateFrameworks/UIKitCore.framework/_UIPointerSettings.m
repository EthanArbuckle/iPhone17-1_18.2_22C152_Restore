@interface _UIPointerSettings
+ (id)settingsControllerModule;
- (BOOL)showEffectPlatter;
- (BOOL)showMenuPressDuration;
- (BOOL)showRegions;
- (_UIBeamPointerSettings)beamSettings;
- (_UIButtonBehaviorSettings)buttonSettings;
- (_UIFreeformPointerSettings)freeformPointerSettings;
- (_UILinkPointerSettings)linkPointerSettings;
- (_UINavigationAndToolbarBehaviorSettings)navigationAndToolbarSettings;
- (_UIPointerEffectSizeRuleSettings)sizeRuleSettings;
- (_UIPointerHighlightEffectSettings)highlightEffectSettings;
- (_UIPointerHoverEffectSettings)hoverEffectSettings;
- (_UIPointerLiftEffectSettings)liftEffectSettings;
- (_UIPointerSBAppIconEffectSettings)SBAppIconEffectSettings;
- (_UIPointerTextBehaviorSettings)textSettings;
- (_UISearchBarBehaviorSettings)searchBarSettings;
- (_UITabBarBehaviorSettings)tabBarSettings;
- (void)setBeamSettings:(id)a3;
- (void)setButtonSettings:(id)a3;
- (void)setDefaultValues;
- (void)setFreeformPointerSettings:(id)a3;
- (void)setHighlightEffectSettings:(id)a3;
- (void)setHoverEffectSettings:(id)a3;
- (void)setLiftEffectSettings:(id)a3;
- (void)setLinkPointerSettings:(id)a3;
- (void)setNavigationAndToolbarSettings:(id)a3;
- (void)setSBAppIconEffectSettings:(id)a3;
- (void)setSearchBarSettings:(id)a3;
- (void)setShowEffectPlatter:(BOOL)a3;
- (void)setShowMenuPressDuration:(BOOL)a3;
- (void)setShowRegions:(BOOL)a3;
- (void)setSizeRuleSettings:(id)a3;
- (void)setTabBarSettings:(id)a3;
- (void)setTextSettings:(id)a3;
@end

@implementation _UIPointerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIPointerSettings *)self setShowRegions:0];
  [(_UIPointerSettings *)self setShowEffectPlatter:0];
  [(_UIPointerSettings *)self setShowMenuPressDuration:0];
}

+ (id)settingsControllerModule
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v21 = (id)MEMORY[0x1E4F94160];
  v33 = [MEMORY[0x1E4F94130] rowWithTitle:@"Size Rule Settings" childSettingsKeyPath:@"sizeRuleSettings"];
  v37[0] = v33;
  v32 = [MEMORY[0x1E4F94130] rowWithTitle:@"Highlight Effect" childSettingsKeyPath:@"highlightEffectSettings"];
  v37[1] = v32;
  v31 = [MEMORY[0x1E4F94130] rowWithTitle:@"Lift Effect" childSettingsKeyPath:@"liftEffectSettings"];
  v37[2] = v31;
  v30 = [MEMORY[0x1E4F94130] rowWithTitle:@"Hover Effect" childSettingsKeyPath:@"hoverEffectSettings"];
  v37[3] = v30;
  v29 = [MEMORY[0x1E4F94130] rowWithTitle:@"SB App Icon Effect" childSettingsKeyPath:@"SBAppIconEffectSettings"];
  v37[4] = v29;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  v27 = [v2 sectionWithRows:v28 title:@"Effect Settings"];
  v38[0] = v27;
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v26 = [MEMORY[0x1E4F94130] rowWithTitle:@"Freeform Pointer" childSettingsKeyPath:@"freeformPointerSettings"];
  v36[0] = v26;
  v25 = [MEMORY[0x1E4F94130] rowWithTitle:@"Beam" childSettingsKeyPath:@"beamSettings"];
  v36[1] = v25;
  v24 = [MEMORY[0x1E4F94130] rowWithTitle:@"Link Pointer" childSettingsKeyPath:@"linkPointerSettings"];
  v36[2] = v24;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v20 = [v3 sectionWithRows:v23 title:@"Special Pointer Settings"];
  v38[1] = v20;
  v4 = (void *)MEMORY[0x1E4F94160];
  v19 = [MEMORY[0x1E4F94130] rowWithTitle:@"Text Interactions" childSettingsKeyPath:@"textSettings"];
  v35[0] = v19;
  v18 = [MEMORY[0x1E4F94130] rowWithTitle:@"Button Interactions" childSettingsKeyPath:@"buttonSettings"];
  v35[1] = v18;
  v17 = [MEMORY[0x1E4F94130] rowWithTitle:@"NavigationBar & Toolbar Interactions" childSettingsKeyPath:@"navigationAndToolbarSettings"];
  v35[2] = v17;
  v5 = [MEMORY[0x1E4F94130] rowWithTitle:@"TabBar Interactions" childSettingsKeyPath:@"tabBarSettings"];
  v35[3] = v5;
  v6 = [MEMORY[0x1E4F94130] rowWithTitle:@"SearchBar Interactions" childSettingsKeyPath:@"searchBarSettings"];
  v35[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  v8 = [v4 sectionWithRows:v7 title:@"Pointer Related Behavior Settings"];
  v38[2] = v8;
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Pointer Regions" valueKeyPath:@"showRegions"];
  v34[0] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Effect Platter Debug Border" valueKeyPath:@"showEffectPlatter"];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Context Menu Press Duration" valueKeyPath:@"showMenuPressDuration"];
  v34[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  v14 = [v9 sectionWithRows:v13 title:@"Debugging"];
  v38[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  id v22 = [v21 moduleWithTitle:@"UIKit Pointer Settings" contents:v15];

  return v22;
}

- (BOOL)showRegions
{
  return self->_showRegions;
}

- (void)setShowRegions:(BOOL)a3
{
  self->_showRegions = a3;
}

- (BOOL)showEffectPlatter
{
  return self->_showEffectPlatter;
}

- (void)setShowEffectPlatter:(BOOL)a3
{
  self->_showEffectPlatter = a3;
}

- (BOOL)showMenuPressDuration
{
  return self->_showMenuPressDuration;
}

- (void)setShowMenuPressDuration:(BOOL)a3
{
  self->_showMenuPressDuration = a3;
}

- (_UIPointerEffectSizeRuleSettings)sizeRuleSettings
{
  return self->_sizeRuleSettings;
}

- (void)setSizeRuleSettings:(id)a3
{
}

- (_UIFreeformPointerSettings)freeformPointerSettings
{
  return self->_freeformPointerSettings;
}

- (void)setFreeformPointerSettings:(id)a3
{
}

- (_UIBeamPointerSettings)beamSettings
{
  return self->_beamSettings;
}

- (void)setBeamSettings:(id)a3
{
}

- (_UILinkPointerSettings)linkPointerSettings
{
  return self->_linkPointerSettings;
}

- (void)setLinkPointerSettings:(id)a3
{
}

- (_UIPointerHighlightEffectSettings)highlightEffectSettings
{
  return self->_highlightEffectSettings;
}

- (void)setHighlightEffectSettings:(id)a3
{
}

- (_UIPointerLiftEffectSettings)liftEffectSettings
{
  return self->_liftEffectSettings;
}

- (void)setLiftEffectSettings:(id)a3
{
}

- (_UIPointerHoverEffectSettings)hoverEffectSettings
{
  return self->_hoverEffectSettings;
}

- (void)setHoverEffectSettings:(id)a3
{
}

- (_UIPointerSBAppIconEffectSettings)SBAppIconEffectSettings
{
  return self->_SBAppIconEffectSettings;
}

- (void)setSBAppIconEffectSettings:(id)a3
{
}

- (_UIPointerTextBehaviorSettings)textSettings
{
  return self->_textSettings;
}

- (void)setTextSettings:(id)a3
{
}

- (_UIButtonBehaviorSettings)buttonSettings
{
  return self->_buttonSettings;
}

- (void)setButtonSettings:(id)a3
{
}

- (_UINavigationAndToolbarBehaviorSettings)navigationAndToolbarSettings
{
  return self->_navigationAndToolbarSettings;
}

- (void)setNavigationAndToolbarSettings:(id)a3
{
}

- (_UITabBarBehaviorSettings)tabBarSettings
{
  return self->_tabBarSettings;
}

- (void)setTabBarSettings:(id)a3
{
}

- (_UISearchBarBehaviorSettings)searchBarSettings
{
  return self->_searchBarSettings;
}

- (void)setSearchBarSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarSettings, 0);
  objc_storeStrong((id *)&self->_tabBarSettings, 0);
  objc_storeStrong((id *)&self->_navigationAndToolbarSettings, 0);
  objc_storeStrong((id *)&self->_buttonSettings, 0);
  objc_storeStrong((id *)&self->_textSettings, 0);
  objc_storeStrong((id *)&self->_SBAppIconEffectSettings, 0);
  objc_storeStrong((id *)&self->_hoverEffectSettings, 0);
  objc_storeStrong((id *)&self->_liftEffectSettings, 0);
  objc_storeStrong((id *)&self->_highlightEffectSettings, 0);
  objc_storeStrong((id *)&self->_linkPointerSettings, 0);
  objc_storeStrong((id *)&self->_beamSettings, 0);
  objc_storeStrong((id *)&self->_freeformPointerSettings, 0);
  objc_storeStrong((id *)&self->_sizeRuleSettings, 0);
}

@end