@interface AnalyticsMonitor
- (AnalyticsMonitor)init;
- (void)processNotification:(id)a3;
@end

@implementation AnalyticsMonitor

- (AnalyticsMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)AnalyticsMonitor;
  v2 = [(AnalyticsMonitor *)&v10 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"processNotification:" name:@"ContainerWillChangeStyleNotification" object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"processNotification:" name:@"ContainerDidChangeStyleNotification" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"processNotification:" name:@"ContainerWillChangeLayoutNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"processNotification:" name:@"ContainerDidChangeLayoutNotification" object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"processNotification:" name:@"ContainerWillPresentContaineeNotification" object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"processNotification:" name:@"ContainerWillResignContaineeNotification" object:0];

    *(_OWORD *)(v2 + 8) = xmmword_100F6F050;
  }
  return (AnalyticsMonitor *)v2;
}

- (void)processNotification:(id)a3
{
  id v28 = a3;
  v4 = [v28 object];
  if (v4)
  {
    v5 = [v28 object];
    unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___ContainerProtocol];

    if (v6)
    {
      v4 = [v28 object];
    }
    else
    {
      v4 = 0;
    }
  }
  v7 = [v28 name];
  unsigned int v8 = [v7 isEqualToString:@"ContainerDidChangeLayoutNotification"];

  if (v8)
  {
    v9 = [v28 userInfo];
    objc_super v10 = [v9 objectForKeyedSubscript:@"ContainerLayout"];
    self->_unint64_t containeeLayout = (unint64_t)[v10 integerValue];
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v11 = [v28 name];
  unsigned int v12 = [v11 isEqualToString:@"ContainerDidChangeStyleNotification"];

  if (v12)
  {
    v9 = [v28 userInfo];
    objc_super v10 = [v9 objectForKeyedSubscript:@"ContainerStyle"];
    self->_containerStyle = (unint64_t)[v10 integerValue];
    goto LABEL_9;
  }
  v13 = [v28 name];
  unsigned int v14 = [v13 isEqualToString:@"ContainerWillChangeLayoutNotification"];

  if (v14)
  {
    v15 = [v28 userInfo];
    v16 = [v15 objectForKeyedSubscript:@"ContainerUpdateSource"];
    id v17 = [v16 unsignedIntegerValue];

    unint64_t containeeLayout = self->_containeeLayout;
    v19 = [v28 userInfo];
    v20 = [v19 objectForKeyedSubscript:@"ContainerLayout"];
    id v21 = [v20 integerValue];

    v22 = [v28 userInfo];
    v9 = [v22 objectForKeyedSubscript:@"ContainerContainee"];

    if ((unint64_t)v21 > containeeLayout) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2 * ((unint64_t)v21 < containeeLayout);
    }
    if (v21 == (id)containeeLayout || v17 != (id)1) {
      goto LABEL_10;
    }
    if ([v9 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate])
    {
      id v24 = v9;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v25 = [v9 contentViewController];
        if ([v25 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate]) {
          id v26 = v25;
        }
        else {
          id v26 = 0;
        }

        if (v26) {
          goto LABEL_28;
        }
        goto LABEL_31;
      }
      if (![v4 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate]) {
        goto LABEL_31;
      }
      id v24 = v4;
    }
    id v26 = v24;
    if (v24)
    {
LABEL_28:
      id v27 = [v26 currentUITargetForAnalytics];

LABEL_32:
      +[GEOAPPortal captureUserAction:v23 target:v27 value:0];
      goto LABEL_10;
    }
LABEL_31:
    id v27 = 0;
    goto LABEL_32;
  }
LABEL_11:
}

@end