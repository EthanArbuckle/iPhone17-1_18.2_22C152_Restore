@interface SXWebContentComponentView
- (NFPendingPromise)invalidationPromise;
- (NFStateMachine)stateMachine;
- (SWContainerViewController)containerViewController;
- (SWLoadingPolicyProvider)loadingPolicyProvider;
- (SWNavigationManager)navigationManager;
- (SWReachabilityProvider)reachabilityProvider;
- (SXAnalyticsReporting)analyticsReporting;
- (SXComponentExposureMonitor)componentExposureMonitor;
- (SXLayoutInvalidator)layoutInvalidator;
- (SXResourceDataSource)resourceDataSource;
- (SXWebContentComponentExposureEvent)componentExposureEvent;
- (SXWebContentComponentInteractionManager)interactionManager;
- (SXWebContentComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 containerViewController:(id)a7 configurationProvider:(id)a8 navigationManager:(id)a9 analyticsReporting:(id)a10 componentExposureMonitor:(id)a11 interactionManagerFactory:(id)a12 reachabilityProvider:(id)a13 resourceDataSource:(id)a14 loadingPolicyProvider:(id)a15 dataSourceProvider:(id)a16 layoutInvalidator:(id)a17;
- (SXWebContentConfigurationProvider)configurationProvider;
- (SXWebContentDataSourceProviding)dataSourceProvider;
- (UIActivityIndicatorView)loadingIndicator;
- (UILabel)errorLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)createDisabledState;
- (id)createErrorState;
- (id)createLoadingState;
- (id)createPresentationState;
- (id)createStateMachine;
- (id)foregroundColor:(int64_t)a3;
- (void)configure;
- (void)configureComponentExposureMonitor;
- (void)configureConfigurationProvider;
- (void)configureErrorProvider;
- (void)configurePresentationManager;
- (void)configureViewController;
- (void)layout;
- (void)layoutErrorView;
- (void)layoutLoadingIndicator;
- (void)layoutSubviews;
- (void)layoutWebView;
- (void)loadComponent:(id)a3;
- (void)loadWebContent;
- (void)presentComponentWithChanges:(id)a3;
- (void)presentWithHeight:(double)a3;
- (void)reachabilityChanged:(BOOL)a3;
- (void)reloadWebContent;
- (void)setComponentExposureEvent:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setInvalidationPromise:(id)a3;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
@end

@implementation SXWebContentComponentView

- (SXWebContentComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 containerViewController:(id)a7 configurationProvider:(id)a8 navigationManager:(id)a9 analyticsReporting:(id)a10 componentExposureMonitor:(id)a11 interactionManagerFactory:(id)a12 reachabilityProvider:(id)a13 resourceDataSource:(id)a14 loadingPolicyProvider:(id)a15 dataSourceProvider:(id)a16 layoutInvalidator:(id)a17
{
  id v48 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id obj = a7;
  id v45 = a7;
  id v44 = a8;
  id v43 = a9;
  id v42 = a10;
  id v41 = a11;
  id v25 = a12;
  id v46 = a13;
  id v40 = a14;
  id v39 = a15;
  id v38 = a16;
  id v37 = a17;
  v52.receiver = self;
  v52.super_class = (Class)SXWebContentComponentView;
  v26 = [(SXComponentView *)&v52 initWithDOMObjectProvider:v48 viewport:v22 presentationDelegate:v23 componentStyleRendererFactory:v24];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_containerViewController, obj);
    objc_storeStrong((id *)&v27->_configurationProvider, a8);
    objc_storeStrong((id *)&v27->_componentExposureMonitor, a11);
    objc_storeStrong((id *)&v27->_navigationManager, a9);
    objc_storeStrong((id *)&v27->_analyticsReporting, a10);
    uint64_t v28 = [v25 interactionManagerForComponentView:v27];
    interactionManager = v27->_interactionManager;
    v27->_interactionManager = (SXWebContentComponentInteractionManager *)v28;

    objc_storeStrong((id *)&v27->_reachabilityProvider, a13);
    objc_storeStrong((id *)&v27->_resourceDataSource, a14);
    objc_storeStrong((id *)&v27->_loadingPolicyProvider, a15);
    objc_storeStrong((id *)&v27->_dataSourceProvider, a16);
    objc_storeStrong((id *)&v27->_layoutInvalidator, a17);
    uint64_t v30 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v27 action:sel_handleTap_];
    tapGestureRecognizer = v27->_tapGestureRecognizer;
    v27->_tapGestureRecognizer = (UITapGestureRecognizer *)v30;

    objc_initWeak(&location, v27);
    navigationManager = v27->_navigationManager;
    id v33 = objc_alloc(MEMORY[0x263F6C6F0]);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __348__SXWebContentComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_containerViewController_configurationProvider_navigationManager_analyticsReporting_componentExposureMonitor_interactionManagerFactory_reachabilityProvider_resourceDataSource_loadingPolicyProvider_dataSourceProvider_layoutInvalidator___block_invoke;
    v49[3] = &unk_264652A00;
    objc_copyWeak(&v50, &location);
    v34 = (void *)[v33 initWithBlock:v49];
    [(SWNavigationManager *)navigationManager addObserver:v34];

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return v27;
}

void __348__SXWebContentComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_containerViewController_configurationProvider_navigationManager_analyticsReporting_componentExposureMonitor_interactionManagerFactory_reachabilityProvider_resourceDataSource_loadingPolicyProvider_dataSourceProvider_layoutInvalidator___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [SXWebContentLinkTapEvent alloc];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v6 = [WeakRetained component];
  v7 = [v6 URL];
  v8 = [v7 absoluteString];
  v11 = [(SXWebContentLinkTapEvent *)v4 initWithIdentifier:v8 destinationURL:v3];

  id v9 = objc_loadWeakRetained(a1);
  v10 = [v9 analyticsReporting];
  [v10 reportEvent:v11];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SXWebContentComponentView;
  [(SXWebContentComponentView *)&v3 layoutSubviews];
  [(SXWebContentComponentView *)self layout];
}

- (void)configure
{
  v10.receiver = self;
  v10.super_class = (Class)SXWebContentComponentView;
  [(SXComponentView *)&v10 configure];
  objc_super v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v3;

  [(UIActivityIndicatorView *)self->_loadingIndicator startAnimating];
  v5 = [(SXComponentView *)self contentView];
  v6 = [(SXWebContentComponentView *)self loadingIndicator];
  [v5 addSubview:v6];

  [(SXWebContentComponentView *)self configureViewController];
  v7 = [(SXWebContentComponentView *)self createStateMachine];
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  [(SXWebContentComponentView *)self configurePresentationManager];
  [(SXWebContentComponentView *)self configureErrorProvider];
  [(SXWebContentComponentView *)self configureConfigurationProvider];
  id v9 = [(SXWebContentComponentView *)self stateMachine];
  [v9 activate];
}

- (void)loadComponent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentComponentView;
  [(SXComponentView *)&v12 loadComponent:a3];
  v4 = [(SXWebContentComponentView *)self loadingIndicator];
  v5 = [(SXWebContentComponentView *)self traitCollection];
  v6 = -[SXWebContentComponentView foregroundColor:](self, "foregroundColor:", [v5 userInterfaceStyle]);
  [v4 setColor:v6];

  v7 = [(SXWebContentComponentView *)self loadingPolicyProvider];
  uint64_t v8 = [v7 loadingPolicy];

  if (v8 == 2)
  {
    id v9 = [(SXWebContentComponentView *)self stateMachine];
    id v10 = (id)[v9 fireEventWithName:@"disable" withContext:0];
  }
  else
  {
    [(SXWebContentComponentView *)self loadWebContent];
    v11 = [(SXComponentView *)self viewport];
    [v11 addViewportChangeListener:self forOptions:8];

    [(SXWebContentComponentView *)self configureComponentExposureMonitor];
  }
}

- (void)configureComponentExposureMonitor
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SXWebContentComponentView *)self componentExposureMonitor];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke;
  v6[3] = &unk_264652A28;
  objc_copyWeak(&v7, &location);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke_2;
  v4[3] = &unk_264652A50;
  objc_copyWeak(&v5, &location);
  [v3 onExposureOf:self then:v6 when:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      id v11 = WeakRetained;
      id v7 = [WeakRetained componentExposureEvent];

      id WeakRetained = v11;
      if (!v7) {
        goto LABEL_8;
      }
      uint64_t v8 = [v11 componentExposureEvent];
      [v8 determineEndDate];

      id v9 = [v11 analyticsReporting];
      id v10 = [v11 componentExposureEvent];
      [v9 reportEvent:v10];

      [v11 setComponentExposureEvent:0];
    }
    else
    {
      if (a2 != 1) {
        goto LABEL_8;
      }
      id v11 = WeakRetained;
      v4 = [SXWebContentComponentExposureEvent alloc];
      id v5 = [v11 component];
      v6 = [(SXWebContentComponentExposureEvent *)v4 initWithComponent:v5];
      [v11 setComponentExposureEvent:v6];
    }
    id WeakRetained = v11;
  }
LABEL_8:
}

BOOL __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained containerViewController];
  objc_super v3 = [v2 presentationManager];
  BOOL v4 = [v3 presentationState] == 1;

  return v4;
}

- (void)loadWebContent
{
  objc_super v3 = [(SXComponentView *)self component];
  BOOL v4 = [v3 resourceIdentifier];

  if (!v4)
  {
    v19 = [(SXComponentView *)self component];
    v20 = [v19 URL];

    if (!v20) {
      return;
    }
    id v25 = [(SXWebContentComponentView *)self containerViewController];
    v15 = [(SXComponentView *)self component];
    v17 = [v15 URL];
    v16 = v25;
    v18 = v17;
    goto LABEL_8;
  }
  id v5 = [(SXComponentView *)self DOMObjectProvider];
  v6 = [(SXComponentView *)self component];
  id v7 = [v6 resourceIdentifier];
  id v25 = [v5 resourceForIdentifier:v7];

  uint64_t v8 = [v25 HTML];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(SXWebContentComponentView *)self loadingPolicyProvider];
    uint64_t v11 = [v10 loadingPolicy];

    if (v11 != 1)
    {
      v21 = [(SXWebContentComponentView *)self resourceDataSource];
      id v22 = [v25 baseURL];
      id v23 = [v21 translateURL:v22];
      v15 = [v23 URLByAppendingPathComponent:&stru_26D5311C0];

      v17 = [(SXWebContentComponentView *)self containerViewController];
      id v24 = [v25 HTML];
      [v17 loadHTMLString:v24 baseURL:v15];

      goto LABEL_10;
    }
  }
  objc_super v12 = [v25 URL];

  if (v12)
  {
    v13 = [(SXWebContentComponentView *)self resourceDataSource];
    v14 = [v25 URL];
    v15 = [v13 translateURL:v14];

    v16 = [(SXWebContentComponentView *)self containerViewController];
    v17 = v16;
    v18 = v15;
LABEL_8:
    [v16 loadURL:v18];
LABEL_10:
  }
}

- (void)configureViewController
{
  objc_super v3 = [(SXWebContentComponentView *)self containerViewController];
  BOOL v4 = [v3 view];
  [v4 setHidden:1];

  id v5 = [(SXComponentView *)self presentationDelegate];
  id v11 = [v5 presentingContentViewController];

  v6 = [(SXWebContentComponentView *)self containerViewController];
  [v11 addChildViewController:v6];

  id v7 = [(SXComponentView *)self contentView];
  uint64_t v8 = [(SXWebContentComponentView *)self containerViewController];
  id v9 = [v8 view];
  [v7 addSubview:v9];

  id v10 = [(SXWebContentComponentView *)self containerViewController];
  [v10 didMoveToParentViewController:v11];
}

- (void)configurePresentationManager
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SXWebContentComponentView *)self containerViewController];
  BOOL v4 = [v3 presentationManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SXWebContentComponentView_configurePresentationManager__block_invoke;
  v9[3] = &unk_264652A78;
  objc_copyWeak(&v10, &location);
  [v4 onPresentable:v9];

  id v5 = [(SXWebContentComponentView *)self containerViewController];
  v6 = [v5 presentationManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SXWebContentComponentView_configurePresentationManager__block_invoke_2;
  v7[3] = &unk_264651108;
  objc_copyWeak(&v8, &location);
  [v6 onLoad:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__SXWebContentComponentView_configurePresentationManager__block_invoke(uint64_t a1, double a2)
{
  if (a2 != 1.79769313e308)
  {
    objc_super v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained documentColumnLayout];
    [v5 contentScaleFactor];
    double v7 = round(v6 * a2);

    id v8 = objc_loadWeakRetained(v3);
    [v8 presentWithHeight:v7];
  }
}

void __57__SXWebContentComponentView_configurePresentationManager__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained stateMachine];
  id v2 = (id)[v1 fireEventWithName:@"reload" withContext:0];
}

- (void)configureErrorProvider
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SXWebContentComponentView *)self containerViewController];
  BOOL v4 = [v3 errorProvider];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SXWebContentComponentView_configureErrorProvider__block_invoke;
  v5[3] = &unk_264652AA0;
  objc_copyWeak(&v6, &location);
  [v4 onError:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__SXWebContentComponentView_configureErrorProvider__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [WeakRetained stateMachine];
  id v5 = (id)[v4 fireEventWithName:@"error" withContext:0];

  id v6 = [v8 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v7 = [v8 code];

    if (v7 != -1009) {
      goto LABEL_5;
    }
    id v6 = [WeakRetained reachabilityProvider];
    [v6 addReachabilityObserver:WeakRetained];
  }

LABEL_5:
}

- (void)configureConfigurationProvider
{
  objc_super v3 = [(SXWebContentComponentView *)self dataSourceProvider];
  BOOL v4 = [(SXComponentView *)self component];
  id v5 = [v4 dataSourceReferences];
  id v6 = [v5 NSDictionary];
  uint64_t v7 = [v3 dataSourcesForReferences:v6];

  id v8 = [(SXWebContentComponentView *)self configurationProvider];
  id v9 = [(SXComponentView *)self component];
  id v10 = [v9 URL];
  id v11 = objc_msgSend(v8, "configurationForSize:dataSources:sourceURL:", v7, v10, 0.0, 0.0);

  objc_super v12 = [(SXWebContentComponentView *)self containerViewController];
  [v12 setConfiguration:v11];

  objc_initWeak(&location, self);
  v13 = [(SXWebContentComponentView *)self configurationProvider];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__SXWebContentComponentView_configureConfigurationProvider__block_invoke;
  v15[3] = &unk_264652AC8;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  [v13 onChange:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __59__SXWebContentComponentView_configureConfigurationProvider__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = [WeakRetained configurationProvider];
  id v5 = objc_loadWeakRetained(v2);
  [v5 contentFrame];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = objc_loadWeakRetained(v2);
  objc_super v12 = [v11 component];
  v13 = [v12 URL];
  objc_msgSend(v4, "configurationForSize:dataSources:sourceURL:", v10, v13, v7, v9);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v14 = objc_loadWeakRetained(v2);
  v15 = [v14 containerViewController];
  [v15 setConfiguration:v16];
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  $EB925890EBEBD6850280D1FB85A9BD43 v32 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SXWebContentComponentView;
  [(SXComponentView *)&v31 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if (var0)
  {
    [(SXWebContentComponentView *)self layout];
    [(SXWebContentComponentView *)self reloadWebContent];
  }
  id v5 = [(SXWebContentComponentView *)self invalidationPromise];

  if (v5)
  {
    double v6 = [MEMORY[0x263F08D40] value:&v32 withObjCType:"{?=BBB}"];
    double v7 = [(SXWebContentComponentView *)self invalidationPromise];
    double v8 = [v7 resolve];
    ((void (**)(void, void *))v8)[2](v8, v6);

    [(SXWebContentComponentView *)self setInvalidationPromise:0];
  }
  double v9 = [(SXWebContentComponentView *)self dataSourceProvider];
  uint64_t v10 = [(SXComponentView *)self component];
  id v11 = [v10 dataSourceReferences];
  objc_super v12 = [v11 NSDictionary];
  v13 = [v9 dataSourcesForReferences:v12];

  id v14 = [(SXComponentView *)self documentColumnLayout];
  [v14 contentScaleFactor];
  double v16 = v15;

  id v17 = [(SXWebContentComponentView *)self containerViewController];
  v18 = [v17 scaleManager];
  [v18 setScale:v16];

  [(SXComponentView *)self contentFrame];
  double v20 = v19;
  double v22 = v21;
  CGAffineTransformMakeScale(&v30, 1.0 / v16, 1.0 / v16);
  double v23 = v22 * v30.c + v30.a * v20;
  double v24 = v22 * v30.d + v30.b * v20;
  id v25 = [(SXWebContentComponentView *)self configurationProvider];
  v26 = [(SXComponentView *)self component];
  v27 = [v26 URL];
  uint64_t v28 = objc_msgSend(v25, "configurationForSize:dataSources:sourceURL:", v13, v27, v23, v24);

  v29 = [(SXWebContentComponentView *)self containerViewController];
  [v29 setConfiguration:v28];
}

- (void)reloadWebContent
{
  id v3 = [(SXWebContentComponentView *)self stateMachine];
  id v2 = (id)[v3 fireEventWithName:@"reload" withContext:0];
}

- (void)presentWithHeight:(double)a3
{
  [(SXComponentView *)self contentFrame];
  double v5 = CGRectGetHeight(v17) - a3;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 >= 2.22044605e-16)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F59E68]);
    [(SXWebContentComponentView *)self setInvalidationPromise:v7];

    double v8 = [(SXWebContentComponentView *)self invalidationPromise];
    double v9 = [v8 promise];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__SXWebContentComponentView_presentWithHeight___block_invoke;
    v15[3] = &unk_264652AF0;
    void v15[4] = self;
    *(double *)&v15[5] = a3;
    id v10 = (id)[v9 then:v15];

    id v11 = [(SXWebContentComponentView *)self layoutInvalidator];
    objc_super v12 = [(SXComponentView *)self component];
    [(SXComponentView *)self contentFrame];
    id v13 = (id)objc_msgSend(v11, "invalidateComponent:suggestedSize:", v12, CGRectGetWidth(v18), a3);
  }
  else
  {
    id v14 = [(SXWebContentComponentView *)self stateMachine];
    id v6 = (id)[v14 fireEventWithName:@"present" withContext:0];
  }
}

uint64_t __47__SXWebContentComponentView_presentWithHeight___block_invoke(uint64_t a1, void *a2)
{
  char v10 = 0;
  __int16 v9 = 0;
  [a2 getValue:&v9];
  if (!(_BYTE)v9) {
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) contentFrame];
  double v3 = CGRectGetHeight(v11) - *(double *)(a1 + 40);
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  if (v3 > 2.22044605e-16)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentWithHeight:");
  }
  else
  {
LABEL_6:
    BOOL v4 = [*(id *)(a1 + 32) layoutInvalidator];
    double v5 = [*(id *)(a1 + 32) component];
    [v4 cancelPendingInvalidationForComponent:v5];

    id v6 = [*(id *)(a1 + 32) stateMachine];
    id v7 = (id)[v6 fireEventWithName:@"present" withContext:0];
  }
  return 0;
}

- (id)createStateMachine
{
  double v3 = [(SXWebContentComponentView *)self createLoadingState];
  BOOL v4 = [(SXWebContentComponentView *)self createPresentationState];
  double v5 = [(SXWebContentComponentView *)self createErrorState];
  double v20 = [(SXWebContentComponentView *)self createDisabledState];
  id v6 = objc_alloc(MEMORY[0x263F59E88]);
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v3, v5, 0);
  double v8 = (void *)[v6 initWithName:@"present" transitionFromStates:v7 toState:v4];

  id v9 = objc_alloc(MEMORY[0x263F59E88]);
  char v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v3, v4, 0);
  CGRect v11 = (void *)[v9 initWithName:@"error" transitionFromStates:v10 toState:v5];

  id v12 = objc_alloc(MEMORY[0x263F59E88]);
  id v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v4, 0);
  id v14 = (void *)[v12 initWithName:@"reload" transitionFromStates:v13 toState:v3];

  id v15 = objc_alloc(MEMORY[0x263F59E88]);
  double v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v3, v4, v5, 0);
  CGRect v17 = (void *)[v15 initWithName:@"disable" transitionFromStates:v16 toState:v20];

  CGRect v18 = (void *)[objc_alloc(MEMORY[0x263F59E80]) initWithState:v3 withOwner:self];
  [v18 addState:v4];
  [v18 addState:v5];
  [v18 addState:v20];
  [v18 addEvent:v8];
  [v18 addEvent:v11];
  [v18 addEvent:v14];
  [v18 addEvent:v17];

  return v18;
}

- (id)createLoadingState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"loading"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_41];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_46_0];
  return v2;
}

void __47__SXWebContentComponentView_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 containerViewController];
  double v5 = [v4 presentationManager];
  [v5 setPresentationState:2];

  id v6 = [v3 loadingIndicator];
  [v6 startAnimating];

  id v8 = [v3 layoutInvalidator];
  id v7 = [v3 component];

  [v8 mightInvalidateComponent:v7];
}

void __47__SXWebContentComponentView_createLoadingState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 loadingIndicator];
  [v3 stopAnimating];
}

- (id)createPresentationState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"presentationState"];
  id v3 = (id)[v2 onWillEnter:&__block_literal_global_51];
  id v4 = (id)[v2 onWillExit:&__block_literal_global_54];
  return v2;
}

void __52__SXWebContentComponentView_createPresentationState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 containerViewController];
  double v5 = [v4 presentationManager];
  [v5 setPresentationState:1];

  id v6 = [v3 componentExposureMonitor];
  [v6 conditionsChanged];

  id v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__SXWebContentComponentView_createPresentationState__block_invoke_2;
  v9[3] = &unk_2646511F8;
  id v10 = v3;
  id v8 = v3;
  [v7 animateWithDuration:v9 animations:0.15];
}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerViewController];
  v1 = [v2 view];
  [v1 setHidden:0];
}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SXWebContentComponentView_createPresentationState__block_invoke_4;
  v6[3] = &unk_2646511F8;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.15];
}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerViewController];
  v1 = [v2 view];
  [v1 setHidden:1];
}

- (id)createErrorState
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"error"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SXWebContentComponentView_createErrorState__block_invoke;
  v7[3] = &unk_264652B38;
  void v7[4] = self;
  id v4 = (id)[v3 onWillEnter:v7];
  id v5 = (id)[v3 onWillExit:&__block_literal_global_60];
  return v3;
}

void __45__SXWebContentComponentView_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  id v4 = [v22 containerViewController];
  id v5 = [v4 presentationManager];
  [v5 setPresentationState:2];

  id v6 = [v22 errorLabel];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v22 setErrorLabel:v7];

    id v8 = [v22 errorLabel];
    id v9 = SXBundle();
    id v10 = [v9 localizedStringForKey:@"SXTapToRetry" value:&stru_26D5311C0 table:0];
    [v8 setText:v10];

    CGRect v11 = [v22 errorLabel];
    [v11 setNumberOfLines:2];

    id v12 = [v22 errorLabel];
    [v12 setTextAlignment:1];

    id v13 = [v22 errorLabel];
    [v13 sizeToFit];

    id v14 = [v22 errorLabel];
    id v15 = [*(id *)(a1 + 32) traitCollection];
    double v16 = objc_msgSend(v22, "foregroundColor:", objc_msgSend(v15, "userInterfaceStyle"));
    [v14 setTextColor:v16];

    CGRect v17 = [v22 contentView];
    CGRect v18 = [v22 errorLabel];
    [v17 addSubview:v18];
  }
  [v22 layoutErrorView];
  double v19 = [v22 tapGestureRecognizer];
  [v22 addGestureRecognizer:v19];

  double v20 = [v22 layoutInvalidator];
  double v21 = [v22 component];
  [v20 cancelPendingInvalidationForComponent:v21];
}

void __45__SXWebContentComponentView_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 errorLabel];
  [v4 removeFromSuperview];

  [v3 setErrorLabel:0];
  id v5 = [v3 tapGestureRecognizer];
  [v3 removeGestureRecognizer:v5];
}

- (id)createDisabledState
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F59E90]) initWithName:@"disabled"];
  return v2;
}

- (void)layout
{
  [(SXWebContentComponentView *)self layoutLoadingIndicator];
  [(SXWebContentComponentView *)self layoutErrorView];
  [(SXWebContentComponentView *)self layoutWebView];
  [(SXWebContentComponentView *)self layoutIfNeeded];
}

- (void)layoutLoadingIndicator
{
  id v4 = [(SXWebContentComponentView *)self loadingIndicator];
  [(SXComponentView *)self contentFrame];
  double MidX = CGRectGetMidX(v6);
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v7));
}

- (void)layoutWebView
{
  id v4 = [(SXWebContentComponentView *)self containerViewController];
  id v3 = [v4 view];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v3, "setFrame:");
}

- (void)layoutErrorView
{
  id v4 = [(SXWebContentComponentView *)self errorLabel];
  [(SXComponentView *)self contentFrame];
  double MidX = CGRectGetMidX(v6);
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v7));
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v5 = [(SXComponentView *)self viewport];
  uint64_t v6 = [v5 appearState];

  if (v6 == 2)
  {
    id v8 = [(SXWebContentComponentView *)self containerViewController];
    CGRect v7 = [v8 presentationManager];
    [v7 refresh];
  }
}

- (void)reachabilityChanged:(BOOL)a3
{
  if (a3)
  {
    [(SXWebContentComponentView *)self loadWebContent];
    id v4 = [(SXWebContentComponentView *)self reachabilityProvider];
    [v4 removeReachabilityObserver:self];
  }
}

- (id)foregroundColor:(int64_t)a3
{
  id v4 = [(SXComponentView *)self DOMObjectProvider];
  id v5 = [(SXComponentView *)self component];
  uint64_t v6 = [v4 componentStyleForComponent:v5];

  if (v6)
  {
    CGRect v7 = [v6 backgroundColor];
    [v7 _luminance];
    if (v8 > 0.7) {
      [MEMORY[0x263F1C550] blackColor];
    }
    else {
    id v9 = [MEMORY[0x263F1C550] whiteColor];
    }
  }
  else
  {
    id v9 = [MEMORY[0x263F1C550] labelColor];
  }

  return v9;
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (SWContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (SXWebContentConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (SXWebContentComponentInteractionManager)interactionManager
{
  return self->_interactionManager;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (NFPendingPromise)invalidationPromise
{
  return self->_invalidationPromise;
}

- (void)setInvalidationPromise:(id)a3
{
}

- (SXComponentExposureMonitor)componentExposureMonitor
{
  return self->_componentExposureMonitor;
}

- (SXWebContentComponentExposureEvent)componentExposureEvent
{
  return self->_componentExposureEvent;
}

- (void)setComponentExposureEvent:(id)a3
{
}

- (SXWebContentDataSourceProviding)dataSourceProvider
{
  return self->_dataSourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceProvider, 0);
  objc_storeStrong((id *)&self->_componentExposureEvent, 0);
  objc_storeStrong((id *)&self->_componentExposureMonitor, 0);
  objc_storeStrong((id *)&self->_invalidationPromise, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
}

@end