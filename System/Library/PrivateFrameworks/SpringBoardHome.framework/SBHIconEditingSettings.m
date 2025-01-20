@interface SBHIconEditingSettings
+ (id)settingsControllerModule;
- (BOOL)showDragPlatterIconBorder;
- (BOOL)showIndexLabels;
- (BOOL)waitForPause;
- (PTOutlet)resetHomeScreenLayoutOutlet;
- (double)clusterFastestDuration;
- (double)clusterMiddleFastDuration;
- (double)clusterMiddleSlowDuration;
- (double)clusterSlowestDuration;
- (double)defaultPauseDuration;
- (double)defaultSpringDampingRatio;
- (double)defaultSpringDuration;
- (double)editingLiftDelay;
- (double)fastEditingPauseDuration;
- (double)longPressToEditDuration;
- (int64_t)overrideAnimationType;
- (void)setClusterFastestDuration:(double)a3;
- (void)setClusterMiddleFastDuration:(double)a3;
- (void)setClusterMiddleSlowDuration:(double)a3;
- (void)setClusterSlowestDuration:(double)a3;
- (void)setDefaultPauseDuration:(double)a3;
- (void)setDefaultSpringDampingRatio:(double)a3;
- (void)setDefaultSpringDuration:(double)a3;
- (void)setDefaultValues;
- (void)setEditingLiftDelay:(double)a3;
- (void)setFastEditingPauseDuration:(double)a3;
- (void)setLongPressToEditDuration:(double)a3;
- (void)setOverrideAnimationType:(int64_t)a3;
- (void)setResetHomeScreenLayoutOutlet:(id)a3;
- (void)setShowDragPlatterIconBorder:(BOOL)a3;
- (void)setShowIndexLabels:(BOOL)a3;
- (void)setWaitForPause:(BOOL)a3;
@end

@implementation SBHIconEditingSettings

- (BOOL)showIndexLabels
{
  return self->_showIndexLabels;
}

- (int64_t)overrideAnimationType
{
  return self->_overrideAnimationType;
}

- (void)setDefaultValues
{
  [(SBHIconEditingSettings *)self setShowIndexLabels:0];
  [(SBHIconEditingSettings *)self setShowDragPlatterIconBorder:0];
  [(SBHIconEditingSettings *)self setEditingLiftDelay:0.1];
  [(SBHIconEditingSettings *)self setLongPressToEditDuration:0.5];
  [(SBHIconEditingSettings *)self setDefaultSpringDampingRatio:0.85];
  [(SBHIconEditingSettings *)self setDefaultSpringDuration:0.67];
  [(SBHIconEditingSettings *)self setClusterFastestDuration:0.67];
  [(SBHIconEditingSettings *)self setClusterSlowestDuration:0.85];
  [(SBHIconEditingSettings *)self setClusterMiddleFastDuration:0.77];
  [(SBHIconEditingSettings *)self setClusterMiddleSlowDuration:0.82];
  [(SBHIconEditingSettings *)self setOverrideAnimationType:-1];
}

+ (id)settingsControllerModule
{
  v55[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F940F8];
  v3 = [MEMORY[0x1E4F94170] action];
  v48 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94160];
  v55[0] = v48;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v46 = [v4 sectionWithRows:v5];

  v47 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Reset Home Screen Layout" outletKeyPath:@"resetHomeScreenLayoutOutlet"];
  v6 = (void *)MEMORY[0x1E4F94160];
  v54 = v47;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v45 = [v6 sectionWithRows:v7];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Editing Lift Delay" valueKeyPath:@"editingLiftDelay"];
  v9 = [v8 between:0.0 and:2.0];
  v10 = [v9 precision:2];
  v53[0] = v10;
  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Long Press To Edit Duration" valueKeyPath:@"longPressToEditDuration"];
  v12 = [v11 between:0.0 and:2.0];
  v13 = [v12 precision:2];
  v53[1] = v13;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];

  v44 = [MEMORY[0x1E4F94160] sectionWithRows:v40];
  v14 = [MEMORY[0x1E4F94108] rowWithTitle:@"Override Animation Type" valueKeyPath:@"overrideAnimationType"];
  v49 = [v14 possibleValues:&unk_1F300F198 titles:&unk_1F300F1B0];

  v43 = [MEMORY[0x1E4F94148] rowWithTitle:@"Default Spring Duration" valueKeyPath:@"defaultSpringDuration"];
  v42 = [v43 between:0.0 and:2.0];
  v41 = [v42 precision:2];
  v52[0] = v41;
  v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"Default Spring Damping Ratio" valueKeyPath:@"defaultSpringDampingRatio"];
  v38 = [v39 between:0.0 and:2.0];
  v37 = [v38 precision:2];
  v52[1] = v37;
  v36 = [MEMORY[0x1E4F94148] rowWithTitle:@"Cluster Fastest Duration" valueKeyPath:@"clusterFastestDuration"];
  v35 = [v36 between:0.0 and:2.0];
  v34 = [v35 precision:2];
  v52[2] = v34;
  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"Cluster Slowest Duration" valueKeyPath:@"clusterSlowestDuration"];
  v16 = [v15 between:0.0 and:2.0];
  v17 = [v16 precision:2];
  v52[3] = v17;
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Cluster Middle Fast Duration" valueKeyPath:@"clusterMiddleFastDuration"];
  v19 = [v18 between:0.0 and:2.0];
  v20 = [v19 precision:2];
  v52[4] = v20;
  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"Cluster Middle Slow Duration" valueKeyPath:@"clusterMiddleSlowDuration"];
  v22 = [v21 between:0.0 and:2.0];
  v23 = [v22 precision:2];
  v52[5] = v23;
  v52[6] = v49;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];

  v25 = [MEMORY[0x1E4F94160] sectionWithRows:v24];
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Index Labels" valueKeyPath:@"showIndexLabels"];
  v51[0] = v26;
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Drag Platter Icon Border" valueKeyPath:@"showDragPlatterIconBorder"];
  v51[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];

  v29 = [MEMORY[0x1E4F94160] sectionWithRows:v28];
  v30 = (void *)MEMORY[0x1E4F94160];
  v50[0] = v46;
  v50[1] = v45;
  v50[2] = v44;
  v50[3] = v25;
  v50[4] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
  v32 = [v30 moduleWithTitle:@"Icon Editing" contents:v31];

  return v32;
}

- (PTOutlet)resetHomeScreenLayoutOutlet
{
  return self->_resetHomeScreenLayoutOutlet;
}

- (void)setResetHomeScreenLayoutOutlet:(id)a3
{
}

- (void)setShowIndexLabels:(BOOL)a3
{
  self->_showIndexLabels = a3;
}

- (BOOL)showDragPlatterIconBorder
{
  return self->_showDragPlatterIconBorder;
}

- (void)setShowDragPlatterIconBorder:(BOOL)a3
{
  self->_showDragPlatterIconBorder = a3;
}

- (double)editingLiftDelay
{
  return self->_editingLiftDelay;
}

- (void)setEditingLiftDelay:(double)a3
{
  self->_editingLiftDelay = a3;
}

- (double)longPressToEditDuration
{
  return self->_longPressToEditDuration;
}

- (void)setLongPressToEditDuration:(double)a3
{
  self->_longPressToEditDuration = a3;
}

- (BOOL)waitForPause
{
  return self->_waitForPause;
}

- (void)setWaitForPause:(BOOL)a3
{
  self->_waitForPause = a3;
}

- (double)defaultPauseDuration
{
  return self->_defaultPauseDuration;
}

- (void)setDefaultPauseDuration:(double)a3
{
  self->_defaultPauseDuration = a3;
}

- (double)fastEditingPauseDuration
{
  return self->_fastEditingPauseDuration;
}

- (void)setFastEditingPauseDuration:(double)a3
{
  self->_fastEditingPauseDuration = a3;
}

- (double)defaultSpringDampingRatio
{
  return self->_defaultSpringDampingRatio;
}

- (void)setDefaultSpringDampingRatio:(double)a3
{
  self->_defaultSpringDampingRatio = a3;
}

- (double)defaultSpringDuration
{
  return self->_defaultSpringDuration;
}

- (void)setDefaultSpringDuration:(double)a3
{
  self->_defaultSpringDuration = a3;
}

- (double)clusterFastestDuration
{
  return self->_clusterFastestDuration;
}

- (void)setClusterFastestDuration:(double)a3
{
  self->_clusterFastestDuration = a3;
}

- (double)clusterSlowestDuration
{
  return self->_clusterSlowestDuration;
}

- (void)setClusterSlowestDuration:(double)a3
{
  self->_clusterSlowestDuration = a3;
}

- (double)clusterMiddleFastDuration
{
  return self->_clusterMiddleFastDuration;
}

- (void)setClusterMiddleFastDuration:(double)a3
{
  self->_clusterMiddleFastDuration = a3;
}

- (double)clusterMiddleSlowDuration
{
  return self->_clusterMiddleSlowDuration;
}

- (void)setClusterMiddleSlowDuration:(double)a3
{
  self->_clusterMiddleSlowDuration = a3;
}

- (void)setOverrideAnimationType:(int64_t)a3
{
  self->_overrideAnimationType = a3;
}

- (void).cxx_destruct
{
}

@end