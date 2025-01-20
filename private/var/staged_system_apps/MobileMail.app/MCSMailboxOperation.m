@interface MCSMailboxOperation
- (BOOL)allowOtherMailboxOperation:(id)a3;
- (BOOL)commit;
- (BOOL)revert;
- (id)accountForErrorHandling;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxParentForMove;
- (id)mailboxToMoveOrRename;
- (id)mailboxToRemove;
- (id)modifiedMailboxName;
@end

@implementation MCSMailboxOperation

- (id)applyPendingChangeToObjects:(id)a3
{
  return 0;
}

- (BOOL)commit
{
}

- (BOOL)revert
{
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

- (id)accountForErrorHandling
{
  return 0;
}

- (id)localizedErrorDescription
{
}

- (id)localizedErrorTitle
{
}

- (BOOL)allowOtherMailboxOperation:(id)a3
{
  return 1;
}

@end