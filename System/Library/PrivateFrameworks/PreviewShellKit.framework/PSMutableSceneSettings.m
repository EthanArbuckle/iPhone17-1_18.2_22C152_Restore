@interface PSMutableSceneSettings
- (PSMutableSceneSettings)initWithSettings:(id)a3;
- (UVMutablePreviewSceneSettings)settings;
@end

@implementation PSMutableSceneSettings

- (PSMutableSceneSettings)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSMutableSceneSettings;
  v6 = [(PSMutableSceneSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (UVMutablePreviewSceneSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end