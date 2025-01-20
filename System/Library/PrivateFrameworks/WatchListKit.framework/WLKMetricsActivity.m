@interface WLKMetricsActivity
- (OS_nw_activity)activity;
- (WLKMetricsActivity)initWithLabel:(unsigned int)a3;
- (unsigned)label;
- (void)finish:(id)a3;
@end

@implementation WLKMetricsActivity

- (void)finish:(id)a3
{
  id v3 = a3;
  if ((nw_activity_is_activated() & 1) == 0)
  {
    v4 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[WLKMetricsActivity finish:](v4);
    }
    goto LABEL_7;
  }
  if (nw_activity_is_complete())
  {
    v4 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[WLKMetricsActivity finish:](v4);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v3)
  {
    [v3 code];
    nw_activity_complete_with_reason_and_underlying_error();
  }
  else
  {
    nw_activity_complete_with_reason();
  }
LABEL_8:
}

- (OS_nw_activity)activity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

- (WLKMetricsActivity)initWithLabel:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WLKMetricsActivity;
  v4 = [(WLKMetricsActivity *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_label = a3;
    uint64_t v6 = nw_activity_create();
    activity = v5->_activity;
    v5->_activity = (OS_nw_activity *)v6;

    nw_activity_activate();
  }
  return v5;
}

- (unsigned)label
{
  return self->_label;
}

- (void)finish:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA2E8000, log, OS_LOG_TYPE_ERROR, "WLKMetricsActivity - activity already completed.", v1, 2u);
}

- (void)finish:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BA2E8000, log, OS_LOG_TYPE_ERROR, "WLKMetricsActivity - activity not activated.", v1, 2u);
}

@end