@interface _BCTransactionCommitRollbackPair
- (id)commit;
- (id)rollback;
- (void)setCommit:(id)a3;
- (void)setRollback:(id)a3;
@end

@implementation _BCTransactionCommitRollbackPair

- (id)commit
{
  return self->_commit;
}

- (void)setCommit:(id)a3
{
}

- (id)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rollback, 0);

  objc_storeStrong(&self->_commit, 0);
}

@end