@interface MailMailboxChangeSet
- (BOOL)allowOtherChange:(id)a3;
- (BOOL)commit;
- (BOOL)revert;
- (MailMailboxChangeSet)initWithOperation:(id)a3;
- (id)accounts;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)description;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)mailboxParentForMove;
- (id)mailboxToMoveOrRename;
- (id)mailboxToRemove;
- (id)modifiedMailboxName;
- (id)stores;
@end

@implementation MailMailboxChangeSet

- (MailMailboxChangeSet)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MailMailboxChangeSet;
  v6 = [(MailMailboxChangeSet *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mailboxOperation, a3);
    *((unsigned char *)&v7->super + 16) |= 1u;
  }

  return v7;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  return 0;
}

- (BOOL)commit
{
  if (![(MCSChange *)self isFinalized]) {
    sub_10045A794();
  }
  BOOL v3 = [(MCSMailboxOperation *)self->_mailboxOperation commit];
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#ChangeSetActions Committed %@ with result %d", (uint8_t *)&v6, 0x12u);
  }

  if (!v3) {
    [(MailMailboxChangeSet *)self revert];
  }
  return v3;
}

- (BOOL)revert
{
  if (![(MCSChange *)self isFinalized]) {
    sub_10045A7C0();
  }
  mailboxOperation = self->_mailboxOperation;

  return [(MCSMailboxOperation *)mailboxOperation revert];
}

- (id)localizedErrorDescription
{
  return [(MCSMailboxOperation *)self->_mailboxOperation localizedErrorDescription];
}

- (id)localizedErrorTitle
{
  return [(MCSMailboxOperation *)self->_mailboxOperation localizedErrorTitle];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MailMailboxChangeSet;
  BOOL v3 = [(MailMailboxChangeSet *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@ %@", v3, self->_mailboxOperation];

  return v4;
}

- (id)modifiedMailboxName
{
  return [(MCSMailboxOperation *)self->_mailboxOperation modifiedMailboxName];
}

- (id)mailboxToRemove
{
  return [(MCSMailboxOperation *)self->_mailboxOperation mailboxToRemove];
}

- (id)mailboxToMoveOrRename
{
  return [(MCSMailboxOperation *)self->_mailboxOperation mailboxToMoveOrRename];
}

- (id)mailboxParentForMove
{
  return [(MCSMailboxOperation *)self->_mailboxOperation mailboxParentForMove];
}

- (id)accounts
{
  BOOL v3 = +[NSMutableSet set];
  v4 = [(MCSMailboxOperation *)self->_mailboxOperation accountForErrorHandling];
  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (id)stores
{
  return 0;
}

- (BOOL)allowOtherChange:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((v4 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(MCSMailboxOperation *)self->_mailboxOperation allowOtherMailboxOperation:v4[3]];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end