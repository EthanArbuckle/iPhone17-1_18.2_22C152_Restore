@interface MTMetricsEventHandlers
- (Class)baseDataProviderClass;
- (MTAccountEventHandler)account;
- (MTClickEventHandler)click;
- (MTDialogEventHandler)dialog;
- (MTEnterEventHandler)enter;
- (MTExitEventHandler)exit;
- (MTFlexibleEventHandler)flexible;
- (MTImpressionsEventHandler)impressions;
- (MTMediaEventHandler)media;
- (MTPageEventHandler)page;
- (MTSearchEventHandler)search;
- (void)registerDefaultEventHandlers;
@end

@implementation MTMetricsEventHandlers

- (void)registerDefaultEventHandlers
{
  [(MTEventHandlers *)self registerEventHandlerName:@"account" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"click" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"dialog" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"enter" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"exit" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"impressions" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"media" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"page" eventHandlerClass:objc_opt_class()];
  [(MTEventHandlers *)self registerEventHandlerName:@"search" eventHandlerClass:objc_opt_class()];
  uint64_t v3 = objc_opt_class();

  [(MTEventHandlers *)self registerEventHandlerName:@"demographic" eventHandlerClass:v3];
}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (MTAccountEventHandler)account
{
  return (MTAccountEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"account"];
}

- (MTClickEventHandler)click
{
  return (MTClickEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"click"];
}

- (MTDialogEventHandler)dialog
{
  return (MTDialogEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"dialog"];
}

- (MTEnterEventHandler)enter
{
  return (MTEnterEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"enter"];
}

- (MTExitEventHandler)exit
{
  return (MTExitEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"exit"];
}

- (MTImpressionsEventHandler)impressions
{
  return (MTImpressionsEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"impressions"];
}

- (MTMediaEventHandler)media
{
  return (MTMediaEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"media"];
}

- (MTPageEventHandler)page
{
  return (MTPageEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"page"];
}

- (MTSearchEventHandler)search
{
  return (MTSearchEventHandler *)[(MTEventHandlers *)self objectForKeyedSubscript:@"search"];
}

- (MTFlexibleEventHandler)flexible
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_flexible)
  {
    uint64_t v3 = [MTFlexibleEventHandler alloc];
    v4 = [(MTObject *)v2 metricsKit];
    uint64_t v5 = [(MTObject *)v3 initWithMetricsKit:v4];
    flexible = v2->_flexible;
    v2->_flexible = (MTFlexibleEventHandler *)v5;
  }
  objc_sync_exit(v2);

  v7 = v2->_flexible;

  return v7;
}

- (void).cxx_destruct
{
}

@end