@interface SBTransaction
- (SBTransaction)init;
- (id)queue;
@end

@implementation SBTransaction

- (id)queue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (SBTransaction)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBTransaction;
  v2 = [(SBTransaction *)&v5 init];
  if (v2)
  {
    id v3 = SBLogTransaction();
    [(SBTransaction *)v2 _addDebugLogCategory:v3];

    [(SBTransaction *)v2 setAuditHistoryEnabled:1];
  }
  return v2;
}

@end