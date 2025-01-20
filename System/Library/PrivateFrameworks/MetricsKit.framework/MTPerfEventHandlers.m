@interface MTPerfEventHandlers
- (Class)baseDataProviderClass;
- (MTFlexiblePerfEventHandler)flexible;
- (MTLoadUrlEventHandler)loadUrl;
- (MTPageRenderEventHandler)pageRender;
- (void)registerDefaultEventHandlers;
@end

@implementation MTPerfEventHandlers

- (MTFlexiblePerfEventHandler)flexible
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_flexible)
  {
    v3 = [MTFlexiblePerfEventHandler alloc];
    v4 = [(MTObject *)v2 metricsKit];
    uint64_t v5 = [(MTObject *)v3 initWithMetricsKit:v4];
    flexible = v2->_flexible;
    v2->_flexible = (MTFlexiblePerfEventHandler *)v5;
  }
  objc_sync_exit(v2);

  v7 = v2->_flexible;

  return v7;
}

- (void).cxx_destruct
{
}

- (void)registerDefaultEventHandlers
{
  [(MTEventHandlers *)self registerEventHandlerName:@"pageRender" eventHandlerClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();

  [(MTEventHandlers *)self registerEventHandlerName:@"loadUrl" eventHandlerClass:v3];
}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (MTPageRenderEventHandler)pageRender
{
  return (MTPageRenderEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"pageRender"];
}

- (MTLoadUrlEventHandler)loadUrl
{
  return (MTLoadUrlEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"loadUrl"];
}

@end