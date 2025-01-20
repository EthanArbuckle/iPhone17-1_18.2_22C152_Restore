@interface NFHostCardEmulationManager
- (NFHostCardEmulationManager)init;
@end

@implementation NFHostCardEmulationManager

- (NFHostCardEmulationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NFHostCardEmulationManager;
  v2 = [(NFHostCardEmulationManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = v2->_sessions;
    v2->_sessions = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    apduLog = v2->_apduLog;
    v2->_apduLog = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apduLog, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end