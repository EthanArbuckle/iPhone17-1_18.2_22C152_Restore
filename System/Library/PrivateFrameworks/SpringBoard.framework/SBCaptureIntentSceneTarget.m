@interface SBCaptureIntentSceneTarget
- (FBScene)scene;
- (LCSCaptureApplicationDescribing)captureApplication;
- (NSString)description;
- (SBCaptureIntentSceneTarget)initWithScene:(id)a3 andCaptureApplication:(id)a4;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBCaptureIntentSceneTarget

- (SBCaptureIntentSceneTarget)initWithScene:(id)a3 andCaptureApplication:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCaptureIntentSceneTarget;
  v9 = [(SBCaptureIntentSceneTarget *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_captureApplication, a4);
  }

  return v10;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBCaptureIntentSceneTarget_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __56__SBCaptureIntentSceneTarget_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) identifier];
  id v2 = (id)[v1 appendObject:v3 withName:0];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (FBScene)scene
{
  return self->_scene;
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end