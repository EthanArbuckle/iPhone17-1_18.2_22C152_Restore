@interface SBFAlwaysOnLiveRenderingBLSAttributesProvider
- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithFBSScene:(id)a3;
- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithProvider:(id)a3;
- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithUIScene:(id)a3;
- (id)assertionAttributes;
- (void)assertionAttributes;
@end

@implementation SBFAlwaysOnLiveRenderingBLSAttributesProvider

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFAlwaysOnLiveRenderingBLSAttributesProvider;
  v6 = [(SBFAlwaysOnLiveRenderingBLSAttributesProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v7;
}

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithUIScene:(id)a3
{
  id v4 = a3;
  id v5 = [[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider alloc] initWithUIScene:v4];

  v6 = [(SBFAlwaysOnLiveRenderingBLSAttributesProvider *)self initWithProvider:v5];
  return v6;
}

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithFBSScene:(id)a3
{
  id v4 = a3;
  id v5 = [[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider alloc] initWithFBSScene:v4];

  v6 = [(SBFAlwaysOnLiveRenderingBLSAttributesProvider *)self initWithProvider:v5];
  return v6;
}

- (id)assertionAttributes
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(SBFAlwaysOnLiveRenderingBLSAttributesProvider *)self->_provider assertionAttributes];
  id v5 = (void *)[v3 initWithArray:v4];

  if ([v5 count])
  {
    v6 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
    v12[0] = v6;
    v7 = [MEMORY[0x1E4F4F538] timeoutAfterInterval:10.0];
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v5 addObjectsFromArray:v8];

    objc_super v9 = [v5 allObjects];
  }
  else
  {
    v10 = SBLogLiveRendering();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBFAlwaysOnLiveRenderingBLSAttributesProvider assertionAttributes](v10);
    }

    objc_super v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)assertionAttributes
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "Invalid attributes.", v1, 2u);
}

@end