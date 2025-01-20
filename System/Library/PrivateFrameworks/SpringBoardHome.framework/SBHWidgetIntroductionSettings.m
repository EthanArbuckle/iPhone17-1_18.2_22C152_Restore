@interface SBHWidgetIntroductionSettings
+ (id)settingsControllerModule;
- (BOOL)bumpLeastUsedApps;
- (BOOL)editButtonAsUndo;
- (BOOL)showWidgetIntroConvenienceControl;
- (BOOL)showXLTVWidget;
- (BOOL)simpleBottomSnaking;
- (void)setBumpLeastUsedApps:(BOOL)a3;
- (void)setDefaultValues;
- (void)setEditButtonAsUndo:(BOOL)a3;
- (void)setShowWidgetIntroConvenienceControl:(BOOL)a3;
- (void)setShowXLTVWidget:(BOOL)a3;
- (void)setSimpleBottomSnaking:(BOOL)a3;
@end

@implementation SBHWidgetIntroductionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHWidgetIntroductionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHWidgetIntroductionSettings *)self setShowWidgetIntroConvenienceControl:1];
  [(SBHWidgetIntroductionSettings *)self setEditButtonAsUndo:0];
  [(SBHWidgetIntroductionSettings *)self setSimpleBottomSnaking:1];
  [(SBHWidgetIntroductionSettings *)self setBumpLeastUsedApps:1];
  [(SBHWidgetIntroductionSettings *)self setShowXLTVWidget:0];
}

+ (id)settingsControllerModule
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Widget Introduction" valueKeyPath:@"showWidgetIntroConvenienceControl"];
  v23[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Edit Button As Undo" valueKeyPath:@"editButtonAsUndo"];
  v23[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  v5 = [MEMORY[0x1E4F94160] sectionWithRows:v4 title:@"Widget Introduction"];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simple Bottom Snaking" valueKeyPath:@"simpleBottomSnaking"];
  v22[0] = v6;
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Bump Least Used Apps" valueKeyPath:@"bumpLeastUsedApps"];
  v22[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  v9 = [MEMORY[0x1E4F94160] sectionWithRows:v8 title:@"Icon Overflow"];
  v10 = (void *)MEMORY[0x1E4F1CA48];
  v21[0] = v5;
  v21[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v12 = [v10 arrayWithArray:v11];

  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Extra Large TV Widget" valueKeyPath:@"showXLTVWidget"];
  v20 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

  v15 = [MEMORY[0x1E4F94160] sectionWithRows:v14 title:@"TV Widget"];
  v16 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v12 addObject:v15];
  }
  v18 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Widget Introduction" contents:v12];

  return v18;
}

- (BOOL)showWidgetIntroConvenienceControl
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setShowWidgetIntroConvenienceControl:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)editButtonAsUndo
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setEditButtonAsUndo:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)simpleBottomSnaking
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setSimpleBottomSnaking:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)bumpLeastUsedApps
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setBumpLeastUsedApps:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (BOOL)showXLTVWidget
{
  return *(&self->super.__isObservingChildren + 5);
}

- (void)setShowXLTVWidget:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

@end