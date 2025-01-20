@interface _TVPagePerformanceTemplateEntry
- (IKViewElement)templateElement;
- (NSString)templateElementName;
- (_TVPagePerformanceController)performanceController;
- (_TVPagePerformanceTemplateEntry)initWithPagePerformanceController:(id)a3 forTemplateElement:(id)a4;
- (unint64_t)templateDidLoadLastImageProxy;
- (unint64_t)templateDidLoadResources;
- (unint64_t)templateDidRender;
- (unint64_t)templateDidTransition;
- (unint64_t)templateRenderDuration;
- (unint64_t)templateResourcesDuration;
- (unint64_t)templateTransitionDuration;
- (unint64_t)templateUpdateCount;
- (unint64_t)templateWillLoadFirstImageProxy;
- (unint64_t)templateWillLoadResources;
- (unint64_t)templateWillRender;
- (unint64_t)templateWillTransition;
- (void)_beginListeningForInitialImageProxyLoadNotifications;
- (void)_maybeStopListeningForInitialImageProxyLoadNotifications;
- (void)_receivedImageProxyDidLoadNotification:(id)a3;
- (void)_receivedImageProxyWillLoadNotification:(id)a3;
- (void)_stopListeningForInitialImageProxyLoadNotifications;
- (void)dealloc;
- (void)markTemplateDidRender;
- (void)markTemplateDidTransition;
- (void)markTemplateWillRender;
- (void)markTemplateWillTransition;
- (void)setPerformanceController:(id)a3;
- (void)setTemplateDidLoadLastImageProxy:(unint64_t)a3;
- (void)setTemplateDidLoadResources:(unint64_t)a3;
- (void)setTemplateDidRender:(unint64_t)a3;
- (void)setTemplateDidTransition:(unint64_t)a3;
- (void)setTemplateElement:(id)a3;
- (void)setTemplateElementName:(id)a3;
- (void)setTemplateUpdateCount:(unint64_t)a3;
- (void)setTemplateWillLoadFirstImageProxy:(unint64_t)a3;
- (void)setTemplateWillLoadResources:(unint64_t)a3;
- (void)setTemplateWillRender:(unint64_t)a3;
- (void)setTemplateWillTransition:(unint64_t)a3;
@end

@implementation _TVPagePerformanceTemplateEntry

- (_TVPagePerformanceTemplateEntry)initWithPagePerformanceController:(id)a3 forTemplateElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TVPagePerformanceTemplateEntry;
  v8 = [(_TVPagePerformanceTemplateEntry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(_TVPagePerformanceTemplateEntry *)v8 setPerformanceController:v6];
    [(_TVPagePerformanceTemplateEntry *)v9 setTemplateElement:v7];
    v10 = [v7 elementName];
    [(_TVPagePerformanceTemplateEntry *)v9 setTemplateElementName:v10];
  }
  return v9;
}

- (void)dealloc
{
  [(_TVPagePerformanceTemplateEntry *)self _stopListeningForInitialImageProxyLoadNotifications];
  v3.receiver = self;
  v3.super_class = (Class)_TVPagePerformanceTemplateEntry;
  [(_TVPagePerformanceTemplateEntry *)&v3 dealloc];
}

- (void)markTemplateWillRender
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (IsPerformanceLoggingEnabled())
  {
    objc_super v3 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateWillRender", (uint8_t *)&v6, 0xCu);
    }
  }
  [(_TVPagePerformanceTemplateEntry *)self setTemplateWillRender:mach_absolute_time()];
  [(_TVPagePerformanceTemplateEntry *)self _beginListeningForInitialImageProxyLoadNotifications];
}

- (void)markTemplateDidRender
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (IsPerformanceLoggingEnabled())
  {
    objc_super v3 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateDidRender", (uint8_t *)&v6, 0xCu);
    }
  }
  [(_TVPagePerformanceTemplateEntry *)self setTemplateDidRender:mach_absolute_time()];
}

- (void)markTemplateWillTransition
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceTemplateEntry *)self templateWillTransition])
  {
    if (IsPerformanceLoggingEnabled())
    {
      objc_super v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
        int v6 = 138412290;
        id v7 = v5;
        _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateWillTransition", (uint8_t *)&v6, 0xCu);
      }
    }
    [(_TVPagePerformanceTemplateEntry *)self setTemplateWillTransition:mach_absolute_time()];
  }
}

- (void)markTemplateDidTransition
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceTemplateEntry *)self templateDidTransition])
  {
    if (IsPerformanceLoggingEnabled())
    {
      objc_super v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
        int v6 = 138412290;
        id v7 = v5;
        _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateDidTransition", (uint8_t *)&v6, 0xCu);
      }
    }
    [(_TVPagePerformanceTemplateEntry *)self setTemplateDidTransition:mach_absolute_time()];
  }
  [(_TVPagePerformanceTemplateEntry *)self _maybeStopListeningForInitialImageProxyLoadNotifications];
}

- (unint64_t)templateRenderDuration
{
  unint64_t v3 = [(_TVPagePerformanceTemplateEntry *)self templateWillRender];
  unint64_t v4 = [(_TVPagePerformanceTemplateEntry *)self templateDidRender];
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(v3, v4);
}

- (unint64_t)templateResourcesDuration
{
  unint64_t v3 = [(_TVPagePerformanceTemplateEntry *)self templateWillLoadResources];
  unint64_t v4 = [(_TVPagePerformanceTemplateEntry *)self templateDidLoadResources];
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(v3, v4);
}

- (unint64_t)templateTransitionDuration
{
  unint64_t v3 = [(_TVPagePerformanceTemplateEntry *)self templateWillTransition];
  unint64_t v4 = [(_TVPagePerformanceTemplateEntry *)self templateDidTransition];
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(v3, v4);
}

- (void)_beginListeningForInitialImageProxyLoadNotifications
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![(_TVPagePerformanceTemplateEntry *)self templateDidLoadResources])
  {
    if (IsPerformanceLoggingEnabled())
    {
      unint64_t v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = v3;
        v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
        int v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ beginListeningForImageProxyLoadNotifications", (uint8_t *)&v10, 0xCu);
      }
    }
    [(_TVPagePerformanceTemplateEntry *)self setTemplateWillLoadResources:mach_absolute_time()];
    int v6 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    initialOnScreenImageProxies = self->_initialOnScreenImageProxies;
    self->_initialOnScreenImageProxies = v6;

    *(_WORD *)&self->_listeningForImageProxyWillLoad = 257;
    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__receivedImageProxyWillLoadNotification_ name:@"_TVPagePerformanceImageProxyWillLoadNotification" object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel__receivedImageProxyDidLoadNotification_ name:@"_TVPagePerformanceImageProxyDidLoadNotification" object:0];
  }
}

- (void)_stopListeningForInitialImageProxyLoadNotifications
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_listeningForImageProxyWillLoad || self->_listeningForImageProxyDidLoad)
  {
    if (IsPerformanceLoggingEnabled())
    {
      unint64_t v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = v3;
        v5 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
        int v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_230B4C000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ stopListeningForInitialImageProxyLoadNotifications", (uint8_t *)&v8, 0xCu);
      }
    }
    int v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:@"_TVPagePerformanceImageProxyWillLoadNotification" object:0];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:@"_TVPagePerformanceImageProxyDidLoadNotification" object:0];

    [(NSHashTable *)self->_initialOnScreenImageProxies removeAllObjects];
    *(_WORD *)&self->_listeningForImageProxyWillLoad = 0;
  }
}

- (void)_maybeStopListeningForInitialImageProxyLoadNotifications
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = [(_TVPagePerformanceTemplateEntry *)self performanceController];
  if ([v12 viewDidAppear]
    && [(_TVPagePerformanceTemplateEntry *)self templateDidTransition])
  {
    unint64_t v3 = [(_TVPagePerformanceTemplateEntry *)self templateWillLoadResources];

    if (!v3) {
      return;
    }
    if (self->_listeningForImageProxyWillLoad || self->_listeningForImageProxyDidLoad)
    {
      if (IsPerformanceLoggingEnabled())
      {
        unint64_t v4 = (void *)TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v5 = v4;
          int v6 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_impl(&dword_230B4C000, v5, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ maybeStopListeningForInitialImageProxyLoadNotifications", buf, 0xCu);
        }
      }
      if ([(NSHashTable *)self->_initialOnScreenImageProxies count])
      {
        if (IsPerformanceLoggingEnabled())
        {
          id v7 = TVMLKitPerformanceLogObject;
          if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230B4C000, v7, OS_LOG_TYPE_DEFAULT, "[DEBUG] Stop listening for TVImageProxyWillLoadNotification", buf, 2u);
          }
        }
        int v8 = [MEMORY[0x263F08A00] defaultCenter];
        [v8 removeObserver:self name:@"_TVPagePerformanceImageProxyWillLoadNotification" object:0];

        self->_listeningForImageProxyWillLoad = 0;
      }
      else
      {
        if (![(_TVPagePerformanceTemplateEntry *)self templateDidLoadResources])
        {
          if (IsPerformanceLoggingEnabled())
          {
            v9 = TVMLKitPerformanceLogObject;
            if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_230B4C000, v9, OS_LOG_TYPE_DEFAULT, "[DEBUG] No initial on-screen resources left to load.", buf, 2u);
            }
          }
          if ([(_TVPagePerformanceTemplateEntry *)self templateDidLoadLastImageProxy]) {
            unint64_t v10 = [(_TVPagePerformanceTemplateEntry *)self templateDidLoadLastImageProxy];
          }
          else {
            unint64_t v10 = [(_TVPagePerformanceTemplateEntry *)self templateWillLoadResources];
          }
          [(_TVPagePerformanceTemplateEntry *)self setTemplateDidLoadResources:v10];
          [(_TVPagePerformanceTemplateEntry *)self _stopListeningForInitialImageProxyLoadNotifications];
        }
        v11 = [(_TVPagePerformanceTemplateEntry *)self performanceController];
        [v11 _maybeDeliverMetrics];
      }
      return;
    }
    if (![(_TVPagePerformanceTemplateEntry *)self templateUpdateCount]) {
      return;
    }
    id v12 = [(_TVPagePerformanceTemplateEntry *)self performanceController];
    [v12 _maybeDeliverMetrics];
  }
}

- (void)_receivedImageProxyWillLoadNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
  int v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"_TVPagePerformanceImageProxyNotificationTimestamp"];
  unint64_t v8 = [v7 unsignedLongLongValue];

  if (IsPerformanceLoggingEnabled())
  {
    v9 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = v9;
      v11 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
      int v12 = 138412546;
      v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_230B4C000, v10, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ receivedImageProxyWillLoadNotification: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  if (![(_TVPagePerformanceTemplateEntry *)self templateWillLoadFirstImageProxy]
    || v8 < [(_TVPagePerformanceTemplateEntry *)self templateWillLoadFirstImageProxy])
  {
    [(_TVPagePerformanceTemplateEntry *)self setTemplateWillLoadFirstImageProxy:v8];
  }
  [(NSHashTable *)self->_initialOnScreenImageProxies addObject:v5];
}

- (void)_receivedImageProxyDidLoadNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
  int v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"_TVPagePerformanceImageProxyNotificationTimestamp"];
  unint64_t v8 = [v7 unsignedLongLongValue];

  if (IsPerformanceLoggingEnabled())
  {
    v9 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = v9;
      v11 = [(_TVPagePerformanceTemplateEntry *)self templateElementName];
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_230B4C000, v10, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ receivedImageProxyDidLoadNotification %@", (uint8_t *)&v14, 0x16u);
    }
  }
  if ([(NSHashTable *)self->_initialOnScreenImageProxies containsObject:v5])
  {
    if (![(_TVPagePerformanceTemplateEntry *)self templateDidLoadLastImageProxy]
      || v8 > [(_TVPagePerformanceTemplateEntry *)self templateDidLoadLastImageProxy])
    {
      [(_TVPagePerformanceTemplateEntry *)self setTemplateDidLoadLastImageProxy:v8];
    }
    [(NSHashTable *)self->_initialOnScreenImageProxies removeObject:v5];
    if (!self->_listeningForImageProxyWillLoad && ![(NSHashTable *)self->_initialOnScreenImageProxies count])
    {
      if (IsPerformanceLoggingEnabled())
      {
        int v12 = TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_230B4C000, v12, OS_LOG_TYPE_DEFAULT, "[DEBUG] All initial on-screen resources have finished loading.", (uint8_t *)&v14, 2u);
        }
      }
      [(_TVPagePerformanceTemplateEntry *)self setTemplateDidLoadResources:[(_TVPagePerformanceTemplateEntry *)self templateDidLoadLastImageProxy]];
      [(_TVPagePerformanceTemplateEntry *)self _stopListeningForInitialImageProxyLoadNotifications];
      v13 = [(_TVPagePerformanceTemplateEntry *)self performanceController];
      [v13 _maybeDeliverMetrics];
    }
  }
}

- (IKViewElement)templateElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateElement);
  return (IKViewElement *)WeakRetained;
}

- (void)setTemplateElement:(id)a3
{
}

- (NSString)templateElementName
{
  return self->_templateElementName;
}

- (void)setTemplateElementName:(id)a3
{
}

- (unint64_t)templateUpdateCount
{
  return self->_templateUpdateCount;
}

- (void)setTemplateUpdateCount:(unint64_t)a3
{
  self->_templateUpdateCount = a3;
}

- (unint64_t)templateWillRender
{
  return self->_templateWillRender;
}

- (void)setTemplateWillRender:(unint64_t)a3
{
  self->_templateWillRender = a3;
}

- (unint64_t)templateDidRender
{
  return self->_templateDidRender;
}

- (void)setTemplateDidRender:(unint64_t)a3
{
  self->_templateDidRender = a3;
}

- (unint64_t)templateWillTransition
{
  return self->_templateWillTransition;
}

- (void)setTemplateWillTransition:(unint64_t)a3
{
  self->_templateWillTransition = a3;
}

- (unint64_t)templateDidTransition
{
  return self->_templateDidTransition;
}

- (void)setTemplateDidTransition:(unint64_t)a3
{
  self->_templateDidTransition = a3;
}

- (unint64_t)templateWillLoadResources
{
  return self->_templateWillLoadResources;
}

- (void)setTemplateWillLoadResources:(unint64_t)a3
{
  self->_templateWillLoadResources = a3;
}

- (unint64_t)templateDidLoadResources
{
  return self->_templateDidLoadResources;
}

- (void)setTemplateDidLoadResources:(unint64_t)a3
{
  self->_templateDidLoadResources = a3;
}

- (unint64_t)templateWillLoadFirstImageProxy
{
  return self->_templateWillLoadFirstImageProxy;
}

- (void)setTemplateWillLoadFirstImageProxy:(unint64_t)a3
{
  self->_templateWillLoadFirstImageProxy = a3;
}

- (unint64_t)templateDidLoadLastImageProxy
{
  return self->_templateDidLoadLastImageProxy;
}

- (void)setTemplateDidLoadLastImageProxy:(unint64_t)a3
{
  self->_templateDidLoadLastImageProxy = a3;
}

- (_TVPagePerformanceController)performanceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_performanceController);
  return (_TVPagePerformanceController *)WeakRetained;
}

- (void)setPerformanceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_performanceController);
  objc_storeStrong((id *)&self->_templateElementName, 0);
  objc_destroyWeak((id *)&self->_templateElement);
  objc_storeStrong((id *)&self->_initialOnScreenImageProxies, 0);
}

@end