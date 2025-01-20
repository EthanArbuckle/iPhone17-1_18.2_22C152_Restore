@interface SBSceneRelevancySettings
+ (id)settingsControllerModule;
- (BOOL)prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded;
- (int64_t)topMostUnconstrainedScenesMax;
- (void)setDefaultValues;
- (void)setPrefersProcessTaskSuspensionWhileSceneForegroundAndOccluded:(BOOL)a3;
- (void)setTopMostUnconstrainedScenesMax:(int64_t)a3;
@end

@implementation SBSceneRelevancySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSceneRelevancySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSceneRelevancySettings *)self setTopMostUnconstrainedScenesMax:4];
  [(SBSceneRelevancySettings *)self setPrefersProcessTaskSuspensionWhileSceneForegroundAndOccluded:1];
}

+ (id)settingsControllerModule
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94140];
  objc_super v3 = NSStringFromSelector(sel_topMostUnconstrainedScenesMax);
  v4 = [v2 rowWithTitle:@"Top-most Unconstrained Scenes Max" valueKeyPath:v3];
  v5 = [v4 between:0.0 and:80.0];
  v6 = [v5 precision:0];

  v7 = (void *)MEMORY[0x1E4F941E8];
  v8 = NSStringFromSelector(sel_prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded);
  v9 = [v7 rowWithTitle:@"Prefers task suspension for occluded foreground scenes" valueKeyPath:v8];

  v10 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v6;
  v18[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v12 = [v10 sectionWithRows:v11];

  v13 = (void *)MEMORY[0x1E4F94168];
  v17 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15 = [v13 moduleWithTitle:@"Scene Relevancy" contents:v14];

  return v15;
}

- (int64_t)topMostUnconstrainedScenesMax
{
  return self->_topMostUnconstrainedScenesMax;
}

- (void)setTopMostUnconstrainedScenesMax:(int64_t)a3
{
  self->_topMostUnconstrainedScenesMax = a3;
}

- (BOOL)prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded
{
  return self->_prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded;
}

- (void)setPrefersProcessTaskSuspensionWhileSceneForegroundAndOccluded:(BOOL)a3
{
  self->_prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded = a3;
}

@end