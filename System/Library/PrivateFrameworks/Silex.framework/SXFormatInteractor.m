@interface SXFormatInteractor
- (BOOL)requestedContentHiding;
- (SXDebugLayoutOptionsProviding)debugLayoutOptionsProvider;
- (SXFormatInteractor)initWithLayoutCoordinator:(id)a3 layoutOptionsFactory:(id)a4 presentationAttributesProvider:(id)a5 subscriptionStatusProvider:(id)a6 debugLayoutOptionsProvider:(id)a7 newsletterSubscriptionStatusProvider:(id)a8 offerUpsellScenarioProvider:(id)a9 subscriptionActivationEligibilityProvider:(id)a10 renderingConfigurationProvider:(id)a11;
- (SXFormatInteractorDelegate)delegate;
- (SXLayoutCoordinator)layoutCoordinator;
- (SXLayoutOptionsFactory)layoutOptionsFactory;
- (SXNewsletterSubscriptionStatusProviding)newsletterSubscriptionStatusProvider;
- (SXOfferUpsellScenarioProviding)offerUpsellScenarioProvider;
- (SXPresentationAttributesProvider)presentationAttributesProvider;
- (SXPresentationEnvironment)presentationEnvironment;
- (SXRenderingConfigurationProvider)renderingConfigurationProvider;
- (SXSubscriptionActivationEligibilityProviding)subscriptionActivationEligibilityProvider;
- (SXSubscriptionStatusProviding)subscriptionStatusProvider;
- (void)bundleSubscriptionStatusDidChangeFromStatus:(int64_t)a3;
- (void)channelSubscriptionStatusDidChangeFromStatus:(int64_t)a3;
- (void)debugLayoutOptionsDidChange:(id)a3;
- (void)layoutCoordinator:(id)a3 cancelledLayoutWithOptions:(id)a4;
- (void)layoutCoordinator:(id)a3 didIntegrateBlueprint:(id)a4;
- (void)layoutCoordinator:(id)a3 willIntegrateBlueprint:(id)a4;
- (void)layoutCoordinator:(id)a3 willLayoutWithParameters:(id)a4;
- (void)newsletterSubscriptionStatusDidChangeFromStatus:(unint64_t)a3;
- (void)offerUpsellScenarioDidChangeFromScenario:(int64_t)a3;
- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentationEnvironment:(id)a3;
- (void)setRequestedContentHiding:(BOOL)a3;
- (void)subscriptionActivationEligibilityDidChangeFromEligibility:(int64_t)a3 to:(int64_t)a4;
- (void)updateWithPresentationEnvironment:(id)a3;
@end

@implementation SXFormatInteractor

- (SXFormatInteractor)initWithLayoutCoordinator:(id)a3 layoutOptionsFactory:(id)a4 presentationAttributesProvider:(id)a5 subscriptionStatusProvider:(id)a6 debugLayoutOptionsProvider:(id)a7 newsletterSubscriptionStatusProvider:(id)a8 offerUpsellScenarioProvider:(id)a9 subscriptionActivationEligibilityProvider:(id)a10 renderingConfigurationProvider:(id)a11
{
  id v31 = a3;
  id v29 = a4;
  id v28 = a5;
  id v30 = a6;
  id obj = a7;
  id v18 = a7;
  id v27 = a8;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)SXFormatInteractor;
  v23 = [(SXFormatInteractor *)&v32 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_layoutCoordinator, a3);
    objc_storeStrong((id *)&v24->_layoutOptionsFactory, a4);
    objc_storeStrong((id *)&v24->_presentationAttributesProvider, a5);
    [(SXPresentationAttributesProvider *)v24->_presentationAttributesProvider addObserver:v24];
    objc_storeStrong((id *)&v24->_subscriptionStatusProvider, a6);
    [v30 addObserver:v24];
    objc_storeStrong((id *)&v24->_debugLayoutOptionsProvider, obj);
    [v18 addObserver:v24];
    objc_storeStrong((id *)&v24->_newsletterSubscriptionStatusProvider, v27);
    [v19 addObserver:v24];
    objc_storeStrong((id *)&v24->_offerUpsellScenarioProvider, a9);
    [v20 addObserver:v24];
    objc_storeStrong((id *)&v24->_subscriptionActivationEligibilityProvider, a10);
    [v21 addObserver:v24];
    objc_storeStrong((id *)&v24->_renderingConfigurationProvider, a11);
    [v31 setDelegate:v24];
  }

  return v24;
}

- (void)updateWithPresentationEnvironment:(id)a3
{
  p_presentationEnvironment = &self->_presentationEnvironment;
  id v5 = a3;
  objc_storeWeak((id *)p_presentationEnvironment, v5);
  v6 = [(SXFormatInteractor *)self presentationAttributesProvider];
  v7 = [v6 presentationAttributes];

  v8 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  [v5 viewportSize];
  objc_msgSend(v8, "overrideViewportSize:");
  double v10 = v9;
  double v12 = v11;

  v13 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  v14 = [v7 contentSizeCategory];
  v55 = [v13 overrideContentSizeCategory:v14];

  v15 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  [v7 contentScaleFactor];
  objc_msgSend(v15, "overrideContentScaleFactor:");
  double v17 = v16;

  id v18 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  uint64_t v54 = objc_msgSend(v18, "overrideViewingLocation:", objc_msgSend(v5, "viewingLocation"));

  id v19 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  id v20 = [(SXFormatInteractor *)self subscriptionStatusProvider];
  uint64_t v53 = objc_msgSend(v19, "overrideBundleSubscriptionStatus:", objc_msgSend(v20, "bundleSubscriptionStatus"));

  id v21 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  id v22 = [(SXFormatInteractor *)self subscriptionStatusProvider];
  uint64_t v52 = objc_msgSend(v21, "overrideChannelSubscriptionStatus:", objc_msgSend(v22, "channelSubscriptionStatus"));

  v23 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  v24 = [(SXFormatInteractor *)self newsletterSubscriptionStatusProvider];
  uint64_t v51 = objc_msgSend(v23, "overrideNewsletterSubscriptionStatus:", objc_msgSend(v24, "newsletterSubscriptionStatus"));

  v25 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  v26 = [(SXFormatInteractor *)self offerUpsellScenarioProvider];
  uint64_t v50 = objc_msgSend(v25, "overrideOfferUpsellScenario:", objc_msgSend(v26, "offerUpsellScenario"));

  id v27 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  id v28 = [(SXFormatInteractor *)self subscriptionActivationEligibilityProvider];
  uint64_t v29 = objc_msgSend(v27, "overrideSubscriptionActivationEligibility:", objc_msgSend(v28, "eligibility"));

  id v30 = [(SXFormatInteractor *)self debugLayoutOptionsProvider];
  id v31 = [(SXFormatInteractor *)self renderingConfigurationProvider];
  objc_super v32 = [v31 configuration];
  v33 = [v32 conditionKeys];
  v34 = [v30 overrideConditionKeys:v33];

  v35 = [(SXFormatInteractor *)self layoutOptionsFactory];
  [v5 safeAreaInsets];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  v44 = [v5 presentationTraitCollection];
  uint64_t v45 = [v7 testingConditionEnabled];
  LOBYTE(v32) = [v5 smartInvertColorsEnabled];

  LOBYTE(v49) = (_BYTE)v32;
  objc_msgSend(v35, "createLayoutOptionsWithViewportSize:safeAreaInsets:traitCollection:bundleSubscriptionStatus:channelSubscriptionStatus:contentSizeCategory:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:", v44, v53, v52, v55, v45, v54, v10, v12, v37, v39, v41, v43, v17, v51, v50,
    v29,
    v49,
  v46 = v34);

  if (v46)
  {
    v47 = [(SXFormatInteractor *)self layoutCoordinator];
    [v47 layoutWithOptions:v46];
  }
  else
  {
    v48 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222AC5000, v48, OS_LOG_TYPE_DEFAULT, "Unable to start layout, no layout valid layout options", buf, 2u);
    }
  }
}

- (void)layoutCoordinator:(id)a3 willLayoutWithParameters:(id)a4
{
  id v16 = a4;
  id v5 = [(SXFormatInteractor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SXFormatInteractor *)self delegate];
    v8 = [v16 layoutOptions];
    [v7 interactor:self willLayoutWithOptions:v8];
  }
  uint64_t v9 = [(SXFormatInteractor *)self requestedContentHiding];
  id v10 = v16;
  if ((v9 & 1) == 0)
  {
    uint64_t v9 = [v16 layoutType];
    id v10 = v16;
    if (v9 == 1)
    {
      uint64_t v9 = [v16 expectedDuration];
      id v10 = v16;
      if (v11 != -1.0)
      {
        uint64_t v9 = [v16 expectedDuration];
        id v10 = v16;
        if (v12 > 0.175)
        {
          v13 = [(SXFormatInteractor *)self delegate];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            v15 = [(SXFormatInteractor *)self delegate];
            [v15 hideContentsForLayoutWithInteractor:self];
          }
          uint64_t v9 = [(SXFormatInteractor *)self setRequestedContentHiding:1];
          id v10 = v16;
        }
      }
    }
  }
  MEMORY[0x270F9A758](v9, v10);
}

- (void)layoutCoordinator:(id)a3 cancelledLayoutWithOptions:(id)a4
{
  id v11 = a4;
  id v5 = [(SXFormatInteractor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SXFormatInteractor *)self delegate];
    [v7 interactor:self cancelledLayoutWithOptions:v11];
  }
  if ([(SXFormatInteractor *)self requestedContentHiding])
  {
    v8 = [(SXFormatInteractor *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(SXFormatInteractor *)self delegate];
      [v10 displayContentsAfterLayoutWithInteractor:self];
    }
    [(SXFormatInteractor *)self setRequestedContentHiding:0];
  }
}

- (void)layoutCoordinator:(id)a3 willIntegrateBlueprint:(id)a4
{
  id v8 = a4;
  id v5 = [(SXFormatInteractor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SXFormatInteractor *)self delegate];
    [v7 interactor:self willIntegrateBlueprint:v8];
  }
}

- (void)layoutCoordinator:(id)a3 didIntegrateBlueprint:(id)a4
{
  id v11 = a4;
  id v5 = [(SXFormatInteractor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SXFormatInteractor *)self delegate];
    [v7 interactor:self didIntegrateBlueprint:v11];
  }
  if ([(SXFormatInteractor *)self requestedContentHiding])
  {
    id v8 = [(SXFormatInteractor *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(SXFormatInteractor *)self delegate];
      [v10 displayContentsAfterLayoutWithInteractor:self];
    }
    [(SXFormatInteractor *)self setRequestedContentHiding:0];
  }
}

- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4
{
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)bundleSubscriptionStatusDidChangeFromStatus:(int64_t)a3
{
  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in bundle subscription status", v6, 2u);
  }
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)channelSubscriptionStatusDidChangeFromStatus:(int64_t)a3
{
  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in channel subscription status", v6, 2u);
  }
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)debugLayoutOptionsDidChange:(id)a3
{
  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in debug layout options", v6, 2u);
  }
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)newsletterSubscriptionStatusDidChangeFromStatus:(unint64_t)a3
{
  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in newsletter subscription status", v6, 2u);
  }
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)offerUpsellScenarioDidChangeFromScenario:(int64_t)a3
{
  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in offer upsell scenario", v6, 2u);
  }
  id v5 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v5];
}

- (void)subscriptionActivationEligibilityDidChangeFromEligibility:(int64_t)a3 to:(int64_t)a4
{
  id v5 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_222AC5000, v5, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in subscription activation eligibility", v7, 2u);
  }
  char v6 = [(SXFormatInteractor *)self presentationEnvironment];
  [(SXFormatInteractor *)self updateWithPresentationEnvironment:v6];
}

- (SXFormatInteractorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXFormatInteractorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXLayoutCoordinator)layoutCoordinator
{
  return self->_layoutCoordinator;
}

- (SXLayoutOptionsFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (SXSubscriptionStatusProviding)subscriptionStatusProvider
{
  return self->_subscriptionStatusProvider;
}

- (SXPresentationEnvironment)presentationEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationEnvironment);
  return (SXPresentationEnvironment *)WeakRetained;
}

- (void)setPresentationEnvironment:(id)a3
{
}

- (SXDebugLayoutOptionsProviding)debugLayoutOptionsProvider
{
  return self->_debugLayoutOptionsProvider;
}

- (SXNewsletterSubscriptionStatusProviding)newsletterSubscriptionStatusProvider
{
  return self->_newsletterSubscriptionStatusProvider;
}

- (SXOfferUpsellScenarioProviding)offerUpsellScenarioProvider
{
  return self->_offerUpsellScenarioProvider;
}

- (SXSubscriptionActivationEligibilityProviding)subscriptionActivationEligibilityProvider
{
  return self->_subscriptionActivationEligibilityProvider;
}

- (SXRenderingConfigurationProvider)renderingConfigurationProvider
{
  return self->_renderingConfigurationProvider;
}

- (BOOL)requestedContentHiding
{
  return self->_requestedContentHiding;
}

- (void)setRequestedContentHiding:(BOOL)a3
{
  self->_requestedContentHiding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_subscriptionActivationEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_offerUpsellScenarioProvider, 0);
  objc_storeStrong((id *)&self->_newsletterSubscriptionStatusProvider, 0);
  objc_storeStrong((id *)&self->_debugLayoutOptionsProvider, 0);
  objc_destroyWeak((id *)&self->_presentationEnvironment);
  objc_storeStrong((id *)&self->_subscriptionStatusProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
  objc_storeStrong((id *)&self->_layoutOptionsFactory, 0);
  objc_storeStrong((id *)&self->_layoutCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end