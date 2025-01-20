@interface BKUISensorClient
- (void)dealloc;
@end

@implementation BKUISensorClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deathWatcher, 0);
  objc_storeStrong((id *)&self->_modeToRestoreAfterEstimatedProx, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

- (void)dealloc
{
  [(BSProcessDeathWatcher *)self->_deathWatcher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKUISensorClient;
  [(BKUISensorClient *)&v3 dealloc];
}

@end