@interface SBFSAlwaysOnLiveRenderingAssertionUIScene
- (SBFSAlwaysOnLiveRenderingAssertionUIScene)initWithScene:(id)a3;
- (id)assertionAttributes;
@end

@implementation SBFSAlwaysOnLiveRenderingAssertionUIScene

- (SBFSAlwaysOnLiveRenderingAssertionUIScene)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFSAlwaysOnLiveRenderingAssertionUIScene;
  v5 = [(SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider *)&v8 _init];
  v6 = (SBFSAlwaysOnLiveRenderingAssertionUIScene *)v5;
  if (v5) {
    objc_storeWeak(v5 + 1, v4);
  }

  return v6;
}

- (id)assertionAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (WeakRetained)
  {
    v3 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:WeakRetained];
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerateForScene:WeakRetained];
    v7[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end