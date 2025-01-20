@interface PHResourceDownloadSettings
+ (id)settingsControllerModule;
+ (id)sharedSettings;
- (BOOL)simulateDownload;
- (BOOL)simulateDownloadFailure;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setSimulateDownload:(BOOL)a3;
- (void)setSimulateDownloadFailure:(BOOL)a3;
@end

@implementation PHResourceDownloadSettings

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 2) = a3;
}

- (BOOL)simulateDownloadFailure
{
  return *(&self->super.super.super.__isObservingChildren + 2);
}

- (void)setSimulateDownload:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 1) = a3;
}

- (BOOL)simulateDownload
{
  return *(&self->super.super.super.__isObservingChildren + 1);
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PHResourceDownloadSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PHResourceDownloadSettings *)self setSimulateDownload:0];
  [(PHResourceDownloadSettings *)self setSimulateDownloadFailure:0];
}

- (id)parentSettings
{
  return +[PHRootSettings sharedSettings];
}

+ (id)settingsControllerModule
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Download" valueKeyPath:@"simulateDownload"];
  v20[0] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Download Failure" valueKeyPath:@"simulateDownloadFailure"];
  v5 = [v4 conditionFormat:@"simulateDownload == YES"];
  v20[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v7 = [v2 sectionWithRows:v6];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];
  v19 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v13 = [v8 sectionWithRows:v12];

  v14 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v7;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"Resource Download Request" contents:v15];

  return v16;
}

+ (id)sharedSettings
{
  v2 = +[PHRootSettings sharedSettings];
  objc_super v3 = [v2 resourceDownloadSettings];

  return v3;
}

@end