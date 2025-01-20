@interface NNMKMailboxSelectionChanges
- (NSArray)mailboxesToDisableSync;
- (NSArray)mailboxesToReSync;
- (NSArray)mailboxesToUpdate;
- (void)setMailboxesToDisableSync:(id)a3;
- (void)setMailboxesToReSync:(id)a3;
- (void)setMailboxesToUpdate:(id)a3;
@end

@implementation NNMKMailboxSelectionChanges

- (NSArray)mailboxesToUpdate
{
  return self->_mailboxesToUpdate;
}

- (void)setMailboxesToUpdate:(id)a3
{
}

- (NSArray)mailboxesToReSync
{
  return self->_mailboxesToReSync;
}

- (void)setMailboxesToReSync:(id)a3
{
}

- (NSArray)mailboxesToDisableSync
{
  return self->_mailboxesToDisableSync;
}

- (void)setMailboxesToDisableSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesToDisableSync, 0);
  objc_storeStrong((id *)&self->_mailboxesToReSync, 0);
  objc_storeStrong((id *)&self->_mailboxesToUpdate, 0);
}

@end