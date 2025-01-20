@interface APWebProcessMRAIDJSO
+ (BOOL)isURLValid:(id)a3;
+ (id)eventStringForEvent:(int64_t)a3;
+ (id)stateStringForState:(int64_t)a3;
- (APWebProcessMRAIDJSO)init;
- (APWebProcessMRAIDJSODelegate)delegate;
- (BOOL)hasFiredReadyEvent;
- (BOOL)isViewable;
- (BOOL)viewable;
- (CGSize)expandedSize;
- (CGSize)maximumExpandedSize;
- (NSMutableDictionary)listenersDictionary;
- (id)getExpandProperties;
- (id)getPlacementType;
- (id)getState;
- (id)getVersion;
- (int64_t)state;
- (os_unfair_lock_s)unfairLock;
- (unsigned)unfairLockOptions;
- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4;
- (void)_createCalendarEvent:(id)a3;
- (void)actionDidFailWithErrorDescription:(id)a3;
- (void)addEventListener:(id)a3 listener:(id)a4;
- (void)close;
- (void)expand:(id)a3;
- (void)lock;
- (void)open:(id)a3;
- (void)removeEventListener:(id)a3 listener:(id)a4;
- (void)resetVideoTagPlaytime;
- (void)setDelegate:(id)a3;
- (void)setExpandProperties:(id)a3;
- (void)setExpandedSize:(CGSize)a3;
- (void)setHasFiredReadyEvent:(BOOL)a3;
- (void)setListenersDictionary:(id)a3;
- (void)setMaximumExpandedSize:(CGSize)a3;
- (void)setState:(int64_t)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
- (void)setUnfairLockOptions:(unsigned int)a3;
- (void)setViewable:(BOOL)a3;
- (void)unlock;
- (void)useCustomClose:(BOOL)a3;
@end

@implementation APWebProcessMRAIDJSO

- (APWebProcessMRAIDJSO)init
{
  v6.receiver = self;
  v6.super_class = (Class)APWebProcessMRAIDJSO;
  v2 = [(APWebProcessMRAIDJSO *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    *((void *)v2 + 4) = 10002;
    *((CGSize *)v2 + 4) = CGSizeZero;
    *((_WORD *)v2 + 4) = 0;
    *(void *)(v2 + 12) = 0x1000000000000;
  }
  return (APWebProcessMRAIDJSO *)v2;
}

+ (id)eventStringForEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return &stru_10780;
  }
  else {
    return *(&off_10330 + a3);
  }
}

+ (id)stateStringForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 10000) > 5) {
    return &stru_10780;
  }
  else {
    return *(&off_10358 + a3 - 10000);
  }
}

+ (BOOL)isURLValid:(id)a3
{
  id v3 = a3;
  v4 = sub_3A98();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v11 = 138478083;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2113;
    id v14 = v3;
    id v5 = v12;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[%{private}@] Checking to see if URL is valid: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  objc_super v6 = [v3 scheme];
  unsigned __int8 v7 = [v6 isEqualToString:@"http"];
  if (v7) {
    goto LABEL_8;
  }
  v8 = [v3 scheme];
  unsigned __int8 v9 = [v8 isEqualToString:@"https"];

  if ((v9 & 1) == 0)
  {
    objc_super v6 = sub_3A98();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_9304();
    }
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v7 = 1;
LABEL_9:

  return v7;
}

- (void)setState:(int64_t)a3
{
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(id)objc_opt_class() stateStringForState:a3];
    *(_DWORD *)buf = 138478083;
    __int16 v13 = v6;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] Setting state to %{public}@", buf, 0x16u);
  }
  if (self->_state != a3)
  {
    self->_state = a3;
    unsigned __int8 v9 = [(APWebProcessMRAIDJSO *)self getState];
    int v11 = v9;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:2 withArguments:v10];

    if (a3 == 10001 && ![(APWebProcessMRAIDJSO *)self hasFiredReadyEvent])
    {
      [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:1 withArguments:0];
      [(APWebProcessMRAIDJSO *)self setHasFiredReadyEvent:1];
    }
  }
}

- (void)setViewable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = objc_opt_class();
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138478083;
    __int16 v13 = v6;
    __int16 v14 = 2114;
    CFStringRef v15 = v7;
    id v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] Setting viewable to %{public}@", buf, 0x16u);
  }
  if (self->_viewable != v3)
  {
    self->_viewable = v3;
    unsigned __int8 v9 = +[NSNumber numberWithBool:v3];
    int v11 = v9;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:3 withArguments:v10];
  }
}

- (void)actionDidFailWithErrorDescription:(id)a3
{
  id v4 = a3;
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_9398();
  }

  id v7 = v4;
  objc_super v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v6];
}

- (void)resetVideoTagPlaytime
{
  BOOL v3 = sub_3A98();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138477827;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{private}@] VideoTag Playtime has been reset.", (uint8_t *)&v5, 0xCu);
  }
  [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:4 withArguments:0];
}

- (void)close
{
  BOOL v3 = sub_3A98();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = (id)objc_opt_class();
    id v4 = v12;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{private}@] MRAID.close was called", buf, 0xCu);
  }
  if ((_UNKNOWN *)[(APWebProcessMRAIDJSO *)self state] == &unk_2713)
  {
    int v5 = [(APWebProcessMRAIDJSO *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v7 = [(APWebProcessMRAIDJSO *)self delegate];
    [v7 webProcessMRAIDJSODidCallClose];
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"Only creatives in the \"%@\" state may be closed.", @"expanded"];
    id v8 = sub_3A98();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9418();
    }

    v10[0] = v7;
    v10[1] = @"close";
    unsigned __int8 v9 = +[NSArray arrayWithObjects:v10 count:2];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v9];
  }
}

- (void)expand:(id)a3
{
  id v4 = a3;
  int v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = (id)objc_opt_class();
    id v6 = v21;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] MRAID.expand was called.", buf, 0xCu);
  }
  if ((_UNKNOWN *)[(APWebProcessMRAIDJSO *)self state] != &unk_2711)
  {
    id v7 = +[NSString stringWithFormat:@"Only creatives in the \"%@\" state may be expanded.", @"default"];
    __int16 v13 = sub_3A98();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_9418();
    }

    v19[0] = v7;
    v19[1] = @"expand";
    __int16 v14 = v19;
    goto LABEL_18;
  }
  if (!v4 || ![v4 length])
  {
    id v7 = +[NSString stringWithFormat:@"One-part creatives are not supported, %@ must be called with the URL parameter.", @"expand"];
    CFStringRef v15 = sub_3A98();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_9418();
    }

    v18[0] = v7;
    v18[1] = @"expand";
    __int16 v14 = v18;
    goto LABEL_18;
  }
  id v7 = +[NSURL URLWithString:v4];
  if (!+[APWebProcessMRAIDJSO isURLValid:v7])
  {
    v16 = sub_3A98();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_9498();
    }

    v17[0] = @"URL parameter not valid, only http and https schemes are supported.";
    v17[1] = @"expand";
    __int16 v14 = v17;
LABEL_18:
    v10 = +[NSArray arrayWithObjects:v14 count:2];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v10];
    goto LABEL_19;
  }
  id v8 = [(APWebProcessMRAIDJSO *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(APWebProcessMRAIDJSO *)self delegate];
    [(APWebProcessMRAIDJSO *)self maximumExpandedSize];
    double v12 = v11;
    [(APWebProcessMRAIDJSO *)self maximumExpandedSize];
    objc_msgSend(v10, "webProcessMRAIDJSODidCallExpand:withMaximumWidth:andHeight:", v7, v12);
LABEL_19:
  }
}

- (void)_createCalendarEvent:(id)a3
{
  id v4 = a3;
  int v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138478083;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] Create Calendar Event was called: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [(APWebProcessMRAIDJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(APWebProcessMRAIDJSO *)self delegate];
    [v9 webProcessMRAIDJSODidCallCreateCalendarEvent:v4];
  }
}

- (id)getExpandProperties
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if ((_UNKNOWN *)[(APWebProcessMRAIDJSO *)self state] == &unk_2713)
  {
    [(APWebProcessMRAIDJSO *)self expandedSize];
    double v5 = v4;
  }
  else
  {
    id v6 = +[UIScreen mainScreen];
    [v6 bounds];
    double v8 = v7;

    [(APWebProcessMRAIDJSO *)self maximumExpandedSize];
    if (v9 > v8 || v9 == 0.0) {
      double v5 = v8;
    }
    else {
      double v5 = v9;
    }
  }
  id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"width"];

  __int16 v12 = +[NSNumber numberWithDouble:v5];
  [v3 setObject:v12 forKeyedSubscript:@"height"];

  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"useCustomClose"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isModal"];
  id v13 = sub_3A98();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v17 = 138478083;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v3;
    id v14 = v18;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[%{private}@] Expand Properties: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v15 = [v3 copy];

  return v15;
}

- (id)getPlacementType
{
  return @"inline";
}

- (id)getState
{
  int64_t v2 = [(APWebProcessMRAIDJSO *)self state];

  return +[APWebProcessMRAIDJSO stateStringForState:v2];
}

- (id)getVersion
{
  return @"1.0";
}

- (BOOL)isViewable
{
  id v3 = sub_3A98();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = objc_opt_class();
    id v5 = v4;
    unsigned int v6 = [(APWebProcessMRAIDJSO *)self viewable];
    CFStringRef v7 = @"not ";
    if (v6) {
      CFStringRef v7 = &stru_10780;
    }
    int v9 = 138478083;
    int v10 = v4;
    __int16 v11 = 2114;
    CFStringRef v12 = v7;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{private}@] The WebProcess is %{public}@viewable", (uint8_t *)&v9, 0x16u);
  }
  return [(APWebProcessMRAIDJSO *)self viewable];
}

- (void)open:(id)a3
{
  id v4 = a3;
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v4;
    id v6 = v17;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] MRAID.open was called with URL: %{public}@", buf, 0x16u);
  }
  if (!v4 || ![v4 length])
  {
    CFStringRef v7 = +[NSString stringWithFormat:@"%@ must be called with the URL parameter.", @"open"];
    __int16 v11 = sub_3A98();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_9418();
    }

    v15[0] = v7;
    v15[1] = @"open";
    CFStringRef v12 = v15;
    goto LABEL_14;
  }
  CFStringRef v7 = +[NSURL URLWithString:v4];
  if (!+[APWebProcessMRAIDJSO isURLValid:v7])
  {
    id v13 = sub_3A98();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_9518();
    }

    v14[0] = @"URL parameter not valid, only http and https schemes are supported.";
    v14[1] = @"open";
    CFStringRef v12 = v14;
LABEL_14:
    int v10 = +[NSArray arrayWithObjects:v12 count:2];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v10];
    goto LABEL_15;
  }
  double v8 = [(APWebProcessMRAIDJSO *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(APWebProcessMRAIDJSO *)self delegate];
    [v10 webProcessMRAIDJSODidCallOpen:v7];
LABEL_15:
  }
}

- (void)setExpandProperties:(id)a3
{
  id v4 = a3;
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2114;
    id v25 = v4;
    id v6 = v23;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] Setting expand properties to %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    if ((_UNKNOWN *)[(APWebProcessMRAIDJSO *)self state] == &unk_2713)
    {
      CFStringRef v7 = sub_3A98();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_9620();
      }

      v21[0] = @"Expand properties can only be set before the ad is expanded.";
      v21[1] = @"setExpandProperties";
      double v8 = +[NSArray arrayWithObjects:v21 count:2];
      [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v8];
    }
    else
    {
      [(APWebProcessMRAIDJSO *)self maximumExpandedSize];
      double v10 = v9;
      double v12 = v11;
      id v13 = [v4 objectForKeyedSubscript:@"width"];
      double v8 = v13;
      if (v13) {
        double v10 = (double)(uint64_t)[v13 integerValue];
      }
      id v14 = [v4 objectForKeyedSubscript:@"height"];
      id v15 = v14;
      if (v14) {
        double v12 = (double)(uint64_t)[v14 integerValue];
      }
      -[APWebProcessMRAIDJSO setMaximumExpandedSize:](self, "setMaximumExpandedSize:", v10, v12);
      v16 = [v4 objectForKeyedSubscript:@"useCustomClose"];
      unsigned int v17 = [v16 BOOLValue];

      if (v17)
      {
        __int16 v18 = sub_3A98();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_96B0();
        }

        v20[0] = @"Using a custom close indicator is not supported.";
        v20[1] = @"setExpandProperties";
        id v19 = +[NSArray arrayWithObjects:v20 count:2];
        [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v19];
      }
    }
  }
  else
  {
    double v8 = sub_3A98();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9598();
    }
  }
}

- (void)useCustomClose:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_3A98();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_opt_class();
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138478083;
    id v13 = v6;
    __int16 v14 = 2114;
    CFStringRef v15 = v7;
    id v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{private}@] Attempting to use custom close: %{public}@", buf, 0x16u);
  }
  if (v3)
  {
    double v9 = sub_3A98();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_96B0();
    }

    v11[0] = @"Using a custom close indicator is not supported.";
    v11[1] = @"useCustomClose";
    double v10 = +[NSArray arrayWithObjects:v11 count:2];
    [(APWebProcessMRAIDJSO *)self _callListenersOfEvent:0 withArguments:v10];
  }
}

- (void)addEventListener:(id)a3 listener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_3A98();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v14 = 138478083;
    *(void *)&v14[4] = objc_opt_class();
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v6;
    id v9 = *(id *)&v14[4];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[%{private}@] Adding event listener of type: %{public}@", v14, 0x16u);
  }
  id v10 = [v6 length];
  if (v7 && v10)
  {
    [(APWebProcessMRAIDJSO *)self lock];
    double v11 = [(APWebProcessMRAIDJSO *)self listenersDictionary];
    double v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      double v12 = +[NSMutableArray array];
      id v13 = [(APWebProcessMRAIDJSO *)self listenersDictionary];
      [v13 setObject:v12 forKey:v6];
    }
    if ((objc_msgSend(v12, "containsObject:", v7, *(_OWORD *)v14, *(void *)&v14[16]) & 1) == 0) {
      [v12 addObject:v7];
    }
    [(APWebProcessMRAIDJSO *)self unlock];
  }
}

- (void)removeEventListener:(id)a3 listener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_3A98();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138478083;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v6;
    id v9 = v14;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[%{private}@] Removing event listener of type: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if (v6)
  {
    id v10 = [v6 length];
    if (v7)
    {
      if (v10)
      {
        [(APWebProcessMRAIDJSO *)self lock];
        double v11 = [(APWebProcessMRAIDJSO *)self listenersDictionary];
        double v12 = [v11 objectForKeyedSubscript:v6];
        [v12 removeObject:v7];

        [(APWebProcessMRAIDJSO *)self unlock];
      }
    }
  }
}

- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4
{
  id v6 = a4;
  id v7 = sub_3A98();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [(id)objc_opt_class() eventStringForEvent:a3];
    *(_DWORD *)buf = 138478339;
    v28 = v8;
    __int16 v29 = 2114;
    v30 = v10;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[%{private}@] Calling listeners of event %{public}@ with arguments %{public}@", buf, 0x20u);
  }
  double v11 = +[APWebProcessMRAIDJSO eventStringForEvent:a3];
  [(APWebProcessMRAIDJSO *)self lock];
  double v12 = [(APWebProcessMRAIDJSO *)self listenersDictionary];
  int v13 = [v12 objectForKeyedSubscript:v11];
  id v14 = [v13 copy];

  [(APWebProcessMRAIDJSO *)self unlock];
  if (v6) {
    +[NSArray arrayWithArray:v6];
  }
  else {
  __int16 v15 = +[NSArray array];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "callWithArguments:", v15, (void)v22);
      }
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (APWebProcessMRAIDJSODelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APWebProcessMRAIDJSODelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)viewable
{
  return self->_viewable;
}

- (CGSize)expandedSize
{
  double width = self->_expandedSize.width;
  double height = self->_expandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExpandedSize:(CGSize)a3
{
  self->_expandedSize = a3;
}

- (NSMutableDictionary)listenersDictionary
{
  return self->_listenersDictionary;
}

- (void)setListenersDictionary:(id)a3
{
}

- (BOOL)hasFiredReadyEvent
{
  return self->_hasFiredReadyEvent;
}

- (void)setHasFiredReadyEvent:(BOOL)a3
{
  self->_hasFiredReadyEvent = a3;
}

- (CGSize)maximumExpandedSize
{
  double width = self->_maximumExpandedSize.width;
  double height = self->_maximumExpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumExpandedSize:(CGSize)a3
{
  self->_maximumExpandedSize = a3;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (unsigned)unfairLockOptions
{
  return self->_unfairLockOptions;
}

- (void)setUnfairLockOptions:(unsigned int)a3
{
  self->_unfairLockOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenersDictionary, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end