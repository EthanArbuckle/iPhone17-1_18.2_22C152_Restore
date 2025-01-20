@interface MCSDeleteMailboxOperation
- (BOOL)commit;
- (BOOL)revert;
- (MCSDeleteMailboxOperation)initWithMailboxToDelete:(id)a3;
- (id)accountForErrorHandling;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxToRemove;
@end

@implementation MCSDeleteMailboxOperation

- (MCSDeleteMailboxOperation)initWithMailboxToDelete:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCSDeleteMailboxOperation;
  v6 = [(MCSDeleteMailboxOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxToDelete, a3);
    *((unsigned char *)&v7->super.super + 8) |= 1u;
  }

  return v7;
}

- (BOOL)commit
{
  v3 = [(MFMailboxUid *)self->_mailboxToDelete account];
  if ([v3 canMailboxBeDeleted:self->_mailboxToDelete])
  {
    id v4 = objc_alloc((Class)EMDeleteMailboxChangeAction);
    id v5 = [(MFMailboxUid *)self->_mailboxToDelete objectID];
    id v6 = [v4 initWithMailboxObjectID:v5];

    v7 = +[UIApplication sharedApplication];
    v8 = [v7 daemonInterface];
    objc_super v9 = [v8 mailboxRepository];
    v10 = [v9 performMailboxChangeAction:v6];

    v11 = [v10 result:0];
    unsigned __int8 v12 = [v11 BOOLValue];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)revert
{
  return 1;
}

- (id)mailboxToRemove
{
  return self->_mailboxToDelete;
}

- (id)accountForErrorHandling
{
  return [(MFMailboxUid *)self->_mailboxToDelete account];
}

- (id)localizedErrorDescription
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_DELETING_MAILBOX_DESCRIPTION" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)localizedErrorTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_DELETING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (void).cxx_destruct
{
}

@end