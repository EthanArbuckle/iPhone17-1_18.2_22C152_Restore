@interface EventSourceWindow
+ (BOOL)_supportsCallstackSymbolLog;
- (EventSourceWindow)initWithContentRect:(CGRect)a3;
- (EventSourceWindow)initWithWindowScene:(id)a3;
- (double)keyboardHeight;
- (void)_commonUpdate;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_updateAnalyticsState;
- (void)registerEventTap:(id)a3;
- (void)sendEvent:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EventSourceWindow

- (EventSourceWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EventSourceWindow;
  v3 = [(EventSourceWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3) {
    [(EventSourceWindow *)v3 _commonUpdate];
  }
  return v4;
}

- (void)_updateAnalyticsState
{
  id v4 = [(EventSourceWindow *)self traitCollection];
  BOOL v2 = [v4 userInterfaceStyle] == (id)2;
  v3 = +[GEOAPSharedStateData sharedData];
  [v3 setDeviceInDarkMode:v2];
}

- (void)_commonUpdate
{
  if (sub_1000BBB44(self) != 5)
  {
    v3 = [(EventSourceWindow *)self theme];
    id v4 = [v3 keyColor];
    [(EventSourceWindow *)self setTintColor:v4];
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  [(EventSourceWindow *)self _updateAnalyticsState];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [(EventSourceWindow *)self traitCollection];
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Phone] Changing trait collection from %@ to %@", buf, 0x16u);
  }
  v11.receiver = self;
  v11.super_class = (Class)EventSourceWindow;
  [(EventSourceWindow *)&v11 traitCollectionDidChange:v4];
  id v7 = [v4 userInterfaceStyle];
  v8 = [(EventSourceWindow *)self traitCollection];
  id v9 = [v8 userInterfaceStyle];

  if (v7 != v9)
  {
    [(EventSourceWindow *)self _commonUpdate];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"MapsWindowUserInterfaceStyleDidChangeNotification" object:0];
  }
}

- (EventSourceWindow)initWithContentRect:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EventSourceWindow;
  v3 = -[EventSourceWindow initWithContentRect:](&v6, "initWithContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(EventSourceWindow *)v3 _commonUpdate];
  }
  return v4;
}

- (void)_keyboardDidShow:(id)a3
{
  p_keyboardFrame = &self->_keyboardFrame;
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  p_keyboardFrame->origin.x = v5;
  p_keyboardFrame->origin.y = v6;
  p_keyboardFrame->size.width = v7;
  p_keyboardFrame->size.height = v8;
}

- (void)_keyboardWillHide:(id)a3
{
  CGSize size = CGRectZero.size;
  self->_keyboardFrame.origin = CGRectZero.origin;
  self->_keyboardFrame.CGSize size = size;
}

- (double)keyboardHeight
{
  return CGRectGetHeight(self->_keyboardFrame);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EventSourceWindow;
  -[EventSourceWindow setHidden:](&v20, "setHidden:");
  CGFloat v5 = sub_1000C49B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CGFloat v6 = self;
    if (!v6)
    {
      objc_super v11 = @"<nil>";
      goto LABEL_10;
    }
    CGFloat v7 = (objc_class *)objc_opt_class();
    CGFloat v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(EventSourceWindow *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        objc_super v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    objc_super v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 1024;
    LODWORD(v24) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Updating hidden: %d", buf, 0x12u);
  }
  if (v3 && [(id)objc_opt_class() _supportsCallstackSymbolLog])
  {
    v12 = sub_1000C49B4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:

      return;
    }
    id v13 = self;
    if (!v13)
    {
      v18 = @"<nil>";
      goto LABEL_23;
    }
    __int16 v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(EventSourceWindow *)v13 performSelector:"accessibilityIdentifier"];
      v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_20;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_20:

LABEL_23:
    v19 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138543618;
    v22 = v18;
    __int16 v23 = 2112;
    v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] %@", buf, 0x16u);

    goto LABEL_24;
  }
}

+ (BOOL)_supportsCallstackSymbolLog
{
  BOOL v2 = sub_1000C49B4();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  return v3;
}

- (void)registerEventTap:(id)a3
{
  id v4 = a3;
  eventTaps = self->_eventTaps;
  id v8 = v4;
  if (!eventTaps)
  {
    CGFloat v6 = +[NSHashTable weakObjectsHashTable];
    CGFloat v7 = self->_eventTaps;
    self->_eventTaps = v6;

    id v4 = v8;
    eventTaps = self->_eventTaps;
  }
  [(NSHashTable *)eventTaps addObject:v4];
  self->_hasEventTaps = 1;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if (self->_hasEventTaps)
  {
    if ([(NSHashTable *)self->_eventTaps count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      CGFloat v5 = self->_eventTaps;
      id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) sendEvent:v4];
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
    else
    {
      self->_hasEventTaps = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EventSourceWindow;
  [(EventSourceWindow *)&v10 sendEvent:v4];
}

- (void).cxx_destruct
{
}

@end