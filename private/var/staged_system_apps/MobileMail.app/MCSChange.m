@interface MCSChange
- (BOOL)allowOtherChange:(id)a3;
- (BOOL)commit;
- (BOOL)isFinalized;
- (NSSet)messagesSet;
- (id)accounts;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)invocation;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxParentForMove;
- (id)mailboxToMoveOrRename;
- (id)mailboxToRemove;
- (id)modifiedMailboxName;
- (id)stores;
- (void)setInvocation:(id)a3;
@end

@implementation MCSChange

- (id)applyPendingChangeToObjects:(id)a3
{
  id v5 = a3;
  [(MCSChange *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MCSChange applyPendingChangeToObjects:]", "MCSChange.m", 17, "0");
}

- (BOOL)commit
{
}

- (BOOL)allowOtherChange:(id)a3
{
  return 1;
}

- (id)stores
{
}

- (id)accounts
{
}

- (id)localizedErrorDescription
{
}

- (id)localizedErrorTitle
{
}

- (NSSet)messagesSet
{
  return 0;
}

- (id)mailboxToRemove
{
  return 0;
}

- (id)modifiedMailboxName
{
  return 0;
}

- (id)mailboxToMoveOrRename
{
  return 0;
}

- (id)mailboxParentForMove
{
  return 0;
}

- (BOOL)isFinalized
{
  return *((unsigned char *)self + 16) & 1;
}

- (id)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end