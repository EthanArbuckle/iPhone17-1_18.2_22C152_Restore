@interface MCSCreateMailboxOperation
- (BOOL)commit;
- (BOOL)revert;
- (MCSCreateMailboxOperation)initWithName:(id)a3 parentMailbox:(id)a4;
- (NSString)reasonForFailure;
- (id)accountForErrorHandling;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (void)setReasonForFailure:(id)a3;
@end

@implementation MCSCreateMailboxOperation

- (MCSCreateMailboxOperation)initWithName:(id)a3 parentMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCSCreateMailboxOperation;
  v8 = [(MCSCreateMailboxOperation *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    pendingName = v8->_pendingName;
    v8->_pendingName = v9;

    objc_storeStrong((id *)&v8->_parentMailbox, a4);
    *((unsigned char *)&v8->super.super + 8) |= 1u;
  }

  return v8;
}

- (BOOL)commit
{
  v3 = [(MFMailboxUid *)self->_parentMailbox account];
  if (![v3 canCreateNewMailboxes])
  {
    id v6 = 0;
    goto LABEL_5;
  }
  pendingName = self->_pendingName;
  id v18 = 0;
  unsigned int v5 = [v3 newMailboxNameIsAcceptable:pendingName reasonForFailure:&v18];
  id v6 = v18;
  if (!v5)
  {
LABEL_5:
    [(MCSCreateMailboxOperation *)self setReasonForFailure:v6];
    unsigned __int8 v16 = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc((Class)EMCreateMailboxChangeAction);
  v8 = self->_pendingName;
  v9 = [(MFMailboxUid *)self->_parentMailbox objectID];
  id v10 = [v7 initWithMailboxName:v8 parentMailboxID:v9];

  v11 = +[UIApplication sharedApplication];
  objc_super v12 = [v11 daemonInterface];
  v13 = [v12 mailboxRepository];
  v14 = [v13 performMailboxChangeAction:v10];

  v15 = [v14 result:0];
  unsigned __int8 v16 = [v15 BOOLValue];

LABEL_6:
  return v16;
}

- (BOOL)revert
{
  return 1;
}

- (id)accountForErrorHandling
{
  return [(MFMailboxUid *)self->_parentMailbox account];
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
    v3 = [v4 localizedStringForKey:@"ERROR_CREATING_MAILBOX_DESCRIPTION" value:&stru_100619928 table:@"Main"];
  }

  return v3;
}

- (id)localizedErrorTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ERROR_CREATING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
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
  objc_storeStrong((id *)&self->_parentMailbox, 0);

  objc_storeStrong((id *)&self->_pendingName, 0);
}

@end