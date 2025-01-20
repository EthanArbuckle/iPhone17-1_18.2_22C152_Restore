@interface BCLayoutMetrics
- (BCLayoutMetrics)initWithObserver:(id)a3 factory:(id)a4 manager:(id)a5 delegate:(id)a6;
- (BCLayoutMetricsDelegate)delegate;
- (BCMetricsEnvironmentObserver)observer;
- (BOOL)_needsUpdatingWithEnvironment:(id)a3;
- (BOOL)compactWidth;
- (BOOL)updateIfNeededWithEnvironment:(id)a3;
- (NSDictionary)metrics;
- (TUIEnvironment)environment;
- (TUIManager)manager;
- (TUITemplate)metricsTemplate;
- (TUITemplateFactory)metricsTemplateFactory;
- (id)_computeMetricsWithEnvironment:(id)a3;
- (void)_fontNeedsUpdate;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCompactWidth:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setManager:(id)a3;
- (void)setMetricsTemplate:(id)a3;
- (void)setMetricsTemplateFactory:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation BCLayoutMetrics

- (BCLayoutMetrics)initWithObserver:(id)a3 factory:(id)a4 manager:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCLayoutMetrics;
  v14 = [(BCLayoutMetrics *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_observer, v10);
    objc_storeStrong((id *)&v15->_metricsTemplateFactory, a4);
    objc_storeStrong((id *)&v15->_manager, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v16 = [v13 metricsTemplateURL];
    uint64_t v17 = [(TUITemplateFactory *)v15->_metricsTemplateFactory templateFromURL:v16];
    metricsTemplate = v15->_metricsTemplate;
    v15->_metricsTemplate = (TUITemplate *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v15 selector:"_fontNeedsUpdate" name:NSCurrentLocaleDidChangeNotification object:0];

    v20 = +[NSUserDefaults standardUserDefaults];
    [v20 addObserver:v15 forKeyPath:TUIUserDefaultForceFallbackFont options:0 context:off_33FA58];
  }
  return v15;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:TUIUserDefaultForceFallbackFont context:off_33FA58];

  v5.receiver = self;
  v5.super_class = (Class)BCLayoutMetrics;
  [(BCLayoutMetrics *)&v5 dealloc];
}

- (void)_fontNeedsUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained bc_environmentDidChangeFont];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_33FA58 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1C5AC;
    block[3] = &unk_2C3C50;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BCLayoutMetrics;
    -[BCLayoutMetrics observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCLayoutMetrics *)self _needsUpdatingWithEnvironment:v4];
  if (v5)
  {
    if (v4)
    {
      objc_super v6 = [(BCLayoutMetrics *)self _computeMetricsWithEnvironment:v4];
      metrics = self->_metrics;
      self->_metrics = v6;
    }
    else
    {
      metrics = self->_metrics;
      self->_metrics = 0;
    }
  }
  return v5;
}

- (BOOL)_needsUpdatingWithEnvironment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCLayoutMetrics *)self environment];

  LOBYTE(v6) = 1;
  if (v4 && v5)
  {
    v7 = [(BCLayoutMetrics *)self environment];
    unsigned int v6 = [v4 isEqualToEnvironment:v7] ^ 1;
  }
  return v6;
}

- (void)invalidate
{
  environment = self->_environment;
  self->_environment = 0;

  metrics = self->_metrics;
  self->_metrics = 0;
}

- (id)_computeMetricsWithEnvironment:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  objc_storeStrong((id *)&self->_environment, a3);
  id v6 = objc_alloc((Class)TUIInstantiateContext);
  v7 = [(TUITemplate *)self->_metricsTemplate package];
  manager = self->_manager;
  v9 = objc_opt_new();
  id v10 = [v6 initWithDelegate:0 package:v7 manager:manager identifierMap:v9 environment:v5 state:0 feedId:TUIFeedIdentifierNil];

  id v11 = [(BCLayoutMetrics *)self delegate];
  id v12 = [(TUITemplate *)self->_metricsTemplate package];
  [v11 addSymbolsToMetricsEnvironment:v5 package:v12];

  id v13 = +[NSMutableDictionary dictionary];
  v25 = v10;
  v14 = [v10 instantiateTemplate:self->_metricsTemplate bindings:0 actionObject:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = [(id)objc_opt_class() supportedMetrics];

  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_super v22 = [(id)objc_opt_class() sectionName];
        v23 = [v14 sectionForKey:v22];
        if (v23)
        {
          [v21 configureWithSection:v23];
          [v13 setObject:v21 forKey:v22];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }

  kdebug_trace();

  return v13;
}

- (BOOL)compactWidth
{
  return self->_compactWidth;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->_compactWidth = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (BCMetricsEnvironmentObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (BCMetricsEnvironmentObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BCLayoutMetricsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCLayoutMetricsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TUITemplateFactory)metricsTemplateFactory
{
  return self->_metricsTemplateFactory;
}

- (void)setMetricsTemplateFactory:(id)a3
{
}

- (TUITemplate)metricsTemplate
{
  return self->_metricsTemplate;
}

- (void)setMetricsTemplate:(id)a3
{
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_metricsTemplate, 0);
  objc_storeStrong((id *)&self->_metricsTemplateFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end