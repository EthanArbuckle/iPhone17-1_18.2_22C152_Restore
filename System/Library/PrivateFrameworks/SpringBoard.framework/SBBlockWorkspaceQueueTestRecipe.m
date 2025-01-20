@interface SBBlockWorkspaceQueueTestRecipe
- (FBWorkspaceEventQueueLock)queueLock;
- (NSTimer)blockTimer;
- (id)title;
- (void)blockTimerDidFire:(id)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)setBlockTimer:(id)a3;
- (void)setQueueLock:(id)a3;
@end

@implementation SBBlockWorkspaceQueueTestRecipe

- (id)title
{
  return @"Block workspace queue for 2 seconds";
}

- (void)handleVolumeIncrease
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F624E8]) initWithReason:@"Test Recipe"];
  v3 = [(SBBlockWorkspaceQueueTestRecipe *)self queueLock];
  [v3 relinquish];

  [(SBBlockWorkspaceQueueTestRecipe *)self setQueueLock:v6];
  v4 = [(SBBlockWorkspaceQueueTestRecipe *)self blockTimer];
  [v4 invalidate];

  v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_blockTimerDidFire_ selector:0 userInfo:0 repeats:2.0];
  [(SBBlockWorkspaceQueueTestRecipe *)self setBlockTimer:v5];
}

- (void)blockTimerDidFire:(id)a3
{
  v4 = [(SBBlockWorkspaceQueueTestRecipe *)self queueLock];
  [v4 relinquish];

  [(SBBlockWorkspaceQueueTestRecipe *)self setQueueLock:0];
  v5 = [(SBBlockWorkspaceQueueTestRecipe *)self blockTimer];
  [v5 invalidate];

  [(SBBlockWorkspaceQueueTestRecipe *)self setBlockTimer:0];
}

- (void)handleVolumeDecrease
{
  id v2 = [(SBBlockWorkspaceQueueTestRecipe *)self blockTimer];
  [v2 fire];
}

- (NSTimer)blockTimer
{
  return self->_blockTimer;
}

- (void)setBlockTimer:(id)a3
{
}

- (FBWorkspaceEventQueueLock)queueLock
{
  return self->_queueLock;
}

- (void)setQueueLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);
}

@end