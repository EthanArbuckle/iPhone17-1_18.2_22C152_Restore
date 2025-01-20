@interface SBSystemActionPreviewSettings
+ (id)settingsControllerModule;
- (double)additionalUrgencyInterval;
- (double)minimumPreviewInterval;
- (void)setAdditionalUrgencyInterval:(double)a3;
- (void)setDefaultValues;
- (void)setMinimumPreviewInterval:(double)a3;
@end

@implementation SBSystemActionPreviewSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionPreviewSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemActionPreviewSettings *)self setMinimumPreviewInterval:1.5];
  [(SBSystemActionPreviewSettings *)self setAdditionalUrgencyInterval:0.5];
}

+ (id)settingsControllerModule
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  objc_super v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Minimum Preview Interval" valueKeyPath:@"minimumPreviewInterval"];
  v4 = [v3 between:0.0 and:10.0];
  v21[0] = v4;
  v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"Additional Urgency Interval" valueKeyPath:@"additionalUrgencyInterval"];
  v6 = [v5 between:0.0 and:10.0];
  v21[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v8 = [v2 sectionWithRows:v7 title:@"Timing"];

  v9 = (void *)MEMORY[0x1E4F94168];
  v10 = (void *)MEMORY[0x1E4F94100];
  v11 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];
  v20 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v14 = [v9 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94168];
  v19[0] = v14;
  v19[1] = v8;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17 = [v15 moduleWithTitle:@"Previews" contents:v16];

  return v17;
}

- (double)minimumPreviewInterval
{
  return self->_minimumPreviewInterval;
}

- (void)setMinimumPreviewInterval:(double)a3
{
  self->_minimumPreviewInterval = a3;
}

- (double)additionalUrgencyInterval
{
  return self->_additionalUrgencyInterval;
}

- (void)setAdditionalUrgencyInterval:(double)a3
{
  self->_additionalUrgencyInterval = a3;
}

@end