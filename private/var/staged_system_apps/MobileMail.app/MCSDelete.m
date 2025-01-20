@interface MCSDelete
- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5;
- (BOOL)isFinalized;
- (BOOL)willFlag;
- (BOOL)willMarkRead;
- (BOOL)willMarkUnread;
- (BOOL)willUnflag;
- (MCSDelete)init;
- (MCSDelete)initWithDeleteInPlace:(BOOL)a3;
- (MCSDelete)initWithStore:(id)a3;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3;
- (id)localizedErrorTitleForMessageCount:(unint64_t)a3;
- (id)localizedShortOperationDescription;
@end

@implementation MCSDelete

- (MCSDelete)init
{
}

- (MCSDelete)initWithStore:(id)a3
{
  id v4 = a3;
  v5 = -[MCSDelete initWithDeleteInPlace:](self, "initWithDeleteInPlace:", [v4 shouldDeleteInPlace]);

  return v5;
}

- (MCSDelete)initWithDeleteInPlace:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MCSDelete;
  id v4 = [(MCSDelete *)&v11 init];
  if (v4)
  {
    if (a3)
    {
      v5 = [MCSFlagChange alloc];
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsDeleted, MessageIsRead, 0);
      v7 = [(MCSFlagChange *)v5 initWithFlagsToSet:v6 flagsToClear:0 reason:4];

      [(MCSFlagChange *)v7 setIsDeletion:1];
      operation = v4->_operation;
      v4->_operation = &v7->super;
    }
    else
    {
      v9 = [[MCSTransfer alloc] initWithSpecialDestination:3 markAsRead:1 deleteIfSame:1];
      [(MCSTransfer *)v9 setIsDeletion:1];
      operation = v4->_operation;
      v4->_operation = &v9->super;
    }
  }
  return v4;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  v3 = [(MCSOperation *)self->_operation applyPendingChangeToObjects:a3];

  return v3;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[MFActivityMonitor currentMonitor];
  [v11 addReason:MonitoredActivityReasonDeleting];

  LOBYTE(self) = [(MCSMessageOperation *)self->_operation commitToMessages:v8 failures:v9 newMessages:v10];
  return (char)self;
}

- (BOOL)willMarkRead
{
  return [(MCSMessageOperation *)self->_operation willMarkRead];
}

- (BOOL)willMarkUnread
{
  return [(MCSMessageOperation *)self->_operation willMarkUnread];
}

- (BOOL)willUnflag
{
  return [(MCSMessageOperation *)self->_operation willUnflag];
}

- (BOOL)willFlag
{
  return [(MCSMessageOperation *)self->_operation willFlag];
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return [(MCSMessageOperation *)self->_operation localizedErrorDescriptionForMessageCount:a3];
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return [(MCSMessageOperation *)self->_operation localizedErrorTitleForMessageCount:a3];
}

- (id)localizedShortOperationDescription
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"OPERATION_DELETE_DESC" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (BOOL)isFinalized
{
  return *((unsigned char *)&self->super.super + 8) & 1;
}

- (void).cxx_destruct
{
}

@end