@interface PXCMMInvitationsIsNewMonitor
+ (PXCMMInvitationsIsNewMonitor)sharedMonitor;
- (BOOL)invitationIsNew:(id)a3;
- (PXCMMInvitationsIsNewMonitor)init;
- (void)_lastExitedDateDidChange:(id)a3;
- (void)_updateLastExitedDate;
@end

@implementation PXCMMInvitationsIsNewMonitor

- (void).cxx_destruct
{
}

- (void)_lastExitedDateDidChange:(id)a3
{
  [(PXCMMInvitationsIsNewMonitor *)self _updateLastExitedDate];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"PXCMMInvitationsIsNewMonitorDidChangeNotification" object:self];
}

- (void)_updateLastExitedDate
{
  PXForYouLastExitedDate();
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastExitedForYouDate = self->_lastExitedForYouDate;
  self->_lastExitedForYouDate = v3;
}

- (BOOL)invitationIsNew:(id)a3
{
  id v4 = a3;
  v5 = +[PXCompleteMyMomentSettings sharedInstance];
  char v6 = [v5 simulateAllMomentSharesAreNew];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else if ([v4 shareType] == 1)
  {
    v8 = [v4 creationDate];
    v9 = v8;
    if (v8) {
      BOOL v7 = [v8 compare:self->_lastExitedForYouDate] == 1;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PXCMMInvitationsIsNewMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMInvitationsIsNewMonitor;
  v2 = [(PXCMMInvitationsIsNewMonitor *)&v7 init];
  if (v2)
  {
    uint64_t v3 = PXForYouLastExitedDate();
    lastExitedForYouDate = v2->_lastExitedForYouDate;
    v2->_lastExitedForYouDate = (NSDate *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__lastExitedDateDidChange_ name:@"PXForYouLastExitedDateChangeNotification" object:0];

    [(PXCMMInvitationsIsNewMonitor *)v2 _updateLastExitedDate];
  }
  return v2;
}

+ (PXCMMInvitationsIsNewMonitor)sharedMonitor
{
  if (sharedMonitor_predicate != -1) {
    dispatch_once(&sharedMonitor_predicate, &__block_literal_global_92876);
  }
  v2 = (void *)sharedMonitor__sharedMonitor;
  return (PXCMMInvitationsIsNewMonitor *)v2;
}

void __45__PXCMMInvitationsIsNewMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(PXCMMInvitationsIsNewMonitor);
  v1 = (void *)sharedMonitor__sharedMonitor;
  sharedMonitor__sharedMonitor = (uint64_t)v0;
}

@end