@interface CarDisplayWindow
- (CarDisplayWindow)initWithFrame:(CGRect)a3;
- (void)becomeKeyWindow;
- (void)notificationLayoutGuideDidChange;
- (void)registerEventTap:(id)a3;
- (void)resignKeyWindow;
- (void)sendEvent:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarDisplayWindow

- (CarDisplayWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarDisplayWindow;
  v3 = -[CarDisplayWindow initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor _externalSystemSuperDarkGrayColor];
    [(CarDisplayWindow *)v3 setBackgroundColor:v4];

    -[CarDisplayWindow _setFocusableContentMargins:](v3, "_setFocusableContentMargins:", 0.0, -1.0, 0.0, -1.0);
  }
  return v3;
}

- (void)setRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(CarDisplayWindow *)self rootViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = [(CarDisplayWindow *)self rootViewController];
    [v5 setNotificationLayoutGuide:0];
LABEL_4:
  }
  v7.receiver = self;
  v7.super_class = (Class)CarDisplayWindow;
  [(CarDisplayWindow *)&v7 setRootViewController:v4];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = +[CarDisplayController sharedInstance];
  unsigned int v6 = [v5 _shouldSendEvent:v4 toCarDisplayWindow:self];

  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v7 = self->_eventTaps;
    id v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) sendEvent:v4];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    v12.receiver = self;
    v12.super_class = (Class)CarDisplayWindow;
    [(CarDisplayWindow *)&v12 sendEvent:v4];
  }
}

- (void)registerEventTap:(id)a3
{
  id v4 = a3;
  eventTaps = self->_eventTaps;
  id v8 = v4;
  if (!eventTaps)
  {
    unsigned int v6 = +[NSHashTable weakObjectsHashTable];
    objc_super v7 = self->_eventTaps;
    self->_eventTaps = v6;

    id v4 = v8;
    eventTaps = self->_eventTaps;
  }
  [(NSHashTable *)eventTaps addObject:v4];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CarDisplayWindow;
  -[CarDisplayWindow setHidden:](&v12, "setHidden:");
  v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    objc_super v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarDisplayWindow *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    long long v14 = v11;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] setHidden:%d", buf, 0x12u);
  }
}

- (void)becomeKeyWindow
{
  v10.receiver = self;
  v10.super_class = (Class)CarDisplayWindow;
  [(CarDisplayWindow *)&v10 becomeKeyWindow];
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    unsigned int v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      objc_super v7 = [(CarDisplayWindow *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    objc_super v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] becomeKeyWindow", buf, 0xCu);
  }
}

- (void)resignKeyWindow
{
  v10.receiver = self;
  v10.super_class = (Class)CarDisplayWindow;
  [(CarDisplayWindow *)&v10 resignKeyWindow];
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    unsigned int v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      objc_super v7 = [(CarDisplayWindow *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    objc_super v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] resignKeyWindow", buf, 0xCu);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = sub_100015DB4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = [(CarDisplayWindow *)self traitCollection];
    *(_DWORD *)buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Car] Changing trait collection from %@ to %@", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)CarDisplayWindow;
  [(CarDisplayWindow *)&v7 traitCollectionDidChange:v4];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_101322D98);
}

- (void)notificationLayoutGuideDidChange
{
  BOOL v3 = [(CarDisplayWindow *)self rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(CarDisplayWindow *)self notificationLayoutGuide];
    v5 = [(CarDisplayWindow *)self rootViewController];
    [v5 setNotificationLayoutGuide:v6];
  }
}

- (void).cxx_destruct
{
}

@end