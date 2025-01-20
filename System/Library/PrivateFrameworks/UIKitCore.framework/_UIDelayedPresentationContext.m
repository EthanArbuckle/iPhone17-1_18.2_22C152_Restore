@interface _UIDelayedPresentationContext
- (NSInvocation)presentInvocation;
- (UIWindowScene)windowSceneIgnoringEvents;
- (_UIDelayedPresentationContext)initWithTimeout:(double)a3 cancellationHandler:(id)a4;
- (id)cancellationHandler;
- (id)delayingController;
- (id)invocationTarget;
- (int64_t)decrementRequestCount;
- (int64_t)incrementRequestCount;
- (int64_t)requestCount;
- (void)beginDelayedPresentation;
- (void)dealloc;
- (void)setCancellationHandler:(id)a3;
- (void)setPresentInvocation:(id)a3;
- (void)setWindowSceneIgnoringEvents:(id)a3;
@end

@implementation _UIDelayedPresentationContext

- (int64_t)requestCount
{
  return self->_reqcnt;
}

- (int64_t)decrementRequestCount
{
  int64_t v2 = self->_reqcnt - 1;
  self->_reqcnt = v2;
  return v2;
}

- (_UIDelayedPresentationContext)initWithTimeout:(double)a3 cancellationHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDelayedPresentationContext;
  id v5 = a4;
  v6 = [(_UIDelayedPresentationContext *)&v8 init];
  v6->_enableUserInteraction = 0;
  v6->_timeout = a3;
  -[_UIDelayedPresentationContext setCancellationHandler:](v6, "setCancellationHandler:", v5, v8.receiver, v8.super_class);

  v6->_reqcnt = 1;
  return v6;
}

- (void)setCancellationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowSceneIgnoringEvents);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_presentInvocation, 0);
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_windowSceneIgnoringEvents = &self->_windowSceneIgnoringEvents;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);

  if (WeakRetained)
  {
    id v5 = [(_UIDelayedPresentationContext *)self delayingController];
    v6 = (objc_class *)objc_opt_class();
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state: deallocating delayed presentation of <%s: %p> while still ignoring events", class_getName(v6), v5);
    objc_super v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &dealloc___s_category_4) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v9 = objc_loadWeakRetained((id *)p_windowSceneIgnoringEvents);
    [v9 _endIgnoringInteractionEventsForReason:v7];

    objc_storeWeak((id *)p_windowSceneIgnoringEvents, 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIDelayedPresentationContext;
  [(_UIDelayedPresentationContext *)&v10 dealloc];
}

- (id)invocationTarget
{
  return [(NSInvocation *)self->_presentInvocation target];
}

- (id)delayingController
{
  if (self->_presentInvocation)
  {
    int64_t v2 = [(_UIDelayedPresentationContext *)self invocationTarget];
    v3 = objc_getAssociatedObject(v2, &unk_1EB25BB22);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)incrementRequestCount
{
  int64_t v2 = self->_reqcnt + 1;
  self->_reqcnt = v2;
  return v2;
}

- (void)beginDelayedPresentation
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 8))
    {
      int64_t v2 = [(id)a1 delayingController];
      v3 = (objc_class *)objc_opt_class();
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"Beginning delayed presentation of <%s: %p>", class_getName(v3), v2);
      id v5 = [(id)a1 windowSceneIgnoringEvents];
      [v5 _beginIgnoringInteractionEventsForReason:v4];
    }
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    v7 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v6;

    objc_initWeak(&location, (id)a1);
    objc_super v8 = *(NSObject **)(a1 + 48);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57___UIDelayedPresentationContext_beginDelayedPresentation__block_invoke;
    handler[3] = &unk_1E52DC308;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v8, handler);
    id v9 = *(NSObject **)(a1 + 48);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, (unint64_t)(*(double *)(a1 + 40) * 10.0 * 1000000000.0), 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (NSInvocation)presentInvocation
{
  return self->_presentInvocation;
}

- (void)setPresentInvocation:(id)a3
{
}

- (UIWindowScene)windowSceneIgnoringEvents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);
  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowSceneIgnoringEvents:(id)a3
{
}

@end