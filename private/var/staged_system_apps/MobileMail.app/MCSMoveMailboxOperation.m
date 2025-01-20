@interface MCSMoveMailboxOperation
- (BOOL)commit;
- (BOOL)revert;
- (MCSMoveMailboxOperation)initWithMailboxToMove:(id)a3 toParent:(id)a4;
- (id)accountForErrorHandling;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxParentForMove;
- (id)mailboxToMoveOrRename;
@end

@implementation MCSMoveMailboxOperation

- (MCSMoveMailboxOperation)initWithMailboxToMove:(id)a3 toParent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSMoveMailboxOperation;
  v9 = [(MCSMoveMailboxOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxToMove, a3);
    objc_storeStrong((id *)&v10->_parentMailbox, a4);
    *((unsigned char *)&v10->super.super + 8) |= 1u;
  }

  return v10;
}

- (BOOL)commit
{
  v3 = [(MFMailboxUid *)self->_mailboxToMove account];
  v4 = [(MFMailboxUid *)self->_parentMailbox account];
  if (v3 == v4)
  {
    id v6 = objc_alloc((Class)EMMoveMailboxChangeAction);
    id v7 = [(MFMailboxUid *)self->_mailboxToMove objectID];
    id v8 = [(MFMailboxUid *)self->_parentMailbox objectID];
    id v9 = [v6 initWithMailboxObjectID:v7 newParentMailboxID:v8];

    v10 = +[UIApplication sharedApplication];
    v11 = [v10 daemonInterface];
    objc_super v12 = [v11 mailboxRepository];
    v13 = [v12 performMailboxChangeAction:v9];

    v14 = [v13 result:0];
    unsigned __int8 v5 = [v14 BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)revert
{
  return 1;
}

- (id)mailboxToMoveOrRename
{
  return self->_mailboxToMove;
}

- (id)mailboxParentForMove
{
  return self->_parentMailbox;
}

- (id)accountForErrorHandling
{
  return [(MFMailboxUid *)self->_mailboxToMove account];
}

- (id)localizedErrorDescription
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_MOVING_MAILBOX_DESCRIPTION" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)localizedErrorTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_MOVING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMailbox, 0);

  objc_storeStrong((id *)&self->_mailboxToMove, 0);
}

@end