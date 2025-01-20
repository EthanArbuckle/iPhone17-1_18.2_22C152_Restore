@interface PREditorLookSwitchingComplicationTransition
- (BSUIVibrancyConfiguration)fromVibrancyConfiguration;
- (BSUIVibrancyConfiguration)toVibrancyConfiguration;
- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider;
- (PREditorLookSwitchingComplicationTransition)initWithFromVibrancyConfiguration:(id)a3 toVibrancyConfiguration:(id)a4 viewController:(id)a5 cachingVibrancyTransitionProvider:(id)a6;
- (PREditorRootViewController)viewController;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)setCachingVibrancyTransitionProvider:(id)a3;
- (void)setFromVibrancyConfiguration:(id)a3;
- (void)setToVibrancyConfiguration:(id)a3;
- (void)setViewController:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation PREditorLookSwitchingComplicationTransition

- (PREditorLookSwitchingComplicationTransition)initWithFromVibrancyConfiguration:(id)a3 toVibrancyConfiguration:(id)a4 viewController:(id)a5 cachingVibrancyTransitionProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PREditorLookSwitchingComplicationTransition;
  v15 = [(PREditorLookSwitchingComplicationTransition *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromVibrancyConfiguration, a3);
    objc_storeStrong((id *)&v16->_toVibrancyConfiguration, a4);
    objc_storeWeak((id *)&v16->_viewController, v13);
    objc_storeStrong((id *)&v16->_cachingVibrancyTransitionProvider, a6);
  }

  return v16;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v14 = [(BSUIVibrancyConfiguration *)self->_fromVibrancyConfiguration color];
  v5 = [(BSUIVibrancyConfiguration *)self->_toVibrancyConfiguration color];
  if (v14) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 || [(BSUIVibrancyConfiguration *)self->_fromVibrancyConfiguration effectType] == 3)
  {
    cachingVibrancyTransitionProvider = self->_cachingVibrancyTransitionProvider;
    v8 = [(BSUIVibrancyConfiguration *)self->_fromVibrancyConfiguration alternativeVibrancyEffectLUT];
    v9 = [(BSUIVibrancyConfiguration *)self->_toVibrancyConfiguration alternativeVibrancyEffectLUT];
    v10 = [v9 lutIdentifier];
    id v11 = [(CSCachingVibrancyTransitionProvider *)cachingVibrancyTransitionProvider vibrancyLUTWithStartingLUT:v8 transitionProgress:v10 toIdentifier:a3];

    id v12 = (void *)[(BSUIVibrancyConfiguration *)self->_fromVibrancyConfiguration copyWithBlendAmount:self->_toVibrancyConfiguration blendConfiguration:v11 alternativeVibrancyEffectLUT:a3];
    id v13 = [(PREditorLookSwitchingComplicationTransition *)self viewController];
    [v13 _setVibrancyConfiguration:v12];
  }
}

- (void)finishInteractiveTransition
{
  id v3 = [(PREditorLookSwitchingComplicationTransition *)self viewController];
  [v3 _setVibrancyConfiguration:self->_toVibrancyConfiguration];
}

- (void)cancelInteractiveTransition
{
  id v3 = [(PREditorLookSwitchingComplicationTransition *)self viewController];
  [v3 _setVibrancyConfiguration:self->_fromVibrancyConfiguration];
}

- (BSUIVibrancyConfiguration)fromVibrancyConfiguration
{
  return self->_fromVibrancyConfiguration;
}

- (void)setFromVibrancyConfiguration:(id)a3
{
}

- (BSUIVibrancyConfiguration)toVibrancyConfiguration
{
  return self->_toVibrancyConfiguration;
}

- (void)setToVibrancyConfiguration:(id)a3
{
}

- (PREditorRootViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (PREditorRootViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider
{
  return self->_cachingVibrancyTransitionProvider;
}

- (void)setCachingVibrancyTransitionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_toVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_fromVibrancyConfiguration, 0);
}

@end