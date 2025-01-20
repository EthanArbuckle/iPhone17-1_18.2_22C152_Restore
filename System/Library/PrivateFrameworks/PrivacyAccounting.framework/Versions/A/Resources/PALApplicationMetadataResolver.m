@interface PALApplicationMetadataResolver
- (PAAggregateVisibilityStateMonitor)aggregateVisibilityStateMonitor;
- (PALApplicationMetadataResolver)initWithSettings:(id)a3;
- (PAProcessStateMonitoring)processStateMonitor;
- (id)bundleRecordForApplication:(id)a3;
- (id)bundleRecordRetriever;
- (id)resolveApplicationMetadataForAccess:(id)a3;
- (void)setBundleRecordRetriever:(id)a3;
- (void)setProcessStateMonitor:(id)a3;
@end

@implementation PALApplicationMetadataResolver

- (PALApplicationMetadataResolver)initWithSettings:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PALApplicationMetadataResolver;
  v6 = [(PALApplicationMetadataResolver *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    uint64_t v8 = PADefaultBundleRecordRetriever();
    id bundleRecordRetriever = v7->_bundleRecordRetriever;
    v7->_id bundleRecordRetriever = (id)v8;

    v10 = PASharedProcessStateMonitor();
    [(PALApplicationMetadataResolver *)v7 setProcessStateMonitor:v10];
  }
  return v7;
}

- (id)resolveApplicationMetadataForAccess:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessor];
  v6 = [(PALApplicationMetadataResolver *)self bundleRecordForApplication:v5];

  if ((id)[(PALSettings *)self->_settings accessFilteringPolicy] == (id)1
    && [v6 developerType] != 3)
  {
    v7 = sub_100002E50();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100003198();
    }
    goto LABEL_14;
  }
  v7 = [v4 accessor];
  if ([v7 identifierType] == (id)2)
  {
    uint64_t v8 = [v6 bundleIdentifier];

    if (v8)
    {
      v9 = [v6 bundleIdentifier];
      uint64_t v10 = +[PAApplication applicationWithBundleID:v9];

      v7 = v10;
      goto LABEL_6;
    }
    v13 = sub_100002E50();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100003070();
    }

LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
LABEL_6:
  v11 = sub_100002E50();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000030E8(v4, (uint64_t)v7, v11);
  }

  id v12 = [v4 copyWithNewAccessor:v7];
LABEL_15:

  return v12;
}

- (id)bundleRecordForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(PALApplicationMetadataResolver *)self bundleRecordRetriever];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (void)setProcessStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processStateMonitor, a3);
  id v8 = a3;
  id v5 = objc_alloc((Class)PAAggregateVisibilityStateMonitor);
  v6 = (PAAggregateVisibilityStateMonitor *)[v5 initWithRawMonitor:self->_processStateMonitor startupInterval:PADefaultAggregateStateMonitoringStartupInterval];
  aggregateVisibilityStateMonitor = self->_aggregateVisibilityStateMonitor;
  self->_aggregateVisibilityStateMonitor = v6;
}

- (id)bundleRecordRetriever
{
  return self->_bundleRecordRetriever;
}

- (void)setBundleRecordRetriever:(id)a3
{
}

- (PAProcessStateMonitoring)processStateMonitor
{
  return self->_processStateMonitor;
}

- (PAAggregateVisibilityStateMonitor)aggregateVisibilityStateMonitor
{
  return self->_aggregateVisibilityStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateVisibilityStateMonitor, 0);
  objc_storeStrong((id *)&self->_processStateMonitor, 0);
  objc_storeStrong(&self->_bundleRecordRetriever, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end