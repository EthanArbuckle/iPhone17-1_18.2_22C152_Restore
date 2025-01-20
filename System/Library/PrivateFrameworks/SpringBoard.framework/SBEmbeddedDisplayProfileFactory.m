@interface SBEmbeddedDisplayProfileFactory
- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4;
- (id)createProfile;
- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4;
- (id)initWithDelegate:(id *)a1;
- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4;
@end

@implementation SBEmbeddedDisplayProfileFactory

- (id)initWithDelegate:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SBEmbeddedDisplayProfileFactory;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (id)createProfile
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F9F778] sceneHostingProfileWithDelegate:a1 builder:&__block_literal_global_363];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __48__SBEmbeddedDisplayProfileFactory_createProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F9F788];
  id v3 = a2;
  id v4 = +[FBSSceneSpecification specification];
  [v3 setPriorityLevel:v2 sceneSpecification:v4];
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  id v4 = objc_msgSend(a4, "identity", a3);
  char v5 = [v4 isMainRootDisplay];

  return v5;
}

- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  id v4 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  char v5 = [v4 rootWindow];

  return v5;
}

- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained embeddedFactory:self modifyInitialSceneParameters:v6];
}

- (void).cxx_destruct
{
}

@end