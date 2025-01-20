@interface NavIdleTimeoutTimer
- (BOOL)suppressInterruptions;
- (EventTap)eventTap;
- (NavIdleTimeoutGestureRecognizer)gestureRecognizer;
- (NavIdleTimeoutTimer)initWithView:(id)a3;
- (NavIdleTimeoutTimer)initWithView:(id)a3 idleTimeout:(double)a4;
- (NavIdleTimeoutTimer)initWithWindow:(id)a3;
- (NavIdleTimeoutTimer)initWithWindow:(id)a3 idleTimeout:(double)a4;
- (NavIdleTimerDelegate)delegate;
- (OS_dispatch_source)dispatchSource;
- (UIView)view;
- (UIWindow)window;
- (double)idleTimeout;
- (void)_handleEvent:(id)a3;
- (void)_handleGesture:(id)a3;
- (void)_handleTimer;
- (void)_invalidateTimer;
- (void)_scheduleTimer;
- (void)_setupEventTap;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDispatchSource:(id)a3;
- (void)setEventTap:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setSuppressInterruptions:(BOOL)a3;
@end

@implementation NavIdleTimeoutTimer

- (NavIdleTimeoutTimer)initWithWindow:(id)a3
{
  return [(NavIdleTimeoutTimer *)self initWithWindow:a3 idleTimeout:15.0];
}

- (NavIdleTimeoutTimer)initWithWindow:(id)a3 idleTimeout:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavIdleTimeoutTimer;
  v7 = [(NavIdleTimeoutTimer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_window, v6);
    v8->_idleTimeout = a4;
    [(NavIdleTimeoutTimer *)v8 _setupEventTap];
    [(NavIdleTimeoutTimer *)v8 _scheduleTimer];
  }

  return v8;
}

- (NavIdleTimeoutTimer)initWithView:(id)a3
{
  return [(NavIdleTimeoutTimer *)self initWithView:a3 idleTimeout:15.0];
}

- (NavIdleTimeoutTimer)initWithView:(id)a3 idleTimeout:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavIdleTimeoutTimer;
  v7 = [(NavIdleTimeoutTimer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_view, v6);
    v8->_idleTimeout = a4;
    [(NavIdleTimeoutTimer *)v8 _setupEventTap];
    [(NavIdleTimeoutTimer *)v8 _scheduleTimer];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(NavIdleTimeoutGestureRecognizer *)self->_gestureRecognizer view];
  [v3 removeGestureRecognizer:self->_gestureRecognizer];

  [(NavIdleTimeoutTimer *)self _invalidateTimer];
  v4.receiver = self;
  v4.super_class = (Class)NavIdleTimeoutTimer;
  [(NavIdleTimeoutTimer *)&v4 dealloc];
}

- (void)_setupEventTap
{
  v3 = [(NavIdleTimeoutTimer *)self window];

  if (v3)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100D53950;
    v11[3] = &unk_101318020;
    objc_copyWeak(&v12, &location);
    objc_super v4 = +[EventTap eventTapWithHandler:v11];
    [(NavIdleTimeoutTimer *)self setEventTap:v4];

    v5 = [(NavIdleTimeoutTimer *)self window];
    id v6 = [(NavIdleTimeoutTimer *)self eventTap];
    [v5 _maps_registerEventTap:v6];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = [(NavIdleTimeoutTimer *)self view];

    if (v7)
    {
      v8 = [[NavIdleTimeoutGestureRecognizer alloc] initWithTarget:self action:"_handleGesture:"];
      [(NavIdleTimeoutTimer *)self setGestureRecognizer:v8];

      id v10 = [(NavIdleTimeoutTimer *)self view];
      v9 = [(NavIdleTimeoutTimer *)self gestureRecognizer];
      [v10 addGestureRecognizer:v9];
    }
  }
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  if (![v4 type] && !-[NavIdleTimeoutTimer suppressInterruptions](self, "suppressInterruptions"))
  {
    [(NavIdleTimeoutTimer *)self _invalidateTimer];
    v5 = [(NavIdleTimeoutTimer *)self window];
    if (v5)
    {
      id v6 = [v4 touchesForWindow:v5];
    }
    else
    {
      v7 = [(NavIdleTimeoutTimer *)self view];
      v8 = [v7 window];
      id v6 = [v4 touchesForWindow:v8];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "phase", (void)v15) != (id)3 && objc_msgSend(v14, "phase") != (id)4)
          {

            goto LABEL_17;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [(NavIdleTimeoutTimer *)self _scheduleTimer];
LABEL_17:
  }
}

- (void)_handleGesture:(id)a3
{
  id v4 = [a3 event];
  [(NavIdleTimeoutTimer *)self _handleEvent:v4];
}

- (void)_scheduleTimer
{
  v3 = [(NavIdleTimeoutTimer *)self dispatchSource];

  if (v3) {
    [(NavIdleTimeoutTimer *)self _invalidateTimer];
  }
  id v4 = sub_100D53DF0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [(NavIdleTimeoutTimer *)self idleTimeout];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling timeout in %f", buf, 0xCu);
  }

  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  [(NavIdleTimeoutTimer *)self setDispatchSource:v6];

  objc_initWeak((id *)buf, self);
  v7 = [(NavIdleTimeoutTimer *)self dispatchSource];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100D53E44;
  handler[3] = &unk_1012E6708;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler(v7, handler);

  [(NavIdleTimeoutTimer *)self idleTimeout];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  id v10 = [(NavIdleTimeoutTimer *)self dispatchSource];
  [(NavIdleTimeoutTimer *)self idleTimeout];
  dispatch_source_set_timer(v10, v9, 1000000000 * (unint64_t)v11, 0x3B9ACA00uLL);

  uint64_t v12 = [(NavIdleTimeoutTimer *)self dispatchSource];
  dispatch_resume(v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_invalidateTimer
{
  v3 = [(NavIdleTimeoutTimer *)self dispatchSource];

  if (v3)
  {
    id v4 = [(NavIdleTimeoutTimer *)self dispatchSource];
    dispatch_source_cancel(v4);

    [(NavIdleTimeoutTimer *)self setDispatchSource:0];
  }
}

- (void)_handleTimer
{
  [(NavIdleTimeoutTimer *)self _invalidateTimer];
  v3 = sub_100D53DF0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timeout fired", v5, 2u);
  }

  id v4 = [(NavIdleTimeoutTimer *)self delegate];
  [v4 idleTimerDidTimeout:self];
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (UIWindow *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (BOOL)suppressInterruptions
{
  return self->_suppressInterruptions;
}

- (void)setSuppressInterruptions:(BOOL)a3
{
  self->_suppressInterruptions = a3;
}

- (NavIdleTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavIdleTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
}

- (NavIdleTimeoutGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (OS_dispatch_source)dispatchSource
{
  return self->_dispatchSource;
}

- (void)setDispatchSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSource, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eventTap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);

  objc_destroyWeak((id *)&self->_window);
}

@end