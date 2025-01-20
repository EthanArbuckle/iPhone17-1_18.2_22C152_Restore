@interface PSSceneSettings
- (PSSceneSettings)initWithSettings:(id)a3;
- (UVPreviewSceneSettings)settings;
@end

@implementation PSSceneSettings

- (PSSceneSettings)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSSceneSettings;
  v6 = [(PSSceneSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (UVPreviewSceneSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end