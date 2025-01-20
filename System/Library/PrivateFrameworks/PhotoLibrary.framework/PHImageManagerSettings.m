@interface PHImageManagerSettings
+ (id)settingsControllerModule;
+ (id)sharedSettings;
- (BOOL)allowCaching;
- (BOOL)allowImageRequests;
- (id)parentSettings;
- (void)setAllowCaching:(BOOL)a3;
- (void)setAllowImageRequests:(BOOL)a3;
- (void)setDefaultValues;
@end

@implementation PHImageManagerSettings

- (void)setAllowCaching:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 2) = a3;
}

- (BOOL)allowCaching
{
  return *(&self->super.super.super.__isObservingChildren + 2);
}

- (void)setAllowImageRequests:(BOOL)a3
{
  *(&self->super.super.super.__isObservingChildren + 1) = a3;
}

- (BOOL)allowImageRequests
{
  return *(&self->super.super.super.__isObservingChildren + 1);
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PHImageManagerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PHImageManagerSettings *)self setAllowImageRequests:1];
  [(PHImageManagerSettings *)self setAllowCaching:1];
}

- (id)parentSettings
{
  return +[PHRootSettings sharedSettings];
}

+ (id)settingsControllerModule
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Image Requests" valueKeyPath:@"allowImageRequests"];
  v19[0] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Caching" valueKeyPath:@"allowCaching"];
  v19[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v6 = [v2 sectionWithRows:v5];

  v7 = (void *)MEMORY[0x1E4F94160];
  v8 = (void *)MEMORY[0x1E4F940F8];
  v9 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v18 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v12 = [v7 sectionWithRows:v11];

  v13 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v6;
  v17[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v13 moduleWithTitle:@"Image Manager" contents:v14];

  return v15;
}

+ (id)sharedSettings
{
  v2 = +[PHRootSettings sharedSettings];
  objc_super v3 = [v2 imageManagerSettings];

  return v3;
}

@end