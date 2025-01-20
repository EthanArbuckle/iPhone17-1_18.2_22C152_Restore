@interface SBExtendedDisplayProfileFactory
- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4;
- (id)createProfile;
- (id)displayProfile:(id)a3 initialDisplayConfigurationRequestForDisplay:(id)a4;
- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4;
- (id)initWithDefaults:(void *)a3 delegate:;
- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4;
@end

@implementation SBExtendedDisplayProfileFactory

- (id)initWithDefaults:(void *)a3 delegate:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SBExtendedDisplayProfileFactory;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeWeak(a1 + 2, v7);
    }
  }

  return a1;
}

- (id)createProfile
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F9F778] sceneHostingProfileWithDelegate:a1 builder:&__block_literal_global_343];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __48__SBExtendedDisplayProfileFactory_createProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F9F790];
  id v4 = a2;
  v3 = +[FBSSceneSpecification specification];
  [v4 setPriorityLevel:v2 sceneSpecification:v3];

  [v4 setMainLike:1];
  [v4 setCloningSupported:0];
  [v4 deriveWithIdentifier:@"com.apple.springboard.shellui"];
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  return [(SBExternalDisplayDefaults *)self->_defaults displaySupportsExtendedDisplayMode:a4];
}

- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  id v4 = a4;
  v5 = [(UIRootSceneWindow *)[SBExtendedDisplayProfileFactoryRootSceneWindow alloc] initWithDisplayConfiguration:v4];

  return v5;
}

- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained extendedFactory:self modifyInitialSceneParameters:v6];
}

- (id)displayProfile:(id)a3 initialDisplayConfigurationRequestForDisplay:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F629A0];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  v8 = [(SBExternalDisplayDefaults *)self->_defaults displayModeSettingsForDisplay:v6];
  v9 = objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v6, -[SBExternalDisplayDefaults chamois](self->_defaults, "chamois"));

  [v8 overscanCompensation];
  [v7 setOverscanCompensation:FBSDisplayOverscanCompensationForDisplayValue()];
  objc_msgSend(v9, "logicalScaleForDisplayScale:", objc_msgSend(v8, "scale"));
  objc_msgSend(v7, "setLogicalScale:", v10, v10);
  [(SBExternalDisplayDefaults *)self->_defaults contentsScale];
  objc_msgSend(v7, "setPointScale:");

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end