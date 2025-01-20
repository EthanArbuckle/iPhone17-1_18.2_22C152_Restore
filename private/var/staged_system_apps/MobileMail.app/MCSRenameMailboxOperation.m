@interface MCSRenameMailboxOperation
- (BOOL)allowOtherMailboxOperation:(id)a3;
- (BOOL)commit;
- (BOOL)revert;
- (MCSRenameMailboxOperation)initWithMailboxToRename:(id)a3 toName:(id)a4;
- (NSString)reasonForFailure;
- (id)accountForErrorHandling;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxParentForMove;
- (id)mailboxToMoveOrRename;
- (id)modifiedMailboxName;
- (void)setReasonForFailure:(id)a3;
@end

@implementation MCSRenameMailboxOperation

- (MCSRenameMailboxOperation)initWithMailboxToRename:(id)a3 toName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSRenameMailboxOperation;
  v9 = [(MCSRenameMailboxOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxToRename, a3);
    objc_storeStrong((id *)&v10->_pendingName, a4);
    *((unsigned char *)&v10->super.super + 8) |= 1u;
  }

  return v10;
}

- (BOOL)commit
{
  v3 = [(MFMailboxUid *)self->_mailboxToRename account];
  if (![v3 canMailboxBeRenamed:self->_mailboxToRename])
  {
    id v6 = 0;
    goto LABEL_5;
  }
  pendingName = self->_pendingName;
  id v17 = 0;
  unsigned int v5 = [v3 newMailboxNameIsAcceptable:pendingName reasonForFailure:&v17];
  id v6 = v17;
  if (!v5)
  {
LABEL_5:
    [(MCSRenameMailboxOperation *)self setReasonForFailure:v6];
    unsigned __int8 v15 = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc((Class)EMRenameMailboxChangeAction);
  id v8 = [(MFMailboxUid *)self->_mailboxToRename objectID];
  id v9 = [v7 initWithMailboxObjectID:v8 newName:self->_pendingName];

  v10 = +[UIApplication sharedApplication];
  v11 = [v10 daemonInterface];
  objc_super v12 = [v11 mailboxRepository];
  v13 = [v12 performMailboxChangeAction:v9];

  v14 = [v13 result:0];
  unsigned __int8 v15 = [v14 BOOLValue];

LABEL_6:
  return v15;
}

- (BOOL)revert
{
  return 1;
}

- (id)modifiedMailboxName
{
  return self->_pendingName;
}

- (id)mailboxToMoveOrRename
{
  return self->_mailboxToRename;
}

- (id)mailboxParentForMove
{
  return 0;
}

- (id)accountForErrorHandling
{
  return [(MFMailboxUid *)self->_mailboxToRename account];
}

- (id)localizedErrorDescription
{
  reasonForFailure = self->_reasonForFailure;
  if (reasonForFailure)
  {
    v3 = reasonForFailure;
  }
  else
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v4 localizedStringForKey:@"ERROR_RENAMING_MAILBOX_DESCRIPTION" value:&stru_100619928 table:@"Main"];
  }

  return v3;
}

- (id)localizedErrorTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_RENAMING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (BOOL)allowOtherMailboxOperation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (NSString)reasonForFailure
{
  return self->_reasonForFailure;
}

- (void)setReasonForFailure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForFailure, 0);
  objc_storeStrong((id *)&self->_pendingName, 0);

  objc_storeStrong((id *)&self->_mailboxToRename, 0);
}

@end