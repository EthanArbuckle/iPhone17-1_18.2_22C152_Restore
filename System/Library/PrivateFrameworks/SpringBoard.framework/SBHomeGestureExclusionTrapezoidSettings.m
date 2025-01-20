@interface SBHomeGestureExclusionTrapezoidSettings
+ (id)settingsControllerModule;
- (BOOL)allowHorizontalSwipesOutsideLandscapeTrapezoid;
- (BOOL)allowHorizontalSwipesOutsidePortraitTrapezoid;
- (BOOL)landscapeTrapezoidEnabled;
- (BOOL)portraitTrapezoidEnabled;
- (BOOL)portraitTrapezoidEnabledOnlyForKeyboards;
- (BOOL)showExclusionTrapezoidDebugView;
- (double)landscapeTrapezoidAdjacentXDistanceFromEdge;
- (double)landscapeTrapezoidBaseHeight;
- (double)landscapeTrapezoidHeight;
- (double)landscapeTrapezoidOpposingXDistanceFromEdge;
- (double)portraitTrapezoidAdjacentXDistanceFromEdge;
- (double)portraitTrapezoidBaseHeight;
- (double)portraitTrapezoidHeight;
- (double)portraitTrapezoidOpposingXDistanceFromEdge;
- (void)setAllowHorizontalSwipesOutsideLandscapeTrapezoid:(BOOL)a3;
- (void)setAllowHorizontalSwipesOutsidePortraitTrapezoid:(BOOL)a3;
- (void)setDefaultValues;
- (void)setLandscapeTrapezoidAdjacentXDistanceFromEdge:(double)a3;
- (void)setLandscapeTrapezoidBaseHeight:(double)a3;
- (void)setLandscapeTrapezoidEnabled:(BOOL)a3;
- (void)setLandscapeTrapezoidHeight:(double)a3;
- (void)setLandscapeTrapezoidOpposingXDistanceFromEdge:(double)a3;
- (void)setPortraitTrapezoidAdjacentXDistanceFromEdge:(double)a3;
- (void)setPortraitTrapezoidBaseHeight:(double)a3;
- (void)setPortraitTrapezoidEnabled:(BOOL)a3;
- (void)setPortraitTrapezoidEnabledOnlyForKeyboards:(BOOL)a3;
- (void)setPortraitTrapezoidHeight:(double)a3;
- (void)setPortraitTrapezoidOpposingXDistanceFromEdge:(double)a3;
- (void)setShowExclusionTrapezoidDebugView:(BOOL)a3;
@end

@implementation SBHomeGestureExclusionTrapezoidSettings

- (BOOL)showExclusionTrapezoidDebugView
{
  return self->_showExclusionTrapezoidDebugView;
}

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureExclusionTrapezoidSettings;
  [(PTSettings *)&v7 setDefaultValues];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setShowExclusionTrapezoidDebugView:0];
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(SBHomeGestureExclusionTrapezoidSettings *)self setLandscapeTrapezoidEnabled:(v4 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setAllowHorizontalSwipesOutsideLandscapeTrapezoid:0];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setLandscapeTrapezoidHeight:18.5];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setLandscapeTrapezoidBaseHeight:7.5];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setLandscapeTrapezoidAdjacentXDistanceFromEdge:236.0];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setLandscapeTrapezoidOpposingXDistanceFromEdge:236.0];
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidEnabled:(v6 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidEnabledOnlyForKeyboards:1];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setAllowHorizontalSwipesOutsidePortraitTrapezoid:1];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidHeight:24.5];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidBaseHeight:7.5];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidAdjacentXDistanceFromEdge:60.0];
  [(SBHomeGestureExclusionTrapezoidSettings *)self setPortraitTrapezoidOpposingXDistanceFromEdge:60.0];
}

+ (id)settingsControllerModule
{
  v58[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"landscapeTrapezoidEnabled == YES"];
  v50 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Trapezoid" valueKeyPath:@"landscapeTrapezoidEnabled"];
  v58[0] = v50;
  v48 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Horizontal Swipes Outside Trapezoid" valueKeyPath:@"allowHorizontalSwipesOutsideLandscapeTrapezoid"];
  v58[1] = v48;
  v46 = [MEMORY[0x1E4F94140] rowWithTitle:@"Trapezoid Height" valueKeyPath:@"landscapeTrapezoidHeight"];
  v44 = [v46 between:0.1 and:20.0];
  v42 = [v44 condition:v2];
  v58[2] = v42;
  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Base Height" valueKeyPath:@"landscapeTrapezoidBaseHeight"];
  uint64_t v4 = [v3 between:0.0 and:100.0];
  v5 = [v4 condition:v2];
  v58[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F94140] rowWithTitle:@"Adjacent Base X Distance From Edge" valueKeyPath:@"landscapeTrapezoidAdjacentXDistanceFromEdge"];
  objc_super v7 = [v6 between:0.0 and:500.0];
  v53 = (void *)v2;
  v8 = [v7 condition:v2];
  v58[4] = v8;
  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"Opposing Base X Distance From Edge" valueKeyPath:@"landscapeTrapezoidOpposingXDistanceFromEdge"];
  v10 = [v9 between:0.0 and:500.0];
  v11 = [v10 condition:v2];
  v58[5] = v11;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];

  v51 = [MEMORY[0x1E4F94168] sectionWithRows:v52 title:@"Landscape Trapezoid"];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"portraitTrapezoidEnabled == YES"];
  v47 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Trapezoid" valueKeyPath:@"portraitTrapezoidEnabled"];
  v57[0] = v47;
  v45 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Horizontal Swipes Outside Trapezoid" valueKeyPath:@"allowHorizontalSwipesOutsidePortraitTrapezoid"];
  v57[1] = v45;
  v43 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Only for Keyboards" valueKeyPath:@"portraitTrapezoidEnabledOnlyForKeyboards"];
  v57[2] = v43;
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Trapezoid Height" valueKeyPath:@"portraitTrapezoidHeight"];
  v40 = [v41 between:0.1 and:20.0];
  v39 = [v40 condition:v12];
  v57[3] = v39;
  v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Base Height" valueKeyPath:@"portraitTrapezoidBaseHeight"];
  v14 = [v13 between:0.0 and:100.0];
  v15 = [v14 condition:v12];
  v57[4] = v15;
  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Adjacent Base X Distance From Edge" valueKeyPath:@"portraitTrapezoidAdjacentXDistanceFromEdge"];
  v17 = [v16 between:0.0 and:500.0];
  v49 = (void *)v12;
  v18 = [v17 condition:v12];
  v57[5] = v18;
  v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Opposing Base X Distance From Edge" valueKeyPath:@"portraitTrapezoidOpposingXDistanceFromEdge"];
  v20 = [v19 between:0.0 and:500.0];
  v21 = [v20 condition:v12];
  v57[6] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:7];

  v23 = (void *)v22;
  v24 = [MEMORY[0x1E4F94168] sectionWithRows:v22 title:@"Portrait Trapezoid"];
  v25 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Visualize Trapezoids" valueKeyPath:@"showExclusionTrapezoidDebugView"];
  v26 = (void *)MEMORY[0x1E4F94168];
  v56 = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  v28 = [v26 sectionWithRows:v27];

  v29 = (void *)MEMORY[0x1E4F94100];
  v30 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v31 = [v29 rowWithTitle:@"Restore Defaults" action:v30];

  v32 = (void *)MEMORY[0x1E4F94168];
  v55 = v31;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v34 = [v32 sectionWithRows:v33];

  v35 = (void *)MEMORY[0x1E4F94168];
  v54[0] = v51;
  v54[1] = v24;
  v54[2] = v28;
  v54[3] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
  v37 = [v35 moduleWithTitle:0 contents:v36];

  return v37;
}

- (void)setShowExclusionTrapezoidDebugView:(BOOL)a3
{
  self->_showExclusionTrapezoidDebugView = a3;
}

- (BOOL)landscapeTrapezoidEnabled
{
  return self->_landscapeTrapezoidEnabled;
}

- (void)setLandscapeTrapezoidEnabled:(BOOL)a3
{
  self->_landscapeTrapezoidEnabled = a3;
}

- (BOOL)allowHorizontalSwipesOutsideLandscapeTrapezoid
{
  return self->_allowHorizontalSwipesOutsideLandscapeTrapezoid;
}

- (void)setAllowHorizontalSwipesOutsideLandscapeTrapezoid:(BOOL)a3
{
  self->_allowHorizontalSwipesOutsideLandscapeTrapezoid = a3;
}

- (double)landscapeTrapezoidHeight
{
  return self->_landscapeTrapezoidHeight;
}

- (void)setLandscapeTrapezoidHeight:(double)a3
{
  self->_landscapeTrapezoidHeight = a3;
}

- (double)landscapeTrapezoidBaseHeight
{
  return self->_landscapeTrapezoidBaseHeight;
}

- (void)setLandscapeTrapezoidBaseHeight:(double)a3
{
  self->_landscapeTrapezoidBaseHeight = a3;
}

- (double)landscapeTrapezoidAdjacentXDistanceFromEdge
{
  return self->_landscapeTrapezoidAdjacentXDistanceFromEdge;
}

- (void)setLandscapeTrapezoidAdjacentXDistanceFromEdge:(double)a3
{
  self->_landscapeTrapezoidAdjacentXDistanceFromEdge = a3;
}

- (double)landscapeTrapezoidOpposingXDistanceFromEdge
{
  return self->_landscapeTrapezoidOpposingXDistanceFromEdge;
}

- (void)setLandscapeTrapezoidOpposingXDistanceFromEdge:(double)a3
{
  self->_landscapeTrapezoidOpposingXDistanceFromEdge = a3;
}

- (BOOL)portraitTrapezoidEnabled
{
  return self->_portraitTrapezoidEnabled;
}

- (void)setPortraitTrapezoidEnabled:(BOOL)a3
{
  self->_portraitTrapezoidEnabled = a3;
}

- (BOOL)portraitTrapezoidEnabledOnlyForKeyboards
{
  return self->_portraitTrapezoidEnabledOnlyForKeyboards;
}

- (void)setPortraitTrapezoidEnabledOnlyForKeyboards:(BOOL)a3
{
  self->_portraitTrapezoidEnabledOnlyForKeyboards = a3;
}

- (BOOL)allowHorizontalSwipesOutsidePortraitTrapezoid
{
  return self->_allowHorizontalSwipesOutsidePortraitTrapezoid;
}

- (void)setAllowHorizontalSwipesOutsidePortraitTrapezoid:(BOOL)a3
{
  self->_allowHorizontalSwipesOutsidePortraitTrapezoid = a3;
}

- (double)portraitTrapezoidHeight
{
  return self->_portraitTrapezoidHeight;
}

- (void)setPortraitTrapezoidHeight:(double)a3
{
  self->_portraitTrapezoidHeight = a3;
}

- (double)portraitTrapezoidBaseHeight
{
  return self->_portraitTrapezoidBaseHeight;
}

- (void)setPortraitTrapezoidBaseHeight:(double)a3
{
  self->_portraitTrapezoidBaseHeight = a3;
}

- (double)portraitTrapezoidAdjacentXDistanceFromEdge
{
  return self->_portraitTrapezoidAdjacentXDistanceFromEdge;
}

- (void)setPortraitTrapezoidAdjacentXDistanceFromEdge:(double)a3
{
  self->_portraitTrapezoidAdjacentXDistanceFromEdge = a3;
}

- (double)portraitTrapezoidOpposingXDistanceFromEdge
{
  return self->_portraitTrapezoidOpposingXDistanceFromEdge;
}

- (void)setPortraitTrapezoidOpposingXDistanceFromEdge:(double)a3
{
  self->_portraitTrapezoidOpposingXDistanceFromEdge = a3;
}

@end