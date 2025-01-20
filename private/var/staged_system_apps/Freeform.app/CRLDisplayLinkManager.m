@interface CRLDisplayLinkManager
+ (id)sharedManager;
- (CRLDisplayLinkManager)init;
- (id)p_initWithPlatformAdapterClass:(Class)a3;
- (void)addLink:(id)a3;
- (void)p_createPlatformAdapter;
- (void)p_destroyPlatformAdapter;
- (void)p_linkTriggeredAt:(double)a3 forTargetTime:(double)a4;
- (void)p_updateState;
- (void)removeLink:(id)a3;
- (void)updatePausedForLink:(id)a3;
@end

@implementation CRLDisplayLinkManager

+ (id)sharedManager
{
  if (qword_1016A9538 != -1) {
    dispatch_once(&qword_1016A9538, &stru_1014E6570);
  }
  v2 = (void *)qword_1016A9530;

  return v2;
}

- (id)p_initWithPlatformAdapterClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRLDisplayLinkManager;
  v4 = [(CRLDisplayLinkManager *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    registeredLinks = v4->_registeredLinks;
    v4->_registeredLinks = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeLinks = v4->_activeLinks;
    v4->_activeLinks = v7;

    v4->_adapterClass = a3;
  }
  return v4;
}

- (CRLDisplayLinkManager)init
{
  uint64_t v3 = objc_opt_class();

  return (CRLDisplayLinkManager *)[(CRLDisplayLinkManager *)self p_initWithPlatformAdapterClass:v3];
}

- (void)addLink:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_registeredLinks addObject:v4];
  if (([v4 paused] & 1) == 0) {
    [(NSMutableSet *)self->_activeLinks addObject:v4];
  }
  [(CRLDisplayLinkManager *)self p_updateState];
}

- (void)removeLink:(id)a3
{
  registeredLinks = self->_registeredLinks;
  id v5 = a3;
  [(NSMutableSet *)registeredLinks removeObject:v5];
  [(NSMutableSet *)self->_activeLinks removeObject:v5];

  [(CRLDisplayLinkManager *)self p_updateState];
}

- (void)updatePausedForLink:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 paused];
  activeLinks = self->_activeLinks;
  if (v5) {
    [(NSMutableSet *)activeLinks removeObject:v4];
  }
  else {
    [(NSMutableSet *)activeLinks addObject:v4];
  }

  [(CRLDisplayLinkManager *)self p_updateState];
}

- (void)p_updateState
{
  adapter = self->_adapter;
  id v4 = [(NSMutableSet *)self->_registeredLinks count];
  id v5 = [(NSMutableSet *)self->_activeLinks count];
  if (adapter) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    [(CRLDisplayLinkManager *)self p_destroyPlatformAdapter];
  }
  else
  {
    id v7 = v5;
    if (v4) {
      BOOL v8 = adapter == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      [(CRLDisplayLinkManager *)self p_createPlatformAdapter];
    }
    else if (!v4)
    {
      return;
    }
    if ((v7 == 0) != [(CRLDisplayLinkPlatformAdapter *)self->_adapter paused])
    {
      v9 = self->_adapter;
      [(CRLDisplayLinkPlatformAdapter *)v9 setPaused:v7 == 0];
    }
  }
}

- (void)p_createPlatformAdapter
{
  if (self->_adapter)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6590);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092550();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E65B0);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLinkManager p_createPlatformAdapter]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 181, 0, "expected nil value for '%{public}s'", "_adapter");
  }
  BOOL v6 = [[(objc_class *)self->_adapterClass alloc] initWithTarget:self action:"p_linkTriggeredAt:forTargetTime:"];
  adapter = self->_adapter;
  self->_adapter = v6;
}

- (void)p_destroyPlatformAdapter
{
  adapter = self->_adapter;
  if (!adapter)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E65D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092600();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E65F0);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLinkManager p_destroyPlatformAdapter]");
    BOOL v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 186, 0, "invalid nil value for '%{public}s'", "_adapter");

    adapter = self->_adapter;
  }
  [(CRLDisplayLinkPlatformAdapter *)adapter invalidate];
  id v7 = self->_adapter;
  self->_adapter = 0;
}

- (void)p_linkTriggeredAt:(double)a3 forTargetTime:(double)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMutableSet *)self->_activeLinks copy];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) i_triggerHandlerAtTime:a3 targetTime:a4];
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_activeLinks, 0);

  objc_storeStrong((id *)&self->_registeredLinks, 0);
}

@end