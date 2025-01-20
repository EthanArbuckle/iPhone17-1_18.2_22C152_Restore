@interface PPXPCNamedEntityStoreQueryMonitorSession
- (PPXPCNamedEntityStoreQueryMonitorSession)initWithMonitoringHelper:(id)a3;
- (id)lastCallDate;
- (id)monitoringHelper;
- (void)setLastCallDate;
@end

@implementation PPXPCNamedEntityStoreQueryMonitorSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallDate, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

- (id)monitoringHelper
{
  return self->_monitoringHelper;
}

- (void)setLastCallDate
{
  self->_lastCallDate = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-10.0];
  MEMORY[0x1F41817F8]();
}

- (id)lastCallDate
{
  return self->_lastCallDate;
}

- (PPXPCNamedEntityStoreQueryMonitorSession)initWithMonitoringHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPXPCNamedEntityStoreQueryMonitorSession;
  v6 = [(PPXPCNamedEntityStoreQueryMonitorSession *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monitoringHelper, a3);
    [(PPXPCNamedEntityStoreQueryMonitorSession *)v7 setLastCallDate];
  }

  return v7;
}

@end